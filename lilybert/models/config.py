"""Configuration re-export for backward compatibility.

``LilyBERTConfig`` was a redundant subset of ``TrainingConfig``.
It is now a simple alias so that existing imports keep working.
"""

from lilybert.training.config import TrainingConfig

# Backward-compatible alias
LilyBERTConfig = TrainingConfig
