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
from tqdm import tqdm
from transformers import PreTrainedTokenizerFast

try:
    import wandb
except Exception:  # pragma: no cover - optional runtime dependency
    wandb = None

from lilybert.data import BaroqueMusicClassificationDataset
from lilybert.data.pretokenized_dataset import PreTokenizedDataset
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
        print(f"Loaded metadata for {len(metadata)} movements")
        sample_ids, labels, groups = self._prepare_cv_samples(metadata)
        print(f"Prepared {len(sample_ids)} samples for {self.config.n_folds}-fold CV")

        folds = build_grouped_stratified_folds(
            sample_ids=sample_ids,
            labels=labels,
            groups=groups,
            n_splits=self.config.n_folds,
            seed=self.config.seed,
        )

        fold_metrics: List[Dict[str, float]] = []
        for fold_index, fold in enumerate(folds, start=1):
            print(
                f"\n--- Fold {fold_index}/{self.config.n_folds} "
                f"(train={len(fold['train_ids'])}, val={len(fold['val_ids'])}) ---"
            )
            print("Building train dataset...")
            train_dataset = self._build_dataset(fold["train_ids"], metadata)
            print("Building val dataset...")
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
    ):
        if self.config.pretokenized_path:
            return PreTokenizedDataset(
                npz_path=self.config.pretokenized_path,
                movement_ids=movement_ids,
            )

        tokenizer = self._ensure_tokenizer()
        language_dir = Path(self.config.data_dir) / self.config.language
        movement_files = [
            str(language_dir / f"{movement_id}.ly") for movement_id in movement_ids
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

    def _train_and_evaluate_fold(
        self,
        fold_index: int,
        train_dataset: BaroqueMusicClassificationDataset,
        val_dataset: BaroqueMusicClassificationDataset,
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
        steps_per_epoch = max(1, len(train_loader))
        total_steps = (
            self.config.max_steps
            if self.config.max_steps > 0
            else self.config.num_train_epochs * steps_per_epoch
        )

        run = self._start_wandb_run(
            fold_index=fold_index,
            total_steps=total_steps,
            num_classes=num_classes,
        )

        step = 0
        train_loss_window: List[float] = []
        val_metrics: Dict[str, float] = {
            "val_loss": 0.0,
            "avg_score": 0.0,
            "majority_score": 0.0,
        }

        pbar = tqdm(total=total_steps, desc=f"Fold {fold_index}", unit="step")
        train_iterator = iter(train_loader)
        while step < total_steps:
            model.train()
            try:
                batch = next(train_iterator)
            except StopIteration:
                train_iterator = iter(train_loader)
                batch = next(train_iterator)

            optimizer.zero_grad()
            labels = batch["label"].to(self.device)
            outputs = model(
                input_ids=batch["input_ids"].to(self.device),
                attention_mask=batch["attention_mask"].to(self.device),
                labels=labels,
            )
            loss = outputs["loss"]
            loss.backward()
            grad_norm = self._compute_grad_norm(model)
            optimizer.step()

            step += 1
            epoch = step / steps_per_epoch
            train_loss_value = float(loss.item())
            train_loss_window.append(train_loss_value)
            pbar.update(1)

            if step % self.config.log_steps == 0 or step == total_steps:
                window_avg = (
                    float(mean(train_loss_window)) if train_loss_window else 0.0
                )
                train_loss_window = []
                current_lr = optimizer.param_groups[0]["lr"]
                pbar.set_postfix(loss=f"{window_avg:.4f}", lr=f"{current_lr:.2e}")
                self._log_wandb(
                    run,
                    {
                        "train/loss": window_avg,
                        "train/learning_rate": current_lr,
                        "train/grad_norm": grad_norm,
                        "train/epoch": epoch,
                        "fold": float(fold_index),
                        "global_step": float(step),
                    },
                    step=step,
                )

            should_eval = (step % self.config.eval_steps == 0) or (step == total_steps)
            if should_eval:
                val_metrics = self._evaluate(model, val_loader, multi_label)
                log_payload = {
                    "fold": float(fold_index),
                    "global_step": float(step),
                    "train/epoch": epoch,
                    **{f"val/{k}": float(v) for k, v in val_metrics.items()},
                }
                self._log_wandb(run, log_payload, step=step)
                score_key = "avg_f1_micro" if multi_label else "avg_accuracy"
                score_val = val_metrics.get(score_key, 0.0)
                pbar.set_postfix(
                    loss=f"{window_avg:.4f}",
                    val_loss=f"{val_metrics['val_loss']:.4f}",
                    score=f"{score_val:.3f}",
                )

                val_loss = val_metrics["val_loss"]
                if val_loss < best_val_loss:
                    best_val_loss = val_loss
                    patience_count = 0
                else:
                    patience_count += 1
                    if patience_count >= self.config.early_stopping_patience:
                        break
        pbar.close()

        val_metrics["fold"] = float(fold_index)
        val_metrics["best_val_loss"] = float(best_val_loss)
        self._finish_wandb_run(run, val_metrics)
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
            **{
                f"avg_{key}": float(value)
                for key, value in average_metrics.items()
                if key != "score"
            },
            **{
                f"majority_{key}": float(value)
                for key, value in majority_metrics.items()
                if key != "score"
            },
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

        normalized_metrics = {
            key: float(value)
            for key, value in metric_values.items()
            if value is not None
        }
        normalized_metrics["score"] = float(score)
        return normalized_metrics

    def _start_wandb_run(
        self,
        fold_index: int,
        total_steps: int,
        num_classes: int,
    ):
        if not self.config.wandb_enabled or wandb is None:
            return None

        run_name = self.config.wandb_run_name or f"{self.config.task}-fold{fold_index}"
        return wandb.init(
            project=self.config.wandb_project,
            entity=self.config.wandb_entity,
            mode=self.config.wandb_mode,
            name=run_name,
            config={
                "task": self.config.task,
                "fold": fold_index,
                "n_folds": self.config.n_folds,
                "max_steps": total_steps,
                "num_train_epochs": self.config.num_train_epochs,
                "eval_steps": self.config.eval_steps,
                "log_steps": self.config.log_steps,
                "learning_rate": self.config.learning_rate,
                "weight_decay": self.config.weight_decay,
                "warmup_ratio": self.config.warmup_ratio,
                "batch_size": self.config.per_device_train_batch_size,
                "max_length": self.config.max_length,
                "stride": self.config.stride,
                "num_classes": num_classes,
                "mode": str(self.config.mode),
                "pretrained_model": self.config.pretrained_model,
                "language": self.config.language,
                "early_stopping_patience": self.config.early_stopping_patience,
                "seed": self.config.seed,
                "device": str(self.device),
            },
            reinit=True,
        )

    @staticmethod
    def _compute_grad_norm(model: torch.nn.Module) -> float:
        total_norm = 0.0
        for p in model.parameters():
            if p.grad is not None:
                total_norm += p.grad.data.norm(2).item() ** 2
        return total_norm**0.5

    @staticmethod
    def _log_wandb(run: Any, payload: Dict[str, float], step: int) -> None:
        if run is None:
            return
        run.log(payload, step=step)

    @staticmethod
    def _finish_wandb_run(run: Any, summary: Dict[str, float]) -> None:
        if run is None:
            return
        for key, value in summary.items():
            if isinstance(value, (int, float)):
                run.summary[key] = float(value)
        run.finish()

    def _infer_num_classes(
        self,
        train_dataset: BaroqueMusicClassificationDataset,
        val_dataset: BaroqueMusicClassificationDataset,
    ) -> int:
        train_labels = set(train_dataset.label_to_index.values())
        val_labels = set(val_dataset.label_to_index.values())
        all_labels = train_labels | val_labels
        return max(all_labels) + 1 if all_labels else 1

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
