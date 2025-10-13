"""Music generation utilities and inference engine."""

import logging
import json
import re
from pathlib import Path
from typing import List, Dict, Any, Optional, Union, Tuple
import torch
import numpy as np
from dataclasses import dataclass

from ..models import GPTWithLoRA
from ..evaluation import MusicMetrics
from hydra.core.config_store import ConfigStore

logger = logging.getLogger(__name__)


@dataclass
class GenerationConfig:
    """Configuration for music generation."""
    max_length: int = 512
    min_length: int = 50
    temperature: float = 1.0
    top_k: int = 50
    top_p: float = 0.9
    repetition_penalty: float = 1.1
    do_sample: bool = True
    num_return_sequences: int = 1
    bad_words_ids: Optional[List[List[int]]] = None
    force_words_ids: Optional[List[List[int]]] = None
    pad_token_id: Optional[int] = None
    eos_token_id: Optional[int] = None
    
    # Music-specific settings
    ensure_musical_structure: bool = True
    filter_invalid_syntax: bool = True
    max_generation_attempts: int = 3


# Register with Hydra ConfigStore
def register_configs():
    """Register configs with Hydra ConfigStore."""
    cs = ConfigStore.instance()
    cs.store(name="generation_config", node=GenerationConfig)


class MusicGenerator:
    """Advanced music generation engine for LilyPond notation.
    
    This class provides sophisticated music generation capabilities including
    conditional generation, style transfer, and structure-aware composition.
    """
    
    def __init__(
        self,
        model: GPTWithLoRA,
        generation_config: Optional[GenerationConfig] = None,
        metrics: Optional[MusicMetrics] = None,
    ):
        """Initialize the music generator.
        
        Args:
            model: Fine-tuned GPT model with LoRA adapters
            generation_config: Configuration for generation
            metrics: Metrics for quality evaluation
        """
        self.model = model
        self.config = generation_config or GenerationConfig()
        self.metrics = metrics or MusicMetrics()
        
        # Set up tokenizer shortcuts
        self.tokenizer = model.tokenizer
        if self.config.pad_token_id is None:
            self.config.pad_token_id = self.tokenizer.pad_token_id
        if self.config.eos_token_id is None:
            self.config.eos_token_id = self.tokenizer.eos_token_id
        
        # Musical structure templates
        self.structure_templates = {
            "simple_melody": "\\version \"2.24.0\" \\relative c' { \\time 4/4 \\key c \\major ",
            "folk_song": "\\version \"2.24.0\" \\relative c' { \\time 3/4 \\key g \\major ",
            "classical": "\\version \"2.24.0\" \\relative c' { \\time 4/4 \\key c \\major \\clef treble ",
            "blues": "\\version \"2.24.0\" \\relative c' { \\time 4/4 \\key bes \\major ",
            "waltz": "\\version \"2.24.0\" \\relative c' { \\time 3/4 \\key f \\major ",
        }
    
    def generate_from_prompt(
        self,
        prompt: str,
        style: Optional[str] = None,
        **generation_kwargs
    ) -> Dict[str, Any]:
        """Generate music from a text prompt.
        
        Args:
            prompt: Text prompt describing the desired music
            style: Musical style template to use
            **generation_kwargs: Additional generation parameters
            
        Returns:
            Dictionary containing generated music and metadata
        """
        logger.info(f"Generating music from prompt: {prompt[:50]}...")
        
        # Prepare the input prompt
        prepared_prompt = self._prepare_prompt(prompt, style)
        
        # Merge generation config
        gen_config = self._merge_generation_config(**generation_kwargs)
        
        # Generate music with multiple attempts if needed
        best_result = None
        best_score = -1
        
        for attempt in range(self.config.max_generation_attempts):
            try:
                generated = self.model.generate(prepared_prompt, **gen_config)
                
                # Post-process the generated text
                processed = self._post_process_generation(generated)
                
                # Evaluate quality
                if self.config.filter_invalid_syntax:
                    score = self.metrics.calculate_syntax_score(processed)
                    if score > best_score:
                        best_score = score
                        best_result = processed
                    
                    # If we get a good score, we can stop
                    if score > 0.8:
                        break
                else:
                    best_result = processed
                    break
                    
            except Exception as e:
                logger.warning(f"Generation attempt {attempt + 1} failed: {e}")
                continue
        
        if best_result is None:
            logger.error("All generation attempts failed")
            return {"error": "Generation failed", "prompt": prompt}
        
        # Final evaluation
        final_scores = self.metrics.evaluate_generation(best_result, prompt=prompt)
        
        return {
            "prompt": prompt,
            "prepared_prompt": prepared_prompt,
            "generated_music": best_result,
            "full_notation": prepared_prompt + " " + best_result,
            "evaluation_scores": final_scores,
            "generation_metadata": {
                "style": style,
                "attempts": attempt + 1,
                "syntax_score": best_score,
            }
        }
    
    def generate_variations(
        self,
        base_music: str,
        num_variations: int = 3,
        variation_strength: float = 0.5,
        **generation_kwargs
    ) -> List[Dict[str, Any]]:
        """Generate variations of existing music.
        
        Args:
            base_music: Base music notation to vary
            num_variations: Number of variations to generate
            variation_strength: Strength of variations (0.0 = conservative, 1.0 = creative)
            **generation_kwargs: Additional generation parameters
            
        Returns:
            List of variation results
        """
        logger.info(f"Generating {num_variations} variations")
        
        variations = []
        
        # Adjust generation parameters based on variation strength
        temperature = self.config.temperature * (0.5 + variation_strength)
        top_p = max(0.1, self.config.top_p - variation_strength * 0.3)
        
        for i in range(num_variations):
            # Create variation prompt by using part of the base music
            music_tokens = base_music.split()
            prompt_length = int(len(music_tokens) * (0.3 + 0.3 * variation_strength))
            variation_prompt = " ".join(music_tokens[:prompt_length])
            
            # Generate variation
            result = self.generate_from_prompt(
                variation_prompt,
                temperature=temperature,
                top_p=top_p,
                **generation_kwargs
            )
            
            result["variation_id"] = i + 1
            result["variation_strength"] = variation_strength
            result["base_music"] = base_music
            
            variations.append(result)
        
        return variations
    
    def generate_continuation(
        self,
        partial_music: str,
        continuation_length: int = 256,
        maintain_style: bool = True,
        **generation_kwargs
    ) -> Dict[str, Any]:
        """Generate a continuation of partial music.
        
        Args:
            partial_music: Partial music notation to continue
            continuation_length: Length of continuation to generate
            maintain_style: Whether to maintain the existing musical style
            **generation_kwargs: Additional generation parameters
            
        Returns:
            Dictionary containing continuation result
        """
        logger.info("Generating music continuation")
        
        # Analyze the existing music to maintain style
        if maintain_style:
            style_analysis = self._analyze_musical_style(partial_music)
            generation_kwargs.update(style_analysis)
        
        # Generate continuation
        gen_config = self._merge_generation_config(
            max_length=continuation_length,
            **generation_kwargs
        )
        
        continuation = self.model.generate(partial_music, **gen_config)
        
        # Post-process
        processed_continuation = self._post_process_generation(continuation)
        full_music = partial_music + " " + processed_continuation
        
        # Evaluate
        scores = self.metrics.evaluate_generation(full_music)
        
        return {
            "partial_music": partial_music,
            "continuation": processed_continuation,
            "full_music": full_music,
            "evaluation_scores": scores,
            "style_maintained": maintain_style,
        }
    
    def generate_with_constraints(
        self,
        constraints: Dict[str, Any],
        base_prompt: str = "",
        **generation_kwargs
    ) -> Dict[str, Any]:
        """Generate music with specific musical constraints.
        
        Args:
            constraints: Dictionary of musical constraints
            base_prompt: Base prompt to start from
            **generation_kwargs: Additional generation parameters
            
        Returns:
            Dictionary containing constrained generation result
        """
        logger.info(f"Generating music with constraints: {constraints}")
        
        # Build constraint-aware prompt
        constrained_prompt = self._build_constrained_prompt(base_prompt, constraints)
        
        # Adjust generation parameters for constraints
        if "tempo" in constraints or "key" in constraints:
            # More conservative generation for structured pieces
            generation_kwargs.setdefault("temperature", 0.8)
            generation_kwargs.setdefault("top_p", 0.85)
        
        # Generate
        result = self.generate_from_prompt(
            constrained_prompt,
            **generation_kwargs
        )
        
        # Verify constraints are met
        constraint_adherence = self._verify_constraints(
            result["generated_music"], constraints
        )
        
        result["constraints"] = constraints
        result["constraint_adherence"] = constraint_adherence
        
        return result
    
    def generate_in_style(
        self,
        reference_pieces: List[str],
        prompt: str = "",
        style_strength: float = 0.7,
        **generation_kwargs
    ) -> Dict[str, Any]:
        """Generate music in the style of reference pieces.
        
        Args:
            reference_pieces: List of reference music pieces
            prompt: Optional prompt to guide generation
            style_strength: How strongly to adhere to reference style
            **generation_kwargs: Additional generation parameters
            
        Returns:
            Dictionary containing style-based generation result
        """
        logger.info(f"Generating music in style of {len(reference_pieces)} reference pieces")
        
        # Analyze style characteristics from references
        style_features = self._extract_style_features(reference_pieces)
        
        # Create style-aware prompt
        style_prompt = self._create_style_prompt(prompt, style_features, style_strength)
        
        # Adjust generation parameters
        generation_kwargs.setdefault("temperature", 0.9 * style_strength + 0.1)
        generation_kwargs.setdefault("repetition_penalty", 1.0 + 0.1 * style_strength)
        
        # Generate
        result = self.generate_from_prompt(style_prompt, **generation_kwargs)
        
        # Evaluate style consistency
        style_consistency = self._evaluate_style_consistency(
            result["generated_music"], reference_pieces
        )
        
        result["reference_pieces"] = reference_pieces
        result["style_features"] = style_features
        result["style_consistency"] = style_consistency
        
        return result
    
    def batch_generate(
        self,
        prompts: List[str],
        batch_size: int = 4,
        **generation_kwargs
    ) -> List[Dict[str, Any]]:
        """Generate music for multiple prompts in batches.
        
        Args:
            prompts: List of prompts to generate from
            batch_size: Number of prompts to process simultaneously
            **generation_kwargs: Additional generation parameters
            
        Returns:
            List of generation results
        """
        logger.info(f"Batch generating for {len(prompts)} prompts")
        
        results = []
        
        for i in range(0, len(prompts), batch_size):
            batch_prompts = prompts[i:i + batch_size]
            
            logger.info(f"Processing batch {i//batch_size + 1}/{(len(prompts) + batch_size - 1)//batch_size}")
            
            batch_results = []
            for prompt in batch_prompts:
                try:
                    result = self.generate_from_prompt(prompt, **generation_kwargs)
                    batch_results.append(result)
                except Exception as e:
                    logger.error(f"Error generating for prompt '{prompt[:30]}...': {e}")
                    batch_results.append({"error": str(e), "prompt": prompt})
            
            results.extend(batch_results)
        
        return results
    
    def save_generation_results(
        self,
        results: Union[Dict[str, Any], List[Dict[str, Any]]],
        output_dir: str,
        save_lilypond_files: bool = True,
    ) -> None:
        """Save generation results to files.
        
        Args:
            results: Generation results to save
            output_dir: Output directory
            save_lilypond_files: Whether to save .ly files
        """
        output_path = Path(output_dir)
        output_path.mkdir(parents=True, exist_ok=True)
        
        # Ensure results is a list
        if isinstance(results, dict):
            results = [results]
        
        # Save JSON results
        json_file = output_path / "generation_results.json"
        with open(json_file, 'w', encoding='utf-8') as f:
            json.dump(results, f, ensure_ascii=False, indent=2)
        
        # Save individual LilyPond files if requested
        if save_lilypond_files:
            ly_dir = output_path / "lilypond_files"
            ly_dir.mkdir(exist_ok=True)
            
            for i, result in enumerate(results):
                if "generated_music" in result or "full_notation" in result:
                    content = result.get("full_notation", result.get("generated_music", ""))
                    if content:
                        ly_file = ly_dir / f"generated_{i:03d}.ly"
                        with open(ly_file, 'w', encoding='utf-8') as f:
                            f.write(content)
        
        logger.info(f"Generation results saved to {output_path}")
    
    # Helper methods
    
    def _prepare_prompt(self, prompt: str, style: Optional[str] = None) -> str:
        """Prepare the input prompt for generation."""
        if style and style in self.structure_templates:
            # Use style template
            prepared = self.structure_templates[style] + prompt
        else:
            # Check if prompt already has LilyPond structure
            if not prompt.strip().startswith("\\"):
                # Add basic structure
                prepared = self.structure_templates["simple_melody"] + prompt
            else:
                prepared = prompt
        
        return prepared.strip()
    
    def _merge_generation_config(self, **kwargs) -> Dict[str, Any]:
        """Merge generation configuration with overrides."""
        config_dict = {
            "max_length": self.config.max_length,
            "temperature": self.config.temperature,
            "top_k": self.config.top_k,
            "top_p": self.config.top_p,
            "repetition_penalty": self.config.repetition_penalty,
            "do_sample": self.config.do_sample,
            "pad_token_id": self.config.pad_token_id,
            "eos_token_id": self.config.eos_token_id,
        }
        
        config_dict.update(kwargs)
        return config_dict
    
    def _post_process_generation(self, generated_text: str) -> str:
        """Post-process generated text."""
        # Remove repeated tokens
        generated_text = self._remove_repetitions(generated_text)
        
        # Ensure proper LilyPond syntax
        if self.config.ensure_musical_structure:
            generated_text = self._ensure_musical_structure(generated_text)
        
        # Clean up whitespace
        generated_text = re.sub(r'\s+', ' ', generated_text).strip()
        
        return generated_text
    
    def _remove_repetitions(self, text: str) -> str:
        """Remove excessive repetitions from generated text."""
        tokens = text.split()
        
        # Remove token-level repetitions
        cleaned_tokens = []
        for i, token in enumerate(tokens):
            # Don't add if it's the same as the last few tokens
            if i < 3 or not all(token == tokens[j] for j in range(i-3, i)):
                cleaned_tokens.append(token)
        
        # Remove phrase-level repetitions
        result = " ".join(cleaned_tokens)
        
        # Simple phrase repetition detection
        words = result.split()
        for length in [4, 6, 8]:
            if len(words) >= length * 2:
                # Check for repeated phrases
                for i in range(len(words) - length * 2 + 1):
                    phrase1 = words[i:i+length]
                    phrase2 = words[i+length:i+length*2]
                    if phrase1 == phrase2:
                        # Remove the repetition
                        result = " ".join(words[:i+length] + words[i+length*2:])
                        break
        
        return result
    
    def _ensure_musical_structure(self, text: str) -> str:
        """Ensure the generated text has proper musical structure."""
        # Add closing brace if missing
        if text.count("{") > text.count("}"):
            text += " }"
        
        # Ensure measure boundaries are reasonable
        if "|" not in text and len(text.split()) > 8:
            # Add some measure markers
            tokens = text.split()
            for i in range(8, len(tokens), 8):
                tokens.insert(i, "|")
            text = " ".join(tokens)
        
        return text
    
    def _analyze_musical_style(self, music: str) -> Dict[str, Any]:
        """Analyze musical style from existing music."""
        style_features = {}
        
        # Extract key signature
        key_match = re.search(r'\\key\s+([a-g](?:is|es)?)\s+\\(major|minor)', music)
        if key_match:
            style_features["key_signature"] = f"{key_match.group(1)} {key_match.group(2)}"
        
        # Extract time signature
        time_match = re.search(r'\\time\s+(\d+/\d+)', music)
        if time_match:
            style_features["time_signature"] = time_match.group(1)
        
        # Analyze rhythm patterns
        durations = re.findall(r'(\d+\.?)', music)
        if durations:
            style_features["common_durations"] = list(set(durations))
        
        return style_features
    
    def _build_constrained_prompt(self, base_prompt: str, constraints: Dict[str, Any]) -> str:
        """Build a prompt that incorporates musical constraints."""
        prompt_parts = []
        
        # Add version
        prompt_parts.append("\\version \"2.24.0\"")
        
        # Add relative if not present
        if "\\relative" not in base_prompt:
            prompt_parts.append("\\relative c'")
        
        prompt_parts.append("{")
        
        # Add time signature
        if "time" in constraints:
            prompt_parts.append(f"\\time {constraints['time']}")
        
        # Add key signature
        if "key" in constraints:
            prompt_parts.append(f"\\key {constraints['key']} \\major")
        
        # Add clef
        if "clef" in constraints:
            prompt_parts.append(f"\\clef {constraints['clef']}")
        
        # Add tempo
        if "tempo" in constraints:
            prompt_parts.append(f"\\tempo {constraints['tempo']}")
        
        # Add base prompt
        if base_prompt:
            prompt_parts.append(base_prompt)
        
        return " ".join(prompt_parts)
    
    def _verify_constraints(self, music: str, constraints: Dict[str, Any]) -> Dict[str, bool]:
        """Verify that generated music meets the specified constraints."""
        adherence = {}
        
        for constraint_type, constraint_value in constraints.items():
            if constraint_type == "key":
                adherence["key"] = constraint_value in music
            elif constraint_type == "time":
                adherence["time"] = constraint_value in music
            elif constraint_type == "clef":
                adherence["clef"] = constraint_value in music
            elif constraint_type == "tempo":
                adherence["tempo"] = str(constraint_value) in music
        
        return adherence
    
    def _extract_style_features(self, reference_pieces: List[str]) -> Dict[str, Any]:
        """Extract style features from reference pieces."""
        features = {
            "common_keys": [],
            "common_times": [],
            "common_durations": [],
            "common_note_patterns": [],
        }
        
        for piece in reference_pieces:
            # Extract keys
            keys = re.findall(r'\\key\s+([a-g](?:is|es)?)\s+\\(major|minor)', piece)
            features["common_keys"].extend(keys)
            
            # Extract time signatures
            times = re.findall(r'\\time\s+(\d+/\d+)', piece)
            features["common_times"].extend(times)
            
            # Extract durations
            durations = re.findall(r'(\d+\.?)', piece)
            features["common_durations"].extend(durations)
            
            # Extract note patterns (simple 3-gram)
            notes = re.findall(r'([a-g](?:is|es)?)', piece)
            for i in range(len(notes) - 2):
                pattern = " ".join(notes[i:i+3])
                features["common_note_patterns"].append(pattern)
        
        # Get most common elements
        from collections import Counter
        for key in features:
            if features[key]:
                counter = Counter(features[key])
                features[key] = [item for item, count in counter.most_common(5)]
        
        return features
    
    def _create_style_prompt(
        self,
        base_prompt: str,
        style_features: Dict[str, Any],
        style_strength: float
    ) -> str:
        """Create a style-aware prompt."""
        if not style_features:
            return base_prompt
        
        prompt_parts = ["\\version \"2.24.0\" \\relative c' {"]
        
        # Add style features with probability based on style_strength
        if style_features.get("common_times") and np.random.random() < style_strength:
            time_sig = np.random.choice(style_features["common_times"])
            prompt_parts.append(f"\\time {time_sig}")
        
        if style_features.get("common_keys") and np.random.random() < style_strength:
            key_sig = np.random.choice(style_features["common_keys"])
            prompt_parts.append(f"\\key {key_sig[0]} \\{key_sig[1]}")
        
        if base_prompt:
            prompt_parts.append(base_prompt)
        
        return " ".join(prompt_parts)
    
    def _evaluate_style_consistency(
        self,
        generated_music: str,
        reference_pieces: List[str]
    ) -> float:
        """Evaluate how consistent the generated music is with reference style."""
        # Simple heuristic: compare feature overlap
        generated_features = self._extract_style_features([generated_music])
        reference_features = self._extract_style_features(reference_pieces)
        
        consistency_scores = []
        
        for feature_type in ["common_keys", "common_times", "common_durations"]:
            gen_set = set(generated_features.get(feature_type, []))
            ref_set = set(reference_features.get(feature_type, []))
            
            if ref_set:
                overlap = len(gen_set & ref_set)
                total = len(ref_set)
                consistency_scores.append(overlap / total)
        
        return np.mean(consistency_scores) if consistency_scores else 0.5


def main():
    """Main function for command line usage."""
    import argparse
    
    parser = argparse.ArgumentParser(description="Generate music with MaestroGPT")
    parser.add_argument("--model_path", type=str, required=True,
                       help="Path to trained model")
    parser.add_argument("--prompt", type=str, default="",
                       help="Prompt for generation")
    parser.add_argument("--style", type=str, choices=list(MusicGenerator({}).structure_templates.keys()),
                       help="Musical style template")
    parser.add_argument("--output_dir", type=str, default="generated_music",
                       help="Output directory")
    parser.add_argument("--num_generations", type=int, default=1,
                       help="Number of pieces to generate")
    parser.add_argument("--temperature", type=float, default=1.0,
                       help="Generation temperature")
    parser.add_argument("--max_length", type=int, default=512,
                       help="Maximum generation length")
    
    args = parser.parse_args()
    
    # Load model (placeholder - would need actual model loading)
    print(f"Loading model from {args.model_path}")
    # model = GPTWithLoRA.from_pretrained(args.model_path)
    
    # For demo purposes, create a mock generator
    # generator = MusicGenerator(model)
    
    print(f"Generating {args.num_generations} pieces...")
    print(f"Prompt: {args.prompt}")
    print(f"Style: {args.style}")
    print(f"Output will be saved to: {args.output_dir}")


if __name__ == "__main__":
    main()