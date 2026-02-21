"""Packaged entrypoint for Stage-1 MLM pretraining."""

from __future__ import annotations

import argparse
import json
from typing import Sequence

from lilybert.pretraining import MLMPretrainer, PretrainingConfig


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Run Stage-1 MLM pretraining")
    parser.add_argument("--data-dir", default="data/processed")
    parser.add_argument("--tokenizer-path", default="artifacts/tokenizer")
    parser.add_argument("--output-dir", default="outputs/pretraining")
    parser.add_argument("--languages", default="italiano,english")
    parser.add_argument("--max-length", type=int, default=512)
    parser.add_argument("--mlm-probability", type=float, default=0.15)
    parser.add_argument("--batch-size", type=int, default=16)
    parser.add_argument("--epochs", type=int, default=3)
    parser.add_argument("--learning-rate", type=float, default=5e-5)
    parser.add_argument("--seed", type=int, default=42)
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    languages = [lang.strip() for lang in args.languages.split(",") if lang.strip()]

    config = PretrainingConfig(
        data_dir=args.data_dir,
        tokenizer_path=args.tokenizer_path,
        output_dir=args.output_dir,
        languages=languages,
        max_length=args.max_length,
        mlm_probability=args.mlm_probability,
        per_device_train_batch_size=args.batch_size,
        num_train_epochs=args.epochs,
        learning_rate=args.learning_rate,
        seed=args.seed,
    )

    summary = MLMPretrainer(config=config).run()
    print(json.dumps(summary, indent=2, ensure_ascii=False))
