"""Parser-aware BPE tokenizer utilities for lilyBERT."""

from __future__ import annotations

import logging
import os
import re
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path
from typing import Iterable, List, Optional

import ly.document
import ly.lex
from tokenizers import Tokenizer
from tokenizers.models import BPE
from tokenizers.pre_tokenizers import Whitespace
from tokenizers.trainers import BpeTrainer
from transformers import PreTrainedTokenizerFast

from .parser import LilyPondParser

logger = logging.getLogger(__name__)


def _tokenize_file_worker(path: str) -> dict:
    """Process-safe worker for corpus token extraction."""
    tokenizer = LilyPondTokenizer()
    try:
        text = Path(path).read_text(encoding="utf-8", errors="ignore")
        token_line = tokenizer._movement_to_parser_tokens(text)
        return {"ok": True, "token_line": token_line}
    except Exception as exc:  # pragma: no cover - runtime failure path
        return {"ok": False, "error": str(exc), "path": path}


class LilyPondTokenizer:
    """Parser-aware BPE tokenizer for movement-level LilyPond files."""

    VALID_NOTATION_MODES = {"english", "italiano", "nederlands", "both"}

    SPECIAL_TOKENS = [
        "[CLS]",
        "[SEP]",
        "[PAD]",
        "[UNK]",
        "[MASK]",
        "[PART_BEGIN]",
        "[PART_NAME]",
        "[PART_END]",
        "[SIMUL_BEGIN]",
        "[SIMUL_END]",
        "[SEQ_BEGIN]",
        "[SEQ_END]",
        "[VOICE_SEP]",
        "[SCORE]",
        "[LANGUAGE]",
        "[NEW_STAFF]",
        "[NEW_VOICE]",
        "[NEW_PIANOSTAFF]",
        "[NEW_CHOIRSTAFF]",
    ]

    SPECIAL_TOKEN_TO_LILYPOND = {
        "[SIMUL_BEGIN]": "<<",
        "[SIMUL_END]": ">>",
        "[SEQ_BEGIN]": "{",
        "[SEQ_END]": "}",
        "[VOICE_SEP]": "\\\\",
        "[SCORE]": "\\score",
        "[NEW_STAFF]": "\\new Staff",
        "[NEW_VOICE]": "\\new Voice",
        "[NEW_PIANOSTAFF]": "\\new PianoStaff",
        "[NEW_CHOIRSTAFF]": "\\new ChoirStaff",
    }

    _SKIP_ON_DECODE = {"[CLS]", "[SEP]", "[PAD]", "[MASK]", "[UNK]"}

    DEFAULT_VERSION = "2.24.0"

    def __init__(
        self,
        parser: Optional[LilyPondParser] = None,
        fast_tokenizer: Optional[PreTrainedTokenizerFast] = None,
    ):
        self.parser = parser or LilyPondParser()
        self.fast_tokenizer = fast_tokenizer

    def build_corpus(
        self,
        processed_dir: str | Path,
        notation_mode: str = "both",
        languages: Optional[List[str]] = None,
    ) -> List[str]:
        """Build parser-token corpus strings from cleaned movement files.

        Args:
            processed_dir: Root processed directory (typically `data/processed`).
            notation_mode: Which notation folders to include: `english`,
                `italiano`, or `both`.
            languages: Optional explicit language folders to include.

        Returns:
            List of space-separated parser token strings (one per movement file).
        """
        root = Path(processed_dir)
        if not root.exists():
            raise FileNotFoundError(f"Processed directory not found: {root}")
        if notation_mode not in self.VALID_NOTATION_MODES:
            raise ValueError(
                f"notation_mode must be one of {sorted(self.VALID_NOTATION_MODES)}, got: {notation_mode}"
            )

        movement_files = sorted(
            self._iter_movement_files(root, notation_mode, languages=languages)
        )

        # parallelize token-line extraction using worker processes
        max_workers = min(8, (os.cpu_count() or 2))
        corpus: List[str] = []

        with ProcessPoolExecutor(max_workers=max_workers) as exe:
            futures = {
                exe.submit(_tokenize_file_worker, str(p)): p for p in movement_files
            }
            for fut in as_completed(futures):
                res = fut.result()
                if not res.get("ok"):
                    logger.warning(
                        "Failed building token line for %s: %s",
                        res.get("path"),
                        res.get("error"),
                    )
                    continue
                token_line = res.get("token_line")
                if token_line:
                    corpus.append(token_line)

        logger.info("Built tokenizer corpus with %d movement samples", len(corpus))
        return corpus

    def train(
        self, corpus: List[str], vocab_size: int = 8000
    ) -> PreTrainedTokenizerFast:
        """Train a parser-aware BPE tokenizer.

        Uses Whitespace pre-tokenization so BPE never merges across parser-token
        boundaries.
        """
        if not corpus:
            raise ValueError("Cannot train tokenizer with an empty corpus")

        backend = Tokenizer(BPE(unk_token="[UNK]"))
        backend.pre_tokenizer = Whitespace()

        trainer = BpeTrainer(
            vocab_size=vocab_size,
            special_tokens=self.SPECIAL_TOKENS,
            show_progress=True,
        )
        backend.train_from_iterator(corpus, trainer=trainer)

        self.fast_tokenizer = PreTrainedTokenizerFast(
            tokenizer_object=backend,
            cls_token="[CLS]",
            sep_token="[SEP]",
            pad_token="[PAD]",
            unk_token="[UNK]",
            mask_token="[MASK]",
        )

        return self.fast_tokenizer

    def save(self, path: str | Path) -> Path:
        """Save tokenizer in HuggingFace `PreTrainedTokenizerFast` format."""
        if self.fast_tokenizer is None:
            raise ValueError("Tokenizer has not been trained/loaded yet")

        output_dir = Path(path)
        output_dir.mkdir(parents=True, exist_ok=True)
        self.fast_tokenizer.save_pretrained(str(output_dir))
        return output_dir

    @classmethod
    def load(cls, path: str | Path) -> "LilyPondTokenizer":
        """Load tokenizer from a HuggingFace tokenizer directory."""
        fast_tokenizer = PreTrainedTokenizerFast.from_pretrained(str(path))
        return cls(fast_tokenizer=fast_tokenizer)

    # ------------------------------------------------------------------
    # Encode / Decode for generative (infilling) use
    # ------------------------------------------------------------------

    def encode_lilypond(self, text: str, add_special_tokens: bool = False) -> List[int]:
        """Encode raw LilyPond text to BPE token IDs.

        Converts text through the parser-token intermediate representation
        then BPE-encodes.

        Args:
            text: Raw LilyPond text.
            add_special_tokens: Whether to wrap with [CLS]/[SEP].

        Returns:
            List of integer token IDs.
        """
        if self.fast_tokenizer is None:
            raise ValueError("Tokenizer has not been trained/loaded yet")
        parser_tokens = self._movement_to_parser_tokens(text)
        return self.fast_tokenizer.encode(
            parser_tokens, add_special_tokens=add_special_tokens
        )

    # Patterns that BPE may split with spaces; collapse back to single tokens.
    _VALUE_TOKEN_RE = re.compile(r"(lang|part)\s*:\s*(\S+)")
    # BPE may split backslash commands: "\ key" → "\key"
    _BACKSLASH_CMD_RE = re.compile(r"\\\s+([a-zA-Z])")

    def _ids_to_parser_tokens(self, token_ids: List[int]) -> List[str]:
        """Convert token IDs back to parser-level tokens.

        Special tokens are preserved.  BPE-split value tokens like
        ``lang : english`` are collapsed back to ``lang:english``.
        Backslash commands split by BPE (``\\ key``) are rejoined.
        """
        if self.fast_tokenizer is None:
            raise ValueError("Tokenizer has not been trained/loaded yet")

        raw = self.fast_tokenizer.decode(token_ids, skip_special_tokens=False)
        # Collapse BPE-split value tokens (e.g. "lang : english" → "lang:english")
        raw = self._VALUE_TOKEN_RE.sub(r"\1:\2", raw)
        # Collapse BPE-split backslash commands (e.g. "\ key" → "\key")
        raw = self._BACKSLASH_CMD_RE.sub(r"\\\1", raw)
        return raw.split()

    def decode_to_lilypond(
        self,
        token_ids: List[int],
        include_version: bool = True,
    ) -> str:
        """Decode BPE token IDs back to syntactically valid LilyPond text.

        Args:
            token_ids: List of BPE token IDs.
            include_version: Whether to prepend a ``\\version`` directive.

        Returns:
            Reconstructed LilyPond string.
        """
        tokens = self._ids_to_parser_tokens(token_ids)

        parts: List[str] = []
        if include_version:
            parts.append(f'\\version "{self.DEFAULT_VERSION}"')

        i = 0
        open_braces = 0  # track braces opened by [SCORE]

        while i < len(tokens):
            tok = tokens[i]

            # Skip classification / padding tokens
            if tok in self._SKIP_ON_DECODE:
                i += 1
                continue

            # [LANGUAGE] lang:X  →  \language "X"
            if tok == "[LANGUAGE]":
                if i + 1 < len(tokens) and tokens[i + 1].startswith("lang:"):
                    lang = tokens[i + 1][len("lang:") :]
                    parts.append(f'\\language "{lang}"')
                    i += 2
                else:
                    i += 1
                continue

            # [PART_BEGIN] [PART_NAME] part:X  →  X = {
            if tok == "[PART_BEGIN]":
                name = "voice"
                j = i + 1
                if j < len(tokens) and tokens[j] == "[PART_NAME]":
                    j += 1
                if j < len(tokens) and tokens[j].startswith("part:"):
                    name = tokens[j][len("part:") :]
                    j += 1
                parts.append(f"{name} = {{")
                open_braces += 1
                i = j
                continue

            # [PART_END]  →  }
            if tok == "[PART_END]":
                parts.append("}")
                open_braces = max(0, open_braces - 1)
                i += 1
                continue

            # [SCORE]  →  \score  (the next [SEQ_BEGIN] supplies the {)
            if tok == "[SCORE]":
                parts.append("\\score")
                i += 1
                continue

            # Simple structural mapping
            if tok in self.SPECIAL_TOKEN_TO_LILYPOND:
                ly_text = self.SPECIAL_TOKEN_TO_LILYPOND[tok]
                parts.append(ly_text)
                if tok == "[SEQ_BEGIN]":
                    open_braces += 1
                elif tok == "[SEQ_END]":
                    open_braces = max(0, open_braces - 1)
                i += 1
                continue

            # Music token — emit as-is
            parts.append(tok)
            i += 1

        # Auto-close any unmatched braces
        for _ in range(open_braces):
            parts.append("}")

        return "\n".join(self._format_lilypond_parts(parts))

    def validate_round_trip(self, text: str) -> tuple[bool, str, List[str]]:
        """Encode then decode and validate the result.

        Returns:
            Tuple of (syntax_valid, decoded_text, validation_errors).
        """
        ids = self.encode_lilypond(text)
        decoded = self.decode_to_lilypond(ids)
        is_valid, errors = self.parser.validate_syntax(decoded)
        return is_valid, decoded, errors

    @staticmethod
    def _format_lilypond_parts(parts: List[str]) -> List[str]:
        """Apply basic formatting to a list of LilyPond fragments.

        Groups version/language directives on their own lines and joins
        music tokens with spaces.
        """
        lines: List[str] = []
        music_buf: List[str] = []

        def flush_music():
            if music_buf:
                lines.append(" ".join(music_buf))
                music_buf.clear()

        structural = {
            "<<",
            ">>",
            "{",
            "}",
            "\\score",
            "\\new Staff",
            "\\new Voice",
            "\\new PianoStaff",
            "\\new ChoirStaff",
            "\\\\",
        }

        for part in parts:
            if part.startswith("\\version") or part.startswith("\\language"):
                flush_music()
                lines.append(part)
            elif part.endswith("= {"):
                flush_music()
                lines.append(part)
            elif part in structural:
                flush_music()
                lines.append(part)
            else:
                music_buf.append(part)

        flush_music()
        return lines

    def _iter_movement_files(
        self,
        root: Path,
        notation_mode: str,
        languages: Optional[List[str]] = None,
    ) -> Iterable[Path]:
        if languages:
            normalized = [
                language.strip().lower() for language in languages if language
            ]
            for language in normalized:
                language_dir = root / language
                if not language_dir.exists():
                    raise FileNotFoundError(
                        f"Requested language folder not found: {language_dir}"
                    )
                yield from language_dir.glob("*.ly")
            return

        if (root / "italiano").exists() or (root / "english").exists():
            if notation_mode in {"italiano", "both"}:
                italiano_dir = root / "italiano"
                if notation_mode == "italiano" and not italiano_dir.exists():
                    raise FileNotFoundError(
                        f"Requested notation_mode=italiano but folder not found: {italiano_dir}"
                    )
                if italiano_dir.exists():
                    yield from italiano_dir.glob("*.ly")

            if notation_mode in {"english", "both"}:
                english_dir = root / "english"
                if notation_mode == "english" and not english_dir.exists():
                    raise FileNotFoundError(
                        f"Requested notation_mode=english but folder not found: {english_dir}"
                    )
                if english_dir.exists():
                    yield from english_dir.glob("*.ly")
            return

        yield from root.glob("*.ly")

    def _detect_language_token(self, text: str) -> Optional[str]:
        """Detect the pitch language and return a lang:X value token."""
        lang_match = re.search(r'\\language\s+"([^"]+)"', text)
        if lang_match:
            return lang_match.group(1)
        detected = self.parser.detect_pitch_language(text)
        if detected and detected != "mixed":
            return detected
        return None

    def _movement_to_parser_tokens(self, text: str) -> str:
        prefix: List[str] = []
        lang = self._detect_language_token(text)
        if lang:
            prefix.extend(["[LANGUAGE]", f"lang:{lang}"])

        # Strip the \language directive so it doesn't appear in music tokens
        text = re.sub(r'\\language\s+"[^"]*"', "", text)

        parts = self._extract_part_variables(text)
        if parts:
            tokens: List[str] = [*prefix]
            for name, content in parts:
                structural_tokens = self._extract_structural_tokens(content)
                music_tokens = self.parser._tokenize_music(content)
                if not music_tokens:
                    parsed = self.parser.parse_content(content)
                    music_tokens = [element.content for element in parsed]
                if not music_tokens:
                    continue

                tokens.extend(
                    [
                        "[PART_BEGIN]",
                        "[PART_NAME]",
                        f"part:{name.lower()}",
                        *structural_tokens,
                        *music_tokens,
                        "[PART_END]",
                    ]
                )
            return " ".join(tokens).strip()

        structural_tokens = self._extract_structural_tokens(text)
        tokens = self.parser._tokenize_music(text)
        if not tokens:
            parsed = self.parser.parse_content(text)
            tokens = [element.content for element in parsed]
        return " ".join([*prefix, *structural_tokens, *tokens]).strip()

    _NEW_CONTEXT_MAP = {
        "ChoirStaff": "[NEW_CHOIRSTAFF]",
        "Staff": "[NEW_STAFF]",
        "PianoStaff": "[NEW_PIANOSTAFF]",
        "Voice": "[NEW_VOICE]",
    }

    def _extract_structural_tokens(self, text: str) -> List[str]:
        """Extract score-structure markers using python-ly lexical tokens."""
        document = ly.document.Document(text)
        state = ly.lex.state("lilypond")

        markers: List[str] = []
        in_simultaneous_depth = 0
        expect_context_name = False

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
                continue

            # Detect \new Staff, \new Voice, etc.
            if token_text == "\\new":
                expect_context_name = True
                continue

            if expect_context_name:
                expect_context_name = False
                if isinstance(token, ly.lex.Space):
                    expect_context_name = True
                    continue
                context_token = self._NEW_CONTEXT_MAP.get(token_text)
                if context_token:
                    markers.append(context_token)

        return markers

    def _extract_part_variables(self, text: str) -> List[tuple[str, str]]:
        parts: List[tuple[str, str]] = []
        pattern = r"([A-Za-z][\w-]*)\s*=\s*\{"
        cursor = 0

        while True:
            match = re.search(pattern, text[cursor:])
            if not match:
                break

            start = cursor + match.start()
            name = match.group(1)
            open_brace = text.find("{", start)
            close_brace = self._find_matching_brace(text, open_brace)
            body = text[open_brace + 1 : close_brace - 1].strip()
            if body:
                parts.append((name, body))
            cursor = close_brace

        return parts

    @staticmethod
    def _find_matching_brace(text: str, open_idx: int) -> int:
        depth = 1
        for i in range(open_idx + 1, len(text)):
            if text[i] == "{":
                depth += 1
            elif text[i] == "}":
                depth -= 1
                if depth == 0:
                    return i + 1
        return len(text)
