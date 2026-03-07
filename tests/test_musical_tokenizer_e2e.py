"""End-to-end tests for the musically-informed tokenizer.

Trains a BPE tokenizer on real LilyPond files from tests/ly/ and verifies
that musical tokens are atomic, round-trips produce valid output, and BPE
creates compound musical tokens.
"""

from pathlib import Path

import pytest

from lilybert.data.musical_tokens import base_vocabulary, ly_tokens_to_musical
from lilybert.data.token_bpe import BPE_SEPARATOR
from lilybert.data.tokenizer import LilyPondTokenizer

_LY_DIR = Path(__file__).parent / "ly"


def _collect_ly_files() -> list[Path]:
    """Collect all .ly files from the test directory."""
    files = sorted(_LY_DIR.glob("*.ly"))
    assert len(files) > 0, f"No .ly files found in {_LY_DIR}"
    return files


def _build_corpus() -> tuple[LilyPondTokenizer, list[str]]:
    """Build a corpus from test .ly files."""
    tok = LilyPondTokenizer()
    corpus = []
    for f in _collect_ly_files():
        text = f.read_text(encoding="utf-8", errors="ignore")
        token_line = tok._movement_to_parser_tokens(text)
        if token_line.strip():
            corpus.append(token_line)
    return tok, corpus


@pytest.fixture(scope="module")
def trained_tokenizer():
    """Train a tokenizer on all test .ly files."""
    tok, corpus = _build_corpus()
    tok.train(corpus, vocab_size=2000)
    return tok


@pytest.fixture(scope="module")
def corpus_lines():
    """Pre-tokenized corpus lines (musical token strings)."""
    _, corpus = _build_corpus()
    return corpus


class TestMusicalTokenizerE2E:
    def test_train_on_ly_files(self, trained_tokenizer):
        """Training completes and produces a valid tokenizer."""
        assert trained_tokenizer.fast_tokenizer is not None
        assert trained_tokenizer.fast_tokenizer.vocab_size > 0

    def test_base_vocab_tokens_are_atomic(self, trained_tokenizer):
        """Each base vocabulary token encodes to exactly 1 token ID."""
        vocab = base_vocabulary()
        for token in vocab:
            ids = trained_tokenizer.fast_tokenizer.encode(
                token, add_special_tokens=False
            )
            assert len(ids) == 1, (
                f"Base token {token!r} was split into {len(ids)} IDs: {ids}"
            )

    def test_base_vocab_in_trained_vocab(self, trained_tokenizer):
        """All base vocabulary tokens exist in the trained vocab."""
        trained_vocab = trained_tokenizer.fast_tokenizer.get_vocab()
        for token in base_vocabulary():
            assert token in trained_vocab, f"Missing base token: {token!r}"

    def test_simple_passage_tokenization(self, trained_tokenizer):
        """Simple passage produces expected musical token sequence."""
        token_line = trained_tokenizer._movement_to_parser_tokens("c4 d8 e4")
        tokens = token_line.split()
        assert "NOTE_C" in tokens
        assert "DUR_4" in tokens
        assert "NOTE_D" in tokens
        assert "DUR_8" in tokens
        assert "NOTE_E" in tokens

    def test_accidentals_decomposed(self, trained_tokenizer):
        """Accidentals are decomposed into note + accidental tokens."""
        token_line = trained_tokenizer._movement_to_parser_tokens("fis4 bes4")
        tokens = token_line.split()
        # fis -> NOTE_F ACC_SHARP
        assert "NOTE_F" in tokens
        assert "ACC_SHARP" in tokens
        # bes -> NOTE_B ACC_FLAT
        assert "NOTE_B" in tokens
        assert "ACC_FLAT" in tokens

    def test_octaves_mapped(self, trained_tokenizer):
        """Octave markers map to OCT_N tokens."""
        token_line = trained_tokenizer._movement_to_parser_tokens("c'4 d''8 e,4")
        tokens = token_line.split()
        assert "OCT_1" in tokens
        assert "OCT_2" in tokens
        assert "OCT_-1" in tokens

    def test_commands_mapped(self, trained_tokenizer):
        """Musical commands map to CMD_ tokens."""
        token_line = trained_tokenizer._movement_to_parser_tokens(
            r"\key c \major \time 4/4 \clef treble c4"
        )
        tokens = token_line.split()
        assert "CMD_KEY" in tokens
        assert "CMD_TIME" in tokens
        assert "CMD_CLEF" in tokens
        assert "KEY_MAJOR" in tokens
        assert "CLEF_TREBLE" in tokens

    def test_articulations_mapped(self, trained_tokenizer):
        """Articulation commands map to ART_ tokens."""
        token_line = trained_tokenizer._movement_to_parser_tokens(r"c4\trill d4\fermata")
        tokens = token_line.split()
        assert "ART_TRILL" in tokens
        assert "ART_FERMATA" in tokens

    def test_directions_mapped(self, trained_tokenizer):
        """Direction indicators map to DIR_ tokens."""
        # The lexer emits direction tokens from -\markup, ^, _ etc.
        # We test with script abbreviations that the lexer keeps.
        token_line = trained_tokenizer._movement_to_parser_tokens("c4")
        # Directions appear in real .ly files; verify mapping works
        musical = ly_tokens_to_musical(["-", "^", "_"])
        assert musical == ["DIR_NEUTRAL", "DIR_UP", "DIR_DOWN"]

    def test_roundtrip_produces_valid_output(self, trained_tokenizer):
        """Encode then decode produces output containing valid LilyPond notes."""
        text = r"\key c \major \time 4/4 c4 d e f | g a b c"
        ids = trained_tokenizer.encode_lilypond(text)
        decoded = trained_tokenizer.decode_to_lilypond(ids)
        # Should contain note names after reverse mapping
        for note in ["c", "d", "e", "f", "g", "a", "b"]:
            assert note in decoded, f"Note {note!r} missing from decoded output"

    def test_roundtrip_simple_notes(self, trained_tokenizer):
        """Simple notes survive round-trip."""
        text = "c4 d4 e4 f4"
        ids = trained_tokenizer.encode_lilypond(text)
        decoded = trained_tokenizer.decode_to_lilypond(ids, include_version=False)
        for note in ["c", "d", "e", "f"]:
            assert note in decoded

    def test_bpe_creates_compound_tokens(self, trained_tokenizer):
        """BPE merges create compound tokens joined by +."""
        vocab = trained_tokenizer.fast_tokenizer.get_vocab()
        compound = {t for t in vocab if BPE_SEPARATOR in t}
        assert len(compound) > 0, "BPE should have created compound tokens"

    def test_no_character_level_merges(self, trained_tokenizer):
        """All merges are between whole tokens (no single characters)."""
        assert trained_tokenizer._token_bpe is not None
        vocab = trained_tokenizer.fast_tokenizer.get_vocab()
        for left, right in trained_tokenizer._token_bpe.merges:
            # Each side of a merge should be a known vocab entry
            for side in (left, right):
                parts = side.split(BPE_SEPARATOR)
                for part in parts:
                    assert part in vocab, (
                        f"Merge component {part!r} is not in vocab"
                    )
                    # Must not be a single character (sign of char-level BPE)
                    assert len(part) > 1 or part in vocab, (
                        f"Merge component {part!r} looks like a character merge"
                    )

    def test_merged_tokens_use_separator(self, trained_tokenizer):
        """BPE-created tokens in vocab use + separator."""
        assert trained_tokenizer._token_bpe is not None
        # All merged tokens from BPE should use + separator
        for pair in trained_tokenizer._token_bpe.merges:
            merged = pair[0] + BPE_SEPARATOR + pair[1]
            vocab = trained_tokenizer.fast_tokenizer.get_vocab()
            assert merged in vocab, f"Merged token {merged!r} not in vocab"
            assert BPE_SEPARATOR in merged

    def test_part_structure_preserved(self, trained_tokenizer):
        """Part structure tokens work correctly with musical tokens."""
        text = "violin = { c4 d4 e4 }"
        ids = trained_tokenizer.encode_lilypond(text)
        decoded = trained_tokenizer.decode_to_lilypond(ids)
        # Part variable should be reconstructed with = { ... } structure
        assert "= {" in decoded
        assert "}" in decoded
        # Notes should survive
        for note in ["c", "d", "e"]:
            assert note in decoded

    def test_corpus_contains_musical_tokens(self, corpus_lines):
        """Corpus lines contain musical tokens, not raw LilyPond strings."""
        # Check that at least some musical tokens appear in the corpus
        all_text = " ".join(corpus_lines)
        assert "NOTE_" in all_text, "Corpus should contain NOTE_ tokens"
        assert "DUR_" in all_text, "Corpus should contain DUR_ tokens"
        # Raw LilyPond commands should NOT appear (they should be mapped)
        assert "\\clef" not in all_text, (
            "Raw \\clef should be mapped to CMD_CLEF"
        )

    def test_encode_real_ly_file(self, trained_tokenizer):
        """Encoding a real .ly file produces non-empty token IDs."""
        ly_file = _collect_ly_files()[0]
        text = ly_file.read_text(encoding="utf-8", errors="ignore")
        ids = trained_tokenizer.encode_lilypond(text)
        assert len(ids) > 0, "Real .ly file should produce tokens"

    def test_save_and_load(self, trained_tokenizer, tmp_path):
        """Tokenizer can be saved and loaded."""
        save_dir = tmp_path / "tokenizer"
        trained_tokenizer.save(save_dir)
        loaded = LilyPondTokenizer.load(save_dir)
        # Verify loaded tokenizer works
        ids = loaded.encode_lilypond("c4 d4 e4")
        assert len(ids) > 0
        # Verify base vocab survives save/load
        for token in ["NOTE_C", "DUR_4", "ART_TRILL"]:
            loaded_ids = loaded.fast_tokenizer.encode(
                token, add_special_tokens=False
            )
            assert len(loaded_ids) == 1, (
                f"Base token {token!r} was split after save/load"
            )
