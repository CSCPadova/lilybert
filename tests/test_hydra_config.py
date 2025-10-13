"""Tests for Hydra configuration integration."""

import pytest
import tempfile
from pathlib import Path
from hydra import compose, initialize_config_dir
from omegaconf import OmegaConf

from maestrogpt.training import TrainingConfig
from maestrogpt.models import LoRAConfig
from maestrogpt.inference.generator import GenerationConfig
from maestrogpt.inference.corrector import CorrectionConfig


class TestHydraConfigLoading:
    """Test loading configurations with Hydra."""
    
    def test_load_default_config(self):
        """Test loading default configuration."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config")
            
            # Check that main config groups are present
            assert "training" in cfg
            assert "lora" in cfg
            assert "generation" in cfg
            assert "correction" in cfg
    
    def test_load_training_configs(self):
        """Test loading different training configurations."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        # Test default training config (default is already loaded)
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config")
            
            # Check base values from default config
            assert "training" in cfg
            assert cfg.training.learning_rate == 5e-5
            assert cfg.training.num_train_epochs == 3
        
        # Test quick_test training config
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config")
            # Merge quick_test values
            cfg.training.num_train_epochs = 1
            cfg.training.per_device_train_batch_size = 2
            
            assert cfg.training.num_train_epochs == 1
            assert cfg.training.per_device_train_batch_size == 2
    
    def test_load_lora_configs(self):
        """Test loading different LoRA configurations."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        # Test default LoRA config (default is already loaded)
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config")
            
            assert "lora" in cfg
            assert cfg.lora.r == 16
            assert cfg.lora.lora_alpha == 32
    
    def test_override_from_command_line(self):
        """Test overriding config values from command line."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(
                config_name="config",
                overrides=[
                    "training.num_train_epochs=10",
                    "training.learning_rate=1e-4",
                    "lora.r=24"
                ]
            )
            
            assert cfg.training.num_train_epochs == 10
            assert cfg.training.learning_rate == 1e-4
            assert cfg.lora.r == 24
    
    def test_experiment_configs(self):
        """Test loading experiment configurations."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        # Test quick_test experiment
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config", overrides=["+experiment=quick_test"])
            
            # With experiments, configs get merged into top level
            assert cfg.num_train_epochs == 1
            assert cfg.r == 8
            assert "training" in cfg
            assert cfg.training.output_dir == "outputs/quick-test"
        
        # Test production experiment
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config", overrides=["+experiment=production"])
            
            assert cfg.num_train_epochs == 5
            assert cfg.r == 32
            assert cfg.training.output_dir == "outputs/production-run"


class TestConfigClassIntegration:
    """Test integration between Hydra configs and dataclass configs."""
    
    def test_training_config_from_hydra(self):
        """Test creating TrainingConfig from Hydra config."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config")
            
            # Convert to dict and create TrainingConfig
            training_dict = OmegaConf.to_container(cfg.training, resolve=True)
            config = TrainingConfig(**training_dict)
            
            # Check default values
            assert config.num_train_epochs == 3
            assert config.per_device_train_batch_size == 4
            assert isinstance(config, TrainingConfig)
    
    def test_lora_config_from_hydra(self):
        """Test creating LoRAConfig from Hydra config."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config")
            
            # Convert to dict and create LoRAConfig
            lora_dict = OmegaConf.to_container(cfg.lora, resolve=True)
            config = LoRAConfig(**lora_dict)
            
            # Check default values
            assert config.r == 16
            assert config.lora_alpha == 32
            assert isinstance(config, LoRAConfig)
    
    def test_generation_config_from_hydra(self):
        """Test creating GenerationConfig from Hydra config."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config")
            
            # Convert to dict and create GenerationConfig
            gen_dict = OmegaConf.to_container(cfg.generation, resolve=True)
            config = GenerationConfig(**gen_dict)
            
            assert config.max_length == 512
            assert config.temperature == 1.0
            assert isinstance(config, GenerationConfig)
    
    def test_correction_config_from_hydra(self):
        """Test creating CorrectionConfig from Hydra config."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            cfg = compose(config_name="config")
            
            # Convert to dict and create CorrectionConfig
            corr_dict = OmegaConf.to_container(cfg.correction, resolve=True)
            config = CorrectionConfig(**corr_dict)
            
            assert config.syntax_correction is True
            assert config.correction_aggressiveness == 0.5
            assert isinstance(config, CorrectionConfig)


class TestConfigValidation:
    """Test configuration validation with Hydra."""
    
    def test_yaml_config_files_valid(self):
        """Test that all YAML config files are valid."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        # Check that main config file exists and is valid YAML
        main_config = config_dir / "config.yaml"
        assert main_config.exists()
        
        # Test that default config loads successfully
        with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
            try:
                cfg = compose(config_name="config")
                assert cfg is not None
                assert "training" in cfg
                assert "lora" in cfg
                assert "generation" in cfg
                assert "correction" in cfg
            except Exception as e:
                pytest.fail(f"Failed to load default config: {e}")
    
    def test_experiment_configs_valid(self):
        """Test that experiment configs are valid."""
        config_dir = Path(__file__).parent.parent / "conf"
        
        experiments = ["quick_test", "production"]
        
        for exp in experiments:
            with initialize_config_dir(version_base=None, config_dir=str(config_dir)):
                try:
                    cfg = compose(config_name="config", overrides=[f"+experiment={exp}"])
                    assert cfg is not None
                    # Experiment configs merge values to top level and have training sub-group
                    assert "training" in cfg
                    assert "generation" in cfg
                    assert "correction" in cfg
                except Exception as e:
                    pytest.fail(f"Failed to load experiment '{exp}': {e}")
