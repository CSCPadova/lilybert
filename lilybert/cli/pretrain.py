"""Packaged entrypoint for Stage-1 MLM pretraining.

Uses Hydra for configuration. Pass overrides as positional arguments:

    lilybert pretrain --config-name pretraining/default learning_rate=1e-4 epochs=5
"""

from __future__ import annotations

from dataclasses import fields
import json
from pathlib import Path
from typing import Optional

import typer
from typing_extensions import Annotated

from lilybert.pretraining import MLMPretrainer, PretrainingConfig


def _resolve_config_dir(config_dir: str) -> Path:
    path = Path(config_dir)
    if path.is_absolute():
        return path.resolve()
    cwd_candidate = (Path.cwd() / path).resolve()
    if cwd_candidate.exists():
        return cwd_candidate
    project_candidate = (Path(__file__).resolve().parents[2] / path).resolve()
    return project_candidate


def main(
    config_dir: Annotated[
        str, typer.Option(help="Path to Hydra config directory")
    ] = "conf",
    config_name: Annotated[
        str, typer.Option(help="Hydra config name")
    ] = "pretraining/default",
    ctx: typer.Context = None,
) -> None:
    import hydra
    from omegaconf import OmegaConf

    overrides = ctx.args if ctx else []

    resolved_dir = _resolve_config_dir(config_dir)
    if not resolved_dir.exists():
        raise FileNotFoundError(f"Hydra config directory not found: {resolved_dir}")

    with hydra.initialize_config_dir(
        version_base=None, config_dir=str(resolved_dir)
    ):
        cfg = hydra.compose(config_name=config_name, overrides=list(overrides))

    cfg_dict = OmegaConf.to_container(cfg, resolve=True)
    if not isinstance(cfg_dict, dict):
        raise TypeError("Expected a dict-like Hydra config for pretraining")

    allowed_fields = {item.name for item in fields(PretrainingConfig)}

    if isinstance(cfg_dict.get("pretraining"), dict):
        merged = dict(cfg_dict["pretraining"])
        for key, value in cfg_dict.items():
            if key in allowed_fields:
                merged[key] = value
        cfg_dict = merged

    config_payload = {
        key: value for key, value in cfg_dict.items() if key in allowed_fields
    }

    config = PretrainingConfig(**config_payload)
    summary = MLMPretrainer(config=config).run()
    print(json.dumps(summary, indent=2, ensure_ascii=False))
