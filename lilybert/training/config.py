"""Training configuration for grouped stratified cross-validation."""

from __future__ import annotations

import json
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional

from lilybert.config import (
    BaseModelConfig,
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

    # --- probing model (sklearn linear probe) ---
    probe_max_iter: int = 2000
    probe_c: float = 1.0
    probe_class_weight: Optional[str] = None

    n_folds: int = 5

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
        self.probe_max_iter = int(self.probe_max_iter)
        self._validate_config()

    def _validate_config(self) -> None:
        if self.n_folds < 2:
            raise ValueError("n_folds must be >= 2")
        if self.probe_max_iter < 1:
            raise ValueError("probe_max_iter must be >= 1")
        if self.probe_c <= 0:
            raise ValueError("probe_c must be > 0")
        if self.probe_class_weight not in {None, "balanced"}:
            raise ValueError("probe_class_weight must be null or 'balanced'")
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
        for legacy_key in (
            "lr",
            "epochs",
            "batch_size",
            "mode",
            "lora_r",
            "lora_alpha",
            "use_lora",
        ):
            data.pop(legacy_key, None)
        return cls(**data)

    @classmethod
    def for_quick_test(cls) -> "TrainingConfig":
        return cls(
            n_folds=2,
            max_length=256,
            stride=64,
            probe_max_iter=200,
        )

    @classmethod
    def for_production(cls) -> "TrainingConfig":
        return cls(
            n_folds=5,
            max_length=2048,
            stride=256,
            probe_max_iter=2000,
        )
