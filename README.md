# MaestroGPT

**Fine-tune GPT models on LilyPond music notation with LoRA adapters**

MaestroGPT is a comprehensive Python project for fine-tuning open-weights GPT models on LilyPond music notation. It uses Parameter-Efficient Fine-Tuning (PEFT) with LoRA (Low-Rank Adaptation) adapters to efficiently train models for music generation, score correction, and musical analysis.

## 🎵 Features

- **🎼 LilyPond Processing**: Complete pipeline for parsing, preprocessing, and tokenizing LilyPond music notation
- **🔧 LoRA Fine-tuning**: Efficient fine-tuning using LoRA adapters with HuggingFace Transformers and PEFT
- **🎹 Music Generation**: Advanced generation capabilities with style control, constraints, and variation generation
- **✅ Score Correction**: Intelligent correction of syntax errors, musical inconsistencies, and style issues
- **📊 Evaluation Metrics**: Comprehensive evaluation metrics for music generation quality
- **🚀 Easy-to-use API**: Simple interfaces for training, generation, and evaluation
- **📝 Examples**: Complete examples for training, generation, and score correction

## 🚀 Quick Start

### Installation

#### Using uv (recommended)

[uv](https://github.com/astral-sh/uv) is a fast Python package installer and resolver.

```bash
# Install uv if you haven't already
curl -LsSf https://astral.sh/uv/install.sh | sh

# Clone the repository
git clone https://github.com/matteospanio/MaestroGPT.git
cd MaestroGPT

# Install the package
uv pip install -e .

# Or install with development dependencies
uv pip install -e ".[dev]"

# Alternatively, use uv sync for a full environment setup
uv sync
```

#### Using pip

```bash
# Clone the repository
git clone https://github.com/matteospanio/MaestroGPT.git
cd MaestroGPT

# Install the package
pip install -e .

# Or install with development dependencies
pip install -e ".[dev]"
```

### Basic Usage

#### 1. Training a Model

```python
from maestrogpt.training import TrainingConfig, MaestroTrainer

# Configure training
config = TrainingConfig.for_quick_test()  # Or customize your own
config.train_data_path = "data/processed/train.json"
config.validation_data_path = "data/processed/validation.json"

# Train the model
trainer = MaestroTrainer(config)
trainer.load_datasets()
trainer.train()
```

#### 2. Generating Music

```python
from maestrogpt.models import GPTWithLoRA
from maestrogpt.inference import MusicGenerator

# Load trained model
model = GPTWithLoRA.from_pretrained(
    model_name_or_path="microsoft/DialoGPT-medium",
    adapter_path="outputs/maestrogpt-finetuned"
)

# Generate music
generator = MusicGenerator(model)
result = generator.generate_from_prompt(
    prompt="A gentle waltz in G major",
    style="waltz"
)

print(result["generated_music"])
```

#### 3. Correcting Scores

```python
from maestrogpt.inference import ScoreCorrector

# Initialize corrector
corrector = ScoreCorrector(model)

# Correct a score with errors
score_with_errors = """\\version "2.24.0" { c4 d e h | g2 g2 """
result = corrector.correct_score(score_with_errors)

print(f"Original: {result.original_score}")
print(f"Corrected: {result.corrected_score}")
print(f"Errors fixed: {len(result.corrections_made)}")
```

## 📁 Project Structure

```
MaestroGPT/
├── src/maestrogpt/           # Main package
│   ├── data/                 # Data processing and datasets
│   ├── models/               # Model definitions and LoRA configs
│   ├── training/             # Training utilities and configs
│   ├── evaluation/           # Evaluation metrics and tools
│   └── inference/            # Generation and correction
├── data/                     # Data storage
│   ├── raw/                  # Original LilyPond files
│   └── processed/            # Preprocessed data
├── examples/                 # Example scripts
│   ├── train_model.py        # Training example
│   ├── generate_music.py     # Generation example
│   └── correct_score.py      # Correction example
├── tests/                    # Test suite
└── docs/                     # Documentation
```

## 🎼 Data Processing

MaestroGPT includes a complete pipeline for processing LilyPond music notation:

### LilyPond Parser

```python
from maestrogpt.data import LilyPondParser

parser = LilyPondParser()
elements = parser.parse_file("score.ly")

# Get statistics
stats = parser.get_statistics()
print(f"Found {stats['note_count']} notes and {stats['chord_count']} chords")
```

### Preprocessing Pipeline

```python
from maestrogpt.data import LilyPondPreprocessor

preprocessor = LilyPondPreprocessor(
    max_sequence_length=1024,
    normalize_notation=True,
    add_special_tokens=True
)

# Process directory of .ly files
processed = preprocessor.preprocess_directory("data/raw/")

# Create training splits
splits = preprocessor.create_training_data(processed)
```

## 🔧 Model Configuration

### LoRA Configuration

```python
from maestrogpt.models import LoRAConfig

# Quick configs for different model sizes
small_config = LoRAConfig.for_music_generation("small")
large_config = LoRAConfig.for_music_generation("large")

# Custom configuration
custom_config = LoRAConfig(
    r=32,
    lora_alpha=64,
    lora_dropout=0.1,
    target_modules=["c_attn", "c_proj", "c_fc"]
)
```

### Training Configuration

```python
from maestrogpt.training import TrainingConfig

# Production training
config = TrainingConfig.for_production()

# Quick testing
config = TrainingConfig.for_quick_test()

# Custom configuration
config = TrainingConfig(
    model_name_or_path="microsoft/DialoGPT-large",
    learning_rate=3e-5,
    num_train_epochs=5,
    per_device_train_batch_size=8,
    lora_r=16,
    lora_alpha=32
)
```

## 🎹 Advanced Generation

### Style-Controlled Generation

```python
# Generate in specific styles
result = generator.generate_from_prompt(
    "A Bach-style chorale",
    style="classical"
)

# Generate with constraints
result = generator.generate_with_constraints({
    "key": "g major",
    "time": "3/4",
    "tempo": "Allegro"
})
```

### Variation Generation

```python
# Generate variations of existing music
variations = generator.generate_variations(
    base_music=original_score,
    num_variations=5,
    variation_strength=0.7
)
```

### Batch Generation

```python
prompts = [
    "A cheerful melody",
    "A melancholy ballad", 
    "An energetic dance"
]

results = generator.batch_generate(prompts, batch_size=4)
```

## 📊 Evaluation

### Music Quality Metrics

```python
from maestrogpt.evaluation import MusicEvaluator, MusicMetrics

# Evaluate generation quality
evaluator = MusicEvaluator(model)
results = evaluator.evaluate_generation_quality(
    generated_texts=["\\version \"2.24.0\" { c4 d e f }"],
    prompts=["A simple melody"]
)

print(f"Average quality: {results['summary_stats']['overall_score_mean']:.3f}")
```

### Comprehensive Evaluation

```python
# Evaluate on test dataset
dataset_results = evaluator.evaluate_dataset(test_dataset)

# Generate detailed report
report_path = evaluator.generate_report(report_format="html")
```

## 🛠️ Command Line Interface

### Training

```bash
maestrogpt-train \
    --config config.json \
    --train_data data/processed/train.json \
    --eval_data data/processed/validation.json \
    --output_dir outputs/my-model
```

### Generation

```bash
maestrogpt-generate \
    --model_path outputs/my-model \
    --prompt "A waltz in F major" \
    --output_dir generated_music/
```

### Score Correction

```bash
maestrogpt-correct \
    --model_path outputs/my-model \
    --input_file score_with_errors.ly \
    --output_file corrected_score.ly
```

## 📚 Examples

Complete examples are provided in the `examples/` directory:

- **`train_model.py`**: Complete training pipeline with sample data
- **`generate_music.py`**: Music generation with various techniques
- **`correct_score.py`**: Score correction and refinement

Run an example:

```bash
cd examples
python train_model.py
python generate_music.py
python correct_score.py
```

## 🧪 Testing

Run the test suite:

```bash
# Run all tests
pytest tests/

# Run with coverage
pytest tests/ --cov=maestrogpt

# Run specific test file
pytest tests/test_basic.py -v
```

## 📖 Documentation

### API Reference

- **Data Processing**: `maestrogpt.data`
- **Models**: `maestrogpt.models` 
- **Training**: `maestrogpt.training`
- **Evaluation**: `maestrogpt.evaluation`
- **Inference**: `maestrogpt.inference`

### Configuration Files

- Training configs: `maestrogpt.training.TrainingConfig`
- LoRA configs: `maestrogpt.models.LoRAConfig`
- Generation configs: `maestrogpt.inference.GenerationConfig`

## 🤝 Contributing

Contributions are welcome! Please see our contributing guidelines:

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

### Development Setup

```bash
git clone https://github.com/matteospanio/MaestroGPT.git
cd MaestroGPT

# Using uv (recommended)
uv pip install -e ".[dev]"

# Or using pip
pip install -e ".[dev]"

# Optional: setup pre-commit hooks
pre-commit install
```

## 📄 License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- [HuggingFace Transformers](https://huggingface.co/transformers/) for the transformer models
- [PEFT](https://huggingface.co/docs/peft/) for parameter-efficient fine-tuning
- [LilyPond](http://lilypond.org/) for the music notation system
- [Music21](http://web.mit.edu/music21/) for music analysis capabilities

## 📧 Contact

For questions, issues, or contributions, please:

- Open an issue on GitHub
- Contact the maintainers
- Join our community discussions

---

**Happy music generation with MaestroGPT! 🎵**