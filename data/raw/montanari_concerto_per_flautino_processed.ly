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

Ifln = \relative do'' {

    R1*9
    r2 sib'8[fa] re16 fa re fa
    sib(la) sib8 r sib do la fa do'

    %12
    re16[(do) re8] r fa, sol fa16 sol mib8.[re16]
    re4 r8 fa sol[la] sib16 la sib sol
    la8[fa] do16 fa do fa la8[fa] do16 fa do fa

    %15
    do'8[mi,] do16 mi do mi sib'8[mi,] do16 mi do mi\mbreak
    la8[fa] do16 fa do fa do'8[sib16 la]sol8 fa
    re'[do16 sib]do8 re mi, do fa re'

    %18
    sol,4. fa8 fa4 r
    R1*4
    r16 fad [re fad] la, fad' re fad la[fad re fad] la, fad' re fad

    %24
    sib [sol re sol] sib, sol' re sol sib[sol re sol] sib, sol' re sol
    sib [sol mi sol] do, sol'  mi sol\mbreak sib [sol mi sol] do, sol'  mi sol
    la[fa do fa] la, fa' do fa la[fa do fa] la, fa' do fa

    %27
    la[mib! do mib] la, mib' do mib la[mib do mib] la, mib' do mib
    sib' [fa re fa] sib,[fa' re fa] sib [fa re fa] sib,[fa' re fa]
    si sol re sol si,[sol' re sol] si sol re sol si,[sol' re sol]\mbreak

    %30
    do sol mib sol do,[sol' mib sol] do sol mib sol do,[sol' mib sol]
    la[fad re fad] la, fad' re fad la[fad re fad] la, fad' re fad
    sib[sol re sol] sib, sol' re sol sib[sol re sol] sib, sol' re sol

    %33
    sib[sol mi sol] dod, sol' mi sol sib[sol mi sol] dod, sol' mi sol
    fa8 re fa la\mbreak re4 r8 mi16 dod
    re4 r8 mi16 dod re8[dod16  sib] la8 sol

    %36
    fa4 mi re r
    R1*7
    r2 sib'8[fa] re16 fa re fa

    %45
    sib(la) sib8 r sib do la fa do'
    re16[(do) re8] r fa, sol fa16 sol mib4
    re r8 do re16[sib re re] re sib re re\mbreak

    %48
    mi[do mi mi] mi do mi mi fa[re fa fa] fa re fa fa
    sol mi sol sol sol[mi sol sol] la8 fa la sib
    do4~do8 sib16 la re8[fa,16 sol] mi8. fa16

    %51
    fa4 r r2
    R1*3
    sib16 sib fa fa re[re fa fa] sib sib fa fa re[re fa fa]

    %56
    sib[sib mib, mib] do do mib mib \mbreak la[la fa fa] do[do mib mib]
    sib'[sib fa fa] re re fa fa sib[sib fa fa] re re fa fa
    lab[lab fa fa] re re fa fa lab[lab fa fa] re re fa fa

    %59
    sib[sib sol sol] mib mib sol sol sib[sib sol sol] mib mib sol sol
    do[do sol sol] mib mib sol sol do[do sol sol] mib mib sol sol
    la8 fa r sib sib16 fa re fa sib, [fa' re fa]

    %62
    sib fa re fa sib, [fa' re fa] la fa do fa la,[fa' do fa]
    la fa do fa la,[fa' do fa] la mib do mib la, [mib' do mib]
    sib'8 la16 sol fa8[mib] re4 do

    %65
    sib r r2
    R1*4

}

IvlIn = \relative do'' {

    sib8 re16 do sib8[sib] fa'4 r8 sol16 la
    sib8[la16 sol] fa8 mib re sib r fa'
    sol fa r fa sol fa r fa

    %4
    sol fa mib re do4 r8 fa
    fa[sol16 la] sib8 re, mib4 r8 mib
    mib fa16 sol fa8[mib] re16 sib' la sib fa8[sib]

    %7
    sol16 sib la sib mib,8[sib'] fa16 do' la sib re,8[sib']
    mib,16 sib' la sib do,8[fa]\mbreak re16[sib do re] mib fa sol la
    sib8 re, do la' sib sib, fa' sol

    %10
    do,4. sib8 sib4 r
    R1*7
    r2 fa'8 la16 sol fa8[fa]

    %19
    do'4 r8 mi, fa sol16 la sol8[do]
    la fa la sib do mib,! mib mib
    mib re16 do re8[sib'] re, sib' do, la'

    %22
    sib, sib' sib la la sol sol fad\mbreak
    fad fad fad fad fad fad fad fad
    sol sol, sol' sol sol sol sol sol

    %25
    mib mib, mib mib' mib mib mib mib
    fa? fa, fa fa' fa fa fa fa
    mib mib, mib mib' mib mib mib mib

    %28
    re re, re re' re re re re
    re re re re fa fa fa fa
    mib mib, mib mib' mib mib mib mib

    %31
    do do, do do' do do do do\mbreak
    sib sib sib sib re re re re
    sol sol, sol sol' mi mi mi mi

    %34
    la,4 r8 la la la la la
    la  la, la la' la4 r8 sol
    la4 la, re8 la' la la

    %37
    re16[(dod re fa) ] mi(re mi sol) fa8 fad fad fad
    sol16[(fad sol la)] sib8 fad sol16[(fad sol la)] sib8 fad
    sol re re sib' la re, re la'\mbreak

    %40
    sib la16 sol re8[fad] sol16 la sol la sib8[mi,]
    fa?4~fa8 sol16 mi fa4~fa8 sib
    la[sol16 fa] do8 mi fa[fa16 sol] la8 sib

    %43
    la mib! mib mib mib re16 do re8[sib']
    re, sib' do, la' sib,4 r
    R1*5

    %50
    r2 r4 r8 do
    la fa la do fa4~fa8 sol16 fa
    mib4~mib16 sol fa mib re8 sib' sib fa

    %53
    sol fa sib fa \mbreak sol fa sib re,
    mib4. re16 do re8 sib' do,4
    sib r r2

    %56
    R1*5
    r4 r8 fa' fa2~
    fa1~

    %63
    fa2 mib
    re8 fa16 mib re8[do] sib4 la
    sib8[re16 do] sib8 sib fa'4 r8 sol16 la

    %66
    sib8[la16 sol] fa8 mib re sib r fa'
    sol fa sib fa sol fa sib re,
    mib4~mib8 re16 do re8 sib' do,4

    %69
    sib2 r

}

IvlIIn = \relative do'' {

    re,8 fa16 mib re8[re] do do' do mib
    mib mib mib la, sib4 r8 sib
    sib sib, r sib' sib sib, r sib'

    %4
    sib sib sib sib la4 r8 la
    sib4 re8 sib la[mib'16 fa] mib8 re
    do4 r8 la sib fa' fa fa

    %7
    sol sib, sib sol' fa sib, sib fa'
    mib do do do re16 sib do re mib [fa sol la]
    sib8 re, do la' sib sib, fa' sib,\mbreak

    %10
    sib4 la sib r
    R1*7
    r2 la8[do16 sib] la8 la

    %19
    sol sol'8 sol sib sib sib sib mi,
    fa fa, r do' fa, do' do do
    fa,4 r8 fa' sib,4 la8 fa'

    %22
    re re re do do sib sib la
    la la la la re re re re
    sol, re re re re re re re

    %25
    sol sol sol sol do do do do
    fa, do' do do\mbreak do do do do
    do do do do do do do do

    %28
    sib fa fa fa fa fa fa fa
    fa sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %31
    fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol
    mi mi mi mi dod' dod dod dod

    %34
    re4 r8 mi fa fa, fa mi
    fa fa fa mi fa4 r8 sol\mbreak
    la4 la, re8 la' la la

    %37
    re16(dod re fa) mi[(re mi sol)] fa8 re re re
    re4 r8 do sib re sol re
    re sib sol sol' fad re re la'

    %40
    sib[la16 sol] re8 fad sol16 la sol la sib8[mi,]
    fa?4~fa8 sol16 mi fa4~fa8 sib
    la[sol16 fa] do8 mi fa[fa16 sol] la8 sib

    %43
    la mib! mib mib mib re16 do re8[sib']
    re, sib' do, la' sib,4 r
    R1*5

    %50
    r2 r4 r8 do
    la fa la do fa do la fa'
    sib, sib do do fa,4 r8 sib'

    %53
    sib sib, r sib' sib sib, r sib
    la la do do fa, sib sib8. la16
    sib4 r r2

    %56
    R1*5
    r4 r8 re, re re re sib'
    re, re re sib' do, do do la'\mbreak

    %63
    do, do do la' do, do do la'
    sib4 sib8 mib, fa4 fa
    sib8[re16 do] sib8 sib fa'4 r8 sol16 la

    %66
    sib8[la16 sol] fa8 mib re sib r sib'
    sib sib, r sib sib sib, r sib'
    la la do do fa, sib sib8. la16

    %69
    sib2 r

}

Ibcn = \relative do {

    sib'4 r8 sib la sol la fa
    sol mib la fa sib sib, re sib
    mib re mib sib mib re mib sib

    %4
    mib re do sib fa' sol fa mib
    re4 sib do8 do'16 re do8[sib]
    la4 fa sib8 sib, re sib

    %7
    mib4 r8 mib re4 r8 re
    do4 fa, sib4 r8 do
    re mib fa fa, sol'4 r8 mib

    %10
    fa mib fa fa, sib4 r
    sib8 sib re sib la4 r8 fa'\mbreak
    sib sib, re sib mib4 fa

    %13
    sib8 sib, re sib mib4 r8 mi
    fa4 r fa r
    sol r mi r

    %16
    fa r fa r8 la
    sib4 sib do r8 sib
    do sib do do, fa4 r8 fa

    %19
    mi re mi do re sib mi do
    fa4 r8 sol la4 la
    sib r8 re, mib4 fa

    %22
    sib, sol do dod
    re r r2
    R1*12\mbreak

    %36
    r2 r8 re16[mi] fa8 mi
    fa re la' la, re do do do
    sib4 la sol r8 la

    %39
    sib sol16 la sib8[do] re4 r8 fad
    sol do re re, sol4 r8 do
    la fa do do' la fa do mi

    %42
    fa sib do do, fa4 r8 sol
    la fa sol la sib4 r8 mib,?
    fa4 fa, sib r8 do

    %45
    do re do sib la fa r la\mbreak
    sib sib re sib mib re do fa
    sib, sib' la fa sib sib, r sib

    %48
    do4 r8 do re4 r8 re
    mi4 r8 do fa4 r8 sol
    la sol la fa sib sol do do,

    %51
    fa4 r8 sol la sol la fa
    sol sol, la' la, sib' sib, re sib
    mib re r re mib re r sib

    %54
    do do' fa, la sib mib, fa fa,\mbreak
    sib4 sib' sib sib
    fa fa fa fa

    %57
    re sib sib sib
    re sib sib sib
    mib mib mib mib

    %60
    mib mib mib mib
    fa r r2
    R1*3

    %65
    sib4 r8 sib la sol la fa
    sol mib la fa sib sib, re sib
    mib re16 do sib8[re] mib re16 do sib8[sib']

    %68
    do do fa, la sib mib, fa fa,
    sib2 r

}

Ibfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s1*4
    <6>1
    s1*16
    s2 s4 <7 5>
    s1*13
    s2 s4 s8 <6\\>
    s1
    <6>4 <6\\> s2
    s <_+>
    s1*17
    <6>4 <7> s2
    <6>4 <7> <6> s
    s1 <6>4 <5> s2

}

forma = {
    \key sib\major
    \time 2/2
    \tempo 2 = 60
    s1*69
    \bar "|."

}

Ifl = {
    \Iglobal
    <<\Ifln \forma>>

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

IIfln = \relative do'' {

    re'2.~
    re4. do8 sib la
    sib la sol4 re

    %4
    mib8 do fad la do[re16 sib]
    do4. la8 sib fad
    sol mi fad2

    %7
    sol2.
    dod,16 la dod mi  sol8 sib la sol
    dod re mi,2

    %10
    re2.
    R2.*4
    do'2.~

    %16
    do4. re8 do sib\mbreak
    la sol fa4 do'
    re16 (fa, mi fa) re' (fa, mi fa) re' (fa, mi fa)

    %19
    do' mi,? re mi do' mi, re mi do' mi, re mi
    do' re, do re sib' re, do re sib' re, do re
    sib' do, sib do la' do, sib do la' do, sib do

    %22
    la' sib, la sib sol' sib, la sib sol' sib, la sib
    sol' la, sol la fa' la, sol la fa' la, sol la\mbreak
    fa'8 sol mi16 sol mi sol do,8  mi

    %25
    fa sol la sib do la
    re4. do8 sib la
    sib sol fad2

    %28
    sol2.
    R2.*2
    la4\parenthesize ~ la8 fad re la'

    %32
    sib la sib4 r
    si4. sol8 fa? si
    do si do4 dod

    %35
    re4. do?8 sib la
    sib sol lab fad sol re
    do'4. la?8 sib fad\mbreak

    %38
    sol4 fad2
    sol2.
    R2.*9

}

IIvlIn = \relative do'' {

    R2.*9
    la'8.[sol16 la8. sol16 fa8. mi16]
    fa8 re fa la fa re

    %12
    sib'2.~
    sib8. [la16 sib8. re16 do8. sib16]
    la8 sib sol2

    %15
    fa2.
    R
    r4 la, la

    %18
    la la la
    sol sol sol
    fa fa fa

    %21
    mi mi mi
    re re re
    do do do

    %24
    sib sib sib
    la2.
    R2.*2

    %28
    re''8 do re do sib la\mbreak
    sib la sib do re do
    sib la sib re do sib

    %31
    la2.
    R2.*7
    re,8 do re do sib la

    %40
    sib la sib re do sib
    la4 re2~
    re4 do2~

    %43
    do4 sib sol'
    lab sol fad
    sol do,2~

    %46
    do4. la?8 sib fad
    sol mib' la,2\tr
    sol2.

}

IIvlIIn = \relative do'' {

    R2.*9
    fa8.[mi16 fa8. mi16 re8. dod16]
    re4 la re~

    %12
    re8 sol16 la sib8 sol sib sol
    mi4 fa sol
    do,8 fa mi2

    %15
    fa2.
    R
    r4 fa, fa

    %18
    fa fa fa
    mi mi mi
    re re re

    %21
    do do do
    sib sib sib
    la la la

    %24
    sol do do
    fa2 r4
    R2.*2\mbreak

    %28
    sib'8 la sib la sol fad
    sol fad sol la sib la
    sol fad sol sib la sol

    %31
    fad2.
    R2.*7
    sib,8 la sib la sol fad

    %40
    sol fad sol sib la sol
    fad2 fad4
    sol2 la4

    %43
    re,2 re'4
    mib re do
    sib4. re8 do sib

    %46
    la4 la do
    la8 do sol4. fad8
    sol2.

}

IIbcn = \relative do {

    sol'4 sib sol
    fad re' fad,
    sol sib sol

    %4
    do do, do'
    la fad re
    mib8 do re4 re,

    %7
    sol' sib sol
    sol2 sol4
    la8 sol la4 la,

    %10
    re2 la4
    re2 re4
    sol sol, sib

    %13
    do re mi
    fa8 sib, do4 do,
    fa la' fa

    %16
    mi do' mi,\mbreak
    fa2.
    R2.*7

    %25
    fa4 fa fa
    fad re fad
    sol8 do, re4 re,

    %28
    sol2.
    sol'
    sol4 sol, sib

    %31
    re re' fad,
    sol sol sol
    fa fa fa

    %34
    mib mib  mi
    fad re fad
    sol do sib

    %37
    la fad re
    sol8 do re4 re,\mbreak
    sol2.

    %40
    sol4 sol, do
    re2 re4
    mi2 fad4

    %43
    sol2 sib4
    do sib la
    sol4. sib8 la sol

    %46
    fad4 fad re
    mib8 do re4 re,
    sol2.

}

IIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*4
    <6\\>4 <6> s
    s2.*28
    <6>4 s <6\\>
    s2.*9
    <6>4 <6> <6\\>

}

forma = {
    \key sol\minor
    \time 3/4
    \tempo 4 = 60
    s2.*48
    \bar "|."

}

IIfl = {
    \IIglobal
    <<\IIfln \forma>>

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

IIIfln = \relative do'' {

    R2*25
    fa16 re sib re fa8 sib
    la sib4 fa8

    %28
    sol16 sib sol mib do la do fa
    re8 sib r re'
    do16 sib do re fa,8 do'

    %31
    sib16 la sib do mi,8 sib'
    la16 sol la sib do,8 fa
    do16 la do fa do la do fa

    %34
    re sib re fa re sib re fa\mbreak
    do la do fa do la do fa
    re sib re fa re sib re fa

    %37
    mi do mi sol mi do mi sol
    fa do fa la fa do fa la
    sol mi sol do sol mi sol do

    %40
    la fa la do la fa la do
    sol mi sol do sol mi sol do
    la8 do16 sib do8 fa,

    %43
    fa4 mi
    fa2\mbreak
    R2*8

    %53
    sib16 sol re sol sib8 mib!
    sol,4 fad8 sol
    la16 fad re fad la8 do

    %56
    do4 sib8 re,
    mib16 mib mib mib do' mib, mib mib
    do' mib, mib mib do' mib, mib mib

    %59
    do' re, re re sib' re, re re
    sib' re, re re sib' re, re re
    sib' do, do do la' do, do do

    %62
    la' do, do do\mbreak la' do, do do
    la' sib, sib sib sol' sib, sib sib
    sol' sib, sib sib sol' sib, sib sib

    %65
    sol' la, la la fad' la, la la
    fad' la, la la fad' la, la la
    sol'8 r r4

    %68
    R2*20\mbreak
    sib,16 re sib re fa8 sib
    la sib4 fa8

    %90
    sol16 sib sol mib do la do fa
    re8 sib r re
    re16(do re fa) re fa re fa

    %83
    re16(do re fa) re fa re fa
    do(sib do fa) do fa do fa
    do(sib do fa) do fa do fa

    %96
    sib,(la sib sol') sib, sol' sib, sol'\mbreak
    sib,(la sib sol') sib, sol' sib, sol'
    la,8 fa'4 sol16 la

    %99
    sib8[la sol fa]
    mi16 fa re mi do re sib do
    la fa' fa fa fa do fa fa

    %102
    fa re fa fa fa do fa fa
    fa8 sol16 la sib8 sol
    la [re fa, re']

    %105
    la4 sol
    fa r
    R2*9\mbreak

    %116
    sib16 la sib re sib re sib re
    sib la sib re sib re sib re
    la sol la do la do la do

    %119
    la sol la do la do la do
    sib8 fa re16 fa re fa
    sib, fa' re fa sib, fa' re fa

    %122
    do fa do fa la, fa' do fa
    la, fa' do fa la, fa' do fa
    re8[sib re fa]\mbreak

    %125
    sib16 do la do sib do la do
    sib8 mib16 re do8 sib
    la fa sib16 la sib do

    %128
    re,4 do\tr
    sib r
    R2*10

}

IIIvlIn = \relative do'' {

    sib16 do re mib fa8 la
    sib sib,4 sib'8
    la fa fa sol16 la

    %4
    sib8 sib,4 fa'8
    sol sol sol mib16 sol
    fa8 sib4 re,8

    %7
    mib re16 mib do8 fa
    re[sib re fa]
    sib4 r8 sol16 sib

    %10
    la sol la sib la fa sol la
    sol fa sol la sol mi fa sol
    la8[fa (mi fa)]\mbreak

    %13
    re'[fa,(mi fa)]
    do'[fa,(mi fa)]
    re'4 r8 fa,

    %16
    fa4 mi
    fa2
    fa8 sol16 la sib8 fa

    %19
    sol[mib(re do)]
    la'[mib(re do)]
    sib'4 r16 do la do

    %22
    sib4 r16 do la do
    sib8[do, re sib']
    re,4 do

    %25
    sib2
    R2*19\mbreak
    fa'8 sol16 la sib8 fa

    %46
    sol[mib(re do)]
    la'[mib(re do)]
    sib'4 r16 do la do

    %49
    sib4 r16 do la do
    sib8[do, re sib']
    re,4 do

    %52
    sib2
    R2*3
    r8 sol'[sol sol]

    %57
    sol4 sol
    sol sol
    fa fa

    %60
    fa fa
    mib mib
    mib mib

    %63
    re re
    re re\mbreak
    do do

    %66
    do do
    sib16 la sib do re8 fad
    sol sol,4 sol'8

    %69
    fad re re mi16 fad
    sol8 sol,4 sol'8
    mi do do re16 mi

    %72
    fa4 r8 sol16 mi
    fa8 mi16 re do8 sib
    la[fa la do]

    %75
    mib4 r8 re16 do
    re8[sib re fa]
    lab4 r8 sol16 fa\mbreak

    %78
    sol8 mib16 sol fa8 re16 fa
    mib4 r8 sol
    mib do16 mib re8 si16 re

    %81
    do8 fa4 mib8
    re16 do sib re do sib la do
    sib do re mib fa8 la

    %84
    sib sib,4 sib'8
    la fa fa sol16 la
    sib8[do, re sib']

    %87
    re,4 do
    sib2
    R2*17\mbreak

    %106
    fa16 sol la sib do8 mi
    fa fa,4 fa'8
    mi do do re16 mi

    %109
    fa8 fa,4 fa'8
    mib? \parenthesize re16 mib do8 fa
    re sib sol'4~

    %112
    sol fa~
    fa mib~
    mib re~

    %115
    re do\tr
    sib8[fa sib do]
    re[sib re fa]

    %118
    do[la fa la]\mbreak
    do[fa, do' fa,]
    \parenthesize re'4 r

    %121
    re8[re re re]
    fa,4 r
    fa8[fa fa fa]

    %124
    sib4 r
    sib8[la sol fa]
    sol4 mib

    %127
    fa r8 mib
    fa4 fa
    sib16 do re mib fa8 la

    %130
    sib sib,4 sib'8
    la fa fa sol16 la
    sib8 sib,4 sol'8

    %133
    mib re16 mib do8 fa\mbreak
    re do16 re sib8 mib
    do sib16 do la8 do

    %136
    re[sib mib do]
    fa4 r8 sib
    re,4 do

    %139
    sib2

}

IIIvlIIn = \relative do'' {

    re4 r8 do
    re re16 mib fa8 re
    do4 r8 do

    %4
    re re16 mib fa8 re
    sib2~
    sib~

    %7
    sib4 la
    sib r8 fa'
    fa4 r8 do

    %10
    do2~
    do~
    do4 r8 la

    %13
    sib la r do
    la fa r la
    sib la r la

    %16
    sol4 sol\mbreak
    la2
    sib8[sib' sib sib,]

    %19
    sol'[mib(re do)]
    la'[mib(re do)]
    sib'[sib, sib fa']

    %22
    fa fa16 mib re8 do
    re[la sib re,]
    do4. do8

    %25
    re2
    R2*19
    fa'8 sol16 la sib8 fa

    %46
    sol[mib(re do)]
    la'[mib(re do)]
    sib'[sib, sib fa']

    %49
    fa fa16 mib re8 do
    re[la sib re,]
    do4. re8

    %52
    re2
    R2*3
    r8 sol'[sol sol]

    %57
    do,4 mib
    mib mib
    re re

    %60
    re re
    do do
    do do

    %63
    sib sib
    sib sib
    la la

    %66
    la la
    sol16 la sib do re8 fad\mbreak
    sol sol,4 sol'8

    %69
    re la'4 re,8
    re sol,4 sib8
    sib sol'4 do,8

    %72
    do fa,4 mi'8
    fa mi16 re do8 sib
    la fa r la

    %75
    sib[sib do do]
    fa,4 r8 re'
    mib[mib fa fa]

    %78
    sib,[sol fa sib]
    sol sib4 re8
    do4 si8 sol'\mbreak

    %81
    mib4 r8 la,
    sib4 do8 fa
    re16 do re mib fa8 la

    %84
    sib sib,4 sib'8
    la fa fa sol16 la
    sib8[do, re sib']

    %87
    re,4 do
    sib2
    R2*17

    %106
    la4 r8 sol
    la la16 sib do8 la
    sol4 r8 sol

    %109
    la4 r8 la
    sib[sib do do]\mbreak
    fa,4 r8 re'

    %112
    do16 sib do re do re do re
    sib la sib do sib do sib do
    la4 sib

    %115
    sib la
    sib8[fa sib do]
    re[sib re fa]

    %118
    do[la fa la]
    do[fa, do' fa,]
    re'4 r

    %121
    re8[re re re]
    fa,4 r
    fa8[fa fa fa]

    %124
    sib4 r
    sib8[la sol \parenthesize fa]
    sol4 mib

    %127
    fa r8 mib
    fa4 fa
    re4 r8 do'

    %130
    re re16 mib fa8 re
    do4 r8 do
    sib sib4 sol'8

    %133
    mib re16 mib do8 fa
    re do16 re sib8 mib
    do sib16 do la8 do

    %136
    re[sib mib do]
    fa4 r8 sib
    re,4 do

    %139
    sib2

}

IIIbcn = \relative do {

    sib'4 r8 fa
    sib sib16 do re8 sib
    fa4 r8 fa

    %4
    sib, sib16 do re8 sib
    mib4 r8 mib
    re re16 do re8 sib

    %7
    do4 fa,
    sib r8 do
    re[do re mi]

    %10
    fa fa,r fa'
    mi do r mi
    fa fa, r fa'

    %13
    fa fa, r fa'
    fa fa, r fa'\mbreak
    fa fa16 sol la8 sib

    %16
    do[sib do do,]
    fa fa16 sol fa8 mib
    re4 r8 re

    %19 OOKK
    mib4 r8 mib
    fa4 r8 fa
    sol sol16 fa sol8 mib

    %22
    re re16 do sib8 fa
    sib4 r8 mib
    fa4 fa,

    %25
    sib2
    sib'4 r8 mib,
    fa[re sib re]\mbreak

    %28
    mib4 fa
    sib,8[sib' re sib]
    la[sol la fa]

    %31
    sol[fa sol mi]
    fa4 r8 la
    la4 la

    %34
    sib sib,
    la' fa
    sib fa

    %37
    do do
    re re
    mi mi

    %40
    fa fa
    mi do
    fa8[sol la sib]

    %43
    do[sib do do,]\mbreak
    fa fa16 sol fa8 mib!
    re4 r8 re

    %46
    mib4 r8 mib
    fa4 r8 fa
    sol sol16 fa sol8 mib

    %49
    re re16 do sib8 fa
    sib4 r8 mib
    fa4 fa,

    %52
    sib2
    sol'4 do,
    re r8 re

    %55
    re4 fad
    sol2
    R2*10

    %67
    sol4 r8 la\mbreak
    sib8 sib16 la sib8 sol
    la4 r8 la

    %70
    sib8 sib16 la sib8 sol
    do4 r8 do
    la[fa la do]

    %73
    la[fa do' do,]
    fa4 r8 fa
    sol[sol la la]

    %76
    sib4 r8 sib,
    do[do re re]
    mib[lab sib sib,]

    %79
    mib mib16 fa sol8 si,
    do4 sol'
    do8 do16 sib la8 fa

    %82
    sib4 fa\mbreak
    sib,4 r8 do
    re re16 do re8 sib

    %85
    do4 r8 do
    re4 sib!8 mib
    fa4 fa,

    %88
    sib r8 mib
    fa[re sib re]
    mib4 fa

    %91
    sib,8[sib' la fa]
    sib4 r
    sib r

    %94
    la r
    la r
    sol r

    %97
    mi do
    fa r8 fa
    sol4 sib

    %100
    do r8 mi,
    fa4 la
    sib la\mbreak

    %103
    sib4 r8 do
    fa,[sol la sib]
    do4 do,

    %106
    fa r8 do
    fa fa16 sol la8 fa
    do4 r8 do

    %109
    fa, fa'16 sol la8 fa
    sol4 la
    sib r8 sib

    %112
    la4 r8 la
    sol4 r8 sol
    fa4 fa

    %115
    fa fa,
    sib2
    R2*12

    %129
    sib'4 r8 fa
    sib sib16 do re8 sib\mbreak
    fa4 r8 fa

    %132
    sib, sib'16 do re8 sib
    do4 fa,
    sib r8 sib

    %135
    do4 fa,
    sib do
    re8 sib16 la sib8 mib,

    %138
    fa4 fa,
    sib2

}

IIIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*66
    s4 s8 <6\\>
    s2*44
    <7>4 s8 <6>
    <7>2
    <7>



}

forma = {
    \key sib\major
    \time 2/4
    \tempo 2 = 60
    s2*139
    \bar "|."

}

IIIfl = {
    \IIIglobal
    <<\IIIfln \forma>>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}



IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller {"Concerto per Flauto piccolo in Sib maggiore"}
    composer = \markup \center-column {"A. Montanari (1676-1727)"}

}

\markup\huge "[1.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<
        \new Staff
        <<
            \incipit { \clef french \key sib\major \time 2/2 r\longa r\longa r1^\markup \center-align\smaller"Flauto piccolo" r2  sib''8 [fa'']}
            \clef violin
            \set Staff.midiInstrument = #"piccolo"
            \set Staff.shortInstrumentName = "fl"
            \Ifl
        >>

        \new PianoStaff
        <<
            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Violini I e II"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.shortInstrumentName = "vlII"
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "vc"
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\pageBreak

\markup\huge "[2.] Adagio"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<
        \new Staff
        <<
            \incipit { \clef french \key sol\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi re'''2.^\markup \center-align\smaller"Flauto piccolo"}
            \clef violin
            \set Staff.midiInstrument = #"piccolo"
            \set Staff.shortInstrumentName = "fl"
            \IIfl
        >>

        \new PianoStaff
        <<
            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Violini I e II"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.shortInstrumentName = "vlII"
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "vc"
            \IIbc
        >>
    >>

    \layout {

        indent = 2\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\pageBreak\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<
        \new Staff
        <<
            \incipit { \clef french \key sib\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r\longa r\longa r\longa  r\longa r\longa r\longa r1^\markup \center-align\smaller"Flauto piccolo" fa''16[re'' sib' re'']}
            \clef violin
            \set Staff.midiInstrument = #"piccolo"
            \set Staff.shortInstrumentName = "fl"
            \IIIfl
        >>

        \new PianoStaff
        <<
            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Violini I e II"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.shortInstrumentName = "vlII"
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "vc"
            \IIIbc
        >>
    >>

    \layout {

        indent = 3\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
