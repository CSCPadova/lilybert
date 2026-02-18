"""Tests for dataset access API."""

from pathlib import Path

from lilybert.data import LilyPondDataAPI


def test_data_api_raw_and_processed_access(tmp_path: Path):
    data_root = tmp_path / "data"
    raw_dir = data_root / "raw"
    processed_it = data_root / "processed" / "italiano"
    processed_en = data_root / "processed" / "english"
    processed_meta = data_root / "processed" / "metadata.json"

    raw_dir.mkdir(parents=True)
    processed_it.mkdir(parents=True)
    processed_en.mkdir(parents=True)

    (raw_dir / "sample.ly").write_text("\\relative do' { do4 re4 }", encoding="utf-8")
    (processed_it / "sample_mvt1.ly").write_text(
        "\\relative do' { do4 re4 }", encoding="utf-8"
    )
    (processed_en / "sample_mvt1.ly").write_text(
        "\\relative c' { c4 d4 }", encoding="utf-8"
    )
    processed_meta.write_text(
        '{"sample_mvt1": {"base_work": "sample", "movement_index": 1}}',
        encoding="utf-8",
    )

    api = LilyPondDataAPI(data_root=data_root)

    raw_files = api.list_raw_files()
    assert len(raw_files) == 1
    assert raw_files[0].name == "sample.ly"
    assert "\\relative" in api.load_raw_file("sample.ly")

    movements = api.list_movements(language="italiano")
    assert len(movements) == 1

    record = api.load_movement("sample_mvt1", language="english")
    assert record.movement_id == "sample_mvt1"
    assert "c4 d4" in record.text
    assert record.metadata["base_work"] == "sample"


def test_data_api_augmentations(tmp_path: Path):
    data_root = tmp_path / "data"
    processed_it = data_root / "processed" / "italiano"
    processed_it.mkdir(parents=True)
    (processed_it / "x_mvt1.ly").write_text("do4 re4", encoding="utf-8")

    api = LilyPondDataAPI(data_root=data_root)

    def aug_a(text: str) -> str:
        return text.replace("do", "XX")

    def aug_b(text: str) -> str:
        return text + " END"

    out = list(api.iter_augmented_movements(augmentations=[aug_a, aug_b]))
    assert len(out) == 1
    assert "XX4 re4 END" in out[0].text
