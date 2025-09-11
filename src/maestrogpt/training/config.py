"""Training configuration for MaestroGPT."""

from dataclasses import dataclass, field
from typing import Optional, Dict, Any, List
import os


@dataclass
class TrainingConfig:
    """Configuration class for training MaestroGPT models.
    
    This class encapsulates all training hyperparameters and settings
    for fine-tuning GPT models on LilyPond music notation.
    """
    
    # Model settings
    model_name_or_path: str = "microsoft/DialoGPT-large"
    tokenizer_name_or_path: Optional[str] = None
    
    # Data settings
    train_data_path: str = "data/processed/train"
    validation_data_path: str = "data/processed/validation"
    test_data_path: str = "data/processed/test"
    max_sequence_length: int = 1024
    
    # Training hyperparameters
    learning_rate: float = 5e-5
    num_train_epochs: int = 3
    per_device_train_batch_size: int = 4
    per_device_eval_batch_size: int = 4
    gradient_accumulation_steps: int = 4
    warmup_steps: int = 100
    max_steps: int = -1  # -1 means use num_train_epochs
    
    # Optimization settings
    optimizer: str = "adamw_torch"
    lr_scheduler_type: str = "cosine"
    weight_decay: float = 0.01
    adam_beta1: float = 0.9
    adam_beta2: float = 0.999
    adam_epsilon: float = 1e-8
    max_grad_norm: float = 1.0
    
    # LoRA settings
    use_lora: bool = True
    lora_r: int = 16
    lora_alpha: int = 32
    lora_dropout: float = 0.1
    lora_target_modules: Optional[List[str]] = None
    
    # Evaluation settings
    eval_steps: int = 500
    eval_strategy: str = "steps"  # "steps" or "epoch"
    save_steps: int = 500
    save_strategy: str = "steps"  # "steps" or "epoch"
    logging_steps: int = 100
    
    # Output settings
    output_dir: str = "outputs/maestrogpt-finetuned"
    logging_dir: str = "outputs/logs"
    run_name: Optional[str] = None
    
    # Hardware settings
    fp16: bool = True
    bf16: bool = False
    dataloader_num_workers: int = 4
    remove_unused_columns: bool = False
    
    # Checkpointing
    save_total_limit: int = 3
    load_best_model_at_end: bool = True
    metric_for_best_model: str = "eval_loss"
    greater_is_better: bool = False
    
    # Early stopping
    early_stopping_patience: int = 3
    early_stopping_threshold: float = 0.0
    
    # Wandb/logging settings
    report_to: List[str] = field(default_factory=lambda: ["wandb", "tensorboard"])
    wandb_project: str = "maestrogpt"
    wandb_entity: Optional[str] = None
    
    # Resume training
    resume_from_checkpoint: Optional[str] = None
    
    # Generation settings for evaluation
    eval_generation: bool = True
    eval_generation_max_length: int = 256
    eval_generation_temperature: float = 1.0
    eval_generation_top_p: float = 0.9
    eval_generation_num_samples: int = 5
    
    # Advanced settings
    deepspeed: Optional[str] = None
    fsdp: str = ""
    local_rank: int = -1
    
    def __post_init__(self):
        """Post-initialization processing."""
        # Set default LoRA target modules if not provided
        if self.use_lora and self.lora_target_modules is None:
            self.lora_target_modules = [
                "c_attn", "c_proj", "c_fc", "c_proj_ff"
            ]
        
        # Create output directories
        os.makedirs(self.output_dir, exist_ok=True)
        os.makedirs(self.logging_dir, exist_ok=True)
        
        # Set run name if not provided
        if self.run_name is None:
            import datetime
            timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
            self.run_name = f"maestrogpt_{timestamp}"
        
        # Validate settings
        self._validate_config()
    
    def _validate_config(self):
        """Validate configuration settings."""
        if self.max_steps > 0 and self.num_train_epochs > 0:
            raise ValueError(
                "Cannot specify both max_steps and num_train_epochs. "
                "Set max_steps=-1 to use num_train_epochs."
            )
        
        if self.per_device_train_batch_size < 1:
            raise ValueError("per_device_train_batch_size must be >= 1")
        
        if self.learning_rate <= 0:
            raise ValueError("learning_rate must be > 0")
        
        if self.use_lora:
            if self.lora_r <= 0:
                raise ValueError("lora_r must be > 0")
            if self.lora_alpha <= 0:
                raise ValueError("lora_alpha must be > 0")
    
    def to_training_args_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for HuggingFace TrainingArguments.
        
        Returns:
            Dictionary of training arguments
        """
        return {
            "output_dir": self.output_dir,
            "learning_rate": self.learning_rate,
            "num_train_epochs": self.num_train_epochs,
            "per_device_train_batch_size": self.per_device_train_batch_size,
            "per_device_eval_batch_size": self.per_device_eval_batch_size,
            "gradient_accumulation_steps": self.gradient_accumulation_steps,
            "warmup_steps": self.warmup_steps,
            "max_steps": self.max_steps,
            "optimizer": self.optimizer,
            "lr_scheduler_type": self.lr_scheduler_type,
            "weight_decay": self.weight_decay,
            "adam_beta1": self.adam_beta1,
            "adam_beta2": self.adam_beta2,
            "adam_epsilon": self.adam_epsilon,
            "max_grad_norm": self.max_grad_norm,
            "eval_steps": self.eval_steps,
            "evaluation_strategy": self.eval_strategy,
            "save_steps": self.save_steps,
            "save_strategy": self.save_strategy,
            "logging_steps": self.logging_steps,
            "logging_dir": self.logging_dir,
            "run_name": self.run_name,
            "fp16": self.fp16,
            "bf16": self.bf16,
            "dataloader_num_workers": self.dataloader_num_workers,
            "remove_unused_columns": self.remove_unused_columns,
            "save_total_limit": self.save_total_limit,
            "load_best_model_at_end": self.load_best_model_at_end,
            "metric_for_best_model": self.metric_for_best_model,
            "greater_is_better": self.greater_is_better,
            "report_to": self.report_to,
            "resume_from_checkpoint": self.resume_from_checkpoint,
            "deepspeed": self.deepspeed,
            "fsdp": self.fsdp,
            "local_rank": self.local_rank,
        }
    
    @classmethod
    def from_pretrained(cls, config_path: str) -> "TrainingConfig":
        """Load configuration from file.
        
        Args:
            config_path: Path to configuration file (JSON or YAML)
            
        Returns:
            TrainingConfig instance
        """
        import json
        import yaml
        from pathlib import Path
        
        config_path = Path(config_path)
        
        if config_path.suffix == ".json":
            with open(config_path, 'r') as f:
                config_dict = json.load(f)
        elif config_path.suffix in [".yaml", ".yml"]:
            with open(config_path, 'r') as f:
                config_dict = yaml.safe_load(f)
        else:
            raise ValueError(f"Unsupported config file format: {config_path.suffix}")
        
        return cls(**config_dict)
    
    def save_pretrained(self, save_directory: str) -> None:
        """Save configuration to directory.
        
        Args:
            save_directory: Directory to save configuration
        """
        import json
        from pathlib import Path
        
        save_path = Path(save_directory)
        save_path.mkdir(parents=True, exist_ok=True)
        
        config_dict = self.__dict__.copy()
        
        # Convert non-serializable objects
        for key, value in config_dict.items():
            if not isinstance(value, (str, int, float, bool, list, dict, type(None))):
                config_dict[key] = str(value)
        
        config_file = save_path / "training_config.json"
        with open(config_file, 'w') as f:
            json.dump(config_dict, f, indent=2)
    
    @classmethod
    def for_quick_test(cls) -> "TrainingConfig":
        """Create a configuration for quick testing.
        
        Returns:
            TrainingConfig optimized for quick testing
        """
        return cls(
            num_train_epochs=1,
            per_device_train_batch_size=2,
            per_device_eval_batch_size=2,
            gradient_accumulation_steps=1,
            max_sequence_length=256,
            eval_steps=50,
            save_steps=50,
            logging_steps=10,
            warmup_steps=10,
            lora_r=8,
            lora_alpha=16,
            report_to=[],  # Disable wandb for testing
        )
    
    @classmethod
    def for_production(cls) -> "TrainingConfig":
        """Create a configuration for production training.
        
        Returns:
            TrainingConfig optimized for production training
        """
        return cls(
            num_train_epochs=5,
            per_device_train_batch_size=8,
            per_device_eval_batch_size=8,
            gradient_accumulation_steps=2,
            max_sequence_length=1024,
            learning_rate=3e-5,
            warmup_steps=500,
            lora_r=32,
            lora_alpha=64,
            early_stopping_patience=5,
        )