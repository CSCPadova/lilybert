"""Unified model training entrypoint.

`train.mode=pretrain` runs MLM pretraining.
`train.mode=classify` runs frozen-embedding linear probing with sklearn.
"""

from __future__ import annotations

import json
from pathlib import Path

import hydra
from omegaconf import DictConfig, OmegaConf

from lilybert.pretraining import MLMPretrainer, PretrainingConfig
from lilybert.training import StratifiedKFoldTrainer, TrainingConfig

CONF_PATH = str(Path(__file__).resolve().parents[2] / "conf")


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


@hydra.main(version_base=None, config_path=CONF_PATH, config_name="train")
def _main(cfg: DictConfig) -> None:
    payload = OmegaConf.to_container(cfg, resolve=True)
    if not isinstance(payload, dict):
        raise TypeError("Invalid train config")

    train = dict(payload.get("train", payload))

    mode = str(train.get("mode", payload.get("stage", "classify")))
    task = _normalize_task(str(train.get("task", payload.get("task", "composer"))))

    dataset = dict(payload.get("dataset", {}))
    model = dict(payload.get("model", {}))
    model_arch = dict(model.get("architecture", {}))
    classify = dict(train.get("classify", payload.get("training", {})))
    pretrain = dict(train.get("pretrain", payload.get("pretraining", {})))
    runtime = dict(payload.get("runtime", {}))
    runtime_system = dict(runtime.get("system", {}))
    runtime_wandb = dict(runtime.get("wandb", {}))
    runtime_tensorboard = dict(runtime.get("tensorboard", {}))

    data_dir = str(dataset.get("processed_dir", "data/processed"))
    labels_path = str(dataset.get("labels_path", "data/labels/labels_v1.json"))
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

    if mode == "pretrain":
        pretrain_config = PretrainingConfig(
            data_dir=data_dir,
            tokenizer_path=tokenizer_path,
            output_dir=output_dir,
            model_architecture=str(
                pretrain.get("model_architecture", model_arch.get("name", "bert-base"))
            ),
            hidden_size=int(model_arch.get("hidden_size", 768)),
            num_hidden_layers=int(model_arch.get("num_hidden_layers", 12)),
            num_attention_heads=int(model_arch.get("num_attention_heads", 12)),
            intermediate_size=int(model_arch.get("intermediate_size", 3072)),
            max_position_embeddings=int(
                model_arch.get("max_position_embeddings", 2048)
            ),
            max_length=int(pretrain.get("max_length", 2048)),
            mlm_probability=float(pretrain.get("mlm_probability", 0.15)),
            per_device_train_batch_size=int(
                pretrain.get("per_device_train_batch_size", 16)
            ),
            per_device_eval_batch_size=int(
                pretrain.get("per_device_eval_batch_size", 16)
            ),
            num_train_epochs=int(pretrain.get("num_train_epochs", 3)),
            learning_rate=float(pretrain.get("learning_rate", 2e-5)),
            lr_scheduler_type=str(pretrain.get("lr_scheduler_type", "cosine")),
            max_grad_norm=float(pretrain.get("grad_clip_norm", 1.0)),
            weight_decay=float(pretrain.get("weight_decay", 0.01)),
            warmup_ratio=float(pretrain.get("warmup_ratio", 0.1)),
            max_steps=int(pretrain.get("max_steps", -1)),
            logging_steps=int(pretrain.get("logging_steps", 50)),
            eval_steps=int(pretrain.get("eval_steps", 200)),
            save_steps=int(pretrain.get("save_steps", 500)),
            pretokenized_shards_dir=dataset.get("pretokenized_shards_dir"),
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
        summary = MLMPretrainer(config=pretrain_config).run()
        print(json.dumps(summary, indent=2, ensure_ascii=False))
        return

    if mode != "classify":
        raise ValueError("Unsupported train.mode. Expected one of: classify, pretrain")

    train_config = TrainingConfig(
        data_dir=data_dir,
        labels_path=labels_path,
        tokenizer_path=tokenizer_path,
        output_dir=output_dir,
        pretrained_model=str(model.get("pretrained_model", "bert-base")),
        task=task,
        max_length=int(classify.get("max_length", 2048)),
        stride=int(classify.get("stride", 256)),
        seed=seed,
        probe_max_iter=int(classify.get("probe_max_iter", 2000)),
        probe_c=float(classify.get("probe_c", 1.0)),
        probe_class_weight=classify.get("probe_class_weight"),
        n_folds=int(classify.get("n_folds", 5)),
        dataloader_num_workers=dataloader_num_workers,
        wandb_enabled=wandb_enabled,
        wandb_project=wandb_project,
        wandb_entity=wandb_entity,
        wandb_mode=wandb_mode,
        wandb_run_name=wandb_run_name,
        tensorboard_enabled=tensorboard_enabled,
        tensorboard_log_dir=tensorboard_log_dir,
        top_k=classify.get("top_k") or [1, 5],
    )
    results = StratifiedKFoldTrainer(config=train_config).run()
    print(json.dumps(results, indent=2, ensure_ascii=False))


def main() -> None:
    _main()
