"""Upload model artifacts to HuggingFace Hub."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, Optional

import typer
from typing_extensions import Annotated

from huggingface_hub import HfApi
from transformers import AutoModel, AutoTokenizer


class ModelUploader:
    """Save and publish model artifacts to HuggingFace Hub."""

    def __init__(
        self, repo_id: str, private: bool = False, token: Optional[str] = None
    ):
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


def main(
    model_dir: Annotated[str, typer.Option(help="Local model directory")],
    tokenizer_dir: Annotated[str, typer.Option(help="Local tokenizer directory")],
    repo_id: Annotated[str, typer.Option(help="HuggingFace model repo id")],
    private: Annotated[bool, typer.Option(help="Create/use private repo")] = False,
    token: Annotated[Optional[str], typer.Option(help="HF token (optional)")] = None,
    output_dir: Annotated[
        str, typer.Option(help="Temp output dir")
    ] = "artifacts/hub_model",
) -> None:
    model = AutoModel.from_pretrained(model_dir)
    tokenizer = AutoTokenizer.from_pretrained(tokenizer_dir)

    uploader = ModelUploader(
        repo_id=repo_id, private=private, token=token
    )
    result = uploader.upload(
        model=model,
        tokenizer=tokenizer,
        config={"source_model_dir": str(Path(model_dir))},
        output_dir=output_dir,
    )
    print(json.dumps(result, indent=2, ensure_ascii=False, default=str))
