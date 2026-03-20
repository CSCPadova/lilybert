"""Byte-level BPE tokenizer for raw LilyPond text.

Unlike :class:`LilyPondTokenizer`, this tokenizer operates directly on raw
LilyPond source files without any parser or musical-token conversion.
"""

from __future__ import annotations

import json
import logging
import os
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path
from typing import Iterable, List, Optional

from tokenizers import Tokenizer, decoders, pre_tokenizers, trainers
from tokenizers.models import BPE
from transformers import PreTrainedTokenizerFast

logger = logging.getLogger(__name__)

TOKENIZER_META_FILENAME = "tokenizer_meta.json"


def _read_file_worker(path: str) -> dict:
    """Process-safe worker that reads a .ly file and returns its text."""
    try:
        text = Path(path).read_text(encoding="utf-8", errors="ignore")
        return {"ok": True, "text": text}
    except Exception as exc:  # pragma: no cover
        return {"ok": False, "error": str(exc), "path": path}


class BBPETokenizer:
    """Byte-level BPE tokenizer for raw LilyPond files.

    Trains a standard byte-level BPE (like GPT-2) directly on LilyPond
    source text.  The resulting :class:`PreTrainedTokenizerFast` can be
    used interchangeably with the one produced by
    :class:`LilyPondTokenizer`.
    """

    SPECIAL_TOKENS = [
        "[CLS]",
        "[SEP]",
        "[PAD]",
        "[UNK]",
        "[MASK]",
    ]

    def __init__(
        self,
        fast_tokenizer: Optional[PreTrainedTokenizerFast] = None,
    ):
        self.fast_tokenizer = fast_tokenizer

    def build_corpus(
        self,
        processed_dir: str | Path,
        num_workers: int = 0,
    ) -> List[str]:
        """Read raw ``.ly`` file contents from *processed_dir*.

        Returns a list of raw text strings (one per file), suitable for
        passing to :meth:`train`.
        """
        from tqdm import tqdm

        root = Path(processed_dir)
        if not root.exists():
            raise FileNotFoundError(f"Directory not found: {root}")

        files = sorted(self._iter_ly_files(root))
        max_workers = num_workers if num_workers > 0 else (os.cpu_count() or 2)
        corpus: List[str] = []

        with ProcessPoolExecutor(max_workers=max_workers) as exe:
            futures = {
                exe.submit(_read_file_worker, str(p)): p for p in files
            }
            for fut in tqdm(
                as_completed(futures),
                total=len(futures),
                desc="build_corpus (bbpe)",
            ):
                res = fut.result()
                if not res.get("ok"):
                    logger.warning(
                        "Failed reading %s: %s",
                        res.get("path"),
                        res.get("error"),
                    )
                    continue
                text = res.get("text", "")
                if text.strip():
                    corpus.append(text)

        logger.info("Built BBPE corpus with %d files", len(corpus))
        return corpus

    def train(
        self,
        corpus: List[str],
        vocab_size: int = 8000,
        min_frequency: int = 2,
    ) -> PreTrainedTokenizerFast:
        """Train a byte-level BPE tokenizer on raw text.

        Args:
            corpus: List of raw LilyPond text strings.
            vocab_size: Target vocabulary size.
            min_frequency: Minimum pair frequency for a merge.

        Returns:
            A :class:`PreTrainedTokenizerFast` wrapping the trained tokenizer.
        """
        if not corpus:
            raise ValueError("Cannot train tokenizer with an empty corpus")

        backend = Tokenizer(BPE(unk_token="[UNK]"))
        backend.pre_tokenizer = pre_tokenizers.ByteLevel(add_prefix_space=False)
        backend.decoder = decoders.ByteLevel()

        trainer = trainers.BpeTrainer(
            vocab_size=vocab_size,
            min_frequency=min_frequency,
            special_tokens=self.SPECIAL_TOKENS,
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
        """Save tokenizer (HF files + metadata)."""
        if self.fast_tokenizer is None:
            raise ValueError("Tokenizer has not been trained/loaded yet")

        output_dir = Path(path)
        output_dir.mkdir(parents=True, exist_ok=True)
        self.fast_tokenizer.save_pretrained(str(output_dir))

        meta_path = output_dir / TOKENIZER_META_FILENAME
        meta_path.write_text(
            json.dumps({"type": "bbpe"}, indent=2),
            encoding="utf-8",
        )
        return output_dir

    @classmethod
    def load(cls, path: str | Path) -> "BBPETokenizer":
        """Load a BBPE tokenizer from a directory."""
        p = Path(path)
        fast_tokenizer = PreTrainedTokenizerFast.from_pretrained(str(p))
        return cls(fast_tokenizer=fast_tokenizer)

    @staticmethod
    def _iter_ly_files(root: Path) -> Iterable[Path]:
        yield from root.glob("*.ly")
