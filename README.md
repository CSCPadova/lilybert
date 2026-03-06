# lilyBERT

MIR classification on LilyPond music notation.

lilyBERT provides a unified Hydra-based workflow for:
- preprocessing any LilyPond dataset,
- optional augmentation/sharding/BPE at preprocess time,
- unified model training (pretraining or classification),
- evaluation, prediction, and linear probing.

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

## Command surface

The CLI is intentionally small:
- `ly-preprocess`
- `ly-train`
- `ly-evaluate`
- `ly-predict`
- `ly-probe`

## Core workflows

### 1) Unified preprocessing

`ly-preprocess` is the single preprocessing entrypoint for any LilyPond dataset.

```bash
# Minimal preprocessing
ly-preprocess input_dir=data/raw output_dir=data/processed labels_path=data/labels/labels_v1.json

# Enable augmentation
ly-preprocess \
  input_dir=data/raw \
  output_dir=data/processed \
  augmentation.enable_transposition=true \
  augmentation.enable_absolute_relative=true \
  augmentation.enable_articulation_variants=true \
  augmentation.enable_barline_variants=true \
  augmentation.enable_retrograde=true \
  augmentation.enable_inversion=true

# Add optional sharding and optional BPE training
ly-preprocess \
  input_dir=data/raw \
  output_dir=data/processed \
  sharding.enabled=true \
  sharding.stage=mlm \
  sharding.tokenizer_path=artifacts/tokenizer \
  sharding.output_dir=artifacts/pretokenized \
  bpe.enabled=true \
  bpe.output_dir=artifacts/tokenizer \
  bpe.vocab_size=8000
```

### 2) Unified training

`ly-train` is the single model training command.

```bash
# Stage-1 MLM pretraining
ly-train \
  stage=pretrain \
  data_dir=data/processed \
  tokenizer_path=artifacts/tokenizer \
  output_dir=outputs/pretraining

# Classification training / fine-tuning
# If pretrained_model points to a checkpoint, this is treated as fine-tuning.
ly-train \
  stage=classify \
  task=composer \
  data_dir=data/processed \
  tokenizer_path=artifacts/tokenizer \
  pretrained_model=bert-base \
  output_dir=outputs/cv
```

Supported classification tasks in this refactor:
- `composer`
- `style`
- `instrument`
- `key_root`

### 3) Evaluation

```bash
ly-evaluate y_true=y_true.npy y_pred=y_pred.npy multi_label=false
```

### 4) Prediction

```bash
ly-predict \
  checkpoint=outputs/cv/fold_1/best_checkpoint \
  input_dir=data/processed \
  task=composer \
  language=english \
  format=json
```

### 5) Linear probing

`ly-probe` runs a separate linear-probe workflow on frozen encoder embeddings.

```bash
ly-probe \
  checkpoint_dir=outputs/cv/fold_1/best_checkpoint \
  tokenizer_path=artifacts/tokenizer \
  data_dir=data/processed \
  task=style
```

## Notes

- Dataset-specific pipelines (Mutopia/Baroque-only CLIs) were removed.
- `run-experiment` orchestration was removed.
- Hugging Face upload CLIs were removed.
- File combination/compilation/LilyPond version updates are expected in separate scripts.

## Python API

```python
from lilybert.data import LilyPondPreprocessor, LilyPondTokenizer, LabelEncoder
from lilybert.models import LilyBERTClassifier, LilyBERTEncoder
from lilybert.training import TrainingConfig, StratifiedKFoldTrainer
from lilybert.evaluation import ClassificationMetrics, WindowAggregator
```

## Testing

```bash
pytest tests/
pytest tests/test_basic.py -v
pytest tests/ --cov=lilybert
pytest -m "not slow"
pytest -m "not model"
```

## License

Apache-2.0. See [LICENSE](LICENSE).
