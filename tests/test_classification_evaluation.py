"""Tests for evaluation and aggregation utilities."""

from __future__ import annotations

import numpy as np

from lilybert.evaluation import ClassificationMetrics, WindowAggregator


def test_window_aggregator_single_label_average_and_majority():
    aggregator = WindowAggregator()
    logits = np.array(
        [
            [3.0, 1.0, 0.2],
            [2.5, 1.2, 0.1],
            [0.1, 4.0, 0.2],
        ]
    )

    avg_pred = aggregator.average_probabilities(logits, multi_label=False)
    vote_pred = aggregator.majority_vote(logits, multi_label=False)

    assert isinstance(avg_pred, int)
    assert isinstance(vote_pred, int)
    assert avg_pred in {0, 1, 2}
    assert vote_pred in {0, 1, 2}


def test_window_aggregator_multi_label_average_and_majority():
    aggregator = WindowAggregator(threshold=0.5)
    logits = np.array(
        [
            [2.0, -1.0, 1.5],
            [1.7, -0.5, 1.2],
            [1.6, -0.8, -1.1],
        ]
    )

    avg_pred = aggregator.average_probabilities(logits, multi_label=True)
    vote_pred = aggregator.majority_vote(logits, multi_label=True)

    assert avg_pred.shape == (3,)
    assert vote_pred.shape == (3,)
    assert set(np.unique(avg_pred)).issubset({0, 1})
    assert set(np.unique(vote_pred)).issubset({0, 1})


def test_classification_metrics_single_label():
    metrics = ClassificationMetrics()
    y_true = np.array([0, 1, 2, 1, 0])
    y_pred = np.array([0, 1, 1, 1, 0])

    scores = metrics.compute_single_label(y_true=y_true, y_pred=y_pred)

    assert "accuracy" in scores
    assert "f1_macro" in scores
    assert "precision_macro" in scores
    assert "recall_macro" in scores
    assert 0.0 <= scores["accuracy"] <= 1.0


def test_classification_metrics_multi_label():
    metrics = ClassificationMetrics()
    y_true = np.array(
        [
            [1, 0, 1],
            [0, 1, 0],
            [1, 1, 0],
        ]
    )
    y_pred = np.array(
        [
            [1, 0, 1],
            [0, 1, 1],
            [1, 0, 0],
        ]
    )

    scores = metrics.compute_multi_label(y_true=y_true, y_pred=y_pred)

    assert "f1_micro" in scores
    assert "hamming_loss" in scores
    assert "subset_accuracy" in scores
    assert 0.0 <= scores["f1_micro"] <= 1.0
    assert 0.0 <= scores["subset_accuracy"] <= 1.0
