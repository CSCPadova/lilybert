# lilyBERT

[![Tests](https://github.com/CSCPadova/lilybert/actions/workflows/test.yml/badge.svg)](https://github.com/CSCPadova/lilybert/actions/workflows/test.yml)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Python 3.11+](https://img.shields.io/badge/python-3.11%2B-blue.svg)](https://www.python.org/downloads/)
[![Dataset](https://img.shields.io/badge/Dataset-Zenodo-blue.svg)](https://doi.org/10.5281/zenodo.18723290)
[![Model](https://img.shields.io/badge/Model-HuggingFace-yellow.svg)](https://huggingface.co/csc-unipd/lilybert)

Code companion for **"BMdataset: A Musicologically Curated LilyPond Dataset"**.

LilyPond is a text-based music engraving language with formal grammar, block structure, and backslash commands — making it structurally similar to a programming language. **lilyBERT** leverages this by starting from [CodeBERT](https://huggingface.co/microsoft/codebert-base) and adapting it to LilyPond through vocabulary extension with 115 domain-specific tokens and masked language model (MLM) pre-training.

| Resource | Link |
|----------|------|
| Paper    | SMC 2026 (to appear) |
| Dataset  | [Zenodo (doi:10.5281/zenodo.18723290)](https://doi.org/10.5281/zenodo.18723290) |
| Model    | [HuggingFace (csc-unipd/lilybert)](https://huggingface.co/csc-unipd/lilybert) |
| Code     | [GitHub (CSCPadova/lilybert)](https://github.com/CSCPadova/lilybert) |

## Key results

Linear probing on the out-of-domain Mutopia corpus (layer 6, 5-fold CV):

| Model | Composer Acc. | Style Acc. |
|-------|:---:|:---:|
| CB + PDMX_full (15B tokens) | 80.8 | 82.6 |
| CB + BMdataset (90M tokens) | 82.9 | **83.7** |
| CB + PDMX_90M (90M tokens) | 81.7 | 82.3 |
| CB + PDMX -> BM | **84.3** | 82.9 |

90M tokens of expertly curated data outperform 15B tokens of automatically converted data. Combining broad pre-training with domain-specific fine-tuning yields the best overall composer accuracy (84.3%).

## Installation

```bash
# Using uv (recommended)
uv sync
uv pip install -e ".[dev]"

# Using pip
pip install -e .
pip install -e ".[dev]"
```

## Reproducing paper results

### Download the dataset

Download the BMdataset from [Zenodo](https://doi.org/10.5281/zenodo.18723290) and extract it into `data/raw/`.

### Preprocess

```bash
preprocess \
  preprocess.input_dir=data/raw \
  preprocess.output_dir=data/processed \
  preprocess.sharding.enabled=true \
  preprocess.sharding.tokenizer_path=artifacts/tokenizer \
  preprocess.sharding.output_dir=artifacts/pretokenized
```

### Train (MLM pre-training)

```bash
train \
  train.mode=pretrain \
  dataset.processed_dir=data/processed \
  dataset.tokenizer_path=artifacts/tokenizer \
  runtime.output_dir=outputs/pretraining
```

### Generate figures

```bash
python scripts/generate_layer_plot.py
python scripts/generate_tsne.py
python scripts/generate_confusion_matrix.py
```

## CLI reference

| Command | Description |
|---------|-------------|
| `preprocess` | Preprocessing, tokenizer building, and sharding |
| `train` | MLM pre-training and linear-probe classification |
| `embed` | Extract frozen-encoder embeddings for downstream tasks |

All commands use [Hydra](https://hydra.cc/) for configuration. Run any command with `--help` for usage details.

## Python API

```python
from lilybert.data import LilyPondParser, LilyPondPreprocessor, LilyPondTokenizer
from lilybert.models import LilyBERTEncoder
from lilybert.training import TrainingConfig, MLMPretrainer
```

## Project structure

```
lilybert/
├── cli/                # CLI entry points (preprocess, train, embed)
├── data/               # Parsing, tokenization, sharding, datasets
│   ├── lexer.py        # MusicalLexer — LilyPond to linear token conversion
│   ├── parser.py       # Syntax validation, pitch normalization
│   ├── tokenizer.py    # Parser-aware BPE tokenizer
│   └── ...
├── models/
│   └── bert_classifier.py  # LilyBERTEncoder (CodeBERT wrapper)
└── training/
    ├── trainer.py      # MLMPretrainer (HuggingFace Trainer-based)
    ├── config.py       # TrainingConfig dataclass
    └── distributed.py  # DDP/FSDP utilities

conf/                   # Hydra configuration
scripts/                # SLURM scripts and figure generation
notebooks/              # Linear probing analysis
docs/                   # Design documentation
```

## Configuration

Hydra configuration follows a single-base pattern:

- Base config: `conf/config.yaml`
- Shared groups: `conf/dataset/`, `conf/model/`, `conf/runtime/`, `conf/environment/`

## Testing

```bash
pytest tests/
pytest tests/ -v --cov=lilybert
pytest -m "not slow"    # skip slow tests
pytest -m "not model"   # skip tests requiring model downloads
```

## Citation

```bibtex
@misc{spanio2026bmdataset,
  title     = {BMdataset: A Musicologically Curated LilyPond Dataset},
  author    = {Spanio, Matteo and Guler, Ilay and Roda, Antonio},
  year      = {2026},
  publisher = {Under review},
}
```

## License

Apache-2.0. See [LICENSE](LICENSE).
