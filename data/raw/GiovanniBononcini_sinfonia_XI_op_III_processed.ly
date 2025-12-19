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


Iglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##t
		\override TupletBracket #'bracket-visibility = ##f
			}


IvlIn = \relative do'' {

    re4 mib8 re do8. mib16 re8 do
    sib sol mib'4~mib8 re sol4
    sol8 fad16 mi? fad8. sol16 sol4 r

    %4
    sol4. sol8 fad4 r
    R1*3
    r2 r4 la

    %9
    fa re mi fad
    re2 mi
    fa?4 fa sol la

    %12
    la la sib2
    la la4 sol
    sol fad sol re

    %15
    re do2 sol'4
    sol la fad sol~
    sol fad sol2

}


IvlIIn = \relative do'' {

    sib4 do8 sib la4. la8
    sol mib mib'[do] fa4 re8 mib16 re
    do2 sib8 do re4

    %4
    re do8 dod re4 r
    R1*4
    r4 re do la

    %10
    si8 dod re2 dod4
    re r sol fa
    fa la2 sol4

    %13
    sol fa sib2
    la sol4 re
    mib2 re

    %16
    mi!2 fad?4 re8 sib
    la2 si

}


IvlaIn = \relative do' {

    sol'2 la
    re,4 sol fa sib,
    do2 re4. la'8

    %4
    sol2 re4 r
    R1*5
    r2 la'

    %11
    la4 fa mi re
    fa2. sol4
    la r8 fa sol2

    %14
    la8 re, re2 sib4
    sib do la sib
    do2 la4 r8 re

    %17
    re2 re

}

IvcIn = \relative do {

    sol4 sol'2 fad4
    sol4. la8 sib4 sib8 do16 sib
    la4. la8 sol4. fa?8

    %4
    mib2 re4 r
    R1*5
    r2 la'

    %11
    fa4 re mi fa
    re2 re4 mi
    dod re sol2

    %14
    re sol
    sol4 la fad sol
    do,2 re4 sol,

    %17
    re'2 sol,

}

IvlIripn = \relative do'' {

    R1*4
    la'4 sib8 la sol8. sib16 la8 sol
    fa re sib'4. la8 re,4

    %7
    re dod re la'
    la sol8 sold la4 r
    r2 r4 la

    %10
    sol fa? mi4. mi8
    re4 r r2
    r4 fa2 mi4

    %13
    mi fa2 mi4
    la,2 sib4 sib
    mib2 r4 re

    %16
    re do2 sib8 sol
    la4 re si2

}

IvlIIripn = \relative do'' {

    R1*4
    fa4 sol8 fa mi4. mi8
    re4 fa do' la

    %7
    sol4. sol8 fa4. mi8
    re2 dod4 r
    R1*2

    %11
    r4 re do la
    re fa2 sol4
    sol re2 r4

    %14
    r re sib r
    r do2 sib4
    sib la2 r4

    %17
    la2 sol

}

IvlaIIn = \relative do' {

    R1*4
    re2 mi
    r fa

    %7
    sol2 la
    re, la4 r
    R1*2

    %11
    r2 r4 la
    fa re r2
    r4 re'2 sib4

    %14
    r re re r
    sib la2 sol4
    mi!2 r4 re

    %17
    re2 re

}

IvcIIn = \relative do {

    R1*4
    re4 re'2 dod4
    \clef tenor \key fa\major re4. mi8 fa4. sol16 fa

    %7
    mi4. mi8 re4. do8
    sib2 la4 r
    \clef bass \key fa\major R1

    %10
    r2 la
    fa4 re mi fa
    re2 re4  mi

    %13
    dod re sol2
    re sol
    sol4 la fad sol

    %16
    do,2 re4 sol,
    re'2 sol,

}

Ibcn = \relative do {

    sol4 sol'2 fad4
    sol 4. la8 sib4 sib
    la2 sol4. fa?8

    %4
    mib2 re4 r
    re \clef tenor \key fa\major re'2 dod4
    re4. mi8 fa4. sol16 fa

    %7
    mi4. mi8 re4. do8
    sib2 la4 \clef violin \key fa\major la''
    fa re do la

    %10
    si re \clef bass \key fa\major la,2
    fa4 re mi fa
    re2 re4  mi

    %13
    dod re sol2
    re sol
    sol4 la fad sol

    %16
    do,2 re4 sol,
    re'2 sol,

}

Ibfn = \figuremode {
	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	<_->4 s <4 2> <5->
	<6->4. <5->8 s2
	<7>4 <6+> <_->4. <6>8
	<7>4 <6> <_+> s
	<_->2 <4 2>4 <5->
	s1*3
	s2 s4 <6+>
	<6> <_-> <4> <3+>
	<6> s <6> <6>
	s2 <6 5>4 <5 _->
	<5- 6> <_-> <9 5> <8 6>
	<4> <3+> <_->2
	<6->4 <5-> <6 5-> <_->
	<9 5> <8 6> <7 5 _+> <_->
	<4> <3+>

}


forma = {

\time 4/4
\key fa\major
\tempo 4 = 60
s1*17
\bar "||"

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


IvlaI = {
	\Iglobal
	\clef alto
	<<\IvlaIn \forma>>

}


IvcI = {
	\Iglobal
	\clef bass
	<<\IvcIn \forma>>

}

IvlIrip = {
	\Iglobal
	<<\IvlIripn \forma>>

}

IvlIIrip = {
	\Iglobal
	<<\IvlIIripn \forma>>

}

IvlaII = {
	\Iglobal
	<<\IvlaIIn \forma>>

}


IvcII = {
	\Iglobal
	\clef bass
	<<\IvcIIn \forma>>

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
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
}


IIvlIn = \relative do'' {

    r4 sol2 fad4
    sol r r2
    R1

    %4
    r8 re' fa?[re] fa sol16 la sol4
    fad8 mi16 fad sol2 fad4
    sol2 r

    %7
    R1*2
    r8 sol, sib[sol] la sib16 do re8 do
    sib re re fa mi4. mi8

    %11
    re4 r r2
    re4. do16 sib la4. la8
    sib sol sol'2 fad4

    %14
    r8 re fa?[re mi fa16 sol] la8 sol
    fa4 r r2
    R1

    %17
    r8 re\noBeam  sol, sib la do sib la
    sib4 la sol8 sib la sol
    la la sib re do4 r8 la'

    %20
    sol4 fa mi2
    re4 re2 dod4\mbreak
    re r r2

    %23
    R1
    r8 re fa[re] mi fa16 sol la8 sol
    fad mi16 fad sol2 fad4

    %26
    sol r r2
    R1
    re2 sol4 mi

    %29
    re4. do16 sib la4. la8
    sib sol sib[sol] la sib16 do re8 do
    sib4 re8 fa mi2

    %32
    fad4 r8 re mi fad sol la
    fad re sol2 fad4
    sol1

}


IIvlIIn = \relative do'' {

    r8 sol\noBeam sib sol la sib16 do re8 do
    sib4 r r2
    R1

    %4
    re2 sol4 mi
    re r la r
    sib2 r

    %7
    R1*2
    sol4. sib8 la2
    sib4 re2 dod4

    %11
    re r r2
    sib4. mi16 re do4 re
    re8 sib re[sib] do re16 mi fad4

    %14
    sol fa? mi2
    re4 r r2
    R1*2

    %18
    r8 sol,\noBeam re fa mi sol fa mi
    fad la sol4 sol4. fad8
    sol sib16 do re2 dod4

    %21
    re8 re fa[re] mi4 la8 sol\mbreak
    fa4 r r2
    R1*2

    %25
    r8 sol,\noBeam sib sol la sib16 do re8 do
    sib4 r r2
    R1

    %28
    r8 re\noBeam fa re mi fa16 sol la8 sol
    fad mi16 fad sol2 fad4
    sol r r2

    %31
    r4 re2 dod4
    re re8 sol mi2
    r8 fad\noBeam re re la4. la8

    %34
    si1

}


IIvlaIn = \relative do' {

    re4 sol re2
    re4 r r2
    R1

    %4
    re4. fa8 mi2
    la,4 r8 re do[re re8. re16]
    re4 r r2

    %7
    R1*2
    re2 do4 la
    sol8 re' fa[re] mi[fa sol la16 sol]

    %11
    fad8 mi16 fad sol4~sol fad
    sol8 sol sib[sol] la sib16 do re8 do
    sib4 r8 re do sib la4

    %14
    sib la sol mi
    la r r2
    R1*4

    %20
    re,8 re fa[re] mi fa16 sol la8 sol
    fa4 r r2\mbreak
    R1*2

    %24
    r2 r4 la
    re, re r8 re re[re]
    re4 r r2

    %27
    R1
    re4. fa8 mi2
    la,4 re do re

    %30
    re2 re
    re4 re sib8 la la4~
    la re do r

    %33
    r re2 re4
    re1

}

IIvcIn = \relative do {

    sol'8. fa16 mib8 sib do sol re'[re,]
    sol4 r r2
    R1

    %4
    sol4 re'2 dod4
    re8 do? sib sol do sol re'[re,]
    sol4 r r2

    %7
    R1*2
    sol4 sol'2 fad4
    sol re sol8 re la'[la,]

    %11
    re do sib sol do sol re' re,
    sol4 sol'2 fad4
    sol8 sol sib sol la  sib16 do re8 do

    %14
    sib8 sol re'2 dod4
    re r r2
    R1*4

    %20
    r4 re, la' la,
    re r r2\mbreak
    R1*2

    %24
    r4 re'2 dod4
    re8 do? sib[sib,] do sol re'[re,]
    sol4 r r2

    %27
    R1
    r4 re'2 dod4
    re8 do? sib[sol] do la re[re,]

    %30
    sol4 r8 sib do sol re'[re,]
    sol sol' fa[re] sol[re] la' la,
    re do sib sol do2

    %33
    re1
    sol,

}

IIvlIripn = \relative do'' {

    R1
    r8 re fa[re] mi fa16 sol la8 sol
    fad? sib16 la sol2 fad!4

    %4
    sol r r2
    r4 re8 re do4 la
    sol8 sib sib sib' la4. sib16 la

    %7
    sol4. la16 sol fa4. sol16 fa
    sol4. sib8 fad sol fad4
    sib r r2

    %10
    R1
    r4 sol,8 sol la2
    sib4 r r2

    %13
    R1*2
    r4 re2 dod4
    re8 sol, sib[sol] la sib16 do re8 do

    %17
    sib4 r r2
    R1*3
    r8 la' re,[fa] mi sol fa mi\mbreak

    %22
    fa fa  mi mi re fa mi re
    mi4 re8 la' sol sib la sol
    fa4 r r2

    %25
    R1
    r8 re\noBeam fa fa mi fa16 sol la8 sol
    fad sib16 la sol2 fad4

    %28
    sol r r2
    R1
    r4 sol,2 fad4

    %31
    sol la8 re mi4. mi8
    re4 sol2 r4
    la sol la2

    %34
    sol1

}

IIvlIIripn = \relative do'' {

    R1
    r4 re2 dod4
    re4. re8 do?2

    %4
    sib4 r r2
    r8 la\noBeam sib sib la sib16 do re8 do
    sib sol mib'4. fa16 mib re4

    %7
    re8 mib16 re do4. re16 do sib4
    do sol8 do16 sib la8  sib la la
    sib4 r r2

    %10
    R1
    r8 sol\noBeam sib sib la sib16 do re8 do
    sib4 r r2

    %13
    R1*2
    fa'8 fa la la sol2
    fad8 sol sol,2 fad4

    %17
    sol r r2
    R1
    r8 fad?\noBeam sib sol la sib16 do re8 do

    %20
    sib4 la2 r8 mi'
    fa4 r r2\mbreak
    r8 re\noBeam la do si re do si

    %23
    dod4 re2 dod4
    re r r2
    R1

    %26
    r4 re2 dod4
    re4. re8 do!2
    sib4 r r2

    %29
    R1*2
    r8 re\noBeam fa fa sol fa16 sol la8 sol
    fad4 re2 do4~

    %33
    do sib la re
    si1

}

IIvlaIIn = \relative do' {

    R1
    re2 sib4 la
    la8 sib sib re la2

    %4
    sol4 r r2
    re'2 r4 re
    re sib fa2

    %7
    sol4 r re'2
    mib8 re do4 r re
    re r r2

    %10
    R1
    re2 re
    re4 r r2

    %13
    R1*2
    re4. fa8 sol4 mi
    r8 re re4 do8 re re4

    %17
    re r r2
    R1
    r8 re\noBeam sol, sib la do sib la

    %20
    sib4 r r la
    la r r2\mbreak
    R1

    %23
    r8 mi'\noBeam fa re mi4. mi8
    re4 r r2
    re2 sib8 sol la4

    %26
    re2 sib8 la la4
    sib8 sib sib sib do4 la
    sib r r2

    %29
    R1
    r2 re
    re4 r r la~

    %32
    la r r mi'
    re2 re
    re1

}

IIvcIIn = \relative do {

    R1
    la8 sol' fa8. fa16 sol8 re la'[la,]
    re sol, sib[sol] la sib do re

    %4
    sol,4 r r2
    R1
    sol4 sol' fa8 mi fa sol16 fa

    %7
    mib4. fa16 mib re4. mi?16 re
    do8 re mi do re sol re[re,]
    sol4 r r2

    %10
    R1
    re'4 sol do,8 sol re'4
    sol r r2

    %13
    R1*2
    r8 re fa re mi fa16 sol la8 sol
    fa sib sol [sib,] do sol re'[re,]

    %17
    sol4 r r2
    R1*2
    r4 re' la la'

    %21
    re, r r2\mbreak
    R1
    r8 la'\noBeam re, fa mi sol fa mi

    %24
    fa re r4 r2
    R1
    r8 sol\noBeam fa re sol re la'[la,]

    %27
    re sol, sib[sol] la sib do re
    sol,4 r r2
    R1

    %30
    sol4 r8 sib do4 re
    sol8 sol fa[re] sol re la'[la,]
    re do sib sol do2

    %33
    re1
    sol,

}

IIbcn = \relative do {

    sol'8. fa16 mib8 sib do sol re'[re,]
    sol sol' fa4 sol8 re la4
    re8 sol, sib [sol] la sib do re

    %4
    sol,4 re'2 dod4
    re sib do8 sol re4
    sol sol' fa2

    %7
    mib re
    do4. do8 re sol, re'4
    sol, sol'2 fad4

    %10
    sol re sol8 re la4
    re8 do sib sol do sol re'4
    sol, sol'2 fad4

    %13
    sol8 sol sib sol la sib16 do re8 do
    sib sol \clef tenor \key fa\major re'2 dod4
    re \clef bass \key fa\major re, mi la,

    %16
    re8 sib sol [sib] do sol re'4
    sol,8 \clef violin \key fa\major re'''\noBeam sol,[sib] la do sib la
    sib sol re fa mi sol fa mi

    %19
    fad?\clef tenor \key fa\major re\noBeam sol, sib la do sib la
    sib sol \clef bass \key fa\major re4 la' la,
    re \clef violin\key fa\major re'' re dod?

    %22
    re8 re la [do?] si re do si
    dod \clef bass\key fa\major la,\noBeam re, fa mi sol fa mi
    fa re re'2 dod4

    %25
    re8 do? sib[sib,] do sol re'[re,]
    sol sol' fa[re] sol re la4
    re8[sol,] sib sol la sib do re

    %28
    sol,4 re'~re dod
    re8 do? sib[sol] do4 re
    sol, r8 sib do4 re

    %31
    sol8 sol fa[re] sol re la'[la,]
    re do sib sol do2
    re1

    %34
    sol,

}

IIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> <5> <_+>
    s <6> <6 5> <_+>
    <_+>8 <_-> <6>4 s <_+>
    <_->4 s <2> <5->
    <_+> <6> s <_+>
    <5> s <7-> <6>
    <7> <6> <7> <6>
    <_->2 <_+>
    <_->4 <_-> <4 2> <5->
    <_-> <_-> <6 5> <_+>
    <_+> <6> <6> <_+>
    <_-> <_-> <4 2> <5->
    s2 <7>4 <_+>
    <6>4 s <2> <6 5->
    <_-> <_-> <7> <7 _+>
    <_+> <6> <6> <_+>
    s1*3
    s2 <4>4 <3+>
    s1
    s2 <_+>
    s2 <7>4 <6+>
    <6>2 <2>4 <6 5->
    <_-> <6> <5> <4>8 <3+>
    s4 <6> <6 5><_+>
    <_+> <6->  <7> <5> 8 <5+>
    s2 <2>4 <6>8 <5->
    s4 <6> <6 5> <_+>
    s4 s8 <6> <6 5>4 <_+>
    <_-> <6> <6 5> <4>8 <3+>
    <_+>4 <6> <9 5> <8 6>
    <5 3+> s <5 4> <3+>
    <_+>1

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 50
    s1*34
    \bar "||"

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


IIvlaI = {
    \IIglobal
    \clef alto
    <<\IIvlaIn \forma>>

}


IIvcI = {
    \IIglobal
    \clef bass
    <<\IIvcIn \forma>>

}

IIvlIrip = {
    \IIglobal
    <<\IIvlIripn \forma>>

}

IIvlIIrip = {
    \IIglobal
    <<\IIvlIIripn \forma>>

}

IIvlaII = {
    \IIglobal
    <<\IIvlaIIn \forma>>

}


IIvcII = {
    \IIglobal
    \clef bass
    <<\IIvcIIn \forma>>

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
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
}


IIIvlIn = \relative do'' {

    re2 r re
    mib r re
    re r mib\mbreak

    %4
    mib? r re
    re do dod
    re r r

    %7
    R1.*5
    sol2 r sol
    fad r r

    %14
    r r fad\f
    mi r fad
    sol fa! sol

    %17
    fa mi2. mi4
    re2 r re
    do r re

    %20
    sib r re
    do r sib
    la r re

    %23
    re r do\parentSlur (
    do) sib la
    sib la2. la4

    %26
    sib2 re re\mbreak
    mi fad sol
    fad sol1~

    %29
    sol2 sol2. fad4
    sol2 re re\p
    mi fad sol

    %32
    fad sol1~
    sol2 sol2. fad4
    sol1.

}


IIIvlIIn = \relative do'' {

    sib2 r sib
    do r la
    sib r sib\mbreak

    %4
    la r la
    sol r sol
    fad r r

    %7
    R1.*5
    sib2 r sib
    la r r

    %14
    r r re\f
    dod r dod
    re1.~

    %17
    re2 re2. dod4
    re2 r fad,
    sol r la

    %20
    re, r sib'
    la r sol
    fad r sib

    %23
    sol r la
    fad sol fad
    sol sol2. fad4

    %26
    sol1 re'2~\mbreak
    re2 r do
    do sib la

    %29
    sib la2. la4
    sol1 re'2\p~
    re r do

    %32
    do sib la
    sib la2. la4
    sol1.

}

IIIvlaIn = \relative do' {

    re2 r re
    la r re
    sol, r sol\mbreak

    %4
    la r la
    sib r sol
    la r r

    %7
    R1.*5
    re2 r re
    re r r

    %14
    r r la'\f
    sol r fad
    re r r

    %17
    r la' mi
    fad r fad
    mi r la

    %20
    sol r sol
    mi r re
    re r re

    %23
    mib r mi
    fad re re
    re re2. re4

    %26
    re1 sol2\mbreak
    mi r mi
    re r mi

    %29
    re1 re2
    re1 sol2
    mi r mi

    %32
    re  r mi
    re1 re2
    re1.

}

IIIvcIn = \relative do {

    sol2 sol'1~
    sol2 fad1
    sol2 r sol\mbreak

    %4
    fa? r fa
    mib r mib
    re r r

    %7
    R1.*5
    sol2 r sol
    re r r

    %14
    r r re\f
    sol r la
    sib la sol

    %17
    la la,1
    re2 r re
    mi r fad

    %20
    sol r sib,
    do r sol
    re' r sib

    %23
    mib r la,
    re1.\parentSlur (
    re2) re,1

    %26
    sol2 sib1\mbreak
    do2 r do
    re r do

    %29
    sol re' re,
    sol1 sib2\p
    do r do

    %32
    re r do
    sol re' re,
    sol1.

}

IIIvlIripn = \relative do'' {

    R1.*5
    la'2 r la
    sib r la

    %8
    la r sib
    sib r la
    la r sol

    %11
    sol r fad
    sol r r
    r r sol\p

    %14
    fad r fad\f
    dod r la'
    sol la re,

    %17
    re mi2. mi4
    la,2 r la
    do r la'

    %20
    sib r re,
    mi r sol
    r r re

    %23
    re r r
    r re1\parentSlur (
    re2) la2. la4

    %26
    sol1 r2\mbreak
    r la' sol
    re sol mi

    %29
    re la2. la4
    sib1 r2
    r la'\p sol

    %32
    re sol mi
    re la2. la4
    si1.

}

IIIvlIIripn = \relative do'' {

    R1.*5
    re2 r fa
    sol r mi

    %8
    fa r fa
    mi r mi
    re r re

    %11
    do r do
    sib r r
    r r sib\p

    %14
    la r la\f
    mi' r dod
    sol' r re

    %17
    re r la
    la r re
    sol, r fad

    %20
    re' r re
    la r sib
    re r sol,

    %23
    mib r la~
    la sib re
    r re2. re4

    %26
    re1 r2\mbreak
    r la do
    la r do

    %29
    sib re2. re4
    sib1 r2
    r la\p do

    %32
    la r do
    la re2. re4
    si1.

}

IIIvlaIIn = \relative do' {

    R1.*5
    la2 r fa'
    mi r mi

    %8
    re r re
    mi r la
    re, r re

    %11
    la r la
    re r r
    r r re\p

    %14
    re r re\f
    mi r la,
    re r sib

    %17
    la1 la2
    la r la
    sol r r

    %20
    re' r sib
    R1.
    la2 r sol

    %23
    sol r do
    re1.
    sib2 re2. re4

    %26
    sib1 r2\mbreak
    r r mi
    fad r do

    %29
    re re1
    re r2
    r r mi\p

    %32
    fad r do
    re re1
    re1.

}

IIIvcIIn = \relative do {

    R1.*5
    re2 re'1\parentSlur (

    %7
    re2) dod1
    re2 r re
    do? r do

    %10
    sib r sib
    la r la
    sol r r

    %13
    r r sol\p
    re r re\f
    la' r la

    %16
    sib la sol
    la la,1
    re2 r re

    %19
    mi r fad
    sol r sib,
    do r sol

    %22
    re' r sib
    mib r <do la>
    re1.\parentSlur (

    %25
    re2) re,1
    sol2 sib1\mbreak
    do2 r do

    %28
    re r do
    sol re'1
    sol, sib2\p

    %31
    do r do
    re r do
    sol re'1

    %34
    sol,1.

}

IIIbcn = \relative do {

    sol2 sol'1~
    sol2 fad1
    sol2 r sol\mbreak

    %4
    fa? r fa
    mib r mib
    re \clef tenor\key fa\major re'1~

    %7
    re2 dod1
    re2 r re
    do? r do

    %10
    sib r sib
    la r la
    \clef bass\key fa\major sol r sol

    %13
    re r sol\p
    re r re\f
    la' r la

    %16
    sib la sol
    la la,1
    re2 r re

    %19
    mi r fad
    sol r sib,
    do r sol

    %22
    re' r sib
    mib r la,
    re1.~

    %25
    re2 re,1
    sol2 sib1\mbreak
    do2 r do

    %28
    re r do
    sol re' re,
    sol1 sib2\p

    %31
    do r do
    re r do
    sol re1

    %34
    sol1.

}

IIIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.
    <4 2>2 <6 5->1
    <_->2 s <6->
    <7-> r <6>
    <7> s <6>
    <_+>1.
    <6 4>2 <5-> <6>
    <5> s <6>
    <7> s <6>
    <7> s <6>
    <7> s <6>
    s1.
    <_+>2 s <_->
    s1.
    <_+>2 s <6+ 4>
    <6> <6-> <6 5>
    <6 4> <4>2. <3+>4
    <_+>1.
    <6>2 s <6>
    <_-> s <6>
    <6> s <_->
    <_+> s <6>
    <7> s <3 _!>
    <7 3> <6 4> <5 3+>
    <6 4>1.
    s2 <6>1
    <9>2 s <8>
    <7 _+> <6> <6 5>
    <_-> <4>2. <3+>4
    s1 <6>2
    <9> s <8>
    <7 _+> s <6 5>
    <_-> <4> 2. <3+>4

}


forma = {

    \time 3/2
    \key fa\major
    \tempo 1 = 40
    s1.*34
    \bar "||"

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


IIIvlaI = {
    \IIIglobal
    \clef alto
    <<\IIIvlaIn \forma>>

}


IIIvcI = {
    \IIIglobal
    \clef bass
    <<\IIIvcIn \forma>>

}

IIIvlIrip = {
    \IIIglobal
    <<\IIIvlIripn \forma>>

}

IIIvlIIrip = {
    \IIIglobal
    <<\IIIvlIIripn \forma>>

}

IIIvlaII = {
    \IIIglobal
    <<\IIIvlaIIn \forma>>

}


IIIvcII = {
    \IIIglobal
    \clef bass
    <<\IIIvcIIn \forma>>

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
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##t
		\override TupletBracket #'bracket-visibility = ##f
			}


IVvlIn = \relative do'' {

    r4 sol8 sib la sib16 do re8 re
    sib4 r r2
    r4 fa'8 la sold la16 sib la8. sol?16

    %4
    fad4 sol,8 sib la sib16 do re8 do
    sib4 sol2 fad4
    sol r r2

    %7
    r4 re' do8 sib la4
    sib r r2
    r4 re8 fa mi fa16 sol la8 la

    %10
    fad4 sol2 fad4\mbreak
    sol2 r4 la
    sib r r2

    %13
    r4 re,2 dod4
    re sol,2 fad4
    sol r r2

    %16
    re'8 sib re[sib] do4. la8
    sib4 r r2
    r8 re sol,[sib] la do sib la

    %19
    sib4. la8 sol sib la sol
    la4 sib la2
    sib4 r r2

    %22
    R1*2
    r8 mi\noBeam fa re mi fa16 sol la8 sol
    fad4 sol2 fad4

    %26
    sol sib16 la sib sol la8 re re16 do re la
    sib4 r r2\mbreak
    R1

    %29
    r4 re,8 fa mi fa16 sol la8 sol
    fad4 sol r2
    r4 re2 dod4

    %32
    re sol2 fad4
    sol re mib2
    re do

    %35
    sib la4. la8
    sib4 re mib2
    re do

    %38
    sib la4. la8
    si1

}


IVvlIIn = \relative do'' {

    r4 sol2 fad4
    sol r r2
    la4 r r8 re la8. la16

    %4
    la4 sib8 re la4. la8
    sol4 r r2
    r4 re'2 dod4

    %7
    re sol,8 sib la sib16 do re8 re
    sib sol sol'2 fad4
    sol r r2

    %10
    r4 re16 do re sib do4 do16 sib do la\mbreak
    sib4 r r2
    r4 re re dod

    %13
    re re8 la' mi2
    fad4 r r2
    r8 re fa?[re] mi fa16 sol la8 sol

    %16
    fad8 re sol2 fad4
    sol sol,8 sib la sib16 do re8 re
    sib4 r r2

    %19
    r8 sol\noBeam re fa mi sol fa mi
    fad4 sol2 fad4
    r sol r la

    %22
    R1*3
    r4 sol8 sib la sib16 do re8 re
    sib4 sol'8 re la'2

    %27
    sol4 r r2\mbreak
    R1
    r4 re2 dod4

    %30
    re sol,8 sib la sib16 do re8 re
    sib4 r r2
    re4 r8 sol, la2

    %33
    sib4 re2 do4~
    do sib2 la4~
    la sol2 fad4

    %36
    sol re'2 do4~
    do sib2 la4~
    la sol2 fad4

    %39
    sol1

}

IVvlaIn = \relative do' {

    re2 mi8 re re4
    re r r2
    la2 r4 mi'

    %4
    re r do r
    re2 sib8 la la4
    sib r8 la' mi2

    %7
    fad4 sol mi8 re re4
    re r r2
    R1*2

    %11
    r4 sol8 sib la sib16 do re8 re
    sib sib, re4 sib8 la la4
    la r r2

    %14
    R1
    sib4 la sib8 la la4
    la r8 re la4 r8 re

    %17
    re4 r r2
    R1*6
    r4 r8 fa mi la la4

    %25
    la re, mi8 re re4
    re r r2
    R1*2

    %29
    la'2 sol8 la la4~
    la sol2 fad4
    sol r r2

    %32
    re2 mi8 re re4
    re r sib do
    la sib do r

    %35
    r re do r8 re
    re4 r sib do
    la sib do r

    %38
    r re do r8 re
    re1

}

IVvcIn = \relative do {

    sol'8 la sib sol do sol re'[re,]
    sol4 r r2
    r4 re8 fa mi fa16 sol la8 la,

    %4
    re4  sol2 fad4
    sol8 la sib sol do sol re'[re,]
    sol mi fa[re] sol re la'[la,]

    %7
    re do sib sol do sol re' re,
    sol4 r8 sol do la re re,
    sol' la sib re sol, re la'[la,]

    %10
    re la' sib[sol] do, la re[re,]\mbreak
    sol'8 la sib sol do sol re'[re,]
    sol4 sib,8 re sol[re] la' la,

    %13
    re sol fa[re] sol re la'[la,]
    re4 r8 sib do sol re'[re,]
    sol16 la sib do re mi fa re sol8 re la'[la,]

    %16
    re4 sib8 sol la sib do re
    sol,4 r r2
    R1*3

    %21
    r8 sol' sib sol la4 la,
    re r r2
    R1

    %24
    r4 re sol8 re la'[la,]
    re4 sib do8 sol re'[re,]
    sol4 sol'8 sib la sib16 do re8 re,

    %27
    sol4 r r2\mbreak
    R1
    fa8 la fa[re] sol re la'[la,]

    %30
    re do sib sol do sol re' re,
    sol la sib re sol re la' la,
    re do sib sol do sol re' re,

    %33
    sol sol' fad re sol sol la sol
    fad re sol[fad] mi!4 fad
    sol sol, do8 la re [re,]

    %36
    sol sol' fad[re]  sol sol la sol
    fad re sol[fad] mi?4 fad
    sol4 sol, do8 la re[re,]

    %39
    sol1

}

IVvlIripn = \relative do'' {

    R1
    r4 re8 fa mi fa16 sol la8 la
    fa4 re2 dod4

    %4
    re2 r4 re
    re sol,8 sib la sib16 do re8 re
    sib4 r r2

    %7
    r4 sol'2 fad4
    sol sib16 la sib sol la8 do re16 do re do
    sib4 r r2

    %10
    R1
    re,2 la
    sol8 sol' fa re mi2

    %13
    fa4 r r2
    r8 la, sib[sol] la sib16 do re8 do
    sib4 r r2

    %16
    r4 sol8 sib la2
    sol4 r r2
    R1*2

    %20
    r8 fad?\noBeam sib sol la sib16 do re8 re
    re4 sol mi2
    re8 sol re[fa] mi sol fa mi

    %23
    fa fa mi[mi] re fa mi re
    mi4 r mi4. mi8
    re4 r r2

    %26
    r4 sol2 fad4
    sol fa? mi2\mbreak
    re4 fa sol2

    %29
    la8 fa la fa sib[fa mi8. mi16]
    fad4 re r2
    r4 re8 fa? mi fa16  sol la8 la

    %32
    fad4 re la'2
    sol4 r r2
    R1*2

    %36
    r4 la mib r8 do
    re4 r8 sib do4 r
    r sib do8 do la4

    %39
    sol1

}

IVvlIIripn = \relative do'' {

    R1
    r4 re2 dod4
    re4. re8 mi2

    %4
    fad4 r do la
    sib r r2
    r4 re8 fa? sol la16 sib dod?8 dod

    %7
    fad,4 re r la
    sol r r2
    r4 re'2 dod4

    %10
    re sol la2\mbreak
    sol4 r r2
    r4 re8 fa mi fa16 sol la8 la

    %13
    fa re fa[fa] mi fa16 sol la sol la mi
    fad4 r r2
    r4 re2 dod4

    %16
    re r r2
    r4 sol,2 fad4
    sol r r2

    %19
    R1*2
    r4 re'2 dod4
    re r r2

    %23
    r8 re\noBeam la do si re do si
    dod4 re2 dod4
    re r r2

    %26
    R1
    r8 re\noBeam fa re mi fa16 sol la8 sol
    fa4 fa2 mi4

    %29
    fa r8 la mi4 r8 mi
    re4 r r2
    R1

    %32
    r4 sol,8 sib la sib16 do re8 re
    sib4 r r2
    R1*2

    %36
    r4 re sib r
    r sib sol r
    sib2 r4 re

    %39
    si1

}

IVvlaIIn = \relative do' {

    R1
    r4 la sib8 la la4
    la r r2

    %4
    re4 re mib r
    \parenthesize  re2  mi?8 re re4
    re la r8 la la4

    %7
    la4 r r2
    R1*3
    r4 sol2 fad4

    %12
    sol r8 re mi2
    re8 sib' la4 r8 la la4
    la re r8 re re4

    %15
    re r r2
    R1
    re2 mi8 re re4

    %18
    re r r2
    R1*2
    r4 sib r la

    %22
    la r r2
    R1*3
    re2 do

    %27
    sib4 re r la\mbreak
    la r8 la sol sib do4~
    do re sib8 la la4

    %30
    la r r2
    R1
    re2 r4 re

    %33
    sib r r2
    R1*2
    r4 la sib r

    %37
    r sol do r
    re2 mi4 re
    re1

}

IVvcIIn = \relative do {

     R1
     sol' 8la fa[re] sol re la'[la,]
     re4 re8 fa mi fa16 sol la8 la,

     %4
     re4 sol2 fad4
     sol8 la sib sol do sol re4
     sol8 mi fa[re] sol re la'[la,]

     %7
     re8 do sib sol do sol re'[re,]
     sol4 r8 sol do la re [re,]
     sol' la sib re sol, re la'[la,]

     %10
     re8 la' sib[sol] do, la re[re,]\mbreak
     sol' la sib sol do sol re'[sol,]
     sol sol, sib[re] sol re \parenthesize la4

     %13
     re8 sol fa[re] sol re la'[la,]
     re4 r8 sib do sol re'[re,]
     sol4 re' sol8 re la4

     %16
     re sib8 sol la sib do re
     sol,4 sib do8 sol re' [re,]
     sol4 r r2

     %19
     R1*2
     r8  sol' sib sol la4 la,

     %22
     re r r2
     R1
     r4 re sol8 re la'[la,]

     %25
     re4 sib do8 \parenthesize sol re'[re,]
     sol4 r r2
     sol'4 re'2 dod4\mbreak

     %28
     re8 fa, la[fa] sib sol do[do,]
     <<fa4\\re>> r8 re sol re la'[la,]
     re4 r r2

     %31
     sol,8 la sib re sol re la' la,
     \parenthesize re8 do sib sol do sol re'4
     sol,4 r r2

     %34
     R1*2
     sol8 sol' fad[re] sol4 la

     %37
     fad sol mi! fad
     sol sol, do8 la re[re,]
     sol1

}

IVbcn = \relative do {

     sol8 la sib sol do sol re'[re,]
     sol' la fa[re] sol re la4
     re re8 fa mi fa16 sol la8 la,

     %4
     re4 sol2 fad4
     sol8 la sib sol do, sol re'4
     sol8 mi fa[re] sol re la4

     %7
     re8 do sib sol do sol re'4
     sol, r8 sol do la re [re,]
     sol4 sib8 re sol, re' la4

     %10
     re8 la sib[sol] do la re4\mbreak
     sol,4 r8 sol do sol re'4
     sol, sib8 re sol re la4

     %13
     re8 sol fa[re] sol re la4
     re r8 sib do sol re'4
     sol, re' sol8 re la4

     %16
     re sib8 sol la sib do re
     sol,4 sib do8 sol re' [re,]
     sol\noBeam \clef violin\key fa\major re''' sol,[sib] la do sib la

     %19
     sib sol re[fa] mi sol fa mi
     fad4 sol2 fad4
     sol8\noBeam \clef bass\key fa\major  sol, sib sol la2

     %22
     re,8\noBeam\clef violin\key fa\major la'''[re, fa] mi2
     fa8 re la[do] si? re do si
     dod4 \clef bass \key fa\major re,, sol8 re la'4

     %25
     re, sib do8 sol re'[re,]
     sol4 sol'8 sib  la sib16 do re8 re,
     sol4 re'2 dod4\mbreak

     %28
     re8 fa, la[fa] sib sol do,4
     fa r8 re sol, re' la4
     re8 do sib sol do sol re4

     %31
     sol8 la sib re sol re la4
     re8 do sib sol do sol re'4
     sol,8 sol' fad re sol4 la

     %34
     fad sol mi! fad
     sol sol, do8 la re[re,]
     sol sol' fad[re] sol4 la

     %37
     fad sol mi! fad
     sol sol, do8 la re[re,]
     sol1

}

IVbfn = \figuremode {
	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s4 <6> <5> <_+>
	s <6> <6 5>8 <_-> <4> <3+>
	<_->4 s8 <6> <7>4 <_+>
	<_+> s <4 2> <5->
	<_->2 s4 <_+>
	<_-> <6> <6 5> <_+>
	<_+> <6> <5> <_+>
	s2 s4 <_+>
	<_->2 s8 <_-> <_+>4
	<_+> <6> s8 <_-> <_+>4
	<_->2 s4 <_+>
	s2 s8 <_-> <_+>4
	<_-> <6> <6 5> <_+>
	<_+>4 s8 <6> <5>4 <_+>
	<_->4 <_-> <6 5>8 <_-> <_+>4
	<_+> <6> s <5>8 <_+>
	s4 <6> <5> s
	s1*2
	<6 5 _+>4 s <4 2> <5>
	s1*3
	s2 s4 <_+>
	s4 <6> <6> <_+>
	s2 <7>4 <_+>
	<_-> s <4 2> <6>8 <5->
	s4 <6> <5> s
	<5>8 <6> s4 <6 5> <_+>
	<_+> <6> s <_+>
	s2 <6 5>4 <_+>
	<_+> <6> <5> <_+>
	s <6> <6 5> <6 5->
	<5> s <6 5> <5->
	<9> <8> <5> <_+>
	s <6> <6-> <5->
	<6> s s <5->
	<_- 9> <8> <5> <_+>
	<_+>1

}


forma = {

\time 4/4
\key fa\major
\tempo 2 = 60
s1*39
\bar "|."

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


IVvlaI = {
	\IVglobal
	\clef alto
	<<\IVvlaIn \forma>>

}


IVvcI = {
	\IVglobal
	\clef bass
	<<\IVvcIn \forma>>

}

IVvlIrip = {
	\IVglobal
	<<\IVvlIripn \forma>>

}

IVvlIIrip = {
	\IVglobal
	<<\IVvlIIripn \forma>>

}

IVvlaII = {
	\IVglobal
	<<\IVvlaIIn \forma>>

}


IVvcII = {
	\IVglobal
	\clef bass
	<<\IVvcIIn \forma>>

}


IVbc = {
	\IVglobal
	\clef bass
	<<\IVbcn \forma \IVbfn>>
	\typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    systems_per_page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup \smaller "Sinfonia undecima [Op. III (1685)]"
    composer = \markup \center-column{"   ""G. Bononcini (1670-1747)"}
}

\markup\huge "[1.] Adagio"

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Violino 1°""1° Choro]"}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Violino 2°""1° Choro]"}
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Alto""1° Choro]"}
                \set Staff.midiInstrument = #"viola"
                \IvlaI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""1° Choro]"}
                \set Staff.midiInstrument = #"cello"
                \IvcI
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino 1°""2° Choro]"}
                \set Staff.midiInstrument = #"violin"
                \IvlIrip
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino 2°""2° Choro]"}
                \set Staff.midiInstrument = #"violin"
                \IvlIIrip
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major\time 4/4  r1^\markup \right-align"[Tenor 2° Choro]"}
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IvlaII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""2° Choro]"}
                \set Staff.midiInstrument = #"cello"
                \IvcII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"[Basso""Continuo]"}
            \set Staff.midiInstrument = #"church organ"
            \Ibc
        >>
    >>

    \layout {

        indent = 2.5\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

%\pageBreak

\markup\huge "[2.] Allegro"

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

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
                \IIvlaI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIvcI
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlIrip
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlIIrip
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major\time 4/4  r1}
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IIvlaII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIvcII
            >>
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"church organ"
            \IIbc
        >>
    >>

    \layout {

        indent = 1.2\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[3.] Adagio"

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

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
                \IIIvlaI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIvcI
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlIrip
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlIIrip
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major\numericTimeSignature\time 3/2  r1}
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IIIvlaII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIvcII
            >>
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"church organ"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.2\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[4.] Allegro"

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

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
                \set Staff.midiInstrument = #"viola"
                \IVvlaI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IVvcI
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IVvlIrip
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IVvlIIrip
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major\numericTimeSignature\time 3/2  r1}
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IVvlaII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IVvcII
            >>
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"church organ"
            \IVbc
        >>
    >>

    \layout {

        indent = 1.2\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
