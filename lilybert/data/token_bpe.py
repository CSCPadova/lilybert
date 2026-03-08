"""Token-level BPE that operates on whole musical token sequences.

Unlike character-level BPE, this implementation treats each musical token
(NOTE_C, DUR_4, etc.) as an atomic unit. Merges combine adjacent tokens
using ``+`` as a separator (e.g., ``NOTE_C+DUR_4``).
"""

from __future__ import annotations

import heapq
import json
import logging
from collections import Counter, defaultdict
from pathlib import Path
from typing import AbstractSet, List, Optional, Sequence

from tqdm import tqdm

logger = logging.getLogger(__name__)

BPE_SEPARATOR = "+"


def _apply_single_merge(
    seq: List[str], pair: tuple[str, str], merged: str
) -> List[str]:
    """Replace all occurrences of *pair* in *seq* with *merged*."""
    result: List[str] = []
    i = 0
    while i < len(seq):
        if i < len(seq) - 1 and seq[i] == pair[0] and seq[i + 1] == pair[1]:
            result.append(merged)
            i += 2
        else:
            result.append(seq[i])
            i += 1
    return result


class TokenBPE:
    """Byte-pair encoding at the token level.

    Learns frequent adjacent-token pairs from sequences and merges them
    into compound tokens joined by :data:`BPE_SEPARATOR`.
    """

    def __init__(self) -> None:
        self.merges: List[tuple[str, str]] = []

    def learn(
        self,
        sequences: Sequence[List[str]],
        num_merges: int,
        min_frequency: int = 0,
        max_vocab: int = 0,
        base_vocab_size: int = 0,
        frozen_tokens: Optional[AbstractSet[str]] = None,
    ) -> None:
        """Learn BPE merges from *sequences*.

        Uses a word-frequency representation: identical sequences are
        collapsed into a single entry with a count, so pair counting
        and merge application scale with unique word types rather than
        total corpus size.  A max-heap accelerates best-pair lookup to
        amortised O(log n) per iteration.

        Args:
            sequences: Token sequences to learn from.
            num_merges: Maximum number of merges to learn.
            min_frequency: Minimum pair frequency to consider.
            max_vocab: If >0, stop when total vocab reaches this size.
            base_vocab_size: Current base vocab size (used with *max_vocab*).
            frozen_tokens: Tokens that must never participate in a merge.
        """
        frozen = frozen_tokens or set()
        self.merges = []

        frozen_cache: dict[str, bool] = {}

        def _is_frozen(tok: str) -> bool:
            cached = frozen_cache.get(tok)
            if cached is not None:
                return cached
            result = any(part in frozen for part in tok.split(BPE_SEPARATOR))
            frozen_cache[tok] = result
            return result

        # Collapse identical sequences into (tuple, count) pairs.
        word_freq: Counter[tuple[str, ...]] = Counter()
        for seq in sequences:
            word_freq[tuple(seq)] += 1

        # Build initial pair counts from word frequencies.
        pair_counts: dict[tuple[str, str], int] = defaultdict(int)
        # Index: pair -> set of words containing that pair
        pair_to_words: dict[tuple[str, str], set[tuple[str, ...]]] = defaultdict(set)

        for word, freq in word_freq.items():
            for i in range(len(word) - 1):
                if _is_frozen(word[i]) or _is_frozen(word[i + 1]):
                    continue
                pair = (word[i], word[i + 1])
                pair_counts[pair] += freq
                pair_to_words[pair].add(word)

        total_tokens = sum(len(w) * c for w, c in word_freq.items())
        unique_words = len(word_freq)
        logger.info(
            "BPE training: %d total tokens, %d unique word types, up to %d merges",
            total_tokens,
            unique_words,
            num_merges,
        )

        # Max-heap of (-count, pair).  Stale entries are detected by
        # comparing the heap count against the live pair_counts dict.
        heap: list[tuple[int, tuple[str, str]]] = [
            (-count, pair) for pair, count in pair_counts.items()
        ]
        heapq.heapify(heap)

        def _heap_push(pair: tuple[str, str]) -> None:
            count = pair_counts.get(pair, 0)
            if count > 0:
                heapq.heappush(heap, (-count, pair))

        min_freq = max(min_frequency, 1)

        for step in tqdm(range(num_merges), desc="BPE merges"):
            # Pop stale entries until we find one whose count matches.
            bp: tuple[str, str] | None = None
            best_count = 0
            while heap:
                neg_count, candidate = heap[0]
                live = pair_counts.get(candidate, 0)
                if live <= 0:
                    heapq.heappop(heap)
                    continue
                if live != -neg_count:
                    # Stale: re-push with correct count, pop this entry.
                    heapq.heappop(heap)
                    heapq.heappush(heap, (-live, candidate))
                    continue
                # Valid top entry.
                bp = candidate
                best_count = live
                heapq.heappop(heap)
                break

            if bp is None or best_count < min_freq:
                break

            merged = bp[0] + BPE_SEPARATOR + bp[1]
            self.merges.append(bp)

            # Only process words that actually contain this pair.
            affected_words = pair_to_words.pop(bp, set())
            pair_counts.pop(bp, None)

            # Track which pairs had their counts changed so we can
            # re-push them into the heap in bulk afterwards.
            dirty_pairs: set[tuple[str, str]] = set()

            for word in affected_words:
                freq = word_freq.get(word, 0)
                if freq == 0:
                    continue

                new_word = tuple(_apply_single_merge(list(word), bp, merged))
                if new_word == word:
                    continue

                # Subtract old pair counts — only pairs that touch a
                # merge site change.  Find merge positions in old word.
                wlen = len(word)
                i = 0
                while i < wlen - 1:
                    if word[i] == bp[0] and word[i + 1] == bp[1]:
                        # Pair at (i-1, i) if it exists and isn't frozen
                        if i > 0 and not _is_frozen(word[i - 1]):
                            left_pair = (word[i - 1], word[i])
                            pair_counts[left_pair] -= freq
                            if pair_counts[left_pair] <= 0:
                                pair_counts.pop(left_pair, None)
                            s = pair_to_words.get(left_pair)
                            if s:
                                s.discard(word)
                                if not s:
                                    del pair_to_words[left_pair]
                            dirty_pairs.add(left_pair)
                        # Pair at (i+1, i+2) if it exists and isn't frozen
                        if i + 2 < wlen and not _is_frozen(word[i + 2]):
                            right_pair = (word[i + 1], word[i + 2])
                            pair_counts[right_pair] -= freq
                            if pair_counts[right_pair] <= 0:
                                pair_counts.pop(right_pair, None)
                            s = pair_to_words.get(right_pair)
                            if s:
                                s.discard(word)
                                if not s:
                                    del pair_to_words[right_pair]
                            dirty_pairs.add(right_pair)
                        i += 2  # skip past the merged pair
                    else:
                        i += 1

                # Update word_freq.
                del word_freq[word]
                word_freq[new_word] += freq

                # Add new pair counts — only pairs adjacent to merged
                # tokens in new_word.
                nlen = len(new_word)
                for j in range(nlen):
                    if new_word[j] != merged:
                        continue
                    # Left neighbour
                    if j > 0 and not _is_frozen(new_word[j - 1]):
                        lp = (new_word[j - 1], new_word[j])
                        pair_counts[lp] += freq
                        pair_to_words[lp].add(new_word)
                        dirty_pairs.add(lp)
                    # Right neighbour
                    if j + 1 < nlen and not _is_frozen(new_word[j + 1]):
                        rp = (new_word[j], new_word[j + 1])
                        pair_counts[rp] += freq
                        pair_to_words[rp].add(new_word)
                        dirty_pairs.add(rp)

            # Batch re-push dirty pairs into the heap.
            for dp in dirty_pairs:
                _heap_push(dp)

            if max_vocab > 0 and (base_vocab_size + len(self.merges)) >= max_vocab:
                break

    def apply(self, sequence: List[str]) -> List[str]:
        """Apply learned merges to a token sequence."""
        result = list(sequence)
        for pair in self.merges:
            merged = pair[0] + BPE_SEPARATOR + pair[1]
            result = _apply_single_merge(result, pair, merged)
        return result

    def save(self, path: str | Path) -> None:
        """Save merge rules to a JSON file."""
        data = {"merges": [list(p) for p in self.merges]}
        Path(path).write_text(json.dumps(data, indent=2), encoding="utf-8")

    @classmethod
    def load(cls, path: str | Path) -> "TokenBPE":
        """Load merge rules from a JSON file."""
        data = json.loads(Path(path).read_text(encoding="utf-8"))
        bpe = cls()
        bpe.merges = [tuple(p) for p in data["merges"]]
        return bpe
