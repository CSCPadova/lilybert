\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "tutti"

pad = \once \override TextScript.padding = #3.5

padall = \override TextScript.padding = #1.6

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
mbreak = { }


Iglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletNumber.transparent = ##f
  \override TupletBracket.bracket-visibility = ##f
  \terzine \con
}


IobIn = \relative do'' {

  R1*2
  r16 fa mib16. (re32) mib16.(do32) re16.(mib32) re16.(fa32) mib16.(re32) mib16.(do32) re16.(mib32)
  re16.(do32) do16.(sib32) sib16.(la32) la16.(sol32)\mbreak sol8 do r mi16. sol32

  %5
  fa,8. sol16 sol8.\tr la16 la16.(sib32) sib16.(do32) do16.(sol32) sol16.(la32)
  la16.(sol'32) sol16.(fa32) fa16.(mi32) mi16.(fa32) fa4 r
  re8 mib!\tr fa16. re32 mib16. fa32\mbreak sib,8 [\appoggiatura {do16[re]} mib16. re32] do4~

  %8
  do16. la32 re16. do32 si8. si16 do8 lab'16.(sol32) fa16.(mib32) re16.(do32)
  si16.(do32) do16.(re32) re16.(si32) si16.(do32) do16.(re32) re16.(mib32) mib16.(do32) do16.(re32)\mbreak
  re16.(mib32) mib16.(fa32) fa16.(re32) re16.(mib32) mib4~mib16. do32 re16. mib32

  %11
  re4~re16. sib32 do16. re32 do4~do16. la32 si16. do32
  si16.[do32 do16.\tr(si64 do)] re4~\mbreak re16. sol,32 do16. re32 mib16.(re32) do16. (sib?32)
  la4\fermata r8 fad' sol8. la,16 la8. sol16

  %14 OK
  sol16. (la32) sib16.(do32) re16 mib32 re do16. re32 mib16.(re32) mib16.(re32) do16 re32 do sib16. do32\mbreak
  re16 sib32 do re16. mib32 fa16 sol32 fa mib16. fa32 sol16.(fa32) sol16.(mib32) fa16 sol32 fa mib16. fa32
  sol16.(fa32) sol16.(mib32) fa16 sol32 fa mib16. fa32 sol16.(fa32) mib8~mib4~

  %17
  mib~mib8 re16. do32 re16.(mib32) mib16.(re32) re16.(do32) do16.(sib32)
  sib16.(sol'32) sol16.(fa32) fa16.(mib32) mib16.(re32) re4. sib8
  sib'8. lab16 fa8. mib16 mib16.(reb32) reb16.(do32) do16.(lab32) lab16.(sib32)\mbreak

  %20
  sib16.(reb32) reb16.(do32) do16.(lab32) lab16.(sib32) sib8 sol' fa[\grace mib re?]
  mib re mib4~mib16 do fa8 re8. mib16
  mib1

}


IobIIn = \relative do'' {

  R1*2
  r16 re do16.(sib32) do16.(la32) sib16.(do32) sib16.(re32) do16.(sib32) do16.(la32) sib16.(do32)
  sib8 mib, fa[re']~\mbreak re do16.(re32) mi16.(fa32) sol16.(mi32)

  %5
  fa8. re16 mi8. (fa16) fa16.(sol32) sol16.(la32) la16.(mi32) mi16.(fa32)
  fa16.(re32) re16.(do32) do16.(sib32) sib16.(la32)\mbreak la8 sib\tr do16. la32 sib16. do32
  sib16. re32 lab'8~lab16. lab32 sol16. fa32 sol4~sol16. sol32 fa16. mib32

  %8
  fa4~fa16. fa32 mib16. re32 mib16.(re32) do16.(sib32) lab16.(sol32) fa16.(mib32)\mbreak
  re16.(mib32) mib16.(fa32) fa16.(re32) re16.(mib32) mib16.(fa32) fa16.(sol32) sol16.(la32) la16. (si32)
  si?16.(do32) do16.(re32) re16.(si!32) si16.(do32) do8 sol do4~

  %11
  do8 fa, sib4~\mbreak sib8 mib, la4~
  la8 sol16. fad32 sol4~sol8 mib'16.(re32) do16.(sib32) la16.(sol32)
  fad'4\fermata r8 re sol,8. sol16 fad8. sol16

  %14
  sol16.(fad32) sol16.(la32) si16 do32 si la16. si32\mbreak do16.(si32) do16.(sib32) la16 sib32 la sol16. la32
  sib1~
  sib2~sib8 sol'16.(fa32) mib16.(re32) do16.(sib32)

  %17
  la16.(sib32) sib16.\tr (la64 sib) do16. la32 sib16. do32\mbreak sib2~
  sib~sib8 sib re[fa]
  sib,8. fa'16 re16.(do32) sib16.(lab32) sol16.(sib32) sib16.(lab32)lab16.(fa32) fa16.(sol32)

  %20
  sol16.(mib32) mib16.(lab32) lab16.(fa32) fa16.(sol32)\mbreak sol4 r
  r r8 sib do lab fa8. mib16
  mib1

}


Ifgn = \relative do' {

  r8 re16. do32 sib16.(la32) sib16.(la32) sib8 re16.(do32) sib16.(la32) sib16.(la32)
  sol8 sol'16.(fa32) mib16.(re32) do16.(sib32)\mbreak la16. sib32 sib16\tr la32 sib do16. do32 re16. mib32
  re16. sib32 fa'8~fa4~fa2~

  %4
  fa~fa8 mi16. re32 do16.(re32) sib16.(do32)
  la8 [\appoggiatura {sib16[do]} re16. sib32] sol8.\tr fa16\mbreak fa2~
  fa16. sib32 sib16.(la32) la16.(sol32) sol16.(fa32) fa16.(la32) mib'!8~mib16. mib32 re16. do32

  %7
  re8 sib r4 r2
  R1
  sol'1~\mbreak

  %10
  sol2~sol16. mib32 re16. mib32 fa4~
  fa16. re32 do16. re32 mib4~mib16. do32 si16. do32 re4~
  re8 do sol'16.(fa32) mib16.(re32) mib16.(re32) do8~do mib\mbreak

  %13
  re4\fermata r8 la re8. mib16 re,8. sib'16
  sol4 r r2
  r8 sib16. do32 re16 mib32 re do16. re32 mib16.(re32) mib16.(do32) re16 mib32 re do16. re32\mbreak

  %16
  mib16.(re32) mib16.(do32) re16 mib32 re do16. re32 mib8. re16 do16.(sib32) la16.(sol32)
  fa4 fa'~fa16. sol32 sol16.(fa32) fa16.(mib32) mib16.(re32)
  re16.(mib32) mib16.(re32) re16.(do32) do16.(sib32)\mbreak sib8 re fa mib16. re32

  %19
  mib8. do16 re8. mib16 mib2~
  mib~mib8 mib re[\grace do sib]
  \grace lab sol fa sol4 fa16(lab) do8 \clef bass sib,8. sol'16

  %22
  mib1

}


Ibcn = \relative do {

  sib8 sib' r la sol sol, r re'
  mib mib, r mib' fa sol la fa
  sib fa r fa,\mbreak sib fa' r fa

  %4
  sib, do re[sib] do4 r8 do
  re sib do[do,] fa2~
  fa fa8 sol la fa

  %7
  sib do re sib\mbreak mib sol, lab[lab']
  re, fa, sol[sol'] do, fa, r fa'
  sol sol, r sol' sol sol, r sol'

  %10
  sol sol, r sol' do, do' la[fa]\mbreak
  sib, sib' sol mib lab, lab' fad[re]
  sol, la si[sol] do do do do~

  %13
  do4 r8 do sib do re re,
  sol sol' r sol\mbreak do, mib fa[fa,]
  sib4 r8 sib' mib,4 sib'8 sib,

  %16
  mib4 sib'8 sib, mib4 r
  fa,8 sol la fa sib4 r
  r2 lab'4 r8 lab\mbreak

  %19
  sol8 lab sib[sib,] mib4 r
  mib, r mib' sib'8 sib,
  do4 r8 sol lab fa sib4

  %22
  mib,1

}

Ibfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key sib\major
  \time 4/4
  \tempo 4 = 48
  s1*22
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


Ifg = {
  \Iglobal
  \clef tenor
  <<\Ifgn \forma>>
}



Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletNumber.transparent = ##f
  \override TupletBracket.bracket-visibility = ##f
  \terzine \con
}


IIobIn = \relative do'' {

  re16(mib fa8) fa4~
  fa8[sol fa  mib]
  re16\p(mib fa8) fa4~

  %4
  fa8[sol fa mib]
  re16\f fa sib la sib mib, re do
  re8[mib re do]

  %7
  sib16 do re do re do sib la\mbreak
  sib2~
  sib16 sib' sol fa mib sol mib re

  %10
  do sib do re mib re mib do
  re do re mib fa mib fa re
  sol fa sol fa mib re mib re

  %13
  do8 fa, r4\mbreak
  r8 sib [sib' fa]
  sol2~

  %16
  sol8 do, la' mib
  fa4. mib16 fa
  sol4. fa16 sol

  %19
  la4. sol16 la
  sib4. la16 sib
  do4 do,~\mbreak

  %22
  do8 sib16 do re mi fa sol
  mi8 sol4 mi8
  fa8. re16 mi8. fa16

  %25
  fa la fa la do, fa la, do
  fa, sol la sib do re mib! do\mbreak
  re fa re fa mib sol mib sol

  %28
  do, mib do mib re fa re fa
  sib, re sib re do mib do mib
  re(sib) do8~do16 re mib8~

  %31
  mib16 (do) re8~re16(mib) fa8~
  fa16 (re) mib8~mib16 do re mib
  re(sib) do8 r4

  %34
  fa16(sol la8) sol16(la sib8)
  la[sib la sol]
  fa16\p(sol la8) sol16(la sib8)

  %37
  la[sib la sol]\mbreak
  fa16 do\f re mi fa mi fa mi
  fa do\p re mi fa mi fa mi

  %40
  fa mi\f fa sol la sol la sol
  la sib do sib do sib la sib\mbreak
  sol fa mi fa sol la sib sol

  %43
  la fa sol la sol sib la sol
  la fa sol la sol sib la sol
  la do la sol fa la fa mib!\mbreak

  %46
  re fa re do sib re sib la
  sol8 do r16 do re mi
  fa sol fa sol la sol fa sol

  %49
  mi8 do16 re mi8 fa
  sol[fa mi re]\mbreak
  do do16\p re mi8 fa

  %52
  sol[fa mi re]
  do16\f re mi fa sol la sib sol
  la2~

  %55
  la8[la sol la]
  sib2~
  sib8[sib la sib]\mbreak

  %58
  do do, do4\tr
  sib'8 do, do4\tr
  la'8[do, do la']

  %61
  sol16 mi fa sol la sol la fa
  sol mi\p fa sol la sol la fa\mbreak
  sol do,\f re mi fa sol la sib

  %64
  do8 re, mi4\tr
  fa16 do re mi fa mi fa mi
  fa do\p re mi fa mi fa mi

  %67
  fa mib!\f re do re sib do re\mbreak
  do mib\p re do re sib do re
  do8 fa, r4

  %70
  R2
  re'16\f(mib fa8) fa4~
  fa8[sol fa mib]

  %73
  re16\p(mib fa8) fa4~
  fa8[sol fa mib]\mbreak
  re16\f fa sib la sib mib, re do

  %76
  re8[mib re do]
  sib16 do re do re do sib la
  sib2~

  %79
  sib16 sib' sol fa mib sol mib re
  do sib do re mib re mib do\mbreak
  re do re mib fa mib fa re

  %82
  sol fa sol fa mib re mib re
  do8 fa, fa' la,
  fa'16(re) fa8 r re

  %85
  mib [do mib sol]
  mib16(do) mib8 r do
  re[sib re fa]\mbreak

  %88
  fa16(mib32 re) fa16 fa fa fa fa fa
  sib,(do32 re) sib16 sib sib sib sib sib
  fa'16\p(mib32 re) fa16 fa fa fa fa fa

  %91
  sib,(do32 re) sib16 sib sib sib sib sib\mbreak
  sol\f sib sol' fa mib re do sib
  la sib do re mib re mib do

  %94
  re mib fa mib fa mib fa re
  mib(fa) sol8~sol16(fa) mib8~
  mib16(re) do8~do16 re mib do\mbreak

  %97
  re(mib) fa8~fa16(mib) re8~
  re16(do) sib8~sib16 do re sib
  do(re) mib8~mib16(re) do8~

  %100
  do16(sib) la8~la16 sib do la
  re sib do re do mib re do\mbreak
  re sib\p do re do mib re do

  %103
  re fa\f mib re mib sol fa mib
  fa sib la sol fa mib re do
  sib8. sol16 la4

  %106
  sib16(la) sib8~sib16(la) sib8~\mbreak
  sib16(la) do8~do16(sib) do8~
  do16(sib) reb8~reb16(do) reb8~

  %109
  reb16(do) mib(reb) do reb mib8
  mib4 r8 mib
  re!8. mib16 do4

  %112
  sib2\fermata

}


IIobIIn = \relative do'' {

  sib16(do re8) do16(re mib8)
  re[mib re do]
  sib16\p(do re8) do16(re mib8)

  %4
  re[mib re do]
  sib16\f do re do re do sib la\mbreak
  sib8[sol' fa mib]

  %7
  re16 fa sib la sib mib, re do
  re fa re do sib re sib la
  sol4~sol16 sol do sib

  %10
  la sol la sib do sib do la
  sib la sib do re do re sib\mbreak
  mib re mib re do sib do sib

  %13
  la8 fa fa' la,
  sib sol re'4~
  re8 sol, mib' sol,

  %16
  do fa, do'4~
  do8 fa, re' re
  re16(sib) sol8 mib' mib

  %19
  mib16(do) la8 fa' fa\mbreak
  fa16(re) sib8 sol' sol
  sol fa16 mi fa mib re do

  %22
  re2~
  re8 do16 si do sib la sol
  la8. sib16 sol4

  %25
  fa r8 fa'\mbreak
  fa,16 mi fa sol la sib do la
  sib re sib re sol, sib sol sib

  %28
  la do la do fa, la fa la
  sol sib sol sib la do la do
  sib(sol) la8~la16 (sib) do8~

  %31
  do16(la) sib8~sib16(do) re8~
  re16(sib) do8~do16 la sib do
  sib(sol) la8 r4

  %34
  la16(sib do8) do4~
  do8[re do sib]
  la16\p(sib do8) do4~\mbreak

  %37
  do8[re do sib] %%%%inizio seconda pagina
  la16 sib\f la sol fa sol la sol
  la sib\p la sol fa sol la sol

  %40
  la do\f re mi fa mi fa mi
  fa sol la sol\mbreak la sol fa sol
  mi re do re mi fa sol mi

  %43
  fa re mi fa mi sol fa mi
  fa re mi fa mi sol fa mi
  fa2~

  %46
  fa~\mbreak
  fa8 mi16 re do sib la sol
  la sib la sib do sib la sib

  %49
  sol8 mi16 fa sol8 la
  sib[la sol fa]
  mi mi16\p fa sol8 la

  %52
  sib[la sol fa]\mbreak
  mi do'16\f re mi fa sol mi
  fa8 fa16 sol fa8 do

  %55
  re2~
  re8[re do re]
  mi4. re8

  %58
  do16 re mi fa sol la sol la
  sib, do re mi fa sol fa sol\mbreak
  la, sol la sib do sib do re

  %61
  mi do re mi fa mi fa re
  mi do\p re mi fa mi fa re
  mi8 do r16 fa\f mi re

  %64
  do re sib la sol4\tr \mbreak
  fa16 sib la sol fa sol la sol
  la sib\p la sol fa sol la sol

  %67
  la do\f sib la sib sol la sib
  la do\p sib la sib sol la sib
  la8 fa r4

  %70
  R2\mbreak
  sib16(do re8) do16(re mib8)
  re[mib re do]

  %73
  sib16\p(do re8) do16(re mib8)
  re[mib re do]
  sib16\f do re do re do sib la

  %76
  sib8[sol' fa mib]
  re16 fa sib la sib mib, re do\mbreak
  re fa re do sib re sib la

  %79
  sol4~sol16 sol do sib
  la sol la sib do sib do la
  sib la sib do re do re sib

  %82
  mib re mib re do sib do sib
  la8 fa16 sol la sib do la\mbreak
  si8 la16 si sol8 si

  %85
  do sol'16 fa mib re do sib
  la8 sol16 la fa8 la
  sib fa'16 mib re do sib la

  %88
  sol8 sol16 fa sol8 la
  sib fa'4 fa,8\p\mbreak
  sol sol16 fa sol8 la

  %91
  sib fa'4 fa,8\f
  sol8 do16 re mib8 sol~
  sol la,16 sib do sib do la

  %94
  sib do re do re do re sib
  do(re) mib8~\once\slurDashed mib16 (re) do8~\mbreak
  do16(sib) la8~la16 sib do la

  %97
  sib(do) re8~re16(do) sib8~
  sib16(la) sol8~sol16 la sib sol
  la(sib) do8~do16(sib) la8~

  %100
  la16(sol) fa8~fa16 sol la fa\mbreak
  sib sol la sib la do sib la
  sib sol\p la sib la do sib la

  %103
  sib re\f do sib do mib re do
  re sib do re mib fa sol la
  sib8. mib,16 do4\tr\mbreak

  %106
  \slurDashed sib16 (do) reb8~reb16 (do) reb8~ \slurSolid
  reb16(do) mib8~mib16 (reb) mib8~
  mib16(reb) fa8~fa16(mib) fa8~

  %109
  fa16 mib solb(fa) mib(reb) do(sib')
  la!(sol) fa(mib)\mbreak re!(do) sib(la)
  sib8. sol16 la4

  %112
  sib2\fermopz

}


IIfgn = \relative do {

  sib8 sib' la fa
  sib sib, r4
  sib8\p sib' la fa

  %4
  sib sib, r4
  sib'8\f sib, r fa'
  sib sib, r4

  %7
  sib'8 sib, r fa'\mbreak
  sib [la sol fa]
  mib[re do mib]

  %10
  fa[fa fa, fa']
  sib,[sib sib' sib,]
  mib[mib mib' mib,]

  %13
  fa16\clef tenor \key sib\major fa' mib fa re mib do re
  sib re do re sib do la sib\mbreak
  sol mib' re mib do re sib do

  %16
  la do sib do la sib sol la
  fa re' do re sib do la sib
  sol mib' re mib do re sib do

  %19
  la fa' mib fa re mib do re\mbreak
  sib sol' fa sol  mib fa re mib
  do re sib do \clef bass \key sib\major la do fa, la

  %22
  sib,\clef tenor \key sib\major fa'' re fa sib, re sol, sib
  \clef bass \key sib\major do,8 do' r do,\mbreak
  fa sib do do,

  %25
  fa2~
  fa~
  fa~

  %28
  fa~
  fa~
  fa~

  %31
  fa~
  fa~
  fa8 mi16 re do sib la sol\mbreak

  %34
  fa8 fa' mi do
  fa fa, r4
  fa8\p fa' mi do

  %37
  fa fa, r4
  fa'8\f fa, r do'
  fa fa, r do'\p

  %40
  fa fa, r do'\f\mbreak
  fa, fa' la, sib
  do[do' do do,]

  %43
  fa do' r do,
  fa do' r do,
  fa mi re do

  %46
  sib la sol sib\mbreak
  do do' r do,
  fa, fa' fa, la

  %49
  do[do' do, do']
  do,[do' do, do']
  do,[do'\p do, do']

  %52
  do,[do' do, do']
  do, do'\f\mbreak do,\clef tenor \key sib\major do'
  fa,16 sol la sib do re mi fa

  %55
  sib, re fa re sib re fa re
  sol, la sib do re mi fa sol
  do, mi sol mi do mi sol mi\mbreak

  %58
  la, sib do re mi fa mi fa
  sol, la sib do re mi re mi
  fa, mi fa sol la sol la sib

  %61
  do2~
  do~
  do4.\clef bass \key sib\major sib8\mbreak

  %64
  la sib do do,
  fa2~
  fa~

  %67
  fa~
  fa~
  fa16 fa' mib! re do sib la sol

  %70
  fa sib la sol fa mib re do\mbreak
  sib8 sib' la fa
  sib sib, r4

  %73
  sib8\p sib' la fa
  sib sib, r4
  sib'8\f sib, r fa'

  %76
  sib sib, r4
  sib'8 sib, r fa'
  sib[la sol fa]\mbreak

  %79
  mib[re do mib]
  fa[fa fa, fa']
  sib, sib sib' sib,

  %82
  mib mib mib' mib,
  fa16\clef tenor \key sib\major fa' fa fa fa fa fa fa\mbreak
  re(mib32 fa) do16 fa si, fa' sol, fa'

  %85
  \once\stemUp do, mib' mib mib mib mib mib mib
  do(re32 mib) sib16 mib la, mib' fa, mib'
  sib, re' re re re re re re\mbreak

  %88
  re(mib32 fa) re16 re re re re re
  re(mib32 fa) re16 re re re re re
  re\p(mib32 fa) re16 re re re re re

  %91
  re(mib32 fa) re16 re re re re re\mbreak
  re\f(mib32 fa) mib16 re do sib la sol
  fa8 fa'~fa4~

  %94
  fa2~
  fa~
  fa~

  %97
  fa~
  fa~
  fa~\mbreak

  %100
  fa4.\clef bass \key sib\major fa,8
  fa, fa' r fa\p
  fa, fa' r fa\f

  %103
  sib,[sib' sib, sib']
  sib, sib' r fa\mbreak
  sol[mib fa fa,]

  %106
  sib r sib' r
  fa r fa, r
  sib r sib' r

  %109
  mib, r mib, r\mbreak
  fa4 r8 fa'
  sol mib fa4

  %112
  sib,2\fermata

}


IIbcn = \relative do {

  sib8 sib' la fa
  sib sib, r4
  sib8\p sib' la fa

  %4
  sib sib, r4
  sib'8\f sib, r fa'
  sib sib, r4

  %7
  sib'8 sib, r fa'\mbreak
  sib [la sol fa]
  mib[re do mib]

  %10
  fa[fa fa, fa']
  sib,[sib sib' sib,]
  mib[mib mib' mib,]

  %13
  fa4 r8 fa\mbreak
  sol4 r8 re
  mib4 r8 mib

  %16
  fa4 r8 do
  re4 r8 re
  mib4 r8 mib

  %19
  fa4 r8 fa
  sol4 r8 sol
  la4 r8 fa\mbreak

  %22
  sib4 r8 sol
  do4 mi,8 do
  fa sib, do do,

  %25
  fa2~
  fa~
  fa~

  %28
  fa~
  fa~
  fa~

  %31
  fa~
  fa~
  fa16 fa' mi re do sib la sol

  %34
  fa8 fa' mi do
  fa fa, r4
  fa8\p fa' mi do

  %37
  fa fa, r4
  fa'8\f fa, r do'
  fa fa, r do'\p

  %40
  fa fa, r do'\f\mbreak
  fa, fa' la, sib
  do[do' do do,]

  %43
  fa do' r do,
  fa do' r do,
  fa mi re do

  %46
  sib la sol sib\mbreak
  do do' r do,
  fa, fa' fa, la

  %49
  do[do' do, do']
  do,[do' do, do']
  do,[do'\p do, do']

  %52
  do,[do' do, do']
  do, [do'\f do, do']
  fa, fa, r fa'

  %55
  sib, sib' r sib\mbreak
  sol sol, r sol'
  do, do' r sib

  %58
  la la, r la'
  sol sol, r sol'
  fa fa, r fa'

  %61
  do4 r\mbreak
  do' r
  do, r8 sib

  %64
  la sib do do,
  fa4 r
  fa' r

  %67
  fa, r
  fa' r
  fa, r

  %70
  R2\mbreak
  sib8 sib' la fa
  sib sib, r4

  %73
  sib8\p sib' la fa
  sib sib, r4

  %75
  sib'8\f sib, r fa'
  sib sib, r4\mbreak
  sib'8 sib, r fa'

  %78
  sib8[la sol fa]
  mib[re do mib]
  fa[fa fa, fa']

  %81
  sib,[sib sib' sib,]
  mib[mib mib' mib,]\mbreak
  fa fa, r fa'

  %84
  sol sol, r sol'
  do, do, r do'
  fa fa, r fa'

  %87
  sib sib, r re
  mib mib, r fa'\mbreak
  sol sol, r re'\p

  %90
  mib mib, r fa'
  sol sol, r re'\f
  mib[mib, mib mib']

  %93
  fa2~
  fa~
  fa~\mbreak

  %96
  fa~
  fa~
  fa~

  %99
  fa~
  fa4. fa8
  fa, fa' r fa\p

  %102
  fa, fa' r fa\f
  sib,[sib' sib, sib']\mbreak
  sib, sib' r fa

  %105
  sol mib fa fa,
  sib r sib' r
  fa r fa, r

  %108
  sib r sib' r
  mib, r mib, r\mbreak
  fa4 r8 fa'

  %111
  sol mib fa4
  sib,2\fermata

}

IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key sib\major
  \time 2/4
  \tempo 2 = 50
  s2*112
  \bar"|."

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


IIfg = {
  \IIglobal
  \clef bass
  <<\IIfgn \forma>>
}



IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletNumber.transparent = ##f
  \override TupletBracket.bracket-visibility = ##f
  \terzine \con
}


IIIobIn = \relative do'' {

  R2.*6
  fa8.(sol16 fa4) fa
  fa8(la,) sib[(do) re(mib)]

  %9
  fa4 mib8(re) do(sib)
  la(do) mib(re16 do) re8(do16 sib)\mbreak
  la8(do) mib(re16 do) sol'8(fa16 mib)

  %12
  re8 fad sol4.\tr la8
  fad re fad(sol16 la) sol8(la16 sib)
  la4 sib8 la sol fad

  %15
  sol2 mib4\mbreak
  la,8 do mib(re16 do) re8(do16 sib)
  la'2.~

  %18
  la8 re, sol[fa mib re]
  mib re16 mib fa8 mib re do
  re do16 sib fa'2~\mbreak

  %21
  fa8. re16 mib8. sol16 mib4~
  mib8 la, sib[do re mib]
  fa lab sol fa mib re

  %24
  mib2.~
  mib8 fad?16 mib re8 do sib[la]\mbreak
  sib8. do16 re8. mib16 do8. sib16

  %27
  la4 fad'4. fad8
  sol8. mib!16 fad4. sol8
  sol2.~

  %30
  sol~\mbreak
  sol8 sib la sol fad sol
  fad mi re do sib[la]

  %33
  sib8. do16 la4. sol8
  sol2.

}


IIIobIIn = \relative do'' {

  re8.(mib16 re4) re
  re8(fad,) sol[(la)] sib(do)
  re4 do8(sib) la[(sol)]

  %4
  fad la do(sib16 la) sib8(la16 sol)\mbreak
  fad8 la do(sib16 la) mib'8(re16 do)
  sib8(la16 sol) mib'4.\tr fa8

  %7
  re(mib16 fa) re8(do16 sib) la8(sib16 do)
  sib8 do16 (la) sib2~
  sib4 \appoggiatura {do32[re mib fa]} sol8(fa) mib[(re)]\mbreak

  %10
  do(la) fa2~
  fa do'4
  sib8 la sol4. mib'8

  %13
  la, fad la(sib16 do) sib8(la16 sol)
  fad8 re'4 do8 sib la
  sol sib mib[(re)] do(sib) %%% fine terza riga

  %16
  la4. fad8 sol[(la16 sib)]
  re,8 fad la(sol16 fad) do'8(sib16 la)
  sib8. la16 sol2~

  %19
  sol4 fa!4.  la8
  fa4. fa'8 re do
  sib la sol4 do~\mbreak

  %22
  do8 mib re do sib la
  sib8.(re16) sol,2~
  sol4 mib'8 re do sib

  %25
  la2 la4
  sol8. la16 sib8. do16 la8. sol16
  fad4 re'2~

  %28
  re8. mib16 la,4. sib8\mbreak
  sib sol la si do re
  mib re do re do sib

  %31
  la2.~
  la8 sol fad la sol fad
  sol8. mi16 fad4. sol8

  %34
  sol2.

}


IIIfgn = \relative do {

  R2.*12
  \clef tenor \key sib\major re'8.(mib16) re4 re
  re8(fad,) sol[(la)] sib(do)

  %15
  re4 do8(sib) la[(sol)]\mbreak
  fad la do(sib16 la) sib8(la16 sol)
  fad8 la do(sib16 la) mib'8(re16 do)

  %18
  sib8 do re2~
  re4 do2~
  do8 sib16 la sib8 re sib la\mbreak

  %21
  sol la16 sib do8 mib do sib
  la fa sol la sib do
  re2.~

  %24
  re8 mib16 re do8 sib la[sol]
  fad4 fad'4. fad8
  sol2 mib!4\mbreak

  %27
  re8 mib16 re do8 sib do la
  sib do la4. sol8
  sol fa' mib re do si

  %30
  do re mib fa mib re
  dod2 dod8(re16 mi)\mbreak
  re2 \clef bass\key sib\major re,4

  %33
  sol8 do, re4 re,
  sol2.

}


IIIbcn = \relative do {

  sol4 sol' la,
  sib r r
  sib' sib, do

  %4
  re fad, sol
  re' fad2
  sol4 do, fa!\mbreak

  %7
  sib, sib' do,
  re r r
  re' re, mib

  %10
  fa la sib
  fa la,2
  sib4 mib do

  %13
  re r re
  re' re, do\mbreak
  sib2 do4

  %16
  re2 re,4
  re'2 fad4
  sol8 la sib4 si

  %19
  do la fa
  sib! re,2
  mib mib4

  %22
  fa2 mib4\mbreak
  re si sol
  do2 do4

  %25
  re2 re4
  sol sib, do
  re2 re4

  %28
  sol8 do, re4 re,
  sol r r
  R2.\mbreak

  %31
  mi'2 mi4
  re2 re4
  sol8 do, re4 re,

  %34
  sol2.

}

IIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key sib\major
  \time 3/4
  \tempo 4 = 63
  s2.*34
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


IIIfg = {
  \IIIglobal
  \clef tenor
  <<\IIIfgn \forma>>
}



IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IVglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletNumber.transparent = ##f
  \override TupletBracket.bracket-visibility = ##f
  \terzine \con
}


IVobIn = \relative do'' {

  fa16 mib re8 fa re sol4
  fa16 mib re8 fa re sib'4
  fa16\p mib re8 fa re sol4

  %4
  fa16 mib re8 fa re sib'4\mbreak
  fa16\f mib re8 mib re mib re
  do16 sib la8 mib'4. do8

  %7
  re16 mib fa8 mib re do sib
  la16 sol fa8 mib'4.\p do8
  re16 mib fa8 mib re do sib\mbreak

  %10
  la sol fa2
  sib16\f re do re fa re do re sib re do re
  sib' re, do re fa re do re sib re do re

  %13
  fa, sib la sib re sib la sib fa' sib, la sib\mbreak
  sol'8 sib16 lab sol8 fa mib re
  do16 mi re mi sol mi re mi do mi re mi

  %16
  do' mi, re mi sol mi re mi do mi re mi
  sol, do si do mi do si do sol' do, si do\mbreak
  la'8 do16 sib la8 sol fa mib!

  %19
  re16 do sib8 sol' sol sol sol
  sol16 fa mi8 fa fa fa fa
  fa16 mib! re8 mib mib mib mib

  %22
  mib4. do8 mib16 re do8\mbreak
  re8 fa, sib[re] re fa
  mib4. do8 mib16 re do8

  %25
  re [fa,] sib re re fa
  do16(re mi fa sol8) sol sol sol
  do, sol' mi sol do, sol'\mbreak

  %28
  la,16(sib do re mib!8) mib mib mib
  fa, mib' do[mib] la, mib'
  re do sib do sib[la]

  %31
  sol fa' mi re do[sib]
  la sol16 la sib4 sol\mbreak
  fa8 la16 do fa2~

  %34
  fa8 la,16\p do fa2~
  fa8 la,16\f do fa8 sib la sol
  fa16(sol la sib do8) re, mi4\tr

  %37
  fa2. fa
  do16 sib la8 do la re4
  do16 sib la8 do la fa'4

  %40
  do16\p sib la8 do la re4
  do16 sib la8 do la fa'4
  re16\f do sib8 re sol fad sol

  %43
  do,16 sib la8 do la' sol la\mbreak
  sib la la sol sol fad
  fad? mi re do sib la

  %46
  sib re re sol sol fad
  fad?4. la8 sol fad!
  sol sib, sol' re fad16 mi re8

  %49
  sol sib, sol' re fad16 mi re8\mbreak
  sol re sib re sol4
  do,8 sol' mi do sol'4

  %52
  mi16 re mi8 mi16 re mi8 sol16 fa mi8
  fa4 fa,2
  fa'8 do lab do fa4

  %55
  sib,8 fa' re sib fa'4
  re16 do re8 re16 do re8 fa16 mib re8\mbreak
  mib4 sib8 sol' fa mib

  %58
  re fa fa4. mib16 re
  mib8 sol fa mib mib re
  re\p fa fa4. mib16 re

  %61
  mib8 sol fa mib mib re
  re\f fa fa16 mib re8 fa16 mib re8\mbreak
  mib8 sol sol16 fad mi8 sol16 fad mi8

  %64
  fad8 sol sol la la do
  sib sol la2
  sol8 fad? mib re do sib

  %67
  la [sol la sib] do sib16 la\mbreak
  sib8 la16 sib do4 la
  sol4. mib'8 re do

  %70
  sib4. mib8\p re do
  sib4. re8\f do sib
  la8 fad' sol mi fad4

  %73
  sol2.\mbreak
  re8 fa! fa16 mib re8 fa16 mib re8
  mib sol mib re mib re

  %76
  do mib mib16 re do8 mib16 re do8
  re fa re do re do
  sib sol' mib re mib re\mbreak

  %79
  do16 re mib8 re do re sib
  do16 re mib8 re do re sib
  la sib do2

  %82
  fa16 mib re8 fa re sol4
  fa16 mib re8 fa re sib'4
  fa16\p mib re8 fa re sol4\mbreak

  %85
  fa16 mib re8 fa re sib'4
  fa16\f mib re8 mib re mib re
  do16 sib la8 mib'4. do8\p

  %88
  re16 mib fa8 mib re do sib
  la16 sol fa8 mib'4. do8\f \mbreak
  re16 mib fa8 mib re do sib

  %91
  la sol fa2
  fa'16 re do re sib re do re fa re do re
  fa re do re sol, re' do re fa re do re

  %94
  fa re do re si re do re fa re do re\mbreak
  mib8 do16 re mib8 fa sol fa
  mib16 do sib do sol do sib do mib do sib do

  %97
  mib do sib do fa, do' sib do mib do sib do
  mib do sib do la do sib do mib do sib do
  re8 sib16 do re8 mib fa mib\mbreak

  %100
  re sib16 do re8 fa re8.\tr do32(re)
  mib8 do16 re mib8 sol mib8.\tr re32(mib)
  fa8 re16 mib fa8 sib fa8.\tr mib32(fa)

  %103
  sol8 mib16 fa sol8 do sol8.\tr fa32 (sol)\mbreak
  la8 sol fa sol16 la sib8 la16 sol
  la8 do16 sib la8 sol fa mib

  %106
  re do16 re mib4 do
  sib8 re16 fa sib2~
  sib8 re,16\p fa sib2~\mbreak

  %109
  sib8 re,16\f fa sib8 mib, re do
  sib16 do re mib fa8 sol, la4
  sib2. sib\fermopz

}


IVobIIn = \relative do'' {

  re16 do sib8 re sib mib4
  re16 do sib8 re8 sib re4
  re16\p do sib8 re sib mib4

  %4
  re16 do sib8 re8 sib re4
  re16\f do sib8 do [sib do sib]\mbreak
  la16(sol fa8) do'4. la8

  %7
  sib16 do re8 do sib la sol
  fa la do4.\p la8
  sib16 do re8 do sib la[sol]

  %10
  fa[sol] la\f sib do16 sib la8
  sib fa sib re fa re\mbreak
  sib fa sib re fa re

  %13
  sib fa sib re16 do sib8 fa'
  sib, sol16 lab sib8 lab sol la16 si
  do8 sol do mi sol mi

  %16
  do sol do mi sol mi
  do sol do mi16 re do8 sol'\mbreak
  do, la16 sib do8 sib la sol16 la

  %19
  sib8 fa re'[re] re16 do sib8
  do sol do[do] do16 sib la8
  sib fa sib[sib] sib16 la sol8

  %22
  la4. mib'8 do16 sib la8
  sib re fa,[sib] sib re\mbreak
  do4. mib8 do16 sib la8

  %25
  sib re fa,[sib] sib re
  sib16\tr(la sib8) sib16\tr(la sib8) sib16\tr(la sib8)
  sol' sib, sol' sib, sol' sib,

  %28
  la16\tr(sol la8) la16\tr(sol la8) la16\tr(sol la8)\mbreak
  do8 la fa' la, do la
  sib' la sol la sol fa

  %31
  mi re do sib la[sol]
  fa mi16 fa sol4 mi
  fa r8 re' do sib

  %34
  la4. re8\p do sib
  la4. fa'8\f mi re\mbreak
  do8 sib la re16 sib sol4

  %37
  fa2. fa
  la16 sol fa8 la fa sib4
  la16 sol fa8 la fa la4

  %40
  la16\p sol fa8 la fa sib4
  la16 sol fa8 la fa la4\mbreak
  sib16\f do re8 fa16 mib re8 do sib

  %43
  la16 sib do8 mib16 re do8 re4
  re2.~
  re~

  %46
  re2 do4~
  do8 mib re do sib[la]\mbreak
  sib16 sol fad sol re' sol, fad sol do la sol la

  %49
  sib sol fad sol re' sol, fad sol do la sol la
  sib2.~
  sib~

  %52
  sib4. sib8 sib16 do sib8\mbreak
  la8 fa la[do] do fa
  lab,2.~

  %55
  lab~
  lab?4. lab8 lab16 sib lab8
  sol mib sol16 fa sol8 la!16 sol la8

  %58
  si re re4. do16 si\mbreak %%fine seconda riga seconda p.
  do8 mib re do do si
  si?\p re re4. do16 si!

  %61
  do8 mib re[do] do si
  si?\f re re16 do si!8 re16 do si8
  do8 mib mi16 re dod8 mi16 re dod8\mbreak

  %64
  re mi mi fad fad la
  sol mi fad2
  sol,4. sib8 la sol

  %67
  fad [mi fad sol] la sol16 fad
  sol8 fad16 sol la4 fad\mbreak
  sol8 sib16 re sol2~

  %70
  sol8 sib,16\p re sol2~
  sol8 sib,16\f re sol8 sib la sol
  fad16(mi re do sib8) do la4

  %73
  sol2.\mbreak
  si8 re re16 do si8 re16 do si8
  do mib do sib! do sib

  %76
  la do do16 sib la8 do16 sib la8
  sib re sib[la sib la]
  sol mib' do[sib do sib]\mbreak

  %79
  la16 sib do8 sib[la sib sol]
  la16 sib do8 sib[la sib sol]
  fa sol la2

  %82
  re16 do sib8 re sib mib4
  re16 do sib8 re sib re4\mbreak
  re16\p do sib8 re sib mib4

  %85
  re16 do sib8 re sib re4
  re16\f do sib8 do sib do sib
  la16 sol fa8 do'4. la8\p

  %88
  sib16 do re8 do sib la[sol]\mbreak
  fa la do4. la8\f
  sib16 do re8 do sib la[sol]

  %91
  fa sol la do16 sib la8 sol
  fa fa' re fa la, fa'
  sol, fa' re fa do fa\mbreak

  %94
  si, fa' re fa sol,[si]
  do mib16 re do8 re mib re
  do sol do mib sol, mib'

  %97
  fa, mib' do mib sib mib
  la, mib' do mib fa,[la]\mbreak
  sib re16 do sib8 do re do

  %100
  sib16 fa re fa sib re do re sol, sib la sib
  do, mib' re mib do mib re mib la, do sib do
  re, fa' mib fa re fa mib fa sib, re do re\mbreak

  %103
  mib, sol' fa sol mib sol fa sol do, mib re mib
  do8 sib la sib16 do re8 do16 sib
  do8 la16 sib do8 sib la do

  %106
  sib la16 sib do4 la
  sib r8 sol' fa mib\mbreak
  re4. sol8\p fa mib

  %109
  re4. sib8\f la sol
  fa sib16 la sib8 mib do4
  sib2. sib\fermopz

}


IVfgn = \relative do {

  \clef bass sib'2.~
  sib~
  sib~\p

  %4
  \once\tieDashed sib~
  sib4\f mib, \clef tenor \key sib\major mib'
  fa2.~

  %7
  fa~
  fa~
  fa~

  %10
  fa4\clef bass \key sib\major fa,\f mib
  re re re
  re re re

  %13
  re re re
  mib mib, r
  mi' mi mi

  %16
  mi mi mi
  mi? mi mi
  fa fa, r

  %19
  sib'16 re do re sib re do re sib re do re
  la do sib do la do sib do la do sib do\mbreak
  sol sib la sib sol sib la sib sol sib la sib

  %22
  fa la sol la do la sol la fa' la, sol la
  fa sib la sib re sib la sib fa' sib, la sib
  fa\p la sol la do la sol la fa' la, sol la\mbreak

  %25
  fa sib la sib re sib la sib fa' sib, la sib
  mi,4\f mi mi
  mi mi mi

  %28
  fa fa fa
  fa, fa fa
  sib sib sib

  %31
  do do do\mbreak
  re  sib do
  fa, r8 sib' la sol

  %34
  fa4. sib8\p la sol
  fa4. re'8\f do sib
  la sol fa sib do do,

  %37
  fa mi fa sol la fa fa sol16 la \clef tenor \key sib\major sib8 do re mi
  fa2.~
  fa~

  %40
  fa~\p
  fa
  sib,4\f sib sib

  %43
  \clef bass \key sib\major fad fad fad\mbreak
  sol fad mi
  re fad re

  %46
  sol fa! mib!
  re re, re'\mbreak
  sol, sib re

  %49
  sol, sib re
  sol16 sib la sib re sib la sib sol sib la sib\mbreak
  mi, sib' la sib do, sib' la sib sol' sib, la sib

  %52
  sol sib la sib do, sib' la sib mi, sib' la sol
  la fa' mi re do8 sib la sol\mbreak
  fa16 lab sol lab do lab sol lab fa lab sol lab

  %55
  re, lab' sol lab sib, lab' sol lab fa' lab, sol lab
  fa lab sol lab sib, lab' sol lab re, lab' sol fa\mbreak
  sol8 sib16 lab sol8 mib' re[do]

  %58
  si4 sol sol
  sol sol sol
  sol\p sol sol

  %61
  sol sol sol
  sol,\f sol sol\mbreak
  do la la

  %64
  re re re'
  sol, re' do
  sib do do,

  %67
  re re, re'
  sol do, re
  sol, r8 do' sib la\mbreak

  %70
  sol4. do8\p sib la
  sol4. sol8\f do, do'
  re,4 sol8 do, re4

  %73
  sol,8 si si re re sol
  sol4 sol sol
  do, do do

  %76
  fa fa fa\mbreak
  sib, sib sib
  mib mib mib

  %79
  fa fa fa
  fa fa fa
  fa fa'8 mib re do

  %82
  sib2.~
  sib~
  sib~\p

  %85
  sib~
  sib4\f mib, \clef tenor \key sib\major mib'
  fa2.~

  %88
  fa~\p
  fa~
  fa~\f

  %91
  fa4\clef bass \key sib\major fa, mib
  re re do
  si si la

  %94
  sol sol sol'
  do, do' r
  do, do sib

  %97
  la la sol
  fa fa fa'\mbreak
  sib, sib' r

  %100
  sib8 sib, sib[sib'] sib8.\tr la32(sib)
  do8 do, do[do'] do8.\tr sib32(do)
  \clef tenor \key sib\major re8 re, re[re'] re8.\tr do32(re)\mbreak

  %103
  mib8 mib, mib[mib'] mib8.\tr re32(mib)
  fa2.~
  fa2 \clef bass \key sib\major fa,4

  %106
  sib mib, fa
  sib, \clef tenor \key sib\major r8 mib' re do\mbreak
  sib4. mib8\p re do

  %109
  sib4. \clef bass \key sib\major sol8\f fa mib
  re do re mib fa4
  sib,8 \clef tenor \key sib\major sib'16 la sib8 do re mib fa,2.\fermata

}


IVbcn = \relative do {

  sib'4 sib, r
  sib' sib, r
  sib'\p sib, r

  %4
  sib' sib, r
  sib'\f mib, mib
  fa fa fa\mbreak

  %7
  fa fa fa
  fa fa\p fa
  fa fa fa

  %10
  fa fa\f mib
  re re re
  re re re

  %13
  re re re
  mib mib, r\mbreak
  mi' mi mi

  %16
  mi? mi mi
  mi? mi mi
  fa fa, r

  %19
  sib8 sib' r sib sib16 la sol8
  la, la' r la la16 sol fa8\mbreak
  sol, sol' r sol sol16 fa mib8

  %22
  fa, fa' r fa fa, fa'
  fa, fa' r fa fa, fa'
  fa,\p fa' r fa fa, fa'\mbreak

  %25
  fa, fa' r fa fa, fa'
  mi4\f mi mi
  mi? mi mi

  %28
  fa fa fa
  fa, fa fa
  sib sib sib

  %31
  do do do\mbreak
  re  sib do
  fa, r r

  %34
  R2.
  r4 r8 re''\f do sib
  la sol fa sib do[do,]

  %37
  fa mi fa sol la fa fa mi16 re do8 sib la sol
  fa4 fa' r
  fa, fa' r

  %40
  fa,\p fa' r
  fa, fa' r
  sib\f sib sib\mbreak

  %43
  fad fad fad
  sol fad mi
  re fad re

  %46
  sol fa! mib!
  re re, re'\mbreak
  sol, sib re

  %49
  sol, sib re
  sol, sol' r
  mi do r

  %52
  do' do, r
  fa2 r4
  fa, fa' r

  %55
  re sib r\mbreak
  sib' sib, r
  mib2 fa4

  %58
  sol sol sol
  sol sol sol
  sol\p sol sol

  %61
  sol sol sol
  sol,\f sol sol\mbreak
  do la la

  %64
  re re re'
  sol, re' do
  sib do do,

  %67
  re re, re'
  sol do, re
  sol, r r

  %70
  R2.\mbreak
  r4 r8 sol'\f do, do'
  re,4 sol8 do, re4

  %73
  sol,8 si si re re sol
  sol4 sol sol
  do, do do

  %76
  fa fa fa\mbreak
  sib, sib sib
  mib mib mib

  %79
  fa fa fa
  fa fa fa
  fa fa'8 mib re do

  %82
  sib4 sib, r
  sib' sib, r
  sib'\p sib, r\mbreak

  %85
  sib' sib, r
  sib'\f mib, mib
  fa fa fa\p

  %88
  fa fa fa
  fa fa fa\f
  fa fa fa

  %91
  fa fa, mib'\mbreak
  re re do
  si si la

  %94
  sol sol sol'
  do, do' r
  do, do sib

  %97
  la la sol
  fa fa fa'\mbreak
  sib, sib' r

  %100
  sib, r sib
  do r do
  re r re

  %103
  mib r mib
  fa fa fa
  fa fa fa

  %106
  sib mib, fa\mbreak
  sib, r r
  R2.

  %109
  r4 r8 sol'\f fa mib
  re do re mib fa4
  sib,8 re do sib la sol sib2.\fermopz

}

IVbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key sib\major
  \time 3/4
  \tempo 2 = 60
  \repeat volta 2{s2.*36}
  \alternative {{s2.}{s}}
  \bar".|:" \break
  \set Score.currentBarNumber = #38
  \repeat volta 2{s2.*73}
  \alternative {{s2.}{s}}
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


IVfg = {
  \IVglobal
  \clef tenor
  <<\IVfgn \forma>>
}



IVbc = {
  \IVglobal
  \clef bass
  <<\IVbcn \forma \IVbfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup \huge  {"[1.] Andante"}

\score {
  {

    \new ChoirStaff <<

      \new Staff <<
        \set Staff.instrumentName = \markup  \center-column{"Oboe""Primo"}
        \set Staff.midiInstrument = #"oboe"
        \IobI
      >>

      \new Staff <<
        \set Staff.instrumentName = \markup  \center-column{"Oboe""Secondo"}
        \set Staff.midiInstrument = #"oboe"
        \IobII
      >>

      \new Staff <<
        \set Staff.instrumentName = \markup \center-column{"Bassono"}
        \set Staff.midiInstrument = #"bassoon"
        \Ifg
      >>

      \new Staff  <<
        \set Staff.instrumentName = \markup  \center-column{"Cembalo"}
        \set Staff.midiInstrument = #"bassoon"
        \Ibc
      >>
    >>

  }


  \layout {

    indent = 1.2\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge  {"[2.] Allegro"}

\score {
  {

    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"oboe"
        \IIobI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"oboe"
        \IIobII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"bassoon"
        \IIfg
      >>

      \new Staff  <<
        \set Staff.midiInstrument = #"bassoon"
        \IIbc
      >>
    >>

  }


  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge  {"[3.] Largo"}

\score {
  {

    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"oboe"
        \IIIobI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"oboe"
        \IIIobII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"bassoon"
        \IIIfg
      >>

      \new Staff  <<
        \set Staff.midiInstrument = #"bassoon"
        \IIIbc
      >>
    >>

  }


  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge  {"[4.] Allegro"}

\score {
  {

    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"oboe"
        \IVobI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"oboe"
        \IVobII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"bassoon"
        \IVfg
      >>

      \new Staff  <<
        \set Staff.midiInstrument = #"bassoon"
        \IVbc
      >>
    >>

  }


  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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







%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
