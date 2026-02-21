"""Tests for hardened CLIs and cleaned public exports."""

from __future__ import annotations

import json
from pathlib import Path

import numpy as np
import pytest
from omegaconf import OmegaConf


def test_training_cli_runs_cv(monkeypatch, capsys, tmp_path):
    from lilybert.cli import train as training_cli

    class _DummyTrainer:
        def __init__(self, config):
            self.config = config

        def run(self):
            return {
                "task": self.config.task,
                "n_folds": self.config.n_folds,
                "mean": {"avg_score": 0.5},
                "std": {"avg_score": 0.0},
            }

    monkeypatch.setattr(training_cli, "StratifiedKFoldTrainer", _DummyTrainer)
    monkeypatch.setattr(
        "sys.argv",
        [
            "lilybert-train",
            "--task",
            "composer",
            "--data-dir",
            str(tmp_path),
            "--n-folds",
            "3",
        ],
    )

    training_cli.main()
    out = capsys.readouterr().out
    payload = json.loads(out)
    assert payload["task"] == "composer"
    assert payload["n_folds"] == 3


def test_evaluation_cli_reports_single_label_metrics(monkeypatch, capsys, tmp_path):
    from lilybert.cli import evaluate as eval_cli

    y_true = np.array([0, 1, 1, 0])
    y_pred = np.array([0, 1, 0, 0])

    y_true_path = tmp_path / "y_true.npy"
    y_pred_path = tmp_path / "y_pred.npy"
    np.save(y_true_path, y_true)
    np.save(y_pred_path, y_pred)

    monkeypatch.setattr(
        "sys.argv",
        [
            "lilybert-evaluate",
            "--y-true",
            str(y_true_path),
            "--y-pred",
            str(y_pred_path),
        ],
    )

    eval_cli.main()
    out = capsys.readouterr().out
    payload = json.loads(out)
    assert "accuracy" in payload
    assert "f1_macro" in payload


def test_run_experiment_script_module_exists(monkeypatch):
    from lilybert.cli import run_experiment

    called = {}

    class _DummyTrainer:
        def __init__(self, config):
            called["task"] = config.task

        def run(self):
            called["ran"] = True
            return {}

    monkeypatch.setattr(run_experiment, "StratifiedKFoldTrainer", _DummyTrainer)
    run_experiment.run_task(
        task="composer", data_dir="data/processed", tokenizer_path="artifacts/tokenizer"
    )
    assert called["task"] == "composer"
    assert called["ran"] is True


def test_run_experiment_hydra_config(monkeypatch):
    from lilybert.cli import run_experiment

    seen = []

    class _DummyTrainer:
        def __init__(self, config):
            seen.append(config)

        def run(self):
            return {"ok": True}

    monkeypatch.setattr(run_experiment, "StratifiedKFoldTrainer", _DummyTrainer)

    cfg = OmegaConf.create(
        {
            "dataset": {
                "data_dir": "data/processed",
                "tokenizer_path": "artifacts/tokenizer",
                "tokenizer_notation_mode": "english",
                "tokenizer_path_by_notation": {
                    "english": "artifacts/tokenizer_english",
                    "italiano": "artifacts/tokenizer_italiano",
                    "both": "artifacts/tokenizer",
                },
                "labels_path": "data/labels/labels_v1.json",
                "language": "english",
            },
            "model": {
                "pretrained_model": "bert-base-uncased",
                "mode": "full_finetune",
                "lora_r": 16,
                "lora_alpha": 32,
            },
            "training": {
                "n_folds": 3,
                "num_train_epochs": 2,
                "batch_size": 4,
                "learning_rate": 2e-5,
                "weight_decay": 0.01,
                "warmup_ratio": 0.1,
                "early_stopping_patience": 2,
                "max_length": 128,
                "stride": 64,
            },
            "runtime": {"output_dir": "outputs/experiments", "seed": 42},
            "tasks": {"list": ["composer", "key_scale"]},
        }
    )

    results = run_experiment.run_from_config(cfg)
    assert set(results.keys()) == {"composer", "key_scale"}
    assert len(seen) == 2
    assert seen[0].n_folds == 3
    assert seen[0].per_device_train_batch_size == 4
    assert seen[0].tokenizer_path == "artifacts/tokenizer_english"


def test_run_experiment_invalid_tokenizer_notation_mode(monkeypatch):
    from lilybert.cli import run_experiment

    class _DummyTrainer:
        def __init__(self, config):
            self.config = config

        def run(self):
            return {"ok": True}

    monkeypatch.setattr(run_experiment, "StratifiedKFoldTrainer", _DummyTrainer)

    cfg = OmegaConf.create(
        {
            "dataset": {
                "data_dir": "data/processed",
                "tokenizer_path": "artifacts/tokenizer",
                "tokenizer_notation_mode": "invalid",
                "labels_path": "data/labels/labels_v1.json",
                "language": "english",
            },
            "model": {"pretrained_model": "bert-base-uncased", "mode": "full_finetune"},
            "training": {"n_folds": 2, "num_train_epochs": 1, "batch_size": 2},
            "runtime": {"output_dir": "outputs/experiments", "seed": 42},
            "tasks": {"list": ["composer"]},
        }
    )

    with pytest.raises(ValueError, match="tokenizer_notation_mode"):
        run_experiment.run_from_config(cfg)


def test_generate_tables_creates_markdown_table(tmp_path):
    from lilybert.cli import generate_tables

    results = {
        "composer": {
            "mean": {
                "avg_top1_accuracy": 0.81,
                "avg_top5_accuracy": 0.95,
                "avg_f1_macro": 0.78,
                "avg_f1_weighted": 0.80,
            },
            "std": {
                "avg_top1_accuracy": 0.02,
                "avg_top5_accuracy": 0.01,
                "avg_f1_macro": 0.03,
                "avg_f1_weighted": 0.02,
            },
        },
        "instruments": {
            "mean": {
                "avg_f1_micro": 0.85,
                "avg_f1_macro": 0.72,
                "avg_subset_accuracy": 0.60,
                "avg_hamming_loss": 0.08,
            },
            "std": {
                "avg_f1_micro": 0.02,
                "avg_f1_macro": 0.03,
                "avg_subset_accuracy": 0.04,
                "avg_hamming_loss": 0.01,
            },
        },
    }
    input_path = tmp_path / "results.json"
    output_path = tmp_path / "table.md"
    input_path.write_text(json.dumps(results), encoding="utf-8")

    generate_tables.generate_markdown_table(input_path, output_path)
    text = output_path.read_text(encoding="utf-8")

    assert "Single-label" in text
    assert "Multi-label" in text
    assert "Composer" in text
    assert "Instruments" in text
    assert "Top-1 Acc" in text
    assert "Top-5 Acc" in text
    assert "F1 (micro)" in text


def test_generate_tables_creates_latex_table(tmp_path):
    from lilybert.cli import generate_tables

    results = {
        "composer": {
            "mean": {
                "avg_top1_accuracy": 0.81,
                "avg_top5_accuracy": 0.95,
                "avg_f1_macro": 0.78,
                "avg_f1_weighted": 0.80,
            },
            "std": {
                "avg_top1_accuracy": 0.02,
                "avg_top5_accuracy": 0.01,
                "avg_f1_macro": 0.03,
                "avg_f1_weighted": 0.02,
            },
        },
    }
    input_path = tmp_path / "results.json"
    output_path = tmp_path / "table.tex"
    input_path.write_text(json.dumps(results), encoding="utf-8")

    generate_tables.generate_latex_table(input_path, output_path)
    text = output_path.read_text(encoding="utf-8")

    assert r"\begin{table}" in text
    assert r"\toprule" in text
    assert "Composer" in text
    assert "Top-1 Acc" in text
    assert "Top-5 Acc" in text


def test_main_cli_dispatches_subcommand(monkeypatch):
    from lilybert import __main__ as main_cli

    captured = {}

    def _fake_run_experiment_main(argv=None):
        captured["argv"] = argv

    monkeypatch.setattr(
        "lilybert.cli.run_experiment.main", _fake_run_experiment_main
    )
    main_cli.main(["run-experiment", "--cfg", "job"])

    assert captured["argv"] == ["--cfg", "job"]


def test_main_cli_exposes_all_subcommands():
    from lilybert import __main__ as main_cli

    parser = main_cli.build_parser()
    help_text = parser.format_help()

    assert "upload-dataset" in help_text
    assert "upload-model" in help_text
    assert "generate-tables" in help_text
