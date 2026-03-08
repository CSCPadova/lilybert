"""Tests for parallel worker functions and unsharded tokenization."""

from __future__ import annotations

from pathlib import Path

import numpy as np
import pytest

from lilybert.cli.ly_preprocess import (
    _resolve_num_workers,
    _tokenize_file_worker,
    _tokenize_mlm_unsharded,
)
from lilybert.cli.pretokenize import _shard_file_worker
from lilybert.data.preprocessor import LilyPondPreprocessor
from lilybert.data.tokenizer import LilyPondTokenizer


@pytest.fixture()
def processed_dir(tmp_path: Path) -> Path:
    """Preprocess test .ly files into a temp directory."""
    tests_root = Path(__file__).parent
    input_dir = tests_root / "ly"
    out = tmp_path / "processed"
    preprocessor = LilyPondPreprocessor(
        strip_sections=["header", "version", "comments", "midi", "overrides"],
    )
    preprocessor.preprocess_to_dataset(
        input_dir=str(input_dir),
        output_dir=str(out),
        labels_path="data/labels/labels_v1.json",
        num_workers=2,
    )
    assert list(out.glob("*.ly")), "Preprocessing produced no .ly files"
    return out


@pytest.fixture()
def tokenizer_dir(tmp_path: Path, processed_dir: Path) -> Path:
    """Train a small BPE tokenizer on processed files."""
    out = tmp_path / "tokenizer"
    tok = LilyPondTokenizer()
    corpus = tok.build_corpus(str(processed_dir), num_workers=2)
    assert corpus, "build_corpus returned empty corpus"
    tok.train(corpus=corpus, vocab_size=512, min_frequency=0)
    tok.save(str(out))
    assert (out / "tokenizer.json").exists()
    return out


class TestResolveNumWorkers:
    def test_explicit_value(self):
        assert _resolve_num_workers(4) == 4

    def test_zero_auto(self):
        result = _resolve_num_workers(0)
        assert result >= 1


class TestTokenizeFileWorker:
    def test_produces_windows(self, processed_dir: Path, tokenizer_dir: Path):
        ly_file = next(processed_dir.glob("*.ly"))
        mid, ids_list, masks_list = _tokenize_file_worker(
            str(ly_file), str(tokenizer_dir), max_length=128, stride=64
        )
        assert mid == ly_file.stem
        assert len(ids_list) > 0
        assert len(ids_list) == len(masks_list)
        for ids, mask in zip(ids_list, masks_list):
            assert len(ids) == 128
            assert len(mask) == 128
            assert mask[0] == 1  # CLS position attended

    def test_empty_file_returns_empty(self, tmp_path: Path, tokenizer_dir: Path):
        empty_file = tmp_path / "empty.ly"
        empty_file.write_text("", encoding="utf-8")
        mid, ids_list, masks_list = _tokenize_file_worker(
            str(empty_file), str(tokenizer_dir), max_length=128, stride=64
        )
        assert mid == "empty"
        assert ids_list == []
        assert masks_list == []


class TestShardFileWorker:
    def test_produces_windows(self, processed_dir: Path, tokenizer_dir: Path):
        ly_file = next(processed_dir.glob("*.ly"))
        mid, ids_list, masks_list = _shard_file_worker(
            str(ly_file), str(tokenizer_dir), max_length=128, stride=64
        )
        assert mid == ly_file.stem
        assert len(ids_list) > 0
        assert len(ids_list) == len(masks_list)
        for ids, mask in zip(ids_list, masks_list):
            assert len(ids) == 128
            assert len(mask) == 128

    def test_empty_file_returns_empty(self, tmp_path: Path, tokenizer_dir: Path):
        empty_file = tmp_path / "empty.ly"
        empty_file.write_text("", encoding="utf-8")
        mid, ids_list, masks_list = _shard_file_worker(
            str(empty_file), str(tokenizer_dir), max_length=128, stride=64
        )
        assert mid == "empty"
        assert ids_list == []
        assert masks_list == []


class TestTokenizeMlmUnsharded:
    def test_produces_npz_splits(
        self, processed_dir: Path, tokenizer_dir: Path, tmp_path: Path
    ):
        output_dir = tmp_path / "tokenized"
        summary = _tokenize_mlm_unsharded(
            data_dir=str(processed_dir),
            tokenizer_path=str(tokenizer_dir),
            output_dir=str(output_dir),
            max_length=128,
            stride=64,
            eval_ratio=0.1,
            seed=42,
            num_workers=2,
        )
        assert "splits" in summary
        assert "train" in summary["splits"]
        assert "eval" in summary["splits"]

        for split in ("train", "eval"):
            info = summary["splits"][split]
            assert info["samples"] >= 0
            npz_path = Path(info["path"])
            assert npz_path.exists()
            data = np.load(npz_path, allow_pickle=True)
            assert "input_ids" in data
            assert "attention_mask" in data
            assert data["input_ids"].shape[1] == 128

    def test_no_files_raises(self, tmp_path: Path, tokenizer_dir: Path):
        empty_dir = tmp_path / "empty"
        empty_dir.mkdir()
        with pytest.raises(FileNotFoundError):
            _tokenize_mlm_unsharded(
                data_dir=str(empty_dir),
                tokenizer_path=str(tokenizer_dir),
                output_dir=str(tmp_path / "out"),
                max_length=128,
                stride=64,
                eval_ratio=0.1,
                seed=42,
                num_workers=1,
            )
