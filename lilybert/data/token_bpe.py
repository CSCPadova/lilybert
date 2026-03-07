"""Token-level BPE that operates on whole musical token sequences.

Unlike character-level BPE, this implementation treats each musical token
(NOTE_C, DUR_4, etc.) as an atomic unit. Merges combine adjacent tokens
using ``+`` as a separator (e.g., ``NOTE_C+DUR_4``).
"""

from __future__ import annotations

import json
from collections import Counter
from pathlib import Path
from typing import AbstractSet, List, Optional, Sequence

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

        Args:
            sequences: Token sequences to learn from.
            num_merges: Maximum number of merges to learn.
            min_frequency: Minimum pair frequency to consider.
            max_vocab: If >0, stop when total vocab reaches this size.
            base_vocab_size: Current base vocab size (used with *max_vocab*).
            frozen_tokens: Tokens that must never participate in a merge.
        """
        frozen = frozen_tokens or set()
        # Work on mutable copies
        seqs = [list(s) for s in sequences]
        self.merges = []

        def _contains_frozen(tok: str) -> bool:
            """Check if *tok* (possibly merged) contains a frozen token."""
            for part in tok.split(BPE_SEPARATOR):
                if part in frozen:
                    return True
            return False

        for _ in range(num_merges):
            # Count adjacent pairs, skipping frozen tokens
            pair_counts: Counter[tuple[str, str]] = Counter()
            for seq in seqs:
                for i in range(len(seq) - 1):
                    if _contains_frozen(seq[i]) or _contains_frozen(seq[i + 1]):
                        continue
                    pair_counts[(seq[i], seq[i + 1])] += 1

            if not pair_counts:
                break

            best_pair, best_count = pair_counts.most_common(1)[0]
            if best_count < max(min_frequency, 1):
                break

            merged = best_pair[0] + BPE_SEPARATOR + best_pair[1]
            self.merges.append(best_pair)

            # Apply merge to all sequences
            seqs = [_apply_single_merge(s, best_pair, merged) for s in seqs]

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
