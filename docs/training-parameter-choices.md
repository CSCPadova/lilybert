# Training parameter choices

Training starts from `microsoft/codebert-base`, a RoBERTa model pretrained on six programming languages. Because LilyPond is a text-based programming language with formal grammar, block structure, and backslash commands, CodeBERT provides a strong initialization. MLM pretraining then adapts CodeBERT to LilyPond-specific patterns — pitch sequences, rhythmic structures, and harmonic progressions expressed as code.

## Two-stage training strategy

The project uses:
1. `train.mode=pretrain` for MLM pretraining of the encoder.
2. `train.mode=classify` for frozen-embedding linear probing.

Classification mode is intentionally not fine-tuning; it is an embedding quality protocol.

## Pretraining (`train.pretrain.*`)

Main controls:
- `max_length`
- `mlm_probability`
- `per_device_train_batch_size`
- `num_train_epochs` or `max_steps`
- optimizer-related fields (`learning_rate`, `weight_decay`, `warmup_ratio`)

MLM on LilyPond serves the same role as MLM on a new programming language — the model learns to predict masked tokens in context, capturing syntactic and semantic regularities of LilyPond code.

Recommended practice:
- use small `max_steps` for smoke validation,
- then scale sequence length and batch size according to memory budget.

## Classification / probing (`train.classify.*`)

Main controls:
- `n_folds` (default 5)
- `max_length`, `stride` for movement windowing
- `probe_max_iter`
- `probe_c`
- `probe_class_weight` (`null` or `balanced`)

The frozen encoder is CodeBERT after LilyPond MLM adaptation. Embeddings are extracted per movement, then averaged across windows. A scikit-learn linear probe is trained on those movement embeddings. The probing tasks test whether the adapted representations encode musically meaningful properties (composer identity, stylistic period, instrumentation, key) from LilyPond source code alone.

## Logging and reproducibility

Runtime logging is controlled under `runtime.wandb.*` and `runtime.tensorboard.*`.

For reproducibility:
- set `runtime.seed`,
- persist tokenizer + model identifiers,
- keep fold-level artifacts and summary JSON outputs.
