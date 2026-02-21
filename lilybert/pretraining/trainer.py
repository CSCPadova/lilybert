"""Stage-1 MLM pretraining for LilyPond corpora."""

from __future__ import annotations

import json
import os
import random
from pathlib import Path
from typing import Any, Dict, List, Tuple

import torch
import wandb
from torch.utils.data import Dataset
from transformers import (
    BertConfig,
    BertForMaskedLM,
    DataCollatorForLanguageModeling,
    PreTrainedTokenizerFast,
    Trainer,
    TrainingArguments,
)

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
        # Initialize wandb
        wandb_project = os.environ.get("WANDB_PROJECT", "lilybert-pretraining")
        wandb.init(
            project=wandb_project,
            name=f"bert-mlm-{self.config.model_architecture}",
            config=self.config.to_dict(),
        )

        tokenizer = PreTrainedTokenizerFast.from_pretrained(self.config.tokenizer_path)
        all_files = self._collect_movement_files(
            data_dir=self.config.data_dir,
            languages=self.config.languages,
        )
        if not all_files:
            raise ValueError("No movement files found for Stage-1 pretraining")

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

        training_arguments = TrainingArguments(
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
            dataloader_num_workers=0,
            report_to=["wandb"],
            remove_unused_columns=False,
            evaluation_strategy="steps",
            eval_steps=1000,
            save_strategy="steps",
            load_best_model_at_end=True,
            metric_for_best_model="eval_loss",
        )

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

        # Log final summary to wandb
        wandb.finish()

        summary = {
            "model_dir": str(model_dir),
            "num_files_total": len(all_files),
            "num_files_train": len(train_files),
            "num_files_eval": len(eval_files),
            "eval_ratio": 0.01,
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
    def _collect_movement_files(data_dir: str, languages: List[str]) -> List[Path]:
        root = Path(data_dir)
        files: List[Path] = []
        for language in languages:
            language_dir = root / language
            if not language_dir.exists():
                continue
            files.extend(sorted(language_dir.glob("*.ly")))
        return files
