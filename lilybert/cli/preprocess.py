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
    parser.add_argument(
        "--languages",
        default="italiano,english,nederlands",
        help="Comma-separated LilyPond languages to write (e.g. english,italiano,nederlands)",
    )
    parser.add_argument(
        "--enable-transposition",
        action="store_true",
        help="Enable transposition augmentation across tonalities",
    )
    parser.add_argument(
        "--enable-absolute-relative",
        action="store_true",
        help="Enable absolute/relative pitch conversion augmentation",
    )
    parser.add_argument(
        "--enable-articulation-variants",
        action="store_true",
        help="Enable articulation short/expanded augmentation",
    )
    parser.add_argument(
        "--enable-barline-variants",
        action="store_true",
        help="Enable add/remove barline augmentation",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    preprocessor = LilyPondPreprocessor()
    languages = [lang.strip() for lang in args.languages.split(",") if lang.strip()]
    augmentation_config = {
        "languages": languages,
        "enable_transposition": args.enable_transposition,
        "enable_absolute_relative": args.enable_absolute_relative,
        "enable_articulation_variants": args.enable_articulation_variants,
        "enable_barline_variants": args.enable_barline_variants,
        "include_original": True,
    }

    summary = preprocessor.preprocess_to_dataset(
        input_dir=args.input_dir,
        output_dir=args.output_dir,
        labels_path=args.labels_path,
        augmentation_config=augmentation_config,
    )

    print(json.dumps(summary, indent=2, ensure_ascii=False))
