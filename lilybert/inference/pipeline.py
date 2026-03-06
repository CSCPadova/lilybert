"""Batch inference pipeline for lilyBERT classification."""

from __future__ import annotations

import json
import logging
from collections import defaultdict
from pathlib import Path
from typing import Any, Dict, List, Optional

import numpy as np
import torch
from torch.utils.data import DataLoader, Dataset
from transformers import PreTrainedTokenizerFast

from lilybert.evaluation import WindowAggregator

logger = logging.getLogger(__name__)


class InferenceDataset(Dataset):
    """Windowed dataset for inference (no labels required).

    Mirrors the windowing logic of BaroqueMusicClassificationDataset
    but omits label encoding, making it suitable for prediction on
    unlabelled data.
    """

    def __init__(
        self,
        movement_files: List[str],
        tokenizer: Any,
        max_length: int = 512,
        stride: int = 256,
    ):
        self.movement_files = [Path(p) for p in movement_files]
        self.tokenizer = tokenizer
        self.max_length = max_length
        self.stride = stride

        if self.max_length < 3:
            raise ValueError("max_length must be >= 3 to include [CLS] and [SEP]")

        self._cls_id = self._require_token_id("cls_token_id")
        self._sep_id = self._require_token_id("sep_token_id")
        self._pad_id = self._require_token_id("pad_token_id")

        self.samples: List[Dict[str, Any]] = []
        self._build_samples()

    def __len__(self) -> int:
        return len(self.samples)

    def __getitem__(self, idx: int) -> Dict[str, Any]:
        return self.samples[idx]

    def _build_samples(self) -> None:
        body_size = self.max_length - 2
        step = max(1, body_size - self.stride)

        for file_path in self.movement_files:
            movement_id = file_path.stem
            text = file_path.read_text(encoding="utf-8", errors="ignore")
            token_ids = self._encode_without_special_tokens(text)

            windows = self._split_into_windows(token_ids, body_size, step)
            for window in windows:
                input_ids, attention_mask = self._build_padded_inputs(window)
                self.samples.append(
                    {
                        "input_ids": input_ids,
                        "attention_mask": attention_mask,
                        "movement_id": movement_id,
                    }
                )

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
                return [int(tid) for tid in encoded]
            if hasattr(encoded, "ids"):
                return [int(tid) for tid in encoded.ids]

        encoded = self.tokenizer(
            text,
            add_special_tokens=False,
            return_attention_mask=False,
            truncation=False,
        )
        input_ids = (
            encoded["input_ids"] if isinstance(encoded, dict) else encoded.input_ids
        )
        return [int(tid) for tid in input_ids]

    def _require_token_id(self, attr: str) -> int:
        value = getattr(self.tokenizer, attr, None)
        if value is None:
            raise ValueError(f"Tokenizer is missing required token id: {attr}")
        return int(value)


class InferencePipeline:
    """End-to-end inference pipeline: files -> predictions."""

    MULTI_LABEL_TASKS = {"instrument"}

    def __init__(
        self,
        model: torch.nn.Module,
        tokenizer: Any,
        task: str = "composer",
        max_length: int = 512,
        stride: int = 256,
        aggregation_method: str = "average",
        device: Optional[str] = None,
        label_map: Optional[Dict[int, str]] = None,
    ):
        self.model = model
        self.tokenizer = tokenizer
        self.task = task
        self.max_length = max_length
        self.stride = stride
        self.aggregation_method = aggregation_method
        self.device = torch.device(
            device or ("cuda" if torch.cuda.is_available() else "cpu")
        )
        self.label_map = label_map or {}
        self.model.to(self.device)
        self.model.eval()
        self.aggregator = WindowAggregator()

    @classmethod
    def from_checkpoint(
        cls,
        checkpoint_dir: str,
        task: str = "composer",
        device: Optional[str] = None,
        **kwargs: Any,
    ) -> "InferencePipeline":
        """Load model, tokenizer, and label map from a saved checkpoint directory.

        Expected directory layout::

            checkpoint_dir/
                model.pt            # state dict
                tokenizer/          # HF tokenizer directory
                config.json         # {"task": ..., "num_classes": ..., "multi_label": ...}
                label_map.json      # optional {index: label_name}
        """
        from lilybert.models import LilyBERTClassifier

        ckpt_path = Path(checkpoint_dir)

        config_path = ckpt_path / "config.json"
        if not config_path.exists():
            raise FileNotFoundError(f"config.json not found in {ckpt_path}")
        config = json.loads(config_path.read_text(encoding="utf-8"))

        tokenizer = PreTrainedTokenizerFast.from_pretrained(
            str(ckpt_path / "tokenizer")
        )

        num_classes = config["num_classes"]
        multi_label = config.get("multi_label", task in cls.MULTI_LABEL_TASKS)
        vocab_size = len(tokenizer.get_vocab())

        model = LilyBERTClassifier(
            num_classes=num_classes,
            multi_label=multi_label,
            vocab_size=vocab_size,
        )
        state_dict = torch.load(
            ckpt_path / "model.pt", map_location="cpu", weights_only=True
        )
        model.load_state_dict(state_dict)

        label_map: Dict[int, str] = {}
        label_map_path = ckpt_path / "label_map.json"
        if label_map_path.exists():
            raw = json.loads(label_map_path.read_text(encoding="utf-8"))
            label_map = {int(k): v for k, v in raw.items()}

        return cls(
            model=model,
            tokenizer=tokenizer,
            task=task,
            device=device,
            label_map=label_map,
            **kwargs,
        )

    def predict_files(
        self,
        file_paths: List[str],
        batch_size: int = 16,
    ) -> List[Dict[str, Any]]:
        """Run inference on a list of preprocessed .ly movement files.

        Returns a list of dicts with movement_id, prediction, and metadata.
        """
        multi_label = self.task in self.MULTI_LABEL_TASKS

        dataset = InferenceDataset(
            movement_files=file_paths,
            tokenizer=self.tokenizer,
            max_length=self.max_length,
            stride=self.stride,
        )
        loader = DataLoader(dataset, batch_size=batch_size, shuffle=False)

        probs_per_window: List[np.ndarray] = []
        movement_ids_per_window: List[str] = []

        with torch.no_grad():
            for batch in loader:
                outputs = self.model(
                    input_ids=batch["input_ids"].to(self.device),
                    attention_mask=batch["attention_mask"].to(self.device),
                )
                logits = outputs["logits"].detach().cpu()
                if multi_label:
                    probs = torch.sigmoid(logits).numpy()
                else:
                    probs = torch.softmax(logits, dim=-1).numpy()

                probs_per_window.extend(list(probs))
                movement_ids_per_window.extend(list(batch["movement_id"]))

        grouped: Dict[str, List[np.ndarray]] = defaultdict(list)
        for mid, prob in zip(movement_ids_per_window, probs_per_window):
            grouped[mid].append(prob)

        results: List[Dict[str, Any]] = []
        for movement_id, windows in grouped.items():
            window_arr = np.array(windows)
            if self.aggregation_method == "majority":
                pred = self.aggregator.majority_vote(window_arr, multi_label)
            else:
                pred = self.aggregator.average_probabilities(window_arr, multi_label)

            result: Dict[str, Any] = {
                "movement_id": movement_id,
                "prediction": pred if isinstance(pred, int) else pred.tolist(),
                "num_windows": len(windows),
            }
            if self.label_map and not multi_label:
                result["label"] = self.label_map.get(int(pred), str(pred))

            results.append(result)

        return results

    def predict_directory(
        self,
        input_dir: str,
        batch_size: int = 16,
    ) -> List[Dict[str, Any]]:
        """Run inference on all .ly files in a directory."""
        dir_path = Path(input_dir)
        if not dir_path.exists():
            raise FileNotFoundError(f"Directory not found: {dir_path}")

        file_paths = sorted(str(p) for p in dir_path.glob("*.ly"))
        if not file_paths:
            return []

        return self.predict_files(file_paths=file_paths, batch_size=batch_size)
