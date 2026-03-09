"""Token-level BPE that operates on whole musical token sequences.

Unlike character-level BPE, this implementation treats each musical token
(NOTE_C, DUR_4, etc.) as an atomic unit. Merges combine adjacent tokens
using ``+`` as a separator (e.g., ``NOTE_C+DUR_4``).
"""

from __future__ import annotations

import array
import heapq
import json
import logging
from collections import defaultdict
from pathlib import Path
from typing import AbstractSet, List, Optional, Sequence

from tqdm import tqdm

logger = logging.getLogger(__name__)

BPE_SEPARATOR = "+"

# Sentinel value for deleted nodes in the flat linked-list.
_DELETED = -1


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

        Uses a flat doubly-linked list over all tokens with an inverted
        index mapping each pair to the set of positions where it occurs.
        This makes both pair counting and merge application O(occurrences)
        with O(1) node deletion, avoiding full-sequence scans.

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

        # -- Encode strings to integer IDs ----------------------------------
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

        frozen_ids: set[int] = set()

        def _mark_frozen(sid: int) -> None:
            s = id_to_str[sid]
            if any(part in frozen for part in s.split(BPE_SEPARATOR)):
                frozen_ids.add(sid)

        # -- Build flat linked list -----------------------------------------
        # All tokens from all sequences are laid out in one contiguous block.
        # Arrays: tok[i] = token id, prev[i] = previous node, next[i] = next
        # node.  Sequence boundaries are marked by prev/next = _DELETED.
        # Deleted nodes have tok[i] = _DELETED.

        # First pass: count total tokens for pre-allocation.
        total = 0
        for seq in sequences:
            total += len(seq)

        tok = array.array("i", [0]) * total
        prv = array.array("i", [0]) * total
        nxt = array.array("i", [0]) * total

        pos = 0
        for seq in tqdm(sequences, desc="BPE encoding"):
            start = pos
            for t_str in seq:
                tid = _intern(t_str)
                tok[pos] = tid
                prv[pos] = pos - 1 if pos > start else _DELETED
                nxt[pos] = pos + 1  # will fix last element below
                pos += 1
            if pos > start:
                nxt[pos - 1] = _DELETED  # end of sequence

        # Mark frozen IDs.
        for sid in range(len(id_to_str)):
            _mark_frozen(sid)

        logger.info(
            "BPE training: %d total tokens, %d sequences, %d unique token types, "
            "up to %d merges",
            total,
            len(sequences),
            len(id_to_str),
            num_merges,
        )

        # -- Build initial pair counts and position index -------------------
        # pair -> count
        pair_counts: dict[tuple[int, int], int] = defaultdict(int)
        # pair -> set of positions (left node) where pair occurs
        pair_positions: dict[tuple[int, int], set[int]] = defaultdict(set)

        for i in tqdm(range(total), desc="BPE pair counting"):
            j = nxt[i]
            if j == _DELETED or tok[i] == _DELETED:
                continue
            a, b = tok[i], tok[j]
            if a in frozen_ids or b in frozen_ids:
                continue
            p = (a, b)
            pair_counts[p] += 1
            pair_positions[p].add(i)

        # Max-heap.
        heap: list[tuple[int, tuple[int, int]]] = [
            (-cnt, p) for p, cnt in pair_counts.items()
        ]
        heapq.heapify(heap)

        min_freq = max(min_frequency, 1)

        pbar = tqdm(range(num_merges), desc="BPE merges")
        for _step in pbar:
            # Find best valid pair.
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

            merged_str = id_to_str[bp[0]] + BPE_SEPARATOR + id_to_str[bp[1]]
            self.merges.append((id_to_str[bp[0]], id_to_str[bp[1]]))
            merged_id = _intern(merged_str)
            if bp[0] in frozen_ids or bp[1] in frozen_ids:
                frozen_ids.add(merged_id)

            pbar.set_postfix(
                pair=merged_str[:40],
                freq=best_count,
                pairs=len(pair_counts),
            )

            # Get all positions where this pair occurs and process them.
            positions = pair_positions.pop(bp, set())
            pair_counts.pop(bp, None)

            dirty_pairs: set[tuple[int, int]] = set()

            for left_pos in positions:
                # Validate: node may have been invalidated by an earlier
                # merge in this same iteration (adjacent merges).
                if tok[left_pos] != bp[0]:
                    continue
                right_pos = nxt[left_pos]
                if right_pos == _DELETED or tok[right_pos] != bp[1]:
                    continue

                # -- Remove old neighbour pairs --
                prev_pos = prv[left_pos]
                next_next = nxt[right_pos]

                if prev_pos != _DELETED and tok[prev_pos] not in frozen_ids:
                    lp = (tok[prev_pos], bp[0])
                    pair_counts[lp] -= 1
                    if pair_counts[lp] <= 0:
                        pair_counts.pop(lp, None)
                        pair_positions.pop(lp, None)
                    else:
                        s = pair_positions.get(lp)
                        if s:
                            s.discard(prev_pos)
                    dirty_pairs.add(lp)

                if next_next != _DELETED and tok[next_next] not in frozen_ids:
                    rp = (bp[1], tok[next_next])
                    pair_counts[rp] -= 1
                    if pair_counts[rp] <= 0:
                        pair_counts.pop(rp, None)
                        pair_positions.pop(rp, None)
                    else:
                        s = pair_positions.get(rp)
                        if s:
                            s.discard(right_pos)
                    dirty_pairs.add(rp)

                # -- Apply merge: left_pos becomes merged, right_pos deleted --
                tok[left_pos] = merged_id
                tok[right_pos] = _DELETED

                # Relink: left_pos.next = right_pos.next
                nxt[left_pos] = next_next
                if next_next != _DELETED:
                    prv[next_next] = left_pos

                # -- Add new neighbour pairs --
                if prev_pos != _DELETED and tok[prev_pos] not in frozen_ids:
                    nlp = (tok[prev_pos], merged_id)
                    pair_counts[nlp] += 1
                    pair_positions[nlp].add(prev_pos)
                    dirty_pairs.add(nlp)

                if next_next != _DELETED and tok[next_next] not in frozen_ids:
                    nrp = (merged_id, tok[next_next])
                    pair_counts[nrp] += 1
                    pair_positions[nrp].add(left_pos)
                    dirty_pairs.add(nrp)

            # Re-push dirty pairs.
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
