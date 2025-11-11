"""Data preprocessing utilities for LilyPond music notation."""

import logging
import json
import pickle
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple, Union
import re

from transformers import PreTrainedTokenizer
from .lilypond_parser import LilyPondParser

logger = logging.getLogger(__name__)


class LilyPondPreprocessor:
    """Preprocessor for LilyPond music notation data.
    
    This class handles the preprocessing pipeline for LilyPond music files,
    including tokenization, normalization, and data augmentation.
    """
    
    def __init__(
        self,
        tokenizer: Optional[PreTrainedTokenizer] = None,
        max_sequence_length: int = 1024,
        add_special_tokens: bool = True,
        normalize_notation: bool = True,
    ):
        """Initialize the preprocessor.
        
        Args:
            tokenizer: Pre-trained tokenizer to use
            max_sequence_length: Maximum sequence length for truncation
            add_special_tokens: Whether to add special tokens for structure
            normalize_notation: Whether to normalize LilyPond notation
        """
        self.tokenizer = tokenizer
        self.max_sequence_length = max_sequence_length
        self.add_special_tokens = add_special_tokens
        self.normalize_notation = normalize_notation
        self.parser = LilyPondParser()
        
        # Special tokens for music structure
        self.special_tokens = {
            "section_start": "<SECTION>",
            "section_end": "</SECTION>",
            "phrase_start": "<PHRASE>",
            "phrase_end": "</PHRASE>",
            "measure_sep": "<MEASURE>",
            "voice_sep": "<VOICE>",
            "key_sig": "<KEY:",
            "time_sig": "<TIME:",
            "tempo": "<TEMPO:",
            "clef": "<CLEF:",
            "close_tag": ">",
            "repeat_unfold": "<REPEAT_UNFOLD:",
        }
        
        # Music theory mappings for normalization
        self.enharmonic_equivalents = {
            "cis": "des", "dis": "ees", "fis": "ges",
            "gis": "aes", "ais": "bes",
        }
        
        self.note_values = {
            "1": "whole", "2": "half", "4": "quarter",
            "8": "eighth", "16": "sixteenth", "32": "thirty-second"
        }
        self.ITALIAN_NOTE_PATTERN = re.compile(
            r'(?<![a-zA-Z])'                # no letter before
            r'((?:do|re|mi|fa|sol|la|si)'   # base note names
            r'(?:-?(?:diesis|bemolle|doppio-diesis|doppio-bemolle)|d|b)?'  # optional accidentals
            r"(?:'+|,+)?"                   # optional octave markers
            r"[!?]?"                        # optional cautionary accidentals
            r'(?:\d+\.*)?'                  # optional duration
            r')'                # no letter after    
        )
        self.NOTE_PATTERN = re.compile(fr'({self.ITALIAN_NOTE_PATTERN.pattern})')
    
    def preprocess_file(self, file_path: str) -> Dict[str, Any]:
        """Preprocess a single LilyPond file.
        
        Args:
            file_path: Path to the LilyPond file
            
        Returns:
            Dictionary containing processed data and metadata
        """
        logger.info(f"Preprocessing file: {file_path}")
        
        # Parse the file
        elements = self.parser.parse_file(file_path)
        
        if not elements:
            logger.warning(f"No elements found in {file_path}")
            return {"text": "", "metadata": {}, "statistics": {}}
        
        # Convert to text sequence
        raw_text = self.parser.to_sequence(include_metadata=True)
        
        # Apply preprocessing steps
        processed_text = self._preprocess_text(raw_text)
        
        # Tokenize if tokenizer is available
        tokenized = None
        if self.tokenizer:
            tokenized = self._tokenize_text(processed_text)
        
        # Get statistics
        statistics = self.parser.get_statistics()
        
        return {
            "text": processed_text,
            "raw_text": raw_text,
            "tokenized": tokenized,
            "metadata": self.parser.metadata,
            "statistics": statistics,
            "file_path": file_path,
        }
    
    def preprocess_directory(
        self,
        input_dir: str,
        output_dir: Optional[str] = None,
        file_pattern: str = "*.ly"
    ) -> List[Dict[str, Any]]:
        """Preprocess all LilyPond files in a directory.
        
        Args:
            input_dir: Input directory containing .ly files
            output_dir: Output directory for processed files (optional)
            file_pattern: File pattern to match
            
        Returns:
            List of processed file data
        """
        input_path = Path(input_dir)
        processed_files = []
        
        # Find all matching files
        ly_files = list(input_path.glob(file_pattern))
        logger.info(f"Found {len(ly_files)} files matching {file_pattern}")
        
        for file_path in ly_files:
            try:
                processed_data = self.preprocess_file(str(file_path))
                processed_files.append(processed_data)
                
                # Save processed data if output directory is specified
                if output_dir:
                    output_path = Path(output_dir)
                    output_path.mkdir(parents=True, exist_ok=True)
                    
                    output_file = output_path / f"{file_path.stem}_processed.json"
                    with open(output_file, 'w', encoding='utf-8') as f:
                        json.dump(processed_data, f, ensure_ascii=False, indent=2)
                        
            except Exception as e:
                logger.error(f"Error processing {file_path}: {e}")
                continue
        
        return processed_files
    
    def _preprocess_text(self, text: str) -> str:
        """Apply text preprocessing steps.
        
        Args:
            text: Raw LilyPond text
            
        Returns:
            Preprocessed text
        """
        # Normalize whitespace
        text = re.sub(r'\s+', ' ', text).strip()
        
        if self.normalize_notation:
            text = self._normalize_notation(text)
        
        if self.add_special_tokens:
            text = self._add_structural_tokens(text)
        
        return text
    
    def _normalize_notation(self, text: str) -> str:
        """Normalize LilyPond notation for consistency.
        
        Args:
            text: Input text
            
        Returns:
            Normalized text
        """
        # Normalize enharmonic equivalents (optional - might want to preserve)
        # for sharp, flat in self.enharmonic_equivalents.items():
        #     text = text.replace(sharp, flat)
        
        # Normalize relative mode indicators
        text = re.sub(rf"\\relative\s+{self.NOTE_PATTERN.pattern}'*\s", r"\\relative do'' ", text)
        
        # Normalize time signatures
        text = re.sub(r"\\time\s+(\d+/\d+)", r"\\time \1", text)
        
        # Normalize key signatures
        text = re.sub(rf"\\key\s+((?:(?:do|re|mi|fa|sol|la|si)(?:-?(?:diesis|bemolle|doppio-diesis|doppio-bemolle)|d|b)?|[a-g](?:is|es|isis|eses)?)(?:,+|\'*)?(?:\d+\.*)?)\s*\\(major|minor)", 
                     r"\\key \1 \\\2", text)
        
        # Normalize clef declarations
        text = re.sub(r"\\clef\s+([a-zA-Z]+)", r"\\clef \1", text)
        
        return text
    
    def _add_structural_tokens(self, text: str) -> str:
        """Add special tokens to mark musical structure.
        
        Args:
            text: Input text
            
        Returns:
            Text with structural tokens
        """
        # Add key signature tokens
        text = re.sub(
            rf"\\key\s+((?:(?:do|re|mi|fa|sol|la|si)(?:-?(?:diesis|bemolle|doppio-diesis|doppio-bemolle)|d|b)?|[a-g](?:is|es|isis|eses)?)(?:,+|\'*)?(?:\d+\.*)?)\s*\\(major|minor)",
            lambda m: f"{self.special_tokens['key_sig']}{m.group(1)}_{m.group(2)}{self.special_tokens['close_tag']}",
            text
        )
        
        # Add time signature tokens
        text = re.sub(
            r"\\time\s+(\d+/\d+)",
            lambda m: f"{self.special_tokens['time_sig']}{m.group(1)}{self.special_tokens['close_tag']}",
            text
        )
        
        # Add tempo tokens
        text = re.sub(
            r"\\tempo\s+((?:\"[^\"]+\"\s*\d*(?:\.)?\s*=\s*\d+)|(?:\"[^\"]+\")|(\d+(?:\.)?\s*=\s*\d+))",
            lambda m: f"{self.special_tokens['tempo']}{m.group(1).strip()}{self.special_tokens['close_tag']}",
            text
        )

        # Add clef tokens
        text = re.sub(
            r"\\clef\s+([a-zA-Z]+)",
            lambda m: f"{self.special_tokens['clef']}{m.group(1).strip()}{self.special_tokens['close_tag']}",
            text
        )

        # Add repeat tokens
        text = re.sub(
            r'\\repeat\s+unfold\s+(\d+)\s*(\{.+?\})',
            lambda m: f"{self.special_tokens['repeat_unfold']}{m.group(1).strip()}{m.group(2).strip()}{self.special_tokens['close_tag']}",
            text,
            
        )
        
        # Add measure separators (simple heuristic based on bar lines)
        text = re.sub(r"\|", f" {self.special_tokens['measure_sep']} ", text)
        
        return text
    
    def _tokenize_text(self, text: str) -> Dict[str, Any]:
        """Tokenize preprocessed text.
        
        Args:
            text: Preprocessed text
            
        Returns:
            Tokenization results
        """
        # Tokenize with the model tokenizer
        tokenized = self.tokenizer(
            text,
            truncation=True,
            max_length=self.max_sequence_length,
            padding=False,
            return_tensors="pt"
        )
        
        return {
            "input_ids": tokenized["input_ids"].squeeze().tolist(),
            "attention_mask": tokenized["attention_mask"].squeeze().tolist(),
            "token_count": len(tokenized["input_ids"].squeeze()),
            "truncated": len(tokenized["input_ids"].squeeze()) >= self.max_sequence_length
        }
    
    def create_training_data(
        self,
        processed_files: List[Dict[str, Any]],
        split_ratio: Tuple[float, float, float] = (0.8, 0.1, 0.1),
        min_sequence_length: int = 50
    ) -> Dict[str, List[Dict[str, Any]]]:
        """Create training, validation, and test splits.
        
        Args:
            processed_files: List of processed file data
            split_ratio: Tuple of (train, val, test) ratios
            min_sequence_length: Minimum sequence length to include
            
        Returns:
            Dictionary with train/val/test splits
        """
        # Filter by minimum length
        valid_files = []
        for file_data in processed_files:
            if self.tokenizer and file_data.get("tokenized"):
                length = file_data["tokenized"]["token_count"]
            else:
                length = len(file_data["text"].split())
            
            if length >= min_sequence_length:
                valid_files.append(file_data)
        
        logger.info(f"Filtered to {len(valid_files)} valid files from {len(processed_files)}")
        
        # Shuffle and split
        import random
        random.shuffle(valid_files)
        
        n_files = len(valid_files)
        train_end = int(n_files * split_ratio[0])
        val_end = train_end + int(n_files * split_ratio[1])
        
        splits = {
            "train": valid_files[:train_end],
            "validation": valid_files[train_end:val_end],
            "test": valid_files[val_end:]
        }
        
        logger.info(f"Created splits: train={len(splits['train'])}, "
                   f"val={len(splits['validation'])}, test={len(splits['test'])}")
        
        return splits
    
    def save_preprocessed_data(
        self,
        data: Dict[str, Any],
        output_path: str,
        format: str = "json"
    ) -> None:
        """Save preprocessed data to file.
        
        Args:
            data: Data to save
            output_path: Output file path
            format: Save format ("json" or "pickle")
        """
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        if format == "json":
            with open(output_path, 'w', encoding='utf-8') as f:
                json.dump(data, f, ensure_ascii=False, indent=2)
        elif format == "pickle":
            with open(output_path, 'wb') as f:
                pickle.dump(data, f)
        else:
            raise ValueError(f"Unsupported format: {format}")
        
        logger.info(f"Saved preprocessed data to {output_path}")
    
    def get_vocabulary_stats(
        self,
        processed_files: List[Dict[str, Any]]
    ) -> Dict[str, Any]:
        """Get vocabulary statistics from processed files.
        
        Args:
            processed_files: List of processed file data
            
        Returns:
            Vocabulary statistics
        """
        all_tokens = []
        token_counts = {}
        
        for file_data in processed_files:
            text = file_data["text"]
            tokens = text.split()
            all_tokens.extend(tokens)
            
            for token in tokens:
                token_counts[token] = token_counts.get(token, 0) + 1
        
        vocab_size = len(token_counts)
        total_tokens = len(all_tokens)
        
        # Get most common tokens
        sorted_tokens = sorted(token_counts.items(), key=lambda x: x[1], reverse=True)
        
        return {
            "vocabulary_size": vocab_size,
            "total_tokens": total_tokens,
            "unique_tokens": vocab_size,
            "most_common_tokens": sorted_tokens[:50],
            "token_frequency_distribution": token_counts
        }