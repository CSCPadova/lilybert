"""LilyPond music notation parser and utilities."""

import re
import logging
from typing import List, Dict, Tuple, Optional, Any
from dataclasses import dataclass
from pathlib import Path

logger = logging.getLogger(__name__)


@dataclass
class LilyPondElement:
    """Represents a parsed LilyPond element."""
    type: str  # note, chord, rest, directive, etc.
    content: str  # raw content
    duration: Optional[str] = None
    pitch: Optional[str] = None
    octave: Optional[int] = None
    attributes: Optional[Dict[str, Any]] = None


class LilyPondParser:
    """Parser for LilyPond music notation files.
    
    This class handles parsing and basic analysis of LilyPond (.ly) files,
    extracting musical elements for training data preparation.
    """
    
    # Common LilyPond patterns
    NOTE_PATTERN = re.compile(r'([a-g](?:is|es)?(?:\,+|\'*)?(?:\d+\.*)?)(?:\s|$)')
    CHORD_PATTERN = re.compile(r'<([^>]+)>(\d+\.?)?')
    REST_PATTERN = re.compile(r'(r\d+\.?)')
    DURATION_PATTERN = re.compile(r'(\d+\.?)')
    DIRECTIVE_PATTERN = re.compile(r'\\([a-zA-Z]+)(?:\s+([^\\{}\n]*))?')
    
    def __init__(self):
        """Initialize the LilyPond parser."""
        self.elements = []
        self.metadata = {}
    
    def parse_file(self, file_path: str) -> List[LilyPondElement]:
        """Parse a LilyPond file.
        
        Args:
            file_path: Path to the .ly file
            
        Returns:
            List of parsed LilyPond elements
        """
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            return self.parse_content(content)
        except Exception as e:
            logger.error(f"Error parsing file {file_path}: {e}")
            return []
    
    def parse_content(self, content: str) -> List[LilyPondElement]:
        """Parse LilyPond content string.
        
        Args:
            content: LilyPond notation content
            
        Returns:
            List of parsed elements
        """
        self.elements = []
        self.metadata = {}
        
        # Remove comments
        content = self._remove_comments(content)
        
        # Extract metadata (header block)
        self.metadata = self._extract_metadata(content)
        
        # Find music blocks
        music_blocks = self._extract_music_blocks(content)
        
        # Parse each music block
        for block in music_blocks:
            self.elements.extend(self._parse_music_block(block))
        
        return self.elements
    
    def _remove_comments(self, content: str) -> str:
        """Remove comments from LilyPond content."""
        # Remove line comments
        content = re.sub(r'%.*?$', '', content, flags=re.MULTILINE)
        # Remove block comments
        content = re.sub(r'%\{.*?\%\}', '', content, flags=re.DOTALL)
        return content
    
    def _extract_metadata(self, content: str) -> Dict[str, str]:
        """Extract metadata from header block."""
        metadata = {}
        
        # Find header block
        header_match = re.search(r'\\header\s*\{(.*?)\}', content, re.DOTALL)
        if header_match:
            header_content = header_match.group(1)
            
            # Extract key-value pairs
            for match in re.finditer(r'(\w+)\s*=\s*"([^"]*)"', header_content):
                key, value = match.groups()
                metadata[key] = value
        
        return metadata
    
    def _extract_music_blocks(self, content: str) -> List[str]:
        """Extract music notation blocks."""
        blocks = []
        
        # Simple heuristic: find blocks between { }
        brace_level = 0
        current_block = ""
        in_music = False
        
        for char in content:
            if char == '{':
                brace_level += 1
                if brace_level == 1 and not in_music:
                    in_music = True
                    current_block = ""
                elif in_music:
                    current_block += char
            elif char == '}':
                if in_music and brace_level == 1:
                    blocks.append(current_block.strip())
                    in_music = False
                elif in_music:
                    current_block += char
                brace_level = max(0, brace_level - 1)
            elif in_music:
                current_block += char
        
        return blocks
    
    def _parse_music_block(self, block: str) -> List[LilyPondElement]:
        """Parse a single music block."""
        elements = []
        
        # Remove extra whitespace and newlines
        block = re.sub(r'\s+', ' ', block).strip()
        
        # Tokenize the block
        tokens = self._tokenize_music(block)
        
        for token in tokens:
            element = self._parse_token(token)
            if element:
                elements.append(element)
        
        return elements
    
    def _tokenize_music(self, block: str) -> List[str]:
        """Tokenize music block into individual elements."""
        # This is a simplified tokenization
        # In practice, you might need more sophisticated parsing
        
        tokens = []
        current_token = ""
        
        i = 0
        while i < len(block):
            char = block[i]
            
            # Handle chords
            if char == '<':
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                
                # Find matching >
                end_pos = block.find('>', i)
                if end_pos != -1:
                    # Include duration after chord if present
                    chord_end = end_pos + 1
                    while (chord_end < len(block) and 
                           (block[chord_end].isdigit() or block[chord_end] == '.')):
                        chord_end += 1
                    tokens.append(block[i:chord_end])
                    i = chord_end
                    continue
            
            # Handle directives
            elif char == '\\':
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                
                # Find end of directive
                j = i + 1
                while j < len(block) and (block[j].isalnum() or block[j] == '_'):
                    j += 1
                tokens.append(block[i:j])
                i = j
                continue
            
            # Handle spaces as token separators
            elif char.isspace():
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                i += 1
                continue
            
            else:
                current_token += char
                i += 1
        
        # Add last token
        if current_token.strip():
            tokens.append(current_token.strip())
        
        return [t for t in tokens if t]
    
    def _parse_token(self, token: str) -> Optional[LilyPondElement]:
        """Parse a single token into a LilyPond element."""
        # Check for chords
        chord_match = self.CHORD_PATTERN.match(token)
        if chord_match:
            notes = chord_match.group(1)
            duration = chord_match.group(2)
            return LilyPondElement(
                type="chord",
                content=token,
                duration=duration,
                attributes={"notes": notes.split()}
            )
        
        # Check for rests
        rest_match = self.REST_PATTERN.match(token)
        if rest_match:
            duration_match = self.DURATION_PATTERN.search(token)
            duration = duration_match.group(1) if duration_match else None
            return LilyPondElement(
                type="rest",
                content=token,
                duration=duration
            )
        
        # Check for directives
        if token.startswith('\\'):
            directive_match = self.DIRECTIVE_PATTERN.match(token)
            if directive_match:
                return LilyPondElement(
                    type="directive",
                    content=token,
                    attributes={"directive": directive_match.group(1)}
                )
        
        # Check for notes
        note_match = self.NOTE_PATTERN.match(token)
        if note_match:
            note_content = note_match.group(1)
            pitch, octave, duration = self._parse_note_components(note_content)
            return LilyPondElement(
                type="note",
                content=token,
                pitch=pitch,
                octave=octave,
                duration=duration
            )
        
        # Default: treat as raw content
        return LilyPondElement(
            type="raw",
            content=token
        )
    
    def _parse_note_components(self, note: str) -> Tuple[str, Optional[int], Optional[str]]:
        """Parse note components (pitch, octave, duration)."""
        # Extract pitch (note name + accidental)
        pitch_match = re.match(r'([a-g](?:is|es)?)', note)
        pitch = pitch_match.group(1) if pitch_match else None
        
        # Extract octave indicators
        octave = None
        if "'" in note:
            octave = note.count("'")
        elif "," in note:
            octave = -note.count(",")
        
        # Extract duration
        duration_match = self.DURATION_PATTERN.search(note)
        duration = duration_match.group(1) if duration_match else None
        
        return pitch, octave, duration
    
    def get_statistics(self) -> Dict[str, Any]:
        """Get statistics about parsed content."""
        stats = {
            "total_elements": len(self.elements),
            "element_types": {},
            "note_count": 0,
            "chord_count": 0,
            "rest_count": 0,
            "unique_pitches": set(),
            "durations": set(),
        }
        
        for element in self.elements:
            # Count element types
            if element.type not in stats["element_types"]:
                stats["element_types"][element.type] = 0
            stats["element_types"][element.type] += 1
            
            # Count specific types
            if element.type == "note":
                stats["note_count"] += 1
                if element.pitch:
                    stats["unique_pitches"].add(element.pitch)
                if element.duration:
                    stats["durations"].add(element.duration)
            elif element.type == "chord":
                stats["chord_count"] += 1
                if element.duration:
                    stats["durations"].add(element.duration)
            elif element.type == "rest":
                stats["rest_count"] += 1
                if element.duration:
                    stats["durations"].add(element.duration)
        
        # Convert sets to lists for JSON serialization
        stats["unique_pitches"] = list(stats["unique_pitches"])
        stats["durations"] = list(stats["durations"])
        
        return stats
    
    def to_sequence(self, include_metadata: bool = True) -> str:
        """Convert parsed elements back to a sequence format.
        
        Args:
            include_metadata: Whether to include metadata in output
            
        Returns:
            String representation of the music sequence
        """
        parts = []
        
        if include_metadata and self.metadata:
            # Add metadata as special tokens
            for key, value in self.metadata.items():
                parts.append(f"<{key}:{value}>")
        
        # Add music elements
        for element in self.elements:
            parts.append(element.content)
        
        return " ".join(parts)