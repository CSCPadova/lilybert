# Training parameter choices

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

The encoder is frozen and embeddings are extracted per movement, then averaged across windows.
A scikit-learn linear probe is trained on those movement embeddings.

## Logging and reproducibility

Runtime logging is controlled under `runtime.wandb.*` and `runtime.tensorboard.*`.

For reproducibility:
- set `runtime.seed`,
- persist tokenizer + model identifiers,
- keep fold-level artifacts and summary JSON outputs.
