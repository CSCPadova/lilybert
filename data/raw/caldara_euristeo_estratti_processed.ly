\language "italiano"
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph "scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

upl =
#(let ((m (make-articulation 'stopped)))
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
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}



mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    R1*2
    r2 fa4-! fa-!
    fa4. sol16 la sib8 fa sol re

    %5
    mib\tr (re) sib' re,\mbreak mib\tr (re) mib16 fa sol la
    sib8 sib, r8 mib re16(mib) fa8-! fa-! mib16(re)
    do16 re mib8-! r do re16(mib) fa8 r do

    %8
    re16(mib) fa8 fa-! sib-! la16(sol) fa8 sib sib,
    re4-! do-!\mbreak sib r
    r16 la' sol la fa la sol fa sol sib la sib sol sib la sol

    %11
    la8 la fa16(sol) la8 r la fa16(sol) la8
    sol16 do mi, sol fa sib re, fa mi la do, mi re sol sib, re\mbreak
    do fa la, do sib mi sol, sib la8 do fa4~

    %14
    fa mi-! fa16 fa mi fa do fa mi fa
    re4 r r16 re do re la re do re
    sib4 r\mbreak r16 sol' fa sol re sol fa sol

    %17
    mib?8 r sol4. la16 sib la8 sol
    fad16(sol) la8 r la fad16(sol) la8 r la
    fad16(sol) la8 re, la'-! sib\tr(la) \once\stemUp re,,[la'']

    %20
    sib\tr(la) r4 re,-! re-!
    re4. mi16(fad) sol8[re] mi sib
    do\tr[(sib)] sol' sib, -!do\tr(sib) sib la16 sol

    %23
    fad8 fad' sol[la] re,16 mi fad re sol8 sol,
    sib4-! la-!\mbreak sol16 sib la sib sol sib la sol
    mib'?8-! mib-! mib4~mib16 mib re mib do mib re do

    %26
    re re do re sib re do sib lab'8 lab lab4~
    lab16 lab sol lab fa lab(sol fa) sol8 fa16 mib re8 do\mbreak
    si sol' mib16(fa) sol8 r sol fa mib16(re)

    %29
    mib4-! r8 sol lab\tr (sol) r sol
    lab\tr(sol4) fa8~fa mib4 re8~
    re do4 si8 do16(si lab sol) do(si lab sol)\mbreak

    %32
    lab4 r sib?16(lab sol fa) sib(lab sol fa)
    sol8 sol'16(fa) sol8-! sol-! sol4\tr fa-!
    fa16 sib re, fa mib lab do, mib re sol sib, re do fa lab, do

    %35
    sib mib sol, sib lab sib fa lab\mbreak sol sol' fa mib fa sol mib fa
    re(do) sib8 r sib' sol4-! fa-!
    mib16 mib sib sib sol sib fa sib mib,4 r

    %38
    mib'16 sib do re mib fa sol la! sib4 r
    sib16 sib fa fa re fa do fa\mbreak sib,4 r
    r8 re16 mib fa8 mib16(re) re8\tr(do) fa mib16(re)

    %41
    re4\tr(do) sib'8 re, mib\tr re
    sib'8 re, mib\tr[(re)] r2
    r fa,4-! fa-!

    %44
    fa4. sol16 la sib8 fa sol re\mbreak
    mib\tr(re) sib'-![re,-!] mib\tr(re) mib16 fa sol la
    sib8 fa' sol\tr(fa) sib-! fa-! sol\tr(fa)

    %47
    r2 fa4-! fa-!
    fa4. sol16(la) sib8 fa sol[re]
    mib4-! mib-! mib4. re16(do)\mbreak

    %50
    re8 fa sib sib, re4-! do-!
    sib sib8 fa sol\tr[(fa)] sib\p fa
    sol\tr[(fa)] r r16 sib\f sib4-! la-!

    %53
    sib r r2\fermata

}

IvlIIn = \relative do'' {

    sib4-! sib-! sib ~sib16 do re mib
    fa8 do re la sib\tr[(la)] fa' la,
    sib\tr[(la)] sib16 do re mi fa8 fa, r la

    %4
    sib16 fa sib do re8 do sib la sib fa
    sol\tr[(fa)] re' re,\mbreak sol\tr[(fa)] mib?4
    re8 re' mib16(fa) sol8 r re-! re-! do16 (sib)

    %7
    la8 la fa16(sol) la8 r do la16(sib) do8
    r do re16 mib fa sol do,4 sib~
    sib la\mbreak sib16 re do re sib re do sib

    %10
    do4 fa2 mi4
    fa8[do] re\tr[(do)]  fa8[do] re\tr[(do)]
    r8 do\noBeam re sib do[la] sib sol\mbreak

    %13
    la[fa] sol mi fa4 r8 la
    la4-! sol-! fa r
    r16 fa' mib? fa do fa mib fa re4 r

    %16
    r16 re do re la re do re\mbreak sib4 r
    r16 sol' fa sol re sol fa sol mib8[re] do sib
    la4-! la-! la4. sib16 do

    %19
    re8-! la-! sib[fad-!] sol\tr[(fad)] re' fad,\mbreak
    sol\tr[(fad)] sol16 la sib do la8 re, sol4-!
    sol sol4. la16 sib do8 re,

    %22
    mib\tr[(re)] sib' re,-! mib\tr[(re)]  re' do16 sib
    la8 do re16 do sib la sib8 la sol4~
    sol fad-!\mbreak sol r

    %25
    sol16 sib la sib sol sib la sol la8-! la-! la16 do sib la
    sib8 fa r4 r16 lab sol lab fa lab sol fa
    re'8-! re-! re16 fa(mib re) mib8 sol lab16 (sol fa mib)\mbreak

    %28
    re4 r8 do si16(do) re8 r4
    do-! do-! do4. re16(mib)
    do8 sol lab4 sol fa

    %31
    mib re do r\mbreak
    fa'16(mib) re(do) fa(mib) re(do) re4 fa~
    fa8 mib16 re mib8-! mib-! mib4\tr re-!

    %34
    r8 sib do lab sib sol lab[fa]
    sol[mib] fa re\mbreak mib16 sib' lab sol lab8 sol
    fa re' mib2 re4

    %37
    mib r mib16 mib sib sib sol sib fa sib
    mib,4 r mib'16 sib do re mib fa sol la
    sib4 r\mbreak sib16 sib fa fa re fa do fa

    %40
    sib,8 sib16 do re8 do16(sib) sib8\tr[(la)] re do16(sib)
    sib4\tr(la) sib-! sib-!
    sib~sib16 do re mib fa8[do] re la

    %43
    sib8\tr(la) fa'[la,] sib\tr(la) fa'[la,]
    re\tr(do) fa-![do-!]  re\tr(do) r sib\mbreak
    sol16(la) sib8 r sib  sol16(la) sib8 r mib,

    %46
    re re' mib\tr(re) r re\noBeam mib re
    do16(re) mib8 fa do re\tr[(do)] la' do,
    re\tr[(do)] do re16 (mib) fa8 re sib[sib]

    %49
    do sib do[sol] la-! la-! la4\mbreak
    sib8 sib sib2 la4
    sib sib8 re, mib\tr[(re)] sib'\p re,

    %52
    mib\tr[(re)] r r16 mib\f re4 do
    sib r r2\fermata

}

Ibcn = \relative do {

    R1*5
    sib4 sib sib~sib16 do re mib
    fa8 do re[la] sib la fa'[la,]

    %8
    sib la sib16 do re mi fa8[fa,] re' sib
    fa' mib? fa fa,\mbreak sib4 r8 sib'
    la4 r8 la sib4 do

    %11
    fa, fa fa~fa16 sol la sib
    do8 do, r4 r2\mbreak
    r r8 fa la fa

    %14
    do' sib do do, fa r la r
    sib r la r sib r fad r
    sol r fad r\mbreak sol r si r

    %17
    do r si r do si do do,
    r dod re16(mi) fad8 r dod re16(mi) fad8
    r re sib la sol re' sib la\mbreak

    %20
    sol[re'] sib sol re'4-! r
    R1
    sol4-! sol-! sol4~sol16 la sib do

    %23
    re8[la] sib fad sol[re] mib? sib
    do4 re\mbreak sol, r
    sol'8[sol] sol sol fa[fa] fa fa

    %26
    sib,4 r fa'8[fa] fa fa
    sib,[sib] sib sib mib mib fa[fa,]\mbreak
    sol'4 sol sol4. la16 si

    %29
    do8[sol] lab mib fa[mib] do' mib,
    fa mib fa16 sol lab sib do8[do,] lab' sib
    sol[lab] fa sol do,4 r8 do\mbreak

    %32
    fa4 r8 fa sib,4 r8 sib
    mib4 mib16 fa sol lab sib4 sib,
    R1

    %35 OOKK
    r2\mbreak r8 mib lab lab,
    sib sib' sol mib sib' lab sib sib,
    mib4 r8 re mib4 r8 re
    mib4 r mib8 re do4
    sib r8 la\mbreak sib4 r8 la
    sib4 r8 sib fa' fa re[mib]
    fa4 fa, r2
    R1*4
    sib4 sib sib~sib16 do re mib
    fa8 do re[la] sib la fa'[la,]
    sib la fa'[mib] re4 mib8 sol
    do, re mib[mib,] fa'4 fa\mbreak
    sib8 sib, re[sol] fa mib fa fa,
    sib4 sib sib r
    r r8 r16 sol'\f mib4-! fa-!
    sib, r r2\fermata

}

Ibfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*9
    s2 <6>
    s1*17
    s4 <6 4> <3!>2
}

forma = {
    \key sib\major
    \time 4/4
    \tempo 2 = 55
    s1*53
    \bar "|."

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    re2 sol,2. sol'4
    \grace sol fad2. sol4 la2~
    la sol fa?

    %4
    mib1 re2
    do fa,2. mib'4
    \grace mib re2. mib4 fa2~

    %7
    fa mib re\mbreak\mbreak
    do1 sib2
    la re,2. do'4

    %10
    \grace do sib2. do4 re2~
    re \grace re4 do2. sib8(do)
    re2 re4 la sib (fad)

    %13
    sol2-! sol1\p
    fad1.

}

IIvlIIn = \relative do'' {

    R1.
    la2 re,2. do'4
    sib2. do4 re2~

    %4
    re do sib~
    sib la4. sib8 do2~
    do sib lab

    %7
    sol2. la!4 sib2~\mbreak
    sib la sol~
    sol fad4. sol8 la2~

    %10
    la sol fad
    sol2. fad4 sol4. la8
    fad2 r4 fad sol la,

    %13
    sib2-! sib-! sib-!
    la1.

}

IIbcn = \relative do {

    sol2. la4 sib do
    re2. mi4 fad re
    sol,2. la4 sib sol

    %4
    do2. do4 re mib
    fa2. sol4 la fa
    sib,2. do4 re sib

    %7
    mib1.\mbreak
    mi2  fad sol
    re2. mi4 fad re

    %10
    sol1 re2
    mib1.
    re2 r r

    %13
    dod\p dod dod
    re1.

}

IIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.
    s
    <9>2 <8> s
    <9>2 <8> s
    <5 4> <3> s
    <9>2 <8> <5->
    <9> <8> <7>
    <6 5>1.
    <5 4>
    <9>
    <7>2 <6>1

}

forma = {
    \key sol\minor
    \time 3/2
    \tempo 1 = 40
    s1.*14
    \bar "|."

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}


IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    re2 do4.\tr(sib8)
    \appoggiatura sib4 fa'2. fa,4
    sib2 sol'4. sib,8

    %4
    \appoggiatura sib4 la2. la4
    sib4.(fa8) do'4.(fa,8)
    \appoggiatura fa4 re'2. do4

    %7
    re4. sib8 mi4. sib8\mbreak
    \appoggiatura sib4 fa'2. mi4
    fa4.(do8) sol'4.(do,8)

    %10
    \appoggiatura do4 la'2. sol4
    la4.(fa8) sib4. sol8
    do4. mi,8 fa4. sol8

    %13
    \appoggiatura {fa16[sol]} sol2.\tr fa8 (sol)
    fa1 fa
    fa2 do4. re8

    %16
    \appoggiatura sib4 la2. sib4
    do4. mib8(re4.) do8
    sib4.\tr(la8) sol2

    %19
    sib la4.\tr(sol8)
    \appoggiatura sol4 re'2. re,4
    sol2 mib'4.(sol,8)

    %22
    \appoggiatura sol4 fad2. mib'4\mbreak
    re4. la8 sib4.(sol8)
    mib'4.(do8) re4. sol8

    %25
    sib,2 la\tr
    sol2. sol4
    do2 sol4. sib8

    %28
    \appoggiatura sib4 la2. do4
    fa2 do4. mib8
    \appoggiatura mib4 re2. fa4\mbreak

    %31
    sib4.(sib,8) mib4. re8
    \appoggiatura re4 do1
    mi2. mi4

    %34
    \appoggiatura mib4 fa1
    mib2. mib4
    fa,4. mib'8 re4 do8(sib)

    %37
    \appoggiatura sib4 do2. sib8(do)
    sib1 sib

}

IIIbcn = \relative do {

    sib2 sib'
    la4. sol8 fa4. mib8
    re2 mib

    %4
    fa4. fa,8 fa'4. mib8
    re2 la
    sib4. do8 re4. la8

    %7
    sib2 sol'\mbreak
    fa4. sol8 la4. sol8
    fa2 mi

    %10
    fa4. sol8 la4. mi8
    fa2 sol
    la4. sol8 la4. sib8

    %13
    do2 do,
    fa4. mib?8 re4. do8 fa,1\mbreak
    fa'2 mi

    %16
    fa la4. sol8
    fad2. fad4
    sol1

    %19
    sol,2 sol'
    fad4. mib8 re4. do8
    sib2 do

    %22
    re re,\mbreak
    re' sol
    do, sib4 la8 sol

    %25
    re'2 re,
    sol sol'4. fa8
    mi2. mi4

    %28
    fa4. mib?8 fa4. sol8
    la4. sol8 la4. fa8
    sib4. sib,8 sib'4. la8\mbreak

    %31
    sol2 mib
    fa4. sol8 la4. fa8
    sol2 do4. sib8

    %34
    la4. sol8 fa2
    sol4. fa8 sol4. la8
    sib2 sib,

    %37
    fa' fa,
    sib4. do8 re4. mib8 sib1

}

IIIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {
    \key sib\major
    \time 2/2
    \tempo 1 = 50
    \repeat volta 2 {s1*13}
    \alternative {{s1}{s}}
    \set Score.currentBarNumber = #15
    \repeat volta 2 {s1*23}
    \alternative {{s1}{s}}
    \bar "|."

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \header {
        title = \markup\smaller {"Euristeo - Introduzione"}
        composer = \markup \center-column {"A. Caldara (1670-1736)"}
    }

    \markup \huge {[1.1] Allegro}

    \score {

        \new ChoirStaff <<
            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc

            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
                \override SpacingSpanner.uniform-stretching = ##t
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

    %\pageBreak

    \markup \huge {[1.2] Larghetto}

    \score {

        \new ChoirStaff <<
            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc

            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #7

    }

    \markup \huge {[1.3] Aria}

    \score {

        \new ChoirStaff <<
            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino I""Violino II]"}
                \set Staff.shortInstrumentName = "vl"
                \IIIvlI
            >>

            \new Staff  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc

            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

