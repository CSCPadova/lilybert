"""Hydra-style entrypoint for offline classification evaluation."""

from __future__ import annotations

import json
from dataclasses import dataclass

import hydra
import numpy as np
from omegaconf import DictConfig

from lilybert.evaluation.metrics import ClassificationMetrics


@dataclass
class EvaluateConfig:
    y_true: str = ""
    y_pred: str = ""
    multi_label: bool = False


@hydra.main(version_base=None, config_path="../../conf", config_name="evaluate")
def _main(cfg: DictConfig) -> None:
    config = EvaluateConfig(**cfg)
    metrics = ClassificationMetrics()

    y_true = np.load(config.y_true)
    y_pred = np.load(config.y_pred)

    if config.multi_label:
        scores = metrics.compute_multi_label(y_true=y_true, y_pred=y_pred)
    else:
        scores = metrics.compute_single_label(y_true=y_true, y_pred=y_pred)

    print(json.dumps(scores, indent=2, ensure_ascii=False))


def main() -> None:
    _main()
