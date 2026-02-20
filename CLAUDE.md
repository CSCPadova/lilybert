# CLAUDE.md

Guidance for coding agents working in this repository.

## Project Summary

lilyBERT is a Python project for MIR classification on LilyPond notation.

Focus on classification workflows:
- preprocessing LilyPond scores into movement-level artifacts,
- parser-aware tokenizer training,
- label encoding for supported tasks,
- grouped stratified cross-validation training,
- movement-level aggregation and metrics,
- dataset/model upload helpers.

## Environment

- Python `>=3.11`
- Dependency manager: `uv`
- Build backend: `hatchling`
- Package root: `lilybert/__init__.py`

## Common Commands

### Setup
```bash
uv sync
uv pip install -e ".[dev]"
```

### Tests
```bash
pytest tests/
pytest tests/test_basic.py -v
pytest tests/ --cov=lilybert
pytest -m "not slow"
pytest -m "not model"
```

### Code quality
```bash
black lilybert/ tests/
isort lilybert/ tests/
flake8 lilybert/ tests/
```

### Entry points
```bash
lilybert preprocess
lilybert train-tokenizer
lilybert train
lilybert evaluate
lilybert predict
lilybert run-experiment

# Meta tooling kept outside package command
python scripts/generate_tables.py
python scripts/upload_dataset.py
python scripts/upload_model.py
```

## Architecture

### Data (`lilybert/data/`)
- `parser.py` - LilyPond parser with python-ly integration
  - Syntax validation
  - Pitch language detection and conversion (English ↔ Italian)
  - Duration normalization
  - Multilingual notation support
- `preprocessor.py`
- `tokenizer.py`
- `label_encoder.py`
- `dataset.py`
- `repository.py`

### Models (`lilybert/models/`)
- `bert_classifier.py`
- `config.py`

### Training (`lilybert/training/`)
- `cross_validation.py`
- `config.py`
- `trainer.py`
- `cli.py`

### Evaluation (`lilybert/evaluation/`)
- `aggregation.py`
- `metrics.py`
- `cli.py`

### Inference (`lilybert/inference/`)
- `pipeline.py`
- `cli.py`

### Scripts (`lilybert/scripts/`)
- preprocess, tokenizer training, experiment orchestration, table generation, hub upload wrappers

## Development Guidelines

- Use TDD for feature work and bug fixes.
- Keep edits minimal and scoped.
- Prefer `lilybert` imports only.
- Keep `data/labels/labels_v1.json` unchanged unless explicitly requested.
