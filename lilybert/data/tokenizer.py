"""Parser-aware BPE tokenizer utilities for lilyBERT."""

from __future__ import annotations

import logging
from pathlib import Path
from typing import Iterable, List, Optional

from tokenizers import Tokenizer
from tokenizers.models import BPE
from tokenizers.pre_tokenizers import Whitespace
from tokenizers.trainers import BpeTrainer
from transformers import PreTrainedTokenizerFast

from .lilypond_parser import LilyPondParser

logger = logging.getLogger(__name__)


class LilyPondTokenizer:
    """Parser-aware BPE tokenizer for movement-level LilyPond files."""

    SPECIAL_TOKENS = ["[CLS]", "[SEP]", "[PAD]", "[UNK]", "[MASK]"]

    def __init__(
        self,
        parser: Optional[LilyPondParser] = None,
        fast_tokenizer: Optional[PreTrainedTokenizerFast] = None,
    ):
        self.parser = parser or LilyPondParser()
        self.fast_tokenizer = fast_tokenizer

    def build_corpus(self, processed_dir: str | Path) -> List[str]:
        """Build parser-token corpus strings from cleaned movement files.

        Args:
            processed_dir: Root processed directory (typically `data/processed`).

        Returns:
            List of space-separated parser token strings (one per movement file).
        """
        root = Path(processed_dir)
        if not root.exists():
            raise FileNotFoundError(f"Processed directory not found: {root}")

        movement_files = sorted(self._iter_movement_files(root))
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

    def _iter_movement_files(self, root: Path) -> Iterable[Path]:
        if (root / "italiano").exists() or (root / "english").exists():
            yield from (
                (root / "italiano").glob("*.ly") if (root / "italiano").exists() else []
            )
            yield from (
                (root / "english").glob("*.ly") if (root / "english").exists() else []
            )
            return

        yield from root.glob("*.ly")

    def _movement_to_parser_tokens(self, text: str) -> str:
        tokens = self.parser._tokenize_music(text)
        if not tokens:
            parsed = self.parser.parse_content(text)
            tokens = [element.content for element in parsed]
        return " ".join(tokens).strip()
