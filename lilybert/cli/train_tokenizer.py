"""Packaged entrypoint for parser-aware tokenizer training."""

from __future__ import annotations

import json

import typer
from typing_extensions import Annotated

from lilybert.data.tokenizer import LilyPondTokenizer


def main(
    processed_dir: Annotated[
        str,
        typer.Option(
            help="Processed movement root containing .ly files"
        ),
    ] = "data/processed",
    output_dir: Annotated[
        str, typer.Option(help="Directory to save trained tokenizer files")
    ] = "artifacts/tokenizer",
    vocab_size: Annotated[int, typer.Option(help="Target BPE vocabulary size")] = 8000,
) -> None:
    tokenizer = LilyPondTokenizer()
    corpus = tokenizer.build_corpus(processed_dir)
    fast_tokenizer = tokenizer.train(corpus=corpus, vocab_size=vocab_size)
    saved_dir = tokenizer.save(output_dir)

    summary = {
        "processed_dir": processed_dir,
        "output_dir": str(saved_dir),
        "num_corpus_samples": len(corpus),
        "vocab_size": fast_tokenizer.vocab_size,
    }
    print(json.dumps(summary, indent=2, ensure_ascii=False))
