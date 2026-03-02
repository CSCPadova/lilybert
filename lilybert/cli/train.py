"""CLI entrypoint for lilyBERT grouped CV training.

Uses Hydra for configuration. Pass overrides as positional arguments:

    lilybert train --config-name training/default task=composer n_folds=3
"""

from __future__ import annotations

import json
from pathlib import Path
from typing import Optional

import typer
from typing_extensions import Annotated

from lilybert.training.config import TrainingConfig
from lilybert.training.trainer import StratifiedKFoldTrainer


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
    ] = "training/default",
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

    config = TrainingConfig(**cfg_dict)
    trainer = StratifiedKFoldTrainer(config=config)
    results = trainer.run()
    print(json.dumps(results, indent=2, ensure_ascii=False))
