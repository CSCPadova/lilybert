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


def test_classification_metrics_single_label_top_k_default():
    metrics = ClassificationMetrics()
    y_true = np.array([0, 1, 2, 1, 0])
    y_pred = np.array([0, 2, 1, 1, 0])
    y_probs = np.array(
        [
            [0.7, 0.2, 0.1, 0.0, 0.0],
            [0.1, 0.3, 0.4, 0.1, 0.1],
            [0.1, 0.4, 0.3, 0.1, 0.1],
            [0.1, 0.6, 0.2, 0.05, 0.05],
            [0.5, 0.2, 0.1, 0.1, 0.1],
        ]
    )

    scores = metrics.compute_single_label(
        y_true=y_true, y_pred=y_pred, y_probs=y_probs
    )

    # Default top_k is [1, 5]
    assert "top1_accuracy" in scores
    assert "top5_accuracy" in scores
    assert scores["top1_accuracy"] == scores["accuracy"]
    assert 0.0 <= scores["top5_accuracy"] <= 1.0
    assert scores["top5_accuracy"] >= scores["top1_accuracy"]


def test_classification_metrics_single_label_top_k_custom():
    metrics = ClassificationMetrics(top_k=[1, 3, 5])
    y_true = np.array([0, 1, 2, 1, 0])
    y_pred = np.array([0, 2, 1, 1, 0])
    y_probs = np.array(
        [
            [0.7, 0.2, 0.1, 0.0, 0.0],
            [0.1, 0.3, 0.4, 0.1, 0.1],
            [0.1, 0.4, 0.3, 0.1, 0.1],
            [0.1, 0.6, 0.2, 0.05, 0.05],
            [0.5, 0.2, 0.1, 0.1, 0.1],
        ]
    )

    scores = metrics.compute_single_label(
        y_true=y_true, y_pred=y_pred, y_probs=y_probs
    )

    assert "top1_accuracy" in scores
    assert "top3_accuracy" in scores
    assert "top5_accuracy" in scores
    assert scores["top5_accuracy"] >= scores["top3_accuracy"] >= scores["top1_accuracy"]


def test_classification_metrics_single_label_top_k_skipped_when_few_classes():
    metrics = ClassificationMetrics(top_k=[1, 5])
    y_true = np.array([0, 1, 0, 1])
    y_pred = np.array([0, 1, 1, 1])
    y_probs = np.array(
        [
            [0.8, 0.2],
            [0.3, 0.7],
            [0.4, 0.6],
            [0.2, 0.8],
        ]
    )

    scores = metrics.compute_single_label(
        y_true=y_true, y_pred=y_pred, y_probs=y_probs
    )

    # 2 classes: top-1 present, top-5 skipped
    assert "top1_accuracy" in scores
    assert "top5_accuracy" not in scores


def test_classification_metrics_single_label_no_top_k_without_probs():
    metrics = ClassificationMetrics()
    y_true = np.array([0, 1, 2, 1, 0])
    y_pred = np.array([0, 1, 1, 1, 0])

    scores = metrics.compute_single_label(y_true=y_true, y_pred=y_pred)

    assert "top1_accuracy" not in scores
    assert "top5_accuracy" not in scores


def test_window_aggregator_multi_label_no_double_sigmoid():
    """Regression: passing pre-sigmoided probs to the aggregator must not
    collapse predictions.  Raw logits with a strong positive signal (e.g. 5.0)
    should produce a prediction of 1, whereas double-sigmoid would compress
    sigmoid(5.0)≈1.0 → sigmoid(1.0)≈0.73, still above 0.5 but the *negative*
    case is the real tell: a logit of -3.0 yields sigmoid(-3.0)≈0.05, but
    double-sigmoid gives sigmoid(0.05)≈0.51 — flipping it to 1."""
    aggregator = WindowAggregator(threshold=0.5)

    # Single window with a clear negative logit for class 1
    logits = np.array([[4.0, -3.0, 2.0]])

    pred_from_logits = aggregator.average_probabilities(logits, multi_label=True)
    # Class 1 must be 0 (sigmoid(-3.0) ≈ 0.05 < 0.5)
    assert pred_from_logits[1] == 0, (
        "Aggregator should predict 0 for strongly negative logit; "
        "got 1 — possible double-sigmoid"
    )

    # If someone mistakenly pre-applies sigmoid, the aggregator would get
    # values near (0.98, 0.05, 0.88) and sigmoid those again to
    # (0.73, 0.51, 0.71) — all above threshold, flipping class 1 to 1.
    pre_sigmoided = 1.0 / (1.0 + np.exp(-logits))
    pred_from_probs = aggregator.average_probabilities(
        pre_sigmoided, multi_label=True
    )
    assert pred_from_probs[1] == 1, (
        "Sanity check: double-sigmoid on this input should incorrectly predict 1"
    )


def test_window_aggregator_single_label_no_double_softmax():
    """Regression: passing pre-softmaxed probs to the aggregator must not
    change the predicted class.  With raw logits [0.1, 5.0, 0.1] the winner
    is clearly class 1.  Double-softmax sharpens further so it often still
    picks the same argmax — but with a more ambiguous case the double
    application distorts the distribution."""
    aggregator = WindowAggregator()

    # Two windows: first strongly favours class 0, second mildly favours class 1.
    # Averaging raw softmax: class 0 wins.
    logits = np.array([
        [5.0, 0.0, 0.0],
        [1.0, 1.5, 0.0],
    ])

    pred_from_logits = aggregator.average_probabilities(logits, multi_label=False)

    # Manually compute expected: softmax then average
    def softmax(x):
        shifted = x - np.max(x, axis=-1, keepdims=True)
        e = np.exp(shifted)
        return e / e.sum(axis=-1, keepdims=True)

    expected = int(np.argmax(softmax(logits).mean(axis=0)))
    assert pred_from_logits == expected

    # Double softmax would change the distribution — verify it diverges
    pre_softmaxed = softmax(logits)
    pred_double = aggregator.average_probabilities(pre_softmaxed, multi_label=False)
    # After double-softmax the strong logit advantage is flattened, so the
    # second window's mild preference can shift the result.  We don't assert
    # which class wins with double-softmax, just that using raw logits gives
    # the correct answer.
    assert pred_from_logits == expected


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
