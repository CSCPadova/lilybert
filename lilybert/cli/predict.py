"""CLI entrypoint for lilyBERT batch inference."""

from __future__ import annotations

import argparse
import csv
import io
import json
from pathlib import Path
from typing import Any, Dict, List, Sequence

from .pipeline import InferencePipeline


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Run batch inference on LilyPond files"
    )
    parser.add_argument(
        "--checkpoint", required=True, help="Path to model checkpoint directory"
    )
    parser.add_argument(
        "--input-dir", required=True, help="Root data directory with language subdirs"
    )
    parser.add_argument("--task", default="composer", help="Classification task")
    parser.add_argument("--language", default="english", help="Language variant subdir")
    parser.add_argument(
        "--batch-size", type=int, default=16, help="Inference batch size"
    )
    parser.add_argument(
        "--max-length", type=int, default=512, help="Max sequence length"
    )
    parser.add_argument("--stride", type=int, default=256, help="Window stride")
    parser.add_argument(
        "--aggregation",
        default="average",
        choices=["average", "majority"],
        help="Window aggregation method",
    )
    parser.add_argument(
        "--output", default=None, help="Output file path (stdout if omitted)"
    )
    parser.add_argument(
        "--format",
        default="json",
        choices=["json", "csv"],
        help="Output format",
    )
    return parser


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


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)

    pipeline = InferencePipeline.from_checkpoint(
        checkpoint_dir=args.checkpoint,
        task=args.task,
        max_length=args.max_length,
        stride=args.stride,
        aggregation_method=args.aggregation,
    )

    results = pipeline.predict_directory(
        input_dir=args.input_dir,
        language=args.language,
        batch_size=args.batch_size,
    )

    if args.format == "csv":
        output_text = _format_csv(results)
    else:
        output_text = _format_json(results)

    if args.output:
        Path(args.output).write_text(output_text, encoding="utf-8")
    else:
        print(output_text)
