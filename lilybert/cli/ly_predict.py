"""Hydra-style entrypoint for batch inference."""

from __future__ import annotations

import csv
import io
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, List, Optional

import hydra
from omegaconf import DictConfig

from lilybert.inference.pipeline import InferencePipeline


@dataclass
class PredictConfig:
    checkpoint: str = ""
    input_dir: str = ""
    task: str = "composer"
    batch_size: int = 16
    max_length: int = 512
    stride: int = 256
    aggregation: str = "average"
    output: Optional[str] = None
    format: str = "json"


def _as_json(results: List[Dict[str, Any]]) -> str:
    return json.dumps(results, indent=2, ensure_ascii=False)


def _as_csv(results: List[Dict[str, Any]]) -> str:
    if not results:
        return ""
    buffer = io.StringIO()
    fieldnames = list(results[0].keys())
    writer = csv.DictWriter(buffer, fieldnames=fieldnames)
    writer.writeheader()
    for row in results:
        writer.writerow(
            {
                key: json.dumps(value) if isinstance(value, (list, dict)) else value
                for key, value in row.items()
            }
        )
    return buffer.getvalue()


@hydra.main(version_base=None, config_path="../../conf", config_name="predict")
def _main(cfg: DictConfig) -> None:
    config = PredictConfig(**cfg)

    pipeline = InferencePipeline.from_checkpoint(
        checkpoint_dir=config.checkpoint,
        task=config.task,
        max_length=config.max_length,
        stride=config.stride,
        aggregation_method=config.aggregation,
    )

    results = pipeline.predict_directory(
        input_dir=config.input_dir,
        batch_size=config.batch_size,
    )

    output_text = _as_csv(results) if config.format == "csv" else _as_json(results)
    if config.output:
        Path(config.output).write_text(output_text, encoding="utf-8")
    else:
        print(output_text)


def main() -> None:
    _main()
