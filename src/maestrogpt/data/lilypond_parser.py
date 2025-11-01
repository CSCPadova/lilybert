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
    type: str  # note, chord, rest, directive, raw, etc.
    content: str  # raw content
    duration: Optional[str] = None # <--- Duration is not an LP Element itself, but an attribute within an LP element, and used in statistics
    pitch: Optional[str] = None
    octave: Optional[int] = None
    attributes: Optional[Dict[str, Any]] = None


class LilyPondParser:
    """Parser for LilyPond music notation files.
    
    This class handles parsing and basic analysis of LilyPond (.ly) files,
    extracting musical elements for training data preparation.
    """
    
    # Common LilyPond patterns
    english_notes = r"[a-g]"
    english_accidentals = r"(?:is|es|isis|eses)?"

    italian_notes = r"(?:do|re|mi|fa|sol|la|si)"
    italian_accidentals = r"(?:-?(?:diesis|bemolle|doppio-diesis|doppio-bemolle)|d|b)?"
    octaves = r"(?:,+|\'*)?"
    durations = r"(?:\d+\.*)?"

    ENGLISH_NOTE_PATTERN = re.compile(
        r'(?<![a-zA-Z])'            # no letter before (prevents matching inside words)
        r'([a-g]'                    # base note
        r'(?:is|es|isis|eses)?'      # optional accidentals (is/es/isis/eses)
        r"(?:'+|,+)?"                # optional octave markers
        r'(?:\d+\.*)?'               # optional duration (e.g. 4 or 8.)
        r')(?![a-zA-Z])'             # no letter after (prevents 'cat' etc.)
    )

    # --- Italian Note Pattern ---
    ITALIAN_NOTE_PATTERN = re.compile(
        r'(?<![a-zA-Z])'                # no letter before
        r'((?:do|re|mi|fa|sol|la|si)'   # base note names
        r'(?:-?(?:diesis|bemolle|doppio-diesis|doppio-bemolle)|d|b)?'  # optional accidentals
        r"(?:'+|,+)?"                   # optional octave markers
        r'(?:\d+\.*)?'                  # optional duration
        r')(?![a-zA-Z])'                # no letter after
    )
    NOTE_PATTERN = re.compile(fr'({ITALIAN_NOTE_PATTERN.pattern}|{ENGLISH_NOTE_PATTERN.pattern})')

    CHORD_PATTERN = re.compile(r'<([^>]+)>(\d+\.?)?')
    SIMULTANEOUS_PATTERN = re.compile(r'<<(.*)>>(\d+\.?)?')
    DURATION_PATTERN = re.compile(r'(\d+\.?)') 
    REST_PATTERN = re.compile(r'(?:(?<![a-zA-Z])r\d*\.?|\\rest)(?![a-zA-Z])')
    DIRECTIVE_PATTERN = re.compile(r'\\([a-zA-Z]+)(?:\s+([^\\{}\n]*))?')

    KEY_PATTERN = re.compile(rf"\\key\s+((?:(?:do|re|mi|fa|sol|la|si)(?:-?(?:diesis|bemolle|doppio-diesis|doppio-bemolle)|d|b)?|[a-g](?:is|es|isis|eses)?)(?:,+|\'*)?(?:\d+\.*)?)\s*\\(major|minor)")
    TIME_PATTERN = re.compile(r'\\time\s+(\d+/\d+)')
    CLEF_PATTERN = re.compile(r'\\clef\s+([a-zA-Z]+)')
    RELATIVE_PATTERN = re.compile(rf"\\relative\s+{NOTE_PATTERN.pattern}'*\s*{{")
    TEMPO_PATTERN = re.compile(r'\\tempo\s+((?:\"[^\"]+\"\s*\d*(?:\.)?\s*=\s*\d+)|(?:\"[^\"]+\")|(\d+(?:\.)?\s*=\s*\d+))')
    REPEAT_PATTERN = re.compile(r'\\repeat\s+unfold\s+(\d+)\s*\{')
    
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
        header_match = re.search(r'\\header\s*\{', content, re.DOTALL)
        music_content = ''
        if header_match:
          start_idx = header_match.start()           # start of \header
          end_idx = header_match.end() - 1           # position of the opening {
          header_content = self.parse_enclosure(content[end_idx:],"{","}")
          # Remove the entire header block from content
          music_content = content[:start_idx] + content[end_idx + len(header_content):]
        else:
          music_content = content
        music_blocks = self._extract_music_blocks(music_content)
        
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
    def parse_enclosure(self, s: str, oc: str, ec: str) -> str:
        b_level = 0
        res = ''
        for c in s:
            res += c
            if c == oc:
                b_level += 1 
            if c == ec:
                b_level -= 1
            if b_level == 0:
                break
        return res
    
    
    def _extract_metadata(self, content: str) -> Dict[str, str]:
        """Extract metadata from header block."""
        metadata = {}
        
        # Find header block
        header_match = re.search(r'\\header\s*\{', content, re.DOTALL)
        if header_match:
            starting_idx = header_match.end() - 1
            header_content = self.parse_enclosure(content[starting_idx:],"{","}")
            # Extract key-value pairs
            for match in re.finditer(r'(\w+)\s*=\s*(?:\\markup\s*(?:(?:\\[a-zA-Z,_,-]+)+)?\s*\{\s*\"([^\"]*)\"\}|\"([^\"]*)\")', header_content):
                key = match.group(1)
                value = match.group(2) or match.group(3)
                metadata[key] = value
        print(f"Metadata is: {metadata}")
        return metadata
    
    def _extract_music_blocks(self, content: str) -> List[str]:
        """Extract LilyPond music notation blocks inside \relative commands."""
        blocks = []
        i = 0
        brace_level = 0
        in_music = False
        current_block = ""

        while i < len(content):
            # Try to match a \relative pattern at current position
            match = self.RELATIVE_PATTERN.match(content, i)
            if match:
                in_music = True
                brace_level = 1  # The opening brace belongs to this block
                current_block = ""
                i = match.end()  # Move past the opening '{'
                continue

            char = content[i]

            if in_music:
                if char == '{':
                    brace_level += 1
                    current_block += char
                elif char == '}':
                    brace_level -= 1
                    if brace_level == 0:
                        # End of this \relative block
                        blocks.append(current_block.strip())
                        in_music = False
                        current_block = ""
                    else:
                        current_block += char
                else:
                    current_block += char
            i += 1

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

        # At the very least let it capture musical content --> even if it cannot really parse perfectly
            # In one week if it cannot parse perfectly move on
        # Switch case
        # Add some memory, a buffer of some kind so we can retain memory of previous token
            # List of cases for directives with parameters (white lsit. we KNOW these directives need parameters)
            # Black list wouldn't work. We do not know how all the cases would work
        
        tokens = []
        i = 0
        current_token = ""
        while i < len(block):
             # Handle simultaneous music groupings <<\musicData \forma >>
            if block.startswith("<<", i):
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                '''
                simultaneous_group = "<<" + self.parse_enclosure(block[i+2],"<<",">>")
                tokens.append(simultaneous_group)
                i += len(simultaneous_group)
                '''
                tokens.append("<<")
                i += len("<<")
                continue

            # Handle chords < ... >
            if block[i] == '<':
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                end_pos = block.find('>', i)
                if end_pos != -1:
                    chord = block[i:end_pos+1]
                    # capture possible duration digits after >
                    j = end_pos + 1
                    while j < len(block) and (block[j].isdigit() or block[j] == '.'):
                        chord += block[j]
                        j += 1
                    tokens.append(chord)
                    i = j
                    continue

            # Handle directives with arguments
            elif block.startswith("\\key", i):
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                m = self.KEY_PATTERN.match(block[i:])
                if m:
                    tokens.append(m.group(0))
                    i += len(m.group(0))
                    continue
            elif block.startswith("\\time", i):
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                m = self.TIME_PATTERN.match(block[i:])
                if m:
                    tokens.append(m.group(0))
                    i += len(m.group(0))
                    continue
            elif block.startswith("\\clef", i):
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                m = self.CLEF_PATTERN.match(block[i:])
                if m:
                    tokens.append(m.group(0))
                    i += len(m.group(0))
                    continue
            elif block.startswith("\\tempo", i):
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                m = self.TEMPO_PATTERN.match(block[i:])
                if m:
                    tokens.append(m.group(0))
                    i += len(m.group(0))
                    continue
            elif block.startswith("\\relative", i):
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                m = self.RELATIVE_PATTERN.match(block[i:])
                if m:
                    tokens.append(m.group(0))
                    i += len(m.group(0))
                    continue
            elif block.startswith('\\repeat', i):
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                m = self.REPEAT_PATTERN.match(block[i:])
                if m:
                    after_first_cbracket =  i + m.end() - 1
                    end_pos = after_first_cbracket + len(self.parse_enclosure(block[after_first_cbracket:],"{","}"))
                    if end_pos != -1:
                        tokens.append(block[i:end_pos])
                        i = end_pos
                        continue

            # Handle other directives (\something)
            elif block[i] == '\\':
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                m = re.match(r'^\\[a-zA-Z,_,-]+', block[i:])
                if m:
                    tokens.append(m.group(0))
                    i += len(m.group(0))
                    continue

            # Notes, rests, bars
            m = re.match(rf'(?:{self.NOTE_PATTERN.pattern}|[|]|{self.REST_PATTERN.pattern})', block[i:])
            if m and not current_token.strip():
                tokens.append(m.group(0))
                i += len(m.group(0))
                continue
            # Get raws nested in quotes
            if block[i] == '"':
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                if i+1 < len(block):
                    end_pos = block.find('"', i+1)
                    if end_pos != -1:
                        quote = block[i:end_pos+1]
                        # capture possible duration digits after >
                        tokens.append(quote)
                        i = end_pos+1
                        continue

            # Skip whitespace
            if block[i].isspace():
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                i += 1
                continue
            if block[i] == '{' or block[i] == '[' or block[i]=='(' or block[i]==')' or block[i]==']' or block[i] == "}":
                if current_token.strip():
                    tokens.append(current_token.strip())
                    current_token = ""
                tokens.append(block[i])
                i += 1
                continue
            # Fallback
            current_token += block[i]
            i += 1
        if i == len(block) and current_token.strip():
            tokens.append(current_token)
        return tokens
    
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
            repeat_match = self.REPEAT_PATTERN.search(token)
            if directive_match and not repeat_match:
                return LilyPondElement(
                    type="directive",
                    content=token,
                    attributes={"directive": directive_match.group(1)}
                )
            elif directive_match and repeat_match:
                start_cbracket =  repeat_match.end() - 1
                note_content = self.parse_enclosure(token[start_cbracket:], "{","}")
                notes = re.findall(self.NOTE_PATTERN,note_content)
                multiple = int(repeat_match.group(1))
                return LilyPondElement(
                    type="directive",
                    content=token,
                    attributes={"directive": directive_match.group(1), "note_count": (len(notes)*multiple)}
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
        pitch_match = re.match(r'(?:[a-g](?:is|es)?|(?:do|re|mi|fa|sol|la|si)(?:d|b)?)', note)
        pitch = pitch_match.group(0) if pitch_match else None
        
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
                stats["note_count"] += len(element.attributes["notes"])
                if element.duration:
                    stats["durations"].add(element.duration)
            elif element.type == "rest":
                stats["rest_count"] += 1
                if element.duration:
                    stats["durations"].add(element.duration)
            elif element.type == "directive" and ("note_count" in element.attributes):
                stats["note_count"] += element.attributes["note_count"]
        
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