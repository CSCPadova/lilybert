#!/usr/bin/env python3
from pathlib import Path
import json
import os
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor, as_completed
from tqdm import tqdm
from typing import List


def _preprocess_file_worker(path: str, aug_map: dict) -> dict:
    # worker runs in a separate process to avoid pickling the main parser/tokenizer
    from lilybert.data.preprocessor import LilyPondPreprocessor, AugmentationConfig

    p = LilyPondPreprocessor(augmentation_config=AugmentationConfig.from_mapping(aug_map))
    try:
        text = Path(path).read_text(encoding="utf-8", errors="ignore")
        movements = p.process_content(text, Path(path).name, labels_entry={})
        results = []
        for movement in movements:
            variants = p._build_augmented_variants(movement, p.augmentation_config)
            for variant in variants:
                results.append(
                    {
                        "movement_id": movement["movement_id"],
                        "language": variant["language"],
                        "variant_id": variant["variant_id"],
                        "text": variant["text"],
                        "base_work": movement.get("base_work"),
                        "movement_index": movement.get("movement_index"),
                        "source_file": Path(path).name,
                        "meta_key": movement.get("meta_key"),
                        "section_nomenclature": movement.get("section_nomenclature"),
                        "labels": movement.get("labels", {}),
                    }
                )
        return {"ok": True, "results": results}
    except Exception as exc:
        return {"ok": False, "error": str(exc), "file": path}


def _build_corpus_worker(path: str) -> dict:
    # Build parser token line for a processed movement file
    from lilybert.data.tokenizer import LilyPondTokenizer

    tok = LilyPondTokenizer()
    try:
        text = Path(path).read_text(encoding="utf-8", errors="ignore")
        token_line = tok._movement_to_parser_tokens(text)
        return {"ok": True, "path": path, "token_line": token_line}
    except Exception as exc:
        return {"ok": False, "path": path, "error": str(exc)}


def main():
    from lilybert.data.tokenizer import LilyPondTokenizer

    # Config
    input_dir = Path("data/raw")
    processed_dir = Path("data/processed")
    tokenizer_output = Path("artifacts/tokenizer_from_augmented")
    tokenizer_output.mkdir(parents=True, exist_ok=True)

    aug_map = {
        "languages": ["nederlands", "english", "italiano"],
        "enable_transposition": True,
        "enable_absolute_relative": True,
        "enable_articulation_variants": True,
        "enable_barline_variants": True,
        "include_original": True,
    }

    print("Starting parallel preprocessing with augmentation:", json.dumps(aug_map))

    # ensure output dirs
    for lang in aug_map["languages"]:
        (processed_dir / lang).mkdir(parents=True, exist_ok=True)

    raw_files = sorted([str(p) for p in input_dir.glob("*.ly")])
    metadata = {}
    failures = {}

    max_workers = min(8, (os.cpu_count() or 2))
    with ProcessPoolExecutor(max_workers=max_workers) as exe:
        futures = {exe.submit(_preprocess_file_worker, path, aug_map): path for path in raw_files}
        for fut in tqdm(as_completed(futures), total=len(futures), desc="Preprocessing files"):
            path = futures[fut]
            res = fut.result()
            if not res.get("ok"):
                failures[Path(path).name] = res.get("error")
                continue
            for item in res.get("results", []):
                language = item["language"]
                movement_id = item["movement_id"]
                variant_id = item["variant_id"]
                # write file
                if variant_id == "base":
                    out_name = f"{movement_id}.ly"
                else:
                    out_name = f"{movement_id}__{variant_id}.ly"
                out_path = processed_dir / language / out_name
                out_path.write_text(item["text"], encoding="utf-8")

                # update metadata for base variants only
                if variant_id == "base":
                    metadata[movement_id] = {
                        "base_work": item.get("base_work"),
                        "source_file": item.get("source_file"),
                        "movement_index": item.get("movement_index"),
                        "meta_key": item.get("meta_key"),
                        "section_nomenclature": item.get("section_nomenclature"),
                        "labels": item.get("labels", {}),
                    }

    metadata_path = processed_dir / "metadata.json"
    metadata_path.write_text(json.dumps(metadata, ensure_ascii=False, indent=2), encoding="utf-8")

    print("Preprocessing done. Files written.")

    # Build corpus in parallel across processed movement files
    processed_files = []
    for lang in aug_map["languages"]:
        processed_files.extend([str(p) for p in (processed_dir / lang).glob("*.ly")])

    corpus: List[str] = []
    with ProcessPoolExecutor(max_workers=max_workers) as exe:
        futures = {exe.submit(_build_corpus_worker, path): path for path in processed_files}
        for fut in tqdm(as_completed(futures), total=len(futures), desc="Building corpus"):
            res = fut.result()
            if not res.get("ok"):
                print("Warning: corpus build failed for", res.get("path"), res.get("error"))
                continue
            if res.get("token_line"):
                corpus.append(res.get("token_line"))

    print(f"Corpus movement count: {len(corpus)}")

    # Train tokenizer (vocab default 8000)
    tok = LilyPondTokenizer()
    fast_tok = tok.train(corpus, vocab_size=8000)
    fast_tok.save_pretrained(str(tokenizer_output))

    # Compute vocab size
    try:
        vocab_size = fast_tok.vocab_size
    except Exception:
        vocab_size = len(fast_tok.get_vocab())

    # Count total tokens across corpus using threads
    total_tokens = 0
    with ThreadPoolExecutor(max_workers=max_workers) as exe:
        futures = [exe.submit(lambda s: len(fast_tok.encode(s, add_special_tokens=False)), sample) for sample in corpus]
        for fut in tqdm(as_completed(futures), total=len(futures), desc="Counting tokens"):
            total_tokens += fut.result()

    out = {
        "vocab_size": vocab_size,
        "movement_count": len(corpus),
        "total_tokens": total_tokens,
        "tokenizer_dir": str(tokenizer_output),
    }

    print("Results:")
    print(json.dumps(out, indent=2))


if __name__ == "__main__":
    main()
