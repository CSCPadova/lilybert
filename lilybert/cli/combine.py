#!/usr/bin/env python3
r"""
Combine LilyPond files by resolving \include directives.

Recursively finds .ly files in a directory, resolves their \include
directives, and saves flattened single-file .ly outputs.

Supports two discovery modes:
  - Generic (default): recursively finds all .ly files in --input-dir
  - Mutopia (--mutopia): uses Mutopia-specific heuristics to pick
    main score files from the composer/work directory structure

Utilities:
  - Resolves \include directives recursively
  - Updates notation with convert-ly (if available)
  - Validates output with LilyPondParser
  - Skips invalid files
"""

import re
import subprocess
import sys
from pathlib import Path
from typing import Optional, Set

import typer
from tqdm import tqdm
from typing_extensions import Annotated

from lilybert.data.parser import LilyPondParser


class LilyPondCombiner:
    """Combines LilyPond files by resolving includes."""

    def __init__(
        self, max_depth: int = 20, validate: bool = True, update_notation: bool = True
    ):
        """Initialize combiner.

        Args:
            max_depth: Maximum recursion depth for includes
            validate: Whether to validate output files
            update_notation: Whether to run convert-ly on output
        """
        self.max_depth = max_depth
        self.included_files: Set[str] = set()
        self.validate = validate
        self.update_notation = update_notation
        self.parser = LilyPondParser() if validate else None

    def resolve_includes(
        self, file_path: Path, depth: int = 0, base_dir: Optional[Path] = None
    ) -> str:
        r"""Recursively resolve and inline \include directives.

        Args:
            file_path: Path to LilyPond file
            depth: Current recursion depth
            base_dir: Base directory for relative includes

        Returns:
            Content with includes resolved
        """
        if depth > self.max_depth:
            return f"% [Include depth exceeded for {file_path}]\n"

        if not file_path.exists():
            return f"% [File not found: {file_path}]\n"

        # Prevent circular includes
        file_key = str(file_path.resolve())
        if file_key in self.included_files:
            return f"% [Circular include prevented: {file_path}]\n"

        # Track this file at this depth to prevent cycles
        self.included_files.add(file_key)

        try:
            content = file_path.read_text(encoding="utf-8", errors="ignore")
        except Exception as e:
            return f"% [Error reading {file_path}: {e}]\n"

        # Set base directory for relative includes
        if base_dir is None:
            base_dir = file_path.parent

        # Process includes
        lines = []
        include_pattern = re.compile(r'^\s*\\include\s+"([^"]+)"\s*$', re.MULTILINE)

        for line in content.split("\n"):
            match = include_pattern.match(line)
            if match:
                include_file = match.group(1)
                include_path = base_dir / include_file

                # Try with .ily extension if not found
                if not include_path.exists() and not include_file.endswith(".ily"):
                    include_path = base_dir / (include_file + ".ily")

                if include_path.exists():
                    # Recursively resolve includes in the included file
                    included_content = self.resolve_includes(
                        include_path, depth + 1, base_dir
                    )
                    # TODO: decide whether to add comments around included content for clarity
                    lines.append(f"% === BEGIN INCLUDE: {include_file} ===")
                    lines.append(included_content.rstrip())
                    lines.append(f"% === END INCLUDE: {include_file} ===")
                else:
                    lines.append(f"% [Include not found: {include_file}]")
            else:
                lines.append(line)

        return "\n".join(lines)

    def validate_lilypond(self, content: str) -> tuple[bool, Optional[str]]:
        """Validate LilyPond content.

        Args:
            content: LilyPond file content

        Returns:
            (is_valid, error_message)
        """
        if not self.parser:
            return True, None

        try:
            # Try to parse the content
            self.parser.parse_content(content)
            return True, None
        except Exception as e:
            return False, str(e)

    def update_notation_with_convert_ly(
        self, file_path: Path
    ) -> tuple[bool, Optional[str]]:
        """Update LilyPond notation using convert-ly.

        Args:
            file_path: Path to LilyPond file

        Returns:
            (success, error_message)
        """
        try:
            # Check if convert-ly is available
            result = subprocess.run(
                ["convert-ly", "--version"], capture_output=True, timeout=2
            )
            if result.returncode != 0:
                return False, "convert-ly not available"

            # Run convert-ly on the file (in-place)
            result = subprocess.run(
                ["convert-ly", "-e", str(file_path)], capture_output=True, timeout=10
            )

            if result.returncode != 0:
                error = (
                    result.stderr.decode("utf-8", errors="ignore")
                    if result.stderr
                    else "Unknown error"
                )
                return False, error

            return True, None

        except subprocess.TimeoutExpired:
            return False, "convert-ly timeout"
        except FileNotFoundError:
            return False, "convert-ly not found in PATH"
        except Exception as e:
            return False, str(e)

    def combine_file(self, file_path: Path) -> tuple[Optional[str], Optional[str]]:
        """Combine a single LilyPond file.

        Args:
            file_path: Path to LilyPond file

        Returns:
            (combined_content, error_message) - error_message is None if successful
        """
        # Reset included files for each top-level file
        self.included_files = set()

        combined = self.resolve_includes(file_path)

        # Validate if requested
        if self.validate:
            is_valid, error = self.validate_lilypond(combined)
            if not is_valid:
                return None, f"Validation failed: {error}"

        return combined, None


def find_main_ly_files(directory: Path) -> list[tuple[Path, str]]:
    """Find main .ly files in a directory structure.

    Args:
        directory: Root directory to search

    Returns:
        List of (file_path, relative_name) tuples
    """
    ly_files = []

    for work_dir in directory.iterdir():
        if not work_dir.is_dir() or work_dir.name.startswith("."):
            continue

        # Look for subdirectories containing .ly files
        for subdir in work_dir.rglob("*"):
            if not subdir.is_dir() or subdir.name.startswith("."):
                continue

            # Find .ly files in this subdirectory
            ly_candidates = list(subdir.glob("*.ly"))

            if not ly_candidates:
                continue

            # Prefer score files (usually the largest or with "score" in name)
            score_files = [f for f in ly_candidates if "score" in f.name.lower()]
            if score_files:
                # Use the one with "score" in the name
                main_file = max(score_files, key=lambda f: f.stat().st_size)
            else:
                # Use the largest .ly file
                main_file = max(ly_candidates, key=lambda f: f.stat().st_size)

            # Create a meaningful output name
            composer = work_dir.name
            work_name = subdir.name if subdir != work_dir else ""

            if work_name and work_name != main_file.stem:
                output_name = f"{composer}_{work_name}"
            else:
                output_name = f"{composer}_{main_file.stem}"

            ly_files.append((main_file, output_name))

    return ly_files


def find_all_ly_files(directory: Path) -> list[tuple[Path, str]]:
    """Find all .ly files recursively in a directory.

    Args:
        directory: Root directory to search

    Returns:
        List of (file_path, output_name) tuples
    """
    ly_files = []
    for ly_path in sorted(directory.rglob("*.ly")):
        if ly_path.name.startswith("."):
            continue
        ly_files.append((ly_path, ly_path.stem))
    return ly_files


def combine_ly_files(
    input_dir: Path,
    output_dir: Path,
    mutopia: bool = False,
    max_files: Optional[int] = None,
    validate: bool = True,
    update_notation: bool = True,
) -> dict:
    """Combine LilyPond files by resolving includes.

    Args:
        input_dir: Root directory containing .ly files
        output_dir: Output directory for combined files
        mutopia: Use Mutopia-specific file discovery heuristics
        max_files: Maximum number of files to process
        validate: Whether to validate output files
        update_notation: Whether to run convert-ly on output

    Returns:
        Dictionary with statistics
    """
    output_dir.mkdir(parents=True, exist_ok=True)

    if mutopia:
        ly_files = find_main_ly_files(input_dir)
    else:
        ly_files = find_all_ly_files(input_dir)

    if max_files:
        ly_files = ly_files[:max_files]

    stats = {
        "total_files": len(ly_files),
        "successful": 0,
        "failed": 0,
        "validation_failed": 0,
        "convert_ly_failed": 0,
        "errors": [],
    }

    combiner = LilyPondCombiner(validate=validate, update_notation=update_notation)

    for file_path, output_name in tqdm(ly_files, desc="Combining LilyPond files"):
        try:
            combined_content, error = combiner.combine_file(file_path)

            if error:
                stats["failed"] += 1
                stats["validation_failed"] += 1
                stats["errors"].append(
                    {"file": str(file_path), "error": f"Combine error: {error}"}
                )
                continue

            output_path = output_dir / f"{output_name}.ly"
            output_path.write_text(combined_content, encoding="utf-8")

            if update_notation:
                success, error = combiner.update_notation_with_convert_ly(output_path)
                if not success:
                    stats["convert_ly_failed"] += 1
                    if error != "convert-ly not available":
                        stats["errors"].append(
                            {"file": str(file_path), "error": f"convert-ly: {error}"}
                        )

            stats["successful"] += 1

        except Exception as e:
            stats["failed"] += 1
            stats["errors"].append({"file": str(file_path), "error": str(e)})

    return stats


def process_mutopia_dataset(
    mutopia_ftp_dir: Path,
    output_dir: Path,
    max_files: Optional[int] = None,
    validate: bool = True,
    update_notation: bool = True,
) -> dict:
    """Process entire Mutopia dataset and combine files.

    Args:
        mutopia_ftp_dir: Path to MutopiaProject/ftp directory
        output_dir: Output directory for combined files
        max_files: Maximum number of files to process (for testing)
        validate: Whether to validate output files
        update_notation: Whether to run convert-ly on output

    Returns:
        Dictionary with statistics
    """
    output_dir.mkdir(parents=True, exist_ok=True)

    # Find all main .ly files
    ly_files = find_main_ly_files(mutopia_ftp_dir)

    if max_files:
        ly_files = ly_files[:max_files]

    stats = {
        "total_files": len(ly_files),
        "successful": 0,
        "failed": 0,
        "validation_failed": 0,
        "convert_ly_failed": 0,
        "errors": [],
    }

    combiner = LilyPondCombiner(validate=validate, update_notation=update_notation)

    for file_path, output_name in tqdm(ly_files, desc="Combining Mutopia files"):
        try:
            # Combine files
            combined_content, error = combiner.combine_file(file_path)

            if error:
                stats["failed"] += 1
                stats["validation_failed"] += 1
                stats["errors"].append(
                    {"file": str(file_path), "error": f"Combine error: {error}"}
                )
                continue

            # Save combined file temporarily
            output_path = output_dir / f"{output_name}.ly"
            output_path.write_text(combined_content, encoding="utf-8")

            # Update notation with convert-ly if requested
            if update_notation:
                success, error = combiner.update_notation_with_convert_ly(output_path)
                if not success:
                    # Log but don't fail - convert-ly might not be available
                    stats["convert_ly_failed"] += 1
                    if error != "convert-ly not available":
                        stats["errors"].append(
                            {"file": str(file_path), "error": f"convert-ly: {error}"}
                        )

            stats["successful"] += 1

        except Exception as e:
            stats["failed"] += 1
            stats["errors"].append({"file": str(file_path), "error": str(e)})

    return stats


def main(
    input_dir: Annotated[str, typer.Option(help="Root directory containing .ly files")],
    output_dir: Annotated[
        str, typer.Option(help="Output directory for combined files")
    ] = "./data/combined",
    mutopia: Annotated[
        bool,
        typer.Option(help="Use Mutopia-specific heuristics to pick main score files"),
    ] = False,
    max_files: Annotated[
        Optional[int],
        typer.Option(help="Maximum number of files to process (for testing)"),
    ] = None,
    validate: Annotated[
        bool,
        typer.Option(
            "--validate/--no-validate",
            help="Validate output files with parser",
        ),
    ] = True,
    update_notation: Annotated[
        bool,
        typer.Option(
            "--update-notation/--no-update-notation",
            help="Update notation with convert-ly",
        ),
    ] = True,
    verbose: Annotated[
        bool, typer.Option(help="Print detailed progress information")
    ] = False,
) -> None:
    input_path = Path(input_dir)
    output_path = Path(output_dir)

    if not input_path.exists():
        print(f"Error: Input directory not found: {input_path}")
        raise typer.Exit(code=1)

    mode_label = "Mutopia" if mutopia else "generic"
    print(f"Input dir: {input_path.resolve()} (mode: {mode_label})")
    print(f"Output dir: {output_path.resolve()}")
    print(f"Parser validation: {validate}")
    print(f"convert-ly updates: {update_notation}")

    if max_files:
        print(f"Processing max {max_files} files")

    stats = combine_ly_files(
        input_dir=input_path,
        output_dir=output_path,
        mutopia=mutopia,
        max_files=max_files,
        validate=validate,
        update_notation=update_notation,
    )

    print("\n" + "=" * 60)
    print("PROCESSING STATISTICS")
    print("=" * 60)
    print(f"Total files found: {stats['total_files']}")
    print(f"Successfully combined: {stats['successful']}")
    print(f"Validation failed: {stats.get('validation_failed', 0)}")
    print(f"convert-ly failed: {stats.get('convert_ly_failed', 0)}")
    print(f"Failed: {stats['failed']}")

    if stats["errors"]:
        error_count = len(stats["errors"])
        show_count = 10 if verbose else 5
        print(f"\nErrors ({error_count} total):")
        for error in stats["errors"][:show_count]:
            print(f"  - {error['file']}: {error['error']}")
        if error_count > show_count:
            print(f"  ... and {error_count - show_count} more errors")

    print(f"\nCombined files saved to: {output_path.resolve()}")
