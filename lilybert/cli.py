"""Top-level CLI dispatcher for lilyBERT commands."""

from __future__ import annotations

import argparse
from typing import Callable, Sequence

from lilybert.evaluation import cli as evaluate_cli
from lilybert.inference import cli as inference_cli
from lilybert.scripts import preprocess, pretokenize, run_experiment, train_tokenizer
from lilybert.training import cli as train_cli

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
        "pretokenize",
        "Pre-tokenize movement files for fast training",
        pretokenize.main,
    )
    _add_subcommand(subparsers, "train", "Run grouped CV training", train_cli.main)
    _add_subcommand(
        subparsers, "evaluate", "Run classification evaluation", evaluate_cli.main
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
        inference_cli.main,
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
