"""
MaestroGPT: Fine-tune GPT models on LilyPond music notation with LoRA adapters.

This package provides tools for:
- Data preprocessing of LilyPond music notation
- Fine-tuning GPT models using LoRA adapters
- Evaluation of music generation quality
- Inference for music generation and score correction
"""

__version__ = "0.1.0"
__author__ = "MaestroGPT Team"
__email__ = "team@maestrogpt.ai"

from maestrogpt.data import LilyPondDataset, LilyPondPreprocessor
from maestrogpt.models import GPTWithLoRA, LoRAConfig
from maestrogpt.training import MaestroTrainer, TrainingConfig
from maestrogpt.evaluation import MusicEvaluator, MusicMetrics
from maestrogpt.inference import MusicGenerator, ScoreCorrector

__all__ = [
    "LilyPondDataset",
    "LilyPondPreprocessor", 
    "GPTWithLoRA",
    "LoRAConfig",
    "MaestroTrainer",
    "TrainingConfig",
    "MusicEvaluator",
    "MusicMetrics",
    "MusicGenerator",
    "ScoreCorrector",
]