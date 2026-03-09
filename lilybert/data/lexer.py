"""Musical lexer: filters python-ly tokens to keep only musical content.

Pipeline:  LilyPond text -> python-ly lexer (ParseMusic) -> MusicalLexer -> BPE

Produces python-ly token strings directly.  These become the whitespace-
delimited words that BPE then processes.  By using ``ParseMusic`` as the
initial lexer state, tokens are correctly typed (``Note``, ``Length``,
``Tie``, etc.) even for bare music text without a surrounding ``\relative``
block.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple

import ly.lex
import ly.lex.lilypond
from ly.lex import State

# ---------------------------------------------------------------------------
# Token classification
# ---------------------------------------------------------------------------

# Python-ly token types to pass through (emit as their string values).
# Types with special handling (SimultaneousStart, Direction, Clef, Command,
# New/Context/Change, UserCommand) are checked before this tuple.
_KEEP_TYPES: tuple = (
    # Notes and pitch
    ly.lex.lilypond.Note,
    ly.lex.lilypond.Rest,
    ly.lex.lilypond.Spacer,
    ly.lex.lilypond.Q,
    # Duration / modifiers
    ly.lex.lilypond.Length,
    ly.lex.lilypond.Octave,
    ly.lex.lilypond.Dot,
    ly.lex.lilypond.Tie,
    ly.lex.lilypond.AccidentalReminder,
    ly.lex.lilypond.AccidentalCautionary,
    ly.lex.lilypond.Scaling,
    # Chords
    ly.lex.lilypond.ChordStart,
    ly.lex.lilypond.ChordEnd,
    # Structure
    ly.lex.lilypond.SequentialStart,
    ly.lex.lilypond.SequentialEnd,
    ly.lex.lilypond.VoiceSeparator,
    # Connections
    ly.lex.lilypond.SlurStart,
    ly.lex.lilypond.SlurEnd,
    ly.lex.lilypond.PhrasingSlurStart,
    ly.lex.lilypond.PhrasingSlurEnd,
    ly.lex.lilypond.BeamStart,
    ly.lex.lilypond.BeamEnd,
    ly.lex.lilypond.PipeSymbol,
    # Expression
    ly.lex.lilypond.ArticulationCommand,
    ly.lex.lilypond.Dynamic,
    ly.lex.lilypond.ScriptAbbreviation,
    # Musical commands
    ly.lex.lilypond.ClefSpecifier,
    ly.lex.lilypond.PitchCommand,
    ly.lex.lilypond.KeySignatureMode,
    ly.lex.lilypond.Fraction,
    ly.lex.lilypond.Repeat,
    ly.lex.lilypond.RepeatSpecifier,
    ly.lex.lilypond.RepeatCount,
    ly.lex.lilypond.Partial,
    ly.lex.lilypond.Tempo,
    ly.lex.lilypond.Score,
    # Tremolo
    ly.lex.lilypond.Tremolo,
    ly.lex.lilypond.TremoloColon,
    ly.lex.lilypond.TremoloDuration,
    # Fingering
    ly.lex.lilypond.Fingering,
)

# Command strings (``ly.lex.lilypond.Command``) to keep.
_MUSICAL_COMMANDS: frozenset = frozenset(
    {
        "\\time",
        "\\tuplet",
        "\\grace",
        "\\appoggiatura",
        "\\acciaccatura",
        "\\alternative",
        "\\bar",
    }
)

# Known articulation commands for user-macro expansion.
# Maps a LilyPond command to the command string to emit.
_ARTICULATION_COMMANDS: Dict[str, str] = {
    "\\trill": "\\trill",
    "\\fermata": "\\fermata",
    "\\mordent": "\\mordent",
    "\\turn": "\\turn",
    "\\prall": "\\prall",
    "\\pralltriller": "\\prall",
    "\\staccato": "\\staccato",
    "\\accent": "\\accent",
    "\\tenuto": "\\tenuto",
    "\\marcato": "\\marcato",
    "\\staccatissimo": "\\staccatissimo",
    "\\portato": "\\portato",
}

# Default user-defined macro expansions.
_DEFAULT_USER_MACRO_MAP: Dict[str, str] = {
    "\\tr": "\\trill",
    "\\st": "\\staccato",
    "\\stacc": "\\staccato",
}

# Commands whose values can be learned from ``name = \command`` macros.
_EXPANDABLE_COMMANDS: Dict[str, str] = {**_ARTICULATION_COMMANDS}


# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------


@dataclass
class LexerConfig:
    """Configuration for the musical lexer."""

    include_articulations: bool = True
    include_slurs: bool = True


# ---------------------------------------------------------------------------
# MusicalLexer
# ---------------------------------------------------------------------------


class MusicalLexer:
    """Filter python-ly lexer tokens, keeping only musical content.

    Produces python-ly token strings directly.  These become the
    whitespace-delimited words that BPE then processes.

    Uses ``ParseMusic`` as the initial lexer state so tokens are correctly
    typed (``Note``, ``Length``, ``Tie``, etc.) even for bare music text
    without a surrounding ``\\relative`` block.
    """

    def __init__(self, config: Optional[LexerConfig] = None) -> None:
        self.config = config or LexerConfig()
        self._user_macro_map: Dict[str, str] = dict(_DEFAULT_USER_MACRO_MAP)

    # ------------------------------------------------------------------
    # Quick probes
    # ------------------------------------------------------------------

    @staticmethod
    def has_notes(text: str) -> bool:
        """Return *True* if *text* contains at least one note or rest.

        Uses python-ly token types for a fast, reliable check without
        running the full :meth:`linearize` pipeline.
        """
        state = State(ly.lex.lilypond.ParseMusic)
        for tok in state.tokens(text):
            if isinstance(
                tok,
                (ly.lex.lilypond.Note, ly.lex.lilypond.Rest),
            ):
                return True
        return False

    # ------------------------------------------------------------------
    # Public API
    # ------------------------------------------------------------------

    def linearize(
        self,
        block: str,
        macro_map: Optional[Dict[str, str]] = None,
    ) -> List[str]:
        """Convert a LilyPond music block into python-ly token strings.

        Args:
            block: LilyPond music content.
            macro_map: Optional mapping of user commands to articulation
                commands, e.g. ``{"\\\\tr": "\\\\trill"}``.  Built by
                :meth:`extract_macros`.

        Returns:
            List of python-ly token strings.
        """
        self._user_macro_map = (
            macro_map if macro_map is not None else dict(_DEFAULT_USER_MACRO_MAP)
        )
        state = State(ly.lex.lilypond.ParseMusic)
        ly_tokens = list(state.tokens(block))
        return self._process_ly_tokens(ly_tokens)

    @staticmethod
    def extract_macros(file_text: str) -> Dict[str, str]:
        """Extract user-defined macro definitions from a LilyPond file.

        Scans for ``name = \\command`` patterns and maps ``\\name`` to the
        underlying LilyPond command string.

        Args:
            file_text: Full LilyPond file content.

        Returns:
            Dict mapping ``"\\name"`` to a LilyPond command string.
        """
        macro_map: Dict[str, str] = {}
        pattern = re.compile(
            r"^([a-zA-Z]\w{0,20})\s*=\s*\\([a-zA-Z]+)\s*$", re.MULTILINE
        )
        for m in pattern.finditer(file_text):
            var_name = m.group(1)
            command = "\\" + m.group(2)
            target = _EXPANDABLE_COMMANDS.get(command)
            if target:
                macro_map["\\" + var_name] = target
        return macro_map

    # ------------------------------------------------------------------
    # Core processing loop
    # ------------------------------------------------------------------

    def _process_ly_tokens(self, ly_tokens: list) -> List[str]:
        """Walk python-ly tokens and emit string values for musical tokens."""
        result: List[str] = []
        i = 0
        n = len(ly_tokens)

        while i < n:
            tok = ly_tokens[i]
            tok_str = str(tok)

            # --- Skip whitespace and comments ---
            if isinstance(tok, ly.lex.Space):
                i += 1
                continue

            if isinstance(
                tok,
                (
                    ly.lex.lilypond.LineComment,
                    ly.lex.lilypond.BlockCommentStart,
                    ly.lex.lilypond.BlockComment,
                    ly.lex.lilypond.BlockCommentEnd,
                ),
            ):
                i += 1
                continue

            # --- Simultaneous music << >> ---
            if isinstance(tok, ly.lex.lilypond.SimultaneousStart):
                sim_result, consumed = self._handle_simultaneous(ly_tokens, i)
                result.extend(sim_result)
                i += consumed
                continue

            # --- SimultaneousEnd (orphaned) ---
            if isinstance(tok, ly.lex.lilypond.SimultaneousEnd):
                result.append(tok_str)
                i += 1
                continue

            # --- Direction (- ^ _): skip before markup ---
            if isinstance(tok, ly.lex.lilypond.Direction):
                dir_result, consumed = self._handle_direction(ly_tokens, i)
                result.extend(dir_result)
                i += consumed
                continue

            # --- Tempo: emit command, skip text argument ---
            if isinstance(tok, ly.lex.lilypond.Tempo):
                tempo_result, consumed = self._handle_tempo(ly_tokens, i)
                result.extend(tempo_result)
                i += consumed
                continue

            # --- Clef: handle quoted specifier ---
            if isinstance(tok, ly.lex.lilypond.Clef):
                clef_result, consumed = self._handle_clef(ly_tokens, i)
                result.extend(clef_result)
                i += consumed
                continue

            # --- Keyword tokens: keep \score only ---
            if isinstance(tok, ly.lex.lilypond.Keyword):
                if tok_str == "\\score":
                    result.append(tok_str)
                # Skip other keywords (\once, etc.)
                i += 1
                continue

            # --- Command tokens: filter musical vs non-musical ---
            # Use exact type match so subclasses (PitchCommand, Tempo,
            # Repeat, Partial, New) fall through to _KEEP_TYPES or
            # their specific handlers.
            if type(tok) is ly.lex.lilypond.Command:
                if tok_str in _MUSICAL_COMMANDS:
                    result.append(tok_str)
                    i += 1
                    # \bar collects its quoted string argument
                    if tok_str == "\\bar":
                        i = self._collect_string_arg(ly_tokens, i, result)
                    continue
                # Non-musical command: skip
                i += 1
                continue

            # --- \new / \context / \change: emit + context name ---
            if isinstance(
                tok,
                (
                    ly.lex.lilypond.New,
                    ly.lex.lilypond.Context,
                    ly.lex.lilypond.Change,
                ),
            ):
                result.append(tok_str)
                i += 1
                while i < n and isinstance(ly_tokens[i], ly.lex.Space):
                    i += 1
                if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.ContextName):
                    result.append(str(ly_tokens[i]))
                    i += 1
                continue

            # --- User commands (macros like \tr, \st) ---
            if isinstance(tok, ly.lex.lilypond.UserCommand):
                expanded = self._user_macro_map.get(tok_str)
                if not expanded:
                    expanded = _ARTICULATION_COMMANDS.get(tok_str)
                if expanded and self.config.include_articulations:
                    result.append(expanded)
                # Otherwise skip (layout macro, unknown)
                i += 1
                continue

            # --- Conditional: slurs ---
            if isinstance(
                tok,
                (
                    ly.lex.lilypond.SlurStart,
                    ly.lex.lilypond.SlurEnd,
                    ly.lex.lilypond.PhrasingSlurStart,
                    ly.lex.lilypond.PhrasingSlurEnd,
                ),
            ):
                if self.config.include_slurs:
                    result.append(tok_str)
                i += 1
                continue

            # --- Conditional: articulations ---
            if isinstance(
                tok,
                (
                    ly.lex.lilypond.ArticulationCommand,
                    ly.lex.lilypond.ScriptAbbreviation,
                ),
            ):
                if self.config.include_articulations:
                    result.append(tok_str)
                i += 1
                continue

            # --- Keep types: emit string value ---
            if isinstance(tok, _KEEP_TYPES):
                result.append(tok_str)
                i += 1
                continue

            # --- Everything else: skip ---
            i += 1

        return result

    # ------------------------------------------------------------------
    # Direction handling
    # ------------------------------------------------------------------

    def _handle_direction(self, ly_tokens: list, start: int) -> Tuple[List[str], int]:
        """Handle Direction token (``-``, ``^``, ``_``).

        Skips Direction if followed by markup or if articulations are
        disabled and it precedes a ``ScriptAbbreviation``.
        """
        i = start + 1
        n = len(ly_tokens)
        # Peek for next content token
        j = i
        while j < n and isinstance(ly_tokens[j], ly.lex.Space):
            j += 1
        if j < n:
            next_tok = ly_tokens[j]
            # Direction before markup: skip direction
            if isinstance(
                next_tok,
                (
                    ly.lex.lilypond.MarkupStart,
                    ly.lex.lilypond.Markup,
                ),
            ):
                return [], i - start
            # Direction before articulation: skip if disabled
            if isinstance(next_tok, ly.lex.lilypond.ScriptAbbreviation):
                if not self.config.include_articulations:
                    return [], i - start
        # Emit Direction if articulations are included
        if self.config.include_articulations:
            return [str(ly_tokens[start])], i - start
        return [], i - start

    # ------------------------------------------------------------------
    # Clef handling
    # ------------------------------------------------------------------

    def _handle_clef(self, ly_tokens: list, start: int) -> Tuple[List[str], int]:
        """Handle ``\\clef`` with unquoted or quoted specifier."""
        result = [str(ly_tokens[start])]  # \clef
        i = start + 1
        n = len(ly_tokens)
        while i < n and isinstance(ly_tokens[i], ly.lex.Space):
            i += 1
        if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.ClefSpecifier):
            result.append(str(ly_tokens[i]))
            i += 1
        elif i < n and isinstance(ly_tokens[i], ly.lex.lilypond.StringQuotedStart):
            # \clef "treble" — skip quotes, emit clef name
            i += 1
            if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.String):
                result.append(str(ly_tokens[i]))
                i += 1
            if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.StringQuotedEnd):
                i += 1
        return result, i - start

    # ------------------------------------------------------------------
    # Tempo handling
    # ------------------------------------------------------------------

    def _handle_tempo(self, ly_tokens: list, start: int) -> Tuple[List[str], int]:
        r"""Handle ``\tempo`` with optional text argument.

        Emits ``\tempo`` and then the tempo text (if any) as a single
        token.  Handles three forms:

        * Quoted:   ``\tempo "Allegro" 4 = 120``
        * Unquoted capitalised: ``\tempo Allegro 4 = 120``
          (python-ly: ``Unparsed("A") + Note("llegro")``)
        * Unquoted lowercase: ``\tempo allegro 4 = 120``
          (python-ly: ``Note("allegro")``)

        Subsequent metronome-mark tokens (``Length``, ``=``, integer)
        are left for the main loop.
        """
        result = [str(ly_tokens[start])]  # \tempo
        i = start + 1
        n = len(ly_tokens)
        # Skip whitespace
        while i < n and isinstance(ly_tokens[i], ly.lex.Space):
            i += 1
        # --- Quoted string: "Allegro" ---
        if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.StringQuotedStart):
            i += 1  # skip opening quote
            if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.String):
                result.append(str(ly_tokens[i]))
                i += 1
            if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.StringQuotedEnd):
                i += 1  # skip closing quote
        # --- Unquoted capitalised: Unparsed("A") + Note("llegro") ---
        elif i < n and isinstance(ly_tokens[i], ly.lex._token.Unparsed):
            text_parts = [str(ly_tokens[i])]
            i += 1
            while i < n and not isinstance(ly_tokens[i], ly.lex.Space):
                if isinstance(
                    ly_tokens[i],
                    (ly.lex.lilypond.Length, ly.lex.lilypond.EqualSign),
                ):
                    break
                text_parts.append(str(ly_tokens[i]))
                i += 1
            result.append("".join(text_parts))
        # --- Unquoted lowercase: Note("allegro") ---
        # A real note after \tempo would be a Length, not a Note, so any
        # Note token here is tempo text.
        elif i < n and isinstance(ly_tokens[i], ly.lex.lilypond.Note):
            text_parts = [str(ly_tokens[i])]
            i += 1
            # Collect additional words (e.g., "con moto" → Note + Note)
            while i < n:
                if isinstance(ly_tokens[i], ly.lex.Space):
                    # Peek past whitespace for more text words
                    j = i + 1
                    while j < n and isinstance(ly_tokens[j], ly.lex.Space):
                        j += 1
                    if j < n and isinstance(
                        ly_tokens[j],
                        (ly.lex.lilypond.Note, ly.lex._token.Unparsed),
                    ):
                        text_parts.append(" ")
                        i = j
                        text_parts.append(str(ly_tokens[i]))
                        i += 1
                        continue
                    break
                if isinstance(
                    ly_tokens[i],
                    (ly.lex.lilypond.Length, ly.lex.lilypond.EqualSign),
                ):
                    break
                text_parts.append(str(ly_tokens[i]))
                i += 1
            result.append("".join(text_parts))
        return result, i - start

    # ------------------------------------------------------------------
    # String argument collection
    # ------------------------------------------------------------------

    def _collect_string_arg(
        self, ly_tokens: list, start: int, result: List[str]
    ) -> int:
        """Collect a quoted string argument (for ``\\bar "type"``)."""
        i = start
        n = len(ly_tokens)
        while i < n and isinstance(ly_tokens[i], ly.lex.Space):
            i += 1
        if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.StringQuotedStart):
            i += 1
            if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.String):
                result.append(str(ly_tokens[i]))
                i += 1
            if i < n and isinstance(ly_tokens[i], ly.lex.lilypond.StringQuotedEnd):
                i += 1
        return i

    # ------------------------------------------------------------------
    # Simultaneous music / voice splitting
    # ------------------------------------------------------------------

    def _handle_simultaneous(
        self, ly_tokens: list, start: int
    ) -> Tuple[List[str], int]:
        """Handle ``<< ... >>`` blocks.

        If voice separators (``\\\\``) are found, wraps each voice in
        ``[PART_BEGIN]`` / ``[PART_END]``.  Otherwise emits
        ``<<`` inner ``>>``.
        """
        i = start + 1
        n = len(ly_tokens)

        # Scan for voice separators
        depth = 1
        has_voice_sep = False
        j = i
        while j < n and depth > 0:
            tok = ly_tokens[j]
            if isinstance(tok, ly.lex.lilypond.SimultaneousStart):
                depth += 1
            elif isinstance(tok, ly.lex.lilypond.SimultaneousEnd):
                depth -= 1
            elif isinstance(tok, ly.lex.lilypond.VoiceSeparator) and depth == 1:
                has_voice_sep = True
            j += 1

        if has_voice_sep:
            return self._split_voices(ly_tokens, start)

        # No voice separators — emit << inner >>
        result: List[str] = ["<<"]
        inner_tokens: list = []
        depth = 1
        while i < n and depth > 0:
            tok = ly_tokens[i]
            if isinstance(tok, ly.lex.lilypond.SimultaneousEnd):
                depth -= 1
                if depth == 0:
                    i += 1
                    break
            elif isinstance(tok, ly.lex.lilypond.SimultaneousStart):
                depth += 1
            inner_tokens.append(ly_tokens[i])
            i += 1

        result.extend(self._process_ly_tokens(inner_tokens))
        result.append(">>")
        return result, i - start

    def _split_voices(self, ly_tokens: list, start: int) -> Tuple[List[str], int]:
        """Split ``<< { } \\\\ { } >>`` into ``[PART_BEGIN]...[PART_END]``."""
        i = start + 1
        n = len(ly_tokens)
        result: List[str] = []

        voice_ranges: List[list] = [[]]
        depth = 1

        while i < n and depth > 0:
            tok = ly_tokens[i]
            if isinstance(tok, ly.lex.lilypond.SimultaneousEnd):
                depth -= 1
                if depth == 0:
                    i += 1
                    break
            elif isinstance(tok, ly.lex.lilypond.SimultaneousStart):
                depth += 1
            elif isinstance(tok, ly.lex.lilypond.VoiceSeparator) and depth == 1:
                voice_ranges.append([])
                i += 1
                continue
            voice_ranges[-1].append(tok)
            i += 1

        for voice_tokens in voice_ranges:
            inner = self._process_ly_tokens(voice_tokens)
            if inner:
                result.append("[PART_BEGIN]")
                result.extend(inner)
                result.append("[PART_END]")

        return result, i - start


# ---------------------------------------------------------------------------
# Legacy API — kept for backward compatibility
# ---------------------------------------------------------------------------


def all_lexer_tokens() -> List[str]:
    """Return special tokens emitted by the lexer.

    With python-ly token strings as the representation, most tokens are
    regular strings processed by BPE.  Only structural markers
    ``[PART_BEGIN]`` / ``[PART_END]`` are special, and these are already
    registered via the tokenizer's ``SPECIAL_TOKENS`` list.
    """
    return []
