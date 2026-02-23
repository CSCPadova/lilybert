"""Pre-tokenize LilyPond files into cached .npz for fast training.

Supports two modes:

* **classification** (default): tokenize movement files into windowed
  samples with labels, optionally sharded across multiple ``.npz`` files.
* **mlm**: tokenize raw ``.ly`` files for masked-language-model pretraining
  (no labels), always sharded.
"""

from __future__ import annotations

import argparse
import json
import random
from pathlib import Path
from typing import List, Sequence

import numpy as np
from transformers import PreTrainedTokenizerFast

from lilybert.data import BaroqueMusicClassificationDataset
from lilybert.data.sharding import ShardWriter


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Pre-tokenize movement files for fast training"
    )
    parser.add_argument(
        "--stage",
        choices=["classification", "mlm"],
        default="classification",
        help="Pretokenization stage (default: classification)",
    )
    parser.add_argument("--task", default="composer")
    parser.add_argument("--data-dir", default="data/processed")
    parser.add_argument("--tokenizer-path", default="artifacts/tokenizer")
    parser.add_argument("--output-dir", default="artifacts/pretokenized")
    parser.add_argument("--max-length", type=int, default=512)
    parser.add_argument("--stride", type=int, default=256)
    parser.add_argument("--language", default="english")
    parser.add_argument(
        "--languages",
        default=None,
        help="Comma-separated list of languages (MLM stage only, default: same as --language)",
    )
    parser.add_argument(
        "--shard-size",
        type=int,
        default=0,
        help="Samples per shard. 0 = single-file legacy mode (default: 0)",
    )
    parser.add_argument(
        "--include-structure-markers",
        action="store_true",
        help="Persist structure_markers from movement metadata in pretokenized cache metadata",
    )
    parser.add_argument(
        "--eval-ratio",
        type=float,
        default=0.01,
        help="Fraction of data for eval split (MLM stage only, default: 0.01)",
    )
    parser.add_argument("--seed", type=int, default=42)
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)

    if args.stage == "mlm":
        _pretokenize_mlm(args)
    else:
        if args.shard_size > 0:
            _pretokenize_classification_sharded(args)
        else:
            _pretokenize_classification_legacy(args)


# ------------------------------------------------------------------
# Classification – sharded mode
# ------------------------------------------------------------------


def _pretokenize_classification_sharded(args: argparse.Namespace) -> None:
    data_dir = Path(args.data_dir)
    metadata_path = data_dir / "metadata.json"
    if not metadata_path.exists():
        raise FileNotFoundError(f"metadata.json not found in {data_dir}")
    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))

    language_dir = data_dir / args.language
    if not language_dir.exists():
        raise FileNotFoundError(f"Language directory not found: {language_dir}")
    movement_files = sorted(str(p) for p in language_dir.glob("*.ly"))
    if not movement_files:
        raise FileNotFoundError(f"No .ly files found in {language_dir}")

    tokenizer = PreTrainedTokenizerFast.from_pretrained(args.tokenizer_path)
    print(
        f"Building dataset for task={args.task}, "
        f"{len(movement_files)} files, "
        f"max_length={args.max_length}, stride={args.stride}"
    )
    dataset = BaroqueMusicClassificationDataset(
        movement_files=movement_files,
        metadata=metadata,
        tokenizer=tokenizer,
        max_length=args.max_length,
        stride=args.stride,
        task=args.task,
        include_structure_markers=args.include_structure_markers,
    )

    n = len(dataset)
    if n == 0:
        print("No samples produced. Check metadata and task labels.")
        return
    print(f"Produced {n} windowed samples")

    sample0 = dataset[0]
    is_multi_label = (
        sample0["label"].dim() > 0 if hasattr(sample0["label"], "dim") else False
    )
    num_classes = sample0["label"].shape[0] if is_multi_label else 0

    output_dir = Path(args.output_dir) / args.task
    writer = ShardWriter(
        output_dir=output_dir,
        shard_size=args.shard_size,
        max_length=args.max_length,
        multi_label=is_multi_label,
        num_classes=num_classes,
        has_labels=True,
    )

    for i in range(n):
        sample = dataset[i]
        label_np = (
            sample["label"].numpy()
            if hasattr(sample["label"], "numpy")
            else np.array(sample["label"])
        )
        writer.add_sample(
            input_ids=sample["input_ids"].numpy(),
            attention_mask=sample["attention_mask"].numpy(),
            label=label_np,
            movement_id=sample["movement_id"],
            base_work=sample["base_work"],
            structure_markers=sample.get("structure_markers"),
        )

    manifest = writer.finalize(
        label_to_index=dataset.label_to_index,
        config={
            "task": args.task,
            "max_length": args.max_length,
            "stride": args.stride,
            "tokenizer_path": args.tokenizer_path,
            "language": args.language,
            "data_dir": args.data_dir,
            "shard_size": args.shard_size,
            "include_structure_markers": args.include_structure_markers,
        },
    )
    print(
        f"Done: {manifest.total_samples} samples across "
        f"{len(manifest.shards)} shards in {output_dir}"
    )


# ------------------------------------------------------------------
# Classification – legacy single-file mode
# ------------------------------------------------------------------


def _pretokenize_classification_legacy(args: argparse.Namespace) -> None:
    """Original single-file pretokenization (backward compatible)."""
    data_dir = Path(args.data_dir)
    metadata_path = data_dir / "metadata.json"
    if not metadata_path.exists():
        raise FileNotFoundError(f"metadata.json not found in {data_dir}")
    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))

    language_dir = data_dir / args.language
    if not language_dir.exists():
        raise FileNotFoundError(f"Language directory not found: {language_dir}")
    movement_files = sorted(str(p) for p in language_dir.glob("*.ly"))
    if not movement_files:
        raise FileNotFoundError(f"No .ly files found in {language_dir}")

    print(f"Loading tokenizer from {args.tokenizer_path}")
    tokenizer = PreTrainedTokenizerFast.from_pretrained(args.tokenizer_path)

    print(
        f"Building dataset for task={args.task}, "
        f"{len(movement_files)} files, "
        f"max_length={args.max_length}, stride={args.stride}"
    )
    dataset = BaroqueMusicClassificationDataset(
        movement_files=movement_files,
        metadata=metadata,
        tokenizer=tokenizer,
        max_length=args.max_length,
        stride=args.stride,
        task=args.task,
        include_structure_markers=args.include_structure_markers,
    )

    n = len(dataset)
    if n == 0:
        print("No samples produced. Check metadata and task labels.")
        return

    print(f"Produced {n} windowed samples")

    input_ids = np.empty((n, args.max_length), dtype=np.int32)
    attention_mask = np.empty((n, args.max_length), dtype=np.int8)
    movement_ids = []
    base_works = []
    structure_markers = [] if args.include_structure_markers else None

    sample0 = dataset[0]
    is_multi_label = (
        sample0["label"].dim() > 0 if hasattr(sample0["label"], "dim") else False
    )
    if is_multi_label:
        num_classes = sample0["label"].shape[0]
        labels = np.empty((n, num_classes), dtype=np.float32)
    else:
        labels = np.empty(n, dtype=np.int64)

    for i in range(n):
        sample = dataset[i]
        input_ids[i] = sample["input_ids"].numpy()
        attention_mask[i] = sample["attention_mask"].numpy()
        labels[i] = (
            sample["label"].numpy()
            if hasattr(sample["label"], "numpy")
            else sample["label"]
        )
        movement_ids.append(sample["movement_id"])
        base_works.append(sample["base_work"])
        if args.include_structure_markers:
            structure_markers.append(sample.get("structure_markers", []))

    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    npz_path = output_dir / f"{args.task}.npz"
    np.savez(
        npz_path,
        input_ids=input_ids,
        attention_mask=attention_mask,
        labels=labels,
    )
    print(f"Saved arrays to {npz_path}")

    meta = {
        "label_to_index": dataset.label_to_index,
        "movement_ids": movement_ids,
        "base_works": base_works,
        "config": {
            "task": args.task,
            "max_length": args.max_length,
            "stride": args.stride,
            "tokenizer_path": args.tokenizer_path,
            "language": args.language,
            "data_dir": args.data_dir,
            "include_structure_markers": args.include_structure_markers,
        },
    }
    if args.include_structure_markers:
        meta["structure_markers"] = structure_markers
    meta_path = output_dir / f"{args.task}_meta.json"
    meta_path.write_text(
        json.dumps(meta, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    print(f"Saved metadata to {meta_path}")
    print(f"Done: {n} samples, {len(dataset.label_to_index)} classes")


# ------------------------------------------------------------------
# MLM pretokenization
# ------------------------------------------------------------------


def _collect_ly_files(data_dir: Path, languages: List[str]) -> List[Path]:
    """Collect .ly files from language subdirectories."""
    files: List[Path] = []
    for lang in languages:
        lang_dir = data_dir / lang
        if not lang_dir.exists():
            continue
        files.extend(sorted(lang_dir.glob("*.ly")))
    return files


def _pretokenize_mlm(args: argparse.Namespace) -> None:
    languages = (
        args.languages.split(",") if args.languages else [args.language]
    )
    data_dir = Path(args.data_dir)
    all_files = _collect_ly_files(data_dir, languages)
    if not all_files:
        raise FileNotFoundError(
            f"No .ly files found in {data_dir} for languages {languages}"
        )

    print(f"Loading tokenizer from {args.tokenizer_path}")
    tokenizer = PreTrainedTokenizerFast.from_pretrained(args.tokenizer_path)

    # Shuffle and split into train / eval
    rng = random.Random(args.seed)
    shuffled = list(all_files)
    rng.shuffle(shuffled)
    split_idx = max(1, int(len(shuffled) * (1 - args.eval_ratio)))
    train_files = shuffled[:split_idx]
    eval_files = shuffled[split_idx:]

    shard_size = args.shard_size if args.shard_size > 0 else 8192

    for split_name, files in [("train", train_files), ("eval", eval_files)]:
        print(
            f"Pretokenizing {split_name} split: {len(files)} files, "
            f"shard_size={shard_size}"
        )
        split_dir = Path(args.output_dir) / "mlm" / split_name
        writer = ShardWriter(
            output_dir=split_dir,
            shard_size=shard_size,
            max_length=args.max_length,
            has_labels=False,
        )

        for file_path in files:
            text = file_path.read_text(encoding="utf-8", errors="ignore")
            encoded = tokenizer(
                text,
                truncation=True,
                max_length=args.max_length,
                padding="max_length",
                return_tensors="np",
            )
            writer.add_sample(
                input_ids=encoded["input_ids"].squeeze(0),
                attention_mask=encoded["attention_mask"].squeeze(0),
                movement_id=file_path.stem,
                base_work="",
            )

        manifest = writer.finalize(
            config={
                "stage": "mlm",
                "max_length": args.max_length,
                "tokenizer_path": args.tokenizer_path,
                "languages": languages,
                "split": split_name,
                "shard_size": shard_size,
                "seed": args.seed,
                "eval_ratio": args.eval_ratio,
            },
        )
        print(
            f"  {split_name}: {manifest.total_samples} samples across "
            f"{len(manifest.shards)} shards in {split_dir}"
        )

    print("MLM pretokenization complete.")
