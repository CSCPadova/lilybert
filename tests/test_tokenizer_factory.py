"""Tests for the tokenizer factory utilities."""

import json
from pathlib import Path

import pytest

from lilybert.data.bbpe_tokenizer import BBPETokenizer, TOKENIZER_META_FILENAME
from lilybert.data.tokenizer import LilyPondTokenizer
from lilybert.data.tokenizer_factory import (
    create_tokenizer,
    get_tokenizer_type,
    load_tokenizer,
)

_LY_DIR = Path(__file__).parent / "ly"


class TestCreateTokenizer:
    def test_creates_musical(self):
        tok = create_tokenizer("musical")
        assert isinstance(tok, LilyPondTokenizer)

    def test_creates_bbpe(self):
        tok = create_tokenizer("bbpe")
        assert isinstance(tok, BBPETokenizer)

    def test_unknown_type_raises(self):
        with pytest.raises(ValueError, match="Unknown tokenizer type"):
            create_tokenizer("unknown")


class TestGetTokenizerType:
    def test_reads_bbpe_meta(self, tmp_path):
        meta = tmp_path / TOKENIZER_META_FILENAME
        meta.write_text(json.dumps({"type": "bbpe"}))
        assert get_tokenizer_type(tmp_path) == "bbpe"

    def test_reads_musical_meta(self, tmp_path):
        meta = tmp_path / TOKENIZER_META_FILENAME
        meta.write_text(json.dumps({"type": "musical"}))
        assert get_tokenizer_type(tmp_path) == "musical"

    def test_missing_meta_defaults_to_musical(self, tmp_path):
        assert get_tokenizer_type(tmp_path) == "musical"


class TestLoadTokenizer:
    @pytest.fixture()
    def saved_bbpe(self, tmp_path):
        """Train and save a minimal BBPE tokenizer."""
        tok = BBPETokenizer()
        tok.train(["c4 d4 e4 f4 g4 a4 b4"] * 10, vocab_size=100)
        save_dir = tmp_path / "bbpe"
        tok.save(save_dir)
        return save_dir

    @pytest.fixture()
    def saved_musical(self, tmp_path):
        """Train and save a minimal musical tokenizer."""
        tok = LilyPondTokenizer()
        corpus = []
        for f in sorted((_LY_DIR).glob("*.ly"))[:2]:
            text = f.read_text(encoding="utf-8", errors="ignore")
            line = tok._movement_to_parser_tokens(text)
            if line.strip():
                corpus.append(line)
        tok.train(corpus, vocab_size=500)
        save_dir = tmp_path / "musical"
        tok.save(save_dir)
        return save_dir

    def test_load_bbpe(self, saved_bbpe):
        tok = load_tokenizer(saved_bbpe)
        assert isinstance(tok, BBPETokenizer)
        assert tok.fast_tokenizer is not None

    def test_load_musical(self, saved_musical):
        tok = load_tokenizer(saved_musical)
        assert isinstance(tok, LilyPondTokenizer)
        assert tok.fast_tokenizer is not None

    def test_load_bbpe_encodes_correctly(self, saved_bbpe):
        tok = load_tokenizer(saved_bbpe)
        ids = tok.fast_tokenizer.encode("c4 d4", add_special_tokens=False)
        assert len(ids) > 0
