"""MLM training for LilyPond corpora."""

from __future__ import annotations

import json
import os
import random
from pathlib import Path
from typing import Any, Dict, List, Tuple

import torch
import wandb
from torch.utils.data import Dataset
from tqdm.auto import tqdm
import logging

from transformers import (
    AutoConfig,
    AutoModelForMaskedLM,
    PreTrainedTokenizerFast,
    DataCollatorForLanguageModeling,
    EarlyStoppingCallback,
    PreTrainedTokenizerFast,
    Trainer,
    TrainerCallback,
    TrainingArguments,
)

logger = logging.getLogger(__name__)

from lilybert.data.sharded_dataset import ShardedMLMDataset

from .config import TrainingConfig


class EarlyStoppingLogCallback(TrainerCallback):
    """Logs a warning when early stopping is triggered."""

    def on_train_end(self, args, state, control, **kwargs):
        if control.should_training_stop and state.global_step < args.max_steps:
            logger.warning(
                "Early stopping triggered at step %d (best eval_loss=%.4f at step %d). "
                "Training did not reach max_steps=%d. Consider lowering "
                "early_stopping_threshold or increasing early_stopping_patience.",
                state.global_step,
                state.best_metric,
                state.best_global_step,
                args.max_steps,
            )


class LilyPondMLMDataset(Dataset):
    """Text dataset for masked language modeling with chunk splitting.

    Each file is tokenized in full, then split into non-overlapping chunks
    of ``max_length`` tokens (including special tokens).  Short tail chunks
    are kept and padded.
    """

    def __init__(
        self,
        files: List[Path],
        tokenizer: PreTrainedTokenizerFast,
        max_length: int,
    ):
        self.tokenizer = tokenizer
        self.max_length = max_length
        self.chunks: List[Dict[str, torch.Tensor]] = []
        self._build_chunks(files)

    def _build_chunks(self, files: List[Path]) -> None:
        # Reserve space for [CLS] and [SEP] (or equivalent special tokens)
        content_length = self.max_length - 2

        for path in tqdm(files, desc="Chunking files", unit="file"):
            text = path.read_text(encoding="utf-8", errors="ignore")
            token_ids = self.tokenizer.encode(text, add_special_tokens=False)

            if len(token_ids) == 0:
                continue

            for start in range(0, len(token_ids), content_length):
                chunk_ids = token_ids[start : start + content_length]

                # Wrap with special tokens
                input_ids = self.tokenizer.build_inputs_with_ids(
                    chunk_ids
                ) if hasattr(self.tokenizer, "build_inputs_with_ids") else (
                    [self.tokenizer.cls_token_id or self.tokenizer.bos_token_id]
                    + chunk_ids
                    + [self.tokenizer.sep_token_id or self.tokenizer.eos_token_id]
                )

                # Pad to max_length
                attention_mask = [1] * len(input_ids)
                pad_len = self.max_length - len(input_ids)
                if pad_len > 0:
                    input_ids = input_ids + [self.tokenizer.pad_token_id or 0] * pad_len
                    attention_mask = attention_mask + [0] * pad_len

                self.chunks.append({
                    "input_ids": torch.tensor(input_ids, dtype=torch.long),
                    "attention_mask": torch.tensor(attention_mask, dtype=torch.long),
                })

    def __len__(self) -> int:
        return len(self.chunks)

    def __getitem__(self, idx: int) -> Dict[str, torch.Tensor]:
        return self.chunks[idx]


class MLMPretrainer:
    """Trainer wrapper for RoBERTa-based MLM training.

    Supports two modes controlled by ``config.random_init``:
    - ``False`` (default): load pretrained weights and resize embeddings
      for the extended LilyPond tokenizer (finetune).
    - ``True``: initialise the architecture from scratch with a custom
      config (train from scratch).
    """

    def __init__(self, config: TrainingConfig):
        self.config = config

    def run(self) -> Dict[str, Any]:
        is_main = int(os.environ.get("RANK", 0)) == 0

        # Initialize wandb before HF Trainer so it reuses the existing run
        if self.config.wandb_enabled and is_main:
            wandb.init(
                project=self.config.wandb_project,
                entity=self.config.wandb_entity,
                mode=self.config.wandb_mode,
                name=self.config.wandb_run_name
                or f"mlm-{self.config.model_architecture}",
                config=self.config.to_dict(),
            )

        tokenizer = PreTrainedTokenizerFast.from_pretrained(self.config.tokenizer_path)

        if self.config.pretokenized_shards_dir:
            shards_dir = Path(self.config.pretokenized_shards_dir)
            train_manifest = shards_dir / "train" / "manifest.json"
            eval_manifest = shards_dir / "eval" / "manifest.json"
            if not train_manifest.exists():
                raise FileNotFoundError(f"Train manifest not found: {train_manifest}")
            if not eval_manifest.exists():
                raise FileNotFoundError(f"Eval manifest not found: {eval_manifest}")
            train_dataset = ShardedMLMDataset(manifest_path=str(train_manifest))
            eval_dataset = ShardedMLMDataset(manifest_path=str(eval_manifest))
            if is_main:
                print(
                    f"Loaded sharded MLM data: "
                    f"train={len(train_dataset)}, eval={len(eval_dataset)}"
                )
            token_stats = {
                "file_count": len(train_dataset) + len(eval_dataset),
                "total_tokens": 0,
                "avg_tokens_per_file": 0,
            }
        else:
            all_files = self._collect_movement_files(
                data_dir=self.config.data_dir,
            )
            if not all_files:
                raise ValueError("No LilyPond files found for Stage-1 pretraining")

            token_stats = self.count_corpus_tokens(all_files, tokenizer)
            if is_main:
                print(f"Token stats: {token_stats}")

            # Split into 99% train, 1% eval
            train_files, eval_files = self._train_eval_split(
                all_files,
                eval_ratio=0.01,
                seed=self.config.seed,
            )

            train_dataset = LilyPondMLMDataset(
                files=train_files,
                tokenizer=tokenizer,
                max_length=self.config.max_length,
            )

            eval_dataset = LilyPondMLMDataset(
                files=eval_files,
                tokenizer=tokenizer,
                max_length=self.config.max_length,
            )

        model = self._build_model(tokenizer, is_main)

        ta_kwargs: Dict[str, Any] = dict(
            output_dir=self.config.output_dir,
            per_device_train_batch_size=self.config.per_device_train_batch_size,
            per_device_eval_batch_size=self.config.per_device_eval_batch_size,
            gradient_accumulation_steps=self.config.gradient_accumulation_steps,
            num_train_epochs=self.config.num_train_epochs,
            learning_rate=self.config.learning_rate,
            lr_scheduler_type=self.config.lr_scheduler_type,
            optim=self.config.optim,
            max_grad_norm=self.config.max_grad_norm,
            weight_decay=self.config.weight_decay,
            warmup_ratio=self.config.warmup_ratio,
            max_steps=self.config.max_steps,
            bf16=self.config.bf16,
            logging_steps=self.config.logging_steps,
            save_steps=self.config.save_steps,
            save_total_limit=self.config.save_total_limit,
            seed=self.config.seed,
            dataloader_num_workers=self.config.dataloader_num_workers,
            dataloader_pin_memory=self.config.dataloader_pin_memory,
            dataloader_prefetch_factor=self.config.dataloader_prefetch_factor,
            torch_compile=self.config.torch_compile,
            ddp_find_unused_parameters=self.config.ddp_find_unused_parameters,
            report_to=self._report_to() if is_main else ["none"],
            disable_tqdm=not is_main,
            remove_unused_columns=False,
            eval_strategy="steps",
            eval_steps=self.config.eval_steps,
            save_strategy="steps",
            metric_for_best_model="eval_loss",
            load_best_model_at_end=self.config.early_stopping,
        )
        if self.config.tensorboard_enabled:
            ta_kwargs["logging_dir"] = self.config.tensorboard_log_dir
        training_arguments = TrainingArguments(**ta_kwargs)

        collator = DataCollatorForLanguageModeling(
            tokenizer=tokenizer,
            mlm=True,
            mlm_probability=self.config.mlm_probability,
        )

        callbacks = []
        if self.config.early_stopping:
            callbacks.append(
                EarlyStoppingCallback(
                    early_stopping_patience=self.config.early_stopping_patience,
                    early_stopping_threshold=self.config.early_stopping_threshold,
                )
            )
            callbacks.append(EarlyStoppingLogCallback())

        trainer = Trainer(
            model=model,
            args=training_arguments,
            train_dataset=train_dataset,
            eval_dataset=eval_dataset,
            data_collator=collator,
            callbacks=callbacks,
        )
        trainer.train()

        model_dir = Path(self.config.output_dir) / "mlm_model"
        model_dir.mkdir(parents=True, exist_ok=True)
        trainer.save_model(str(model_dir))
        tokenizer.save_pretrained(str(model_dir / "tokenizer"))
        self.config.save(str(model_dir))

        if self.config.wandb_enabled and is_main:
            wandb.finish()

        summary = {
            "model_dir": str(model_dir),
            "num_samples_train": len(train_dataset),
            "num_samples_eval": len(eval_dataset),
            "total_tokens": token_stats["total_tokens"],
            "avg_tokens_per_file": token_stats["avg_tokens_per_file"],
            "eval_ratio": 0.01,
            "pretokenized_shards": self.config.pretokenized_shards_dir is not None,
            "max_length": self.config.max_length,
            "mlm_probability": self.config.mlm_probability,
            "architecture": self.config.model_architecture,
            "random_init": self.config.random_init,
        }
        (Path(self.config.output_dir) / "pretraining_summary.json").write_text(
            json.dumps(summary, indent=2),
            encoding="utf-8",
        )
        return summary

    def _build_model(self, tokenizer: PreTrainedTokenizerFast, is_main: bool):
        """Instantiate or load the MLM model.

        Priority:
        1. resume_from_checkpoint → load saved model
        2. random_init=False → load pretrained + resize embeddings
        3. random_init=True → fresh random init from config
        """
        vocab_size = self._vocab_size(tokenizer)

        if self.config.resume_from_checkpoint:
            ckpt_path = Path(self.config.resume_from_checkpoint)
            if not ckpt_path.exists():
                raise FileNotFoundError(f"Checkpoint not found: {ckpt_path}")
            model = AutoModelForMaskedLM.from_pretrained(str(ckpt_path))
            if is_main:
                print(f"Loaded pretrained weights from {ckpt_path}")
        elif not self.config.random_init:
            # Finetune: load pretrained weights, resize embeddings for
            # the extended tokenizer (base vocab + LilyPond tokens).
            model = AutoModelForMaskedLM.from_pretrained(
                self.config.model_architecture,
            )
            model.resize_token_embeddings(vocab_size)
            if is_main:
                print(
                    f"Loaded pretrained {self.config.model_architecture}, "
                    f"resized embeddings to {vocab_size}"
                )
        else:
            # Train from scratch with custom architecture config.
            model_config = self._build_model_config(vocab_size=vocab_size)
            model = AutoModelForMaskedLM.from_config(model_config)
            if is_main:
                print(f"Initialized {self.config.model_architecture} from scratch")

        return model

    @staticmethod
    def _train_eval_split(
        files: List[Path],
        eval_ratio: float = 0.01,
        seed: int | None = None,
    ) -> Tuple[List[Path], List[Path]]:
        """Split files into train and eval sets.

        Args:
            files: List of file paths
            eval_ratio: Fraction of files to use for evaluation (default: 0.01 for 1%)
            seed: Random seed for reproducibility

        Returns:
            Tuple of (train_files, eval_files)
        """
        if seed is not None:
            random.seed(seed)

        shuffled = files.copy()
        random.shuffle(shuffled)

        split_idx = max(1, int(len(shuffled) * (1 - eval_ratio)))
        train_files = shuffled[:split_idx]
        eval_files = shuffled[split_idx:]

        return train_files, eval_files

    def _report_to(self) -> List[str]:
        backends: List[str] = []
        if self.config.wandb_enabled:
            backends.append("wandb")
        if self.config.tensorboard_enabled:
            backends.append("tensorboard")
        return backends or ["none"]

    def _build_model_config(self, vocab_size: int) -> AutoConfig:
        supported = {"roberta-base", "microsoft/codebert-base"}
        if self.config.model_architecture not in supported:
            raise ValueError(
                f"Unsupported model_architecture '{self.config.model_architecture}'. "
                f"Supported: {sorted(supported)}"
            )
        return AutoConfig.for_model(
            "roberta",
            vocab_size=vocab_size,
            hidden_size=self.config.hidden_size,
            num_hidden_layers=self.config.num_hidden_layers,
            num_attention_heads=self.config.num_attention_heads,
            intermediate_size=self.config.intermediate_size,
            max_position_embeddings=self.config.max_position_embeddings,
            type_vocab_size=1,
        )

    @staticmethod
    def _vocab_size(tokenizer: PreTrainedTokenizerFast) -> int:
        return len(tokenizer)

    @staticmethod
    def count_corpus_tokens(
        files: List[Path],
        tokenizer: PreTrainedTokenizerFast,
        *,
        add_special_tokens: bool = True,
    ) -> Dict[str, float | int]:
        """Count tokens across a corpus of LilyPond files.

        Args:
            files: List of .ly files to include in the count
            tokenizer: Loaded tokenizer used for counting
            add_special_tokens: Whether to include tokenizer special tokens

        Returns:
            Dictionary with total file count, total tokens, and average tokens/file
        """
        total_tokens = 0

        for file_path in tqdm(
            files,
            desc="Counting corpus tokens",
            unit="file",
        ):
            text = file_path.read_text(encoding="utf-8", errors="ignore")
            token_ids = tokenizer.encode(text, add_special_tokens=add_special_tokens)
            total_tokens += len(token_ids)

        file_count = len(files)
        avg_tokens_per_file = total_tokens / file_count if file_count > 0 else 0.0

        return {
            "file_count": file_count,
            "total_tokens": total_tokens,
            "avg_tokens_per_file": avg_tokens_per_file,
        }

    @staticmethod
    def _collect_movement_files(data_dir: str) -> List[Path]:
        """Collect .ly/.ily/.tely files from the data directory."""
        root = Path(data_dir)
        if not root.exists():
            return []
        files: List[Path] = []
        for ext in ("*.ly", "*.ily", "*.tely"):
            files.extend(root.glob(ext))
        return sorted(files)
