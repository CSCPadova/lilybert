# Hydra Configuration for MaestroGPT

This directory contains Hydra configuration files for MaestroGPT experiments. Hydra provides a powerful and flexible way to manage configurations for machine learning experiments.

## Directory Structure

```
conf/
├── config.yaml              # Main configuration file
├── training/                # Training configurations
│   ├── default.yaml         # Default training settings
│   ├── quick_test.yaml      # Quick test configuration
│   └── production.yaml      # Production training configuration
├── lora/                    # LoRA configurations
│   ├── default.yaml         # Default LoRA settings
│   ├── small.yaml           # Small model LoRA settings
│   └── large.yaml           # Large model LoRA settings
├── generation/              # Generation configurations
│   └── default.yaml         # Default generation settings
├── correction/              # Correction configurations
│   └── default.yaml         # Default correction settings
└── experiment/              # Complete experiment configurations
    ├── quick_test.yaml      # Quick test experiment
    └── production.yaml      # Production experiment
```

## Usage

### Basic Usage

Run training with default configuration:
```bash
python examples/train_with_hydra.py
```

### Using Different Configurations

Use quick test configuration:
```bash
python examples/train_with_hydra.py training=quick_test
```

Use production configuration:
```bash
python examples/train_with_hydra.py training=production
```

Use different LoRA settings:
```bash
python examples/train_with_hydra.py lora=large
```

### Using Experiment Configurations

Experiments combine multiple configuration groups:
```bash
python examples/train_with_hydra.py +experiment=quick_test
```

### Overriding Parameters

Override specific parameters from command line:
```bash
python examples/train_with_hydra.py training.num_train_epochs=10 training.learning_rate=1e-4
```

Multiple overrides:
```bash
python examples/train_with_hydra.py \
    training.num_train_epochs=5 \
    training.learning_rate=3e-5 \
    training.per_device_train_batch_size=8 \
    lora.r=32
```

### Combining Configurations

You can combine different configuration groups:
```bash
python examples/train_with_hydra.py \
    training=production \
    lora=large \
    training.output_dir=outputs/my-experiment
```

## Configuration Groups

### Training Configurations

- **default**: Standard training configuration with balanced settings
- **quick_test**: Fast configuration for testing (1 epoch, small batch)
- **production**: Production-ready configuration (5 epochs, larger batch)

### LoRA Configurations

- **default**: Standard LoRA settings (r=16, alpha=32)
- **small**: Lightweight LoRA for small models (r=8, alpha=16)
- **large**: Intensive LoRA for large models (r=32, alpha=64)

### Generation Configurations

- **default**: Standard generation settings for music generation

### Correction Configurations

- **default**: Standard correction settings for score correction

### Experiment Configurations

Experiments are complete configurations that combine multiple groups:

- **quick_test**: Quick test experiment (quick_test training + small LoRA)
- **production**: Production experiment (production training + large LoRA)

## Creating Custom Configurations

### Adding a New Training Configuration

Create a new file in `conf/training/`, e.g., `my_config.yaml`:

```yaml
# @package _global_
defaults:
  - default

# Your custom overrides
num_train_epochs: 10
learning_rate: 1e-4
output_dir: outputs/my-custom-run
```

Use it with:
```bash
python examples/train_with_hydra.py training=my_config
```

### Adding a New Experiment

Create a new file in `conf/experiment/`, e.g., `my_experiment.yaml`:

```yaml
# @package _global_

defaults:
  - /training: production
  - /lora: large
  - override /generation: default
  - override /correction: default

# Experiment-specific overrides
model_name_or_path: microsoft/DialoGPT-large
output_dir: outputs/my-experiment
run_name: my-experiment
```

Use it with:
```bash
python examples/train_with_hydra.py +experiment=my_experiment
```

## Benefits of Hydra Configuration

1. **Composability**: Mix and match configuration groups
2. **Reproducibility**: Complete configuration is logged and saved
3. **Flexibility**: Easy command-line overrides
4. **Organization**: Clear separation of different configuration aspects
5. **Type Safety**: Configuration schema validation with dataclasses

## Configuration Parameters

### Training Parameters

Key training parameters that can be configured:

- `model_name_or_path`: HuggingFace model to use
- `num_train_epochs`: Number of training epochs
- `learning_rate`: Learning rate for optimization
- `per_device_train_batch_size`: Training batch size per device
- `gradient_accumulation_steps`: Gradient accumulation steps
- `output_dir`: Directory for saving outputs
- `wandb_project`: Weights & Biases project name

### LoRA Parameters

Key LoRA parameters:

- `r`: LoRA rank (lower = fewer parameters)
- `lora_alpha`: LoRA alpha scaling parameter
- `lora_dropout`: Dropout for LoRA layers
- `target_modules`: Which modules to apply LoRA to

### Generation Parameters

Key generation parameters:

- `max_length`: Maximum generation length
- `temperature`: Sampling temperature
- `top_k`: Top-k sampling parameter
- `top_p`: Top-p (nucleus) sampling parameter

## Advanced Usage

### Working Directory

Hydra creates a new working directory for each run in `outputs/`. This helps keep experiments organized:

```
outputs/
└── 2024-01-15/
    └── 10-30-45/
        ├── .hydra/          # Hydra configuration
        ├── config.yaml      # Resolved configuration
        └── ...              # Your outputs
```

To disable this behavior:
```bash
python examples/train_with_hydra.py hydra.run.dir=.
```

### Multirun

Run multiple experiments with different parameters:
```bash
python examples/train_with_hydra.py -m training.learning_rate=1e-4,3e-5,5e-5
```

## References

- [Hydra Documentation](https://hydra.cc/)
- [Hydra Tutorial](https://hydra.cc/docs/tutorials/intro/)
- [Structured Configs](https://hydra.cc/docs/tutorials/structured_config/intro/)
