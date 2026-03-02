#!/bin/bash
#SBATCH --job-name=lilybert-preprocess
#SBATCH --output=logs/preprocess_%j.out
#SBATCH --error=logs/preprocess_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=32G
#SBATCH --time=24:00:00

set -euo pipefail

# ---------------------------------------------------------------------------
# Preprocess a custom folder of .ly files, then pretokenize and shard them
# for MLM pretraining.
#
# Usage:
#   sbatch scripts/preprocess_dataset.sh
#
#   # Override defaults via --export:
#   sbatch --export=ALL,INPUT_DIR=data/my_corpus,SHARD_SIZE=4096 \
#       scripts/preprocess_dataset.sh
#
#   # Skip preprocessing (already done), only pretokenize:
#   sbatch --export=ALL,SKIP_PREPROCESS=1 scripts/preprocess_dataset.sh
#
#   # Skip pretokenization (only preprocess):
#   sbatch --export=ALL,SKIP_PRETOKENIZE=1 scripts/preprocess_dataset.sh
# ---------------------------------------------------------------------------

# ── Configuration (override via environment variables) ─────────────────────

# Input directory containing raw .ly files
INPUT_DIR="data/ly"

# Preprocessing output (language-separated variants)
PREPROCESSED_DIR="data/custom_preprocessed"

# Tokenizer to use for pretokenization
TOKENIZER_PATH="artifacts/tokenizer"

# Pretokenized shards output
SHARDS_DIR="artifacts/pretokenized/mlm"

# Pretokenization settings
SHARD_SIZE="8192"
MAX_LENGTH="2048"
EVAL_RATIO="0.01"
LANGUAGE="english,italiano,nederlands"  # comma-separated list of languages to include
SEED="42"

# Worker count: SLURM cpus > nproc fallback
NUM_WORKERS="${NUM_WORKERS:-${SLURM_CPUS_PER_TASK:-$(nproc)}}"

# Stage toggles
SKIP_PREPROCESS="${SKIP_PREPROCESS:-0}"
SKIP_PRETOKENIZE="${SKIP_PRETOKENIZE:-0}"

# Include augmentation during preprocessing
INCLUDE_AUGMENTATION="1"

# ── Logging ────────────────────────────────────────────────────────────────

mkdir -p logs

echo "============================================"
echo " lilybert preprocess + pretokenize pipeline"
echo "============================================"
echo "Job ID:           ${SLURM_JOB_ID:-local}"
echo "Date:             $(date)"
echo "Host:             $(hostname)"
echo "CPUs:             ${NUM_WORKERS}"
echo "INPUT_DIR:        ${INPUT_DIR}"
echo "PREPROCESSED_DIR: ${PREPROCESSED_DIR}"
echo "TOKENIZER_PATH:   ${TOKENIZER_PATH}"
echo "SHARDS_DIR:       ${SHARDS_DIR}"
echo "SHARD_SIZE:       ${SHARD_SIZE}"
echo "MAX_LENGTH:       ${MAX_LENGTH}"
echo "SKIP_PREPROCESS:  ${SKIP_PREPROCESS}"
echo "SKIP_PRETOKENIZE: ${SKIP_PRETOKENIZE}"
echo "============================================"

# ── Stage 1: Preprocess ───────────────────────────────────────────────────

if [[ "${SKIP_PREPROCESS}" == "0" ]]; then
    echo ""
    echo "[Stage 1/2] Preprocessing .ly files from ${INPUT_DIR} ..."
    echo ""

    PREPROCESS_ARGS=(
        --input-dir "${INPUT_DIR}"
        --output-dir "${PREPROCESSED_DIR}"
        --num-workers "${NUM_WORKERS}"
        --skip-on-error
    )

    if [[ "${INCLUDE_AUGMENTATION}" == "1" ]]; then
        PREPROCESS_ARGS+=(--include-augmentation)
    fi

    uv run lilybert mutopia-preprocess "${PREPROCESS_ARGS[@]}"

    echo ""
    echo "[Stage 1/2] Preprocessing complete."
else
    echo ""
    echo "[Stage 1/2] Skipped (SKIP_PREPROCESS=1)."
fi

# ── Stage 2: Pretokenize & shard ──────────────────────────────────────────

if [[ "${SKIP_PRETOKENIZE}" == "0" ]]; then
    echo ""
    echo "[Stage 2/2] Pretokenizing and sharding ..."
    echo ""

    uv run lilybert pretokenize \
        --stage mlm \
        --data-dir "${PREPROCESSED_DIR}" \
        --tokenizer-path "${TOKENIZER_PATH}" \
        --output-dir "${SHARDS_DIR}" \
        --max-length "${MAX_LENGTH}" \
        --shard-size "${SHARD_SIZE}" \
        --eval-ratio "${EVAL_RATIO}" \
        --language "${LANGUAGE}" \
        --seed "${SEED}"

    echo ""
    echo "[Stage 2/2] Pretokenization complete."
else
    echo ""
    echo "[Stage 2/2] Skipped (SKIP_PRETOKENIZE=1)."
fi

# ── Done ──────────────────────────────────────────────────────────────────

echo ""
echo "============================================"
echo " Pipeline finished at $(date)"
echo "============================================"
