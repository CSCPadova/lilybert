"""Smoke end-to-end CLI pipeline tests.

This test exercises the same minimal flow validated manually:
1) preprocess movement-level files
2) train BPE tokenizer
3) build MLM shards
4) run tiny MLM pretraining
"""

from __future__ import annotations

from pathlib import Path

import pytest
from omegaconf import OmegaConf

from lilybert.cli.ly_preprocess import _main as ly_preprocess_main
from lilybert.cli.ly_train import _main as ly_train_main


@pytest.mark.slow
@pytest.mark.integration
def test_smoke_e2e_cli_pipeline(
    tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    tests_root = Path(__file__).parent
    input_dir = tests_root / "ly"
    labels_path = Path("data/labels/labels_v1.json")

    assert input_dir.exists()

    processed_dir = tmp_path / "processed"
    tokenizer_dir = tmp_path / "tokenizer"
    pretokenized_dir = tmp_path / "pretokenized"
    train_output_dir = tmp_path / "train"

    ly_preprocess_main(
        OmegaConf.create(
            {
                "preprocess": {
                    "input_dir": str(input_dir),
                    "output_dir": str(processed_dir),
                    "labels_path": str(labels_path),
                    "strip": ["header", "version", "comments", "midi", "overrides"],
                    "sharding": {"enabled": False},
                    "bpe": {"enabled": False},
                }
            }
        )
    )
    capsys.readouterr()

    processed_files = list(processed_dir.glob("*.ly"))
    assert processed_files, "Preprocess step did not produce movement .ly files"
    assert (processed_dir / "metadata.json").exists()

    ly_preprocess_main(
        OmegaConf.create(
            {
                "preprocess": {
                    "input_dir": str(input_dir),
                    "output_dir": str(processed_dir),
                    "labels_path": str(labels_path),
                    "sharding": {"enabled": False},
                    "bpe": {
                        "enabled": True,
                        "output_dir": str(tokenizer_dir),
                        "vocab_size": 512,
                        "min_frequency": 0,
                    },
                }
            }
        )
    )
    capsys.readouterr()

    assert (tokenizer_dir / "tokenizer.json").exists()

    ly_preprocess_main(
        OmegaConf.create(
            {
                "preprocess": {
                    "input_dir": str(input_dir),
                    "output_dir": str(processed_dir),
                    "labels_path": str(labels_path),
                    "bpe": {"enabled": False},
                    "sharding": {
                        "enabled": True,
                        "stage": "mlm",
                        "tokenizer_path": str(tokenizer_dir),
                        "output_dir": str(pretokenized_dir),
                        "max_length": 128,
                        "stride": 64,
                        "shard_size": 64,
                        "eval_ratio": 0.1,
                        "seed": 42,
                    },
                }
            }
        )
    )
    capsys.readouterr()

    mlm_root = pretokenized_dir / "mlm"
    assert (mlm_root / "train" / "manifest.json").exists()
    assert (mlm_root / "eval" / "manifest.json").exists()

    ly_train_main(
        OmegaConf.create(
            {
                "dataset": {
                    "processed_dir": str(processed_dir),
                    "tokenizer_path": str(tokenizer_dir),
                    "pretokenized_shards_dir": str(mlm_root),
                },
                "model": {
                    "architecture": {
                        "name": "bert-base",
                        "hidden_size": 64,
                        "num_hidden_layers": 2,
                        "num_attention_heads": 4,
                        "intermediate_size": 128,
                        "max_position_embeddings": 256,
                    }
                },
                "runtime": {
                    "output_dir": str(train_output_dir),
                    "seed": 42,
                    "system": {"dataloader_num_workers": 0},
                    "wandb": {"enabled": False},
                    "tensorboard": {"enabled": False},
                },
                "train": {
                    "mode": "pretrain",
                    "pretrain": {
                        "max_length": 128,
                        "mlm_probability": 0.15,
                        "per_device_train_batch_size": 1,
                        "num_train_epochs": 1,
                        "learning_rate": 1e-4,
                        "weight_decay": 0.0,
                        "warmup_ratio": 0.0,
                        "max_steps": 1,
                        "logging_steps": 1,
                        "save_steps": 1,
                    },
                },
            }
        )
    )
    capsys.readouterr()

    assert (train_output_dir / "mlm_model").exists()
    assert (train_output_dir / "pretraining_summary.json").exists()
