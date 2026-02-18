"""Classification metrics for lilyBERT evaluation workflows."""

from __future__ import annotations

from typing import Dict

import numpy as np
from sklearn.metrics import (
    accuracy_score,
    f1_score,
    hamming_loss,
    precision_score,
    recall_score,
)


class ClassificationMetrics:
    """Compute single-label and multi-label classification metrics."""

    def compute_single_label(self, y_true, y_pred) -> Dict[str, float]:
        y_true = np.asarray(y_true)
        y_pred = np.asarray(y_pred)
        return {
            "accuracy": float(accuracy_score(y_true, y_pred)),
            "f1_macro": float(
                f1_score(y_true, y_pred, average="macro", zero_division=0)
            ),
            "f1_weighted": float(
                f1_score(y_true, y_pred, average="weighted", zero_division=0)
            ),
            "precision_macro": float(
                precision_score(y_true, y_pred, average="macro", zero_division=0)
            ),
            "recall_macro": float(
                recall_score(y_true, y_pred, average="macro", zero_division=0)
            ),
        }

    def compute_multi_label(self, y_true, y_pred) -> Dict[str, float]:
        y_true = np.asarray(y_true)
        y_pred = np.asarray(y_pred)
        return {
            "f1_micro": float(
                f1_score(y_true, y_pred, average="micro", zero_division=0)
            ),
            "f1_macro": float(
                f1_score(y_true, y_pred, average="macro", zero_division=0)
            ),
            "precision_micro": float(
                precision_score(y_true, y_pred, average="micro", zero_division=0)
            ),
            "recall_micro": float(
                recall_score(y_true, y_pred, average="micro", zero_division=0)
            ),
            "hamming_loss": float(hamming_loss(y_true, y_pred)),
            "subset_accuracy": float(accuracy_score(y_true, y_pred)),
        }
