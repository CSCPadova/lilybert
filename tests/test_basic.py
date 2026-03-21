"""Basic tests for lilyBERT functionality."""

import json
import tempfile
from pathlib import Path

import pytest

from lilybert.data import LilyPondParser, LilyPondPreprocessor, LilyPondTokenizer


class TestLilyPondParser:
    """Test LilyPond parser utility functions."""

    def test_validate_syntax_valid(self):
        """Test syntax validation with valid content."""
        parser = LilyPondParser()
        content = r"""{ c4 d e f g a b c }"""

        is_valid, errors = parser.validate_syntax(content)
        assert is_valid is True
        assert len(errors) == 0

    def test_validate_syntax_invalid_unmatched_brace(self):
        """Test syntax validation with unmatched braces."""
        parser = LilyPondParser()
        content = r"""{ c4 d e f"""  # Missing closing brace

        is_valid, errors = parser.validate_syntax(content)
        assert is_valid is False
        assert len(errors) > 0
        assert any(
            "unclosed" in err.lower() or "brace" in err.lower() for err in errors
        )

    def test_validate_syntax_invalid_extra_brace(self):
        """Test syntax validation with unmatched closing brace."""
        parser = LilyPondParser()
        content = r"""} { c4 d e f }"""  # Extra closing brace before valid block

        is_valid, errors = parser.validate_syntax(content)
        assert is_valid is False
        assert len(errors) > 0

    def test_normalize_duration(self):
        """Test duration normalization."""
        parser = LilyPondParser()

        # Whole note
        assert parser.normalize_duration("1") == 1.0

        # Half note
        assert parser.normalize_duration("2") == 0.5

        # Quarter note
        assert parser.normalize_duration("4") == 0.25

        # Eighth note
        assert parser.normalize_duration("8") == 0.125

        # Dotted quarter (4.)
        dotted_quarter = parser.normalize_duration("4.")
        assert dotted_quarter is not None
        assert abs(dotted_quarter - 0.375) < 0.001  # 1/4 + 1/8

        # Dotted eighth (8.)
        dotted_eighth = parser.normalize_duration("8.")
        assert dotted_eighth is not None
        assert abs(dotted_eighth - 0.1875) < 0.001  # 1/8 + 1/16

    def test_detect_pitch_language_english(self):
        """Test pitch language detection with English notation."""
        parser = LilyPondParser()
        content = r"""{ c4 d e f g a b c }"""

        language = parser.detect_pitch_language(content)
        assert language == "english"

    def test_detect_pitch_language_italian(self):
        """Test pitch language detection with Italian notation."""
        parser = LilyPondParser()
        content = r"""{ do4 re mi fa sol la si do }"""

        language = parser.detect_pitch_language(content)
        assert language == "italiano"

    def test_detect_pitch_language_explicit(self):
        """Test pitch language detection with explicit language directive."""
        parser = LilyPondParser()
        content = r"""\language "italiano" { do4 re mi fa }"""

        language = parser.detect_pitch_language(content)
        assert language == "italiano"

    def test_normalize_pitch_english_to_english(self):
        """Test pitch normalization keeping English notation."""
        parser = LilyPondParser()

        assert parser.normalize_pitch("c", "english") == "c"
        assert parser.normalize_pitch("cis", "english") == "cis"
        assert parser.normalize_pitch("des", "english") == "des"
        assert parser.normalize_pitch("a", "english") == "a"

    def test_normalize_pitch_english_to_italian(self):
        """Test pitch normalization from English to Italian."""
        parser = LilyPondParser()

        assert parser.normalize_pitch("c", "italiano") == "do"
        assert parser.normalize_pitch("cis", "italiano") == "dod"
        assert parser.normalize_pitch("des", "italiano") == "reb"
        assert parser.normalize_pitch("d", "italiano") == "re"
        assert parser.normalize_pitch("e", "italiano") == "mi"
        assert parser.normalize_pitch("f", "italiano") == "fa"
        assert parser.normalize_pitch("g", "italiano") == "sol"
        assert parser.normalize_pitch("a", "italiano") == "la"
        assert parser.normalize_pitch("b", "italiano") == "si"

    def test_normalize_pitch_italian_to_english(self):
        """Test pitch normalization from Italian to English."""
        parser = LilyPondParser()

        assert parser.normalize_pitch("do", "english") == "c"
        assert parser.normalize_pitch("dod", "english") == "cis"
        assert parser.normalize_pitch("reb", "english") == "des"
        assert parser.normalize_pitch("re", "english") == "d"
        assert parser.normalize_pitch("mi", "english") == "e"
        assert parser.normalize_pitch("fa", "english") == "f"
        assert parser.normalize_pitch("sol", "english") == "g"
        assert parser.normalize_pitch("la", "english") == "a"
        assert parser.normalize_pitch("si", "english") == "b"

    def test_normalize_pitch_italian_long_accidentals(self):
        """Test pitch normalization with long Italian accidentals."""
        parser = LilyPondParser()

        # Long form to short form
        assert parser.normalize_pitch("dodiesis", "italiano") == "dod"
        assert parser.normalize_pitch("rebemolle", "italiano") == "reb"

        # Long form to English
        assert parser.normalize_pitch("dodiesis", "english") == "cis"
        assert parser.normalize_pitch("rebemolle", "english") == "des"

    def test_convert_pitch_language_english_to_italian(self):
        """Test converting content from English to Italian pitches."""
        parser = LilyPondParser()
        content = r"""{ c4 d e f g a b c }"""

        converted = parser.convert_pitch_language(content, "italiano")
        assert "do" in converted
        assert "re" in converted
        assert "mi" in converted
        assert "fa" in converted
        assert "sol" in converted
        assert "la" in converted
        assert "si" in converted

    def test_convert_pitch_language_italian_to_english(self):
        """Test converting content from Italian to English pitches."""
        parser = LilyPondParser()
        content = r"""{ do4 re mi fa sol la si do }"""

        converted = parser.convert_pitch_language(content, "english")
        assert "c" in converted
        assert "d" in converted
        assert "e" in converted
        assert "f" in converted
        assert "g" in converted
        assert "a" in converted
        assert "b" in converted


class TestLilyPondPreprocessor:
    """Test LilyPond preprocessor functionality."""

    def test_preprocess_to_dataset_copies_files(self):
        """Test that preprocess_to_dataset copies .ly files to output dir."""
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            raw_dir = root / "raw"
            out_dir = root / "processed"
            raw_dir.mkdir(parents=True, exist_ok=True)

            content = r"""\version "2.24.0"
\relative c' { \time 4/4 \key c \major c4 d e f }"""
            (raw_dir / "test.ly").write_text(content, encoding="utf-8")

            preprocessor = LilyPondPreprocessor()
            result = preprocessor.preprocess_to_dataset(
                input_dir=str(raw_dir),
                output_dir=str(out_dir),
            )

            assert result["files_processed"] == 1
            assert result["files_written"] >= 1
            assert (out_dir / "test.ly").exists()
            assert (out_dir / "metadata.json").exists()

            # The output file should contain the original content
            output_text = (out_dir / "test.ly").read_text(encoding="utf-8")
            assert "\\relative c'" in output_text
            assert "c4 d e f" in output_text

    def test_preprocess_to_dataset_with_augmentation(self):
        """Test that augmentation produces additional variants."""
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            raw_dir = root / "raw"
            out_dir = root / "processed"
            raw_dir.mkdir(parents=True, exist_ok=True)

            content = r"""\version "2.24.0"
\relative c' { c4 d e f | g2 a2 | b4 c d e | c1 }"""
            (raw_dir / "test.ly").write_text(content, encoding="utf-8")

            preprocessor = LilyPondPreprocessor()
            result = preprocessor.preprocess_to_dataset(
                input_dir=str(raw_dir),
                output_dir=str(out_dir),
                augmentation_config={
                    "enable_retrograde": True,
                    "include_original": True,
                },
            )

            # Should have base + retrograde variant
            assert result["files_written"] >= 2
            assert (out_dir / "test.ly").exists()

            # Check that at least one augmented variant exists
            augmented_files = list(out_dir.glob("test__*.ly"))
            assert len(augmented_files) >= 1


class TestIntegration:
    """Integration tests."""

    def test_preprocessing_pipeline(self):
        """Test complete preprocessing pipeline."""
        test_content = r"""\version "2.24.0"
\relative do' {
    \time 4/4 \key do \major
    do re mi | sid4.
}"""

        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            raw_dir = root / "raw"
            out_dir = root / "processed"
            raw_dir.mkdir(parents=True, exist_ok=True)

            (raw_dir / "test.ly").write_text(test_content, encoding="utf-8")

            preprocessor = LilyPondPreprocessor()
            result = preprocessor.preprocess_to_dataset(
                input_dir=str(raw_dir),
                output_dir=str(out_dir),
            )

            assert result["files_processed"] == 1
            assert (out_dir / "test.ly").exists()
            assert (out_dir / "metadata.json").exists()

    def test_preprocess_to_dataset_writes_metadata(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            raw_dir = root / "raw"
            out_dir = root / "processed"
            raw_dir.mkdir(parents=True, exist_ok=True)

            file_name = "sample.ly"
            content = r"""\version "2.24.0"
\relative c' { c4 d e f }"""
            (raw_dir / file_name).write_text(content, encoding="utf-8")

            preprocessor = LilyPondPreprocessor()
            preprocessor.preprocess_to_dataset(
                input_dir=str(raw_dir),
                output_dir=str(out_dir),
            )

            metadata = json.loads(
                (out_dir / "metadata.json").read_text(encoding="utf-8")
            )
            assert "sample" in metadata
            assert metadata["sample"]["source_file"] == "sample.ly"

    def test_tokenizer_builds_corpus_from_data_dir(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)

            (root / "mvt1.ly").write_text("c4 d e f", encoding="utf-8")

            tokenizer = LilyPondTokenizer()

            corpus = tokenizer.build_corpus(root)
            assert len(corpus) == 1

    def test_tokenizer_preserves_simultaneous_structure_markers(self):
        tokenizer = LilyPondTokenizer()
        text = r"""
        \score {
            <<
                { c4 d e f }
                \\
                { g4 a b c }
            >>
        }
        """

        token_line = tokenizer._movement_to_parser_tokens(text)
        assert "[PART_BEGIN]" in token_line
        assert "[PART_END]" in token_line


if __name__ == "__main__":
    pytest.main([__file__, "-s"])
