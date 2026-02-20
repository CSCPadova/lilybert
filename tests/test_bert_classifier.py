"""Tests for BERT classifier modes."""

from __future__ import annotations

import torch
from transformers import BertConfig, BertModel

from lilybert.models.bert_classifier import (
    ComposerClassifier,
    InstrumentsClassifier,
    LilyBERTClassifier,
    LilyBERTEncoder,
    MusicalFormClassifier,
    TrainingMode,
)
from lilybert.models.config import LilyBERTConfig


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


def test_random_init_mode_forward_single_label():
    model = LilyBERTClassifier(
        num_classes=3,
        vocab_size=64,
        mode=TrainingMode.RANDOM_INIT,
        multi_label=False,
    )
    input_ids = torch.randint(0, 64, (2, 10))
    attention_mask = torch.ones_like(input_ids)
    labels = torch.tensor([1, 2], dtype=torch.long)

    outputs = model(input_ids=input_ids, attention_mask=attention_mask, labels=labels)
    assert outputs["logits"].shape == (2, 3)
    assert outputs["loss"] is not None


def test_random_init_mode_forward_multi_label():
    model = LilyBERTClassifier(
        num_classes=4,
        vocab_size=64,
        mode=TrainingMode.RANDOM_INIT,
        multi_label=True,
    )
    input_ids = torch.randint(0, 64, (2, 10))
    attention_mask = torch.ones_like(input_ids)
    labels = torch.tensor([[1, 0, 1, 0], [0, 1, 0, 1]], dtype=torch.float32)

    outputs = model(input_ids=input_ids, attention_mask=attention_mask, labels=labels)
    assert outputs["logits"].shape == (2, 4)
    assert outputs["loss"] is not None


def test_frozen_mode_freezes_backbone_and_keeps_head_trainable(monkeypatch):
    def fake_from_pretrained(*args, **kwargs):
        del args, kwargs
        return _tiny_bert(vocab_size=32)

    monkeypatch.setattr(
        "lilybert.models.bert_classifier.BertModel.from_pretrained",
        fake_from_pretrained,
    )

    model = LilyBERTClassifier(
        num_classes=5,
        vocab_size=80,
        mode=TrainingMode.FROZEN,
    )

    assert model.bert.embeddings.word_embeddings.num_embeddings == 80
    assert all(not parameter.requires_grad for parameter in model.bert.parameters())
    assert all(parameter.requires_grad for parameter in model.classifier.parameters())


def test_full_finetune_mode_keeps_backbone_trainable(monkeypatch):
    def fake_from_pretrained(*args, **kwargs):
        del args, kwargs
        return _tiny_bert(vocab_size=32)

    monkeypatch.setattr(
        "lilybert.models.bert_classifier.BertModel.from_pretrained",
        fake_from_pretrained,
    )

    model = LilyBERTClassifier(
        num_classes=2,
        vocab_size=48,
        mode=TrainingMode.FULL_FINETUNE,
    )

    assert model.bert.embeddings.word_embeddings.num_embeddings == 48
    assert all(parameter.requires_grad for parameter in model.bert.parameters())
    assert all(parameter.requires_grad for parameter in model.classifier.parameters())


def test_lora_mode_uses_query_value_target_modules(monkeypatch):
    captured = {}

    def fake_from_pretrained(*args, **kwargs):
        del args, kwargs
        return _tiny_bert(vocab_size=32)

    def fake_get_peft_model(model, peft_config):
        captured["config"] = peft_config
        return model

    monkeypatch.setattr(
        "lilybert.models.bert_classifier.BertModel.from_pretrained",
        fake_from_pretrained,
    )
    monkeypatch.setattr(
        "lilybert.models.bert_classifier.get_peft_model",
        fake_get_peft_model,
    )

    model = LilyBERTClassifier(
        num_classes=3,
        vocab_size=40,
        mode=TrainingMode.LORA,
        lora_r=4,
        lora_alpha=8,
    )

    target_modules = list(captured["config"].target_modules)
    assert "query" in target_modules
    assert "value" in target_modules
    assert model.classifier.out_features == 3


def test_lilybert_config_defaults():
    config = LilyBERTConfig()
    assert config.pretrained_model == "bert-base"
    assert config.mode == TrainingMode.FULL_FINETUNE
    assert config.max_length == 512
    assert config.lora_r == 16


def test_encoder_can_run_standalone_forward():
    encoder = LilyBERTEncoder(
        vocab_size=64,
        mode=TrainingMode.RANDOM_INIT,
    )
    input_ids = torch.randint(0, 64, (2, 10))
    attention_mask = torch.ones_like(input_ids)

    outputs = encoder(input_ids=input_ids, attention_mask=attention_mask)
    pooled = encoder.encode(input_ids=input_ids, attention_mask=attention_mask)

    assert outputs.last_hidden_state.shape[0] == 2
    assert pooled.shape[0] == 2
    assert pooled.shape[1] == encoder.bert.config.hidden_size


def test_specialized_classifiers_have_expected_shapes():
    composer = ComposerClassifier(vocab_size=64, mode=TrainingMode.RANDOM_INIT)
    forms = MusicalFormClassifier(vocab_size=64, mode=TrainingMode.RANDOM_INIT)
    instruments = InstrumentsClassifier(vocab_size=64, mode=TrainingMode.RANDOM_INIT)

    input_ids = torch.randint(0, 64, (2, 10))
    attention_mask = torch.ones_like(input_ids)

    composer_out = composer(input_ids=input_ids, attention_mask=attention_mask)
    forms_out = forms(input_ids=input_ids, attention_mask=attention_mask)
    instruments_out = instruments(input_ids=input_ids, attention_mask=attention_mask)

    assert composer_out["logits"].shape == (2, 70)
    assert forms_out["logits"].shape == (2, 17)
    assert instruments_out["logits"].shape == (2, 25)
    assert forms.multi_label is True
    assert instruments.multi_label is True
