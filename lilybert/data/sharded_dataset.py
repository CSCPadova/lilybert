"""Datasets backed by sharded pretokenized ``.npz`` files."""

from __future__ import annotations

import json
from collections import OrderedDict
from pathlib import Path
from typing import Any, Dict, List, Optional, Sequence

import numpy as np
import torch
from tqdm.auto import tqdm
from torch.utils.data import Dataset

from .sharding import ShardManifest


class _ShardCache:
    """Simple LRU cache for loaded shard numpy data."""

    def __init__(self, manifest_dir: Path, max_cached: int = 4) -> None:
        self._manifest_dir = manifest_dir
        self._max_cached = max_cached
        self._cache: OrderedDict[int, Dict[str, np.ndarray]] = OrderedDict()

    def get(self, shard_idx: int, shard_path: str) -> Dict[str, np.ndarray]:
        if shard_idx in self._cache:
            self._cache.move_to_end(shard_idx)
            return self._cache[shard_idx]

        data = dict(np.load(self._manifest_dir / shard_path, allow_pickle=True))
        self._cache[shard_idx] = data
        if len(self._cache) > self._max_cached:
            self._cache.popitem(last=False)
        return data


def _load_per_shard_metadata(
    manifest: ShardManifest,
    manifest_dir: Path,
) -> tuple[List[str], List[str], Optional[List[List[str]]]]:
    """Load movement_ids, base_works, and structure_markers from individual shard files."""
    movement_ids: List[str] = []
    base_works: List[str] = []
    has_markers = False
    structure_markers: List[List[str]] = []

    for shard_info in manifest.shards:
        data = np.load(manifest_dir / shard_info.path, allow_pickle=True)
        mids = data["movement_ids"].tolist() if "movement_ids" in data else [""] * shard_info.num_samples
        bws = data["base_works"].tolist() if "base_works" in data else [""] * shard_info.num_samples
        movement_ids.extend(mids)
        base_works.extend(bws)
        if "structure_markers" in data:
            has_markers = True
            structure_markers.extend(
                json.loads(s) for s in data["structure_markers"].tolist()
            )

    return movement_ids, base_works, structure_markers if has_markers else None


class ShardedDataset(Dataset):
    """Dataset backed by sharded pretokenized ``.npz`` files.

    Drop-in replacement for :class:`PreTokenizedDataset`.  Produces the
    same sample dict: ``{input_ids, attention_mask, label, movement_id,
    base_work}``.

    Parameters
    ----------
    manifest_path:
        Path to the ``manifest.json`` written by :class:`ShardWriter`.
    movement_ids:
        Optional subset of movement IDs to include (for CV fold filtering).
    max_cached_shards:
        Number of shards to keep in the LRU cache (default 4).
    """

    def __init__(
        self,
        manifest_path: str | Path,
        movement_ids: Optional[Sequence[str]] = None,
        max_cached_shards: int = 4,
    ) -> None:
        manifest_path = Path(manifest_path)
        self._manifest = ShardManifest.load(manifest_path)
        self._cache = _ShardCache(manifest_path.parent, max_cached=max_cached_shards)

        # Load metadata: from per-shard .npz files or from manifest (backward compat)
        if getattr(self._manifest, "per_shard_metadata", False):
            all_mids, all_bws, all_markers = _load_per_shard_metadata(
                self._manifest, manifest_path.parent
            )
        else:
            all_mids = self._manifest.movement_ids
            all_bws = self._manifest.base_works
            all_markers = self._manifest.structure_markers

        # Build global index → (shard_idx, local_idx) mapping
        if movement_ids is not None:
            keep = set(movement_ids)
            self._indices: List[tuple[int, int]] = []
            self._movement_ids: List[str] = []
            self._base_works: List[str] = []
            self._structure_markers: Optional[List[List[str]]] = (
                [] if all_markers is not None else None
            )

            global_idx = 0
            for shard_idx, shard_info in enumerate(self._manifest.shards):
                for local_idx in range(shard_info.num_samples):
                    mid = all_mids[global_idx]
                    if mid in keep:
                        self._indices.append((shard_idx, local_idx))
                        self._movement_ids.append(mid)
                        self._base_works.append(all_bws[global_idx])
                        if self._structure_markers is not None:
                            self._structure_markers.append(
                                all_markers[global_idx]  # type: ignore[index]
                            )
                    global_idx += 1
        else:
            self._indices = []
            for shard_idx, shard_info in enumerate(self._manifest.shards):
                for local_idx in range(shard_info.num_samples):
                    self._indices.append((shard_idx, local_idx))
            self._movement_ids = list(all_mids)
            self._base_works = list(all_bws)
            self._structure_markers = (
                list(all_markers) if all_markers is not None else None
            )

    @property
    def label_to_index(self) -> Dict[str, int]:
        return self._manifest.label_to_index

    def get_movement_ids(self) -> Dict[int, str]:
        return {i: mid for i, mid in enumerate(self._movement_ids)}

    def __len__(self) -> int:
        return len(self._indices)

    def __getitem__(self, idx: int) -> Dict[str, Any]:
        shard_idx, local_idx = self._indices[idx]
        shard_info = self._manifest.shards[shard_idx]
        data = self._cache.get(shard_idx, shard_info.path)

        input_ids = torch.from_numpy(data["input_ids"][local_idx].copy()).long()
        attention_mask = torch.from_numpy(
            data["attention_mask"][local_idx].copy()
        ).long()

        result: Dict[str, Any] = {
            "input_ids": input_ids,
            "attention_mask": attention_mask,
            "movement_id": self._movement_ids[idx],
            "base_work": self._base_works[idx],
        }

        if "labels" in data:
            raw_label = data["labels"][local_idx]
            if raw_label.ndim >= 1 and raw_label.shape[0] > 1:
                result["label"] = torch.from_numpy(raw_label.copy()).float()
            else:
                result["label"] = int(raw_label)

        if self._structure_markers is not None:
            result["structure_markers"] = self._structure_markers[idx]

        return result


class ShardedMLMDataset(Dataset):
    """Sharded dataset for MLM pretraining (no labels).

    Returns ``{input_ids, attention_mask}`` for use with
    ``DataCollatorForLanguageModeling``.

    All shards are concatenated into contiguous numpy arrays at init time
    so that ``__getitem__`` is a pure index operation with zero I/O.
    When used with a ``fork``-based DataLoader, worker processes share
    the parent's memory pages via copy-on-write (no duplication).

    Parameters
    ----------
    manifest_path:
        Path to the ``manifest.json``.
    """

    def __init__(
        self,
        manifest_path: str | Path,
    ) -> None:
        manifest_path = Path(manifest_path)
        manifest = ShardManifest.load(manifest_path)
        manifest_dir = manifest_path.parent

        input_ids_parts: List[np.ndarray] = []
        attention_mask_parts: List[np.ndarray] = []

        for shard_info in tqdm(manifest.shards, desc="Loading shards into RAM", unit="shard"):
            data = np.load(manifest_dir / shard_info.path)
            input_ids_parts.append(data["input_ids"])
            attention_mask_parts.append(data["attention_mask"])

        # Store as numpy so forked workers share pages (COW).
        # torch.from_numpy in __getitem__ is zero-copy.
        self._input_ids = np.concatenate(input_ids_parts, axis=0)
        self._attention_mask = np.concatenate(attention_mask_parts, axis=0)

    def __len__(self) -> int:
        return self._input_ids.shape[0]

    def __getitem__(self, idx: int) -> Dict[str, torch.Tensor]:
        return {
            "input_ids": torch.from_numpy(self._input_ids[idx]).long(),
            "attention_mask": torch.from_numpy(self._attention_mask[idx]).long(),
        }
