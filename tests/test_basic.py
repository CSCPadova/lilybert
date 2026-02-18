"""Basic tests for lilyBERT functionality."""

import json
import os
import sys
import tempfile
from pathlib import Path

import numpy as np
import pytest

from lilybert.data import LilyPondParser, LilyPondPreprocessor
from lilybert.evaluation import ClassificationMetrics
from lilybert.training import TrainingConfig


class TestLilyPondParser:
    """Test LilyPond parser functionality."""

    def test_parse_simple_content(self):
        """Test parsing simple LilyPond content."""
        parser = LilyPondParser()
        content = r"""
        \version "2.24.0" 
        \header {
            title = \markup\smaller\center-column {"Concerto Sacro V Op. II"}
            composer = \markup \center-column{"A. Scarlatti (1660 - 1725)"}
        }
        \relative do {
        \repeat unfold 9 {<mi la,>16}
        }
       
        """

        elements = parser.parse_content(content)
        assert len(elements) > 0

        notes = [e for e in elements if e.type == "note"]
        assert len(notes) >= 0
        # Check statistics
        stats = parser.get_statistics()
        print(stats["note_count"])
        assert stats["total_elements"] > 0
        assert stats["note_count"] > 0
        assert stats["note_count"] == 18  # Specific to this example
        assert stats["rest_count"] == 0
        assert stats["chord_count"] >= 0

    def test_parse_empty_content(self):
        """Test parsing empty content."""
        parser = LilyPondParser()
        elements = parser.parse_content("")
        assert len(elements) == 0

    def test_parse_with_chords(self):
        """Test parsing content with chords."""
        parser = LilyPondParser()
        content = """\\relative do' { <c e g>4 <d f a>2 }"""

        elements = parser.parse_content(content)
        chords = [e for e in elements if e.type == "chord"]
        assert len(chords) == 2


class TestLilyPondPreprocessor:
    """Test LilyPond preprocessor functionality."""

    def test_preprocess_text(self):
        """Test text preprocessing."""
        preprocessor = LilyPondPreprocessor()
        text = '  \\version   "2.24.0"    { c4  d  e  f }  '

        processed = preprocessor._preprocess_text(text)
        assert len(processed) > 0
        assert processed.endswith("\n")
        assert "\\version" in processed

    def test_normalize_notation(self):
        """Test notation normalization."""
        preprocessor = LilyPondPreprocessor(normalize_notation=True)
        text = "\\relative c' { \\time 4/4 \\key c \\major \\clef basso c4 d e f }"

        normalized = preprocessor._normalize_notation(text)
        print(f"Normalized text after normalization is {normalized}")
        sys.stdout.write(f"Normalized is {normalized}")
        assert "\\relative c'" in normalized

    def test_add_structural_tokens_1(self):
        """Test preprocessing keeps musical directives unchanged."""
        preprocessor = LilyPondPreprocessor(add_special_tokens=True)
        text = ' \\relative do\' { \\time 4/4 \\key do \\major \\tempo 4 = 60 \\tempo "Presto" \\clef basso do4 re mi fa \\repeat unfold 60 {la} re}'

        with_tokens = preprocessor._preprocess_text(text)
        print(
            f"Structural Token Test 1: Structural tokens added to text is: {with_tokens}"
        )

        assert "\\time 4/4" in with_tokens
        assert "\\key do \\major" in with_tokens
        assert "\\tempo 4 = 60" in with_tokens
        assert '\\tempo "Presto"' in with_tokens
        assert "\\clef basso" in with_tokens
        assert "\\repeat unfold 60" in with_tokens

    def test_add_structural_tokens_2(self):
        """Test preprocessing preserves directives (variant syntax)."""
        preprocessor = LilyPondPreprocessor(add_special_tokens=True)
        text = ' \\relative do\' { \\time 2/68 \\key mi\\major \\tempo "Largo" 4= 60 \\clef   baritonevarF do4 re mi fa \\repeat unfold 10 {do re mi}}'

        with_tokens = preprocessor._preprocess_text(text)
        print(
            f"Structural Token Test 2: Structural tokens added to text is: {with_tokens}"
        )

        assert "\\time 2/68" in with_tokens
        assert "\\key mi\\major" in with_tokens
        assert '\\tempo "Largo" 4= 60' in with_tokens
        assert "\\repeat unfold 10" in with_tokens
        assert "\\clef   baritonevarF" in with_tokens

    def test_add_structural_tokens_3(self):
        """Test preprocessing keeps barlines and mixed spacing."""
        preprocessor = LilyPondPreprocessor(add_special_tokens=True)
        text = " \\relative do' { \\time2/68 \\key mib'\\major \\tempo \"Presto\" 2 =  \t80 \\clef   baritonevarF do4 re mi fa | \\repeat unfold10 {do re   mi}}"

        with_tokens = preprocessor._preprocess_text(text)
        print(
            f"Structural Token Test 3: Structural tokens added to text is: {with_tokens}"
        )

        assert "\\time2/68" in with_tokens
        assert "\\key mib'\\major" in with_tokens
        assert '\\tempo "Presto"' in with_tokens
        assert "\\clef   baritonevarF" in with_tokens
        assert "\\repeat unfold10" in with_tokens
        assert "|" in with_tokens

    def test_preprocess_file(self):
        """Test LilyPond Parser & Preprocessor to see how they interact"""
        parser = LilyPondParser()
        preprocessor = LilyPondPreprocessor(add_special_tokens=True)

        sample = """\\version "2.24.0" 
        \\header {
            title = \\markup\\smaller\\center-column {"Concerto Sacro V Op. II"}
            composer = \\markup \\center-column{"A. Scarlatti (1660 - 1725)"}
        }
        \\relative c' { 
            \\time 4/4 \\key c \\major \\tempo "Presto" 4.=100
            c4 d e f | g2 a2 | b4 c d e | c1\\rest r 
        }"""
        elements = parser.parse_content(sample)
        # Convert to text sequence
        raw_text = parser.to_sequence(include_metadata=True)
        # Apply preprocessing steps
        processed_text = preprocessor._preprocess_text(raw_text)
        # Tokenize if tokenizer is available
        tokenized = None
        if preprocessor.tokenizer:
            tokenized = preprocessor._tokenize_text(processed_text)
        # Get statistics
        statistics = parser.get_statistics()
        out = {
            "text": processed_text,
            "raw_text": raw_text,
            "tokenized": tokenized,
            "metadata": parser.metadata,
            "statistics": statistics,
        }
        assert out


class TestTrainingConfig:
    """Test training configuration."""

    def test_default_config(self):
        """Test default training configuration."""
        config = TrainingConfig()
        assert config.learning_rate > 0
        assert config.num_train_epochs > 0
        assert config.use_lora is True

    def test_quick_test_config(self):
        """Test quick test configuration."""
        config = TrainingConfig.for_quick_test()
        assert config.num_train_epochs == 1
        assert config.per_device_train_batch_size == 2

    def test_production_config(self):
        """Test production configuration."""
        config = TrainingConfig.for_production()
        assert config.num_train_epochs == 5
        assert config.per_device_train_batch_size == 8

    def test_config_validation(self):
        """Test configuration validation."""
        # Valid config should not raise
        config = TrainingConfig(learning_rate=1e-4)
        config._validate_config()

        # Invalid config should raise
        with pytest.raises(ValueError):
            invalid_config = TrainingConfig(learning_rate=-1)
            invalid_config._validate_config()

    def test_save_load_config(self):
        """Test saving and loading configuration."""
        config = TrainingConfig.for_quick_test()

        with tempfile.TemporaryDirectory() as temp_dir:
            config.save_pretrained(temp_dir)

            # Check that config file was created
            config_file = Path(temp_dir) / "training_config.json"
            assert config_file.exists()

            # Load and verify
            loaded_config = TrainingConfig.from_pretrained(str(config_file))
            assert loaded_config.num_train_epochs == config.num_train_epochs


class TestClassificationMetrics:
    """Test classification evaluation metrics."""

    def test_single_label_metrics(self):
        metrics = ClassificationMetrics()
        y_true = np.array([0, 1, 1, 0])
        y_pred = np.array([0, 1, 0, 0])
        scores = metrics.compute_single_label(y_true=y_true, y_pred=y_pred)
        assert "accuracy" in scores
        assert "f1_macro" in scores
        assert 0.0 <= scores["accuracy"] <= 1.0

    def test_multi_label_metrics(self):
        metrics = ClassificationMetrics()
        y_true = np.array([[1, 0, 1], [0, 1, 0]])
        y_pred = np.array([[1, 0, 0], [0, 1, 0]])
        scores = metrics.compute_multi_label(y_true=y_true, y_pred=y_pred)
        assert "f1_micro" in scores
        assert "hamming_loss" in scores
        assert 0.0 <= scores["subset_accuracy"] <= 1.0


class TestIntegration:
    """Integration tests."""

    def test_preprocessing_pipeline(self):
        """Test complete preprocessing pipeline."""
        # Create temporary test data
        test_content = """\\version "2.24.0"
        \\relative do' {
            \\time 4/4 \\key do \\major
            do re mi | sid4. 
        }"""

        with tempfile.TemporaryDirectory() as temp_dir:
            # Write test file
            test_file = Path(temp_dir) / "test.ly"
            with open(test_file, "w") as f:
                f.write(test_content)

            # Process the file
            preprocessor = LilyPondPreprocessor()
            result = preprocessor.preprocess_file(str(test_file))

            assert "text" in result
            assert "metadata" in result
            assert "statistics" in result
            assert len(result["text"]) > 0

    def test_config_serialization(self):
        """Test configuration serialization roundtrip."""
        original_config = TrainingConfig.for_quick_test()

        with tempfile.TemporaryDirectory() as temp_dir:
            # Save config
            original_config.save_pretrained(temp_dir)

            # Load config
            config_file = Path(temp_dir) / "training_config.json"
            loaded_config = TrainingConfig.from_pretrained(str(config_file))

            # Verify key properties are preserved
            assert loaded_config.learning_rate == original_config.learning_rate
            assert loaded_config.num_train_epochs == original_config.num_train_epochs
            assert loaded_config.use_lora == original_config.use_lora


if __name__ == "__main__":
    pytest.main([__file__, "-s"])
