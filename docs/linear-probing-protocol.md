# Linear probing protocol

## Purpose

Linear probing is used to evaluate the representational quality of pretrained encoder embeddings for publication experiments.

## Protocol definition

In `train.mode=classify`:
1. load pretrained encoder weights (`model.pretrained_model`) from Hugging Face ID or local `save_pretrained` directory,
2. freeze all encoder parameters,
3. extract movement-level embeddings from windowed tokenized inputs,
4. average window embeddings per movement,
5. train a linear probe with grouped stratified 5-fold CV.

## Probe model

- Single-label tasks: `LogisticRegression`.
- Multi-label task (`instrument`): `OneVsRestClassifier(LogisticRegression)`.

## Fold splitting

Folds are grouped by `base_work` to prevent leakage across movements of the same work.
The split utility uses grouped stratified logic with fallback to grouped K-fold when stratification is ill-posed.

## Output expectations

Each fold produces metrics and a fold artifact directory under output checkpoints.
A final CV summary JSON contains fold metrics with mean/std aggregates.

## What this is not

This protocol does **not** fine-tune encoder weights. Any comparison should interpret results as embedding quality under a linear-readout regime.
