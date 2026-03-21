"""Pre-tokenize LilyPond files into cached .npz shards for fast MLM training."""

from __future__ import annotations

import os
import random
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path
from typing import List, Tuple

import numpy as np
import typer
from tqdm import tqdm
from transformers import PreTrainedTokenizerFast
from typing_extensions import Annotated

from lilybert.data.sharding import ShardWriter


def _collect_ly_files(data_dir: Path) -> List[Path]:
    """Collect .ly files from the data directory."""
    if not data_dir.exists():
        return []
    return sorted(data_dir.glob("*.ly"))


def _shard_file_worker(
    file_path: str,
    tokenizer_path: str,
    max_length: int,
    stride: int,
) -> Tuple[str, List[List[int]], List[List[int]]]:
    """Tokenize a single .ly file for MLM sharding (runs in subprocess).

    Feeds raw LilyPond text directly to the pretrained tokenizer.
    """
    fp = Path(file_path)
    text = fp.read_text(encoding="utf-8", errors="ignore")

    if not text.strip():
        return (fp.stem, [], [])

    tokenizer = PreTrainedTokenizerFast.from_pretrained(tokenizer_path)
    token_ids = tokenizer.encode(text, add_special_tokens=False)
    if not token_ids:
        return (fp.stem, [], [])

    pad_id = tokenizer.pad_token_id or 0
    cls_id = tokenizer.cls_token_id
    sep_id = tokenizer.sep_token_id

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

    id_rows: list[list[int]] = []
    mask_rows: list[list[int]] = []
    for window in windows:
        ids = [cls_id] + window + [sep_id]
        attn = [1] * len(ids)
        pad_len = max_length - len(ids)
        if pad_len > 0:
            ids = ids + [pad_id] * pad_len
            attn = attn + [0] * pad_len
        id_rows.append(ids)
        mask_rows.append(attn)

    return (fp.stem, id_rows, mask_rows)


def _pretokenize_mlm(
    *,
    data_dir: str,
    tokenizer_path: str,
    output_dir: str,
    max_length: int,
    stride: int,
    shard_size: int,
    eval_ratio: float,
    seed: int,
    num_workers: int = 0,
) -> None:
    data_path = Path(data_dir)
    all_files = _collect_ly_files(data_path)
    if not all_files:
        raise FileNotFoundError(f"No .ly files found in {data_path}")

    print(f"Loading tokenizer from {tokenizer_path}")

    rng = random.Random(seed)
    shuffled = list(all_files)
    rng.shuffle(shuffled)
    split_idx = max(1, int(len(shuffled) * (1 - eval_ratio)))
    train_files = shuffled[:split_idx]
    eval_files = shuffled[split_idx:]

    effective_shard_size = shard_size if shard_size > 0 else 8192
    workers = num_workers if num_workers > 0 else (os.cpu_count() or 2)

    skipped = 0
    for split_name, files in [("train", train_files), ("eval", eval_files)]:
        print(
            f"Pretokenizing {split_name} split: {len(files)} files, "
            f"shard_size={effective_shard_size}, workers={workers}"
        )
        split_dir = Path(output_dir) / "mlm" / split_name
        writer = ShardWriter(
            output_dir=split_dir,
            shard_size=effective_shard_size,
            max_length=max_length,
            has_labels=False,
        )

        with ProcessPoolExecutor(max_workers=workers) as exe:
            futures = {
                exe.submit(
                    _shard_file_worker,
                    str(fp),
                    tokenizer_path,
                    max_length,
                    stride,
                ): fp
                for fp in files
            }
            for fut in tqdm(
                as_completed(futures),
                total=len(futures),
                desc=f"shard/{split_name}",
            ):
                mid, ids_list, masks_list = fut.result()
                if not ids_list:
                    skipped += 1
                    continue
                for ids, mask in zip(ids_list, masks_list):
                    writer.add_sample(
                        input_ids=np.array(ids, dtype=np.int64),
                        attention_mask=np.array(mask, dtype=np.int64),
                        movement_id=mid,
                        base_work="",
                    )

        manifest = writer.finalize(
            config={
                "stage": "mlm",
                "max_length": max_length,
                "stride": stride,
                "tokenizer_path": tokenizer_path,
                "split": split_name,
                "shard_size": effective_shard_size,
                "seed": seed,
                "eval_ratio": eval_ratio,
            },
        )
        print(
            f"  {split_name}: {manifest.total_samples} samples across "
            f"{len(manifest.shards)} shards in {split_dir}"
        )

    if skipped:
        print(f"Skipped {skipped} files (empty after tokenization)")
    print("MLM pretokenization complete.")


def main(
    data_dir: Annotated[str, typer.Option()] = "data/processed",
    tokenizer_path: Annotated[str, typer.Option()] = "artifacts/tokenizer",
    output_dir: Annotated[str, typer.Option()] = "artifacts/pretokenized",
    max_length: Annotated[int, typer.Option()] = 512,
    stride: Annotated[int, typer.Option()] = 256,
    shard_size: Annotated[
        int,
        typer.Option(help="Samples per shard. 0 = auto (8192)"),
    ] = 0,
    eval_ratio: Annotated[
        float,
        typer.Option(help="Fraction of data for eval split"),
    ] = 0.01,
    seed: Annotated[int, typer.Option()] = 42,
) -> None:
    _pretokenize_mlm(
        data_dir=data_dir,
        tokenizer_path=tokenizer_path,
        output_dir=output_dir,
        max_length=max_length,
        stride=stride,
        shard_size=shard_size,
        eval_ratio=eval_ratio,
        seed=seed,
    )
