# lilyBERT

CodeBERT-based representation learning for LilyPond, treating music notation as source code.

LilyPond is a text-based music engraving language with formal grammar, block structure, and backslash commands — making it structurally similar to a programming language. lilyBERT leverages this by starting from [CodeBERT](https://huggingface.co/microsoft/codebert-base) (`microsoft/codebert-base`), a RoBERTa model pretrained on six programming languages, and adapting it to LilyPond through:

- preprocessing LilyPond source files into movement-level artifacts,
- extending CodeBERT's tokenizer with LilyPond-specific backslash commands,
- MLM pretraining on LilyPond corpora to learn notation syntax and structure,
- linear probing to evaluate whether the adapted model encodes musically meaningful properties,
- embedding extraction for downstream tasks and masked-token infilling.

## Current Status (March 2026)

The default pretrained backbone is `microsoft/codebert-base`. CodeBERT's RoBERTa vocabulary is extended with LilyPond backslash commands (defined in `lilybert/data/tokenizer_builder.py`) so that notation keywords like `\relative`, `\time`, `\key`, and `\fermata` are represented as single tokens rather than subword fragments.

- Tokenization stack has been unified and de-duplicated:
  - `lilybert.data.lexer.MusicalLexer` is the single source of truth for LilyPond → linear token conversion.
  - `lilybert.data.parser.LilyPondParser` is now a slim utility module (validation, comment removal, brace matching, pitch helpers).
  - `lilybert.data.tokenizer.LilyPondTokenizer` delegates musical tokenization to `MusicalLexer`.
- Preprocessing and tokenization pipelines are aligned end-to-end (preprocess → BPE → shard → verify).
- Unified SLURM pipeline is available in `scripts/slurm_pipeline.sh` and is now meant to be submitted directly with `sbatch`.
- Legacy split SLURM scripts have been removed in favor of a single pipeline script.
- Repository history was cleaned to remove `data/raw/` LilyPond files from Git history.

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
- `ly-preprocess` — preprocessing, tokenizer building, and sharding
- `ly-train` — MLM pretraining and linear-probe classification
- `embed` — export frozen-encoder embeddings for downstream tasks (similarity, clustering, infilling)

## Documentation

- `docs/tokenization-bpe-design.md`
- `docs/training-parameter-choices.md`
- `docs/linear-probing-protocol.md`

## Configuration layout

Hydra configuration follows a single-base pattern:

- base config: `conf/config.yaml`
- shared groups: `conf/dataset/default.yaml`, `conf/model/default.yaml`, `conf/runtime/default.yaml`, `conf/environment/{local,slurm}.yaml`
- thin CLI wrappers: `conf/train.yaml`, `conf/preprocess.yaml`

Training uses one nested tree with mode switch:

- `train.mode=classify` with `train.classify.*`
- `train.mode=pretrain` with `train.pretrain.*`

## Core workflows

### 0) Unified SLURM pipeline (recommended on cluster)

Use the single pipeline script for preprocessing + tokenizer training + sharding + verification.

```bash
# Run all stages with defaults defined in the script
sbatch scripts/slurm_pipeline.sh

# Override key paths/params via environment export at submission time
sbatch --export=ALL,INPUT_DIR=/data/ly,OUTPUT_DIR=/scratch/lilybert_artifacts,VOCAB_SIZE=12000 scripts/slurm_pipeline.sh

# Run only one stage (1=preprocess, 2=bpe, 3=shard, 4=verify)
sbatch --export=ALL,STAGE=2 scripts/slurm_pipeline.sh
```

Artifacts produced by the pipeline:
- `${OUTPUT_DIR}/processed`
- `${OUTPUT_DIR}/tokenizer`
- `${OUTPUT_DIR}/pretokenized`

### 1) Unified preprocessing

`ly-preprocess` is the single preprocessing entrypoint for any LilyPond dataset.

```bash
# Minimal preprocessing
ly-preprocess \
  preprocess.input_dir=data/raw \
  preprocess.output_dir=data/processed \
  preprocess.labels_path=data/labels/labels_v1.json

# Enable augmentation
ly-preprocess \
  preprocess.input_dir=data/raw \
  preprocess.output_dir=data/processed \
  preprocess.augmentation.enable_transposition=true \
  preprocess.augmentation.enable_absolute_relative=true \
  preprocess.augmentation.enable_articulation_variants=true \
  preprocess.augmentation.enable_barline_variants=true \
  preprocess.augmentation.enable_retrograde=true \
  preprocess.augmentation.enable_inversion=true

# Add optional sharding and optional BPE training
ly-preprocess \
  preprocess.input_dir=data/raw \
  preprocess.output_dir=data/processed \
  preprocess.sharding.enabled=true \
  preprocess.sharding.stage=mlm \
  preprocess.sharding.tokenizer_path=artifacts/tokenizer \
  preprocess.sharding.output_dir=artifacts/pretokenized \
  preprocess.bpe.enabled=true \
  preprocess.bpe.output_dir=artifacts/tokenizer \
  preprocess.bpe.vocab_size=8000
```

### 2) Unified training

`ly-train` is the single model training command.

```bash
# Stage-1 MLM pretraining
ly-train \
  train.mode=pretrain \
  dataset.processed_dir=data/processed \
  dataset.tokenizer_path=artifacts/tokenizer \
  runtime.output_dir=outputs/pretraining

# Classification via frozen embeddings + sklearn linear probing
ly-train \
  train.mode=classify \
  train.task=composer \
  dataset.processed_dir=data/processed \
  dataset.tokenizer_path=artifacts/tokenizer \
  model.pretrained_model=microsoft/codebert-base \
  runtime.output_dir=outputs/cv
```

Supported classification tasks:
- `composer`
- `style`
- `instrument`
- `key_root`

Classification mode uses grouped stratified 5-fold CV and trains a linear probe
(`sklearn` LogisticRegression, OvR for multi-label) on movement-level embeddings
extracted from a frozen CodeBERT encoder. These probing tasks evaluate whether
the model's representations, after MLM adaptation on LilyPond, encode musically
meaningful properties from source code alone.

## Notes

- Dataset-specific pipelines (Mutopia/Baroque-only CLIs) were removed.
- File combination/compilation/LilyPond version updates are expected in separate scripts.

## Python API

```python
# CodeBERT-based pipeline for LilyPond representation learning
from lilybert.data import LilyPondPreprocessor, LilyPondTokenizer, LabelEncoder
from lilybert.models import LilyBERTClassifier, LilyBERTEncoder
from lilybert.training import TrainingConfig, StratifiedKFoldTrainer
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
