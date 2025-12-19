\language "italiano"
	%********************************** VARIABILI

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
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

IvlIn = \relative do'' {

    re8
    la' la la la fad8. mi16 re mi fad sol
    la sol la si la si la sol fad8. mi16 re fad sol la
    si sol sol si si sol sol si\mbreak la fad fad la la fad fad la

    %4
    sol mi mi sol sol mi mi sol fad8 la, re4~
    re8 do16 si do8 do do si mi4~
    mi8 re16 dod! re8 re re dod la'4~

    %7
    la8 sol16 fad sol8 fad16 mi fad8 re la dod\mbreak
    re sol4 fad16 mi fad8 re la dod
    re re, r16 fad' sol la fad4 r16 fad sol la

    %10
    mi8 la r16 la sold la mi8 la r16 la sold la
    re,4 r16 re mi fad re4 r16 re mi fad
    dod8 fad r16 fad mi fad\mbreak dod8 fad r16 fad mi fad

    %13
    si,4 r16 si dod re si4 r16 si dod re
    la8 re r16 re dod re la8 re r16 re dod re
    si fad' mi fad re fad dod fad si, si la si fad si fad si\mbreak

    %16
    sold8 mi r16 mi fad sold la si dod la si dod re si
    dod mi mi mi sold, la si sold la si dod la si dod re si
    dod mi mi mi sold, la si sold la si dod la si dod re si

    %19
    dod re mi dod re mi fad re mi re dod re si4
    la16\p si dod la si dod re si dod mi mi mi sold, la si sold
    la si dod la si dod re si dod mi mi mi sold, la si sold\mbreak

    %22
    la si dod la si dod re si dod re mi dod re mi fad re
    mi re dod re si4 la r8 la
    mi'8 mi mi mi dod8. si16 la si dod re

    %25
    mi re mi fad mi fad mi re\mbreak dod8.[si16 la8 dod]
    fad fad fad fad fad8. dod16 si dod re mi
    fad mi fad sold? fad sold fad mi re8. dod16 si re mi fad

    %28
    sol? re re sol sol re re sol sol fad mi re dod dod re mi\mbreak
    fad dod dod fad fad dod dod fad fad mi re dod si si dod re
    mi si si mi mi si si mi lad,8 fad r16 fad' sold lad

    %31
    si si si si si si si si\mbreak lad fad fad fad lad fad fad fad
    la! la la la la la la la sold mi mi mi sold mi mi mi
    sol! sol sol sol sol sol sol sol sol8 fad4 mi16 re

    %34
    dod re mi re dod4\mbreak si16 dod re mi fad fad fad fad
    fad fad fad fad fad fad fad fad si,\p dod re mi fad fad fad fad
    fad fad fad fad fad fad fad fad re\f mi fad sol la la la la\mbreak

    %37
    la la la la la la la la re,\p mi fad sol la la la la
    la la la la la la la la fad\f la la la fad la la la
    fad si si si fad si si si\mbreak mi, si' si si mi, si' si si

    %40
    mi, la la la mi la la la re, la' la la re, la' la la
    re, sol sol sol re sol sol sol dod, si la dod re dod si re\mbreak
    mi re dod mi fad mi re fad sol fad mi sol la sol fad la

    %43
    si la sol fad mi4 re r16 la si do
    si sol fad sol si sol fad sol la fad mi fad la fad mi fad\mbreak
    sol mi re mi sol mi re mi fad re mi fad sol la si dod

    %46
    re8 la re4. do16 si do8 do
    do? si mi4. re16 dod re8 re
    re dod la'4. sol16 fad sol8 fad16 mi\mbreak

    %49
    fad8 re la dod re sol4 fad16 mi
    fad8 re la dod re sol,4 fad16 mi
    fad8 re la dod re4\fermata r8

}

IvlIIn = \relative do'' {

    re8
    la' la la la fad8. mi16 re mi fad sol
    la sol la si la si la sol fad8. mi16 re fad sol la
    si sol sol si si sol sol si\mbreak la fad fad la la fad fad la

    %4
    sol mi mi sol sol mi mi sol fad8 la, re4~
    re8 do16 si do8 do do si mi4~
    mi8 re16 dod! re8 re re dod la'4~

    %7
    la8 sol16 fad sol8 fad16 mi fad8 re la dod\mbreak
    re sol4 fad16 mi fad8 re la dod
    re16 fad sol la fad4 r16 fad sol la fad4\mbreak

    %10
    r16 la sold la mi8 la r16 la sold la mi8 la
    r16 re, mi fad re4 r16 re mi fad re4
    r16 fad mi fad dod8 fad r16 fad mi fad dod8 fad

    %13
    r16 si, dod re si4 \mbreak r16 si dod re si4
    r16 re dod re la8 re r16 re dod re la8 re
    si16 re dod re si re la re fad,8 si si si

    %16
    si4 r r r16 mi, fad sold
    la si dod la si dod re si dod mi mi mi sold, la si sold
    la si dod la si dod re si dod mi mi mi sold, la si sold\mbreak

    %19
    la si dod la si dod re si dod si la si sold4
    la4\p r la16 si dod la si dod re si
    dod mi mi mi sold, la si sold la si dod la si dod re si\mbreak

    %22
    dod mi mi mi sold, la si sold la si dod la si dod re si
    dod si la si sold4 la r8 la
    mi'8 mi mi mi dod8. si16 la si dod re

    %25
    mi re mi fad mi fad mi re\mbreak dod8.[si16 la8 dod]
    fad fad fad fad fad8. dod16 si dod re mi
    fad mi fad sold? fad sold fad mi re8. dod16 si si dod re

    %28
    si8 si si si mi,4 r16 la si dod
    la8 la la la re,4 r16 sol la si
    sol8 sol sol sol dod,16 dod' re mi fad fad sold lad

    %31
    si si si si si si si si\mbreak lad fad fad fad lad fad fad fad
    la! la la la la la la la sold mi mi mi sold mi mi mi
    sol! sol sol sol sol sol sol sol sol8 fad4 mi16 re

    %34
    dod re mi re dod4\mbreak si r16 fad sold lad
    si dod re si dod re mi dod re8\p si4 lad8
    si16 dod re si dod re mi dod re8\f re4 dod8\mbreak

    %37
    re16 mi fad re mi fad sol mi fad8\p re4 dod8
    re16 mi fad re mi fad sol mi fad\f fad fad fad re fad fad fad
    si, re re re si re re re\mbreak dod mi mi mi dod mi mi mi

    %40
    la, dod dod dod la dod dod dod si re re re si re re re
    sol, si si si sol si si si la8 dod re16 dod si re\mbreak
    mi re dod mi fad mi re fad sol fad mi sol la sol fad la

    %43
    si la sol fad mi4 re r16 la si do
    si sol fad sol si sol fad sol\mbreak la fad mi fad la fad mi fad
    sol mi re mi sol mi re mi fad re mi fad sol la si dod

    %46
    re8 la re4. do16 si do8 do
    do si mi4. re16 dod re8 re
    re dod la'4. sol16 fad sol8 fad16 mi

    %49
    fad8 re la dod re sol4 fad16 mi
    fad8 re la dod re sol,4 fad16 mi
    fad8 re la dod re4\fermata r8

}

IvlrpIn = \relative do'' {

    re8
    la' la la la fad8. mi16 re mi fad sol
    la sol la si la si la sol fad8. mi16 re fad sol la
    si sol sol si si sol sol si\mbreak la fad fad la la fad fad la

    %4
    sol mi mi sol sol mi mi sol fad8 la, re4~
    re8 do16 si do8 do do si mi4~
    mi8 re16 dod! re8 re re dod la'4~

    %7
    la8 sol16 fad sol8 fad16 mi fad8 re la dod\mbreak
    re sol4 fad16 mi fad8 re la dod
    re la la la la la la la
    
    %4
    la la la la\mbreak la la la la
    fad fad fad fad fad fad fad fad
    fad fad fad fad fad fad fad fad
    
    %7
    re re' re re re re re re
    re re, re re re re re re\mbreak
    fad16 fad' mi fad re fad dod fad si, si la si fad si fad si\mbreak

    %16
    sold8 mi r16 mi fad sold la si dod la si dod re si
    dod mi mi mi sold, la si sold la si dod la si dod re si
    dod mi mi mi sold, la si sold la si dod la si dod re si

    %19
    dod re mi dod re mi fad re mi re dod re si4
    la16\p si dod la si dod re si dod mi mi mi sold, la si sold
    la si dod la si dod re si dod mi mi mi sold, la si sold\mbreak

    %22
    la si dod la si dod re si dod re mi dod re mi fad re
    mi re dod re si4 la r8 la
    mi'8 mi mi mi dod8. si16 la si dod re

    %25
    mi re mi fad mi fad mi re\mbreak dod8.[si16 la8 dod]
    fad fad fad fad fad8. dod16 si dod re mi
    fad mi fad sold? fad sold fad mi re8. dod16 si re mi fad

    %28
    sol? re re sol sol re re sol sol fad mi re dod dod re mi\mbreak
    fad dod dod fad fad dod dod fad fad mi re dod si si dod re
    mi si si mi mi si si mi lad,8 fad r16 fad' sold lad

    %31
    si si si si si si si si\mbreak lad fad fad fad lad fad fad fad
    la! la la la la la la la sold mi mi mi sold mi mi mi
    sol! sol sol sol sol sol sol sol sol8 fad4 mi16 re

    %34
    dod re mi re dod4\mbreak si16 dod re mi fad fad fad fad
    fad fad fad fad fad fad fad fad si,\p dod re mi fad fad fad fad
    fad fad fad fad fad fad fad fad re\f mi fad sol la la la la\mbreak

    %37
    la la la la la la la la re,\p mi fad sol la la la la
    la la la la la la la la fad\f la la la fad la la la
    fad si si si fad si si si\mbreak mi, si' si si mi, si' si si

    %40
    mi, la la la mi la la la re, la' la la re, la' la la
    re, sol sol sol re sol sol sol dod, si la dod re dod si re\mbreak
    mi re dod mi fad mi re fad sol fad mi sol la sol fad la

    %43
    si la sol fad mi4 re r16 la si do
    si sol fad sol si sol fad sol la fad mi fad la fad mi fad\mbreak
    sol mi re mi sol mi re mi fad re mi fad sol la si dod

    %46
    re8 la re4. do16 si do8 do
    do? si mi4. re16 dod re8 re
    re dod la'4. sol16 fad sol8 fad16 mi\mbreak

    %49
    fad8 re la dod re sol4 fad16 mi
    fad8 re la dod re sol,4 fad16 mi
    fad8 re la dod re4\fermata r8

}

IvlrpIIn = \relative do'' {

    re8
    la' la la la fad8. mi16 re mi fad sol
    la sol la si la si la sol fad8. mi16 re fad sol la
    si sol sol si si sol sol si\mbreak la fad fad la la fad fad la

    %4
    sol mi mi sol sol mi mi sol fad8 la, re4~
    re8 do16 si do8 do do si mi4~
    mi8 re16 dod! re8 re re dod la'4~

    %7
    la8 sol16 fad sol8 fad16 mi fad8 re la dod\mbreak
    re sol4 fad16 mi fad8 re la dod
    re8 fad, fad fad fad fad fad fad
    
    %10
    mi mi mi mi mi mi mi mi\mbreak
    re re re re re re re re
    dod dod dod dod dod dod dod dod
    
    %13
    si si' si si si si si si
    la la la la la la la la
    la la la la la la la la

    %16
    sold4 r r r16 mi fad sold
    la si dod la si dod re si dod mi mi mi sold, la si sold
    la si dod la si dod re si dod mi mi mi sold, la si sold\mbreak

    %19
    la si dod la si dod re si dod si la si sold4
    la4\p r la16 si dod la si dod re si
    dod mi mi mi sold, la si sold la si dod la si dod re si\mbreak

    %22
    dod mi mi mi sold, la si sold la si dod la si dod re si
    dod si la si sold4 la r8 la
    mi'8 mi mi mi dod8. si16 la si dod re

    %25
    mi re mi fad mi fad mi re\mbreak dod8.[si16 la8 dod]
    fad fad fad fad fad8. dod16 si dod re mi
    fad mi fad sold? fad sold fad mi re8. dod16 si si dod re

    %28
    si8 si si si mi,4 r16 la si dod
    la8 la la la re,4 r16 sol la si
    sol8 sol sol sol dod,16 lad' si dod lad8 fad'

    %31
    fad fad sold sold dod,4 r16 red red red
    mi8 mi fad fad\mbreak si,4 r16 dod dod dod
    re8 re mi mi la, re4 dod16 si

    %34
    lad8[si si8. lad16] si4 r16 fad sold lad
    si dod re si dod re mi dod re8\p si4 lad8
    si16 dod re si dod re mi dod re8\f re4 dod8\mbreak

    %37
    re16 mi fad re mi fad sol mi fad8\p re4 dod8
    re16 mi fad re mi fad sol mi fad\f re re re fad re re re\mbreak
    re4 r16 si si si mi dod dod dod mi dod dod dod

    %40
    dod4 r16 la la la re si si si re si si si
    si4 r16 mi mi mi mi8 la la, la'
    la, la' la, la'\mbreak si, dod re4~

    %43
    re8 mi16 fad dod4 re r16 la si do
    si sol fad sol si sol fad sol la fad mi fad la fad mi fad
    sol mi re mi sol mi re mi fad re mi fad sol la si dod

    %46
    re8 la re4. do16 si do8 do
    do si mi4. re16 dod re8 re
    re dod la'4. sol16 fad sol8 fad16 mi

    %49
    fad8 re la dod re sol4 fad16 mi
    fad8 re la dod re sol,4 fad16 mi
    fad8 re la dod re4\fermata r8

}

Ivlan = \relative do' {
   
   r8
   r4 r8 dod fad fad fad fad
   mi8.[re16 mi8 la] la4 r8 la
   re re re re re4 re~
   
   %4
   re dod re4. fad,16 sol
   la8 la la la\mbreak re,4 r8 sold16 la
   si8 si si si mi,4 r8 dod'16 re
   
   %7
   mi8 mi mi mi la, sol?16 fad mi4
   re8 dod16 re mi8 mi la, sol16 fad mi4
   fad8 re' re re re re re re
   
   %10
   dod dod dod dod\mbreak dod dod dod dod
   si si si si si si si si
   la la la la la la la la
   
   %13
   sol sol' sol sol sol sol sol sol
   fad fad fad fad fad fad fad fad
   re re re re re re re re\mbreak 
   
   %16
   mi4 r16 sold la si mi,8 mi mi mi
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi
   
   %19
   mi mi mi mi mi fad si, mi
   mi\p mi mi mi mi mi mi mi\mbreak
   mi mi mi mi mi mi mi mi
   
   %22
   mi mi mi mi mi mi mi mi
   mi fad si, mi mi4 r8 r
   r4 r8 sold dod dod dod dod
   
   %25
   si8.[la16 si8 si] mi, mi mi mi
   dod4 r8 fad\mbreak fad fad fad fad
   dod dod' dod dod fad,4 r8 re
   
   %28
   re re re re dod4 r8 dod   
   dod dod dod dod si4 r8 si
   si si si si lad4 r8 lad'
   
   %31
   fad fad dod dod dod4 r8 fad
   mi mi si si\mbreak si4 r8 mi
   re re la la la si4 dod8
   
   %34
   dod sol' dod, fad re16 fad fad fad dod dod dod dod
   re4 r8 fad fad16\p fad fad fad dod dod dod dod
   re4 r8 fad fad\f re mi4
   
   %37
   fad r8 la,\mbreak la4\p mi'
   fad r8 la la\f la la la
   si4 r8 sol sol sol sol sol
   
   %40
   la4 r8 fad fad fad fad fad
   sol4 r8 mi mi fad fad mi16 re
   dod8 mi re fad mi sol fad la
   
   %43
   sol la la4\mbreak la r16 fad sol la
   re,4 re re re~
   re dod re r16 fad sol la
   
   %46
   fad8 fad fad fad la4. fad8
   re sol sol sol si4 r8 sold
   mi dod dod dod mi4. dod8
   
   %49
   la' fad mi4 re mi\mbreak
   la,8 re mi4 fad8 sol16 fad mi8 dod
   la re mi4 re\fermata r8
   
}

Ifgn = \relative do {

    r8 r4 r8 la' re re re re
    dod8.[si16 dod8 la] re do si la
    sol sol, sol sol' fad4. si,8

    %4
    mi mi, mi mi' re4. re16 mi
    fad4. re8\mbreak sol4 r8 mi16 fad
    sold4. mi8 la4 r8 la,16 si

    %7
    dod4. la8 re si' sol la
    fad mi16 re dod8 la re si' sol la
    re,4 r r2

    %10
    R1*6
    r8  mi mi re dod la' sold mi
    la,4 mi' la mi
    la, mi' la mi

    %19
    la,8 la' sold mi la re, mi mi,
    la\p la' sold mi la,4 mi'
    la mi la, mi'

    %22
    la mi la,8 la' sold mi
    la re, mi mi, la4 r8 r\mbreak
    r4 r8 mi' la la la la

    %25
    sold8.[fad16 sold8 mi] la la la la
    lad4 r8 fad si si si si
    lad8.[sold16 lad8 fad] si4 r8 si,

    %28
    mi mi mi  mi la4 r8 la,
    re re re re sol4 r8 sol,
    dod dod dod dod\mbreak fad fad fad mi16 fad

    %31
    red4 mid fad r
    dod red mi? r
    si dod re mi

    %34
    fad8 mi fad fad, si si' lad fad
    re si'4 lad8 si si,\p fad'[fad,]
    si si'4 lad8 si si,\f la la'?

    %37
    fad re4 dod8\mbreak re\p re' la[la,]
    re re'4 dod8 re4 re,\f
    sol, sol' dod, dod,

    %40
    fad fad' si, si'
    mi, mi, la si
    dod re mi fad

    %43
    sol8 re la' la, re mi fad re
    sol4 sol, fad fad'
    mi mi, re r

    %46
    r8 re' re[re]\mbreak fad4. re8
    sol mi mi mi sold4. mi8
    la la, la la dod4. la8

    %49
    re si' sol la fad mi16 re dod8 la
    re si' sol la fad mi16 re dod8 la
    re si sol la re,4\fermata r8

}

Ibcn = \relative do {

    r8 r4 r8 la' re re re re
    dod8.[si16 dod8 la] re do si la
    sol sol, sol sol' fad4. si,8

    %4
    mi mi, mi mi' re4. re16 mi
    fad4. re8\mbreak sol4 r8 mi16 fad
    sold4. mi8 la4 r8 la,16 si

    %7
    dod4. la8 re si' sol la
    fad mi16 re dod8 la re si' sol la
    re,\clef tenor \key re\major re' re re re re re re

    %10
    dod dod dod dod dod dod dod dod
    si si si si\mbreak si si si si
    la la la la la la la la

    %13
    sol sol' sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad
    re re re re red red red red

    %16
    mi \clef bass \key re\major mi, mi re\mbreak dod la' sold mi
    la,4 mi' la mi
    la, mi' la mi

    %19
    la,8 la' sold mi la re, mi mi,
    la\p la' sold mi la,4 mi'
    la mi la, mi'

    %22
    la mi la,8 la' sold mi
    la re, mi mi, la4 r8 r\mbreak
    r4 r8 mi' la la la la

    %25
    sold8.[fad16 sold8 mi] la la la la
    lad4 r8 fad si si si si
    lad8.[sold16 lad8 fad] si4 r8 si,

    %28
    mi mi mi  mi la4 r8 la,
    re re re re sol4 r8 sol,
    dod dod dod dod\mbreak fad fad fad mi16 fad

    %31
    red4 mid fad r
    dod red mi? r
    si dod re mi

    %34
    fad8 mi fad fad, si si' lad fad
    re si'4 lad8 si si,\p fad'[fad,]
    si si'4 lad8 si si,\f la la'?

    %37
    fad re4 dod8\mbreak re\p re' la[la,]
    re re'4 dod8 re4 re,\f
    sol, sol' dod, dod,

    %40
    fad fad' si, si'
    mi, mi, la si
    dod re mi fad

    %43
    sol8 re la' la, re mi fad re
    sol4 sol, fad fad'
    mi mi, re r

    %46
    r8 re' re[re]\mbreak fad4. re8
    sol mi mi mi sold4. mi8
    la la, la la dod4. la8

    %49
    re si' sol la fad mi16 re dod8 la
    re si' sol la fad mi16 re dod8 la
    re si sol la re,4\fermata r8

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s8 
    s1
    <6>
    s2 <6>
    <7>4 <6> s2
    <6>4. <7!>8 <4!> <3> s <_+>
    <6 5>2 <4>8 <3> s4
    <6>2 s8 <6> <6 5>4
    <6> <6 5> s <6 5>
    s1
    <6>2 <6>
    s1
    <6>2 <6>
    s1
    <6>2 <6>
    <6 5> <6 5>
    <_+> <6>4 <6>
    s <_+> s <_+>
    s <_+> s <_+>
    s <6> s <_+>
    s <6> s <_+>
    s <_+> s <_+>
    s <_+> s <6>
    s <_+> s2
    s4 s8 <_+> s2
    <6>1
    <6 5>
    <6>
    <7>2 <7>
    <7> <7>
    <7> <_+>
    <6>4 <6 5> <_+>2
    <6>4 <6 5> <_+> s
    <6!> <6 5> <4>8 <3> <9 7> <8 6>
    <_+>2 s4 <6>
    s8 <5> <4 2> <6 5> s4 <4>8 <_+>
    s8 <5> <4 2> <6 5> s4 <4>8 <3>
    <6> <5> <4 2> <6 5> s4 <4>8 <3>
    s <5> <4 2> <6 5> s2
    <7> <7>
    <7> <7> <
    7> s4 <7>
    <6>2 <6>4 <6>
    s4 <4>8 <3> s4 s8 <7!>
    s2 <6>
    <7>4 <6> s2
    s <6>4. <7!>8
    <4>2 <6 5>
    <4> <6 5>
    s4 <6 5> <6> <6 5>
    s <6 5> <6> <6 5>
    s <6 5>

}

forma = {

    \key re\major
    \time 4/4
    \tempo 2 = 60
    \partial 8 s8
    s1*22
    s2 s4 s8
    \bar ":..:"\break
     s8
    s1*27
    s2 s4 s8
    \bar ":|."

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


IvlrpI = {
    \Iglobal
    <<\IvlrpIn \forma>>
}


IvlrpII = {
    \Iglobal
    <<\IvlrpIIn \forma>>
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



IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

IIvlIn = \relative do'' {
   
   la'8.\solo[(sol16) fad8.(sol16) la8.(si16)]
   \grace si8 la4. sol8 fad8. sol16
   la4 si8.[(la16) sol8.(fad16)]
   
   %4
   \grace fad8 mi2 re4
   la' si8.[(la16) sol8.(fad16)]
   mi4. mi8 la4
   
   %7
   re, mi8.[(re16) dod8.(re16)]
   si2 la4
   la'8.\tu[(sol16) fad8.(sol16) la8.(si16)]
   
   %10
   \grace si8 la4. sol8 fad8. sol16
   la4 si8.[(la16) sol8.(fad16)]
   \grace fad8 mi2 re4
   
   %13
   la' si8.[(la16) sol8.(fad16)]
   mi4. mi8 la4
   re, mi8.[(re16) dod8.(re16)]
   
   %16
   si2 la4
   mi'8.\soli[(re16) dod8.(re16) mi8.(fad16)]
   \grace fad8 mi4. re8  dod8. re16
   
   %19
   mi4 fad8.[(mi16) re8. (dod16)]\mbreak
   si2 la4
   la'8.[(sol16) fad8.(sol16) la8.(si16)]
   
   %22
   \grace si8 la4. sol8 fad8. sol16
   la4 si8.[(la16) sol8.(fad16)]
   mi4 la4. la8
   
   %25
   la4 re, sol
   sol4. la8 fad [mi]
   fad sol mi2
   
   %28
   re2.
   mi8.\tu[(re16) dod8.(re16) mi8.(fad16)]
   \grace fad8 mi4. re8  dod8. re16
   
   %31
   mi4 fad8.[(mi16) re8. (dod16)]
   si2 la4
   la'8.[(sol16) fad8.(sol16) la8.(si16)]
   
   %34
   \grace si8 la4. sol8 fad8. sol16
   la4 si8.[(la16) sol8.(fad16)]
   mi4 la4. la8
   
   %37
   la4 re, sol
   sol4. la8 fad8. mi16
   fad8 sol mi2
   
   %40
   re2.\fermata
   
}

IIvlIIn = \relative do'' {
   
   fad8.\solo[(mi16) re8.(mi16) fad8.(sol16)]
   \grace sol8 fad4. mi8 re8. mi16
   fad4 sol8.[(fad16) mi8.(re16)]
   
   %4
   dod2 re4
   fad sol8.[(fad16) mi8.(re16)]
   dod4. dod8 fad4
   
   %7
   si, dod8.[(si16) la8.(si16)]
   sold2 la4
   fad'8.\tu[(mi16) re8.(mi16) fad8.(sol16)]
   
   %10
   \grace sol8 fad4. mi8 re8. mi16
   fad4 sol8.[(fad16) mi8.(re16)]
   dod2 re4
   
   %13
   fad sol8.[(fad16) mi8.(re16)]
   dod4. dod8 fad4
   si, dod8.[(si16) la8.(si16)]
   
   %16
   sold2 la4
   dod8.\soli[(si16) la8.(si16) dod8.(re16)]
   \grace re8 dod4. si8 la8. si16
   
   %19
   dod4 re8.[(dod16) si8.(la16)]
   sold2 la4
   fad'8.[(mi16) re8.(mi16) fad8.(sol16)]
   
   %22
   \grace sol8 fad4. mi8 re8. mi16
   fad4 sol8.[(fad16) mi8.(re16)]
   dod8.[(si16) do8.(re16) do8.(re16)]
   
   %25
   si8.[(la16) si8.(dod!16) re8.(mi16)]
   dod8.[(la16) si8.(dod16)] re4~
   re8 mi dod2
   
   %28
   re2.\mbreak
   dod8.\tu[(si16) la8.(si16) dod8.(re16)]
   \grace re8 dod4. si8 la8. si16
   
   %31
   dod4 re8.[(dod16) si8.(la16)]
   sold2 la4
   fad'8.[(mi16) re8.(mi16) fad8.(sol16)]
   
   %34
   \grace sol8 fad4. mi8 re8. mi16
   fad4 sol8.[(fad16) mi8.(re16)]
   dod8.[(si16) do8.(re16) do8.(re16)]
   
   %37
   si8.[(la16) si8.(dod!16) re8.(mi16)]
   dod8.[(la16) si8.(dod16)] re4~
   re8 mi dod2
   
   %40
   re2.\fermata

}

IIvlrpIn = \relative do'' {
   
   R2.*8
   la'8.\tu[(sol16) fad8.(sol16) la8.(si16)]
   
   %10
   \grace si8 la4. sol8 fad8. sol16
   la4 si8.[(la16) sol8.(fad16)]
   \grace fad8 mi2 re4
   
   %13
   la' si8.[(la16) sol8.(fad16)]
   mi4. mi8 la4
   re, mi8.[(re16) dod8.(re16)]
   
   %16
   si2 la4
   R2.*12
   mi'8.\tu[(re16) dod8.(re16) mi8.(fad16)]
   \grace fad8 mi4. re8  dod8. re16
   
   %31
   mi4 fad8.[(mi16) re8. (dod16)]
   si2 la4
   la'8.[(sol16) fad8.(sol16) la8.(si16)]
   
   %34
   \grace si8 la4. sol8 fad8. sol16
   la4 si8.[(la16) sol8.(fad16)]
   mi4 la4. la8
   
   %37
   la4 re, sol
   sol4. la8 fad8. mi16
   fad8 sol mi2
   
   %40
   re2.\fermata

}

IIvlrpIIn = \relative do'' {
   
   R2.*8
   fad8.\tu[(mi16) re8.(mi16) fad8.(sol16)]
   
   %10
   \grace sol8 fad4. mi8 re8. mi16
   fad4 sol8.[(fad16) mi8.(re16)]
   dod2 re4
   
   %13
   fad sol8.[(fad16) mi8.(re16)]
   dod4. dod8 fad4
   si, dod8.[(si16) la8.(si16)]
   
   %16
   sold2 la4
   R2.*12
   dod8.\tu[(si16) la8.(si16) dod8.(re16)]
   \grace re8 dod4. si8 la8. si16
   
   %31
   dod4 re8.[(dod16) si8.(la16)]
   sold2 la4
   fad'8.[(mi16) re8.(mi16) fad8.(sol16)]
   
   %34
   \grace sol8 fad4. mi8 re8. mi16
   fad4 sol8.[(fad16) mi8.(re16)]
   dod8.[(si16) do8.(re16) do8.(re16)]
   
   %37
   si8.[(la16) si8.(dod!16) re8.(mi16)]
   dod8.[(la16) si8.(dod16)] re4~
   re8 mi dod2
   
   %40
   re2.\fermata

}

IIvlan = \relative do' {
   
   re'4 re sol,
   re'2.
   re4 sol,8.[la16 si8. sol16]
   
   %4
   la2 re,4
   re'4. re,8 fad8. sol16
   la4. sold8 fad4
   
   %7
   sold la re,\mbreak
   mi2 la,4
   re\tu re re
   
   %10
   re2.
   re4 re4. re8
   la2 la4
   
   %13
   re re4. si'8
   mi,4. mi8 re4
   re dod fad
   
   %16
   mi2 mi4
   la\soli la re,
   la'2.
   
   %19
   la4 re,8.[mi16 fad8. re16]\mbreak
   mi2 la,4
   re re sol,
   
   %22
   re'2.
   re'4 sol,8.[la16 si8. sol16]
   la8.[(sol16) fad8.(mi16) fad8.(re16)]
   
   %25
   sol8.[(fad16) sol8.(la16) si8. (sol16)]
   la4. la8 si4
   sol la la,
   
   %28
   re2.
   la'4\tu la la\mbreak
   la2.
   
   %31
   mi4 la4. la8
   mi2 mi4
   re4 re re
   
   %34
   re2.
   re4 re4. re8
   la2 fad'4 
   
   %37
   re sol4. si8
   mi,2 re4
   si' mi,4. la8
   
   %40
   la2.\fermata 
   
}

IIfgn = \relative do {
   
   R2.*8
   re4 re sol,
   
   %10
   re'2.
   re'4 sol,8.[la16 si8. sol16]
   la2 re,4
   
   %13
   re'4. re,8 fad8. sol16
   la4. sold8 fad4
   sold la re,
   
   %16
   mi2 la,4
   R2.*12
   la'4 la re,
   la'2.
   
   %31
   la4 re,8.[mi16 fad8. re16]
   mi2 la,4
   re re sol,
   
   %34
   re'2.
   re'4 sol,8.[[la16 si8. sol16]
   la8.[(sol16) fad8. (mi16) fad8. (re16)]
   
   %37
   sol8.[(fad16) sol8. (la16) si8. (sol16)]\mbreak
   la4. la8 si4
   sol la la,
   
   %40
   re2.\fermata

}

IIbcn = \relative do {
   
   \clef tenor re''4 re sol,
   re'2.
   re4 sol,8.[la16 si8. sol16]
   
   %4
   la2 re,4
   re'4. re,8 fad8. sol16
   la4. sold8 fad4
   
   %7
   sold la re,
   mi2 la,4
   \clef bass re,4 re sol,
   
   %10
   re'2.
   re'4 sol,8.[la16 si8. sol16]
   la2 re,4
   
   %13
   re'4. re,8 fad8. sol16
   la4. sold8 fad4
   sold la re,
   
   %16
   mi2 la,4
   \clef tenor la'' la re,
   la'2.
   
   %19
   la4 re,8. [mi16 fad8. re16]
   mi2 la,4
   re re sol,
   
   %22
   re'2.
   re'4 sol,8.[[la16 si8. sol16]
   la8.[sol16 fad8. mi16 fad8. re16]
   
   %25
   
   sol8.[fad16 sol8. la16 si8. sol16]\mbreak
   la4. la8 si4
   sol la la,
   
   %28
   re2.
   \clef bass  la4 la re,
   la'2.
   
   %31
   la4 re,8.[mi16 fad8. re16]
   mi2 la,4
   re re sol,
   
   %34
   re'2.
   re'4 sol,8.[[la16 si8. sol16]
   la8.[(sol16) fad8. (mi16) fad8. (re16)]
   
   %37
   sol8.[(fad16) sol8. (la16) si8. (sol16)]\mbreak
   la4. la8 si4
   sol la la,
   
   %40
   re2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2.*13
    s2 <6>4
    <6 5> s <6 5>
    <_+>2.
    s
    s
    s2 <6>4
    <_+>2.
    s2.*3
    s4 <6 5!> <6 5!>
    <9> <8> s
    <7>2 <6 5>4
    s <4> <3>
    s2.*3
    s2 <6>4
    <_+>2.
    s2.*3
    s4 <6 5> <6 5>
    <9> <8> s
    <7>2 <6 5>4
    s <4> <3>

}

forma = {

    \key re\major
    \time 3/4
    \tempo 4 = 70
    s2.*40
    \bar "|."

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


IIvlrpI = {
    \IIglobal
    <<\IIvlrpIn \forma>>
}


IIvlrpII = {
    \IIglobal
    <<\IIvlrpIIn \forma>>
}


IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>
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
    \typeset
}



IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

IIIvlIn = \relative do'' {

   r4 fad la
   mi la la,\mbreak
   re sol sol

   %4
   sol8 fad mi fad sol la
   fad4 fad la
   mi la la,

   %7
   re sol sol
   sol8 fad mi fad sol la
   fad4 fad8 sol la si

   %10
   mi,4. fad8 sol[la]
   re, dod re mi fad sol
   la si mi,4. re8\mbreak

   %13
   re mi fad sol la si
   mi,4. fad8 sol[la]
   re, dod re mi fad sol

   %16
   la si mi,4. re8
   re4 fad,8 fad mi re
   la'4. la8 si[dod]

   %19
   re4 re2
   mi4 mi2
   fad4 fad,8 fad mi re

   %22
   la'4. la8 si[dod]
   re4 re2
   mi4 mi2\mbreak

   %25
   fad4 si8. la16 \tuplet 3/2 { sol8 (la) si }
   mi,4 la8. sol16 \tuplet 3/2 { fad8(sol) la }
   re,4 sol8. fad16 \tuplet 3/2 { mi8(fad) sol }

   %28
   dod, re mi fad sol la
   fad4 si8. la16 \tuplet 3/2 { sol8 (la) si }
   mi,4 la8. sol16 \tuplet 3/2 { fad8(sol) la }

   %31
   re,4 sol8. fad16 \tuplet 3/2 { mi8(fad) sol }
   dod, re re4. dod8\mbreak
   re8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

   %34
   la'8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }
   re'8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }
   si'8 do la4. sol8

   %37
   fad8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re]
   la' re, mi fad[(mi) re] fad[(mi) re] \mbreak
   re' re, mi fad[(mi) re] fad[(mi) re]}

   %40
   si'8 do la4. sol8
   fad8. la16 re8. mi16 fad8. re16
   si8. sol16 mi'8. fad16 sol8. mi16

   %43
   dod?8.[la16 fad'8. sol16 la8. fad16]
   si8. mi,16 mi4. re8
   re8.[la16 re8. mi16 fad8. re16]

   %46
   si8.[sol16 mi'8. fad16 sol8. mi16]\mbreak
   dod8.[la16 fad'8. sol16 la8. fad16]
   si8. mi,16 mi4. re8

   %49
   re4 fad si
   sold mi la~
   la8 si sold2

   %52
   la8 sold16 fad mi re dod si la4
   r fad' si
   sold mi la~

   %55
   la8 si sold2
   la4 mi fad
   sol sol2

   %58
   fad4. sol8 la4\mbreak
   si8 mi, \grace fad8 mi2
   re4 mi fad

   %61
   sol sol2
   fad4. sol8 la4
   si8 mi, \grace fad mi2

   %64
   re8 re, fad[la] re16(dod) si(la)
   si8 sol si[re] mi16(re) dod(si)
   dod8 la dod[mi] la16(sol) fad(mi)

   %67
   fad8 sol16 la mi8 la dod,[la']\mbreak
   fad re, fad[la] re16(dod) si(la)
   si8 sol si[re] mi16(re) dod(si)

   %70
   dod8 la dod[mi] la16(sol) fad(mi)
   fad8 mi16 re dod8 re mi,[dod']
   re, re' re, re' mi, re'

   %73
   fad, re' fad, re' sol, re'
   fad, re' fad, re' mi, dod'\mbreak
   re, la' la la si si

   %76
   la la la la si si
   la la la la sol sol
   fad16 re' fad, re' re, re' re, re' mi, re' mi, re'

   %79
   fad, re' fad, re' fad, re' fad, re' sol, re' sol, re'\mbreak
   fad, re' fad, re' fad, re' fad, re' mi, dod' mi, dod'
   re,4 la'' sol

   %82
   fad4. mi8 re4
   re4. mi16 fad dod4
   re16 re dod re re, re' dod re mi, re' dod re

   %85
   fad, re' dod re fad, re' dod re sol, re' dod re\mbreak
   fad, re' dod re fad, re' dod re mi, dod' si dod
   re, re' re re fad re re re la re re re

   %88
   si re re re sol re re re si re re re
   dod mi mi mi la mi mi mi dod mi mi mi\mbreak
   fad si si si fad si si si si la sol fad

   %91
   mi la la la mi la la la la sol fad mi
   re sol sol sol re sol sol sol sol fad mi re
   mi la la la mi la la la la sol fad mi\mbreak

   %94
   fad si si si fad si si si si la sol fad
   mi la la la mi la la la la sol fad mi
   re sol sol sol re sol sol sol sol fad mi re

   %97
   mi la la la mi la la la la sol fad mi\mbreak
   fad8 re4 do8 si[la]
   si mi4 re8 dod![si]
   dod la'4 sol8 fad[mi]

   %101
   fad re4 mi8 la,[dod]
   re, re'4 do8 si[la]
   si mi4 re8 dod![si]

   %104
   dod la'4 sol8 fad[mi]
   fad re4 mi8 la,[dod]
   re,4 re' re

   %107
   re re re
   mi mi mi
   mi mi fad

   %110
   sol4. la8 fad[mi]
   fad sol mi2
   re4 re, re

   %113
   re re re
   mi mi mi
   mi mi fad

   %116
   sol4. la8 fad[mi]
   fad sol mi2
   re2. fad'8 sol

   %119 Rondeau
   la4 re, dod re
   mi re la' re,
   si' la sol fad

   %122
   mi8 re dod si la4 fad'8 sol
   la4 re, dod re
   mi re sol fad

   %125
   mi re fad8(mi) re(dod)
   re2.  la4%% fine ripresa
   si sol8 fad mi4 dod'

   %128
   re la\mbreak fad la
   si8 la sol fad mi4 dod'
   re2 re,4 la'\p

   %131
   si sol8 fad mi4 dod'
   re la fad la
   si8(la sol fad) mi4 dod'\f

   %134
   re la mi' la,
   fad' la, sold' la,
   la' sold8 fad mi4 re

   %137
   dod8(re mi dod)\mbreak si(dod re si)
   la4 la, la fad''8 sol
   la4 re, dod re

   %140
   mi re la' re,
   si' la sol fad
   mi8 re dod si la4 fad'8 sol

   %143
   la4 re, dod re
   mi re sol fad
   mi re fad8(mi) re(dod)

   %146
   re2  re,4 fad'\mbreak
   fad fad fad fad
   fad sold8 lad si4 la8 sold

   %149
   fad4 mi8 re dod4 fad
   re si si mi
   mi mi mi mi

   %152
   mi fad8 sold la4 sold8 fad
   mi4 re8 dod si4 mi
   dod la la dod

   %155
   dod dod dod dod\mbreak
   dod fad8(mi) fad4 dod
   dod dod dod dod

   %158
   dod sold'8(fad) sold4 dod,
   dod dod dod dod
   dod la'8(sold) la2~

   %161
   la4 sold si8(la) sold(fad)
   mid4 dod fad sold
   la2 sold

   %164
   fad2. la8 sold
   la4 re, dod re
   mi re la' re,

   %167
   si' la sol fad
   mi8 re dod si la4 fad'8 sol
   la4 re, dod re

   %170
   mi re sol fad
   mi re fad8(mi) re(dod)
   re2\fermata r

}

IIIvlIIn = \relative do'' {

   r4 fad la
   mi la la,\mbreak
   re sol sol

   %4
   sol8 fad mi fad sol la
   fad4 fad la
   mi la la,

   %7
   re sol sol
   sol8 fad mi fad sol la
   fad4 fad8 sol la si

   %10
   mi,4. fad8 sol[la]
   re, dod re mi fad sol
   la si mi,4. re8\mbreak

   %13
   re mi fad sol la si
   mi,4. fad8 sol[la]
   re, dod re mi fad sol

   %16
   la si mi,4. re8
   re4 fad,8 fad mi re
   la'4. la8 si[dod]

   %19
   re4 re2
   mi4 mi2
   fad4 fad,8 fad mi re

   %22
   la'4. la8 si[dod]
   re4 re2
   mi4 mi2\mbreak

   %25
   fad4 si8. la16 \tuplet 3/2 { sol8 (la) si }
   mi,4 la8. sol16 \tuplet 3/2 { fad8(sol) la }
   re,4 sol8. fad16 \tuplet 3/2 { mi8(fad) sol }

   %28
   dod, re mi fad sol la
   fad4 si8. la16 \tuplet 3/2 { sol8 (la) si }
   mi,4 la8. sol16 \tuplet 3/2 { fad8(sol) la }

   %31
   re,4 sol8. fad16 \tuplet 3/2 { mi8(fad) sol }
   dod, re re4. dod8\mbreak
   re8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

   %34
   la'8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }
   re'8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }
   si'8 do la4. sol8

   %37
   fad8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re]
   la' re, mi fad[(mi) re] fad[(mi) re] \mbreak
   re' re, mi fad[(mi) re] fad[(mi) re]}

   %40
   si'8 do la4. sol8
   fad8. la16 re8. mi16 fad8. re16
   si8. sol16 mi'8. fad16 sol8. mi16

   %43
   dod?8.[la16 fad'8. sol16 la8. fad16]
   si8. mi,16 mi4. re8
   re8.[la16 re8. mi16 fad8. re16]

   %46
   si8.[sol16 mi'8. fad16 sol8. mi16]\mbreak
   dod8.[la16 fad'8. sol16 la8. fad16]
   si8. mi,16 mi4. re8

   %49
   re4 fad si
   sold mi la~
   la8 si sold2

   %52
   la8 sold16 fad mi re dod si la4
   r fad' si
   sold mi la~

   %55
   la8 si sold2
   la4 dod, re
   mi mi2

   %58
   la, re4~
   re re4. dod8
   re4 dod re

   %61
   mi mi2
   la, re4~
   re re4. dod8

   %64
   re8 re, fad[la] re16(dod) si(la)
   si8 sol si[re] mi16(re) dod(si)
   dod8 la dod[mi] la16(sol) fad(mi)

   %67
   fad8 sol16 la mi8 la dod,[la']\mbreak
   fad re, fad[la] re16(dod) si(la)
   si8 sol si[re] mi16(re) dod(si)

   %70
   dod8 la dod[mi] la16(sol) fad(mi)
   fad8 mi16 re dod8 re mi,[dod']
   re la la la si si

   %73
   la la la la si si
   la la la la sol sol
   fad re' re, re' mi, re'\mbreak

   %76
   fad, re' fad, re' sol, re'
   fad, re' fad, re' mi, dod'
   re, la' la la si si

   %79
   la la la la si si
   la la la la sol sol
   fad16 re' re re re, re' re re mi, re' re re\mbreak

   %82
   fad, re' re re fad, re' re re sol, re' re re
   fad, re' re re fad, re' re re mi, dod' dod dod
   re,4 la'' sol

   %85
   fad4. mi8 re4
   re4. mi16 fad dod4
   re16 re re re fad re re re la re re re

   %88
   si re re re sol re re re si re re re
   dod mi mi mi la mi mi mi dod mi mi mi\mbreak
   fad si si si fad si si si si la sol fad

   %91
   mi la la la mi la la la la sol fad mi
   re sol sol sol re sol sol sol sol fad mi re
   mi la la la mi la la la la sol fad mi\mbreak

   %94
   fad si si si fad si si si si la sol fad
   mi la la la mi la la la la sol fad mi
   re sol sol sol re sol sol sol sol fad mi re

   %97
   mi la la la mi la la la la sol fad mi\mbreak
   fad8 re4 do8 si[la]
   si mi4 re8 dod![si]
   dod la'4 sol8 fad[mi]

   %101
   fad re4 mi8 la,[dod]
   re, re'4 do8 si[la]
   si mi4 re8 dod![si]

   %104
   dod la'4 sol8 fad[mi]
   fad re4 mi8 la,[dod]
   re,4 r r

   %107
   r re' re
   re re re
   re dod re

   %110
   mi dod re~]
   re8 mi dod2
   re4 r r

   %113
   r re, re
   re re re
   re dod re

   %116
   mi dod re~
   re8 mi dod2
   re2. fad'8 sol

   %119 Rondeau
   la4 re, dod re
   mi re la' re,
   si' la sol fad

   %122
   mi8 re dod si la4 fad'8 sol
   la4 re, dod re
   mi re sol fad

   %125
   mi re fad8(mi) re(dod)
   re2.  la4%% fine ripresa
   si sol8 fad mi4 dod'

   %128
   re la\mbreak fad la
   si8 la sol fad mi4 dod'
   re2 re,4 la'\p

   %131
   si sol8 fad mi4 dod'
   re la fad la
   si8(la sol fad) mi4 dod'\f

   %134
   re la mi' la,
   fad' la, sold' la,
   la' sold8 fad mi4 re

   %137
   dod8(re mi dod)\mbreak si(dod re si)
   la4 la, la fad''8 sol
   la4 re, dod re

   %140
   mi re la' re,
   si' la sol fad
   mi8 re dod si la4 fad'8 sol

   %143
   la4 re, dod re
   mi re sol fad
   mi re fad8(mi) re(dod)

   %146
   re2  re,4 fad'\mbreak
   fad fad fad fad
   fad sold8 lad si4 la8 sold

   %149
   fad4 mi8 re dod4 fad
   re si si mi
   mi mi mi mi

   %152
   mi fad8 sold la4 sold8 fad
   mi4 re8 dod si4 mi
   dod la la dod

   %155
   dod dod dod dod\mbreak
   dod fad8(mi) fad4 dod
   dod dod dod dod

   %158
   dod sold'8(fad) sold4 dod,
   dod dod dod dod
   dod la'8(sold) la2~

   %161
   la4 sold si8(la) sold(fad)
   mid4 dod fad sold
   la2 sold

   %164
   fad2. la8 sold
   la4 re, dod re
   mi re la' re,

   %167
   si' la sol fad
   mi8 re dod si la4 fad'8 sol
   la4 re, dod re

   %170
   mi re sol fad
   mi re fad8(mi) re(dod)
   re2\fermata r

}

IIIvlrpIn = \relative do'' {

   r4 fad la
   mi la la,\mbreak
   re sol sol

   %4
   sol8 fad mi fad sol la
   fad4 fad la
   mi la la,

   %7
   re sol sol
   sol8 fad mi fad sol la
   fad4 fad8 sol la si

   %10
   mi,4. fad8 sol[la]
   re, dod re mi fad sol
   la si mi,4. re8\mbreak

   %13
   re mi fad sol la si
   mi,4. fad8 sol[la]
   re, dod re mi fad sol

   %16
   la si mi,4. re8
   re4 fad,8 fad mi re
   la'4. la8 si[dod]

   %19
   re4 re2
   mi4 mi2
   fad4 fad,8 fad mi re

   %22
   la'4. la8 si[dod]
   re4 re2
   mi4 mi2\mbreak

   %25
   fad4 si8. la16 \tuplet 3/2 { sol8 (la) si }
   mi,4 la8. sol16 \tuplet 3/2 { fad8(sol) la }
   re,4 sol8. fad16 \tuplet 3/2 { mi8(fad) sol }

   %28
   dod, re mi fad sol la
   fad4 si8. la16 \tuplet 3/2 { sol8 (la) si }
   mi,4 la8. sol16 \tuplet 3/2 { fad8(sol) la }

   %31
   re,4 sol8. fad16 \tuplet 3/2 { mi8(fad) sol }
   dod, re re4. dod8\mbreak
   re8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

   %34
   la'8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }
   re'8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }
   si'8 do la4. sol8

   %37
   fad8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re]
   la' re, mi fad[(mi) re] fad[(mi) re] \mbreak
   re' re, mi fad[(mi) re] fad[(mi) re]}

   %40
   si'8 do la4. sol8
   fad8. la16 re8. mi16 fad8. re16
   si8. sol16 mi'8. fad16 sol8. mi16

   %43
   dod?8.[la16 fad'8. sol16 la8. fad16]
   si8. mi,16 mi4. re8
   re8.[la16 re8. mi16 fad8. re16]

   %46
   si8.[sol16 mi'8. fad16 sol8. mi16]\mbreak
   dod8.[la16 fad'8. sol16 la8. fad16]
   si8. mi,16 mi4. re8

   %49
   re4 fad si
   sold mi la~
   la8 si sold2

   %52
   la8 sold16 fad mi re dod si la4
   r fad' si
   sold mi la~

   %55
   la8 si sold2
   la4 mi fad
   sol sol2

   %58
   fad4. sol8 la4\mbreak
   si8 mi, \grace fad8 mi2
   re4 mi fad

   %61
   sol sol2
   fad4. sol8 la4
   si8 mi, \grace fad mi2

   %64
   re8 re, fad[la] re16(dod) si(la)
   si8 sol si[re] mi16(re) dod(si)
   dod8 la dod[mi] la16(sol) fad(mi)

   %67
   fad8 sol16 la mi8 la dod,[la']\mbreak
   fad re, fad[la] re16(dod) si(la)
   si8 sol si[re] mi16(re) dod(si)

   %70
   dod8 la dod[mi] la16(sol) fad(mi)
   fad8 mi16 re dod8 re mi,[dod']
   re re, re' re, re' mi,

   %73
   re'  fad, re' fad, re' sol,
   re' fad, re' fad, dod' mi,
   fad fad fad fad sol sol

   %76
   fad fad fad fad sol sol\mbreak
   fad fad fad fad mi mi
   fad16 re' fad, re' re, re' re, re' mi, re' mi, re'

   %79
   fad, re' fad, re' fad, re' fad, re' sol, re' sol, re'\mbreak
   fad, re' fad, re' fad, re' fad, re' mi, dod' mi, dod'
   re,4 fad' mi

   %82
   la,2 si4~
   si8 dod16 re la4. sol8
   fad16 re' dod re re, re' dod re mi, re' dod re

   %85
   fad, re' dod re fad, re' dod re sol, re' dod re\mbreak
   fad, re' dod re fad, re' dod re mi, dod' si dod
   re, re' re re fad re re re la re re re

   %88
   si re re re sol re re re si re re re
   dod mi mi mi la mi mi mi dod mi mi mi\mbreak
   fad si si si fad si si si si la sol fad

   %91
   mi la la la mi la la la la sol fad mi
   re sol sol sol re sol sol sol sol fad mi re
   mi la la la mi la la la la sol fad mi\mbreak

   %94
   fad si si si fad si si si si la sol fad
   mi la la la mi la la la la sol fad mi
   re sol sol sol re sol sol sol sol fad mi re

   %97
   mi la la la mi la la la la sol fad mi\mbreak
   fad8 re4 do8 si[la]
   si mi4 re8 dod![si]
   dod la'4 sol8 fad[mi]

   %101
   fad re4 mi8 la,[dod]
   re, re'4 do8 si[la]
   si mi4 re8 dod![si]

   %104
   dod la'4 sol8 fad[mi]
   fad re4 mi8 la,[dod]
   re,4 re' re

   %107
   re re re
   mi mi mi
   mi mi fad

   %110
   sol4. la8 fad[mi]
   fad sol mi2
   re4 re, re

   %113
   re re re
   mi mi mi
   mi mi fad

   %116
   sol4. la8 fad[mi]
   fad sol mi2
   re2. fad'8 sol

   %119 Rondeau
   la4 re, dod re
   mi re la' re,
   si' la sol fad

   %122
   mi8 re dod si la4 fad'8 sol
   la4 re, dod re
   mi re sol fad

   %125
   mi re fad8(mi) re(dod)
   re2.  la4%% fine ripresa
   si sol8 fad mi4 dod'

   %128
   re la\mbreak fad la
   si8 la sol fad mi4 dod'
   re2 re,4 la'\p

   %131
   si sol8 fad mi4 dod'
   re la fad la
   si8(la sol fad) mi4 dod'\f

   %134
   re la mi' la,
   fad' la, sold' la,
   la' sold8 fad mi4 re

   %137
   dod8(re mi dod)\mbreak si(dod re si)
   la4 la, la fad''8 sol
   la4 re, dod re

   %140
   mi re la' re,
   si' la sol fad
   mi8 re dod si la4 fad'8 sol

   %143
   la4 re, dod re
   mi re sol fad
   mi re fad8(mi) re(dod)

   %146
   re2  re,4 fad'\mbreak
   fad fad fad fad
   fad sold8 lad si4 la8 sold

   %149
   fad4 mi8 re dod4 fad
   re si si mi
   mi mi mi mi

   %152
   mi fad8 sold la4 sold8 fad
   mi4 re8 dod si4 mi
   dod la la dod

   %155
   dod dod dod dod\mbreak
   dod fad8(mi) fad4 dod
   dod dod dod dod

   %158
   dod sold'8(fad) sold4 dod,
   dod dod dod dod
   dod la'8(sold) la2~

   %161
   la4 sold si8(la) sold(fad)
   mid4 dod fad sold
   la2 sold

   %164
   fad2. la8 sold
   la4 re, dod re
   mi re la' re,

   %167
   si' la sol fad
   mi8 re dod si la4 fad'8 sol
   la4 re, dod re

   %170
   mi re sol fad
   mi re fad8(mi) re(dod)
   re2\fermata r

}

IIIvlrpIIn = \relative do'' {

   r4 fad la
   mi la la,\mbreak
   re sol sol

   %4
   sol8 fad mi fad sol la
   fad4 fad la
   mi la la,

   %7
   re sol sol
   sol8 fad mi fad sol la
   fad4 fad8 sol la si

   %10
   mi,4. fad8 sol[la]
   re, dod re mi fad sol
   la si mi,4. re8\mbreak

   %13
   re mi fad sol la si
   mi,4. fad8 sol[la]
   re, dod re mi fad sol

   %16
   la si mi,4. re8
   re4 fad,8 fad mi re
   la'4. la8 si[dod]

   %19
   re4 re2
   mi4 mi2
   fad4 fad,8 fad mi re

   %22
   la'4. la8 si[dod]
   re4 re2
   mi4 mi2\mbreak

   %25
   fad4 si8. la16 \tuplet 3/2 { sol8 (la) si }
   mi,4 la8. sol16 \tuplet 3/2 { fad8(sol) la }
   re,4 sol8. fad16 \tuplet 3/2 { mi8(fad) sol }

   %28
   dod, re mi fad sol la
   fad4 si8. la16 \tuplet 3/2 { sol8 (la) si }
   mi,4 la8. sol16 \tuplet 3/2 { fad8(sol) la }

   %31
   re,4 sol8. fad16 \tuplet 3/2 { mi8(fad) sol }
   dod, re re4. dod8\mbreak
   re8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

   %34
   la'8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }
   re'8. re,16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }
   si'8 do la4. sol8

   %37
   fad8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re]
   la' re, mi fad[(mi) re] fad[(mi) re] \mbreak
   re' re, mi fad[(mi) re] fad[(mi) re]}

   %40
   si'8 do la4. sol8
   fad8. la16 re8. mi16 fad8. re16
   si8. sol16 mi'8. fad16 sol8. mi16

   %43
   dod?8.[la16 fad'8. sol16 la8. fad16]
   si8. mi,16 mi4. re8
   re8.[la16 re8. mi16 fad8. re16]

   %46
   si8.[sol16 mi'8. fad16 sol8. mi16]\mbreak
   dod8.[la16 fad'8. sol16 la8. fad16]
   si8. mi,16 mi4. re8

   %49
   re4 fad si
   sold mi la~
   la8 si sold2

   %52
   la8 sold16 fad mi re dod si la4
   r fad' si
   sold mi la~

   %55
   la8 si sold2
   la4 dod, re
   mi mi2

   %58
   la, re4~
   re re4. dod8
   re4 dod re

   %61
   mi mi2
   la, re4~
   re re4. dod8

   %64
   re8 re, fad[la] re16(dod) si(la)
   si8 sol si[re] mi16(re) dod(si)
   dod8 la dod[mi] la16(sol) fad(mi)

   %67
   fad8 sol16 la mi8 la dod,[la']\mbreak
   fad re, fad[la] re16(dod) si(la)
   si8 sol si[re] mi16(re) dod(si)

   %70
   dod8 la dod[mi] la16(sol) fad(mi)
   fad8 mi16 re dod8 re mi,[dod']
   fad, fad fad fad sol sol

   %73
   fad fad fad fad sol sol
   fad fad fad fad mi mi
   re' re, re' re, re' mi,\mbreak

   %76
   re' fad, re' fad, re' sol,
   re' fad, re' fad, dod' mi,
   fad fad fad fad sol sol
   fad fad fad fad sol sol
   fad fad fad fad mi mi
   fad16 re' re re re, re' re re mi, re' re re\mbreak

   %82
   fad, re' re re fad, re' re re sol, re' re re
   fad, re' re re fad, re' re re mi, dod' dod dod
   re,4 fad' mi

   %85
   la,2 si4~
   si8 dod16 re la4. sol8\mbreak
   fad16 re' re re fad re re re la re re re

   %88
   si re re re sol re re re si re re re
   dod mi mi mi la mi mi mi dod mi mi mi\mbreak
   fad si si si fad si si si si la sol fad

   %91
   mi la la la mi la la la la sol fad mi
   re sol sol sol re sol sol sol sol fad mi re
   mi la la la mi la la la la sol fad mi\mbreak

   %94
   fad si si si fad si si si si la sol fad
   mi la la la mi la la la la sol fad mi
   re sol sol sol re sol sol sol sol fad mi re

   %97
   mi la la la mi la la la la sol fad mi\mbreak
   fad8 re4 do8 si[la]
   si mi4 re8 dod![si]
   dod la'4 sol8 fad[mi]

   %101
   fad re4 mi8 la,[dod]
   re, re'4 do8 si[la]
   si mi4 re8 dod![si]

   %104
   dod la'4 sol8 fad[mi]
   fad re4 mi8 la,[dod]
   re,4 r r

   %107
   r re' re
   re re re
   re dod re

   %110
   mi dod re~]
   re8 mi dod2
   re4 r r

   %113
   r re, re
   re re re
   re dod re

   %116
   mi dod re~
   re8 mi dod2
   re2. fad'8 sol

   %119 Rondeau
   la4 re, dod re
   mi re la' re,
   si' la sol fad

   %122
   mi8 re dod si la4 fad'8 sol
   la4 re, dod re
   mi re sol fad

   %125
   mi re fad8(mi) re(dod)
   re2.  la4%% fine ripresa
   si sol8 fad mi4 dod'

   %128
   re la\mbreak fad la
   si8 la sol fad mi4 dod'
   re2 re,4 la'\p

   %131
   si sol8 fad mi4 dod'
   re la fad la
   si8(la sol fad) mi4 dod'\f

   %134
   re la mi' la,
   fad' la, sold' la,
   la' sold8 fad mi4 re

   %137
   dod8(re mi dod)\mbreak si(dod re si)
   la4 la, la fad''8 sol
   la4 re, dod re

   %140
   mi re la' re,
   si' la sol fad
   mi8 re dod si la4 fad'8 sol

   %143
   la4 re, dod re
   mi re sol fad
   mi re fad8(mi) re(dod)

   %146
   re2  re,4 fad'\mbreak
   fad fad fad fad
   fad sold8 lad si4 la8 sold

   %149
   fad4 mi8 re dod4 fad
   re si si mi
   mi mi mi mi

   %152
   mi fad8 sold la4 sold8 fad
   mi4 re8 dod si4 mi
   dod la la dod

   %155
   dod dod dod dod\mbreak
   dod fad8(mi) fad4 dod
   dod dod dod dod

   %158
   dod sold'8(fad) sold4 dod,
   dod dod dod dod
   dod la'8(sold) la2~

   %161
   la4 sold si8(la) sold(fad)
   mid4 dod fad sold
   la2 sold

   %164
   fad2. la8 sold
   la4 re, dod re
   mi re la' re,

   %167
   si' la sol fad
   mi8 re dod si la4 fad'8 sol
   la4 re, dod re

   %170
   mi re sol fad
   mi re fad8(mi) re(dod)
   re2\fermata r

}

IIIvlan = \relative do' {

   r4 la' la
   la la la
   la re, re
   mi la la
   la la la
   la la la
   la re, re
   mi la la
   la re,8 mi fad sol
   la4 la,4. mi'8
   fad4. mi8 re4~
   re dod2
   re4 re8 mi fad sol\mbreak
   la4 la,4. mi'8
   fad4. mi8 re4~
   re dod2
   re4. la'8 sol[fad]
   mi4. dod8 re[mi]
   fad4 fad fad
   dod dod dod
   re4. la'8 sol[fad]
   mi4. dod8 re[mi]
   fad4 fad fad
   dod dod dod
   re fad8. mi16 \tuplet 3/2 { re8(mi) fad }\mbreak
   sol4 mi8. re16 \tuplet 3/2 { dod8(re) mi}
   fad4 re8. dod16 \tuplet 3/2 { si8(dod) re }
   mi re re4. dod8
   re4 fad8. mi16 \tuplet 3/2 { re8(mi) fad }
   sol4 mi8. re16 \tuplet 3/2 { dod8(re) mi }
   fad4 re8. dod16 \tuplet 3/2 { si8(dod) re }
   mi4 mi2
   fad4 la la
   la r la\mbreak
   la re,4. re8
   re mi dod2
   re4 la' la
   la r la
   la re,4. re8
   re4 re4. dod8
   re8.[fad16 fad8. sol16 la8. fad16]
   re8.[sol16 sol8. la16 si8. sold16]
   mi4 dod' re~
   re dod2
   re8.[fad,16 fad8. sol16 la8. fad16]\mbreak
   re8.[sol16 sol8. la16 si8. sol16]
   mi4 dod' re~
   re dod2
   re4 re, fad
   si, dod8 re mi4
   fad mi4. re8
   dod4. dod8 re[mi]
   fad4 re fad
   si, dod8 re mi4
   fad mi4. re8
   dod4 r r
   R2.*7\mbreak
   fad4. fad8 la[fad]
   re4. si'8 si[si]
   mi,4. dod8 mi[dod]
   la4 la' la
   la4. fad8 la[fad]
   re4. si'8 si[si]
   mi,4. dod8 mi[dod]
   \once\stemUp la si' mi,4 la
   la re, re
   re re re
   re re la
   re re re\mbreak
   re re re
   re re la
   re re re
   re re re
   re re la
   re re mi
   fad fad sol
   la2 la,4
   re re mi
   fad fad sol
   la2 la,4
   la r16 la' la la fad la la la\mbreak
   re,4 r16 si' si si sol si si si
   mi,4 r16 dod' dod dod la dod dod dod
   re4 r16 fad, fad fad fad si si si
   mi,4 r16 mi mi mi mi la la la
   re,4 r16 re re re re sol sol sol\mbreak
   dod,4 r16 dod' dod dod dod si la sol
   fad4 r16 fad fad fad fad si si si
   mi,4 r16 mi mi mi mi la la la
   re,4 r16 re re re re sol sol sol
   dod,4 r16 dod' dod dod dod la la la\mbreak
   la4 r8 fad sol[la]
   re, si' sol sol la si
   mi, mi dod dod re mi
   la, la' sol si mi, la
   fad4 r8 fad sol[la]
   re, si' sol sol la si
   mi, mi dod dod re mi\mbreak
   la, la' sol si mi, la
   fad4 fad fad
   fad fad fad
   si si si
   mi, mi la
   la mi re
   si' mi, la
   fad fad fad
   fad fad fad
   si, si si
   la la la
   la mi' re
   si la2\mbreak
   la2. la'8 sol
   fad4  fad mi fad  %% rip
   sol fad2 la4
   re, re mi fad
   dod2. la'8 sol
   fad4 fad mi fad
   sol fad re dod
   si2 la
   la2. fad'4 %% fin
   re mi dod mi
   fad2. re4
   re mi dod mi\mbreak
   fad2. fad4\p
   re mi dod mi
   fad2. re4
   re mi dod mi
   fad2\f la
   la mi
   mi2. mi4
   mi2 mi
   mi2. la8 sol
   fad4 fad mi fad
   sol fad2 la4
   re, re mi fad
   dod2. la'8 sol
   fad4 fad mi fad\mbreak
   sol fad re la'
   la fad si la
   la2. fad8 mi
   re4 re re dod
   si2. mi4
   fad si2 lad4
   si fad fad dod'
   dod dod dod si
   la2. re,4
   mi la2 sold4
   la mi mi la
   la la la sold
   fad2. sold4
   la la la si8 la
   sold2. sold4
   sold sold sold la8 sold
   fad2. fad4
   fad si si si
   si la8 sold dod4 re
   dod2 dod
   dod2. re,8 mi
   fad4 fad mi fad %%ripresa
   sol fad2 la4
   re, re mi fad
   dod2. la'8 sol
   fad4 fad mi fad
   sol fad re dod
   si2 la
   la2\fermata r

}

IIIfgn = \relative do {

   re'4 re re
   dod dod dod
   si si si

   %4
   dod dod dod
   re re, re
   dod dod dod

   %7
   si si si
   dod dod dod
   re re' re

   %10
   dod dod dod
   si si si
   fad8 sol la4 la,\mbreak

   %13
   re re re
   dod dod dod
   si si si

   %16
   fad8 sol la4 la
   re, re'' re
   dod dod dod

   %19
   si si si
   la la la
   re, re re

   %22
   dod dod dod
   si si si
   la la la

   %25
   re, re'' re
   dod dod dod\mbreak
   si si si

   %28
   la la la
   re, re re
   dod dod dod

   %31
   si si si
   la la la
   re, re' re

   %34
   re r dod
   si r la
   sol la2

   %37
   re,4 re' re
   re r dod
   si r la

   %40
   sol la2
   re2 re4\mbreak
   sol2 mi4

   %43
   la2 fad4
   sol la la,
   re2 re4

   %46
   sol2 mi4
   la2 fad4
   sol la la,

   %49
   re8 dod si dod re si
   mi re dod si dod la
   re si mi re mi mi,

   %52
   la4. la8 si[dod]
   re dod si dod re si\mbreak
   mi re dod si dod la

   %55
   re si mi re mi mi,
   la4 r r
   R2.*7

   %64
   re4. re8 fad[re]
   sol2 sold4
   la4. la,8 dod[la]

   %67
   re4 dod la
   re4. re8 fad[re]
   sol2 sold4

   %70
   la4. la,8 dod[la]
   re sol la4 la,
   re r r

   %73
   R2.*14
   re4 re re

   %88
   sol sol sol
   la la la
   re, re re

   %91
   dod do do
   si si si
   la la la

   %94
   re re re
   dod do do
   si si si

   %97
   la la la
   re8 fad re re mi fad
   sol sol mi mi fad sol\mbreak

   %100
   la dod, la la si dod
   re fad si sol la la,
   re fad re re mi fad

   %103
   sol sol mi mi fad sol
   la dod, la la si dod
   re fad si sol la la,

   %106
   re4 re' dod
   si si la
   sold sold sold

   %109
   la la re,\mbreak
   dod la si
   sol la2

   %112
   re,4 re' dod
   si si la
   sold sold sold

   %115
   la la re
   dod la si
   sol la2

   %118
   re,2. re'4
   re2 la'4 re,
   dod re2 fad4

   %121
   sol fad mi re
   la'2. re,4
   re2 la'4 re,

   %124
   dod re\mbreak si la
   sol2 la
   re,2.  re'4 %%%%% fine ripresa

   %127
   sol4 mi la la,
   re2. fad4
   sol mi la la,

   %130
   re2. re4\p
   sol mi la la,
   re2. fad4

   %133
   sol mi la la,
   re2\f dod
   re mi
   dod2. si4

   %137
   la la' mi mi,
   la2. re4\mbreak
   re2 la'4 la,

   %140
   dod re2 fad4
   sol fad mi re
   la'2. re,4

   %143
   re2 la'4 re,
   dod re si la
   dod re sol, la

   %146
   re,2. re'8 dod
   si2. dod4
   re2. dod4

   %149
   re mi fad fad,
   si2. la4

   %150
   la2. si4
   dod2. si4
   dod re mi mi,

   %153
   la2. fad'4
   fad2. sold4
   la2. sold4

   %156
   fad fad fad sold8 fad
   mid2. mi4
   mi mi mi fad8 mi

   %159
   red2. re4
   re re re mi8 re
   dod4 dod' la si

   %162
   dod2 dod,
   fad2. fad8 mi
   re2 la'4 re,

   %166
   dod re2 fad4
   sol fad mi re
   la'2. re,4

   %169
   re2 la'4 re,
   dod re\mbreak si la
   sol2 la

   %172
   re,2\fermata r

}

IIIbcn = \relative do {

   re'4 re re
   dod dod dod
   si si si

   %4
   dod dod dod
   re re, re
   dod dod dod

   %7
   si si si
   dod dod dod
   re re' re

   %10
   dod dod dod
   si si si
   fad8 sol la4 la,\mbreak

   %13
   re re re
   dod dod dod
   si si si

   %16
   fad8 sol la4 la
   re, re'' re
   dod dod dod

   %19
   si si si
   la la la
   re, re re

   %22
   dod dod dod
   si si si
   la la la

   %25
   re, re'' re
   dod dod dod\mbreak
   si si si

   %28
   la la la
   re, re re
   dod dod dod

   %31
   si si si
   la la la
   re, re' re

   %34
   re r dod
   si r la
   sol la2

   %37
   re,4 re' re
   re r dod
   si r la

   %40
   sol la2
   re2 re4\mbreak
   sol2 mi4

   %43
   la2 fad4
   sol la la,
   re2 re4

   %46
   sol2 mi4
   la2 fad4
   sol la la,

   %49
   re8 dod si dod re si
   mi re dod si dod la
   re si mi re mi mi,

   %52
   la4. la8 si[dod]
   re dod si dod re si\mbreak
   mi re dod si dod la

   %55
   re si mi re mi mi,
   la la' sol fad mi re
   dod si dod la si dod

   %58
   re dod re mi fad re
   sol mi la sol la la,
   re la' sol fad mi re

   %61
   dod si dod la si dod\mbreak
   re dod re mi fad re
   sol mi la sol la la,

   %64
   re4. re8 fad[re]
   sol2 sold4
   la4. la,8 dod[la]

   %67
   re4 dod la
   re4. re8 fad[re]
   sol2 sold4

   %70
   la4. la,8 dod[la]
   re sol la4 la,
   re \clef tenor \key re\major re' re\mbreak

   %73
   re re re
   re re la
   re re re

   %76
   re re re
   re re la
   re re re

   %79
   re re re
   re re la
   re re mi

   %82
   fad fad sol
   la2 la,4
   re re mi

   %85
   fad fad sol
   la2 la,4
   \clef bass \key re\major re, re re

   %88
   sol sol sol
   la la la
   re, re re

   %91
   dod do do
   si si si
   la la la

   %94
   re re re
   dod do do
   si si si

   %97
   la la la
   re8 fad re re mi fad
   sol sol mi mi fad sol\mbreak

   %100
   la dod, la la si dod
   re fad si sol la la,
   re fad re re mi fad

   %103
   sol sol mi mi fad sol
   la dod, la la si dod
   re fad si sol la la,

   %106
   re4 re' dod
   si si la
   sold sold sold

   %109
   la la re,\mbreak
   dod la si
   sol la2

   %112
   re,4 re' dod
   si si la
   sold sold sold

   %115
   la la re
   dod la si
   sol la2

   %118
   re,2. re'4
   re2 la'4 re,
   dod re2 fad4

   %121
   sol fad mi re
   la'2. re,4
   re2 la'4 re,

   %124
   dod re\mbreak si la
   sol2 la
   re,2.  re'4 %%%%% fine ripresa

   %127
   sol4 mi la la,
   re2. fad4
   sol mi la la,

   %130
   re2. re4\p
   sol4 mi la la,
   re2. fad4
   sol mi la la,

   %134
   re2\f dod
   re mi
   dod2. si4

   %137
   la la' mi mi,
   la2. re4\mbreak
   re2 la'4 la,

   %140
   dod re2 fad4
   sol fad mi re
   la'2. re,4

   %143
   re2 la'4 re,
   dod re si la
   dod re sol, la

   %146
   re,2. re'8 dod
   si2. dod4
   re2. dod4

   %149
   re mi fad fad,
   si2. la4

   %151
   la2. si4
   dod2. si4
   dod re mi mi,

   %154
   la2. fad'4
   fad2. sold4
   la2. sold4

   %157
   fad fad fad sold8 fad
   mid2. mi4
   mi mi mi fad8 mi

   %160
   red2. re4
   re re re mi8 re
   dod4 dod' la si

   %163
   dod2 dod,
   fad2. fad8 mi
   re2 la'4 re,

   %166
   dod re2 fad4
   sol fad mi re
   la'2. re,4

   %169
   re2 la'4 re,
   dod re\mbreak si la
   sol2 la

   %172
   re,2\fermata r

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6>
    <7>4 <6> s
    <6 5>2.
    s
    <6>
    <7>4 <6> s
    <6 5>2.
    s
    <6>
    s
    <6>4 <4> <3>
    s2.
    <6>
    s
    <6>4 <4> <3>
    s2.
    <6>
    s2.*3
    <6>2.
    s
    s
    s4 <6>2
    <7>4 <6> s
    <7> <6> s
    <7 3> <6 4> <5 3>
    <5> <6> s
    <7> <6> s
    <7> <6> s
    <7 3> <6 4> <5 3>
    s2.
    s2 <4 2>4
    <7> s s
    <6 5> <4> <3>
    s2.
    s2 <4 2>4
    <7> s s
    <6 5> <4> <3>
    s2.
    <6 5>
    s2 <6>4
    <6 5> <4> <3>
    s2.
    <6 5>
    s2 <6>4
    <6 5> <4> <3>
    s2 <6 5>4
    <_+> <6> s
    <6 5> <4> <_+>
    s2.
    <6 5>
    <_+>4 <6> s
    <6 5> <4> <_+>
    s2.
    <6 5>
    <9>4 <8> s
    <6 5> <4> <3>
    s2.
    <6 5>
    <9>4 <8> s
    <6 5> <4> <3>
    s2 <6>4
    s2 <6 5>4
    s2 <6>4
    s <6> s
    s2 <6>4
    s2 <6 5>4
    s2 <6>4
    s <4> <3>
    s2 <6 4>4
    <5 3> s <6 4>
    s s <7>
    s s <6 4>
    <5 3> s <6 4>
    <5 3> s <7>
    s s <6 4>
    <5 3> s <6 4>
    <5 3> s <7>
    s2.
    <6>
    <6 4>2 <5 3>4
    s2.
    <6>
    <6 4>2 <5 3>4
    s2.
    <6 5>
    s
    <6>
    <6>
    <6>
    s
    <6> <6> <6>
    s
    s2 s8  <6 5!>  %%OOKK bar 98
    s2.
    s2 s8 <6 5>
    s2.
    s2 s8 <6 5!>
    s2.
    s2 s8 <6 5>
    s2.*3
    <6 5>2.
    <4>4 <3> s
    <6> s <7>
    <6 5> <4> <3>
    s2.*2
    <6 5>2.
    <4>4 <3> s
    <6> s <7>
    <6 5> <4> <3>
    s1
    s  %%% ripresa
    <6 5>4 s2 <6>4
    s <6> <6> s
    s1*2
    <6 5>4 s <6> <6>
    <6 5>2 <4>4 <3>
    s1  %%% fin
    <6 5>
    s2. <6>4
    <6 5>1
    s
    <6 5>
    s2. <6>4
    <6 5>1
    s2 <6>
    <6 5> <_+>
    <6>2 s4 <6\\>
    s2 <_+>
    s1*2
    <6 5>4 s2 <6>4
    s <6> <6> s
    s1*2
    <6 5>4 s <6> <6>
    <6 5>2 <6 5>
    s1*2
    <6>1
    s2 <4>4 <_+>
    s1
    s
    <6>
    <6>2 <4>4 <_+>
    s1*6
    <7 5>1
    s
    <7 _+>2 <6>4 <6\\ 5>
    <6 4>2 <_+>
    s1
    s
    <6 5>4 s2 <6>4
    s <6> <6> s
    s1*2
    <6 5>4 s <6> <6>
    <6 5>2 <4>4 <3>

}

forma = {

    \key re\major
    \time 3/4
    \tempo 2. = 48
    s2.*117\break
    \once \override Score.RehearsalMark.extra-offset = #'(+6 . 0)
    \mark\markup\huge {[4.] Rondeau Allegro}
    \time 2/2
    \tempo 1 = 90
    s1*55
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


IIIvlrpI = {
    \IIIglobal
    <<\IIIvlrpIn \forma>>
}


IIIvlrpII = {
    \IIIglobal
    <<\IIIvlrpIIn \forma>>
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



IVglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

IVvlIn = \relative do'' {

    r8 re \tuplet 3/2 { fad(mi) re fad[(mi) re] }
    la'8. la,16 \tuplet 3/2 { dod8(si) la dod[(si) la] }
    re8. si16 \tuplet 3/2 { re8(dod) si re[(dod) si] }

    %4
    fad'8. fad,16 \tuplet 3/2 { la8(sol) fad la[(sol) fad] }\mbreak
    si8. sol16 \tuplet 3/2 { si8(la) sol si[(la) sol] }
    re'8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

    %7
    sol4. la8 fad8. sol16
    la8. si16 mi,2
    re8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

    %10
    la'8. la,16 \tuplet 3/2 { dod8(si) la dod[(si) la] }
    \tuplet 3/2 { re(fad) mi re[(mi) dod] si(dod) la] }
    sold4 mi8.[mi'16 mi8. mi16]

    %13
    \tuplet 3/2 { fad8(mi) re re[(dod) si] si(la) sold\mbreak
    sold'(fad) mi mi[(re) dod] dod(si) la
    la'(sold) fad fad[(mi) re] re(dod) si

    %16
    si'(la) sold sold[(fad) mi] mi(re) dod}
    la16 dod mi dod la dod mi dod la dod mi dod\mbreak
    sold si mi si sold si mi si sold si mi si

    %19
    mi, si' mi si fad si mi si sold si mi si
    la dod mi dod la dod mi dod la dod mi dod\mbreak
    la dod fad dod la dod fad dod la dod fad dod

    %22
    sold si fad' si, sold si fad' si, sold si fad' si,
    sol! si mi si sol si mi si sol si mi si
    fad la mi' la, fad la mi' la, fad la mi' la,

    %25
    fad re' mi re fad, re' mi re fad, re' mi re
    mi, re' sold re mi, re' sold re mi, re' sold re\mbreak
    mi, dod' la' dod, mi, dod' la' dod, mi, dod' la' dod,

    %28
    mi, do' la' do, mi, do' la' do, mi, do' la' do,
    mi, si' la' si, mi, si' la' si, mi, si' la' si,
    mi, re' sold re mi, re' sold re mi, re' sold re

    %31
    la'4. mi8 mi8. mi16
    \tuplet 3/2 { fad8(sol la) re,[(mi fad)] si,(dod re) }
    mi,4. fad'8 mi8. re16

    %34
    \tuplet 3/2 { dod8(re mi) } si2\mbreak
    la2.
    r8 la \tuplet 3/2 { dod(si) la dod[(si) la] }

    %37
    re4 \grace re8 do2
    si8. si16 \tuplet 3/2 { re8(dod) si re[(dod) si] }
    mi4 \grace mi8 re2

    %40
    dod8. dod16 \tuplet 3/2 { mi8(re) dod mi[(re) dod] }
    fad4 \grace fad8 mi2\mbreak
    re8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re]

    %43
    sol re sol sol[re sol] sol re sol
    sol dod, sol' sol[dod, sol'] sol dod, sol'
    fad dod fad fad[dod fad] fad dod fad\mbreak

    %46
    fad si, fad' fad [si, fad'] fad si, fad'
    mi si mi  mi[si mi] mi si mi}
    <<<mi lad,>4.\\fad,>> sol'8 fad8. mi16

    %49
    \tuplet 3/2 { re8(mi) fad } dod2
    si16 fad' re fad si, fad' re fad si, fad' re fad\mbreak
    dod fad mi fad dod fad mi fad dod fad mi fad

    %52
    re4. dod8 si4~
    si lad2
    si4\fermata r r

    %55
    re16 la' fad la re, la' fad la re, la' fad la\mbreak
    mi la sold la mi la sold la mi la sold la
    fad4. mi8 re4~

    %58
    re dod2
    re16 la' fad la re, la' fad la re, la' fad la\mbreak
    re, si' si si re, si' si si re, si' si si

    %61
    dod, si dod mi dod si dod mi dod si dod mi
    dod la' la la dod, la' la la dod, la' la la\mbreak
    si, la si re si la si re si la si re

    %64
    si sol' sol sol si, sol' sol sol si, sol' sol sol
    la, sol la dod la sol la dod la sol la dod\mbreak
    la fad' fad fad la, fad' fad fad la, fad' fad fad

    %67
    sol, fad sol si sol fad sol si sol fad sol si
    sol mi' mi mi sol, mi' mi mi sol, mi' mi mi
    fad, re' re re fad re re re la re re re

    %70
    sol, re' re re fad re re re sol, re' re re
    la re re re fad re re re la re re re\mbreak
    si re re re fad re re re fad re re re

    %73
    sol re re re la' re, re re si' re, re re
    la'4. sol8 fad8. mi16
    \tuplet 3/2 { fad8(sol) la } mi2

    %76
    re4. do8 si8. la16\mbreak
    \tuplet 3/2 { si8(do) re si[(do) re] la(si) do }
    si4 la~\tuplet 3/2 { la8 si do }

    %79
    \tuplet 3/2 { si8(do) re si[(do) re] la(si) do }
    \tuplet 3/2 { sol(la) si sol[(la) si] fad(sol) la\mbreak
    mi(fad) sol mi[(fad) sol] re(mi) fad}

    %82
    dod8.[si16 la8. mi'16 la8. sol16]
    \tuplet 3/2 { fad8(sol) la } mi2
    re2.\fermata

}

IVvlIIn = \relative do'' {

    r8 re \tuplet 3/2 { fad(mi) re fad[(mi) re] }
    la'8. la,16 \tuplet 3/2 { dod8(si) la dod[(si) la] }
    re8. si16 \tuplet 3/2 { re8(dod) si re[(dod) si] }

    %4
    fad'8. fad,16 \tuplet 3/2 { la8(sol) fad la[(sol) fad] }\mbreak
    si8. sol16 \tuplet 3/2 { si8(la) sol si[(la) sol] }
    re'8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

    %7
    sol4. la8 fad8. sol16
    la8. si16 mi,2
    re8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

    %10
    la'8. la,16 \tuplet 3/2 { dod8(si) la dod[(si) la] }
    \tuplet 3/2 { re(fad) mi re[(mi) dod] si(dod) la] }
    sold4 mi8.[mi'16 mi8. mi16]

    %13
    \tuplet 3/2 { fad8(mi) re re[(dod) si] si(la) sold\mbreak
    sold'(fad) mi mi[(re) dod] dod(si) la
    la'(sold) fad fad[(mi) re] re(dod) si

    %16
    si'(la) sold sold[(fad) mi] mi(re) dod}
    dod8.[dod16 dod8. dod16 dod8. dod16]
    si8.[si16 si8. si16 si8. si16]
    si4 r r
    dod8.[dod16 dod8. dod16 dod8. dod16]\mbreak
    fad8.[fad16 fad8. fad16 fad8. fad16]
    fad4 r r
    mi8.[mi16 mi8. mi16 mi8. mi16]
    mi4 r r
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    dod r r
    do r r
    si r r
    si si2
    dod4. mi8 mi8. mi16
    \tuplet 3/2 { fad8(sol la) re,[(mi fad)] si,(dod re) }
    mi,4. fad'8 mi8. re16

    %34
    \tuplet 3/2 { dod8(re mi) } si2\mbreak
    la2.
    r8 la \tuplet 3/2 { dod(si) la dod[(si) la] }

    %37
    re4 \grace re8 do2
    si8. si16 \tuplet 3/2 { re8(dod) si re[(dod) si] }
    mi4 \grace mi8 re2

    %40
    dod8. dod16 \tuplet 3/2 { mi8(re) dod mi[(re) dod] }
    fad4 \grace fad8 mi2\mbreak
    re8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re]

    %43
    sol re sol sol[re sol] sol re sol
    sol dod, sol' sol[dod, sol'] sol dod, sol'
    fad dod fad fad[dod fad] fad dod fad\mbreak

    %46
    fad si, fad' fad [si, fad'] fad si, fad'
    mi si mi  mi[si mi] mi si mi}
    <<<mi lad,>4.\\fad,>> sol'8 fad8. mi16

    %49
    \tuplet 3/2 { re8(mi) fad } dod2
    re4. dod8 si4~
    si lad2

    %52
    si16 fad' re fad si, fad' re fad si, fad' re fad
    dod fad mi fad dod fad mi fad dod fad mi fad\mbreak
    re4\fermata r r

    %55
    fad4. mi8 re4~
    re dod2
    re16 la' fad la re, la' fad la re, la' fad la

    %58
    mi la sold la mi la sold la mi la sold la
    fad4. mi8 re4
    R2.

    %61
    la16 sol la dod la sol la dod la sol la dod\mbreak
    la4 r r
    sol16 fad sol si sol fad sol si sol fad sol si

    %64
    sol4 r r
    fad16 mi fad la fad mi fad la fad mi fad la
    fad4 r r

    %67
    mi16 re mi sol mi re mi sol mi re mi sol\mbreak
    mi4 r16 sol sol sol mi sol sol sol
    la re re re fad re re re la re re re

    %70
    sol, re' re re fad re re re sol, re' re re
    la re re re fad re re re la re re re\mbreak
    si re re re fad re re re fad re re re

    %73
    sol re re re la' re, re re si' re, re re
    la'4. sol8 fad8. mi16
    \tuplet 3/2 { fad8(sol) la } mi2

    %76
    re4. do8 si8. la16\mbreak
    \tuplet 3/2 { si8(do) re si[(do) re] la(si) do }
    si4 la~\tuplet 3/2 { la8 si do }

    %79
    \tuplet 3/2 { si8(do) re si[(do) re] la(si) do }
    \tuplet 3/2 { sol(la) si sol[(la) si] fad(sol) la\mbreak
    mi(fad) sol mi[(fad) sol] re(mi) fad}

    %82
    dod8.[si16 la8. mi'16 la8. sol16]
    \tuplet 3/2 { fad8(sol) la } mi2
    re2.\fermata

}

IVvlrpIn = \relative do'' {

    r8 re \tuplet 3/2 { fad(mi) re fad[(mi) re] }
    la'8. la,16 \tuplet 3/2 { dod8(si) la dod[(si) la] }
    re8. si16 \tuplet 3/2 { re8(dod) si re[(dod) si] }

    %4
    fad'8. fad,16 \tuplet 3/2 { la8(sol) fad la[(sol) fad] }\mbreak
    si8. sol16 \tuplet 3/2 { si8(la) sol si[(la) sol] }
    re'8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

    %7
    sol4. la8 fad8. sol16
    la8. si16 mi,2
    re8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

    %10
    la'8. la,16 \tuplet 3/2 { dod8(si) la dod[(si) la] }
    \tuplet 3/2 { re(fad) mi re[(mi) dod] si(dod) la] }
    sold4 mi8.[mi'16 mi8. mi16]

    %13
    \tuplet 3/2 { fad8(mi) re re[(dod) si] si(la) sold\mbreak
    sold'(fad) mi mi[(re) dod] dod(si) la
    la'(sold) fad fad[(mi) re] re(dod) si

    %16
    si'(la) sold sold[(fad) mi] mi(re) dod}
    dod16 mi dod mi dod mi dod mi dod mi dod mi
    si mi si mi si mi si mi si mi si mi

    %19
    si mi si mi si mi si mi si mi si mi
    dod mi dod mi dod mi dod mi dod mi dod mi
    dod fad dod fad dod fad dod fad dod fad dod fad

    %22
    si, fad' si, fad' si, fad' si, fad' si, fad' si, fad'
    si, mi si mi si mi si mi si mi si mi
    la, mi' la, mi' la, mi' la, mi' la, mi' la, mi'

    %25
    la, si dod si la si dod si la si dod la
    sold8 mi r4 r
    <<{dod'8 dod dod dod dod dod

       %28
       do do do do do do\mbreak
       si si si si si si
       si si si si si si

       %31
       <mi dod>4.}\\{la,8 la la la la la
                     la la la la la la\mbreak
                     la la la la la la
                     sold sold sold sold sold sold
                     la4.}>> mi'8 mi8. mi16
    \tuplet 3/2 { fad8(sol la) re,[(mi fad)] si,(dod re) }
    mi,4. fad'8 mi8. re16

    %34
    \tuplet 3/2 { dod8(re mi) } si2\mbreak
    la2.
    r8 la \tuplet 3/2 { dod(si) la dod[(si) la] }

    %37
    re4 \grace re8 do2
    si8. si16 \tuplet 3/2 { re8(dod) si re[(dod) si] }
    mi4 \grace mi8 re2

    %40
    dod8. dod16 \tuplet 3/2 { mi8(re) dod mi[(re) dod] }
    fad4 \grace fad8 mi2\mbreak
    re8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re]

    %43
    sol re sol sol[re sol] sol re sol
    sol dod, sol' sol[dod, sol'] sol dod, sol'
    fad dod fad fad[dod fad] fad dod fad\mbreak

    %46
    fad si, fad' fad [si, fad'] fad si, fad'
    mi si mi  mi[si mi] mi si mi}
    <<<mi lad,>4.\\fad,>> sol'8 fad8. mi16

    %49
    \tuplet 3/2 { re8(mi) fad } dod2
    si16 fad' re fad si, fad' re fad si, fad' re fad\mbreak
    dod fad mi fad dod fad mi fad dod fad mi fad

    %52
    re4. dod8 si4~
    si lad2
    si4\fermata r r

    %55
    re16 la' fad la re, la' fad la re, la' fad la\mbreak
    mi la sold la mi la sold la mi la sold la
    fad4. mi8 re4~

    %58
    re dod2
    re16 la' fad la re, la' fad la re, la' fad la\mbreak
    re, si' si si re, si' si si re, si' si si

    %61
    dod, si dod mi dod si dod mi dod si dod mi
    dod la' la la dod, la' la la dod, la' la la\mbreak
    si, la si re si la si re si la si re

    %64
    si sol' sol sol si, sol' sol sol si, sol' sol sol
    la, sol la dod la sol la dod la sol la dod\mbreak
    la fad' fad fad la, fad' fad fad la, fad' fad fad

    %67
    sol, fad sol si sol fad sol si sol fad sol si
    sol mi' mi mi sol, mi' mi mi sol, mi' mi mi
    fad, re' re re fad re re re la re re re

    %70
    sol, re' re re fad re re re sol, re' re re
    la re re re fad re re re la re re re\mbreak
    si re re re fad re re re fad re re re

    %73
    sol re re re la' re, re re si' re, re re
    la'4. sol8 fad8. mi16
    \tuplet 3/2 { fad8(sol) la } mi2

    %76
    re4. do8 si8. la16\mbreak
    \tuplet 3/2 { si8(do) re si[(do) re] la(si) do }
    si4 la~\tuplet 3/2 { la8 si do }

    %79
    \tuplet 3/2 { si8(do) re si[(do) re] la(si) do }
    \tuplet 3/2 { sol(la) si sol[(la) si] fad(sol) la\mbreak
    mi(fad) sol mi[(fad) sol] re(mi) fad}

    %82
    dod8.[si16 la8. mi'16 la8. sol16]
    \tuplet 3/2 { fad8(sol) la } mi2
    re2.\fermata

}

IVvlrpIIn = \relative do'' {

    r8 re \tuplet 3/2 { fad(mi) re fad[(mi) re] }
    la'8. la,16 \tuplet 3/2 { dod8(si) la dod[(si) la] }
    re8. si16 \tuplet 3/2 { re8(dod) si re[(dod) si] }

    %4
    fad'8. fad,16 \tuplet 3/2 { la8(sol) fad la[(sol) fad] }\mbreak
    si8. sol16 \tuplet 3/2 { si8(la) sol si[(la) sol] }
    re'8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

    %7
    sol4. la8 fad8. sol16
    la8. si16 mi,2
    re8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re] }

    %10
    la'8. la,16 \tuplet 3/2 { dod8(si) la dod[(si) la] }
    \tuplet 3/2 { re(fad) mi re[(mi) dod] si(dod) la] }
    sold4 mi8.[mi'16 mi8. mi16]

    %13
    \tuplet 3/2 { fad8(mi) re re[(dod) si] si(la) sold\mbreak
    sold'(fad) mi mi[(re) dod] dod(si) la
    la'(sold) fad fad[(mi) re] re(dod) si

    %16
    si'(la) sold sold[(fad) mi] mi(re) dod }
    dod8.[la16 la8. la16 la8. la16]\mbreak
    sold8.[sold16 sold8. sold16 sold8. sold16]

    %19
    sold?4 r r
    la8.[la16 la8. la16 la8. la16]
    la4 r r

    %22
    si8.[si16 si8. si16 si8. si16]
    si4 r r
    la8.[la16 la8. la16 la8. la16]

    %25
    la4 r r
    sold r r
    la r r\mbreak

    %28
    la r r
    la r r
    sold sold2

    %31
    la4. mi'8 mi8. mi16
    \tuplet 3/2 { fad8(sol la) re,[(mi fad)] si,(dod re) }
    mi,4. fad'8 mi8. re16

    %34
    \tuplet 3/2 { dod8(re mi) } si2\mbreak
    la2.
    r8 la \tuplet 3/2 { dod(si) la dod[(si) la] }

    %37
    re4 \grace re8 do2
    si8. si16 \tuplet 3/2 { re8(dod) si re[(dod) si] }
    mi4 \grace mi8 re2

    %40
    dod8. dod16 \tuplet 3/2 { mi8(re) dod mi[(re) dod] }
    fad4 \grace fad8 mi2\mbreak
    re8. re16 \tuplet 3/2 { fad8(mi) re fad[(mi) re]}

    %43
    re8.[re16 re8. re16 re8. re16]
    dod4 r r
    dod8.[dod16 dod8. dod16 dod8. dod16]\mbreak

    %46
    si4 r r
    si8.[si16 si8. si16 si8. si16]
    lad2 si4~

    %49
    si si4. lad8
    re4. dod8 si4~
    si lad2

    %52
    si16 fad' re fad si, fad' re fad si, fad' re fad
    dod fad mi fad dod fad mi fad dod fad mi fad\mbreak
    re4\fermata r r

    %55
    fad4. mi8 re4~
    re dod2
    re16 la' fad la re, la' fad la re, la' fad la

    %58
    mi la sold la mi la sold la mi la sold la
    fad4. mi8 re4
    R2.

    %61
    la16 sol la dod la sol la dod la sol la dod\mbreak
    la4 r r
    sol16 fad sol si sol fad sol si sol fad sol si

    %64
    sol4 r r
    fad16 mi fad la fad mi fad la fad mi fad la
    fad4 r r

    %67
    mi16 re mi sol mi re mi sol mi re mi sol\mbreak
    mi4 r16 sol sol sol mi sol sol sol
    la8 fad fad fad fad fad

    %70
    sol sol sol sol sol sol
    la la la la la la
    si si la la la la\mbreak

    %73
    re,2 re'4~
    re mi4. mi8
    la, re re4. dod8

    %76
    re4. do8 si8. la16
    \tuplet 3/2 { si8(do) re si[(do) re] la(si) do }
    si4 la~\tuplet 3/2 { la8 si do }

    %79
    \tuplet 3/2 { si8(do) re si[(do) re] la(si) do }
    \tuplet 3/2 { sol(la) si sol[(la) si] fad(sol) la\mbreak
    mi(fad) sol mi[(fad) sol] re(mi) fad}

    %82
    dod8.[si16 la8. mi'16 la8. sol16]
    \tuplet 3/2 { fad8(sol) la } mi2
    re2.\fermata

}

IVvlan = \relative do' {

    fad8.[fad16 fad8. fad16 fad8. fad16]\mbreak
    mi8.[mi16 mi8. mi16 mi8. mi16]
    re8.[re16 re8. re16 re8. re16]

    %4
    dod8.[dod16 dod8. dod16 dod8. dod16]
    si8.[si16 si8. si16 si8. si16]
    la8.[la16 la8. la16 la8. la16]

    %7
    si8.[dod16 re8. mi16 fad8. mi16]
    re4 re4. dod8\mbreak
    re8. fad16 \tuplet 3/2 { la8(sol) fad la[(sol) fad]}

    %10
    mi4 r8 mi mi8. mi16
    fad8.[fad16 fad8. fad16 fad8. fad16]
    si,8.[re16 la'8. la16 la8. la16]

    %13
    \tuplet 3/2 { la8(sold) fad } si8. si16 si8. si16
    \tuplet 3/2 { si8(la) sold } dod8. dod16 dod8. dod16
    \tuplet 3/2 { dod8(si) la } re8. re16 re8. re16\mbreak

    %16
    \tuplet 3/2 { re8(dod) si } mi8. mi16 mi8. mi16
    mi8.[mi,16 mi8. mi16 mi8. mi16]
    mi8.[mi16 mi8. mi16 mi8. mi16]

    %19
    mi8.[mi16 mi8. mi16 mi8. mi16]
    mi4 r r
    dod8.[dod16 dod8. dod16 dod8. dod16]

    %22
    re8.[re16 re8. re16 re8. re16]\mbreak
    si8.[si16 si8. si16 si8. si16]
    dod8.[dod16 dod8. dod16 dod8. dod16]

    %25
    la8.[la16 la8. la16 la8. la16]
    si4 r r
    la r r

    %28
    la r r
    la r r
    mi4 mi'2

    %31
    mi4. la8 la8. la16
    \tuplet 3/2 { la8(sol fad) fad([(mi re)] re(dod si) }\mbreak
    sold2 si'4

    %34
    mi, mi4. mi8
    mi2.
    R

    %37
    la8.[la16 la8. la16 la8. la16]
    re,8.[re16 re8. re16 re8. re16]\mbreak
    si'8.[si16 si8. si16 si8. si16]

    %40
    mi,8.[mi16 mi8. mi16 mi8. mi16]
    dod'8.[dod16 dod8. dod16 dod8. dod16]
    fad,4 r r\mbreak

    %43
    si8.[si16 si8. si16 si8. si16]
    mi,4 r r
    la8.[la16 la8. la16 la8. la16]

    %46
    re,4 r r
    sol8.[sol16 sol8. sol16 sol8. sol16]
    dod,2 re4

    %49
    sol fad4. fad8
    fad4. mi8 re4
    dod fad fad

    %52
    fad4. mi8 re4
    dod fad fad\mbreak
    fad\fermata r r

    %55
    la4. sol8 fad4
    mi la la
    la4. sol8 fad4

    %58
    mi la la
    la4. sol8 fad4
    si8.[si16 si8. si16 si8. si16]

    %61
    mi,8.[mi16 mi8. mi16 mi8. mi16]
    la8.[la16 la8. la16 la8. la16]
    re,8.[re16 re8. re16 re8. re16]

    %64
    sol8.[sol16 sol8. sol16 sol8. sol16]
    dod,8.[dod16 dod8. dod16 dod8. dod16]
    fad8.[fad16 fad8. fad16 fad8. fad16]

    %67
    si,8.[si16 si8. si16 si8. si16]
    la4 r r
    r8 re re re re re

    %70
    re re re re re re
    re re re re re re
    re re re re re re

    %73
    re2 si4
    la la2
    la4 la2

    %76
    la re4
    re2 re4
    re2 re4

    %79
    re2 re4
    mi2 fad4
    sol dod, re

    %82
    mi2 mi4
    la,8 re re4. dod8
    re2.\fermata

}

IVfgn = \relative do {

    re8.[re'16 re8. re16 re8. re16]
    dod8.[dod16 dod8. dod16 dod8. dod16]
    si8.[si16 si8. si16 si8. si16]

    %4
    la8.[la16 la8. la16 la8. la16]
    sol8.[sol16 sol8. sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16 fad8. fad16]

    %7
    mi8. [la,16 si8. dod16 re8. mi16]
    fad8. sol16 la4 la,
    re8.[re'16 re8. re16 re8. re16]

    %10
    dod8.[dod16 dod8. dod16 dod8. dod16]
    si8.[si16 si8. si16 si,8. si16]
    mi4 dod la

    %13
    re r r
    mi r r
    fad r r

    %16
    sold r r
    la r r
    mi r r

    %19
    mi fad sold
    la r r
    la r r

    %22
    sold r r
    sol! r r
    fad r r\mbreak

    %25
    si, r r
    mi r r
    mi r r

    %28
    mi r r
    mi r r
    mi mi,2

    %31
    la4 dod la
    re2 re4~
    re2 sold,4

    %34
    la mi' mi,
    la2.
    la'2 sol4

    %37
    fad8.[fad16 fad8. fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16 sol8. sol16]
    sold8.[sold16 sold8. sold16 sold8. sold16]

    %40
    la8.[la16 la8. la16 la8. la16]
    lad8.[lad16 lad8. lad16 lad8. lad16]
    si8.[si16 si8. si16 si8. si16]\mbreak

    %43
    mi,4 r r
    la8.[la16 la8. la16 la8. la16]
    re,4 r r

    %46
    sol8.[sol16 sol8. sol16 sol8. sol16]
    dod,4 r r
    fad2 si,4

    %49
    mi fad fad,
    si si si
    fad' fad fad\mbreak

    %52
    si, si si
    fad fad fad
    si\fermata r r

    %55
    re re re
    la la la
    re, re re

    %58
    la' la la
    re4 r r
    sol8.[sol16 sol8. sol16 sol8. sol16]

    %61
    sol4 r r\mbreak
    fad8.[fad16 fad8. fad16 fad8. fad16]
    fad4 r r

    %64
    mi8.[mi16 mi8. mi16 mi8. mi16]
    mi4 r r
    re8.[re16 re8. re16 re8. re16]

    %67
    re4 r r
    dod8.[dod16 dod8. dod16 dod8. dod16]\mbreak
    re4 r r

    %70
    mi r r
    fad r r
    sol re do

    %73
    si la sol
    fad dod'2
    re4 la' la,

    %76
    re mi fad
    sol2 fad4
    sol fad re

    %79
    sol2 fad4\mbreak
    mi2 re4
    dod2 si4

    %82
    la2 dod4
    re la' la,
    re2.\fermata

}

IVbcn = \relative do {

    re8.[re'16 re8. re16 re8. re16]
    dod8.[dod16 dod8. dod16 dod8. dod16]
    si8.[si16 si8. si16 si8. si16]

    %4
    la8.[la16 la8. la16 la8. la16]
    sol8.[sol16 sol8. sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16 fad8. fad16]

    %7
    mi8. [la,16 si8. dod16 re8. mi16]
    fad8. sol16 la4 la,
    re8.[re'16 re8. re16 re8. re16]

    %10
    dod8.[dod16 dod8. dod16 dod8. dod16]
    si8.[si16 si8. si16 si,8. si16]
    mi4 dod la

    %13
    re r r
    mi r r
    fad r r

    %16
    sold r r
    la r r
    mi r r

    %19
    mi fad sold
    la r r
    la r r

    %22
    sold r r
    sol! r r
    fad r r\mbreak

    %25
    si, r r
    mi r r
    mi r r

    %28
    mi r r
    mi r r
    mi mi,2

    %31
    la4 dod la
    re2 re4~
    re2 sold,4

    %34
    la mi' mi,
    la2.
    la'2 sol4

    %37
    fad8.[fad16 fad8. fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16 sol8. sol16]
    sold8.[sold16 sold8. sold16 sold8. sold16]

    %40
    la8.[la16 la8. la16 la8. la16]
    lad8.[lad16 lad8. lad16 lad8. lad16]
    si8.[si16 si8. si16 si8. si16]\mbreak

    %43
    mi,4 r r
    la8.[la16 la8. la16 la8. la16]
    re,4 r r

    %46
    sol8.[sol16 sol8. sol16 sol8. sol16]
    dod,4 r r
    fad2 si,4

    %49
    mi fad fad,
    si si si
    fad' fad fad\mbreak

    %52
    si, si si
    fad fad fad
    si\fermata r r

    %55
    re re re
    la la la
    re, re re

    %58
    la' la la
    re4 r r
    sol8.[sol16 sol8. sol16 sol8. sol16]

    %61
    sol4 r r\mbreak
    fad8.[fad16 fad8. fad16 fad8. fad16]
    fad4 r r

    %64
    mi8.[mi16 mi8. mi16 mi8. mi16]
    mi4 r r
    re8.[re16 re8. re16 re8. re16]

    %67
    re4 r r
    dod8.[dod16 dod8. dod16 dod8. dod16]\mbreak
    re4 r r

    %70
    mi r r
    fad r r
    sol re do

    %73
    si la sol
    fad dod'2
    re4 la' la,

    %76
    re mi fad
    sol2 fad4
    sol fad re

    %79
    sol2 fad4\mbreak
    mi2 re4
    dod2 si4

    %82
    la2 dod4
    re la' la,
    re2.\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6>
    <6>
    <6>
    <6>
    <6>
    s
    <6>4 <4> <3>
    s2.
    <6>
    s
    <_+>
    s
    <_+>
    <6>
    <6 5>
    s
    <_+>
    <_+>2 <6>4
    s2.
    <6>
    <7>
    <6>
    <7>
    <7>
    <7 _+>
    <6 4>
    <6! 4>
    <5 4>
    <_+>4 <_+>2
    s4 <6>2
    s <6>4
    <4\+ 2>2 <6>4
    s <6 4> <5 _+>
    s2.*2
    <6 5!>2.
    s
    <6 5>
    s <6 5>
    s
    <7>
    <7>
    <7>
    <7>
    <7>
    <7 _+>
    <7 5>4 <6 4> <5 _+>
    s2.
    <4>4 <_+>2
    s2.
    <4>4 <_+>2
    s2.*2
    <4>4 <3> s
    s2.
    <4>4 <3>2
    s2.*2
    <4 2>2.
    <6>
    <4 2>
    <6 5>
    <4 2>
    <6 5>
    <4 2>
    <6 5>
    s
    <7> <6>
    s2 <4 2>4
    <6>2.
    s4 <6 5>2
    s4 <4> <3>
    s <6!> <6 5!>
    s2 <6 5!>4
    s <6> s
    s2 <6>4
    s2.
    s
    s2 <6 5>4
    s <4> <3>

}

forma = {

    \key re\major
    \time 3/4
    \tempo 2 = 60
    s2.*35
    \bar ":..:"\break
    s2.*49
    \bar ":|."

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


IVvlrpI = {
    \IVglobal
    <<\IVvlrpIn \forma>>
}


IVvlrpII = {
    \IVglobal
    <<\IVvlrpIIn \forma>>
}


IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>
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
    \typeset
}
#(set-global-staff-size 16)


\pointAndClickOff

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {[1.] Allegro}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violino"\vspace #-0.2 "Primo"}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2 "Secondo"}
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violino Primo"\vspace #-0.2 "de Concerto"\vspace #-0.2 "Grosso"}
                \set Staff.midiInstrument = #"violin"
                \IvlrpI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino Secondo"\vspace #-0.2 "de Concerto"\vspace #-0.2 "Grosso"}
                \set Staff.midiInstrument = #"violin"
                \IvlrpII
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Alto"\vspace #-0.2"Viola"}
            \set Staff.midiInstrument = #"viola"
            \Ivla
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Fagotto"}
            \set Staff.midiInstrument = #"bassoon"
            \Ifg
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.instrumentName = \markup \center-column{"Organo"}
            \set Staff.midiInstrument = #"church organ"
            \Ibc
        >>
    >>

    \layout {

        indent = 2.2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[2.] Aria Cantabile}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlrpI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlrpII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIfg
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"church organ"
            \IIbc
        >>
    >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[3.] Ciaccona - Allegro e Spiccato}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlrpI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlrpII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIIfg
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"contrabass"
            \IIIbc
        >>
    >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[5.] Allegro }

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlrpI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlrpII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IVvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IVfg
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"church organ"
            \IVbc
        >>
    >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

