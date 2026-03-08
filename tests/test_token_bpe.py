"""Unit tests for token-level BPE."""

import json

import pytest

from lilybert.data.token_bpe import BPE_SEPARATOR, TokenBPE, _apply_single_merge


class TestApplySingleMerge:
    def test_basic_merge(self):
        seq = ["A", "B", "C", "A", "B"]
        result = _apply_single_merge(seq, ("A", "B"), "A+B")
        assert result == ["A+B", "C", "A+B"]

    def test_no_match(self):
        seq = ["A", "C", "B"]
        result = _apply_single_merge(seq, ("A", "B"), "A+B")
        assert result == ["A", "C", "B"]

    def test_adjacent_pairs(self):
        seq = ["A", "B", "A", "B"]
        result = _apply_single_merge(seq, ("A", "B"), "A+B")
        assert result == ["A+B", "A+B"]


class TestTokenBPELearn:
    def test_basic(self):
        sequences = [["NOTE_C", "DUR_4", "NOTE_D", "DUR_4"]] * 5
        bpe = TokenBPE()
        bpe.learn(sequences, num_merges=2)
        assert len(bpe.merges) > 0
        # Most frequent pair should be first merge
        assert bpe.merges[0] == ("NOTE_C", "DUR_4") or bpe.merges[0] == (
            "NOTE_D",
            "DUR_4",
        )

    def test_min_frequency(self):
        sequences = [
            ["NOTE_C", "DUR_4", "NOTE_D", "DUR_8"],
            ["NOTE_C", "DUR_4", "NOTE_E", "DUR_4"],
        ]
        bpe = TokenBPE()
        bpe.learn(sequences, num_merges=10, min_frequency=3)
        # No pair appears 3+ times, so no merges
        assert len(bpe.merges) == 0

    def test_max_vocab(self):
        sequences = [["A", "B", "C", "D", "A", "B", "C", "D"]] * 10
        bpe = TokenBPE()
        bpe.learn(sequences, num_merges=100, max_vocab=6, base_vocab_size=4)
        # Should stop at 2 merges (4 base + 2 = 6)
        assert len(bpe.merges) <= 2

    def test_num_merges_respected(self):
        sequences = [["A", "B", "C", "D"]] * 10
        bpe = TokenBPE()
        bpe.learn(sequences, num_merges=1)
        assert len(bpe.merges) == 1


class TestTokenBPEApply:
    def test_apply_merges(self):
        bpe = TokenBPE()
        bpe.merges = [("NOTE_C", "DUR_4")]
        result = bpe.apply(["NOTE_C", "DUR_4", "NOTE_D", "DUR_8"])
        assert result == ["NOTE_C+DUR_4", "NOTE_D", "DUR_8"]

    def test_apply_chained_merges(self):
        bpe = TokenBPE()
        bpe.merges = [("A", "B"), ("A+B", "C")]
        result = bpe.apply(["A", "B", "C"])
        assert result == ["A+B+C"]

    def test_apply_empty(self):
        bpe = TokenBPE()
        assert bpe.apply(["A", "B"]) == ["A", "B"]


class TestTokenBPESaveLoad:
    def test_round_trip(self, tmp_path):
        bpe = TokenBPE()
        bpe.merges = [("NOTE_C", "DUR_4"), ("NOTE_D", "DUR_8")]
        path = tmp_path / "bpe.json"
        bpe.save(path)

        loaded = TokenBPE.load(path)
        assert loaded.merges == bpe.merges

    def test_json_format(self, tmp_path):
        bpe = TokenBPE()
        bpe.merges = [("A", "B")]
        path = tmp_path / "bpe.json"
        bpe.save(path)

        data = json.loads(path.read_text())
        assert data == {"merges": [["A", "B"]]}


class TestSeparator:
    def test_separator_value(self):
        assert BPE_SEPARATOR == "+"

    def test_merged_tokens_use_separator(self):
        bpe = TokenBPE()
        bpe.merges = [("NOTE_C", "DUR_4")]
        result = bpe.apply(["NOTE_C", "DUR_4"])
        assert result == [f"NOTE_C{BPE_SEPARATOR}DUR_4"]
