"""Tests for simplified ly-* CLI module surface."""

from __future__ import annotations

def test_legacy_main_points_to_ly_entrypoints():
    from lilybert import __main__ as main_mod

    try:
        main_mod.main()
    except SystemExit as exc:
        message = str(exc)
        assert "ly-preprocess" in message
        assert "ly-train" in message
