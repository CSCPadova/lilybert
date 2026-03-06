\version "@TOPLEVEL_VERSION@"
% automatically converted by musicxml2ly from /nfsd/voce/machine_learning/datasets/pdmx/PDMX/mxl/00a01a21-e760-475e-ba61-a7e1bb919d3b.mxl
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Jennie Rock the Cradle"
  composer = "Music21"
  "id: software" = "music21 v.9.9.1"
  "id: encoding-date" = "2026-02-28"
}
#(set-global-staff-size 19.916929133858268)
\paper {
}
\layout {
  \context {
    \Staff
    printKeyCancellation = ##f
  }
  \context {
    \Score
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative a' {
  \clef "treble" \numericTimeSignature \time 2/2 \key d \major \tweak
  TupletBracket.direction #UP \tuplet 3/2 {
    \U a8 [ -\markup \bold \U b8 \U cis8 }
  \U d8 \U a8 ] \U fis8 [ \U a8 \U d,8 \U a'8 ] | % 1
  \U fis8 [ \U a8 \U d8 \U a8 ] \U fis8 [ \U g8 ] a4 | % 2
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U a8 [ \U b8 \U cis8 }
  \U d8 \U a8 ] \U fis8 [ \U a8 \U d,8 \U a'8 ] | % 3
  \U fis8 [ \U a8 \U g8 \U fis8 ] \U e8 [ \U fis8 ] g4 | % 4
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U a8 [ \U b8 \U cis8 }
  \U d8 \U a8 ] \U fis8 [ \U a8 \U d,8 \U a'8 ] | % 5
  \U fis8 [ \U a8 \U d8 \U a8 ] \U fis8 [ \U a8 ] a4 | % 6
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U a8 [ \U b8 \U cis8 }
  \U d8 \U b8 ] \U cis8 [ \U a8 \U b8 \U g8 ] | % 7
  \U a8 [ \U fis8 \U g8 \U fis8 ] \U e8 [ \U fis8 ] g4 | % 8
  \U a8 [ \U g8 \U d8 \U fis8 ] \U a8 [ \U cis8 \U b8 \U g8 ] | % 9

  \barNumberCheck #10
  \U a8 [ \U fis8 \U d8 \U fis8 ] \U a8 [ \U b8 ] a4 | % 10
  \U a8 [ \U fis8 \U d8 \U fis8 ] \U a8 [ \U cis8 \U b8 \U g8 ] | % 11
  \U a8 [ \U fis8 \U g8 \U fis8 ] \U e8 [ \U fis8 ] g4 | % 12
  \U fis8 [ \U e8 \U d8 \U fis8 ] \U a8 [ \U cis8 \U b8 \U g8 ] | % 13
  \U a8 [ \U fis8 \U d8 \U fis8 ] \U a8 [ \U b8 ] a4 | % 14
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U a8 [ \U b8 \U cis8 }
  \U d8 \U b8 ] \U cis8 [ \U a8 \U b8 \U g8 ] | % 15
  \U a8 [ \U fis8 \U g8 \U fis8 ] \U e8 [ \U fis8 ] g4 | % 16
  \U a8 [ \U g8 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U fis8 \U e8 \U d8 ] }
  \U a'8 [ \U d,8 \U b'8 \U d,8 ] | % 17
  \U a'8 [ \U d,8 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U fis8 \U e8 \U d8 ] }
  \U a'8 [ \U d,8 ] a'4 | % 18
  \U a8 [ \U g8 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U fis8 \U e8 \U d8 ] }
  \U a'8 [ \U d,8 \U b'8 \U d,8 ] | % 19

  \barNumberCheck #20
  \U a'8 [ \U d,8 \U g8 \U fis8 ] \U e8 [ \U fis8 ] g4 | % 20
  \U a8 [ \U g8 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U fis8 \U e8 \U d8 ] }
  \U a'8 [ \U d,8 \U b'8 \U d,8 ] | % 21
  \U a'8 [ \U d,8 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U fis8 \U e8 \U d8 ] }
  \U a'8 [ \U d,8 ] a'4 | % 22
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U a8 [ \U b8 \U cis8 }
  \U d8 \U b8 ] \U cis8 [ \U a8 \U b8 \U g8 ] | % 23
  \U a8 [ \U fis8 \U g8 \U fis8 ] \U e8 [ \U fis8 ] g4 \bar "|."
}


% The score definition
\score {
  <<
    \new Staff = "P1" <<
      \set Staff.shortInstrumentName = "Pno"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {
          \PartPOneVoiceOne
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 120 }
}
