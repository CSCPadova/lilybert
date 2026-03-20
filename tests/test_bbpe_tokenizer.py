"""End-to-end tests for the byte-level BPE tokenizer."""

import json
from pathlib import Path

import pytest

from lilybert.data.bbpe_tokenizer import BBPETokenizer, TOKENIZER_META_FILENAME

_LY_DIR = Path(__file__).parent / "ly"


def _collect_ly_texts() -> list[str]:
    """Read all .ly files from the test directory."""
    files = sorted(_LY_DIR.glob("*.ly"))
    assert len(files) > 0, f"No .ly files found in {_LY_DIR}"
    return [f.read_text(encoding="utf-8", errors="ignore") for f in files]


@pytest.fixture(scope="module")
def trained_tokenizer():
    """Train a BBPE tokenizer on all test .ly files."""
    tok = BBPETokenizer()
    corpus = _collect_ly_texts()
    tok.train(corpus, vocab_size=500)
    return tok


class TestBBPETokenizer:
    def test_train_produces_tokenizer(self, trained_tokenizer):
        assert trained_tokenizer.fast_tokenizer is not None
        assert trained_tokenizer.fast_tokenizer.vocab_size > 0

    def test_vocab_size_respected(self, trained_tokenizer):
        assert trained_tokenizer.fast_tokenizer.vocab_size <= 500

    def test_special_tokens_present(self, trained_tokenizer):
        vocab = trained_tokenizer.fast_tokenizer.get_vocab()
        for token in BBPETokenizer.SPECIAL_TOKENS:
            assert token in vocab, f"Missing special token: {token!r}"

    def test_encode_raw_lilypond(self, trained_tokenizer):
        text = r"\version \"2.24.0\" { c4 d8 e4 f2 }"
        ids = trained_tokenizer.fast_tokenizer.encode(text, add_special_tokens=False)
        assert len(ids) > 0

    def test_encode_decode_roundtrip(self, trained_tokenizer):
        text = "c4 d8 e4 f2 g1"
        ids = trained_tokenizer.fast_tokenizer.encode(text, add_special_tokens=False)
        decoded = trained_tokenizer.fast_tokenizer.decode(ids)
        assert "c4" in decoded
        assert "g1" in decoded

    def test_encode_real_ly_file(self, trained_tokenizer):
        texts = _collect_ly_texts()
        ids = trained_tokenizer.fast_tokenizer.encode(
            texts[0], add_special_tokens=False
        )
        assert len(ids) > 0, "Real .ly file should produce tokens"

    def test_no_unk_for_ascii(self, trained_tokenizer):
        """Byte-level BPE should not produce UNK for normal ASCII text."""
        text = "c4 d4 e4 f4"
        unk_id = trained_tokenizer.fast_tokenizer.unk_token_id
        ids = trained_tokenizer.fast_tokenizer.encode(text, add_special_tokens=False)
        assert unk_id not in ids, "Byte-level BPE should not produce UNK for ASCII"

    def test_save_and_load(self, trained_tokenizer, tmp_path):
        save_dir = tmp_path / "bbpe_tokenizer"
        trained_tokenizer.save(save_dir)
        loaded = BBPETokenizer.load(save_dir)
        assert loaded.fast_tokenizer is not None

        text = "c4 d4 e4"
        original_ids = trained_tokenizer.fast_tokenizer.encode(
            text, add_special_tokens=False
        )
        loaded_ids = loaded.fast_tokenizer.encode(text, add_special_tokens=False)
        assert original_ids == loaded_ids

    def test_metadata_written(self, trained_tokenizer, tmp_path):
        save_dir = tmp_path / "bbpe_meta"
        trained_tokenizer.save(save_dir)
        meta_path = save_dir / TOKENIZER_META_FILENAME
        assert meta_path.exists()
        meta = json.loads(meta_path.read_text())
        assert meta["type"] == "bbpe"

    def test_build_corpus(self, tmp_path):
        """build_corpus reads raw .ly files."""
        ly_dir = tmp_path / "corpus"
        ly_dir.mkdir()
        (ly_dir / "test.ly").write_text("c4 d4 e4 f4", encoding="utf-8")
        tok = BBPETokenizer()
        corpus = tok.build_corpus(ly_dir, num_workers=1)
        assert len(corpus) == 1
        assert "c4" in corpus[0]

    def test_train_empty_corpus_raises(self):
        tok = BBPETokenizer()
        with pytest.raises(ValueError, match="empty corpus"):
            tok.train([], vocab_size=100)

    def test_save_before_train_raises(self, tmp_path):
        tok = BBPETokenizer()
        with pytest.raises(ValueError, match="not been trained"):
            tok.save(tmp_path / "nope")
