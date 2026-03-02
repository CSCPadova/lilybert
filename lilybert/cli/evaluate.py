"""CLI entrypoint for lilyBERT classification evaluation."""

from __future__ import annotations

import json
from typing import Optional

import typer
from typing_extensions import Annotated

import numpy as np

from lilybert.evaluation.metrics import ClassificationMetrics


def main(
    y_true: Annotated[str, typer.Option(help="Path to ground-truth .npy file")],
    y_pred: Annotated[str, typer.Option(help="Path to prediction .npy file")],
    multi_label: Annotated[
        bool, typer.Option("--multi-label", help="Use multi-label metric set")
    ] = False,
) -> None:
    metrics = ClassificationMetrics()
    y_true_arr = np.load(y_true)
    y_pred_arr = np.load(y_pred)

    if multi_label:
        scores = metrics.compute_multi_label(y_true=y_true_arr, y_pred=y_pred_arr)
    else:
        scores = metrics.compute_single_label(y_true=y_true_arr, y_pred=y_pred_arr)

    print(json.dumps(scores, indent=2, ensure_ascii=False))
