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
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from transformers import PreTrainedTokenizer

from .parser import LilyPondParser

logger = logging.getLogger(__name__)


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


class LilyPondPreprocessor:
    """Multi-stage LilyPond preprocessor for movement-level classification data."""

    def __init__(
        self,
        tokenizer: Optional[PreTrainedTokenizer] = None,
        max_sequence_length: int = 1024,
        add_special_tokens: bool = False,
        normalize_notation: bool = True,
    ):
        self.tokenizer = tokenizer
        self.max_sequence_length = max_sequence_length
        self.add_special_tokens = add_special_tokens
        self.normalize_notation = normalize_notation
        self.parser = LilyPondParser()
        self.labels_path = "./data/labels/labels_v1.json"
        self._note_regex = self._build_note_regex()

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
    ) -> Dict[str, Any]:
        """Run full preprocessing pipeline and write movement-level outputs."""
        raw_dir = Path(input_dir)
        if not raw_dir.exists():
            raise FileNotFoundError(f"Input folder not found: {raw_dir}")

        if labels_path:
            self.labels_path = labels_path

        labels_map = self._load_labels()
        out_root = Path(output_dir)
        it_dir = out_root / "italiano"
        en_dir = out_root / "english"
        it_dir.mkdir(parents=True, exist_ok=True)
        en_dir.mkdir(parents=True, exist_ok=True)

        metadata: Dict[str, Any] = {}
        failures: Dict[str, str] = {}
        total_movements = 0

        for ly_file in sorted(raw_dir.glob("*.ly")):
            try:
                content = ly_file.read_text(encoding="utf-8", errors="ignore")
                labels_entry = labels_map.get(ly_file.name, {})
                movements = self.process_content(content, ly_file.name, labels_entry)

                for movement in movements:
                    movement_id = movement["movement_id"]
                    total_movements += 1

                    it_path = it_dir / f"{movement_id}.ly"
                    en_path = en_dir / f"{movement_id}.ly"
                    it_path.write_text(movement["italiano_text"], encoding="utf-8")
                    en_path.write_text(movement["english_text"], encoding="utf-8")

                    metadata[movement_id] = {
                        "base_work": movement["base_work"],
                        "source_file": ly_file.name,
                        "movement_index": movement["movement_index"],
                        "meta_key": movement.get("meta_key"),
                        "section_nomenclature": movement.get("section_nomenclature"),
                        "labels": movement.get("labels", {}),
                    }
            except Exception as exc:
                failures[ly_file.name] = str(exc)

        metadata_path = out_root / "metadata.json"
        metadata_path.write_text(
            json.dumps(metadata, ensure_ascii=False, indent=2), encoding="utf-8"
        )

        return {
            "files_processed": len(list(raw_dir.glob("*.ly"))),
            "movements_written": total_movements,
            "metadata_path": str(metadata_path),
            "failures": failures,
        }

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
