"""GPT model with LoRA adapter for music generation."""

import logging
from typing import Optional, Dict, Any, Union
import torch
from torch import nn
from transformers import (
    AutoModelForCausalLM,
    AutoTokenizer,
    PreTrainedModel,
    PreTrainedTokenizer,
)
from peft import get_peft_model, PeftModel

from .lora_config import LoRAConfig

logger = logging.getLogger(__name__)


class GPTWithLoRA:
    """GPT model with LoRA adapters for efficient fine-tuning on music data.
    
    This class wraps a pre-trained GPT model and applies LoRA adapters for
    parameter-efficient fine-tuning on LilyPond music notation.
    """
    
    def __init__(
        self,
        model_name_or_path: str,
        lora_config: Optional[LoRAConfig] = None,
        tokenizer_name_or_path: Optional[str] = None,
        device: Optional[Union[str, torch.device]] = None,
        torch_dtype: Optional[torch.dtype] = None,
        trust_remote_code: bool = False,
    ):
        """Initialize GPT model with LoRA adapters.
        
        Args:
            model_name_or_path: HuggingFace model name or local path
            lora_config: LoRA configuration. If None, uses default config
            tokenizer_name_or_path: Tokenizer path. If None, uses model path
            device: Device to place model on
            torch_dtype: Data type for model weights
            trust_remote_code: Whether to trust remote code in model
        """
        self.model_name_or_path = model_name_or_path
        self.lora_config = lora_config or LoRAConfig.for_music_generation()
        self.device = device or ("cuda" if torch.cuda.is_available() else "cpu")
        self.torch_dtype = torch_dtype or torch.float16
        
        # Load tokenizer
        tokenizer_path = tokenizer_name_or_path or model_name_or_path
        self.tokenizer = AutoTokenizer.from_pretrained(
            tokenizer_path,
            trust_remote_code=trust_remote_code,
        )
        
        # Ensure pad token is set
        if self.tokenizer.pad_token is None:
            self.tokenizer.pad_token = self.tokenizer.eos_token
        
        # Load base model
        logger.info(f"Loading base model: {model_name_or_path}")
        self.base_model = AutoModelForCausalLM.from_pretrained(
            model_name_or_path,
            torch_dtype=self.torch_dtype,
            device_map="auto" if self.device == "cuda" else None,
            trust_remote_code=trust_remote_code,
        )
        
        # Apply LoRA
        logger.info("Applying LoRA adapters")
        self.model = get_peft_model(self.base_model, self.lora_config.to_peft_config())
        
        # Print trainable parameters info
        self.print_trainable_parameters()
    
    def print_trainable_parameters(self) -> None:
        """Print information about trainable parameters."""
        trainable_params = 0
        all_param = 0
        
        for _, param in self.model.named_parameters():
            all_param += param.numel()
            if param.requires_grad:
                trainable_params += param.numel()
        
        percentage = 100 * trainable_params / all_param
        
        logger.info(
            f"Trainable params: {trainable_params:,} || "
            f"All params: {all_param:,} || "
            f"Trainable%: {percentage:.2f}%"
        )
    
    def save_pretrained(self, save_directory: str) -> None:
        """Save the LoRA adapters.
        
        Args:
            save_directory: Directory to save the adapters
        """
        logger.info(f"Saving LoRA adapters to {save_directory}")
        self.model.save_pretrained(save_directory)
        self.tokenizer.save_pretrained(save_directory)
    
    @classmethod
    def from_pretrained(
        cls,
        model_name_or_path: str,
        adapter_path: str,
        device: Optional[Union[str, torch.device]] = None,
        torch_dtype: Optional[torch.dtype] = None,
        **kwargs
    ) -> "GPTWithLoRA":
        """Load model with pre-trained LoRA adapters.
        
        Args:
            model_name_or_path: Base model name or path
            adapter_path: Path to LoRA adapters
            device: Device to place model on
            torch_dtype: Data type for model weights
            **kwargs: Additional arguments
            
        Returns:
            GPTWithLoRA: Loaded model with adapters
        """
        device = device or ("cuda" if torch.cuda.is_available() else "cpu")
        torch_dtype = torch_dtype or torch.float16
        
        # Load tokenizer
        tokenizer = AutoTokenizer.from_pretrained(adapter_path)
        
        # Load base model
        base_model = AutoModelForCausalLM.from_pretrained(
            model_name_or_path,
            torch_dtype=torch_dtype,
            device_map="auto" if device == "cuda" else None,
            **kwargs
        )
        
        # Load model with adapters
        model = PeftModel.from_pretrained(base_model, adapter_path)
        
        # Create instance
        instance = cls.__new__(cls)
        instance.model_name_or_path = model_name_or_path
        instance.device = device
        instance.torch_dtype = torch_dtype
        instance.tokenizer = tokenizer
        instance.base_model = base_model
        instance.model = model
        
        return instance
    
    def generate(
        self,
        input_text: str,
        max_length: int = 512,
        temperature: float = 1.0,
        top_p: float = 0.9,
        top_k: int = 50,
        do_sample: bool = True,
        pad_token_id: Optional[int] = None,
        **kwargs
    ) -> str:
        """Generate music notation from input text.
        
        Args:
            input_text: Input prompt or partial music notation
            max_length: Maximum length of generated sequence
            temperature: Sampling temperature
            top_p: Top-p (nucleus) sampling parameter
            top_k: Top-k sampling parameter
            do_sample: Whether to use sampling
            pad_token_id: Padding token ID
            **kwargs: Additional generation parameters
            
        Returns:
            Generated music notation text
        """
        # Tokenize input
        inputs = self.tokenizer(
            input_text,
            return_tensors="pt",
            padding=True,
            truncation=True,
        ).to(self.device)
        
        # Set pad token
        if pad_token_id is None:
            pad_token_id = self.tokenizer.pad_token_id
        
        # Generate
        with torch.no_grad():
            outputs = self.model.generate(
                **inputs,
                max_length=max_length,
                temperature=temperature,
                top_p=top_p,
                top_k=top_k,
                do_sample=do_sample,
                pad_token_id=pad_token_id,
                **kwargs
            )
        
        # Decode output
        generated_text = self.tokenizer.decode(
            outputs[0], skip_special_tokens=True
        )
        
        # Remove input text from output
        if generated_text.startswith(input_text):
            generated_text = generated_text[len(input_text):].strip()
        
        return generated_text
    
    def forward(self, **kwargs) -> Dict[str, Any]:
        """Forward pass through the model.
        
        Args:
            **kwargs: Model inputs
            
        Returns:
            Model outputs
        """
        return self.model(**kwargs)
    
    def train(self) -> None:
        """Set model to training mode."""
        self.model.train()
    
    def eval(self) -> None:
        """Set model to evaluation mode."""
        self.model.eval()
    
    def to(self, device: Union[str, torch.device]) -> "GPTWithLoRA":
        """Move model to device.
        
        Args:
            device: Target device
            
        Returns:
            Self for chaining
        """
        self.model = self.model.to(device)
        self.device = device
        return self
    
    def parameters(self):
        """Get model parameters."""
        return self.model.parameters()
    
    def named_parameters(self):
        """Get named model parameters."""
        return self.model.named_parameters()