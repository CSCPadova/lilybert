"""Label encoder for lilyBERT classification tasks."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, Iterable, List, Mapping, Sequence

import torch

from .labels_hierarchy import LABEL_HIERARCHY
from .music_theory import CANONICAL_KEY_ROOTS, canonicalize_key_root


class LabelEncoder:
    """Encode labels for the supported tasks.

    Tasks:
    - composer (single-label)
    - style (single-label)
    - instrument (multi-label)
    - key_root (single-label)
    """

    MULTI_LABEL_TASKS = {"instrument"}

    def __init__(
        self,
        metadata_path: str | Path = "data/processed/metadata.json",
        labels_path: str | Path = "data/labels/labels_v1.json",
    ):
        self.metadata_path = Path(metadata_path)
        self.labels_path = Path(labels_path)

        self.metadata = self._load_json(self.metadata_path)
        self.labels = self._load_json(self.labels_path)
        self.hierarchy = self._load_hierarchy()

        self.classes: Dict[str, List[str]] = {
            "composer": self._build_composer_classes(),
            "style": self._build_style_classes(),
            "instrument": self._build_instrument_classes(),
            "key_root": self._build_key_root_classes(),
        }
        self.class_to_index: Dict[str, Dict[str, int]] = {
            task: {label: idx for idx, label in enumerate(labels)}
            for task, labels in self.classes.items()
        }

    def encode(self, task: str, value: Any) -> int | torch.Tensor:
        if task not in self.class_to_index:
            raise KeyError(f"Unknown task: {task}")

        if task in self.MULTI_LABEL_TASKS:
            values = self._to_sequence(value)
            vector = torch.zeros(self.get_num_classes(task), dtype=torch.float32)
            for raw in values:
                label = self._normalize(raw)
                if label not in self.class_to_index[task]:
                    raise KeyError(f"Unknown {task} label: {raw}")
                vector[self.class_to_index[task][label]] = 1.0
            return vector

        normalized = self._normalize(value)
        if normalized not in self.class_to_index[task]:
            raise KeyError(f"Unknown {task} label: {value}")
        return self.class_to_index[task][normalized]

    def get_num_classes(self, task: str) -> int:
        if task not in self.classes:
            raise KeyError(f"Unknown task: {task}")
        return len(self.classes[task])

    def get_key_root_label(self, movement_record: Mapping[str, Any]) -> str:
        labels = (
            movement_record.get("labels", {})
            if isinstance(movement_record, Mapping)
            else {}
        )
        meta = labels.get("meta", {}) if isinstance(labels, Mapping) else {}
        key = canonicalize_key_root(meta.get("key", "do"))
        return self._normalize(key)

    def _build_composer_classes(self) -> List[str]:
        base = [self._normalize(x) for x in self.hierarchy.get("composer", [])]
        from_metadata = []
        for item in self.metadata.values():
            composer = (
                ((item.get("labels") or {}).get("composer"))
                if isinstance(item, Mapping)
                else None
            )
            if composer:
                from_metadata.append(self._normalize(composer))
        return self._unique_sorted(base + from_metadata)

    def _build_style_classes(self) -> List[str]:
        from_metadata: List[str] = []
        for item in self.metadata.values():
            style = (
                ((item.get("labels") or {}).get("style"))
                if isinstance(item, Mapping)
                else None
            )
            if style:
                from_metadata.append(self._normalize(style))
        return self._unique_sorted(from_metadata)

    def _build_instrument_classes(self) -> List[str]:
        base = [self._normalize(x) for x in self.hierarchy.get("instruments", [])]
        from_metadata: List[str] = []
        for item in self.metadata.values():
            instruments = (item.get("labels") or {}).get("midi_instruments") or []
            for instrument in instruments:
                from_metadata.append(self._normalize(instrument))
        return self._unique_sorted(base + from_metadata)

    def _build_key_root_classes(self) -> List[str]:
        return list(CANONICAL_KEY_ROOTS)

    def _load_hierarchy(self) -> Dict[str, Any]:
        hierarchy = LABEL_HIERARCHY
        return hierarchy if isinstance(hierarchy, dict) else {}

    @staticmethod
    def _load_json(path: Path) -> Dict[str, Any]:
        if not path.exists():
            return {}
        with path.open("r", encoding="utf-8") as handle:
            return json.load(handle)

    @staticmethod
    def _to_sequence(value: Any) -> List[str]:
        if value is None:
            return []
        if isinstance(value, str):
            return [value]
        if isinstance(value, Sequence):
            return [str(v) for v in value]
        return [str(value)]

    @staticmethod
    def _normalize(value: Any) -> str:
        text = str(value).strip().lower()
        return "_".join(text.split())

    @staticmethod
    def _unique_sorted(items: Iterable[str]) -> List[str]:
        return sorted(set(items))
