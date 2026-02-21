"""Tests for Stage-1 pretraining and two-stage orchestration wiring."""

from __future__ import annotations

from omegaconf import OmegaConf
from pathlib import Path

from lilybert.data.preprocessor import AugmentationConfig
from lilybert.pretraining.trainer import MLMPretrainer


def test_augmentation_config_parses_flags_and_languages():
    config = AugmentationConfig.from_mapping(
        {
            "languages": ["italiano", "english", "nederlands"],
            "enable_transposition": True,
            "enable_absolute_relative": True,
            "enable_articulation_variants": True,
            "enable_barline_variants": False,
        }
    )

    assert config.languages == ["italiano", "english", "nederlands"]
    assert config.enable_transposition is True
    assert config.enable_absolute_relative is True
    assert config.enable_articulation_variants is True
    assert config.enable_barline_variants is False


def test_run_experiment_supports_two_stage_pipeline(monkeypatch):
    from lilybert.cli import run_experiment

    class _DummyPretrainer:
        def __init__(self, config):
            self.config = config

        def run(self):
            return {"model_dir": "outputs/pretraining/mlm_model", "num_files": 10}

    class _DummyTrainer:
        def __init__(self, config):
            self.config = config

        def run(self):
            return {"task": self.config.task, "mean": {"avg_accuracy": 0.5}}

    monkeypatch.setattr(run_experiment, "MLMPretrainer", _DummyPretrainer)
    monkeypatch.setattr(run_experiment, "StratifiedKFoldTrainer", _DummyTrainer)

    cfg = OmegaConf.create(
        {
            "pipeline": {"stage": "both"},
            "dataset": {
                "data_dir": "data/processed",
                "tokenizer_path": "artifacts/tokenizer",
                "tokenizer_notation_mode": "both",
                "labels_path": "data/labels/labels_v1.json",
                "language": "english",
            },
            "augmentation": {
                "languages": ["italiano", "english"],
                "enable_transposition": False,
                "enable_absolute_relative": False,
                "enable_articulation_variants": False,
                "enable_barline_variants": False,
            },
            "pretraining": {
                "prepare_data": False,
                "data_dir": "data/processed",
                "tokenizer_path": "artifacts/tokenizer",
                "output_dir": "outputs/pretraining",
                "languages": ["italiano", "english"],
                "model_architecture": "bert-base",
                "max_length": 64,
                "num_train_epochs": 1,
                "per_device_train_batch_size": 2,
            },
            "model": {
                "pretrained_model": "bert-base",
                "mode": "full_finetune",
                "lora_r": 16,
                "lora_alpha": 32,
            },
            "training": {
                "n_folds": 2,
                "num_train_epochs": 1,
                "batch_size": 2,
                "learning_rate": 2e-5,
                "weight_decay": 0.01,
                "warmup_ratio": 0.1,
                "early_stopping_patience": 2,
                "max_length": 128,
                "stride": 64,
                "eval_steps": 10,
                "log_steps": 10,
            },
            "runtime": {"output_dir": "outputs/experiments", "seed": 42},
            "tasks": {"list": ["composer"]},
        }
    )

    results = run_experiment.run_from_config(cfg)
    assert "stage1" in results
    assert "stage2" in results
    assert "composer" in results["stage2"]


def test_count_corpus_tokens_includes_augmented_mutopia_files(tmp_path: Path):
    italiano_dir = tmp_path / "italiano"
    english_dir = tmp_path / "english"
    italiano_dir.mkdir(parents=True)
    english_dir.mkdir(parents=True)

    (italiano_dir / "piece_a.ly").write_text("c d e", encoding="utf-8")
    (italiano_dir / "piece_a__transpose_plus2.ly").write_text("f g", encoding="utf-8")
    (english_dir / "piece_b__absolute.ly").write_text("a b c d", encoding="utf-8")

    files = MLMPretrainer._collect_movement_files(
        data_dir=str(tmp_path),
        languages=["italiano", "english"],
    )

    class _DummyTokenizer:
        def encode(self, text: str, add_special_tokens: bool = True):
            tokens = [token for token in text.split() if token]
            if add_special_tokens:
                return ["[CLS]"] + tokens + ["[SEP]"]
            return tokens

    stats = MLMPretrainer.count_corpus_tokens(files, _DummyTokenizer())

    assert stats["file_count"] == 3
    assert stats["total_tokens"] == 15
    assert stats["avg_tokens_per_file"] == 5.0
