"""CLI entrypoint for lilyBERT grouped CV training."""

from __future__ import annotations

import argparse
import json
from typing import Sequence

from .config import TrainingConfig
from .trainer import StratifiedKFoldTrainer


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Run grouped stratified CV training")
    parser.add_argument("--task", default="composer")
    parser.add_argument("--data-dir", default="data/processed")
    parser.add_argument("--tokenizer-path", default="artifacts/tokenizer")
    parser.add_argument("--n-folds", type=int, default=5)
    parser.add_argument("--epochs", type=int, default=20)
    parser.add_argument("--batch-size", type=int, default=16)
    parser.add_argument("--output-dir", default="outputs/cv")
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    config = TrainingConfig(
        task=args.task,
        data_dir=args.data_dir,
        tokenizer_path=args.tokenizer_path,
        n_folds=args.n_folds,
        num_train_epochs=args.epochs,
        epochs=args.epochs,
        batch_size=args.batch_size,
        per_device_train_batch_size=args.batch_size,
        per_device_eval_batch_size=args.batch_size,
        output_dir=args.output_dir,
    )
    trainer = StratifiedKFoldTrainer(config=config)
    results = trainer.run()
    print(json.dumps(results, indent=2, ensure_ascii=False))
