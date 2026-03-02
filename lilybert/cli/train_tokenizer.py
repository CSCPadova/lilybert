"""Packaged entrypoint for parser-aware tokenizer training."""

from __future__ import annotations

import json
from typing import Optional

import typer
from typing_extensions import Annotated

from lilybert.data.tokenizer import LilyPondTokenizer


def main(
    processed_dir: Annotated[
        str,
        typer.Option(
            help="Processed movement root (expects italiano/english subdirs or .ly files)"
        ),
    ] = "data/processed",
    output_dir: Annotated[
        str, typer.Option(help="Directory to save trained tokenizer files")
    ] = "artifacts/tokenizer",
    vocab_size: Annotated[int, typer.Option(help="Target BPE vocabulary size")] = 8000,
    notation_mode: Annotated[
        str,
        typer.Option(
            help="Which processed notation variants to include in tokenizer corpus (english/italiano/both)"
        ),
    ] = "both",
    languages: Annotated[
        Optional[str],
        typer.Option(help="Optional comma-separated explicit language folders to include"),
    ] = None,
) -> None:
    tokenizer = LilyPondTokenizer()
    lang_list = None
    if languages:
        lang_list = [lang.strip() for lang in languages.split(",") if lang.strip()]
    corpus = tokenizer.build_corpus(
        processed_dir,
        notation_mode=notation_mode,
        languages=lang_list,
    )
    fast_tokenizer = tokenizer.train(corpus=corpus, vocab_size=vocab_size)
    saved_dir = tokenizer.save(output_dir)

    summary = {
        "processed_dir": processed_dir,
        "output_dir": str(saved_dir),
        "notation_mode": notation_mode,
        "languages": lang_list,
        "num_corpus_samples": len(corpus),
        "vocab_size": fast_tokenizer.vocab_size,
    }
    print(json.dumps(summary, indent=2, ensure_ascii=False))
