\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

tasto =_\markup\italic "T.S."

solo = ^\markup \italic { Solo }

dolce =_\markup\italic"Doux"

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.6

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

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



mbreak = { }


Iglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

Ivln = \relative do'' {

    sol8
    do[sol do re]
    mib8.[re16 do8 si]
    do r sol' r

    %4
    sol,[sol'16 fa mib8 re]
    do do, r sol''
    sol[fa16 mib re8 fa]

    %7
    mib re4 fa8
    mib re4 fa8
    mib do r do

    %10
    lab' [lab lab lab]
    lab16 fa sol lab sib,8 lab'\mbreak
    sol[sol sol sol]

    %13
    sol16 mib fa sol lab,8 sol'
    fad[(do si do)]
    fad[(do si do)]

    %16
    fad[(do si do)]
    sol'[fa?16 mib re8 do]
    re4 si\tr

    %19
    do r8 sol
    do[sol do sol]
    do16 re mib re do8 si

    %22
    do[sol do sol]
    do16 re mib re do8 si\mbreak
    do[fa, sol sol,]

    %25
    do4 r
    R2*10
    r4 r8 re'

    %37
    sib'[sib sib sib]
    sib16 sol la sib do,8 sib'
    la[la la la]

    %40
    la16 fa sol la sib,8 la'
    sol[sol sol sol]
    fad[(do si do)]

    %43
    fad[(do si do)]
    sol'[fa!16 mib re8 do]
    sib4 la

    %46
    sib r
    R2*2
    r4 r8 re

    %50
    sib'[sib sib sib]
    sib16 sol la sib do,8 sib'\mbreak
    la[la la la]

    %53
    la16 fa sol la sib,8 la'
    sol[sol sol sol]
    sol16 mib fa sol do,8 fa

    %56
    fa[fa fa fa]
    fa16 mib re do sib8 lab
    sol4 r

    %59
    R2*2
    r4 r8 sib
    mib[sib mib fa]

    %63
    sol8.[fa16 mib8 re]
    mib r sib' r
    sib,8[sib'16 lab sol8 fa]

    %66
    mib r sib' r
    sib,4 r8 sib
    mib[mib mib mib]

    %69
    fa,4 r8 do'
    fa[fa fa fa]
    sol,4 r8 re'

    %72
    sol[mib do lab]
    fa'[fa fa fa]
    mib8.[re16 do8 do,]

    %75
    sol[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']

    %78
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']\mbreak
    sol,[sol' sol, sol']

    %81
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    do[sol do re]

    %84
    mib8.[re16 do8 do]
    lab'[lab lab lab]
    lab16 fa sol lab si,8 lab'

    %87
    sol[sol sol si,]
    do[sol do sol]
    do16 re mib re do8 si

    %90
    do[sol do sol]
    do16 re mib re do8 si
    do[sib!16 lab sol8 fad]

    %93
    sol[la?16 si do8 re16 mib]
    fa8 re si8. do16
    do8[sol do re]

    %96
    sol,4 r
    R2
    r4 r8 do

    %99
    lab'[lab lab lab]
    lab16 fa sol lab sib,8 lab'
    sol[sol sol sol]

    %102
    sol16 mib fa sol lab,8 sol'
    fad[(do si do)]
    fad[(do si do)]

    %105
    sol'[fa!16 mib re8 do]
    re4 si\tr
    do8[sol do sol]\mbreak

    %108
    do16 [re mib re do8 si]
    do[fa, sol sol,]
    do2\fermata

}

IvlIn = \relative do'' {

    r8
    r4 r8 sol
    do[sol do re]
    mib8.[re16 do8 si]

    %4
    do r sol' r
    sol,[sol'16 fa mib8 re]
    mib[re16 do si8 re]

    %7
    do si4 re8
    do si4 sol8
    mib'[mib mib mib]

    %10
    mib16 do re mib fa,8 mib'
    re[re re re]\mbreak
    re16 sib do re mib,8 re'

    %13
    do[do do do]
    do2~
    do~

    %16
    do
    re4 r8 mib,
    fa4 re\tr

    %19
    mib r8 sol
    do[sol do sol]
    do16 re mib re do8 si

    %22
    do[sol do sol]
    do16 re mib re do8 si\mbreak
    do[fa, sol sol,]

    %25
    do4 r
    R2*11
    r4 r8 sol'

    %38
    mib'[mib mib mib]
    mib16 do re mib fa,8 mib'
    re[re re re]

    %41
    re16 sib do re mib,8 re'
    do2~
    do

    %44
    sib4 r8 la
    sol4 fad
    sol r

    %47
    R2*15
    r4 r8 sib
    mib[sib mib fa]

    %64
    sol8.[fa16 mib8 re]
    mib r sib' r
    sib,[sib'16 lab sol8 fa]

    %67
    mib4 r
    R2*5
    si8[si si si]

    %74
    sol4. do,8
    sol[sol' sol, sol']
    sol,[sol' sol, sol']

    %77
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']\mbreak

    %80
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']

    %83
    sol4. si8
    sol2
    R2*2

    %87
    r4 r8 si
    do[sol do sol]
    do16 re mib re do8 si

    %90
    do[sol do sol]
    do16 re mib re do8 si
    do[sib!16 lab sol8 fad]

    %93
    sol[la?16 si do8 re16 mib]
    fa8 re si8. do16
    do8[sol do re]

    %96
    sol,4 r
    r r8 sol
    mib'[mib mib mib]

    %99
    mib16 do re mib fa,8 mib'
    re[re re re]
    re16 sib do re mib,8 re'

    %102
    do[do do do]
    do2~
    do

    %105
    re4 r8 mib,
    fa4 re\tr
    do'8[sol do sol]\mbreak

    %108
    do16 [re mib re do8 si]
    do[fa, sol sol,]
    do2\fermata

}

Ivlan = \relative do' {

    r8
    R2
    r4 r8 sol
    do[sol do re]

    %4
    mib8.[re16 do8 si]
    do r sol' r
    sol,4 r8 si

    %7
    sol16 la si do re8 si
    sol16 la si do re8 si
    sol sol'4 mib8

    %10
    do do4 lab8
    fa fa'4 re8\mbreak
    sib sib4 sol8

    %13
    mib' mib4 do8
    lab'2~
    lab~

    %16
    lab
    si,4 r8 sol
    lab4 sol

    %19
    sol r8 sol'
    do[sol do sol]
    do16 re mib re do8 si

    %22
    do[sol do sol]
    do16 re mib re do8 si\mbreak
    do[fa, sol sol,]

    %25
    do4 r
    R2*11
    r8 re4 sib8

    %38
    sol sol'4 mib8
    do do4 la8
    fa fa'4 re8

    %41
    sib sib4 sib'8
    la2~
    la4. fad8

    %44
    re4 r8 fad
    re mib  la, re
    re4 r

    %47
    R2*3
    r8 sol16[la sib8 sol]
    do,4 r\mbreak

    %52
    r8 fa16[sol la8 fa]
    sib,4 r
    r8 mib16[ fa sol8 mib]

    %55
    lab,4 r
    R2*7
    r4 r8 sib

    %64
    mib[sib mib fa]
    sol8.[fa16 mib8 re]
    mib[mib16 fa sol8 lab]

    %67
    sol[sol, sol sol]
    lab4. lab8
    la![la la la]

    %70
    sib4. sib8
    si[si si si]
    do4 fa

    %73
    re8[re re re]
    do4. do8
    sol[sol' sol, sol']

    %76
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']

    %79
    sol,[sol' sol, sol']\mbreak
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']

    %82
    sol,[sol' sol, sol']
    mib4. sol8
    sol2

    %85
    R2*10
    mib4. fa8
    mib4 r

    %97
    R2
    sol,8 sol'4 mib8
    do do4 lab8

    %100
    fa fa'4 re8\mbreak
    sib sib4 sol8
    mib' mib4 do8

    %103
    lab'2~
    lab
    si,4 r8 sol

    %106
    lab4 sol
    do'8[sol do sol]\mbreak
    do16 [re mib re do8 si]

    %109
    do[fa, sol sol,]
    do2\fermata

}

Ivocen = \relative do'' {

  \autoBeamOff
  r8
  R2*24
  r4 r8 sol
  do [sol] do[re]

  %27
  mib8. re16 do8 si
  do8[re16 mib re8] do
  si8. la16 sol8 sol

  %30
  do mib do sib
  lab8. sol16 fa8 do'
  re fa re do

  %33
  si8. la16 sol8 mib'
  re[do16 sib la8] sol
  re'[fad,] sol[do]

  %36
  sib4(la8.) sol16
  sol4 r
  R2*7

  %45
  r4 r8 re'
  sol,[re] sol[la]
  sib8. la16 sol8 fad

  %48
  sol16[la sib do re8] mib8
  fad,8. sol16 la4
  r r8 sol

  %51
  mib' mib mib mib\mbreak
  mib16[do] re[mib] fa,8 mib'
  re re re re

  %54
  re16[sib] do[re] mib,8 re'
  do[re16 do] fa[mib re do]
  re8.[do16] sib4

  %57
  r r8 re
  mib[sib lab sib]
  mib[sib lab sib]

  %60
  mib[re16 do sib8] lab
  sol mib' fa,8.\tr mib16
  mib2

  %63
  R2*3
  r4 r8 sib'
  sib16[lab sib do] sib[do lab sib]

  %68
  do[sib do re] do[re mib re]
  do[sib do re] do[re sib do]
  re[do re mib] re[mib fa mib]

  %71
  re[do re mib] re[mib do re]
  mib8[re16 mib fa mib] re[do]
  si8. la16 sol4

  %74
  r r8 mib'
  re mib re mib16 do
  si8. la16 sol8 mib'

  %77
  re mib re mib16[do]
  si8. la16 sol8 re'
  mib16 [re mib fa] mib8[fa]\mbreak

  %80
  re16[do re mib] re8[mib]
  do16[si do re] do8[re]
  si8.[la16] sol4

  %83
  r r8 sol
  mib' mib mib mib
  mib16[do] re[mib] fa,8 mib'

  %86
  re re re re
  re16[si] do[re] sol,8 si
  do[sol do sol]

  %89
  do16[re mib re] do8[si]
  do[sol do sol]
  do16[re mib re] do8[si]

  %92
  do[sib!16 lab sol8] fad
  sol[la?16 si do8 re16 mib] fa8 re si8. do16
  do4 r8 lab

  %95
  sol[la?16 si do re] mib[fa]
  sol8 do, si8.\tr do16
  do4 r

  %98
  R2*11
  r2\fermata

}

Itesto = \lyricmode {

    Lauda - te, pueri,  _ _ lauda - te Dominum: _ _  lauda - te nomen _ Domini _ _ lauda - te nomen _ Domini _ _
    lau -- da -- te no -- men Do -- mini _
    Lauda - te, pueri,  _ _ lau -- da -- te Dominum: _ _  lauda - te nomen _ Domini _ _ lauda - te nomen _ Domini _ _
    lauda - - - te. Lauda - - - te nomen _ Domini _ _ lauda - - - - - - - - - - - te pueri _ _
    lauda - te pueri _ _ Dominum _ _  lau -- da -- te no -- men Do -- mini _
    lauda - - - - - - - te
    Lauda -  te nomen _ Domini _ _  lauda -  te nomen _ Domini _ _  lauda - - - - - - - te no - men Domini _ _
    lauda - te nomen _ Domini. _ _

}

Ibcn = \relative do {

    r8
    R2*2
    r4 r8 sol
    do[sol do re]

    %5
    mib8.[re16 do8 si]
    do r sol' r
    sol,[sol' sol, sol']

    %8
    sol,[sol' sol, sol']
    do,[do16 re mib8 do]
    fa[fa16 sol lab8 fa]

    %11
    sib,[sib16 do re8 sib]\mbreak
    mib[mib16 fa sol8 mib]
    lab,2~

    %14
    lab~
    lab~
    lab

    %17
    sol4 r8 do
    fa4 sol
    do, r8 sol'

    %20
    do[sol do sol]
    do16 re mib re do8 si
    do[sol do sol]

    %23
    do16 re mib re do8 si\mbreak
    do[fa, sol sol,]
    do4 r

    %26
    do4. si8
    do4. sol'8
    mib4 fa

    %29
    sol4. fa8
    mib[re mib do]
    fa4. fa8

    %32
    fa[mib fa re]
    sol4. fad8
    sol4 la8 sib

    %35
    fad[re mib do]
    re4 re,
    sol8[sol'16 la sib8 sol]

    %38
    do,[do16 re mib8 do]
    fa[fa16 sol la8 fa]
    sib,[sib16 do re8 sib]

    %41
    mib[mib16 fa sol8 sol]
    re2~
    re

    %44
    sol,4 r8 re'
    sol[do, re re,]
    sol4 r8 re'

    %47
    sol[re sol la]
    sib4. do8
    re[re,16 mi fad8 re]

    %50
    sol4 r
    r8 do,16[re mib8 do]\mbreak
    fa4 r

    %53
    r8 sib,16[do re8 sib]
    mib4 r
    lab,2

    %56
    sib8[sib16 do re8 do]
    sib[sib16 do re8 sib]
    mib,4 r

    %59
    sol r
    sol re'
    mib16 fa sol lab sib8 sib,\mbreak

    %62
    mib,4 r
    mib' r
    r r8 sib

    %65
    mib[sib mib \parenthesize fa]
    sol8.[fa16 mib8 re]
    mib4 r

    %68
    R2*5
    sol,8[sol sol sol]
    do2

    %75
    R2*8
    do8[mib16 re do8 si]
    do[do16 re mib8 do]

    %85
    fa[fa16 sol lab8 fa]
    si,[si16 do re8 do]
    si[la si sol]

    %88
    do4 do
    do4. sol8
    do4 do

    %91
    do4. sol8
    do4~do16 mib re do
    si8[sol mib' do]

    %94
    fa4 sol
    do,4. si8
    do4 r

    %97
    do16 re mib fa sol8 sol,
    do[do16 re mib8 do]
    fa[fa16 sol lab8 fa]

    %100
    sib,[sib16 do re8 sib]
    mib[mib16 fa sol8 mib]
    lab,2~

    %103
    lab~
    lab
    sol4 r8 do

    %106
    fa4 sol
    do8[sol do sol]\mbreak
    do16 re mib re do8 si

    %109
    do[fa, sol sol,]
    do2\fermata

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s2*2
  s4 s8 <_!>
  s2*3
  <6 4>8 <5 3!> s <7 5>
  <6 4> <5 3!> s <7 5>
  s2
  <7 _->
  <7->
  <7>
  <7>
  <6+>
  s
  s
  <_!>
  s2*11
  <_!>2
  s
  <_->
  <6>
  <_!>4 s8 <7>
  s2
  s
  <6 4>4 <5 3+>
  s2
  <7>
  <7>
  <7>
  s
  <7 _+>
  s
  s4 s8 <7 _+>
  s2*6
  <7>2
  <7>
  <7>
  <7>
  <7>
  s
  s4 s8 <7->
  s2
  s
  s4 <6 5->
  s2*24
  <7 _->2
  <7->
  <6>
  s
  s4 s8 <_!>
  s2
  s
  s4 s8 <_+>
  s2
  s
  s4 s8 <7->
  s2*3
  <7 _->2
  <7->
  <7>
  <7>
  <6+>
  s
  <_!>

}

forma = {

  \time 2/4
  \key sib\major
  \tempo 2 = 60
  \partial 8 s8
  s2*110
  \bar "||"

}


Ivl = {
  \Iglobal
  \notypeset
  <<\Ivln\forma>>
}

IvlI = {
  \Iglobal
  <<\IvlIn\forma>>
}

Ivla = {
  \Iglobal
  \clef alto
  <<\Ivlan\forma>>
}

Ivoce = {
  \new Voice = "laudate"
  \Iglobal
  %\clef soprano
  <<\Ivocen\forma>>
}



Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn\forma\Ibfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IIvln = \relative do'' {

    R2.*2
    lab8 lab lab lab lab lab
    fa' fa fa fa fa fa

    %5
    sib, sib reb reb reb reb
    do do mib mib mib mib
    re re mib mib mib mib

    %8
    mib mib mib mib re re
    mib4 r r
    R2.

    %11
    sib8 sib sib sib sib sib
    sib sib sib sib sib sib\mbreak
    do do do do do do

    %14
    re re re re re re
    mib mib mib mib mib re
    mib sib sib sib sib sib

    %17
    do do do do do do
    do do do do reb reb
    reb? reb do do do do

    %20
    do do sib sib sib sib
    sib sib sib sib sib sib
    lab lab lab lab reb[reb]

    %23
    re! re re re re re
    mib! mib mib mib mib mib
    re do16 sib la8 la la la

    %26
    sib4 r r\mbreak
    R2.
    re8 re re re re re

    %29
    si si re re re re
    do do do do do do
    do do do do do do

    %32
    sib sib sib sib sib sib
    sib sib sib sib sib sib
    do do do do do do

    %35
    lab lab lab lab lab[lab]
    sol sol sol sol sol sol
    mib' reb16 do sib8 sib sib sib

    %38
    do4 r r
    R2.
    re8 re re re re re\mbreak

    %41
    mib mib sib sib sib sib
    do do do do do do
    sib sib sib sib sib sib

    %44
    do do do do do do
    sib sib sib sib mib[mib]
    mib mib mib mib re re

    %47
    mib mib fa fa fa fa
    sib, mib mib mib re re
    mib2.\fermata

}

IIvlIn = \relative do'' {

    R2.
    fa,8 fa fa fa fa fa
    fa fa fa fa fa fa

    %4
    sib sib sib sib sib sib
    sol sol sib sib sol sol
    mib mib do'[do] fa, fa

    %7
    fa fa solb solb solb solb
    fa fa fa fa fa fa
    sol4 r r

    %10
    fa8 fa fa fa fa fa
    fa fa fa fa fa fa
    mib mib mib mib sol sol\mbreak

    %13
    mib mib fa fa fa fa
    fa fa fa fa fa sib
    sib sol sol sol fa fa

    %16
    sol sol sol sol sol sol
    sol sol sol sol sol sol
    lab lab lab lab lab lab

    %19
    sib sib sol sol sol sol
    lab lab fa fa fa fa
    sol sol mi mi do' do

    %22
    do do do do lab[lab]
    sol sol sol sol sol sol
    do do do do la? [la]

    %25
    sib la16 sol fad8 fad fad fad
    sol4 r r\mbreak
    lab8 lab lab lab lab lab

    %28
    lab? lab lab lab lab lab
    sol sol sol sol sol sol
    sol sol sol sol sol sol

    %31
    lab lab lab lab lab lab
    fa fa fa fa fa fa
    sol sol sol sol sol sol

    %34
    mib mib mib mib mib mib
    fa fa fa fa sib[sib]
    sib sib sib sib sib sib

    %37
    do sib16 lab sol8 sol sol sol
    mib4 r r
    sib8 sib sib sib sib sib

    %40
    sib' sib sib sib fa fa\mbreak
    sib[sib] mib, mib mib mib
    mib mib mib mib mib mib

    %43
    mib mib mib mib mib mib
    mib mib mib mib mib mib
    fa fa fa fa solb[solb]

    %46
    sol! sol fa fa fa fa
    sol sol lab lab lab lab
    sol sol fa fa fa fa

    %49
    sol2.\fermata

}

IIvlan = \relative do' {

    mib8 mib mib mib mib mib
    mib8 mib mib mib mib mib
    mib8 mib mib mib mib mib

    %4
    re re re re re re
    mib8 mib mib mib mib mib
    lab, lab la la la la

    %7
    lab lab la la la la
    sib sib sib sib sib sib
    mib mib mib mib mib mib

    %10
    mib mib mib mib mib mib
    re re re re re re
    mib mib mib mib mib mib\mbreak

    %13
    lab, lab la la la la
    sib sib sib sib sib sib
    mib mib sib sib sib sib

    %16
    mib mib mib mib mib mib
    mi mi mi mi mi mi
    fa fa fa fa fa fa

    %19
    mib mib mib mib mib mib
    reb reb reb reb reb reb
    do do do do do do

    %22
    fa fa fa fa fa fa
    fa fa fa fa fa fa
    fad fad fad fad fad fad

    %25
    sol[do,] re re re re
    sol sol sol sol sol sol\mbreak
    sol sol sol sol sol sol

    %28
    fa fa fa fa fa fa
    fa fa fa fa fa fa
    mib mib mib mib mib mib

    %31
    re re re re re re
    re re re re re re
    mib mib mib mib mib mib

    %34
    lab, lab lab lab lab lab
    reb reb reb reb reb reb
    mib mib mib mib mib mib

    %37
    lab,[reb] mib mib mib mib
    lab, lab lab lab lab lab
    lab? lab lab lab lab lab

    %40
    lab? lab lab lab lab lab\mbreak
    sol sol sol sol sol sol
    lab lab lab lab lab lab

    %43
    sol sol sol sol sol sol
    lab lab lab lab lab lab
    lab? lab lab lab la la

    %46
    sib sib sib sib sib sib
    mib mib mib mib re re
    mib mib lab, lab sib sib

    %49
    mib,2.\fermata

}

IIvocen = \relative do'' {

  \autoBeamOff

  R2.*8
  sib4 mib mib,
  lab4. lab8 lab4

  %11
  sib fa' lab,
  lab? sol r8 mib'\mbreak
  do4 fa,4. mib'8

  %14
  re [do] sib4 r8 lab
  sol lab16 sib sol4(fa8.) mib16
  mib2 r4

  %17
  sol4 do4. sib8
  lab8.[sol16] fa4 reb'8 sib
  sol8. fa16 sol4 do8 lab

  %20
  fa4 r8 sib sol lab16 fa
  mi8[reb' do sib lab sol]
  lab[fa lab do reb fa]

  %23
  si,[sol si re fa re]
  mib[do la? do mib do]
  sib [la16 sol] fad4. sol8

  %26
  sol2 r4\mbreak
  sol4 do fa
  si,4. do8 si4

  %29
  re sol,4. si8
  do8. [si16] do4 r
  r lab do\mbreak

  %32
  sib4. do8 sib do16 lab
  sol8[mib sol sib mib sib]
  do[mib do lab mib solb]

  %35
  fa[lab reb fa reb sib]
  sol[mib sol sib reb sib]
  do[sib16 lab] sol4.\tr lab8

  %38
  lab?2 r4
  R2.
  r4 re sib\mbreak

  %41
  mib4. reb8 do reb16 sib
  do4 r8 lab16[sib do8 re16 mib]
  sib8[sol sib mib sib sol]

  %44
  do4 r8 lab16[sib do8 re16 mib]
  re8[sib re fa] mib4~
  mib8 sol, fa4.\tr mib8

  %47
  mib2.
  R
  r\fermata

}

IItesto = \lyricmode {

    Sit nomen _ Domini _ _  sit bene -- dic - tum, ex hoc nunc et usque _ et usque _ in sae -- cu -- lum
    sit bene - dic -- tum nomen _ Domini _ _ ex hoc nunc et usque _ in sae - - - - - cu -- lum.
    Sit nomen _ Domini _ _  sit bene - dic -- tum, ex hoc nunc et usque _ in sae - - - - - cu -- lum
    ex hoc nunc et usque _ in sae - - - - - - - - cu -- lum.

}

forma = {

  \time 3/4
  \key sib\major
  \tempo 4 = 60
  s2.*49
  \bar "||"

}


IIvl = {
  \IIglobal
  \notypeset
  <<\IIvln\forma>>
}

IIvlI = {
  \IIglobal
  <<\IIvlIn\forma>>
}

IIvla = {
  \IIglobal
  \clef alto
  <<\IIvlan\forma>>
}

IIvoce = {
  \new Voice = "sit"
  \IIglobal
  %\clef soprano
  <<\IIvocen\forma>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f

}

IIIvln = \relative do'' {

    sol8_\markup\italic"Unis[o]ni" sol sol
    sol16 la sib do re  mib
    fad, sol la sib do re

    %4
    sib8 la sol
    sol fa16 mib re do
    sib8 la sol

    %7
    sol16 la sib8 do
    re4 r8
    re' sol sib

    %10
    mib,, re do
    do' fa la
    re,, do sib

    %13
    sib' mib sol
    do,, sib la
    la' do fad

    %16
    sol fa!16 mib re do
    sib8 la sol
    sol fa16 mib re do

    %19
    sib8 la sol
    do' re re,
    sol4.

    %22
    sol8 sol sol
    sol16 la sib do re  mib
    fad, sol la sib do re

    %25
    sib8 la sol
    re' do16 sib la sol
    fad8 mi? re

    %28
    r r re'\mbreak
    mib16 re mib do fa mib
    re8 r sib

    %31
    do16 sib do la re do
    sib8 la sol
    mib' re dod

    %34
    re dod16 si la8
    mib' re dod
    re dod16 si la8

    %37
    fa' dod8. re16
    re8 re re
    re16 mi fa sol la sib

    %40
    dod, re mi fa sol la
    fa8 mi re
    re do16 sib la sol

    %43
    fa8 mi re
    re16 mi fa8 sol
    la4 fa'8

    %46
    mi16 fa sol8 fa
    mi16 fa sol8 fa
    mi16 fa sol8 fa

    %49
    mi mi, dod
    la4 re8
    dod16 re mi8 re

    %52
    dod16 re mi8 re
    dod16 re mi8 re
    dod4 la'8

    %55
    re16 do re la sib do
    sib8 r sol\mbreak
    do16 sib do sol la sib

    %58
    la8 r fa
    sib16 la sib fa mib fa
    sol8 r16 sol la sib

    %61
    do sib do sol fa sol
    la8 r16 la sib do
    re do re la sol la

    %64
    sib8 r16 sib do re
    mib re mib do re mib
    la,8. sol16 fa8

    %67
    sib la16 sol fa mib
    re8 do sib
    sib16 do re8 mib

    %70
    fa4 fa8
    mib' mib mib
    mib re16 do re8

    %73
    sib do8. sib16
    re8 fa sib
    mib,,  re do

    %76
    do' fa la
    re,, do sib
    sib' mib sol

    %79
    la, sol fa
    sol16 la sib8 re,
    mib re do

    %82
    re16 mib fa8 la,
    sib4 re'8
    sib la sol\mbreak

    %85
    sol16 la sib do re mib
    fad, sol la sib do re
    sib8 la sol

    %88
    sol fa16 mib re do
    sib8 la sol
    re'' do16 sib la sol

    %91
    fad8 mi? re
    re' do16 sib la sol
    fad8 mi re

    %94
    re' sol sib
    mib,, re do
    do' fa la

    %97
    re,, do sib
    sib' mib sol
    do,, sib la

    %100
    la' do fad
    sol re, sol,
    r r re''

    %103
    sib16 do re mib fa sol
    la, sib do re mib fa
    sol, la sib do re mib

    %106
    fad, sol la sib do re
    sib8. la16 sol8
    mib' re do

    %109
    re fad, sol~
    sol16 do la8.\tr sol16
    sol8 sol sol\mbreak

    %112
    sol16 la sib do re8
    mib la,8. sol16
    sol8 sol sol

    %115
    sol16 la sib do re mib
    fad, sol la sib do re
    sib8 la sol

    %118
    sol' fa16 mib re do
    sib8 la sol
    sol fa16 mib re do

    %121
    sib8 la sol
    do' re re,
    sol,4.\fermata

}

IIIvlan = \relative do' {

    sib8 sib sib
    sib4 la8
    la4 fad'8

    %4
    re4.
    sol8 fa16 mib re do
    sib8 la sol

    %7
    sol16 la sib8 do
    re4 r8
    sol4 r8

    %10
    mib re do
    fa4 r8
    re do sib

    %13
    mib4 r8
    do sib la
    fad'4 r8

    %16
    re4.
    re
    sol8 fa16 mib re do

    %19
    sib8 la sol
    do' re re,
    sol4.

    %22
    R4.*16
    fa8 fa fa
    fa4 mi8

    %40
    mi?4 dod'8
    la4.
    re8 do16 sib la sol

    %43
    fa8 mi re
    re16 mi fa8  sol
    la4 re,8

    %46
    la'4 re,8
    la'4 re,8
    la'4 re,8

    %49
    la' mi dod
    la4 r8
    R4.*16

    %67
    sib'8 la16 sol fa mib
    re8 do sib
    sib16 do re8 mib

    %70
    fa4 r8
    R4.*3
    fa4 r8

    %75
    mib re do
    fa4 r8
    re do sib

    %78
    mib4 r8
    la sol fa
    sol16 la sib8 re,

    %81
    mib re do
    re16 mib fa8 fa,
    sib4 r8

    %84
    R4.*4
    sol'8 fa16 mib re do
    sib8 la sol

    %90
    R4.*2
    re''8 do16 sib la sol
    fad8 mi re

    %94
    R4.
    mib8 re do
    R4.

    %97
    re8 do sib
    R4.
    do8 sib la

    %100
    fad'4.
    re8 re sol,
    R4.*9

    %111
    sol'8 sol sol\mbreak
    sol4 r8
    R4.

    %114
    sib,8 sib sib
    sib4 la8
    la4 fad'8

    %117
    re4.
    re
    re

    %120
    sol8 fa16 mib re do
    sib8 la sol
    do' re re,

    %123
    sol,4.\fermata

}

IIIvocen = \relative do'' {

    \autoBeamOff
    R4.*21
    sol8 sol sol
    sol16 [la sib do re  mib]
    fad, [sol la sib do re]

    %25
    sib8 [la] sol
    re' do16 [sib] la sol
    fad8 [mi?] re

    %28
    r r re'\mbreak
    mib16 [re mib do fa mib]
    re8 r sib

    %31
    do16 [sib do la re do]
    sib8 [la sol]
    mib' [re dod]

    %34
    re [dod16 si la8]
    mib' re dod
    re [dod16 si la8]

    %37
    fa' dod8. re16
    re4.
    R4.*6
    r8 r re8

    %46
    dod16[re mi8] re
    dod16[re mi8 re]
    dod16[re mi8 re]

    %49
    dod4 r8
    r r fa,
    mi16[fa] sol8 fa

    %52
    mi16[fa sol8 fa]
    mi16[fa sol8 fa]
    mi4  la8

    %55
    re16 [do re la sib do]
    sib8 r sol\mbreak
    do16 [sib do sol la sib]

    %58
    la8 r fa
    sib16 [la sib fa mib fa]
    sol8 r16 sol [la sib]

    %61
    do [sib do sol fa sol]
    la8 r16 la [sib do]
    re [do re la sol la]

    %64
    sib8 r16 sib [do re]
    mib [re mib do re mib]
    la,8. sol16 fa8

    %67
    R4.*3
    r8 r fa8
    mib' mib mib

    %72
    mib [re16 do re8]
    sib8 do8. sib16
    sib4.

    %75
    R4.*8
    r8 r re
    sib [la] sol\mbreak

    %85
    sol16 [la sib do re mib]
    fad, [sol la sib do re]
    sib8 [la] sol

    %88
    R4.*2
    re'8 do16 [sib] la sol

    %91
    fad8 [mi?] re
    R4.
    r8 r re'

    %94
    sib16[la sib do re sib]
    do[sib do re mib do]
    la[sol la sib do la]

    %97
    sib[la sib do re sib]
    sol[fad sol la sib sol]
    la[sol la sib do la]

    %100
    fad[sol la sib do la]
    sib8. la16 sol8
    r r re'

    %103
    sib16 [do re mib fa sol]
    la, [sib do re mib fa]
    sol, [la sib do re mib]

    %106
    fad, [sol la sib do re]
    sib8. la16 sol8
    mib' [re do]

    %109
    re [fad,] sol~
    sol16 [do] la8.\tr sol16
    sol4.\mbreak

    %112
    sol16 [la sib do re8]
    mib la,8. sol16
    sol4.

    %115
    R4.*9

}

IIItesto = \lyricmode {

    A so -- lis or - - tu usque _ ad occa - sum, lauda - - - - - - - - bile _ no -- men Domini. _ _
    A so -- lis or - tu usque _ ad occa - - sum, lauda - - - - - - - - - - - - - - - - - bile _ lauda - bile _ no -- men Domini. _ _
    A so -- lis or - - tu usque _ ad occa - sum, lauda - - - - - - - - bile _ lauda - - - - - bile _ no -- men Domini _ _
    no - men Domini. _ _

}

IIIbcn = \relative do {

    sol'8 sol sol
    sol4 do,8
    re fad re

    %4
    sol re sol,
    sol' fa16 mib re do
    sib8 la sol

    %7
    sol16 la sib8 do
    re4 r8
    sib4 r8

    %10
    mib re do
    la4 r8
    re do sib

    %13
    sol4 r8
    do sib la
    re4 r8

    %16
    sib8 do16 re mi fad
    sol8 re sol,
    sol' fa16 mib re do

    %19
    sib8 la sol
    do' re re,
    sol,4.
    sol'8 sol sol

    %23
    sol4 do,8
    re fad re
    sol re sol,

    %26
    sib4 do8
    re4.
    sib'8 la sol\mbreak

    %29
    do la4
    sib8 la sol
    la fad4

    %32
    sol8 re sol,
    sol'4 la8
    fa4.

    %35
    sol4 la8
    fa4.
    re8 la' la,

    %38
    re' re re
    re4 sol,8
    la dod la

    %41
    re la re,
    re' do16 sib la sol
    fa8 mi re

    %44
    re16 mi fa8 sol
    la4 r8
    R4.*3

    %49
    la8 mi dod
    la4 re8
    la4 re8

    %52
    la4 re8
    la4 re8
    la la' sol

    %55
    fad4 re8
    sol la sib\mbreak
    mi,4 do8

    %58
    fa sol la
    re,4 r8
    mib16 fa sol8 fa

    %61
    mi4 r8
    fa16 sol la8 sol
    fad4 r8

    %64
    sol16 la sib8 sol
    do,4.
    fa

    %67
    sib8 la16 sol fa mib
    re8 do sib
    sib16 do re8 mib

    %70
    fa16 sol la8 fa
    la16 sib do8 la
    sib sib, r

    %73
    sib fa' fa,
    sib4 r8
    mib re do

    %76
    la4 r8
    re do sib
    sol'4 r8

    %79
    la sol fa
    sol16 la sib8 re,
    mib re do

    %82
    re16 mib fa8 fa,
    sib sib'16 la sol fad
    sol8 re sol,\mbreak

    %85
    sol'4 do,8
    re fad re
    sol re sol,

    %88
    sol' fa16 mib re do
    sib8 la sol
    sol8. la16 sib do

    %91
    re4.
    re'8 do16 sib la sol
    fad8 mi? re

    %94
    sol4 r8
    mib re do
    R4.

    %97
    re8 do sib
    R4.
    do8 sib la

    %100
    re4 re8
    sol re sol,
    re'16 mi fad8 re

    %103
    sol4 r8
    fa4 r8
    mib4 r8

    %106
    re4 r8
    sol4.
    do

    %109
    fad,8 re sib
    mib do re
    sol sol sol\mbreak

    %112
    sol4 r8
    do, re re,
    sol' sol sol

    %115
    sol4 do,8
    re fad re
    sol re sol,

    %118
    sib do16 re mi fad
    sol8 re sol,
    sol' fa16 mib re do

    %121
    sib8 la sol
    do' re re,
    sol,4.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s4.*2
    <_+>4.
    s4.*11
    <7 _+>4.
    s4.*8
    <_+>4.
    s
    s
    <_+>
    s4.*5
    s4 <_+>8
    s4.*6
    <_+>4.
    s4.*4
    <_+>4.
    s
    s
    s
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    s4 <7>8
    s4.*15
    <6 5>4.
    <5 4>8 <3> s
    s4.*18
    <_+>4.
    s4.*8
    <_+>4.
    s4.*5
    <_+>4.

}

forma = {

    \time 3/8
    \key sib\major
    \tempo 4. = 60
    s4.*123
    \bar "||"

}


IIIvl = {
    \IIIglobal
    \notypeset
    <<\IIIvln\forma>>
}

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan\forma>>
}

IIIvoce = {
    \new Voice = "solis"
    \IIIglobal
    %\clef soprano
    <<\IIIvocen\forma>>
}



IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn\forma\IIIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IVglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IVvocen = \relative do'' {

  \autoBeamOff
  r8
  R1*4
  r4 r8 la^\markup\italic"Ad[agi]o" re2~
  re8 la\fermata r dod^\markup\italic"And[an]te"  re fa16[mi] re8 dod\mbreak

  %7
  re la re, la' re mi16 [fa] mi8 re
  dod8. si16 la4 r8 la la la
  re4(mi8.) fa16 sol,8[mi'] r16 do[re mi]

  %10
  fa,8[re']  r16 sib[do re] mi,8 [do'] r16 sib[la sol]
  la[fa la sib] do [la re mi] fa8. fa,16 fa4
  sib2~sib8[do16 re do8 sib]

  %13
  la sol16 fa mi4 fa r\mbreak
  r8 do' do do re do16 [sib] re8 mi
  fa fa, fa fa sib16 [la] sol[la] sib [re] do[sib]

  %16
  la8. sol16 fa8 la re re re re
  re16[si mi8] r16 re[do si] do[la re8] r16 do[si la]
  sold[la la si] si[do do re] re8 [do16 si] mi [re do si]

  %19
  do8 si16 la sold4 la r\mbreak
  r8 si si si si la16[sold] la8 [si]
  re[mi16 fa mi8 re] dod[si16 la] re8[do?]

  %22
  sib? la16 sol fad4 sol r
  r r8 la sib sol si8. si16
  do8 sol dod8. dod16 re8 mi16[fa] mi8 re

  %25
  dod8. si16 la4 r2
  r8 la la la sib16[sol do8] r16 sib[la sol]
  la[fa sib8] r16 la[sol fa] sol[mi la8] r16 sol[fa mi]\mbreak

  %28
  fa16[sol sol la] la [si si dod] dod8 si16[la] fa'8[mi16 re]
  dod[la] re si dod4 re sol,16[la sib? sol]
  la8 fa'16 re dod4 re2

  %31
  R1
  R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IVtesto = \lyricmode {

    Excel - sus excelsus _ _ super _ omnes  _ super _ omnes _ gentes _ Dominus, _ _ et super _  cae -- los glo - - - - - - - - ria _
    glo  - ria _ ejus. _
    Excel - sus super _ omnes  _ gentes _ super _ omnes _ gentes _ Dominus, _ _ et super _  cae -- los glo - - - - - - - - ria _ eius _
    et super _  cae -- los glo - - - -  ria _ ejus. _
    Excel - sus super _ omnes  _ super _ omnes _ gentes _ Dominus, _ _ et super _  cae - - - - - - - - los glo - ria _ eius _
    glo - ria _ eius. _

}

IVbcn = \relative do {

    la'8
    re[re,16 mi fa8 sol] la la, r la'
    sib16 sol do8 r16 sib la sol la fa sib8 r16 la sol fa
    sol mi la8 r16 sol fa mi fa re re' la re la re la

    %4
    re do32 sib la sol fa mi re16[do32 sib la sol fa mi] re8 re' la' la,
    re,4 r^\markup\italic"Ad[agi]o" r2
    r4 r8 la''^\markup\italic"And[an]te"  re[re,16 mi fa8 sol16 la]\mbreak

    %7
    fa8 re4 do8 sib4 sol
    la'8 mi la, sol' fa re r la'
    fa re re re sib'16 sol do8 r16 sib la sol

    %10
    la fa sib8 r 16 la sol fa sol mi la8 r16 sol fa mi
    fa4. sib,8 la[fa'16 sol la8 fa]
    sol fa mi re do4 mi

    %13
    fa8 sib, do[\clef tenor do'] fa[fa,16 sol la8 sib]
    \clef bass do do, do'2 sib4
    la fa2 mi4

    %16
    fa8.[sol16 la8 fa] re do si la
    sold sold' mi sold la fa re la'
    mi'16 re32 do si la sold fad mi16[re32 do si la sold fad] mi8 mi' sold mi

    %19
    la re, mi mi la[la,16 si do8 re]
    mi4. mi8 re4 do
    si sold sol fad

    %22
    sol8 do re re sol[sol,16 la sib8 do]
    re[re16 mi fad8 re] sol4 fa
    mi la8 sol fa4 sol

    %25
    la r8 la re[re,16 mi fa8 sol]
    la la, r fa' sol mi do mi
    fa re sib re mi dod la dod\mbreak

    %28
    re mi fa[sol] la4 re,
    la'8 fa16 sol la8 la, re4 r8 mi
    fa sol la la re[re,16 mi fa8 sol]

    %31
    la la, r la' re16 do32 sib la sol fa mi re16 do32 sib la sol fa mi
    re8 re' la' la,  re,2\fermata

}

IVbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  s8
  s1*11
  s2 <7>
  s1
  s4 s <2> <3>8 <4>
  s2 <4 2>4 <6 5>
  s1
  <6 5>
  <_+>2 <7>
  s1
  <_+>2 <6 4+>
  s4 <6 5> <4+ 2> <6 5>
  s1
  s2 s4 <6 4!>
  s <_+> s2
  <_+>1
  s
  s
  s4 s8 <_!> <_+>2

}

forma = {

  \time 4/4
  \key fa\major
  \tempo 4 = 60
  \partial 8 s8
  s1*32
  \bar "||"

}

IVvoce = {
  \notypeset
  \new Voice = "excelsus"
  \IVglobal
  %\clef soprano
  <<\IVvocen\forma>>
}



IVbc = {
  \IVglobal
  \clef bass
  <<\IVbcn\forma\IVbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


Vglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f

}

Vvln = \relative do'' {

    \stemUp la,8^\markup\italic"Unis[o]ni" \stemDown mi'' la \stemUp la,, \stemUp sold \stemDown sold'' si \stemUp sold,,
    \stemUp la \stemDown mi'' la \stemUp do,, \stemUp re \stemDown la'' si \stemUp red,,
    \stemUp mi \stemDown sold' la \stemUp do,, \stemUp re \stemDown la'' \stemUp mi, \stemDown sold'

    %4
    \stemUp la,, \stemDown mi'' la \stemUp la,, \stemUp sold \stemDown sold'' si \stemUp sold,,
    \stemUp la \stemDown mi'' la \stemUp do,, \stemUp re \stemDown si'' re \stemUp sol,,,
    do mi' sol sol, mi mi' sol mi,

    %7
    fa fa' la fa, re fad' la fad,
    sol re' sol \stemUp si,, do \stemDown mi' sol\stemUp si,,
    do \stemDown mi' sol\stemUp si,, do  \stemDown sol'' si \stemUp sol,,

    %10
    \stemUp do \stemDown mi'  la\stemUp dod,, re \stemDown fa' sib\stemUp re,,
    dod \stemDown mi' la\stemUp do,, si\stemDown re' sol \stemUp sib,,
    la\stemDown mi'' sol\stemUp dod,, re \stemDown fad' la\stemUp re,,

    %13
    \stemNeutral sol,  sol'' sib sol, mi mi' sol  mi,
    fa fa' la la, fa fa' sol mi,\mbreak  %%% fine prima riga
    fa fa' sol do,, fa fa' la fad,

    %16
    sol sol' si sold, la mi' la la,
    sold si mi sol, fad la re fa,
    \stemUp mi \stemDown sold' si \stemUp mi,, fa fa' la la,

    %19
    sold sold' la do,, \stemUp re \stemDown la'' \stemUp mi, \stemDown sold'
    \stemUp la,, \stemDown mi'' la \stemUp do,, re \stemDown la'' \stemUp mi, \stemDown sold'
    \stemUp la,, \stemDown mi'' la \stemUp do,, re \stemDown la'' \stemUp mi, \stemDown sold'

    %22
    la,,1\fermata

}

Vvlan = \relative do' {

    la8 r r la sold r r sold
    la r r do re r r red
    mi r r do re r mi r

    %4
    la, r r la sold r r sold
    la r r do re r r sol,
    do r r sol' mi r r mi

    %7
    fa r r fa re r r fad
    sol r r si, do r r si
    do r r si do r r sol

    %10
    do r r dod re r r re
    dod r r do si r r sib
    la r r dod re r r re

    %13
    sol, r r sol' mi r r mi
    fa r r la fa r r mi\mbreak
    fa r r do fa r r fad

    %16
    sol r r sold la r r la
    sold r r sol fad r r fa
    mi r r mi fa r r la

    %19
    sold r r do, re r mi r
    la, r r do re r r mi
    la, r r do re  r mi r

    %22
    la,1\fermata

}

Vvocen = \relative do'' {

    \autoBeamOff
    R1*3
    r8 mi do si16[la] si sold mi8 re'[(do16)] si
    do8 la r do16 do fa8 fa fa mi16[re]

    %6
    mi4 r sol,8 la sib do16 sib
    sib?8 la16[sol] la4 la8 si do re16 do
    do8 si16[la] si8 re mi16[re] do8 r sol16 fa

    %9
    mi[re] do8 r re' mi16 sol, do mi, re4
    do2 r8 re' fa re
    mi16 dod la8 la  la re sol, sol mi'

    %12
    dod16[si!] la8 r4 re8 la re do?
    sib8. la16 sol4 do8 sol do re16 sib
    sib?8. la16 la8 do fa[mi16 re do8] sib\mbreak

    %15
    la sol16[fa] mi4 fa r
    r8 re' si mi do8. si16 la4
    mi'8 re16[do] si8 si16 mi la,[si do si] la[do si la]

    %18
    sold[la si la] sold[si la sold] la[si] do[si] la[do] si[la]
    mi'8 mi, r4 do'8 si16[la] sold4
    la r si8 do16[la] sold4

    %21
    la r r2
    r1

}

Vtesto = \lyricmode {

    Quis sicut _ Dominus _ _ Deus _ noster, _ qui in altis _ habitat, _ _ et humilia _ _ _ respicit _ _
    et humilia _ _ _ respicit _ _ in caelo _  et in terra _  in caelo _  et in terra? _
    Quis sicut _ Dominus _ _ Deus _ noster, _ Deus _ noster, _ qui in altis _ habitat, _ _ et humilia _ _ _ respicit _ _
    in cae -- lo  et in terra? _  In altis _ habitat, _ _ et humilia _ _ _ res - - - - picit _  in caelo _   et in terra _  et in terra? _

}

Vbcn = \relative do {

    la'8 r r la sold r r sold
    la r r do, re r r red
    mi r r do re r mi r

    %4
    la, r r la' sold r r sold
    la r r do, re r r sol,
    do r r sol' mi r r mi

    %7
    fa r r fa re r r fad
    sol r r si, do r r si
    do r r si do r r sol

    %10
    do r r dod re r r re
    dod r r do si r r sib
    la r r dod re r r re

    %13
    sol, r r sol' mi r r mi
    fa r r la fa r r mi\mbreak
    fa r r do fa r r fad

    %16
    sol r r sold la r r la
    sold r r sol fad r r fa
    mi r r mi fa r r la

    %19
    sold r r do, re r mi r
    la, r r do re r mi r
    la, r r do re  r mi r

    %22
    la,1\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 s4 s8 <6 5>
    <_+>2 <6 5>4 <_+>
    s1
    s2 <6>4 s8 <7>
    s2 s4 s8 <6 5->
    <5 4>4 s8 <3> <_+> s4 <6 5>8s1
    s
    s2 s4 s8 <6->
    <7->4 s8 <6> <7> s4 <6>8
    s4 s8 <6 5> <_+> s4 s8
    <_->2 s4 s8 <6 5->
    <5 4>2 s4 s8 <6 5->
    s1
    s4 s8 <6 5> s2
    <7->4 s8 <6> <7> s4 <6>8
    <7>2 <5>
    s <6 7>4 <_+>
    s2 <6 5>4 <_+>
    s2 <6 5>4 <_+>

}

forma = {

    \time 4/4
    \key la\minor
    \tempo 4 = 45
    s1*22
    \bar "||"

}


Vvl = {
    \Vglobal
    \notypeset
    <<\Vvln\forma>>
}

Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan\forma>>
}

Vvoce = {
    \new Voice = "quis"
    \Vglobal
    %\clef soprano
    <<\Vvocen\forma>>
}



Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn\forma\Vbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIglobal = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletNumber #'transparent = ##t
   \override TupletBracket #'bracket-visibility = ##f

}

VIvln = \relative do'' {

   r16 re, re fa fa la la re re la la re re fa fa la
   la re, re fa fa la la re re4 r
   fa, r fa r

   %4
   fa \tempo 4 = 45 r8^\markup \huge"Ad[agi]o" mi re[re] re4
   dod\fermata \tempo 2 = 30  r^\markup \huge"And[ant]e" r2
   R1*4

   %10
   \tempo 2 = 55 r16^\markup \huge"Presto" fa, fa la la do do fa fa la, la do do fa fa la
   la do, do fa fa la la do do4 r
   la r la r

   %13
   la r  la \tempo 4 = 45 r8^\markup \huge"Ad[agi]o"  fa
   fa fa fa mi fa4 r\mbreak
   R1*5^\markup \huge"And[ant]e"

   %20
   R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

VIvlIn = \relative do'' {

   r16 la, la re re fa fa la la fa fa la la re re fa
   fa la, la re re fa fa la la4 r
   re,  r re r

   %4
   re r8^\markup \huge"Ad[agi]o" dod la8 la sold4
   mi4\fermata r^\markup \huge"And[ant]e" r2
   R1*4

   %10
   r16^\markup \huge"Presto" do do fa fa la la do do fa, fa la la do do fa
   fa la, la do do fa fa la la4 r
   fa r fa r

   %13
   fa r fa r8^\markup \huge"Ad[agi]o" la,
   sib la sib[sol] la4 r\mbreak
   R1*5^\markup \huge"And[ant]e"

   %20
   R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

VIvlan = \relative do' {

    r16 fa, fa la la re re fa fa la, la re re fa fa la
    la fa fa la la re re fa, fa4 r
    la r la r

    %4
    la4 r8^\markup \huge"Ad[agi]o" la fa re sib!4
    la\fermata  r ^\markup \huge"And[ant]e" r2
    R1*4

    %10
    r16 ^\markup \huge"Presto" la la do do fa fa la la do, do fa fa la la do
    do fa, fa la la do do fa, fa4 r
    do' r do r

    %13
    do r do r8^\markup \huge"Ad[agi]o" fa,
    sib fa sol do, fa4 r\mbreak
    R1*5^\markup \huge"And[ant]e"

   %20
   R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

VIvocen = \relative do'' {

   \autoBeamOff
   R1
   r2 re8. la16 la4
   re8 la fa la re,[mi16 fa sol la si dod]

   %4
   re8 la r ^\markup \huge"Ad[agi]o"  la re re, sold8. la16
   la4\fermata r la4.^\markup \huge"And[ant]e" re8
   sib8. la16 sol4 do8[re] do sib

   %7
   lab4. sib8 sol4. lab8
   fa4. reb'8 reb do4 mi8
   fa[mib16 reb?do8 sib] lab4(sol8.) fa16

   %10
   fa4^\markup \huge"Presto" r r2
   r la8. fa16 fa4
   do'8. la16 la4 fa'8 mi16[re] do[sib] la[sol]

   %13
   fa8[sol16 la sib do re mi] fa8 fa, r^\markup \huge"Ad[agi]o" do'
   re do sib8. la16 la4 r\mbreak
   la4. re8 sib8. la16 sol4

   %16
   si mi8 re dod4 do
   si sib la8[si16 dod re8 mi16 fa]
   sol,[sib la sol] dod8[re16 mi] la,[fa' mi re] dod8.\tr re16

   %19
   re4 r la8 fa'16 re dod8. re16
   re4 r r2\fermata

}

VItesto = \lyricmode {

     Suscitans _ _ suscitans _ _ a ter - ra a terra _ inopem, _ _ et de stercore _ _ erigens _ _ pau - - - - - - - - - - pe -- rem:
     suscitans _ _ suscitans _ _ suscitans _ _ a ter - ra a terra _ inopem, _ _ et de stercore _ _ erigens _ _ pau - - - - - - - - pe -- rem:
     erigens _ _ paupe - rem.

}

VIbcn = \relative do {

   re8 re re re re re re re
   re re re re re4 r
   re8[mi16 fa sol la si dod] re4 r

   %4
   re,4 r^\markup \huge"Ad[agi]o"  r2
   r\fermata re8^\markup \huge"And[ant]e" mi fa re
   sol la sib sol mi re mi do

   %7
   fa mi fa reb mib reb mib do
   reb do reb sib do4 sib
   lab8 fa' mi?4 fa8 sib do do,

   %10
   fa,^\markup \huge"Presto"  fa fa fa fa fa fa fa
   fa fa fa fa fa4 r
   fa8[sol16 la sib do re mi] fa4 r

   %13
   fa r fa r^\markup \huge"Ad[agi]o"
   R1
   \tempo 2 = 30 fa8^\markup \huge"And[ant]e" mi fa re sol la sib la

   %16
   sold fad sold mi la sold fad re
   sol? fa? mi do fa [mi re dod16 re]
   mi8 dod la dod re16 mi fa sol la8 la,

   %20
   re mi fa dod re16 mi fa sol la8 la,
   re sol la la,  re2\fermata

}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*6
   <_->1
   s2 <9>8 <8> <4 2>4
   <6> <6 5> s2
   <_!>1
   s1*5
   s2 <_+>4 <6 5->8 <7>
   <_!>4 <6 5->8 <7> s2

}

forma = {

   \time 4/4
   \key re\minor
   \tempo 2 = 55
   s1*20
   \bar "||"

}


VIvl = {
   \VIglobal
   \notypeset
   <<\VIvln\forma>>
}

VIvlI = {
   \VIglobal
   <<\VIvlIn\forma>>
}

VIvla = {
   \VIglobal
   \clef alto
   <<\VIvlan\forma>>
}

VIvoce = {
   \new Voice = "suscitans"
   \VIglobal
   %\clef soprano
   <<\VIvocen\forma>>
}



VIbc = {
   \VIglobal
   \clef bass
   <<\VIbcn\forma\VIbfn>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f

}

VIIvln = \relative do'' {

    fa,8_\markup\italic"Unis[o]ni"
    sib[sib sib sib]
    sib[fa re sib]
    do'[re mib re16 do]

    %4
    re8[fa, re sib]
    do'[re mib re16 do]
    re4 r8 sib

    %7
    lab'[lab lab sol16 fa]
    sol8[sib, sol mib]
    sib''[sib sib la16 sol]

    %10
    la8[do, la fa]
    mib'[mib mib re16 do]
    re8[fa, sib re,]

    %13
    mib[sib' fa la]
    sib4 r8 fa
    sib4 do8 sib16 la

    %16
    sib8[fa re sib]
    do'[re mib re16 do]
    re8[fa, re sib]

    %19
    sib'4. re8
    do la sol fa
    sib4. la16 sol

    %22
    do8[fa, mi fa]
    sib4. la16 sol
    do8[fa, mi fa]

    %25
    sib8 la16 sol do8 la
    re8 do16 sib mi8 do
    fa mi16 re do8 sib\mbreak

    %28
    la4(sol\tr)
    fa4 r8 fa
    sib[sib sib sib]

    %31
    sib[fa re sib]
    do'[re mib re16 do]
    re8[fa, re sib]

    %34
    mib'[mib mib re16 do]
    re8[fa, sib re,]
    mib[sib' fa la]

    %37
    sib4 r8 fa
    sib4 do8 sib16 la
    sib8[fa re sib]

    %40
    do'[re mib re16 do]
    re8[fa, re sib]
    sib' do re sib

    %43
    do la sol fa
    sib4. la16 sol
    do8[fa, mi fa]

    %46
    sib4. la16 sol
    do8[fa, mi fa]
    sib8 la16 sol do8 la

    %49
    re8 do16 sib mi8 do
    fa mi16 re do8 sib\mbreak
    la4(sol\tr)

    %52
    fa4 r8 fa
    sib[sib do sib16 la]
    sib8[fa re sib]\mbreak

    %55
    fa' [sol lab lab]
    lab? sol r4
    sol8 la sib sib

    %58
    sib la r4
    re8 mib re do
    sib la sol4

    %61
    mib'8 fa mib re
    dod si la4
    la8[si16 dod re8 mi]

    %64
    fa4 mi8 re
    dod2\tr
    re4 r8 fa,

    %67
    sib[sib do sib16 la]
    sib8[fa re sib]\mbreak
    sib'4 do8 sib16 la

    %70
    sib8[fa re sib]
    do'[re mib re16 do]
    re8[fa, re sib]

    %73
    fa'[fa fa mib16 fa]
    sol4. la16 sib
    do8[do sol la16 sib]

    %76
    la4. sib16 do
    re8[re la sib16 do]
    sib4. do16 re

    %79
    mib8[re16 do re8 sib]
    la8 sol16 fa sib8 mib
    re4(do\tr)

    %82
    sib r8 fa
    sib[sib do sib16 la]
    sib8[fa re sib]

    %85
    sib'[sib do sib16 la]
    sib8[fa re sib]
    do'[re mib re16 do]

    %88
    re8[fa, re sib]
    fa'[fa fa mib16 fa]
    sol4. la16 sib

    %91
    do8[do sol la16 sib]
    la4. sib16 do
    re8[re la sib16 do]

    %94
    sib4. do16 re
    mib8[re16 do re8 sib]
    la8 sol16 fa sib8 mib\mbreak

    %97
    re4 (do\tr)
    sib4 r8 sib
    lab'[lab lab sol16 fa]

    %100
    sol8[sib, sol mib]
    sib''[sib sib la16 sol]
    la8[do, la fa]

    %103
    mib'[mib mib re16 do]
    re8[fa, sib re,]
    mib[sib' fa la]

    %106
    sib2\fermata

}

VIIvlan = \relative do' {

    r8
    re4 r
    re8[fa re sib]
    la4 r

    %4
    fa'8[fa re sib]
    la4 r
    fa'8[fa re sib]

    %7
    re4 r
    sib8[sib' sol mib]
    mi4 r

    %10
    do8[do' la fa]
    la4 r
    fa8[fa re sib]

    %13
    mib r fa r
    sib,4 r
    sib fa'

    %16
    sib,8[fa're sib]
    la'[sib do sib16 la]
    sib8[fa re sib]

    %19
    sib8[do re sib]
    fa'4 r
    sol r

    %22
    fa r
    sol r
    fa r

    %25
    sol la
    sib do
    la8 sol16 fa mi4\mbreak

    %28
    fa8 sib, do4
    fa r8 fa
    fa4 r

    %31
    re8[fa re sib]
    la'[sib do sib16 la]
    sib8[fa re sib]

    %34
    fa'4 r
    fa8[fa re sib]
    mib r fa r

    %37
    sib,4 r
    sib fa'
    sib,8[fa're sib]

    %40
    la'[sib do sib16 la]
    sib8[fa re sib]
    sib4 r

    %43
    fa' r
    sol r
    fa r

    %46
    sol r
    fa r
    sol la

    %49
    sib do
    la8 sol16 fa mi4
    fa8 sib, do4

    %52
    fa r8 fa
    fa4 r
    re8[fa re sib]\mbreak

    %55
    re[mib fa sib,]
    mib[fa sol fa]
    mi[fa sol do,]

    %58
    fa sol la sol
    fad[la fad re]
    sol[la sib la]

    %61
    sol[sib sol sol,]
    la4 la'8 sol
    fa[mi re dod]

    %64
    re[mi fa sol]
    la4 la,
    re r

    %67
    re r
    re8[fa re sib]\mbreak
    sib4 fa'

    %70
    sib,8[fa're sib]
    la'[sib do sib16 la]
    sib8[fa re sib]

    %73
    re8[do re sib]
    mib[fa sol fa]
    mi4. mi8

    %76
    fa[sol la sol]
    fad4. fad8
    sol[la sib sol]

    %79
    do,4 sib
    fa'8[mib re do]
    sib[mib fa fa,]

    %82
    fa'4 r8 fa
    fa4 r
    re8[fa re sib]

    %85
    sib4 fa'
    sib,8[fa're sib]
    la'[sib do sib16 la]

    %88
    sib8[fa re sib]
    re8[do re sib]
    mib[fa sol fa]

    %91
    mi4. mi8
    fa[sol la sol]
    fad4. fad8

    %94
    sol[la sib sol]
    do,4 sib
    fa'8[mib re do]\mbreak

    %97
    sib[mib fa fa,]
    sib[sib' fa re]
    re4 r

    %100
    sib8[sib' sol mib]
    mi4 r
    do8[do' la fa]

    %103
    la4 r
    fa8[fa re sib]
    mib r fa r

    %106
    sib,2\fermata

}

VIIvocen = \relative do'' {

    \autoBeamOff

    r8
    R2*13
    r4 r8 fa,
    sib4 do8 sib16[la]

    %16
    sib8 fa r4
    do'8 re mib re16[do]
    re4 r

    %19
    sib4. sol8
    do [la] sol fa
    sib4. la16 [sol]

    %22
    do8[fa, mi fa]
    sib4. la16 [sol]
    do8[fa, mi fa]

    %25
    sib8 [la16 sol] do8 [la]
    re8 [do16 sib] mi8 [do]
    fa [mi16 re] do8 sib\mbreak

    %28
    la4(sol\tr)
    fa r
    R2*7

    %37
    r4 r8 fa
    sib sib do sib16[la]
    sib8 fa r4

    %40
    do'8 re mib re16[do]
    re8[do] sib4
    sib8 do re sib

    %43
    do [la] sol fa
    sib4. la16 [sol]
    do8[fa, mi fa]

    %46
    sib4. la16 [sol]
    do8[fa, mi fa]
    sib8 [la16 sol] do8 [la]

    %49
    re8 [do16 sib] mi8 [do]
    fa [mi16 re] do8 sib\mbreak
    la4(sol\tr)

    %52
    fa4 r
    R2
    r4 r8 sib\mbreak

    %55
    fa sol lab lab
    lab? sol r4
    sol8 la sib sib

    %58
    sib la] r4
    re8 mib re do
    sib [la] sol4

    %61
    mib'8 fa mib re
    dod [si] la4
    la8[si16 dod re8 mi]

    %64
    fa4 mi8 re
    dod2\tr
    re4 r

    %67
    R2
    r4 r8 fa,\mbreak
    sib4 do8 sib16[la]

    %70
    sib8 fa r4
    do'8 re mib re16[do]
    re4 r

    %73
    fa,8 fa fa mib16 fa
    sol4. la16 [sib]
    do8[do sol la16 sib]

    %76
    la4. sib16 [do]
    re8[re la sib16 do]
    sib4. do16 [re]

    %79
    mib8[re16 do re8 sib]
    la8 [sol16 fa] sib8 mib
    re4(do\tr)

    %82
    sib r
    R2
    r4 r8 fa

    %85
    sib sib do sib16[la]
    sib8 fa r4
    do'8 re mib re16[ do]

    %88
    re8[do] sib4
    fa8 fa fa mib16[fa]
    sol4. la16 sib

    %91
    do8[do sol la16 sib]
    la4. sib16 [do]
    re8[re la sib16 do]

    %94
    sib4. do16 [re]
    mib8[re16 do re8 sib]
    la8 [sol16 fa] sib8 mib\mbreak

    %97
    re4(do\tr)
    sib r
    R2*8

}

VIItesto = \lyricmode {

     ut collo - cet eum _ cum princi - pibus, _ cum princi - pibus _ po  - - - - - - - - - - puli _ su -- i.

    Qui habi - tare _ facit _ sterilem _ _ in domo, _  matrem _ filio - - rum laetan - - - - - - - - - - - tem laetan - tem.

    Qui habi - tare _ facit _ sterilem _ _ in domo, _  matrem _ filio - - rum matrem _ filio - - rum lae -- tantem _ laetant - tem.

    Ut collo - cet eum _ cum princi - pibus, _ cum princi - pibus _ po  - - - - - - - - - puli _ su -- i.

    Qui habi - tare _ facit _ sterilem _ _ in domo, _  matrem _ filio - - rum laetan - - - - - - - - tem lae -- tan -- tem.

}

VIIbcn = \relative do {

    r8
    sib4 r
    sib8[fa' re sib]
    fa'4 r

    %4
    sib,8[fa' re sib]
    fa'4 r
    sib,8[fa' re sib]

    %7
    sib4 r
    mib8[sib' sol mib]
    do4 r

    %10
    fa8[do' la fa]
    fa4 r
    sib,8[fa' re sib]

    %13
    mib8 r fa r
    sib,4 r
    R2

    %16
    sib8[fa' re sib]
    fa'4 r
    sib,8[fa' re sib]

    %19
    sib4 r
    R2*9
    fa'8[sol fa mib]

    %30
    re4 r
    sib8[fa' re sib]
    fa'4 r

    %33
    sib,8[fa' re sib]
    la4 r
    sib8[fa' re sib]

    %36
    mib r fa r
    sib,4 r
    R2

    %39
    sib8[fa' re sib]
    fa'4 r
    sib,8[fa' re sib]

    %42
    sib4 r
    R2*9
    fa'8[sol fa mib]

    %53
    re4 r
    sib8[fa' re sib]\mbreak
    sib4 r

    %56
    R2*10
    re8[mib! fa re]
    sib4 r

    %68
    sib8[fa' re sib]
    sib4 r
    sib8[fa' re sib]

    %71
    fa'4 r
    sib,8[fa' re sib]
    sib4 r

    %74
    R2*8
    fa'8[sol fa mib]
    re4 r

    %84
    sib8[fa' re sib]
    sib4 r
    sib8[fa' re sib]

    %87
    fa'4 r
    sib,8[fa' re sib]
    sib4 r

    %90
    R2*8
    sib8[fa' re sib]
    sib4 r

    %100
    mib8[sib' sol mib]
    do4 r
    fa8[do' la fa]

    %103
    fa4 r
    sib,8[fa' re sib]
    mib8 r fa r

    %106
    sib,2\fermata

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s8
    s2*6
    <7->2
    s
    <7 _!>
    s
    <7>
    s
    <6 5>
    s2*20
    <6 5>2
    s
    <6 5>
    s2*62
    <7->2
    s
    <7 _!>
    s
    <7>
    s
    <6 5>

}

forma = {

    \time 2/4
    \key sib\major
    \tempo 2 = 60
    \partial 8 s8
    s2*106
    \bar "||"

}


VIIvl = {
    \VIIglobal
    \notypeset
    <<\VIIvln\forma>>
}

VIIvla = {
    \VIIglobal
    \clef alto
    <<\VIIvlan\forma>>
}

VIIvoce = {
    \new Voice = "ut"
    \VIIglobal
    %\clef soprano
    <<\VIIvocen\forma>>
}



VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn\forma\VIIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  \con

}

VIIIvln = \relative do'' {

    sol'8_\markup\italic"Viol[in]o Solo" la16 sib do,8 re sib8.[la16 sol8 re']
    sol[la16 sib la8 sol] fad8.[mi16 re8 sib']
    mib,[fa16 sol fa8 mib] re do16 sib la8.\tr sib16

    %4
    sib4 r16 fa' re do si8.[lab'16 sol8 fa]
    do'16 lab fa re si8.\tr do16 do4 r16 sol' mib re
    dod8.[sib'16 la8 sol] fad16 mi? re8 r sol

    %7
    lab16(do) lab(sol) fad(la?) mib(re) dod4~dod16 la' fad do?
    sib sib' \tuplet 3/2 { la[(sib sol)] } fad8.\tr sol16 sol4 r\mbreak
    R1

    %10
    r2 r4 fa8 re16 do
    si8.[lab'16 sol8 fa] mib16 re do8 r4
    R1

    %13
    r2 fa8[lab fa sol16 mib]
    re2 mib16 fa sol lab sib8[re,]
    do2 re16 mib fa sol lab8 do,

    %16
    si16. do32 do16. re32 re16. mib32 mib16. fa32 fa4~fa16 lab sol fa
    sol8 fa16 mib re4\tr do8 sol mi' fa16 sol
    dod,(la) sib(sol) sol'(mi) sib'(sol) fa mi re8 r4

    %19
    R1*3
    r2 re8[mi16 fa sol8 la]\mbreak
    fa8.[mi16 re8 la'] do,[re16 mib? re8 do]

    %24
    sib8.[la16 sol8 re'] sol la16 sib la8 do16(sol)
    sol8 fad fad4 sol16 fa? mib re mib4
    fa16 mib re do re4 do16 re do sib do re do sib

    %27
    la sib sib do do mib re do re4 r8 sol,
    mib'4. re16 do fad4 sol~
    sol fad\tr sol r

    %30
    r2 sol8[la16 sib la8 sol]
    fad8.[mi16 re8 sib'] mib,?[fa16 sol fa8 mib]
    re8 do16 sib la8.\tr sib16 sib4 r16 fa' re do

    %33
    si8.[lab'16 sol8 fa] do'16 lab fa re si8.\tr do16
    do4 r16 sol' mib re dod8.[sib'16 la8 sol]
    fad16 mi? re8 r sol lab16 do lab sol fad la? mib?re

    %36
    dod4~dod16 la' fad do? sib sib' \tuplet 3/2 { la[(sib sol)] } fad8.\tr sol16
    sol1\fermata

}

VIIIvocen = \relative do'' {

  \autoBeamOff
  R1*7
  r2 sol8 la16 sib do8 re16 do\mbreak
  sib8. la16 sol4 mib'8 do fa, mib'16 do

  %10
  re8[do16 sib] la4\tr sib r
  r2 r4 do8 re16 mib
  fa,8 mib' re mib16 do si8. la16 sol4

  %13
  do8. mib16 do8 re16 sib lab2
  sib16 [do re mib] fa8 [lab,] sol2
  lab16 [sib do re] mib8 [sol,] fa2

  %16
  sol16. [la32 la16. si32] si16. [do32 do16. re32] re4~re16 [fa mib re]
  mib8 [re16 do] si4 do r
  r2 r4 re8 dod16 re

  %19
  mi[re] dod[si] la8 dod16 mi fa mi re8 fa
  la, sib do16 re sib4 la re8 do16 re
  sib[la] sol8 mi' re16 mi dod si la8 r la16 mi'?

  %22
  fa8 mi16 re dod4 re r\mbreak
  R1*2
  r4 re16[do] sib la sib8 sib do16[sib] la sol

  %26
  la la la8 sib16[re] do[sib] mib[re] do sib la[sib la sol]
  fad[sol sol la] la[do sib la] sib8 sol re'4~
  re8 do16 si do4~do8 sib?16 la sib4~

  %29
  sib8 do16 sib la4\tr sol re'8 sib
  mib16[do] re mib la,4\tr sol r
  R1*7

}

VIIItesto = \lyricmode {

    Gloria _ _ Patri,  _ et Filio, _ _ et Spiritui _ _ _ Sanc - to

    Gloria _ _ Patri, _ Patri,  _ et Filio, _ _ et Spiritui _ _ _ Sanc - - - - - - - - - - - to

    Gloria _ _ Patri _ Patri,  _ et Filio, _ _ et Spi -- ritui _ _ Sancto _

    Gloria _ _ Patri,  _ Gloria _ _ Filio, _ _ et Spi -- ritui _ _ Sancto _

    Gloria _ _ Patri _ Patri,  _ et Filio, _ _ et Spiritui _ _ _ Sanc - - -  to

    Gloria _ _ et Spi - ri -- tui _ Sancto _ et Spi -- ritui _ _ Sancto. _

}

VIIIbcn = \relative do {

    sol'4 la8 fad sol4. fa8
    mib4 do re8 mi fad re
    sol4 la sib8 mib, fa fa,

    %4
    sib[do re mib16 fa] sol,4 si
    do16 re mib fa sol8 sol, do8[re mib fa16 sol]
    la,4 dod re8 do sib sol

    %7
    do4 re la'8 sol la re,
    sol do re re, sol4 la8 fad\mbreak
    sol la sib sol do fa, la fa

    %10
    sib mib, fa fa, sib[do re mib16 fa]
    sol,4 si do8 re mib do
    re do fa[fad] sol la si sol

    %13
    mib2 fa
    sib mib,
    lab re,

    %16
    sol,1
    do8 fa sol sol, do4 sol'
    la dod, re8 mi fa re

    %19
    la si dod la re mi fa4
    sol8 fa sol do, fa4 fad
    sol sold la8 la, dod la

    %22
    re sol la la, re4 mi8 dod\mbreak
    re mi fa re la'4 fad
    sol4. fa!8 mib4 do

    %25
    re2 sol4 do,
    fa sib, do2
    re sol,8 la sib sol

    %28
    do2 re4 sol,
    do re sol,8 la sib sol
    do4 re sol dod,

    %31
    re8 mi fad re sol4 la
    sib8 mib, fa fa, sib[do re mib16 fa]
    sol,4 si do16 re mib fa sol8 sol,

    %34
    do8[re mib fa16 sol] la,4 dod
    re8 do sib sol do4 re
    la'8 sol la re, sol do re re,

    %37
    sol,1\fermata

}

VIIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1
  s2 <_+>
  s1
  s2 <_!>4 <6 5>
  s <_!> s2
  <_+>4 <6 5> <_+>2
  <6->4 <_+> <_+> s8 <7 _+>
  s1
  s2 s4 s8 <7>
  s1
  <_!>
  s2 <_!>
  s <_->
  <7-> <7>
  <7> <7>
  <_!>1
  s2 s4 <6!>
  <_+> <7 5> s2
  <_+> s4 <6>8 <5>
  s4 s8 <7> s2
  s1
  s
  s2 <6+>
  s1
  <5 4>8 <3+> s4 s2
  s1
  <_+>
  <3 9>8 <8> s4 <7 _+>2
  <7 5>4 <_+> s2
  s1
  <_+>
  s
  <_!>
  s2 <_+>
  <_+> <6->4 <_+>
  <_+> s8 <7 _+>

}

forma = {

  \time 4/4
  \key sib\major
  \tempo 4 = 40
  s1*37
  \bar "||"

}


VIIIvl = {
  \VIIIglobal
  \notypeset
  <<\VIIIvln\forma>>
}

VIIIvoce = {
  \new Voice = "gloria"
  \VIIIglobal
  %\clef soprano
  <<\VIIIvocen\forma>>
}



VIIIbc = {
  \VIIIglobal
  \clef bass
  <<\VIIIbcn\forma\VIIIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IXglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f

}

IXvln = \relative do'' {

    sol8
    do[sol do re]
    mib8.[re16 do8 si]
    do8 r sol' r

    %4
    sol,[sol'16 fa mib8 re]
    do8 do, r sol''
    sol[fa16 mib re8 fa]

    %7
    mib8 do r do
    lab'[lab lab lab]
    lab?16 fa sol lab! sib,8 lab'

    %10
    sol[sol sol sol]
    sol16 mib fa sol lab,8 sol'
    fad[(do si do)]

    %13
    fad[(do si do)]
    sol'[fa16 mib re8 do]
    re4 si

    %16
    do r
    R2*11
    r4 r8 re

    %29
    sib'[sib sib sib]
    sib16 sol la sib do,8 sib'
    la[la la la]

    %32
    la16 fa sol la sib,8 la'
    sol[sol sol sol]
    fad[(do si do)]

    %35
    sol'[fa!16 mib re8 do]
    sib4 la
    sol r

    %38
    R2*2
    r4 r8 re'
    sib'[sib sib sib]\mbreak

    %42
    sib16 sol la sib do,8 sib'
    la[la la la]
    la16 fa sol la sib,8 la'

    %45
    sol[sol sol sol]
    sol16 mib fa sol do,8 fa
    fa[fa fa fa]

    %48
    fa16 mib re do sib8 lab
    sol4 r
    R2*2

    %52
    r4 r8 sib
    mib[sib mib fa]
    sol8.[fa16 mib8 re]

    %55
    mib r sib' r\mbreak
    sib,[sib'16 lab sol8 fa]
    mib r sib' r

    %58
    sib,4 r
    R2*3
    r4 r8 sib

    %63
    mib[mib mib mib]
    fa,4 r8 do'
    fa[fa fa fa]

    %66
    sol,4 r8 re'
    sol[mib do lab]
    fa'[fa fa fa]

    %69
    mib8.[re16 do8 do,]
    sol [sol' sol, sol']
    sol,[sol' sol, sol']

    %72
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']

    %75
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,4 r

    %78
    r4 r8 sol'
    do[sol do re]
    mib8.[re16 do8 sol]

    %81
    do[sol do sol]
    do16[re mib re do8 si]
    do[sol do sol]\mbreak

    %84
    do16[re mib re] do8[si]
    do sib!16 lab sol8 fad
    sol[la?16 si do8 re16 mib]

    %87
    fa8  re si8.\tr do16
    do8[sol do re]
    sol,4 r

    %90
    R2
    do8[sol do sol]
    do16[re mib re do8 si]

    %93
    do[fa, sol sol,]
    do2\fermata  %%%%% OOOOOKKKK
    R4.*4

    %99
    do'4.
    re
    mib8(re) do

    %102
    si(la) sol
    R4.*2
    sol'8(fa) mib

    %106
    re(do) si
    do(re) mib
    fa4.

    %109
    mib16 re mib fa sol mib
    re do re mib fa re
    mib re mib fa sol mib\mbreak

    %112
    re do re mib fa re
    mib8 do sol'
    fad re sol~

    %115
    sol8 fad16 mi? fad8
    sol4.
    R4.

    %118
    sol
    la
    sib8 la sol

    %121
    fad mi re
    sib'4 r8
    la4 r8

    %124
    sol4 r8
    fad4 r8
    sol, la16 sib do re

    %127
    mib4.~
    mib
    re~

    %130
    re
    do~
    do

    %133
    sib4 r8
    R4.*3
    sib'8 lab  sol

    %138
    fa mib re
    r r r16 sib'\mbreak
    sib8 do,~do16 [lab']

    %141
    lab?8 sib,~sib16 [sol']
    sol8 lab,~lab16 [fa']
    sol8 mib4~

    %144
    mib8 re16 do re8
    mib4.
    R

    %147
    do
    fa,8 fa'4~
    fa8 mi16 re mi8

    %150
    fa4.
    R
    re

    %153
    sol,8 sol'4~
    sol8 fad16 mi? fad8
    sol4.

    %156
    R4.*2
    mib8 do' r
    fad, sol r

    %160
    mib! fa r
    re mib r
    do re r

    %163
    si do r
    R4.*4\mbreak
    do4.

    %169
    re
    mib8 re do
    si la sol

    %172
    do4.
    re
    mib8 re do

    %175
    si la sol
    R4.*2
    r8 mib'4~

    %179
    mib8 re do
    re4.~
    re8 do sib

    %182
    do4 r8
    do4 r8
    re4 r8

    %185
    re mib fa
    sol fa mib
    re mib fa

    %188
    sol fa mib
    re mib fa
    mib4 r8

    %191
    sol,16 fa sol8 mib'
    fa,16 mib fa8 re'
    mib,16 re mib8 do'~

    %194
    do8 si16 la si8
    do4 r8\mbreak
    sol,4 r8

    %197
    sol4 r8
    do'4.
    re

    %200
    mib8(re) do
    lab'4.~
    lab8 sol4~

    %203
    sol8 fa4~
    fa8 mib4~
    mib8 re4

    %206
    mib8 sol r
    re sol r
    mib sol r

    %209
    re sol r
    mib4.
    fa

    %212
    mib4 r8
    mib4.
    fa

    %215
    mib16 re mib fa sol8
    do, do si
    do4.\fermata

}

IXvlIn = \relative do'' {

    r8
    r4 r8 sol
    do[sol do re]
    mib8.[re16 do8 si]

    %4
    do r sol' r
    sol,[sol'16 fa mib8 re]
    mib[re16 do si8 sol]

    %7
    mib'[mib mib mib]
    mib16 do re mib fa,8 mib'
    re[re re re]

    %10
    re16 sib do re mib,8 re'
    do[do do do]
    do2~

    %13
    do
    re4 r8 sol,
    fa4 re

    %16
    mib r
    R2*12
    r4 r8 sol

    %30
    mib'[mib mib mib]
    mib16 do re mib fa,8 mib'
    re[re re re]

    %33
    re16 sib do re mib,8 re'
    do2
    sib4 r8 la

    %36
    sol4 fad
    sol r
    R2*15

    %53
    r4 r8 sib
    mib[sib mib fa]
    sol8.[fa16 mib8 re]\mbreak

    %56
    mib8 r sib' r
    sib,[sib'16 lab sol8 fa]
    mib4 r

    %59
    R2*9
    si8[si si si]
    sol4. do,8

    %70
    sol [sol' sol, sol']
    sol,[sol' sol, sol']

    %72
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']

    %75
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,4 r

    %78
    r4 r8 sol'
    sol4. si8
    sol4. sol8

    %81
    do[sol do sol]
    do16[re mib re do8 si]
    do[sol do sol]\mbreak

    %84
    do16[re mib re] do8[si]
    do sib!16 lab sol8]fad
    sol[la?16 si do8 re16 mib]

    %87
    fa8  re si8.\tr do16
    do8[sol do re]
    sol,4 r

    %90
    R2
    do8[sol do sol]
    do16[re mib re do8 si]

    %93
    do[fa, sol sol,]
    do2\fermata  %%%%% OOOOOKKKK
    R4.*4

    %99
    mib'4 r8
    re4 r8
    do4 r8

    %102
    si4 r8
    do4.
    re
    mib8(re) do

    %106
    si(la) sol
    mib' fa sol
    re4.

    %109
    do16 si do re mib do
    si la si do re si
    do si do re mib do\mbreak

    %112
    si la si do re si
    do4.~
    do8 sib16 la sib8

    %115
    la4.
    sol4 r8
    R4.

    %118
    re'8 do sib
    la sol fad
    sol la sib

    %121
    la4.
    re4 r8
    re4 r8

    %124
    re4 r8
    re4 r8
    re4 r8

    %127
    sol,16 fa sol lab sib sol
    do4 r8
    fa,16 mib fa sol lab fa

    %130
    sib4 r8
    mib,16 re mib fa sol mib
    lab4.
    sol4 r8

    %134
    R4.
    mib'
    fa

    %137
    sol8 fa mib
    re do sib
    sib' fa16 mib re8\mbreak

    %140
    sol mib16 re do8
    fa re16 do sib8
    mib do16 sib lab8

    %143
    mib'4 r8
    R4.
    mib,

    %146
    fa
    sol8 fa mi
    fa4.

    %149
    R
    fa
    sol

    %152
    la8 sol fad
    sol4.
    R

    %155
    sol
    la
    sib8 la sol

    %158
    do sol' r
    la sib r
    sol la r

    %161
    fa sol r
    mib  fa r
    re sol, r

    %164
    r do4~
    do8 si16 la si8
    do4.
    re\mbreak

    %168
    mib8(re) do
    si(la) sol
    do4.

    %171
    re
    mib8 re do
    si la sol

    %174
    do4.
    re
    mib8 re do

    %177
    si la sol
    R4.
    do8(sib) lab

    %180
    R4.
    sib8(lab) sol
    sol4 r8

    %183
    la4 r8
    la4 r8
    si do re

    %186
    mib re do
    si do re
    mib re do

    %189
    si do re
    do4 r8
    R4.*5\mbreak

    %196
    sol,4 r8
    sol4 r8
    R4.*2

    %200
    sol''8(fa) mib
    mib(re) do
    fa si, re

    %203
    mib la, do
    re sol, sib!
    do fa, si

    %206
    do mib r
    si re r
    do mib r

    %209
    si re r
    do4.
    re4.

    %212
    do4 r8
    do4.
    re

    %215
    do16 si do re mib8
    mib, re re
    mi4.\fermata

}

IXvlan = \relative do' {

    r8
    R2
    r4 r8 sol
    do[sol do re]

    %4
    mib8.[re16 do8 si]
    do r sol' r
    sol,4 r8 si

    %7
    sol sol'4 mib8
    do do4 lab8
    fa fa'4 re8

    %10
    sib sib4 sol8
    mib' mib4 do8
    lab'2~

    %13
    lab
    si,4 r8 sol
    lab4 sol

    %16
    sol r
    R2*12
    r8 re'4 sib8

    %30
    sol sol'4 mib8
    do do4 la8
    fa fa'4 re8

    %33
    sib sib4 sib'8
    la4. fad8
    re4 r8 fad8

    %36
    re[mib la, re]
    re4 r
    R2*3

    %41
    r8 sol16[la sib8 sol]\mbreak
    do,4 r
    r8 fa16[sol la8 fa]

    %44
    sib,4 r
    r8 mib16[fa sol8 mib]
    lab,4 r

    %47
    R2*7
    r4 r8 sib
    mib[sib mib fa]\mbreak

    %56
    sol8.[fa16 mib8 re]
    mib[mib16 fa sol8 lab]
    sol4 r

    %59
    R2*3
    sol,8[sol sol sol]
    lab4. lab8

    %64
    la![la la la]
    sib4. sib8
    si[si si si]

    %67
    do4 fa
    re8[re re re]
    do4. do8

    %70
    sol [sol' sol, sol']
    sol,[sol' sol, sol']

    %72
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']

    %75
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,4 r

    %78
    r r8 re'
    mib4. sol8
    sol4. sol8

    %81
    mib4 r
    R2*6
    mib4. fa8

    %89
    mib4 r
    R2
    do'8[sol do sol]

    %92
    do16 re mib re do8 si
    do[fa, sol sol,]
    do2\fermata  %%%%% OK

    %95
    R4.*4
    sol'4 r8
    sol4 r8

    %101
    sol4 r8
    sol4 r8
    sol4.

    %104
    R4.
    do,
    re

    %107
    mib8 re do
    si la sol
    sol'4 r8

    %110
    sol8 sol sol
    sol4 r8\mbreak
    sol sol sol

    %113
    sol8. fa16 mib8
    re4.
    do

    %116
    re
    R4.*5
    sol4.

    %123
    la
    sib8 la sol
    fad mib re

    %126
    R4.*7
    mib4.
    fa

    %135
    sol8 fa mib
    re do sib
    R4.*2

    %139
    fa'16 mib fa sol lab fa\mbreak
    mib re mib fa sol mib
    re do re mib fa re

    %142
    do sib do re mib do
    sib8 lab sol
    do sib4

    %145
    sib8 lab sol
    r r re'
    mi re do

    %148
    do sib lab
    reb do4
    do8 sib lab

    %151
    r r mi'
    fad mi re
    re do sib

    %154
    mib re4
    re8 do sib
    R4.

    %157
    re8 do sib
    sol'4 r8
    R4.*5

    %164
    sol16 lab sol fa sol mib
    fa sol fa mib fa re
    sol,4 r8

    %167
    R4.
    do8 do do
    sol sol sol

    %170
    sol sol sol
    sol sol sol
    sol sol sol

    %173
    sol sol sol
    sol sol sol
    sol sol sol

    %176
    sol sol sol
    sol sol sol
    sol'(fa) mib

    %179
    R4.
    fa8(mib) re
    R4.

    %182
    mib4 r8
    do4 r8
    la4 r8

    %185
    sol4.
    sol'8 sol sol
    sol sol sol

    %188
    sol sol sol
    sol sol sol
    sol4 r8

    %191
    R4.*2
    r8 r do,
    fa sol sol,

    %195
    do4 r8\mbreak
    R4.*4
    sol'4 sol8

    %201
    do4 do8
    si4 sib8
    la4 lab8

    %204
    sol4 sol8
    fa4 fa8
    mib4 r8

    %207
    sol4 r8
    sol4 r8
    sol4 r8

    %210
    sol8. fa16 sol mib
    lab8 sol4
    sol4 r8

    %213
    sol8. fa16 sol mib
    lab8 sol4
    sol r8

    %216
    sol, sol sol
    sol4.\fermata

}

IXvocen = \relative do'' {

    \autoBeamOff
    r8
    R2*15
    r4 r8 sol
    do[sol] do[re]

    %18
    mib8. re16 do8 si
    do[re16 mib re8] do
    si8. la16 sol8 sol16 sol

    %21
    do8 mib do sib
    lab8. sol16 fa8 do'
    re fa re do

    %24
    si8.[la16] sol8 mib'
    re do16[sib] la8 sol
    re' do16 sib la8 sol

    %27
    re'[fad,] sol \parenthesize do
    sib4(la\tr)
    sol r

    %30
    R2*6
    r4 r8 re'
    sol,[re] sol[la]

    %38
    sib[re16 do] re8 fad,
    sol16 [la sib do] re8 mib
    fad,[mi] re4

    %41
    r r8 sol\mbreak
    mib'8 mib16 mib mib8 mib
    mib16[do] re[mib] fa,8 mib'

    %44
    re8 re re re
    re16[sib do re] mib,8 re'
    do re16 do fa[mib] re[do]

    %47
    re8. do16 sib4
    r r8 re
    mib sib lab sib

    %50
    mib sib lab sib
    mib re16 do sib8 lab
    sol mib' fa,4\tr

    %53
    mib r
    R2*3
    r4 r8 sib'

    %58
    mib sib mib fa
    re8. do16 sib8 mib
    do sib lab4

    %61
    sol r8 sib
    sib16[lab sib do] sib[do lab sib]
    do[sib do re] do [re mib re]

    %64
    do[sib do re] do[re sib do]
    re[do re mib] re[mib fa mib]
    re[do re mib] re[mib do re]

    %67
    mib8[re16 mib fa mib] re[do]
    si8[la] sol4
    r r8 mib'

    %70
    re mib re do
    si[la] sol mib'
    re mib re do

    %73
    si8. la16 sol8 re'
    mib16[re mib fa] mib8[fa]
    re16[do re mib] re8[mib]

    %76
    do16[si do re] do8[re]
    si la16 sol re'8 fa
    mib re16[do] si4

    %79
    do r
    r r8 sol
    do[sol do sol]

    %82
    do16[re mib re do8 si]
    do[sol do sol]\mbreak
    do16[re mib re] do8[si]

    %85
    do[sib!16 lab sol8] fad
    sol[la?16 si do8 re16 mib]
    fa8  re si8.\tr do16

    %88
    do4 r8 lab
    sol[la?16 si do re] mib[fa]
    sol8 do, si8. do16

    %91
    do4 r
    R2*3  %%%% fin qui OK
    do4.

    %96
    re
    mib8[re do]
    si[la] sol

    %99
    do16[si do re mib do]
    si[la si do re si]
    do[si do re mib do]

    %102
    re[do re mib fa re]
    mib8 do4~
    do8[si16 la si8]

    %105
    do4.
    R4.*10
    sol4.

    %117
    la
    sib8[la sol]
    fad[mi] re

    %120
    R4.*2
    sol16[fad sol la sib sol]
    fad[mi fad sol la fad]

    %124
    sol[fad sol la sib sol]
    la[sol la sib do la]
    sib8[la] sol

    %127
    mib'[do sib]
    lab[sol fa]
    re'[sib lab]

    %130
    sol[fa mib]
    do'[lab sol]
    fa16[sol lab8 fa]

    %133
    sol[mib mib']~
    mib[re16 do re8]
    mib4.

    %136
    R4.*7
    mib,4.
    fa

    %145
    sol8[fa mib]
    sib'[la] sib
    R4.

    %148
    fa
    sol
    lab8[sol fa]

    %151
    do'[si] do
    R4.
    sol

    %154
    la
    sib8[la sol]
    re'[(do)] re

    %157
    R4.
    mib16[fa mib re mib do]
    re [mib re do re sib]

    %160
    do[re do sib do lab]
    sib[do sib lab sib sol]
    lab[sib lab sol lab fa]

    %163
    sol8[la?16 si do re]
    mib8 do r
    R4.*3\mbreak

    %168
    mib16[re mib fa sol mib]
    re[do re mib fa re]
    do[re mib fa sol8]

    %171
    sol,4 r8
    mib'16[re mib fa sol mib]
    re[do re mib fa re]

    %174
    do[re mib fa sol8]
    sol,4 r8
    R4.*2

    %178
    do16[sib do re do sib]
    lab[sol lab sib do lab]
    sib[lab sib do sib lab]

    %181
    sol[fa sol lab sib sol]
    do[sib do re do sib]
    la![sol la sib do la]

    %184
    re[do re mib re do]
    si8[la] sol
    R4.*4

    %190
    mib'8[re do]
    si[la] sol
    lab4.

    %193
    sol16[fa sol8 mib']
    fa,16[mib fa8 re']
    mib,16[sol la si do8]\mbreak

    %196
    r16 si[do re mib8]
    r16 re[mib fa sol8]
    r do,4~

    %199
    do8[si16 la si8]
    do4 r8
    mib16[fa mib fa mib fa]

    %202
    re[mib re mib re mib]
    do[re do re do re]
    sib[do sib do sib do]

    %205
    lab[sib lab sib lab sib]
    sol8 sol[do]
    r si[re]

    %208
    r do[mib]
    r re[fa]
    mib do4~

    %211
    do8[si16 la si8]
    do16[re mib fa] sol8
    r do,4~

    %214
    do8[si16 la si8]
    do4.
    R

    %217
    R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IXtesto = \lyricmode {

    Lauda - te, pueri, _ _ lauda - te Dominum _ _

     sicut _ erat _ in prin -- cipio, _ _ et nunc et nunc et semper _ et semper _ et in saecula _ _  sæculo - - - rum. A -- men.

     A solis _ ortu _ usque _ ad occa - sum, lau -- dabile _ _ nomen _ Domini _ _ et nunc et nunc et semper _

     lau -- dabile _ _ nomen _ Domini _ _ et nunc et nunc et semper _ et in saecula _ _  sæculo - - rum. A -- men.

    Sit nomen _ nomen _ Domini _ _ sit bene - dictum, _ sit be - - - - - - - - - - nedic - tum

    et nunc et nunc et semper _ et semper _ et in saecula _ _  in sæ - - - - - - cula _ saecu - lorum. _ A -- men.

    Lauda - - - - - - te no - men Domini _ _ lauda - te nomen _ Domini _ _

    A - - - men A - - - - - men A - - - men  A - - - - men A - - - - - -  men A - - - men A - - - men A - - - men  A - - - - - - men

    A - - men A - - men A - - - - - - - men A - men A - - - - - - men A - - - -  men A - - - men A - men A -- men.

}

IXbcn = \relative do {

    r8
    R2*2
    r4 r8 sol
    do[sol do re]

    %5
    mib8.[re16 do8 si]
    do r sol' r
    do,[do16 re mib8 do]

    %8
    fa[fa16 sol lab8 fa]
    sib,[sib16 do re8 sib]
    mib[mib16 fa sol8 mib]

    %11
    lab,2~
    lab~
    lab

    %14
    sol4 r8 do
    fa4 sol
    do,4 r

    %17
    do4. si8
    do4. sol'8
    mib4 fa

    %20
    sol4. fa8
    mib8[re mib do]
    fa4. fa8

    %23
    fa[mib fa re]
    sol4. fad8
    sol4 r

    %26
    sol4 r
    fad8 [re mib do]
    re4 re,

    %29
    sol8[sol'16 la sib8 sol]
    do,[do16 re mib8 do]
    fa[fa16 sol la8 fa]

    %32
    sib,[sib16 do re8 sib]
    mib[mib16 fa sol8 sol]
    re2

    %35
    sol,4 r8 re'
    sol[do, re re,]
    sol4 r8 re'

    %38
    sol[re sol la]
    sib4. do8
    re[re,16 mi fad8 re]

    %41
    sol4 r
    r8 do,16[re mib8 do]
    fa4 r
    r8 sib,16[do re8 sib]

    %45
    mib4 r
    lab,2
    sib8[sib16 do re8 do]

    %48
    sib8[sib16 do re8 sib]
    mib,4 r
    sol4 r

    %51
    sol4 re'
    mib16 fa sol lab sib8 sib,
    mib,4 r

    %54
    mib'4 r
    mib r8 sib\mbreak
    mib[sib mib fa]

    %57
    sol8.[fa16 mib8 re]
    mib4 sol8 lab
    sib lab sol4

    %60
    lab8[sol fa sib,]
    mib[fa sol re]
    mib4 r

    %63
    R2*5
    sol,8[sol sol sol]
    do2

    %70
    R2*7
    sol'8[la si sol]
    do[fa, sol sol,]

    %79
    do,[mib'16 re do8 si]
    do4 r
    do do

    %82
    do4. sol8
    do4 do\mbreak
    do4. sol8

    %85
    do4~do16 mib re do
    si8[sol mib' do]
    fa4 sol

    %88
    do,4. si8
    do4 r
    do16 re mib fa sol8 sol,

    %91
    do'[sol do sol]
    do16 re mib re do8 si
    do[fa, sol sol,]

    %94
    do2\fermata  %%%% OO KK
    do8 do'4~
    do8 si16 la si8

    %97
    do4 do,8
    sol'8. fa16 mib re
    do4 r8

    %100
    sol4 r8
    do4 r8
    sol4 r8

    %103
    do8. re16 mib do
    fa8 sol sol,
    do8. re16 mib do

    %106
    sol'8. la16 si sol
    do,4.
    sol'

    %109
    do,4 r8
    sol sol' sol,
    do4 r8\mbreak

    %112
    sol sol' sol,
    do4 r8
    r sol'4

    %115
    la4.
    sib8 la sol
    fad mi re

    %118
    sol8. la16 sib sol
    re'4 re,8
    sol re sol,

    %121
    re'8. do16 sib la
    sol4 r8
    re'4 r8

    %124
    sol,4 r8
    re'4 r8
    sol,4 r8

    %127
    do'16 sib lab8 sol
    fa sol lab
    sib16 lab sol8 fa

    %130
    mib fa sol
    lab16 sol fa8 mib
    re16 mib fa8 re

    %133
    mib16 fa sol8 mib
    lab sib sib,
    mib8. fa16 sol mib

    %136
    sib'8. do16 re sib
    mib,8. fa16 sol mib
    sib'4 sib,8

    %139
    \clef tenor re'16 do re mib fa re\mbreak
    do sib do re mib do
    sib lab sib do re sib

    %142
    lab sol lab sib do lab
    \clef bass sol16 fa mib8 sol
    lab sib sib,

    %145
    mib fa sol
    re do sib
    sib'4.

    %148
    lab8 sol fa
    sib do do,
    fa sol lab

    %151
    mi re do
    do'4.
    sib8 la sol

    %154
    do re re,
    sol la sib
    fad mi re

    %157
    sol la sib
    do4.~
    do8 sib4~

    %160
    sib8 lab4~
    lab8 sol4~
    sol8 fa4~

    %163
    fa8 mib16 re do si
    do4.
    re

    %166
    mib8 re do
    si la sol\mbreak
    do4 r8

    %169
    R4.*9
    mib4 r8
    fa4 r8

    %180
    sib4 r8
    mib,4 r8
    mib4 r8
    fa4 r8

    %184
    fad4 r8
    sol4 sol,8
    do do do

    %187
    sol' sol sol
    do, do do
    sol' sol sol

    %190
    do,4 r8
    R4.*7
    do8. re16 mib do

    %199
    fa8 sol sol,
    do4 do,8
    R4.*5

    %206
    do'4 r8
    sol4 r8
    do4 r8

    %209
    sol4 r8
    do8. re16 mib do
    fa8 sol sol,

    %212
    do4 r8
    do8. re16 mib do
    fa8 sol sol,

    %215
    do4 r8
    do sol' sol,
    do4.\fermata

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2*7
    <7>2
    <7->
    <7>
    <7>
    <6+>
    s
    <_!>
    s2*5
    <_!>2
    s
    <_->
    s
    <_!>4 s8 <7>
    s2*3
    <6 4>4 <5 3+>
    s2
    <7>
    <7>
    <7>
    <7>
    <7 _+>
    s2*7
    s8 <7> s4
    <7>2
    s8 <7> s4
    <7>2
    <7>4 <6>
    s2
    s4 s8 <7->
    s2
    s
    s4 <6 5->
    s2*8
    s4 <_->8 <7->
    s2*7
    <7 _!>2
    s2*8
    <_!>2
    s2*7
    s4 s8 <_+>
    s2
    s
    s4 s8 <7- 5>
    s2*6
    s4.
    <2>8 <3> s
    s4.
    <_!>
    s
    <_!>
    s4.*3
    <6 5>4.
    s4.*3
    <7>4.
    s4.*6
    <7>8 <6+> s
    s4.*3
    <_+>4.
    s
    <_+>
    s
    <_+>
    s4.*4
    <7 _->4.
    s
    <7>
    s
    <7 5->
    s
    <6 5>
    s4.*5
    <7>8 <6> s
    <7> <6> s
    <7> <6> s
    s4.
    <6 5>
    s
    s
    <6! 4 2>
    s
    <_->8 <_!> s
    <_->4.
    s
    <6 4+ 2>
    s
    <6 5>8 <_+> s
    s4.*4
    <4+ 2>8 <6> s
    <4- 2>4.
    <4 2>
    <4- 2>
    <4+ 2>8 <6>4
    s4.
    <7>8 <6!> s
    s4.*13
    <_- 7>4.
    <7 ->
    <7>
    s
    s
    s
    <_!>4 <7>8
    s8 <4 2> <3>
    <_!> <6 4> <7 5>
    s <4 2> <3>
    <_!> <6 4> <7 5>
    s4.*9
    <6  5>4.
    s4.*7
    <_!>4.
    s
    <7>
    s4.*6
    s8 <5 4> <3!>

}

forma = {

    \time 2/4
    \key sib\major
    \tempo 2 = 60
    \partial 8 s8
    s2*94
    \bar "||"\break
    \time 3/8
    \key sib\major
    \tempo 4. = 80
    s4.*123
    \bar "|."

}


IXvl = {
    \IXglobal
    %\notypeset
    <<\IXvln\forma>>
}

IXvlI = {
    \IXglobal
    <<\IXvlIn\forma>>
}

IXvla = {
    \IXglobal
    \clef alto
    <<\IXvlan\forma>>
}

IXvoce = {
    \new Voice = "amen"
    \IXglobal
    %\clef soprano
    <<\IXvocen\forma>>
}



IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn\forma\IXbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
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

    \markup \huge "[1.] All[egr]o"


    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \Ivl
            >>
            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>
            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column {"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \Ivoce
                \new Lyrics \lyricsto "laudate" \Itesto
            >>
            \new Staff  <<
                \set Staff.instrumentName = \markup\center-column {"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.3\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \markup \huge "[2.] Largo"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvl
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \IIvoce
                \new Lyrics \lyricsto "sit" \IItesto
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \markup \huge "[3.] All[egr]o"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvl
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \IIIvoce
                \new Lyrics \lyricsto "solis" \IIItesto
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

        systems-per-page = #8

    }

    \markup \huge "[4.] And[an]te"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \IVvoce
                \new Lyrics \lyricsto "excelsus" \IVtesto
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \IVbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

    \markup \huge "[5.] Largo"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \Vvl
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \Vvla
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \Vvoce
                \new Lyrics \lyricsto "quis" \Vtesto
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \Vbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \markup \huge "[6.] Presto"


    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvl
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvlI
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIvla
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \VIvoce
                \new Lyrics \lyricsto "suscitans" \VItesto
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \VIbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \markup \huge "[7.] All[egr]o"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIIvl
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIIvla
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \VIIvoce
                \new Lyrics \lyricsto "ut" \VIItesto
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \VIIbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

        systems-per-page = #6

    }

    \markup \huge "[8.] Largo"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIIIvl
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \VIIIvoce
                \new Lyrics \lyricsto "gloria" \VIIItesto
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \VIIIbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \markup \huge "[9.] All[egr]o"


    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IXvl
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IXvlI
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IXvla
            >>
            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \IXvoce
                \new Lyrics \lyricsto "amen" \IXtesto
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \IXbc
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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
