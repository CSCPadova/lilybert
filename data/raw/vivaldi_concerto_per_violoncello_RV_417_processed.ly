\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto solo"

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

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
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IvlIn =  \relative do'' {

   sol,8[sol'16(la sib do re8)] sol,,8[sol'16(la sib do re8)]
   \once\stemUp sol,, \stemDown re'' sib sol\stemNeutral fad[re16(mi fad sol la8)]
   fad[re16(mi fad sol la8)] sib sol re sib

   %4
   sol re''4 re re do16 sib
   la8 re, r re' mib16(re) mib(re) mib(re) mib(re)  %%%inizio ripresa
   do2\mbreak re16[(do) re(do) re(do) re(do)]

   %7
   sib4 r r8 do16 re mib do mib sol
   la,8 la16 sib do la do mib re8 sib16 do re sib re fa
   sol,8 sol16 la sib sol sib re do8 la16 sib do la do mib

   %10
   fad,8 fad16 sol la fad la do sib8 sib'( la) sol(
   fad) mib(re) dod(\mbreak re) sib(la) sol(
   fad) mib(re) dod(\once\stemUp re) la'' fad4\tr

   %13
   sol8 sib, la4\tr \once\stemUp sol8 la' fad4\tr
   sol8 sib, la4\tr sol r %%%%fine ripresa
   R1*9

   %24
   r2 re8[re'16(mi fa sol la8)]
   re,,8 [re'16(mi fad sol la8)]dod,2~
   dod\mbreak re8 re16 mi fa re fa la

   %27
   sib2~sib8 do,?16 re mi do mi sol
   la2~la8[sib,16 do re sib re  fa]
   sol2~sol8 la,16 si dod la dod mi\mbreak

   %30
   fa8 re mi4\tr re r
   R1*8
   r8 re16[mib fa re fa sib] sol8[mib16 fa sol mib sol sib]

   %40
   do,8[la16 sol do la do mib]\mbreak  re8 sib' do, la'
   sib4 r r2
   R1*5

   %47
   sol,,8[sol'16(la sib do re8)] sol,,8[sol'16(la sib do re8)]
   \once\stemUp sol,, \stemDown re'' sib sol\stemNeutral fad[re16(mi! fad sol la8)]
   fad[re16(mi fad sol la8)] sib sol re sib

   %50
   sol re''4 re re do16 sib
   la4 r r2
   R1*11

   %63
   r4 r8 re mib16(re) mib(re) mib(re) mib(re)  %%%inizio ripresa
   do2\mbreak re16[(do) re(do) re(do) re(do)]
   sib4 r r8 do16 re mib do mib sol

   %66
   la,8 la16 sib do la do mib re8 sib16 do re sib re fa
   sol,8 sol16 la sib sol sib re do8 la16 sib do la do mib
   fad,8 fad16 sol la fad la do sib8 sib'( la) sol(

   %69
   fad) mib(re) dod(\mbreak re) sib(la) sol(
   fad) mib(re) dod(\once\stemUp re) la'' fad4\tr
   sol8 sib, la4\tr \once\stemUp sol8 la' fad4\tr

   %72
   sol8 sib, la4\tr sol\fermata r

}

IvlIIn = \relative do'' {

   sol,8[sol'16(la sib do re8)] sol,,8[sol'16(la sib do re8)]
   \once\stemUp sol,, \stemDown re'' sib sol\stemNeutral fad[re16(mi fad sol la8)]
   fad[re16(mi fad sol la8)] sib sol re sib

   %4
   sol sib'4 sib sib la16 sol
   fad4 r r2  %%%%inizio ripresa
   la'16[(sol) la(sol) la(sol) la(sol)]\mbreak

   %7
   fad2 sol8 sol,16 la sib sol sib re mib2~
   mib8 fa,16 sol la fa la do re2~
   re8 mib,16 fa sol mib sol sib do2~

   %10
   do8 re,16 mi? fad re fad la \once\stemUp sol8 sib' (la) sol(
   fad) mib(re) dod(\mbreak re) sib(la) sol(
   fad) mib(re) dod(re) do'? la4\tr

   %13
   sib8 sol fad4\tr sol8 mib' la,4\tr
   sib8 sol fad4\tr sol r %%% fine ripresa
   R1*10

   %25
   r2 la,8[la'16(si dod re mi8)]
   la,,8[la'16(si dod re mi8)]\mbreak fa4 r
   r8 sol,16 la sib sol sib re mi8 mi16 fa sol mi sol sib

   %28
   la8 fa,16 sol la fa la do re8 re16 mi fa re fa la
   sol8 mi,16 fa sol mi sol si dod8[dod16 re mi dod mi dod]
   re8 re4 dod8 re4 r

   %31
   R1*8
   r8 sib16 do re sib re fa mib8 sol,16 la sib sol sib mib
   la,8[fa16 sol la fa la do]\mbreak sib8 re la do

   %41
   re4 r r2
   R1*5
   sol,,8[sol'16(la sib do re8)] sol,,8[sol'16(la sib do re8)]

   %48
   \once\stemUp sol,, \stemDown re'' sib sol\stemNeutral fad[re16(mi! fad sol la8)]
   fad[re16(mi fad sol la8)] sib sol re sib
   sol sib'4 sib sib la16 sol

   %51
   fad4 r r2
   R1*12
   la'16[(sol) la(sol) la(sol) la(sol)]\mbreak

   %65
   fad2 sol8 sol,16 la sib sol sib re mib2~
   mib8 fa,16 sol la fa la do re2~
   re8 mib,16 fa sol mib sol sib do2~

   %68
   do8 re,16 mi? fad re fad la \once\stemUp sol8 sib' (la) sol(
   fad) mib(re) dod(\mbreak re) sib(la) sol(
   fad) mib(re) dod(re) do'? la4\tr

   %71
   sib8 sol fad4\tr sol8 mib' la,4\tr
   sib8 sol fad4\tr sol\fermata r %%% fine ripresa

}

Ivlan =  \relative do' {

   sol4 r sol r
   \once\stemUp sol8 re'' sib sol re4 r
   re r sol,8  sol' re sib

   %4
   sol4 sol sol sol
   re'8 sol la fad sib4. sib8
   fad2\mbreak la4. fad8

   %7
   re4. sol8 sol4. do,8
   do4. fa?8 fa4. sib,8
   sib4. mib8 mib4. la,8

   %10
   la4. re8 re2
   la'8(sol fad sol)\mbreak fad re4.
   la8 sol fad sol fad4 r8 re'

   %13
   re4 re re r8 re
   re4 re re r %%fine ripresa
   R1*9

   %24
   r2 fa,4 r
   fa r mi r
   la r\mbreak la4 r8 re

   %27
   re4. sol8 sol4. do,8
   do4. fa8 fa4. sib,8
   sib4. mi8 mi4. la8

   %30
   la4 la fa r
   R1*8
   fa4. re8 sib4. mib8

   %40
   do4. fa8\mbreak fa4 fa
   fa r r2
   R1*5

   %47
   sol,4 r sol r
   \once\stemUp sol8 re'' sib sol re4 r
   re r\mbreak sol,8 sol' re sib

   %50
   sol4 sol sol sol
   re' r r2
   R1*11

   %63
   r2 sib'4. sib8
   fad2\mbreak la4. fad8
   re4. sol8 sol4. do,8

   %66
   do4. fa8 fa4. sib,8
   sib4. mib8 mib4. la,8
   la4. re8 re2

   %69
   la'8(sol fad sol) fad re4.
   la8 sol fad sol fad4 r8 re'
   re4 re re r8 re

   %72
   re4 re re\fermata r %%fine ripresa

}

Ivcn = \relative do {

   sol4 r sol r
   \once\stemUp sol8 re'' sib sol re4 r
   re r sol,8  sol' re sib

   %4
   sol4 sol sol sol
   re'8 mi fad re sol4. sol8  %%%% ripresa
   la sol fad mi?\mbreak re4. re8

   %7
   sol fad sol sol, do' sib do do,
   fa? mib fa fa, sib' la sib sib,
   mib re mib mib, la' sol la la,

   %10
   re do re re, sol sol'(fad sol)
   \once\slurDashed re4. (mib8)\mbreak re sol(fad sol)
   re4.(mib8) re mi? fad re

   %13
   sol sol, re'[re,] sol do re re,
   sol' sol, re'[re,] sol8[ sol'16(la sib do re8)] %%fine ripresa
   sol,,8[sol'16(la sib do re8)]fad, re la fad

   %16
   re[re'16(mi fad sol la8)] re,,[re'16(mi fad sol la8)]\mbreak
   sib sol re sib sol4 r8 re''
   si16 fa? sol, fa' si re do si do mib, sol, mib' do' re mib re

   %19
   dod sol la, sol' dod mi? re dod \clef tenor  re dod re la mi' re mi la,
   fa'8 mi r mi fa(la,) sib(fa')
   mi(sold,) la(mi')\mbreak re(fad,) sol?(re')

   %22
   dod16 [\clef bass  la sol fa? mi re dod si] la4 r8 \clef tenor re'
   re8.[(mi16 fa8) mi16(re)]re8.[(mi16 fa8) mi16(re)]
   la'8 re, mi4\tr re r

   %25
   \clef bass re, r la r
   la r\mbreak re8 dod re re,
   sol' fad sol sol, do' ?sib do do,

   %28
   fa mi fa fa, sib' la sib sib,
   mi re mi mi, la' la, la la'
   re, re' la la, \clef tenor re'4 re16\tr(dod) re mi

   %31
   la,4. mi'8\mbreak mi16(re dod si la8) sol
   sol\tr fa r la re,16(fa la re fa8) la,
   sib sol'4. sol16(fa) mi(re) mi(re) do(sib)

   %34
   la8 fa r do' mib16 do fa, do' mib do fa, do'
   re sib fa sib re sib fa sib do la fa la do la fa la\mbreak
   mib' do fa, do' mib do fa, do' re sib fa sib re sib fa sib

   %37
   do la fa la do la fa la mib' do fa, do' mib do fa, do'
   re8\tr do16 sib re8\tr do16 sib fa'8 sib, do4\tr
   \clef bass sib,4. sib8 mib4. mib8

   %40
   fa4. fa8\mbreak sib sib, fa'[fa,]
   \clef tenor sib'4 \appoggiatura do8 sib16(la sib) sol'-. sol4(fa8) sib,
   la re \appoggiatura {do16[re]} mib8 re16 do re do sib8 \clef bass r8 fa

   %43
   sib16 re sib fa re sib re fa sol mib sol sib mib sib sol mib
   do mi! sol sib do mi? do sol la fa la do fa do la fa\mbreak
   re fad la re la fad re la' sib sol sib re sib sol re sib

   %46
   mib do mib sol do mib do sol fad re fad la re la fad re
   sib'8 sol r4 sol, r
   \once\stemUp sol8 re'' sib sol re4 r

   %49
   re r\mbreak sol,8 sol' re sib
   sol4 sol sol sol
   re'8 re sol4~sol8[sol16 (sib) do(sib) do(la)]

   %52
   sib8 fad sol4~sol8[la16 sib do sib do la]
   sib8 la16 sol \clef tenor do4~do8[re16 mib fa? mib fa re]
   mib8 si do4~do8[re16(mib) fa(mib) fa(re)]\mbreak

   %55
   mib8 sol, lab4~lab8[fa'16(mib re do sib lab)]
   sol8 la! sib4~sib8[sol'16(fa mi ?re do sib)]
   la8 si do4~do8[la'16(sol fad mi re do)]

   %58
   sib?8 sol r re' mib\tr[re16 do re8 re]
   mib\tr[re16 do re8 sol] do,\tr[sib16 la sib8 mib]\mbreak
   fad,16 la sol sib la do si re do8[sib?16(do) re(do) sib(la)]

   %61
   sib8\tr la16 sol sib8\tr la16 sol mib'8 re4 dod8
   re[mi?16 fad sol8 do,] sib la16 sol la4\tr
   sol8\clef bass re sol,4 sol'4. sol8  %%%% ripresa

   %64
   la sol fad mi?\mbreak re4. re8
   sol fad sol sol, do' sib do do,
   fa? mib fa fa, sib' la sib sib,

   %67
   mib re mib mib, la' sol la la,
   re do re re, sol sol'(fad sol)
   \once\slurDashed re4. (mib8)\mbreak re sol(fad sol)

   %70
   re4.(mib8) re mi? fad re
   sol sol, re'[re,] sol do re re,
   sol' sol, re'[re,] sol4\fermata r

}

Ibcn = \relative do {

   sol4 r sol r
   \once\stemUp sol8 re'' sib sol re4 r
   re r sol,8  sol' re sib

   %4
   sol4 sol sol sol
   re'8 mi fad re sol4. sol8  %%%% ripresa
   la sol fad mi?\mbreak re4. re8

   %7
   sol fad sol sol, do' sib do do,
   fa? mib fa fa, sib' la sib sib,
   mib re mib mib, la' sol la la,

   %10
   re do re re, sol sol'(fad sol)
   \once\slurDashed re4. (mib8)\mbreak re sol(fad sol)
   re4.(mib8) re mi? fad re

   %13
   sol sol, re'[re,] sol do re re,
   sol' sol, re'[re,] sol4 r %%%% fine ripresa
   sol r re' r

   %16
   re, r re r\mbreak
   sol r sol r8 fad'
   sol4 sol, do do,

   %19
   la'' la, re dod
   re8 la dod la re r sol r
   do,? r fa r\mbreak sib, r mi r

   %22
   la,4 r la8 la' fa mi
   re4 r re r
   re8 sib' la la, re4 r

   %25
   re r la r
   la r\mbreak re8 dod re re,
   sol' fad sol sol, do' ?sib do do,

   %28
   fa mi fa fa, sib' la sib sib,
   mi re mi mi, la' la, la la'
   re, re' la la, re mi fa re

   %31
   dod re dod si\mbreak la4. dod8
   re mi fa re re4. re8
   sol la sib sol mi4 do

   %34
   fa8 sol la fa fa4 fa
   fa fa fa fa\mbreak
   fa fa fa fa

   %37
   fa fa fa fa
   sib8 re, sib re sib sol' fa[fa,]
   sib4. sib8 mib4. mib8

   %40
   fa4. fa8\mbreak sib sib, fa'[fa,]
   sib do re do sib do re sib
   fa' sib, do fa, sib do re sib

   %43
   sib4 sib  mib mib
   do mi! fa fa\mbreak
   re fad sol sol,

   %46
   do do re re
   sol, r sol r
   \once\stemUp sol8 re'' sib sol re4 r

   %49
   re r\mbreak sol,8 sol' re sib
   sol4 sol sol sol
   re' r8 sol, la sol fad re

   %52
   sol4 r8 sol la sol fad re
   sol4 r8 do re do si sol
   do4 r8 do re do si sol\mbreak

   %55
   do4 r8 do re2
   mib4 r8 re mi2
   fa4 r8 mi fad2

   %58
   sol8 sol, sib sol r sol sib sol
   r sol sib sol r sol sib sol\mbreak
   re'2~re8 la' fad re

   %61
   sol4 sol, sol'2
   fad8 re mi fad sol sol, re'[re,]
   sol4 r8 re' sol4. sol8  %%%% ripresa

   %64
   la sol fad mi?\mbreak re4. re8
   sol fad sol sol, do' sib do do,
   fa? mib fa fa, sib' la sib sib,

   %67
   mib re mib mib, la' sol la la,
   re do re re, sol sol'(fad sol)
   \once\slurDashed re4. (mib8)\mbreak re sol(fad sol)

   %70
   re4.(mib8) re mi? fad re
   sol sol, re'[re,] sol do re re,
   sol' sol, re'[re,] sol4\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 60
  s1*72
  \bar"|."


}

Ivc = {
  \Iglobal
  \clef bass
  \notypeset
  <<\Ivcn \forma>>

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
  <<\Ibcn \forma \Ibfn>>
  \typeset

}

IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIvcn = \relative do {

   sib'16.[mib32] re8 do\tr
   sib4.
   \appoggiatura {mib16[fa]} sol8 fa mib

   %4
   re16(do sib4)
   \appoggiatura {do16[re]} mib8 re do
   re16(do sib4)

   %7
   sol'16(mib) \appoggiatura re8 do4\tr
   fa16(re) \appoggiatura do8 sib4\tr
   mib16 do \appoggiatura sib8 la4

   %10
   \terzine \tuplet 3/2 { re16(do sib) } fa'8[(re)]
   \senza \tuplet 3/2 { do16(sib la) } mib'8[(do)]\mbreak
   \tuplet 3/2 { sib16(la sol) } mi'8[(sol)]

   %13
   la,8\noBeam ~la16. fa32 sib16. sol32
   do16. la32 re16. sib32 mi16.[do32]
   \tuplet 3/2 { fa16(la sol) } fa8\noBeam~\tuplet 3/2 { fa16(mi re) }

   %16
   \tuplet 3/2 { do(fa mi) } re8\noBeam~\tuplet 3/2 { re16(do sib) }
   \tuplet 3/2 { la(sol fa) } sol4\tr
   fa4.

   %19 OK
   fa16. re'32 do8[(sib\tr)]
   la4.
   la16. fa'32 sol8[mi]

   %22
   fa16. re32 do8[(si\tr)]
   do sol do
   \tuplet 3/2 { re16 mib? fa  fa[sol lab] lab sol fa}

   %25
   mib re do4
  mib16. do32 sib8[(la\tr)]
  sib fa sib

  %28
  \tuplet 3/2 { do16(re mib) mib[(fa sol)] sol(fa mib) }\mbreak
  re(do sib4)
  fa'16 re \appoggiatura do8 sib4\tr

  %31
  do16 la \appoggiatura sol8 fa4\tr
  sol'16 mib \appoggiatura re8 do4\tr
  re8\noBeam~\tuplet 3/2 { re16(do sib) mib[(re do)] }

  %34
  fa8\noBeam ~\tuplet 3/2 { fa16 (mib re) sol[(fa mib)] }
  la8(sib) mib,
  \tuplet 3/2 { re16(do sib) } do4\tr

  %37
  sib4.\fermata

}

IIbcn = \relative do {

   sib8 fa' fa,
   sib re do
   sib la4

   %4
   sib8 re do
   sib4 la8
   sib re sib

   %7
   mib la,4
   re8 sol,4
   do8 fa,4

   %10
   sib'4.
   la\mbreak
   sol8 do,4

   %13
   fa,8 fa' sol
   la sib do
   fa,4 r8

   %16
   fa4 r8
   fa do do,
   fa4.\mbreak

   %19
   fa'8 mi do
   fa16.[sol32 la8 sol]
   fa8 sib, do

   %22
   fa sol sol,
   do mib do
   si4.

   %25
   do8 mib do
   sol' fa fa,
   sib re sib

   %28
   la4.\mbreak
   sib8 re do
   sib re sib

   %31
   fa' la fa
   la, do la
   sib sib' do

   %34
   re re, mib
   fa sol la
   sib mib, fa

   %37
   sib,4.\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sib\major
  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 60
  s4.*18
  \bar ":..:"\break
  s4.*19
  \bar":|."

}

IIvc = {
  \IIglobal
  \clef tenor
  \notypeset
  <<\IIvcn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}

IIIglobal = {
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
}

IIIvlIn =  \relative do'' {

   sol8[fa16 mib re8 re mib mib]
   re4 r  r
   mib8[re16 do sib8 sib do re]

   %4
   sol,4 r r
   sib''8[sol16 la sib8 sib re, sib']  %%ripresa
   sib2.

   %7
   la8[fa16 sol la8 la do, la']
   la2.
   sol8[mib16 fa sol8 sol sib, sol']\mbreak

   %10
   sol2.
   re8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']

   %13
   sib[sol16 la sib8 sib re, sib']
   la fad sol dod, re4\tr
   sol,4 r r%%% fine

   %16
   la'' r r
   sib r r
   sib r r\mbreak

   %19
   la r r
   la r r
   sol r r

   %22
   fad r r
   sol r r
   la r r

   %25
   sib r r
   la r r
   la r r\mbreak

   %28
   la r r
   sib r r
   la r r

   %31
   la fa mi
   re8[do16 sib la8 la sib sib]
   la4 r r

   %34
   sib8[la16 sol fa8 fa sol la]
   \once\stemUp re,[fa'16 sol la8 la fa la]
   la,[mi'16 fa sol8 sol mi sol]

   %37
   fa dod re sol, la la,]
   re4 r r\mbreak
   R2.*13

   %52
   fa'8[re16 mib fa8 fa fa, fa']
   mib[do16 re mib8 mib fa, mib']
   re[re16 mib fa8 fa fa, fa']\mbreak

   %55
   mib[do16 re mib8 mib fa, mib']
   re fa sib re, do la'
   sib4 r r

   %58
   R2.*16
   do,8[sib16 lab sol8 sol lab lab]
   sol8[re'16(mi) fa(mi) fa(mi)] re4

   %76
   lab8[sol16 fa mib8 mib fa sol]
   \once\stemUp do,[mib'16(fa) sol(fa) sol(fa)] mib4
   mib8[re16 do sib8 sib do do]

   %79
   sib8[fa'16(sol) lab(sol) lab(sol)] fa4
   do8[sib16 lab sol8 sol lab sib]
   \once\stemUp mib,8[sol'16(lab) sib(lab) sib(lab)] sol4\mbreak

   %82
   R2.*15
   sol,8[fa16 mib re8 re mib mib]\mbreak
   re4 r r

   %99
   mib8[re16 do sib8 sib do re]
   sol,4 r r
   R2.*17

   %118
   sib''8[sol16 la sib8 sib re, sib']  %%ripresa
   sib2.
   la8[fa16 sol la8 la do, la']

   %121
   la2.
   sol8[mib16 fa sol8 sol sib, sol']\mbreak
   sol2.

   %124
   re8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']
   sib[sol16 la sib8 sib re, sib']

   %127
   la fad sol dod, re4\tr
   sol,4\fermata r r%%% fine

}

IIIvlIIn = \relative do'' {

   sol8[fa16 mib re8 re mib mib]
   re4 r  r
   mib8[re16 do sib8 sib do re]

   %4
   sol,4 r r
   R2.  %%%%ripresa
   mib''8[do16 re mib8 mib  sol, mib']

   %7
   mib?2.
   re8[sib16 do re8 re fa, re']
   re2.\mbreak

   %10
   do8[la16 sib do8 do] mib, do'
   re8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']

   %13
   sib[sol16 la sib8 sib re, sib']
   la fad sol dod, re4\tr
   sol,4 r r%%% fine

   %16
   fad'' r r
   sol r r
   sol r r

   %19
   fa? r r
   fa r r
   mib r r

   %22
   do r r
   re r r
   re r r

   %25
   re r r
   dod r r
   re r r

   %28
   re r r
   re r r
   dod r r

   %31
   re re dod
   re8[do?16 sib la8 la sib sib]
   la4 r r

   %34
   sib8[la16 sol fa8 fa sol la]
   re,[re'16 mi fa8 fa re fa]
   dod[dod16 re mi8 mi dod mi]

   %37
   re dod re sol, la la,
   re4 r r\mbreak
   R2.*13

   %52
   re'8[sib16 do re8 re re, re']
   do[la16 sib do8 do la do]
   sib[sib16 do re8 re re, re']\mbreak

   %55
   do[la16 sib do8 do la do]
   sib[re fa sib, la  fa']
   re4 r r

   %58
   R2.*16
   do8[sib16 lab sol8 sol lab lab]
   sol[si16(do) re(do) re(do)] si4

   %76
   lab8[sol16 fa mib8 mib fa sol]
   \slurDashed do,8[do'16 (re) mib (re)  mib (re)] do4\slurSolid
   mib8[re16 do sib?8 sib do do]

   %79
   sib8[re16(mib) fa(mib) fa(mib)] re4
   do8[sib16 lab sol8 sol lab sib]
   mib,8[mib'16(fa) sol(fa) sol(fa)] mib4\mbreak

   %82
   R2.*15
   sol,8[fa16 mib re8 re mib mib]\mbreak
   re4 r r

   %99
   mib8[re16 do sib8 sib do re]
   sol,4 r r
   R2.*18

   %119
   mib''8[do16 re mib8 mib sol, mib']
   mib?2.
   re8[sib16 do re8 re fa, re']

   %122
   re2.\mbreak
   do8[la16 sib do8 do] mib, do'
   re8[sib16 do re8 re re, re']

   %125
   do[la16 sib do8 do re, do']
   sib[sol16 la sib8 sib re, sib']
   la fad sol dod, re4\tr

   %128
   sol,4\fermata r r%%% fine

}

IIIvlan =  \relative do' {

   sol'8[fa16 mib re8 re mib mib]
   re4 r  r
   mib8[re16 do sib8 sib do re]

   %4
   sol,4 r r
   re'4 re~re8. sib'16  %%5ripresa
   sol4 sol~sol8. mib16

   %7
   do4 do~do8. la'16
   fa4 fa~fa8. re16
   sib4 sib~sib8. sol'16\mbreak

   %10
   mib4 mib~mib8. mib16
   re'8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']

   %13
   sib[sol16 la sib8 sib re, sib']
   la fad sol dod, re4\tr
   sol, r r

   %16
   re' r r
   re r r
   mib r r\mbreak

   %19
   do r r
   re r r
   sib r r

   %22
   la r r
   sib r r
   la' r r

   %25
   sol r r
   mi! r r
   fa r r\mbreak

   %28
   fa r r
   sol r r
   mi r r

   %31
   la, la' la
   re8[do16 sib la8 la sib sib]
   la4 r r

   %34
   sib8[la16 sol fa8 fa sol la]
   re,4 la' la
   la la la

   %37
   la8 dod re sol, la la,
   re4 r r\mbreak
   R2.*13

   %52
   fa4 fa fa
   la la la
   fa fa fa\mbreak

   %55
   la la la
   fa fa fa
   fa4 r r

   %58
   R2.*16
   do'8[sib16 lab sol8 sol lab lab]
   sol4 r r

   %76
   lab8[sol16 fa mib8 mib fa sol]
   do,4 r r
   mib'8[re16 do sib8 sib do do]

   %79
   sib4 r r
   do8[sib16 lab sol8 sol lab sib]
   mib,4 r r\mbreak

   %82
   R2.*15
   sol8[fa16 mib re8 re mib mib]\mbreak
   re4 r r

   %99
   mib8[re16 do sib8 sib do re]
   sol,4 r r
   R2.*17

   %118
   re'4 re~re8. sib'16  %%5ripresa
   sol4 sol~sol8. mib16
   do4 do~do8. la'16

   %121
   fa4 fa~fa8. re16
   sib4 sib~sib8. sol'16\mbreak
   mib4 mib~mib8. mib16

   %124
   re'8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']
   sib[sol16 la sib8 sib re, sib']

   %127
   la fad sol dod, re4\tr
   sol,\fermata r r

}

IIIvcn = \relative do {

   sol'8[fa16 mib re8 re mib mib]
   re4 r  r
   mib8[re16 do sib8 sib do re]

   %4
   sol,4 r r
   sol' sol~sol8. sol16  %%% ripresa
   do,4 do~do8. do16

   %7
   fa4 fa~fa8. fa16
   sib,4 sib ~sib8. sib16
   mib4 mib~mib8. mib16\mbreak

   %10
   la,4 la'~la8. la16
   re8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']

   %13
   sib[sol16 la sib8 sib re, sib']
   la fad sol dod, re4\tr
   sol,8 sol' re sib sol sol' %%% fine

   %16
   fad re' la fad re re'
   \clef tenor sib sol' re sib sol sol'
   mib sol, do, sol' mib'[sol]\mbreak

   %19
   la, fa do' la mib' do
   re fa, sib, fa' sib[re]
   sol, mib sib' sol re' sib

   %22
   do la do, fad la do
   sib\clef bass sol sol,[sol' sib re]
   la fad re fad la do

   %25
   sib sol sol, sol' sib re
   dod mi la, mi' sol, mi!
   fa? la re, la' re la\mbreak

   %28
   fa la re, la' re la
   sib sol sol, sol' sib re
   dod mi la, sol fa mi

   %31
   fa la re fa, la, dod'
   re[do?16 sib la8 la sib sib]
   la4 r r

   %34
   sib8[la16 sol fa8 fa sol la]
   re,4 re re
   la' la, la

   %37
   re8 dod' re sol, la la,
   re re'-. re-. do-. do-. sib-.\mbreak
   <<
      {
         s8 sib sib4 s

         %40
         mi,8 mi mi4 s
         r8 do' do4 s8 la
         la4
      }\\{
         sib8 sol sol fa? fa mi
         s do? do[sib sib la]
         la mi' mi sib' sib fa
         fa4
      }
   >> r8 fa16 sol la fa la sib

   %43
   do8 do, r sol'16 la sib sol sib do
   re8 re, r la'16 sib do la do re
   mib8 do fa, do' mib do

   %46
   re sib, \clef tenor r sib'16 do re sib re fa\mbreak
   sol,4 r8 do16 re mib do mib sol
   la,4 r8 mib'(re do)

   %49
   re (la sib)\clef bass sol (fa mi!)
   fa4. mib'8(re do)
   re do16 sib mib,8 re16 do fa8 fa,

   %52
   sib4 sib' sib,
   do fa fa,
   sib sib' sib,\mbreak

   %55
   do fa fa,
   sib4. sib8 fa' fa,
   sib' la16 sib fa8\tr[mib?16 re mib fa sol la]

   %58
   sib8\tr la16 sib fa8\tr[mib?16 re mib fa sol la]
   sib8\tr la16 sib sib8\tr la16 sib re8\tr do16 sib
   do8 la fa do fa,4

   %61
   re''16 sib fa8~fa16 mib re8~re16 do sib8~
   sib16 fa' sol fa sib fa sol fa sib fa sol fa
   sol8 mib sib sol mib4

   %64
   \clef tenor mib''16 sib sol8~sol16 fa mib8~mib16 reb' do si
   do si do8~do16 re? do8~do16 mib re do
   si la si8~si16 do si8~si16 sol la si

   %67
   do re mib8~mib16 re do8~do16 sib? lab sol\mbreak
   lab [fa sol lab sib do re mib]  fa8 do
   si16 sol sol,8 r si'16 [do re si la sol]

   %70
   mib' do sol,8 r do'16[re mib do si la]
   si sol sol,8 r si'16[do re si la sol]
   fa'8. re16 mib8.[do16 re8. si16]

   %73
   do8[sib?16 lab sol fa mib re] \once \stemUp sol,8 \once\stemDown si'\mbreak
   \clef bass do[sib?16 lab sol8 sol lab lab]
   sol4 r r

   %76
   lab8[sol16 fa mib8 mib fa sol]
   do,4 r r
   mib'8[re16 do sib8 sib do do]

   %79
   sib4 r r
   do8[sib16 lab sol8 sol lab sib]
   mib,4 r r\mbreak

   %82
   mib'8 sol, fa re' mib, do'
   sib re, do lab' sib, sol'
   fa lab, sol mib' fa, re'

   %85
   mib, sol sib mib sol sib
   mib16(re) do(sib) mib(re) do(sib)do(sib) lab(sol)
   lab (sol) fa(mib) lab(sol) fa(mib) fa(mib) re(do)

   %88
   re8 do sib4 r8 \clef tenor sib'
   mib8.(reb16) reb4.(si8)\mbreak
   \appoggiatura si?8 do2.

   %91
   fa8.(mib16) mib4~mib8.(dod16)
   \appoggiatura dod?8 re2.
   sol8.(fa16) fa4~fa8. re16

   %94
   \appoggiatura re8 mib?2.
   mib?16 re do sib? do sib la sol la sol fad mi!
   fad16[re mi fad sol la sib do] re8 fad,]

   %97
   \clef bass sol8[fa?16 mib re8 re mib mib]\mbreak
   re4 r r
   mib8[re16 do sib8 sib do re]

   %100
   sol,8[la 16 sib do re mi? fad] sol la sib do
   re8 la fad re la re,
   \clef tenor do'[re16 mib fa? sol la sib] do re mib fa

   %103
   sol8 mib do sol  mib[do]
   re8[mi?16 fad sol la sib do]re do sib la
   sib8\clef bass sol re sib sol4\mbreak

   %106
   \tupletSpan 4 \senza \tuplet 3/2 {
      re''8 (dod re) re[(dod re)] do(si do)
      sib!(la sib) sib[(la sib)] lab(sol lab)
      sol(fad sol) sol[(fad sol)] fad(mi re)

      %109
      sib'(do re) mib[(re mib)] mib(re mib)
      dod(si dod)
   } re2
   \tuplet 3/2 { si8(la si) } do2

   %112
   \tuplet 3/2 { la8(sol la) } sib?2\mbreak
   \tuplet 3/2 { sol8(fad sol) do[(si do)] mib(re mib) }
   fad,4 r16 re' sib fad sol sib sol re

   %115
   mib sol mib sib do mib do la sib re sib sol
   re'8[re' \appoggiatura do sib la16 sol fad8 sol]
   re re' \appoggiatura do sib[la16 sol do,8 re]

   %118
   sol4 sol~sol8. sol16  %%% ripresa
   do,4 do~do8. do16
   fa4 fa~fa8. fa16

   %121
   sib,4 sib ~sib8. sib16
   mib4 mib~mib8. mib16\mbreak
   la,4 la'~la8. la16

   %124
   re8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']
   sib[sol16 la sib8 sib re, sib']

   %127
   la fad sol dod, re4\tr
   sol,4\fermata r r

}

IIIbcn = \relative do {

   sol'8[fa16 mib re8 re mib mib]
   re4 r  r
   mib8[re16 do sib8 sib do re]

   %4
   sol,4 r r
   sol' sol~sol8. sol16  %%% ripresa
   do,4 do~do8. do16

   %7
   fa4 fa~fa8. fa16
   sib,4 sib ~sib8. sib16
   mib4 mib~mib8. mib16\mbreak

   %10
   la,4 la'~la8. la16
   re8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']

   %13
   sib[sol16 la sib8 sib re, sib']
   la fad sol dod, re4\tr
   sol, sol sol %%%%fine

   %16
   re' re re
   sol sol sol
   do,? do do\mbreak

   %19
   fa fa fa
   sib, sib sib
   mib mib mib

   %22
   la, re re
   sol, sol sol
   fad re' re

   %25
   sol, sol sol
   la la la
   re re re\mbreak

   %28
   re re re
   sol, sol sol
   la la la

   %31
   re re la
   re'8[do16 sib la8 la sib sib]
   la4 r r

   %34
   sib8[la16 sol fa8 fa sol la]
   re,4 re re
   la' la, la

   %37
   re8 dod' re sol, la la,
   re4  fad2
   sol si,4

   %40
   do2 mi,4
   fa r mi'
   fa8 fa, fa4 r

   %43
   r8 do' do4 r
   r8 re re4 r
   do fa fa

   %46
   sib8 sib, sib4 r\mbreak
   r8 mib mib4 r
   r8 fa fa2

   %49
   sib,2.
   la
   sib4 mib, fa

   %52
   sib sib' sib,
   do fa fa,
   sib sib' sib,\mbreak

   %55
   do fa fa,
   sib4. sib8 fa' fa,
   sib4 sib r

   %58
   sib sib r
   sib sib r
   fa' r fa,

   %61
   sib sib sib
   sib sib sib\mbreak
   mib r mib,

   %64
   sol' sol sol
   lab lab fad
   sol sol fa!

   %67
   mib do do\mbreak
   fa fa lab
   sol8 sol, r4 r

   %70
   sol'8 sol, r4 r
   sol'8 sol, r4 r
   sol sol sol

   %73
   do r8 do sol[sol']\mbreak
   do[sib16 lab sol8 sol lab lab]
   sol4 r r

   %76
   lab8[sol16 fa mib8 mib fa sol]
   do,4 r r
   mib'8[re16 do sib8 sib do do]

   %79
   sib4 r r
   do8[sib16 lab sol8 sol lab sib]
   mib,4 r r\mbreak

   %82
   sol fa mib
   re do sib
   lab sol fa

   %85
   mib r r
   sol'2 mib4
   do2 la?4

   %88
   sib8 la sib do re sib
   sol'2.\mbreak
   lab

   %91
   la!
   sib
   si

   %94
   do
   do,
   re

   %97
   sol8[fa16 mib re8 re mib mib]\mbreak
   re4 r r
   mib8[re16 do sib8 sib do re]

   %100
   sol,4 r r
   re' r r
   do r r

   %103
   do r r
   re r r
   sol r sol,\mbreak

   %106
   sib' sib la
   sol sol do,
   dod dod re

   %109
   sol, sol' sol
   sol fa fa
   fa mib mib

   %112
   mib? re re\mbreak
   re do do
   re r r

   %115
   R2.
   re4 sol,8 do re sol,
   re'4 sol,8 sol' do, re

   %118
   sol,4 sol'~sol8. sol16  %%% ripresa
   do,4 do~do8. do16
   fa4 fa~fa8. fa16

   %121
   sib,4 sib ~sib8. sib16
   mib4 mib~mib8. mib16\mbreak
   la,4 la'~la8. la16

   %124
   re8[sib16 do re8 re re, re']
   do[la16 sib do8 do re, do']
   sib[sol16 la sib8 sib re, sib']

   %127
   la fad sol dod, re4\tr
   sol,\fermata r r %%%%fine

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key fa\major
   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 2 = 60
   s2.*128
   \bar"|."

}

IIIvc = {
   \IIIglobal
   \clef bass
   %\notypeset
   <<\IIIvcn \forma>>

}

IIIvlI = {
   \IIIglobal
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

IIIbc = {
   \IIIglobal
   \clef bass
   <<\IIIbcn \forma \IIIbfn>>
   \typeset

}
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

   \markup\huge "[1.] All[egr]o"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         } <<

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
               \IvlI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
               \IvlII
            >>
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
         >>

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \Ivc
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
         >>
      >>

      \layout {

         indent = 2\cm


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

%\pageBreak

\bookpart {

   \paper  {

      systems-per-page = #7

   }

   \markup\huge "[2.] And[ant]e"

   \score {

      \new ChoirStaff <<

         \new Staff \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
            \IIvc
         >>

         \new Staff \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            } <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \IIbc
         >>
      >>

      \layout {

         indent = 2\cm


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

%\pageBreak

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup\huge "[3.] All[egr]o"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         } <<

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

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"cello"
            \IIIvc
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIIbc
         >>
      >>

      \layout {

         indent = 1\cm


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
