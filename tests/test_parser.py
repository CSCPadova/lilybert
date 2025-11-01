"""Basic tests for MaestroGPT functionality."""
import sys
import pytest
import tempfile
import json
from pathlib import Path
import os
import subprocess
import re

from maestrogpt.data import LilyPondParser, LilyPondPreprocessor
from maestrogpt.models import LoRAConfig
from maestrogpt.training import TrainingConfig
from maestrogpt.evaluation import MusicMetrics
import re
import subprocess
import tempfile
from pathlib import Path

def compile_lilypond_files(raw_dir: str = r'C:\Users\Ilay2\Desktop\TransformerProject\ForkedProject\MaestroGPT\data\raw', ps_dir: str = r'C:\Users\Ilay2\Desktop\TransformerProject\ForkedProject\MaestroGPT\data\ps_outputs'):
    """
    Compile LilyPond (.ly) files from `raw_dir` into PostScript (.ps) files in `ps_dir`.
    Skips compilation if a corresponding .ps file already exists.
    Returns a dict mapping .ly filenames to their PostScript content.
    """
    raw_path = Path(raw_dir).resolve()
    ps_path = Path(ps_dir).resolve()

    if not raw_path.exists():
        raise FileNotFoundError(f"Input folder not found: {raw_path}")

    ps_path.mkdir(parents=True, exist_ok=True)

    outputs = {}

    for ly_file in raw_path.glob("*.ly"):
        output_file = ps_path / ly_file.with_suffix(".ps").name

        # Skip if .ps already exists
        if output_file.exists():
            print(f"⏩ Skipping {ly_file.name} (PostScript already exists)")
        else:
            print(f"🎼 Compiling {ly_file.name}...")

            result = subprocess.run(
                [
                    "lilypond",
                    "--ps",
                    "-o", str(ps_path / ly_file.stem),  # output basename
                    str(ly_file)
                ],
                cwd=raw_path,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )

            if result.returncode != 0:
                print(f"LilyPond failed for {ly_file.name}:\n{result.stderr}")
                continue

            if not output_file.exists():
                print(f"Expected PostScript not found: {output_file}")
                continue

        # Read PostScript content (existing or newly compiled)
        with open(output_file, "r", encoding="utf-8", errors="ignore") as f:
            ps_content = f.read()

        with open(ly_file, "r", encoding="utf-8") as f:
            ly_content = f.read()

        outputs[ly_file.name] = ps_content
        parser = LilyPondParser()
        parser.parse_content(ly_content)
        stats = parser.get_statistics()
        matches = re.findall(r"/noteheads\.[^\s]+", ps_content)
        print(stats["note_count"] == len(matches))
        print(stats["note_count"])
        print(len(matches))
        print(f"Ready: {ly_file.name} → {output_file.name} ({len(ps_content)} chars)")

    return outputs


if __name__ == "__main__":
    results = compile_lilypond_files()
    print(f"\n✅ Total: {len(results)} files processed successfully.")