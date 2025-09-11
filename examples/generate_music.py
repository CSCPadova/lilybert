#!/usr/bin/env python3
"""
Example script for generating music with a trained MaestroGPT model.

This script demonstrates how to use a fine-tuned model to generate
LilyPond music notation from prompts.
"""

import logging
from pathlib import Path

from maestrogpt.models import GPTWithLoRA
from maestrogpt.inference import MusicGenerator, GenerationConfig
from maestrogpt.evaluation import MusicEvaluator

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def main():
    """Main generation function."""
    logger.info("Starting MaestroGPT music generation example")
    
    # Configuration
    model_path = "outputs/maestrogpt-example"  # Path to trained model
    output_dir = Path("generated_music")
    
    # Check if model exists
    if not Path(model_path).exists():
        logger.error(f"Model not found at {model_path}")
        logger.info("Please run train_model.py first to train a model")
        
        # For demonstration, we'll create a mock generator
        logger.info("Creating demonstration generator (no actual model)")
        return demonstrate_generation_api()
    
    # Step 1: Load the trained model
    logger.info("Step 1: Loading trained model")
    
    try:
        # Load the fine-tuned model
        model = GPTWithLoRA.from_pretrained(
            model_name_or_path="microsoft/DialoGPT-medium",  # Base model
            adapter_path=model_path,  # LoRA adapters
        )
        logger.info("Model loaded successfully")
        
    except Exception as e:
        logger.error(f"Failed to load model: {e}")
        return demonstrate_generation_api()
    
    # Step 2: Configure generation
    logger.info("Step 2: Configuring generation")
    
    generation_config = GenerationConfig(
        max_length=256,
        temperature=1.0,
        top_p=0.9,
        top_k=50,
        do_sample=True,
        repetition_penalty=1.1,
        ensure_musical_structure=True,
        filter_invalid_syntax=True,
    )
    
    # Initialize generator
    generator = MusicGenerator(model, generation_config)
    
    # Step 3: Generate music from prompts
    logger.info("Step 3: Generating music")
    
    prompts = [
        "A cheerful melody in C major",
        "A gentle waltz in 3/4 time",
        "A folk song in G major",
        "A classical phrase with arpeggios",
        "A simple children's song",
    ]
    
    results = []
    
    for i, prompt in enumerate(prompts):
        logger.info(f"Generating music {i+1}/{len(prompts)}: {prompt}")
        
        try:
            result = generator.generate_from_prompt(
                prompt=prompt,
                style="simple_melody",
            )
            
            results.append(result)
            
            # Log generation info
            scores = result.get("evaluation_scores", {})
            logger.info(f"Generated {len(result['generated_music'])} characters")
            logger.info(f"Overall quality score: {scores.get('overall_score', 0):.3f}")
            
        except Exception as e:
            logger.error(f"Failed to generate for prompt '{prompt}': {e}")
            continue
    
    # Step 4: Generate variations
    logger.info("Step 4: Generating variations")
    
    if results:
        base_music = results[0]["full_notation"]
        variations = generator.generate_variations(
            base_music=base_music,
            num_variations=3,
            variation_strength=0.5,
        )
        
        logger.info(f"Generated {len(variations)} variations")
        results.extend(variations)
    
    # Step 5: Evaluate generations
    logger.info("Step 5: Evaluating generations")
    
    evaluator = MusicEvaluator(model, output_dir=output_dir / "evaluation")
    
    # Extract generated texts for evaluation
    generated_texts = [r["generated_music"] for r in results if "generated_music" in r]
    prompts_used = [r["prompt"] for r in results if "prompt" in r]
    
    if generated_texts:
        evaluation_results = evaluator.evaluate_generation_quality(
            generated_texts=generated_texts,
            prompts=prompts_used,
        )
        
        summary = evaluation_results["summary_stats"]
        logger.info(f"Average quality score: {summary.get('overall_score_mean', 0):.3f}")
        logger.info(f"Average syntax score: {summary.get('syntax_score_mean', 0):.3f}")
    
    # Step 6: Save results
    logger.info("Step 6: Saving results")
    
    generator.save_generation_results(
        results=results,
        output_dir=str(output_dir),
        save_lilypond_files=True,
    )
    
    logger.info(f"Results saved to {output_dir}")
    
    # Step 7: Generate a report
    logger.info("Step 7: Generating evaluation report")
    
    if 'evaluator' in locals():
        report_path = evaluator.generate_report(report_format="markdown")
        logger.info(f"Evaluation report saved to {report_path}")
    
    logger.info("Music generation example completed!")


def demonstrate_generation_api():
    """Demonstrate the generation API without a real model."""
    logger.info("Demonstrating MaestroGPT generation API")
    
    # This shows how the API would work with a real model
    example_config = GenerationConfig(
        max_length=256,
        temperature=1.0,
        top_p=0.9,
        do_sample=True,
        ensure_musical_structure=True,
    )
    
    logger.info("Generation Configuration:")
    logger.info(f"  Max length: {example_config.max_length}")
    logger.info(f"  Temperature: {example_config.temperature}")
    logger.info(f"  Top-p: {example_config.top_p}")
    logger.info(f"  Musical structure: {example_config.ensure_musical_structure}")
    
    # Example prompts
    example_prompts = [
        "A simple melody in C major",
        "A waltz in 3/4 time",
        "A folk song with traditional harmonies",
        "A classical phrase with elegant ornaments",
        "A children's song with simple rhythm",
    ]
    
    logger.info("Example prompts for generation:")
    for i, prompt in enumerate(example_prompts, 1):
        logger.info(f"  {i}. {prompt}")
    
    # Example generated output (mock)
    example_output = '''\\version "2.24.0" \\relative c' {
  \\time 4/4 \\key c \\major
  c4 d e f | g2 g | 
  a4 a a a | g1 |
  f4 f f f | e2 e |
  d4 d d d | c1 |
}'''
    
    logger.info("Example generated output:")
    logger.info(example_output)
    
    # Show evaluation metrics
    logger.info("Example evaluation metrics:")
    logger.info("  Overall quality score: 0.85")
    logger.info("  Syntax correctness: 0.95")
    logger.info("  Musical coherence: 0.80")
    logger.info("  Rhythm consistency: 0.75")
    
    # Show different generation modes
    logger.info("Available generation modes:")
    logger.info("  1. generate_from_prompt() - Generate from text description")
    logger.info("  2. generate_variations() - Create variations of existing music")
    logger.info("  3. generate_continuation() - Continue partial music")
    logger.info("  4. generate_with_constraints() - Generate with specific musical constraints")
    logger.info("  5. generate_in_style() - Generate in the style of reference pieces")
    logger.info("  6. batch_generate() - Generate multiple pieces efficiently")
    
    # Show style templates
    style_templates = {
        "simple_melody": "Basic melodic structure",
        "folk_song": "Traditional folk music style",
        "classical": "Classical music structure with proper voice leading",
        "blues": "Blues progression and rhythm",
        "waltz": "3/4 time waltz structure",
    }
    
    logger.info("Available style templates:")
    for style, description in style_templates.items():
        logger.info(f"  {style}: {description}")
    
    logger.info("To use with a real model:")
    logger.info("  1. Train a model using train_model.py")
    logger.info("  2. Update model_path in this script")
    logger.info("  3. Run this script to generate music")


if __name__ == "__main__":
    main()