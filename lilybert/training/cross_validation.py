"""Cross-validation utilities for grouped stratified splitting."""

from __future__ import annotations

from typing import Dict, List, Sequence

from sklearn.model_selection import GroupKFold, StratifiedGroupKFold


def build_grouped_stratified_folds(
    sample_ids: Sequence[str],
    labels: Sequence[str],
    groups: Sequence[str],
    n_splits: int = 5,
    seed: int = 42,
) -> List[Dict[str, List[str]]]:
    """Build grouped stratified folds without base_work leakage."""
    if not (len(sample_ids) == len(labels) == len(groups)):
        raise ValueError("sample_ids, labels, and groups must have the same length")

    if len(sample_ids) < n_splits:
        raise ValueError("Number of samples must be >= n_splits")

    unique_groups = len(set(groups))
    if unique_groups < n_splits:
        raise ValueError("Number of unique groups must be >= n_splits")

    indices = list(range(len(sample_ids)))

    folds: List[Dict[str, List[str]]] = []
    try:
        splitter = StratifiedGroupKFold(
            n_splits=n_splits,
            shuffle=True,
            random_state=seed,
        )
        for train_idx, val_idx in splitter.split(indices, labels, groups):
            folds.append(
                {
                    "train_ids": [sample_ids[i] for i in train_idx],
                    "val_ids": [sample_ids[i] for i in val_idx],
                }
            )
    except ValueError:
        splitter = GroupKFold(n_splits=n_splits)
        for train_idx, val_idx in splitter.split(indices, labels, groups):
            folds.append(
                {
                    "train_ids": [sample_ids[i] for i in train_idx],
                    "val_ids": [sample_ids[i] for i in val_idx],
                }
            )

    return folds
