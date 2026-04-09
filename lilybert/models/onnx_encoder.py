"""ONNX-based encoder for LilyBERT inference without PyTorch."""

from __future__ import annotations

from pathlib import Path
from typing import Union

import numpy as np
from transformers import PreTrainedTokenizerFast

ONNX_FILENAME = "model.onnx"


class LilyBERTOnnxEncoder:
    """LilyBERT encoder backed by ONNX Runtime.

    Provides the same ``encode()`` interface as
    :class:`~lilybert.models.LilyBERTEncoder` but requires only
    ``onnxruntime`` and ``transformers`` at inference time (no PyTorch).

    Parameters
    ----------
    model_path:
        Local directory containing ``model.onnx`` and tokenizer files,
        **or** a HuggingFace model ID (e.g. ``"csc-unipd/lilybert"``).
        When a HF ID is given the ONNX file is downloaded automatically
        via :func:`huggingface_hub.hf_hub_download`.
    """

    def __init__(self, model_path: Union[str, Path]) -> None:
        try:
            import onnxruntime as ort
        except ImportError:
            raise ImportError(
                "onnxruntime is required: pip install lilybert[onnx]"
            )

        onnx_path = self._resolve_onnx(model_path)
        self.session = ort.InferenceSession(
            str(onnx_path),
            providers=ort.get_available_providers(),
        )
        self.tokenizer = PreTrainedTokenizerFast.from_pretrained(
            str(model_path)
        )

    @staticmethod
    def _resolve_onnx(model_path: Union[str, Path]) -> Path:
        """Return the path to ``model.onnx``, downloading from HF if needed."""
        local = Path(model_path)
        if local.is_dir() and (local / ONNX_FILENAME).exists():
            return local / ONNX_FILENAME

        from huggingface_hub import hf_hub_download

        return Path(
            hf_hub_download(
                repo_id=str(model_path),
                filename=ONNX_FILENAME,
            )
        )

    def encode(
        self,
        input_ids: np.ndarray,
        attention_mask: np.ndarray,
    ) -> np.ndarray:
        """Return CLS embeddings for the given inputs.

        Parameters
        ----------
        input_ids:
            Integer array of shape ``(batch, seq_len)``.
        attention_mask:
            Integer array of shape ``(batch, seq_len)``.

        Returns
        -------
        np.ndarray
            Float array of shape ``(batch, hidden_size)``.
        """
        (hidden_states,) = self.session.run(
            None,
            {
                "input_ids": input_ids.astype(np.int64),
                "attention_mask": attention_mask.astype(np.int64),
            },
        )
        return hidden_states[:, 0, :]
