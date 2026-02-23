"""Grouped stratified CV trainer for lilyBERT classification."""

from __future__ import annotations

import json
import platform
import random
import shutil
import subprocess
import sys
from collections import defaultdict
from pathlib import Path
from statistics import mean, stdev
from typing import Any, Callable, Dict, List, Optional, Sequence

import numpy as np
import torch
import torch.distributed as dist
from sklearn.metrics import (
    confusion_matrix,
    multilabel_confusion_matrix,
    precision_recall_fscore_support,
)
from torch.nn.parallel import DistributedDataParallel as DDP
from torch.optim import AdamW
from torch.utils.data import DataLoader, DistributedSampler
from tqdm import tqdm
from transformers import PreTrainedTokenizerFast, get_scheduler

try:
    from torch.distributed.fsdp import FullyShardedDataParallel as FSDP
    from torch.distributed.fsdp import ShardingStrategy
except ImportError:
    FSDP = None  # type: ignore[assignment,misc]
    ShardingStrategy = None  # type: ignore[assignment,misc]

try:
    import wandb
except Exception:  # pragma: no cover - optional runtime dependency
    wandb = None

from lilybert.data import BaroqueMusicClassificationDataset
from lilybert.data.pretokenized_dataset import PreTokenizedDataset
from lilybert.data.sharded_dataset import ShardedDataset
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
from .distributed import (
    DistributedContext,
    cleanup_distributed,
    gather_objects,
    gather_tensors,
    is_distributed,
    setup_distributed,
)

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

        # Distributed setup
        self.dist_ctx: Optional[DistributedContext] = None
        if is_distributed():
            self.dist_ctx = setup_distributed()
            self.device = torch.device(f"cuda:{self.dist_ctx.local_rank}")
        else:
            self.device = torch.device(
                device or ("cuda" if torch.cuda.is_available() else "cpu")
            )

        self.window_aggregator = WindowAggregator()
        self.classification_metrics = ClassificationMetrics(top_k=config.top_k)
        self._tb_writer = None

    @property
    def _is_main(self) -> bool:
        return self.dist_ctx is None or self.dist_ctx.is_main_process

    def run(self) -> Dict[str, Any]:
        metadata = self._load_metadata()
        if self._is_main:
            print(f"Loaded metadata for {len(metadata)} movements")
        sample_ids, labels, groups = self._prepare_cv_samples(metadata)
        if self._is_main:
            print(f"Prepared {len(sample_ids)} samples for {self.config.n_folds}-fold CV")

        folds = build_grouped_stratified_folds(
            sample_ids=sample_ids,
            labels=labels,
            groups=groups,
            n_splits=self.config.n_folds,
            seed=self.config.seed,
        )

        fold_metrics: List[Dict[str, Any]] = []
        for fold_index, fold in enumerate(folds, start=1):
            if self._is_main:
                print(
                    f"\n--- Fold {fold_index}/{self.config.n_folds} "
                    f"(train={len(fold['train_ids'])}, val={len(fold['val_ids'])}) ---"
                )
                print("Building train dataset...")
            train_dataset = self._build_dataset(fold["train_ids"], metadata)
            if self._is_main:
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
        if self._is_main:
            results_path.write_text(json.dumps(results, indent=2), encoding="utf-8")

        if self.dist_ctx is not None:
            cleanup_distributed()

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
        if self.config.sharded_data_dir:
            manifest_path = str(
                Path(self.config.sharded_data_dir) / "manifest.json"
            )
            return ShardedDataset(
                manifest_path=manifest_path,
                movement_ids=movement_ids,
            )

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

    def _wrap_model(self, model: torch.nn.Module) -> torch.nn.Module:
        """Wrap model with DDP or FSDP when running distributed."""
        if self.dist_ctx is None:
            return model

        if self.config.use_fsdp:
            if FSDP is None:
                raise ImportError(
                    "FSDP requires PyTorch >= 1.12. "
                    "Install a compatible version or set use_fsdp=False."
                )
            strategy_name = self.config.fsdp_sharding_strategy.upper()
            strategy = getattr(ShardingStrategy, strategy_name, ShardingStrategy.FULL_SHARD)
            return FSDP(model, sharding_strategy=strategy)

        return DDP(model, device_ids=[self.dist_ctx.local_rank])

    def _train_and_evaluate_fold(
        self,
        fold_index: int,
        train_dataset: BaroqueMusicClassificationDataset,
        val_dataset: BaroqueMusicClassificationDataset,
    ) -> Dict[str, Any]:
        multi_label = self.config.task in self.MULTI_LABEL_TASKS
        num_classes = self._infer_num_classes(train_dataset, val_dataset)
        model = self._build_model(num_classes=num_classes, multi_label=multi_label).to(
            self.device
        )
        model = self._wrap_model(model)

        # DataLoader setup — use DistributedSampler when distributed
        if self.dist_ctx is not None:
            train_sampler = DistributedSampler(
                train_dataset, shuffle=True, seed=self.config.seed,
            )
            val_sampler = DistributedSampler(val_dataset, shuffle=False)
            train_loader = DataLoader(
                train_dataset,
                batch_size=self.config.per_device_train_batch_size,
                sampler=train_sampler,
                num_workers=self.config.dataloader_num_workers,
            )
            val_loader = DataLoader(
                val_dataset,
                batch_size=self.config.per_device_eval_batch_size,
                sampler=val_sampler,
                num_workers=self.config.dataloader_num_workers,
            )
        else:
            train_sampler = None
            val_sampler = None
            train_loader = DataLoader(
                train_dataset,
                batch_size=self.config.per_device_train_batch_size,
                shuffle=True,
                num_workers=self.config.dataloader_num_workers,
            )
            val_loader = DataLoader(
                val_dataset,
                batch_size=self.config.per_device_eval_batch_size,
                shuffle=False,
                num_workers=self.config.dataloader_num_workers,
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
        warmup_steps = int(self.config.warmup_ratio * total_steps)
        scheduler = get_scheduler(
            name=self.config.lr_scheduler_type,
            optimizer=optimizer,
            num_warmup_steps=warmup_steps,
            num_training_steps=total_steps,
        )

        selection_metric, selection_mode = self._resolve_selection_metric(multi_label)
        best_selection_value = (
            float("-inf") if selection_mode == "max" else float("inf")
        )
        best_selection_step = 0

        label_map = self._index_to_label_map(train_dataset)
        class_names = [label_map.get(i, f"class_{i}") for i in range(num_classes)]

        run = (
            self._start_wandb_run(
                fold_index=fold_index,
                total_steps=total_steps,
                num_classes=num_classes,
            )
            if self._is_main
            else None
        )

        step = 0
        train_loss_window: List[float] = []
        window_avg = 0.0
        val_metrics: Dict[str, float] = {
            "val_loss": 0.0,
            "avg_score": 0.0,
            "majority_score": 0.0,
        }
        best_checkpoint_dir: Optional[Path] = None

        pbar = tqdm(
            total=total_steps,
            desc=f"Fold {fold_index}",
            unit="step",
            disable=not self._is_main,
        )
        epoch_counter = 0
        if train_sampler is not None:
            train_sampler.set_epoch(epoch_counter)
        train_iterator = iter(train_loader)
        while step < total_steps:
            model.train()
            try:
                batch = next(train_iterator)
            except StopIteration:
                epoch_counter += 1
                if train_sampler is not None:
                    train_sampler.set_epoch(epoch_counter)
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
            if self.config.grad_clip_norm is not None:
                torch.nn.utils.clip_grad_norm_(
                    model.parameters(),
                    max_norm=float(self.config.grad_clip_norm),
                )
            grad_norm = self._compute_grad_norm(model)
            optimizer.step()
            scheduler.step()

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
                current_lr = (
                    float(scheduler.get_last_lr()[0])
                    if scheduler.get_last_lr()
                    else float(optimizer.param_groups[0]["lr"])
                )
                pbar.set_postfix(loss=f"{window_avg:.4f}", lr=f"{current_lr:.2e}")
                if self._is_main:
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
                val_metrics, eval_details = self._evaluate(
                    model,
                    val_loader,
                    multi_label,
                    return_details=True,
                    dataset_size=len(val_dataset),
                )
                if self._is_main:
                    log_payload = {
                        "fold": float(fold_index),
                        "global_step": float(step),
                        "train/epoch": epoch,
                        **{f"val/{k}": float(v) for k, v in val_metrics.items()},
                    }
                    self._log_wandb(run, log_payload, step=step)
                    if self.config.log_per_class_metrics:
                        self._log_wandb_eval_diagnostics(
                            run=run,
                            eval_details=eval_details,
                            class_names=class_names,
                            multi_label=multi_label,
                            step=step,
                        )
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

                selection_value = float(val_metrics.get(selection_metric, 0.0))
                if self._is_improved(
                    selection_value, best_selection_value, selection_mode
                ):
                    best_selection_value = selection_value
                    best_selection_step = int(step)
                    patience_count = 0
                    if self._is_main:
                        # Extract underlying model from DDP/FSDP wrapper
                        raw_model = (
                            model.module
                            if hasattr(model, "module")
                            else model
                        )
                        best_checkpoint_dir = self._save_best_checkpoint(
                            model=raw_model,
                            optimizer=optimizer,
                            scheduler=scheduler,
                            fold_index=fold_index,
                            step=step,
                            val_loss=val_loss,
                            selection_metric=selection_metric,
                            selection_mode=selection_mode,
                            selection_value=selection_value,
                            train_dataset=train_dataset,
                            num_classes=num_classes,
                            multi_label=multi_label,
                        )
                else:
                    patience_count += 1
                    if patience_count >= self.config.early_stopping_patience:
                        break
        pbar.close()

        val_metrics["fold"] = float(fold_index)
        val_metrics["best_val_loss"] = float(best_val_loss)
        val_metrics["best_selection_metric"] = selection_metric
        val_metrics["best_selection_mode"] = selection_mode
        val_metrics["best_selection_value"] = float(best_selection_value)
        val_metrics["best_selection_step"] = float(best_selection_step)
        if self._is_main:
            if best_checkpoint_dir is not None:
                val_metrics["best_checkpoint_dir"] = str(best_checkpoint_dir)
                self._upload_checkpoint_to_wandb(
                    run=run,
                    checkpoint_dir=best_checkpoint_dir,
                    fold_index=fold_index,
                    step=best_selection_step,
                    val_loss=best_val_loss,
                )
            self._finish_wandb_run(run, val_metrics)
        return val_metrics

    def _save_best_checkpoint(
        self,
        model: torch.nn.Module,
        optimizer: torch.optim.Optimizer,
        scheduler: Any,
        fold_index: int,
        step: int,
        val_loss: float,
        selection_metric: str,
        selection_mode: str,
        selection_value: float,
        train_dataset: BaroqueMusicClassificationDataset,
        num_classes: int,
        multi_label: bool,
    ) -> Path:
        checkpoint_dir = (
            Path(self.config.output_dir) / "checkpoints" / f"fold_{fold_index}" / "best"
        )
        checkpoint_dir.mkdir(parents=True, exist_ok=True)

        state_dict = {
            key: value.detach().cpu() if torch.is_tensor(value) else value
            for key, value in model.state_dict().items()
        }
        torch.save(state_dict, checkpoint_dir / "model.pt")

        checkpoint_config = {
            "task": self.config.task,
            "num_classes": int(num_classes),
            "multi_label": bool(multi_label),
            "fold": int(fold_index),
            "best_step": int(step),
            "best_val_loss": float(val_loss),
            "best_selection_metric": selection_metric,
            "best_selection_mode": selection_mode,
            "best_selection_value": float(selection_value),
            "max_length": int(self.config.max_length),
            "stride": int(self.config.stride),
            "runtime": self._runtime_metadata(),
        }
        (checkpoint_dir / "config.json").write_text(
            json.dumps(checkpoint_config, indent=2),
            encoding="utf-8",
        )

        label_map = {
            str(idx): label for label, idx in train_dataset.label_to_index.items()
        }
        (checkpoint_dir / "label_map.json").write_text(
            json.dumps(label_map, indent=2),
            encoding="utf-8",
        )

        tokenizer_dir = checkpoint_dir / "tokenizer"
        if tokenizer_dir.exists():
            shutil.rmtree(tokenizer_dir)

        tokenizer = self._ensure_tokenizer()
        save_pretrained = getattr(tokenizer, "save_pretrained", None)
        if callable(save_pretrained):
            save_pretrained(str(tokenizer_dir))
        else:
            source_tokenizer_dir = Path(self.config.tokenizer_path)
            if source_tokenizer_dir.exists():
                shutil.copytree(source_tokenizer_dir, tokenizer_dir)

        training_state = {
            "global_step": int(step),
            "optimizer_state_dict": optimizer.state_dict(),
            "scheduler_state_dict": (
                scheduler.state_dict() if hasattr(scheduler, "state_dict") else None
            ),
            "python_random_state": random.getstate(),
            "numpy_random_state": np.random.get_state(),
            "torch_rng_state": torch.get_rng_state(),
            "torch_cuda_rng_state_all": (
                torch.cuda.get_rng_state_all() if torch.cuda.is_available() else None
            ),
        }
        torch.save(training_state, checkpoint_dir / "training_state.pt")

        return checkpoint_dir

    def _upload_checkpoint_to_wandb(
        self,
        run: Any,
        checkpoint_dir: Path,
        fold_index: int,
        step: int,
        val_loss: float,
    ) -> None:
        if run is None or wandb is None:
            return
        artifact_cls = getattr(wandb, "Artifact", None)
        if artifact_cls is None:
            return

        artifact = artifact_cls(
            name=f"{self.config.task}-fold{fold_index}-best-checkpoint",
            type="model",
            metadata={
                "task": self.config.task,
                "fold": int(fold_index),
                "step": int(step),
                "best_val_loss": float(val_loss),
                "mode": str(self.config.mode),
            },
        )
        artifact.add_dir(str(checkpoint_dir))
        run.log_artifact(artifact, aliases=["best", f"step-{step}"])

    def _evaluate(
        self,
        model: torch.nn.Module,
        val_loader: DataLoader,
        multi_label: bool,
        return_details: bool = False,
        dataset_size: int = 0,
    ) -> Any:
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

                logits = outputs["logits"].detach().cpu().numpy()
                probs_per_window.extend(list(logits))
                labels_per_window.extend(list(labels.detach().cpu().numpy()))
                movement_ids_per_window.extend(list(batch["movement_id"]))

        # Gather predictions across ranks in distributed mode
        if self.dist_ctx is not None:
            all_probs_lists = gather_objects(probs_per_window, self.dist_ctx.world_size)
            all_labels_lists = gather_objects(labels_per_window, self.dist_ctx.world_size)
            all_mids_lists = gather_objects(movement_ids_per_window, self.dist_ctx.world_size)
            all_losses_lists = gather_objects(losses, self.dist_ctx.world_size)

            # Flatten gathered lists
            probs_per_window = [p for rank_list in all_probs_lists for p in rank_list]
            labels_per_window = [l for rank_list in all_labels_lists for l in rank_list]
            movement_ids_per_window = [m for rank_list in all_mids_lists for m in rank_list]
            losses = [lo for rank_list in all_losses_lists for lo in rank_list]

            # Truncate padding from DistributedSampler
            if dataset_size > 0 and len(probs_per_window) > dataset_size:
                probs_per_window = probs_per_window[:dataset_size]
                labels_per_window = labels_per_window[:dataset_size]
                movement_ids_per_window = movement_ids_per_window[:dataset_size]

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

        metrics = {
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

        if not return_details:
            return metrics

        avg_true, avg_pred, _ = self._aggregate_predictions(
            probs_per_window,
            labels_per_window,
            movement_ids_per_window,
            method="average",
            multi_label=multi_label,
        )
        majority_true, majority_pred, _ = self._aggregate_predictions(
            probs_per_window,
            labels_per_window,
            movement_ids_per_window,
            method="majority",
            multi_label=multi_label,
        )

        details = {
            "average": {"y_true": avg_true, "y_pred": avg_pred},
            "majority": {"y_true": majority_true, "y_pred": majority_pred},
        }
        return metrics, details

    def _aggregate_predictions(
        self,
        probs_per_window: Sequence[np.ndarray],
        labels_per_window: Sequence[np.ndarray],
        movement_ids: Sequence[str],
        method: str,
        multi_label: bool,
    ) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
        grouped_probs: Dict[str, List[np.ndarray]] = defaultdict(list)
        grouped_labels: Dict[str, List[np.ndarray]] = defaultdict(list)

        for movement_id, probs, label in zip(
            movement_ids, probs_per_window, labels_per_window
        ):
            grouped_probs[movement_id].append(np.asarray(probs))
            grouped_labels[movement_id].append(np.asarray(label))

        y_true: List[np.ndarray] = []
        y_pred: List[np.ndarray] = []
        y_probs: List[np.ndarray] = []

        for movement_id in grouped_probs:
            window_probs = np.asarray(grouped_probs[movement_id])
            window_labels = np.asarray(grouped_labels[movement_id])
            true_label = window_labels[0]

            averaged_probs = window_probs.mean(axis=0)

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
            y_probs.append(averaged_probs)

        if multi_label:
            return np.vstack(y_true), np.vstack(y_pred), np.vstack(y_probs)

        y_true_arr = np.array([int(v) for v in y_true], dtype=np.int64)
        y_pred_arr = np.array([int(v) for v in y_pred], dtype=np.int64)
        y_probs_arr = np.vstack(y_probs)
        return y_true_arr, y_pred_arr, y_probs_arr

    def _aggregate_metrics(
        self,
        probs_per_window: Sequence[np.ndarray],
        labels_per_window: Sequence[np.ndarray],
        movement_ids: Sequence[str],
        method: str,
        multi_label: bool,
    ) -> Dict[str, float]:
        y_true_arr, y_pred_arr, y_probs_arr = self._aggregate_predictions(
            probs_per_window=probs_per_window,
            labels_per_window=labels_per_window,
            movement_ids=movement_ids,
            method=method,
            multi_label=multi_label,
        )

        if multi_label:
            metric_values = self.classification_metrics.compute_multi_label(
                y_true=y_true_arr,
                y_pred=y_pred_arr,
            )
            score = metric_values["f1_micro"]
        else:
            metric_values = self.classification_metrics.compute_single_label(
                y_true=y_true_arr,
                y_pred=y_pred_arr,
                y_probs=y_probs_arr,
            )
            score = metric_values["accuracy"]

        normalized_metrics = {
            key: float(value)
            for key, value in metric_values.items()
            if value is not None
        }
        normalized_metrics["score"] = float(score)
        return normalized_metrics

    def _resolve_selection_metric(self, multi_label: bool) -> tuple[str, str]:
        if self.config.model_selection_metric == "auto":
            metric = "avg_f1_micro" if multi_label else "avg_accuracy"
        else:
            metric = str(self.config.model_selection_metric)

        if self.config.model_selection_mode == "auto":
            mode = "min" if "loss" in metric else "max"
        else:
            mode = str(self.config.model_selection_mode)

        return metric, mode

    @staticmethod
    def _is_improved(current: float, best: float, mode: str) -> bool:
        if mode == "min":
            return current < best
        return current > best

    @staticmethod
    def _index_to_label_map(dataset: Any) -> Dict[int, str]:
        label_to_index = getattr(dataset, "label_to_index", {}) or {}
        return {int(idx): str(label) for label, idx in label_to_index.items()}

    def _log_wandb_eval_diagnostics(
        self,
        run: Any,
        eval_details: Dict[str, Dict[str, np.ndarray]],
        class_names: Sequence[str],
        multi_label: bool,
        step: int,
    ) -> None:
        if run is None:
            return

        for method, details in eval_details.items():
            y_true = np.asarray(details["y_true"])
            y_pred = np.asarray(details["y_pred"])
            if y_true.size == 0 or y_pred.size == 0:
                continue

            if multi_label:
                precision, recall, f1, _ = precision_recall_fscore_support(
                    y_true,
                    y_pred,
                    average=None,
                    zero_division=0,
                )
                payload: Dict[str, float] = {}
                for idx, class_name in enumerate(class_names):
                    payload[f"val/{method}/per_class/{class_name}/precision"] = float(
                        precision[idx]
                    )
                    payload[f"val/{method}/per_class/{class_name}/recall"] = float(
                        recall[idx]
                    )
                    payload[f"val/{method}/per_class/{class_name}/f1"] = float(f1[idx])

                ml_cm = multilabel_confusion_matrix(y_true, y_pred)
                for idx, class_name in enumerate(class_names):
                    tn, fp, fn, tp = ml_cm[idx].ravel()
                    payload[f"val/{method}/confusion/{class_name}/tn"] = float(tn)
                    payload[f"val/{method}/confusion/{class_name}/fp"] = float(fp)
                    payload[f"val/{method}/confusion/{class_name}/fn"] = float(fn)
                    payload[f"val/{method}/confusion/{class_name}/tp"] = float(tp)

                self._log_wandb(run, payload, step=step)
                continue

            precision, recall, f1, support = precision_recall_fscore_support(
                y_true,
                y_pred,
                labels=list(range(len(class_names))),
                average=None,
                zero_division=0,
            )
            payload = {}
            for idx, class_name in enumerate(class_names):
                payload[f"val/{method}/per_class/{class_name}/precision"] = float(
                    precision[idx]
                )
                payload[f"val/{method}/per_class/{class_name}/recall"] = float(
                    recall[idx]
                )
                payload[f"val/{method}/per_class/{class_name}/f1"] = float(f1[idx])
                payload[f"val/{method}/per_class/{class_name}/support"] = float(
                    support[idx]
                )
            self._log_wandb(run, payload, step=step)

            cm_arr = confusion_matrix(
                y_true,
                y_pred,
                labels=list(range(len(class_names))),
            )
            self._log_wandb(
                run,
                {
                    f"val/{method}/confusion_matrix_total": float(cm_arr.sum()),
                    f"val/{method}/confusion_matrix_trace": float(np.trace(cm_arr)),
                },
                step=step,
            )

            if wandb is not None and hasattr(wandb, "plot"):
                try:
                    cm_plot = wandb.plot.confusion_matrix(
                        probs=None,
                        y_true=y_true.tolist(),
                        preds=y_pred.tolist(),
                        class_names=list(class_names),
                    )
                    self._log_wandb(
                        run,
                        {f"val/{method}/confusion_matrix": cm_plot},
                        step=step,
                    )
                except Exception:
                    pass

    def _runtime_metadata(self) -> Dict[str, Any]:
        metadata: Dict[str, Any] = {
            "python_version": sys.version.split()[0],
            "platform": platform.platform(),
            "torch_version": getattr(torch, "__version__", None),
            "numpy_version": getattr(np, "__version__", None),
            "cuda_available": bool(torch.cuda.is_available()),
            "cuda_device_count": int(torch.cuda.device_count()),
            "cuda_device_name": (
                torch.cuda.get_device_name(0) if torch.cuda.is_available() else None
            ),
            "transformers_version": self._module_version("transformers"),
            "accelerate_version": self._module_version("accelerate"),
            "wandb_version": self._module_version("wandb"),
            "git_commit": self._git_commit_hash(),
        }
        return metadata

    @staticmethod
    def _module_version(module_name: str) -> Optional[str]:
        try:
            module = __import__(module_name)
            return str(getattr(module, "__version__", "unknown"))
        except Exception:
            return None

    @staticmethod
    def _git_commit_hash() -> Optional[str]:
        try:
            completed = subprocess.run(
                ["git", "rev-parse", "HEAD"],
                check=True,
                capture_output=True,
                text=True,
            )
            return completed.stdout.strip()
        except Exception:
            return None

    def _start_wandb_run(
        self,
        fold_index: int,
        total_steps: int,
        num_classes: int,
    ):
        # Tensorboard
        if self.config.tensorboard_enabled:
            from torch.utils.tensorboard import SummaryWriter

            tb_dir = Path(self.config.tensorboard_log_dir) / f"fold{fold_index}"
            tb_dir.mkdir(parents=True, exist_ok=True)
            self._tb_writer = SummaryWriter(log_dir=str(tb_dir))

        if not self.config.wandb_enabled or wandb is None:
            return None

        run_name = self.config.wandb_run_name or f"{self.config.task}-fold{fold_index}"
        runtime_metadata = self._runtime_metadata()

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
                "lr_scheduler_type": self.config.lr_scheduler_type,
                "grad_clip_norm": self.config.grad_clip_norm,
                "model_selection_metric": self.config.model_selection_metric,
                "model_selection_mode": self.config.model_selection_mode,
                **{f"runtime/{k}": v for k, v in runtime_metadata.items()},
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

    def _log_wandb(self, run: Any, payload: Dict[str, Any], step: int) -> None:
        if run is not None:
            run.log(payload, step=step)
        if self._tb_writer is not None:
            for key, value in payload.items():
                if isinstance(value, (int, float)):
                    self._tb_writer.add_scalar(key, value, global_step=step)

    def _finish_wandb_run(self, run: Any, summary: Dict[str, Any]) -> None:
        if run is not None:
            for key, value in summary.items():
                if isinstance(value, (int, float)):
                    run.summary[key] = float(value)
            run.finish()
        if self._tb_writer is not None:
            self._tb_writer.close()
            self._tb_writer = None

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
        fold_metrics: List[Dict[str, Any]],
    ) -> tuple[Dict[str, float], Dict[str, float]]:
        numeric_keys = []
        if fold_metrics:
            for key in fold_metrics[0].keys():
                if key == "fold":
                    continue
                values = [metrics.get(key) for metrics in fold_metrics]
                if all(isinstance(value, (int, float)) for value in values):
                    numeric_keys.append(key)
        mean_metrics: Dict[str, float] = {}
        std_metrics: Dict[str, float] = {}

        for key in numeric_keys:
            values = [float(metrics[key]) for metrics in fold_metrics]
            mean_metrics[key] = float(mean(values))
            std_metrics[key] = float(stdev(values)) if len(values) > 1 else 0.0

        return mean_metrics, std_metrics
