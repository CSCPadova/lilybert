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

parentSlur =
 -\tweak stencil
 #(lambda (grob)
   (let* ((cp (ly:grob-property grob 'control-points))
          (lp (grob-interpret-markup grob (markup #:teeny "(")))
          (rp (grob-interpret-markup grob (markup #:teeny ")"))))
     (set! lp (ly:stencil-aligned-to lp Y CENTER))
     (set! lp (ly:stencil-aligned-to lp X 0.2))
     (set! lp (ly:stencil-translate lp (first cp)))
     (set! rp (ly:stencil-aligned-to rp Y CENTER))
     (set! rp (ly:stencil-aligned-to rp X -0.2))
     (set! rp (ly:stencil-translate rp (last cp)))
     (list-set! cp 0
       (cons (cdr (ly:stencil-extent lp X))
             (cdr (first cp))))
     (list-set! cp (1- (length cp))
       (cons (car (ly:stencil-extent rp X))
             (cdr (last cp))))
     (ly:grob-set-property! grob 'control-points cp)
     (apply ly:stencil-add (list lp rp
       (ly:slur::print grob)))))
 \etc

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
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza \terzine

}

IvlIn =  \relative do'' {

   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.
   re(do re) mib-. re(do re) mib-. re(do re) mib-.
   fa(mib fa) sol-.  fa(mib fa) sol-.  fa(mib fa) sol-.

   %4
   sib8 sib,4 sol'8 fa mib
   fa sib,4 sol'8 fa mib
   fa16(mib fa) sol-. mib(re mib) fa-. re(do re) mib-.\mbreak

   %7
   \appoggiatura re8 do4.\tr do8 re mi
   fa16(mi fa) sol-. fa(mi fa) sol-. fa(mi fa) sol-.
   mi8 do re mi fa sol

   %10
   la16(sol la) sib-. la16(sol la) sib-. la16(sol la) sib-.
   sol8 mi fa sol la sib
   do16\f(sib do) re-. do16(sib do) re-. do16(sib do) re-. \mbreak

   %13
   do16\f(sib do) re-. do16(sib do) re-. do16(sib do) re-.
   do4 sib8 la sol fa
   sol4 \afterGrace sol2\tr( {fa16[mib)]}

   %16
   fa(mi fa) sol-. fa(mi fa) sol-. fa(mi fa) sol-.
   do,(sib do) re-. do(sib do) re-. do(sib do) re-.
   la8. sib16 do4 do

   %19
   fa,8 fa'4 do la8\mbreak
   fa fa'4 do la8
   fa2. fa

   %22
   fa16(mi fa) sol-. fa16(mi fa) sol-. fa16(mi fa) sol-.
   la(sol la) sib-.  la(sol la) sib-.  la(sol la) sib-.
   do(sib do) re-. do(sib do) re-. do(sib do) re-.

   %25
   fa8 fa,4 re'8 do sib
   do fa,4 re'8 do sib\mbreak
   do16(sib do) re-. sib(la sib) do-. la(sol la) sib-.

   %28
   sol4\tr fa r
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.
   re(do re) mib-. re(do re) mib-. re(do re) mib-.

   %31
   fa(mib fa) sol-.  fa(mib fa) sol-. fa(sol la) fa
   sib8 sib,4 sol'8 fa\tr mib\mbreak
   fa sib,4 sol'8 fa\tr mib

   %34
   fa16(mib fa) sol-. mib(re mib) fa-. re(do re) mib-.
   do4.\tr fa8 sol la
   sib16(la sib) do-. sib(la sib) do-. sib(do sib) la-.

   %37
   sol(fa sol) la-. sol(fa sol) la-. sol(la sib) sol-.
   la(sol la) sib-. la(sol la) sib-. la(sib la) sol-.\mbreak
   fad(mi fad) sol-. fad(mi fad) sol-. fad(sol la) fad-.

   %40
   sol la fa! sol mib! fa re mib do re sib do
   mib fa re mib do re sib do la sib sol la
   fad re' re re re re re re re re re re

   %43
   re, do' do do do do do do do do do do\mbreak
   re, sib' sib sib sib sib sib sib sib sib sib sib
   la4 fad'\tr sol8. sib,16

   %46
   la4 fad'\tr sol8. sib,16
   la8 sol' sib, sol' re, fad'\tr
   <sol sib, re, sol,>4. r8 r4

   %49
   sib,16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.
   re(do re) mib-. re(do re) mib-. re(do re) mib-.
   fa(mib fa) sol-.  fa(mib fa) sol-.  fa(sol la) fa-.

   %52
   sib8 sib,4 sol'8 fa\tr mib
   fa sib,4 sol'8 fa mib
   fa16(mib fa) sol-. mib(re mib) fa-. re(do re) mib-.

   %55
   do4.\tr fa,8 sol la
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.\mbreak
   la8 fa sol la sib do

   %58
   re16(do re) mib-. re(do re) mib-. re(do re) mib-.
   do8 la sib do re mib
   fa16(mib fa) sol-. fa16(mib fa) sol-. fa16(mib fa) sol

   %61
   fa16(mib fa) sol-. fa16(mib fa) sol-. fa16(mib fa) sol
   fa4 mib8 re do sib\mbreak
   do4 \afterGrace do2\tr( {sib16[do])}

   %64
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.
   fa,(mib fa) sol-. fa(mib fa) sol-. fa(sol fa) mib-.
   re8. mib 16 fa4 fa

   %67
   sib,8 sib'4 fa re8
   sib sib'4 fa re8
   sib2.

}

IvlIIn =  \relative do'' {

   sib'8 sib fa fa re re
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.
   re(do re) mib-. re(do re) mib-. re(do re) mib-.

   %4
   fa8 sib,4 mib8 re do
   re sib4 mib8 re do
   re16(do re) mib-. do(sib do) re-. sib(la sib) do-.\mbreak

   %7
   \appoggiatura sib8 la4.\tr  r8 r4
   R2.
   r4 r8 do re mi

   %10
   fa16(mi fa) sol-. fa16(mi fa) sol-. fa16(mi fa) sol-.
   mi8 do re mi fa sol
   la16(sol la) sib-. la16(sol la) sib-. la16(sol la) sib-.

   %13
   la16(sol la) sib-. la16(sol la) sib-. la16(sol la) sib-.
   la4 sol8 fa mi re
   fa4 mi2\tr

   %16
   fa8 la, la la la la
   la16(sol la) sib-. la16(sol la) sib-. la16(sib la) sol-.
   la8. sib16 do4 do

   %19
   fa,8 fa'4 do  la8
   fa fa'4 do la8
   fa2. fa

   %22
   fa'8 fa do do la la
   fa16(mi fa) sol-. fa16(mi fa) sol-. fa16(mi fa) sol-.
   la16(sol la) sib-. la16(sol la) sib-. la16(sol la) sib-.

   %25
   do8 fa,4 sib8 la sol
   la fa4 sib8 la sol
   la16(sol la) sib-. sol(fa sol) la-. fa(mi fa) sol-.

   %28
   mi4\tr fa r
   sib'8 sib fa fa re re\mbreak
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.

   %31
   re(do re) mib-. re(do re) mib-. re(mib fa) re-.
   fa8 sib,4 mib8 re do
   re sib4 mib8 re do

   %34
   re16(do re) mib-. do(sib do) re-. sib(la sib) do-.
   la4. la8 sib do
   re16(do re) mib-. re(do re) mib-. re(mib re) do-.\mbreak

   %37
   sib16(la sib) do-. sib16(la sib) do-. sib16(do re) sib-.
   do(sib do) re-. do(sib do) re-. do(re do) sib-.
   la(sol la) sib-. la(sol la) sib-. la(sib do) la-.
   sib4 r r
   do r r

   %42
   la16 sib sib sib sib sib sib sib sib sib sib sib
   re, la' la la la la la la la la la la\mbreak
   re, sol sol sol sol sol sol sol sol sol sol sol

   %45
   fad8. sol16 la4 sib
   fad8. sol16 la4 sib
   sol sol re

   %48
   sol, r r
   sib''8 sib fa fa re re\mbreak
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.

   %51
   re(do re) mib-. re(do re) mib-. re(mib fa) re-.
   fa8 sib,4 mib8 re do
   re sib4 mib8 re do

   %54
   re16(do re) mib-. do(sib do) re-. sib(la sib) do-.
   \appoggiatura sib8 la4.\tr r8 r4
   R2.

   %57
   r4 r8 fa sol la
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.
   la8 fa sol la sib do

   %60
   re16(do re) mib-. re(do re) mib-. re(do re) mib-.\mbreak
   re16(do re) mib-. re(do re) mib-. re(do re) mib-.
   re4 do8 sib la sol

   %63
   \parenthesize la4 la2\tr
   sib8 fa fa fa fa fa
   re16(do re) mib-. re16(do re) mib-. re16(do re) mib-.

   %66
   re8. mib16 fa4 fa
   sib,8 sib'4 fa re8
   sib sib'4 fa re8

   %69
   sib2.

}

IvlIIIn = \relative do''{

   sib'8 sib fa fa re re
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.
   re(do re) mib-. re(do re) mib-. re(do re) mib-.

   %4
   fa8 sib,4 mib8 re do
   re sib4 mib8 re do
   re16(do re) mib-. do(sib do) re-. sib(la sib) do-.\mbreak

   %7
   \appoggiatura sib8 la4.\tr  r8 r4
   R2.
   r4 r8 do re mi

   %10
   fa16(mi fa) sol-. fa16(mi fa) sol-. fa16(mi fa) sol-.
   mi8 do re mi fa sol
   la16(sol la) sib-. la16(sol la) sib-. la16(sol la) sib-.

   %13
   la16(sol la) sib-. la16(sol la) sib-. la16(sol la) sib-.
   la4 sol8 fa mi re
   fa4 sol2\tr

   %16
   fa8 la, la la la la
   la16(sol la) sib-. la16(sol la) sib-. la16(sib la) sol-.
   la8. sib16 do4 do

   %19
   fa,8 fa'4 do  la8
   fa fa'4 do la8
   fa2. fa

   %22
   fa'8 fa do do la la
   fa16(mi fa) sol-. fa16(mi fa) sol-. fa16(mi fa) sol-.
   la16(sol la) sib-. la16(sol la) sib-. la16(sol la) sib-.

   %25
   do8 fa,4 sib8 la sol
   la fa4 sib8 la sol
   la16(sol la) sib-. sol(fa sol) la-. fa(mi fa) sol-.

   %28
   mi4\tr fa r
   sib'8 sib fa fa re re\mbreak
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.

   %31
   re(do re) mib-. re(do re) mib-. re(mib fa) re-.
   fa8 sib,4 mib8 re do
   re sib4 mib8 re do

   %34
   re16(do re) mib-. do(sib do) re-. sib(la sib) do-.
   la4. la8 sib do
   re16(do re) mib-. re(do re) mib-. re(mib re) do-.\mbreak

   %37
   sib16(la sib) do-. sib16(la sib) do-. sib16(do re) sib-.
   do(sib do) re-. do(sib do) re-. do(re do) sib-.
   la(sol la) sib-. la(sol la) sib-. la(sib do) la-.

   %40
   sib16 re re re re re re re re re re re
   re, do' do do do do do do do do do do
   re, sib' sib sib sib sib sib sib sib sib sib sib\mbreak

   %43
   re, la' la la la la la la la la la la
   re, sol sol sol sol sol sol sol sol sol sol sol
   fad8. sol16 la4 sib

   %46
   fad8. sol16 la4 sib
   sol sol re

   %48
   sol, r r
   sib''8 sib fa fa re re\mbreak
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.

   %51
   re(do re) mib-. re(do re) mib-. re(mib fa) re-.
   fa8 sib,4 mib8 re do
   re sib4 mib8 re do

   %54
   re16(do re) mib-. do(sib do) re-. sib(la sib) do-.
   \appoggiatura sib8 la4.\tr r8 r4
   R2.

   %57
   r4 r8 fa sol la
   sib16(la sib) do-. sib16(la sib) do-. sib16(la sib) do-.
   la8 fa sol la sib do

   %60
   re16(do re) mib-. re(do re) mib-. re(do re) mib-.\mbreak
   re16(do re) mib-. re(do re) mib-. re(do re) mib-.
   re4 do8 sib la sol

   %63
   \parenthesize la4 la2\tr
   sib8 re, re re re re
   re16(do re) mib-. re16(do re) mib-. re16(do re) mib-.

   %66
   re8. mib16 fa4 fa
   sib,8 sib'4 fa re8
   sib sib'4 fa re8

   %69
   sib2.

}

Ibcn = \relative do {

   sib8 sib re re fa fa
   sib sib fa fa re re
   sib sib sib sib sib sib

   %4
   sib4 r r
   sib r r
   sib' la sib

   %7
   fa fa, r
   R2.*4
   fa'8 fa, fa' fa fa fa

   %13
   fa fa, fa' fa fa fa\mbreak
   fa4 mib8 fa sol la
   sib4 do do,

   %16
   fa8 fa fa fa fa fa
   fa fa fa fa fa mi
   fa8. la16 do4 do

   %19
   fa,8 fa'4 do la8
   fa fa'4 do la8
   fa16 sib la sol fa sol fa mib re mib re do fa2.

   %22
   fa8 fa la la do do
   fa fa do do la la
   fa fa fa fa fa fa

   %25
   fa4 r r
   fa r r
   fa mi fa

   %28
   do fa16 sol fa mib re mib re do
   sib8 sib re re fa fa
   sib sib fa fa re re

   %31
   sib sib sib sib sib sib\mbreak
   sib4 r r
   sib r r

   %34
   sib' la sib
   fa fa, r
   re'8 re re re re re

   %37
   mib mib mib mib mib mib
   do do do do do do
   mib mib mib mib mib mib

   %40
   sol4 r r
   do, r r
   fad16 fad fad fad fad fad fad fad\mbreak fad fad fad fad

   %43
   fad fad fad fad fad fad fad fad fad fad fad fad
   fad fad fad fad fad fad fad fad fad fad fad fad
   red8 red, red' red, sol' sol,

   %46
   red'?8 red, red' red, sol' sol,
   do4 re re,
   \once\stemUp sol16 sib' la sol fa sol fa mib re mib re do

   %49
   sib8 sib re re fa fa\mbreak
   sib sib fa fa re re
   sib sib sib sib sib sib

   %52
   sib4 r r
   sib r r
   sib' la sib

   %55
   fa fa, r
   R2.*4
   sib'8 sib, sib' sib sib sib

   %61
   sib sib, sib' sib sib sib
   sib4 la,8 sib do re
   mib4 fa fa,\mbreak

   %64
   sib8 sib sib sib sib sib
   sib8 sib sib sib sib la
   sib8. mib16 fa4 fa

   %67
   sib,8 sib'4 fa re8
   sib sib'4 fa re8
   sib2.

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sib\major
  \time 3/4
  \tempo 2 = 60
  \repeat volta 2 {s2.*20}
  \alternative {{s2.}{s}}\break
  \set Score.currentBarNumber = #22
  \repeat volta 2 {s2.*48}

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

IvlIII = {
  \Iglobal
  <<\IvlIIIn \forma>>

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
  \con \terzine

}

IIvlIn =  \relative do'' {

   sib8
   fa'[fa fa fa\tr]
   sol16(la) sib(sol) fa8 sib,~
   sib \tuplet 3/2 { la16(sib do) } fa,(la) do(mib)

   %4
   re(do) sib(la) sib8 do
   re8.\tr do32 sib sib'8 re,
   re\tr do r fa

   %7
   \tuplet 3/2 { mi16(fa sol) } sol-.[sol-.] sol-. sol-. sol-. sol-.
   \tuplet 3/2 { fa(sol la) } la-.[la-.] la-. la-. la-. la-.\mbreak
   \tuplet 3/2 { sol(la sib) } sib-.[sib-] sib-. sib-. sib-. sib-.

   %10
   \tuplet 3/2 { la(sib do) } do-. [do-.] do-. [do-. do-. do-.]
   \tuplet 3/2 { sib(do re) } re-.[re-.] re-. re-. re-. re-.
   re8\tr do r sib
   \tuplet 3/2 { la16(sol fa) sib[(la sol)] } sol4\tr

   %14
   fa8[re(do sib)]
   la[sib(la sol)]
   fa16 fa'-. mib-. re-. do-. sib-. la-. sol-.\mbreak

   %17
   \tuplet 3/2 { la16(sol fa) sib[(la sol)] } \afterGrace sol4\tr ({fa16[sol)]}
   fa4. fa8
   do'[do do do]

   %20
   re16(mi fa) re do8 fa,~
   fa8 \tuplet 3/2 { mi16(fa sol) } do,(mi) sol(sib)
   la(sol) fa(mi) fa8 sib

   %23
   fa'[fa fa fa]
   sol16(la) sib(sol) fa8 sib,~
   sib8\tuplet 3/2 { la16(sib do) }\mbreak fa,(la) do(mib?)

   %26
   re(do) sib(la) sib8 do
   re8.\tr do32 sib sib'8 re,
   re\tr do r fa\tr

   %29
   \tuplet 3/2 { fa16[(mib re)] } re-. re-. re-. re-. re-. re-.
   \tuplet 3/2 { re16(do sib) } sib-.[sib-.] sib-. sib-. sib-. sib-.
   \tuplet 3/2 { fa16[(mib re)] } re-. re-. re-. re-. re-. re-.

   %32
   \tuplet 3/2 { re[(mib fa)] } fa-. fa-. fa-. fa-. fa-. fa-.\mbreak
   \tuplet 3/2 { fa[(sol lab)] } lab-. lab-. lab-. lab-. lab-. lab-.
   lab8\tr sol r sol'

   %35
   \tuplet 3/2 { sol16[(fa mi)] } mi-. mi-. mi-. mi-. mi-. mi-.
   \tuplet 3/2 { mi[(re do)] }  do-. do-. do-. do-. do-. do-.
   \tuplet 3/2 { sol16[(fa mi)] } mi-. mi-. mi-. mi-. mi-. mi-.

   %38
   \tuplet 3/2 { mi[(fa sol)] } sol-. sol-. sol-. sol-. sol-. sol-.
   \tuplet 3/2 { sol[(la sib)] } sib-. sib-.\mbreak sib-. sib-. sib-. sib-.
   sib8\tr la r la'

   %41
   \tuplet 3/2 { la16[(sol fad)] } fad-. fad-. fad-. fad-. fad-. fad-.
   \tuplet 3/2 { fad[(mi re)] } re-. re-. re-. re-. re-. re-.
   \tuplet 3/2 { la16[(sol fad)] } fad-. fad-. fad-. fad-. fad-. fad-.

   %44
   \tuplet 3/2 { fad[(sol la)] } la-. la-. la-. la-. la-. la-.
   \tuplet 3/2 { la[(sib do)] } do-. do-.\mbreak do-. do-. do-. do-.
   sib32(sol16.) mib'32(do16.) re32(sib16.) do32(la16.)

   %47
   sol8 mib'32(do16.) re32(sib16.) do32(la16.)
   sib32(sol16.) do32(la16.) sib32(sol16.) la32(fad16.)
   \tuplet 3/2 { sib16(la sol) do[(sib la)] } \afterGrace la4\tr  ( {sol16[la)]}

   %50
   sol8 sol, r sib'
   fa'[fa fa fa\tr]
   sol16(la) sib(sol) fa8 sib,~\mbreak

   %53
   sib8 \tuplet 3/2 { la16(sib do)} fa,(la) do(mib)
   re(do) sib(la) sib8 do
   re8.\tr do32 sib sib'8 re,

   %56
   re\tr do r sib
   \tuplet 3/2 { la16[(sib do)] } do-. do-. do-. do-. do-. do-.
   \tuplet 3/2 { sib[(do re)] } re-. re-. re-. re-. re-. re-.

   %59
   \tuplet 3/2 { do[(re mib)] } mib-. mib-. mib-. mib-. mib-. mib-.\mbreak
   \tuplet 3/2 { re[(mib fa)] } fa-. fa-. fa-. fa-. fa-. fa-.
   \tuplet 3/2 { mib[(fa sol)] } sol-. sol-. sol-. sol-. sol-. sol-.

   %62
   sol8\tr fa r mib
   \tuplet 3/2 { re16(do sib) mib[(re do)] } \afterGrace do4\tr ( {sib16[do)]}
   sib8[sol(fa mib)]

   %65
   re[mib(re do)]
   sib16 sib' la sol fa mib re do
   \tuplet 3/2 { re(do sib) mib[(re do)] } do4\tr

   %68
   sib4 r8

}

IIvlIIn =  \relative do'' {

   sib8
   re[re re re]
   mib16(fa) sol(mib) re8 fa,
   sol[sol la la]

   %4
   sib4 r8 la
   sib8.\tr la32 sib re8 sib
   sib\tr la r4

   %7
   R2
   r4 r8 fa'
   \tuplet 3/2 { mi16[(fa sol)] } sol-. sol-.  sol-. sol-.  sol-. sol-.

   %10
   \tuplet 3/2 { fa[(sol la)] } la-. la-. la-. la-. la-. la-.\mbreak
   \tuplet 3/2 { sol[(la sib)] } sib-. sib-. sib-. sib-. sib-. sib-.
   sib8\tr la r sol

   %13
   fa fa4 mi8\tr
   fa[sib,(la sol)]
   fa[sol(fa mi)]

   %16
   fa16 re'-. do-. sib-. la-. sol-. fa-. mi-.
   fa8 fa4 mi8
   fa4. fa8

   %19
   la[la la la]
   sib16(do) re(sib) la8 do,
   re[re mi mi]\mbreak

   %22
   fa4 r8 sib
   re[re re re]
   mib16(fa) sol(mib) re8 fa,

   %25
   sol[sol la la]
   sib4. la8
   \appoggiatura do sib8.\tr la32 sib re8 sib

   %28
   sib\tr la r4
   r r8 fa'
   \tuplet 3/2 { fa16[(mib re)] } re-. re-. re-. re-. re-. re-.

   %31
   \tuplet 3/2 { re[(do sib)] } sib-. sib-. sib-. sib-. sib-. sib-.\mbreak
   \tuplet 3/2 { fa16[(mib re)] } re-. re-. re-. re-. re-. re-.
   \tuplet 3/2 { re[(mib fa)] } fa-. fa-. fa-. fa-. fa-. fa-.

   %34
   fa8\tr mib r4
   r r8 sol'
   \tuplet 3/2 { sol16[(fa mi)] } mi-. mi-. mi-. mi-. mi-. mi-.

   %37
   \tuplet 3/2 { mi[(re do)] } do-. do-. do-. do-. do-. do-.
   \tuplet 3/2 { sol[(fa mi)] } mi-. mi-. mi-. mi-. mi-. mi-.
   \tuplet 3/2 { mi[(fa sol)] } sol-. sol-. sol-. sol-. sol-. sol-.\mbreak

   %40
   sol8\tr fa r4
   r r8 la'
   \tuplet 3/2 { la16[(sol fad)] } fad-. fad-. fad-. fad-. fad-. fad-.

   %43
   \tuplet 3/2 { fad[(mi re)] } re-. re-. re-. re-. re-. re-.
   \tuplet 3/2 { la16[(sol fad)] } fad-. fad-. fad-. fad-. fad-. fad-.
   \tuplet 3/2 { fad[(sol la)] } la-. la-. la-. la-. la-. la-.

   %46
   sol8 r r4
   sib32(sol16.) do32(la16.) sib32(sol16.) la32(fad16.)
   sib32(sol16.) mib'32[(do16.)] re32(sib16.) do32[(la16.)]

   %49
   sol8 sol4 fad8
   sol8 sol, r4
   re''8[re re re\tr]

   %52
   mib16(fa) sol(mib) re8 fa,
   sol[sol la la]
   sib4 r8 la

   %55
   sib8.\tr la32 sib re8 sib
   sib\tr la r4
   R2

   %58
   r4 r8 sib
   \tuplet 3/2 { la16[(sib do)] } do-. do-.\mbreak  do-. do-. do-. do-.
   \tuplet 3/2 { sib[(do re)] } re-. re-. re-. re-. re-. re-.

   %61
   \tuplet 3/2 { do[(re mib)] } mib-. mib-.  mib-. mib-.  mib-. mib-.
   mib8\tr re r do
   sib sib4 la8

   %64
   sib[mib,(re do)]
   sib[do(sib la)]
   sib16 sib' la sol fa mib re do

   %67
   sib8 sib4 la8
   sib4 r8

}

IIvlIIIn = \relative do''{

   sib8
   re[re re re]
   mib16(fa) sol(mib) re8 fa,
   sol[sol la la]

   %4
   sib4 r8 la
   sib8.\tr la32 sib re8 sib
   sib\tr la r4

   %7
   R2
   r4 r8 fa'
   \tuplet 3/2 { mi16[(fa sol)] } sol-. sol-.  sol-. sol-.  sol-. sol-.

   %10
   \tuplet 3/2 { fa[(sol la)] } la-. la-. la-. la-. la-. la-.\mbreak
   \tuplet 3/2 { sol[(la sib)] } sib-. sib-. sib-. sib-. sib-. sib-.
   sib8\tr la r sol

   %13
   fa fa4 mi8\tr
   fa[fa-.(fa-. fa-.)]
   fa2\prall

   %16
   fa,16 fa'-. mib-. re-. do-. sib-. la-. sol-.
   \tuplet 3/2 { la(sol fa) sib[(la sol)] } sol4\tr
   fa4. fa8

   %19
   la[la la la]
   sib16(do) re(sib) la8 do,
   re[re mi mi]

   %22
   fa4 r8 sib
   re[re re re]
   mib16(fa) sol(mib) re8 fa,

   %25
   sol[sol la la]
   sib4. la8
   sib8.\tr la32 sib re8 sib\mbreak

   %28
   sib8\tr la r fa'\tr
   \tuplet 3/2 { fa16[(mib re)] } re-. re-. re-. re-. re-. re-.
   \tuplet 3/2 { fa16[(mib re)] } re-. re-. re-. re-. re-. re-.

   %31
   \tuplet 3/2 { re16[(do sib)] } sib-. sib-. sib-. sib-. sib-. sib-.
   \tuplet 3/2 { fa16[(mib re)] } re-. re-.  re-. re-.  re-. re-.
   \tuplet 3/2 { re[(mib fa)] } fa-. fa-. fa-. fa-. fa-. fa-.\mbreak

   %34
   fa8\tr mib r sol'
   \tuplet 3/2 { sol16[(fa mi)] } mi-. mi-. mi-. mi-. mi-. mi-.
   \tuplet 3/2 { sol16[(fa mi)] } mi-. mi-. mi-. mi-. mi-. mi-.

   %37
   \tuplet 3/2 { mi[(re do)] }  do-. do-. do-. do-. do-. do-.
   \tuplet 3/2 { sol16[(fa mi)] } mi-. mi-. mi-. mi-. mi-. mi-.
   \tuplet 3/2 { mi[(fa sol)] } sol-. sol-. sol-. sol-. sol-. sol-.

   %40
   sol8\tr fa r la'
   \tuplet 3/2 { la16[(sol fad)] } fad-. fad-. fad-. fad-. fad-. fad-.
   \tuplet 3/2 { la16[(sol fad)] } fad-. fad-. fad-. fad-. fad-. fad-.

   %43
   \tuplet 3/2 { fad[(mi re)] } re-. re-. re-. re-. re-. re-.
   \tuplet 3/2 { la16[(sol fad)] } fad-. fad-. fad-. fad-. fad-. fad-.
   \tuplet 3/2 { fad[(sol la)] } la-. la-. la-. la-. la-. la-.\mbreak

   %46
   sol8 mib'32(do16.) re32(sib16.) do32(la16.)
   sib32(sol16.) do32(la16.) sib32(sol16.) la32(fad?16.)
   sol8 mib'32(do16.) re32(sib16.) do32(la16.)

   %49
   \tuplet 3/2 { sib16(la sol) do[(sib la)] } la4\tr
   sol8 sol, r sib'
   fa'[fa fa fa\tr]

   %52
   sol16(la) sib(sol) fa8 sib,~\mbreak
   sib8[sol la la]
   sib4 r8 la

   %55
   sib8.\tr la32 sib re8 sib
   sib\tr la r sib
   \tuplet 3/2 { la16[(sib do)] } do-. do-. do-. do-. do-. do-.

   %58
   \tuplet 3/2 { sib[(do re)] } re-. re-. re-. re-. re-. re-.
   \tuplet 3/2 { la16[(sib do)] } do-. do-. do-. do-. do-. do-.\mbreak
   \tuplet 3/2 { sib[(do re)] } re-. re-. re-. re-. re-. re-.

   %61
   \tuplet 3/2 { do[(re mib)] } mib-. mib-.  mib-. mib-.  mib-. mib-.
   mib8\tr re r do
   sib sib4 la8

   %64
   sib sib4.~\prall
   sib2\prall
   la16 re do sib la sol fa mib

   %67
   \tuplet 3/2 { re(do sib) mib[(re do)] } do4\tr
   sib4 r8

}

IIbcn = \relative do {

   sib'8
   sib[sib sib sib]
   mib mib, la re,
   mib[mib fa fa]

   %4
   sib[fa sib, fa']
   sib[sib sib sib,]
   fa' fa, r4

   %7
   R2*2
   r4 r8 mi'
   \tuplet 3/2 { fa16[(mi fa)] } fa-. fa-. fa-. fa-. fa-. fa-.

   %11
   sib-. sib-. sib-. sib-. sib-. sib-. sib-. sib-.\mbreak
   sib8 fa r mib
   fa4 do'8 do,

   %14
   fa4 r
   fa4 r
   fa4 r8 do

   %17
   fa4 do'8 do,
   fa4. fa8
   fa[fa fa fa]

   %20
   sib sib, fa' la,
   sib[sib do do]
   fa4~fa16 mib re do

   %23
   sib8[sib' sib sib]
   mib mib, do' re,\mbreak
   mib[mib fa fa]

   %26
   sib[fa sib, fa']
   sib[sib sib sib,]
   fa' fa, r4

   %29
   R2
   r4 r8 sib
   \tuplet 3/2 { sib16[(la sib)] } sib-. sib-. sib-. sib-. sib-. sib-.

   %32
   \tuplet 3/2 { sib16[(la sib)] } sib-. sib-. sib-. sib-. sib-. sib-.
   sib sib sib sib re re re re
   re8 mib r4

   %35
   R2\mbreak
   r4 r8 do
   \tuplet 3/2 { do16[(si do)] } do-. do-. do-. do-. do-. do-.

   %38
   \tuplet 3/2 { do16[(si do)] } do-. do-. do-. do-. do-. do-.
   do do do do mi mi mi mi
   mi8\tr fa r4

   %41
   R2
   r4 r8 re
   \tuplet 3/2 { re16 \parentSlur (dod re) } re-.[re-.] re-. re-. re-. re-.

   %44
   \tuplet 3/2 { re16 \parentSlur (dod re) } re-.[re-.] re-. re-. re-. re-.
   re re re re fad fad fad fad
   sol8 r r4

   %47
   sol r
   sol r
   sol8 sol, re' re,

   %50
   sol4 r8 sib'
   sib[sib sib sib]
   mib mib, sib' sib,

   %53
   mib[mib fa fa]
   sib fa sib, fa'
   sib[sib sib sib,]

   %56
   fa' fa, r4\mbreak
   R2*2
   r4 r8 la'

   %60
   \tuplet 3/2 { sib16[(la sib)] } sib-. sib-. sib-. sib-. sib-. sib-.
   mib mib mib mib mib mib mib mib
   mib8 sib r la

   %63
   sib sib, fa' fa,
   sib4 r
   sib8 fa r4

   %66
   sib r
   sib fa'8 fa,
   sib4 r8

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sib\major
  \time 2/4
  \tempo 4 = 50
  \partial 8 s8
  s2*17
  s4. \bar":..:"\break
  s8
  s2*49
  s4.
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

IIvlIII = {
  \IIglobal
  <<\IIvlIIIn \forma>>

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
  \senza \terzine

}

IIIvlIn =  \relative do'' {

   \tuplet 3/4 { fa16 sol la }
   sib8  fa re sib fa re
   sib4 sib8 \once\stemUp sib re'16 mib fa8
   do fa, fa fa do'16 re mib8

   %4
   re \stemUp sib, sib sib\stemDown re'16-. mib-. fa-. sol-.\stemNeutral
   fa8 sol la sib fa re
   re4\tr do8 fa4.

   %7
   mi8 re do sib'4 sib8\mbreak
   sib4\tr la8 fa4.\tr
   mi8 re do sib'4 sib8

   %10
   sib4 la8 r4 re8
   r4 do8 r4 sib8
   la sol fa r4 re'8

   %13
   r4 do8 r4 sib8
   la sol fa sol4.\tr
   fa re16 re re re re re\mbreak

   %16
   do do do do do do sib sib sib sib sib sib
   la la la la la la re re re re re re
   do do do do do do sib sib sib sib sib sib

   %19
   la8 sol fa sol4.\tr
   fa2 \tuplet 3/4 {do'16(re mi)}
   fa8 do la fa do la\mbreak

   %22
   fa'4 fa8 fa la16 sib do8
   sol do, do do sol'16 la sib8
   la fa fa fa8. fa'16 sol la

   %25
   sib8 fa re sib fa re
   sib4 sib8\mbreak \once\stemUp sib re'16 mib fa8
   <<{do fa, fa fa do'16 re mib8}\\{r8 do, do do}>>

   %28
   \once\stemDown re' sib, sib \once\stemUp sib re'16-. mib-. fa-. sol-.
   fa8 sol la sib fa re
   re4\tr do8 fa4.~

   %31
   fa8 re16 mib fa8 fa re fa
   re sib16 do re8 re sib re\mbreak
   sib fa16 sol la sib sib8 fa sib

   %34
   fa re16 mib fa8 fa re fa
   re sib16 do re8 re re16 mib fa8
   fa fa16 sol lab8 lab sol fa

   %37
   sol fa mib sol'4.~
   sol8 mi16 fa sol8 sol mi sol
   mi do16 re mi8\mbreak mi do mi

   %40
   do sol16 la sib do do8 sol do
   sol mi16 fa sol8 sol mi sol
   mi do16 re mi8 mi mi16 fa sol8

   %43
   sol sol16 la sib8 sib la sol
   la sol fa la'4.~
   la8 fad16 sol la8 la fad la\mbreak

   %46
   fad re16 mi fad8 fad re fad
   re la16 si dod re re8 la re
   la fad16 sol la8 la fad la

   %49
   fad re16 mi fad8 fad fad16 sol la8
   la la16 sib! do8 do sib la
   sib la sol sol'4.\mbreak

   %52
   fad8 mi re do'4 do8
   sib la sol sol4.
   fad8 mi re do'4 do8

   %55
   sib la sol r4 mib'8
   r4 re8 r4 do8
   sib la sol r4 mib'8

   %58
   r4 re8 r4 do8
   sib la sol la4.\tr \mbreak
   sol mib16 mib mib mib mib mib

   %61
   re re re re re re do do do do do do
   sib sib sib sib sib sib mib mib mib mib mib mib
   re re re re re re do do do do do do

   %64
   sib8 la sol la4.\tr
   sol~sol8 \tuplet 3/4 { fa'16 sol la }\mbreak
   sib8 fa re sib fa re

   %67
   sib4 sib8\mbreak \once\stemUp sib re'16 mib fa8
   do fa, fa fa do'16 re mib8
   \once\stemDown re sib, sib \once\stemUp sib re'16-. mib-. fa-. sol-.

   %70
   fa8 sol la sib fa re
   re4\tr do8 sib4.\tr
   la8 sol fa mib'4 mib8

   %73
   mib4\tr re8 sib4.\mbreak
   la8 sol fa mib'4 mib8
   mib4\tr re8 r4 sol8

   %76
   r4 fa8 r4 mib8
   re do sib r4 sol'8
   r4 fa8 r4 mib8

   %79
   re\tr do sib do4.\tr
   sib sol16 sol sol sol sol sol
   fa fa fa fa fa fa\mbreak mib mib mib mib mib mib

   %82
   re re re re re re sol sol sol sol sol sol
   fa fa fa fa fa fa mib mib mib mib mib mib
   re8 do sib do4.\tr

   %85
   sib2

}

IIIvlIIn =  \relative do'' {

   \tuplet 3/4 { fa16 sol la }
   sib8  fa re sib fa re
   sib4 sib8 sib sib'16 do re8
   la fa fa fa la16 sib do8

   %4
   sib sib sib sib do16 re mib8
   re mib fa fa re sib
   sib4\tr la8 la4.

   %7
   sol sol'4 sol8
   sol4\tr fa8 la,4.
   sol sol'4 sol8\mbreak

   %10
   sol4\tr fa8 r4 sib8
   r4 la8 r4 sol8
   fa\tr mi fa r4 sib8

   %13
   r4 la8 r4 sol8
   fa mi fa mi4.\tr
   fa sib,16 sib sib sib sib sib

   %16
   la la la la la la sol sol sol sol sol sol
   fa fa fa fa fa fa sib sib sib sib sib sib\mbreak
   la la la la la la sol sol sol sol sol sol

   %19
   fa8 mi fa mi4.\tr
   fa2 \tuplet 3/4 {do'16(re mi)}
   fa8 do la fa do la\mbreak

   %22
   fa'4 fa8 fa fa16 sol la8
   sol mib mib mib mib16 fa sol8
   fa fa fa fa8. fa'16 sol la

   %25
   sib8 fa re sib fa re\mbreak
   sib4 sib8 sib sib'16 do re8
   la fa fa fa la16 sib do8

   %28
   sib sib sib sib sib16-. do-. re-. mib-.
   re8 mib fa fa re sib
   sib4\tr la8 r4 r8

   %31
   r4 r8 fa'4.~
   fa8 re16 mib fa8 fa re fa
   re sib16 do re8 re sib  re

   %34
   sib fa16(sol la sib)\mbreak sib8 fa sib
   fa re16 mib fa8 fa sib,16 do re8
   re re16 mib fa8 fa mib re

   %37
   mib re mib r4 r8
   r4 r8 sol'4.~
   sol8 mi16 fa sol8 sol mi sol

   %40
   mi do16 re mi8 mi do mi
   do sol16 la si do do8 sol do
   sol mi16 fa sol8\mbreak sol do,16 re mi8

   %43
   mi mi16 fa sol8 sol fa mi
   fa mi fa r4 r8
   r4 r8 la'4.~

   %46
   la8 fad16 sol la8 la fad la
   fad re16 mi fad8 fad re fad
   re la16 si dod re re8 la re

   %49
   la fad16 sol la8 la re,16 mi fad8
   fad fad16 sol la8\mbreak la sol fad
   sol fad? sol sib4.\tr

   %52
   la la'4 la8
   sol fad sol sib,4.\tr
   la la'4 la8

   %55
   sol fad sol r4 do8
   r4 sib8 r4 la8
   sol fad? mib r4 do'8

   %58
   r4 sib8 r4 la8
   sol fad sol fad4.\tr
   sol do,16 do do do do do\mbreak

   %61
   sib sib sib sib sib sib la la la la la la
   sol sol sol sol sol sol do do do do do do
   sib sib sib sib sib sib la la la la la la

   %64
   sol8 fad sol fad4.\tr
   sol~sol8 \tuplet 3/4 { fa'16 sol la }\mbreak
   sib8 fa re sib fa re

   %67
   sib4 sib8 sib sib'16 do re8
   la fa fa fa la16 sib do8\mbreak
   sib sib sib sib sib16-. do-. re-. mib-.

   %70
   re8 mib fa fa re sib
   sib4\tr la8 re,4.\tr
   do do'4 do8

   %73
   do4\tr sib8 re,4.
   do do'4 do8
   do4\tr sib8 r4 mib8

   %76
   r4 re8 r4 do8
   sib\tr la sib r4 mib8
   r4 re8 r4 do8\mbreak

   %79
   sib\tr la sib la4.\tr
   sib sol16 sol sol sol sol sol
   fa fa fa fa fa fa mib mib mib mib mib mib

   %82
   re re re re re re mib mib mib mib mib mib
   re re re re re re do do do do do do
   sib8 la sib la4.\tr

   %85
   sib2

}

IIIvlIIIn = \relative do''{

   \tuplet 3/4 { fa16 sol la }
   sib8  fa re sib fa re
   re4 re8 re4.
   r8 do do do4 r8

   %4
   r fa fa sib do16 re mib8
   re mib fa fa re sib
   sib4 la8 la4.\mbreak

   %7
   sol sol'4 sol8
   sol4\tr fa8 la,4.
   sol sol'4 sol8

   %10
   sol4\tr fa8 r4 sib8
   r4 la8 r4 sol8
   \appoggiatura sol fa  mi fa r4 sib8

   %13
   r4 la8 r4 sol8
   fa mi fa mi4.\tr
   fa\mbreak fa,16 fa fa fa fa fa

   %16
   fa fa fa fa fa fa mi mi mi mi mi mi
   fa fa fa fa fa fa fa fa fa fa fa fa
   fa fa fa fa fa fa mi mi mi mi mi mi

   %19
   fa4. sol\tr
   fa2 \tuplet 3/4 { do'16\parentSlur (re mi) }
   fa8 do la fa do la\mbreak

   %22
   do4 do8 do fa16 sol la8
   <mib sol,> <mib sol,> <mib sol,> <mib sol,> mib16 fa sol8
   fa do do <<{fa8. fa'16 sol la}\\ do,,8.>>

   %25
   sib''8 fa re sib fa re
   re4 re8 re4.
   fa8 la la la la16 sib do8

   %28
   sib fa fa fa sib16-. do-. re-. mib-.\mbreak
   re8 mib fa fa re sib
   sib4\tr la8 r4 r8

   %31
   fa' re16 mib fa8 fa re fa
   fa re16 mib fa8 fa re fa
   re sib16 do re8 re sib re

   %34
   sib fa16 \parentSlur (sol la sib) sib8 fa sib
   fa re16 mib fa8 fa sib,16 do re8\mbreak
   re re16 mib fa8 fa mib\tr re

   %37
   mib re mib r4 r8
   sol' mi16 fa sol8 sol mi sol
   sol mi16 fa sol8 sol mi sol

   %40
   mi do16 re mi8 mi do mi
   do sol16 la si do do8 sol do
   sol mi16 fa sol8\mbreak sol do,16 re mi8

   %43
   mi fa sol sol fa mi
   fa mi fa r4 r8
   la' fad16 sol la8 la fad la

   %46
   fad re16 mi fad8 fad re fad
   re la16 si dod re re8 la re
   la fad16 sol la8\mbreak la fad la

   %49
   fad re16 mi fad8 fad fad16 sol la8
   fad fad16 sol la8 la sol fad
   sol fad sol sib4.\tr

   %52
   la la'4 la8
   sol\tr fad sol sib,4.\tr
   la la'4 la8

   %55
   sol\tr fad sol r4 do8\mbreak
   r4 sib8 r4 la8
   sol fad sol r4 do8

   %58
   r4 sib8 r4 la8
   sol fad sol fad4.\tr
   sol sol,16 sol sol sol sol sol

   %61
   sol sol sol sol sol sol fad fad fad fad fad fad
   sol sol sol sol sol sol\mbreak sol sol sol sol sol sol
   sol sol sol sol sol sol fad fad fad fad fad fad

   %64
   sol4. la\tr
   sol\parentSlur  (sol8) \tuplet 3/4 { fa'16 sol la }
   sib8 fa re sib fa re

   %67
   re4 re8 re4.
   <<{la'8 fa fa <do' fa,> do16 re mib8}\\{s8 do, do do}>>
   la'8 re, re\mbreak re sib'16-. do-. re-. mib-.

   %70
   re8 mib fa fa re sib
   sib4 la8 re,4.
   do do'4 do8

   %73
   do4\tr sib8 re,4.
   do do'4 do8
   do4\tr sib8 r4 mib8

   %76
   r4 re8 r4 do8
   sib\tr la sib r4 mib8\mbreak
   r4 re8 r4 do8

   %79
   sib\tr la sib la4.\tr
   sib sib,16 sib sib sib sib sib
   sib sib sib sib sib sib la la la la la la

   %82
   sib sib sib sib sib sib  sib sib sib sib sib sib
   sib sib sib sib sib sib la la la la la la\mbreak
   sib4. do\tr

   %85
   sib2

}

IIIbcn = \relative do {

   \tuplet 3/4 { fa16 sol la }
   sib8 sib, sib sib sib sib
   sib4 sib8 sib4.
   <<{r8 sib sib sib4.}\\{r8 fa fa fa4.}>>

   %4
   r8 sib sib sib4.
   sib' sib,
   fa'4 fa,8 fa'16 sol la8 fa

   %7
   do4 do,8 do' re mi
   fa4 fa,8 fa'16 sol la8 fa
   do4 do,8 do' re mi\mbreak

   %10
   fa4 fa,8 sib'16 do re8 sib
   fa la fa do16 re mi8 do
   fa4 fa,8 sib'16 do re8 sib

   %13
   fa la fa do16[re mi8 do]
   fa do fa do'4 do,8
   fa4. sib16 sib sib sib sib sib

   %16
   fa fa fa fa fa fa do do do do do do
   fa fa fa fa fa fa sib sib sib sib sib sib
   fa fa fa fa fa fa do do do do do do\mbreak

   %19
   fa8 do fa do'4 do,8
   fa2 \tuplet 3/4 {do'16 \parentSlur (re mi?)}
   fa8 fa, fa fa fa fa

   %22
   fa4 fa8 fa4.
   r8 do do do4.
   r8 fa fa fa8. fa16 sol la

   %25
   sib8 sib, sib sib sib sib
   sib4 sib8 sib4.
   r8 fa fa fa4.\mbreak

   %28
   r8 sib sib sib4.
   sib'4. sib,
   fa'4 fa,8 r4 r8

   %31
   R2.
   r4 r8 sib'4.~
   sib8 sib, sib sib sib sib

   %34
   sib sib sib sib sib sib
   sib sib sib sib sib sib
   sib sib sib sib sib sib

   %37
   mib sib mib r4 r8
   R2.\mbreak
   r4 r8 do'4.

   %40
   do8 do, do do do do
   do do do do do do
   do do do do do do

   %43
   do do do do do do
   fa do fa r4 r8
   R2.

   %46
   r4 r8 re'4.~
   re8 re, re re re re
   re re re re re re

   %49
   re re re re re re
   re re re re re re
   sol re sol sol16 la sib8 sol

   %52
   re4 re,8 re' mi fad
   sol re sol sol16 la sib8 sol
   re4 re,8 re' mi fad

   %55
   sol sib sol re16 mi fad8 re
   sol mib? sol do16 re mib8 do
   sol mib sol do16 re mib8 do

   %58
   sol sib sol re16 mi fad8 re\mbreak
   sol re sol re'4 re,8
   sol4. do,16 do do do do do

   %61
   sol sol sol sol sol sol re re re re re re
   sol sol sol sol sol sol do do do do do do
   sol sol sol sol sol sol re re re re re re

   %64
   sol8 re sol re'4 re,8
   sol4.~ sol8\tuplet 3/4 { fa'16 sol la }\mbreak
   sib8 sib, sib sib sib sib

   %67
   sib4 sib8 sib4.
   r8 fa fa fa4.
   r8 sib sib sib4.

   %70
   sib' sib,
   fa' sib16 do re8 sib
   fa4 fa,8 fa' sol la

   %73
   sib4 sib,8 sib'16 do re8 sib
   fa4 fa,8 fa' sol la
   sib4 sib,8 mib16 fa sol8 mib\mbreak

   %76
   sib re sib fa16 sol la8 fa
   sib re sib mib16 fa sol8 mib
   sib re sib fa16 sol la8 fa

   %79
   sib fa sib re4 fa,8
   sib4. mib16 mib mib mib mib mib
   sib sib sib sib sib sib fa fa fa fa fa fa

   %82
   sib sib sib sib sib sib mib mib mib mib mib mib\mbreak
   sib sib sib sib sib sib fa fa fa fa fa fa
   sib8 fa sib fa'4 fa,8

   %85
   sib2

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sib\major
  \time 6/8
  \tempo 2. = 53
  \partial 4 s4
  s2.*19
  s2
  \bar":..:"\break
  s4
  s2.*64
  s2
  \bar":|."

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

IIIvlIII = {
  \IIIglobal
  <<\IIIvlIIIn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] Allegro"

  \score {

      \new ChoirStaff  <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino""primo"}
          \IvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino""secondo"}
          \IvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino""terzo"}
          \IvlIII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Basso"}
          \Ibc

        >>
      >>

    \layout {

      indent = 1.7\cm

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

  \pageBreak

\markup\huge "[2.] Andante"

  \score {

      \new ChoirStaff  <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlIII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \IIbc

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

  \pageBreak

\markup\huge "[3.] Presto"

  \score {

      \new ChoirStaff  <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlIII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
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
