\language "italiano"
	%********************************** VARIABILI

acc = \once \override Stem #'stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tr = \trill

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript #'padding = #3

padall = \override TextScript #'padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber #'transparent = ##t

con = \override TupletNumber #'transparent = ##f

dolce = _\markup\italic"dolce"

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

Iglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.4
  \override TupletBracket #'bracket-visibility = ##f

}

Ifln = \relative do'' {

  do4 do8.\tr si32 do re4 re8.\tr do32 re
  mi16[fa32 mi re16 do] re4\tr do mi16. mi32 re16. do32
  sol'16. sol32 la16. si32 do16. [si32 la16 si32 do] \grace sol8 fad8. mi16 re4
  re'8. do16 si8 la16 sol la fad sol mi \grace sol8 fad8.\tr sol16
  sol4 r r sol8 la16 si\mbreak

  %6
  do32 si (la sol la [sol fa) mi] fa8 fa16 re si sol si re fa4\tr
  mi r8 sol la16. sol32 fa16. mi32 re8.\tr do16
  si8.\tr do16 do8.\tr si32 do re8 sol,16 re' re8.\tr do32 re

  %9
  mi8 sol,16 mi' mi8.\tr re32 mi fa8 sol,16 fa' fa8.\tr mi32 fa
  sol8 sol, r sol' la32 sol (sol fa fa [mi mi) re]\mbreak re do (do si si[do re) si]
  sol do mi do sol[do mi do] sol si re si sol[si re si] sol do mi do sol[do mi do] sol do mi do sol[do re mi]

  %12
  re4 r8 mi fa8.[mi16 re8. do16]
  si'2\tr do4 r8 fa,
  mi8.\tr re16 sol(fa mi re) mi(re do si) do fa(mi re)\mbreak

  %15
  re4.\tr do16 re do2\fermata

}

Ibcn = \relative do {

  do'8 si la sol fa re sol[sol,]
  do' do, sol'[sol,] do' do, r4
  do' r8 do re re, fad[mi]

  %4
  re4 sol do8 si16 do re8 re,
  sol sol16 fa mi8 re do do, r4
  do''8 do\mbreak re [re,] sol4 r16 sol la si

  %7
  do8 do,16 re mi8 do fa4 r8 fad
  sol4 do, sol' r
  sol r sol r

  %10
  sol8 sol16 fa mi8 do fa4 r8 sol
  sol r\mbreak sol r sol r sol r
  sol4 r8 do la4 fa

  %13
  sol,8 sol' sol fa mi4 r8 fa
  sol1\tr ~
  sol2 do,\fermata

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key do\major
  \time 4/4
  \tempo 4 = 45
  s1*15
  \bar "|."

}

Ifl = {
  \Iglobal
  %\notypeset
  <<\Ifln \forma>>

}


Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}

IIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.4
  \override TupletBracket #'bracket-visibility = ##f
}

IIfln = \relative do'' {

  R2*20
  do2\tr
  re\tr

  %23
  \slurDashed mi8 [(fa sol) do,-.]
  mi[(fa sol) do,-.]\slurNeutral
  re2\tr

  %26
  do4 r
  mi4.\tr re16 do
  re4.\tr do16 si

  %29
  do8[mi re do]
  si[sol sol' re]
  mi[do la' sol]

  %32
  fad re do'4
  si8 la16 sol la8 fad\mbreak
  sol fad16 mi re8 do

  %35
  si4 la8.\tr sol32 la
  sol2\tr
  R2*3

  %40
  r4 r8 la'
  sib la4.
  sol8 fa4.

  %43
  sol8 fa4.
  mib8 re4.
  dod8. re16 re8.\tr dod32 re

  %46
  mi8 la, fa'[la,]
  mi'[la,] fa' la,
  sol'4.\tr fa16 mi\mbreak

  %49
  fa8[sib(la sold)]
  la dod, re16 sol?(fa mi)
  mi4.\tr re16(mi)

  %52
  re4 r
  R2*6
  r8 do' fa,16 sol la sib

  %60
  do8 fa, sib4
  la r8 re
  do sib16 la sol8 fa

  %63
  mi8. fa16 fa8.\tr mi32 fa
  sol8 do, r do
  fa16 do la do fa do la do

  %66
  fa re sib re fa re sib re\mbreak
  sol re si! re sol re si re
  sol mi do mi sol mi do sol'

  %69
  la8(sol) r la
  sib[la sol fa]
  mi-. fa-. r4\fermata

  %72
  r8 sib[la sol]
  do fa,16 mi fa sib la sol
  sol4.\tr fa16 sol

  %75
  fa4 r
  R2*3
  r8 sol la16(si? la fa)

  %80
  sol(la sol mi) fa(sol fa re)
  mi4 r8 do\mbreak
  mi16 do si do mi do si do

  %83
  fa re do re fa re do re
  sol8 sol4 la16 si
  do4\tr~do16 si la sol

  %86
  la4\tr~la16 sol fa mi
  fa4\tr~fa16 mi re do
  si8[la'(sol) si]

  %89
  do4~do16 si(la sol)
  fad2\tr
  sol4 r8 si

  %92
  do4~do16 si la sol\mbreak
  fa!4.\tr mi8
  fa4 r8\fermata la

  %95
  sol[si do do,]
  mi4 re8.\tr do32(re)
  do4 r

  %98
  r8 do'[re si]
  do si16 la sol8 fa
  mi16 sol\f la si do8 fa,

  %101
  mi re16 do re8.\tr(do16)
  do4 r

}

IIvlIn = \relative do'' {

  do2\tr
  re\tr
  mi8[(fa sol) do,-.]

  %4
  mi[(fa sol) do,-.]
  re2\tr
  do4 r8 mi

  %7
  re[sol, fad sol]
  do4-. la-\parenthesize-.
  si8[sol (fad sol)]

  %10
  mi'[do re si]
  do[(la si sol)]
  la re, sol16 do si la

  %13
  la4.\tr sol16 la
  sol4 r16 sol la si
  do si do re mi8 mi,

  %16
  la4-. fa'-.\mbreak
  si, sol'
  mi8[do re si]

  %19
  do[si16 la sol8 fa]
  mi4 re8.\tr do32 re
  do8[do\dolce mi re]

  %22
  sol[la si sol]
  do4 r
  do, r8 do

  %25
  sol'4 ~sol
  do,8 sol''4\f la16 si
  do4 do,\dolce

  %28
  si4 sol
  la fad
  sol si!

  %31
  do dod
  re r8 fad,
  sol4 re

  %34
  mi fad
  sol re
  sol2 %%%% fine secondo sistema

  %37
  sol'16\f la sib4.
  sol16 la sib4.
  la8 sol4 fa16 mi

  %40
  fa8 re dod4\tr
  re do!
  sib la

  %43
  sib la
  sol fa
  mi re

  %46
  la' la
  la la
  r8 la [dod la]

  %49
  re4 r8 si!
  dod[la sib sol]
  la4 la

  %52
  re16\f mi fa sol la8 re,
  sib'16(la sol fa) mi8 do\mbreak
  la8[do fa do]

  %55
  re16 sib do re do la sib do
  sib? sol la sib la fa sol la
  sol8 do do16 re mi fa

  %58
  sol8 re sib'4
  la r
  R2*15

  %75
  r8 do\f[la fa]
  sol do fa, mi16 re
  mi8 [do16 re  mi fa sol la]

  %78
  sol8 do, do' si16 la
  \once\stemDown sol8 do,, fa4\tr
  mi re

  %81
  do8 do' sol mi\mbreak
  do4 r
  re r

  %84
  mi8[fa mi re]
  do do' do,4
  r8 fa fa4

  %87
  r8 fa[la fa]
  sol[fa mi re]
  do[do mi do]

  %90
  re[re re' do]
  si sol' sol,4
  r8 [do,mi do]

  %93
  re[re re' do]
  si4 r8\fermata si
  do,[re mi fa]

  %96
  sol4 sol
  do,8 sol' do16 re mi fa
  sol8[do, re si]\mbreak

  %99
  do si16 la sol8 fa
  mi16 sol\f la si do8 fa,
  mi re16 do re8 si'

  %102
  do do, r4

}

IIvlIIn = \relative do'' {

  do2\tr
  re\tr
  mi8[(fa sol) do,-.]

  %4
  mi[(fa sol) do,-.]
  re2\tr
  do4 r8 mi

  %7
  re[sol, fad sol]
  do4-. la-\parenthesize-.
  si8[sol (fad sol)]

  %10
  mi'[do re si]
  do[(la si sol)]
  la re, sol16 do si la

  %13
  la4.\tr sol16 la
  sol4 r16 sol la si
  do si do re mi8 mi,

  %16
  la4-. fa'-.\mbreak
  si, sol'
  mi8[do re si]

  %19
  do[si16 la sol8 fa]
  mi4 re8.\tr do32 re
  do8[do\dolce mi re]

  %22
  sol[la si sol]
  do4 r
  do, r8 do

  %25
  \once\tieDashed sol'4~ sol
  do,8 sol''4\f la16 si
  do4 do,\dolce

  %28
  si4 sol
  la fad
  sol si!

  %31
  do dod
  re r8 fad,
  sol4 re

  %34
  mi fad
  sol re
  sol2 %%%% fine secondo sistema

  %37
  sol'16\f la sib4.
  sol16 la sib4.
  la8 sol4 fa16 mi

  %40
  fa8 re dod4\tr
  re do!
  sib la

  %43
  sib la
  sol fa
  mi re

  %46
  la' la
  la la
  r8 la [dod la]

  %49
  re4 r8 si!
  dod[la sib sol]
  la4 la

  %52
  re16\f mi fa sol la8 re,
  sib'16(la sol fa) mi8 do\mbreak
  la8[do fa do]

  %55
  re16 sib do re do la sib do
  sib? sol la sib la fa sol la
  sol8 do do16 re mi fa

  %58
  sol8 re sib'4
  la r
  R2*15

  %75
  r8 do\f[la fa]
  sol do fa, mi16 re
  mi8 [do16 re  mi fa sol la]

  %78
  sol8 do, do' si16 la
  \once\stemDown sol8 do,, fa4\tr
  mi re

  %81
  do8 do' sol mi\mbreak
  do4 r
  re r

  %84
  mi8[fa mi re]
  do do' do,4
  r8 fa fa4

  %87
  r8 fa[la fa]
  sol[fa mi re]
  do[do mi do]

  %90
  re[re re' do]
  si sol' sol,4
  r8 [do,mi do]

  %93
  re[re re' do]
  si4 r8\fermata si
  do,[re mi fa]

  %96
  sol4 sol
  do,8 sol' do16 re mi fa
  sol8[do, re si]\mbreak

  %99
  do si16 la sol8 fa
  mi16 sol\f la si do8 fa,
  mi re16 do re8 si'

  %102
  do do, r4

}

IIbcn = \relative do {

  do8[re mi do]
  sol[la si sol]
  do4 r

  %4
  do' r8 do,
  sol'[fa sol sol,]
  do[do' mi do]

  %7
  si4 r8 si
  la[sol fad re]
  sol4 r8 sol

  %10
  do4 si
  la sol
  fad sol

  %13
  re' re,
  sol8[fa? mi re]
  do4 r8 mi\mbreak

  %16
  fa8[sol la fa]
  sol[la si sol]
  do4 sol

  %19
  do r8 fa,
  sol4 sol,
  do r

  %22
  R2*4
  do8[re  mi re]
  do4 r

  %28
  R2*9
  dod'4 r
  dod r

  %39
  dod dod
  re8 re, r4
  R2*11

  %52
  re4 r8 fa
  sol4 do,
  fa r8 fa

  %55
  sib4 la\mbreak
  sol fa
  do' r

  %58
  r8 do,[re mi]
  fa4 r
  r8 la[sol do]

  %61
  fa,[sol la sib]
  la4 sib
  do fa,

  %64
  R2
  la,4 r
  sib r

  %67
  si! r
  do r8 mi
  fa mi r fa,

  %70
  sib4 r8 sib
  do fa, r4\fermata
  r8 re'[do sib]

  %73
  la4 r8 sib\mbreak
  do4 do,
  fa fa'

  %76
  mi re
  do r
  do do

  %79
  do r
  R2*17
  do8[re mi re]

  %98
  do[fa, fa sol]
  la4 si?
  do r8 fa

  %101
  sol4 sol,
  do r

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key do\major
  \time 2/4
  \tempo 2 = 65
  s2*102
  \bar "|."\break


}

IIfl = {
  \IIglobal
  %\notypeset
  <<\IIfln \forma>>

}

IIvlI = {
  \IIglobal
  <<\IIvlIn \forma>>

}

IIvlII = {
  \IIglobal
  <<\IIvlIIn \forma>>

}


IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}

IIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.4
  \override TupletBracket #'bracket-visibility = ##f

}

IIIfln = \relative do'' {

  R1*9

}

IIIvlIn = \relative do'' {

  mi4 r\fermata mi8-. mi-. mi-. mi-.
  fa4 r\fermata mi8 la~la16 re dod re
  sib8 sol sib4 la8 re16 re, fa8 mi16 re
  re4 sib'8 re sold, la~la do-.
  fad, sol~sol sib mi,(fa?) do' mi,-.
  fa do re re re re do-. do-.
  r4\fermata si8 si do do mi-. mi-.\mbreak
  r4\fermata mi8 mi mi la16 do, re8. mi16
  mi1\tr\fermopz

}

IIIvlIIn = \relative do'' {

  dod4 r\fermata dod8 dod dod dod
  re4 r\fermata dod r
  re r16 sol la sib dod,8 re4 dod8
  re fa fa fa mi mi mi mi
  re re re re do do do sib
  la la la la sold sold la la
  r4\fermata sold8 sold la la si si
  r4\fermopz si8 si la4. la8
  sold1\fermata

}

IIIbcn = \relative do {

  la'4 r\fermata sol8 sol sol sol
  sold4 r\fermata la fa
  sol r8 sol sol fa16 sol la8 la,
  re re' re re re do do do
  do sib sib sib sib la la sol
  fa fa fa fa mi mi red red
  r4\fermata mi8 mi la la sold sold\mbreak
  r4\fermata sol!8 sol fa4. fa8
  mi1\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  <_+>4 s <6 4+>2
  <7- 5> <_+>4 <6>
  <_->2 <4+ 2>4 <4>8 <3>
  s2 <2>
  <2> <2>
  s4 <6> s <7- 5>
  s <_+> s <6>
  s <6> <7> <6>

}


forma = {

  \key do\major
  \time 4/4
  \tempo 4 = 43
  s1*9
  \bar"|."

}

IIIfl = {
  \IIIglobal
  %\notypeset
  <<\IIIfln \forma>>

}

IIIvlI = {
  \IIIglobal
  <<\IIIvlIn \forma>>

}

IIIvlII = {
  \IIIglobal
  <<\IIIvlIIn \forma>>

}


IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}

IVglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.4
		\override TupletBracket #'bracket-visibility = ##f

			}

IVfln = \relative do'' {

  do'8 sol mi
  do4\tr re8
  mi16 fa sol8 do,

  %4
  re4\tr do8
  do'16(si) la8 sol
  fad8 sol4

  %7
  la16[(si)] do8 sol
  fad sol4
  do8 si la

  %10
  re8. fad,16 sol do
  si la la8.\tr sol16
  sol8 r r

  %13
  R4.*8
  r8 r re
  mi16 re mi8 fad\mbreak

  %23
  sol16 fad sol8 la
  si16 la si8 do
  re fa,! fa

  %26
  fa mi16 re mi8
  do' si16 la sol8
  la-. sol-. r\fermata

  %29
  fa-. mi-. r\fermata
  mi re16 do re8
  sol la si

  %32
  do si16 la sol fa
  mi8 do fa
  mi16[fa] re8.\tr do16

  %35
  do8 r r
  R4.*3
  fa8 re16 mi re8\mbreak

  %40
  fa re16 do si8
  fa'8. mi16 re8
  mi16 do mi sol do8

  %43
  do si16 la sol8
  la si do
  sol4.\tr

  %46
  la8 si do
  fa,4.\tr
  re'16 do si la sol fa

  %49
  mi8 fa4\tr
  sol8 la4\tr
  si8 do4\tr

  %52
  re8 si do
  fa,8. re16 mi8
  do re4\tr

  %55
  do8 r r\mbreak
  r do' do
  do16 re do re do re

  %58
  do8 do16 re mi8
  fa la,16 si do8
  si16 do si8 do

  %61
  re8. sol,16 do8
  la sol si
  do16 sol do sol do sol

  %64
  do8 r r\fermata
  do si16 la sol fa
  mi8 sol do

  %67
  fa, mi re
  do4.\fermata

}

IVvlIn = \relative do'' {

  R4.*11
  sol'8 re si
  sol4 la8

  %14
  si16 do re8 sol,
  la4\tr sol8
  mi' sol,16(la sol) mi'

  %17
  re8 sol,16(la sol) re'
  do8 fad,16(sol fad) do'
  si la sol la si do

  %20
  re8 do16 si la sol
  fad8 re sol
  R4.*13

  %35
  sol'8 do,16 re do8
  sol' dod,16 re dod8
  sol'8. fa16 mi8\mbreak

  %38
  fa16 re fa la re8
  re, r r
  si! r sol

  %41
  la4 si8
  do4 do,8
  R4.*12

  %55
  do'16 sol do sol do sol
  do4.~
  do16 re do re do re

  %58
  do8 do16 do re mi
  fa8-. fa-. fa-.
  fa fa fa

  %61
  fa8. re16 mi8
  do sol si
  do16 sol do sol do sol\mbreak

  %64
  do8 r r\fermata
  do si16 la sol fa
  mi8 \parenthesize sol do

  %67
  fa, mi re
  do4.\tr

}

IVvlIIn = \relative do'' {

  R4.*11
  sol'8 re si
  sol4 la8

  %14
  si16 do re8 sol,
  la4\tr sol8
  mi' sol,16(la sol) mi'

  %17
  re8 sol,16(la sol) re'
  do8 fad,16(sol fad) do'
  si la sol la si do

  %20
  re8 do16 si la sol
  fad8 re sol
  R4.*13

  %35
  sol'8 do,16 re do8
  sol' dod,16 re dod8
  sol'8. fa16 mi8\mbreak

  %38
  fa16 re fa la re8
  re, r r
  si! r sol

  %41
  la4 si8
  do4 do,8
  R4.*12

  %55
  do'16 sol do sol do sol
  do4.~
  do16 re do re do re

  %58
  do8 do16 do re mi
  fa8-. fa-. fa-.
  fa fa fa

  %61
  fa8. re16 mi8
  do sol si
  do16 sol do sol do sol\mbreak

  %64
  do8 r r\fermata
  do si16 la sol fa
  mi8 sol do

  %67
  fa, mi re
  do4.\tr

}

IVbcn = \relative do {

  do8 r r
  do do' si
  do4 do,8

  %4
  sol'4 do,8
  do'4 do8
  re sol,4

  %7
  do do8
  re sol,4
  la8 sol fad

  %10
  sol8. la16 si fad
  sol do re8 re,\mbreak
  sol r r

  %13
  sol, sol' fad
  sol4 sol,8
  re'4 sol,8

  %16
  do r do
  si r si
  la r la

  %19
  sol4 la8
  si do4
  re8 si sol

  %22
  do4 re8
  mi4 fad8\mbreak
  sol sol, la

  %25
  si4 sol8
  do4 do,8
  do'4 mi8

  %28
  fa mi r\fermata
  re8 do r\fermata
  do4 sol'8

  %31
  sol4 fa8
  mi r r
  do 'mi, fa

  %34
  sol4 sol,8
  do r r\mbreak
  dod' r r

  %37
  dod4 dod8
  re4 re,8
  R4.*4

  %43
  do'4 do,8
  R4.
  r8 do' do,

  %46
  R4.
  r8 re' do
  si sol4

  %49
  do8 r re,
  mi r fa\mbreak
  sol r la

  %52
  si sol do
  re8. si16 do8
  do, sol' sol,

  %55
  do do' do,
  do do' do,
  do do' si

  %58
  la la sol
  fa fa mi
  re re do

  %61
  si4 do8\mbreak
  fa sol sol,
  do'16 do, do'[do,] do' do,

  %64
  do'8 r r\fermata
  do r si
  do4 mi,8

  %67
  fa sol sol,
  do4.\fermata

}

IVbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\key do\major
\time 3/8
\tempo 4. = 70
s4.*68
\bar"|."

}

IVfl = {
	\IVglobal
	%\notypeset
	<<\IVfln \forma>>

}

IVvlI = {
	\IVglobal
	<<\IVvlIn \forma>>

}

IVvlII = {
	\IVglobal
	<<\IVvlIIn \forma>>

}


IVbc = {
	\IVglobal
	\clef bass
	<<\IVbcn \forma \IVbfn>>
	\typeset

}
#(set-global-staff-size 16.5)

\version "2.19.80"

\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #6

  }

  \markup \huge {[1.] Largo}

  \score {
    {

      \new StaffGroup <<

        \new Staff
        \with { instrumentName = \markup \center-column{"Flauto"} }
        <<
          \set Staff.midiInstrument = #"recorder"
          %\set Staff.instrumentName = \markup \center-column{"Flauto"}
          \Ifl
        >>

        \new Staff
        \with { instrumentName = \markup \center-column{"Violongello""e Basso"} }
        <<
          \set Staff.midiInstrument = #"cello"
          \set fontSize = #+2
          \override StaffSymbol.staff-space = #(magstep +2)
          \Ibc

        >>
      >>

    }

    \layout {

      indent = 1.6\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

}

\bookpart {

  \paper  {

    systems-per-page = #4

  }

  \markup \huge {[2.] Allegro}

  \score {
    {

      \new StaffGroup <<

        \new Staff
        \with { instrumentName = \markup \center-column{"Flauto"} }
        <<
          \set Staff.midiInstrument = #"recorder"
          \IIfl
        >>

        \new Staff
        \with { instrumentName = \markup \center-column{"Violino""Primo"} }
        <<
          \set Staff.midiInstrument = #"violin"
          \IIvlI
        >>

        \new Staff
        \with { instrumentName = \markup \center-column{"Violino""Secondo"} }
        <<
          \set Staff.midiInstrument = #"violin"
          \IIvlII
        >>

        \new Staff
        \with { instrumentName = \markup \center-column{"Violongello""e Basso"} }
        <<
          \set Staff.midiInstrument = #"cello"
          \set fontSize = #+2
          \override StaffSymbol.staff-space = #(magstep +2)
          \IIbc

        >>
      >>

    }

    \layout {

      indent = 1.6\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

  \markup \huge {[3.] Largo}

  \score {
    {

      \new StaffGroup <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"recorder"
          \IIIfl
        >>

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
          \set Staff.midiInstrument = #"cello"
          \set fontSize = #+2
          \override StaffSymbol.staff-space = #(magstep +2)
          \IIIbc

        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

  %\pageBreak

  \markup \huge {[4.] Allegro}

  \score {
    {

      \new StaffGroup <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"recorder"
          \IVfl
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \IVvlI
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \IVvlII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \set fontSize = #+2
          \override StaffSymbol.staff-space = #(magstep +2)
          \IVbc

        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

}
