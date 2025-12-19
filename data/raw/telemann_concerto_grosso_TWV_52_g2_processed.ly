\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

dolce = _\markup \italic \center-align"doux"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "tutti"

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber.transparent = ##t

terzinecon = \override TupletNumber.transparent = ##f

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
   \override TupletBracket #'bracket-visibility = ##f
}

IvlIn = \relative do'' {

  re4 r8 re mib16.(dod32) re8 re re
  sol16.( si,32) do8 r do fad16.[(do32) re,16.(do'32)] la'8. do,16
  do16.[(la32) sib16.(re32)] sol16.[(re32) sib'16.(la32)] la4 r16 la,[re16.(do32)]\mbreak

  %4
  si16.[(re32) sol16.(fa32)] mib!16.[(re32) do16.(si32)] do16.(la32) fad'8 r4
  r8 fa!~fa16.[(re32) sol16.(re32)] mib!16.(do32) mi8 r4
  r8 sol~sol16 mi la mi fa(re) la'8 r la

  %7
  sib16(sold) la8 la la\mbreak re16(fad,) sol?8 r sol,
  dod16.[(sol32) la,16.(sol'32)] mi'8. sol,16 sol16.[(mi32) fa16.(mi'32)] dod8. re16
  re4 r8 lab' lab16(fad) sol8 r sib

  %10
  sib16.(sol32) la8 r do do16.(la32) sib8~sib16. sol32 lab8~
  lab16. fad32 sol4 fad8\mbreak sol16.[re32 do16. sib32] la8. sol16
  sol8 sol'16(sol,) la4~la8 la'16 la, sib8 sol'16 sol,

  %13
  la8 fa'16 fa, sol8 mi'16 mi, fad8 sol16 la fad8. sol16
  sol2 r

}

IvlIIn = \relative do'' {

  R1*2
  re4 r8 re mib16.(dod32) re8 re re
  sol16.(si,32) do8 r do fad16.[(do32) re,16.(do'32)] la'8. do,16

  %5
  do16.(la32) si8 r4 r8 sib~sib16.[sol32 do16.(sol32)]
  la16(fa') mi8 r4 r8 fa,16.(la32) re16.[(la32) fa'16.(mi32)]
  mi?4 r16 mi,?[la16. (sol32)] fad16.[(la32) re16.(do32)]  sib16.[(la32) sol16.(fad32)]

  %8
  sol16.[(mi32) dod'8] r16 sol dod mi\mbreak la,16.[(dod32) re16.(sol,32)] mi8. re16
  re8 fa'16(la,) sib4~sib8 sib'16. sib,32 do?4~
  do8 do'16.(do,32) re4~re8 re'16.(re,32) mib8 do'16. do,32

  %11
  re8 sib'16 sib, do8 la'16 la, sib8 la16 sol fad8. sol16
  sol4 r8 sol'\mbreak sol16 mi fa8~fa16 re mib8~
  mib16 dod re4 dod8 re16 la sib do? la8. sol16

  %14
  sol2 r

}


IvlIripn = \relative do'' {

  r8 re16.\p re32 re8 re r re16. re32 re8 re
  r do16. do32 do8 do r do16. do32 do8 do
  r sib16. sib32 sib'8 sib r la16. la32 la8 la

  %4
  r sol16. sol32 sol8 sol r fad16. fad32 fad8 fad\mbreak
  r fa!16. fa32 fa8 fa r mi16. mi32 mi8 mi
  r sol16. sol32 sol8 sol r fa16. fa32 la8 la

  %7
  r la16. la32 la8 la r sol16. sol32 sol8 sol
  r sol16. sol32 sol8 sol r fa16.(mi32) dod8. re16
  re8 fa16. fa32 fa8 fa\mbreak r sol16. sol32 sol8 sol

  %10
  r la16. la32 la8 la r sib16. sib32 sib8 lab
  r sol16. sol32 sol8 fad sol16.[re32 do16. sib32] la8. sol16
  sol8 sib16. sib32 la8 la r la16. la32 sib8 sib

  %13
  r la16. la32 sol8 sol fad sol16 la fad8. sol16
  sol2 r

}

IvlIIripn = \relative do'' {

  r8 sib16.\p sib32 sib8 sib r la16. la32 la8 la
  r sol16. sol32 sol8 sol r la16. la32 la8 la
  r sol16. sol32 re'8 re r re16. re32 re8 re\mbreak

  %4
  r mib16. mib32 do8 do r do16. do32 do8 do
  r si16. si32 si8 si r sib16. sib32 sib8 sib
  r la16. la32 mi'8 mi r re16. re32 fa8 fa

  %7
  r mi16. mi32 mi8 mi r re16. re32 re8 re\mbreak
  r dod16. dod32 dod8 dod r la16.(sol32) mi8. re16
  re8 la'16. la32 sib8 sib r sib16. sib32 do8 do

  %10
  r do16. do32 re8 re r re16. re32 mib8 mib
  r re16. re32 do8 do sib la16 sol fad8. sol16
  sol8 sol'16. sol32 sol8 sol r fa16. fa32 fa8 mib!\mbreak

  %13
  r re16. re32 re8 dod re16.[la32 sib16. do?32] la8. sol16
  sol2 r

}

Ivlan = \relative do' {

  r8 sol'16.\p sol32 sol8 sol r re16. re32 re8 re
  r sol16. sol32 sol8 sol r fad16. fad32 fad8 fad
  r re16. re32 re8 re r8 fa?16. fa32 fa8 fa\mbreak

  %4
  r do16. do32 do8 do r la'16. la32 la8 la
  r re,16. re32 re8 re r sol16. sol32 sol8 sol
  r mi16. mi32 la8 la r la16. la32 re,8 re

  %7
  r mi16. mi32 mi8 mi r sol16. sol32 sol8 sol\mbreak
  r mi16. mi32 mi8 la r la,16. la32 la8 la
  la re16. re32 fa8 fa r mib16. mib32 sol8 sol

  %10
  r fa16. fa32 la8 la r sol16. sol32 sol8 mib
  r sol16. sol32 do,8 re re mib la,[re]\mbreak
  re mib16. mib32 mi8 mi r re16. re32 re8 mib

  %13
  r fa16. fa32 sol8 sol re re re[re]
  re2 r

}

Ibcn = \relative do {

  r8 sol'16.\p sol32 sol8 sol r fad16. fad32 fad8 fad
  r mib16. mib32 mib8 mib r re16. re32 re8 re
  r8 sol16. sol32 sol8 sol\mbreak fa?16. fa32 fa8 fa fa

  %4
  r mib16. mib32 mib8 mib r re16. re32 re8 re
  r8 sol16. sol32 sol8 sol r do,16. do32 do8 do
  r dod16. dod32 dod8 dod re16. re32 re8 re re

  %7
  r do!16. do32 do8 do\mbreak r sib16. sib32 sib8 sib
  r la16. la32 la8 la r re la' la,
  re, re'16. re32 re8 re r mib16. mib32 mi8 mi

  %10
  r fa16. fa32 fad8 fad r sol16. sol32 do8 do
  r sib16. sib32 la8 la sol do re re,\mbreak
  sol mib16. mib32 dod8 dod r re16. re32 sol8 sol

  %13
  r fa16. fa32 mi8 mi re sol re re,
  sol2 r

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}


forma = {

   \key sol\minor
   \time 4/4
   \tempo 4 = 40
   s1*14
   \bar"|."

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

IvlIrip = {
   \Iglobal
   <<\IvlIripn \forma>>

}

IvlIIrip = {
   \Iglobal
   <<\IvlIIripn \forma>>

}


Ivla = {
   \Iglobal
   \clef alto
   <<\Ivlan \forma>>

}


Ibc = {
   \Iglobal
   \clef bass
   << \Ibcn \forma \Ibfn >>
   \typeset

}

IIglobal = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
}

IIvlIn = \relative do'' {

  sol'8(re sib) sib(re sol)
  sol(re sib) sib(re sol)
  la(fad re) re(fad la)

  %4
  la(fad re) re(fad la)
  sib(re, sib) do16(re mi fa sol8)
  la(do, la) sib16(do re mib! fa8)

  %7
  sol(sib, sol)\mbreak la16(sib do re mi8)
  fad(do si) sol'(do, si)
  la'(do, si) re, re'16(do sib la)

  %10
  sib8(re sol) la,(sol') fad
  sol4. r
  sib,8(re sol) sol(re sib)

  %13
  re4. r
  re8(fad la) la(fad re)\mbreak
  re4. sol

  %16
  r fa
  r mi
  re2.~

  %19
  re~
  re4 re8 do(sib la)
  sol(sib mi) dod(la dod)

  %22
  re4. fa
  r mi\mbreak
  fa8(re la) la sol'16(fa mi re)

  %25
  mi8(dod la) la la'16(sol fa mi)
  fa8(re sib) sib16(re do re sib'8)
  mi,(do la) la16(do sib do la'8)

  %28
  re,(sib sol) sol16(sib la sib sol'8)
  dod,(sol16 fad sol8) re' (sol,16 fad sol8)
  mi'(sol,16 fad sol8) la,la'16(sol fa? mi)

  %31
  fa8(la re) mi,(re' dod)
  re2.
  fa8(re sib) sib(re fa)

  %34
  sol(sib, mib,) mib(sib' sol')
  fa(re sib) sib(re fa)
  sib16(la sol fa mi re) mi,8(do' sib')\mbreak

  %37
  la16(sol fa mib! re do) re,8(sib' fa')
  mib16(re do sib la sol) la,8(fa' mib')
  re4. r

  %40
  mib,8(sib' sol') sol(sib, mib,)
  re4. r
  re' sol

  %43
  do, fa
  sol fa\mbreak
  fa8(re do) sib(re fa)

  %46
  fa(re do) sib16(do re mib fa8)
  fa(re do) si(re sol)
  sol(mib re) do16(re mib fa sol8)

  %49
  lab(do, fa,) fa(do' lab')
  sol(do, mib,) mib(do' sol')
  fa(do re,) re(do' fa)\mbreak

  %52
  fa(si, re,) re(si' fa')
  mib(do si) fa'(do si)
  sol'(do, si) lab'(do, si)

  %55
  sol,16(fa' mi fa si8) sol,16(fa' mi fa re'8)
  mib,!(re' do) re,(do' si)
  fa(si do) sol,4 si'8\mbreak

  %58
  do sol'16(fa mib! re) do8 mib16(re do sib)
  la4. r
  fa' r

  %61
  la, r
  fa'8(re do) sib(re fa)
  fa(re sib) lab16(sol lab fa re'8)

  %64
  fa(re lab) re, sib'16(lab sol fa)\mbreak
  mib4. sol
  la8(do la') fad, re'16(do sib la)

  %67
  sol4. sib
  do8(mib do') la, fa'16(mib re do)
  re8(mib16 re do sib) la8(re16 do sib la)

  %70
  sib(re do re sib'8) mib,(sib sol')\mbreak
  la,16(do sib do la'8) re,(la fa')
  sol,16(sib la sib sol'8) do,(sol mib')

  %73
  fad(do si) sol'(do, si)
  la'(do, si) re, re'16(do sib la)
  sib8(re sol) la,(sol' fad)

  %76
  sol2.

}

IIvlIIn = \relative do'' {

  sib4. r
  sib8(re sol) sol(re sib)
  re4. r

  %4
  re8(fad la) la(fad re)
  re4. sol
  r fa

  %7
  r mi\mbreak
  re2.~
  re~

  %10
  re4. r
  sol8(re sib) sib(re sol)
  sol(re sib) sib(re sol)

  %13
  la(fad re) re(fad la)
  la(fad re) re(fad la)
  sib(re, do) do16(re mi fa sol8)\mbreak

  %16
  la8(do, la) sib16(do re  mib! fa8)
  sol8(sib, sol) la16(sib do re mi8)
  fad(do si) sol'(do, si)

  %19
  la'(do, si) re, re'16(do sib la)
  sib8(re sol) la,(sol' fad)
  sol(re dod) la la'16 (sol fa? mi)\mbreak

  %22
  fa8(re la) la sol'16 (fa mi re)
  mi8(dod la) la la'16( sol fa mi)
  re4. fa

  %25
  r mi
  re4(fa8) fa4(sib,8)
  sib4(mi8) mi4(la,8)

  %28
  la4(re8) re4(sol,8)\mbreak
  la2.~
  la~

  %31
  la4 la8 sol(fa mi)
  re2.
  re'4. r

  %34
  mib,8(sib' sol') sol(sib, mib,)
  re4. r
  re'4. sol

  %37
  do, fa
  sol fa\mbreak
  fa8(re sib) sib(re fa)

  %40
  sol(sib, mib,) mib(sib' sol')
  fa(re sib) sib(re fa)
  sib16(la sol fa mi re) mi,8(do' sib')

  %43
  la16(sol fa mib! re do) re,8(sib' fa')
  mib16(re do sib la sol) la,8(fa' mib')
  re4. r\mbreak

  %46
  re r
  re8(si do) re(si re)
  do4. r

  %49
  do8(fa lab) lab(fa do)
  do(mib sol) sol(mib do)
  do(re fa) fa(re do)

  %52
  si(re fa) fa(re si)
  do2.~
  do

  %55
  si4. r\mbreak
  sol8(fa mib) fa(mib re)
  lab'(sol fa) mib(fa re)

  %58
  mib4. r
  do'8(la sol) fa(la do)
  do(la fa) mib!16(re mib do la'8)

  %61
  do(la mib) la,16(fa' mib re do8)
  re4. r
  sib' r

  %64
  re, r\mbreak
  sol8(sib sol') mi,(do'16 sib la sol)
  fa4. la

  %67
  sib8(re sib') sol, mib'!16(re do sib)
  la4. do
  sib4 sol8 re'4.

  %70
  re4(sol8) sol4(mib8)
  mib4(do8) fa4(re8)
  re4(sib8) mib4(do8)

  %73
  la4 re8 re4.~
  re4 re8 re4.~
  re4 re8 do(sib la)

  %76
  sol2.

}


IIvlIripn = \relative do'' {

  sol'4. r
  sol8(re sib) sib(re sol)
  la4. r

  %4
  la8(fad re) re(fad la)
  sib4. r
  la r

  %7
  sol r
  fad sol
  la r8 r la,\mbreak

  %10
  sib8(re sol) \once\slurDashed la, (sol') fad
  sol4. r
  sib,8(re sol) sol(re sib)

  %13
  re4. r
  re8(fad la) la(fad re)
  re4. sol

  %16
  r fa
  r mi
  re re

  %19
  re r8 r re
  re4 re8\mbreak do sib la
  sol4. dod

  %22
  re r
  mi r
  fa r

  %25
  mi r
  fa8(re sib) sib4.
  mi8(do la) la4.

  %28
  re8(sib sol) sol4.
  dod re\mbreak
  mi r8 r mi,

  %31
  fa(la re) mi,(re' dod)
  re2.
  fa4. r

  %34
  sol4 sol8 sol4 sol8
  fa4. r
  sib sib

  %37
  la fa
  sol fa
  fa\mbreak r

  %40
  mib4 mib8 sib4 sib8
  re4. r
  re sol

  %43
  do, re
  do do
  sib r

  %46
  fa' r
  fa8(re do) si(re sol)
  mib4. r

  %49
  lab4 lab8\mbreak lab4 lab8
  sol4. r
  fa4 fa8 fa4 fa8

  %52
  fa4. r
  mib fa
  sol lab

  %55
  re, r
  mib,8(re' do) re,(do' si)
  fa(si do) sol4 si8

  %58
  do4.\mbreak sol'
  la, r
  fa' r

  %61
  la, r
  fa' r
  fa r

  %64
  fa r
  sol, r
  la r\mbreak

  %67
  sib r
  do r
  re re

  %70
  re r8 r mib
  mib4. r8 r re
  re4. r8 r do

  %73
  fad4. sol
  la r8 r la,\mbreak
  sib(re sol) la,(sol' fad)

  %76
  sol2.

}

IIvlIIripn = \relative do'' {

  sib4. r
  sib8(re sol) sol(re sib)
  re4. r

  %4
  re8(fad la) la(fad re)
  re4. sol
  r fa

  %7
  r mi\mbreak
  re re
  re r8 r re

  %10
  re4 re8 do(sib la)
  sib4. r
  sol'8(re sib) sib(re sol)

  %13
  la4. r
  la8(fad re) re(fad la)
  sib4. r

  %16
  la r
  sol r
  fad sol

  %19
  la r8 r la,\mbreak
  \slurDashed sib8 (re sol) la, (sol' fad)\slurSolid
  sol4. mi

  %22
  fa r
  la, r
  la r

  %25
  la r
  la4(fa'8) fa4(sib,8)
  sib4(mi8) mi4(la,8)

  %28
  la4(re8) re4(sol,8)
  la4.\mbreak la
  la r8 r la

  %31
  la4 la8 sol fa mi
  re2.
  re'4. r

  %34
  mib4 mib8 sib4 sib8
  re4. r
  re sol

  %37
  do, re
  do do
  sib r\mbreak

  %40
  sol'4 sol8 sol4 sol8
  fa4. r
  sib sib

  %43
  la fa
  sol fa
  fa r

  %46
  re r
  re8(si re) re(si re)
  do4. r

  %49
  do4 do8 do4 do8\mbreak
  do4. r
  do4 do8 do4 do8

  %52
  si4. r
  do do
  do do

  %55
  si r
  sol8(fa mib) fa(mib re)
  lab'(sol fa) mib(fa re)

  %58
  mib4. do'
  do r
  do r

  %61
  do r
  re, r
  sib' r

  %64
  re, r
  r mi
  r fad

  %67
  r sol
  r la
  sib la

  %70
  sib\mbreak r8 r sib
  la4. r8 r la
  sol4. r8 r sol

  %73
  re'4. re
  re r8 r re
  re4 re8 do sib la

  %76
  sol2.

}

IIvlan = \relative do' {

  re4. r
  re re
  re r

  %4
  re4. re
  re mi
  do re

  %7
  sib do
  la sol
  re' r8 r la'

  %10
  sol4 sol8 sol4 re8\mbreak
  re4. r
  re re

  %13
  re r
  re re
  re mi

  %16
  do re
  sib do
  la sol

  %19
  re' r8 r la'
  sol4 sol8 mib4 la,8\mbreak
  sib4. la

  %22
  la r
  la r
  la r

  %25
  la r
  la' sib
  sol la

  %28
  fa sol
  mi re
  la' r8 r la\mbreak

  %31
  la4 la8 sib4 mi,8
  fad2.
  sib4. r

  %34
  sib4 sib8 sib4 sib8
  sib4. r
  sol mi

  %37
  fa re
  mib! do
  re r

  %40
  sib'4 sib8 sib4 sib8\mbreak
  sib4. r
  sol mi

  %43
  fa re
  mib! do
  re r

  %46
  sib' r
  si4 sol8 sol4 sol8
  sol4. r

  %49
  fa4 fa8 fa4 fa8
  sol4. r\mbreak
  re4 re8 re4 re8

  %52
  re4. r
  sol fa
  mib do

  %55
  sol' r
  sol sol
  re sol

  %58
  sol sol
  fa r
  fa r\mbreak

  %61
  fa r
  fa r
  sib, r

  %64
  sib r
  sib do
  do re

  %67
  re mib
  mib fa
  fa la

  %70
  sol r8 r sol\mbreak
  la4. r8 r re,
  mib4. r8 r mib

  %73
  la,4. sol
  re' r8 r re
  re4 re8 mib4 la,8

  %76
  sib2.

}

IIbcn = \relative do {

  sol4. r
  sol' sol
  fad r

  %4
  fad? fad
  sol mi
  fa? re

  %7
  mib! do
  re mi
  fad r8 r fad

  %10
  sol4 sib,8 do4 re8
  sol,4. r
  sol' sol

  %13
  fad r
  fad fad
  sol mi

  %16
  fa? re
  mib! do
  re mi\mbreak

  %19
  fad r8 r fad
  sol4 sib,8 do4 re8
  sol,4. la

  %22
  re r
  dod r
  re r

  %25
  dod r
  re re'
  do? do,

  %28
  sib sib'\mbreak
  la si
  dod r8 r dod

  %31
  re4 fad,8 sol4 la8
  re,2.
  si4. r

  %34
  mib4 mib8  mib4 mib8
  sib4. r
  sol' sol

  %37
  fa sib
  mib, fa\mbreak
  sib, r

  %40
  mib4 mib8 mib4 mib8
  sib4. r
  sol' sol

  %43
  fa sib
  mib, fa
  sib,4. r

  %46
  lab r
  sol sol'
  do, r\mbreak

  %49
  fa4 fa8 fa4 fa8
  mib4. r
  re4 re8 re4 re8

  %52
  sol4. r
  do, re
  mib fa

  %55
  sol r
  do, sol'
  fa sol

  %58
  do, mib!\mbreak
  fa r
  la r

  %61
  fa r
  sib, r
  re r

  %64
  sib r
  mib do
  fa re

  %67
  sol mib
  la fa
  sib\mbreak fad

  %70
  sol r8 r sol
  fa?4. r8 r fa
  mib!4. r8 r mib

  %73
  re4. mi
  fad r8 r fad
  sol4 sib,8 do4 re8

  %76
  sol,2.

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}


forma = {

   \key sol\minor
   \time 6/8
   \tempo 2. = 55
   s2.*32
   \bar":..:"\break
   s2.*44
   \bar":|."

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

IIvlIrip = {
   \IIglobal
   <<\IIvlIripn \forma>>

}

IIvlIIrip = {
   \IIglobal
   <<\IIvlIIripn \forma>>

}


IIvla = {
   \IIglobal
   \clef alto
   <<\IIvlan \forma>>

}


IIbc = {
   \IIglobal
   \clef bass
   << \IIbcn \forma \IIbfn >>
   \typeset

}

IIIglobal = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

  r2 re mib
  do la re
  sol, sol'1~

  %4
  sol4 la8(sol fad mi re do) la'(do, sib la)
  sib4 sol sol,2 r
  R1.\mbreak

  %7
  r2 la'' sib
  sol mi la
  re, sib'1~

  %10
  sib4 do8(sib la sol fa mib!) do'(mib, re do)
  re4 sib'8(la sol fa mib re) sib'(re, do sib)
  do4 la'8(sol fad  mi re do) la'(do, sib la)\mbreak

  %13
  sib4 re8(do sib la sol fa) mi(re dod si)
  la4 dod' re2. re4
  re4.(dod8) dod2.\tr re4

  %16
  re1 r2
  R1.
  r4 la'8(sol fa mi re do) sib(re sol sib)

  %19
  mi,4 la, la,2 r\mbreak
  r sol'' lab
  fa re sol

  %22
  do, do'1~
  do4 la sib2. sib4
  sib4. (la8) la2. sol4

  %25
  sol2 re1~
  re2 do1~
  do4 re8(do sib la sol fa) mib(re do sib)

  %28
  la2 do'1~
  do4 la'8(sol fad mi re do) la'(do, sib la)
  sib1.

  %31
  mib2 la,2. sol4
  sol1.

}

IIIvlIIn = \relative do'' {

  R1.*2
  r4 re8(do sib la sol fa) mib(do' sol' do,)
  la'4 re, re,2 r

  %5
  r re' mib
  do la re
  sol, re'1~\mbreak

  %8
  re4 mi8(re dod si la sol) mi'(sol, fa mi)
  fa2 fa' sol
  mib! do fa

  %11
  sib,1 sib2~
  sib la la~
  la sol sol'~\mbreak

  %14
  sol4 mi fa2. fa4
  fa4.(mi8) mi2. re4
  re2 la sib

  %17
  sol mi la
  re, re'1~
  re4 mi8(re dod si la sol) mi'(sol, fa mi)\mbreak

  %20
  fa4 re do'1~
  do2 si r
  r4 sol'8(fa mib! re do sib) la(sol fad mi)

  %23
  re4 fad' sol2. sol4
  sol4.(fad8) fad2. sol4
  sol re8(do sib la sol fa) re'(fa, mib re)\mbreak

  %26
  mib4 do'8(sib la sol fa mib) do'(mib, re do)
  re2 re'1~
  re4 sol8(fa mib re do sib) la(sol fad mi)

  %29
  re2 do'1~
  do4 sib8(la sol fa mi re) do(sib la sol)\mbreak
  sol''2 fad2. sol4

  %32
  sol1.

}

IIIbcn = \relative do {

  sol1 sol'2~
  sol fa re
  mib1 mib2

  %4
  re1 fad2
  sol1 do2
  la re re,

  %7
  mi fa sol
  mi la dod,\mbreak
  re1 mib!2

  %10
  do1 la2
  sib1 sol2
  la1 fad2

  %13
  sol1 sol2
  la4 la'8(sol fa mi re do) sib(la sol fa)
  sol2 la1

  %16
  re, re'2~\mbreak
  re do la
  sib1 sib2

  %19
  la1 dod2
  re mib! fa
  do sol' fa

  %22
  mib1 do2
  re4 re'8(do sib la sol fa) mib(re do sib)
  la2 re re,\mbreak

  %25
  sol1 si2
  do1 la2
  sib1 r2

  %28
  r r do
  re1 fad2
  sol1 r2

  %31
  do, re re,
  sol1.

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}


forma = {

   \key sol\minor
   \time 3/2
   \tempo 2 = 40
   s1.*32
   \bar"|."

}

IIIvlI = {
   \IIIglobal
   \notypeset
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   \IIIglobal
   <<\IIIvlIIn \forma>>

}


IIIbc = {
   \IIIglobal
   \clef bass
   << \IIIbcn \forma \IIIbfn >>
   \typeset

}

IVglobal = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
}

IVvlIn = \relative do'' {

  sol16 fad sol la sib la sib do re8 sol, re' sol,
  mib' mib mib re16 do re8 sol, re'16 do re mib
  fa8 mib re do sib16 la sib do re8 do\mbreak

  %4
  sib fa fa la sib16 la sib do re8 do
  sib la sol fad sol re sib' la
  sol16 re mi fad sol8 fad sol16 fad sol la sib8 la

  %7
  sib16 la sib do re8 do sib la sol fad
  sol4 r\mbreak re'16 dod re mi fa mi fa sol
  la8 re, la' re, sib' sib sib la16 sol

  %10
  la8 re, la'16 sol la sib do8 sib la sol
  fa16 mi fa sol la8 sol fa do do mi
  fa16 mi fa sol la8 sol\mbreak fa mi re dod

  %13
  re la fa' mi re16 la si dod re8 dod
  re16 dod re mi fa8 mi fa16 mi fa sol la8 sol
  fa mi re dod re16\soli dod re mi re mi re do?\mbreak

  %16
  si sol' re sol si, sol' re sol do, si do re do re do sib
  la fa' do fa la, fa' do fa sib,\tu sib sib sib sib sib sib sib
  sib sib sib sib sib sib sib sib sib sib sib sib sib sib sib sib\mbreak

  %19
  sib4 r8 sol' fa mib16(re) mib(re) do(re)
  sib4 sib'4.\soli sol8 lab4~
  lab8 fad sol[mi] fa? re mib4~

  %22
  mib8 sol fa mib re4 r
  sib16\tu la sib do re sib do re\mbreak mib8 mib mib re16 do
  re4 r8 do\soli re mi fa mib

  %25
  re do si do la sib do sib
  la sol la fa sib sol la mi
  fad4 r8 re sol16\tu fad sol la sib la sib do\mbreak

  %28
  re8 sol, sol' sol sol(fa) r fa
  fa sol16 fa mib8 mib mib(re) r re
  re mib16 re do8 do do sib16 do re8 do16 sib

  %31
  la8 la'\soli fad re \once\stemUp re, fad' la fad
  \once\stemUp sib,, sib'' sol re\mbreak \once\stemUp mib, sol' sib sol
  \once\stemUp do,, do'' la fa \once\stemUp fa, la' do la

  %34
  \once\stemUp re,, sib'' re sib sol,, si'' re si
  do,,4 r do'16\tu si do re mib do re mib
  fa8 fa fa mib16 re mib8 re do si

  %37
  do4 r \mbreak sib!16 la sib do re do re mib
  fa8 sib, fa' sib, sol'8 sol sol fa16 mib
  fa8 mib re do sib16\soli do sib la sol fa mib re

  %40
  do4 r mib'16 fa mib re do sib la sol
  fad sol fad mi re do sib la\mbreak sol'\tu fad sol la sib la sib do
  re8 sol, re' sol, mib'8 mib mib re16 do

  %43
  re8 sol, re'16 do re mib fa8 mib re do
  sib16 la sib do re8 do sib fa fa la
  sib16 la sib do re8 do\mbreak sib la sol fad

  %46
  sol re sib' la sol16 re mi fad sol8 fad
  sol16 fad sol la sib8 la sib16 la sib do re8 do
  sib la sol fad sol4 r

}

IVvlIIn = \relative do'' {

  sol16 fad sol la sib la sib do re8 sol, re' sol,
  mib' mib mib re16 do re8 sol, re'16 do re mib
  fa8 mib re do sib16 la sib do re8 do\mbreak

  %4
  sib fa fa la sib16 la sib do re8 do
  sib la sol fad sol re sib' la
  sol16 re mi fad sol8 fad sol16 fad sol la sib8 la

  %7
  sib16 la sib do re8 do sib la sol fad
  sol16 fad sol la sib la sib do re4 r
  re16 dod re mi fa re mi fa sol8 sol sol fa16 mi

  %10
  fa mi re mi fa mi fa sol la8 sol fa mi
  fa do do mi\mbreak fa16 mi fa sol la8 sol
  fa do do mi fa la16 sol fa8 mi

  %13
  fa mi re dod re la fa' mi
  re16 la si dod re8 dod re16 dod re mi fa8 mi\mbreak
  re la16 sol fa8 mi \once\stemUp re fad'\soli la fad

  %16
  \once\stemUp sol,, si' re si \once\stemUp do, mi' sol mi
  fa, la do la fa'16\tu mib! re  mib fa sol lab fa
  sol lab sol fa mib re mib fa re do re mib fa re mib fa\mbreak

  %19
  sol lab sol fa mib re do sib la8 sib fa la
  sib4 r8 do\soli re mi fa mib
  re do si do la sib do sib

  %22
  la sol la fa sib16\tu la sib do re do re mib\mbreak
  fa8 sib, fa' sib, sol' sol sol fa16 mib!
  fa8 sib, sib'4.\soli sol8 lab4~

  %25
  lab8 fad sol mi fa? re mib4~
  mib8 sol fa mib re sib do4~
  do8 mib re do sib4 r

  %28
  sib16\tu la sib do re do re mib\mbreak la,8 re, la'' sib16 la
  sol4 r8 sol fa fa fa sol16 fa
  mib4 r8 mib re re, sol la16 sol

  %31
  fad\soli mi fad sol la sib la sol fad re' la re fad, re' la re\mbreak
  sol, fad sol la sib do sib la sol mib' sib mib sol, mib' sib mib
  la, sol la sib do re do sib la fa' do fa la, fa' do fa

  %34
  sib, fa' re fa sib, fa' re fa si, sol' re sol si, sol' re sol\mbreak
  do,\tu si do re mib re mib fa sol8 do, sol' do,
  lab' lab lab sol16 fa sol8 fa mib[re]

  %37
  do16 re do sib la sol fa mib re4 r
  sib'16 la sib do re sib do re mib8 mib mib re16 do\mbreak
  re8 do sib la sib4 r

  %40
  mib16\soli fa mib re do sib la sol sol' la sol fa mib re do sib
  la' sib la sol fad mi re do sib4 r
  sol16\tu fad sol la sib sol la sib do8 do do sib16 la\mbreak

  %43
  sib la sol la sib la sib do re8 do sib la
  sib fa fa la sib16 la sib do re8 do
  sib fa fa la sib re16 do sib8 la

  %46
  sib la sol fad sol re sib' la
  sol16 re mi fad sol8 fad\mbreak sol16 fad sol la sib8 la
  sol re'16 do sib8 la sol4 r

}


IVvlIripn = \relative do'' {

  sol16 fad sol la sib la sib do re8 sol, re' sol,
  mib' mib mib re16 do re8 sol, re'16 do re mib
  fa8 mib re do sib16 la sib do re8 do\mbreak

  %4
  sib fa fa la sib16 la sib do re8 do
  sib la sol fad sol re sib' la
  sol16 re mi fad sol8 fad sol16 fad sol la sib8 la

  %7
  sib16 la sib do re8 do sib la sol fad
  sol4 r\mbreak re'16 dod re mi fa mi fa sol
  la8 re, la' re, sib' sib sib la16 sol

  %10
  la8 re, la'16 sol la sib do8 sib la sol
  fa16 mi fa sol la8 sol fa do do mi
  fa16 mi fa sol la8 sol\mbreak fa mi re dod

  %13
  re la fa' mi re16 la si dod re8 dod
  re16 dod re mi fa8 mi fa16 mi fa sol la8 sol
  fa mi re dod re4 r

  %16
  re r do r
  do r sib16 sib sib sib sib sib sib sib
  sib sib sib sib sib sib sib sib sib sib sib sib sib sib sib sib\mbreak

  %19
  sib4 r8 sol' fa mib16(re) mib(re) do(re)
  sib4 r r2\mbreak
  R1

  %22
  r2 sib16 la sib do re do re mib\mbreak
  fa8 sib, fa' sib, sol' sol sol fa16 mib!
  fa8 sib, r4 r2

  %25
  R1*2
  r2 sol16 fad sol la sib la sib do\mbreak

  %28
  re8 sol, sol' sol sol(fa) r fa
  fa sol16 fa mib8 mib mib(re) r re
  re mib16 re do8 do do sib16 do re8 do16 sib

  %31
  la4 r re r
  re r sib r
  mib r do r

  %34
  fa r\mbreak re r
  sol r do,16 si do re mib do re mib
  fa8 fa fa mib16 re mib8 re do si

  %37
  do4 r \mbreak sib!16 la sib do re do re mib
  fa8 sib, fa' sib, sol'8 sol sol fa16 mib
  fa8 mib re do sib4 r

  %40
  R1
  r2 sol16 fad sol la sib la sib do
  re8 sol, re' sol, mib'8 mib mib re16 do

  %43
  re8 sol, re'16 do re mib fa8 mib re do
  sib16 la sib do re8 do sib fa fa la
  sib16 la sib do re8 do\mbreak sib la sol fad

  %46
  sol re sib' la sol16 re mi fad sol8 fad
  sol16 fad sol la sib8 la sib16 la sib do re8 do
  sib la sol fad sol4 r

}

IVvlIIripn = \relative do'' {

  sol16 fad sol la sib la sib do re8 sol, re' sol,
  mib' mib mib re16 do re8 sol, re'16 do re mib
  fa8 mib re do sib16 la sib do re8 do\mbreak

  %4
  sib fa fa la sib16 la sib do re8 do
  sib la sol fad sol re sib' la
  sol16 re mi fad sol8 fad sol16 fad sol la sib8 la

  %7
  sib16 la sib do re8 do sib la sol fad
  sol16 fad sol la sib la sib do re4 r
  re16 dod re mi fa re mi fa sol8 sol sol fa16 mi

  %10
  fa mi re mi fa mi fa sol la8 sol fa mi
  fa do do mi\mbreak fa16 mi fa sol la8 sol
  fa do do mi fa la16 sol fa8 mi

  %13
  fa mi re dod re la fa' mi
  re16 la si dod re8 dod re16 dod re mi fa8 mi\mbreak
  re la16 sol fa8 mi re4 r

  %16
  re r sol r
  fa r fa'16 mib! re  mib fa sol lab fa
  sol lab sol fa mib re mib fa re do re mib fa re mib fa\mbreak

  %19
  sol lab sol fa mib re do sib la8 sib fa la
  sib4 r r2
  R1*2

  %23
  sib16 la sib do re sib do re\mbreak mib8 mib mib re16 do
  re4 r r2
  R1*3

  %28
  sib16 la sib do re do re mib\mbreak la,8 re, la'' sib16 la
  sol4 r8 sol fa fa fa sol16 fa
  mib4 r8 mib re re, sol la16 sol

  %31
  fad4 r la r
  sol r sol r
  la r la r\mbreak

  %34
  sib r si r
  do16 si do re mib re mib fa sol8 do, sol' do,
  lab' lab lab sol16 fa sol8 fa mib[re]

  %37
  do4 r re, r
  sib'16 la sib do re sib do re mib8 mib mib re16 do\mbreak
  re8 do sib la sib4 r

  %40
  R1*2
  sol16 fad sol la sib sol la sib do8 do do sib16 la\mbreak

  %43
  sib la sol la sib la sib do re8 do sib la
  sib fa fa la sib16 la sib do re8 do
  sib fa fa la sib re16 do sib8 la

  %46
  sib la sol fad sol re sib' la
  sol16 re mi fad sol8 fad\mbreak sol16 fad sol la sib8 la
  sol re'16 do sib8 la sol4 r

}

IVvlan = \relative do' {

  sib'4 sol sol r8 sol
  sol4 sol sib r8 sib
  sib4 la fa fa8 fa

  %4
  fa4 do fa8 fa fa[fa]
  fa4 mib8 re\mbreak re4 re8 fad
  re4 re re re8 fad

  %7
  re4 sol8 sol sol4 re
  re re la' la
  la re re r8 re

  %10
  la4 fa fa8 fa do' do
  la4 r8 do\mbreak do4 r8 do
  do4 r8 do la4 sib8 mi,

  %13
  re4 r8 la la4 r8 la'
  la4 r8 la la4 r8 dod
  la8 sib la la la4 r

  %16
  si r sol r\mbreak
  la r fa16 fa fa fa fa fa fa fa
  sib, sib sib sib sib' sib sib sib fa fa fa fa fa fa fa fa

  %19
  mib4 r8 mib do fa fa fa
  re4 r r2
  R1*2

  %23
  re8 re sib' sib\mbreak sib sib sib sib
  sib4 r r2
  R1*3

  %28
  re,8 re re re re re re re
  sib sib sib' sib sib sib sib sib
  sol sol sol sol sol sol re re

  %31
  re4 r\mbreak fad r
  re r mib r
  mib r fa r

  %34
  fa r sol r
  sol r sol8 sol do do
  do do do[do] do lab sol[sol]

  %37
  sol4 r sol r \mbreak
  fa8 fa sib sib sib sib sib sib
  sib sol fa fa fa4 r

  %40
  R1*2
  re4 sol sol r8 sol
  re4 sib sib8 sib fa'[fa]

  %44
  re4 r8 fa fa4 r8 fa\mbreak
  fa4 r8 fa re4 mib8 la,
  sib4 r8 re re4 r8 re

  %47
  re4 r8 re re4 r8 fad
  re re mib la, sib4 r

}

IVbcn = \relative do {

  sol'4 mib sib r8 sib
  do4 do' sol r8 sol
  re4 fa sib, sib'8 fa

  %4
  re4 fa re8 do sib la
  sib4 do8 re sib4 re
  sib8 la sol la sib4 re

  %7
  sol sib,8 do\mbreak re4 re,
  sol sol' fa8 mi re mi
  fa4 re sol r8 sol

  %10
  re4 re' la8 sib do do,
  fa4 r8 do' la4 r8 do
  la4 r8 do fa,4 sol8 la

  %13
  re,4 r8 la' fa4 r8 la\mbreak
  fa4 r8 la re,4 r8 mi
  fa sol la la, re4 r

  %16
  sol r mi r
  fa r re16 do sib do re mib fa re
  mib re mib fa sol fa sol la sib la sib do re sib do re

  %19
  mib4 r8 mib,\mbreak fa sib, fa' fa,
  sib4 r r2
  R1*2

  %23
  sib'8 sib sib sib mib, mib mib mib
  sib4 r r2
  R1*3

  %28
  sol16 fad sol la sib la sib do re do re mib fa mib fa re\mbreak
  mib re mib fa sol fa sol la sib la sib do re do re sib
  do8 do,16 re mib re mib fa sol fa sol la sib la sib do

  %31
  re4 r re, r
  sib r mib r
  do r fa r

  %34
  re r\mbreak sol r
  mib r do'8 do do do
  fa,fa fa fa do' fa, sol sol,

  %37
  do4 r sol' r
  re8 re sib sib mib mib mib mib
  sib' mib, fa fa, sib4 r

  %40
  do r do r\mbreak
  re r sol, r
  sib' sol do r8 do,

  %43
  sol4 sol' re8 mib fa[fa,]
  sib4 r8 fa' re4 r8 fa
  re4 r8 fa sib,4 do8 re

  %46
  sol,4 r8 re' sib4 r8 re\mbreak
  sib4 r8 re sol,4 r8 la
  sib do re re, sol4 r

}

IVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*31
   <6>1
   <6>
   <6>
   <6>



}


forma = {

   \key sol\minor
   \time 4/4
   \tempo 2 = 60
   s1*48
   \bar"|."

}

IVvlI = {
   \IVglobal
   %\notypeset
   <<\IVvlIn \forma>>

}

IVvlII = {
   \IVglobal
   <<\IVvlIIn \forma>>

}

IVvlIrip = {
   \IVglobal
   <<\IVvlIripn \forma>>

}

IVvlIIrip = {
   \IVglobal
   <<\IVvlIIripn \forma>>

}


IVvla = {
   \IVglobal
   \clef alto
   <<\IVvlan \forma>>

}


IVbc = {
   \IVglobal
   \clef bass
   << \IVbcn \forma \IVbfn >>
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

    systems-per-page = #3

  }

  \markup \huge {[1.] Grave}

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
      } <<

        \new PianoStaff <<

          \new Staff 	<<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"\vspace #-0.2"Concert[ante]"}
            \IvlI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"\vspace #-0.2"Concert[ante]"}
            \IvlII
          >>
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"\vspace #-0.2"Rip[ieno]"}
          \IvlIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino 2do"\vspace #-0.2"Rip[ieno]"}
          \IvlIIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"Viola"}
          \Ivla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Cembalo"\vspace #-0.2"Basso"}
          \Ibc
        >>

      >>
    }

    \layout {

      indent = 2.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

  \markup \huge {[2.] Allegro}

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
      } <<

        \new PianoStaff <<

          \new Staff 	<<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
          >>
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"violin"
          \IIvlIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlIIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIvla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IIbc
        >>

      >>
    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

  \paper  {

    systems-per-page = #6

  }

  \markup \huge {[3.] Largo}

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
      } <<

        \new PianoStaff <<

          \new Staff 	<<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"\vspace #-0.2"Concert[ante]"}
            \IIIvlI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"\vspace #-0.2"Concert[ante]"}
            \IIIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Cembalo"\vspace #-0.2"Basso"}
          \IIIbc
        >>

      >>
    }

    \layout {

      indent = 2.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

  \paper  {

    systems-per-page = #3

  }

  \markup \huge {[4.] Vivace}

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
      } <<

        \new PianoStaff <<

          \new Staff 	<<
            \set Staff.midiInstrument = #"violin"
            \IVvlI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"violin"
            \IVvlII
          >>
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"violin"
          \IVvlIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IVvlIIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IVvla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IVbc
        >>

      >>
    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

