"""Upload model artifacts to HuggingFace Hub."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any, Dict, Optional, Sequence

from huggingface_hub import HfApi
from transformers import AutoModel, AutoTokenizer


class ModelUploader:
    """Save and publish model artifacts to HuggingFace Hub."""

    def __init__(self, repo_id: str, private: bool = False, token: Optional[str] = None):
        self.repo_id = repo_id
        self.private = private
        self.token = token
        self.api = HfApi(token=token)

    def upload(
        self,
        model: Any,
        tokenizer: Any,
        config: Optional[Dict[str, Any]] = None,
        output_dir: str | Path = "artifacts/hub_model",
    ):
        output_path = Path(output_dir)
        output_path.mkdir(parents=True, exist_ok=True)

        model.save_pretrained(output_path)
        tokenizer.save_pretrained(output_path)

        if config is not None:
            config_path = output_path / "config.json"
            config_path.write_text(json.dumps(config, indent=2), encoding="utf-8")

        self.api.create_repo(
            repo_id=self.repo_id,
            repo_type="model",
            private=self.private,
            exist_ok=True,
        )

        return self.api.upload_folder(
            repo_id=self.repo_id,
            repo_type="model",
            folder_path=str(output_path),
        )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Upload model artifacts to HuggingFace Hub")
    parser.add_argument("--model-dir", required=True, help="Local model directory")
    parser.add_argument("--tokenizer-dir", required=True, help="Local tokenizer directory")
    parser.add_argument("--repo-id", required=True, help="HuggingFace model repo id")
    parser.add_argument("--private", action="store_true", help="Create/use private repo")
    parser.add_argument("--token", default=None, help="HF token (optional)")
    parser.add_argument("--output-dir", default="artifacts/hub_model", help="Temp output dir")
    return parser


def main(argv: Sequence[str] | None = None) -> None:
    args = build_parser().parse_args(argv)
    model = AutoModel.from_pretrained(args.model_dir)
    tokenizer = AutoTokenizer.from_pretrained(args.tokenizer_dir)

    uploader = ModelUploader(repo_id=args.repo_id, private=args.private, token=args.token)
    result = uploader.upload(
        model=model,
        tokenizer=tokenizer,
        config={"source_model_dir": str(Path(args.model_dir))},
        output_dir=args.output_dir,
    )
    print(json.dumps(result, indent=2, ensure_ascii=False, default=str))


if __name__ == "__main__":
    main()
