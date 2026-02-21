"""Generate summary tables from experiment result JSON files.

Produces both markdown and LaTeX tables suitable for scientific papers.
Single-label tasks show top-1 and top-5 accuracy plus F1 (macro).
Multi-label tasks show F1 (micro), F1 (macro), and subset accuracy.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any, Dict, Mapping, Sequence

SINGLE_LABEL_TASKS = {"composer", "section_nomenclature", "key_scale"}
MULTI_LABEL_TASKS = {"musical_form", "instruments"}

TASK_DISPLAY_NAMES: Dict[str, str] = {
    "composer": "Composer",
    "section_nomenclature": "Section",
    "key_scale": "Key / Scale",
    "musical_form": "Musical Form",
    "instruments": "Instruments",
}


def _fmt(mean_val: float, std_val: float, pct: bool = True) -> str:
    """Format a metric as mean±std, optionally as percentage."""
    if pct:
        return f"{mean_val * 100:.1f}±{std_val * 100:.1f}"
    return f"{mean_val:.4f}±{std_val:.4f}"


def _get(
    mean: Mapping[str, float],
    std: Mapping[str, float],
    key: str,
    pct: bool = True,
) -> str:
    m = mean.get(key)
    s = std.get(key, 0.0)
    if m is None:
        return "--"
    return _fmt(m, s, pct=pct)


# ---------------------------------------------------------------------------
# Markdown
# ---------------------------------------------------------------------------


def generate_markdown_table(
    results_path: str | Path,
    output_path: str | Path,
) -> Path:
    results_file = Path(results_path)
    output_file = Path(output_path)
    results = json.loads(results_file.read_text(encoding="utf-8"))

    single, multi = _split_tasks(results)

    lines: list[str] = []

    if single:
        lines.append("### Single-label classification")
        lines.append("")
        lines.append("| Task | Top-1 Acc | Top-5 Acc | F1 (macro) | F1 (weighted) |")
        lines.append("|---|---:|---:|---:|---:|")
        for task, payload in single:
            mean, std = payload.get("mean", {}), payload.get("std", {})
            lines.append(
                f"| {TASK_DISPLAY_NAMES.get(task, task)} "
                f"| {_get(mean, std, 'avg_top1_accuracy')} "
                f"| {_get(mean, std, 'avg_top5_accuracy')} "
                f"| {_get(mean, std, 'avg_f1_macro')} "
                f"| {_get(mean, std, 'avg_f1_weighted')} |"
            )
        lines.append("")

    if multi:
        lines.append("### Multi-label classification")
        lines.append("")
        lines.append("| Task | F1 (micro) | F1 (macro) | Subset Acc | Hamming Loss |")
        lines.append("|---|---:|---:|---:|---:|")
        for task, payload in multi:
            mean, std = payload.get("mean", {}), payload.get("std", {})
            lines.append(
                f"| {TASK_DISPLAY_NAMES.get(task, task)} "
                f"| {_get(mean, std, 'avg_f1_micro')} "
                f"| {_get(mean, std, 'avg_f1_macro')} "
                f"| {_get(mean, std, 'avg_subset_accuracy')} "
                f"| {_get(mean, std, 'avg_hamming_loss')} |"
            )
        lines.append("")

    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text("\n".join(lines), encoding="utf-8")
    return output_file


# ---------------------------------------------------------------------------
# LaTeX
# ---------------------------------------------------------------------------


def generate_latex_table(
    results_path: str | Path,
    output_path: str | Path,
) -> Path:
    results_file = Path(results_path)
    output_file = Path(output_path)
    results = json.loads(results_file.read_text(encoding="utf-8"))

    single, multi = _split_tasks(results)

    lines: list[str] = []

    if single:
        lines.extend(_latex_single_label(single))
        lines.append("")

    if multi:
        lines.extend(_latex_multi_label(multi))
        lines.append("")

    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text("\n".join(lines), encoding="utf-8")
    return output_file


def _latex_single_label(
    tasks: list[tuple[str, Dict[str, Any]]],
) -> list[str]:
    lines = [
        r"\begin{table}[ht]",
        r"  \centering",
        r"  \caption{Single-label classification results (mean $\pm$ std over folds).}",
        r"  \label{tab:single-label}",
        r"  \begin{tabular}{lcccc}",
        r"    \toprule",
        r"    Task & Top-1 Acc & Top-5 Acc & F1 (macro) & F1 (weighted) \\",
        r"    \midrule",
    ]
    for task, payload in tasks:
        mean, std = payload.get("mean", {}), payload.get("std", {})
        name = TASK_DISPLAY_NAMES.get(task, task)
        t1 = _get(mean, std, "avg_top1_accuracy")
        t5 = _get(mean, std, "avg_top5_accuracy")
        f1m = _get(mean, std, "avg_f1_macro")
        f1w = _get(mean, std, "avg_f1_weighted")
        lines.append(f"    {name} & {t1} & {t5} & {f1m} & {f1w} \\\\")
    lines.extend(
        [
            r"    \bottomrule",
            r"  \end{tabular}",
            r"\end{table}",
        ]
    )
    return lines


def _latex_multi_label(
    tasks: list[tuple[str, Dict[str, Any]]],
) -> list[str]:
    lines = [
        r"\begin{table}[ht]",
        r"  \centering",
        r"  \caption{Multi-label classification results (mean $\pm$ std over folds).}",
        r"  \label{tab:multi-label}",
        r"  \begin{tabular}{lcccc}",
        r"    \toprule",
        r"    Task & F1 (micro) & F1 (macro) & Subset Acc & Hamming Loss \\",
        r"    \midrule",
    ]
    for task, payload in tasks:
        mean, std = payload.get("mean", {}), payload.get("std", {})
        name = TASK_DISPLAY_NAMES.get(task, task)
        f1i = _get(mean, std, "avg_f1_micro")
        f1m = _get(mean, std, "avg_f1_macro")
        sa = _get(mean, std, "avg_subset_accuracy")
        hl = _get(mean, std, "avg_hamming_loss")
        lines.append(f"    {name} & {f1i} & {f1m} & {sa} & {hl} \\\\")
    lines.extend(
        [
            r"    \bottomrule",
            r"  \end{tabular}",
            r"\end{table}",
        ]
    )
    return lines


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def _split_tasks(
    results: Dict[str, Any],
) -> tuple[list[tuple[str, Any]], list[tuple[str, Any]]]:
    single: list[tuple[str, Any]] = []
    multi: list[tuple[str, Any]] = []
    for task, payload in results.items():
        if not isinstance(payload, dict) or "mean" not in payload:
            continue
        if task in MULTI_LABEL_TASKS:
            multi.append((task, payload))
        else:
            single.append((task, payload))
    return single, multi


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Generate summary tables from experiment results"
    )
    parser.add_argument("--results", required=True, help="Path to results JSON")
    parser.add_argument(
        "--output",
        default="outputs/tables/results",
        help="Output path (without extension; .md and .tex are generated)",
    )
    parser.add_argument(
        "--format",
        choices=["markdown", "latex", "both"],
        default="both",
        help="Output format (default: both)",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    base = Path(args.output)

    if args.format in ("markdown", "both"):
        md_path = generate_markdown_table(args.results, base.with_suffix(".md"))
        print(f"Markdown: {md_path}")

    if args.format in ("latex", "both"):
        tex_path = generate_latex_table(args.results, base.with_suffix(".tex"))
        print(f"LaTeX:    {tex_path}")


if __name__ == "__main__":
    main()
