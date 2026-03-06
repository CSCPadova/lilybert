"""Tests for simplified ly-* CLI module surface."""

from __future__ import annotations

import json

import numpy as np


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
        "instrument": {
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


def test_ly_evaluate_writes_metrics(tmp_path, capsys):
    from lilybert.cli.ly_evaluate import _main
    from omegaconf import OmegaConf

    y_true = np.array([0, 1, 1, 0])
    y_pred = np.array([0, 1, 0, 0])

    y_true_path = tmp_path / "y_true.npy"
    y_pred_path = tmp_path / "y_pred.npy"
    np.save(y_true_path, y_true)
    np.save(y_pred_path, y_pred)

    _main(OmegaConf.create({"y_true": str(y_true_path), "y_pred": str(y_pred_path), "multi_label": False}))
    payload = json.loads(capsys.readouterr().out)

    assert "accuracy" in payload
    assert "f1_macro" in payload


def test_legacy_main_points_to_ly_entrypoints():
    from lilybert import __main__ as main_mod

    try:
        main_mod.main()
    except SystemExit as exc:
        message = str(exc)
        assert "ly-preprocess" in message
        assert "ly-train" in message
        assert "ly-probe" in message
        assert "ly-predict" in message
        assert "ly-evaluate" in message
