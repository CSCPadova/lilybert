"""Grouped stratified CV linear-probing trainer for lilyBERT embeddings."""

from __future__ import annotations

import json
import pickle
from collections import defaultdict
from pathlib import Path
from statistics import mean, stdev
from typing import Any, Dict, List, Optional, Sequence

import numpy as np
import torch
from sklearn.linear_model import LogisticRegression
from sklearn.multiclass import OneVsRestClassifier
from torch.utils.data import DataLoader
from transformers import PreTrainedTokenizerFast

try:
    import wandb
except Exception:  # pragma: no cover
    wandb = None

from lilybert.data import BaroqueMusicClassificationDataset
from lilybert.evaluation import ClassificationMetrics
from lilybert.models import LilyBERTEncoder

from .config import TrainingConfig
from .cross_validation import build_grouped_stratified_folds


class StratifiedKFoldTrainer:
    """Run grouped stratified CV with frozen encoder embeddings + linear probe."""

    MULTI_LABEL_TASKS = {"instrument"}

    def __init__(
        self,
        config: TrainingConfig,
        tokenizer: Optional[Any] = None,
        model_factory: Optional[Any] = None,
        device: Optional[str] = None,
    ):
        self.config = config
        self.tokenizer = tokenizer
        self.model_factory = model_factory
        self.device = torch.device(
            device or ("cuda" if torch.cuda.is_available() else "cpu")
        )
        self.classification_metrics = ClassificationMetrics(top_k=config.top_k)

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

        encoder = self._load_encoder()

        fold_metrics: List[Dict[str, Any]] = []
        for fold_index, fold in enumerate(folds, start=1):
            train_dataset = self._build_dataset(fold["train_ids"], metadata)
            val_dataset = self._build_dataset(fold["val_ids"], metadata)
            metrics = self._train_and_evaluate_fold(
                fold_index=fold_index,
                encoder=encoder,
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
            "mode": "linear_probe",
            "n_folds": self.config.n_folds,
            "fold_metrics": fold_metrics,
            "mean": summary_mean,
            "std": summary_std,
            "results_path": str(results_path),
        }
        results_path.write_text(json.dumps(results, indent=2), encoding="utf-8")
        return results

    def _load_encoder(self) -> LilyBERTEncoder:
        encoder = LilyBERTEncoder.from_pretrained(self.config.pretrained_model)
        encoder.to(self.device)
        encoder.eval()
        for parameter in encoder.parameters():
            parameter.requires_grad = False
        return encoder

    def _load_metadata(self) -> Dict[str, Dict[str, Any]]:
        metadata_path = Path(self.config.data_dir) / "metadata.json"
        if not metadata_path.exists():
            raise FileNotFoundError(
                f"metadata.json not found in {self.config.data_dir}"
            )
        return json.loads(metadata_path.read_text(encoding="utf-8"))

    def _prepare_cv_samples(self, metadata: Dict[str, Dict[str, Any]]):
        data_dir = Path(self.config.data_dir)
        if not data_dir.exists():
            raise FileNotFoundError(f"Data directory not found: {data_dir}")

        sample_ids: List[str] = []
        labels: List[str] = []
        groups: List[str] = []

        for movement_file in sorted(data_dir.glob("*.ly")):
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
    ) -> BaroqueMusicClassificationDataset:
        tokenizer = self._ensure_tokenizer()
        data_dir = Path(self.config.data_dir)
        movement_files = [
            str(data_dir / f"{movement_id}.ly") for movement_id in movement_ids
        ]

        return BaroqueMusicClassificationDataset(
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

    def _extract_movement_embeddings(
        self,
        dataset: BaroqueMusicClassificationDataset,
        encoder: LilyBERTEncoder,
    ) -> tuple[np.ndarray, np.ndarray]:
        loader = DataLoader(
            dataset,
            batch_size=64,
            shuffle=False,
            num_workers=self.config.dataloader_num_workers,
        )

        movement_sums: Dict[str, np.ndarray] = {}
        movement_counts: Dict[str, int] = defaultdict(int)
        movement_labels: Dict[str, np.ndarray] = {}

        with torch.no_grad():
            for batch in loader:
                input_ids = batch["input_ids"].to(self.device)
                attention_mask = batch["attention_mask"].to(self.device)
                pooled = encoder.encode(
                    input_ids=input_ids, attention_mask=attention_mask
                )
                pooled_np = pooled.detach().cpu().numpy()

                labels = batch["label"]
                movement_ids = batch["movement_id"]

                for idx, movement_id in enumerate(movement_ids):
                    emb = pooled_np[idx]
                    if movement_id in movement_sums:
                        movement_sums[movement_id] += emb
                    else:
                        movement_sums[movement_id] = emb.copy()
                    movement_counts[movement_id] += 1

                    if movement_id not in movement_labels:
                        label_tensor = labels[idx]
                        if torch.is_tensor(label_tensor):
                            movement_labels[movement_id] = (
                                label_tensor.detach().cpu().numpy()
                            )
                        else:
                            movement_labels[movement_id] = np.asarray(label_tensor)

        ordered_ids = sorted(movement_sums.keys())
        x = np.vstack(
            [
                movement_sums[movement_id] / max(1, movement_counts[movement_id])
                for movement_id in ordered_ids
            ]
        )
        y = np.asarray([movement_labels[movement_id] for movement_id in ordered_ids])

        if y.ndim == 2 and y.shape[1] == 1:
            y = y.reshape(-1)
        return x, y

    def _train_and_evaluate_fold(
        self,
        fold_index: int,
        encoder: LilyBERTEncoder,
        train_dataset: BaroqueMusicClassificationDataset,
        val_dataset: BaroqueMusicClassificationDataset,
    ) -> Dict[str, Any]:
        multi_label = self.config.task in self.MULTI_LABEL_TASKS

        x_train, y_train = self._extract_movement_embeddings(train_dataset, encoder)
        x_val, y_val = self._extract_movement_embeddings(val_dataset, encoder)

        if multi_label:
            classifier = OneVsRestClassifier(
                LogisticRegression(
                    max_iter=self.config.probe_max_iter,
                    C=self.config.probe_c,
                    class_weight=self.config.probe_class_weight,
                )
            )
            classifier.fit(x_train, y_train)
            y_pred = classifier.predict(x_val)
            metrics = self.classification_metrics.compute_multi_label(
                y_true=y_val, y_pred=y_pred
            )
            fold_result = {
                **{f"avg_{key}": float(value) for key, value in metrics.items()},
                "best_selection_metric": "avg_f1_micro",
                "best_selection_mode": "max",
                "best_selection_value": float(metrics["f1_micro"]),
                "best_selection_step": 1,
            }
        else:
            classifier = LogisticRegression(
                max_iter=self.config.probe_max_iter,
                C=self.config.probe_c,
                class_weight=self.config.probe_class_weight,
            )
            classifier.fit(x_train, y_train)
            y_pred = classifier.predict(x_val)
            y_probs = classifier.predict_proba(x_val)
            metrics = self.classification_metrics.compute_single_label(
                y_true=y_val,
                y_pred=y_pred,
                y_probs=y_probs,
            )
            fold_result = {
                **{f"avg_{key}": float(value) for key, value in metrics.items()},
                "best_selection_metric": "avg_accuracy",
                "best_selection_mode": "max",
                "best_selection_value": float(metrics["accuracy"]),
                "best_selection_step": 1,
            }

        checkpoint_dir = self._save_probe_checkpoint(
            fold_index=fold_index,
            classifier=classifier,
            label_to_index=train_dataset.label_to_index,
        )
        fold_result["checkpoint_dir"] = str(checkpoint_dir)

        self._log_fold_wandb(fold_index=fold_index, metrics=fold_result)
        return fold_result

    def _save_probe_checkpoint(
        self,
        fold_index: int,
        classifier: Any,
        label_to_index: Dict[str, int],
    ) -> Path:
        checkpoint_dir = (
            Path(self.config.output_dir) / "checkpoints" / f"fold_{fold_index}" / "best"
        )
        checkpoint_dir.mkdir(parents=True, exist_ok=True)

        with (checkpoint_dir / "probe.pkl").open("wb") as handle:
            pickle.dump(classifier, handle)

        (checkpoint_dir / "config.json").write_text(
            json.dumps(
                {
                    "task": self.config.task,
                    "pretrained_model": self.config.pretrained_model,
                    "max_length": self.config.max_length,
                    "stride": self.config.stride,
                    "probe_max_iter": self.config.probe_max_iter,
                    "probe_c": self.config.probe_c,
                    "probe_class_weight": self.config.probe_class_weight,
                },
                indent=2,
            ),
            encoding="utf-8",
        )
        (checkpoint_dir / "label_map.json").write_text(
            json.dumps(
                {str(index): label for label, index in label_to_index.items()}, indent=2
            ),
            encoding="utf-8",
        )
        return checkpoint_dir

    def _log_fold_wandb(self, fold_index: int, metrics: Dict[str, Any]) -> None:
        if not self.config.wandb_enabled or wandb is None:
            return
        run = wandb.init(
            project=self.config.wandb_project,
            entity=self.config.wandb_entity,
            mode=self.config.wandb_mode,
            name=self.config.wandb_run_name or f"linear-probe-fold-{fold_index}",
            reinit=True,
            config={"fold": fold_index, **self.config.__dict__},
        )
        if run is not None:
            run.log(metrics)
            run.finish()

    def _summarize_fold_metrics(
        self,
        fold_metrics: List[Dict[str, Any]],
    ) -> tuple[Dict[str, float], Dict[str, float]]:
        tracked_keys = [
            key
            for key in fold_metrics[0].keys()
            if key.startswith("avg_") and isinstance(fold_metrics[0][key], (int, float))
        ]

        summary_mean: Dict[str, float] = {}
        summary_std: Dict[str, float] = {}
        for key in tracked_keys:
            values = [float(metrics[key]) for metrics in fold_metrics]
            summary_mean[key] = float(mean(values))
            summary_std[key] = float(stdev(values) if len(values) > 1 else 0.0)

        return summary_mean, summary_std

    def _stratify_label(self, movement_meta: Dict[str, Any]) -> str:
        labels = (
            movement_meta.get("labels", {}) if isinstance(movement_meta, dict) else {}
        )

        if self.config.task == "composer":
            return str(labels.get("composer", "unknown")).strip().lower()

        if self.config.task == "style":
            return str(labels.get("style", "unknown")).strip().lower()

        if self.config.task == "instrument":
            instruments = (
                labels.get("midi_instruments", []) if isinstance(labels, dict) else []
            )
            if not instruments:
                return "none"
            normalized = [str(item).strip().lower() for item in instruments]
            return "|".join(sorted(normalized))

        if self.config.task == "key_root":
            meta = labels.get("meta", {}) if isinstance(labels, dict) else {}
            return str(meta.get("key", "unknown")).strip().lower()

        raise ValueError(f"Unsupported task: {self.config.task}")
