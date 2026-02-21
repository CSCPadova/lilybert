#!/usr/bin/env bash
# Download the MutopiaProject repository and create data/mutopia/
# with all the merged (include-resolved) LilyPond files.
#
# Usage:
#   bash scripts/setup_mutopia.sh              # clone + combine
#   bash scripts/setup_mutopia.sh --preprocess  # also preprocess for pretraining
set -euo pipefail

REPO_URL="https://github.com/MutopiaProject/MutopiaProject.git"
REPO_DIR="MutopiaProject"
OUTPUT_DIR="data/mutopia"

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
    --mutopia

echo ""
echo "Combined files saved to $OUTPUT_DIR"

# ---------------------------------------------------------------------------
# Step 3 (optional): preprocess for pretraining
# ---------------------------------------------------------------------------
if [[ "${1:-}" == "--preprocess" ]]; then
    echo ""
    echo "Preprocessing combined files for pretraining..."
    uv run lilybert mutopia-preprocess \
        --input-dir "$OUTPUT_DIR" \
        --output-dir "data/mutopia_preprocessed" \
        --train-tokenizer \
        --vocab-size 10000 \
        --verbose
fi

echo ""
echo "Done."
