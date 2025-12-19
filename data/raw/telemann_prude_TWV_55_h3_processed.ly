\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

dolce = _\markup \italic { doux }

solo = ^\markup \italic { Seul }

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
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IvlIn = \relative do'' {

    re4. dod16 si fad'4. fad8
    si2 r8 r16 la[sol8. fad16]
    sol4. fad16 mi fad4. sol8

    %4
    mi4. re8 dod8.[re16 mi8. dod16]
    re4. mi8 dod4. si16 dod
    re4 si r8 si16 dod re mi fad sol\mbreak

    %7
    la4. si8 sold4. la8
    la2 mi4. fad8
    sol2 re4. mi8

    %10
    fad2 fad4. fad8
    fad4. sol8 mi4.\tr re8
    mi4. si8 dod4. re8

    %13
    dod4. si16 la mi'4. mi8
    la2 r8 r16 sol[fad8. mi16]\mbreak
    fad4. sol8 mi4. re8

    %16
    re4 r16 la si dod re mi fad mi re dod si la
    sold mi fad sold la si dod re mi4. mi8
    mi2 r8 r16 mi[fad8. dod16]

    %19
    re2 dod4. re8
    si2 sol'4. fad8
    mi8.[re16 dod8. re16]\mbreak re4.\tr dod8

    %22
    dod1 dod8 fad fad fad fad mi mi mi
    mi re16 dod re8. [mi16] dod4 re8. fad16
    si,4 dod8. mi16 lad,8 si16 dod re8 [dod16 si]

    %25
    dod8 dod16 re mi8 [re16 dod] red8 dod16 si si'8.[mi,16]\mbreak
    la4 la8 sol16 fad sol4 sol8 fad16 mi
    fad4 fad8 mi16 re mi8 la, r4

    %28
    r2 r8 la' la la
    la sol sol sol sol fad16 mi fad8. [sol16]
    mi4 fad8. la16 re,8 [mi16 fad] sol8 [la16 si]

    %31
    dod,8 re16 mi fad8[sol16 la] si,8 dod16 re dod8[re16 mi]\mbreak
    la,4 re8. re16 sol4 r16 fad sol mi
    fad8.[sol16 mi8. re16] re8. mi16 fad [sold la si]

    %34
    sold8 fad16 mi la8.[la,16] re4 re8 dod16 si
    dod4 dod8 si16 la si4 si8 la16 sold
    la8.[si16 sold8. fad16] fad8 fad'16 mi red8 [mi16 fad]\mbreak

    %37
    si,4 si'8. mi,16 la4 la8 sol16 fad
    sol8 fad16 mi do'8. [do16] fad,4 si8. si16
    mi,8.[fad16 fad8.\tr  mi16] red4 re8. mi16

    %40
    dod4 do8. re16 si8 mi16 red mi8[fad16 sol]
    la4 r16 sol la fad sol8.[la16 fad8. mi16]\mbreak
    mi8 [sol16 fad] mi re dod si lad8 fad r4

    %43
    r8 fad' fad fad fad mi mi mi
    mi re16 dod re8.[mi16] dod8 re16 mi fad [mi re dod]
    si8 dod16 re mi [re dod si] la8[si16 dod] re8 mi16 fad

    %46
    sol4 dod,8 re16 mi fad4 si,8 dod16 re\mbreak
    mi4 sol8 fad16 mi re8 mi16 dod dod8.[si16]
    si8 dod16 re dod8[re16 mi] lad,4 fad'8. fad16

    %49
    sol4 sold8 la16 si lad8 sold16 fad si8.[la16]
    sol! fad mi re\mbreak dod [mi re mi] fad8 mi16 re dod8.[si16]
    si4. fad'8 fad4. fad8

    %52
    si,2. r8 si
    mi4. mi8 la8.[sol16 fad8. sol16]
    fad4.\tr re8 re4. re8

    %55
    sol,4. sol8\mbreak sol8.[la16 si8. sol16]
    do4. si8 la4. sol8
    sol4. si'8 si4. si8

    %58
    mi,2. r8 mi
    mi4. fad8 fad4.\tr mi8
    re8.[dod16 si8. dod16] re2~

    %61
    re4. dod8\mbreak dod4. si8
    fad2 si4. si8
    mi4. re8 dod4.\tr si8

    %64
    si fad' fad fad fad mi mi mi si1

}

IvlIIn = \relative do'' {

    si2 dod4. dod8
    si4. dod8 red4. red8
    mi4. si8 dod8.[si16 dod8. re16]

    %4
    dod4.\tr si8 si4. si8
    si4. dod8 lad4. si8
    si2 fad4. re'8

    %7
    mi4. mi8 mi4. mi8\mbreak
    mi2 do4. do8
    si2 si4. dod!8

    %10
    re2 la4. la8
    si1
    si

    %13
    la2 la4. la8
    la4. si8 dod4. dod8
    re4. mi8 dod4. la8

    %16
    la2 fad4. fad8
    mi2 sol4. sol8\mbreak
    fad4 lad r8 r16 lad[dod8. lad16]

    %19
    si2 sol4. la?8
    sol2 si4. si8
    si4 lad8. si16 si4.\tr lad8

    %22  OOKK
    lad1 lad8 r r4 r2
    r8 si si si si la? la la\mbreak
    sol sol sol sol fad fad fad fad

    %25
    sol fad fad fad fad mi mi mi
    mi red red red si' si si[la16 sol]
    la8 la la[sol16 fad] sol8 la16 si la8[sol]

    %28
    fad re' re re re dod dod dod
    si4 dod8. mi16 la,8 la la la\mbreak
    sol la la la fad sol sol sol

    %31
    mi fad fad fad re mi mi mi
    dod re re re si' dod dod dod
    re8. mi16 dod8. la16 la8 la la fad

    %34
    si la la la la sold sold sold
    mi fad fad fad red mid mid mid\mbreak
    fad8. sold16 mid8. fad16 fad8 fad fad fad

    %37
    red mi? mi mi mi red red red
    mi sol? sol sol la fad fad fad
    sol la la la fad fad sold sold

    %40
    mi mi fad fad red mi mi mi
    mi red' red red mi8. fad16 red8.\tr si16\mbreak
    si4 r r8 si si si

    %43
    si la la la sold dod dod dod
    dod si si si sol! fad fad fad
    fad mi mi mi mi re la' la

    %46
    si sol sol sol la fad fad fad
    sold lad lad lad si si si lad\mbreak
    si si mi, mi dod dod red red

    %49
    si' si si si fad si si si
    si lad lad lad si dod16 si lad8.[fad16]
    fad2 r

    %52
    r4 r8 sol re4. sol8
    sol4. sol8 do4 do8. si16
    la4.\tr fad8 fad4. fad8\mbreak

    %55
    mi4. sol8 sol4. sol8
    fad4. sol8 fad4.\tr re8
    re4. re'8 re4. mi8

    %58
    dod!4. sold8 sold4(lad8.) si16
    lad2. r8 lad
    si4. si8 fad8. [sol16 mi8. fad16]

    %61
    sol2. r8 dod,
    dod4. si8 si4. fad'8\mbreak
    si8. [si16 dod8. si16] lad4. fad8

    %64
    fad r r4 r2 fad1

}

Ivlan = \relative do' {

    fad2 fad4. fad8
    re4. mi8 fad4. si8
    si4. si8 lad8.[si16 lad8. si16]

    %4
    fad4. fad8 sol4. sol8
    fad2 fad4. fad8
    fad2 re4. si'8

    %7
    la?8.[si16 dod8. re16] si4.\tr dod8\mbreak
    dod2 la4. la8
    si2 sol4. sol8

    %10
    la2 fad4. fad8
    re2 sol
    mi1

    %13
    mi2 dod4. dod8
    re4. fad8 mi4. la8
    la4. si8 la4 mi

    %16
    fad2 si,4. si8
    si2 dod4. dod8
    dod2 r8 r16 dod[fad8. fad16]\mbreak

    %19
    fad2 mi4. re8
    re2 mi4. si8
    mi4 fad fad4. fad8

    %22
    fad1 fad8 r r4 r2
    r r8 fad fad fad
    fad mi mi mi mi re re re

    %25
    mi dod dod dod si si si si\mbreak
    dod fad fad fad si, mi mi mi
    dod re re re si mi mi mi

    %28
    la, sold' sold sold mi4 r
    r8 mi mi mi mi re re re
    si' mi, re re la' re, re re

    %31
    sol dod, dod dod fad si, la la
    mi' la, la la re sol sol sol\mbreak
    la si la la fad fad re re

    %34
    mi mi mi mi fad re re re
    mi dod dod dod red si si si
    dod re! dod dod dod dod si si

    %37
    fad' si, si si dod fad fad fad
    si, mi mi mi\mbreak do' si si si
    si do do do la si si si

    %40
    mi, la la la fad si, si si
    dod la' la la si do si si
    sol mi mi mi mi re re re

    %43
    dod!2~dod8 lad lad lad\mbreak
    si fad' fad fad mi dod dod dod
    re si si si dod la la re

    %46
    re dod mi dod dod si re si
    si mi mi mi fad sol fad fad
    re si dod dod mi fad la, la\mbreak

    %49
    si mi mi mi dod re fad fad
    mi mi mi mi fad sol dod, fad
    re2 r

    %52
    r4 r8 re si4. re8
    do4. sol'8 fad!4 la8. re,16
    re4. la'8 la4. la8

    %55
    sol4. si,8\mbreak si4. si8
    la4 re re4. re8
    si4. si8 mi4. mi8

    %58
    mi4. dod!8 dod4. dod8
    dod2. r8 fad
    fad4. fad8 re4. re8

    %61
    si4. mi8 mi4. sol8
    lad,4. fad'8 fad4. re8\mbreak
    re8.[re16 dod8. fad16] fad4. fad8

    %64
    re r r4 r2 re1

}

Ibcn = \relative do {

    si'2 la4. sol16 fad
    sol4. fad16 mi si'4. si8
    mi2~mi8.[re16 dod8. si16]

    %4
    lad4 si mi,4. mi8
    fad2 fad,4. fad8\mbreak
    si dod16 re mi fad sol la si4. re8

    %7
    dod4 si mi mi,
    la,8 si16 dod re mi fad sold la4. la,8
    sol la16 si do re mi fad sol4. fad16 mi

    %10
    re8 mi16 fad sol la si dod?\mbreak re dod si la sol fad mi re
    sol,1
    sold

    %13
    la2 sol'!4. fad16 mi
    fad4. mi16 re la'4. la8
    re4 sol, la la,

    %16
    re,2 re'4. re8
    mi4. re8 dod16 re mi re dod re dod si
    lad4 fad r8 r16 dod''[lad8. fad16]

    %19
    si4 si, mi4. fad8
    sol4. fad8 mi4. re8
    dod4 fad si si,

    %22
    fad'2 lad4.\tr sold16 fad fad8 r r4 r2
    R1
    r2 r8 si si si

    %25
    si la la la la sol sol sol
    sol fad fad fad fad mi mi mi
    mi re re re re dod dod dod

    %28
    dod si si si la4 r
    r2 r8 re' re re
    re do do do\mbreak do si si si

    %31
    si la la la la sol sol sol
    sol fad fad fad fad mi mi mi
    re sol la la, re, re' re re

    %34
    re dod dod dod dod si si si
    si la la la la sold sold sold
    fad si\mbreak dod dod, \once\stemUp fad la' la la

    %37
    la sol sol sol sol fad fad fad
    mi mi' mi mi mi re re re
    re do do do do si si si

    %40
    si la la la la sol sol sol
    sol fad fad fad mi la \mbreak si si,
    mi4 r r2

    %43
    R1
    r8 si' si si si la la la
    la sol sol sol sol fad fad fad

    %46
    fad mi mi mi mi re re re
    re dod dod dod si mi fad fad,\mbreak
    sol sol' sol sol sol fad fad fad

    %49
    fad mi mi mi mi re re re
    re dod dod dod si mi fad fad,
    si2 r

    %52
    r4 r8 sol' sol4. sol8\mbreak
    do,4 do8. si16 la4 la8. sol16
    re'1

    %55
    r4 r8 mi mi4. mi8
    la,4 sol re' re,
    sol sol8. fad16 sold8.[la16 si8. sold16]

    %58
    la4. dod'8 dod4. dod8\mbreak
    fad,2. r8 fad,
    si4. si'8 si4. si8

    %61
    mi,2. r8 mi
    mi4. re8 re4. re8
    sold,8.[sold16 lad8. mi'16] fad4 fad,

    %64
    si8 r r4 r2 si1

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key si\minor
    \tempo 2 = 60
    \repeat volta 2{s1*21}
    \alternative {{s1}{\time 2/2 \tempo 2 = 60 s}}\break
    \set Score.currentBarNumber = #23
    \repeat volta 2 {
        s1*28
        \time 4/4 \tempo 2 = 60
        s1*13
    }
    \alternative {{\time 2/2 \tempo 2 = 60 s1}{\time 4/4 s1}}
    \bar"|."

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

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIvlIn = \relative do'' {

    fad4. sol8 fad4
    fad fad fad fad4. sol8 fad4
    fad fad fad si la si
    sol2\tr fad4 mi4. fad8 mi4

    %4
    mi mi mi mi4. fad8 mi4\mbreak
    mi mi mi re dod re
    dod2. re4. mi8 re4

    %7
    re la re mi4. fad8 mi4
    mi la, mi' la4. si8 la4
    la la la la4. si8 la4

    %10
    la la la fad8 sol la4 sol\mbreak
    fad mi fad sol fad mi
    re4. dod8 re mi fad4. sol8 fad4

    %13
    si, la sold mi'4. fad8 mi4
    lad, sold fad si4. dod8 si4
    dod si dod re dod re

    %16
    dod4. re8 mi dod fad4. sol8 fad4\mbreak
    fad fad fad fad4. sol8 fad4
    sol sol sol si la sol

    %19
    fad mi re mi re dod
    si2.\fermata

}

IIvlIIn = \relative do'' {

    si2 si4
    dod dod dod si2 si4
    dod dod re re re re
    re dod re si2 si4

    %4
    dod dod dod si2 si4
    dod dod dod\mbreak si fad si
    lad2. la2 la4

    %7
    la fad la la2 la4
    la mi la mi'2 mi4
    fad fad fad mi2 mi4

    %10
    fad fad fad re re mi
    re dod re re re dod
    la2.\mbreak la2 la4

    %13
    fad fad mi sold2 sold4
    fad fad fad fad2 fad4
    lad fad lad si lad si

    %16
    lad2. dod2 dod4
    re re re dod2 dod4
    re re re re re dod\mbreak

    %19
    re dod si si si lad
    fad2.\fermata

}

IIvlan = \relative do' {

    re2 re4
    fad fad fad re2 re4
    fad fad fad sol la sol
    si la la sold2 sold4

    %4
    la la la sold2 sold4\mbreak
    la la fad fad fad fad
    fad2. fad2 fad4

    %7
    fad re fad mi2 mi4
    mi dod mi dod'2 dod4
    la la la dod2 dod4

    %10
    la la la la la dod\mbreak
    la la la si si mi,
    fad2. re2 re4

    %13
    si si si dod2 dod4
    dod si lad si2 fad'4
    fad fad fad fad fad fad fad

    %16
    fad2 lad2 lad4
    si si si\mbreak lad2 lad4
    si si si re, re sol

    %19
    la lad si sol sol dod,
    re2.\fermata

}

IIbcn = \relative do {

    r2.
    lad'4-! lad-! lad-! r2.
    lad4-! lad-! si-! sol fad sol
    mi la re, r2.

    %4
    la'?4 la la r2.
    la4 la lad\mbreak si si si,
    fad'2. re2 re4

    %7
    re' re re dod,2 dod4
    dod' dod dod r2.
    re4 re re r2.

    %10
    re4 re re re, fad la\mbreak
    re la re sol, sol  la
    re, la re, re'2 r4

    %13
    red red mi dod2 r4
    fad fad fad, re'?2 re4
    fad re fad si fad si

    %16
    fad2.\mbreak r
    si,4 si si r2.
    si'4 si si sol fad mi

    %19
    re8 mi fad4 sol mi mi fad
    si,2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 6/4
    \key si\minor
    \tempo 2 = 60
    \partial 2. s2.
    s1.*5
    s2. \bar ":..:" s
    s1.*13
    s2.
    \bar":|."

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

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIIvlIn = \relative do'' {

    fad4 si
    si la la sol
    fad2 si,4 fad'
    fad mi mi re8 dod

    %4
    re4 si fad' si
    si la la sol
    fad2 sol4 fad8 mi

    %7
    fad4 mi8 re\mbreak mi4 re8 dod
    re2 la4 re
    re dod dod si

    %10
    mi2 dod4 fad
    fad sold sold8 la si sold
    la4 fad la la

    %13
    la2 mi8 fad sol mi
    fad4 re fad fad
    fad2\mbreak dod8 re mi dod

    %16
    re4 si fad' si
    si la la sol
    fad2 sol4 fad8 mi

    %19
    fad4 mi8 re mi4 dod
    si2\fermata

}

IIIvlIIn = \relative do'' {

    si4 re
    re mi mi dod
    la2 si4 si
    si si si lad

    %4
    si fad si re
    re mi mi dod
    la2 re4 re

    %7
    re la\mbreak si la
    la2 fad4 si
    si la la sold

    %10
    la2 la4 la
    la re re dod
    dod la re fad

    %13
    mi2 la,4 mi'
    re la si re
    dod2\mbreak fad,4 dod'

    %16
    si fad si re
    re dod dod mi
    re2 re4 la

    %19
    la si si lad
    fad2\fermata

}

IIIvlan = \relative do' {

    fad4 fad
    fad la la mi
    re2 re4 si
    si sol' sol fad

    %4
    fad re fad fad
    fad la la mi
    re2 re4 si'\mbreak

    %7
    la la mi mi
    fad2 re4 fad
    fad mi mi mi

    %10
    mi2 fad4 fad
    fad fad fad mid
    fad dod re la'

    %13
    la2 la4 dod
    la fad fad fad\mbreak
    fad2 fad4 lad

    %16
    fad re fad sol
    sol mi mi dod'
    la2 re,4 mi

    %19
    re re sol fad
    re2\fermata

}

IIIbcn = \relative do {

    re'4 si
    si dod dod la
    re2 sol,4 re
    re mi mi fad

    %4
    si si, re' si
    si dod dod la
    re2 si4 la8 sol\mbreak

    %7
    la4 sol8 fad sol4 la
    re,2 re4 si
    si mi mi re

    %10
    dod2 fad4 re
    re si si dod
    fad fad, fad' re

    %13
    dod2 dod4 la\mbreak
    re re, re' si
    lad2 lad'4 fad

    %16
    si si, si' sol
    sol la la la,
    re2 si4 dod

    %19
    re sol mi fad
    si,2\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \key si\minor
    \tempo 1 = 60
    \partial 2 s2
    s1*7
    s2 \bar ":..:" s
    s1*11
    s1
    \bar":|."

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

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IVvlIn = \relative do'' {

    fad8
    fad(mi re) mi(re dod)
    re(dod si) r r re
    dod(mi re) dod(re si)

    %4
    dod (lad fad) r r lad
    si(dod re) re(mi fad)
    fad16(sol la8 fad)\mbreak sol(fad sol)

    %7
    la,(si dod) dod(re mi)
    mi16(fad sol8 mi) fad(mi fad)
    si(lad si) fad4.

    %10
    mi16(fad sol8 mi) fad4.
    si8(lad si) fad(sol mi)
    re(mi dod) si4 re8

    %13
    dod(si la) mi'(dod la)
    fad'(mi re) r r mi
    red(dod si) fad'(red si)

    %16
    sol'(fad mi) r r si'
    do(si la) la(sol fad)
    fad16(sol la8 fad) si(la sol)

    %19
    si(la sol) sol(fad mi)\mbreak
    mi16(fad sol8 mi) la(sol fad)
    la(sol fad) fad(mi red)

    %22
    red16(mi fad8 red) mi16(fad sol8 mi)
    fad16(sol la8 fad) sol16(la si8 la)
    sol(la fad) mi sol fad

    %25
    sol4. r
    fad r\mbreak
    mi8(fad re) dod(re si)

    %28
    dod(lad fad) r r lad
    si(dod re) re(dod si)
    fad'(re si) si16(dod re8 si)

    %31
    si(dod re) re(dod si)
    fad'(re si) si16(dod re8 si)\mbreak
    si'(lad si) fad4.

    %34
    mi16(fad sol8 mi) fad4.
    si8(lad si) fad(sol mi)
    re(mi dod) si4\fermata

}

IVvlIIn = \relative do'' {

    re8
    re4. dod
    si fad4 si8
    sol4. mi

    %4
    lad dod,4 fad8
    fad4. fad
    si si

    %7
    mi, mi
    la la\mbreak
    re re8(si re)

    %10
    dod4. si8(lad si)
    re4. si4 si8
    si4 lad8 fad4 sold8

    %13
    la?4. la
    la fad4 la8
    si4. si

    %16
    si sol4 mi'8\mbreak
    mi4. mi
    re re4 re8

    %19
    re4. re
    do do4 do8
    do4. do

    %22
    si si
    si mi4 mi8
    mi4 red8 si4 red8

    %25
    si4 si8 mi(red dod)\mbreak
    la4 la8 re?(mi fad)
    si,4. mi,

    %28
    lad dod,4 fad8
    re4. r
    si' r

    %31
    re, r
    si' r
    re re8(si re)

    %34
    dod?4. si8(lad si)
    re4. si4 si8\mbreak
    si4 lad8 fad4\fermopz

}

IVvlan = \relative do' {

    si'8
    si4. fad
    fad re4 fad8
    mi4. mi

    %4
    dod lad4 dod8
    si4. si
    fad' mi

    %7
    mi mi
    mi\mbreak re
    fad fad4 fad8

    %10
    sol4. fad4 fad8
    sol4. fad4 sol8
    fad4 fad8 re4 re8

    %13
    mi4. mi
    re la4 mi'8
    fad4. fad\mbreak

    %16
    mi si4 si'8
    la4. la
    la sol4 sol8

    %19
    sol4. sol
    sol4. fad4 fad8
    fad4. fad

    %22
    fad mi
    si si'4 do8
    si4 si8\mbreak sol4 si8

    %25
    si(la sol) la4 la8
    la(sol fad) la4 la8
    sol4. sol

    %28
    dod, lad4 dod8
    si4. r
    si4. r

    %31
    si4. r
    si4. r\mbreak
    fad' fad4 fad8

    %34
    fad4. fad4 fad8
    sol4. fad4 sol8
    fad4 fad8 re4\fermata

}

IVbcn = \relative do {

    si8
    si'4. lad
    si si,4 si'8
    mi,4. sol

    %4
    fad fad,4 fad'8
    re4. si
    red mi

    %7
    dod la\mbreak
    dod re
    si si'16(dod re8 si)

    %10
    lad4. re8 dod re
    sol,4. re4 mi8
    fad4. si,4 si'8

    %13
    la?4. dod
    re re,4 do'8\mbreak
    si4. red

    %16
    mi mi,4 sol8
    la4. do
    re sol,4 si8

    %19
    sol4. si
    do fad,4 la8
    fad4. la

    %22
    si sol
    red mi4 la,8\mbreak
    si4. mi,4 si''8

    %25
    mi(red mi) dod(si la)
    re?(dod re) fad,(mi re)
    sol4. sol

    %28
    fad fad,4 fad'8
    sol4. r
    re r

    %31
    sol r\mbreak
    re r
    si si'16(dod re8 si)

    %34
    lad4. re8(dod re)
    sol,4. re4 mi8
    fad4.si,4\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 6/8
    \key si\minor
    \tempo 2. = 60
    \partial 8 s8
    s2.*11
    s4. s4 \bar ":..:" \break s8
    s2.*23
    s4. s4
    \bar":|."

}


IVvlI = {
    \global
    %\notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}

IVvla = {
    \global
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

VvlIn = \relative do'' {

    si16 dod
    re8[si re mi]
    fad4\parenthesize -!  re\tr
    dod8[si dod lad]

    %4
    si16 lad si dod si8 dod16 re
    mi8[la, mi' fad]
    sol4-! mi-!

    %7
    fad8 mi16 re\mbreak mi8 dod
    re dod16 si la si dod re
    mi8[la, mi' fad]

    %10
    sol4\parenthesize -! mi\parenthesize -!
    fad8 mi16 re mi8 dod
    re4. la'16 sol

    %13
    fad8[re fad sold]
    la4 mi8 fad16 mi
    re8[si re mi]\mbreak

    %16
    fad4 dod8 si16 dod
    re8 si16 re dod8 fad,16 dod'
    re8 si16 re dod8 fad,16 dod'

    %19
    fad8[mi re dod]
    si8[fad si dod]
    re8 si16 re dod8 fad,16 dod'

    %22
    re8 si16 re dod8 fad,16 dod'
    fad8[mi re dod]\mbreak
    si4. fad8\solo

    %25
    re[(si) dod(lad)]
    si[(re) fad(si)]
    la[(fad) sol(mi)]

    %28
    re[(fad) la(re)]
    si[(sold) mi(re')]
    dod[(si) la(dod)]

    %31
    la[(fad) re(dod')]\mbreak
    si[(la) sold(si)]
    sold[(mid) dod(sold')]

    %34
    la[(sold) fad(la)]
    sold[(si) la(sold)]
    si[(sold) la(sold)]

    %37
    dod[(sold) la(sold)]
    si[(sold) la(sold)]
    dod,[(mid) sold(si)]

    %40
    re4(dod8) si
    la[fad sold mid]\mbreak
    fad4. la8

    %43
    fad[(re) mi(dod)]
    re[(fad) la(re)]
    si[(sol!) mi(re)]

    %46
    dod[(si) la sol']
    fad[(la) re(fad,)]
    mi[(dod') mi,(dod')]

    %49
    re,[(fad) si(re,)]
    dod[(la') dod,(la')]
    si,[(re) sol(si,)]\mbreak

    %52
    la[(fad') la,(fad')]
    sol,[fad' mi re]
    si'[sol fad mi]

    %55
    fad[re la dod]
    re4. mi8
    fad[(re) re'(fad,)]

    %58
    sol[(fad mi) fad]
    sold[(mi) mi'(sold,)]
    la[(sold) fad(sold)]

    %61
    lad[(fad) si(fad)]\mbreak
    dod'[(fad,) re'(fad,)]
    mi'[(fad,) re'(fad,)]

    %64
    dod'[(lad) fad(lad)]
    dod[(mi) re(dod)]
    mi[(dod) re(dod)]

    %67
    fad[(dod) re(dod)]
    mi[(dod) mi(dod)]
    fad,[lad dod mi]

    %70
    sol4(fad8) mi
    re [si fad lad]
    si,4.

}

VvlIIn = \relative do'' {

    fad,8
    si[fad fad si]
    dod4\parenthesize -!  si\parenthesize -!
    lad8[si sol fad]

    %4
    fad fad16 mi re8 sold
    la[la dod re]
    mi4\parenthesize -!  dod\parenthesize -!

    %7
    re8[la si la]
    la[sol fad fad]\mbreak
    mi[mi dod' re]

    %10
    mi4\parenthesize -!  dod\parenthesize -!
    re8[la si la]
    la4. mi'8

    %13 OOKK
    re[la re re]
    mi4 la,8 dod
    si[fad si si]

    %16
    dod4 fad,8 lad
    si4 fad
    si lad\mbreak

    %19
    si8[si si lad]
    fad[re fad lad]
    si4 fad

    %22
    si lad
    si8[si si lad]
    fad4. r8

    %25
    R2*17
    r4 r8 r
    R2*29
    r4 r8

}

Vvlan = \relative do' {

    re16 mi
    fad8[re fad mi]
    dod4 fad
    fad8[re mi dod]

    %4
    re re16 mi fad8 re
    dod[dod la la']
    si4 la

    %7
    la8[la sol mi]\mbreak
    fad[sol re re]
    dod [dod la la']

    %10
    si4 la
    la8[la sol mi]
    fad4. la8

    %13
    la[fad la si]
    la4 la8 fad
    fad[re fad mi]

    %16
    dod4 dod8 fad
    fad4 fad
    fad fad

    %19
    fad8[sol fad fad]
    re[fad fad fad]
    fad4 fad

    %22
    fad fad
    fad8[sol fad fad]
    re4. r8

    %25
    R2*17
    r4 r8 r
    R2*29
    r4 r8

}

Vbcn = \relative do {

    si'8
    si [si, si' sold]
    lad4-! si-!
    fad8[sol mi fad]

    %4
    si[si, si si']
    la![la sol fad]
    re4-! sol-!

    %7
    re'8[fad, sol la]\mbreak
    re,[mi fad re]
    la'[la sol fad]

    %10
    mi4-! la-!
    re8[fad, sol la]
    re,4. dod'8

    %13
    re[re, re' si]
    dod[si dod lad]
    si[si, si' sold]

    %16
    lad[sold lad fad]\mbreak
    si4 lad
    si fad

    %19
    re8[mi fad fad,]
    si[dod re fad]
    si4 lad

    %22
    si fad
    re8[mi fad fad,]
    si4. lad'8\dolce\solo

    %25
    si4 fad
    si, r8 sol'
    la4 la,

    %28
    re r8 si'
    sold4 sold
    la r8 la

    %31
    fad4 fad
    sold r8 sold
    mid4 mid

    %34
    fad r8 fad
    dod4 dod
    dod r8 dod

    %37
    dod4 dod
    dod r8 dod\mbreak
    dod4 dod

    %40
    si dod
    fad dod
    fad,4. dod'8

    %43
    re4 la
    re, r8 fad'
    sol4 sol,

    %46
    la r8 dod
    re4 re
    la r8 la

    %49
    si4 si\mbreak
    fad r8 fad
    sol4 sol

    %52
    re r8 re
    si'4 si
    sol sol

    %55
    la la
    re, r8 dod'
    re4 si

    %58
    mi r8 red
    mi4 dod
    fad r8 mid

    %61
    fad4 sold\mbreak
    lad si
    dod si

    %64
    fad r8 fad
    fad4 fad
    fad r8 fad

    %67
    fad4 fad
    fad r8 fad,
    fad4 fad

    %70
    mi fad
    si fad'
    si,4.

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/4
    \key si\minor
    \tempo 2 = 60
    \partial 8 s8
    s2*11
    s4. \bar ":..:" s8
    s2*11
    s4.\fermata \bar ":..:" s8
    s2*17
    s4.\bar ":..:" s8
    s2*29
    s4.
    \bar ":|."
    \mark\markup\center-column\smaller {"D.C. ""al S."}

}


VvlI = {
    \global
    %\notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}

Vvla = {
    \global
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

VIvlIn = \relative do'' {

    fad,4 si re
    dod4.\tr si16 (dod) re4
    si mi fad

    %4
    re2\tr dod4
    fad, si re
    dod4. si16\parentSlur (dod) re4\mbreak

    %7
    dod4 si8 la sold fad
    fad2.  fad
    fad'4 si la

    %10
    la8(sol) sol(fad) fad(mi)
    mi4 la sol
    sol8(fad) fad(mi) mi(re)

    %13
    re4 sol fad\mbreak
    fad8(mi) mi(re) re(dod)
    re4 fad, lad

    %18
    si2. si\fermopz

}

VIvlIIn = \relative do'' {

    re,2 fad4
    fad fad fad
    mi2 dod'4

    %4
    si2\tr  lad4
    fad2 fad4
    fad fad fad

    %7
    fad2 mid4
    dod2. dod
    si'4 si si

    %10
    si2 r4
    la la la
    la2 r4

    %13
    sol2 la4
    si2 si4
    si2 fad4

    %16
    fad2. fad\fermata

}

VIvlan = \relative do' {

    re2 si4
    dod lad si
    si2 fad'4

    %4
    fad si, dod
    si2 si4
    dod lad si

    %7
    dod re sold,
    lad2. lad
    si4 red fad

    %10
    mi2 r4
    la, dod mi
    re2 r4

    %13
    re2 re4
    si mi sol
    fad2 dod4

    %16
    re2. re\fermata

}

VIbcn = \relative do {

    si2 si'4
    lad fad si
    sold2 lad4

    %4
    si si, fad'
    re2 si4
    lad fad si

    %7
    la! si dod
    fad, fad'8 mi re dod fad,4 fad' mi
    red si red

    %10
    mi2 r4
    dod la dod
    re!2 r4

    %13
    si2 re4
    sol fad mi
    fad2 fad,4

    %16
    si si' fad si,2.\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key si\minor
    \tempo 2. = 50
    \repeat volta 2{s2.*7}
    \alternative {{s2.}{s}}
    \repeat volta 2{s2.*7}
    \alternative {{s2.}{s}}
    \bar"|."

}


VIvlI = {
    \global
    %\notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}

VIvla = {
    \global
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

VIIvlIn = \relative do'' {

    re4 dod2
    si2 fad4
    sol la2

    %4
    re, mi4
    fad sol2
    fad si4

    %7
    lad8 si si4.\tr lad16 si
    dod2.\mbreak
    dod4 re2

    %10
    si mi4
    dod fad re
    si2\tr la4

    %13
    mi' dod2
    re fad,4
    si dod2

    %16
    lad4. dod8 si dod
    re4 dod2
    si fad4\mbreak

    %19
    sol la?2
    re, mi4
    fad sol2

    %22
    fad si4
    dod dod2
    si2. si

}

VIIvlIIn = \relative do'' {

    si4 lad2
    fad re4
    dod do2

    %4
    si dod!4
    re mi2
    re fad4

    %7
    fad mi2
    lad2.
    lad4 si2

    %10
    sold dod4\mbreak
    la? re si
    sold2 la4

    %13
    si fad2
    fad fad4
    sol sol?2

    %16
    fad4. lad8 sold lad
    si4 lad2
    fad re4

    %19
    dod do2
    si dod!4
    re mi2

    %22
    re re4\mbreak
    sol fad2
    fad2. fad

}

VIIvlan = \relative do' {

    fad4 fad2
    fad fad4
    mi la,2

    %4
    sol sol4
    la la2
    la re4

    %7
    dod si2
    fad'2.
    fad4 fad2

    %10
    mi sold4
    fad fad2\mbreak
    mi dod4

    %13
    si dod2
    si dod4
    si mi2

    %16
    dod fad4
    fad fad2
    fad fad4

    %19
    mi la,2
    sol sol4
    la la2

    %22
    la si4
    si lad2
    re2. re

}

VIIbcn = \relative do {

    si4 fad'2
    re si4
    mi fad2

    %4
    sol mi4
    re dod2
    re si4

    %7
    fad' sol2
    fad fad,4
    fad' si,2

    %10
    mi dod4\mbreak
    fad re2
    mi4 mi, la

    %13
    sold' lad2
    si la!4
    sol mi2

    %16
    fad4 fad, fad'
    si fad2
    re si4

    %19
    mi fad2
    sol mi4\mbreak
    re dod2

    %22
    re sol4
    mi fad fad,
    si re si si2.

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key si\minor
    \tempo 2. = 50
    s2.*8
    \bar ":..:"
    \repeat volta 2{s2.*15}
    \alternative {{s2.}{s}}
    \bar"|."

}


VIIvlI = {
    \global
    %\notypeset
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    \global
    <<\VIIvlIIn \forma>>

}

VIIvla = {
    \global
    \clef alto
    <<\VIIvlan \forma>>

}

VIIbc = {
    \global
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

VIIIvlIn = \relative do'' {

    fad4 mi
    re dod si lad
    si2 dod
    fad,4 mi' re dod

    %4
    re si sol' fad
    mi re dod si\mbreak
    lad2 si

    %7
    dod4 re mi re
    dod2 fad4 mi
    re dod si lad

    %10
    si2 dod
    fad,4 mi're dod
    re si sol' fad

    %13
    mi re dod si
    lad2 si
    dod4 re8(si) dod4 lad

    %16
    si2 re4 mi  %%% fine ripresa OOKK
    fad sol la si
    la,2 re

    %19
    r4 si dod re
    mi la, mi' fad
    sol la si do

    %22
    si,2 mi
    r4 fad sol la \mbreak
    fad4.\tr mi16(fad) sol2

    %25
    fad4 mi fad red
    mi fad8 sol la4 sol
    fad mi re dod

    %28
    re2 mi
    la,4 sol' fad mi
    fad re si' la

    %31
    sol fad mi re
    dod2 re
    mi4 fad8 re mi4 dod\mbreak

    %34
    re2 fad4 mi
    re dod si lad
    si2 dod

    %37
    fad,4 mi're dod
    re si sol' fad
    mi re dod si

    %40
    lad2 si
    dod4 re mi re
    dod2 fad4 mi

    %43
    re dod si lad
    si2 dod\mbreak
    fad,4 mi're dod

    %46
    re si sol' fad
    mi re dod si
    lad2 si

    %49
    dod4 re8 \parentSlur (si) dod4 lad
    si2 fad4 sold
    la si dod re

    %52
    dod2 fad
    r4 sold la fad
    sold dod, la' sold

    %55
    fad mi re dod\mbreak
    si2 dod
    re4 dod si la

    %58
    sold la8 si la4 sold
    dod si la sold
    fad2 dod'4 red

    %61
    mi2 si4 dod
    re!2 la4 si
    dod re mi dod

    %64
    re si mi dod\mbreak
    re4. mi8 mi2
    fad fad4 mi

    %67
    re dod si lad
    si2 dod
    fad,4 mi' re dod

    %70
    re si sol' fad
    mi re dod si\mbreak
    lad2 si

    %73
    dod4 re mi re
    dod2 fad4 mi
    re dod si lad

    %76
    si2 dod
    fad,4 mi're dod
    re si sol' fad

    %79
    mi re dod si
    lad2 si
    dod4 re8(si) dod4 lad

    %82
    si2\fermata r




}

VIIIvlIIn = \relative do'' {

    r2
    R1
    r2 lad4 fad
    fad lad si dod

    %4
    si2 si4 lad
    si2 sol
    fad re4 fad

    %7
    sol si lad si\mbreak
    fad sold lad2
    R1

    %10
    r2 lad4 fad
    fad lad si dod
    si2 si4 lad

    %13
    si2 sol
    fad re4 fad
    sol si sol fad

    %16
    fad2 la4 dod %%OOKK fine rip.
    re2 r\mbreak
    r fad,4 sol

    %19
    la sol8 fad mi4 re
    dod2 dod'4 red
    mi2 r

    %22
    r sol,4 la
    si do re mi
    red2 mi

    %25
    do4 si do si
    si2 la4 dod!\mbreak
    re2 r

    %28
    r dod4 la
    la dod re mi
    re2 re4 dod

    %31
    re2 si
    la fad4 la
    si la si la

    %34
    la fad si2
    R1
    r2 lad4 fad

    %37
    fad lad si dod
    si2 si4 lad
    si2 sol

    %40
    fad re4 fad
    sol si lad si\mbreak
    fad sold lad2

    %43
    R1
    r2 lad4 fad
    fad lad si dod

    %46
    si2 si4 lad
    si2 sol
    fad re4 fad

    %49
    sol si sol fad
    fad mi re2
    dod r

    %52
    r la'4 si
    dod re mi fad
    mid2 dod4 si

    %55
    la2 la
    mi mi4 sold\mbreak
    la sold fad2~

    %58
    fad fad4 mid
    fad fad fad mid
    fad2 mi?4 fad

    %61
    sol!2 re4 mi
    fad sol fad mi~
    mi si' lad dod

    %64
    si fad lad dod\mbreak
    si2 si\tr
    lad si4 lad

    %67
    si2 r
    r2 lad4 fad
    fad lad si dod

    %70
    si2 si4 lad
    si2 sol
    fad re4 fad

    %73
    sol si lad si\mbreak
    fad sold lad2
    R1

    %76
    r2 lad4 fad
    fad lad si dod
    si2 si4 lad

    %79
    si2 sol
    fad re4 fad
    sol si sol fad

    %82
    fad2\fermata r

}

VIIIvlan = \relative do' {

    r2
    R1
    r2 dod4 dod
    si dod fad fad

    %4
    fad2 mi4 dod
    si dod8 re mi4 re
    dod2 si4 re

    %7
    mi fad mi fad\mbreak
    fad2 dod
    R1

    %10
    r2 dod4 dod
    si dod fad fad
    fad2 mi4 dod

    %13
    si dod8 re mi4 re
    dod2 si4 re
    mi fad mi dod

    %16
    re2 re4 fad %%%ripresa
    la2 r\mbreak
    r la4 sol

    %19
    fad re la sold
    la2 la'
    si r

    %22
    r si4 la
    sol fad8 mi re4 la'
    si2 si

    %25
    la4 si la fad
    sol fad mi la
    la2 r\mbreak

    %28
    r mi4 mi
    re mi la la
    la2 sol4 mi

    %31
    re mi8 fad sol4 fad
    mi2 re4 fad
    sol la sol mi

    %34
    fad1
    R
    r2 dod4 dod

    %37
    si dod fad fad
    fad2 mi4 dod
    si dod8 re mi4 re

    %40
    dod2 si4 re
    mi fad mi fad\mbreak
    fad2 dod

    %43
    R1
    r2 dod4 dod
    si dod fad fad

    %46
    fad2 mi4 dod
    si dod8 re mi4 re
    dod2 si4 re

    %49
    mi fad mi dod
    re dod si2
    fad' r

    %52
    r dod'4 si
    la sold8 fad mi4 si'
    sold2 fad4 mid

    %55
    dod'2 la
    si la4 mi\mbreak
    la,2 si4 dod

    %58
    re2 dod~
    dod re4 sold,
    la si dod2

    %61
    si4 la si2
    la re
    dod4 fad mi fad

    %64
    fad re mi fad
    fad2 sol\tr \mbreak
    dod, re4 mi

    %67
    fad2 r
    r2 dod4 dod
    si dod fad fad

    %70
    fad2 mi4 dod
    si dod8 re mi4 re
    dod2 si4 re

    %73
    mi fad mi fad\mbreak
    fad2 dod
    R1

    %76
    r2 dod4 dod
    si dod fad fad
    fad2 mi4 dod

    %79
    si dod8 re mi4 re
    dod2 si4 re
    mi fad mi dod

    %82
    re2\fermata r

}

VIIIbcn = \relative do {

    r2
    R1
    r2 fad4 mi
    re dod si lad

    %4
    si2 mi4 fad
    sol2 mi
    fad sol4 fad

    %7
    mi re dod si\mbreak
    lad sold fad2
    R1

    %10
    r2 fad'4 mi
    re dod si lad
    si2 mi4 fad

    %13
    sol2 mi
    fad sol4 fad
    mi re mi fad

    %16
    si,4 la8 sol fad4 mi  %% fine ripresa OOKK
    re2 r\mbreak
    r re'4 mi

    %19
    fad sol la si
    la,2 la'
    mi r

    %22
    r mi4 fad
    sol la si do
    si,2 mi

    %25
    la,4 sol la si
    mi re dod! la
    re2 r

    %28
    r la'4 sol\mbreak
    fad mi re dod
    re2 sol4 la

    %31
    si2 sol
    la si4 la
    sol fad sol la

    %34
    re, dod si2
    R1
    r2 fad'4 mi

    %37
    re dod si lad
    si2 mi4 fad
    sol2 mi

    %40
    fad sol4 fad
    mi re dod si\mbreak
    lad sold fad2

    %43
    R1
    r2 fad'4 mi
    re dod si lad

    %46
    si2 mi4 fad
    sol2 mi
    fad sol4 fad

    %49
    mi re mi fad
    si, dod re mi\mbreak
    fad2 r

    %52
    r fad4 sold
    la si dod re
    dod2 fad,4 sold

    %55
    la2 fad
    sold la4 sold
    fad mi re dod

    %58
    si2 dod
    la si4 dod
    fad sold la2

    %61
    mi4 fad sol!2
    re4 mi fad sold
    la si dod lad

    %64
    si re dod lad
    si2 sol
    fad4 mi re dod

    %67
    si2 r
    r fad'4 mi
    re dod si lad

    %70
    si2 mi4 fad
    sol2 mi
    fad sol4 fad

    %73
    mi re dod si\mbreak
    lad sold fad2
    R1

    %76
    r2 fad'4 mi
    re dod si lad
    si2 mi4 fad

    %79
    sol2 mi
    fad sol4 fad
    mi re mi fad

    %82
    si,2\fermata r

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \key si\minor
    \tempo 1 = 50
    \partial 2 s2
    s1*82
    \bar"|."

}


VIIIvlI = {
    \global
    %\notypeset
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    \global
    <<\VIIIvlIIn \forma>>

}

VIIIvla = {
    \global
    \clef alto
    <<\VIIIvlan \forma>>

}

VIIIbc = {
    \global
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IXvlIn = \relative do'' {

    fad8. sol16 fad8
    sol8. fad16 mi8 si'8. fad16 sol8
    fad4. si8. fad16 sol8
    fad8. mi16 re8 mi8. re16 dod8

    %4
    re8. dod16 si8 re8. mi16 re8
    la8. si16 dod8 re8. mi16 re8
    la4.\mbreak mi'8. fad16 mi8

    %7
    si8. dod16 red8 mi8. fad16 mi8
    si4. sol'8. la16 sol8
    fad8. sol16 fad8 mi8. fad16 re8

    %10
    dod8. si16 la8 la'8. si16 la8
    la,4. sol'8. la16 sol8
    la,4. fad'8. sol16 fad8

    %13
    mi8. fad16 re8 la8. re16 dod8\mbreak
    re4. la8. si16 la8
    fad8. mi16 re8 re'8. mi16 re8

    %16
    dod8. si16 la8 mi'8. fad16 mi8
    red8. mi16 fad8 si,8. mi16 red8
    mi4. si'8. la16 si8

    %19
    sol8. fad16 sol8 mi8. re16 mi8
    dod8. re16 mi8 la8. sol16 la8\mbreak
    fad8. mi16 fad8 re8. dod16 re8

    %22
    si8. dod16 re8 sol8. la16 fad8
    mi8. fad16 re8 dod8.re16 si8
    lad4. fad'8. sol16 fad8

    %25
    sol8. fad16 mi8 si'8. fad16 sol8
    fad4. si8. fad16 sol8
    fad8. mi16 re8 mi8. re16 dod8\mbreak

    %28
    re8. dod16 si8 fad'8. sol16 fad8
    fad,4. mi'8. fad16 mi8
    fad,4. re'8. mi16 re8

    %31
    dod8. re16 si8 fad4 lad8
    si4.

}

IXvlIIn = \relative do'' {

    si4 si8
    si4 si8 si4 si8
    si4. si4 si8
    dod4 si8 si4 lad8

    %4
    si4 fad8 fad4 sol8
    la4 sol8 fad4 sol8\mbreak
    la4 fad8 sol4 la8

    %7
    si4 la8 sol4 la8
    si4 sol8 si4 la8
    la4 la8 si4 sol8

    %10
    la4. mi4 mi8
    mi4 mi8 mi4 mi8
    re4 re8 re'4 re8

    %13
    re4 si8\mbreak la4.
    la mi4 mi8
    re4 re8 la'4 fad8

    %16
    mi4 mi8 la4 la8
    fad4 fad8 sol4 fad8
    sol4. mi'4 red8

    %19
    mi4. si
    la la4 dod8\mbreak
    re4. la

    %22
    sol sol4 si8
    lad4 si8 sol4 mi8
    fad4. si4 si8

    %25
    si4 si8 si4 si8
    si4. si4 si8
    dod4 si8 si4 lad8

    %28
    si4. si4 re,8
    dod4 dod8 dod4 dod8
    si4 si8 si'4 si8

    %31
    si4 sol8 fad4.
    fad

}

IXvlan = \relative do' {

    fad4 fad8
    mi4 sol8 fad4 mi8
    red4. fad4 mi8
    fad4 fad8 sol4 fad8

    %4
    fad4 re8 re4 re8
    re4 mi8 la,4 sol8\mbreak
    re'4 fad8 mi4 mi8

    %7
    mi4 fad8 si,4 la8
    si4 mi8 mi4 mi8
    re4 re8 si4 re8

    %10
    mi4. dod4 dod8
    dod4 dod8 dod4 dod8
    fad4 fad8 la4 la8

    %13
    si4. mi,\mbreak
    fad la,4 dod8
    la4 la8 la4 la8

    %16
    la4 la8 la'4 do8
    si4 do8 si4 si8
    si4. si4 si8

    %19
    si4. mi,
    mi4 dod8 re4 sol8\mbreak
    la4. re,

    %22
    re4 si8 mi4 fad8
    sol4 fad8 mi4 sol8
    dod,4. si4 fad'8

    %25
    mi4 sol8 fad4 mi8
    red4. fad4 mi8
    fad4 fad8 sol4 fad8

    %28
    fad4 re8 si4 si8\mbreak
    lad4 lad8 lad4 lad8
    re4 re8 re4 re8

    %31
    sol4. dod,
    re

}

IXbcn = \relative do {

    red4 si8
    mi4 mi8 red4 mi8
    si4 si'8 red,4 mi8
    lad4 si8 mi,4 fad8

    %4
    si4 si,8 si'4 si8
    fad4 mi8 re4 mi8\mbreak
    fad4 re8 mi4 fad8

    %7
    sol4 fad8 mi4 fad8
    sol4 mi8 mi'4 dod8
    re4 re,8 sol4 si8

    %10
    la4. la,4 la8
    la8. si16 la8 la4 la8
    la8. si16 la8 la4 la8

    %13
    sol4. la\mbreak
    re, dod'4 la8
    re4 re8 fad4 re8

    %16
    la'4 la8 do4 la8
    si4 la8 si4 si,8
    mi4 fad8 sol4 fad8

    %19
    mi4. sol
    la4 sol8 fad4 mi8\mbreak
    re4. fad

    %22
    sol4 fad8 mi4 re8
    dod4 re8 mi4 dod8
    fad4 mi8 red4 si8

    %25
    mi4 mi8 red4 mi8
    si4 si'8 red,4 mi8
    lad4 si8 mi,4 fad8

    %28
    si4 si,8 re4 si8\mbreak
    fad'8. sol16 fad8 fad4 fad8
    fad8. sol16 fad8 fad4 fad8

    %31
    mi4. fad
    si,

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 6/8
    \key si\minor
    \tempo 2. = 60
    \partial 4. s4 s8
    s2.*13
    s4.  \bar ":..:" \break s
    s2.*17
    s4. \fermata
    \bar":|."

}


IXvlI = {
    \global
    %\notypeset
    <<\IXvlIn \forma>>

}

IXvlII = {
    \global
    <<\IXvlIIn \forma>>

}

IXvla = {
    \global
    \clef alto
    <<\IXvlan \forma>>

}

IXbc = {
    \global
    \clef bass
    <<\IXbcn \forma \IXbfn>>
    \typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
   title = \markup\smaller"Ouverture in Si minore [TWV 55:h3]"
   composer = \markup \center-column{"Telemann (1681 - 1767)"}
}

    \markup \huge {[1.] Ouverture}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \Ibc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[2.] La Prude}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \IIbc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[3.] Gavotte}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \IIIbc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

   % \pageBreak

    \markup \huge {[4.] Gigue}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \IVbc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[5.] Rigaudon}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \Vbc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

   % \pageBreak

   \pageBreak

    \markup \huge {[6.] Menuet 1. altern[ativement]}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \VIbc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

   % \pageBreak

    \markup \huge {[7.] [Menuet] 2. }

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \VIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \VIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \VIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \VIIbc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

   % \pageBreak

    \markup \huge {[8.] Rondeau }

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \VIIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \VIIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \VIIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \VIIIbc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                %\override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[9.] Canaries }

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IXvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon 2."}
                \set Staff.shortInstrumentName = "vl 2."
                \IXvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Taille"}
                \set Staff.shortInstrumentName = "vla"
                \IXvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basse"}
                \IXbc
                \set Staff.shortInstrumentName = "bc"
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner,base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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
