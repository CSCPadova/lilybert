"""Tests for windowed classification dataset."""

from __future__ import annotations

from pathlib import Path

import torch

from lilybert.data.dataset import BaroqueMusicClassificationDataset


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


def _write_movements(tmp_path: Path) -> tuple[list[str], dict]:
    mvt1 = tmp_path / "sample_work_mvt1.ly"
    mvt2 = tmp_path / "sample_work_mvt2.ly"

    mvt1.write_text("a b c d e f g h i j", encoding="utf-8")
    mvt2.write_text("k l m n", encoding="utf-8")

    metadata = {
        "sample_work_mvt1": {
            "base_work": "sample_work",
            "labels": {
                "composer": "Vivaldi",
                "musical_form": ["concerto"],
                "midi_instruments": ["violin", "cello"],
                "meta": {"key": "re", "scale": "major"},
            },
            "section_nomenclature": "allegro_molto",
        },
        "sample_work_mvt2": {
            "base_work": "sample_work",
            "labels": {
                "composer": "Bach",
                "musical_form": ["cantata"],
                "midi_instruments": ["oboe"],
                "meta": {"key": "mi", "scale": "minor"},
            },
            "section_nomenclature": "recitativo",
        },
    }

    return [str(mvt1), str(mvt2)], metadata


def test_windowed_dataset_builds_overlapping_windows(tmp_path: Path):
    movement_files, metadata = _write_movements(tmp_path)
    tokenizer = _FakeTokenizer()

    dataset = BaroqueMusicClassificationDataset(
        movement_files=movement_files,
        metadata=metadata,
        tokenizer=tokenizer,
        max_length=6,
        stride=2,
        task="composer",
    )

    # mvt1 has 10 tokens and max body size is 4 -> starts at 0,2,4,6 => 4 windows
    # mvt2 has 4 tokens -> 1 window
    assert len(dataset) == 5

    first = dataset[0]
    assert set(first.keys()) == {
        "input_ids",
        "attention_mask",
        "label",
        "movement_id",
        "base_work",
    }
    assert first["input_ids"].shape[0] == 6
    assert first["attention_mask"].shape[0] == 6
    assert first["input_ids"][0].item() == tokenizer.cls_token_id
    assert first["input_ids"][5].item() == tokenizer.sep_token_id
    assert first["movement_id"] == "sample_work_mvt1"
    assert first["base_work"] == "sample_work"
    assert isinstance(first["label"], int)

    last = dataset[4]
    assert last["movement_id"] == "sample_work_mvt2"
    assert last["input_ids"][0].item() == tokenizer.cls_token_id
    assert last["attention_mask"].tolist() == [1, 1, 1, 1, 1, 1]


def test_dataset_multi_label_encoding_for_instruments(tmp_path: Path):
    movement_files, metadata = _write_movements(tmp_path)
    tokenizer = _FakeTokenizer()

    dataset = BaroqueMusicClassificationDataset(
        movement_files=movement_files,
        metadata=metadata,
        tokenizer=tokenizer,
        max_length=8,
        stride=4,
        task="instruments",
    )

    first = dataset[0]
    assert isinstance(first["label"], torch.Tensor)
    assert first["label"].dtype == torch.float32
    assert int(first["label"].sum().item()) == 2


def test_get_movement_ids_maps_window_index_to_movement(tmp_path: Path):
    movement_files, metadata = _write_movements(tmp_path)
    tokenizer = _FakeTokenizer()

    dataset = BaroqueMusicClassificationDataset(
        movement_files=movement_files,
        metadata=metadata,
        tokenizer=tokenizer,
        max_length=6,
        stride=2,
        task="composer",
    )

    movement_map = dataset.get_movement_ids()
    assert movement_map[0] == "sample_work_mvt1"
    assert movement_map[len(dataset) - 1] == "sample_work_mvt2"
    assert len(movement_map) == len(dataset)
