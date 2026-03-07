"""Compatibility shim for deprecated `python -m lilybert` CLI."""


def main() -> None:
    message = (
        "The monolithic `lilybert` CLI has been removed.\n"
        "Use dedicated entrypoints instead:\n"
        "  - ly-preprocess\n"
        "  - ly-train"
    )
    raise SystemExit(message)


if __name__ == "__main__":
    main()
