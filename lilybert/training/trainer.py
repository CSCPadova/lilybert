"""Grouped stratified CV trainer for lilyBERT classification."""

from __future__ import annotations

import json
from collections import defaultdict
from pathlib import Path
from statistics import mean, stdev
from typing import Any, Callable, Dict, List, Optional, Sequence

import numpy as np
import torch
from torch.optim import AdamW
from torch.utils.data import DataLoader
from transformers import PreTrainedTokenizerFast

from lilybert.data import LilyPondClassificationDataset
from lilybert.evaluation import ClassificationMetrics, WindowAggregator
from lilybert.models import (
    ComposerClassifier,
    InstrumentsClassifier,
    KeyScaleClassifier,
    LilyBERTClassifier,
    MusicalFormClassifier,
    SectionNomenclatureClassifier,
)

from .config import TrainingConfig
from .cross_validation import build_grouped_stratified_folds

ModelFactory = Callable[[int, bool], torch.nn.Module]


class StratifiedKFoldTrainer:
    """Train/evaluate lilyBERT with grouped stratified K-fold CV."""

    MULTI_LABEL_TASKS = {"musical_form", "instruments"}

    def __init__(
        self,
        config: TrainingConfig,
        tokenizer: Optional[Any] = None,
        model_factory: Optional[ModelFactory] = None,
        device: Optional[str] = None,
    ):
        self.config = config
        self.tokenizer = tokenizer
        self.model_factory = model_factory
        self.device = torch.device(
            device or ("cuda" if torch.cuda.is_available() else "cpu")
        )
        self.window_aggregator = WindowAggregator()
        self.classification_metrics = ClassificationMetrics()

    def run(self) -> Dict[str, Any]:
        metadata = self._load_metadata()
        sample_ids, labels, groups = self._prepare_cv_samples(metadata)

        folds = build_grouped_stratified_folds(
            sample_ids=sample_ids,
            labels=labels,
            groups=groups,
            n_splits=self.config.n_folds,
            seed=self.config.seed,
        )

        fold_metrics: List[Dict[str, float]] = []
        for fold_index, fold in enumerate(folds, start=1):
            train_dataset = self._build_dataset(fold["train_ids"], metadata)
            val_dataset = self._build_dataset(fold["val_ids"], metadata)
            metrics = self._train_and_evaluate_fold(
                fold_index=fold_index,
                train_dataset=train_dataset,
                val_dataset=val_dataset,
            )
            fold_metrics.append(metrics)

        summary_mean, summary_std = self._summarize_fold_metrics(fold_metrics)

        output_dir = Path(self.config.output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)
        results_path = output_dir / f"cv_results_{self.config.task}.json"

        results = {
            "task": self.config.task,
            "n_folds": self.config.n_folds,
            "fold_metrics": fold_metrics,
            "mean": summary_mean,
            "std": summary_std,
            "results_path": str(results_path),
        }
        results_path.write_text(json.dumps(results, indent=2), encoding="utf-8")
        return results

    def _load_metadata(self) -> Dict[str, Dict[str, Any]]:
        metadata_path = Path(self.config.data_dir) / "metadata.json"
        if not metadata_path.exists():
            raise FileNotFoundError(
                f"metadata.json not found in {self.config.data_dir}"
            )
        return json.loads(metadata_path.read_text(encoding="utf-8"))

    def _prepare_cv_samples(self, metadata: Dict[str, Dict[str, Any]]):
        language_dir = Path(self.config.data_dir) / self.config.language
        if not language_dir.exists():
            raise FileNotFoundError(f"Language directory not found: {language_dir}")

        sample_ids: List[str] = []
        labels: List[str] = []
        groups: List[str] = []

        for movement_file in sorted(language_dir.glob("*.ly")):
            movement_id = movement_file.stem
            movement_meta = metadata.get(movement_id)
            if not movement_meta:
                continue

            sample_ids.append(movement_id)
            labels.append(self._stratify_label(movement_meta))
            groups.append(movement_meta.get("base_work", movement_id))

        if not sample_ids:
            raise ValueError("No movement samples found for CV")

        return sample_ids, labels, groups

    def _build_dataset(
        self,
        movement_ids: Sequence[str],
        metadata: Dict[str, Dict[str, Any]],
    ) -> LilyPondClassificationDataset:
        tokenizer = self._ensure_tokenizer()
        language_dir = Path(self.config.data_dir) / self.config.language
        movement_files = [
            str(language_dir / f"{movement_id}.ly") for movement_id in movement_ids
        ]

        return LilyPondClassificationDataset(
            movement_files=movement_files,
            metadata=metadata,
            tokenizer=tokenizer,
            max_length=self.config.max_length,
            stride=self.config.stride,
            task=self.config.task,
        )

    def _ensure_tokenizer(self):
        if self.tokenizer is not None:
            return self.tokenizer
        self.tokenizer = PreTrainedTokenizerFast.from_pretrained(
            self.config.tokenizer_path
        )
        return self.tokenizer

    def _train_and_evaluate_fold(
        self,
        fold_index: int,
        train_dataset: LilyPondClassificationDataset,
        val_dataset: LilyPondClassificationDataset,
    ) -> Dict[str, float]:
        multi_label = self.config.task in self.MULTI_LABEL_TASKS
        num_classes = self._infer_num_classes(train_dataset, val_dataset)
        model = self._build_model(num_classes=num_classes, multi_label=multi_label).to(
            self.device
        )

        train_loader = DataLoader(
            train_dataset,
            batch_size=self.config.per_device_train_batch_size,
            shuffle=True,
        )
        val_loader = DataLoader(
            val_dataset,
            batch_size=self.config.per_device_eval_batch_size,
            shuffle=False,
        )

        optimizer = AdamW(
            model.parameters(),
            lr=self.config.learning_rate,
            weight_decay=self.config.weight_decay,
        )

        best_val_loss = float("inf")
        patience_count = 0

        for _ in range(self.config.num_train_epochs):
            model.train()
            for batch in train_loader:
                optimizer.zero_grad()
                labels = batch["label"].to(self.device)
                outputs = model(
                    input_ids=batch["input_ids"].to(self.device),
                    attention_mask=batch["attention_mask"].to(self.device),
                    labels=labels,
                )
                loss = outputs["loss"]
                loss.backward()
                optimizer.step()

            val_metrics = self._evaluate(model, val_loader, multi_label)
            val_loss = val_metrics["val_loss"]

            if val_loss < best_val_loss:
                best_val_loss = val_loss
                patience_count = 0
            else:
                patience_count += 1
                if patience_count >= self.config.early_stopping_patience:
                    break

        val_metrics["fold"] = float(fold_index)
        return val_metrics

    def _evaluate(
        self, model: torch.nn.Module, val_loader: DataLoader, multi_label: bool
    ) -> Dict[str, float]:
        model.eval()

        losses: List[float] = []
        probs_per_window: List[np.ndarray] = []
        labels_per_window: List[np.ndarray] = []
        movement_ids_per_window: List[str] = []

        with torch.no_grad():
            for batch in val_loader:
                labels = batch["label"].to(self.device)
                outputs = model(
                    input_ids=batch["input_ids"].to(self.device),
                    attention_mask=batch["attention_mask"].to(self.device),
                    labels=labels,
                )
                losses.append(float(outputs["loss"].item()))

                logits = outputs["logits"].detach().cpu()
                if multi_label:
                    probs = torch.sigmoid(logits).numpy()
                else:
                    probs = torch.softmax(logits, dim=-1).numpy()

                probs_per_window.extend(list(probs))
                labels_per_window.extend(list(labels.detach().cpu().numpy()))
                movement_ids_per_window.extend(list(batch["movement_id"]))

        average_metrics = self._aggregate_metrics(
            probs_per_window,
            labels_per_window,
            movement_ids_per_window,
            method="average",
            multi_label=multi_label,
        )
        majority_metrics = self._aggregate_metrics(
            probs_per_window,
            labels_per_window,
            movement_ids_per_window,
            method="majority",
            multi_label=multi_label,
        )

        return {
            "val_loss": float(mean(losses)) if losses else 0.0,
            "avg_score": float(average_metrics["score"]),
            "majority_score": float(majority_metrics["score"]),
        }

    def _aggregate_metrics(
        self,
        probs_per_window: Sequence[np.ndarray],
        labels_per_window: Sequence[np.ndarray],
        movement_ids: Sequence[str],
        method: str,
        multi_label: bool,
    ) -> Dict[str, float]:
        grouped_probs: Dict[str, List[np.ndarray]] = defaultdict(list)
        grouped_labels: Dict[str, List[np.ndarray]] = defaultdict(list)

        for movement_id, probs, label in zip(
            movement_ids, probs_per_window, labels_per_window
        ):
            grouped_probs[movement_id].append(np.asarray(probs))
            grouped_labels[movement_id].append(np.asarray(label))

        y_true: List[np.ndarray] = []
        y_pred: List[np.ndarray] = []

        for movement_id in grouped_probs:
            window_probs = np.asarray(grouped_probs[movement_id])
            window_labels = np.asarray(grouped_labels[movement_id])
            true_label = window_labels[0]

            if method == "average":
                pred = self.window_aggregator.average_probabilities(
                    window_probs,
                    multi_label=multi_label,
                )
            else:
                pred = self.window_aggregator.majority_vote(
                    window_probs,
                    multi_label=multi_label,
                )

            y_true.append(np.asarray(true_label))
            y_pred.append(np.asarray(pred))

        if multi_label:
            y_true_arr = np.vstack(y_true)
            y_pred_arr = np.vstack(y_pred)
            metric_values = self.classification_metrics.compute_multi_label(
                y_true=y_true_arr,
                y_pred=y_pred_arr,
            )
            score = metric_values["f1_micro"]
        else:
            y_true_arr = np.array([int(v) for v in y_true])
            y_pred_arr = np.array([int(v) for v in y_pred])
            metric_values = self.classification_metrics.compute_single_label(
                y_true=y_true_arr,
                y_pred=y_pred_arr,
            )
            score = metric_values["accuracy"]

        return {"score": float(score)}

    def _infer_num_classes(
        self,
        train_dataset: LilyPondClassificationDataset,
        val_dataset: LilyPondClassificationDataset,
    ) -> int:
        if self.config.task == "composer":
            return 70
        if self.config.task == "musical_form":
            return 17
        if self.config.task == "instruments":
            return 25
        if self.config.task == "section_nomenclature":
            return 47
        if self.config.task == "key_scale":
            return 24

        labels = []
        for dataset in (train_dataset, val_dataset):
            for idx in range(len(dataset)):
                label = dataset[idx]["label"]
                if torch.is_tensor(label):
                    labels.extend(torch.where(label > 0)[0].tolist())
                else:
                    labels.append(int(label))
        return max(labels) + 1 if labels else 1

    def _build_model(self, num_classes: int, multi_label: bool) -> torch.nn.Module:
        if self.model_factory is not None:
            return self.model_factory(num_classes, multi_label)

        task = self.config.task
        kwargs = {
            "vocab_size": self._tokenizer_vocab_size(),
            "mode": self.config.mode,
            "pretrained": self.config.pretrained_model,
            "lora_r": self.config.lora_r,
            "lora_alpha": self.config.lora_alpha,
        }

        if task == "composer":
            return ComposerClassifier(num_classes=num_classes, **kwargs)
        if task == "musical_form":
            return MusicalFormClassifier(num_classes=num_classes, **kwargs)
        if task == "instruments":
            return InstrumentsClassifier(num_classes=num_classes, **kwargs)
        if task == "section_nomenclature":
            return SectionNomenclatureClassifier(num_classes=num_classes, **kwargs)
        if task == "key_scale":
            return KeyScaleClassifier(num_classes=num_classes, **kwargs)

        return LilyBERTClassifier(
            num_classes=num_classes, multi_label=multi_label, **kwargs
        )

    def _tokenizer_vocab_size(self) -> int:
        tokenizer = self._ensure_tokenizer()
        vocab = getattr(tokenizer, "vocab_size", None)
        if vocab is not None:
            return int(vocab)
        get_vocab = getattr(tokenizer, "get_vocab", None)
        if callable(get_vocab):
            return len(get_vocab())
        return 8000

    def _stratify_label(self, movement_meta: Dict[str, Any]) -> str:
        labels = (
            movement_meta.get("labels", {}) if isinstance(movement_meta, dict) else {}
        )

        if self.config.task == "composer":
            value = labels.get("composer", "unknown")
            return str(value).lower()

        if self.config.task == "section_nomenclature":
            return str(movement_meta.get("section_nomenclature", "unknown")).lower()

        if self.config.task == "key_scale":
            meta = labels.get("meta", {}) if isinstance(labels, dict) else {}
            key = str(meta.get("key", "do")).lower()
            scale = str(meta.get("scale", "major")).lower()
            return f"{key}_{scale}"

        values = labels.get(
            (
                "musical_form"
                if self.config.task == "musical_form"
                else "midi_instruments"
            ),
            [],
        )
        if not values:
            return "unknown"
        normalized = sorted(str(v).lower() for v in values)
        return "|".join(normalized)

    @staticmethod
    def _summarize_fold_metrics(
        fold_metrics: List[Dict[str, float]],
    ) -> tuple[Dict[str, float], Dict[str, float]]:
        numeric_keys = (
            [key for key in fold_metrics[0].keys() if key != "fold"]
            if fold_metrics
            else []
        )
        mean_metrics: Dict[str, float] = {}
        std_metrics: Dict[str, float] = {}

        for key in numeric_keys:
            values = [float(metrics[key]) for metrics in fold_metrics]
            mean_metrics[key] = float(mean(values))
            std_metrics[key] = float(stdev(values)) if len(values) > 1 else 0.0

        return mean_metrics, std_metrics
