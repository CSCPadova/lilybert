# Tokenization and BPE design choices

## Goals

The tokenizer stack is designed to preserve musically meaningful structure from LilyPond while remaining compatible with BERT-style masked language modeling.

Key goals:
- leverage CodeBERT's existing understanding of code structure (indentation, block nesting, identifier patterns) as a starting point for LilyPond,
- map notation into stable musical tokens instead of brittle character-level strings,
- preserve relationships among pitch, duration, articulation, and structure markers,
- allow BPE to compress frequent token patterns without losing musical boundaries.

## Pipeline

0. Start from CodeBERT's pretrained RoBERTa BPE tokenizer and extend it with LilyPond backslash commands.
1. Parse and normalize LilyPond movements.
2. Convert lexical units to a musically informed linear token sequence.
3. Train BPE on top of this token stream.

The important design point is that BPE operates on musical tokens, not raw characters.

## CodeBERT vocabulary extension

Before any corpus-level BPE training, the project extends CodeBERT's existing RoBERTa vocabulary with LilyPond-specific backslash commands (defined in `lilybert/data/tokenizer_builder.py`). This ensures that notation keywords like `\relative`, `\time`, `\key`, `\fermata`, and other commands are represented as single tokens rather than subword fragments. CodeBERT already knows how to tokenize general programming constructs (braces, operators, identifiers); the extension adds domain-specific keywords that CodeBERT has never seen during its original pretraining on GitHub code.

## Why musical tokens first

Character-level BPE tends to learn accidental syntax artifacts and spacing patterns. The musical-token representation avoids this by exposing semantically meaningful units such as:
- note identity,
- octave shifts,
- durations,
- articulations,
- structural markers.

Because CodeBERT was trained on source code, it already handles structured text well; the musical token layer ensures LilyPond-specific semantics (pitch, duration, articulation) are preserved rather than fragmented by generic code BPE.

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
