\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

parentSlur =
 -\tweak stencil
 #(lambda (grob)
   (let* ((cp (ly:grob-property grob 'control-points))
          (lp (grob-interpret-markup grob (markup #:teeny "(")))
          (rp (grob-interpret-markup grob (markup #:teeny ")"))))
     (set! lp (ly:stencil-aligned-to lp Y CENTER))
     (set! lp (ly:stencil-aligned-to lp X 0.2))
     (set! lp (ly:stencil-translate lp (first cp)))
     (set! rp (ly:stencil-aligned-to rp Y CENTER))
     (set! rp (ly:stencil-aligned-to rp X -0.2))
     (set! rp (ly:stencil-translate rp (last cp)))
     (list-set! cp 0
       (cons (cdr (ly:stencil-extent lp X))
             (cdr (first cp))))
     (list-set! cp (1- (length cp))
       (cons (car (ly:stencil-extent rp X))
             (cdr (last cp))))
     (ly:grob-set-property! grob 'control-points cp)
     (apply ly:stencil-add (list lp rp
       (ly:slur::print grob)))))
 \etc


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
    \terzine \con

}

IvlIn = \relative do'' {

    fa4. lab8 sib,4. reb8
    do fa, mi sib' lab[sol16 fa la8 si]
    do1

    %4
    re?8 mib? fa re do4  sib?
    lab4. do8 reb do sib fa'
    mi fa sol mi do4. re?8

    %7
    sol, sol' fa mib lab4 r8 fa~
    fa mib re sol~sol mib re do
    fa fa4 lab8 sib, sib4 do8\mbreak

    %10
    lab lab'4 do8 reb,8 reb4 mib8
    do[fa16 sol lab sol lab fa] do'4 sib
    lab2 sol8[mi16 fa sol fa sol mi]

    %13
    lab8 reb4 do sib lab8~
    lab sol4 fa mib8 re?4
    do4. mib8 fa,4. lab8

    %16
    sol do, si fa' mib[re16 do re8 mi]
    fa1
    sol8 lab sib sol\mbreak do4. re?8

    %19
    sol,4 r fa'8 sol fa mib?
    re?4. re8 mib fa mib reb!
    do4 lab'2 sol4

    %22
    lab r r2
    R1
    r8 sol16[lab sib lab sib sol] do,8[ do16 re mib re mib do]

    %25
    sol'4 fa8 re sib4. sib'8
    mib,[do16 reb mib reb mib do] lab'8[fa16 sol lab sol lab fa]
    do'4 r r2

    %28
    mib,4. sol8 lab,4. do8
    sib mib, re lab'\mbreak sol8[sol'16 lab sib sol fa mib]
    lab2~lab8[fa16 sol lab fa mib reb]

    %31
    sol2~sol8[mib16 fa sol mib reb do]
    fa2~fa8[reb16 mib fa reb do sib]
    mib2~mib8[do16 reb mib do sib la?]

    %34
    reb8 sib'4 lab? solb fa8~\mbreak
    fa mib4 reb do sib8
    la4 sib2 la4

    %37
    sib'4. reb8 mib,4. solb8
    fa sib, la mib' reb[do16 sib re8 mi]\mbreak
    fa1~

    %40
    fa4 sol do,2
    reb8[reb16 mib fa mib fa reb] sib8[solb16 lab sib lab sib solb]\mbreak
    lab8 fa'4 la,8 fa' fa4 sol?8

    %43
    do,[lab?16 sib do sib do lab] fa'8[reb16 mib fa mib fa reb]
    sol,4 sol' do, r
    sib'8 sib4 sib8~sib[sol16 lab sib lab sib sol]

    %46
    lab8 lab4 lab8~lab8[fa16 sol lab sol lab fa]
    sol8 sol4 sol8~sol[mib16 fa sol fa sol mib]
    fa8 fa4 fa8~\mbreak fa[re?16 mib fa mib fa re]

    %49
    mib8 sol4 lab8 fa fa4 sol8
    mib mib4 fa8 re re4 mib8
    do do'4 reb8 sib8 sib4 do8

    %52
    lab lab4 sib8 sol sol4 lab8
    fa4. lab8 sib,4. reb8
    do[fa, mi sib'] lab fa r4

    %55
    r8 mib'?16[fa sol fa sol mib]\mbreak lab8 [lab16 sib do sib do lab]
    mib4 re do8[mib16 fa sol fa sol mib]
    re2 r8 mib16[fa sol fa sol  mib]

    %58
    re2 r8 sol16[lab? sib? lab sib sol]
    lab2 r8 sol16[lab sib lab sib sol]
    lab8 fa4 lab8 sib, sib4 do8

    %61
    lab lab'4 do8 reb,8 reb4 mib8
    do[fa16 sol lab sol lab fa] do'4 sib
    lab2 sol8[mi16 fa sol fa sol mi]

    %64
    lab8 reb4 do sib lab8~
    lab sol4  fa8 mi fa fa mi
    fa\p[fa16 sol lab sol lab fa] do'4 sib]

    %67
    lab2 sol8[mi16 fa sol fa sol mi]
    lab8 reb4 do sib lab8~
    lab sol4 fa8 mi fa fa mi

    %70
    fa1\fermata

}

IvlIIn = \relative do'' {

    R1*2
    do4. mib8 fa,4. lab8
    sol do, si fa' mib [re16 do re8 mi]

    %5
    fa1
    sol8 lab sib sol fa2
    mib?4. sol8 lab sol fa do'

    %8
    si do re si sol mib' fa sol
    do,4 r r2\mbreak
    fa8 fa4 lab8 sib, sib4 do8

    %11
    la4 r r8 do16[re  mi re mi do]
    fa2 mi8 sol4 do,8\parentSlur (
    do) fa sol4 fa mib?

    %14
    re? do si8 do4 si8
    do4 r r2
    R1

    %17
    fa4. lab8 sib,4. reb8
    do fa, mi sib'\mbreak lab[sol16 fa la8 si]
    do reb do sib la4. la8

    %20
    sib do sib lab! sol4. sol8
    lab4. do8 sib2
    do4 r r2

    %23
    R1
    mib4. sol8 lab,4. do8
    sib mib, re lab' sol[fa16 mib fa8 sol]

    %26
    lab1~
    lab4 sib8 sol mib4. lab8
    sol[sol16 lab sib lab sib sol] mib8 [do16 re mib re mib do]

    %29
    sol'4 fa mib r
    r8 do'16[reb mib do sib lab] reb2~
    reb8[sib16 do reb sib lab sol] do2~

    %32
    do8[lab16 sib do lab sol fa] sib2~
    sib8[solb16 lab sib solb fa mib] do'8[la16 sib do la sol? fa]\mbreak
    sib8 reb mib4 reb do\mbreak

    %35
    sib lab solb fa8 sib
    do4 reb do2
    sib8[sib16 do reb do reb sib] solb8[mib16 fa solb fa solb mib]

    %38
    sib'8 solb fa la sib sib, r4
    fa''4. lab8 sib,4. reb8
    do fa, mi sib' lab[sol16 fa sol8 la]

    %41
    sib8[sib16 do reb do reb sib] solb8[mib16 fa solb fa solb mib]\mbreak
    reb'4 do sib2
    lab?8[fa16 sol lab sol lab fa] reb'8[sib16 do reb do reb sib]

    %44
    do4. mi8 fa4 mib?
    reb8 reb4 reb8 sol[mi16 fa sol fa sol mi]
    fa8 fa4 fa8~fa[reb16 mib? fa  mib fa reb]

    %47
    mib8 mib4 mib8~mib[do16 re? mib re mib do]
    re8 re4 re8~\mbreak re[si16 do re do re si]
    do4 r r2

    %50
    r8 sol'4 lab8 fa fa4 sol8
    mib4 r r2
    r8 do'4 reb8 sib sib4 do8

    %53
    lab4 r r2
    R1
    do,4. mib8\mbreak fa,4. lab8

    %56
    sol do, si fa' mib[do'16 re mib re mib do]
    si2 r8 do16[re mib re mib do]
    si2 r8 mi16[fa sol fa sol mi]

    %59
    fa2 r8 mi16[fa sol fa sol mi]
    fa4 r r2
    r8 fa4 lab8 sib, sib4 do8\mbreak

    %62
    lab4 r r8 do16[re mi re mi do]
    fa2 mi8 sol4 do,8~
    do fa sol4 fa mib?

    %65
    reb do8 reb sol, lab sol sol
    lab4 r r8 do16\p[re mi re mi do]
    fa2 mi8 sol4 do,8~

    %68
    do fa sol4 fa mib?
    reb do8 reb sol, lab sol sol
    fa1\fermopz

}

Ivlan = \relative do' {

    R1*4
    fa4. lab8 sib,4. reb8
    do fa, mi sib' lab[sib16 fa la8 si]

    %7
    do1
    re8 mib fa re do4 sib?
    lab? fa' fa fa\mbreak

    %10
    fa fa fa fa
    fa r r2
    r8 fa16[sol lab sol lab fa] do'4 sib

    %13
    lab8 lab sib do lab sib sol lab
    fa sol mib fa re mib sol sol
    mib[mib16 fa sol fa sol mib] do8[lab16 sib do sib do lab]

    %16
    mib'8 sol, fa si sol2
    do8[lab16 sib do sib do lab] fa'8[reb16 mib fa mib fa reb]
    sol4 r\mbreak r2

    %19
    mi4. mi8 do4. la'8
    fa4. re?8 sib4. sol'8
    mib4. mib8 fa4 mib

    %22
    mib r r2
    R1*3
    lab4. do8 reb,4. fa8

    %27
    mib lab, sol reb' do[sib16 lab do8 re?]
    mib[mib16 fa sol fa sol mib] do8[lab16 sib do sib do lab]
    mib' fa sol mib sib do re sib\mbreak sib'2

    %30
    mib, fa4. sib8
    sib4. mib,8 mib4. lab8
    lab4. reb,8 reb4. reb8

    %33
    mib4. mib8 fa4. fa8
    fa sib solb lab fa solb mib fa\mbreak
    reb mib do reb sib do lab mib'

    %36
    mib4 fa solb fa
    fa r r2
    R1

    %39
    lab8[lab16 sib do sib do lab] fa8[reb16 mib fa mib fa reb]
    lab'4 r r2
    sib4. reb8 mib,4. solb8\mbreak

    %42
    fa sib, la mib' reb[do16 sib re8 mi]
    fa1
    mi8 fa sol4 lab sib8 do

    %45
    fa, fa4 fa8 mi mi4 mi8
    do[lab'16 sib do sib do lab] reb,8 reb4 reb8
    sib[sol'16 lab sib lab sib sol] do,8 do4 do8

    %48
    lab[fa'16 sol lab sol lab fa]\mbreak si,8 si4 si8
    sol4 mib'8 fa re4 re
    sol, do'8 do si4 si

    %51
    sol lab sol mi
    do fa mi mi
    do r r8 sib16[do reb do reb sib]

    %54
    fa'4 r r8 lab16[sib do sib do lab]
    sol4 r \mbreak r8 fa16[sol lab sol lab fa]
    do4 r r2

    %57
    r8 si'16[do re do re si]  sol2
    r8 si16[do re do re si] sol4 mi
    r8 lab16[sib do sib do lab] do,2~

    %60
    do4 fa fa fa
    fa fa fa fa\mbreak
    fa r r2

    %63
    r8 fa16[sol lab sol lab fa] do'4 sib
    lab8 lab sib do lab sib sol lab
    fa sol lab lab do, do do do

    %66
    do4 r r2
    r8 fa16\p[sol lab sol lab fa] do'4 sib
    lab8 lab sib do lab sib sol lab

    %69
    fa sol lab lab do, do do do
    lab1\fermata

}

Ibcn = \relative do {

    R1*6
    do'4. mib8 fa,4. lab8
    sol do, si fa' mib[re16 do re8 mi]

    %9
    fa2~fa~
    fa~fa
    fa4 r r2

    %12
    r r8 do16[re mi re mi do]
    fa8 fa mib? lab reb, sol do, fa
    sib, mib lab, re? sol, do sol' sol,

    %15
    do [do16 re mib re mib do] lab'8 [fa16 sol lab sol lab fa]
    do'8 mib, re sol, do4 sib
    lab8[fa'16 sol lab sol lab fa] reb8 [sib16 do reb do reb sib]

    %18
    mi8 fa sol mi\mbreak fa2
    do fa
    sib, mib

    %21
    lab,8 sib do lab reb sib mib mib,
    lab'4. do8 reb,4. fa8
    mib lab, sol reb' do[sib16 lab do8 re?]

    %24
    mib[mib16 fa sol fa sol mib] lab8[lab,16 sib do sib do lab]
    mib' fa sol mib sib do re sib mib4 reb
    do8[lab16 sib do sib do lab] fa'8[reb16 mib fa mib fa reb]

    %27
    lab sib do lab mib' fa sol mib lab4 sol8 fa
    mib4 r r2
    r\mbreak mib'4. reb8

    %30
    do2 sib
    mib, lab
    reb, solb~

    %33
    solb la,
    sib8 sib' do fa, sib mib, lab reb,\mbreak
    solb do, fa sib, mib lab, reb solb,

    %36
    fa[fa'16 mib reb8 sib] mib do fa fa,
    sib4 r r2
    R1

    %39
    fa'8[fa16 sol lab sol lab fa] reb8[sib16 do reb do reb  sib]
    fa'8 [reb do re16 mi] fa4 mib?
    reb r r2\mbreak

    %42
    R1
    fa4. lab8 sib,4. reb8
    do fa, mi sib' lab[sol16 fa sol8 la]

    %45
    sib[sib'16 do reb do reb sib] do,8 do4 do8
    fa[fa16 sol lab sol lab fa] sib,8 sib4 sib8
    mib[mib16 fa sol fa sol mib] lab,8 lab4 lab8

    %48
    re?[re16 mib fa mib fa re]\mbreak sol,8 sol4 sol8
    do4 do8 fa sol4 si,
    do do8 fa sol4 sol,

    %51
    do fa do' do,
    fa fa sol do,
    fa8[fa16 sol lab sol lab fa] reb'4 r

    %54
    r2 r8 fa,16[sol lab sol lab fa]
    do'8[do,16 re mib re mib do]\mbreak fa4 r
    r8 mib16[fa sol fa sol si,] do4 r

    %57
    r8 sol'16[la si la si sol] do2
    r8 sol16[la si la si sol] do2
    r8 fa,16[sol lab sol lab fa] do'2

    %60
    fa,1~
    fa
    fa4 r r2

    %63
    r r8 do16[re mi re mi do]
    fa8 fa mib? lab reb, sol do, fa
    sib, mib lab, reb do fa do' do,

    %66
    fa4 r r2
    r r8\p do16[re mi re mi do]
    fa8 fa mib? lab reb, sol do, fa

    %69
    sib, mib lab, reb do fa do' do,
    fa1\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*7
    s4 s8 <6 4!> <6>2
    s <6- 4>
    <3 5> <6- 4>
    <5 3> s
    s s8 <_!> s4
    s8 s <7-> <7> <7> <7> <7> <7>
    <7> <7> <7> <7> <7 3!> s <5 4> <3!>
    s1
    s8 s <6!> <7> s4 <3>8 <6 4!>
    s1*2
    <_!>4 <7> <_!> <7>
    <7->2 <7->
    s <6 5>
    s1*3
    s2 s4 <6 3>8 <4>
    <6>1
    s1*3
    s2 <7 3->
    <7-> <7>
    <7> <7>
    <7> <7>
    <_->8 s <7> <7> <7> <7-> <7 3> <7>
    <7> <7> <7> <7> <7-> <7-> <7> s
    <_!>1
    s1*3
    s2 s4 <3>8 <6 4!>
    s1*3
    s4 s8 <6 4!> s2
    <_->2 <7 3!>
    s <7>
    s <7>
    s <7 3!>
    s <7 3!>
    s <7 3!>
    s <7 3!>
    s2 <6!>4 <7>
    s1*4
    s8 <_!> s4 s2
    s1
    s2 <_!>
    s <6- 4>
    <5 3> <6- 4>
    <5 3>1
    s2 s8 <_!> s4
    s4 <7->8 <7>  <7> <7> <7> <7>
    <7- 3-> <7-> <7>4 s <5 4>8 <3!>
    s1
    s2 s8 <_!> s4
    s <7->8 <7> <7> <7> <7> <7>
    <7- 3-> <7-> <7> s s4 <5 4>8 <3!>

}

forma = {

    \time 4/4
    \key do\minor
    \tempo 2 = 60
    s1*70
    \bar"|."

}


IvlI = {
    \global
    \notypeset
    <<\IvlIn \forma>>

}

IvlII = {
    \global
    <<\IvlIIn \forma>>

}

Ivla = {
    \global
    \clef alto
    <<\Ivlan \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIvlIn = \relative do'' {

    do4 lab'2 sol4~
    sol fa~fa mib
    fa sol sol2
    fa mib
    reb do
    fa sol
    do,4 lab' sol2
    lab sol\fermata

}

IIvlIIn = \relative do'' {

    lab4 fa'2 reb4
    mib do re! do
    re2 reb4 do~
    do sib2 lab4~
    lab solb2 fa8 mib
    reb4 reb'~reb do8 sib
    lab4 fa'2 mi4
    fa si, do2\fermata

}

IIvlan = \relative do' {

    do2 reb
    do si8 sol'4 sol8
    lab4 sib?~sib8 sol mib lab~
    lab fa reb sol~sol mib do fa~
    fa reb sib mib~mib4 reb8 do
    sib4 sib'~sib lab8 sol
    fa4 do2 do4~
    do re? mi2\fermata

}

IIbcn = \relative do {

    fa2 sib,
    lab sol4 do~
    do sib mib lab
    reb, sol do, fa
    sib, mib la,2
    sib mi
    fa do
    fa mi\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <7 3->4 <6>
    <7> <6> <7 3!> s
    <6 4 2> <3> <7-> <7>
    <7> <7> <7> <7>
    <7 3-> <_-> <7-> s
    <_->2 <7->
    s <5 4>4 <3!>
    <5 3> <6 4! 3> <6>

}

forma = {

    \time 4/4
    \key do\minor
    \tempo 4 = 45
    s1*8
    \bar"|."

}


IIvlI = {
    \global
    %\notypeset
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

}

IIvla = {
    \global
    \clef alto
    <<\IIvlan \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIIvlIn = \relative do'' {

    fa8 lab do,~
    do reb sib~
    sib do sol

    %4
    lab fa lab'
    sol16 lab sib8 fa
    mi re? do

    %7
    lab' fa, lab'
    sol sol, sol'
    fa reb, fa'
    mi do, mi'

    %11
    lab16 sib lab8. sib16
    lab8. sib16 lab8~
    lab16 sib lab sol fa mib

    %14
    reb mib reb8. mib16\mbreak
    reb8. mib16 reb8~
    reb16 do reb mib fa reb

    %17
    sol lab sol8. lab16
    sol8. lab16 sol8~
    sol16 lab sol fa mib reb

    %20
    do reb do8. reb16
    do8. reb16 do8~
    do16 sib do reb mib do

    %23
    fa lab lab fa fa re?
    re fa fa re re si
    si? re re si! si sol

    %26
    sol8 la16 si do re
    mib8(si ) do
    re(si) do\mbreak

    %29
    \once\stemUp sol, mib'' re
    mib16 re mib fa sol mib
    re do re mib fa re

    %32
    mib re mib fa sol mib
    re do re mib fa re\mbreak
    mib8 re mib

    %35
    \once\stemUp sol,, mib'' re
    do4.
    do8 mib sol,~

    %38
    sol lab fa~
    fa sol re
    mib do mib'

    %41
    re16 mib fa8 do
    si la sol
    mib' do, mib'

    %44
    re sib, re'
    do lab, do'
    si sol, re''

    %47
    mib16 re mib fa sol mib
    lab8 lab4\tr
    re,16 do re mib fa re

    %50
    sol8 sol4\tr
    do,16 sib do re mib do\mbreak
    re8 do sib

    %53
    mib16 fa mib8. fa16
    mib8. fa16 mib8~
    mib16 sol fa mib re do

    %56
    sib8 re mib
    fa, mib' re
    mib sol sib,~

    %59
    sib do lab~
    lab sib fa
    sol fa mib

    %62
    fa' lab do,~
    do reb sib~
    sib do sol

    %65
    lab fa lab'
    sol16 lab sib8 fa
    mi re? do

    %68
    lab'16 sib lab8. sib16
    lab8. sib16 lab8~
    lab16 sib lab sol fa mib\mbreak

    %71
    reb mib reb8. mib16
    reb8. mib16 reb8~
    reb16 do reb mib fa reb

    %74
    sol lab sol8. lab16
    sol8. lab16 sol8~
    sol16 lab sol fa mi re

    %77
    do re mi fa sol mi
    lab sol lab sib do lab
    sol fa sol lab sib sol

    %80
    lab sol lab sib do lab
    sol fa sol lab sib sol
    lab8(sol) lab

    %83
    do, lab' sol
    fa4.\fermata

}

IIIvlIIn = \relative do'' {

    fa8 lab do,~
    do reb sib~
    sib do sol

    %4
    lab fa lab'
    sol16 lab sib8 fa
    mi re? do

    %7
    lab' fa, lab'
    sol sol, sol'
    fa reb, fa'
    mi do, mi'

    %11
    lab16 sib lab8. sib16
    lab8. sib16 lab8~
    lab16 sib lab sol fa mib

    %14
    reb mib reb8. mib16\mbreak
    reb8. mib16 reb8~
    reb16 do reb mib fa reb

    %17
    sol lab sol8. lab16
    sol8. lab16 sol8~
    sol16 lab sol fa mib reb

    %20
    do reb do8. reb16
    do8. reb16 do8~
    do16 sib do reb mib do

    %23
    fa lab lab fa fa re?
    re fa fa re re si
    si? re re si! si sol

    %26
    sol8 la16 si do re
    mib8(si ) do
    re(si) do\mbreak

    %29
    \once\stemUp sol, do' si
    do16 si do re mib do
    si la si do re si

    %32
    do si do re mib do
    si la si do re si\mbreak
    do8 si do

    %35
    \once\stemUp sol, do' si
    do4.
    do8 mib sol,~

    %38
    sol lab fa~
    fa sol re
    mib do mib'

    %41
    re16 mib fa8 do
    si la sol
    mib' do, mib'

    %44
    re sib, re'
    do lab, do'
    si sol, re''

    %47
    mib16 re mib fa sol mib
    lab8 lab4\tr
    re,16 do re mib fa re

    %50
    sol8 sol4\tr
    do,16 sib do re mib do\mbreak
    re8 do sib

    %53
    mib16 fa mib8. fa16
    mib8. fa16 mib8~
    mib16 sol fa mib re do

    %56
    sib8 re mib
    fa, mib' re
    mib sol sib,~

    %59
    sib do lab~
    lab sib fa
    sol fa mib

    %62
    fa' lab do,~
    do reb sib~
    sib do sol

    %65
    lab fa lab'
    sol16 lab sib8 fa
    mi re? do

    %68
    lab'16 sib lab8. sib16
    lab8. sib16 lab8~
    lab16 sib lab sol fa mib\mbreak

    %71
    reb mib reb8. mib16
    reb8. mib16 reb8~
    reb16 do reb mib fa reb

    %74
    sol lab sol8. lab16
    sol8. lab16 sol8~
    sol16 lab sol fa mi re

    %77
    do re mi fa sol mi
    fa mi fa sol lab fa
    mi re mi fa sol mi

    %80
    fa mi fa sol lab fa
    mi re mi fa sol mi
    fa8(mi) fa

    %83
    do fa mi
    fa4.\fermata

}

IIIvlan = \relative do' {

    lab'4.
    sol
    mi

    %4
    do
    reb
    sol,

    %7
    lab'16 sol lab sib do reb
    sol, fa sol lab sib do
    fa, mib fa sol lab sib

    %10
    sol8(mi) do
    do'16 do do8. do16
    do8. do16 do8~

    %13
    do16 reb do sib lab sol
    fa fa fa8. fa16\mbreak
    fa8. fa16 fa8~

    %16
    fa mib reb
    sib'16 sib sib8. sib16
    sib8. sib16 sib8~

    %19
    sib16 do sib lab sol fa
    mib mib mib8. mib16
    mib8. mib16 mib8~

    %22
    mib reb do
    do4 r8
    re?4 r8

    %25
    fa4 r8
    re do si
    sol'4 r8

    %28
    sol4 r8\mbreak
    r sol sol
    sol4.~

    %31
    sol~
    sol~
    sol~\mbreak

    %34
    sol
    r8 sol sol
    mib4.

    %37
    mib
    re
    si

    %40
    sol
    lab'
    re,

    %43
    mib16 re mib fa sol lab
    re, do re mib fa sol
    do, si do re mib fa

    %46
    re4 sol8
    sol16 fa sol lab? sib? sol
    fa8 do' lab

    %49
    fa16 mib fa sol lab fa
    mib8 sib' sol
    mib re do\mbreak

    %52
    fa4 re8
    sib'16 sib sib8. sib16
    sib8. sib16 sib8~

    %55
    sib do4
    fa, sib8
    r sib sib

    %58
    sol4.
    fa
    re

    %61
    sib
    lab'
    sol

    %64
    mi
    do
    reb?

    %67
    sol,
    do'16 do do8. do16
    do8. do16 do8~

    %70
    do16 reb do sib lab sol\mbreak
    fa fa fa8. fa16
    fa8. fa16 fa8~

    %73
    fa mib reb
    sib'16 sib sib8. sib16
    sib8. sib16 sib8~

    %76
    sib16 do sib lab sol fa
    sol8 fa mi
    do'4.~

    %79
    do~
    do~
    do~

    %82
    do4 do8
    r do do
    lab4.\fermata

}

IIIbcn = \relative do {

    fa4.
    mi
    do

    %4
    fa
    sib,
    do

    %7
    fa16 mi fa sol lab sib
    mib,? re mib fa sol lab
    reb, do reb mib fa sol

    %10
    do, sib do re mi do
    fa mi fa sol lab sol
    fa mi fa sol lab sol

    %13
    fa4 r8
    sib,16 lab sib do reb do\mbreak
    sib lab sib do reb do

    %16
    sib4 r8
    mib16 re? mib fa sol fa
    mib re mib fa sol fa

    %19
    mib4 r8
    lab,16 sol lab sib do sib
    lab sol lab sib do sib

    %22
    lab4 r8
    lab'4 r8
    fa4 r8

    %25
    re4 r8
    si la sol
    do(sol') do,

    %28
    sol'(sol,) do\mbreak
    r sol' sol,
    do do' do,

    %31
    sol sol' sol,
    do do' do,
    sol sol' sol,\mbreak

    %34
    do sol' do,
    r sol' sol,
    do4.

    %37
    do
    si
    sol

    %40
    do
    fa
    sol

    %43
    do,16 si do re mib fa
    sib,? lab sib do re mib
    lab, sol lab sib do re

    %46
    sol, fa sol la si sol
    do4 r8
    fa16 mib fa sol lab fa

    %49
    sib8 sib4
    mib,16 re mib fa sol mib
    lab8 lab4\mbreak

    %52
    sib sib,8
    mib16 re mib fa sol fa
    mib re mib fa sol fa

    %55
    mib8 lab4
    sib8 lab sol
    r sib sib,

    %58
    mib4.
    re
    sib

    %61
    mib8 fa sol
    fa4.
    mi

    %64
    do
    fa
    sib,

    %67
    do
    fa16 mi fa sol lab sol
    fa mi fa sol lab sol

    %70
    fa4 r8\mbreak
    sib,16 lab sib do reb do
    sib lab sib do reb do

    %73
    sib4 r8
    mib16 re? mib fa sol fa
    mib re mib fa sol fa

    %76
    mi4 r8
    mi? re do
    fa, fa' fa,

    %79
    do' do' do,
    fa, fa' fa,
    do' do' do,

    %82
    fa, do' fa,
    r do'' do,
    fa4.\fermopz

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <6 5>
    <7>
    s
    s
    <_!>
    s4.*7
    <_->4.
    s4.*9
    <6>4.
    <6!>
    s4.*3
    s8 <6 4> <5 3>
    s4.*4
    s8 <_!> s
    s <6 4> <5 3!>
    s4.*2
    <6 5>4.
    <7>
    s
    s
    <_!>
    s4.*3
    <_!>4.
    s4.*10
    s8 <5 4> <3>
    s4.
    <6 5>
    <7>
    s
    s
    <6 5>
    <7>
    s
    s
    <_!>
    s4.*3
    <_->4.
    s4.*6
    <_!>4.
    s4.*4
    s8 <6 5> <5 3!>



}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key do\minor
    \tempo 4. = 70
    s4.*36
    \bar":..:"\break
    s4.*48
    \bar":|."

}


IIIvlI = {
    \global
    %\notypeset
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \global
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

  \markup \huge {[1.] All[egr]o}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
          \IvlI
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
          \IvlII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
          \Ivla
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
          \Ibc

        >>
      >>

    \layout {

      indent = 1.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        %\override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge {[2.] Ad[agi]o}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \IIvlI
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \IIvlII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"viola"
          \IIvla
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \IIbc

        >>
      >>

    \layout {

      indent = 1\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        %\override SpacingSpanner.uniform-stretching = ##t
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

    % \pageBreak

  \markup \huge {[3.] [Allegro]}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlI
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \IIIbc

        >>
      >>

    \layout {

      indent = 1\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        %\override SpacingSpanner.uniform-stretching = ##t
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
