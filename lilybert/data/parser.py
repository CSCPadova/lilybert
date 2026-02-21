"""LilyPond music notation parser and utilities."""

import logging
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

import ly.document
import ly.lex

logger = logging.getLogger(__name__)


@dataclass
class LilyPondElement:
    """Represents a parsed LilyPond element."""

    type: str  # note, chord, rest, directive, raw, etc.
    content: str  # raw content
    duration: Optional[str] = (
        None  # <--- Duration is not an LP Element itself, but an attribute within an LP element, and used in statistics
    )
    pitch: Optional[str] = None
    octave: Optional[int] = None
    attributes: Optional[Dict[str, Any]] = None


class LilyPondParser:
    """Parser for LilyPond music notation files.

    This class handles parsing and basic analysis of LilyPond (.ly) files,
    extracting musical elements for training data preparation.

    Note: This parser uses python-ly lexer for tokenization, validated against
    PostScript output for note counting accuracy.
    """

    # Note patterns for multilingual support
    ENGLISH_NOTE_PATTERN = re.compile(
        r"(?<![a-zA-Z])"  # no letter before (prevents matching inside words)
        r"([a-g]"  # base note
        r"(?:is|es|isis|eses)?"  # optional accidentals (is/es/isis/eses)
        r"(?:'+|,+)?"  # optional octave markers
        r"(?:\d+\.*)?"  # optional duration (e.g. 4 or 8.)
        r")"  # no letter after (prevents 'cat' etc.)
    )

    ITALIAN_NOTE_PATTERN = re.compile(
        r"(?<![a-zA-Z])"  # no letter before
        r"((?:do|re|mi|fa|sol|la|si)"  # base note names
        r"(?:-?(?:diesis|bemolle|doppio-diesis|doppio-bemolle)|d|b)?"  # optional accidentals
        r"(?:'+|,+)?"  # optional octave markers
        r"[!?]?"  # optional cautionary accidentals
        r"(?:\d+\.*)?"  # optional duration
        r")"  # no letter after
    )
    NOTE_PATTERN = re.compile(rf"({ITALIAN_NOTE_PATTERN.pattern})")
    CHORD_PATTERN = re.compile(r"<([^>]+)>(\d+\.?)?")
    DURATION_PATTERN = re.compile(r"(\d+\.?)")
    REST_PATTERN = re.compile(r"(?:(?<![a-zA-Z])r\d*\.?|\\rest)")
    DIRECTIVE_PATTERN = re.compile(r"\\([a-zA-Z]+)(?:\s+([^\\{}\n]*))?")

    KEY_PATTERN = re.compile(
        rf"\\key\s+((?:(?:do|re|mi|fa|sol|la|si)(?:-?(?:diesis|bemolle|doppio-diesis|doppio-bemolle)|d|b)?|[a-g](?:is|es|isis|eses)?)(?:,+|\'*)?(?:\d+\.*)?)\s*\\(major|minor)"
    )
    TIME_PATTERN = re.compile(r"\\time\s+(\d+/\d+)")
    CLEF_PATTERN = re.compile(r"\\clef\s+([a-zA-Z]+)")
    RELATIVE_PATTERN = re.compile(rf"\\relative\s+{NOTE_PATTERN.pattern}*\s*{{")
    TEMPO_PATTERN = re.compile(
        r"\\tempo\s+((?:\"[^\"]+\"\s*\d*(?:\.)?\s*=\s*\d+)|(?:\"[^\"]+\")|(\d+(?:\.)?\s*=\s*\d+))"
    )
    REPEAT_PATTERN = re.compile(r"\\repeat\s+unfold\s*(\d+)\s*\{")

    def __init__(self):
        """Initialize the LilyPond parser."""
        self.elements = []
        self.metadata = {}

    def parse_file(self, file_path: str) -> List[LilyPondElement]:
        """Parse a LilyPond file.

        Args:
            file_path: Path to the .ly file

        Returns:
            List of parsed LilyPond elements
        """
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()
            return self.parse_content(content)
        except Exception as e:
            logger.error(f"Error parsing file {file_path}: {e}")
            return []

    def parse_content(self, content: str) -> List[LilyPondElement]:
        """Parse LilyPond content string.

        Args:
            content: LilyPond notation content

        Returns:
            List of parsed elements
        """
        self.elements = []
        self.metadata = {}

        # Remove comments
        content = self._remove_comments(content)

        # Extract metadata (header block)
        self.metadata = self._extract_metadata(content)

        # Find header metadata (kind of irrelevant now that we have labels, but maybe useful for future)
        header_match = re.search(r"\\header\s*\{", content, re.DOTALL)
        music_content = ""
        if header_match:
            start_idx = header_match.start()  # start of \header
            end_idx = header_match.end() - 1  # position of the opening {
            header_content = self.parse_enclosure(content[end_idx:], "{", "}")
            # Remove the entire header block from content
            music_content = (
                content[:start_idx] + content[end_idx + len(header_content) :]
            )
        else:
            music_content = content
        # Find music blocks. Default is relative blocks. Can always be changed depending on dataset
        music_blocks = self._extract_music_blocks(music_content, self.RELATIVE_PATTERN)

        # Parse each music block
        for block in music_blocks:
            self.elements.extend(self._parse_music_block(block))

        return self.elements

    def _remove_comments(self, content: str) -> str:
        """Remove comments from LilyPond content using python-ly lexer."""
        state = ly.lex.state('lilypond')
        result_parts = []

        for token in state.tokens(content):
            # Skip comment tokens
            if isinstance(token, (ly.lex.lilypond.LineComment,
                                 ly.lex.lilypond.BlockCommentStart,
                                 ly.lex.lilypond.BlockComment,
                                 ly.lex.lilypond.BlockCommentEnd)):
                # Replace with space to preserve positions
                result_parts.append(' ' * len(str(token)))
            else:
                result_parts.append(str(token))

        return ''.join(result_parts)

    def parse_enclosure(self, s: str, oc: str, ec: str) -> str:
        b_level = 0
        res = ""
        for c in s:
            res += c
            if c == oc:
                b_level += 1
            if c == ec:
                b_level -= 1
            if b_level == 0:
                break
        return res

    def _extract_metadata(self, content: str) -> Dict[str, str]:
        """Extract metadata from header block."""
        metadata = {}

        # Find header block
        header_match = re.search(r"\\header\s*\{", content, re.DOTALL)
        if header_match:
            starting_idx = header_match.end() - 1
            header_content = self.parse_enclosure(content[starting_idx:], "{", "}")
            # Extract key-value pairs
            for match in re.finditer(
                r"(\w+)\s*=\s*(?:\\markup\s*(?:(?:\\[a-zA-Z,_,-]+)+)?\s*\{\s*\"([^\"]*)\"\}|\"([^\"]*)\")",
                header_content,
            ):
                key = match.group(1)
                value = match.group(2) or match.group(3)
                metadata[key] = value
        return metadata

    def _extract_music_blocks(
        self, content: str, block_pattern: re.Pattern
    ) -> List[str]:
        """Extract LilyPond music notation blocks inside \relative commands."""
        blocks = []
        i = 0
        brace_level = 0
        in_music = False
        current_block = ""

        while i < len(content):
            # Try to match a \relative pattern at current position
            match = block_pattern.match(content, i)
            if match:
                in_music = True
                brace_level = 1  # The opening brace belongs to this block
                current_block = ""
                i = match.end()  # Move past the opening '{'
                continue

            char = content[i]

            if in_music:
                if char == "{":
                    brace_level += 1
                    current_block += char
                elif char == "}":
                    brace_level -= 1
                    if brace_level == 0:
                        # End of this \relative block
                        blocks.append(current_block.strip())
                        in_music = False
                        current_block = ""
                    else:
                        current_block += char
                else:
                    current_block += char
            i += 1
        return blocks

    def _parse_music_block(self, block: str) -> List[LilyPondElement]:
        """Parse a single music block."""
        elements = []

        # Remove extra whitespace and newlines
        block = re.sub(r"\s+", " ", block).strip()

        # Tokenize the block
        tokens = self._tokenize_music(block)

        for token in tokens:
            element = self._parse_token(token)
            if element:
                elements.append(element)

        return elements

    def _tokenize_music(self, block: str) -> List[str]:
        """Tokenize music block into individual elements using python-ly lexer.

        This preserves the exact tokenization behavior needed for PostScript validation.
        """
        state = ly.lex.state('lilypond')
        tokens = []
        token_buffer = []

        def flush_buffer():
            if token_buffer:
                token_str = ''.join(str(t) for t in token_buffer)
                if token_str.strip():
                    tokens.append(token_str.strip())
                token_buffer.clear()

        lex_tokens = list(state.tokens(block))
        i = 0

        while i < len(lex_tokens):
            token = lex_tokens[i]
            token_str = str(token)

            # Skip whitespace tokens (flush buffer first)
            if isinstance(token, ly.lex.Space):
                flush_buffer()
                i += 1
                continue

            # Handle simultaneous music << >>
            if isinstance(token, ly.lex.lilypond.SimultaneousStart):
                flush_buffer()
                tokens.append('<<')
                i += 1
                continue

            if isinstance(token, ly.lex.lilypond.SimultaneousEnd):
                flush_buffer()
                # Check for duration after >>
                if i + 1 < len(lex_tokens) and isinstance(lex_tokens[i + 1], ly.lex.lilypond.DecimalValue):
                    duration = str(lex_tokens[i + 1])
                    tokens.append('>>' + duration)
                    i += 2
                else:
                    tokens.append('>>')
                    i += 1
                continue

            # Handle chords < ... >
            # Can be either ChordStart/ChordEnd or Unparsed('<')/Unparsed('>')
            if isinstance(token, ly.lex.lilypond.ChordStart) or (isinstance(token, ly.lex.Unparsed) and token_str == '<'):
                flush_buffer()
                chord_parts = ['<']
                i += 1
                # Collect chord content
                chord_end_found = False
                while i < len(lex_tokens):
                    current = lex_tokens[i]
                    current_str = str(current)
                    # Check for chord end
                    if isinstance(current, ly.lex.lilypond.ChordEnd) or (isinstance(current, ly.lex.Unparsed) and current_str == '>'):
                        chord_end_found = True
                        break
                    if not isinstance(current, ly.lex.Space):
                        chord_parts.append(current_str)
                    i += 1

                if chord_end_found:
                    chord_parts.append('>')
                    i += 1
                    # Check for duration after chord
                    if i < len(lex_tokens) and isinstance(lex_tokens[i], (ly.lex.lilypond.DecimalValue, ly.lex.lilypond.Length)):
                        chord_parts.append(str(lex_tokens[i]))
                        i += 1
                    tokens.append(''.join(chord_parts))
                    continue
                else:
                    # Not a valid chord, treat as regular token
                    tokens.append('<')
                    continue

            # Handle voice separator \\
            if isinstance(token, ly.lex.lilypond.VoiceSeparator):
                flush_buffer()
                tokens.append(r'\\')
                i += 1
                continue

            # Handle commands (\\key, \\time, \\clef, etc.)
            if isinstance(token, (ly.lex.lilypond.Command, ly.lex.lilypond.PitchCommand,
                                 ly.lex.lilypond.Keyword)):
                flush_buffer()
                command_parts = [token_str]
                i += 1

                # Special handling for specific commands that take arguments
                if token_str in ['\\key', '\\time', '\\clef', '\\tempo', '\\relative', '\\repeat']:
                    # Collect arguments until we hit a bracket or next command
                    while i < len(lex_tokens):
                        next_tok = lex_tokens[i]
                        if isinstance(next_tok, (ly.lex.lilypond.OpenBracket,
                                                 ly.lex.lilypond.SequentialStart,
                                                 ly.lex.lilypond.SimultaneousStart,
                                                 ly.lex.lilypond.Command,
                                                 ly.lex.lilypond.PitchCommand)):
                            break
                        if not isinstance(next_tok, ly.lex.Space) or len(command_parts) == 1:
                            # Keep first space after command
                            command_parts.append(str(next_tok))
                        i += 1

                    # Special handling for \repeat which includes the block
                    if token_str == '\\repeat':
                        # Find the opening bracket
                        while i < len(lex_tokens) and not isinstance(lex_tokens[i], ly.lex.lilypond.SequentialStart):
                            if not isinstance(lex_tokens[i], ly.lex.Space):
                                command_parts.append(str(lex_tokens[i]))
                            i += 1
                        if i < len(lex_tokens):
                            # Include the block content
                            bracket_count = 0
                            while i < len(lex_tokens):
                                tok = lex_tokens[i]
                                command_parts.append(str(tok))
                                if isinstance(tok, ly.lex.lilypond.SequentialStart):
                                    bracket_count += 1
                                elif isinstance(tok, ly.lex.lilypond.SequentialEnd):
                                    bracket_count -= 1
                                    if bracket_count == 0:
                                        i += 1
                                        break
                                i += 1

                tokens.append(''.join(command_parts))
                continue

            # Handle notes
            if isinstance(token, (ly.lex.lilypond.Note, ly.lex.lilypond.Name)):
                # Check if this could be a note
                if token_str[0] in 'abcdefg' or token_str in ['do', 're', 'mi', 'fa', 'sol', 'la', 'si']:
                    flush_buffer()
                    note_parts = [token_str]
                    i += 1
                    # Collect accidentals, octaves, durations
                    while i < len(lex_tokens):
                        next_tok = lex_tokens[i]
                        if isinstance(next_tok, (ly.lex.lilypond.Accidental,
                                                ly.lex.lilypond.Octave,
                                                ly.lex.lilypond.OctaveCheck,
                                                ly.lex.lilypond.DecimalValue,
                                                ly.lex.lilypond.Length)):
                            note_parts.append(str(next_tok))
                            i += 1
                        elif isinstance(next_tok, ly.lex.lilypond.Name):
                            # Could be accidental name like 'is', 'es', 'diesis', 'bemolle'
                            next_str = str(next_tok)
                            if next_str in ['is', 'es', 'isis', 'eses', 'd', 'b', 'diesis', 'bemolle',
                                          'doppio-diesis', 'doppio-bemolle']:
                                note_parts.append(next_str)
                                i += 1
                            else:
                                break
                        else:
                            break
                    tokens.append(''.join(note_parts))
                    continue

            # Handle rests
            if isinstance(token, ly.lex.lilypond.Rest) or (isinstance(token, ly.lex.lilypond.Name) and token_str == 'r'):
                flush_buffer()
                rest_parts = [token_str]
                i += 1
                # Check for duration
                if i < len(lex_tokens) and isinstance(lex_tokens[i], (ly.lex.lilypond.DecimalValue, ly.lex.lilypond.Length)):
                    rest_parts.append(str(lex_tokens[i]))
                    i += 1
                tokens.append(''.join(rest_parts))
                continue

            # Handle bar lines
            if token_str == '|':
                flush_buffer()
                tokens.append('|')
                i += 1
                continue

            # Handle brackets and other delimiters
            if isinstance(token, (ly.lex.lilypond.OpenBracket, ly.lex.lilypond.CloseBracket,
                                 ly.lex.lilypond.SequentialStart, ly.lex.lilypond.SequentialEnd,
                                 ly.lex.lilypond.Delimiter)):
                flush_buffer()
                tokens.append(token_str)
                i += 1
                continue

            # Handle strings
            if isinstance(token, (ly.lex.lilypond.String, ly.lex.lilypond.StringQuotedStart, ly.lex.lilypond.StringQuotedEnd)):
                flush_buffer()
                string_parts = []
                # Collect entire string
                while i < len(lex_tokens) and isinstance(lex_tokens[i], (ly.lex.lilypond.String, ly.lex.lilypond.StringQuotedStart,
                                                                          ly.lex.lilypond.StringQuotedEnd)):
                    string_parts.append(str(lex_tokens[i]))
                    if isinstance(lex_tokens[i], ly.lex.lilypond.StringQuotedEnd):
                        i += 1
                        break
                    i += 1
                if string_parts:
                    tokens.append(''.join(string_parts))
                continue

            # Default: add to buffer or create token
            if token_str.strip():
                token_buffer.append(token)
            i += 1

        flush_buffer()
        return tokens

    def _parse_token(self, token: str) -> Optional[LilyPondElement]:
        """Parse a single token into a LilyPond element."""

        # Check for chords:
        # Account for notes contained within them
        chord_match = self.CHORD_PATTERN.match(token)
        if chord_match:
            note_content = chord_match.group(1)
            notes = re.findall(self.NOTE_PATTERN, note_content)
            duration = chord_match.group(2)
            return LilyPondElement(
                type="chord",
                content=token,
                duration=duration,
                attributes={"note_count": len(notes), "notes": notes},
            )

        # Check for directives
        if token.startswith("\\"):
            directive_match = self.DIRECTIVE_PATTERN.match(token)
            repeat_match = self.REPEAT_PATTERN.search(token)
            if directive_match and not repeat_match:
                return LilyPondElement(
                    type="directive",
                    content=token,
                    attributes={"directive": directive_match.group(1)},
                )
            # Check for Repeat Declarations:
            # Account for notes contained within repeats and the number of times that sequence is to be repeated
            elif directive_match and repeat_match:
                start_cbracket = repeat_match.end() - 1
                note_content = self.parse_enclosure(token[start_cbracket:], "{", "}")
                notes = re.findall(self.NOTE_PATTERN, note_content)
                multiple = int(repeat_match.group(1))
                return LilyPondElement(
                    type="directive",
                    content=token,
                    attributes={
                        "directive": directive_match.group(1),
                        "note_count": (len(notes) * multiple),
                        "notes": notes,
                    },
                )

        # Check for notes
        note_match = self.NOTE_PATTERN.match(token)
        if note_match:
            note_content = note_match.group(1)
            pitch, octave, duration = self._parse_note_components(note_content)
            return LilyPondElement(
                type="note",
                content=token,
                pitch=pitch,
                octave=octave,
                duration=duration,
            )

        # Check for rests
        rest_match = self.REST_PATTERN.match(token)
        if rest_match:
            duration_match = self.DURATION_PATTERN.search(token)
            duration = duration_match.group(1) if duration_match else None
            return LilyPondElement(type="rest", content=token, duration=duration)

        # Default: treat as raw content
        return LilyPondElement(type="raw", content=token)

    def _parse_note_components(
        self, note: str
    ) -> Tuple[str, Optional[int], Optional[str]]:
        """Parse note components (pitch, octave, duration)."""
        # Extract pitch (note name + accidental)
        pitch_match = re.match(
            r"(?:[a-g](?:is|es)?|(?:do|re|mi|fa|sol|la|si)(?:d|b)?)", note
        )
        pitch = pitch_match.group(0) if pitch_match else None

        # Extract octave indicators
        octave = None
        if "'" in note:
            octave = note.count("'")
        elif "," in note:
            octave = -note.count(",")

        # Extract duration
        duration_match = self.DURATION_PATTERN.search(note)
        duration = duration_match.group(1) if duration_match else None

        return pitch, octave, duration

    def get_statistics(self) -> Dict[str, Any]:
        """Get statistics about parsed content."""
        stats = {
            "total_elements": len(self.elements),
            "element_types": {},
            "note_count": 0,
            "chord_count": 0,
            "rest_count": 0,
            "unique_pitches": set(),
            "durations": set(),
        }

        for element in self.elements:
            # Count element types
            if element.type not in stats["element_types"]:
                stats["element_types"][element.type] = 0
            stats["element_types"][element.type] += 1

            # Count specific types
            if element.type == "note":
                stats["note_count"] += 1
                if element.pitch:
                    stats["unique_pitches"].add(element.pitch)
                if element.duration:
                    stats["durations"].add(element.duration)
            elif element.type == "chord":
                stats["chord_count"] += 1
                stats["note_count"] += element.attributes["note_count"]
                if element.duration:
                    stats["durations"].add(element.duration)
            elif element.type == "rest":
                stats["rest_count"] += 1
                if element.duration:
                    stats["durations"].add(element.duration)
            elif element.type == "directive" and ("note_count" in element.attributes):
                stats["note_count"] += element.attributes["note_count"]

        # Convert sets to lists for JSON serialization
        stats["unique_pitches"] = list(stats["unique_pitches"])
        stats["durations"] = list(stats["durations"])

        return stats

    def to_sequence(self, include_metadata: bool = True) -> str:
        """Convert parsed elements back to a sequence format.

        Args:
            include_metadata: Whether to include metadata in output

        Returns:
            String representation of the music sequence
        """
        parts = []

        if include_metadata and self.metadata:
            # Add metadata as special tokens
            for key, value in self.metadata.items():
                parts.append(f"<{key}:{value}>")

        # Add music elements
        for element in self.elements:
            parts.append(element.content)

        return " ".join(parts)

    def validate_syntax(self, content: str) -> Tuple[bool, List[str]]:
        """Validate LilyPond syntax using python-ly lexer.

        Args:
            content: LilyPond content to validate

        Returns:
            Tuple of (is_valid, list of error messages)
        """
        errors = []

        try:
            state = ly.lex.state('lilypond')
            tokens = list(state.tokens(content))

            # Basic validation: check for unmatched brackets/braces
            bracket_stack = []
            brace_stack = []
            paren_stack = []
            has_unmatched_closing = False

            for token in tokens:
                token_str = str(token)

                # Track opening/closing brackets
                if isinstance(token, (ly.lex.lilypond.SequentialStart, ly.lex.lilypond.OpenBracket)):
                    if token_str == '{':
                        brace_stack.append(token)
                    elif token_str == '[':
                        bracket_stack.append(token)
                elif isinstance(token, (ly.lex.lilypond.SequentialEnd, ly.lex.lilypond.CloseBracket)):
                    if token_str == '}':
                        if not brace_stack:
                            errors.append(f"Unmatched closing brace '}}' found")
                            has_unmatched_closing = True
                        else:
                            brace_stack.pop()
                    elif token_str == ']':
                        if not bracket_stack:
                            errors.append(f"Unmatched closing bracket ']' found")
                            has_unmatched_closing = True
                        else:
                            bracket_stack.pop()

                # Check for Unparsed tokens that are actually brackets (lexer may mark invalid brackets as Unparsed)
                elif isinstance(token, ly.lex.Unparsed):
                    if token_str == '}':
                        errors.append(f"Unexpected closing brace '}}' found")
                        has_unmatched_closing = True
                    elif token_str == ']':
                        errors.append(f"Unexpected closing bracket ']' found")
                        has_unmatched_closing = True
                    elif token_str == '>>':
                        errors.append(f"Unexpected closing '>>' found")
                        has_unmatched_closing = True

                # Check for simultaneous music
                if isinstance(token, ly.lex.lilypond.SimultaneousStart):
                    paren_stack.append(token)
                elif isinstance(token, ly.lex.lilypond.SimultaneousEnd):
                    if not paren_stack:
                        errors.append(f"Unmatched closing '>>' found")
                        has_unmatched_closing = True
                    else:
                        paren_stack.pop()

            # Check for unclosed brackets
            if brace_stack:
                errors.append(f"{len(brace_stack)} unclosed brace(s) '{{' found")
            if bracket_stack:
                errors.append(f"{len(bracket_stack)} unclosed bracket(s) '[' found")
            if paren_stack:
                errors.append(f"{len(paren_stack)} unclosed simultaneous music '<<' found")

            return (len(errors) == 0, errors)

        except Exception as e:
            errors.append(f"Lexer error: {str(e)}")
            return (False, errors)

    def normalize_duration(self, duration_str: str) -> Optional[float]:
        """Normalize a LilyPond duration string to a fractional value.

        Args:
            duration_str: Duration string (e.g., '4', '8.', '16')

        Returns:
            Fractional duration value (1.0 = whole note), or None if invalid
        """
        if not duration_str:
            return None

        try:
            import ly.duration

            # Parse duration with ly.duration
            result = ly.duration.base_scaling_string(duration_str)
            if result:
                # result is a tuple of (Fraction, Fraction) - (duration, scaling)
                duration_frac, scaling_frac = result
                # Convert to float (relative to whole note)
                return float(duration_frac * scaling_frac)
        except Exception:
            pass

        # Fallback: manual parsing
        # Extract base duration number
        match = re.match(r'(\d+)(\.*)$', duration_str)
        if not match:
            return None

        base = int(match.group(1))
        dots = len(match.group(2))

        # Calculate duration: 1/base for the base note
        duration = 1.0 / base

        # Add dotted duration (each dot adds half of the previous value)
        dot_value = duration
        for _ in range(dots):
            dot_value /= 2
            duration += dot_value

        return duration

    def detect_pitch_language(self, content: str) -> str:
        """Detect the pitch language used in LilyPond content.

        Args:
            content: LilyPond content to analyze

        Returns:
            'english', 'italiano', or 'mixed'
        """
        # Check for explicit language directive
        lang_match = re.search(r'\\language\s+"([^"]+)"', content)
        if lang_match:
            return lang_match.group(1)

        # Analyze pitch names to infer language.
        # Use lookaround instead of \b so that a trailing digit (duration)
        # does not prevent the match (e.g. "do4", "c4").
        english_notes = re.findall(r'(?<![a-zA-Z])([a-g](?:is|es|isis|eses)?)(?![a-zA-Z])', content)
        italian_notes = re.findall(r'(?<![a-zA-Z])((?:do|re|mi|fa|sol|la|si)(?:d|b|diesis|bemolle)?)(?![a-zA-Z])', content)

        english_count = len(english_notes)
        italian_count = len(italian_notes)

        if english_count > 0 and italian_count == 0:
            return 'english'
        elif italian_count > 0 and english_count == 0:
            return 'italiano'
        elif english_count > 0 and italian_count > 0:
            return 'mixed'
        else:
            return 'english'  # default

    def normalize_pitch(self, pitch_str: str, target_language: str = 'english') -> Optional[str]:
        """Normalize a pitch string to a target language.

        Args:
            pitch_str: Pitch string (e.g., 'cis', 'red', 'do', 'a')
            target_language: Target language ('english' or 'italiano')

        Returns:
            Normalized pitch string, or None if invalid
        """
        # Mapping tables
        english_to_italian = {
            'c': 'do', 'd': 're', 'e': 'mi', 'f': 'fa',
            'g': 'sol', 'a': 'la', 'b': 'si'
        }
        italian_to_english = {v: k for k, v in english_to_italian.items()}

        # Try Italian pattern first (more specific)
        # Match: base note + optional accidentals (long or short form)
        ital_match = re.match(
            r'^(do|re|mi|fa|sol|la|si)'
            r'(d{1,2}|b{1,2}|diesis|bemolle|doppio-diesis|doppio-bemolle)?$',
            pitch_str
        )
        if ital_match:
            base = ital_match.group(1)
            acc = ital_match.group(2) or ''

            if target_language == 'english':
                # Convert to English
                english_base = italian_to_english.get(base, base)
                # Convert accidentals
                english_acc = ''
                if acc in ('d', 'diesis'):
                    english_acc = 'is'
                elif acc in ('b', 'bemolle'):
                    english_acc = 'es'
                elif acc in ('dd', 'doppio-diesis'):
                    english_acc = 'isis'
                elif acc in ('bb', 'doppio-bemolle'):
                    english_acc = 'eses'
                return english_base + english_acc
            else:
                # Normalize Italian accidentals to short form
                if acc == 'diesis':
                    acc = 'd'
                elif acc == 'bemolle':
                    acc = 'b'
                elif acc == 'doppio-diesis':
                    acc = 'dd'
                elif acc == 'doppio-bemolle':
                    acc = 'bb'
                return base + acc

        # Try English pattern
        eng_match = re.match(r'^([a-g])(is|es|isis|eses)?$', pitch_str)
        if eng_match:
            base = eng_match.group(1)
            acc = eng_match.group(2) or ''

            if target_language == 'italiano':
                # Convert to Italian
                italian_base = english_to_italian.get(base, base)
                # Convert accidentals
                italian_acc = ''
                if acc == 'is':
                    italian_acc = 'd'
                elif acc == 'es':
                    italian_acc = 'b'
                elif acc == 'isis':
                    italian_acc = 'dd'
                elif acc == 'eses':
                    italian_acc = 'bb'
                return italian_base + italian_acc
            else:
                return base + acc

        return None

    def convert_pitch_language(self, content: str, target_language: str) -> str:
        """Convert all pitches in content to a target language.

        Args:
            content: LilyPond content
            target_language: Target language ('english' or 'italiano')

        Returns:
            Content with converted pitches
        """
        def replace_pitch(match):
            pitch = match.group(0)
            normalized = self.normalize_pitch(pitch, target_language)
            return normalized if normalized else pitch

        # Replace Italian pitches first (more specific patterns)
        # Match Italian notes with optional long or short accidentals
        content = re.sub(
            r'\b((?:do|re|mi|fa|sol|la|si)(?:d{1,2}|b{1,2}|diesis|bemolle|doppio-diesis|doppio-bemolle)?)\b',
            replace_pitch,
            content
        )

        # Replace English pitches
        # Match English notes with optional accidentals
        content = re.sub(
            r'\b([a-g](?:is|es|isis|eses)?)\b',
            replace_pitch,
            content
        )

        return content
