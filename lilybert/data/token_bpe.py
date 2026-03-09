"""Token-level BPE that operates on whole musical token sequences.

Unlike character-level BPE, this implementation treats each musical token
(NOTE_C, DUR_4, etc.) as an atomic unit. Merges combine adjacent tokens
using ``+`` as a separator (e.g., ``NOTE_C+DUR_4``).
"""

from __future__ import annotations

import heapq
import json
import logging
from collections import defaultdict
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

        Internally encodes every token string to an integer ID so that
        pair counting, merge application, and index bookkeeping operate
        on cheap ints instead of variable-length Python strings/tuples.
        A max-heap accelerates best-pair lookup to amortised O(log n).

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

        # -- Encode strings to integer IDs for speed -----------------------
        str_to_id: dict[str, int] = {}
        id_to_str: list[str] = []

        def _intern(s: str) -> int:
            sid = str_to_id.get(s)
            if sid is not None:
                return sid
            sid = len(id_to_str)
            str_to_id[s] = sid
            id_to_str.append(s)
            return sid

        # Pre-compute frozen status per ID (cached).
        frozen_ids: set[int] = set()

        def _mark_frozen(sid: int) -> None:
            s = id_to_str[sid]
            if any(part in frozen for part in s.split(BPE_SEPARATOR)):
                frozen_ids.add(sid)

        # Build flat list of (sequence-as-list-of-ids, frequency=1).
        # Each sequence is independent (no word-freq collapsing — music
        # sequences are almost all unique so collapsing wastes time hashing).
        seqs: list[list[int]] = []
        for seq in tqdm(sequences, desc="BPE encoding"):
            encoded = [_intern(t) for t in seq]
            seqs.append(encoded)

        # Mark frozen IDs.
        for sid in range(len(id_to_str)):
            _mark_frozen(sid)

        total_tokens = sum(len(s) for s in seqs)
        logger.info(
            "BPE training: %d total tokens, %d sequences, %d unique token types, "
            "up to %d merges",
            total_tokens,
            len(seqs),
            len(id_to_str),
            num_merges,
        )

        # -- Build initial pair counts and inverted index ------------------
        # pair (id_a, id_b) -> total count across all sequences
        pair_counts: dict[tuple[int, int], int] = defaultdict(int)
        # pair -> set of sequence indices that contain this pair
        pair_to_seqs: dict[tuple[int, int], set[int]] = defaultdict(set)

        for si, seq in tqdm(
            enumerate(seqs), total=len(seqs), desc="BPE pair counting"
        ):
            for i in range(len(seq) - 1):
                if seq[i] in frozen_ids or seq[i + 1] in frozen_ids:
                    continue
                p = (seq[i], seq[i + 1])
                pair_counts[p] += 1
                pair_to_seqs[p].add(si)

        # Max-heap of (-count, pair).
        heap: list[tuple[int, tuple[int, int]]] = [
            (-cnt, p) for p, cnt in pair_counts.items()
        ]
        heapq.heapify(heap)

        min_freq = max(min_frequency, 1)

        pbar = tqdm(range(num_merges), desc="BPE merges")
        for _step in pbar:
            # Find best valid pair from heap.
            bp: tuple[int, int] | None = None
            best_count = 0
            while heap:
                neg_count, candidate = heap[0]
                live = pair_counts.get(candidate, 0)
                if live <= 0:
                    heapq.heappop(heap)
                    continue
                if live != -neg_count:
                    heapq.heappop(heap)
                    heapq.heappush(heap, (-live, candidate))
                    continue
                bp = candidate
                best_count = live
                heapq.heappop(heap)
                break

            if bp is None or best_count < min_freq:
                break

            # Register the merged token.
            merged_str = id_to_str[bp[0]] + BPE_SEPARATOR + id_to_str[bp[1]]
            self.merges.append((id_to_str[bp[0]], id_to_str[bp[1]]))
            merged_id = _intern(merged_str)

            pbar.set_postfix(
                pair=merged_str[:40],
                freq=best_count,
                pairs=len(pair_counts),
            )
            # Merged tokens containing frozen parts are themselves frozen.
            if bp[0] in frozen_ids or bp[1] in frozen_ids:
                frozen_ids.add(merged_id)

            # Process only sequences that contain this pair.
            affected = pair_to_seqs.pop(bp, set())
            pair_counts.pop(bp, None)

            dirty_pairs: set[tuple[int, int]] = set()

            for si in affected:
                seq = seqs[si]
                i = 0
                while i < len(seq) - 1:
                    if seq[i] == bp[0] and seq[i + 1] == bp[1]:
                        # Remove old neighbour pairs.
                        if i > 0 and seq[i - 1] not in frozen_ids:
                            lp = (seq[i - 1], seq[i])
                            pair_counts[lp] -= 1
                            if pair_counts[lp] <= 0:
                                pair_counts.pop(lp, None)
                                pair_to_seqs.pop(lp, None)
                            else:
                                s = pair_to_seqs.get(lp)
                                if s:
                                    s.discard(si)
                            dirty_pairs.add(lp)
                        if i + 2 < len(seq) and seq[i + 2] not in frozen_ids:
                            rp = (seq[i + 1], seq[i + 2])
                            pair_counts[rp] -= 1
                            if pair_counts[rp] <= 0:
                                pair_counts.pop(rp, None)
                                pair_to_seqs.pop(rp, None)
                            else:
                                s = pair_to_seqs.get(rp)
                                if s:
                                    s.discard(si)
                            dirty_pairs.add(rp)

                        # Apply merge in-place.
                        seq[i] = merged_id
                        del seq[i + 1]

                        # Add new neighbour pairs.
                        if i > 0 and seq[i - 1] not in frozen_ids:
                            nlp = (seq[i - 1], merged_id)
                            pair_counts[nlp] += 1
                            pair_to_seqs.setdefault(nlp, set()).add(si)
                            dirty_pairs.add(nlp)
                        if i + 1 < len(seq) and seq[i + 1] not in frozen_ids:
                            nrp = (merged_id, seq[i + 1])
                            pair_counts[nrp] += 1
                            pair_to_seqs.setdefault(nrp, set()).add(si)
                            dirty_pairs.add(nrp)

                        # Don't advance i — check for adjacent merges.
                    else:
                        i += 1

            # Re-push dirty pairs into heap.
            for dp in dirty_pairs:
                cnt = pair_counts.get(dp, 0)
                if cnt > 0:
                    heapq.heappush(heap, (-cnt, dp))

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
