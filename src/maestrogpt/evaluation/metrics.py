"""Evaluation metrics for music generation tasks."""

import logging
import re
from typing import List, Dict, Any, Optional, Tuple
import numpy as np
from collections import Counter

try:
    import music21
    MUSIC21_AVAILABLE = True
except ImportError:
    MUSIC21_AVAILABLE = False
    logging.warning("music21 not available. Some evaluation metrics will be disabled.")

logger = logging.getLogger(__name__)


class MusicMetrics:
    """Collection of metrics for evaluating music generation quality.
    
    This class provides various metrics to evaluate the quality of generated
    LilyPond music notation, including syntactic correctness, musical coherence,
    and stylistic consistency.
    """
    
    def __init__(self):
        """Initialize the metrics calculator."""
        self.reset()
    
    def reset(self):
        """Reset all accumulated metrics."""
        self.scores = {
            "syntax_scores": [],
            "note_distribution_scores": [],
            "rhythm_consistency_scores": [],
            "harmonic_progression_scores": [],
            "structural_coherence_scores": [],
        }
    
    def evaluate_generation(
        self,
        generated_text: str,
        reference_text: Optional[str] = None,
        prompt: Optional[str] = None,
    ) -> Dict[str, float]:
        """Evaluate a single generated music piece.
        
        Args:
            generated_text: Generated LilyPond notation
            reference_text: Reference text for comparison (optional)
            prompt: Original prompt used for generation (optional)
            
        Returns:
            Dictionary of evaluation scores
        """
        scores = {}
        
        # Syntactic correctness
        scores["syntax_score"] = self.calculate_syntax_score(generated_text)
        
        # Note distribution analysis
        scores["note_distribution_score"] = self.calculate_note_distribution_score(
            generated_text, reference_text
        )
        
        # Rhythm consistency
        scores["rhythm_consistency_score"] = self.calculate_rhythm_consistency_score(
            generated_text
        )
        
        # Musical structure
        scores["structural_coherence_score"] = self.calculate_structural_coherence_score(
            generated_text
        )
        
        # Prompt adherence (if prompt provided)
        if prompt:
            scores["prompt_adherence_score"] = self.calculate_prompt_adherence_score(
                generated_text, prompt
            )
        
        # Harmonic analysis (if music21 available)
        if MUSIC21_AVAILABLE:
            scores["harmonic_progression_score"] = self.calculate_harmonic_progression_score(
                generated_text
            )
        
        # Overall quality score (weighted average)
        scores["overall_score"] = self.calculate_overall_score(scores)
        
        # Update accumulated scores
        self._update_accumulated_scores(scores)
        
        return scores
    
    def calculate_syntax_score(self, text: str) -> float:
        """Calculate syntactic correctness score.
        
        Args:
            text: LilyPond notation text
            
        Returns:
            Syntax score between 0 and 1
        """
        score = 1.0
        
        # Check for basic LilyPond syntax elements
        syntax_checks = [
            # Balanced braces
            self._check_balanced_braces(text),
            # Valid note names
            self._check_valid_notes(text),
            # Valid durations
            self._check_valid_durations(text),
            # Valid directives
            self._check_valid_directives(text),
            # No forbidden characters
            self._check_forbidden_characters(text),
        ]
        
        # Calculate weighted score
        weights = [0.3, 0.25, 0.2, 0.15, 0.1]
        score = sum(w * s for w, s in zip(weights, syntax_checks))
        
        return max(0.0, min(1.0, score))
    
    def calculate_note_distribution_score(
        self,
        generated_text: str,
        reference_text: Optional[str] = None
    ) -> float:
        """Calculate note distribution similarity score.
        
        Args:
            generated_text: Generated text
            reference_text: Reference text for comparison
            
        Returns:
            Distribution score between 0 and 1
        """
        generated_notes = self._extract_notes(generated_text)
        
        if not generated_notes:
            return 0.0
        
        if reference_text:
            # Compare with reference distribution
            reference_notes = self._extract_notes(reference_text)
            if reference_notes:
                return self._calculate_distribution_similarity(
                    generated_notes, reference_notes
                )
        
        # Evaluate against expected music properties
        return self._evaluate_note_distribution_properties(generated_notes)
    
    def calculate_rhythm_consistency_score(self, text: str) -> float:
        """Calculate rhythm consistency score.
        
        Args:
            text: LilyPond notation text
            
        Returns:
            Rhythm consistency score between 0 and 1
        """
        durations = self._extract_durations(text)
        
        if len(durations) < 2:
            return 0.5  # Neutral score for very short sequences
        
        # Check for rhythmic patterns and consistency
        pattern_score = self._analyze_rhythmic_patterns(durations)
        consistency_score = self._analyze_rhythmic_consistency(durations)
        
        return (pattern_score + consistency_score) / 2
    
    def calculate_structural_coherence_score(self, text: str) -> float:
        """Calculate structural coherence score.
        
        Args:
            text: LilyPond notation text
            
        Returns:
            Structural coherence score between 0 and 1
        """
        # Analyze musical phrases and structure
        measures = self._extract_measures(text)
        phrases = self._extract_phrases(text)
        
        if not measures:
            return 0.0
        
        # Check for reasonable measure lengths
        measure_score = self._analyze_measure_structure(measures)
        
        # Check for phrase structure
        phrase_score = self._analyze_phrase_structure(phrases) if phrases else 0.5
        
        # Check for key and time signature consistency
        consistency_score = self._analyze_musical_consistency(text)
        
        return (measure_score + phrase_score + consistency_score) / 3
    
    def calculate_prompt_adherence_score(self, generated_text: str, prompt: str) -> float:
        """Calculate how well the generation adheres to the prompt.
        
        Args:
            generated_text: Generated text
            prompt: Original prompt
            
        Returns:
            Prompt adherence score between 0 and 1
        """
        # Extract musical elements from prompt
        prompt_elements = self._extract_musical_elements(prompt)
        generated_elements = self._extract_musical_elements(generated_text)
        
        if not prompt_elements:
            return 1.0  # No specific requirements
        
        # Check adherence to key elements
        adherence_scores = []
        
        for element_type, prompt_value in prompt_elements.items():
            if element_type in generated_elements:
                if element_type in ["key", "time"]:
                    # Exact match required
                    score = 1.0 if generated_elements[element_type] == prompt_value else 0.0
                else:
                    # Partial match allowed
                    score = self._calculate_element_similarity(
                        generated_elements[element_type], prompt_value
                    )
                adherence_scores.append(score)
        
        return np.mean(adherence_scores) if adherence_scores else 0.5
    
    def calculate_harmonic_progression_score(self, text: str) -> float:
        """Calculate harmonic progression quality score (requires music21).
        
        Args:
            text: LilyPond notation text
            
        Returns:
            Harmonic progression score between 0 and 1
        """
        if not MUSIC21_AVAILABLE:
            return 0.5  # Neutral score
        
        try:
            # Convert to music21 format and analyze harmony
            stream = self._lilypond_to_music21(text)
            if stream is None:
                return 0.0
            
            # Analyze chord progressions
            chord_score = self._analyze_chord_progressions(stream)
            
            # Analyze voice leading
            voice_leading_score = self._analyze_voice_leading(stream)
            
            return (chord_score + voice_leading_score) / 2
            
        except Exception as e:
            logger.warning(f"Error in harmonic analysis: {e}")
            return 0.5
    
    def calculate_overall_score(self, scores: Dict[str, float]) -> float:
        """Calculate overall quality score from individual metrics.
        
        Args:
            scores: Dictionary of individual scores
            
        Returns:
            Overall score between 0 and 1
        """
        # Define weights for different aspects
        weights = {
            "syntax_score": 0.25,
            "note_distribution_score": 0.15,
            "rhythm_consistency_score": 0.2,
            "structural_coherence_score": 0.2,
            "harmonic_progression_score": 0.15,
            "prompt_adherence_score": 0.05,
        }
        
        weighted_sum = 0.0
        total_weight = 0.0
        
        for metric, weight in weights.items():
            if metric in scores:
                weighted_sum += scores[metric] * weight
                total_weight += weight
        
        return weighted_sum / total_weight if total_weight > 0 else 0.0
    
    def get_accumulated_scores(self) -> Dict[str, float]:
        """Get accumulated scores across all evaluated pieces.
        
        Returns:
            Dictionary of mean scores
        """
        mean_scores = {}
        
        for metric, values in self.scores.items():
            if values:
                mean_scores[metric.replace("_scores", "_mean")] = np.mean(values)
                mean_scores[metric.replace("_scores", "_std")] = np.std(values)
        
        return mean_scores
    
    # Helper methods
    
    def _check_balanced_braces(self, text: str) -> float:
        """Check if braces are balanced."""
        count = 0
        for char in text:
            if char == '{':
                count += 1
            elif char == '}':
                count -= 1
            if count < 0:
                return 0.0
        return 1.0 if count == 0 else 0.0
    
    def _check_valid_notes(self, text: str) -> float:
        """Check for valid note names."""
        note_pattern = r'[a-g](?:is|es)?(?:[\',]+)?'
        invalid_notes = re.findall(r'[h-z](?:is|es)?(?:[\',]+)?', text)
        total_notes = len(re.findall(note_pattern, text)) + len(invalid_notes)
        
        if total_notes == 0:
            return 1.0
        
        return 1.0 - (len(invalid_notes) / total_notes)
    
    def _check_valid_durations(self, text: str) -> float:
        """Check for valid duration values."""
        valid_durations = {'1', '2', '4', '8', '16', '32', '64'}
        duration_pattern = r'(\d+)\.?'
        durations = re.findall(duration_pattern, text)
        
        if not durations:
            return 1.0
        
        valid_count = sum(1 for d in durations if d in valid_durations)
        return valid_count / len(durations)
    
    def _check_valid_directives(self, text: str) -> float:
        """Check for valid LilyPond directives."""
        common_directives = {
            'time', 'key', 'clef', 'tempo', 'relative', 'version', 'major', 'minor'
        }
        directive_pattern = r'\\([a-zA-Z]+)'
        directives = re.findall(directive_pattern, text)
        
        if not directives:
            return 1.0
        
        valid_count = sum(1 for d in directives if d in common_directives)
        return valid_count / len(directives) if directives else 1.0
    
    def _check_forbidden_characters(self, text: str) -> float:
        """Check for forbidden or unusual characters."""
        # Allow LilyPond syntax characters
        allowed_chars = set('abcdefg\\\'"{}()[]<>|,.-_=+*/\\s\\n\\t0-9')
        forbidden_count = sum(1 for char in text if char not in allowed_chars)
        
        return 1.0 - min(1.0, forbidden_count / max(1, len(text)))
    
    def _extract_notes(self, text: str) -> List[str]:
        """Extract note names from text."""
        note_pattern = r'([a-g](?:is|es)?)'
        return re.findall(note_pattern, text)
    
    def _extract_durations(self, text: str) -> List[str]:
        """Extract duration values from text."""
        duration_pattern = r'(\d+\.?)'
        return re.findall(duration_pattern, text)
    
    def _extract_measures(self, text: str) -> List[str]:
        """Extract measures from text."""
        # Simple heuristic: split by bar lines
        measures = re.split(r"\|", text)
        return [m.strip() for m in measures if m.strip()]
    
    def _extract_phrases(self, text: str) -> List[str]:
        """Extract musical phrases from text."""
        # Simple heuristic: split by phrase marks or long rests
        phrases = re.split(r'\\break|r[248]', text)
        return [p.strip() for p in phrases if p.strip()]
    
    def _extract_musical_elements(self, text: str) -> Dict[str, str]:
        """Extract musical elements like key, time signature, etc."""
        elements = {}
        
        # Key signature
        key_match = re.search(r'\\key\s+([a-g](?:is|es)?)\s+\\(major|minor)', text)
        if key_match:
            elements["key"] = f"{key_match.group(1)} {key_match.group(2)}"
        
        # Time signature
        time_match = re.search(r'\\time\s+(\d+/\d+)', text)
        if time_match:
            elements["time"] = time_match.group(1)
        
        # Clef
        clef_match = re.search(r'\\clef\s+([a-zA-Z]+)', text)
        if clef_match:
            elements["clef"] = clef_match.group(1)
        
        return elements
    
    def _calculate_distribution_similarity(
        self,
        notes1: List[str],
        notes2: List[str]
    ) -> float:
        """Calculate similarity between two note distributions."""
        counter1 = Counter(notes1)
        counter2 = Counter(notes2)
        
        all_notes = set(counter1.keys()) | set(counter2.keys())
        
        if not all_notes:
            return 1.0
        
        # Calculate cosine similarity
        vec1 = np.array([counter1.get(note, 0) for note in all_notes])
        vec2 = np.array([counter2.get(note, 0) for note in all_notes])
        
        norm1 = np.linalg.norm(vec1)
        norm2 = np.linalg.norm(vec2)
        
        if norm1 == 0 or norm2 == 0:
            return 0.0
        
        return np.dot(vec1, vec2) / (norm1 * norm2)
    
    def _evaluate_note_distribution_properties(self, notes: List[str]) -> float:
        """Evaluate note distribution properties."""
        if not notes:
            return 0.0
        
        note_counts = Counter(notes)
        
        # Check for reasonable distribution (not too concentrated)
        max_freq = max(note_counts.values())
        total_notes = len(notes)
        concentration = max_freq / total_notes
        
        # Penalize extreme concentration
        if concentration > 0.7:
            return 0.3
        elif concentration > 0.5:
            return 0.6
        else:
            return 1.0
    
    def _analyze_rhythmic_patterns(self, durations: List[str]) -> float:
        """Analyze rhythmic patterns."""
        if len(durations) < 4:
            return 0.5
        
        # Look for common rhythmic patterns
        pattern_score = 0.0
        
        # Check for repeated patterns
        for length in [2, 3, 4]:
            if len(durations) >= length * 2:
                patterns = [tuple(durations[i:i+length]) 
                           for i in range(len(durations) - length + 1)]
                pattern_counts = Counter(patterns)
                if max(pattern_counts.values()) > 1:
                    pattern_score += 0.3
        
        return min(1.0, pattern_score)
    
    def _analyze_rhythmic_consistency(self, durations: List[str]) -> float:
        """Analyze rhythmic consistency."""
        if not durations:
            return 0.0
        
        # Check for reasonable variety (not too monotonous)
        unique_durations = len(set(durations))
        total_durations = len(durations)
        
        variety_ratio = unique_durations / total_durations
        
        # Optimal variety is between 0.3 and 0.7
        if 0.3 <= variety_ratio <= 0.7:
            return 1.0
        elif variety_ratio < 0.1 or variety_ratio > 0.9:
            return 0.3
        else:
            return 0.7
    
    def _analyze_measure_structure(self, measures: List[str]) -> float:
        """Analyze measure structure."""
        if not measures:
            return 0.0
        
        # Check for reasonable measure lengths
        measure_lengths = [len(m.split()) for m in measures]
        
        if not measure_lengths:
            return 0.0
        
        avg_length = np.mean(measure_lengths)
        std_length = np.std(measure_lengths)
        
        # Reasonable measures should have 3-8 elements on average
        if 3 <= avg_length <= 8 and std_length < avg_length:
            return 1.0
        elif 1 <= avg_length <= 12:
            return 0.7
        else:
            return 0.3
    
    def _analyze_phrase_structure(self, phrases: List[str]) -> float:
        """Analyze phrase structure."""
        if len(phrases) < 2:
            return 0.5
        
        # Check for reasonable phrase lengths
        phrase_lengths = [len(p.split()) for p in phrases]
        avg_length = np.mean(phrase_lengths)
        
        # Good phrases typically have 8-32 elements
        if 8 <= avg_length <= 32:
            return 1.0
        elif 4 <= avg_length <= 50:
            return 0.7
        else:
            return 0.4
    
    def _analyze_musical_consistency(self, text: str) -> float:
        """Analyze consistency of musical elements."""
        # Check for multiple conflicting key signatures
        key_matches = re.findall(r'\\key\s+([a-g](?:is|es)?)\s+\\(major|minor)', text)
        time_matches = re.findall(r'\\time\s+(\d+/\d+)', text)
        
        key_consistency = 1.0 if len(set(key_matches)) <= 1 else 0.5
        time_consistency = 1.0 if len(set(time_matches)) <= 2 else 0.5
        
        return (key_consistency + time_consistency) / 2
    
    def _calculate_element_similarity(self, elem1: str, elem2: str) -> float:
        """Calculate similarity between musical elements."""
        if elem1 == elem2:
            return 1.0
        
        # Simple string similarity
        common_chars = set(elem1) & set(elem2)
        total_chars = set(elem1) | set(elem2)
        
        return len(common_chars) / len(total_chars) if total_chars else 0.0
    
    def _lilypond_to_music21(self, text: str):
        """Convert LilyPond text to music21 stream (simplified)."""
        # This is a very basic conversion - in practice, you'd need
        # a more sophisticated parser
        try:
            stream = music21.stream.Stream()
            # Basic note parsing
            notes = self._extract_notes(text)
            durations = self._extract_durations(text)
            
            for i, note_name in enumerate(notes[:min(len(notes), len(durations))]):
                duration = durations[i] if i < len(durations) else '4'
                quarter_length = 4.0 / float(duration) if duration.isdigit() else 1.0
                note = music21.note.Note(note_name, quarterLength=quarter_length)
                stream.append(note)
            
            return stream
        except Exception:
            return None
    
    def _analyze_chord_progressions(self, stream) -> float:
        """Analyze chord progressions in a music21 stream."""
        # Simplified harmonic analysis
        try:
            key = stream.analyze('key')
            if key:
                return 0.8  # Basic score if key analysis succeeds
            return 0.5
        except Exception:
            return 0.5
    
    def _analyze_voice_leading(self, stream) -> float:
        """Analyze voice leading quality."""
        # Simplified voice leading analysis
        notes = stream.notes
        if len(notes) < 2:
            return 0.5
        
        # Check for reasonable interval sizes
        intervals = []
        for i in range(len(notes) - 1):
            try:
                interval = music21.interval.Interval(notes[i], notes[i + 1])
                intervals.append(abs(interval.semitones))
            except Exception:
                continue
        
        if not intervals:
            return 0.5
        
        # Prefer smaller intervals (good voice leading)
        avg_interval = np.mean(intervals)
        if avg_interval <= 4:  # Within a major third
            return 1.0
        elif avg_interval <= 7:  # Within a perfect fifth
            return 0.8
        else:
            return 0.6
    
    def _update_accumulated_scores(self, scores: Dict[str, float]):
        """Update accumulated scores."""
        for metric, value in scores.items():
            if metric != "overall_score":
                metric_key = metric + "s"  # Convert to plural form
                if metric_key in self.scores:
                    self.scores[metric_key].append(value)