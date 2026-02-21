"""Tests for HuggingFace Hub integration utilities."""

from __future__ import annotations

import json
from pathlib import Path

from lilybert.cli.upload_dataset import DatasetUploader
from lilybert.cli.upload_model import ModelUploader


class _DummyPushDatasetDict:
    def __init__(self):
        self.pushed = None

    def push_to_hub(self, repo_id: str, private: bool = False, token=None):
        self.pushed = {"repo_id": repo_id, "private": private, "token": token}
        return {"url": f"https://huggingface.co/datasets/{repo_id}"}


class _DummyModel:
    def save_pretrained(self, path):
        path = Path(path)
        path.mkdir(parents=True, exist_ok=True)
        (path / "pytorch_model.bin").write_bytes(b"dummy")


class _DummyTokenizer:
    def save_pretrained(self, path):
        path = Path(path)
        path.mkdir(parents=True, exist_ok=True)
        (path / "tokenizer.json").write_text("{}", encoding="utf-8")


def _create_processed_layout(tmp_path: Path) -> Path:
    processed = tmp_path / "processed"
    english = processed / "english"
    italian = processed / "italiano"
    english.mkdir(parents=True, exist_ok=True)
    italian.mkdir(parents=True, exist_ok=True)

    (english / "work_a_mvt1.ly").write_text("c d e f", encoding="utf-8")
    (italian / "work_a_mvt1.ly").write_text("do re mi fa", encoding="utf-8")

    metadata = {
        "work_a_mvt1": {
            "base_work": "work_a",
            "labels": {"composer": "Vivaldi"},
        }
    }
    (processed / "metadata.json").write_text(json.dumps(metadata), encoding="utf-8")
    return processed


def test_dataset_uploader_builds_dataset_dict(tmp_path: Path):
    processed = _create_processed_layout(tmp_path)
    uploader = DatasetUploader(repo_id="org/test-dataset")

    dataset_dict = uploader.build_dataset_dict(processed_dir=processed)

    assert "english" in dataset_dict
    assert "italiano" in dataset_dict
    assert len(dataset_dict["english"]) == 1
    sample = dataset_dict["english"][0]
    assert sample["movement_id"] == "work_a_mvt1"
    assert sample["base_work"] == "work_a"


def test_dataset_uploader_push_calls_hub():
    uploader = DatasetUploader(repo_id="org/test-dataset", private=True, token="abc")
    dummy = _DummyPushDatasetDict()

    result = uploader.push_dataset_dict(dummy)

    assert dummy.pushed["repo_id"] == "org/test-dataset"
    assert dummy.pushed["private"] is True
    assert result["url"].endswith("org/test-dataset")


def test_model_uploader_saves_and_uploads_folder(tmp_path: Path, monkeypatch):
    captured = {}

    class _DummyApi:
        def create_repo(
            self, repo_id: str, repo_type: str, private: bool, exist_ok: bool
        ):
            captured["create_repo"] = {
                "repo_id": repo_id,
                "repo_type": repo_type,
                "private": private,
                "exist_ok": exist_ok,
            }

        def upload_folder(self, repo_id: str, repo_type: str, folder_path: str):
            captured["upload_folder"] = {
                "repo_id": repo_id,
                "repo_type": repo_type,
                "folder_path": folder_path,
            }
            return {"commit_url": f"https://huggingface.co/{repo_id}/commit/123"}

    monkeypatch.setattr("lilybert.cli.upload_model.HfApi", lambda token=None: _DummyApi())

    uploader = ModelUploader(repo_id="org/test-model", private=False, token="abc")
    result = uploader.upload(
        model=_DummyModel(),
        tokenizer=_DummyTokenizer(),
        config={"task": "composer"},
        output_dir=tmp_path / "hf_model",
    )

    saved = tmp_path / "hf_model"
    assert (saved / "pytorch_model.bin").exists()
    assert (saved / "tokenizer.json").exists()
    assert (saved / "config.json").exists()
    assert captured["create_repo"]["repo_type"] == "model"
    assert captured["upload_folder"]["repo_id"] == "org/test-model"
    assert "commit_url" in result
