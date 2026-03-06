"""lilyBERT package for LilyPond MIR classification workflows."""

from lilybert.data import (
    BaroqueMusicClassificationDataset,
    LilyPondParser,
    LilyPondPreprocessor,
)
from lilybert.evaluation import ClassificationMetrics, WindowAggregator
from lilybert.inference import InferencePipeline
from lilybert.models import LilyBERTClassifier, LilyBERTEncoder
from lilybert.training import StratifiedKFoldTrainer, TrainingConfig

__all__ = [
    "LilyPondParser",
    "LilyPondPreprocessor",
    "BaroqueMusicClassificationDataset",
    "InferencePipeline",
    "LilyBERTEncoder",
    "LilyBERTClassifier",
    "TrainingConfig",
    "StratifiedKFoldTrainer",
    "WindowAggregator",
    "ClassificationMetrics",
]
