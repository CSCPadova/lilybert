"""LilyPond notation utilities.

Provides syntax validation, pitch-language helpers, duration normalisation,
and comment removal.  All music-level tokenisation is handled by
:mod:`lilybert.data.lexer`.
"""

from __future__ import annotations

import re
from typing import List, Optional, Tuple

import ly.lex
import ly.lex.lilypond


class LilyPondParser:
    """LilyPond notation utilities.

    Light-weight helper used by the preprocessing and tokenisation pipeline.
    Stateless — no mutable instance attributes are needed.
    """

    # ------------------------------------------------------------------
    # Comment removal
    # ------------------------------------------------------------------

    @staticmethod
    def remove_comments(content: str) -> str:
        """Remove comments from LilyPond content using the python-ly lexer."""
        state = ly.lex.state("lilypond")
        parts: list[str] = []
        for token in state.tokens(content):
            if isinstance(
                token,
                (
                    ly.lex.lilypond.LineComment,
                    ly.lex.lilypond.BlockCommentStart,
                    ly.lex.lilypond.BlockComment,
                    ly.lex.lilypond.BlockCommentEnd,
                ),
            ):
                parts.append(" " * len(str(token)))
            else:
                parts.append(str(token))
        return "".join(parts)

    # Backward-compat alias used by tokenizer / preprocessor.
    def _remove_comments(self, content: str) -> str:
        return self.remove_comments(content)

    # ------------------------------------------------------------------
    # Brace matching
    # ------------------------------------------------------------------

    @staticmethod
    def find_matching_brace(text: str, open_idx: int) -> int:
        """Return the index *past* the matching ``}`` for the ``{`` at *open_idx*.

        If no matching brace is found the length of *text* is returned.
        """
        depth = 1
        for i in range(open_idx + 1, len(text)):
            if text[i] == "{":
                depth += 1
            elif text[i] == "}":
                depth -= 1
                if depth == 0:
                    return i + 1
        return len(text)

    # ------------------------------------------------------------------
    # Syntax validation
    # ------------------------------------------------------------------

    def validate_syntax(self, content: str) -> Tuple[bool, List[str]]:
        """Validate LilyPond syntax (bracket / brace matching).

        Returns:
            ``(is_valid, error_messages)``
        """
        errors: list[str] = []

        try:
            state = ly.lex.state("lilypond")
            tokens = list(state.tokens(content))

            brace_stack: list = []
            bracket_stack: list = []
            paren_stack: list = []

            for token in tokens:
                ts = str(token)

                if isinstance(
                    token,
                    (
                        ly.lex.lilypond.SequentialStart,
                        ly.lex.lilypond.OpenBracket,
                    ),
                ):
                    if ts == "{":
                        brace_stack.append(token)
                    elif ts == "[":
                        bracket_stack.append(token)
                elif isinstance(
                    token,
                    (
                        ly.lex.lilypond.SequentialEnd,
                        ly.lex.lilypond.CloseBracket,
                    ),
                ):
                    if ts == "}":
                        if not brace_stack:
                            errors.append("Unmatched closing brace '}' found")
                        else:
                            brace_stack.pop()
                    elif ts == "]":
                        if not bracket_stack:
                            errors.append("Unmatched closing bracket ']' found")
                        else:
                            bracket_stack.pop()
                elif isinstance(token, ly.lex.Unparsed):
                    if ts == "}":
                        errors.append("Unexpected closing brace '}' found")
                    elif ts == "]":
                        errors.append("Unexpected closing bracket ']' found")
                    elif ts == ">>":
                        errors.append("Unexpected closing '>>' found")

                if isinstance(token, ly.lex.lilypond.SimultaneousStart):
                    paren_stack.append(token)
                elif isinstance(token, ly.lex.lilypond.SimultaneousEnd):
                    if not paren_stack:
                        errors.append("Unmatched closing '>>' found")
                    else:
                        paren_stack.pop()

            if brace_stack:
                errors.append(f"{len(brace_stack)} unclosed brace(s) '{{' found")
            if bracket_stack:
                errors.append(f"{len(bracket_stack)} unclosed bracket(s) '[' found")
            if paren_stack:
                errors.append(
                    f"{len(paren_stack)} unclosed simultaneous music '<<' found"
                )

            return (len(errors) == 0, errors)

        except Exception as e:
            errors.append(f"Lexer error: {e!s}")
            return (False, errors)

    # ------------------------------------------------------------------
    # Duration normalisation
    # ------------------------------------------------------------------

    @staticmethod
    def normalize_duration(duration_str: str) -> Optional[float]:
        """Normalise a LilyPond duration string to a fractional value.

        ``1.0`` corresponds to a whole note.
        """
        if not duration_str:
            return None

        try:
            import ly.duration

            result = ly.duration.base_scaling_string(duration_str)
            if result:
                dur_frac, scale_frac = result
                return float(dur_frac * scale_frac)
        except Exception:
            pass

        # Fallback: manual parsing
        m = re.match(r"(\d+)(\.*)$", duration_str)
        if not m:
            return None
        base = int(m.group(1))
        dots = len(m.group(2))
        duration = 1.0 / base
        dot_val = duration
        for _ in range(dots):
            dot_val /= 2
            duration += dot_val
        return duration

    # ------------------------------------------------------------------
    # Pitch-language detection & conversion
    # ------------------------------------------------------------------

    @staticmethod
    def detect_pitch_language(content: str) -> str:
        """Detect ``'english'``, ``'italiano'``, or ``'mixed'``."""
        lang_match = re.search(r'\\language\s+"([^"]+)"', content)
        if lang_match:
            return lang_match.group(1)

        english_notes = re.findall(
            r"(?<![a-zA-Z])([a-g](?:is|es|isis|eses)?)(?![a-zA-Z])", content
        )
        italian_notes = re.findall(
            r"(?<![a-zA-Z])((?:do|re|mi|fa|sol|la|si)(?:d|b|diesis|bemolle)?)(?![a-zA-Z])",
            content,
        )

        eng = len(english_notes)
        ita = len(italian_notes)
        if eng > 0 and ita == 0:
            return "english"
        if ita > 0 and eng == 0:
            return "italiano"
        if eng > 0 and ita > 0:
            return "mixed"
        return "english"

    # Pitch mapping tables
    _ENG_TO_ITA = {
        "c": "do",
        "d": "re",
        "e": "mi",
        "f": "fa",
        "g": "sol",
        "a": "la",
        "b": "si",
    }
    _ITA_TO_ENG = {v: k for k, v in _ENG_TO_ITA.items()}

    def normalize_pitch(
        self, pitch_str: str, target_language: str = "english"
    ) -> Optional[str]:
        """Normalise a pitch string to *target_language*."""
        # Italian pattern (more specific, tested first)
        m = re.match(
            r"^(do|re|mi|fa|sol|la|si)"
            r"(d{1,2}|b{1,2}|diesis|bemolle|doppio-diesis|doppio-bemolle)?$",
            pitch_str,
        )
        if m:
            base = m.group(1)
            acc = m.group(2) or ""
            if target_language == "english":
                eng_base = self._ITA_TO_ENG.get(base, base)
                eng_acc = {
                    "d": "is",
                    "diesis": "is",
                    "b": "es",
                    "bemolle": "es",
                    "dd": "isis",
                    "doppio-diesis": "isis",
                    "bb": "eses",
                    "doppio-bemolle": "eses",
                }.get(acc, "")
                return eng_base + eng_acc
            # Normalise Italian accidentals to short form
            acc = {
                "diesis": "d",
                "bemolle": "b",
                "doppio-diesis": "dd",
                "doppio-bemolle": "bb",
            }.get(acc, acc)
            return base + acc

        # English pattern
        m = re.match(r"^([a-g])(is|es|isis|eses)?$", pitch_str)
        if m:
            base = m.group(1)
            acc = m.group(2) or ""
            if target_language == "italiano":
                ita_base = self._ENG_TO_ITA.get(base, base)
                ita_acc = {
                    "is": "d",
                    "es": "b",
                    "isis": "dd",
                    "eses": "bb",
                }.get(acc, "")
                return ita_base + ita_acc
            return base + acc

        return None

    def convert_pitch_language(self, content: str, target_language: str) -> str:
        """Convert all pitches in *content* to *target_language*."""

        def _replace(match: re.Match) -> str:
            p = match.group(0)
            return self.normalize_pitch(p, target_language) or p

        # Italian pitches first (more specific)
        content = re.sub(
            r"\b((?:do|re|mi|fa|sol|la|si)"
            r"(?:d{1,2}|b{1,2}|diesis|bemolle|doppio-diesis|doppio-bemolle)?)\b",
            _replace,
            content,
        )
        # English pitches
        content = re.sub(r"\b([a-g](?:is|es|isis|eses)?)\b", _replace, content)
        return content
