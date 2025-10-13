#!/usr/bin/env python3
"""
Hydra-based training script for MaestroGPT.

This script uses Hydra for configuration management, making it easy to run
experiments with different configurations.

Usage:
    # Use default configuration
    python train_with_hydra.py
    
    # Use quick test configuration
    python train_with_hydra.py training=quick_test
    
    # Use production configuration
    python train_with_hydra.py training=production
    
    # Use experiment configuration
    python train_with_hydra.py +experiment=quick_test
    
    # Override specific parameters
    python train_with_hydra.py training.num_train_epochs=10 training.learning_rate=1e-4
    
    # Use different LoRA configuration
    python train_with_hydra.py lora=large
"""

import logging
from pathlib import Path
import hydra
from omegaconf import DictConfig, OmegaConf

from maestrogpt.training import TrainingConfig, MaestroTrainer
from maestrogpt.data import LilyPondPreprocessor

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


@hydra.main(version_base=None, config_path="../conf", config_name="config")
def main(cfg: DictConfig):
    """Main training function with Hydra configuration.
    
    Args:
        cfg: Hydra configuration object containing all settings
    """
    logger.info("=" * 50)
    logger.info("MaestroGPT Training with Hydra")
    logger.info("=" * 50)
    logger.info(f"\nConfiguration:\n{OmegaConf.to_yaml(cfg)}")
    
    # Configuration
    data_dir = Path("data/raw")
    output_dir = Path(cfg.training.output_dir)
    
    # Step 1: Preprocess the data
    logger.info("\n" + "=" * 50)
    logger.info("Step 1: Preprocessing LilyPond data")
    logger.info("=" * 50)
    
    if not data_dir.exists():
        logger.warning(f"Data directory {data_dir} not found. Creating example data...")
        create_example_data(data_dir)
    
    # Initialize preprocessor
    preprocessor = LilyPondPreprocessor(
        max_sequence_length=cfg.training.max_sequence_length,
        add_special_tokens=True,
        normalize_notation=True,
    )
    
    # Preprocess all .ly files
    processed_files = preprocessor.preprocess_directory(
        str(data_dir),
        output_dir=str(data_dir.parent / "processed"),
    )
    
    if not processed_files:
        logger.error("No files were processed. Please check your data directory.")
        return
    
    logger.info(f"Processed {len(processed_files)} files")
    
    # Step 2: Create train/validation splits
    logger.info("\n" + "=" * 50)
    logger.info("Step 2: Creating data splits")
    logger.info("=" * 50)
    
    splits = preprocessor.create_training_data(
        processed_files,
        split_ratio=(0.8, 0.1, 0.1),
        min_sequence_length=50,
    )
    
    # Save splits
    for split_name, split_data in splits.items():
        split_file = data_dir.parent / "processed" / f"{split_name}.json"
        preprocessor.save_preprocessed_data(
            split_data,
            str(split_file),
            format="json"
        )
    
    logger.info(f"Created splits: train={len(splits['train'])}, "
               f"val={len(splits['validation'])}, test={len(splits['test'])}")
    
    # Step 3: Configure training
    logger.info("\n" + "=" * 50)
    logger.info("Step 3: Configuring training")
    logger.info("=" * 50)
    
    # Create training configuration from Hydra config
    training_dict = OmegaConf.to_container(cfg.training, resolve=True)
    
    # Override data paths with processed data
    training_dict['train_data_path'] = str(data_dir.parent / "processed" / "train.json")
    training_dict['validation_data_path'] = str(data_dir.parent / "processed" / "validation.json")
    
    config = TrainingConfig(**training_dict)
    
    # Save configuration
    config.save_pretrained(str(output_dir / "config"))
    
    # Step 4: Initialize trainer
    logger.info("\n" + "=" * 50)
    logger.info("Step 4: Initializing trainer")
    logger.info("=" * 50)
    
    trainer = MaestroTrainer(config)
    
    # Step 5: Load datasets
    logger.info("\n" + "=" * 50)
    logger.info("Step 5: Loading datasets")
    logger.info("=" * 50)
    
    trainer.load_datasets()
    
    # Step 6: Train the model
    logger.info("\n" + "=" * 50)
    logger.info("Step 6: Starting training")
    logger.info("=" * 50)
    
    try:
        metrics = trainer.train()
        logger.info("\n" + "=" * 50)
        logger.info("Training completed successfully!")
        logger.info("=" * 50)
        logger.info(f"Final training loss: {metrics.get('train_loss', 'N/A')}")
        
        # Step 7: Evaluate the model
        logger.info("\n" + "=" * 50)
        logger.info("Step 7: Evaluating model")
        logger.info("=" * 50)
        
        eval_metrics = trainer.evaluate()
        logger.info(f"Evaluation loss: {eval_metrics.get('eval_loss', 'N/A')}")
        
        # Step 8: Save the final model
        logger.info("\n" + "=" * 50)
        logger.info("Step 8: Saving model")
        logger.info("=" * 50)
        
        trainer.save_model()
        
        logger.info(f"Model saved to {output_dir}")
        logger.info("\n" + "=" * 50)
        logger.info("Training example completed successfully!")
        logger.info("=" * 50)
        
    except Exception as e:
        logger.error(f"Training failed: {e}")
        raise


def create_example_data(data_dir: Path):
    """Create some example LilyPond files for training."""
    data_dir.mkdir(parents=True, exist_ok=True)
    
    example_pieces = [
        {
            "filename": "simple_melody.ly",
            "content": '''\\version "2.24.0"
\\header {
  title = "Simple Melody"
  composer = "Example"
}

\\relative c' {
  \\time 4/4
  \\key c \\major
  \\clef treble
  
  c4 d e f |
  g2 g |
  a4 a a a |
  g1 |
  
  f4 f f f |
  e2 e |
  d4 d d d |
  c1 |
}'''
        },
        {
            "filename": "folk_tune.ly",
            "content": '''\\version "2.24.0"
\\header {
  title = "Folk Tune"
  composer = "Traditional"
}

\\relative c' {
  \\time 3/4
  \\key g \\major
  \\clef treble
  
  d4 g b |
  c2 b4 |
  a4 g fis |
  g2. |
  
  d4 g b |
  c2 d4 |
  b4 a g |
  d2. |
}'''
        },
        {
            "filename": "classical_phrase.ly",
            "content": '''\\version "2.24.0"
\\header {
  title = "Classical Phrase"
  composer = "Example"
}

\\relative c' {
  \\time 4/4
  \\key f \\major
  \\clef treble
  
  f4 a c f |
  e4 d c bes |
  a4 g f e |
  f2 r2 |
  
  c'4 bes a g |
  f4 e d c |
  bes4 a g f |
  f1 |
}'''
        },
        {
            "filename": "waltz.ly",
            "content": '''\\version "2.24.0"
\\header {
  title = "Simple Waltz"
  composer = "Example"
}

\\relative c' {
  \\time 3/4
  \\key bes \\major
  \\clef treble
  
  bes4 d f |
  bes2 f4 |
  g4 f es |
  d2. |
  
  c4 es g |
  c2 g4 |
  a4 g f |
  bes2. |
}'''
        },
        {
            "filename": "minor_scale.ly",
            "content": '''\\version "2.24.0"
\\header {
  title = "Minor Scale Exercise"
  composer = "Example"
}

\\relative c' {
  \\time 4/4
  \\key a \\minor
  \\clef treble
  
  a4 b c d |
  e4 f g a |
  g4 f e d |
  c4 b a2 |
  
  a'4 g f e |
  d4 c b a |
  b4 c d e |
  a,1 |
}'''
        },
    ]
    
    for piece in example_pieces:
        file_path = data_dir / piece["filename"]
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(piece["content"])
    
    logger.info(f"Created {len(example_pieces)} example LilyPond files in {data_dir}")


if __name__ == "__main__":
    main()
