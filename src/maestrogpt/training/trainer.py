"""Training utilities and trainer for MaestroGPT."""

import logging
import os
import sys
from typing import Dict, Any, Optional, List, Union
import torch
from pathlib import Path

from transformers import (
    TrainingArguments,
    Trainer,
    EarlyStoppingCallback,
    AutoTokenizer,
)
from transformers.trainer_callback import TrainerCallback
import wandb

from ..models import GPTWithLoRA, LoRAConfig
from ..data import LilyPondDataset, DataCollatorForMusicGeneration
from .config import TrainingConfig

logger = logging.getLogger(__name__)


class MusicGenerationCallback(TrainerCallback):
    """Callback for generating music samples during training."""
    
    def __init__(
        self,
        model: GPTWithLoRA,
        tokenizer: AutoTokenizer,
        eval_prompts: List[str],
        generation_config: Dict[str, Any],
        log_frequency: int = 500,
    ):
        """Initialize the callback.
        
        Args:
            model: Model for generation
            tokenizer: Tokenizer for decoding
            eval_prompts: List of prompts for evaluation
            generation_config: Generation configuration
            log_frequency: How often to generate samples (in steps)
        """
        self.model = model
        self.tokenizer = tokenizer
        self.eval_prompts = eval_prompts
        self.generation_config = generation_config
        self.log_frequency = log_frequency
    
    def on_step_end(self, args, state, control, **kwargs):
        """Generate samples at specified intervals."""
        if state.global_step % self.log_frequency == 0:
            self._generate_and_log_samples(state.global_step)
    
    def _generate_and_log_samples(self, step: int):
        """Generate and log music samples."""
        self.model.eval()
        
        samples = []
        for i, prompt in enumerate(self.eval_prompts[:3]):  # Limit to 3 samples
            try:
                generated = self.model.generate(
                    prompt,
                    **self.generation_config
                )
                samples.append({
                    "prompt": prompt,
                    "generated": generated,
                    "full_text": prompt + " " + generated
                })
            except Exception as e:
                logger.warning(f"Error generating sample {i}: {e}")
                continue
        
        # Log to wandb if available
        if wandb.run is not None:
            wandb.log({
                "generated_samples": wandb.Table(
                    columns=["step", "prompt", "generated", "full_text"],
                    data=[[step, s["prompt"], s["generated"], s["full_text"]] for s in samples]
                )
            }, step=step)
        
        self.model.train()


class MaestroTrainer:
    """Trainer class for MaestroGPT models.
    
    This class handles the complete training pipeline for fine-tuning
    GPT models on LilyPond music notation with LoRA adapters.
    """
    
    def __init__(
        self,
        config: TrainingConfig,
        model: Optional[GPTWithLoRA] = None,
        tokenizer: Optional[AutoTokenizer] = None,
        train_dataset: Optional[LilyPondDataset] = None,
        eval_dataset: Optional[LilyPondDataset] = None,
    ):
        """Initialize the trainer.
        
        Args:
            config: Training configuration
            model: Pre-initialized model (optional)
            tokenizer: Pre-initialized tokenizer (optional)
            train_dataset: Training dataset (optional)
            eval_dataset: Evaluation dataset (optional)
        """
        self.config = config
        self.model = model
        self.tokenizer = tokenizer
        self.train_dataset = train_dataset
        self.eval_dataset = eval_dataset
        self.trainer = None
        
        # Setup logging
        self._setup_logging()
        
        # Initialize components if not provided
        if self.model is None or self.tokenizer is None:
            self._initialize_model_and_tokenizer()
        
        # Setup wandb if configured
        self._setup_wandb()
    
    def _setup_logging(self):
        """Setup logging configuration."""
        logging.basicConfig(
            format="%(asctime)s - %(levelname)s - %(name)s - %(message)s",
            datefmt="%m/%d/%Y %H:%M:%S",
            level=logging.INFO,
        )
        
        # Set transformers logging level
        import transformers
        transformers.logging.set_verbosity_info()
    
    def _initialize_model_and_tokenizer(self):
        """Initialize model and tokenizer from config."""
        logger.info(f"Initializing model and tokenizer from {self.config.model_name_or_path}")
        
        # Initialize tokenizer
        tokenizer_path = self.config.tokenizer_name_or_path or self.config.model_name_or_path
        self.tokenizer = AutoTokenizer.from_pretrained(tokenizer_path)
        
        # Initialize model with LoRA
        if self.config.use_lora:
            lora_config = LoRAConfig(
                r=self.config.lora_r,
                lora_alpha=self.config.lora_alpha,
                lora_dropout=self.config.lora_dropout,
                target_modules=self.config.lora_target_modules,
            )
        else:
            lora_config = None
        
        self.model = GPTWithLoRA(
            model_name_or_path=self.config.model_name_or_path,
            lora_config=lora_config,
            tokenizer_name_or_path=tokenizer_path,
        )
    
    def _setup_wandb(self):
        """Setup Weights & Biases logging."""
        if "wandb" in self.config.report_to:
            try:
                wandb.init(
                    project=self.config.wandb_project,
                    entity=self.config.wandb_entity,
                    name=self.config.run_name,
                    config=self.config.__dict__,
                )
                logger.info("Initialized Weights & Biases logging")
            except Exception as e:
                logger.warning(f"Failed to initialize wandb: {e}")
    
    def load_datasets(
        self,
        train_data_path: Optional[str] = None,
        eval_data_path: Optional[str] = None,
    ):
        """Load training and evaluation datasets.
        
        Args:
            train_data_path: Path to training data
            eval_data_path: Path to evaluation data
        """
        train_path = train_data_path or self.config.train_data_path
        eval_path = eval_data_path or self.config.validation_data_path
        
        logger.info(f"Loading training data from {train_path}")
        if os.path.isdir(train_path):
            # Load from directory of preprocessed files
            train_files = list(Path(train_path).glob("*.json"))
            self.train_dataset = LilyPondDataset.from_preprocessed_files(
                [str(f) for f in train_files],
                self.tokenizer,
                max_length=self.config.max_sequence_length,
            )
        else:
            # Load from single file
            import json
            with open(train_path, 'r') as f:
                train_data = json.load(f)
            self.train_dataset = LilyPondDataset.from_split_data(
                train_data,
                self.tokenizer,
                max_length=self.config.max_sequence_length,
            )
        
        if eval_path and os.path.exists(eval_path):
            logger.info(f"Loading evaluation data from {eval_path}")
            if os.path.isdir(eval_path):
                eval_files = list(Path(eval_path).glob("*.json"))
                self.eval_dataset = LilyPondDataset.from_preprocessed_files(
                    [str(f) for f in eval_files],
                    self.tokenizer,
                    max_length=self.config.max_sequence_length,
                )
            else:
                import json
                with open(eval_path, 'r') as f:
                    eval_data = json.load(f)
                self.eval_dataset = LilyPondDataset.from_split_data(
                    eval_data,
                    self.tokenizer,
                    max_length=self.config.max_sequence_length,
                )
        
        # Log dataset statistics
        if self.train_dataset:
            train_stats = self.train_dataset.get_statistics()
            logger.info(f"Training dataset: {train_stats['total_samples']} samples")
            
        if self.eval_dataset:
            eval_stats = self.eval_dataset.get_statistics()
            logger.info(f"Evaluation dataset: {eval_stats['total_samples']} samples")
    
    def create_trainer(self) -> Trainer:
        """Create the HuggingFace Trainer object.
        
        Returns:
            Configured Trainer instance
        """
        # Create training arguments
        training_args = TrainingArguments(**self.config.to_training_args_dict())
        
        # Create data collator
        data_collator = DataCollatorForMusicGeneration(
            tokenizer=self.tokenizer,
            return_tensors="pt",
        )
        
        # Create callbacks
        callbacks = []
        
        # Early stopping callback
        if self.config.early_stopping_patience > 0:
            callbacks.append(
                EarlyStoppingCallback(
                    early_stopping_patience=self.config.early_stopping_patience,
                    early_stopping_threshold=self.config.early_stopping_threshold,
                )
            )
        
        # Music generation callback for evaluation
        if self.config.eval_generation and self.eval_dataset:
            eval_prompts = [
                "\\version \"2.24.0\" { c' d' e' f'",
                "\\time 4/4 \\key c \\major { g'4 f' e' d'",
                "{ a4 b c' d' e'2",
            ]
            
            generation_config = {
                "max_length": self.config.eval_generation_max_length,
                "temperature": self.config.eval_generation_temperature,
                "top_p": self.config.eval_generation_top_p,
                "do_sample": True,
            }
            
            callbacks.append(
                MusicGenerationCallback(
                    model=self.model,
                    tokenizer=self.tokenizer,
                    eval_prompts=eval_prompts,
                    generation_config=generation_config,
                    log_frequency=self.config.eval_steps,
                )
            )
        
        # Create trainer
        self.trainer = Trainer(
            model=self.model.model,  # Use the PEFT model
            args=training_args,
            train_dataset=self.train_dataset,
            eval_dataset=self.eval_dataset,
            data_collator=data_collator,
            callbacks=callbacks,
        )
        
        return self.trainer
    
    def train(self) -> Dict[str, Any]:
        """Train the model.
        
        Returns:
            Training metrics and results
        """
        logger.info("Starting training...")
        
        # Ensure datasets are loaded
        if self.train_dataset is None:
            self.load_datasets()
        
        # Create trainer if not already created
        if self.trainer is None:
            self.create_trainer()
        
        # Start training
        try:
            train_result = self.trainer.train(
                resume_from_checkpoint=self.config.resume_from_checkpoint
            )
            
            # Save the final model
            self.save_model()
            
            # Log final metrics
            logger.info("Training completed successfully!")
            logger.info(f"Training loss: {train_result.training_loss:.4f}")
            
            if wandb.run is not None:
                wandb.log({"final_training_loss": train_result.training_loss})
            
            return train_result.metrics
            
        except Exception as e:
            logger.error(f"Training failed: {e}")
            raise
    
    def evaluate(self) -> Dict[str, Any]:
        """Evaluate the model.
        
        Returns:
            Evaluation metrics
        """
        if self.trainer is None or self.eval_dataset is None:
            raise ValueError("Trainer and evaluation dataset must be initialized")
        
        logger.info("Running evaluation...")
        eval_result = self.trainer.evaluate()
        
        logger.info(f"Evaluation loss: {eval_result['eval_loss']:.4f}")
        
        return eval_result
    
    def save_model(self, output_dir: Optional[str] = None):
        """Save the trained model.
        
        Args:
            output_dir: Directory to save the model (optional)
        """
        save_dir = output_dir or self.config.output_dir
        
        logger.info(f"Saving model to {save_dir}")
        
        # Save the LoRA adapters
        self.model.save_pretrained(save_dir)
        
        # Save the configuration
        self.config.save_pretrained(save_dir)
        
        logger.info("Model saved successfully!")
    
    @classmethod
    def from_pretrained(
        cls,
        model_path: str,
        config_path: Optional[str] = None,
    ) -> "MaestroTrainer":
        """Load a trained model and create trainer.
        
        Args:
            model_path: Path to saved model
            config_path: Path to training config (optional)
            
        Returns:
            MaestroTrainer instance with loaded model
        """
        # Load config
        if config_path:
            config = TrainingConfig.from_pretrained(config_path)
        else:
            config_file = Path(model_path) / "training_config.json"
            if config_file.exists():
                config = TrainingConfig.from_pretrained(str(config_file))
            else:
                config = TrainingConfig()  # Use default config
        
        # Load model
        model = GPTWithLoRA.from_pretrained(
            model_name_or_path=config.model_name_or_path,
            adapter_path=model_path,
        )
        
        return cls(
            config=config,
            model=model,
            tokenizer=model.tokenizer,
        )


def main():
    """Main training function for command line usage."""
    import argparse
    
    parser = argparse.ArgumentParser(description="Train MaestroGPT model")
    parser.add_argument("--config", type=str, help="Path to training config file")
    parser.add_argument("--model_name", type=str, default="microsoft/DialoGPT-large",
                       help="Base model name or path")
    parser.add_argument("--train_data", type=str, required=True,
                       help="Path to training data")
    parser.add_argument("--eval_data", type=str, help="Path to evaluation data")
    parser.add_argument("--output_dir", type=str, default="outputs/maestrogpt-finetuned",
                       help="Output directory")
    parser.add_argument("--quick_test", action="store_true",
                       help="Use quick test configuration")
    
    args = parser.parse_args()
    
    # Load or create config
    if args.config:
        config = TrainingConfig.from_pretrained(args.config)
    elif args.quick_test:
        config = TrainingConfig.for_quick_test()
    else:
        config = TrainingConfig()
    
    # Override config with command line arguments
    if args.model_name:
        config.model_name_or_path = args.model_name
    if args.output_dir:
        config.output_dir = args.output_dir
    config.train_data_path = args.train_data
    if args.eval_data:
        config.validation_data_path = args.eval_data
    
    # Create trainer and start training
    trainer = MaestroTrainer(config)
    trainer.load_datasets()
    trainer.train()


if __name__ == "__main__":
    main()