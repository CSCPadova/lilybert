\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

MyCadenza = \relative do'' {

\cadenzaOn

    s4.^\markup\column\italic\center-align{"Cadenza"}
    \bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

dolce = _\markup \italic { dolce }

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

notypeset = \set Score.skipTypesetting = ##t

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Ifln = \relative do'' {

    re4 dod8 si la4
    si sol4. fad8
    fad4. la8 si dod

    %4
    re mi fad sol la si
    mi,4 la, fad'4~
    fad8 mi mi4. re8

    %7
    re dod re mi fad sol\mbreak
    mi4 la, r
    R2.

    %10
    r8 mi fad sol la si
    dod re mi4 la,
    sold2 r4

    %13
    R2.
    la'4 sold8 fad mi4
    fad re4. dod8\mbreak

    %16
    dod4. mi,8 fad sold
    la si dod re mi fad
    si,4 mi, dod'~

    %19
    dod8 si si4. la8
    la la si dod re mi
    fad sol la si sol fad

    %22
    mi4 fad2~
    fad8 fad mi re dod si\mbreak
    lad4 si8 lad si dod

    %25
    lad4 fad r
    si'4 la?8 sol fad4
    sol mi4. re8

    %28
    re2.
    R
    r8 fad, sold lad si dod

    %31
    re mi fad4 si,
    lad4. lad8 si4~\mbreak
    si8 dod lad4. si8

    %34
    si dod re mi fad sol
    la si sol fad mi sol
    fad sol fad mi re dod

    %37
    si4. mi,8 fad sold
    la si dod re mi fad
    si, mi fad sold la4~\mbreak

    %40
    la8 si sold4. la8
    la la, si dod re mi
    fad sol la si mi, fad

    %43
    sol fad sol la re, mi
    fad sol mi fad sol la
    fad4 r r

    %46
    R2.
    r8 la, si dod re mi
    fad sol la4 re,

    %49
    dod2 r4
    R2.
    re4 dod8 si la4

    %52
    si sol4. fad8
    fad4. la8 si dod
    re mi fad sol la si

    %55
    mi,4 la, fad'4~
    fad8 mi mi4. re8\mbreak
    re2.

}

Ivln = \relative do'' {

    R2.*7
    la'4 sold8 fad mi4
    fad re4. dod8

    %10
    dod4. mi,8 fad sold
    la si dod re mi fad
    si,4 mi, dod'4~

    %13
    dod8 si si4. la8
    la2.
    R\mbreak

    %16
    r8 mi fad sold la si
    dod re mi4 la,
    sold4. sold8 la4~

    %19
    la sold4. la8
    la4. la8 si dod
    re mi fad sol mi re

    %22
    dod mi re dod si la\mbreak
    sol2 mi'4~
    mi re8 dod re mi

    %25
    dod si dod re mi fad
    re2.
    R

    %28
    si'4 la8 sol fad4
    sol mi4. fad8
    re4. fad,8 sold lad

    %31
    si dod re mi fad sol?\mbreak
    dod,4 fad, re'4~
    re8 dod dod4. si8

    %34
    si4. dod8 re mi
    fad sol mi re dod mi
    re mi re dod si la

    %37
    sold mi fad sold la si
    dod re mi fad sold la\mbreak
    sold sold, la si dod4

    %40
    re8 si si4. la8
    la4. la8 si dod
    re mi fad sol dod, re

    %43
    mi re mi fad si, dod
    re mi dod re mi dod
    re4 dod8 si la4\mbreak

    %46
    si4 sol4. fad8
    fad4. la8 si dod
    re mi fad sol la si

    %49
    mi,4 la, fad'~
    fad8 mi mi4. re8
    re2 r4

    %52
    R2.
    r8 la si dod re mi
    fad sol la4 re,\mbreak

    %55
    dod4. dod8 re4~
    re8 mi dod4. re8
    re2.

}


Ibcn = \relative do {

    re4 mi fad
    sol mi la,
    re re' dod

    %4
    si la8 sol fad sol
    la4 dod re
    sol, la la,\mbreak

    %7
    re fad re
    la' si dod
    re si mi,

    %10
    la la,2
    la'4 dod,4. re8
    mi2 la4

    %13
    re, mi mi,
    la si dod\mbreak
    re si mi

    %16
    la,2.
    la'4 dod4. re8
    mi2 la,4

    %19
    re mi mi,
    la,2 la'4
    re2 sol,4

    %22
    la re,2
    mi2.
    fad4 si,2

    %25
    fad' fad,4\mbreak
    si dod re
    mi dod' fad

    %28
    si, dod re
    mi dod fad,
    si,2.

    %31
    si'4 re,4. mi8
    fad2 si4
    mi, fad fad,

    %34
    si2 si'4\mbreak
    fad sol la
    re, re'2

    %37
    mi mi4
    la,2 sold8 fad
    mi4 mi'8 re dod4

    %40
    fad,8 re mi4 mi,
    la2 la'4
    re,2 la'4

    %43
    mi2 sol4\mbreak
    re la' la,
    re mi fad

    %46
    sol mi la,
    re2.
    re'4 fad,4. sol8

    %49
    la2 re4
    sol, la la,
    re mi fad

    %52
    sol mi la
    re2.\mbreak
    re,4 fad4. sol8

    %55
    la2 re,4
    sol la la,
    re,2.

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key re\major
    \tempo 2. = 50
    s2.*57
    \bar"||"
}



Ifl = {
    \global
    <<\Ifln \forma>>

}

Ivl = {
    \global
    <<\Ivln \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIfln = \relative do'' {

    la'8 sol
    fad4 sol8 fad mi4 fad8 sol
    fad4 re2 fad4
    mi fad8 dod re4 mi

    %4
    dod2~dod8 dod re mi
    fad fad sold la si4. la8\mbreak
    sold4 mi2 la8 sold

    %7
    fad mi re dod si4 mi
    la,8 sold la si dod re mi la,
    re4 dod8 si si4. la8

    %10
    la2. mi'8 fad
    mi4 dod fad dod8 re\mbreak
    re4 si2 si'8 la

    %13
    sol? fad sol la fad sol la si
    sol4 fad8 mi fad sol la si
    sol fad sol la fad4. mi8

    %16
    mi2. sol8 fad
    mi re mi fad mi mi fad sol\mbreak
    la4 la8 sol fad4 fad8 mi

    %19
    re dod re mi re4 sol
    mi2. mi4
    la8 sol la si la si la sol

    %22
    fad mi fad sol fad sol fad mi
    re4 sol mi la
    fad8 fad sol la si4 si8 la\mbreak

    %25
    sol4 fad8 mi mi4. re8
    re2.

}

IIvln = \relative do'' {

    fad8 mi
    re4 mi8 re dod4 dod
    re re2 re4
    dod dod si si

    %4
    la2~la8 mi fad sol
    la la si dod re4. dod8\mbreak
    si4 sold2 dod8 si

    %7
    la4 si8 la sold4. sold8
    fad mi fad sold la4. la8
    sold4 la sold4. la8

    %10
    la2. dod8 re
    dod4 la re lad
    si2. red4\mbreak

    %13
    mi8 red mi fad red mi fad sol
    mi4 red8 dod red mi fad sol
    mi red mi fad red4. mi8

    %16
    mi2. mi8 re?
    dod si dod re dod dod re mi
    fad4 fad8 mi re4  re8 dod\mbreak

    %19
    si la si dod si4 mi
    dod2. dod4
    fad8 mi fad sol mi4 dod

    %22
    re8 dod re mi dod4 la
    si mi dod fad
    re8 re mi fad sol4 si,

    %25
    dod re8 mi dod4. re8
    re2.

}


IIbcn = \relative do {

    re4
    re sol la la,
    re re,2 re'4
    la'2 la4 sold\mbreak

    %4
    la2~la8 sol? fad mi
    re4. dod8 si si dod re
    mi2. dod4

    %7
    re4. re8 mi4. mi8
    fad4 mi8 re dod4. dod8
    si4 la\mbreak mi' mi,

    %10
    la2. la'4
    la2 re,4 fad
    si,2. si'4

    %13
    mi,2 si'4 red,
    mi2 si'4 red,
    mi la si si,

    %16
    mi2. mi4\mbreak
    la2. la8 sol
    fad2.  fad4

    %19
    sol2. mi4
    la8 sol la si la si la sol
    fad4 re' dod la

    %22
    r si la fad
    sol mi la fad\mbreak
    si4. la8 sol4 sol8 fad

    %25
    mi4 re la' la,
    re2.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \key re\major
    \tempo 1 = 45
    \partial 4 s4
    s1*9
    s2.
    \bar":..:"
    s4
    s1*15
    s2.
    \bar ":|."

}



IIfl = {
    \global
    <<\IIfln \forma>>

}

IIvl = {
    \global
    <<\IIvln \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIfln = \relative do'' {

    re2 fad sol
    lad, dod4 re mi fad
    re dod si1

    %4
    r2 lad4 si dod lad
    si dod re mi fad sol
    la?2 sol2. fad4\mbreak

    %7
    mi1 r2
    r la dod,
    fad2. mi4 mi2~

    %10
    mi4 re re dod re mi
    dod2 mi4 fad sol la
    fad2. sol4 la2~

    %13
    la4 la sol fad mi re\mbreak
    dod2 re2. re4
    re2 dod2. re4

    %16
    re2 fad si
    sol sold2. sold4
    la2 lad2. lad4

    %19
    si2. si4 la si\mbreak
    sold2. dod4 si dod
    lad2 lad4 si dod2~

    %22
    dod4 dod si la? sol? fad
    sol la sol fad mi re
    dod2 r r

    %25
    r fad lad,\mbreak
    re2. dod4 dod2~
    dod4 si si lad si dod

    %28
    lad2 dod4 re mi fad
    re2. mi4 fad2~
    fad4 fad mi re dod si

    %31
    lad2 si2. si4\mbreak
    si2 lad2. si4
    si2 fad'1

    %34
    si4 sol mi2. fad4
    fad1.

}

IIIvln = \relative do'' {

    re1 r2
    R1.
    r2 fad sol

    %4
    lad, dod4 re mi fad
    re dod si dod re mi
    fad2 mi2. re4\mbreak

    %7
    dod2 la' dod,
    fad2. mi4 mi2~
    mi4 re re2. dod4

    %10
    fad2. mi4 fad sol
    mi2 dod4 re mi fad
    re1 do2\mbreak

    %13
    si2. la4 sol2~
    sol fad si4 mi,
    fad sol mi2. re4
    re1.

    %17
    R
    r2 dod' fad
    re red2. red4\mbreak

    %20
    mi2 mid2. mid4
    fad1 mi!2
    re red2. red4

    %23
    mi fad mi re? dod si
    lad2 fad' lad,
    re2. dod4 dod2~\mbreak

    %26
    dod4 si si2. lad4
    re2. dod4 re mi
    dod2 lad4 si dod re

    %29
    si1 la?2
    sol1 mi'2~
    mi re sol4 dod,\mbreak

    %32
    re mi dod2. si4
    si2 re dod
    si si2. dod4

    %35
    lad1.

}


IIIbcn = \relative do {

    re1 mi2
    fad1.
    si2 re, mi

    %4
    fad1 fad,2
    si1 si'2
    fad sol1

    %7
    la1.
    la\mbreak
    la

    %10
    la
    la2 la dod
    re re fad,

    %13
    sol1.
    la2 re sol,
    la1 la,2

    %16
    re re' si\mbreak
    mi, si mi
    dod fad,1

    %19
    si1.
    mi2 dod1
    fad lad,2

    %22
    si1.
    mi
    fad~

    %25
    fad~
    fad~
    fad

    %28
    fad2 fad lad,
    si si' red,
    mi1.

    %31
    fad2 si mi,
    fad1 fad,2
    si1 la2

    %34
    sol1.
    fad

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/2
    \key re\major
    \tempo 2 = 53
    s1.*35
    \bar"||"
}



IIIfl = {
    \global
    <<\IIIfln \forma>>

}

IIIvl = {
    \global
    <<\IIIvln \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVfln = \relative do'' {

    la'4 si
    la8 sol fad sol la4 si
    mi, re sol sol
    sol la8 sol fad mi fad sol

    %4
    mi4 la, la' si
    la8 sol fad sol la4 si
    mi, re sol sol

    %7
    sol la8 sol fad mi fad sol
    mi2 mi4 mi
    mi4. re8 dod re mi fad

    %10
    mi4 la, mi' la
    la sol8 fad\mbreak sol fad mi re
    dod4 fad re sol

    %13
    dod, re8 dod dod4. si8
    si2 fad'4 si
    sol sol8 fad sol la sol fad

    %16
    mi2 mi4 la
    fad fad8 mi\mbreak  fad sol fad mi
    re4 sol8 fad mi4 la8 sol

    %19
    fad4 sol8 la si la sol fad
    mi sol fad mi  mi4. re8
    re2

}

IVvln = \relative do'' {

    fad4 sol
    fad8 mi re mi fad4 sol
    dod, re si mi
    mi dod re8 dod re mi

    %4
    dod2 fad4 re8 mi
    fad mi re mi fad4 sol\mbreak
    dod, re si mi

    %7
    mi dod re8 dod re mi
    dod2 dod4 dod
    dod4. si8 la si dod re

    %10
    dod4. si8 la4 mi'
    fad re si dod8 si\mbreak
    lad4 re si mi

    %13
    lad, si lad4. si8
    si2 r
    r si4 mi

    %16
    dod dod8 si dod re dod si
    la4 re8 dod\mbreak re mi re dod
    si4 mi8 re dod4 fad8 mi

    %19
    re4 mi8 fad sol fad mi re
    dod4 re8 mi dod4. re8
    re2

}


IVbcn = \relative do {

    re4 sol,
    re'2 re'4 sol,
    la si mi, mi'8 re
    dod4 la re re,

    %4
    la'8 si la sol fad4 sol
    re'2 re,4 sol\mbreak
    la si mi, mi'8 re

    %7
    dod4 la re, re,
    la'2 la'4 la
    la2. la4

    %10
    la la,8 si dod4 la
    re4. re8 mi4. mi8\mbreak
    fad4 re sol mi

    %13
    fad si, fad' fad,
    si si8 dod red4 si
    mi2 mi4 sol

    %16
    la2 la4 dod
    re2 re4 fad,
    sol mi\mbreak la fad

    %19
    si4 si8 la sol4. sol8
    la4 re, la' la,
    re2

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \key re\major
    \tempo 1 = 55
    \partial 2 s2
    s1*7
    s2
    \bar":..:"
    s
    s1*12
    s2
    \bar":|."
}



IVfl = {
    \global
    <<\IVfln \forma>>

}

IVvl = {
    \global
    <<\IVvln \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Vfln = \relative do'' {

    r4 la re
    dod la r
    r la re

    %4
    dod la re
    re sol fad8 mi
    fad2 mi4

    %7
    r sol fad
    si la re,~\mbreak
    re dod4. re8

    %10
    re4 fad sold8 la
    re,4 si mi
    dod2 r4

    %13
    r mi la
    sold mi r
    r mi la\mbreak

    %16
    sold mi la,~
    la re dod8 si
    dod2 si4

    %19
    r re dod
    fad mi la,8 sold
    la si si4. la8

    %22
    la4 la'8 si la sol
    fad4 mi r  %%% fine terza riga
    r la8 si la sol

    %25
    fad4 mi fad8 re
    la'4. la8 sol fad
    si4 sol8 la fad mi

    %28
    la4 fad8 sol mi re
    sol4. la8 fad4~
    fad8 mi mi4. re8\mbreak

    %31
    re4 la re
    dod la fad'
    mi dod la'

    %34
    fad si8 la sol la
    fad mi mi4. re8
    re4 la' la

    %37
    re, re8 mi fad sol
    mi4 mi8 fad sol la\mbreak
    fad mi re mi fad sol

    %40
    la4 mi la~
    la sol8 fad sol4~
    sol8 la fad mi re mi

    %43
    dod4 mi mi
    la, la8 si dod re
    si4 si8 dod re mi

    %46
    dod4 mi la~\mbreak
    la sold8 la si4~
    si8  si la si la sold

    %49
    fad sol fad mi re dod
    si dod re mi dod4~
    dod8 si si4. la8

    %52
    la2.
    R
    r4 la' la

    %55
    re, re8 mi fad sol\mbreak
    mi4 mi8 fad sol la
    fad mi fad re mi fad

    %58
    sol la sol fad mi re
    dod4 fad fad
    si, si8 dod re mi

    %61
    dod4 dod8 re mi fad
    re dod re mi fad sol
    mi re dod4. si8

    %64
    si4 red4. red8\mbreak
    mi fad sol la si mi,
    la4 la8 sol fad4

    %67
    sol8 la sol fad mi fad
    re4 si' si
    mi, mi8 fad sol la

    %70
    fad4 fad8 sol la si
    sol fad sol la si4~
    si8 si la sol fad mi\mbreak

    %73
    red mi fad sol la si
    sol fad fad4. mi8
    mi4 sol2~

    %76
    sol4 la8 sol fad mi
    fad4 fad2~
    fad4 sol8 fad mi re

    %79
    dod4 la' la
    re, re8 mi fad sol
    mi4 mi8 fad sol la\mbreak

    %82
    fad mi fad sol la re,
    sol fad sol la si mi,
    la sol fad mi re mi

    %85
    dod re mi fad sol mi
    fad re dod4. re8
    re4 fad4. fad8

    %88
    mi4 la4. la8\mbreak
    la4 sol4. sol8
    sol la fad mi fad4~

    %91
    fad8 mi mi4. re8
    re2.

}


Vbcn = \relative do {

    re2 r4
    r la' re
    dod la si

    %4
    la fad si
    fad mi la
    re, re' la

    %7
    si2 la4
    sol fad sol\mbreak
    mi la la,

    %10
    re re' dod
    si mi, mi,
    la mi' la

    %13
    sold mi fad
    r mi la
    sold mi fad

    %16
    mi dod fad\mbreak
    re si mi
    la, la' mi

    %19
    fad2 mi4
    re dod fad
    re mi mi,

    %22
    la2.
    r4 la re
    dod la r

    %25
    r la' re
    dod fad, si\mbreak
    sol mi la

    %28
    fad re sol
    mi la re
    sol, la la,

    %31
    re2.
    r4 la' re
    dod la fad

    %34
    si8 la sol fad mi4
    re la' la,
    re2.\mbreak

    %37
    R2.*2
    r4 re re
    la la8 si dod re

    %41
    si4 si8 dod re mi
    dod4 re8 mi fad sol
    la4 la mi

    %44
    fad4 re la
    r mi' mi
    la, la8 si dod re\mbreak %% fine pagina

    %47 OOKK
    si4 si8 dod re mi
    dod4 dod' la
    re8 mi re dod si la

    %50
    sold4 mi la
    re, mi mi,
    la la' la

    %53
    re, re8 mi fad sol
    mi4 fad8 sol la fad\mbreak
    si4 si,8 dod re4~

    %56
    re dod la
    re2 sol8 fad
    mi fad mi re dod si

    %59
    fad'2.
    R
    r4 fad fad

    %62
    si, si8 dod re mi
    dod si fad'4 fad,
    si si' si\mbreak

    %65
    mi, mi8 fad sol la
    fad4 fad8 sol la si
    sol4 mi' do

    %68
    si sol sol
    do si8 la sol4
    la si si,

    %71
    mi4 mi8 fad sol mi
    do'4. si8 la4\mbreak
    si4. si8 dod! red

    %74
    mi la, si4 si,
    mi mi'8 fad mi re
    dod4 la dod

    %77
    re re,8 mi fad re
    sol4 mi sol
    la la,2

    %80
    R2.\mbreak
    r4 la' la
    re, re8 mi fad sol

    %83
    mi4 mi8 fad sol la
    fad4 fad sol
    la4. la,8 si dod

    %86
    re fad la4 la,
    re re' re
    la4 la8 si dod re\mbreak

    %89
    si4 si8 dod re mi
    dod4 la re
    sol, la la,

    %92
    re2.

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key re\major
    \tempo 1. = 35
    s2.*92
    \bar"||"
}



Vfl = {
    \global
    <<\Vfln \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIfln = \relative do'' {

    la'4 sol2
    fad2.
    mi4 fad8 mi re dod

    %4
    re dod re mi fad sol
    la4 sol2
    fad2.

    %7
    mi4 fad8 mi re dod
    re2.\fermata
    fad4 si2\mbreak

    %10
    sold la4
    re, mi8 re dod si
    dod4 dod8 re mi4

    %13
    fad si,2
    mi4 mi8 re dod4
    re si2

    %16
    dod4 dod8 re mi4
    fad si,2
    mi4 mi8 re dod4

    %19
    re8 si si4. la8
    la2.
    la'4 sol2

    %22
    fad2.
    mi4 fad8 mi re dod
    re dod re mi fad sol

    %25
    la4 sol2
    fad2.
    mi4 fad8 mi re dod

    %28
    re2.
    fad4 sol2
    mi2.

    %31
    la4 la8 sol fad[mi]
    red4. dod8 si4
    si' la2

    %34
    sol4. la8 si4
    la si8 la sol fad\mbreak
    sol4. la8 si4

    %37
    la si8 la sol fad
    si4 si8 la sol fad
    sol la fad4. mi8

    %40
    mi2.
    sol4 mi2
    la4. sol8 fad4

    %43
    sol sol8 fad mi re
    dod4. si8 la4

}

VIvln = \relative do'' {

    fad4 mi2
    re4. dod8 si la
    si4 la8 sol fad mi

    %4
    fad4 re re'8 mi
    fad4 mi2
    re4. dod8 si la

    %7
    si4 la8 sol fad mi
    fad2.\fermata\mbreak
    re'4 re4. dod8

    %10
    si2 dod4
    fad,8 sold sold4. sold8
    la4 la8 si dod4

    %13
    si8 la sold4. sold8
    dod4 dod8 si la4
    si sold2\mbreak

    %16
    la4 la8 si dod4
    si8 la sold4. sold8
    dod4 dod8 si la4

    %19
    si sold4. la8
    la2.
    fad'4 mi2

    %22
    re4. dod8 si la
    si4 la8 sol fad mi
    fad4 re re'8 mi

    %25
    fad4 mi2
    re4. dod8 si la
    si4 la8 sol fad mi

    %28
    fad2.
    la4 si2
    sol2.

    %31
    do4 do8 si la sol
    fad2 red'4\mbreak
    sol fad2

    %34
    mi4. fad8 sol4
    fad sol8 fad mi red
    mi4. fad8 sol4

    %37
    fad sol8 fad mi red
    sol4 red mi8 red
    mi fad red4. mi8

    %40
    mi2.
    mi4 dod2\mbreak
    fad4. mi8 re? dod

    %43
    si4 si8 la sol fad
    mi2 dod'4

}


VIbcn = \relative do {

    re4 mi2
    fad2.
    sol4 la la,

    %4
    re2.
    re'4 mi2
    fad4 fad,2

    %7
    sol4 la la,
    re2.\fermata
    re'4 si2\mbreak

    %10
    mi,4. re8 dod4
    si mi2
    la,4 la' dod,

    %13
    re mi2
    dod4 mi fad
    re mi2

    %16
    la,4 la' dod,
    re mi2\mbreak
    dod4 mi la

    %19
    re, mi mi,
    la la'8 sol fad mi
    re4 mi2

    %22
    fad2.
    sol4 la la,
    re2.

    %25
    re'4 mi2
    fad4 fad,2
    sol4 la la,

    %28
    re2.
    re'4 si2
    do2.

    %31
    la2 la4
    si2 si8 la
    sol4 red2

    %34
    mi2.
    la,4 la' si
    mi,2 mi'4\mbreak

    %37
    la,2 si4
    sol si dod
    la si si,

    %40
    mi2.
    mi4 la2
    fad si8 la

    %43
    sol2.
    la8 si la sol  fad mi

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key re\major
    \tempo 2. = 70
    s2.*44
    \bar"||"
    \mark\markup\center-column {"Da""Capo"}
}



VIfl = {
    \global
    <<\VIfln \forma>>

}

VIvl = {
    \global
    <<\VIvln \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIfln = \relative do'' {

    re8 dod si la si sol
    fad4. r8 r dod'
    re mi fad mi la sol

    %4
    fad4. mi
    fad8 fad16 sol la8 re, mi dod
    si16 la si dod si8 mi4.

    %7
    dod16 si dod re dod8 fad sold la
    sold16 la si8 mi, la sold fad
    mi fad16 mi re dod re4.

    %10
    re8 mi16 re dod si dod8 dod16 re mi fad
    mi8 si16 dod re mi dod si si8. la16
    la2.

    %13
    mi'8. fad16 mi8 mi la sol
    fad mi re sol fad mi
    fad sol16 fad mi re dod8 fad dod

    %16
    re si fad' si la16 sol fad mi
    red4 si8 si' la16 sol fad mi
    la8 si16 la sol fad\mbreak sol la fad8. mi16

    %19
    mi8 sol fad mi fad sol
    la fad re sol la16 sol fad mi
    fad4. la16 sol fad sol la si

    %22
    la4. fad16 mi re mi fad sol
    fad4. si,8 si16 dod re8\mbreak
    mi sol fad mi4.

    %25
    la8 sol16 fad mi re dod4 la8
    la' sol16 fad mi re sol4.~
    sol8 la16 sol fad mi fad8 fad16 sol la8

    %28
    dod, dod16 re mi fad fad mi mi8. re16
    re2.

}

VIIvln = \relative do'' {

    R2.
    re8 dod si la si sol
    fad sol la16 si dod4 dod8

    %4
    re la si dod re mi
    re re la si si la
    sold16 fad sold la sold8 dod4.\mbreak

    %7
    la16 sold la si la8 re re dod
    si4 dod8 dod4 re8
    dod re16 dod si la si4.

    %10
    si8 dod16 si la sold la8 la16 si dod la
    sold4 la8 la4 sold8
    la2.

    %13
    dod8. re16 dod8 dod4 dod8
    re dod si mi re dod
    re mi16 re dod si lad4 lad8

    %16
    si4. r
    si'8 la16 sol fad mi red4 mi8
    fad sol16 fad mi red mi fad red8. mi16\mbreak

    %19
    mi4 re8 dod re mi
    fad re si mi fad16 mi re dod
    re4. fad16 mi re mi fad sol

    %22
    mi8 dod mi re16 dod si dod re mi
    dod8 la dod re si16 la si8
    dod mi re\mbreak dod4.

    %25
    r la'8 sol16 fad mi re
    dod4 re8 si dod re
    mi8 fad16 mi re dod re8 re16 mi fad sol

    %28
    fad8 la,16 si dod8 re16 dod dod8. re16
    re2.

}


VIIbcn = \relative do {

    re4 sol8 fad4 mi8
    re4 sol8 fad4 mi8
    re4 re'8 dod4 la8

    %4
    si fad sol la si dod
    re4 dod8 si sold la
    mi4 mi'8\mbreak dod16 si dod re dod8

    %7
    fad,4 fad16[mi]  re dod si8 la
    mi'16 fad sold8 la fad mi re
    la'4. la8 si16 la sol fad

    %10
    sold4 mi8 la4 dod,16 re
    mi4 fad16 sold\mbreak la si, mi8 mi,
    la4. la'16 si la sol fad mi

    %13
    la4. la,
    re4 sol8 mi4 la8
    re,4 mi8 fad4 fad,8

    %16
    si4 si16 dod red4 mi8
    si'4 mi,8\mbreak si'4 do8
    la4 si8 mi, si' si,

    %19
    mi4. la4 sol8
    fad4 sol8 mi4 la,8
    re fad16 sol la8 re,4 re'8

    %22
    dod la dod si4.
    la8 fad la\mbreak sol sol fad
    mi dod re la'4 la16 si

    %25
    dod4 re8 la4 re,8
    la la' si mi, mi' re
    dod4 la8 re4 fad,8

    %28
    la4. re,8 la' la,
    re2.

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 6/8
    \key re\major
    \tempo 2. = 45
    s2.*12
    \bar":..:"
    s2.*17
    \bar ":|."
}



VIIfl = {
    \global
    <<\VIIfln \forma>>

}

VIIvl = {
    \global
    <<\VIIvln \forma>>

}

VIIbc = {
    \global
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \header {
        title = \markup\smaller{Trio con Violino, Flauto e Basso in Re maggiore [GroT 4196-D]}
        composer = \markup \center-column{"  ""J. C. Pez (1664 - 1716)"}
    }

    \markup \huge {[1.] [Allegro] }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Flute"\vspace #-0.2 "allem[ande]"}
                \set Staff.shortInstrumentName = "fl"
                \Ifl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"}
                \set Staff.shortInstrumentName = "vl"
                \Ivl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"\vspace #-0.2"Continuo"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[2.] Bourre }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Flute"\vspace #-0.2 "allem[ande]"}
                \set Staff.shortInstrumentName = "fl"
                \IIfl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"}
                \set Staff.shortInstrumentName = "vl"
                \IIvl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"\vspace #-0.2"Continuo"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[3.] Adagio }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Flute"\vspace #-0.2 "allem[ande]"}
                \set Staff.shortInstrumentName = "fl"
                \IIIfl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"}
                \set Staff.shortInstrumentName = "vl"
                \IIIvl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"\vspace #-0.2"Continuo"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[4.] Gavotte }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Flute"\vspace #-0.2 "allem[ande]"}
                \set Staff.shortInstrumentName = "fl"
                \IVfl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"}
                \set Staff.shortInstrumentName = "vl"
                \IVvl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"\vspace #-0.2"Continuo"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \paper  {

        systems-per-page = #7

    }

    \markup \huge {[5.] Solo }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Flute"\vspace #-0.2 "allem[ande]"}
                \set Staff.shortInstrumentName = "fl"
                \Vfl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"\vspace #-0.2"Continuo"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[6.] Rondeau }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Flute"\vspace #-0.2 "allem[ande]"}
                \set Staff.shortInstrumentName = "fl"
                \VIfl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"}
                \set Staff.shortInstrumentName = "vl"
                \VIvl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"\vspace #-0.2"Continuo"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[7.] Gigs }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Flute"\vspace #-0.2 "allem[ande]"}
                \set Staff.shortInstrumentName = "fl"
                \VIIfl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"}
                \set Staff.shortInstrumentName = "vl"
                \VIIvl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"\vspace #-0.2"Continuo"}
                \set Staff.shortInstrumentName = "bc"
                \VIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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