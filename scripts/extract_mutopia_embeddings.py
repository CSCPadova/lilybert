#!/usr/bin/env python3
"""Extract layer-wise BERT embeddings for the Mutopia dataset.

For each entry in dataset_mutopia.json, tokenizes the raw .ly file,
splits into non-overlapping 512-token chunks, extracts [CLS] embeddings
at specified layers per chunk, and averages them into a single
file-level embedding. Saves per-entry .npy files and updates the JSON
with embedding paths.
"""

from __future__ import annotations

import json
import logging
import sys
import time
from pathlib import Path
from typing import Dict, List, Optional

import numpy as np
import torch
import typer
from transformers import AutoTokenizer
from typing_extensions import Annotated

# Add project root to path
PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from lilybert.models import LilyBERTEncoder

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s: %(message)s",
    datefmt="%H:%M:%S",
    stream=sys.stdout,
)
logger = logging.getLogger(__name__)


def make_chunks(
    token_ids: List[int],
    body_size: int,
    cls_id: int,
    sep_id: int,
    pad_id: int,
    max_length: int,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Split token_ids into non-overlapping chunks of body_size tokens.

    Each chunk is wrapped with [CLS] ... [SEP] and padded to max_length.
    Returns (input_ids, attention_mask) tensors of shape (n_chunks, max_length).
    """
    chunks = [
        token_ids[i : i + body_size]
        for i in range(0, len(token_ids), body_size)
    ]

    ids_rows: list[list[int]] = []
    mask_rows: list[list[int]] = []
    for chunk in chunks:
        ids = [cls_id] + chunk + [sep_id]
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


def extract_layer_embeddings(
    encoder: LilyBERTEncoder,
    ids_tensor: torch.Tensor,
    mask_tensor: torch.Tensor,
    layers: List[int],
    batch_size: int,
    device: torch.device,
) -> Dict[int, np.ndarray]:
    """Mean-pool token embeddings at specified layers, averaged across chunks."""
    layer_sums: Dict[int, torch.Tensor] = {}
    total_tokens = 0

    for start in range(0, ids_tensor.shape[0], batch_size):
        batch_ids = ids_tensor[start : start + batch_size].to(device)
        batch_mask = mask_tensor[start : start + batch_size].to(device)

        outputs = encoder.model(
            input_ids=batch_ids,
            attention_mask=batch_mask,
            return_dict=True,
            output_hidden_states=True,
        )

        # mask: (batch, seq_len) -> (batch, seq_len, 1) for broadcasting
        mask_expanded = batch_mask.unsqueeze(-1).float()
        n_tokens = batch_mask.sum().item()
        total_tokens += n_tokens

        for layer in layers:
            hidden = outputs.hidden_states[layer].detach().cpu()
            # sum over all real tokens across batch and sequence dims
            masked = (hidden * mask_expanded.cpu()).sum(dim=(0, 1))
            if layer not in layer_sums:
                layer_sums[layer] = masked
            else:
                layer_sums[layer] += masked

        del outputs, batch_ids, batch_mask
        torch.cuda.empty_cache()

    result = {}
    for layer in layers:
        result[layer] = (layer_sums[layer] / total_tokens).numpy()
    return result


def main(
    model: Annotated[str, typer.Option(help="HuggingFace model ID or local checkpoint path")],
    tokenizer_path: Annotated[
        Optional[str],
        typer.Option("--tokenizer", help="Tokenizer path; defaults to --model"),
    ] = None,
    dataset_json: Annotated[
        str, typer.Option(help="Path to dataset_mutopia.json")
    ] = "data/mutopia/dataset_mutopia.json",
    output_dir: Annotated[
        str, typer.Option(help="Base output directory for embeddings")
    ] = "data/mutopia/embeddings",
    layers: Annotated[
        Optional[List[int]],
        typer.Option(help="Layers to extract (repeatable: --layers 3 --layers 6)"),
    ] = None,
    max_length: Annotated[int, typer.Option(help="Max sequence length (including special tokens)")] = 512,
    batch_size: Annotated[int, typer.Option(help="Chunks per forward pass")] = 8,
    device: Annotated[str, typer.Option(help="Device: cpu, cuda, ...")] = "cpu",
    max_entries: Annotated[
        Optional[int],
        typer.Option(help="Max entries to process (for testing)"),
    ] = None,
    save_every: Annotated[
        int,
        typer.Option(help="Save JSON checkpoint every N entries"),
    ] = 100,
    resume: Annotated[
        bool,
        typer.Option(help="Skip entries that already have embeddings"),
    ] = False,
) -> None:
    if layers is None:
        layers = [3, 6, 9, 12]

    # Force flush stdout for SLURM
    sys.stdout.reconfigure(line_buffering=True)

    dataset_path = Path(dataset_json)
    output_base = Path(output_dir)
    mutopia_root = dataset_path.parent  # data/mutopia/

    # Create output directories
    for layer in layers:
        (output_base / f"layer_{layer}").mkdir(parents=True, exist_ok=True)

    # Load dataset
    with open(dataset_path) as f:
        dataset = json.load(f)

    total_entries = len(dataset)
    if max_entries:
        dataset = dataset[:max_entries]

    logger.info(f"Dataset: {len(dataset)} entries (total in file: {total_entries})")

    # Load model and tokenizer
    tokenizer_ref = tokenizer_path or model
    tokenizer = AutoTokenizer.from_pretrained(tokenizer_ref)
    tokenizer.model_max_length = int(1e30)  # we chunk manually
    cls_id = tokenizer.cls_token_id
    sep_id = tokenizer.sep_token_id
    pad_id = tokenizer.pad_token_id or 0
    body_size = max_length - 2  # room for [CLS] and [SEP]

    encoder = LilyBERTEncoder.from_pretrained(model)
    device_obj = torch.device(device)
    encoder.to(device_obj)
    encoder.eval()
    for p in encoder.parameters():
        p.requires_grad = False

    logger.info(f"Model loaded on {device}. Layers: {layers}. Max length: {max_length}")

    stats = {"total": len(dataset), "success": 0, "empty": 0, "errors": 0, "skipped": 0}
    t_start = time.time()

    with torch.no_grad():
        for idx, entry in enumerate(dataset):
            t_file = time.time()

            # Resume support: skip entries that already have embeddings
            if resume and entry.get("embeddings") is not None:
                stats["skipped"] += 1
                continue

            local_path = entry.get("localPath")
            if not local_path:
                entry["embeddings"] = None
                stats["errors"] += 1
                logger.warning(f"[{idx}] No localPath")
                continue

            file_path = mutopia_root / local_path
            if not file_path.exists():
                logger.warning(f"[{idx}] File not found: {file_path}")
                entry["embeddings"] = None
                stats["errors"] += 1
                continue

            raw_text = file_path.read_text(encoding="utf-8", errors="ignore").strip()

            if not raw_text:
                logger.warning(f"[{idx}] Empty file: {local_path}")
                entry["embeddings"] = None
                stats["empty"] += 1
                continue

            try:
                token_ids = tokenizer.encode(raw_text, add_special_tokens=False)
                if not token_ids:
                    logger.warning(f"[{idx}] No tokens from {local_path}")
                    entry["embeddings"] = None
                    stats["empty"] += 1
                    continue

                ids_tensor, mask_tensor = make_chunks(
                    token_ids, body_size, cls_id, sep_id, pad_id, max_length
                )
                n_chunks = ids_tensor.shape[0]

                layer_embeddings = extract_layer_embeddings(
                    encoder, ids_tensor, mask_tensor, layers, batch_size, device_obj
                )

                embeddings_map: Dict[str, str] = {}
                for layer, emb in layer_embeddings.items():
                    filename = f"{idx}.npy"
                    save_path = output_base / f"layer_{layer}" / filename
                    np.save(save_path, emb)
                    rel_path = str(save_path.relative_to(mutopia_root))
                    embeddings_map[f"layer_{layer}"] = rel_path

                entry["embeddings"] = embeddings_map
                stats["success"] += 1

                elapsed = time.time() - t_file
                rate = (stats["success"] + stats["errors"] + stats["empty"]) / (time.time() - t_start)
                logger.info(
                    f"[{idx+1}/{len(dataset)}] {local_path} | "
                    f"{len(token_ids)} tok | {n_chunks} chunks | "
                    f"{elapsed:.1f}s | rate={rate:.1f}/s"
                )
            except Exception:
                logger.exception(f"[{idx}] Failed on {local_path}")
                entry["embeddings"] = None
                stats["errors"] += 1

            # Periodic checkpoint
            if (idx + 1) % save_every == 0:
                with open(dataset_path, "w") as f:
                    json.dump(dataset, f, indent=2, ensure_ascii=False)
                logger.info(f"  Checkpoint saved at entry {idx+1}")

    # Final save
    with open(dataset_path, "w") as f:
        json.dump(dataset, f, indent=2, ensure_ascii=False)

    elapsed_total = time.time() - t_start
    logger.info(
        f"Done in {elapsed_total:.0f}s. "
        f"Success: {stats['success']}, Empty: {stats['empty']}, "
        f"Errors: {stats['errors']}, Skipped: {stats['skipped']}"
    )


if __name__ == "__main__":
    typer.run(main)
