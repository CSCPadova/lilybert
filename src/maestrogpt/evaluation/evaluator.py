"""Music evaluation utilities and orchestrator."""

import logging
import json
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple, Union
import numpy as np
import pandas as pd

from ..models import GPTWithLoRA
from ..data import LilyPondDataset
from .metrics import MusicMetrics

logger = logging.getLogger(__name__)


class MusicEvaluator:
    """Comprehensive evaluator for music generation models.
    
    This class orchestrates the evaluation of music generation models
    using various metrics and provides detailed analysis reports.
    """
    
    def __init__(
        self,
        model: GPTWithLoRA,
        metrics: Optional[MusicMetrics] = None,
        output_dir: str = "evaluation_results",
    ):
        """Initialize the evaluator.
        
        Args:
            model: Model to evaluate
            metrics: Metrics calculator (optional, creates default if None)
            output_dir: Directory to save evaluation results
        """
        self.model = model
        self.metrics = metrics or MusicMetrics()
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        self.evaluation_results = []
        self.summary_stats = {}
    
    def evaluate_dataset(
        self,
        dataset: LilyPondDataset,
        num_samples: Optional[int] = None,
        generation_config: Optional[Dict[str, Any]] = None,
        save_results: bool = True,
    ) -> Dict[str, Any]:
        """Evaluate model on a dataset.
        
        Args:
            dataset: Dataset to evaluate on
            num_samples: Number of samples to evaluate (None for all)
            generation_config: Configuration for text generation
            save_results: Whether to save detailed results
            
        Returns:
            Dictionary containing evaluation results
        """
        logger.info(f"Evaluating model on dataset with {len(dataset)} samples")
        
        # Default generation config
        if generation_config is None:
            generation_config = {
                "max_length": 256,
                "temperature": 1.0,
                "top_p": 0.9,
                "do_sample": True,
            }
        
        # Reset metrics
        self.metrics.reset()
        self.evaluation_results = []
        
        # Determine samples to evaluate
        indices = list(range(len(dataset)))
        if num_samples is not None:
            indices = indices[:num_samples]
        
        # Evaluate each sample
        for i, idx in enumerate(indices):
            if i % 50 == 0:
                logger.info(f"Evaluating sample {i+1}/{len(indices)}")
            
            try:
                result = self._evaluate_single_sample(
                    dataset, idx, generation_config
                )
                self.evaluation_results.append(result)
            except Exception as e:
                logger.error(f"Error evaluating sample {idx}: {e}")
                continue
        
        # Calculate summary statistics
        self.summary_stats = self._calculate_summary_stats()
        
        # Save results if requested
        if save_results:
            self._save_evaluation_results()
        
        logger.info(f"Evaluation completed. Overall score: {self.summary_stats.get('overall_score_mean', 0):.3f}")
        
        return {
            "summary_stats": self.summary_stats,
            "detailed_results": self.evaluation_results,
            "num_samples_evaluated": len(self.evaluation_results),
        }
    
    def evaluate_prompts(
        self,
        prompts: List[str],
        generation_config: Optional[Dict[str, Any]] = None,
        save_results: bool = True,
    ) -> Dict[str, Any]:
        """Evaluate model on a list of prompts.
        
        Args:
            prompts: List of prompts to generate from
            generation_config: Configuration for text generation
            save_results: Whether to save detailed results
            
        Returns:
            Dictionary containing evaluation results
        """
        logger.info(f"Evaluating model on {len(prompts)} prompts")
        
        # Default generation config
        if generation_config is None:
            generation_config = {
                "max_length": 256,
                "temperature": 1.0,
                "top_p": 0.9,
                "do_sample": True,
            }
        
        # Reset metrics
        self.metrics.reset()
        self.evaluation_results = []
        
        # Evaluate each prompt
        for i, prompt in enumerate(prompts):
            logger.info(f"Evaluating prompt {i+1}/{len(prompts)}: {prompt[:50]}...")
            
            try:
                result = self._evaluate_single_prompt(prompt, generation_config)
                self.evaluation_results.append(result)
            except Exception as e:
                logger.error(f"Error evaluating prompt {i}: {e}")
                continue
        
        # Calculate summary statistics
        self.summary_stats = self._calculate_summary_stats()
        
        # Save results if requested
        if save_results:
            self._save_evaluation_results()
        
        logger.info(f"Evaluation completed. Overall score: {self.summary_stats.get('overall_score_mean', 0):.3f}")
        
        return {
            "summary_stats": self.summary_stats,
            "detailed_results": self.evaluation_results,
            "num_prompts_evaluated": len(self.evaluation_results),
        }
    
    def evaluate_generation_quality(
        self,
        generated_texts: List[str],
        reference_texts: Optional[List[str]] = None,
        prompts: Optional[List[str]] = None,
        save_results: bool = True,
    ) -> Dict[str, Any]:
        """Evaluate a list of generated texts.
        
        Args:
            generated_texts: List of generated music texts
            reference_texts: List of reference texts (optional)
            prompts: List of original prompts (optional)
            save_results: Whether to save detailed results
            
        Returns:
            Dictionary containing evaluation results
        """
        logger.info(f"Evaluating {len(generated_texts)} generated texts")
        
        # Reset metrics
        self.metrics.reset()
        self.evaluation_results = []
        
        # Ensure lists have same length
        num_samples = len(generated_texts)
        reference_texts = reference_texts or [None] * num_samples
        prompts = prompts or [None] * num_samples
        
        # Evaluate each generated text
        for i in range(num_samples):
            try:
                scores = self.metrics.evaluate_generation(
                    generated_texts[i],
                    reference_texts[i],
                    prompts[i],
                )
                
                result = {
                    "sample_id": i,
                    "generated_text": generated_texts[i],
                    "reference_text": reference_texts[i],
                    "prompt": prompts[i],
                    "scores": scores,
                }
                
                self.evaluation_results.append(result)
                
            except Exception as e:
                logger.error(f"Error evaluating text {i}: {e}")
                continue
        
        # Calculate summary statistics
        self.summary_stats = self._calculate_summary_stats()
        
        # Save results if requested
        if save_results:
            self._save_evaluation_results()
        
        return {
            "summary_stats": self.summary_stats,
            "detailed_results": self.evaluation_results,
            "num_texts_evaluated": len(self.evaluation_results),
        }
    
    def compare_models(
        self,
        other_evaluators: List["MusicEvaluator"],
        model_names: Optional[List[str]] = None,
        save_comparison: bool = True,
    ) -> Dict[str, Any]:
        """Compare this model with other models.
        
        Args:
            other_evaluators: List of other evaluators to compare with
            model_names: Names for the models (optional)
            save_comparison: Whether to save comparison results
            
        Returns:
            Dictionary containing comparison results
        """
        if model_names is None:
            model_names = [f"Model_{i}" for i in range(len(other_evaluators) + 1)]
        
        # Collect summary stats from all evaluators
        all_stats = [self.summary_stats] + [evaluator.summary_stats for evaluator in other_evaluators]
        
        # Create comparison dataframe
        comparison_data = []
        for i, (stats, name) in enumerate(zip(all_stats, model_names)):
            row = {"model": name}
            row.update(stats)
            comparison_data.append(row)
        
        comparison_df = pd.DataFrame(comparison_data)
        
        # Calculate rankings
        ranking_columns = [col for col in comparison_df.columns if col.endswith("_mean")]
        rankings = {}
        
        for col in ranking_columns:
            # Higher is better for most metrics
            ascending = False
            rankings[col] = comparison_df[col].rank(ascending=ascending, method="min")
        
        # Add rankings to dataframe
        for col, ranks in rankings.items():
            comparison_df[f"{col}_rank"] = ranks
        
        # Save comparison if requested
        if save_comparison:
            comparison_file = self.output_dir / "model_comparison.csv"
            comparison_df.to_csv(comparison_file, index=False)
            logger.info(f"Model comparison saved to {comparison_file}")
        
        return {
            "comparison_dataframe": comparison_df,
            "rankings": rankings,
            "best_model": comparison_df.loc[comparison_df["overall_score_mean"].idxmax(), "model"],
        }
    
    def generate_report(self, report_format: str = "html") -> str:
        """Generate a comprehensive evaluation report.
        
        Args:
            report_format: Format for the report ("html", "markdown", or "text")
            
        Returns:
            Path to the generated report file
        """
        if report_format == "html":
            return self._generate_html_report()
        elif report_format == "markdown":
            return self._generate_markdown_report()
        elif report_format == "text":
            return self._generate_text_report()
        else:
            raise ValueError(f"Unsupported report format: {report_format}")
    
    def _evaluate_single_sample(
        self,
        dataset: LilyPondDataset,
        idx: int,
        generation_config: Dict[str, Any],
    ) -> Dict[str, Any]:
        """Evaluate a single dataset sample."""
        # Get the original text
        original_text = dataset.get_sample_text(idx)
        
        # Create a prompt (use first part of the text)
        text_tokens = original_text.split()
        prompt_length = min(20, len(text_tokens) // 3)
        prompt = " ".join(text_tokens[:prompt_length])
        
        # Generate continuation
        generated = self.model.generate(prompt, **generation_config)
        
        # Evaluate the generation
        scores = self.metrics.evaluate_generation(
            generated,
            reference_text=original_text,
            prompt=prompt,
        )
        
        return {
            "sample_id": idx,
            "original_text": original_text,
            "prompt": prompt,
            "generated_text": generated,
            "scores": scores,
        }
    
    def _evaluate_single_prompt(
        self,
        prompt: str,
        generation_config: Dict[str, Any],
    ) -> Dict[str, Any]:
        """Evaluate a single prompt."""
        # Generate from prompt
        generated = self.model.generate(prompt, **generation_config)
        
        # Evaluate the generation
        scores = self.metrics.evaluate_generation(
            generated,
            prompt=prompt,
        )
        
        return {
            "prompt": prompt,
            "generated_text": generated,
            "scores": scores,
        }
    
    def _calculate_summary_stats(self) -> Dict[str, Any]:
        """Calculate summary statistics from evaluation results."""
        if not self.evaluation_results:
            return {}
        
        # Collect all scores
        all_scores = {}
        for result in self.evaluation_results:
            for metric, value in result["scores"].items():
                if metric not in all_scores:
                    all_scores[metric] = []
                all_scores[metric].append(value)
        
        # Calculate statistics
        summary = {}
        for metric, values in all_scores.items():
            summary[f"{metric}_mean"] = np.mean(values)
            summary[f"{metric}_std"] = np.std(values)
            summary[f"{metric}_min"] = np.min(values)
            summary[f"{metric}_max"] = np.max(values)
            summary[f"{metric}_median"] = np.median(values)
        
        # Add sample count
        summary["num_samples"] = len(self.evaluation_results)
        
        return summary
    
    def _save_evaluation_results(self):
        """Save evaluation results to files."""
        # Save detailed results
        results_file = self.output_dir / "detailed_results.json"
        with open(results_file, 'w', encoding='utf-8') as f:
            json.dump(self.evaluation_results, f, ensure_ascii=False, indent=2)
        
        # Save summary statistics
        summary_file = self.output_dir / "summary_statistics.json"
        with open(summary_file, 'w', encoding='utf-8') as f:
            json.dump(self.summary_stats, f, indent=2)
        
        # Save as CSV for easy analysis
        if self.evaluation_results:
            csv_data = []
            for result in self.evaluation_results:
                row = {
                    "sample_id": result.get("sample_id", ""),
                    "prompt": result.get("prompt", "")[:100],  # Truncate for CSV
                    "generated_length": len(result.get("generated_text", "")),
                }
                row.update(result["scores"])
                csv_data.append(row)
            
            csv_file = self.output_dir / "evaluation_results.csv"
            pd.DataFrame(csv_data).to_csv(csv_file, index=False)
        
        logger.info(f"Evaluation results saved to {self.output_dir}")
    
    def _generate_html_report(self) -> str:
        """Generate HTML evaluation report."""
        report_file = self.output_dir / "evaluation_report.html"
        
        html_content = f"""
        <!DOCTYPE html>
        <html>
        <head>
            <title>MaestroGPT Evaluation Report</title>
            <style>
                body {{ font-family: Arial, sans-serif; margin: 20px; }}
                .metric {{ margin: 10px 0; }}
                table {{ border-collapse: collapse; width: 100%; }}
                th, td {{ border: 1px solid #ddd; padding: 8px; text-align: left; }}
                th {{ background-color: #f2f2f2; }}
            </style>
        </head>
        <body>
            <h1>MaestroGPT Evaluation Report</h1>
            
            <h2>Summary Statistics</h2>
            <table>
                <tr><th>Metric</th><th>Mean</th><th>Std</th><th>Min</th><th>Max</th></tr>
        """
        
        # Add metric rows
        for metric in ["overall_score", "syntax_score", "note_distribution_score", 
                      "rhythm_consistency_score", "structural_coherence_score"]:
            if f"{metric}_mean" in self.summary_stats:
                html_content += f"""
                <tr>
                    <td>{metric.replace('_', ' ').title()}</td>
                    <td>{self.summary_stats[f'{metric}_mean']:.3f}</td>
                    <td>{self.summary_stats[f'{metric}_std']:.3f}</td>
                    <td>{self.summary_stats[f'{metric}_min']:.3f}</td>
                    <td>{self.summary_stats[f'{metric}_max']:.3f}</td>
                </tr>
                """
        
        html_content += """
            </table>
            
            <h2>Sample Generations</h2>
        """
        
        # Add sample generations
        for i, result in enumerate(self.evaluation_results[:5]):  # Show first 5
            html_content += f"""
            <div style="border: 1px solid #ccc; margin: 10px 0; padding: 10px;">
                <h3>Sample {i+1}</h3>
                <p><strong>Prompt:</strong> {result.get('prompt', 'N/A')}</p>
                <p><strong>Generated:</strong> {result['generated_text'][:200]}...</p>
                <p><strong>Overall Score:</strong> {result['scores'].get('overall_score', 0):.3f}</p>
            </div>
            """
        
        html_content += """
        </body>
        </html>
        """
        
        with open(report_file, 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        return str(report_file)
    
    def _generate_markdown_report(self) -> str:
        """Generate Markdown evaluation report."""
        report_file = self.output_dir / "evaluation_report.md"
        
        content = "# MaestroGPT Evaluation Report\n\n"
        content += "## Summary Statistics\n\n"
        content += "| Metric | Mean | Std | Min | Max |\n"
        content += "|--------|------|-----|-----|-----|\n"
        
        # Add metric rows
        for metric in ["overall_score", "syntax_score", "note_distribution_score", 
                      "rhythm_consistency_score", "structural_coherence_score"]:
            if f"{metric}_mean" in self.summary_stats:
                name = metric.replace('_', ' ').title()
                mean = self.summary_stats[f'{metric}_mean']
                std = self.summary_stats[f'{metric}_std']
                min_val = self.summary_stats[f'{metric}_min']
                max_val = self.summary_stats[f'{metric}_max']
                content += f"| {name} | {mean:.3f} | {std:.3f} | {min_val:.3f} | {max_val:.3f} |\n"
        
        content += "\n## Sample Generations\n\n"
        
        # Add sample generations
        for i, result in enumerate(self.evaluation_results[:3]):  # Show first 3
            content += f"### Sample {i+1}\n\n"
            content += f"**Prompt:** {result.get('prompt', 'N/A')}\n\n"
            content += f"**Generated:** {result['generated_text'][:200]}...\n\n"
            content += f"**Overall Score:** {result['scores'].get('overall_score', 0):.3f}\n\n"
        
        with open(report_file, 'w', encoding='utf-8') as f:
            f.write(content)
        
        return str(report_file)
    
    def _generate_text_report(self) -> str:
        """Generate plain text evaluation report."""
        report_file = self.output_dir / "evaluation_report.txt"
        
        content = "MAESTROGPT EVALUATION REPORT\n"
        content += "=" * 50 + "\n\n"
        content += "SUMMARY STATISTICS\n"
        content += "-" * 20 + "\n\n"
        
        # Add metrics
        for metric in ["overall_score", "syntax_score", "note_distribution_score", 
                      "rhythm_consistency_score", "structural_coherence_score"]:
            if f"{metric}_mean" in self.summary_stats:
                name = metric.replace('_', ' ').title()
                mean = self.summary_stats[f'{metric}_mean']
                std = self.summary_stats[f'{metric}_std']
                content += f"{name}: {mean:.3f} (±{std:.3f})\n"
        
        content += f"\nNumber of samples evaluated: {self.summary_stats.get('num_samples', 0)}\n\n"
        
        with open(report_file, 'w', encoding='utf-8') as f:
            f.write(content)
        
        return str(report_file)