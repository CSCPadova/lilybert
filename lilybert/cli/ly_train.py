"""Model training entrypoint for MLM pretraining / finetuning."""

from __future__ import annotations

import json
from pathlib import Path

import hydra
from omegaconf import DictConfig, OmegaConf

from lilybert.training import MLMPretrainer, TrainingConfig

CONF_PATH = str(Path(__file__).resolve().parents[2] / "conf")


@hydra.main(version_base=None, config_path=CONF_PATH, config_name="train")
def _main(cfg: DictConfig) -> None:
    payload = OmegaConf.to_container(cfg, resolve=True)
    if not isinstance(payload, dict):
        raise TypeError("Invalid train config")

    train = dict(payload.get("train", payload))
    dataset = dict(payload.get("dataset", {}))
    model = dict(payload.get("model", {}))
    model_arch = dict(model.get("architecture", {}))
    runtime = dict(payload.get("runtime", {}))
    runtime_system = dict(runtime.get("system", {}))
    runtime_wandb = dict(runtime.get("wandb", {}))
    runtime_tensorboard = dict(runtime.get("tensorboard", {}))

    data_dir = str(dataset.get("processed_dir", "data/processed"))
    tokenizer_path = str(dataset.get("tokenizer_path", "artifacts/tokenizer"))
    output_dir = str(runtime.get("output_dir", "outputs/experiments"))
    seed = int(runtime.get("seed", 42))

    dataloader_num_workers = int(runtime_system.get("dataloader_num_workers", 0))

    wandb_enabled = bool(runtime_wandb.get("enabled", False))
    wandb_project = str(runtime_wandb.get("project", "lilybert"))
    wandb_entity = runtime_wandb.get("entity")
    wandb_mode = str(runtime_wandb.get("mode", "online"))
    wandb_run_name = runtime_wandb.get("run_name")

    tensorboard_enabled = bool(runtime_tensorboard.get("enabled", False))
    tensorboard_log_dir = str(runtime_tensorboard.get("log_dir", "outputs/tensorboard"))

    config = TrainingConfig(
        data_dir=data_dir,
        tokenizer_path=tokenizer_path,
        output_dir=output_dir,
        model_architecture=str(
            train.get("model_architecture", model_arch.get("name", "microsoft/codebert-base"))
        ),
        random_init=bool(train.get("random_init", False)),
        hidden_size=int(model_arch.get("hidden_size", 768)),
        num_hidden_layers=int(model_arch.get("num_hidden_layers", 12)),
        num_attention_heads=int(model_arch.get("num_attention_heads", 12)),
        intermediate_size=int(model_arch.get("intermediate_size", 3072)),
        max_position_embeddings=int(model_arch.get("max_position_embeddings", 2048)),
        max_length=int(train.get("max_length", 2048)),
        mlm_probability=float(train.get("mlm_probability", 0.15)),
        per_device_train_batch_size=int(train.get("per_device_train_batch_size", 16)),
        per_device_eval_batch_size=int(train.get("per_device_eval_batch_size", 16)),
        num_train_epochs=int(train.get("num_train_epochs", 3)),
        learning_rate=float(train.get("learning_rate", 2e-5)),
        lr_scheduler_type=str(train.get("lr_scheduler_type", "cosine")),
        max_grad_norm=float(train.get("grad_clip_norm", 1.0)),
        weight_decay=float(train.get("weight_decay", 0.01)),
        warmup_ratio=float(train.get("warmup_ratio", 0.1)),
        max_steps=int(train.get("max_steps", -1)),
        logging_steps=int(train.get("logging_steps", 50)),
        eval_steps=int(train.get("eval_steps", 200)),
        save_steps=int(train.get("save_steps", 500)),
        pretokenized_shards_dir=dataset.get("pretokenized_shards_dir"),
        resume_from_checkpoint=train.get("resume_from_checkpoint"),
        dataloader_num_workers=dataloader_num_workers,
        wandb_enabled=wandb_enabled,
        wandb_project=wandb_project,
        wandb_entity=wandb_entity,
        wandb_mode=wandb_mode,
        wandb_run_name=wandb_run_name,
        tensorboard_enabled=tensorboard_enabled,
        tensorboard_log_dir=tensorboard_log_dir,
        seed=seed,
    )
    summary = MLMPretrainer(config=config).run()
    print(json.dumps(summary, indent=2, ensure_ascii=False))


def main() -> None:
    _main()
