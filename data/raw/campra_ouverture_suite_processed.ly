\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

dolce = _\markup\italic "dol."


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
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

Iobn = \relative do'' {

    r4 r8 la re4 fa
    dod4. dod8 dod4 re8 mi
    la,4. re8 fa4 la

    %4
    sol4. sol8\mbreak sol4 fa8 mi
    fa4 re fa4. mi8
    re4. do?8 do4 sib8 la

    %7
    sib2 si4. si8
    do2 dod4. dod8
    re4mi8[fa mi fa sol mi]\mbreak

    %10
    la4 mi8 fa fa4. mi8
    mi1 mi
    r4 la8 sol la fa

    %13
    sol la sol fa sol mi
    fa4 re sib'~
    sib la4. la8

    %16
    la4 sol4. fa16(sol)\mbreak
    la2 mi4
    dod4. re8 mi4

    %19
    la, re4. re8
    re4 dod4. si16(dod)
    re4. mi8 fa sol

    %22
    mi4 mi la
    re, sol2
    mi4 do do'~\mbreak

    %25
    do sol4. sol8
    la4. sol8 fa mi
    re4 sib'4. sib8

    %28
    sib?4. la16 sol la4~
    la8 sib sol4. fa8
    fa4 do4. do8

    %31
    do2.\mbreak
    re4 re4. do16 re
    mi4 do mi~

    %34
    mi re8 do si la
    sold2.
    r4 si4. si8

    %37
    mi,4 mi'2
    re4 mi8 re do si\mbreak
    do4 la fa'~

    %40
    fa mi4. mi8
    mi4 re4. re8
    re4. do16 si do4~

    %43
    do8 re si4. la8
    la2 mi'8 mi
    fa4 fad~\mbreak fad8 fad

    %46
    sol2 sol8 sol
    la4 la4. la8
    sib4 mi,4. mi8

    %49
    mi4 dod re~
    re8 mi mi4. re16(mi)
    fa4. mi8 fa sol\mbreak

    %52
    mi4 mi4. fa8
    re4 re4. mi8
    dod4. si8 la4

    %55
    sib sib4. do8
    la2 la'4~
    la mi4. mi8

    %58
    fa4 re sib'8 sib\mbreak
    sib2 la8 la
    la4 sol4. sol8

    %61
    sol fa sol mi fa sol
    fa mi mi4. re8
    re2.

}

Ivln = \relative do'' {

    r4 r8 la re4 fa
    dod4. dod8 dod4 re8 mi
    la,4. re8 fa4 la

    %4
    sol4. sol8\mbreak sol4 fa8 mi
    fa4 re fa4. mi8
    re4. do?8 do4 sib8 la

    %7
    sib2 si4. si8
    do2 dod4. dod8
    re4mi8[fa mi fa sol mi]\mbreak

    %10
    la4 mi8 fa fa4. mi8
    mi1 mi
    r4 la8 sol la fa

    %13
    sol la sol fa sol mi
    fa4 re sib'~
    sib la4. la8

    %16
    la4 sol4. fa16(sol)\mbreak
    la2 mi4
    dod4. re8 mi4

    %19
    la, re4. re8
    re4 dod4. si16(dod)
    re4. mi8 fa sol

    %22
    mi4 mi la
    re, sol2
    mi4 do do'~\mbreak

    %25
    do sol4. sol8
    la4. sol8 fa mi
    re4 sib'4. sib8

    %28
    sib?4. la16 sol la4~
    la8 sib sol4. fa8
    fa4 do4. do8

    %31
    do2.\mbreak
    re4 re4. do16 re
    mi4 do mi~

    %34
    mi re8 do si la
    sold2.
    r4 si4. si8

    %37
    mi,4 mi'2
    re4 mi8 re do si\mbreak
    do4 la fa'~

    %40
    fa mi4. mi8
    mi4 re4. re8
    re4. do16 si do4~

    %43
    do8 re si4. la8
    la2 mi'8 mi
    fa4 fad~\mbreak fad8 fad

    %46
    sol2 sol8 sol
    la4 la4. la8
    sib4 mi,4. mi8

    %49
    mi4 dod re~
    re8 mi mi4. re16(mi)
    fa4. mi8 fa sol\mbreak

    %52
    mi4 mi4. fa8
    re4 re4. mi8
    dod4. si8 la4

    %55
    sib sib4. do8
    la2 la'4~
    la mi4. mi8

    %58
    fa4 re sib'8 sib\mbreak
    sib2 la8 la
    la4 sol4. sol8

    %61
    sol fa sol mi fa sol
    fa mi mi4. re8
    re2.

}

IvlaIn = \relative do'' {

    r4 r8 fa, la4 fa
    mi4. mi8 mi4 re8 dod
    re4. la'8 la4 fa

    %4
    sol2\mbreak la4. la8
    la2 la4. la8
    sib2 la4. la8

    %7
    sol2 sol4. sol8
    la2 mi4. mi8
    la,4 la'2 la4

    %10
    mi la2 la4
    la1 la
    R2.*2

    %14
    r4 re8 do re sib
    do re do sib do la
    sib4 sib4. la8\mbreak

    %17
    la2 la4
    la4. la8 sol4
    fa la8 sol la fa

    %20
    sol la sol fa sol mi
    fa4 sib2~
    sib4 la2~

    %23
    la4 sol4. sol8\mbreak
    sol4 mi la
    sol8 la sol fa sol mi

    %26
    fa sol la sib do la
    re mi re do sib la
    sol4 do2~

    %29
    do4 do4. do8\mbreak
    la4 la8 sol la fa
    sol la sol fa sol mi

    %32
    fa4 fa4. mi8
    mi4 la4. sol8
    fa4~fa8 mi re fa

    %35
    mi4 sold4. la8\mbreak
    si4 sold4. sold8
    la si do4. do8

    %38
    si la sold4. sold8
    la4 do8 si do la
    si do si la si sol

    %41
    la si la sold la si\mbreak
    sold2 la4~
    la sold4. la8

    %44
    la4 la8 sol? la mi
    fa re la'4. la8
    sol4. sol8 do sib

    %47
    la4 re4. do8
    sib4 sib8 la sol fa\mbreak
    mi4 la fa

    %50
    re dod4. dod8
    re4 fa re
    mi mi la

    %53
    fa re sol
    mi la2~
    la4 re, sol~

    %56
    sol do, fa\mbreak
    mi8 re dod re mi dod
    re4 re'4. re8

    %59
    sol,4 do4. do8
    fa,4 sib4. sib8
    la2.

    %62
    sib4 la4. la8
    la2.

}

IvlaIIn = \relative do' {

    r4 r8 fa fa4 re
    sol2 sol4. sol8
    fa2 re~

    %4
    re dod4. dod8\mbreak
    re2 re4. mi8
    fa2 re4. re8

    %7
    re4 sol mi4. mi8
    mi4 la, la'4. sol8
    fa4 dod8 re mi4. re8\mbreak

    %10
    dod4. re8 re4. dod8
    dod?1 dod
    R2.*5

    %17
    r4 la'8 sol la fa
    sol la sol fa sol mi
    fa2.

    %20
    mi\mbreak
    re4 fa4. re8
    mi fa mi re mi do

    %23
    re mi re do re sib
    do2 r4
    do do4. do8

    %26
    do4 fa4. fa8
    fa4 sol4. sol8\mbreak
    mi2 fa4~

    %29
    fa mi4. fa8
    fa4 fa4. fa8
    do2 r4

    %32
    r re8 do re si
    do re do si do la
    re do re mi\mbreak fa re

    %35
    mi2 r4
    R2.
    r4 mi8 re mi do

    %38
    re4 si4. si8
    la4 la' fa
    re sol mi

    %41
    do fa re
    si mi\mbreak do
    la mi'8 re mi si

    %44
    do4 dod4. dod8
    re4 re4. do?8
    sib4 do8 sib la sol

    %47
    fad4 fad'4. fad8\mbreak
    sol4 dod,8 re mi re
    dod4 la la'~

    %50
    la la4. la8
    la4 sib2~
    sib4 la2~

    %53
    la4 sol4. sol8\mbreak
    sol4 mi fa
    re re mi

    %56
    do fa re
    mi8 la, la'4. la8
    la4 fa8 mi fa re

    %59
    mi fa mi re mi do\mbreak
    re mi re dod re mi
    dod4. dod8 re mi

    %62
    re4 re4 dod
    re2.

}

Ifgn = \relative do {

    re2. re4
    mi2. mi4
    fa2~fa8 fa mi re

    %4
    mi4. mi8 la4 la,
    re2\mbreak re'4. do8
    sib2 fad4. fad8

    %7
    sol2~sol8 fa? sol mi
    la2~la8 sol fa mi
    fa fa mi re dod2~

    %10
    dod4 la re re,\mbreak
    la'2 la'8 sol fa mi la,1
    R2.*9
    r4 re'8 do re sib
    do re do sib do la

    %23
    sib do sib la sib sol
    do4 sib8 la sol fa
    mi fa mi re mi do

    %26
    fa4 fa la,
    sib8 do sib la sib sol
    do2 fa,4~

    %29
    fa do2
    fa fa'4\mbreak
    mi2.

    %32
    re
    do4 r r
    R2.
    r4 mi'8 re mi do
    re mi re do re si
    do re do si do la\mbreak

    %38
    sold fad mi fad sold mi
    la4 la8 sol? la fa?
    sol la sol fa sol mi

    %41
    fa sol fa mi fa re
    mi2 la,4~
    la mi2\mbreak

    %44
    la4 la' la
    re re8 do re la
    sib2 r4

    %47
    r re, re
    sol sol8 fa sol mi
    la2 re,4~

    %50
    re la2\mbreak
    re4 re'8 do re sib
    do re do sib do la

    %53
    sib do sib la sib sol
    la4 la8 sol la fa
    sol la sol fa sol mi\mbreak

    %56
    fa sol fa mi fa re
    dod si la si dod la
    re4 re8 do re sib

    %59
    do re do sib do la
    sib do sib la sib sol\mbreak
    la2 fa4

    %62
    sol la2
    re,2.

}

Ibcn = \relative do {

    re2. re4
    mi2. mi4
    fa2~fa8 fa mi re

    %4
    mi4. mi8 la4 la,
    re2\mbreak re'4. do8
    sib2 fad4. fad8

    %7
    sol2~sol8 fa? sol mi
    la2~la8 sol fa mi
    fa fa mi re dod2~

    %10
    dod4 la re re,\mbreak
    la'2 la'8 sol fa mi la,1
    \clef violin R2.*2

    %14
    r4 re''8 do re sib?
    do re do sib do la
    sib4 sib4. la8

    %17
    la4\mbreak la8 sol la fa
    sol la sol fa sol mi
    fa2.

    %20
    mi
    re4 \clef bass re8 do re sib
    do  re do sib do la

    %23
    sib do sib la sib sol
    do4 sib8 la sol fa
    mi fa mi re mi do

    %26
    fa4 fa la,
    sib8 do sib la sib sol
    do2 fa,4~

    %29
    fa do2
    fa fa'4\mbreak
    mi2.

    %32
    re
    do4 \clef violin do'8 si do la
    re do re mi fa re

    %35
    mi4 \clef bass mi8 re mi do
    re mi re do re si
    do re do si do la\mbreak

    %38
    sold fad mi fad sold mi
    la4 la8 sol? la fa?
    sol la sol fa sol mi

    %41
    fa sol fa mi fa re
    mi2 la,4~
    la mi2\mbreak

    %44
    la4 la' la
    re re8 do re la
    sib2 r4

    %47
    r re, re
    sol sol8 fa sol mi
    la2 re,4~

    %50
    re la2\mbreak
    re4 re'8 do re sib
    do re do sib do la

    %53
    sib do sib la sib sol
    la4 la8 sol la fa
    sol la sol fa sol mi\mbreak

    %56
    fa sol fa mi fa re
    dod si la si dod la
    re4 re8 do re sib

    %59
    do re do sib do la
    sib do sib la sib sol\mbreak
    la2 fa4

    %62
    sol la2
    re,2.

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6\\>
    <6>
    <7>2 <7>
    s1
    s2 <6 5>
    <_-> <_!>
    s <3+>
    <6>1
    s1*3
    s2.*2
    s4 s <6>8 <_->
    <7->4 <6> s
    <7> <6> s
    <_+> <_+> <6>
    <4+ 2>2 s8 <6\\>
    <3>4 <6>2
    <7>4 <6\\>2
    s2.*10
    <6>2.
    <7>4 <6>2
    s4 <6>2
    <9>4 <8> <6 4>
    <_+> <_+> s8 <6>
    <6>4 <4+ 2> s8 <6\\>
    <6>2.
    s
    s4 s8 <6> s4
    <7>4 <6> s
    <7>4 <6> s
    <_+>2.
    s4 <_+>2
    <_!>4 <_+>2
    <_->4 <_+> s
    <6>2.
    s4 <_+> s
    <_-> <_->2
    <_+>2.
    s4 <_+>2
    s4 <6-> s8 <6>
    <7->4 <6> s
    <7> <6> s
    <_+>2 <6>4
    <9 _-> <8> <6>
    <9> <8> s
    s2.
    <_->4 <6-> s8 <6>
    <7->4 <6> s8 <6>
    <7>4 <6->8 <7 _+> s <_!>
    <7 _+>2 <6>4
    <7 5> <4> <_+>

}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 60
    \repeat volta 2{s1*10}
    \alternative {{s1}{s}}
    \bar "||"\break
    \set Score.currentBarNumber = #12
    \time 3/4
    \tempo 2. = 65
    s2.*52
    \bar"|."

}


Iob = {
    \Iglobal
    <<\Iobn \forma>>

}

Ivl = {
    \Iglobal
    <<\Ivln \forma>>

}

IvlaI = {
    \Iglobal
    <<\IvlaIn \forma>>

}

IvlaII = {
    \Iglobal
    <<\IvlaIIn \forma>>

}

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIobn = \relative do'' {

    re4 la' mi
    sol fa mi
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4

    %4
    re mi fa
    \afterGrace dod2 ({re8)} \afterGrace re4 ({dod16 [re)]}
    mi2.

    %7
    re4\p la' mi\mbreak
    sol fa mi
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4

    %10
    la'4\f sol fa
    mi dod2
    re2.

    %13
    fa4 sol la
    sol la sib
    la2 \appoggiatura sol8 fa4

    %16
    do' sib la\mbreak
    sol la \appoggiatura sol8 fa4
    mi2 \appoggiatura re8 do4
    do' sib la

    %22
    sol la \appoggiatura sol8 fa4~
    fa8 sol sol4. fa8
    fa2.

    %25
    la4 sol fa
    mi fa \appoggiatura mi8 re4
    dod2 la4\mbreak

    %28
    re\p mi fa
    mi fa sol
    fa2 mi4

    %31
    re la'\f mi
    sol fa mi
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4

    %34
    re mi fa
    \afterGrace dod2 ({re8)} \afterGrace re4 ({dod16 [re)]}
    mi2.

    %37
    re4 la'\p mi\mbreak
    sol fa mi
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4

    %40
    la'4\f sol fa
    mi dod2
    re2.

}

IIvln = \relative do'' {

    re4 la' mi
    sol fa mi
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4

    %4
    re mi fa
    \afterGrace dod2 ({re8)} \afterGrace re4 ({dod16 [re)]}
    mi2.

    %7
    re4\p la' mi\mbreak
    sol fa mi
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4

    %10
    la'4\f sol fa
    mi dod2
    re2.

    %13
    fa4 sol la
    sol la sib
    la2 \appoggiatura sol8 fa4

    %16
    do' sib la
    sol la \appoggiatura sol8 fa4
    mi2 \appoggiatura re8 do4
    do' sib la

    %20
    sol la \appoggiatura sol8 fa4~
    fa8 sol sol4. fa8
    fa2.

    %23
    la4 sol fa
    mi fa \appoggiatura mi8 re4
    dod2 la4\mbreak

    %26
    re\p mi fa
    mi fa sol
    fa2 mi4

    %29
    re la'\f mi
    sol fa mi
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4

    %32
    re mi fa
    \afterGrace dod2 ({re8)} \afterGrace re4 ({dod16 [re)]}
    mi2.

    %35
    re4 la'\p mi\mbreak
    sol fa mi
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4

    %38
    la'4\f sol fa
    mi dod2
    re2.

}

IIvlaIn = \relative do'' {

    la2 la4
    sib la4. la8
    la2.

    %4
    sib2 sib4
    mi, la2
    la2.

    %7
    la4\p fa dod
    mi re dod\mbreak
    re2 r4

    %10
    re'\f dod re
    sib la2
    la2.

    %13
    la4 sol fa
    do'2 do4
    do si la

    %16
    la si do
    do2 sib4\mbreak
    do2.

    %19
    la4 si do
    do, do'2
    re4 do4. do8

    %22
    do4 si la
    fa' dod re
    la2 sol4

    %25
    la2.
    la4\p sol fa\mbreak
    sib la sol

    %28
    la si? dod
    re la2\f
    sib4 la4. la8

    %31
    la2.
    sib2 sib4
    mi, la2

    %34
    la2.
    la4 fa\p dod
    mi re dod

    %37
    re2 r4
    re'\f dod re
    sib la2

    %40
    la2.

}

IIvlaIIn = \relative do' {

    fa2 dod4
    mi re dod
    re2 la4

    %4
    re2 re4
    la' mi fa
    dod2.

    %7
    la'2 \p la4\mbreak
    sib la4. la8
    la4 sol fa

    %10
    fa\f sol la
    sol mi2
    re2.

    %13
    re'4 do2
    mi,4 fa sol
    fa2 do4\mbreak

    %16
    do' mi, fa
    sol fa2
    sol la4

    %19
    la mi fa
    sol fa2~
    fa4 mi4. fa8

    %22
    fa2.
    fa4 sol la
    mi re2\mbreak

    %25
    mi4. re16 mi fa4
    re\p  dod re
    re2 dod4

    %28
    re2 mi4
    fa2\f dod4
    mi re dod

    %31
    re2 la4
    re2.
    la'4 mi fa\mbreak

    %34
    dod2.
    la'2\p la4
    sib la2

    %37
    la4 sol fa
    fa\f sol la
    sol mi2

    %40
    \parenthesize re2.

}

IIfgn = \relative do {

    re'4 re, la'
    sol la la,
    re mi fa

    %4
    sib la sol
    la2 re,4
    la la' sol

    %7
    fa\p re la'\mbreak
    sol la la,
    re mi fa

    %10
    fa,\f mi re
    la'2 la,4
    re2.

    %13
    re'4 mi fa
    mi re do
    fa, sol la\mbreak

    %16
    la' sol fa
    mi fa re
    do' sib la

    %19
    la, sol fa
    mi fa la
    sib do sib

    %22
    la sol fa
    fa' mi re
    dod re sib\mbreak

    %25
    la' sol fa
    fa,\p mi re
    sol' fa mi

    %28
    re re, la'
    re' re,\f la'
    sol la la,

    %31
    re mi fa
    sib la sol
    la2 re,4\mbreak

    %34
    la la' sol
    fa re\p la'
    sol la la,

    %37
    re mi fa
    fa,\f mi re
    la'2 la,4

    %40
    re2.

}

IIbcn = \relative do {

    re'4 re, la'
    sol la la,
    re mi fa

    %4
    sib la sol
    la2 re,4
    la la' sol

    %7
    fa\p re la'\mbreak
    sol la la,
    re mi fa

    %10
    fa,\f mi re
    la'2 la,4
    re2.

    %13
    re'4 mi fa
    mi re do
    fa, sol la\mbreak

    %16
    la' sol fa
    mi fa re
    do' sib la

    %19
    la, sol fa
    mi fa la
    sib do sib

    %22
    la sol fa
    fa' mi re
    dod re sib\mbreak

    %25
    la' sol fa
    fa,\p mi re
    sol' fa mi

    %28
    re re, la'
    re' re,\f la'
    sol la la,

    %31
    re mi fa
    sib la sol
    la2 re,4\mbreak

    %34
    la la' sol
    fa re\p la'
    sol la la,

    %37
    re mi fa
    fa,\f mi re
    la'2 la,4

    %40
    re2.

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*26
    <6 5>4 s <6\\>

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 55
    s2.*12
    \bar ":..:"\break
    s2.*28
    \bar":|."

}


IIob = {
    \IIglobal
    <<\IIobn \forma>>

}

IIvl = {
    \IIglobal
    <<\IIvln \forma>>

}


IIvlaI = {
    \IIglobal
    <<\IIvlaIn \forma>>

}


IIvlaII = {
    \IIglobal
    <<\IIvlaIIn \forma>>

}

IIfg = {
    \IIglobal
    \clef bass
    <<\IIfgn \forma>>

}


IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IIIobn = \relative do'' {

    fad4. la8 re,4. la8
    si4 r16 re mi fad sol4.  sol8
    sol4. fad8 fad4. mi8

    %4
    mi2 r8 la mi la\mbreak
    fad4. fad8 si4. la8
    sold4 mi8. mi16 mi2~

    %7
    mi8 mi \tuplet 3/4 { mi16 [re dod] } re8. re16 \tuplet 3/4 { re16[dod si] }
    dod4. si8 si4. la8
    la1 la

    %10
    mi'2~mi8. red16 mi8. fad16
    sol4. sol8 la4 si
    mi,4. fad8 fad4. mi8

    %13
    red8. si16 si'8.[si16] si2~
    si8 la sol fad la4. la8\mbreak
    la4 sol8 fad fad4. mi8

    %16
    mi4 si8. si16 mi8. si16 dod8.[re16]
    dod4 la8. la16 re8. dod16 re8. mi16
    fad8. mi16 fad8. sol16 la2~

    %19
    la8. la16 mi8. fad16\mbreak sol2~
    sol8 sol fad mi fad2~
    fad4 sol8[fad mi re dod si]

    %22
    dod4 la la'4. si8
    mi,4 fad mi4. re8
    re8. mi16 fad8. sol16 la2~

    %25
    la8. la16 mi8. fad16 sol2~
    sol8 sol fad mi fad2~
    fad4 sol8[fad mi re dod si]

    %28
    dod4 la la'4. si8
    mi,4 fad mi4. re8
    re1\fermopz

}

IIIvln = \relative do'' {

    fad4. la8 re,4. la8
    si4 r16 re mi fad sol4.  sol8
    sol4. fad8 fad4. mi8

    %4
    mi2 r8 la mi la\mbreak
    fad4. fad8 si4. la8
    sold4 mi8. mi16 mi2~

    %7
    mi8 mi \tuplet 3/4 { mi16 [re dod] } re8. re16 \tuplet 3/4 { re16[dod si] }
    dod4. si8 si4. la8
    la1 la

    %10
    mi'2~mi8. red16 mi8. fad16
    sol4. sol8 la4 si
    mi,4. fad8 fad4. mi8

    %13
    red8. si16 si'8.[si16] si2~
    si8 la sol fad la4. la8\mbreak
    la4 sol8 fad fad4. mi8

    %16
    mi4 si8. si16 mi8. si16 dod8.[re16]
    dod4 la8. la16 re8. dod16 re8. mi16
    fad8. mi16 fad8. sol16 la2~

    %19
    la8. la16 mi8. fad16\mbreak sol2~
    sol8 sol fad mi fad2~
    fad4 sol8[fad mi re dod si]

    %22
    dod4 la la'4. si8
    mi,4 fad mi4. re8
    re8. mi16 fad8. sol16 la2~

    %25
    la8. la16 mi8. fad16 sol2~
    sol8 sol fad mi fad2~
    fad4 sol8[fad mi re dod si]

    %28
    dod4 la la'4. si8
    mi,4 fad mi4. re8
    re1\fermopz

}

IIIvlaIn = \relative do'' {

    la2 la4. la8
    sol4 si~si16 si dod re mi4~
    mi dod re la8 si

    %4
    dod4 dod8 re mi2\mbreak
    r4 la, re4. dod8
    si2 r8 sold sold fad16 mi

    %7
    la4~la8. la16 si4~si8. si16
    si4 la2 sold4
    la1 la

    %10
    la2\mbreak la4. la8
    si2 si~
    si4 la8 sol la4. sol8

    %13
    fad4 red'8. red16 mi4 si
    do2. do4
    si2 si4. si8\mbreak

    %16
    si2 r4 sold8. sold16
    la4 mi8. mi16 la4 re8. dod16
    re2~re8 re do re

    %19
    mi2 re4. re8
    dod?2 re4. dod8\mbreak
    si2 si4. si8

    %22
    la2 la4 sol~
    sol fad8 sol la4. la8
    la2 la8. si16 do8 re

    %25
    mi2 re4. re8
    dod?2\mbreak re4. dod8
    si2 si4. si8

    %28
    la2 la4 sol~
    sol fad8 sol la4. la8
    fad1\fermata

}

IIIvlaIIn = \relative do' {

    re2 re4 re~
    re16 re mi fad sol4 si,~ si16 si dod re
    mi2 la,4 re

    %4
    la la'8. la16 la2~\mbreak
    la4 fad fad4. fad8
    sold2 r8 si, mi mi

    %7
    dod4~dod8 la mi'4~mi8. mi16
    mi4 fad mi4. mi8
    dod1 dod

    %10
    dod2~\mbreak dod8. si16 dod8. red16
    mi2 fad4 sol~
    sol mi do'2

    %13
    si4 fad8. fad16 sol4. fad8
    mi4 la fad4. fad8
    red4 mi2 red4\mbreak

    %16
    mi2 r4 mi8. mi16
    mi4 dod8. dod16 fad8. mi16 fad8. sol16
    la8. sol16 la8. sol16 fad4 la

    %19
    mi8. fad16 sol8. la16 si4. si8
    mi,4 la2 la4\mbreak
    re,4. re8 sol fad mi re

    %22
    mi4 dod re2
    dod4 re2 dod4
    re re8. mi16 fad8. sol16 la4

    %25
    mi8. fad16 sol8. la16 si4. si8\mbreak
    mi,4 la2 la4
    re,4. re8 sol fad mi re

    %28
    mi4 dod re2
    dod4 re2 dod4
    re1\fermopz

}

IIIfgn = \relative do {

    re4 re' fad, re
    sol r16 la sol fad mi4 r16 fad mi re
    dod4 la re re,

    %4
    la' la'8 si\mbreak dod2
    r8 re la re si2
    mi r8 mi,\noBeam mi re16 dod

    %7
    fad4~fad8. fad16 sold4~sold8. sold16
    la4 re, mi mi,
    la4. la'8\mbreak fad4 la la,1

    %10
    la'4. la8 sol4 fad
    mi2. mi'8. re16
    do2 la

    %13
    si4. la8[sol fad mi re]
    do2~do8 do si la\mbreak
    si4 mi si' si,

    %16
    mi2 r4 mi8. mi16
    la8. si16 la8. sol16 fad8. sol16 fad8. mi16
    re2~re8. re'16 la8. si16

    %19
    do2 si8. si16 la8. sol16
    la2\mbreak re,8. dod?16 si8. la16
    sol2 sol'

    %22
    sol fad4 sol
    la re, la2
    re r8 re' la8. si16

    %25
    do2 si8. si16 la8. sol16
    la2\mbreak re,8. dod?16 si8. la16
    sol2 sol'

    %28
    sol fad4 sol
    la re, la2
    re1\fermopz

}

IIIbcn = \relative do {

    re4 re' fad, re
    sol r16 la sol fad mi4 r16 fad mi re
    dod4 la re re,

    %4
    la' la'8 si\mbreak dod2
    r8 re la re si2
    mi r8 mi,\noBeam mi re16 dod

    %7
    fad4~fad8. fad16 sold4~sold8. sold16
    la4 re, mi mi,
    la4. la'8\mbreak fad4 la la,1

    %10
    la'4. la8 sol4 fad
    mi2. mi'8. re16
    do2 la

    %13
    si4. la8[sol fad mi re]
    do2~do8 do si la\mbreak
    si4 mi si' si,

    %16
    mi2 r4 mi8. mi16
    la8. si16 la8. sol16 fad8. sol16 fad8. mi16
    re2~re8. re'16 la8. si16

    %19
    do2 si8. si16 la8. sol16
    la2\mbreak re,8. dod?16 si8. la16
    sol2 sol'

    %22
    sol fad4 sol
    la re, la2
    re r8 re' la8. si16

    %25
    do2 si8. si16 la8. sol16
    la2\mbreak re,8. dod?16 si8. la16
    sol2 sol'

    %28
    sol fad4 sol
    la re, la2
    re1\fermopz

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    s1*5
    <7>4 <6> <5> <4>
    <9> <7> <4> <3+>
    s2 <6>
    s1
    s2 <4+>4 <6+>
    s1
    <7>4 <6> <6 4>2
    <_+> <6>
    <7> <6>
    <_+> <4>4 <3+>
    s1
    s2 <6>
    s1
    <4+>2 <6>
    <7> s
    <7> <6>
    <4+> <_+>4 <6 5>
    <_+>2 <4+>
    s1
    <4+>2 <6>
    <7>1
    <7>2 <6>
    <4+> <_+>4 <6 5>
    <_+>2 <4+>

}

forma = {

    \time 2/2
    \tempo 2 = 60
    \key re\major
    \repeat volta 2 {s1*8}
    \alternative {{s1}{s}}
    \set Score.currentBarNumber = #10
    \bar ":..:"\break
    s1*21
    \bar":|."

}


IIIob = {
    \IIIglobal
    <<\IIIobn \forma>>

}
IIIvl = {
    \IIIglobal
    <<\IIIvln \forma>>

}


IIIvlaI = {
    \IIIglobal
    <<\IIIvlaIn \forma>>

}


IIIvlaII = {
    \IIIglobal
    <<\IIIvlaIIn \forma>>

}

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IVobIn = \relative do'' {

    la4
    re mi fad
    mi la2
    fad4 sol8 fad mi re

    %4
    dod4 dod la
    re mi fad
    mi la2 \mbreak

    %7
    re,4. mi8 dod4
    re2 fad8^\markup\italic "Trio" sol
    la4 la si

    %10
    la fad8 sol la4
    la sol fad
    mi mi8 fad sol4

    %13
    fad sol8 fad mi re\mbreak
    la2 la4
    re mi fad

    %16
    mi la2
    fad4 sol8 fad mi re
    dod4 dod la\mbreak

    %19
    re mi fad
    mi la2
    re,4. mi8 dod4

    %22
    re2 la4
    re re si
    dod dod re

    %25
    mi fad8 mi re dod
    si4 dod re
    mi fad8 mi re dod

    %28
    si4 la la
    re mi  fad
    mi la2

    %31
    fad4 sol8 fad mi re
    dod4 dod la
    re mi fad

    %34
    mi la2
    re,4. mi8 dod4
    re2

}

IVobIIn = \relative do'' {

    la4
    re mi fad
    mi la2
    fad4 sol8 fad mi re

    %4
    dod4 dod la
    re mi fad
    mi la2 \mbreak

    %7
    re,4. mi8 dod4
    re2 re8 mi
    fad4 fad sol

    %10
    fad re8 mi fad4
    fad mi re
    dod dod8 re mi4

    %13
    la, la\mbreak si
    dod2 la4
    re mi fad

    %16
    mi la2
    fad4 sol8 fad mi re
    dod4 dod la\mbreak

    %19
    re mi fad
    mi la2
    re,4. mi8 dod4

    %22
    re2 fad,4
    si si sold
    la la si

    %25
    dod re8 dod si la
    sold4 la si
    dod re8 dod si la

    %28
    sold4 la la
    re mi fad
    mi la2

    %31
    fad4 sol8 fad mi re
    dod4 dod la
    re mi fad

    %34
    mi la2 \mbreak
    re,4. mi8 dod4
    re2

}

IVvln = \relative do'' {

    la4
    re mi fad
    mi la2
    fad4 sol8 fad mi re

    %4
    dod4 dod la
    re mi fad
    mi la2 \mbreak

    %7
    re,4. mi8 dod4
    re2 r4
    R2.*5

    %14
    r4 r la
    re mi fad
    mi la2

    %17
    fad4 sol8 fad mi re
    dod4 dod la\mbreak
    re mi fad

    %20
    mi la2
    re,4. mi8 dod4
    re2 r4

    %23
    R2.*5
    r4 r la
    re mi  fad

    %30
    mi la2
    fad4 sol8 fad mi re
    dod4 dod la

    %33
    re mi fad
    mi la2
    re,4. mi8 dod4

    %36
    re2

}

IVvlaIn = \relative do'' {

    la4
    si la4. sold8
    la si dod re mi dod
    re4 la4. si8

    %4
    dod4 la la
    la sol fad8 sol\mbreak
    la4 re, re'

    %7
    fad,4. sol8 mi4
    fad2 r4
    R2.*5

    %14
    r4 r mi
    la sol fad8 sol
    la si dod re mi dod

    %17
    re4 la4. si8\mbreak
    dod4 la la
    la sol fad8 sol

    %20
    la4 re, re'
    fad,4. sol8 mi4
    fad2 r4

    %23
    R2.*5
    r4 mi2
    la4 sol fad8 sol

    %30
    la si dod re mi dod
    re4 la4. si8
    dod4 la2

    %33
    la4 sol fad8 sol
    la4 re, re'
    fad,4. sol8 mi4

    %36
    fad2

}

IVvlaIIn = \relative do' {

    fad4
    sol8 fad mi4 re
    dod8 re mi2
    re4 mi fad

    %4
    mi mi dod
    fad dod re
    dod la2\mbreak

    %7
    si4 si la
    la2 r4
    R2.*5

    %14
    r4 r dod
    re dod re
    dod8 re mi2

    %17
    re4 mi fad
    mi mi dod
    fad dod re\mbreak

    %20
    dod  la2
    si4 si la
    la2 r4

    %23
    R2.*5
    r4 dod2
    re4 dod re

    %30
    dod8 re mi2
    re4 mi fad
    mi mi dod\mbreak

    %33
    fad dod re
    dod la2
    si4 si la

    %36
    la2

}

IVfgn = \relative do {

    re'4
    si dod re
    la la8 si dod la
    re4 re re,

    %4
    la' la sol
    fad mi re
    la' fad2\mbreak

    %7
    si4 sol la
    re,2 re4^\markup\italic"[Fagotto solo]"
    re' re sol,

    %10
    re2 re'4
    re dod re
    la la dod,

    %13
    re re re,
    la' la'^\markup\italic"[Tutti]" sol\mbreak
    fad mi re

    %16
    la' la8 si dod la
    re4 re re,
    la' la sol

    %19
    fad mi re
    la' fad2
    si4 sol la

    %22
    re, re dod^\markup\italic"[Fagotto solo]"
    si si mi
    la,2 r4

    %25
    r dod re
    mi2 r4
    r dod re

    %28
    mi la sol^\markup\italic"[Tutti]"
    fad mi re
    la' la8 si dod la\mbreak

    %31
    re4 re re,
    la' la sol
    fad mi re

    %34
    la' fad2
    si4 sol la
    re,2

}

IVbcn = \relative do {

    re'4
    si dod re
    la la8 si dod la
    re4 re re,

    %4
    la' la sol
    fad mi re
    la' fad2\mbreak

    %7
    si4 sol la
    re,2 r4
    re' re sol,

    %10
    re2 re'4
    re dod re
    la la dod,

    %13
    re re re,
    la' la' sol\mbreak
    fad mi re

    %16
    la' la8 si dod la
    re4 re re,
    la' la sol

    %19
    fad mi re
    la' fad2
    si4 sol la

    %22
    re, re dod
    si si mi
    la,2 r4

    %25
    r dod re
    mi2 r4
    r dod re

    %28
    mi la sol
    fad mi re
    la' la8 si dod la\mbreak

    %31
    re4 re re,
    la' la sol
    fad mi re

    %34
    la' fad2
    si4 sol la
    re,2

}

IVbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    <6> <6 5> s
    s2.*3
    <6>4 <6> s
    s <6>2
    s2.*4
    s4 <5-> s
    s s <5->
    s2.
    s
    <6>4 <6> s
    s2 <6>4
    s2.
    s2 <4+>4
    <6> <6> s
    s <6>2
    s2.
    s
    s2 <_+>4
    s2.
    s4 <6> <6 5>
    <_+>2.
    s4 <6> <6 5>
    <_+>2.
    <6>4 <6> s
    s2.*3
    <6>4 <6> s
    s <6>

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key re\major
    \tempo 2. = 55
    \partial 4 s4
    s2.*7
    s2
    \bar ":..:"\break
    s4
    s2.*27
    s2
    \bar":|."

}


IVobI = {
    \IVglobal
    <<\IVobIn \forma>>

}

IVobII = {
    \IVglobal
    <<\IVobIIn \forma>>

}

IVvl = {
    \IVglobal
    <<\IVvln \forma>>

}


IVvlaI = {
    \IVglobal
    <<\IVvlaIn \forma>>

}


IVvlaII = {
    \IVglobal
    <<\IVvlaIIn \forma>>

}

IVfg = {
    \IVglobal
    \clef bass
    <<\IVfgn \forma>>

}


IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}


Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

Vobn = \relative do'' {

    fa4 re4. la'8
    la4. sol8(fa mi)
    re dod re4. mi8

    %4
    dod4. si8 la4
    mi' mi4. mi8\mbreak
    fa4. fa8 sol4

    %7
    la mi4. fa8
    fa4. mi8 re4
    la la fa

    %10
    do'4. re8 mib4
    re mi? fa
    mi4. re8 do4

    %13
    do' sol la\mbreak
    mi4. fa8 sol4
    la la4. sol8

    %16
    sol2 fa4
    la2 r4
    mi2 r4

    %19
    dod8. si16 la4. fa'8
    mi2 re4
    la'2 r4

    %22
    mi2 r4
    dod8. si16 la4. fa'8
    mi2 re4

}

Vvln = \relative do'' {

    fa4 re4. la'8
    la4. sol8(fa mi)
    re dod re4. mi8

    %4
    dod4. si8 la4
    mi' mi4. mi8\mbreak
    fa4. fa8 sol4

    %7
    la mi4. fa8
    fa4. mi8 re4
    la la fa

    %10
    do'4. re8 mib4
    re mi? fa
    mi4. re8 do4

    %13
    do' sol la\mbreak
    mi4. fa8 sol4
    la la4. sol8

    %16
    sol2 fa4
    la2 r4
    mi2 r4

    %19
    dod8. si16 la4. fa'8
    mi2 re4
    la'2 r4

    %22
    mi2 r4
    dod8. si16 la4. fa'8
    mi2 re4

}

VvlaIn = \relative do'' {

    la4 la4. la8
    la4 mi fa8 sol
    la4 fa sib

    %4
    la mi2
    dod4 la'4. la8
    la4. la8 sol4\mbreak

    %7
    fa8 sol la4. la8
    la4. sol8 fa4
    fa fa fa

    %10
    fa2.
    fa4 sol la
    sol4. fa8 mi4

    %13
    sol do sib8 la
    sol4 do, do'
    la re2

    %16
    do4. sib8 la4
    la sol la
    sib4. la8 sol fa

    %19
    mi4 fa4. sol8
    la2 la4
    la sol la

    %22
    sib4. la8 sol fa
    mi4 fa4. sol8
    la2 la4

}

VvlaIIn = \relative do' {

    re4 fa2
    mi4 la4. sol8
    fa mi re4 sol

    %4
    mi4. re8 dod4
    la' dod,4. dod8\mbreak
    re4. re8 mi4

    %7
    fa dod4. re8
    re2 la4
    re la re

    %10
    do4. sib8 la4
    sib sib do
    do2.

    %13
    do2 do4\mbreak
    do sol'2
    fa4 fa4. mi8

    %16
    mi2 fa4
    fa sol fa
    mi2 r4

    %19
    la, re2
    re4 dod re
    fa sol fa

    %22
    mi2 r4
    la, re2
    re4 dod re

}

Vfgn = \relative do {

    re'2.
    dod2 re4
    la sib sol

    %4
    la2.
    sol\mbreak
    fa4. fa8 mi4

    %7
    re la' la,
    re2.
    re4 fa re

    %10
    la'4. sol8 fa4
    sib sol fa\mbreak
    do'2 do4

    %13
    mi,2 fa4
    do4. re8 mi4
    fa sib,2

    %16
    do fa,4
    fa' mi fa
    sol fa sol

    %19
    la fa re
    la2 re4
    fa mi fa

    %22
    sol fa sol
    la fa re
    la2 re4

}

Vbcn = \relative do {

    re'2.
    dod2 re4
    la sib sol

    %4
    la2.
    sol\mbreak
    fa4. fa8 mi4

    %7
    re la' la,
    re2.
    re4 fa re

    %10
    la'4. sol8 fa4
    sib sol fa\mbreak
    do'2 do4

    %13
    mi,2 fa4
    do4. re8 mi4
    fa sib,2

    %16
    do fa,4
    fa' mi fa
    sol fa sol

    %19
    la fa re
    la2 re4
    fa mi fa

    %22
    sol fa sol
    la fa re
    la2 re4

}

Vbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}


forma = {

    \key do\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 47
    s2.*8
    \bar ":..:"\break
    s2.*16
    \bar":|."

}


Vob = {
    \Vglobal
    <<\Vobn \forma>>

}

Vvl = {
    \Vglobal
    <<\Vvln \forma>>

}


VvlaI = {
    \Vglobal
    <<\VvlaIn \forma>>

}


VvlaII = {
    \Vglobal
    <<\VvlaIIn \forma>>

}

Vfg = {
    \Vglobal
    \clef bass
    <<\Vfgn \forma>>

}


Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}


VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

VIobn = \relative do'' {

    la4 la
    re mi8 fa mi4 \appoggiatura re8 dod4
    re4. dod8 re4 mi
    fa sol la sol8 fa

    %4
    mi4 \appoggiatura re8 dod4 re mi
    fa sol la sol8 fa
    mi2 mi la4 mi

    %7
    fa re sol4. fa8
    mi4 do fa do
    re \appoggiatura do8 sib4 \appoggiatura la8 sol4 do

    %10
    la \appoggiatura sol8 fa4\mbreak la si
    dod re mi fa
    dod re mi fa

    %13
    dod re mi dod
    re2 re

}

VIvln = \relative do'' {

    la4 la
    re mi8 fa mi4 \appoggiatura re8 dod4
    re4. dod8 re4 mi
    fa sol la sol8 fa

    %4
    mi4 \appoggiatura re8 dod4 re mi
    fa sol la sol8 fa
    mi2 mi la4 mi

    %7
    fa re sol4. fa8
    mi4 do fa do
    re \appoggiatura do8 sib4 \appoggiatura la8 sol4 do

    %10
    la \appoggiatura sol8 fa4\mbreak la si
    dod re mi fa
    dod re mi fa

    %13
    dod re mi dod
    re2 re

}

VIvlaIn = \relative do'' {

    la4 la
    la2 la4 mi
    fa4. mi8 fa4 sol
    la sol fa mi8 re

    %4
    dod4 mi la sol\mbreak
    fa dod re re
    la'2 la la4 la

    %7
    la si8 do re4 si
    do2 do
    fa,4 sol mi4. mi8

    %10
    fa2 fa\mbreak
    mi4 re la' la
    la2 sol4 fa

    %13
    mi la sol mi
    fa2 fa

}

VIvlaIIn = \relative do' {

    fa4 fa
    fa mi8 re dod4 mi
    la,2 la'4 sol
    fa mi re2

    %4
    la' re,4 dod\mbreak
    re sol fa mi8 re
    dod2 dod mi4 dod!

    %7
    re fa8 mi re4 sol
    la mi la2
    \parenthesize sib4 sib, do4. do8\mbreak

    %10
    do4 la do re
    mi si? mi re
    mi fa dod re

    %13
    mi re sib' la
    la2 la

}

VIfgn = \relative do {

    re'2
    re,4 re la'4. sol8
    fa4. sol8 fa4 mi
    re mi fa sol\mbreak

    %4
    la la,8 sol fa4 mi
    re mi fa sol
    la2  la4 la'8 si do4 la

    %7
    re re8 do si4 sol
    do do8 sib\mbreak la4 fa
    sib sol do do,

    %10
    fa2 fa4 re
    la' si dod re
    la fa mi re

    %13
    la fa sol la
    re, re'' re,,2

}

VIbcn = \relative do {

    re'2
    re,4 re la'4. sol8
    fa4. sol8 fa4 mi
    re mi fa sol\mbreak

    %4
    la la,8 sol fa4 mi
    re mi fa sol
    la2  la4 la'8 si do4 la

    %7
    re re8 do si4 sol
    do do8 sib\mbreak la4 fa
    sib sol do do,

    %10
    fa2 fa4 re
    la' si dod re
    la fa mi re

    %13
    la fa sol la
    re, re'' re,,2

}

VIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    s s4. <4+>8
    <6>4. <4+>8 <6>4 <6+>
    s <6+> <6> <6 5 4>
    <_+> s <6> <6+>
    <6> <6+> <6> <6 5 4>
    <_+>1 <6+>2
    s <5->
    s <6>
    s1
    s2 s4 <6>
    <_+> <6> <5-> s
    <_+> <6> <6+>

}


forma = {

    \time 2/2
    \tempo 1 = 55
    \key do\major
    \repeat volta 2 {
        \partial 2 s2
        s1*5
    }
    \alternative {
        {\set Score.measureLength = #(ly:make-moment 2 4)  s2 \break}{
            \set Score.currentBarNumber = #6  \set Score.measureLength = #(ly:make-moment 4 4) s2\bar ".|:" s
        }
    }
    s1*7
    s2 \bar ":|." s
    \bar"|."

}


VIob = {
    \VIglobal
    <<\VIobn \forma>>

}

VIvl = {
    \VIglobal
    <<\VIvln \forma>>

}


VIvlaI = {
    \VIglobal
    <<\VIvlaIn \forma>>

}


VIvlaII = {
    \VIglobal
    <<\VIvlaIIn \forma>>

}

VIfg = {
    \VIglobal
    \clef bass
    <<\VIfgn \forma>>

}


VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}


VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

VIIobn = \relative do'' {

    fad8
    fad mi re
    la re4
    mi16 re mi fad sol la

    %4
    fad8 re fad
    fad mi re
    la re4\mbreak

    %7
    mi16 re mi fad sol la
    fad4 la8
    la re, la'

    %10
    la fad16 sol la si
    la8 re, la'
    la4 la,8

    %13
    re mi fad
    sol mi fad
    re si mi\mbreak

    %16
    dod la re4 si
    dod8 la la'
    sol16[fad] mi8. re16

    %20
    re4 re8
    fa sol16 fa mi fa
    re dod re mi fa sol
    la8 la, re
    dod la re\mbreak
    fa sol16 fa mi fa
    re dod re mi fa sol
    la8 la, re
    dod4 mi8
    fa re sol
    mi do16 re mi do
    fa8 re sol\mbreak
    mi do sol'
    la sib16 la sol la
    fa8 re fa
    la sib16 la sol la
    fa4 la8
    la sib16 la sol fa
    sol4 sol8\mbreak
    sol la16 sol fa mi
    fa4 mi re
    dod8 re16 mi fa re
    mi8 la, dod
    re4

}

VIIvln = \relative do'' {

    fad8
    fad mi re
    la re4
    mi16 re mi fad sol la

    %4
    fad8 re fad
    fad mi re
    la re4\mbreak

    %7
    mi16 re mi fad sol la
    fad4 la8
    la re, la'

    %10
    la fad16 sol la si
    la8 re, la'
    la4 la,8

    %13
    re mi fad
    sol mi fad
    re si mi\mbreak

    %16
    dod la re4 si
    dod8 la la'
    sol16[fad] mi8. re16

    %20
    re4 la8^\markup\italic "[Hautbois solo]"
    la si dod
    re la4

    %23
    la8 sol fa
    mi fa8. sol16
    la8 si dod\mbreak

    %26
    re la4
    la8 sol fa
    mi4 dod'8

    %29
    re si4
    do?8 sol do
    fa,4 sib8
    sol4 mi'8

    %33
    do fa mi\mbreak
    fa do mi
    fa do sib

    %36
    la4 si8
    do do re
    mi4 mi8

    %39
    la, si dod
    re4 la la8 fa\mbreak
    la4 la8

    %43
    sol16 fa mi8.[re16]
    re4

}

VIIvlaIn = \relative do'' {

    la8
    re la fad
    re fad re
    la'4 la8

    %4
    la fad la
    re la fad
    re fad re

    %7
    la'4 la8\mbreak
    la4 re8
    re4 re8

    %10
    re la re
    re la fad
    re4 re8

    %13
    fad sol la
    si dod4
    si sold8\mbreak

    %16
    la4 si mi,
    la4 la8
    si dod8. re16

    %20
    re4 r8
    R4.*7
    r4 r8
    R4.*11
    R2.
    R4.*2
    r4

}

VIIvlaIIn = \relative do' {

    re8
    la'4 la8
    fad re4
    re dod8

    %4
    re4 re8
    la'4 la8
    fad re4\mbreak

    %7
    re dod8
    re4 re8
    fad la16 sol fad mi

    %10
    fad8 re16 mi fad sol
    fad4 la8
    fad4 fad8

    %13
    si4 la8
    sol la4\mbreak
    fad8 mi4

    %16
    mi fad sold
    mi8 fad4
    mi la8

    %20
    fad4 r8
    R4.*7
    r4 r8
    R4.*11
    R2.
    R4.*2
    r4

}

VIIfgn = \relative do {

    re'8
    re dod re
    re, si4
    la la8

    %4
    re4 re8
    re dod re\mbreak
    re' si4

    %7
    la la,8
    re4 re'8
    re4 re,8

    %10
    re4 re'8
    re re, re
    re4 re'8

    %13
    si sol fad\mbreak
    mi la fad
    si sold mi

    %16
    la4 la sold
    la8 fad re
    sol, la4

    %20
    re, re''8
    re re la
    fa4 re8

    %23
    fa fa re
    la' fa re
    re' re la

    %26
    fa4 re8
    fa fa re
    la4 la'8

    %29
    re, sol4
    do, do'8
    la sib sol

    %32
    do4 do8\mbreak
    fa, fa do
    fa4 fa8

    %35
    fa fa do
    fa4 r8
    fa4 r8

    %38
    do'4 r8
    dod4 r8
    re4 do? sib

    %42
    la8 fa re
    sol, la4
    re,

}

VIIbcn = \relative do {

    re'8
    re dod re
    re, si4
    la la8

    %4
    re4 re8
    re dod re\mbreak
    re' si4

    %7
    la la,8
    re4 re'8
    re4 re,8

    %10
    re4 re'8
    re re, re
    re4 re'8

    %13
    si sol fad\mbreak
    mi la fad
    si sold mi

    %16
    la4 la sold
    la8 fad re
    sol, la4

    %20
    re, r8
    R4.*7
    r4 r8
    R4.*11
    R2.
    R4.*2
    r4

}

VIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}


forma = {

    \time 3/8
    \key re\major
    \tempo 4. = 70
    \partial 8 s8
    s4.*7
    s4 \bar ":..:" s8
    s4.*11
    s4
    \bar ":..:"\break \once \override Score.RehearsalMark.extra-offset = #'(+10  . +1)
    \mark\markup\huge "[8.] Sec.[ond] Passepied"\key do\major s8
    s4.*7
    s4  \bar ":..:"  s8
    s4.*15
    s4
    \bar ":|."

}


VIIob = {
    \VIIglobal
    <<\VIIobn \forma>>

}

VIIvl = {
    \VIIglobal
    <<\VIIvln \forma>>

}


VIIvlaI = {
    \VIIglobal
    <<\VIIvlaIn \forma>>

}


VIIvlaII = {
    \VIIglobal
    <<\VIIvlaIIn \forma>>

}

VIIfg = {
    \VIIglobal
    \clef bass
    <<\VIIfgn \forma>>

}


VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##f
    first-page-number = #2

}

\header {
    title = \markup\smaller{"Ouverture-Suite" }
    composer = \markup {"A. Campra (1660 - 1744)"}

}

\markup\huge "[1.] Ouverture"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4 r8 la' re''4^\markup\center-align {"Hautbois"}}
            \clef violin
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \Iob
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4 r8 la' re''4^\markup\center-align {"Violino"}}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \Ivl
        >>

        \new GrandStaff <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4 r8 fa' la'4^\markup\center-align {"Viola Prima"}}
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \IvlaI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4 r8 fa' fa'4^\markup\center-align {"Viola Seconda"}}
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla2"
                \IvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"[Fagotto]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \Ifg
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.shortInstrumentName = "bc"
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override BarLine.hair-thickness = #1.2
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

\markup\huge "[2.] Air"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''4 la'' mi''4^\markup\center-align {"Hautbois"} }
            \clef violin
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \IIob
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''4 la'' mi''^\markup\center-align {"Violino"}}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \IIvl
        >>

        \new GrandStaff <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'2 la'4^\markup\center-align {"Viola Prima"} }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \IIvlaI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'2dod'4 ^\markup\center-align {"Viola Seconda"} }
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla2"
                \IIvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"[Fagotto]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \IIfg
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.shortInstrumentName = "bc"
            \IIbc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override BarLine.hair-thickness = #1.2
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

\markup\huge "[3.] Entrée"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key re\major \time 2/2 fad''4. la''8^\markup\center-align {"Hautbois"} }
            \clef violin
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \IIIob
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key re\major \time 2/2 fad''4. la''8^\markup\center-align {"Violino"}}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \IIIvl
        >>

        \new GrandStaff <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 2/2 la'2 la'4^\markup\center-align {"Viola Prima"} }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \IIIvlaI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key re\major \time 2/2 re'2 re'4 ^\markup\center-align {"Viola Seconda"} }
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla2"
                \IIIvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"[Fagotto]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \IIIfg
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.shortInstrumentName = "bc"
            \IIIbc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override BarLine.hair-thickness = #1.2
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

\markup\huge "[4.] Air"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new GrandStaff <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  la'4 re''^\markup\center-align {"Hautbois Primo"} }
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob1"
                \IVobI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major  \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  la'4 re''^\markup\center-align {"Hautbois Secondo"} }
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob2"
                \IVobII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key re\major  \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  la'4 re''^\markup\center-align {"Violino"}}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \IVvl
        >>

        \new GrandStaff <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major  \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  la'4 si'^\markup\center-align {"Viola Prima"} }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \IVvlaI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key re\major  \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  fad'4 sol'8 [fad'] ^\markup\center-align {"Viola Seconda"} }
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla2"
                \IVvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup {[Fagotto e] Basso}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \IVfg
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.shortInstrumentName = "bc"
            \IVbc
        >>
    >>

    \layout {

        indent = 2.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
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

\markup\huge "[5.] Sarabande"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa''4 re''4.^\markup\center-align {"Hautbois"} }
            \clef violin
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \Vob
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa''4 re''4.^\markup\center-align {"Violino"}}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \Vvl
        >>

        \new GrandStaff <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'4 la'4.^\markup\center-align {"Viola Prima"} }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \VvlaI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'4 fa'2 ^\markup\center-align {"Viola Seconda"} }
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla2"
                \VvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"[Fagotto]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \Vfg
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.shortInstrumentName = "bc"
            \Vbc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override BarLine.hair-thickness = #1.2
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

\markup\huge "[6.] Gavotte"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 4/4 la'4 la'^\markup\center-align {"Hautbois"} }
            \clef violin
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \VIob
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 4/4 la'4 la'^\markup\center-align {"Violino"}}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \VIvl
        >>

        \new GrandStaff <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 4/4 la'4 la'^\markup\center-align {"Viola Prima"} }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \VIvlaI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 4/4 fa'4 fa' ^\markup\center-align {"Viola Seconda"} }
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla2"
                \VIvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"[Fagotto]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \VIfg
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.shortInstrumentName = "bc"
            \VIbc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override BarLine.hair-thickness = #1.2
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

\markup\huge "[7.] Pr.[emier] Passepied"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key re\major \time 3/8\numericTimeSignature fad''8 fad''^\markup\center-align {"Hautbois Primo"} }
            \clef violin
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \VIIob
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key re\major \time 3/8\numericTimeSignature  fad''8 fad''^\markup\center-align {"Violino e Hautbois Sec."}}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \VIIvl
        >>

        \new GrandStaff <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 3/8\numericTimeSignature  la'8 re''^\markup\center-align {"Viola Prima"} }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \VIIvlaI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key re\major \time 3/8\numericTimeSignature  re'8 la'4 ^\markup\center-align {"Viola Seconda"} }
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla2"
                \VIIvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"[Fagotto]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \VIIfg
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.shortInstrumentName = "bc"
            \VIIbc
        >>
    >>

    \layout {

        indent = 3\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
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


