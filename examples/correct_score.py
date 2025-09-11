#!/usr/bin/env python3
"""
Example script for correcting and refining LilyPond music scores.

This script demonstrates how to use MaestroGPT's score correction
capabilities to fix syntax errors, improve musical consistency,
and enhance the overall quality of music notation.
"""

import logging
from pathlib import Path

from maestrogpt.models import GPTWithLoRA
from maestrogpt.inference import ScoreCorrector, CorrectionConfig

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def main():
    """Main correction function."""
    logger.info("Starting MaestroGPT score correction example")
    
    # Configuration
    model_path = "outputs/maestrogpt-example"  # Path to trained model
    output_dir = Path("corrected_scores")
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Step 1: Create example scores with errors
    logger.info("Step 1: Creating example scores with errors")
    
    example_scores = create_example_scores_with_errors()
    
    # Step 2: Load model (or demonstrate without model)
    logger.info("Step 2: Loading model for correction")
    
    if Path(model_path).exists():
        try:
            model = GPTWithLoRA.from_pretrained(
                model_name_or_path="microsoft/DialoGPT-medium",
                adapter_path=model_path,
            )
            logger.info("Model loaded successfully")
        except Exception as e:
            logger.error(f"Failed to load model: {e}")
            model = None
    else:
        logger.warning(f"Model not found at {model_path}")
        model = None
    
    if model is None:
        return demonstrate_correction_api(example_scores, output_dir)
    
    # Step 3: Configure correction
    logger.info("Step 3: Configuring score correction")
    
    correction_config = CorrectionConfig(
        syntax_correction=True,
        musical_correction=True,
        style_consistency=True,
        fix_repetitions=True,
        fix_structure=True,
        preserve_original_intent=True,
        correction_aggressiveness=0.5,
    )
    
    # Initialize corrector
    corrector = ScoreCorrector(model, correction_config)
    
    # Step 4: Correct each example score
    logger.info("Step 4: Correcting example scores")
    
    correction_results = []
    
    for i, (name, score) in enumerate(example_scores.items()):
        logger.info(f"Correcting score {i+1}/{len(example_scores)}: {name}")
        
        try:
            # Perform comprehensive correction
            result = corrector.correct_score(score)
            
            # Log correction info
            logger.info(f"  Corrections made: {len(result.corrections_made)}")
            logger.info(f"  Quality improvement: {result.quality_improvement:.3f}")
            logger.info(f"  Syntax errors fixed: {result.syntax_errors_fixed}")
            logger.info(f"  Musical errors fixed: {result.musical_errors_fixed}")
            logger.info(f"  Confidence score: {result.confidence_score:.3f}")
            
            correction_results.append((name, result))
            
        except Exception as e:
            logger.error(f"Failed to correct {name}: {e}")
            continue
    
    # Step 5: Demonstrate specific corrections
    logger.info("Step 5: Demonstrating specific correction types")
    
    # Syntax-only correction
    syntax_result = corrector.correct_syntax_only(example_scores["syntax_errors"])
    logger.info(f"Syntax-only correction: {syntax_result.syntax_errors_fixed} errors fixed")
    
    # Improvement suggestions
    suggestions = corrector.suggest_improvements(example_scores["musical_errors"])
    logger.info(f"Improvement suggestions: {len(suggestions)} suggestions")
    
    # Step 6: Save results
    logger.info("Step 6: Saving correction results")
    
    save_correction_results(correction_results, output_dir)
    
    logger.info(f"Correction results saved to {output_dir}")
    logger.info("Score correction example completed!")


def demonstrate_correction_api(example_scores, output_dir):
    """Demonstrate the correction API without a real model."""
    logger.info("Demonstrating MaestroGPT correction API")
    
    # Show configuration options
    logger.info("Correction Configuration Options:")
    logger.info("  syntax_correction: Fix LilyPond syntax errors")
    logger.info("  musical_correction: Fix musical inconsistencies")
    logger.info("  style_consistency: Improve style consistency")
    logger.info("  fix_repetitions: Remove excessive repetitions")
    logger.info("  fix_structure: Fix structural issues")
    logger.info("  preserve_original_intent: Maintain musical intent")
    
    # Show correction types
    logger.info("Available correction types:")
    logger.info("  1. correct_score() - Comprehensive correction")
    logger.info("  2. correct_syntax_only() - Syntax errors only")
    logger.info("  3. suggest_improvements() - Analysis without changes")
    logger.info("  4. fix_specific_issue() - Target specific problems")
    logger.info("  5. validate_correction() - Verify correction quality")
    
    # Demonstrate on example scores
    logger.info("Example scores with errors:")
    
    for name, score in example_scores.items():
        logger.info(f"\n{name.upper()}:")
        logger.info(f"Content: {score[:100]}...")
        
        # Simulate analysis
        if "syntax" in name:
            logger.info("  Issues found:")
            logger.info("    - Unbalanced braces")
            logger.info("    - Invalid note names")
            logger.info("  Suggested fixes:")
            logger.info("    - Add missing closing brace")
            logger.info("    - Replace 'h' with 'b'")
        
        elif "musical" in name:
            logger.info("  Issues found:")
            logger.info("    - Missing durations")
            logger.info("    - Inconsistent key signatures")
            logger.info("  Suggested fixes:")
            logger.info("    - Add quarter note durations")
            logger.info("    - Standardize to single key")
        
        elif "repetition" in name:
            logger.info("  Issues found:")
            logger.info("    - Excessive note repetitions")
            logger.info("    - Repeated phrases")
            logger.info("  Suggested fixes:")
            logger.info("    - Remove repetitive tokens")
            logger.info("    - Condense repeated phrases")
    
    # Show example correction result
    logger.info("\nExample correction result:")
    logger.info("  Original score quality: 0.65")
    logger.info("  Corrected score quality: 0.89")
    logger.info("  Quality improvement: +0.24")
    logger.info("  Syntax errors fixed: 3")
    logger.info("  Musical errors fixed: 2")
    logger.info("  Confidence score: 0.92")
    
    # Save demonstration files
    demo_file = output_dir / "correction_demo.txt"
    with open(demo_file, 'w', encoding='utf-8') as f:
        f.write("MaestroGPT Score Correction Demonstration\n")
        f.write("=" * 45 + "\n\n")
        
        for name, score in example_scores.items():
            f.write(f"{name.upper()}:\n")
            f.write("-" * 20 + "\n")
            f.write(f"Original:\n{score}\n\n")
            f.write("(Correction would be applied here with a trained model)\n\n")
    
    logger.info(f"Demonstration saved to {demo_file}")


def create_example_scores_with_errors():
    """Create example LilyPond scores with various types of errors."""
    return {
        "syntax_errors": '''\\version "2.24.0" \\relative c' {
  \\time 4/4 \\key c \\major
  c4 d e f |
  g2 h2 |  % Error: 'h' should be 'b'
  a4 a a a |
  g1
  % Error: Missing closing brace
''',
        
        "musical_errors": '''\\version "2.24.0" \\relative c' {
  \\time 4/4 \\key c \\major
  c d e f |  % Error: Missing durations
  \\key g \\major  % Error: Inconsistent key change
  g2 a2 |
  b4 c d e |
  c1 |
}''',
        
        "repetition_errors": '''\\version "2.24.0" \\relative c' {
  \\time 4/4 \\key c \\major
  c4 c4 c4 c4 |  % Error: Excessive repetition
  c4 c4 c4 c4 |  % Error: Repeated phrase
  d4 e4 f4 g4 |
  d4 e4 f4 g4 |  % Error: Repeated phrase again
}''',
        
        "structural_errors": '''% Error: Missing version
\\relative c' {
  % Error: Missing time and key signatures
  c4 d e f |
  g2 a2 |
  b4 c d e |
  c1
  % Error: Improper structure
''',
        
        "mixed_errors": '''\\version "2.24.0" {  % Error: Missing relative
  \\time 4/4 \\key c \\major
  c d e h |  % Error: Missing durations and invalid note
  g2 g2 g2 |  % Error: Too many notes for measure
  \\key g \\major  % Error: Key change
  a4 a4 a4 a4 |  % Error: Repetition
  % Error: Missing closing brace
''',
    }


def save_correction_results(results, output_dir):
    """Save correction results to files."""
    for name, result in results:
        # Save original score
        original_file = output_dir / f"{name}_original.ly"
        with open(original_file, 'w', encoding='utf-8') as f:
            f.write(result.original_score)
        
        # Save corrected score
        corrected_file = output_dir / f"{name}_corrected.ly"
        with open(corrected_file, 'w', encoding='utf-8') as f:
            f.write(result.corrected_score)
        
        # Save correction report
        report_file = output_dir / f"{name}_report.txt"
        with open(report_file, 'w', encoding='utf-8') as f:
            f.write(f"Correction Report for {name}\n")
            f.write("=" * 40 + "\n\n")
            f.write(f"Quality improvement: {result.quality_improvement:.3f}\n")
            f.write(f"Syntax errors fixed: {result.syntax_errors_fixed}\n")
            f.write(f"Musical errors fixed: {result.musical_errors_fixed}\n")
            f.write(f"Confidence score: {result.confidence_score:.3f}\n\n")
            
            f.write("Corrections made:\n")
            f.write("-" * 20 + "\n")
            for i, correction in enumerate(result.corrections_made, 1):
                f.write(f"{i}. {correction['description']}\n")
                f.write(f"   Type: {correction['type']}\n")
                f.write(f"   Before: {correction['before']}\n")
                f.write(f"   After: {correction['after']}\n\n")


if __name__ == "__main__":
    main()