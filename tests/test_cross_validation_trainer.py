"""Tests for grouped stratified cross-validation training."""

from __future__ import annotations

import json
from pathlib import Path

import torch
from torch import nn

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


class _TinyClassifier(nn.Module):
    def __init__(self, vocab_size: int, num_classes: int, multi_label: bool):
        super().__init__()
        self.embedding = nn.Embedding(vocab_size + 1200, 16)
        self.classifier = nn.Linear(16, num_classes)
        self.multi_label = multi_label

    def forward(self, input_ids, attention_mask, labels=None):
        embedded = self.embedding(input_ids)
        mask = attention_mask.unsqueeze(-1).float()
        pooled = (embedded * mask).sum(dim=1) / mask.sum(dim=1).clamp(min=1.0)
        logits = self.classifier(pooled)

        loss = None
        if labels is not None:
            if self.multi_label:
                loss = nn.BCEWithLogitsLoss()(logits, labels.float())
            else:
                loss = nn.CrossEntropyLoss()(logits, labels.long())
        return {"loss": loss, "logits": logits}


def _build_processed_dataset(tmp_path: Path) -> Path:
    processed = tmp_path / "processed"
    english = processed / "english"
    english.mkdir(parents=True, exist_ok=True)

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
        (english / f"{movement_id}.ly").write_text(
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

    config = TrainingConfig.for_quick_test()
    config.data_dir = str(processed)
    config.output_dir = str(output_dir)
    config.task = "composer"
    config.n_folds = 3
    config.max_length = 10
    config.stride = 4
    config.epochs = 1
    config.batch_size = 2
    config.per_device_train_batch_size = 2
    config.per_device_eval_batch_size = 2

    tokenizer = _FakeTokenizer()

    def model_factory(num_classes: int, multi_label: bool):
        return _TinyClassifier(
            vocab_size=64, num_classes=num_classes, multi_label=multi_label
        )

    trainer = StratifiedKFoldTrainer(
        config=config,
        tokenizer=tokenizer,
        model_factory=model_factory,
    )
    results = trainer.run()

    assert results["task"] == "composer"
    assert len(results["fold_metrics"]) == 3
    assert "mean" in results and "std" in results

    results_path = Path(results["results_path"])
    assert results_path.exists()
