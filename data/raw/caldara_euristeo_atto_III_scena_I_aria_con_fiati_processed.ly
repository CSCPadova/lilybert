\language "italiano"
	%********************************** VARIABILI


\version "2.18.0"

su = \change Staff = up

giu = \change Staff = down

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

dolce = _\markup \italic "Dolce"

arco = _\markup \italic "arco"

pizz = _\markup \italic "pizzic"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.8

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

ds = _\markup \italic \right-align {"Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

tr = \trill

tu = _\markup \italic {"tutti"}

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


mbreak = { }



Icln = \relative do'' {

    R2.
    r8 sol' sol mib mib do
    do4 la' do,

    %4
    do\tr sib r
    r8 mib mib do do la
    la4 sib8. do16 re4~\mbreak

    %7
    re8 mib \grace re8 do4. sib16(do)
    \grace do4 re4. la' 8la la
    la\tr(sol) sol4 r

    %10
    r8 sol sol sol sol[sol]\mbreak
    sol\tr(fa) fa4. mib8
    re4 do2

    %13
    sib4 r r
    r8 mib sol(mi) mi(fa)
    fa fa la(fad) fad(sol)\mbreak

    %16
    sol4 fa?4. mib16(fa)
    mib4 sol4. fad16(sol)
    fad4. fad8 sol la

    %19
    sib la16(sol) \grace sol4 fad2
    sol r4\mbreak
    R2.

    %22
    r8 sol sol(mib) mib(do)
    do4 r r
    R2.*2\mbreak

    %26
    r4 re4. re8
    mib re16 do \grace do8 re4. re8
    mib re16(do) \grace do4 re2

    %29
    r4 r8 sol sol sol\mbreak
    sol\tr fa fa4 r
    r8 fa fa fa fa[fa]

    %32
    fa\tr(mib) mib4 r\mbreak
    R2.*3
    r8 fa fa(re) re(sib)

    %37
    sib2\tr r4\mbreak
    r8 sol' sol(mib) mib(do)
    do4.\tr fa16(mib) re8 do16(sib)

    %40
    do4 do4.\tr sib16(do)
    sib8 re re[(sib)] sib(sol)
    sol4 r r\mbreak

    %43
    r8 mib' mib(do) do(la)
    la4 r r
    R2.*2\mbreak

    %47
    r8 re sol(mi!) mi(fa)
    fa fa la(fad) fad(sol)
    sol2.~

    %50
    sol4 sol4.\tr fad16(sol)
    fad4 r r\mbreak
    R2.*3

    %55
    r16 sol fa? sol mib sol fa sol re sol fa sol\mbreak
    do,4 r r
    R2.*2

    %59
    r16 fa mib fa re fa  mib fa do fa mib fa\mbreak
    sib,4. la16(sol) do8[sib]
    la sib do re16(mib) re8 mib16 (fa)

    %62
    sol8 la la2
    sol4 r r
    r8 sol sol(mib) mib[(do)]\mbreak

    %65
    re2.~
    re~
    re~

    %68
    re\mbreak
    R2.*4
    r8 sol sol mib mib do

    %74
    do4 la' do,\mbreak
    do\tr sib r
    r8 mib mib (do) do (la)

    %77
    la4 sib8. do16 re4~
    re8 mib \grace re4 do2\tr
    \grace do8 re4. la'8 la la\mbreak

    %80
    la\tr sol sol4 r
    r8 sol sol sol sol[sol]
    sol\tr (fa) fa4. mib8

    %83
    re4 do2\mbreak
    sib4 r r
    r8 mib sol(mi) mi(fa)

    %86
    fa fa la(fad) fad(sol)
    sol4 fa?4.\tr mib16(fa)
    mib4 sol4. fad16(sol)

    %89
    fad4. fad8 sol la
    sib la16(sol) \grace sol4 fad2\mbreak
    sol\fermata r4

    %92
    R2.
    r4 re8 mi fa4
    mi4. re8 dod si

    %95
    dod si la4 r
    R2.*2
    r4 fa'8.\tr mi16 fa4

    %99
    r sol8. fa16 sol4
    R2.
    r8 la la sol sol sol

    %102
    sol\tr(fa) fa4 r\mbreak
    r8 fa fa(re) re(sib)
    sib4 r r

    %105
    r8 mi mi(dod) dod(la)
    la4 r r
    r8 mi' mi(dod) dod(la)

    %108
    la4 r r
    R2.*2
    r8 la' la(fa) fa(re)

    %112
    re4 r r
    R2.*3

}


Ifln = \relative do'' {

    r8 re re sib sib sol
    sol4 mib' sol,
    sol fad r

    %4
    r r8 sol' sol mib
    mib do do la la fad
    fad?4 sol8. la16 sib4\mbreak

    %7
    sol sol8. fad16 sol8. la16
    \grace sol4 fad2 r4
    r r8 re' re re

    %10
    re\tr do do4 r\mbreak
    r8 do do do do[do]
    do sib sib4 la

    %13
    sib8[sib] re(si) si(do)
    do4 \grace do8 sib4.\tr la16(sib)
    la4 re do8.\tr sib32 do\mbreak

    %16
    sib4 r8 re re(sol,)
    sol4 r8 mi'! mi(la,)
    la4. la8 sib do

    %19
    re do16 (sib) \grace sib4 la2
    sol r4\mbreak
    r8 re' re(sib) sib[sol]

    %22
    sol4 r r
    R2.*3
    r4 sib4. sib8

    %27
    do sib16(la) \grace la8 sib4. sib8
    do sib16(la) \grace la8 sib2
    R2.\mbreak

    %30
    r4 r8 do do do
    do\tr(sib) sib4 r
    R2.

    %33
    r8 sol' sol sol sol[sol]
    sol\tr fa fa4 r
    R2.*2

    %37
    r8 re re(sib) sib[(sol)]\mbreak
    sol mib' mib do do la
    la do16(sib) la8 sol16(fa) sib4~

    %40
    sib \grace sib la2
    sib4 r r
    r8 sol' sol(mib) mib(do)\mbreak

    %43
    do4 r r
    R2.*5
    r8 re re(si) si(do)

    %50
    do mib mib[(dod) dod(re)]
    re4 r r\mbreak
    R2.

    %53
    r16 re do re sib re do re la re do re
    sol,4\tr r r
    R2.*8

    %63
    r8 re' re sib sib[sol]
    sol4 r r\mbreak
    r fad' sol

    %66
    la8 sol fad4. sol8
    la sol fad4. sol8
    la sol fad4. sol8\mbreak

    %69
    la4 r r
    R2.*2
    r8 re, re sib sib sol

    %73
    sol4 mib' sol,
    sol\tr fad r\mbreak
    r4 r8 sol' sol mib

    %76
    mib(do) do(la) la(fad)
    fad?4 sol8. la16 sib4
    sol sol8.[fad16 sol8. la16]

    %79
    \grace sol8 fad2 r4\mbreak
    r4 r8 re' re re
    re\tr(do) do4 r

    %82
    r8 do do do do do
    do\tr(sib) sib4 la\mbreak
    sib8[sib] re(si) si(do)

    %85
    do4 si?4.\tr la16 si
    la4 re do8.\tr(sib32 do)
    sib4 r8 re re(sol,)

    %88
    sol4 r8 mi'! mi(la,)
    la4. la8 sib do
    re do16(sib) \grace sib4 la2\mbreak

    %91
    sol\fermopz r4
    R2.*4
    r4 re' re\mbreak

    %97
    mi8.\tr re16 mi4 r
    r la,8. sol16 la4
    r dod8. re16 dod4

    %100
    r8 re re re re re
    re\tr(dod) dod4 r
    R2.

    %103
    r8 re re(sib) sib(sol)
    sol4 r r
    r8 dod dod(la) la(fa)

    %106
    fa4 r r
    R2.
    r8 la' la(fa) fa(re)

    %109
    re4 r r
    R2.
    r8 fa fa(re) re(sib)

    %112
    sib4 r r
    R2.*3

}


Ifgn = \relative do {

    R2.*3
    r8 sol' sol mib mib do
    do4 la' do,

    %6
    do\tr sib r8 sib\mbreak
    mib4 mib2
    r16 re fad la fad re fad la re re, fad la

    %9
    sib sol, sib re sib sol sib re sol sol, sib re
    mib do mib sol mib do mib sol do sol mib do\mbreak
    la' fa la do la fa la do fa do la fa

    %12
    sib fa re sib mib sol mib do fa8 fa,
    sib4 r r
    R2.*2\mbreak

    %16
    r8 sib' re si si do
    do do mib(dod) dod(re)
    re16 la fad re re'8 do sib la

    %19
    sol8 do, re[do re re,]
    sol4 r r\mbreak
    R2.*2

    %23
    r8 la' la fad fad re
    re4 \clef tenor\key fa\major re'4. re8
    mib re16(do) \grace do8 re4. re8\mbreak

    %26
    mib re16 do \grace do4 re2
    \clef bass\key fa\major r4 r16 sib la sib sib,4
    r r16 sib' la sib sib,4

    %29
    R2.\mbreak
    r16 fa' la do la fa la do fa fa, la do
    re sib, re fa sib sib, re fa sib sib, re fa

    %32
    sol mib sol sib sol mib sol sib mib mib, sol sib
    do do, mib sol mib do mib sol do sol mib do
    la' fa la do la fa la do fa fa, la do

    %35
    sib8 do16 re do2
    sib r4
    r8 sib sib sol sol mib\mbreak

    %38
    mib4 mib mib
    fa r8 fa sol[re]
    mib do fa[mib fa fa,]

    %41
    sib4 r r
    R2.*2
    r8 la' la fad fad re

    %45
    re sol sol[re] re mib
    mib mib' mib[(do)] do(re)\mbreak
    re sib sib[(sol)] sol(la)

    %48
    la(do) do[(la)] la(sib)
    sib sol sol[(re)] re(mib)
    mib r mib r mib r

    %51
    re4 r r\mbreak
    R2.*5
    r16 do' sib do la do sib do sol do sib do

    %58
    fa,4 r r
    R2.*4
    r16 sol, sib re sol sol, sib re sol sol, sib re

    %64
    mib do mib sol do do, mib sol do sib la sol\mbreak
    fad8 mi? re4 r
    r la' sib

    %67
    do8 sib la4. sib8
    do8 sib la4. sol8\mbreak
    fad16 re fad la re re, fad la re re, fad la

    %70
    sol re sib re sol,4 r
    R2.*4\mbreak
    r8 sol' sol  mib mib do

    %76
    do4 la' do,
    do\tr sib r8 sib
    mib4 mib2\tr

    %79
    r16 re fad la fad re fad la re re, fad la\mbreak
    sib sol, sib re sib sol sib re sol sol, sib re
    mib do mib sol mib do mib sol do sol mib do

    %82
    la' fa la do la fa la do fa do la fa
    sib fa re sib mib sol mib do fa8 fa,\mbreak
    sib4 r r

    %85
    R2.*2
    r8 sib' re si si do
    do do mib dod dod re

    %89
    re16 la fad re re'8 do sib la
    sol do, re[do re re,]\mbreak
    sol2\fermopz r4

    %92
    R2.*3
    la'8 sol fa la re, fa
    sol re sib re sol,[sol']\mbreak

    %97
    do sol mi sol do,[do']
    fa, do la[do] fa, fa'
    mi[re mi fa,] mi' dod'

    %100
    re re, sold4. sold8
    la la, dod mi la[la,]
    re4 r r\mbreak

    %103
    R2.
    r8 sib' sib(sol) sol(mi)
    mi4 r r

    %106
    r8 re' re(sib) sib(sol)
    sol4 r r
    R2.*2\mbreak

    %110
    r8 la la(dod) dod(re)
    re re, re[(fa) fa(sol)]
    sol sol, r4 r

    %113
    R2.*3

}

Ivocen = \relative do' {

    \autoBeamOff

    R2.*19
    r4 sib'8[(do)] re[(sib)]\mbreak
    sol4. fad8(sol4)

    %22
    sol do8[(sib)] la[(sol)]
    sol4 fad r
    r sib4. sib8

    %25
    do sib16[(la)] \grace la8 sib4. sib8\mbreak
    do[sib16 la] \grace la4 sib2
    R2.

    %28
    r4 sib8[do] re[sib]
    sol mib do'4~do16 sib[la sol]\mbreak
    \grace sol8 la4. do8[la fa16(mib)]

    %31
    re4. re'8 [sib lab]
    \grace la8 sol4. sib8[la sol]\mbreak
    \grace fa8 mib4. sol8 mib16 [fa sol mib]

    %34
    \grace re8 do4. do'16[sib] la8[sol16(fa)]
    re'8[do16(sib)] \grace sib8 la2
    sib r4

    %37
    R2.*4
    r4 sib8[(sol)] sol[(mib)]
    mib?4.\tr(re8) mib4\mbreak

    %43
    do4 la'16[(sib do sib)] la8 sol
    fad4.(mi8) re4
    r re'8[si] si[do]

    %46
    do do mib[la,] la[sib]\mbreak
    sib8.[(la16)] sib2
    r4 la fad

    %49
    re re r
    R2.
    r8 la' re[(la)] sib[(do)]\mbreak

    %52
    sib16[re do re] sib[re do re] la[re do re]
    sol,4 r r
    r16 sol[fa sol] mib[sol fa sol] re[sol fa sol]

    %55
    do,4 r r\mbreak
    r16 do'[sib do] la[do sib do] sol[do sib do]
    fa,4\tr r r

    %58
    r16 fa[mib fa] re[fa mib fa] do[fa mib fa]
    sib,4\tr r r\mbreak
    r16 sib'[la sib]sol8[sib la sol]

    %61
    fad[fad] la[sib16 do] sib8[la]
    sib[la16 sol] fad2
    sol r4

    %64
    R2.\mbreak
    r4 la sol
    fad8 sol la4. sol8

    %67
    fad sol la4. sol8
    fad sol la4. sib8\mbreak
    do4. la8[fad re]

    %70
    sib'4.  sol8[lab (fad)]
    sol[la] la2
    sol r4

    %73
    R2.*18
    r4\fermopz sol8[la] sib4
    la4. sol8 fa mi

    %93
    fa4.(mi8) re4
    R2.
    r4 la' la

    %96
    sib8. [la16] sib4 r\mbreak
    sol do4. sib8
    la[fa] la4 r

    %99
    sol8[mi] sol4 r
    fa8[re] fa2\tr
    mi r4

    %102
    r la8[(fa)] fa[(re)]\mbreak
    re4 fa sib~
    sib8[sol sol(mi) mi(dod)]

    %105
    dod?4 dod4.\tr sib16[(dod)]
    re4 re4.\tr dod16[(re)]
    mi4 mi4.\tr re16[(mi)]

    %108
    fa4 fa4.\tr mi16[(fa)]
    sol4. sib8[la sol]\mbreak
    fa4 mi r

    %111
    R2.
    sib'4 la sold
    la4. sol?8[fa mi16(re)]

    %114
    re4 mi2
    re2.

}

Itesto = \lyricmode {

    Sotto un fag -- gio
    o lun -- go_un rio _
    spe -- ro_an -- cor con l'idol _ mio _
    star -- mi_as -- sisa_o _ sel -- ve_a -- ma - - - - - - - - - - - - - te.

    Sotto un fag -- gio
    o lun -- go un ri -- o
    spe -- ro_an -- cor con l'idol _ mio _
    star -- mi_as -- sisa o _ sel -- ve_a -- ma - - - - - - - - - - - - - - - - - - - - - -  te,
    spe -- ro_an -- cor con l'idol _ mio _
    star -- mi_as -- sisa_o _ sel -- ve_a -- ma - - - - - te.

    E con lui di quando_in _ quando _ or ridendo _ _ or sospiran - - - - - - - do
    ram -- men -- tar le pe  - ne anda - - - - - - - - - - -  - te le pene _ anda - - - te.



}

Ibcn = \relative do {

    sol4 r8 sol' sol mib
    mib? do do4 sib
    la8 la' la fad fad re

    %4
    sol, sol' sol mib mib do
    do4 do do
    do sib r8 sib\mbreak

    %7
    mib4 mib, mib'
    re8 r re r re r
    sol, r sol r sol r

    %10
    do r do r do r\mbreak
    fa r fa r fa r
    sib sib, mib[do] fa fa,

    %13
    sib4 lab' sol8 fa
    mib4 do do
    fa fad re\mbreak

    %16
    sol r r
    R2.
    r4 re8 do sib la

    %19
    sol do re[do re re,]
    sol4 r r\mbreak
    sol sol' fa

    %22
    mib8 re do4. sib8
    la4 re do
    sib sib' re,

    %25
    mib re sib
    mib re r
    R2.

    %28
    r4 sib sib
    mib do mi\mbreak
    fa8 r fa r fa r

    %31
    sib, r sib r sib r
    mib r mib r mib r\mbreak
    do r do r do r

    %34
    fa r fa r fa r
    sib, r fa' r fa, r
    sib2 r4

    %37
    r8 sib' sib sol sol mib\mbreak
    mib4 mib mib
    fa r8 fa sol[re]

    %40
    mib do fa[mib fa fa,]
    sib r sib r sib r
    do r do r do r\mbreak

    %43
    do r do r do r
    re r re r do r
    si r sol r sol r

    %46
    do r do r fa r\mbreak
    sib, r sol' r sol r
    fa r fad r re r

    %49
    sol r fa r fa r
    mib r mib r mib r
    re r fad r re r

    %52
    sol4 r fad
    sol r fad
    sol r si

    %55
    do r si\mbreak
    do r mi,!
    fa r mi!

    %58
    fa r la
    sib? r la\mbreak
    sib mib, do

    %61
    re re re
    sol,8 do re4 re,
    sol8 r sol r sol r

    %64
    do r do r mib r\mbreak
    re4 re, r
    re' re, r

    %67
    re' re, r
    re' re, r\mbreak
    re'8 r re r re r

    %70
    sol, r sol r do r
    sib8 do re4 re,
    sol r8 sol' sol mib

    %73
    mib? do do4 sib
    la8 la' la fad fad re\mbreak
    sol, sol' sol mib mib do

    %76
    do4 do do
    do sib sib
    mib mib, mib'

    %79
    re8 r re r re r\mbreak
    sol, r sol r sol r
    do r do r do r

    %82
    fa r fa r fa r
    sib sib, mib[do] fa fa,\mbreak
    sib4 lab' sol8 fa

    %85
    mib4 do do
    fa fad re
    sol r r

    %88
    R2.
    r4 re'8 do sib la
    sol do, re do re re,\mbreak

    %91
    sol4_\fermata sol'8 fa mi re
    dod si la2
    re4. do8 sib la

    %94
    sol4 sold2
    la4 fa' re
    sol sol, sol'\mbreak

    %97
    do do, do'
    fa, fa, fa'
    mi mi, mi'

    %100
    re sold, sold
    la dod la
    re re, r\mbreak

    %103
    re' r r
    sol, r r
    la r r

    %106
    re r r
    sol la sol
    fa re2

    %109
    sib'8 la sol2\mbreak
    la8 sol la4 la,
    fa' re fa

    %112
    sol la sib
    la si8 dod re4
    sib la la,

    %115
    re4. do8 sib la

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*5
    <4+>2.
    s2.*6
    s4 <4> <_!>
    s <7 _!> s
    s s <7>
    s2.*8
    <5+>2.
    s2.*22
    s4 <6!>2
    s2.
    s
    <6->4 <6+>2
    s2.*33
    s4 <4> <_!>
    s <_!>2

}


forma = {

    \time 3/4
    \key fa\major
    \tempo 2 = 50
    s2.*115
    \bar "|."
    \mark\markup\smaller\center-column {"Da""Capo"}

}

Icl = {
    %\notypeset
    <<\Icln \forma>>

}

Ifl = {
    <<\Ifln \forma>>

}

Ifg = {

    \clef bass
    <<\Ifgn \forma>>

}


Ivoce = {
    \new Voice = "faggio"
    <<\Ivocen \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}
#(set-global-staff-size 16)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzine

}

\paper {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {"Andante"}

\score {

    \new ChoirStaff	<<

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Chalumeau""(Scialmò)"}
            \set Staff.midiInstrument = #"clarinet"
            \Icl \global
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Traversier"}
            \set Staff.midiInstrument = #"flute"
            \Ifl \global
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Fagotto"}
            \set Staff.midiInstrument = #"bassoon"
            \Ifg \global
        >>

        \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \time 3/4\override Staff.TimeSignature.style = #'numbered  s8^\markup\center-align"Alto"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce \global
                \new Lyrics \lyricsto "faggio" \Itesto
        >>

        \new Staff = "main"
        \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \set Staff.midiInstrument = #"cello"
            \Ibc \global
        >>
    >>

    \layout {

        indent = 1.5\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            skipBars = ##t
        }

    }

    \midi {
        \context {
            \Voice
            \remove Dynamic_performer
        }
    }

}
