\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

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
}

IvlIn = \relative do'' {

    re8[mi fad mi16 re] la'8 la, la la'
    re re re re dod16 re dod si la si la sol
    fad[sol fad mi re la' sol fad] mi8 la, mi' la

    %4
    la16[si la sol fad mi re dod]\mbreak si mi fad sold la sold la si
    dod mi, fad sold la la si dod re la si dod re8 re
    re dod si4 la8 la, la la'

    %7
    fad16 mi fad sol fad sol mi fad sol fad sol la sol la sol fad\mbreak
    mi[re mi fad mi fad re mi] fad[la sol la fad sol mi fad]
    re8 si' si si sol16[la sol fad mi fad mi re]

    %10
    dod8 dod, dod dod' re16 fad mi fad re dod si la
    sol sol' fad sol mi re dod si la la' sol la fad mi re dod\mbreak
    si[si' la si sol fad mi re] dod[dod re mi fad fad sold lad]

    %13
    si[si, dod re mi re mi fad] sol?[la? sol fad mi fad mi re]
    dod8 re dod4 si8 si' si si
    sold16[la sold fad mi fad sold mi] la8 la, la la'\mbreak

    %16
    fad16[sol? fad mi re mi fad re] sol8 sol, sol sol'
    mi16[fad mi re do re mi do] fad[mi fad sol fad sol fad mi]
    red4 r mi r

    %19
    la r la8 sol fad4\mbreak
    mi4 r r2
    re'8 re re re dod16[re dod si la si la sol]

    %22
    fad8 fad, fad fad' si16 dod si la sol la sol fad
    mi8 mi, mi mi' la16 si la sol fad sol fad mi\mbreak
    re8 re, re re' sol16[la sol fad mi fad mi re]

    %25
    dod[la si dod re dod re mi] fad[la sol la fad sol mi sol]
    fad[sol mi sol fad sol mi sol] fad[la sol la fad mi re dod]
    si[si' la si sol fad mi re] dod[dod' si dod la sol fad mi]\mbreak

    %28
    re[re' dod re si la sold fad] mi4 r_\fermata

}

IvlIIn = \relative do'' {

    R1
    re8[mi fad mi16 re] la'8 la, la la'
    re re re re dod16 re dod si la si la sol

    %4
    fad[sol fad mi re dod si la]\mbreak sold[si dod re mi mi fad sold]
    la [dod, re mi fad la sold la] fad[fad sold si] si8 si
    si la la sold la4 r

    %7
    re,8 re, re re' si16 la si dod si dod la si\mbreak
    dod[si dod re dod re si dod] re[fad mi fad re mi dod re]
    si8 re re re mi16[fad mi re dod re dod si]

    %10
    lad8 fad fad lad si16 re dod re si la? sol fad
    mi mi' re mi dod si la sol fad fad' mi fad re dod si la\mbreak
    sol[sol' fad sol mi re dod si] lad[lad si dod re fad mi fad]

    %13
    re[fad, sol la si si dod re] mi[si dod re mi re dod si]
    lad8 si si lad si4 r
    r8 mi mi mi dod16[re dod si la si dod la]\mbreak

    %16
    re8 re, re re' si16[dod si la sol la si sol]
    do8 do, do do' la'16[sol la si la si la sol]
    fad4 r sol r

    %19
    do, r red8 mi mi red\mbreak
    mi4 r la8 la, la la'
    fad16[sol fad mi re mi fad re] mi8 mi fad sol

    %22
    la16[la, si dod re re  mi fad] sol8 sol, sol si\mbreak
    mi16[fad mi re dod re dod si] la8 la, la dod'\mbreak
    re16[mi re dod si dod si la] sol8 si mi, mi'

    %25
    mi4 r16 la, si dod re[fad mi fad re mi dod mi]
    re[mi dod mi re mi dod mi] re[fad mi fad re dod si la]
    sol[sol' fad sol mi re dod si] la[la' sol la fad mi re dod]\mbreak

    %28
    si[si' la si sol fad mi re] dod4 r_\fermata

}

Ivlan = \relative do' {

    R1*2
    r2 la'8 si dod mi,
    fad re fad si\mbreak si16 sold la si  mi,8 re

    %5
    dod' si la sold fad fad fad fad
    mi mi fad mi dod4 r
    R1\mbreak

    %8
    mi8 la mi la fad fad fad fad
    si16[dod si la sol la sol fad] mi8 mi mi mi
    fad16[lad lad sol fad sol fad mi] re8 re re re

    %11
    mi mi mi mi fad fad fad fad\mbreak
    sol sol sol dod, fad fad fad mi
    re16 re mi fad sol8 re sol[si] lad fad

    %14
    fad fad sol fad fad fad si si,
    r mi sold mi r la, dod la\mbreak
    r re fad re r sol si sol

    %17
    r mi mi mi la do, do la
    si fad' si16 do si la sol[la sol fad mi fad mi re]
    do'[re do si la si la sol] fad8 mi do si\mbreak

    %20
    si4 r r2
    la'16[si la sol fad sol la fad] mi4 r
    fad r re r

    %23
    mi r dod r\mbreak
    re r si' r
    mi,16[dod re mi fad mi fad sol] la4 r

    %26
    r2 la,8 la si si
    si si dod dod dod dod re re\mbreak
    re re mi mi mi4 r_\fermata

}


Ivcn = \relative do {

    R1*2
    re8[mi fad mi16 re] la'8 la, la la'
    re re, re re'\mbreak mi re dod si

    %5
    la sold fad mi re' dod si la
    sold la re, mi la,4 r
    R1\mbreak

    %8
    la'8 la, la la' re re, re re'
    sol, fad mi re dod' dod, dod dod'
    fad, mi re dod si' si, si' si,

    %11
    dod' dod, dod' dod, re' re, re' re,\mbreak
    mi' mi, mi' mi, fad mi re dod
    si' la sol fad mi re dod si

    %14
    fad' si mi, fad si16[dod si la sold la sold fad]
    mi'[fad mi re dod re dod si] la[si la sol? fad sol fad mi] \mbreak
    re' [mi re dod si dod si la] sol[la sol fad mi fad mi re]

    %17
    do'[re do si la si la sol] fad8 fad, fad fad'
    si16 [do si la sol la sol fad] mi'[fad mi re do re do si]
    la[si la sol fad sol fad mi] si'8 mi, la si\mbreak

    %20
    mi mi, mi mi' dod!16[re dod si la si dod la]
    re,8 mi fad re la'16[si la sol fad sol fad mi]
    re'[mi re dod si dod si la] sol[la sol fad mi fad mi re]

    %23
    dod'[re dod si la si la sol] fad[sol fad mi re mi re dod]\mbreak
    si'[dod si la sol la sol fad] mi[fad mi re dod re dod si]
   la'[si la sol fad sol fad mi] re4 r

    %26
    r2 re8 re, re' re,
    mi' mi, mi' mi, fad' fad, fad' fad,\mbreak
    sol' sol, sol' sol, la'4 r_\fermata

}


Ibcn = \relative do {

    R1*2
    re8[mi fad mi16 re] la'8 la, la la'
    re re, re re'\mbreak mi re dod si

    %5
    la sold fad mi re' dod si la
    sold la re, mi la,4 r
    R1\mbreak

    %8
    la'8 la, la la' re re, re re'
    sol, fad mi re dod' dod, dod dod'
    fad, mi re dod si' si, si' si,

    %11
    dod' dod, dod' dod, re' re, re' re,\mbreak
    mi' mi, mi' mi, fad mi re dod
    si' la sol fad mi re dod si

    %14
    fad' si mi, fad si la sold fad
    mi re dod si la' sol? fad mi\mbreak
    re' dod si la sol fad mi re

    %17
    do' si la sol fad fad, fad fad'
    si la sol fad mi re do si
    la' sol fad mi si' mi, la si\mbreak

    %20
    mi mi, mi mi' dod? si la dod
    re, mi fad re la' sol fad mi
    re' dod si la sol fad mi re

    %23
    dod' si la sol fad mi re dod\mbreak
    si' la sol fad mi re dod si
    la' sol fad mi re4 r

    %26
    r2 re8 re, re' re,
    mi' mi, mi' mi, fad' fad, fad' fad,\mbreak
    sol' sol, sol' sol, la'4 r_\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 50
    s1*28
    \bar "||"

}


IvlI = {
    \global
    %\notypeset
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


Ivc = {
    \global
    \clef bass
    <<\Ivcn \forma>>

}

Ibc = {
    \global
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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    mid4\tr
    fad r sol
    fad r fad
    sol r r
    fad r r
    mi r r
    fad2.\fermata

}

IIvlIIn = \relative do'' {

    si4
    la r lad
    si r do!
    si r r
    lad r r
    si r r
    lad2\fermata

}

IIvlan = \relative do' {

    sold'4
    dod, r dod
    re r la'
    sol r r
    dod r r
    si r r
    dod2.\fermata

}


IIvcn = \relative do {

    sold'4
    fad r mi
    re r red
    mi r r
    fad r r
    sol r r
    fad2.\fermata

}


IIbcn = \relative do {

    sold'4
    fad r mi
    re r red
    mi r r
    fad r r
    sol r r
    fad2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key re\major
    \tempo 4 = 50
    \partial 4 s4
    s2.*6
    \bar "||"

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


IIvc = {
    \global
    \clef bass
    <<\IIvcn \forma>>

}

IIbc = {
    \global
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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    la'4. si la8 fad si la fad si
    la fad sol la si la sol  la sol fad sol fad
    mi la sold la sold la mi la sold la sold la\mbreak

    %4
    fad sold la si la si sold la si dod si dod
    la si dod re dod re si sold la si la si
    dod si dod re dod re mi4. dod

    %7
    la mi fad8 sold la mi la sold\mbreak
    la4. r4 r8 la fad sol la si la
    sol mi fad sol la sol fad re mi fad sol fad

    %10
    mi4. r8 r mi fad4. sol
    la8 fad la si fad si sol mi sol la mi la
    fad re fad sol re sol\mbreak mi dod mi fad re fad

    %13
    re4. si' re, fad
    si,4 mi8 re4 dod8 la4 fad'8 si4 la8
    sol la si mi, la sol fad4. la\mbreak

    %16
    si4.\staccatissimo la\staccatissimo mi8 dod fad mi dod fad
    mi dod re mi re mi fad mi fad sol fad sol
    la fad si la fad si la fad si la fad si

    %19
    la la, la' sol sol, sol' fad sol la mi4.
    re r4 r8\fermata

}

IIIvlIIn = \relative do'' {

    fad4. sol fad8 re sol fad re sol
    fad re mi fad sol fad mi fad mi re mi re

    %3
    dod mi re mi re mi dod mi re mi re mi\mbreak
    re mi fad sold fad sold mi fad sold la sold la
    fad sold la si la si sold mi fad sold fad sold

    %6
    la sold la si la si dod4. la
    mi dod re4 dod8 dod4 si8\mbreak
    la4. r4 r8 fad'8 re mi fad sol fad

    %9
    mi dod re mi fad mi re si dod re mi re
    dod4. r8 r dod re4. mi
    fad fad mi mi

    %12
    re re\mbreak dod dod
    si fad' si re,
    fad4 si,8 si4 lad8 si4. re~

    %15
    re dod re fad\mbreak
    mi re dod8 la re dod la re
    dod la si dod si dod re dod re mi re mi

    %18
    fad re sol fad re sol fad re sol fad re sol
    fad fad, fad' mi mi, mi' re mi fad la,4 dod8
    re4. r4 r8

}

IIIvlan = \relative do' {

    re4. re re r4 r8
    fad4. r4 r8 sol4. la4 si8
    mi,4. mi la mi\mbreak

    %4
    fad re sold fad
    fad re mi mi
    mi sold la8 dod si dod si dod

    %7
    mi, dod' si dod si dod la4 fad8 mi4.\mbreak
    mi4. r4 r8 r2.
    R1.

    %10
    la4. r8 r mi la si la sol la sol
    fad4. si mi, la
    re, sol\mbreak dod, fad

    %13
    fad8 si lad si lad si fad si lad si lad si
    fad4 sol8 fad4. fad r4 r8
    R1.

    %16
    r2. la4. r4 r8
    la4. mi la sol
    fad r4 r8 r2.

    %19
    fad4. sol la8 sol fad mi4 la8
    fad4. r4 r8\fermata

}


IIIvcn = \relative do {

    re4. sol, re' r4 r8
    re4. r4 r8 mi4. fad4 sol8
    la dod si dod si dod la dod si dod si dod\mbreak

    %4
    re,4. si dod la
    re si mi dod
    dod si la8 la' sold la sold la

    %7
    la, la' sold la sold la re,4. mi\mbreak
    la, r4 r8  r2.

    %9
    R1.
    la'8 si la sol la sol fad sol fad mi fad mi
    re4. re' re dod

    %12
    dod si\mbreak si lad
    si8 re dod re dod re si re dod re dod re
    re,4 mi8 fad4 fad,8 si4. r4 r8

    %15
    R1.
    r2. la'4. r4 r8
    la4. sol fad mi

    %18
    re r4 r8 r2.
    re4. mi fad8 mi re la'4 la,8
    re4. r4 r8\fermata

}


IIIbcn = \relative do {

    re4. sol, re' r4 r8
    re4. r4 r8 mi4. fad4 sol8
    la dod si dod si dod la dod si dod si dod\mbreak

    %4
    re,4. si dod la
    re si mi dod
    dod si la8 la' sold la sold la

    %7
    la, la' sold la sold la re,4. mi\mbreak
    la, r4 r8  r2.

    %9
    R1.
    la'8 si la sol la sol fad sol fad mi fad mi
    re4. re' re dod

    %12
    dod si\mbreak si lad
    si8 re dod re dod re si re dod re dod re
    re,4 mi8 fad4 fad,8 si4. r4 r8

    %15
    R1.
    r2. la'4. r4 r8
    la4. sol fad mi

    %18
    re r4 r8 r2.
    re4. mi fad8 mi re la'4 la,8
    re4. r4 r8\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 12/8
    \key re\major
    \tempo 2. = 60
    s1.*7
    s2. \bar ".|:"\break s
    s1.*11
    s2.
    \bar ":|."

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


IIIvc = {
    \global
    \clef bass
    <<\IIIvcn \forma>>

}

IIIbc = {
    \global
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
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup{Agrippina - Sinfonia}
    composer = \markup \center-column{"N. Porpora (1686-1768)"}

}

\markup \huge {[1.] Presto e staccato}

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
            \set Staff.instrumentName = \markup  \center-column{"[Violoncello]"}
            \Ivc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
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

%\pageBreak

\markup \huge {[2.] Largo}

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
            \IIvc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 35)  %aumenta lo spazio orizzontale
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

\markup \huge {[3.] Presto - Forte e staccato}

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
            \IIIvc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"contrabass"
            \IIIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
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
