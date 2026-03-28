"""Sharded pretokenization: write and read numbered .npz shard files."""

from __future__ import annotations

import json
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional, Sequence

import numpy as np


@dataclass
class ShardInfo:
    """Metadata for a single shard file."""

    path: str
    num_samples: int
    offset: int  # cumulative offset in global index


@dataclass
class ShardManifest:
    """Index file written alongside shards as ``manifest.json``."""

    shards: List[ShardInfo]
    total_samples: int
    label_to_index: Dict[str, int]
    movement_ids: List[str]
    base_works: List[str]
    config: Dict[str, Any] = field(default_factory=dict)
    structure_markers: Optional[List[List[str]]] = None
    per_shard_metadata: bool = False

    # ------------------------------------------------------------------
    # Serialisation helpers
    # ------------------------------------------------------------------

    def save(self, path: str | Path) -> None:
        path = Path(path)
        path.parent.mkdir(parents=True, exist_ok=True)
        data = asdict(self)
        data["shards"] = [asdict(s) for s in self.shards]
        path.write_text(
            json.dumps(data, indent=2, ensure_ascii=False), encoding="utf-8"
        )

    @classmethod
    def load(cls, path: str | Path) -> "ShardManifest":
        path = Path(path)
        raw = json.loads(path.read_text(encoding="utf-8"))
        shards = [ShardInfo(**s) for s in raw.pop("shards")]
        return cls(shards=shards, **raw)


class ShardWriter:
    """Accumulates samples and flushes them into numbered ``.npz`` shard files.

    Parameters
    ----------
    output_dir:
        Directory where shard files and the manifest will be written.
    shard_size:
        Maximum number of samples per shard (default 8192).
    max_length:
        Token sequence length (used to pre-allocate arrays).
    prefix:
        Filename prefix for shard files.
    multi_label:
        If ``True``, labels are stored as 2-D float32 arrays.
    num_classes:
        Required when *multi_label* is ``True``.
    has_labels:
        Set to ``False`` for MLM shards that carry no label column.
    """

    def __init__(
        self,
        output_dir: str | Path,
        shard_size: int = 8192,
        max_length: int = 512,
        prefix: str = "shard",
        multi_label: bool = False,
        num_classes: int = 0,
        has_labels: bool = True,
    ) -> None:
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.shard_size = shard_size
        self.max_length = max_length
        self.prefix = prefix
        self.multi_label = multi_label
        self.num_classes = num_classes
        self.has_labels = has_labels

        # Per-shard accumulation buffers (cleared on flush)
        self._shard_index = 0
        self._buf_input_ids: List[np.ndarray] = []
        self._buf_attention_mask: List[np.ndarray] = []
        self._buf_labels: List[np.ndarray] = []
        self._buf_movement_ids: List[str] = []
        self._buf_base_works: List[str] = []
        self._buf_structure_markers: Optional[List[List[str]]] = None
        self._buf_count = 0

        # Global bookkeeping (lightweight — only shard info and counts)
        self._shard_infos: List[ShardInfo] = []
        self._total_samples = 0

    # ------------------------------------------------------------------
    # Public API
    # ------------------------------------------------------------------

    def add_sample(
        self,
        input_ids: np.ndarray,
        attention_mask: np.ndarray,
        label: np.ndarray | None = None,
        movement_id: str = "",
        base_work: str = "",
        structure_markers: Sequence[str] | None = None,
    ) -> None:
        """Append a single sample to the current buffer."""
        self._buf_input_ids.append(input_ids)
        self._buf_attention_mask.append(attention_mask)
        if self.has_labels and label is not None:
            self._buf_labels.append(label)
        self._buf_movement_ids.append(movement_id)
        self._buf_base_works.append(base_work)
        if structure_markers is not None:
            if self._buf_structure_markers is None:
                self._buf_structure_markers = []
            self._buf_structure_markers.append(list(structure_markers))
        self._buf_count += 1

        if self._buf_count >= self.shard_size:
            self.flush()

    def flush(self) -> None:
        """Write the current buffer to a numbered shard file."""
        if self._buf_count == 0:
            return

        shard_name = f"{self.prefix}_{self._shard_index:04d}.npz"
        shard_path = self.output_dir / shard_name

        arrays: Dict[str, Any] = {
            "input_ids": np.stack(self._buf_input_ids),
            "attention_mask": np.stack(self._buf_attention_mask),
            "movement_ids": np.array(self._buf_movement_ids, dtype=object),
            "base_works": np.array(self._buf_base_works, dtype=object),
        }
        if self.has_labels and self._buf_labels:
            arrays["labels"] = np.stack(self._buf_labels)
        if self._buf_structure_markers is not None:
            arrays["structure_markers"] = np.array(
                [json.dumps(m) for m in self._buf_structure_markers], dtype=object
            )

        np.savez(shard_path, **arrays)

        info = ShardInfo(
            path=shard_name,
            num_samples=self._buf_count,
            offset=self._total_samples,
        )
        self._shard_infos.append(info)
        self._total_samples += self._buf_count

        # Reset buffer
        self._buf_input_ids.clear()
        self._buf_attention_mask.clear()
        self._buf_labels.clear()
        self._buf_movement_ids.clear()
        self._buf_base_works.clear()
        self._buf_structure_markers = None
        self._buf_count = 0
        self._shard_index += 1

    def finalize(
        self,
        label_to_index: Dict[str, int] | None = None,
        config: Dict[str, Any] | None = None,
    ) -> ShardManifest:
        """Flush remaining samples and write ``manifest.json``.

        Returns the manifest object.
        """
        self.flush()

        manifest = ShardManifest(
            shards=self._shard_infos,
            total_samples=self._total_samples,
            label_to_index=label_to_index or {},
            movement_ids=[],
            base_works=[],
            config=config or {},
            structure_markers=None,
            per_shard_metadata=True,
        )
        manifest.save(self.output_dir / "manifest.json")
        return manifest
