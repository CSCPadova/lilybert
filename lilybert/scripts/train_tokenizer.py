"""Packaged entrypoint for parser-aware tokenizer training."""

from __future__ import annotations

import argparse
import json
from typing import Sequence

from lilybert.data.tokenizer import LilyPondTokenizer


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Train parser-aware BPE tokenizer")
    parser.add_argument(
        "--processed-dir",
        default="data/processed",
        help="Processed movement root (expects italiano/english subdirs or .ly files)",
    )
    parser.add_argument(
        "--output-dir",
        default="artifacts/tokenizer",
        help="Directory to save trained tokenizer files",
    )
    parser.add_argument(
        "--vocab-size",
        type=int,
        default=8000,
        help="Target BPE vocabulary size",
    )
    parser.add_argument(
        "--notation-mode",
        choices=["english", "italiano", "both"],
        default="both",
        help="Which processed notation variants to include in tokenizer corpus",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)

    tokenizer = LilyPondTokenizer()
    corpus = tokenizer.build_corpus(
        args.processed_dir,
        notation_mode=args.notation_mode,
    )
    fast_tokenizer = tokenizer.train(corpus=corpus, vocab_size=args.vocab_size)
    saved_dir = tokenizer.save(args.output_dir)

    summary = {
        "processed_dir": args.processed_dir,
        "output_dir": str(saved_dir),
        "notation_mode": args.notation_mode,
        "num_corpus_samples": len(corpus),
        "vocab_size": fast_tokenizer.vocab_size,
    }
    print(json.dumps(summary, indent=2, ensure_ascii=False))
