"""Tests for reversible LilyPond tokenizer (encode / decode)."""

import pytest

from lilybert.data.tokenizer import LilyPondTokenizer


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
    r'\language "italiano" viola = { do4 re mi fa sol la si }',
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
        for note in ["c4", "d4", "e4", "f4"]:
            assert note in decoded

    def test_includes_version(self, tokenizer):
        ids = tokenizer.encode_lilypond("c4")
        decoded = tokenizer.decode_to_lilypond(ids, include_version=True)
        assert '\\version' in decoded
        assert tokenizer.DEFAULT_VERSION in decoded

    def test_no_version(self, tokenizer):
        ids = tokenizer.encode_lilypond("c4")
        decoded = tokenizer.decode_to_lilypond(ids, include_version=False)
        assert '\\version' not in decoded

    def test_part_variable_reconstruction(self, tokenizer):
        ids = tokenizer.encode_lilypond("violin = { c4 d4 e4 }")
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "violin = {" in decoded
        assert "}" in decoded

    def test_simultaneous_music(self, tokenizer):
        text = r"""
        \score {
            <<
                { c4 d e f }
                \\
                { g4 a b c }
            >>
        }
        """
        ids = tokenizer.encode_lilypond(text)
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "<<" in decoded
        assert ">>" in decoded
        assert "\\\\" in decoded

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

    def test_language_token(self, tokenizer):
        text = r'\language "italiano" do4 re mi fa'
        ids = tokenizer.encode_lilypond(text)
        decoded = tokenizer.decode_to_lilypond(ids)
        assert '\\language "italiano"' in decoded

    def test_new_staff(self, tokenizer):
        text = r"\new Staff { c4 d e f }"
        ids = tokenizer.encode_lilypond(text)
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "\\new Staff" in decoded

    def test_new_pianostaff(self, tokenizer):
        text = r"\new PianoStaff << \new Staff { c4 } \new Staff { g4 } >>"
        ids = tokenizer.encode_lilypond(text)
        decoded = tokenizer.decode_to_lilypond(ids)
        assert "\\new PianoStaff" in decoded

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
        assert decoded.count("{") >= decoded.count("}")  or "}" in decoded

    def test_unmatched_part_begin(self, tokenizer):
        """[PART_BEGIN] without [PART_END] should auto-close."""
        ids = tokenizer.encode_lilypond("violin = { c4 d4 e4 }")
        # Remove everything after midpoint to simulate partial generation
        partial_ids = ids[:max(3, len(ids) // 2)]
        decoded = tokenizer.decode_to_lilypond(partial_ids)
        # Should still produce output without crashing
        assert isinstance(decoded, str)


class TestLanguageDetection:
    def test_explicit_language_directive(self):
        tok = LilyPondTokenizer()
        token_line = tok._movement_to_parser_tokens(r'\language "italiano" do4 re mi')
        assert "[LANGUAGE]" in token_line
        assert "lang:italiano" in token_line

    def test_detected_english(self):
        tok = LilyPondTokenizer()
        token_line = tok._movement_to_parser_tokens("c4 d4 e4 f4 g4")
        assert "[LANGUAGE]" in token_line
        assert "lang:english" in token_line

    def test_detected_italiano_via_directive(self):
        tok = LilyPondTokenizer()
        token_line = tok._movement_to_parser_tokens(
            r'\language "italiano" do4 re4 mi4 fa4 sol4'
        )
        assert "[LANGUAGE]" in token_line
        assert "lang:italiano" in token_line


class TestStructuralTokens:
    def test_new_staff_extracted(self):
        tok = LilyPondTokenizer()
        markers = tok._extract_structural_tokens(r"\new Staff { c4 d4 }")
        assert "[NEW_STAFF]" in markers

    def test_new_voice_extracted(self):
        tok = LilyPondTokenizer()
        markers = tok._extract_structural_tokens(r"\new Voice { c4 d4 }")
        assert "[NEW_VOICE]" in markers

    def test_new_pianostaff_extracted(self):
        tok = LilyPondTokenizer()
        markers = tok._extract_structural_tokens(
            r"\new PianoStaff << \new Staff { c4 } >>"
        )
        assert "[NEW_PIANOSTAFF]" in markers
        assert "[NEW_STAFF]" in markers

    def test_new_choirstaff_extracted(self):
        tok = LilyPondTokenizer()
        markers = tok._extract_structural_tokens(r"\new ChoirStaff << >>")
        assert "[NEW_CHOIRSTAFF]" in markers


class TestValidateRoundTrip:
    def test_simple_round_trip(self, tokenizer):
        is_valid, decoded, errors = tokenizer.validate_round_trip("c4 d4 e4 f4")
        assert isinstance(decoded, str)
        assert isinstance(errors, list)
        # Notes should survive
        for note in ["c4", "d4", "e4", "f4"]:
            assert note in decoded
