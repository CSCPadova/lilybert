\version "@TOPLEVEL_VERSION@"
% automatically converted by musicxml2ly from /nfsd/voce/machine_learning/datasets/pdmx/PDMX/mxl/0a1a2c31-7aa1-4e34-9334-5d4858321336.mxl
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Golden Tresses -- Hornpipe"
  composer = "Music21"
  "id: software" = "music21 v.9.9.1"
  "id: encoding-date" = "2026-03-01"
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
PartPOneVoiceOne = \relative f' {
  \clef "treble" \numericTimeSignature \time 2/2 \key bes \major f4 -\markup
  \bold \U bes,8. [ \U f'16 ] \U d8. [ \U bes'16 \U f8. \U d'16 ] | % 1
  \D bes8. [ \D f'16 \D d8. \D f16 ] \D bes8. [ \D f16 \D d8. \D f16 ] | % 2
  \D bes,8. [ \D d16 \D es8. \D g16 ] \D c,8. [ \D es16 \D a,8. \D c16 ] | % 3
  \U f,8. [ \U c'16 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U c8 \U b8 \U c8 ] }
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D es8 [ \D d8 \D c8 }
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D bes8 \D a8 \D g8 ] }
  | % 4
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U f8 [ \U es8 \U c8 }
  \U bes!8. \U f'16 ] \U d8. [ \U bes'16 \U f8. \U d'16 ] | % 5
  \D bes8. [ \D f'16 \D d8. \D f16 ] \D bes8. [ \D f16 \D d8. \D f16 ] | % 6
  \D bes,8. [ \D d16 \D es8. \D g16 ] \D c,8. [ \D es16 \D a,8. \D c16 ] | % 7
  \U f,8. [ \U a16 ] bes4 <f d'>4 <d bes'>4 | % 8
  \numericTimeSignature \time 2/2 \key bes \major f4 \U bes,8. [ \U f'16 ] \U d8.
  [ \U bes'16 \U f8. \U d'16 ] | % 9

  \barNumberCheck #10
  \D bes8. [ \D f'16 \D d8. \D f16 ] \D bes8. [ \D f16 \D d8. \D f16 ] | % 10
  \D bes,8. [ \D d16 \D es8. \D g16 ] \D c,8. [ \D es16 \D a,8. \D c16 ] | % 11
  \U f,8. [ \U c'16 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U c8 \U b8 \U c8 ] }
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D es8 [ \D d8 \D c8 }
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D bes8 \D a8 \D g8 ] }
  | % 12
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U f8 [ \U es8 \U c8 }
  \U bes!8. \U f'16 ] \U d8. [ \U bes'16 \U f8. \U d'16 ] | % 13
  \D bes8. [ \D f'16 \D d8. \D f16 ] \D bes8. [ \D f16 \D d8. \D f16 ] | % 14
  \D bes,8. [ \D d16 \D es8. \D g16 ] \D c,8. [ \D es16 \D a,8. \D c16 ] | % 15
  \U f,8. [ \U a16 ] bes4 <f d'>4 <d bes'>4 | % 16
  f'4 bes4 \U bes,,8. [ \U d16 \U f8. \U bes16 ] | % 17
  \D d8. [ \D bes'16 ] g4 \U c,,8. [ \U es16 \U bes'8. \U c16 ] | % 18
  \D es8. [ \D g16 ] f4 \U a,,8. [ \U c16 \U f8. \U a16 ] | % 19

  \barNumberCheck #20
  \D c8. [ \D f16 \D d8. \D f16 ] \D bes,8. [ \D d16 \D f,8. \D bes16 ] | % 20
  \U d,8. [ \U f16 ] bes'4 \U bes,,8. [ \U d16 \U f8. \U bes16 ] | % 21
  \D d8. [ \D bes'16 ] g4 \U c,,8. [ \U es16 \U bes'8. \U c16 ] | % 22
  \D es8. [ \D g16 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D c,8 \D b8 \D c8 ] }
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D es8 [ \D d8 \D c8 }
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D bes8 \D a8 \D g8 ] }
  | % 23
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U f8 [ \U g8 \U a8 ] }
  bes4 <f d'>4 <d bes'>4 | % 24
  f'4 bes4 \U bes,,8. [ \U d16 \U f8. \U bes16 ] | % 25
  \D d8. [ \D bes'16 ] g4 \U c,,8. [ \U es16 \U bes'8. \U c16 ] | % 26
  \D es8. [ \D g16 ] f4 \U a,,8. [ \U c16 \U f8. \U a16 ] | % 27
  \D c8. [ \D f16 \D d8. \D f16 ] \D bes,8. [ \D d16 \D f,8. \D bes16 ] | % 28
  \U d,8. [ \U f16 ] bes'4 \U bes,,8. [ \U d16 \U f8. \U bes16 ] | % 29

  \barNumberCheck #30
  \D d8. [ \D bes'16 ] g4 \U c,,8. [ \U es16 \U bes'8. \U c16 ] | % 30
  \D es8. [ \D g16 \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D c,8 \D b8 \D c8 ] }
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D es8 [ \D d8 \D c8 }
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \D bes8 \D a8 \D g8 ] }
  | % 31
  \tweak TupletBracket.direction #UP \tuplet 3/2 {
    \U f8 [ \U g8 \U a8 ] }
  bes4 <f d'>4 <d bes'>4 \bar "|."
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
