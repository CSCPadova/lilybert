"""Linear probing CLI for trained lilyBERT encoders."""

from __future__ import annotations

import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, List, Tuple

import hydra
import numpy as np
import torch
from omegaconf import DictConfig, OmegaConf
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, f1_score, hamming_loss
from sklearn.model_selection import train_test_split
from sklearn.multiclass import OneVsRestClassifier
from sklearn.preprocessing import MultiLabelBinarizer
from transformers import PreTrainedTokenizerFast

from lilybert.models.bert_classifier import LilyBERTEncoder


@dataclass
class ProbeConfig:
    checkpoint_dir: str = ""
    tokenizer_path: str = "artifacts/tokenizer"
    data_dir: str = "data/processed"
    task: str = "composer"
    max_length: int = 512
    stride: int = 256
    test_size: float = 0.2
    random_state: int = 42


def _normalize_task(task: str) -> str:
    aliases = {
        "composer": "composer",
        "style": "style",
        "instrument": "instrument",
        "instruments": "instrument",
        "musical_key": "key_root",
        "key": "key_root",
        "key_root": "key_root",
    }
    value = aliases.get(task.lower())
    if value is None:
        raise ValueError(
            "Unsupported probe task. Expected one of: composer, style, instrument, key_root"
        )
    return value


def _extract_label(meta: Dict[str, Any], task: str) -> Any:
    labels = meta.get("labels", {}) if isinstance(meta, dict) else {}
    if task == "composer":
        return labels.get("composer")
    if task == "style":
        return labels.get("style")
    if task == "instrument":
        return labels.get("midi_instruments", [])
    if task == "key_root":
        key_value = labels.get("meta", {}).get("key")
        return key_value
    raise ValueError(f"Unsupported task: {task}")


def _collect_samples(data_dir: Path, task: str) -> List[Tuple[Path, Any]]:
    metadata_path = data_dir / "metadata.json"
    if not metadata_path.exists():
        raise FileNotFoundError(f"metadata.json not found in {data_dir}")

    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
    if not data_dir.exists():
        raise FileNotFoundError(f"Data directory not found: {data_dir}")

    samples: List[Tuple[Path, Any]] = []
    for file_path in sorted(data_dir.glob("*.ly")):
        movement_id = file_path.stem
        meta = metadata.get(movement_id)
        if not meta:
            continue
        label = _extract_label(meta, task)
        if task == "instrument":
            if not label:
                continue
        else:
            if label is None:
                continue
        samples.append((file_path, label))
    return samples


def _windowed_tokenize(
    text: str,
    tokenizer: PreTrainedTokenizerFast,
    max_length: int,
    stride: int,
) -> Dict[str, torch.Tensor]:
    encoded = tokenizer(
        text,
        truncation=True,
        max_length=max_length,
        stride=stride,
        return_overflowing_tokens=True,
        return_tensors="pt",
        padding="max_length",
    )
    return {
        "input_ids": encoded["input_ids"],
        "attention_mask": encoded["attention_mask"],
    }


def _extract_embeddings(
    model: LilyBERTEncoder,
    tokenizer: PreTrainedTokenizerFast,
    samples: List[Tuple[Path, Any]],
    max_length: int,
    stride: int,
) -> Tuple[np.ndarray, List[Any]]:
    model.eval()
    embeddings: List[np.ndarray] = []
    labels: List[Any] = []

    with torch.no_grad():
        for file_path, label in samples:
            text = file_path.read_text(encoding="utf-8", errors="ignore")
            batch = _windowed_tokenize(
                text=text,
                tokenizer=tokenizer,
                max_length=max_length,
                stride=stride,
            )
            pooled = model.encode(
                input_ids=batch["input_ids"],
                attention_mask=batch["attention_mask"],
            )
            movement_embedding = pooled.mean(dim=0).cpu().numpy()
            embeddings.append(movement_embedding)
            labels.append(label)

    return np.vstack(embeddings), labels


def _run_single_label_probe(
    x: np.ndarray,
    y: List[Any],
    test_size: float,
    random_state: int,
) -> Dict[str, float]:
    x_train, x_test, y_train, y_test = train_test_split(
        x,
        y,
        test_size=test_size,
        random_state=random_state,
        stratify=y,
    )
    classifier = LogisticRegression(max_iter=2000)
    classifier.fit(x_train, y_train)
    y_pred = classifier.predict(x_test)

    return {
        "accuracy": float(accuracy_score(y_test, y_pred)),
        "f1_macro": float(f1_score(y_test, y_pred, average="macro")),
        "f1_weighted": float(f1_score(y_test, y_pred, average="weighted")),
    }


def _run_multi_label_probe(
    x: np.ndarray,
    y: List[List[str]],
    test_size: float,
    random_state: int,
) -> Dict[str, float]:
    mlb = MultiLabelBinarizer()
    y_binary = mlb.fit_transform(y)

    x_train, x_test, y_train, y_test = train_test_split(
        x,
        y_binary,
        test_size=test_size,
        random_state=random_state,
    )

    classifier = OneVsRestClassifier(LogisticRegression(max_iter=2000))
    classifier.fit(x_train, y_train)
    y_pred = classifier.predict(x_test)

    return {
        "f1_micro": float(f1_score(y_test, y_pred, average="micro", zero_division=0)),
        "f1_macro": float(f1_score(y_test, y_pred, average="macro", zero_division=0)),
        "subset_accuracy": float(accuracy_score(y_test, y_pred)),
        "hamming_loss": float(hamming_loss(y_test, y_pred)),
    }


@hydra.main(version_base=None, config_path="../../conf", config_name="probe")
def _main(cfg: DictConfig) -> None:
    payload = OmegaConf.to_container(cfg, resolve=True)
    if not isinstance(payload, dict):
        raise TypeError("Invalid probe config")
    config = ProbeConfig(**payload)

    task = _normalize_task(config.task)
    tokenizer = PreTrainedTokenizerFast.from_pretrained(config.tokenizer_path)
    encoder = LilyBERTEncoder.from_pretrained(config.checkpoint_dir)

    samples = _collect_samples(Path(config.data_dir), task)
    if len(samples) < 2:
        raise ValueError("Not enough samples for probing")

    x, y = _extract_embeddings(
        model=encoder,
        tokenizer=tokenizer,
        samples=samples,
        max_length=config.max_length,
        stride=config.stride,
    )

    if task == "instrument":
        metrics = _run_multi_label_probe(
            x=x,
            y=y,
            test_size=config.test_size,
            random_state=config.random_state,
        )
    else:
        metrics = _run_single_label_probe(
            x=x,
            y=y,
            test_size=config.test_size,
            random_state=config.random_state,
        )

    result = {
        "task": task,
        "samples": len(samples),
        "metrics": metrics,
    }
    print(json.dumps(result, indent=2, ensure_ascii=False))


def main() -> None:
    _main()
