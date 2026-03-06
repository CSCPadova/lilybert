"""Dataset classes for LilyPond music notation data."""

import json
import logging
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Sequence, Union

import torch
from torch.utils.data import Dataset
from tqdm import tqdm
from transformers import PreTrainedTokenizer

from .music_theory import CANONICAL_KEY_ROOTS, canonicalize_key_root

logger = logging.getLogger(__name__)


class BaroqueMusicClassificationDataset(Dataset):
    """Windowed dataset for movement-level classification tasks."""

    MULTI_LABEL_TASKS = {"instrument"}

    def __init__(
        self,
        movement_files,
        metadata,
        tokenizer,
        max_length: int = 512,
        stride: int = 256,
        task: str = "composer",
        include_structure_markers: bool = False,
    ):
        self.movement_files = [Path(path) for path in movement_files]
        self.metadata = metadata or {}
        self.tokenizer = tokenizer
        self.max_length = max_length
        self.stride = stride
        self.task = task
        self.include_structure_markers = include_structure_markers

        if self.max_length < 3:
            raise ValueError("max_length must be >= 3 to include [CLS] and [SEP]")
        if self.task not in {
            "composer",
            "style",
            "instrument",
            "key_root",
        }:
            raise ValueError(f"Unsupported task: {self.task}")

        self._cls_id = self._require_token_id("cls_token_id")
        self._sep_id = self._require_token_id("sep_token_id")
        self._pad_id = self._require_token_id("pad_token_id")

        self.label_to_index = self._build_label_mapping()
        self.samples = []
        self._window_to_movement = {}

        self._build_samples()

    def __len__(self) -> int:
        return len(self.samples)

    def __getitem__(self, idx: int) -> Dict[str, Any]:
        return self.samples[idx]

    def get_movement_ids(self) -> Dict[int, str]:
        """Return mapping from window index to movement_id."""
        return dict(self._window_to_movement)

    def _build_samples(self) -> None:
        body_size = self.max_length - 2
        step = max(1, body_size - self.stride)

        for file_path in tqdm(
            self.movement_files,
            desc="Building samples",
            disable=len(self.movement_files) < 50,
        ):
            movement_id = file_path.stem
            movement_meta = self.metadata.get(movement_id, {})
            base_work = movement_meta.get("base_work", movement_id)
            text = file_path.read_text(encoding="utf-8", errors="ignore")
            token_ids = self._encode_without_special_tokens(text)

            windows = self._split_into_windows(token_ids, body_size, step)

            raw_value = self._extract_task_value(movement_meta)
            if raw_value is None and self.task not in self.MULTI_LABEL_TASKS:
                continue

            label = self._encode_label(movement_meta)

            for window in windows:
                input_ids, attention_mask = self._build_padded_inputs(window)
                sample = {
                    "input_ids": input_ids,
                    "attention_mask": attention_mask,
                    "label": label.clone() if torch.is_tensor(label) else label,
                    "movement_id": movement_id,
                    "base_work": base_work,
                }
                if self.include_structure_markers:
                    sample["structure_markers"] = movement_meta.get(
                        "structure_markers", []
                    )
                sample_index = len(self.samples)
                self.samples.append(sample)
                self._window_to_movement[sample_index] = movement_id

    def _split_into_windows(
        self, token_ids: List[int], body_size: int, step: int
    ) -> List[List[int]]:
        if not token_ids:
            return [[]]

        windows = []
        start = 0
        while start < len(token_ids):
            end = start + body_size
            windows.append(token_ids[start:end])
            if end >= len(token_ids):
                break
            start += step
        return windows

    def _build_padded_inputs(
        self, window_token_ids: List[int]
    ) -> tuple[torch.Tensor, torch.Tensor]:
        sequence = [self._cls_id, *window_token_ids, self._sep_id]
        if len(sequence) > self.max_length:
            sequence = sequence[: self.max_length - 1] + [self._sep_id]

        attention = [1] * len(sequence)
        pad_len = self.max_length - len(sequence)
        if pad_len > 0:
            sequence += [self._pad_id] * pad_len
            attention += [0] * pad_len

        return (
            torch.tensor(sequence, dtype=torch.long),
            torch.tensor(attention, dtype=torch.long),
        )

    def _encode_without_special_tokens(self, text: str) -> List[int]:
        if hasattr(self.tokenizer, "encode"):
            encoded = self.tokenizer.encode(text, add_special_tokens=False)
            if isinstance(encoded, list):
                return [int(token_id) for token_id in encoded]
            if hasattr(encoded, "ids"):
                return [int(token_id) for token_id in encoded.ids]

        encoded = self.tokenizer(
            text,
            add_special_tokens=False,
            return_attention_mask=False,
            truncation=False,
        )
        input_ids = (
            encoded["input_ids"] if isinstance(encoded, dict) else encoded.input_ids
        )
        return [int(token_id) for token_id in input_ids]

    def _require_token_id(self, attr: str) -> int:
        value = getattr(self.tokenizer, attr, None)
        if value is None:
            raise ValueError(f"Tokenizer is missing required token id: {attr}")
        return int(value)

    def _build_label_mapping(self) -> Dict[str, int]:
        if self.task == "key_root":
            labels = list(CANONICAL_KEY_ROOTS)
            return {label: idx for idx, label in enumerate(labels)}

        values = set()
        for movement_meta in self.metadata.values():
            raw = self._extract_task_value(movement_meta)
            if self.task in self.MULTI_LABEL_TASKS:
                for entry in self._to_list(raw):
                    values.add(self._normalize(entry))
            elif raw is not None:
                values.add(self._normalize(raw))

        labels = sorted(values)
        return {label: idx for idx, label in enumerate(labels)}

    def _encode_label(self, movement_meta: Dict[str, Any]):
        value = self._extract_task_value(movement_meta)

        if self.task in self.MULTI_LABEL_TASKS:
            vector = torch.zeros(len(self.label_to_index), dtype=torch.float32)
            for entry in self._to_list(value):
                normalized = self._normalize(entry)
                if normalized in self.label_to_index:
                    vector[self.label_to_index[normalized]] = 1.0
            return vector

        normalized = self._normalize(value)
        if normalized not in self.label_to_index:
            raise KeyError(
                f"Unknown label '{value}' for task '{self.task}' in movement metadata"
            )
        return self.label_to_index[normalized]

    def _extract_task_value(self, movement_meta: Dict[str, Any]) -> Any:
        labels = (
            movement_meta.get("labels", {}) if isinstance(movement_meta, dict) else {}
        )

        if self.task == "composer":
            return labels.get("composer")
        if self.task == "style":
            return labels.get("style")
        if self.task == "instrument":
            return labels.get("midi_instruments", [])
        if self.task == "key_root":
            meta = labels.get("meta", {}) if isinstance(labels, dict) else {}
            return canonicalize_key_root(meta.get("key", "do"))

        raise ValueError(f"Unsupported task: {self.task}")

    @staticmethod
    def _to_list(value: Any) -> List[str]:
        if value is None:
            return []
        if isinstance(value, str):
            return [value]
        if isinstance(value, Sequence):
            return [str(entry) for entry in value]
        return [str(value)]

    @staticmethod
    def _normalize(value: Any) -> str:
        text = str(value).strip().lower()
        return "_".join(text.split())


class BaroqueMusicDataset(Dataset):
    """PyTorch Dataset for Baroque music notation data.

    This dataset class handles loading and serving preprocessed LilyPond data
    for training language models on music notation.
    """

    def __init__(
        self,
        data: List[Dict[str, Any]],
        tokenizer: PreTrainedTokenizer,
        max_length: int = 1024,
        return_tensors: str = "pt",
        padding: str = "max_length",
        truncation: bool = True,
        include_metadata: bool = False,
        transform: Optional[Callable] = None,
    ):
        """Initialize the dataset.

        Args:
            data: List of preprocessed LilyPond data dictionaries
            tokenizer: Tokenizer for encoding text
            max_length: Maximum sequence length
            return_tensors: Format to return tensors in
            padding: Padding strategy
            truncation: Whether to truncate long sequences
            include_metadata: Whether to include metadata in items
            transform: Optional transform function to apply to items
        """
        self.data = data
        self.tokenizer = tokenizer
        self.max_length = max_length
        self.return_tensors = return_tensors
        self.padding = padding
        self.truncation = truncation
        self.include_metadata = include_metadata
        self.transform = transform

        # Ensure pad token is set
        if self.tokenizer.pad_token is None:
            self.tokenizer.pad_token = self.tokenizer.eos_token

        logger.info(f"Initialized BaroqueMusicDataset with {len(self.data)} samples")

    def __len__(self) -> int:
        """Return the number of samples in the dataset."""
        return len(self.data)

    def __getitem__(self, idx: int) -> Dict[str, Any]:
        """Get a single sample from the dataset.

        Args:
            idx: Index of the sample

        Returns:
            Dictionary containing tokenized inputs and labels
        """
        item = self.data[idx]
        text = item["text"]

        # Tokenize the text
        encoding = self.tokenizer(
            text,
            max_length=self.max_length,
            padding=self.padding,
            truncation=self.truncation,
            return_tensors=self.return_tensors,
        )

        # For causal language modeling, labels are the same as input_ids
        encoding["labels"] = encoding["input_ids"].clone()

        # Add metadata if requested
        if self.include_metadata:
            encoding["metadata"] = item.get("metadata", {})
            encoding["statistics"] = item.get("statistics", {})
            encoding["file_path"] = item.get("file_path", "")

        # Apply transform if provided
        if self.transform:
            encoding = self.transform(encoding)

        # Convert to tensors and squeeze if needed
        if self.return_tensors == "pt":
            for key in ["input_ids", "attention_mask", "labels"]:
                if key in encoding:
                    encoding[key] = encoding[key].squeeze(0)

        return encoding

    @classmethod
    def from_preprocessed_files(
        cls, file_paths: List[str], tokenizer: PreTrainedTokenizer, **kwargs
    ) -> "BaroqueMusicDataset":
        """Create dataset from preprocessed JSON files.

        Args:
            file_paths: List of paths to preprocessed JSON files
            tokenizer: Tokenizer for encoding text
            **kwargs: Additional arguments for dataset initialization

        Returns:
            BaroqueMusicDataset instance
        """
        data = []

        for file_path in file_paths:
            try:
                with open(file_path, "r", encoding="utf-8") as f:
                    file_data = json.load(f)
                    data.append(file_data)
            except Exception as e:
                logger.error(f"Error loading {file_path}: {e}")
                continue

        return cls(data, tokenizer, **kwargs)

    @classmethod
    def from_split_data(
        cls, split_data: List[Dict[str, Any]], tokenizer: PreTrainedTokenizer, **kwargs
    ) -> "BaroqueMusicDataset":
        """Create dataset from split data.

        Args:
            split_data: Preprocessed split data
            tokenizer: Tokenizer for encoding text
            **kwargs: Additional arguments for dataset initialization

        Returns:
            BaroqueMusicDataset instance
        """
        return cls(split_data, tokenizer, **kwargs)

    def get_sample_text(self, idx: int) -> str:
        """Get the original text for a sample.

        Args:
            idx: Index of the sample

        Returns:
            Original text string
        """
        return self.data[idx]["text"]

    def get_statistics(self) -> Dict[str, Any]:
        """Get statistics about the dataset.

        Returns:
            Dictionary containing dataset statistics
        """
        total_samples = len(self.data)
        total_tokens = 0
        total_chars = 0
        file_count = 0

        # Collect metadata
        composers = set()
        time_signatures = set()
        key_signatures = set()

        for item in self.data:
            text = item["text"]
            total_chars += len(text)

            # Count tokens (approximate)
            if "tokenized" in item and item["tokenized"]:
                total_tokens += item["tokenized"]["token_count"]
            else:
                total_tokens += len(text.split())

            # Count files
            if "file_path" in item:
                file_count += 1

            # Extract metadata
            metadata = item.get("metadata", {})
            if "composer" in metadata:
                composers.add(metadata["composer"])
            if "time" in metadata:
                time_signatures.add(metadata["time"])
            if "key" in metadata:
                key_signatures.add(metadata["key"])

        avg_tokens_per_sample = total_tokens / total_samples if total_samples > 0 else 0
        avg_chars_per_sample = total_chars / total_samples if total_samples > 0 else 0

        return {
            "total_samples": total_samples,
            "total_tokens": total_tokens,
            "total_characters": total_chars,
            "avg_tokens_per_sample": avg_tokens_per_sample,
            "avg_chars_per_sample": avg_chars_per_sample,
            "unique_files": file_count,
            "unique_composers": len(composers),
            "unique_time_signatures": len(time_signatures),
            "unique_key_signatures": len(key_signatures),
            "composers": list(composers),
            "time_signatures": list(time_signatures),
            "key_signatures": list(key_signatures),
        }
