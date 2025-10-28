"""Data processing and dataset utilities for LilyPond music notation."""

# Always available - core parsing functionality
from .lilypond_parser import LilyPondParser

# Conditional imports for ML-dependent modules
try:
    from .dataset import (
        LilyPondDataset,
        MusicGenerationDataset,
        DataCollatorForMusicGeneration,
    )
    from .preprocessing import LilyPondPreprocessor

    __all__ = [
        "LilyPondDataset",
        "MusicGenerationDataset",
        "DataCollatorForMusicGeneration",
        "LilyPondParser",
        "LilyPondPreprocessor",
    ]

except ImportError as e:
    # If torch/transformers aren't installed, still allow parser-only use
    import logging
    logging.warning(f"ML modules not available: {e}")
    __all__ = ["LilyPondParser"]
