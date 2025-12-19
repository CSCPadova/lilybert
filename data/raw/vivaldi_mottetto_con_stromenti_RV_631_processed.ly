\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

solo = ^\markup \italic { Seul }

dolce =_\markup\italic"Doux"

tu = ^\markup \italic "Tous"

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

  mib8(sib) sol'
  sol fa lab,
  lab sol sol'

  %4
  sol(fa) lab
  lab sol16 fa sol lab
  fa4 r8

  %7
  mib(sib) sol'
  sol(fa) lab\mbreak
  lab(sol) reb

  %10
  reb?(do) sol'
  sol(fa) do
  do sib mib,

  %13
  fa mib sib'
  re,16 mib fa8 mib
  lab sol sib

  %16
  lab sol sib
  lab sol sol'
  fa16 sol lab8 re,

  %19
  mib4 r8\mbreak
  mib8 sib r
  R4.*3

  %24
  fa'16 sol lab8 fa
  mib8 sib sol'
  sol fa lab,

  %27
  lab sol sol'\mbreak
  sol sol16 fa sol lab
  fa16 sol lab8 fa

  %30
  sib, la do
  R4.*10
  sib'8 fa mib

  %42
  mib(re) sib'\mbreak
  sib(la) mib
  mib re fa,

  %45
  mib re fa
  mib re fa
  sib16 do re8 do

  %48
  sib re, mib
  mib re fa
  mib re fa'

  %51
  sib re, do
  sib(fa') sib,\mbreak
  R4.*3

  %56
  re16 mib fa8 re
  re fa sib,
  sib la do

  %59
  do fa, mib'
  mib re16 do re mib\mbreak
  fa16 sol lab8 fa

  %62
  re16 mib fa8 re
  re4 r8
  R4.*6
  sol16 lab sib8 sol

  %71
  R4.*7
  sol16 lab sib8 sol
  R4.*5

  %84
  mib8 sib sol'
  sol fa lab,
  lab sol sol'

  %87
  sol fa lab\mbreak
  lab sol16 fa sol lab
  fa4 r8

  %90
  mib sib sol'
  sol fa lab
  lab sol sib,

  %93
  lab sol sib
  lab sol lab'
  sol16 lab sib8 re,

  %96
  mib4 sib8
  lab sol sib
  lab sol lab'

  %99
  sol16 lab sib8 re,
  mib4.\fermata
  R4.*11

  %112
  mib16 fa sol8 fa\mbreak
  mib16 fa sol8 fa
  mib16 fa sol8 fa

  %115
  mib do sol'
  R4.*9

}

IvlIn = \relative do'' {

  sib8 sol mib'
  mib(re) fa,
  fa mib mib'

  %4
  mib(re) fa
  fa mib16 re mib fa
  re4 r8

  %7
  sib sol mib'
  mib(re) fa\mbreak
  fa(mib) sib

  %10
  sib(lab) sib'
  sib(lab) lab,
  lab sol mib

  %13
  fa mib sib'
  re,16 mib fa8 mib
  lab sol sib

  %16
  lab sol sib
  lab sol mib'
  re16 mib fa8 fa,

  %19
  sib4 r8\mbreak
  mib sib r8
  R4.*3

  %24
  re16 mib fa8 re
  mib8 sib sol'
  sol fa lab,

  %27
  lab sol sol'\mbreak
  sol sol16 fa sol lab
  re,16 mib fa8 re

  %30
  sib la do
  R4.*10
  re8 do4

  %42
  do8(sib) sol'\mbreak
  sol(fa) do
  do sib fa

  %45
  mib re fa
  mib re fa
  sib16 do re8 do

  %48
  sib re, mib
  mib re fa
  mib re do'

  %51
  re sib la?
  sib fa' sib,\mbreak  %%%%% OK
  R4.*3

  %56
  sib16 do re8 sib
  re fa sib,
  sib la do

  %59
  do fa, mib'
  mib re16 do re mib\mbreak
  do8 do do

  %62
  sib16 do re8 sib
  sib4 r8
  R4.*6

  %70
  mib16 fa sol8 mib\mbreak
  R4.*7
  mib16 fa sol8 mib\mbreak

  %79
  R4.*2
  sol8(fa) mib
  re16 do sib8 sol'

  %83
  lab(sol) fa
  mib sol, mib'
  mib re fa,

  %86
  fa mib mib'
  mib re fa\mbreak
  fa mib16 re  mib fa

  %89
  re4 r8
  sib sol mib'
  mib re fa

  %92
  fa mib sib
  lab sol sib
  lab sol fa'

  %95
  mib16 fa sol8 fa
  mib4 sib8
  lab sol sib

  %98
  lab sol fa'
  mib16 fa sol8 fa
  mib4.\fermopz

  %101
  R4.*11
  do16 re mib8 re\mbreak
  do16 re mib8 re

  %114
  do16 re mib8 re
  mib do sol'
  R4.*9

}

Ivlan = \relative do' {

  sol'8 mib sib'
  sib,4.~
  sib~

  %4
  sib
  sib
  re16 mib fa8 re

  %7
  sol4.
  sib~\mbreak
  sib4 sol8

  %10
  mib4 sol8
  lab4 fa8
  do4 mib,8

  %13
  fa mib sib'
  re,16 mib fa8 mib
  lab sol sib

  %16
  lab sol sib
  lab sol lab
  do4 sib8

  %19
  sib4 r8\mbreak  %%% OK
  mib4.
  sib

  %22
  mib
  sib
  sib'8 sib sib

  %25
  mib,4.
  sib
  mib\mbreak

  %28
  mib8 mib lab,
  sib sib' sib
  fa4.

  %31
  sol
  la
  sib4 sib,8

  %34
  sib16 do re8 sib
  fa'4.\mbreak
  sib,16 do re8 sib

  %37
  fa'4.
  fa8 sib mi,
  fa16 sol la8 fa

  %40
  sib mib, fa
  fa4 fa8
  fa4 sol8\mbreak

  %43
  la sib do
  fa,4 sol,8
  mib re fa

  %46
  mib re fa
  sib16 do re8 do
  sib re, mib

  %49
  mib re fa
  mib re fa'
  fa fa fa

  %52
  sib,4.\mbreak
  fa'4 fa8
  fa4 fa8

  %55
  sib,4.
  fa'4 fa8
  sib,4 sib8

  %58
  fa'4 fa8
  fa4 fa8
  fa4 fa8\mbreak

  %61
  lab lab lab
  fa fa fa
  fa4 r8

  %64
  R4.*6
  sib8 sib sib
  mib,16 fa sol8 fa

  %72
  mib re mib
  do sib do
  lab sol sib

  %75
  lab sol sib
  lab sol sib
  mib sib sib

  %78
  sib' sib sib\mbreak
  R4.*5
  sib,4.

  %85
  sib
  sib
  sib\mbreak

  %88
  sib4 sib8
  re16 mib fa8 re
  sol4.

  %91
  sib
  sib4 sib,8
  lab sol sib

  %94
  lab sol sib'
  sib4 sib,8
  sol4 sib8

  %97
  lab sol sib
  lab sol sib'
  sib4 sib8

  %100
  sol4.\fermata   %%%%%% OK
  R4.*11
  sol4 sol8\mbreak

  %113
  sol4 sol8
  sol4 sol8
  R4.*10

}

Ivocen = \relative do'' {

  \autoBeamOff

  R4.*19
  mib8[sib] sol'
  sol fa lab,

  %22
  lab sol sol'
  sol fa16[mib] fa8
  R4.

  %25
  mib8 [sib] sol'
  sol fa lab,
  lab sol sol'\mbreak

  %28
  sol sol16[fa] sol[lab]
  fa4 r8
  sib,[la] do

  %31
  do sib re
  re do mib
  mib re16[do] re8

  %34
  sib[fa] re'
  re[do16 sib] do8\mbreak
  sib[fa] re'

  %37
  re do16[(sib)] do8
  fa[mi16 re] do[sib]
  la?(sol) fa8 mib'

  %40
  re mib do
  sib4 r8
  R4.*10

  %52
  re8[fa] sib,\mbreak %%%% fine p 180R
  sib la do
  do fa, mib'

  %55
  mib re16[do] re8
  R4.
  re8[fa] sib,

  %58
  sib la do
  do fa, mib'
  mib re16[do] re[mib]

  %61
  do4 r8
  R4.
  sib8 [fa'] lab,!

  %64
  lab sol4
  sib8[mib] lab,
  lab sol16[fa] sol8

  %67
  sib[lab16 sol] fa[mib]
  do'8[sib16 lab] sol[fa]\mbreak  %%% fine p 180V
  re'8[do16 sib] lab[sol]

  %70
  mib'8 mib, r
  mib'16[fa sol8 fa]
  mib[re mib]

  %73
  do[sib do]
  lab[sol sib]
  lab[sol sib]

  %76
  lab[sol sib]
  mib16[fa] sol8 fa
  mib4 r8\mbreak

  %79
  sol[fa] mib
  re[do] sib
  mib[re] do

  %82
  sib16[lab] sol8 mib'
  fa mib re
  mib4 r8

  %85
  R4.*16
  mib8[do] lab'
  lab sol do,

  %103
  do si fa'
  fa mib16[re] mib8\mbreak
  mib16[fa] sol8 sol,

  %106
  lab sol16 lab fa8
  fa'16[sol] lab8 do,
  si la?16[si] sol8

  %109
  fa' re4
  mib8 re do
  fa sol sol,

  %112
  do4.\mbreak
  R4.*2
  mib8 do sol'

  %116
  sol fad16[mi] fad8
  la do,4
  sib8 re sol

  %119
  sib,do la
  sol4 r8\mbreak
  mib'[re] sol

  %122
  sol fad sol
  sib, do la
  sol4.

}

Itesto = \lyricmode {

  O qui coeli _ ter -- raeque _ se -- renitas _ _  et fons lucis _ fons lucis _ et arbiter _ _ es,

  o qui coeli _ ter -- raeque _ se -- renitas _ _ o qui coeli _ o qui terraeque _ _ et fons lucis _ et arbiter _ _ es,

  o qui coeli _ ter -- raeque _ se -- renitas _ _  et fons lucis _ fons lucis _ et arbiter _ _ es,

  o qui coeli _ o qui terraeque _ _ et fons lucis _ et fons lucis _ et  ar - - - - - biter _ es,

  et fons lucis _ et fons lucis _ et  arbiter _ _ es,

  Unde _ regis _ aeterna _ _ tua sidera _ _  mitis _ con -- sidera _ _ considera _ _ considera _ _ _ nostra _ vota, _ clamores _ _ et spes,

  mitis _ con -- sidera _ _ nostra _ vota, _ clamores _ _ et spes, nostra _ vota, _ clamores _ _ et spes.




}

Ibcn = \relative do {

  mib4.
  sib
  mib

  %4
  sib
  re8 mib mib,
  sib'16 do re8 sib

  %7
  mib4.
  sib\mbreak
  mib

  %10
  lab4 mib8
  lab4 lab,8
  mib'4 mib8

  %13
  fa mib sib'
  re,16 mib fa8 mib
  lab sol sib

  %16
  lab sol sib
  lab sol mib
  lab,4 sib8

  %19
  mib4 r8\mbreak
  R4.*4
  sib'8 sib, sib

  %25
  mib4 r8
  R4.*3
  sib'8 sib, sib

  %30
  R4.*11
  sib8 lab fa'
  sib4 sib,8\mbreak

  %43
  fa' sol la
  sib sib, fa'
  mib re fa

  %46
  mib re fa
  sib16 do re8 do
  sib re, mib

  %49
  mib re fa
  mib re fa
  sib, fa' fa,

  %52
  sib4 r8\mbreak
  R4.*3
  sib'8 sib, sib

  %57
  R4.*4\mbreak
  fa'4 fa8
  sib sib, sib

  %63
  sib do re
  mib4.
  sib8 do re

  %66
  mib4.
  sol4 r8
  lab4 r8

  %69
  sib4 r8
  mib, mib mib
  \clef tenor mib'16 fa sol8 fa

  %72
  mib re mib
  do sib do
  lab sol sib

  %75
  lab sol sib
  lab sol sib
  \clef bass mib, sib' sib,

  %78
  mib mib mib\mbreak
  mib4 r8
  sib4 r8

  %81
  mib4 r8
  mib4 mib8
  lab sib sib,

  %84
  mib4.
  sib
  mib

  %87
  sib\mbreak
  sib8 mib4
  sib16 do re8 sib

  %90
  mib4.
  sib
  mib4 sib'8

  %93
  lab sol sib
  lab sol sib
  mib, sib' sib,

  %96
  mib4 sib'8\mbreak
  lab8 sol sib
  lab sol sib

  %99
  mib, sib' sib,
  mib4.\fermopz
  do16 re mib8 re

  %102
  do16 re mib8 do
  sol'16 la? si8[sol]
  do,16 re mib8 do\mbreak

  %105
  do16 re mib8 do
  fa4.
  re16 mib fa8 fad

  %108
  sol4.
  sol,16 la? si8 sol
  do re mib

  %111
  fa sol sol,
  do do' sol\mbreak
  do, do' sol

  %114
  do, do' sol
  do,4.
  re

  %117
  re16 mi fad8[re]
  sol16 lab sib8 lab
  sol do, re

  %120
  sol,4 r8\mbreak
  sol'16 lab sib8 sol
  re4 sol8

  %123
  sol do, re
  sol,4.

}

forma = {

  \time 3/8
  \key mib\major
  \tempo 4 = 75
  s4.*124
  \bar "||"
  \mark\markup\smaller\center-column {D.C.}

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
  \new Voice = "o qui coeli"
  \Iglobal
  %\clef soprano
  <<\Ivocen\forma>>
}



Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn\forma>>
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

IIvocen = \relative do'' {

  \autoBeamOff
  do8 do16 do re8 mib fad,4 fad
  fad'8 la do, do16 sib sol8 sol r4
  re'8 re mi fa16 sol\mbreak dod,8 dod r la
  mi' mi sol fa re re r4
  re8 re re mib16 fa si,8 si r re\mbreak
  fa, fa re' mib re4 r
  fad16 fad fad8 r fad16 sol re8 re r4

}

IItesto = \lyricmode {

  Fac ut sordescat _ _ tellus _  dum respicimus _ _ _ coelum; _  fac ut bona _ su -- perna _  con -- stanter _ diligamus _ _ _  et sperantes _ _ aeterna _ _  quid -- quid caducum _ _   est odio _ _  habeamus. _ _ _

}

IIbcn = \relative do {

  do1~
  do2 sol'~
  sol1~
  sol2 fa~
  fa1
  si,2 do~
  do re4 sol,

}

forma = {

  \time 4/4
  \key sol\minor
  \tempo 4 = 75
  s1*7
  \bar "|."

}

IIvoce = {
  \new Voice = "fac"
  \notypeset
  \IIglobal
  %\clef soprano
  <<\IIvocen\forma>>
}



IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn\forma>>
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

  do8 sol'4 mib do8
  re sol4 re sib8
  do fa4 lab do,8

  %4
  si sol'4 sol re8
  mib sol4 sol mib8\mbreak
  re sol4 sol re8

  %7
  mib do mib, do' re, si'
  do4 r r
  R2.*14

  %23
  re8 sol4 sib sol8
  lab re,4 lab' fa8\mbreak
  sol8 do,4 sol' do8

  %26
  fad, sol sib, sol' la,[fad']
  sol4 r r
  R2.*18

  %46
  do,8 sol'4 mib do8\mbreak
  re sol4 re sib8
  do fa4 lab do,8

  %49
  si sol'4 sol re8
  mib sol4 sol mib8\mbreak
  re sol4 sol re8

  %52
  mib do mib, [do'] \parenthesize re, si'
  do2.\fermata
  R2.*18

}

IIIvlIn = \relative do'' {

  sol8 mib'4 do sol8
  sol' re4 sib re8
  fa do4 lab fa'8

  %4
  re si4 re sol8~
  sol do,4 mib sol8~
  sol si,4 re sol8~

  %7
  sol do, mib,[do'] re, si'
  do4 r r
  R2.*14

  %23
  sib8 re4 sol re8~
  re lab'4 re, lab'8\mbreak
  do, sol'4 do, sol'8

  %26
  lab sib, sol [sib] fad re'
  sib4 r r
  R2.*18

  %46
  sol8 mib'4 do sol8\mbreak
  sol' re4 sib! re8
  fa do4 lab fa'8

  %49
  re si4 re sol8~
  sol do,4 mib sol8~
  sol si,4 re sol8~

  %52
  sol do, mib,[do'] \parenthesize re, si'\mbreak
  do2.\fermopz
  R2.*18

}

IIIvlan = \relative do' {

  sol'8 sol sol sol sol sol
  sol sol sol sol sol sol
  fa fa fa fa fa fa

  %4
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %7
  sol sol sol sol sol sol
  do,4 r r
  R2.*14

  %23
  re8 re re re re re
  re re re re re re\mbreak
  mi[mi] sol sol sol sol

  %26
  re re re re re re
  re4 r r
  R2.*18

  %46
  sol8 sol sol sol sol sol\mbreak
  sol sol sol sol sol sol
  fa fa fa fa fa fa

  %49
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %52
  sol sol sol sol sol sol\mbreak
  sol2.\fermopz
  R2.*18

}

IIIvocen = \relative do'' {

  \autoBeamOff
  R2.*7
  do4 mib do
  re8.[do16 si8.] la16 sol4

  %10
  re'4 sol re
  do8.[sib16 la8.] sol16 fa4
  do' fa lab\mbreak

  %13
  si,4. la?8 sol4
  sol si re
  mib8 sol4 mib do8

  %16
  re sol4 re sib8
  do fa4 do la8
  sib[sol16 la] sib8[sib16 do] re8[mi16 fad]\mbreak

  %19
  sol8 re4 sib sol8
  r sol16[la] sib8[sib16 do] re8[mi16 fad]
  sol4 fa?8[mib re do]

  %22
  sib sol' la,2
  sol  r4
  R2.*3

  %27
  sol4 sib re
  fad,4. sol8 la4
  mib' re do

  %30
  sib4. la8 sol4
  sol8[la] si[do] re[fa]\mbreak
  mib4. re8 do4

  %33
  mib do sol
  lab!4. fa8[lab do]
  fa4 re sib

  %36
  sol4. mib8[sol sib]
  mib4 do lab
  fa' re si

  %39
  sol8[la? si do re mib]\mbreak
  fa4. re8 mib4
  do re2

  %42
  do r4
  reb fa lab
  si,4. sol8 mib'4~

  %45
  mib8 re16[do] si2
  do r4\mbreak
  R2.*7

  %54
  sib4 mib sol
  fa mib8[re] do sib
  fa'4 re lab!

  %57
  lab sol8[fa] sol4
  sol sib mib\mbreak
  do4. re8 mib4

  %60
  lab sol fa
  mib r8 mib16[fa sol8 fa16 mib]
  fa8 re4 do sib8

  %63
  sol'4 r8 mib16[fa sol8 fa16 mib]
  fa8 re4  sib lab8\mbreak
  sol4~sol16[sib do re] mib4

  %66
  lab fa2
  mib4 r r
  sol,(sib) mib

  %69
  re4. do16[sib] mib4
  mib, fa2
  mib2.

}

IIItesto = \lyricmode {

  Rosa _ quae mo -- ritur, _ unda _ quae la -- bitur, _ mundi _ de -- licias _ _ docent _ fuga - - - - - - - - - - - - - - - - - - - - - - - - ces fuga - ces.

  Rosa _ quae mo -- ritur, _ unda _ quae la -- bitur, _ mundi _ de -- licias _ _ docent _ fuga - - - - - - - - - - - - - - - - ces fuga - ces docent _ fuga - - ces fuga - ces.


  Vix fronte _ amabili _ _ _  mulcent _ cum labili _ _  pede _ prae -- tervolant _ _  larvae _  falla - - - - - - - - - - - - - ces fallaces _ _ lar -- vae fallaces _ _ falla - ces.


}

IIIbcn = \relative do {

  do'8 do do do do do
  si si sib sib sib sib
  la la lab[lab lab lab]

  %4
  sol sol, sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %7
  do do sol' sol sol, sol
  do' do do do do do
  si si si si si si

  %10
  sib! sib sib sib sib sib
  la la la la la la
  lab! lab lab lab lab lab\mbreak

  %13
  sol sol sol sol sol sol
  si, si si si si si
  do do do'[do do do ]

  %16
  si si sib[sib sib sib]
  la la la la fad[fad]
  sol sol sol sol sol sol\mbreak

  %19
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %22
  sol[sol] re re re re
  sol sol sol sol sol sol
  fad[fad] fa fa fa fa\mbreak

  %25
  mi mi mib[mib mib mib]
  re re re re re re
  sol sol sol sol sol sol

  %28
  re re re re re re
  fad fad fad fad fad fad
  sol sol sol sol sol sol

  %31
  si, si si si si si\mbreak
  do do do do do do
  do do do do do do

  %34
  fa fa fa fa fa fa
  re re re re re re
  mib mib mib mib mib mib

  %37
  do do do do do do
  re re re re re re
  si si si si si si\mbreak

  %40
  sib sib sib sib do [do]
  do4 sol' sol,
  do8 do do do do do

  %43
  lab' lab lab lab lab lab
  sol sol sol sol do,[do]
  fad4 sol sol,

  %46
  do'8 do do do do do\mbreak
  si[si] sib sib sib sib
  la[la] lab lab lab lab

  %49
  sol sol sol,[sol sol sol]
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %52
  do4 sol' sol,\mbreak
  do2.\fermopz
  mib8 mib mib mib mib mib

  %55
  sib sib sib sib sib sib
  sib sib sib sib sib sib
  mib mib mib mib mib mib

  %58
  mib mib mib mib mib mib
  lab lab lab lab lab lab
  lab4 sib sib,

  %61
  mib8 mib mib mib mib mib
  sib sib sib sib sib sib
  mib8 mib mib mib mib mib

  %64
  sib sib sib sib sib sib\mbreak
  mib mib mib mib mib mib
  re'4 sib sib,

  %67
  mib8 mib mib mib mib mib
  mib8 mib mib mib mib mib
  sib'4 lab sol

  %70
  mib4 sib2
  mib2.\fermata

}

forma = {

  \time 3/4
  \key mib\major
  \tempo 4 = 67
  s2.*71
  \bar "||"
  \mark\markup\smaller\center-column {D.C.}

}


IIIvl = {
  \IIIglobal
  \notypeset
  <<\IIIvln\forma>>
}

IIIvlI = {
  \IIIglobal
  <<\IIIvlIn\forma>>
}

IIIvla = {
  \IIIglobal
  \clef alto
  <<\IIIvlan\forma>>
}

IIIvoce = {
  \new Voice = "rosa"
  \IIIglobal
  %\clef soprano
  <<\IIIvocen\forma>>
}



IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn\forma>>
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

IVvln = \relative do'' {

  r8 sib mib sol, lab sib16 do sib8 lab
  sol sib \parenthesize mib fa sol fa16 mib lab8 sol
  fa4 r r2

  %4
  R1*3
  r2 do8 sol' sol16 fa sol8
  r sol sol16 fa sol8 r sol sol16 fa sol8

  %9
  do mib, re si' do4 mib,8_\markup\italic"con la parte" do
  sol' si,4 do8 sol 4 r\mbreak
  R1*5

  %16
  r2 sol8 re' re do16 re
  r8 re re16 do re8 r re re16 do re8\mbreak
  r sol lab fad sol4 sol,~

  %19
  sol8 la sib4~sib8 do re4~
  re8 mib re do sib la sol4\mbreak
  sol'4. fa8 mib4. re8

  %22
  do4. sib8 lab! lab sol fa
  mib fa sol sol' sol16 sib lab sib sol sib lab sib\mbreak
  sol sib lab sib sol sib lab sib sol sib lab sib sol sib lab sib

  %25
  sol sib lab sib sol sib lab sib sol8 lab16 sol lab8 sol
  fa re sib sib, sol'16_\markup\italic"segue con la parte" sib lab sib sol sib lab sib\mbreak
  sol sib lab sib sol sib lab sib sol8 fa16 mib lab8 sol

  %28
  fa4 r r2
  R1*12
  sol'8 sol lab fa sol mib fa re

  %42
  sol16 lab sol lab sol lab sol lab sol8 sol lab fa
  sol sol lab fa sol2

}

IVvlIn = \relative do'' {

  r8 sib mib sol, lab sib16 do sib8 lab
  sol sib \parenthesize mib fa sol fa16 mib lab8 sol
  fa4 r r2

  %4
  R1*3
  r2 do4 r8 sol'
  sol16 fa sol8 r sol sol16 fa sol8 r sol

  %9
  sol mib re re do8_\markup\italic"con la parte" [mib16 re mib8 do]
  sol' si,4 do8 sol4 r
  R1*5

  %16
  r2 sol4 r8 re'
  re16 do re8 r re re16 do re8 r re\mbreak
  re sib do[lab] sib4. la8

  %19
  sib4. do8 re4. mib8
  re do sib[la] sol4 sol'~\mbreak
  sol8 fa mib4~mib8 re do4~

  %22
  do8 sib lab!4~lab8 do sib[lab]
  sol fa mib mib' mib16 sol fa sol mib sol fa sol
  mib sol fa sol mib sol fa sol mib sol fa sol mib sol fa sol

  %25
  mib sol fa sol mib sol fa sol mib8 fa16 mib fa8 mib
  re re sib sib, mib16 sol fa sol mib sol fa sol
  mib sol fa sol mib sol fa sol mib8[fa16 sol fa8 mib]

  %28
  re4_\markup\italic"segue con la parte" r8 re' mib sol~sol16 fa mib re
  do8[mib]~mib[do] fa[lab]~lab16[sol fa mib]\mbreak
  re4 r r2

  %31
  R1*5
  mib8 sib mib16 re mib8 r sib mib16 re mib8\mbreak
  r sib mib16 re mib8 r4 r8 sol,

  %38
  lab4 fa sol8 sib mib16 re mib8
  r sib mib16 re mib8 r sib mib16 re mib8
  r4 r8 sol, lab4 fa\mbreak

  %41
  mib8 mib' fa re mib sol, lab fa
  mib'16 fa mib fa mib fa mib fa mib8 mib fa re
  mib mib fa re mib2

}

IVvlan = \relative do' {

  R1*6
  r2 mib8 mib re re
  do do sib sib lab lab sol fa

  %9
  mib sol' sol sol mib4 r
  R1*6
  r2 sib'8 sib la[la]

  %17
  sol sol fa fa mib mib re do\mbreak
  sib re re[re] re4 r
  R1*4

  %23
  r4 r8 sib' sib sib sib sib\mbreak
  sib sib sib sib sib4 r
  R1

  %26
  r8 re sib sib, r2
  R1*14
  r8 sib' do sib sib sib do sib

  %42
  sib4 r r8 sib do sib
  sib sib do sib sib2

}

IVvocen = \relative do'' {

  \autoBeamOff

  r8 sib [mib sol,] lab [sib16 do] sib8 lab
  sol sib [\parenthesize mib fa] sol[fa16 mib] lab8 sol
  fa4 r8 sib,\mbreak mib sol4 mib8

  %4
  do[do16 re mib re mib do] fa8 lab4 fa8
  re8[re16 mib fa mib fa re] sol8 fa4 mib8
  reb do4 si8 do16 [re? mib fa sol8] do,

  %7
  re4 r8 si\mbreak do4 r
  R1
  r2 do8[mib16 re mib8 do]

  %10
  sol' si,4 do8 sol[mib'16 re] mib8[do]\mbreak
  sol' si,4 do8 sol[la?16 si] do8[re]
  mib[re16 do] fa8 mib re4 r8 re

  %13
  mib16[fa sol8] mib16[fa sol8] do,16[re mib8] do16[re mib8]
  la,16[sib do8] la16[sib do8]\mbreak sib8[la16 sol] do8[sib16 la]
  re8[do16 sib] mib8[re16 do] lab'8[sol16 fad sol8] do,

  %16
  sib4 la sol r
  R1\mbreak
  r2 sol4. la8

  %19
  sib4. do8 re4. mib8
  re8[do] sib [la] sol4 sol'~
  sol8[fa] mib4~mib8[re] do4~

  %22
  do8[sib] lab!4~lab8[do sib] sol8
  sol[fa] mib4 r2
  r mib'16 [sol fa sol] mib [sol fa sol]

  %25
  mib [sol fa sol] mib [sol fa sol] mib8[fa16 mib] lab8 sol
  fa4 r sol,16 [sib lab sib] sol [sib lab sib]\mbreak
  sol [sib lab sib] sol [sib lab sib] sol8[fa16 mib] lab8 sol

  %28
  fa4 r8 re' mib[sol]~sol16[fa mib re]
  do8[mib]~mib[do] fa[lab]~lab16[sol fa mib]\mbreak
  re8 sib4 re8 mib sib4 mib8

  %31
  fa sib,4 fa'8 sol[fa16 mib] fa8 mib16[re]
  mib4 r8 sib mib lab,4 sol16[fa]
  sol8[mib sol sib]\mbreak mib lab,4 sol16[fa]

  %34
  sol8[mib sol sib] mib16 [fa sol fa] mib [fa sol fa]
  mib8[re16 do sib8] mib fa4 re
  mib r8 sib mib16[re mib8] r sib\mbreak

  %37
  mib16[re mib8] r sib mib16[fa sol lab] sib8 [mib,]
  fa4 re mib r8 sib
  mib16[re mib8] r sib mib16[re mib8] r sib

  %40
  mib16[fa sol lab] sib8[mib,] fa4 re\mbreak
  mib8 sol lab fa sol mib fa re
  mib16[fa mib fa] mib[fa mib fa] mib8 mib fa re

  %43
  mib4 r r2

}

IVtesto = \lyricmode {

  Alle - luia _ _ al - leluia _ _ al - - - - - - - - - - - - - - - - lelu - ia

  al - - - - - - - - - - - leluia _ _ al - - - - - - - - - - - - leluia _ _

  al - - - - - lelu - ia al - -  - le -- luia _

  al - - - - le luia _ al - - - - lelu - ia al - - - - - - - - - - - - - lelu - ia

  al - - - - - - - - - - - - lelu - ia  al - - - - - - leluia _ _  al - - - - - - leluia _ _

  al -- lelu - ia al -- le -- lu - - ia allelu - - ia.

}

IVbcn = \relative do {

  mib8 fa sol mib fa lab re,[sib]
  mib fa sol re mib sol lab[la]
  sib lab sol fa\mbreak mib4 mib

  %4
  lab, lab lab lab
  sib sib mib mib
  fa fa mib8 re mib[re]

  %7
  fa4 sol\mbreak do8 do sib sib
  lab lab sol sol fa fa mib[re]
  do do sol'[sol,] do4 r8 do

  %10
  si sol' fa mib16 re mib8 do r do\mbreak
  si sol' fa16 mib re do si4 r8 sol
  do4 lab8 fad' sol la si sol

  %13
  do4 do mib, mib
  fa, fa\mbreak sol la
  sib do re mib

  %16
  re re, sol8 sol' fa fa
  mib[mib] re [re] do[do] sib la\mbreak
  sol sol' do,[re] sol,4 r

  %19
  sol r sol r
  sol r sol2~\mbreak
  sol1

  %22
  lab!2 sib
  mib4. mib8 mib mib mib mib\mbreak
  mib mib mib mib mib mib mib mib

  %25
  mib mib mib [mib] mib4 r8 mib
  sib re' sib sib, mib mib mib mib\mbreak
  mib mib mib [mib] mib4 r8 mib

  %28
  sib sib' re,[sib] sol'4 sol
  mib mib lab fa\mbreak
  sib, sib sib sib

  %31
  sib sib mib8 sol lab sib
  mib, fa sol mib sol fa re sib
  mib4 r\mbreak sol8 fa re[sib]

  %34
  mib4 r mib mib
  mib r8 sol lab4 sib
  mib8 mib re re do do sib[sib]\mbreak

  %37
  lab lab sol[fa] mib4 r8 mib
  lab,4 sib mib8 mib re[re]
  do do sib[sib] lab lab sol[fa]

  %40
  mib4 r8 mib' lab,4 sib\mbreak
  mib8 mib lab,[sib] mib, mib' lab,[sib]
  mib,4 r r8 mib' lab, sib

  %43
  mib, mib' lab,[sib] mib,2

}

forma = {

  \time 4/4
  \key mib\major
  \tempo 2 = 60
  s1*43
  \bar "|."

}


IVvl = {
  \IVglobal
  %\notypeset
  <<\IVvln\forma>>
}

IVvlI = {
  \IVglobal
  <<\IVvlIn\forma>>
}

IVvla = {
  \IVglobal
  \clef alto
  <<\IVvlan\forma>>
}

IVvoce = {
  \new Voice = "alleluia"
  \IVglobal
  %\clef soprano
  <<\IVvocen\forma>>
}



IVbc = {
  \IVglobal
  \clef bass
  <<\IVbcn\forma>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #4

  }

  \markup \huge "[1.] O qui coeli terraeque"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.instrumentName = \markup\center-column {"[Violino"\vspace #-0.2"primo]"}
          \set Staff.midiInstrument = #"violin"
          \Ivl
        >>
        \new Staff <<
          \set Staff.instrumentName = \markup \center-column {"[Violino"\vspace #-0.2"secondo]"}
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
          \new Lyrics \lyricsto "o qui coeli" \Itesto
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        } <<
          \set Staff.instrumentName = \markup\center-column {"[Basso]"}
          \set Staff.midiInstrument = #"cello"
          \Ibc
        >>
      >>

    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

  \markup \huge "[2.] [Recitativo]"


  \score {

    {

      \new ChoirStaff <<

        \new Staff \with {
          fontSize = #+3
          \override StaffSymbol.staff-space = #(magstep +3)} <<
            \set Staff.midiInstrument = #"synth voice"
            \IIvoce
            \new Lyrics \lyricsto "fac" \IItesto
          >>

          \new Staff \with {
            fontSize = #+3
            \override StaffSymbol.staff-space = #(magstep +3)
          } <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
          >>
          >>

        }

        \layout {

          indent = 0.5\cm

          \context	{
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #5
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

    systems-per-page = #4

  }

  \markup \huge "[3.] Largo - Rosa quae moritur"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \IIIvoce
          \new Lyrics \lyricsto "rosa" \IIItesto
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \IIIbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

  \markup \huge "[4.] Alleluia"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IVvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IVvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IVvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \IVvoce
          \new Lyrics \lyricsto "alleluia" \IVtesto
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \IVbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
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




    %{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
    %}
