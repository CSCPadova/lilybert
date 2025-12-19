\language "italiano"
	%********************************** VARIABILI
	\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"arco = _\markup \italic "con l'arco"

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


Iglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza \terzine
}

Ivln = \relative do'' {

  do8 [mi16. fa32 sol8 sol] do, [mi16. fa32 sol8 sol]
  do[si16 la sol8 fa] \tuplet 3/2 { mi16 re do mi[re do] sol' fa mi sol[fa mi] }
  mi8\tr re r sol \tuplet 3/2 { do16 si la  } la8[la la]

  %4
  la\tr sol r sol\mbreak \tuplet 3/2 { la16 sol fa } fa8[fa fa]
  fa\tr mi r sol la la sol sol
  fa fa mi mi re re si sol

  %7
  r mi' do sol\mbreak r re' si sol
  mi' fa sol la si do r16 sol la sol
  fa fa sol fa mi mi fa mi re8 sol, r re'

  %10
  mi sol sol sol fad la la la\mbreak
  sol si si si la do do do
  si la si la si4 r

  %13
  si8 [sol la8.\tr sol16] sol2
  sol,8[si16 do re8 re] sol[si16 do re8 si]
  la[re,16 mi fad8 fad] la[la16 si do8 do]

  %16
  si sol r16 si32[do re16 re] sold,[sold32 la si16 si] mi, sold32 la si16 si
  re, sold sold si si re re si\mbreak do si la8 r16 mi  mi la
  \tuplet 3/2 { la sol fad fad[mi red] red mi fad fad[sol la] } sol8 mi r16 si' si do

  %19
  do2~do\mbreak
  si~si
  la~la

  %22
  sol16 si la sol fad8.\tr mi16 mi4 r8 sol\mbreak
  do,8 [mi16. fa32 sol8 sol] do, [mi16. fa32 sol8 sol]
  do[si16. la32 sol8 fa] mi16 re do8 r sol'

  %25
  la2 sol
  fa\mbreak mi32(re do8.) la'32(sol fa8.)
  mi32(re do8.) la'32(sol fa8.) mi8 fa sol la

  %28
  si do r sol \tuplet 3/2 { do16 sol fa mi[re do] do' sol fa mi[re do] }
  do' sol fa mi re8.\tr do16 do4 r8 sol'
  \tuplet 3/2 { do16 sol fa mi[re do] do' sol fa mi[re do] } do' sol fa mi re8.\tr do16

  %31
  do1\fermata

  % Larghetto
  mib,4 mib mib
  re re sol

  %34
  sol sol mib'
  re re re
  do do do\mbreak

  %37
  si si si
  sol mib'  mib
  la, re re

  %40
  re re re
  re la fad\mbreak
  re mib' la,

  %43
  re,8 sol sol4 fad
  sol2.
  re'4 mib la,

  %46
  la la fad
  re re' re
  re re re

  %49
  re re do
  do do sib
  sol sol do

  %52
  sib fa re\mbreak
  re re re'
  sol, si si

  %55
  sol sol sol
  re' re re
  sol, sol do\mbreak

  %58
  do lab lab
  do do do
  do do do

  %61
  sol sol sol
  sol sol do
  do si si

  %64
  do2.\fermata

  %% Allegro
  do8
  do[mi mi do]
  re[sol, sol si16 do]

  %67
  re mi fa sol la8 sol16 fa
  mi8 do r sol'
  mi[sol re sol]

  %70
  mi[sol re sol]
  mi do r do'\mbreak
  la[do sol do]

  %73
  la[do sol do]
  la fa r re'
  si[re la re]

  %76
  si [re la re]
  si sol r re
  mi16 re do si do re mi fad\mbreak

  %79
  sol4 sol
  mi16 re do si do re mi fad
  sol4 sol

  %82
  si8 re si4
  la8 do la4
  sol8 si sol4

  %85
  fad8 la fad4
  mi8 sol mi4\mbreak
  re8 sol do,4

  %88
  si8 sol' do,4
  si8[sol' si, sol']
  la,[sol' la, fad']

  %91
  sol4. sol8
  sol8[si si sol]
  la[re, re re16 mi]

  %94
  fad sol la si do8 la
  si sol sol4
  si16 do re do re do si la

  %97
  sold la si la si la sold fad
  mi fad sold la si re, do si\mbreak
  do8 la r la'

  %100
  fa[la mi la]
  re,[la' do,la']
  si, la' la,16 si do re

  %103
  mi4 la8 sol16 fa
  mi8[mi la sol16 fa]
  mi8[mi la sol16 fa]\mbreak

  %106
  mi8[la si sold]
  la4 r8 do,
  do[mi mi do]

  %109
  re[sol, sol si16 do]
  re mi fa sol la8 sol16 fa
  mi8 do r re

  %112
  mi16 re do si do re mi fa
  sol4 sol\mbreak
  la16 sol fa mi fa sol la si

  %115
  do8[si16 la sol8 fa]
  mi re16 do re4\tr
  mi8[sol re sol]

  %118
  mi[sol re sol]
  mi[sol re sol]
  mi16 re do si do re mi fa\mbreak

  %121
  sol8[fa16 mi fa sol la si]
  do8[si16 la sol8 fa]
  mi re16 do re4\tr

  %124
  do4.\fermata

}

Iltn = \relative do'' {

  do8 [mi16. fa32 sol8 sol] do, [mi16. fa32 sol8 sol]
  do[si16 la sol8 fa] \tuplet 3/2 { mi16 re do mi[re do] sol' fa mi sol[fa mi] }
  mi8\tr re r sol \tuplet 3/2 { do16 si la  } la8[la la]

  %4
  la\tr sol r sol\mbreak \tuplet 3/2 { la16 sol fa } fa8[fa fa]
  fa\tr mi r sol \tuplet 3/2 { la16 do do la[do do] sol do do sol[do do]
  fa, do' do fa,[do' do] mi, do' do mi,[do' do]} re, sol re sol si, re sol, re'

  %7
  mi sol mi sol do, mi sol, mi'\mbreak re sol re sol si, re sol, re'
  \tuplet 3/2 { mi re do fa[mi re] sol fa mi la[sol fa] } si8 do r16 sol la sol
  fa fa sol fa mi mi fa mi re8 sol, r re'

  %10
  \tuplet 3/2 { mi16[re do] } sol'8 sol sol \tuplet 3/2 { fad16[mi re] } la'8 la la\mbreak
  \tuplet 3/2 { sol16[fad mi] } si'8 si si \tuplet 3/2 { la16[sol fad] } do'8 do do
  \tuplet 3/2 { si16 re re la[re re] si re re la[re re] } si la sol fad sol la si do

  %13
  re si la sol la8.\tr sol16 sol2\mbreak
  sol,8[si16 do re8 re] sol[si16 do re8 si]
  la[re,16 mi fad8 fad] la[la16 si do8 do]

  %16
  si sol r16 si32[do re16 re] sold,[sold32 la si16 si] mi, sold32 la si16 si
  re, sold sold si si re re si\mbreak do si la8 r16 mi  mi la
  \tuplet 3/2 { la sol fad fad[mi red] red mi fad fad[sol la] } sol8 mi r16 si' si do

  %19
  do mi, mi  do' do mi, mi do' \tuplet 3/2 { fad, mi re re[mi fad] fad sol la la[sol fad]}\mbreak
  si16 re, re si' si re, re si' \tuplet 3/2 { mi, re do do[re mi] mi fad sol sol[fad mi] }
  la do, do la' la do, do la' \tuplet 3/2 { red, dod si si[dod red] red mi fad fad[sol la] }

  %22
  sol16 si la sol fad8.\tr mi16 mi4 r8 sol\mbreak
  do,8 [mi16. fa32 sol8 sol] do, [mi16. fa32 sol8 sol]
  do[si16. la32 sol8 fa] mi16 re do8 r sol'

  %25
  la16 fa re fa si, fa' la fa sol mi do mi la, mi' sol mi
  fa re si re sol, re' fa re\mbreak mi32(re do8.) la'32(sol fa8.)
  mi32(re do8.) la'32(sol fa8.) \tuplet 3/2 { mi16 re do fa[mi re] sol fa mi la[sol fa] }

  %28
  si8 do r sol \tuplet 3/2 { do16 sol fa mi[re do] do' sol fa mi[re do] }
  do' sol fa mi re8.\tr do16 do4 r8 sol'
  \tuplet 3/2 { do16 sol fa mi[re do] do' sol fa mi[re do] } do' sol fa mi re8.\tr do16

  %31
  do1\fermata

  % Larghetto
  do8. mib16 \appoggiatura mib8 re8. do16 \appoggiatura do8 si8. la16
  \appoggiatura la8 sol8. lab'16 \appoggiatura lab8 sol8. fa16 \appoggiatura fa8 mib8. re16

  %34
  \appoggiatura re8 mib8. re16 do8. sol'16 \appoggiatura sol8 lab8. sol16
  \appoggiatura sol8 lab8. re16 re8. fad,16 \appoggiatura fad8 sol8. fad16
  \appoggiatura fad?8 sol8. do16 do8. mi,16 \appoggiatura mi8 fa?8. mi16\mbreak

  %37
  \appoggiatura mi?8 fa8. lab16 \appoggiatura lab8 sol8. fa16 \appoggiatura fa8 mib?8. re16
  \appoggiatura re8 mib8. do16 lab'8. [lab16 lab8. sol16]
  fad32(mi? re8.) la'?32(sol fad8.) do'32(sib la8.)

  %40
  sib32(la sol8.) sib32(la sol8.) sib32(la sol8.)
  fad8. la16 re,8. fad16 la8. do,16\mbreak
  sib8.[sol'16 fad?8. mib?16 re8. do16]

  %43
  sib8.sol'16 la,4.\tr sol8
  sol2.
  sol'8. sib16 \appoggiatura sib8 la8. sol16 \appoggiatura sol8 fad8. mi16

  %46
  \appoggiatura mi8 re8. mib!16 \appoggiatura mib8 re8. do16 \appoggiatura do8 sib8. la16\mbreak
  \appoggiatura la8 sib8. la16 sol8.[sib'16 sib8. sib16]
  sib4\tr la8. la16 re8. la16

  %49
  la4\tr sol8.[sol16 do8. sol16]
  sol4\tr fa8.[fa16 sib8. re,16]
  mib8.[sol16 do,8. mib16] la,8. mib'16

  %52
  re8. do16 sib8.[fa'16 sol8. lab16]\mbreak
  si,8.[re16 sol,8. fa'16 lab8. fa16]
  fa4\tr mib r

  %55
  do8.[mib16 \appoggiatura mib8 re8. do16 \appoggiatura do8 si8. la16]
  \appoggiatura la8 sol8.[lab'16 \appoggiatura lab8 sol8. fa16 \appoggiatura fa8 mib8. re16]
  \appoggiatura re8 mib8. re16 do8.[sol'16 sol8. lab16]\mbreak

  %58
  lab?4 reb,8.[fa16 fa8. sol16]
  sol4 do,8.[sol'16 sol8. lab16]
  lab?32(sol fa8.) lab!32(sol fa8.) lab32(sol fa8.)

  %61
  si32(la? sol8.) si32(la sol8.) si32(la sol8.)
  do8.[sol16 fa8. mib16 re8. do16]
  lab'8. fa16 re4.\tr do8

  %64
  do2.\fermata

  %% Allegro
  do8
  do[mi mi do]
  re[sol, sol si16 do]

  %67
  re mi fa sol la8 sol16 fa
  mi8 do \terzinequarto \con \tuplet 3/2 {r8 sol' sol\senza
  mi sol sol re[sol sol]

  %70
  mi sol sol re sol sol}
  mi do \tuplet 3/2 { r do' do\mbreak
  la do do sol[do do]

  %73
  la do do sol[do do]}
  la fa \tuplet 3/2 { r re' re
  si re re la[re re]

  %76
  si re re la [re re]}
  si sol r re
  mi16 re do si do re mi fad\mbreak

  %79
  sol4 sol
  mi16 re do si do re mi fad
  sol4 sol

  %82
  \tuplet 3/2 { si8 re re si[la sol]
  la do do la[sol fad]
  sol si si sol[fad mi]

  %85
  fad la la fad[mi re]
  mi sol sol mi[re do]
  re sol sol do,[si la]

  %88
  si sol' sol do,[si la]
  si sol' sol si,[sol' sol]
  la, sol' sol la,[fad' fad]}

  %91
  sol4. sol8
  sol8[si si sol]
  la[re, re re16 mi]

  %94
  fad sol la si do8 la
  si sol sol4
  si16 do re do re do si la

  %97
  sold la si la si la sold fad
  mi fad sold la si re, do si\mbreak
  do8 la \terzinequarto \con \tuplet 3/2 { r la' la\senza

  %100
  fa la la mi[la la]
  re, la' la  do,[la' la]
  si, la' la} la,16 si do re

  %103
  mi4 la8 sol16 fa
  mi8[mi la sol16 fa]
  mi8[mi la sol16 fa]\mbreak

  %106
  mi8[la si sold]
  la4 r8 do,
  do[mi mi do]

  %109
  re[sol, sol si16 do]
  re mi fa sol la8 sol16 fa
  mi8 do r re

  %112
  mi16 re do si do re mi fa
  sol4 sol\mbreak
  la16 sol fa mi fa sol la si

  %115
  do8[si16 la sol8 fa]
  mi re16 do re4\tr
  \tuplet 3/2 { do8 sol' sol re[sol sol]

  %118
  mi sol sol re[sol sol]
  mi sol sol re[sol sol]}
  mi16 re do si do re mi fa\mbreak

  %121
  sol8[fa16 mi fa sol la si]
  do8[si16 la sol8 fa]
  mi re16 do re4\tr

  %124
  do4.\fermata

}

Ibcn = \relative do {

  do8 re mi re do re mi re
  do fa si, sol do re mi do
  sol' fa sol mi fa mi fa re

  %4
  mi re mi do\mbreak re do re si
  do re mi do fa fa mi mi
  re re do do sol4 sol

  %7
  do do\mbreak sol sol
  do8 re mi fa sol mi re do
  re si do fa, sol la si sol

  %10
  do re mi do re mi fad re\mbreak
  mi fad sol mi fad sol la fad
  sol fad sol[fad] sol4 r

  %13
  sol8 sol, re'' [re,] sol,2
  sol8 la si la sol la si sol
  re' mi re do re fad mi re

  %16
  sol la si sol mi fad sold fad
  mi fad sold mi\mbreak la, si do la
  red dod red si mi fad sol mi

  %19
  la4 la re,8 re re re\mbreak
  sol4 sol do,8 do do do
  fad4 fad si,8 si si si

  %22
  mi la si si, mi re do si\mbreak
  do re mi re do re mi re
  do fa si, sol do re mi do

  %25
  fa fa, r fa' mi mi, r mi'
  re sol, r sol\mbreak do mi fa si,
  do mi fa si, do re mi fa

  %28
  sol mi re do do4 do\mbreak
  do8 do sol'[sol,] do re mi do
  do4 do do8 do sol'[sol,]

  %31
  do1\fermata

  % Larghetto
  do4 do do
  si si si

  %34
  do do do
  sib! sib sib
  lab lab lab\mbreak

  %37
  sol sol sol
  do do' do
  re fad, fad

  %40
  sol sol, sol'
  re fad re\mbreak
  sol do fad,

  %43
  sol re re,
  sol2.
  sol4 do re

  %46
  fad, fad fad\mbreak
  sol sol' sol
  fa? fa fa

  %49
  mib mib mib
  re re re
  do la fa

  %52
  sib sib sib\mbreak
  sol si si
  do sol'8.[fa16 mib8. re16]

  %55
  do4 do do
  si si si
  do do mib\mbreak

  %58
  fa fa fa
  mib mib mib
  fa fa fa

  %61
  fa fa fa
  mib mib mib
  fa sol sol,

  %64
  do2.\fermata

  % Allegro
  r8
  do4 do
  si si

  %67
  si si
  do8[re mi do]
  do'4 si

  %70
  do si
  do8[si do do,]\mbreak
  fa4 mi

  %73
  fa mi
  fa8[sol la fad]
  sol4 fad

  %76
  sol fad
  sol8[la si sol]
  do,2\mbreak

  %79
  si8[la si sol]
  do2
  si8[la si sol]

  %82
  sol'4 r8 sol
  fad4 r8 fad
  mi4 r8 mi

  %85
  re4 r8 re
  do4 r8 do\mbreak
  si4 r8 fad'

  %88
  sol4 r8 fad
  sol4 sol,
  re' re,

  %91
  sol4. r8
  sol'4 sol
  fad fad

  %94
  fad? fad
  sol8[la si la]
  sold4 sold

  %97
  mi mi
  sold sold\mbreak
  la8[si do la]

  %100
  re4 do
  si la
  sold la8 fa

  %103
  mi do la4
  la la
  la la\mbreak

  %106
  la8[do re mi]
  la,[sol la si]
  do4 do

  %109
  si si
  si si
  do8[do' si sol]

  %112
  do,2
  si8[la si sol]\mbreak
  fa'2

  %115
  mi8[fa si, sol]
  do[la' sol sol,]
  do'4 si

  %118
  do si
  do si
  do la\mbreak

  %121
  sol4. fa8
  mi[fa si, sol]
  do[la' sol sol,]

  %124
  do4.\fermata

}

forma = {

  \time 4/4
  \key do\major
  \tempo 2 = 45
  s1*13
  \bar":..:"%\break
  s1*18
  \bar":|."\break
  \mark \markup \huge "       [2.] Larghetto"
  \key sol\minor
  \time 3/4
  \tempo 4 = 55
  s2.*13
  \bar":..:"%\break
  s2.*20
  \bar":|."\break
  \mark \markup \huge "      [3.] All[egr]o"
  \key do\major
  \time 2/4
  \tempo 2 = 65
  \partial 8 s8
  \set Score.currentBarNumber = #65
  s2*26
  s4.
  \bar":..:"\break
  s8
  s2*32
  s4.
  \bar":|."

}


Ivl = {
  \Iglobal
  \notypeset
  <<\Ivln\forma>>
}

Ilt = {
  \Iglobal
  <<\Iltn\forma>>
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
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza \terzine
}

IIvln = \relative do'' {

  re8
  sol sol sol sol sib16 la sol fad sol8 la
  do,[mib fad, do'] sib16 la sol8 r16 sib' do re
  mib,8 mib r16 la sib do re,8 re r16 sol la sib\mbreak

  %4
  do,8 sib' la sol fad16 sol sol la la sib sib do
  re, mi? mi fad fad sol sol la do,8[do do\tr sib16 la]
  sib8[sib sib\tr la16 sol] fad'[sol la sol fad mi re do]

  %7
  sib8 sol' la fad\mbreak sol4 r8 re
  sol sol sol sol sib16 la sol fad sol8 la
  do, mib fad, do' sib16 la sol8 r sib'

  %10
  re re re re mib,2\mbreak
  do'8 do do do re,2
  sib'8 sib sib sib dod,2

  %13
  fa16 la la8 r16 la la8 r16 la la8 r16 la si dod\mbreak
  re la fa re mi8. re16 re la' la8 r16 la la8
  r16 la la8 r16 la si dod re la fa re mi8.\tr re16

  %16
  re la' sol la re, la' sol la re,4.\tr la8\mbreak
  re re re re fa16 mi re dod re8 sib'
  mi, sol dod, la' fa16 mi re8 r16 fa fa16. sol32

  %19
  lab16. fa32 re16. fa32 si,16. fa'32 sol16. re32 mib8 sol sol sol
  lab lab lab lab\mbreak sol sol sol sol
  lab lab lab lab fad fad fad fad

  %22
  sol sol sol sol fa! fa fa fa
  mib mib mib mib do' do do do
  do do do do si si si si\mbreak

  %25
  <<do4\\\stemUp\once \override Stem #'transparent = ##t mib,\\\stemDown sol,>> r8 re' sol sol sol sol
  sib16 la sol fad sol8 la do, mib fad, do'
  sib16 la sol8 r16 sib'-. sib-. re-. re-. sib-. sib-. la-. la sol sol fa?

  %28
  mib4 r16 la la do\mbreak do la la sol sol fa fa mib
  re4 r16 sol sol sib sib sol sol fa fa mib mib re
  do la' la sol sol fad fad sol sol re re sol sol sib sib la

  %31
  la8 re, r re mib\tr re r re\mbreak
  mib8\tr re r la' sib[la16 sol la8 sol16 fad]
  sol4 r8 re mib\tr re r la'

  %34
  sib[la16 sol la8 sol16 fad] sol4.\fermata

  % Larghetto
  sol8 re(mib)
  do do(re)

  %37
  la la(do)
  sib8. la16 sol8
  sib' dod (re)

  %40
  la dod(re)
  sol, dod(re)
  fad,8. mi16 re8

  %43
  sib'16 la sol8 fa?\mbreak
  mib do do,
  la''16 sol fa8 mib

  %46
  re sib sib,
  re'16. sib32 mib16. do32 sol'16. mib32
  re16. sib32 mib16. do32 sol'16. mib32

  %49
  re16 fa sol la sib8
  sib,16 do do8.\tr[sib16]
  sib4.

  %52
  fa'8 fa(sib)
  mib, mib(sol)
  do, do(mib)
  re8. do16 sib8

  %56
  fa' fa(lab)
  si, si(re)
  sol,16 lab' sol fa mib re

  %59
  mib8. re16 do8
  sib'! dod(re)
  la dod(re)\mbreak

  %62
  sol, dod re
  fad,8. mi?16 re8
  sib' re, mib %% ripresa

  %65
  la do, re
  sol sib, do
  fad16 sol la do, sib la

  %68
  sib8 sol sol'
  la sol fad
  sol4.

  %71
  sib8 re, mib %% ripresa
  la do, re
  sol sib, do

  %74
  fad16 sol la do, sib la
  sib8 sol sol'
  la sol fad

  %77
  sol4.\fermata

  % Allegro
  sol8
  sol[fad16 sol la8 sol16 fad] sol8[fad16 sol la8 sol16 fad]
  sol8[fa?16 mib re8 do] sib16 la sol8 r sib'

  %80
  sib re re sib sib[la16 sol la8 la]
  la do do la\mbreak la[sol16 fa sol8 sol]
  sol sib sib sol fa[mi16 fa sol8\tr fa16 mi]

  %83
  fa8[mi16 fa sol8\tr fa16 mi] fa8 r sib r
  la r sol r fa[mi16 fa sol8 fa16 mi]\mbreak
  fa8[mi16 fa sol8 fa16 mi] fa8 r sib r

  %86
  la r sol r fa mi16 re sol8 fa16 mi
  la8 re, mi dod re4. sib'8
  sib8[la16 sib do8 sib16 la] sib8[la16 sib do8 sib16 la]

  %89
  sib8[la16 sol fa8 mib] re16 do sib8 r fa'
  sol sib r sol fa sib r re,
  mib8[fa16 sol fa8 mib]\mbreak re8 fa sol4\tr

  %92
  fa8 mib16 fa sol4 fa16[sib la sol fa mib re do]
  re8 sib' do la sib4 r8 re,
  sol8[fad16 sol la8 sol16 fad] sol8[fad16 sol la8 sol16 fad]\mbreak

  %95
  sol8[fa?16 mib re8 do] sib16 la sol8 r la'
  sib\tr la r re sib\tr la r re
  sib\tr la r re, mib\tr re r sol

  %98
  mib\tr re r sol\mbreak mib\tr re r re
  mib mib mib fad sol sol sol la
  sib sib sib do re[do16 sib la sol fad mi?]

  %101
  re8 sol la fad sol4 r8 re
  mib mib mib fad sol sol sol la
  sib sib  sib do re[do16 sib la sol fad? mi?]

  %104
  re8 sol la fad sol4.

}

IIltn = \relative do'' {

  re8
  sol sol sol sol sib16 la sol fad sol8 la
  do,[mib fad, do'] sib16 la sol8 r16 sib' do re
  mib,8 mib r16 la sib do re,8 re r16 sol la sib\mbreak

  %4
  do,8 sib' la sol fad16 sol sol la la sib sib do
  re, mi? mi fad fad sol sol la do,8[do do\tr sib16 la]
  sib8[sib sib\tr la16 sol] fad'[sol la sol fad mi re do]

  %7
  sib8 sol' la fad\mbreak sol4 r8 re
  sol sol sol sol sib16 la sol fad sol8 la
  do, mib fad, do' sib16 la sol8 r sib'

  %10
  \tuplet 3/2 { re16 do sib re[do sib] re do sib re[do sib] sol fa mib sol[fa mib] sol fa mib sol[fa mib]}\mbreak
  \tuplet 3/2 { do' sib la do[sib la] do sib la do[sib la] fa mib? re fa[mib re] fa mib re fa[mib re] }
  \tuplet 3/2 { sib' la sol sib[la sol] sib la sol sib[la sol] mi? re dod mi[re dod] mi re dod mi[re dod]}

  %13
  fa16 la la8 r16 la la8 r16 la la8 r16 la si dod\mbreak
  re la fa re mi8. re16 re la' la8 r16 la la8
  r16 la la8 r16 la si dod re la fa re mi8.\tr re16

  %16
  re la' sol la re, la' sol la re,4.\tr la8\mbreak
  re re re re fa16 mi re dod re8 sib'
  mi, sol dod, la' fa16 mi re8 r16 fa fa16. sol32

  %19
  lab16. fa32 re16. fa32 si,16. fa'32 sol16. re32 <sol do, mib,>2\arpeggio_\markup\italic"Arpeg[giato]"
  <lab do, fa,>\arpeggio <sol do, mib,>\arpeggio
  <lab do, fa,>\arpeggio <fad do re,>\arpeggio

  %22
  <sol si, re,>\arpeggio <fa! si, re,>\arpeggio
  <mib do sol>\arpeggio <do' mib, sol,>\arpeggio
  <do re, sol,>\arpeggio <si re, sol,>\arpeggio

  %25
  <<do4\\\stemUp\once \override Stem #'transparent = ##t mib,\\\stemDown sol,>> r8 re' sol sol sol sol
  sib16 la sol fad sol8 la do, mib fad, do'
  sib16 la sol8 r16 sib'-. sib-. re-. re-. sib-. sib-. la-. la sol sol fa?

  %28
  mib4 r16 la la do\mbreak do la la sol sol fa fa mib
  re4 r16 sol sol sib sib sol sol fa fa mib mib re
  do la' la sol sol fad fad sol sol re re sol sol sib sib la

  %31
  la8 re, r re mib\tr re r re\mbreak
  mib8\tr re r la' sib[la16 sol la8 sol16 fad]
  sol4 r8 re mib\tr re r la'

  %34
  sib[la16 sol la8 sol16 fad] sol4.\fermata

  % Larghetto
  sol8 re(mib)
  do do(re)

  %37
  la la(do)
  sib8. la16 sol8
  sib' dod (re)

  %40
  la dod(re)
  sol, dod(re)
  fad,8. mi16 re8

  %43
  sib'16 la sol8 fa?\mbreak
  mib do do,
  la''16 sol fa8 mib

  %46
  re sib sib,
  re'16. sib32 mib16. do32 sol'16. mib32
  re16. sib32 mib16. do32 sol'16. mib32

  %49
  re16 fa sol la sib8
  sib,16 do do8.\tr[sib16]
  sib4.

  %52
  fa'8 fa(sib)
  mib, mib(sol)
  do, do(mib)
  re8. do16 sib8

  %56
  fa' fa(lab)
  si, si(re)
  sol,16 lab' sol fa mib re

  %59
  mib8. re16 do8
  sib'! dod(re)
  la dod(re)\mbreak

  %62
  sol, dod re
  fad,8. mi?16 re8
  sib' re, mib %% ripresa

  %65
  la do, re
  sol sib, do
  fad16 sol la do, sib la

  %68
  sib8 sol sol'
  la sol fad
  sol4.

  %71
  sib8 re, mib %% ripresa
  la do, re
  sol sib, do

  %74
  fad16 sol la do, sib la
  sib8 sol sol'
  la sol fad

  %77
  sol4.\fermata

  % Allegro
  sib8
  sib8[la16 sib do8 sib16 la] sib8 [la16 sib do8 sib16 la]
  sib8 sol r la re, re re sol

  %80
  sol re' re sib sib[la16 sol la8 la]
  la do do la\mbreak la[sol16 fa sol8 sol]
  sol sib sib sol fa[mi16 fa sol8\tr fa16 mi]

  %83
  fa8[mi16 fa sol8\tr fa16 mi] fa8 r sib r
  la r sol r fa[mi16 fa sol8 fa16 mi]\mbreak
  fa8[mi16 fa sol8 fa16 mi] fa8 r sib r

  %86
  la r sol r fa mi16 re sol8 fa16 mi
  la8 re, mi dod re4. sib'8
  sib8[la16 sib do8 sib16 la] sib8[la16 sib do8 sib16 la]

  %89
  sib8[la16 sol fa8 mib] re16 do sib8 r fa'
  sol sib r sol fa sib r re,
  mib8[fa16 sol fa8 mib]\mbreak re8 fa sol4\tr

  %92
  fa8 mib16 fa sol4 fa16[sib la sol fa mib re do]
  re8 sib' do la sib4 r8 re,
  sol8[fad16 sol la8 sol16 fad] sol8[fad16 sol la8 sol16 fad]\mbreak

  %95
  sol8[fa?16 mib re8 do] sib16 la sol8 r fad'
  sol8\tr fad r fad sol\tr fad r fad
  sol\tr fad r sib, do\tr sib r sib

  %98
  do\tr sib r sib\mbreak do\tr sib r re
  mib mib mib fad sol sol sol la
  sib sib sib do re[do16 sib la sol fad mi?]

  %101
  re8 sol la fad sol4 r8 re
  mib mib mib fad sol sol sol la
  sib sib  sib do re[do16 sib la sol fad? mi?]

  %104
  re8 sol la fad sol4.

}

IIbcn = \relative do {

  sol8
  sol la sib la sol re' mib do
  fad sol la re, sol la sib sol

  %3
  do do, fa?[fa,] sib'[sib,] mib mib,\mbreak
  mib' sol do, dod re mi? fad sol
  fad sol la fad re mi fad re

  %6
  sol fad sol sol, re' do re re,
  sol sib do re\mbreak sol, la sib la
  sol la sib la sol re' mib do

  %9
  fad sol la fad sol la sib sol
  sib sib sib sib do do do do\mbreak
  la la la la sib sib sib sib

  %12
  sol sol sol sol la la la la
  re, re' do sib la sol fa mi\mbreak
  re re' la[la,] re re' do? sib

  %15
  la sol fa mi re re' la[la,]
  re4 r re4. re8\mbreak
  re mi fa mi re mi fa sol

  %18
  la sib la dod, re mib re do?
  si lab? si sol do re mib do
  fa sol lab fa\mbreak do re mib do

  %21
  fa sol lab fa re mi? fad re
  sol, la si la sol la si sol
  do re mib re do re mib do

  %24
  sol' fa sol sol, sol' fa sol sol,\mbreak
  do4 r8 sol sol la sib la
  sol re' mib do re sol la fad

  %27
  sol la sib sol sol fa? sol sol,
  do' sib do do,\mbreak fa mib fa fa,
  sib' la sib sib, mib re mib mib,

  %30
  la' sol la re, sol fad sol sol,
  re' fad sol[sol,] r sol' sib sol\mbreak
  r sol fad re sol sib, do re

  %33
  sol, sol' sib sol r sol fad re
  sol sib, do re sol,4.\fermata

  %%% Larghetto
  sol'8 sib sol

  %36
  la fad re
  fad la re,
  sol re sol,

  %39
  sol'4 r8
  fa?4 r8
  mib4 r8

  %42
  re4.
  sol8. la16 sib8\mbreak
  do do, r

  %45
  fa8. sol16 la8
  sib sib, r
  sib' do la

  %48
  sib do la
  sib4 r8
  mib, fa fa,

  %51
  sib4.
  sib'8 re sib
  do do, mib

  %54
  la, la' fa
  sib fa sib,
  lab' sol fa

  %57
  sol re si
  sol si sol
  do sol do,

  %60
  sol''4 r8
  fa4 r8\mbreak
  mib4 r8

  %63
  re4 re,8
  sol' sib do % ripresa
  fa, la sib

  %66
  mib, sol la
  re, mi? fad
  sol sib, sol

  %69
  do re re,
  sol4.
  sol'8 sib do % ripresa

  %72
  fa, la sib
  mib, sol la
  re, mi? fad

  %75
  sol sib, sol
  do re re,
  sol4.\fermata

  %% Allegro
  r8

  %78
  sol sol' do, re sol, sol' do, re
  sol,4 fad sol8 la sib sol
  sol'4 sol fa? fa

  %81
  fa fa\mbreak mib mib
  dod dod re8 re mi? la,
  re re mi la, re re' sol,[sib]

  %84
  dod, si dod la re re mi la,\mbreak
  re re mi la, re re' sol, sib
  dod, si dod la re fa mi sol

  %87
  fa sib sol la re,4. r8
  sib sib' mib, fa sib, sib' mib, fa
  sib,4 la sib8 do re sib

  %90
  mib mib mib mib re re re sib
  do do la la\mbreak sib re mib la,
  sib re mib la, sib4 la

  %93
  sib8 re mib fa sib, do sib la
  sol sol' do, re sol, sol' do, re\mbreak
  sol,4 fad sol8 la sib sol

  %96
  r re' fad re r re fad re
  r re sib' sol r sol, sib sol
  r sol sib sol\mbreak r sol' sib sol

  %99
  do, do do re mib mib mib fad,
  sol sol sol la re,4 r
  r8 sol do re sol, sol' sib sol

  %102
  do, do do re\mbreak mib mib mib fad,
  sol sol sol la re,4 r
  r8 sib' do re sol,4.

}

forma = {

  \time 4/4
  \key fa\major
  \tempo 2 = 32
  \partial 8 s8
  s1*15
  s2 s4 s8
  \bar":..:"%\break
  s
  s1*17
  \set Score.measureLength = #(ly:make-moment 7/8) s2 s4 s8
  \bar":|."\break
  \mark \markup \huge "       [2.] Larghetto"
  \key fa\major
  \time 3/8
  \tempo 4 = 50
  s4.*17
  \bar":..:"%\break
  s4.*26
  \bar":|."\break
  \mark \markup \huge "      [3.] All[egr]o"
  \key fa\major
  \time 4/4
  \tempo 2 = 60
  \partial 8 s8
  \set Score.currentBarNumber = #78
  s1*9
  s2 s4.
  \bar":..:"%\break
  s8
  s1*16
  s2 s4.\fermata
  \bar":|."

}


IIvl = {
  \IIglobal
  %\notypeset
  <<\IIvln\forma>>
}

IIlt = {
  \IIglobal
  <<\IIltn\forma>>
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
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

  systems-per-page = #5
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\bold\huge\column{"                                             I. Trio per Leuto, Violino e Basso [RV 82]""   "}

\markup \huge "[1.] All[egr]o non molto"

\score {

  {

    \new ChoirStaff <<

      \new Staff <<
        \set Staff.instrumentName = \markup\center-column {"Viol[in]o"}
        \set Staff.midiInstrument = #"violin"
        \Ivl
      >>
      \new Staff <<
        \set Staff.instrumentName = \markup  "Leuto"
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \Ilt
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

    indent = 1.7\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
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

\pageBreak

\markup\bold\huge\column{"                                             II. Trio per Leuto, Violino e Basso [RV 85]""   "}

\markup \huge "[1.] And[ant]e molto"

\score {

  {

    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvl
      >>
      \new Staff <<
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \IIlt
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
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
      \override SpacingSpanner.uniform-stretching = ##t
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



%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
