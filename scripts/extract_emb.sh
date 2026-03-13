#!/bin/bash
#SBATCH --job-name=ly-embed
#SBATCH --partition=allgroups
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=256G
#SBATCH --gres=gpu:rtx
#SBATCH --time=06:00:00
#SBATCH --output=logs/embed_%j.out
#SBATCH --error=logs/embed_%j.err

set -euo pipefail

VENV_ACTIVATE="./.venv/bin/activate"
if [[ -f "$VENV_ACTIVATE" ]]; then
    # shellcheck disable=SC1090
    source "$VENV_ACTIVATE"
fi

# Auto-detect GPU count
if [[ -n "${SLURM_GPUS_ON_NODE:-}" ]]; then
    NGPUS="${SLURM_GPUS_ON_NODE}"
elif [[ -n "${SLURM_JOB_GPUS:-}" ]]; then
    NGPUS=$(echo "${SLURM_JOB_GPUS}" | tr ',' '\n' | wc -l)
else
    NGPUS="${NGPUS:-1}"
fi

# Setup
mkdir -p logs

HYDRA_CONFIG="train"

echo ""
echo "============================================"
echo " lilyBERT extract embeddings"
echo "============================================"
echo "  SLURM_JOB_ID:    ${SLURM_JOB_ID:-local}"
echo "  NGPUS:            ${NGPUS}"
echo "  CHECKPOINT_PATH:  $1"
echo "  Started:          $(date)"
echo "============================================"
echo ""

uv run python scripts/extract_mutopia_embeddings.py \
        --model $1 \
        --dataset-json $2 \
        --output-dir $3 \
        --device cuda

echo ""
echo "============================================"
echo " Finished at $(date)"
echo "============================================"
