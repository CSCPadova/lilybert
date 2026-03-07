# CLAUDE.md

Guidance for coding agents working in this repository.

## Project Summary

lilyBERT is a Python project for MIR classification on LilyPond notation.

Focus on classification workflows:
- preprocessing LilyPond scores into movement-level artifacts,
- parser-aware tokenizer training,
- label encoding for supported tasks,
- grouped stratified cross-validation linear probing on frozen encoder embeddings.

## Environment

- Python `>=3.11`
- Dependency manager: `uv`
- Build backend: `hatchling`
- Package root: `lilybert/__init__.py`

## Configuration

- Hydra config root: `conf/`
- Base shared config: `conf/config.yaml`
- CLI wrappers (`train.yaml`, `preprocess.yaml`) are thin and import `config`.
- Shared groups: `dataset/default.yaml`, `model/default.yaml`, `runtime/default.yaml`, `environment/{local,slurm}.yaml`.
- Training modes are nested under `train`:
  - `train.mode=classify` with `train.classify.*` (frozen embeddings + sklearn linear probe)
  - `train.mode=pretrain` with `train.pretrain.*`

Common override examples:
- `ly-train train.mode=classify train.task=composer runtime.output_dir=outputs/cv`
- `ly-train train.mode=pretrain train.pretrain.max_steps=10`
- `ly-preprocess preprocess.input_dir=data/raw preprocess.output_dir=data/processed`

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
ly-preprocess
ly-train
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

### Scripts (`lilybert/scripts/`)
- auxiliary project scripts

## Development Guidelines

- Use TDD for feature work and bug fixes.
- Keep edits minimal and scoped.
- Prefer `lilybert` imports only.
- Keep `data/labels/labels_v1.json` unchanged unless explicitly requested.
