"""Factory utilities for creating and loading tokenizers by type."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Union

from .bbpe_tokenizer import BBPETokenizer, TOKENIZER_META_FILENAME
from .tokenizer import LilyPondTokenizer


def get_tokenizer_type(tokenizer_path: str | Path) -> str:
    """Read the tokenizer type from a saved tokenizer directory.

    Returns ``"musical"`` or ``"bbpe"``.  Defaults to ``"musical"`` when
    the metadata file is absent (backward compatibility).
    """
    meta_path = Path(tokenizer_path) / TOKENIZER_META_FILENAME
    if meta_path.exists():
        meta = json.loads(meta_path.read_text(encoding="utf-8"))
        return meta.get("type", "musical")
    return "musical"


def create_tokenizer(
    tokenizer_type: str,
) -> Union[LilyPondTokenizer, BBPETokenizer]:
    """Create a fresh (untrained) tokenizer instance by type.

    Args:
        tokenizer_type: ``"musical"`` or ``"bbpe"``.
    """
    if tokenizer_type == "bbpe":
        return BBPETokenizer()
    if tokenizer_type == "musical":
        return LilyPondTokenizer()
    raise ValueError(f"Unknown tokenizer type: {tokenizer_type!r}")


def load_tokenizer(
    tokenizer_path: str | Path,
) -> Union[LilyPondTokenizer, BBPETokenizer]:
    """Load a tokenizer from a saved directory, auto-detecting the type."""
    tok_type = get_tokenizer_type(tokenizer_path)
    if tok_type == "bbpe":
        return BBPETokenizer.load(tokenizer_path)
    return LilyPondTokenizer.load(tokenizer_path)
