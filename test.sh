#!/bin/bash
#SBATCH --partition=allgroups
#SBATCH --job-name=pretrain-pdmx
#SBATCH --output=logs/pretrain_%j.out
#SBATCH --error=logs/pretrain_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=72:00:00
#SBATCH --gres=gpu:l40s:2
# -------------------------------------------------------
# lilyBERT MLM pretraining on pretokenized sharded data.
#
# Required arguments (pass via --export or environment):
#   OUTPUT_DIR       - where to save the model
#   TOKENIZER_PATH   - path to trained tokenizer
#   SHARDS_DIR       - path to pretokenized shards
#
# Optional:
#   NUM_GPUS         - override GPU count (default: auto-detect)
#   BATCH_SIZE       - per-device batch size (default: 16)
#   EPOCHS           - training epochs (default: 3)
#   MAX_LENGTH       - sequence length (default: 2048)
#   LEARNING_RATE    - (default: 5e-5)
#   NUM_WORKERS      - dataloader workers (default: 4)
#   WANDB_PROJECT    - wandb project name
#   WANDB_ENTITY     - wandb entity/team
#   WANDB_RUN_NAME   - wandb run name
#
# Example:
#   sbatch --gres=gpu:4 scripts/pretrain.slurm \
#     --export=ALL,OUTPUT_DIR=outputs/pretrain_run1,TOKENIZER_PATH=artifacts/tokenizer,SHARDS_DIR=data/mlm
# -------------------------------------------------------

set -euo pipefail

export HYDRA_FULL_ERROR=1

export OUTPUT_DIR=/nfsd/voce/machine_learning/experiments/lilybert/outputs/pretrain
export TOKENIZER_PATH=/nfsd/voce/machine_learning/experiments/lilybert/artifacts/tokenizer
export SHARDS_DIR=/nfsd/voce/machine_learning/experiments/lilybert/artifacts/pretokenized/mlm
export WANDB_PROJECT=lilybert
export WANDB_RUN_NAME=pretrain

# --- Validate required arguments ---
# if [ -z "${OUTPUT_DIR:-}" ]; then
#     echo "ERROR: OUTPUT_DIR is not set" >&2; exit 1
# fi
# if [ -z "${TOKENIZER_PATH:-}" ]; then
#     echo "ERROR: TOKENIZER_PATH is not set" >&2; exit 1
# fi
# if [ -z "${SHARDS_DIR:-}" ]; then
#     echo "ERROR: SHARDS_DIR is not set" >&2; exit 1
# fi

# --- Detect GPUs ---
if [ -n "${NUM_GPUS:-}" ]; then
    NGPUS="$NUM_GPUS"
elif [ -n "${SLURM_GPUS_ON_NODE:-}" ]; then
    NGPUS="$SLURM_GPUS_ON_NODE"
elif [ -n "${CUDA_VISIBLE_DEVICES:-}" ]; then
    NGPUS=$(echo "$CUDA_VISIBLE_DEVICES" | awk -F',' '{print NF}')
else
    NGPUS=$(nvidia-smi -L 2>/dev/null | wc -l || echo 1)
fi
echo "Detected ${NGPUS} GPU(s)"

# --- Defaults ---
BATCH_SIZE="${BATCH_SIZE:-24}"
EPOCHS="${EPOCHS:-1}"
MAX_STEPS="${MAX_STEPS:--1}"
MAX_LENGTH="${MAX_LENGTH:-2048}"
LEARNING_RATE="${LEARNING_RATE:-5e-5}"
NUM_WORKERS="${NUM_WORKERS:-8}"

# --- Create log directory ---
mkdir -p logs

# Sanity checks
test -f "${SHARDS_DIR}/train/manifest.json" || { echo "Missing train manifest"; exit 1; }
test -f "${SHARDS_DIR}/eval/manifest.json"  || { echo "Missing eval manifest"; exit 1; }
test -d "${TOKENIZER_PATH}"                 || { echo "Missing tokenizer dir"; exit 1; }

# --- Build command ---
PRETRAIN_OVERRIDES=(
    ++pretokenized_shards_dir="${SHARDS_DIR}"
    ++tokenizer_path="${TOKENIZER_PATH}"
    ++output_dir="${OUTPUT_DIR}"
    ++per_device_train_batch_size="${BATCH_SIZE}"
    ++num_train_epochs="${EPOCHS}"
    ++max_steps="${MAX_STEPS}"
    ++max_length="${MAX_LENGTH}"
    ++learning_rate="${LEARNING_RATE}"
    ++dataloader_num_workers="${NUM_WORKERS}"
)

# --- Optional W&B ---
if [ -n "${WANDB_PROJECT:-}" ]; then
    PRETRAIN_OVERRIDES+=(++wandb_enabled=true ++wandb_project="${WANDB_PROJECT}")
    [ -n "${WANDB_ENTITY:-}" ] && PRETRAIN_OVERRIDES+=(++wandb_entity="${WANDB_ENTITY}")
    [ -n "${WANDB_RUN_NAME:-}" ] && PRETRAIN_OVERRIDES+=(++wandb_run_name="${WANDB_RUN_NAME}")
else
    PRETRAIN_OVERRIDES+=(++wandb_enabled=false)
fi

# --- Launch ---
echo "Job ID: $SLURM_JOB_ID"
echo "Node: $(hostname)"
echo "Output dir: $OUTPUT_DIR"
echo "Shards dir: $SHARDS_DIR"
echo "GPUs: $NGPUS | Batch size: $BATCH_SIZE | Epochs: $EPOCHS | Max steps: $MAX_STEPS"
echo "---"

if [ "$NGPUS" -gt 1 ]; then
    echo "Launching distributed training with torchrun (${NGPUS} GPUs)"
    uv run torchrun \
        --nproc_per_node="$NGPUS" \
        --master_port="${MASTER_PORT:-29501}" \
    -m lilybert pretrain \
        --config-name pretraining/default \
        "${PRETRAIN_OVERRIDES[@]}"
else
    echo "Launching single-GPU training"
    uv run lilybert pretrain \
        --config-name pretraining/default \
        "${PRETRAIN_OVERRIDES[@]}"
fi
