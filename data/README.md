# Data Directory

This directory holds the datasets used for training and evaluation.

## Downloading BMdataset

BMdataset (347 compilable LilyPond scores, 2,646 movements) is available on Zenodo:

> <https://doi.org/10.5281/zenodo.18723290>

Download and extract the archive into `data/raw/`:

```bash
# After downloading from Zenodo
unzip baroquemusic.zip -d data/raw/
```

## Directory structure

```
data/
├── raw/                 # Original LilyPond (.ly) files
├── processed/           # Preprocessed movement-level artifacts
├── labels/
│   └── labels_v1.json   # Metadata labels (composer, form, instrumentation, ...)
└── README.md
```

## Preprocessing

Use the CLI to preprocess raw LilyPond files:

```bash
preprocess \
  preprocess.input_dir=data/raw \
  preprocess.output_dir=data/processed
```

Processed files are movement-level `.ly` files accompanied by a `metadata.json` manifest.

## File validation

Validate LilyPond files before preprocessing:

```bash
# Check syntax with the LilyPond compiler
lilypond --png -o /tmp/ data/raw/piece.ly

# Or use the built-in parser
python -c "
from lilybert.data import LilyPondParser
parser = LilyPondParser()
print(parser.validate_syntax(open('data/raw/piece.ly').read()))
"
```
