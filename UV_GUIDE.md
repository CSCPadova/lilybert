# Using UV with MaestroGPT

This guide explains how to use [UV](https://github.com/astral-sh/uv), a fast Python package installer and resolver, with MaestroGPT.

## What is UV?

UV is an extremely fast Python package installer and resolver, written in Rust. It's designed as a drop-in replacement for pip and pip-tools, with significant performance improvements and additional features.

### Key Benefits

- **⚡ Speed**: 10-100x faster than pip for package resolution and installation
- **🔒 Reproducibility**: Lock files ensure exact same versions across environments
- **✅ Dependency Checking**: Automatically verifies package compatibility
- **🎯 Modern Standards**: Full PEP 621 support and modern Python packaging
- **📦 Optional Dependencies**: Easy management of optional dependency groups

## Installation

### Install UV

```bash
# Using pip
pip install uv

# Or using the official installer (Linux/macOS)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Or using cargo
cargo install --git https://github.com/astral-sh/uv uv
```

### Verify Installation

```bash
uv --version
```

## Quick Start

### Option 1: Using `uv sync` (Recommended)

This is the simplest method - it creates a virtual environment and installs all dependencies automatically.

```bash
# Clone the repository
git clone https://github.com/matteospanio/MaestroGPT.git
cd MaestroGPT

# Sync dependencies (creates .venv and installs everything)
uv sync

# Activate the environment
source .venv/bin/activate  # On Linux/macOS
# or
.venv\Scripts\activate  # On Windows
```

### Option 2: Using `uv pip`

This method gives you more control over the virtual environment.

```bash
# Clone the repository
git clone https://github.com/matteospanio/MaestroGPT.git
cd MaestroGPT

# Create a virtual environment
uv venv

# Activate it
source .venv/bin/activate  # On Linux/macOS

# Install the package
uv pip install -e .

# Or with development dependencies
uv pip install -e ".[dev]"
```

## Working with Dependencies

### Installing Dependencies

```bash
# Install just the package
uv pip install -e .

# Install with dev dependencies
uv pip install -e ".[dev]"

# Install specific optional groups
uv pip install -e ".[dev,docs]"  # If docs group exists
```

### Checking Dependencies

UV can verify that all installed packages are compatible:

```bash
uv pip check
```

This will report any conflicts or missing dependencies.

### Updating Dependencies

To update dependencies while respecting version constraints in `pyproject.toml`:

```bash
# Update lock file with latest compatible versions
uv lock --upgrade

# Then sync to install them
uv sync
```

## Development Workflow

### Setting Up for Development

```bash
# Clone and setup
git clone https://github.com/matteospanio/MaestroGPT.git
cd MaestroGPT

# Install with dev dependencies
uv sync  # Installs both main and dev dependencies

# Activate environment
source .venv/bin/activate
```

### Running Tests

```bash
# With activated environment
pytest tests/

# Or directly
.venv/bin/pytest tests/
```

### Running Linters

```bash
# Format code
black src/ tests/

# Check imports
isort src/ tests/

# Lint code
flake8 src/ tests/
```

## Lock File (`uv.lock`)

The `uv.lock` file contains the exact versions of all dependencies that were resolved. This ensures:

- **Reproducibility**: Everyone gets the same package versions
- **Security**: Know exactly what's installed
- **Performance**: Faster installs (no need to resolve dependencies again)

### When to Update the Lock File

- When adding/removing dependencies in `pyproject.toml`
- When wanting to update to newer versions
- After resolving dependency conflicts

```bash
# Regenerate lock file
uv lock

# Regenerate with updates
uv lock --upgrade
```

### Lock File in Version Control

The `uv.lock` file **should be committed** to version control. This ensures all team members and CI/CD pipelines use identical dependencies.

## Comparison: UV vs PIP

| Feature | UV | PIP |
|---------|-------|-----|
| Resolution Speed | ⚡ Very Fast (ms) | 🐌 Slow (seconds) |
| Installation Speed | ⚡ Fast | 🐌 Moderate |
| Lock Files | ✅ Built-in | ❌ Requires pip-tools |
| Dependency Checking | ✅ Built-in | ❌ Manual |
| PEP 621 Support | ✅ Native | ⚠️ Limited |
| Editable Installs | ✅ Yes | ✅ Yes |
| Virtual Environments | ✅ `uv venv` | ✅ `python -m venv` |

## Common Commands

```bash
# Create virtual environment
uv venv

# Install package in editable mode
uv pip install -e .

# Install with optional dependencies
uv pip install -e ".[dev]"

# Sync from lock file
uv sync

# Update lock file
uv lock --upgrade

# Check for conflicts
uv pip check

# List installed packages
uv pip list

# Show package info
uv pip show maestrogpt

# Uninstall package
uv pip uninstall maestrogpt
```

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install uv
        run: pip install uv
      
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name: Install dependencies
        run: |
          uv venv
          source .venv/bin/activate
          uv pip install -e ".[dev]"
      
      - name: Run tests
        run: |
          source .venv/bin/activate
          pytest tests/
```

## Troubleshooting

### UV Not Found After Installation

Make sure UV is in your PATH. If using the official installer, you may need to restart your shell or run:

```bash
source ~/.bashrc  # or ~/.zshrc
```

### Permission Errors

If you get permission errors, ensure you're not trying to install to system Python. Always use a virtual environment:

```bash
uv venv
source .venv/bin/activate
```

### Lock File Conflicts

If you get lock file conflicts after pulling changes:

```bash
# Regenerate lock file
uv lock

# Then sync
uv sync
```

### Dependency Conflicts

If UV reports dependency conflicts:

```bash
# Check what's conflicting
uv pip check

# Try upgrading to compatible versions
uv lock --upgrade
```

## Migration from PIP

If you're migrating from pip to uv:

1. **Keep your existing `pyproject.toml`** - UV uses the same format
2. **Remove old virtual environment**: `rm -rf venv .venv`
3. **Use uv instead**: `uv sync` or `uv pip install -e .`
4. **Commit the lock file**: `git add uv.lock`

Your existing pip commands have UV equivalents:

```bash
# Old (pip)                    # New (uv)
pip install -e .               → uv pip install -e .
pip install -e ".[dev]"        → uv pip install -e ".[dev]"
pip list                       → uv pip list
pip freeze                     → uv pip freeze
pip check                      → uv pip check
```

## Resources

- [UV Documentation](https://github.com/astral-sh/uv)
- [PEP 621 – Storing project metadata in pyproject.toml](https://peps.python.org/pep-0621/)
- [Python Packaging User Guide](https://packaging.python.org/)

## Getting Help

If you encounter issues with UV:

1. Check the [UV documentation](https://github.com/astral-sh/uv)
2. Open an issue on the [MaestroGPT repository](https://github.com/matteospanio/MaestroGPT/issues)
3. Check existing issues for similar problems

---

**Note**: You can still use pip if you prefer. UV is recommended but not required. All standard pip commands will continue to work with the project.
