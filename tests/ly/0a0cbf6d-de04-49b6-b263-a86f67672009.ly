\version "@TOPLEVEL_VERSION@"
% automatically converted by musicxml2ly from /nfsd/voce/machine_learning/datasets/pdmx/PDMX/mxl/0a0cbf6d-de04-49b6-b263-a86f67672009.mxl
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Scattery Island"
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
PartPOneVoiceOne = \relative fis' {
  \clef "treble" \time 12/8 \key d \major fis4 -\markup \bold a8 d4 fis8 fis,4 a8
  d4 fis8 | % 1
  e4 a,8 \D cis8 [ \D b8 \D a8 ] e'4 a,8 \D cis8 [ \D b8 \D a8 ] | % 2
  fis4 a8 d4 fis8 fis,4 a8 d4 fis8 | % 3
  e4 a,8 \D cis8 [ \D b8 \D a8 ] b4 cis8 d4. | % 4
  \time 12/8 \key d \major fis,4 a8 d4 fis8 fis,4 a8 d4 fis8 | % 5
  e4 a,8 \D cis8 [ \D b8 \D a8 ] e'4 a,8 \D cis8 [ \D b8 \D a8 ] | % 6
  fis4 a8 d4 fis8 fis,4 a8 d4 fis8 | % 7
  e4 a,8 \D cis8 [ \D b8 \D a8 ] b4 cis8 d4. | % 8
  a'4. fis4 e8 d4. \D d8 [ \D e8 \D fis8 ] | % 9

  \barNumberCheck #10
  g4 fis8 e4 d8 \D b8 [ \D cis8 \D d8 ] \D e8 [ \D fis8 \D g8 ] | % 10
  \D a8 [ \D g8 \D a8 ] fis4 e8 d4 cis8 \D d8 [ \D e8 \D fis8 ] | % 11
  e4 a,8 \D cis8 [ \D b8 \D a8 ] b4 cis8 d4. | % 12
  a'4. fis4 e8 d4. \D d8 [ \D e8 \D fis8 ] | % 13
  g4 fis8 e4 d8 \D b8 [ \D cis8 \D d8 ] \D e8 [ \D fis8 \D g8 ] | % 14
  \D a8 [ \D g8 \D a8 ] fis4 e8 d4 cis8 \D d8 [ \D e8 \D fis8 ] | % 15
  e4 a,8 \D cis8 [ \D b8 \D a8 ] b4 cis8 d4. \bar "|."
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
