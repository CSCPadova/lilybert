"""Standalone validation: compare lexer note counts against PostScript glyph counts.

This is a debugging / validation script, not collected by pytest.
Run directly:  python tests/test_parser.py

It compiles every .ly file in data/raw to PostScript (caching results in
data/ps_outputs), then compares the number of note-head glyphs in the PS
against the number of note/rest/chord tokens the MusicalLexer produces.
"""

import re
import subprocess
from pathlib import Path

from lilybert.data import MusicalLexer


def _count_notes_from_tokens(tokens: list[str]) -> int:
    """Count notes and chords in a lexer token list.

    Notes are bare pitch tokens (a-g with optional accidentals/octave marks).
    Chords are ``chord:...`` tokens; each chord counts as one notehead group.
    """
    note_re = re.compile(r"^[a-g]([ei]?s)*[',]*\d*\.?$")
    count = 0
    for t in tokens:
        if t.startswith("chord:"):
            inner = t[len("chord:"):]
            pitches = [p for p in inner.split() if note_re.match(p)]
            count += len(pitches) if pitches else 1
        elif note_re.match(t):
            count += 1
    return count


def compile_lilypond_files(
    raw_dir: str = "./data/raw", ps_dir: str = "./data/ps_outputs"
):
    """Compile .ly → .ps, then compare lexer note counts with PS glyph counts."""
    raw_path = Path(raw_dir).resolve()
    ps_path = Path(ps_dir).resolve()

    if not raw_path.exists():
        raise FileNotFoundError(f"Input folder not found: {raw_path}")

    ps_path.mkdir(parents=True, exist_ok=True)

    outputs: dict[str, str] = {}
    failures: dict[str, str] = {}

    for ly_file in sorted(raw_path.glob("*.ly")):
        output_file = ps_path / ly_file.with_suffix(".ps").name

        # Compile if needed
        if output_file.exists():
            print(f">>Skipping {ly_file.name} (PostScript already exists)")
        else:
            print(f"--Compiling {ly_file.name}...")
            result = subprocess.run(
                [
                    "lilypond",
                    "--ps",
                    "-o",
                    str(ps_path / ly_file.stem),
                    str(ly_file),
                ],
                cwd=raw_path,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            if result.returncode != 0:
                print(f"  LilyPond failed for {ly_file.name}:\n{result.stderr}")
                continue
            if not output_file.exists():
                print(f"  Expected PostScript not found: {output_file}")
                continue

        # Read files
        ps_content = output_file.read_text(encoding="utf-8", errors="ignore")
        ly_content = ly_file.read_text(encoding="utf-8")

        # Lexer-based note count
        tokens = MusicalLexer.linearize(ly_content)
        note_count = _count_notes_from_tokens(tokens)

        # PostScript glyph count
        glyphs = re.findall(r"/noteheads\.[^\s]+", ps_content)
        num_glyphs = len(glyphs)

        outputs[ly_file.name] = ps_content

        match = note_count == num_glyphs
        if not match:
            pct = (note_count - num_glyphs) / max(num_glyphs, 1) * 100
            failures[ly_file.name] = (
                f"{pct:.1f}% error (lexer={note_count}, ps={num_glyphs})"
            )

        print(
            f"  Lexer notes: {note_count}  PS glyphs: {num_glyphs}  "
            f"Match: {match}  — {ly_file.name}"
        )

    if failures:
        print(f"\n--- Failures ({len(failures)}) ---")
        for name, msg in failures.items():
            print(f"  {name}: {msg}")
    else:
        print("\nAll files matched.")

    return outputs


if __name__ == "__main__":
    results = compile_lilypond_files()
    print(f"\nTotal: {len(results)} files processed.")
