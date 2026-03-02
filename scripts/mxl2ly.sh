#!/usr/bin/env bash

set -euo pipefail

# ==========================================================
# Parallel MusicXML → LilyPond converter
# Supports: .xml .musicxml .mxl
# SLURM-aware
# ==========================================================

usage() {
    echo "Usage: $0 input_dir [output_dir] [num_jobs]"
    exit 1
}

if [ "$#" -lt 1 ]; then
    usage
fi

INPUT_DIR="$1"
OUTPUT_DIR="${2:-$INPUT_DIR/lilypond_output}"
USER_JOBS="${3:-}"

if [ ! -d "$INPUT_DIR" ]; then
    echo "Input directory does not exist"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"
LOG_DIR="$OUTPUT_DIR/logs"
mkdir -p "$LOG_DIR"

# ----------------------------------------------------------
# Detect number of jobs
# ----------------------------------------------------------

if [ -n "${SLURM_CPUS_PER_TASK:-}" ]; then
    JOBS="$SLURM_CPUS_PER_TASK"
elif [ -n "$USER_JOBS" ]; then
    JOBS="$USER_JOBS"
else
    JOBS="$(nproc)"
fi

echo "Using $JOBS parallel jobs"

# ----------------------------------------------------------
# Conversion function
# ----------------------------------------------------------

convert_one() {

    FILE="$1"
    BASENAME="$(basename "$FILE")"
    NAME="${BASENAME%.*}"
    OUT_FILE="$OUTPUT_DIR/$NAME.ly"

    TMP_DIR="$(mktemp -d)"
    STATUS=0

    {
        echo "----------------------------------------"
        echo "Processing: $FILE"
        echo "Start: $(date)"
    } >> "$LOG_DIR/main.log"

    case "${FILE##*.}" in
        mxl|MXL)

            unzip -qq "$FILE" -d "$TMP_DIR"

            CONTAINER="$TMP_DIR/META-INF/container.xml"

            if [ -f "$CONTAINER" ]; then
                ROOTFILE=$(xmllint --xpath \
                  "string(//rootfile/@full-path)" \
                  "$CONTAINER" 2>/dev/null || true)

                XML_PATH="$TMP_DIR/$ROOTFILE"
            else
                XML_PATH="$(find "$TMP_DIR" -type f -iname "*.xml" | head -n 1)"
            fi
            ;;
        *)
            XML_PATH="$FILE"
            ;;
    esac

    if [ ! -f "${XML_PATH:-}" ]; then
        echo "ERROR: No XML found inside $FILE" \
            >> "$LOG_DIR/errors.log"
        STATUS=1
    else
        if ! musicxml2ly --output="$OUT_FILE" "$XML_PATH" \
            >> "$LOG_DIR/main.log" 2>> "$LOG_DIR/errors.log"
        then
            echo "ERROR converting $FILE" \
                >> "$LOG_DIR/errors.log"
            STATUS=1
        fi
    fi

    rm -rf "$TMP_DIR"

    {
        echo "End: $(date)"
        echo "Status: $STATUS"
    } >> "$LOG_DIR/main.log"

    return "$STATUS"
}

export -f convert_one
export OUTPUT_DIR LOG_DIR

# ----------------------------------------------------------
# File discovery
# ----------------------------------------------------------

FILE_LIST="$LOG_DIR/file_list.txt"

find "$INPUT_DIR" -type f \( \
    -iname "*.xml" -o \
    -iname "*.musicxml" -o \
    -iname "*.mxl" \
\) > "$FILE_LIST"

TOTAL=$(wc -l < "$FILE_LIST")
echo "Found $TOTAL files"

# ----------------------------------------------------------
# Parallel execution
# ----------------------------------------------------------

parallel -j "$JOBS" convert_one :::: "$FILE_LIST"

echo "----------------------------------------"
echo "Done."
echo "Logs:"
echo "  $LOG_DIR/main.log"
echo "  $LOG_DIR/errors.log"
