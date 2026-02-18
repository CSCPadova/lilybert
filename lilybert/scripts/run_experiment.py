"""Run classification CV experiments across tasks."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any, Dict, Sequence

import hydra
from omegaconf import DictConfig, OmegaConf

from lilybert.models import TrainingMode
from lilybert.training import StratifiedKFoldTrainer, TrainingConfig


def _normalize_mode(value: Any) -> TrainingMode:
    if isinstance(value, TrainingMode):
        return value
    if isinstance(value, str):
        return TrainingMode(value.lower())
    raise ValueError(f"Unsupported mode value: {value!r}")


def run_task(
    task: str,
    data_dir: str,
    tokenizer_path: str,
    output_dir: str = "outputs/experiments",
    training_overrides: Dict[str, Any] | None = None,
):
    task_output = Path(output_dir) / task
    training_overrides = dict(training_overrides or {})
    if "mode" in training_overrides:
        training_overrides["mode"] = _normalize_mode(training_overrides["mode"])

    config = TrainingConfig(
        task=task,
        data_dir=data_dir,
        tokenizer_path=tokenizer_path,
        output_dir=str(task_output),
        **training_overrides,
    )
    trainer = StratifiedKFoldTrainer(config=config)
    return trainer.run()


def run_from_config(cfg: DictConfig) -> Dict[str, Any]:
    dataset_cfg = cfg.get("dataset", {})
    model_cfg = cfg.get("model", {})
    training_cfg = cfg.get("training", {})
    runtime_cfg = cfg.get("runtime", {})
    tasks_cfg = cfg.get("tasks", {})

    tasks = list(tasks_cfg.get("list", ["composer"]))
    training_overrides = {
        "pretrained_model": model_cfg.get("pretrained_model", "bert-base-uncased"),
        "mode": model_cfg.get("mode", "full_finetune"),
        "lora_r": model_cfg.get("lora_r", 16),
        "lora_alpha": model_cfg.get("lora_alpha", 32),
        "labels_path": dataset_cfg.get("labels_path", "labels/labels_v1.json"),
        "language": dataset_cfg.get("language", "english"),
        "n_folds": training_cfg.get("n_folds", 5),
        "num_train_epochs": training_cfg.get("num_train_epochs", 20),
        "epochs": training_cfg.get("num_train_epochs", 20),
        "batch_size": training_cfg.get("batch_size", 16),
        "per_device_train_batch_size": training_cfg.get("batch_size", 16),
        "per_device_eval_batch_size": training_cfg.get("batch_size", 16),
        "learning_rate": training_cfg.get("learning_rate", 2e-5),
        "weight_decay": training_cfg.get("weight_decay", 0.01),
        "warmup_ratio": training_cfg.get("warmup_ratio", 0.1),
        "early_stopping_patience": training_cfg.get("early_stopping_patience", 5),
        "max_length": training_cfg.get("max_length", 512),
        "stride": training_cfg.get("stride", 256),
        "seed": runtime_cfg.get("seed", 42),
    }

    results = {}
    for task in tasks:
        results[task] = run_task(
            task=task,
            data_dir=dataset_cfg.get("data_dir", "data/processed"),
            tokenizer_path=dataset_cfg.get("tokenizer_path", "artifacts/tokenizer"),
            output_dir=runtime_cfg.get("output_dir", "outputs/experiments"),
            training_overrides=training_overrides,
        )
    return results


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Run cross-validated experiments from Hydra YAML configuration"
    )
    parser.add_argument(
        "--config-dir",
        default="conf",
        help="Path to Hydra config directory (root-level by default)",
    )
    parser.add_argument(
        "--config-name",
        default="experiment",
        help="Hydra config name",
    )
    parser.add_argument(
        "--cfg",
        choices=["job"],
        default=None,
        help="Print composed config and exit",
    )
    return parser


def _resolve_config_dir(config_dir: str) -> Path:
    path = Path(config_dir)
    if path.is_absolute():
        return path.resolve()

    cwd_candidate = (Path.cwd() / path).resolve()
    if cwd_candidate.exists():
        return cwd_candidate

    project_candidate = (Path(__file__).resolve().parents[2] / path).resolve()
    return project_candidate


def load_config(
    config_dir: str = "conf",
    config_name: str = "experiment",
    overrides: Sequence[str] | None = None,
) -> DictConfig:
    resolved_dir = _resolve_config_dir(config_dir)
    if not resolved_dir.exists():
        raise FileNotFoundError(f"Hydra config directory not found: {resolved_dir}")

    with hydra.initialize_config_dir(version_base=None, config_dir=str(resolved_dir)):
        return hydra.compose(config_name=config_name, overrides=list(overrides or []))


def main(argv: Sequence[str] | None = None) -> None:
    parser = build_parser()
    args, overrides = parser.parse_known_args(argv)

    cfg = load_config(
        config_dir=args.config_dir,
        config_name=args.config_name,
        overrides=overrides,
    )

    if args.cfg == "job":
        print(OmegaConf.to_yaml(cfg))
        return

    results = run_from_config(cfg)
    print(json.dumps(results, indent=2, ensure_ascii=False))
