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

    do1 la2
    mi'2. fa4 mi re
    do1 r2

    %4
    r r re
    mi1 mi2
    la1.~

    %7
    la2 sol mi
    fad si1~\mbreak
    si2 la4 sol la2~

    %10
    la sol fad
    sol fad2. fad4
    mi1 r2

    %13
    r r fad
    sol1 sol,2
    re'2. mi4 re do

    %16
    si1 r2\mbreak
    r2 r sol'
    fad1 fad2

    %19
    mi dod la
    si2. si4 dod si
    lad2 si lad

    %22
    si si2. lad4
    re1 re2
    do2. re4 mi2\mbreak

    %25
    re4 do si2. si4
    do2. re4 mi2
    re1 mib2

    %28
    re1 re2
    do la la'~
    la sol  mi

    %31
    fad si1~
    si2 la4 sol la2~
    la sol fad\mbreak

    %34
    sol fad2. fad4
    sold2 la1~
    la2 sold4 fad? sold2

    %37
    la1 r2
    r r mi,
    la1 si2

    %40
    do1 sold2
    la mi'2. re4
    do2 si2. si4\mbreak

    %43
    la1 r2
    r r mi\p
    la1 si2

    %46
    do1 sold2
    la mi'2. re4
    do2 si2. si4

    %49
    la1.\fermopz

}


IvlIIn = \relative do'' {

    la1 r2
    r r si
    do1 do2

    %4
    sol'2. la4 sol fa
    mi1 r2
    r r do

    %7
    si1 si2
    la fad re\mbreak
    mi mi' fad4 mi

    %10
    red2 mi red
    mi mi2. red4
    mi1 mi,2

    %13
    si'2. do4 si la
    sol1 r2
    r r la

    %16
    si1 si2\mbreak
    mi1.~
    mi2 re si

    %19
    dod fad1~
    fad2 mi4 re mi2~
    mi re dod

    %22
    re dod4 si dod2~
    dod si1~
    si2 la1~

    %25
    la2 sold4 fad? sold2\mbreak
    la2. si4 do2~
    do do1~

    %28
    do2 si sol
    la  re2. do4
    si1.

    %31
    la2 fad re
    mi mi' fad4 mi
    red2 mi red

    %34
    mi re!4 do re2~\mbreak
    re do!2. do4
    si2 si2. si4

    %37
    la1 mi2
    la1 si2
    do1 sold2

    %40
    la1 r2
    r r mi
    la la2. sold4

    %43
    la1 mi2\p\mbreak
    la1 si2
    do1 sold2

    %46
    la1 r2
    r r mi
    la la2. sold4

    %49
    la1.\fermata

}


Ivlan = \relative do' {

    mi1 r2
    r r sold
    la1 r2

    %4
    r r si,
    do1 r2
    r r mi

    %7
    mi1 sol2
    la re, fad\mbreak
    mi2. re4 do2

    %10
    si1.
    si2 si1
    si r2

    %13
    r r red
    mi1 r2
    r r fad

    %16
    sol1 r2
    r r si,\mbreak
    si1 re2

    %19
    dod dod dod
    si si' sol
    fad1.

    %22
    fa?2 fad1
    fad mi2
    mi1 mi2

    %25
    si mi1
    mi mi2
    la fad la\mbreak

    %28
    sol sol si
    la2. sol4 fad2
    mi2. fad4 sol2

    %31
    la re, fad
    mi2. re4 do2
    si1 si2

    %34
    si si1
    si2 la la'
    fad? mi1\mbreak

    %37
    mi r2
    R1.*2
    la,2 do re

    %41
    mi1 si2
    do mi1
    mi r2

    %44
    R1.*2
    la,2\p do re
    mi1 si2

    %48
    do mi1
    mi1.\fermata

}

Ivcn = \relative do {

    la'1 r2
    r r mi
    la1 r2

    %4
    r r sol
    do1 r2
    r r la,

    %7
    mi'1.~
    mi2 re si\mbreak
    do do'4 si la2

    %10
    si mi, si
    mi si' si,
    mi1 r2

    %13
    r r si2
    mi1 r2
    r r re

    %16
    sol1 r2
    r2 r mi
    si'1.~

    %19
    si2 la fad\mbreak
    sol2. fad?4 mi2
    fad si fad

    %22
    si fad fad,?
    si si'4 la sold2
    la la,4 si do2

    %25
    re mi mi,
    la la'2. sol4\mbreak
    fad2 re fad

    %28
    sol1.~
    sol2 fad re
    mi1.~

    %31
    mi2 re si
    do do'4 si la2
    si mi,  si

    %34
    mi si' si,\mbreak
    mi la4 sol fa mi
    re2 mi mi,

    %37
    la1 r2
    R1.
    r2 r mi'

    %40
    la1 si2
    do1 sold2
    la mi mi,

    %43
    la1 r2
    R1.\mbreak
    r2 r mi'\p

    %46
    la1 si2
    do1 sold2
    la mi mi,

    %49
    la1.\fermata

}

Ibcn = \relative do {

    la'1 r2
    r r mi
    la1 r2

    %4
    r r sol
    do1 r2
    r r la,

    %7
    mi'1.~
    mi2 re si\mbreak
    do1 la2

    %10
    si mi si
    mi si1
    mi r2

    %13
    r r si
    mi1 r2
    r r re

    %16
    sol1 r2\mbreak
    r r mi
    si'1.~

    %19
    si2 la fad
    sol1 mi2
    fad si, fad'

    %22
    si, fad'1
    si, sold2
    la1 do2

    %25
    re mi1\mbreak
    la,1 la'2
    fad re fad

    %28
    sol1.~
    sol2 fad re
    mi1.~

    %31
    mi2 re si
    do1 la2
    si mi si

    %34
    mi si1\mbreak
    mi2 la,1
    re2 mi1

    %37
    la, r2
    R1.
    r2 r mi'

    %40
    la,1 si2
    do1 sold2
    la mi'1

    %43
    la, r2
    R1.
    r2 r mi'\p\mbreak

    %46
    la,1 si2
    do1 sold2
    la mi'1

    %49
    la,1.\fermopz

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.
    s2 s <_+>
    s1.*4
    <4>2 <3>1
    <2+>2 <6> s
    <7> <6> <6+>
    <_+> <_-> <_+>
    <_-> <4> <3+>
    s1.
    s2 s <_+>
    <_->1.
    s2 s <_+>
    s1.
    s2 s <_->
    <4> <3> s
    <2+> <6+> s
    <7> <6> <6+>
    <7> <_-> s
    s <4> <3+>
    <9> <8> <5->
    <9> <8> <6>
    <5> <_+> s
    s1.
    <6 5->2 s <7- 5->
    <4> <3> s
    <2> <6> s
    <4> <3> s
    <2+> <6> s
    <7> <6> <6+>
    <7 _+> <_-> <_+>
    <_-> <_-> s
    <7 _+> <_-> s
    <6 5> <_+> s
    s1.
    s
    s2 s <_+>
    s1 <6+>2
    <6>1 <6>2
    s <4> <3+>
    s1.*2
    s2 s <_+>
    s1 <6+>2
    <6>1 <6>2
    s <4> <3+>

}


forma = {

    \time 3/2
    \tempo 1 = 50
    \key do\major
    s1.*49
    \bar "||"

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

Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma\Ibfn>>

}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


IIvlIn = \relative do'' {

    r4 la si r8 mi\mbreak
    do la fa'4 mi la~
    la16 la si la sold4 la8 la fa re

    %4
    r mi do la si4 mi~
    mi16 mi fad mi red4 mi8 si' sol mi
    r la fad re\mbreak r si do mi

    %7
    re4 r8 si do mi re4~
    re8 re do la r re si sol
    la4. la8 sold4 la~

    %10
    la16 la si la sold4 la2
    R1\mbreak
    r2 r4 mi'

    %13
    fad r8 si sold mi la4~
    la16 la si la sold4 la8 do la fad
    sol? re' si sol fad4 r8 fad

    %16
    mi si' la4~\mbreak la16 la si la sold4
    la r8 do la fad r si
    sol? mi la4~la16 la si la sol sol la sol

    %19
    fad4. fad8 mi4 mi,
    fad r8 si\mbreak sol mi do'4
    si mi~mi16 mi fad mi red4

    %22
    mi r r2
    r r4 mi,
    fad r8 si sold mi la4~

    %25
    la16 la si la sold4\mbreak do r8 fa
    re si r mi do la r re
    si sol do4~do16 do re do si4

    %28
    r do~do16 do re do si4
    do r r2\mbreak
    r4 la si r8 mi

    %31
    do la fa'4 mi la~
    la16 la si la sold4 la r16 do re do
    si4 r16 si do si la4 r16 la si la\mbreak

    %34
    sol?4 r16 sol la sol fa4 r16 fa sol fa
    mi4 r16 mi fa mi re4 r16 re mi re
    do4 r16 do re do si4 r8 si

    %37
    do4 r16 do' re do\mbreak si4 r16 si do si
    la4 r16 la si la sol4 r16 sol la sol
    fa4 r16 fa sol fa mi4 r16 mi fa mi

    %40
    re4 r16 re mi re do4 r16 do re do\mbreak
    si4 r8 si la4 r\fermopz

}


IIvlIIn = \relative do'' {

    R1
    r2 r4 la
    si r8 mi do la fa'4

    %4
    mi la~ la8 la sol mi
    fad4. fad8 sol sol16 fad mi4~
    mi16 mi fad mi re4~re8 sold, la do

    %7
    si4 r8 si la4. la8
    sold4 la r2\mbreak
    r4 la si r8 do

    %10
    re4 r8 si la mi' re la
    sol mi mi'4~mi16 mi fad mi red4
    mi la~la8 la sol mi

    %13
    r8 la fad re\mbreak r sold mi do
    re4 r8 si do mi fad4~
    fad8 si, mi4~mi8 la, re4~

    %16
    re8 sold, do16 do re do si4 r8 si
    la4 r16 sol' la sol\mbreak fad4 r16 fad sol fad
    mi4 r16 mi fad mi red4 mi~

    %19
    mi16 mi fad mi red4 mi r
    R1*2
    r4 mi~mi16 mi fad mi red4\mbreak

    %23
    mi8 mi la4~la16 la si la sol sol la sol
    fad4 r8 fad mi4 r16 mi fad mi
    re4 si~si16 si do si la4

    %26
    si r16 si do si\mbreak la4 r16 la si la
    sol4 r16 sol la sol fa4 r16 fa sol fa
    mi4 r r2

    %29
    r4 do' re r8 sol
    mi do r fa re si r si\mbreak
    la4 r16 la si la sold4 la8 do

    %32
    re4 r8 si do mi la4~
    la16 la si la sol4~sol16 sol la sol fa4~
    fa16 fa sol fa mi4~\mbreak mi16 mi fa mi re4~

    %35
    re16 re mi re do4~do16 do re do si4~
    si16 si do si la4~la16 la si la sold4
    la la'\p~la16 la si la sol4~\mbreak

    %38
    sol16 sol la sol fa4~fa16 fa sol fa mi4~mi16 mi fa mi re4~
    re16 re mi re do4~
    do16 do re do si4~si16 si do si la4~\mbreak

    %41
    la16 la si la sold4 la r\fermata

}


IIvlan = \relative do' {

    R1*4
    r2 r4 mi
    fad r8 si sold mi la4~

    %7
    la16 la si la sold4 la r
    r la, si r8 mi
    dod la re4~re16 re mi re dod4

    %10
    si r8 si\mbreak do?4 re~
    re8 re do si la la'16 sol fad4
    sol16 la sol fad? mi sol fad! mi red4 si8 si'

    %13
    la fad r fad mi2
    r r4 la,\mbreak
    si r8 mi do la r re

    %16
    si4 r8 mi re si r si
    do do' si sol r la fad re
    r sol mi do r fad mi si\mbreak

    %19
    si2 si4 mi~
    mi16 mi fad mi red4 mi la~
    la16 la si la sol sol la sol fad4 si,

    %22
    mi8 si' sol mi r la fad red\mbreak
    r sol mi la red,4 si8 si'
    la fad r fad si, si' la mi

    %25
    si4 re8 mi mi4 r
    r8 re' si sol r do la fa?\mbreak
    r si sol mi r la sol4

    %28
    r8 sol mi do r fa re si
    r sol' mi do fa8. mi16 re4
    do8 mi do la r re si sold

    %31
    do4 r8 re\mbreak mi si sol mi'
    si4 r8 sold' mi do r la'
    fa re r sol? mi do r fa

    %34
    re si r mi do la r re
    si sold r do\mbreak la fad r si
    mi4 r8 la fa4 r8 mi

    %37
    mi4 r8 la\p fa re r sol
    mi do r fa re si r mi
    do la r re\mbreak si sold r do

    %40
    la fad r si mi4 r8 la
    fa?4 r8 mi mi4 r\fermopz

}



IIvcn = \relative do {

    R1*5
    r2 r4 la
    si r8 mi do la fa'4\mbreak

    %8
    mi la~la16 la si la sol4~
    sol16 sol la sol fa fa sol fa mi4 la,
    si r8 mi do la fa'4

    %11
    mi mi fad r8 si
    sol mi do'4\mbreak si \clef tenor mi~
    mi16 mi fad mi re4~re16 re mi re do8 do

    %14
    si4 r8 mi do la r re
    si sol r do la fad r si
    sold mi la4 si r8 mi\mbreak

    %17
    do la mi'4~mi16 mi fad mi re4~
    re16 re mi re do do re do si4 mi,
    si'2 mi,4 r

    %20
    \clef bass R1*2\mbreak
    r4mi fad r8 si
    sol mi do'4 si \clef tenor mi~

    %24
    mi16 mi fad mi re4~re16 re mi re do do re do
    si4 r8 \clef bass mi, la,4 la'~\mbreak
    la16 la si la sol4~sol16 sol la sol fa4~

    %27
    fa16 fa sol fa mi mi fa mi re4 sol8 sol,
    do4 do re r8 sol
    mi do do'4~do16 do re do si4~\mbreak

    %30
    si16 si do si la4~la16 la si la sold4
    la re~re16 re mi re do8 la
    si4 r8 mi do la r fa'

    %33
    re si r mi do la r re\mbreak
    si sol r do la fa r si
    sold mi r la fad re r sold

    %36
    la la, r8 do re si mi mi,	\mbreak
    la4 r8 fa''\p\mbreak re si r mi
    do la r re si sol r do

    %39
    la fa r si sold mi r la
    fad re r8 sold la la, r8 do\mbreak
    re si mi mi, la4 r\fermopz

}

IIbcn = \relative do {

    \clef violin r4 la'' si r8 mi
    do la fa'4 mi la,
    si r8 mi\mbreak do la fa'4

    %4
    mi la, si mi~
    mi red mi \clef alto mi,
    fad r8 si sold mi \clef bass la,,4

    %7
    si r8 mi do la fa'4\mbreak
    mi la2 sol4~
    sol fa mi la,

    %10
    si r8 mi do la fa'4
    mi mi fad r8 si
    sol mi do4 si mi~\mbreak

    %13
    mi re2 do4
    si r8 mi do la r re
    si sol r do la fad r si

    %16
    sold mi la4 si r8 mi\mbreak
    do la mi'2 re4
    re do si mi

    %19
    si2 mi4 \clef alto mi'~
    mi red mi la~
    la sol fad sid,\mbreak

    %22
    mi\clef bass mi, fad r8 si
    sol mi do4 si mi~
    mi re2 do4

    %25
    si r8 mi la,4 la'~
    la sol2 fa4~\mbreak
    fa mi re sol,

    %28
    do do re r8 sol
    mi4 do2 si4~
    si la2 sold4

    %31
    la re2 do8 la
    si4 r8 mi do la r8 fa'\mbreak
    re si r mi do la r re

    %34
    si sol r do la fa r si
    sold mi r la fad4 r8 sold
    la4 r8 do re si mi mi,	\mbreak

    %37
    la4 r8 fa'\p re si r mi
    do la r re si sol r do
    la fa r si sold mi

    %40
    r la fad4 r8 sold la4 r8 do\mbreak
    re si mi mi, la4 r\fermopz

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    <7>4 s8 <_+> <6>4 <6>
    <_+> s <7> <_->
    <2+> <6> s2
    <7>4 s8 <_-> <6 5->4 <_->
    <7> s8 <_+> <6>4 <6>
    <7 _+> <_-> <2> <6>
    <4+ 2> <6> <7 _+> <_->
    <7> s8 <_+> <6>2
    <7 _->4 <6> <7> s8 <_+>
    <6>4 <6> <7 _+> <_->
    <2+>4 <5>8 <6> <4+ 2>4 <6>
    <7>4 s8 <_+> <6>4 s8 <_+>
    <6 5+>4 s8 <5> <6 5>4 s8 <5>
    <6 5->4 s <7> s8 <_+>
    <6>4 <5>8 <6> <2+>4 <5>8 <6>
    <2>4 <6> <7 _+> <_->
    <4> <3+> <_-> s
    <2+> <6> <_-> <_->
    <2> <6> <7> s
    <_-> <_-> <7> s8 <_+>
    <6>4 <6> <7 _+> <_->
    <2+> <6> <4+ 2> <6>
    <7> s8 <_+> <9>4 <8 5>8 <6>
    <2>4 <5>8 <6> <2>4 <5>8 <6>
    <2>4 <6> <7> <7>
    s s <7> s
    <6> <2> s <6>
    <4 2> <5>8 <6> <4 2>4 <5->8 <6>
    s4  <5>8 <6 _-> <4+ 2>4 <6>
    <7>4 s8 <_+> <6>4 s8 <6>
    <6 5>4 s8 <6> <6 5>4 s8 <6>
    <6 5->4 s8 <6> <6 5>4 s8 <5->
    <6 5->4 s8 <6> <6 5->4 s8 <6>
    <9>4 s8 <6> <6 5>4 <_+>
    s s8 <6> <6 5>4 s8 <6>
    <6 5>4 s8 <6> <6 5->4 s8 <6>
    <6 5>4 s8 <5-> <5->4 s8 <6>
    <6 5->4 s8 <6> <9>4 s8 <6>
    <6 5>4 <_+>

}


forma = {

    \time 4/4
    \tempo 2 = 55
    \key do\major
    s1*41
    \bar "||"

}

IIvlI = {
    \IIglobal
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

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


IIIvlIn = \relative do'' {

    sol'4 r8 sol fad4 r8 fad
    sol4 r8 si do16 si la sol fad8. fad16
    sol8 la si re la4. la8

    %4
    si4 la sol r8 la
    fad4 sol8 si~\mbreak si la16 sol fad4
    mi r8 mi re4 r8 re

    %7
    do4 r8 do si4 si~
    si8 mi, la2 sol4
    la r r2

}


IIIvlIIn = \relative do'' {

    mi4 r8 mi si4 r8 red
    mi si mi2 red4
    mi8 la sol4~sol16 sol la sol fad4

    %4
    sol red mi r8 fad
    red red mi fad\mbreak sol mi re4~
    re8 sold, do4~do8 fad, si4~

    %7
    si8 mi, la4. la8 sold4
    do r8 do si4 r8 si
    la4 r r2

}


IIIvlan = \relative do' {

    si4 r8 si si4 r8 si
    si4 r8 si\mbreak fad'4 r8 fad
    mi re re re mi4 re

    %4
    re la si r8 do
    si4 r8 si' si4 r
    si r8 si, la4 r8 si

    %7
    do4 r8 mi\mbreak fa!4 r8 mi
    mi4 r8 mi fa4 r8 mi
    mi4 r r2

}



IIIvcn = \relative do {

    mi8 fad sol mi red dod red si
    mi mi'16 re? do?8 si la fad si si,
    mi8 fad sol si, do la re re,

    %4
    sol8 sol' fad si,\mbreak r mi do la
    r8 si' sol red mi la si la
    sold mi la sold fad la sold mi

    %7
    r8 la fa? do re si mi mi,\mbreak
    r la' fa do re si mi mi,
    la4 r r2

}

IIIbcn = \relative do {

    mi8 fad sol mi red dod red si
    mi re? do? si la4 si
    mi8 fad sol si, do4 re\mbreak

    %4
    sol,8 sol' fad si, r mi do la
    r8 si' sol red mi la si la
    sold mi la sold fad4 sold

    %7
    r8 la fa? do re si mi mi,\mbreak
    r la' fa do re si mi mi,
    la4 r r2

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    <_-> <5>4 <_+>
    <_-> s8 <6> <6 5>4 <_+>
    s <6+> s8 <_-> <6> <6+>
    s8 <_+> <6> <6> <_->4 <_->
    <6 5->4 s <6 5-> <5->
    s8 <9> <5> <6> <5>4 <_+>
    s8 <9> <5> <6> <6 5>4 <_+>

}


forma = {

    \time 4/4
    \tempo 4 = 40
    \key la\minor
    s1*9
    \bar "||"

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

IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma\IIIbfn>>

}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


IVvlIn = \relative do'' {

    la4 mi' do sold
    la si do r
    la mi' do sold

    %4
    la si do r
    r2 la4 mi'
    do sold la r

    %7
    la'2 sol
    fa mi
    re do

    %10
    si la4 mi'
    do sold la si
    do r la mi'

    %13
    do sold la2
    sold1
    r2 mi4 si'

    %16
    sol red mi fad
    sol r mi si'\mbreak
    sol red mi fad

    %19
    sol8 sol' la sol fad re sol fad
    mi do fad mi red si mi4~
    mi red mi fad

    %22
    sol r r2
    mi,4 si'\mbreak sol sold
    la mi' do sold

    %25
    la si do r
    la mi' do sold
    la si do r

    %28
    r2 la'4. sol8
    fa2 mi
    re\mbreak do4 r

    %31
    la mi' do sold
    la si do r
    la mi' do r

    %34
    R1
    la4 mi' do sold
    la r r2

    %37
    la4\p mi'\mbreak do sold
    la r r2\fermopz

}


IVvlIIn = \relative do'' {

    r2 la4 mi'
    do sold la si
    do si la r

    %4
    la mi' do sold
    la si do r
    do re mi sol~

    %7
    sol fa2 mi4~\mbreak
    mi re2 do4~
    do si2 la4~

    %10
    la sold la r
    la mi' do sold
    la si do r

    %13
    mi2~mi4 re
    mi1
    mi,4 si' sol? red\mbreak

    %16
    mi fad sol r
    mi la sol red
    mi fad sol r

    %19
    mi'2 re
    do si
    la sol4 r

    %22
    mi si' sol red
    mi fad\mbreak sol si
    do si la r

    %25
    la mi' do sold
    la si do r
    r2 la4 mi'

    %28
    do8 si la la'~la sol fa4~
    fa8 mi re4~\mbreak re8 re do4
    si2 la4 mi'

    %31
    do sold la si
    do r la re
    do si la mi'

    %34
    do sold la si
    do r r si\mbreak
    la\p mi' do sold

    %37
    la si do si
    la r r2\fermopz

}


IVvlan = \relative do' {

    R1
    la4 mi' do sold
    la si do re

    %4
    do sold la mi'
    do sold la si
    do si la r8 si

    %7
    mi4 re~\mbreak re8 si mi re
    do la re do si4 la
    la si mi fa~

    %10
    fa mi  mi r
    R1
    la,4 mi' do sold

    %13
    la si la2
    mi'1\mbreak
    R

    %16
    r2 mi4 si'
    sol red mi fad
    sol r mi si'

    %19
    sol mi la, si
    do2 fad4 sol
    la fad mi si'

    %22
    sol red\mbreak mi fad
    sol fad mi r
    r2 la,4 mi'

    %25
    do sold la si
    do r la mi'
    do sold la si

    %28
    do la'8. sol16 fa4. mi8\mbreak
    re4. do8 si si' la4~
    la sold la r

    %31
    R1
    la,4 mi' do sold
    la si do r

    %34
    la mi' do sold
    la si mi mi\mbreak
    mi r r2

    %37
    mi\parenthesize \p mi4 mi
    mi r r2\fermopz

}



IVvcn = \relative do {

    R1
    r2 la'4 mi'
    do sold la si

    %4
    la r r2
    la4 mi'\mbreak do sold
    la si do mi8 re

    %7
    do la re8 do si sol do si
    la fa si8 la sold mi la8 sold
    fad4 sold la8 sold fad mi

    %10
    re si mi mi, la4 r\mbreak
    r2 la'4 mi'
    do sold la r

    %13
    la, mi' fa2
    mi1
    R

    %16
    mi4 si' sol red
    mi fad sol r\mbreak
    mi si' sol red

    %19
    mi do'2 si4~
    si la2 sol4
    fad si mi, r

    %22
    r2 mi4 si'
    sol red mi re\mbreak
    do sold la r

    %25
    r2 la'4 mi'
    do sold la r
    la mi' do sold

    %28
    la8 sol fa4~fa8 mi re4~
    re8 do si la sold4 la
    re mi la, r

    %31
    r2 la'4 mi'
    do sold la si
    do sold la r

    %34
    r2 la4 mi'
    do sold la mi
    la, r la\p mi'

    %37
    do sold la mi'
    la, r r2\fermata

}

IVbcn = \relative do {

    R1
    r2 la4 mi'
    do sold la si

    %4
    la r r2
    la4 mi'\mbreak do sold
    la si do mi8 re

    %7
    do4 re8 do si4 do8 si
    la4 si8 la sold4 la8 sold
    fad4 sold la r8 la

    %10
    re si mi mi,\mbreak la4 r
    r2 la4 mi'
    do sold la r

    %13
    la mi' fa2
    mi1
    R

    %16
    mi4 si' sol red
    mi fad sol r\mbreak
    mi si' sol red

    %19
    mi do2 si4~
    si la2 sol4
    fad si mi r

    %22
    r2 mi4 si'
    sol red mi re\mbreak
    do sold la r

    %25
    r2 la4 mi'
    do sold la r
    la mi' do sold

    %28
    la fa'4. mi8 re4~
    re8 do si la sold4 la\mbreak
    re mi la, r

    %31
    r2 la4 mi'
    do sold la si
    do sold la r

    %34
    r2 la4 mi'
    do sold la mi'\mbreak
    la, r\mbreak la\p mi'

    %37
    do sold la mi'
    la, r r2\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 s4 <_+>
    <6> <6> s <6+>
    s1
    s4 <_+> <6> <6>
    s <6+> <6> <_->
    <6 5>2 <6 5->
    <6 5>4 <5-> <5-> s
    <6 5-> <5-> <9> s8 <8>
    <6 5>4 <_+> s2
    s s4 <_+>
    <6> <6> s2
    s4 <_+> <7> <6>
    <_+>1
    s
    s4 <_+> <6> <6>
    <_-> <6+> <6> s
    <_-> <_+> <6> <6>
    <_-> <6>8 <5> <4+ 2>4 <6>8 <5>
    <4 2>4 <6+>8 <5> <4+ 2>4 <6>
    <7> <7 _+> <_-> s
    s2 s4 <_+>
    <6> <6> <_-> <6 4+>
    <6> <6> s2
    s s4 <_+>
    <6> <6> s2
    s4 <_+> <6> <6>
    s1
    s2 <5->4 <_->
    <6 5> <_+> s2
    s s4 <_+>
    <6> <6> s <6+>
    <6> <6> s2
    s s4 <_+>
    <6> <6> s <_+>
    s2 s4 <_+>
    <6> <6> s <_+>

}


forma = {

    \time 2/2
    \tempo 1 = 50
    \key la\minor
    s1*14
    \bar ":..:"\break
    s1*24
    \bar ":|."

}

IVvlI = {
    \IVglobal
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

}



Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


VvlIn = \relative do'' {

    r8 fa sol re mib do fa mib
    re sib sib'2 la4
    sib8 sol fa do' sol4. sol8

    %4
    fa4. fa8 do4. do8
    re4 r r2\mbreak
    r8 fa sol re mib do fa mib

    %7
    re sib mib re do la re do
    sib sol do sib la fa sib4~
    sib la8 la' sol4 r16 sol sib sol

    %10
    fa4 r16 fa sib fa\mbreak mib4 r16 mib la mib
    re4 r16 re sol re do4 r16 do re do
    sib8 la r16 sib re sib la4. la8

    %13
    sol2 la
    sol4 r r2
    r8 re' mib sib\mbreak do la re do

    %16
    si sol do2 si4
    do2 re
    R1

    %19
    r8 do re la sib? sol do sib
    la fa sib2 la4
    sib2 do

    %22
    re4 r do'2\mbreak
    sib la
    sol8 sol sib fa sol mi la sol

    %25
    fa4 r8 la sib16 la sol fa mi4~
    mi re sol r16 sol sib sol
    fa4 r16 fa la fa\mbreak mi!4 r16 mi sol mi

    %28
    re4 mib re4. re8
    mib4 sol2 fad4
    sol r r8 do, re la

    %31
    sib sol do sib la fa fa'4~
    fa mi fa2\mbreak
    sol la4 r

    %34
    do r16 do la do sib4 r16 sib sol sib
    la4 r16 la fa la sol4 r16 sol mib sol
    fa4 r16 fa re fa mib4 r16 mib do mib

    %37
    re4 r16 re sib re\mbreak do4 r16 do la do
    re4\p r16 fa re fa mib4 r16 mib do mib
    re4 r16 re sib re do4 r16 do la do

    %40
    re4 r16 re sib re do4 r16 do la do
    re4 r r2

}


VvlIIn = \relative do'' {

    sib2 do
    re8 fa sol re mib do fa mib
    re mib? fa2 mib!4~

    %4
    mib re sol, la
    fa r8 sib do2
    re4 r16 re fa re\mbreak do4 r16 do mib do

    %7
    sib4 r16 sib re sib la4 r16 la do la
    sol4 r16 sol sib sol fa4 r16 fa re fa
    mi!8 mi' fa4~fa16 fa sib, re mib4~\mbreak

    %10
    mib16 mib la, do re4~re16 re sol, sib do4~
    do16 do fad, la sib4~sib16 sib sol sib la4~
    la16 la fad la sol4~sol16 sol la sol fad4

    %13
    sol8 re' mib sib\mbreak do la re do
    sib sol sol'2 fad4
    sol2 la

    %16
    sol4 r r2
    r8 sol lab mib fa re sol fa
    mi! do fa2 mi4

    %19
    fa2 sol\mbreak
    fa4 r8 sib, do2
    re4 r r2

    %22
    r4 sib'2 la4~
    la sol2 fad4
    sol fa!8 re mi2

    %25
    re8 la' sib fa sol mi la sol
    fa4 fa~\mbreak fa16 fa sib, re mi!4~
    mi16 mi la, do re4~re16 re sol, sib do4~

    %28
    do do2 si4
    do r r2
    r8 re mib sib do la re do\mbreak

    %31
    sib4 sol la r
    r2 r8 do re la
    sib sol do sib la la' sib4~

    %34
    sib16 sol mib sol la4~la16 fa re fa sol4~
    sol16 fa do mib fa4~\mbreak fa16 re sib re mib4~
    mib16 do la do re4~re16 sib sol sib do4~

    %37
    do16 la fa la sib4~sib16 sib do sol la4
    sib16\p sib la do re4~re16 sib sol sib do4~\mbreak
    do16 la fa la sib4~sib16 sib do sol la4

    %40
    sib16 la fa la sib4~sib16 sib do sol la4
    sib r r2

}


Vvlan = \relative do' {

    sib4 sib2 la4
    sib r r2
    r8 do re la sib sol do sib

    %4
    la fa sib2 la4
    sib8 fa' sol re mib do fa mib\mbreak
    re16 re fa re sib4 mib16 fa mib re do4

    %7
    re16 mib re do sib4 do16 re do sib la4
    sib16 do sib la sol8 sol' la16 sib la sol fa4
    sol fa8. mib16\mbreak re8 re' do4~

    %10
    do sib2 la4~
    la sol sol r8 la
    re,4 r8 re mib4 re

    %13
    re r r2
    r8 re mib sib do la re do\mbreak
    sib sol sol'2 fa4~

    %16
    fa mib re2
    do4 r8 sol' lab16 sol fa mi? re8 re
    do4 r8 fa sol2

    %19
    la sol
    R1
    r8 fa sol re mib do fa mib\mbreak

    %22
    re4. fa8 sol4 r8 do,
    fa4 r8 sib, mib4 re
    re re2 dod4

    %25
    re2 mi?
    fa4 r8 la re,4 r8 sol
    do,4 r8 fa sib,4 r8 sol\mbreak

    %28
    la2 re4 sol
    sol2 la
    sib la

    %31
    sol fa8 do re la
    sib sol do sib la fa fa'4~
    fa mib2 re4

    %34
    do2 fa4 r
    mib r re r
    do r sib r

    %37
    fa' r sol4 r8 fa
    re4\p r sib r
    fa' r sol r8 fa

    %40
    fa4 r sol r8 fa\mbreak
    fa4 r r2

}



Vvcn = \relative do {

    R1*3
    r8 fa sol re mib do fa mib
    re sib sib'2 la4

    %6
    sib sib~sib16 sib do sib la4~
    la16 la sib la sol4~\mbreak sol16 sol la sol fa4~
    fa16 fa sol fa mib4~mib16 mib fa mib re4
    do8 do' re la sib sol do sib

    %10
    la fa sib la sol mib la! sol
    fad re sol fad mi! sol fad la
    sol re mib sib\mbreak do la re do

    %13
    sib sol sol'2 fad4
    sol2 la
    sol4 r r2

    %16
    r8 sol lab mib fa re sol fa
    mib do do'2 sib4~
    sib8 la re la sib sol do sib

    %19
    la4 r r2
    r8 fa sol re mib! do fa mib
    re sib sib'4~sib16 sib do sib la4\mbreak

    %22
    sib8 sib sol re mib do fa mib
    re sib mib re do la re re,
    sol4 r r2

    %25
    r4 re'2 dod4
    re re'8 do sib sol do sib
    la fa sib la sol mi! la sol

    %28
    fad2 sol
    do,8 do' mib sib do la re do\mbreak
    sib4 sol2 fa4~

    %31
    fa mi fa r
    R1
    r2 r8 fa sol re\mbreak

    %34
    mib do fa mib re sib' mib re
    do la re do sib sol do sib
    la fa sib la sol sib la do

    %37
    sib sib, re sib mib do fa fa,\mbreak
    sib4\p sib'8 la sol sib la do
    sib sib, re sib mib do fa fa,

    %40
    sib sib re sib mib do fa fa,
    sib4 r r2

}

Vbcn = \relative do {

    \clef alto \key fa\major sib'4 sib2 la4
    sib8 \clef violin\key fa\major fa'' sol re mib do fa mib
    re \clef alto \key fa\major do, re la sib sol do sib

    %4
    \clef bass \key fa\major fa fa sol re mib do fa mib
    re sib sib'2 la4
    sib sib2 la4~

    %7
    la sol2 fa4~
    fa mib2 re4\mbreak
    do8 do re la sib sol do sib

    %10
    la fa' sib la sol mib la! sol
    fad re sol fad mi! 4fad
    sol8 re mib sib\mbreak do la re do

    %13
    sib sol sol'2 fad4
    sol2 la
    sol4 do, fa2

    %16
    sol8 sol lab mib fa re sol fa
    mib4 do2 sib4~
    sib8 la re la sib sol do sib

    %19
    la fa fa'2 mib4
    mib?8 re sol re mib! do fa mib
    re4 sib2 la4\mbreak

    %22
    sib8 sib' sol re mib do fa mib
    re sib mib re do la re4
    sol, \clef alto \key fa\major re''2 dod4

    %25
    re \clef bass \key fa\major re,2 dod4\mbreak
    re \clef tenor \key fa\major re'8 do sib sol do sib
    la fa sib la sol mi! la sol

    %28
    \clef bass \key fa\major fad2 sol
    do,4 mib8 sib do la re do\mbreak
    sib sol sol'2 fa4~

    %31
    fa mi fa8 \clef alto \key fa\major do' re la
    sib sol do sib la fa fa'4~
    fa4 mib \clef bass \key fa\major fa,8 fa sol re\mbreak

    %34
    mib do fa mib re sib mib re
    do la re do sib sol do sib
    la fa sib la sol4 la

    %37
    sib r8 sib mib4 fa
    sib,\p sib8 la sol4 la
    sib r8 sib mib4 fa

    %40
    sib, r8 sib mib4 fa
    sib, r r2

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6>8 <5> <4- 2>4 <6>8 <5>
    s4 s8 <6> <6 5>2
    s4 s8 <6> <6 5>4 <_->
    <7-> s8 <6> <5>2
    <6>4 <6>8 <5> <2>4 <6>8 <5->
    s4 <6>8 <5> <2>4 <6>8 <5->
    <2>4 <_->8 <5> <2>4 <6>8 <5>
    <2>4 <6>8 <5> <2>4 <6>
    <7 _!>4 s8 <6> <6 5>4 <_->
    <6 5->2 <6- 5>4 s8 <5->
    <6 5->4 <_->
    <6 5-> <5->
    <9>8 <_+> <5> <6> <6 5>4 <_+>
    <6> <6->8 <5> <2>4 <6>8 <5>
    <5>4 <6-> <5>8 <7> <6+>4
    s <_-> <9> <8>
    <7 _+> s8 <6>< 6 5>4 <_+>
    <6> <6-> <2> <6>8 <5>
    <4+ 2> <6> s <6> <6 5>2
    <6>4 <6>8 <5> <2>4 <6>8 <5>
    <2> <6> <5> <6> <5>2
    <6>4 <6>8 <5> <2>4 <6>8 <5->
    s4 s8 <6> <6 5>2
    <6 4> <6 5>
    <_->4 <6>8 <5> <2>4 <6>8 <5->
    s4 <6>8 <5> <4 2>4 <6>8 <5>
    s2 <5>4 <_!>
    <6 5>2 <5>
    <6 5->2 <4>4 <3+>
    <_->4 s8 <6> <5>4 <_+>
    <6>4 <6->8 <5> <2>4 <6>8 <5>
    <2> <6> <5>4 s s8 <6>
    <6 5>2 <6>4 <6>8 <5>
    <2>4 <6>8 <5> <7->4 <5>8 <6>
    <6 5>2 <6 5>
    <5> <6 5>4 <_->
    <6 5->2 <6- 5>4 <5->
    <9> s8 <8> <5>2
    s2 <6- 5>4 <5->
    <9>4 s8 <8> <6 5>2
    s <6 5>


}


forma = {

    \time 4/4
    \tempo 1 = 30
    \key fa\major
    s1*41
    \bar "||"

}

VvlI = {
    \Vglobal
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

}



VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


VIvlIn = \relative do'' {
   
   sib1 sib2
   la1.\fermata
   re1 re2
   
   %4
   do2. mib4 re do
   sib1 sol'2~
   sol fa1~
   
   %7
   fa2 mib1~
   mib2 re sol
   sol1 fa!2~
   
   %10
   fa mi! la\mbreak
   la1 sold2
   la1 mi2
   
   %13
   re1 re4 do
   sib!2 sib'4 la sol2~
   sol la4 sol fa2
   
   %16
   mib2. re4 do2~
   do si4 la si2
   mib mi mib 
   
   %19
   re1 re2\mbreak
   do2. re4 mi?2
   si1 si2
   
   %22
   la1 la2
   si mi2. re4
   do1 mi2
   
   %25
   re1 re4 do
   sib!2. do4 re2
   la1 la2
   
   %28
   sib mib re~\mbreak
   re do4 sib do2
   re1.\fermata

}


VIvlIIn = \relative do'' {
   
   sol1 sol2
   fad1.\fermata
   sib1 sib2
   
   %4
   la1 la2~
   la sol si
   dod re1
   
   %7
   re2 do do
   do1 sib!2~
   sib la re
   
   %10
   re1 do2~\mbreak
   do si1
   la2 do1~
   
   %13
   do2 do4 sib la2~
   la2 sol re'
   dod1 re2~
   
   %16
   re do? mib
   re1re2~
   re do1~
   
   %19
   do2 si1~\mbreak
   si2 la1~
   la2 sold sol~
   
   %22
   sol fa1
   mi si'2~
   si la do~
   
   %25
   do do4 sib la2~
   la sol1~
   sol2 fad4 mi fad2
   
   %28
   sol sib! la\mbreak
   sol1. 
   fad\fermopz

}


VIvlan = \relative do' {
   
   re1 re2
   re1.\fermata
   fa1 fa2
   
   %4
   fa re1
   re re2
   la'1 la,2
   
   %7
   sol sol'2. sol4
   la2 re,1
   mi!2 la,1
   
   %10
   si2 mi1\mbreak
   re2 r si
   do4 re mi fa sol2
   
   %13
   la1 la2
   re,1 re2
   la1 la2
   
   %16
   sib do2. sib4
   la2 sol sol'
   sol1 sol2
   
   %19
   la r mi\mbreak
   mi1 mi2
   fa mi1
   
   %22
   mi2 re1~
   re2 re si
   mi1 mi2
   
   %25
   la1 la2
   re,1 re2
   mib re1
   
   %28
   re2 sib re
   sol,1.
   re'\fermopz
   
}



VIvcn = \relative do {
   
   sol'1 sol2
   re1.\fermata
   sib1 sib2
   
   %4
   fa' fad1\mbreak
   sol1 sol2
   la re,4 mi fa re
   
   %7
   sib2  do1
   fa2 sol1
   do,2 re1
   
   %10
   sol,2 la1
   re2 mi1
   la sol2
   
   %13
   fad re fad\mbreak
   sol2. la4 sib!2
   la4 sol fa mi re2
   
   %16
   sol la2. sol4
   fa2 sol1
   do,2 do'4 sib la sol\mbreak
   
   %19
   fad2 sold1
   la2 la,4 sib do2
   re mi2. re4
   
   %22
   dod2 re1
   sold,1.
   la2 la'2. sol?4
   
   %25
   fad2 re fad
   sol sol,4 la sib2
   do re re,
   
   %28
   sol sol' fa
   mib1.
   re\fermopz

}

VIbcn = \relative do {
   
   sol1 sol2
   re'1.\fermata
   sib1 sib2
   
   %4
   fa' fad1\mbreak
   sol1 sol,2
   la re1
   
   %7
   sib2  do1
   fa,2 sol1
   do2 re1
   
   %10
   sol,2 la1
   re2 mi1
   la sol2
   
   %13
   fad re fad\mbreak
   sol2. la4 sib!2
   la1 re,2
   
   %16
   sol, la1
   fa2 sol1
   do2 do do
   
   %19
   fad, sold1
   la do2
   re mi1\mbreak
   
   %22
   dod2 re1
   sold,1.
   la2 la'2. sol?4
   
   %25
   fad2 re fad
   sol1 sib,2
   do re1
   
   %28
   sol,2 sol' fa
   mib1.
   re\fermopz

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1.
    <_+>
    s
    s2 <6 5->1
    <9>2 <8> <_+>
    <7 _+> <_-> s
    <6 5> <_-> s
    <7-> <4> <3->
    <7-> <4> <3->
    <7-> <4> <3->
    <7-> <4> <3+>
    <_-> s <6 4>
    <6 5-> s <6>4 <5>
    <9>2 <8> s
    <7 _+>1 <_->2
    <6- 5>2 <5-> s
    <5> <_+> s
    <9 _-> <8 _!> <_->
    <6 5-> <5-> s
    <9> <8> <6>
    <6+ 5> <_+> <_->
    <6 5-> <_-> s
    <6 5->1.
    <9>2 <8> s
    <5-> s <6>4 <5>
    <9>2 <8> <6>
    <5> <_+> s
    <_-> <6-> <6>
    <7> <6> s
    <_+>
    
}


forma = {

    \time 3/2
    \tempo 1 = 43
    \key fa\major
    s1.*30
    \bar "||"

}

VIvlI = {
    \VIglobal
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

}



VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


VIIvlIn = \relative do'' {
   
   sib8 do re mib fa4
   re sib la
   sib fa' do
   
   %4
   re r r
   sib8 do re mib fa4
   re r do\mbreak
   
   %7
   do4. mib8 re do
   sib4 re la
   sib r r
   
   %10
   sol8 la sib do re4
   sib r la
   sib r r
   
   %13
   sol8 la sib do re4
   dod la re~\mbreak
   re dod8 sib dod4
   
   %16
   re r r
   re8 mi fa sol la4
   fa re dod
   
   %19
   re la' mi
   fa r fad
   sol r r\mbreak
   
   %22
   sol,8 la sib do re4
   si do re 
   mib re2
   
   %25
   mi!4 r fa~
   fa mi8 re mi4
   fa8 sol la sib do4
   
   %28
   la fa mi
   fa fa, sol\mbreak
   la r r
   
   %31
   fa'8 sol la sib do4
   la sol2
   fa4 r mi
   
   %34
   fa r mi
   fa mi2
   re4 r do
   
   %37
   re r do
   sib fad2\mbreak
   sol4 r r
   
   %40
   sol8 la sib do re4
   sib si2
   do4 r si
   
   %43
   do r re
   mib sol2
   la4 r r
   
   %46
   R2.
   fa8 sol la sib do4\mbreak
   la fa mi
   
   %49
   la r sol
   fa2 sol4
   mib2 fa4
   
   %52
   re2 do4
   sib8 do re mib fa4
   re sib la
   
   %55
   sib fa' do
   re r r\mbreak
   sib8 do re mib fa4
   
   %58
   re r do
   sib r do
   re r r\fermopz

}


VIIvlIIn = \relative do'' {
   
   R2.
   sib8 do re mib fa4
   re sib la
   
   %4
   sib fa' do
   re r r
   re8 do sib do la4
   
   %7
   la4. do8 sib la\mbreak
   sol4 r r
   sol8 la sib do re4
   
   %10
   sib sol fad
   sol r fad
   sol re' la
   
   %13
   sol4. la8 sib4
   la2.
   sol2 sol'4 
   
   %16
   fa re dod\mbreak
   re r mi
   la, r r
   
   %19
   re8 mi fa sol la4
   fa r do
   sib r la
   
   %22
   sib r la
   re mib re
   do si8 la si4\mbreak
   
   %25
   sib! la2
   sol4 sol2
   la4 r r
   
   %28
   R2.
   fa'8 sol la sib do4
   la fa mi
   
   %31
   fa r sol
   fa dod2
   re4 r dod\mbreak
   
   %34
   re r la
   la la2
   sib4 r r
   
   %37
   sib8 do re mib fa4
   re do2
   sib4 r la
   
   %40
   sib r la
   sol fa2
   mib4 r re\mbreak
   
   %43
   mib r re'
   do mi!2
   fa8 sol la sib do4
   
   %46
   la fa mi
   fa do' sol
   la r sol
   
   %49
   fa r mib~
   mib re2~\mbreak
   re4 do2~
   
   %52
   do4 sib la
   sib r r
   sib8 do re mib fa4
   
   %55
   re sib la
   sib fa' do 
   re r r\mbreak
   
   %58
   sib8 do re mi fa4 
   re  r la
   sib r r\fermata
   
}


VIIvlan = \relative do' {
   
   R2.*2
   sib8 do re mib fa4
   re sib la
   
   %5
   sib fa' do
   re fa fa
   re r re
   
   %8
   re sol fad
   sol sol la
   re, r r\mbreak
   
   %11
   R2.
   sol8 la sib do re4
   sib8 do sib la sol4
   
   %14
   la r la,
   mi' r mi
   re8 mi fa sol la4
   
   %17
   fa re dod
   re sol mi
   fa r r\mbreak
   
   %20
   re8 mi fad sol la4
   sib r fad
   sol r la
   
   %23
   sol r sol
   sol r sol
   sol r fa?
   
   %26
   re r do
   do r r\mbreak
   la'8 sib do re sol,4
   
   %29
   la fa mi
   fa do2
   do4 r do
   
   %32
   do mi2
   fa4 r r
   re8 mi fa sol la4
   
   %35
   fa r do\mbreak
   re r la'
   sib r fa
   
   %38
   fa r do
   sol' r fad
   sol r la
   
   %41
   re, r re
   sol r r
   do,8 re mib fa? sol4\mbreak
   
   %44
   mib r r
   do r r
   do4. re8 mi?4
   
   %47
   do4 r r
   fa8 sol la sib do4
   la r do,
   
   %50
   do r re
   sib r do\mbreak
   fa2.
   
   %53
   fa2 r4
   R2.
   sib,8 do re mib fa4
   
   %56
   re sib la
   sib fa' do
   fa r la
   
   %59
   fa r fa
   fa r r\fermata
   
}



VIIvcn = \relative do {
   
   R2.*3
   sib8 do re mib fa4
   re sib la
   
   %6
   sib8 do re mib fa4
   fad2 r4
   sol8 la sib do re4
   
   %9
   sib sol fad\mbreak
   sol r r
   sol8 la sib do re4
   
   %12
   sib sol fad
   sol sol2~
   sol4 fa2
   
   %15
   mi4 la la,
   re4 r r
   R2.
   
   %18
   re8 mi fa sol la4\mbreak
   fa re dod
   re la'2
   
   %21
   sol8 la sib do re4
   sib sol fad
   sol do sol
   
   %24
   do sol2
   do,4 fa2
   sib,4 do do\mbreak
   
   %27
   fa4 r r
   fa8 sol la sib do4
   fa,2 r4 
   
   %30
   fa8 sol la sib do4
   la fa mi
   fa mi2
   
   %33
   re8 mi fa sol la4
   fa re dod\mbreak
   re do!2
   
   %36
   sib8 do re mib fa4
   re sib la
   sib la la'
   
   %39
   sol8 la sib do re4
   sib sol fad
   sol re2
   
   %42
   do8 re mib fa sol4\mbreak
   mib do si
   do sib!2
   
   %45
   la2.
   fa'8 sol la sib do4
   la fa mi
   
   %48
   fa r do
   fa8 sol la sib do4
   la sib8 do sib la
   
   %51
   sol4 la8 fa sol la
   \clef tenor \key fa\major sib8 do re mib fa4
   re sib la
   
   %54
   sib2 r4
   \clef bass \key fa\major R2.
   sib,8 do re mib fa4
   
   %57
   re sib la
   sib r fa\mbreak
   sib8 do re mib fa4 
   
   %60
   sib, r r\fermopz

}

VIIbcn = \relative do {
   
   R2.*3
   sib8 do re mib fa4
   re sib la
   
   %6
   sib8 do re mib fa4
   fad2 fad4
   sol8 la sib do re4
   
   %9
   sib sol fad\mbreak
   sol r r
   sol,8 la sib do re4
   
   %12
   sib sol fad
   sol sol'2~
   sol4 fa2
   
   %15
   mi4 la,2
   re4 r r
   R2.
   
   %18
   re8 mi fa sol la4\mbreak
   fa re dod
   re la2
   
   %21
   sol8 la sib do re4
   sib sol fad
   sol do sol
   
   %24
   do sol'2
   do,4 fa2
   sib,4 do do\mbreak
   
   %27
   fa4 r r
   fa,8 sol la sib do4
   fa2 r4 
   
   %30
   fa8 sol la sib do4
   la fa mi
   fa mi2
   
   %33
   re8 mi fa sol la4
   fa re dod\mbreak
   re do!2
   
   %36
   sib8 do re mib fa4
   re sib la
   sib la2
   
   %39
   sol8 la sib do re4
   sib sol fad
   sol re'2
   
   %42
   do8 re mib fa sol4\mbreak
   mib do si
   do sib!2
   
   %45
   la2.
   fa8 sol la sib do4
   la fa' mi
   
   %48
   fa r do
   fa,8 sol la sib do4
   la sib2\mbreak
   
   %51
   sol4 la2
   sib8 do re mib fa4
   re sib la
   
   %54
   sib2 r4
   R2.
   sib8 do re mib fa4
   
   %57
   re sib la
   sib r fa\mbreak
   sib8 do re mib fa4 
   
   %60
   sib, r r\fermopz

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2.*4
    <6>4 s <6>
    s2.
    <6 5->2 <6>4
    <_->2 <_+>4
    <6>4 s <6>
    s2.
    s2 <_+>4
    <6> s <6>
    s2.
    <4+ 2>4 <6>2
    <7>4 <7 _+>2
    <_->2.
    s
    s2 <_+>4
    <6> s <6>
    <_-> <6+>2
    s2 <_+>4
    <6> s <6>
    <_+> <_-> <_+>
    <_-> <_+> s
    <7- _!>2.
    <6 5>4 <_!>2
    s2.*4
    s2 <6>4
    s <6+>2
    s <_+>4
    <6> s <6>
    s <6>2
    s2.
    <6>4 s <6>
    s <6+>2
    s <_+>4
    <6> s <6>
    <_-> <6+>2
    s <_+>4
    <6> s <6>
    <_-> <6 4+>2
    <6>2.
    s2 <_!>4
    <6> s <6>
    s2.
    s2 <_->4
    <6 5-> <5> <6>
    <6- 5> <5-> <6>
    <9> <6> s
    <6> s <6>
    s2.*3
    <6>4 s <6>
    
}


forma = {

    \time 3/4
    \tempo 2. = 60
    \key fa\major
    s2.*60
    \bar "|."

}

VIIvlI = {
    \VIIglobal
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    \VIIglobal
    <<\VIIvlIIn \forma>>

}

VIIvla = {
    \VIIglobal
    \clef alto
    <<\VIIvlan \forma>>

}

VIIvc = {
    \VIIglobal
    \clef bass
    <<\VIIvcn \forma>>

}

VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma\VIIbfn>>

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
        title = \markup\smaller{Sinfonia da Chiesa n. 1 op. V}
        composer = \markup \center-column{"G. Bononcini (1670 - 1747)"}

    }

    \markup \huge {[I.1] Grave}

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

    \markup \huge {[I.2] Allegro}

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

    \markup \huge {[I.3] Adagio}

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

    %\pageBreak

    \markup \huge {[I.4] Presto}

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

}

\bookpart {

    \header {
        title = \markup\smaller{Sinfonia da Chiesa n. 2 op. V}
        composer = \markup \center-column{"G. Bononcini (1670 - 1747)"}

    }

    \markup \huge {[II.1] Allegro}

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

    \markup \huge {[II.2] Adagio}

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

   \pageBreak

    \markup \huge {[II.3] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \VIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc "
                \VIIvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc "
                \VIIbc
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

