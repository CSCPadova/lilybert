"""LoRA configuration for efficient fine-tuning of GPT models."""

from dataclasses import dataclass
from typing import List, Optional

from peft import LoraConfig, TaskType
from hydra.core.config_store import ConfigStore


@dataclass
class LoRAConfig:
    """Configuration class for LoRA (Low-Rank Adaptation) parameters.
    
    This class encapsulates all the hyperparameters needed for LoRA fine-tuning
    of GPT models for music generation tasks.
    """
    
    # LoRA rank - lower rank means fewer parameters
    r: int = 16
    
    # LoRA alpha parameter for scaling
    lora_alpha: int = 32
    
    # Dropout probability for LoRA layers
    lora_dropout: float = 0.1
    
    # Target modules to apply LoRA to
    target_modules: Optional[List[str]] = None
    
    # Bias configuration
    bias: str = "none"  # "none", "all", "lora_only"
    
    # Task type for PEFT
    task_type: TaskType = TaskType.CAUSAL_LM
    
    # Whether to use rslora (rank-stabilized LoRA)
    use_rslora: bool = False
    
    # Whether to use DoRA (Weight-Decomposed Low-Rank Adaptation)
    use_dora: bool = False
    
    def __post_init__(self):
        """Set default target modules if not provided."""
        if self.target_modules is None:
            # Default target modules for GPT-like models
            self.target_modules = [
                "c_attn",  # Combined query, key, value projection
                "c_proj",  # Output projection
                "c_fc",    # Feed-forward first layer
                "c_proj_ff"  # Feed-forward second layer
            ]
    
    def to_peft_config(self) -> LoraConfig:
        """Convert to PEFT LoraConfig object.
        
        Returns:
            LoraConfig: PEFT LoRA configuration object
        """
        return LoraConfig(
            r=self.r,
            lora_alpha=self.lora_alpha,
            lora_dropout=self.lora_dropout,
            target_modules=self.target_modules,
            bias=self.bias,
            task_type=self.task_type,
            use_rslora=self.use_rslora,
            use_dora=self.use_dora,
        )
    
    @classmethod
    def for_music_generation(
        cls,
        model_size: str = "medium",
        use_advanced_features: bool = False
    ) -> "LoRAConfig":
        """Create optimized LoRA config for music generation.
        
        Args:
            model_size: Size of the model ("small", "medium", "large")
            use_advanced_features: Whether to use RSLoRA and DoRA
            
        Returns:
            LoRAConfig: Optimized configuration for music generation
        """
        if model_size == "small":
            return cls(
                r=8,
                lora_alpha=16,
                lora_dropout=0.05,
                use_rslora=use_advanced_features,
                use_dora=use_advanced_features,
            )
        elif model_size == "medium":
            return cls(
                r=16,
                lora_alpha=32,
                lora_dropout=0.1,
                use_rslora=use_advanced_features,
                use_dora=use_advanced_features,
            )
        elif model_size == "large":
            return cls(
                r=32,
                lora_alpha=64,
                lora_dropout=0.15,
                use_rslora=use_advanced_features,
                use_dora=use_advanced_features,
            )
        else:
            raise ValueError(f"Unknown model size: {model_size}")
    
    def get_trainable_params_estimate(self, base_model_params: int) -> tuple:
        """Estimate the number of trainable parameters with LoRA.
        
        Args:
            base_model_params: Number of parameters in the base model
            
        Returns:
            Tuple of (trainable_params, percentage_of_base)
        """
        # Rough estimation based on rank and target modules
        # This is a simplified calculation
        num_target_modules = len(self.target_modules)
        
        # Assume each target module has roughly the same size
        # For a typical transformer, this is an approximation
        params_per_module = base_model_params // (12 * 4)  # 12 layers, 4 main components
        
        # LoRA adds (input_dim * r) + (r * output_dim) parameters per module
        # Approximating input_dim ≈ output_dim for most modules
        typical_dim = int((params_per_module) ** 0.5)
        lora_params_per_module = 2 * typical_dim * self.r
        
        total_lora_params = num_target_modules * lora_params_per_module
        percentage = (total_lora_params / base_model_params) * 100
        
        return total_lora_params, percentage


# Register with Hydra ConfigStore
def register_configs():
    """Register configs with Hydra ConfigStore."""
    cs = ConfigStore.instance()
    cs.store(name="lora_config", node=LoRAConfig)