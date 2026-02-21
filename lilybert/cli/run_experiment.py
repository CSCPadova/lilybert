"""Run classification CV experiments across tasks."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any, Dict, Sequence

import hydra
from omegaconf import DictConfig, OmegaConf

from lilybert.data import LilyPondPreprocessor
from lilybert.models import TrainingMode
from lilybert.pretraining import MLMPretrainer, PretrainingConfig
from lilybert.training import StratifiedKFoldTrainer, TrainingConfig

SUPPORTED_TASKS = {
    "composer",
    "musical_form",
    "instruments",
    "section_nomenclature",
    "key_scale",
}

SUPPORTED_TOKENIZER_NOTATION_MODES = {"english", "italiano", "both"}


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


def _resolve_tokenizer_path(dataset_cfg: DictConfig) -> str:
    notation_mode = str(dataset_cfg.get("tokenizer_notation_mode", "both"))
    if notation_mode not in SUPPORTED_TOKENIZER_NOTATION_MODES:
        raise ValueError(
            "Unknown tokenizer_notation_mode: "
            f"{notation_mode}. Supported values: {sorted(SUPPORTED_TOKENIZER_NOTATION_MODES)}"
        )

    mode_map = dataset_cfg.get("tokenizer_path_by_notation", {})
    if mode_map and notation_mode in mode_map:
        return str(mode_map[notation_mode])

    return str(dataset_cfg.get("tokenizer_path", "artifacts/tokenizer"))


def run_from_config(cfg: DictConfig) -> Dict[str, Any]:
    dataset_cfg = cfg.get("dataset", {})
    model_cfg = cfg.get("model", {})
    training_cfg = cfg.get("training", {})
    pretraining_cfg = cfg.get("pretraining", {})
    augmentation_cfg = cfg.get("augmentation", {})
    runtime_cfg = cfg.get("runtime", {})
    tasks_cfg = cfg.get("tasks", {})
    stage_cfg = cfg.get("pipeline", {})

    stage = str(stage_cfg.get("stage", "stage2")).lower()
    if stage not in {"stage1", "stage2", "both"}:
        raise ValueError("pipeline.stage must be one of: stage1, stage2, both")

    outputs: Dict[str, Any] = {}

    if stage in {"stage1", "both"}:
        stage1_languages = list(
            pretraining_cfg.get(
                "languages",
                augmentation_cfg.get("languages", dataset_cfg.get("languages", [])),
            )
        )
        stage1_data_dir = str(
            pretraining_cfg.get(
                "data_dir", dataset_cfg.get("data_dir", "data/processed")
            )
        )
        if bool(pretraining_cfg.get("prepare_data", False)):
            preprocessor = LilyPondPreprocessor(
                augmentation_config={
                    "languages": stage1_languages,
                    "enable_transposition": bool(
                        augmentation_cfg.get("enable_transposition", False)
                    ),
                    "enable_absolute_relative": bool(
                        augmentation_cfg.get("enable_absolute_relative", False)
                    ),
                    "enable_articulation_variants": bool(
                        augmentation_cfg.get("enable_articulation_variants", False)
                    ),
                    "enable_barline_variants": bool(
                        augmentation_cfg.get("enable_barline_variants", False)
                    ),
                    "include_original": True,
                }
            )
            preprocessor.preprocess_to_dataset(
                input_dir=str(pretraining_cfg.get("raw_input_dir", "data/raw")),
                output_dir=stage1_data_dir,
                labels_path=str(
                    pretraining_cfg.get("labels_path", "data/labels/labels_v1.json")
                ),
            )

        pretrain_config = PretrainingConfig(
            data_dir=stage1_data_dir,
            tokenizer_path=str(
                pretraining_cfg.get(
                    "tokenizer_path",
                    _resolve_tokenizer_path(dataset_cfg),
                )
            ),
            output_dir=str(pretraining_cfg.get("output_dir", "outputs/pretraining")),
            languages=stage1_languages,
            model_architecture=str(
                pretraining_cfg.get("model_architecture", "bert-base")
            ),
            hidden_size=int(pretraining_cfg.get("hidden_size", 768)),
            num_hidden_layers=int(pretraining_cfg.get("num_hidden_layers", 12)),
            num_attention_heads=int(pretraining_cfg.get("num_attention_heads", 12)),
            intermediate_size=int(pretraining_cfg.get("intermediate_size", 3072)),
            max_position_embeddings=int(
                pretraining_cfg.get("max_position_embeddings", 512)
            ),
            max_length=int(pretraining_cfg.get("max_length", 512)),
            mlm_probability=float(pretraining_cfg.get("mlm_probability", 0.15)),
            per_device_train_batch_size=int(
                pretraining_cfg.get("per_device_train_batch_size", 16)
            ),
            num_train_epochs=int(pretraining_cfg.get("num_train_epochs", 3)),
            learning_rate=float(pretraining_cfg.get("learning_rate", 5e-5)),
            weight_decay=float(pretraining_cfg.get("weight_decay", 0.01)),
            warmup_ratio=float(pretraining_cfg.get("warmup_ratio", 0.06)),
            max_steps=int(pretraining_cfg.get("max_steps", 0)),
            logging_steps=int(pretraining_cfg.get("logging_steps", 50)),
            save_steps=int(pretraining_cfg.get("save_steps", 500)),
            seed=int(runtime_cfg.get("seed", pretraining_cfg.get("seed", 42))),
        )
        outputs["stage1"] = MLMPretrainer(pretrain_config).run()

    if stage == "stage1":
        return outputs

    if OmegaConf.is_list(tasks_cfg) or isinstance(tasks_cfg, (list, tuple)):
        tasks = list(tasks_cfg)
    else:
        tasks = list(tasks_cfg.get("list", ["composer"]))
    invalid_tasks = [task for task in tasks if task not in SUPPORTED_TASKS]
    if invalid_tasks:
        raise ValueError(
            f"Unknown task(s): {invalid_tasks}. Supported tasks: {sorted(SUPPORTED_TASKS)}"
        )

    wandb_cfg = runtime_cfg.get("wandb", {})
    tokenizer_path = _resolve_tokenizer_path(dataset_cfg)
    if stage == "both":
        pretrained_from_stage1 = outputs["stage1"].get("model_dir")
        if pretrained_from_stage1:
            model_cfg = {**dict(model_cfg), "pretrained_model": pretrained_from_stage1}

    training_overrides = {
        "pretrained_model": model_cfg.get("pretrained_model", "bert-base"),
        "mode": model_cfg.get("mode", "full_finetune"),
        "lora_r": model_cfg.get("lora_r", 16),
        "lora_alpha": model_cfg.get("lora_alpha", 32),
        "labels_path": dataset_cfg.get("labels_path", "data/labels/labels_v1.json"),
        "language": dataset_cfg.get("language", "english"),
        "pretokenized_path": dataset_cfg.get("pretokenized_path", None),
        "n_folds": training_cfg.get("n_folds", 5),
        "num_train_epochs": training_cfg.get("num_train_epochs", 20),
        "max_steps": training_cfg.get("max_steps", 0),
        "eval_steps": training_cfg.get("eval_steps", 200),
        "log_steps": training_cfg.get("log_steps", 20),
        "per_device_train_batch_size": training_cfg.get(
            "per_device_train_batch_size", training_cfg.get("batch_size", 16)
        ),
        "per_device_eval_batch_size": training_cfg.get(
            "per_device_train_batch_size", training_cfg.get("batch_size", 16)
        ),
        "learning_rate": training_cfg.get("learning_rate", 2e-5),
        "weight_decay": training_cfg.get("weight_decay", 0.01),
        "warmup_ratio": training_cfg.get("warmup_ratio", 0.1),
        "lr_scheduler_type": training_cfg.get("lr_scheduler_type", "linear"),
        "grad_clip_norm": training_cfg.get("grad_clip_norm", 1.0),
        "early_stopping_patience": training_cfg.get("early_stopping_patience", 5),
        "model_selection_metric": training_cfg.get("model_selection_metric", "auto"),
        "model_selection_mode": training_cfg.get("model_selection_mode", "auto"),
        "max_length": training_cfg.get("max_length", 512),
        "stride": training_cfg.get("stride", 256),
        "seed": runtime_cfg.get("seed", 42),
        "wandb_enabled": wandb_cfg.get("enabled", False),
        "wandb_project": wandb_cfg.get("project", "lilybert"),
        "wandb_entity": wandb_cfg.get("entity", None),
        "wandb_mode": wandb_cfg.get("mode", "online"),
        "wandb_run_name": wandb_cfg.get("run_name", None),
        "log_per_class_metrics": training_cfg.get("log_per_class_metrics", True),
        "top_k": list(training_cfg.get("top_k", [1, 5])),
    }

    modes_cfg = cfg.get("modes", None)
    if modes_cfg:
        modes = [_normalize_mode(m) for m in modes_cfg]
    else:
        modes = [_normalize_mode(model_cfg.get("mode", "full_finetune"))]

    results = {}
    base_output_dir = runtime_cfg.get("output_dir", "outputs/experiments")
    for mode in modes:
        mode_overrides = {**training_overrides, "mode": mode}
        mode_key = mode.value
        results[mode_key] = {}
        for task in tasks:
            print(f"\n{'='*60}")
            print(f"Running: mode={mode_key}, task={task}")
            print(f"{'='*60}")
            mode_output_dir = str(Path(base_output_dir) / mode_key)
            results[mode_key][task] = run_task(
                task=task,
                data_dir=dataset_cfg.get("data_dir", "data/processed"),
                tokenizer_path=tokenizer_path,
                output_dir=mode_output_dir,
                training_overrides=mode_overrides,
            )

    if len(modes) == 1:
        results = results[modes[0].value]

    if stage == "both":
        outputs["stage2"] = results
        return outputs

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
