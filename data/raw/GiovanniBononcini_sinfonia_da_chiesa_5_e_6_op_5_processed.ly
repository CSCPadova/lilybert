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

    si4 fad'dod
    re4. dod8 si4
    lad2.\fermata

    %4
    re4 la' mi
    fad4. mi8 re4
    dod2 r4

    %7
    fad2 mi4
    re2 re4\mbreak
    dod2 dod4

    %10
    si2 si4
    la la' si8 la
    sol2 sol4

    %13
    fad2 fad4
    mi mi4. mi8
    fad4. mi8 re4

    %16
    dod2 re8 dod
    si2 si4
    la2 re4~\mbreak

    %19
    re dod8 si dod4~
    dod si fad'~
    fad mi8 re mi4~

    %22
    mi re4. re8
    dod4 dod4. dod8
    re4 dod4. dod8

    %25
    si2.

}


IvlIIn = \relative do'' {

    re4 r fad
    si, r mi
    fad2.\fermata

    %4
    fad4 r la
    re, r sold,
    la mi'2~

    %7
    mi4 mi8 re dod4~\mbreak
    dod si2~
    si4 la2~

    %10
    la4 sol2~
    sol4 fad fad'~
    fad mi2~

    %13
    mi4 re2~
    re4 dod8 si dod4~
    dod si2~

    %16
    si4 la2~
    la4 sol2~\mbreak
    sol4 fad fad'

    %19
    mi2 fad8 mi
    re2 dod4
    si2 si4

    %22
    lad si si~
    si lad8 sold? lad4
    si lad8 sold? lad4

    %25
    si2.

}


Ivlan = \relative do' {

    fad4 r fad
    fad r sol
    dod,2.\fermata

    %4
    re4 r mi
    la r si
    mi,4. fad8 mi re

    %7
    dod2 fad4\mbreak
    fad2.
    sol4 fad2~

    %10
    fad4 sol8 fad mi4~
    mi fad4. fad8
    si,2 dod4

    %13
    dod2 si4~
    si la2
    la4 re8 dod si la

    %16
    sol4 la2
    re4 sol4. fad8\mbreak
    mi4 fad4. mi8

    %19
    si4 dod2
    fad4 re la
    si2.

    %22
    dod4 re8 dod si la
    sol4 fad2
    fad4 fad'2

    %25
    fad2.

}

Ivcn = \relative do {

    si'2 lad4
    si4. la?8 sol4
    fad2.\fermata

    %4
    re2 dod4
    re4. dod8 si4
    la2 r4

    %7
    lad'2.
    si4. la8 sol fad\mbreak
    mi4 fad4. mi8

    %10
    red4 mi4. re?8
    dod4 red2
    mi4. re?8 dod si

    %13
    lad4 si si'8 la?
    sol4 la la,
    re2 sol8 fad

    %16
    mi4 fad2\mbreak
    sol4. fad8 mi re
    dod4 re'8 dod si la

    %19
    sold4 lad2
    si4 si la?
    sol2.

    %22
    fad4 si8 la sol fad
    mi4 fad fad,
    si fad'2

    %25
    si,2.

}

Ibcn = \relative do {

    si2 lad4
    si4. la?8 sol4
    fad2.\fermata

    %4
    re'2 dod4
    re4. dod8 si4
    la2 r4

    %7
    lad2.
    si
    mi4 fad2

    %10
    red4 mi2
    dod4 red2
    mi2.

    %13
    lad,4 si2
    sol4 la?2
    re sol4

    %16
    mi fad2
    sol4. fad8 mi re
    dod4 re2\mbreak

    %19
    sold,4 lad2
    si la?4
    sol2.

    %22
    fad4 si2
    mi4 fad2
    si,4 fad'2

    %25
    si,2.

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s2 <6>4
    s4. <6>8 <6>4
    <_+>2.
    s2 <6>4
    s4. <6>8 <6+>4
    s2.
    <5->
    <9>4 <8> s
    <5>4 <_->2
    <5->4 <_->2
    <5->4 <5-> <6>
    <9> <8>  s
    <5-> <9> <8>
    <6 5>2.
    <7>4 <6> s
    <6 5> <5> <6>
    <9> <8> s
    <6 5->2.
    <6 5->4 <5-> <6>
    <9> <8> <6>
    <7> <6> s
    <7 _+> <_->2
    <6 5>4 <_+>2
    s4 <_+>2

}


forma = {

    \time 3/4
    \tempo 4 = 55
    \key re\major
    s2.*25
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

    r8 fad sol fad8. mi16 re8
    mi fad4 si,8 si'4~
    si8 la16 sol fad8~fad mi16 re mi8~

    %4
    mi re16 dod re8 dod4 dod8
    si4 mi8~mi re16 dod re8\mbreak
    dod4 dod8 re4.

    %7
    R2.
    r8 si re mi fad4
    si,8 dod16 re mi8 ~mi re16 dod re8

    %10
    dod4 dod8 re8. dod16 si8
    dod4. si\mbreak
    dod8 la re mi4 la8

    %13
    mi4 mi8 fad4.
    R2.
    r8 la si la8. sol16 fad8

    %16
    sol la4 re,8 re4~
    re8 dod16 si la8~la sol4~
    sol8 fad4\mbreak mi mi8

    %19
    re4. r
    r r8 mi' fad
    re8. dod16 si8 dod fad4

    %22
    si,4. r
    r fad'16 mi re dod si8
    dod4 dod8 re sol16 fad mi re\mbreak

    %25
    dod8 fad4 si,8 mi16 re dod si
    la8 re4 sol,8 dod16 si la sol
    fad8 si si'~si la4~

    %28
    la8 sol4~sol8 fad4
    mi mi8 fad  si16 la sol fad\mbreak
    mi4. r8 sol16 fad mi re

    %31
    dod4. r8 mi16 re dod si
    la4 re8~re dod la'16 sol
    fad4. mi

    %34
    re dod4 fad8
    mi mi fad16 mi\mbreak re4 re8
    dod4 dod8 si4.

    %37
    R2.
    r8 si re dod8. si16 la8
    si dod4 fad,8 si4~

    %40
    si8 lad16 sold? lad8 si4.
    R2.
    r8 si re mi fad4\mbreak

    %43
    re4. dod~
    dod8 si4~si8 lad16 sold? lad8
    si4. r\fermopz

}


IIvlIIn = \relative do'' {

    R2.
    r4. r8 si re
    dod8. si16 la8 si dod4

    %4
    fad,8 si4\parenthesize ~ si8 lad16 sold? lad8
    si8. si16 dod si lad4 si8
    si lad16 sold? lad8\mbreak si16 dod re mi fad8

    %7
    mi8 dod fad sold4 sold8
    lad si16 lad sol? fad mi8. re16 dod8
    si4. r

    %10
    r r8 re fad
    mi8. re16 dod8\mbreak re mi4
    la,8 re4 dod re8~

    %13
    re dod16 si dod8 re16 mi fad sol la8
    sol mi la si4 si,8
    dod4 r8 r4.

    %16
    r r8 re fad\mbreak
    mi8. re16 dod8 re mi4
    la,8 re4~re8 dod16 si dod8

    %19
    re4 sol8~sol fad la
    mi mi8. mi16 fad4.
    fad8. mi16 re8 mi8. re16 dod8\mbreak

    %22
    red mi4~mi8 re?16 dod re8~
    re dod si~si lad si~
    si lad16 sold? lad8 si4.

    %25
    dod8 r dod re r mi
    dod r la\mbreak si r dod
    la r fad dod'4 dod8

    %28
    re4. dod4 re8~
    re dod16 si dod8 re4.
    r8 la'16 sol fad mi re4.

    %31
    r8 fad16 mi re dod si4.\mbreak
    r8 re16 dod si la si8 la16 si dod8~
    dod si4~si8 la4~

    %34
    la8 sol4~sol8 fad re'8~
    re8 dod16 si dod8~dod si16 lad si8~\mbreak
    si lad16 sold? lad8 si4 mi8~

    %37
    mi re16 dod si8~si lad16 sold? lad8
    si16 dod re mi fad8 mi4 re8
    sold,4 sold8 lad fad fad'

    %40
    dod4 dod8\mbreak si16 dod re mi fad8
    mi dod fad sold4 sold8
    lad si16 lad sol? fad mi8. re16 dod8~

    %43
    dod si4~si8 lad16 sold? lad8
    re4. dod\mbreak
    si r\fermopz

}


IIvlan = \relative do' {

    R2.*3
    r4. fad
    sol fad8. mi16 re8

    %6
    mi fad4 si,8 si'4~
    si8 la16 sol fad8~fad mi16 re mi8~
    mi re re dod4 dod'8

    %9
    re lad si lad4 si8~\mbreak
    si lad4 si4.
    R2.*2

    %13
    r4. r8 re, fad
    mi8. re16 dod8 re mi4
    la,8 fad' sol fad8. mi16 re8~

    %16
    re dod4 re4.
    R2.*2
    re4. dod4 re8~\mbreak

    %20
    re dod4 re8 dod4
    si4. r
    r8 si mi la,4.

    %23
    sol8 la si dod4 re8
    sol fad4 fad8 re4
    mi8 r la fad r sol\mbreak

    %26
    mi r fad re r mi
    dod r re sol la16 sol fad mi
    re4. r8 fad16 mi re dod

    %29
    si8 la4 la la'8
    sol r la fad r sol\mbreak
    mi r fad re r mi

    %32
    dod r re si mi4
    fad4. r8 la16 sol fad mi
    re4. r8 fad16 mi re dod

    %35
    si8 dod4 fad4.
    fad\mbreak re8. dod16 si8
    lad4 si8 dod4 dod8

    %38
    re4. r
    r fad
    sol8 fad8. mi16 re8 si'4~

    %41
    si8 la16 sol fad8~fad mi16 re mi8~\mbreak
    mi re16 dod si8 dod4 dod8
    re fad4 sol8 fad4

    %44
    fad8 fad4 sol8 fad4
    fad 4. r\fermata

}

IIvcn = \relative do {

    R2.*5
    r4. r8 si' re
    dod8. si16 la8 si dod4

    %8
    fad,8 si4~si8 lad16 sold? lad8
    si fad sol? fad8. mi16 re8
    mi fad4\mbreak si,8 si'4~

    %11
    si8 la4~la8 sol4~
    sol8 fad si la8. sol16 fad8
    sol la4 re,8 re'4~

    %14
    re8 dod16 si la8~la sold16 fad sold8\mbreak
    la4 r8 r4.
    R2.*2

    %18
    r4. la
    si la8. sol16 fad8
    sol la4 re,8 lad4

    %21
    si8 si'4~si8 la4~
    la8 sol4 fad8 si4\mbreak
    mi,8 fad sol fad8. mi16 re8

    %24
    mi fad4 si,8 si'4~
    si8 la4~ la8 sol4~

    %26
    sol8 fad4~fad8 mi4~
    mi8 re4 mi8 fad16 mi re dod
    si8 mi4\mbreak la,8 re16 dod si la

    %29
    sol8 la4 re8 re'4~
    re8 dod4~dod8 si4~
    si8 la4~la8 sol4~

    %32
    sol8 fad4 sol8 la16 sol fad mi
    re8 sol4\mbreak dod,8 fad16 mi re dod
    si8 mi4 la,8 re16 dod si la

    %35
    sold8 lad4 si4.
    fad' sol
    fad8. mi16 re8 mi fad4

    %38
    si,8 si'4~si8 la16 sol fad8~\mbreak
    fad mi4~mi8 re4
    mi8 fad4 si,8 si re

    %41
    dod8. si16 la8 si dod4
    fad8 si4~si8 lad4
    si8 si16 la? sol fad mi8 fad4

    %44
    si,8 si'16 la sol fad\mbreak mi8 fad4
    si,4. r\fermopz

}

IIbcn = \relative do {

    \clef violin \key re\major r8 fad'' sol fad8. mi16 re8
    mi fad4 si,8 si re
    dod8. si16 la8 si dod4

    %7
    fad,8 si4 \clef alto\key re\major fad4 r8
    sol4. fad8. mi16 re8\mbreak
    mi fad4 \clef bass\key re\major si,,8 si re
    dod8 . si16 la8 si dod4

    %8
    fad8 si4~si8 lad4
    si8 fad sol? fad8. mi16 re8
    mi fad4\mbreak si,8 si'4~

    %11
    si8 la4~la8 sol4~
    sol8 fad si la8. sol16 fad8
    sol la4 re,8 re'4~

    %14
    re8 dod16 si la8~la sold4
    la4 sol8 fad re re'~
    re dod4 re8 \clef violin re'4~

    %17
    re8 dod16 si la8~la sol4~
    sol8 fad4\clef bass la,4.\mbreak
    si la8. sol16 fad8
    sol la4 re,8 lad4

    %21
    si8 si'4~si8 la4~
    la8 sol4 fad8 si,4
    mi8 fad sol fad8. mi16 re8  %% fin qui OOKK fine pagina

    %24
    mi fad4 si,8 si'4~
    si8 la4~ la8 sol4~

    %26
    sol8 fad4~fad8 mi4~
    mi8 re4 mi8 fad16 mi re dod
    si8 mi4\mbreak la,8 re16 dod si la

    %29
    sol8 la4 re8 re'4~
    re8 dod4~dod8 si4~
    si8 la4~la8 sol4~

    %32
    sol8 fad4 sol8 la16 sol fad mi
    re8 sol4\mbreak dod,8 fad16 mi re dod
    si8 mi4 la,8 re16 dod si la

    %35
    sold8 lad4 si4.
    fad' sol
    fad8. mi16 re8 mi fad4

    %38
    si,8 si'4~si8 la16 sol fad8~\mbreak
    fad mi4~mi8 re4
    mi8 fad4 si,8 si re

    %41
    dod8. si16 la8 si dod4
    fad8 si4~si8 lad4
    si8 si16 la? sol fad mi8 fad4

    %44
    si,8 si'16 la sol fad\mbreak mi8 fad4
    si,4. r\fermopz

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*2
    <7>8 <6> s <5> <_->4
    <7 _+>4. <4>8 <3+> s
    s4. <7 _+>8. <6>16 <6>16 s
    \bassFigureExtendersOn <6 5> 8<5 _+>4 s4. \bassFigureExtendersOff
    s4 <6>8 <6 5> <_->4
    <7 _+>8 <_->4 <2>8 <6>4
    s8 <_+> s <7 _+>8. <6>16 <6>8
    <6 5> <_+>4 s4.
    <2>8 <5> <6> <2> <5> <6>
    <2> <6> s s4.
    <6 5> s
    <2> <2>8 <6>4
    s4. <6>
    <2>8 <6>4 s4.
    s <2>8 <6>4
    <2>8 <6>4 <4>8 <3> s
    <5>4 <6>8 <7>8 <6>16 s <6>8
    <6 5>4. s8 <5-> <6>
    s4. <2>8 <6>4
    <4+ 2>8 <6>4 <7>8 <7 _->4
    <_->4. <4>8 <3+>8 <6>8  %% Fine pagina bar 23 OOKK
    <6 5>8 <_+>4 s8 <6>4
    <2>8 <6>4 <2>8 <6>4
    <2>8 <6>4 <2>8 <6>4
    <2>8 <6>4 <6 5>8 <_->4
    <7>8 <7>4 <7>4.
    <6 5>4. s8 <6>4
    <2>8 <6>4 <2>8 <6>4
    <2>8 <6>4 <2>8 <6>4
    <2>8 <6>4 <6 5>4.
    <7>8 <7>4 <7>8 <7>4
    <7>8 <7>4 <7>8 <7>4
    <6 5->8 <5-> <6> <9> <8>4
    <4>4 <3+>8 <5>4 <6>8
    <7 _+>8 <6> <6> <6 5> <_+>4
    s4. <2>
    <2+>8 <6>4 <2>8 <6>4
    <6 5>8 <_+>4 s4.
    <7>8 <6> <6> <5> <_->4
    <7 _+>8 <_->4 <2>8 <6>4
    <9>8 <8> s <6 5> <_+>4
    <9>8 <8> s <6 5> <_+>4

}


forma = {

    \time 6/8
    \tempo 4. = 50
    \key re\major
    s2.*45
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
}


IIIvlIn = \relative do'' {

    r4 r8 fad si,4 r8 fad'
    mi16 fad re mi dod8. si16 si4 r8 fad'\p \mbreak
    si,4 r8 fad' mi16 fad re mi dod8. si16

    %4
    si4 r8 si'\f la sol16 fad mi8. mi16
    fad4 r8 la re,4 r8 la'
    sol16 la fad sol mi8. re16 \mbreak re4\parenthesize \p r8 la'

    %7
    re,4 r8 la' sol16 la fad sol mi8. re16
    re4 r8 fad si,4 r8 fad'
    si,4 r8 fad' mi16 fad re mi dod8. si16\mbreak

    %10
    si8. dod16 re8 la' si16 la sol fad mi8. mi16
    re4 r8 re dod4\p r8 dod
    si4 r8 si la4 r8 la'

    %13
    sol4 r8 sol fad4 r8 fad\mbreak
    mi4 r8 mi re4 r8 fad
    mi16 fad re mi dod8. si16 si8.\parenthesize \p dod16 re8 la'

    %16
    si16 la sol fad mi8. mi16 re4 r8 re
    dod4 r8 dod\mbreak si4 r8 si
    la4 r8 la' sol4 r8 sol

    %19
    fad4 r8 fad mi4 r8 mi
    re4 r8 fad  mi16 fad re mi dod8. si16
    si4 r8 fad'\mbreak si,4 r8 fad'

    %22
    si,4 r8 fad' mi16 fad re mi dod8. si16
    si8 fad si2 lad4
    si2 r\fermopz

}


IIIvlIIn = \relative do'' {

    si8 re dod4 r8 si lad fad
    sold16 lad si8 si8. lad16 si8\p re dod4
    r8 si lad fad \mbreak sold16 lad si8 si8. lad16

    %4
    si8 fad'\f re2 dod4
    re8 fad mi4 r8 re dod la
    si16 dod re8 re8. dod16 re8\p fad mi4\mbreak

    %7
    r8 re dod la si16 dod re8 re8. dod16
    re8 fad mi dod r re dod4\mbreak
    r8 si lad fad sold16 lad si8 si8. lad16

    %10
    si8 fad'16 mi re4~re8 re dod4~
    dod8 dod si4~si8 si\parenthesize \p la4~
    la8 la sol4~sol8 sol' fad4~\mbreak

    %13
    fad8 fad mi4~mi8 mi re4~
    re8 re dod4~dod8 dod si4~
    si lad si8\p fad'16 mi re4~

    %16
    re8 re dod4~dod8 dod si4~
    si8 si la4~la8 la sol4~\mbreak
    sol8 sol' fad4~fad8 fad mi4~

    %19
    mi8 mi re4~re8 re dod4~
    dod8 dod si2 lad4
    si8 re dod4 r8 re dod lad

    %22
    r si lad fad\mbreak sold16 lad si8 si8. lad16
    si4 r8 fad' mi16 fad re mi dod8. si16
    si2 r\fermopz

}


IIIvlan = \relative do' {

    fad4 fad r8 si, dod4
    r8 si fad'8. fad16\mbreak fad4\p fad
    r8 si, dod4 r8 si fad'8. fad16

    %4
    fad4 fad r8 si,\f mi8. mi16
    re4 r re r
    r8 si mi8. mi16 fad4\p r\mbreak

    %7
    fad r r8 si, mi8. mi16
    fad4 r fad r
    r8 si, dod4 r8 si fad'8. fad16

    %10
    fad4 r8 fad si4 r8 dod
    la4 r8 si\mbreak sol4 r8 la\parenthesize \p
    fad4 r8 sol mi4 r8 fad
    re4 r8 mi la,4  r8 la

    %14
    si4 r8 dod fad4 r8 fad
    sol sol fad8. fad16\mbreak fad4\p r8 fad
    si4 r8 dod la4 r8 si

    %17
    sol4 r8 la fad4 r8 sol
    mi4 r8 fad re4 r8 mi
    la,4 r8 la si4 r8 dod\mbreak

    %20
    fad4 r8 fad sol sol fad8. fad16
    fad4 fad r8 fad fad4
    r8 si, dod4 r8 si  fad'8. fad16

    %23
    fad4 fad r8 si, fad'8. fad16
    fad2 r\fermata

}



IIIvcn = \relative do {

    si8 si' lad fad r sol fad re
    r mi fad fad, r si'\p lad fad
    r sol fad re\mbreak r mi fad fad,

    %4
    r si re si r sol'\parenthesize \f la la,
    r re' dod la r si la fad
    r sol la la, r re'\p dod la

    %7
    r si la fad\mbreak r sol la la,
    r re' dod lad r si la fad
    r sol fad re r mi fad fad,

    %10
    si4 r8 fad' sol mi r la\mbreak
    fad re r sol mi dod r fad\parenthesize \p
    re si r mi dod la r re

    %13
    si sol r dod re4 r8 fad
    sold mi r lad\mbreak si si, r re
    mi dod fad fad, si4\parenthesize \p r8 fad'

    %16
    sol mi r la fad re r sol
    mi dod r fad re si r mi\mbreak
    dod la r re si sol r dod

    %19
    re4 r8 fad sold mi r lad
    si si, r re\mbreak mi dod fad fad,
    r si' lad fad r si lad fad

    %22
    r sol fad re r mi fad fad,
    si4 r8 re mi dod fad fad,
    si2 r\fermopz

}

IIIbcn = \relative do {

    si8 si' lad fad r sol fad re
    r mi fad fad, r si'\p lad fad
    r sol fad re\mbreak r mi fad fad,

    %4
    r si re si r sol'\parenthesize \f la la,
    r re' dod la r si la fad
    r sol la la, r re'\p dod la

    %7
    r si la fad\mbreak r sol la la,
    r re' dod lad r si la fad
    r sol fad re r mi fad fad,

    %10
    si4 r8 fad' sol mi r la\mbreak
    fad re r sol mi dod r fad\parenthesize \p
    re si r mi dod la r re

    %13
    si sol r dod re4 r8 fad
    sold mi r lad\mbreak si si, r re
    mi dod fad fad, si4\p r8 fad'

    %16
    sol mi r la fad re r sol
    mi dod r fad re si r mi\mbreak
    dod la r re si sol r dod

    %19
    re4 r8 fad sold mi r lad
    si si, r re \mbreak mi dod fad fad,
    r si' lad fad r si lad fad

    %22
    r sol fad re r mi fad fad,
    si4 r8 re mi dod fad fad,
    si2 r\fermopz

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s8 <6 5> <_+> s s2
    s s4 <_+>
    s2 s8 <5> s4
    s1*3
    s2 s4 <6>
    s2 s8 <6 5> <_+> s
    s4 s8 <6> <6 5>2
    <6 5> <6 5>
    <6 5>4 s8 <_->  <6 5->2
    <6 5>4 s8 <5-> <9>4 s8 <6>
    <6 5->4 s8 <5-> <9>4 s8 <6>
    <5>4 <_+> s s8 <6>
    <6 5>2 <6 5>
    <6 5>2 <6 5>
    <6 5>2 <6 5>4 s8 <5->
    <9>4 s8 <6> <5->4 s8 <5->
    <9>4 s8 <6> <6 5>4 <_+>
    s <6> s2
    s s8 <5> <_+>4
    s s8 <6> <5>4 <_+>

}


forma = {

    \time 4/4
    \tempo 4 = 45
    \key si\minor
    s1*24
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

    re4. re8 dod4
    re8(mi) re(mi) fad4
    fad4. fad8 mi4

    %4
    fad mi8(re) dod4
    re4.\p re8 dod4
    re8(mi) re(mi) fad4

    %7
    fad4. fad8 mi4\mbreak
    fad mi8(re) dod4
    fad4. fad8 mi4

    %10
    fad8(sol) fad(sol) la4
    lad4. si8 dod4
    si2.~

    %13
    si4 lad8 sold?lad4
    si2.~
    si4 lad8 sold? lad4\mbreak

    %16
    si2.
    fad4. fad8 mi4
    fad8(sol) fad(sol) la4

    %19
    lad4. si8 dod4
    si2.~
    si4 lad8 sold? lad4

    %22
    si2.~
    si4 lad8 sold?lad4\mbreak
    si la?8 sol fad4~

    %25
    fad mi8 re mi4~
    mi re8 dod re4~
    re dod8 si dod4~

    %28
    dod si8 dod re4
    dod r re8 dod
    si4 r dod8 si\mbreak

    %31
    la4 r si'8 la
    sol4 r la8 sol
    fad4 r sol8 fad

    %34
    mi4 r fad8 mi
    re4 r mi8 re
    dod4 r dod

    %37
    si r si'8\p la
    sol4 r la8 sol
    fad4 r sol8 fad

    %40
    mi4 r fad8 mi
    re4 r mi8 re
    dod4 r dod~

    %43
    dod si2~
    si4 lad8 sold? lad4
    si2.\fermopz

}


IVvlIIn = \relative do'' {

    si4. si8 fad4
    si8(dod) si(dod) re4\mbreak
    re4. dod8 si4

    %4
    lad dod8(si) lad4
    si4.\p si8 fad4
    si8(dod) si(dod) re4

    %7
    re4. dod8 si4
    lad dod8(si) lad4
    re4. re8 la?4\mbreak

    %10
    re8(mi) re(mi) fad4
    mi8(fad) mi(re) dod4
    re8(mi) re(dod) si4

    %13
    dod dod4. dod8
    re\p mi re dod si4
    dod dod4. dod8

    %16
    re2.
    re4. re8 la4\mbreak
    re8(mi) re(mi) fad4

    %19
    mi8(fad) mi(re) dod4
    re8(mi) re(dod) si4
    dod dod4. dod8

    %22
    re\p mi re dod si4
    dod dod4. dod8
    re2 dod4

    %25
    si2.\mbreak
    la4. la'8 sol fad
    mi4 mi4. mi8

    %28
    fad mi re dod si4~
    si8 si la si la4~
    la8 la sol la sol4~

    %31
    sol8 sol' fad sol fad4~
    fad8 fad mi fad mi4~\mbreak
    mi8 mi fad mi re4~

    %34
    re8 re dod re dod4~
    dod8 dod re dod si4~
    si lad8 sold? lad4

    %37
    si8\p si' la? sol fad4~
    fad8 fad mi fad mi4~
    mi8 mi fad mi re4~

    %40
    re8 re dod re dod4~
    dod8 dod re dod si4~
    si lad8 sold? lad4

    %43
    re r mi8 re
    dod4 r dod
    si2.\fermopz

}


IVvlan = \relative do' {

    fad4 fad4. fad8
    fad2.
    fad4. fad8 si,4

    %4
    fad'2.
    fad4\p fad4. fad8
    fad2.

    %7
    fad4. fad8 si,4
    fad'2.
    la,4. la8 la4

    %10
    la2.\mbreak
    dod4. fad8 fad4
    fad r sol

    %13
    sol fad4. fad8
    re2.\p
    la4. la8 la4

    %16
    la2.
    la4.\f la8 la4
    la2.

    %19
    dod4. fad8 fad4\mbreak
    fad r sol
    sol fad4. fad8

    %22
    fad4\p r sol
    sol fad4. fad8
    fad2 la,4

    %25
    si2.
    dod4 fad2
    si,4 la la'8 sol

    %28
    fad4. mi8 re4\mbreak
    sol4 r la
    fad r sol

    %31
    mi r fad
    re r mi
    la, r si

    %34
    dod r dod
    fad r si
    sol r fad\mbreak

    %37
    re\p r re
    re r mi
    la, r si

    %40
    si r dod
    fad r si
    sol r fad

    %43
    fad r si
    sol r fad
    fad2.\fermata

}



IVvcn = \relative do {

    si'4. si8 lad4
    si2.
    si4. la8 sol4

    %4
    fad2.
    si4.\p si8 lad4
    si2.

    %7
    si4. la8 sol4
    fad2.
    re'4. re8 dod4\mbreak

    %10
    re2.
    dod8 re dod si lad4
    si8 dod si la sol fad

    %13
    mi4 fad fad,
    si'8\p dod si la sol fad
    mi4 fad fad,

    %16
    si2.
    re'4.\f re8 dod4\mbreak
    re2.

    %19
    dod8 re dod si lad4
    si8 dod si la sol fad
    mi4 fad fad,

    %22
    si'8\p dod si la sol fad
    mi4 fad fad,
    si si' la

    %25
    sol2.\mbreak
    fad2 fad4
    sol la la,

    %28
    re2 re4
    mi fad8 sol fad mi
    red4 mi8 fad mi red

    %31
    dod4 re?8 mi re dod
    si4 dod2
    re4 re'8 dod si la

    %34
    sold4 lad2\mbreak
    si4 si8 la sol fad
    mi4 fad fad,

    %37
    si\p re8 mi re dod
    si4 dod2
    re4 re'8 dod si la

    %40
    sold4 lad2\mbreak
    si4 si8 la sol fad
    mi4 fad fad,

    %43
    si4 si'8 la sol fad
    mi4 fad fad,
    si2.\fermopz

}

IVbcn = \relative do {

    si'4. si8 lad4
    si2.
    si4. la8 sol4

    %4
    fad2.
    si4.\p si8 lad4
    si2.

    %7
    si4. la8 sol4
    fad2.
    re4. re8 dod4\mbreak

    %10
    re2.
    dod4. si8 lad4
    si4. la8 sol4

    %13
    mi'4 fad fad,
    si4.\p la8 sol4
    mi'4 fad fad,

    %16
    si2.
    re4.\f re8 dod4\mbreak
    re2.

    %19
    dod4. si8 lad4
    si4. la8 sol4
    mi'4 fad fad,

    %22
    si4.\p la8 sol4
    mi'4 fad fad,
    si2 la4

    %25
    sol2.\mbreak
    fad2 fad'4
    sol la la,

    %28
    re2 re4
    mi fad4. mi8
    red4 mi4. red8

    %31
    dod4 re?4. dod8
    si4 dod2
    re4 re8 dod si la

    %34
    sold4 lad2\mbreak
    si4 si2
    mi4 fad2

    %37
    si,4\p re8 mi re dod
    si4 dod2
    re4 re8 dod si la

    %40
    sold4 lad2
    si4 si2
    mi4 fad2

    %43
    si,4 si2
    mi4 fad2
    si,2.\fermopz

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s
    s4. <6>8 <6>4
    <_+>2.
    s
    s
    s4. <6>8 <6>4
    <_+>2.
    s
    s
    <6+>
    s
    <6 5>4 <_+>2
    s2.
    <6 5>4 <_+>2
    s2.*3
    <6+>2.
    s
    <6 5>4 <_+>2
    s2.
    s4 <_+>2
    s <6>4
    <7> <6> s
    <7> < 6> <6>
    <6 5>2.
    <7>4 < 6> <6>
    <6 5> <_->2
    <6 5->4 <_->2
    <6 5->2.
    <6 5->4 <5-> <6>
    <9> <8> s
    <5-> <5-> <6>
    <9> <8> s
    <6 5> <_+>2
    s2.
    <6 5>4 <5-> <6>
    <9> <8> s
    <6 5-> <5-> <6>
    <9> <8> s
    <6 5> <_+>2
    <9>4 <8> s
    <6 5> <_+>2
    <_+>

}


forma = {

    \time 3/4
    \tempo 2. = 65
    \key si\minor
    s2.*45
    \bar "|."

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

    do4 re do2\fermata
    fa8(fa fa fa) fa(fa mi mi)
    lab(lab lab lab) sol(sol sol sol)
    fa(fa mib mib) re(re do do)\mbreak

    %5
    reb re mib mi fa do fa re
    mib mi fa fad sol re sol fa?
    mib fa16 mib re8. re16 mib8. re16 do (sib) la(sol)

    %8
    fad8 sol sol8. fad16\mbreak sol4 r8 sol'16 fa
    mi8 fa mi8. mi16 fa8. mi16 re(do) si(la)
    sold8 la la8. sold16 la4 r8 la16 sol?

    %11
    fad8 sol fad8. fad16 sol4 sold
    la si do4. sib16 la
    sib4. la16 sol la4 r8 lab

    %14
    sol4 sol la!2

}


VvlIIn = \relative do'' {

    la4 sib la2\fermata
    r sol'8(sol sol sol)
    sol(sol fa fa) fa(fa mib mib)

    %4
    mib(do do do) do(sib sib la)
    sib fa sib sol\mbreak lab la sib! si
    do sol do la sib! si do re

    %7
    do do do8. si16 do4 r8 do16 sib?
    la8 sib la la' sib8. la16 sol(fa) mi!(re)\mbreak
    dod8 re re8. dod16 re4 r8 re16 do?

    %10
    si8 do si8. si16 do8. si16 la(sol) fad(mi)
    red8 mi mi8. red16 mi4 si'
    do si~\mbreak si8 la16 sol la4~

    %13
    la8 sol16 fa sol4~ sol8 fa16 mi fa4~
    fa8 mi16 re mi4 fa2

}


Vvlan = \relative do' {

    fa4 fa fa2\fermopz
    r re8 sib do do
    do do re4 re8 re mib sol

    %4
    do,4 do'8 la fa sol do, fa
    fa fa sol sol\mbreak fa la fa sol
    sol sol la la sol4 r

    %7
    sol8 la re,8. sol16 sol4 r
    r8 re mib re re4 r
    r8 la' sib la la4 r\mbreak

    %10
    r8 mi? fa mi mi4 r
    r8 si? do si si4 si
    mi4. mi8 mi4 fad

    %13
    sol r8 mi do4 re
    sol, do la2

}



Vvcn = \relative do {

    fa4 sib fa2\fermata
    fa8 sol la fa sib sol do do,
    fa mib re do si sol do sib

    %4
    la! la' fa fa sib mi,! fa fa,\mbreak
    sib' lab sol mi fa mib re sol,
    do' sib la re, sol fa mib si

    %7
    do fa sol sol, do re mib do
    re sib do re sol la sib sol\mbreak
    la fa sol la re, mi fa re

    %10
    mi do re mi la si do la
    si sol la si mi,4 re
    do sold la re

    %13
    sol,? do fa, si
    do2 fa

}

Vbcn = \relative do {

    fa4 sib, fa'2\fermata
    fa8 sol la fa sib, sol do4
    fa8 mib re do si sol do sib

    %4
    la! la' fa fa, sib mi! fa fa,\mbreak
    sib lab sol do fa mib re sol,
    do sib la re sol fa mib si

    %7
    do fa, sol4 do8 re mib do
    re sib do re sol4 r8 sol\mbreak
    la fa sol la re,4 r8 re

    %10
    mi do re mi la,4 r8  la
    si sol la si mi4 re
    do sold la re

    %13
    sol,? do fa, si
    do2 fa

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <6 5>
    <9 _->4 <5-> <6 5-> <_->
    <6 5-> <7-> <9 _->8 <7- 5-> <4> <3>
    <_->8 <6 4+> <6-> <_+> <_-> <4+> <6-> <_+>
    <_-> <6 4+> <6> <_+> <_-> <4+> <6> <6 5->
    <_-> <6 5> <4> <3+> <_->4 s8 <6> %% OOKK bar 7
    <_+> <6> <6 5> <_+> <5>4 s8 <6>
    <_+> <6> <6 5> <_+> <5 _->4 s8 <6+>
    <_+> <6> <6 5> <_+> <5 _->4 s8 <6+>
    <_+> <6> <6 5> <_+> <_->4 <6 4+>
    <6> <6> <9 _-> <7- _+>
    <9 _-> <7-> <9> <7- 5->
    <4> <3>

}


forma = {

    \time 4/4
    \tempo 4 = 50
    \key fa\major
    s1*14
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

    r8 fa la fa do' sib16 la sol fa mi re
    do4 r r2\mbreak
    r16 la' sol la fa sol la fa mi8 re16 do si sol la sib?

    %4
    do4 r r16 la' sol fa mi do re mi
    fa4 r fa,8 sol16 la sib? do re mi\mbreak
    fa8 do mi do fa mi16 re do sib la sol

    %7
    fa8 do' mib do re4 r
    r8 fa lab fa sol4 r
    r8 sol sib do16 sib la4 r\mbreak

    %10
    r16 re, do re la sib do re sib4 r
    R1
    r8 re fad re sol fad16 mi re do sib la

    %13
    sol4 r si8 do do8. si16\mbreak
    do4 r do8 sib16 la sol8. sol16
    la4 r la8 sib sib8. la16

    %16
    sib4 r r2\mbreak
    r8 fa' la fa sib la16 sol fa mib re do
    sib re do sib la fa sol la sib4 r

    %19
    do r r16 fa mib fa do re mib fa\mbreak
    re4 do sib sib'8 lab16 sol
    lab4. sol16 fa sol8 lab16 sol fa8. fa16

    %22
    sol4 r8 sol16 fa mib(re) fa(mib) re8. re16
    mib4 r8 re16 do sib(la) do(sib) la8. la16\mbreak
    sib4 r8 lab16 sol lab(sol) sib(lab) sol8. sol16

    %25
    la!4 r r2
    r16 do' sib do sol la sib do la4 r
    la4 r r2

    %28
    r8 do, mi do\mbreak fa mi16 re do sib la sol
    fa do' sib do la sib do la sol4 r8 sol'
    la fa re16 mib fa sol do, re mib fa sib, do re mib

    %31
    la, sib do re sol, la sib do la8 sib4 la8
    sib4 r16 re fa re mi8 fa4 mi8
    fa fa la fa do' sib16 la sol fa mi re

    %34
    do4 r \mbreak r8 do mi do
    fa16 la sol la fa sol la fa mi4 r
    r16 do sib do sol la sib do la la' sol fa mi re do sib

    %37
    la la' sol fa mi8 sol\mbreak la fa la fa
    do'16 do sib do sol la sib do la4 r16 do sib do
    sol4. sol8 la4 r

    %40
    la8 sol16 fa mi re do sib la4. la'8
    sol4 r\mbreak r8 mi sol mi
    la4 r r2\fermopz

}


VIvlIIn = \relative do'' {

    R1
    r8 do mi do fa mi16 re do sib la sol
    fa4 r r16 do' re mi fa la sol fa

    %4
    mi4~mi16 mi fa sol fa4 r
    r16 la sol fa mi mi fa sol la8 sol16 fa mi re do sib
    la4 r la'8 sol16 fa mi16 re do sib

    %7
    la8 la do la sib4 r
    r8 re fa re\mbreak mib4 r
    r8 mib sol la16 sol fad4 r

    %10
    r16 la, la la fad sol la sib sol4 r
    r8 sol sib sol re' do16 sib la sol fad? mi\mbreak
    re4 r r16 sib'' la sol fad re mi fad

    %13
    sol4 r sol8 fa!16 mib re8. re16
    mib4 r mi8 fa fa8. mi16
    fa4 r fa8 mib16 re do8. do16\mbreak

    %16
    re8 sib re sib fa' mi?16 re do sib la sol
    fa4 r r16 sib do re mib fa sol la
    sib8 sib, do16 la sib do re4 r

    %19
    r2 r8 fa, la fa\mbreak
    sib8 sol4 fad8 sol4 sol'~
    sol8 sol fa4~fa8 mib mib8. re16

    %22
    mib4 r8 re do do do8. si16
    do4 r8 sib?16 la sol8 sol sol8. fad16\mbreak
    sol4 r8 fa?16 mi fa8 fa fa8. mi16

    %25
    fa8 fa' la fa do' sib16 la sol fa mi re
    do4 r r8 do mi do
    fa16 la sol la fa sol la fa\mbreak mi8 re16 do sib la sol fa

    %28
    mi4 r r16 fa sol la sib do re mi
    fa4 r r16 do sib do sol la sib do
    la8 do sib re mib do re sib\mbreak

    %31
    do la sib sol fa4 mib
    re r16 sib' re sib do4 sib
    la r r2

    %34
    r16 do sib do sol la sib do la la' sol fa mi re do sib\mbreak
    la4 la'8. la16 sol mi re do sib la sol fa
    mi4 r r8 do' mi mi

    %37
    fa mi16 re do sib la sol fa do' sib do la sib do la
    sol la' sol la\mbreak mi fa sol la fa la sol la fa4~
    fa mi fa r

    %40
    fa8 mi16 re do sib la sol fa4. fa'8
    mi4 r r8 do mi sol
    fa4 r r2\fermopz

}


VIvlan = \relative do' {

    R1
    r16 do' sib do sol la sib do la4 r
    R1

    %4
    r8 do, mi do fa mi16 re do sib la sol
    fa4 r do' r16 la' sib do\mbreak
    fa,8 mi16 re do sib la sol fa4 r

    %7
    la r re r
    re r sol r
    sol r re r

    %10
    re8 fad la fad\mbreak sib la16 sol fad re mi fad
    sol4 r la8. sib16 do sib la sol
    fad re do re la sib do re sib4 r8 re

    %13
    sib4 r sol'8 sol sol8. sol16\mbreak
    sol4 r sol8 fa sol8. sol16
    fa4 r fa8 fa fa8. fa16

    %16
    fa4 r r2
    r16 fa mib fa do re mib fa re4 r
    re r\mbreak r16 sib' la sol fa la sol sib

    %19
    la8 sol16 fa mi re do sib la4 r
    r8 re la la sib4 r8 do
    do4 re sib8 do fa8. fa16

    %22
    mib4 r8 sol\mbreak sol la re, sol
    sol4 r8 re re mib la,! re
    re4 r8 do do re sol, do

    %25
    do4 r r2
    r8 do mi do fa mi16 re do sib la sol\mbreak
    fa4 r sol r

    %28
    r2 r8 do do do
    la16 la' sol la fa sol la fa mi4~mi16 fa sol la
    fa4 r8 fa sol mib fa sib

    %31
    mib, do re sol\mbreak do, re mib do
    sib16 fa' la fa sib8 sib sol la sib sol
    fa4 r r2

    %34
    r8 do mi do fa mi16 re do sib la sol
    fa4 r8 do'\mbreak do re16 mi fa sol la sib
    do la sol la mi fa sol la fa4 r

    %37
    r2 fa16 la sol la fa sol la fa
    mi4 r8 mi do4 r8 la\mbreak
    re4 do do16 la' sol fa mi re do sib

    %40
    la4 r la r8 do
    do4 r do r
    do r r2\fermata

}


VIvcn = \relative do {

    fa4 r r2
    R1
    r8 fa la fa\mbreak do' sib16 la sol fa mi re

    %4
    do do' sib do sol la sib do la4 r8 fa\mbreak
    fa8 mi16 re do sib la sol fa4 r
    r16 la' sib do sol la sib do la8. la,16 sib do re mi

    %7
    fa4 r sib8 la16  sol fa mib re do\mbreak
    sib4 r mib'8 re16 do sib lab sol fa
    mib4 r re'8 do16 sib la? sol fad mi?

    %10
    re8 re fad re sol fad16 mi re do sib la\mbreak
    \once\stemUp sol sib' re sib sol sol sib sol fad4 r
    fad 16 sib la sib fad sol la sib sol4 r16 sib do re

    %13
    sol,8 fa?16 mi re do sib la sol8 do sol' sol,\mbreak
    do' sib16 la sol fa mi re do8 fa do' do,
    fa mi16 re do sib la sol fa8 sib fa' fa,

    %16
    sib4 r r2
    r16 re' do re la sib do re sib4 r
    sib8 la16 sol fa mi re do sib8 sib re sib

    %19
    fa' mi16 re do sib la sol \once\stemUp fa re'' do re la sib do re\mbreak
    sib8 sib la re, sol fa mi! do
    fa mib re sib mib lab sib sib,

    %22
    mib'8 re do si do fa, sol sol,
    do' sib la! fad sol do, re re,\mbreak
    sol' fa mi! do fa sib do do,

    %25
    fa4 r r2
    R1
    r8 fa la fa do' sib16 la sol fa mi re

    %28
    do do' sib do sol la sib do la4 r  %OOKK
    la8 fa la fa do' do, mi do
    fa la sib4~sib8 la4 sol8~

    %31
    sol fa4 mib8~mib re do fa,
    sib4 sib'~sib8 la sol do
    fa,4 r r2

    %34
    R1\mbreak
    fa8 fa la fa do' sib16 la sol fa mi re
    do8 do mi do fa mi16 re do sib la sol

    %37
    fa8 do' mi do fa4 r
    r8 do mi do\mbreak fa fa la fa
    sib sol do do, fa mi16 re do sib la sol

    %40
    fa4 r fa8 fa' la fa
    do' do, mi do fa mi16 re do8 do,
    fa4 r r2\fermopz

}

VIbcn = \relative do {

    fa4 r r2
    R1
    r8 fa la fa\mbreak do' sib16 la sol fa mi re

    %4
    do4 r8 mi fa4 r
    fa8 mi16 re do sib la sol fa4 r
    fa r fa8 sol16 la sib do re mi\mbreak

    %7
    fa4 r sib r
    sib, r mib r
    mib r8 do re4 r

    %10
    re8 re fad re sol4 r
    sol, r8 sol' fad4 r\mbreak
    fad r8 fad sol4 r16 sib do re

    %13
    sol,4 r sol,8 do sol4
    do r do8 fa do4
    fa r fa,8 sib fa4\mbreak

    %16
    sib4 r r8 do mi do
    fa4 r8 la, sib4 r
    sib fa' sib,8 sib re sib

    %19
    fa' mi16 re do sib la sol fa4 r8 la
    sib sib' la re,\mbreak sol fa mi! do
    fa mib re sib mib lab, sib4

    %22
    mib8 re do si do fa, sol4
    do8 sib la! fad sol do re4\mbreak
    sol8 fa mi! do fa sib, do4

    %25
    fa r r2
    \clef alto\key fa\major r8 do' mi do fa mi16 re do sib la sol
    \clef bass\key fa\major fa8 fa la fa\mbreak do' sib16 la sol fa mi re

    %28
    do4 r8 mi fa4 r
    fa r8 fa do' do, mi do
    fa4 sib~sib8 la4 sol8~

    %31
    sol fa4 mib8~\mbreak mib re do fa,
    sib4 sib~sib8 la sol do
    fa4 r r2

    %34
    \clef alto\key fa\major r8 do' mi do fa mi16 re do sib la sol
    \clef bass\key fa\major fa8 fa la fa\mbreak do' sib16 la sol fa mi re
    do8 do mi do fa mi16 re do sib la sol

    %37
    fa8 do' mi do fa4 r
    r8 do mi do fa fa, la fa\mbreak
    sib sol do 4 fa8 mi16 re do sib la sol

    %40
    fa4 r fa8 fa' la fa
    do' do, mi do fa mi16 re do8 do,
    fa4 r r2\fermopz

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s4 s8 <6> s2
    s1*4
    s4 s8 <6> <_+>2
    s1
    s2 <6>
    <6> s4 s16 <6> s8
    <_->2 <_+>8 <_-> <4>8. <3+>16
    <_->2 <_+>4 <4>8. <3>16
    s2 s4 <4>8. <3>16
    s2 s8 <6> s4
    s4 s8 <6> s2
    s1
    s2 s4 s8 <6>
    <5> <6> <7> <7 _+> <_->4 <5->
    <_-> <5->8 <7-> <9> <6 5> <4>8. <3>16
    s4 s8 <6> <_-> <6 5> <4>8. <3+>16
    <_->4 <5->8 <6>4 s8 <4>8. <3+>16
    <_->4 <5-> <_->8 <5> <4>8. <3>16
    s1
    s4 <6> s2
    s1
    s4 s8 <6> s2s1
    s2 <2>8 <5->  <6><5>16 <6->
    <4 2>8 <5> <6> s8 <4 2>  <6>  <7 _-> <7->
    s2 <4+ 2>8 <6> <7> <7>
    s1*6
    <6 5>1

}


forma = {

    \time 4/4
    \tempo 2 = 55
    \key fa\major
    s1*42
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

    la'4. sib8 do4
    R2.
    la4 la la

    %4
    sol sol2
    sol4 r do~
    do sib8 la sib4

    %7
    la2 la4\mbreak
    lab sol4. sol8
    fa2 sol8(fa)

    %10
    mib2 fa8(mib)
    re4 re4. re8
    mi!2.\fermata

    %13
    mi4. fa8 sol4
    do, do do
    do do do

    %16
    do2 do4
    si r sol'~\mbreak
    sol fa8(mi) fa4

    %19
    mib2 fa8(mib)
    re2 re4
    do2 re8(do)

    %22
    sib4 r mib
    mib r re
    re do si

    %25
    la la' sib!8(la)\mbreak
    sol2 la8(sol)
    fa2 sol8(fa)

    %28
    mib2 fa8(mib)
    re4 re4. re8
    mi!4. fa8 sol4

    %31
    lab2 sol4
    lab2.
    sol

    %34
    do2 sib4
    lab2.\mbreak
    sol2 sol4~

    %37
    sol fa do'~
    do4 sib2~
    sib4 lab sol

    %40
    lab sol4. sol8
    la!2.\fermopz

}


VIIvlIIn = \relative do'' {

    fa4. sol8 la4
    fa fa fa
    fa fa fa

    %4
    fa2 fa4
    mi2 mi4
    fad sol8(fad) sol4~

    %7
    sol fad8(mi) fad4
    fa! mib8(re) mi?4~\mbreak
    mi re8(do) re4~

    %10
    re do8 (sib?) do4~
    do si8(la) si4
    do2.\fermata

    %13
    do4. re8 mi4
    R2.
    mi4 mi mi

    %16
    re re2
    re4 r si\mbreak
    dod re8(dod) re4~

    %19
    re do!8(sib) do4~
    do sib!8(la) sib4~
    sib la8(sol) la4~

    %22
    la sol sib
    la r la
    sold la sol~

    %25
    sol fa fa'~\mbreak
    fa mib8(re) mib4~
    mib re8(do) re4~

    %28
    re do8(sib?) do4~
    do si8(la) si4
    do4. re8 mi4

    %31
    fa2 sol4~
    sol fa2~
    fa4 mi2\mbreak

    %34
    mi sol4~
    sol fa2~
    fa4 mi re

    %37
    do2 lab'4~
    lab sol4. fa8
    mi4 fa mi

    %40
    fa fa4. mi8
    fa2.\fermopz

}


VIIvlan = \relative do' {

    do2.
    la'4 la do\mbreak
    fa, do2

    %4
    re4 re2~
    re4 do do
    la re2

    %7
    mib4 re2
    re4 r do
    do r si

    %10
    sol r do
    do r sol\mbreak
    sol2.\fermata

    %13
    sol'
    mi4 mi sol
    do, sol2

    %16
    la4 r la'~
    la sol re
    la r la

    %19
    sib do2
    fa fa4
    sol la2

    %22
    re, re4\mbreak
    la' r la
    mi mi mi

    %25
    mi fa4. mi8
    re4 mib4. re8
    do4 re2

    %28
    sol do,4
    lab4 sol2
    sol do4

    %31
    do2 mi4
    mi do2
    do r4\mbreak

    %34
    do2 mi4
    mi do2
    do r4

    %37
    r do2
    reb2.
    do

    %40
    r4 do2
    do2.\fermata

}



VIIvcn = \relative do {

    fa2.
    fa,4 fa' mi
    re la fa

    %4
    sib si2
    do do4
    re r sol

    %7
    do re4. do8
    si4 do4. si8
    la!4 si si,\mbreak

    %10
    do do'8 sib! lab sol
    fa4 sol sol,
    do2.\fermata

    %13
    do
    do4 do' si
    la mi do

    %16
    fa fad2
    sol sol4
    la r re,\mbreak

    %19
    sol la la,
    sib!4. do8 re4
    mi! fad2

    %22
    sol sol4
    fad r fa
    mi la mi

    %25
    dod re4. dod8
    si4 do do'8 si\mbreak
    la4 si si,

    %28
    do do'8 sib! lab sol
    fa4 sol sol,
    do2.~

    %31
    do~
    do~
    do~

    %34
    do~
    do~
    do2 sib4

    %37
    lab2.\mbreak
    sib
    do~

    %40
    do
    fa\fermopz

}

VIIbcn = \relative do {

    fa2.
    fa,4 fa' mi
    re la fa

    %4
    sib si2
    do do4
    re r sol

    %7
    do, re2
    si4 do2
    la!4 si2\mbreak

    %10
    do lab4
    fa4 sol2
    do2.\fermata

    %13
    do
    do4 do' si
    la mi do

    %16
    fa fad2
    sol sol4
    la r re,\mbreak

    %19
    sol, la2
    sib!4. do8 re4
    mi! fad2

    %22
    sol sol4
    fad r fa
    mi la, mi'

    %25
    dod re4. dod8
    si4 do2\mbreak
    la4 si2

    %28
    do lab4
    fa4 sol2
    do2.~

    %31
    do~
    do~
    do~

    %34
    do~
    do~
    do2 sib4\mbreak

    %37
    lab2.
    sib
    do~

    %40
    do
    fa\fermopz

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s
    s4 <6>2
    <6 5>4 <6 5->2
    <9>4 <8> s
    <7 _+>2 <_->4
    <6 5> <_+>2
    <7- 5->4 <_->2
    <5->4 <5-> <6>
    <9 _-> <8> <6>
    <5> <_+>2
    <_!>2.
    s
    s
    s4 <6>2
    <6 5>4 <6 5->2
    <9 _!>4 <8> s
    <7 _+> s <_->
    <5> <5-> <6>
    <9> <8> <6>
    <6 5-> <5-> <6>
    <9> <8> <6->
    <7-> s <6>
    <7 _+> <_-> <_->
    <6 5-> <5> <6->
    <6 5-> <5 _-> <6><5-> <5-> <6>
    <9 _-> <8> <6>
    <6 5> <_+> s
    <_!>2.
    <6- 4>4 s <5 3>
    <6- 5> <4> s
    <5 4> <3> s
    <8>2 <7->4
    <6- 5> <4> s
    <5 4> <3> <6>
    <7> <6> s
    <9 7- _-> <8 6> s
    <7 3> <6 4> <5- 3>
    <6- 4> <5 4>4.  <3>8

}


forma = {

    \time 3/4
    \tempo 2 = 40
    \key fa\major
    s2.*41
    \bar "||"

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



VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


VIIIvlIn = \relative do'' {

    fa,4. la8 sol fa
    sol4 do2
    fa,4 fa'2~\mbreak

    %4
    fa4 mi8 re mi4~
    mi re8 do re4~
    re do2

    %7
    do4 si8 la si4
    mi2 r4
    R2.

    %10
    do4. mi8 re do
    re4 sol2
    do,4 r fa,\mbreak

    %13
    sib4. re8 do sib
    la2 r4
    R2.

    %16
    r4 fa'2~
    fa4 mi8(re) mi4~
    mi re2~

    %19
    re4 do2~
    do4 sib2
    la4. sol8 fa fa'

    %22
    mi2 mi4\mbreak
    re4. fa8 mi re
    mi4 la2

    %25
    fa4. la8 sol fa
    sol2.
    fad4 sol la

    %28
    sib la2
    r4 sol2~\mbreak
    sol4 fad8 mi fad4

    %31
    sol mib8 re do sib
    la4 re8 do sib la
    sol4 do8 sib la sol

    %34
    fa4 sib'8 la sol fa
    mi!4 la8 sol fa mi
    re4 sol2~

    %37
    sol4 fad8 mi fad4
    fa!4 mib re
    mib re4. re8

    %40
    mi!4 r r
    R2.
    r4 do'2~

    %43
    do4 si8 la si4
    do4. sol8 fa mi
    fa2 fa4\mbreak

    %46
    mi2 r4
    R2.
    do8 re do sib la4

    %49
    sib8 do sib la sol4
    sib8\p do sib la sol4
    la sol4. sol8

    %52
    la2 r4
    R2.
    fa'4. la8 sol fa\mbreak

    %55
    sol4 do2
    fa,4 mi2~
    mi4 re2~

    %58
    re4 do2~
    do4 sib2~
    sib4 la2

    %61
    sol4 sol2
    la2 r4
    R2.

    %64
    fa'4. la8 sol fa\mbreak
    sol4 do2
    fa,4 mi2~

    %67
    mi4 re2~
    re4 do2~
    do4 sib2~

    %70
    sib4 la2
    sol4 sol2
    la4 sol2

    %73
    la2.\fermopz

}


VIIIvlIIn = \relative do'' {

    R2.*2
    fa,4. la8 sol fa
    sol4 do2

    %5
    fa,4 fa'2
    mi4. sol8 fa mi
    fa4 re2~

    %8
    re4 do2~
    do4 si8 la si4
    do2 r4

    %11
    R2.\mbreak
    do4. mi8 re do
    re4 sol2

    %14
    do,4 la2
    sol4 sib do
    la2 r4

    %17
    R2.
    fa4. do'8 sib la
    sol4 r do

    %20
    fa, sib8 la sol4~
    sol fa re'4~\mbreak
    re dod8 si? dod4

    %23
    re r r
    r r mi~
    mi re2~

    %26
    re4 dod8 si? dod4
    do!4 sib! la
    sol sol4. fad8

    %29
    sol4. sol8 la sib\mbreak
    do2.
    sib4 r sol

    %32
    la r re
    sib r do
    la r sib

    %35
    sol r la
    fad r re'
    do2 do4

    %38
    si do si\mbreak
    do si8 la si4
    do4. mi8 re do

    %41
    re4 sol2
    do,4. sol'8 fa mi
    fa2 fa4

    %44
    mi8 re do2~
    do4 si8 la si4
    sib?2 la4

    %47
    sol8 la sol fa mi4\mbreak
    la8 sib la sol fa4
    sol8 la sol fa mi4

    %50
    sol8\p la sol fa mi4
    fa fa4. mi8
    fa4 fa'2~

    %53
    fa4 mi2~
    mi4 re4. la8
    sib4 r sol\mbreak

    %56
    la r do
    la r re
    sol, r do

    %59
    fa, r sib
    mi,! r fa
    fa mi2

    %62
    fa4 fa'2~
    fa4 mi2~
    mi4 re4. la8

    %65
    sib4 r sol\mbreak
    la r do
    la r re

    %68
    sol, r do
    fa, r sib
    mi,! r fa

    %71
    fa mi2
    fa4 mi2
    fa2.\fermopz

}


VIIIvlan = \relative do' {

    R2.*5
    do4. mi8 re do
    re4 sol2\mbreak

    %8
    do,4. sol'8 fa mi
    fa2.~
    fa4 mi sol

    %11
    fa4. mi8 re4
    mi2 r4
    R2.\mbreak

    %14
    do4 r8 mi re do
    sib4 sol sol'~
    sol fa8 do' sib la

    %17
    sib2.
    la4 fa2
    sol4 mi2

    %20
    fa4 re2
    mi4 fa8 sol la4
    sib la2\mbreak

    %23
    la4 re,2
    re4 dod2
    re4 la2

    %26
    mi'2.
    re2 re4
    re2.

    %29
    sib4. re8 do sib
    la4 r la
    sib r mib

    %32
    do r fa\mbreak
    sol r do,
    fa r sib,

    %35
    mi! r do'
    la r sol
    do,2.

    %38
    re4 mib sol
    sol sol2
    sol4 r r

    %41
    R2.
    do,4. mi8 re do\mbreak
    re4 sol2

    %44
    do,4 mi2
    re4 re2
    do4 mi fa

    %47
    mi8 fa mi re do4
    R2.*3
    do4 do4. do'8

    %52
    la4. do8 sib la
    sib2.
    la\mbreak

    %55
    re,4 r do
    fa r sol
    fa r fa

    %58
    sol r sol
    fa r fa
    sol r fa

    %61
    re do2
    do4 la'8 do sib la\mbreak
    sib2.

    %64
    la
    re,4 r do
    fa r sol

    %67
    fa r fa
    sol r sol
    fa r fa

    %70
    sol r fa\mbreak
    re do2
    do4 do2

    %73
    do2.\fermopz

}



VIIIvcn = \relative do {

    R2.*7
    do4. mi8 re do
    re4 sol2

    %10
    do,4 do'2~
    do4 sib2~
    sib4 la2~

    %13
    la4 sol2~\mbreak
    sol4 fa2~
    fa4 mi2

    %16
    fa4. la8 sol fa
    sol4 do2
    fa,4 sib!8 la sol fa

    %19
    mi!4 la8 sol fa mi
    re4 sol8 fa mi re
    dod4 re8 mi fa re\mbreak

    %22
    sol4 la la,
    re r r
    R2.

    %25
    re4. fa8 mi re
    mi4 la2
    re,4 sol re

    %28
    sol re' re,
    sol4. sib8 la sol
    la4 re2\mbreak

    %31
    sol,4 sol2~
    sol4 fa2~
    fa4 mib2~

    %34
    mib4 re2~
    re4 do2~
    do4 sib2

    %37
    la4 re2
    sol,4 do sol'
    do, sol' sol,

    %40
    do4 do'2~\mbreak
    do4 si8 la si4
    do2.

    %43
    R2.
    do,4. mi8 re do
    re4 sol2

    %46
    do,2 fa4
    do2.~
    do~

    %49
    do~
    do
    fa4 do' do,

    %52
    fa4. la8 sol fa
    sol4 do2
    fa,4 fa2~\mbreak

    %55
    fa4 mi2
    fa4 do'8 sib la sol
    fa4 sib8 la sol fa

    %58
    mi!4 la8 sol fa mi
    re4 sol8 fa mi re
    do4 fa8 mi re do

    %61
    sib4 do2\mbreak
    fa4. la8 sol fa
    sol4 do2

    %64
    fa,4 fa2~
    fa4 mi2
    fa4 do'8 sib la sol

    %67
    fa4 sib8 la sol fa
    mi!4 la8 sol fa mi\mbreak
    re4 sol8 fa mi re

    %70
    do4 fa8 mi re do
    sib4 do2
    fa,4 do'2

    %73
    fa,2.\fermopz

}

VIIIbcn = \relative do {

    \clef violin \key fa\major fa'4. la8 sol fa
    sol4 do2
    fa,4. la8 sol fa
    sol4 do2\mbreak
    fa,2.
    \clef alto \key fa\major do4. mi8 re do
    re4 sol2
    \clef bass \key fa\major do,,4. mi8 re do
    re4 sol2

    %10
    do,4 do'2~
    do4 sib2~
    sib4 la2~

    %13
    la4 sol2~\mbreak
    sol4 fa2~
    fa4 mi2

    %16
    fa4. la8 sol fa
    sol4 do,2
    fa4 sib,!2

    %19
    mi!4 la,2
    re4 sol,2
    dod4 re2\mbreak

    %22
    sol,4 la2
    re4 \clef tenor\key fa\major re'2~
    re4 dod2

    %25
    \clef bass\key fa\major  re,4. fa8 mi re
    mi4 la,2
    re4 sol re

    %28
    sol, re'2\mbreak
    sol,4. sib8 la sol
    la4 re2

    %31
    sol,4 sol'2~
    sol4 fa2~
    fa4 mib2~

    %34
    mib4 re2~
    re4 do2~
    do4 sib2

    %37
    la4 re2\mbreak
    sol,4 do sol'
    do, sol2

    %40
    do4 \clef tenor\key fa\major do'2~
    do4 si2
    do4. mi8 re do

    %43
    re4 sol2
    \clef bass\key fa\major do,,4. mi8 re do
    re4 sol2

    %46
    do,2 fa4
    do2.~
    do~

    %49
    do~
    do
    fa4 do2

    %52
    fa4. la8 sol fa
    sol4 do,2
    fa4 fa2~

    %55
    fa4 mi2\mbreak
    fa4 do2
    fa4 sib,2

    %58
    mi!4 la,2
    re4 sol,2
    do4 fa,2

    %61
    sib4 do2\mbreak
    fa4. la8 sol fa
    sol4 do,2

    %64
    fa4 fa2~
    fa4 mi2
    fa4 do2

    %67
    fa4 sib,2
    mi!4 la,2
    re4 sol,2

    %70
    do4 fa,2
    sib4 do2
    fa,4 do'2

    %73
    fa,2.\fermata

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*3
    <7>2.
    <7>4 <6> s
    <9> <8>8 <6> s4
    <7> <_+>2
    <9>4 <8>8 <6> s4
    <7> <7 _+> s
    <4> <3> s
    <4 2> <6> s
    <4 2>2 <6>4
    <4 2> <5> s
    <4 2> <5> <6>
    <4 2> <5-> <6>
    <9> <8>8 <6> s4
    <7 _-> <7-> s
    <7>4 <5>2
    <7>4 <5>2
    <7>4 <5>2
    <6 5->4 <_->2
    <6 4>4 <_+> s
    <_->2.
    <4 2>4 <6> s
    <9> <8>8 <6> s4
    <7>4 <7 _+> s
    <7- _+> <_-> <_+>
    s <4> <3+>
    <_->2.
    <7>4 <7- _+> s
    s <6-> s
    <4 2> <6> s
    <4 2> <6> s
    <4 2> <6> s
    <4 2+> <6> s
    <2> <6> s
    <7> <7 _+> s
    <7- _+> <_-> <_+>
    <_-> <_+> s
    s2.
    <2>4 <6> s
    s2.
    <7>4 <7 _+> s
    s2.
    <7>4 <7 _+> s
    <7->2.
    s
    <8 6>4 <7> <6 4>
    <7 5> <6 4> <5 3>
    <7 5> <6 4> <5 3>
    s <4>4. <3>8
    s2.
    <7>4 <7> s
    <7> <6> s
    <4 2> <6> s
    s2.
    <7>4 <5> s
    <7>4 <5> s
    <7>4 <5> s
    <7 _!>4 <5> s
    <6 5>2.
    s
    <7>4 <7> s
    <7> <6> s
    <4 2> <6> s
    s2.
    <7>4 <5> s
    <7>4 <5> s
    <7>4 <5> s
    <7 _!>4 <5> s
    <6 5>2.

}


forma = {

    \time 3/4
    \tempo 2. = 65
    \key fa\major
    s2.*73
    \bar "|."

}

VIIIvlI = {
    \VIIIglobal
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    \VIIIglobal
    <<\VIIIvlIIn \forma>>

}

VIIIvla = {
    \VIIIglobal
    \clef alto
    <<\VIIIvlan \forma>>

}

VIIIvc = {
    \VIIIglobal
    \clef bass
    <<\VIIIvcn \forma>>

}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma\VIIIbfn>>

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
        title = \markup\smaller{Sinfonia da Chiesa n. 5 op. V}
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

    \markup \huge {[I.2] Largo}

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

    \markup \huge {[I.3] Largo}

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

    \pageBreak

    \markup \huge {[I.4] Vivace}

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
        title = \markup\smaller {Sinfonia da Chiesa n. 6 op. V}
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

    \markup \huge {[II.2] Allegro}

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

    \markup \huge {[II.3] Adagio}

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

    \pageBreak

    \markup \huge {[II.4] Presto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIIIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \VIIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc "
                \VIIIvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc "
                \VIIIbc
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

