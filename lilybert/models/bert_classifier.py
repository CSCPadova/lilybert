"""BERT encoder + classifier modules."""

from __future__ import annotations

from typing import Any, Dict, Optional

import torch
from torch import nn
from transformers import BertConfig, BertModel


class LilyBERTEncoder(nn.Module):
    """Standalone LilyBERT encoder for training and probing."""

    def __init__(
        self,
        vocab_size: int = 30522,
        pretrained: str = "bert-base",
        random_init: bool = False,
    ):
        super().__init__()

        self.vocab_size = int(vocab_size)
        self.pretrained = pretrained

        if random_init:
            config = BertConfig(vocab_size=self.vocab_size)
            self.bert = BertModel(config)
        else:
            self.bert = BertModel.from_pretrained(pretrained)
            if int(self.bert.config.vocab_size) != self.vocab_size:
                self._replace_embeddings(self.bert, self.vocab_size)

    def forward(self, input_ids: torch.Tensor, attention_mask: torch.Tensor):
        return self.bert(
            input_ids=input_ids,
            attention_mask=attention_mask,
            return_dict=True,
        )

    def encode(
        self, input_ids: torch.Tensor, attention_mask: torch.Tensor
    ) -> torch.Tensor:
        outputs = self.forward(input_ids=input_ids, attention_mask=attention_mask)
        return outputs.last_hidden_state[:, 0, :]

    def save_pretrained(self, path: str) -> None:
        self.bert.save_pretrained(path)

    @classmethod
    def from_pretrained(
        cls,
        pretrained_model_name_or_path: str,
    ) -> "LilyBERTEncoder":
        instance = cls.__new__(cls)
        nn.Module.__init__(instance)
        instance.vocab_size = 0
        instance.pretrained = pretrained_model_name_or_path
        instance.bert = BertModel.from_pretrained(pretrained_model_name_or_path)
        instance.vocab_size = instance.bert.config.vocab_size
        return instance

    @staticmethod
    def _replace_embeddings(model: BertModel, vocab_size: int) -> None:
        hidden_size = model.config.hidden_size
        new_embeddings = nn.Embedding(vocab_size, hidden_size)
        nn.init.normal_(new_embeddings.weight, mean=0.0, std=0.02)
        model.embeddings.word_embeddings = new_embeddings
        model.config.vocab_size = vocab_size


class LilyBERTTaskClassifier(nn.Module):
    """Shared classifier logic over a standalone LilyBERTEncoder."""

    def __init__(
        self, encoder: LilyBERTEncoder, num_classes: int, multi_label: bool = False
    ):
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
        vocab_size: int = 30522,
        pretrained: str = "bert-base",
        multi_label: bool = False,
    ):
        encoder = LilyBERTEncoder(
            vocab_size=vocab_size,
            pretrained=pretrained,
            random_init=False,
        )
        super().__init__(
            encoder=encoder, num_classes=num_classes, multi_label=multi_label
        )
        self.vocab_size = int(vocab_size)


class ComposerClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        pretrained: str = "bert-base",
        num_classes: int = 70,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            pretrained=pretrained,
            multi_label=False,
        )


class StyleClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        pretrained: str = "bert-base",
        num_classes: int = 3,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            pretrained=pretrained,
            multi_label=False,
        )


class InstrumentClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        pretrained: str = "bert-base",
        num_classes: int = 25,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            pretrained=pretrained,
            multi_label=True,
        )


class KeyRootClassifier(LilyBERTClassifier):
    def __init__(
        self,
        vocab_size: int,
        pretrained: str = "bert-base",
        num_classes: int = 12,
    ):
        super().__init__(
            num_classes=num_classes,
            vocab_size=vocab_size,
            pretrained=pretrained,
            multi_label=False,
        )
