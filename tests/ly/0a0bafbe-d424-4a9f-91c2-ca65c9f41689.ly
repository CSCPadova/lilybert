\version "@TOPLEVEL_VERSION@"
% automatically converted by musicxml2ly from /nfsd/voce/machine_learning/datasets/pdmx/PDMX/mxl/0a0bafbe-d424-4a9f-91c2-ca65c9f41689.mxl
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Swallowtail, The Dancing Master"
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
PartPOneVoiceOne = \relative e' {
  \clef "treble" \time 6/8 \key d \major \U e8 [ -\markup \bold \U fis8 \U g8 ]
  \U e8 [ \U e8 \U b'8 ] | % 1
  \U e,8 [ \U e8 \U g8 ] \U e8 [ \U e8 \U b'8 ] | % 2
  \U a8 [ \U g8 \U fis8 ] \U d8 [ \U d8 \U a'8 ] | % 3
  \U d,8 [ \U d8 \U d'8 ] \D e8 [ \D d8 \D c8 ] | % 4
  \U a8 [ \U fis8 \U g8 ] \U e8 [ \U e8 \U b'8 ] | % 5
  \U e,8 [ \U e8 \U g8 ] \U e8 [ \U e8 \U b'8 ~ ] | % 6
  \D b8 [ \D cis8 \D d8 ] \D e8 [ \D d8 \D c8 ] | % 7
  \U a8 [ \U fis8 \U g8 ] \U e8 [ \U e8 \U e8 ~ ] | % 8
  \U e8 [ \key d \major \time 6/8 \U e8 \U fis8 ] \U g8 [ \U e8 \U e8 ] | % 9

  \barNumberCheck #10
  \time 6/8 \U b'8 [ \U e,8 \U e8 ] \U g8 [ \U e8 \U e8 ] | % 10
  \U b'8 [ \U a8 \U g8 ] \U fis8 [ \U d8 \U d8 ] | % 11
  \U a'8 [ \U d,8 \U d8 ] \D d'8 [ \D e8 \D d8 ] | % 12
  \U c8 [ \U a8 \U fis8 ] \U g8 [ \U e8 \U e8 ] | % 13
  \U b'8 [ \U e,8 \U e8 ] \U g8 [ \U e8 \U e8 ] | % 14
  b'4 cis8 \D d8 [ \D e8 \D d8 ] | % 15
  \U c8 [ \U a8 \U fis8 ] \U g8 [ \U e8 \U e8 ] | % 16
  e4 b'8 \D cis!8 [ \D d8 \D e8 ~ ] | % 17
  \D e8 [ \D fis8 ] e4 \D fis8 [ \D e8 ] | % 18
  \D d8 [ \D cis8 \D b8 ] \D cis8 [ \D d8 \D e8 ~ ] | % 19

  \barNumberCheck #20
  \D e8 [ \D fis8 \D e8 ] \D d8 [ \D cis8 \D d8 ~ ] | % 20
  d4 b8 \D cis8 [ \D d8 \D e8 ] | % 21
  \D fis8 [ \D e8 \D e8 ] \D fis8 [ \D e8 \D e8 ] | % 22
  \D d8 [ \D cis8 \D d8 ] \D e8 [ \D d8 \D c8 ] | % 23
  \U a8 [ \U fis8 \U g8 ] \U e8 [ \U e8 \U e8 ~ ] | % 24
  \U e8 [ \key d \major \time 6/8 \U e8 \U fis8 ] \U g8 [ \U e8 \U e8 ] | % 25
  \time 6/8 \U b'8 [ \U e,8 \U e8 ] \U g8 [ \U e8 \U e8 ] | % 26
  \U b'8 [ \U a8 \U g8 ] \U fis8 [ \U d8 \U d8 ] | % 27
  \U a'8 [ \U d,8 \U d8 ] \D d'8 [ \D e8 \D d8 ] | % 28
  \U c8 [ \U a8 \U fis8 ] \U g8 [ \U e8 \U e8 ] | % 29

  \barNumberCheck #30
  \U b'8 [ \U e,8 \U e8 ] \U g8 [ \U e8 \U e8 ] | % 30
  b'4 cis8 \D d8 [ \D e8 \D d8 ] | % 31
  \U c8 [ \U a8 \U fis8 ] \U g8 [ \U e8 \U e8 ] | % 32
  e4 b'8 \D cis!8 [ \D d8 \D e8 ~ ] | % 33
  \D e8 [ \D fis8 ] e4 \D fis8 [ \D e8 ] | % 34
  \D d8 [ \D cis8 \D b8 ] \D cis8 [ \D d8 \D e8 ~ ] | % 35
  \D e8 [ \D fis8 \D e8 ] \D d8 [ \D cis8 \D d8 ~ ] | % 36
  d4 b8 \D cis8 [ \D d8 \D e8 ] | % 37
  \D fis8 [ \D e8 \D e8 ] \D fis8 [ \D e8 \D e8 ] | % 38
  \D d8 [ \D cis8 \D d8 ] \D e8 [ \D d8 \D c8 ] | % 39

  \barNumberCheck #40
  \U a8 [ \U fis8 \U g8 ] \U e8 [ \U e8 \U e8 ~ ] | % 40
  e8 \bar "|."
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
