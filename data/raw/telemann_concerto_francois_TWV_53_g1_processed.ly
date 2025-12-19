\language "italiano"
	%********************************** VARIABILI
\version "2.20.0"

MyCadenza = \relative do'' {

\cadenzaOn s2.*5^\markup\italic\center-align"Qui si ferma à piacim[en]to" \bar "||"

\cadenzaOff

}

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

dolce = _\markup\italic "doux"

soli = ^\markup \italic { soli }

solo = ^\markup \italic { solo }

trio = ^\markup \italic "Trio"

tu = ^\markup \italic "tous"

pad = \once \override TextScript.padding = #2

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
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }


Iglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza \terzine

}

IobIn =  \relative do'' {

    r2 re2.  re4
    re2 re2. re4
    re2 do2. la4

    %4
    sib2 la2. fad4
    sol2 fa'?2. fa4
    fa(mib) mib2. mib4

    %7
    mib(re) do2. re4
    re2 la'2. la4
    sib2 sol4. sol8 la4. sib8

    %10
    la1.~\mbreak
    la2 sol2. sol4
    sol4.(mi!8) fa2. fa4

    %13
    mi2 mi2. re4
    re1.~
    re2 dod2. re4

    %16
    re2 fa4.\dolce fa8 fa4. mib8
    re4. do8 re4. re8 re4.\tr  do16 (re)
    mib2 sol2.\f sol4

    %19
    lab2 fa4. fa8 sol4. lab8
    sol1.~\mbreak
    sol2 fa2. fa4

    %22
    fa2 \appoggiatura mib8 re2 mib~
    mib4. re8 re2.\tr do4
    do2 mib4.\dolce mib8 mib4. re8

    %25
    do4. sib8 do4. do8 do4.\tr sib16 (do)
    re2 fa2.\f fa4
    sol2 sol4. sol8 la4. sib8

    %28
    la2. sol4 fa2~
    fa4. fa8 sol4. re8 mib2~
    mib4. mib8 fa4. do8 re2~\mbreak

    %31
    re4. sib8 do4. re8 mib4. fa8
    sol4. fa8 sol4.  la8 sib4. fa8
    mib4. re8 do2. sib4

    %34
    sib2 re2. re4
    re2 re2. re4
    re2 do2. la4

    %37
    sib2 la2. fad4
    sol2 re'2. re4
    re2 re2. re4

    %40
    re2 do2. la4
    sib2 la2. fad4\mbreak
    sol2 fa'2. fa4

    %43
    fa(mib) mib2. mib4
    mib?(re) re2. re4
    re(do) do2. do4

    %46
    do2 la4. sib8 do4. la8
    re2 sib4. do8 re4. sib8
    mib4. re8 do4. sib8 la4. sib16 (do)

    %49
    sib4. la8 la2. sol4
    sol2 fa'2.\dolce fa4
    fa(mib) mib2. mib4\mbreak

    %52
    mib?4(re) re2. re4
    re(do) do2. do4
    do2 la4. sib8 do4. la8

    %55
    re2 sib4. do8 re4. sib8
    mib4. re8 do4. sib8 la4. sib16 (do)
    sib4. la8 la2. sol4

    %58
    sol1.\fermata

}

IobIIn =  \relative do'' {

    r2 sib2. sib4
    la2 la2. la4
    sol2 sol'1~

    %4
    sol2 fad4. fad8 sol4. la8
    re,1.~
    re2 do4. do8 re4. mib8

    %7
    fad,2 sol2. fad4
    fad?2 fad'2. fad4
    sol2 mi4. mi8 fa4. sol8

    %10
    fa4. sol8 fa4. mi8 re4. do8\mbreak
    si4. la8 si4. dod8 re4. mi8
    dod2 la2. la4

    %13
    la2 la2. la4
    la2 sol2. mi4
    fa2 mi2. re4

    %16
    re2 re'4.\dolce re8 re4. do8
    si4. la8 si4. si8 si4. la16 (si)
    do2 mib2.\f mib4

    %19
    mib?2 re4. re8 mib!4. fa8
    mib4. fa8 mib4. re8 do4. sib8\mbreak
    la4. sol8 la4. si8 do4. re8

    %22
    si2. si4 do2~
    do4. si8 si2. do4
    do2 do4.\dolce do8 do4. sib?8

    %25
    la4. sol8 la4. la8 la4.\tr sol16 (la)
    sib2 re2.\f re4
    sib2 sib4. sib8 mib4. re8

    %28
    do4. sib8 la4. sib8 do4. lab?8
    si2. si4 sol4. sol8
    do2. la4 fa4. fa8\mbreak

    %31
    sib2. sib4 do4. re8
    mib4. sib8 sib4. mib8 re4. re8
    do4. sib8 la2. sib4

    %34
    sib2 sib2. sib4
    la2 la2. la4
    sol2 sol'1~

    %37
    sol2 fad4. fad8 sol4. la8
    re,2 sib2. sib4
    la2 la2. la4

    %40
    sol2 sol'1~
    sol2 fad4. fad8 sol4. la8\mbreak
    re,2 re2. re4

    %43
    re(do) do2. do4
    do(sib) sib2. sib4
    sib(la) la2. la4

    %46
    la2 fad4. sol8 la4. fad8
    sib2 sol4. la8 sib4. sol8
    do4. sib8 la4. sol8 fad4. sol16(la)

    %49
    sol4. fad8 fad2. sol4
    sol2  re'2.\dolce re4
    re(do) do2. do4\mbreak

    %52
    do (sib) sib2. sib4
    sib(la) la2. la4
    la2 fad4. sol8 la4. fad8

    %55
    sib2 sol4. la8 sib4. sol8
    do4. sib8 la4. sol8 fad4. sol16(la)
    sol4 fad fad2. sol4

    %58
    sol1.\fermata

}

IvlaIn = \relative do''{

    r2 sol2. sol4
    la2 fa2. fa4
    sol2 sol2. sol4

    %4
    re2 re2. re4
    re2 sol2. sol4
    sol2 do2. do4

    %7
    la2 sol2. re4
    re2 re2. re'4
    re2 do2. do4

    %10
    do2 sol2. sol4\mbreak
    mi2 re2. re4
    mi2 re2. re4

    %13
    mi2 do2. do4
    re2 re2. re4
    la'2 la1

    %16
    fa2 la\dolce la
    si sol sol
    sol do2.\f do4

    %19
    do2 sib2. sib4
    sib2 sib2. sib4\mbreak
    fa2 fa2. fa4

    %22
    re2 sol sol
    lab sol2. sol4
    sol2 sol\dolce sol

    %25
    la fa fa
    fa sib2.\f sib4
    sib2 sib4. sib8 do4. re8

    %28
    fa,2 fa2. lab4
    sol2 sol2. sol4
    fa2 fa2. fa4\mbreak

    %31
    sol2 sol2. lab4
    sol4. sib8 sol4. mib8 fa2
    sol la fa

    %34
    fa sol2. sol4
    la2 fa2. fa4
    sol2 sol2. sol4

    %37
    re2 re2. re4
    re2 sol2. sol4
    la2 fa2. fa4

    %40
    sol2 sol2. sol4
    re2 re2. re4\mbreak
    re2 sol2. sol4

    %43
    sol2 fa2. fa4
    fa2 mib2. mib4
    mib?2 sol2. sol4

    %46
    fad1 r2
    fa!2 sol r
    sol1 re2

    %49
    re re1
    re2 sol2.\dolce sol4
    sol2 fa2. fa4\mbreak

    %52
    fa2 fa2. fa4
    mib2 sol2. sol4
    fad1 r2

    %55
    fa! sol r
    sol1 re2
    re re1

    %58
    re1.\fermata

}

IvlaIIn = \relative do' {

    r2 re2. re4
    re2 re2. re4
    mi2 do2. do4

    %4
    re2 la'2. la4
    sol2 sol2. sol4
    sol2 sol2. sol4

    %7
    re2 sol,2. la4
    la2 re2. re4
    sol2 sol2. mi4

    %10
    fa2 fa2. fa4\mbreak
    re2 re2. sib4
    la2 la2. la4

    %13
    la2 la2. la4
    si2 sol2. sol4
    la2 la1

    %16
    la2 re\dolce re
    sol sol sol
    do, do2. do4

    %19
    fa2 fa2. re4
    mib2 mib2. mib4\mbreak
    do2 do2. lab4

    %22
    sol2 re' do
    do4. fa8 re2 sol
    mib do do

    %25
    fa fa fa
    sib, fa'2. fa4
    mib2 mib4. mib8 mib4. fa8

    %28
    fa2 do2. fa4
    re2. re4 do4. do8
    do2. do4 sib4. sib8\mbreak

    %31
    sib2 sib2. sib4
    sib4. sib8 sib4. do8 sib2
    sol' fa mib

    %34
    re re2. re4
    re2 re2. re4
    mi2 do2. do4

    %37
    re2 la'2. la4
    sol2 re2. re4
    re2 re2. re4

    %40
    mi2 do2. do4
    re2 la'2. la4\mbreak
    sol2 si2. si4

    %43
    sol2 la2. la4
    fa2 re2. re4
    mib2 mib2. mib4

    %46
    la,1 r2
    sib sib r
    do mib do

    %49
    sib re la
    sib sol2. sol'4
    sol2 la2. la4\mbreak

    %52
    fa2 re2. re4
    mib2 mib2. mib4
    la,1 r2

    %55
    sib sib r
    do mib do
    sib re la

    %58
    sib1.\fermata

}

Ibcn = \relative do {

    sol2 sol'2. sol4
    fad2 fa2. fa4
    mi2 mib2. mib4

    %4
    re2 re'2. do4
    sib2 si2. si4
    do2 do,2. do4

    %7
    re2 mib2. re4
    re2 re'4. do8 sib4. la8
    sol4. la16 sib do2 do,

    %10
    fa4. mi8 fa4. sol8 la4. fa8\mbreak
    sol4. fa8 sol4. la8 sib4. sol8
    la2 re,2. re4

    %13
    dod2 do2. do4
    si2 sib2.  sib4
    la4. sol8 la1

    %16
    re,2 r r
    R1.
    r2 do''4.\f sib8 lab4. sol8

    %19
    fa2 sib sib,
    mib4. re8 mib4. fa8 sol4. mib8\mbreak
    fa4. mib8 fa4. sol8 lab4. fa8

    %22
    sol4. la8 si4. sol8 do4. mib,8
    fa2 sol sol,
    do r r

    %25
    R1.
    r2 sib4. do8 re4. sib8
    mib4. fa8 mib4. re8 do4. sib8

    %28
    fa'4. mib?8 fa4. sol8 lab4. fa8
    sol2. sol4 do4. do8
    la!2. fa4 sib4. la8\mbreak

    %31
    sol2. sol4 sol4. fa8
    mib4. re8 mib 4. do8 re2
    mib fa fa,

    %34
    sib sol'2. sol4
    fad2 fa2. fa4
    mi2 mib2. mib4

    %37
    re2 re'2. do4
    sib4. la8 sol2. sol4
    fad2 fa2. fa4

    %40
    mi2 mib2. mib4
    re2 re'2. do4\mbreak
    sib!2 si4. sol8 la4. si8

    %43
    do2 la4. fa8 sol4. la8
    sib!2 sib,4. do8 re4. sib8

    %45
    do2 do4. re8 mib4. do8
    re1 r2
    sib2 mib r

    %48
    do1 re2
    sol re re,
    sol si'4.^\dolce sol8 fa4. si8

    %51
    do2 la4. fa8 sol4. la8\mbreak
    sib!2 sib,4. do8 re4. sib8
    do2 do4. re8 mib4. do8

    %54
    re1 r2
    sib2 mib r
    do1 re2

    %57
    sol re re,
    sol1.\fermata

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1.
  <6>2 <6> s
  <7> <6> s
  <6 4> <5> s
  <6> <6 5-> s
  <9 _-> <8 6> s
  <_+> <6> s4 <_+>
  s2 <_+> s
  s1.
  s2 s <6>
  <9 _!> <8>4. <_+>8 s4. <_!>8
  <7 _+>2 s s
  <6> <6> s
  <7> <6> s
  <6 4> <5 _+> s
  s1.*2
  s2 <_-> s
  <7- _-> s s
  s s <6>
  <9 _!> <8> <6>4. <_!>8
  <7 _!>2 <6> s
  <_-> <4> <_!>
  s1.*2
  s2 s <6>
  s s <6 _->
  <_!> s <6> % fin qui bar 28
  <7 _!> s <_->
  <6 5-> s s
  s2. <4>4 s4. <6 _->8
  s4. <6>8 s1
  s1.*2
  <6>1.
  <7>2 <6> s
  <6 4> <_+> s
  <6> s s
  <6> <6> s
  <7> <6> s
  <6 4> <5 _+> s
  <6> <6 5-> s

  <9 4>4 <8 _-> <6 5->2 s
  <5 4> <3> s
  <9 _-> <6 _-> <6>
  <7 _+>1.
  <5>
  <_->1 <_+>2
  s <4> <_+>
  s <6 5-> s
  <9 4>4 <5-> <6 5->1
  <5 4>2 <3> s
  <9 _-> <6 _-> <6>
  <7 _+> s s
  <5> s s
  <_-> s <_+>
  s <4> <_+>

}

forma = {

  \key fa\major
  \time 3/2
  \tempo 2 = 55
  s1.*58
  \bar"|."

}

IobI = {
  \Iglobal
  \notypeset
  <<\IobIn \forma>>

}

IobII = {
  \Iglobal
  <<\IobIIn \forma>>

}

IvlaI = {
  \Iglobal
  <<\IvlaIn \forma>>

}

IvlaII = {
  \Iglobal
  \clef alto
  <<\IvlaIIn \forma>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzine

}

IIobIn =  \relative do'' {

    r4 re sol sol
    sol fad sib sib
    sib la8 sol la4 la

    %4
    la re, sol4. sol8
    sol2 fad4.\tr mi16 fad
    sol4 re re mi

    %7
    fa?2~fa8 la sol fa
    mi2~mi8 sol fa mi
    re dod re mi fa mi fa re

    %10
    mi4 la, re2~
    re8 re do si do2~\mbreak
    do8 do si? la si!2~

    %13
    si8 si? la sold? la2~
    la4 la re2~
    re4 re do2~

    %16
    do4 la re re,
    sol2 r
    re'1

    %19
    do
    sib
    la

    %22
    sol8 fad sol la sib la sib sol\mbreak
    la4 re, r re'
    mib8 re do sib do la sib do

    %25
    re do sib la sib sol la sib
    do sib la sib do mib re do
    si sol la si do4. do8

    %28
    do2 si4. la16 si
    do2 r
    r4 sol do do

    %31
    do si mib mib
    mib? re8 do re4 re
    re sol, do4. do8\mbreak

    %34
    do2 sib4. sib8
    sib4. la16 sol la4. la8
    sol2 sol4. fa8

    %37
    fa2 r8 sib re sib
    do sib do re do re mib do
    re do re mib re mib fa re

    %40
    mib re mib fa mib fa sol mib
    fa2 sib4. lab8
    sol4. fa8 mib re do sib

    %43
    la fa sol la sib do re mib?
    fa4. sol8 do,4. sib8\mbreak
    sib4 fa'\trio re fa

    %46
    sol8 fa sol lab sol fa sol mib
    fa4 fa re fa
    sol8 fa sol lab sol fa sol mib

    %49
    fa mib fa sol fa sol fa sol
    mib re mib fa mib  fa mib fa
    re do re mib re do sib re

    %52
    do4 do fa fa
    fa mi la la
    la sol8 fa sol4 sol

    %55
    sol do, fa4. fa8\mbreak
    fa2 mi4.\tr re16 mi
    fa4 do\trio la do

    %58
    re8 do re mib re do re sib
    do4 do la do
    re8 do re mib re mib re mib

    %61
    do sib do re do re do re
    sib la sib do sib do sib do
    la2 r

    %64
    fa'1
    mib
    re

    %67
    do\mbreak
    sib
    la

    %70
    sol2 r
    r4 re' sol sol
    sol fad sib sib

    %73
    sib la r8 la sol fa?
    mi fa sol mi fa mi re fa
    sol fa mi sol fa4 r

    %76
    R1
    r2 r8 re fa re
    mi re mi fa mi fa sol mi\mbreak

    %79
    fa mi fa sol fad sol la fad
    sol4 re sol sol
    sol fad sib sib

    %82
    sib la8 sol la4 la
    la re, sol4. sol8
    sol4. fa16 mi fa4. fa8

    %85
    fa2 mi4. re16 mi
    fa4. mib8 re mib do re
    mib fa mib re do re sib do

    %88
    re mib re do sib do la sib
    do re do sib la sib sol la\mbreak
    sib4 si do re

    %91
    mib mi fa sol
    fad la, do4. do8
    do4. sib16 la sib4. sib8

    %94
    la2 la4. sol8
    sol4 re'\dolce sol4. sol8
    sol4. fa16 mi fa4. fa8

    %97
    fa2 mi4 .re16 mi
    fa4. mib8 re8 mib do re
    mib fa mib re do re sib do

    %100
    re mib re do sib do la sib\mbreak
    do re do sib la sib sol la
    sib4 si do re

    %103
    mib mi fa sol
    fad la, do4. do8
    do2 re4

    %106
    sib4. do8 la4
    \appoggiatura do8 sib4 \appoggiatura la8 sol4 sol'
    fa4. sol8 mib4

    %109
    re2\tr re4
    mib4. re8 do4
    fa sib, sol'

    %112
    do,2 sib4
    sib2\fermata re4
    do4. re8 sib4  %%% inizio p.7

    %115
    fa'4\appoggiatura mib8 re4 fa
    mi!4. fa8 sol mi
    dod4 \appoggiatura si8 la4 la'

    %118
    fa4. sol8 mi4
    \appoggiatura sol8 fa4 \appoggiatura mi8 re4 mi
    mi2\tr re4

    %121
    re2 la'4
    la4. sol8 fad4
    sol re mib

    %124
    do4. re8 si4
    do mib2
    la, re4 \mbreak

    %127
    sol, do2
    r4 la4. sib8
    fad4 \appoggiatura mi8 re4 re'

    %130
    mib re sol
    fad re do
    sib4. la8 sol4

    %133
    sol2 re'4^\markup\italic "doucement"
    mib re sol
    fad re do

    %136
    sib4. la8 sol4
    sol2. si!4\trio
    si8(do) si4 si8 (do) si4

    %139
    si8(do) si4 si8 (do) si4\mbreak
    mi4 re do si
    la si do la

    %142
    si8(do) si4 si8 (do) si4
    si8(do) si4 si8 (do) si4
    mi re2 dod4

    %145
    re2.  re2. la4
    re8(mi) re4 re8(mi) re4
    re2. re4

    %148
    sol8(la) sol4 sol8(la) sol4
    sol2. sol4\mbreak
    la8(si) la4 sol8(la) sol4

    %151
    fad8(sol) fad4 sol8(la) sol4
    la sol8(fad) fad4.mi8
    mi4 sol8 fad sol4 re

    %154
    mi8(fa) mi4 re8(mi) re4
    do8(re) do4 si8(do) si4
    mi re do si

    %157
    la si do la
    si8(do) si4 si8 (do) si4
    si8(do) si4 si8 (do) si4

    %160
    si4. la8 la4. sol8
    sol2. sol re'4

}

IIobIIn =  \relative do'' {

    R1*3
    r2 r8 sol sib sol
    la sol la sib la sib do la

    %6
    sib la sib do sib re do sib
    la sol la sib la do sib la
    sol fa sol la sol sib la sol

    %9
    fa2 r
    la'1
    sol\mbreak

    %12
    fa
    mi
    re2 r

    %15
    R1*2
    sol,8 fad sol la sib la sib sol
    la4 re, sol2~

    %19
    sol8 sol fa? mib? fa2~
    fa8 fa mib re mib2~
    mib8 mib re do re2~

    %22
    re4 re' sol sol\mbreak
    sol fad sib sib
    sib la8 sol la4 la

    %25
    la re, sol4. sol8
    sol2 fa4. fa8
    fa4. mib16 re mib4. mib8

    %28
    re2 re4. do8
    do2 r2
    R1*3

    %33
    r2 r8 do mib do\mbreak
    re8 do re mib re mib fa re
    mi! do re mi fa4. fa8

    %36
    fa2 mib4. mib8
    mib?2  re4. re8
    do2 do4. do8

    %39
    sib4 fa sib2~
    sib4 sol do2~
    do4 la re2~

    %42
    re4 sib sol'8 fa mib re
    do4. fa,8 sol la sib do
    re4. sib8 la4. sib8\mbreak

    %45
    sib4 re sib re
    mib8 re mib fa mib re mib do
    re4 re sib re

    %48
    mib8 re mib fa mib re mib do
    re do re mib re mib re mib
    do sib do re do re do re

    %51
    sib la sib do sib la sol sib
    la4 do8 sib la sol la fa
    sol4 do, r do'

    %54
    re8 do sib la sib sol la sib
    do sib la sol la fa sol la\mbreak
    sib la sol la sib re do sib

    %57
    la4 la fa la
    sib8 la sib do sib la sib sol
    la4 la fa la

    %60
    sib8 la sib do sib do sib do
    la sol la sib la sib la sib
    sol fa sol la sol la sol la

    %63
    fa4 fa sib sib
    sib la re re
    re do8 sib do4 do

    %66
    do fa, sib sib
    sib la8 sol la4 la\mbreak
    la re, sol4. sol8

    %69
    sol2 fad4. mi16 fad
    sol4 re' sol sol
    sol fad sib sib

    %72
    sib la r sol
    sol fad r8 fa mi re
    la1~

    %75
    la2 la4 re
    si re sol, do
    la do fa, sib

    %78
    sol sib la2~\mbreak
    la4 la re2~
    re4 re8 do sib la sib sol

    %81
    la4 re sib sol
    r do la fa
    sib2 r8 sol sib sol

    %84
    la sol la sib la sib do la
    sib do sib la sol la fa sol
    la fa sol la sib do la sib

    %87
    do1
    sib
    la\mbreak
    sol4 sol2 si4

    %91
    do sol do sib
    la2 la4. la8
    la4. sol16 fad sol4. sol8

    %94
    sol2 fad4. sol8
    sol2 r8 sol\dolce sib sol
    la sol la sib la sib do la

    %97
    sib do sib la sol la fa sol
    la fa sol la sib do  la sib
    do1

    %100
    sib\mbreak
    la
    sol4 sol2 si4

    %103
    do sol do4. sib?8
    la2 la4. la8
    fad2 la4

    %106
    sol4. la8 fad4
    \appoggiatura la8 sol4 re sib'
    do la do

    %109
    sib2 sib4
    sib do2
    sib4 sib2

    %112
    la2 fa?4
    fa2 \fermata sib4
    la2 sol4

    %115
    la sib do
    sib la sol
    la2 mi'4

    %118
    re4. mi8 dod4
    re2 re4
    re dod la

    %121
    la2 re4
    re2 re4
    re2 do?4

    %124
    mib,4. fa8 re4
    mib4 sol2
    fa2 fa4\mbreak

    %127
    mib sol2
    re2 re4
    re2 la'4

    %130
    sib la sol
    la sol sol
    sol fad re

    %133
    re2 la'4
    sib la sol
    la sol sol

    %136
    sol fad re
    re2. sol4
    sol8(la) sol4 sol8(la) sol4

    %139
    sol8(la) sol4 sol8(la) sol4\mbreak
    do si la sol
    fad sol la fad

    %142
    sol8(la) sol4 sol8(la) sol4
    sol8(la) sol4 sol8(la) sol4
    sol4 fad mi2

    %145
    re2. re r4
    r2 r4 fad
    si8(do) si4 si8(do) si4

    %148
    si2. si4
    mi8(fa) mi4 mi8(fa) mi4\mbreak
    mi1~

    %151
    mi~
    mi4 mi red4. mi8
    mi2. si4

    %154
    do8(re) do4 si8(do) si4
    mi8(fa) mi4 re8(mi) re4
    do si la sol

    %157
    fad sol la fad
    sol8(la) sol4 sol8(la) sol4
    sol8(la) sol4 sol8(la) sol4

    %160
    sol4. fad8 fad4. sol8
    sol2. sol la4

}

IIvlaIn = \relative do''{

    R1*8
    r4 la re re
    re dod fa fa

    %11
    fa mi8 re mi4 mi\mbreak
    mi la, re4. re8
    re2 dod4. sib16 dod

    %14
    re2 r8 re, fa re
    mi re mi fa mi fa sol mi
    fad mi fad sol fad sol la fad

    %17
    sol2. re4
    re2 re4 sol
    mib? sol do, fa

    %20
    re fa sib, mib
    do mib re4. re8
    re4 sib'8 la sol4 sol\mbreak

    %23
    re2 r
    mib'1
    re

    %26
    do
    sol2 do4. do8
    fa,2 sol4. sol8

    %29
    sol lab sol fa sol fa sol mib
    re2 r
    sol1

    %32
    fa
    mib\mbreak
    re

    %35
    do2 r8 la' do la
    sib la sib do sib do re sib
    do la sib do sib4. sib8

    %38
    sol2 fa4. fa8
    fa2. sib4
    sol2. do4

    %41
    la2. re4
    sib2 sib4. sib8
    fa2. fa4

    %44
    sib4. sol8 fa4. fa8\mbreak
    fa2 r
    R1*8

    %54
    re'1
    do\mbreak
    sib

    %57
    la2 r
    R1*5
    r4 la fa re'

    %64
    do fa re sib
    r mib do la
    r re sib sol

    %67
    r do la fa\mbreak
    r sib sol mib
    re2 re'4 re

    %70
    re2 re4 re
    re2 re4 re
    re2 r

    %73
    r4 la re re
    re dod fa fa
    mi la, re2~

    %76
    re8 re do si do2~
    do8 do sib! la sib2~
    sib8 sib la sol la2\mbreak

    %79
    re,2. la'4
    sib2 r
    re1

    %82
    do
    sib
    la

    %85
    sol
    fa2. fa4
    sol8 la fa sol la sib sol la

    %88
    fa sol mib fa sol la fa sol
    mib4 do re2\mbreak
    re4 re mib fa

    %91
    sol sol la sib
    re,2 fad4. fad8
    fad?2 re4. re8

    %94
    do2 do4. do8
    re2 sib'4. sib8
    la2 la4. la8

    %97
    sol2 sol4. sol8
    fa2 fa4. fa8
    sol la fa sol la sib sol la

    %100
    fa sol mib fa sol la fa sol\mbreak
    mib4 do re2
    re4 re mib fa

    %103
    sol sol la sib
    re,2 fad4. fad8
    fad2 la4 %%% en loure OK

    %106
    sol4. la8 fad4
    sol re sib'
    do la do

    %109
    sib2 sib4
    sib do2
    sib4 sib2

    %112
    la fa?4
    fa2 \fermata \mbreak sib4
    la2 sol4

    %115
    la sib do
    sib la sol
    la2 mi'4

    %118
    re4. mi8 dod4
    re2 re4
    re dod la

    %121
    la2 re4
    re2 re4
    re2 do?4

    %124
    mib,4. fa8 re4
    mib sol2
    fa fa4\mbreak

    %127
    mib sol2
    re re4
    re2 la'4

    %130
    sib la sol
    la sol sol
    sol fad re

    %133
    re2 la'4
    sib la sol
    la sol sol

    %136
    sol fad re
    sib2. r4
    R1*7

    %145
    R2. r r4
    R1*15
    R2. r la'4

}

IIvlaIIn = \relative do' {

    R1*11
    r2 r8 re fa re
    mi re mi fa mi fa sol mi

    %14
    fa mi fa sol fa sol la fa
    sol fa sol la sol la sib sol
    la sol la sib la sib do la

    %17
    sib la sib do sib do re sib
    do sib do la sib4 sol
    do do, la' fa

    %20
    sib sib, r8 sol sib sol
    la sol la sib la sib do la
    sib2 r\mbreak

    %23
    la'4 la8 sol fa sol mib fa
    sol4. fa8 mib fa re mib
    fa4. mib8 re mib do re

    %26
    mib4. re8 do re sib do
    re si do re do mib sol mib
    fa2 re

    %29
    r4 sol, do do
    do si mib mib
    mib? re mib! sol

    %32
    do, mib re fa
    sib, mib do sol'\mbreak
    lab fa sol4. sol8

    %35
    sol2 fa4. fa8
    re2 sol4. sol8
    do,2 r8 re fa re

    %38
    mib re mib fa mib re do mib
    re2 fa4. fa8
    mib2 sol4. sol8

    %41
    fa2. fa4
    sol2 sol4. sol8
    la2 fa4. fa8

    %44
    fa4. mib8 do4 fa\mbreak
    re2 r
    R1*7  %% primo trio p 5

    %53
    sol4. fa8 mi fa re mi
    fa4. mi8 re mi do re
    mi4. re8 do re sib do\mbreak

    %56
    re4. do8 sib4 la8 sib
    do2 fa
    sib, sib

    %59
    fa fa'
    sib, sib
    fa fa'~

    %62
    fa mi
    fa r
    r4 fa sib2~

    %65
    sib8 sib la sol la2~
    la8 la sol fa sol2~
    sol8 sol fa mi fa2~\mbreak

    %68
    fa8 fa mib re mib2~
    mib8 mib re do re4. do8
    sib2 sol'4 sib

    %71
    la2 sol4 re
    re2 re4 re
    re2 r

    %74
    R1
    la'
    sol

    %77
    fa
    mi\mbreak
    re4 fa la fad

    %80
    sol sib sol re
    r re sol2~
    sol8 sol fa mi fa2~

    %83
    fa8 fa mib re mib2~
    mib8 mib re do re2
    re4 re mi? do

    %86
    do do re2
    do4 mib fa la,
    sib re mib sol,

    %89
    la2 re\mbreak
    sib4 sol sol sol
    sol do do re

    %92
    re2 re4. re8
    re2 sol,4. sol8
    do2 do4. do8

    %95
    sib2 mib4. mib8
    mib4 do re4. re8
    re4 re mi! do

    %98
    do2 re4. re8
    do4 mib fa la,
    sib re mib sol,\mbreak

    %101
    la2 re4. re8
    sib4 sol sol sol
    sol do do re

    %104
    re2 re4. re8
    re2 re4
    re mib re

    %107
    re sib re
    fa fa fa
    fa2 fa4

    %110
    sol fa2
    fa sol4
    fa2 re4

    %113
    re2\fermata fa4
    fa2 mi!4
    fa2 fa4

    %116
    sol fa mi
    mi2 la4
    la sib la

    %119
    la2 sib4
    la2 fa4
    fa2 fa4

    %122
    fad fad2
    sol sol4
    lab lab  sol

    %125
    sol mib2
    do re4\mbreak
    sib do2

    %128
    do sib4
    la2 re4
    sib fa do'

    %131
    la re mib
    re2 sib4
    sib2 re4

    %134
    sib fa do'
    la re mib
    re2 sib4

    %137
    sib2. r4
    R1*7
    R2. r r4

    %146
    R1*15
    R2. r  re4

}

IIbcn = \relative do {

    sol2 sib4 sol
    re' re sol fa
    mi do fa mib

    %4
    re sib mib re
    do la re re,
    sol2. do4

    %7
    fa,2 fa'
    do dod
    re re,

    %10
    la' r4 re'
    si sol r do\mbreak
    la fa r si?

    %13
    sol mi la la,
    re,1
    R1*2

    %17
    r4 re' sol sol
    sol fad sib sib
    sib la8 sol la4 la

    %20
    la re, sol4. sol8
    sol2 fad4. mi16 fad
    sol2 r\mbreak

    %23
    re'1
    do
    sib

    %26
    la
    sol2 r8 do, mib do
    re do re mib fa mib fa re

    %29
    mib fa mib re mib re mib do
    sol' lab sol fa mib re mib do
    sol'4 sol, do'2~

    %32
    do8 do sib la sib4. lab8
    sol2 lab4 sol\mbreak
    fa re sol sol,

    %35
    do2 r8 fa la fa
    sol fa sol la sol la sib sol
    la fa sol la sib4. sib8

    %38
    sib2 la4. sol16 la
    sib2 r8 sib, re sib
    do sib do re do re mib do

    %41
    re do re mib re mib fa re
    mib re mib fa  mib fa sol mib
    fa2~fa8 mib re do

    %44
    sib do re mib fa4 fa,\mbreak
    sib2 r
    r mib^\markup\italic"Basson"

    %47
    sib' r
    r mib,
    sib r

    %50
    R1
    r2 sib
    fa r

    %53
    do''1\tu
    sib
    la

    %56
    sol
    fa2 r
    R1*5

    %63
    r4 fa re sib
    fa2 r4 sib'
    sol mib r la

    %66
    fa re r sol
    mi? do r fa\mbreak
    re sib r  mib

    %69
    do la re re,
    sol2 sib4 sol
    re'2 sib4 sol

    %72
    re'2 sib4 sol
    re'2 r
    r4 la re re

    %75
    re dod fa fa
    fa mi8 re mi4 mi
    mi la, re4. re8

    %78
    re2 dod4. sib16 dod\mbreak
    re2. re4
    sol2. sol,4

    %81
    re'2 r4 sol
    mi do r fa
    re sib mib re

    %84
    do la re re,
    sol sib do do,
    fa fa' sib2~

    %87
    sib la~
    la sol~
    sol fad\mbreak

    %90
    sol4 sol8 fa? mib fa mib re
    do4 do'8 sib la sib la sol
    re'4 do8 sib la sol fad mi

    %93
    re2 r8 sol sib sol
    la sol la sib la sib do la
    sib4 sol mib re

    %96
    do la re re,
    sol sib do do,
    fa fa' sib2~

    %99
    sib la~
    la sol~\mbreak
    sol fad

    %102
    sol4 sol8 fa? mib fa mib re
    do4 do'8 sib la sib la sol
    re'4 do8 sib la sol fad mi

    %105
    re2 re4
    sol do, re
    sol,2 sol4

    %108
    la fa la
    sib sib' lab
    sol la?2

    %111
    re, mib4
    fa fa, sib
    sib2\fermata sib4

    %114
    fa' re sol
    fa sib la
    sol la sib

    %117
    la2 dod4
    re sol, la
    re, fa, sol

    %120
    la la' re,
    re,2 re'4
    do do'2

    %123
    sib4 si do
    lab fa sol
    mib do2

    %126
    fa sib,4\mbreak
    mib mi2
    fad sol4

    %129
    re2 fad4
    sol fa! mib
    re sib do

    %132
    re re, sol
    sol2 fad'4
    sol fa! mib

    %135
    re sib do
    re re, sol
    sol2. sol4

    %138
    sol'2 fad
    mi re\mbreak
    do4 sol' fad sol

    %141
    re2. re4
    sol2 fad
    mi re

    %144
    dod4 re sol, la
    re, re'8 do si la re,2. r4
    r2 r4 re'

    %147
    sol8(la) sol4 sol8(la) sol4
    sol2. sol4
    do8(re) do4 do8(re) do4\mbreak

    %150
    do8(re) do4 si8(do) si4
    la8(si) la4 si8(do) si4
    do la si si,

    %153
    mi2. sol4
    do,2 sol'
    do sol

    %156
    do,4 sol' fad sol
    re2. re4
    sol2 fad

    %159
    mi re
    do4 do' re re,
    sol, re' sol sol,2. re'4

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    <4>4 <_+> s <4- 2>
    <6 5> <7> s <4\+ 2>
    <6 5> <7> s <6 4>
    <6 5> s <_+> s
    s2. <_!>4
    s1
    s2 <6 5>
    s1
    <_+>
    <6 5>4 <_!> s2
    <6 5> s
    <6 5> <_+>
    s1*4
    <4 2>4 <6> s2
    <4- 2>2 <6>
    <4\+ 2> <6->
    <6- 4\+ 2> <6 5>
    s1*2
    <6 _->2 <7 _->  %%%% fin qui bar 24
    s1
    <7>2 <6>
    <7 _!> s8 <_-> s4
    <7>2 <4\+ 2>
    s1
    <5 4>4 <_!> <6> s
    <6- 4> <5 _+> s2
    s8 <4-> s <6 5> s2
    <6- 5> <5 3>4 <6- 4>
    <6 5 _-> s <_!> s
    <7 _!>2 s4 <6>
    <7>2 <6->
    <5->1
    <4- 2>
    s
    <7->2 <5 _->
    <7> <5>
    <7> <5>4< 6->
    s2 s8 <6> s <_->
    s1*9
    <5 4>4 <3> <6 3> s
    <7>2 <6>
    <7> <6>
    <7> <6>
    s1*6
    s2 <6>
    s1
    <6->2 s4 <5->
    <6 5> <7> s2
    <6 5> s
    <6 5>4 <7> s2
    <6 5 _-> <_+>
    s <6>
    <5 4>4 <_+> <6> s
    <6 4> <5 _+> <6> s
    <6 4> <5 _+> s2
    s4 <_+> <6> s
    <4 2> <6> <6> s
    <4\+ 2>2 <6>
    <4 2> <6>
    <4 2> <6 5>
    <_-> s4 <_+>
    s1<5 4>4 <_+> s2
    s1
    <6  5>
    <6 5 _->2 <_->
    <7> s
    s1
    <4- 2>
    <4 2>2 <5 3>
    <4 2> <6 5>
    <_->4 <_!> <6> s8 <6\\>
    <_->4 <_!> <6> s
    <_+>2 <6\\>
    <7 _+> s4 <6>
    <7>2 <6\\>
    <6> <5 3>
    <6 5 _-> s
    <7>1
    s
    <4- 2>
    <4 2>2 <5 3>
    <4 2> <6 5>
    <_->4 <_!> <6> <6>
    <_-> <_!> <6> s
    <_+>2 <6\\>
    <7 _+>2 <8 _+>4
    s <_-> <_+>
    s2.
    <6>
    s2 <4 2>4
    <6-> <6 5->2
    <6>2.
    s2.*2
    s2 <6\\>4
    s2 <6>4
    <6> <6> <6>
    <_+>2 <6>4
    s2 <_+>4
    s <6> <6 5>
    s <_+> <_->
    s2.
    <4\+ 2>4 <4\+ 2>2
    <6>4 <6> <_->
    s <_-> <_!>
    <6> <_-> s
    s2.
    s4 <6> s
    <6 5>2.
    <_+>2 <6>4
    <6-> <6> s
    <_+> <6> <6 5 _->
    <6 4> <5 _+> s
    s2 <6>4
    <6-> <6> <6>
    <_+> <6> <6 5 _->
    <6 4> <5 _+> s
    <_->2. <_!>4
    s2 <4 2>
    <5 3> <6 4>
    s4 <3> <6 5> s
    <_+>1
    s2 <4 2>
    <5 3> <6 4>
    <6 5> <5>4 <_+>
    s2 <6>4
    s1*5
    <6>2 <6 4>
    <6 5> <6 4>
    <6> <4>4 <_+>
    s2. <5>4
    s1*2
    s2 <6 5>
    s1
    s2 <4 2>
    <5 3> <6 4>
    <7>1

}

forma = {

    \key fa\major
    \time 4/4
    \tempo 2 = 90
    s1*104
    \time 3/4
    \tempo 2 = 53
    s2
    \bar".|:"\break
    \once \override Score.RehearsalMark.extra-offset = #'(5 . +1.5)
    \mark\markup\huge {"[3.] en Loure" }
    s4
    \mark\markup\small {\musicglyph "scripts.segno" }
    s2.*7
    s2
    \bar":..:"\break
    s4
    s2.*19
    s2
    \bar":|."
    s4
    s2.*3
    \time 2/2
    s2.
    \key sol\major
    \tempo 1 = 55
    \repeat volta 2 {
        s4
        s1*7
    }
    \alternative {{\set Score.measureLength = #(ly:make-moment 3 4) s2.}{\set Score.measureLength = #(ly:make-moment 4 4) s2.}}
    \repeat volta 2 {
        s4 \set Score.currentBarNumber = #146
        s1*15
    }
    \alternative {{\set Score.measureLength = #(ly:make-moment 3 4) s2.}{ s2.}}
    \time 3/4
    \key fa\major
    \set Score.measureLength = #(ly:make-moment 1 4)
    s4
    \bar "||"
    \mark\markup\huge {\small\musicglyph "scripts.segno"}

}

IIobI = {
    \IIglobal
    \notypeset
    <<\IIobIn \forma>>

}

IIobII = {
    \IIglobal
    <<\IIobIIn \forma>>

}

IIvlaI = {
    \IIglobal
    <<\IIvlaIn \forma>>

}

IIvlaII = {
    \IIglobal
    \clef alto
    <<\IIvlaIIn \forma>>

}

IIbc = {
    \IIglobal
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


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza \terzine

}

IIIobIn =  \relative do'' {

    r4 re do la
    sib sol re'2~
    re4 do si do

    %4
    sol sol' fa re
    mib do sol'2~
    sol4 fad sol la

    %7
    re, mi! fa?2~
    fa4 mi mi fa
    fa2 r

    %10
    R1
    r4 fa mib do
    re fa sib, re

    %13
    sol fa mib re\mbreak
    do mib re do
    sib re do sib

    %16
    la sib fad sol
    re1~
    re4 re' do la

    %19
    sib sol' fa re
    mib do sol' sib
    la fad sol2

    %22
    fad4 sol do,2~
    do4 sib lab sol
    fad2 sol~

    %25
    sol4. la8 fad4. sol8
    sol4 re' sol la
    sib fad sol re\mbreak

    %28
    do4. sib8 la4 re
    sib sol sib re
    fa2. mib4

    %31
    re sib re fa
    sib2. do4
    la do fa, la

    %34
    sol4. fa8 fa4. mi8
    fa2. la4
    do,4. do8 do4 re8 la

    %37
    sib4 si do re
    dod  mi mi2~
    mi4 fa8 mi re2~

    %40
    re4 la' la2~
    la4 sib sol mi\mbreak
    dod4. dod8 re4 mi

    %43
    la, si dod re
    re2. dod4
    re la re do!

    %46
    si2 do4 re
    mib2 re4 si
    do2 re4 mib

    %49
    fa re mib8(re) mib4
    re r r si
    do2 re4 do

    %52
    si sol do sib!
    lab fa re'2~
    re4 si do re\mbreak

    %55
    mib4 re re4. do8
    do4 mib sol mib
    do sib sib la8 sib

    %58
    la4 fa sib re
    sol, sib do re
    mib2. fa4

    %61
    re fa sol la
    sib re, mib fa
    sol do, do2~

    %64
    do4 la sib mib
    re4. do8 do4. sib8
    sib4 re do\tr sib

    %67
    fa'2. mib4
    re fa sib la\mbreak
    sol fa mi!2~

    %70
    mi4 mi la sol
    fad re la sib
    sol2. sol4

    %73
    do re sib8(la) sib4
    la fad' sol re
    mib si do mi

    %76
    fa do re la
    sib fad sol re'
    do sib8(la) la4. sol8

    %79
    sol4 sib\dolce la sol
    re' fad sol re
    mib si do mi

    %82
    fa do re la
    sib fad sol re'
    do sib8(la) la4. sol8

    %85
    sol1\fermata

}

IIIobIIn =  \relative do'' {

    sib2 la
    sol4 sib la fad
    sol2 re'4 mib

    %4
    re do2 si4
    do mib re sib
    do2 sib4 la

    %7
    sib2 do4 la
    sol sib sib la
    la do sib sol

    %10
    la do fa, la
    sib2. la4
    sib fa sol la

    %13
    sib2 la4 sib\mbreak
    la2 la'
    re,4 sol fad sol

    %16
    re2. sib'4
    fad la re, fad
    sol2. fad4

    %19
    sol si, do re
    do mib re2
    mib4 re2 do4~

    %22
    do sib2 la4
    re, re' mib2~
    mib4 re do sol

    %25
    sib4. do8 la4. sol8
    sol2 r
    R1*18

    %45
    r2 r4 la
    sol sol2 si4
    do sol' lab sol

    %48
    fa mib re do~
    do si do8 si do4
    si sol' sol2~

    %51
    sol4 fa fa2~
    fa4 re mib2~
    mib4 re fa lab

    %54
    si, re sol, si\mbreak
    do do si4. do8
    do2 r

    %57
    R1*9
    r2 r4 re
    do la sib do

    %68
    sib do re fa\mbreak
    mi2. re4
    do2 r4 dod

    %71
    re la fad re
    mib re mib sol~
    sol fad sol8(fad) sol4

    %74
    fad la sol2~
    sol4 sol mib sol
    lab do sib la

    %77
    re,2 sol
    fad4 sol fad4. sol8
    sol2. sib4

    %80
    la re sib si
    sol sol mib sol
    lab do sib la

    %83
    re,2 sol
    fad4 sol fad4. sol8
    sol1\fermata

}

IIIvlaIn = \relative do''{

    sol2 fad
    re2. la'4
    sol2 fa4 sol

    %4
    sol mib re2
    do4 sol' sol sib
    la2 re,4 re

    %7
    re sol fa do
    do2 do
    do4 la' sol mi

    %10
    fa la la do
    fa, re mib fa
    fa fa re fa

    %13
    sol sib mib, fa\mbreak
    fa2 la
    sol4 sol la re,

    %16
    re sol la sib
    la fad fad la
    sol sib la la

    %19
    sol sol do sol
    sol do re sib
    do la sol2

    %22
    la4 sol sol la
    sol2 do4 sib
    la2 sol

    %25
    re re4 re
    re2. fad4
    sol do re sol,\mbreak

    %28
    sol4 sol sol fad
    sol2. sib4
    sib re sib la

    %31
    sib2. do4
    re2 do4 do
    do do la la

    %34
    re sib la sol
    la la do do
    la sol la fad

    %37
    sol sol sol la
    la dod dod mi
    la, do! sib sib

    %40
    la2. re4
    re2. sib4\mbreak
    la la la sol

    %43
    la2 sol4 la
    la2 la
    la2. fad4

    %46
    re2 mib4 fa
    sol2 fa4 re
    do2 fa4 sol

    %49
    fa sol sol sol
    sol2 r4 re'
    do lab lab lab

    %52
    sol sol lab mib
    fa2 lab4 re
    sol,2 sol4 sol\mbreak

    %55
    sol lab sol4. sol8
    sol2. sol4
    sol fa sol mi!

    %58
    fa2 fa4 fa
    mib fa la sib
    do sib la do

    %61
    sib sib mib mib
    re sib sib sib
    sib la sib la

    %64
    sol fa fa la
    sib sib sib la
    fa2. fa4

    %67
    la do sib la
    fa fa sol la\mbreak
    do2. sol4

    %70
    la2 la~
    la4 fad fad re
    do re do re

    %73
    mib re re re
    re re re fa
    mib re do do

    %76
    do fa fa re
    re re sib re
    fad re re4. re8

    %79
    re2. re4
    fa la sol sol
    mib re do do

    %82
    do fa fa re
    re re sib re
    fad re re4. re8

    %85
    re1\fermata

}

IIIvlaIIn = \relative do' {

    re4 sib do2
    sib4 sib re re
    sib mib fa do

    %4
    re mib fa sol
    sol mib sib re
    do2 re4 re

    %7
    sib2 la4 la
    do2 sol'
    fa mi

    %10
    do4 do do mib
    re re do do
    sib la sib fa'

    %13
    sib, re mib sib\mbreak
    do la re2  %%%%%%%%%%%%% OK
    re4 sib do re

    %16
    la re re2~
    re4 re la' do,
    re sib do re

    %19
    re re fa re
    sol sol sol sol
    la re do sol

    %22
    re sol mi re
    re2 do4 sol'
    re2 sol,4 mib'

    %25
    sib2 re4 re
    sib2. re4
    re fad re re\mbreak

    %28
    mib sol re re
    re2. sol4
    fa fa fa la

    %31
    fa2. fa4
    sol sol sol mi
    fa mi fa fa

    %34
    re re do do
    do do fa do
    re2 re4 re

    %37
    re re mi fa
    mi mi mi dod
    fa fa fa fa

    %40
    re2. re4
    sib'2. sol4
    mi mi fa dod

    %43
    re2 mi4 fa
    fa2 mi
    fa2. re4

    %46
    re2 do4 si
    mib do re sol,
    do2 lab4 do

    %49
    re re do do
    re2 r4 sol
    mib fa re re

    %52
    re mib do mib
    do re re re
    re re do si\mbreak

    %55
    mib fa re sol
    mib2. do4
    do re do do

    %58
    do la sib sib
    sib sib mib fa
    fa sol do, fa

    %61
    fa fa sib, fa'
    sib, fa' sol sib
    sol fa mib fa

    %64
    do do sib do
    fa sol fa fa
    re2. re4

    %67
    fa la sol fa
    fa fa sib, do\mbreak
    do2. re4

    %70
    mi mi re mi
    fad2. sol4
    sol sol sol, sib

    %73
    do la sol sol
    la la sib sol
    sol sol do sib

    %76
    fa' fa re re
    sib la sol sol
    la sib re la

    %79
    sib2. re4
    re re sol, sol
    sol sol do sib

    %82
    fa' fa re re
    sib la sol sol
    la sib re la

    %85
    sib1\fermata

}

IIIbcn = \relative do {

    sol1~
    sol4 sol' fa re
    mib2 re4 do

    %4
    si do re sol,
    do do' sib sol
    la2 sol4 fad

    %7
    sol2 la4 fa?\mbreak
    do'2 do,
    fa1~

    %10
    fa4 fa mib do
    re sib do fa
    sib, re sol fa

    %13
    mib re do sib
    fa'2 fad
    sol4 sib la sol

    %16
    fad sol re2~\mbreak
    re4 re' do la
    sib sol la re,

    %19
    sol sol, la si
    do do' sib sol
    do, re mib2

    %22
    re4 mib mi fad
    sol2 do,
    re\mbreak mib4 do

    %25
    re do re re,
    sol2. re'4
    sol la sib si

    %28
    do do, re re,
    sol2. sol'4
    re sib re fa

    %31
    sib2. la4
    sol fa mi do\mbreak
    fa la re, fa

    %34
    sib, sol do do,
    fa fa' la fa
    fad mi fad re

    %37
    sol fa! mi do
    la la' sol mi
    fa la sib sib,

    %40
    fa'2. fad4\mbreak
    sol2. sol4
    la sol fa mi

    %43
    fa2 mi4 re
    la' sol la la,
    re2. re4

    %46
    sol fa mib re
    do  mib fa sol
    lab sol fa mib\mbreak

    %49
    re sol do, do,
    sol'2 r4 sol'
    lab lab, re fa

    %52
    sol do lab sol
    fa2. fa4
    sol fa mib re

    %55
    do fa sol sol,
    do2. do'4
    mi, re mi do\mbreak

    %58
    fa mib re sib
    mib re do sib
    la sol fa la

    %61
    sib re mib fa
    sol sib sol re
    mib fa sol fa

    %64
    mib fa\mbreak re do
    sib mib fa fa,
    sib2. sib'4

    %67
    la fa sol la
    sib la sol fa
    do'2. sib4

    %70
    la sol fa mi
    re2. sol4
    mib si do sib\mbreak

    %73
    la re sol sol,
    re' do sib si
    do sol' lab sol

    %76
    fa la! sib fad
    sol re mib sib
    la sol re' re,

    %79
    sol2. sol'4\mbreak
    fad re mib sol
    do, sol' lab sol

    %82
    fa la! sib fad
    sol re mib sib
    la sol re' re,

    %85
    sol1\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  <7\\ 4 2->1
  <5 3>4 s <6> <_+>
  <7> <6> <6\\ 5-> <_->
  <6> <_-> <7> <_!>
  <_-> s <6> s
  <7> <6\\> s <6>
  <5> <6> <6> s\mbreak
  <5 4>2 s
  <5 3> <7 4 2>
  <5 3> <4 2>4 <6 _->
  <6>2 <7 _->
  s4 <5 3> s <6>
  s <6> <6 _-> s
  s2 <6>
  s <6\\>
  <6> <5 _+>4 <6 4>\mbreak
  <_+>2 <4\+ 2>4 <6\\>
  <6>2 <7>4 <_+>
  <_-> <_!> <6> <6>
  <_-> s <6> s
  <6 _-> <_+> <7> <6>
  <5 3> <6 5> <6 5> <5 4>8 <3>
  <5 4>4 <3> <_-> <6->
  <9 _-> <8 _+>\mbreak <6> <6 5 _->
  <6 4> s s <5 _+>
  s2. <_+>4
  s <6\\> <6> <6>
  <_-> s <5 4> <_+>
  s1
  <6>
  s2. <6>4
  s <4 2> <6 5> s\mbreak
  s <5 3> s <5 3>
  <6 5> s <6 4> <5 3>
  s2 <6>
  <6 5> s
  <_->4 <4\+ 2> <6> s
  <_+> s <6  4\+> <6\\>
  <7> <6> s s
  <6>2. <6>4\mbreak
  <9 3>4 <8 3> s <6>
  <_+> <4\+ 2> <6> <6\\>
  <6> <4\+> <6\\> s
  <6 4>2 <5 _+>
  <_-> s4 <_+>
  <_!> <4\+ 2> <6> <6\\>
  <_-> <6> <6 _-> <_!>
  <6> <6- 4> <6 _-> <6>\mbreak
  <7> <_!> <_-> s
  <_!>2 s4 <_!>
  <7> <6> <8 5-> <5 _->
  <7 _!> <_-> <5- 3> <6->
  <7- _->2 <6>4 <6 _->
  <_!> <4\+ 2> <6> <6\\>
  <_-> <6 5 _-> <_!> s
  <_->1
  <6>2 <5->\mbreak
  s4 <4 2> <6> s
  s <6> <6 _-> s
  <6 5-> <6-> <3> s
  s <6> s <7->
  <5 3> s <6-> <6>
  s2 <6- 4 3>
  <6 5>\mbreak <6>4 <6>
  s1
  s
  <6>2 <7>4 <6 5->
  s <6> <6\\> s
  s2. <6>4
  <6> <6> <6> <6\\>
  <_+>2. <_->4
  <6> <6> < _-> <6>\mbreak
  <7> <_+> s s
  <_+> <4\+ 2> <6> s
  s <_!> <5- 3> <6\\>
  <_-> <6> s <6>
  s <_+> s <6>
  <6\\>2 <_+>
  s1\mbreak
  <6>4 <_+> <5 3> <_!>
  <_-> <_!> <5 3> <6\\>
  <_-> <6> s <6>
  s <_+> s <6>
  <6\\> s <_+> s
  <_->1

}

forma = {

  \key fa\major
  \time 4/4
  \tempo 4 = 70
  s1*85
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

IIIvlaI = {
  \IIIglobal
  <<\IIIvlaIn \forma>>

}

IIIvlaII = {
  \IIIglobal
  \clef alto
  <<\IIIvlaIIn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzine

}

IVobIn =  \relative do'' {

    sol'16 re re re sib' re,
    la' re, re re la' re,
    sib' re, re re sib' re,

    %4
    sol do, do do sol' do,
    la' do, do do la' do,
    fa sib, sib sib fa' sib,

    %7
    sol' sib, sib sib sol' do,
    fad re mi fad sol fad
    sol la fad8. sol16

    %10
    sol4 r8
    R4.
    re8 fa la

    %13
    dod, mi la\mbreak
    re, fa la
    si, re sol

    %16
    do,? mi sol
    la, do fa
    sib, re sol

    %19
    sol8. la16 fa mi
    fa sol mi8. re16
    re mi fad sol mi fad

    %22
    sol fad sol la fad sol
    la sol la sib sol la
    sib8 r r

    %25
    re, r r
    re r r\mbreak
    do r r

    %28
    do r r
    sib r r
    sib r sol

    %31
    la4 sol8
    mib' la, re
    sib16 sol32 la sib16 do re mi

    %34
    fa8 r r
    sol,16 mib32 fa sol16 la sib do
    re sib32 do re16 fa re fa

    %37
    do la32 sib do16 fa do fa
    re sib32 do re16 fa re fa\mbreak
    sol sib sib sol sol mib

    %40
    mib? sol sol mib! mib do
    do8. do16 re mib
    fa sol do,8. sib16

    %43
    sib re sol fa sol fa
    mi! mi la sol la sol
    fa re32 mi fa16 la fa la

    %46
    mi dod32 re mi16 la mi la
    fa re32 mi fa16 la fa la
    mi dod32 re mi16 la mi la

    %49
    fa la, la la fa' la,\mbreak
    mi' la, la la mi' la,
    fa' la, la la fa' la,

    %52
    re sol, sol sol re' sol,
    mi' sol, sol sol mi' sol,
    do fa, fa fa do' fa,

    %55
    re' fa, fa fa re' sol,
    dod la si dod re dod
    re mi dod8. re16

    %58
    re la re fa re fa
    dod la32 si dod16 mi dod mi
    re la re fa re fa\mbreak

    %61
    si, sol32 la si 16re si re
    do sol do mib do mib
    si sol32 la si 16re si re

    %64
    do8 r r
    sol' r r
    sol r r

    %67
    fa r r
    fa r r
    mib r r

    %70
    mib4 re8~\mbreak
    re16 si do re mib re
    mib fa  re8 sol

    %73
    mib16 sol32 fa mib16 re do sib
    la8 r r
    sib16 fa'32 mib re16 do sib la

    %76
    sol sol'32 fa mib16 re do sib
    la la'32 sol fa16 mib re do
    sib8 r sol

    %79
    do r fad,
    re' r sol,\mbreak
    sib r mi,

    %82
    do' r fa,
    lab r re,
    sib' r sol

    %85
    re'8. la'16 sib la
    sol la fad8. sol16
    do,8. sol'16 la sol

    %88
    fa sol mi8. fa16
    sib,8. fa'16 sol fa
    la,8. mib'16 fa mib

    %91
    sol,8. re'16 mib re\mbreak
    fad,8. do'16 re do
    sib re re re sib' re,

    %94
    la' re, re re la' re,
    sib' re, re re sib' re,
    sol do, do do sol' do,

    %97
    la' do, do do la' do,
    fa sib, sib sib fa' sib,
    sol' sib, sib sib sol' do,

    %100
    fad re mi fad sol fad
    sol la fad8. sol16
    sol sol,32 la sib16 re sib re\mbreak

    %103
    la fad32 sol la16 re la re
    sib sol32 la sib16 re sib re
    mib sol sol mib mib do

    %106
    do mib mib do do la
    la8. la16 sib do
    re mib la,8.[sol16]

    %109
    sol4 r8
    r16 re' re sib sib sol
    sol4 r8

    %112
    r16 re' re sib sib sol
    sol4 r8\mbreak
    r16 re' re sib sib sol

    %115
    sol4 r8
    r16 sol' sol mib mib do
    do mib mib do do la

    %118
    la fad32 sol la16 re la re
    sib sol32 la sib16 re sib re
    la fad32 sol la16 re la re

    %121
    sib do la8.[sol16]
    sol8 sib sib
    sib re re

    %124
    re sol sol\mbreak
    sol4.\fermata

}

IVobIIn =  \relative do'' {

    sol8 sib re
    fad, la re
    sol, sib re

    %4
    mi, sol do
    fa, la do
    re, fa sib

    %7
    mib, sol sib
    do8. re16 sib la
    sib do la8. sol16

    %10
    sol la si do la si
    dod si dod re si dod
    re la la la fa' la,

    %13
    mi' la, la la mi'la,\mbreak
    fa' la, la la fa' la,
    re sol, sol sol re' sol,

    %16
    mi' sol, sol sol mi' sol,
    do fa,fa fa do' fa,
    re' fa, fa fa re' sol,

    %19
    dod la si dod re dod
    re mi dod8. re16
    re8 la16 sib sol la

    %22
    sib la sib do la sol
    fad mi fad sol mi fad
    sol8 r r

    %25
    la r r
    sol r r\mbreak
    sol r r

    %28
    fa r r
    fa r r
    mib r sol

    %31
    re la' sib
    sol re re
    re r r

    %34
    la'16 fa32 sol la16 sib do re
    mib8 r r
    fa,16 fa sib re sib re

    %37
    la fa32 sol la16 do la do
    sib fa sib re sib re\mbreak
    mib sol sol mib mib do

    %40
    do mib mib do do la
    la8. la16 sib do
    re mib la,8.[sib16]

    %43
    sib8 re re
    do mi! mi
    re16 la re fa re fa

    %46
    dod la32 si dod16 mi dod mi
    re la re fa re fa
    dod la32 si dod16 mi dod mi

    %49
    re8 r r\mbreak
    la' r r
    la r r

    %52
    sol r r
    sol r r
    fa r r

    %55
    fa r re
    mi4 la8
    sib mi, la

    %58
    fa16 re32 mi fa16 la fa la
    mi dod32 re mi16 la mi la
    fa re32 mi fa16 la fa la\mbreak

    %61
    re, si32 do re16 sol re sol
    mib do32 re mib16 sol mib sol
    re si32 do re16 sol  re sol

    %64
    mib sol, sol sol mib' sol,
    re' sol, sol sol re' sol,
    mib' sol, sol sol mib' sol,

    %67
    do fa, fa fa do' fa,
    re' fa, fa fa re' fa,
    sib mib, mib mib sib' mib,

    %70
    do' mib, mib mib do' fa,\mbreak
    si sol la si do si
    do re si8. do16

    %73
    do8 r r
    do16 do32 sib la16 sol fa mib
    re8 r r

    %76
    mib r sol
    fa r la
    sol sib re

    %79
    fad, la re
    sol, sib re\mbreak
    mi, sol do

    %82
    fa, la do
    re, fa sib
    mib, sol do~

    %85
    do16 la re8. re16
    mib8 la,8. sol16
    sol8 do8. do16

    %88
    re8 sol,8. fa16
    fa8 sib8. sib16
    mib do re mib la,8

    %91
    re16 sib do re sol,8\mbreak
    do sib16 la sol fad
    sol8 sib re

    %94
    fad,la re
    sol, sib re
    mi, sol do

    %97
    fa, la do
    re, fa sib
    mib, sol do

    %100
    do8. re16 sib la
    sib do la8. sol16
    sol re sol sib sol sib\mbreak

    %103
    fad re32 mi fad16 la fad la
    sol re sol sib sol sib
    do mib mib do do la

    %106
    la do do la la fad
    fad?8. fad16 sol la
    sib sol fad8. sol16

    %109
    sol re' re sib sib sol
    sol8 r r
    r16 re' re sib sib sol

    %112
    sol4 r8
    r16 re' re sib sib sol\mbreak
    sol4 r8

    %115
    r16 sol' sol mib mib do
    do mib mib do do la
    la do do la la fad

    %118
    fad? re32 mi fad!16 la fad la
    sol re sol sib sol sib
    fad re32 mi fad16 la fad la

    %121
    sol la fad8. sol16
    sol8 sol sol
    sib re re

    %124
    sib re re\mbreak
    re4.\fermata

}

IVvlaIn = \relative do''{

    R4.*23
    sol8 sib re
    fad, la re

    %26
    sol, sib re\mbreak
    mi, sol do
    fa, la do

    %29
    re, fa sib
    mib, sol do
    do8. re16 sib la

    %32
    sib do la8. sol16
    sol8 sol sib
    la la la

    %35
    sib sib sib
    sib fa16 sib fa sib
    fa8 fa16 la fa la

    %38
    fa8 fa16 sib fa sib\mbreak
    sib mib mib do do \parenthesize la
    la do do la la fa

    %41
    fa8. fa16 fa la
    sib sol la8[fa]
    fa sol sol

    %44
    sol la la
    la r r
    la r r

    %47
    la r r
    la r r
    la re r\mbreak

    %50
    la dod r
    la re r
    sol, si r

    %53
    sol do r
    fa, la r
    fa sib r

    %56
    la4 la8
    mi mi re
    re la'16 la la la

    %59
    la8 la16 la la la
    la8 la16 la la la\mbreak
    sol8 sol16 sol sol sol

    %62
    sol8 sol16 sol sol sol
    sol8 sol16 sol sol sol
    sol8 do r

    %65
    sol si r
    sol do r
    fa, la r

    %68
    fa sib r
    mib, sol r
    mib lab r\mbreak

    %71
    sol4 sol8
    sol sol sol
    sol sol sol

    %74
    la la la
    fa fa fa
    sol sol sol

    %77
    la la la
    re, sol r
    la fad r

    %80
    re sol r\mbreak
    sol mi r
    do fa r

    %83
    fa re r
    sib mib r
    re la' sol

    %86
    mib re re
    sol sol fa
    re do do

    %89
    re re sol
    la8. la16 la8
    sol8. sol16 sol8\mbreak

    %92
    fad8. fad16 re8
    re sol r
    la fad r

    %95
    re sol r
    sol mi r
    do fa r

    %98
    fa re r
    sib mib sol
    la8. la16 la8

    %101
    sol re re
    re8 re16 re re re\mbreak
    re8 re16 re re re

    %104
    re8 re16 sol re sol
    sol do do sol sol mib
    mib? sol sol mib! mib  re

    %107
    re8. re16 re fad
    sol mib re8 re
    re r r

    %110
    re r r
    re r r
    re r r

    %113
    re r r\mbreak
    re r r
    mib16 mib' mib do do sol

    %116
    sol do do sol sol mib
    mib? sol sol mib! mib re
    re8 re16 re re re

    %119
    re8 re16 re re re
    re8 re16 re re re
    re mib re8. re16

    %122
    re8 re re
    re sol sol
    sol sib sib\mbreak

    %125
    sib4.\fermata

}

IVvlaIIn = \relative do' {

    R4.*23
    sol'16 re re re sib' re,
    la' re, re re la' re,

    %26
    sib' re, re re sib' re,\mbreak
    sol do, do do sol' do,
    la' do, do do la' do,

    %29
    fa sib, sib sib fa' sib,
    sol' sib, sib sib sol' do,
    fad re mi fad sol fad

    %32
    sol la fad8. sol16
    sol8 sol sol
    do, do fa

    %35
    sol sol sol
    fa fa16 fa fa fa
    fa8 fa16 fa fa fa

    %38
    fa8 fa16 fa fa fa\mbreak
    mib8 mib mib
    mib? mib sol

    %41
    do,8. do16 sib la
    fa' mib mib8 mib
    re si si

    %44
    do dod dod
    re r r
    la' r r

    %47
    re, r r
    la' r r
    fa re fa\mbreak

    %50
    la mi dod
    fa re fa
    sol re si

    %53
    mi do mi
    fa do la
    re sib sol'

    %56
    mi4 re8
    sib' la la
    la fa16 fa fa fa

    %59
    la8 la16 mi la mi
    fa8 fa16 fa fa fa\mbreak
    sol8 sol16 re sol re

    %62
    mib8 mib16 mib mib mib
    sol8 sol16 re sol re
    mib8 do mib

    %65
    sol re si
    mib do mib
    fa do la

    %68
    re sib re
    mib sib sol
    do lab fa'\mbreak

    %71
    re4 do8
    do re re
    do do mib

    %74
    do do do
    re re re
    sib sib do

    %77
    do do re
    re r r
    do r r

    %80
    sib r r
    sib r r
    la r r

    %83
    lab r r
    sol r r
    la!8. la16 re do

    %86
    sib do la8 la
    do8. do16 do sib
    la sib sol8 sol

    %89
    sib sib sib
    do do fa
    sib, sib mib\mbreak

    %92
    la, la re
    sol, r sol'
    fad r fad

    %95
    sol r sol
    mi r mi
    fa r fa

    %98
    re r re
    mib r mib
    la, re sol,

    %101
    mib' re do
    sib sib16 sib sib sib\mbreak
    re8 re16 la re la

    %104
    sib8 sib16 sib sib sib
    sol8 do do
    do do mib

    %107
    la,8. la16 sol fad
    sib do la8 re
    sib r r

    %110
    sib r r
    sib r r
    sib r r

    %113
    sib r r\mbreak
    sib r r
    sol16 do' do sol sol mib

    %116
    mib do do mib! mib la,
    mib' do do mib mib la,
    la8 re16 re re re

    %119
    sib8 re16 re re re
    re8 re16 re re re
    re do la8 re

    %122
    sib re re
    re sib sib
    sib sol sol\mbreak

    %125
    sol4.\fermata

}

IVbcn = \relative do {

    sol'8 r r
    re r r
    sol r r

    %4
    do, r r
    fa r r
    sib, r r

    %7
    mib r mib
    re4 mib8
    do re re,

    %10
    sol sol' fa
    mi! la sol
    fa r r

    %13
    la, r r\mbreak
    re r r
    sol, r r

    %16
    do r r
    fa, r r
    sib r sib'

    %19
    la4 sib8
    sol la la,
    re r r

    %22
    R4.*2
    sol8 r r
    re r r

    %26
    sol r r\mbreak
    do, r r
    fa r r

    %29
    sib, r r
    mib r mib
    re4 mib8

    %32
    do re re,
    sol' sol, sol'
    fa fa, fa'

    %35
    mib mib, mib'
    sib sib16 sib sib sib
    fa'8 fa16 fa fa fa

    %38
    sib,8 sib16 sib sib sib\mbreak
    mib8 mib mib
    mib mib mib

    %41
    fa8. mib16 re do
    sib mib fa8 fa,
    sib4 r8

    %44
    R4.*5
    re8 fa la\mbreak
    dod, mi la

    %51
    re, fa la
    si, re sol
    do, mi sol

    %54
    la, do fa
    sib, re sol
    sol4 fa8

    %57
    sol la la,
    re re16 re re re
    la'8 la16 la la la

    %60
    re,8 re16 re re re\mbreak
    sol8 sol16 sol sol sol
    do,8 do16 do do do

    %63
    sol'8 sol16 sol sol sol
    do,8 mib sol
    si, re sol

    %66
    do, mib sol
    la, do fa
    sib, re fa

    %69
    sol, sib mib
    lab, do fa\mbreak
    fa8. fa16 mib re

    %72
    do8 sol' sol,
    do do, do'
    fa fa, fa'

    %75
    sib sib, sib'
    mib, mib, mi'
    fa fa, fad'

    %78
    sol16 re re re sib' re,
    la' re, re re la' re,
    sib' re, re re sib' re,\mbreak

    %81
    sol do, do do sol' do,
    la' do, do do la' do,
    fa sib, sib sib fa' sib,

    %84
    sol' sib, sib sib sol' do,
    fad re mi fad sol8
    do, re re,

    %87
    mi'!16 do re mi fa8
    sib, do do,
    re'16 sib do re mib re

    %90
    do la sib do re do
    sib sol la sib do sib\mbreak
    la fad sol la sib la

    %93
    sol8 r r
    re r r
    sol' r r

    %96
    do, r r
    fa r r
    sib, r r

    %99
    mib r mib
    re4 mib8
    do re re,

    %102
    sol sol16 sol sol sol\mbreak
    re'8 re16 re re re
    sol,8 sol16 sol sol sol

    %105
    do8 do do
    do do do
    re re'16 do sib la

    %108
    sol do re8 re,
    sol, r r
    sib r r

    %111
    do r r
    re r r
    mib r r\mbreak

    %114
    sib r r
    do do do
    do do do

    %117
    do do do
    re re16 re re re
    sol,8 sol16 sol sol sol

    %120
    re'8 re16 re re re
    sol do, re8 re,
    sol16 sol' sol re re sib

    %123
    sol sol' sol re re sib
    sol sol' sol re re sib\mbreak
    sol4.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <_+>
    s
    <_!>
    s
    s
    <7>4 <6>8
    <_+>4.
    <_->8 <_+> s
    <_-> <_!> s
    <6> <_+> <4\+ 2>
    <6> s s
    <_+> s s
    s4.
    <_!>
    <_!>
    s
    s4 <6>8
    <7 _+>4.
    s8 <_+>4
    s4.*4
    <_+>4.
    s
    <_!>
    s
    s
    <7>4 <6>8
    <7 _+>4.
    <_->
    s4.*7
    <6>4.
    s4 <6>16 <6 _->
    s4.*7
    s8 <6> <6 4>
    <6> <6 4> <_+>
    s <6> <6 4>
    <6 > <6\\ 4> <_! 3>
    s <6> <6 4>
    <6> <6 4> s
    s <6> <5 3>
    <4\+ 2>4 <6>8
    s <_+>4
    s4.
    <_+>
    s
    <_!>
    <_->
    <_!>
    <_->8 <6> <6- 4>
    <6> <6\\ 4> <_!>
    <_-> <6> <6 4>
    <6> <6 4> s
    s <6> <6 4>
    <6-> <6 4-> s
    s <6-> <_->
    <4\+ 2> s <6>16 <6\\>
    <_->8 <_!> s
    <_->4.
    s
    s
    s4 <6>8
    s4 <6>8
    s <6 4> <6>
    <6\\> s <6\\>
    <6> <6 4> <6>
    <6\\ _->4 <6>8
    <6> <6> <6>
    <6 _->4 <6>8
    <6-> <6 4-> <6 4->
    <6 5>4.
    <_->
    <6 5>
    s
    <6>
    <6>
    <6>
    <6\\>4 <6>16 <6\\>
    s4.
    <_+>
    s
    <_!>
    s
    s
    <7>8 s <6>
    <7 _+> s s
    <_-> <_+>4
    s4.
    <_+>
    <_->
    <_->
    <6 _->
    <_+>4 <6>16 <6\\>
    s <_-> <_+>4
    s4.
    <6>
    <9 7 5>
    <6 4>
    <7>
    <6>
    <_->
    s
    <6 5 _->
    <_+>
    s
    <_+>
    s
    s4 <6 4>8
    s4 <6 4>8
    s4 <6 4>8

}

forma = {

    \key fa\major
    \time 3/8
    \tempo 4. = 60
    s4.*125
    \bar"|."

}

IVobI = {
    \IVglobal
    %\notypeset
    <<\IVobIn \forma>>

}

IVobII = {
    \IVglobal
    <<\IVobIIn \forma>>

}

IVvlaI = {
    \IVglobal
    <<\IVvlaIn \forma>>

}

IVvlaII = {
    \IVglobal
    \clef alto
    <<\IVvlaIIn \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge \column{"[1.] Grave et détaché"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautb[ois] &""Violini 1"}
                \IobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautb[ois] &""Violini 2"}
                \IobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \new Voice   {
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \time 3/2\override Staff.TimeSignature.style = #'numbered \key fa\major  s8^\markup\center-align"Viola 1"}
                    \clef violin
                    \key fa\major
                    \set Staff.midiInstrument = #"viola"
                    \IvlaI
                }
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola 2"}
                \IvlaII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Bassono &""Cembalo"}
            \Ibc

        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

\pageBreak

\markup\huge \column{"[2.] Allegro"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \new Voice   {
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \time 3/2\override Staff.TimeSignature.style = #'numbered \key fa\major }
                    \clef violin
                    \key fa\major
                    \set Staff.midiInstrument = #"viola"
                    \IIvlaI
                }
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvlaII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIbc

        >>
    >>

    \layout {

        indent = 1\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

\pageBreak

\markup\huge \column{"[4.] Grave"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIIobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \new Voice   {
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \time 3/2\override Staff.TimeSignature.style = #'numbered \key fa\major }
                    \clef violin
                    \key fa\major
                    \set Staff.midiInstrument = #"viola"
                    \IIIvlaI
                }
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIIvlaII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIIbc

        >>
    >>

    \layout {

        indent = 1\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

\pageBreak

\markup\huge \column{"[5.] Allegro"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IVobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IVobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \new Voice   {
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \time 3/2\override Staff.TimeSignature.style = #'numbered \key fa\major }
                    \clef violin
                    \key fa\major
                    \set Staff.midiInstrument = #"viola"
                    \IVvlaI
                }
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IVvlaII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IVbc

        >>
    >>

    \layout {

        indent = 1\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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
