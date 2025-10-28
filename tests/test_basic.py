"""Basic tests for MaestroGPT functionality."""
import sys
import pytest
import tempfile
import json
from pathlib import Path

from maestrogpt.data import LilyPondParser, LilyPondPreprocessor
from maestrogpt.models import LoRAConfig
from maestrogpt.training import TrainingConfig
from maestrogpt.evaluation import MusicMetrics


class TestLilyPondParser:
    """Test LilyPond parser functionality."""
    
    def test_parse_simple_content(self):
        """Test parsing simple LilyPond content."""
        parser = LilyPondParser()
        content = """
        \\version "2.24.0" 
        \\header {
            title = \\markup\\smaller\\center-column {"Concerto Sacro V Op. II"}
            composer = \\markup \\center-column{"A. Scarlatti (1660 - 1725)"}
        }
        \\relative c' { 
            \\clef bass
            \\time 4/4 \\key c \\major
            c4 d e f | g2 a2 | b4 c d e | c1 r a b2\\rest
            {"non musical content"}
            <f c' e g>1 r
        }
        """
        
        elements = parser.parse_content(content)
        assert len(elements) > 0
        
        # Check for notes
        notes = [e for e in elements if e.type == "note"]
        AllElements = [(e.content + " " + e.type) for e in elements] # String list of raw content for evrey musical element
        print(AllElements)
        # Check statistics
        stats = parser.get_statistics()
        assert stats["total_elements"] > 0
        assert stats["note_count"] > 0
        assert stats["note_count"] == 17 # Specific to this example
        assert stats["rest_count"] == 3
        assert stats["chord_count"] == 1
        known_durations = ['4', '2', '1']
        assert all(d in stats["durations"] for d in known_durations)

    def test_piece_dataset_content(self):
        content = """
        VIvcn = \\relative do {

            sol'4 r8 sol sol sol
            sol4 re8 si' si si
            si4 sol8 re' re re

            %4
            re4 si8 si4 sol8
            re4 r8 re' dod re
            la4 r8 do! si do

            %7
            sol4 r8 sol sol sol
            sol4 re8 si' si si
            si4 sol8 re' re re

            %10
            re4 si8 si4 sol8
            re4 r8 re' dod re
            la4 r8 do! si do\\mbreak

            %13
            sol4 r8 re' dod re
            re4 si8 re dod re
            re dod re sol fad mi

            %16
            mi4 re8 re dod re
            re4 si8 re dod re
            re dod re sol fad mi

            %19
            mi4 re8 sol fad mi
            mi4 re8 sol fad mi
            sol fad mi sol fad mi\\mbreak\\mbreak

            %22
            re2.\\fermata
            sol,8 fad sol si la sold
            la sold la la sold la

            %25
            la sold la do si la
            sol! fad sol sol fad sol
            sol fad sol si la sold

            %28
            la sold la la sold la
            la sold la do si la
            sol? fad sol sol fad sol

            %31
            sol fad sol si la sold\\mbreak
            la sold la la sold la
            la sold la do si la

            %34
            sol? re' si sol re' si
            sol mi' do sol mi' do
            sol re' si sol re' si

            %37
            sol mi' do sol mi' do
            sol sol sol sol sol sol
            red red red red red red

            %40
            mi mi mi mi mi mi
            la, la la la la la\\mbreak
            fad4 r8 r4 r8

            %43
            fad4 r8 r4 r8
            sol4 r8 re'' dod re
            re4 si8 re dod re

            %46
            re dod re sol fad mi
            mi4 re8 re dod re
            re4(si8) re dod re

            %49
            re dod re sol fad mi
            mi4 re8 sol fad mi\\mbreak
            mi4 re8 sol fad mi

            %52
            sol fad mi sol fad mi
            re2.\\fermata
            sol,8 fad sol si la sold

            %55
            la sold la la sold la
            la sold la do si la
            sol! fad sol sol fad sol

            %58
            sol fad sol si la sold
            la sold la la sold la\\mbreak
            la sold la do si la

            %61
            sol! fad sol sol fad sol
            sol fad sol si la sold
            la sold la la sold la

            %64
            la sold la  do si la
            sol sol sol do, do do
            re re re do do do

            %67
            sol' sol sol do, do do
            re re re do do do\\mbreak
            sol'4 r8 re' dod re

            %70
            re dod re sol fad mi
            mi4 re8 sol fad mi
            sol fad mi sol fad mi

            %73
            re4 r8 do, 4.
            re4 r8 re4 r8
            sol4 r8 sol4 r8\\mbreak

            %76
            sol,2.\\fermata

        }
        forma = {
            \\time 6/8
            \\key sol\\major
            \\tempo 2. = 60
            s2.*76
            \\bar"|."

        }
        global = {
            \\override Score.MetronomeMark.transparent = ##t
            \\override Score.BarNumber.font-size = #0.5
            \\override Score.BarNumber.padding = #1.3
            \\override TupletBracket.bracket-visibility = ##f
            \\terzinequarto \\con
        }
        VIvc = {
            \\global
            \\clef bass
            <<\\VIvcn \\forma>>
        }
        """
        parser = LilyPondParser()
        elements = parser.parse_content(content)
        AllElements = [(e.content + " " + e.type) for e in elements] # String list of raw content for evrey musical element
        print(AllElements)
        # Check statistics
        stats = parser.get_statistics()
        assert stats["total_elements"] > 0

    def test_parse_empty_content(self):
        """Test parsing empty content."""
        parser = LilyPondParser()
        elements = parser.parse_content("")
        assert len(elements) == 0
    
    def test_parse_with_chords(self):
        """Test parsing content with chords."""
        parser = LilyPondParser()
        content = """\\relative do'' { <c e g>4 <d f a>2 }"""
        
        elements = parser.parse_content(content)
        chords = [e for e in elements if e.type == "chord"]
        assert len(chords) >= 1
        assert len(chords) == 2 # Specific to this example


class TestLilyPondPreprocessor:
    """Test LilyPond preprocessor functionality."""
    
    def test_preprocess_text(self):
        """Test text preprocessing."""
        preprocessor = LilyPondPreprocessor()
        text = "  \\version   \"2.24.0\"    { c4  d  e  f }  "
        
        processed = preprocessor._preprocess_text(text)
        assert len(processed) > 0
        assert "  " not in processed  # Multiple spaces should be normalized
    
    def test_normalize_notation(self):
        """Test notation normalization."""
        preprocessor = LilyPondPreprocessor(normalize_notation=True)
        text = "\\relative c' { \\time 4/4 \\key c \\major \\clef basso c4 d e f }"
        
        normalized = preprocessor._normalize_notation(text)
        print(f"Normalized text after normalization is {normalized}")
        sys.stdout.write(f"Normalized is {normalized}")
        assert "\\relative c'" in normalized
    
    def test_add_structural_tokens(self):
        """Test adding structural tokens."""
        """There are time signature, key signature, tempo, and measure separator tokens"""
        preprocessor = LilyPondPreprocessor(add_special_tokens=True)
        text = " \\relative c' { \\time 4/4 \\key c \\major \\tempo 4 = 60 \\clef basso c4 d e f }"
        

        with_tokens = preprocessor._add_structural_tokens(text)
        print(f"Structural tokens added to text is: {with_tokens}")

        assert "<TIME:" in with_tokens
        assert "<KEY:" in with_tokens
        assert "<TEMPO:" in with_tokens
        # Not only are the structural tokens added, but they contain the correct data. Also we can assume white spaces are removed. Happens in preprocessing step
        assert "<KEY:c_major>" in with_tokens
        assert "<TIME:4/4>" in with_tokens
        assert "<TEMPO:4 = 60>" in with_tokens
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
            "statistics": statistics
        }
        print(out)
        assert(out)
        # Even though our processed text is the text used for creating training data, our statistics would be wrong cause of the lp element parser being wrong


class TestLoRAConfig:
    """Test LoRA configuration."""
    
    def test_default_config(self):
        """Test default LoRA configuration."""
        config = LoRAConfig()
        assert config.r == 16
        assert config.lora_alpha == 32
        assert config.target_modules is not None
        assert len(config.target_modules) > 0
    
    def test_for_music_generation(self):
        """Test music generation presets."""
        small_config = LoRAConfig.for_music_generation("small")
        assert small_config.r == 8
        
        large_config = LoRAConfig.for_music_generation("large")
        assert large_config.r == 32
    
    def test_to_peft_config(self):
        """Test conversion to PEFT config."""
        config = LoRAConfig()
        peft_config = config.to_peft_config()
        
        assert peft_config.r == config.r
        assert peft_config.lora_alpha == config.lora_alpha


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


class TestMusicMetrics:
    """Test music evaluation metrics."""
    
    def test_syntax_score(self):
        """Test syntax score calculation."""
        metrics = MusicMetrics()
        
        # Valid syntax should score high
        valid_score = metrics.calculate_syntax_score(
            "\\version \"2.24.0\" { c4 d e f | g2 a2 }"
        )
        assert valid_score > 0.5
        
        # Invalid syntax should score low
        invalid_score = metrics.calculate_syntax_score(
            "\\version \"2.24.0\" { c4 d e f | g2 a2"  # Missing closing brace
        )
        assert invalid_score < valid_score
    
    def test_note_distribution_score(self):
        """Test note distribution scoring."""
        metrics = MusicMetrics()
        # Used to test how similar the generated text was to the reference text.
        score = metrics.calculate_note_distribution_score(
            "c4 d e f g a b c",
            reference_text="c4 d e f g a b c"
        )
        assert score >= 0.0
        assert score <= 1.0
    
    def test_rhythm_consistency_score(self):
        """Test rhythm consistency scoring."""
        metrics = MusicMetrics()
        
        # Consistent rhythm should score higher
        consistent_score = metrics.calculate_rhythm_consistency_score(
            "c4 d4 e4 f4 g4 a4 b4 c4"
        )
        
        # Inconsistent rhythm should score lower
        inconsistent_score = metrics.calculate_rhythm_consistency_score(
            "c1 d16 e2 f32 g8 a4 b1 c16"
        )
        
        assert consistent_score >= 0.0
        assert inconsistent_score >= 0.0
        assert consistent_score >= inconsistent_score
    
    def test_evaluate_generation(self):
        """Test complete generation evaluation."""
        metrics = MusicMetrics()
        
        generated_text = "\\version \"2.24.0\" { c4 d e f | g2 a2 | b4 c d e | c1 }"
        scores = metrics.evaluate_generation(generated_text)
        
        assert "syntax_score" in scores
        assert "overall_score" in scores
        assert all(0 <= score <= 1 for score in scores.values())
    
    def test_accumulated_scores(self):
        """Test accumulated score tracking."""
        metrics = MusicMetrics()
        
        # Evaluate multiple pieces
        texts = [
            "{ c4 d e f }",
            "{ g4 a b c }",
            "{ d4 e f g }",
        ]
        
        for text in texts:
            metrics.evaluate_generation(text)
        
        accumulated = metrics.get_accumulated_scores()
        assert len(accumulated) > 0 
        assert "syntax_mean" in accumulated


class TestIntegration:
    """Integration tests."""
    
    def test_preprocessing_pipeline(self):
        """Test complete preprocessing pipeline."""
        # Create temporary test data
        test_content = '''\\version "2.24.0"
        \\relative c' {
            \\time 4/4 \\key c \\major
            c4 d e f | g2 a2 | b4 c d e | c1
        }'''
        
        with tempfile.TemporaryDirectory() as temp_dir:
            # Write test file
            test_file = Path(temp_dir) / "test.ly"
            with open(test_file, 'w') as f:
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