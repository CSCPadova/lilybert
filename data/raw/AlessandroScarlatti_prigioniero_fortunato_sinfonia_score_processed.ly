\language "italiano"


acc = \once \override Stem #'stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript #'padding = #3

padall = \override TextScript #'padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber #'transparent = ##t

con = \override TupletNumber #'transparent = ##f

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
\version "2.20.0"


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


ItpIn = \relative do'' {

    fad16 sol fad sol  fad sol la sol fad sol la sol fad sol la sol
    fad sol la sol fad sol la sol fad4 r
    R1

    %4
    la4 r r2
    la4 r r2
    r r16 la sol la fad la sol fad\mbreak

    %7
    mi4 r r2
    mi4 r r2
    mi4 r r2

    %10
    fad16 sol fad sol fad sol la sol\mbreak fad sol fad sol fad sol la sol
    fad4 r r2
    r la4 r

    %13
    r2 la4 r\mbreak
    R1*5
    r2 fad16 sol fad sol fad sol  la sol

    %20
    fad4 r\mbreak fad16 sol la sol fad sol la sol
    fad4 r fad16 sol fad sol fad sol la sol
    fad4 r r2

    %23
    la4 r\mbreak fad16 sol la sol fad sol la sol
    fad sol la sol fad sol la sol fad4 r
    fad mi re r

}

ItpIIn = \relative do'' {

    re4 r8 la re4 r8 la
    re la re[la] re4 r
    R1

    %4
    fad4 r r2
    fad4 r r2
    r r8 la, re[re,]\mbreak

    %7
    la'4 r r2
    la4 r r2
    la4 r r2

    %10
    re4 r8 la\mbreak re4 r8 la
    re4 r r2
    r fad4 r

    %13
    r2 fad4 r\mbreak
    R1*5
    r2 re16 mi re mi re mi fad mi

    %20
    re4 r\mbreak re16 mi fad mi re mi fad mi
    re4 r re16 mi re mi re mi fad mi
    re4 r r2

    %23
    fad4 r re4 r8 la
    re la re[la] re,4 r
    re' mi fad r

}

ItpIIIn = \relative do'' {

    R1
    r2 fad16 sol fad sol fad sol la sol
    fad sol fad sol fad sol la sol\mbreak fad sol la sol fad sol la sol

    %4
    fad4 r la r
    r2 la4 r
    R1

    %7
    r16 la sol la fad la sol fad mi4 r
    r2 mi4 r
    R1*2

    %11
    fad16 sol fad sol fad sol la sol fad sol fad sol fad sol la sol
    fad sol la sol fad sol la sol fad4 r
    r2 re4 r\mbreak

    %14
    R1*5
    r2 la'4 r
    fad16 sol fad sol fad sol la sol\mbreak fad4 r

    %21
    fad16 sol fad sol fad sol la sol fad4 r
    fad16 sol la sol fad sol la sol fad sol la sol fad sol la sol
    fad4 r\mbreak la r

    %24
    r2 la4 r
    fad la la r

}

ItpIVn = \relative do'' {

    R1
    r2 re4 r8 la
    re4 r8 la\mbreak re8 la re [la]

    %4
    re4 r fad r
    r2 fad4 r
    R1

    %7
    r8 la, re [re,] la'4 r
    r2 la4 r
    R1*2

    %11
    re4 r8 la re4 r8 la
    re la re [la] re4 r
    r2 re,4 r\mbreak

    %14
    R1*5
    r2 fad'4 r
    fad16 sol fad sol fad sol la sol\mbreak re4 r

    %21
    re16 mi re mi re mi fad mi re4 r
    re r8 la re la re [la]
    re,4 r\mbreak fad' r

    %24
    r2 fad4 r
    la, la fad r

}

IvlIn = \relative do'' {

    R1*3
    r16 re, re re fad fad fad fad la la la la re re re re
    fad fad fad fad la la la la re4 r

    %6
    R1
    r4 r16 la,, la la la4 dod16 dod dod dod
    mi mi mi mi la la la la dod dod dod dod mi mi mi mi

    %9
    la4 r r2
    R1*2
    r2 <<{r16. re,32 re16. re32 fad16. fad32 la16. la32}\\{la,4}>>

    %13
    re' r r16 re, re16. re32 mi16. mi32 sol16. sol32\mbreak
    la16. la,32 la16. la32 dod16. dod32 mi16. mi32 la4 r
    r16 mi mi16. mi32 la16. la32 dod16. dod32 mi4 r

    %16
    r16 mi dod16. dod32 la16. la32 mi16.[mi32] la,4 r
    r16 dod dod16. dod32 re16. re32 mi16. mi32 \mbreak fad16. fad32 fad16. fad32 sol16. sol32 la16. la32
    si16. re,32 re16. re32 mi16. mi32 fad16. sold32 la16.la32 si16. si32 dod16. la32 si16. dod32

    %19
    re16. re32 si16. si32 mi,8. mi16 fad4 r16 dod dod16. dod32
    re4 r16 dod dod16. dod32\mbreak re8 dod re dod
    re4 r16 dod dod16. dod32 re4 r16 dod dod16. dod32

    %22
    re4 r r2
    r16 re' re16. re32 dod16. si32 la16. sol32\mbreak fad4 r
    r2 r16 re' [re16. re32 dod16. si32 la16. sol32]

    %25
    fad4 dod re r

}

IvlIIn = \relative do'' {

    R1*3
    r4 r16 re, re re fad fad fad fad si si si si
    re re re re fad fad fad fad la4 r

    %6
    R1
    r2 r4 r16 la,, la la
    dod dod dod dod mi mi mi mi la la la la dod dod dod dod

    %9
    mi4 r r2
    R1*2
    r2 fad,4 r

    %13
    r16 re' re16. re32 fad16. fad32 la16. la32 re16. fad,32 fad16. fad32 la16. la32 si16. si32\mbreak
    dod4 r r16 la, la16. la32 dod16. dod32 mi16. mi32
    la4 r r16 mi mi16. mi32 la16. la32 dod16. dod32

    %16
    mi4 r r16 mi dod16. dod32 la16. la32 mi16. mi32
    la,16. la32 la16. la32 la16. la32 dod16. dod32\mbreak re16. re32 re16. re32 re16. re32 fad16. fad32
    sol16. sol32 la16. la32 dod,16. dod32 re16. re32 mi16. mi32 sold16. sold32 la16. dod,32 re16. mi32

    %19
    fad16. fad32 re'16. re32 re8. dod16 re4 r16 la, la16. la32
    mi'4 r16 si si16. si32\mbreak la8 la la la
    la4 r16 la la16. la32 la4 r16 la la16.la32

    %22
    la4 r r2
    r16 fad' fad16. fad32 mi16. re32 dod16. si32\mbreak la4 r
    r2 r16 fad' [fad16. fad32 mi16. re32 dod16. si32]

    %25
    la4 la la r

}

Ivlan = \relative do' {

    R1*3
    r2 r16 re re re fad fad fad fad
    la la la la re re re re fad,4 r

    %6
    R1*2
    r16 dod dod dod dod dod dod dod mi mi mi mi la la la la
    dod4 r r2

    %10
    R1*2
    r2 re,4 r
    r2 r16 la' la16. la32 la16. la32 re,16. re32\mbreak

    %14
    mi4 r r2
    R1*2
    r16 mi mi16. mi32 si16. si32 re16. re32\mbreak la'16. la32 la16. la32 si16. si32 do16. do32

    %18
    re16. si32 la16.la32 sol16. sol32 fad16. fad32 mi16. mi32 re16. re32 mi16. mi32 sol16. sol32
    la16. la32 si16. si32 la8. la16 la4 r16 mi mi16. mi32
    fad4 r16 mi mi16. mi32 re16. la'32 la16. la32 la16. la32 la16. la32

    %21
    la4 r16 mi re16. mi32 fad4 r16 mi re16. mi32
    fad4 r r2
    r16 la la16. la32 la16. la32 la16. la32\mbreak la4 r

    %24
    r2 r16 la la16. la32 la16. la32 dod16. dod32
    re4 mi, fad r

}

Ifgn = \relative do {

    R1*3
    re'8 re, r4 re'8 re, r4
    re'8 re, r4 re16[re' dod si la sol fad mi]

    %6
    re[la' sol fad  mi re dod si] la4 r\mbreak
    R1
    la'8 la, r4 la'8 la, r4

    %9
    la16 la' sold fad mi re dod si la[re dod si la sol fad mi]
    re4 r\mbreak r2
    R1

    %12
    r2 re'8 re, r4
    r2 r16 re'' re16. re32 dod16. dod32 si16. si32\mbreak
    la8 la, r4 r2

    %15
    R1*2
    r16 la' la16. la32 fad16. fad32 mi16. mi32\mbreak re16. re'32 re16. re32 si16. si32 la16. la32
    sol16. sol32 fad16. fad32 mi16. mi32 re16. re32 dod16. dod32 si16. si32 la16. la32 sol16. sol32

    %19
    fad16. fad'32 sol16. sol32 la8 la, re4 r16 la' la16. la32
    re,4 r16 la' la16. la32\mbreak re,8 la' re,[la']
    re,4 r8 la' re,4 r8 la'

    %22
    re,4 r r2
    re'8 re, la'[la,]\mbreak re4 r
    r2 re'8 re, la'[la,]

    %25
    re4 la' re, r

}

Ibcn = \relative do {

    R1*3
    re'8 re, r4 re'8 re, r4
    re'8 re, r4 re16[re' dod si la sol fad mi]

    %6
    re[la' sol fad  mi re dod si] la4 r\mbreak
    r2 la'8 la, r4
    la'8 la, r4 la'8 la, r4

    %9
    la16 la' sold fad mi re dod si la[re dod si la sol fad mi]
    re4 r\mbreak r2
    R1

    %12
    r2 re'8 re, r4
    r2 r16 re'' re16. re32 dod16. dod32 si16. si32\mbreak
    la8 la, r4 r2

    %15
    R1*2
    r16 la' la16. la32 fad16. fad32 mi16. mi32\mbreak re16. re'32 re16. re32 si16. si32 la16. la32
    sol16. sol32 fad16. fad32 mi16. mi32 re16. re32 dod16. dod32 si16. si32 la16. la32 sol16. sol32

    %19
    fad16. fad'32 sol16. sol32 la8 la, re4 r8 la
    re4 r8 la\mbreak re8 la' re,[la]
    re4 r8 la re4 r8 la

    %22
    re4 r r2
    re'8 re, la'[la,]\mbreak re4 r
    r2 re'8 re, la'[la,]

    %25
    re4 la' re, r

}

Ibfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*17
    s2 s8 <6+> s4
    s <4>8 <3+> s2

}

forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    s1*25
    \bar "|."

}


ItpI = {
    \Iglobal
    %\notypeset
    <<\ItpIn \forma>>

}


ItpII = {
    \Iglobal
    <<\ItpIIn \forma>>

}


ItpIII = {
    \Iglobal
    <<\ItpIIIn \forma>>

}


ItpIV = {
    \Iglobal
    <<\ItpIVn \forma>>

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


Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}



Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto\senza
}

IIvlIn = \relative do'' {

    re4 r r
    re r r
    dod r r
    dod r r
    si r r
    si r r
    lad r si\mbreak
    si r la
    la r sol
    sol r fad
    fad r mi
    mi r re\mbreak
    mi dod4. dod8
    re4 r r
    <<
        {
            \override TupletBracket.bracket-visibility = ##f \terzinequarto\senza
            r4 r8 r16  si''\solo \tuplet 3/2 { si8 la sold }
            la4 r r
            la r 8r16 la \tuplet 3/2 { la8 sol fad }
            sol4 r r
            sol r8 r16 sol \tuplet 3/2 {sol8 fad mi }
            fad4 r r
        }\\{
            si,4 r r
            la r r
            la r r\mbreak
            sol4 r r
            sol r r
            fad r r
        }
    >>
    si4 r r\mbreak
    la r r
    mi r r

}

IIvlIIn = \relative do'' {

    si4 r r
    si r r
    la r r

    %4
    la r r
    sol r r
    sol r r

    %7
    fad r fad\mbreak
    mid r fad
    red r mi

    %10
    dod r re
    si r si
    dod r fad\mbreak

    %13
    sol fad4. fad8
    fad4 r r
    sold r r

    %16
    si r r
    fad r r\mbreak
    fad r r

    %19
    mi r r
    re r r
    mi r r\mbreak

    %22
    mi r r
    dod r r

}

IIvlan = \relative do' {

    fad4 r r
    sol r r
    mi r r

    %4
    fad r r
    fad r r
    mi r r

    %7
    mi r re\mbreak
    dod r dod
    si r si

    %10
    la r la
    si r si
    lad r si\mbreak

    %13
    si lad4. lad8
    si4 r r
    dod r r

    %16
    dod r r
    si r r\mbreak
    si r r

    %19
    dod r r
    la r r
    si r r\mbreak

    %22
    dod r r
    la r r

}

IIvcn = \relative do {

    \tuplet 3/2 {
        si'8 lad si si[lad si] si lad si
        mi, red mi mi[red mi] mi red mi
        la sol la la[sol la] la sol la\mbreak

        %4
        re dod re re[dod re] re dod re
        \clef tenor \key si\minor sol fad sol sol[fad sol] sol fad sol
        dod, si dod dod[si dod] dod si dod

        %7
        \clef bass \key si\minor fad, mi fad fad mi fad si la si\mbreak
        dod si dod dod, red mid fad sol la
        si la si si, dod red mi fad sol

        %10
        la sol la la,[si dod] re mi fad
        sol fad sol sol[fad sol] sol fad sol
        fad mi fad fad mi fad si la si\mbreak

        %13
        mi, re mi fad mi fad fad mi fad
        si dod re si dod re si dod re
        mid, fad sold?
    } mid4 r


    %16
    \tuplet 3/2 {
        fad8 sold la fad sold la fad sold la
        red, mi fad
    } red4 r\mbreak
    \clef tenor\key si\minor \tuplet 3/2 {
        mi'8 fad sol mi fad sol mi fad sol

        %19
        dod, re mi dod re mi la, si dod
        re dod re re dod re re dod re
        re dod re re dod re re dod re\mbreak

        %22
        dod re mi la, si dod\clef bass\key si\minor  dod, re mi
    }
    la,4 r r

}

IIbcn = \relative do {

    si'4 r r
    mi, r r
    la, r r

    %4
    re r r
    sol r r
    dod, r r

    %7
    fad r  si,\mbreak
    dod r fad,
    si r mi

    %10
    la, r re
    sol, r sol'
    fad r si,\mbreak

    %13
    mi fad fad,
    si r r
    mid r r

    %16
    fad r r
    red r r\mbreak
    mi r r

    %19
    la, r r
    re r r
    sold, r r\mbreak

    %22
    la r r
    la r r

}

IIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <_- 7>
    <7>
    <7>
    <7>
    <7>
    <7>
    <_+ 7>
    <_+ 7>
    <7>
    s2 <6>4
    <_+ 7>2.
    <6 5>4 <_+>2
    s2.
    <6 5>
    s
    <6 5>

}

forma = {

    \time 3/4
    \key re\major
    \tempo 2 = 36
    s2.*23
    \bar "|."

}

IIvlI = {
    \IIglobal
    %\notypeset
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
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IIItpIn = \relative do'' {

    re8.[re16 re8. re16] mi8.[mi16 mi8. mi16]
    fad8.[sol16 la8. si16] mi,4 r
    R1

    %4
    r2 r4 r8 r16 re
    mi8.[mi16 mi8. mi16] fad8.[sold16 la8. si16]
    mi,4 sold la r

    %7
    r2 r4 r8 r16 mi
    fad8.[fad16 fad8. fad16]\mbreak  mi4 la,8. re16
    mi8.[mi16 mi8. mi16] fad8.[sold16 la8. si16]

    %10
    mi,4 sold la r
    la,8.[la16 la8. la16] re8.[re16 re8. re16]
    mi8.[fad16 sol8. la16]\mbreak fad4 r

    %13
    r2 r4 r8 r16 mi
    la8.[sol16 sol8. fad16] fad4 re
    r2 r4 r8 r16 fad

    %16
    mi8.[mi16 re8. re16]\mbreak mi4 la,
    R1
    r2 r4 r8 r16 la'

    %19
    si8.[la16 sol8. la16] la8.[sol16 fad8. mi16]
    fad4 mi re r

}

IIIvlIn = \relative do'' {

    R1
    r2 r4 r8 r16 la'
    si8.[la16 sol8. si16] la8.[sol16 fad8. la16]\mbreak

    %4
    sol8.[fad16 mi8. fad16] fad4 r
    R1
    r2 r4 r8 r16 mi

    %7
    fad8.[fad16 fad8. fad16] mi4 la,
    r2\mbreak r4 r8 r16 re
    mi8.[mi16 mi8. mi16] fad8.[sold16 la8. si16]

    %10
    mi,4 sold la r
    R1
    r2\mbreak r4 r8 r16 fad

    %13
    si8. la16 la8. sol16 sol4 mi
    r2 r4 r8 r16 fad
    mi8. mi16 re8. re16 mi4 la,

    %16
    r2\mbreak r4 r8 r16 la'
    si8. [la16 sol8. si16] la8.[sol16 fad8. mi16]
    fad4 mi re r8 r16 la'

    %19
    si8. [la16 sol8. si16] la8.[sol16 fad8. mi16]
    re4 la fad r

}

IIIvlIIn = \relative do'' {

    re8.[re16 re8. re16] mi8.[mi16 mi8. mi16]
    fad8.[sol16 la8. si16] mi,4 r8 r16 la
    si8.[la16 sol8. si16] la8.[sol16 fad8. la16]\mbreak

    %4
    sol8.[fad16 mi8. fad16] fad4 r8 r16 re
    mi8.[mi16 mi8. mi16] fad8.[sold16 la8. si16]
    mi,4 sold la r8 r16 mi

    %7
    fad8.[fad16 fad8. fad16] mi4 la,8. mi'16
    fad8.[fad16 fad8. fad16]\mbreak  mi4 la,8. re16
    mi8.[mi16 mi8. mi16] fad8.[sold16 la8. si16]

    %10
    dod,4 si la r
    la8.[la16 la8. la16] re8.[re16 re8. re16]
    mi8.[fad16 sol8. la16] \mbreak fad4 r8 r16 fad

    %13
    si8. la16 la8. sol16 sol4 mi8. mi16
    la8.[sol16 sol8. fad16] fad4 re8. fad16
    mi8. mi16 re8. re16 mi4 la,8. fad'16

    %16
    mi8. mi16 re8. re16\mbreak mi4 la,8. la'16
    si8. [la16 sol8. si16] la8.[sol16 fad8. mi16]
    fad4 mi re r8 r16 la'

    %19
    si8. [la16 sol8. si16] la8.[sol16 fad8. mi16]
    re4 la fad r

}

IIIvlan = \relative do' {

    fad4 r la r
    la re, dod r
    mi r re r\mbreak

    %4
    dod r re mi
    la r re, fad
    la si la r

    %7
    la la dod, r
    la' la\mbreak dod, re
    la' r la r

    %10
    mi mi dod r
    dod r la' r
    la r\mbreak la r

    %13
    fad r si r
    mi, r la r
    mi sold dod, r

    %16
    mi sold\mbreak dod, re
    si dod fad re
    re dod fad r

    %19
    si, dod fad re
    fad la la r

}

IIIfgn = \relative do {

    re'4 r dod r
    re fad,8. sol16 la4 r
    sol4 r fad r\mbreak

    %4
    mi r re'8.[re16 re8. re16]
    dod4 r re8.[re16 re8. re16]
    dod4 mi la,8.[la16 la8. la16]

    %7
    fad4 re la'8.[la16 la8. la16]
    fad4 re\mbreak la' fad
    dod' r re8. re16 fad,8. sold16

    %10
    la4 mi la r
    la r fad r
    dod'8.[dod16 dod8. dod16]\mbreak re4 re,

    %13
    red' r mi r
    dod r re8.[re16 re8. re16]
    dod4 si la r8 re

    %16
    dod4 si\mbreak la fad8. fad16
    sol8.[fad16 mi8. sol16] fad4 sol
    la dod re r

    %19
    sol,8.[fad16 mi8. sol16] fad4 sol
    la la, re r

}

IIIbcn = \relative do {

    re4 r  dod r
    re fad la r
    sol r fad r\mbreak

    %4
    mi r re8.[re16 re8. re16]
    dod4 r re r
    dod mi la8.[la16 la8. la16]

    %7
    fad4 re la'8.[la16 la8. la16]
    fad4 re\mbreak la' fad
    dod r re r

    %10
    la' mi la, r
    la' r fad r
    dod r\mbreak re r

    %13
    red r mi r
    dod r re r8 re'
    dod4 si la r8 re

    %16
    dod4 si\mbreak la fad
    sol mi fad sol
    la la, re r

    %19
    sol mi fad sol
    la la, re r

}

IIIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    <6>2 <6>
    <6>1
    s
    <6>4 <_+> s2
    s1*2
    <6>1
    s4 <_+> s2
    s1*4
    s4 <6+> s2
    <6>4 <6+> s2
    s4 <6> s2
    s4 <6 5> s2
    s4 <6> <6> s
    s4 <6 4> <3>

}

forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 65
    s1*10
    \bar ":..:"\break
     s1*10
    \bar "|."

}


IIItpI = {
    \IIIglobal
    %\notypeset
    <<\IIItpIn \forma>>

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


IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}



IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \markup\huge "[1.] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"trumpet"
                    \ItpI
                >>

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"2 trombe""1.a 2.a"}
                    \set Staff.midiInstrument = #"trumpet"
                    \ItpII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"2 trombe""3.a 4.a"}
                    \set Staff.midiInstrument = #"trumpet"
                    \ItpIII
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"trumpet"
                    \ItpIV
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini""[1.o 2.o]"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \Ifg
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

}

\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge "[2. Adagio]"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"[Violini""1.o 2.o]"}
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
                \set Staff.midiInstrument = #"cello"
                \IIvc
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \markup\huge "[3. Allegro]"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Tromba]"}
                \set Staff.midiInstrument = #"trumpet"
                \IIItpI
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"[Violini""1.o 2.o]"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Fagotto]"}
                \set Staff.midiInstrument = #"bassoon"
                \IIIfg
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

}
