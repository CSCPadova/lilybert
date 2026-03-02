"""Pre-tokenize LilyPond files into cached .npz for fast training.

Supports two modes:

* **classification** (default): tokenize movement files into windowed
  samples with labels, optionally sharded across multiple ``.npz`` files.
* **mlm**: tokenize raw ``.ly`` files for masked-language-model pretraining
  (no labels), always sharded.
"""

from __future__ import annotations

import json
import random
from pathlib import Path
from typing import List, Optional

import typer
from typing_extensions import Annotated

import numpy as np
from transformers import PreTrainedTokenizerFast

from lilybert.data import BaroqueMusicClassificationDataset
from lilybert.data.sharding import ShardWriter


def main(
    stage: Annotated[
        str,
        typer.Option(help="Pretokenization stage (classification/mlm)"),
    ] = "classification",
    task: Annotated[str, typer.Option()] = "composer",
    data_dir: Annotated[str, typer.Option()] = "data/processed",
    tokenizer_path: Annotated[str, typer.Option()] = "artifacts/tokenizer",
    output_dir: Annotated[str, typer.Option()] = "artifacts/pretokenized",
    max_length: Annotated[int, typer.Option()] = 512,
    stride: Annotated[int, typer.Option()] = 256,
    language: Annotated[str, typer.Option()] = "english",
    languages: Annotated[
        Optional[str],
        typer.Option(
            help="Comma-separated list of languages (MLM stage only, default: same as --language)"
        ),
    ] = None,
    shard_size: Annotated[
        int,
        typer.Option(help="Samples per shard. 0 = single-file legacy mode"),
    ] = 0,
    include_structure_markers: Annotated[
        bool,
        typer.Option(
            help="Persist structure_markers from movement metadata in pretokenized cache metadata"
        ),
    ] = False,
    eval_ratio: Annotated[
        float,
        typer.Option(help="Fraction of data for eval split (MLM stage only)"),
    ] = 0.01,
    seed: Annotated[int, typer.Option()] = 42,
) -> None:
    if stage == "mlm":
        _pretokenize_mlm(
            data_dir=data_dir,
            tokenizer_path=tokenizer_path,
            output_dir=output_dir,
            max_length=max_length,
            language=language,
            languages=languages,
            shard_size=shard_size,
            eval_ratio=eval_ratio,
            seed=seed,
        )
    else:
        if shard_size > 0:
            _pretokenize_classification_sharded(
                task=task,
                data_dir=data_dir,
                tokenizer_path=tokenizer_path,
                output_dir=output_dir,
                max_length=max_length,
                stride=stride,
                language=language,
                shard_size=shard_size,
                include_structure_markers=include_structure_markers,
            )
        else:
            _pretokenize_classification_legacy(
                task=task,
                data_dir=data_dir,
                tokenizer_path=tokenizer_path,
                output_dir=output_dir,
                max_length=max_length,
                stride=stride,
                language=language,
                include_structure_markers=include_structure_markers,
            )


# ------------------------------------------------------------------
# Classification – sharded mode
# ------------------------------------------------------------------


def _pretokenize_classification_sharded(
    *,
    task: str,
    data_dir: str,
    tokenizer_path: str,
    output_dir: str,
    max_length: int,
    stride: int,
    language: str,
    shard_size: int,
    include_structure_markers: bool,
) -> None:
    data_path = Path(data_dir)
    metadata_path = data_path / "metadata.json"
    if not metadata_path.exists():
        raise FileNotFoundError(f"metadata.json not found in {data_path}")
    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))

    language_dir = data_path / language
    if not language_dir.exists():
        raise FileNotFoundError(f"Language directory not found: {language_dir}")
    movement_files = sorted(str(p) for p in language_dir.glob("*.ly"))
    if not movement_files:
        raise FileNotFoundError(f"No .ly files found in {language_dir}")

    tokenizer = PreTrainedTokenizerFast.from_pretrained(tokenizer_path)
    print(
        f"Building dataset for task={task}, "
        f"{len(movement_files)} files, "
        f"max_length={max_length}, stride={stride}"
    )
    dataset = BaroqueMusicClassificationDataset(
        movement_files=movement_files,
        metadata=metadata,
        tokenizer=tokenizer,
        max_length=max_length,
        stride=stride,
        task=task,
        include_structure_markers=include_structure_markers,
    )

    n = len(dataset)
    if n == 0:
        print("No samples produced. Check metadata and task labels.")
        return
    print(f"Produced {n} windowed samples")

    sample0 = dataset[0]
    is_multi_label = (
        sample0["label"].dim() > 0 if hasattr(sample0["label"], "dim") else False
    )
    num_classes = sample0["label"].shape[0] if is_multi_label else 0

    out_dir = Path(output_dir) / task
    writer = ShardWriter(
        output_dir=out_dir,
        shard_size=shard_size,
        max_length=max_length,
        multi_label=is_multi_label,
        num_classes=num_classes,
        has_labels=True,
    )

    for i in range(n):
        sample = dataset[i]
        label_np = (
            sample["label"].numpy()
            if hasattr(sample["label"], "numpy")
            else np.array(sample["label"])
        )
        writer.add_sample(
            input_ids=sample["input_ids"].numpy(),
            attention_mask=sample["attention_mask"].numpy(),
            label=label_np,
            movement_id=sample["movement_id"],
            base_work=sample["base_work"],
            structure_markers=sample.get("structure_markers"),
        )

    manifest = writer.finalize(
        label_to_index=dataset.label_to_index,
        config={
            "task": task,
            "max_length": max_length,
            "stride": stride,
            "tokenizer_path": tokenizer_path,
            "language": language,
            "data_dir": data_dir,
            "shard_size": shard_size,
            "include_structure_markers": include_structure_markers,
        },
    )
    print(
        f"Done: {manifest.total_samples} samples across "
        f"{len(manifest.shards)} shards in {out_dir}"
    )


# ------------------------------------------------------------------
# Classification – legacy single-file mode
# ------------------------------------------------------------------


def _pretokenize_classification_legacy(
    *,
    task: str,
    data_dir: str,
    tokenizer_path: str,
    output_dir: str,
    max_length: int,
    stride: int,
    language: str,
    include_structure_markers: bool,
) -> None:
    """Original single-file pretokenization (backward compatible)."""
    data_path = Path(data_dir)
    metadata_path = data_path / "metadata.json"
    if not metadata_path.exists():
        raise FileNotFoundError(f"metadata.json not found in {data_path}")
    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))

    language_dir = data_path / language
    if not language_dir.exists():
        raise FileNotFoundError(f"Language directory not found: {language_dir}")
    movement_files = sorted(str(p) for p in language_dir.glob("*.ly"))
    if not movement_files:
        raise FileNotFoundError(f"No .ly files found in {language_dir}")

    print(f"Loading tokenizer from {tokenizer_path}")
    tokenizer = PreTrainedTokenizerFast.from_pretrained(tokenizer_path)

    print(
        f"Building dataset for task={task}, "
        f"{len(movement_files)} files, "
        f"max_length={max_length}, stride={stride}"
    )
    dataset = BaroqueMusicClassificationDataset(
        movement_files=movement_files,
        metadata=metadata,
        tokenizer=tokenizer,
        max_length=max_length,
        stride=stride,
        task=task,
        include_structure_markers=include_structure_markers,
    )

    n = len(dataset)
    if n == 0:
        print("No samples produced. Check metadata and task labels.")
        return

    print(f"Produced {n} windowed samples")

    input_ids = np.empty((n, max_length), dtype=np.int32)
    attention_mask = np.empty((n, max_length), dtype=np.int8)
    movement_ids = []
    base_works = []
    structure_markers = [] if include_structure_markers else None

    sample0 = dataset[0]
    is_multi_label = (
        sample0["label"].dim() > 0 if hasattr(sample0["label"], "dim") else False
    )
    if is_multi_label:
        num_classes = sample0["label"].shape[0]
        labels = np.empty((n, num_classes), dtype=np.float32)
    else:
        labels = np.empty(n, dtype=np.int64)

    for i in range(n):
        sample = dataset[i]
        input_ids[i] = sample["input_ids"].numpy()
        attention_mask[i] = sample["attention_mask"].numpy()
        labels[i] = (
            sample["label"].numpy()
            if hasattr(sample["label"], "numpy")
            else sample["label"]
        )
        movement_ids.append(sample["movement_id"])
        base_works.append(sample["base_work"])
        if include_structure_markers:
            structure_markers.append(sample.get("structure_markers", []))

    out_path = Path(output_dir)
    out_path.mkdir(parents=True, exist_ok=True)

    npz_path = out_path / f"{task}.npz"
    np.savez(
        npz_path,
        input_ids=input_ids,
        attention_mask=attention_mask,
        labels=labels,
    )
    print(f"Saved arrays to {npz_path}")

    meta = {
        "label_to_index": dataset.label_to_index,
        "movement_ids": movement_ids,
        "base_works": base_works,
        "config": {
            "task": task,
            "max_length": max_length,
            "stride": stride,
            "tokenizer_path": tokenizer_path,
            "language": language,
            "data_dir": data_dir,
            "include_structure_markers": include_structure_markers,
        },
    }
    if include_structure_markers:
        meta["structure_markers"] = structure_markers
    meta_path = out_path / f"{task}_meta.json"
    meta_path.write_text(
        json.dumps(meta, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    print(f"Saved metadata to {meta_path}")
    print(f"Done: {n} samples, {len(dataset.label_to_index)} classes")


# ------------------------------------------------------------------
# MLM pretokenization
# ------------------------------------------------------------------


def _collect_ly_files(data_dir: Path, languages: List[str]) -> List[Path]:
    """Collect .ly files from language subdirectories."""
    files: List[Path] = []
    for lang in languages:
        lang_dir = data_dir / lang
        if not lang_dir.exists():
            continue
        files.extend(sorted(lang_dir.glob("*.ly")))
    return files


def _pretokenize_mlm(
    *,
    data_dir: str,
    tokenizer_path: str,
    output_dir: str,
    max_length: int,
    language: str,
    languages: Optional[str],
    shard_size: int,
    eval_ratio: float,
    seed: int,
) -> None:
    lang_list = languages.split(",") if languages else [language]
    data_path = Path(data_dir)
    all_files = _collect_ly_files(data_path, lang_list)
    if not all_files:
        raise FileNotFoundError(
            f"No .ly files found in {data_path} for languages {lang_list}"
        )

    print(f"Loading tokenizer from {tokenizer_path}")
    tokenizer = PreTrainedTokenizerFast.from_pretrained(tokenizer_path)

    # Shuffle and split into train / eval
    rng = random.Random(seed)
    shuffled = list(all_files)
    rng.shuffle(shuffled)
    split_idx = max(1, int(len(shuffled) * (1 - eval_ratio)))
    train_files = shuffled[:split_idx]
    eval_files = shuffled[split_idx:]

    effective_shard_size = shard_size if shard_size > 0 else 8192

    for split_name, files in [("train", train_files), ("eval", eval_files)]:
        print(
            f"Pretokenizing {split_name} split: {len(files)} files, "
            f"shard_size={effective_shard_size}"
        )
        split_dir = Path(output_dir) / "mlm" / split_name
        writer = ShardWriter(
            output_dir=split_dir,
            shard_size=effective_shard_size,
            max_length=max_length,
            has_labels=False,
        )

        for file_path in files:
            text = file_path.read_text(encoding="utf-8", errors="ignore")
            encoded = tokenizer(
                text,
                truncation=True,
                max_length=max_length,
                padding="max_length",
                return_tensors="np",
            )
            writer.add_sample(
                input_ids=encoded["input_ids"].squeeze(0),
                attention_mask=encoded["attention_mask"].squeeze(0),
                movement_id=file_path.stem,
                base_work="",
            )

        manifest = writer.finalize(
            config={
                "stage": "mlm",
                "max_length": max_length,
                "tokenizer_path": tokenizer_path,
                "languages": lang_list,
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

    print("MLM pretokenization complete.")
