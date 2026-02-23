#!/usr/bin/env bash
# Download the MutopiaProject repository and create data/mutopia/
# with all the merged (include-resolved) LilyPond files.
#
# Usage:
#   bash scripts/setup_mutopia.sh                        # clone + combine
#   bash scripts/setup_mutopia.sh --preprocess           # also preprocess for pretraining
#   bash scripts/setup_mutopia.sh --preprocess --shard   # preprocess + pretokenize into shards
set -euo pipefail

REPO_URL="https://github.com/MutopiaProject/MutopiaProject.git"
REPO_DIR="MutopiaProject"
OUTPUT_DIR="data/mutopia"
PREPROCESSED_DIR="data/mutopia_preprocessed"
TOKENIZER_DIR="artifacts/tokenizer"
SHARD_DIR="artifacts/pretokenized"
SHARD_SIZE=8192
VOCAB_SIZE=10000
NUM_WORKERS=18

# ---------------------------------------------------------------------------
# Step 1: shallow-clone the repo (skip if it already exists)
# ---------------------------------------------------------------------------
if [ ! -d "$REPO_DIR" ]; then
    echo "Cloning MutopiaProject (shallow)..."
    git clone --depth 1 "$REPO_URL" "$REPO_DIR"
else
    echo "MutopiaProject directory already exists, skipping clone."
fi

# ---------------------------------------------------------------------------
# Step 2: combine files (resolve \include directives → single .ly files)
# ---------------------------------------------------------------------------
echo ""
echo "Combining Mutopia files into $OUTPUT_DIR ..."
uv run lilybert combine \
    --input-dir "$REPO_DIR/ftp" \
    --output-dir "$OUTPUT_DIR" \
    --verbose \
    --mutopia

echo ""
echo "Combined files saved to $OUTPUT_DIR"

# ---------------------------------------------------------------------------
# Parse flags
# ---------------------------------------------------------------------------
DO_PREPROCESS=false
DO_SHARD=false
for arg in "$@"; do
    case "$arg" in
        --preprocess) DO_PREPROCESS=true ;;
        --shard)      DO_SHARD=true ;;
    esac
done

# ---------------------------------------------------------------------------
# Step 3 (optional): preprocess for pretraining
# ---------------------------------------------------------------------------
if $DO_PREPROCESS; then
    echo ""
    echo "Preprocessing combined files for pretraining..."
    uv run lilybert mutopia-preprocess \
        --input-dir "$OUTPUT_DIR" \
        --output-dir "$PREPROCESSED_DIR" \
        --train-tokenizer \
        --vocab-size $VOCAB_SIZE \
        --num-workers $NUM_WORKERS \
        --verbose
fi

# ---------------------------------------------------------------------------
# Step 4 (optional): pretokenize into shards for distributed training
# ---------------------------------------------------------------------------
if $DO_SHARD; then
    if [ ! -d "$PREPROCESSED_DIR" ]; then
        echo "Error: preprocessed data not found at $PREPROCESSED_DIR"
        echo "Run with --preprocess first, or ensure data exists."
        exit 1
    fi

    echo ""
    echo "Pretokenizing MLM data into shards (shard_size=$SHARD_SIZE)..."
    uv run lilybert pretokenize \
        --stage mlm \
        --data-dir "$PREPROCESSED_DIR" \
        --tokenizer-path "$TOKENIZER_DIR" \
        --output-dir "$SHARD_DIR" \
        --languages italiano,english \
        --shard-size "$SHARD_SIZE"

    echo ""
    echo "Shards saved to $SHARD_DIR/mlm/{train,eval}/"
fi

echo ""
echo "Done."
