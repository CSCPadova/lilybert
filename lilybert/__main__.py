"""Top-level CLI dispatcher for lilyBERT commands.

This module serves as both the ``lilybert`` console-script entry point
(registered in ``pyproject.toml``) and the ``python -m lilybert`` handler.
"""

from __future__ import annotations

import argparse
from typing import Callable, Sequence

from lilybert.cli import (
    evaluate,
    generate_tables,
    combine,
    mutopia_preprocess,
    predict,
    preprocess,
    pretokenize,
    pretrain,
    run_experiment,
    train,
    train_tokenizer,
    upload_dataset,
    upload_model,
)

Handler = Callable[[Sequence[str] | None], None]


def _add_subcommand(
    subparsers: argparse._SubParsersAction,
    name: str,
    help_text: str,
    handler: Handler,
    aliases: Sequence[str] | None = None,
) -> None:
    parser = subparsers.add_parser(name, help=help_text, aliases=list(aliases or []))
    parser.set_defaults(_handler=handler)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="lilybert", description="lilyBERT command line interface"
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    # --- core pipeline ---
    _add_subcommand(
        subparsers, "preprocess", "Run preprocessing pipeline", preprocess.main
    )
    _add_subcommand(
        subparsers,
        "train-tokenizer",
        "Train parser-aware tokenizer",
        train_tokenizer.main,
    )
    _add_subcommand(
        subparsers,
        "pretrain",
        "Run Stage-1 MLM pretraining",
        pretrain.main,
    )
    _add_subcommand(
        subparsers,
        "pretokenize",
        "Pre-tokenize movement files for fast training",
        pretokenize.main,
    )
    _add_subcommand(subparsers, "train", "Run grouped CV training", train.main)
    _add_subcommand(
        subparsers, "evaluate", "Run classification evaluation", evaluate.main
    )
    _add_subcommand(
        subparsers,
        "run-experiment",
        "Run Hydra-configured experiments",
        run_experiment.main,
    )
    _add_subcommand(
        subparsers,
        "predict",
        "Run batch inference on LilyPond files",
        predict.main,
    )

    # --- data preparation ---
    _add_subcommand(
        subparsers,
        "combine",
        "Combine LilyPond files by resolving includes",
        combine.main,
    )
    _add_subcommand(
        subparsers,
        "mutopia-preprocess",
        "Preprocess combined Mutopia files for pretraining",
        mutopia_preprocess.main,
    )
    # --- reporting & hub ---
    _add_subcommand(
        subparsers,
        "generate-tables",
        "Generate result tables from experiment JSON",
        generate_tables.main,
    )
    _add_subcommand(
        subparsers,
        "upload-dataset",
        "Upload processed dataset to HuggingFace Hub",
        upload_dataset.main,
    )
    _add_subcommand(
        subparsers,
        "upload-model",
        "Upload model to HuggingFace Hub",
        upload_model.main,
    )

    return parser


def main(argv: Sequence[str] | None = None) -> None:
    parser = build_parser()
    args, passthrough = parser.parse_known_args(argv)
    normalized = list(passthrough)
    if normalized and normalized[0] == "--":
        normalized = normalized[1:]
    args._handler(normalized)


if __name__ == "__main__":
    main()
