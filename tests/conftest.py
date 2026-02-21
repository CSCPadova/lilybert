"""Test configuration initialization."""

import pytest


def pytest_configure(config):
    """Configure pytest with custom markers."""
    config.addinivalue_line(
        "markers", "slow: marks tests as slow (deselect with '-m \"not slow\"')"
    )
    config.addinivalue_line("markers", "integration: marks tests as integration tests")
    config.addinivalue_line("markers", "model: marks tests that require model loading")


@pytest.fixture(scope="session")
def sample_lilypond_content():
    """Provide sample LilyPond content for testing."""
    return """\\version "2.24.0"
\\header {
  title = "Test Piece"
  composer = "Test Composer"
}

\\relative c' {
  \\time 4/4
  \\key c \\major
  \\clef treble

  c4 d e f |
  g2 g |
  a4 a a a |
  g1 |
}"""


@pytest.fixture(scope="session")
def sample_preprocessed_data():
    """Provide sample preprocessed data for testing."""
    return [
        {
            "text": '\\version "2.24.0" \\relative c\' { \\time 4/4 \\key c \\major c4 d e f }',
            "raw_text": '\\version "2.24.0" \\relative c\' { \\time 4/4 \\key c \\major c4 d e f }',
            "metadata": {"title": "Test Piece", "composer": "Test Composer"},
            "statistics": {"note_count": 4, "total_elements": 10},
            "file_path": "test.ly",
        },
        {
            "text": '\\version "2.24.0" \\relative c\' { \\time 3/4 \\key g \\major g4 a b }',
            "raw_text": '\\version "2.24.0" \\relative c\' { \\time 3/4 \\key g \\major g4 a b }',
            "metadata": {"title": "Test Waltz", "composer": "Test Composer"},
            "statistics": {"note_count": 3, "total_elements": 8},
            "file_path": "test_waltz.ly",
        },
    ]
