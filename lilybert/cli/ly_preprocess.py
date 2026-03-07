"""Unified dataset preprocessing entrypoint.

Supports:
- movement preprocessing for any LilyPond dataset
- optional augmentation
- optional pretokenized sharding
- optional BPE tokenizer training
"""

from __future__ import annotations

import json
import random
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Optional

import hydra
import numpy as np
from omegaconf import DictConfig, OmegaConf
from transformers import PreTrainedTokenizerFast

from lilybert.cli.pretokenize import (
    _pretokenize_mlm,
)
from lilybert.data.preprocessor import LilyPondPreprocessor
from lilybert.data.tokenizer import LilyPondTokenizer


CONF_PATH = str(Path(__file__).resolve().parents[2] / "conf")


@dataclass
class AugmentationSettings:
    enable_transposition: bool = False
    enable_absolute_relative: bool = False
    enable_articulation_variants: bool = False
    enable_barline_variants: bool = False
    enable_retrograde: bool = False
    enable_inversion: bool = False
    include_original: bool = True


@dataclass
class ShardingSettings:
    enabled: bool = False
    tokenizer_path: str = "artifacts/tokenizer"
    output_dir: str = "artifacts/pretokenized"
    max_length: int = 2048
    stride: int = 256
    shard_size: int = 4096
    eval_ratio: float = 0.01
    seed: int = 42


@dataclass
class TokenizeSettings:
    enabled: bool = False
    tokenizer_path: str = "artifacts/tokenizer"
    output_dir: str = "artifacts/tokenized"
    max_length: int = 512
    stride: int = 256
    eval_ratio: float = 0.01
    seed: int = 42


@dataclass
class BPESettings:
    enabled: bool = False
    output_dir: str = "artifacts/tokenizer"
    vocab_size: int = 8000
    min_frequency: int = 0
    number_placeholders: bool = False
    lexer: dict | None = None


@dataclass
class PreprocessConfig:
    enabled: bool = True
    input_dir: str = "data/raw"
    output_dir: str = "data/processed"
    labels_path: str = "data/labels/labels_v1.json"
    strip: Optional[List[str]] = None
    augmentation: AugmentationSettings = field(default_factory=AugmentationSettings)
    tokenize: TokenizeSettings = field(default_factory=TokenizeSettings)
    sharding: ShardingSettings = field(default_factory=ShardingSettings)
    bpe: BPESettings = field(default_factory=BPESettings)


def _collect_ly_files(data_dir: Path) -> List[Path]:
    if not data_dir.exists():
        return []
    return sorted(data_dir.glob("*.ly"))


def _tokenize_mlm_unsharded(
    *,
    data_dir: str,
    tokenizer_path: str,
    output_dir: str,
    max_length: int,
    stride: int,
    eval_ratio: float,
    seed: int,
) -> dict:
    data_path = Path(data_dir)
    all_files = _collect_ly_files(data_path)
    if not all_files:
        raise FileNotFoundError(f"No .ly files found in {data_path}")

    tokenizer = PreTrainedTokenizerFast.from_pretrained(tokenizer_path)
    lily_tokenizer = LilyPondTokenizer()

    pad_id = tokenizer.pad_token_id or 0
    cls_id = tokenizer.cls_token_id
    sep_id = tokenizer.sep_token_id

    rng = random.Random(seed)
    shuffled = list(all_files)
    rng.shuffle(shuffled)
    split_idx = max(1, int(len(shuffled) * (1 - eval_ratio)))
    train_files = shuffled[:split_idx]
    eval_files = shuffled[split_idx:]

    body_size = max_length - 2
    step = max(1, body_size - stride)

    out_root = Path(output_dir)
    out_root.mkdir(parents=True, exist_ok=True)

    summary = {"output_dir": str(out_root), "splits": {}}

    for split_name, files in (("train", train_files), ("eval", eval_files)):
        input_rows: list[np.ndarray] = []
        mask_rows: list[np.ndarray] = []
        movement_ids: list[str] = []

        for file_path in files:
            text = file_path.read_text(encoding="utf-8", errors="ignore")
            parser_tokens = lily_tokenizer._movement_to_parser_tokens(text)
            if not parser_tokens.strip():
                continue

            token_ids = tokenizer.encode(parser_tokens, add_special_tokens=False)
            if not token_ids:
                continue

            if len(token_ids) <= body_size:
                windows = [token_ids]
            else:
                windows = []
                for start in range(0, len(token_ids) - body_size + 1, step):
                    windows.append(token_ids[start : start + body_size])
                if windows and windows[-1] != token_ids[-body_size:]:
                    windows.append(token_ids[-body_size:])

            for window in windows:
                ids = [cls_id] + window + [sep_id]
                attn = [1] * len(ids)
                pad_len = max_length - len(ids)
                if pad_len > 0:
                    ids = ids + [pad_id] * pad_len
                    attn = attn + [0] * pad_len

                input_rows.append(np.asarray(ids, dtype=np.int64))
                mask_rows.append(np.asarray(attn, dtype=np.int64))
                movement_ids.append(file_path.stem)

        input_ids = (
            np.stack(input_rows, axis=0)
            if input_rows
            else np.empty((0, max_length), dtype=np.int64)
        )
        attention_mask = (
            np.stack(mask_rows, axis=0)
            if mask_rows
            else np.empty((0, max_length), dtype=np.int64)
        )

        np.savez(
            out_root / f"{split_name}.npz",
            input_ids=input_ids,
            attention_mask=attention_mask,
            movement_ids=np.asarray(movement_ids, dtype=object),
        )
        summary["splits"][split_name] = {
            "samples": int(input_ids.shape[0]),
            "files": len(files),
            "path": str(out_root / f"{split_name}.npz"),
        }

    return summary


@hydra.main(version_base=None, config_path=CONF_PATH, config_name="preprocess")
def _main(cfg: DictConfig) -> None:
    payload = OmegaConf.to_container(cfg, resolve=True)
    if not isinstance(payload, dict):
        raise TypeError("Invalid preprocess config")

    preprocess_payload = dict(payload.get("preprocess", payload))

    sharding_payload = dict(preprocess_payload.get("sharding", {}))
    for legacy_key in ("stage", "task", "include_structure_markers"):
        sharding_payload.pop(legacy_key, None)

    config = PreprocessConfig(
        enabled=bool(preprocess_payload.get("enabled", True)),
        input_dir=str(preprocess_payload.get("input_dir", "data/raw")),
        output_dir=str(preprocess_payload.get("output_dir", "data/processed")),
        labels_path=str(preprocess_payload.get("labels_path", "data/labels/labels_v1.json")),
        strip=preprocess_payload.get("strip"),
        augmentation=AugmentationSettings(**dict(preprocess_payload.get("augmentation", {}))),
        tokenize=TokenizeSettings(**dict(preprocess_payload.get("tokenize", {}))),
        sharding=ShardingSettings(**sharding_payload),
        bpe=BPESettings(**dict(preprocess_payload.get("bpe", {}))),
    )

    preprocess_summary = None
    if config.enabled:
        preprocessor = LilyPondPreprocessor(strip_sections=config.strip)
        preprocess_summary = preprocessor.preprocess_to_dataset(
            input_dir=config.input_dir,
            output_dir=config.output_dir,
            labels_path=config.labels_path,
            augmentation_config={
                "enable_transposition": config.augmentation.enable_transposition,
                "enable_absolute_relative": config.augmentation.enable_absolute_relative,
                "enable_articulation_variants": config.augmentation.enable_articulation_variants,
                "enable_barline_variants": config.augmentation.enable_barline_variants,
                "enable_retrograde": config.augmentation.enable_retrograde,
                "enable_inversion": config.augmentation.enable_inversion,
                "include_original": config.augmentation.include_original,
            },
        )

    tokenize_summary = None
    if config.tokenize.enabled:
        tokenize_summary = _tokenize_mlm_unsharded(
            data_dir=config.output_dir,
            tokenizer_path=config.tokenize.tokenizer_path,
            output_dir=config.tokenize.output_dir,
            max_length=config.tokenize.max_length,
            stride=config.tokenize.stride,
            eval_ratio=config.tokenize.eval_ratio,
            seed=config.tokenize.seed,
        )

    sharding_summary = None
    if config.sharding.enabled:
        _pretokenize_mlm(
            data_dir=config.output_dir,
            tokenizer_path=config.sharding.tokenizer_path,
            output_dir=config.sharding.output_dir,
            max_length=config.sharding.max_length,
            stride=config.sharding.stride,
            shard_size=config.sharding.shard_size,
            eval_ratio=config.sharding.eval_ratio,
            seed=config.sharding.seed,
        )
        sharding_summary = {
            "enabled": True,
            "stage": "mlm",
            "output_dir": config.sharding.output_dir,
        }

    bpe_summary = None
    if config.bpe.enabled:
        tokenizer = LilyPondTokenizer()
        corpus = tokenizer.build_corpus(
            config.output_dir,
        )
        fast_tokenizer = tokenizer.train(
            corpus=corpus,
            vocab_size=config.bpe.vocab_size,
            min_frequency=config.bpe.min_frequency,
            number_placeholders=config.bpe.number_placeholders,
        )
        saved_dir = tokenizer.save(config.bpe.output_dir)
        bpe_summary = {
            "enabled": True,
            "num_corpus_samples": len(corpus),
            "vocab_size": int(fast_tokenizer.vocab_size),
            "output_dir": str(saved_dir),
        }

    print(
        json.dumps(
            {
                "preprocess": preprocess_summary,
                "tokenize": tokenize_summary,
                "sharding": sharding_summary,
                "bpe": bpe_summary,
            },
            indent=2,
            ensure_ascii=False,
        )
    )


def main() -> None:
    _main()
