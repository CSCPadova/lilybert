"""Stage-1 MLM pretraining for LilyPond corpora."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, List

import torch
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
        tokenizer = PreTrainedTokenizerFast.from_pretrained(self.config.tokenizer_path)
        movement_files = self._collect_movement_files(
            data_dir=self.config.data_dir,
            languages=self.config.languages,
        )
        if not movement_files:
            raise ValueError("No movement files found for Stage-1 pretraining")

        dataset = LilyPondMLMDataset(
            files=movement_files,
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
            save_total_limit=2,
            seed=self.config.seed,
            dataloader_num_workers=0,
            report_to=[],
            remove_unused_columns=False,
        )

        collator = DataCollatorForLanguageModeling(
            tokenizer=tokenizer,
            mlm=True,
            mlm_probability=self.config.mlm_probability,
        )

        trainer = Trainer(
            model=model,
            args=training_arguments,
            train_dataset=dataset,
            data_collator=collator,
            tokenizer=tokenizer,
        )
        trainer.train()

        model_dir = Path(self.config.output_dir) / "mlm_model"
        model_dir.mkdir(parents=True, exist_ok=True)
        trainer.save_model(str(model_dir))
        tokenizer.save_pretrained(str(model_dir / "tokenizer"))
        self.config.save(str(model_dir))

        summary = {
            "model_dir": str(model_dir),
            "num_files": len(movement_files),
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
