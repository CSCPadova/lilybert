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

  fa,16 [la do re do sib la sol ] fa[la do fa mi re do sib]
  la[do fa la sol fa mi re] do8[la16 do fa do re sib]
  la8[la16 do fa do re sib] la fa la do la fa la si

  %4
  do4 r do,16 mi sol la sol fa mi re
  do mi sol do si la sol fa\mbreak mi[sol do mi re do si la]
  sol 8[mi16 sol do sol la fa] mi8[mi16 sol do sol la fa]

  %7
  mi do mi fa sol mi sol la sib? sol sib do re sib la sol
  la8 fa r4 la16 fa la re sib4\tr
  la16 fa la re sib4\tr la16 fa la re sib4\tr

  %10
  la r mi'16 do mi la fa4\tr \mbreak
  mi16 do mi la fa4\tr mi16 do mi la fa4\tr
  mi r4 fa8 fa4 fa8~

  %13
  fa fa4 fa fa fa8
  fa4 r sol8 sol4 sol8~
  sol sol4 sol sol sol8

  %16
  sol4 r la8 la4 la8~\mbreak
  la la4 la la la8
  la4 r sib!8 r16 la[sol fa mi re]

  %19
  dod8 r16 sib[la sol fa mi] fa re la'8 sol16 mi sol8
  fa16 re la'8 sol16 mi sol8 fa16[la si dod re mi fa sol]
  la8 fa sol mi re,16 fa la sib? la sol fa mi

  %22
  re fa la re dod si la sol\mbreak fa la re fa mi re dod si
  la8[fa16 la re la sib? sol] fa8[fa16 la re la sib sol]
  fa re fa la re la re fa mi8 la,r4

  %25
  fad'8 fad4 fad fad fad8
  sol sol, r4 sold'8 sold4 sold8~
  sold sold?4 sold8\mbreak la la, r4

  %28
  mi'16(re mi8)  mi16(re mi8) re16(do re8) re16(do re8)
  do16(si do8) do16(si do8) si16(la si8) si16(la si8)
  do16 mi la mi re si do re do mi la mi re si do re

  %31
  do mi la mi re si do re do8 la r4
  sib?16 re sol re do la sib do\mbreak sib re sol re do la sib do
  sib re sol re do la sib do sib8 sol r4

  %34
  la16 do fa do sib sol la sib la do fa do sib sol la sib
  la do fa do sib sol la sib la8 fa r fa'~
  fa fa4 fa fa fa8~

  %37
  fa fa4 fa 8 fa4 r
  sol8 sol4 sol sol sol8~
  sol sol4 sol8 sol4 r

  %40
  la8 la4 la la la8~
  la la4 la8 la4 r
  sib8 r16 la[sol fa mi re]\mbreak mi8 r16 re[do sib la sol]

  %43
  la8 r16 sol[fa mi re do] re4 r8 sib''16\p fa
  mi8 do r sib'16 sol la8 fa r la16 fa
  mi8 do r sol'16 mi fa4 r

  %46
  fa,16\f[la do re do sib la sol] fa[la do fa mi re do sib]
  la[do fa la sol fa mi re]\mbreak do4 r16 la do re
  fa do fa sol la fa la sib do8 fa, sib, do

  %49
  fa,4 r fa16[la do re do sib la sol]  %%%%%%%OK bar 49
  fa[la do re do sib la sol] fa8 fa' sib, do
  fa,1\fermata

}

IvlIIn = \relative do'' {

  fa,16 [la do re do sib la sol ] fa[la do fa mi re do sib]
  la[do fa la sol fa mi re] do8[la16 do fa do re sib]
  la8[la16 do fa do re sib] la fa la do la fa la si

  %4
  do4 r do,16 mi sol la sol fa mi re
  do mi sol do si la sol fa\mbreak mi[sol do mi re do si la]
  sol 8[mi16 sol do sol la fa] mi8[mi16 sol do sol la fa]

  %7
  mi do mi fa sol mi sol la sib? sol sib do re sib la sol
  la8 fa r4 fa16 do fa la sol4\tr
  fa16 do fa la sol4\tr fa16 do fa la sol4\tr

  %10
  fa r do'16 sol do mi re4\tr \mbreak
  do16 sol do mi re4\tr  do16 sol do mi re4\tr
  do r fa8 fa4 fa8~

  %13
  fa mib4 mib mib re16 do
  re4 r sol8 sol4 sol8~
  sol fa4 fa fa mi?16 re

  %16
  mi4 r la8 la4 la8~\mbreak
  la8 sol4 sol sol fa16 mi
  fa4 r sol8 r16 fa[mi re dod si]

  %19
  la8 r16 sol[fa mi re dod] re la fa'8 mi16 dod mi8
  re16 la fa'8 mi16 dod mi8 re16[fa sol la si dod re mi]
  fa8 re mi dod re,16 fa la sib? la sol fa mi

  %22
  re fa la re dod si la sol\mbreak fa la re fa mi re dod si
  la8[fa16 la re la sib? sol] fa8[fa16 la re la sib sol]
  fa re fa la re la re fa mi8 la,r4

  %25
  do8 do4 do do do8
  sib sol r4 re'8 re4 re8~
  re re4 re8 do la r4

  %28
  do16 si do8 do16 si do8 si16 la si8 si16 la si8
  la16 sold la8 la16 sold la8 sold16 fad sold8 sold16 fad sold8
  la16 do mi do si sold la si la do mi do si sold la si

  %31
  la do mi do si sold la si la8 mi r4
  sol?16 sib? re sib la fad sol la\mbreak sol sib re sib la fad sol la
  sol sib re sib la fad sol la sol8 re r4

  %34
  fa?16 la do la sol mi fa sol fa la do la sol mi fa sol
  fa la do la sol mi fa sol fa8 do r fa'~
  fa fa4 fa mib mib8~\mbreak

  %37
  mib mib?4 re16 do re4 r
  sol8 sol4 sol fa fa8~
  fa fa4 mi16 re mi4 r

  %40
  la8 la4 la sol sol8~
  sol sol4 fa16 mi fa4 r
  sol8 r16 fa[mi re do sib]\mbreak sol'8 r16 fa[mi re do sib]

  %43
  do8 r16 sib[la sol fa mi] fa4 r8 fa'16\p re
  do8 sol r sol'16 mi fa8 do r fa16 do
  do8 sol r mi'16 do la4 r

  %46
  fa16\f[la do re do sib la sol] fa[la do fa mi re do sib]
  la[do fa la sol fa mi re]\mbreak do4 r16 la do re
  fa do fa sol la fa la sib do8 fa, sib, do

  %49
  fa,4 r fa16[la do re do sib la sol]  %%%%%%%OK bar 49
  fa[la do re do sib la sol] fa8 fa' sib, do
  fa,1\fermata

}

Ivlan = \relative do' {

  la8 la' sol mi do la' sol mi
  do la' mi sol la la la sol
  do, la' la sol do, do do fa

  %4
  mi4 r sol,8 mi' re si
  sol mi' re si\mbreak sol mi' si[re]
  mi mi mi re sol, mi' mi re

  %7
  sol,4 mi' sol mi
  do r do8 la do do
  do la do do do la do do

  %10
  do4 r mi8 mi sol sol\mbreak
  sol mi sol sol sol mi sol sol
  sol4 r la8 la4 la8~

  %13
  la la4 la la la8
  fa4 r si8 si4 si8~
  si si4 si si si8

  %16
  sol4 r dod8 dod4 dod8~
  dod dod?4 dod dod dod8
  la4 r8 fa re r r sol

  %19
  mi r r4 la,8 la dod dod
  la la dod dod la4 r
  la'8 la sib? la la, fa' mi dod

  %22
  la fa' mi dod\mbreak la la' dod, mi
  fa fa fa mi la, fa' fa mi
  la, la fa' sib dod,4 r

  %25
  la'8 la4 la la fad8
  re sib r4 si'8 si4 si8~
  si si?4 sold8\mbreak mi8 do? r4

  %28
  do8 do do do re re sold sold
  mi mi mi mi mi mi mi mi
  mi mi sold sold mi mi sold sold

  %31
  mi mi sold sold mi do r4
  re8 re fad fad\mbreak re re fad fad
  re re fad fad re sib r4

  %34
  do8 do mi mi do do mi mi
  do do mi mi do la r la'~
  la la4 la la la8~

  %37
  la la4 la8 fa4 r
  si8 si4 si si si8~
  si si?4 si8 sol4 r

  %40
  dod8 dod4 dod dod dod8~
  dod dod?4 dod8 la4 r
  re,8 r r4\mbreak mi8 r r4

  %43
  fa8 r r4 fa8 re\p re re
  sol sol sol mi do do do do
  do do do do do4 r

  %46
  la8\f la' sol sol do, la' sol mi
  do la' mi sol\mbreak la4 r8 la
  la la do do la fa sib, do

  %49
  fa,4 r la8 la' sol sol
  la, la' sol sol do, fa sib, do
  fa,1\fermata

}

Ibcn = \relative do {

  fa8 fa mi do fa fa do' do,
  fa fa do' do, fa fa, r mi'
  fa fa, r mi' fa [fa fa mi16 re]

  %4
  do4 r do8 do si sol
  do do sol' sol,\mbreak do do sol' sol,
  do do, r si' do do, r si'

  %7
  do4 do do do
  fa16[la do re do sib? la sol] fa8 fa mi mi
  fa fa mi mi fa fa mi mi

  %10
  fa16 la do la sol fa mi re do8 do si si\mbreak
  do do si si do do si si
  do16 re mi fa sol mi re do fa[la do sib? la sol fa mi]

  %13
  fa la do sib la sol fa mi fa la do sib la fa sol la
  sib, do re mib fa re do sib sol' [si re do si la sol fa]
  sol si re do si la sol fa sol si re do si sol la si

  %16
  do, re mi fa sol mi re do la'[dod mi re dod si? la sol]\mbreak
  la dod mi re dod si? la sol la dod mi re dod la si! dod
  re, mi fa sol la fa mi re sol,8 r r4

  %19
  la8 r r4 la8 la la la
  la la la la re4 r
  re8 re, sol la re re dod la

  %22
  re re la'[la,]\mbreak re re la' la,
  re re, r dod' re re, r dod'
  re re re16 mi fa sol la, si dod? re mi dod! si la

  %25
  re[mi fad sol la sol fad mi] re[mi fad sol la fad mi re]
  sol,[la sib? do re sib la sol] mi'[fad sold la si la sold fad]
  mi[fad sold la si sold fad mi]\mbreak la, si do? re  mi do si la

  %28
  la8 la la la si si mi, mi
  la la la la mi' mi mi, mi
  la la mi' mi la, la mi' mi

  %31
  la, la mi' mi la16 sib? do sib la fad mi re
  sol8 sol, re' re\mbreak sol, sol re' re
  sol, sol re' re sol16 la sib la sol mi re do

  %34
  fa?8 fa, do' do fa, fa do' do
  fa, fa do' do fa16 [sol la sib do sib la sol]
  fa [la do sib la sol fa mi] fa[la do sib la sol fa mi]\mbreak

  %37
  fa la do sib la fa sol la sib,[do re mib fa re do sib]
  sol'[si re do si la sol fa] sol[si re do si la sol fa]
  sol si re do si sol la si do, re mi fa sol mi re do

  %40
  la'[dod mi re dod si la sol] la[dod mi re dod si la sol]
  la dod mi re dod la si dod re, mi fa sol la fa mi re
  sol8 r r4\mbreak do,8 r r4

  %43
  fa8 r r4 sib,8 sib\p sib sib
  do do do do fa fa fa fa
  do' do do, do fa16[la do re do sib? la sol]

  %46
  fa8\f fa mi mi fa fa do' do,
  fa fa do' do,\mbreak fa16[la do re do sib la sol]
  fa8 fa fa fa fa fa' sib, do

  %49
  fa,16[la do re do sib la sol] fa8 fa mi  mi
  fa fa mi mi fa fa' sib, do
  fa,1\fermata

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \time 4/4
  \key fa\major
  \tempo 2 = 60
  s1*51
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

  re8\solo re(mi4) dod8 dod(re4)
  la8 la(sib4) \appoggiatura la8 sol4 fa
  re'8 re(fa4) mi8 mi(la4)

  %4
  re,8[sib'16(la sol fa mi re)] dod8\upl mi\upl la,\upl mi'\upl
  sol,[sib la16(sol) fa(mi)] fa8 re r fa'
  do?8.\tr sib32 la sib8 do la fa r la'\mbreak

  %7
  sol8.\tr fa32 mi fa8 sol mi do r do
  re16[(do sib la sib do re mi)] \appoggiatura sol8 fa[mi16 re do8 sib]\mbreak
  \appoggiatura sib8 la8. [sol32 fa sol8 do] \appoggiatura sib8 la8. [sol32 fa sol8 do]

  %10
  \appoggiatura sib8 la sol16 fa sol8 mi fa4 r8 la'
  dod,8 dod(re4) la8 la(sib'4)
  la8[sol16 fa sol8 mi] fa re r la'

  %13
  dod,8 dod(re4) la8 la(sol4)
  fa8 mi16 re la'8 sol16 fa re'8 la fa' re\mbreak
  dod4 r8 la' fad8.\tr mi32 fad fad8.\tr mi32 fad

  %16
  sol8 re(sol sib) mi,8.\tr re32 mi mi8.\tr re32 mi
  fa8 do(fa la) re,8.\tr dod32 re re8.\tr dod32 re
  mi16 fa sol4 mi8 fa16 sol la4 re,8

  %19
  dod16 si la8 r la(si) sol'(mi) si(
  dod) la'(fa) dod(re) sib'?(sol) re(
  dod16) la sib sol la fa sol mi fa8 re r4

  %22
  la''16[fa sol mi fa re mi si] dod8 la r mi'
  fa8.\tr mi32 fa sol8.\tr fa32 sol la8[sol16 fa mi re dod si]
  la8 sol fa mi re4 r8 re'

  %25
  sol,[fa16 mi la8 la,] re2\fermata

}

IIvlan = \relative do' {

  r8 la' sib sib r la la fa
  r fa re re r mi la, la
  r fa' la la r dod, mi dod

  %4
  r re re sib r dod mi dod
  r re mi dod r fa  la fa
  r la sol mi r la, do la\mbreak

  %7
  r sol' re si r mi do la
  r re fa re r re sol mi\mbreak
  r do mi mi r do mi mi

  %10
  r do re sol, la do' la fa
  r mi la fa r mi sol mi
  r fa re dod r fa  la fa

  %13
  r mi la fa r mi dod mi
  r fa re la r fa' la fa\mbreak
  r mi mi dod r la' la la

  %16
  r re, do? sib r sol' sol sol
  r do, sib la r fa' fa fa
  r sib dod, dod r fa re fa

  %19
  r mi la fa re4 r8 re
  sol4 r8 mi\mbreak la4 r8 sol
  mi4 dod la8 fa' la fa

  %22
  r mi la si mi, dod mi dod
  la la' dod, mi re re si' si
  la sol fa mi re4 r8 re'

  %25
  sol,[fa16 mi la8 la,] re2\fermata

}

IIbcn = \relative do {

  r8 re sol sol, r sol' fa re
  r re sol sol, r dod re re,
  r re' re' re, r la' dod la

  %4
  r sol sib sol r la, dod la
  r sol' dod, la r re fa re
  r fa mi do? r fa la fa\mbreak

  %7
  r do' si sol r do la fa
  r sib,? re sib r sib' mi, do\mbreak
  r fa do' do, r fa do' do,

  %10
  r fa sib, do fa, la' fa re
  r la' fa re r dod mi dod
  r re sol, la re, re' fa re

  %13
  r la' fa re r dod la dod
  r re fa re r re re' re,\mbreak
  r la dod la r re re' do?

  %16
  r sib la sol r do, do' sib
  r la sol fa r sib, sib' la
  r sol mi la, r re fa re

  %19
  r la' fa re sol4 r8 fa
  mi4 r8 la\mbreak fa4 r8 sib
  la4 la, re,8 re' fa re

  %22
  re, dod' re sold la la, dod la
  re re mi mi fa fa sol sol
  la sol fa mi re4  r8 re'

  %25
  sol, fa16 mi la8 la, re2\fermata

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 4/4
\key fa\major
\tempo 4 = 60
s1*25
\bar"|."

}


IIvlI = {
	\global
	\notypeset
	<<\IIvlIn \forma>>

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


global = {
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\terzine \con

			}

IIIvlIn = \relative do'' {

  fa8 do16 sib do8
  \appoggiatura {sib16[do]} re8 do4
  \appoggiatura {sib16[do]} re8 do4

  %4
  fa8 do16 sib do8
  \appoggiatura {sol'16[la]} sib8 la4
  \appoggiatura {sol16[la]} sib8 la4

  %7
  fa8 mi16 re do sib
  do8 sib16 la sol fa
  fa'8\p mi16 re do sib

  %10
  do8 sib16 la sol fa
  do''8\f sib16 la sol fa
  sol8 fa16 mi re do\mbreak

  %13
  do'8\p sib16 la sol fa
  sol8 fa16 mi re do
  do\f(si) do(si) re(do)

  %16
  sol'8(mi) si
  do16\p(si) do(si) re(do)
  sol'8(mi) si

  %19
  do16\f mi, sol,(mi' do') re
  si re, sol,(re' si') re
  do16\p mi, sol,(mi' do') re

  %22
  si re, sol,(re' si') re
  do\f re mi fa sol8\mbreak
  do, re si

  %25
  do4.
  sol'8 do,16 si do8
  \appoggiatura {fa16[sol]} la8 sol4

  %28
  \appoggiatura {fa16[sol]} la8 sol4
  sol8 dod,16 si dod8
  sib'?(la) sol

  %31
  fa16 re re, re'(fa la)
  fa re re, re'(fa la)
  sib, sol sol, sol'(sib re)

  %34
  sib sol sol, sol'(sib re)
  mi fa sol la sib8~\mbreak
  sib16 la sol fa mi re

  %37
  dod8 si? la
  mi'16 fa sol4
  fa16 la sol fa mi re

  %40
  fa,8 sol la
  re,4 r8
  fa' do16 sib do8

  %43
  \appoggiatura {sib16[do]} re8 do4
  \appoggiatura {sib16[do]} re8 do4
  fa16 la fa do la fa

  %46
  fa' la fa do la fa
  mi fa sol la sib8~\mbreak
  sib16 re do sib la sol

  %49
  la8 fa' do
  r16 sol' fa mib re do
  re8 sol re

  %52
  r16 la' sol fa mi? re
  mi8 sol do,
  \appoggiatura {sol'16[la]} sib8 la4

  %55
  \appoggiatura {sol16[la]} sib8 la4
  sib16 sol la fa sol mi
  fa4 r8

  %58
  sib,16 sol la fa sol mi
  fa4.\fermata

}

IIIvlIIn = \relative do'' {

  do8 la16 sol la8
  \appoggiatura {sol16[la]} sib8 la4
  \appoggiatura {sol16[la]} sib8 la4

  %4
  do8 la16 sol la8
  \appoggiatura {mi'16[fa]} sol8 fa4
  \appoggiatura {mi16[fa]} sol8 fa4

  %7
  la,16 sib do8 la
  la fa do
  la'16\p sib do8 la

  %10
  la fa do
  mi'16\f fa sol8 mi
  mi do sol

  %13
  mi'16\p fa sol8 mi
  mi do sol
  sol16\f sol sol sol sol sol

  %16
  do8 sol4
  sol16\p sol sol sol sol sol
  do8 sol4

  %19
  mi16\f do' sol8[mi]
  re16 si' sol8[re]
  mi16\p do' sol8[mi]

  %22
  re16 si' sol8[re]
  mi\f do'16 re  mi fa\mbreak
  sol8 si, re

  %25
  do4.
  mi8 mi16 re mi8
  \appoggiatura {re16[mi]} fa8 mi4

  %28
  \appoggiatura {re16[mi]} fa8 mi4
  mi8 mi16 re mi8
  sol(fa) mi

  %31
  re la4
  re8 la4
  sol8 re4

  %34
  sol8 re4
  sib'8 mi \once\tieDashed sol~\mbreak
  sol mi sib

  %37
  la16 si dod re mi8
  dod16 re mi4
  re8 la fa

  %40
  fa sol la
  re,4 r8
  do' la16 sol la8

  %43
  \appoggiatura {sol16[la]} sib8 la4
  \appoggiatura {sol16[la]} sib8 la4
  do16 fa do la fa[do]

  %46
  do'16 fa do la fa[do]
  do re  mi fa sol8~\mbreak
  sol16 sib la sol fa mi

  %49
  fa la la la la la
  do do do do do do
  sib si si si si si

  %52
  re re re re re re
  do mi mi mi mi mi
  \appoggiatura {mi16[fa]} sol8 fa4

  %55
  \appoggiatura {mi16[fa]} sol8 fa4
  sol16 re fa do mi do
  la4 r8

  %58
  sol16 re fa do mi do
  la4.\fermata

}

IIIvlan = \relative do' {

   la'8 fa4
   fa8 fa, r
   fa' fa, r
   fa' fa, r
   mi' do do'
   mi, do do'
   do,4 r8
   fa do la
   do4\p r8
   fa do la
   sol'4\f r8
   do sol mi\mbreak
   sol4\p  r8
   do sol mi
   mi16\f mi mi mi fa mi
   mi8 do r
   mi16\p mi mi mi fa mi
   mi8 do r
   sol\f sol sol
   sol sol sol
   sol\p sol sol
   sol sol sol
   sol4\f r8\mbreak
   mi'8 sol sol
   mi4.
   sol8  sol4
   do8 do, r
   do' do, r
   dod' la4
   dod4.
   la8 fa4
   la8 fa4
   re8 sib4
   re8 sib4
   sol'8 sib \once\tieDashed mi~\mbreak
   mi  sib sol
   mi4 r8
   mi4 dod8
   la4 r8
   fa' sol la
   re,4 r8
   la' fa4
   fa8 fa, r
   fa' fa, r
   la la la
   la la la
   sol sol mi'\mbreak
   mi mi mi
   do16 do do do fa fa
   fa fa fa fa fa fa
   fa sol re re sol sol
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   mi8 do4
   mi8 do4
   re8 do do
   do4 r8
   re do do
   do4.\fermopz

}

IIIbcn = \relative do {

  fa,8 fa' fa,
  r fa' fa,
  r fa' fa,

  %4
  r fa' fa,
  r fa' fa,
  r fa' fa,

  %7
  fa'4 r8
  fa4 r8
  fa4\p r8

  %10
  fa4 r8
  do4\f r8
  do4 r8\mbreak

  %13
  do4\p r8
  do4 r8
  do'\f do, r

  %16
  do' do, r
  do'\p do, r
  do' do, r

  %19
  do\f mi16 re do8
  sol si16 la sol8
  do\p mi16 re do8

  %22
  sol si16 la sol8
  do4\f r8\mbreak
  do sol' sol,

  %25
  do4.
  do8 do' do,
  r do' do,

  %28
  r do' do,
  r la' la,
  sol' dod,[la]

  %31
  re16 mi fa  mi re8
  re16 mi fa mi re8
  sol,16 la sib la sol8

  %34
  sol16 la sib la sol8
  sol'4.\mbreak
  sol,8 sol' sol,

  %37
  la4 r8
  la' dod,16 si la8
  re4 r8

  %40
  fa sol la
  re,16 do? sib? do re mi
  fa8 fa fa,

  %43
  r fa' fa,
  r fa' fa,
  fa' fa, fa

  %46
  fa' fa, fa
  do' do, do\mbreak
  do' do, do

  %49
  fa16 fa' fa fa fa fa
  la, la la la la la
  sib sol' sol sol sol sol

  %52
  si, si si si si si
  do do do do do do
  do8 fa fa,

  %55
  do' fa fa,
  sib do do,
  fa4 r8

  %58
  sib do do,
  fa4.\fermata

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 3/8
\override Staff.TimeSignature.style = #'single-digit
\key fa\major
\tempo 4. = 75
s4.*25
\bar":..:"\break
s4.*34
\bar ":|."

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

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #4

  }

  \markup \huge {[1.] All[egr]o molto}

  \score {
    {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino""principale]"}
          \IvlI
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino I""Violino II]"}
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
    }

    \layout {

      indent = 1.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        %\override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge {[2.] And[an]te}

  \score {
    {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino""principale]"}
          \IIvlI
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
          \IIvla
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
          \IIbc

        >>
      >>
    }

    \layout {

      indent = 1.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #10
        \override BarLine #'hair-thickness = #1.2
        %\override SpacingSpanner.uniform-stretching = ##t
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

    systems-per-page = #4

  }

  \markup \huge {[3.] [Allegro]}

  \score {
    {

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
    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        %\override SpacingSpanner.uniform-stretching = ##t
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




