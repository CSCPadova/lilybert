"""Unit tests for the musically-informed pre-tokenization layer."""

import pytest

from lilybert.data.musical_tokens import (
    base_vocabulary,
    cap_consecutive_rests,
    ly_tokens_to_musical,
    map_note,
    musical_to_ly_tokens,
)


class TestMapNote:
    def test_plain_notes(self):
        for note in "cdefgab":
            assert map_note(note) == [f"NOTE_{note.upper()}"]

    def test_sharp(self):
        assert map_note("cis") == ["NOTE_C", "ACC_SHARP"]
        assert map_note("fis") == ["NOTE_F", "ACC_SHARP"]
        assert map_note("gis") == ["NOTE_G", "ACC_SHARP"]

    def test_flat(self):
        assert map_note("bes") == ["NOTE_B", "ACC_FLAT"]
        assert map_note("des") == ["NOTE_D", "ACC_FLAT"]

    def test_double_sharp(self):
        assert map_note("cisis") == ["NOTE_C", "ACC_DSHARP"]
        assert map_note("fisis") == ["NOTE_F", "ACC_DSHARP"]

    def test_double_flat(self):
        assert map_note("deses") == ["NOTE_D", "ACC_DFLAT"]
        assert map_note("geses") == ["NOTE_G", "ACC_DFLAT"]

    def test_special_as(self):
        assert map_note("as") == ["NOTE_A", "ACC_FLAT"]

    def test_special_es(self):
        assert map_note("es") == ["NOTE_E", "ACC_FLAT"]

    def test_special_ases(self):
        assert map_note("ases") == ["NOTE_A", "ACC_DFLAT"]

    def test_special_eses(self):
        assert map_note("eses") == ["NOTE_E", "ACC_DFLAT"]

    def test_ais(self):
        assert map_note("ais") == ["NOTE_A", "ACC_SHARP"]

    def test_eis(self):
        assert map_note("eis") == ["NOTE_E", "ACC_SHARP"]

    # -- Multi-language support (all LilyPond pitch languages) --

    _NOTE_TOKENS = [
        "NOTE_C",
        "NOTE_D",
        "NOTE_E",
        "NOTE_F",
        "NOTE_G",
        "NOTE_A",
        "NOTE_B",
    ]

    @pytest.mark.parametrize(
        "lang, notes",
        [
            ("nederlands", ["c", "d", "e", "f", "g", "a", "b"]),
            ("italiano", ["do", "re", "mi", "fa", "sol", "la", "si"]),
            ("deutsch", ["c", "d", "e", "f", "g", "a", "h"]),
            ("english", ["c", "d", "e", "f", "g", "a", "b"]),
            ("espanol", ["do", "re", "mi", "fa", "sol", "la", "si"]),
            ("catalan", ["do", "re", "mi", "fa", "sol", "la", "si"]),
            ("norsk", ["c", "d", "e", "f", "g", "a", "h"]),
            ("portugues", ["do", "re", "mi", "fa", "sol", "la", "si"]),
            ("suomi", ["c", "d", "e", "f", "g", "a", "h"]),
            ("svenska", ["c", "d", "e", "f", "g", "a", "h"]),
            ("vlaams", ["do", "re", "mi", "fa", "sol", "la", "si"]),
        ],
    )
    def test_natural_notes_all_languages(self, lang, notes):
        for note, expected in zip(notes, self._NOTE_TOKENS):
            assert map_note(note)[0] == expected, f"{lang}: {note}"

    @pytest.mark.parametrize(
        "lang, sharp_note, flat_note",
        [
            ("nederlands", "cis", "bes"),
            ("italiano", "dod", "sib"),
            ("deutsch", "cis", "hes"),
            ("english", "cs", "bf"),
            ("espanol", "dos", "sib"),
            ("catalan", "dod", "sib"),
            ("norsk", "cis", "hes"),
            ("portugues", "dos", "sib"),
            ("suomi", "cis", "hes"),
            ("svenska", "ciss", "hess"),
            ("vlaams", "dok", "sib"),
        ],
    )
    def test_accidentals_all_languages(self, lang, sharp_note, flat_note):
        result = map_note(sharp_note)
        assert result[1] == "ACC_SHARP", f"{lang}: {sharp_note} -> {result}"
        result = map_note(flat_note)
        assert result[1] == "ACC_FLAT", f"{lang}: {flat_note} -> {result}"

    def test_unknown_passthrough(self):
        assert map_note("xyz") == ["xyz"]


class TestLyTokensToMusical:
    def test_simple_notes(self):
        tokens = ["c", "4", "d", "8", "e", "4"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_C", "DUR_4", "NOTE_D", "DUR_8", "NOTE_E", "DUR_4"]

    def test_note_with_accidental(self):
        tokens = ["fis", "'", "4"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_F", "ACC_SHARP", "OCT_1", "DUR_4"]

    def test_note_with_octave(self):
        tokens = ["c", "''", "4"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_C", "OCT_2", "DUR_4"]

    def test_rest(self):
        tokens = ["r", "4"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["REST", "DUR_4"]

    def test_multi_measure_rest(self):
        tokens = ["R", "1"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["REST_MULTI", "DUR_1"]

    def test_tie(self):
        tokens = ["c", "4", "~"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_C", "DUR_4", "TIE"]

    def test_slurs(self):
        tokens = ["c", "4", "(", "d", "4", ")"]
        result = ly_tokens_to_musical(tokens)
        assert result == [
            "NOTE_C",
            "DUR_4",
            "SLUR_START",
            "NOTE_D",
            "DUR_4",
            "SLUR_END",
        ]

    def test_bar(self):
        tokens = ["c", "4", "|", "d", "4"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_C", "DUR_4", "BAR", "NOTE_D", "DUR_4"]

    def test_commands(self):
        tokens = ["\\key", "c", "\\major", "\\time", "4/4"]
        result = ly_tokens_to_musical(tokens)
        assert result == [
            "CMD_KEY",
            "NOTE_C",
            "KEY_MAJOR",
            "CMD_TIME",
            "FRAC_START",
            "DIGIT_4",
            "FRAC_SLASH",
            "DIGIT_4",
        ]

    def test_clef(self):
        tokens = ["\\clef", "treble"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["CMD_CLEF", "CLEF_TREBLE"]

    def test_articulation(self):
        tokens = ["c", "4", "\\trill"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_C", "DUR_4", "ART_TRILL"]

    def test_fermata(self):
        tokens = ["c", "4", "\\fermata"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_C", "DUR_4", "ART_FERMATA"]

    def test_dynamics(self):
        tokens = ["c", "4", "\\f"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_C", "DUR_4", "DYN_F"]

    def test_direction(self):
        tokens = ["-", "c", "4"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["DIR_NEUTRAL", "NOTE_C", "DUR_4"]

    def test_direction_up_down(self):
        tokens = ["^", "_"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["DIR_UP", "DIR_DOWN"]

    def test_dot_after_duration(self):
        tokens = ["c", "4", "."]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_C", "DUR_4", "DOT"]

    def test_dot_after_direction_is_staccato(self):
        tokens = ["-", "."]
        result = ly_tokens_to_musical(tokens)
        assert result == ["DIR_NEUTRAL", "ART_STACCATO"]

    def test_structure_tokens(self):
        tokens = ["{", "c", "4", "}"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["BLOCK_START", "NOTE_C", "DUR_4", "BLOCK_END"]

    def test_chord_delimiters(self):
        tokens = ["<", "c", "e", "g", ">"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["CHORD_START", "NOTE_C", "NOTE_E", "NOTE_G", "CHORD_END"]

    def test_simultaneous(self):
        tokens = ["<<", "c", "4", ">>"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["SIM_START", "NOTE_C", "DUR_4", "SIM_END"]

    def test_tuplet(self):
        tokens = ["\\tuplet", "3/2", "{", "c", "4", "d", "4", "e", "4", "}"]
        result = ly_tokens_to_musical(tokens)
        assert result == [
            "CMD_TUPLET",
            "FRAC_START",
            "DIGIT_3",
            "FRAC_SLASH",
            "DIGIT_2",
            "BLOCK_START",
            "NOTE_C",
            "DUR_4",
            "NOTE_D",
            "DUR_4",
            "NOTE_E",
            "DUR_4",
            "BLOCK_END",
        ]

    def test_passthrough_special_tokens(self):
        tokens = ["[PART_BEGIN]", "c", "4", "[PART_END]"]
        result = ly_tokens_to_musical(tokens)
        assert result == [
            "[PART_BEGIN]",
            "NOTE_C",
            "DUR_4",
            "[PART_END]",
        ]

    def test_beams(self):
        tokens = ["c", "8", "[", "d", "8", "]"]
        result = ly_tokens_to_musical(tokens)
        assert result == [
            "NOTE_C",
            "DUR_8",
            "BEAM_START",
            "NOTE_D",
            "DUR_8",
            "BEAM_END",
        ]

    def test_new_staff(self):
        tokens = ["\\new", "Staff", "{", "c", "4", "}"]
        result = ly_tokens_to_musical(tokens)
        assert result == [
            "CMD_NEW",
            "CTX_STAFF",
            "BLOCK_START",
            "NOTE_C",
            "DUR_4",
            "BLOCK_END",
        ]

    def test_bar_type(self):
        tokens = ["\\bar", "|."]
        result = ly_tokens_to_musical(tokens)
        assert result == ["CMD_BAR", "BAR_FINAL"]

    def test_accidental_reminder(self):
        tokens = ["fis", "!", "4"]
        result = ly_tokens_to_musical(tokens)
        assert result == ["NOTE_F", "ACC_SHARP", "ACC_NAT", "DUR_4"]

    def test_repeat(self):
        tokens = ["\\repeat", "volta", "2", "{", "c", "4", "}"]
        result = ly_tokens_to_musical(tokens)
        assert result == [
            "CMD_REPEAT",
            "REPEAT_VOLTA",
            "DIGIT_2",
            "BLOCK_START",
            "NOTE_C",
            "DUR_4",
            "BLOCK_END",
        ]

    def test_grace(self):
        tokens = ["\\grace", "{", "c", "16", "}"]
        result = ly_tokens_to_musical(tokens)
        assert result == [
            "CMD_GRACE",
            "BLOCK_START",
            "NOTE_C",
            "DUR_16",
            "BLOCK_END",
        ]


class TestMusicalToLyTokens:
    def test_simple_notes(self):
        musical = ["NOTE_C", "DUR_4", "NOTE_D", "DUR_8"]
        result = musical_to_ly_tokens(musical)
        assert result == ["c", "4", "d", "8"]

    def test_note_with_accidental(self):
        musical = ["NOTE_F", "ACC_SHARP", "OCT_1", "DUR_4"]
        result = musical_to_ly_tokens(musical)
        assert result == ["fis", "'", "4"]

    def test_a_flat(self):
        musical = ["NOTE_A", "ACC_FLAT"]
        result = musical_to_ly_tokens(musical)
        assert result == ["as"]

    def test_e_flat(self):
        musical = ["NOTE_E", "ACC_FLAT"]
        result = musical_to_ly_tokens(musical)
        assert result == ["es"]

    def test_double_sharp(self):
        musical = ["NOTE_C", "ACC_DSHARP"]
        result = musical_to_ly_tokens(musical)
        assert result == ["cisis"]

    def test_double_flat(self):
        musical = ["NOTE_D", "ACC_DFLAT"]
        result = musical_to_ly_tokens(musical)
        assert result == ["deses"]

    def test_rest(self):
        musical = ["REST", "DUR_4"]
        result = musical_to_ly_tokens(musical)
        assert result == ["r", "4"]

    def test_tie(self):
        musical = ["NOTE_C", "DUR_4", "TIE"]
        result = musical_to_ly_tokens(musical)
        assert result == ["c", "4", "~"]

    def test_commands(self):
        musical = ["CMD_KEY", "NOTE_C", "KEY_MAJOR"]
        result = musical_to_ly_tokens(musical)
        assert result == ["\\key", "c", "\\major"]

    def test_articulation(self):
        musical = ["NOTE_C", "DUR_4", "ART_TRILL"]
        result = musical_to_ly_tokens(musical)
        assert result == ["c", "4", "\\trill"]

    def test_dynamic(self):
        musical = ["NOTE_C", "DUR_4", "DYN_F"]
        result = musical_to_ly_tokens(musical)
        assert result == ["c", "4", "\\f"]

    def test_direction(self):
        musical = ["DIR_UP", "ART_STACCATO"]
        result = musical_to_ly_tokens(musical)
        assert result == ["^", "\\staccato"]

    def test_structure(self):
        musical = ["BLOCK_START", "NOTE_C", "DUR_4", "BLOCK_END"]
        result = musical_to_ly_tokens(musical)
        assert result == ["{", "c", "4", "}"]

    def test_dot(self):
        musical = ["NOTE_C", "DUR_4", "DOT"]
        result = musical_to_ly_tokens(musical)
        assert result == ["c", "4", "."]

    def test_passthrough(self):
        musical = ["[PART_BEGIN]", "NOTE_C", "DUR_4", "[PART_END]"]
        result = musical_to_ly_tokens(musical)
        assert result == ["[PART_BEGIN]", "c", "4", "[PART_END]"]

    def test_bar_final(self):
        musical = ["CMD_BAR", "BAR_FINAL"]
        result = musical_to_ly_tokens(musical)
        assert result == ["\\bar", "|."]

    def test_clef(self):
        musical = ["CMD_CLEF", "CLEF_TREBLE"]
        result = musical_to_ly_tokens(musical)
        assert result == ["\\clef", "treble"]

    def test_fraction_roundtrip(self):
        musical = ["CMD_TIME", "FRAC_START", "DIGIT_4", "FRAC_SLASH", "DIGIT_4"]
        result = musical_to_ly_tokens(musical)
        assert result == ["\\time", "4/4"]


class TestRoundTrip:
    """Verify that ly_tokens_to_musical -> musical_to_ly_tokens recovers original."""

    @pytest.mark.parametrize(
        "ly_tokens",
        [
            ["c", "4", "d", "8", "e", "4"],
            ["fis", "'", "4", "~"],
            ["r", "4", "|", "c", "2", "."],
            ["\\key", "c", "\\major", "\\time", "4/4"],
            ["\\clef", "treble"],
            ["c", "4", "\\trill"],
            ["c", "4", "(", "d", "4", ")"],
            ["{", "c", "4", "}"],
            ["<", "c", "e", "g", ">", "4"],
            ["\\bar", "|."],
            ["\\new", "Staff"],
        ],
    )
    def test_roundtrip(self, ly_tokens):
        musical = ly_tokens_to_musical(ly_tokens)
        recovered = musical_to_ly_tokens(musical)
        assert recovered == ly_tokens


class TestBaseVocabulary:
    def test_no_duplicates(self):
        vocab = base_vocabulary()
        assert len(vocab) == len(set(vocab))

    def test_contains_notes(self):
        vocab = set(base_vocabulary())
        for note in "CDEFGAB":
            assert f"NOTE_{note}" in vocab

    def test_contains_durations(self):
        vocab = set(base_vocabulary())
        for dur in ["1", "2", "4", "8", "16", "32", "64"]:
            assert f"DUR_{dur}" in vocab

    def test_contains_accidentals(self):
        vocab = set(base_vocabulary())
        assert "ACC_SHARP" in vocab
        assert "ACC_FLAT" in vocab
        assert "ACC_DSHARP" in vocab
        assert "ACC_DFLAT" in vocab

    def test_contains_octaves(self):
        vocab = set(base_vocabulary())
        assert "OCT_1" in vocab
        assert "OCT_-1" in vocab

    def test_contains_articulations(self):
        vocab = set(base_vocabulary())
        assert "ART_TRILL" in vocab
        assert "ART_FERMATA" in vocab
        assert "ART_STACCATO" in vocab

    def test_contains_commands(self):
        vocab = set(base_vocabulary())
        assert "CMD_KEY" in vocab
        assert "CMD_TIME" in vocab
        assert "CMD_CLEF" in vocab

    def test_contains_structure(self):
        vocab = set(base_vocabulary())
        assert "BLOCK_START" in vocab
        assert "BLOCK_END" in vocab
        assert "BAR" in vocab

    def test_contains_connectors(self):
        vocab = set(base_vocabulary())
        assert "TIE" in vocab
        assert "SLUR_START" in vocab
        assert "SLUR_END" in vocab

    def test_contains_directions(self):
        vocab = set(base_vocabulary())
        assert "DIR_NEUTRAL" in vocab
        assert "DIR_UP" in vocab
        assert "DIR_DOWN" in vocab

    def test_contains_rests(self):
        vocab = set(base_vocabulary())
        assert "REST" in vocab
        assert "REST_MULTI" in vocab
        assert "SPACER" in vocab

    def test_contains_digits(self):
        vocab = set(base_vocabulary())
        for i in range(10):
            assert f"DIGIT_{i}" in vocab

    def test_contains_scale_tokens(self):
        vocab = set(base_vocabulary())
        assert "SCALE_START" in vocab
        assert "SCALE_SLASH" in vocab
        assert "FRAC_START" in vocab
        assert "FRAC_SLASH" in vocab


class TestFallbackValidation:
    """Verify that the fallback passes through valid tokens and rejects junk."""

    def test_passes_tempo_text(self):
        """Musical terms emitted by the lexer should pass through."""
        result = ly_tokens_to_musical(["\\tempo", "Allegro", "4"])
        assert result == ["CMD_TEMPO", "Allegro", "DUR_4"]

    def test_passes_lowercase_expression(self):
        result = ly_tokens_to_musical(["\\tempo", "adagio"])
        assert result == ["CMD_TEMPO", "adagio"]

    def test_rejects_single_char_fragment(self):
        """Single non-musical characters should be dropped."""
        result = ly_tokens_to_musical(["c", "4", "#"])
        assert "#" not in result

    def test_keeps_valid_passthrough(self):
        """Part names and special markers should still pass through."""
        result = ly_tokens_to_musical(["[PART_BEGIN]", "c", "4", "[PART_END]"])
        assert "[PART_BEGIN]" in result
        assert "[PART_END]" in result


class TestScalingDecomposition:
    """Verify that scaling fractions are decomposed into digit tokens."""

    def test_simple_scaling(self):
        result = ly_tokens_to_musical(["*2/3"])
        assert result == ["SCALE_START", "DIGIT_2", "SCALE_SLASH", "DIGIT_3"]

    def test_multi_digit_scaling(self):
        result = ly_tokens_to_musical(["*20/13"])
        assert result == [
            "SCALE_START",
            "DIGIT_2",
            "DIGIT_0",
            "SCALE_SLASH",
            "DIGIT_1",
            "DIGIT_3",
        ]

    def test_fraction_decomposed(self):
        result = ly_tokens_to_musical(["3/4"])
        assert result == ["FRAC_START", "DIGIT_3", "FRAC_SLASH", "DIGIT_4"]

    def test_roundtrip_scaling(self):
        musical = ly_tokens_to_musical(["*2/3"])
        recovered = musical_to_ly_tokens(musical)
        assert recovered == ["*2/3"]

    def test_roundtrip_fraction(self):
        musical = ly_tokens_to_musical(["4/4"])
        recovered = musical_to_ly_tokens(musical)
        assert recovered == ["4/4"]

    def test_roundtrip_multi_digit(self):
        musical = ly_tokens_to_musical(["*20/13"])
        recovered = musical_to_ly_tokens(musical)
        assert recovered == ["*20/13"]


class TestCapConsecutiveRests:
    """Verify that long multi-measure rest runs are capped."""

    def _make_rest_run(self, n: int, dur: str = "DUR_1") -> list[str]:
        """Build a sequence of n bars of multi-measure rests."""
        tokens: list[str] = []
        for i in range(n):
            if i > 0:
                tokens.append("BAR")
            tokens.extend(["REST_MULTI", dur])
        return tokens

    def test_short_run_unchanged(self):
        tokens = self._make_rest_run(3)
        result = cap_consecutive_rests(tokens, max_bars=4)
        assert result == tokens

    def test_exact_cap_unchanged(self):
        tokens = self._make_rest_run(4)
        result = cap_consecutive_rests(tokens, max_bars=4)
        assert result == tokens

    def test_long_run_capped(self):
        tokens = self._make_rest_run(8)
        result = cap_consecutive_rests(tokens, max_bars=4)
        expected = self._make_rest_run(4)
        assert result == expected

    def test_preserves_surrounding(self):
        tokens = (
            ["NOTE_C", "DUR_4", "BAR"]
            + self._make_rest_run(8)
            + ["BAR", "NOTE_D", "DUR_4"]
        )
        result = cap_consecutive_rests(tokens, max_bars=4)
        # Should have NOTE_C DUR_4 BAR + 4 rest bars + BAR NOTE_D DUR_4
        # The leading BAR before the first REST_MULTI is kept by the main loop
        # The trailing BAR + NOTE_D is after the rest run
        assert result[0] == "NOTE_C"
        assert result[1] == "DUR_4"
        assert result[2] == "BAR"
        assert result[-2] == "NOTE_D" or result[-1] == "DUR_4"
        # Count REST_MULTI occurrences
        assert result.count("REST_MULTI") == 4

    def test_different_durations_capped_independently(self):
        """Two separate runs with different durations."""
        run1 = self._make_rest_run(6, "DUR_1")
        run2 = self._make_rest_run(6, "DUR_2")
        tokens = run1 + ["BAR", "NOTE_C", "DUR_4", "BAR"] + run2
        result = cap_consecutive_rests(tokens, max_bars=4)
        # Each run should be capped independently
        assert result.count("REST_MULTI") == 8  # 4 + 4
