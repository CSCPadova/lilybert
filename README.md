# lilyBERT

MIR classification on LilyPond music notation.

lilyBERT provides an end-to-end classification pipeline for symbolic scores, from LilyPond preprocessing to model training, evaluation, and Hub upload utilities.

## Installation

### Using uv (recommended)

```bash
uv sync
uv pip install -e ".[dev]"
```

### Using pip

```bash
pip install -e .
pip install -e ".[dev]"
```

## Core Commands

### Data preparation

```bash
lilybert preprocess \
  --input-dir data/raw \
  --output-dir data/processed \
  --labels-path data/labels/labels_v1.json
```

### Tokenizer training

```bash
lilybert train-tokenizer \
  --processed-dir data/processed \
  --output-dir artifacts/tokenizer \
  --vocab-size 8000 \
  --notation-mode both

# English-only tokenizer corpus
lilybert train-tokenizer --processed-dir data/processed --notation-mode english
```

### Cross-validated training

```bash
lilybert train \
  --task composer \
  --data-dir data/processed \
  --tokenizer-path artifacts/tokenizer \
  --n-folds 5
```

### Classification evaluation

```bash
lilybert evaluate --y-true y_true.npy --y-pred y_pred.npy
lilybert evaluate --y-true y_true.npy --y-pred y_pred.npy --multi-label
```

### Multi-task experiment runner (Hydra)

```bash
lilybert run-experiment

# Use a predefined task set
lilybert run-experiment tasks=baseline

# Select tokenizer artifact automatically by notation mode
lilybert run-experiment dataset.tokenizer_notation_mode=english

# Preset: English-only tokenizer experiment
lilybert run-experiment dataset=english_only

# Preset: English+Italian tokenizer experiment
lilybert run-experiment dataset=english_italiano

# Override modular config values from CLI
lilybert run-experiment training.n_folds=3 training.batch_size=8 runtime.output_dir=outputs/exp_debug

# Step-oriented training with periodic eval/logging
lilybert run-experiment training.max_steps=2000 training.eval_steps=200 training.log_steps=20

# Enable W&B logging (one run per fold)
lilybert run-experiment runtime.wandb.enabled=true runtime.wandb.project=lilybert

# Switch config file
lilybert run-experiment --config-name experiment
```

### Result table generation (meta tooling)

```bash
python scripts/generate_tables.py \
  --results outputs/experiments/results.json \
  --output outputs/tables/results.md
```

### HuggingFace Hub upload utilities (meta tooling)

```bash
python scripts/upload_dataset.py --help
python scripts/upload_model.py --help
```

## Python API

```python
from lilybert.data import LilyPondPreprocessor, LilyPondTokenizer, LabelEncoder
from lilybert.models import LilyBERTClassifier, TrainingMode
from lilybert.training import TrainingConfig, StratifiedKFoldTrainer
from lilybert.evaluation import ClassificationMetrics, WindowAggregator
```

## Project Structure

```text
conf/           # hydra config tree (dataset/model/training/runtime/tasks)

lilybert/
  data/         # parser, preprocessing, tokenizer, label hierarchy, dataset, repository API
  models/       # BERT classifier and model config
  training/     # grouped stratified CV trainer and config
  evaluation/   # aggregation and classification metrics
  scripts/      # packaged script entrypoints
```

## Testing

```bash
pytest tests/
pytest tests/test_basic.py -v
pytest tests/ --cov=lilybert
pytest -m "not slow"
pytest -m "not model"
```

Markers: `slow`, `integration`, `model`.

## License

Apache-2.0. See [LICENSE](LICENSE).
