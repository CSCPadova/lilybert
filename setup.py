#!/usr/bin/env python3
"""Setup script for MaestroGPT."""

from setuptools import find_packages, setup

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

with open("requirements.txt", "r", encoding="utf-8") as fh:
    requirements = [line.strip() for line in fh if line.strip() and not line.startswith("#")]

setup(
    name="maestrogpt",
    version="0.1.0",
    author="MaestroGPT Team",
    description="Fine-tune GPT models on LilyPond music notation with LoRA adapters",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/matteospanio/MaestroGPT",
    package_dir={"": "src"},
    packages=find_packages(where="src"),
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Intended Audience :: Science/Research",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
        "Topic :: Multimedia :: Sound/Audio",
    ],
    python_requires=">=3.8",
    install_requires=requirements,
    extras_require={
        "dev": [
            "pytest>=7.3.0",
            "black>=23.3.0",
            "flake8>=6.0.0",
            "isort>=5.12.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "maestrogpt-train=maestrogpt.training.trainer:main",
            "maestrogpt-generate=maestrogpt.inference.generator:main",
            "maestrogpt-correct=maestrogpt.inference.corrector:main",
        ],
    },
)