# Hydra Migration Guide

This document describes the migration of MaestroGPT to use Hydra for configuration management.

## Overview

MaestroGPT has been successfully refactored to use Hydra 1.3.2 for experiment configuration management. This provides a more flexible and reproducible way to manage training configurations and run experiments.

## What Changed

### 1. Dependencies

Added `hydra-core==1.3.2` to `pyproject.toml`:

```toml
dependencies = [
    # ... other dependencies ...
    "hydra-core==1.3.2",
]
```

### 2. Configuration Structure

Created a new `conf/` directory with YAML configuration files:

```
conf/
├── config.yaml              # Main configuration entry point
├── training/
│   ├── default.yaml         # Default training configuration
│   ├── quick_test.yaml      # Quick test settings
│   └── production.yaml      # Production settings
├── lora/
│   ├── default.yaml         # Default LoRA configuration
│   ├── small.yaml           # Small model settings
│   └── large.yaml           # Large model settings
├── generation/
│   └── default.yaml         # Generation configuration
├── correction/
│   └── default.yaml         # Correction configuration
└── experiment/
    ├── quick_test.yaml      # Quick test experiment
    └── production.yaml      # Production experiment
```

### 3. Code Changes

#### Configuration Classes

All configuration dataclasses now have Hydra registration functions:

**TrainingConfig** (`src/maestrogpt/training/config.py`):
```python
from hydra.core.config_store import ConfigStore

def register_configs():
    """Register configs with Hydra ConfigStore."""
    cs = ConfigStore.instance()
    cs.store(name="training_config", node=TrainingConfig)
```

Similar changes for:
- **LoRAConfig** (`src/maestrogpt/models/lora_config.py`)
- **GenerationConfig** (`src/maestrogpt/inference/generator.py`)
- **CorrectionConfig** (`src/maestrogpt/inference/corrector.py`)

#### Training Scripts

Created `examples/train_with_hydra.py` - a new Hydra-based training script that:
- Uses `@hydra.main` decorator
- Loads configuration from YAML files
- Supports command-line overrides
- Provides better experiment tracking

### 4. New Features

#### Command-Line Configuration

Users can now configure training from the command line:

```bash
# Use default configuration
python examples/train_with_hydra.py

# Use experiment presets
python examples/train_with_hydra.py +experiment=quick_test
python examples/train_with_hydra.py +experiment=production

# Override specific parameters
python examples/train_with_hydra.py training.num_train_epochs=10 training.learning_rate=3e-5

# Combine different configurations
python examples/train_with_hydra.py training=production lora=large

# View configuration without running
python examples/train_with_hydra.py --cfg job

# Get help
python examples/train_with_hydra.py --help
```

#### Configuration Composition

Hydra allows composing configurations from multiple sources:

```yaml
# conf/experiment/quick_test.yaml
defaults:
  - override /training: quick_test
  - override /lora: small
  - override /generation: default
  - override /correction: default

training:
  model_name_or_path: microsoft/DialoGPT-medium
  output_dir: outputs/quick-test
  run_name: quick-test-experiment
```

### 5. Tests

Added comprehensive tests in `tests/test_hydra_config.py`:

- `TestHydraConfigLoading`: Tests loading configurations with Hydra
- `TestConfigClassIntegration`: Tests creating dataclass instances from Hydra configs
- `TestConfigValidation`: Tests YAML configuration file validity

All 11 tests pass successfully.

### 6. Documentation

- **conf/README.md**: Comprehensive guide to using Hydra configuration
- **README.md**: Updated with Hydra usage examples
- **HYDRA_MIGRATION.md**: This migration guide

## Backward Compatibility

All existing code continues to work:

1. **Original config classes**: `TrainingConfig`, `LoRAConfig`, etc. work as before
2. **Programmatic API**: Can still create configs directly in Python
3. **Old training examples**: `examples/train_model.py` continues to work
4. **No breaking changes**: All public APIs remain unchanged

## Migration Path for Users

### If you were using config files (JSON/YAML)

**Before:**
```python
config = TrainingConfig.from_pretrained("config.json")
trainer = MaestroTrainer(config)
trainer.train()
```

**After (Option 1 - Use Hydra):**
```bash
python examples/train_with_hydra.py +experiment=my_experiment
```

**After (Option 2 - Keep existing code):**
```python
# Your existing code continues to work
config = TrainingConfig.from_pretrained("config.json")
trainer = MaestroTrainer(config)
trainer.train()
```

### If you were using programmatic config

**Before:**
```python
config = TrainingConfig(
    num_train_epochs=10,
    learning_rate=3e-5,
    # ... other params
)
```

**After (Option 1 - Use Hydra):**
```bash
python examples/train_with_hydra.py \
    training.num_train_epochs=10 \
    training.learning_rate=3e-5
```

**After (Option 2 - Keep existing code):**
```python
# Your existing code continues to work
config = TrainingConfig(
    num_train_epochs=10,
    learning_rate=3e-5,
    # ... other params
)
```

## Benefits of Hydra

1. **Composability**: Mix and match configuration groups
2. **Command-line overrides**: Easy experimentation without code changes
3. **Reproducibility**: Configurations are automatically saved with outputs
4. **Organization**: Clear separation of different configuration aspects
5. **Validation**: Type checking with dataclass schemas
6. **Hydra ecosystem**: Access to plugins for distributed training, hyperparameter optimization, etc.

## Examples

### Quick Test Run

```bash
# Run a quick test with small model and short training
python examples/train_with_hydra.py +experiment=quick_test
```

This automatically uses:
- Quick test training config (1 epoch, small batches)
- Small LoRA config (r=8)
- Default generation and correction configs

### Production Run

```bash
# Run production training with optimized settings
python examples/train_with_hydra.py +experiment=production
```

This automatically uses:
- Production training config (5 epochs, larger batches)
- Large LoRA config (r=32)
- Default generation and correction configs

### Custom Experiment

```bash
# Combine different configs and override specific values
python examples/train_with_hydra.py \
    training=production \
    lora=large \
    training.output_dir=outputs/my-custom-experiment \
    training.learning_rate=1e-4 \
    training.num_train_epochs=8
```

## Troubleshooting

### Issue: "Key 'training' is not in struct"

This happens when trying to access nested config keys after using experiments. Experiments merge configs to the top level.

**Solution**: Access merged values directly or use the nested `training` group:
```python
cfg.num_train_epochs  # Works with experiments
# or
cfg.training.output_dir  # Access training-specific overrides
```

### Issue: "Multiple values for X"

This happens when trying to override a config group that's already specified.

**Solution**: Use `override` in defaults list:
```yaml
defaults:
  - override /training: production  # Use 'override' keyword
```

### Issue: Configuration not found

Make sure you're running from the project root directory where the `conf/` directory is accessible.

**Solution**: Run from project root or adjust `config_path` in `@hydra.main`:
```bash
cd /path/to/MaestroGPT
python examples/train_with_hydra.py
```

## Future Enhancements

Potential future improvements with Hydra:

1. **Hyperparameter sweeps**: Use Hydra's multirun feature for grid search
2. **Remote storage**: Save configs and outputs to cloud storage
3. **Job launchers**: Integrate with SLURM, Ray, or other job schedulers
4. **Config validation**: Add schema validation for config files
5. **Config versioning**: Track config changes over time

## References

- [Hydra Documentation](https://hydra.cc/)
- [Hydra Configuration Patterns](https://hydra.cc/docs/patterns/configuring_experiments/)
- [Structured Configs](https://hydra.cc/docs/tutorials/structured_config/intro/)

## Support

For questions or issues related to Hydra configuration:

1. Check the [conf/README.md](conf/README.md) documentation
2. Review the [tests/test_hydra_config.py](tests/test_hydra_config.py) examples
3. Consult the [Hydra documentation](https://hydra.cc/)
4. Open an issue on the GitHub repository
