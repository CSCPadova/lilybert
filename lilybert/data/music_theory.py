"""Music theory normalization helpers shared across data modules."""

from __future__ import annotations

import re
from typing import Dict, Optional

CANONICAL_KEY_ROOTS = [
    "do",
    "dod",
    "re",
    "mib",
    "mi",
    "fa",
    "fad",
    "sol",
    "lab",
    "la",
    "sib",
    "si",
]

_SEMITONE_TO_CANONICAL = {idx: key for idx, key in enumerate(CANONICAL_KEY_ROOTS)}

_DIRECT_ALIAS_TO_SEMITONE: Dict[str, int] = {
    "do": 0,
    "c": 0,
    "dod": 1,
    "cis": 1,
    "cs": 1,
    "c#": 1,
    "db": 1,
    "des": 1,
    "re": 2,
    "d": 2,
    "mib": 3,
    "eb": 3,
    "ees": 3,
    "es": 3,
    "dis": 3,
    "d#": 3,
    "mi": 4,
    "e": 4,
    "fb": 4,
    "fa": 5,
    "f": 5,
    "e#": 5,
    "fad": 6,
    "fis": 6,
    "f#": 6,
    "gb": 6,
    "ges": 6,
    "sol": 7,
    "g": 7,
    "lab": 8,
    "ab": 8,
    "aes": 8,
    "gis": 8,
    "g#": 8,
    "la": 9,
    "a": 9,
    "sib": 10,
    "bb": 10,
    "bes": 10,
    "ais": 10,
    "a#": 10,
    "si": 11,
    "b": 11,
    "h": 11,
    "cb": 11,
}

_ITALIAN_BASE_TO_SEMITONE = {
    "do": 0,
    "re": 2,
    "mi": 4,
    "fa": 5,
    "sol": 7,
    "la": 9,
    "si": 11,
}

_ENGLISH_BASE_TO_SEMITONE = {
    "c": 0,
    "d": 2,
    "e": 4,
    "f": 5,
    "g": 7,
    "a": 9,
    "b": 11,
    "h": 11,
}


def _clean_key_text(value: str) -> str:
    text = value.strip().lower()
    text = text.replace("_", "").replace("-", "").replace(" ", "")
    return text


def _normalize_italian_key(root: str) -> Optional[int]:
    match = re.fullmatch(
        r"(do|re|mi|fa|sol|la|si)(d|b|diesis|bemolle|doppiodiesis|doppiobemolle)?",
        root,
    )
    if not match:
        return None

    base = _ITALIAN_BASE_TO_SEMITONE[match.group(1)]
    suffix = match.group(2)
    if suffix in {None, ""}:
        alter = 0
    elif suffix in {"d", "diesis"}:
        alter = 1
    elif suffix in {"b", "bemolle"}:
        alter = -1
    elif suffix == "doppiodiesis":
        alter = 2
    else:
        alter = -2

    return (base + alter) % 12


def _normalize_english_key(root: str) -> Optional[int]:
    match = re.fullmatch(r"([a-h])(is|es|isis|eses)?", root)
    if not match:
        return None

    base = _ENGLISH_BASE_TO_SEMITONE[match.group(1)]
    suffix = match.group(2)
    if suffix in {None, ""}:
        alter = 0
    elif suffix == "is":
        alter = 1
    elif suffix == "es":
        alter = -1
    elif suffix == "isis":
        alter = 2
    else:
        alter = -2

    return (base + alter) % 12


def canonicalize_key_root(value: object) -> str:
    """Canonicalize multilingual key roots to lilyBERT 12-tone labels."""
    text = _clean_key_text(str(value))
    if not text:
        return "do"

    semitone = _DIRECT_ALIAS_TO_SEMITONE.get(text)
    if semitone is None:
        semitone = _normalize_italian_key(text)
    if semitone is None:
        semitone = _normalize_english_key(text)
    if semitone is None:
        return text

    return _SEMITONE_TO_CANONICAL[semitone]
