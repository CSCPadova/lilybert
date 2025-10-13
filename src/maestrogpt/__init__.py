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

# Import core modules that don't require heavy dependencies
from maestrogpt.data.lilypond_parser import LilyPondParser

# Conditional imports for modules that require ML dependencies
try:
    from maestrogpt.data import LilyPondDataset, LilyPondPreprocessor
    _DATA_AVAILABLE = True
except ImportError:
    _DATA_AVAILABLE = False

try:
    from maestrogpt.models import GPTWithLoRA, LoRAConfig
    _MODELS_AVAILABLE = True
except ImportError:
    _MODELS_AVAILABLE = False

try:
    from maestrogpt.training import MaestroTrainer, TrainingConfig
    _TRAINING_AVAILABLE = True
except ImportError:
    _TRAINING_AVAILABLE = False

try:
    from maestrogpt.evaluation import MusicEvaluator, MusicMetrics
    _EVALUATION_AVAILABLE = True
except ImportError:
    _EVALUATION_AVAILABLE = False

try:
    from maestrogpt.inference import MusicGenerator, ScoreCorrector
    _INFERENCE_AVAILABLE = True
except ImportError:
    _INFERENCE_AVAILABLE = False

# Build __all__ dynamically based on available modules
__all__ = ["LilyPondParser"]

if _DATA_AVAILABLE:
    __all__.extend(["LilyPondDataset", "LilyPondPreprocessor"])

if _MODELS_AVAILABLE:
    __all__.extend(["GPTWithLoRA", "LoRAConfig"])

if _TRAINING_AVAILABLE:
    __all__.extend(["MaestroTrainer", "TrainingConfig"])

if _EVALUATION_AVAILABLE:
    __all__.extend(["MusicEvaluator", "MusicMetrics"])

if _INFERENCE_AVAILABLE:
    __all__.extend(["MusicGenerator", "ScoreCorrector"])


def check_dependencies():
    """Check which dependencies are available."""
    status = {
        "data": _DATA_AVAILABLE,
        "models": _MODELS_AVAILABLE,
        "training": _TRAINING_AVAILABLE,
        "evaluation": _EVALUATION_AVAILABLE,
        "inference": _INFERENCE_AVAILABLE,
    }
    
    missing = [name for name, available in status.items() if not available]
    if missing:
        print(f"Missing dependencies for: {', '.join(missing)}")
        print("Install with: uv pip install -e . (or pip install -e .)")
    else:
        print("All dependencies available!")
    
    return status