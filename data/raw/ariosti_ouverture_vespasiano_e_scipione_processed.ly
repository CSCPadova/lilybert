\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

cadenza_vlI = \relative do {

    \tempo 4 = 40


}

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "Tutti"

pf = _\markup { \italic poco \dynamic f}

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

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


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzine

}

IvlIn =  \relative do'' {

    sib4. do8 re4. mib8
    fa2. r8 sol
    do,2~do8 re mib fa

    %4
    re4. do8 re4 mib8. re16
    do4 fa, fa'2~\mbreak
    fa4 sol mi4. fa8

    %7
    fa4. mi8 fa4 sol8. fa16
    mi4. re8 mi4 fad
    sol4. fa?8 sol4 la8. sol16

    %10
    fa4. mi8 fa4 sol8. fa16
    mib!4. re8\mbreak mib4 fa8. mib16
    re4. do8 re4 mib8. re16

    %13
    do2 r
    sib4. do8 re4. mib8 do4. si8 do4 re
    mib2~mib4. re16 do\mbreak

    %16
    re4. do8 re4 mi
    fa2~fa4. mi16 re
    mi4. re8 mi4 fad

    %19
    sol4. la8 sib4. la16 sol
    fad4 sol sol4. fad8\mbreak
    sol4. re8\mbreak re mib? re mib

    %22
    fa4. fa8 do re do re
    mib4. mib8 sib do sib do
    re mib re mib fa sol fa sol

    %25
    do,4. do8 re do re sib
    do sib do la re do re sib\mbreak
    do fa mib re do4. sib8

    %28
    sib1
    do4. si8 do 4 re sib?16 fa sol la sib8\noBeam  la fa sib
    sib8. do16 la8 sib4 la8\mbreak

    %31
    sol16 fa sol sib la do sib la sib re do sib
    la la sib do re8\noBeam do4 re8
    mib16 re mib la, sib do re do re mib do re

    %34
    sib la sib re do sib la do re mi fa8\noBeam \mbreak
    mi8 do fa fa8. sol16 mi8
    fa16 mib fa sol mib fa re4 mi8

    %37
    fa16 mi fa la sol fa mi4 do8
    sol16 fa sol sib la do sib8. la16 sol8
    fa4.\mbreak r16 sib do re mib?8\noBeam

    %40
    re sib fa' fa8. sol16 mi8
    fa8 r r fa4 re8 do la re
    mib16 re mib sol fa mib re4 la8

    %43
    sib16 la sib do sib la sol4.\mbreak
    fa r
    r16 sib do re mib8\noBeam re sib fa'

    %46
    fa8. sol16 mi re dod8 la re
    re8. mi16 dod8 re8. mi16 re do?
    si la si sol la si\mbreak do8. re16 do sib!

    %49
    la16 sol la fa sol la sib8. do16 sib la
    sol fa sol la sib do la la sib do re8
    do4 re8 mib16 re mib sol fa  mib

    %52
    re do re mib do re sib la sib re do sib\mbreak
    la8 r r sib r r
    mib r r re r r

    %55
    do4 r r2
    fa8 fa sol[sol] la la sol[sol]
    sol[sol] la la sib sib sib[sib]

    %58
    la2\fermata \mbreak r4 lab,8 lab
    lab? lab sol [sol] sol2\fermata
    r4 do8 do reb reb reb[reb]

    %61
    do2\fermata r

}

IvlIIn =  \relative do'' {

    R1
    re,4. mib8 fa4. sol8
    la4. sib8 do4 la

    %4
    sib4. la8 sib4 do8. sib16
    la2~la8 sib do re\mbreak
    sol,4. la8 sib4 do8. sib16

    %7
    la4. sol8 la4 sib8. la16
    sol4. fa8 sol4 la
    sib1

    %10
    la4. sol8 la4 si
    do4. re8\mbreak la4 la
    sib4. fa8 sib4 do8. sib16

    %13
    la2 r
    R1 la4 r r2
    sol4. fa8 sol4 la\mbreak

    %16
    sib2~sib4. la16 sol
    la4. sib8 do4 re
    sol,4. fad8 sol4 la

    %19
    re2~re4. do16 sib
    la4 sib la4. re8
    sib4. sib8\mbreak sib do sib do

    %22
    re4. re8 la sib la sib
    do4. do8 sol la sol la
    sib1

    %25
    la4. la8 sib la sib sol
    la sol la fa sib la sib sol\mbreak
    la4 sib sib4. la8

    %28
    sib1
    R sib4 r8 r4.
    r r16 do, re mi fa8\noBeam

    %31
    mi8 do fa fa8. sol16 mi8
    fa4 r8 r4.
    r16 sib do re mib?8\noBeam re sib fa'

    %34
    fa8. sol16 mi8 fa16 mi fa mi re mi\mbreak
    do sib do re do re sib la sib re do sib
    la4. r

    %37
    R2.
    r4. r16 fa sol la sib8\noBeam
    la fa sib\mbreak sib8. do16 la8

    %40
    sib16 la sib do la do  sib4.
    la8 r r la r r r4.
    R2.*2\mbreak

    %44
    r16 fa sol la sib8\noBeam la fa sib
    sib8. do16 la8 sib16 la sib re do re
    sib8. la16 sol8 sol4 la8

    %47
    sol8. sib16 la sol fad mi? fad re mi! fad
    sol8. la16 sol fa? \mbreak mi re mi do re mi
    fa8. sol16 fa mib! re do re mib do re

    %50
    mib re mib fa sol mib fa4 fa8
    fa4. do'~
    do8 sib fa fa8. sol16 mi8\mbreak

    %53
    fa r r fa r r
    la r r sib r r
    la4 r r2

    %56
    re8 re do[do] fa fa fa[fa]
    mib mib mib[mib] re re mi[mi]
    fad2\fermata\mbreak r4 mib,8 mib

    %59
    fa? fa fa[fa] mi2\fermata
    r4 fa8 fa fa[fa] sol sol
    la2\fermata r

}

Ivlan = \relative do'{

    R1
    sib'4. la8 sib4. sol8
    fa4. fa8 fa4 fa

    %4
    fa2. fa4
    fa2. do4\mbreak
    do1

    %7
    do2 do
    do sol'
    re4. do8 re4 do

    %10
    la2. sol'4
    sol2~\mbreak sol4 fa
    sib2. sol4

    %13
    do,4. sib8 do4 la
    re r r2 la'4. sol8 la4 si
    do2. do4\mbreak

    %16
    sib4. la8 sib4 sol
    fa4. fa8 do4 sol'
    sol2. re4

    %19
    re4. do8 re4 mib
    re4 re re4. re8
    re2~\mbreak re4 sol

    %22
    fa8 sol fa sol la4. la8
    mib fa mib fa sol4. sol8
    fa1

    %25
    fa4 fa re sib
    fa' fa re sib\mbreak
    fa'4 fa fa4. fa8

    %28
    fa4. mib8 re4 do8 sib
    la'4. sol8 la4 si fa4 r8 r4.
    R2.*2

    %32
    r4. r16 la sib do re8\noBeam
    do fa, fa fa fa fa
    sol mi do do4 la'8\mbreak

    %35
    sol4 fa8 sol4 sol8
    r16 sol la si do8\noBeam si sol do
    do8. re16 si8 do16 mi, fa sol la8\noBeam

    %38
    do4 la8 sol4.
    do,8 fa fa\mbreak mib mib mib
    re4 la'8 sol4.

    %41
    do,8 r r do r r r4.
    r r16 do re mi fa8\noBeam
    mi do fa fa8. sol16 mi8\mbreak

    %44
    fa16 la, sib do re8\noBeam do16 sib do mib? re fa
    mib4. r
    r16 fa sol la sib8\noBeam mi,4 fa8

    %47
    mi mi8. re16  re8 r r
    R2.*2
    r4. r8 do sib

    %51
    fa'4 fa8 sol4 do,8
    fa4 fa8 re4 mi8\mbreak
    do r r fa r r

    %54
    mib? r r fa r r
    fa4 r r2
    sib8 sib sib[sib] do do re,[re]

    %57
    do do do[do] sol' sol sol[sol]
    re2\fermata \mbreak r4 do8 do
    fa fa re[re] do2\fermata

    %60
    r4 do8 do sib sib sib[sib]
    la2\fermata r

}

Ivcn = \relative do {

}

Ibcn = \relative do {

    R1
    sib4. do8 re4. mib8
    fa4. sol8 la4 fa

    %4
    sib,2. sib4
    fa2~fa8 sol la sib\mbreak
    do1

    %7
    fa2 fa,
    do'1
    sib4. la8 sib4 do

    %10
    re2 r4 sol
    do4. sib8	\mbreak do4 re8. do16
    sib4. la8 sib4 mib,

    %13
    fa4. sol8 la4 fa
    sib r r2 fa1
    do2. fa,4\mbreak

    %16
    sib1
    fa4. sol8 la4 si
    do2~do4. sib16 la

    %19
    sib4. la8 sol4 do
    re sol re re,
    sol2~\mbreak sol4 sol'

    %22
    re8 mib re mib fa4. fa8
    do re do re mib4. mib8
    sib do sib do re mib re mib

    %25
    fa1
    fa\mbreak
    fa4 sib, fa2

    %28
    sib4.do8 re4 mib
    fa1 sib,4 r8 r4.
    R2.*2

    %32
    r16 fa' sol la sib8\noBeam la fa sib
    sib8. do16 la8 sib16 la sib do la sib
    sol4 do,8 fa4 fa,8\mbreak

    %35
    do'4 la8 sol4 do8
    fa,4. r
    r4. r16 do' re mi fa8\noBeam

    %38
    mi do fa fa8. sol16 mi8
    fa16 sol fa mib! re8\mbreak do4.
    sib8 sol fa sol4.

    %41
    fa8 r r fa16 fa' sol la sib8\noBeam la fa sib8
    sib8. do16 la8 sib16 la sib do la sib
    sol fa sol sib la do sib la sib re do sib\mbreak

    %44
    la8 fa sib fa4 re8
    do4 fa,8 sib4 la8
    sol4. la4 fa8

    %47
    sol la4 re, r8
    R2.*2
    r4. r16 fa' sol la sib8\noBeam

    %51
    la fa sib sib8. do16 la8
    sib16 la sib do la sib sol4 do,8\mbreak
    fa r r re r r

    %54
    do r r sib r r
    fa4 r r2
    sib'8 sib mi,[mi] fa fa si,[si]

    %57
    do do fad,[fad] sol sol dod[dod]
    re2\fermata r4 do?8 do
    reb reb si[si] do2\fermata

    %60
    r4 la8 la sib sib mi,[mi]
    fa2\fermata r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \time 2/2
    \tempo 2 = 77
    s1
    \repeat volta 2 {s1*11}
    \alternative {{s1*2}{s1}}
    \set Score.currentBarNumber = #15
    \repeat volta 2 {s1*13}
    \alternative {{s1 \set Score.currentBarNumber = #29 s} {\time 6/8\tempo 4. = 60 s4.}}
    \repeat volta 2 { s4. \set Score.currentBarNumber = #30 s2.*11}
    \alternative {{\set Score.measureLength = #(ly:make-moment 3 8) s4.}{\set Score.measureLength = #(ly:make-moment 3 4) s2.}}\set Score.currentBarNumber = #42
    s2.*13\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup "Adagio"
    \time 4/4
    \tempo 4 = 50
    s1*7
    \bar"|."

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzine

}

IIvlIn =  \relative do'' {

    sib8
    re do sib fa' sol la
    sib4. sib,
    mib8 fa sol\mbreak do, fa mib

    %4
    re re16 do sib la sib4 sib8
    re do sib fa' sol la
    sib4. mi,8 mi16 fa sol8

    %7
    do, do' sib la sib16 la sol fa
    fa8 fa, fa fa' fa, fa
    la' fa, fa\mbreak do'' sib la

    %10
    do,4. fa
    fa,8 sib' la sol4 fa8
    fa2 r8 do'

    %13
    la sol fa la sol fa
    sib4. re,8 mib fa
    sol la sib\mbreak la sib16 la sol fad

    %16
    sol4 r8 sib4 r8
    mib, fa sol do, re mib
    re4 r8 sol4 r8

    %19
    dod, re mib la, si dod
    re mi fa mi fa16 mi re dod
    re4 r8 fa4 r8  %%% da qui ripeti

    %22
    sib,8. do16 sib8  mib4 r8
    r4. re4 r8
    sol,8. la16 sib8 fa sib la

    %25
    sib4. fa'4 r8
    sib,8. do16 sib8  mib4 r8
    r4. re4 r8

    %28
    sol,8. la16 sib8 fa sib la
    sib4.

}

IIvlIIn =  \relative do'' {

    fa8 re4. do
    sib8 la sol fa  mib re
    do'4 re8\mbreak mib4 do8

    %4
    re fa16 mib re do re4 re,8
    re'4. do
    sib8 do re sol, sol16 la sib8

    %7
    do fa mi fa sol16 fa mi8
    fa4. la,
    fa\mbreak fa'

    %10
    mi do
    sib8 sol' fa fa4 mi?8
    fa2 r8 r

    %13
    r4. r8 r fa
    fa mib re fa mib re
    mib fad, sol\mbreak sol4 la8

    %16
    sib4 r8 sib4 r8
    sib4 r8 do4 r8
    fa,4 r8 sib4 r8

    %19
    la si dod re4 mi8
    re4 re8 re4 mi,8
    fa4 r8 la4 r8\mbreak

    %22
    fa4 r8 sol4 r8
    r4. sib4 r8
    mib,4 re8 re4 do8

    %25
    sib4. la'4 r8
    fa4 r8 sol4 r8
    r4. sib4 r8

    %28
    mib,4 re8 re4 do8
    sib4.

}

IIvlan = \relative do'{

    re8
    fa4. fa
    sol sib
    sol\mbreak la

    %4
    sib8 re, fa sib la16 sol fa mib
    fa4. fa

    %6
    sol sol
    la4 do,8 do4 do8
    do4. r

    %9
    do\mbreak do
    mi8 sol mi fa re mi
    fa sol la do,4 do8

    %12
    do2 r8 r
    r4. r8 r fa
    sib, do re sib do re

    %15
    sol4 sol8\mbreak re4 re8
    re4 r8 re4 r8
    do4 r8 fa4 r8

    %18
    fa4 r8 sol4 r8
    sol4. la4 sol8
    fa4 la8 la4 la8

    %21
    la4 r8 la4 r8\mbreak
    sib4 r8 sib4 r8
    r4. fa4 r8

    %24
    sol fa re fa4 fa8
    re4 .la'4 r8
    sib4 r8 sib4 r8

    %27
    r4. fa4 r8
    sol fa re fa4 fa8
    re4.

}

IIbcn = \relative do {

    r8 sib'4. la
    sol8 fa mib re do sib
    do4 sib8\mbreak la4 fa8

    %4
    sib4.~sib8 fa'16 mib re do
    sib4. la
    sol8 la sib do4 sib8

    %7
    la la' sol fa do' do,
    fa,4 r8 r4.
    fa4 r8\mbreak la sol fa

    %10
    do' sib do la sib do
    re mi fa do'4 do,8
    fa,2 r8 r

    %13
    r4. r8 r fa'
    re do sib re do sib
    mib re do\mbreak re4 re,8

    %16
    sol4 r8 sol'4 r8
    do,4 r8 la4 r8
    sib4 r8 sol4 r8

    %19
    la'4 sol8 fa4 mi8
    fa mi re la'4 la,8
    re4 r8 re'4 r8\mbreak  %% da qui

    %22
    sol,4 r8 do,4 r8
    r4. sib4 r8
    mib? fa sol fa4 fa,8

    %25
    sib4. re'4 r8
    sol,4 r8 do,4 r8
    r4. sib4 r8

    %28
    mib fa sol fa4 fa,8
    sib4.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \time 6/8
    \tempo 2. = 52
    \partial 8 s8
    s2.*11
    s2 s8
    \bar ":..:"
    s
    s2.*16
    s4.
    \bar":|."


}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}

IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzine

}

IIIvlIn =  \relative do'' {

    re4. re8 la8. la16 fad8. fad16
    re4. re8 fad8. fad16 la8. la16
    fad'4. re8 la'8. la16 sol8. fad16

    %4
    mi4. mi8 mi4 fad
    sol4. sol8 sol8. sol16 fad8. mi16
    re4. re8 re8. mi16 fad8. sol16

    %7
    la4. la8 si8. la16 sol8. fad16\mbreak
    mi4. la,8 re4~re16 do si do
    si4. mi8 red8. red16 mi8. mi16

    %10
    fad4. si,8 la8. [la16 la8.\tr sol32 fad]
    sol4. si8 lad8. lad16 si8. si16
    dod4. re8 mi8. [mi16 mi8.\tr re32 dod]

    %13
    re4. mi8 fad8. fad16 sol8. la16
    si4~si16 mi, re mi mi4. fad8\mbreak
    fad1 fad8 re fad re la' la la si16 dod

    %16 OOKK
    re8 [re,] re16 mi fad sol la8 la, r la'
    fad re' mi, dod' re, si' dod, la'
    si, si'16 la sold [fad  mi re] dod8 mi la, dod

    %19
    si sold16 la si [dod re mi]\mbreak dod8 la16 si dod [re mi la]
    sold8 si16 la sold [fad mi sold] la8 dod, re mi
    dod re si dod la la' <fad si,>4

    %22
    <mi si mi,> r r16 la, [dod mi] la sol! fad mi
    fad8 fad re fad\mbreak mi dod16 re mi [fad sol la]
    fad8 re re'4 re8 dod16 si la [sol fad mi]

    %25
    re8 fad sol4 fad mi
    re8 si'16 la sold [fad mi re] dod8 la' mi la
    r16 la si dod re [fad, re' fad,] mi [re' dod si ]dod mi, dod' mi,\mbreak

    %28
    re [dod' si la] si re, si' re, dod [si' la sol] la dod, la' dod,
    si [la'sol fad] sol si, sol' si, la [sol' fad mi] fad la sol fad
    si8 sol mi8. fad16 fad4 r

    %31
    re16 [fad si fad] si, fad' si fad sol8 mi mi, mi'\mbreak
    r16 mi [la mi] la, mi' la mi fad8 re la re
    r16 re [sol re] sol, re' sol re mi8 sol16 fad mi [re dod si]

    %34
    lad [dod fad dod] fad, dod' fad dod re re fad re si' [la sol fad]
    mid8 dod' dod4 r8 si si4\mbreak
    r8 dod16 si dod[si la sol] la dod, fad dod  fad,[dod' fad dod]

    %37
    re8 fad sold, mid' fad re fad re
    la'8[la] la si16 dod re8[re,] re16 mi fad sol
    la8[mi] la16 sol fad mi fad8 mi la mi

    %40
    fad[mi] la16 sol fad mi fad8 mi fad dod\mbreak
    re si re si fad'[fad]fad sold16 lad
    si8[si,] si16 dod re mi fad4 si8 re,

    %43
    dod16[si' la sol] la dod, la' dod, si[la' sold fad] sold si,  sold' si,
    la sold' fad mi fad[la, fad' la,] sold fad' mi re mi[sold, mi' sold,]
    fad[mi' re dod] re fad, re' fad,\mbreak mi re' dod si dod[mi re dod]

    %46
    fad8 re si8. dod16 dod mid sold mid dod[mid sold mid]
    la dod, fad dod fad,[dod' fad dod] re fad re' dod si[la sold fad]
    sold[si, mi si] mi, si' mi si dod [mi dod' si] la sold fad mi

    %49
    fad la, re la re,[la' re la]\mbreak si re si' la sold[fad mid red]
    mid[sold, dod sold] dod, sold' dod sold la[la dod la] fad' mid red dod
    sid8 sold' sold4 r8 fad fad4

    %52
    r8 sold16 fad sold[fad mi red] mi sold dod sold dod,[sold' dod sold]
    la sold fad mi red8.[dod16]\mbreak dod8 la dod la
    mi' mi mi[fad16 sold] la8[la,] la16 si dod re

    %55
    mi8 si mi16[re dod si] dod8 si mi si
    dod[si] mi16 re dod si dod8 si dod sold
    la fad la fad dod'[dod] dod red16 mid

    %58
    fad8[fad,] fad16 sold la si\mbreak dod8 sold' la mi
    fad [mi] la16 sol fad mi fad8 mi la mi
    fad [mi] la16 sol? fad mi fad8[mi] re'16[fad, re' fad,]

    %61
    mi re' dod si dod[mi, dod' mi,] re dod' si la si[re, si' re,]
    dod si' la sol la[dod, la' dod,] si la' sol fad sol[si, sol' si,]\mbreak
    la sol' fad mi fad[re dod re] si dod re fad, mi8[dod']

    %64
    re,4 re''16\p fad, re' fad, mi[re' dod si] dod mi, dod' mi,]
    re dod' si la si[re, si' re,] dod si' la sol la[dod, la' dod,]
    si la' sol fad sol[si, sol' si,] la sol' fad mi fad[re dod re]\mbreak

    %67
    si dod re fad, mi8 [dod'] re, re'\f fad re
    la'[la] la si16 dod re8[re,] re16 mi fad sol
    la8[la] la16 si dod la re8 fad, mi8. re16

    %70 OOKK
    re1
    sol4. sol8 mi4\tr~ mi8.  re32 dod\mbreak
    re4. re8 red4. mi8

    %73
    mi2~mi4. mi8
    sol4. sol8 sol4\tr~sol8. fad32 mi
    fad2~fad4. fad8

    %76
    si4. re,8 mi,4. fad8
    fad1

}

IIIvlIIn =  \relative do'' {
    re4. re8 la8. la16 fad8. fad16
    re4. re8 fad8. fad16 la8. la16
    fad'4. re8 la'8. la16 sol8. fad16

    %4
    mi4. mi8 mi4 fad
    sol4. sol8 sol8. sol16 fad8. mi16
    re4. re8 re8. mi16 fad8. sol16

    %7
    la4. la8 si8. la16 sol8. fad16\mbreak
    mi4. la,8 re4~re16 do si do
    si4. mi8 red8. red16 mi8. mi16

    %10
    fad4. si,8 la8. [la16 la8.\tr sol32 fad]
    sol4. si8 lad8. lad16 si8. si16
    dod4. re8 mi8. [mi16 mi8.\tr re32 dod]

    %13
    re4. mi8 fad8. fad16 sol8. la16
    si4~si16 mi, re mi mi4. fad8\mbreak
    fad1 fad4 r r2

    %16
    R1*2
    r2 r8 la, dod la
    mi' mi mi fad16 sol\mbreak la8[la,] la16 si dod re

    %20
    mi8 mi, r mi' dod la' si, sold'
    la, fad' sold, mi' fad,[fad'16 mi] red dod si la
    sold mi sold si mi[re? dod si] dod8 la'mi[dod]

    %23
    re4 r8 re\mbreak re4 dod8 mi~
    mi re fad4 mi8 mi la ,dod
    re fad sol4 fad mi

    %26
    re8 si'16 la sold [fad mi re] dod8 mi dod mi
    r4 re'2 dod4~\mbreak
    dod si2 la4~

    %29
    la sol2 fad4~
    fad8 sol mi8. fad16 fad dod fad dod fad,[dod' fad dod]
    re8 [si] fad re'~re16 si sol' fad mi[re dod si]\mbreak

    %32
    dod8 la mi[dod']~dod16 la fad' mi re[dod si la]
    si8[sol] re si'~si16 si mi re dod[si lad sold]
    lad8 fad dod lad' si4 r8 si'

    %35
    sold4 r8 mid fad4 r8 re\mbreak
    mid,4 r8 mid' fad4 r8 dod
    re fad sold, mid' fad re fad re

    %38
    la'[la] la si16 dod re8[re,] re16 mi fad sol
    la8[mi] la16 sol fad mi fad8 mi la mi
    fad[mi] la16 sol fad mi fad8 mi fad dod\mbreak

    %41
    re si re si fad'[fad]fad sold16 lad
    si8[si,] si16 dod re mi fad4 si~
    si la2 sold4~

    %44
    sold fad2 mi4~
    mi re2 dod4~
    dod8 re si8. dod16 dod4 r

    %47
    r16 dod fad dod fad,[dod' fad dod] re8 fad si, fad'~
    fad16 si, mi si mi,[si' mi si] dod8 mi dod mi~
    mi16 la, re la re,[la' re la]\mbreak si8 re si re~

    %50
    re16 sold, dod sold dod,[sold' dod sold] la4 r8 la
    red,4 r8 sid' dod4 r8 dod
    sid4 red2 dod4~

    %53
    dod8 red sid8. dod16\mbreak dod8 la dod la
    mi' mi mi[fad16 sold] la8[la,] la16 si dod re
    mi8 si mi16[re dod si] dod8 si mi si

    %56
    dod[si] mi16 re dod si dod8 si dod sold
    la fad la fad dod'[dod] dod red16 mid
    fad8[fad,] fad16 sold la si\mbreak dod8 sold' la mi

    %59
    fad [mi] la16 sol fad mi fad8 mi la mi
    fad [mi] la16 sol? fad mi fad8[mi] re'4~
    re dod2 si4~

    %62
    si la2 sol4~\mbreak
    sol fad8 la, si16 dod re fad, mi8[dod']
    re,4 re''2\p dod4~

    %65
    dod si2 la4~
    la sol2 fad8 la,\mbreak
    si16 dod re fad, mi8 [dod'] re, re'\f fad re

    %68
    la'[la] la si16 dod re8[re,] re16 mi fad sol
    la8[la] la16 si dod la re8 fad, mi8. re16
    re1

    %71
    mi4. mi8 dod4. dod8\mbreak
    fad,4. fad8 fad4. si8
    si4. la8 sol4 fad

    %74
    mi1
    fad4. mi8 re4 fad
    fad4. si8 si4. lad8

    %77
    lad?1

}

IIIvlan = \relative do'{

    re1
    fad4. fad8 re8. re16 fad8. fad16
    la4. re,8 re4 mi

    %4
    dod4. dod8 dod4 re
    mi si si4. dod8
    re4. re8 re4. mi8

    %7
    re4. fad8 sol8. fad16 mi8. re16\mbreak
    dod4. dod8 la'4 fad
    re4. mi8 la4 sol8 mi

    %10
    si4. red8 mi4 fad
    si,4. fad'8 mi4 re
    fad2 dod4 lad'

    %13
    si re, dod fad~
    fad si, si4. si'8\mbreak
    lad4 r r2 lad4 r r2

    %16
    R1*6
    r2 r8 la8 dod la
    re la re, la'\mbreak la4 r8 la

    %24
    la la fad re la'4 r8 la
    la re4 dod si la8~
    la sold sold4 la8 la, dod la

    %27
    re4 r mi'2\mbreak
    re dod
    si la

    %30
    sol?4 si lad8 lad lad lad
    si si si si, r sol' sol, sol'\mbreak
    r mi mi, mi' r fad fad, fad'

    %33
    r re' re, re' r mi, mi, mi'
    r lad fad lad fad4 r8 fad
    dod4 r8 dod' dod4 r8 si\mbreak

    %36
    si4 r8 dod dod4 r8 fad,
    fad fad fad dod la re fad re
    la'[la] la si16 dod re8[re,] re16 mi fad sol

    %39
    la8 dod re dod re dod dod dod
    re dod dod dod re dod dod fad,\mbreak
    fad si, re si fad'[fad] fad sold16 lad

    %42
    si8[si,]  si16 dod re mi fad4 r
    dod'2 si
    la sold

    %45
    fad\mbreak mi
    re8 si' fad4 mid8[mid mid mid]
    fad8 la la,[la'] r re re, re'

    %48
    r sold, sold, sold' r dod dod, dod'
    r fad, fad, fad'\mbreak  r si si, si'
    r mid, dod mid r fad fad, fad'

    %51
    fad4 r8 sold sold4 r8 fad
    fad4 red8 sold sold mi sold mi
    dod sold' sold sold \mbreak mi la, dod la

    %54
    mi'[mi] mi fad16 sold la8[la,] la16 si dod re
    mi8 mi mi mi mi mi mi mi
    mi mi mi mi mi mi mid mid

    %57
    fad fad, la fad dod'[dod] dod red16 mid
    fad8[fad,] fad16 sold la si\mbreak dod4 la'8 dod
    re dod la dod re dod la dod

    %60
    re dod si dod re dod r4
    mi2 re
    dod si\mbreak

    %63
    la8 dod, re2 dod8 la'
    fad4 r mi'2\p
    re dod

    %66
    si la8 dod, re4~\mbreak
    re dod8 la' fad re\f fad re
    la'[la] la si16 dod re8[re,] re16 mi fad sol

    %69
    la8[la] la16 si dod la re,8 re' la dod
    re1
    dod,\mbreak

    %72
    si4. fad'8 fad4. mi8
    mi4. fad8 sol4 si,
    dod2 mi

    %75
    la,4. la8 re4 dod
    si2. mi4
    dod1

}

IIIvcn = \relative do {

    re1
    re'4. re8 la8. la16 fad8. fad16
    re4. re8 fad4 sol

    %4
    la4. mi8 la8. la16 sol8. fad16
    mi4. mi8 mi8. fad16 sol8. la16
    si4. si8 si8. si16 la8. sol16

    %7
    fad4 re sol4. sol8\mbreak
    la8. sol16 fad8. mi16 fad4 re
    sol4. sol8 fad4 mi

    %10
    red4. si8 dod4 red
    mi4. re8 dod4 si
    lad2 lad'4 fad

    %13
    si si, la la'
    sol1\mbreak
    fad4. sol8 fad8. mi16 re8. dod16 fad4 r r2

    %16
    R1*7
    r8 re fad re\mbreak la' [la] la si16 dod
    re8[re,] re16 mi fad sol la8 la, r la'

    %25
    fad re' mi, dod' re, si' dod, la'
    si, sold'16 fad mi[re dod si] la la dod mi la[sol? fad mi]
    fad4 r8 fad sol sol, la' la,\mbreak

    %28
    fad' fad, sol' sol, mi' mi, fad' fad,
    re' re, mi' mi, dod' dod, re' re,
    sol4 sol' fad \clef tenor \key re\major dod'

    %31
    <<
        {
            r fad sol2~
            sol fad~
            fad mi~
            mi re4
        }\\{
            re1
            dod
            si
            lad2 si4
        }
    >> \clef bass \key re\major r8 si,
    dod4 r8 dod re4 r8 si\mbreak
    dod4 r8 dod fad4 r8 fad

    %37
    si[la16 si] dod8 dod, fad re fad re
    la'[la] la si16 dod re8[re,] re16 mi fad sol
    la8 la la la la la la la

    %40
    la la la la la la lad lad\mbreak
    si si, re si fad'[fad] fad sold16 lad
    si8[si,] si16 dod re mi fad4 re'8 si

    %43
    mi mi, fad' fad, re' re, mi' mi,
    dod' dod, re' re, si' si, dod' dod,
    la' la, si' si,\mbreak sold' sold, la' la,

    %46
    re2 dod4 \clef tenor \key re\major <<
        {
            sold''
            la1
            sold
            fad2\mbreak fad
            mid2 fad8[\clef bass \key re\major fad,]
        }\\{
            r4
            r dod' re2~
            re dod~
            dod\mbreak si~
            si la8 [\clef bass \key re\major fad]
        }
    >> la fad
    sold4 r8 sold la4 r8 la

    %52
    sold sold sid sold dod dod, mi dod
    fad[mi16 fad] sold8 sold,\mbreak dod la dod la
    mi'[mi] mi fad16 sold la8[la,] la16 si dod re

    %55
    mi4 sold8 mi la sold mi sold
    la sold mi sold  la sold mid dod
    fad, fad' la fad dod' [dod] dod red16 mid

    %58
    fad8[fad,] fad16 sold la si\mbreak dod4 la8 la
    la la la la la la la la
    la la la la la la fad re

    %61
    sol sol, la' la, fad' fad, sol' sol,
    mi' mi, fad' fad, re' re, mi' mi\mbreak
    dod [la] re fad sol[fad16 sol] la8 la,

    %64
    re, la''\p fad re sol sol, la' la,
    fad' fad, sol' sol, mi' mi, fad' fad,
    re' re, mi' mi, dod'[la] re fad\mbreak

    %67
    sol[fad16 sol] la8 la, r re\f fad re
    la'[la] la si16 dod re8[re,] re16 mi fad sol
    la8[la] la16 si dod la fad8 sol la la,

    %70
    re1
    lad'\mbreak
    si4. si8 la!4\tr~la8. sol32 fad

    %73
    sol4. fad8 mi4 re
    dod1
    re4. dod8 si4 la

    %76
    sol1
    fad

}

IIIbcn = \relative do {

    re1
    re'4. re8 la8. la16 fad8. fad16
    re4. re8 fad4 sol

    %4
    la4. mi8 la8. la16 sol8. fad16
    mi4. mi8 mi8. fad16 sol8. la16
    si4. si8 si8. si16 la8. sol16

    %7
    fad4 re sol4. sol8\mbreak
    la8. sol16 fad8. mi16 fad4 re
    sol4. sol8 fad4 mi

    %10
    red4. si8 dod4 red
    mi4. re8 dod4 si
    lad2 lad'4 fad

    %13
    si si, la la'
    sol1\mbreak
    fad4. sol8 fad8. mi16 re8. dod16 fad4 r r2

    %16
    R1*7
    r8 re fad re\mbreak la' [la] la si16 dod
    re8[re,] re16 mi fad sol la8 la, r la'

    %25
    fad re' mi, dod' re, si' dod, la'
    si, sold'16 fad mi[re dod si] la la dod mi la[sol? fad mi]
    fad4 r8 fad sol sol, la' la,\mbreak

    %28
    fad' fad, sol' sol, mi' mi, fad' fad,
    re' re, mi' mi, dod' dod, re' re,
    sol4 sol' fad8 fad lad fad

    %31
    si si, re si mi mi sol mi\mbreak
    la la dod la re re, fad re
    sol sol  si sol dod, dod mi dod

    %34
    fad fad lad fad si4 r8 si,
    dod4 r8 dod re4 r8 si\mbreak
    dod4 r8 dod fad4 r8 fad

    %37
    si[la16 si] dod8 dod, fad re fad re
    la'[la] la si16 dod re8[re,] re16 mi fad sol
    la8 la la la la la la la

    %40
    la la la la la la lad lad\mbreak
    si si, re si fad'[fad] fad sold16 lad
    si8[si,] si16 dod re mi fad4 re'8 si

    %43
    mi mi, fad' fad, re' re, mi' mi,
    dod' dod, re' re, si' si, dod' dod,
    la' la, si' si,\mbreak sold' sold, la' la,

    %46
    re2 dod8 dod mid dod
    fad fad la fad si si re si
    mi, mi sold mi la la dod la

    %49
    re, re fad re\mbreak sold sold si sold
    dod, dod mid dod fad fad la fad
    sold4 r8 sold la4 r8 la

    %52
    sold sold sid sold dod dod, mi dod
    fad[mi16 fad] sold8 sold,\mbreak dod la dod la
    mi'[mi] mi fad16 sold la8[la,] la16 si dod re

    %55
    mi8 mi mi mi mi mi mi mi
    mi mi mi mi mi mi mid mid
    fad fad la fad dod' [dod] dod red16 mid

    %58
    fad8[fad,] fad16 sold la si\mbreak dod4 dod8 la
    re la dod la re la dod la
    re la dod la re la fad re

    %61
    sol sol, la' la, fad' fad, sol' sol,
    mi' mi, fad' fad, re' re, mi' mi,\mbreak
    dod' [la] re fad sol[fad16 sol] la8 la,

    %64
    re, la''\p fad re sol sol, la' la,
    fad' fad, sol' sol, mi' mi, fad' fad,
    re' re, mi' mi, dod'[la] re fad\mbreak

    %67
    sol[fad16 sol] la8 la, re, re'\f fad re
    la'[la] la si16 dod re8[re,] re16 mi fad sol
    la8[la] la16 si dod la fad8 sol la la,

    %70
    re1
    lad'\mbreak
    si4. si8 la!4\tr~la8. sol32 fad

    %73
    sol4. fad8 mi4 re
    dod1
    re4. dod8 si4 la

    %76
    sol1
    fad

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 s4 <6>
    s2 <6>
    s1*3
    <6>1s2 <6>4 <7!>
    s2 <6+>
    <6> <6>4 <5>
    s2 <6\\>
    <6>2 s4 <_+>
    s2 s4 <6>
    <7>2 <6>
    <3+>1
    <_+>
    s1*10
    s4 <_+> s2
    <6> <6 5>
    <6 5> <6 5>
    <6 5> <6 5>
    <7>4 <6> <_+>2
    s <7>
    <7> <7>
    <7> <7>
    <7> s
    <7 _+> <7>
    s1*3
    s2 <6 4>
    <6 4>1
    s
    s
    <6 5>2 <6 5>4 <_3+>
    <6 5>2 <6+ 5>4 <_+>
    <6 5>2 <6 5>
    <7>4 <6> s2
    s <7>
    <7> <7>
    <7> <7>
    <7>1
    <3+>2 <7>4 s8 <6>
    <_+>1
    s
    <_+>
    <_+>2 <6 4>
    <6 4> <_+>4 <6>
    s1*4
    <6 5>2 <6 5>
    <6 5> <6 5>
    <5>1
    s
    <6 5>2 <6 5>
    <6 5> <5>
    s1
    s
    s2 <6>
    s1
    <7>2 <5>
    s <4\+ 2>
    <6>1
    <5>
    s
    <7>2 <6>
    <3+>

}

forma = {

    \key re\major
    \time 2/2
    \tempo 2 = 55
    \repeat volta 2 {s1*14}
    \alternative {{s1}{\break s}}
    \set Score.currentBarNumber = #16
    \tempo 2 = 60
    s1*55
    \bar "||"\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup "[Adagio]"
    \tempo 2 = 40
    s1*7
    \bar "|."


}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}

IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}



IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzine

}

IVvlIn =  \relative do'' {

    re4 fad
    mi la re,8(fad) mi re
    dod4 si8 la re4. dod8
    si la sol fad mi si' la sol

    %4
    fad4 mi8 re re'4 fad
    mi la re,8 fad mi re
    dod4 si8 la re'(dod) si(la)

    %7
    si la sol fad\mbreak mi4. re8
    re2 fad4 mi8 re
    mi4 fad8 mi re dod si la

    %10
    sold4. la8 si4 dod8 re
    dod4 si8 la si4 dod8 re
    dod4 si8 la la'4 sold8 fad

    %13
    mi4 re8 dod re4 dod8 si\mbreak
    dod4 si8 la la' sol fad mi
    fad mi re dod si4. la8

    %16
    la2 re4 fad
    mi la re,8 fad mi re
    dod4 si8 la re4. dod8

    %19
    si la sol fad mi si' la sol
    fad4 mi8 re re'4 fad
    mi la\mbreak re,8 fad mi re

    %22
    dod4 si8 la re' dod si la
    si la sol fad mi4. re8
    re2 fad4 si

    %25
    lad sold8 fad si si, re mi
    fad2 fad8 re dod si
    sol' fad mi re dod4. si8

    %28
    si2\mbreak re8 fad la la,
    si re mi fad sol la si si,
    dod4 si8 la re mi fad sol

    %31
    la dod, re mi fad4. mi8
    re2 re4 fad
    mi la re,8 fad mi re

    %34
    dod4 si8 la re4. dod8
    si la sol fad\mbreak mi si' la sol
    fad4 mi8 re re'4 fad

    %37
    mi la re,8 fad mi re
    dod4 si8 la re' dod si la
    si la sol fad mi4. re8

    %40
    re2 fad4 si
    mi, do'8 si la sol fad mi
    red4 si mi8 si fad' si,\mbreak

    %43
    sol'4 la8 sol fad4. mi8
    mi2 mi8 sol fad la
    sol4 fad8 mi si dod re mi

    %46
    dod4 si8 la re mi fad sol
    mi fad sol la fad4 mi8 re
    la'2 re,4 fad

    %49
    mi la re,8 fad mi re\mbreak
    dod4 si8 la re4. dod8
    si la sol fad mi si' la sol

    %52
    fad4 mi8 re re'4 fad
    mi la re,8 fad mi re
    dod4 si8 la re' dod si la

    %55
    si la sol fad mi4. re8
    re2

}

IVvlan = \relative do'{

    re4 re'
    dod la si sol
    la la fad re
    sol mi la dod,

    %4
    re2 fad4 re
    dod la si sol
    la sol' fad re

    %7
    sol mi\mbreak la la,
    re2 re4 re
    dod re si re

    %10
    mi4. fad8 sold4 mi
    la la sold mi
    la, si dod re

    %13
    dod la si mi\mbreak
    la, si dod la
    re si mi mi,

    %16
    la2 re4 re'
    dod la si sol
    la la fad re

    %19
    sol mi la dod,
    re2 fad4 re
    dod la\mbreak si sol

    %22
    la sol' fad re
    sol mi la la,
    re2 fad4 sol

    %25
    dod, fad fad si
    lad2 si4 r
    si r si lad

    %28
    si re,\mbreak la' fad
    sol4. la8 sol4 sol
    mi2 la4 fad

    %31
    mi8 la fad mi re4. dod8
    dod2 re4 re'
    dod la si sol

    %34
    la la fad re
    sol mi\mbreak la dod,
    re2 fad4 re

    %37
    dod la si sol
    la sol' fad re
    sol mi la la,

    %40
    re2 re4 sol
    mi mi mi la
    fad red mi si\mbreak

    %43
    mi mi mi4. red8
    mi4 sol8 la si4 si,
    si la si sold'

    %46
    la mi fad la
    la2. si8 re,
    dod4 la re re'

    %49
    dod la si sol\mbreak
    la la fad re
    sol mi la dod,

    %52
    re2 fad4 re
    dod la si sol
    la sol' fad re

    %55
    sol mi la la,
    re2

}

IVvcn = \relative do {

    re4 re'
    dod8 la dod la si la sol mi
    la, la' sol la fad re fad re
    sol fad mi sol la si dod la

    %4
    re, re' la fad re4 re'
    dod8 la dod la si la sol si
    la la sol la fad re fad re

    %7
    sol fad mi re\mbreak la'4 la,
    re2 re4 re'
    dod8 la re dod si dod re re,

    %10
    mi mi, mi' fad sold si sold mi
    la, la' dod la mi' mi, sold mi
    la la, si si' dod dod, re re'

    %13
    dod la dod la si la si sold\mbreak
    la la, si si' dod si la dod
    re dod si la mi'4 mi,

    %16
    la,2 re4 re'
    dod8 la dod la si la sol mi
    la, la' sol la fad re fad re

    %19
    sol fad mi sol la si dod la
    re, re' la fad re4 re'
    dod8 la dod la\mbreak si la sol si

    %22
    la la sol la fad re fad re
    sol fad mi re la'4 la,
    re2 re8 fad mi sol

    %25
    fad re fad re sol,4 sol'
    fad8 sol fad mi re si re si
    mi re mi dod fad4 fad,

    %28
    si8 si' re si\mbreak fad la re, re'
    sol, la sol fad mi fad sol mi
    la si sol la fad la re, mi

    %31
    dod la si dod re mi fad sol
    la2 re,4 re'
    dod8 la dod la si  la sol mi

    %34
    la, la' sol la fad re fad re
    sol fad mi sol\mbreak la si dod la
    re, re' la fad re4 re'

    %37
    dod8 la dod la si la sol si
    la la sol la fad re fad re
    sol fad mi re la'4 la,

    %40
    re2 re'8 dod si sol
    do si la si do si do la
    si, si' la si sol si red, fad\mbreak

    %43
    mi fad sol la si4 si,
    mi mi8 fad sol si red, fad
    mi sol fad la sold la si mi,

    %46
    la la sol? la fad la re, re'
    dod si la dod re4 sold,
    la8 sol fad mi re4 re'

    %49
    dod8 la dod la si la sol mi
    la, la' sol la fad re fad re
    sol fad mi sol la si dod la

    %52
    re, re' la fad re4 re'
    dod8 la dod la si la sol si
    la la sol la fad re fad re

    %55
    sol fad mi re la'4 la,
    re2

}

IVbcn = \relative do {

    re4 re'
    dod la si sol
    la, la' fad re
    sol mi la la,

    %4
    re2 re4 re'
    dod la si sol
    la sol fad re

    %7
    sol mi\mbreak la la,
    re2 re4 re'
    dod re si re,

    %10
    mi4. fad8 sold4 mi
    la, la' sold mi
    la, si dod re

    %13
    dod la si mi\mbreak
    la si dod la
    re si mi mi,

    %16
    la,2 re4 re'
    dod la si sol
    la, la' fad re

    %19
    sol mi la la,
    re2 re4 re'
    dod la\mbreak si sol

    %22
    la sol fad re
    sol mi la la,
    re2 re4 mi

    %25
    fad re sol, sol'
    fad8 sol fad mi re4 si
    mi dod fad fad,

    %28
    si si'\mbreak  fad re
    sol4. fad8 mi4 sol
    la sol fad re

    %31
    dod8 la si dod re mi fad sol
    la2 re,4 re'
    dod la si sol

    %34
    la, la' fad re
    sol mi\mbreak la la,
    re2 re4 re'

    %37
    dod la si sol
    la sol fad re
    sol mi la la,

    %40
    re2 re'4 si
    do la8 si do4 la
    si, si' sol red\mbreak

    %43
    mi la si si,
    mi mi8 fad sol4 red
    mi fad sold mi

    %46
    la sol! fad re
    dod la re si
    la2 re4 re'

    %49
    dod la si sol\mbreak
    la,  la'  fad re
    sol mi la la,

    %52
    re2 re4 re'
    dod la si sol
    la sol fad re

    %55
    sol mi la la,
    re,2

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <6>1
    s2 <6>
    s1
    s
    <6>
    s2 <6>
    s1
    s
    <6>
    <_+>2 <6>
    s <6>
    s <6>
    <6> <6\\>4 <_+>
    s2 <6>
    s <_+>
    s1
    <6>
    s2 <6>
    <6 5>1
    s
    <6>
    s2 <6>
    <6 5>1
    s2 <6>
    <3+>4 <6> s2
    <_+> <6>
    <6 5> <_+>
    s2 <6>
    s1
    s2 <6>
    <6>1
    s
    <6>
    s2 <6>
    <6 5> s
    s1
    <6>
    s2 <6>
    <6 5>1
    s2 s4 <6>
    s1
    <3+>2 s4 <6>
    s2 <_+>
    s <6>4 <6>
    s2 <6>
    s <6>
    <6> s4 <6\\>
    s1
    <6>2 <6>
    s <6>
    <6 5>1
    s
    <6>
    s2 <6>
    <6 5>

}

forma = {

    \key re\major
    \time 2/2
    \tempo 1 = 55
    \partial 2 s2
    s1*55
    s2
    \bar"|."


}

IVvlI = {
    \IVglobal
    <<\IVvlIn \forma>>

}

IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>

}

IVvc = {
    \IVglobal
    \clef bass
    <<\IVvcn \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{I gloriosi presagi di Scipione Africano (1704) - Ouverture}
        composer = \markup \center-column{"A. Ariosti (1666 - 1729)"}

    }

    \markup \huge {[I.1] Ouverture }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"[Violino II]"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \pageBreak

    \markup \huge {[I.2] Gigue }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"[Violino II]"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Vespasiano - Ouverture}
        composer = \markup \center-column{"A. Ariosti (1666 - 1729)"}

    }

    \markup \huge {[II.1] Ouverture }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"[Violino II]"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
                \set Staff.shortInstrumentName = "vc"
                \IIIvc
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \pageBreak

    \markup \huge {[II.2] Gavotte }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"[Violino I e II]"}
                \set Staff.shortInstrumentName = "vl"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
                \set Staff.shortInstrumentName = "vc"
                \IVvc
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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
