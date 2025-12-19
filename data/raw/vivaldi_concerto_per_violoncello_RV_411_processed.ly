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

   fa,8 do'4 sib16 la re8 do4 fa8
   mi sib'4 la16 sol la8[do,16 re do8 do]
   la[do16 re do8 do] sib sib4 la16 sol

   %4
   la8[do16 re do8 do] la[do16 re do8 do]
   si16 do re4. mi16 fa sol fa mi8[do]\mbreak
   si16 do re4. mi16 fa sol fa mi8[do]

   %7
   la'16 sol fa mi re8 sol fa4(mi)
   la16 sol fa  mi re8 sol mi4 r8 sol
   sol sib4 la16 sol do, 8 do4 do8

   %10
   sol' sib4 la16 sol la8[do,16 re do8 do]
   fa[do16 re do8 do]\mbreak re16 do sib la sol8 do
   sib4(la) re16 do sib la sol8 do

   %13
   la4 r r2 %%%%%%fine ripresa
   R1*7
   do8 sol'4 fa16 mi la8 sol4 do,8

   %22
   si fa'4 mi16 re mi8[sol16 la sol8 sol]
   si,16 do re4. mi16 fa sol fa mi8 do
   si16 do re4. mi16 fa sol fa mi8 do

   %25
   la'16 sol fa mi re8 sol\mbreak fa4(mi)
   la16 sol fa mi re8 sol mi4 r
   R1*5

   %32
   re,8 la'4 sol16 fa sib8 la4 re8
   dod sol'4 fa16 mi fa8[la,16 sib la8 la]
   fa[la16 sib la8 la]\mbreak fa' re mi dod

   %35
   re4 r r2
   R1*8
   r2 sib8 fa'4 mib16 re

   %45
   sol8 fa4 sib,8 la mib'4 re16 do
   re mib fa mib re8 sib la16 sib do4.
   re16 mib fa mib re8 sib la16 sib do4.

   %48
   sol'16 fa mib re do8 fa mib4(re)
   sol16 fa mib re do8 fa re4 r\mbreak
   R1*12

   %62
   fa,8 do'4 sib16 la re8 do4 fa8
   mi sib'4 la16 sol la8[do,16 re do8 do]
   la[do16 re do8 do] sib sib4 la16 sol

   %65
   la8[do16 re do8 do] la[do16 re do8 do]
   si16 do re4. mi16 fa sol fa mi8[do]\mbreak
   si16 do re4. mi16 fa sol fa mi8[do]

   %68
   la'16 sol fa mi re8 sol fa4(mi)
   la16 sol fa  mi re8 sol mi4 r8 sol
   sol sib4 la16 sol do, 8 do4 do8

   %71
   sol' sib4 la16 sol la8[do,16 re do8 do]
   fa[do16 re do8 do]\mbreak re16 do sib la sol8 do
   sib4(la) re16 do sib la sol8 do

   %74
   la4\fermata r r2 %%%%%%fine ripresa

}

IvlIIn = \relative do'' {

   do,8 la'4 sol16 fa sib8 la4 la8
   sol sol'4 fa16 mi fa8[la,16 sib la8 la]
   fa8[la16 sib la8 la] sol sol4 fa16 mi

   %4
   fa8[la16 sib la8 la] fa8[la16 sib la8 la]
   sol16 la si4. do16 re mi re do8 sol\mbreak
   sol16 la si4.  do16 re mi re do8 sol

   %7
   fa'16 mi re do si8 re re4(do)
   fa16  mi re do si8 re do4 r8 do
   sib? mi4 sib8 sib  sib4 sib8

   %10
   sib mi4 mi8 fa[la,16 sib la8 la]
   do[la16 sib la8 la]\mbreak sib16 la sol fa mi8 sol
   sol4(fa) sib16 la sol fa mi8 sol

   %13
   fa4 r r2%%%% fine rip
   R1*7
   sol8 mi'4 re16 do fa8 mi4 mi8

   %22
   re re4 do16 si do8[mi16 fa mi8 mi]
   sol,16 la si4. do16 re mi re do8 sol
   sol16 la si4. do16 re mi re do8 sol

   %25
   fa'16 mi re do si8 re\mbreak re4(do)
   fa16 mi re do si8 re do4 r
   R1*5

   %32
   fa,8 fa4 mi16 re sol8 fa4 fa8
   mi mi'4 re16 dod re8[fa,16 sol fa8 fa]
   re8[fa16 sol fa8 fa]\mbreak re' fa, sol mi

   %35
   re4 r r2
   R1*8
   r2 fa8 re'4 do16 sib

   %45
   mib8 re4 re8 do do4 sib16 la
   sib do re do sib8 fa fa16 sol la4.
   sib16 do re do sib8 fa fa16 sol la4.

   %48
   mib'16 re do sib la8 do do4(sib)
   mib16 re do sib la8 do sib4 r\mbreak
   R1*12

   %62
   do,8 la'4 sol16 fa sib8 la4 la8
   sol sol'4 fa16 mi fa8[la,16 sib la8 la]
   fa8[la16 sib la8 la] sol sol4 fa16 mi

   %65
   fa8[la16 sib la8 la] fa8[la16 sib la8 la]
   sol16 la si4. do16 re mi re do8 sol\mbreak
   sol16 la si4.  do16 re mi re do8 sol

   %68
   fa'16 mi re do si8 re re4(do)
   fa16  mi re do si8 re do4 r8 do
   sib? mi4 sib8 sib  sib4 sib8

   %71
   sib mi4 mi8 fa[la,16 sib la8 la]
   do[la16 sib la8 la]\mbreak sib16 la sol fa mi8 sol
   sol4(fa) sib16 la sol fa mi8 sol

   %74
   fa4\fermata r r2%%%% fine rip

}

Ivlan =  \relative do' {

   r8 fa fa4 r8 fa fa4
   r8 mi mi4 r8 do do4
   r8 do do4 r8 mi mi4

   %4
   r8 do do4 r8 fa fa4
   r8 re re4 r8 sol sol4\mbreak
   r8 re re4 r8 sol sol4

   %7
   r8 do, sol' si sol2
   r8 do, sol' si sol4 r
   r8 sol sol4 r8 sol sol4

   %10
   r8 sol mi4 r8 do do4
   r8 do do4\mbreak r8 fa, do' mi
   do2 r8 fa, do' mi

   %13
   do4 r r2 %%%% fine rip
   R1*7
   r8 sol' sol4 r8 sol sol4

   %22
   r8 si si4 r8 sol sol4
   r8 sol sol4 r8 sol sol4
   r8 sol sol4 r8 sol sol4

   %25
   r8 do, sol' si\mbreak sol2
   r8 do, sol' si sol4 r
   R1*5

   %32
   r8 re re4 r8 re re4
   r8 dod dod4 r8 la la4
   r8 la la4\mbreak r8 la sib la

   %35
   fa4 r r2
   R1*8
   r2 r8 re' re4

   %45
   r8 re re4 r8 la' la4
   r8 fa fa4 r8 fa fa4
   r8 fa fa4 r8 fa fa4

   %48
   r8 sib, fa' la fa2
   r8 sib, fa' la fa4 r\mbreak
   R1*12

   %62
   r8 fa fa4 r8 fa fa4
   r8 mi mi4 r8 do do4
   r8 do do4 r8 mi mi4

   %65
   r8 do do4 r8 fa fa4
   r8 re re4 r8 sol sol4\mbreak
   r8 re re4 r8 sol sol4

   %68
   r8 do, sol' si sol2
   r8 do, sol' si sol4 r
   r8 sol sol4 r8 sol sol4

   %71
   r8 sol mi4 r8 do do4
   r8 do do4\mbreak r8 fa, do' mi
   do2 r8 fa, do' mi

   %74
   do4\fermata r r2 %%%% fine rip

}


Ivcn = \relative do {

   r8 fa fa4 r8 fa fa4
   r8 do do4 r8 fa fa4
   r8 fa fa4 r8 do do4

   %4
   r8 fa fa4 r8 fa fa4
   r8 fa fa4 r8 mi mi4\mbreak
   r8 fa fa4 r8 mi mi4

   %7
   r8 fa sol sol, do re mi do
   r fa sol sol, do re mi do
   r do do4 r8 do do4

   %10
   r8 do do4 r8 fa fa4
   r8 fa fa4\mbreak r8 sib, do do,
   fa sol la fa r sib do do,

   %13
   fa4 r8 do'' do16(la) sol(fa) re'(do) sib(la)
   sib8 la4 fa8 re' do4 \clef tenor fa8
   mi16[(fa) sol(fa) mi(re) do(sib)] la sol fa8 r do'

   %16
   \tuplet 3/2 { si16(do re) } do4 mi8 \tuplet 3/2 { re16(mi fa) } mi4 sol8
   la,16 fa' mi fa sol, mi' re mi fa, re' do re mi, do' si do
   \clef bass re, si' la si do, la' sol la si,8 sol r\clef tenor si'

   %19
   \tuplet 3/2 { si?16(do re) } do8\noBeam \senza \tuplet 3/2 { do16(re mi) } re8\noBeam \tuplet 3/2 { re16(mi fa) } mi8\noBeam \tuplet 3/2 { mi16(fa sol) } fa8\noBeam
   sol,4~sol16 fa' mi re\mbreak mi(do) sol'(do,) re4\tr
   do\clef bass do, r8 do do4

   %22
   r8 sol sol4 r8 do do4
   r8 fa fa4 r8 mi mi4
   r8 fa fa4 r8 mi mi4

   %25
   r8 fa sol sol,\mbreak do re mi do
   r fa sol sol, \clef tenor do'4 \appoggiatura re8 do16 (si do16.) re32
   si16 la sol4. si16 do re mi fa8 re

   %28
   mi16 re do8 r mi sol[fa16(mi) re(dod) si(la)]
   fa' la, si? do si8 fa' mi16 sold, la si! la8 mi'\mbreak
   re16 fad, sol la sol8 re' dod16(la) re(la) mi'(la,) fa'(la,)

   %31
   sol'4~sol16 la, dod mi fa8 mi16 re mi8 re16 dod
   re4 \clef bass   re, r8 re re4
   r8 la la4 r8 re re4

   %34
   r8 re re4\mbreak r8 re sol, la
   re16 re' dod re la sib sol la fa la sol la fa sol mi fa
   re mib' re mib do? re sib do la do sib do la sib sol la

   %37
   fad8 re r re'~re mib4 sol,8~
   sol fad4 do' si fa?8~\mbreak
   fa mi!4 sib' ?la mib8

   %40
   re[sib16 do re mib fa sol] lab4. sol16 fa
   sol8[do,16 re mib fa sol la?] sib4. la16 sol
   la fa mib'4 re16 do re(sib8.) do16(la8.)

   %43
   sib16(fa8.) re'16(sib8.) la16(fa8.) mib'16(do8.)
   re8[do16 sib do8 sib16 la]\mbreak sib8 sib, sib4
   r8 sib sib4 r8 fa' fa4

   %46
   r8 sib, sib4 r8 mib mib4
   r8 re re4 r8 mib mib4
   r8 mib fa fa, sib do re sib

   %49
   r mib fa fa, sib4 r8 fa'\mbreak
   do'16(la) sol(fa) re'(do) sib(la) sib8 la4 fa8
   re' do4 \clef tenor fa8 mi?16[(fa) sol(fa) mi(re) do(sib)]

   %52
   la sol fa8 r do' re32(do sib8.) fa'32(mi re8.)
   do8 fa4 la,8 sib32(la sol8.) re'32(do sib8.)
   la8[fa16 mi fa sol la sib]\mbreak \appoggiatura re8 do16(si do8) \appoggiatura re8 do16(si do8)

   %55
   \appoggiatura re8 dod16(si? dod8) \appoggiatura re8 dod16(si dod8) \appoggiatura mi8 re16(dod re8) \appoggiatura mi8 re16(dod re8)
   \appoggiatura fa8 mi16(re mi8) \appoggiatura fa8 mi16(re mi8) fa16 mi re8 r fa
   sol16 mi re do sol'8 sib,? sib\tr la r do

   %58
   re16 fa mi re mi sol fa mi\mbreak fa do sib4 la8
   fa'16 do sib4 la8 sib16 re do sib do mi re do
   re fa mi re mi sol fa mi fa8[mi16 re do sib la sol]

   %61
   fa'8[mi16 re do sib la sol] la8 sol16 fa sol4\tr
   fa8 \clef bass fa fa4 r8 fa fa4
   r8 do do4 r8 fa fa4

   %64
   r8 fa fa4 r8 do do4
   r8 fa fa4 r8 fa fa4
   r8 fa fa4 r8 mi mi4\mbreak

   %67
   r8 fa fa4 r8 mi mi4
   r8 fa sol sol, do re mi do
   r fa sol sol, do re mi do

   %70
   r do do4 r8 do do4
   r8 do do4 r8 fa fa4
   r8 fa fa4\mbreak r8 sib, do do,

   %73
   fa sol la fa r sib do do,
   fa4\fermata r r2

}

Ibcn = \relative do {

   r8 fa fa4 r8 fa fa4
   r8 do do4 r8 fa fa4
   r8 fa fa4 r8 do do4

   %4
   r8 fa fa4 r8 fa fa4
   r8 fa fa4 r8 mi mi4\mbreak
   r8 fa fa4 r8 mi mi4

   %7
   r8 fa sol sol, do re mi do
   r fa sol sol, do re mi do
   r do do4 r8 do do4

   %10
   r8 do do4 r8 fa fa4
   r8 fa fa4\mbreak r8 sib, do do,
   fa sol la fa r sib do do,

   %13
   fa4 r r8 fa' fa4%%%%% fine ripresa
   r8 fa fa4 r8 fa fa4
   r8 do do4 r8 fa fa4

   %16
   r8 do do4\mbreak r8 do do4
   fa mi re do
   si la sol8 la si sol

   %19
   sol' r la r si r do r
   r si, la sol\mbreak do do, sol''[sol,]
   do, do' do4 r8 do do4

   %22
   r8 sol sol4 r8 do do4
   r8 fa fa4 r8 mi mi4
   r8 fa fa4 r8 mi mi4

   %25
   r8 fa sol sol,\mbreak do re mi do
   r fa sol sol, do re mi do
   sol' la si sol sol,4. si8

   %28
   do re mi do la4. dod8
   re r sol r do,? r fa r\mbreak
   sib, r mi r la,2~

   %31
   la8 si dod la re fa sol la
   re,, re' re4 r8 re re4
   r8 la la4 r8 re re4

   %34
   r8 re re4\mbreak r8 re sol, la
   re,4 r re' r
   re r do r

   %37
   re8 mi fad re sol4 do,
   re re, sol' sol,\mbreak
   do do, fa' fa,

   %40
   sib r sib8 do re sib
   mib4 r do8 re mi do
   fa sol la fa sib, re fa mib

   %43
   re do sib mi! fa sol la fa
   sib re, mib fa\mbreak sib, sib sib4
   r8 sib sib4 r8 fa' fa4

   %46
   r8 sib, sib4 r8 mib mib4
   r8 re re4 r8 mib mib4
   r8 mib fa fa, sib do re sib

   %49
   r mib fa fa, sib4 r\mbreak
   r8 fa' fa4 r8 fa fa4
   r8 fa fa4 r8 do do4

   %52
   r8 fa fa4 r8 sib, sib4
   r8 fa' fa4 r8 mi mi4
   r8 fa fa4\mbreak r8 fa fa4

   %55
   r8 mi mi4 r8 fa fa4
   r8 dod dod4 r8 re re4
   r8 mi mi4 r8 fa fa4

   %58
   sib, do\mbreak la8 re mi fa
   la, re mi fa sib,4 la
   sib do fa, r

   %61
   fa r fa do
   fa8 fa' fa4 r8 fa fa4
   r8 do do4 r8 fa fa4

   %64
   r8 fa fa4 r8 do do4
   r8 fa fa4 r8 fa fa4
   r8 fa fa4 r8 mi mi4\mbreak

   %67
   r8 fa fa4 r8 mi mi4
   r8 fa sol sol, do re mi do
   r fa sol sol, do re mi do

   %70
   r do do4 r8 do do4
   r8 do do4 r8 fa fa4
   r8 fa fa4\mbreak r8 sib, do do,

   %73
   fa sol la fa r sib do do,
   fa4\fermata r r2%%%%% fine ripresa

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key fa\major
   \time 4/4
   \tempo 2 = 55
   s1*74
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
  \senza
}

IIvcn = \relative do {

   re'8
   dod16. mi32 re16. mi32 la,8 sol fa16.[re32] la'16. fa32 re'16.[la32] fa'16. re32
   mi8 la, \tuplet 3/2 { r16 la(si dod [re mi)] } fa16. sol32 mi16. fa32 re16. mi32 do?16. re32
   sib?4 \tuplet 3/2 { r16 sol[(la] sib do re) } mi16. fa32 re16. mi32 do16. re32 sib16. do32

   %4
   la4 r8 fa' \tuplet 3/2 { sold,16(la si) } do8\noBeam \tuplet 3/2 { si16(do re) } mi8\noBeam
   fa mi~\tuplet 3/2 { mi16 la sol fa[mi re] do si la re[do si] } si8.\tr la16
   la4 r8 la re fa \appoggiatura mi re do

   %7
   \tuplet 3/2 { sib?16(re do sib[la sol)]} sol8 re'\mbreak mi sol\appoggiatura fa mi re
   dod16 si? la8 r16 la32(si! dod re mi fa) sol8 fa~fa16 la(fa dod)
   re8 sib? \appoggiatura la sold [re'] dod32(si?) dod(la) sol'[(fa) sol(mi)]
   mi8.\tr re16

   %10
   re1

}

IIbcn = \relative do {

   re8
   la si dod la re mi fa re
   la si dod la re4 r
   sol,8 la sib sol do?4 r

   %4
   la8 si do re mi la sold do
   re do si sold la fa mi mi,
   la sib? la sol fa4. fa8

   %7
   sol2\mbreak sol4. sol8
   la si dod si la re la'[sol]
   fa re sib! [sold] la sib' la la,

   %10
   re1

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 4/4
  \tempo 4 = 40
  \partial 8 s8
  s1*9
  s1\fermata
  \bar"|."


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

   fa,8[sol16 la sib8 la16 sol] la8[sib16 do re8 do16 sib]
   do8[fa fa8. mi16] fa8 do sol' sib
   la la, sib4 do8[re16 mi fa sol la sib]

   %4
   do8[la16 sib do8 sib16 la] re8[sol,16 la sib8 la16 sol]
   do8[fa,16 sol la8 sol16 fa]\mbreak sib8[mi,16 fa sol8 fa16 mi]
   la8[re,16 mi fa8 mi16 re] mi8[fa16 sol la8 sol16 fa]

   %7
   mi8[fa16 sol la8 sol16 fa] mi8[fa16 sol la8 sol16 fa]
   mi8 fa fa mi fa4 r %%%%%% fine ripresa
   R1*10

   %19
   do8[re16 mi fa8 mi16 re]\mbreak mi8[fa16 sol la8 sol16 fa]
   sol8[do do8. si16] do8 sol re fa
   mi4 fa sol8[mi16 fa sol8 fa16 mi]

   %22
   la8[re,16 mi fa8 mi16 re] sol8[do,16 re mi8 re16 do]
   fa8[si,16 do re8 do16 si] mi8 do' do si\mbreak
   do4 r r2

   %25
   R1*7
   r2 re,,8[mi16 fa sol8 fa16 mi]
   fa8[sol16 la sib8 la16 sol] la8[re re8. dod16]

   %34
   re8 la mi' sol fa4 sol
   la8 re,4 dod8 re4 r
   R1*3

   %39
   fa,8[sol16 la sib8 la16 sol] la8[sib16 do re8 do16 sib]
   la8 fa r4 r2
   R1*11

   %52
   fa8[sol16 la sib8 la16 sol] la8[sib16 do re8 do16 sib]
   do8[fa fa8. mi16] fa8 do sol' sib
   la la, sib4 do8[re16 mi fa sol la sib]

   %55
   do8[la16 sib do8 sib16 la] re8[sol,16 la sib8 la16 sol]
   do8[fa,16 sol la8 sol16 fa]\mbreak sib8[mi,16 fa sol8 fa16 mi]
   la8[re,16 mi fa8 mi16 re] mi8[fa16 sol la8 sol16 fa]

   %58
   mi8[fa16 sol la8 sol16 fa] mi8[fa16 sol la8 sol16 fa]
   mi8 fa fa mi fa4\fermata r %%%%%% fine ripresa

}

IIIvlIIn = \relative do'' {

   r2 fa,8[sol16 la sib8 la16 sol]
   la8[sib16 do re8 do16 sib] do8[fa fa8. mi16]
   fa8 do fa[sol] la16 la, sib do re mi fa sol

   %4
   la8[fa16 sol la8 sol16 fa]sib8[sib16 la sol8 fa16 mi]
   la8[la16 sol fa8 mi16 re]\mbreak sol8[sol16 fa mi8 re16 do]
   fa8[fa16 mi re8 do16 sib] do8[re16 mi fa8 mi16 re]

   %7
   do8[re16 mi fa8 mi16 re] do8[re16 mi fa8 mi16 re]
   do8 la sol4 fa r %%%%% fine rip
   R1*10

   %19
   r2 do'8[re16 mi fa8 mi16 re]
   mi8[fa16 sol la8 sol16 fa] mi8[do' do8. si16]
   do8 sol do, re mi[mi16 re mi8 re16 do]

   %22
   fa8[fa16 mi re8 do16 si] mi8[mi16 re do8 si16 la]
   re8[re16 do si8 la16 sol] do8 mi re4\mbreak
   mi r r2

   %25
   R1*8
   re,8[mi16 fa sol8 fa16 mi] fa8[sol16 la sib8 la16 sol]
   la8 [re re8. dod16] re8 la re mi

   %35
   fa4 mi re r
   R1*3
   r2 fa,8[sol16 la sib8 la16 sol]

   %40
   fa8 do r4 r2
   R1*11
   r2 fa8[sol16 la sib8 la16 sol]

   %53
   la8[sib16 do re8 do16 sib] do8[fa fa8. mi16]
   fa8 do fa[sol] la16 la, sib do re mi fa sol
   la8[fa16 sol la8 sol16 fa]sib8[sib16 la sol8 fa16 mi]

   %56
   la8[la16 sol fa8 mi16 re]\mbreak sol8[sol16 fa mi8 re16 do]
   fa8[fa16 mi re8 do16 sib] do8[re16 mi fa8 mi16 re]
   do8[re16 mi fa8 mi16 re] do8[re16 mi fa8 mi16 re]

   %59
   do8 la sol4 fa\fermata r %%%%% fine rip

}

IIIvlan =  \relative do' {

   R1
   fa8[sol16 la sib8 la16 sol] la8[sib16 do re8 do16 sib]
   do8[fa, fa8. mi16] fa4 r8 mi

   %4
   do4 fa sol2
   fa\mbreak mi
   re sol4 do8 re

   %7
   sol,4 do8 re sol,4 do8 re
   sol, la do, do la4 r %%%fine rip
   R1*11

   %20
   do8[re16 mi fa8 mi16 re] mi8 fa16 sol la8 sol16 fa]
   sol8[do do8. si16] do4 r8 do
   re2 do

   %23
   si sol4. sol8\mbreak
   sol4 r r2
   R1*8

   %33
   r2 re8[mi16 fa sol8 fa16 mi]
   fa8[sol16 la sib8 la16 sol] fa8[re re8. dod16]
   re8 la' la la fa4 r

   %36
   R1*3
   do8 do re mi do la' fa mi
   do la r4 r2

   %41
   R1*12
   fa'8[sol16 la sib8 la16 sol] la8[sib16 do re8 do16 sib]
   do8[fa, fa8. mi16] fa4 r8 mi

   %55
   do4 fa sol2
   fa\mbreak mi
   re sol4 do8 re

   %58
   sol,4 do8 re sol,4 do8 re
   sol, la do, do la4\fermata r %%%fine rip

}

IIIvcn = \relative do {

   R1
   r2 fa8 [sol16 la sib8 la16 sol]
   la8[sib16 do re8 do16 sib] la4 r8 sol

   %4
   fa4 fa'2 mi4~
   mi re2 do4~
   do sib~sib8 sib la sib

   %7
   do sib la sib do sib la sib
   do fa, do' do, fa la, fa fa' %%% fine rip.
   la do la fa re' sib \once\stemUp sib, re'

   %10
   do la \once \stemUp la, do' sib sol \once\stemUp do,, sib''
   la fa do' la fa' do la fa
   si16[do re do si la sol fa] mi8\once\stemUp do, sib''? sol

   %13
   la16[sib do sib la sol fa mi] re8 fa si re
   mi,16 do' sib? do mi, do' sib do fa, do' sib do fa, do' sib do
   fad, re' do re fad, re' do re\mbreak sol, re' do re sol, re' do re

   %16
   sold, mi' re mi sold, mi' re mi la, mi' re mi la, mi' re mi
   la, fa' mi fa la, fa' mi fa si, do re do si la sol fa
   mi do' si do mi, do' si do fa, do' si do sol, si' la si

   %19
   do,4 si\mbreak do fa
   do r do8[re16 mi fa8 mi16 re]
   mi8[fa16 sol la8 sol16 fa] mi8 do do'4~

   %22
   do si2 la4~
   la sol8 la16 si do8 do, sol' [sol,]
   \clef tenor do'8 si16(do) \appoggiatura mi8 re do16(si) do(re mi4) re16 do

   %25
   re(mi fa4) mi16 re mi do si? do sol'8 mi
   mi\tr re r16 sol fa sol dod, mi re mi la, mi' re mi
   fa re do? re la re do re sib re do re sol, do sib do\mbreak

   %28
   la do sib do fa, sib la sib sol sib la sib mi, la sol la
   fa8 re re'4~re8[dod16 re mi8 re16 dod]
   re8 la r fa' mib2

   %31
   re dod16(si) dod(la) sol'(fa) sol(mi?)
   fa8 mi16 re \appoggiatura fa8 mi re16 dod\mbreak re4 \clef bass dod,
   re sol, re' sol,8 la

   %34
   re[mi16 fa sol8 fa16 mi] fa8[sol16 la sib8 la16 sol]
   fa8 re la' la,\clef tenor fa''4 \appoggiatura sol8 fa16(mi fa8)
   mi2~mi8[la16(sol fa mi re do)]

   %37
   re4 \appoggiatura mi8 re16(do re8)\mbreak do2~
   do8[fa16(mi re do sib la)] sib4 \appoggiatura do8 sib16(la sib8)
   la16 sol fa8 r4 r2

   %40
   r4 r8 do' fa16(sol) la(sol) la(sol) fa(mi)
   re do re mi re mi fa re mi fa sol fa sol fa mi re\mbreak
   do sib do re do re mi do re mi fa mi fa  mi re do

   %43
   sib la sib do sib do re sib mi fa sol fa mi re do sib
   la8 fa fa'4~fa8 la4 fa8~
   fa re4 do8 sib sol'4 mi8~

   %46
   mi do4 sib8\mbreak la32(sib do8.) sib32(do re8.)
   do32(re mi8.) re32(mi fa8.) mi16(fa sol4.)
   fa16(sol la4.) sol8[fa16(mi re8 do)]

   %49
   sib2~sib8[sol'16(fa mi re do sib)]
   la(sol) la(fa) do'(sib) do(la) fa' do sib la fa' do sib la
   fa'8[mi16 re do sib la sol] la8 sol16 fa sol4\tr

   %52
   fa \clef bass r r2
   r fa8 [sol16 la sib8 la16 sol]
   la8[sib16 do re8 do16 sib] la4 r8 sol

   %55
   fa4 fa'2 mi4~
   mi re2 do4~
   do sib~sib8 sib la sib

   %58
   do sib la sib do sib la sib
   do fa, do' do, fa,4\fermata r

}

IIIbcn = \relative do {

   R1
   r2 fa8 [sol16 la sib8 la16 sol]
   la8[sib16 do re8 do16 sib] la4 r8 sol

   %4
   fa4 fa'2 mi4~
   mi re2 do4~
   do sib~sib8 sib la sib

   %7
   do sib la sib do sib la sib
   do fa, do' do, fa, sol la sol%%%% fine rip
   fa4 r8 fa sib4 r8 sib

   %10
   la4 r8 la\mbreak sol4 r8 do,
   fa4 fa fa fa
   sol sol do, do

   %13
   fa fa sol sol
   do mi fa fa
   fad fad\mbreak sol sol

   %16
   sold sold la la
   la la sol?8 fa sol sol,
   do4 mi fa sol,

   %19
   do si\mbreak do fa
   do r do8[re16 mi fa8 mi16 re]
   mi8[fa16 sol la8 sol16 fa] mi8 do do'4~

   %22
   do si2 la4~
   la sol8 la16 si do8 do, sol' [sol,]
   do[mi] fa sol do,4 do'~

   %25
   do si do do,
   sol'8 la sib! sol la4 dod,
   re fad sol mi\mbreak

   %28
   fa? re  mi dod
   re8 mi fa re sib'4 sol
   fa8 mi fa re sol la sib la

   %31
   sold fad sold mi la sol? la la,
   re fa? sol la\mbreak re,4 dod
   re sol,re' sol,8 la

   %34
   re[mi16 fa sol8 fa16 mi] fa8[sol16 la sib8 la16 sol]
   fa8 re la' la, re' re re re
   do? do do do fa, fa fa fa

   %37
   sib sib sib sib\mbreak la la la la
   re, re re re sol sol do, do
   fa fa sib, do fa fa sib, do

   %40
   fa sol la sol fa fa fa fa
   sib, sib sib sib sib sib sib sib\mbreak
   la la la la la la la la

   %43
   sol sol sol sol do, do do do
   fa sol la sol fa fa fa fa
   fa fa fa fa sol sol sol sol

   %46
   do do mi mi fa la sol sib
   la do sib re do do do mi,
   fa fa fa fa mi4 r

   %49
   sol8 fa mi re do4 r
   fa fa fa fa
   fa r fa8 fa do do,

   %52
   fa4 r r2
   r fa'8 [sol16 la sib8 la16 sol]
   la8[sib16 do re8 do16 sib] la4 r8 sol

   %55
   fa4 fa'2 mi4~
   mi re2 do4~
   do sib~sib8 sib la sib

   %58
   do sib la sib do sib la sib
   do fa, do' do, fa,4\fermata r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown






}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 60
  s1*59
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

   \markup\huge "[2.] Largo"

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

   \markup\huge "[3.] All[egr]o molto"

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
