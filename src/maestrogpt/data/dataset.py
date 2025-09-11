"""Dataset classes for LilyPond music notation data."""

import logging
import json
from pathlib import Path
from typing import List, Dict, Any, Optional, Union, Callable
import torch
from torch.utils.data import Dataset
from transformers import PreTrainedTokenizer

logger = logging.getLogger(__name__)


class LilyPondDataset(Dataset):
    """PyTorch Dataset for LilyPond music notation data.
    
    This dataset class handles loading and serving preprocessed LilyPond data
    for training language models on music notation.
    """
    
    def __init__(
        self,
        data: List[Dict[str, Any]],
        tokenizer: PreTrainedTokenizer,
        max_length: int = 1024,
        return_tensors: str = "pt",
        padding: str = "max_length",
        truncation: bool = True,
        include_metadata: bool = False,
        transform: Optional[Callable] = None,
    ):
        """Initialize the dataset.
        
        Args:
            data: List of preprocessed LilyPond data dictionaries
            tokenizer: Tokenizer for encoding text
            max_length: Maximum sequence length
            return_tensors: Format to return tensors in
            padding: Padding strategy
            truncation: Whether to truncate long sequences
            include_metadata: Whether to include metadata in items
            transform: Optional transform function to apply to items
        """
        self.data = data
        self.tokenizer = tokenizer
        self.max_length = max_length
        self.return_tensors = return_tensors
        self.padding = padding
        self.truncation = truncation
        self.include_metadata = include_metadata
        self.transform = transform
        
        # Ensure pad token is set
        if self.tokenizer.pad_token is None:
            self.tokenizer.pad_token = self.tokenizer.eos_token
        
        logger.info(f"Initialized LilyPondDataset with {len(self.data)} samples")
    
    def __len__(self) -> int:
        """Return the number of samples in the dataset."""
        return len(self.data)
    
    def __getitem__(self, idx: int) -> Dict[str, Any]:
        """Get a single sample from the dataset.
        
        Args:
            idx: Index of the sample
            
        Returns:
            Dictionary containing tokenized inputs and labels
        """
        item = self.data[idx]
        text = item["text"]
        
        # Tokenize the text
        encoding = self.tokenizer(
            text,
            max_length=self.max_length,
            padding=self.padding,
            truncation=self.truncation,
            return_tensors=self.return_tensors,
        )
        
        # For causal language modeling, labels are the same as input_ids
        encoding["labels"] = encoding["input_ids"].clone()
        
        # Add metadata if requested
        if self.include_metadata:
            encoding["metadata"] = item.get("metadata", {})
            encoding["statistics"] = item.get("statistics", {})
            encoding["file_path"] = item.get("file_path", "")
        
        # Apply transform if provided
        if self.transform:
            encoding = self.transform(encoding)
        
        # Convert to tensors and squeeze if needed
        if self.return_tensors == "pt":
            for key in ["input_ids", "attention_mask", "labels"]:
                if key in encoding:
                    encoding[key] = encoding[key].squeeze(0)
        
        return encoding
    
    @classmethod
    def from_preprocessed_files(
        cls,
        file_paths: List[str],
        tokenizer: PreTrainedTokenizer,
        **kwargs
    ) -> "LilyPondDataset":
        """Create dataset from preprocessed JSON files.
        
        Args:
            file_paths: List of paths to preprocessed JSON files
            tokenizer: Tokenizer for encoding text
            **kwargs: Additional arguments for dataset initialization
            
        Returns:
            LilyPondDataset instance
        """
        data = []
        
        for file_path in file_paths:
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    file_data = json.load(f)
                    data.append(file_data)
            except Exception as e:
                logger.error(f"Error loading {file_path}: {e}")
                continue
        
        return cls(data, tokenizer, **kwargs)
    
    @classmethod
    def from_split_data(
        cls,
        split_data: List[Dict[str, Any]],
        tokenizer: PreTrainedTokenizer,
        **kwargs
    ) -> "LilyPondDataset":
        """Create dataset from split data.
        
        Args:
            split_data: Preprocessed split data
            tokenizer: Tokenizer for encoding text
            **kwargs: Additional arguments for dataset initialization
            
        Returns:
            LilyPondDataset instance
        """
        return cls(split_data, tokenizer, **kwargs)
    
    def get_sample_text(self, idx: int) -> str:
        """Get the original text for a sample.
        
        Args:
            idx: Index of the sample
            
        Returns:
            Original text string
        """
        return self.data[idx]["text"]
    
    def get_statistics(self) -> Dict[str, Any]:
        """Get statistics about the dataset.
        
        Returns:
            Dictionary containing dataset statistics
        """
        total_samples = len(self.data)
        total_tokens = 0
        total_chars = 0
        file_count = 0
        
        # Collect metadata
        composers = set()
        time_signatures = set()
        key_signatures = set()
        
        for item in self.data:
            text = item["text"]
            total_chars += len(text)
            
            # Count tokens (approximate)
            if "tokenized" in item and item["tokenized"]:
                total_tokens += item["tokenized"]["token_count"]
            else:
                total_tokens += len(text.split())
            
            # Count files
            if "file_path" in item:
                file_count += 1
            
            # Extract metadata
            metadata = item.get("metadata", {})
            if "composer" in metadata:
                composers.add(metadata["composer"])
            if "time" in metadata:
                time_signatures.add(metadata["time"])
            if "key" in metadata:
                key_signatures.add(metadata["key"])
        
        avg_tokens_per_sample = total_tokens / total_samples if total_samples > 0 else 0
        avg_chars_per_sample = total_chars / total_samples if total_samples > 0 else 0
        
        return {
            "total_samples": total_samples,
            "total_tokens": total_tokens,
            "total_characters": total_chars,
            "avg_tokens_per_sample": avg_tokens_per_sample,
            "avg_chars_per_sample": avg_chars_per_sample,
            "unique_files": file_count,
            "unique_composers": len(composers),
            "unique_time_signatures": len(time_signatures),
            "unique_key_signatures": len(key_signatures),
            "composers": list(composers),
            "time_signatures": list(time_signatures),
            "key_signatures": list(key_signatures),
        }


class MusicGenerationDataset(LilyPondDataset):
    """Specialized dataset for music generation tasks.
    
    This dataset provides additional functionality for generation tasks,
    such as prompt-completion pairs and conditional generation.
    """
    
    def __init__(
        self,
        data: List[Dict[str, Any]],
        tokenizer: PreTrainedTokenizer,
        prompt_length: int = 128,
        completion_length: int = 512,
        **kwargs
    ):
        """Initialize the music generation dataset.
        
        Args:
            data: List of preprocessed LilyPond data
            tokenizer: Tokenizer for encoding text
            prompt_length: Length of prompt sequences
            completion_length: Length of completion sequences
            **kwargs: Additional arguments for parent class
        """
        super().__init__(data, tokenizer, **kwargs)
        self.prompt_length = prompt_length
        self.completion_length = completion_length
        self.total_length = prompt_length + completion_length
        
        # Update max_length to accommodate prompt + completion
        self.max_length = max(self.max_length, self.total_length)
    
    def __getitem__(self, idx: int) -> Dict[str, Any]:
        """Get a prompt-completion pair.
        
        Args:
            idx: Index of the sample
            
        Returns:
            Dictionary with prompt and completion data
        """
        item = self.data[idx]
        text = item["text"]
        
        # Tokenize the full text
        encoding = self.tokenizer(
            text,
            max_length=self.max_length,
            padding=False,
            truncation=self.truncation,
            return_tensors=self.return_tensors,
        )
        
        input_ids = encoding["input_ids"].squeeze(0)
        
        # Split into prompt and completion
        if len(input_ids) > self.total_length:
            # Randomly choose a split point
            import random
            max_start = len(input_ids) - self.total_length
            start_idx = random.randint(0, max_start)
            input_ids = input_ids[start_idx:start_idx + self.total_length]
        
        # Create prompt and completion
        if len(input_ids) >= self.prompt_length:
            prompt_ids = input_ids[:self.prompt_length]
            completion_ids = input_ids[self.prompt_length:]
        else:
            # Pad if too short
            prompt_ids = input_ids
            completion_ids = torch.tensor([], dtype=input_ids.dtype)
        
        # Pad to fixed lengths
        if len(prompt_ids) < self.prompt_length:
            pad_length = self.prompt_length - len(prompt_ids)
            prompt_ids = torch.cat([
                prompt_ids,
                torch.full((pad_length,), self.tokenizer.pad_token_id, dtype=prompt_ids.dtype)
            ])
        
        if len(completion_ids) < self.completion_length:
            pad_length = self.completion_length - len(completion_ids)
            completion_ids = torch.cat([
                completion_ids,
                torch.full((pad_length,), self.tokenizer.pad_token_id, dtype=completion_ids.dtype)
            ])
        
        # Create attention masks
        prompt_attention_mask = (prompt_ids != self.tokenizer.pad_token_id).long()
        completion_attention_mask = (completion_ids != self.tokenizer.pad_token_id).long()
        
        result = {
            "prompt_input_ids": prompt_ids,
            "prompt_attention_mask": prompt_attention_mask,
            "completion_input_ids": completion_ids,
            "completion_attention_mask": completion_attention_mask,
            "input_ids": torch.cat([prompt_ids, completion_ids]),
            "attention_mask": torch.cat([prompt_attention_mask, completion_attention_mask]),
        }
        
        # Labels for causal LM (shifted completion)
        labels = torch.cat([
            torch.full((self.prompt_length,), -100, dtype=completion_ids.dtype),  # Ignore prompt in loss
            completion_ids
        ])
        result["labels"] = labels
        
        return result


class DataCollatorForMusicGeneration:
    """Data collator for music generation tasks.
    
    This collator handles batching and padding for music generation datasets.
    """
    
    def __init__(
        self,
        tokenizer: PreTrainedTokenizer,
        pad_to_multiple_of: Optional[int] = None,
        return_tensors: str = "pt",
    ):
        """Initialize the data collator.
        
        Args:
            tokenizer: Tokenizer for padding
            pad_to_multiple_of: Pad sequences to multiple of this value
            return_tensors: Format to return tensors in
        """
        self.tokenizer = tokenizer
        self.pad_to_multiple_of = pad_to_multiple_of
        self.return_tensors = return_tensors
        
        if self.tokenizer.pad_token is None:
            self.tokenizer.pad_token = self.tokenizer.eos_token
    
    def __call__(self, features: List[Dict[str, Any]]) -> Dict[str, Any]:
        """Collate a batch of features.
        
        Args:
            features: List of feature dictionaries
            
        Returns:
            Batched and padded features
        """
        batch = {}
        
        # Get all keys from features
        keys = set()
        for feature in features:
            keys.update(feature.keys())
        
        # Handle each key
        for key in keys:
            if key in ["metadata", "statistics", "file_path"]:
                # Don't batch metadata
                batch[key] = [feature.get(key) for feature in features]
            else:
                # Stack tensors
                values = [feature[key] for feature in features if key in feature]
                if values and torch.is_tensor(values[0]):
                    batch[key] = torch.stack(values)
                else:
                    batch[key] = values
        
        return batch