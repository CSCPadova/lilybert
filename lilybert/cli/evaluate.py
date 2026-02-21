"""CLI entrypoint for lilyBERT classification evaluation."""

from __future__ import annotations

import argparse
import json
from typing import Sequence

import numpy as np

from .metrics import ClassificationMetrics


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Evaluate classification predictions")
    parser.add_argument(
        "--y-true", required=True, help="Path to ground-truth .npy file"
    )
    parser.add_argument("--y-pred", required=True, help="Path to prediction .npy file")
    parser.add_argument(
        "--multi-label",
        action="store_true",
        help="Use multi-label metric set",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    metrics = ClassificationMetrics()
    y_true = np.load(args.y_true)
    y_pred = np.load(args.y_pred)

    if args.multi_label:
        scores = metrics.compute_multi_label(y_true=y_true, y_pred=y_pred)
    else:
        scores = metrics.compute_single_label(y_true=y_true, y_pred=y_pred)

    print(json.dumps(scores, indent=2, ensure_ascii=False))
