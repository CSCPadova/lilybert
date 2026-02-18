"""Packaged entrypoint for preprocessing."""

from __future__ import annotations

import argparse
import json
from typing import Sequence

from lilybert.data.preprocessor import LilyPondPreprocessor


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Preprocess LilyPond corpus for lilyBERT"
    )
    parser.add_argument(
        "--input-dir", default="data/raw", help="Directory containing .ly files"
    )
    parser.add_argument(
        "--output-dir",
        default="data/processed",
        help="Output root directory for italiano/english + metadata.json",
    )
    parser.add_argument(
        "--labels-path",
        default="data/labels/labels_v1.json",
        help="Path to labels_v1.json",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    preprocessor = LilyPondPreprocessor()

    summary = preprocessor.preprocess_to_dataset(
        input_dir=args.input_dir,
        output_dir=args.output_dir,
        labels_path=args.labels_path,
    )

    print(json.dumps(summary, indent=2, ensure_ascii=False))
