#!/usr/bin/env python3
"""
Preprocess combined Mutopia files for lilyBERT pretraining.

This script takes the combined Mutopia files and preprocesses them
into Italian notation for use with BPE tokenizer training.

NOTE: Files are NOT split by movement. For pretraining (MLM), longer
sequences provide more context, making them preferable. Movement splitting
is beneficial for classification tasks but not for pretraining.

Parallelization: Uses ProcessPoolExecutor to process multiple files in parallel
for improved performance on multi-core systems.
"""

import json
import sys
from pathlib import Path
from typing import List, Dict, Any, Tuple, Optional
import argparse
from tqdm import tqdm
from concurrent.futures import ProcessPoolExecutor
import os

from lilybert.data.preprocessor import LilyPondPreprocessor, AugmentationConfig
from lilybert.data.tokenizer import LilyPondTokenizer


def preprocess_single_file(
    file_path: str,
    output_dir: str,
    include_augmentation: bool = False,
) -> Tuple[str, Optional[str], int, Optional[str]]:
    """Preprocess a single file (worker function for multiprocessing).

    Args:
        file_path: Path to .ly file to preprocess
        output_dir: Output directory for preprocessed JSON
        include_augmentation: Whether to use augmentation

    Returns:
        (file_path, italian_text or None, movements_count, error_message or None)
    """
    try:
        # Setup augmentation config
        aug_config = None
        if include_augmentation:
            aug_config = AugmentationConfig(
                languages=["italiano", "english", "nederlands"],
                enable_transposition=True,
                enable_absolute_relative=True,
                enable_articulation_variants=True,
                enable_barline_variants=True,
                include_original=True,
            )

        # Create preprocessor instance (each process gets its own)
        preprocessor = LilyPondPreprocessor(augmentation_config=aug_config)

        # Preprocess file
        result = preprocessor.preprocess_file(file_path)

        # Save individual preprocessed file
        output_path = Path(output_dir) / f"{Path(file_path).stem}_preprocessed.json"
        output_path.write_text(
            json.dumps(result, ensure_ascii=False, indent=2),
            encoding="utf-8"
        )

        # Extract Italian text for corpus
        italian_text = result.get("text", "")
        movements_count = len(result.get("movements", []))

        if italian_text.strip():
            return file_path, italian_text, movements_count, None
        else:
            return file_path, None, movements_count, "No Italian text extracted"

    except Exception as e:
        return file_path, None, 0, str(e)


def preprocess_mutopia_files(
    input_dir: Path,
    output_dir: Path,
    max_files: int | None = None,
    include_augmentation: bool = False,
    skip_on_error: bool = True,
    num_workers: int | None = None,
) -> Dict[str, Any]:
    """Preprocess Mutopia files for pretraining using multiprocessing.

    Files are NOT split by movement. For pretraining, longer sequences
    provide better context for the transformer model. If a file fails
    to preprocess, it is skipped by default.

    Args:
        input_dir: Directory containing combined .ly files
        output_dir: Output directory for preprocessed files
        max_files: Maximum files to process (for testing)
        include_augmentation: Whether to use augmentation
        skip_on_error: Skip files that fail to preprocess (default: True)
        num_workers: Number of parallel workers (default: CPU count)

    Returns:
        Dictionary with statistics
    """
    output_dir.mkdir(parents=True, exist_ok=True)

    # Find all .ly files
    ly_files = sorted(input_dir.glob("*.ly"))

    if max_files:
        ly_files = ly_files[:max_files]

    stats = {
        "total_files": len(ly_files),
        "successful": 0,
        "failed": 0,
        "total_movements": 0,
        "corpus_lines": 0,
        "errors": [],
        "corpus_file": str(output_dir / "corpus.txt"),
        "num_workers": num_workers or os.cpu_count() or 1,
    }

    if len(ly_files) == 0:
        return stats

    corpus_lines: List[str] = []

    # Use ProcessPoolExecutor for parallel processing
    num_workers = num_workers or os.cpu_count() or 1

    with ProcessPoolExecutor(max_workers=num_workers) as executor:
        # Submit all tasks
        futures = [
            executor.submit(
                preprocess_single_file,
                str(file_path),
                str(output_dir),
                include_augmentation,
            )
            for file_path in ly_files
        ]

        # Process results with progress bar
        for future in tqdm(futures, desc="Preprocessing Mutopia files", total=len(ly_files)):
            try:
                file_path, italian_text, movements_count, error = future.result()

                if error:
                    stats["failed"] += 1
                    stats["errors"].append({
                        "file": file_path,
                        "error": error
                    })

                    if not skip_on_error:
                        raise Exception(f"Preprocessing failed for {file_path}: {error}")
                else:
                    if italian_text:
                        corpus_lines.append(italian_text)

                    stats["total_movements"] += movements_count
                    stats["successful"] += 1

            except Exception as e:
                stats["failed"] += 1
                stats["errors"].append({
                    "file": "unknown",
                    "error": str(e)
                })

                if not skip_on_error:
                    raise

    # Save corpus file for tokenizer training
    corpus_path = output_dir / "corpus.txt"
    corpus_path.write_text("\n\n".join(corpus_lines), encoding="utf-8")
    stats["corpus_lines"] = len(corpus_lines)

    return stats


def create_pretraining_corpus(
    preprocessed_dir: Path,
    output_file: Path,
) -> int:
    """Create corpus from preprocessed JSON files.

    Args:
        preprocessed_dir: Directory with preprocessed JSON files
        output_file: Output corpus file

    Returns:
        Number of lines in corpus
    """
    corpus_lines: List[str] = []

    for json_file in preprocessed_dir.glob("*_preprocessed.json"):
        try:
            data = json.loads(json_file.read_text(encoding="utf-8"))

            # Add preprocessed text
            if "text" in data and data["text"].strip():
                corpus_lines.append(data["text"])

        except Exception as e:
            print(f"Warning: Error reading {json_file}: {e}")

    # Save corpus
    output_file.write_text("\n\n".join(corpus_lines), encoding="utf-8")

    return len(corpus_lines)


def main():
    parser = argparse.ArgumentParser(
        description="Preprocess combined Mutopia files for lilyBERT pretraining"
    )
    parser.add_argument(
        "--input-dir",
        default="./data/mutopia",
        help="Directory containing combined .ly files"
    )
    parser.add_argument(
        "--output-dir",
        default="./data/mutopia_preprocessed",
        help="Output directory for preprocessed files"
    )
    parser.add_argument(
        "--max-files",
        type=int,
        default=None,
        help="Maximum number of files to process (for testing)"
    )
    parser.add_argument(
        "--train-tokenizer",
        action="store_true",
        help="Train BPE tokenizer on preprocessed corpus"
    )
    parser.add_argument(
        "--vocab-size",
        type=int,
        default=10000,
        help="BPE vocabulary size"
    )
    parser.add_argument(
        "--tokenizer-output",
        default="./artifacts/mutopia_tokenizer",
        help="Directory to save trained tokenizer"
    )
    parser.add_argument(
        "--skip-on-error",
        action="store_true",
        default=True,
        help="Skip files that fail to preprocess (default: True)"
    )
    parser.add_argument(
        "--fail-on-error",
        action="store_false",
        dest="skip_on_error",
        help="Stop on first preprocessing error"
    )
    parser.add_argument(
        "--num-workers",
        type=int,
        default=None,
        help="Number of parallel workers (default: CPU count)"
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Print detailed progress information"
    )

    args = parser.parse_args()

    input_dir = Path(args.input_dir)
    output_dir = Path(args.output_dir)

    # Validate input directory
    if not input_dir.exists():
        print(f"Error: Input directory not found: {input_dir}")
        sys.exit(1)

    print(f"Input dir: {input_dir.resolve()}")
    print(f"Output dir: {output_dir.resolve()}")

    if args.max_files:
        print(f"Processing max {args.max_files} files")

    # Step 1: Preprocess files
    print("\n" + "="*60)
    print("STEP 1: PREPROCESSING MUTOPIA FILES")
    print("="*60)
    print(f"\nNote: Files are NOT split by movement. For pretraining (MLM),")
    print(f"longer sequences provide better transformer context.")

    stats = preprocess_mutopia_files(
        input_dir,
        output_dir,
        max_files=args.max_files,
        include_augmentation=True,
        skip_on_error=args.skip_on_error,
        num_workers=args.num_workers,
    )

    print(f"\nFiles processed: {stats['successful']}")
    print(f"Failed: {stats['failed']}")
    print(f"Total movements found: {stats['total_movements']}")
    print(f"Corpus lines (full files): {stats['corpus_lines']}")
    print(f"Workers used: {stats['num_workers']}")

    if stats['errors']:
        error_count = len(stats['errors'])
        show_count = 10 if args.verbose else 5
        print(f"\nErrors ({error_count} total):")
        for error in stats['errors'][:show_count]:
            file_display = error['file'].split('/')[-1] if error['file'] else 'unknown'
            print(f"  - {file_display}: {error['error'][:60]}")
        if error_count > show_count:
            print(f"  ... and {error_count - show_count} more errors")

    # Step 2: Optionally train tokenizer
    if args.train_tokenizer:
        print("\n" + "="*60)
        print("STEP 2: TRAINING BPE TOKENIZER")
        print("="*60)

        # Read corpus
        corpus_file = output_dir / "corpus.txt"
        if not corpus_file.exists():
            print(f"Error: Corpus file not found: {corpus_file}")
            sys.exit(1)

        corpus_text = corpus_file.read_text(encoding="utf-8")
        corpus_lines = [line.strip() for line in corpus_text.split('\n\n') if line.strip()]

        print(f"Corpus lines: {len(corpus_lines)}")
        print(f"Training tokenizer with vocab_size={args.vocab_size}...")

        # Train tokenizer
        tokenizer = LilyPondTokenizer()
        trained_tok = tokenizer.train(corpus_lines, vocab_size=args.vocab_size)

        # Save tokenizer
        tokenizer_dir = Path(args.tokenizer_output)
        trained_tok.save_pretrained(str(tokenizer_dir))

        print(f"Tokenizer saved to: {tokenizer_dir.resolve()}")

        # Get vocab size
        try:
            vocab_size = trained_tok.vocab_size
        except Exception:
            vocab_size = len(trained_tok.get_vocab())

        print(f"Vocab size: {vocab_size}")

    print("\n" + "="*60)
    print("PREPROCESSING COMPLETE")
    print("="*60)
    print(f"Preprocessed files saved to: {output_dir.resolve()}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
