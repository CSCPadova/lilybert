#!/bin/bash
# ---------------------------------------------------------------------------
# lilyBERT preprocessing pipeline — SLURM batch script.
#
# Each preprocessing step is toggled via CLI flags. The script builds a
# single Hydra command with the appropriate enabled/disabled overrides.
#
# Configuration is loaded from Hydra preprocess profile files:
#   conf/preprocess/default.yaml
#   conf/preprocess/slurm.yaml
#
# Example:
#   sbatch scripts/slurm_pipeline.sh --preprocess --bpe --tokenize --shard
#   sbatch scripts/slurm_pipeline.sh --preprocess --profile slurm
#   sbatch scripts/slurm_pipeline.sh --shard preprocess.sharding.shard_size=16384
#
# Stage flags:
#   --preprocess         run movement preprocessing
#   --bpe                train tokenizer (BPE)
#   --tokenize           pretokenize (non-sharded)
#   --shard              build pretokenized shards (MLM)
#   --tokenizer-type     tokenizer backend: "musical" (default) or "bbpe"
# ---------------------------------------------------------------------------

#SBATCH --job-name=ly-pipeline
#SBATCH --partition=allgroups
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --time=48:00:00
#SBATCH --output=logs/pipeline_%j.out
#SBATCH --error=logs/pipeline_%j.err

set -euo pipefail

RUN_PREPROCESS=false
RUN_BPE=false
RUN_TOKENIZE=false
RUN_SHARD=false
PROFILE="slurm"
TOKENIZER_TYPE="musical"
EXTRA_OVERRIDES=()

print_help() {
    cat <<'EOF'
Usage: scripts/slurm_pipeline.sh [FLAGS] [HYDRA_OVERRIDES...]

Flags:
  --preprocess            Run preprocessing stage
  --bpe                   Run tokenizer training stage
  --tokenize              Run tokenization stage (non-sharded)
  --shard                 Run sharding stage (MLM)
  --profile <name>        Hydra preprocess profile (default: slurm)
  --tokenizer-type <t>    Tokenizer backend: "musical" (default) or "bbpe"
  --help                  Show this help

Any additional arguments are passed as Hydra overrides.

Examples:
    sbatch scripts/slurm_pipeline.sh --preprocess --bpe --tokenize --shard
    sbatch scripts/slurm_pipeline.sh --bpe --shard --tokenizer-type bbpe
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
        --bpe)
            RUN_BPE=true
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
        --tokenizer-type)
            TOKENIZER_TYPE="$2"
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

if [[ "$RUN_PREPROCESS" = false && "$RUN_BPE" = false && "$RUN_TOKENIZE" = false && "$RUN_SHARD" = false ]]; then
    echo "No stage selected. Use one or more of: --preprocess --bpe --tokenize --shard" >&2
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
    "dataset.tokenizer_type=${TOKENIZER_TYPE}"
    "preprocess.enabled=${RUN_PREPROCESS}"
    "preprocess.bpe.enabled=${RUN_BPE}"
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
echo "  BPE:            ${RUN_BPE}"
echo "  TOKENIZE:       ${RUN_TOKENIZE}"
echo "  SHARD:          ${RUN_SHARD}"
echo "  TOKENIZER_TYPE: ${TOKENIZER_TYPE}"
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
