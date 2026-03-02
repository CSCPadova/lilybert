"""Top-level CLI dispatcher for lilyBERT commands.

This module serves as both the ``lilybert`` console-script entry point
(registered in ``pyproject.toml``) and the ``python -m lilybert`` handler.
"""

from __future__ import annotations

import typer

app = typer.Typer(
    name="lilybert",
    help="lilyBERT command line interface",
    no_args_is_help=True,
)


def _register_commands() -> None:
    """Lazily import and register all subcommand modules."""
    from lilybert.cli import (
        combine,
        evaluate,
        generate_tables,
        mutopia_preprocess,
        predict,
        preprocess,
        pretokenize,
        pretrain,
        run_experiment,
        train,
        train_tokenizer,
        upload_dataset,
        upload_model,
    )

    # --- core pipeline ---
    app.command(name="preprocess", help="Run preprocessing pipeline")(preprocess.main)
    app.command(name="train-tokenizer", help="Train parser-aware tokenizer")(
        train_tokenizer.main
    )
    app.command(
        name="pretrain",
        help="Run Stage-1 MLM pretraining",
        context_settings={"allow_extra_args": True, "allow_interspersed_args": False},
    )(pretrain.main)
    app.command(name="pretokenize", help="Pre-tokenize movement files for fast training")(
        pretokenize.main
    )
    app.command(
        name="train",
        help="Run grouped CV training",
        context_settings={"allow_extra_args": True, "allow_interspersed_args": False},
    )(train.main)
    app.command(name="evaluate", help="Run classification evaluation")(evaluate.main)
    app.command(
        name="run-experiment",
        help="Run Hydra-configured experiments",
        context_settings={"allow_extra_args": True, "allow_interspersed_args": False},
    )(run_experiment.main)
    app.command(name="predict", help="Run batch inference on LilyPond files")(
        predict.main
    )

    # --- data preparation ---
    app.command(name="combine", help="Combine LilyPond files by resolving includes")(
        combine.main
    )
    app.command(
        name="mutopia-preprocess",
        help="Preprocess combined Mutopia files for pretraining",
    )(mutopia_preprocess.main)

    # --- reporting & hub ---
    app.command(
        name="generate-tables", help="Generate result tables from experiment JSON"
    )(generate_tables.main)
    app.command(name="upload-dataset", help="Upload processed dataset to HuggingFace Hub")(
        upload_dataset.main
    )
    app.command(name="upload-model", help="Upload model to HuggingFace Hub")(
        upload_model.main
    )


def main() -> None:
    _register_commands()
    app()


if __name__ == "__main__":
    main()
