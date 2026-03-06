"""Tests for label encoder."""

from __future__ import annotations

import json
from pathlib import Path

import torch

from lilybert.data.label_encoder import LabelEncoder


def _write_sample_files(tmp_path: Path) -> tuple[Path, Path]:
    metadata = {
        "sample_work_mvt1": {
            "base_work": "sample_work",
            "movement_index": 1,
            "meta_key": "1: allegro_molto",
            "labels": {
                "composer": "Vivaldi",
                "style": "baroque",
                "midi_instruments": ["violin", "cello"],
                "meta": {"key": "re", "scale": "major"},
            },
        },
        "sample_work_mvt2": {
            "base_work": "sample_work",
            "movement_index": 2,
            "meta_key": "2: recitativo",
            "labels": {
                "composer": "Bach",
                "style": "baroque",
                "midi_instruments": ["oboe"],
                "meta": {"key": "mi", "scale": "minor"},
            },
        },
    }

    labels = {
        "sample_work_processed.ly": {
            "composer": "Vivaldi",
            "style": "baroque",
            "midi_instruments": ["violin", "cello"],
            "meta": {"1: allegro_molto": {"key": "re", "scale": "major"}},
        }
    }

    metadata_path = tmp_path / "metadata.json"
    labels_path = tmp_path / "labels_v1.json"
    metadata_path.write_text(json.dumps(metadata), encoding="utf-8")
    labels_path.write_text(json.dumps(labels), encoding="utf-8")
    return metadata_path, labels_path


def test_label_encoder_class_counts(tmp_path: Path):
    metadata_path, labels_path = _write_sample_files(tmp_path)
    encoder = LabelEncoder(metadata_path=metadata_path, labels_path=labels_path)

    assert encoder.get_num_classes("composer") >= 2
    assert encoder.get_num_classes("style") >= 1
    assert encoder.get_num_classes("instrument") >= 2
    assert encoder.get_num_classes("key_root") == 12


def test_label_encoder_encode_single_and_multi(tmp_path: Path):
    metadata_path, labels_path = _write_sample_files(tmp_path)
    encoder = LabelEncoder(metadata_path=metadata_path, labels_path=labels_path)

    composer_index = encoder.encode("composer", "Vivaldi")
    assert isinstance(composer_index, int)
    assert 0 <= composer_index < encoder.get_num_classes("composer")

    style_index = encoder.encode("style", "baroque")
    assert isinstance(style_index, int)

    key_root_index = encoder.encode("key_root", "re")
    assert isinstance(key_root_index, int)

    instrument_vector = encoder.encode("instrument", ["violin", "cello"])
    assert isinstance(instrument_vector, torch.Tensor)
    assert instrument_vector.shape[0] == encoder.get_num_classes("instrument")
    assert int(instrument_vector.sum().item()) == 2


def test_label_encoder_key_root_from_meta_record(tmp_path: Path):
    metadata_path, labels_path = _write_sample_files(tmp_path)
    encoder = LabelEncoder(metadata_path=metadata_path, labels_path=labels_path)

    movement = encoder.metadata["sample_work_mvt1"]
    key_root = encoder.get_key_root_label(movement)
    assert key_root == "re"
    encoded = encoder.encode("key_root", key_root)
    assert isinstance(encoded, int)
