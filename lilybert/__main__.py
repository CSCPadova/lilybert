"""Entry point for `python -m lilybert`."""

import sys


def main() -> None:
    print(
        "lilybert — CodeBERT-based representation learning for LilyPond\n"
        "\n"
        "Available commands:\n"
        "  preprocess   Preprocess LilyPond files, build tokenizer, create shards\n"
        "  train        MLM pre-training and linear-probe classification\n"
        "  embed        Extract frozen-encoder embeddings\n"
        "\n"
        "Run any command with --help for usage details."
    )
    sys.exit(0)


if __name__ == "__main__":
    main()
