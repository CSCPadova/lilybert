"""Configuration for Stage-1 MLM pretraining."""

from __future__ import annotations

from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Any, Dict, List

from lilybert.config import BaseModelConfig, BaseTrainingConfig, LoggingConfig, PathConfig


@dataclass
class PretrainingConfig:
    """Configuration values for LilyPond MLM pretraining.

    Default values for paths, model, and training hyper-parameters are
    inherited from ``lilybert.config`` where applicable, with
    pretraining-specific overrides for learning rate, warmup, and epochs.
    """

    # --- paths (from PathConfig) ---
    data_dir: str = PathConfig.data_dir
    tokenizer_path: str = PathConfig.tokenizer_path
    output_dir: str = "outputs/pretraining"
    languages: List[str] = field(default_factory=lambda: ["italiano", "english"])

    # --- model architecture (from BaseModelConfig + pretraining-specific) ---
    model_architecture: str = BaseModelConfig.pretrained_model
    hidden_size: int = 768
    num_hidden_layers: int = 12
    num_attention_heads: int = 12
    intermediate_size: int = 3072
    max_position_embeddings: int = BaseModelConfig.max_length

    # --- training (overrides for pretraining stage) ---
    max_length: int = BaseModelConfig.max_length
    mlm_probability: float = 0.15
    per_device_train_batch_size: int = BaseTrainingConfig.per_device_train_batch_size
    num_train_epochs: int = 3
    learning_rate: float = 5e-5
    weight_decay: float = BaseTrainingConfig.weight_decay
    warmup_ratio: float = 0.06
    max_steps: int = -1
    logging_steps: int = 50
    save_steps: int = 500
    seed: int = BaseModelConfig.seed

    # --- logging (from LoggingConfig) ---
    wandb_enabled: bool = LoggingConfig.wandb_enabled
    wandb_project: str = LoggingConfig.wandb_project
    wandb_entity: str | None = LoggingConfig.wandb_entity
    wandb_mode: str = LoggingConfig.wandb_mode
    wandb_run_name: str | None = LoggingConfig.wandb_run_name
    tensorboard_enabled: bool = LoggingConfig.tensorboard_enabled
    tensorboard_log_dir: str = LoggingConfig.tensorboard_log_dir

    def __post_init__(self) -> None:
        self.languages = [str(language).strip().lower() for language in self.languages]
        if not self.languages:
            raise ValueError("languages must contain at least one value")
        if self.max_length < 8:
            raise ValueError("max_length must be >= 8")
        if not (0.0 < self.mlm_probability < 1.0):
            raise ValueError("mlm_probability must be in (0, 1)")
        if self.per_device_train_batch_size < 1:
            raise ValueError("per_device_train_batch_size must be >= 1")
        if self.num_train_epochs < 1:
            raise ValueError("num_train_epochs must be >= 1")

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)

    @classmethod
    def from_dict(cls, value: Dict[str, Any]) -> "PretrainingConfig":
        return cls(**dict(value))

    def save(self, output_dir: str) -> Path:
        import json

        destination = Path(output_dir)
        destination.mkdir(parents=True, exist_ok=True)
        path = destination / "pretraining_config.json"
        path.write_text(json.dumps(self.to_dict(), indent=2), encoding="utf-8")
        return path
