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
    parser.add_argument(
        "--pretokenized-shards-dir",
        default=None,
        help="Path to sharded pretokenized MLM data (contains train/ and eval/ subdirs)",
    )
    parser.add_argument(
        "--num-workers",
        type=int,
        default=0,
        help="Number of DataLoader workers (default: 0)",
    )
    parser.add_argument("--wandb", action=argparse.BooleanOptionalAction, default=True)
    parser.add_argument("--wandb-project", default="lilybert")
    parser.add_argument("--wandb-entity", default=None)
    parser.add_argument("--wandb-mode", default="online")
    parser.add_argument("--wandb-run-name", default=None)
    parser.add_argument("--tensorboard", action="store_true")
    parser.add_argument("--tensorboard-log-dir", default="outputs/tensorboard")
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
        pretokenized_shards_dir=args.pretokenized_shards_dir,
        dataloader_num_workers=args.num_workers,
        wandb_enabled=args.wandb,
        wandb_project=args.wandb_project,
        wandb_entity=args.wandb_entity,
        wandb_mode=args.wandb_mode,
        wandb_run_name=args.wandb_run_name,
        tensorboard_enabled=args.tensorboard,
        tensorboard_log_dir=args.tensorboard_log_dir,
    )

    summary = MLMPretrainer(config=config).run()
    print(json.dumps(summary, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
