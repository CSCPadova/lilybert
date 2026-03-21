# CLAUDE.md

Guidance for coding agents working in this repository.

## Project Summary

lilyBERT treats LilyPond as a programming language and uses CodeBERT (`microsoft/codebert-base`) as the pretrained backbone for learning LilyPond code representations.

Pipeline:
- preprocessing LilyPond source into movement-level artifacts,
- extending CodeBERT's tokenizer with LilyPond-specific backslash commands,
- MLM pretraining on LilyPond corpora to adapt CodeBERT to notation syntax,
- linear probing (composer, style, instrument, key_root) to evaluate representation quality,
- embedding extraction for downstream tasks and masked-token infilling.

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
- Training settings are under `train.*` (MLM pretraining hyper-parameters).

Common override examples:
- `ly-train train.max_steps=10 train.learning_rate=5e-5`
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
embed
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
- `repository.py`

### Models (`lilybert/models/`)
- `bert_classifier.py` - LilyBERTEncoder (CodeBERT wrapper for MLM training and embedding extraction)

### Training (`lilybert/training/`)
- `config.py` - TrainingConfig dataclass
- `trainer.py` - MLMPretrainer (HuggingFace Trainer-based MLM training)
- `distributed.py` - DDP/FSDP utilities

### Scripts (`scripts/`)
- auxiliary project scripts

## Development Guidelines

- Use TDD for feature work and bug fixes.
- Keep edits minimal and scoped.
- Prefer `lilybert` imports only.
- Keep `data/labels/labels_v1.json` unchanged unless explicitly requested.
