"""Window-level to movement-level aggregation utilities."""

from __future__ import annotations

import numpy as np


class WindowAggregator:
    """Aggregate window logits into movement-level predictions."""

    def __init__(self, threshold: float = 0.5):
        self.threshold = float(threshold)

    def average_probabilities(self, window_logits, multi_label: bool):
        logits = np.asarray(window_logits)
        if logits.ndim != 2:
            raise ValueError("window_logits must be 2D: [n_windows, n_classes]")

        if multi_label:
            probs = self._sigmoid(logits)
            averaged = probs.mean(axis=0)
            return (averaged >= self.threshold).astype(int)

        probs = self._softmax(logits)
        averaged = probs.mean(axis=0)
        return int(np.argmax(averaged))

    def majority_vote(self, window_logits, multi_label: bool):
        logits = np.asarray(window_logits)
        if logits.ndim != 2:
            raise ValueError("window_logits must be 2D: [n_windows, n_classes]")

        if multi_label:
            probs = self._sigmoid(logits)
            votes = (probs >= self.threshold).astype(int)
            return (votes.mean(axis=0) >= 0.5).astype(int)

        votes = np.argmax(logits, axis=1)
        return int(np.bincount(votes).argmax())

    @staticmethod
    def _sigmoid(x):
        return 1.0 / (1.0 + np.exp(-x))

    @staticmethod
    def _softmax(x):
        shifted = x - np.max(x, axis=-1, keepdims=True)
        exp_x = np.exp(shifted)
        return exp_x / np.sum(exp_x, axis=-1, keepdims=True)
