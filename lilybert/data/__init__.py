"""Data processing and dataset utilities for LilyPond music notation."""

# Always available - core parsing functionality
from .parser import LilyPondParser

# Conditional imports for ML-dependent modules
try:
    from .dataset import (
        BaroqueMusicClassificationDataset,
        BaroqueMusicDataset,
    )
    from .label_encoder import LabelEncoder
    from .preprocessor import LilyPondPreprocessor
    from .pretokenized_dataset import PreTokenizedDataset
    from .repository import BaroqueMusicDataAPI, MovementRecord
    from .tokenizer import LilyPondTokenizer

    __all__ = [
        "BaroqueMusicClassificationDataset",
        "BaroqueMusicDataset",
        "PreTokenizedDataset",
        "LilyPondParser",
        "LilyPondPreprocessor",
        "LilyPondTokenizer",
        "BaroqueMusicDataAPI",
        "MovementRecord",
        "LabelEncoder",
    ]

except ImportError as e:
    # If torch/transformers aren't installed, still allow parser-only use
    import logging

    logging.warning(f"ML modules not available: {e}")
    __all__ = ["LilyPondParser"]
