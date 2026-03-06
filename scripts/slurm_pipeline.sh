#!/bin/bash
# ---------------------------------------------------------------------------
# Unified preprocessing pipeline for lilyBERT.
#
# Runs four stages as a SLURM job array (--array=1-4), where each array task
# picks up exactly one stage.  Stages depend on each other sequentially so
# they are submitted with --dependency=afterok chaining (see submit helper
# at the bottom).
#
# Stages:
#   1  Preprocess   – clean/augment raw .ly files into movement-level artefacts
#   2  BPE          – train a BPE tokenizer on the preprocessed corpus
#   3  Shard        – pretokenize movements into .npz shards for training
#   4  Verify       – quick sanity-check (counts, encode/decode roundtrip)
#
# Usage (local, all stages):
#   bash scripts/slurm_pipeline.sh --input data/pdmx --output outputs
#
# Usage (SLURM, submit chained jobs):
#   bash scripts/slurm_pipeline.sh --input data/pdmx --output outputs --submit
#
# Usage (single stage locally):
#   STAGE=2 bash scripts/slurm_pipeline.sh --input data/pdmx --output outputs
#
# All flags (defaults in parentheses):
#   --input       DIR   raw .ly files                        (data/raw)
#   --output      DIR   root output directory                (artifacts)
#   --labels      PATH  labels JSON                          (data/labels/labels_v1.json)
#   --vocab-size  N     BPE vocabulary size                  (8000)
#   --min-freq    N     BPE minimum token frequency          (0)
#   --shard-size  N     samples per .npz shard               (8192)
#   --max-length  N     max tokens per sample                (2048)
#   --stride      N     sliding-window stride                (256)
#   --shard-stage STR   sharding stage: mlm|classification   (mlm)
#   --task        STR   classification task (if shard-stage=classification) (composer)
#   --eval-ratio  F     fraction held-out for eval (MLM)     (0.01)
#   --seed        N     random seed                          (42)
#   --num-placeholders  enable number placeholders in BPE    (off)
#   --transposition     enable transposition augmentation    (off)
#   --abs-rel           enable absolute/relative augment.    (off)
#   --artic-var         enable articulation variants         (off)
#   --barline-var       enable barline variants              (off)
#   --retrograde        enable retrograde augmentation       (off)
#   --inversion         enable inversion augmentation        (off)
#   --submit            submit to SLURM instead of local run
# ---------------------------------------------------------------------------

set -euo pipefail

# ── Defaults ──────────────────────────────────────────────────────────────

INPUT_DIR="data/raw"
OUTPUT_DIR="artifacts"
LABELS_PATH="data/labels/labels_v1.json"

VOCAB_SIZE=10000
MIN_FREQUENCY=40
NUMBER_PLACEHOLDERS=false

SHARD_SIZE=8192
MAX_LENGTH=2048
STRIDE=256
SHARD_STAGE="mlm"
TASK="composer"
EVAL_RATIO=0.01
SEED=42

AUG_TRANSPOSITION=false
AUG_ABS_REL=true
AUG_ARTIC=false
AUG_BARLINE=false
AUG_RETROGRADE=false
AUG_INVERSION=false

SUBMIT=true

# ── Parse CLI arguments ──────────────────────────────────────────────────

while [[ $# -gt 0 ]]; do
    case "$1" in
        --input)        INPUT_DIR="$2";        shift 2 ;;
        --output)       OUTPUT_DIR="$2";       shift 2 ;;
        --labels)       LABELS_PATH="$2";      shift 2 ;;
        --vocab-size)   VOCAB_SIZE="$2";       shift 2 ;;
        --min-freq)     MIN_FREQUENCY="$2";    shift 2 ;;
        --shard-size)   SHARD_SIZE="$2";       shift 2 ;;
        --max-length)   MAX_LENGTH="$2";       shift 2 ;;
        --stride)       STRIDE="$2";           shift 2 ;;
        --shard-stage)  SHARD_STAGE="$2";      shift 2 ;;
        --task)         TASK="$2";             shift 2 ;;
        --eval-ratio)   EVAL_RATIO="$2";       shift 2 ;;
        --seed)         SEED="$2";             shift 2 ;;
        --num-placeholders) NUMBER_PLACEHOLDERS=true; shift ;;
        --transposition)    AUG_TRANSPOSITION=true;   shift ;;
        --abs-rel)          AUG_ABS_REL=true;         shift ;;
        --artic-var)        AUG_ARTIC=true;           shift ;;
        --barline-var)      AUG_BARLINE=true;         shift ;;
        --retrograde)       AUG_RETROGRADE=true;      shift ;;
        --inversion)        AUG_INVERSION=true;       shift ;;
        --submit)           SUBMIT=true;              shift ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
done

# ── Derived paths ────────────────────────────────────────────────────────

PROCESSED_DIR="${OUTPUT_DIR}/processed"
TOKENIZER_DIR="${OUTPUT_DIR}/tokenizer"
SHARDS_DIR="${OUTPUT_DIR}/pretokenized"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VENV_ACTIVATE="${PROJECT_ROOT}/.venv/bin/activate"
PYTHON="${PROJECT_ROOT}/.venv/bin/python"

# ── SLURM submission mode ────────────────────────────────────────────────

if [[ "$SUBMIT" == "true" ]]; then
    mkdir -p "${PROJECT_ROOT}/logs"

    # Export all config as environment variables for the array jobs
    EXPORT_VARS="ALL"
    EXPORT_VARS+=",PIPELINE_INPUT_DIR=${INPUT_DIR}"
    EXPORT_VARS+=",PIPELINE_OUTPUT_DIR=${OUTPUT_DIR}"
    EXPORT_VARS+=",PIPELINE_LABELS_PATH=${LABELS_PATH}"
    EXPORT_VARS+=",PIPELINE_VOCAB_SIZE=${VOCAB_SIZE}"
    EXPORT_VARS+=",PIPELINE_MIN_FREQUENCY=${MIN_FREQUENCY}"
    EXPORT_VARS+=",PIPELINE_NUMBER_PLACEHOLDERS=${NUMBER_PLACEHOLDERS}"
    EXPORT_VARS+=",PIPELINE_SHARD_SIZE=${SHARD_SIZE}"
    EXPORT_VARS+=",PIPELINE_MAX_LENGTH=${MAX_LENGTH}"
    EXPORT_VARS+=",PIPELINE_STRIDE=${STRIDE}"
    EXPORT_VARS+=",PIPELINE_SHARD_STAGE=${SHARD_STAGE}"
    EXPORT_VARS+=",PIPELINE_TASK=${TASK}"
    EXPORT_VARS+=",PIPELINE_EVAL_RATIO=${EVAL_RATIO}"
    EXPORT_VARS+=",PIPELINE_SEED=${SEED}"
    EXPORT_VARS+=",PIPELINE_AUG_TRANSPOSITION=${AUG_TRANSPOSITION}"
    EXPORT_VARS+=",PIPELINE_AUG_ABS_REL=${AUG_ABS_REL}"
    EXPORT_VARS+=",PIPELINE_AUG_ARTIC=${AUG_ARTIC}"
    EXPORT_VARS+=",PIPELINE_AUG_BARLINE=${AUG_BARLINE}"
    EXPORT_VARS+=",PIPELINE_AUG_RETROGRADE=${AUG_RETROGRADE}"
    EXPORT_VARS+=",PIPELINE_AUG_INVERSION=${AUG_INVERSION}"

    # Stage 1: Preprocess
    JOB1=$(sbatch --parsable \
        --partition=allgroups \
        --job-name=ly-preprocess \
        --output=${PROJECT_ROOT}/logs/preprocess_%j.out \
        --error=${PROJECT_ROOT}/logs/preprocess_%j.err \
        --nodes=1 --ntasks=1 --cpus-per-task=32 --mem=64G --time=24:00:00 \
        --export="${EXPORT_VARS},STAGE=1" \
        "${BASH_SOURCE[0]}")
    echo "Submitted stage 1 (preprocess): job ${JOB1}"

    # Stage 2: BPE (depends on stage 1)
    JOB2=$(sbatch --parsable \
        --partition=allgroups \
        --dependency=afterok:${JOB1} \
        --job-name=ly-bpe \
        --output=${PROJECT_ROOT}/logs/bpe_%j.out \
        --error=${PROJECT_ROOT}/logs/bpe_%j.err \
        --nodes=1 --ntasks=1 --cpus-per-task=32 --mem=64G --time=12:00:00 \
        --export="${EXPORT_VARS},STAGE=2" \
        "${BASH_SOURCE[0]}")
    echo "Submitted stage 2 (BPE):        job ${JOB2} (after ${JOB1})"

    # Stage 3: Shard (depends on stage 2)
    JOB3=$(sbatch --parsable \
        --partition=allgroups \
        --dependency=afterok:${JOB2} \
        --job-name=ly-shard \
        --output=${PROJECT_ROOT}/logs/shard_%j.out \
        --error=${PROJECT_ROOT}/logs/shard_%j.err \
        --nodes=1 --ntasks=1 --cpus-per-task=32 --mem=64G --time=24:00:00 \
        --export="${EXPORT_VARS},STAGE=3" \
        "${BASH_SOURCE[0]}")
    echo "Submitted stage 3 (shard):      job ${JOB3} (after ${JOB2})"

    # Stage 4: Verify (depends on stage 3)
    JOB4=$(sbatch --parsable \
        --partition=allgroups \
        --dependency=afterok:${JOB3} \
        --job-name=ly-verify \
        --output=${PROJECT_ROOT}/logs/verify_%j.out \
        --error=${PROJECT_ROOT}/logs/verify_%j.err \
        --nodes=1 --ntasks=1 --cpus-per-task=32 --mem=64G --time=12:00:00 \
        --export="${EXPORT_VARS},STAGE=4" \
        "${BASH_SOURCE[0]}")
    echo "Submitted stage 4 (verify):     job ${JOB4} (after ${JOB3})"

    echo ""
    echo "Pipeline submitted: ${JOB1} → ${JOB2} → ${JOB3} → ${JOB4}"
    exit 0
fi

# ── Pick up SLURM-exported config (if running as array task) ─────────────

INPUT_DIR="${PIPELINE_INPUT_DIR:-$INPUT_DIR}"
OUTPUT_DIR="${PIPELINE_OUTPUT_DIR:-$OUTPUT_DIR}"
LABELS_PATH="${PIPELINE_LABELS_PATH:-$LABELS_PATH}"
VOCAB_SIZE="${PIPELINE_VOCAB_SIZE:-$VOCAB_SIZE}"
MIN_FREQUENCY="${PIPELINE_MIN_FREQUENCY:-$MIN_FREQUENCY}"
NUMBER_PLACEHOLDERS="${PIPELINE_NUMBER_PLACEHOLDERS:-$NUMBER_PLACEHOLDERS}"
SHARD_SIZE="${PIPELINE_SHARD_SIZE:-$SHARD_SIZE}"
MAX_LENGTH="${PIPELINE_MAX_LENGTH:-$MAX_LENGTH}"
STRIDE="${PIPELINE_STRIDE:-$STRIDE}"
SHARD_STAGE="${PIPELINE_SHARD_STAGE:-$SHARD_STAGE}"
TASK="${PIPELINE_TASK:-$TASK}"
EVAL_RATIO="${PIPELINE_EVAL_RATIO:-$EVAL_RATIO}"
SEED="${PIPELINE_SEED:-$SEED}"
AUG_TRANSPOSITION="${PIPELINE_AUG_TRANSPOSITION:-$AUG_TRANSPOSITION}"
AUG_ABS_REL="${PIPELINE_AUG_ABS_REL:-$AUG_ABS_REL}"
AUG_ARTIC="${PIPELINE_AUG_ARTIC:-$AUG_ARTIC}"
AUG_BARLINE="${PIPELINE_AUG_BARLINE:-$AUG_BARLINE}"
AUG_RETROGRADE="${PIPELINE_AUG_RETROGRADE:-$AUG_RETROGRADE}"
AUG_INVERSION="${PIPELINE_AUG_INVERSION:-$AUG_INVERSION}"

# Re-derive paths after potential overrides
PROCESSED_DIR="${OUTPUT_DIR}/processed"
TOKENIZER_DIR="${OUTPUT_DIR}/tokenizer"
SHARDS_DIR="${OUTPUT_DIR}/pretokenized"

# ── Activate environment ─────────────────────────────────────────────────

cd "$PROJECT_ROOT"
if [[ -f "$VENV_ACTIVATE" ]]; then
    source "$VENV_ACTIVATE"
fi

# ── Stage dispatcher ─────────────────────────────────────────────────────

# STAGE can be set via env (SLURM export) or defaults to "all"
STAGE="${STAGE:-all}"

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
        print(f'Roundtrip test:      {len(ids)} IDs → {len(decoded)} chars')
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

echo ""
echo "Pipeline config:"
echo "  INPUT_DIR:     ${INPUT_DIR}"
echo "  OUTPUT_DIR:    ${OUTPUT_DIR}"
echo "  PROCESSED_DIR: ${PROCESSED_DIR}"
echo "  TOKENIZER_DIR: ${TOKENIZER_DIR}"
echo "  SHARDS_DIR:    ${SHARDS_DIR}"
echo "  STAGE:         ${STAGE}"
echo ""

mkdir -p "${PROCESSED_DIR}" "${TOKENIZER_DIR}" "${SHARDS_DIR}"

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
