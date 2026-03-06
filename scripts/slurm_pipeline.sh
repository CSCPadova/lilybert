#!/bin/bash
# ---------------------------------------------------------------------------
# lilyBERT preprocessing pipeline — SLURM batch script.
#
# Submit with sbatch.  Override defaults via environment variables:
#
#   sbatch scripts/slurm_pipeline.sh
#   sbatch --export=ALL,INPUT_DIR=/data/corpus,OUTPUT_DIR=/scratch/out scripts/slurm_pipeline.sh
#
# Or edit the "Defaults" section below before submission.
#
# Stages (all run sequentially in a single job):
#   1  Preprocess   – clean/augment raw .ly files into movement-level artefacts
#   2  BPE          – train a BPE tokenizer on the preprocessed corpus
#   3  Shard        – pretokenize movements into .npz shards for training
#   4  Verify       – quick sanity-check (counts, encode/decode roundtrip)
#
# To run only specific stages, set STAGE=2 (or STAGE=1, STAGE=3, etc.)
# in the environment.  Default is STAGE=all.
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

# ── Defaults (override via env before sbatch) ─────────────────────────────

INPUT_DIR="/nfsd/voce/machine_learning/datasets/pdmx/PDMX/ly"
OUTPUT_DIR="/nfsd/voce/machine_learning/experiments/artifacts"
LABELS_PATH="${LABELS_PATH:-data/labels/labels_v1.json}"

VOCAB_SIZE="10000"
MIN_FREQUENCY="40"
NUMBER_PLACEHOLDERS="false"

SHARD_SIZE="8192"
MAX_LENGTH="2048"
STRIDE="256"
SHARD_STAGE="mlm"
TASK="${TASK:-composer}"
EVAL_RATIO="0.01"
SEED="42"

AUG_TRANSPOSITION="${AUG_TRANSPOSITION:-false}"
AUG_ABS_REL="${AUG_ABS_REL:-true}"
AUG_ARTIC="${AUG_ARTIC:-false}"
AUG_BARLINE="${AUG_BARLINE:-false}"
AUG_RETROGRADE="${AUG_RETROGRADE:-false}"
AUG_INVERSION="${AUG_INVERSION:-false}"

STAGE="${STAGE:-all}"

# ── Derived paths ────────────────────────────────────────────────────────

PROCESSED_DIR="${OUTPUT_DIR}/processed"
TOKENIZER_DIR="${OUTPUT_DIR}/tokenizer"
SHARDS_DIR="${OUTPUT_DIR}/pretokenized"

# ── Activate environment ─────────────────────────────────────────────────

VENV_ACTIVATE="./.venv/bin/activate"
PYTHON="./.venv/bin/python"

if [[ -f "$VENV_ACTIVATE" ]]; then
    # shellcheck disable=SC1090
    source "$VENV_ACTIVATE"
fi

# ── Print config ─────────────────────────────────────────────────────────

echo ""
echo "============================================"
echo " lilyBERT preprocessing pipeline"
echo "============================================"
echo "  SLURM_JOB_ID:  ${SLURM_JOB_ID:-local}"
echo "  INPUT_DIR:     ${INPUT_DIR}"
echo "  OUTPUT_DIR:    ${OUTPUT_DIR}"
echo "  PROCESSED_DIR: ${PROCESSED_DIR}"
echo "  TOKENIZER_DIR: ${TOKENIZER_DIR}"
echo "  SHARDS_DIR:    ${SHARDS_DIR}"
echo "  STAGE:         ${STAGE}"
echo "  VOCAB_SIZE:    ${VOCAB_SIZE}"
echo "  MIN_FREQUENCY: ${MIN_FREQUENCY}"
echo "  SHARD_STAGE:   ${SHARD_STAGE}"
echo "  MAX_LENGTH:    ${MAX_LENGTH}"
echo "  STRIDE:        ${STRIDE}"
echo "============================================"
echo ""

mkdir -p "${PROCESSED_DIR}" "${TOKENIZER_DIR}" "${SHARDS_DIR}"

# ── Stage functions ──────────────────────────────────────────────────────

run_stage_1() {
    echo "============================================"
    echo " Stage 1: Preprocess"
    echo "============================================"
    echo "Input:  ${INPUT_DIR}"
    echo "Output: ${PROCESSED_DIR}"
    echo "Labels: ${LABELS_PATH}"
    echo "Started: $(date)"
    echo "============================================"

    "$PYTHON" -c "
import json, sys
from lilybert.data.preprocessor import LilyPondPreprocessor

def tobool(v):
    return v.lower() in ('true', '1', 'yes')

preprocessor = LilyPondPreprocessor(
    strip_sections=['header', 'overrides', 'scheme', 'midi', 'comments', 'version'],
)
summary = preprocessor.preprocess_to_dataset(
    input_dir=sys.argv[1],
    output_dir=sys.argv[2],
    labels_path=sys.argv[3],
    augmentation_config={
        'enable_transposition': tobool(sys.argv[4]),
        'enable_absolute_relative': tobool(sys.argv[5]),
        'enable_articulation_variants': tobool(sys.argv[6]),
        'enable_barline_variants': tobool(sys.argv[7]),
        'enable_retrograde': tobool(sys.argv[8]),
        'enable_inversion': tobool(sys.argv[9]),
        'include_original': True,
    },
)
print(json.dumps(summary, indent=2, default=str))
" \
    "${INPUT_DIR}" \
    "${PROCESSED_DIR}" \
    "${LABELS_PATH}" \
    "${AUG_TRANSPOSITION}" \
    "${AUG_ABS_REL}" \
    "${AUG_ARTIC}" \
    "${AUG_BARLINE}" \
    "${AUG_RETROGRADE}" \
    "${AUG_INVERSION}"

    echo ""
    echo "Stage 1 finished at $(date)"
}

run_stage_2() {
    echo "============================================"
    echo " Stage 2: BPE tokenizer training"
    echo "============================================"
    echo "Corpus:     ${PROCESSED_DIR}"
    echo "Output:     ${TOKENIZER_DIR}"
    echo "Vocab size: ${VOCAB_SIZE}"
    echo "Min freq:   ${MIN_FREQUENCY}"
    echo "Num placeholders: ${NUMBER_PLACEHOLDERS}"
    echo "Started: $(date)"
    echo "============================================"

    "$PYTHON" -c "
import json, sys
from lilybert.data.tokenizer import LilyPondTokenizer

def tobool(v):
    return v.lower() in ('true', '1', 'yes')

tokenizer = LilyPondTokenizer()
corpus = tokenizer.build_corpus(sys.argv[1])
print(f'Corpus: {len(corpus)} samples')

fast_tok = tokenizer.train(
    corpus=corpus,
    vocab_size=int(sys.argv[2]),
    min_frequency=int(sys.argv[3]),
    number_placeholders=tobool(sys.argv[4]),
)
saved = tokenizer.save(sys.argv[5])
print(json.dumps({
    'corpus_samples': len(corpus),
    'vocab_size': int(fast_tok.vocab_size),
    'output_dir': str(saved),
}, indent=2))
" \
    "${PROCESSED_DIR}" \
    "${VOCAB_SIZE}" \
    "${MIN_FREQUENCY}" \
    "${NUMBER_PLACEHOLDERS}" \
    "${TOKENIZER_DIR}"

    echo ""
    echo "Stage 2 finished at $(date)"
}

run_stage_3() {
    echo "============================================"
    echo " Stage 3: Pretokenize / Shard"
    echo "============================================"
    echo "Data:       ${PROCESSED_DIR}"
    echo "Tokenizer:  ${TOKENIZER_DIR}"
    echo "Output:     ${SHARDS_DIR}"
    echo "Stage:      ${SHARD_STAGE}"
    echo "Shard size: ${SHARD_SIZE}"
    echo "Max length: ${MAX_LENGTH}"
    echo "Stride:     ${STRIDE}"
    echo "Started: $(date)"
    echo "============================================"

    if [[ "${SHARD_STAGE}" == "mlm" ]]; then
        "$PYTHON" -c "
import sys
from lilybert.cli.pretokenize import _pretokenize_mlm
_pretokenize_mlm(
    data_dir=sys.argv[1],
    tokenizer_path=sys.argv[2],
    output_dir=sys.argv[3],
    max_length=int(sys.argv[4]),
    stride=int(sys.argv[5]),
    shard_size=int(sys.argv[6]),
    eval_ratio=float(sys.argv[7]),
    seed=int(sys.argv[8]),
)
" \
        "${PROCESSED_DIR}" \
        "${TOKENIZER_DIR}" \
        "${SHARDS_DIR}" \
        "${MAX_LENGTH}" \
        "${STRIDE}" \
        "${SHARD_SIZE}" \
        "${EVAL_RATIO}" \
        "${SEED}"
    else
        "$PYTHON" -c "
import sys
from lilybert.cli.pretokenize import _pretokenize_classification_sharded
_pretokenize_classification_sharded(
    task=sys.argv[1],
    data_dir=sys.argv[2],
    tokenizer_path=sys.argv[3],
    output_dir=sys.argv[4],
    max_length=int(sys.argv[5]),
    stride=int(sys.argv[6]),
    shard_size=int(sys.argv[7]),
    include_structure_markers=False,
)
" \
        "${TASK}" \
        "${PROCESSED_DIR}" \
        "${TOKENIZER_DIR}" \
        "${SHARDS_DIR}" \
        "${MAX_LENGTH}" \
        "${STRIDE}" \
        "${SHARD_SIZE}"
    fi

    echo ""
    echo "Stage 3 finished at $(date)"
}

run_stage_4() {
    echo "============================================"
    echo " Stage 4: Verify"
    echo "============================================"
    echo "Started: $(date)"
    echo "============================================"

    "$PYTHON" -c "
import json, sys
from pathlib import Path
from lilybert.data.tokenizer import LilyPondTokenizer

processed = Path(sys.argv[1])
tok_dir = Path(sys.argv[2])
shards_dir = Path(sys.argv[3])

# Check processed files
ly_files = sorted(processed.glob('*.ly'))
print(f'Processed .ly files: {len(ly_files)}')

meta_path = processed / 'metadata.json'
if meta_path.exists():
    meta = json.loads(meta_path.read_text())
    print(f'Metadata entries:    {len(meta)}')

# Check tokenizer
if (tok_dir / 'tokenizer.json').exists():
    tok = LilyPondTokenizer.load(str(tok_dir))
    ft = tok.fast_tokenizer
    print(f'Tokenizer vocab:     {ft.vocab_size}')

    # Roundtrip test on first file
    if ly_files:
        sample = ly_files[0].read_text(encoding='utf-8')
        ids = tok.encode_lilypond(sample)
        decoded = tok.decode_to_lilypond(ids)
        print(f'Roundtrip test:      {len(ids)} IDs -> {len(decoded)} chars')
else:
    print('Tokenizer not found (skipped)')

# Check shards
if shards_dir.exists():
    npz_files = sorted(shards_dir.rglob('*.npz'))
    print(f'Shard files:         {len(npz_files)}')
else:
    print('Shards dir not found (skipped)')

print()
print('Verification complete.')
" \
    "${PROCESSED_DIR}" \
    "${TOKENIZER_DIR}" \
    "${SHARDS_DIR}"

    echo ""
    echo "Stage 4 finished at $(date)"
}

# ── Execute ──────────────────────────────────────────────────────────────

case "$STAGE" in
    1)    run_stage_1 ;;
    2)    run_stage_2 ;;
    3)    run_stage_3 ;;
    4)    run_stage_4 ;;
    all)
        run_stage_1
        echo ""
        run_stage_2
        echo ""
        run_stage_3
        echo ""
        run_stage_4
        ;;
    *)
        echo "Unknown STAGE=$STAGE (expected 1-4 or all)" >&2
        exit 1
        ;;
esac

echo ""
echo "============================================"
echo " Pipeline done at $(date)"
echo "============================================"
