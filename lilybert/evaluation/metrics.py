"""Classification metrics for lilyBERT evaluation workflows."""

from __future__ import annotations

from typing import Dict, Optional, Sequence, Tuple

import numpy as np
from sklearn.metrics import (
    accuracy_score,
    f1_score,
    hamming_loss,
    precision_score,
    recall_score,
    top_k_accuracy_score,
)

DEFAULT_TOP_K: Tuple[int, ...] = (1, 5)


class ClassificationMetrics:
    """Compute single-label and multi-label classification metrics."""

    def __init__(self, top_k: Sequence[int] = DEFAULT_TOP_K):
        self.top_k = tuple(sorted(set(top_k)))

    def compute_single_label(
        self,
        y_true,
        y_pred,
        y_probs: Optional[np.ndarray] = None,
    ) -> Dict[str, float]:
        y_true = np.asarray(y_true)
        y_pred = np.asarray(y_pred)
        result = {
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
        if y_probs is not None:
            y_probs = np.asarray(y_probs)
            num_classes = y_probs.shape[1]
            labels = list(range(num_classes))
            for k in self.top_k:
                if k == 1:
                    result["top1_accuracy"] = result["accuracy"]
                elif num_classes >= k:
                    result[f"top{k}_accuracy"] = float(
                        top_k_accuracy_score(y_true, y_probs, k=k, labels=labels)
                    )
        return result

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
