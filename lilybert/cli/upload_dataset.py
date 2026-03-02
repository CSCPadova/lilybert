"""Upload processed dataset artifacts to HuggingFace Hub."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Dict, Iterable, Optional

import typer
from typing_extensions import Annotated

from datasets import Dataset, DatasetDict


class DatasetUploader:
    """Build and publish lilyBERT datasets to HuggingFace Hub."""

    def __init__(
        self, repo_id: str, private: bool = False, token: Optional[str] = None
    ):
        self.repo_id = repo_id
        self.private = private
        self.token = token

    def build_dataset_dict(
        self,
        processed_dir: str | Path,
        languages: Iterable[str] = ("english", "italiano"),
    ) -> DatasetDict:
        processed_path = Path(processed_dir)
        metadata_path = processed_path / "metadata.json"
        metadata: Dict[str, Dict] = {}
        if metadata_path.exists():
            metadata = json.loads(metadata_path.read_text(encoding="utf-8"))

        dataset_splits: Dict[str, Dataset] = {}

        for language in languages:
            lang_dir = processed_path / language
            if not lang_dir.exists():
                continue

            rows = []
            for ly_file in sorted(lang_dir.glob("*.ly")):
                movement_id = ly_file.stem
                movement_meta = metadata.get(movement_id, {})
                rows.append(
                    {
                        "movement_id": movement_id,
                        "language": language,
                        "text": ly_file.read_text(encoding="utf-8", errors="ignore"),
                        "base_work": movement_meta.get("base_work"),
                        "labels": json.dumps(
                            movement_meta.get("labels", {}), ensure_ascii=False
                        ),
                    }
                )

            if rows:
                dataset_splits[language] = Dataset.from_list(rows)

        if not dataset_splits:
            raise ValueError(f"No movement files found in: {processed_path}")

        return DatasetDict(dataset_splits)

    def push_dataset_dict(self, dataset_dict: DatasetDict):
        return dataset_dict.push_to_hub(
            repo_id=self.repo_id,
            private=self.private,
            token=self.token,
        )

    def upload(
        self,
        processed_dir: str | Path,
        languages: Iterable[str] = ("english", "italiano"),
    ):
        dataset_dict = self.build_dataset_dict(
            processed_dir=processed_dir, languages=languages
        )
        return self.push_dataset_dict(dataset_dict)


def main(
    repo_id: Annotated[str, typer.Option(help="HuggingFace dataset repo id")],
    processed_dir: Annotated[
        str, typer.Option(help="Processed data root")
    ] = "data/processed",
    private: Annotated[bool, typer.Option(help="Create/use private repo")] = False,
    token: Annotated[Optional[str], typer.Option(help="HF token (optional)")] = None,
) -> None:
    uploader = DatasetUploader(
        repo_id=repo_id, private=private, token=token
    )
    result = uploader.upload(processed_dir=processed_dir)
    print(json.dumps(result, indent=2, ensure_ascii=False, default=str))
