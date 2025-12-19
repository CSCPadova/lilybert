\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

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
      \musicglyph "scripts.prall"}}

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    sol,4. la8 sib4. do8
    re4 sol2 fad4
    sol sib2 la8 sol

    %4
    fad4 re'2 dod4
    re2 r\fermata\mbreak
    sib,4. do8 re4. mib8

    %7
    fa4 sib2 la4
    sib re2 do8 sib
    la4 mib'2 re8 do

    %10
    sib do re2 do4~
    do si mib2\mbreak
    re dod4 re8 do

    %13
    si4 do2 sib4
    la2\tr sol4 r
    re'\upl r do\upl r

    %16
    sib r la re~
    re8 dod dod dod re2

}

IvlIIn = \relative do'' {

    r2 sol,4. la8
    sib4 re do mib
    re2 mib4 mi

    %4
    la, fad' sol2
    fad r\fermata
    r2 sib,4. do8

    %7
    re4 fa mib2
    fa sol
    do,4 r r la'

    %10
    re, r8 la' sol2
    fa4 re'2 do4~
    do sib la lab

    %13
    sol2 fad4 sol~
    sol fad\tr sol r
    sib\upl r la\upl r

    %16
    sol r fad2
    sol fad

}

Ivlan = \relative do' {

    sib4. la8 sol2~
    sol4 sib la do
    sib sol2 la4

    %4
    la2 sol4 mib'
    la,2 r\fermata
    re4. do8 sib2~

    %7
    sib4 re do mib
    re sib sol do
    do r r re~

    %10
    re re sol, do
    re4. fa8 sol2~
    sol mi4 fa

    %13
    re do re2\parenthesize (
    re) re4 r
    r re r re

    %16
    r re r re
    sol, mib' la,2

}

Ibcn = \relative do {

    sol1~
    sol2 la
    sib do4 dod

    %4
    re2 mib
    re r\fermata\mbreak
    sib1~

    %7
    sib2 do
    re mib4 mi
    fa r fad2

    %10
    sol4 fa! mib2
    re do\mbreak
    sol'2. fa4~

    %13
    fa mib re2~
    re sol,4 r
    r re' r re

    %16
    r re r re
    mib2 re

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <7>4 <6\\>
    <6>2 <7>4 <6>8 <5 _!>
    <_+>2 <7>4 <6>
    <_+>1
    s
    s2 <7>4 <6>
    <6>2 <7>4 <6>8 <5>
    s2 <7>4 <6>8 <5>
    s4 <6> <7> <6>
    <7> <6!> <9> <8>
    <5 4> <3> <4\+ 2> <6 _->8 <5>
    <4\+ 2>4 <6> <7 _+> <6 4>
    <5 4> <_+> s2
    s4 <6 4> s <7 _+>
    s <6 4> s <5 _+>
    <7> <6\\> <_+>2

}

forma = {

    \time 2/2
    \key sol\minor
    \tempo 2 = 50
    s1*17
    \bar"||"

}



IvlI = {
    \global
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

}



global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    R1*9
    re4. mi8 fa sol la sib
    dod,8 la'4 do,8 si sol'4 sib,8

    %12
    la re4 dod8 re re mi fad\mbreak
    sol re sol2 fad4
    sol r8 la sol16 fa? mi fa sol [fa sol mi]

    %15
    fa8 re la'2 sol4~
    sol fa4. sol16 fa mi8 [re]\mbreak
    dod sib' la sol fa4 mi

    %18
    re r r2
    R1*2
    r8 mib re do si sol la si

    %22
    do4. sib?8 la fa sol la
    sib4. la8 sol la16 sib do8[sol]
    la sib16 la sib8[la16 sol] la8 fa' do re\mbreak

    %25
    la sib fa4 r8 fa' do re
    la sib fa sol la sib do re
    mib2~mib8 re16 do re8[mib]

    %28
    fa la, sib mib re4 do\mbreak
    sib8 re16 mib fa4. fa8 mib re
    mib fa16 mib re8[do] si sol'4 sib,8

    %31
    la fa'4 lab,8 sol do4 si8
    do mib re do sib4 r\mbreak
    r2 r8 la' la[sib16 la]

    %34
    sol8[sol] sol la16 sol fad8 sol do,4
    sib r re4. mi8
    fa sol la sib dod,8 la'4 do,8\mbreak

    %37
    si sol'4 sib,8 la re4 dod8
    re re mi fad sol re re do
    sib la sib do la4 sol~

    %40
    sol fa~fa8 re' do4\mbreak
    sib8 sol'4 fa8 mi do re mi
    fa4. mib!8 re sib do re

    %43
    mib4. re8 do la sib do
    re4 r8 do sib do re4~\mbreak
    re8 mib16 re do8[sib] la re la sib

    %46
    fad sol re4 r8 re' la sib
    fad sol re mi fad sol la sib
    do2~do8 sib16 la sib8[do]\mbreak

    %49
    re fad, sol do sib4 la
    sol re' mib4. mi8
    fad sol4 fad8 sol sol, re'4~

    %52
    re do2 sib4\mbreak
    la2 sol4 r
    sib r sib r

    %55
    la re2 dod4
    re sib la2\mbreak
    sol1\fermata

}

IIvlIIn = \relative do'' {

    R1*6
    sol4. la8 sib do re mib
    fad,8 re'4 fa,8 mi do'4 mib,8\mbreak

    %9
    re sol4 fad8 sol re' re dod
    re la la la re mi fa sol
    mi4 re2 do4~

    %12
    do8 la sol4 fa r8 la\mbreak
    sib4 r8 re do16[sib la sib] do sib do la
    sib8 sol re'2 dod4

    %15
    re r8 mi re16[dod re mi] re fa mi re
    dod4 re sib2
    la8 dod re re re4 dod

    %18
    re r r2
    R1
    sol,4. la8 sib do re mib\mbreak

    %21
    fad,4 r sol'4. fa?8
    mi do re mi fa4. mib8
    re sib do re mib2~

    %24
    mib8 re16 do re8[do16 sib] do4 r8 fa\mbreak
    do re la sib fa4 r8 fa'
    do re la sib fa sol la sib

    %27
    do2~do8 sib16 la sib8[do]
    re4 r8 do sib4 la\mbreak
    sib r8 re si sol la si

    %30
    do4 r8 lab sol4 r8 sol
    fa4 r8 fa mib sol fa4
    mib8 do' sib la sol sib16 la sib8[do]\mbreak

    %33
    re sol, fad sol la4 r8 re
    sol,4 r8 do do sib la4
    sib8 la sib dod re4 r

    %36
    re8 mi fa sol mi4 re~\mbreak
    re do~do8 la sol4
    fa r sol4. la8

    %39
    sib do re mib fad, re'4 fa,8
    mi do'4 mib,8 re sol4 fad8\mbreak
    sol4 r do4. sib8

    %42
    la8 fa sol la sib4. la8
    sol mib fa sol la4. sol8
    fad re mi fad sol la sib4~\mbreak

    %45
    sib8[do16 sib] la8 sol fad4 r8 re'
    la sib fad sol re4 r8 re'
    la sib fad sol re mi fad sol

    %48
    la2~la8[sol16 fad] sol8 la\mbreak
    sib4 r8 la sol4 fad
    sol r8 re'~re4 do~

    %51
    do8 sib la4 sol r8 sol
    mib'4 r8 do fad4 sol~\mbreak
    sol fad sol r

    %54
    sol, r sol r
    fad2 sol
    fad4 sol2 fad4\mbreak

    %57
    sol1\fermata

}

IIvlan = \relative do' {

    R1*3
    re4. mi8 fa sol la sib\mbreak
    dod, la'4 do,8 si sol'4 sib,8

    %6
    la re4 dod8 re re mi fad
    sol re re do sib la sib do
    la4 sol2 fa4~

    %9
    fa8 re' do4 sib8 sib' la sol
    fa sol la la, la4 r8 mi'
    la,4 la' sol2

    %12 OOKK
    do,8 re mi4 la, r8 re\mbreak
    re4 r8 re mib4 re
    re r8 la' sib4 la

    %15
    la r8 la re, re sol sib
    mi, la,4 re8 re4 mi~\mbreak
    mi fa8 sib la4 la

    %18
    la r r2
    r8 sib la sol fad re mi fad
    sol re re re re4 r8 la\mbreak

    %21
    la4 r r8 re re sol
    r sol sol do, r do do fa
    r fa fa sib, r sib sib mib

    %24
    do4 sib fa2~\mbreak
    fa1~
    fa

    %27
    r8 sol' mib do la4 r8 la'
    sib4 r8 sol fa4 fa\mbreak
    fa r8 do re4 r8 sol

    %30
    sol4 mib re do~
    do sib~sib8 sol re'4
    sol,4 r r2\mbreak

    %33
    r r8 re' re4
    r8 do do sol' la sol mib re
    re4 r8 sol fa sol la la,

    %36
    la4 r8 mi' la,4 la'\mbreak
    sol2 do,8 re mi4
    la, r8 re re4 r8 fad

    %39
    sol4 r8 la re,2
    do sib8 sol la4\mbreak
    re,4 r r8 sol' sol do,

    %42
    r do do fa, r fa' fa sib,
    r sib sib mib, r mib' mib la,
    r la la re, r sol sol sol\mbreak

    %45
    sol4 r8 mi' re2~
    re1~
    re

    %48
    r8 mib do la fad4 r8 fad'\mbreak
    sol4 r8 mib re4 re
    sib8 do re sol sol4 r8 do,

    %51
    re re re re re4 sol
    sol4. la8 la re, re4\mbreak
    re re sib'8-.(sib-. sib-. sib-.)

    %54
    sol-.(sol-. sol-. sol-.) mi-.(mi-. mi-. mi-.)
    re2 sol,
    la4 sib re2~

    %57
    re1\fermata

}


IIbcn = \relative do {

    sol'4. la8 sib do re mib
    fad, re'4 fa,8 mi do'4 mib,8
    re sol4 fad8 sol sib la sol

    %4
    fa! sol fa mi? re mi fa sol\mbreak
    la4 fad sol mi
    fa mi re4. do8

    %7
    sib sib' sib la sol4 r8 do,
    re4 si do la\mbreak
    sib la sol8 sol' fa mi

    %10
    re mi fa dod re4 r8 sol
    la4 fad sol mi
    fa? mi re r8 do\mbreak

    %13 OOKK
    sib4 r8 sib' la4 re,
    sol r8 fa mi4 la,
    re r8 do sib la sib sol

    %16
    la4 re sol,4. sol'8\mbreak
    la sol fa sol la sol la la,
    re4. mi8 fa sol la sib

    %19
    dod,4 r8 la re4 r8 do
    sib la sib fad sol4 r8 la\mbreak
    re4 r sol2

    %22
    do, fa
    sib, mib4 r8 do
    fa1~\mbreak

    %25
    fa~
    fa
    r8 mib' do la fa4 r8 mib

    %28
    re do re mib fa mib fa fa,\mbreak
    sib4 r8 lab sol4 r8 sol'
    do,4 fa sol mi

    %31
    fa re mib! re
    do r sol'4. la8\mbreak
    sib do re mib fad,8 re'4 fa,8

    %34
    mi do'4 mib,8 re sol4 fad8
    sol fad sol mi re mi fa dod
    re4 r8 sol la4 fad\mbreak

    %37
    sol mi fa mi
    re r8 do sib sib' sib la
    sol4 r8 do, re4 si

    %40
    do la sib! la\mbreak
    sol8 la si sol do2
    fa sib,

    %43
    mib la,
    re sol,\mbreak
    do4 r8 dod re2~

    %46
    re1~
    re
    r8 do' la fad re4 r8 do\mbreak

    %49
    sib la sib do re do re re,
    sol la sib sol do4. la8
    re sol, re' re, sol2

    %52
    do4. la8 re4 sol,\mbreak
    re' re, sol'8-.(sol-. sol-. sol-.)
    mib-.(mib-. mib-. mib-.) dod-.(dod-. dod-. dod-.)

    %55
    re2 mib
    re1\mbreak
    sol,\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4  s8 <6\\> <6> <6> <6> <6>
    <6> <6! _+>4 <4! 2>8 <6> <6 4>4 <4 2>8
    <6> <4 2>4 <6>8 s <6> <6> <6!>
    <6>4 s8 <6\\> s4 <6>
    <_+> <6 5> <_!> <6 5->
    <5>8 <6> <7> <6\\> s4. <4\+ 2>8
    <6>4 s8 <6\\> s2
    <_+>4 <6 5> <_!> <6 5->
    <5>8 <6> <7> <6\\> s4 <6>8 <6\\>
    s4 <6>8 <6> s4 s8 <6!>
    <_+>4 <6 5!> <_!> <6 5->
    <5>8 <6> <7> <6\\> s4 s8 <4\+ 2>
    <6>4 s8 <6> <7>4 <7 _+>
    s s8 <6> <7>4 <7 _+>
    s s8 <6> <7>4 <6>
    <7 _+> s <7>4 <6!>8 <6! 5>
    <_+> <6! 4\+ _-> <6>4 <6 4> <5 _+>
    s4 s8 <6\\> <6> <6> <6> <6>
    <6>4 s8 <7 _+> <_+>4 s8 <4\+ 2>
    <6> s <6> <6> s4 s8 <6>
    <_+>4 s <_!> s
    <_!>1
    s2 s4 s8 <7>
    <7 _!>4 <6 4> <5 3> s
    s1
    s
    s8 <6> s4 <7> s8 <4 2>
    <6> <6> <6> <6> <6 4>4 <5 3>
    s4 s8 <6 5> <_!>4 s8 <_!>
    <_->4 <6>8 <5 _-> <_!>4 <6 5->
    s <6 5-> <5>8 <6> <7> <6!>
    s1
    <6>4 <_+> <6>2
    <6> <7 _+>8 <3> <4 2> <6>
    s4 s8 <6\\> s s <6> <6>
    s4 s8 <6!> <_+>4 <6 5!>
    <_!> <6 5-> <6> <7>8 <6\\>
    s4 s8 <4\+ 2> <6> s s <6\\>
    s4 s8 <6> <_+>4 <6 5!>
    <_!> <6 5-> <5>8 <6> <7> <6\\>
    s4 <6> <_!>2
    s1
    s
    <_+>
    s4 s8 <7-> <_+>2
    s1
    s
    s8 <6> s4 <7 _+> s8 <4\+ 2>
    <6>8 <6\\> <6> <6> <6 4>4 <5 _+>
    s <6> <9>4 <8>8 <5!>
    <_+>4 <5 4>8 <_+> s2
    <9>4 <8> <7 _+> s
    <5 4> <_+> s2
    s <7 _!>
    <_+>2 <7>4 <6\\>
    <_+>4 <6 4> <5 4> <_+>

}

forma = {

    \time 2/2
    \key sol\minor
    \tempo 2 = 40
    s1*57
    \bar"|."

}



IIvlI = {
    \global
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

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    la8 do4 fa la8
    sol sol16 fa mi8 re mi do
    sib sol'4 mi sib8

    %4
    la do16 sib la8 fa la do
    fa la4 do sib16 la
    sol8 do,4 mi sol8\mbreak

    %7
    fa8 la16 sol fa8 mi re do
    si re4 fa mi16 re
    mi do (si do) mi do (si do) \appoggiatura {fa16[sol]} la4

    %10
    sol16 do,(si do) mi do(si do) \appoggiatura {re16[mi]} fa4
    mi16\p do (si do) mi do (si do) \appoggiatura {fa16[sol]} la4\mbreak
    sol16 do,\parenthesize (si do) mi do\parenthesize (si do) \appoggiatura {re16[mi]} fa4

    %13
    mi8 mi,\f fa' fa, sol' sol,
    la' la, sol' sol, fa' fa,
    mi'8 mi,\p fa' fa, sol' sol,

    %16
    la' la, sol' sol, fa' fa,
    mi'\f mi16 fa sol8 mi fa re\mbreak
    mi do re4 si

    %19
    do2. do
    mi8 sol4 do mi,8
    re re16 do si8 la sol sol'

    %22
    fa fa4 fa mi16 re
    mi8 do4 mi sol8\mbreak
    r8 sib(la sol fa mi)

    %25
    fa re4 re sib'8
    la re,4 re re8
    dod16 re mi fa sol8 sib,(la sol)

    %28
    fa fa'(mi fa sol fa)
    r mi(re mi fa mi)\mbreak
    r re dod re mi re

    %31
    dod la' sol fa mi re
    dod re4 mi fa8
    dod re4 mi fad8

    %34
    sol16 la sib la sol fa! mi re dod sib la sol\mbreak
    fa8 re'4 re re8~
    re16 mi fa sol la8 re, mi dod

    %37
    re fa16 sol la8 re, mi dod
    re2.
    la8 do4 fa la8

    %40
    sol sol16 fa mi8 re mi do
    sib sol'4 mi sib8
    la fa la do fa do

    %43
    re sib4 sib'16 la sol8[fa]
    mi do4 mi sol8~
    sol mi4 sol sib8~

    %46
    sib do,16 re mi fa sol la sib8 sol\mbreak
    la la16 sib do8 la sib sol
    la fa sol4 mi

    %49
    fa8 fa4~ fa fa8~
    fa fa4~fa fa8
    fa la,16 sib do8 la sib sol

    %52
    la fa' sol4 mi
    fa2. fa

}

IIIvlIIn = \relative do'' {

    do8 la fa la do fa
    mi mi16 re do4 sol
    fa sol sol'8 mi

    %4
    fa la,16 sol fa8[la] do fa
    la, fa'4 la sol16 fa
    mi8 sol do, sol do mi\mbreak

    %7
    re8 fa16 mi re8 do si la
    sol si4 re do16 si
    do8 do do do \appoggiatura {re16[mi]} fa4

    %10
    mi8 do do do do[(si)]
    do8\p do do do \appoggiatura {re16[mi]} fa4
    mi8 do do do do[(si)]

    %13
    do do,\f re' re, mi' mi,
    fa' fa, mi' mi, re' re,
    do' do,\p re' re, mi' mi,

    %16
    fa' fa, mi' mi, re' re,
    do'\f do16 re mi8 do re si\mbreak
    do mi, fa4 re

    %19
    do2. do
    do'8 sol do mi sol do,
    si fa'16 mi re8 do si sol

    %22
    r8 re' si[sol] re' do16 si
    do8 sol mi' do sol' mi\mbreak
    dod sol'(fa mi re dod)

    %25
    re4 re re
    re8 la fa re fa la
    sol mi mi' sol,(fa mi)

    %28
    re la'(sol la sib! la)
    r8 sol (fa sol la sol)\mbreak
    r fa mi fa sol fa

    %31
    mi4 r r
    la8 si4 dod4 re8
    la si4 dod re8

    %34
    mi16 fa sol fa mi re dod sib la sol fa mi\mbreak
    re8 sib' la sib la sol
    fa4. la8 sol fa

    %37
    fa4. fa8 sol mi
    re2.
    do'8 la fa la do fa

    %40
    mi mi16 re do4 sol\mbreak
    fa4 sol sol'8 mi
    fa la,4 la la8

    %43
    sib fa sib re16 do sib8 la
    sol mi4 sol mi'8~
    mi do4 mi sol8~

    %46
    sol4 do,16 re mi fa sol8 mi\mbreak
    fa fa16 sol la8 fa sol mi
    fa do sib4 sol

    %49
    la8 re do re do sib
    la8 re do re do sib
    la fa'16 sol la8 fa sol mi

    %52
    fa la, sib4 sol
    fa2. fa

}

IIIvlan = \relative do' {

    do4 do do
    do do do
    fa mi do

    %4
    do do do
    do do do
    do do do\mbreak

    %7
    si si si
    re sol, sol'
    sol sol do,

    %10
    do do la'8 sol
    sol4 sol do,\mbreak
    do do la'8 sol

    %13
    sol4 r r
    R2.
    sol4 r r

    %16
    R2.
    sol4. sol8 la sol\mbreak
    sol8 do, la4 sol

    %19
    sol2. sol
    sol'4 sol sol
    sol sol sol

    %22
    si, re sol
    sol sol sol\mbreak
    mi la la

    %25
    la fa sol
    la la, re
    mi mi la,

    %28
    la re sib!
    sib sib la\mbreak
    la la sol

    %31
    la r r
    la la la
    la la la

    %34
    la la la\mbreak
    re8 sol fa sol fa mi
    re sol fa sol fa mi

    %37
    re4. la8 sib la
    la fa' mi re do sib
    la4 do do

    %40
    do do do\mbreak
    fa mi do
    do do fa

    %43
    fa fa re
    do do do
    do do do

    %46
    do do do\mbreak
    do do do
    do8 do re4 do

    %49
    do8 sib' la sib la sol
    fa sib la sib la sol
    fa4 do do

    %52
    do8 re do4 do
    do2. do

}

IIIcrIn = %\transpose do fa,
\relative do'' {
    \key do\major%\clef violin

    mi,8 sol4 do mi8
    re4 re re
    fa fa fa

    %4
    mi mi mi
    do8 mi4 sol fa16 mi
    re4 re re\mbreak

    %7
    mi mi mi
    fad fad fad
    sol r mi

    %10
    re r fad
    sol r mi\mbreak
    re r fad

    %13
    sol r r
    R2.
    re4 r r

    %16
    R2.
    re4. re8 mi fad\mbreak
    sol4 sol fad

    %19
    sol2. sol
    sol4 sol sol
    fad r r

    %22
    fad fad fad
    sol r r\mbreak
    R2.*7

    %31
    mi,4 mi mi
    mi r r
    mi r r

    %34
    mi r r\mbreak
    mi' r r
    mi r r

    %37
    mi r8 mi fa mi
    mi4 r r
    mi,8 sol4 do mi8

    %40
    re4 re re
    fa fa fa
    mi mi mi

    %43
    fa fa mi
    re re re
    re re re

    %46
    re r r\mbreak
    mi8 mi16 fa sol8 mi fa re
    mi sol fa4 re

    %49
    mi r r
    mi r r
    mi8 mi16 fa sol8 mi fa re

    %52
    mi do re2\tr
    do2. do

}

IIIcrIIn = %\transpose do fa,
\relative do'' {
    \key do\major%\clef violin

    do,4 mi mi
    sol sol sol
    re' re re

    %4
    do do do
    mi,8 do'4 mi re16 do
    sol4 sol sol

    %7
    do do do\mbreak
    re re re
    sol, r do

    %10
    sol r do
    sol r do
    sol r do

    %13
    sol4 r r
    R2.
    sol4 r r

    %16
    R2.\mbreak
    sol4. re'8 do re
    re4 do re

    %19
    sol,2. sol
    re'4 re re
    re r r

    %22
    do do do
    re r r
    R2.*7\mbreak

    %31
    mi,4 mi mi
    mi r r
    mi r r

    %34
    mi r r
    do' r r
    do r r

    %37
    do r8 do re do
    do4 r r\mbreak
    do, mi mi

    %40
    sol sol sol
    do re sol,
    do8 do, mi sol do4

    %43
    do do do
    sol sol sol
    sol sol sol

    %46
    sol r r \mbreak
    do8 do16 re mi8 do re sol,
    do mi re4 sol,

    %49
    do r r
    do r r
    do8 do16 re mi8 do re sol,

    %52
    do4 sol sol
    mi2. mi

}


IIIbcn = \relative do {

    fa4\p fa fa
    do do do
    re mi do

    %4
    fa fa fa
    fa fa fa
    do do do\mbreak

    %7
    re re re
    sol, sol sol
    do do do

    %10
    do do re8 sol,
    do4 do do\mbreak
    do do re8 sol,

    %13
    do2 r4
    R2.
    do2 r4

    %16
    R2.
    do4. mi8 fa sol\mbreak
    do,8 la fa4 sol

    %19
    do do'8(sib la sol) do,2.
    do4 do do
    sol sol sol

    %22
    sol sol sol
    do do sib\mbreak
    la la la

    %25
    re re sol
    fa fa fa
    mi dod dod

    %28
    re re sol
    do,! do fa\mbreak
    sib, sib mi

    %31
    la, r r
    la la la
    la la la

    %34
    la la la\mbreak
    re8 sol fa sol fa mi
    re sol fa sol fa mi

    %37
    re4. fa8 sol la
    re, re' do sib la sol
    fa4 fa fa

    %40
    do do do\mbreak
    re mi do
    fa fa fa

    %43
    sib, sib sib
    do do do
    do do do

    %46
    do do do\mbreak
    fa fa do
    fa8 la sib4 do

    %49
    fa,8 sib la sib la sol
    fa sib la sib la sol
    fa4 fa do

    %52
    fa8 re sib4 do
    fa,4. fa'8 mi re fa,2.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*2
    <6>4 <6 5> s
    s2.*3
    <6!>2.
    <7 _!>
    s4 s <6 4>
    s s <7>8 <7>
    s4 s <6 4>
    s s <7>8 <7>
    s2.*4
    s2 <6>8 <_!>
    s4 <6> <_!>
    s2.*5
    s4 s <4 2>
    <_+>2.
    s
    <6>
    <6\\>4 <7 5> s
    s2.
    <7>
    <7>
    <3+>
    <_+>
    s
    <7>
    s2.*6
    <6>4 <6 5> s
    s2.*4
    <7>2.
    s
    s4 <6> s
    s2.*3
    s4 <6> s

}

forma = {

    \time 3/4
    \tempo 2 = 60
    \repeat volta 2 {s2.*18}
    \alternative {{s2.}{s}}\break
    \set Score.currentBarNumber = #20
    \repeat volta 2 {s2.*33}
    \alternative {{s2.}{s}}
    \bar "||"

}



IIIvlI = {
    \global
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

IIIcrI = {
    \global
    <<\IIIcrIn \forma>>

}

IIIcrII = {
    \global
    <<\IIIcrIIn \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}




%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \con
}

IVvlIn = \relative do'' {

    fa,8 do'8.\tr sib32 la sib8[sol] fa fa4 do'8
    \terzine\tuplet 3/2 { re16(do sib) } mi8(fa) [re16 sib] \tuplet 3/2 { do16 (sib la) } mi'8(fa)[do16 la]
    \tupletSpan 4 \tuplet 6/4 { sib(sol la sib mi fa) sol[(fa mi re do sib)] } la8 fa r \appoggiatura {fa'16[sol]} la8\mbreak

    %4
    sol16 si, si8(do)[\appoggiatura {re16[mi]} fa8] mi16 sold, sold8 (la)[\appoggiatura {si16[do]} re8]
    do16 mi, mi8 (fa)[\appoggiatura {sol16[la]} sib8] la[do] fa32(sol la8.)
    \appoggiatura {re,16[mi]} fa8.[mi16] re(do) si(la)\mbreak sol re' (do si) r mi(re do)

    %7
    r fa(mi re) r la'(sol fa) \tuplet 6/4 { mi(fa sol la fa) la, } si4\tr
    do8 fa,4 re' mi, do'8~\mbreak
    \tuplet 6/4 { do16 (la sol fa mi re) } re8.[do16] do4. fa8  do4. do'8

    %10
    sol'8.\tr sol32 mi fa8[re] do do4 sol8
    \terzine \tuplet 3/2 { la16(sol fa) } si8 (do)[la16 fa] \tuplet 3/2 { sol(fa mi) } si'8(do) [sol16 mi]
    \tupletSpan 4 \tuplet 6/4 { fa (re mi fa si do) re[(do si la sol fa)] } mi8 do sol''4~

    %13
    \tuplet 6/4 { sol16 (fa  mi re dod si) } la8[sol] fa re fa'4~\mbreak
    \tuplet 6/4 { fa16 (mi re do si? la)} sol8[fa] fa mi r la
    la16(sold) si(la) do[(si) re(dod)] \grace dod8 re4. si8

    %16
    \terzine \tuplet 3/2 { do16 si? la } mi'16. la,32 si!4\tr la r8 fa\mbreak
    do'8.\tr do32 la sib?8[sol] fa fa4 do'8
    \tuplet 3/2 { re16 do sib} mi8(fa)[re16 sib] \tuplet 3/2 { do16(sib la)} mi'8(fa)[do16 la]

    %19
    \sestinequarto \tuplet 6/4 { sib16(sol la sib mi fa) sol[(fa mi re do sib)] } la8 fa mib'4\mbreak
    \tuplet 6/4 { r16 do(sib la sol fa) } mib'8[mib]\tuplet 6/4 { re16(sib la sib re mi) } fa8[fa]
    fa16(mi) sol(fa) la[(sol) sib(la)] \grace la8 sib4.  sol8

    %22
    \tupletSpan 4 \tuplet 6/4 { la16(sol fa sol fa mi) } fa4~\mbreak fa16[sol32 la sib16 sol] sol4\tr
    fa8 sib,4 sol' la, fa'8
    \tupletSpan 4 \tuplet 6/4 { fa16 (re do sib la sol) } sol8.\tr[fa16] fa4. do'8 fa,2

}

IVvlIIn = \relative do'' {

    fa,8
    la8.\tr la32 fa sol8[mi] fa fa4 la8
    sib mi (fa) sib, la mi' (fa) la,
    \tupletSpan 4 \tuplet 6/4 {sol16(mi fa sol) sol (la) sib[(la sol sib la sol)]} fa4 r8 \appoggiatura {fa'16[sol]} la8\mbreak

    %4
    sol16 si, si8(do)[\appoggiatura {re16[mi]} fa8] mi16 sold, sold8  (la)[\appoggiatura {si16[do]} re8]
    do16 mi, mi8 (fa)[\appoggiatura {sol16[la]} sib8] la8[la] la32(sib do8.)
    \appoggiatura {fa16[sol]} la8. sol16 fa[(mi) re(do)]\mbreak si si (la sol) r sol(fa mi)

    %7
    r re'(do si) r fa'(mi re) \tuplet 6/4 { do(re mi fa re) la } si4\tr
    do8 fa,4 re' mi, do'8~
    \tuplet 6/4 { do16 (la sol fa mi re) } re8.[do16] do4. fa8  do4. do'8

    %10
    sol'8.\tr sol32 mi fa8[re] do do4 sol8
    \terzine \tuplet 3/2 { la16(sol fa) } si8 (do)[la16 fa] \tuplet 3/2 { sol(fa mi) } si'8(do) [mi,16 do]
    \tupletSpan 4 \tuplet 6/4 { re (si do re) re (mi) fa\parenthesize ([mi re fa mi re])} do4 r8 re'

    %13
    dod4 r8 dod, re4 r8 re'\mbreak
    re4 r8 re, re do r do
    do16[(si) re(do)] la'(sold) si(la) si4 r8 sold

    %16
    la la la sold la4 r8 fa\mbreak
    la8.\tr la32 fa sol8[mi] fa fa4 la8
    sib? mi (fa)[sib,16 sol] la8 mi' (fa)[la,16 fa]

    %19
    \tuplet 6/4 { sol(mi fa sol) sol (la) sib[(la sol sib la sol)] } fa4 r8 mib'\mbreak
    do8 la r do sib4 r8 re
    re16(do) mi(re) fa[(mi) sol(fa)] sol4. mi8

    %22
    fa4 r8 fa~\mbreak fa16[sol32 la sib16 sol] sol4\tr
    fa8 sib,4 sol' la, fa'8
    \tupletSpan 4 \tuplet 6/4 { fa16 (re do sib la sol) } sol8.\tr[fa16] fa4. do'8 fa,2

}

IVvlan = \relative do' {

    r8
    fa fa mi do do4 r8 fa
    fa4 r8 fa fa4 r8 fa
    mi do do do do la do do\mbreak

    %4
    do4 r8 si'? si(la) r sol
    sol(fa) r mi fa fa fa fa
    fa fa fa fa\mbreak fa fa sol, sol'

    %7
    fa fa re re mi la sol sol
    fa4 re mi sol\mbreak
    la8 la, sol sol sol4. r8 sol4. r8

    %10
    do'8 do si sol sol4 r8 do,
    do4 r8 do do4 r8 do
    si sol sol sol sol4 r8 sol'

    %13
    la4 r8 la, la4 r8 la'\mbreak
    sol4 r8 sol, sol4 r8 mi'
    mi2 sold8 la si mi,

    %16
    mi mi mi mi mi4 r\mbreak
    fa8 fa mi do do4 r8 fa
    fa4 r8 fa fa4 r8 do

    %19
    do do do do do4 r8 sol'\mbreak
    fa fa r fa fa4 r8 sol
    do,2 mi8 fa sol re

    %22
    do4 r8 la'\mbreak sol sol mi do
    sib4 sol' la do,
    re do8 do la4. r8 la2

}


IVbcn = \relative do {

    r8
    fa la sol do, fa4 r8 fa
    sib4 r8 sib, fa'4 r8 fa
    do do do do fa, fa' la fa\mbreak

    %4
    mi4 r8 mi do4. si?8
    la4. sol8 fa fa fa fa
    fa' fa fa fa\mbreak fa fa mi mi

    %7
    mi mi si si do fa sol sol,
    la4 si do mi\mbreak
    fa sol8 sol, do4. r8 do4. r8

    %10
    do mi re sol, do4 r8 do
    fa4 r8 fa do4 r8 do
    sol' sol sol, sol do4 r8 si?

    %13
    la4 r8 la re4 r8 do!\mbreak
    si4 r8 sol do do16 si do8[sol]
    mi'2 mi8 fad sold mi

    %16
    la, do mi mi, la4 r\mbreak
    fa'8 la sol do, fa4 r8 fa
    sib4 r8 sib, fa'4 r8 fa

    %19
    do do do do fa4 r8 do'\mbreak
    la fa r fa sib,4 r8 sol
    do2~do8 re mi do

    %22
    fa4 r8 re\mbreak sib sol do do,
    re'4 mi fa la,
    sib do8 do, fa4. r8 fa2

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1
    s
    <7>
    s4 s8 <7> <7>4 <6>
    s1
    s2
    <4 2>4 s8 <6>
    <6> <5> s4 s8 <6> <4> <3!>
    <6>4 <6> s <6>
    s <4!> s2 s
    s1
    s
    <7 4>2 s4 s8 <6>
    <7 _+>4 s8 <_+> s4 s8 <6>
    s4 s8 <_!> s2
    <5 3>4 <6 4> <_+>2
    s1
    s
    s
    <7>2 s4 s8 <3>
    <6 5>2 s4 s8 <_!>
    <5 3>4 <6 4> <5 3>2
    s
    <6 5>4 <4>8 <3>
    <6>4 <6 5> s <6>




}

forma = {

    \time 2/2
    \key fa\major
    \tempo 4 = 60
        \partial 8 s8
    \repeat volta 2 {s1*8  s2}
    \alternative {{\set Score.measureLength = #(ly:make-moment 2 4) s2}{\set Score.measureLength = #(ly:make-moment 2 4) s2}}\break
    \bar ".|:"
    \set Score.currentBarNumber = #10
    \repeat volta 2 { \set Score.measureLength = #(ly:make-moment 4 4) s1*14 s2}
    \alternative {{\set Score.measureLength = #(ly:make-moment 2 4) s2}{\set Score.measureLength = #(ly:make-moment 2 4) s2}}
    \bar "||"

}



IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}


IVvla = {
    \global
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

VvlIn = \relative do'' {

    r16. fa32 do16. sib32 la16. sol32
    fa16. fa'32 do16. sib32 la16. sol32
    fa16. fa'32 fa16. fa32 fa16.\tr [mi64(fa)]

    %4
    sol16. sol32 sol16. sol32 sol16.\tr [fa64(sol)]
    la16.[fa32 do16. fa32] \tuplet 3/2 { fa16(sol la) }\mbreak
    sol16.[mi32 do16. mi32 ]\tuplet 3/2 { mi16(fa sol)}

    %7
    fa16. [re32 si16. re32] \tuplet 3/2 { re16(mi fa) }
    mi16. do32 fa16. re32 sol16. mi32
    la16. fa32 sol16. mi32 fa16. re32

    %10
     \tuplet 3/2 { mi16(re do) fa[(mi re)] sol(fa mi)
    la (sol fa) sol[(fa mi)] fa (mi re)}
    mi(fa) sol8 do,

    %13
    \tuplet 3/2 { fa16 (re la) } si4\tr
    do4. do
    r16. do'32 sol16. fa32 mi16. re32

    %16
    do16. do32 sol16. fa32 mi16. re32 \mbreak
    do16. do'32 do16. do32 do16.\tr[si64 (do)]
    re16.[re32 re16. re32] re16.\tr do64 (re)

    %19
    mi16. do32 fa16. fa32 fa16. fa32
    sol16. sol32 sol16. sol32 sol16.\tr[fa64 (sol)]
    la16. fa32 do'16. do32 do16. do32

    %22
    do16. re,32 sib'16. sib32 sib16. sib32\mbreak
    sib16. do,32 la'16. la32 la16. la32
    la16. sib,32 sol'16. sol32 sol16. sol32

    %25
    sol16. la,32 fa'8.[do16]
    re16 sol mi4
    \tupletSpan 4. \tuplet 9/12 { fa16 fa32(mi re do sib la sol) }\terzine

    %28
    la16. fa32 sib16. sol32 do16. la32
    re16. sib32 do16. la32 sib16. sol32\mbreak
    \tuplet 3/2 { la16 (sol fa) sib[(la sol)] do (sib la)

    %31
    re (do sib) do[(sib la)] sib (la sol)}
    la16 do fa,8. do'16
    re16 sol mi4\tr

    %34
    fa16. do32 fa,8. [do'16]
    re16. sib32 la8[sol]\tr
    fa4. fa

}

VvlIIn = \relative do'' {

    r16. fa32 do16. sib32 la16. sol32
    fa16. fa'32 do16. sib32 la16. sol32
    fa16. fa'32 fa16. fa32 fa16.\tr [mi64(fa)]

    %4
    sol16. sol32 sol16. sol32 sol16.\tr [fa64(sol)]
    la16.[fa32 do16. fa32] \tuplet 3/2 { fa16(sol la) }\mbreak
    sol16.[mi32 do16. mi32 ]\tuplet 3/2 { mi16(fa sol)}

    %7
    fa16. [re32 si16. re32] \tuplet 3/2 { re16(mi fa) }
    mi16. do32 fa16. re32 sol16. mi32
    la16. fa32 sol16. mi32 fa16. re32

    %10
     \tuplet 3/2 { mi16(re do) fa[(mi re)] sol(fa mi)
    la (sol fa) sol[(fa mi)] fa (mi re)}
    mi(fa) sol8 do,

    %13
    \tuplet 3/2 { fa16 (re la) } si4\tr
    do4. do
    r16. do'32 sol16. fa32 mi16. re32

    %16
    do16. do32 sol16. fa32 mi16. re32 \mbreak
    do16. do'32 do16. do32 do16.\tr[si64 (do)]
    re16.[re32 re16. re32] re16.\tr do64 (re)

    %19
    mi16. do32 fa16. fa32 fa16. fa32
    sol16. sol32 sol16. sol32 sol16.\tr[fa64 (sol)]
    la16. fa32 do'16. do32 do16. do32

    %22
    do16. re,32 sib'16. sib32 sib16. sib32\mbreak
    sib16. do,32 la'16. la32 la16. la32
    la16. sib,32 sol'16. sol32 sol16. sol32

    %25
    sol16. la,32 fa'8.[do16]
    re16 sol mi4
    \tupletSpan 4. \tuplet 9/12 { fa16 fa32(mi re do sib la sol) }\terzine

    %28
    la16. fa32 sib16. sol32 do16. la32
    re16. sib32 do16. la32 sib16. sol32\mbreak
    \tuplet 3/2 { la16 (sol fa) sib[(la sol)] do (sib la)

    %31
    re (do sib) do[(sib la)] sib (la sol)}
    la16 do fa,8. do'16
    re16 sol mi4\tr

    %34
    fa16. do32 fa,8. [do'16]
    re16. sib32 la8[sol]\tr
    fa4. fa

}

Vvlan = \relative do' {

    la'8 fa mi
    fa fa mi
    fa do fa

    %4
    fa fa mi
    fa fa fa\mbreak
    do do do

    %7
    si si re
    do re mi
    fa mi re

    %10
    do re mi\mbreak
    fa mi re
    do4 sol'8

    %13
    la sol re
    mi4. mi
    mi8 do si

    %16
    do do si
    mi do' do
    do si si

    %19
    do do fa,
    fa fa mi
    fa4 do'8

    %22
    re16 do sib? la sib sol\mbreak
    do sib la sol la fa
    sib la sol fa sol mi

    %25
    la8. sib16 do la
    sib8 sol do
    la4 r8

    %28
    fa sol la
    sib la sol\mbreak
    fa sol la

    %31
    sib la sol
    fa8. sib,16 do la
    re8 do do

    %34
    la8. sib16 do fa
    fa8 fa mi
    fa4. fa

}

VcrIn = %\transpose do fa,
\relative do'' {
    \key do\major%\clef violin

    r16. mi32 sol16. fa32 mi16. re32
    mi16. mi32 sol16. fa32 mi16. re32
    mi8 mi mi

    %4
    mi re re
    mi4 r8\mbreak
    re4 r8

    %7
    do4 r8
    re4 r8
    mi re do

    %10
    re4 r8\mbreak
    mi re do
    re4 sol8

    %13
    la sol fad
    sol4. sol
    sol,4 r8

    %16
    sol4 r8\mbreak
    sol sol' sol
    sol fad fad

    %19
    sol mi mi
    re re re
    mi sol sol

    %22
    sol fa fa\mbreak
    fa mi mi
    mi re re

    %25
    do do do
    fa re4
    do r8

    %28
    mi fa sol
    la sol fa\mbreak
    mi fa sol

    %31
    la sol fa
    mi16 fa sol fa mi8
    fa re4\tr

    %34
    mi16 fa sol fa mi8
    fa re4\tr
    do4. do

}

VcrIIn = %\transpose do fa,
\relative do'' {
    \key do\major%\clef violin

    r8 mi16. re32 do16. sol32
    do8 mi16. re32 do16. sol32
    do8 do do

    %4
    do sol sol
    do4 r8\mbreak
    sol4 r8

    %7
    do4 r8
    sol4 r8
    do sol mi

    %10
    sol4 r8\mbreak
    do sol mi
    sol4 re'8

    %13
    mi re re
    sol,4. sol
    sol4 r8

    %16
    sol4 r8\mbreak
    sol re' re
    mi re re

    %19
    sol, do do
    do sol sol
    do mi mi

    %22
    do re re\mbreak
    do do do
    do sol sol

    %25
    do mi, mi
    do' sol4
    mi r8

    %28
    do' re mi
    fa mi re\mbreak
    do re mi

    %31
    fa mi re
    do16 re mi re do8
    re sol,4\tr

    %34
    do16 re mi re do8
    re sol,4\tr
    mi4. mi

}


Vbcn = \relative do {

    fa8 la do
    fa, la do
    fa,16. sol32 la16. sol32 la16. fa32

    %4
    sib16. sol32 do16. sib32 do16. do,32
    fa16. la32 do16. la32 fa16. do'32\mbreak
    mi,16. sol32 do16. sol32 mi16. do'32

    %7
    re,16. fa32 si16. fa32 re16. si'32
    do,16 do' re, do' mi, do'
    fa, do' mi, do' re, do'

    %10
    do, do' re, do' mi, do'\mbreak
    fa, do' mi, do' re, si'
    do,4 mi8

    %13
    fa sol sol,
    do do'16 sib la sol do,4.
    do8 mi sol

    %16
    do, mi sol\mbreak
    do,16 re mi re mi do
    fa re sol fa sol sol,

    %19
    do do' la sol la fa
    sib sol do sib do do,
    fa sol la sol la fa

    %22
    sib la sol fa sol mi\mbreak
    la sol fa mi fa re
    sol fa  mi re mi do

    %25
    fa8. sol16 la fa
    sib sol do8 do,
    fa4 r8

    %28
    fa,16 fa' sol, fa' la, fa'
    sib, fa' la, fa' sol, fa'\mbreak
    fa, fa' sol, fa' la, fa'

    %31
    sib, fa' la, fa' sol, fa'
    fa,8. sol16 la fa
    sib sol do8[do,]

    %34
    fa'8. sol16 la fa
    sib sol do8 do,
    fa,8. fa'16 mi re fa,4.

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*3
    <6 5>4.
    s4.*8
    <6>8 <7> <_!>
    s4.*5
    <6 5>4.
    s4.*3
    <9>4.
    <9>8 <8> s
    <9>4.
    <9>8 <8> s

}

forma = {

    \time 3/8
    \tempo 4. = 47
    \repeat volta 2 {s4.*13}
    \alternative {{s4.}{s}}\break
    \set Score.currentBarNumber = #15
    \repeat volta 2 {s4.*21}
    \alternative {{s4.}{s}}
    \bar "|."

}



VvlI = {
    \global
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}


Vvla = {
    \global
    \clef alto
    <<\Vvlan \forma>>

}

VcrI = {
    \global
    <<\VcrIn \forma>>

}

VcrII = {
    \global
    <<\VcrIIn \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}
#(set-global-staff-size 17.5)


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
        title = \markup\smaller{Introduzione - Fuga in Sol minore}
        composer = \markup \center-column{"  ""F. Chelleri (1690-1757)"}

    }

    \markup \huge {[1.] Introduzione - Grave e sostenuto}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""Imo"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""2do"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[2.] Fuga - Lento e a tempo giusto}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""Imo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""2do"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \paper {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller{Sinfonia in Fa maggiore}
        composer = \markup \center-column{"  ""F. Chelleri (1690-1757)"}
    }

    \markup \huge {[1.] Allegro}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"Violino"\vspace #-0.2 "Primo"}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \key fa\major
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2 "2do"}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \key fa\major
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Braccia"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \key fa\major
                \IIIvla
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"Cornu"\vspace #-0.2 "Imo"}
                    \set Staff.shortInstrumentName = "cr1"
                    \set Staff.midiInstrument = #"french horn"
                    \IIIcrI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Cornu"\vspace #-0.2 "2.do"}
                    \set Staff.shortInstrumentName = "cr2"
                    \set Staff.midiInstrument = #"french horn"
                    \IIIcrII
                >>
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \key fa\major
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

        systems-per-page = #4

    }

    \markup \huge {[2.] Andante}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"2do"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Braccia"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \paper {

        systems-per-page = #3

    }


    \markup \huge {[3.] Allegro}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"Violino"\vspace #-0.2 "Primo"}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \key fa\major
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2 "2do"}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \key fa\major
                    \VvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Braccia"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \key fa\major
                \Vvla
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"Cornu"\vspace #-0.2 "Imo"}
                    \set Staff.shortInstrumentName = "cr1"
                    \set Staff.midiInstrument = #"french horn"
                    \VcrI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Cornu"\vspace #-0.2 "2.do"}
                    \set Staff.shortInstrumentName = "cr2"
                    \set Staff.midiInstrument = #"french horn"
                    \VcrII
                >>
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \key fa\major
                \Vbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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
