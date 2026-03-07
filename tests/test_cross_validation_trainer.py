"""Tests for grouped stratified CV linear-probing trainer."""

from __future__ import annotations

import json
from pathlib import Path

from transformers import BertConfig, BertModel

from lilybert.training import StratifiedKFoldTrainer, TrainingConfig
from lilybert.training.cross_validation import build_grouped_stratified_folds


class _FakeTokenizer:
    def __init__(self):
        self.cls_token_id = 101
        self.sep_token_id = 102
        self.pad_token_id = 0
        self._vocab = {}
        self._next_id = 1000

    def encode(self, text: str, add_special_tokens: bool = False):
        del add_special_tokens
        ids = []
        for token in text.split():
            if token not in self._vocab:
                self._vocab[token] = self._next_id
                self._next_id += 1
            ids.append(self._vocab[token])
        return ids


def _create_tiny_hf_encoder(tmp_path: Path) -> str:
    out_dir = tmp_path / "tiny_hf_encoder"
    model = BertModel(
        BertConfig(
            vocab_size=4096,
            hidden_size=64,
            num_hidden_layers=2,
            num_attention_heads=4,
            intermediate_size=128,
        )
    )
    model.save_pretrained(out_dir)
    return str(out_dir)


def _build_processed_dataset(tmp_path: Path) -> Path:
    processed = tmp_path / "processed"
    processed.mkdir(parents=True, exist_ok=True)

    metadata = {}
    rows = [
        ("work_a_mvt1", "work_a", "Vivaldi"),
        ("work_a_mvt2", "work_a", "Vivaldi"),
        ("work_b_mvt1", "work_b", "Bach"),
        ("work_b_mvt2", "work_b", "Bach"),
        ("work_c_mvt1", "work_c", "Handel"),
        ("work_c_mvt2", "work_c", "Handel"),
    ]

    for movement_id, base_work, composer in rows:
        (processed / f"{movement_id}.ly").write_text(
            "a b c d e f g a b c", encoding="utf-8"
        )
        metadata[movement_id] = {
            "base_work": base_work,
            "labels": {
                "composer": composer,
                "musical_form": ["concerto"],
                "midi_instruments": ["violin"],
                "meta": {"key": "re", "scale": "major"},
            },
            "section_nomenclature": "allegro",
        }

    (processed / "metadata.json").write_text(
        json.dumps(metadata, indent=2), encoding="utf-8"
    )
    return processed


def test_grouped_stratified_folds_prevent_base_work_leakage():
    sample_ids = [
        "work_a_mvt1",
        "work_a_mvt2",
        "work_b_mvt1",
        "work_b_mvt2",
        "work_c_mvt1",
        "work_c_mvt2",
    ]
    labels = ["vivaldi", "vivaldi", "bach", "bach", "handel", "handel"]
    groups = ["work_a", "work_a", "work_b", "work_b", "work_c", "work_c"]

    folds = build_grouped_stratified_folds(
        sample_ids=sample_ids,
        labels=labels,
        groups=groups,
        n_splits=3,
        seed=42,
    )

    assert len(folds) == 3
    for fold in folds:
        train_groups = {groups[sample_ids.index(m)] for m in fold["train_ids"]}
        val_groups = {groups[sample_ids.index(m)] for m in fold["val_ids"]}
        assert train_groups.isdisjoint(val_groups)


def test_stratified_kfold_trainer_run_writes_results(tmp_path: Path):
    processed = _build_processed_dataset(tmp_path)
    output_dir = tmp_path / "cv_outputs"
    pretrained_model = _create_tiny_hf_encoder(tmp_path)
    tokenizer = _FakeTokenizer()

    config = TrainingConfig.for_quick_test()
    config.data_dir = str(processed)
    config.output_dir = str(output_dir)
    config.task = "composer"
    config.pretrained_model = pretrained_model
    config.n_folds = 3
    config.max_length = 10
    config.stride = 4

    trainer = StratifiedKFoldTrainer(config=config, tokenizer=tokenizer)
    results = trainer.run()

    assert results["task"] == "composer"
    assert results["mode"] == "linear_probe"
    assert len(results["fold_metrics"]) == 3
    assert "mean" in results and "std" in results

    for fold_metrics in results["fold_metrics"]:
        assert fold_metrics["best_selection_metric"] == "avg_accuracy"
        assert fold_metrics["best_selection_mode"] == "max"
        assert "best_selection_value" in fold_metrics
        assert "best_selection_step" in fold_metrics

    results_path = Path(results["results_path"])
    assert results_path.exists()

    for fold_idx in range(1, config.n_folds + 1):
        checkpoint_dir = output_dir / "checkpoints" / f"fold_{fold_idx}" / "best"
        assert checkpoint_dir.exists()
        assert (checkpoint_dir / "probe.pkl").exists()
        assert (checkpoint_dir / "config.json").exists()
        assert (checkpoint_dir / "label_map.json").exists()
