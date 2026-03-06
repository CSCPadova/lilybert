\version "@TOPLEVEL_VERSION@"
% automatically converted by musicxml2ly from /nfsd/voce/machine_learning/datasets/pdmx/PDMX/mxl/0a0b0897-2f7e-42f9-9739-d4fc114fe574.mxl
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "From the Deeps, to Thee, O Lord"
  copyright = \markup \column {
    \line { "Public Domain" }
    \line { "Courtesy of the Cyber Hymnal™" }
  }
  composer = "Ann Mounsey Bartholomew, 1854"
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
PartPOneVoiceZero = \relative c' {
  \clef "treble" \numericTimeSignature \time 4/4 \key f \major <c f>4 <e g>4 <f
    a>4 <c f>4 | % 1
  <e g>4 <d bes'>4 <cis a'>2 | % 2
  <d a'>4 <d b'>4 <c! c'!>4 <c a'>4 | % 3
  <f b>4 <e d'>4 <e c'>2 | % 4
  <a c>4 <a d>4 <as e'>2 | % 5
  <g b>4 <g c>4 <f d'>2 | % 6
  <e a>4 <d bes'!>4 <c c'>4 <d f>4 | % 7
  <bes g'>4 <c e>4 <a f'>2 | % 8
  \key as \major \oneVoice <f' f>4 <c! cis g' g>4 <c c! as' bes>4 \voiceOne <c ~
    as' ~>4 | % 9

  \barNumberCheck #10
  <c as'>4 <c! as'>4 <cis bes'>4 <es c'>4 | % 10
  <es as>4 <f bes>4 <es cis'>4 <es ~ c' ~>4 | % 11
  <es c'>4 <as c>4 <g cis>4 <as ~ es' ~>4 | % 12
  <as es'>4 <g bes>4 <fis c'!>4 <f ~ cis' ~>4 | % 13
  <f cis'>4 <f as>4 <f bes>4 <e c'>4 | % 14
  <c f>4 <cis f>4 <c e>4 <c ~ f ~>4 | % 15
  <c f>4 <c f>4 <e g>4 <f a>4 | % 16
  <c f>4 <d g>4 <e bes'>4 <f ~ a ~>4 | % 17
  <f a>4 <a! a!>4 <f g b b!>4 <e a! c d>4 | % 18
  \oneVoice <e a>4 r4 \voiceOne <a c>4 <b d>4 | % 19

  \barNumberCheck #20
  <c e>2 <g b>4 <g c>4 | % 20
  <g d'>2 <c, a'>4 <e bes'!>4 | % 21
  <f c'>4 <c f>4 <d g>4 <c e>4 | % 22
  <c f>2 <c f>4. <c f>8 | % 23
  <d f>4 <d f>4 <c f>4 <c e>4 | % 24
  <c f>2 r2 | % 25
  R1 | % 26
  R1 | % 27
  R1 | % 28
  R1 | % 29

  \barNumberCheck #30
  R1 | % 30
  R1 | % 31
  R1 | % 32
  R1 | % 33
  R1 | % 34
  R1 | % 35
  R1 | % 36
  R1 | % 37
  R1 | % 38
  R1 | % 39

  \barNumberCheck #40
  R1 | % 40
  R1 | % 41
  R1 | % 42
  R1 | % 43
  R1 | % 44
  R1 | % 45
  R1 | % 46
  R1 | % 47
  R1 | % 48
  R1 | % 49

  \barNumberCheck #50
  R1 | % 50
  r4 \bar "|."
}

PartPOneVoiceOne = \relative cis' {
  \clef "treble" \numericTimeSignature \time 4/4 \key f \major R1 | % 1
  R1 | % 2
  R1 | % 3
  R1 | % 4
  R1 | % 5
  R1 | % 6
  R1 | % 7
  R1 | % 8
  \key as \major \oneVoice r2. \voiceTwo <cis f>4 | % 9

  \barNumberCheck #10
  R1 | % 10
  R1 | % 11
  R1 | % 12
  R1 | % 13
  R1 | % 14
  R1 | % 15
  R1 | % 16
  R1 | % 17
  R1 | % 18
  \oneVoice <e c'>2 \voiceTwo r2 | % 19

  \barNumberCheck #20
  R1 | % 20
  R1 | % 21
  R1 | % 22
  R1 | % 23
  R1 | % 24
  R1 | % 25
  R1 | % 26
  R1 | % 27
  R1 | % 28
  R1 | % 29

  \barNumberCheck #30
  R1 | % 30
  R1 | % 31
  R1 | % 32
  R1 | % 33
  R1 | % 34
  R1 | % 35
  R1 | % 36
  R1 | % 37
  R1 | % 38
  R1 | % 39

  \barNumberCheck #40
  R1 | % 40
  R1 | % 41
  R1 | % 42
  R1 | % 43
  R1 | % 44
  R1 | % 45
  R1 | % 46
  R1 | % 47
  R1 | % 48
  R1 | % 49

  \barNumberCheck #50
  R1 | % 50
  r4 \bar "|."
}

PartPTwoVoiceZero = \relative f {
  \clef "bass" \numericTimeSignature \time 4/4 \key f \major <f a>4 <c c'>4 <f,
    c''>4 <a a'>4 | % 1
  <c g'>4 <g g'>4 <a e'>2 | % 2
  <d f>4 <d f>4 <e g>4 <f a>4 | % 3
  <d a'>4 <e as>4 <a, a'!>2 | % 4
  <a' e'>4 <f a>4 <e b'>2 | % 5
  <g b>4 <e g>4 <d a'>2 | % 6
  <c a'>4 <bes! f'>4 <a f'>4 <d a'>4 | % 7
  <g, g'>4 <c g'>4 <f, f'>2 | % 8
  \key as \major <as' cis>4 <as c>4 <f as>4 <cis as'>4 | % 9

  \barNumberCheck #10
  <bes g'>4 <c! e>4 <f, f'>2 | % 10
  <f' as>4 <es! g>4 <as, as'>4 <c as'>4 | % 11
  <cis as'>4 <es g>4 <as, as'>2 | % 12
  <as' es'>4 <bes es>4 <c! es>2 | % 13
  <es, es'>4 <as es'>4 <cis, cis'!>2 | % 14
  <cis as'>4 <cis f>4 <c g'>4 <as as'>4 | % 15
  <bes g'>4 <c bes'>4 <f as>2 | % 16
  <f a>4 <c c'>4 <f c'>4 <f a!>4 | % 17
  <bes, g'>4 <c c'>4 <f, c''>2 | % 18
  <f' c'>4 <e e'!>4 <a e'>4 <a! c>4 | % 19

  \barNumberCheck #20
  <d, b'>4 <e as!>4 <a, a'!>2 | % 20
  <a' e'>4 <g g'>4 <c g'>2 | % 21
  <c d f>4 g2 <f a bes>4 | % 22
  <g c>4 <a c>4 <a,! a'!>4 <bes! g'>4 | % 23
  <c g'>4 <f a>2 <es ~ a ~>4 | % 24
  \D <es a>8 [ \D <es a!>8 ] <d bes'>4 <bes bes'>4 <c a'!>4 | % 25
  <c g'>4 <f, a'>2 r4 | % 26
  R1 | % 27
  R1 | % 28
  R1 | % 29

  \barNumberCheck #30
  R1 | % 30
  R1 | % 31
  R1 | % 32
  R1 | % 33
  R1 | % 34
  R1 | % 35
  R1 | % 36
  R1 | % 37
  R1 | % 38
  R1 | % 39

  \barNumberCheck #40
  R1 | % 40
  R1 | % 41
  R1 | % 42
  R1 | % 43
  R1 | % 44
  R1 | % 45
  R1 | % 46
  R1 | % 47
  R1 | % 48
  R1 | % 49

  \barNumberCheck #50
  R1 | % 50
  r4 \bar "|."
}

PartPTwoVoiceOne = \relative e' {
  \clef "bass" \numericTimeSignature \time 4/4 \key f \major R1 | % 1
  R1 | % 2
  R1 | % 3
  R1 | % 4
  R1 | % 5
  R1 | % 6
  R1 | % 7
  R1 | % 8
  \key as \major R1 | % 9

  \barNumberCheck #10
  R1 | % 10
  R1 | % 11
  R1 | % 12
  R1 | % 13
  R1 | % 14
  R1 | % 15
  R1 | % 16
  R1 | % 17
  R1 | % 18
  R1 | % 19

  \barNumberCheck #20
  R1 | % 20
  R1 | % 21
  r4 \D e8 [ \D c8 ] b4 r4 | % 22
  R1 | % 23
  R1 | % 24
  R1 | % 25
  R1 | % 26
  R1 | % 27
  R1 | % 28
  R1 | % 29

  \barNumberCheck #30
  R1 | % 30
  R1 | % 31
  R1 | % 32
  R1 | % 33
  R1 | % 34
  R1 | % 35
  R1 | % 36
  R1 | % 37
  R1 | % 38
  R1 | % 39

  \barNumberCheck #40
  R1 | % 40
  R1 | % 41
  R1 | % 42
  R1 | % 43
  R1 | % 44
  R1 | % 45
  R1 | % 46
  R1 | % 47
  R1 | % 48
  R1 | % 49

  \barNumberCheck #50
  R1 | % 50
  r4 \bar "|."
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
        \context Voice = "PartPOneVoiceZero" {
          \voiceOne \PartPOneVoiceZero
        }
        \context Voice = "PartPOneVoiceOne" {
          \voiceTwo \PartPOneVoiceOne
        }
      >>
    >>
    \new Staff = "P2" <<
      \set Staff.shortInstrumentName = "Pno"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPTwoVoiceZero" {
          \voiceOne \PartPTwoVoiceZero
        }
        \context Voice = "PartPTwoVoiceOne" {
          \voiceTwo \PartPTwoVoiceOne
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 106.99980000000001 }
}
