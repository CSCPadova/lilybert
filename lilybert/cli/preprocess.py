"""Packaged entrypoint for preprocessing."""

from __future__ import annotations

import json
from typing import Optional

import typer
from typing_extensions import Annotated

from lilybert.data.preprocessor import LilyPondPreprocessor


def main(
    input_dir: Annotated[
        str, typer.Option(help="Directory containing .ly files")
    ] = "data/raw",
    output_dir: Annotated[
        str,
        typer.Option(help="Output root directory for italiano/english + metadata.json"),
    ] = "data/processed",
    labels_path: Annotated[
        str, typer.Option(help="Path to labels_v1.json")
    ] = "data/labels/labels_v1.json",
    languages: Annotated[
        str,
        typer.Option(
            help="Comma-separated LilyPond languages to write (e.g. english,italiano,nederlands)"
        ),
    ] = "italiano,english,nederlands",
    enable_transposition: Annotated[
        bool, typer.Option(help="Enable transposition augmentation across tonalities")
    ] = False,
    enable_absolute_relative: Annotated[
        bool,
        typer.Option(help="Enable absolute/relative pitch conversion augmentation"),
    ] = False,
    enable_articulation_variants: Annotated[
        bool, typer.Option(help="Enable articulation short/expanded augmentation")
    ] = False,
    enable_barline_variants: Annotated[
        bool, typer.Option(help="Enable add/remove barline augmentation")
    ] = False,
    enable_retrograde: Annotated[
        bool, typer.Option(help="Enable retrograde pitch augmentation")
    ] = False,
    enable_inversion: Annotated[
        bool, typer.Option(help="Enable pitch inversion augmentation")
    ] = False,
    strip: Annotated[
        Optional[str],
        typer.Option(
            help="Comma-separated sections to strip (e.g. header,comments,layout,midi,version,scheme,markup,overrides,pagebreaks)"
        ),
    ] = None,
) -> None:
    lang_list = [lang.strip() for lang in languages.split(",") if lang.strip()]
    strip_sections = None
    if strip is not None:
        strip_sections = [s.strip() for s in strip.split(",") if s.strip()]

    augmentation_config = {
        "languages": lang_list,
        "enable_transposition": enable_transposition,
        "enable_absolute_relative": enable_absolute_relative,
        "enable_articulation_variants": enable_articulation_variants,
        "enable_barline_variants": enable_barline_variants,
        "enable_retrograde": enable_retrograde,
        "enable_inversion": enable_inversion,
        "include_original": True,
    }

    preprocessor = LilyPondPreprocessor(strip_sections=strip_sections)

    summary = preprocessor.preprocess_to_dataset(
        input_dir=input_dir,
        output_dir=output_dir,
        labels_path=labels_path,
        augmentation_config=augmentation_config,
    )

    print(json.dumps(summary, indent=2, ensure_ascii=False))
