"""BERT encoder module."""

from __future__ import annotations

import torch
from torch import nn
from transformers import BertConfig, BertModel


class LilyBERTEncoder(nn.Module):
    """Standalone LilyBERT encoder for training and embedding extraction."""

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
