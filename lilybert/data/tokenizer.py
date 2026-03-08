"""Parser-aware BPE tokenizer utilities for lilyBERT.

Pipeline: LilyPond text -> python-ly lexer -> MusicalLexer -> BPE
"""

from __future__ import annotations

import logging
import os
import re
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path
from typing import Iterable, List, Optional

from tokenizers import AddedToken, Tokenizer
from tokenizers.models import WordLevel
from tokenizers.pre_tokenizers import WhitespaceSplit
from transformers import PreTrainedTokenizerFast

from .lexer import LexerConfig, MusicalLexer
from .musical_tokens import base_vocabulary, ly_tokens_to_musical, musical_to_ly_tokens
from .parser import LilyPondParser
from .token_bpe import BPE_SEPARATOR, TokenBPE

logger = logging.getLogger(__name__)

# ---------------------------------------------------------------------------
# Number normalisation helpers
# ---------------------------------------------------------------------------
_DECIMAL_RE = re.compile(r"\b\d+\.\d+\b")
_INTEGER_RE = re.compile(r"\b\d+\b")


def normalize_numbers(text: str) -> str:
    """Replace bare numeric literals with ``<INT>`` / ``<DEC>`` placeholders.

    Decimals are replaced first so that the integer pattern does not
    partially match the integer part of a decimal.
    """
    text = _DECIMAL_RE.sub("<DEC>", text)
    text = _INTEGER_RE.sub("<INT>", text)
    return text


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
    """Parser-aware BPE tokenizer for movement-level LilyPond files.

    Always uses :class:`MusicalLexer` for tokenization.  The lexer emits
    python-ly token strings directly, which become whitespace-delimited
    words for BPE processing.
    """

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

    PLACEHOLDER_TOKENS = ["<INT>", "<DEC>"]

    _SKIP_ON_DECODE = {"[CLS]", "[SEP]", "[PAD]", "[MASK]", "[UNK]"}

    DEFAULT_VERSION = "2.24.0"

    def __init__(
        self,
        parser: Optional[LilyPondParser] = None,
        fast_tokenizer: Optional[PreTrainedTokenizerFast] = None,
        lexer_config: Optional[LexerConfig] = None,
        token_bpe: Optional[TokenBPE] = None,
    ):
        self.parser = parser or LilyPondParser()
        self.fast_tokenizer = fast_tokenizer
        self.lexer = MusicalLexer(lexer_config or LexerConfig())
        self._token_bpe: Optional[TokenBPE] = token_bpe

    def build_corpus(
        self,
        processed_dir: str | Path,
        num_workers: int = 0,
    ) -> List[str]:
        """Build parser-token corpus strings from cleaned movement files.

        Args:
            processed_dir: Root processed directory (typically `data/processed`).
            num_workers: Number of parallel workers (0 = auto).

        Returns:
            List of space-separated parser token strings (one per movement file).
        """
        from tqdm import tqdm

        root = Path(processed_dir)
        if not root.exists():
            raise FileNotFoundError(f"Processed directory not found: {root}")

        movement_files = sorted(self._iter_movement_files(root))

        max_workers = num_workers if num_workers > 0 else (os.cpu_count() or 2)
        corpus: List[str] = []

        with ProcessPoolExecutor(max_workers=max_workers) as exe:
            futures = {
                exe.submit(_tokenize_file_worker, str(p)): p for p in movement_files
            }
            for fut in tqdm(
                as_completed(futures),
                total=len(futures),
                desc="build_corpus",
            ):
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
        self,
        corpus: List[str],
        vocab_size: int = 8000,
        min_frequency: int = 0,
        number_placeholders: bool = False,
    ) -> PreTrainedTokenizerFast:
        """Train a token-level BPE tokenizer.

        Uses :class:`TokenBPE` to learn merges on whole musical tokens,
        then wraps the resulting vocabulary in a HuggingFace
        ``PreTrainedTokenizerFast`` (WordLevel model) for pipeline
        compatibility.

        Args:
            corpus: List of space-separated parser token strings.
            vocab_size: Target vocabulary size (base + merges).
            min_frequency: Minimum pair frequency for a merge.
            number_placeholders: When *True*, replace bare integer and
                decimal literals in the corpus with ``<INT>`` / ``<DEC>``
                placeholder tokens before training.
        """
        if not corpus:
            raise ValueError("Cannot train tokenizer with an empty corpus")

        if number_placeholders:
            corpus = [normalize_numbers(line) for line in corpus]

        # 1. Parse corpus into token sequences
        sequences = [line.split() for line in corpus]

        # 2. Build base vocab: special + musical base + corpus tokens
        base_tokens: List[str] = list(self.SPECIAL_TOKENS)
        musical_vocab = base_vocabulary()
        seen = set(base_tokens)
        for t in musical_vocab:
            if t not in seen:
                base_tokens.append(t)
                seen.add(t)
        if number_placeholders:
            for t in self.PLACEHOLDER_TOKENS:
                if t not in seen:
                    base_tokens.append(t)
                    seen.add(t)
        # Add any corpus tokens not already in base (fractions, part:names, etc.)
        all_corpus_tokens: set[str] = set()
        for seq in sequences:
            all_corpus_tokens.update(seq)
        for t in sorted(all_corpus_tokens):
            if t not in seen:
                base_tokens.append(t)
                seen.add(t)

        base_vocab_size = len(base_tokens)

        # 3. Train token-level BPE
        # Freeze structural tokens so they never participate in merges
        frozen = set(self.SPECIAL_TOKENS) | {
            t for t in all_corpus_tokens if t.startswith("part:")
        }
        num_merges = max(0, vocab_size - base_vocab_size)
        bpe = TokenBPE()
        bpe.learn(
            sequences,
            num_merges=num_merges,
            min_frequency=min_frequency,
            max_vocab=vocab_size,
            base_vocab_size=base_vocab_size,
            frozen_tokens=frozen,
        )
        self._token_bpe = bpe

        # 4. Build final vocab: base + merged tokens
        vocab = {t: i for i, t in enumerate(base_tokens)}
        for pair in bpe.merges:
            merged = pair[0] + BPE_SEPARATOR + pair[1]
            if merged not in vocab:
                vocab[merged] = len(vocab)

        # 5. Build HF Tokenizer (WordLevel — no subword splitting)
        backend = Tokenizer(WordLevel(vocab=vocab, unk_token="[UNK]"))
        backend.pre_tokenizer = WhitespaceSplit()

        for t in self.SPECIAL_TOKENS:
            backend.add_special_tokens([AddedToken(t, special=True)])

        self.fast_tokenizer = PreTrainedTokenizerFast(
            tokenizer_object=backend,
            cls_token="[CLS]",
            sep_token="[SEP]",
            pad_token="[PAD]",
            unk_token="[UNK]",
            mask_token="[MASK]",
        )

        return self.fast_tokenizer

    _TOKEN_BPE_FILENAME = "token_bpe.json"

    def save(self, path: str | Path) -> Path:
        """Save tokenizer (HF files + token BPE merges)."""
        if self.fast_tokenizer is None:
            raise ValueError("Tokenizer has not been trained/loaded yet")

        output_dir = Path(path)
        output_dir.mkdir(parents=True, exist_ok=True)
        self.fast_tokenizer.save_pretrained(str(output_dir))
        if self._token_bpe is not None:
            self._token_bpe.save(output_dir / self._TOKEN_BPE_FILENAME)
        return output_dir

    @classmethod
    def load(cls, path: str | Path) -> "LilyPondTokenizer":
        """Load tokenizer from a directory."""
        p = Path(path)
        fast_tokenizer = PreTrainedTokenizerFast.from_pretrained(str(p))
        bpe_path = p / cls._TOKEN_BPE_FILENAME
        token_bpe = TokenBPE.load(bpe_path) if bpe_path.exists() else None
        return cls(fast_tokenizer=fast_tokenizer, token_bpe=token_bpe)

    # ------------------------------------------------------------------
    # Encode / Decode for generative (infilling) use
    # ------------------------------------------------------------------

    def encode_lilypond(self, text: str, add_special_tokens: bool = False) -> List[int]:
        """Encode raw LilyPond text to BPE token IDs.

        Converts text through the lexer intermediate representation,
        applies token-level BPE merges, then encodes via HF tokenizer.

        Args:
            text: Raw LilyPond text.
            add_special_tokens: Whether to wrap with [CLS]/[SEP].

        Returns:
            List of integer token IDs.
        """
        if self.fast_tokenizer is None:
            raise ValueError("Tokenizer has not been trained/loaded yet")
        parser_tokens = self._movement_to_parser_tokens(text)
        token_list = parser_tokens.split()
        if self._token_bpe is not None:
            token_list = self._token_bpe.apply(token_list)
        merged_text = " ".join(token_list)
        return self.fast_tokenizer.encode(
            merged_text, add_special_tokens=add_special_tokens
        )

    def _ids_to_parser_tokens(self, token_ids: List[int]) -> List[str]:
        """Convert token IDs back to parser-level tokens.

        Decodes IDs to musical token strings, expands any ``+``-merged
        tokens, then reverse-maps to LilyPond syntax.
        """
        if self.fast_tokenizer is None:
            raise ValueError("Tokenizer has not been trained/loaded yet")

        raw = self.fast_tokenizer.decode(token_ids, skip_special_tokens=False)
        tokens = raw.split()
        # Expand merged tokens: "NOTE_C+DUR_4" -> ["NOTE_C", "DUR_4"]
        expanded: List[str] = []
        for t in tokens:
            if BPE_SEPARATOR in t and t not in self._SKIP_ON_DECODE:
                expanded.extend(t.split(BPE_SEPARATOR))
            else:
                expanded.append(t)
        return musical_to_ly_tokens(expanded)

    def decode_to_lilypond(
        self,
        token_ids: List[int],
        include_version: bool = True,
    ) -> str:
        """Decode BPE token IDs back to syntactically valid LilyPond text.

        Since the lexer emits raw python-ly token strings, decoding
        simply joins them with spaces (after handling structural markers
        like ``[PART_BEGIN]``/``[PART_END]``).

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
        open_braces = 0

        while i < len(tokens):
            tok = tokens[i]

            # Skip classification / padding tokens
            if tok in self._SKIP_ON_DECODE:
                i += 1
                continue

            # [PART_BEGIN] [PART_NAME] part:X  ->  X = {
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

            # [PART_END]  ->  }
            if tok == "[PART_END]":
                parts.append("}")
                open_braces = max(0, open_braces - 1)
                i += 1
                continue

            # Music token — emit as-is (already valid LilyPond)
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
            "\\new",
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
    ) -> Iterable[Path]:
        """Yield .ly files from the data directory."""
        yield from root.glob("*.ly")

    # Regex for \version "..." lines
    _VERSION_RE = re.compile(r'\\version\s+"[^"]*"')
    # \language "..." directives
    _LANGUAGE_RE = re.compile(r'\\language\s+"[^"]*"')
    # Named blocks to strip entirely: \header{}, \paper{}, \layout{}, \midi{}
    _BLOCK_CMD_RE = re.compile(r"\\(header|paper|layout|midi)\s*\{")

    def _strip_envelope(self, text: str) -> str:
        """Remove envelope content from raw LilyPond text.

        Strips: ``\\version``, ``\\language``, ``\\header{}``,
        ``\\paper{}``, ``\\layout{}``, ``\\midi{}`` blocks.

        The :class:`MusicalLexer` handles filtering of all other
        non-musical content (overrides, tweaks, markup, scheme, comments,
        etc.).
        """
        # 1. Comments (use the parser's method)
        text = self.parser._remove_comments(text)

        # 2. \version
        text = self._VERSION_RE.sub("", text)

        # 3. \language
        text = self._LANGUAGE_RE.sub("", text)

        # 4. Named blocks: \header{}, \paper{}, \layout{}, \midi{}
        for m in reversed(list(self._BLOCK_CMD_RE.finditer(text))):
            open_idx = m.end() - 1  # position of the opening {
            close_idx = LilyPondParser.find_matching_brace(text, open_idx)
            text = text[: m.start()] + text[close_idx:]

        return text

    def _movement_to_parser_tokens(self, text: str) -> str:
        """Convert a movement's LilyPond text to a space-separated token string.

        Uses :class:`MusicalLexer` for all tokenization.  The lexer emits
        python-ly token strings and handles structural elements
        (voices, simultaneous music) internally.
        """
        # Strip envelope (version, language, header/paper/layout/midi)
        text = self._strip_envelope(text)

        # Learn user macros from the full text
        macro_map = MusicalLexer.extract_macros(text)

        parts = self._extract_part_variables(text)
        if parts:
            tokens: List[str] = []
            for name, content in parts:
                raw_tokens = self.lexer.linearize(content, macro_map=macro_map)
                if not raw_tokens:
                    continue
                musical = ly_tokens_to_musical(raw_tokens)
                tokens.extend(
                    [
                        "[PART_BEGIN]",
                        "[PART_NAME]",
                        f"part:{name.lower()}",
                        *musical,
                        "[PART_END]",
                    ]
                )
            return " ".join(tokens).strip()

        # No part variables — tokenize the full text
        raw_tokens = self.lexer.linearize(text, macro_map=macro_map)
        musical = ly_tokens_to_musical(raw_tokens)
        return " ".join(musical).strip()

    def _extract_part_variables(self, text: str) -> List[tuple[str, str]]:
        parts: List[tuple[str, str]] = []
        # Match: Name = { ... } or Name = \relative pitch { ... }
        # The optional LilyPond mode command is consumed but not included
        # in the body — only the brace-enclosed content is extracted.
        pattern = (
            r"([A-Za-z][\w-]*)\s*=\s*"
            r"(?:\\(?:relative|absolute|fixed|transpose)\b[^{]*)?"
            r"\{"
        )
        cursor = 0

        while True:
            match = re.search(pattern, text[cursor:])
            if not match:
                break

            start = cursor + match.start()
            name = match.group(1)
            open_brace = text.find("{", start)
            close_brace = LilyPondParser.find_matching_brace(text, open_brace)
            body = text[open_brace + 1 : close_brace - 1].strip()
            if body:
                parts.append((name, body))
            cursor = close_brace

        return parts
