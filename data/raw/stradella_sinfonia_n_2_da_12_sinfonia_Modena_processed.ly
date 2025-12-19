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

    fad4 r8 fad fad2
    R1
    la4 r8 la la2

    %4
    R1
    re,16 re re re fad8 re la'4. la8
    fad8 la fad4 mi16 mi mi mi fad8 re

    %7
    mi4~mi16 re re re re8 dod re[la]
    si16[dod re8 re8. dod16] re2
    R1*4

    %13
    r4 fad16 sol fad sol la4 la,16 si dod la
    re4~re16 fad mi re dod4~dod16 re dod re
    mi4~mi16 mi re dod si4 dod16 si dod re

    %16
    mi8 re16 dod si8. si16 la2\mbreak
    R1*2
    r2 fad'16 sold fad sold la4\parentSlur (

    %20
    la16) si la si sol?4~sol16 la sol la fad4
    mi2 fad16 sol fad mi re4\mbreak
    mi16 fad mi re dod8. dod16 si4 r

    %23
    r sol'16 sol si si mi,4 r
    r2 r4 la16 si la8
    la sol sol16 la sol8 sol fad r4

    %26
    r2 r4 fad
    sol la re, r\mbreak
    r2 r4 r16 re fad re

    %29
    fad4 r16 la re la re4 r
    r r16 sol,, si sol si4 r16 mi sol mi
    sol4 r r la16 la la la\mbreak

    %32
    re,8[fad mi8. re16] re4 r
    R1

}

IvlIIn = \relative do'' {

    re4 r8 re re2
    R1
    fad4 r8 fad fad2

    %4
    R1
    r2 la,16 la la la dod8 la
    re4. re8 dod16 dod dod dod re8 la\mbreak

    %7
    si4 la8 la' sol16 sol sol sol sol8 fad
    sol fad mi8. mi16 re2
    R1*4

    %13
    r2 la16 si la si dod4~
    dod16 dod si la si4~si8 la16 sold la4~
    la16 si la sol fad8 si16 la sold4 la16 sold la si

    %16
    dod8 si16 la la8. sold16 la2\mbreak
    R1*2
    r4 si16 dod si dod re4~re16 mi re dod

    %20
    si4\parentSlur (si16) re dod si la4 re\parentSlur (
    re16) re dod si dod4 re16 mi re dod si4\mbreak
    dod16 re dod si si8. lad16 si4 r

    %23
    r mi16 mi sol sol dod,4 r
    r2 r4 dod
    re mi la, r

    %26
    r2 r4 re16 mi re8
    re do do re16 do do8 si r4\mbreak
    r2 r16 la re la re4

    %29
    r16 fad la fad la4 r2
    r16 re,, sol re sol4 r16 si re si re4
    r2 r4 re16 re la la\mbreak

    %32
    si8[re re8. dod16] re4 r
    R1

}

IbcIn = \relative do {

    re4 r8 re re2
    R1
    re'4 r8 re re2

    %4
    R1*2
    re,16 re re re fad8 re la'16 la la la re8 fad,\mbreak
    sol16 sol sol sol fad4 mi re16 re' re re

    %8
    sol,8 re la'[la] re,2
    R1*4
    re4 re' dod4. dod8

    %14
    fad,4 sold la la,16 si la si
    dod4 re mi16 fad mi re dod8 si
    la re mi4 la,2\mbreak

    %17
    R1*2
    si2 si'4 fad
    sol sol, re' fad16 sol fad sol

    %21
    la4~la16 si la sol fad4 sol16 la sol fad\mbreak
    mi8 si fad'[fad,] si4 r
    r sol'16 sol mi mi la4 r

    %24
    r2 r4 la
    si dod re r
    r2 r4 re,

    %27
    mi fad sol r\mbreak
    r2 re
    re r

    %30
    sol, sol
    r r4 re''16 re fad, fad\mbreak
    sol8 re la' la, re4 r

    %33
    R1

}

IbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

IvlIIIn = \relative do'' {

    R1
    re4 r8 re re2
    R1

    %4
    la4 r8 la la2
    R1*3
    r2 re16 re re re fad8 re

    %9
    la'4. la8 fad re mi16 mi mi mi
    fad8 re r la' sol16 sol sol sol fad8 fad
    fad16 mi mi mi mi4~mi16 re re re re4~\mbreak

    %12
    re8 dod re la si16[dod re8 re8. dod16]
    re2 r
    R1*3

    %17
    r4 la16 si la si dod8 la re16 mi re dod
    si4 dod16 re dod si lad8[si si8. lad16]
    si2 r

    %20
    R1*2
    r2 r4 re16 re fad fad
    si,4 r r fad'16 fad la la

    %24
    re,8 fad mi16 mi re re dod4 r
    r2 r4 re8. re16
    re8[dod si8. si16] dod4 r

    %27
    r2 r4 sol'8. sol16\mbreak
    sol8. fad16 mi8. mi16 fad4 r
    r2 r4 re16 re re re

    %30
    si4 r r2
    r4 sol'16 sol sol sol fad4 r\mbreak
    r2 r4 la16 la la la

    %33
    re,8[fad mi8. mi16] fad4 r

}

IvlaIn = \relative do' {

    R1
    la'4 r8 la la2
    R1

    %4
    fad4 r8 fad fad2
    R1*4
    r2 la16 la la la dod8 la

    %10
    re4. la8 si16 si si si la8 la
    si4\parentSlur (si16) si si si la4~16 la la la\mbreak
    sol8 la fad la sol[la la8. la16]

    %13
    la2 r
    R1*3
    r4 fad16 sold fad sold la4 la8. la16

    %18
    sol4 sol8. sol16 fad8 fad fad4
    fad2 r
    R1*2

    %22
    r2 r4 si16 si la la
    sol4 r r re'16 re re re
    si8 re si16 si la la la4 r

    %25
    r2 r4 la8. la16
    sold8[la la8. sold16] la4 r
    r2 r4 re8. re16\mbreak

    %28
    dod8 dod dod dod dod4 r
    r2 r4 la16 la la la
    sol4 r r2

    %31
    r4 re'16 re re re re4 r\mbreak
    r2 r4 re16 re re re
    si8[re re8. dod16] re4 r

}

IvlaIIn = \relative do' {

    R1
    fad4 r8 fad fad2
    R1

    %4
    re4 r8 re re2
    R1*5
    re16 re re re fad8 re sol16 re re re re8 re

    %11
    si4 mi16 mi mi mi fad4 re16 re re re\mbreak
    mi8 mi re re re[fad mi8. mi16]
    fad2 r

    %14
    R1*3
    r4 re8. re16 mi4 fad8. mi16
    re4 mi8. mi16 mi8 re dod4

    %19
    re2 r
    R1*2\mbreak
    r2 r4 re16 re re re

    %23
    re4 r r si'16 si la la
    sol8 la sol16 sol fad fad mi4 r
    r2 r4 fad8. fad16

    %26
    mi8 mi mi4 mi r
    r2 r4 si'8. si16\mbreak
    la8 la la la la4 r

    %29
    r2 r4 fad16 fad fad fad
    re4 r r2
    r4 si'16 si si si la4 r\mbreak

    %32
    r2 r4 fad16 fad la la
    sol8[la la8. la16] la4 r

}

IbcIIn = \relative do {

    R1
    re'4 r8 re re2
    R1

    %4
    re,4 r8 re re2
    R1*4
    la'16 la la la dod8 la re4 dod

    %10
    si re16  re re re sol, sol sol sol re8 re
    sol,4 sol'16 sol sol sol fad4~fad16 fad fad fad\mbreak
    mi8 la, re[fad] sol re la'[la,]

    %13
    re2 r
    R1*2
    r2 r4 la'16 si la si\mbreak

    %17
    dod8 la re [re,] la'16 si la sol fad8. fad16
    sol la sol fad mi8. mi16 fad8 si, fad'[fad,]
    si2 r

    %20
    R1*2
    r2 r4 si'16 si re re
    sol,4 r r si16 si fad fad

    %24
    sol8 re sol16 sol re re la'4 r
    r2 r4 re,8. re16
    mi8 la, mi'[mi,] la4 r

    %27
    r2 r4 sol'8. sol16\mbreak
    la8 re, la' la, re4 r
    r2 r4 re'16 re re re

    %30
    sol,4 r r2
    r4 sol16 sol sol sol re4 r\mbreak
    r2 r4 fad16 fad fad fad

    %33
    sol8 re la'[la,] re4 r\fermata

}

IbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key re\major
    \tempo 4 = 60
    s1*4
    \tempo 2 = 50
    s1*29
    \bar "||"

}

IvlI = {
    \Iglobal
    \notypeset
    <<\IvlIn\forma>>
}

IvlII = {
    \Iglobal
    <<\IvlIIn\forma>>
}

IbcI = {
    \Iglobal
    \clef bass
    <<\IbcIn\forma\IbfIn>>

}

IvlIII = {
    \Iglobal
    <<\IvlIIIn\forma>>
}

IvlaI = {
    \Iglobal
    \clef alto
    <<\IvlaIn\forma>>
}

IvlaII = {
    \Iglobal
    \clef tenor
    <<\IvlaIIn\forma>>
}

IbcII = {
    \Iglobal
    \clef bass
    <<\IbcIIn\forma\IbfIIn>>
    \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    %\set Score.skipTypesetting = ##t

}

IIvlIn = \relative do'' {

    la'2 la,4 re4. mi8 fad4
    sol fad4. mi8 mi2.
    fad2 re4\mbreak mi la, re

    %4
    re re4. dod8 re2.
    R1.*3
    la'2 la,4 re4. mi8 fad4\mbreak

    %9
    sol2 fad4 mi re4. re8
    dod2. re
    re sol4\p fad4. fad8

    %12
    mi2. dod'2\f la4
    si mi, la la la4. sold8
    la2. r

    %15
    R1.
    r2. re2 la4
    si4. dod8 re4 sol, do4. do8

    %18
    si2. r
    R1.
    r2. si2 sol4

    %21
    la re, sol sol sol4. fad8
    sol2. r
    r la,8 si dod re mi4

    %24
    fad2. r
    R1.
    r2.  la,8 si dod re mi4

    %27
    fad4. sold8 la4 si sold4. la8
    la2. r
    r mi8 fad sold la si4

    %30
    dod2. r
    R1.
    r2. re,8 mi fad sol la4

    %33
    si2. r
    r re,8 mi fad sol la4
    si4. dod8 re4 re re4. dod8

    %36
    re2. r
    R1.
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlIIn = \relative do'' {

    la'2 la,4 re4. mi8 fad4
    sol fad4. mi8 mi2.
    fad2 re4\mbreak mi la, re

    %4
    re re4. dod8 re2.
    R1.*3
    r2. la'2 la,4\mbreak

    %9
    re4. mi8 fad4 sol fad4. fad8
    mi2. fad
    re dod4\p re4. re8

    %12
    dod2. mi\f
    mi4. re8 dod4 re8 dod si4. si8
    la2. r

    %15
    R1.
    r2. fad'2 fad4
    sol2 re4 mi fad4. fad8

    %18
    sol2. r
    R1.\mbreak
    r2. re2 mi4

    %21
    fad2 re'4 si la4. la8
    sol2. r
    r la,8 sold la si dod4

    %24
    re2. r
    R1.
    r2. la8 sold la si dod4

    %27
    re4. mi8 dod4 re si4. si8
    la2. r
    r2. mi'8 red mi fad sold4

    %30
    la2. r
    R1.
    r2. re,8 dod re mi fad4

    %33
    sol2. r
    r re8 dod re mi fad4
    sol4. la8 fad4 sol8 fad mi4. mi8

    %36
    re2. r
    R1.
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIbcIn = \relative do {

    R1.*7
    la'2. fad2 re4\mbreak
    si'4. dod8 re4 sol, re4. re8

    %10
    la'2 la,4 re4. mi8 fad4
    sol fad4. fad8 mi4\p re4. re8
    la'2. la2\f la,4

    %13
    mi'2 fad4 re mi2
    la,2. r
    R1.

    %16
    r2. re'2 re,4
    sol4. la8 si4 do la4. la8
    sol2. r

    %19
    R1.
    r2. sol2 sol,4
    re'4. dod8 si4 sol re'2

    %22
    sol,2. r
    r la'2 la,4
    re2. r

    %25
    R1.
    r2. la'2 la,4
    re2 la4 re mi4. mi8

    %28
    la,2. r
    r mi'2 mi4
    la,2. r

    %31
    R1.
    r2. re2 re4
    sol,2. r

    %34
    r re'2 re4
    sol2 re4 sol la2
    re,2. r

    %37
    R1.
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

IIvlIIIn = \relative do'' {

    la'2 la,4 re4. mi8 fad4
    sol fad4. mi8 mi2.
    fad2 re4\mbreak mi la, re

    %4
    re re4. dod8 re2.
    si4\p re4. dod8 dod2.
    dod'2\f la4 si mi, la

    %7
    la la4. sold8 la2.
    R1.*6
    r2. la2 mi4

    %15
    fad4. sol8 la4 re, sol4. sol8
    fad2. r
    R1.

    %18
    r2. si2 sol4
    la re, sol sol sol4. fad8\mbreak
    sol2. r

    %21
    R1.
    r2. sol,8 la si dod re4
    mi2. r

    %24
    r la,8 si dod re mi4
    fad4. sol8 la4 si sold4. la8\mbreak
    la2. r

    %27
    R1.
    r2. re,8 mi fad sol la4
    si2. r

    %30
    r2. re,8 mi fad sol la4
    si4. dod8 re4 mi dod4. re8\mbreak
    re2. r

    %33
    r2. mi,8 fad sold la si4
    dod2. r
    R1.

    %36
    r2. re,8 mi fad sol la4
    si4. dod8 re4 fad, mi4. mi8
    <<fad2.\\re>>

}

IIvlaIn = \relative do' {

    R1.*3
    la'2 la4 la4. sol8 la4
    sol\p la4. la8 la2.

    %6
    mi' 2\f mi4 mi4. si8 dod4
    si si4. si8 dod2.
    R1.*6

    %14
    r2.\mbreak dod2 dod4
    re2 re4 si dod4. dod8
    re2. r

    %17
    R1.
    r2. re2 re4
    re2. si4  dod4. dod8\mbreak

    %20
    si2. r
    R1.
    r2. si2 si4

    %23
    si2. r
    r dod2 dod4
    re2 dod4 re si4. si8\mbreak

    %26
    dod2. r
    R1.
    r2. fad,2 mi4

    %29
    fad2. r
    r la2 la4
    sol2 la4 si la4. la8\mbreak

    %32
    la2. r
    r si2 si4
    la2. r

    %35
    R1.
    r2. re2 re4
    re2. re4 re4. dod8

    %38
    re2.

}

IIvlaIIn = \relative do' {

    R1.*3
    mi2 mi4 fad2 fad4
    re\p fad4. fad8 mi2.

    %6
    la2\f la4 sold2 mi4
    fad mi4. mi8 mi2 .
    R1.*6

    %14
    r2.mi2 la4
    la2 la4 sol sol4. sol8
    la2. r

    %17
    R1.
    r2. sol2 sol4
    fad2 re4 sol la4. la8\mbreak

    %20
    sol2. r
    R1.
    r2. sol2 sol4

    %23
    mi2. r
    r la2 la4
    la2 la4 fad mi4. mi8\mbreak

    %26
    mi2. r
    R1.
    r2. re2 re4

    %29
    si2. r
    r fad'2 fad4
    re2 fad4 sol mi4. mi8\mbreak

    %32
    fad2. r
    r mi2 mi4
    mi2. r

    %35
    R1.
    r2. fad2 fad4
    sol2 sol4 la la4. la8

    %38
    la2.

}

IIbcIIn = \relative do {

    R1.*3
    la'2 la,4 re4. mi8 fad4
    sol\p re4. re8 la'2.

    %6
    la2\f la,4 mi'2 dod4
    re mi4. mi8 la,2.
    R1.*6

    %14
    r2. la'2 la,4
    re4. mi8 fad4 sol mi4. mi8
    re2. r

    %17
    R1.
    r2. sol2 sol,4
    re'2 si4 sol re'4. re8\mbreak

    %20
    sol,2. r
    R1.
    r2. sol'2 sol4

    %23
    sold2. r
    r la2 la4
    re,2 la4 re mi4. mi8\mbreak

    %26
    la,2. r
    R1.
    r2. re2 re4

    %29
    red2. r
    r re'?2 re4
    sol,2 re4 sol, la4. la8\mbreak

    %32
    re2. r
    r sold2 sold4
    la2. r

    %35
    R1.
    r2. re2 re4
    sol,2 sol4 re la'4. la8

    %38
    re,2.

}

IIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 3/4
    %\override Staff.TimeSignature.style = #'single-digit
    \set Score.measureLength = #(ly:make-moment 6 4)
    \key re\major
    \tempo 1. = 35
    s1.*13
    s2. \bar "||"\break s
    s1.*23
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.
    \bar "||"

}

IIvlI = {
    \IIglobal
    \notypeset
    <<\IIvlIn\forma>>
}

IIvlII = {
    \IIglobal
    <<\IIvlIIn\forma>>
}

IIbcI = {
    \IIglobal
    \clef bass
    <<\IIbcIn\forma\IIbfIn>>

}

IIvlIII = {
    \IIglobal
    <<\IIvlIIIn\forma>>
}

IIvlaI = {
    \IIglobal
    \clef alto
    <<\IIvlaIn\forma>>
}

IIvlaII = {
    \IIglobal
    \clef tenor
    <<\IIvlaIIn\forma>>
}

IIbcII = {
    \IIglobal
    \clef bass
    <<\IIbcIIn\forma\IIbfIIn>>
    \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    %\set Score.skipTypesetting = ##t

}

IIIvlIn = \relative do'' {

    R1*2
    si'2 la
    sol4. la8 fad2

    %5
    R1
    mi4 fad8. fad16 sol2
    R1

    %8
    la4 si8. si16 do?2
    R1
    r2 re,16 do si la sol8 sol'

    %11
    fad16 si la sol fad4 re'16 do? si la sol4
    r2 r4 r8 si\mbreak
    la16 si la sol fad8. fad16 mi4 r8 mi'

    %14
    dod4 r8 re si16 la sol fad sol4~
    sol8 la fad4 fad mi~
    mi16 re dod si la8 re re4 dod

    %17
    re16 mi fad sol la fad sol la si8\noBeam sol16[la si sol la si]\mbreak
    do? si la sol fad sol la si sol[fad mi re dod? re mi fad]
    re mi fad sol la si la si la[si la si la si la si]

    %20
    la si la sol fad mi re dod si la si dod re mi re mi
    re[mi re mi re mi re mi] re mi fad sol la4\mbreak
    R1

    %23
    r2 r4 r8 la
    si4 r8 fad mi4 r
    r2 la16[si la si la si la si]

    %26
    sol la sol la sol la sol la\mbreak fad mi fad sol fad la sol fad
    mi8 re r4 r8 re'[re8. dod16]
    re4 la16 sol fad mi re4 si'16 la sol fad

    %29
    mi8. fad16 mi8. mi16 fad4 r

}

IIIvlIIn = \relative do'' {

    R1*2
    sol'2 red
    mi4. fad8 red2

    %5
    R1
    si4 si8. si16 si2
    R1

    %8
    mi4 mi8 mi mi2
    R1*2
    la16 sol fad mi re4 r re'16 do? si la

    %12
    sol4 r r r8 si,\mbreak
    dod16 red mi8 mi8. red16 mi4 r8 si'
    la4 r8 fad sol4 si16 la sol fad

    %15
    mi4. la,8 si4 mi16 re dod si
    la4 re16 dod si la sol4. la8
    fad re'16 mi fad re mi fad sol[la si dod re si dod re]\mbreak

    %18
    mi re do si la si do re si la sol fad mi fad sol la
    fad2 la16[si la si la si la si]
    la4~la16 sol fad mi re2

    %21
    re16[mi re mi re mi re mi] re la re mi fad4\mbreak
    R1
    r2 r4 r8 fad

    %24
    sol4 r8 re dod4 r
    r2 fad16 sol fad sol fad sol fad sol
    mi fad mi fad mi fad mi fad\mbreak re dod re mi re fad mi re

    %27
    dod8 la r4 r8 fad'[mi8. mi16]
    re4 r fad16 mi re dod si' la sol fad
    mi8. fad16 mi8. mi16 fad4 r

}

IIIbcIn = \relative do {

    R1*2
    sol'2 fad
    mi4 do si2

    %5
    R1
    sol'4 red8. red16 mi2
    R1\mbreak

    %8
    do'4 sold la2
    R1
    r2 sol,4. sol8

    %11
    re'4 r sol, sol
    r2 r4 r8 sol'\mbreak
    la8 mi si'[si,] mi4 r8 sold

    %14
    la4 r8 re, sol4\parentSlur (sol16) fad mi re
    dod4 re16 dod si la  sol4 sol'\parentSlur (

    %16
    sol) fad mi16 re dod si la8 la'
    re,4. re8 sol,4 r8 sol'\mbreak
    do,4 re sol, la

    %19
    re2 la4 re
    la re8 fad sol2
    re4 r8 sol re2\mbreak

    %22
    R1
    r2 r4 r8 re
    sol,4 r8 re' la'4 r

    %25
    r2 re,4 r8 re
    mi4 r8 mi\mbreak fad4. sol8
    la re, r4 r8 re[la'8. la16]

    %28
    re,4 r re'16 dod si la sol4
    la8 re, la8. la16 re,4 r

}

IIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

IIIvlIIIn = \relative do'' {

    re2 lad
    si4. dod8 lad2
    R1*2

    %5
    red4 red8. red16 mi2
    R1
    sold4 sold8. sold16 la2\mbreak

    %8
    R1
    do16 si la sol fad8 re' si4 r8 la
    fad[sol sol8. fad16] sol4 r

    %11
    r r8 re si4 r
    si r8 do la4 r\mbreak
    r2 si'16 la sold fad mi4

    %14
    la16 sol? fad mi re4 r2
    R1*2
    r4 r8 re si4 r8 fad'\mbreak

    %18
    mi4 r8 fad sol4 r8 mi
    fad4 r8 fad mi4 r8 fad
    mi4 r r r8 sol

    %21
    fad4 r8 sol fad4 r8 fad\mbreak
    sol4 la16 si la sol fad4 sol16 fad mi re
    dod8[re re8. dod16] re mi fad sol la4

    %24
    sol16 la si dod re4 r r8 fad,
    sol[fad mi8. mi16] fad4 r8 fad
    si,4 r8 mi\mbreak la,4 r8 si'

    %27
    la\noBeam re re8.\noBeam dod16\noBeam re4 r
    la16 sol fad mi re4 r si'16 la sol fad
    mi8. fad16 mi8. mi16 fad4 r

}

IIIvlaIn = \relative do' {

    la'2 dod
    fad,4 mi fad2
    R1*2

    %5
    si4 si si2
    R1
    si4 si8. si16 do2\mbreak

    %8
    R1
    r4 r8 re re4 r8 do
    do?[si re8. re16] si4 r

    %11
    r r8 la sol4 r
    sol r8 sol fad4 r\mbreak
    r2 sold4 r

    %14
    dod! r r2
    R1*2
    r4 r8 la sol4 r8 re'\mbreak

    %18
    do4 r8 re re4 r8 dod?
    re4 r8 re dod4 r8 re
    dod4 r r r8 re

    %21
    re4 r8 re re4 r8 re\mbreak
    si4 dod la si
    la8 la la4 la r

    %24
    si r r r8 re
    re[re re8. re16] re4 r8 re
    sol,4 r8 si\mbreak fad4 r8 si

    %27
    la[la la8. la16] la4 r
    la r r re
    dod8[re re8. dod16] re4 r

}

IIIvlaIIn = \relative do' {

    fad2 mi
    re4 mi dod2
    R1*2

    %5
    fad4 fad8. fad16 sol2
    R1
    mi4 mi mi2\mbreak

    %8
    R1
    r4 r8 fad sol4 r8 fad
    la8[sol la8. la16] sol4 r

    %11
    r r8 fad re4 r
    re r8 mi re4 r\mbreak
    r2 mi4 r

    %14
    la r r2
    R1*2
    r4 r8 fad re4 r8 si'\mbreak

    %18
    sol4 r8 la si4 r8 la
    la4 r8 la la4 r8 la
    la4 r r r8 si

    %21
    la4 r8 si la4 r8 la\mbreak
    sol4 mi re re8 sol
    fad re mi[mi] fad4 r

    %24
    sol r r r8 la
    si[la la8. la16] la4 r8 la,
    mi'4 r8 sol,\mbreak re'4 r8 si

    %27
    mi[fad mi8. fad16] fad4 r
    fad r r re
    la'8[la la8. la16] la4 r

}

IIIbcIIn = \relative do {

    re'2 dod
    si4 sol fad2
    R1*2

    %5
    si4 la8 . la16 sol2
    R1
    mi4 re8. re16 do2\mbreak

    %8
    R1
    r4 r8 re sol16 fad mi re do4
    re8 sol, re'8. re16 sol,4 r

    %11
    r r8 re' sol,4 r
    sol'16 fad mi re do4 re16 do si la sol4\mbreak
    r2 mi'4 r

    %14
    la r r2
    R1*2
    r4 r8 re, sol,4 r8 sol'\mbreak

    %18
    do,4 r8 re sol,4 r8 la
    re,4 r8 re' la4 r8 re
    la4 r r r8 sol'

    %21
    re4 r8 sol re4 r8 re\mbreak
    sol16 fad mi re dod4 re16 dod si la sol4
    la8 re la4 re r

    %24
    sol r la16 sol fad  mi re4
    sol8 re la'8. la16 re,4 r8 re
    mi4 r8 mi\mbreak fad4 r8 sol

    %27
    la re, la'8. la16] re,4 r
    re r re'16 dod si la sol4
    la8 re, la8. la16 re,4 r

}

IIIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key re\major
    \tempo 4 = 70
    s1*8
    \tempo 2 = 55
    s1*21
    \bar "||"

}

IIIvlI = {
    \IIIglobal
    \notypeset
    <<\IIIvlIn\forma>>
}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn\forma>>
}

IIIbcI = {
    \IIIglobal
    \clef bass
    <<\IIIbcIn\forma\IIIbfIn>>

}

IIIvlIII = {
    \IIIglobal
    <<\IIIvlIIIn\forma>>
}

IIIvlaI = {
    \IIIglobal
    \clef alto
    <<\IIIvlaIn\forma>>
}

IIIvlaII = {
    \IIIglobal
    \clef tenor
    <<\IIIvlaIIn\forma>>
}

IIIbcII = {
    \IIIglobal
    \clef bass
    <<\IIIbcIIn\forma\IIIbfIIn>>
    \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IVglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    %\set Score.skipTypesetting = ##t

}

IVvlIn = \relative do'' {

    re8. mi16 fad8 la sol la
    fad8. mi16 re8 r4.
    R2.*9

    %12
    re8. mi16 fad8 la sol la
    fad8. mi16 re8 dod si dod\mbreak
    re4. dod

    %15
    la8. si16 dod8 mi re mi
    dod4. si
    dod8. re16 mi8 re16 dod si8. la16

    %18
    la2.
    la'8. sol16 fad8 mi re mi
    R2.*15

    %35
    la8. sol16 fad8 mi re mi
    fad4 sold8 la4.
    re,8. dod16 si8 la sol la

    %38
    si8. dod16 re8 re4 dod8
    re4. la'
    re,8. dod16 si8 la sol la

    %41
    si8. dod16 re8 re4 dod8
    re4 r r

}

IVvlIIn = \relative do'' {

    re8. mi16 fad8 la sol la
    fad8. mi16 re8 r4.
    R2.*10

    %13
    re8. mi16 fad8 la sol la\mbreak
    fad4. mi
    re4 dod8 si la si

    %16
    mi,4 la8 sold fad sold
    la8. si16 dod8 la la8. sold16
    la2.

    %19
    la'8. sol16 fad8 mi re mi
    R2.*15
    fad8. mi16 re8 dod si dod

    %36
    re4. dod
    si8. la16 sol8 fad mi fad
    sol sol' fad mi4 mi8

    %39
    re4. la'
    re,8. dod16 si8 la sol la
    si dod re re4 dod8

    %42
    re4 r r

}

IVbcIn = \relative do {

    R2.*13
    re8. mi16 fad8 la sol la
    fad8. sold16 la8 sold fad sold

    %16
    la8. si16 dod8 mi re mi
    dod8. si16 la8 re, mi8. mi16
    la,2.

    %19
    R2.*17
    re'8. dod16 si8 la sol la
    si4 dod8 re4.

    %38
    sol,4 re8 la' sol la
    re8. dod16 si8 la sol la
    si4 dod8 re4.

    %41
    sol,4 re8 la' sol la
    re,4 r r

}

IVbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

IVvlIIIn = \relative do'' {

    re8. mi16 fad8 la sol la
    fad8. mi16 re8 dod si dod
    la8. si16 dod8 re dod re

    %4
    si8. dod16 re8 dod si dod
    re4. mi
    fad4 mi8 re4.\mbreak

    %7
    R2.
    la8. si16 dod8 mi re mi
    dod4. si

    %10
    mi8. re16 dod8 re16 dod si8. si16
    dod2.
    R2.*7

    %19
    la'8. sol16 fad8 mi re mi
    fad8. mi16 re8 dod si dod\mbreak
    re4 si8 la4.

    %22
    la8. si16 dod8 mi re mi
    dod4. dod
    re8. dod16 si8 la sol la

    %25
    si re,4 mi4.
    la8. si16 dod8 re mi fad
    mi8. fad16 re8 dod4 re8\mbreak

    %28
    re8. dod16 si8 la sol la
    si4. la
    re8. mi16 fad8 la sol la

    %31
    fad4 sold8 la4.
    re,8. dod16 si8 la sol la
    si8. dod16 re8 re4 dod8

    %34
    re4 r r\mbreak
    R2.*5
    re8. dod16 si8 la sol la

    %41
    si8. dod16 re8 re4 dod8
    re4 r r

}

IVvlaIn = \relative do' {

    R2.
    re8. mi16 fad8 la sol la
    fad8. sol16 la8 re,8. mi16 fad8

    %4
    sol8. la16 fad8 mi re mi
    fad8. mi16 re8 dod si dod
    re4 dod8 fad4.\mbreak

    %7
    re8. mi16 fad8 la sol la
    fad8. sold16 la8 sold fad sold
    la4. sold

    %10
    la la8 la8. sold16
    la2.
    R2.*9

    %21
    la8. sol16 fad8 mi re mi
    fad8. sol16 la8 sold fad sold
    la4. sol?

    %24
    la4 sol8 fad mi fad
    re8. mi16 fad8 la sol la
    fad8. sold16 lad8 si4.

    %27
    si4 si8 si4 lad8\mbreak
    si8. la?16 sol8 fad mi fad
    sol4. fad

    %30
    si dod
    la r4 r8
    si8. la16 sol8 fad mi fad

    %33
    sol4 la8 la4.
    la4 r r\mbreak
    R2.*5

    %40
    si8. la16 sol8 fad mi fad
    sol4 la8 la4.
    la4 r r

}

IVvlaIIn = \relative do' {

    R2.*5
    la8. si16 dod8 re dod re\mbreak
    dod8. re16 mi8 dod si dod

    %8
    re4 mi8 mi4.
    mi mi
    mi fad8 mi8. mi16

    %11
    mi2.
    R2.*9
    fad8. mi16 re8 dod si dod

    %22
    re4 mi8 mi4.
    mi mi
    re re

    %25
    si8. dod16 re8 dod si dod
    re4 mi8 fad4.
    sol4 fad8 fad4.\mbreak

    %28
    re re
    re re
    re mi

    %31
    fad8. mi16 re8 dod si dod
    re4. re
    re8. mi16 fad8 mi4 mi8

    %34
    fad4 r r\mbreak
    R2.*4
    fad8. mi16 re8 dod si dod

    %40
    re4. re
    re8. mi16 fad8 mi4 mi8
    fad4 r r

}

IVbcIIn = \relative do {

    R2.*4
    re8. mi16 fad8 la sol la
    fad8. sol16 la8 re, mi fad\mbreak

    %7
    sol4 re8 la'4 la,8
    re4 la8 mi'4.
    la,8. si16 dod8 mi re mi

    %10
    dod8. si16 la8 re mi8. mi16
    la,2.
    R2.*8

    %20
    re8. mi16 fad8 la sol la\mbreak
    fad4 sol8 la4.
    re,4 la'8 mi4 mi,8

    %23
    la'8. sol16 fad8 mi re mi
    fad4 sol8 re4.
    sol4 re8 la'4.

    %26
    re,4 dod8 si dod re
    mi4 si8 fad' mi fad\mbreak
    si,4 dod8 re4.

    %29
    sol8. la16 si8 re dod re
    si4. la
    re8. dod16 si8 la sol la

    %32
    si4 dod8 re4.
    sol,4 re8 la' sol la
    re,4 r r\mbreak

    %35
    R2.*4
    re'8. dod16 si8 la sol la
    si4 dod8 re4.

    %41
    sol,4 re8 la' sol la
    re,4 r r

}

IVbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 6/8
    \key re\major
    \tempo 2. = 45
    s2.*11
    \bar "||"\break
    s2.*7
    \bar "||"\break
    s2.*24
    \bar "|."

}

IVvlI = {
    \IVglobal
    %\notypeset
    <<\IVvlIn\forma>>
}

IVvlII = {
    \IVglobal
    <<\IVvlIIn\forma>>
}

IVbcI = {
    \IVglobal
    \clef bass
    <<\IVbcIn\forma\IVbfIn>>

}

IVvlIII = {
    \IVglobal
    <<\IVvlIIIn\forma>>
}

IVvlaI = {
    \IVglobal
    \clef alto
    <<\IVvlaIn\forma>>
}

IVvlaII = {
    \IVglobal
    \clef tenor
    <<\IVvlaIIn\forma>>
}

IVbcII = {
    \IVglobal
    \clef bass
    <<\IVbcIIn\forma\IVbfIIn>>
    \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}

\pointAndClickOff

#(set-default-paper-size "a4")

#(set-global-staff-size 16)


\header {
    subtitle = "Sinfonia n. 2 da ”12 Sinfonie a più VV.” ms. di Modena"
    composer = \markup \center-column{"   ""A. Stradella (1639-1682)"}
}

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {[1. Adagio - Allegro]}


\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff\with {instrumentName = \markup\huge\center-column{"Concertino"}} <<

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IvlII
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = "cello"
                \IbcI
            >>
        >>

        \new PianoStaff\with {instrumentName = \markup\huge\center-column{"Concerto""grosso"}} <<

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IvlIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = "viola"
                \IvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = "viola"
                \IvlaII
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = "contrabass"
                \IbcII
            >>
        >>
    >>

    \layout {

        indent = 2.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[2. Tripla]}


\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff<<

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IIvlII
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = "cello"
                \IIbcI
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IIvlIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = "viola"
                \IIvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = "viola"
                \IIvlaII
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = "contrabass"
                \IIbcII
            >>
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[3. Adagio - Allegro]}


\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff<<

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IIIvlII
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = "cello"
                \IIIbcI
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IIIvlIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = "viola"
                \IIIvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = "viola"
                \IIIvlaII
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = "contrabass"
                \IIIbcII
            >>
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[4. Giga]}


\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff<<

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IVvlII
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = "cello"
                \IVbcI
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = "violin"
                \IVvlIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = "viola"
                \IVvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = "viola"
                \IVvlaII
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = "contrabass"
                \IVbcII
            >>
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80, 2.20.0
%}
