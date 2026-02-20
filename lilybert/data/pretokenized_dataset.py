"""Lightweight dataset that loads pre-tokenized .npz caches."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, List, Optional, Sequence

import numpy as np
import torch
from torch.utils.data import Dataset


class PreTokenizedDataset(Dataset):
    """Dataset backed by pre-tokenized .npz + _meta.json files.

    Produces the same sample dict as BaroqueMusicClassificationDataset:
    ``{input_ids, attention_mask, label, movement_id, base_work}``.
    """

    def __init__(
        self,
        npz_path: str,
        movement_ids: Optional[Sequence[str]] = None,
    ):
        npz_path = Path(npz_path)
        meta_path = npz_path.with_name(npz_path.stem + "_meta.json")
        if not npz_path.exists():
            raise FileNotFoundError(f"Pre-tokenized file not found: {npz_path}")
        if not meta_path.exists():
            raise FileNotFoundError(f"Metadata file not found: {meta_path}")

        meta = json.loads(meta_path.read_text(encoding="utf-8"))
        self.label_to_index: Dict[str, int] = meta["label_to_index"]
        all_movement_ids: List[str] = meta["movement_ids"]
        all_base_works: List[str] = meta["base_works"]
        all_structure_markers: Optional[List[List[str]]] = meta.get("structure_markers")

        data = np.load(npz_path)
        all_input_ids = data["input_ids"]
        all_attention_mask = data["attention_mask"]
        all_labels = data["labels"]

        if movement_ids is not None:
            keep = set(movement_ids)
            indices = [i for i, mid in enumerate(all_movement_ids) if mid in keep]
        else:
            indices = list(range(len(all_movement_ids)))

        self._input_ids = torch.from_numpy(all_input_ids[indices]).long()
        self._attention_mask = torch.from_numpy(all_attention_mask[indices]).long()

        raw_labels = all_labels[indices]
        if raw_labels.ndim == 2:
            self._labels = torch.from_numpy(raw_labels).float()
        else:
            self._labels = torch.from_numpy(raw_labels).long()

        self._movement_ids = [all_movement_ids[i] for i in indices]
        self._base_works = [all_base_works[i] for i in indices]
        self._structure_markers = (
            [all_structure_markers[i] for i in indices]
            if all_structure_markers is not None
            else None
        )

        self._window_to_movement = {
            i: mid for i, mid in enumerate(self._movement_ids)
        }

    def __len__(self) -> int:
        return len(self._movement_ids)

    def __getitem__(self, idx: int) -> Dict[str, Any]:
        label = self._labels[idx]
        return {
            "input_ids": self._input_ids[idx],
            "attention_mask": self._attention_mask[idx],
            "label": label.clone() if label.dim() > 0 else label.item(),
            "movement_id": self._movement_ids[idx],
            "base_work": self._base_works[idx],
            **(
                {"structure_markers": self._structure_markers[idx]}
                if self._structure_markers is not None
                else {}
            ),
        }

    def get_movement_ids(self) -> Dict[int, str]:
        return dict(self._window_to_movement)
