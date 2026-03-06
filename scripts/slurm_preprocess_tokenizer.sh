#!/bin/bash
#SBATCH --job-name=ly-prep-bpe
#SBATCH --output=logs/preprocess_%j.out
#SBATCH --error=logs/preprocess_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=08:00:00

set -euo pipefail

# ---------------------------
# User-configurable variables
# ---------------------------
INPUT_DIR="${INPUT_DIR:-data/raw}"
OUTPUT_DIR="${OUTPUT_DIR:-data/processed}"
LABELS_PATH="${LABELS_PATH:-data/labels/labels_v1.json}"

TOKENIZER_OUT_DIR="${TOKENIZER_OUT_DIR:-artifacts/tokenizer}"
VOCAB_SIZE="${VOCAB_SIZE:-8000}"
MIN_FREQUENCY="${MIN_FREQUENCY:-5}"
NUMBER_PLACEHOLDERS="${NUMBER_PLACEHOLDERS:-true}"
NOTATION_MODE="${NOTATION_MODE:-both}"

# Sections to strip (keep markup and layout by NOT listing them)
STRIP_LIST="${STRIP_LIST:-[header,comments,scheme,overrides,pagebreaks]}"

PROJECT_ROOT="${PROJECT_ROOT:-/home/matteo/projects/csc/MaestroGPT}"
VENV_PATH="${VENV_PATH:-$PROJECT_ROOT/.venv/bin/activate}"

mkdir -p "$PROJECT_ROOT/logs"
cd "$PROJECT_ROOT"
source "$VENV_PATH"

echo "============================================"
echo "ly-preprocess + BPE tokenizer training"
echo "============================================"
echo "INPUT_DIR=$INPUT_DIR"
echo "OUTPUT_DIR=$OUTPUT_DIR"
echo "LABELS_PATH=$LABELS_PATH"
echo "TOKENIZER_OUT_DIR=$TOKENIZER_OUT_DIR"
echo "VOCAB_SIZE=$VOCAB_SIZE"
echo "MIN_FREQUENCY=$MIN_FREQUENCY"
echo "NUMBER_PLACEHOLDERS=$NUMBER_PLACEHOLDERS"
echo "NOTATION_MODE=$NOTATION_MODE"
echo "STRIP_LIST=$STRIP_LIST"
echo "Started at: $(date)"
echo "============================================"

ly-preprocess \
  input_dir="$INPUT_DIR" \
  output_dir="$OUTPUT_DIR" \
  labels_path="$LABELS_PATH" \
  strip="$STRIP_LIST" \
  bpe.enabled=true \
  bpe.output_dir="$TOKENIZER_OUT_DIR" \
  bpe.vocab_size="$VOCAB_SIZE" \
  bpe.min_frequency="$MIN_FREQUENCY" \
  bpe.number_placeholders="$NUMBER_PLACEHOLDERS" \
  bpe.notation_mode="$NOTATION_MODE"

echo "Finished at: $(date)"
