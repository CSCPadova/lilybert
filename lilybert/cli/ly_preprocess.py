"""Unified dataset preprocessing entrypoint.

Supports:
- movement preprocessing for any LilyPond dataset
- optional augmentation
- optional pretokenized sharding
- optional BPE tokenizer training
"""

from __future__ import annotations

import json
import os
import random
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Optional, Tuple

import hydra
import numpy as np
from omegaconf import DictConfig, OmegaConf
from tqdm import tqdm
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
    num_workers: int = 0
    input_dir: str = "data/raw"
    output_dir: str = "data/processed"
    labels_path: str = "data/labels/labels_v1.json"
    strip: Optional[List[str]] = None
    augmentation: AugmentationSettings = field(default_factory=AugmentationSettings)
    tokenize: TokenizeSettings = field(default_factory=TokenizeSettings)
    sharding: ShardingSettings = field(default_factory=ShardingSettings)
    bpe: BPESettings = field(default_factory=BPESettings)


def _resolve_num_workers(num_workers: int) -> int:
    """Return effective worker count: 0 means use all available CPUs."""
    if num_workers > 0:
        return num_workers
    return os.cpu_count() or 2


def _collect_ly_files(data_dir: Path) -> List[Path]:
    if not data_dir.exists():
        return []
    return sorted(data_dir.glob("*.ly"))


def _tokenize_file_worker(
    file_path: str,
    tokenizer_path: str,
    max_length: int,
    stride: int,
) -> Tuple[str, List[List[int]], List[List[int]]]:
    """Tokenize a single .ly file into windowed (input_ids, attention_mask) rows.

    Runs in a subprocess — loads its own tokenizer and parser instances.
    Returns (movement_id, list_of_id_rows, list_of_mask_rows).
    """
    fp = Path(file_path)
    text = fp.read_text(encoding="utf-8", errors="ignore")

    lily_tokenizer = LilyPondTokenizer()
    parser_tokens = lily_tokenizer._movement_to_parser_tokens(text)
    if not parser_tokens.strip():
        return (fp.stem, [], [])

    tokenizer = PreTrainedTokenizerFast.from_pretrained(tokenizer_path)
    token_ids = tokenizer.encode(parser_tokens, add_special_tokens=False)
    if not token_ids:
        return (fp.stem, [], [])

    pad_id = tokenizer.pad_token_id or 0
    cls_id = tokenizer.cls_token_id
    sep_id = tokenizer.sep_token_id

    body_size = max_length - 2
    step = max(1, body_size - stride)

    if len(token_ids) <= body_size:
        windows = [token_ids]
    else:
        windows = []
        for start in range(0, len(token_ids) - body_size + 1, step):
            windows.append(token_ids[start : start + body_size])
        if windows and windows[-1] != token_ids[-body_size:]:
            windows.append(token_ids[-body_size:])

    id_rows: list[list[int]] = []
    mask_rows: list[list[int]] = []
    for window in windows:
        ids = [cls_id] + window + [sep_id]
        attn = [1] * len(ids)
        pad_len = max_length - len(ids)
        if pad_len > 0:
            ids = ids + [pad_id] * pad_len
            attn = attn + [0] * pad_len
        id_rows.append(ids)
        mask_rows.append(attn)

    return (fp.stem, id_rows, mask_rows)


def _tokenize_mlm_unsharded(
    *,
    data_dir: str,
    tokenizer_path: str,
    output_dir: str,
    max_length: int,
    stride: int,
    eval_ratio: float,
    seed: int,
    num_workers: int = 0,
) -> dict:
    data_path = Path(data_dir)
    all_files = _collect_ly_files(data_path)
    if not all_files:
        raise FileNotFoundError(f"No .ly files found in {data_path}")

    rng = random.Random(seed)
    shuffled = list(all_files)
    rng.shuffle(shuffled)
    split_idx = max(1, int(len(shuffled) * (1 - eval_ratio)))
    train_files = shuffled[:split_idx]
    eval_files = shuffled[split_idx:]

    out_root = Path(output_dir)
    out_root.mkdir(parents=True, exist_ok=True)

    summary = {"output_dir": str(out_root), "splits": {}}
    workers = _resolve_num_workers(num_workers)

    for split_name, files in (("train", train_files), ("eval", eval_files)):
        input_rows: list[np.ndarray] = []
        mask_rows: list[np.ndarray] = []
        movement_ids: list[str] = []

        with ProcessPoolExecutor(max_workers=workers) as exe:
            futures = {
                exe.submit(
                    _tokenize_file_worker,
                    str(fp),
                    tokenizer_path,
                    max_length,
                    stride,
                ): fp
                for fp in files
            }
            for fut in tqdm(
                as_completed(futures),
                total=len(futures),
                desc=f"tokenize/{split_name}",
            ):
                mid, ids_list, masks_list = fut.result()
                for ids, mask in zip(ids_list, masks_list):
                    input_rows.append(np.asarray(ids, dtype=np.int64))
                    mask_rows.append(np.asarray(mask, dtype=np.int64))
                    movement_ids.append(mid)

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
        num_workers=int(preprocess_payload.get("num_workers", 0)),
        input_dir=str(preprocess_payload.get("input_dir", "data/raw")),
        output_dir=str(preprocess_payload.get("output_dir", "data/processed")),
        labels_path=str(
            preprocess_payload.get("labels_path", "data/labels/labels_v1.json")
        ),
        strip=preprocess_payload.get("strip"),
        augmentation=AugmentationSettings(
            **dict(preprocess_payload.get("augmentation", {}))
        ),
        tokenize=TokenizeSettings(**dict(preprocess_payload.get("tokenize", {}))),
        sharding=ShardingSettings(**sharding_payload),
        bpe=BPESettings(**dict(preprocess_payload.get("bpe", {}))),
    )

    workers = _resolve_num_workers(config.num_workers)

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
            num_workers=workers,
        )

    bpe_summary = None
    if config.bpe.enabled:
        tokenizer = LilyPondTokenizer()
        corpus = tokenizer.build_corpus(
            config.output_dir,
            num_workers=workers,
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
            num_workers=workers,
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
            num_workers=workers,
        )
        sharding_summary = {
            "enabled": True,
            "stage": "mlm",
            "output_dir": config.sharding.output_dir,
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
