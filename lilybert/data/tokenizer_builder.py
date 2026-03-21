"""Build an extended pretrained tokenizer with LilyPond-specific tokens.

Loads a pretrained RoBERTa/CodeBERT tokenizer and adds domain-specific
musical tokens from the lilybert lexer, so that LilyPond notation symbols
are represented as single tokens rather than subword fragments.
"""

from __future__ import annotations

from pathlib import Path
from typing import List

from transformers import AutoTokenizer, PreTrainedTokenizerFast

from lilybert.data.musical_tokens import base_vocabulary

# Structural tokens emitted by the lexer for multi-voice passages.
LILYPOND_SPECIAL_TOKENS = ["[PART_BEGIN]", "[PART_END]"]


def lilypond_tokens() -> List[str]:
    """Return the full set of LilyPond tokens to add to a pretrained tokenizer."""
    return base_vocabulary() + LILYPOND_SPECIAL_TOKENS


def build_lilypond_tokenizer(
    pretrained_model: str = "roberta-base",
) -> PreTrainedTokenizerFast:
    """Load a pretrained tokenizer and extend it with LilyPond tokens.

    Args:
        pretrained_model: HuggingFace model identifier (e.g. ``roberta-base``
            or ``microsoft/codebert-base``).

    Returns:
        Extended tokenizer with LilyPond musical tokens added.
    """
    tokenizer = AutoTokenizer.from_pretrained(pretrained_model)

    tokens = lilypond_tokens()
    num_added = tokenizer.add_tokens(tokens)

    # Add structural tokens as special tokens so they are never split.
    tokenizer.add_special_tokens(
        {"additional_special_tokens": LILYPOND_SPECIAL_TOKENS}
    )

    return tokenizer


def build_and_save(
    pretrained_model: str = "roberta-base",
    output_dir: str = "artifacts/tokenizer",
) -> Path:
    """Build the extended tokenizer and persist it to disk.

    Returns:
        Path to the saved tokenizer directory.
    """
    tokenizer = build_lilypond_tokenizer(pretrained_model)
    out = Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)
    tokenizer.save_pretrained(str(out))
    return out
