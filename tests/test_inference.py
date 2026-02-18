"""Tests for inference pipeline and CLI."""

from __future__ import annotations

from pathlib import Path
from typing import Dict, List

import pytest
import torch

from lilybert.inference.pipeline import InferenceDataset, InferencePipeline


class _FakeTokenizer:
    def __init__(self):
        self.cls_token_id = 101
        self.sep_token_id = 102
        self.pad_token_id = 0
        self._vocab: Dict[str, int] = {}
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


class _FakeModel(torch.nn.Module):
    """Returns fixed logits for testing."""

    def __init__(self, num_classes: int = 3):
        super().__init__()
        self.num_classes = num_classes
        self._linear = torch.nn.Linear(1, 1)  # minimal param for .to() compat

    def forward(self, input_ids, attention_mask, labels=None):
        batch_size = input_ids.shape[0]
        logits = torch.zeros(batch_size, self.num_classes)
        logits[:, 0] = 2.0  # class 0 always wins
        return {"logits": logits}


def _write_movements(tmp_path: Path) -> List[str]:
    mvt1 = tmp_path / "piece_mvt1.ly"
    mvt2 = tmp_path / "piece_mvt2.ly"
    mvt1.write_text("a b c d e f g h i j", encoding="utf-8")
    mvt2.write_text("k l m n", encoding="utf-8")
    return [str(mvt1), str(mvt2)]


# --- InferenceDataset tests ---


def test_inference_dataset_builds_windows(tmp_path: Path):
    files = _write_movements(tmp_path)
    tokenizer = _FakeTokenizer()

    dataset = InferenceDataset(
        movement_files=files,
        tokenizer=tokenizer,
        max_length=6,
        stride=2,
    )

    # mvt1: 10 tokens, body_size=4, step=2 -> windows at 0,2,4,6 => 4
    # mvt2: 4 tokens -> 1 window
    assert len(dataset) == 5

    sample = dataset[0]
    assert set(sample.keys()) == {"input_ids", "attention_mask", "movement_id"}
    assert sample["input_ids"].shape[0] == 6
    assert sample["attention_mask"].shape[0] == 6
    assert sample["input_ids"][0].item() == tokenizer.cls_token_id
    assert sample["input_ids"][5].item() == tokenizer.sep_token_id
    assert sample["movement_id"] == "piece_mvt1"

    last = dataset[4]
    assert last["movement_id"] == "piece_mvt2"


def test_inference_dataset_no_labels(tmp_path: Path):
    files = _write_movements(tmp_path)
    tokenizer = _FakeTokenizer()
    dataset = InferenceDataset(
        movement_files=files, tokenizer=tokenizer, max_length=8, stride=4
    )
    for i in range(len(dataset)):
        assert "label" not in dataset[i]


def test_inference_dataset_rejects_small_max_length(tmp_path: Path):
    files = _write_movements(tmp_path)
    tokenizer = _FakeTokenizer()
    with pytest.raises(ValueError, match="max_length must be >= 3"):
        InferenceDataset(movement_files=files, tokenizer=tokenizer, max_length=2)


# --- InferencePipeline tests ---


def test_pipeline_predict_files(tmp_path: Path):
    files = _write_movements(tmp_path)
    tokenizer = _FakeTokenizer()
    model = _FakeModel(num_classes=3)

    pipeline = InferencePipeline(
        model=model,
        tokenizer=tokenizer,
        task="composer",
        max_length=6,
        stride=2,
        device="cpu",
        label_map={0: "Bach", 1: "Vivaldi", 2: "Mozart"},
    )

    results = pipeline.predict_files(file_paths=files, batch_size=4)

    assert len(results) == 2
    ids = {r["movement_id"] for r in results}
    assert ids == {"piece_mvt1", "piece_mvt2"}

    for r in results:
        assert r["prediction"] == 0
        assert r["label"] == "Bach"
        assert r["num_windows"] >= 1


def test_pipeline_predict_directory(tmp_path: Path):
    lang_dir = tmp_path / "english"
    lang_dir.mkdir()
    (lang_dir / "mvt1.ly").write_text("a b c d", encoding="utf-8")

    tokenizer = _FakeTokenizer()
    model = _FakeModel(num_classes=2)

    pipeline = InferencePipeline(
        model=model,
        tokenizer=tokenizer,
        task="composer",
        max_length=8,
        stride=4,
        device="cpu",
    )

    results = pipeline.predict_directory(
        input_dir=str(tmp_path), language="english", batch_size=4
    )
    assert len(results) == 1
    assert results[0]["movement_id"] == "mvt1"


def test_pipeline_predict_directory_missing_raises(tmp_path: Path):
    tokenizer = _FakeTokenizer()
    model = _FakeModel()
    pipeline = InferencePipeline(model=model, tokenizer=tokenizer, device="cpu")
    with pytest.raises(FileNotFoundError):
        pipeline.predict_directory(
            input_dir=str(tmp_path / "nonexistent"), language="english"
        )


def test_pipeline_majority_aggregation(tmp_path: Path):
    files = _write_movements(tmp_path)
    tokenizer = _FakeTokenizer()
    model = _FakeModel(num_classes=3)

    pipeline = InferencePipeline(
        model=model,
        tokenizer=tokenizer,
        task="composer",
        max_length=6,
        stride=2,
        aggregation_method="majority",
        device="cpu",
    )

    results = pipeline.predict_files(file_paths=files, batch_size=4)
    assert len(results) == 2
    for r in results:
        assert r["prediction"] == 0


# --- CLI tests ---


def test_cli_build_parser():
    from lilybert.inference.cli import build_parser

    parser = build_parser()
    args = parser.parse_args(["--checkpoint", "/tmp/ckpt", "--input-dir", "/tmp/data"])
    assert args.checkpoint == "/tmp/ckpt"
    assert args.input_dir == "/tmp/data"
    assert args.task == "composer"
    assert args.format == "json"
    assert args.aggregation == "average"
