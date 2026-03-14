#!/usr/bin/env python3
"""Extract layer-wise BERT embeddings for the Mutopia dataset.

For each entry in dataset_mutopia.json, strips non-musical content from the
.ly file, tokenizes, and extracts [CLS] embeddings at specified layers.
Saves per-entry .npy files and updates the JSON with embedding paths.
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
from transformers import PreTrainedTokenizerFast
from typing_extensions import Annotated

# Add project root to path
PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from lilybert.cli.embed import _movement_windows
from lilybert.data.preprocessor import LilyPondPreprocessor
from lilybert.models import LilyBERTEncoder

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s: %(message)s",
    datefmt="%H:%M:%S",
    stream=sys.stdout,
)
logger = logging.getLogger(__name__)

DEFAULT_STRIP = [
    "comments",
    "header",
    "scheme",
    "overrides",
    "pagebreaks",
    "midi",
    "version",
]


def strip_only(preprocessor: LilyPondPreprocessor, raw_text: str) -> str:
    """Lightweight strip: remove non-musical sections without the full pipeline.

    Calls _remove_comments_and_cleanup, _strip_engraving, variable inlining,
    and _postprocess. Skips movement extraction, translation, and other heavy
    processing in process_content().
    """
    text = preprocessor._remove_comments_and_cleanup(raw_text)
    text = preprocessor._strip_engraving(text)
    assignments = preprocessor._parse_assignments(text)
    text = preprocessor._inline_variables(text, assignments)
    text = preprocessor._postprocess(text)
    return text.strip()


def extract_layer_embeddings(
    encoder: LilyBERTEncoder,
    ids_tensor: torch.Tensor,
    mask_tensor: torch.Tensor,
    layers: List[int],
    batch_size: int,
    device: torch.device,
) -> Dict[int, np.ndarray]:
    """Extract [CLS] embeddings at specified layers, averaged across windows."""
    layer_sums: Dict[int, torch.Tensor] = {}
    total_windows = 0

    for start in range(0, ids_tensor.shape[0], batch_size):
        end = start + batch_size
        batch_ids = ids_tensor[start:end].to(device)
        batch_mask = mask_tensor[start:end].to(device)

        outputs = encoder.bert(
            input_ids=batch_ids,
            attention_mask=batch_mask,
            return_dict=True,
            output_hidden_states=True,
        )

        n_windows = batch_ids.shape[0]
        total_windows += n_windows

        for layer in layers:
            cls_vec = outputs.hidden_states[layer][:, 0, :].detach().cpu()
            if layer not in layer_sums:
                layer_sums[layer] = cls_vec.sum(dim=0)
            else:
                layer_sums[layer] += cls_vec.sum(dim=0)

        del outputs, batch_ids, batch_mask
        torch.cuda.empty_cache()

    result = {}
    for layer in layers:
        result[layer] = (layer_sums[layer] / total_windows).numpy()
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
    max_length: Annotated[int, typer.Option(help="Window max length")] = 2048,
    stride: Annotated[int, typer.Option(help="Window stride")] = 256,
    batch_size: Annotated[int, typer.Option(help="Batch size")] = 4,
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
    tokenizer = PreTrainedTokenizerFast.from_pretrained(tokenizer_ref)
    cls_id = tokenizer.cls_token_id
    sep_id = tokenizer.sep_token_id
    pad_id = tokenizer.pad_token_id or 0

    encoder = LilyBERTEncoder.from_pretrained(model)
    device_obj = torch.device(device)
    encoder.to(device_obj)
    encoder.eval()
    for p in encoder.parameters():
        p.requires_grad = False

    preprocessor = LilyPondPreprocessor(strip_sections=DEFAULT_STRIP)

    logger.info(f"Model loaded on {device}. Layers: {layers}. Batch size: {batch_size}")

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

            raw_text = file_path.read_text(encoding="utf-8", errors="ignore")

            # Lightweight strip only — no movement extraction or translation
            try:
                stripped_text = strip_only(preprocessor, raw_text)
            except Exception as e:
                logger.warning(f"[{idx}] Strip failed for {local_path}: {e}")
                entry["embeddings"] = None
                stats["errors"] += 1
                continue

            if not stripped_text:
                logger.warning(f"[{idx}] Empty after stripping: {local_path}")
                entry["embeddings"] = None
                stats["empty"] += 1
                continue

            token_ids = tokenizer.encode(stripped_text, add_special_tokens=False)
            if not token_ids:
                logger.warning(f"[{idx}] No tokens from {local_path}")
                entry["embeddings"] = None
                stats["empty"] += 1
                continue

            ids_tensor, mask_tensor = _movement_windows(
                token_ids,
                max_length=max_length,
                stride=stride,
                cls_id=cls_id,
                sep_id=sep_id,
                pad_id=pad_id,
            )

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

            elapsed_file = time.time() - t_file
            elapsed_total = time.time() - t_start
            rate = (idx + 1 - stats["skipped"]) / elapsed_total if elapsed_total > 0 else 0

            logger.info(
                f"[{idx+1}/{len(dataset)}] {local_path} "
                f"| {len(token_ids)} tok | {ids_tensor.shape[0]} win "
                f"| {elapsed_file:.1f}s | rate={rate:.1f}/s"
            )

            # Periodic JSON checkpoint
            if (idx + 1) % save_every == 0:
                with open(dataset_path, "w") as f:
                    json.dump(dataset, f, indent=4, ensure_ascii=False)
                logger.info(f"  >> Checkpoint saved at entry {idx+1}")

    # Final save
    with open(dataset_path, "w") as f:
        json.dump(dataset, f, indent=4, ensure_ascii=False)

    elapsed = time.time() - t_start
    logger.info("=" * 60)
    logger.info("EXTRACTION COMPLETE")
    logger.info(f"  Total entries:  {stats['total']}")
    logger.info(f"  Success:        {stats['success']}")
    logger.info(f"  Skipped:        {stats['skipped']}")
    logger.info(f"  Empty:          {stats['empty']}")
    logger.info(f"  Errors:         {stats['errors']}")
    logger.info(f"  Layers:         {layers}")
    logger.info(f"  Elapsed:        {elapsed/60:.1f} min")
    logger.info(f"  Output dir:     {output_base.resolve()}")
    logger.info("=" * 60)


def run() -> None:
    typer.run(main)


if __name__ == "__main__":
    run()
