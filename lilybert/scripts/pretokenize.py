"""Pre-tokenize LilyPond files into cached .npz for fast training."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Sequence

import numpy as np
from transformers import PreTrainedTokenizerFast

from lilybert.data import BaroqueMusicClassificationDataset


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Pre-tokenize movement files for fast training"
    )
    parser.add_argument("--task", default="composer")
    parser.add_argument("--data-dir", default="data/processed")
    parser.add_argument("--tokenizer-path", default="artifacts/tokenizer")
    parser.add_argument("--output-dir", default="artifacts/pretokenized")
    parser.add_argument("--max-length", type=int, default=512)
    parser.add_argument("--stride", type=int, default=256)
    parser.add_argument("--language", default="english")
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)

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

    sample0 = dataset[0]
    is_multi_label = sample0["label"].dim() > 0 if hasattr(sample0["label"], "dim") else False
    if is_multi_label:
        num_classes = sample0["label"].shape[0]
        labels = np.empty((n, num_classes), dtype=np.float32)
    else:
        labels = np.empty(n, dtype=np.int64)

    for i in range(n):
        sample = dataset[i]
        input_ids[i] = sample["input_ids"].numpy()
        attention_mask[i] = sample["attention_mask"].numpy()
        labels[i] = sample["label"].numpy() if hasattr(sample["label"], "numpy") else sample["label"]
        movement_ids.append(sample["movement_id"])
        base_works.append(sample["base_work"])

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
        },
    }
    meta_path = output_dir / f"{args.task}_meta.json"
    meta_path.write_text(json.dumps(meta, indent=2, ensure_ascii=False), encoding="utf-8")
    print(f"Saved metadata to {meta_path}")
    print(f"Done: {n} samples, {len(dataset.label_to_index)} classes")
