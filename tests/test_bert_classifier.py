"""Tests for simplified BERT classifiers."""

from __future__ import annotations

import torch
from transformers import BertConfig, BertModel

from lilybert.models.bert_classifier import (
    ComposerClassifier,
    InstrumentClassifier,
    KeyRootClassifier,
    LilyBERTClassifier,
    LilyBERTEncoder,
    StyleClassifier,
)


def _tiny_bert(vocab_size: int = 32) -> BertModel:
    config = BertConfig(
        vocab_size=vocab_size,
        hidden_size=32,
        num_hidden_layers=1,
        num_attention_heads=4,
        intermediate_size=64,
        max_position_embeddings=128,
    )
    return BertModel(config)


def test_classifier_forward_single_label(monkeypatch):
    monkeypatch.setattr(
        "lilybert.models.bert_classifier.BertModel.from_pretrained",
        lambda *args, **kwargs: _tiny_bert(vocab_size=64),
    )
    model = LilyBERTClassifier(
        num_classes=3,
        vocab_size=64,
        pretrained="bert-base",
        multi_label=False,
    )
    input_ids = torch.randint(0, 64, (2, 10))
    attention_mask = torch.ones_like(input_ids)
    labels = torch.tensor([1, 2], dtype=torch.long)

    outputs = model(input_ids=input_ids, attention_mask=attention_mask, labels=labels)
    assert outputs["logits"].shape == (2, 3)
    assert outputs["loss"] is not None


def test_classifier_forward_multi_label(monkeypatch):
    monkeypatch.setattr(
        "lilybert.models.bert_classifier.BertModel.from_pretrained",
        lambda *args, **kwargs: _tiny_bert(vocab_size=64),
    )
    model = LilyBERTClassifier(
        num_classes=4,
        vocab_size=64,
        pretrained="bert-base",
        multi_label=True,
    )
    input_ids = torch.randint(0, 64, (2, 10))
    attention_mask = torch.ones_like(input_ids)
    labels = torch.tensor([[1, 0, 1, 0], [0, 1, 0, 1]], dtype=torch.float32)

    outputs = model(input_ids=input_ids, attention_mask=attention_mask, labels=labels)
    assert outputs["logits"].shape == (2, 4)
    assert outputs["loss"] is not None


def test_encoder_can_run_standalone_forward():
    encoder = LilyBERTEncoder(vocab_size=64, random_init=True)
    input_ids = torch.randint(0, 64, (2, 10))
    attention_mask = torch.ones_like(input_ids)

    outputs = encoder(input_ids=input_ids, attention_mask=attention_mask)
    pooled = encoder.encode(input_ids=input_ids, attention_mask=attention_mask)

    assert outputs.last_hidden_state.shape[0] == 2
    assert pooled.shape[0] == 2
    assert pooled.shape[1] == encoder.bert.config.hidden_size


def test_specialized_classifiers_have_expected_shapes(monkeypatch):
    monkeypatch.setattr(
        "lilybert.models.bert_classifier.BertModel.from_pretrained",
        lambda *args, **kwargs: _tiny_bert(vocab_size=64),
    )
    composer = ComposerClassifier(vocab_size=64, num_classes=7)
    style = StyleClassifier(vocab_size=64, num_classes=3)
    instrument = InstrumentClassifier(vocab_size=64, num_classes=12)
    key_root = KeyRootClassifier(vocab_size=64, num_classes=12)

    input_ids = torch.randint(0, 64, (2, 10))
    attention_mask = torch.ones_like(input_ids)

    composer_out = composer(input_ids=input_ids, attention_mask=attention_mask)
    style_out = style(input_ids=input_ids, attention_mask=attention_mask)
    instrument_out = instrument(input_ids=input_ids, attention_mask=attention_mask)
    key_root_out = key_root(input_ids=input_ids, attention_mask=attention_mask)

    assert composer_out["logits"].shape == (2, 7)
    assert style_out["logits"].shape == (2, 3)
    assert instrument_out["logits"].shape == (2, 12)
    assert key_root_out["logits"].shape == (2, 12)
    assert instrument.multi_label is True
    assert style.multi_label is False
