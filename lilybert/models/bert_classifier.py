"""BERT encoder + classifier modules with four training modes."""

from __future__ import annotations

from enum import Enum
from typing import Any, Dict, Optional, Union

import torch
from peft import LoraConfig, TaskType, get_peft_model
from torch import nn
from transformers import BertConfig, BertModel


class TrainingMode(str, Enum):
    """Supported training modes for LilyBERT."""

    FROZEN = "frozen"
    LORA = "lora"
    FULL_FINETUNE = "full_finetune"
    RANDOM_INIT = "random_init"


class LilyBERTEncoder(nn.Module):
    """Standalone LilyBERT encoder that can be used and published independently."""

    def __init__(
        self,
        vocab_size: int,
        mode: Union[TrainingMode, str],
        pretrained: str = "bert-base-uncased",
        lora_r: int = 16,
        lora_alpha: int = 32,
    ):
        super().__init__()

        self.vocab_size = int(vocab_size)
        self.mode = TrainingMode(mode)
        self.pretrained = pretrained

        if self.mode == TrainingMode.RANDOM_INIT:
            config = BertConfig(vocab_size=self.vocab_size)
            self.bert = BertModel(config)
        else:
            self.bert = BertModel.from_pretrained(pretrained)
            self._replace_embeddings(self.bert, self.vocab_size)

        self._apply_mode(self.mode, lora_r=lora_r, lora_alpha=lora_alpha)

    def forward(self, input_ids: torch.Tensor, attention_mask: torch.Tensor):
        return self.bert(
            input_ids=input_ids,
            attention_mask=attention_mask,
            return_dict=True,
        )

    def encode(self, input_ids: torch.Tensor, attention_mask: torch.Tensor) -> torch.Tensor:
        """Return pooled CLS embeddings for downstream heads."""
        outputs = self.forward(input_ids=input_ids, attention_mask=attention_mask)
        return outputs.last_hidden_state[:, 0, :]

    def save_pretrained(self, path: str) -> None:
        self.bert.save_pretrained(path)

    @classmethod
    def from_pretrained(
        cls,
        pretrained_model_name_or_path: str,
        mode: Union[TrainingMode, str] = TrainingMode.FULL_FINETUNE,
        lora_r: int = 16,
        lora_alpha: int = 32,
    ) -> "LilyBERTEncoder":
        instance = cls.__new__(cls)
        nn.Module.__init__(instance)
        instance.vocab_size = 0
        instance.mode = TrainingMode(mode)
        instance.pretrained = pretrained_model_name_or_path
        instance.bert = BertModel.from_pretrained(pretrained_model_name_or_path)
        instance.vocab_size = instance.bert.config.vocab_size
        instance._apply_mode(instance.mode, lora_r=lora_r, lora_alpha=lora_alpha)
        return instance

    def _apply_mode(self, mode: TrainingMode, lora_r: int, lora_alpha: int) -> None:
        if mode == TrainingMode.FROZEN:
            self._set_backbone_trainable(self.bert, trainable=False)
        elif mode == TrainingMode.LORA:
            peft_config = LoraConfig(
                r=lora_r,
                lora_alpha=lora_alpha,
                target_modules=["query", "value"],
                task_type=TaskType.SEQ_CLS,
            )
            self.bert = get_peft_model(self.bert, peft_config)
        elif mode == TrainingMode.FULL_FINETUNE:
            self._set_backbone_trainable(self.bert, trainable=True)

    @staticmethod
    def _replace_embeddings(model: BertModel, vocab_size: int) -> None:
        hidden_size = model.config.hidden_size
        new_embeddings = nn.Embedding(vocab_size, hidden_size)
        nn.init.normal_(new_embeddings.weight, mean=0.0, std=0.02)
        model.embeddings.word_embeddings = new_embeddings
        model.config.vocab_size = vocab_size

    @staticmethod
    def _set_backbone_trainable(model: nn.Module, trainable: bool) -> None:
        for parameter in model.parameters():
            parameter.requires_grad = trainable


class LilyBERTTaskClassifier(nn.Module):
    """Shared classifier logic over a standalone LilyBERTEncoder."""

    def __init__(self, encoder: LilyBERTEncoder, num_classes: int, multi_label: bool = False):
        super().__init__()

        self.encoder = encoder
        self.bert = self.encoder.bert
        self.num_classes = int(num_classes)
        self.multi_label = bool(multi_label)

        hidden_size = self.encoder.bert.config.hidden_size
        self.classifier = nn.Linear(hidden_size, self.num_classes)

    def forward(
        self,
        input_ids: torch.Tensor,
        attention_mask: torch.Tensor,
        labels: Optional[torch.Tensor] = None,
    ) -> Dict[str, Any]:
        pooled = self.encoder.encode(input_ids=input_ids, attention_mask=attention_mask)
        logits = self.classifier(pooled)

        loss = None
        if labels is not None:
            if self.multi_label:
                loss_fn = nn.BCEWithLogitsLoss()
                loss = loss_fn(logits, labels.float())
            else:
                loss_fn = nn.CrossEntropyLoss()
                loss = loss_fn(logits, labels.long())

        return {"loss": loss, "logits": logits}


class LilyBERTClassifier(LilyBERTTaskClassifier):
    """Generic classifier wrapper retained for compatibility."""

    def __init__(
        self,
        num_classes: int,
        vocab_size: int,
        mode: Union[TrainingMode, str],
        pretrained: str = "bert-base-uncased",
        multi_label: bool = False,
        lora_r: int = 16,
        lora_alpha: int = 32,
    ):
        encoder = LilyBERTEncoder(
            vocab_size=vocab_size,
            mode=mode,
            pretrained=pretrained,
            lora_r=lora_r,
            lora_alpha=lora_alpha,
        )
        super().__init__(encoder=encoder, num_classes=num_classes, multi_label=multi_label)
        self.vocab_size = int(vocab_size)
        self.mode = TrainingMode(mode)


class ComposerClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        mode: Union[TrainingMode, str],
        pretrained: str = "bert-base-uncased",
        num_classes: int = 70,
        lora_r: int = 16,
        lora_alpha: int = 32,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            mode=mode,
            pretrained=pretrained,
            multi_label=False,
            lora_r=lora_r,
            lora_alpha=lora_alpha,
        )


class MusicalFormClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        mode: Union[TrainingMode, str],
        pretrained: str = "bert-base-uncased",
        num_classes: int = 17,
        lora_r: int = 16,
        lora_alpha: int = 32,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            mode=mode,
            pretrained=pretrained,
            multi_label=True,
            lora_r=lora_r,
            lora_alpha=lora_alpha,
        )


class InstrumentsClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        mode: Union[TrainingMode, str],
        pretrained: str = "bert-base-uncased",
        num_classes: int = 25,
        lora_r: int = 16,
        lora_alpha: int = 32,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            mode=mode,
            pretrained=pretrained,
            multi_label=True,
            lora_r=lora_r,
            lora_alpha=lora_alpha,
        )


class SectionNomenclatureClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        mode: Union[TrainingMode, str],
        pretrained: str = "bert-base-uncased",
        num_classes: int = 47,
        lora_r: int = 16,
        lora_alpha: int = 32,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            mode=mode,
            pretrained=pretrained,
            multi_label=False,
            lora_r=lora_r,
            lora_alpha=lora_alpha,
        )


class KeyScaleClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        mode: Union[TrainingMode, str],
        pretrained: str = "bert-base-uncased",
        num_classes: int = 24,
        lora_r: int = 16,
        lora_alpha: int = 32,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            mode=mode,
            pretrained=pretrained,
            multi_label=False,
            lora_r=lora_r,
            lora_alpha=lora_alpha,
        )
