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


global = {
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\terzinequarto \senza

			}

IvlIn = \relative do'' {

    sib'2 sib,
    sib' sib,4. fa'8\p
    re do16 sib do8 sib16 la sib8 fa\f sib, \once\stemDown fa''\p

    %4
    re [do16 sib do8 sib16 la] sib8 fa\f sib,4
    fa''2 fa,\mbreak
    fa' fa,4. sib'8\p

    %7
    la sol16 fa sol8 fa16 mi fa8 do\f fa, sib'\p
    la sol16 fa sol8 fa16 mi fa8 do\f fa,4
    sib'2 sib,

    %10
    lab'\mbreak sib,
    sol'8 \once\stemUp mib, r4 do''2
    do, sib'

    %13
    do, la'8 \once\stemUp fa, r4
    sib,8.(do16 re4) r8 fa'\p(mib re)
    sib,8.\f(do16 re4) r8 sol'\p(fa mib)\mbreak

    %16
    sib,8.\f(do16 re4) r8 sib''\p(la sol)
    fa(mib) mib(re) re(sol) sol(fa)
    fa(mib) mib(re) re2\tr\fermata

    %19
    \tuplet 3/2 { \con sib'4 sib,8 \senza sib'4 sib,8 sib'4 sib,8 sib'4 sib,8
    sib'8. la16 sol8 fa4 mib8 re8. do16 sib8 do8. sib16 la8}
    sib4 r \tuplet 3/2 { sib'\p sib,8 sib'4 sib,8

    %22
    sib'4 sib,8 sib'4 sib,8 sib'8. la16 sol8 fa4 mib8
    re8. do16 sib8 do8. sib16 la8 sib4. r}
    fa'32^\markup\italic"Stricciate [con l'arco alla corda]" fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa

    %25
    mib! \repeat unfold 15 {mib} \repeat unfold 16 {sol}
    \repeat unfold 16 {sol} \repeat unfold 16 {fa}
    fad! \repeat unfold 15 {fad} \repeat unfold 16 {sol}

    %28
    \repeat unfold 16 {sol} fad! \repeat unfold 15 {fad}
    sol2^\markup\italic "Come stà" sol,
    sol' sol,

    %31
    re' re,
    re' re,4. re'8
    sib[la16 sol la8 fad] sol re sol, \once\stemDown re''

    %34
    sib[la16 sol la8 fad] \mbreak sol re sol,4
    sol''2 re
    mib do

    %37
    fa do
    re sib
    \tuplet 3/2 { sib'4 sib,8 sib'4 sib,8 sib'4 sib,8 sib'4 sib,8

    %40
    sib'8. la16 sol8 fa4 mib8 re8. do16 sib8 do8. sib16 la8}
    sib4 \tuplet 3/2 { sib,8.(do16 re8)\mbreak } re'(sol fa mib)
    re4 \tuplet 3/2 { sib,8.(do16 re8) } re'(sol fa mib)

    %43
    re4 \tuplet 3/2 { sib,8.(do16 re8)  sib''4 sib,8 sib'4 sib,8
    sib'4 sib,8 sib'4 sib,8 sib'8. la16 sol8 fa4 mib8
    re8. do16 sib8 do8. sib16 la8 sib'4 sib,8 sib'4 sib,8

    %46
    sib'4 sib,8 sib'4 sib,8 sib'8. la16 sol8 fa4 mib8
    re8. do16 sib8 do8. sib16 la8 } sib2\fermata

}

IvlIIn = \relative do'' {

    sib'2 sib,
    sib' sib,4. do8\p
    sib re, mib do sib fa'\f sib, do'\p

    %4
    sib re, mib do sib fa'\f sib,4
    fa''2 fa,\mbreak
    fa' fa,4. sol'8\p

    %7
    fa la, sib sol la do\f fa, sol'\p
    fa la, sib sol la do\f fa,4
    sib'2 re,

    %10
    fa\mbreak re
    mib8 mib, r4 sol'2
    mi sol

    %13
    mi fa8 \parenthesize fa, r4
    sib,8.(do16 re4) r8 re'\p (do sib)
    sib,8.\f(do16 re4) r8 mib'\p(re do)\mbreak

    %16
    sib,8.\f(do16 re4) r8 sol'\p(fa mib)
    re(do) do(sib) sib(mib) mib(re)
    re \parentSlur (do) do\parentSlur (sib) sib2\tr\fermata

    %19
    \tuplet 3/2 { \con sib'4 sib,8 \senza sib'4 sib,8 sib'4 sib,8 sib'4 sib,8
    sib'8. la16 sol8 fa4 mib8 re8. do16 sib8 do8. sib16 la8}
    sib4 r \tuplet 3/2 { sib'\p sib,8 sib'4 sib,8

    %22
    sib'4 sib,8 sib'4 sib,8 sib'8. la16 sol8 fa4 mib8
    re8. do16 sib8 do8. sib16 la8 sib4. r}
    sol'32^\markup\italic"Stricciate" \repeat unfold 31 {sol}

    %25
    sol \repeat unfold 15 {sol} \repeat unfold 16 {la}
    \repeat unfold 16 {la} \repeat unfold 16 {la}
    la \repeat unfold 15 {la} sib, \repeat unfold 15 {sib}

    %28
    \repeat unfold 16 {la} la \repeat unfold 15 {la}\mbreak
    sol'2^\markup\italic "Come stà" sol,
    sol' sol,

    %31
    re' re,
    re' re,4. la'8
    sol sib do la sol re sol, la'

    %34
    sol sib do la\mbreak sol re sol,4
    re''2 si
    do sol

    %37
    do la\mbreak
    sib? fa
    \tuplet 3/2 { sib'4 sib,8 sib'4 sib,8 sib'4 sib,8 sib'4 sib,8

    %40
    sib'8. la16 sol8 fa4 mib8 re8. do16 sib8 do8. sib16 la8}
    sib4 \tuplet 3/2 { sib,8.(do16 re8 })\mbreak  sib'8(mib re do)
    sib4 \tuplet 3/2 { sib,8.(do16 re8) } sib'8(mib re do)

    %43
    sib4 \tuplet 3/2 { sib,8.(do16 re8) sib''4 sib,8 sib'4 sib,8
    sib'4 sib,8 sib'4 sib,8 sib'8. la16 sol8 fa4 mib8
    re8. do16 sib8 do8. sib16 la8 sib'4 sib,8 sib'4 sib,8

    %46
    sib'4 sib,8 sib'4 sib,8 sib'8. la16 sol8 fa4 mib8
    re8. do16 sib8 do8. sib16 la8 } sib2\fermata

}

Ivlan = \relative do' {

    sib'2 sib,
    sib' sib,4. la'8\p
    fa fa, sol fa fa fa'\f sib, la'\p
    fa fa, sol fa fa fa'\f sib,4
    fa'2 fa\mbreak
    fa fa4. do'8\p
    do do, re do do do'\f fa, do'\p
    do do, re do do do'\f fa,4
    re'2 sib
    re\mbreak fa,4. re8
    sib sib r4 mi'2
    sol, mi'
    sol,4. mi8 do[do] r4
    sib8.(do16 re4) r2

    %16
    sib8.(do16 re4) r2\mbreak
    sib8.(do16 re4)  sib2~
    sib1~
    sib\fermata
    R1*5
    \repeat unfold 32 {re32}
    sol, \repeat unfold 15 {sol} mi' \repeat unfold 15 {mi}
    mi? \repeat unfold 15 {mi} \repeat unfold 16 {re}
    \repeat unfold 16 {do} \repeat unfold 16 {sib}
    \repeat unfold 16 {do} \repeat unfold 16 {re}
    sol2^\markup\italic "Come stà" sol,
    sol' sol,

    %31
    re'' re,
    re' re,4. fad8
    re re mib? re re re sol, fad'
    re re mib re\mbreak re re sol,4
    si'2 sol
    sol mib
    la fa\mbreak
    fa re
    \tuplet 3/2 { sib8 sib sib sib sib sib sib sib sib sib sib sib

    %40
    sib sib sib sib sib sib sib sib sib fa' fa fa}
    sib,4\tuplet 3/2 { sib8. (do16 re8) }\mbreak r2
    r4 \tuplet 3/2 { sib8. (do16 re8) } r2

    %43
    r4 \tuplet 3/2 { sib8. do16 re8 sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib sib sib sib sib
    sib sib sib fa' fa fa sib, sib sib sib sib sib

    %46
    sib sib sib sib sib sib sib sib sib sib sib sib
    sib sib sib fa' fa fa} sib,2\fermata

}

Ibcn = \relative do {

    sib'2 sib,
    sib' sib,4. la8\p
    sib sib mib, fa

    %4
    sib fa'\f sib, la\p
    sib sib mib, fa sib fa'\f sib,4
    fa''2 fa,\mbreak

    %7
    fa' fa,4. mi8\p
    fa fa sib, do fa do'\f fa, mi\p
    fa fa sib, do fa do'\f fa,4

    %10
    \tuplet 3/2 { \con sib,8-. sib-. sib-. \senza sib-.  sib-. sib-. sib-. sib-. sib-. sib-. sib-. sib-.
    sib-. sib-. sib-. sib-. sib-. sib-. sib-. sib-. sib-. sib-. sib-. sib-.}
    mib mib, r4 \tuplet 3/2 { do'8 do do do do do

    %13
    do do do do do do do do do do do do
    do do do do do do} fa4 r
    sib,8.(do16 re4) r2

    %16
    sib8.(do16 re4) r2\mbreak
    sib8.(do16 re4) r2
    R1*2

    %19
    \tuplet 3/2 { sib 8^\markup\italic"battute [i. e. balzate]" sib sib sib sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib sib sib sib sib
    sib4. r sib8 sib sib sib sib sib

    %22
    sib sib sib sib sib sib sib sib sib sib sib sib
    sib sib sib fa' fa fa sib,4. r}
    sib32^\markup\italic"Stricciate" \repeat unfold 31 {sib32}

    %25
    \repeat unfold 16 {do} \repeat unfold 16 {dod}
    \repeat unfold 16 {dod} \repeat unfold 16 {re}
    \repeat unfold 16 {re} \repeat unfold 16 {re}

    %28
    \repeat unfold 16 {re} \repeat unfold 16 {re}
    sol2^\markup\italic "Come stà" sol,
    sol' sol,

    %31
    re'' re,
    re' re,4. re8
    sol sol, do re sol, re' sol, re'

    %34
    sol sol, do re\mbreak sol, re' sol,4
    sol8 sol sol sol sol sol sol sol
    do do do do do do do sib

    %37
    la fa fa fa fa fa fa fa\mbreak
    sib sib sib sib sib sib sib sib
    \tuplet 3/2 { sib sib sib sib sib sib sib sib sib sib sib sib

    %40
    sib sib sib sib sib sib sib sib sib fa' fa fa}
    sib,4\tuplet 3/2 { sib8. (do16 re8) }\mbreak r2
    r4 \tuplet 3/2 { sib8. (do16 re8) } r2

    %43
    r4 \tuplet 3/2 { sib8. do16 re8 sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib sib sib sib sib
    sib sib sib fa' fa fa sib, sib sib sib sib sib

    %46
    sib sib sib sib sib sib sib sib sib sib sib sib
    sib sib sib fa' fa fa} sib,2\fermata

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 4/4
\key sib\major
\tempo 2 = 50
s1*18\break
\once \override Score.RehearsalMark.extra-offset = #'(+4 . +0.5)
\mark\markup\column{"  ""All[egr]o molto"}
s1*29
\bar"||"

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

    sib'8\upl sib,\upl fa'\upl fa,\upl sib_\upl sib,_\upl r fa''
    sol mib, la' fa, sib' \once\stemUp sib,, r fa''
    mi \once\stemUp do, sib'' do, la' \once\stemUp fa, r  fa'

    %4
    sib, sol mi' sol, fa' fa, r fa'
    sib sib, lab' sib, sol' \once\stemUp mib, r sol'
    do do, sib' do, la'? \once\stemUp fa, r fa'

    %7
    mib fa, reb' fa,\mbreak do' fa, reb' fa,
    mib' fa, reb' fa, do' fa, r fa'
    sib sib, r fa' sib re,! la' do,

    %10
    sib sib, r fa'' sib sib, r fa'
    sib re, la' do, sib sib, r4\fermata

}

IIvlIIn = \relative do'' {

    sib'8\upl sib,\upl fa'\upl fa,\upl sib_\upl sib,_\upl r fa''
    sol mib, la' fa, sib' \once\stemUp sib,, r fa''
    mi \once\stemUp do, sib'' do, la' \once\stemUp fa, r  fa'

    %4
    sib, sol mi' sol, fa' fa, r fa'
    sib sib, lab' sib, sol' \once\stemUp mib, r sol'
    do do, sib' do, la'? \once\stemUp fa, r do'

    %7
    do fa, sib fa\mbreak la fa sib fa
    do' fa, sib fa la fa r fa'
    sib sib, r fa' sib re,! la' do,

    %10
    sib sib, r fa'' sib sib, r fa'
    sib re, la' do, sib sib, r4\fermata

}

IIvlan = \relative do' {

    re4 do sib sib
    sib la fa sib
    sol mi' do la

    %4
    re do la la'
    fa re sib sib
    sol' mi do do

    %7
    la sib\mbreak do sib
    la sib do do
    fa fa fa fa

    %10
    fa fa mib re\mbreak
    fa fa re r\fermata

}

IIbcn = \relative do {

    sib'4 la sol re
    mib fa sib, re
    do do, fa fa'

    %4
    sol do, fa, fa'
    re sib mib mib,
    mi' do fa fa,

    %7
    fa' fa,\mbreak fa' fa,
    fa' fa, fa' mib?
    re sib fa' fa,

    %10
    sib re do sib\mbreak
    fa' fa, sib4 r\fermata

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 4/4
\key sib\major
\tempo 4 = 65
s1*11
\bar"|."

}


IIvlI = {
	\global
	%\notypeset
	<<\IIvlIn \forma>>

}

IIvlII = {
	\global
	<<\IIvlIIn \forma>>

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

    fa4 sib,
    fa' sib,8 fa
    sib re4 do16 sib

    %4
    do8 mib4 re16 do
    re do sib la sib4
    fa' do

    %7
    fa do8 do
    fa la4 sol16 fa\mbreak
    sol8 sib4 la16 sol
    la sol fa mi fa4

    %11
    sib sib,
    sol'16 fa mib? re mib4
    do' do,

    %14
    la'16 sol fa mi fa4
    re' re,
    sib'16 la sol fad sol4

    %17
    re8  [sol, re' sol,]\mbreak
    re' [sol, re' sol,]
    sib'[la16 sol la8 fad]

    %20
    re [sol, re' sol,]
    re' [sol, re' sol,]
    sib'[la16 sol la8 fad]

    %23
    sol\p[(sib) sol(fa?)]
    mi[(sol) mi(re)]
    dod[(sol') fa(mi)]

    %26
    re4\f re,
    fa'8\p[(lab) fa(mib?)]\mbreak
    re[(fa) re(do)]

    %29
    si[(fa') mib(re)]
    do4\f  do,
    sol''8[do, sol' do,]

    %32
    sol'[do, sol' do,]
    do'[sib16 lab sol8 fa]
    mib[re16 do re8 si]

    %35
    do4 r
    fa sib,
    fa' sib,

    %38
    sib8 re4 do16 sib
    do8 mib4 re16 do
    re do sib la sib4

    %41
    sib' sib,
    sib' sib,
    sib' sib,

    %44
    sib' sib,
    sib' sib,\mbreak
    sib,8.(do16 re4)

    %47
    sib'' sib,
    sib,8.[(do16 re8) \once\stemDown sib'']
    sib,,8.[(do16 re8) \once\stemDown sib'']

    %50
    sib,,8.(do16 re4)
    sib'16 [sib sib sib sib sib sib sib]
    sib'4 sib,

    %53
    sib16 [sib sib sib sib sib sib sib]\mbreak
    sib'4 sib,
    sib'8[re, mib do]

    %56
    sib'4 sib,
    sib'8[re, mib do]
    sib[sib' do la]

    %59
    sib2\fermata

}

IIIvlIIn = \relative do'' {

    fa4 sib,
    fa' sib,8 fa
    sib re4 do16 sib

    %4
    do8 mib4 re16 do
    re do sib la sib4
    fa' do

    %7
    fa do8 do
    fa la4 sol16 fa\mbreak
    sol8 sib4 la16 sol
    la sol fa mi fa4

    %11
    sib sib,
    sol'16 fa mib? re mib4
    do' do,

    %14
    la'16 sol fa mi fa4
    re' re,
    sib'16 la sol fad sol4

    %17
    re8  [sol, re' sol,]\mbreak
    re' [sol, re' sol,]
    sib'[la16 sol la8 fad]

    %20
    re [sol, re' sol,]
    re' [sol, re' sol,]
    sib'[la16 sol la8 fad]

    %23
    sol\p[sol mi(re)]
    dod[(mi) dod(si)]
    la[(mi') re(dod)]

    %26
    re4\f re,
    re'8\p[(fa) re(do)]
    si[(re) si(la)]

    %29
    sol[(re') do(si)]
    do4\f do,
    sol''8[do, sol' do,]

    %32
    sol'[do, sol' do,]
    do'[sib16 lab sol8 fa]
    mib[re16 do re8 si]

    %35
    do4 r
    fa sib,
    fa' sib,

    %38
    sib8 re4 do16 sib
    do8 mib4 re16 do
    re do sib la sib4

    %41
    fa8^\markup\italic"battute"[fa16 fa fa8 fa]
    fa8[fa16 fa fa8 fa]
    fa8[fa16 fa fa8 fa]

    %44
    fa8[fa16 fa fa8 fa]
    sib'4^\markup\italic"Come stan[n]o" sib,\mbreak
    sib,8.(do16 re4)

    %47
    sib'' sib,
    sib,8.[(do16 re8) \once\stemDown sib'']
    sib,,8.[(do16 re8) \once\stemDown sib'']

    %50
    sib,,8.(do16 re4)
    fa16[fa fa fa fa fa fa fa]
    sib'4 sib,

    %53
    fa16[fa fa fa fa fa fa fa]\mbreak
    sib'4 sib,
    re8[sib do la]

    %56
    sib'4 sib,
    re8[sib do la]
    sib[re mib do]

    %59
    re2\fermata

}

IIIvlan = \relative do' {

    re8[mib fa mib]
    re[mib fa mib]
    re[fa fa re]

    %4
    fa[la la la]
    fa[la fa re]
    do[re do sib]

    %7
    la[sib do sib]
    la [do do la]\mbreak
    do[do' do do,]

    %10
    fa do fa, fa'
    re[do re sib]
    mib[sib' sol fa]

    %13
    mi[re mi do]
    fa[do' la sol]
    fad[mi fad re]

    %16
    sol[re sib sol]
    sol[la sib la]\mbreak
    sol[la sib la]

    %19
    sol[sol' do, re]
    sol,[la sib la]
    sol[la sib la]

    %22
    sol[sol' do, re]
    sol,4\p sol'
    la la

    %25
    la la
    re\f re,
    fa\p fa\mbreak

    %28
    sol sol
    sol sol
    do\f do,

    %31
    R2*10
    re8^\markup\italic"battute"[re16 re re8 re]
    re[re16 re re8 re]

    %43
    re[re16 re re8 re]
    re[re16 re re8 re]
    sib'4^\markup\italic "Come stan[n]o" sib,\mbreak

    %46
    sib8.\parentSlur (do16 re4)
    R2
    sib8. (do16 re4)

    %49
    sib8. (do16 re4)
    sib8. (do16 re4)
    re16[re re re re re re re]

    %52
    sib'4 sib,
    re16[re re re re re re re]\mbreak
    sib'4 sib,

    %55
    fa'8[fa sol fa]
    sib4 sib,
    fa'8[fa sol fa]

    %58
    fa[fa sol fa]
    fa2\fermata

}

IIIbcn = \relative do {

    sib8[do re do]
    sib[do re do]
    sib[sib' sib sib,]

    %4
    la[fa' fa fa,]
    sib[fa' re sib']
    la[sib la sol]

    %7
    fa[sol la sol]
    fa [fa, fa fa']\mbreak
    do[do' do do,]

    %10
    fa do fa, fa'
    re[do re sib]
    mib[sib' sol fa]

    %13
    mi[re mi do]
    fa[do' la sol]
    fad[mi fad re]

    %16
    sol[re sib sol]
    sol[la sib la]\mbreak
    sol[la sib la]

    %19
    sol[sol' do, re]
    sol,[la sib la]
    sol[la sib la]

    %22
    sol[sol' do, re]
    sol,4\p r
    R2*2

    %26
    re''4\f re,
    R2*3
    do'4\f do,

    %31
    do8[re mib re]
    do[re mib re]
    do[fa si, sol]

    %34
    do[do' fa, sol]
    do,4 r
    sib?8[do re do]

    %37
    sib[do re do]\mbreak
    sib[sib' sib sib,]
    la[fa' fa la,]

    %40
    sib[fa' re sib]
    sib8^\markup\italic"battute"[sib16 sib sib8 sib]
    sib[sib16 sib sib8 sib]

    %43
    sib[sib16 sib sib8 sib]
    sib[sib16 sib sib8 sib]
    sib'4^\markup\italic "Come stan[n]o" sib,\mbreak

    %46
    sib8.\parentSlur (do16 re4)
    R2
    sib8. (do16 re4)

    %49
    sib8. (do16 re4)
    sib8. (do16 re4)
    sib16[sib sib sib sib sib sib sib]

    %52
    sib'4 sib,
    sib16[sib sib sib sib sib sib sib]\mbreak
    sib'4 sib,

    %55
    sib8[sib' mib, fa]
    sib4 sib,
    sib8[sib' mib, fa]

    %58
    sib,[sib' mib, fa]
    sib,2\fermata

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 2/4
\key sib\major
\tempo 2 = 60
s2*59
\bar"|."

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

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
   title = \markup\smaller"”Conca” Concerto [RV 163]"
   composer = \markup \center-column{"A. Vivaldi (1678-1741)"}
}

    \markup \huge {[1. Senza indicazione di tempo]}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino""primo]"}
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino""secondo]"}
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

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
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

    \markup \huge {[2.] And[ant]e}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
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

    \markup \huge {[3.] All[egr]o}

    \score {

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

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
