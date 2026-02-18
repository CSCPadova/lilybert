"""Training configuration for grouped stratified cross-validation."""

from __future__ import annotations

import json
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any, Dict, Optional

from lilybert.models import TrainingMode


@dataclass
class TrainingConfig:
    """Configuration for grouped stratified cross-validation training."""

    pretrained_model: str = "bert-base-uncased"
    mode: TrainingMode = TrainingMode.FULL_FINETUNE
    task: str = "composer"
    data_dir: str = "data/processed"
    labels_path: str = "labels/labels_v1.json"
    tokenizer_path: str = "artifacts/tokenizer"

    max_length: int = 512
    stride: int = 256

    learning_rate: float = 2e-5
    lr: Optional[float] = None
    epochs: int = 20
    num_train_epochs: int = 20
    batch_size: int = 16
    per_device_train_batch_size: int = 16
    per_device_eval_batch_size: int = 16
    weight_decay: float = 0.01
    warmup_ratio: float = 0.1
    early_stopping_patience: int = 5
    max_steps: int = 0
    eval_steps: int = 200
    log_steps: int = 20

    lora_r: int = 16
    lora_alpha: int = 32
    n_folds: int = 5
    seed: int = 42

    output_dir: str = "outputs/cv"
    language: str = "english"
    wandb_enabled: bool = False
    wandb_project: str = "lilybert"
    wandb_entity: Optional[str] = None
    wandb_mode: str = "online"
    wandb_run_name: Optional[str] = None

    # Legacy compatibility knobs retained for existing tests/transition
    use_lora: bool = True

    def __post_init__(self) -> None:
        if self.lr is not None:
            self.learning_rate = float(self.lr)
        self.num_train_epochs = int(self.num_train_epochs)
        self.epochs = int(
            self.epochs if self.epochs is not None else self.num_train_epochs
        )
        self.batch_size = int(
            self.batch_size
            if self.batch_size is not None
            else self.per_device_train_batch_size
        )
        self.per_device_train_batch_size = int(
            self.per_device_train_batch_size
            if self.per_device_train_batch_size is not None
            else self.batch_size
        )
        self.per_device_eval_batch_size = int(
            self.per_device_eval_batch_size
            if self.per_device_eval_batch_size is not None
            else self.per_device_train_batch_size
        )
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
        if self.max_steps < 0:
            raise ValueError("max_steps must be >= 0")
        if self.eval_steps < 1:
            raise ValueError("eval_steps must be >= 1")
        if self.log_steps < 1:
            raise ValueError("log_steps must be >= 1")

    def save_pretrained(self, save_directory: str) -> None:
        save_path = Path(save_directory)
        save_path.mkdir(parents=True, exist_ok=True)
        config_path = save_path / "training_config.json"

        data = asdict(self)
        data["mode"] = (
            self.mode.value if isinstance(self.mode, TrainingMode) else str(self.mode)
        )
        config_path.write_text(json.dumps(data, indent=2), encoding="utf-8")

    @classmethod
    def from_pretrained(cls, config_path: str) -> "TrainingConfig":
        path = Path(config_path)
        data: Dict[str, Any] = json.loads(path.read_text(encoding="utf-8"))
        if "mode" in data:
            mode_value = str(data["mode"])
            if mode_value.startswith("TrainingMode."):
                mode_value = mode_value.split(".", 1)[1].lower()
            data["mode"] = TrainingMode(mode_value)
        return cls(**data)

    @classmethod
    def for_quick_test(cls) -> "TrainingConfig":
        return cls(
            num_train_epochs=1,
            epochs=1,
            per_device_train_batch_size=2,
            per_device_eval_batch_size=2,
            batch_size=2,
            n_folds=2,
            early_stopping_patience=2,
        )

    @classmethod
    def for_production(cls) -> "TrainingConfig":
        return cls(
            num_train_epochs=5,
            epochs=5,
            per_device_train_batch_size=8,
            per_device_eval_batch_size=8,
            batch_size=8,
            n_folds=5,
            early_stopping_patience=5,
        )
