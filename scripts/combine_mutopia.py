#!/usr/bin/env python3
"""Combine LilyPond files in the Mutopia dataset that contain \\include directives."""

import json
import re
import sys
from pathlib import Path

# Project root setup
PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from lilybert.cli.combine import LilyPondCombiner

BASE_DIR = PROJECT_ROOT / "data" / "mutopia"
DATASET_PATH = BASE_DIR / "dataset_mutopia.json"
COMBINED_DIR = BASE_DIR / "combined"

INCLUDE_PATTERN = re.compile(r'^\s*\\include\s+"[^"]+"', re.MULTILINE)


def has_includes(file_path: Path) -> bool:
    """Check if a .ly file contains \\include directives."""
    try:
        content = file_path.read_text(encoding="utf-8", errors="ignore")
        return bool(INCLUDE_PATTERN.search(content))
    except Exception:
        return False


def make_unique_name(name: str, used_names: set) -> str:
    """Ensure output name is unique by appending a numeric suffix if needed."""
    if name not in used_names:
        used_names.add(name)
        return name
    i = 2
    while f"{name}_{i}" in used_names:
        i += 1
    unique = f"{name}_{i}"
    used_names.add(unique)
    return unique


def main():
    # Load dataset
    with open(DATASET_PATH, "r") as f:
        dataset = json.load(f)

    print(f"Loaded {len(dataset)} entries from dataset")

    COMBINED_DIR.mkdir(parents=True, exist_ok=True)

    combiner = LilyPondCombiner(validate=False, update_notation=False)

    combined_count = 0
    failed_count = 0
    skipped_count = 0
    errors = []
    used_names: set[str] = set()

    for entry in dataset:
        local_path = entry["localPath"]
        file_path = BASE_DIR / local_path

        if not file_path.exists():
            entry["combined"] = False
            errors.append((local_path, "File not found"))
            failed_count += 1
            continue

        if not has_includes(file_path):
            entry["combined"] = False
            skipped_count += 1
            continue

        # Derive output name: {composer}_{work_folder}
        composer = entry["composer"]
        # localPath is like "lilypond_files/Composer/work_folder/file.ly"
        path_parts = Path(local_path).parts
        # The work folder is the parent of the .ly file
        work_name = Path(local_path).parent.name
        base_name = f"{composer}_{work_name}"
        unique_name = make_unique_name(base_name, used_names)

        try:
            combined_content, error = combiner.combine_file(file_path)
            if error:
                entry["combined"] = False
                errors.append((local_path, error))
                failed_count += 1
                continue

            output_path = COMBINED_DIR / f"{unique_name}.ly"
            output_path.write_text(combined_content, encoding="utf-8")

            # Update entry
            entry["localPath"] = f"combined/{unique_name}.ly"
            entry["combined"] = True
            combined_count += 1

        except Exception as e:
            entry["combined"] = False
            errors.append((local_path, str(e)))
            failed_count += 1

    # Write updated dataset
    with open(DATASET_PATH, "w") as f:
        json.dump(dataset, f, indent=4, ensure_ascii=False)

    # Print stats
    print(f"\n{'=' * 60}")
    print("RESULTS")
    print(f"{'=' * 60}")
    print(f"Total entries:            {len(dataset)}")
    print(f"No includes (skipped):    {skipped_count}")
    print(f"Combined successfully:    {combined_count}")
    print(f"Failed:                   {failed_count}")

    if errors:
        print(f"\nErrors ({len(errors)}):")
        for path, err in errors:
            print(f"  - {path}: {err}")


if __name__ == "__main__":
    main()
