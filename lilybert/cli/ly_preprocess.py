"""Unified dataset preprocessing entrypoint.

Supports:
- movement preprocessing for any LilyPond dataset
- optional augmentation
- optional pretokenized sharding
- optional BPE tokenizer training
"""

from __future__ import annotations

import json
from dataclasses import dataclass, field
from typing import List, Optional

import hydra
from omegaconf import DictConfig, OmegaConf

from lilybert.cli.pretokenize import (
    _pretokenize_classification_sharded,
    _pretokenize_mlm,
)
from lilybert.data.preprocessor import LilyPondPreprocessor
from lilybert.data.tokenizer import LilyPondTokenizer


@dataclass
class AugmentationSettings:
    languages: List[str] = field(default_factory=lambda: ["italiano", "english"])
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
    stage: str = "classification"
    task: str = "composer"
    tokenizer_path: str = "artifacts/tokenizer"
    output_dir: str = "artifacts/pretokenized"
    max_length: int = 512
    stride: int = 256
    language: str = "english"
    languages: Optional[str] = None
    shard_size: int = 4096
    include_structure_markers: bool = False
    eval_ratio: float = 0.01
    seed: int = 42


@dataclass
class BPESettings:
    enabled: bool = False
    output_dir: str = "artifacts/tokenizer"
    vocab_size: int = 8000
    min_frequency: int = 0
    number_placeholders: bool = False
    notation_mode: str = "both"
    languages: Optional[List[str]] = None


@dataclass
class PreprocessConfig:
    input_dir: str = "data/raw"
    output_dir: str = "data/processed"
    labels_path: str = "data/labels/labels_v1.json"
    strip: Optional[List[str]] = None
    augmentation: AugmentationSettings = field(default_factory=AugmentationSettings)
    sharding: ShardingSettings = field(default_factory=ShardingSettings)
    bpe: BPESettings = field(default_factory=BPESettings)


@hydra.main(version_base=None, config_path="../../conf", config_name="preprocess")
def _main(cfg: DictConfig) -> None:
    payload = OmegaConf.to_container(cfg, resolve=True)
    if not isinstance(payload, dict):
        raise TypeError("Invalid preprocess config")

    config = PreprocessConfig(
        input_dir=str(payload.get("input_dir", "data/raw")),
        output_dir=str(payload.get("output_dir", "data/processed")),
        labels_path=str(payload.get("labels_path", "data/labels/labels_v1.json")),
        strip=payload.get("strip"),
        augmentation=AugmentationSettings(**dict(payload.get("augmentation", {}))),
        sharding=ShardingSettings(**dict(payload.get("sharding", {}))),
        bpe=BPESettings(**dict(payload.get("bpe", {}))),
    )

    preprocessor = LilyPondPreprocessor(strip_sections=config.strip)
    preprocess_summary = preprocessor.preprocess_to_dataset(
        input_dir=config.input_dir,
        output_dir=config.output_dir,
        labels_path=config.labels_path,
        augmentation_config={
            "languages": config.augmentation.languages,
            "enable_transposition": config.augmentation.enable_transposition,
            "enable_absolute_relative": config.augmentation.enable_absolute_relative,
            "enable_articulation_variants": config.augmentation.enable_articulation_variants,
            "enable_barline_variants": config.augmentation.enable_barline_variants,
            "enable_retrograde": config.augmentation.enable_retrograde,
            "enable_inversion": config.augmentation.enable_inversion,
            "include_original": config.augmentation.include_original,
        },
    )

    sharding_summary = None
    if config.sharding.enabled:
        if config.sharding.stage == "mlm":
            _pretokenize_mlm(
                data_dir=config.output_dir,
                tokenizer_path=config.sharding.tokenizer_path,
                output_dir=config.sharding.output_dir,
                max_length=config.sharding.max_length,
                language=config.sharding.language,
                languages=config.sharding.languages,
                shard_size=config.sharding.shard_size,
                eval_ratio=config.sharding.eval_ratio,
                seed=config.sharding.seed,
            )
        else:
            _pretokenize_classification_sharded(
                task=config.sharding.task,
                data_dir=config.output_dir,
                tokenizer_path=config.sharding.tokenizer_path,
                output_dir=config.sharding.output_dir,
                max_length=config.sharding.max_length,
                stride=config.sharding.stride,
                language=config.sharding.language,
                shard_size=config.sharding.shard_size,
                include_structure_markers=config.sharding.include_structure_markers,
            )
        sharding_summary = {
            "enabled": True,
            "stage": config.sharding.stage,
            "output_dir": config.sharding.output_dir,
        }

    bpe_summary = None
    if config.bpe.enabled:
        tokenizer = LilyPondTokenizer()
        corpus = tokenizer.build_corpus(
            config.output_dir,
            notation_mode=config.bpe.notation_mode,
            languages=config.bpe.languages,
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
                "sharding": sharding_summary,
                "bpe": bpe_summary,
            },
            indent=2,
            ensure_ascii=False,
        )
    )


def main() -> None:
    _main()
