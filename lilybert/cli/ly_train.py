"""Unified model training entrypoint.

`stage=pretrain` runs MLM pretraining.
`stage=classify` runs classification training / fine-tuning.
"""

from __future__ import annotations

import json
from dataclasses import dataclass

import hydra
from omegaconf import DictConfig, OmegaConf

from lilybert.pretraining import MLMPretrainer, PretrainingConfig
from lilybert.training import StratifiedKFoldTrainer, TrainingConfig


@dataclass
class TrainConfig:
    stage: str = "classify"

    task: str = "composer"
    data_dir: str = "data/processed"
    labels_path: str = "data/labels/labels_v1.json"
    tokenizer_path: str = "artifacts/tokenizer"
    output_dir: str = "outputs/cv"
    n_folds: int = 5
    max_length: int = 512
    stride: int = 256
    learning_rate: float = 2e-5
    num_train_epochs: int = 20
    per_device_train_batch_size: int = 16
    per_device_eval_batch_size: int = 16
    weight_decay: float = 0.01
    warmup_ratio: float = 0.1
    max_steps: int = 0
    eval_steps: int = 200
    log_steps: int = 20
    lr_scheduler_type: str = "linear"
    grad_clip_norm: float = 1.0
    early_stopping_patience: int = 5
    model_selection_metric: str = "auto"
    model_selection_mode: str = "auto"
    top_k: list[int] = None

    pretrained_model: str = "bert-base"
    pretokenized_path: str | None = None
    sharded_data_dir: str | None = None
    use_fsdp: bool = False
    fsdp_sharding_strategy: str = "FULL_SHARD"
    dataloader_num_workers: int = 0

    wandb_enabled: bool = False
    wandb_project: str = "lilybert"
    wandb_entity: str | None = None
    wandb_mode: str = "online"
    wandb_run_name: str | None = None
    tensorboard_enabled: bool = False
    tensorboard_log_dir: str = "outputs/tensorboard"

    pretraining_languages: list[str] | None = None  # deprecated, kept for config compat
    mlm_probability: float = 0.15
    model_architecture: str = "bert-base"
    hidden_size: int = 768
    num_hidden_layers: int = 12
    num_attention_heads: int = 12
    intermediate_size: int = 3072
    max_position_embeddings: int = 512
    save_steps: int = 500
    logging_steps: int = 50
    pretokenized_shards_dir: str | None = None
    seed: int = 42


def _normalize_task(task: str) -> str:
    aliases = {
        "instrument": "instrument",
        "instruments": "instrument",
        "musical_key": "key_root",
        "key": "key_root",
        "key_root": "key_root",
        "style": "style",
        "composer": "composer",
    }
    normalized = aliases.get(task.lower())
    if normalized is None:
        raise ValueError(
            "Unsupported task. Expected one of: composer, style, instrument, key_root"
        )
    return normalized


@hydra.main(version_base=None, config_path="../../conf", config_name="train")
def _main(cfg: DictConfig) -> None:
    payload = OmegaConf.to_container(cfg, resolve=True)
    if not isinstance(payload, dict):
        raise TypeError("Invalid train config")

    config = TrainConfig(**payload)

    if config.stage == "pretrain":
        pretrain_config = PretrainingConfig(
            data_dir=config.data_dir,
            tokenizer_path=config.tokenizer_path,
            output_dir=config.output_dir,
            model_architecture=config.model_architecture,
            hidden_size=config.hidden_size,
            num_hidden_layers=config.num_hidden_layers,
            num_attention_heads=config.num_attention_heads,
            intermediate_size=config.intermediate_size,
            max_position_embeddings=config.max_position_embeddings,
            max_length=config.max_length,
            mlm_probability=config.mlm_probability,
            per_device_train_batch_size=config.per_device_train_batch_size,
            num_train_epochs=config.num_train_epochs,
            learning_rate=config.learning_rate,
            weight_decay=config.weight_decay,
            warmup_ratio=config.warmup_ratio,
            max_steps=config.max_steps,
            logging_steps=config.logging_steps,
            save_steps=config.save_steps,
            pretokenized_shards_dir=config.pretokenized_shards_dir,
            dataloader_num_workers=config.dataloader_num_workers,
            wandb_enabled=config.wandb_enabled,
            wandb_project=config.wandb_project,
            wandb_entity=config.wandb_entity,
            wandb_mode=config.wandb_mode,
            wandb_run_name=config.wandb_run_name,
            tensorboard_enabled=config.tensorboard_enabled,
            tensorboard_log_dir=config.tensorboard_log_dir,
            seed=config.seed,
        )
        summary = MLMPretrainer(config=pretrain_config).run()
        print(json.dumps(summary, indent=2, ensure_ascii=False))
        return

    task = _normalize_task(config.task)
    train_config = TrainingConfig(
        data_dir=config.data_dir,
        labels_path=config.labels_path,
        tokenizer_path=config.tokenizer_path,
        output_dir=config.output_dir,
        pretrained_model=config.pretrained_model,
        task=task,
        max_length=config.max_length,
        stride=config.stride,
        seed=config.seed,
        learning_rate=config.learning_rate,
        num_train_epochs=config.num_train_epochs,
        per_device_train_batch_size=config.per_device_train_batch_size,
        per_device_eval_batch_size=config.per_device_eval_batch_size,
        weight_decay=config.weight_decay,
        warmup_ratio=config.warmup_ratio,
        lr_scheduler_type=config.lr_scheduler_type,
        grad_clip_norm=config.grad_clip_norm,
        early_stopping_patience=config.early_stopping_patience,
        model_selection_metric=config.model_selection_metric,
        model_selection_mode=config.model_selection_mode,
        max_steps=config.max_steps,
        eval_steps=config.eval_steps,
        log_steps=config.log_steps,
        n_folds=config.n_folds,
        pretokenized_path=config.pretokenized_path,
        sharded_data_dir=config.sharded_data_dir,
        use_fsdp=config.use_fsdp,
        fsdp_sharding_strategy=config.fsdp_sharding_strategy,
        dataloader_num_workers=config.dataloader_num_workers,
        wandb_enabled=config.wandb_enabled,
        wandb_project=config.wandb_project,
        wandb_entity=config.wandb_entity,
        wandb_mode=config.wandb_mode,
        wandb_run_name=config.wandb_run_name,
        tensorboard_enabled=config.tensorboard_enabled,
        tensorboard_log_dir=config.tensorboard_log_dir,
        top_k=config.top_k or [1, 5],
    )
    results = StratifiedKFoldTrainer(config=train_config).run()
    print(json.dumps(results, indent=2, ensure_ascii=False))


def main() -> None:
    _main()
