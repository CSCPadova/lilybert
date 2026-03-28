"""Tests for `python -m lilybert` CLI entry point."""

from __future__ import annotations


def test_main_prints_available_commands(capsys):
    from lilybert import __main__ as main_mod

    try:
        main_mod.main()
    except SystemExit:
        pass
    captured = capsys.readouterr()
    assert "preprocess" in captured.out
    assert "train" in captured.out
    assert "embed" in captured.out
