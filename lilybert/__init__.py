"""lilyBERT package for LilyPond MIR classification workflows."""

from lilybert.data import (
    LilyPondClassificationDataset,
    LilyPondParser,
    LilyPondPreprocessor,
)
from lilybert.evaluation import ClassificationMetrics, WindowAggregator
from lilybert.models import LilyBERTClassifier, LilyBERTEncoder, TrainingMode
from lilybert.training import StratifiedKFoldTrainer, TrainingConfig

__all__ = [
    "LilyPondParser",
    "LilyPondPreprocessor",
    "LilyPondClassificationDataset",
    "TrainingMode",
    "LilyBERTEncoder",
    "LilyBERTClassifier",
    "TrainingConfig",
    "StratifiedKFoldTrainer",
    "WindowAggregator",
    "ClassificationMetrics",
]
