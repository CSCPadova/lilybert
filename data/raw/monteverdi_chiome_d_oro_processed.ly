\language "italiano"
	%********************************** VARIABILI

\version "2.17.97"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

ten = ^\markup \italic \center-align "ten"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = \markup \italic \small \center-column{"Da Capo""dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber.transparent = ##t

terzinecon = \override TupletNumber.transparent = ##f

upl =
#(let ((m (make-articulation "stopped")))
   (set! (ly:music-property m 'tweaks)
         (acons 'font-size 3
                (acons 'stencil (lambda (grob)
                                  (grob-interpret-markup
                                   grob
                                   (make-draw-line-markup '(0 . 1))))
                       (ly:music-property m 'tweaks))))
   m)

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

vlIn = \relative do'' {

    r4 sol' la16 sol fa mi re8 sol16 fa
    mi8 re do si la16 si do4 si8
    do8 sol'16 fa  mi8 re do do'16 si la8 sol

    %4
    la4 r8 sol fa mi re4
    do  \override Score.RehearsalMark.X-offset = #3  \override Score.RehearsalMark.Y-offset = #6 \mark "[2.] Ritornello Secondo" sol' fa8 re4 sol8
    mi4 si8 do4 la8 re4

    %7
    mi8 sol4 re8 mi4 sol8 la~
    la do, mi4 re8 do4 si8
    do4 \mark "[3.] Ritornello Terzo" sol' la16 sol fa mi re mi fa re

    %10
    mi fa sol fa mi re do si la si do la si do re si
    do4 sol' la r
    r4 sol la16 sol fa mi re mi fa re

    %13
    mi4 r r2
    R1*3
    r4 mi la16 sol fa  mi re8 sol16 fa

    %18
    mi8  re do si  la16 si do4 si8
    do sol'16 fa mi8 re do do'16 si la8 sol
    la4 r8 sol fa mi

    %21
    re4 do r r2
    R1*3
    r4 sol' la16 sol fa mi re mi fa re

    %26
    mi fa sol fa  mi re do si la si do la si do re si
    do4 sol 'la r
    r sol la16 sol fa mi re mi fa re

    %29
    mi4 r r2
    R1*8
    r4 sol fa8 re4 sol8

    %39
    mi4 si8 do4 la8 re4
    mi8 sol4 re8 mi4 sol8 la8~
    la do,8 mi4 re8 do4 si8

    %42
    do4 r r2
    R1*3
    r4 mi fa16 mi re do re8 sol16 fa

    %47
    mi8 re do si la16 si do4 si8
    do8 sol'16 fa mi8 re do do'16 si la8 sol
    la4 r8 sol fa mi re4

    %50
    do r r2
    R1*7
    r2 mi

    %59
    la4 sol fa mi
    re2 sol,
    sol\longa

}

vlIIn = \relative do'' {

    r4 r2.
    r4 sol' la16 sol fa mi re8 sol16 fa
    mi4 r r8 mi16 re do8 si

    %4
    do4 r8 mi re do do8. si16
    do4 si la si8 sol~
    sol do sol4 la8 do4 si8

    %7
    do4 sol8 re'4 do8 re4
    fa8 sol4 do,8 la4 re
    mi r r2

    %10
    r4 sol la16 sol fa mi re mi fa re
    mi4 r r sol
    la r8 sol fa16 mi re do si do re si

    %13
    do4 r r2
    R1*4
    r4 sol' la16 sol fa mi re8 sol16 fa

    %19
    mi4 r r8 mi16 re do8 si
    do4 r8 mi re do do8. si16
    do4 r r2

    %22
    R1*4
    r4 sol' la16 sol fa mi re mi fa re
    mi4 r r sol

    %28
    la r8 sol fa16 mi re do si do re si
    do4 r r2
    R1*8

    %28
    r4 si la si8 sol~
    sol do sol4 la8 do4 si8
    do4 sol8 re'4 do8 re4

    %31
    fa8 sol4 do,8 la4 re
    mi r r2
    R1*4

    %37
    r4 sol la16 sol fa mi re8 sol16 fa
    mi4 r r8 mi16 re do8 si
    do4 r8 mi re do do8. si16
    do4 r r2
    R1*7
    r2 sol'
    do, do
    sol'1
    mi\longa



}

voceIn = \relative do'' {

    \autoBeamOff

    r4 r2.
    R1*3
    r4 r2.

    %6
    R1*3
    r4 r2.
    R1*3

    %13
    r4 sol'8. sol16 sol8 sol fa mi
    re re sol sol fa8. mi16 re8. do16
    do8. sol16(la8.) [si16] do8. [re16] si8. [do16]

    %16
    la4 sol8 sol la8. do16 do8. si16
    do8 do r4 r2
    R1*3

    %21
    r4 do8 do do8. do16 do8. do16
    si8 si mi mi re8. do16 do8. si16
    do8. sol16(la8.) [si16] do8. [do16] re8. [mi16]

    %24
    fa4 sol,8 sol la do do8. si16
    do8 do r4 r2
    R1*3

    %29
    r4 mi8. fa16 sol8 sol fa mi
    re re mi mi re8. do16 do8. si16
    do8. do16 re8. [mi16] fa8 [do] re16 [do re mi]

    %32
    fa4 do8 do do8. do16 do8. si16
    do8. sol16(la8.) [si16] do8. [sol16] la [sol la si]
    do4 mi8 mi re8. do16 do8. si16

    %35
    do4 re mi8 [re mi do]
    re4. la8 si [do] re16[do8.]
    si4 sol'8 sol fa8. mi16 re8. do16

    %38
    do8 do r4 r2
    R1*3
    r4 mi8 mi mi8. mi16 mi8. re16

    %43
    re8 re re8. re16 re8. re16 re8. do16
    do8. re16(do8.)[re16] do8.[re16] si8.[do16]
    la4 sol8 sol re'8. do16 do8. si16

    %46
    do8 do r4 r2
    R1*3
    r4 sol'8. fa16 mi8. mi16 re8. do16

    %51
    si8 si sol'8. sol16 fa8. mi16 re8. re16
    do8 do re4~re2~
    re4 r8 mi re8. do16 do8. si16

    %54
    do4 do2 re8 mi
    fa4 sol fa mi
    do re8 [mi] fa [mi re do]

    %57
    re2~re16[mi fad mi] re[do si la]
    si2 sol4 sol
    la si do4. re8

    %60
    re1
    do\longa

}

testoI = \lyricmode {

    Chiome _ d'oro _  bel te -- soro _
    tu mi leghi_in _ mille _ mo -- di  - - -
    se t'an -- nodi _ se ti snodi. _
    Candi - dette _ perle _ e -- lette _
    se le rose _ che copri -- te  - - -
    di -- sco -- prite, _ mi fe -- rite. _
    Vive _ stelle, _ che si belle _
    e si vaghe _ ri -- splen -- de -- te - - - -
    se ri -- dete _ m'anci - de -- te,  - - - se ri -- dete _ m'anci - de - - - - - - te se ri -- dete _ m'anci -  de -- te.
    Pre -- zio - se, amo - rose, _
    coral - line _ labbra_a - ma -- te - - -
    se parla - te mi be -- ate. _
    O bel nodo _ per cui godo, _
    o soa - ve_u -- scir di vita, _
    o gradi - ta mia fe -- rita _ o gradi - ta mia fe -- ri - - ta - -  o gradi - ta mia fe -- ri -- ta. _

}


voceIIn = \relative do'' {

    \autoBeamOff

    r4 r2.
    R1*3
    r4 r2.

    %6
    R1*3
    r4 r2.
    R1*3

    %13
    r4 mi8. mi16 mi8 mi re do
    si si mi mi re8. do16 do8. si16
    do8. mi,16 fad8.[sol16] la8.[do,16] re8.[mi16]

    %16
    fa?4 sol8 sol fa8. mi16 re8. re16
    do8 do r4 r2
    R1*3

    %21
    r4 mi'8 mi mi8. mi16 mi8. mi16
    re8 re do do la8. la16 re8. re16
    do8. si16 do8. [re16] mi8. [mi,16] fa8. [sol16]

    %24
    la4 si8 do re fa re8. re16
    do8 do r4 r2
    R1*3

    %29
    r4 mi8 mi mi8. mi16 re8 do
    si si do si la8. la16 re8. re16
    do16[si do la] si[la si sol] do[si do la] si[la si sol]

    %32
    la4 sol8 sol fa8. mi16 re8. re16
    do8. mi16 fad8.[sol16] la8.[mi16] fad[mi fad sol]
    la4 do8 do la8. la16 re8. re16

    %35
    do4 si do16[si8.] do16[la8.]
    re4. do8 re [do si la]
    sol4 sol8 sol la do do8. si16

    %38
    do8 do r4 r2
    R1*3
    r4 do8 do do8. do16 do8. do16

    %43
    si8 si si si la do do8. si16
    do8 si16 [la] sold [la si sold] la8 [sol?16 fa] mi[fa sol mi]
    fa4 sol8 sol fa8. mi16 re8. re16

    %46
    do8 do r4 r2
    R1*3
    r4 mi'8. re16 do8. do16 si8. la16

    %51
    re8 re mi8. mi16 re8. do16 do8. si16
    do8 do do2 si4
    la r8 sol fa8. mi16 re8. re16

    %54
    mi4 mi2 fa8 sol
    la4 sol la si
    la1~

    %57
    la4 si8 [do] re [do si la]
    re2 mi4 mi
    re re do do

    %60
    do2 si
    do\longa

}

testoII = \lyricmode {

    Chiome _ d'oro _  bel te -- soro _
    tu mi leghi_in _ mille _ mo -- di  - - - -
    se t'an -- nodi _ se ti snodi. _
    Candi - dette _ perle _ e -- lette _
    se le rose _ che copri -- te  - - - -
    di -- sco -- prite, _ mi fe -- rite. _
    Vive _ stelle, _ che si belle _
    e si vaghe _ ri -- splen -- de - te - -
    se ri -- dete _ m'anci - de -- te,  - - - - se ri -- dete _ m'anci - de - - - - - - te se ri -- dete _ m'anci -  de -- te.
    Pre -- zio - se, amo - rose, _
    coral - line _ labbra_a - ma -- te - - - -
    se parla - te mi be -- ate. _
    O bel nodo _ per cui godo, _
    o soa - ve_u -- scir di vita, _
    o - - gradi - ta mia fe -- rita _ o gradi - ta mia fe -- ri - - ta  o gradi - ta mia fe -- ri - ta. _

}


bcn = \relative do {

    do4 mi fa sol
    do, mi fa sol
    do, si la sol

    %4
    fa mi' fa sol
    do, mi fa sol
    do, mi fa sol

    %7
    do, si la sol
    fa mi' fa sol
    do, mi fa sol

    %10
    do, mi fa sol
    do, si la sol
    fa mi' fa sol

    %13
    do, re mi fa
    sol mi fa sol
    do, si la sol

    %16
    fa mi fa sol
    do mi fa sol
    do, mi fa sol

    %19
    do, si la sol
    fa mi' fa sol
    do, re mi fa

    %22
    sol mi fa sol
    do, si la sol
    fa mi fa sol

    %25
    do mi fa sol
    do, mi fa sol
    do, si la sol

    %28
    fa mi' fa sol
    do, re mi fa
    sol mi fa sol

    %31
    do, si la sol
    fa \tempo 4 = 60 mi_\markup\italic"adagio" fa sol
    do si la sol

    %34
    \tempo 2 = 60 fa'_\markup\italic"Presto honestamente" mi fa sol
    la1
    fad

    %37
    sol4 mi fa sol
    do, mi fa sol
    do, mi fa sol

    %40
    do, si la sol
    fa mi' fa sol
    do, re mi fa

    %43
    sol mi fa sol
    do, si la sol
    fa mi fa sol

    %46
    do mi fa sol
    do, mi fa sol
    do, si la sol

    %49
    fa mi' fa sol
    do, re mi fa
    sol mi \tempo 4 = 60 fa_\markup\italic"adagio" sol

    %52
    do, si la sol
    fa mi fa sol
    do si la sol

    %55
    fa mi'fa sol
    la1
    fad

    %58
    sol2 mi4 mi
    fa sol la fa
    sol1

    %61
    do,\longa

}

bfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 60
    s4 \bar ".|:" s2.
    s1*3
    s4\bar":..:"\break s2.
    s1*3
    s4\bar":..:"\break s2.
    s1*3
    s4 \bar ":|."\break s2.
    s1*47
    \set Score.measureLength = #(ly:make-moment 8 4)
    s\longa
    \bar"|."

}


vlI = {
    \global
    %\notypeset
    <<\vlIn \forma>>

}

vlII = {
    \global
    <<\vlIIn \forma>>

}

voceI = {
    \new Voice = "chiome"
    \global
    <<\voceIn \forma>>

}

voceII = {
    \new Voice = "d'oro"
    \global
    <<\voceIIn \forma>>

}

bc = {
    \global
    \clef bass
    <<\bcn \forma \bfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge\fill-line  { \center-column{\bold "Canzonetta à due voci Concertata con doi Violini Chitarone o Spinetta" \null \line {& avanti s'incomincia a Cantare si suona li presenti Ritornelli}  \line {Quali vanno sonati tre volte avanti il cominciar delli Soprani} \null \null } }

\markup \huge {[1.] Ritornello Primo}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino""[Primo]"}
            \vlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino""[Secondo]"}
            \vlII
        >>

        \new Staff
        <<
            \new Voice  = chiome {
                \set Staff.instrumentName = ""
                \override Staff.InstrumentName.self-alignment-X = #RIGHT
                \incipit { \clef soprano \key do\major}
                \clef violin
                \key do\major
                \set Staff.midiInstrument = #"voice oohs"
                \voceI
            }

            \new Lyrics \lyricsto "chiome" \testoI

        >>

        \new Staff
        <<
            \new Voice = oro {
                \set Staff.instrumentName = ""
                \override Staff.InstrumentName.self-alignment-X = #RIGHT
                \incipit { \clef soprano \key do\major}
                \clef violin
                \key do\major
                \set Staff.midiInstrument = #"voice oohs"
                \voceII
            }

            \new Lyrics \lyricsto "oro" \testoII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"acoustic bass"
            \set Staff.instrumentName = \markup  \center-column{"Chitar[r]one""o Spinetta"}
            \bc

        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
            skipBars = ##t
        }

    }

    \midi {
        \context {
            \Voice
            \remove "Dynamic_performer"
        }
    }

}


