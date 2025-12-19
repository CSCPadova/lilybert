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

    r4 la' si4. la16 sol
    fad8 re16 mi fad8 re r8 sol fad mi
    fad2 mi

    %4
    re4. mi8 fad fad16 sol la8 fad
    mi fad r4 r2\mbreak
    r r8 la sol la

    %7
    re, mi fad sol la16 sol fad mi re4
    r re8 dod16 si la2
    r8 mi' re mi la, si dod re

    %10
    mi4. re16 dod si4 dod8 re\mbreak
    mi4. fad16 mi re4 re~
    re dod2 si4

    %13
    la8 fad'16 sol la8 fad mi2~
    mi8 la, re2 dod4
    re r r2

    %16
    mi2 fad4. mi16 re\mbreak
    dod8 la16 si dod8 la r re dod si
    dod2 si

    %19
    la4. si8 dod4 r
    r2 mi\mbreak
    fad4. mi16 fad sold8 la fad4

    %22
    mi re2 dod4
    si2 dod4. dod'8
    si4. si8 la4. re,8

    %25
    sol4. dod,8 fad4. si,8
    mi4. lad,8 re4. mi16 re\mbreak
    dod4 fad~fad8 si, mi4

    %28
    fad8 re16 mi fad8 re r2
    si dod4. si16 dod
    red4 mi2 red4

    %31
    mi4. re?16 dod si4 dod
    si2 la4. si8\mbreak
    dod4 r r2

    %34
    mi4 fad mi2
    fad8 la sol la re, mi fad sol
    la4 la, si4. dod16 si

    %37
    la4. sol16 fad mi2
    re r4 la'\mbreak
    si4. la16 sol fad8 re16 mi fad8 re

    %40
    sol2 fad4 r
    r mi' fad8 mi16 re dod8 la16 si
    dod8 la dod 4 re8 dod16 si la8 dod16 re\mbreak

    %43
    mi8 dod mi4 fad8 mi16 re dod8 la16 si
    mi8 la, re fad mi4. mi8
    fad1\fermopz

}


IvlIIn = \relative do'' {

    R1*2
    r2 r8 la' sol la
    re, mi fad sol la4 r

    %5
    r8 fad mi re mi4. la,8
    re4 re2 dod4~
    dod si la2\mbreak

    %8
    si4. la16 sol fad8 re' dod re16 dod
    si4. si8 la4 r
    r2 r8 re dod si

    %11
    dod2 si
    mi re
    r r8 si la sol\mbreak

    %14
    la4. la8 sol2
    re8 re16 mi fad8 la sold sold'? la4~
    la sold la r

    %17
    mi2 fad4. mi16 re
    dod4 r r8 mi re mi\mbreak
    la, si dod re mi dod16 re mi8 dod

    %20
    si4 r \mbreak r mi~
    mi re~re8 dod16 si la8 re~
    re dod si4 la4. si16 dod

    %23
    re4 si~si8 si' la4~
    la8 red, sold4~sold8 dod, fad4~\mbreak
    fad8 si, mi4~mi8 la, re4~

    %26
    re8 sold, dod4~dod8 fad, si4~
    si lad si r
    fad'2 sol4. fad16 mi

    %29
    re8 si16 dod re8 si\mbreak mi4. re16 dod
    si4. si8 la2
    sold8 la16 si dod8 si16 la sold4 la~

    %32
    la sold la r
    r mi' fad4. mi16 re
    dod4 re2 dod4\mbreak

    %35
    re la si4. la16 sol?
    fad8 re16 mi fad8 fad r sol fad mi
    fad2 r8 la' sol la

    %38
    re, mi fad sol la4 r
    R1
    r4 mi fad4. mi16 re\mbreak

    %41
    dod8 la16 si dod8 la r2
    r4 mi' fad8 mi16 re dod8 la16 si
    dod8 la dod4 re8 dod16 si la8 dod16 re

    %44
    mi8 dod re2 dod4
    re1\fermopz

}


Ivlan = \relative do' {

    R1*2
    r4 re2 dod4~
    dod si la16 la' sol fad mi8 re

    %5
    dod re la' si~si mi, la4~
    la sold la2
    si4. la16 sol\mbreak fad8 re16 mi fad8 re

    %8
    r sol fad mi fad4 la~
    la sold la4. sold16 fad
    mi8 dod16 re mi8 la sold fad mi re

    %11
    dod2 r
    r8 la' sol? la\mbreak  re, mi fad sol
    la4 r8 la, si4 r8 mi

    %14
    la,4 la' si r8 la16 sol
    fad4 re2 dod4
    si mi2 re4

    %17
    la' r8 la16 sol fad8 sol la si~\mbreak
    si8 mi, la2 sold4
    la r r mi

    %20
    fad4. mi16 re dod8 la16 si dod8 la
    r la re la' sold mi4 re8
    si dod fad mi mi4 mi\mbreak

    %23
    fad4 r8 mi16 re dod4 r8 la'16 sol
    fad4 r la2
    si4 r8 la16 sol fad4 r8 re16 dod

    %26
    si4 r8 dod fad4 r8 fad
    sol4 r8 dod, si2
    r mi\mbreak
    fad4. mi16 re dod8 la16 si dod8 la
    si4 r8 mi la4 r8 fad
    mi4 r r2
    r8 mi re mi la, si dod re
    mi4 la2 r8 si\mbreak
    dod la fad sol la2
    fad4 r r2
    r mi~
    mi4 re2 dod4~
    dod si la8 la'16 sol fad4
    mi2~mi4 re~
    re dod re2\mbreak
    r8 la' sol la re, mi fad mi16 re
    dod4 r r2
    r8 la' sol la re, mi fad mi16 re
    dod8 la' fad re la2
    la1\fermata

}



Ivcn = \relative do {

    R1*2
    r2 la'2

    %4
    si4. la16 sol\mbreak fad8 re16 mi fad8 re
    r re' dod si dod2
    si la4  r

    %7
    R1*2
    mi2 fad4. mi16 re

    %10
    dod8 la16 si dod8 la mi' fad16 sol la8 si~
    si mi, la4~la8 si16 la sold4
    la2 si4. la16 sol

    %13
    fad8 re16 mi fad8 re\mbreak r sol fad mi
    fad2 mi
    re4 r8 re mi4 la,

    %16
    R1
    r8 la' sol la\mbreak re, mi fad sol
    la4 r mi2

    %19
    fad4. mi16 re dod8 la16 si dod8 la
    r re dod si dod dod'16 si la sol fad mi\mbreak
    re8 re'16 dod si la sold fad mi8 la re16 dod si la

    %22
    sold8 la re, mi la,4 la'~
    la sold la8 la16 sold fad8 fad16 mi
    red4 mid fad8 fad16 mi? re8 re'16 dod

    %25
    si8 si, dod dod' re re,16 dod si8 si'16 la
    sold8 sold, lad lad'? si si,16 dod re8 re'
    mi  mi, fad4\mbreak sol4. fad16 mi

    %28
    re8 si16 dod re8 si r mi re dod
    re si si'4~si8 dod16 si la4~
    la8 si16 la sol8 la16 sol fad8 sol16 la si8 si,\mbreak

    %31
    mi1
    mi2\mbreak fad4. mi16 re
    dod8 la16 si dod8 la r re dod si

    %34
    la1
    re4 r r2
    R1

    %37
    r2 la'
    si4. la16 sol fad8 re16 mi fad8 re
    r sol fad mi fad2

    %40
    mi re
    la1~
    la

    %43
    la~
    la
    re1\fermopz

}

Ibcn = \relative do'' {

    \clef violin \key re\major r4 la' si4. la16 sol
    fad8 re16 mi fad8 re r8 sol fad mi
    fad4 re  \clef bass \key re\major la,2

    %4
    si4. la16 sol\mbreak fad8 re16 mi fad8 re
    r re dod si dod2
    si la4  \clef alto \key re\major la''

    %7
    si4. la16 sol fad8 re16 mi fad8 re
    r sol fad mi\mbreak fad4 la
    \clef bass \key re\major mi,2 fad4. mi16 re

    %10
    dod8 la dod la mi'4 la8 si~
    si mi, la2 sold4
    la2 si4. la16 sol

    %13
    fad8 re fad re\mbreak r sol fad mi
    fad2 mi
    re4 r8 re mi4 la,

    %16
    mi' \clef alto \key re\major mi'~mi re
    \clef bass \key re\major r8 la sol la\mbreak re, mi fad sol
    la2 mi

    %19
    fad4. mi16 re dod8 la dod la
    r re dod si dod2
    re mi8 la, re si

    %22
    sold la re mi\mbreak la,4 la'~
    la sold la fad
    red mid fad re

    %25
    si dod re si
    sold lad si re
    mi fad\mbreak sol4. fad16 mi

    %28
    re8 si re si r mi re dod
    re si si'2 la4~
    la sol fad si,

    %31
    mi1
    mi2\mbreak fad4. mi16 re
    dod8 la dod la r re dod si

    %34
    la1
    re4 \clef violin\key re\major la'' si4. la16 sol
    fad8 re fad fad\clef alto \key re\major mi2~\mbreak

    %37
    mi4 re \clef bass \key re\major la2
    si4. la16 sol fad8 re fad re
    r sol fad mi fad2

    %40
    mi re
    la1~
    la

    %43
    la~
    la
    re1\fermopz

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s2 <4>4 <3>
    <9> <8> s2
    s8 <6> s4 <7> <6>
    <7> <6+> <4> <3>
    <9> <8> s2
    s1
    <4>4 <3+> s2
    <6> <_+>
    <2>4 <5>8 <6> <2>4 <5->
    <4> <3> <9> <8>
    <6>2 s8 <6> s4
    <7>4 <6> <7> <6>
    s2 <7 _+>
    <4 _+>4 <3+> <2> <5>
    s1
    <9>4 <8> <4> <3+>
    s1
    s8 <6> s4 <7> <6>
    <9> <8> <7 _+> <9>8 <3>
    <6 5->4 <6 5> 8 <_+> <4>4 <3>
    <4 2> <5->8 <6> <9>4 <3>
    <6 5-> <5> <9+> <5>
    <5> <5-> <9> <3>
    <6 5-> <5-> <9> <6>
    <5> <_+> <7> <6>
    s2 s8 <_-> s4
    <6> <5> <2> <5>
    <4+ 2> <6> <7> <7 _+>
    <5 3+> <6 4> <5 3+> <6 4>
    <5 4> <3+> s2
    s1
    <5 3>4 <6 4> <5 4> <3>
    s1
    s2 <5>4 <6>
    <2> <5> <4> <3>
    <9 > <8> s2
    s8 <6> s4 <7> <6>
    <7 > <6>

}


forma = {

    \time 4/4
    \tempo 2 = 60
    \key re\major
    s1*45
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

    fad2 re si
    lad si re
    dod fad re\mbreak

    %4
    dod re1
    dod re2
    sol1 la4(sol)

    %7
    fad1 sol4(fad)
    mi1 mi2
    fad1 r2

    %10
    la fad re
    dod re1
    mi2 fad1

    %13
    mi fad2\mbreak
    fad re si
    lad si1

    %16
    dod2 fad re
    dod re1
    dod la'2

    %19
    sol1 la4(sol)
    fad1 sol4(fad)
    mi1 fad4(mi)

    %22
    re1 re2
    dod dod2. dod4
    red2 mi red

    %25
    mi red1
    re!2 dod si
    dod si2. si4

    %28
    dod2 re4(dod) re2~
    re dod4(si) dod2
    re1 fad2\mbreak

    %31
    mi1 fad2
    re sol fad~
    fad mi4(re) mi2

    %34
    fad1.\fermopz

}


IIvlIIn = \relative do'' {

    R1.
    fad2 re si
    lad si1

    %4
    dod2 si4(lad) si2~
    si lad si
    r si mi~

    %7
    mi re4(dod) re2~\mbreak
    re dod4(si) dod2
    re1 r2

    %10
    R1.*2
    la'2 fad re~
    re dod4(si) dod2

    %14
    re1 r2
    R1.*2
    fad2 re si

    %18
    lad fad fad'~
    fad mi4(re) mi2~
    mi fad4(mi) re2~

    %21
    re dod4(si) dod2~
    dod si1~
    si2 lad1

    %24
    la!2 sol fad
    sol fad2. fad4
    sold2 la sold\mbreak

    %27
    la sold1
    sol!2 fad1
    mi mi2

    %30
    fad fad'4(mi) re2~
    re dod1~
    dod2 si dod

    %33
    si1.
    lad\fermopz

}


IIvlan = \relative do' {

    R1.*3
    fad2 re si
    dod fad1~

    %6
    fad2 mi1
    dod2 re1
    si2 dod la

    %9
    la' fad re
    dod re1
    mi2 la fad\mbreak

    %12
    mi2 re1
    mi1.
    re1 r2

    %15
    fad re si
    lad si1
    fad'1.~

    %18
    fad2 fad2. mi4
    re2 mi1
    la, si2

    %21
    si dod1
    fad1.\mbreak
    fad2 mi1

    %24
    re2 si1
    si2 si'2. la4
    sold2 mi1

    %27
    mi2 mi1
    dod2 la1
    si2 la1

    %30
    la si2
    si dod1
    re dod2

    %33
    sol'1.\mbreak
    dod,\fermopz

}



IIvcn = \relative do {

    si2 r r
    R1.
    fad'2 re si

    %4
    lad si1
    fad' si,2
    mi2 mi'4 re dod si

    %7
    lad2 si2. la?4
    sol2 la la,
    re1 r2

    %10
    R1.
    la'2 fad re
    dod re1

    %13
    la' lad2
    si1 r2
    R1.

    %16
    fad2 re si
    lad si1
    fad' 2. mi4 re dod

    %19
    si2 dod1
    re2 re'4 dod si la
    sold2 lad lad,

    %22
    si  si'4 dod re re,
    mi2 fad fad,
    si mi si'

    %25
    mi, si1
    mi2 la mi
    la mi1

    %28
    la,2 re4 mi fad re
    sol2 la la,
    re re'4 dod si la

    %31
    sold2 lad lad,
    si si' la?
    sol?1.

    %34
    fad1.\fermopz

}

IIbcn = \relative do {

    si2 r r
    R1.
    fad'2 re si

    %4
    lad si1
    fad' si,2
    mi1 dod2

    %7
    lad2 si1
    sol2 la?1\mbreak
    re r2

    %10
    R1.
    la'2 fad re
    dod re1

    %13
    la lad2
    si1 r2
    R1.

    %16
    fad'2 re si
    lad si1
    fad' re2\mbreak

    %19
    si dod1
    re si2
    sold lad1

    %22
    si re2
    mi fad fad,
    si mi si

    %25
    mi si1
    mi2 la mi\mbreak
    la, mi'1

    %28
    la,2 re1
    sol,2 la1
    re si2

    %31
    sold lad1
    si la?2
    sol?1.

    %34
    fad1.\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*2
    <_+>2 <6>1
    <6>1.
    <4>2 <3+> <_->
    <9> <8> <6>
    <6 5-> <5> <6>
    <6 5>1.
    s1.*2
    s2 <6> s
    <6>1.
    <4>2 <3> <6 5->
    s1.*2
    <_+>2 <6> s
    <6> s s
    <_+> s <5>
    <6 5> <5-> <6>
    <9> <8> <6>4 <5>
    <6 5->2 <5-> <6>
    <9> <8> <6>
    <6 5> <_+> s
    <7- _+> <_-> <_+>
    <_-> <_+> s
    <7- _+> s <_+>
    s <_+> s
    <7-> s s
    <6 5>1.
    s1 <3>2
    <6 _-> <5-> <6>
    <9 5> <8 6> <6>
    <7> <6> s
    <_+>

}


forma = {

    \time 3/2
    \tempo 1 = 40
    \key re\major
    s1.*34
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

    re8 fad16 mi re8
    la'4.
    fad8  si16 la sol fad

    %4
    mi8 la16 sol fad mi\mbreak
    re8 sol16 fad mi re
    dod8 fad16 mi re dod

    %7
    si8 dod re~
    re mi16 re dod8
    re4 r8
    R4.

    %11
    la'4 si16 la
    sol4 la16 sol
    fad4 sol16 fad\mbreak

    %14
    mi4 fad16 mi
    re4 mi16 re
    dod4 r8

    %17
    mi, sold16 fad mi8
    la4 la8
    si4.

    %20
    R4.*4
    mi8 fad16 mi re8
    dod re16 dod si8\mbreak

    %26
    la dod16 si la8
    sold sold'4
    la8 r sol!

    %29
    fad r mi
    re r dod
    si r la

    %32
    sold r la
    si4 si8\mbreak
    dod fad16 mi re8

    %35
    dod4 r8
    re mi16 re do8
    si4 r8

    %38
    dod! re16 dod si8
    lad4.
    si8 r la'

    %41
    sol r fad\mbreak
    mi r re
    dod r re

    %44
    dod4 dod8
    re4 r8
    mi fad16 mi re8

    %47
    dod4 r8
    re mi16 re dod8
    si dod re~

    %50
    re dod16 si dod8\mbreak
    re4 r8
    la dod16 si la8

    %53
    re4 re8
    dod8. re16 mi8
    fad si16 la sol fad

    %56
    mi8 la16 sol fad mi
    re8 sol16 fad mi re
    dod8 fad16 mi re dod\mbreak

    %59
    si8 mi16 re dod si
    la8 re16 dod si la
    sol8 r la'

    %62
    fad r sol
    mi r fad
    re r mi\mbreak

    %65
    dod r re~
    re dod16 si dod8
    re\p si'16 la sol fad

    %68
    mi8 la16 sol fad mi
    re8 sol16 fad mi re
    dod8 fad16 mi re dod

    %71
    si8 mi16 re dod si\mbreak
    la8 re16 dod si la
    sol8 r la'

    %74
    fad r sol
    mi r fad
    re r mi

    %77
    dod r re~
    re dod16 si dod8\mbreak
    re8 r re~

    %80
    re dod16 si dod8
    re mi4
    fad4.

}


IIIvlIIn = \relative do'' {

    R4.
    la8 dod16 si la8
    re4.~

    %4
    re8 dod4~
    dod8 si4~
    si8 la4~

    %7
    la8 la16 sol fad8
    mi4 mi8
    fad la16 sol fad8

    %10
    mi mi'4~
    mi8 re16 dod re8~\mbreak
    re8 dod16 si dod8~

    %13
    dod si16 la si8~
    si la16 sold la8~
    la sold16 fad sold8

    %16
    la dod16 si la8
    mi' si16 la sold fad
    mi4 la8\mbreak

    %19
    sold4.
    mi'8 fad16 mi re8
    dod re16 dod si8

    %22
    la dod16 si la8
    sold4.
    dod8 re16 dod si8

    %25
    la si16 la sold8
    fad la16 sold fad8\mbreak
    mi4 r8

    %28
    mi' r si
    dod r mi
    la, r dod

    %31
    fad, r la
    re, r la'~
    la sold16 fad sold8

    %34
    la re16 dod si8\mbreak
    la4 r8
    la r la

    %37
    sol?4 r8
    sol si16 la sol8
    fad4 r8

    %40
    fad' r mi
    si r dod
    si r la\mbreak

    %43
    sol r si~
    si lad16 sol lad8
    si4 r8

    %46
    si re16 dod si8
    la?4 r8
    la dod16 si la8

    %49
    sol mi fad
    sol4 mi8\mbreak
    re fad16 mi re8

    %52
    la' la16 sol fad mi
    re8. mi16 fad8
    mi4 mi8

    %55
    re re' mi16 fad
    sol8 r la
    fad r sol

    %58
    mi r fad\mbreak
    re r mi
    dod r re~

    %61
    re dod4~
    dod8 si4~
    si8 la4~

    %64
    la8 sol4~
    sol8 fad4
    mi mi8

    %67
    re\p re' mi16 fad
    sol8 r la\mbreak
    fad r sol

    %70
    mi r fad
    re r mi
    dod r re~

    %73
    re dod4~
    dod8 si4~
    si8 la4~

    %76
    la8 sol4~
    sol8 fad4\mbreak
    mi mi8

    %79
    re r re'
    mi4 mi8
    re dod16 si dod8

    %82
    re4.

}


IIIvlan = \relative do' {

    R4.*7
    la8 dod16 si la8
    re4.~

    %10
    re8 dod16 si dod8
    la r re
    sol r dod,

    %13
    fad r si,\mbreak
    mi r la,
    re r si

    %16
    dod4.
    R
    dod8 mi16 re dod8

    %19
    si si'16 la sold fad
    mi4.
    mi8 r re

    %22
    dod r dod\mbreak
    si si'16 la sold fad
    mi4 r8

    %25
    mi4 r8
    r mi la,
    si4 si8

    %28
    la r re
    dod  r si
    la r sol'\mbreak

    %31
    fad r mi
    si r dod
    fad mi4

    %34
    mi4.
    dod'8 re16 dod si8
    la4 r8

    %37
    si do16 si la8
    sol4 r8
    dod,!4.\mbreak

    %40
    re8 r mi
    re r dod
    sol r la

    %43
    mi' r fad
    sol fad4
    fad r8

    %46
    si, r si
    dod4 r8
    la r la\mbreak

    %49
    si r la
    sol16 sol' la8. sol16
    fad4.

    %52
    R
    re8 fad16 mi re8
    la'4 r8

    %55
    la fad4
    si8 r la
    la r sol\mbreak

    %58
    sol r fad
    fad r mi
    mi r re

    %61
    mi r mi
    fad r si
    mi, r la

    %64
    re, r sol
    la r la\mbreak
    si r la

    %67
    la\p fad4
    si8 r la
    la r sol

    %70
    sol r fad
    fad r mi
    mi r re

    %73
    mi r mi\mbreak
    fad r si
    mi, r la

    %76
    re, r sol
    la r la
    si r la

    %79
    la fad4
    si8 r la
    la r la

    %82
    la4.

}


IIIvcn = \relative do {

    R4.*8
    re8 fad16 mi re8
    la'4.

    %11
    fad8 si16 la sol fad
    mi8 la16 sol fad mi
    re8 sol16 fad mi re

    %14
    dod8 fad16 mi re dod
    si8 mi16 re dod si
    la4.

    %17
    R
    la8 dod16 si la8
    mi'4.

    %20
    R4.*7
    \clef tenor \key re\major mi'8 fad16 mi re8
    dod8 re16 dod si8

    %29
    \clef bass \key re\major la si16 la sol8
    fad sol16 fad mi8
    re mi16 re dod8

    %32
    si dod16 si la8
    re mi mi,
    la4 r8

    %35
    la' si16 la sol8
    fad4 r8
    sol8 la16 sol  fad8

    %38
    mi4 r8
    fad sol16 fad mi8
    re mi16 re dod8

    %41
    si' dod16 si la8
    sol la16 sol fad8
    mi fad16 mi re8

    %44
    mi fad fad,
    si'8 dod16 si la8
    sold4 r8

    %47
    la8 si16  la sol!8
    fad4 r8
    sol8 la16 sol fad8

    %50
    mi fad16 sol la8
    re,4.
    R4.*2  %%% fin qui

    %54
    la'8 dod16 si la8
    re4.~
    re8 dod4~

    %57
    dod8 si4~
    si8 la4~
    la8 sol4~

    %60
    sol8 fad4
    mi8 la16 sol fad mi
    re8 sol16 fad mi re

    %63
    dod8 fad16 mi re dod
    si8 mi16 re dod si
    la8 re16 dod si la

    %66
    sol8 la4
    re8\p re'4~
    re8 dod4~

    %69
    dod8 si4~
    si8 la4~
    la8 sol4~

    %72
    sol8 fad4
    mi8 la16 sol fad mi
    re8 sol16 fad mi re\mbreak

    %75
    dod8 fad16 mi re dod
    si8 mi16 re dod si
    la8 re16 dod si la

    %78
    sol8 la4
    re8 re'16 dod si la
    sol8 la4

    %81
    re,8 la4\mbreak
    re4.

}

IIIbcn = \relative do {

    \clef violin \key re\major re''8 fad16 mi re8
    la dod16 si la8
    re4.~

    %4
    re8 dod4~
    dod8 si4~
    si8 la4~

    %7
    la8 la16 sol fad8\mbreak
    \clef alto \key re\major la, dod16 si la8
    \clef bass \key re\major re, fad16 mi re8

    %10
    la'4.
    fad8 si16 la sol fad
    mi8 la16 sol fad mi

    %13
    re8 sol16 fad mi re\mbreak
    dod8 fad16 mi re dod
    si8 mi4

    %16
    la,4.
    R
    la8 dod16 si la8

    %19
    mi'4.~
    mi~
    mi~

    %22
    mi~
    mi~
    mi~\mbreak

    %25
    mi~
    mi
    mi8 r re

    %28
    dod r si
    la r sol
    fad' r mi

    %31
    re r dod
    si r la\mbreak
    re mi4

    %34
    la, r8
    la'4 sol8
    fad4.

    %37
    sol4 fad8
    mi4 r8
    fad4 mi8

    %40
    re r dod
    si r la\mbreak
    sol' r fad

    %43
    mi r re
    mi fad4
    si8 r la

    %46
    sold4.
    la8 r sol!
    fad4.

    %49
    sol8 la16 sol fad8
    mi la,4\mbreak
    re4.

    %52
    R4.*2
    la8 dod16 si la8
    re4.~

    %56
    re8 dod4~
    dod8 si4~
    si8 la4~

    %59
    la8 sol4~
    sol8 fad fad'\mbreak
    mi la16 sol fad mi

    %62
    re8 sol16 fad mi re
    dod8 fad16 mi re dod
    si8 mi16 re dod si

    %65
    la8 re16 dod si la
    sol8 la4
    re8\p re4~

    %68
    re8 dod4~
    dod8 si4~
    si8 la4~

    %71
    la8 sol4~
    sol8 fad fad'
    mi la16 sol fad mi

    %74
    re8 sol16 fad mi re\mbreak
    dod8 fad16 mi re dod
    si8 mi16 re dod si

    %77
    la8 re16 dod si la
    sol8 la4
    re8 re'16 dod si la

    %80
    sol8 la4
    re,8 la4\mbreak
    re4.

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*2
    <5>8 <6> s
    <2> <6>4
    <2>8 <6>4
    <2>8 <6>4
    <2>8 <3>4
    s4.*2
    <4>8 <3> s
    <7> <7> s
    <7> <7> s
    <7> <7> s
    <7> <7> s
    <7> <7 _+> s
    s4.*3
    <_+>4.
    s4.*7
    <_+>8 s <6 4+>
    <6> s <6->
    <6> s <6>
    <6> s <6>
    <6> s <6>
    <6+> s s
    <6 5> <_+> s
    s4.*2
    <6>4 <5->8
    s s <6>
    <6+> s s
    <_+> s <6 4+>
    <6> s <6>
    <6-> s <6>
    <6> s <6>
    <6> s <6>
    <6 5> <_+> s
    <_->4.
    <6>8 <5-> s
    s s <6 4+>
    <6> <5> s
    s s <6>
    <7> <7> s
    s4.*4
    <5>8 <6> s
    <2> <6>4
    <2>8 <6>4
    <2>8 <6>4
    <2>8 <6>4
    <4 2>8  <6> s
    <7> <7> s
    <7> <7> s
    <7> <7> s
    <7> <7> s
    <7> <7> s
    <6 5>4.
    s8 <6>4
    <2>8 <6>4
    <2>8 <6>4
    <2>8 <6>4
    <2>8 <6>4
    <4 2>8  <6> s
    <7> <7> s
    <7> <7> s
    <7> <7> s
    <7> <7> s
    <7> <7> s
    <6 5>4.
    s <6 5>

}


forma = {

    \time 3/8
    \tempo 4. = 65
    \key re\major
    s4.*82
    \bar "|."

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

    re1 re2
    do1 do2
    sib1 sib2

    %4
    la la1
    la la2
    sol1 la4 sol

    %7
    fa1 fad2
    sol1 sol2
    fad1.\fermata

    %10
    fa'?1 fa2\mbreak
    mib1 mib2
    re1 re2

    %13
    do1 do2
    do1 do2
    sib1 do4 sib

    %16
    la1 re2
    re re1
    do2 do2. sib4

    %19
    lab2. sib4 do2
    sib sib2. la4
    sol1 sol'2

    %22
    fa1 fa2
    mib1 mib2
    re1 re2

    %25
    do2. re4 mi?2
    re4(do) si2. si4
    do2. re4 mi2

    %28
    re re2. do4
    sib!2. do4 re2\mbreak
    do do2. sib4

    %31
    la2 la'4 sol fa2
    mib1 fa4 mib
    re1 re2

    %34
    do1 re4 do
    sib1 sib2
    la la2. la4

    %37
    sib1 sib2\p
    la la2. la4
    si1.

}


IVvlIIn = \relative do'' {

    sib1 sib2
    sib la la
    la sol sol

    %4
    sol1 sol2~
    sol fad fa~
    fa mi1~

    %7
    mi2 re re'~
    re do1\mbreak
    re1.\fermata

    %10
    re1 re2~
    re do do~
    do sib sib

    %13
    sib sib1~
    sib2 la lab~
    lab sol sol

    %16
    do do1
    sib2 sib1~
    sib2. la?4 sol2\mbreak

    %19
    lab lab1~
    lab2. sol4 fa2
    sol sol'4 fa mib2~

    %22
    mib re1~
    re2 do1~
    do2 si1~

    %25
    si2 la1~
    la2 sold4 fa sold2
    la4 sib? do1~\mbreak

    %28
    do2. sib4 la2
    sib sib1~
    sib2. la4 sol?2

    %31
    la1 re2~
    re do do~
    do sib sib~

    %34
    sib la la~
    la sol sol~\mbreak
    sol fad4 mi fad2

    %37
    sol1 sol2\p~
    sol fad4 mi fad2
    sol1.

}


IVvlan = \relative do' {

    sol'1 sol2
    sol re1
    re mib2~

    %4
    mib mi1
    re re2
    re r mi

    %7
    la,1.
    sol
    la\fermata

    %10
    sib1 sib2\mbreak
    sib r do
    fa1 sol2

    %13
    sol sol1
    fa do2
    fa r sol~

    %16
    sol fa la~
    la sol1~
    sol2 mi! sol~

    %19
    sol fa1~\mbreak
    fa2 re fa~
    fa mib sib

    %22
    do r sol'
    sol1 sol2
    la sol mi

    %25
    mi1 mi2
    si mi1
    mi mi2

    %28
    la fad la~\mbreak
    la sol1~
    sol2 mi sol~

    %31
    sol fa?1
    sib,2 r do
    fa1 fa2

    %34
    sol r la
    re,1 re2
    mib re1

    %37
    re re2\p
    mib re1
    re1.

}



IVvcn = \relative do {

    sol1 sol'2
    mi! fad1
    sol2. fa?4 mib re

    %4
    do2 dod1
    re2 re'2. do4
    si2 dod dod,?

    %7
    re1.
    mib\mbreak
    re\fermata

    %10
    sib1 sib'2
    sol la la,
    sib sib'4 la sol fa

    %13
    mib2 mi1
    fa fa2
    re mi1

    %16
    fa fad2
    sol1 fa!2\mbreak
    mi! do mi

    %19
    fa1 mib2
    re sib re
    mib2. fa4 sol2

    %22
    lab sib si,
    do2. re4 mib2
    fa sol sold

    %25
    la la,4 si? do2\mbreak
    re mi1
    la,2 la' sol

    %28
    fad re fad
    sol1 fa!2
    mi! do mi

    %31
    fa1 fa2
    sol la la,
    sib2. do4 re2

    %34
    mi! fad1\mbreak
    sol2 sol,4 la sib2
    do re1

    %37
    sol2 sol,4\p la sib2
    do re1
    sol,1.

}

IVbcn = \relative do {

    sol1 sol'2
    mi! fad1
    sol1 mib2

    %4
    do2 dod1
    re re2
    si dod1

    %7
    re1.
    mib\mbreak
    re\fermata

    %10
    sib1 sib'2
    sol la1
    sib sol2

    %13
    mib2 mi1
    fa fa2
    re mi1

    %16
    fa fad2
    sol1 fa!2\mbreak
    mi! do mi

    %19
    fa1 mib2
    re sib re
    mib1 sol,2

    %22
    lab sib si
    do1 mib2
    fa sol sold

    %25
    la1 do,2\mbreak
    re mi1
    la1 sol2

    %28
    fad re fad
    sol1 fa!2
    mi! do mi

    %31
    fa1 fa,2
    sol la1
    sib2. do4 re2

    %34
    mi! fad1\mbreak
    sol2 sol,4 la sib2
    do re1

    %37
    sol2 sol,4\p la sib2
    do re1
    sol,1.

}

IVbfn = \figures {

    \bassFigureExtendersOff

    s1.
    <6 5->2 <5->1
    <9>2 <8> <5>
    <6 5> <6 5-> s
    <4> <3+> <_->
    <6 5-> <5-> <6>
    <9 _-> <8> <_+>
    <7> <6> s
    <_+>1.
    s
    <5>2 <5-> s
    <9> <8> <3>
    <6 5> <6 5-> s
    <4> <3> <_->
    <6 5-> <5> <6>
    <9> <8> <6 5->
    <9 > <8> <6 4>
    <6 5-> s s
    <9 _-> <8> s
    <6 5-> s s
    <9 > <8> <6->
    <6 5> <5> <6 5->
    <9 _-> <8> <6>
    <6 5> <_+> <6 _->
    <9> <8> <6>
    <6+ 5> <_+> s
    s1 <6 4>2
    <6 5-> s s
    <9> <8> <6 4>
    <6 5-> s s
    <9> <8> <6>
    <6- 5> <5-> <6>
    <9> <8> <6>
    <6 5-> <5-> <6>
    <9> <8> <6>
    <6 5> <_+> s
    s s <6>
    <6 5> <_+>1
    <_+>

}


forma = {

    \time 3/2
    \tempo 1 = 40
    \key fa\major
    s1.*39
    \bar "||"

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

    sol4 sib8 do re16 do re8
    sol, sol'4~sol8 fad16 mi fad8
    sol4. la

    %4
    sib la
    sol8 sol, sib do re16 do re8
    sol, sol'4~\mbreak sol8 fa?16 mi fa8~

    %7
    fa mi16 re mi8~mi re16 do re8~
    re dod16 sib dod8 re4.
    r re4 fa8

    %10
    sol la16 sol la8 re, sib'16 la sib8\mbreak
    mi, la16 sol la8 re,4 re8~
    re dod16 sib dod8 re4 la'8

    %13
    sol4 la8 fa4 sol8
    mib4 fa8 re4.
    do re8 fa16 mib re8

    %16
    do4 do8\mbreak re fa16 mib re8
    do4. re4 re8
    do8. do16 re do sib8. sib16 do sib

    %19
    la4. sib16 do sib[do re8]
    do la8. la16 sib4 sol8
    la4. sib\mbreak

    %22
    do8. do16 re do sib8. sib16 do sib
    la4 la8 sib la la
    fa re'8. re16 mi4.

    %25
    re8 re, fa sol la16 sol la8
    re, re'4~re8 dod16 sib dod8\mbreak
    re4. mi

    %28
    fa r
    R2.*2
    r8 fa4~fa8 mib16 re mib8~

    %32
    mib re16 do sib8 do4.
    re r\mbreak
    r8 sib re mib fa16 mib fa8

    %35
    sib, re8. re16 la4.
    sib la
    r8 sol sib do re16 do re8

    %38
    sol,16 la sib do re8 dod re4
    mi4.\mbreak fa4 fa8
    sol8. sol16 lab sol fa8. fa16 sol fa

    %41
    mib8. mib16 fa mib re8 re8. re16
    mi!8 fa4~fa8 mi16 re mi8
    fa8. fa16 sol fa\mbreak mib8. mib16 fa mib

    %44
    re8. re16 mib re do8. do16 re do
    sib8. sib16 do sib la4 la8
    sib8.\p fa'16 sol fa mib8. mib16 fa mib

    %47
    re8. re16 mib re\mbreak do8. do16 re do
    sib8. sib16 do sib la4 la8
    sib8. sib16 do sib la4 la8

    %50
    si4. r\fermopz

}


VvlIIn = \relative do'' {

    R2.
    sol4. la
    sib8 sol sol'~sol fad16 mi fad8\mbreak

    %4
    sol sol, sib do re16 do re8
    sol,4. la
    sib8 sib'8. sib16 la4.

    %7
    sol fa
    mi re
    mi fa8 re4

    %10
    mi4. fa
    sol8 mi4\mbreak fa4.
    r r8 fa4~

    %13
    fa8 mi4~mi8 re4~
    re8 do4~do8 sib re
    mib fa16 mib fa8 sib,4 sib8~

    %16
    sib la16 sol la8 sib re16 do sib8\mbreak
    do4. sib
    R2.

    %19
    r4. sol4 sib8
    do re16 do re8 sol, sol'4~
    sol8 fad16 mi fad8 sol re16 do sib8

    %22
    la4. sol
    fa mi\mbreak
    re4 fa8 sol la16 sol la8

    %25
    re,4. r
    re' mi
    fa8 re4~re8 dod16 sib dod8

    %28
    re sib'!16 la sib8 sol la16 sol la8
    re, sib16 la sol8\mbreak la4.
    si8 do4~do8 sib16 la sib8~

    %31
    sib la16 sol fa8 sol4.
    la8 sib4~sib8 la16 sol la8
    sib4. do

    %34
    re r
    r8 sol, sib\mbreak do re16 do re8
    sol, sol'4~sol8 fad16 mi fad8

    %37
    sol4. r\mbreak
    r8 sol4~sol8 fa?16 mi re8~
    re dod16 sib dod8 re8. mi16 fa8~

    %40
    fa mib16 re mib8~mib re16 do re8~
    re do16 si do8~do sib16 la sib8~\mbreak
    sib la16 sol la8 sol4 sol8

    %43
    la re4~re8 do16 sib do8~
    do sib16 la sib8~sib la16 sol la8~
    la sol16 fad sol8~sol fad16 mi fad8\mbreak

    %46
    sol\p re'4~re8 do16 sib do8~
    do sib16 la sib8~sib la16 sol la8~
    la sol16 fad sol8~sol fad16 mi fad8

    %49
    sol sol4~sol8 fad16 mi fad8
    sol4. r\fermopz

}


Vvlan = \relative do' {

    R2.
    sol4 sib8 do re16 do re8
    sol,4. r

    %4
    sol' la
    sib4 sol8~sol fad16 mi fad8
    sol4. r

    %7
    R2.
    r4. re4 fa8\mbreak
    sol la16 sol la8 re,4 re8~

    %10
    re dod16 sib dod8 re4.~
    re8 dod4 re4.
    mi fa8 fa16 mi fa8

    %13
    re mi16 re mi8 do re16 do re8\mbreak
    sib do16 sib do8 fa4 sib,8
    do4 fa8 re4.

    %16
    r sib4 re8
    mib fa16 mib fa8 sib, sib'4~
    sib8 la16 sol la8~la sol16 fad sol8~\mbreak

    %19
    sol fad16 mi fad8 sol4.
    la sol8 sol, sib
    do re16 do re8 sol, sol'4~

    %22
    sol8 fa?16 mi fa8~fa mi16 re mi8~
    mi re16 do re8~\mbreak re dod16 sib dod8
    re4. r

    %25
    R2.
    re4 fa8 sol la16 sol la8
    re,4. r

    %28
    re mi
    fad8 sol4~sol8 fa16 mi fa8~\mbreak
    fa8 mib16 re do8 re4.

    %31
    do4 do8 re do4
    do8 re4 sol8 fa4
    fa8 sib4~sib8 la16 sol la8

    %34
    sib4. do4 do,8
    re sib4 la re8\mbreak
    re4. r

    %37
    sol la
    sib4 sib8 mi,! fa4
    sib8 la4 la la8

    %40
    re, r do do r sol'
    sol4 fa8 fa re4
    do do8 re do4\mbreak

    %43
    do8 r re sib r fa'
    fa r sib sol r re
    re r sol mib r re

    %46
    re\p r re sib r fa'
    fa r sib\mbreak sol r re
    re r sol mib r re

    %49
    re r sol mib r re
    re4. r\fermata

}


Vvcn = \relative do {

    R2.*2
    sol'4 sib8 do re16 do re8
    sol, sol4~sol8 fad16 mi fad8\mbreak

    %5
    sol4. r
    sol4 sib8 do re16 do re8

    %7
    sib do16 sib do8 la8 sib16 la sib8
    sol8 la16 sol la8  re, re'4~
    re8 dod16 sib dod8 re4.

    %10
    R2.
    r4. re,4 fa8
    sol la16 sol la8 re, re'16 do? re8

    %13
    sib do16 sib do8 la8 sib16 la sib8
    sol8 la16 sol la8 sib8 sib4~
    sib8 la16 sol la8\mbreak sib8 sib, re

    %16
    mib fa16 mib fa8 sib, sib'4~
    sib8 la16 sol la8 sib sib16 la sol fa
    mi!8 fad16 mi fad8 sol8 sol, sib

    %19
    do re16 do re8 sol, sol'4~
    sol8 fad16 mi fad8 sol4.
    R2.*2

    %23
    r8 re fa sol la16 sol la8
    re, re'4~re8 dod16 sib dod8

    %25
    re4. r
    R2.
    re,4 fa8 sol la16 sol la8

    %28
    re, re'4~re8 dod16 sib dod8
    re8 sol, sib do? re16 do re8
    sol, do, mib fa sol16 fa sol8

    %31
    do, fa la sib do16 sib do8\mbreak
    fa, sib, re mib fa16 mib fa8
    sib,4 re8 mib fa16 mib fa8

    %34
    sib, sib'4~sib8 la16 sol la8~
    la8 sol16 fad sol8~sol8 fad16 mi fad8
    sol8 sol, sib do re16 do re8

    %37
    sol, sol'4~sol8 fad16 mi fad8
    sol8 sol16 la sib8 la re, fa?
    sol la16 sol la8 re, re'16 do re8

    %40
    sib do16 sib do8 la8 si16 la si8
    do8 lab16 sol lab8 fa8 sol16 fa sol8
    do,8 fa16 mi fa8 sib,8 do16 sib do8

    %43
    fa sib16 la sib8 sol la16 sol la8
    sib sol16 fa sol8 mi! fad16 mi fad8
    sol mib16 re mib8 do re16 do re8

    %46
    sol\p sib16 la sib8 sol la16 sol la8
    sib sol16 fa sol8 mi! fad16 mi fad8
    sol mib16 re mib8 do re16 do re8

    %49
    sol, mib'16 re mib8 do re16 do re8
    sol,4. r\fermopz

}

Vbcn = \relative do {

    \clef violin\key fa\major sol''4 sib8 do re16 do re8
    \clef alto\key fa\major sol,,4 sib8 do re16 do re8
    \clef bass\key fa\major sol,,4 sib8 do re16 do re8

    %4
    sol, sol'4~sol8 fad4\mbreak
    sol4. r
    sol,4 sib8 do re16 do re8

    %7
    sib do4 la8 sib4
    sol8 la4 re8 re4~
    re8 dod4 re8 \clef tenor \key fa\major re'4~

    %10
    re8 dod16 sib dod8\mbreak re4.~
    re8 dod4\clef bass\key fa\major re,4 fa8
    sol la16 sol la8 re,4 re8

    %13
    sib do4 la8 sib4
    sol8 la4 sib8 sib'4~
    sib8 la4\mbreak sib8 sib, re

    %16
    mib fa16 mib fa8 sib, sib'4~
    sib8 la4 sib sib,8
    mi! fad4 sol8 sol, sib

    %19
    do re16 do re8 sol, sol'4~
    sol8 fad4\mbreak sol8 \clef alto\key fa\major sol sib
    do re16 do re8 sol, sol'4~

    %22
    sol8 fa16 mi fa8~fa mi16 re mi8
    \clef bass\key fa\major re,4 fa8 sol la16 sol la8\mbreak
    re, re4~re8 dod4

    %25
    re8\clef violin\key fa\major re' fa sol la16 sol la8
    \clef alto\key fa\major re,4 fa8 sol la16 sol la8
    \clef bass\key fa\major re,,4 fa8 sol la16 sol la8\mbreak

    %28
    re, re4~re8 dod4
    re8 sol, sib do? re16 do re8
    sol, do mib fa sol16 fa sol8

    %31
    do, fa, la sib do16 sib do8\mbreak
    fa, sib re mib fa16 mib fa8
    sib,4 re8 mib fa16 mib fa8

    %34
    sib, sib'4~sib8 la4~
    la8 sol4~sol8 fad4
    sol8 sol, sib do re16 do re8\mbreak

    %37
    sol, sol'4~sol8 fad4
    sol8. la16 sib8 la re, fa?
    sol la16 sol la8 re,4 re8

    %40
    sib do4 la8 si4
    do8 lab4 fa8 sol4\mbreak
    do8 fa4 sib,8 do16 sib do8

    %43
    fa sib16 la sib8 sol la16 sol la8
    sib sol16 fa sol8 mi! fad16 mi fad8
    sol mib16 re mib8\mbreak do re16 do re8

    %46
    sol\p sib16 la sib8 sol la16 sol la8
    sib sol16 fa sol8 mi! fad16 mi fad8
    sol mib16 re mib8 do re16 do re8\mbreak

    %49
    sol, mib'16 re mib8 do re16 do re8
    sol,4. r\fermata

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s4 <6>8 <6 5> <_+> s
    s4 <6>8 <6 5> <_+> s
    s4. <2>8 <6>4
    s2.
    s4 <6>8 <5> <_-> s
    <6> s4 <5>8 s4
    <6 5>8 <_+>4 s4.
    <2>8 <6>4 s4.
    <2>8 <6>4 <5>8 <6->4
    <2>8 <6>4 s <6>8
    <6 5>8 <_+>4 s4.
    <6 5>8 <5> <6> <5> <5> <6>
    <6- 5> <5-> <6> <9> <8>4
    s8 <6>4 s4.
    <6 5>2.
    <2>8 <6>4 s4.
    <6 5->8 <5-> <6> <9> <8>4
    <6 5>8 <_+>4 s4.
    <2>8 <6>4 s4.
    <6 5>8 <_+>4 s4.
    <2>8 <5> <6> <2> <5> <6>
    <9> <8> <6> <6 5> <_+> s

    %24
    s4. <4 2>8 <6>4
    s2.
    s4 <6>8 <6 5> <_+> s
    s4. <6 5>8 <_+> s
    s8 <6>4 <2>8 <6>4
    <_+> <6>8 <6 5> <_-> s
    <7- _+>4. <6 5>8 <_-> s
    <7- _->4 <6>8 <6 5> <_-> s
    <7->4 <6>8 <5>4.
    s4 <6>8 <6 5>4.
    s <2>8 <6>4
    <2>8 <5>4 <2>8 <6>4
    s4. <6 5>8 <_+> s
    s4. <2>8 <6>4
    s4. <7>8 <_-> <6>
    <6 5>8 <_+> s <_->4.
    <6 5>8 <5> <6> <6 5-> <5-> <6>
    <9> <5> <6> <6 5> < _-> s
    <7->4. <6 5>
    s <6- 5>8 <5-> <6>
    <9>4. <6 5->8 <5-> <6>
    <9>4. <6 5>8 <_+> s
    s4. <6- 5>8 <5-> <6>
    <9>4. <6 5->8 <5-> <6>
    <9>4. <6 5>8 <_+> s
    s8 <5> <6> <5> <_+>  s
    <_+>

}


forma = {

    \time 6/8
    \tempo 2. = 35
    \key fa\major
    s2.*50
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

    fa4 r8 fa fa4 r8 fa\mbreak
    fad4 r8 fad sol4 r8 sol
    fa!4 r8 fa mib4 r8 mib

    %4
    re4 r8 re do4 r8 do
    sib4 r8 sib! sib4 r8 la\mbreak
    lab4 r8 sol fa4 r8 fa'

    %7
    sol4 r8 lab lab4 r8 sol
    sol4 r8 fa fa4 r8 mib
    mib4 r8 re do4 r8 do

    %10
    do4 r8 sib\mbreak sib4 r8 la
    sib4 r8 sib sib4 r8 la
    sib4 r4 r2\fermopz

}


VIvlIIn = \relative do'' {

    re4 r8 re do4 r8 re
    do4 r8 do sib4 r8 mib
    mib?4 r8 re re4 r8 do

    %4
    do4 r8 si\mbreak si4 r8 la
    la4 r8 reb do4 r8 do
    re!4 r8 mib mib4 r8 re

    %7
    reb4 r8 do sib4 r8 sib
    lab4 r8 lab'\mbreak sol4 r8 sol
    fa4 r8 sib, sib4 r8 la

    %10
    re?4 r8 reb do4 r8 do
    re!4 r8 reb do4 r8 do
    re!4 r r2\fermopz

}


VIvlan = \relative do' {

    sib4 r8 sib do4 r8 fa\mbreak
    do4 r8 la sib4 r8 sib
    do4 r8 re sol4 r8 do,

    %4
    la4 r8 si mi4 r8 fa
    fa4 r8 sol do,4 r8 fa
    fa4 r8 mib\mbreak fa4 r8 sib

    %7
    sol4 r8 mib mib4 r8 sol
    do,4 r8 re sol4 r8 do,
    fa4 r8 fa fa4 r8 fa

    %10
    fa4 r8 sol do,4 r8 fa\mbreak
    fa4 r8 sol do,4 r8 fa
    fa4 r r2\fermata

}



VIvcn = \relative do {

    sib'4 r8 sib la4 r8 sib
    la4 r8 re, sol4 r8 sol,\mbreak
    la4 r8 si do4 r8 lab'

    %4
    fad4 r8 sold la?4 r8 fa?
    re4 r8 mi! fa4 r8 fa,
    sib4 r8 mib\mbreak sib4 r8 sib

    %7
    mib4 r8 lab mib4 r8 mi
    fa4 r8 si, do4 r8 la!
    sib4 r8 sib fa'4 r8 fa,\mbreak

    %10
    sib4 r8 mi! fa4 r8 fa,
    sib4 r8 mi fa4 r8 fa,
    sib4 r r2\fermopz

}

VIbcn = \relative do {

    sib'4 r8 sib la4 r8 sib
    la4 r8 re, sol4 r8 sol,\mbreak
    la4 r8 si do4 r8 lab'

    %4
    fad4 r8 sold la?4 r8 fa?
    re4 r8 mi! fa4 r8 fa,
    sib4 r8 mib\mbreak sib4 r8 sib

    %7
    mib4 r8 lab mib4 r8 mi
    fa4 r8 si, do4 r8 la!
    sib4 r8 sib fa'4 r8 fa,\mbreak

    %10
    sib4 r8 mi! fa4 r8 fa,
    sib4 r8 mi fa4 r8 fa,
    sib4 r r2\fermopz

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6+>4 s8 <7 _+> s4 s8 <6->
    <6- 5>4 s8 <5-> <9 _->4 s8 <5>
    <6 5->4 s8 <5-> <9>2
    <6- 5>4 s8 <7- 5-> <4>4 s8 <3>
    <7->2 <4->4 s8 <3>
    <7->2 <4>4 s8 <3>
    <9 _->4 s8 <7- 5-> <5 4>4 s8 <7 5->
    <4->4 s8 <3> <4>4 s8 <3>
    <9>4 s8 <7- 5-> <4>4 s8 <3>
    <_!>4 s8 <7- 5-> <4>4 s8 <3>

}


forma = {

    \time 4/4
    \tempo 4 = 55
    \key fa\major
    s1*12
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

    re4. do8 sib la
    sol4 mib'4. mib8
    re sol sib la sol4~\mbreak

    %4
    sol8 sol fad la sol la
    sib sol sib la sol4~
    sol8 fa la sol fa sol

    %7
    mi?4. mi8 la sol
    fa4 r r
    R2.

    %10
    la,4 r8 la re do\mbreak
    sib8 sib mib re do4~
    do8 sib sol' fad sol re

    %13
    \parenthesize do4. \parenthesize do8\parenthesize re\parenthesize do
    \parenthesize sib4. sib8 do sib
    la4. sol8 fa4

    %16
    mi4. mi'8 la sol
    fa4. fa8 sol4~
    sol8 fad sol la sib4\mbreak
    R2.

    %20
    re,4. do8 sib la
    sol4 re''4. do8
    sib4 r sib

    %23
    la r la
    sol r sol
    fa r fa

    %26
    mib r mib
    re r re\mbreak
    do4. do8 fa mib

    %29
    re re sol fa mib4~
    mib8 re fa mib? re4
    mib r8 sol, do sib

    %32
    la4 fa'8 mib re do
    sib4 sol'4. sol8
    la fa la sol fa4\mbreak
    mib4. do8 fa mib?

    %36
    re4. re8 sol fa
    mib4 mib2~
    mib4 re8 do sib la

    %39
    sib4 sib'2~
    sib4 la8 sol fa mi?
    fa4. mib8 sol fa

    %42
    mib4 r mib\mbreak
    re r re
    do r do

    %45
    sib r sib
    la la4. la8
    sib4. re8\p sol fa

    %48
    mib4 r mib
    re r re\mbreak
    do r do

    %51
    sib r sib
    la  r la
    sib r sib

    %54
    la r la
    si r r\fermopz

}


VIIvlIIn = \relative do'' {

    R2.*3
    re4. do8 sib la
    sol4 mib'4. mib8

    %6
    re re fa mi? re4~
    re8 re dod mi re mi
    fa re fa mi re4~\mbreak

    %9
    re8 do? re do sib do
    la2 sib4
    R2.

    %12
    re4. do8 sib4
    la4. la8 sib la
    sol4. sol8 la sol

    %15
    fa4 re re'~
    re8 re dod mi re mi\mbreak
    fa mi re4. re8

    %18
    do do re do sib sol
    la4. la8 re do
    sib4 r r

    %21
    re'8 do sib4 la~
    la8 sol sib la sol4~
    sol8 mi la sol fa4~\mbreak

    %24
    fa8 re sol fa mib4~
    mib8 do fa mib? re4~
    re8 sib mib re do4~

    %27
    do8 sib re do sib4~
    sib8 sib la sol la4
    sib2 r4

    %30
    R2.\mbreak
    do4. sib8 la sol
    fa4 re'8 do sib la

    %33
    sol4. sol8 do sib
    la2 sib4~
    sib la4. la8

    %36
    sib4 r re~
    re do4. sib8
    la4 la2~\mbreak

    %39
    la4 sol4. fa8
    mi!4 mi'2~
    mi4 re re

    %42
    re r do
    do r sib
    sib r la

    %45
    la r sol
    sol r fad\mbreak
    sol re'2\p

    %48
    re4 r do
    do r sib
    sib r la

    %51
    la r sol
    sol r fad
    sol r sol

    %54
    sol r fad
    sol r r\fermopz

}


VIIvlan = \relative do' {

    R2.*6
    la'4. sol8 fa mi
    re4 sib'4. sib8

    %9
    la la sib la sol4~
    sol8 sol fad la sol la
    sib4 r8 sib la sol

    %12
    fad sol sol la re,4\mbreak
    mi r fa
    sol r do,

    %15
    fa4. sol8 la4
    la2 r4
    R2.*2

    %19
    r4 re,8 do sib la
    sol sol' fad la re do
    sib la sol4 re\mbreak

    %22
    re4 r8 fad sol fad
    do4 r8 re fa mib
    re4 r8 do mib re

    %25
    do4 r8 sib re do
    sib4 r8 sib do la
    re4 r8 la' sib la\mbreak

    %28
    sol4 fa fa
    fa r8 fa do' sib
    la4 r8 mib sol fa

    %31
    mib4 fa r8 sol
    la sol fa4. fa8
    sol4 do8 sib la sol

    %34
    fa4. mib8 re4\mbreak
    mib fa4. fa8
    fa mib? re4. re8

    %37
    sol fa mib re do4
    la'8 sol fa mi? re4
    re'8 do sib la sol4~

    %40
    sol r la8 sol
    fa4 la4. la8\mbreak
    sib4 r8 la do sib

    %43
    la4 r8 sol sib la
    sol4 r8 fad la fad
    sib4 r8 la sol fa?

    %46
    mib4 re4. re8
    re4 r r
    re\p r8 la' do sib\mbreak

    %49
    la4 r8 sol sib la
    sol4 r8 fad la fad
    sib4 r8 la sol fa!

    %52
    mib4 re4. re8
    re4 r8 la' sol fa
    mib4 re4. re8

    %55
    re4 r r\fermata

}



VIIvcn = \relative do {


    R2.*9
    re4. do8 sib la
    sol4 mib'4. mib8
    re sol sib la sol4~

    %13
    sol8 mi? la sol fa4~
    fa8 re sol fa mi4~
    mi8 do fa mi re4\mbreak

    %16
    la'4. sol8 fa mi
    re4 sib'4. sib8
    la la sib8 la sol4~

    %19
    sol8 sol fad la sol8 la
    sib4. la8 sol4
    sol,4. sol'8 fad4\mbreak

    %22
    sol4. re'8 mib re
    do4. sib8 re do
    sib4. la8 do sib

    %25
    la4. sol8 sib la
    sol4. sol8 la fa\mbreak
    sib4. la8 sol fa

    %28
    mib4 fa8 mib re do
    sib4 sol'4. sol8
    fa sib8 re do sib4~

    %31
    sib8 sib la8 sol do do,
    fa4 r fa~
    fa4 mib mib~

    %34
    mib4 re4. re8
    do4 fa8 mi re do
    sib4 si2

    %37
    do4 do'8 sib la sol
    fad2.
    sol4. fa?8 mib re

    %40
    dod2.
    re4  re'8 do sib la
    sol4. fa8 la sol

    %43
    fad4. mi8 sol fad
    mi!4. re8 fad re
    sol4. fa!8 mib re

    %46
    do4 re re,
    sol r r\mbreak
    sol'4. \p fa8 la sol

    %49
    fad4. mi!8 sol fa?
    mi4. re8 fad re
    sol4. fa!8 mib re

    %52
    do4 re re,
    sol'4. fa8 mib re\mbreak
    do4 re re,

    %55
    sol r r\fermopz

}

VIIbcn = \relative do {

    \clef violin\key fa\major re''4. do8 sib la
    sol4 mib'4. mib8\mbreak
    re sol sib la sol4

    %4
    re4. do8 sib la
    sol4 mib'4. mib8
    re re fa mi? re4

    %7
    \clef alto\key fa\major la4. sol8 fa mi
    re4 sib'4. sib8
    la la sib la sol4\mbreak

    %10
    \clef bass\key fa\major re,4. do8 sib la
    sol4 mib'4. mib8
    re sol sib la sol4~

    %13
    sol8 mi? la sol fa4~
    fa8 re sol fa mi4~
    mi8 do fa mi re4\mbreak

    %16
    la'4. sol8 fa mi
    re4 sib'4. sib8
    la4 sib8 la sol4~

    %19
    sol fad sol8 la
    sib4. la8 sol4
    sol,4. sol'8 fad4\mbreak

    %22
    sol4. \clef tenor \key fa\major re'8 mib re
    do4. sib8 re do
    sib4. la8 do sib

    %25
    la4. sol8 sib la
    \clef bass\key fa\major sol4. sol8 la fa\mbreak
    sib4. la8 sol fa

    %28
    mib4 fa8 mib re do
    sib4 sol'4. sol8
    fa4 sib,8 do sib4~

    %31
    sib la8 sol do4
    fa fa2~
    fa4 mib2~\mbreak

    %34
    mib4 re2
    do4 fa8 mi re do
    sib4 si2

    %37
    do4 do'8 sib la sol
    fad2.
    sol4. fa?8 mib re

    %40
    dod2.
    re4 re2\mbreak
    sol4. fa8 la sol

    %43
    fad4. mi8 sol fad
    mi!4. re8 fad re
    sol4. fa?8 mib re

    %46
    do4 re re,
    sol r r\mbreak
    sol'4.\p fa8 la sol

    %49
    fad4. mi!8 sol fa?
    mi4. re8 fad re
    sol4. fa?8 mib re

    %52
    do4 re re,
    sol'4. fa8 mib re\mbreak
    do4 re re,

    %55
    sol r r\fermopz

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*3
    <4>4 <3+> s
    s2.
    <4>8 <3> s2
    <4>4 <3+> <6>8 <6+>
    s2.*2
    <4>4 <3+> s
    s <5> s8 <6>
    <7 _+> <_-> <6> <6+> s4
    <4 2>4 s <6>8 <5>
    <4 2>4 s <6>8 <5>
    <4 2>2.
    <4>4 <3+> <6>8 <6+>
    s4 <5> s8 <6>
    <7> <6+> <6> <6+> s4
    <2> <6> s
    <6>2.
    s2 <6>4
    <9>8 <8>4 <_+>8 s4
    <6 5> s8 <6> <_->4
    <6 5> s8 <6> <_->4
    <6 5->4 s8 <6-> s4
    <6- 5>2 <5->4
    <9>8 <8> s2
    <6 5>2.
    s4 <5> s8 <6->
    <7> <6> s2
    <4- 2>4 <6> <_!>
    s <6>2
    <2>4 <5> <6>
    <4 2> <5> <6>
    <7 _->2.
    s4 <5-> <6>
    <9>4 <8> s
    <7->4 <6> s
    <9> <8> s
    <7-> <6> s
    <9> <8> s
    <6- 5>2 <5->4
    <5->2.
    <6 5->2 <5->4
    <9> <8> s
    <6 5>4 <_+> s
    s2.
    <6- 5>2 <5->4
    <6 5->2 <5>4
    <6 5->2 <5->4
    <9> <8> s
    <6 5> <_+> s
    <_->2.
    <6 5>4 <_+> s
    <_+>

}


forma = {

    \time 3/4
    \tempo 2 = 65
    \key fa\major
    s2.*55
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
        title = \markup\smaller{Sinfonia da Chiesa n. 3 op. V}
        composer = \markup \center-column{"G. Bononcini (1670 - 1747)"}

    }

    \markup \huge {[I.1] Allegro}

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

    \markup \huge {[I.2] Grave}

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

    \markup \huge {[I.3] Allegro}

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
        title = \markup\smaller{Sinfonia da Chiesa n. 4 op. V}
        composer = \markup \center-column{"G. Bononcini (1670 - 1747)"}

    }

    \markup \huge {[II.1] Grave}

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

    \markup \huge {[II.2] Allegro}

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

    \markup \huge {[II.3] Adagio}

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

    \markup \huge {[II.4] Non tanto presto}

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

