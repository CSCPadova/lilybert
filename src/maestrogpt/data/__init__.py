"""Data processing and dataset utilities for LilyPond music notation."""

# Always available - core parsing functionality
from .lilypond_parser import LilyPondParser

# Conditional imports for modules requiring ML dependencies
try:
    from .dataset import LilyPondDataset
    from .preprocessing import LilyPondPreprocessor
    __all__ = ["LilyPondDataset", "LilyPondPreprocessor", "LilyPondParser"]
except ImportError:
    __all__ = ["LilyPondParser"]