\version "@TOPLEVEL_VERSION@"
% automatically converted by musicxml2ly from /nfsd/voce/machine_learning/datasets/pdmx/PDMX/mxl/0a0ca4ef-b5d5-4e99-94ad-8500deece021.mxl
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "The Hare's Maggot"
  composer = "Music21"
  "id: software" = "music21 v.9.9.1"
  "id: encoding-date" = "2026-03-01"
}
#(set-global-staff-size 19.916929133858268)
\paper {
}
\layout {
  \context {
    \Score
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative e'' {
  \clef "treble" \time 3/2 e2 -\markup \bold a,2 a'2 | % 1
  \D g8 [ \D a8 ] b4 e,4 as4 a2 | % 2
  e4 \D g8 [ \D f8 ] e4 g4 e4 c4 | % 3
  d4 g2 d4 b4 g4 | % 4
  c4 e4 f2 e4 f4 | % 5
  d1 c2 | % 6
  e4 c2 e4 g4 e4 | % 7
  d4 b2 d4 g4 d4 | % 8
  c4 e4 a,4 c4 e,4 a4 | % 9

  \barNumberCheck #10
  as2. a4 b2 | % 10
  c4 e2 b4 c4 a4 | % 11
  fis'4 b2 fis!4 as4 e4 | % 12
  a!4 e4 \D f!8 [ \D e8 ] d4 \D e8 [ \D d8 ] c4 | % 13
  c2 b4 a2 \bar "|."
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
