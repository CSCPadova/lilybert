"""Parser-aware BPE tokenizer utilities for lilyBERT."""

from __future__ import annotations

import logging
import re
from pathlib import Path
from typing import Iterable, List, Optional

from tokenizers import Tokenizer
from tokenizers.models import BPE
from tokenizers.pre_tokenizers import Whitespace
from tokenizers.trainers import BpeTrainer
from transformers import PreTrainedTokenizerFast

from .parser import LilyPondParser

logger = logging.getLogger(__name__)


class LilyPondTokenizer:
    """Parser-aware BPE tokenizer for movement-level LilyPond files."""

    VALID_NOTATION_MODES = {"english", "italiano", "both"}

    SPECIAL_TOKENS = [
        "[CLS]",
        "[SEP]",
        "[PAD]",
        "[UNK]",
        "[MASK]",
        "[PART_BEGIN]",
        "[PART_NAME]",
        "[PART_END]",
    ]

    def __init__(
        self,
        parser: Optional[LilyPondParser] = None,
        fast_tokenizer: Optional[PreTrainedTokenizerFast] = None,
    ):
        self.parser = parser or LilyPondParser()
        self.fast_tokenizer = fast_tokenizer

    def build_corpus(
        self, processed_dir: str | Path, notation_mode: str = "both"
    ) -> List[str]:
        """Build parser-token corpus strings from cleaned movement files.

        Args:
            processed_dir: Root processed directory (typically `data/processed`).
            notation_mode: Which notation folders to include: `english`,
                `italiano`, or `both`.

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

        movement_files = sorted(self._iter_movement_files(root, notation_mode))
        corpus: List[str] = []

        for file_path in movement_files:
            text = file_path.read_text(encoding="utf-8", errors="ignore")
            token_line = self._movement_to_parser_tokens(text)
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

    def _iter_movement_files(self, root: Path, notation_mode: str) -> Iterable[Path]:
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

    def _movement_to_parser_tokens(self, text: str) -> str:
        parts = self._extract_part_variables(text)
        if parts:
            tokens: List[str] = []
            for name, content in parts:
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
                        *music_tokens,
                        "[PART_END]",
                    ]
                )
            return " ".join(tokens).strip()

        tokens = self.parser._tokenize_music(text)
        if not tokens:
            parsed = self.parser.parse_content(text)
            tokens = [element.content for element in parsed]
        return " ".join(tokens).strip()

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
