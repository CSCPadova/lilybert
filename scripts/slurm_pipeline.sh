#!/bin/bash
# ---------------------------------------------------------------------------
# lilyBERT preprocessing pipeline — SLURM batch script.
#
# Prepares LilyPond data for CodeBERT MLM pretraining:
#   1. preprocess  — parse/normalise raw .ly files into movement artifacts
#   2. tokenizer   — build CodeBERT tokenizer extended with LilyPond commands
#   3. tokenize    — tokenize into sharded .npz caches (windowed, with stride)
#   4. shard       — pretokenize into sharded .npz caches (MLM-specific)
#
# Both --tokenize and --shard produce sharded output with per-shard metadata.
# The pipeline streams samples through ShardWriter so that only one shard's
# worth of data is held in memory at a time.
#
# Configuration is loaded from Hydra preprocess profile files:
#   conf/preprocess/default.yaml
#   conf/preprocess/slurm.yaml
#
# Example:
#   sbatch scripts/slurm_pipeline.sh --preprocess --tokenizer --shard
#   sbatch scripts/slurm_pipeline.sh --preprocess --profile slurm
#   sbatch scripts/slurm_pipeline.sh --shard preprocess.sharding.shard_size=16384
#
# Stage flags:
#   --preprocess         run movement preprocessing
#   --tokenizer          build/save the CodeBERT tokenizer with LilyPond tokens
#   --tokenize           tokenize into shards (non-MLM)
#   --shard              build pretokenized shards (MLM)
# ---------------------------------------------------------------------------

#SBATCH --job-name=ly-pipeline
#SBATCH --partition=allgroups
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=512G
#SBATCH --time=48:00:00
#SBATCH --output=logs/pipeline_%j.out
#SBATCH --error=logs/pipeline_%j.err

set -euo pipefail

RUN_PREPROCESS=false
RUN_TOKENIZER=false
RUN_TOKENIZE=false
RUN_SHARD=false
PROFILE="slurm"
EXTRA_OVERRIDES=()

print_help() {
    cat <<'EOF'
Usage: scripts/slurm_pipeline.sh [FLAGS] [HYDRA_OVERRIDES...]

Flags:
  --preprocess            Run preprocessing stage
  --tokenizer             Build/save CodeBERT tokenizer with LilyPond tokens
  --tokenize              Tokenize into shards (non-MLM)
  --shard                 Build pretokenized shards (MLM)
  --profile <name>        Hydra preprocess profile (default: slurm)
  --help                  Show this help

Any additional arguments are passed as Hydra overrides.

Examples:
    sbatch scripts/slurm_pipeline.sh --preprocess --tokenizer --shard
    sbatch scripts/slurm_pipeline.sh --tokenizer --shard
    sbatch scripts/slurm_pipeline.sh --preprocess --profile default
    sbatch scripts/slurm_pipeline.sh --shard preprocess.sharding.shard_size=16384
EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --preprocess)
            RUN_PREPROCESS=true
            shift
            ;;
        --tokenizer|--bpe)
            RUN_TOKENIZER=true
            shift
            ;;
        --tokenize)
            RUN_TOKENIZE=true
            shift
            ;;
        --shard)
            RUN_SHARD=true
            shift
            ;;
        --profile)
            PROFILE="$2"
            shift 2
            ;;
        --help|-h)
            print_help
            exit 0
            ;;
        *)
            EXTRA_OVERRIDES+=("$1")
            shift
            ;;
    esac
done

if [[ "$RUN_PREPROCESS" = false && "$RUN_TOKENIZER" = false && "$RUN_TOKENIZE" = false && "$RUN_SHARD" = false ]]; then
    echo "No stage selected. Use one or more of: --preprocess --tokenizer --tokenize --shard" >&2
    exit 1
fi

# ── Activate environment ─────────────────────────────────────────────────

VENV_ACTIVATE="./.venv/bin/activate"

if [[ -f "$VENV_ACTIVATE" ]]; then
    # shellcheck disable=SC1090
    source "$VENV_ACTIVATE"
fi

# ── Build Hydra overrides from flags ─────────────────────────────────────

OVERRIDES=(
    "--config-name" "preprocess"
    "preprocess=${PROFILE}"
    "preprocess.enabled=${RUN_PREPROCESS}"
    "preprocess.tokenizer.enabled=${RUN_TOKENIZER}"
    "preprocess.tokenize.enabled=${RUN_TOKENIZE}"
    "preprocess.sharding.enabled=${RUN_SHARD}"
)

# Append any extra overrides from the command line
OVERRIDES+=("${EXTRA_OVERRIDES[@]}")

# ── Print config ─────────────────────────────────────────────────────────

echo ""
echo "============================================"
echo " lilyBERT preprocessing pipeline"
echo "============================================"
echo "  SLURM_JOB_ID: ${SLURM_JOB_ID:-local}"
echo "  PROFILE:        ${PROFILE}"
echo "  PREPROCESS:     ${RUN_PREPROCESS}"
echo "  TOKENIZER:      ${RUN_TOKENIZER}"
echo "  TOKENIZE:       ${RUN_TOKENIZE}"
echo "  SHARD:          ${RUN_SHARD}"
echo "  OVERRIDES:      ${EXTRA_OVERRIDES[*]:-(none)}"
echo "============================================"
echo ""

mkdir -p logs

# ── Execute ──────────────────────────────────────────────────────────────

echo "Started: $(date)"
echo ""

uv run ly-preprocess "${OVERRIDES[@]}"

echo ""
echo "============================================"
echo " Pipeline done at $(date)"
echo "============================================"
