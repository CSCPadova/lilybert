\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = "up"

giu = \change Staff = "down"

tasto = _\markup\italic"Tasto Solo"

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


upl =
#(let ((m (make-articulation 'stopped)))
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
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }



Iglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.4
		\override TupletBracket.bracket-visibility = ##f
		\terzine
			}


IvlIn = \relative do'' {

    do4 do, r16 do' si la sol fa mi re
    do8 mi fa sol do,16 do' si la sol fa mi re
    \once\stemUp do sol'' fa sol\mbreak mi4 r16 mi re do si4\mbreak

    %4
    do4 r16 sol' re fa mi8 do re8. re16
    mi4 r16 sol fa sol mi4 r16 la sol fa
    mi4 r16 re sol re mi mi re do si la sol fa

    %7
    mi4 r r2\mbreak
    r8 do'4  si8 do16 do si la sol fa mi re
    do4 do'~do8 si la4

    %10
    sol r r16 si' la sol fad mi re do
    si4 r r2\mbreak
    r r8 sol'4 fad8

    %13
    sol16 si la sol fad  mi re do si4 r16 si la si
    sol4 r16 mi' re do si4 la
    sol r16 sol' fa? sol mi4 r\mbreak

    %16
    r16 do sib do sol4 fa r
    r r16 fa' mib fa re4 r
    r16 sol fa sol re4 do r

    %19
    r r16 la' sol la fad4 r\mbreak
    r16 si la si fad4 mi r
    r2 la4 la,

    %22
    r16 la' sol fa? mi re do si la8 do re mi
    la,8 la si4~si8 si la4
    r2 la4 si\mbreak

    %25
    do16 mi re mi do4 r16 do'si la sold la fa sold
    la4 r r8 la4 sold8
    la4 la16 si la sol fad8 sol fad8. fad16

    %28
    sold sold fad? sold la mi do mi\mbreak re4 r16 re si re
    do4 r16 la' fa? la sol?4 r16 sol mi sol
    fa4 r16 do' la do sol8 la r16 sol fa sol

    %31
    la4 r fa sol\mbreak
    la16 la sol la fa mi re do si8 do4 si8
    do16 sol' fa sol mi mi re mi do4 r

    %34
    r8 do4 si8 do4 do,
    r16 do' si la sol fa mi re\mbreak do8 mi fa sol
    \once\stemUp do,16 mi' re do si la sol fa mi4 r

    %37
    r8 do'4 si8 do16 mi re do si la sol fa
    mi4 r do' re
    mi r r2\fermata

}


IvlIIn = \relative do'' {

    R1
    r8 do4 si8 do16 mi re do si la sol fa
    mi4 r16 mi' re mi do4 r16 la' sol fa

    %4
    mi sol fa mi re4 do r\mbreak
    do do, r16 do' si la sol fa mi re
    do8 mi fa sol do,4 r16 re' sol re

    %7
    mi sol fa sol mi4 r16 mi re do si la sol fa
    mi sol' mi sol\mbreak re re sol re mi mi re do si8 do16 re
    mi8. re16 do16 re do si la8 sol4 fad8

    %10
    sol4 r r16 sol' fad mi re do si la
    sol4 r\mbreak sol' sol,
    r16 sol' fad mi re do si la sol8 si do re

    %13
    sol, sol la4~la8 la sol4
    r16 sol la si do re mi fad sol8 sol, 4fad8\mbreak
    sol16 sol' fa sol re4 do r

    %16
    r r16 do sib do la4 r
    r16 fa' mib fa do4 sib r
    r r16 sol' fa sol mi4 r\mbreak

    %19
    r16 la sol la mi4 re r
    r  r16 si' la si sold4 r
    r8 la4 sold8 la4 r

    %22
    r2 la,4 si
    do16 do si la sold8 la16 si\mbreak do mi re mi do4
    r16 la si do re mi fad sold la8 la4 sold8

    %25
    si4 la, r16 la' sol fa mi re do si
    la4 r la si\mbreak
    do16 re do si la4 si8 mi mi8. red16

    %28
    mi mi re mi do4~do16 do la do si4~
    si16 si sold si la8 fa'?~fa16 fa re fa mi4~\mbreak
    mi16 mi do mi re8 fa re16 mi fa8 fa8. mi16

    %31
    fa4 r r8 fa4 mi8
    fa16 fa mi fa re do si la sol4 fa
    mi r16 sol' fa sol mi4 r\mbreak

    %34
    do4 re mi r
    r2 r8 do4 si8
    do16 do si la sol fa mi re do4 r

    %37
    do' re mi16 do si la sol fa mi re
    do4 r r8 do'4 si8\mbreak
    do4 r r2\fermopz

}


Ivlan = \relative do' {

    R1*3
    r8 do4 si8 do16 mi re do si la sol fa
    mi mi' re mi do4 r16 mi re do si4

    %6
    do16 mi sol do, re4 do r\mbreak
    do' do, r16 do' si la sol fa mi re
    do8 mi fa sol do,4 r16 la' sol fa

    %9
    mi4 r 8 do re4 do
    si r r2
    r16 si' la sol\mbreak fad mi re do si4 r

    %12
    R1
    r16 sol' fad mi re do si la sol re' do re si4
    r16 si' la sol fad4 r8 re mi re

    %15
    re4 r\mbreak r16 mi re do si la sol fa
    mi4 r r16 la' sol fa mi re do si
    la4 r r16 re' do sib la sol fa mib

    %18
    re4 r r16 mi? re do si? la sol fa\mbreak
    mi4 r r16 fad' mi re dod si la sol
    fad4 r mi' r

    %21
    mi8 mi fa? mi mi16 mi re mi do4
    r2 r8 la'4 sold8
    la16 la sol? fa\mbreak mi re do si la4 r16 do' si do

    %24
    la4 r la8 la fa mi
    mi16 do si do la4 la r
    r16 do' si la sold la fa sold la8 la fa mi\mbreak

    %27
    mi4 r8 la~la sol do, si
    si4 r8 do la4 r8 si
    do4 mi8 fa re4 r8 mi

    %30
    la,4 r8 do re do do4
    la16 la' sol fa  mi re do sib\mbreak la4 re8 do
    do4 r8 re re mi fa sol

    %33
    mi4 r mi r
    mi la8 sol sol4 r
    R1

    %36
    r2 r16 mi re do si la sol fa
    mi8 mi' la sol mi4 r
    r16 mi re do si la sol fa mi8 mi' la sol

    %39
    sol4 r r2\fermopz

}

Ivcn = \relative do {

    R1*2
    do'4 do, r16 do' si la sol fa  mi re
    do8 mi fa sol do,16 do' si la sol fa mi re

    %5
    do4 r r2
    r8 do'4 si8\mbreak do16 do si la sol fa mi  re
    do4 r16 mi' re mi do do, re mi fa sol la si

    %8
    do4 r r16 do, re  mi fa sol la si
    do re do si la si la sol\mbreak fad8 sol do, re
    sol,16 sol' fad mi re do si la sol4 r

    %11
    r16 sol' fad mi re do si la sol4 r
    R1
    r2 sol'4 sol,\mbreak

    %14
    r16 sol' fad mi re do si la sol8 si do re
    sol,4 r do16 do' si la sol fa mi re
    do4 r fa,16 fa' mi re do sib la sol\mbreak

    %17
    fa4 r sib16 sib' la sol fa mib re do
    sib4 r do16 do' si! la sol fa mi re
    do4 r re16 re' do si la sol fad mi

    %20
    re4 r\mbreak mi16 mi' re do si la sol fa
    mi8 do re mi la,4 r16 do' si do
    la4 r r2

    %23
    r la4 la,
    r16 la' sol fa mi re do si\mbreak la8 do re mi
    la,4 r16 do' si do la4 r

    %26
    r16 la sol fa mi re do si la8 do re mi
    la16 si la sol fad sol fad mi red8 mi la, si\mbreak
    mi4 r8 la fad16 la fad la sold si sold si

    %29
    la4 r8 re si16 re si re dod mi dod mi
    re4 r16 la fa la sib8 fa do' do,\mbreak
    fa16 fa mi re do sib la sol fa8 la sib do

    %32
    fa,4 fa'~fa8 mi re sol
    do4 do, r16 do' si? la sol fa mi re
    do8 mi fa sol do,4 r\mbreak

    %35
    R1
    r2 r16 do' si la sol fa mi re
    do8 mi fa sol do,4 r

    %38
    r16 do' si la sol fa mi re do8 mi fa sol
    do,4 r r2\fermopz

}

Ibcn = \relative do {

    \clef violin do''4 do, r16 do' si la sol fa mi re
    do8 mi fa sol do, r r4
    \clef bass do4 do, r16 do' si la sol fa  mi re

    %4
    do8 mi fa sol do,16 do' si la sol fa mi re
    do4 r do r
    r8 do4 si8 do4 r

    %7
    do4 r do16 do re mi fa sol la si\mbreak
    do4 r r16 do, re  mi fa sol la si
    do8. si16 la8. sol16 fad8 sol do, re

    %10
    sol,4 r sol r
    r16 sol' fad mi re do si la sol4 r
    R1
    r2 sol'4 sol,\mbreak

    %14
    r16 sol' fad mi re do si la sol8 si do re
    sol,4 r do16 do' si la sol fa mi re
    do4 r fa,16 fa' mi re do sib la sol\mbreak

    %17
    fa4 r sib16 sib' la sol fa mib re do
    sib4 si do r
    do dod re r\mbreak

    %20
    re red mi r
    mi8 do re mi la,4 r
    la r \clef alto r8 la''4 sold8

    %23
    la4 mi \clef bass la, la,\mbreak
    r16 la' sol fa mi re do si la8 do re mi
    la4 r la, r

    %26
    r16 la' sol fa mi re do si la8 do re mi\mbreak
    la8. sol16 fad8. mi16 red8 mi la, si
    mi4 r8 la fad4 sold

    %29
    la4. re,8 si4 dod
    re4. la'8 sib fa? do' do,\mbreak
    fa4 r fa,8 la sib do

    %32
    fa,4 fa'~fa8 mi re sol
    do4 do, r16 do' si? la sol fa mi re
    do8 mi fa sol do,4 r\mbreak

    %35
    R1
    r2 r16 do' si la sol fa mi re
    do8 mi fa sol do,4 r

    %38
    r16 do' si la sol fa mi re do8 mi fa sol
    do,4 r r2\fermata

}

Ibfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	s1
	s8 <6> <6 5> s s2
	s1
	s8 <6> <6 5> s s2
	s1
	s8 <5> <4 2> <6> s2
	s1*2
	s2 <6 5->8 s <5> <_+>
	s1*3
	s2 <9>4 <8>
	s2 s8 <6> <5> <_+>
	s1*3
	<5>4 <6> s2
	s4 <6> <_+>2
	<_+>4 <6> <_+> s
	<_+>8 <6> <5> <_+> s2
	s2 s8 <5> <4 2> <6>
	s2 <9>4 <8>
	s4 <_+> s4 <5>8 <_+>
	s1
	s2 s4 <6 5>8 <_+>
	<_->2 <5->4 <5>8 <_+>
	<_+>2 <6 5->4 <5->
	s4. <_->8 <5->4 <5->
	<9>4 <8>8 <6> <5> s s4
	s2 <6>4 <6 5>
	s2 <4 2>8 <6> <7> <7>
	s1
	s8 <6> <5> s s2
	s1
	s
	s8 <6> <6 5> s s2
	s s8 <6> <6 5>

}


forma = {

\time 4/4
\tempo 2 = 55
\key do\major
s1*39
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
	<<\Ibcn \forma\Ibfn >>
	\typeset

}



IIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.4
		\override TupletBracket.bracket-visibility = ##f
		\terzine
			}


IIvlIn = \relative do'' {

    mi4. fa16(mi) re4. mi16(re)
    do8 re mi2 re4
    mi2\fermata si4. do16 si

    %4
    la4. si16 la sol8 la si4~
    si la si fad'\mbreak
    sol4 r8 si16 la sol4. sol8

    %7
    fa!4. sol16 fa mi4. mi8
    re4. mi16 re do4. do8
    si4. si8 dod4 re~

    %10
    re do!2 sib4
    la2 si!4 do~\mbreak
    do si do4. sol'8

    %13
    fa4. sol16 fa mi4. fa16 mi
    re4. mi16 re do4. re16 do
    si4. si8 do re mi4~

    %16
    mi re mi2\fermata

}

IIvlIIn = \relative do'' {

    do4. re16 do si4. do16 si
    la8 si do si la2
    sold\fermata sol4. la16 sol

    %4
    fad4. sol16 fad mi8 fad sol fad
    mi2 red4. red'8
    mi si fad'4~fad8 si, mi4~

    %7
    mi8 la, re4~ re8 sol, do4~
    do8 fad, si4~si8 mi, la4~
    la sol2 fa?4\mbreak

    %10
    mi4. mi8 fad fad' sol4~
    sol fa!2 mib4
    re4. re8 mi!4 mi~

    %13
    mi8 la, re4~ re8 sol, do4~
    do8 fad, si4~si8 mi, la4~
    la4 sold\mbreak la8 si do si

    %16
    la2 sold\fermopz

}


IIvlan = \relative do' {

    la2 si\mbreak
    do4. sol8 la2
    mi'\fermata mi

    %4
    fad sol4. re8
    mi2 si4 r
    si4. si8 si4 do~

    %7
    do re sol, la~
    la si mi r8 fa
    fa4 mi mi re\mbreak

    %10
    mi la la sol
    mib re re do
    re sol sol do,~

    %13
    do re sol, la~
    la si mi fa
    fa mi~mi8 re do sol

    %16
    la2 si\fermata

}


IIvcn = \relative do {

    la4 la'2 sold4
    la4. sol!8 fa2
    mi\fermata mi4 \clef tenor mi'~

    %4
    mi red mi4. re8
    do2\clef bass si4 la\mbreak
    sol red\mbreak mi8 mi'16 re do8 si
    la la, si si' do do16 si la8 sol
    fad la sold si la la16 sol? fa8 mi
    re4 mi la, re

    %10
    sol la re, sol\mbreak
    do, re sol do,
    sol2 do4. do'16 si

    %13
    la8 la, si si' do do16 si la si la sol
    fad8 la sold si la16 si la sol? fa! sol fa mi\mbreak
    re4 mi la4. sol8

    %16
    fa2 mi\fermopz

}

IIbcn = \relative do {

    la4 la'2 sold4
    la4. sol!8 fa2
    mi\fermata mi4 \clef tenor mi'~

    %4
    mi red mi4. re8
    do2\clef bass si4 la\mbreak
    sol red mi do

    %7
    la si do la
    fad sold la fa'!
    re mi la, re

    %10
    sol la re, sol\mbreak
    do, re sol do,
    sol2 do4. do'16 si

    %13
    la4 si do la
    fad sold la fa
    re mi la4. sol8

    %16
    fa2 mi\fermopz

}

IIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s4 s <4 2> <5->8 <6>
	s4. <6>8 <7>4 <6>
	<_+>2 <_->
	<2>4 <5->8 <6>8 <_->4. <6>8
	<7>4 <6> <_+> <4+>
	<6>4 <6> <9+> <5>
	<5> <5->8 <6> <9>4 <3>
	<5->4 <5->8 <6> <9>4 <5>
	<5> <_-> <7 _+> <_->
	<5> <_-> <7 _+> <_->
	<5> <_-> <7- _+> <_->
	<4> <3+> <_!>2
	<5>4 <5->8 <6> s4 <3>
	<5-> <5->8 <6> <9>4 <3>
	<5> <_+> <_->4. <6>8
	<7>4 <6> <_+>2

}


forma = {

\time 4/4
\tempo 4 = 55
\key do\major
s1*16
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
	<<\IIbcn \forma\IIbfn>>
	\typeset

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    sol'8. la16 sol fa\mbreak mi8 sol4
    la8. sol16 fa mi re8 sol4
    do, re8 mi4 fad8

    %4
    sol re sol~sol la16 sol fad8
    sol fad sol16 fad mi8. fad16 sol8~
    sol fad la~la re, sol~

    %7
    sol fa! sol16 fa mi8 sol16 fa mi8
    re4 re8 mi re4
    do4.~do8 si16 la si8

    %10
    do mi re~re do4\mbreak
    si8 la si do re4
    sol,8 sol'16 la sol fa mi4.

    %13
    R2.*2
    r4. r8 re16 mi re do
    si8 re4 mi8. re16 do si

    %17
    la8 re4 sol, sol8
    la4 si8\mbreak do4 si8
    la4. si8 la4

    %20
    sol8 sol'4~sol8 fad16 mi fad8
    sol si16 la sol8~sol fa!4
    mi8 sol16 fa mi8 re4.~

    %23
    re8 do8. sib16 la4 r8\mbreak
    r8 sol'16 la sol fa mi8 fa16 mi re8
    do4.~do8 si16 la si8

    %26
    do4 si8~si la8. sol16
    fa4. mi8 mi' re~
    re do re16 do si8 mi16 fad mi re\mbreak

    %29
    do8 re16 mi re do si8 do16 re do si
    la8 si16 do si la sold8 la16 si la sold
    fad8 sold16 mi fad sold la8 r la'

    %32
    sol? r sol fa? r fa  %%% fine pagina
    mi r mi re r re
    do r do si4 si8

    %35
    dod4 re8 re dod16 si dod8
    do! r re si la8. la16
    si4 do8 do si16 la si8\mbreak

    %38
    do4. r4.
    R2.*2
    r4. re8. mi16 re do

    %42
    si8 re4 mi8. re16 do si
    la8 re4 sol, sol8
    la4 si8 do sol do~

    %45
    do re16 do si8 do4 si8\mbreak
    si la8. sol16 fa4.
    mi8 mi' re do la re

    %48
    re16 do si do re8~re do sol'~
    sol fa!16 la sol fa mi8 mi16 sol fa mi
    re8 re16 fa  mi re\mbreak do8 la'16 si la sol

    %51
    fa8 sol16 la sol fa mi8 fa16 sol fa mi
    re8 mi16 fa mi re do8 re16 mi re do
    si4 sol'8 do r do

    %54
    si r si\mbreak la r la
    sol r sol fa4 fa8
    mi r mi re re4

    %57
    mi8 la16 si la sol fa8 sol16 la sol fa
    mi8 fa16 sol fa mi re8 mi16 fa mi re\mbreak
    do8 re16 mi re do si8 r sol'

    %60
    do r do si r si
    la r la sol r sol
    fa r fa mi r mi

    %63
    re re4\mbreak mi8 r mi
    re re4 mi8 re4
    mi4. r\fermata

}

IIIvlIIn = \relative do'' {

    R2.*3
    r4. re8. mi16 re do
    si8 re4 mi8. re16 do si

    %6
    la8 re4 sol, sol8
    la4 si8 do sol do~\mbreak
    do re16 do si8 do4 si8~

    %9
    si la8. sol16 fa4.
    mi4 fad8 sol4 la8
    re, re'16 do si8 la4 la8

    %12
    sol4 re'8~re do sol'~
    sol fa!16 la sol fa mi4 mi8\mbreak
    re sol16 la sol fad mi8 fad16 sol fad mi

    %15
    re8 mi16 fad mi re do8 la4
    si si8 do sol'4~
    sol8 fad la~la re, sol~\mbreak

    %18
    sol fa! sol16 fa mi8 fad sol~
    sol la16 sol fad8 sol  r r
    R2.*2\mbreak

    %22
    r4. r8 sol16 la sol fa
    mi8 sol4 la8. sol16 fa mi
    re8 r sol do, 4 re8

    %25
    mi4 fad8 sol4.
    r do,~
    do8 si16 la si8 do 4 fad,8\mbreak

    %28
    sol4 la8~la sol si
    la r la sol r sol
    fad r fad mi r mi

    %31
    re r re' dod fa!4~
    fa8 mi4~mi8 re4~\mbreak
    re8 do4~do8 si4~

    %34
    si8 la4~la8 sold16 fa sold8
    sol! r la fa mi8. mi16
    fad8 la sol sol fad16 mi fad8

    %37
    fa! r sol\mbreak  mi re8. re16
    mi8 sol'16 la sol fa mi8 sol4
    la8. sol16 fa mi re8 sol4

    %40
    do, re8 mi4 fad8
    sol re sol~sol la16 sol fad8
    sol fad sol16 fad\mbreak mi8 sol4~

    %43
    sol8 fad la~la re, sol~
    sol fa! sol16 fa mi8 sol16 fa mi8
    re4 re8 mi re4

    %46
    do4.~do8 si4
    do4. r\mbreak
    r8 sol'16 la sol fa mi4.

    %49
    R2.
    r8 sol16 la sol fa mi8 r mi
    re r re do r do

    %52
    si r si la r la\mbreak
    sol4 si'8~si la4~
    la8 sol4~sol8 fa4~

    %55
    fa8 mi4~mi8 re4~
    re8 do4~do8 si16 la si8
    do r mi re r re

    %58
    do r do si r si
    la r la sol r si'~
    si la4~la8 sol4~

    %61
    sol8 fa4~fa8 mi4~
    mi8 re4~re8 do4~\mbreak
    do8 si16 la si8 do r do~

    %64
    do si16 la si8 do si4
    do4. r\fermata

}


IIIvlan = \relative do' {

    R2.*10
    r4. r8 re16 mi re do
    si8 re4 mi8. re16 do si

    %13
    la8 re4 sol, sol8
    la si4 do do8
    si4 si'8 la4 la8

    %16
    sol4.~sol4 r8
    R2.*2\mbreak
    r4. sol4 fad8~

    %20
    fad mi8. re16 do4.
    si4 si8 do4 re8
    mi re mi fa re4

    %23
    mi8. fa16 sol8~ sol fa sol
    fa re4 mi8 do si
    do4. re\mbreak

    %26
    mi8 re4 do do8
    re4 re8 mi4 la8
    mi4 re8 re si sol

    %29
    la r re sol r do
    fad, r si mi, r la
    re, r si dod re4\mbreak

    %32
    re8  r mi do! r re
    si r do la r si
    mi r mi fa mi4

    %35
    mi8 r la la la4
    la8 r re, re re4
    re8 r sol\mbreak sol sol4

    %38
    sol4. do8. sib16 la sol
    fa4 do'8~do si?16 la si8~
    si la si do la re

    %41
    sol,4. r
    R2.*5
    r4. r8 re16 mi re do\mbreak

    %48
    si8 re4 mi8. re16 do si
    la8 si4 sol sol'8
    fa re sol sol r mi

    %51
    la r re, sol r do,
    fa r si, mi r la,
    re r re\mbreak sol r la

    %54
    fa r sol mi r fa
    re r mi do r re
    si r do la sol4

    %57
    sol8 r mi' la r re,
    sol r do, fa r si,\mbreak
    mi r la, re r re

    %60
    sol r la fa r sol
    mi r fa re r mi
    do r re si r do

    %63
    la sol4 sol8 r do
    la sol4 sol8  sol'4
    mi4. r\fermopz

}

IIIvcn = \relative do {

    R2.*7
    sol'8. la16 sol fa mi8 sol4
    la8.  sol16 fa mi re8 sol4

    %10
    do, re8 mi4 fad8\mbreak
    sol re sol~sol fad16 mi fad8
    sol4 sol,8 do4.

    %13
    re4 re'8~re do16 si do8~
    do si16 la si8~si la16 sol la8~
    la sol16 fad sol8~\mbreak sol fad16 mi fad8

    %16
    sol sol16 fa? mi re do4.
    \clef tenor R2.*2
    re'8. mi16 re do si8 re4

    %20
    mi8. re16 do si la8 re4
    sol, sol8 la4 si8
    do sol do~do si16 la si8

    %23
    do8. sib16 la sol fa4 do'8~
    do si16 la si8 do4 sol8
    \clef bass do,8 do'16 si la8 sol8. la16 sol fa

    %26
    mi8 sol4 la8. sol16 fa mi
    re8 sol4 do, re8
    mi4 fad8 sol sol4~

    %29
    sol8 fad4~fad8 mi4~
    mi8 re4~re8 do4~\mbreak
    do8 si mi la re16 mi re do

    %32
    si8 do16 re do si la8 si16 do si la
    sold8 la16 si la sold fad8 sold16 mi fad sold\mbreak
    la8 la16 sol? fa? mi re8 mi8 mi,

    %35
    la8 la'16 sol fa mi  re8 la' la,
    re re'16 do si la sol8 re' re,
    sol, sol'16 fa mi re\mbreak do8 sol' sol,

    %38
    do4. r
    R2.*6\mbreak
    sol'8. la16 sol fa mi8 sol4\mbreak
    la8. sol16 fa mi re8 sol4

    %47
    do, re8 mi fad4
    sol sol,8 do4 do8
    re re'4~re8 do16 si do8~

    %50
    do8 si 16 la si8 do do4~
    do8 si4~si8 la4~
    la8 sol4~sol8 fad4

    %53
    sol8 sol16 la sol fa? mi8 fa16 sol fa mi
    re8 mi16 fa mi re do8 re16 mi re do\mbreak
    si8 do'16 re do si la8 si16 do si la

    %56
    sol8 la16 si la sol fa8 sol sol,
    do8 do'4~do8 si4~
    si8 la4~la8 sol4~\mbreak

    %59
    sol8 fad4 sol8 sol16 la sol fa?
    mi8 fa16 sol fa mi re8 mi16 fa mi re
    do8 re16 mi re do si8 do'16 re do si\mbreak

    %62
    la8 si16 do si la sol8 la16 si la sol
    fa8 sol sol, do8 la'16 si la sol
    fa8 sol sol, do8 sol4

    %65
    do4. r\fermopz

}

IIIbcn = \relative do {

    \clef violin sol'''8. la16 sol fa\mbreak mi8 sol4
    la8. sol16 fa mi re8 sol4
    do, re8 mi4 fad8

    %4
    sol re sol re8. mi16 re do
    si8 re4 mi8. re16 do si\mbreak
    la8 re4 sol, sol8

    %7
    la4 si8 do sol do
    \clef bass sol,8. la16 sol fa mi8 sol4
    la8.  sol16 fa mi re8 sol4

    %10
    do, re8\mbreak mi4 fad8
    sol re sol~sol fad4
    sol sol,8 do4.

    %13
    re~re8 do4~
    do8 si si'~si la4~
    la8 sol4~\mbreak sol8 fad4

    %16
    sol sol,8 do4.
    R2.*2
    \clef tenor re'8. mi16 re do si8 re4

    %20
    mi8. re16 do si la8 re,4
    sol sol8 la4 si8\mbreak
    do sol do do si4

    %23
    do8. sib16 la sol fa4 do'8~
    do si4 do sol8
    \clef bass do,4 la8 sol sol'16 la sol fa

    %26
    mi8 sol4\mbreak la8. sol16 fa mi
    re8 sol4 do, re8
    mi4 fad8 sol sol4~

    %29
    sol8 fad4~fad8 mi4~
    mi8 re4~re8 do4~\mbreak
    do8 si mi la\clef tenor re16 mi re do

    %32
    si8 do16 re do si la8 si16 do si la
    sold8 la16 si la sold fad8 sold16 mi fad sold\mbreak
    la8 la16 sol? fa? mi re8 mi4

    %35
    \clef bass la,8 la'16 sol fa mi  re8 la' la,
    re re'16 do si la sol8 re' re,
    sol, sol'16 fa mi re\mbreak do8 sol' sol,

    %38
    do4. \clef tenor do'8. sib16 la sol
    fa4 do'8~do si16 la si8~
    si la si do la re

    %41
    sol,4.\mbreak \clef violin re''8. mi16 re do
    si8 re4 mi8. re16 do si
    la8 re4 sol, sol8

    %44
    la4 si8 do sol do
    \clef bass sol,8. la16 sol fa mi8 sol4\mbreak
    la8. sol16 fa mi re8 sol4

    %47
    do, re8 mi fad4
    sol sol,8 do4 do8
    re re4~re8 do4~

    %50
    do8 si4 do8 do'4~\mbreak
    do8 si4~si8 la4~
    la8 sol4~sol8 fad4

    %53
    sol8 sol16 la sol fa? mi8 fa16 sol fa mi
    re8 mi16 fa mi re do8 re16 mi re do\mbreak
    si8 do16 re do si la8 si16 do si la

    %56
    sol8 la16 si la sol fa8 sol4
    do8 do'4~do8 si4~
    si8 la4~la8 sol4~\mbreak

    %59
    sol8 fad4 sol8 sol16 la sol fa?
    mi8 fa16 sol fa mi re8 mi16 fa mi re
    do8 re16 mi re do si8 do16 re do si\mbreak

    %62
    la8 si16 do si la sol8 la16 si la sol
    fa8 sol4 do8 la16 si la sol
    fa8 sol4 do8 sol4

    %65
    do4. r\fermata

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*3
    s4. <4>4 <3+>8
    <6>8 <_+>4 s4.
    <7>4. <9>4 <8>8
    <7> <6-> <6> s4.
    <4>4 <3>8 <6> <4> <3>
    <9>8 <8> s <7>8 <7>4
    s4 <_+>8 <7> <6 ><5->
    s <_+> s <4 2> <6>4
    s4. <9>8 <8> s
    <4> <3-> s <2> <5>4
    <2>8 <6> s <2> <6+>4
    <2>8 <6>4<2>8 <6>4
    s2.*3
    <4>4 <3+>8 <6> <4> <3+>
    <9> <8> s <7> <7> s
    s4. <7>8 <6-> <5->  %% fine prima riga p17 bar 21 OOKK
    s4. <4 2>8 <6>4
    <9>8 <8> s <9> <8> s
    <4 2> <6>4 s4.
    s4 <6->8 <4> <3> s
    <6> <4> <3>  <9> <8> s
    <7> <7>4 s <_+>8
    <7> <6> <6> <9> <8 6>4
    <4 2>8 <6>4 <4 2>8 <6>4
    <4 2+>8 <6>4 <4+ 2>8 <6>4
    <4+ 2>8 <6+> <_+> <_+> <_->4
    <6 5+>8 <3> s <6 5> <3> s
    <6 5->8 <3> s <5-> <3> s
    <9> <8> s <6 5> <_+>4
    <7 _+>8 s <6> <_-> <_+> s
    <7- _+>4. s8 <_+> s
    <7->8 s <6> s4.
    s2.
    s4. <2>8 <6> s
    <2> <3> <6> <6 5> s <_+>
    s4. <4>8 s <3+>
    <6> <_+>4 s4 s8
    <7> <_+>4 <9> <8>8
    <7> <6-> <6> s4.
    <4>8 s <3> <6> <4> <3>
    <9> <8> s <7> <7>4
    s s8 <6> <6 5->4
    s4. <9>4 <8>8
    <4> <3->4 <2>8 <5>4
    <4 2> 8 <6>4 s8 <6>4
    <2>8 <6>4 <2>8 <6>4
    <2>8 <6>4 <2>8 <6>4
    s4. <6 5>8 <3> s
    <6 5>8 <3> s <5> <3> s
    <6 5->8 <3> s <6 5> <3> s
    <6 5> <3> s <6 5> s4
    s8 <6>4 <2>8 <6>4
    s8 <6>4 <2>8 <6>4
    <2>8 <6>4 s4.
    <6 5>8 <3> s <6 5> <3> s
    <6 5> <3> s <6 5-> <3> s
    <6 5> <3> s <6 5> <3> s
    <6 5>2.
    <6 5>

}


forma = {

    \time 6/8
    \tempo 4. = 60
    \key do\major
    s2.*65
    \bar "|."

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
    <<\IIIbcn \forma\IIIbfn>>
    \typeset

}



IVglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.4
		\override TupletBracket.bracket-visibility = ##f
		\terzine
			}


IVvlIn = \relative do'' {

    r16 la dod la mi' mi sold mi la4 sold8 mi
    dod4 si la r
    r16 la dod la mi' mi sold mi la4.^\markup"adagio" la8

    %4
    sold4 sol fad4. fad8
    mi4. mi8 fad4^\markup"allegro" r
    R1

    %7
    r16 re, fad re la' la dod la re4 dod
    si mi^\markup"adagio" mi fad8 mi
    red8 si mi2 red4\mbreak

    %10
    mi^\markup"allegro" r r16 mi,  sold mi si' si red si
    mi4 red dod8 mi fad4
    sold r sold r8^\markup"adagio" si

    %13
    fad4. fad8 sold4 la8 mi\mbreak
    re4. re8 dod4. dod8
    si4. si8 dod mi^\markup"allegro" fad dod

    %16
    re4 mi la, r8 fad'
    si, mi la, re sold, dod fad, si
    sold mi la mi' si4. si8\mbreak

    %19
    dod16 mi re mi dod fad mi fad re4 dod
    si la si r8 la
    si4 r16 mi re mi dod8 la la'4~

    %22
    la8 sold4 fad8~fad mi4 re8~
    re dod si4 dod r8 dod
    si4. si8 la la'16 si dod8 dod,

    %25
    re si dod la si sold la fad
    sold la4 sold8 la mi' fad dod\mbreak
    red si mi4~mi8 mi red4

    %28
    mi r r2
    R1*2
    r8 si dod sold  la4 si

    %32
    mi, mi'~mi8 re4 dod8~
    dod si4 la8~ la sold fad4
    mi mi'2 red4\mbreak

    %35
    mi r8 dod' fad, si mi, la
    red, sold dod, fad red mi4 red8
    mi red mi si' fad4. fad8

    %38
    mi mi fad dod re4 mi\mbreak
    la,16 la' sol la fad la sol fad mi4. mi8
    fad re re'4~re8 dod4 si8~

    %41
    si la4 sol8~ sol sol fad fad
    mi4. mi8 fad4. fad8
    mi4. mi8\mbreak re dod si4~

    %44
    si8 dod16 si la8 la' sol4. sol8
    fad4. fad8 sold4 la~
    la8 sold la la, si4. si8

    %47
    la mi' fad mi re4 mi\mbreak
    la,8 si r la si4. si8
    dod4 r8 la' re4 dod

    %50
    si la sold8 la4 sold8
    la4 r8 la\p re4 dod
    si la sold8 la4 sold8\mbreak

    %53
    la4 r r2\fermata

}


IVvlIIn = \relative do'' {

    r2 r16 la dod la mi' mi sold mi
    la4 sold8 mi dod16 dod mi dod si sold si sold
    dod4. dod8 la4 si\mbreak

    %4
    si mi~mi8 la, re4~
    re dod re16 re, fad re la' la dod la
    re fad la fad mi dod mi dod fad4 mi

    %7
    re4 r r16 re, fad re la' la dod la\mbreak
    re4 re dod r8 dod
    si4 r8 si la4. la8

    %10
    sold4 r r2
    r r16 mi sold mi si' si red si
    mi4 red si mi~\mbreak

    %13
    mi8 la, re?4~re8 sold, dod4~
    dod8 fad, si4~ si8 mi, la4~
    la8 si16 la sold4 la r

    %16
    R1*2
    r4 la2 sold4
    la la'~ \mbreak la8 sold4 fad8~

    %20
    fad mi4 re8~re re dod dod
    si4. si8 dod16 mi re mi dod8. dod16
    re4 dod si la

    %23
    sold8 la4 sold8 la mi' fad dod\mbreak
    re4 mi la, r8 fad'
    si, mi la, re sold, dod fad, si

    %26
    mi, mi' re4 dod r8 dod
    si4. si8 la4. si16 la
    sold8 si dod sold la4 si\mbreak

    %29
    mi, r8 dod'' fad, si mi, la
    red, sold dod, fad red mi4 red8
    mi4 r8 mi, fad4 r8 fad

    %32
    sold sold'16 la si4 la sold\mbreak
    fad mi red8 mi4 red8
    mi4 r r2

    %35
    R1*2
    r4 mi2 re!4~
    re8 sold, dod la si4. si8

    %39
    dod4 r8 la si si la8. sol?16
    fad4 r r2
    r r8 la si fad

    %42
    sol4 la re, re'~\mbreak
    re8 sold, dod4 si8 lad si si
    dod4 fad~  fad8 si, mi4~

    %45
    mi re mi4. fad16 mi
    re4 dod si4. si8
    dod la la'2 sold4\mbreak

    %48
    la8 sold fad mi re4. re8
    dod la la'4~la8 sold4 fad8~
    fad mi4 re8~re dod si4

    %51
    la la'\p~la8 sold4 fad8~
    fad mi4 re8~\mbreak re dod si4
    la r r2\fermata

}


IVvlan = \relative do' {

    R1
    r2 r16 la dod la mi' mi sold mi
    la4 sold fad fad

    %4
    mi r8 la la4 r8 la
    si4 la la r
    r16 re, fad re la' la dod la re4 dod8 la

    %7
    fad16 fad la fad mi dod mi dod fad4 r
    sol si~si8 mi, la4
    fad mi la,2

    %10
    mi'4 r r2\mbreak
    r16 mi sold mi si' si, red si mi4 red
    si r si4. si8

    %13
    dod4 re mi2
    la4 r8 si mi,4 fad
    fad mi mi la~

    %16
    la sold\mbreak la la~
    la8 sold4 fad8~fad mi4 re8
    mi4 r8 mi\mbreak fad16 fad mi fad si, mi re mi

    %19
    dod dod' si dod la8 la, re si dod la
    si mi fad fad mi mi fad dod
    re4 mi la, r8 fad'

    %22
    si,8 mi la, re\mbreak  sold, dod fad, si
    mi la re, mi la,4 r8 la'
    fad4 r8 mi mi4 r8 la

    %25
    fad mi mi fad sold4 r8 fad
    si, dod  re4 mi r8 mi
    fad4 mi la fad\mbreak

    %28
    mi mi2 red4
    mi r8 sold la fad sold mi
    fad re mi dod si si' la4

    %31
    sold r r2
    R1*2
    r8 si dod sold la4 si\mbreak

    %35
    mi,4 mi~mi8 red4 dod8~
    dod si4 la8~la sold fad si
    mi fad mi mi dod4 si

    %38
    si r r2
    r4 re2 dod4
    re16 mi fad sol la4\mbreak sol fad

    %41
    mi re dod re
    mi r8 la, la si16 dod re8 dod
    si4 dod re8 fad re re

    %44
    sol4 r8 dod, re4 mi
    la, r16 la' sol fad mi4 r\mbreak
    r la2 sold4

    %47
    la r r2
    r4 la2 sold4
    la r8 fad fad mi mi re

    %50
    si sol' la re, sold mi fad mi
    dod4 r8 fad\p fad mi mi re\mbreak
    dod mi la re, sold mi fad mi

    %53
    dod4 r r2\fermopz

}

IVvcn = \relative do {

    la4 r r2
    r16 la dod la mi' mi sold mi la4 sold
    fad mi re red

    %4
    mi dod\mbreak re4. re8
    sol,4 la re r
    r2 r16 re fad re la' la dod la

    %7
    re4 dod si la
    sol sold la la~
    la sold fad2

    %10
    mi16 mi sold mi si' si red si mi4 red
    dod si la r
    r16 mi sold mi si' si red si\mbreak mi4 sold,

    %13
    la si mi, la
    fad8 la sold8. sold16\mbreak la8. sold16 fad8. mi16
    re8 re' mi mi, la4 r

    %16
    R1*2
    r8 mi8 fad dod re4 mi

    %19
    la, r8 fad' si mi la, re\mbreak  %%% fine 5ta riga
    sold, dod fad, si sold mi la4~
    la8 si16 la sold4 la r

    %22
    R1
    r2 r4 la~
    la sold la la~

    %25
    la8 sold4 fad8~fad mi4 re8~
    re dod si mi\mbreak la,4 la'~
    la sold fad8 sold16 la si8 si,

    %28
    mi4 r r2
    r4 \clef tenor \key re\major mi'4~mi8 red4 dod8~
    dod si4 la8~\mbreak la sold fad si  %%% inizio nuova pagina

    %31
    mi,4 mi'2 red4
    mi \clef bass \key re\major r8 dod fad, si mi, la
    red, sold dod, fad\mbreak si, mi si'8 si,

    %34
    mi4 r r2
    R1*2

    %37
    r8 si' dod sold la4 si
    mi, la2 sold4
    la8 la si fad\mbreak sol4 la

    %40
    re, r8 si' mi, la re, sol
    dod, fad si, mi dod la re4~
    re dod re8 re'16 dod si8 la

    %43
    sold sold, lad  lad' si fad sol ?re
    mi4 fad si,8 si' dod dod,
    re4 re'~re8 re dod4

    %46
    si8 mi, fad dod re4 mi\mbreak
    la,4 r r2
    r8 mi' fad dod re4 mi

    %49
    la \clef tenor r8 fad'8\mbreak si, mi la, re
    sold, dod fad, si mi, la re, mi
    la4 r8 fad'\p si, mi la, re

    %52
    sold, dod fad, si\mbreak mi, la re, mi
    la4 r r2\fermata

}

IVbcn = \relative do {

    la4 r r2
    r16 la dod la mi' mi sold mi la4 sold
    fad mi re red

    %4
    mi dod\mbreak re4. re8
    sol,4 la re r
    r2 r16 re fad re la' la, dod la

    %7
    re4 dod si la
    sol sold la la'~
    la sold fad2

    %10
    mi16 mi sold mi si' si, red si mi4 red
    dod si la r
    r16 mi' sold mi si' si, red si\mbreak mi4 sold

    %13
    la si mi, la
    fad sold la fad
    re mi la,\clef alto \key re\major la''~

    %16
    la sold la la~ \mbreak
    la8 sold4 fad8~fad mi4 re8
    mi \clef bass \key re\major mi, fad dod re4 mi

    %19
    la, r8 fad' si, mi la, re\mbreak  %%% fine 5ta riga
    sold, dod fad si sold mi la4~
    la sold la \clef tenor\key re\major r8 fad'

    %22
    si, mi la, re sold, dod fad, si\mbreak
    mi, la re, mi la4 \clef bass\key re\major la4~
    la sold la la~

    %25
    la8 sold4 fad8~fad mi4 re8~
    re dod si mi\mbreak la,4 la'~
    la sold fad si,

    %28
    mi \clef tenor \key re\major mi'2 red4
    mi mi~mi8 red4 dod8~
    dod si4 la8~\mbreak la sold fad si  %%% inizio nuova pagina

    %31
    mi,4 mi'2 red4
    mi \clef bass \key re\major r8 dod fad, si mi, la
    red, sold dod, fad\mbreak si, mi si4

    %34
    mi8\clef alto\key re\major si'' dod sold la4 si
    mi, mi~mi8 red4 dod8~
    dod si4 la8~\mbreak la sold fad si

    %37
    mi \clef bass \key re\major si dod sold la4 si
    mi, la2 sold4
    la8 la si fad\mbreak sol4 la

    %40
    re, r8 si' mi, la re, sol
    dod, fad si, mi dod la re4~
    re dod re si\mbreak

    %43
    sold4 lad si8 fad' sol re
    mi4 fad si, dod
    re re2 dod4

    %46
    si8 mi fad dod re4 mi\mbreak
    la,8 \clef violin\key re\major mi'''8 fad dod re4 mi
    la,8 \clef bass\key re\major mi, fad dod re4 mi

    %49
    la \clef tenor r8 fad'8\mbreak si, mi la, re
    sold, dod fad, si mi, la re, mi
    la4 r8 fad' si, mi la, re

    %52
    sold, dod fad, si\mbreak mi, la re, mi
    la4 r r2\fermata

}

IVbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s1
	s4 <_+> s2
	s s4 <5->
	<_+> <5-> <9> <8>
	<5>1
	s
	s
	s2 <9>4 <8>
	<4+ 2> <6> <7> <6+>
	<_+> s <_+>2
	s4 <_+> s2
	s16 <_+> s8 <_+>4 s <6>
	<6 5> <_-> <7 _+> s
	<6 5> <5-> <9> <3>
	<6 5> <_+> s2
	<2>4 <6> s2
	s8 <6> <2> <6> <2> <6> <2> <6>
	<_+>8 <_+> s <6> <5>4 <_+>
	s4 s8 <7> <7> <7> <7> <7>  %%% fin qui battuta 19 OOKK
	<7> <7> <7> <7> <6 5-> s s4
	<4 2> <6> s2
	<7>8 <7 _+> <7> <7> <7> <7> <7> <7>
	<7 _+>4 <5>8 <_+> s2
	<4 2>4 <6> s2
	<2>8 <6> <2> <6> <2> <6> <2> <6>
	<2>4 <7>8 <7 _+> s2
	<4+ 2>4 <6> <7> <7 _+>
	<_+> <6>8 <5>8 <2>4 <6>
	<_+> <5>8 <6> <2> <6> <2> <6>
	<2> <6+> <2> s <4+ 2> <6> <7> <7 _+>  %%% bar 30 OOKK
	<_+>4 <6>8 <5> <2> s <6>4
	s4 s8 <7> <7> <7> <7_+> <7>
	<7> <7> <7> <7> <7 _+> <_+> <4> <3+>
	<_+>8 s s4 <5> <_+>
	<_+> <5>8 <6> <2> <6> <2> <6>
	<2> <6> <2> <6> <2> <6> <7> <7 _+>
	<_+> <_+> s4 <5> <_->
	<7 _+> <6>8 <5> <2> s <6>4
	s s8 <6> <5>2
	s4 s8 <7> <7> <7> <7> <7>
	<7> <7> <7> <7> <5-> s <6> <5>
	<2>4 <6>  s <5>
	<5-> <5-> <_->8 <_+> s <6>
	<6>4 <_-> <5> <5->
	<9> <8> <4+ 2> <6>
	<7>8 <_+> s <6> <6 5>4 <_+>
	s2 <5>4 <_+>
	s8 <_+> s <6> <6 5>4 <_+>
	s4 s8 <7> <7>8 <7> <7> <7>
	<7> <7> <7> <7> <7 _+> s <5> <_+>
	s4 s8 <7> <7> <7> <7> <7>
	<7> <7> <7> <7> <7> s <6> <5>

}


forma = {

\time 4/4
\tempo 2 = 55
\key re\major
s1*2
s2 \tempo 4 =55 s
s1
s2 \tempo 2 =55 s
s1*2
s4 \tempo 4 =55 s4 s2
s1
\tempo 2 =55
s1*2
s2  s4 \tempo 4 =55 s
s1*2
s2 s8 \tempo 2 =55 s4.
s1*38
\bar "||"

}

IVvlI = {
	\IVglobal
	\notypeset
	<<\IVvlIn \forma>>

}

IVvlII = {
	\IVglobal
	<<\IVvlIIn \forma>>

}

IVvla = {
	\IVglobal
	\clef alto
	<<\IVvlan \forma>>

}

IVvc = {
	\IVglobal
	\clef bass
	<<\IVvcn \forma>>

}

IVbc = {
	\IVglobal
	\clef bass
	<<\IVbcn \forma\IVbfn>>
	\typeset

}



Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


VvlIn = \relative do'' {

    dod1 dod2
    si1 dod2~
    dod si4 la si2~

    %4
    si la la'4 sold
    fad1 fa2
    mi2. mi4 la sol?

    %7
    fad2 mi4 re dod2\mbreak
    fad?1 fad2
    mi1 fad4(mi)
    re1 re2

    %11
    dod do re4(do)
    si2 si'2. si4
    la1 si4 la

    %14
    sol1 sol2
    fad fa sol4(fa)
    mi1 mi2\mbreak

    %17
    re1 re2
    re re mi4 re
    do1 do2

    %20
    si sib do?4 sib
    la2 la'2. la4
    sol2 sol2. sol4

    %23
    la2. sol4 fa2
    mib1 fa?4 mib
    re1 re2

    %26
    do1 re4 do
    sib1 si2
    dod!1 re2~

    %29
    re dod2. dod4
    si1 si2
    dod2. re4 mi2~

    %32
    mi re4(dod) re2~
    re dod4(si) dod2~
    dod si4 la si2

    %35
    dod1.\fermopz

}


VvlIIn = \relative do'' {

    la1 la2
    sold1 sold2
    fad fad'2. fad4

    %4
    mid1 mi2~
    mi red re~
    re dod re~

    %7
    re dod4 re mi2~
    mi re4(dod) re2~
    re dod4(si) dod2~

    %10
    dod si si~
    si la4(sol) la2~
    la sol sol'~

    %13
    sol fad4 mi fad2~
    fad mi4(red) mi2~
    mi re!4(dod) re2~

    %16
    re do4(si) do2~
    do? do!1
    si2 si1~

    %19
    si2 la1~
    la2 sol1~
    sol2 fa fa'~\mbreak

    %22
    fa mi4(re) mi2
    fa2. mib4 re2~
    re do4(si) do2~

    %25
    do sib4(la) sib2~
    sib? la1~
    la2 sol1~

    %28
    sol2 fad!4 mi fad2\mbreak
    sold sol la~
    la sold si~

    %31
    si la si
    la1.
    sold

    %34
    fad
    mid\fermopz

}


Vvlan = \relative do' {

    fad1 fad2
    re1 dod2
    fad1 fad2

    %4
    dod1 dod2
    dod si1
    mi fad4 sol\mbreak

    %7
    la2 la,2. si4
    dod2 re2. dod4
    si2 dod1

    %10
    fad fad2
    sol fad1
    re re2

    %13
    mi fad1
    si, si2
    dod re1

    %16
    sol, sol'2
    la1 la2\mbreak
    re, mi si

    %19
    mi1 mi2
    fa r sol
    do,1 do2

    %22
    re1 do2
    do? la la'
    sib r la

    %25
    fa1 fa2
    sol r fad!\mbreak
    re1 re2

    %28
    la la'4 sol fad2
    mi1 mi2
    fad mi1

    %31
    mi mi2
    la1 re,2
    mi1.

    %34
    fad
    dod!\fermopz

}

Vvcn = \relative do {

    fad1 fad2~
    fad mid mi
    re1.

    %4
    dod2 dod'2. si4
    la2 si4 la sold mi
    la,2 la'4 sol fad mi

    %7
    re2 la'1
    lad2 si2. la?4
    sold2 lad1

    %10
    si2 si,4 dod re2\mbreak
    mi fad1
    sol si,2

    %13
    dod red1\mbreak
    mi2. fad4 sol2
    la si1

    %16
    do mi,2
    fa fad1
    sol2 sold1

    %19
    la2 la,4 si do2\mbreak
    re mi1
    fa2. sol4 la2

    %22
    sib sol do
    fa,1 fa2
    sol la1

    %25
    sib re,2
    mi!2 fad!1
    sol sol,2

    %28
    la1 re2\mbreak
    mi la, dod!
    re mi1

    %31
    la sold2
    fad1.
    mi

    %34
    re
    dod\fermopz

}

Vbcn = \relative do {

    fad1 fad2~
    fad mid mi
    re1.

    %4
    mid!1 dod2
    la si sold\mbreak
    la la'4 sol fad mi

    %7
    re2 la1
    lad2 si1
    sold2 lad1

    %10
    si re2
    mi fad1
    sol si,2

    %13
    dod red1\mbreak
    mi sol,2
    la si1

    %16
    do mi2
    fa fad1
    sol2 sold1

    %19
    la do,2
    re mi1
    fa la,2\mbreak

    %22
    sib sol do?
    fa1 fa,?2
    sol la1

    %25
    sib re2
    mi! fad!1
    sol1 sol,2

    %28
    la1 re2\mbreak
    mi la, dod!
    re mi1

    %31
    la sold2
    fad1.
    mi

    %34
    re
    dod\fermata

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.
    <4 2>2 <7- 5> <6 _+>
    <7> <6> s
    <7 _+> <6> <_->
    <6 5> <_+> <5-> \mbreak %% OOKK
    <4>2 <3>1
    s1.
    <6 5->2 <5>1
    <6 5->2 <5-> <6>
    <9> <8> <6>
    <6+ 5> <5-> <6>
    <9> <8> <6>
    <6 5-> <5-> <6>\mbreak  %% OOKK bar 13
    <9 _-> <8> <6>
    <6+ 5> <5-> <6>

    <9> <8> <6>
    <6 5> <6 5-> s
    s <6 5-> s
    <9 _-> <8> <6>
    <6 5> <5-> <6>
    <9> <8> <6>\mbreak %% bar 21
    <6 5> s s
    s1.
    <6- 5>2 <5-> <6>
    <9> <8> <6->
    s <5-> <6>
    <9 _-> <8> <_!>
    <7 _+> <_+> s\mbreak %% OOKK
    <7 _+> <7- _+> <6>
    <5> <_+> s
    <9> <8> <6>
    <7> <6> s
    <7 _+> <6> s
    <7> <6> s

}


forma = {

    \time 3/2
    \tempo 2 = 60
    \key re\major
    s1.*34
    s1.
    \bar "||"

}

VvlI = {
    \Vglobal
    \notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>

}

Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>

}

Vvc = {
    \Vglobal
    \clef bass
    <<\Vvcn \forma>>

}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma\Vbfn>>
    \typeset

}



VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


VIvlIn = \relative do'' {

    mi4 la,8
    fad'16 sol fad mi re8
    dod re16 dod si8

    %4
    la16 si la sol fad8
    mi mi' la
    sold4 la8\mbreak

    %7
    la16 si la sol fad8
    mi4.
    R

    %10
    mi4 la,8
    sold16 la sold fad mi8
    fad sold la

    %13
    si4 dod8
    la'16 si la sol fad8
    mi4 re8\mbreak

    %16
    dod4 red8
    mi16 fad mi fad sold8
    mi16 fad mi re dod8

    %19
    re16 mi re dod si8
    mi16\p fad mi re dod8
    re16 mi re dod si8

    %22
    si4 dod8\mbreak
    si4 si8
    la4 la8

    %25
    sold8. la16 si8
    mi8. fad16 sold8
    fad4 sold8

    %28
    R4.*2
    mi4 la,8
    fad'16 sol fad mi re8

    %32
    dod8 re16 dod si8\mbreak
    red,4 mi8
    mi'16 fad mi re dod8

    %35
    R4.
    la'16 si la sol fad8
    R4.

    %38
    si,4 mi,8
    dod'16 re dod si la8
    sold fad16 sold la8\mbreak

    %41
    la'16 si la sol fad8
    mi4.
    R

    %44
    la,8 si16 la sold8
    la4 mi8
    dod'16 re dod si la8

    %47
    mi'16 fad mi re dod8
    R4.
    fad16 sol fad mi re8~

    %50
    re re dod
    si r mi
    mi16 fad mi re dod8

    %53
    R4.
    fad16 sol fad mi re8~
    re re dod

    %56
    si4 si8
    dod si4
    dod4.\fermata

}


VIvlIIn = \relative do'' {

    R4.*2
    la4 mi8
    dod'16 re dod si la8\mbreak

    %5
    sold8 la16 sold fad8
    mi'16 fad mi re dod8
    re8. mi16 fad sold

    %8
    la8 si16 la sold8
    la4 la,8
    si dod16 si la8

    %11
    si4 dod8\mbreak
    re mi16 re dod8
    sold4 la8

    %14
    r re16 mi fad sol?
    la4 sold8
    la dod16 si la8

    %17
    sold16 la sold fad mi8
    dod16 re dod si la8\mbreak
    si16 dod si la sold8

    %20
    dod16\p re dod si la8
    si16 dod si la sold8
    sold4 la8~

    %23
    la la sold~
    sold sold fad~
    fad fad mi\mbreak

    %26
    dod'8. red16 mi8
    red4 mi8
    si4 mi,8

    %29
    dod'16 re dod si la8
    sold la16 sold fad8
    re'16 mi re dod si8

    %32
    la si16 la sold8\mbreak
    fad4 sold8
    R4.

    %35
    si8 dod16 si la8
    R4.
    mi'8 fad16 mi re8

    %38
    si4 si8
    dod4.
    R4.*2

    %42
    mi4 la,8
    fad'16 sold fad mi re8\mbreak
    dod re16 dod si8

    %45
    la4 si8
    dod4 re8~
    re dod16 si la8

    %48
    R4.
    re16 mi re dod si8
    mi mi,16 fad sold8

    %51
    la la8. sold16\mbreak
    dod16 re dod si la8
    R4.

    %54
    re16 mi re dod si8
    mi mi,16 fad sold8
    la la8. sold16

    %57
    la8 sold4
    la4.\fermopz

}


VIvlan = \relative do' {

    R4.*5
    mi4 la,8\mbreak
    fad'16 sol fad mi re8

    %8
    dod re16 dod si8
    mi16 fad mi re dod8
    mi4 fad8

    %11
    sold4 la8
    re, si mi
    mi4 mi8

    %14
    fad la4
    mi si8
    dod4 fad8\mbreak

    %17
    si,4.
    R4.*4
    sold'16 la sold fad mi8

    %23
    fad16 sold fad mi re8
    mi16 fad mi re dod8
    re16 mi re dod si8

    %26
    la4 si8
    si4 si8
    R4.*7

    %35
    mi4 la,8
    fad'16 sol fad  mi re8
    dod re16 dod si8

    %38
    fad'4 sold8
    la16 si la sol fad8
    mi4 dod8

    %41
    re4.
    la'\mbreak
    la4 si8

    %44
    mi,4.
    mi4 r8
    mi4 fad8

    %47
    si,4 dod8
    dod'16 re dod si la8
    R4.

    %50
    si16 dod si la sold8
    fad mi4
    mi r8\mbreak

    %53
    dod'16 re dod si la8
    R4.
    si16 dod si la sold8

    %56
    fad mi4
    mi8 mi4
    mi4.\fermopz

}


VIvcn = \relative do {

    R4.*7
    la'4 mi8
    dod'16 re dod si la8

    %10
    sold4 fad8
    mi16 fad mi re dod8
    si4 la8

    %13
    mi'4 la,8
    fad'16 sol fad mi re8\mbreak
    dod8 re16 dod si8

    %16
    la la'16 sold fad8\mbreak
    mi4.
    R4.*4

    %22
    \clef tenor \key re\major mi'16 fad mi re dod8
    re16 mi re dod si8\mbreak
    dod16 re dod si la8

    %25
    \clef bass \key re\major si16 dod si la sold8
    la4 mi8
    si4 mi8

    %28
    R4.*5
    si'4 mi,8
    dod'16 re dod si la8

    %35
    sold la16 sold fad mi
    re4.
    la'8 la, si16 dod

    %38
    red4 mi8
    R4.\mbreak
    mi4 la,8

    %41
    fad'16 sold fad mi re?8
    dod8 dod'4
    re16 mi re dod si8

    %44
    la4 mi8
    la8 si16 la sold8
    la16 si16 la sold? fad8\mbreak

    %47
    sold4 la8
    la16 si la sol? fad8
    R4.

    %50
    sold16 la sold fad mi8
    re mi mi,
    la4 r8

    %53
    la'16 si la sol? fad8
    R4.\mbreak
    sold16 la sold fad mi8

    %56
    re mi mi,
    la8 mi'4
    la,4.\fermopz

}

VIbcn = \relative do {

    R4.*7
    la'4 mi8
    dod'16 re dod si la8

    %10
    sold4 fad8
    mi8. re16 dod8
    si4 la8

    %13
    mi'4 la,8
    fad'8. mi16 re8
    dod4 si8

    %16
    la la'16 sold fad8\mbreak
    mi4.
    R4.*4

    %22
    mi8. re16 dod8
    re8. dod16 si8
    dod8. si16 la8

    %25
    si8. la16 sold8
    la4 mi'8
    si4 mi8

    %28
    R4.*5
    si'4 mi,8
    dod'16 re dod si la8

    %35
    sold la16 sold fad mi
    re4.
    la8 la si16 dod

    %38
    red4 mi8
    R4.\mbreak
    mi4 la,8

    %41
    fad'16 sold fad mi re?8
    dod4.
    re8. dod16 si8

    %44
    la4 mi'8
    la4 sold8
    la8. sold16 fad8\mbreak

    %47
    sold4 la8
    la16 si la sol? fad8
    R4.

    %50
    sold16 la sold fad mi8
    re mi4
    la, r8

    %53
    la'16 si la sol? fad8
    R4.\mbreak
    sold16 la sold fad mi8

    %56
    re mi4
    la,8 mi'4
    la,4.\fermata

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*7
    s4 <_+>8
    <6>4.
    <6>
    <_+>4 <6>8
    <5> <6+> s
    <_+>4.
    s
    <6>4 <6+>8
    s4 <6+>8
    <_+>4.
    s4.*4
    <_+>4 <6>8
    <6 5>4 <6+>8
    <6 5+> s <6>
    <6 5> s <6>
    s4 <_+>8
    <_+>4 <_+>8
    s4.*5
    <_+>4 <_+>8
    <6>4.
    <6>
    s
    s
    <6>4 <_+>8
    s4.
    <_+>
    <6>
    <6>
    s4 <6+>8
    s4 <_+>8
    s4 <6>8
    s4 <6>8
    <6 5->4.
    s4 <6>8
    s4.
    <6 5->
    <6 5>8 <_+>4
    s4.*3
    <6 5->4.
    <6 5>8 <_+>4
    s8 <_+>4

}


forma = {

    \time 3/8
    \tempo 4. = 65
    \key re\major
    s4.*27
    \bar ":..:"\break
    s4.*31
    \bar ":|."

}

VIvlI = {
    \VIglobal
    \notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    \VIglobal
    <<\VIvlIIn \forma>>

}

VIvla = {
    \VIglobal
    \clef alto
    <<\VIvlan \forma>>

}

VIvc = {
    \VIglobal
    \clef bass
    <<\VIvcn \forma>>

}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma\VIbfn>>
    \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \header {
        title = \markup\smaller{Sinfonia da Chiesa op. 5 n. 11 }
        composer = \markup \center-column{"G. Bononcini (1670 - 1747)"}

    }

    \markup \huge {[1.] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc "
                \Ivc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc "
                \Ibc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[2.] Grave}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc "
                \IIvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc "
                \IIbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] Vivace}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc "
                \IIIvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc "
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##f
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

    \header {
        title = \markup\smaller{Sinfonia da Chiesa op. 5 n. 12 }
        composer = \markup \center-column{"G. Bononcini (1670 - 1747)"}

    }

    \markup \huge {[1.] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc "
                \IVvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc "
                \IVbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[2.] Adagio}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc "
                \Vvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc "
                \Vbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc "
                \VIvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc "
                \VIbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##f
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

