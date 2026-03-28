"""Select a subset of data/ly files matching the token count of data/preprocessed/combined."""

import random
import shutil
from pathlib import Path

from tqdm import tqdm
from transformers import AutoTokenizer

from lilybert.training.trainer import MLMPretrainer

SEED = 42
LY_DIR = Path("data/ly")
COMBINED_DIR = Path("data/preprocessed/combined")
SUBSET_DIR = LY_DIR / "subset"
TOKENIZER_PATH = "artifacts/tokenizer"


def main():
    random.seed(SEED)
    tokenizer = AutoTokenizer.from_pretrained(TOKENIZER_PATH)

    # Count tokens in the reference dataset
    combined_files = sorted(COMBINED_DIR.glob("*.ly"))
    combined_stats = MLMPretrainer.count_corpus_tokens(combined_files, tokenizer)
    target_tokens = combined_stats["total_tokens"]
    print(f"Reference dataset (preprocessed/combined): {combined_stats}")

    # Tokenize a subset of ly files (first 20k after shuffle)
    ly_files = sorted(LY_DIR.glob("*.ly"))
    random.shuffle(ly_files)
    ly_files = ly_files[:20_000]

    file_tokens = []
    for f in tqdm(ly_files, desc="Tokenizing data/ly", unit="file"):
        text = f.read_text(encoding="utf-8", errors="ignore")
        n_tokens = len(tokenizer.encode(text, add_special_tokens=True))
        file_tokens.append((f, n_tokens))

    # Greedily select files until we reach the target token count
    selected = []
    running_total = 0
    pbar = tqdm(file_tokens, desc="Selecting files", unit="file")
    for f, n in pbar:
        if running_total + n > target_tokens:
            continue
        selected.append((f, n))
        running_total += n
        pbar.set_postfix(tokens=f"{running_total:,}/{target_tokens:,}")
    pbar.close()

    # Copy selected files into subset directory
    SUBSET_DIR.mkdir(parents=True, exist_ok=True)
    for f, _ in tqdm(selected, desc="Copying to subset", unit="file"):
        shutil.copy2(f, SUBSET_DIR / f.name)

    # Count tokens in the subset to confirm
    subset_files = [SUBSET_DIR / f.name for f, _ in selected]
    subset_stats = MLMPretrainer.count_corpus_tokens(subset_files, tokenizer)

    print(f"\n{'='*60}")
    print(f"Reference (preprocessed/combined):")
    print(f"  Files:  {combined_stats['file_count']}")
    print(f"  Tokens: {combined_stats['total_tokens']}")
    print(f"\nSubset (data/ly/subset):")
    print(f"  Files:  {subset_stats['file_count']}")
    print(f"  Tokens: {subset_stats['total_tokens']}")
    print(f"{'='*60}")


if __name__ == "__main__":
    main()
