# Tokenization and BPE design choices

## Goals

The tokenizer stack is designed to preserve musically meaningful structure from LilyPond while remaining compatible with BERT-style masked language modeling.

Key goals:
- map notation into stable musical tokens instead of brittle character-level strings,
- preserve relationships among pitch, duration, articulation, and structure markers,
- allow BPE to compress frequent token patterns without losing musical boundaries.

## Pipeline

1. Parse and normalize LilyPond movements.
2. Convert lexical units to a musically informed linear token sequence.
3. Train BPE on top of this token stream.

The important design point is that BPE operates on musical tokens, not raw characters.

## Why musical tokens first

Character-level BPE tends to learn accidental syntax artifacts and spacing patterns. The musical-token representation avoids this by exposing semantically meaningful units such as:
- note identity,
- octave shifts,
- durations,
- articulations,
- structural markers.

This yields embeddings that are more interpretable and more suitable for downstream probing.

## BPE configuration philosophy

- Keep base musical vocabulary atomic.
- Learn merges only across already meaningful token units.
- Prefer moderate vocabulary sizes to balance compression and generalization.

In practice, the corpus-level BPE stage is optional and configured from `preprocess.bpe.*`.

## Practical recommendations

- Start from no augmentation for baseline tokenizer analysis.
- Add augmentation and retrain tokenizer when targeting robustness experiments.
- Keep tokenizer artifacts versioned with the training run metadata.
- Rely on python-ly library to lex, parse and tokenize as much as possible
