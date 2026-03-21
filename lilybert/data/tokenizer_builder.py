"""Build an extended pretrained tokenizer with LilyPond-specific tokens.

Loads a pretrained CodeBERT/RoBERTa tokenizer and adds common LilyPond
backslash commands so that notation-specific keywords are represented as
single tokens rather than subword fragments.
"""

from __future__ import annotations

from pathlib import Path
from typing import List

from transformers import AutoTokenizer, PreTrainedTokenizerFast

# fmt: off
LILYPOND_COMMANDS: List[str] = [
    # --- Articulations / ornaments ---
    "\\trill", "\\fermata", "\\mordent", "\\turn", "\\prall",
    "\\staccato", "\\accent", "\\tenuto", "\\marcato",
    "\\staccatissimo", "\\portato", "\\breathe", "\\caesura",
    "\\arpeggio", "\\glissando",

    # --- Dynamics ---
    "\\p", "\\pp", "\\ppp", "\\pppp",
    "\\f", "\\ff", "\\fff", "\\ffff",
    "\\mp", "\\mf", "\\fp",
    "\\sfz", "\\sf", "\\sff", "\\sp", "\\spp", "\\rfz",
    "\\cresc", "\\decresc",

    # --- Musical commands ---
    "\\time", "\\key", "\\clef", "\\tempo", "\\partial",
    "\\bar", "\\repeat", "\\alternative", "\\tuplet",
    "\\grace", "\\appoggiatura", "\\acciaccatura",
    "\\unfoldRepeats", "\\volta", "\\fine", "\\segno", "\\coda",
    "\\cadenzaOn", "\\cadenzaOff",
    "\\compressMMRests", "\\ottava",

    # --- Key modes ---
    "\\major", "\\minor",
    "\\dorian", "\\phrygian", "\\lydian", "\\mixolydian",
    "\\aeolian", "\\locrian", "\\ionian",

    # --- Structural / blocks ---
    "\\score", "\\new", "\\context", "\\change",
    "\\relative", "\\absolute", "\\transpose", "\\fixed",
    "\\with", "\\consists", "\\remove",
    "\\header", "\\paper", "\\layout", "\\midi",
    "\\version", "\\language", "\\include",
    "\\markup", "\\markuplist",

    # --- Property overrides ---
    "\\override", "\\revert", "\\set", "\\unset",
    "\\once", "\\omit", "\\undo",

    # --- Pedal / sustain ---
    "\\sustainOn", "\\sustainOff",
    "\\sostenutoOn", "\\sostenutoOff",

    # --- Voice ---
    "\\voiceOne", "\\voiceTwo", "\\voiceThree", "\\voiceFour",
    "\\oneVoice",

    # --- Stem / beam ---
    "\\stemUp", "\\stemDown", "\\stemNeutral",
    "\\autoBeamOn", "\\autoBeamOff",

    # --- Slur direction ---
    "\\slurUp", "\\slurDown", "\\slurNeutral",

    # --- Dynamic placement ---
    "\\dynamicUp", "\\dynamicDown", "\\dynamicNeutral",

    # --- Layout breaks ---
    "\\break", "\\noBreak", "\\pageBreak", "\\noPageBreak",
]
# fmt: on


def lilypond_tokens() -> List[str]:
    """Return the LilyPond backslash commands to add to a pretrained tokenizer."""
    return list(LILYPOND_COMMANDS)


def build_lilypond_tokenizer(
    pretrained_model: str = "microsoft/codebert-base",
) -> PreTrainedTokenizerFast:
    """Load a pretrained tokenizer and extend it with LilyPond commands.

    Args:
        pretrained_model: HuggingFace model identifier
            (e.g. ``microsoft/codebert-base`` or ``roberta-base``).

    Returns:
        Extended tokenizer with LilyPond commands added.
    """
    tokenizer = AutoTokenizer.from_pretrained(pretrained_model)
    tokenizer.add_tokens(lilypond_tokens())
    # Override model_max_length so HuggingFace does not emit spurious
    # "Token indices sequence length is longer than ..." warnings when
    # we encode full files.  Our windowing code handles the actual
    # splitting into model-sized chunks.
    tokenizer.model_max_length = int(1e30)
    return tokenizer


def build_and_save(
    pretrained_model: str = "microsoft/codebert-base",
    output_dir: str = "artifacts/tokenizer",
) -> Path:
    """Build the extended tokenizer and persist it to disk.

    Returns:
        Path to the saved tokenizer directory.
    """
    tokenizer = build_lilypond_tokenizer(pretrained_model)
    out = Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)
    tokenizer.save_pretrained(str(out))
    return out
