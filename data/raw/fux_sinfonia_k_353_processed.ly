\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { soli }

solo = ^\markup \italic { solo }

tu = _\markup \italic "tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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

Iglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}





IvlIn = \relative do'' {

    sib4 re8. mib16 fa8 sib sol[fa]
    la8. sib16 do8 do fa,2
    r8 fa do8. do16 re4 sol~

    %4
    sol8 do, fa8. mib16 re8 do sib4\tr\mbreak
    la do8. re16 mib4. mib8
    re sib' sol8. la16 fad4 sol8 la

    %7
    sib8. la16 sol8.\tr fa16 mi4 sol8. sol16
    la8. sol16 sol8. \tr fa16 fa8 fa re[mi]
    fa do\pp re mi fa2

    %10
    do4 fa4. re8 sol8. fa16
    mi4 la8. sol16 fa8 re sib'4~
    sib la8. sol16 fad4 sol~

    %13
    sol8 do, fa4. mib16 re mib4
    re4. re8 do sib la8.\tr sol16\mbreak
    sol8. la16 sib do re mib fa8 re sol8. sol16

    %16
    la8 fa sib4 mib,4. re8
    do4 fa4. mib16 re mib8. fa16
    re4 sol do,8 re do8.\tr sib16

    %19
    sib4 fa'4. \pp mib16 re mib8. fa16\mbreak
    re4 sol do,8 re do8.\tr sib16
    do8 sib sol\f [la] sib2

}

IvlIIn = \relative do'' {

    r2 sib4 re8. mib16
    fa8 fa do8. do16 re2
    do4. do8 sib4 do8 sib

    %4
    do4. la8 fa4. mi8
    fa4 la8. sib16\mbreak do4. do8
    sib4 re2 do4

    %7
    sib8 re16 do sib8.\tr la16 sol4. do8
    do re do8. do16 la4 fa8 sol
    la4 fa8\pp sol la2

    %10
    r4 fa sib4. sol8\mbreak
    do2 re4. re8
    mib!2 re4 re

    %13
    do4. si16 la si4 do
    la sib ?fad8 sol fad8.\tr sol16
    sol4~sol16 la sib do re4 mib8 sib\mbreak

    %16
    do4. sib8 do4. sib8
    la4. fa8 sib4. do8
    sib4. sib8 la sib la8.\tr sib16

    %19
    sib4 la\pp sib4. do8
    sib4. sib8 la sib la8.\tr sib16
    sib8 fa mib4\f fa2

}

Ivlan = \relative do' {

    R1_\markup\italic"Viola part missing in 1701 edition"
    fa4 la8. la16 sib8 re do sib
    la la sol fa~fa sib, re4

    %4
    do8 fa4 do8 re4. do16 sib
    do4 fa sol4. la8\mbreak
    re,4 sib' la la

    %7
    sol8 sib, do re~re do4 sol'8
    fa8. re16 mi8. fa16 fa8 do re[sib]
    do fa re[sib] do2

    %10
    R1
    do4 fa4. sib,8 sol'8. fa16
    mib8 do la'2 sol4

    %13
    do, re~re8 sol, sol'4
    fad sol do,8 re re4
    sib2~sib8 la sol[mib']\mbreak

    %16
    do la fa'4 sol fa
    fa8 do re4~re8 sol, do4
    fa mib fa2

    %19
    fa4 re~re8 sol, do4
    fa mib fa2
    fa8 sib, sib[mib] re2

}

Ibcn = \relative do {

    R1
    r2 sib4 re8. mib16
    fa4 la8. la16 sib8 sib la sol

    %4
    la4. fa8 sib la sol4
    fa2 do4 mib8. fa16 sol4
    sib8. do16\mbreak re8 re, mi[fad]

    %7
    sol2 do,4 mi8. mi16
    fa8 sib do[do,] fa la, sib[sol]
    fa la\pp sib[sol] fa2

    %10
    R1
    r4 fa' sib4. sol8\mbreak
    do2. sib8 sol

    %13
    la4. sol16 fa sol4 do,~
    do sib la8 sol re'[re,]
    sol4 sol' fa mib~

    %16
    mib re do8 sib la sib
    fa'4. re8 sol4. la8\mbreak
    sib4 mib,4. re16 mib fa8 fa,

    %19
    sib4 re\pp sol4. la8
    sib4 mib,4. re16 mib fa8 fa,
    sib re mib\f do sib2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \time 4/4
    \tempo 2 = 65
    s1*9
    \bar":..:"
    s1*12
    \bar ":|."

}

IvlI = {
    \Iglobal
    \notypeset
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

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}

IIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \override Score.RehearsalMark.X-offset = #3
    \override Score.RehearsalMark.Y-offset = #-4
}





IIvlIn = \relative do'' {

    r2 r re
    mib re sol
    do, do re

    %4
    mib4(re) re2.\tr re4
    do1 sol'2
    lab sol do\mbreak

    %7
    fa, fa sol\tr
    lab4(sol) sol2.\tr sol4
    fa1 sib2

    %10
    mib,1 mib2~
    mib reb2. reb4
    do1 fa2

    %13
    si, do1~
    do4 sib la2.\tr sol4
    sol1 mib'2~

    %16
    mib re mib4 fa\mbreak
    sol1 do,2~
    do si do4 re

    %19
    mib2. fa4 sol la
    sib2 fa sol
    mib4 re do2.\tr sib4

    %22
    la2 fa fa'
    sib, sib2.\tr la4
    sib1 fa'2

    %25
    sib, sib2. la4
    la4. fa'8 sib, sol' do,[la']
    sib la16 sol fa8 re16 mi fa4 sol

    %28
    la4. sib8 sol fa16 mib re8 do
    re4 mi8 fa~fa sol la[sib]
    la sol16 fa sol4\mbreak do,8 re mib re16 do

    %31
    sib4 r8 fa' sib, sol' do,[la']
    sib la16 sol fa8 mib~mib re do[sib]~
    sib la sol[do] fa, re' sol,[mi']

    %34
    fa4 mi8 sol la4 sib8 do16 sib\mbreak
    la4 sib8. la16 sol fa mib re do4\tr
    re mib!8 fa16 mib re4 r8 sol

    %37
    do, la' re,[si'] do4 fa,8 sol16 fa
    mi8 sol fad sol16 la sib8 do~do sib16 la\mbreak
    sib8 sol la re,16 do sib8 sol' do, fa16 mib

    %40
    re4 mib8 fa sol4 lab8 sib16 lab
    sol4. fa8 mib4 mib8.\tr re16
    mib4 r8 fa sib,[sol'] do, la'

    %43
    sib4 do fa,4. mi8\mbreak
    fa4 sib,8 do16 sib la8. sib16 do8 re
    mib do fa mib16 re mib4 mib~

    %46
    mib8 re16 do do8.\tr sib16 sib4 r8 do
    fa, re' sol, [mi'] fa4 sol
    la8 fa sib la16 sol\mbreak fa8 re sol[mib]~

    %49
    mib8. re16 do8. sib16 sib2
    re4. do8 sib sol si4
    do4. sib8 la4 fa'~

    %52
    fa8 re sib'8. lab16 sol4 mib~
    mib re do fa~
    fa8 mib~mib re16 do re4 sib'~

    %55
    sib8 lab4 sol16 fa sol4. sol8
    fa4 sol8 fa mib4. mib8
    re4 mi\tr fa~fa8. mib16

    %58
    re8. do16 sib8 la sol la sol8.\tr fa16 \mbreak
    fa4 fa'4. mib4 re16 do
    re4. re8 do4 re\tr

    %61
    mib8.[fa16 sol8 la] sib sib, mib4~
    mib re8 do do4.\tr sib8
    sib1

}

IIvlIIn = \relative do'' {

    r2 r sol
    sol1 sol2~
    sol fa2. fa4

    %4
    sol1 si2
    do1 do2
    do do2. do4

    %7
    do2 sib2. sib4
    do2 do2. do4
    do2 re2. re4\mbreak

    %10
    re2 do2. sib4
    la2 sib2. sib4
    sib2 lab2. lab4

    %13
    sol2 sol2. sol4
    fad sol fad2.\tr sol4
    sol1 sib2

    %16
    lab1 lab2
    sib1 sol2
    fa1 fa2\mbreak

    %19
    sol1 mib'2
    re1 sib2
    do sol1

    %22
    fa1 fa2
    mi fa1
    fa fa2~

    %25
    fa mi2.\tr mi4
    fa r r2
    r4 r8 sib fa re' sol,[mi']

    %28
    fa mi?16 re do8 re\mbreak mib?8 re16 do sib8 la
    sib4 do re8 mi fa[re]
    do re sib4\tr la8 sib do sib16 la

    %31
    sol4 la sol la8 do
    re4. do16 sib la8 sib la[fa]
    mi fa4 mi8\mbreak re4 r8 do'

    %34
    fa, re' sol,[mi'] fa4 sol
    do, re8. do16 sib4. la8
    sib4 r8 do fa, re' sol,[mi']

    %37
    fa4 sol mi r8 re
    sol,[mi'] la,[fad'] sol4 la8 re,\mbreak
    re4 do8 sib16 la sib4 r8 do

    %40
    fa, sib16 la sol8 sib~sib[mib] do sib
    sib do re4 sol, r8 sib
    mib,[do'] \parenthesize fa, re' mib sib la[do]

    %43
    re4 mib re8 do sib [do]~\mbreak
    do fa, sol4 fa8. sol16 la8. sib16
    do4 la8 sol sol4. sib8

    %46
    do sib la8.\tr sib16 sib4 sol8 fa16 mib
    re4 mi8 sol la4 sib8 do~
    do re sib[do] re4 sib8 do\mbreak

    %49
    la sib la8.\tr sib16 sib2
    la sol
    sol fa4 la

    %52
    sib2 sib4 do~
    do sib2 la4
    sol la sib fa'

    %55
    do re\tr mib8 sib mib4~
    mib8 re16 do sib4\mbreak do8 sol do4~
    do8 sib4 do16 sib la8 sib do4

    %58
    sib8. [la16 sol8 fa] mi\tr fa mi8. fa16
    fa4 do'2 la4
    sib8 fa sib4. lab4 sib16 lab

    %61
    sol4 mib' re do8. sib16\mbreak
    la4 sib2 la4
    sib1

}

IIvlan = \relative do' {

    r2_\markup\italic"Viola part missing in 1701 edition" r re
    do re1
    mib2 re do

    %4
    do re sol
    sol mi do
    fa sol1

    %7
    fa2 fa2. fa4
    fa1 mi2\mbreak
    mib!2 re2. fa4

    %10
    sib,2 do2. mib4
    do2 reb4 do sib2
    do1 reb2

    %13
    re! mib sol,
    la4 re re1
    re sib2

    %16
    do re1\mbreak
    sib2 mib mib
    fa re2.  si4

    %19
    sol2 do2.  do4
    fa1 mib2
    sol mib4 re do2~

    %22
    do4 sib la2 sib
    sib do1
    re sib2~

    %25
    sib sib2. do4\mbreak
    do4 r r2
    R1

    %28
    r2 r4 r8 fa
    sib, sol' do,[la'] sib la16 sol fa8. mi16\mbreak
    fa4 mi8 re do8. sib16 sol'8 fa

    %31
    sib, do~do[re]~re do~do[mib]
    fa mib fa sol fa fa4 sib,8
    do4. sib8 la4 sol

    %34
    fa r8 do' fa, re' sol,[mi']\mbreak
    fa8 mib?16 fa re8 sib mib4 fa
    re8 sib'4 fa8 fa4 mi8 do

    %37
    do'4 si sol8 do4 sol8
    do4 r8 re, sol, mi' la,[fad']
    sol4 r8 la re, mib16 fa mib8 fa\mbreak

    %40
    fa4 r8 re mib4 fa
    sol4. lab8 sol mib16 fa fa4
    mib r r r8 fa

    %43
    sib, sol' do,[la'] sib la16 fa sol4
    la sol8 do, do4. r8\mbreak
    r4 r8 re sol, mib' la,[fa']

    %46
    fa4 fa8. fa16 re4 mib8 do
    fa4 r r r8 do
    fa, re' sol,[mib'] fa sol16 fa sol8 sol

    %49
    do, sib fa'4 re2
    re2 re4. re8
    do2 do4 do'

    %52
    fa,4. re8 sol4 sol
    fa8 fa, fa'2 fa4
    do4. fa8 fa8.[mib16 fa8 sol]

    %55
    fa4 fa mib4. mib8\mbreak
    sib'4 sol sol4. sol8
    re4do8 sol' fa sol fa4

    %58
    fa8 re4 re8~re do do4
    la fa' do8.[re16 mib8 fa]
    fa4 fa fa4. sol16 fa

    %61
    mib4 do' sib sol8 mib
    do4 fa fa2
    re1\mbreak

}

IIbcn = \relative do {

    r2 r si'
    do1 sib!2
    lab1.

    %4
    sol2~sol2. fa4
    mi1.
    fa1 mib2

    %7
    reb1.
    do2 do'2. sib4
    la2 sib2. lab4

    %10
    sol2 lab2. solb4\mbreak
    fa2 sib sib,
    fa'1.~

    %13
    fa2 mib2. mib4
    re1.
    sol,1 sol'2

    %16
    fa1.
    mib
    re

    %19
    do
    re1 mib2
    do1 mib2

    %22
    fa1 re2
    sol fa1
    sib, re2

    %25
    sol1.
    fa4 r r2\mbreak
    R1*2

    %29
    r2 r4 r8 sib,
    fa re' sol,[mi'] fa mib?16 re do8 re
    mib4 fa4. mib4 re16 do
    sib8 do re[mib] fa sib fa[re]

    %33
    do2~do8 si do4
    re do r2
    r2 r4 r8 fa

    %36
    sib, sol' do,[la'] sib4 do8. sib16
    la4 r8 sol do,[la'] re, si'
    do4 re r r8 re,

    %39
    sol, mi' la,[fad'] sol4 la\mbreak
    sib4 r8 sib mib,?[do'] fa, re'
    mib4 si do8 sol16 lab sib4

    %42
    do8 do, re[sib] mib4 fa
    r2 r4 r8 do
    fa, re' sol,[mi'] fa4 r8 fa

    %45
    do la'\mbreak re,[si'] do do, do'[sib]
    la sib fa8. fa16 sib,8 sol' do,[la']
    sib4 r8 do, fa, re' sol,[mi']

    %48
    fa4 sol8 fa16 mib? re8 sib mib[do]
    fa2 sib,\mbreak
    fad'2 sol4. fa?8

    %51
    mib8 do mi4 fa4. mib?8
    re sib re4 mib8 re do sib
    la4 sib fa'8.[sol16 la8 sib]

    %54
    do do, fa4 sib,8.[do16 re8 mib]
    fa fa, sib4\mbreak mib8.[fa16 sol8. lab16]
    sib8 sib, mib4 do8. re16 mib8. fa16

    %57
    sol8 sol, do4 re  la
    sib2 do
    fa8.[sol16 la8 sib] do do, fa4\mbreak

    %60
    sib,8. do16 re8 mib fa fa, sib4
    do2 sol'4 mib8 do
    fa4 sib, fa2

    %63
    sib1

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \time 3/2
    \tempo 2 = 65
    s1.*25
    \bar"||"\break
    \mark\markup\huge"Allegro"
    \time 4/4
    \tempo 2 = 60
    s1*24
    \bar"||" \break
    \mark\markup\huge"Adagio"
    \time 4/4
    \tempo 4 = 60
    s1*14
    \bar"|."

}

IIvlI = {
    \IIglobal
    \notypeset
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
    \typeset

}

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IIIobIn = \relative do'' {

    sib8 la fa
    sib8. do16 re8 mib do[fa]
    re do16 re sib8 sib la[fa]
    sib8. do16 re8 mib do[fa]\mbreak

    %4
    re8. mib16 fa8 sol fa[sib]
    sol8. [fa16 mib8 re] do8.\tr sib16
    sib4. sib16 do re8(do) %%%%%% fine ripresa

    %7
    fa8 mib16 (fa) re8 fa mib8.\tr re16
    mib8 re16 mib do8 mib re8.\tr do16\mbreak
    re8. do16 sib8. la16 sol8.\tr fa16

    %10
    fa4. sib8 la fa
    sib8. do16 re8 mib do[fa]
    re do16 re sib8 sib la[fa]

    %13
    sib8. do16 re8 mib do[fa] \mbreak
    re8.  mib16 fa8 sol fa[sib]
    sol8. fa16 mib8 re do8. sib16

    %16
    sib4. re8 sol16 fad sol la
    sib8 sol re[sib'] la sol16(fad)
    sol8 fa?16 mib re do re mib fa8 re\mbreak

    %19
    mib8. re16 do sib do re mib8 do
    re4 la8 do sib4\tr
    la4. la8 re16 mib do re

    %22
    si8 la16 si sol re' mi fa sol la fa sol\mbreak
    mi8 re16 mi do mi fa sol la8 sol16 la
    fad8 mi?16 fad re8 sib' la8.\tr sol16

    %25
    sol4. sib8 la8.\tr sol16
    la8 sol16 la fa8 sol mi8.\tr fa16\mbreak
    fa4. sib,8 la fa

    %28
    sib8.[do16 re8 mib] do fa
    re do16 re sib8[sib] la fa
    sib8.[do16 re8 mib] do fa

    %31
    re8.[mib16 fa8 sol] fa sib\mbreak
    sol8. fa16 mib8. re16 do8.\tr sib16
    sib4. fa'8 sol fa

    %34
    sol4 re8 fa mib8.\tr re16
    mib8. re16 do8 sol' lab[sol]
    lab8. sol16 fa8 mib re8.\tr do16\mbreak

    %37
    si8 la16 si sol8 si do[re]
    mib4 re8 si do[re]
    mib re16 mib re8 sol sol sol

    %40
    sol fa16 mib fa8 fa fa[fa]
    fa mib16 re mib8 mib mib mib\mbreak
    mib re16 do re8. mib16 fa8 do

    %43
    si8. do16 re8 mib re8.\tr do16
    do4. sol8 do sib16 do
    la8 fa la do fa mib16 fa\mbreak

    %46
    re8 sib re[fa] sib la16 sib
    sol8. fad16 sol8 sib la8.\tr sol16
    fad8 mi16 fad re8[fad sol la]\mbreak

    %49
    sib8. la16 sol8 fa mi[re]
    dod si16 dod la8[dod] re mi
    fa4 mi8[dod] re mi\mbreak

    %52
    fa16 mi fa8 mi la la la
    la sol16 fa sol8[mi fa sol]
    dod,4 re8 mi mi8.\tr re16

    %55
    re4. sib8 la fa
    sib8. do16 re8 mib do[fa]
    re do16 re sib8 sib la[fa]

    %58
    sib8. do16 re8 mib do[fa]\mbreak
    re8. mib16 fa8 sol fa[sib]
    sol8. [fa16 mib8 re] do8.\tr sib16

    %61
    sib4 r r

}

IIIobIIn =  \relative do'' {

    r4 r8
    fa,4 sib8 sol la4\tr
    sib8 fa re[fa] fa4
    fa sib8 sol la4\tr

    %4
    sib8. do16 re8 mib re4\tr\mbreak
    mib8. re16 do8 sib la8.\tr sib16
    sib4. sib16 do re8(do)

    %7
    re do16 re sib8 re do8.\tr si16
    do8 sib?16 do la8 do sib8.\tr la16\mbreak
    sib8. la16 sol8. fa16 mi8.\tr fa16

    %10
    fa4 r r
    fa sib8 sol la4\tr
    sib8 fa re[fa] fa4

    %13
    fa sib8 sol la4\tr \mbreak
    sib8. do16 re8 mib re4\tr
    mib8.[re16 do8 sib] la8.\tr sib16

    %16
    sib4. la8 sib[do]
    sib4. re8 do sib16 la
    sib8. do16 sib la sib[do] re8 si\mbreak

    %19
    do8. sib?16 la sol la sib do8 la
    sib4 fad8 fad sol4
    fad4. fad8 fad16 sol la8

    %22
    sol4. si8 si16 do re8
    do4. do8 do16 re mib8\mbreak
    re4. re8 re4\tr

    %25
    sib4. sib8 do4
    do8 do re[re] do4
    la r r

    %28
    fa sib8 sol la4
    sib8 fa re[fa] fa4\mbreak
    fa sib8 sol la4\tr

    %31
    sib8.[do16 re8 mib] re4\tr
    mib8.[re16 do8 sib] la4\tr
    sib4. re8 mib re

    %34
    mib4 si8 re do8.\tr si16\mbreak
    do8 sol mib[mib' do mib]
    fa8. mib16 re8 do lab8. lab16

    %37
    sol4. sol8 la? si
    do4 si8 sol la[si]
    do si16 do\mbreak si8 si mib[re]

    %40
    do4. do8 re do
    sib4. sol8 do sib
    lab2~lab8 lab

    %43
    sol8. la?16 si8 do si8.\tr do16
    do8 sol do4 mi,\mbreak
    fa4. sol8 la4

    %46
    sib2 r8 fa'
    mib8. re16 mib8 re do8. sib16
    la4. la8 sib do

    %49
    re8. do16 sib4. sib8\mbreak
    la4. la8 si[dod]
    re4 dod8 la si[dod]

    %52
    re16 dod re8 dod dod fa[mi]
    re4. do?8 re [sol,]\mbreak
    la4 la8 sib la4

    %55
    la4. r4 r8
    fa4 sib8 sol la4\tr
    sib8 fa re[fa] fa4

    %58
    fa sib8 sol la4\tr
    sib8. do16 re8 mib re4\tr\mbreak
    mib8. re16 do8 sib la8.\tr sib16

    %61
    sib4 r r

}

IIIvlIn = \relative do'' {

    sib8 la fa
    sib8. do16 re8 mib do[fa]
    re do16 re sib8 sib la[fa]
    sib8. do16 re8 mib do[fa]\mbreak

    %4
    re8. mib16 fa8 sol fa[sib]
    sol8. [fa16 mib8 re] do8.\tr sib16
    sib4 r r%%%%%% fine ripresa

    %7
    R2.*3
    r4 r8 sib la fa
    sib8. do16 re8 mib do[fa]
    re do16 re sib8 sib la[fa]

    %13
    sib8. do16 re8 mib do[fa] \mbreak
    re8.  mib16 fa8 sol fa[sib]
    sol8. fa16 mib8 re do8. sib16

    %16
    sib4. re8 sol16 fad sol la
    sib8 sol re[sib'] la sol16(fad)
    sol8 fa?16 mib re do re mib fa8 re\mbreak

    %19
    mib8. re16 do sib do re mib8 do
    re4 la8 do sib4\tr
    la4. la8 re16 mib do re

    %22
    si8 la16 si sol re' mi fa sol la fa sol\mbreak
    mi8 re16 mi do mi fa sol la8 sol16 la
    fad8 mi?16 fad re8 sib' la8.\tr sol16

    %25
    sol4. sib8 la8.\tr sol16
    la8 sol16 la fa8 sol mi8.\tr fa16\mbreak
    fa4. sib,8 la fa

    %28
    sib8.[do16 re8 mib] do fa
    re do16 re sib8[sib] la fa
    sib8.[do16 re8 mib] do fa

    %31
    re8.[mib16 fa8 sol] fa sib\mbreak
    sol8. fa16 mib8. re16 do8.\tr sib16
    sib4 r r

    %34
    R2.
    r4 r8 sol' [lab sol]
    lab8. sol16 fa8 mib re8.\tr do16\mbreak

    %37
    si8 la16 si sol8 si do[re]
    mib4 re r
    r4 r8 sol sol sol

    %40
    sol fa16 mib fa8 fa fa[fa]
    fa mib16 re mib8 mib mib mib\mbreak
    mib re16 do re8. mib16 fa8 do

    %43
    si8. do16 re8 mib re8.\tr do16
    do4. sol8 do sib16 do
    la8 fa la do fa mib16 fa\mbreak

    %46
    re8 sib re[fa] sib la16 sib
    sol8. fad16 sol8 sib la8.\tr sol16
    fad8 mi16 fad re8[fad sol la]\mbreak

    %49
    sib8. la16 sol8 fa mi[re]
    dod si16 dod la8[dod] re mi
    fa4 mi r\mbreak

    %52
    r4 r8 la la la
    la sol16 fa sol8[mi fa sol]
    dod,4 re8 mi mi8.\tr re16

    %55
    re4. sib8 la fa
    sib8. do16 re8 mib do[fa]
    re do16 re sib8 sib la[fa]

    %58
    sib8. do16 re8 mib do[fa]\mbreak
    re8. mib16 fa8 sol fa[sib]
    sol8. [fa16 mib8 re] do8.\tr sib16

    %61
    sib4 r r

}

IIIvlIIn = \relative do'' {

    r4 r8
    fa,4 sib8 sol la4\tr
    sib8 fa re[fa] fa4
    fa sib8 sol la4\tr

    %4
    sib8. do16 re8 mib re4\tr\mbreak
    mib8. re16 do8 sib la8.\tr sib16
    sib4 r r

    %7
    R2.*4
    fa4 sib8 sol la4\tr
    sib8 fa re[fa] fa4

    %13
    fa sib8 sol la4\tr \mbreak
    sib8. do16 re8 mib re4\tr
    mib8.[re16 do8 sib] la8.\tr sib16

    %16
    sib4. la8 sib[do]
    sib4. re8 do sib16 la
    sib8. do16 sib la sib[do] re8 si\mbreak

    %19
    do8. sib?16 la sol la sib do8 la
    sib4 fad8 fad sol4
    fad4. fad8 fad16 sol la8

    %22
    sol4. si8 si16 do re8
    do4. do8 do16 re mib8\mbreak
    re4. re8 re4\tr

    %25
    sib4. sib8 do4
    do8 do re[re] do4
    la r r

    %28
    fa sib8 sol la4
    sib8 fa re[fa] fa4\mbreak
    fa sib8 sol la4\tr

    %31
    sib8.[do16 re8 mib] re4\tr
    mib8.[re16 do8 sib] la4\tr
    sib4 r r

    %34
    R2.
    r4 r8 mib [do mib]
    fa8. mib16 re8 do lab8. lab16

    %37
    sol4. sol8 la? si
    do4 si r
   r4 r8 si [mib re]

    %40
    do4. do8 re do
    sib4. sol8 do sib
    lab2~lab8 lab

    %43
    sol8. la?16 si8 do si8.\tr do16
    do8 sol do4 mi,\mbreak
    fa4. sol8 la4

    %46
    sib2 r8 fa'
    mib8. re16 mib8 re do8. sib16
    la4. la8 sib do

    %49
    re8. do16 sib4. sib8\mbreak
    la4. la8 si[dod]
    re4 dod r

    %52
    r4 r8 dod [fa mi]
    re4. do?8 re [sol,]\mbreak
    la4 la8 sib la4

    %55
    la4. r4 r8
    fa4 sib8 sol la4\tr
    sib8 fa re[fa] fa4

    %58
    fa sib8 sol la4\tr
    sib8. do16 re8 mib re4\tr\mbreak
    mib8. re16 do8 sib la8.\tr sib16

    %61
    sib4 r r

}

IIIvlan = \relative do' {

    r4_\markup\italic"Viola part missing in 1701 edition" r8
    re8. mib16 fa8 mib fa4
    fa8 mib16(fa) fa8 re[do fa,]

    %3
    re'8. mib16 fa8 mib fa4
    fa8. sib16 sib8 sib sib4\tr \mbreak
    sib8. sol16 sol8 sol do,[fa]

    %6
    fa4 r r
    R2.*4
    re8. mib16 fa8 mib fa4

    %12
    fa8 mib16(fa) fa8 re[do fa,]
    re'8. mib16 fa8 mib fa4
    fa8. sib16 sib8 sib sib4\tr

    %15
    sib8. sol16 sol8 sol do,[fa]
    fa4. fad8 sol fad
    sol4. re8 mib re\mbreak

    %18
    re4~re16 mib re do si8 do16 re
    do sib? la sib do8 fa sol[fa]
    fa mib16 re re8 do re[mi]

    %21
    la,4. re8 re[re]
    re do16 re si8 sol' sol[sol]\mbreak
    sol fa16 sol mi8 re16 mi fa8 do'

    %24
    la sol16 la fad8 sol fad8. sol16
    sol8 [fa?16 mib re8] re mi4
    fa8[sol la sib] sol8. fa16

    %27
    fa4 r r
    re8. mib16 fa8 mib fa4\mbreak
    fa8 [mib16 fa fa8] re do fa,

    %30
    re'8. mib16 fa8 mib fa4
    fa8.[sib16 sib8 sib] sib4\tr
    sib8.[sol16 sol8 sol] do, fa

    %33
    fa4 r r
    R2.
    r4 r8 mib fa[mib]

    %36
    do4 re8 mib fa8. fa16
    re4 si8 re sol[sol]
    sol4 sol r

    %39
    r r8 sol sol[sol]
    lab8. sol16 fa8 lab fa8[fa]
    sol8. fa16 mib8 sib' mib,[mib]\mbreak

    %42
    fa8. mib16 fa sol lab sol fa8 fa
    re8.[mib16 fa8 sol] sol4
    mib4. sol8 sol4

    %45
    fa8[la, la' sol] fa4
    fa8 re fa sib re sib
    sib4. sol8 mib4

    %48
    la,8. re16 fad8 re sol fad\mbreak
    sol8 re4 re8 sol fa
    mi re16 mi dod8 la' la[sol]

    %51
    la4 la r
    r4 r8 la la[la]
    sib8. la16 sol8 sol fa16 mi re8

    %54
    mi4 fa8 mi16 re dod8.\tr re16
    re4. r8 r4
    re8. mib16 fa8 mib fa4

    %57
    fa8 mib16(fa) fa8 re[do fa,]
    re'8. mib16 fa8 mib fa4
    fa8. sib16 sib8 sib sib4\tr \mbreak

    %60
    sib8. sol16 sol8 sol do,[fa]
    fa4 r r

}

IIIbcn = \relative do {

    r4 r8
    sib'4 sib,8 do fa[fa,]
    sib4. sib8 fa'16 mib re do
    sib4. do8 fa[fa,]

    %4
    sib4. mib8 sib'16 lab sol fa\mbreak
    mib4. mib8 fa fa,
    sib4  sib2_\markup\italic"Fagotto solo"

    %7
    sib4 re sol
    do, fa8 do fa[fa,]
    sib2 do4

    %10
    fa, r r
    sib'4\tu sib,8 do fa[fa,]
    sib4. sib8 fa'16 mib re do

    %13
    sib4. do8 fa[fa,]
    sib4. mib8 sib'16 lab sol fa\mbreak
    mib4. mib8 fa fa,

    %16
    sib4.  re'8 sib la
    sol4. sol8 do,[re]
    sol,4. sol'8 re sol

    %19
    do,4 fa do8 fa
    sib,4 re8 la sol4
    re'4. re8 re fad

    %22
    sol4. sol8 sol si\mbreak
    do4. do8 do do
    re4. sol,8 re4

    %25
    sol,4. sol'8 do do,
    fa mi re sib do[do,]
    fa4 r r

    %28
    sib' sib,8 do fa[fa,]
    sib4. sib8 fa'16 mib re do
    sib4. do8 fa[fa,]

    %31
    sib4. mib8 sib'16 lab sol fa\mbreak
    mib2 fa8 fa,
    sib4 sib'2_\markup\italic"Fagotto solo"

    %34
    sol4. re8 sol sol,
    do4. do'8\tu fa, do'
    fa,2 fa4

    %37
    sol4. sol8 mib re\mbreak
    do4 <<{sol'8_\markup\italic"Fagotto solo" sol mib re}\\sol4>>
    do,4 sol' 8 sol\tu do sib

    %40
    lab4. fa8 sib lab
    sol4. mib8 lab sol
    fa2~fa8 fa

    %43
    sol8.[mib16 re8 do] sol' sol,
    do2 r8 do\mbreak
    fa4. mib8 re do

    %46
    sib2 r8 re
    mib4. sib8 do4
    re4. re'8 sib la

    %49
    sol2 r8 sol
    la4. la8 fa mi?
    re4 <<{la'8_\markup\italic"Fagotto solo" la fa mi?}\\la4>>

    %52
    re,4 la'8 la\tu re do\mbreak
    sib4. do8 do sib
    la4 fa8 sol la[la,]

    %55
    re4. r4 r8
    sib'4 sib,8 do fa[fa,]
    sib4. sib8 fa'16 mib re do

    %58
    sib4. do8 fa[fa,]
    sib4. mib8 sib'16 lab sol fa\mbreak
    mib4. mib8 fa fa,

    %61
    sib4 r r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \time 3/4
    \tempo 2 = 63
    \partial 4. s4.
    s2.*61
    \bar"|."

}

IIIobI = {
    \IIIglobal
    \notypeset
    <<\IIIobIn \forma>>

}

IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

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

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}

IVglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    sib'8
    sib2 la4.\tr sol8
    fa4 re sol4. sol8
    sol4 fa mib4.\tr  re8

    %4
    re2 do4 re4\mbreak
    sib4. sib8 la4 sib
    sol4~sol16 sib do[re] mib4. mib8

    %7
    mib4 re do4.\tr sib16 do
    re4. mi?8 fa4. fa8\mbreak
    fad2 sol4 la

    %10
    sib sol mi4. mi8
    fa4. sol8 sol4.\tr fa8
    fa2~fa4. do8

    %13
    do2 fa4. mib!8\mbreak
    re2 sol4. sol8
    fad4. sol8 la4 sib

    %16
    la re, sol4. fa8
    mib re do sib la4 sib8 do
    sib4 sol16[la] do re\mbreak mib4. mib8

    %19
    mib4 re8 do re4. do8
    sib8. la16 sib8. [do16] la4 fa
    fa'8(mi) fa4 r re

    %22
    sol8(fad) sol4 r mi\mbreak
    la8(sol) la4 r fad
    sib8(la) sib4 la4.\tr sol8

    %25
    fad4. re8 sol4. sol8
    do,4 fa8. fa16 sib,4 mib8. mib16
    la,4 re8. re16\mbreak sol,4 do8. sib16

    %28
    la4. fa8 sib8. do16 re8.[mib16]
    fa4. re8 sib'8. lab16 sol8. fa16
    mib4 do fa8. mib16 re8.[do16]

    %31
    sib8. la16 sib8.[do16]\mbreak do4.\tr sib8
    sib2~sib4.

}

IVvlIIn = \relative do'' {

    r8
    re2 mib4. mib8
    re4. do8 sib4. sib8
    la2 sib4 do

    %4
    sib2 fa4 la
    sol4. sol8 sol4 fa\mbreak
    mib~mib16 sol la sib do4. do8

    %7
    la4 sib8 la sol4. sol8
    fad4. sol8 la4. la8
    la2 sib4 do

    %10
    re2 do4. do8\mbreak
    do4 do do4. do8
    la2~la4. r8

    %13
    la2 la4. la8
    sib2 sib4. sib8
    la4 re re re

    %16
    re2 re4. re8\mbreak
    do sib la[sol] fad4.\tr fad8
    sol2 sol4. sol8

    %19
    fa2 fa4. fa8
    fa4 mi\tr fa2
    r4 la re8 do re4\mbreak

    %22
    r re mi8 re mi4
    r mi fad8 mi re4
    re2 mib!4. mib8

    %25
    re2 re4 sol,~
    sol fa8. fa16\mbreak fa4 mib8. mib16
    mib4 re8 fa mib4~ mib8. sol16

    %28
    fa2 fa4 sib
    do re~re8. do16 sib4
    do la8. sol16\mbreak fa4~fa8. mib!16

    %31
    re4 sol fa4. fa8
    re2~re4.

}

IVvlan = \relative do' {

    r8_\markup\italic"Viola part missing in 1701 edition"
    fa2 mib4. mib8
    sib'4. la8 sol4. sol8
    do2 sol4 fa

    %4
    fa re8 mib fa4 re
    re4. re8 re4 sib
    sib mib8 re do4 sol'

    %7
    fa4. fa8 mib4 sol,
    la re2 re4\mbreak
    re~re16 fad mi re re4 do

    %10
    sol' sib sol4. sol8
    fa2 mi4.\tr fa8
    fa2~fa4. r8

    %13
    fa2 fa4. fa8
    fa2 sol4. sol8
    la4. sib8 la4 sol

    %16
    fad2 sol4. sol8
    sol4 mib la, re\mbreak
    re sib do re16 mib fa sol

    %19
    do,4 fa re4. re8
    re4 do do2
    r4 do re2

    %22
    r4 si sol'2
    r4 dod, la'2
    sol la4. la8

    %25
    la4 sol8 fad sol4. mib8\mbreak
    mib4. re8 re4. do8
    do4 sib sib do8 mib

    %28
    do4. la8 sib4 fa'
    fa sib2 mib,8. fa16
    sol4. fa8 sib4. la8

    %31
    sol4 sib, la4.\tr sib8
    sib2~sib4.

}

IVbcn = \relative do {

    r8
    sib2 do4. do8
    re2 mib4. mib8
    fa2 sol4 la

    %4
    sib2 la4 fad\mbreak
    sol sol, re'4. re8
    mib2~mib4~mib16 do re[mib]

    %7
    fa4 sib mib,2
    re re'4. re8
    do2 sib4 la\mbreak

    %10
    sol2 do4. sib8
    la4 fa do' do,
    fa2~fa4. r8

    %13
    fa4. mib8 re4 do
    sib4. la8 sol2\mbreak
    re'4. mi?8 fad4 sol

    %16
    re4. do8 si2
    do re
    sol, do4 sib

    %19
    la2 sib4 sib'8 la
    sol4 do,\mbreak fa2
    r4 fa sib8 la sib4

    %22
    r sol do8 si do4
    r la re8 do re4
    sol,2 do4. do8

    %25
    do2\mbreak sib8 la sib sol
    la sol la fa sol fa sol mib
    fa mib fa re mib re mib do

    %28
    fa4 mib re sib
    la sib\mbreak sol mib'8. re16
    do4 fa8. mib16 re4 fa

    %31
    sol mib fa fa,
    sib2~sib4.

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \time 2/2
    \tempo 2 = 65
    \partial 8 s8
    s1*11
    s2. s8
    \bar":..:"
    s
    s1*19
    s2. s8
    \bar":|."

}


IVvlI = {
    \IVglobal
    \notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>

}

IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset

}

Vglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

VvlIn = \relative do'' {

    sib2 do4
    re sib8 la sib[do]
    re2 mib4

    %4
    fa re8 do re mib
    fa2 sol4\mbreak
    la sol8(fa) sib4

    %7
    fa sol8 fa mib re
    do2 fa,4
    sib2 do4

    %10
    re sib8 la sib[do]
    re2 mib4
    fa re8 do re mib\mbreak

    %13
    fa2 sol4
    la sol8(fa) sib4
    re,8 mib do4.\tr sib8

    %16
    sib2.
    sib4 re8 do re4
    re fa8 mib fa4\mbreak

    %19
    fa sib8 la sib4
    la sol8 la fa4
    sol2.

    %22
    mi4 re8 do fa4~
    fa8 sol sol4.\tr fa8
    fa2.

    %25
    do2 re4
    mib8 re mib4 fa\mbreak
    sol8 fa sol4 la

    %28
    sib la8 sol fa4
    sol mib re
    do sib8(la) sib4~

    %31
    sib8 do do4.\tr sib8
    sib2.

}

VvlIIn = \relative do'' {

    fa,2 fa4
    fa2 r4
    sib2 do4

    %4
    re sib8 la sib[do]
    re4 do sib\mbreak
    do2 re8 mib

    %7
    re4 mib8 re do sib
    la2 r4
    fa2 fa4

    %10
    fa2 r4
    sib2 do4
    re sib8 la sib[do]\mbreak

    %13
    re4 do sib
    do2 sib4
    sib8 do la4.\tr sib8

    %16
    sib2.
    fa2 r4
    sib re8 do re4\mbreak

    %19
    re fa re
    do sib8 do la4
    re do sib

    %22
    do2 la4
    re do4. do8
    la2.\mbreak

    %25
    la2 sib4
    do8 sib do4 re
    mib8 re mib4 re8 do

    %28
    sib4 do re
    sib do sib
    la fa re\mbreak

    %31
    sol fa4. fa8
    re2.

}

Vvlan = \relative do' {

    re2 la4
    sib2 r4
    fa'2 r4

    %4
    fa2 r4
    sib,2 sib4
    fa'2 fa4

    %7
    sib,2 sib4
    fa'2~fa8 mib\mbreak
    re2 la4

    %10
    sib2 r4
    fa'2 r4
    fa2 r4

    %13
    sib,2 sib4
    fa'2 fa4
    fa fa4. fa8

    %16
    re2.
    re2 r4
    fa2 r4\mbreak

    %19
    fa2 r4
    fa2 r4
    re2 sol4

    %22
    sol2 fa4
    fa mi4. fa8
    fa2.

    %25
    do2 fa4
    sol2 r4
    do,2 r4\mbreak

    %28
    re fa fa
    mib mib sib
    fa' re sib

    %31
    sib la4. sib8
    sib2.

}

Vbcn = \relative do {

    sib'2 fa4
    sib,2 r4
    sib2 r4

    %4
    sib2 r4
    sib' la sol
    fa2 re8 do

    %7
    re2 mib4
    fa4. mib8 re do\mbreak
    sib2 fa4

    %10
    sib2 r4
    sib2 r4
    sib2 r4

    %13
    sib' la sol
    fa2 re4
    sib fa' fa,

    %16
    sib2.
    sib2 r4
    sib2 r4

    %19
    sib2 r4
    fa'2.\mbreak
    sib4 la sol

    %22
    do2 re4
    sib do do,
    fa2.

    %25
    fa4 mib re
    do2 r4
    do2 r4

    %28
    sol' la sib
    mib,2.
    fa2 sol4\mbreak

    %31
    mib fa fa,
    sib2.

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 75
    s2.*16
    \bar":..:"\break
    s2.*16
    \bar":|."

}

VvlI = {
    \Vglobal
    \notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>

}

Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset

}

VIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

VIvlIn = \relative do'' {

    fa4
    sib la8 sol fa mib
    re4 re8 mib fa4
    do re sib

    %4
    do la8 sib do[re]
    mib4 do8 re mib4
    fa re sol\mbreak

    %7
    do, do8 re mib4
    re sib re
    sol la8(sol) fad4

    %10
    sol sib re,
    sol la8(sol) fad4
    sol sib re,

    %13
    mib do8 re mib4
    re2 do4\mbreak
    sib8 la la4.\tr sol8

    %16
    sol2 re'4
    sol re8 (mi) fa4
    mi re8(do) sol'4

    %19
    do sol8 la sib4
    la sib8 la sol4
    fa re sol

    %22
    mi8 fa mi fa sol4\mbreak
    la8 sol sol4.\tr fa8
    fa2 fa4

    %25
    sib la8 sol fa mib
    re4 re8 mib fa4
    do re sib

    %28
    do la8 sib do[re]
    mib4 do8 re mib4
    fa2 mib4\mbreak

    %31
    re8 do do4.\tr sib8
    sib2

}

VIvlIIn = \relative do'' {

    r4
    re2 do4
    sib2 fa8 sol
    la2 sol4

    %4
    la fa8 sol la sib\mbreak
    do4 la8 sib do4
    re sib sib

    %7
    sib2 la4
    sib2 r4
    sib2 la4

    %10
    sib2.
    r4 r la\mbreak
    sib2 sib4

    %13
    do la8 sib la4
    sib2 fad4
    sol fad4.\tr sol8

    %16
    sol2 sol4
    si si8 do re4\mbreak
    do2 mi8 fa

    %19
    sol2 sol4
    fa sol8 fa mi4
    re2 re4

    %22
    do2 do4\mbreak
    do do4. do8
    la2 r4

    %25
    re2 do4
    sib2 fa8 sol
    la2 sol4

    %28
    la fa8 sol la sib
    do4 la8 sib do4
    re2 la4\mbreak

    %31
    sib la4.\tr sib8
    sib2

}

VIvlan = \relative do' {

    r4
    fa2 fa4
    fa2.
    fa2 re4

    %4
    fa2.
    sol4 fa sol
    fa sol sol\mbreak

    %7
    fa2 fa4
    fa2 r4
    re2 re4

    %10
    re2.
    r4 r re
    re2 sol4

    %13
    sol mib mib
    fa2 la4\mbreak
    re, re4. re8

    %16
    re2 re4
    re sol2
    sol2 sol4

    %19
    sol2 sol4
    do,2 do'4
    la sib4. la8\mbreak

    %22
    sol4. fa8 mi4
    fa mi4. fa8
    fa2 r4

    %25
    fa2 fa4
    fa2 r4
    fa2 re4

    %28
    fa2.\mbreak
    sol4 fa sol
    fa2 do'4

    %31
    fa, fa4. fa8
    re2

}

VIbcn = \relative do {

    r4
    sib2 la4
    sib sib8 do re[mib]
    fa2 sol4

    %4
    fa2 mib8 re
    do4 fa mib
    re sol mib\mbreak

    %7
    fa2 fa,4
    sib2 r4
    sol2 re'4

    %10
    sol,2.
    r4 r re'
    sol,2.

    %13
    do
    sib2 la4
    sol re'2

    %16
    sol,2.
    sol2 sol4
    do2.\mbreak

    %19
    mi2 mi4
    fa2 do4
    re sib sol

    %22
    do2 do4
    fa do' do,
    fa4. mib8 re do

    %25
    sib2 la4
    sib4. do8 re[mib]\mbreak
    fa2 sol4

    %28
    fa2 mib8 re
    do4 fa mib
    re2 do4

    %31
    sib fa' fa,
    sib2

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2. = 70
    \partial 4 s4
    s2.*7
    s2
    \bar":..:"\break
    s4
    s2.*23
    s2
    \bar":|."

}

VIvlI = {
    \VIglobal
    \notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    \VIglobal
    <<\VIvlIIn \forma>>

}

VIvla = {
    \VIglobal
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset

}

VIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

VIIobIn = \relative do'' {

    sib4 do
    re fa2
    sib,4 mib8 re do sib
    la4.\tr sol8 fa4

    %4
    r sib do
    re fa2
    sib,4 mib8 re do sib

    %7
    la4.\tr sol8 fa4
    r fa' sol~\mbreak
    sol fa sib

    %10
    la sib8 la sol[fa]
    mib re do4.\tr sib8
    sib4 fa' sol~

    %13
    sol fa sib
    la sib8 la sol fa
    mib re do4.\tr sib8

    %16
    sib4 fa'8\soli mib re do\mbreak  %%5 ripresa
    sib4 mib re
    sol4. fa8 mib re

    %19
    do2 fa,4
    r fa'8 mib re do
    sib4 mib re

    %22
    sol4. fa8 mib re
    do2 fa,4
    r4 fa'\tu sib

    %25
    sol do la8 sol
    fa4. re8 mib4\mbreak
    re8 do do4.\tr sib8

    %28
    sib4 fa' sib
    sol do la8 sol
    fa4. re8 mib4

    %31
    re8 do do4.\tr sib8
    sib la sib[do] re16 do re sib
    fa'8 mi fa sol la16 sol la fa\mbreak

    %34
    sib8 la sol la sib16 la sib sol
    la8 sib la sol fa mib
    re do sib do re16 do re sib

    %37
    fa'8 mi fa sol la16 sol la fa
    sib8 la sol la sib16 la sib sol\mbreak
    la4.\tr sol8 fa4

    %40
    r re4. re8
    mib!4 sol fa
    mib4. fa8 re4~

    %43
    re8 do do4. \tr sib8
    sib4 re4. re8
    mib4 sol fa

    %46
    mib4. fa8 re4~\mbreak
    re8 do do4.\tr sib8
    sib 4fa'\soli sib

    %49
    sol4. fa8 mib re
    mib4. fa8 re4
    sol mi4.\tr re16 mi

    %52
    fa4 fa sib
    sol4. fa8 mib re
    mib4. fa8 re4\mbreak

    %55
    sol4 mi4.\tr re16 mi
    fa4 do\tu re
    mib re sol

    %58
    fa sol8 la sib4
    sol do,4.\tr sib8
    sib4 do re

    %61
    mib re sol\mbreak
    fa sol8 la sib4
    sol do,4.\tr sib8

    %64
    sib4 fa'2
    r4 mib do
    r re sib

    %67
    do la8 sol fa4
    r fa'2
    r4 mib do\mbreak %% fine pagina

    %70  OOO KKKKK
    r re sib
    do la8 sol fa4
    r fa' sib

    %73
    sol sol do
    la4. fa8 sib fa
    sol mib do re mib do

    %76
    re sib fa'4 sib
    sol sol do
    la4. fa8 sib fa\mbreak

    %79
    sol do, do4.\tr sib8
    sib fa' re fa sib,16 do re8
    do fa do fa la,16 sib do8

    %82
    sib sib' sol sib mi,16 fa sol8
    la do la do fa, mib!
    re [fa re fa sib,16 do re8]\mbreak

    %85
    do fa do fa la,16 sib do8
    sib sib' sol sib mi,16 fa sol8
    la do la do fa, mib!

    %88
    re4 fa2
    sol la4\tr
    sib8 lab sol fa mib re\mbreak

    %91
    do do la do la do
    re4 fa2
    sol la4

    %94
    sib8 lab sol fa mib re
    do4.\tr sib8 la4
    r fa'2

    %97
    sib,4 mib2
    do4 sib8 la re4~
    re8 do do4.\tr sib8

    %100
    sib4 fa'2\mbreak
    sib,4 mib2
    do4 sib8 la re4~

    %103
    re8 do do4.\tr sib8
    sib sib16 do re8 re16 mib fa8 re
    do fa,16 sol la8 la16 sib do8 re

    %106
    mib do16 re mib8 mib16 fa sol8 mib\mbreak
    re sib'16 lab sol fa mib re do8 fa
    re8 sib16 do re8 re16 mib fa8 re

    %109
    do fa,16 sol la8 la16 sib do8 re
    mib do16 re mib8 mib16 fa sol8 mib\mbreak
    re sib'16 lab sol fa mib re do8 fa

    %112
    re4 fa2~
    fa4 mib8 re mib4~
    mib re mib8. fa16

    %115
    si,4.\tr la8 sol4
    r sol'2~
    sol4 re8 mib fa4\mbreak

    %118
    mib do re~
    re8 do do4.\tr sib8
    sib4 fa'2~

    %121
    fa4 mib8 re mib4~
    mib re mib8. fa16
    si,4. \tr la8 sol4

    %124
    r sol'2~
    sol4 re8 mib fa4
    mib do re~\mbreak

    %127
    re8 do do4.\tr sib8
    sib4 r r
    R2.*8

    %137
    r4 fa' re
    r sib' sol
    r do la

    %140
    sib sib4.\tr la8
    sib4 fa re
    r sib' sol\mbreak

    %143
    r do la
    sib sib4.\tr la8
    sib4 re,4. re8

    %146
    sib'4 la sib
    sol sol4.\tr la8
    fad4.\tr mi?8 re4

    %149
    r re4. re8
    sib'4 la sib
    sol sol4.\tr la8

    %152
    fad4.\tr mi?8 re4\mbreak
    r4 fa2~
    fa4 mib8 re do sib

    %155
    sol'4. fa8 mib4
    re8 do do4.\tr sib8
    sib4 fa'2~

    %158
    fa4 mib8 re do sib
    sol'4. fa8 mib4
    re8 do do4.\tr sib8

    %161
    sib4 fa4. fa8\mbreak
    sib4 sol4. sol8
    do4 la sib

    %164
    do re4. mib8
    do4 fa,4. fa8
    sib4 sol4. sol8

    %167
    do4 la sib
    do re4. mib8
    do4 fa4. fa8

    %170
    sib4 sol mi\tr
    fa4. mib?8 re4\mbreak
    do8 sib la4.\tr sib8

    %173
    sib4 fa'4. fa8
    sib4 sol mi\tr
    fa4. mib?8 re4

    %176
    do8 sib la4.\tr sib8
    sib sib re16. do32 sib8 fa'16. sol32 la8
    sib sib, re16. do32  sib8\mbreak re16. mib32 fa8

    %179
    sol sol, sib16. la32 sol8 sib16. do32 re8
    mib16. fa32 sol8 fa16. mib32 re8 do16. re32 mib8
    re sib re16. do32 sib8 fa'16. sol32 la8\mbreak

    %182
    sib sib, re16. do32 sib8 re16. mib32 fa8
    sol sol, sib16. la32 sol8 sib16. do32 re8
    mib16. fa32 sol8 fa16. mib32 re8 do16. re32 mib8

    %185
    re4 sib4 do
    re fa2
    sib,4 mib8 re do sib

    %188
    la4.\tr sol8 fa4
    r sib do
    re fa2

    %191
    sib,4 mib8 re do sib
    la4.\tr sol8 fa4
    r fa' sol~\mbreak

    %194
    sol fa sib
    la sib8 la sol[fa]
    mib re do4.\tr sib8

    %197
    sib4 fa' sol~
    sol fa sib
    la sib8 la sol fa

    %200
    mib re do4.\tr sib8
    sib2\fermata r4

}

VIIobIIn =  \relative do'' {

    fa,4 fa
    fa2 fa4
    sol2 sol4
    fa2.

    %4
    r4 fa fa
    fa2 fa4
    sol2 sol4\mbreak

    %7
    fa2.
    r4 re' do8 sib
    do2 re8 mib

    %10
    fa2 sib,4
    do8 sib la4.\tr sib8
    sib4 re4. re8

    %13
    do2 re8 mib
    fa2 sib,4\mbreak
    do8 sib la4.\tr sib8

    %16
    sib4 re8\soli do sib la %%5 ripresa
    sol4 do sib
    mib4. re8 do sib

    %19
    la2.\tr
    r4 re8 do sib la
    sol4 do sib\mbreak

    %22
    mib4. re8 do sib
    la2.
    r4 re4.\tu re8

    %25
    mib4. re8 do4
    re4. sib8 la4
    sib la4.\tr sib8

    %28
    sib4 re4. re8\mbreak
    mib4. re8 do4
    re4. sib8 la4

    %31
    sib la4.\tr sib8
    sib4 re8 do sib4
    do2 fa4

    %34
    re2 sol4
    do, la4. la8
    sib4 re8 do sib4\mbreak

    %37
    do2 fa4
    re2 sol4
    do,4.\tr sib8 la4

    %40
    r sib4. sib8
    sib2 si4
    do2 sib?4~

    %43
    sib la4.\tr sib8\mbreak
    sib4 sib4. sib8
    sib2 si4

    %46
    do2 sib?4~
    sib la4.\tr sib8
    sib4 re4.\soli re8

    %49
    mib4. re8 do si
    do2 sib?4\mbreak
    sib8 la sol2\tr

    %52
    la4 re4. re8
    mib4. re8 do si
    do2 sib?4~

    %55
    sib8 la sol2
    la4 la\tu sib
    do sib4. do8\mbreak

    %58
    re4 do sib~
    sib la4. \tr  sib8
    sib4 la sib

    %61
    do sib4. do8
    re4 do sib~
    sib la4.\tr sib8

    %64
    sib4 re2\mbreak
    r4 do la
    r fa sol

    %67
    la fa2
    r4 re'2
    r4 do la

    %70
    r fa sol
    la fa2
    r4 re'4. re8\mbreak

    %73
    mib4 mib4. mib8
    do4. do8 re4
    sib la4.\tr la8

    %76
    sib4 re4. re8
    mib4 mib4. mib8
    do4. do8 re4

    %79
    sib la4.\tr sib8\mbreak
    sib re sib re16 mib re8 sib
    la do la la16 sib do8 la

    %82
    sol sol'16 la sib8 sol16 fa sol8 mi
    fa la fa la re,[do]\mbreak
    sib re sib re16 mib re8 sib

    %85
    la do la la16 sib do8 la
    sol sol' mi mi16 fa sol8 mi
    fa la fa la re,[do]\mbreak

    %88
    sib4 re2
    mi2 fa4
    re mib!8 re do sib

    %91
    la la fa la fa la
    sib4 re2
    mi fa4

    %94
    re mib?8 re do sib
    la4. sol8 fa4\mbreak
    r4 re'2

    %97
    sol,4 do2
    la4 fa sib~
    sib8 do la4.\tr  sib8

    %100
    sib4 re2
    sol,4 do2
    la4 fa sib~

    %103
    sib8 do la4.\tr sib8\mbreak
    sib re16 mib fa8 sib, fa [sol]
    la la16 sib do8 fa fa, sib16 la

    %106
    sol8 mib'16 fa sol8 do, sol[la]
    sib4. do16 sib la4\tr
    sib16 do re mib fa8 sib, fa[sol]\mbreak

    %109
    la la16 sib do8 fa fa, sib16 la
    sol8  mib'16 fa sol8 do, sol[la]
    sib4. do16 sib la4\tr

    %112
    sib re do
    si2 do8 sib?
    lab2.\mbreak

    %115
    sol2 re4
    r mib'2
    re re4

    %118
    do la sib~
    sib la4.\tr sib8
    sib4 re do

    %121
    si2 do8 sib?
    lab2.
    sol2 re4\mbreak

    %124
    r mib'2
    re2.
    do4 la sib~

    %127
    sib la4.\tr sib8
    sib4 r r
    R2.*8

    %137
    r4 do sib
    r re mi
    r do do\mbreak

    %140
    re do4.\tr do8
    re4 re sib
    r re mi

    %143
    r do do
    re do4. \tr do8
    re4 sib4. sib8

    %146
    sib do re4 re
    mib mib do
    re2 la4\mbreak

    %149
    r sib4. sib8
    sib do re4 re
    mib mib do

    %152
    re2 la4
    r re2~
    re4 do8 sib la[sol]

    %155
    sib4 sol la\mbreak
    sib8 do la4.\tr sib8
    sib4 re2~

    %158
    re4 do8 sib la[sol]
    sib4 sol la
    sib8 do la4.\tr sib8

    %161
    sib4 re,4. re8\mbreak
    re4 mi4. mi8
    mi4 fa4. sol8

    %164
    la4 sib4. sib8
    la2 re,4
    re mi4. mi8

    %167
    mi4 fa4. sol8\mbreak
    la4 sib4. sib8
    sib4 la re

    %170
    sib2 sol4
    la4. la8 sib4
    sol fa4.\tr fa8

    %173
    fa4 re'4. do8
    sib4. la8 sol4\mbreak
    la4. la8 sib4

    %176
    sol fa4. fa8
    fa re'16 do sib16. do32 re8 do16. sib32 do8
    sib16. la32 sol8 sib16. do32 re8 la16. sol32 la8\mbreak

    %179
    sol sib16. la32 sol16. la32 sib8 fa sib16 la
    sol4 do8 sib la4\tr
    sib sib16. do32 re8 do8. re16

    %182
    sib2 la16. sol32 la8
    sol sib16 la sol16. la32 sib8 fa sib16 la
    sol4 do8 sib la4\tr

    %185
    sib fa fa
    fa2 fa4
    sol2 sol4

    %188
    fa2.
    r4 fa fa
    fa2 fa4

    %191
    sol2 sol4\mbreak
    fa2.
    r4 re' do8 sib

    %194
    do2 re8 mib
    fa2 sib,4
    do8 sib la4.\tr sib8

    %197
    sib4 re4. re8
    do2 re8 mib
    fa2 sib,4\mbreak

    %200
    do8 sib la4.\tr sib8
    sib2\fermata r4

}

VIIvlIn = \relative do'' {

    sib4 do
    re fa2
    sib,4 mib8 re do sib
    la4.\tr sol8 fa4

    %4
    r sib do
    re fa2
    sib,4 mib8 re do sib

    %7
    la4.\tr sol8 fa4
    r fa' sol~\mbreak
    sol fa sib

    %10
    la sib8 la sol[fa]
    mib re do4.\tr sib8
    sib4 fa' sol~

    %13
    sol fa sib
    la sib8 la sol fa
    mib re do4.\tr sib8

    %16
    sib4 r r
    R2.*7
    r4 fa'\tu sib

    %25
    sol do la8 sol
    fa4. re8 mib4\mbreak
    re8 do do4.\tr sib8

    %28
    sib4 fa' sib
    sol do la8 sol
    fa4. re8 mib4

    %31
    re8 do do4.\tr sib8
    sib la sib[do] re16 do re sib
    fa'8 mi fa sol la16 sol la fa\mbreak

    %34
    sib8 la sol la sib16 la sib sol
    la8 sib la sol fa mib
    re do sib do re16 do re sib

    %37
    fa'8 mi fa sol la16 sol la fa
    sib8 la sol la sib16 la sib sol\mbreak
    la4.\tr sol8 fa4

    %40
    r re4. re8
    mib!4 sol fa
    mib4. fa8 re4~

    %43
    re8 do do4. \tr sib8
    sib4 re4. re8
    mib4 sol fa

    %46
    mib4. fa8 re4~\mbreak
    re8 do do4.\tr sib8
    sib4 r r

    %49
    R2.*7
    r4 do\tu re
    mib re sol

    %58
    fa sol8 la sib4
    sol do,4.\tr sib8
    sib4 do re

    %61
    mib re sol\mbreak
    fa sol8 la sib4
    sol do,4.\tr sib8

    %64
    sib4 fa'2
    r4 mib do
    r re sib

    %67
    do la8 sol fa4
    r fa'2
    r4 mib do\mbreak %% fine pagina

    %70  OOO KKKKK
    r re sib
    do la8 sol fa4
    r fa' sib

    %73
    sol sol do
    la4. fa8 sib fa
    sol mib do re mib do

    %76
    re sib fa'4 sib
    sol sol do
    la4. fa8 sib fa\mbreak

    %79
    sol do, do4.\tr sib8
    sib fa' re fa sib,16 do re8
    do fa do fa la,16 sib do8

    %82
    sib sib' sol sib mi,16 fa sol8
    la do la do fa, mib!
    re [fa re fa sib,16 do re8]\mbreak

    %85
    do fa do fa la,16 sib do8
    sib sib' sol sib mi,16 fa sol8
    la do la do fa, mib!

    %88
    re4 fa2
    sol la4\tr
    sib8 lab sol fa mib re\mbreak

    %91
    do do la do la do
    re4 fa2
    sol la4

    %94
    sib8 lab sol fa mib re
    do4.\tr sib8 la4
    r fa'2

    %97
    sib,4 mib2
    do4 sib8 la re4~
    re8 do do4.\tr sib8

    %100
    sib4 fa'2\mbreak
    sib,4 mib2
    do4 sib8 la re4~

    %103
    re8 do do4.\tr sib8
    sib4 r r
    do r r

    %106
    mib r r
    re8 sib'16 lab sol fa mib re do8 fa
    re4 r r

    %109
    do r r
    mib r r
    re8 sib'16 lab sol fa mib re do8 fa

    %112
    re4 fa2~
    fa4 mib8 re mib4~
    mib re mib8. fa16

    %115
    si,4.\tr la8 sol4
    r sol'2~
    sol4 re8 mib fa4\mbreak

    %118
    mib do re~
    re8 do do4.\tr sib8
    sib4 fa'2~

    %121
    fa4 mib8 re mib4~
    mib re mib8. fa16
    si,4. \tr la8 sol4

    %124
    r sol'2~
    sol4 re8 mib fa4
    mib do re~\mbreak

    %127
    re8 do do4.\tr sib8
    sib4 fa'\soli sib
    sol lab8 sol fa mib

    %130
    re4 sib do8 re
    mib4. fa8 re4
    do la2\tr

    %133
    r4 fa' sib
    sol lab8 sol fa mib
    re4 sib do8 re

    %136
    mib4. fa8 re4
    do  fa\tu re
    r sib' sol
    r do la

    %140
    sib sib4.\tr la8
    sib4 fa re
    r sib' sol\mbreak

    %143
    r do la
    sib sib4.\tr la8
    sib4 re,4. re8

    %146
    sib'4 la sib
    sol sol4.\tr la8
    fad4.\tr mi8 re4

    %149
    r re4. re8
    sib'4 la sib
    sol sol4.\tr la8

    %152
    fad4.\tr mi?8 re4\mbreak
    r4 fa2~
    fa4 mib8 re do sib

    %155
    sol'4. fa8 mib4
    re8 do do4.\tr sib8
    sib4 fa'2~

    %158
    fa4 mib8 re do sib
    sol'4. fa8 mib4
    re8 do do4.\tr sib8

    %161
    sib4 fa4. fa8\mbreak
    sib4 sol4. sol8
    do4 la sib

    %164
    do re4. mib8
    do4 fa,4. fa8
    sib4 sol4. sol8

    %167
    do4 la sib
    do re4. mib8
    do4 fa4. fa8

    %170
    sib4 sol mi\tr
    fa4. mib!8 re4\mbreak
    do8 sib la4.\tr sib8

    %173
    sib4 fa'4. fa8
    sib4 sol mi\tr
    fa4. mib!8 re4

    %176
    do8 sib la4.\tr sib8
    sib sib re16. do32 sib8 fa'16. sol32 la8
    sib sib, re16. do32  sib8\mbreak re16. mib32 fa8

    %179
    sol sol, sib16. la32 sol8 sib16. do32 re8
    mib16. fa32 sol8 fa16. mib32 re8 do16. re32 mib8
    re sib re16. do32 sib8 fa'16. sol32 la8\mbreak

    %182
    sib sib, re16. do32 sib8 re16. mib32 fa8
    sol sol, sib16. la32 sol8 sib16. do32 re8
    mib16. fa32 sol8 fa16. mib32 re8 do16. re32 mib8

    %185
    re4 sib4 do
    re fa2
    sib,4 mib8 re do sib

    %188
    la4.\tr sol8 fa4
    r sib do
    re fa2

    %191
    sib,4 mib8 re do sib
    la4.\tr sol8 fa4
    r fa' sol~\mbreak

    %194
    sol fa sib
    la sib8 la sol[fa]
    mib re do4.\tr sib8

    %197
    sib4 fa' sol~
    sol fa sib
    la sib8 la sol fa

    %200
    mib re do4.\tr sib8
    sib2\fermata r4

}

VIIvlIIn = \relative do'' {

    fa,4 fa
    fa2 fa4
    sol2 sol4
    fa2.

    %4
    r4 fa fa
    fa2 fa4
    sol2 sol4\mbreak

    %7
    fa2.
    r4 re' do8 sib
    do2 re8 mib

    %10
    fa2 sib,4
    do8 sib la4.\tr sib8
    sib4 re4. re8

    %13
    do2 re8 mib
    fa2 sib,4\mbreak
    do8 sib la4.\tr sib8

    %16
    sib4 r r
    R2.*7
    r4 re4.\tu re8

    %25
    mib4. re8 do4
    re4. sib8 la4
    sib la4.\tr sib8

    %28
    sib4 re4. re8\mbreak
    mib4. re8 do4
    re4. sib8 la4

    %31
    sib la4.\tr sib8
    sib4 re8 do sib4
    do2 fa4

    %34
    re2 sol4
    do, la4. la8
    sib4 re8 do sib4\mbreak

    %37
    do2 fa4
    re2 sol4
    do,4.\tr sib8 la4

    %40
    r sib4. sib8
    sib2 si4
    do2 sib?4~

    %43
    sib la4.\tr sib8\mbreak
    sib4 sib4. sib8
    sib2 si4

    %46
    do2 sib?4~
    sib la4.\tr sib8
    sib4 r r

    %49
    R2.*7
    r4 la\tu sib
    do sib4. do8\mbreak

    %58
    re4 do sib~
    sib la4. \tr  sib8
    sib4 la sib

    %61
    do sib4. do8
    re4 do sib~
    sib la4.\tr sib8

    %64
    sib4 re2\mbreak
    r4 do la
    r fa sol

    %67
    la fa2
    r4 re'2
    r4 do la

    %70
    r fa sol
    la fa2
    r4 re'4. re8\mbreak

    %73
    mib4 mib4. mib8
    do4. do8 re4
    sib la4.\tr la8

    %76
    sib4 re4. re8
    mib4 mib4. mib8
    do4. do8 re4

    %79
    sib la4.\tr sib8\mbreak
    sib re sib re16 mib re8 sib
    la do la la16 sib do8 la

    %82
    sol sol'16 la sib8 sol16 fa sol8 mi
    fa la fa la re,[do]\mbreak
    sib re sib re16 mib re8 sib

    %85
    la do la la16 sib do8 la
    sol sol' mi mi16 fa sol8 mi
    fa la fa la re,[do]\mbreak

    %88
    sib4 re2
    mi2 fa4
    re mib!8 re do sib

    %91
    la la fa la fa la
    sib4 re2
    mi fa4

    %94
    re mib?8 re do sib
    la4. sol8 fa4\mbreak
    r4 re'2

    %97
    sol,4 do2
    la4 fa sib~
    sib8 do la4.\tr  sib8

    %100
    sib4 re2
    sol,4 do2
    la4 fa sib~

    %103
    sib8 do la4.\tr sib8\mbreak
    sib4 r r
    la r r

    %106
    sol r r
    sib4. do16 sib la4\tr
    sib r r

    %109
    la r r
    sol r r
    sib4. do16 sib la4\tr

    %112
    sib re do
    si2 do8 sib?
    lab2.\mbreak

    %115
    sol2 re4
    r mib'2
    re re4

    %118
    do la sib~
    sib la4.\tr sib8
    sib4 re do

    %121
    si2 do8 sib?
    lab2.
    sol2 re4\mbreak

    %124
    r mib'2
    re2.
    do4 la sib~

    %127
    sib la4.\tr sib8
    sib4 re4.\soli re8
    mib4 fa8 mib re do

    %130
    sib4 sol la8 sib\mbreak
    do4. do8 sib4
    la fa2

    %133
    r4 re'4. re8
    mib4 fa8 mib re do
    sib4 sol la8 sib

    %136
    do4. do8 sib4
    la4. do8\tu sib4
    r re mi
    r do do\mbreak

    %140
    re do4.\tr do8
    re4 re sib
    r re mi

    %143
    r do do
    re do4. \tr do8
    re4 sib4. sib8

    %146
    sib do re4 re
    mib mib do
    re2 la4\mbreak

    %149
    r sib4. sib8
    sib do re4 re
    mib mib do

    %152
    re2 la4
    r re2~
    re4 do8 sib la[sol]

    %155
    sib4 sol la\mbreak
    sib8 do la4.\tr sib8
    sib4 re2~

    %158
    re4 do8 sib la[sol]
    sib4 sol la
    sib8 do la4.\tr sib8

    %161
    sib4 re,4. re8\mbreak
    re4 mi4. mi8
    mi4 fa4. sol8

    %164
    la4 sib4. sib8
    la2 re,4
    re mi4. mi8

    %167
    mi4 fa4. sol8\mbreak
    la4 sib4. sib8
    sib4 la re8 do

    %170
    sib2 sol4
    la4. la8 sib4
    sol fa4.\tr fa8

    %173
    fa4 re'4. do8
    sib4. la8 sol4\mbreak
    la4. la8 sib4

    %176
    sol fa4. fa8
    fa re'16 do sib16. do32 re8 do16. sib32 do8
    sib16. la32 sol8 sib16. do32 re8 la16. sol32 la8\mbreak

    %179
    sol sib16. la32 sol16. la32 sib8 fa sib16 la
    sol4 do8 sib la4\tr
    sib sib16. do32 re8 do8. re16

    %182
    sib2 la16. sol32 la8
    sol sib16 la sol16. la32 sib8 fa sib16 la
    sol4 do8 sib la4\tr

    %185
    sib fa fa
    fa2 fa4
    sol2 sol4

    %188
    fa2.
    r4 fa fa
    fa2 fa4

    %191
    sol2 sol4\mbreak
    fa2.
    r4 re' do8 sib

    %194
    do2 re8 mib
    fa2 sib,4
    do8 sib la4.\tr sib8

    %197
    sib4 re4. re8
    do2 re8 mib
    fa2 sib,4\mbreak

    %200
    do8 sib la4.\tr sib8
    sib2\fermata r4

}

VIIvlan = \relative do' {

    re4 do
    sib re do
    re do2
    do4. sib8 la4

    %4
    r re do
    sib re do
    re do2

    %7
    do4. sib8 la4\mbreak
    r re4. re8
    do2 sol'4

    %10
    do, re sol~
    sol do, fa
    re re4. re8

    %13
    la'2 re,8 sib
    do4 re sol~
    sol do, fa

    %16
    re r r %%% ripresa
    R2.*7\mbreak
    r4 sib' sib

    %25
    sib la2
    la4. sib8 do4
    fa, fa4. fa8

    %28
    re4 sib' sib
    sib la2
    la4. sib8 do4

    %31
    fa, fa4. fa8
    re4 fa4. sol8\mbreak
    la4. sol8 fa4

    %34
    sol4. fa8 mi4
    fa8 sol fa mib? re do
    sib4 fa'4. sol8

    %37
    la4. sol8 fa4
    sol4. fa8 mi4
    fa2 do4

    %40
    r fa4. fa8
    sol4 sol, re'\mbreak
    sol fa fa

    %43
    sol fa4. fa8
    re4 fa4. fa8
    sol4 sol, re'

    %46
    sol fa fa
    sol fa4. fa8
    re4 r r

    %49
    R2.*7
    r4 fa fa
    sol2 sol4

    %58
    sib fa sol~\mbreak
    sol fa4. fa8
    re4 fa fa

    %61
    sol2 sol4
    sib fa sol~
    sol fa4. fa8

    %64
    re2.
    r4 sol fa
    r sib, sib

    %67
    fa' do2
    r4 sib' la
    r sol fa\mbreak

    %70 OK
    r4 sib, sib
    fa' do2
    r4 sib'8 lab sol fa

    %73
    mib4. fa8 sol4
    fa2 fa8 sib
    sol4 fa4. fa8

    %76
    fa4 sib8 lab sol fa
    mib4. fa8 sol4
    fa2 fa4

    %79
    mib do fa\mbreak
    re4 r r8 fa
    fa4 r r8 fa

    %82
    re4 r r8 do
    do4 r fa
    fa r r8 fa

    %85
    fa4 r r8 fa
    re4 r r8 do'
    do4 r la8. sol16

    %88
    fa2.\mbreak
    sib8 sol sib sol do[fa,]
    fa4 mib2

    %91
    r4 fa4. fa8
    sib, sib' la fa re4
    sib'8 sol sib sol do[fa,]

    %94
    fa4 mib sol,
    la do2
    r4 sib4. re8

    %97
    mib4 sol4. mib8\mbreak
    fa2 fa4~
    fa8 sol fa4. fa8

    %100
    re4 sib4. re8
    mib4 sol4. mib8
    fa2 fa4~

    %103
    fa8 sol fa4. fa8
    re4 r r
    fa r r

    %106
    mib r r
    sol8 re mib4 fa
    re4 r r\mbreak

    %109
    fa r r
    mib r r
    sol8 re mib[mib] fa4

    %112
    re re2
    re4 sol2
    fa re4

    %115
    re4. do8 si4
    r sib'? mib,
    sol2 sol4

    %118
    sol fa fa
    sol fa4. fa8\mbreak
    re4 re2

    %121
    re4 sol2
    fa re4
    re4. do8 si4

    %124
    r4 sib'? mib,
    sol2 sol4
    sol fa fa

    %127
    sol fa4. fa8
    re4 sib'\soli sol
    mib2 fa4

    %130
    sol4. fa8 mib re
    do sib la4 sib
    fa'8 mib fa sol la fa

    %133
    sib4. la8 sol fa
    mib2 fa4
    sol4. fa8 mib re

    %136
    do sib la4 sib
    fa'2 fa4
    r sol \tu sol

    %139
    r fa fa
    fa fa4. fa8\mbreak
    fa4 fa fa

    %142
    r sol sol
    r fa fa
    fa fa4. fa8

    %145
    fa4 fa4. fa8
    sol4 la sol
    sib do4. sib8

    %148
    la2.
    r4 fa4. fa8
    sol4 la sol

    %151
    sib do4. sib8\mbreak
    la2.
    r4 sib la

    %154
    sib sol2
    sol4 mib mib
    fa fa4. fa8

    %157
    re2 la'4
    sib sol2
    sol4 mib mib

    %160
    fa fa4. fa8
    re2 sib4
    sib do2

    %163
    do4 re2
    mib4 fa4. fa8\mbreak
    fa2.

    %166
    sib,4 do4. do8
    do4 re2
    mib4 fa4. fa8

    %169
    fa2 fa4
    sol2.
    do,4 re8 do sib4

    %172
    mib8 re do2\tr
    re2 re4
    re2 mi8 re

    %175
    do4 re8 do sib4\mbreak
    mib8 re do4.\tr do8
    re fa sib[sib,] r4

    %178
    sol'8 sol, r4 fa'8 fa,
    r4 mib'8 mib, r4
    mib'8 re do[fa] fa4\mbreak

    %181
    re4 sib'8 sib, r4
    sol'8 sol, r4 fa'8 fa,
    r4 mib'8 mib, r4

    %184
    mib'8 re do fa fa4
    re re4 do
    sib re do

    %187
    re do2
    do4. sib8 la4
    r re do

    %190
    sib re do
    re do2
    do4. sib8 la4\mbreak

    %193
    r re4. re8
    do2 sol'4
    do, re sol~

    %196
    sol do, fa
    re re4. re8
    la'2 re,8 sib

    %199
    do4 re sol~
    sol do, fa
    re2\fermata r4

}

VIIfgn = \relative do {

    sib'4 la
    sib2 la4
    sol do, mib
    fa4. sol8 la fa

    %4
    sib2 la4
    sib2 la4
    sol do, mib

    %7
    fa4. sol8 la fa\mbreak
    sib4. sib8 la sol
    la2 sol4

    %10
    fa re  mib
    do fa fa,
    sib2 sib'4

    %13
    la2 sol4
    fa re  mib
    do fa fa,

    %16
    sib2 re4\soli %%%%%% ripresa
    mib do sol'
    mib do mib

    %19
    fa4. la8 sol fa
    sib4 sib, re
    mib do sol'

    %22
    mib do mib
    fa4. sol8 la fa
    sib4. la8 sol fa

    %25
    mib8 re do[mib fa mib]
    re4. sol8 do,4
    sib fa' fa,

    %28
    sib sib'8 la sol fa
    mib re do mib fa[mib]
    re4. sol8 do,4

    %31
    sib fa' fa,
    sib sib' sib,\mbreak
    r la' la,

    %34
    r sol' sol,
    r fa' fa,
    r sib' sib,

    %37
    r la' la,
    r sol' sol,
    r fa'8 sol la fa

    %40
    sib2 lab4
    sol mib re
    do la sib

    %43
    mib fa fa,
    sib sib' lab\mbreak
    sol mib re

    %46
    do la sib
    mib fa fa,
    sib sib'\soli sol

    %49
    mib fa sol
    do, la sib
    sol do2

    %52
    fa,4 sib' sol
    mib fa sol
    do, la sib

    %55
    sol do2\mbreak
    fa,4  fa' re
    do sol' mib

    %58
    sib' la sol
    mib fa fa,
    sib fa' mib8 re

    %61
    do4 sol' mib
    sib' la sol
    mib fa fa,

    %64
    sib sib' fa
    sol do, fa8 mib\mbreak  %% fine pagima
    re do sib[sib' la sol]

    %67
    fa4. mib8 re do
    sib4 sib' fa
    sol do, fa8 mib

    %70
    re do sib[sib'] la sol
    fa sol fa mib re do
    sib4 r r

    %73
    r4 do8 re mib do
    fa4 mib re
    mib fa fa,

    %76
    sib r r
    r do8 re mib do
    fa4 mib  re

    %79
    mib fa fa,
    sib4 r r8  sib
    fa'4 r r8 fa\mbreak

    %82
    sol4 r r8 do,
    fa4 r fa,
    sib r r8 sib

    %85
    fa'4 r r8 fa
    sol4 r r8 do,
    fa4 r fa,

    %88
    sib8 sib' fa[sib] fa sib
    sol do sol do la re\mbreak
    sib4 mib,2

    %91
    fa fa,4
    r8 sib' fa sib fa sib
    sol do sol do la re

    %94
    sib4 mib,2
    fa8 mi? fa sol la fa
    sib[fa] sib, do re sib

    %97
    mib re do re mib do
    fa sol fa mib re do\mbreak
    sib[mib!] fa mib fa fa,

    %100
    sib la sib do re sib
    mib re do re mib do
    fa sol fa  mib re do

    %103
    sib[mib] fa mib fa fa,
    sib4 r8 sib16 do re8 sib\mbreak
    fa'4 r8 fa,16 sol la8[fa]

    %106
    do'4 r8 do16 re mib8[do]
    sol'4 mib8 do fa[fa,]
    sib4 r8 sib16 do re8[sib]

    %109
    fa'4 r8 fa,16 sol la8[fa]
    do'4 r8 do16 re mib8[do]
    sol'4 mib8 do fa[fa,]  %%%%%%% <-------- verifica sul basso

    %112
    sib4 sib' lab
    sol2 do,4
    fa2.

    %115
    sol2~sol8 fa\mbreak
    mib re mib4 re8 do
    si2.

    %118
    do4 fa sib,
    mib fa fa,
    sib sib' lab

    %121
    sol2 do,4
    fa2.
    sol2~sol8 fa

    %124
    mib re mib4 re8 do
    si2.\mbreak
    do4 fa sib,

    %127
    mib fa fa,
    sib4 r r
    R2.*8

    %137
    r4 fa'8 la sib la
    sol fa sol sib do sib
    la sib la sol fa mib

    %140
    re mib fa mib fa fa,\mbreak
    sib do re[sib] sib' la
    sol fa sol sib do sib

    %143
    la sib la sol fa mib
    re mib fa mib fa fa,
    sib4 sib' la

    %146
    sol fad sol
    mib8 re do4 la\mbreak
    re4. mi?8 fad re

    %149
    sol4 sib la
    sol fad sol
    mib8 re do4 la

    %152
    re4. mib8 re do
    sib4 sib' fa
    re mib sol

    %155
    mib4. re8 do4\mbreak
    sib fa' fa,
    sib sib' fa

    %158
    re  mib sol
    mib4. re8 do4
    sib fa' fa,

    %161
    sib4 sib4. la8
    sol4 do4. sib8
    la4 re2

    %164
    do4 sib4. sib8\mbreak
    fa'2 sib,8 la
    sol4 do4. sib8

    %167
    la4 re2
    do4 sib4. sib8
    fa'2 sib8 la

    %170
    sol2 do8 sib
    la4 fa sol
    mib fa fa,

    %173
    sib2 sib'8 la\mbreak
    sol2 do8 sib
    la4 fa sol

    %176
    mib fa fa,
    sib'8 sib, r4 la'8 la,
    r4 sol'8 sol, r4

    %179
    mib'8 mib, r4 re'8 do\mbreak
    do sib la sib fa'[fa,]
    sib' sib, r4 la'8 la,

    %182
    r4 sol'8 sol, r4
    mib'8 mib, r4 re'8 sib
    do sib la sib fa'[fa,]

    %185
    sib4 sib'4 la
    sib2 la4
    sol do, mib

    %188
    fa4. sol8 la fa
    sib2 la4
    sib2 la4

    %191
    sol do, mib
    fa4. sol8 la fa\mbreak
    sib4. sib8 la sol

    %194
    la2 sol4
    fa re  mib
    do fa fa,

    %197
    sib2 sib'4
    la2 sol4
    fa re  mib

    %200
    do fa fa,
    sib2\fermata r4

}

VIIbcn = \relative do {

    sib'4 la
    sib2 la4
    sol do, mib
    fa4. sol8 la fa

    %4
    sib2 la4
    sib2 la4
    sol do, mib

    %7
    fa4. sol8 la fa\mbreak
    sib4. sib8 la sol
    la2 sol4

    %10
    fa re  mib
    do fa fa,
    sib2 sib'4

    %13
    la2 sol4
    fa re  mib
    do fa fa,

    %16
    sib4 r r %%%%%% ripresa
    R2.*7
    r4 sib'8 la sol fa

    %25
    mib8 re do[mib fa mib]
    re4. sol8 do,4
    sib fa' fa,

    %28
    sib sib'8 la sol fa
    mib re do mib fa[mib]
    re4. sol8 do,4

    %31
    sib fa' fa,
    sib sib' sib,\mbreak
    r la' la,

    %34
    r sol' sol,
    r fa' fa,
    r sib' sib,

    %37
    r la' la,
    r sol' sol,
    r fa'8 sol la fa

    %40
    sib2 lab4
    sol mib re
    do la sib

    %43
    mib fa fa,
    sib sib' lab\mbreak
    sol mib re

    %46
    do la sib
    mib fa fa,
    sib r r

    %49
    R2.*7
    r4  fa' re
    do sol' mib

    %58
    sib' la sol
    mib fa fa,
    sib fa' mib8 re

    %61
    do4 sol' mib
    sib' la sol
    mib fa fa,

    %64
    sib sib' fa
    sol do, fa8 mib\mbreak  %% fine pagima
    re do sib[sib' la sol]

    %67
    fa4. mib8 re do
    sib4 sib' fa
    sol do, fa8 mib

    %70
    re do sib[sib'] la sol
    fa sol fa mib re do
    sib4 r r

    %73
    r4 do8 re mib do
    fa4 mib re
    mib fa fa,

    %76
    sib r r
    r do8 re mib do
    fa4 mib  re

    %79
    mib fa fa,
    sib4 r r8  sib
    fa'4 r r8 fa\mbreak

    %82
    sol4 r r8 do,
    fa4 r fa,
    sib r r8 sib

    %85
    fa'4 r r8 fa
    sol4 r r8 do,
    fa4 r fa,

    %88
    sib8 sib' fa[sib] fa sib
    sol do sol do la re\mbreak
    sib4 mib,2

    %91
    fa fa,4
    r8 sib' fa sib fa sib
    sol do sol do la re

    %94
    sib4 mib,2
    fa8 mi? fa sol la fa
    sib[fa] sib, do re sib

    %97
    mib re do re mib do
    fa sol fa mib re do\mbreak
    sib[mib!] fa mib fa fa,

    %100
    sib la sib do re sib
    mib re do re mib do
    fa sol fa  mib re do

    %103
    sib[mib] fa mib fa fa,
    sib4 r r\mbreak
    fa'r r

    %106
    do r r
    sol'4 mib8 do fa[fa,]
    sib4 r r

    %109
    fa' r r
    do r r
    sol'4 mib8 do fa[fa,]  %%%%%%% <-------- verifica sul basso

    %112
    sib4 sib' lab
    sol2 do,4
    fa2.

    %115
    sol2~sol8 fa\mbreak
    mib re mib4 re8 do
    si2.

    %118
    do4 fa sib,
    mib fa fa,
    sib sib' lab

    %121
    sol2 do,4
    fa2.
    sol2~sol8 fa

    %124
    mib re mib4 re8 do
    si2.\mbreak
    do4 fa sib,

    %127
    mib fa fa,
    sib4 r r
    R2.*8

    %137
    r4 fa'8 la sib la
    sol fa sol sib do sib
    la sib la sol fa mib

    %140
    re mib fa mib fa fa,\mbreak
    sib do re[sib] sib' la
    sol fa sol sib do sib

    %143
    la sib la sol fa mib
    re mib fa mib fa fa,
    sib4 sib' la

    %146
    sol fad sol
    mib8 re do4 la\mbreak
    re4. mi?8 fad re

    %149
    sol4 sib la
    sol fad sol
    mib8 re do4 la

    %152
    re4. mib8 re do
    sib4 sib' fa
    re mib sol

    %155
    mib4. re8 do4\mbreak
    sib fa' fa,
    sib sib' fa

    %158
    re  mib sol
    mib4. re8 do4
    sib fa' fa,

    %161
    sib4 sib4. la8
    sol4 do4. sib8
    la4 re2

    %164
    do4 sib4. sib8\mbreak
    fa'2 sib,8 la
    sol4 do4. sib8

    %167
    la4 re2
    do4 sib4. sib8
    fa'2 sib8 la

    %170
    sol2 do8 sib
    la4 fa sol
    mib fa fa,

    %173
    sib2 sib'8 la\mbreak
    sol2 do8 sib
    la4 fa sol

    %176
    mib fa fa,
    sib'8 sib, r4 la'8 la,
    r4 sol'8 sol, r4

    %179
    mib'8 mib, r4 re'8 do\mbreak
    do sib la sib fa'[fa,]
    sib' sib, r4 la'8 la,

    %182
    r4 sol'8 sol, r4
    mib'8 mib, r4 re'8 sib
    do sib la sib fa'[fa,]

    %185
    sib4 sib'4 la
    sib2 la4
    sol do, mib

    %188
    fa4. sol8 la fa
    sib2 la4
    sib2 la4

    %191
    sol do, mib
    fa4. sol8 la fa\mbreak
    sib4. sib8 la sol

    %194
    la2 sol4
    fa re  mib
    do fa fa,

    %197
    sib2 sib'4
    la2 sol4
    fa re  mib

    %200
    do fa fa,
    sib2\fermata r4

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key sib\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 64
    \partial 2 s2
    s2.*201
    \bar"|."

}

VIIobI = {
    \VIIglobal
    %\notypeset
    <<\VIIobIn \forma>>

}

VIIobII = {
    \VIIglobal
    <<\VIIobIIn \forma>>

}

VIIvlI = {
    \VIIglobal
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    \VIIglobal
    <<\VIIvlIIn \forma>>

}

VIIvla = {
    \VIIglobal
    \clef alto
    <<\VIIvlan \forma>>

}

VIIfg = {
    \VIIglobal
    \clef bass
    <<\VIIfgn \forma>>

}

VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
    \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup\huge "[1.] Sinfonia - allegro assai"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois I"\vspace #-0.2"e Violino I"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois II"\vspace #-0.2"e Violino II"}
                \IvlII
            >>

            \new Staff \with {
                fontSize = #-2
                \override StaffSymbol #'staff-space = #(magstep -2)
            }<<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Fagotto"\vspace #-0.2"e Basso"}
                \Ibc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \pageBreak

    \markup\huge "[2.] Grave"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIvlII
            >>

            \new Staff \with {
                fontSize = #-2
                \override StaffSymbol #'staff-space = #(magstep -2)
            }<<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }


    \markup\huge "[3.] Libertein - allegro"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Hautbois""Premiere"}
                \set Staff.midiInstrument = #"oboe"
                \IIIobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Hautbois""Secondieme"}
                \set Staff.midiInstrument = #"oboe"
                \IIIobII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>

            \new Staff \with {
                fontSize = #-2
                \override StaffSymbol #'staff-space = #(magstep -2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Fagotto"\vspace #-0.2"e Basso"}
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup\huge "[4.] Entrée"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IVvlII
            >>

            \new Staff \with {
                fontSize = #-2
                \override StaffSymbol #'staff-space = #(magstep -2)
            }<<
                \set Staff.midiInstrument = #"viola"
                \IVvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IVbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \pageBreak

    \markup\huge "[5.] Menuet"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \VvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \Vvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \Vbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \pageBreak

    \markup\huge "[6.] Passepied"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \VIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \VIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \VIbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge "[7.] Ciacona"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Hautbois""Premiere"}
                \set Staff.midiInstrument = #"oboe"
                \VIIobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Hautbois""Secondieme"}
                \set Staff.midiInstrument = #"oboe"
                \VIIobII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.midiInstrument = #"violin"
                \VIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.midiInstrument = #"violin"
                \VIIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \VIIvla
            >>
            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \VIIfg
            >>
            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.midiInstrument = #"cello"
                \VIIbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}
