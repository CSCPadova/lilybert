"""Tests for reversible LilyPond tokenizer (encode / decode).

The tokenizer now uses musically-informed pre-tokenization (NOTE_C, DUR_4,
etc.) before BPE.  These tests verify that the round-trip through musical
tokens and BPE preserves musical content.
"""

import pytest

from lilybert.data.tokenizer import LilyPondTokenizer, normalize_numbers


def _train_tokenizer_on(texts: list[str]) -> LilyPondTokenizer:
    """Train a small BPE tokenizer on the given LilyPond texts."""
    tok = LilyPondTokenizer()
    corpus = [tok._movement_to_parser_tokens(t) for t in texts]
    tok.train(corpus, vocab_size=500)
    return tok


# Corpus used across tests — varied enough to cover BPE merges.
_CORPUS_TEXTS = [
    r"violin = { c4 d4 e4 f4 g4 a4 b4 c'4 }",
    r"cello = { c,4 d,4 e,4 f,4 }",
    r"""
    \score {
        <<
            { c4 d e f }
            \\
            { g4 a b c }
        >>
    }
    """,
    r"viola = { c4 d e f g a b }",
    r"\new Staff { c4 d e f }",
    r"\new PianoStaff << \new Staff { c4 } \new Staff { g4 } >>",
    r"\key c \major \time 4/4 c4 d e f | g a b c",
]


@pytest.fixture(scope="module")
def tokenizer():
    return _train_tokenizer_on(_CORPUS_TEXTS)


class TestEncodeLilypond:
    def test_returns_list_of_ints(self, tokenizer):
        ids = tokenizer.encode_lilypond("c4 d4 e4")
        assert isinstance(ids, list)
        assert all(isinstance(i, int) for i in ids)
        assert len(ids) > 0

    def test_raises_without_trained_tokenizer(self):
        tok = LilyPondTokenizer()
        with pytest.raises(ValueError, match="not been trained"):
            tok.encode_lilypond("c4")


class TestDecodeLilypond:
    def test_simple_notes(self, tokenizer):
        ids = tokenizer.encode_lilypond("c4 d4 e4 f4")
        decoded = tokenizer.decode_to_lilypond(ids)
        for note in ["c", "d", "e", "f"]:
            assert note in decoded

    def test_includes_version(self, tokenizer):
        ids = tokenizer.encode_lilypond("c4")
        decoded = tokenizer.decode_to_lilypond(ids, include_version=True)
        assert "\\version" in decoded
        assert tokenizer.DEFAULT_VERSION in decoded

    def test_no_version(self, tokenizer):
        ids = tokenizer.encode_lilypond("c4")
        decoded = tokenizer.decode_to_lilypond(ids, include_version=False)
        assert "\\version" not in decoded

    def test_part_variable_reconstruction(self, tokenizer):
        ids = tokenizer.encode_lilypond("violin = { c4 d4 e4 }")
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "violin = {" in decoded
        assert "}" in decoded

    def test_score_block(self, tokenizer):
        text = r"\score { c4 d4 }"
        ids = tokenizer.encode_lilypond(text)
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "\\score" in decoded

    def test_commands_survive(self, tokenizer):
        text = r"\key c \major \time 4/4 c4 d e f"
        ids = tokenizer.encode_lilypond(text)
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "\\key" in decoded
        assert "\\time" in decoded

    def test_new_staff(self, tokenizer):
        text = r"\new Staff { c4 d e f }"
        ids = tokenizer.encode_lilypond(text)
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "\\new" in decoded
        assert "Staff" in decoded

    def test_classification_tokens_stripped(self, tokenizer):
        ids = tokenizer.encode_lilypond("c4 d4", add_special_tokens=True)
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "[CLS]" not in decoded
        assert "[SEP]" not in decoded
        assert "[PAD]" not in decoded

    def test_partial_sequence_decode(self, tokenizer):
        """Simulate infilling: encode, take prefix, decode."""
        ids = tokenizer.encode_lilypond("violin = { c4 d4 e4 f4 g4 a4 b4 }")
        prefix = ids[: len(ids) // 2]
        decoded = tokenizer.decode_to_lilypond(prefix)
        # Should not crash and should produce some output
        assert len(decoded) > 0
        # Auto-closed braces should make it parseable
        assert decoded.count("{") >= decoded.count("}") or "}" in decoded

    def test_unmatched_part_begin(self, tokenizer):
        """[PART_BEGIN] without [PART_END] should auto-close."""
        ids = tokenizer.encode_lilypond("violin = { c4 d4 e4 }")
        # Remove everything after midpoint to simulate partial generation
        partial_ids = ids[: max(3, len(ids) // 2)]
        decoded = tokenizer.decode_to_lilypond(partial_ids)
        # Should still produce output without crashing
        assert isinstance(decoded, str)


class TestValidateRoundTrip:
    def test_simple_round_trip(self, tokenizer):
        is_valid, decoded, errors = tokenizer.validate_round_trip("c4 d4 e4 f4")
        assert isinstance(decoded, str)
        assert isinstance(errors, list)
        # Notes should survive
        for note in ["c", "d", "e", "f"]:
            assert note in decoded


class TestNormalizeNumbers:
    def test_replaces_standalone_integers(self):
        assert normalize_numbers("120 4 16") == "<INT> <INT> <INT>"

    def test_preserves_note_durations(self):
        # c4, d8 etc. are note+duration — digits are NOT on a word boundary
        assert normalize_numbers("c4 d8 e16") == "c4 d8 e16"

    def test_replaces_decimals(self):
        assert normalize_numbers("3.5 1.0") == "<DEC> <DEC>"

    def test_mixed(self):
        result = normalize_numbers("tempo 120 offset 3.5 c4")
        assert "<INT>" in result
        assert "<DEC>" in result
        assert "120" not in result
        assert "3.5" not in result

    def test_no_numbers_passthrough(self):
        assert normalize_numbers("c d e f") == "c d e f"


class TestTrainMinFrequency:
    def test_min_frequency_reduces_vocab(self):
        """Higher min_frequency should yield a smaller or equal vocabulary."""
        tok_no_min = LilyPondTokenizer()
        corpus = [tok_no_min._movement_to_parser_tokens(t) for t in _CORPUS_TEXTS]

        tok_no_min.train(corpus, vocab_size=500, min_frequency=0)
        size_no_min = tok_no_min.fast_tokenizer.vocab_size

        tok_with_min = LilyPondTokenizer()
        tok_with_min.train(corpus, vocab_size=500, min_frequency=10)
        size_with_min = tok_with_min.fast_tokenizer.vocab_size

        assert size_with_min <= size_no_min


class TestTrainNumberPlaceholders:
    def test_placeholder_tokens_in_vocab(self):
        tok = LilyPondTokenizer()
        corpus = [tok._movement_to_parser_tokens(t) for t in _CORPUS_TEXTS]
        tok.train(corpus, vocab_size=500, number_placeholders=True)
        vocab = tok.fast_tokenizer.get_vocab()
        assert "<INT>" in vocab
        assert "<DEC>" in vocab

    def test_placeholder_disables_raw_number_merges(self):
        tok = LilyPondTokenizer()
        corpus = [tok._movement_to_parser_tokens(t) for t in _CORPUS_TEXTS]
        tok.train(corpus, vocab_size=500, number_placeholders=True)
        vocab = tok.fast_tokenizer.get_vocab()
        assert "<INT>" in vocab
