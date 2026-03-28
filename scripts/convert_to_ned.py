"""Convert all .ly files in data/preprocessed/combined to nederlands pitch language."""

import re
import shutil
from pathlib import Path

from tqdm import tqdm

from lilybert.data.parser import LilyPondParser

SRC_DIR = Path("data/preprocessed/combined")
DST_DIR = Path("data/preprocessed/ned")

parser = LilyPondParser()


def convert_file(src: Path, dst: Path) -> None:
    content = src.read_text(encoding="utf-8", errors="ignore")
    lang = parser.detect_pitch_language(content)

    if lang == "italiano":
        content = parser.convert_pitch_language(content, "english")
        content = re.sub(
            r'\\language\s+"italiano"', r'\\language "nederlands"', content
        )
    elif lang == "english" or lang == "mixed":
        # Already c/d/e/f/g/a/b with -is/-es — just update the directive
        content = re.sub(
            r'\\language\s+"[^"]+"', r'\\language "nederlands"', content
        )
    # If already nederlands, copy as-is

    dst.write_text(content, encoding="utf-8")


def main():
    DST_DIR.mkdir(parents=True, exist_ok=True)
    files = sorted(SRC_DIR.glob("*.ly"))
    print(f"Converting {len(files)} files to nederlands...")

    for f in tqdm(files, desc="Converting", unit="file"):
        convert_file(f, DST_DIR / f.name)

    print(f"\nDone. Output: {DST_DIR} ({len(files)} files)")


if __name__ == "__main__":
    main()
