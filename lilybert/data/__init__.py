"""Data processing and dataset utilities for LilyPond music notation."""

# Always available - core parsing functionality
from .lexer import LexerConfig, MusicalLexer
from .parser import LilyPondParser

# Conditional imports for ML-dependent modules
try:
    from .preprocessor import LilyPondPreprocessor
    from .pretokenized_dataset import PreTokenizedDataset
    from .repository import BaroqueMusicDataAPI, MovementRecord
    from .tokenizer import LilyPondTokenizer

    __all__ = [
        "PreTokenizedDataset",
        "LilyPondParser",
        "LilyPondPreprocessor",
        "LilyPondTokenizer",
        "MusicalLexer",
        "LexerConfig",
        "BaroqueMusicDataAPI",
        "MovementRecord",
    ]

except ImportError as e:
    # If torch/transformers aren't installed, still allow parser-only use
    import logging

    logging.warning(f"ML modules not available: {e}")
    __all__ = ["LilyPondParser", "MusicalLexer", "LexerConfig"]
