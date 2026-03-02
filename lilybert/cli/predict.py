"""CLI entrypoint for lilyBERT batch inference."""

from __future__ import annotations

import csv
import io
import json
from pathlib import Path
from typing import Any, Dict, List, Optional

import typer
from typing_extensions import Annotated

from lilybert.inference.pipeline import InferencePipeline


def _format_json(results: List[Dict[str, Any]]) -> str:
    return json.dumps(results, indent=2, ensure_ascii=False)


def _format_csv(results: List[Dict[str, Any]]) -> str:
    if not results:
        return ""
    buf = io.StringIO()
    fieldnames = list(results[0].keys())
    writer = csv.DictWriter(buf, fieldnames=fieldnames)
    writer.writeheader()
    for row in results:
        writer.writerow(
            {
                k: json.dumps(v) if isinstance(v, (list, dict)) else v
                for k, v in row.items()
            }
        )
    return buf.getvalue()


def main(
    checkpoint: Annotated[
        str, typer.Option(help="Path to model checkpoint directory")
    ],
    input_dir: Annotated[
        str, typer.Option(help="Root data directory with language subdirs")
    ],
    task: Annotated[str, typer.Option(help="Classification task")] = "composer",
    language: Annotated[
        str, typer.Option(help="Language variant subdir")
    ] = "english",
    batch_size: Annotated[int, typer.Option(help="Inference batch size")] = 16,
    max_length: Annotated[int, typer.Option(help="Max sequence length")] = 512,
    stride: Annotated[int, typer.Option(help="Window stride")] = 256,
    aggregation: Annotated[
        str, typer.Option(help="Window aggregation method (average/majority)")
    ] = "average",
    output: Annotated[
        Optional[str], typer.Option(help="Output file path (stdout if omitted)")
    ] = None,
    format: Annotated[
        str, typer.Option(help="Output format (json/csv)")
    ] = "json",
) -> None:
    pipeline = InferencePipeline.from_checkpoint(
        checkpoint_dir=checkpoint,
        task=task,
        max_length=max_length,
        stride=stride,
        aggregation_method=aggregation,
    )

    results = pipeline.predict_directory(
        input_dir=input_dir,
        language=language,
        batch_size=batch_size,
    )

    if format == "csv":
        output_text = _format_csv(results)
    else:
        output_text = _format_json(results)

    if output:
        Path(output).write_text(output_text, encoding="utf-8")
    else:
        print(output_text)
