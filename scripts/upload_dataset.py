"""Upload processed dataset artifacts to HuggingFace Hub."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Dict, Iterable, Optional, Sequence

from datasets import Dataset, DatasetDict


class DatasetUploader:
    """Build and publish lilyBERT datasets to HuggingFace Hub."""

    def __init__(self, repo_id: str, private: bool = False, token: Optional[str] = None):
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
                        "labels": json.dumps(movement_meta.get("labels", {}), ensure_ascii=False),
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
        dataset_dict = self.build_dataset_dict(processed_dir=processed_dir, languages=languages)
        return self.push_dataset_dict(dataset_dict)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Upload processed dataset to HuggingFace Hub")
    parser.add_argument("--processed-dir", default="data/processed", help="Processed data root")
    parser.add_argument("--repo-id", required=True, help="HuggingFace dataset repo id")
    parser.add_argument("--private", action="store_true", help="Create/use private repo")
    parser.add_argument("--token", default=None, help="HF token (optional)")
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    uploader = DatasetUploader(repo_id=args.repo_id, private=args.private, token=args.token)
    result = uploader.upload(processed_dir=args.processed_dir)
    print(json.dumps(result, indent=2, ensure_ascii=False, default=str))


if __name__ == "__main__":
    main()
