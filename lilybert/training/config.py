"""Training configuration for grouped stratified cross-validation."""

from __future__ import annotations

import json
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional

from lilybert.config import (
    BaseModelConfig,
    BaseTrainingConfig,
    LoggingConfig,
    PathConfig,
)


@dataclass
class TrainingConfig:
    """Configuration for grouped stratified cross-validation training.

    Default values for paths, model, and training hyper-parameters are
    inherited from ``lilybert.config`` so that there is a single source
    of truth.
    """

    # --- paths (from PathConfig) ---
    data_dir: str = PathConfig.data_dir
    labels_path: str = PathConfig.labels_path
    tokenizer_path: str = PathConfig.tokenizer_path
    output_dir: str = "outputs/cv"

    # --- model (from BaseModelConfig) ---
    pretrained_model: str = BaseModelConfig.pretrained_model
    task: str = "composer"
    max_length: int = BaseModelConfig.max_length
    stride: int = 256
    seed: int = BaseModelConfig.seed

    # --- training (from BaseTrainingConfig) ---
    learning_rate: float = BaseTrainingConfig.learning_rate
    num_train_epochs: int = BaseTrainingConfig.num_train_epochs
    per_device_train_batch_size: int = BaseTrainingConfig.per_device_train_batch_size
    per_device_eval_batch_size: int = BaseTrainingConfig.per_device_eval_batch_size
    weight_decay: float = BaseTrainingConfig.weight_decay
    warmup_ratio: float = BaseTrainingConfig.warmup_ratio

    lr_scheduler_type: str = "linear"
    grad_clip_norm: Optional[float] = 1.0
    early_stopping_patience: int = 5
    model_selection_metric: str = "auto"
    model_selection_mode: str = "auto"
    max_steps: int = 0
    eval_steps: int = 200
    log_steps: int = 20

    n_folds: int = 5

    pretokenized_path: Optional[str] = None
    sharded_data_dir: Optional[str] = None

    # --- distributed ---
    use_fsdp: bool = False
    fsdp_sharding_strategy: str = "FULL_SHARD"
    dataloader_num_workers: int = 0

    # --- logging (from LoggingConfig) ---
    wandb_enabled: bool = LoggingConfig.wandb_enabled
    wandb_project: str = LoggingConfig.wandb_project
    wandb_entity: Optional[str] = LoggingConfig.wandb_entity
    wandb_mode: str = LoggingConfig.wandb_mode
    wandb_run_name: Optional[str] = LoggingConfig.wandb_run_name
    tensorboard_enabled: bool = LoggingConfig.tensorboard_enabled
    tensorboard_log_dir: str = LoggingConfig.tensorboard_log_dir

    log_per_class_metrics: bool = True
    top_k: List[int] = field(default_factory=lambda: [1, 5])

    def __post_init__(self) -> None:
        self.num_train_epochs = int(self.num_train_epochs)
        self.per_device_train_batch_size = int(self.per_device_train_batch_size)
        self.per_device_eval_batch_size = int(self.per_device_eval_batch_size)
        self._validate_config()

    def _validate_config(self) -> None:
        if self.learning_rate <= 0:
            raise ValueError("learning_rate must be > 0")
        if self.num_train_epochs < 1:
            raise ValueError("num_train_epochs must be >= 1")
        if self.per_device_train_batch_size < 1:
            raise ValueError("per_device_train_batch_size must be >= 1")
        if self.n_folds < 2:
            raise ValueError("n_folds must be >= 2")
        if self.early_stopping_patience < 1:
            raise ValueError("early_stopping_patience must be >= 1")
        if self.warmup_ratio < 0 or self.warmup_ratio > 1:
            raise ValueError("warmup_ratio must be in [0, 1]")
        if self.grad_clip_norm is not None and self.grad_clip_norm <= 0:
            raise ValueError("grad_clip_norm must be > 0 when set")
        if self.model_selection_mode not in {"auto", "min", "max"}:
            raise ValueError("model_selection_mode must be one of: auto, min, max")
        if self.max_steps < 0:
            raise ValueError("max_steps must be >= 0")
        if self.eval_steps < 1:
            raise ValueError("eval_steps must be >= 1")
        if self.log_steps < 1:
            raise ValueError("log_steps must be >= 1")
        if not self.top_k or any(k < 1 for k in self.top_k):
            raise ValueError("top_k must be a non-empty list of positive integers")

    def save_pretrained(self, save_directory: str) -> None:
        save_path = Path(save_directory)
        save_path.mkdir(parents=True, exist_ok=True)
        config_path = save_path / "training_config.json"

        data = asdict(self)
        config_path.write_text(json.dumps(data, indent=2), encoding="utf-8")

    @classmethod
    def from_pretrained(cls, config_path: str) -> "TrainingConfig":
        path = Path(config_path)
        data: Dict[str, Any] = json.loads(path.read_text(encoding="utf-8"))
        # Drop legacy alias keys that no longer exist as fields
        for legacy_key in ("lr", "epochs", "batch_size", "mode", "lora_r", "lora_alpha", "use_lora"):
            data.pop(legacy_key, None)
        return cls(**data)

    @classmethod
    def for_quick_test(cls) -> "TrainingConfig":
        return cls(
            num_train_epochs=1,
            per_device_train_batch_size=2,
            per_device_eval_batch_size=2,
            n_folds=2,
            early_stopping_patience=2,
        )

    @classmethod
    def for_production(cls) -> "TrainingConfig":
        return cls(
            num_train_epochs=5,
            per_device_train_batch_size=8,
            per_device_eval_batch_size=8,
            n_folds=5,
            early_stopping_patience=5,
        )
