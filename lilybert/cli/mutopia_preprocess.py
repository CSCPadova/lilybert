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

import os
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path
from typing import Any, Dict, List, Optional

import typer
from typing_extensions import Annotated

from tqdm import tqdm

from lilybert.data.preprocessor import AugmentationConfig, LilyPondPreprocessor
from lilybert.data.tokenizer import LilyPondTokenizer


def preprocess_single_file(
    file_path: str,
    output_dir: str,
    aug_config: Optional[AugmentationConfig] = None,
) -> Dict[str, Any]:
    """Preprocess a single file and save augmented variants as separate .ly files.

    Each variant is saved under a language subdirectory, e.g.:
        output_dir/italiano/stem_mvt1.ly
        output_dir/english/stem_mvt1__absolute.ly

    Args:
        file_path: Path to .ly file to preprocess
        output_dir: Output directory for preprocessed files
        aug_config: Augmentation configuration (default: no augmentation)

    Returns:
        Dict with keys: file_path, variants_written, movements_count, error
    """
    try:
        if aug_config is None:
            aug_config = AugmentationConfig()

        preprocessor = LilyPondPreprocessor(augmentation_config=aug_config)

        # Parse file into movements
        path = Path(file_path)
        raw_text = path.read_text(encoding="utf-8", errors="ignore")
        movements = preprocessor.process_content(raw_text, path.name, {})

        if not movements:
            return {
                "file_path": file_path,
                "variants_written": 0,
                "movements_count": 0,
                "error": "No movements extracted",
            }

        out_root = Path(output_dir)
        variants_written = 0

        for movement in movements:
            variants = preprocessor._build_augmented_variants(movement, aug_config)
            for variant in variants:
                language = variant["language"]
                variant_id = variant["variant_id"]
                movement_id = movement["movement_id"]

                lang_dir = out_root / language
                lang_dir.mkdir(parents=True, exist_ok=True)

                if variant_id == "base":
                    file_name = f"{movement_id}.ly"
                else:
                    file_name = f"{movement_id}__{variant_id}.ly"

                (lang_dir / file_name).write_text(variant["text"], encoding="utf-8")
                variants_written += 1

        return {
            "file_path": file_path,
            "variants_written": variants_written,
            "movements_count": len(movements),
            "error": None,
        }

    except Exception as e:
        return {
            "file_path": file_path,
            "variants_written": 0,
            "movements_count": 0,
            "error": str(e),
        }


def preprocess_mutopia_files(
    input_dir: Path,
    output_dir: Path,
    max_files: int | None = None,
    aug_config: AugmentationConfig | None = None,
    skip_on_error: bool = True,
    num_workers: int | None = None,
) -> Dict[str, Any]:
    """Preprocess Mutopia files for pretraining using multiprocessing.

    Each input file produces augmented variants saved as separate .ly files
    under language subdirectories (e.g. output_dir/italiano/, output_dir/english/).

    Args:
        input_dir: Directory containing combined .ly files
        output_dir: Output directory for preprocessed files
        max_files: Maximum files to process (for testing)
        aug_config: Augmentation configuration (default: no augmentation)
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

    stats: Dict[str, Any] = {
        "total_files": len(ly_files),
        "successful": 0,
        "failed": 0,
        "total_movements": 0,
        "total_variants": 0,
        "errors": [],
        "num_workers": num_workers or os.cpu_count() or 1,
    }

    if len(ly_files) == 0:
        return stats

    # Use ProcessPoolExecutor for parallel processing
    num_workers = num_workers or os.cpu_count() or 1

    with ProcessPoolExecutor(max_workers=num_workers) as executor:
        # Submit all tasks
        futures = [
            executor.submit(
                preprocess_single_file,
                str(file_path),
                str(output_dir),
                aug_config,
            )
            for file_path in ly_files
        ]

        # Process results with progress bar
        for future in tqdm(
            futures, desc="Preprocessing Mutopia files", total=len(ly_files)
        ):
            try:
                result = future.result()

                if result["error"]:
                    stats["failed"] += 1
                    stats["errors"].append(
                        {
                            "file": result["file_path"],
                            "error": result["error"],
                        }
                    )

                    if not skip_on_error:
                        raise Exception(
                            f"Preprocessing failed for {result['file_path']}: {result['error']}"
                        )
                else:
                    stats["total_movements"] += result["movements_count"]
                    stats["total_variants"] += result["variants_written"]
                    stats["successful"] += 1

            except Exception as e:
                stats["failed"] += 1
                stats["errors"].append(
                    {
                        "file": "unknown",
                        "error": str(e),
                    }
                )

                if not skip_on_error:
                    raise

    return stats


def create_pretraining_corpus(
    preprocessed_dir: Path,
    output_file: Path,
) -> int:
    """Create corpus from augmented .ly files across all language subdirectories.

    Args:
        preprocessed_dir: Directory with language subdirectories containing .ly files
        output_file: Output corpus file

    Returns:
        Number of files included in corpus
    """
    ly_files = sorted(preprocessed_dir.rglob("*.ly"))
    print(f"  Found {len(ly_files)} .ly files to include in corpus...")
    corpus_lines: List[str] = []

    for ly_file in tqdm(ly_files, desc="Building corpus"):
        try:
            text = ly_file.read_text(encoding="utf-8").strip()
            if text:
                corpus_lines.append(text)
        except Exception as e:
            print(f"Warning: Error reading {ly_file}: {e}")

    output_file.write_text("\n\n".join(corpus_lines), encoding="utf-8")

    return len(corpus_lines)


def main(
    input_dir: Annotated[
        str, typer.Option(help="Directory containing combined .ly files")
    ] = "./data/mutopia",
    output_dir: Annotated[
        str, typer.Option(help="Output directory for preprocessed files")
    ] = "./data/mutopia_preprocessed",
    max_files: Annotated[
        Optional[int],
        typer.Option(help="Maximum number of files to process (for testing)"),
    ] = None,
    train_tokenizer: Annotated[
        bool, typer.Option(help="Train BPE tokenizer on preprocessed corpus")
    ] = False,
    vocab_size: Annotated[int, typer.Option(help="BPE vocabulary size")] = 10000,
    tokenizer_output: Annotated[
        str, typer.Option(help="Directory to save trained tokenizer")
    ] = "./artifacts/mutopia_tokenizer",
    skip_on_error: Annotated[
        bool,
        typer.Option(
            "--skip-on-error/--fail-on-error",
            help="Skip files that fail to preprocess",
        ),
    ] = True,
    num_workers: Annotated[
        Optional[int],
        typer.Option(help="Number of parallel workers (default: CPU count)"),
    ] = None,
    skip_preprocess: Annotated[
        bool,
        typer.Option(
            help="Skip preprocessing step and only train tokenizer on existing preprocessed files"
        ),
    ] = False,
    verbose: Annotated[
        bool, typer.Option(help="Print detailed progress information")
    ] = False,
    # ── Augmentation flags ──────────────────────────────────────────
    languages: Annotated[
        str,
        typer.Option(
            help="Comma-separated LilyPond languages for augmentation"
        ),
    ] = "italiano,english,nederlands",
    enable_transposition: Annotated[
        bool, typer.Option(help="Enable transposition augmentation")
    ] = False,
    enable_absolute_relative: Annotated[
        bool, typer.Option(help="Enable absolute/relative pitch conversion")
    ] = False,
    enable_articulation_variants: Annotated[
        bool, typer.Option(help="Enable short/expanded articulation variants")
    ] = False,
    enable_barline_variants: Annotated[
        bool, typer.Option(help="Enable add/remove barline variants")
    ] = False,
    enable_retrograde: Annotated[
        bool, typer.Option(help="Enable retrograde pitch augmentation")
    ] = False,
    enable_inversion: Annotated[
        bool, typer.Option(help="Enable pitch inversion augmentation")
    ] = False,
) -> None:
    input_path = Path(input_dir)
    output_path = Path(output_dir)

    if not input_path.exists():
        print(f"Error: Input directory not found: {input_path}")
        raise typer.Exit(code=1)

    print(f"Input dir: {input_path.resolve()}")
    print(f"Output dir: {output_path.resolve()}")

    if max_files:
        print(f"Processing max {max_files} files")

    # Build augmentation config from CLI flags
    lang_list = [l.strip() for l in languages.split(",") if l.strip()]
    aug_config = AugmentationConfig(
        languages=lang_list,
        enable_transposition=enable_transposition,
        enable_absolute_relative=enable_absolute_relative,
        enable_articulation_variants=enable_articulation_variants,
        enable_barline_variants=enable_barline_variants,
        enable_retrograde=enable_retrograde,
        enable_inversion=enable_inversion,
        include_original=True,
    )

    any_aug = (
        enable_transposition
        or enable_absolute_relative
        or enable_articulation_variants
        or enable_barline_variants
        or enable_retrograde
        or enable_inversion
    )
    print(f"Languages: {lang_list}")
    if any_aug:
        enabled = [
            name
            for name, flag in [
                ("transposition", enable_transposition),
                ("absolute_relative", enable_absolute_relative),
                ("articulation_variants", enable_articulation_variants),
                ("barline_variants", enable_barline_variants),
                ("retrograde", enable_retrograde),
                ("inversion", enable_inversion),
            ]
            if flag
        ]
        print(f"Augmentations: {', '.join(enabled)}")
    else:
        print("Augmentations: none (language variants only)")

    # Step 1: Preprocess files
    if not skip_preprocess:
        print("\n" + "=" * 60)
        print("STEP 1: PREPROCESSING MUTOPIA FILES")
        print("=" * 60)
        print("\nNote: Files are NOT split by movement. For pretraining (MLM),")
        print("longer sequences provide better transformer context.")

        stats = preprocess_mutopia_files(
            input_path,
            output_path,
            max_files=max_files,
            aug_config=aug_config,
            skip_on_error=skip_on_error,
            num_workers=num_workers,
        )

        print(f"\nFiles processed: {stats['successful']}")
        print(f"Failed: {stats['failed']}")
        print(f"Total movements found: {stats['total_movements']}")
        print(f"Total variants written: {stats['total_variants']}")
        print(f"Workers used: {stats['num_workers']}")

        if stats["errors"]:
            error_count = len(stats["errors"])
            show_count = 10 if verbose else 5
            print(f"\nErrors ({error_count} total):")
            for error in stats["errors"][:show_count]:
                file_display = (
                    error["file"].split("/")[-1] if error["file"] else "unknown"
                )
                print(f"  - {file_display}: {error['error'][:60]}")
            if error_count > show_count:
                print(f"  ... and {error_count - show_count} more errors")

    # Step 2: Optionally train tokenizer
    if train_tokenizer:
        print("\n" + "=" * 60)
        print("STEP 2: BUILDING CORPUS & TRAINING BPE TOKENIZER")
        print("=" * 60)

        print("Building parser-tokenized corpus...")
        tokenizer = LilyPondTokenizer()
        corpus_lines = tokenizer.build_corpus(output_path)

        if not corpus_lines:
            print("Error: Corpus is empty — no .ly files could be tokenized.")
            print("Check that Step 1 produced preprocessed files.")
            raise typer.Exit(code=1)

        print(f"Corpus lines: {len(corpus_lines)}")
        print(f"Training tokenizer with vocab_size={vocab_size}...")

        trained_tok = tokenizer.train(corpus_lines, vocab_size=vocab_size)

        tokenizer_dir = Path(tokenizer_output)
        trained_tok.save_pretrained(str(tokenizer_dir))

        print(f"Tokenizer saved to: {tokenizer_dir.resolve()}")

        try:
            final_vocab_size = trained_tok.vocab_size
        except Exception:
            final_vocab_size = len(trained_tok.get_vocab())

        print(f"Vocab size: {final_vocab_size}")

    print("\n" + "=" * 60)
    print("PREPROCESSING COMPLETE")
    print("=" * 60)
    print(f"Preprocessed files saved to: {output_path.resolve()}")
