"""LilyPond preprocessing pipeline for lilyBERT.

Copies raw LilyPond files to an output directory with optional data
augmentation (transposition, retrograde, inversion, etc.).  Files are
treated as plain text — no movement splitting or engraving stripping.
"""

from __future__ import annotations

import json
import logging
import os
import re
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from fractions import Fraction
from hashlib import sha1
from itertools import product
from pathlib import Path
from typing import Any, Dict, List, Optional

import ly.document
import ly.pitch
from ly.pitch.abs2rel import abs2rel
from ly.pitch.rel2abs import rel2abs
from ly.pitch.transform import inversion as ly_inversion
from ly.pitch.transform import retrograde as ly_retrograde
from ly.pitch.transpose import Transposer, transpose
from tqdm import tqdm

logger = logging.getLogger(__name__)


def _generate_transposition_targets(language: str = "english") -> List[str]:
    """Generate all chromatic pitch targets using ly.pitch."""
    writer = ly.pitch.pitchWriter(language)
    targets = []
    for note in range(7):
        for alter in (Fraction(0), Fraction(-1, 2), Fraction(1, 2)):
            name = writer(note, alter)
            targets.append(name)
    return targets


def _detect_language(text: str) -> str:
    """Detect the pitch language from a LilyPond source string."""
    match = re.search(r'\\language\s+"(\w+)"', text)
    if match:
        return match.group(1)
    if re.search(r"\b(do|re|mi|fa|sol|la|si)\d", text):
        return "italiano"
    return "english"


def _preprocess_file_worker(
    path: str,
    aug_cfg: Dict[str, Any],
) -> Dict[str, Any]:
    """Process one raw file and return (optionally augmented) variants."""
    try:
        text = Path(path).read_text(encoding="utf-8", errors="ignore")
        config = AugmentationConfig.from_mapping(aug_cfg)
        preprocessor = LilyPondPreprocessor(augmentation_config=config)
        variants = preprocessor._build_augmented_variants(text, config)
        file_id = Path(path).stem
        return {
            "ok": True,
            "items": [
                {
                    "file_id": file_id,
                    "variant_id": v["variant_id"],
                    "text": v["text"],
                    "source_file": Path(path).name,
                }
                for v in variants
            ],
        }
    except Exception as exc:  # pragma: no cover - runtime failure path
        return {"ok": False, "error": str(exc), "file": path}


@dataclass
class AugmentationConfig:
    """Configurable LilyPond data augmentation knobs."""

    enable_transposition: bool = False
    enable_absolute_relative: bool = False
    enable_articulation_variants: bool = False
    enable_barline_variants: bool = False
    enable_retrograde: bool = False
    enable_inversion: bool = False
    include_original: bool = True

    @classmethod
    def from_mapping(cls, value: Optional[Dict[str, Any]]) -> "AugmentationConfig":
        raw = value or {}
        return cls(
            enable_transposition=bool(raw.get("enable_transposition", False)),
            enable_absolute_relative=bool(raw.get("enable_absolute_relative", False)),
            enable_articulation_variants=bool(
                raw.get("enable_articulation_variants", False)
            ),
            enable_barline_variants=bool(raw.get("enable_barline_variants", False)),
            enable_retrograde=bool(raw.get("enable_retrograde", False)),
            enable_inversion=bool(raw.get("enable_inversion", False)),
            include_original=bool(raw.get("include_original", True)),
        )


class LilyPondPreprocessor:
    """LilyPond preprocessor with optional data augmentation.

    Files are treated as plain text.  The only transformation applied is
    optional augmentation (transposition, retrograde, inversion, etc.).
    """

    def __init__(
        self,
        augmentation_config: Optional[Dict[str, Any] | AugmentationConfig] = None,
    ):
        if isinstance(augmentation_config, AugmentationConfig):
            self.augmentation_config = augmentation_config
        else:
            self.augmentation_config = AugmentationConfig.from_mapping(
                augmentation_config
            )

    def preprocess_to_dataset(
        self,
        input_dir: str = "data/raw",
        output_dir: str = "data/processed",
        augmentation_config: Optional[Dict[str, Any] | AugmentationConfig] = None,
        num_workers: int = 0,
    ) -> Dict[str, Any]:
        """Copy raw LilyPond files to *output_dir* with optional augmentation."""
        raw_dir = Path(input_dir)
        if not raw_dir.exists():
            raise FileNotFoundError(f"Input folder not found: {raw_dir}")

        config = self._resolve_augmentation_config(augmentation_config)
        out_root = Path(output_dir)
        out_root.mkdir(parents=True, exist_ok=True)

        metadata: Dict[str, Any] = {}
        failures: Dict[str, str] = {}
        total_files = 0

        raw_files_unsorted: List[Path] = []
        for ext in ("*.ly", "*.ily", "*.tely"):
            raw_files_unsorted.extend(raw_dir.glob(ext))
        raw_files = sorted([str(p) for p in raw_files_unsorted])
        max_workers = num_workers if num_workers > 0 else (os.cpu_count() or 2)

        aug_cfg = {
            "enable_transposition": config.enable_transposition,
            "enable_absolute_relative": config.enable_absolute_relative,
            "enable_articulation_variants": config.enable_articulation_variants,
            "enable_barline_variants": config.enable_barline_variants,
            "enable_retrograde": config.enable_retrograde,
            "enable_inversion": config.enable_inversion,
            "include_original": config.include_original,
        }

        with ProcessPoolExecutor(max_workers=max_workers) as exe:
            futures = {
                exe.submit(_preprocess_file_worker, path, aug_cfg): path
                for path in raw_files
            }
            for fut in tqdm(
                as_completed(futures),
                total=len(futures),
                desc="preprocess",
            ):
                path = futures[fut]
                res = fut.result()
                if not res.get("ok"):
                    failures[Path(path).name] = res.get("error")
                    continue
                for item in res.get("items", []):
                    file_id = item["file_id"]
                    variant_id = item["variant_id"]
                    total_files += 1

                    if variant_id == "base":
                        file_name = f"{file_id}.ly"
                    else:
                        file_name = f"{file_id}__{variant_id}.ly"

                    output_path = out_root / file_name
                    output_path.write_text(item["text"], encoding="utf-8")

                    if variant_id == "base":
                        metadata[file_id] = {
                            "source_file": item.get("source_file"),
                        }

        metadata_path = out_root / "metadata.json"
        metadata_path.write_text(
            json.dumps(metadata, ensure_ascii=False, indent=2), encoding="utf-8"
        )

        return {
            "files_processed": len(raw_files),
            "files_written": total_files,
            "augmentation": {
                "enable_transposition": config.enable_transposition,
                "enable_absolute_relative": config.enable_absolute_relative,
                "enable_articulation_variants": config.enable_articulation_variants,
                "enable_barline_variants": config.enable_barline_variants,
                "enable_retrograde": config.enable_retrograde,
                "enable_inversion": config.enable_inversion,
                "include_original": config.include_original,
            },
            "metadata_path": str(metadata_path),
            "failures": failures,
        }

    # ------------------------------------------------------------------
    # Augmentation
    # ------------------------------------------------------------------

    def _resolve_augmentation_config(
        self, value: Optional[Dict[str, Any] | AugmentationConfig]
    ) -> AugmentationConfig:
        if value is None:
            return self.augmentation_config
        if isinstance(value, AugmentationConfig):
            return value
        return AugmentationConfig.from_mapping(value)

    def _build_augmented_variants(
        self,
        text: str,
        config: AugmentationConfig,
    ) -> List[Dict[str, str]]:
        """Build augmented variants of a LilyPond source file.

        The base variant is always the original file text unchanged.
        Augmentation operations (transposition, retrograde, etc.) use the
        detected pitch language from the file content.
        """
        variants: List[Dict[str, str]] = []
        seen: set[str] = set()
        language = _detect_language(text)

        current = [{"text": text, "ops": ["base"]}]

        if config.enable_absolute_relative:
            expanded: List[Dict[str, Any]] = []
            for candidate in current:
                expanded.append(candidate)
                expanded.append(
                    {
                        "text": self._convert_relative_absolute(
                            candidate["text"],
                            language=language,
                            target_mode="absolute",
                        ),
                        "ops": [*candidate["ops"], "absolute"],
                    }
                )
                expanded.append(
                    {
                        "text": self._convert_relative_absolute(
                            candidate["text"],
                            language=language,
                            target_mode="relative",
                        ),
                        "ops": [*candidate["ops"], "relative"],
                    }
                )
            current = expanded

        if config.enable_transposition:
            transposition_targets = _generate_transposition_targets(language)
            expanded = []
            for candidate, target in product(current, transposition_targets):
                expanded.append(
                    {
                        "text": self._transpose_with_python_ly(
                            candidate["text"],
                            language=language,
                            target_pitch_name=target,
                        ),
                        "ops": [*candidate["ops"], f"transpose_{target}"],
                    }
                )
            current = expanded

        if config.enable_articulation_variants:
            expanded = []
            for candidate in current:
                expanded.append(candidate)
                expanded.append(
                    {
                        "text": self._articulation_variant(
                            candidate["text"], variant="short"
                        ),
                        "ops": [*candidate["ops"], "articulation_short"],
                    }
                )
                expanded.append(
                    {
                        "text": self._articulation_variant(
                            candidate["text"], variant="expanded"
                        ),
                        "ops": [*candidate["ops"], "articulation_expanded"],
                    }
                )
            current = expanded

        if config.enable_barline_variants:
            expanded = []
            for candidate in current:
                expanded.append(candidate)
                expanded.append(
                    {
                        "text": self._barline_variant(candidate["text"], mode="add"),
                        "ops": [*candidate["ops"], "barline_add"],
                    }
                )
                expanded.append(
                    {
                        "text": self._barline_variant(candidate["text"], mode="remove"),
                        "ops": [*candidate["ops"], "barline_remove"],
                    }
                )
            current = expanded

        if config.enable_retrograde:
            expanded = []
            for candidate in current:
                expanded.append(candidate)
                expanded.append(
                    {
                        "text": self._retrograde_with_python_ly(
                            candidate["text"], language=language
                        ),
                        "ops": [*candidate["ops"], "retrograde"],
                    }
                )
            current = expanded

        if config.enable_inversion:
            expanded = []
            for candidate in current:
                expanded.append(candidate)
                expanded.append(
                    {
                        "text": self._inversion_with_python_ly(
                            candidate["text"], language=language
                        ),
                        "ops": [*candidate["ops"], "inversion"],
                    }
                )
            current = expanded

        for candidate in current:
            if not config.include_original and candidate["ops"] == ["base"]:
                continue
            candidate_text = candidate["text"]
            key = sha1(candidate_text.encode("utf-8")).hexdigest()
            if key in seen:
                continue
            seen.add(key)

            op_tags = [tag for tag in candidate["ops"] if tag != "base"]
            variant_id = "base" if not op_tags else "__".join(op_tags)
            variants.append(
                {
                    "variant_id": variant_id,
                    "text": candidate_text,
                }
            )

        return variants

    # ------------------------------------------------------------------
    # python-ly helpers (used by augmentation)
    # ------------------------------------------------------------------

    def _translate_with_python_ly(
        self,
        text: str,
        source_language: str,
        target_language: str,
    ) -> str:
        if source_language == target_language:
            return text

        try:
            document = ly.document.Document(text)
            cursor = ly.document.Cursor(document)
            from ly.pitch.translate import translate

            translate(cursor, target_language, default_language=source_language)
            return document.plaintext()
        except Exception as exc:
            logger.warning(
                "python-ly translate failed (%s->%s): %s",
                source_language,
                target_language,
                exc,
            )
            return text

    def _convert_relative_absolute(
        self,
        text: str,
        language: str,
        target_mode: str,
    ) -> str:
        try:
            document = ly.document.Document(text)
            cursor = ly.document.Cursor(document)
            if target_mode == "absolute":
                rel2abs(cursor, language=language)
            else:
                abs2rel(cursor, language=language)
            return document.plaintext()
        except Exception:
            return text

    def _transpose_with_python_ly(
        self,
        text: str,
        language: str,
        target_pitch_name: str,
    ) -> str:
        try:
            reader = ly.pitch.pitchReader("english")
            target = reader(target_pitch_name)
            if not target:
                return text

            source_pitch = ly.pitch.Pitch(note=0, alter=Fraction(0, 1), octave=0)
            target_pitch = ly.pitch.Pitch(
                note=int(target[0]), alter=Fraction(target[1]), octave=0
            )
            transposer = Transposer(source_pitch, target_pitch)

            document = ly.document.Document(text)
            cursor = ly.document.Cursor(document)
            transpose(cursor, transposer=transposer, language=language)
            return document.plaintext()
        except Exception:
            return text

    def _articulation_variant(self, text: str, variant: str) -> str:
        if variant == "short":
            out = text
            out = re.sub(r"\\staccato\\b", "-.", out)
            out = re.sub(r"\\accent\\b", "->", out)
            out = re.sub(r"\\tenuto\\b", "--", out)
            out = re.sub(r"\\marcato\\b", "-^", out)
            return out

        out = text
        out = re.sub(r"(?<!\\)\\.-", r"\\staccato", out)
        out = re.sub(r"->", r"\\accent", out)
        out = re.sub(r"--", r"\\tenuto", out)
        out = re.sub(r"-\^", r"\\marcato", out)
        return out

    def _barline_variant(self, text: str, mode: str) -> str:
        if mode == "remove":
            stripped = re.sub(r"\|", " ", text)
            return re.sub(r"\s{2,}", " ", stripped)

        normalized = re.sub(r"\s*\|\s*", " | ", text)
        if "|" in normalized:
            return re.sub(r"\s{2,}", " ", normalized)

        tokens = normalized.split()
        if not tokens:
            return normalized

        chunks: List[str] = []
        note_count = 0
        note_token = re.compile(r"^[A-Za-z][A-Za-z0-9,'!?]*$")
        for token in tokens:
            chunks.append(token)
            if note_token.match(token):
                note_count += 1
                if note_count % 16 == 0:
                    chunks.append("|")

        return " ".join(chunks)

    def _retrograde_with_python_ly(self, text: str, language: str) -> str:
        try:
            document = ly.document.Document(text)
            cursor = ly.document.Cursor(document)
            ly_retrograde(cursor, language=language)
            return document.plaintext()
        except Exception as exc:
            logger.warning("retrograde failed: %s", exc)
            return text

    def _inversion_with_python_ly(self, text: str, language: str) -> str:
        try:
            document = ly.document.Document(text)
            cursor = ly.document.Cursor(document)
            ly_inversion(cursor, language=language)
            return document.plaintext()
        except Exception as exc:
            logger.warning("inversion failed: %s", exc)
            return text
