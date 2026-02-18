"""Data processing and dataset utilities for LilyPond music notation."""

# Always available - core parsing functionality
from .lilypond_parser import LilyPondParser

# Conditional imports for ML-dependent modules
try:
    from .dataset import (
        LilyPondClassificationDataset,
        LilyPondDataset,
    )
    from .label_encoder import LabelEncoder
    from .preprocessing import LilyPondPreprocessor
    from .repository import LilyPondDataAPI, MovementRecord
    from .tokenizer import LilyPondTokenizer

    __all__ = [
        "LilyPondClassificationDataset",
        "LilyPondDataset",
        "LilyPondParser",
        "LilyPondPreprocessor",
        "LilyPondTokenizer",
        "LilyPondDataAPI",
        "MovementRecord",
        "LabelEncoder",
    ]

except ImportError as e:
    # If torch/transformers aren't installed, still allow parser-only use
    import logging

    logging.warning(f"ML modules not available: {e}")
    __all__ = ["LilyPondParser"]
