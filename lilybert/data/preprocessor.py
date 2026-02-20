"""LilyPond preprocessing pipeline for lilyBERT.

This module implements a multi-stage preprocessing flow tailored for MIR
classification. It keeps musical content while removing non-musical engraving
surface.
"""

from __future__ import annotations

import json
import logging
import re
import shutil
import subprocess
import tempfile
from dataclasses import dataclass, field
from fractions import Fraction
from hashlib import sha1
from itertools import product
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from transformers import PreTrainedTokenizer

from .parser import LilyPondParser

import ly.document
import ly.pitch
from ly.pitch.abs2rel import abs2rel
from ly.pitch.rel2abs import rel2abs
import ly.lex
from ly.pitch.translate import translate
from ly.pitch.transpose import Transposer, transpose

logger = logging.getLogger(__name__)


def _preprocess_dataset_file_worker(
    path: str,
    labels_map: Dict[str, Any],
    aug_cfg: Dict[str, Any],
    max_sequence_length: int,
    add_special_tokens: bool,
    normalize_notation: bool,
) -> Dict[str, Any]:
    """Process one raw file and return augmented movement payloads."""
    try:
        text = Path(path).read_text(encoding="utf-8", errors="ignore")
        pre = LilyPondPreprocessor(
            tokenizer=None,
            max_sequence_length=max_sequence_length,
            add_special_tokens=add_special_tokens,
            normalize_notation=normalize_notation,
            augmentation_config=aug_cfg,
        )
        labels_entry = labels_map.get(Path(path).name, {})
        movements = pre.process_content(text, Path(path).name, labels_entry)
        out_items = []
        for movement in movements:
            variants = pre._build_augmented_variants(movement, pre.augmentation_config)
            for variant in variants:
                out_items.append(
                    {
                        "movement_id": movement["movement_id"],
                        "language": variant["language"],
                        "variant_id": variant["variant_id"],
                        "text": variant["text"],
                        "base_work": movement.get("base_work"),
                        "movement_index": movement.get("movement_index"),
                        "source_file": Path(path).name,
                        "meta_key": movement.get("meta_key"),
                        "section_nomenclature": movement.get("section_nomenclature"),
                        "labels": movement.get("labels", {}),
                        "structure_markers": movement.get("structure_markers", []),
                    }
                )
        return {"ok": True, "items": out_items}
    except Exception as exc:  # pragma: no cover - runtime failure path
        return {"ok": False, "error": str(exc), "file": path}


ITALIAN_TO_ENGLISH_NOTES = {
    "dodd": "cisis",
    "dobb": "ceses",
    "redd": "disis",
    "rebb": "deses",
    "midd": "eisis",
    "mibb": "eeses",
    "fadd": "fisis",
    "fabb": "feses",
    "soldd": "gisis",
    "solbb": "geses",
    "ladd": "aisis",
    "labb": "aeses",
    "sidd": "bisis",
    "sibb": "beses",
    "dod": "cis",
    "dob": "ces",
    "red": "dis",
    "reb": "des",
    "mid": "eis",
    "mib": "ees",
    "fad": "fis",
    "fab": "fes",
    "sold": "gis",
    "solb": "ges",
    "lad": "ais",
    "lab": "aes",
    "sid": "bis",
    "sib": "bes",
    "do": "c",
    "re": "d",
    "mi": "e",
    "fa": "f",
    "sol": "g",
    "la": "a",
    "si": "b",
}

DEFAULT_AUGMENTATION_LANGUAGES = ["italiano", "english"]
AVAILABLE_LILYPOND_LANGUAGES = {
    "nederlands",
    "english",
    "deutsch",
    "svenska",
    "italiano",
    "espanol",
    "portugues",
    "vlaams",
    "norsk",
    "suomi",
    "catalan",
}

TRANSPOSITION_TARGETS_ENGLISH = [
    "c",
    "bs",
    "df",
    "cs",
    "d",
    "ef",
    "ds",
    "ff",
    "e",
    "es",
    "f",
    "gf",
    "fs",
    "g",
    "af",
    "gs",
    "a",
    "bf",
    "as",
    "cf",
    "b",
]


@dataclass
class AugmentationConfig:
    """Configurable LilyPond data augmentation knobs for Stage-1 corpus building."""

    languages: List[str] = field(
        default_factory=lambda: list(DEFAULT_AUGMENTATION_LANGUAGES)
    )
    enable_transposition: bool = False
    enable_absolute_relative: bool = False
    enable_articulation_variants: bool = False
    enable_barline_variants: bool = False
    include_original: bool = True

    @classmethod
    def from_mapping(cls, value: Optional[Dict[str, Any]]) -> "AugmentationConfig":
        raw = value or {}
        languages = raw.get("languages", DEFAULT_AUGMENTATION_LANGUAGES)
        if isinstance(languages, str):
            languages = [lang.strip() for lang in languages.split(",") if lang.strip()]

        normalized_languages = [str(language).strip().lower() for language in languages]
        if not normalized_languages:
            normalized_languages = list(DEFAULT_AUGMENTATION_LANGUAGES)

        invalid_languages = sorted(
            set(normalized_languages) - AVAILABLE_LILYPOND_LANGUAGES
        )
        if invalid_languages:
            raise ValueError(
                "Unsupported LilyPond language(s): "
                f"{invalid_languages}. Supported: {sorted(AVAILABLE_LILYPOND_LANGUAGES)}"
            )

        return cls(
            languages=normalized_languages,
            enable_transposition=bool(raw.get("enable_transposition", False)),
            enable_absolute_relative=bool(raw.get("enable_absolute_relative", False)),
            enable_articulation_variants=bool(
                raw.get("enable_articulation_variants", False)
            ),
            enable_barline_variants=bool(raw.get("enable_barline_variants", False)),
            include_original=bool(raw.get("include_original", True)),
        )


class LilyPondPreprocessor:
    """Multi-stage LilyPond preprocessor for movement-level classification data."""

    def __init__(
        self,
        tokenizer: Optional[PreTrainedTokenizer] = None,
        max_sequence_length: int = 1024,
        add_special_tokens: bool = False,
        normalize_notation: bool = True,
        augmentation_config: Optional[Dict[str, Any] | AugmentationConfig] = None,
    ):
        self.tokenizer = tokenizer
        self.max_sequence_length = max_sequence_length
        self.add_special_tokens = add_special_tokens
        self.normalize_notation = normalize_notation
        self.parser = LilyPondParser()
        self.labels_path = "./data/labels/labels_v1.json"
        self._note_regex = self._build_note_regex()
        if isinstance(augmentation_config, AugmentationConfig):
            self.augmentation_config = augmentation_config
        else:
            self.augmentation_config = AugmentationConfig.from_mapping(
                augmentation_config
            )

    def preprocess_file(self, file_path: str) -> Dict[str, Any]:
        """Legacy-compatible entrypoint returning file-level plus movement outputs."""
        path = Path(file_path)
        raw_text = path.read_text(encoding="utf-8", errors="ignore")
        labels_entry = self._load_labels().get(path.name, {})
        movements = self.process_content(raw_text, path.name, labels_entry)

        merged_text = "\n\n".join(m["italiano_text"] for m in movements)
        tokenized = self._tokenize_text(merged_text) if self.tokenizer else None

        self.parser.parse_content(merged_text)
        statistics = self.parser.get_statistics()

        return {
            "text": merged_text,
            "raw_text": raw_text,
            "tokenized": tokenized,
            "metadata": {},
            "statistics": statistics,
            "file_path": str(path),
            "labels": labels_entry or {"unknown": []},
            "movements": movements,
        }

    def preprocess_directory(
        self,
        input_dir: str,
        output_dir: Optional[str] = None,
        file_pattern: str = "*.ly",
    ) -> List[Dict[str, Any]]:
        """Legacy-compatible directory preprocessing helper."""
        input_path = Path(input_dir)
        files = sorted(input_path.glob(file_pattern))
        outputs: List[Dict[str, Any]] = []

        for file_path in files:
            try:
                processed = self.preprocess_file(str(file_path))
                outputs.append(processed)

                if output_dir:
                    output_path = Path(output_dir)
                    output_path.mkdir(parents=True, exist_ok=True)
                    output_file = output_path / f"{file_path.stem}_processed.json"
                    output_file.write_text(
                        json.dumps(processed, ensure_ascii=False, indent=2),
                        encoding="utf-8",
                    )
            except Exception as exc:
                logger.error("Error processing %s: %s", file_path, exc)

        return outputs

    def preprocess_to_dataset(
        self,
        input_dir: str = "data/raw",
        output_dir: str = "data/processed",
        labels_path: Optional[str] = None,
        augmentation_config: Optional[Dict[str, Any] | AugmentationConfig] = None,
    ) -> Dict[str, Any]:
        """Run full preprocessing pipeline and write movement-level outputs."""
        raw_dir = Path(input_dir)
        if not raw_dir.exists():
            raise FileNotFoundError(f"Input folder not found: {raw_dir}")

        if labels_path:
            self.labels_path = labels_path

        labels_map = self._load_labels()
        config = self._resolve_augmentation_config(augmentation_config)
        out_root = Path(output_dir)
        language_dirs = {lang: out_root / lang for lang in config.languages}
        for directory in language_dirs.values():
            directory.mkdir(parents=True, exist_ok=True)

        metadata: Dict[str, Any] = {}
        failures: Dict[str, str] = {}
        total_movements = 0

        # Parallel worker submits per raw file to avoid holding heavy parser state
        from concurrent.futures import ProcessPoolExecutor, as_completed
        import os

        raw_files = sorted([str(p) for p in raw_dir.glob("*.ly")])
        max_workers = min(8, (os.cpu_count() or 2))

        aug_cfg = {
            "languages": list(config.languages),
            "enable_transposition": config.enable_transposition,
            "enable_absolute_relative": config.enable_absolute_relative,
            "enable_articulation_variants": config.enable_articulation_variants,
            "enable_barline_variants": config.enable_barline_variants,
            "include_original": config.include_original,
        }

        with ProcessPoolExecutor(max_workers=max_workers) as exe:
            futures = {
                exe.submit(
                    _preprocess_dataset_file_worker,
                    path,
                    labels_map,
                    aug_cfg,
                    self.max_sequence_length,
                    self.add_special_tokens,
                    self.normalize_notation,
                ): path
                for path in raw_files
            }
            for fut in as_completed(futures):
                path = futures[fut]
                res = fut.result()
                if not res.get("ok"):
                    failures[Path(path).name] = res.get("error")
                    continue
                for item in res.get("items", []):
                    movement_id = item["movement_id"]
                    total_movements += 1

                    language = item["language"]
                    if language not in language_dirs:
                        continue

                    variant_id = item["variant_id"]
                    if variant_id == "base":
                        file_name = f"{movement_id}.ly"
                    else:
                        file_name = f"{movement_id}__{variant_id}.ly"

                    output_path = language_dirs[language] / file_name
                    output_path.write_text(item["text"], encoding="utf-8")

                    if variant_id == "base":
                        metadata[movement_id] = {
                            "base_work": item.get("base_work"),
                            "source_file": item.get("source_file"),
                            "movement_index": item.get("movement_index"),
                            "meta_key": item.get("meta_key"),
                            "section_nomenclature": item.get("section_nomenclature"),
                            "labels": item.get("labels", {}),
                            "structure_markers": item.get("structure_markers", []),
                        }

        metadata_path = out_root / "metadata.json"
        metadata_path.write_text(json.dumps(metadata, ensure_ascii=False, indent=2), encoding="utf-8")

        return {
            "files_processed": len(raw_files),
            "movements_written": total_movements,
            "languages": config.languages,
            "augmentation": {
                "enable_transposition": config.enable_transposition,
                "enable_absolute_relative": config.enable_absolute_relative,
                "enable_articulation_variants": config.enable_articulation_variants,
                "enable_barline_variants": config.enable_barline_variants,
                "include_original": config.include_original,
            },
            "metadata_path": str(metadata_path),
            "failures": failures,
        }

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
        movement: Dict[str, Any],
        config: AugmentationConfig,
    ) -> List[Dict[str, str]]:
        variants: List[Dict[str, str]] = []
        seen = set()

        base_italiano = movement.get("italiano_text", "")
        for language in config.languages:
            if language == "italiano":
                language_text = base_italiano
            elif language == "english":
                language_text = movement.get("english_text") or self._translate_with_python_ly(
                    base_italiano,
                    source_language="italiano",
                    target_language="english",
                )
            else:
                language_text = self._translate_with_python_ly(
                    base_italiano,
                    source_language="italiano",
                    target_language=language,
                )

            current = [{"text": language_text, "ops": ["base"]}]

            if config.enable_absolute_relative:
                expanded: List[Dict[str, Any]] = []
                for candidate in current:
                    expanded.append(candidate)
                    expanded.append(
                        {
                            "text": self._convert_relative_absolute(
                                candidate["text"], language=language, target_mode="absolute"
                            ),
                            "ops": [*candidate["ops"], "absolute"],
                        }
                    )
                    expanded.append(
                        {
                            "text": self._convert_relative_absolute(
                                candidate["text"], language=language, target_mode="relative"
                            ),
                            "ops": [*candidate["ops"], "relative"],
                        }
                    )
                current = expanded

            if config.enable_transposition:
                expanded = []
                for candidate, target in product(current, TRANSPOSITION_TARGETS_ENGLISH):
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
                            "text": self._barline_variant(
                                candidate["text"], mode="remove"
                            ),
                            "ops": [*candidate["ops"], "barline_remove"],
                        }
                    )
                current = expanded

            for candidate in current:
                if not config.include_original and candidate["ops"] == ["base"]:
                    continue
                normalized_text = candidate["text"].strip() + "\n"
                key = (language, sha1(normalized_text.encode("utf-8")).hexdigest())
                if key in seen:
                    continue
                seen.add(key)

                op_tags = [tag for tag in candidate["ops"] if tag != "base"]
                variant_id = "base" if not op_tags else "__".join(op_tags)
                variants.append(
                    {
                        "language": language,
                        "variant_id": variant_id,
                        "text": normalized_text,
                    }
                )

        return variants

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
            translate(cursor, target_language, default_language=source_language)
            return document.plaintext()
        except Exception:
            if target_language == "english" and source_language == "italiano":
                return self._convert_italian_to_english_notes(text)
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

    def process_content(
        self,
        content: str,
        source_filename: str,
        labels_entry: Optional[Dict[str, Any]] = None,
    ) -> List[Dict[str, Any]]:
        """Apply Stage 1-8 preprocessing and return movement-level records."""
        labels_entry = labels_entry or {}

        stage1 = self._remove_comments_and_cleanup(content)
        stage2 = self._normalize_syntax(stage1) if self.normalize_notation else stage1

        assignments = self._parse_assignments(stage2)
        forma_commands = self._extract_forma_commands(assignments.get("forma", ""))
        if forma_commands:
            assignments = self._prepend_forma_to_voice_assignments(
                assignments, forma_commands
            )

        score_blocks = self._extract_score_blocks(stage2)
        if not score_blocks:
            score_blocks = [stage2]

        movement_meta = (
            labels_entry.get("meta", {}) if isinstance(labels_entry, dict) else {}
        )
        meta_items = list(movement_meta.items())
        base_work = Path(source_filename).stem

        outputs: List[Dict[str, Any]] = []
        for idx, score_block in enumerate(score_blocks, start=1):
            expanded = self._inline_variables(score_block, assignments)
            if forma_commands:
                expanded = re.sub(r"\\forma\b", lambda _: forma_commands, expanded)

            parts = self._extract_part_blocks(score_block, assignments, forma_commands)

            if parts:
                italian = self._render_part_variables(parts, language="italiano")
                english = self._render_part_variables(parts, language="english")
            else:
                stage5 = self._strip_engraving(expanded)
                stage7 = self._postprocess(stage5)
                if not stage7.strip():
                    continue
                italian = stage7.strip() + "\n"
                english = self._convert_italian_to_english_notes(italian)

            meta_key = meta_items[idx - 1][0] if idx - 1 < len(meta_items) else None
            meta_value = meta_items[idx - 1][1] if idx - 1 < len(meta_items) else {}
            section = self._extract_section_nomenclature(meta_key)
            movement_id = f"{base_work}_mvt{idx}"

            outputs.append(
                {
                    "movement_id": movement_id,
                    "base_work": base_work,
                    "movement_index": idx,
                    "meta_key": meta_key,
                    "section_nomenclature": section,
                    "labels": {
                        "composer": (
                            labels_entry.get("composer") if labels_entry else None
                        ),
                        "musical_form": (
                            labels_entry.get("musical_form") if labels_entry else []
                        ),
                        "midi_instruments": (
                            labels_entry.get("midi_instruments") if labels_entry else []
                        ),
                        "period": labels_entry.get("period") if labels_entry else None,
                        "meta": meta_value,
                    },
                    "parts": parts,
                    "italiano_text": italian,
                    "english_text": english,
                    "structure_markers": self._extract_structure_markers(italian),
                }
            )

        return outputs

    def _extract_part_blocks(
        self,
        score_block: str,
        assignments: Dict[str, str],
        forma_commands: str,
    ) -> List[Dict[str, str]]:
        part_names = self._extract_referenced_assignment_names(score_block, assignments)
        parts: List[Dict[str, str]] = []

        for name in part_names:
            value = assignments.get(name, "")
            if not value:
                continue

            expanded = self._inline_variables(value, assignments)
            if forma_commands:
                expanded = re.sub(r"\\forma\b", lambda _: forma_commands, expanded)

            stripped = self._strip_engraving(expanded)
            cleaned = self._postprocess(stripped)
            if not cleaned.strip():
                continue
            if not self._has_musical_content(cleaned):
                continue

            italian_text = cleaned.strip()
            parts.append(
                {
                    "name": name,
                    "italiano_text": italian_text,
                    "english_text": self._convert_italian_to_english_notes(
                        italian_text
                    ),
                    "structure_markers": self._extract_structure_markers(italian_text),
                }
            )

        return parts

    def _has_musical_content(self, text: str) -> bool:
        tokens = self.parser._tokenize_music(text)
        if not tokens:
            return False

        for token in tokens:
            element = self.parser._parse_token(token)
            if element is None:
                continue

            if element.type in {"note", "chord", "rest"}:
                return True

            if element.type == "directive":
                attrs = element.attributes or {}
                if attrs.get("note_count", 0) > 0:
                    return True

        return False

    def _extract_referenced_assignment_names(
        self, score_block: str, assignments: Dict[str, str]
    ) -> List[str]:
        names: List[str] = []
        seen = set()

        for match in re.finditer(r"\\([A-Za-z][\w-]*)\b", score_block):
            name = match.group(1)
            if name in seen:
                continue
            if name not in assignments:
                continue
            if name == "forma":
                continue
            seen.add(name)
            names.append(name)

        return names

    def _render_part_variables(self, parts: List[Dict[str, str]], language: str) -> str:
        rows: List[str] = []
        key = f"{language}_text"

        for part in parts:
            name = part["name"]
            body = part[key].strip()
            rows.append(f"{name} = {{\n{body}\n}}")

        return "\n\n".join(rows).strip() + "\n"

    def _extract_structure_markers(self, text: str) -> List[str]:
        """Extract score-structure markers using python-ly lexical tokens."""
        document = ly.document.Document(text)
        state = ly.lex.state("lilypond")

        markers: List[str] = []
        in_simultaneous_depth = 0

        for token in state.tokens(document.plaintext()):
            token_type = type(token).__name__
            token_text = str(token)

            if token_type == "Score":
                markers.append("[SCORE]")
                continue

            if token_type == "SimultaneousStart":
                markers.append("[SIMUL_BEGIN]")
                in_simultaneous_depth += 1
                continue

            if token_type == "SimultaneousEnd":
                markers.append("[SIMUL_END]")
                in_simultaneous_depth = max(0, in_simultaneous_depth - 1)
                continue

            if token_type == "SequentialStart":
                markers.append("[SEQ_BEGIN]")
                continue

            if token_type == "SequentialEnd":
                markers.append("[SEQ_END]")
                continue

            if (
                token_type == "Unparsed"
                and token_text == "\\"
                and in_simultaneous_depth > 0
            ):
                markers.append("[VOICE_SEP]")

        return markers

    def _preprocess_text(self, text: str) -> str:
        """Compatibility wrapper for tests and existing callers."""
        stage1 = self._remove_comments_and_cleanup(text)
        return self._normalize_syntax(stage1) if self.normalize_notation else stage1

    def _normalize_notation(self, text: str) -> str:
        """Legacy compatibility alias to syntax normalization stage."""
        return self._normalize_syntax(text)

    def _tokenize_text(self, text: str) -> Dict[str, Any]:
        tokenized = self.tokenizer(
            text,
            truncation=True,
            max_length=self.max_sequence_length,
            padding=False,
            return_tensors="pt",
        )
        return {
            "input_ids": tokenized["input_ids"].squeeze().tolist(),
            "attention_mask": tokenized["attention_mask"].squeeze().tolist(),
            "token_count": len(tokenized["input_ids"].squeeze()),
            "truncated": len(tokenized["input_ids"].squeeze())
            >= self.max_sequence_length,
        }

    def _remove_comments_and_cleanup(self, text: str) -> str:
        text = text.replace("\ufeff", "").replace("\r\n", "\n").replace("\r", "\n")

        out: List[str] = []
        i = 0
        n = len(text)
        block_comment_depth = 0
        scheme_depth = 0
        markup_depth = 0
        pending_markup = False

        while i < n:
            if block_comment_depth > 0:
                if text.startswith("%{", i):
                    block_comment_depth += 1
                    i += 2
                    continue
                if text.startswith("%}", i):
                    block_comment_depth -= 1
                    i += 2
                    continue
                i += 1
                continue

            if text.startswith("\\markup", i):
                pending_markup = True

            if text.startswith("#{", i):
                out.append("#{")
                i += 2
                continue

            if text.startswith("#(", i):
                scheme_depth += 1
                out.append("#(")
                i += 2
                continue

            ch = text[i]
            if ch == ")" and scheme_depth > 0:
                scheme_depth -= 1
                out.append(ch)
                i += 1
                continue

            if pending_markup and ch == "{":
                markup_depth += 1
                pending_markup = False
                out.append(ch)
                i += 1
                continue

            if ch == "{" and markup_depth > 0:
                markup_depth += 1
                out.append(ch)
                i += 1
                continue

            if ch == "}" and markup_depth > 0:
                markup_depth -= 1
                out.append(ch)
                i += 1
                continue

            if scheme_depth == 0 and markup_depth == 0:
                if text.startswith("%{", i):
                    block_comment_depth = 1
                    i += 2
                    continue
                if ch == "%":
                    i += 1
                    while i < n and text[i] != "\n":
                        i += 1
                    continue

            out.append(ch)
            i += 1

        cleaned = "".join(out)
        cleaned = re.sub(r"[ \t]+$", "", cleaned, flags=re.MULTILINE)
        cleaned = re.sub(r"\n{3,}", "\n\n", cleaned)
        return cleaned.strip() + "\n"

    def _normalize_syntax(self, text: str) -> str:
        text = re.sub(r"\\times\s+([0-9]+/[0-9]+)\s*\{", r"\\tuplet \1 {", text)
        text = self._dedupe_nested_tuplets(text)
        text = self._canonicalize_chords(text)
        text = self._resolve_transpose_blocks(text)
        return text

    def _dedupe_nested_tuplets(self, text: str) -> str:
        previous = None
        pattern = re.compile(
            r"\\tuplet\s+([0-9]+/[0-9]+)\s*\{\s*\\tuplet\s+\1\s*\{(.*?)\}\s*\}",
            re.DOTALL,
        )
        while previous != text:
            previous = text
            text = pattern.sub(r"\\tuplet \1 {\2}", text)
        return text

    def _canonicalize_chords(self, text: str) -> str:
        def repl(match: re.Match) -> str:
            inner = " ".join(match.group(1).split())
            return f"<{inner}>"

        text = re.sub(r"<([^>]*)>", repl, text)
        text = re.sub(r"<\s+", "<", text)
        return re.sub(r"\s+>", ">", text)

    def _resolve_transpose_blocks(self, text: str) -> str:
        if "\\transpose" not in text:
            return text

        lily_cmd = shutil.which("lilypond")
        if not lily_cmd:
            logger.debug("LilyPond not available; keeping \\transpose blocks unchanged")
            return text

        blocks = self._find_transpose_blocks(text)
        if not blocks:
            return text

        expansions = self._run_lily_batch([block[2] for block in blocks], lily_cmd)
        out_parts: List[str] = []
        cursor = 0
        for (start, end, original), expanded in zip(blocks, expansions):
            out_parts.append(text[cursor:start])
            out_parts.append(expanded if expanded else original)
            cursor = end
        out_parts.append(text[cursor:])
        return "".join(out_parts)

    def _find_transpose_blocks(self, text: str) -> List[Tuple[int, int, str]]:
        pattern = re.compile(r"\\transpose\s+([^\s{}]+)\s+([^\s{}]+)\s*\{", re.I)
        blocks: List[Tuple[int, int, str]] = []
        search_start = 0
        while True:
            match = pattern.search(text, search_start)
            if not match:
                break
            open_idx = match.end() - 1
            close_idx = self._find_matching_brace(text, open_idx)
            blocks.append((match.start(), close_idx, text[match.start() : close_idx]))
            search_start = close_idx
        return blocks

    def _run_lily_batch(self, blocks: List[str], lily_cmd: str) -> List[Optional[str]]:
        parts: List[str] = []
        for idx, block in enumerate(blocks):
            name = f"music{idx}"
            parts.append(f"{name} = \\absolute {{ {block} }}")
            parts.append(f'#(display "===BEGIN_{idx}===\\n")')
            parts.append(f"\\displayLilyMusic \\{name}")
            parts.append(f'#(display "===END_{idx}===\\n")')

        source = "\n".join(parts) + "\n"
        with tempfile.TemporaryDirectory() as temp_dir:
            in_file = Path(temp_dir) / "input.ly"
            in_file.write_text(source, encoding="utf-8")
            try:
                proc = subprocess.run(
                    [
                        lily_cmd,
                        "-dno-print-pages",
                        "-dbackend=null",
                        "-o",
                        str(Path(temp_dir) / "dump"),
                        str(in_file),
                    ],
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                    encoding="utf-8",
                    timeout=120,
                )
            except Exception:
                return [None] * len(blocks)

        output = ((proc.stdout or "") + "\n" + (proc.stderr or "")).replace(
            "\r\n", "\n"
        )
        results: List[Optional[str]] = [None] * len(blocks)
        for idx in range(len(blocks)):
            match = re.search(
                rf"===BEGIN_{idx}===\n(.*?)===END_{idx}===\n?", output, re.DOTALL
            )
            if not match:
                continue
            segment = match.group(1).strip()
            if segment.startswith("{") and segment.endswith("}"):
                segment = segment[1:-1].strip()
            results[idx] = segment or None

        return results

    def _parse_assignments(self, text: str) -> Dict[str, str]:
        assignments: Dict[str, str] = {}
        pattern = re.compile(r"(^|\n)\s*([A-Za-z][\w-]*)\s*=", re.MULTILINE)
        for match in pattern.finditer(text):
            name = match.group(2)
            value_start = match.end()
            while value_start < len(text) and text[value_start].isspace():
                value_start += 1

            value_end = self._read_assignment_value_end(text, value_start)
            value = text[value_start:value_end].strip()
            if value:
                assignments[name] = value

        return assignments

    def _read_assignment_value_end(self, text: str, start: int) -> int:
        if start >= len(text):
            return start

        if text.startswith("<<", start):
            return self._find_matching_angles(text, start)
        if text[start] == "{":
            return self._find_matching_brace(text, start)

        next_brace = text.find("{", start)
        if text.startswith("\\relative", start) or text.startswith("\\absolute", start):
            if next_brace != -1:
                return self._find_matching_brace(text, next_brace)

        next_line = text.find("\n", start)
        return len(text) if next_line == -1 else next_line

    def _inline_variables(self, text: str, assignments: Dict[str, str]) -> str:
        def expand(segment: str, depth: int = 0) -> str:
            if depth > 8:
                return segment

            def repl(match: re.Match) -> str:
                var_name = match.group(1)
                if var_name not in assignments:
                    return match.group(0)
                return expand(assignments[var_name], depth + 1)

            return re.sub(r"\\([A-Za-z][\w-]*)\b", repl, segment)

        return expand(text)

    def _extract_forma_commands(self, forma_value: str) -> str:
        if not forma_value:
            return ""

        commands = []
        command_patterns = [
            r"\\key\s+[^\\\n]+",
            r"\\time\s+[^\\\n]+",
            r"\\tempo\s+[^\\\n]+",
            r"\\partial\s+[^\\\n]+",
        ]
        for pattern in command_patterns:
            match = re.search(pattern, forma_value)
            if match:
                commands.append(" ".join(match.group(0).split()))

        return " ".join(commands).strip()

    def _prepend_forma_to_voice_assignments(
        self, assignments: Dict[str, str], forma_commands: str
    ) -> Dict[str, str]:
        if not forma_commands:
            return assignments

        updated = dict(assignments)
        for name, value in assignments.items():
            if name == "forma":
                continue
            if re.search(r"\\(key|time|tempo|partial)\b", value):
                continue
            if not re.search(r"\b(do|re|mi|fa|sol|la|si|[a-g])\b", value):
                continue

            updated[name] = self._prepend_to_music_value(value, forma_commands)

        return updated

    def _prepend_to_music_value(self, value: str, prefix: str) -> str:
        if value.startswith("{"):
            return "{ " + prefix + " " + value[1:].lstrip()

        if value.startswith("\\relative") or value.startswith("\\absolute"):
            brace_idx = value.find("{")
            if brace_idx != -1:
                return (
                    value[: brace_idx + 1]
                    + " "
                    + prefix
                    + " "
                    + value[brace_idx + 1 :].lstrip()
                )

        return f"{prefix} {value}".strip()

    def _strip_engraving(self, text: str) -> str:
        text = self._remove_block_command(text, "layout")
        text = self._remove_block_command(text, "midi")
        text = self._remove_block_command(text, "header")

        text = re.sub(r"\\version\s+\"[^\"]*\"", "", text)
        text = re.sub(r"\\language\s+\"[^\"]*\"", "", text)

        text = re.sub(r"#\(let\b.*?\)", "", text, flags=re.DOTALL)
        text = re.sub(r"#\(define\b.*?\)", "", text, flags=re.DOTALL)

        text = re.sub(r"\\new\s+(ChoirStaff|Staff|PianoStaff|Voice)\b", "", text)
        text = re.sub(
            r"\\set\s+Staff\.(midiInstrument|instrumentName)\s*=\s*[^\n]+", "", text
        )

        text = re.sub(r"\\(override|revert)\b[^\n]*", "", text)
        text = re.sub(r"\\(pageBreak|break)\b", "", text)

        return text

    def _remove_block_command(self, text: str, command: str) -> str:
        pattern = re.compile(rf"\\{command}\s*\{{", re.I)
        out: List[str] = []
        cursor = 0

        while True:
            match = pattern.search(text, cursor)
            if not match:
                out.append(text[cursor:])
                break

            out.append(text[cursor : match.start()])
            open_idx = text.find("{", match.start())
            close_idx = self._find_matching_brace(text, open_idx)
            cursor = close_idx

        return "".join(out)

    def _extract_score_blocks(self, text: str) -> List[str]:
        blocks: List[str] = []
        pattern = re.compile(r"\\score\s*\{", re.I)
        cursor = 0

        while True:
            match = pattern.search(text, cursor)
            if not match:
                break

            open_idx = text.find("{", match.start())
            close_idx = self._find_matching_brace(text, open_idx)
            blocks.append(text[open_idx + 1 : close_idx - 1].strip())
            cursor = close_idx

        return blocks

    def _postprocess(self, text: str) -> str:
        text = re.sub(r"<<\s*\\\\\s*(.*?)\s*>>", r"{ \1 }", text, flags=re.DOTALL)
        text = re.sub(r"<<\s*(.*?)\s*\\\\\s*>>", r"{ \1 }", text, flags=re.DOTALL)
        text = re.sub(
            r"(^|\n)\s*([A-Za-z][\w-]*)\s*=\s*(?:\\(key|time|tempo|partial)\b|r\b|s\b|\{\s*\})[^\n]*",
            "",
            text,
        )
        text = text.replace("##", "")
        text = re.sub(r"\^\s*(?=\n|$)", "", text)

        open_braces = text.count("{")
        close_braces = text.count("}")
        if open_braces > close_braces:
            text += " }" * (open_braces - close_braces)

        text = re.sub(r"[ \t]+$", "", text, flags=re.MULTILINE)
        text = re.sub(r"\n{3,}", "\n\n", text)
        return text.strip()

    def _convert_italian_to_english_notes(self, text: str) -> str:
        def repl(match: re.Match) -> str:
            note = match.group(1)
            suffix = match.group(2) or ""
            mapped = ITALIAN_TO_ENGLISH_NOTES.get(note, note)
            return f"{mapped}{suffix}"

        return self._note_regex.sub(repl, text)

    def _extract_section_nomenclature(self, meta_key: Optional[str]) -> Optional[str]:
        if not meta_key:
            return None
        if ":" not in meta_key:
            return meta_key.strip().lower().replace(" ", "_")
        value = meta_key.split(":", 1)[1].strip().lower()
        return re.sub(r"\s+", "_", value)

    def _build_note_regex(self) -> re.Pattern:
        keys = sorted(ITALIAN_TO_ENGLISH_NOTES.keys(), key=len, reverse=True)
        base = "|".join(re.escape(k) for k in keys)
        return re.compile(rf"(?<![A-Za-z\\])({base})([,']*[!?]?\d*\.*)?(?![A-Za-z])")

    def _load_labels(self) -> Dict[str, Any]:
        labels_file = Path(self.labels_path)
        if not labels_file.exists():
            logger.warning("Labels file not found: %s", labels_file)
            return {}

        with labels_file.open("r", encoding="utf-8") as handle:
            return json.load(handle)

    def _find_matching_brace(self, text: str, open_idx: int) -> int:
        depth = 1
        for i in range(open_idx + 1, len(text)):
            if text[i] == "{":
                depth += 1
            elif text[i] == "}":
                depth -= 1
                if depth == 0:
                    return i + 1
        return len(text)

    def _find_matching_angles(self, text: str, open_idx: int) -> int:
        depth = 1
        i = open_idx + 2
        while i < len(text) and depth > 0:
            if text.startswith("<<", i):
                depth += 1
                i += 2
            elif text.startswith(">>", i):
                depth -= 1
                i += 2
            else:
                i += 1
        return i
