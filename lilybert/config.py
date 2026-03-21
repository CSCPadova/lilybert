"""Shared configuration building blocks for lilyBERT.

All default values are defined here *once*. Module-specific configs
(TrainingConfig) compose or inherit from these base dataclasses so
that there is a single source of truth for paths, model defaults,
and training hyper-parameters.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional


@dataclass
class PathConfig:
    """Canonical filesystem paths used across the project."""

    data_dir: str = "data/processed"
    tokenizer_path: str = "artifacts/tokenizer"
    output_dir: str = "outputs"


@dataclass
class BaseModelConfig:
    """Model-architecture defaults shared by pretraining and fine-tuning."""

    pretrained_model: str = "microsoft/codebert-base"
    max_length: int = 512
    seed: int = 42


@dataclass
class BaseTrainingConfig:
    """Training hyper-parameter defaults shared by pretraining and fine-tuning."""

    learning_rate: float = 2e-5
    per_device_train_batch_size: int = 16
    per_device_eval_batch_size: int = 16
    weight_decay: float = 0.01
    warmup_ratio: float = 0.1
    num_train_epochs: int = 20


@dataclass
class LoggingConfig:
    """Unified logging configuration for wandb and tensorboard."""

    # wandb
    wandb_enabled: bool = False
    wandb_project: str = "lilybert"
    wandb_entity: Optional[str] = None
    wandb_mode: str = "online"
    wandb_run_name: Optional[str] = None

    # tensorboard
    tensorboard_enabled: bool = False
    tensorboard_log_dir: str = "outputs/tensorboard"
