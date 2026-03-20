"""Tests for training utilities."""

from __future__ import annotations

from pathlib import Path

from lilybert.data.preprocessor import AugmentationConfig
from lilybert.training.trainer import MLMPretrainer


def test_augmentation_config_parses_flags():
    config = AugmentationConfig.from_mapping(
        {
            "enable_transposition": True,
            "enable_absolute_relative": True,
            "enable_articulation_variants": True,
            "enable_barline_variants": False,
        }
    )

    assert config.enable_transposition is True
    assert config.enable_absolute_relative is True
    assert config.enable_articulation_variants is True
    assert config.enable_barline_variants is False


def test_count_corpus_tokens_includes_augmented_files(tmp_path: Path):
    (tmp_path / "piece_a.ly").write_text("c d e", encoding="utf-8")
    (tmp_path / "piece_a__transpose_plus2.ly").write_text("f g", encoding="utf-8")
    (tmp_path / "piece_b__absolute.ly").write_text("a b c d", encoding="utf-8")

    files = MLMPretrainer._collect_movement_files(
        data_dir=str(tmp_path),
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
