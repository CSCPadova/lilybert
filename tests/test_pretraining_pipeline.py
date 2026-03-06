"""Tests for pretraining utilities and unified train-task normalization."""

from __future__ import annotations

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


def test_ly_train_task_aliases():
    from lilybert.cli.ly_train import _normalize_task

    assert _normalize_task("composer") == "composer"
    assert _normalize_task("style") == "style"
    assert _normalize_task("instruments") == "instrument"
    assert _normalize_task("instrument") == "instrument"
    assert _normalize_task("musical_key") == "key_root"
    assert _normalize_task("key") == "key_root"


def test_count_corpus_tokens_includes_augmented_files(tmp_path: Path):
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
