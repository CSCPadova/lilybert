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
# Unified preprocessing pipeline using `ly-preprocess`.
#
# Usage:
#   sbatch scripts/preprocess_dataset.sh
#
# Optional overrides via --export:
#   sbatch --export=ALL,INPUT_DIR=data/my_corpus,SHARD_SIZE=4096 scripts/preprocess_dataset.sh
# ---------------------------------------------------------------------------

# ── Configuration (override via environment variables) ─────────────────────

# Input directory containing raw .ly files
INPUT_DIR="data/ly"

# Preprocessing output (language-separated variants + metadata.json)
PREPROCESSED_DIR="data/custom_preprocessed"

# Tokenizer output path (for optional BPE training)
TOKENIZER_PATH="artifacts/tokenizer"

# Pretokenized shards output
SHARDS_DIR="artifacts/pretokenized"

# Pretokenization settings
SHARD_SIZE="8192"
MAX_LENGTH="2048"
EVAL_RATIO="0.01"
SEED="42"

# Tokenizer training settings
VOCAB_SIZE="${VOCAB_SIZE:-8000}"

# Worker count: SLURM cpus > nproc fallback
NUM_WORKERS="${NUM_WORKERS:-${SLURM_CPUS_PER_TASK:-$(nproc)}}"

# Optional pipeline stages
ENABLE_SHARDING="${ENABLE_SHARDING:-1}"
SHARD_STAGE="${SHARD_STAGE:-mlm}"
ENABLE_BPE="${ENABLE_BPE:-1}"

# Augmentation settings
LANGUAGES="english,italiano,nederlands"
ENABLE_TRANSPOSITION="${ENABLE_TRANSPOSITION:-0}"
ENABLE_ABSOLUTE_RELATIVE="${ENABLE_ABSOLUTE_RELATIVE:-0}"
ENABLE_ARTICULATION_VARIANTS="${ENABLE_ARTICULATION_VARIANTS:-0}"
ENABLE_BARLINE_VARIANTS="${ENABLE_BARLINE_VARIANTS:-1}"
ENABLE_RETROGRADE="${ENABLE_RETROGRADE:-0}"
ENABLE_INVERSION="${ENABLE_INVERSION:-0}"

# ── Logging ────────────────────────────────────────────────────────────────

mkdir -p logs

echo "============================================"
echo " ly-preprocess unified pipeline"
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
echo "VOCAB_SIZE:       ${VOCAB_SIZE}"
echo "ENABLE_SHARDING:  ${ENABLE_SHARDING}"
echo "SHARD_STAGE:      ${SHARD_STAGE}"
echo "ENABLE_BPE:       ${ENABLE_BPE}"
echo "============================================"

echo ""
echo "Running unified preprocessing ..."
echo ""

SHARDING_ENABLED=false
if [[ "${ENABLE_SHARDING}" == "1" ]]; then
    SHARDING_ENABLED=true
fi

BPE_ENABLED=false
if [[ "${ENABLE_BPE}" == "1" ]]; then
    BPE_ENABLED=true
fi

uv run ly-preprocess \
    input_dir="${INPUT_DIR}" \
    output_dir="${PREPROCESSED_DIR}" \
    augmentation.languages="[${LANGUAGES}]" \
    augmentation.enable_transposition=$([[ "${ENABLE_TRANSPOSITION}" == "1" ]] && echo true || echo false) \
    augmentation.enable_absolute_relative=$([[ "${ENABLE_ABSOLUTE_RELATIVE}" == "1" ]] && echo true || echo false) \
    augmentation.enable_articulation_variants=$([[ "${ENABLE_ARTICULATION_VARIANTS}" == "1" ]] && echo true || echo false) \
    augmentation.enable_barline_variants=$([[ "${ENABLE_BARLINE_VARIANTS}" == "1" ]] && echo true || echo false) \
    augmentation.enable_retrograde=$([[ "${ENABLE_RETROGRADE}" == "1" ]] && echo true || echo false) \
    augmentation.enable_inversion=$([[ "${ENABLE_INVERSION}" == "1" ]] && echo true || echo false) \
    sharding.enabled=${SHARDING_ENABLED} \
    sharding.stage="${SHARD_STAGE}" \
    sharding.tokenizer_path="${TOKENIZER_PATH}" \
    sharding.output_dir="${SHARDS_DIR}" \
    sharding.max_length="${MAX_LENGTH}" \
    sharding.shard_size="${SHARD_SIZE}" \
    sharding.eval_ratio="${EVAL_RATIO}" \
    sharding.seed="${SEED}" \
    bpe.enabled=${BPE_ENABLED} \
    bpe.output_dir="${TOKENIZER_PATH}" \
    bpe.vocab_size="${VOCAB_SIZE}"

# ── Done ──────────────────────────────────────────────────────────────────

echo ""
echo "============================================"
echo " Unified pipeline finished at $(date)"
echo "============================================"
