#!/usr/bin/env python3
"""Convert LilyPond files in BaroqueMusic dataset to MusicXML.

For each score directory that has a lilypond/ folder, creates a sibling
musicxml/ folder and converts score and part .ly files to .musicxml.

Steps per file:
  1. Resolve \\include directives (case-insensitive matching)
  2. Inject lilypond-export package includes + \\FileExport in \\layout blocks
  3. Run lilypond to produce the .xml file

Only processes top-level compilable files (score + individual parts),
which are identified by having both \\include and \\score directives.
"""

import re
import subprocess
import sys
import tempfile
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent
BAROQUE_ROOT = PROJECT_ROOT / "BaroqueMusic"

# lilypond-export preamble (injected after \version line)
EXPORT_PREAMBLE = (
    f'\n#(add-to-load-path "{PROJECT_ROOT}")\n'
    '\\include "oll-core/package.ily"\n'
    "\\loadPackage lilypond-export\n"
    "exportOpts.exporter = #exportMusicXML\n"
)

# Injected into each \layout block
FILE_EXPORT_SNIPPET = r"    \FileExport #exportOpts"


def is_compilable(ly_file: Path) -> bool:
    """Check if a .ly file is a top-level compilable file (score or part).

    Compilable files contain both \\include and \\score directives.
    This filters out movement definitions, header files, format files,
    and variabili.ly which are only meant to be included by other files.
    """
    try:
        content = ly_file.read_text(encoding="utf-8", errors="ignore")
    except Exception:
        return False
    has_include = re.search(r'\\include\s+"', content) is not None
    has_score = re.search(r'\\score\s*\{', content) is not None
    return has_include and has_score


def case_insensitive_find(directory: Path, name: str) -> Path | None:
    """Find a file in directory matching name case-insensitively."""
    name_lower = name.lower()
    for f in directory.iterdir():
        if f.name.lower() == name_lower:
            return f
    return None


def resolve_includes(file_path: Path, depth: int = 0, resolved: set | None = None) -> str:
    """Recursively resolve \\include directives with case-insensitive matching."""
    if depth > 20:
        return f"% [Include depth exceeded for {file_path}]\n"
    if resolved is None:
        resolved = set()

    file_key = str(file_path.resolve())
    if file_key in resolved:
        return f"% [Circular include: {file_path.name}]\n"
    resolved.add(file_key)

    try:
        content = file_path.read_text(encoding="utf-8", errors="ignore")
    except Exception as e:
        return f"% [Error reading {file_path}: {e}]\n"

    include_re = re.compile(r'^\s*\\include\s+"([^"]+)"\s*$', re.MULTILINE)
    base_dir = file_path.parent

    lines = []
    for line in content.split("\n"):
        match = include_re.match(line)
        if match:
            inc_name = match.group(1)
            inc_path = case_insensitive_find(base_dir, inc_name)
            if inc_path and inc_path.exists():
                lines.append(resolve_includes(inc_path, depth + 1, resolved))
            else:
                # Keep the include as-is — it's likely a LilyPond built-in
                # (e.g. "italiano.ly", "english.ly")
                lines.append(line)
        else:
            lines.append(line)
    return "\n".join(lines)


def inject_export(ly_text: str) -> str:
    """Inject lilypond-export preamble and \\FileExport into layout blocks."""
    # Insert preamble after \version line
    version_re = re.compile(r'(\\version\s+"[^"]+")')
    match = version_re.search(ly_text)
    if match:
        insert_pos = match.end()
        ly_text = ly_text[:insert_pos] + EXPORT_PREAMBLE + ly_text[insert_pos:]
    else:
        ly_text = EXPORT_PREAMBLE + ly_text

    # Insert \FileExport into each \layout { block
    ly_text = re.sub(
        r'(\\layout\s*\{)',
        lambda m: m.group(1) + "\n" + FILE_EXPORT_SNIPPET + "\n",
        ly_text,
    )

    return ly_text


def convert_file(ly_file: Path, out_dir: Path) -> bool:
    """Convert a single .ly file to MusicXML via lilypond-export."""
    combined = resolve_includes(ly_file)
    modified = inject_export(combined)

    out_stem = ly_file.stem

    with tempfile.TemporaryDirectory() as tmpdir:
        tmp_ly = Path(tmpdir) / f"{out_stem}.ly"
        tmp_ly.write_text(modified, encoding="utf-8")

        result = subprocess.run(
            [
                "lilypond",
                "-I", str(PROJECT_ROOT),
                "--loglevel=ERROR",
                "-o", str(Path(tmpdir) / out_stem),
                str(tmp_ly),
            ],
            capture_output=True,
            timeout=120,
        )

        xml_file = Path(tmpdir) / f"{out_stem}.xml"
        if xml_file.exists():
            dest = out_dir / f"{out_stem}.musicxml"
            dest.write_bytes(xml_file.read_bytes())
            return True

        if result.returncode != 0:
            stderr = result.stderr.decode("utf-8", errors="ignore").strip()
            raise RuntimeError(stderr[:300] if stderr else "lilypond failed")

        raise RuntimeError("No .xml output produced")


def main() -> None:
    converted = 0
    failed = 0

    lilypond_dirs = sorted(BAROQUE_ROOT.rglob("lilypond"))
    lilypond_dirs = [d for d in lilypond_dirs if d.is_dir()]
    print(f"Found {len(lilypond_dirs)} lilypond/ directories")

    for lp_dir in lilypond_dirs:
        musicxml_dir = lp_dir.parent / "musicxml"
        ly_files = sorted(lp_dir.glob("*.ly"))

        eligible = [f for f in ly_files if is_compilable(f)]
        if not eligible:
            continue

        musicxml_dir.mkdir(exist_ok=True)

        for ly_file in eligible:
            try:
                convert_file(ly_file, musicxml_dir)
                converted += 1
            except Exception as e:
                failed += 1
                print(
                    f"FAIL {ly_file.relative_to(BAROQUE_ROOT)}: {e}",
                    file=sys.stderr,
                )

            if converted > 0 and converted % 50 == 0:
                print(f"  converted {converted} files...")

    print(f"\nDone: {converted} converted, {failed} failed")


if __name__ == "__main__":
    main()
