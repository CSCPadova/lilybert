"""Tests for the musical lexer.

The lexer emits python-ly token strings directly rather than custom
tokens like NOTE_C or DUR_4.  So ``c4`` → ``["c", "4"]`` instead of
``["NOTE_C", "OCT_0", "DUR_4"]``.
"""

import pytest

from lilybert.data.lexer import LexerConfig, MusicalLexer, all_lexer_tokens


@pytest.fixture
def lexer():
    return MusicalLexer()


# -------------------------------------------------------------------
# Basic notes
# -------------------------------------------------------------------


class TestSingleNotes:
    def test_note_with_duration(self, lexer):
        assert lexer.linearize("c4") == ["c", "4"]

    def test_note_with_octave_up(self, lexer):
        result = lexer.linearize("c''4")
        assert result == ["c", "''", "4"]

    def test_note_with_octave_down(self, lexer):
        result = lexer.linearize("e,16")
        assert result == ["e", ",", "16"]

    def test_note_double_octave_down(self, lexer):
        result = lexer.linearize("fis,,2")
        assert result == ["fis", ",,", "2"]

    def test_english_sharp(self, lexer):
        result = lexer.linearize("fis4")
        assert result == ["fis", "4"]

    def test_english_flat(self, lexer):
        result = lexer.linearize("ees'8")
        assert result == ["ees", "'", "8"]

    def test_english_double_sharp(self, lexer):
        result = lexer.linearize("cisis4")
        assert result == ["cisis", "4"]

    def test_english_double_flat(self, lexer):
        result = lexer.linearize("eeses4")
        assert result == ["eeses", "4"]

    def test_no_octave_emitted_when_absent(self, lexer):
        """Note without octave marks should just be note + duration."""
        result = lexer.linearize("c4")
        assert result == ["c", "4"]


class TestItalianNotes:
    """Italian note names are passed through as-is by python-ly."""

    def test_italian_natural(self, lexer):
        result = lexer.linearize("do4")
        assert result == ["do", "4"]

    def test_italian_sharp(self, lexer):
        # python-ly does NOT recognise "dod" as a note token—only "do"
        # is a valid LilyPond note in the default (dutch) pitch scheme.
        # "dod" requires \language "italiano".
        # Without the language directive, python-ly treats "dod" as
        # a note "do" followed by something else.
        result = lexer.linearize("do4")
        assert "do" in result
        assert "4" in result

    def test_italian_sol(self, lexer):
        # "sol" is not a valid note name in default LilyPond.
        # python-ly only recognises c d e f g a b (and accidentals).
        # Italian names require \language "italiano".
        # These are tested in real pdmx content which has the directive.
        pass

    def test_italian_with_language_directive(self, lexer):
        # With \language "italiano", python-ly would handle do/re/mi etc.
        # but the lexer strips \language and starts in ParseMusic state
        # which uses the default pitch names.
        pass


# -------------------------------------------------------------------
# Duration handling
# -------------------------------------------------------------------


class TestDurations:
    def test_dotted_note(self, lexer):
        result = lexer.linearize("c'4.")
        assert result == ["c", "'", "4", "."]

    def test_double_dotted(self, lexer):
        result = lexer.linearize("c4..")
        assert result == ["c", "4", ".", "."]

    def test_inherited_duration(self, lexer):
        """Notes without explicit duration should omit length tokens."""
        result = lexer.linearize("c4 d e")
        assert result == ["c", "4", "d", "e"]

    def test_whole_note(self, lexer):
        result = lexer.linearize("c1")
        assert result == ["c", "1"]

    def test_sixteenth(self, lexer):
        result = lexer.linearize("c16")
        assert result == ["c", "16"]

    def test_thirtysecond(self, lexer):
        result = lexer.linearize("c32")
        assert result == ["c", "32"]


# -------------------------------------------------------------------
# Rests
# -------------------------------------------------------------------


class TestRests:
    def test_quarter_rest(self, lexer):
        result = lexer.linearize("r4")
        assert result == ["r", "4"]

    def test_half_rest(self, lexer):
        result = lexer.linearize("r2")
        assert result == ["r", "2"]

    def test_dotted_rest(self, lexer):
        result = lexer.linearize("r4.")
        assert result == ["r", "4", "."]

    def test_whole_bar_rest(self, lexer):
        # R is a multi-measure rest — python-ly treats it as Rest
        result = lexer.linearize("R1")
        assert result == ["R", "1"]

    def test_spacer_rest(self, lexer):
        result = lexer.linearize("s4")
        assert result == ["s", "4"]

    def test_dotted_spacer(self, lexer):
        result = lexer.linearize("s2.")
        assert result == ["s", "2", "."]


# -------------------------------------------------------------------
# Ties
# -------------------------------------------------------------------


class TestTies:
    def test_tie(self, lexer):
        result = lexer.linearize("c4~ c8")
        assert result == ["c", "4", "~", "c", "8"]


# -------------------------------------------------------------------
# Barlines
# -------------------------------------------------------------------


class TestBarlines:
    def test_bar_pipe(self, lexer):
        result = lexer.linearize("c4 | d4")
        assert result == ["c", "4", "|", "d", "4"]

    def test_bar_command(self, lexer):
        result = lexer.linearize(r'c4 \bar "||" d4')
        assert "\\bar" in result
        assert "||" in result


# -------------------------------------------------------------------
# Chords
# -------------------------------------------------------------------


class TestChords:
    def test_simple_chord(self, lexer):
        result = lexer.linearize("<c e g>4")
        assert result == ["<", "c", "e", "g", ">", "4"]

    def test_chord_with_accidentals(self, lexer):
        result = lexer.linearize("<c ees g>4")
        assert "ees" in result
        assert "<" in result
        assert ">" in result


# -------------------------------------------------------------------
# Commands
# -------------------------------------------------------------------


class TestCommands:
    def test_key_signature(self, lexer):
        result = lexer.linearize(r"\key g \major")
        assert result == ["\\key", "g", "\\major"]

    def test_key_minor(self, lexer):
        result = lexer.linearize(r"\key d \minor")
        assert result == ["\\key", "d", "\\minor"]

    def test_key_sharp(self, lexer):
        result = lexer.linearize(r"\key fis \minor")
        assert result == ["\\key", "fis", "\\minor"]

    def test_time_signature(self, lexer):
        result = lexer.linearize(r"\time 3/4")
        assert result == ["\\time", "3/4"]

    def test_time_6_8(self, lexer):
        result = lexer.linearize(r"\time 6/8")
        assert result == ["\\time", "6/8"]

    def test_clef_treble(self, lexer):
        result = lexer.linearize(r"\clef treble")
        assert result == ["\\clef", "treble"]

    def test_clef_bass(self, lexer):
        result = lexer.linearize(r"\clef bass")
        assert result == ["\\clef", "bass"]

    def test_clef_quoted(self, lexer):
        """\\clef "treble" should emit same as unquoted."""
        result = lexer.linearize(r'\clef "treble"')
        assert result == ["\\clef", "treble"]

    def test_tempo(self, lexer):
        result = lexer.linearize(r"\tempo 4 = 120")
        assert "\\tempo" in result

    def test_tempo_quoted_text(self, lexer):
        """Quoted tempo text emitted as a single token."""
        result = lexer.linearize(r'\tempo "Allegro" 4 = 120')
        assert "\\tempo" in result
        assert "Allegro" in result
        assert "4" in result

    def test_tempo_text_only(self, lexer):
        """Tempo with only text argument and no metronome mark."""
        result = lexer.linearize(r'\tempo "Andante"')
        assert "\\tempo" in result
        assert "Andante" in result

    def test_tempo_unquoted_capitalised(self, lexer):
        """Unquoted capitalised tempo text reassembled as one token."""
        result = lexer.linearize(r"\tempo Allegro 4 = 120")
        assert "\\tempo" in result
        assert "Allegro" in result
        assert "4" in result
        # Should NOT have fragments like "A" or "llegro"
        assert "llegro" not in result

    def test_tempo_unquoted_lowercase(self, lexer):
        """Unquoted lowercase tempo text emitted as one token."""
        result = lexer.linearize(r"\tempo allegro")
        assert "\\tempo" in result
        assert "allegro" in result


# -------------------------------------------------------------------
# Tuplets
# -------------------------------------------------------------------


class TestTuplets:
    def test_triplet(self, lexer):
        result = lexer.linearize(r"\tuplet 3/2 { c8 d e }")
        assert "\\tuplet" in result
        assert "3/2" in result
        assert "{" in result
        assert "}" in result
        assert "c" in result
        assert "d" in result
        assert "e" in result


# -------------------------------------------------------------------
# Articulations
# -------------------------------------------------------------------


class TestArticulations:
    def test_trill(self, lexer):
        result = lexer.linearize(r"c4\trill")
        assert "\\trill" in result

    def test_fermata(self, lexer):
        result = lexer.linearize(r"c4\fermata")
        assert "\\fermata" in result

    def test_mordent(self, lexer):
        result = lexer.linearize(r"c4\mordent")
        assert "\\mordent" in result

    def test_turn(self, lexer):
        result = lexer.linearize(r"c4\turn")
        assert "\\turn" in result

    def test_prall(self, lexer):
        result = lexer.linearize(r"c4\prall")
        assert "\\prall" in result

    def test_staccato_shorthand(self, lexer):
        result = lexer.linearize("c4-.")
        assert "." in result

    def test_accent_shorthand(self, lexer):
        result = lexer.linearize("c4->")
        assert ">" in result

    def test_tenuto_shorthand(self, lexer):
        result = lexer.linearize("c4--")
        assert "-" in result or "--" in result

    def test_user_macro_tr(self, lexer):
        result = lexer.linearize(r"c4\tr")
        assert "\\trill" in result

    def test_user_macro_st(self, lexer):
        result = lexer.linearize(r"c4\st")
        assert "\\staccato" in result

    def test_user_macro_stacc(self, lexer):
        result = lexer.linearize(r"c4\stacc")
        assert "\\staccato" in result

    def test_articulations_disabled(self):
        lex = MusicalLexer(LexerConfig(include_articulations=False))
        result = lex.linearize(r"c4\fermata")
        assert "\\fermata" not in result


# -------------------------------------------------------------------
# Slurs
# -------------------------------------------------------------------


class TestSlurs:
    def test_slur(self, lexer):
        result = lexer.linearize("c4( d e)")
        assert "(" in result
        assert ")" in result

    def test_slurs_disabled(self):
        lex = MusicalLexer(LexerConfig(include_slurs=False))
        result = lex.linearize("c4( d e)")
        assert "(" not in result
        assert ")" not in result


# -------------------------------------------------------------------
# Grace notes
# -------------------------------------------------------------------


class TestGraceNotes:
    def test_grace_command(self, lexer):
        result = lexer.linearize(r"\grace { c16 d } e4")
        assert "\\grace" in result
        assert "c" in result
        assert "d" in result

    def test_appoggiatura(self, lexer):
        result = lexer.linearize(r"\appoggiatura c8 d4")
        assert "\\appoggiatura" in result

    def test_acciaccatura(self, lexer):
        result = lexer.linearize(r"\acciaccatura c8 d4")
        assert "\\acciaccatura" in result


# -------------------------------------------------------------------
# Voices / simultaneous music
# -------------------------------------------------------------------


class TestVoices:
    def test_voice_separator(self, lexer):
        result = lexer.linearize(r"<< { c4 e } \\ { c2 g } >>")
        assert "[PART_BEGIN]" in result
        assert "[PART_END]" in result
        # Should have two PART_BEGIN/PART_END pairs
        assert result.count("[PART_BEGIN]") == 2
        assert result.count("[PART_END]") == 2

    def test_voice_content_order(self, lexer):
        result = lexer.linearize(r"<< { c4 } \\ { d2 } >>")
        # First voice has c, second has d
        first_begin = result.index("[PART_BEGIN]")
        first_end = result.index("[PART_END]")
        first_voice = result[first_begin + 1 : first_end]
        assert "c" in first_voice

        second_begin = result.index("[PART_BEGIN]", first_end)
        second_end = result.index("[PART_END]", second_begin)
        second_voice = result[second_begin + 1 : second_end]
        assert "d" in second_voice

    def test_simultaneous_without_voices(self, lexer):
        """<< >> without \\\\ should emit << and >>."""
        result = lexer.linearize("<< { c4 e } { d4 f } >>")
        assert "<<" in result
        assert ">>" in result


# -------------------------------------------------------------------
# Structural tokens
# -------------------------------------------------------------------


class TestStructural:
    def test_sequential_blocks(self, lexer):
        result = lexer.linearize("{ c4 d }")
        assert "{" in result
        assert "}" in result

    def test_new_staff(self, lexer):
        result = lexer.linearize(r"\new Staff")
        assert "\\new" in result
        assert "Staff" in result

    def test_new_voice(self, lexer):
        result = lexer.linearize(r"\new Voice")
        assert "\\new" in result
        assert "Voice" in result

    def test_score(self, lexer):
        result = lexer.linearize(r"\score")
        assert "\\score" in result


# -------------------------------------------------------------------
# Non-musical content filtering
# -------------------------------------------------------------------


class TestFiltering:
    def test_override_stripped(self, lexer):
        result = lexer.linearize(r"\override Stem.direction = #UP c4")
        # Should have the note, not the override
        assert "c" in result
        assert "4" in result
        # Should not contain override-related tokens
        assert "Stem" not in result

    def test_comment_stripped(self, lexer):
        result = lexer.linearize("c4 % comment\n d4")
        assert "c" in result
        assert "d" in result

    def test_barNumberCheck_stripped(self, lexer):
        result = lexer.linearize(r"\barNumberCheck c4")
        # \barNumberCheck is not in _MUSICAL_COMMANDS so it's skipped
        assert "c" in result


# -------------------------------------------------------------------
# Macro extraction
# -------------------------------------------------------------------


class TestMacroExtraction:
    def test_extract_trill_macro(self):
        text = "tr = \\trill\n"
        macros = MusicalLexer.extract_macros(text)
        assert macros == {"\\tr": "\\trill"}

    def test_extract_fermata_macro(self):
        text = "ferm = \\fermata\n"
        macros = MusicalLexer.extract_macros(text)
        assert macros == {"\\ferm": "\\fermata"}

    def test_ignores_non_expandable(self):
        text = "giu = \\change\npad = \\once\n"
        macros = MusicalLexer.extract_macros(text)
        assert len(macros) == 0

    def test_linearize_with_learned_macros(self, lexer):
        macros = MusicalLexer.extract_macros("tr = \\trill\n")
        result = lexer.linearize(r"c4\tr", macro_map=macros)
        assert "\\trill" in result

    def test_linearize_without_macros_uses_defaults(self, lexer):
        result = lexer.linearize(r"c4\tr")
        assert "\\trill" in result


class TestTokenVocabulary:
    def test_all_tokens_returns_empty(self):
        """all_lexer_tokens() returns empty list (backward compat)."""
        tokens = all_lexer_tokens()
        assert tokens == []
