#!/bin/bash
# ---------------------------------------------------------------------------
# lilyBERT fine-tuning — SLURM batch script.
#
# Continues CodeBERT MLM pretraining from an existing checkpoint on a new
# LilyPond dataset. Reads pretokenized shards with per-shard metadata.
#
# Required environment variables:
#   CHECKPOINT_PATH  — path to the pretrained model (e.g. .../mlm_model or .../checkpoint-N)
#   SHARDS_DIR       — path to the pretokenized shards for the new dataset
#
# Submit:
#   CHECKPOINT_PATH=/nfsd/.../pdmx/mlm_model \
#   SHARDS_DIR=/nfsd/.../pretokenized/baroquemusic \
#   sbatch scripts/slurm_finetune.sh
#
# Extra Hydra overrides can be appended:
#   sbatch scripts/slurm_finetune.sh train.pretrain.learning_rate=5e-6
# ---------------------------------------------------------------------------

#SBATCH --job-name=ly-finetune
#SBATCH --partition=allgroups
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --gres=gpu:1
#SBATCH --time=24:00:00
#SBATCH --output=logs/finetune_%j.out
#SBATCH --error=logs/finetune_%j.err

set -euo pipefail

# ── Validate required variables ──────────────────────────────────────────
if [[ -z "${CHECKPOINT_PATH:-}" ]]; then
    echo "ERROR: CHECKPOINT_PATH is not set." >&2
    exit 1
fi
if [[ -z "${SHARDS_DIR:-}" ]]; then
    echo "ERROR: SHARDS_DIR is not set." >&2
    exit 1
fi

# ── Activate environment ─────────────────────────────────────────────────
VENV_ACTIVATE="./.venv/bin/activate"
if [[ -f "$VENV_ACTIVATE" ]]; then
    # shellcheck disable=SC1090
    source "$VENV_ACTIVATE"
fi

# ── Auto-detect GPU count ────────────────────────────────────────────────
if [[ -n "${SLURM_GPUS_ON_NODE:-}" ]]; then
    NGPUS="${SLURM_GPUS_ON_NODE}"
elif [[ -n "${SLURM_JOB_GPUS:-}" ]]; then
    NGPUS=$(echo "${SLURM_JOB_GPUS}" | tr ',' '\n' | wc -l)
else
    NGPUS="${NGPUS:-1}"
fi

# ── Setup ────────────────────────────────────────────────────────────────
mkdir -p logs

HYDRA_CONFIG="train"

echo ""
echo "============================================"
echo " lilyBERT fine-tuning"
echo "============================================"
echo "  SLURM_JOB_ID:    ${SLURM_JOB_ID:-local}"
echo "  NGPUS:            ${NGPUS}"
echo "  CHECKPOINT_PATH:  ${CHECKPOINT_PATH}"
echo "  SHARDS_DIR:       ${SHARDS_DIR}"
echo "  Extra overrides:  $*"
echo "  Started:          $(date)"
echo "============================================"
echo ""

# ── Launch ───────────────────────────────────────────────────────────────
HYDRA_OVERRIDES=(
    --config-name "${HYDRA_CONFIG}"
    environment=slurm
    train.mode=pretrain
    "train.pretrain.resume_from_checkpoint=${CHECKPOINT_PATH}"
    "dataset.pretokenized_shards_dir=${SHARDS_DIR}"
    "$@"
)

if [[ "${NGPUS}" -gt 1 ]]; then
    echo "Launching with torchrun (${NGPUS} GPUs)..."
    uv run torchrun \
        --standalone \
        --nproc_per_node="${NGPUS}" \
        "$(which train)" \
        "${HYDRA_OVERRIDES[@]}"
else
    echo "Launching single-GPU training..."
    uv run train \
        "${HYDRA_OVERRIDES[@]}"
fi

echo ""
echo "============================================"
echo " Fine-tuning finished at $(date)"
echo "============================================"
