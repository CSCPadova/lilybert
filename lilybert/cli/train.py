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
    parser.add_argument("--max-steps", type=int, default=0)
    parser.add_argument("--eval-steps", type=int, default=200)
    parser.add_argument("--log-steps", type=int, default=20)
    parser.add_argument("--batch-size", type=int, default=16)
    parser.add_argument("--lr-scheduler-type", default="linear")
    parser.add_argument("--grad-clip-norm", type=float, default=1.0)
    parser.add_argument("--model-selection-metric", default="auto")
    parser.add_argument("--model-selection-mode", default="auto")
    parser.add_argument("--pretokenized", default=None, help="Path to .npz from pretokenize")
    parser.add_argument("--output-dir", default="outputs/cv")
    parser.add_argument("--wandb", action="store_true")
    parser.add_argument("--wandb-project", default="lilybert")
    parser.add_argument("--wandb-entity", default=None)
    parser.add_argument("--wandb-mode", default="online")
    parser.add_argument("--wandb-run-name", default=None)
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
        max_steps=args.max_steps,
        eval_steps=args.eval_steps,
        log_steps=args.log_steps,
        batch_size=args.batch_size,
        per_device_train_batch_size=args.batch_size,
        per_device_eval_batch_size=args.batch_size,
        lr_scheduler_type=args.lr_scheduler_type,
        grad_clip_norm=args.grad_clip_norm,
        model_selection_metric=args.model_selection_metric,
        model_selection_mode=args.model_selection_mode,
        pretokenized_path=args.pretokenized,
        output_dir=args.output_dir,
        wandb_enabled=args.wandb,
        wandb_project=args.wandb_project,
        wandb_entity=args.wandb_entity,
        wandb_mode=args.wandb_mode,
        wandb_run_name=args.wandb_run_name,
    )
    trainer = StratifiedKFoldTrainer(config=config)
    results = trainer.run()
    print(json.dumps(results, indent=2, ensure_ascii=False))
