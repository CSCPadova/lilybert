"""Evaluation tools for classification workflows."""

from .aggregation import WindowAggregator
from .metrics import ClassificationMetrics

__all__ = ["WindowAggregator", "ClassificationMetrics"]
