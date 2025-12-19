\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

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

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

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
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IvlIn =  \relative do'' {

  do4 la fa r8 fa
  sol16(fa) sol(fa) sol(fa) sol(fa) fa'4 do
  la r8 fa sol16(fa) sol(fa) sol(fa) sol(fa)

  %4
  la'4 fa do r8 do
  do16 [la do la do la do la] fa' [do fa do fa do fa do]
  la'[fa la fa la fa la fa] sib4 la

  %7
  sol2\fermata\mbreak do,\p
  sib lab
  sol \fermata fa'8\f do la? fa   %%%%% ripresa

  %10
  re'32(mib fa8.) re32(mib fa8.) sol8 re si sol
  mi'?32(fa sol8.) mi32(fa sol8.) \parenthesize la8 \parenthesize mi \parenthesize dod \parenthesize la
  fa'32(sol la8.) fa32(sol la8.) sib8 fa re sib

  %13
  mi4 r8 r16 sib'\mbreak la4 sol
  fa r8 r16 sib, la4 sol
  fa r r2 %%%% fine ripresa

  %16
  R1*2
  r2 do'8\p do do do\mbreak
  re re re re re re re re

  %20
  mi mi mi mi mi mi mi mi
  fa fa fa fa fa fa fa fa
  mi mi mi mi mi mi mi mi\mbreak

  %23
  re re re re re re re re
  dod dod dod dod re re re re
  R1*6

  %31
  fa4 re\mbreak la r8 re,
  mi16(re) mi(re) mi(re) mi(re) la''4 fa
  re r8 la re la fa re

  %34
  mi'32(fa sol8.) mi32(fa sol8.) fa8 la, fa re
  mi'32(fa sol8.) mi32(fa sol8.) fa4 r8 r16 sol
  fa4 mi re  r8 r16 sol,

  %37
  fa4 mi\mbreak re r
  R1*8
  r8 mib'\p mib4 r8 mib mib4

  %47
  r8 re re4\mbreak r8 re re4
  r8 do do4 r8 do do4
  r8 sib sib4 r8 do do4

  %50
  r8 re re4 r2
  R1
  r2 re16[sib re sib re sib re sib]

  %53
  fa'[re fa re fa re fa re] sib'[fa sib fa sib fa sib fa]
  sib8 re,  mib do sib4 r
  r2 r8 do\p do4

  %56
  r2\mbreak r8 do do4
  r2 r8 re re4
  r2 r8 mi mi4

  %59
  R1*5
  fa,8 la fa la mi sol mi sol
  re fa re fa\mbreak do mi do mi

  %66
  fa4 r r2
  R1*4
  r2 fa'8\f do la fa   %%%%% ripresa

  %72
  re'32(mib fa8.) re32(mib fa8.) sol8 re si sol
  mi'?32(fa sol8.) mi32(fa sol8.) \parenthesize la8 \parenthesize mi \parenthesize dod \parenthesize la
  fa'32(sol la8.) fa32(sol la8.) sib8 fa re sib

  %75
  mi4 r8 r16 sib'\mbreak la4 sol
  fa r8 r16 sib, la4 sol
  fa\fermata r r2 %%%% fine ripresa

}

IvlIIn = \relative do'' {

  la4 fa do r8 fa
  sol16[(fa) sol(fa) sol(fa) sol(fa)] do'4 la
  fa4 r8 fa sol16[(fa) sol(fa) sol(fa) sol(fa)]

  %4
  fa'4 do la r8 la
  la16[fa la fa la fa la fa] do'[la do la do la do la]
  fa'[do fa do fa do fa do] sol'4 fa

  %7
  mi2\fermata\mbreak lab,\p
  sol fa
  mi\fermata fa'8\f do la fa

  %10
  sib32(do re8.) sib32 (do re8.) sol8 re si sol
  do32(re mi8.) do32(re mi8.) \parenthesize la8 \parenthesize mi \parenthesize dod \parenthesize la
  re32(mi fa8.) re32(mi fa8.) sib8 fa re sib

  %13
  sol'4 r8 r16 sol\mbreak  fa4 mi
  fa r8 r16 sib, fa4 mi
  fa r r2

  %16
  R1*2
  r2 la8\p la la la\mbreak
  sib sib sib sib si si si si

  %20
  do do do do dod dod dod dod
  re re re re re re re re
  do? do do do do do do do\mbreak

  %23
  sib sib sib sib sib sib sib sib
  la la la la la la la la
  R1*6

  %31
  re4 la\mbreak fa r8 re
  mi16(re) mi(re) mi(re) mi(re) fa'4 re
  la r8 la re la fa re

  %34
  dod'32(re mi8.) dod32(re mi8.) re8 la fa re
  dod'32(re mi8.) dod32(re mi8.) re4 r8 r16 mi
  re4 dod re r8 r16 mi,

  %37
  re4 dod\mbreak re r
  R1*8
  r8 sib'\p sib4 r8 do do4

  %47
  r8 la la4\mbreak r8 sib sib4
  r8 sol sol4 r8 la la4
  r8 fa fa4 r8 sol fa4

  %50
  r8 fa fa4 r2
  R1
  r2 sib16[fa sib fa sib fa sib fa]

  %53
  re'[sib re sib re sib re sib] fa'[re fa re fa re fa re]
  fa8 sib, do la sib4 r
  r2 r8 la\p la4

  %56
  r2\mbreak r8 la la4
  r2 r8 fa fa4
  r2 r8 sol sol4

  %59
  R1*5
  fa8 la fa la mi sol mi sol
  re fa re fa\mbreak do mi do mi

  %66
  fa4 r r2
  R1*4
  r2 fa'8\f do la fa

  %72
  sib32(do re8.) sib32 (do re8.) sol8 re si sol
  do32(re mi8.) do32(re mi8.) \parenthesize la8 \parenthesize mi \parenthesize dod \parenthesize la
  re32(mi fa8.) re32(mi fa8.) sib8 fa re sib

  %75
  sol'4 r8 r16 sol\mbreak  fa4 mi
  fa r8 r16 sib, fa4 mi
  fa\fermata r r2

}

Ivlan = \relative do'{

  fa4 do la r8 fa'
  sol16(fa) sol(fa) sol(fa) sol(fa) la4 fa
  do r8 fa sol16(fa) sol(fa) sol(fa) sol(fa)

  %4
  do'4 la fa r8 fa
  fa fa fa fa la la la la
  do do do do do4 do

  %7
  do2\fermata \mbreak do,\p
  mi do
  do\fermata fa8\f do la fa

  %10
  fa'8 fa fa fa sol re si sol
  sol' sol sol sol la mi dod la
  la'  la la la sib fa re sib

  %13
  do?4 r8 r16 mi\mbreak do4 do
  la r8 r16 mi' do4 do
  la r r2 % reprise

  %16
  R1*2
  r2 fa'8\p fa fa fa\mbreak
  re re re re sol sol sol sol

  %20
  sol sol sol sol la la la la
  la la la la sib? sib sib sib
  sol sol sol sol la la la la\mbreak

  %23
  fa fa fa fa sol sol sol sol
  mi mi mi mi fa fa fa fa
  R1*6

  %31
  la4 fa\mbreak re r8 re
  \parenthesize mi16(\parenthesize re) \parenthesize mi(\parenthesize re) \parenthesize mi(\parenthesize re) \parenthesize mi(\parenthesize re) re'4 la
  fa r8 la re la fa re

  %34
  la4 la re'8 la fa re
  la4 la re r8 r16 dod'
  la4 la fa r8 r16 dod

  %37
  la4 la\mbreak fa4 r
  R1*14
  r2 fa'8 fa fa fa

  %53
  sib sib sib sib re re re re
  re fa, sol fa fa4 r
  r2 r8 fa\p fa4

  %56
  r2\mbreak r8 fa fa4
  r2 r8 sib, sib4
  r2 r8 do do4

  %59
  R1*5
  fa8 la fa la mi sol mi sol
  re fa re fa\mbreak do mi do mi

  %66
  fa4 r r2
  R1*4
  r2 fa8\f do la fa

  %72
  fa'8 fa fa fa sol re si sol
  sol' sol sol sol la mi dod la
  la'  la la la sib fa re sib

  %75
  do?4 r8 r16 mi\mbreak do4 do
  la r8 r16 mi' do4 do
  la\fermata r r2

}

Ivcn = \relative do{

  fa4 fa, fa r8 fa'
  sol16[(fa) sol(fa) sol(fa) sol(fa)] fa4 fa,
  fa r8 fa' sol16[(fa) sol(fa) sol(fa) sol(fa)]

  %4
  fa4 fa, fa r8 fa'
  fa fa fa fa fa fa fa fa
  fa fa fa fa mi4 fa

  %7
  do2\fermata \mbreak do8\p do do do
  do do do do do do do do
  do2\fermata fa8\f do la? fa %%%% ripresa

  %10
  sib sib sib sib sol' re si sol
  do do do do la' mi dod la
  re re re re sib' fa re sib

  %13
  do?4 r8 r16 do\mbreak fa4 do
  fa r8 r16 do fa4 do
  fa16 la la do do la la fa fa la la do do la la fa

  %16
  mi32(fa sol8.) sol32(la sib8.) sib32(do re8.) re32(do sib8.)
  la16 fa fa la la do do fa fa8 do la fa
  do,4 r8 do'' la16 fa fa la la do do la\mbreak

  %19
  sib fa fa sib sib re re si si sol sol si si re re si
  do sol sol do do mi mi dod dod la la dod dod mi mi dod
  re la la re re fa fa la,sib? sol sol sib sib re re sib

  %22
  do? sol sol do do mi mi sol, la fa fa la la do do la\mbreak
  sib fa fa sib sib re re fa, sol mi mi sol sol sib sib la
  la dod dod mi mi sol, sol fa fa8 re r la'

  %25
  re16 sib sol re' do? la fa do' sib sol mi sib' la fa re la'
  sol mi dod sib' la sol fa mi fa re la' fa re' la fa' re\mbreak
  mi8 la, r la sib16 sol, sol sib' la fa, fa la'

  %28
  sol mi, mi sol' fa re, re fa' mi8 la, r la'
  re16 dod re dod re dod re dod re la re dod re dod re dod
  re la re dod re dod re dod re la fa re la'8 la,

  %31
  re4\tu re\mbreak re4 r8 re
  \parenthesize mi16(\parenthesize re) \parenthesize mi(\parenthesize re) \parenthesize mi(\parenthesize re) \parenthesize mi(\parenthesize re) re4 re
  re r8 la' re la fa re

  %34
  la4 la re'8 la fa re
  la4 la re r8 r16 la
  re4 la re r8 r16 la

  %37
  re4 la\mbreak re4 r8 re'\solo
  dod16 si la4 sol8 fa16 mi re4 re'8
  dod16 si la4 mi'8 fa16 mi re4 la8

  %40
  sib?16 la sol4 do?8 la16 sol fa4 mib'8
  do16 sib la4 \parenthesize re8 sib16 la sol4 re8
  mib16 re do4 fa8 re16 do sib8 r16 sib' do sib\mbreak

  %43
  re, sib' do sib re, sib' do sib mib,4 r16 do' re do
  mi,! do' re do mi, do' re do fa,4 r16 re' mib re
  fad, re' mib re fad, re' mib re sol,4 r16 mib' fa mib

  %46
  mib? mib fa mib mib mib fa mib! la, la sib la la la sib la
  re re mib re re re mib re\mbreak sol, sol la sol sol sol la sol
  do do re do do do re do fa, fa sol fa fa fa sol fa

  %49
  sib sib do sib sib sib do sib mib, mib fa mib mib mib fa mib
  re8 sib r fa' sol16 sol la sol sol sol la sol
  mib'[re mib re do sib la sol]\mbreak fa sol la sib do re mib do

  %52
  re8 sib mib, fa sib, sib sib sib
  sib sib sib sib sib sib sib sib
  sib sib mib fa sib,4 r8 fa'

  %55
  la sol16 fa re'8 re re do r do
  sib16 la sol fa mi? re' do sib\mbreak la sol fa8 r do'
  la sol16 fa mib'8 mib mib re r re

  %58
  sib la16 sol re'8 fa, fa\tr mi? r sol
  la32(sib do8.) la32(sib do8.) do,32(re mib8.) do32(re mib8.)
  re8 sib re fa sib32(do re8.) sib32(do re8.)\mbreak

  %61
  re,32(mi? fa8.) re32(mi fa8.) mi8 do mi sol
  la16 fa' fa fa fa mi re do sib mi mi mi mi re do sib
  la re re re re do sib la sol do do do do sib la sol

  %64
  la fa' fa fa la, fa' fa fa sol, mi' mi mi sol, mi' mi mi
  fa, re' re re fa, re' re re\mbreak mi, do' do do mi, do' do sib
  la8 fa fa\tr mi16 re mi8 sol sol\tr fa16 mi

  %67
  fa8 la la8\tr sol16 fa sol8 sib sib\tr la16 sol
  la8 fa la do fa do la fa
  sib, sib' do, do' fa,16 sol la sib do sib la sol

  %70
  fa sol la sib do sib la sol fa8 re' do16 sib la sol]
  la8 sol16 fa mi4\tr fa8\f do la? fa %%%% ripresa
  sib sib sib sib sol' re si sol

  %73
  do do do do la' mi dod la
  re re re re sib' fa re sib
  do?4 r8 r16 do\mbreak fa4 do

  %76
  fa r8 r16 do fa4 do
  fa4\fermata r r2

}

Ibcn = \relative do {

  fa4 fa, fa r8 fa'
  sol16[(fa) sol(fa) sol(fa) sol(fa)] fa4 fa,
  fa r8 fa' sol16[(fa) sol(fa) sol(fa) sol(fa)]

  %4
  fa4 fa, fa r8 fa'
  fa fa fa fa fa fa fa fa
  fa fa fa fa mi4 fa

  %7
  do2\fermata \mbreak do8\p do do do
  do do do do do do do do
  do2\fermata fa8\f do la? fa %%%% ripresa

  %10
  sib sib sib sib sol' re si sol
  do do do do la' mi dod la
  re re re re sib' fa re sib

  %13
  do?4 r8 r16 do\mbreak fa4 do
  fa r8 r16 do fa4 do
  fa8 fa fa fa fa fa fa fa %%% ripresa

  %16
  do do do do do do do do
  fa fa fa fa fa fa fa fa
  do, do do do fa' fa fa fa\mbreak

  %19
  sib, sib sib sib sol' sol sol sol
  do, do do do la' la la la
  re, re re re sol sol sol sol

  %22
  do, do do do fa fa fa fa\mbreak
  sib, sib sib sib mi mi mi mi
  la, la la la re re re re

  %25
  sib' sol la fa sol mi fa re
  mi dod la dod re mi fa re\mbreak
  la la' fa re sol,4 fa

  %28
  mi re la'8 la' fa mi
  re4 r re r
  re r re8 re la' la,

  %31
  re4 re\mbreak re4 r8 re
  \parenthesize mi16(\parenthesize re) \parenthesize mi(\parenthesize re) \parenthesize mi(\parenthesize re) \parenthesize mi(\parenthesize re) re4 re
  re r8 la' re la fa re

  %34
  la4 la re'8 la fa re
  la4 la re r8 r16 la
  re4 la re r8 r16 la

  %37
  re4 la\mbreak re4 r8 re
  la si dod la re mi fa  mi
  la, si dod la re mi fa re

  %40
  sol fa mi do? fa sol la sol
  fad mi fad re sol, la sib sol
  do sib la fa sib do re sib\mbreak

  %43
  re4 re mib8 mib, mib4
  mi'! mi fa8 fa, fa4
  fad' fad sol8 sol, sol4

  %46
  sol' sol fa? fa
  fa fa\mbreak mib mib
  mib? mib re re

  %49
  re re do do
  sib sib mib? mib
  do do\mbreak fa fa

  %52
  sib,8 sib' mib, fa sib, sib sib sib
  sib sib sib sib sib sib sib sib
  sib sib mib fa sib,4 r8 fa'

  %55
  fa fa fa fa fa fa, r fa'
  sol sol do, do\mbreak fa fa, r fa'
  fa fa fa fa sib sib, r sib

  %58
  sib sib si si do do, r do'
  fa la, fa' la, la fa la fa
  sib4 r sol'8 sib, sol' sib,\mbreak

  %61
  si sol si sol do4 r
  fa8 la la la sol sol sol sol
  fa fa fa fa mi mi mi mi

  %64
  fa4 r r2
  R1
  fa8 mi re sib do re mi do

  %67
  re mi fa re mi fa sol mi
  fa4 r fa r
  do8 do do do fa4 r

  %70
  fa r fa8 sib, do do,
  fa fa do' do fa,\f do' la fa %%%% ripresa
  sib sib sib sib sol' re si sol

  %73
  do do do do la' mi dod la
  re re re re sib' fa re sib
  do?4 r8 r16 do\mbreak fa4 do

  %76
  fa r8 r16 do fa4 do
  fa4\fermata r r2

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 57
  s1*77
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

Ivla = {
  \Iglobal
  \clef alto
  <<\Ivlan \forma>>

}

Ivc = {
  \Iglobal
  \clef bass
  <<\Ivcn \forma>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIvlIn =  \relative do'' {

  fa2\p mi
  sol fad
  sol~sol8 fa mi4

  %4
  re2 fa
  mi\mbreak sol
  fad sol

  %7
  sol la4 sol
  la1
  sol

  %10
  la~
  la
  sol

  %13
  fa2~ fa4 mi
  fa2 mi
  sol fad

  %16
  sol~sol8 fa mi4
  re2\fermata r

}

IIvlIIn = \relative do'' {

  re2\p dod~
  dod do
  sib dod8 re4 dod8

  %4
  re1
  dod
  do!2 sib

  %7
  do1~
  do~
  do~

  %10
  do2 re
  dod re
  re dod

  %13
  re~re4 dod
  re2\p dod~
  dod do

  %16
  sib dod8 re4 dod8
  re2\fermata r

}

IIvlan = \relative do'{

  la'2\p dod~
  dod la4. fad8
  re4. sib'8 mi,fa? la la

  %4
  fa2 la
  dod~dod4 la
  la4. fad8 re2

  %7
  mi fa?4 mi
  do2 fa
  mi1

  %10
  fa
  mi2 fa
  sib mi,4. dod'8

  %13
  la1
  la2\p dod~
  dod la4. fad8

  %16
  re4. sib'8 mi,fa? la la
  fa2\fermata r

}

IIvcn = \relative do {

  re8\p re re re la la la la
  la la la la re re re re
  sol sol sol sol la re, la' la,

  %4
  re2 \terzine\senza \tuplet 3/2 { re16\upl re'(do sib[la sol)] fa\upl la(sol fa[mi re)] }
  \tuplet 3/2 { la(si dod) dod[(re mi)] mi(fa sol) sol[(fa mi)] dod(re mi) mi[(fa sol)] sol(fa mi) dod[(si la)] }
  \tuplet 3/2 { re(mi fad) fad[(sol la)] la[(sol fad)] fad(mi re) sol[(la sib?)] sib(do re) re[(do sib)] sib(la sol) }

  %7
  \tuplet 3/2 { do,(re mi) mi[(fa sol)] sol(la sib) sib[(la sol)] la\upl do(sib la[sol fa)] sol\upl sib(la sol[fa mi)]}
  fa4 r8 fa\mbreak \tuplet 3/2 { do'16(sib la) la[(sol fa)] do'(sib la) la[(sol fa)] }
  sol8 do, r sol' \tuplet 3/2 { mi16(fa sol) sol[(la sib)] sib(la sol) sol[(fa mi)] }

  %10
  la8 fa r la\tuplet 3/2 { re,16\upl re'(do sib[la sol)] fa\upl la(sol fa[mi re)] }
  \tuplet 3/2 { la\upl la'(sol fa[mi re)] dod\upl sib'(la sol[fa mi)] } fa8 re r la'
  \tuplet 3/2 { sib16\upl re(do sib[la sol)] sib\upl re(do sib[la sol)]  dod\upl mi(re dod[si? la)] dod\upl mi(re dod[si! la)] }

  %13
  \tuplet 3/2 { re\upl la(sol fa[mi re)] re'\upl la(sol fa[mi re)] } re'8 re,16 mi mi4\tr
  re8\p re re re la la la la
  la la la la re re re re

  %16
  sol sol sol sol la re, la' la,
  re2\fermata r

}

IIbcn = \relative do {

  re8\p re re re la la la la
  la la la la re re re re
  sol sol sol sol la re, la' la,

  %4
  re2 re8 re re re
  la la la la\mbreak la la la la
  re re re re sol sol sol sol

  %7
  do, do do do fa fa re re
  fa fa fa fa\mbreak fa fa fa fa
  do do do do do do do do

  %10
  fa fa fa fa re re re re
  la la la la\mbreak re re re re
  sol sol sol sol la la la la

  %13
  re, re re re re re la la
  re\p re re re la la la la
  la la la la re re re re

  %16
  sol sol sol sol la re, la' la,
  re2\fermata r

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key fa\major
  \time 4/4
  \tempo 4 = 35
  s1*17
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

IIvc = {
  \IIglobal
  \clef bass
  <<\IIvcn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn =  \relative do'' {

  fa,8
  do'[do do re]
  do [do do fa]
  do[do do re]

  %4
  sib [sib sib sol']
  sib,[sib sib do]
  la4 r8 do

  %7
  si[si si re]
  do[do do mi]
  re[re re fa]

  %10
  mi[mi mi sol]\mbreak
  re[re re fa]
  mi[do re si]

  %13
  do4 r8 sol'
  dod,[dod dod mi]
  la,[la la sol']

  %16
  sol4. fa16 mi
  fa8 re r fa
  si,[si si re]

  %19
  sol,[sol sol fa']
  fa4. mi16 re
  mi8 do r do\mbreak

  %22
  do[sib?16 la fa'8 fa]
  do[sib16 la fa'8 fa]
  fa[mi16 re do8 sib]

  %25
  la4 sol
  fa r %%%% ripresa
  R2*24

  %51
  sol'8[sol sol la]
  sol[sol sol do]
  sol[sol sol la]

  %54
  fa[fa fa sol]
  mi[mi mi fa]
  re4 r8 re

  %57
  mi[re16 do sol'8 sol]
  mi[re16 do sol'8 sol]
  do[mi, fa re]\mbreak

  %60
  do4 r
  R2*23
  re8[re re sib']

  %85
  re,[re re sib']
  do, [do do re]
  do[do do fa]\mbreak

  %88
  sib,[sib sib sol']
  sib,[sib sib sol']
  la, fa r4

  %91
  R2*22
  la8\p[la la la]
  sib[sib sib sib]

  %115
  sol[sol sol sol]
  la[la la la]
  fa[fa fa fa]

  %118
  sol[sol sol sol]
  mi[mi mi mi]\mbreak
  fa[fa fa fa]

  %121
  fa4 r
  do8[do do do]
  fa4 r8 fa

  %124
  do'[do do re]
  do [do do fa]
  do[do do re]

  %127
  sib [sib sib sol']
  sib,[sib sib do]
  la4 r8 do

  %130
  si[si si re]
  do[do do mi]
  re[re re fa]

  %133
  mi[mi mi sol]\mbreak
  re[re re fa]
  mi[do re si]

  %136
  do4 r8 sol'
  dod,[dod dod mi]
  la,[la la sol']

  %139
  sol4. fa16 mi
  fa8 re r fa
  si,[si si re]

  %142
  sol,[sol sol fa']
  fa4. mi16 re
  mi8 do r do\mbreak

  %145
  do[sib?16 la fa'8 fa]
  do[sib16 la fa'8 fa]
  fa[mi16 re do8 sib]

  %148
  la4 sol
  fa\fermata r

}

IIIvlIIn = \relative do'' {

  fa,8
  la[la la sib]
  la[la la do]
  la[la la la]

  %4
  sol[sol sol sib]
  sol[sol sol la]
  fa4 r8 la

  %7
  sol[sol sol si]
  sol[sol sol do]
  si[si si re]

  %10
  do[do do mi]\mbreak
  si[si si do]
  do[mi, fa re]

  %13
  mi4 r8 sol'
  dod,[dod dod mi]
  la,[la la sol']

  %16
  sol4. fa16 mi
  fa8 re r fa
  si,[si si re]

  %19
  sol,[sol sol fa']
  fa4. mi16 re
  mi8 do r do\mbreak

  %22
  la[sol16 fa do'8 do]
  la[sol16 fa do'8 do]
  fa[mi16 re do8 sib]

  %25
  la4 sol
  fa r %%%% ripresa
  R2*24

  %51
  mi'8[mi mi fa]
  mi[mi mi mi]
  mi[mi mi mi]

  %54
  re[re re re]
  do[do do do]
  si4 r8 si

  %57
  do[sol mi' mi]
  do[sol mi' mi]
  sol[do, re si]\mbreak

  %60
  do4 r
  R2*23
  sib8[sib sib sib]

  %85
  sib[sib sib sib]
  la[la la la]
  la[la la la]\mbreak

  %88
  sol[sol sol sol]
  sol[sol sol sol]
  fa do r4

  %91
  R2*22
  la'8\p[la la la]
  sib[sib sib sib]

  %115
  sol[sol sol sol]
  la[la la la]
  fa[fa fa fa]

  %118
  sol[sol sol sol]
  mi[mi mi mi]\mbreak
  fa[fa fa fa]

  %121
  fa4 r
  do8[do do do]
  fa4 r8 fa

  %124
  la[la la sib]
  la[la la do]
  la[la la la]

  %127
  sol[sol sol sib]
  sol[sol sol la]
  fa4 r8 la

  %130
  sol[sol sol si]
  sol[sol sol do]
  si[si si re]

  %133
  do[do do mi]\mbreak
  si[si si do]
  do[mi, fa re]

  %136
  mi4 r8 sol'
  dod,[dod dod mi]
  la,[la la sol']

  %139
  sol4. fa16 mi
  fa8 re r fa
  si,[si si re]

  %142
  sol,[sol sol fa']
  fa4. mi16 re
  mi8 do r do\mbreak

  %145
  la[sol16 fa do'8 do]
  la[sol16 fa do'8 do]
  fa[mi16 re do8 sib]

  %148
  la4 sol
  fa\fermata r

}

IIIvlan = \relative do'{

  r8
  fa[fa fa fa]
  fa[fa fa fa]
  fa[fa fa fa]

  %4
  mi[mi mi mi]
  mi[mi mi mi]
  do[do do do]

  %7
  si[si si si]
  do[do do do]
  sol'[sol sol sol]

  %10
  sol[sol sol sol]\mbreak
  sol[sol sol sol]
  sol,[sol la sol]

  %13
  sol[sol sol sol]
  mi'[mi mi mi]
  mi[mi mi mi]

  %16
  dod[dod dod  dod]
  la[la la la]
  sol[sol re' re]

  %19
  re[re re re]
  si[si si si]
  sol[sol sol sol]\mbreak

  %22
  la[la la la]
  la[la la la]
  do4 r

  %25
  fa mi
  fa r % ripresa
  R2*24

  %51
  sol8[sol sol sol]
  sol8[sol sol sol]
  sol8[sol sol sol]

  %54
  si[si si si]
  sol[sol sol la]
  re,[re re si']

  %57
  sol8[sol sol sol]
  sol8[sol sol sol]
  sol[sol la sol]\mbreak

  %60
  mi4 r
  R2*23
  fa8[fa fa fa]

  %85
  fa8[fa fa fa]
  fa8[fa fa fa]
  fa8[fa fa fa]\mbreak

  %88
  mi[mi mi mi]
  do[do do do]
  do la r4

  %91
  R2*22
  la8\p[la la la]
  sib[sib sib sib]

  %115
  sol[sol sol sol]
  la[la la la]
  fa[fa fa fa]

  %118
  sol[sol sol sol]
  mi[mi mi mi]\mbreak
  fa[fa fa fa]

  %121
  fa4 r
  do8[do do do]
  fa4 r8 fa

  %124
  fa'[fa fa fa]
  fa[fa fa fa]
  fa[fa fa fa]

  %127
  mi[mi mi mi]
  mi[mi mi mi]
  do[do do do]

  %130
  si[si si si]
  do[do do do]
  sol'[sol sol sol]

  %133
  sol[sol sol sol]\mbreak
  sol[sol sol sol]
  sol,[sol sol sol]

  %136
  sol[sol sol sol]
  mi'[mi mi mi]
  mi[mi mi mi]

  %139
  dod[dod dod  dod]
  la[la la la]
  sol[sol re' re]

  %142
  re[re re re]
  si[si si si]
  sol[sol sol sol]\mbreak

  %145
  la[la la la]
  la[la la la]
  do4 r

  %148
  fa mi
  fa\fermata r

}

IIIvcn = \relative do{

  r8
  fa[fa fa fa]
  fa[fa fa fa]
  fa[fa fa fa]

  %4
  sol[sol sol sol]
  do,[do do do]
  fa[fa fa fa]

  %7
  sol,[sol sol sol]
  sol[sol sol sol]
  sol[sol sol sol]

  %10
  sol[sol sol sol]\mbreak
  sol[sol sol sol]
  do[do fa, sol]

  %13
  do[do do sib?]
  la[la la la]
  dod[dod dod dod]

  %16
  la[la la la]
  re[re re re]
  sol,[sol sol sol]

  %19
  si[si si si]
  sol[sol sol sol]
  do[do do do]\mbreak

  %22
  fa[fa fa fa]
  fa[fa fa fa]
  fa4 r

  %25
  fa do
  fa r8 do'
  fa,4~fa16 sol la sib

  %28
  do8[do do re]
  sib4~sib16 la sib do
  la8[fa fa la]

  %31
  fa'16 fa fa fa la, fa' fa fa
  sol, fa' fa fa sol, fa' fa fa\mbreak
  sol, mi' mi mi sol, mi' mi mi

  %34
  fa, mi' mi mi fa, mi' mi mi
  fa, re' re re fa, re' re re
  mi, re' re re mi, re' re re

  %37
  mi, do' do do mi, do' do do
  re, do' do do re, do' do do
  re, si' si si re, si' si si\mbreak

  %40
  do8 do, r do'16 re
  si8 si16 do la8 la16 si
  sol8 sol16 la fa8 fa16 sol

  %43
  mi8 mi16 fa re8 re16 mi
  do sol do sol mi' do mi do
  sol' mi sol mi do' sol do sol

  %46
  mib'2~
  mib8[re16 do re8 si?]
  do[mi,? re do]\mbreak

  %49
  mib'2~
  mib8[re16 do re8 si?]
  do[do, do do]

  %52
  do[do do do]
  do[do do do]
  re[re sol, sol]

  %55
  do[do do fa]
  sol[sol sol sol]
  do,[do do do]

  %58
  do[do do do]
  do[do fa sol]\mbreak
  do4\solo~do16\tr si do re

  %61
  si la sol4 re'8
  si16 do re mi fa8 re
  mi do r mi

  %64
  la,16 dod si dod la4
  r16 dod si dod la sib? sol la
  fa la sol la re,4

  %67
  r16 la' sol la re la sol la
  sib8[la16 sol re'8 sol,]\mbreak
  fad re r re'~

  %70
  re8 mib4 sol,8~
  sol fad4 do'8~
  do si4 fa?8~

  %73
  fa mi?4 sib'?8~
  sib la4 mib8
  re[sib16 do re mib? fa sol]

  %76
  lab4. sol16 fa
  sol8[do,16 re mib fa sol la]\mbreak
  sib4. la16 sol

  %79
  la fa mib'4 re16 do
  re(sib8.) do16(la8.)
  sib16(fa8.) re'16(sib8.)

  %82
  la16(fa8.) mib'16(do8.)
  re8[do16 sib do8 sib]
  sib,8\tu[sib sib sib]

  %85
  sib[sib sib sib]
  fa'[fa fa fa]
  fa[fa fa fa]\mbreak
  sol[sol sol sol]

  %89
  mi[mi mi mi]
  fa r r fa\solo
  do'16 la sol fa do' la sol fa

  %92
  sib8 la4 fa8
  re' do4 fa,8
  mi16 fa sol la sib re do sib

  %95
  la8 fa r do'
  fa,16(mi fa8) fa16(mi fa8)\mbreak
  mib16(re mib8) mib16(re mib8)

  %98
  re4 r8 re'
  sol,16(fa sol8) sol16(fa sol8)
  fa16(mi? fa8) fa16(mi fa8)

  %101
  mi4 r8 do
  la16[(sib do re mi fa sol la)]
  sib,[(do re mi fa sol la sib)]

  %104
  do,[(re mi fa sol la sib do)]
  re,[(mi fa sol la sib do re)]\mbreak
  mi,(sol do8) mi,16(sol do8)

  %107
  fa,16(la do8) fa,16(la do8)
  mi,16(sol do8) mi,16(sol do8)
  fa,16 fa sol sol la la sib sib

  %110
  sol sol la la sib sib do do
  la la sib sib do do re re
  sib sib do do re re mi mi\mbreak

  %113
  fa fa do do fa fa do do
  re re sib sib re re sib sib
  mi mi sib sib mi mi sib sib

  %116
  do do la la do do la la
  re re la la re re la la
  sib sib sol sol sib sib sol sol

  %119
  do do sol sol do do sol sol\mbreak
  fa fa la la do do la la
  fa'8[do la fa]

  %122
  do4 sol'\tr
  fa2
  fa8[fa fa fa]

  %125
  fa[fa fa fa]
  fa[fa fa fa]
  sol[sol sol sol]

  %128
  do,[do do do]
  fa[fa fa fa]
  sol,[sol sol sol]

  %131
  sol[sol sol sol]
  sol[sol sol sol]
  sol[sol sol sol]\mbreak

  %134
  sol[sol sol sol]
  do[do fa, sol]
  do[do do sib?]

  %137
  la[la la la]
  dod[dod dod dod]
  la[la la la]

  %140
  re[re re re]
  sol,[sol sol sol]
  si[si si si]

  %143
  sol[sol sol sol]
  do[do do do]\mbreak
  fa[fa fa fa]

  %146
  fa[fa fa fa]
  fa4 r
  fa do

  %149
  fa\fermata r

}

IIIbcn = \relative do {

  r8
  fa[fa fa fa]
  fa[fa fa fa]
  fa[fa fa fa]

  %4
  sol[sol sol sol]
  do,[do do do]
  fa[fa fa fa]

  %7
  sol,[sol sol sol]
  sol[sol sol sol]
  sol[sol sol sol]

  %10
  sol[sol sol sol]\mbreak
  sol[sol sol sol]
  do[do fa, sol]

  %13
  do[do do sib?]
  la[la la la]
  dod[dod dod dod]

  %16
  la[la la la]
  re[re re re]
  sol,[sol sol sol]

  %19
  si[si si si]
  sol[sol sol sol]
  do[do do do]\mbreak

  %22
  fa[fa fa fa]
  fa[fa fa fa]
  fa4 r

  %25
  fa do
  fa r %%%%%%%% fine ripresa
  fa fa

  %28
  mi mi
  do do
  fa fa

  %31
  fa fa
  sib, sib\mbreak
  do do

  %34
  la la
  sib sib
  sol sol

  %37
  la la
  fa fa
  sol sol\mbreak

  %40
  la8[la do la]
  sol2~
  sol~

  %43
  sol
  do4 do
  do do

  %46
  do8[re mib re]
  do4 r8 sol
  do4 r\mbreak

  %49
  do8[re mib re]
  do4 r8 sol
  do[do do do]

  %52
  do[do do do]
  do[do do do]
  re[re sol, sol]

  %55
  do[do do fa]
  sol[sol sol sol]
  do,[do do do]

  %58
  do[do do do]
  do[do fa sol]\mbreak
  do,4 do

  %61
  sol' sol,
  sol sol
  do8[re mi re]

  %64
  dod4 r8 dod
  la4 r8 la
  re4 r8 re

  %67
  re4 r8 re
  sol,4 r8 sol\mbreak
  re'[mi fad re]

  %70
  sol8 r do, r
  sib r la r
  re r sol r

  %73
  sol, r do r
  fa r la, r
  sib4 r

  %76
  sib8 [do re sib]
  mib4\mbreak  r
  mi!8[re mi do]

  %79
  fa[sol la fa]
  sib,[re fa fa,]
  sib[do re sib]

  %82
  fa'[sol la fa]
  sib[re, mib fa]
  sib,8 [sib sib sib]

  %85
  sib[sib sib sib]
  fa'[fa fa fa]
  fa[fa fa fa]\mbreak

  %88
  sol[sol sol sol]
  mi[mi mi mi]
  fa[sol la fa]

  %91
  fa4 fa
  fa fa
  fa fa

  %94
  do do
  fa8[sol la fa]
  la,4 la\mbreak

  %97
  la la
  sib8[do re sib]
  si4 si

  %100
  si? si
  do8[re mi do]
  la2

  %103
  sib?
  do
  re\mbreak

  %106
  do4 do
  fa fa
  do do

  %109
  fa r
  sol r
  la r

  %112
  sib r\mbreak
  R2*11
  fa8[fa fa fa]

  %125
  fa[fa fa fa]
  fa[fa fa fa]
  sol[sol sol sol]
  do,[do do do]

  %129
  fa[fa fa fa]
  sol,[sol sol sol]
  sol[sol sol sol]

  %132
  sol[sol sol sol]
  sol[sol sol sol]\mbreak
  sol[sol sol sol]

  %135
  do[do fa, sol]
  do[do do sib?]
  la[la la la]

  %138
  dod[dod dod dod]
  la[la la la]
  re[re re re]

  %141
  sol,[sol sol sol]
  si[si si si]
  sol[sol sol sol]

  %144
  do[do do do]\mbreak
  fa[fa fa fa]
  fa[fa fa fa]

  %147
  fa4 r
  fa do
  fa\fermata r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key fa\major
  \time 2/4
  \tempo 2 = 55
  \partial 8 s8
  s2*149
  \bar"|."


}

IIIvlI = {
  \IIIglobal
  %\notypeset
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

IIIvc = {
  \IIIglobal
  \clef bass
  <<\IIIvcn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] [Allegro]"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
            \IvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
            \IvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"[Viola]"}
          \Ivla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Violoncello"}
          \Ivc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"harpsichord"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \Ibc

        >>
      >>
  }

  \layout {

    indent = 1.6\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[2.] Larghetto"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIvla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IIvc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"harpsichord"
          \IIbc

        >>
      >>
  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[2.] All[egr]o"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IIIvc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"harpsichord"
          \IIIbc

        >>
      >>
  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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



