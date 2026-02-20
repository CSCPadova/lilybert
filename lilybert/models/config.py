"""Configuration dataclass for lilyBERT classification experiments."""

from __future__ import annotations

from dataclasses import dataclass

from .bert_classifier import TrainingMode


@dataclass
class LilyBERTConfig:
    """Model/training configuration container for lilyBERT phases 6-7."""

    pretrained_model: str = "bert-base"
    mode: TrainingMode = TrainingMode.FULL_FINETUNE
    task: str = "composer"
    data_dir: str = "data/processed"
    labels_path: str = "labels/labels_v1.json"
    tokenizer_path: str = "artifacts/tokenizer"

    max_length: int = 512
    stride: int = 256
    lr: float = 2e-5
    epochs: int = 20
    batch_size: int = 16
    weight_decay: float = 0.01
    warmup_ratio: float = 0.1
    early_stopping_patience: int = 5

    lora_r: int = 16
    lora_alpha: int = 32
    n_folds: int = 5
    seed: int = 42
