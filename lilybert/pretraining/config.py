"""Configuration for Stage-1 MLM pretraining."""

from __future__ import annotations

from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Any, Dict, List


@dataclass
class PretrainingConfig:
    """Configuration values for LilyPond MLM pretraining."""

    data_dir: str = "data/processed"
    tokenizer_path: str = "artifacts/tokenizer"
    output_dir: str = "outputs/pretraining"
    languages: List[str] = field(default_factory=lambda: ["italiano", "english"])

    model_architecture: str = "bert-base"
    hidden_size: int = 768
    num_hidden_layers: int = 12
    num_attention_heads: int = 12
    intermediate_size: int = 3072
    max_position_embeddings: int = 512

    max_length: int = 512
    mlm_probability: float = 0.15
    per_device_train_batch_size: int = 16
    num_train_epochs: int = 3
    learning_rate: float = 5e-5
    weight_decay: float = 0.01
    warmup_ratio: float = 0.06
    max_steps: int = -1
    logging_steps: int = 50
    save_steps: int = 500
    seed: int = 42

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
