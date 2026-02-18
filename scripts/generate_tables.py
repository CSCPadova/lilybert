"""Generate summary tables from experiment result JSON files."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Mapping, Sequence


def generate_markdown_table(results_path: str | Path, output_path: str | Path) -> Path:
    results_file = Path(results_path)
    output_file = Path(output_path)
    results = json.loads(results_file.read_text(encoding="utf-8"))

    lines = [
        "| Task | Avg Score (mean±std) | Majority Score (mean±std) |",
        "|---|---:|---:|",
    ]

    for task, payload in results.items():
        mean: Mapping[str, float] = payload.get("mean", {})
        std: Mapping[str, float] = payload.get("std", {})
        avg = f"{mean.get('avg_score', 0.0):.4f}±{std.get('avg_score', 0.0):.4f}"
        maj = f"{mean.get('majority_score', 0.0):.4f}±{std.get('majority_score', 0.0):.4f}"
        lines.append(f"| {task} | {avg} | {maj} |")

    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return output_file


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Generate markdown summary table")
    parser.add_argument("--results", required=True, help="Path to results JSON")
    parser.add_argument("--output", default="outputs/tables/results.md", help="Output markdown path")
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    output = generate_markdown_table(args.results, args.output)
    print(str(output))


if __name__ == "__main__":
    main()
