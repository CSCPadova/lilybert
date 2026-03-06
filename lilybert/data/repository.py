"""Dataset access API for lilyBERT raw and preprocessed corpora."""

from __future__ import annotations

import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Callable, Dict, Iterable, Iterator, List, Optional

Augmentation = Callable[[str], str]


@dataclass
class MovementRecord:
    """Container for a preprocessed movement sample."""

    movement_id: str
    text: str
    metadata: Optional[Dict[str, Any]] = None


class BaroqueMusicDataAPI:
    """High-level Python API to access lilyBERT datasets.

    This class supports:
    - raw dataset access (`data/raw/*.ly`)
    - preprocessed movement access (`data/processed/*.ly`)
    - metadata access (`data/processed/metadata.json`)
    - simple text-based augmentation pipelines
    """

    def __init__(self, data_root: str | Path = "data"):
        self.data_root = Path(data_root)

    @property
    def raw_dir(self) -> Path:
        return self.data_root / "raw"

    @property
    def processed_dir(self) -> Path:
        return self.data_root / "processed"

    def list_raw_files(self) -> List[Path]:
        """Return sorted list of raw LilyPond files."""
        if not self.raw_dir.exists():
            return []
        return sorted(self.raw_dir.glob("*.ly"))

    def load_raw_file(self, file_name: str) -> str:
        """Load one raw LilyPond file by filename."""
        path = self.raw_dir / file_name
        if not path.exists():
            raise FileNotFoundError(f"Raw file not found: {path}")
        return path.read_text(encoding="utf-8", errors="ignore")

    def load_metadata(self) -> Dict[str, Any]:
        """Load processed movement metadata (`metadata.json`)."""
        metadata_path = self.processed_dir / "metadata.json"
        if not metadata_path.exists():
            return {}
        with metadata_path.open("r", encoding="utf-8") as handle:
            return json.load(handle)

    def list_movements(self) -> List[Path]:
        """List preprocessed movement files."""
        if not self.processed_dir.exists():
            return []
        return sorted(self.processed_dir.glob("*.ly"))

    def load_movement(
        self, movement_id: str,
    ) -> MovementRecord:
        """Load one movement by movement id."""
        path = self.processed_dir / f"{movement_id}.ly"
        if not path.exists():
            raise FileNotFoundError(f"Movement not found: {path}")

        metadata = self.load_metadata().get(movement_id)
        return MovementRecord(
            movement_id=movement_id,
            text=path.read_text(encoding="utf-8", errors="ignore"),
            metadata=metadata,
        )

    def iter_movements(
        self,
        include_metadata: bool = True,
    ) -> Iterator[MovementRecord]:
        """Iterate over movement records."""
        metadata = self.load_metadata() if include_metadata else {}
        for path in self.list_movements():
            movement_id = path.stem
            yield MovementRecord(
                movement_id=movement_id,
                text=path.read_text(encoding="utf-8", errors="ignore"),
                metadata=metadata.get(movement_id) if include_metadata else None,
            )

    def apply_augmentations(
        self,
        text: str,
        augmentations: Optional[Iterable[Augmentation]] = None,
    ) -> str:
        """Apply an ordered augmentation pipeline to a movement string."""
        result = text
        for augmentation in augmentations or []:
            result = augmentation(result)
        return result

    def iter_augmented_movements(
        self,
        augmentations: Optional[Iterable[Augmentation]] = None,
        include_metadata: bool = True,
    ) -> Iterator[MovementRecord]:
        """Iterate movement records after applying augmentations."""
        for record in self.iter_movements(
            include_metadata=include_metadata
        ):
            yield MovementRecord(
                movement_id=record.movement_id,
                text=self.apply_augmentations(record.text, augmentations),
                metadata=record.metadata,
            )
