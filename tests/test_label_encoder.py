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
            "section_nomenclature": "allegro_molto",
            "labels": {
                "composer": "Vivaldi",
                "musical_form": ["concerto", "opera"],
                "midi_instruments": ["violin", "cello"],
                "period": "Late Baroque",
                "meta": {"key": "re", "scale": "major"},
            },
        },
        "sample_work_mvt2": {
            "base_work": "sample_work",
            "movement_index": 2,
            "meta_key": "2: recitativo",
            "section_nomenclature": "recitativo",
            "labels": {
                "composer": "Bach",
                "musical_form": ["cantata"],
                "midi_instruments": ["oboe"],
                "period": "High Baroque",
                "meta": {"key": "mi", "scale": "minor"},
            },
        },
    }

    labels = {
        "sample_work_processed.ly": {
            "composer": "Vivaldi",
            "musical_form": ["concerto", "opera"],
            "midi_instruments": ["violin", "cello"],
            "meta": {"1: allegro_molto": {"key": "re", "scale": "major"}},
            "period": "Late Baroque",
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

    assert encoder.get_num_classes("composer") >= 60
    assert encoder.get_num_classes("musical_form") == 17
    assert encoder.get_num_classes("instruments") == 25
    assert encoder.get_num_classes("section_nomenclature") >= 40
    assert encoder.get_num_classes("key_scale") == 24


def test_label_encoder_encode_single_and_multi(tmp_path: Path):
    metadata_path, labels_path = _write_sample_files(tmp_path)
    encoder = LabelEncoder(metadata_path=metadata_path, labels_path=labels_path)

    composer_index = encoder.encode("composer", "Vivaldi")
    assert isinstance(composer_index, int)
    assert 0 <= composer_index < encoder.get_num_classes("composer")

    section_index = encoder.encode("section_nomenclature", "allegro_molto")
    assert isinstance(section_index, int)

    key_scale_index = encoder.encode("key_scale", "re_major")
    assert isinstance(key_scale_index, int)

    form_vector = encoder.encode("musical_form", ["concerto", "opera"])
    assert isinstance(form_vector, torch.Tensor)
    assert form_vector.dtype == torch.float32
    assert form_vector.shape[0] == encoder.get_num_classes("musical_form")
    assert int(form_vector.sum().item()) == 2

    instrument_vector = encoder.encode("instruments", ["violin", "cello"])
    assert isinstance(instrument_vector, torch.Tensor)
    assert instrument_vector.shape[0] == encoder.get_num_classes("instruments")
    assert int(instrument_vector.sum().item()) == 2


def test_label_encoder_key_scale_from_meta_record(tmp_path: Path):
    metadata_path, labels_path = _write_sample_files(tmp_path)
    encoder = LabelEncoder(metadata_path=metadata_path, labels_path=labels_path)

    movement = encoder.metadata["sample_work_mvt1"]
    key_scale = encoder.get_key_scale_label(movement)
    assert key_scale == "re_major"
    encoded = encoder.encode("key_scale", key_scale)
    assert isinstance(encoded, int)
