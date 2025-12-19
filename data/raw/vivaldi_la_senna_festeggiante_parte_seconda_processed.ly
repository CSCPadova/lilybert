\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

unis = _\markup\italic "Unisoni"

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzic."

soli = ^\markup \italic { Soli}

dolce = _\markup \italic { dolce }

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

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }

\language "italiano"


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \terzine
}


IvlIn = \relative do'' {

   do8.[do16 mib8. mib16] sol4. fa8
   mib8.[mib16 mib8. sol16] re4 (re16) re mib fa
   do8.[do16 sol'8. sol16]\mbreak lab4(lab8)[(lab32) sol fa mib]

   %4
   re8.[re16 lab'8. sib16] sol2
   fad8.[fad16 sol8. la16] sib4(sib8)[(sib32) sol la sib]
   mib,8.[mib16 mib8. fa16] re8.[re16 do8. sib16]\mbreak

   %7
   fa'2(fa8.)[mib16 re8. do16]
   sol'4 fa mib2
   fa mib

   %10
   re1\fermata

%%% presto
   R4.*7

   %8
   do4.
   mib
   mi\mbreak

   %11
   fa
   fad
   sol

   %14
   (sol)
   (sol4) r8
   r4.*4

   %20
   r8 sol sol
   do, lab' sol
   fa4 mib8

   %23
   re sib' lab\mbreak
   sol8.  la16  fa sol
   mib8.  sol16  fa mib

   %26
   re4 r8
   sol4.
   lab

   %29
   la!
   sib
   si

   %32
   do
   R4.*3\mbreak

   %36
   r8 sol4
   (sol8) fa mib
   fa4 fa8

   %39
   r r sib
   (sib) lab sol
   lab4.

   %42
   (lab?8) sol fa
   sol4.
   (sol8) fa mib

   %45
   fa4.
   (fa8) mib re\mbreak
   mib4.

   %48
   (mib8) re do
   re4.
   mib8 fa mib

   %51
   (mib) re16 do re8
   mib mib mib
   sib' sib sib

   %54
   sol sol sol
   lab lab sol
   fa16 mib fa8 lab\mbreak

   %57
   sib sib lab
   sol sol4
   (sol8) fa mib

   %60
   fa4.
   (fa8) mib re
   mi4 la8

   %63
   (la) sol fad
   sol4.
   (sol8) fad mi

   %66
   fad4.\mbreak
   r8 r sib
   (sib) la sol

   %69
   la4.
   (la8) re,4
   mib4.

   %72
   mi
   fa
   fad

   %75
   sol4 r8
   do, do do\mbreak
   sol' sol sol

   %78
   mib mib mib
   fa fa mib

   %80
   re16 do re8 fa
   sol sol fa
   mib8. fa16 re mib

   %83
   do4.
   r8 r sib'
   (sib) la sol

   %86
   la4.(\mbreak
   la8) sol fad
   sol4.

   %89
   (sol8) fa! mib
   fa4.
   (fa8) mib re

   %92
   mib fa mib
   re4.
   (re8) fa fa

   %95
   mib sol sol
   lab sol sol\mbreak
   re fa fa

   %98
   sol mib mib
   do mib mib
   fa re re

   %101
   si fa' fa
   mib2\fermata la8.[do,16 si8. la16]
   \appoggiatura la8 si2 sol'8.[si,16 la8. sol16]\mbreak

   %104
   \appoggiatura sol8 mib'2 lab
   (lab?) sol
   (sol) fa

   %107
   (fa8.)[fa16 mib8. re16] mib8.[sol16 fa8. mib16]
   re2 mib
   re1\fermata

}

Ivlan = \relative do' {

   r1
   do8.[do16 mib8. mib16] sol4. fa8
   mi4. mi8\mbreak do8.[do16 do8. lab'16]

   %4
   lab?8.[lab16 re,8. re16] sib8.[sib'16 sib8. sib16]
   la4. do8 sol8.[sol16 sol8. sol16]
   sol4 fa fa r\mbreak

   %7
   do2(do8.)[sol'16 fa8. mib16]
   re8.[re16 fa8. sol16] sol8.[mib16 fa8. sol16]
   si,8.[si16 do8. re16] sol,8.[mib'16 fa8. sol16]

   %10
   sol1\fermata

%%% Presto
   R4.*6

   %7
   sol8 sol sol
   do do do
   sib sib sib

   %10
   do do sib\mbreak
   la16 sol la8 sib
   re re do

   %13
   sib8.   do16  la sib
   sol8 do, do
   sol mib' re

   %16
   do4 sib8
   lab fa' mib
   re8.   mib16  do re

   %19
   sib4 r8
   sol'4.
   lab

   %22
   la!
   sib\mbreak
   si

   %25
   do
   (do8) si4
   do4.

   %28
   (do)
   r
   re,

   %31
   mib
   mi
   fa4 fa8

   %34
   r re re
   sol, mib' re\mbreak
   do4.

   %37
   (do)
   r8 r fa
   (fa) mib re

   %40
   mib4.
   (mib8) re do
   re4.

   %43
   (re8) do sib
   do4.
   r8 re4

   %46
   (re8) do sib\mbreak
   do4.
   (do8) sib lab

   %49
   sib4.
   (sib)
   (sib)

   %52
   (sib4) r8
   sib4.
   do

   %55
   do
   reb\mbreak
   re!

   %58
   mib8 mib'4
   (mib8) re do
   re re re

   %61
   sol,4.
   R4.*4

   %66
   r8 r re'
   (re) do sib
   do4.

   %69
   (do8) sib la
   re, re re
   sol, mib' re

   %72
   do4 sib8
   la fa' mib
   re8.   mib16  do re

   %75
   sib4.
   r4.
   sol

   %78
   lab
   la!
   sib

   %81
   si
   do8 do'4
   (do8) sib la

   %84
   sib4.
   fa
   mib\mbreak

   %87
   re
   (re4) mib8
   (mib) re do

   %90
   re4.
   (re8) do si
   do4.

   %93
   (do8) si la
   si si' si
   sol sol mib

   %96
   do do' lab\mbreak
   fa fa re
   sib sib' sol

   %99
   mib mib do
   lab lab' fa
   re re sol

   %102
   la2\fermata r
   sol r\mbreak
   sol r4 fa

   %105
   (fa8.)[re16 mib8. fa16] sib,8.[fa'16 mib8. re16]
   mib8.[do16 re8. mib16] lab,8.[ mib'16 re8. do16]
   re8.[si16 do8. re16] sol,4 sol'

   %108
   sol1
   fad2 sol\fermata

}

IvlIIn = \relative do'' {

   r2 sol8.[sol16 si8. si16]
   do4. do8 si8.[si16 si8. re16]
   sol,8.[sol16] mi'8. mi16\mbreak fa2

   %4
   (fa8)[(fa32)re do sib] fa'8. sol16 mib8.[mib16 mib8. sol16]
   do,2 re4(re8)[(re32) sib do re]
   do8.[do16 do8. re16] sib8.[fa'16 mib8. re16]\mbreak

   %7
   do8.[do16 sib8. la16] sol2
   re'8.[re16 do8. si16] do2
   re do

   %10
   si1\fermata

%%%% Presto
   R4.*15

   %16
   sol4.
   lab
   la!

   %19
   sib
   si
   do

   %22
   (do)
   R4.*3

   %26
   r8 re re
   sol, mib' re
   do4 re8

   %29
   fa fa mib
   re8.   do16  sib la
   sol4.

   %32
   (sol8) do4
   (do8) sib lab
   sib4.

   %35
   (sib8) la sol\mbreak
   do4 do8
   lab4.

   %38
   (lab?)
   r
   r8 mib' mib

   %41
   do fa mib
   re4.
   sib8 la sol

   %44
   r do4
   (do8) sib lab
   sib4.(\mbreak

   %47
   sib8) lab sol
   lab4.
   (lab8)  sol fa

   %50
   sol lab sol
   fa4.
   sol4 r8

   %53
   R4.*7\mbreak

   %60
   r8 re'4
   (re8) do si
   do4.

   %63
   (do8) sib la
   sib4.
   (sib8) la sol

   %66
   la4.\mbreak
   R4.*2

   %69
   r8 r do
   (do) sib la
   sol4.

   %72
   (sol)
   R4.*2

   %75
   sol8 sol sol
   do do do
   sib sib sib

   %78
   do do sib
   la16 sol la8 do
   re re do

   %81
   si8.  do16  la si
   sol4 mib'8
   (mib) re do

   %84
   re4.
   (re8) do sib
   do4.(\mbreak

   %87
   do8) sib la
   sib lab sol
   lab4.

   %90
   (lab?8) sol fa
   sol4.
   (sol)

   %93
   (sol)
   (sol8) re' re
   do mib mib

   %96
   fa lab4(\mbreak
   lab?8) re, re
   mib sol4

   %99
   (sol8) do, do
   re fa fa
   fa re re

   %102
   do2\fermata r
   re r\mbreak
   do r

   %105
   re1
   do
   re2 do8.[mib16 re8. do16]

   %108
   si2 do
   (do) si\fermata

%%% Presto

}


Ibcn = \relative do {

   R1
   r2 sol8.[sol16 si8. si16]
   do4. do8\mbreak lab8.[fa'16 fa8. fa16]

   %4
   sib,4. sib8 mib2
   (mib8.)[mib16 re8. do16] sib8.[sib16 la8. sol16]
   do4 la sib r\mbreak

   %7
   la8.[la16 sol8. fa16] do'2
   (do8.)[si16 la8. sol16] do8.[do16 re8. mib16]
   sol,8.[sol16 la8. si16] do8.[do16 re8. do16]

   %10
   sol1_\fermata

%%% Presto
   do8 do do
   sol' sol sol
   mib mib mib

   %4
   fa fa mib
   re16 do re8 fa
   sol sol fa

   %7
   mib8.   fa16  re mib
   do4.
   sol8 sol' sol

   %10
   do, lab' sol\mbreak
   fa4 mib8
   re sib' la

   %13
   sol4 fa8
   mib re do
   mib4.

   %16
   mi
   fa
   fad

   %19
   sol
   (sol)
   R4.*4

   %25
   do,8 do do
   sol' sol sol
   mib mib mib

   %28
   fa fa mib
   re16 do re8 fa
   sol sol fa

   %31
   mib mib re
   do do4
   reb4.

   %34
   re!
   mib
   mi

   %37
   fa
   fa8 fa fa
   sol sol sol

   %40
   do, do do
   fa fa fa
   sib, sib' lab

   %43
   sol4.
   r8 r lab
   (lab) sol fa

   %46
   sol4.\mbreak
   do,
   fa

   %49
   sib,
   (sib)
   (sib)

   %52
   mib,4 r8
   r4.
   r8 mib' mib

   %55
   lab, fa' mib
   reb4 do8\mbreak
   sib sol' fa

   %58
   mib4.
   sib
   si

   %61
   do
   (do)
   dod

   %64
   (dod?)
   re
   re

   %67
   mib
   mi
   fa

   %70
   fad
   sol
   do,8 do do

   %73
   fa, re' do
   sib4 la8
   sol sol' fa

   %76
   mib4.
   sol8 sol sol
   do, lab' sol

   %79
   fa4 fa8
   sib, sib' lab
   sol4.

   %82
   do,
   mib
   mi
   fa

   %86
   fad\mbreak
   sol_\markup \italic "Tasto solo"
   (sol)

   %89
   (sol)
   (sol)
   (sol)

   %92
   (sol)
   (sol)
   (sol8) sol sol

   %95
   do, do do
   fa fa fa\mbreak
   sib, sib sib

   %98
   mib mib mib
   lab, lab lab
   re re re

   %101
   sol, sol sol
   fad'2\fermata r
   fa! r\mbreak

   %104
   do fa8.[mib16 re8. do16]
   sib8.[sib16 do8. re16] mib8.[re16 do8. sib16]
   lab8.[lab16 sib8. do16] re8.[do16 sib8. lab16]

   %107
   sol8.[sol16 la8. si16] do2
   sol1
   (sol)^\fermata

}

Ibfn = {

   \figuremode {

      \set Staff.useBassFigureExtenders = ##f
      \override Staff.BassFigureAlignmentPositioning.direction = #DOWN

      s1*2
      <_!>1

      <7>
      <6 4 2+>
      s4 <6 5> s2

      s2 <4>4 <3>
      <2>8. <3>16 s2.
      <_!>1
      <_!>

%%%%%% presto

      s4.*8
      <6 3>4.
      <_!>

      s
      <_+>
      s4.*4
      <_->4.
      <_!>
      s
      <_!>
      s4.*3

      s4.*2
      <6 4>8 <3!>4
      s4.
      <_->
      <5->4 <_->8
      s4.*3
      <7>4.
      <6>
      <5>

      <6 5>
      <_- 9>
      <8>
      <7>
      <7>
      <_- 7>
      <7>
      s4.*3
      <7>4.

      <7>
      <7->
      <7->
      <6 4>8 <7- 5> <6 4>
      <5 4> <3>4
      s4.*5

      <_!>4.
      s
      <6 4>4.
      <5 3>
      <9 4>
      <8 3!>4 <6>8
      s4.
      <7>
      <6 4>
      <5 3+>

      <7>
      <6 5>
      s
      <6 5>
      <6>
      <_!>
      s
      s4 <6+>8
      s4.
      <6>

      s
      <6->
      <_!>
      s
      <_!>
      s
      <6>
      <6 5>
      <6 4>
      <6 5>

      s4.*9
      <_->4.

      <7->
      s
      <7>
      s
      <_!>8 <7>4
      <7->2 s
      <6 4! 2> s

      s <_->
      <7> <7>
      <7> <7>
      <_! 7>1
      <_!>2 <6 4>
      <5 4 7+> <3!>

   }

}

forma = {

   \time 4/4
   \tempo 4=80
   \key sol\minor
   s1*10 | \bar "||"\break
  \once \override Score.RehearsalMark.extra-offset = #'(-5 . -1.0)
   \mark\markup\larger"Presto"
   \time 3/8
   \once \override Staff.TimeSignature.style = #'single-digit
   \tempo 4=125
   s4.*101 | \bar "||"\break
  \once \override Score.RehearsalMark.extra-offset = #'(-5 . -1.0)
   \mark\markup\larger"[Adagio]"
   \time 4/4
   \tempo 4=80
   s1*8 \bar "|."

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


Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \Ibfn \forma>>
}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}

\language "italiano"


IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \terzine
}


IIvlIn = \relative do'' {

   do8 si16 do re8 do16 re
   mib8 si do4
   (do8) [lab' sol fa]

   %4
   mib si do4(\mbreak
   do8) [lab' sol fa]
   mib si do4

   %7
   (do8) [mib re do]
   sib fad sol4
   (sol8)[la sib do]

   %10
   re[fad sol do,]
   sib4 la
   sol2

   %13
   sol'8 fa16 sol sib8 la16 sib
   mi,8 sol do,4
   (do8)[sib' lab sol]

   %16
   lab fa fa,4
   (fa8)[fa' sol lab]
   re, fa sib,4

   %19
   (sib8)[lab' sol fa]
   sol mib mib,4(\mbreak
   mib8)[mib' re do]

   %22
   si re sol,4
   (sol8)[mib' re do]
   si do fa,4

   %25
   (fa8)[lab' sol fa]
   mib[si do fa]
   mib4  re

   %28
   do2\fermata

}

IIvlIIn = \relative do'' {

   do4 si
   do r8 sol'
   mib[fa mib re]

   %4
   do4 r8 sol'\mbreak
   mib[fa mib re]
   do4 r8 sol'

   %7
   mib[sol fa mib]
   re4 r8 re
   sib[do re mib]

   %10
   la,4 sib8 la
   sol4 fad
   sol2

   %13
   re'4 sol
   sib r8 sol
   mi[sol fa mi]

   %16
   fa4 r8 lab
   do,4 fa
   sib r8 fa

   %19
   re[fa mib re]
   mib4 r8 sol\mbreak
   do,[sol' fa mib]

   %22
   re4 r8 sol
   do,[sol' fa mib]
   re4 r8 fa

   %25
   si,[fa' mib re]
   do[re mib re]
   do4 si

   %28
   do2\fermata

}

IIvlan = \relative do' {

   sol'4 sol
   sol r8 mib
   sol4 sol

   %4
   sol r8 mib\mbreak
   sol4 sol
   sol r8 mib

   %7
   sol4 la
   re, r8 re
   re4. sol8

   %10
   fad4 re8 mib
   re4 re
   sib2

   %13
   sib'4 re
   sol, r8 sol
   sol4 do,

   %16
   do r8 fa
   fa4 lab
   fa r8 fa

   %19
   fa4 sib,
   sib r8 sol'\mbreak
   sol4 lab

   %22
   re, r8 re
   mib4 lab
   re, r8 re

   %25
   re4 re
   sol,8[sol' sol sol]
   sol[lab re, sol]

   %28
   mib2\fermata

}


IIbcn = \relative do {

   do4 sol
   do r8 do
   sol'4 sol,

   %4
   do r8 do\mbreak
   sol'4 sol,
   do r8 do'

   %7
   do,4 fad
   sol r8 sib
   sol4. mib8

   %10
   re[do sib do]
   re4 re,
   sol2

   %13
   sib'4 sib,
   do r8 sib'
   do4 do,

   %16
   fa r8 fa
   lab4 fa
   sib, r8 lab'

   %19
   sib4 sib,
   mib r8 do'\mbreak
   mib,4 fa

   %22
   sol r8 si
   do4 fa,
   sol r8 re

   %25
   sol,4 si
   do8 sol' do, si
   do[fa sol sol,]

   %28
   do,2\fermata

}

IIbfn = {

   \figuremode {

      \set Staff.useBassFigureExtenders = ##f
      \override Staff.BassFigureAlignmentPositioning.direction = #DOWN

      s2*2
      <6 4>4 <5 3!>
      s2
      <6 4>8 <5 3!> s4
      s2*4
      <_+>2
      <6 4>4 <5 3+>
      s2

      s
      <7 _!>
      <_!>
      <_->
      s
      s
      <7->
      s

      s
      <_!>
      s
      s
      <7 _!>


   }

}

forma = {

   \time 2/4
   \key sol\minor
   \tempo 4=140
   s2*12 \bar ":..:"\break
   s2*16 \bar ":..:"

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
   <<\IIbcn \IIbfn \forma>>
}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}



IIIvlIn = \relative do'' {

   R1*7
   la'1~
   la~

   %10
   la2 si~
   si1
   la~

   %13
   la
   sol2 la
   r8 mi'[do la] fa! red mi lad,

   %16
   si2\fermata mi,\fermata

}

IIIvlIIn = \relative do'' {

   R1*7
   mi1~
   mi

   %10
   fa2 re~
   re1
   do

   %13
   fad
   mi
   r8 mi'[do la] fa! red mi lad,

   %16
   si2\fermata mi,\fermata

}

IIIvlan = \relative do' {

   R1*7
   dod'1~
   dod

   %10
   re2 sold,~
   sold1
   mi

   %13
   red
   si2 do
   r8 mi'[do la] fa! red mi lad,

   %16
   si2\fermata mi,\fermata

}

IIIbasson = \relative do {

   \autoBeamOff

   r4 r8 sib' sol sol fa mib
   re re r4 fa8 fa16 fa lab8 sol\mbreak
   sol sol r16 sol lab sib mi,!8 mi r4

   %4
   do8 do do do16 re mi4 sol8 fa16 sol\mbreak
   lab8 lab r do fad, fad mi re
   sib' sib sol fa16 sol mib4 r\mbreak

   %7
   sol8 sol16 sol fad8 fad16 sol re8 re r4
   r r8 sol16 sib mi,8 mi r sol\mbreak
   dod, dod r16 dod re mi la,4 r16 mi' sol fa

   %10
   re8 re r la' sold sold r4
   mi8 mi mi mi16 fad\mbreak sold8 sold la si
   do do r4 do8 mi la, si16 do

   %13
   red,8 red r si16 si\mbreak red4 mi8 fad
   sol sol r16 sol la si do,8 do r4
   r8 mi' do la fa![red mi] lad,

   %16
   si2\fermata mi,\fermata

}

IIItestoIII = \lyricmode {

   Ma già ch'u -- ni -- to_in schiera _
   veg -- go_un drap -- pel si va -- go,  il pri -- mo_og -- get -- to 
   sia -- si_il gir -- ne colà _ do -- ve ri -- sie -- de
   in ric -- co so -- glio_as -- si -- so
   l'as -- tro maggior _ che della _ Gal -- lia_è il lu -- me. 
   Ivi _ giun -- ti, l'o -- maggio _
   di nostra _ fé se gli ri -- no -- vi. O co -- me
   dal suo gio -- vin sem -- bian -- te_u -- scir si ve -- de
   scin -- til -- lante _ quel rag -- gio
   ch'a null' al -- tro se -- condo _
   umi - lia_il ma -- re e fa tre  -- ma -- re_il mon -- do.
   
}

IIIbcn = \relative do {

   mib1
   sib
   mib2 sib~

   %4
   sib1
   fa2 do'
   sol do~

   %7
   do re4 sol,~
   sol1~
   sol

   %10
   fa2 mi'~
   mi1
   la,1

   %13
   si
   mi,2 la
   r8 mi''[do la] fa! red mi lad,

   %16
   si2\fermata mi,\fermata

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1
   s
   s2 <6 4->
   s1*4
   <6 4+ 2>1
   s
   s2 <7 _+>
   s1*2
   <7 _+>1

}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*14
   \once \override Score.RehearsalMark.extra-offset = #'(+5 . -2)
   \mark\markup\huge "And[ante]"
   \tempo 4 = 80
   s1*2
   \bar "|."

}

IIIvlI = {
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   <<\IIIvlIIn \forma>>

}

IIIvla = {
   \clef alto
   <<\IIIvlan \forma>>

}

IIIbasso = {
   \clef bass
   \new Voice = "schiera"
   <<\IIIbasson \forma>>
}

IIIbc = {
   \clef bass
   <<\IIIbcn \forma \IIIbfn>>
}





IVvlIn = \relative do'' {

   la2 do mi
   fa,1.
   mi

   %4
   do'2 si la
   mi' mi, r\mbreak
   mi' do la

   %7
   re,1.
   re'2. mi4 do2~
   do4 re do2(si\tr)

   %10
   la r r
   si1.\p\mbreak
   mi,

   %13
   R
   si'2 do re
   do do, r

   %16
   red' si lad
   sol1.\mbreak
   fad

   %19
   si'2 sol mi
   do1.
   si4 do sol2(fad\tr)

   %22
   sol r r
   red' fad red\mbreak
   si r r

   %25
   red mi fad
   sol r r
   si,1 do2~

   %28
   do4 re do2(si\tr)\mbreak
   do mi la
   sold r r

   %31
   re fa la
   sold1 la2~
   la sold1\tr

   %34
   do,2\f si la\mbreak
   mi' mi, r
   mi' do la

   %37
   re,1.
   re'2. mi4 do2~
   do4 re do2(si\tr)

   %40
   la1.\fermata\mbreak
   R1.
   si2\p do re

   %43
   mi1 r2
   mi sol la
   re,1.

   %46
   mi2 fa sol\mbreak
   la re,1
   do2 mi sol

   %49
   sib1.
   la2 sol fa
   mi fa re~

   %52
   re dod sol'~
   sol fa mi\mbreak
   fa mi re

   %55
   sib' mi,1\tr
   re1.\fermata

}

IVvlIIn = \relative do'' {

   do,2 r r
   re1.
   do

   %4
   R
   sold'2 la si\mbreak
   do do, r

   %7
   la' fa re
   si'1 la2~
   la4 si la2(sold\tr)

   %10
   la r r
   re,1.\p\mbreak
   do

   %13
   R
   sold'2 la si
   la1 r2

   %16
   la fad red
   si1 mi2\mbreak
   mi red1

   %19
   sol'2 mi si
   la1.
   sol4 la mi2 \parenthesize (red\parenthesize \tr)

   %22
   mi r r
   fad si fad\mbreak
   sol r r

   %25
   si dod red
   mi r r
   mi,1 la2~

   %28
   la4 si la2(sold\tr)\mbreak
   la do mi
   mi r r

   %31
   la, re fa
   re1 do2
   mi1.

   %34
   mi2\f r r\mbreak
   sold, la si
   mi mi, r

   %37
   la fa re
   si'1 la2~
   la4 si la2(sold\tr)

   %40
   la1.\fermata\mbreak
   R
   si2\p do re

   %43
   mi1 r2
   mi sol la
   re,1.

   %46
   mi2 fa sol\mbreak
   fa si,1
   sol2 do mi

   %49
   sol1.
   fa2 mi re
   dod re fa~

   %52
   fa mi mi~
   mi re dod\mbreak
   la' sol fa~

   %55
   fa4 re re2 dod
   re1.\fermata

}

IVvlan = \relative do' {

   mi2 r r
   si1.
   do

   %4
   R
   si2 la sold\mbreak
   mi'1 r2

   %7
   fa, la re
   mi1 mi2
   fa si, mi

   %10
   do r r
   si1.\p\mbreak
   do

   %13
   R
   si2 la sold
   mi'1 r2

   %16
   fad, si red
   si1 si2\mbreak
   do si1

   %19
   si2 r r
   mi la fad
   sol4 mi si1

   %22
   si2 r r
   red1 red2\mbreak
   mi r r

   %25
   fad mi red
   si r r
   sold1 mi'2

   %28
   fa mi1\mbreak
   mi2 la do
   si r r

   %31
   fa la re
   si1 la2
   si1.

   %34
   fa2\f r r\mbreak
   si, la sold
   mi'1 r2

   %37
   fa, la re
   mi1 mi2
   fa si, mi

   %40
   do1.\fermata\mbreak
   R
   re2\p do si

   %43
   sol'1 r2
   sol~sol fa
   si,1.

   %46
   sol'\mbreak
   fa2 re sol
   mi sol do

   %49
   mi,1.
   fa2 sol la
   la1.~

   %52
   la~
   la~\mbreak
   la

   %55
   re,2 la'1
   fa1.\fermata

}

IVbasson = \relative do {

   \autoBeamOff

   R1.*9
   la'2 do mi
   fa,1.\mbreak

   %12
   mi
   do'2 si la
   mi' mi, r

   %15
   do' la fad
   red1.
   mi1 mi,2\mbreak

   %18
   la si1
   mi,1.
   R1.*2

   %22
   mi'2 sol mi
   si'1 si2\mbreak
   sol fad mi

   %25
   red dod si
   mi la mi'
   sold,1 la2

   %28
   re, mi2. mi4\mbreak
   la,1.
   mi'2 do la

   %31
   fa1.
   mi1 do'2
   re mi1

   %34
   la,1.\mbreak
   R1.*6
   do2 mi fa

   %42
   sol sol,1
   sol'2 la si
   do do,1

   %45
   si'2 re fa,
   mi(re) do\mbreak
   fa sol sol,

   %48
   do1.
   dod2 mi dod
   re1 re,2

   %51
   la'' re re,
   la' la, r
   la' si! dod\mbreak

   %54
   re re, r
   sol la la,
   re1.\fermata

}

IVtestoIII = \lyricmode {

   Pie -- tà, dol -- cez -- za
   fan -- no_il suo vol -- to;
   vir -- tù, gran -- dez -- za
   fan -- no_il suo cor.
   
   Pie -- tà, dol -- cez -- za
   fan -- no il suo vol -- to;
   vir -- tù, gran -- dez -- za
   fan -- no_il suo cor,
   vir -- tù, gran -- dez -- za
   fan -- no_il suo cor.

   Del bel pen -- sie -- ro
   giu -- sti -- zia_è du -- ce,
   che del suo_im -- pe -- ro
   fas -- si splen -- dor.
   
   Del bel pen -- sie -- ro
   giu -- sti -- zia_è du -- ce,
   che del suo_im -- pe -- ro
   fas -- si splen -- dor.

}

IVbcn = \relative do {

   la2 r r
   sold1.
   la

   %4
   R
   sold'2 fad mi\mbreak
   la la, r

   %7
   fa' re si
   sold1 la2
   re mi mi,

   %10
   la r r
   sold1.\mbreak
   la

   %13
   R
   sold'2 fad mi
   la la, r

   %16
   fad' red si
   sol1 sol2\mbreak
   la si1

   %19
   mi,2 r r
   la' fad red
   mi4 la, si1

   %22
   mi, r2
   si' red si\mbreak
   mi re dod

   %25
   si1.
   R
   mi2 re do

   %28
   re mi2. mi4\mbreak
   la,1.
   mi'2 do la

   %31
   fa1.
   mi1 la2
   re mi1

   %34
   la,2 r r\mbreak
   sold' fad mi
   la la, r

   %37
   fa'? re si
   sold1 la2
   re mi mi,

   %40
   la1.\fermata\mbreak
   do2 r r
   sol la si

   %43
   do1 r2
   do mi fa
   sol1 sol,2

   %46
   do1.\mbreak
   fa2 sol sol,
   do1.

   %49
   dod
   re
   la'2 re re,

   %52
   la' la,1
   la'2 si! dod\mbreak
   re re, r

   %55
   sol la la,
   re1.\fermata

}

IVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1.
   <7 5>
   <5 3>
   s1.*4
   <6 5>1
   s2 <7> <_+> s
   s1.
   <7>
   s1.*4
   <6+>1.
   s
   <6 5>2 <3+> s
   s1.
   s2 s <7>
   s <6 4> <5 3+>
   s1.*2
   s2 <_+> s
   <_+>1.
   s
   <_+>
   <7>2 <6 4> s4 <5 3+>
   s1.
   <_+>
   <6>
   <7 _+>
   <6 5>2 <_+>1
   s1.*3
   <6>1.
   <6 5>
   <7>2 <3+> s
   s1.*5
   s1 <7>2

}


forma = {

   \time 3/2
   \once\override Staff.TimeSignature.style = #'single-digit
   \key la\minor
   \tempo 1 = 50
   s1.*56
   \bar "|."
   \mark\markup\smaller "D.C."

}

IVvlI = {
   <<\IVvlIn \forma>>

}

IVvlII = {
   <<\IVvlIIn \forma>>

}

IVvla = {
   \clef alto
   <<\IVvlan \forma>>

}

IVbasso = {
   \clef bass
   \new Voice = "dolcezza"
   <<\IVbasson \forma>>
}

IVbc = {
   \clef bass
   <<\IVbcn \forma \IVbfn>>
}




Vsopranon = \relative do'' {

   \autoBeamOff

   r8 la sol  la fa fa r4
   do'8 do la la16 sib do8 do r4
   do8 do do re16 mib\mbreak la,8 la r4

   %4
   la8 la16 la la8 sib do do mib do16 sib
   sol8 sol r4\mbreak r8 re' re mi
   mi mi r si re re do si

   %7
   do do r4 do si8 do\mbreak
   la8 la r do do do si do
   sol sol r4 r2

   %10
   R1*10

}

VtestoI = \lyricmode {

   Non si ri -- tardi. _ A veder _ quel si corra, _
   la di cui sacra _ fronte _
   cinge _ di più co -- rone _ al -- to  dia -- dema; _
   e con of -- frirle _ il no -- stro_u -- mil ser -- vaggio _
   fé se gli giuri _ in re -- pli -- ca -- to_o -- maggio. _

}

Valton = \relative do' {

   \autoBeamOff

   R1*8
   r2 r8 mi re mi
   do do r4\mbreak sol'8 sol16 sol la8 sib

   %11
   mi, mi r4 mi8 mi mi mi16 fa
   sol16 sol sol8 sib sib16 la\mbreak la8 la r4
   la8 mi16 mi sol8 fa re re r4

   %14
   la' la8 la fad fad r4\mbreak
   fad?8 fad fad sol16 la re,8 re r4
   la'8 la la la16 sol sol4 r16 sol la sib

   %17
   mi,8 mi r4\mbreak sol8 do, sol' sol16 la
   la4 r do8 fa, r la16 sib
   fa8 fa r4 r2\fermata

}

VtestoII = \lyricmode {

   S'i -- nol -- tri_il passo. _ Ecco _ colà _ già veggo _
   il bel ric -- co_e -- di -- fi -- cio _ ove _ ri -- siede _
   sopra _ l'ec -- celso _ soglio. _ O qual tra -- manda _
   quel real _ tet -- to_an -- cora _
   un tal nobil _ splendor,  _ ch'in va  -- no_og -- getto _
   sveglia _ te -- ma_ed a -- mor, gioia _ e ri -- spetto. _

}

Vbcn = \relative do {

   fa1~
   fa2 fad~
   fad1~

   %4
   fad?
   sol
   sold

   %7
   la
   fa
   sol4 do,~do2~

   %10
   do1~
   do~
   do2 dod~

   %13
   dod re~
   re do?~
   do1~

   %16
   do2 si
   sib1
   mib

   %19
   fa2 sib,\fermata

}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*19
   \bar "|."

}

Vsoprano = {
   \new Voice = "ritardi"
   <<\Vsopranon \forma>>
}

Valto = {
   \new Voice = "passo"
   <<\Valton \forma>>
}

Vbc = {
   \clef bass
   <<\Vbcn \forma \Vbfn>>
}





VIvlIn = \relative do'' {
   \terzinequarto

   << <sol' sib, re, >4\\sol,,>> r8 r16 la'' sib4
   << <fad la,>\\re,>> r8 r16 mi' re4
   do la' r8 r16 do,
   
   %4
   sib4. la8 sol4
   mib' \con\tuplet 3/2 { r8 do(re mib[fa sol)] }
   la4 \tuplet 3/2 { r8 re,(mi fad[sol la)] }
   
   %7
   sib8. sol16 sib,8. sol'16 re,8. fad'16
   sol,8 fad sol la sib la
   sol sol, do sib do mib
   
   %10
   re do re mi fad re
   sol fa? sol la sib sol
   do sib la sol la fa
   
   %13
   sib sol fa mib re do
   sib sib fa' mib fa fa
   << <sib' re, fa,>4\\sib,,>> r8 r16 la'' sol4
   
   %16
   fa r8 r16mib re4
   mib do fa\mbreak
   re \tuplet 3/2 { r8 sib (do re[mib fa)] }
   
   %19
   sol4 \tuplet 3/2 { r8 do,(re mib[fa sol)] }
   la8. sib16 re,4 do
   sib,8 la sib do re do
   
   %22
   sib2 r4
   sib8 la sib do re do
   sib2 r4
   
   %25
   sib8 do re do sib la
   sol2 r4
   sol2 r4
   
   %28
   do2 r4
   do2 dod4\mbreak
   re8 mib re do sib la
   
   %31
   sol2 r4
   do2 r4
   re2 r4
   
   %34
   sol2 r4\mbreak
   fad2 r4
   sol mib do
   
   %37
   re2 mib4
   do re re\mbreak
   \once\stemUp sol,8 mib'' re do sib la
   
   %40
   sol2.
   re4 mib do
   sib la sol
   
   %43
   sol'8 mib re2
   << <sol' sib, re,>4\f\\sol,,>> r8 r16 la'' sib4\mbreak
   <<<fad la,>4\\re,>> r8 r16 mi' re4
   
   %46
   do la' r8 r16 do,
   <<sib4.\\< re, sol,>4 >> la'8 sol4
   mib'4 \tuplet 3/2 { r8 do(re mib[fa sol)] }
   
   %49
   la4 \tuplet 3/2 { r8 re,(mi fad[sol la)] }
   sib8. sol16 sib,8. sol'16 re,8. fad'16
   << <sol sib, re, >4\fermata\\sol,,>> r r
   
   %52
   sol2.\p
   la
   sib4. do8 re mib
   
   %55
   fa4 mib2
   re4 mi2\mbreak
   fa4. mib8 re do
   
   %58
   sib2.
   re
   mib2 re4~
   
   %61
   re8 mib fa4 fa
   sib,8 sol' fa mib re do\mbreak
   sib2 r4
   
   %64
   re sold,2
   la4 la'8 sol fa mi
   re4 la2
   
   %67
   re2.\fermata

}

VIvlan = \relative do' {
   
   sib4 r r
   la la2
   la'4 fad r
   
   %4
   re re r
   sol,2 r4\mbreak
   re'2 r4 
   
   %7
   re mib re
   sol8 fad sol la sib la
   sol sol, do sib do mib
   
   %10
   re do re mi fad re
   sol fa? sol la sib sol
   do sib la sol la fa
   
   %13
   sib sol fa mib re do
   sib sib fa' mib fa fa,
   re'2 r4
   
   %16
   re2 r4
   sol la2\mbreak
   fa4 re r
   
   %19
   sib sol r
   do'8. re16 sib4 la
   sib,8 la sib do re do
   
   %22
   sib2 r4
   sib8 la sib do re do
   sib2 r4
   
   %25
   sib8 do re do sib la
   sol2 r4
   sol2 r4
   
   %28
   do2 r4
   do2 dod4\mbreak
   re8 mib re do sib la
   
   %31
   sol2 r4
   do2 r4
   re2 r4
   
   %34
   sol2 r4\mbreak
   fad2 r4
   sol mib do
   
   %37
   re2 mib4
   do re re\mbreak
   \once\stemUp sol,8 mib'' re do sib la
   
   %40
   sol2.
   re4 mib do
   sib la sol
   
   %43
   sol'8 mib re2
   sol,4\f r r\mbreak
   la la2
   
   %46
   la'4 fad r
   re re r
   sol,2 r4
   
   %49
   re'2 r4
   re mib re\mbreak
   sib\fermata r r 
   
   %52
   sol2.\p
   la
   sib4. do8 re mib
   
   %55
   fa4 mib2
   re4 mi2\mbreak
   fa4. mib8 re do
   
   %58
   sib2.
   re
   mib2 re4~
   
   %61
   re8 mib fa4 fa
   sib,8 sol' fa mib re do\mbreak
   sib2 r4
   
   %64
   re sold,2
   la4 la'8 sol fa mi
   re4 la2
   
   %67
   re2.\fermata
   
}

VIalton = \relative do' {

   \autoBeamOff

   R2.*7
   sol'2 re4
   sib' la sol

   %10
   fad8. [mi16] re4 r
   r sib' re,\mbreak
   mib do fa

   %13
   re4. fa8 sib4~
   sib8 sib, re4(do\tr)
   sib2 r4

   %16
   R2.*5
   sib'4 fa2
   sib4 la sol

   %23
   sol fa r\mbreak
   sol fa mib
   mib re r

   %26
   r re sol
   sib sol re
   mib do la'

   %29
   do la sol\mbreak
   fad2 r4
   sib sol re

   %32
   mib \senza \tuplet 3/2 { r8 do [re] mib[fa sol] }
   fad4 \tuplet 3/2 { r8 re [mib] fad[sol la] }
   sib4 \tuplet 3/2 { r8 sol [la] sib[la sol] }\mbreak

   %35
   do4 \tuplet 3/2 { r8 la [sib] do[sib la] }
   sib [la sol fa mib do']
   fad,4 mi8. re16 sol4~

   %38
   sol8 do sib4(la)\mbreak
   sol2 r4
   sol sib re

   %41
   fad,(sol) la
   re,4. do'8 sib4~
   sib8 sol la2\tr

   %44
   sol r4\mbreak
   R2.*6\mbreak
   r4 r re

   %52
   sib'(la) sol
   fa(sol) mib
   mib re r

   %55
   fa sol la
   sib8[(la] sol4) do\mbreak
   \appoggiatura sib8 la2 r4

   %58
   sib, re fa
   sib lab2
   sol4. la8 sib4~

   %61
   sib8 sol la2
   sib re,4\mbreak
   sib'(la) sol

   %64
   fa(mi) re
   dod4. sib'8 la4~
   la8 re, fa4(mi\tr)

   %67
   re2.\fermata

}

VItestoII = \lyricmode {

   Stel -- le, con vos -- tra pa -- ce
   di quel vos -- tro splen -- dor
   non son più_a -- man -- te.
   
   Stel -- le, con vos -- tra pa -- ce con vos -- tra pa -- ce
   di quel vos -- tro splen -- dor di quel vos -- tro splen -- dor
   non son più a -- man - - - - - - - - - - - - te, non son più_a -- man -- te,
   di quel vos -- tro splen -- dor non son più_a -- man -- te.

   Con più lu -- cen -- te face _
   oscu - ra_il bel can -- dor oscu - ra_il bel can -- dor
   il gran Re -- gnan -- te, os -- cu -- ra_il bel can -- dor
   il gran Re -- gnan -- te.

}

VIbcn = \relative do {
   
   sol4 r r
   re' re,2
   fad'4 re r
   
   %4
   sol sol, r
   do2 r4\mbreak
   fad,2 r4
   
   %7
   sol do re
   sol,2 r4
   R2.*6
   
   %15
   sib2 r4
   sib2 r4
   do la fa\mbreak
   
   %18
   sib sib' r
   mib,, mib' r
   fa8 sib, fa'4 fa,
   
   %21
   sib2 r4
   R2.*22
   sol4\f r r
   
   %45
   re' re,2
   fad'4 re r
   sol sol, r
   
   %48
   do2 r4\mbreak
   fad,2 r4
   sol do re
   
   %51
   sol,\fermata r r
   R2.*16
  
}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \key sol\minor
   \tempo 2 = 60
   s2.*67
   \bar "|."
   \mark \markup\smaller "D.C."


}

VIvlI = {
   <<\VIvlIn \forma>>

}

VIvla = {
   \clef alto
   <<\VIvlan \forma>>

}

VIalto = {
   \new Voice = "stelle"
   <<\VIalton \forma>>
}

VIbc = {
   \clef bass
   <<\VIbcn \forma \VIbfn>>
}





VIIvlIn = \relative do'' {

   mib16. mib,32 mib16. mib32 mib4 r2
   re'16. re,32 re16. re32 re4 r2\mbreak
   fa'16. fa,32 fa16. fa32 fa4 r2

   %4
   mib'16. mib,32 mib16. mib32 mib4 r2
   fa'2~fa\mbreak
   r2 mib16. mib,32 mib16. mib32 mib8 r

   %7
   re'16. re,32 re16. re32 re8 r mib2\fermata
   R1*11

}

VIIvlIIn = \relative do'' {

   do16. do,32 do16. do32 do4 r2
   si'16. si,32 si16. si32 si4 r2\mbreak
   re'16. re,32 re16. re32 re4 r2

   %4
   do'16. do,32 do16. do32 do4 r2
   do'2 re\mbreak
   r2 do16. do,32 do16. do32 do8 r

   %7
   si'16. si,32 si16. si32 si8 r do2\fermata
   R1*11

}

VIIvlan = \relative do' {

   sol'16. sol,32 sol16. sol32 sol4 r2
   sol'16. sol,32 sol16. sol32 sol4 r2\mbreak
   re'16. si32 si16. si32 si4 r2

   %4
   sol'16. sol,32 sol16. sol32 sol4 r2
   lab'2 si,\mbreak
   r2 sol16. sol32 sol16. sol32 sol8 r

   %7
   sol16. sol32 sol16. sol32 sol8 r sol2\fermata
   R1*11

}

VIIsopranon = \relative do'' {

   \autoBeamOff
   R1*7
   do8 do16 do do8 la\mbreak
   fad fad r16 la la sib

   %10
   do4 r8 do do do sib la
   sib sib r mi\mbreak sol, sol sol la
   fa fa r la re4 r8 re

   %13
   si4 r8 si si si la si\mbreak
   do do r16 do re mi la,8 la r la
   red red red mi si si r4\mbreak

   %16
   R1*4

}

VIItestoI = \lyricmode {

   Sen -- za giam -- mai ve -- derle _ 
   le san -- no_an -- cor de' più re -- moti _ lidi _
   l'in -- co -- gnite _ con -- trade _
   se_il sol ch'il ciel per o -- gni_in -- torno ei gira _
   le nar -- ra_al -- trui, _  per -- ché qui sol le mira. _

}

VIIalton = \relative do' {

   \autoBeamOff

   R1*14
   sol'8 sol16 sol sol8 fad fad fad r4
   fad?8 fad fad sol16 la re,8 re r16 la' do si\mbreak

   %17
   sol8 sol r16 re fa mi mi8 mi r16 sol fa mi
   la4 fa8 mi do do r4\fermata

}

VIItestoII = \lyricmode {

   Quin -- di_o -- gni dot -- to_in -- chiostro _
   di sì strani _ por -- tenti _ ogn' or fa -- vella, _
   e_un picciol _ orbe _ un sì bel suo -- lo ap -- pella. _

}

VIIbasson = \relative do {

   \autoBeamOff

   r4 r8 sol' do sol mib do
   sol4 sol si' do8 re\mbreak
   sol,4 sol fa8 fa16 fa mib8 re

   %4
   mib mib r4 do ' mib
   lab,, fa8 do'' si2\mbreak
   r8 si? si do sol sol r4

   %7
   R1*11

}

VIItestoIII = \lyricmode {

   Ve -- dre -- te_in que -- st_e -- ro --  e
   che Gallia _ reg -- ge e tut -- to_il mon -- do_o -- nora _
   mera - viglie _ non mai più vis -- te_an -- cora. _

}

VIIbcn = \relative do {

   do16. do32 do16. do32 do4 r2
   sol16. sol32 sol16. sol32 sol4 r2\mbreak
   sol16. sol32 sol16. sol32 sol4 r2

   %4
   do,16. do32 do16. do32 do4 r2
   fa2 sol
   r2 do16. do32 do16. do32 do8 r

   %7
   sol16. sol32 sol16. sol32 sol8 r do,2\fermata~
   do1~
   do

   %10
   dod
   re
   sold

   %13
   la1~
   la2 si4 mi~\mbreak
   mi2 do~

   %16
   do fad,\mbreak
   sol do
   fa sol4 do,\fermata

}

VIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   s1
   <_!>
   s
   s
   <_->2 <7 _!>

}


forma = {

   \time 4/4
   \key sol\minor
   \tempo 4 = 60
   s1*7
   \bar "||"\break
   \key do\major
   s1*11
   \bar "|."

}

VIIvlI = {
   <<\VIIvlIn \forma>>

}

VIIvlII = {
   <<\VIIvlIIn \forma>>

}

VIIvla = {
   \clef alto
   <<\VIIvlan \forma>>

}

VIIsoprano = {
   \new Voice = "senza"
   <<\VIIsopranon \forma>>
}

VIIalto = {
   \new Voice = "quindi"
   <<\VIIalton \forma>>
}

VIIbasso = {
   \clef bass
   \new Voice = "eroe"
   <<\VIIbasson \forma>>
}

VIIbc = {
   \clef bass
   <<\VIIbcn \forma \VIIbfn>>
}





VIIIvlIn = \relative do'' {

    re8 si16 la si do
    re8 si16 la si do
    re8 do16 si do re

    %4
    si8 sol' si,
    la16 sol la8 si\mbreak
    do16 si do8 si

    %7
    la4 r8
    r mi' mi
    fad8. fad16 sol8

    %10
    la fad4\tr
    sol4 r8
    R4.*3

    %15
    re8 si16 la si do
    la4 r8
    R4.*14

    %31
    fad'8 fad16 mi fad sol\mbreak
    la8 fad16 mi fad sol
    la8 fad mi

    %34
    re la re,
    R4.*4
    re'8 si16 la si do

    %40
    re4 r8
    R4.*9
    r8 fad16 mi fad sol\mbreak

    %51
    \once\stemDown la8 si,,\p si
    do do do
    re re re

    %54
    sol sib sol
    fad la fad
    sol sib sol

    %57
    la fad re
    sol4 r8
    sol do, re

    %60
    \once\stemUp sol, sol''16\f fad sol la
    fad8 re la
    R4.

    %63
    r8 fad'16 mi fad sol
    la8 re, sol,,\noBeam\p
    do do do

    %66
    re re re
    sol,4 r8
    sol' do, re

    %69
    re'8\f si16 la si do
    re8 si16 la si do\mbreak
    re8 sol re

    %72
    do la' do,
    si16 la si do re8
    sol la fad

    %75
    sol4.\fermata
    R4.*3
    r8 mi16 fad mi fad

    %80
    sol4 r8
    R4.*4
    r8 re16 dod re mi

    %86
    fa4 r8
    R4.*7

}

VIIIvlIIn = \relative do'' {

    si8 sol16 fad sol la
    si8 sol16 fad sol la
    si8 la16 sol la si

    %4
    sol8 re' sol,
    fad16 mi fad8 sol\mbreak
    la16 sol la8 sol

    %7
    fad re' re
    re4.
    do8. do16 si8

    %10
    do la4\tr
    sol r8
    R4.*3

    %15
    si8 sol16 fad sol la
    fad4 r8
    R4.*14

    %31
    re'8 re16 dod re mi\mbreak
    fad8 re16 dod re mi
    fad8 re dod

    %34
    re la re,
    R4.*4
    si'8 sol16 fad sol la

    %40
    si4 r8
    R4.*9
    r8 re16 do re mi\mbreak

    %51
    \once\stemDown fad8 si,,\p si
    do do do
    re re re

    %54
    sol sib sol
    fad la fad
    sol sib sol

    %57
    la fad re
    sol4 r8
    sol do, re

    %60
    sol, si'16\f la si do
    re8 la fad
    R4.

    %63
    r8 re'16 do re mi
    fad8 sol sol,,\noBeam\p
    do do do

    %66
    re re re
    sol,4 r8
    sol' do, re

    %69
    si'8\f sol16 fad sol la
    si8 sol16 fad sol la\mbreak
    si8 re si
    la fad' la,

    %73
    sol16 fad sol la si8
    si do la
    sol4.\fermata

    %76
    R4.*3
    r8 sol'16 la sol la
    si4 r8

    %81
    R4.*4
    r8 si,16 la si do
    re4 r8

    %87
    R4.*7

}

VIIIvlan = \relative do' {

    re4 r8
    re4 r8
    re fad4

    %4
    re8 re16 do re mi
    fad4 r8\mbreak
    fad4 r8

    %7
    fad si,16 do re si
    sol8 mi'16 fad sol mi
    la8 fad re

    %10
    mi re4
    si r8
    R4.*19

    %31
    la'4 r8\mbreak
    la4 r8
    la la la

    %34
    fad la re,
    R4.*4
    re4 r8

    %40
    re4 r8
    R4.*9
    r8 la' la\mbreak

    %51
    la4 r8
    R4.*8
    r8 re, re

    %61
    re4 r8
    R4.*7
    re4 r8

    %70
    re4 r8\mbreak
    re4 re8
    fad4.

    %73
    re
    re8 mi re
    si4.\fermata

    %76
    R4.*18

}

VIIIsopranon = \relative do'' {

    \autoBeamOff

    R4.*10
    re8 si16[la si do]
    re8 si16[la] si[do]\mbreak

    %13
    re8 si16[la] si[do]
    re8 [do16 si do re]
    si4 r8

    %16
    r la la
    si16[la] si8 do
    re do si

    %19
    la re re\mbreak
    mi4.~
    mi8 re16[do] si[la]

    %22
    re4.~
    re8[do16 si la sol]
    do4.~

    %25
    do8[si16 la sol fad]\mbreak
    si8[si16 la si do]
    re8[si16 la si do]

    %28
    re8 do si
    la re re
    mi re dod

    %31
    re4 r8
    R4.*3
    re8 si16[la si do]

    %36
    re8 si16[la] si[do]
    re8 si16[la] si[do]
    re8[do16 si do re]\mbreak

    %39
    si4 r8
    R4.*3
    mi8[re16 do] si[la]

    %44
    sol8 dod mi\mbreak
    sol, fad mi
    fad4 r8

    %47
    R4.
    r8 r la
    sib la sol

    %50
    sol fad r\mbreak
    r8 re' re
    do do do

    %53
    do do do
    sib4.
    mib

    %56
    re
    do\mbreak
    sib16[la sib do re8]

    %59
    sib do la
    sol4 r8
    r r la

    %62
    do la re
    si la r
    r re re\mbreak

    %65
    do do do
    do do do
    si do re

    %68
    si do la
    sol4 r8
    R4.*6

    %76
    si8[la] sol
    do do mi\mbreak
    do do do

    %79
    do si r
    r mi mi
    mi4.~

    %82
    mi8[re16 dod si lad]
    re8 dod si\mbreak
    mi dod8.\tr si16

    %85
    si4 r8
    r re re
    re4.~

    %88
    re8[do16 si la sold]
    do8[do16 si do re]\mbreak
    mi8[do16 si do re]

    %91
    mi8 re do
    do re si
    la4.\fermata

}

VIIItestoI = \lyricmode {

    Io qui pro -- vo sì ca -- ro di -- let -- to
    che mi fa per dol -- cezza _ lan -- guir,
    che mi fa per dol -- cez - - - - za lan -- guir
    per dol -- cezza _ lan -- guir.

    Io qui pro -- vo sì ca -- ro di -- let -- to
    che mi fa per dol -- cezza _ lan -- guir,
    sì ca -- ro di -- let -- to
    che mi fa per dol -- cezza _ lan -- guir,
    per dol -- cez - - za lan -- guir,
    sì ca -- ro di -- let -- to
    che mi fa per dol -- cezza _ lan -- guir,
    per dol -- cezza _ lan -- guir.

    L'al --  ta gioia _ sì cara _ ch'ho_in petto _
    è pia -- cer - e pur sembra _ martir, _
    è pia -- cer - - - e pur sembra _ mar -- tir.

}

VIIIalton = \relative do' {

    \autoBeamOff

    R4.*10
    si'8 sol16[fad sol la]
    si8 sol16[fad] sol [la]\mbreak

    %13
    si8 sol16[fad] sol la
    si8[la16 sol la si]
    sol4 r8

    %16
    r fad fad
    sol16[fad] sol8 la
    si la sol

    %19
    fad r r\mbreak
    r sol sol
    la4.~

    %22
    la8 sol16[fad] mi[re]
    sol4.~
    sol8 [fad16 mi re do]

    %25
    fad4.\mbreak
    sol8[sol16 fad sol la]
    si8[sol16 fad sol la]

    %28
    si8 la sol
    fad fad fad
    sol fad mi

    %31
    re4 r8\mbreak
    R4.*3
    si'8 sol16 [fad sol la]

    %36
    si8 sol16[ fad] sol [la]
    si8 sol16 [fad] sol[ la]
    si8[sol16 fad sol la]\mbreak

    %39
    mi4 r8
    re'8 [do16 si] la[sol]
    fa8 si re

    %42
    fa, mi re
    mi4 r8
    R4.*2

    %46
    r8 r la
    sib la sol
    sol fad4

    %49
    R4.*2\mbreak
    r8 re re
    mi mi mi

    %53
    fad fad fad
    sol4.
    do

    %56
    sib
    la\mbreak
    sol16[fad sol la sib8]

    %59
    sol la fad
    sol4 r8
    r r fad

    %62
    sol fad la
    sol fad r
    r re re\mbreak

    %65
    mi mi mi
    fad fad fad
    sol la si

    %68
    sol la fad
    sol4 r8
    R4.*6

    %76
    sol8[fad] mi
    la la do\mbreak
    la  la la

    %79
    la sol r
    R4.
    r8 si si

    %82
    lad4.
    si8 dod re\mbreak
    si lad8. si16

    %85
    si4 r8
    R4.
    r8 la la

    %88
    sold4.
    la8[la16 sold la si]\mbreak
    do8[la16 sold la si]

    %91
    do8 si la
    la si sold
    la4.\fermata

}

VIIItestoII = \lyricmode {

    Qui nel se -- no_ho sì te -- nero _ af -- fet -- to
    che mi fa per con -- tento  _ lan -- guir,
    che mi fa per con -- ten - - - - to lan -- guir per con -- tento  _ lan -- guir.

    Qui nel se -- no_ho sì te -- ne -- ro_af -- fet -- to
     che mi fa per con -- tento  _ lan -- guir,
     sì te -- ne -- ro_af -- fet -- to
      che mi fa per con -- tento  _ lan -- guir, per con -- ten - - to  lan -- guir,
      sì te -- ne -- ro_af -- fet -- to
      che mi fa per con -- tento  _ lan -- guir, per con -- tento _  lan -- guir.

    La dol -- ezza  _ che m'en -- tra nel petto _
    l'è_un go -- de - re che sem -- bra mo -- rir,
    è_un go -- de - - - re che sem -- bra mo -- rir.

}

VIIIbcn = \relative do {

    sol4 r8
    sol4 r8
    sol re' re,

    %4
    sol si16  la si do
    re4 r8\mbreak
    re4 r8

    %7
    re8 sol,16 la si sol
    do8 do16 re mi do
    re4 sol,8

    %10
    do re re,
    sol4 r8
    sol4 r8\mbreak

    %13
    sol4 r8
    sol la re,
    sol4 r8

    %16
    re'8 fad re
    sol4 r8
    sol,16 la si8 do

    %19
    re8 si sol\mbreak
    do mi' do
    fad,4.

    %22
    si,
    mi
    la,

    %25
    re\mbreak
    sol,4 r8
    sol4 r8

    %28
    sol16 la si8 dod
    re fad re
    sol la la,

    %31
    re4 r8\mbreak
    re4 r8
    re la' la,

    %34
    re la' re,
    sol,4 r8
    sol4 r8

    %37
    sol4 r8
    sol' la re,\mbreak
    sol,4 r8

    %40
    sol4 r8
    sol4 r8
    sol4 r8

    %43
    do4 r8
    dod4 r8\mbreak
    dod?4 r8

    %46
    re fad re
    sol,4 r8
    re' fad re

    %49
    sol,4 r8
    re re' re\mbreak
    re4 r8

    %52
    R4.*8
    sol,8 sol' sol,
    re' re, r

    %62
    re' re, r
    re' re, r
    r sol' sol,\mbreak

    %65
    R4.*4
    sol4 r8
    sol4 r8\mbreak

    %71
    sol sol16 la si sol
    la8 re,4
    sol r8

    %74
    sol do re
    sol,4.
    mi'4 r8

    %77
    mi mi mi\mbreak
    mi mi mi
    mi mi, r

    %80
    mi'4 r8
    r sol sol
    fad4.

    %83
    si,4 si'8\mbreak
    sol fad fad,
    si si la

    %86
    sold4 r8
    r fa' fa
    mi4.

    %89
    la,4 r8\mbreak
    la4 r8
    la4 r8

    %92
    la re mi
    la,4.\fermata

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*7
    <9>4.
    <7>
    s4.*11
    <7>4.
    <7>
    <7>
    <7>
    <7>
    s4.*15
    <7->4.
    s4.*5
    <_->4.
    <5 4>8 <3>4
    s4.
    <5 4>8 <3>4
    s4.*11
    <6 4>8 <5 3> s
    <6 4>8 <5 3> s
    s4.*13
    <6 4>4.
    s
    s8 <5 3>4
    s4.
    s
    <7 _+>
    s4.*3
    <7->4.
    s
    <7 _+>

}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key sol\major
    \tempo 4. = 65
    s4.*93
    \bar "|."
    \mark\markup\smaller {D.C.}

}

VIIIvlI = {
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    <<\VIIIvlIIn \forma>>

}

VIIIvla = {
    \clef alto
    <<\VIIIvlan \forma>>

}

VIIIsoprano = {
    \new Voice = "diletto"
    <<\VIIIsopranon \forma>>
}

VIIIalto = {
    \new Voice = "seno"
    <<\VIIIalton \forma>>
}

VIIIbc = {
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
}





IXvlIn = \relative do'' {

    la4\p r r
    la' fa8. mi16 re8. do16
    si2 r4

    %4
    si'4 sold8. [fad16 mi8. re16]
    do2 r4
    si' mi,8.[mi16 do8. la16]

    %7
    fa'4 mi mi,
    la r la'2\p
    sol1

    %10
    fa
    re~
    re2 mib\mbreak

    %13
    do do4 re\fermata

}

IXvlIIn = \relative do'' {

    la4\p r r
    la' fa8. mi16 re8. do16
    si2 r4

    %4
    si'4 sold8. [fad16 mi8. re16]
    do2 r4
    si' mi,8.[mi16 do8. la16]

    %7
    fa'4 mi mi,
    la r do2~\p
    do1

    %10
    la~
    la2 sib~
    sib~  sib\mbreak

    %13
    la la4 sib\fermata

}

IXvlan = \relative do' {

    la4\p r r
    la' fa8. mi16 re8. do16
    si2 r4

    %4
    si'4 sold8. [fad16 mi8. re16]
    do2 r4
    si' mi,8.[mi16 do8. la16]

    %7
    fa'4 mi mi,
    la r mi'2~\p
    mi1

    %1o
    do~
    do2 sol'~
    sol1

    %13
    fa2 fa4 fa\fermata

}

IXsopranon = \relative do'' {

    \autoBeamOff

    mi4 do8. si16 la8. sol16
    fa4 fa r
    fa' re8. do16 si8. la16\mbreak

    %4
    sold4 sold r
    mi' la,8. la16 la8. la16
    re4. sold,8 la4~

    %7
    la8. re16 do4(si\tr)
    la4 r\mbreak do8 do16 do do8 sib
    sib? sib r sol sib! sib sib la

    %10
    la la r4 do8 re mib re16 do\mbreak
    re8 re r16 la sib do sib8 sib r4
    sib? do8 re sol, sol r mib'\mbreak

    %13
    la, la la sib fa fa r4\fermata

}

IXtestoI = \lyricmode {

    Quan -- to feli - ci sie -- te,
    o spiag -- ge_av -- ven -- tu -- rose, _ o spiag -- ge_av -- ven -- tu -- ro -- se_o
    spiagge a -- pri -- che.

    Se rive - der -- vi li -- ce
    mer -- cè del vos -- tro nu -- me
    nel bel vol -- to ter -- reno _  uni - te_as -- sieme _
    d'o -- gni vir -- tu -- te  il più tra -- scelto  _ sceme. _

}

IXbcn = \relative do {

    la4\p r r
    la' fa8. mi16 re8. do16
    si2 r4

    %4
    si'4 sold8. [fad16 mi8. re16]
    do2 r4
    si' mi,8.[mi16 do8. la16]

    %7
    fa'4 mi mi,
    la r\mbreak la2
    mi'1

    %10
    fa\mbreak
    fad2 sol~
    sol mib~

    %13
    mib fa4 sib,\fermata

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*7
    s1
    <6 5->1
    s
    <6 5>2 <_->
    s1
    <6 4 2>

}


forma = {

    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \key la\minor
    \tempo 4 = 70
    s2.*7
    \time 4/4
    s1*6
    \bar "|."

}



IXvlI = {
    <<\IXvlIn \forma>>

}

IXvlII = {
    <<\IXvlIIn \forma>>

}

IXvla = {
    \clef alto
    <<\IXvlan \forma>>

}

IXsoprano = {
    \new Voice = "felici"
    <<\IXsopranon \forma>>
}

IXbc = {
    \clef bass
    <<\IXbcn \forma \IXbfn>>
}





XvlIn = \relative do'' {

    do4 do8-.(do-.)
    mib16(re do si do4)
    do4 do8-.(do-.)

    %4
    mib16(re do si do8) sol
    fa fa'4 mib16 re\mbreak
    mib8 si4 do8

    %7
    sol fa'4 mib16 re
    mib16(re do si do4)
    mib mib,8 mib

    %10
    mib16(fa sol lab sib8) mib
    re16(do sib4) lab8
    sol16(fa mib4) mib'8\mbreak

    %13
    re16(do sib4) lab8
    sol fa16 mib fa4\tr
    mib r

    %16
    do'4 do8 do
    mib16 \parenthesize (re do si do4)
    do do8 do

    %19
    mib16 \parenthesize (re do si do8) sol\mbreak
    fa fa'4 re8
    mib re4 do8~

    %22
    do[re16 mib fa8 mib16 re]
    mib8 re4 do8
    r mib re16 do sib lab

    %25
    sol8 fa mib8 sib'
    mib re16 do sib8 sib
    mib re16 do sib8 lab\mbreak %% fine metà p. 49

    %28
    sol4 fa
    mib r
    do' do8 do

    %31
    mib16(re do si do8) sol
    fa fa'4 mib16 re
    mib8 si4 do8

    %34
    sol fa'4 mib16 re
    mib(re do si do4)
    do do8 do\mbreak

    %37
    mib16 \parenthesize (re do si do4)
    do do8 do
    mib16 \parenthesize (re do si do4)

    %40
    fa,8 fa'4 mib16 re
    mib8 sol,4 lab8~
    lab mib'4 re8~

    %43
    re fad,4 sol8~
    sol re'4 do8~\mbreak
    do[re16 mib fa mib re do]

    %46
    si8 la sol4
    do16 re mib re do sib lab sol
    lab8 sol fa4

    %49
    re'16 mib fa mib re do si la
    si8 la sol4
    r8 fa'  [mib re]

    %52
    mib  [re16 do re8 do16 si]\mbreak
    do4 do8 do
    mib16(re do si do4)~

    %55
    do8[re16 mib fa8 mib16 re]
    mib(re do si do4)~
    do8[lab'16 (sol fa mib re do)]

    %58
    si8 fa'4 mib16 re
    mib8 sol4 fa16 mib
    re8 fa4 mib16 re\mbreak

    %61
    mib8[re16 do re8 do16 si]
    do4\fermata r
    re mib8 sol,

    %64
    fad fad sol4
    re' mib8 sol,
    fad fad sol4

    %67
    r8 re' [re re]
    re sib16 do re8 re\mbreak
    re sib16 do re8 re

    %70
    sol fa16 mib re do sib la
    sol8 sol'4 mib8
    re4 sib8 sib

    %73
    do lab16 sib do8 do
    re sib16 do re8 re\mbreak
    mib mib, r mib'~

    %76
    mib re4 do8~
    do sib4 mib8
    sol,4 fa

    %79
    mib2\fermata

}

Xvlan = \relative do' {

    do'8[do sib lab]
    sol[sol fa mib]
    lab[lab sol fa]

    %4
    mib[re mib do]
    re[sol, sol sol]\mbreak
    do[sol' re do]

    %7
    si[sol sol sol]
    do[sol' mib do]
    sol'[mib mib mib]

    %10
    mib[mib re do]
    sib[sib do re]
    mib[fa sol lab]\mbreak

    %13
    sib,[sib do re]
    mib[mib sib' sib,]
    mib,4 r

    %16
    do''8[do sib lab]
    sol[sol fa mib]
    lab[lab sol fa]

    %19
    mib[mib re do]\mbreak
    re[si sol si]
    do[re mib fa16 sol]

    %22
    lab8[do, re sol,]
    do[re mib fa]
    mib[do sib re]

    %25
    mib[fa sol fa]
    mib[fa sol fa]
    mib[lab re, sib]\mbreak

    %28
    mib[lab sib sib,]
    mib4 r
    do8[do' sib lab]

    %31
    sol[fa mib do]
    re[sol, la si]
    do[sol' re do]

    %34
    si[sol sol sol]
    do[re mib re]
    do[do' sib lab]\mbreak

    %37
    sol[re re re]
    do[do' sib lab]
    sol[re mib do]

    %40
    re[sol, la si]
    do r mib r
    fa r do' r

    %43
    sib r re, r
    mib r sib' r\mbreak
    lab r fa r

    %46
    sol[fa mib re]
    do4 mib
    fa8[sol lab sol]

    %49
    fa4 fa
    sol8[fa mib re]
    do[sol la si]

    %52
    do[mib fa sol]\mbreak
    do,[do' sib lab]
    sol[re mib fa16 sol]

    %55
    lab8[do, re sol,]
    do[re mib fa16 sol]
    lab4. lab8

    %58
    sol[sol, sol la16 si]
    do8[do' do do,]
    sol'[sol, sol la16 si]

    %61
    do8[do' fa, sol]
    do,\fermata[do sib la]
    sol[sib do do]

    %64
    re[do sib la]
    sol[sib do do]
    re[do sib la]

    %67
    sol[la sib la]
    sol[la sib la]\mbreak
    sol[la sib la]

    %70
    sol do re re,
    sol[mib' mib mib]
    sib[sib lab sol]

    %73
    lab4 lab
    sib sib\mbreak
    do8[do' lab sol]

    %76
    fa[sib mib, lab]
    re,[sol sol fa]
    mib4 sib

    %79
    mib,2\fermata

}

Xsopranon = \relative do'' {

    \autoBeamOff

    R2*15
    do4 do8 do
    mib16 [re do si] do4

    %18
    do do8 do
    mib16 [re do si] do8 sol\mbreak
    fa fa'4(re8)

    %21
    mib re4 do8~
    do[re16 mib fa8 mib16 re]
    mib8 re4 do8

    %24
    r mib re16 [do] sib [lab]
    sol8 [fa] mib8 sib'
    mib [re16 do sib8] sib

    %27
    mib [re16 do] sib8 lab\mbreak %% fine metà p. 49
    sol4 fa
    mib r

    %30
    R2*6
    do'4 do8 do\mbreak
    mib16 [re do si] do4

    %38
    do do8 do
    mib16[ re do si] do4
    fa,8 fa'4 mib16 [re]

    %41
    mib8 sol,4 lab8~
    lab mib'4 re8~
    re fad,4 sol8~

    %44
    sol re'4 do8~\mbreak
    do[re16 mib fa mib re do]
    si8 [la] sol4

    %47
    do16 [re] mib [re do sib] lab [sol]
    lab8 [sol] fa4
    re'16 [mib] fa [mib re do] si [la]

    %50
    si8 [la] sol4
    r8 fa' mib re
    mib re16 do re8 do16 [si]\mbreak

    %53
    do4 r
    R2*9
    re4 mib8 sol,

    %64
    fad fad (sol4)
    re' mib8 sol,
    fad fad (sol4)

    %67
    r8 re' re re
    re sib16 do re8 re\mbreak
    re sib16 do re8 re

    %70
    sol fa16 mib re [do] sib [la]
    sol4 r
    r8 sib sib sib

    %73
    do lab16 sib do8 do
    re sib16 do re8 re\mbreak
    mib mib, r mib'~

    %76
    mib re4 do8~
    do sib4 mib8
    sol,4 fa

    %79
    mib2\fermata

}

XtestoI = \lyricmode {

    Gia -- ce lan -- guen -- te
    sen stà pian -- gen -- te
    fra vie ritor - - - - - te
    vin -- ta la sor -- te
    di -- nan -- ti_il Tro -- no
    del mio gran Re.

    Gia -- ce lan -- guen -- te
    sen stà pian -- gen -- te
    fra vie ri -- tor - - - - - - - - - te
    vin -- ta la sor -- te vin -- ta la sor -- te
    di -- nan -- ti_il Tro -- no
    del mio gran Re.

    E so -- spi -- rando _
    si va la -- gnando _
    ch'il sol va -- lore _
    d’un si Gran core, _  d’un si Gran core _
    prigion _ lo fa.

    Il sol va -- lore _
    d’un si Gran core, _  d’un si Gran core _
    pri -- gion lo fa, prigion _ lo fa

}

Xbcn = \relative do {

    do'8[do sib lab]
    sol[sol fa mib]
    lab[lab sol fa]

    %4
    mib[re mib do]
    re[sol, sol sol]\mbreak
    do[sol' re do]

    %7
    si[sol sol sol]
    do[sol' mib do]
    sol'[mib mib mib]

    %10
    mib[mib re do]
    sib[sib do re]
    mib[fa sol lab]\mbreak

    %13
    sib,[sib do re]
    mib[mib sib' sib,]
    mib,4 r

    %16
    do''8[do sib lab]
    sol[sol fa mib]
    lab[lab sol fa]

    %19
    mib[mib re do]\mbreak
    re[si sol si]
    do[re mib fa16 sol]

    %22
    lab8[do, re sol,]
    do[re mib fa]
    mib[do sib re]

    %25
    mib[fa sol fa]
    mib[fa sol fa]
    mib[lab re, sib]\mbreak

    %28
    mib[lab sib sib,]
    mib4 r
    do8[do' sib lab]

    %31
    sol[fa mib do]
    re[sol, la si]
    do[sol' re do]

    %34
    si[sol sol sol]
    do[re mib re]
    do[do' sib lab]\mbreak

    %37
    sol[re re re]
    do[do' sib lab]
    sol[re mib do]

    %40
    re[sol, la si]
    do r mib r
    fa r do' r

    %43
    sib r re, r
    mib r sib' r\mbreak
    lab r fa r

    %46
    sol[fa mib re]
    do4 mib
    fa8[sol lab sol]

    %49
    fa4 fa
    sol8[fa mib re]
    do[sol la si]

    %52
    do[mib fa sol]\mbreak
    do,[do' sib lab]
    sol[re mib fa16 sol]

    %55
    lab8[do, re sol,]
    do[re mib fa16 sol]
    lab4. lab8

    %58
    sol[sol, sol la16 si]
    do8[do' do do,]
    sol'[sol, sol la16 si]

    %61
    do8[do' fa, sol]
    do,\fermata[do sib la]
    sol[sib do do]

    %64
    re[do sib la]
    sol[sib do do]
    re[do sib la]

    %67
    sol[la sib la]
    sol[la sib la]\mbreak
    sol[la sib la]

    %70
    sol do re re,
    sol[mib' mib mib]
    sib[sib lab sol]

    %73
    lab4 lab
    sib sib\mbreak
    do8[do' lab sol]

    %76
    fa[sib mib, lab]
    re,[sol sol fa]
    mib4 sib

    %79
    mib,2\fermata

}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    \key sol\minor
    \tempo 2 = 60
    s2*79
    \bar "|."
    \mark\markup\smaller "D.C."

}

XvlI = {
    <<\XvlIn \forma>>

}

Xvla = {
    \clef alto
    <<\Xvlan \forma>>

}

Xsoprano = {
    \new Voice = "giace"
    <<\Xsopranon \forma>>
}

Xbc = {
    \clef bass
    <<\Xbcn \forma \Xbfn>>
}




XIalton = \relative do' {

    \autoBeamOff

    sol'8 sol16 sol sib8 la la la r sib
    sol8 sol sol fa fa fa r16 re fa mi\mbreak
    do8 do r4 mi8 mi16 mi la8 la
    fad fad r si fad fad mi fad
    sol sol r4\mbreak sol8 sol sol sol16 si
    sold8 sold fad sold la la la la16 la
    re,8 re r fad\mbreak si mid, mid fad
    dod dod r4 r2\fermata

}

XItestoII = \lyricmode {

    Quan -- to fe -- li -- ci sie -- te o spiag -- ge_av -- ven -- tu -- ro -- se
    o spiag -- ge_a -- pri -- che,
    se rive - der -- vi lice, _ mercé _ del vostro  _ Nume _
    nel bel volto _ ter -- re -- no_u -- ni -- te_as -- sieme _
    d’ogni _ Vir -- tute _ il più tra -- scelto _ seme. _

}

XIbcn = \relative do {

    sol'2 dod,~
    dod sold
    la1
    red
    mi2~mi
    mid fad
    si,~si
    dod fad,\fermata

}

XIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 60
    s1*8
    \bar "|."

}

XIalto = {
    \new Voice = "quanto"
    <<\XIalton \forma>>
}

XIbc = {
    \clef bass
    <<\XIbcn \forma \XIbfn>>
}





XIIvlIn = \relative do'' {

   si'8
   mi,[mi mi fad]
   sold[sold sold la]
   si[red,16 dod red8 mi]

   %4
   si'[red,16 dod red8 mi]
   la8 sold16 fad sold8 fad16 mi
   fad8 si, r si'

   %7
   mi,[mi mi fad]
   sold[sold sold la]
   si[red,16 dod red8 mi]

   %10
   si'[red,16 dod red8 mi]
   la8 sold16 fad sold8 fad16 mi
   fad4 r8 si(

   %13
   lad)[la(sold) sol](
   fad)[red(mi) si'](\mbreak
   lad)[la(sold) sol](

   %16
   fad)[red(mi) si']
   la4 fad
   mi r8 si'

   %19
   mi,[mi mi fad]
   sold sold4 la8
   si[red,16 dod red8 mi]

   %22
   si'[red,16 dod red8 mi]
   la8 sold16 fad sold8 fad16 mi
   fad8 si, r si'

   %25
   mi,[mi mi fad]
   sold sold4 la8
   si[red,16 dod red8 mi]

   %28
   si'[red,16 dod red8 mi]
   la8 sold16 fad sold8 fad16 mi
   fad4 sold~

   %31
   sold8 fad16 sold la8 sold
   fad4 r8 si(
   lad)[la(sold) sol](

   %34
   fad)[red(mi) si'](\mbreak
   lad)[la(sold) sol](
   fad)[red(mi) si']

   %37
   red,8.[mi16 fad8. sold16]
   fad8 si4 mi,8
   red16 fad mi sold fad la sold si

   %40
   fad8 si4 mi,8\mbreak %% fine p. 56
   red16 fad mi sold fad la sold si
   fad8 sold16 lad si8 si,

   %43
   red4(dod\tr)
   si4 r8 si'
   mi,[mi mi fad]

   %46
   sold sold4 la8
   si[red,16 dod red8 mi]
   si'[red,16 dod red8 mi]

   %49
   la8 sold16 fad sold8 fad16 mi
   fad8 [red si si']
   re,[re re mi]\mbreak

   %52
   fa fa4 mi16 re?
   si'8[fa mi re?]
   dod4 r8 dod'

   %55
   mi,[mi mi fad]
   sol sol4 fad16 mi
   dod'8 [sol fad mi]\mbreak

   %58
   red4 r
   sold?8 fad4 mi8
   la sold4(fad8)

   %61
   sold fad16 mi si'8 la16 sold
   fad4 r8 si
   red,8.[mi16 fad8. sold16]\mbreak

   %64 %% fine p. 58
   fad8 si4 mi,8
   red16 fad mi sold fad la sold si
   fad8 si4 mi,8

   %67
   red16 fad mi sold fad la sold si
   la8sold16 fad sold8 fad16 mi\mbreak
   fad2\tr

   %70
   mi4 r8 si'(
   lad)[la(sold) sol8](
   fad) [red(mi) si']

   %73
   si,4~si16 red dod si
   la'8 la4 la8
   si,4~si16 red dod si\mbreak

   %76
   sold'8 sold4 sold8
   si,4~si16 red dod si
   fad'8 fad4 red8

   %79
   mi16 fad sold la si8 la
   sold fad16 mi fad4\tr
   mi r8 si'

   %82
   mi,[mi mi fad]\mbreak
   sold8 sold4 si8
   si[red,16 dod red8 mi]

   %85
   si'[red,16 dod red8 mi]
   la8 sold16 fad sold8 fad16 mi
   fad8 si, r si'

   %88
   si,4~si16 red dod si
   la'8 la4 la8\mbreak
   si,4~si16 red dod si

   %91
   sold'8 sold4 sold8
   si,4~si16 red dod si
   fad'8 fad4 la8

   %94
   sold16 fad sold la si8 la
   sold4 fad\tr \mbreak
   mi4\fermata r8 sold

   %97
   dod,8[dod dod red]
   mi[mi mi fad]
   sold8 fad16 mi la8 sold16 fad

   %100
   sold8 fad16 mi la8 sold16 fad\mbreak
   sold8 dod, r sold'
   sold[fad fad fad]

   %103
   fad4 sold
   mi8 red16 dod red4\tr
   dod r8 sold'\mbreak

   %106
   mi dod r sold'
   mi dod r sold'
   dod[si la sold]

   %109
   fad2~
   fad~\mbreak
   fad8[la sold fad]

   %112
   mi4(red\tr)
   dod2\fermata

}

XIIvlIIn = \relative do'' {

   r8
   r4 r8 si'
   mi,[mi mi fad]
   sold la4 sold8

   %4
   fad la4 sold8
   fad[(si) mi,(si')]
   red,4 r

   %7
   r r8 si'
   mi,[mi mi fad]
   sold la4 sold8

   %10
   fad la4 sold8
   fad(si) mi,(si')
   red,4 r

   %13
   r r8 si'(
   lad)[la(sold) sol](
   fad)[red(mi) si'](\mbreak

   %16
   lad)[la(sold) sol](
   fad4) red
   mi r

   %19
   r r8 si'
   mi,[mi mi fad]
   sold la4 sold8

   %22
   fad la4 sold8
   fad (si) mi,\parenthesize (si')
   red,4 r

   %25
   r r8 si'
   mi,[mi mi fad]
   sold la4 sold8

   %28
   fad la4 sold8
   fad si mi, si'
   red,4 mi~

   %31
   mi8[red16 mi fad8 mi]
   red4 r
   r4 r8 si'(

   %34
   lad)[la(sold) sol](
   fad)[red(mi) si'](\mbreak
   lad)[la(sold) sol](

   %37
   fad4) r8 si
   red,8.[mi16 fad8. sold16]
   fad8 si4 mi,8

   %40
   red16 fad mi sold fad la sold si
   fad8 si4 mi,8\mbreak %% fine p. 56
   red4 r8 si

   %43
   si4 lad
   si r
   r4 r8 si'

   %46
   mi,[mi mi fad]
   sold la4 sold8
   fad la4 sold8

   %49
   fad[(si) mi,(si')]
   red,4 r
   r r8 si'\mbreak

   %52 OOKK Fine p. 57
   re,8[re re mi]
   fa [re?(dod si)]
   la4 r

   %55
   r r8 dod'
   mi,[mi mi fad?]
   sol[mi(red? dod)]\mbreak

   %58
   si4 r
   si'8 la4 sold?8
   fad mi4 red8

   %61
   mi sold4 fad16 mi
   red4 r
   r r8 si'\mbreak

   %64
   red,8.[mi16 fad8. sold16]
   fad8 si4 mi,8
   red16 fad mi sold fad la sold si

   %67
   fad8 si4 mi,8
   fad4 mi~\mbreak
   mi red

   %70
   mi r
   r r8 si'
   \parenthesize (lad)[la \parenthesize (sold) sol]\parenthesize (

   %73
   fad4) r
   si,~si16 red dod si
   la'8 la4 la8\mbreak

   %76
   si,4~si16 red dod si
   sold'8 sold4 sold8
   si,4~si16 red dod si

   %79
   sold' fad mi fad sold8 mi
   mi4 red
   mi r

   %82
   r r8 si'\mbreak
   mi,[mi mi fad]
   sold la4 sold8

   %85
   fad la4 sold8
   fad(si) mi,(si')
   red,4 r

   %88
   r r8 si'
   si,4~si16 red dod si\mbreak
   la'8 la4 la8

   %91
   si,4~si16 red dod si
   sold'8 sold4 sold8
   si,4~si16 red dod si

   %94
   mi red mi fad sold8 fad
   mi4 red\tr\mbreak
   mi4\fermata r

   %97
   r r8 sold
   dod,8[dod dod red]
   mi red16 dod fad8 mi16 red

   %100
   mi8 red16 dod fad8 mi16 red\mbreak
   mi4 r8 mi
   mi[red red red]

   %103
   red4 red
   dod sid
   dod8 [sold' mi dod]\mbreak

   %106
   r sold'[mi dod]
   r sold'[mi dod]
   R2

   %109
   r4 r8 dod
   fad[mi red dod]\mbreak
   sid[fad' mi red]

   %112
   dod4 sid\tr
   dod2\fermata

}

XIIvlan = \relative do' {

   mi8 mi[mi mi red]
   mi[mi mi si]
   mi(fad) si,(mi)

   %4
   red(fad) si,(mi)
   red4 mi
   si r8 mi

   %7
   mi8[mi mi red]
   mi[mi mi si]
   mi(fad) si,(mi)

   %10
   red(fad) si,(mi)
   red4 mi
   si8[si red si]

   %13
   fad' red mi4
   fad8 si, mi4\mbreak
   fad8 si, mi4

   %16
   si8 si mi4
   la,4 si
   mi4 r

   %19
   mi8[mi mi red]
   mi[sold16 fad mi8 si]
   mi[fad si, mi]\mbreak

   %22
   red [fad si, mi]
   red[red mi mi]
   si4 r

   %25
   mi8[mi mi red]
   mi[sold16 fad mi8 si]
   mi fad si, mi\mbreak

   %28
   red fad si, mi
   red[red mi mi]
   si[si' mi, mi]

   %31
   la,4. lad8
   si8[si red si]
   fad' red (mi4)

   %34
   fad8 si, (mi4)\mbreak
   fad8 si, (mi4)
   fad8 si, (mi4)

   %37
   si8[mi red mi]
   r mi[red mi]
   r mi[red mi]

   %40
   r mi[red mi]\mbreak
   r mi[red mi]
   r fad[red si]

   %43
   fad'4 fad,
   si r
   mi8[mi mi red]

   %46
   mi[sold16 fad] mi8 si\mbreak
   mi fad si, mi
   red fad si, mi

   %49
   red[red mi mi]
   si4 r
   r8 mi[sold mi]\mbreak

   %52
   r8 re'[si mi,]
   r sold[sold, sold']
   la[la, dod la]

   %55
   r fad'[lad fad]
   r mi'[dod fad,]
   r lad[lad, lad']\mbreak

   %58
   si[si, red si]
   si8 si' si,4~
   si8 si' si,4~

   %61
   si8 si' si,4~
   si8[si red si]
   r mi[red mi]\mbreak

   %64
   r mi[red mi]
   r mi[red mi]
   r mi[red mi]

   %67
   r mi[red mi]
   si4 mi\mbreak
   si' si,

   %70
   mi8[mi red si]
   fad' red(mi4)
   fad8 si,(mi4)

   %73
   si8 si' si,4~
   si8 si' si,4~
   si8 si' si,4~\mbreak

   %76
   si8 si' si,4~
   si8 si' si,4~
   si8 si' si,4

   %79
   mi4. si8
   mi4 si
   mi r

   %82
   mi8[mi mi red]
   mi[sold16 fad mi8 si]\mbreak
   mi fad si, mi

   %85
   red fad si, mi
   red[red mi mi]
   si[si red si]~

   %88
   si8 si' si,4~
   si8 si' si,4~\mbreak
   si8 si' si,4~

   %91
   si8 si' si,4~
   si8 si' si,4~
   si8 si' si,4

   %94
   mi4. si8
   mi4 si\mbreak
   mi4\fermata r

   %97
   dod8[dod dod sid]
   dod[dod dod sold]
   dod4 dod

   %100
   dod dod\mbreak
   dod8[dod mi dod]
   r sold'[sid sold]

   %103
   r sold[sid sold]
   r dod,[sold' sold,]
   dod4 dod\mbreak

   %106
   dod dod
   dod dod
   dod r

   %109
   r r8 la'
   red[dod sid lad]\mbreak
   sold4. sold8

   %112
   dod,4 sold
   dod,2\fermata

}

XIIalton = \relative do' {

   \autoBeamOff

   r8
   R2*17
   r4 r8 si'
   mi, mi mi fad

   %20
   sold sold4 la8
   si[red,16 dod red8 mi]
   si'[red,16 dod red8 mi]

   %23
   la8 [sold16 fad] sold8 [fad16 mi]
   fad8 si, r si'

   %25
   mi, mi mi fad
   sold sold4 la8
   si[red,16 dod red8 mi]

   %28
   si'[red,16 dod red8 mi]
   la8 [sold16 fad] sold8 [fad16 mi]
   fad4 sold~

   %31
   sold8 fad16 sold la8 sold
   fad4 r8 si(
   lad)[la(sold) sol](

   %34
   fad)[red(mi) si'](\mbreak
   lad)[la(sold) sol](
   fad)[red] mi si'

   %37
   red,8.[mi16 fad8. sold16]
   fad8 si4 mi,8
   red16 [fad mi sold] fad [la sold si]

   %40
   fad8 si4 mi,8\mbreak %% fine p. 56
   red16 [fad mi sold] fad [la sold si]
   fad8 [sold16 lad si8] si,

   %43
   red4(dod\tr)
   si4 r
   R2*5

   %50
   r4 r8 si'
   re, re re mi\mbreak
   fa fa4 mi16 [re?]

   %53
   si'8[fa mi re?]
   dod4 r8 dod'
   mi, mi mi fad

   %56
   sol sol4 fad16 [mi]
   dod'8 [sol fad mi]\mbreak
   red4 r

   %59
   sold?8 fad4 mi8
   la sold4(fad8)
   sold [fad16 mi] si'8 [la16 sold]

   %62
   fad4 r8 si
   red,8.[mi16 fad8. sold16]\mbreak
   fad8 si4 mi,8

   %65
   red16 [fad mi sold] fad [la sold si]
   fad8 si4 mi,8
   red16 [fad mi sold] fad [la sold si]

   %68
   la8 [sold16 fad sold8] fad16 [mi]\mbreak
   fad2\tr
   mi4 r8 si'(

   %71
   lad) la[(sold)] sol8 (
   fad) red[(mi)] si'
   si,4~si16[red dod si]

   %74
   la'8 la4 la8
   si,4~si16 [red dod si]\mbreak
   sold'8 sold4 sold8

   %77
   si,4~si16 [red dod si]
   fad'8 fad4 red8
   mi16 [fad sold la] si8 la

   %80
   sold fad16[mi] fad4\tr
   mi r
   R2*14

   %96
   r4 r8 sold
   dod,8 dod dod red
   mi mi mi fad

   %99
   sold8 [fad16 mi] la8 [sold16 fad]
   sold8 [fad16 mi] la8 sold16 [fad]\mbreak
   sold8 dod, r sold'

   %102
   sold fad fad fad
   fad4 sold
   mi8 red16 [dod] red4\tr

   %105
   dod r8 sold'\mbreak
   mi dod r sold'
   mi dod r sold'

   %108
   dod si la sold
   fad2~
   fad~\mbreak

   %111
   fad8 la sold fad
   mi4(red\tr)
   dod2\fermata

}

XIItestoII = \lyricmode {

   Co -- sì sol nel --  l'au -- ro - - - - - - - ra
   al -- lor ch'il cie -- lo_in -- do - - - - - - ra
   spie -- gan la lor bel -- tà vezzo -- si vez -- zo - - - - - - - - - - - si_i
   fio -- ri.
   
   Co -- sì sol nel --  l'au -- ro - - - ra
   al -- lor ch'il cie -- lo_in -- do - - - ra
   spie -- gan la lor bel -- tà  - - vez -- zo - - - - - - - - - - -  si 
   fio -- ri vez -- zo - - - - - - - - - - - - - - - - si vez -- zo -- si_i
   fio -- ri.

   E_il sol co -- si ve -- drai 
   con suoi lu -- cen - - - ti rai _
   fra gl'as -- tri compa - rir pien di splen -- do -- ri,
   ve -- drai _ ve -- drai _ fra gl'as -- tri compa - rir 
   pien di splen -- do -- ri.

}

XIIbcn = \relative do {

   mi8 mi[mi mi red]
   mi[mi mi si]
   mi(fad) si,(mi)

   %4
   red(fad) si,(mi)
   red4 mi
   si r8 mi

   %7
   mi8[mi mi red]
   mi[mi mi si]
   mi(fad) si,(mi)

   %10
   red(fad) si,(mi)
   red4 mi
   si2~

   %13
   si~
   si~\mbreak
   si~

   %16
   si4 mi
   la, si
   mi, r

   %19
   mi'8[mi mi red]
   mi[sold16 fad mi8 si]
   mi fad si, mi\mbreak

   %22
   red fad si, mi
   red[red mi mi]
   si4 r

   %25
   mi8[mi mi red]
   mi[mi mi si]
   mi fad si, mi

   %28
   red fad si, mi\mbreak
   red[red mi mi]
   si[si' mi, mi]

   %31
   la,4. lad8
   si2~
   si~

   %34
   si~\mbreak
   si~
   si~

   %37
   si~
   si~
   si~

   %40
   si~
   si~
   si8[fad' red si]

   %43
   fad'4 fad,
   si r
   mi8[mi mi red]

   %46
   mi[mi mi si]\mbreak
   mi fad si, mi
   red fad si, mi

   %49
   red[red mi mi]
   si4 r
   r8 mi[sold mi]\mbreak

   %52
   r8 re'[si mi,]
   r sold[sold, sold']
   la[la, dod la]

   %55
   r fad'[lad fad]
   r mi'[dod fad,]
   r lad[lad, lad']\mbreak

   %58
   si[si, red si]
   si2~
   si~

   %61
   si~
   si8[si red si]
   si2~\mbreak

   %64
   si~
   si~
   si~

   %67
   si~
   si4 mi\mbreak
   si' si,

   %70
   mi si
   si2~
   si~

   %73
   si~
   si~
   si~\mbreak

   %76
   si~
   si~
   si

   %79
   mi4. si8
   mi4 si
   mi r

   %82
   mi8[mi mi red]
   mi[mi mi si]
   mi fad si, mi

   %85
   red fad si, mi
   red4 mi
   si2~

   %88
   si~
   si~\mbreak
   si~

   %91
   si~
   si~
   si

   %94
   mi4. si8
   mi4 si\mbreak
   mi,\fermata r

   %97
   dod'8[dod dod sid]
   dod[dod dod sold]
   dod4 dod

   %100
   dod dod\mbreak
   dod8[dod mi dod]
   r sold'[sid sold]

   %103
   r sold[sid sold]
   r dod,[sold' sold,]
   dod4 dod\mbreak

   %106
   dod dod
   dod dod
   dod r

   %109
   r r8 la'
   red[dod sid lad]\mbreak
   sold4. sold8

   %112
   dod,4 sold
   dod,2\fermata

}

XIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 2/4
   \key mi\major
   \tempo 2 = 60
   \partial 8 s8
   s2*113
   \bar "|."
   \mark\markup\smaller "D.C."

}

XIIvlI = {
   <<\XIIvlIn \forma>>

}

XIIvlII = {
   <<\XIIvlIIn \forma>>

}

XIIvla = {
   \clef alto
   <<\XIIvlan \forma>>

}

XIIalto = {
   \new Voice = "aurora"
   <<\XIIalton \forma>>
}

XIIbc = {
   \clef bass
   <<\XIIbcn \forma \XIIbfn>>
}




XIIIsopranon = \relative do'' {

   \autoBeamOff
   
   R1*7
   r2 r4 r16 do do re\mbreak
   sib8 sib r4 sol8 sol16 la sib8 la
   la la r do do do sib do\mbreak
   re4 r16 sib sib la fa8 fa r4
   R1\fermata

}

XIIItestoI = \lyricmode {
   
   A si -- mil vista _
   sen -- to_un so -- ave_af - fetto _
   di te -- nero _ pia -- cer col -- mar -- mi_il petto. _

}

XIIIalton = \relative do' {

   \autoBeamOff
   
   R1*4
   r2 fad4 fad8 sol
   sol sol r4 re8 re16 re re8 mi\mbreak
   fa fa fa mi mi mi r sol
   la fa fa mi do do r4
   R1*3
   R1\fermata

}

XIIItestoII = \lyricmode {
   
   O co -- me_as -- sieme _
   nel gio -- vanil  _ sem -- biante _ uni -- sce_a gara _
   bel -- lezza_e _ ma -- es -- tade. _

}

XIIIbasson = \relative do {

   \autoBeamOff

   r4 r8 mi la la dod la16 si
   sold8 sold r4 mi mi8 fad\mbreak
   sold sold r4 si 8sold16 sold fad8 mi
   la la r4 mi8 fad sol sol16 fad\mbreak
   re8 re r4 r2
   R1*6
   R1\fermata

}

XIIItestoIII = \lyricmode {
   
   Ma giun -- ti ec -- co -- ne_in -- nante _
   dov' ei spi -- rando _ e_ma -- e -- state _ e_a -- more _
   lu --  mi -- noso _ ris -- plende. _
   
}

XIIIbcn = \relative do {
   
   la1
   re~
   re
   dod
   re
   si~\mbreak
   si2 do
   fa sol4 do,~
   do1
   fa\mbreak
   sib,2 do
   fa,1\fermata
   
}

XIIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*12
   \bar "|."

}

XIIIsoprano = {
   \new Voice = "vista"
   <<\XIIIsopranon \forma>>
}

XIIIalto = {
   \new Voice = "come"
   <<\XIIIalton \forma>>
}

XIIIbasso = {
   \clef bass
   \new Voice = "giunti"
   <<\XIIIbasson \forma>>
}

XIIIbc = {
   \clef bass
   <<\XIIIbcn \forma \XIIIbfn>>
}





XIVvlIn = \relative do'' {

   sib8. do16 \appoggiatura sib8 la2\tr
   sib4-! fa-! sib-!
   re8. mib16 \appoggiatura re8 do2\tr

   %4
   re4 do sib\mbreak
   sib-! fa-! fa'-!
   fa mib8. re16 mib4

   %7
   mib-! fa,-! sol'-!
   sol-! fa8. mib16 fa4
   sib(la sol)

   %10
   fa(mib re)
   mib \appoggiatura re8 do2\tr \mbreak
   sib2.

   %13
   sib8.\p do16 \appoggiatura sib8 la2\tr
   sib4 fa sib
   re8. [mib16] \appoggiatura re8 do2\tr

   %16
   re4 (do) sib
   sib(fa) re'\mbreak
   re (do8.[sib16)] do4

   %19
   do(fa,) mib'
   mib re8.[do16] re4
   fa(mi) re

   %22
   do(sib) la
   sib \appoggiatura la sol2\tr \mbreak
   la'8.\f sib16 \appoggiatura la8 sol2

   %25
   la4 fa do
   do8. re16 \appoggiatura do8 sib2\tr
   la4 fa do

   %28
   fa'(mi re
   do sib la)\mbreak
   sib \appoggiatura la8 sol2\tr

   %31
   fa8.\p re'16 \appoggiatura do8 si2\tr
   do4 sol do
   re8.[(mib16] fa4) re

   %34
   mib(re) do
   sib8. [do16] \appoggiatura sib8 la2\mbreak
   sib4(fa) sib

   %37
   do8.[(re16] mib4) do
   re(do) sib
   fa'(mib) re

   %40
   do(la) sib
   mib re2\tr \mbreak
   do r4

   %43 OOKK
   fa,8.[sol16] fa4 fa'
   fa mib8.[re16] mib4
   fa,8.[sol16] fa4 mib'

   %46
   mib re8.[do16] re4
   sol(fa) mib\mbreak
   re(do) sib

   %49
   do4 la2\tr
   sib r4
   fa8.[(sol16] fa4) fa'

   %52
   fa mib8.[re16] mib4
   fa,8.[sol16] fa4 mib'\mbreak
   mib re8.[do16] re4

   %55
   sol(fa) mib
   re(do) sib
   do \appoggiatura sib8 la2\tr

   %58
   sib r4
   sib8.\f do16 \appoggiatura sib8 la2\tr\mbreak
   sib4 fa sib

   %61
   re8. mib16 do2\tr
   re4 do sib
   sib fa fa'

   %64
   fa mib8. re16 do4
   do fa, sol'\mbreak
   sol fa8. mib16 fa4

   %67
   sib(la sol
   fa mib re)
   mib \appoggiatura re8 do2\tr

   %70
   sib2.\fermata
   re4\p(mib) do
   re4 r mib\mbreak

   %73
   do(la) re
   sib(la) sol
   re'(mib) fa

   %76
   si,(la) sol
   fa'(mib) re
   mib(re) do\mbreak

   %79
   fa,2 re'4
   sol,2 do4
   re \appoggiatura do8 si2

   %82
   do r4
   mi2 re4
   dod(si) la\mbreak

   %85
   sol(fa) mi
   fa(mi) re
   re' r mi

   %88
   la, r re
   mi \appoggiatura re8 dod2
   \appoggiatura do8 re2.\fermata

}

XIVvlIIn = \relative do'' {

   re8. mib16 \appoggiatura re8 do2\tr
   re4 sib fa
   sib8. do16 \appoggiatura sib8 la2\tr

   %4
   sib2.\mbreak
   fa4(sib) re
   re do8. sib16 do4

   %7
   fa,(do') mib
   mib re8. do16 re4
   sol(fa mib)

   %10
   re(do sib)
   do \appoggiatura sib8 la2\tr\mbreak
   sib2.

   %13
   re8.\p mib16 \appoggiatura re8 do2
   re4 sib fa'
   sib,8. do16 \appoggiatura sib8 la2\tr

   %16
   sib2.
   fa4(sib) fa'\mbreak
   fa \parenthesize (mib8. re16) mib4

   %19
   fa,(do') sol'
   sol fa8. mi16 fa4
   re4(do sib

   %22
   la sol fa)
   sol \appoggiatura fa8 mi2\tr\mbreak
   fa'8.\f sol16 \appoggiatura fa8 mi2\tr

   %25
   fa4 do la
   la8. sib16 \appoggiatura la8 sol2\tr
   fa4 do la

   %28
   re'(do sib
   la sol fa)\mbreak
   sol \appoggiatura fa8 mi2

   %31
   fa4\p fa2
   mib sol4
   si8.(do16 re4) si

   %34
   do4 \parenthesize (sol) mib!
   re'8. mib16 \appoggiatura re8 do2\tr\mbreak
   re4(sib) fa'

   %37
   la,8.(sib16 do4) la
   sib \parenthesize (fa) re
   re'(do sib)

   %40
   la2 fa'4
   sib,2.\mbreak
   la2 r4

   %43
   la8. sib16 la4 re
   re do8. sib16 do4
   la8. sib16 la4 do

   %46
   do sib8. la16 sib4
   sib'(la sol\mbreak
   fa mib re)

   %49
   mib \appoggiatura re8 do2\tr
   sib r4
   la8. \parenthesize (sib16 la4) re

   %52
   re do8. sib16 do4
   la8. sib16 la4 do\mbreak
   do sib8. la16 sib4

   %55
   sib'(la sol
   fa mib re)
   mib \appoggiatura re8 do2\tr

   %58
   sib r4
   re8.\f mib16 \appoggiatura re8 do2\tr \mbreak

   %60
   re4 sib fa
   sib8. do16 \appoggiatura sib8 la2\tr
   sib2.

   %63
   fa4(sib) re
   re do8. sib16 do4
   fa,(do') mib\mbreak

   %66
   mib re8. do16 re4
   sol(fa mib
   re do sib)

   %69
   do \appoggiatura sib8 la2\tr
   sib2.\fermata

   %71
   sib4\p(do) la
   sib r do\mbreak
   la(re8) la fad'[(re)]

   %74
   re2.
   si4(do) re
   re(do) si

   %77
   re(do) si
   sol'2.\mbreak
   re,4 do si

   %80
   sol' fa mib
   lab sol2
   mib r4

   %83
   sib'2 sol'4
   mi(re dod)\mbreak
   mi(re dod)

   %86
   la'2.
   la,4 r dod
   la r la

   %89
   sib mi,2
   fa2.\fermata

}

XIVvlan = \relative do' {

   fa8. sol16 la4 fa
   fa re2
   fa8. sol16 la4 fa

   %4
   fa 2.\mbreak
   re4(fa) sib
   la la la

   %7
   do, fa do'
   sib sib sib
   sib,2.~

   %10
   sib
   sol'4 fa2\mbreak
   re2.

   %13
   sib8.\p[mib16] fa8.[mib16 fa8. fa,16]
   sib8.[la16 sib8. do16 re8. do16]
   sib8.[mib16] fa8.[mib16 fa8. fa,16]

   %16
   sib8.[la16 sib8. do16 re8. do16]\mbreak
   sib4 sib sib
   fa' fa fa

   %19
   fa fa \parenthesize mib
   sib sib sib
   sib4. do8[re8. mi16]

   %22
   fa2 fa4
   sib, do do,
   do''8.\f re16 sol,4 do

   %25 %%% inizio p. 67
   do la fa
   fa mi2
   do4 la fa

   %28
   fa'2.
   fa\mbreak
   re4 do2

   %31
   la8.\p [fa'16] sol,8.[la16 si8. sol16]
   do8.[si16 do8. re16 mib8. do16]
   sol4 sol8.[la16 si8. sol16]

   %34
   do2 do,4
   si'8.[mib16] fa8.[mib16 fa8. fa,16]\mbreak
   sib8.[la16 sib8. do16 re8. sib16]

   %37
   fa'4 fa8.[sol16 la8. fa16]
   sib,2.
   sib4. do8 [re8. mib16]

   %40
   fa8.[sol16 fa8. mib16] re4
   sol8. [la16] sib4 mi,\mbreak %% fine prima riga p. 68
   fa8.[mi16 fa8. sol16 la8. sol16]

   %43
   fa4 fa fa
   fa fa fa
   fa fa fa

   %46
   sib, sib sib
   sib2.~\mbreak
   sib

   %49
   mib4 fa fa,
   sib8.[la16 sib8. do16 re8. mib16]
   fa4 fa fa

   %52
   fa fa fa
   fa fa fa\mbreak
   sib, sib sib

   %55
   sib2.~
   sib
   mib4 fa fa,

   %58
   sib8.[sol'16 fa8. mib16 re8. do16]
   sib8.\f sol'16  la4 fa\mbreak
   fa4 re2

   %61
   fa8. sol16 la4 fa
   fa2.
   re4(fa) sib

   %64
   la la la
   do,(fa) do'\mbreak
   sib sib sib

   %67
   sib,2.~
   sib
   sol'4 fa2

   %70
   re2.\fermata
   fa4\p sib, do
   sol8. [la16 sib8. sol16] do8. do,16\mbreak

   %73
   fad'8.[mi16 fad8. re16 mi8. fad16]
   sol,8.[la16 si?8. do16 si!8. la16]
   sol2 r4

   %76
   sol la si
   sol la  si
   do2 do,4\mbreak

   %79
   si' la sol
   mib' re do
   fa sol sol,

   %82
   do8.[si16 do8. re16 mib8. do16]
   sol2.
   la~\mbreak

   %85
   la
   re2 re,4
   fa'8. re16 dod8. [si16 dod8. la16]

   %88
   fa'8.[la16 sol8. fa16 mi8. re16]
   sol,4 la2
   mib2.\fermata

}

XIVsopranon = \relative do'' {

   \autoBeamOff

   R2.*12

   %13
   sib8. [do16] \appoggiatura sib8 la2\tr
   sib4 fa sib
   re8. [mib16] \appoggiatura re8 do2\tr

   %16
   re4 (do) sib
   sib(fa) re'\mbreak
   re (do8.[sib16)] do4

   %19
   do(fa,) mib'
   mib re8.[do16] re4
   fa(mi) re

   %22
   do(sib) la
   sib \appoggiatura la8 sol2\tr \mbreak
   fa2.
   R2.*6

   %31
   do'8. [re16] \appoggiatura do8 si2\tr
   do4 sol do
   re8.[(mib16] fa4) re

   %34
   mib(re) do
   sib8. [do16] \appoggiatura sib8 la2\mbreak
   sib4(fa) sib

   %37
   do8.[(re16] mib4) do
   re(do) sib
   fa'(mib) re

   %40
   do(la) sib
   mib re2\tr \mbreak
   do r4

   %43 OOKK
   fa,8.[sol16](fa4) fa'
   fa mib8.[re16] mib4
   fa,8.[sol16] fa4 mib'

   %46
   mib re8.[do16] re4
   sol(fa) mib\mbreak
   re(do) sib

   %49
   do4 la2\tr
   sib r4
   fa8.[(sol16] fa4) fa'

   %52
   fa mib8.[re16] mib4
   fa,8.[sol16] fa4 mib'\mbreak
   mib re8.[do16] re4

   %55
   sol(fa) mib
   re(do) sib
   do \appoggiatura sib8 la2\tr

   %58
   sib r4
   R2.*12
   re4(mib) do
   re4 r mib\mbreak

   %73
   do(la) re
   sib(la) sol
   re'(mib) fa

   %76
   si,(la) sol
   fa'(mib) re
   mib(re) do\mbreak

   %79
   fa,2 re'4
   sol,2 do4
   re \appoggiatura do8 si2

   %82
   do r4
   mi2 re4
   dod(si) la\mbreak

   %85
   sol(fa) mi
   fa(mi) re
   re' r mi

   %88
   la, r re
   mi \appoggiatura re8 dod2
   \appoggiatura dod?8 re2.\fermata

}

XIVtestoI = \lyricmode {

   Non fu mai _ più vis -- ta_in so -- glio
   ne pie -- tà più ma -- es -- to - sa
   ne più no -- bil ma -- es -- tà.
   
   Non fu mai _  più vis -- ta_in so -- glio
   ne pie -- tà più ma -- es -- to -- sa
   ne più no -- bil ma -- es -- tà,
   ne pie -- tà - più ma - es -- to - sa
   ne più no -- bil ma -- es -- tà,
   ne pie -- tà - più ma - es -- to - sa
   ne più no -- bil ma -- es -- tà.

   Tal non fu nel Cam -- pi -- do -- glio,
   tal non l'eb -- be_il Gre -- co_im -- pe -- ro,
   ne l'e --  -- gual più si ve -- drà,
   tal non l'eb -- be_il Gre -- co_im -- pe -- ro,
   ne l'e --  -- gual più si ve -- drà.

}

XIVbcn = \relative do {

   sib8.[mib16] fa8.[mib16 fa8. fa,16]
   sib8.[la16 sib8. do16 re8. do16]
   sib8.[mib16] fa8.[mib16 fa8. fa,16]

   %4
   sib8.[la16 sib8. do16 re8. do16]\mbreak
   sib4 sib sib
   fa' fa fa

   %7
   fa fa mib
   sib sib sib
   sib2.~

   %10
   sib
   mib4 fa fa,\mbreak
   sib8.[sol'16 fa8. mib16 re8. do16]

   %13
   sib4 r r
   R2.*10
   fa'8.[sib16 do8. sib16 do8. do,16]

   %25
   fa8.[mi16 fa8. sol16 la8. sol16]
   fa8. sib16 do8. [sib16 do8. do,16]
   fa8.[mi16 fa8. sol16 la8. la,16]

   %28
   sib4. do8[re8. mi16]
   fa2 fa4\mbreak
   sib, do do,

   %31
   fa4 r r
   R2.*27
   sib8.[mib16] fa8.[mib16 fa8. fa,16]

   %60
   sib8.[la16 sib8. do16 re8. do16]
   sib8.[mib16] fa8.[mib16 fa8. fa,16]
   sib8.[la16 sib8. do16 re8. do16]\mbreak

   %63
   sib4 sib sib
   fa' fa fa
   fa fa mib

   %66
   sib sib sib
   sib2.~
   sib

   %69
   mib4 fa fa,
   sib8.\fermata[mib16 re8. do16 sib8. la16]
   sol4 r r

   %72
   R2.*19

}

XIVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2.*5
   <6>4 <7 5> s
   s2.
   <6 4>4 <5 3> s
   <6 4>2.
   <5 3>
   s2.*53
   <4>4 <7 5> s
   s2.
   <4 9>4 <3 8> s
   <6 4>2.
   <5 3>

}


forma = {

   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \key sib\major
   \tempo 2. = 47
   s2.*90
   \bar "|."
   \mark\markup\smaller "D.C."

}

XIVvlI = {
   <<\XIVvlIn \forma>>

}

XIVvlII = {
   <<\XIVvlIIn \forma>>

}

XIVvla = {
   \clef alto
   <<\XIVvlan \forma>>

}

XIVsoprano = {
   \new Voice = "soglio"
   <<\XIVsopranon \forma>>
}

XIVbc = {
   \clef bass
   <<\XIVbcn \forma \XIVbfn>>
}





XVvlIn = \relative do'' {

   sib4 sib8 do re mib
   fa4 fa, fa
   sib4 sib8 do re mib

   %4
   fa4 fa, fa
   re'8 mib re do sib la
   sol la sib do re mib\mbreak

   %7
   do4 sib la
   sib r r
   r8 fa\p la do fa fa,

   %10
   R2.
   r8 fa la do fa fa,
   R2.*2

   %14
   fa'2.\f
   fa
   fa

   %17
   fa2 mib4~
   mib re(do)\mbreak
   re8 [do re mib fa re]

   %20
   sol2 sol4
   fa mib2
   re4 sib8[do re mib]

   %23
   fa[mib fa sol la fa]
   sib[la sol fa mib re]
   do'[sib la sol fa mib]\mbreak

   %26
   re[do re mib fa re]
   sol[fa sol mib fa sol]
   do,[sib do re mib fa]

   %29
   re[mib re do] sib4
   R2.
   sib

   %32
   do\mbreak
   re
   mib~

   %35
   mib4 re do
   sib r r
   fa' la fa

   %38
   sib sib, r\mbreak  %%% fine p. 81 OOKK
   r fa' la
   sib sib, r

   %41
   r mib sol
   do, la'8 [sol fa mib]
   re [do sib do re mib]\mbreak

   %44
   fa2.~
   fa4 mib2~
   mib4 re do

   %47
   re8[do re  mib fa  re]
   sol2 sol4\mbreak
   R2.

   %50
   r4 sib,4\p sib
   la lab lab
   sol mib' mib

   %53
   fa  fa fa\mbreak
   sib, sib sib
   mib mib mib

   %56
   fa fa fa
   sib, sib sib\mbreak
   la lab lab

   %59
   sol solb' solb
   fa fa fa
   sib, sib sib\mbreak

   %62
   fa' fa fa
   fa, fa fa
   sib fa'2

   %65
   fa2.\mbreak
   fa2 mib4~
   mib re do

   %68
   re8 [do re mib fa re]
   sol2 sol4\mbreak
   fa mib2

   %71
   re4 r r
   re8 do re mib fa re
   sol2 sol4

   %74
   fa mib2
   re2.\fermata

}

XVvlIIn = \relative do'' {

   sib4 sib8 do re mib
   fa4 fa, fa
   sib4 sib8 do re mib

   %4
   fa4 fa, fa
   re'8 mib re do sib la
   sol la sib do re mib\mbreak

   %7
   do4 sib la
   sib\p sib8[do re mib]
   fa4 fa, r

   %10
   sib sib8 do re mib
   fa4 fa, r
   re'8 mib re do sib la\mbreak

   %13
   sol la sib do re mib
   do4\f(sib) la
   sib sib8 do re mib

   %16
   fa4 fa, r
   sib re sib
   fa' fa, r\mbreak

   %19
   sib2 sib4
   sib2 sib4
   la2 la4

   %22
   sib r r
   R2.
   sib2.

   %25
   do\mbreak
   re
   mib~

   %28
   mib4 re do
   sib fa8 [sol la sib]
   do [sib do re mib fa]

   %31
   sib, [la sib do re mib]
   la, [sol la sib do la]\mbreak
   re[do re sib do re]

   %34
   sol,[fa sol la sib mib,]
   la[sol la do re mib]
   re4 sib re

   %37
   fa fa, r
   sib re sib\mbreak
   fa' fa, r

   %40
   r sib re
   sol, mib'8 re do sib
   la sol la sib do la

   %43
   sib4 r r\mbreak
   r fa la
   sib8[la sib do re mib]

   %46
   do4 sib la
   sib8[la sib do re do]
   sib2 sib4\mbreak

   %49
   la8 sol la sib do la
   sib4 sib\p sib
   la lab lab

   %52
   sol mib' mib
   fa  fa fa\mbreak
   sib, sib sib
   mib mib mib

   %56
   fa fa fa
   sib, sib sib\mbreak
   la lab lab

   %59
   sol solb' solb
   fa fa fa
   sib, sib sib\mbreak

   %62
   fa' fa fa
   fa, fa fa
   sib sib8 do re mib

   %65
   fa4 fa, r\mbreak
   sib re sib
   fa' fa, r

   %68
   sib2 sib4
   sib2 sib4\mbreak
   la2 la4

   %71
   sib r r
   sib8 la sib do re do
   sib2 sib4

   %74
   la2 la4
   sib2.\fermata

}

XVvlan = \relative do' {

   re4 re re
   do do do
   sib sib sib
   la la la
   fa' fa re
   sib sib sib\mbreak
   la sib do
   re\p re re
   do do do
   sib sib sib
   la la la
   fa' fa re
   sib sib sol'
   la, sib do
   re\f re re
   do8[sib do re mib do]

   %17
   sib[la sib do re sib]
   la[sol la sib do la]\mbreak
   fa4 re' sib

   %20
   sol8[fa sol la sib sol]
   la[sol la sib] do4
   sib re re

   %23
   do2 do4
   sib sib sib
   la2 la4\mbreak

   %26
   fa2 sib4
   sib2 sol4
   la2 la4

   %29
   fa2 r4
   r fa la
   sib fa r

   %32
   fa' do la\mbreak  %% fine p. 80
   sib fa r
   R2.

   %35
   r4 fa la
   sib fa re'8 re
   do4 do8 do do do

   %38
   sib4 sib8 sib sib sib\mbreak
   la4 la la8 la
   fa4 fa8 fa sib sib

   %41
   sib4 sol8 sol sol sol
   fa2.
   fa4 fa' fa\mbreak

   %44
   do8[sib do re mib do]
   sib2.
   la8[sol la sib do la]

   %47
   fa2.
   sol8[fa sol la sib sol]\mbreak
   sol sol sol4 sol

   %50
   sol sib\p sib
   la lab lab

   %52
   sol mib' mib
   fa  fa fa\mbreak
   sib, sib sib
   mib mib mib

   %56
   fa fa fa
   sib, sib sib\mbreak
   la lab lab

   %59
   sol solb' solb
   fa fa fa
   sib, sib sib\mbreak

   %62
   fa' fa fa
   fa, fa fa
   sib fa' fa

   %65
   la8[sol la sib do la]
   sol[fa sol la sib sol]
   fa[mib fa sol la fa]\mbreak

   %68
   sib,4 sib sib
   mib8[re mib fa sol mib]
   fa[(mib] fa4) fa,

   %71
   sib r r
   sib sib2
   mib8[re mib fa sol mib]

   %74
   fa[(mib] fa4) fa,
   sib2.\fermata

}

XVsopranon = \relative do'' {

   \autoBeamOff

   R2.*7
   sib4 sib8[do re mib]
   fa4 fa, r

   %10
   sib sib8 [do] re mib
   fa4 fa, r
   re'8 [mib re do] sib [la]\mbreak

   %13
   sol [la sib do] re [mib]
   do4(sib) la
   sib sib8 [do] re [mib]

   %16
   fa4 fa, r
   sib re sib
   fa' fa, r\mbreak

   %19
   sib2 sib4
   sib2 sib4
   la2 la4

   %22
   sib r r
   R2.
   sib2.

   %25
   do\mbreak
   re
   mib~

   %28
   mib4 re do
   sib fa8 [sol] la [sib]
   do [sib do re mib fa]

   %31
   sib, [la sib do re mib]
   la, [sol la sib do la]\mbreak
   re[do re sib do re]

   %34
   sol,[fa sol la sib mib,]
   la[sol la do re mib]
   re4 sib re

   %37
   fa fa, r
   sib re sib\mbreak
   fa' fa, r

   %40
   r sib re
   sol, mib'8 [re] do [sib]
   la [sol la sib] do la

   %43
   sib4 r r\mbreak
   r fa la
   sib8[la sib do re mib]

   %46
   do4 sib la
   sib8[la sib do re do]
   sib2 sib4\mbreak

   %49
   la8 [sol la sib] do la
   sib4 reb^\markup\italic"2 soli" reb
   do do8[reb] mib[fa]
   sib,4 sib8[do] reb[mib]
   la,2 la4\mbreak
   sib(reb) sib
   solb(mib) mib'
   sib la8 [sol?] la4
   sib fa reb'8 reb\mbreak
   do4 re!2
   mib4(mib,) mib'
   la,(sol fa)
   reb'(do) sib\mbreak
   la8[sol la sib] do reb
   sib4 la2\tr
   sib4 sib8 [do] re [mib]

   %65
   fa4 fa, r\mbreak
   sib re sib
   fa' fa, r

   %68
   sib2 sib4
   sib2 sib4\mbreak
   la2 la4

   %71
   sib r r
   sib8 [la sib do] re [[do]
   sib2 sib4

   %74
   la2 la4
   sib2.\fermata

}

XVtestoI = \lyricmode {

   Il des -- tino, _  la sor -- te e_il fato _
   pren -- da leg -- gi dal tuo cor,
   il des -- tino, _  la sor -- te_e_il fato _
   pren -- da leg -- gi dal tuo cor,
   pren -- da leg - - - gi pren -- da leg - - - - - gi,
   il des -- tino, _  la sor -- te_e_il fato _
   pren -- da leg - gi dal  - tuo cor,
   pren -- da leg - - - - - gi dal  tuo _ cor.
   
   Sii tu sem -- pre in pa -- ce a -- ma -- to
   ed in guer -- ra pa -- ven - tato _
   per a -- mor, per ma -- es -- tà,
   per gius -- ti -- zia e per va -- lor.
   
   Il des -- tino, _  la sor -- te_e_il fato _
   pren -- da leg -- gi dal tuo cor,
   pren -- da leg -- gi dal tuo cor.

}

XValton = \relative do' {

   \autoBeamOff

   R2.*13
   fa2.
   fa
   fa

   %17
   fa2 mib4~
   mib re(do)\mbreak
   re8 [do re mib fa re]

   %20
   sol2 sol4
   fa mib2
   re4 sib8[do] re [mib]

   %23
   fa[mib fa sol la fa]
   sib[la sol fa mib re]
   do'[sib la sol fa mib]\mbreak

   %26
   re[do re mib fa re]
   sol[fa sol mib fa sol]
   do,[sib do re mib fa]

   %29
   re[mib re do] sib4
   R2.
   sib

   %32
   do\mbreak
   re
   mib~

   %35
   mib4 re do
   sib r r
   fa' la fa

   %38
   sib sib, r\mbreak  %%% fine p. 81 OOKK
   r fa' la
   sib sib, r

   %41
   r mib sol
   do, la'8 [sol fa mib]
   re [do sib do re mib]\mbreak

   %44
   fa2.~
   fa4 mib2~
   mib4 re do

   %47
   re8[do re  mib fa  re]
   sol2 sol4\mbreak
   do,8[sib do re] mib do
   
   %50
   re4 fa solb
   solb? fa2
   fa4 mib mib
   
   %53
   mib(reb) do\mbreak
   reb(fa) reb
   sib(mib) solb
   
   %56
   fa fa8[mib] fa4
   reb sib solb'8 solb\mbreak
   solb?4 fa8 mib4 fa8
   
   %59
   sib,4(mib) solb
   do,2.
   fa4(mib) reb\mbreak
   
   %62
   do8[sib do reb] mib fa
   reb4 do2\tr
   sib4 fa'2

   %65
   fa2.\mbreak
   fa2 mib4~
   mib re do

   %68
   re8 do re [mib] fa [re]
   sol2 sol4\mbreak
   fa mib2

   %71
   re4 r r
   re8 [do re mib] fa [re]
   sol2 sol4

   %74
   fa mib2
   re2.\fermata

}

XVtestoII = \lyricmode {
   
   Il des -- ti -- no,  pren -- da leg - gi dal tuo cor,
   pren -- da leg - - - - - - gi
   pren -- da leg - - - gi la sor -- te_e_il fato _
   pren -- da leggi _
   pren -- da leg - - - - -  - - - gi dal tuo _ cor.
   
   Sii tu sem -- pre_in pace _ a -- ma -- to
   ed in guer -- ra pa -- ven - tato _
   per a -- mor, - per - ma -- es -- tà,
   per gius -- ti -- zia e per va -- lor.
   
   Il des -- tin,  la sor -- te_e_il fato _
   pren -- da leg -- gi dal tuo cor,
   pren -- da leg -- gi dal tuo cor.

}

XVtenoren = \relative do {

   \autoBeamOff

   R2.*14
   r4 \footnote #' (+1 . 2) \markup\column\smaller {"  ""NdA: Sarebbe molto bene far cantare questo Tenore ma però non è necessario""  "} re' re
   do8[sib] do re mib do

   %17
   sib[la sib do re sib]
   la[sol la sib do la]\mbreak
   fa4 re' sib

   %20
   sol8[fa sol la] sib[sol]
   la[sol la sib] do4
   sib re re

   %23
   do2 do4
   sib sib sib
   la2 la4\mbreak

   %26
   fa2 sib4
   sib2 sol4
   la2 la4

   %29
   fa2 r4
   r fa la
   sib fa r

   %32
   fa' do la\mbreak  %% fine p. 80
   sib fa r
   R2.

   %35
   r4 fa la
   sib fa re'8 re
   do4 do8 do do do

   %38
   sib4 sib8 sib sib sib\mbreak
   la4 la la8 la
   fa4 fa8 fa sib sib

   %41
   sib4 sol8 sol sol sol
   fa2.
   fa4 fa' fa\mbreak

   %44
   do8[sib do re mib do]
   sib2.
   la8[sol la sib do la]

   %47
   fa2.
   sol8[fa sol la sib sol]\mbreak
   sol sol sol4 sol

   %50
   sol r r
   R2.*13
   r4 re' re

   %65
   do8[sib] do re mib do\mbreak
   sib[la sib do re sib]
   la[sol la sib do la]

   %68
   fa4 re' sib
   sol8[fa sol la] sib[sol]\mbreak
   la[sol la sib] do4

   %71
   sib r r
   fa re'(sib)
   sol8[fa sol la] sib[sol]

   %74
   la[sol la sib] do4
   sib2.\fermata

}

XVtestoIII = \lyricmode {
   
   Il des -- tino, _  la sor -- te_e_il fa - to
   pren -- da leg -- gi dal tuo cor,
   il des -- ti -- no,  la sor -- te_e_il fa -- to
   pren -- da leg -- gi dal tuo cor,
   il des -- tino, _  la sor -- te_e_il fato _ pren -- da leg -- gi, 
   il des -- tino, _  la sor -- te_e_il fato _ 
   la sor -- te_e_il fato _   il des -- tino, _  la sor -- te_e_il fato _ 
   la sor -- te_e_il fa -- to  pren -- da leg - - - - - gi   dal tuo cor.
   
   Il des -- tino, _  la sor -- te_e_il fa - to
   pren -- da leg -- gi dal tuo cor,
   pren -- da leg -- gi dal tuo cor.

}

XVbasson = \relative do {

   \autoBeamOff

   R2.*14
   r4 sib' sib
   la8[sol] la sib do la

   %17
   sol[fa sol la sib sol]
   fa[mib fa sol la fa]\mbreak
   sib,4 sib sib

   %20
   mib8[re mib fa] sol[mib]
   fa[(mib] fa4) fa,
   sib sib' sib

   %23
   la2 la4
   sol sol sol
   fa2 fa4\mbreak

   %26
   sib,2 sib4
   mib2 mib4
   fa2 fa4

   %29
   sib, sib' sib
   la8[sol] la sib do la
   sol[fa sol la sib sol]

   %32
   fa[mib fa sol la fa]\mbreak
   sib,4 sib sib
   mib8[re mib fa] sol[mib]

   %35
   fa[\parenthesize (mib] fa4) fa,
   sib  r sib'8 sib
   la4 la8 la la la

   %38
   sol4 sol8 sol sol sol\mbreak
   fa4 fa fa8 fa
   sib,4 sib8 sib sib sib

   %41
   mib4 mib8 mib mib mib
   fa2.
   sib,4 sib' sib\mbreak

   %44
   la8[sol la sib do la]
   sol2.
   fa8[mib fa sol la fa]

   %47
   sib,2.
   mib8[re mib fa sol mib]\mbreak
   sol sol sol4 sol,

   %50
   do r r
   R2.*13
   r4 sib' sib

   %65
   la8[sol] la sib do la
   sol[fa sol la sib sol]
   fa[mib fa sol la fa]\mbreak

   %68
   sib,4 sib sib
   mib8[re mib fa] sol[mib]
   fa[(mib] fa4) fa,

   %71
   sib r r
   sib sib2
   mib8[re mib fa] sol[mib]

   %74
   fa[(mib] fa4) fa,
   sib2.\fermata

}

XVtestoIV = \lyricmode {
   
    Il des -- tino, _  la sor -- te_e_il fa - to
   pren -- da leg -- gi dal tuo cor,
   il des -- ti -- no,  la sor -- te_e_il fa -- to
   pren -- da leg -- gi dal tuo cor,
   il des -- tino, _  la sor -- te_e_il fa - to pren -- da leg -- gi
   dal tuo cor,
   il des -- tino, _  la sor -- te_e_il fato _ 
   la sor -- te_e_il fato _   il des -- tino, _  la sor -- te_e_il fato _ 
   la sor -- te_e_il fa -- to  pren -- da leg - - - - - gi   dal tuo cor.
   
   Il des -- tino, _  la sor -- te_e_il fa - to
   pren -- da leg -- gi dal tuo cor,
   pren -- da leg -- gi dal tuo cor.

}

XVbcn = \relative do {

   sib4 sib' sib
   la la la
   sol sol sol

   %4
   fa fa fa
   sib, sib sib
   mib mib mib\mbreak

   %7
   fa fa fa
   sib, sib' sib
   la la la

   %10
   sol sol sol
   fa fa fa
   sib, sib sib\mbreak

   %13
   mib mib mib
   fa fa fa
   sib, sib' sib

   %16
   la  la la
   sol sol sol
   fa fa fa\mbreak

   %19
   sib, sib sib
   mib mib mib
   fa fa fa,

   %22
   sib sib' sib
   la la la
   sol sol sol

   %25
   fa fa fa
   sib, sib sib
   mib mib mib\mbreak

   %28
   fa fa fa
   sib, sib' sib
   la la la

   %31
   sol sol sol
   fa fa fa
   sib, sib sib\mbreak

   %34
   mib mib mib
   fa fa fa,
   sib sib' sib

   %37
   la la la
   sol sol sol
   fa fa fa

   %40
   sib, sib sib
   mib mib mib\mbreak
   fa fa fa,

   %43
   sib sib' sib
   la la la
   sol sol sol

   %46
   fa fa fa
   sib, sib sib\mbreak
   mib mib mib

   %49
   sol sol sol,
   do4 r r
   R2.*13

   %64
   r4 sib'_\tu sib
   la la la
   sol sol sol

   %67
   fa fa fa
   sib, sib sib
   mib mib mib

   %70
   fa fa fa,
   sib4 r r
   sib sib sib

   %73
   mib mib mib
   fa fa fa,
   sib2.\fermata

}

XVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s2.
   <6>
   <7>4 <6>2
   <7>4 <6>2
   s2.*5
   <7>4 <6>2
   <7>4 <6>2
   s2.*5
   <7>2 <6>4
   <7>2.
   s2.*9
   <7>2.
   s2.*16
   <7>4 <6>2
   <7>2.
   s2.*19
   <7>2 <6>4
   <7>2.
  
}


forma = {

   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \key sib\major
   \tempo 2. = 50
   s2.*75
   \bar "|."

}

XVvlI = {
   <<\XVvlIn \forma>>

}

XVvlII = {
   <<\XVvlIIn \forma>>

}

XVvla = {
   \clef alto
   <<\XVvlan \forma>>

}

XVsoprano = {
   \new Voice = "destino1"
   <<\XVsopranon \forma>>
}

XValto = {
   \new Voice = "destino2"
   <<\XValton \forma>>
}

XVtenore = {
   \new Voice = "destino3"
   <<\XVtenoren \forma>>
}

XVbasso = {
   \clef bass
   \new Voice = "destino4"
   <<\XVbasson \forma>>
}

XVbc = {
   \clef bass
   <<\XVbcn \forma \XVbfn>>
}


global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

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
        title = \markup\smaller\center-column {"La Sen[n]a festeggiante - Ouvertur[e] "}
        composer = \markup \center-column{"A. Vivaldi (1678 - 1741)"}
    }

    \markup \huge {[1.] Adagio - Presto - Adagio}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup "[Violino I]"
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Violino II]"
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>


            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \pageBreak

    \markup \huge {[2.] Allegro molto}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup "[Violino I]"
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Violino II]"
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>


            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \header {
        title = \markup\smaller\center-column {"La Sen[n]a festeggiante - Parte Seconda "}
        composer = \markup \center-column{"A. Vivaldi (1678 - 1741)"}
    }

    \markup \huge {[1.] [Recitativo] - Ma già ch'unito in schiera}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup "[Violino I]"
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Violino II]"
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[La Senna]"}
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \IIIbasso \global
                \new Lyrics \lyricsto "schiera" \IIItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #0
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[2.] Largo - Pietà dolcezza, fanno il suo volto}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup "[Violino I]"
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Violino II]"
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[La Senna]"}
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \IVbasso \global
                \new Lyrics \lyricsto "dolcezza" \IVtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #0
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] [Recitativo] - Non si ritardi}

    \score {
        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 r8^\markup\center-align "Età [dell'Oro]  " la'8}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \Vsoprano \global
                \new Lyrics \lyricsto "ritardi" \VtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major  r8^\markup\center-align "Virtù  " mi'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Valto \global
                \new Lyrics \lyricsto "passo" \VtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[4.] All[egr]o non molto - Stelle, con vostra pace}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.4"Unisoni"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\minor \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digit r1^\markup\center-align "[Virtù]  " sol'2}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \VIalto \global
                \new Lyrics \lyricsto "stelle" \VItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[5.] [Recitativo] Vedrete in quest'eroe}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\minor \time 4/4 do''8^\markup\center-align "Età  " do''16 do''}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \VIIsoprano \global
                \new Lyrics \lyricsto "senza" \VIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\minor \time 4/4  sol'8^\markup\center-align "Virtù  " sol'16 sol'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \VIIalto \global
                \new Lyrics \lyricsto "quindi" \VIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "Sen[n]a"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \VIIbasso\global
                \new Lyrics \lyricsto "eroe" \VIItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #1
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[6.] [Aria] All[egr]o - Io qui provo sì caro diletto}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VIIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIIIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \time 3/8\numericTimeSignature \override Staff.TimeSignature.style = #'single-digit r1^\markup\center-align "Età [dell'Oro]  " re''8}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \VIIIsoprano \global
                \new Lyrics \lyricsto "diletto" \VIIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\major \time 3/8\numericTimeSignature \override Staff.TimeSignature.style = #'single-digit r1^\markup\center-align "Virtù  " si'8}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \VIIIalto \global
                \new Lyrics \lyricsto "seno" \VIIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #1
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[7.] [Recitativo] - Quanto felici siete}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IXvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IXvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IXvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\minor \time 4/4 mi''4^\markup\center-align "Età [dell'Oro]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IXsoprano \global
                \new Lyrics \lyricsto "felici" \IXtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IXbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #1
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[8.] All[egr]o ma poco - Giace languente}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.2"Unisoni"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violette sempre"\vspace #-0.4"con il Basso"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Xvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\minor \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r2^\markup\center-align "Età [dell'Oro]" do''4}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \Xsoprano \global
                \new Lyrics \lyricsto "giace" \XtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Xbc\global
            >>
        >>

         \layout {

         #(layout-set-staff-size 17)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

      systems-per-page = #6

   }

   \markup \huge \column{"[9.] [Recitativo] Quanto felici siete"}

   \score {
      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      }  <<

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 sol'8^\markup\center-align "[Virtù]" }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \XIalto \global
                \new Lyrics \lyricsto "quanto" \XItestoII
            >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 20)
         indent = 2\cm

         \context {
            \Staff
            \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
         }

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[10.] All[egr]o - Così sol nell'aurora}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"\vspace #-0.2"con Sordini"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"\vspace #-0.2"con Sordini"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \XIIvla\global
            >>

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key mi\major \time 2/4 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r4^\markup\center-align "[Virtù]" r8 si'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \XIIalto \global
                \new Lyrics \lyricsto "aurora" \XIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"\vspace #-0.2"senza Cembali"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \XIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #1
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

   \markup \huge \column{"[11.] [Recitativo] Ma giunti eccone innante"}

   \score {
      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 do''16^\markup\center-align "Età [dell'Oro]" do''}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \XIIIsoprano \global
                \new Lyrics \lyricsto "vista" \XIIItestoI
            >>

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 fad'4^\markup\center-align "Virtù   " }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \XIIIalto \global
                \new Lyrics \lyricsto "come" \XIIItestoII
            >>

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Sen[n]a"}
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \XIIIbasso \global
                \new Lyrics \lyricsto "giunti" \XIIItestoIII
            >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XIIIbc\global
         >>
      >>

         \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[12.] Allegro - Non fu mai più vista}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XIVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XIVvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \XIVvla\global
            >>

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 3/4 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'8.^\markup\center-align "[Età dell'Oro]" [do''16]}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \XIVsoprano \global
                \new Lyrics \lyricsto "soglio" \XIVtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \XIVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #1
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #2

    }

    \markup \huge {[13.] Allegro - Il Destino, la Sorte e il Fato}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XVvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \XVvla\global
            >>

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 3/4 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'4^\markup\center-align "[Età dell'Oro]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \XVsoprano \global
                \new Lyrics \lyricsto "destino1" \XVtestoI
            >>

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sib\major \time 3/4 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'2^\markup\center-align "[Virtù]" }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \XValto\global
                \new Lyrics \lyricsto "destino2" \XVtestoII
            >>

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key sib\major \time 3/4 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'4^\markup\center-align "[Tenore]" }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \XVtenore \global
                \new Lyrics \lyricsto "destino3" \XVtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Sen[n]a]"}
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \XVbasso\global
                \new Lyrics \lyricsto "destino4" \XVtestoIV
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \XVbc\global
            >>
        >>

       \layout {

            #(layout-set-staff-size 19)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #4
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #5
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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