"""Musically-informed pre-tokenization layer for LilyPond BPE tokenizer.

Converts raw python-ly lexer token strings into semantically meaningful
musical tokens (NOTE_C, DUR_4, ART_TRILL, etc.) that serve as atomic
units for BPE merging.

Pipeline: LilyPond text -> MusicalLexer -> raw strings -> THIS MODULE -> BPE
"""

from __future__ import annotations

import logging
import re
from fractions import Fraction
from typing import List

import ly.pitch

logger = logging.getLogger(__name__)

# ---------------------------------------------------------------------------
# Forward mappings: LilyPond string -> musical token(s)
# ---------------------------------------------------------------------------

_NUM_TO_NOTE = {
    0: "NOTE_C",
    1: "NOTE_D",
    2: "NOTE_E",
    3: "NOTE_F",
    4: "NOTE_G",
    5: "NOTE_A",
    6: "NOTE_B",
}

_ALTER_TO_ACC = {
    Fraction(1, 2): "ACC_SHARP",
    Fraction(-1, 2): "ACC_FLAT",
    Fraction(1, 1): "ACC_DSHARP",
    Fraction(-1, 1): "ACC_DFLAT",
}

# Languages to try, in order.  Nederlands is the python-ly default.
_PITCH_LANGUAGES = [
    "nederlands",
    "italiano",
    "deutsch",
    "english",
    "espanol",
    "catalan",
    "norsk",
    "portugues",
    "suomi",
    "svenska",
    "vlaams",
]

_pitch_readers = [ly.pitch.pitchReader(lang) for lang in _PITCH_LANGUAGES]

_OCTAVE_MAP = {
    "'": "OCT_1",
    "''": "OCT_2",
    "'''": "OCT_3",
    "''''": "OCT_4",
    "'''''": "OCT_5",
    ",": "OCT_-1",
    ",,": "OCT_-2",
    ",,,": "OCT_-3",
    ",,,,": "OCT_-4",
}

_DURATION_MAP = {
    "1": "DUR_1",
    "2": "DUR_2",
    "4": "DUR_4",
    "8": "DUR_8",
    "16": "DUR_16",
    "32": "DUR_32",
    "64": "DUR_64",
    "128": "DUR_128",
}

_ARTICULATION_MAP = {
    "\\trill": "ART_TRILL",
    "\\fermata": "ART_FERMATA",
    "\\staccato": "ART_STACCATO",
    "\\portato": "ART_PORTATO",
    "\\mordent": "ART_MORDENT",
    "\\turn": "ART_TURN",
    "\\prall": "ART_PRALL",
    "\\accent": "ART_ACCENT",
    "\\tenuto": "ART_TENUTO",
    "\\marcato": "ART_MARCATO",
    "\\staccatissimo": "ART_STACCATISSIMO",
}

_DYNAMIC_MAP = {
    "\\p": "DYN_P",
    "\\pp": "DYN_PP",
    "\\ppp": "DYN_PPP",
    "\\pppp": "DYN_PPPP",
    "\\f": "DYN_F",
    "\\ff": "DYN_FF",
    "\\fff": "DYN_FFF",
    "\\ffff": "DYN_FFFF",
    "\\mp": "DYN_MP",
    "\\mf": "DYN_MF",
    "\\fp": "DYN_FP",
    "\\sfz": "DYN_SFZ",
    "\\sf": "DYN_SF",
    "\\sff": "DYN_SFF",
    "\\sp": "DYN_SP",
    "\\spp": "DYN_SPP",
    "\\rfz": "DYN_RFZ",
    "\\<": "DYN_CRESC",
    "\\>": "DYN_DECRESC",
    "\\!": "DYN_END",
}

_COMMAND_MAP = {
    "\\time": "CMD_TIME",
    "\\key": "CMD_KEY",
    "\\clef": "CMD_CLEF",
    "\\tuplet": "CMD_TUPLET",
    "\\grace": "CMD_GRACE",
    "\\appoggiatura": "CMD_APPOGGIATURA",
    "\\acciaccatura": "CMD_ACCIACCATURA",
    "\\bar": "CMD_BAR",
    "\\repeat": "CMD_REPEAT",
    "\\alternative": "CMD_ALTERNATIVE",
    "\\tempo": "CMD_TEMPO",
    "\\partial": "CMD_PARTIAL",
    "\\score": "CMD_SCORE",
    "\\new": "CMD_NEW",
    "\\context": "CMD_CONTEXT",
    "\\change": "CMD_CHANGE",
}

_KEY_MODE_MAP = {
    "\\major": "KEY_MAJOR",
    "\\minor": "KEY_MINOR",
    "\\dorian": "KEY_DORIAN",
    "\\phrygian": "KEY_PHRYGIAN",
    "\\lydian": "KEY_LYDIAN",
    "\\mixolydian": "KEY_MIXOLYDIAN",
    "\\aeolian": "KEY_AEOLIAN",
    "\\locrian": "KEY_LOCRIAN",
    "\\ionian": "KEY_IONIAN",
}

_CLEF_MAP = {
    "treble": "CLEF_TREBLE",
    "bass": "CLEF_BASS",
    "alto": "CLEF_ALTO",
    "tenor": "CLEF_TENOR",
    "soprano": "CLEF_SOPRANO",
    "mezzosoprano": "CLEF_MEZZOSOPRANO",
    "baritone": "CLEF_BARITONE",
    "percussion": "CLEF_PERCUSSION",
    "tab": "CLEF_TAB",
}

_STRUCTURE_MAP = {
    "{": "BLOCK_START",
    "}": "BLOCK_END",
    "|": "BAR",
    "<<": "SIM_START",
    ">>": "SIM_END",
}

_CONNECTOR_MAP = {
    "~": "TIE",
    "(": "SLUR_START",
    ")": "SLUR_END",
    "\\(": "PHRASE_START",
    "\\)": "PHRASE_END",
    "[": "BEAM_START",
    "]": "BEAM_END",
}

_DIRECTION_MAP = {
    "-": "DIR_NEUTRAL",
    "^": "DIR_UP",
    "_": "DIR_DOWN",
}

_CHORD_MAP = {
    "<": "CHORD_START",
    ">": "CHORD_END",
}

_REST_MAP = {
    "r": "REST",
    "R": "REST_MULTI",
    "s": "SPACER",
}

_SCRIPT_ABBREV_MAP = {
    ".": "ART_STACCATO",
    ">": "ART_ACCENT",
    "-": "ART_TENUTO",
    "!": "ART_MARCATO",
}

_BAR_TYPE_MAP = {
    "|.": "BAR_FINAL",
    "||": "BAR_DOUBLE",
    "|:": "BAR_REPEAT_START",
    ":|": "BAR_REPEAT_END",
    ":|.": "BAR_REPEAT_END",
    "|.|:": "BAR_REPEAT_DOUBLE",
    ":..:": "BAR_REPEAT_DOUBLE",
}

_CONTEXT_MAP = {
    "Staff": "CTX_STAFF",
    "Voice": "CTX_VOICE",
    "PianoStaff": "CTX_PIANOSTAFF",
    "GrandStaff": "CTX_GRANDSTAFF",
    "ChoirStaff": "CTX_CHOIRSTAFF",
    "StaffGroup": "CTX_STAFFGROUP",
    "TabStaff": "CTX_TABSTAFF",
    "RhythmicStaff": "CTX_RHYTHMICSTAFF",
    "DrumStaff": "CTX_DRUMSTAFF",
    "Lyrics": "CTX_LYRICS",
    "ChordNames": "CTX_CHORDNAMES",
    "FiguredBass": "CTX_FIGUREDBASS",
    "Devnull": "CTX_DEVNULL",
    "NullVoice": "CTX_NULLVOICE",
}

_REPEAT_SPEC_MAP = {
    "volta": "REPEAT_VOLTA",
    "unfold": "REPEAT_UNFOLD",
    "percent": "REPEAT_PERCENT",
    "tremolo": "REPEAT_TREMOLO",
}

# Tokens that pass through unchanged (structural markers from the lexer).
_PASSTHROUGH = frozenset(
    {
        "[PART_BEGIN]",
        "[PART_END]",
        "[CLS]",
        "[SEP]",
        "[PAD]",
        "[UNK]",
        "[MASK]",
    }
)

# Regex for octave tokens: one or more ' or one or more ,
_OCTAVE_RE = re.compile(r"^('+|,+)$")

# Regex for duration tokens: pure digits
_DURATION_RE = re.compile(r"^\d+$")

# Regex for scaling (tuplet fractions): *N/M — requires leading *
_SCALING_RE = re.compile(r"^\*\d+/\d+$")

# Regex for fraction tokens (time signatures): N/M
_FRACTION_RE = re.compile(r"^\d+/\d+$")

# Regex for fingering: single digit 0-5
_FINGERING_RE = re.compile(r"^[0-5]$")

# Regex for repeat count: pure digits (same as duration, disambiguated by context)
_REPEAT_COUNT_RE = re.compile(r"^\d+$")

# Regex for validating tokens at the fallback — rejects fragments.
# Accepts: uppercase musical tokens (NOTE_C), special brackets ([PART_BEGIN]),
# part:name tokens, scaling fractions (*N/M), bare fractions (N/M), bare
# digits, single-char musical punctuation, and alphabetic words (tempo/
# expression markings like "Allegro", "rubato", "rit").
_VALID_PASSTHROUGH_RE = re.compile(
    r"^([A-Z][A-Z0-9_]*|\[.+\]|\*\d+/\d+|\d+/\d+|\d+|[=]|[A-Za-z]{2,})$"
)


def _digits(n: str) -> List[str]:
    """Convert a numeric string to a list of DIGIT_X tokens."""
    return [f"DIGIT_{ch}" for ch in n]


def _decompose_scaling(tok: str) -> List[str]:
    """Decompose a scaling fraction like ``*2/3`` into digit tokens."""
    raw = tok.lstrip("*")
    num, den = raw.split("/")
    return ["SCALE_START", *_digits(num), "SCALE_SLASH", *_digits(den)]


def _decompose_fraction(tok: str) -> List[str]:
    """Decompose a bare fraction like ``3/4`` into digit tokens."""
    num, den = tok.split("/")
    return ["FRAC_START", *_digits(num), "FRAC_SLASH", *_digits(den)]


def cap_consecutive_rests(tokens: List[str], max_bars: int = 4) -> List[str]:
    """Truncate long runs of multi-measure rests.

    Scans *tokens* for consecutive ``BAR REST_MULTI DUR_*`` patterns and
    keeps at most *max_bars* repetitions of each run.  Runs with different
    durations are capped independently.

    The first rest in a run does not need to be preceded by ``BAR`` (it may
    start the sequence).
    """
    result: List[str] = []
    i = 0
    n = len(tokens)

    while i < n:
        # Detect the start of a multi-measure rest run.
        # Pattern: REST_MULTI DUR_* (optionally preceded by BAR).
        if tokens[i] == "REST_MULTI" and i + 1 < n and tokens[i + 1].startswith("DUR_"):
            dur = tokens[i + 1]
            count = 0

            # Check if there's a BAR before this REST_MULTI that we already
            # appended — we need to count it as part of the first bar.
            has_leading_bar = len(result) > 0 and result[-1] == "BAR"

            # Collect the full run
            run_start = i
            positions: list[tuple[int, int]] = []  # (start, end) of each bar
            # First bar: REST_MULTI DUR_X (BAR was already in result)
            positions.append((i, i + 2))
            i += 2
            # Subsequent bars: BAR REST_MULTI DUR_X
            while (
                i + 2 < n
                and tokens[i] == "BAR"
                and tokens[i + 1] == "REST_MULTI"
                and tokens[i + 2] == dur
            ):
                positions.append((i, i + 3))
                i += 3

            # Emit at most max_bars
            # First bar (REST_MULTI DUR_X) — leading BAR is already in result
            for bar_idx, (s, e) in enumerate(positions):
                if bar_idx >= max_bars:
                    break
                result.extend(tokens[s:e])

            # If we had a leading BAR and capped, the result already has it
            continue

        result.append(tokens[i])
        i += 1

    return result


# ---------------------------------------------------------------------------
# Reverse mappings: musical token -> LilyPond string
# ---------------------------------------------------------------------------

# Reverse note mapping: NOTE_C -> 0, NOTE_D -> 1, etc.
_note_writer = ly.pitch.pitchWriter("nederlands")
_REV_NOTE = {tok: num for num, tok in _NUM_TO_NOTE.items()}

# Reverse accidental mapping: ACC_SHARP -> Fraction(1,2), etc.
_REV_ACC_ALTER = {v: k for k, v in _ALTER_TO_ACC.items()}
_REV_ACC = {
    "ACC_SHARP": "is",
    "ACC_FLAT": "es",
    "ACC_DSHARP": "isis",
    "ACC_DFLAT": "eses",
    "ACC_NAT": "",
}
_REV_OCTAVE = {v: k for k, v in _OCTAVE_MAP.items()}
_REV_DURATION = {v: k for k, v in _DURATION_MAP.items()}
_REV_ARTICULATION = {v: k for k, v in _ARTICULATION_MAP.items()}
_REV_DYNAMIC = {v: k for k, v in _DYNAMIC_MAP.items()}
_REV_COMMAND = {v: k for k, v in _COMMAND_MAP.items()}
_REV_KEY_MODE = {v: k for k, v in _KEY_MODE_MAP.items()}
_REV_CLEF = {v: k for k, v in _CLEF_MAP.items()}
_REV_STRUCTURE = {v: k for k, v in _STRUCTURE_MAP.items()}
_REV_CONNECTOR = {v: k for k, v in _CONNECTOR_MAP.items()}
_REV_DIRECTION = {v: k for k, v in _DIRECTION_MAP.items()}
_REV_CHORD = {v: k for k, v in _CHORD_MAP.items()}
_REV_REST = {v: k for k, v in _REST_MAP.items()}
_REV_SCRIPT_ABBREV = {v: k for k, v in _SCRIPT_ABBREV_MAP.items()}
_REV_BAR_TYPE = {v: k for k, v in _BAR_TYPE_MAP.items()}
_REV_CONTEXT = {v: k for k, v in _CONTEXT_MAP.items()}
_REV_REPEAT_SPEC = {v: k for k, v in _REPEAT_SPEC_MAP.items()}


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------


def base_vocabulary() -> List[str]:
    """Return all atomic musical tokens.

    These are registered as special tokens in the BPE trainer so they
    are never split into sub-tokens.
    """
    tokens: list[str] = []

    # Notes
    tokens.extend(_NUM_TO_NOTE.values())

    # Accidentals
    tokens.extend(["ACC_SHARP", "ACC_FLAT", "ACC_DSHARP", "ACC_DFLAT", "ACC_NAT"])

    # Octaves
    tokens.extend(_OCTAVE_MAP.values())

    # Durations
    tokens.extend(_DURATION_MAP.values())

    # Dot
    tokens.append("DOT")

    # Articulations
    tokens.extend(_ARTICULATION_MAP.values())

    # Dynamics
    tokens.extend(_DYNAMIC_MAP.values())

    # Commands
    tokens.extend(_COMMAND_MAP.values())

    # Key modes
    tokens.extend(_KEY_MODE_MAP.values())

    # Clefs
    tokens.extend(_CLEF_MAP.values())

    # Structure
    tokens.extend(_STRUCTURE_MAP.values())

    # Connectors
    tokens.extend(_CONNECTOR_MAP.values())

    # Directions
    tokens.extend(_DIRECTION_MAP.values())

    # Chords
    tokens.extend(_CHORD_MAP.values())

    # Rests
    tokens.extend(_REST_MAP.values())

    # Bar types
    tokens.extend(_BAR_TYPE_MAP.values())

    # Context names
    tokens.extend(_CONTEXT_MAP.values())

    # Repeat specifiers
    tokens.extend(_REPEAT_SPEC_MAP.values())

    # Fingering
    tokens.extend(f"FINGERING_{i}" for i in range(6))

    # Q (repeat previous chord)
    tokens.append("REPEAT_CHORD")

    # Scaling / fraction pass-through marker
    tokens.append("SCALING")

    # Tremolo
    tokens.extend(["TREMOLO_COLON", "TREMOLO"])

    # Digits (for decomposed fractions)
    tokens.extend(f"DIGIT_{i}" for i in range(10))

    # Scale fraction delimiters (*N/M tuplet scaling)
    tokens.extend(["SCALE_START", "SCALE_SLASH"])

    # Time-signature fraction delimiters (N/M)
    tokens.extend(["FRAC_START", "FRAC_SLASH"])

    # Deduplicate while preserving order
    seen: set[str] = set()
    unique: list[str] = []
    for t in tokens:
        if t not in seen:
            seen.add(t)
            unique.append(t)
    return unique


def map_note(note_str: str) -> List[str]:
    """Decompose a python-ly note string into musical tokens.

    Uses python-ly's pitch API to parse note names in any LilyPond
    language (Nederlands, Italiano, Deutsch, English, etc.) and maps
    them to canonical ``NOTE_X`` / ``ACC_X`` tokens.

    Examples:
        ``"c"``    -> ``["NOTE_C"]``
        ``"fis"``  -> ``["NOTE_F", "ACC_SHARP"]``
        ``"do"``   -> ``["NOTE_C"]``
        ``"dod"``  -> ``["NOTE_C", "ACC_SHARP"]``
        ``"as"``   -> ``["NOTE_A", "ACC_FLAT"]``
        ``"cisis"`` -> ``["NOTE_C", "ACC_DSHARP"]``
    """
    for reader in _pitch_readers:
        result = reader(note_str)
        if result is not False:
            note_num, alter = result
            tokens = [_NUM_TO_NOTE[note_num]]
            acc = _ALTER_TO_ACC.get(alter)
            if acc is not None:
                tokens.append(acc)
            return tokens

    # Unknown note-like token: pass through
    return [note_str]


def ly_tokens_to_musical(tokens: List[str]) -> List[str]:
    """Convert raw lexer output strings to musical tokens.

    Uses context-aware disambiguation:
    - ``.`` after a duration/dot → ``DOT``
    - ``.`` after a direction → ``ART_STACCATO`` (via script abbreviation)
    - Digits after ``CMD_REPEAT`` → repeat count (pass through as-is)
    """
    result: list[str] = []
    i = 0
    n = len(tokens)

    # Track context for disambiguation
    prev_category = ""  # "duration", "direction", "note", "command", etc.

    while i < n:
        tok = tokens[i]

        # Pass-through tokens (special markers)
        if tok in _PASSTHROUGH:
            result.append(tok)
            i += 1
            continue

        # Backslash commands: check all command maps
        if tok.startswith("\\"):
            mapped = (
                _COMMAND_MAP.get(tok)
                or _ARTICULATION_MAP.get(tok)
                or _DYNAMIC_MAP.get(tok)
                or _KEY_MODE_MAP.get(tok)
                or _CONNECTOR_MAP.get(tok)
            )
            if mapped:
                result.append(mapped)
                if mapped.startswith("CMD_"):
                    prev_category = "command"
                elif mapped.startswith("ART_"):
                    prev_category = "articulation"
                elif mapped.startswith("DYN_"):
                    prev_category = "dynamic"
                else:
                    prev_category = "other"
                i += 1
                continue
            # Unknown backslash command: pass through
            result.append(tok)
            prev_category = "other"
            i += 1
            continue

        # Structure tokens
        if tok in _STRUCTURE_MAP:
            result.append(_STRUCTURE_MAP[tok])
            prev_category = "structure"
            i += 1
            continue

        # Chord delimiters
        if tok in _CHORD_MAP:
            result.append(_CHORD_MAP[tok])
            prev_category = "chord"
            i += 1
            continue

        # Connectors
        if tok in _CONNECTOR_MAP:
            result.append(_CONNECTOR_MAP[tok])
            prev_category = "connector"
            i += 1
            continue

        # Direction
        if tok in _DIRECTION_MAP:
            result.append(_DIRECTION_MAP[tok])
            prev_category = "direction"
            i += 1
            continue

        # Rest/spacer
        if tok in _REST_MAP:
            result.append(_REST_MAP[tok])
            prev_category = "note"
            i += 1
            continue

        # Q (repeat previous chord)
        if tok == "q":
            result.append("REPEAT_CHORD")
            prev_category = "note"
            i += 1
            continue

        # Note-like tokens: try python-ly pitch readers across all languages
        mapped_note = map_note(tok)
        if mapped_note[0] != tok:  # map_note returns [tok] if unrecognized
            result.extend(mapped_note)
            prev_category = "note"
            i += 1
            continue

        # Octave tokens
        if _OCTAVE_RE.match(tok):
            mapped = _OCTAVE_MAP.get(tok)
            if mapped:
                result.append(mapped)
            else:
                # Deeper octaves not in map: pass through
                result.append(tok)
            prev_category = "octave"
            i += 1
            continue

        # Dot: context-dependent
        if tok == ".":
            if prev_category in ("duration", "dot"):
                result.append("DOT")
                prev_category = "dot"
            elif prev_category == "direction":
                result.append("ART_STACCATO")
                prev_category = "articulation"
            else:
                result.append("DOT")
                prev_category = "dot"
            i += 1
            continue

        # Scaling (e.g., *2/3 for tuplets) — decompose into digits
        if _SCALING_RE.match(tok):
            result.extend(_decompose_scaling(tok))
            prev_category = "scaling"
            i += 1
            continue

        # Fraction (time signatures like 3/4, 6/8) — decompose into digits
        if _FRACTION_RE.match(tok):
            result.extend(_decompose_fraction(tok))
            prev_category = "fraction"
            i += 1
            continue

        # Duration digits (but not after repeat specifier — those are counts)
        if _DURATION_RE.match(tok):
            if prev_category == "repeat_spec":
                # Repeat count: decompose into digits
                result.extend(_digits(tok))
                prev_category = "repeat_count"
            else:
                mapped = _DURATION_MAP.get(tok)
                if mapped:
                    result.append(mapped)
                    prev_category = "duration"
                else:
                    # Non-standard number (e.g. tempo BPM): decompose
                    result.extend(_digits(tok))
                    prev_category = "other"
            i += 1
            continue

        # Script abbreviation (single char after direction)
        if prev_category == "direction" and tok in _SCRIPT_ABBREV_MAP:
            result.append(_SCRIPT_ABBREV_MAP[tok])
            prev_category = "articulation"
            i += 1
            continue

        # Clef specifier (follows CMD_CLEF)
        if tok in _CLEF_MAP:
            result.append(_CLEF_MAP[tok])
            prev_category = "clef"
            i += 1
            continue

        # Context name (follows CMD_NEW)
        if tok in _CONTEXT_MAP:
            result.append(_CONTEXT_MAP[tok])
            prev_category = "context"
            i += 1
            continue

        # Repeat specifier
        if tok in _REPEAT_SPEC_MAP:
            result.append(_REPEAT_SPEC_MAP[tok])
            prev_category = "repeat_spec"
            i += 1
            continue

        # Bar type string (from \bar "||")
        if tok in _BAR_TYPE_MAP:
            result.append(_BAR_TYPE_MAP[tok])
            prev_category = "bar_type"
            i += 1
            continue

        # Tremolo colon
        if tok == ":":
            result.append("TREMOLO_COLON")
            prev_category = "tremolo"
            i += 1
            continue

        # Accidental reminder/cautionary (! or ?)
        if tok == "!" and prev_category in ("note", "octave"):
            result.append("ACC_NAT")
            prev_category = "accidental"
            i += 1
            continue
        if tok == "?" and prev_category in ("note", "octave"):
            result.append("ACC_NAT")
            prev_category = "accidental"
            i += 1
            continue

        # Fallback: pass through only if it looks like a valid token
        if _VALID_PASSTHROUGH_RE.match(tok):
            result.append(tok)
            prev_category = "other"
        else:
            logger.debug("Dropping unrecognised token: %r", tok)
        i += 1

    return result


def musical_to_ly_tokens(tokens: List[str]) -> List[str]:
    """Convert musical tokens back to LilyPond strings.

    Stateful: NOTE_C + ACC_SHARP → ``cis``, OCT_1 → ``'``, DUR_4 → ``4``.
    """
    result: list[str] = []
    i = 0
    n = len(tokens)

    while i < n:
        tok = tokens[i]

        # Note token: may need to combine with following accidental
        if tok.startswith("NOTE_") and tok in _REV_NOTE:
            note_num = _REV_NOTE[tok]
            # Peek for accidental
            if i + 1 < n and tokens[i + 1] in _REV_ACC_ALTER:
                alter = _REV_ACC_ALTER[tokens[i + 1]]
                result.append(_note_writer(note_num, alter))
                i += 2
                continue
            result.append(_note_writer(note_num, 0))
            i += 1
            continue

        # Accidental without preceding note (orphaned): emit suffix
        if tok in _REV_ACC:
            result.append(_REV_ACC[tok])
            i += 1
            continue

        # Octave
        if tok in _REV_OCTAVE:
            result.append(_REV_OCTAVE[tok])
            i += 1
            continue

        # Duration
        if tok in _REV_DURATION:
            result.append(_REV_DURATION[tok])
            i += 1
            continue

        # Dot
        if tok == "DOT":
            result.append(".")
            i += 1
            continue

        # Articulation
        if tok in _REV_ARTICULATION:
            result.append(_REV_ARTICULATION[tok])
            i += 1
            continue

        # Dynamic
        if tok in _REV_DYNAMIC:
            result.append(_REV_DYNAMIC[tok])
            i += 1
            continue

        # Command
        if tok in _REV_COMMAND:
            result.append(_REV_COMMAND[tok])
            i += 1
            continue

        # Key mode
        if tok in _REV_KEY_MODE:
            result.append(_REV_KEY_MODE[tok])
            i += 1
            continue

        # Clef
        if tok in _REV_CLEF:
            result.append(_REV_CLEF[tok])
            i += 1
            continue

        # Structure
        if tok in _REV_STRUCTURE:
            result.append(_REV_STRUCTURE[tok])
            i += 1
            continue

        # Connector
        if tok in _REV_CONNECTOR:
            result.append(_REV_CONNECTOR[tok])
            i += 1
            continue

        # Direction
        if tok in _REV_DIRECTION:
            result.append(_REV_DIRECTION[tok])
            i += 1
            continue

        # Chord
        if tok in _REV_CHORD:
            result.append(_REV_CHORD[tok])
            i += 1
            continue

        # Rest
        if tok in _REV_REST:
            result.append(_REV_REST[tok])
            i += 1
            continue

        # Bar type
        if tok in _REV_BAR_TYPE:
            result.append(_REV_BAR_TYPE[tok])
            i += 1
            continue

        # Context
        if tok in _REV_CONTEXT:
            result.append(_REV_CONTEXT[tok])
            i += 1
            continue

        # Repeat specifier
        if tok in _REV_REPEAT_SPEC:
            result.append(_REV_REPEAT_SPEC[tok])
            i += 1
            continue

        # Script abbreviation reverse
        if tok in _REV_SCRIPT_ABBREV:
            result.append(_REV_SCRIPT_ABBREV[tok])
            i += 1
            continue

        # Repeat chord
        if tok == "REPEAT_CHORD":
            result.append("q")
            i += 1
            continue

        # Tremolo
        if tok == "TREMOLO_COLON":
            result.append(":")
            i += 1
            continue

        # Fingering
        if tok.startswith("FINGERING_"):
            result.append(tok.split("_")[1])
            i += 1
            continue

        # ACC_NAT (accidental reminder)
        if tok == "ACC_NAT":
            result.append("!")
            i += 1
            continue

        # Scaling fraction: SCALE_START digits SCALE_SLASH digits → *N/M
        if tok == "SCALE_START":
            num_digits: list[str] = []
            i += 1
            while i < n and tokens[i].startswith("DIGIT_"):
                num_digits.append(tokens[i][-1])
                i += 1
            if i < n and tokens[i] == "SCALE_SLASH":
                i += 1
            den_digits: list[str] = []
            while i < n and tokens[i].startswith("DIGIT_"):
                den_digits.append(tokens[i][-1])
                i += 1
            result.append("*" + "".join(num_digits) + "/" + "".join(den_digits))
            continue

        # Bare fraction: FRAC_START digits FRAC_SLASH digits → N/M
        if tok == "FRAC_START":
            num_digits_f: list[str] = []
            i += 1
            while i < n and tokens[i].startswith("DIGIT_"):
                num_digits_f.append(tokens[i][-1])
                i += 1
            if i < n and tokens[i] == "FRAC_SLASH":
                i += 1
            den_digits_f: list[str] = []
            while i < n and tokens[i].startswith("DIGIT_"):
                den_digits_f.append(tokens[i][-1])
                i += 1
            result.append("".join(num_digits_f) + "/" + "".join(den_digits_f))
            continue

        # Bare digit sequence (repeat count, BPM, etc.): DIGIT_X... → number
        if tok.startswith("DIGIT_"):
            digits: list[str] = []
            while i < n and tokens[i].startswith("DIGIT_"):
                digits.append(tokens[i][-1])
                i += 1
            result.append("".join(digits))
            continue

        # Pass-through (unknown tokens, special markers)
        result.append(tok)
        i += 1

    return result
