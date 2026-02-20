"""Label encoder for lilyBERT classification tasks."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, Iterable, List, Mapping, Sequence

import torch

from .labels_hierarchy import LABEL_HIERARCHY
from .music_theory import CANONICAL_KEY_ROOTS, canonicalize_key_root


class LabelEncoder:
    """Encode labels for the five supported tasks.

    Tasks:
    - composer (single-label)
    - musical_form (multi-label)
    - instruments (multi-label)
    - section_nomenclature (single-label)
    - key_scale (single-label)
    """

    MULTI_LABEL_TASKS = {"musical_form", "instruments"}

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
            "musical_form": self._build_form_classes(),
            "instruments": self._build_instrument_classes(),
            "section_nomenclature": self._build_section_classes(),
            "key_scale": self._build_key_scale_classes(),
        }
        self.class_to_index: Dict[str, Dict[str, int]] = {
            task: {label: idx for idx, label in enumerate(labels)}
            for task, labels in self.classes.items()
        }

    def encode(self, task: str, value: Any) -> int | torch.Tensor:
        """Encode a label value for a task.

        Returns int for single-label tasks and multi-hot float tensor for
        multi-label tasks.
        """
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

    def get_key_scale_label(self, movement_record: Mapping[str, Any]) -> str:
        """Extract canonical key_scale label from a movement metadata record."""
        labels = (
            movement_record.get("labels", {})
            if isinstance(movement_record, Mapping)
            else {}
        )
        meta = labels.get("meta", {}) if isinstance(labels, Mapping) else {}
        key = canonicalize_key_root(meta.get("key", "do"))
        scale = self._normalize(meta.get("scale", "major"))
        return f"{key}_{scale}"

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

    def _build_form_classes(self) -> List[str]:
        base = [self._normalize(x) for x in self.hierarchy.get("type", [])]
        from_metadata: List[str] = []
        for item in self.metadata.values():
            forms = (item.get("labels") or {}).get("musical_form") or []
            for form in forms:
                from_metadata.append(self._normalize(form))
        return self._unique_sorted(base + from_metadata)

    def _build_instrument_classes(self) -> List[str]:
        base = [self._normalize(x) for x in self.hierarchy.get("instruments", [])]
        from_metadata: List[str] = []
        for item in self.metadata.values():
            instruments = (item.get("labels") or {}).get("midi_instruments") or []
            for instrument in instruments:
                from_metadata.append(self._normalize(instrument))
        return self._unique_sorted(base + from_metadata)

    def _build_section_classes(self) -> List[str]:
        leaves: List[str] = []
        for key in [
            "slow",
            "mid",
            "fast",
            "very fast",
            "intention",
            "no_tempo",
            "non_descript",
            "suite",
        ]:
            leaves.extend(self._normalize(x) for x in self.hierarchy.get(key, []))

        from_metadata = []
        for item in self.metadata.values():
            section = (
                item.get("section_nomenclature") if isinstance(item, Mapping) else None
            )
            if section:
                from_metadata.append(self._normalize(section))
            meta_key = item.get("meta_key") if isinstance(item, Mapping) else None
            if meta_key and isinstance(meta_key, str) and ":" in meta_key:
                from_metadata.append(self._normalize(meta_key.split(":", 1)[1]))

        return self._unique_sorted(leaves + from_metadata)

    def _build_key_scale_classes(self) -> List[str]:
        classes = [
            f"{key}_{scale}"
            for key in CANONICAL_KEY_ROOTS
            for scale in ["major", "minor"]
        ]
        return classes

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
