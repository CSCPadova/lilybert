"""Stage-1 MLM pretraining for LilyPond corpora."""

from __future__ import annotations

import json
import os
import random
from pathlib import Path
from typing import Any, Dict, List, Tuple

import torch
from torch.utils.data import Dataset

try:
    import wandb
except Exception as exc:  # pragma: no cover - optional runtime dependency
    wandb = None
    import warnings
    warnings.warn(f"wandb import failed: {exc}")
from transformers import (
    BertConfig,
    BertForMaskedLM,
    DataCollatorForLanguageModeling,
    PreTrainedTokenizerFast,
    Trainer,
    TrainingArguments,
)
from tqdm.auto import tqdm

from lilybert.data.sharded_dataset import ShardedMLMDataset

from .config import PretrainingConfig


class LilyPondMLMDataset(Dataset):
    """Simple text dataset for masked language modeling."""

    def __init__(
        self,
        files: List[Path],
        tokenizer: PreTrainedTokenizerFast,
        max_length: int,
    ):
        self.files = files
        self.tokenizer = tokenizer
        self.max_length = max_length

    def __len__(self) -> int:
        return len(self.files)

    def __getitem__(self, idx: int) -> Dict[str, torch.Tensor]:
        text = self.files[idx].read_text(encoding="utf-8", errors="ignore")
        encoded = self.tokenizer(
            text,
            truncation=True,
            max_length=self.max_length,
            padding="max_length",
            return_tensors="pt",
        )
        return {
            "input_ids": encoded["input_ids"].squeeze(0),
            "attention_mask": encoded["attention_mask"].squeeze(0),
        }


class MLMPretrainer:
    """Trainer wrapper for BERT-base MLM pretraining from scratch."""

    def __init__(self, config: PretrainingConfig):
        self.config = config

    def run(self) -> Dict[str, Any]:
        # Initialize logging backends
        print(f"wandb_enabled={self.config.wandb_enabled}, wandb={wandb}")
        if self.config.wandb_enabled and wandb is not None:
            wandb.init(
                project=self.config.wandb_project,
                entity=self.config.wandb_entity,
                mode=self.config.wandb_mode,
                name=self.config.wandb_run_name
                or f"bert-mlm-{self.config.model_architecture}",
                config=self.config.to_dict(),
            )

        tokenizer = PreTrainedTokenizerFast.from_pretrained(self.config.tokenizer_path)

        if self.config.pretokenized_shards_dir:
            shards_dir = Path(self.config.pretokenized_shards_dir)
            train_manifest = shards_dir / "train" / "manifest.json"
            eval_manifest = shards_dir / "eval" / "manifest.json"
            if not train_manifest.exists():
                raise FileNotFoundError(
                    f"Train manifest not found: {train_manifest}"
                )
            if not eval_manifest.exists():
                raise FileNotFoundError(
                    f"Eval manifest not found: {eval_manifest}"
                )
            train_dataset = ShardedMLMDataset(manifest_path=str(train_manifest))
            eval_dataset = ShardedMLMDataset(manifest_path=str(eval_manifest))
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
                languages=self.config.languages,
            )
            if not all_files:
                raise ValueError("No LilyPond files found for Stage-1 pretraining")

            token_stats = self.count_corpus_tokens(all_files, tokenizer)
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

        model_config = self._build_model_config(vocab_size=self._vocab_size(tokenizer))
        model = BertForMaskedLM(model_config)

        ta_kwargs: Dict[str, Any] = dict(
            output_dir=self.config.output_dir,
            per_device_train_batch_size=self.config.per_device_train_batch_size,
            num_train_epochs=self.config.num_train_epochs,
            learning_rate=self.config.learning_rate,
            weight_decay=self.config.weight_decay,
            warmup_ratio=self.config.warmup_ratio,
            max_steps=self.config.max_steps,
            logging_steps=self.config.logging_steps,
            save_steps=self.config.save_steps,
            save_total_limit=3,
            seed=self.config.seed,
            dataloader_num_workers=self.config.dataloader_num_workers,
            report_to=self._report_to(),
            remove_unused_columns=False,
            eval_strategy="steps",
            eval_steps=1000,
            save_strategy="steps",
            metric_for_best_model="eval_loss",
        )
        if self.config.tensorboard_enabled:
            ta_kwargs["logging_dir"] = self.config.tensorboard_log_dir
        training_arguments = TrainingArguments(**ta_kwargs)

        collator = DataCollatorForLanguageModeling(
            tokenizer=tokenizer,
            mlm=True,
            mlm_probability=self.config.mlm_probability,
        )

        trainer = Trainer(
            model=model,
            args=training_arguments,
            train_dataset=train_dataset,
            eval_dataset=eval_dataset,
            data_collator=collator,
        )
        trainer.train()

        model_dir = Path(self.config.output_dir) / "mlm_model"
        model_dir.mkdir(parents=True, exist_ok=True)
        trainer.save_model(str(model_dir))
        tokenizer.save_pretrained(str(model_dir / "tokenizer"))
        self.config.save(str(model_dir))

        if self.config.wandb_enabled and wandb is not None:
            wandb.finish()

        summary = {
            "model_dir": str(model_dir),
            "num_samples_train": len(train_dataset),
            "num_samples_eval": len(eval_dataset),
            "total_tokens": token_stats["total_tokens"],
            "avg_tokens_per_file": token_stats["avg_tokens_per_file"],
            "eval_ratio": 0.01,
            "pretokenized_shards": self.config.pretokenized_shards_dir is not None,
            "languages": self.config.languages,
            "max_length": self.config.max_length,
            "mlm_probability": self.config.mlm_probability,
            "architecture": self.config.model_architecture,
        }
        (Path(self.config.output_dir) / "pretraining_summary.json").write_text(
            json.dumps(summary, indent=2),
            encoding="utf-8",
        )
        return summary

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
        if self.config.wandb_enabled and wandb is not None:
            backends.append("wandb")
        if self.config.tensorboard_enabled:
            backends.append("tensorboard")
        return backends or ["none"]

    def _build_model_config(self, vocab_size: int) -> BertConfig:
        if self.config.model_architecture != "bert-base":
            raise ValueError(
                "Unsupported model_architecture. This pipeline currently supports bert-base"
            )
        return BertConfig(
            vocab_size=vocab_size,
            hidden_size=self.config.hidden_size,
            num_hidden_layers=self.config.num_hidden_layers,
            num_attention_heads=self.config.num_attention_heads,
            intermediate_size=self.config.intermediate_size,
            max_position_embeddings=self.config.max_position_embeddings,
            type_vocab_size=2,
        )

    @staticmethod
    def _vocab_size(tokenizer: PreTrainedTokenizerFast) -> int:
        vocab_size = getattr(tokenizer, "vocab_size", None)
        if vocab_size is not None:
            return int(vocab_size)
        return len(tokenizer.get_vocab())

    @staticmethod
    def count_corpus_tokens(
        files: List[Path],
        tokenizer: PreTrainedTokenizerFast,
        *,
        add_special_tokens: bool = True,
    ) -> Dict[str, float | int]:
        """Count tokens across a corpus of LilyPond files.

        This utility is intended for corpora like Mutopia pretraining data,
        where files may include augmented variants and do not need metadata.

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
    def _collect_movement_files(data_dir: str, languages: List[str]) -> List[Path]:
        root = Path(data_dir)
        files: List[Path] = []
        for language in languages:
            language_dir = root / language
            if not language_dir.exists():
                continue
            files.extend(sorted(language_dir.glob("*.ly")))
        return files
