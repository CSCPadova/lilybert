"""Data processing and dataset utilities for LilyPond music notation."""

# Always available - core parsing functionality
from .lilypond_parser import LilyPondParser

# Conditional imports for modules requiring ML dependencies
try:
    from .dataset import LilyPondDataset, DataCollatorForMusicGeneration
    from .preprocessing import LilyPondPreprocessor
    __all__ = ["LilyPondDataset", "LilyPondPreprocessor", "LilyPondParser", "DataCollatorForMusicGeneration"]
except ImportError:
    __all__ = ["LilyPondParser"]