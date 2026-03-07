#!/bin/bash
# ---------------------------------------------------------------------------
# lilyBERT training — SLURM batch script with torchrun.
#
# Supports single-GPU and multi-GPU (DDP/FSDP) training.
# Training configuration is composed from conf/train.yaml with environment=slurm.
# This script only handles SLURM plumbing: venv, GPU detection, launch.
#
# Submit:
#   sbatch scripts/slurm_train.sh
#   sbatch --gres=gpu:4 scripts/slurm_train.sh
#
# To override specific Hydra keys from the command line:
#   sbatch --gres=gpu:2 scripts/slurm_train.sh train.pretrain.learning_rate=1e-4 train.mode=classify
# ---------------------------------------------------------------------------

#SBATCH --job-name=ly-train
#SBATCH --partition=allgroups
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --gres=gpu:1
#SBATCH --time=48:00:00
#SBATCH --output=logs/train_%j.out
#SBATCH --error=logs/train_%j.err

set -euo pipefail

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
echo " lilyBERT training"
echo "============================================"
echo "  SLURM_JOB_ID:  ${SLURM_JOB_ID:-local}"
echo "  NGPUS:          ${NGPUS}"
echo "  Hydra config:   conf/${HYDRA_CONFIG}.yaml (environment=slurm)"
echo "  Extra overrides: $*"
echo "  Started:        $(date)"
echo "============================================"
echo ""

# ── Launch ───────────────────────────────────────────────────────────────
if [[ "${NGPUS}" -gt 1 ]]; then
    echo "Launching with torchrun (${NGPUS} GPUs)..."
    uv run torchrun \
        --standalone \
        --nproc_per_node="${NGPUS}" \
        "$(which ly-train)" \
        --config-name "${HYDRA_CONFIG}" \
        environment=slurm \
        train.mode=pretrain \
        "$@"
else
    echo "Launching single-GPU training..."
    uv run ly-train \
        --config-name "${HYDRA_CONFIG}" \
        environment=slurm \
        train.mode=pretrain \
        "$@"
fi

echo ""
echo "============================================"
echo " Training finished at $(date)"
echo "============================================"
