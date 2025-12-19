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

"""DEBUGGING STEPS IF NEEDED"""
#---------------------
# Output content of all identified tokens
#--------------------
def print_tokens(elements):  
        raw = []
        chord = []
        repeat = []
        for e in elements:
            if e.type == "raw":
                raw.append(e.content)
            if e.type == "chord":
                chord.append(e)
            if e.type == "directive" and "note_count" in e.attributes:
                repeat.append(e)
        print(f"Raw Length is: {len(raw)}")
        for e in raw:
            print(e + "\t" + "1" + "\t")
        print(f"Num raw elements: {len(raw)}")
        for e in chord:
            print(e.content + "\t" + str(e.attributes["note_count"]) + "\t")
        print(f"Num chords: {len(chord)}")
        for e in repeat:
            print(e.content + "\t" + str(e.attributes["note_count"]) + "\t")
        print(f"Num repeats: {len(repeat)}")

#-----------------
# Output all variables which define a relative block. Check if they're ever called to verify they are engraved
#-----------------
def verify_variables(ly_content):
        functionPattern = r"(\w+)\s*=\s*(?:%\s*[^\n]*\n\s*)*\\(?:relative|figures|lyricmode|figuremode)"
        wrapperBlockPattern = re.compile(r"^(\w+)\s*=\s*\{([\s\S]*?)^\}", re.MULTILINE)
        fileFunctions = re.findall(functionPattern, ly_content)
        out = {}
        matchedFuncs = set()
        for var, body in wrapperBlockPattern.findall(ly_content):
            foundRefs = [fn for fn in fileFunctions if f"\\{fn}" in body]
            if foundRefs:
                out[var] = foundRefs
                for i in foundRefs:
                    if i in matchedFuncs:
                        print(f"{i} matched twice")
                    matchedFuncs.add(i)
        for fn in fileFunctions:
            if fn not in matchedFuncs:
                print(f"{fn} not matched to a wrapper variable")
        for key in out:
            if f"\\{key}" not in ly_content:
                print(f"{key} not ever called after being defined")
        print(out)
        num_keys = len(out)
        num_values = sum(len(v) for v in out.values())
        print(num_keys, num_values)
        all_values = [v for values in out.values() for v in values]
        value_set = set(all_values)

        # Total values
        print(len(value_set), len(all_values))

#-------------
# Return all elements counted as notes in incipit blocks
#-------------

def get_incipits(ly_content) -> int:
    p2 = LilyPondParser()
    incipit_blocks = p2._extract_music_blocks(ly_content, re.compile(r'\\incipit\s+\{'))
    print(f"Number of incipit blocks are: {len(incipit_blocks)}")

    incipit_elements = []
    for block in incipit_blocks:
        incipit_elements.extend(p2._parse_music_block(block))
    incipit_note_count = 0
    for e in incipit_elements:
        if e.type=="note":
            incipit_note_count += 1
        if e.type == "chord":
            incipit_note_count += e.attributes["note_count"]
        if e.type =="directive" and "note_count" in e.attributes:
            incipit_note_count += e.attributes["note_count"]
    print(f"Notes found in incipits are {incipit_note_count}")
    return incipit_note_count

#---------------
# MAIN TEST
#---------------

def compile_lilypond_files(raw_dir: str = './data/raw', ps_dir: str = './data/ps_outputs'):
    """
    Compile LilyPond (.ly) files from `raw_dir` into PostScript (.ps) files in `ps_dir`.
    Skips compilation if a corresponding .ps file already exists.
    Returns a dict mapping .ly filenames to their PostScript content.
    Debug elements to check tokenized content such as raw, chords, and repeats
    Checks if relative blocks went unused, which could lead to parser counting more notes than appear in postscript
    Check if the same variable was defined twice by accident, which could lead to parser counting more notes than appear in postscript
    Checks incipit blocks for notes, before subtracting them from the postscript count 
    Compare parser note count to postscript notehead glyph count
    """
    raw_path = Path(raw_dir).resolve()
    ps_path = Path(ps_dir).resolve()

    if not raw_path.exists():
        raise FileNotFoundError(f"Input folder not found: {raw_path}")

    ps_path.mkdir(parents=True, exist_ok=True)

    outputs = {}
    failures = {}

    for ly_file in raw_path.glob("*.ly"):
        output_file = ps_path / ly_file.with_suffix(".ps").name
        #if ly_file.name == "francoeur_simphonie_du_festin_royal_4eme_suite_processed.ly":
        # Skip if .ps already exists
        if output_file.exists():
            print(f">>Skipping {ly_file.name} (PostScript already exists)")
        else:
            print(f"--Compiling {ly_file.name}...")

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
        elements = parser.parse_content(ly_content)
        
        # Optional debugging commands for checking where note-count descrepancies happen
        #print_tokens(elements)
        #verify_variables(ly_content)

        incipit_note_count = get_incipits(ly_content)

        stats = parser.get_statistics()
        glyphs = re.findall(r"/noteheads\.[^\s]+", ps_content)
        num_matches = len(glyphs) - incipit_note_count
        if stats["note_count"] != num_matches:
            failures[ly_file.name] = {
                f"{(stats['note_count']-num_matches)/100}% error (note_count={stats['note_count']}, num_matches={num_matches})"
            }
        print(f"Note count by parser:{stats["note_count"]}. Note count by glyphs minus incipits:{num_matches}. Matches:{stats["note_count"] == num_matches}")
        print(f"Ready: {ly_file.name} → {output_file.name} ({len(ps_content)} chars)")

    print(failures)
    return outputs


if __name__ == "__main__":
    results = compile_lilypond_files()
    print(f"Total: {len(results)} files processed successfully.")



