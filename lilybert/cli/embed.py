"""Batch embedding export for LilyPond files (non-Hydra CLI)."""

from __future__ import annotations

import json
from pathlib import Path
from typing import List, Optional

import numpy as np
import torch
import typer
from transformers import PreTrainedTokenizerFast
from typing_extensions import Annotated

from lilybert.data.preprocessor import LilyPondPreprocessor
from lilybert.models import LilyBERTEncoder


def _movement_windows(
    token_ids: List[int],
    *,
    max_length: int,
    stride: int,
    cls_id: int,
    sep_id: int,
    pad_id: int,
) -> tuple[torch.Tensor, torch.Tensor]:
    body_size = max_length - 2
    step = max(1, body_size - stride)

    if len(token_ids) <= body_size:
        windows = [token_ids]
    else:
        windows = []
        for start in range(0, len(token_ids) - body_size + 1, step):
            windows.append(token_ids[start : start + body_size])
        if windows and windows[-1] != token_ids[-body_size:]:
            windows.append(token_ids[-body_size:])

    ids_rows: list[list[int]] = []
    mask_rows: list[list[int]] = []
    for window in windows:
        ids = [cls_id] + window + [sep_id]
        attn = [1] * len(ids)
        pad_len = max_length - len(ids)
        if pad_len > 0:
            ids = ids + [pad_id] * pad_len
            attn = attn + [0] * pad_len
        ids_rows.append(ids)
        mask_rows.append(attn)

    return (
        torch.tensor(ids_rows, dtype=torch.long),
        torch.tensor(mask_rows, dtype=torch.long),
    )


def main(
    input_dir: Annotated[str, typer.Option(help="Folder containing .ly files")],
    model_name: Annotated[
        str, typer.Option(help="Hugging Face model ID or local path")
    ],
    output_path: Annotated[str, typer.Option(help="Output .npz path for embeddings")],
    tokenizer_path: Annotated[
        Optional[str],
        typer.Option(help="Optional tokenizer path; defaults to model_name"),
    ] = None,
    max_length: Annotated[int, typer.Option(help="Window max length")] = 2048,
    stride: Annotated[int, typer.Option(help="Window stride")] = 256,
    batch_size: Annotated[int, typer.Option(help="Embedding batch size")] = 32,
    strip: Annotated[
        Optional[List[str]],
        typer.Option(
            help="Sections to strip, repeatable: --strip header --strip comments"
        ),
    ] = None,
    recursive: Annotated[
        bool, typer.Option(help="Recursively search for .ly files")
    ] = False,
    device: Annotated[str, typer.Option(help="Device: cpu, cuda, ...")] = "cpu",
) -> None:
    input_path = Path(input_dir)
    if not input_path.exists():
        raise FileNotFoundError(f"Input directory not found: {input_path}")

    glob_pattern = "**/*.ly" if recursive else "*.ly"
    files = sorted(input_path.glob(glob_pattern))
    if not files:
        raise FileNotFoundError(f"No .ly files found in {input_path}")

    tokenizer_ref = tokenizer_path or model_name
    tokenizer = PreTrainedTokenizerFast.from_pretrained(tokenizer_ref)

    encoder = LilyBERTEncoder.from_pretrained(model_name)
    device_obj = torch.device(device)
    encoder.to(device_obj)
    encoder.eval()
    for parameter in encoder.parameters():
        parameter.requires_grad = False

    preprocessor = LilyPondPreprocessor(strip_sections=strip)

    cls_id = tokenizer.cls_token_id
    sep_id = tokenizer.sep_token_id
    pad_id = tokenizer.pad_token_id or 0

    embeddings: list[np.ndarray] = []
    movement_ids: list[str] = []
    source_files: list[str] = []
    languages: list[str] = []

    with torch.no_grad():
        for file_path in files:
            raw_text = file_path.read_text(encoding="utf-8", errors="ignore")
            movements = preprocessor.process_content(raw_text, file_path.name, {})
            if not movements:
                continue

            for movement in movements:
                movement_text = str(
                    movement.get("italiano_text") or movement.get("text") or ""
                ).strip()
                if not movement_text:
                    continue

                token_ids = tokenizer.encode(movement_text, add_special_tokens=False)
                if not token_ids:
                    continue

                ids_tensor, mask_tensor = _movement_windows(
                    token_ids,
                    max_length=max_length,
                    stride=stride,
                    cls_id=cls_id,
                    sep_id=sep_id,
                    pad_id=pad_id,
                )

                chunks: list[torch.Tensor] = []
                for start in range(0, ids_tensor.shape[0], batch_size):
                    end = start + batch_size
                    pooled = encoder.encode(
                        input_ids=ids_tensor[start:end].to(device_obj),
                        attention_mask=mask_tensor[start:end].to(device_obj),
                    )
                    chunks.append(pooled.detach().cpu())

                movement_embedding = torch.cat(chunks, dim=0).mean(dim=0).numpy()
                embeddings.append(movement_embedding)
                movement_ids.append(str(movement.get("movement_id", file_path.stem)))
                source_files.append(file_path.name)
                languages.append(str(movement.get("language", "unknown")))

    if not embeddings:
        raise RuntimeError("No embeddings produced from input files")

    output = Path(output_path)
    output.parent.mkdir(parents=True, exist_ok=True)
    np.savez(
        output,
        embeddings=np.stack(embeddings, axis=0),
        movement_ids=np.asarray(movement_ids, dtype=object),
        source_files=np.asarray(source_files, dtype=object),
        languages=np.asarray(languages, dtype=object),
    )

    metadata_path = output.with_suffix(".json")
    metadata_path.write_text(
        json.dumps(
            {
                "input_dir": str(input_path),
                "recursive": recursive,
                "model_name": model_name,
                "tokenizer_path": tokenizer_ref,
                "max_length": max_length,
                "stride": stride,
                "batch_size": batch_size,
                "strip": strip or [],
                "num_embeddings": len(embeddings),
                "embedding_dim": int(embeddings[0].shape[0]),
                "output": str(output),
            },
            indent=2,
            ensure_ascii=False,
        ),
        encoding="utf-8",
    )

    print(
        json.dumps(
            {
                "output": str(output),
                "metadata": str(metadata_path),
                "num_embeddings": len(embeddings),
                "embedding_dim": int(embeddings[0].shape[0]),
            },
            indent=2,
            ensure_ascii=False,
        )
    )


def run() -> None:
    typer.run(main)


if __name__ == "__main__":
    run()
