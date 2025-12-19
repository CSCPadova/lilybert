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

    la'4\upl fad8\upl re\upl
    la'4 fad8 re
    si'16 la sol si la sol fad mi

    %4
    fad(mi) re8 dod\upl re\upl
    la'4 fad8 re
    la'4 fad8 re

    %7
    si'16 la sol si la sol fad mi
    fad re la fad' mi sol fad mi
    fad re la fad' mi sol fad mi

    %10
    fad8.\tr(mi32 fad) sold8.\tr(fad32 sold)\mbreak
    la8 [mi la mi]
    la16 mi fad mi si' mi, fad mi

    %13
    dod' mi, fad mi sold4\tr
    la16 mi fad mi si' mi, fad mi
    dod'8 si16 dod re dod si la

    %16
    re dod si la si8.\tr(la32 si)
    dod8 si16 dod re dod si la
    re dod si la si4\tr

    %19
    la8\upl mi16 fad mi8 mi\mbreak %%% fine p. 2
    la8\upl mi16 fad mi8 mi
    dod mi16 fad mi8 mi

    %22
    la mi16 fad mi8 mi
    dod\upl\noBeam la'16[mi la mi la mi]
    dod8\upl mi16[dod mi dod mi dod]

    %25
    \stemUp <mi dod la>8_\upl[<mi dod la>_\upl <mi dod la>_\upl <mi dod la>_\upl]
    <mi dod la>4_\upl r\stemNeutral
    mi4\upl dod8\upl la\upl

    %28
    mi'4 dod8 la
    fad'16 mi re fad mi re dod si
    dod(si) la8 sold la\mbreak

    %31
    mi'4\upl dod8 la
    mi'4 dod8 la
    fad'16 mi re fad mi re dod si

    %34
    dod la mi dod' si re dod si
    dod la mi dod' si re dod si
    dod la re la mi' sol fad mi

    %37
    fad re la re mi sol fad mi
    fad re la fad' mi sol fad mi
    fad32(sol la8.) fad8\upl re\upl

    %40
    la'4 fad8 re
    si'16 la sol si la sol fad mi\mbreak
    fad32(sol la8.) fad8\upl re

    %43
    la'4\upl fad8 re
    si'16 la sol si la sol fad mi
    fad la sol fad sol la si dod

    %46
    re dod si la re dod si la
    si8\tr la4.
    re16 dod si la re dod si la

    %49
    sol8\tr fad4 mi16 fad
    sol fad mi re sol fad mi re
    sol fad mi re mi4\tr \mbreak

    %52
    fad8.\tr(mi32 fad) sol16 fad mi re
    sol fad mi re la'8.\tr(sol32 la)
    si8.\tr(la32 si) dod8.\tr(si32 dod)

    %55
    re16 la si la si sol fad mi
    la fad mi re mi4\tr
    fad16 la sol fad si sol fad mi

    %58
    la fad mi re mi4\tr
    re8\upl\noBeam la'16[fad la fad la fad]
    re8\upl\noBeam fad16[re fad re fad re]\mbreak

    %61
    la8\noBeam re16[la re la re la]
    <la fad re>8[<la fad re> <la fad re> <la fad re>]
    <la fad re>4 r_\fermata

}

IvlIIn = \relative do'' {

    la'4\upl fad8\upl re\upl
    la'4 fad8 re
    si'16 la sol si la sol fad mi

    %4
    fad(mi) re8 dod\upl re\upl
    la'4 fad8 re
    la'4 fad8 re

    %7
    si'16 la sol si la sol fad mi
    fad re la fad' mi sol fad mi
    fad re la fad' mi sol fad mi

    %10
    fad8.\tr(mi32 fad) sold8.\tr(fad32 sold)\mbreak
    la8 [mi la mi]
    la16 mi fad mi si' mi, fad mi

    %13
    dod' mi, fad mi sold4\tr
    la16 mi fad mi si' mi, fad mi
    dod'8 si16 dod re dod si la

    %16
    re dod si la si8.\tr(la32 si)
    dod8 si16 dod re dod si la
    re dod si la si4\tr

    %19
    la8\upl mi16 fad mi8 mi\mbreak %%% fine p. 2
    la8\upl mi16 fad mi8 mi
    dod mi16 fad mi8 mi

    %22
    la mi16 fad mi8 mi
    dod\upl\noBeam mi16[dod mi dod mi dod]
    la8\upl dod16[la dod la dod la]

    %25
    \stemUp <la mi dod>8\parenthesize _\upl[<la mi dod>\parenthesize _\upl <la mi dod>\parenthesize _\upl <la mi dod>\parenthesize _\upl]
    <la mi dod>4_\upl r\stemNeutral
    mi'4\upl dod8\upl la\upl

    %28
    mi'4 dod8 la
    fad'16 mi re fad mi re dod si
    dod(si) la8 sold la\mbreak

    %31
    mi'4\upl dod8 la
    mi'4 dod8 la
    fad'16 mi re fad mi re dod si

    %34
    dod la mi dod' si re dod si
    dod la mi dod' si re dod si
    dod la re la mi' sol fad mi

    %37
    fad re la re mi sol fad mi
    fad re la fad' mi sol fad mi
    fad32(sol la8.) fad8\upl re\upl

    %40
    la'4 fad8 re
    si'16 la sol si la sol fad mi\mbreak
    fad32(sol la8.) fad8\upl re

    %43
    la'4\upl fad8 re
    si'16 la sol si la sol fad mi
    fad la sol fad sol la si dod

    %46
    re dod si la re dod si la
    si8\tr la4.
    re16 dod si la re dod si la

    %49
    sol8\tr fad4 mi16 fad
    sol fad mi re sol fad mi re
    sol fad mi re mi4\tr \mbreak

    %52
    fad8.\tr(mi32 fad) sol16 fad mi re
    sol fad mi re la'8.\tr(sol32 la)
    si8.\tr(la32 si) dod8.\tr(si32 dod)

    %55
    re16 la si la si sol fad mi
    la fad mi re mi4\tr
    fad16 la sol fad si sol fad mi

    %58
    la fad mi re mi4\tr
    re8\upl\noBeam fad16[re fad re fad re]
    la8_\upl\noBeam re16[la re la re la]\mbreak

    %61
    fad8\noBeam la16[fad la fad la fad]
    <la fad re>8[<la fad re> <la fad re> <la fad re>]
    <la fad re>4 r\fermata

}

Ivlan = \relative do' {

    fad8 re la'4\upl
    fad8 re la'4\upl
    re, dod

    %4
    re8[la' sol fad]
    r4 la\upl
    fad8 re la'4\upl

    %7
    re, dod
    re dod
    re dod

    %10
    re8 la re si\mbreak
    mi dod mi dod
    mi la mi si'

    %13
    mi,4\prall mi\prall
    mi\prall mi\prall
    mi la

    %16
    fad sold\tr
    la la
    fad sold\tr

    %19
    \parenthesize la r\mbreak
    dod, si
    la la'

    %22
    dod si
    mi,8[la la la]
    mi[la, la la]

    %25
    la4 la
    la mi'
    dod8 la mi'4

    %28
    dod8 la mi'4
    la,8 la' sold4\tr
    la8[mi re dod]\mbreak

    %31
    si dod mi dod
    si dod mi4
    la,8 la' sold4\tr

    %34
    la\upl sold\tr
    la sold
    <<la\\{mi8]re]}>> dod la'

    %37
    la4 dod,
    re dod
    re\upl la'8 fad

    %40
    mi fad la4\upl
    re, dod\mbreak
    re8 fad la fad

    %43
    mi fad la fad
    re4 dod
    re si'8 sol

    %46
    fad[fad fad fad]
    sol fad4\tr mi16 re
    fad8[fad fad fad]

    %49
    si8\tr la4 la8
    re,4\prall re\prall
    re\prall dod\tr \mbreak

    %52
    re re
    re fad8 re
    re sol sol mi

    %55
    la fad re4\prall
    re\prall si8 dod
    re4\prall re\prall

    %58
    re\prall si8 dod
    re[re re re]
    fad,[re' re re]\mbreak

    %61
    re,[re' re re]
    re[re, re' re,]
    re'4\upl r\fermata

}

Ibcn = \relative do {

    re8\upl  re' re,[re']
    re, re' re,[fad]
    sol4\upl la\upl

    %4
    re,8\upl[fad mi re]
    re,[re' re, re']
    re,[re' re, fad']

    %7
    sol4\upl la\upl
    re, la
    re la

    %10
    re8 fad si, mi\mbreak
    dod la' dod, la'
    dod,4 sold'

    %13
    la8 mi si' mi,
    dod' mi, sold mi
    la4 fad

    %16
    re mi
    la fad
    re mi

    %19
    la,_\upl la'\mbreak
    la sold
    la dod

    %22
    la sold
    la8[la, la la]
    la[la la la]

    %25
    la4 la
    la8[la' mi dod]
    la la' la, la'

    %28
    la, la' la, dod
    re4 mi
    \once\stemUp la,8[dod' si la]

    %31
    sold[la la, la']
    sold[la la, dod]
    re4 mi

    %34
    la, mi'
    la, mi'
    la,8[si dod la]

    %37
    re4 la
    re la
    re8[re' re, re']

    %40
    dod re re, fad
    sol4 la\mbreak
    re,8 re' re, re'

    %43
    dod re re, fad
    sol4 la
    re,8 re, re' re,

    %46
    re' re, re' re,
    re' re, re' re,
    re' re, re' re,

    %49
    re' re, re' re,
    re' [re, re' re,]
    si'' sol mi la\mbreak

    %52
    re, re, re' re,
    re' re, re' fad
    sol si mi, la

    %55
    fad re' sol, re'
    fad, si sol la
    re, re' sol, re'

    %58
    fad,[si sol la]
    re,4 r
    re r\mbreak

    %61
    re8[re re re]
    re re, re' re,
    re'4\upl r\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*9
    s4 <6+>
    <6>2
    s4 <6>
    s <6+>
    <6> <6>
    s <6>
    s <_+>
    s <6>
    s <_+>
    s2*10
    s4 <_+>
    s2*3
    s4 <_+>
    s <_+>
    s <_+>

}

forma = {

    \time 2/4
    \key re\major
    \tempo 2 = 60
    s2*63
    \bar"||"
    \mark \markup \center-column{"Segue""subito"}

}



IvlI = {
    \global
    \notypeset
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

    r16 fad\f\upl
    fad?8\upl[r16 la] la8[r16 la,\p] la8[r16 la] la8[r16 la\f]
    <la fad do!>4 r r2

    %3
    r8 r16 sol' sol8[r16 sol,] sol4_\upl r\mbreak
    re2\f r
    r8 la''\p(sold\prall la) r2

    %6
    r4 r16 fad\f fad8\tr <mi si mi,>4 r
    r2 r8 r16 re re4
    r2 r8 r16 la la4

    %9
    r2 r8 r16 fa'? fa8[r16 si,]
    si4 r\mbreak r sold'
    la r r2

    %12
    r8 r16 do, do4 r8 r16 si si4
    r2\mbreak r8 r16 do\upl do8\upl[r16 mi]
    <mi do mi,>4_\upl r r2

    %15
    r r8 r16 <<{mi mi4}\\{sib16 sib4}>>
    r2\mbreak r4 la'_\markup\italic\center-align"più adag[io]"~
    la16(sol fa mi) fa(mi re dod) re(la si do?) <si fa sol,>4\f

    %18
    R1
    r4 re\f mi r\fermata

}

IIvlIIn = \relative do'' {

    r16 re\f\upl
    re8\upl[r16 fad] <<{fad8\upl[r16 fad,\p]}\\\once\stemUp \once\override Stem #'transparent = ##t la\\{\once\stemDown \once\override Stem #'transparent = ##t re,}>> fad8_\upl[r16 fad] fad8[r16 fad\f]
    <la fad? do!>4 r r2
    r8 r16 re re8[r16 re,] re4_\upl r\mbreak

    %4
    re2\f r
    r8 do'\p(si\prall la) r2
    r4 r16 red\f red8\tr <mi si mi,>4 r

    %7
    r2\mbreak r8 r16 sold, sold4
    r2 r8 r16 mi mi4
    r2 r8 r16 la la8[r16 sold]

    %10
    sold?4 r\mbreak r si
    do r r2
    r8 r16 la la4 r8 r16 fa fa4

    %13
    r2\mbreak r8 r16 mi mi8[r16 sol]
    sol4 r r2
    r r8 r16 sol sol4

    %16
    r2\mbreak r4 la'~
    la16(sol fa mi) fa(mi re dod) re(la si do?) <si fa sol,>4\f
    R1

    %19
    r4 si4\f do r\fermata

}

IIvlan = \relative do' {

    r16 la'\upl\f
    la8\upl[r16 re,] re8[r16 re\p] re8[r16 re] re8[r16 re\f]
    do!4 r r2
    r8 r16 sib sib8[r16 sib] sib4 r\mbreak

    %4
    re2 \f r
    mi4 r r2
    r4 r16 si\f si8 si4 r

    %7
    r2\mbreak r8 r16 si si4
    r2 r8 r16 dod dod4
    r2 r8 r16 re re8[r16 re]

    %10
    re4 r\mbreak r mi\f
    mi r r2
    r8 r16 fa fa4 r8 r16 re re4

    %13
    r2\mbreak r8 r16 do do8[r16 do]
    do4 r r2
    r r8 r16 do do4_\upl

    %16
    r2\mbreak fa,4 r
    r2 r4 fa'\f~
    fa fad\p sol2

    %19
    r4 sol\f sol r\fermata

}


IIvocen = \relative do'' {

    \autoBeamOff
    r8
    R1
    r4 la fad8 fad r16 fad fad sol
    sol8 sol r4 r sib\mbreak

    %4
    \grace la8 sold4 sold r8 sold sold la
    la la r4 la8 do la la16 sol
    \grace fad8 mi4 mi8 r r4 r8 mi

    %7
    sold sold r si\mbreak si re, r4
    sold8 sold16 la si8 mi, la la r la
    la mi fa sol fa fa r4

    %10
    r8 re' sold, la\mbreak la mi r4
    r r8 mi la8. la16 la8 sold
    la la r16 la si do si8 si r re

    %13
    fa,8. fa16 fa8 sol\mbreak mi4 r
    r8 mi sol fa sol sol do4
    do8 sol r16 sol sol sol mi8 mi r mi

    %16
    sol8. sol16 la8 sib\mbreak \grace sib?8 la4 r
    r2 r4 r8 fa
    si si r do do2

    %19
    sol4 r r2\fermata

}

IItesto = \lyricmode {

    Perdo - no ama - ta Nice, _ Per -- dono _ ama - ta Nice, _

    bella _ Nice _ per -- dono, _ a torto _ è vero _ dissi _ che_in -- fida _ sei, _

    de -- testo_i _ miei sospet - ti, i dubbi _ miei. _

    mai più della _  tua fede, _ della _  tua fede, _

    mai più non teme - rò. Per quei bei labbri _

    Io giuro, _ o mio teso - ro,

    in cui del mio de -- stin le leggi _ ado - ro.

}


IIbcn = \relative do {

    r16 re\upl
    re8\upl [r16 re] re8 [r16 re\p] re8 [r16 re] re8 [r16 re\f]
    do!4 r r2
    r8 r16 sib sib8[r16 sib] sib4 r\mbreak

    %4
    re2 ^\f r
    do4 r la r
    si r16 si la8\tr  sold4 r

    %7
    r2\mbreak r8 r16 si si4
    r2 r8 r16 dod dod4
    r2 r8 r16 re re8[r16 re]

    %10
    re4 r\mbreak r mi^\f
    la,4_\upl r r2
    r8 r16 fa' fa4 r8 r16 re re4

    %13
    r2\mbreak r8 r16 do do8[r16 do]
    do4 r r2
    r r8 r16 do do4_\upl

    %16
    r2\mbreak fa,4 r
    r2 r4 fa'^\f~
    fa fad^\p sol2

    %19
    r4 sol^\f do, r_\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s16 <_+>
    s1
    <6 4+>
    s8 s16 <6> s2 s4
    <6 4+>1
    <6>
    <6 4>4 s16 <_+> s8 <6>2
    s s8 s16 <6+> s4
    s2 s8 s16 <6> s4
    s2 s8 s16 <_-> s8 s16 <6 4+>
    s2 s4 <_+>
    s1
    s8 s16 <5>s4 s8 s16 <6> s4
    s1
    s
    s2 s8 s16 <7-> s4
    s1
    s2 s4 <6 4>
    s <5-> <6 4>2
    s4 <5 3>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 50
    \partial 8 s8
    s1*19
    \bar"||"

}



IIvlI = {
    \global
    \notypeset
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


IIvoce = {
    \new Voice = "perdono"
    \global
    <<\IIvocen \forma>>

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
    \senza
}

IIIvlIn = \relative do'' {

    sol'8
    do\noBeam~\tuplet 3/2 { do16(si la) sol[(fa sol)] la(sol fa) } \grace fa mi16. fa32 fa8\tr sol16(la) fa(re)
    \grace do16 si8\prall do sol'8~sol16.\tr la32 \grace sol8 fa8. sol16 mi8\tr do'
    mi,\tr re sol16 sol8 do16 fa,16.\prall re'32 fa,16.\prall re'32 mi,16.\prall do'32 mi,16.\prall do'32

    %4
    \grace mi,8 re8. sol16\p \grace sol8 fad8. do16 \grace do8 si8. sol16\f \grace sol8 fad8. do16
    si16.\tr la32 sol8 \tuplet 3/2 { r16 sol''\p(fa) mi[(re do)]\mbreak \grace mi re(do si) } \grace si do8\noBeam \tuplet 3/2 { fa16(mi re) } \grace re mi8\noBeam
    \tuplet 3/2 { re16 (do si) do[(re mi)] fa(mi re) mi[(fa sol)] } la,8. la'16 \grace la8 sol8. si,16

    %7
    \grace si8 do8. [\appoggiatura {fa32[sol]} la16] \tuplet 3/2 { sol(fa mi) re[(do si)] } do8 do'~\tuplet 3/2 { do16(si la)  la[(sol fad)]}
    \grace fad?8 sol8.\tr(la32 si) do(si la16) la32[(sol fad16)]\mbreak sol8 fa~\tuplet 3/2 {
        fa16(mi re) la'[(sol fa)]
        \grace fa mi(re mi) \grace sol fa[(mi re)]
    } \grace do re8.\tr do16 do'8\prall do\prall do32.\prall si64 la32.\prall sol64 fa32.\prall mi64 re32.\prall do64

    %10
    sol,4 re''8.\tr do16 do8\upl\noBeam sol16._\upl mi32_\upl do4_\upl
    r8 sol''\p do8~\tuplet 3/2 { do16(si la) sol[(fa mi)] re(do si) } do8. fa16\mbreak %%OK fine primo sistema p. 10
    \grace mi re8\prall do\upl r8 do'4 do si8\tr

    %13
    do mi,16.\prall(fa32) sol8\upl la re, re re re\upl
    r mi16.\prall fa32 sol8 do do si do[mi,]\mbreak
    mi re mi[do\upl] sol,^\f _\upl si'16._\prall do32 re8 sol\upl

    %16
    r fad16.\prall\p sol32 la8[la,] r8 sol'16.\prall la32 si8[si,]
    r la'16.\prall si32 do8 \once\stemUp la, r si'16.\prall do32 re8 re,
    mi mi, mi mi'\mbreak la,16((do) si(sol) fad8 sol\tr

    %19
    re'2 re,4\f r\fermata
    r8 fad' \tuplet 3/2 { sol16[(re do)] si(la sol) la[(sol fad)] } \grace fad sol8\noBeam \tuplet 3/2 { do16(si la) } \grace la si8\noBeam
    \tuplet 3/2 { la16(sol fad) sol[(la si)] do(si la) si[(do re)] } mi,8.mi'16 \grace mi re8. fad,16\mbreak

    %22
    \grace fad? sol8. si16\grace si la8. do16\tuplet 3/2 { si(la si) \grace re do[(si la)] } \grace sol16 fad8.\tr  sol16
    re'8.\tr(do32 re) \tuplet 3/2 { mi16(re do) si[(la sol)] } re4 fad\tr
    sol8 sol'\f ~\tuplet 3/2 { sol16(fad mi) mi[(re dod)] }\grace dod re8.\tr (mi32 fad) sol[(fad mi16)] mi32( re dod16)\mbreak

    %25
    re8 do!~\tuplet 3/2 { do16(si la) mi'[( re do)] si(la si) \grace re do[(si la)] } \grace sol la8.\tr sol16
    sol'8\prall sol\prall sol32.\prall fad64 mi32.\prall re64 do32.\prall si64 la32.\prall sol64 re8.\tr mi64(fad sol la) la8.\tr sol16
    sol8 sol,_\upl  r4 r8 sol''\p do4~\mbreak

    %28
    \tuplet 3/2 { do16(si la) sol[(fa mi)] } sol,8 do do\prall si \tuplet 3/2 {
        r16 re(do) si[(la sol)]
        r re'(do) si[(la sol)] r sol'(fa) mi[(re do)]
    } sol,8_\upl^\f \once\stemDown si'\tr\p \tuplet 3/2 {
        do16(sol fa) mi[(re do)]
        r do'(si) la[(sol fa)]
    } fa'4~\tuplet 3/2 { fa16(mi red) } mi16.\upl\f [mi,32] re8 re'?\p~

    %31
    \tuplet 3/2 { re16(do si) } do32[(mi sol16)] si,8\tr do\mbreak r sol'\noBeam sib32(la sol16) sol8\prall\noBeam
    r sol \noBeam sib32(la sol16) sol8\prall\noBeam r mi16.\prall(fa32) \once\stemDown sol8[\once\stemUp mi,_\upl]
    r fa' la32[(sol fa16)] fa8\prall r fa la32[(sol fa16)] fa8\prall

    %34
    r fa16.\tr (sol32) la8[la,\upl] r si16.\prall(do32) re8[la]\mbreak
    do, do'~\tuplet 3/2 { do16(si la) la[(sol fad)] } \grace fad sol8.\prall(la32 si) do32[(si la16)] la32(sol fad16)
    sol8 fa!~\tuplet 3/2 { fa16 re'(do) si[(la sol)] } mi16._\upl do'32 do8^\tr \tuplet 3/2 { \once\stemUp sol, 16 \slurUp re''(do) si[(la sol)] }\slurNeutral

    %37
    mi16. do'32 do8^\tr \tuplet 3/2 { \once\stemUp sol, 16 \slurUp sol''(fa) mi[(re do)] }\slurNeutral la8. la'16\grace la8 sol8. si,16
    do8.^\tr(si32 la) sol8 fa\tr  \grace fa mi8.[(\appoggiatura {fa32[sol]} la16) ]\grace la8 sol8. fa16
    mi16. do'32 do8\tr \once\stemUp sol, \once\stemDown si'\tr\mbreak \appoggiatura {do32[re]} mi8 re16.\prall do32 si16.\prall la32 sol16.\prall fa32

    %40
    mi8 do'\prall sol,4 r8 do''\f~\tuplet 3/2 { do16(si la) la[(sol fad)] }
    \grace fad?8 sol8.\tr(la32 si) do[(si la16)] la32(sol fad16) sol8 fa~\tuplet 3/2 {
        fa16(mi re) la'[(sol fa)]
        mi(re mi) \grace sol fa[(mi re)]
    } \grace do re8.\tr do16 \appoggiatura {mi32[fa]} sol8 fa16.\prall mi32 re16.\prall do32 si16.\prall la32

    %43
    \tuplet 3/2 { sol16\upl sol'-. fa-. mi-.[re-. do-.] } sol,16 \once\stemDown re''8.\tr do4 r8_\fermata mi,8\p\noBeam
    la16(do) si(la) sold(si)
    la(do) si(la) sold(si)

    %46
    la[(mi)] mi'(do) mi(do)
    si(mi,) mi'[(si) mi(si)]\mbreak
    do[(mi,)] mi'(do) la'(do,)

    %49
    si8\tr mi, sold
    <<la\upl\\\once\stemUp \once\override Stem #'transparent = ##t mi\\{\once\stemDown \once\override Stem #'transparent = ##t la,}>> do'16(la) mi'(do)
    fa8\noBeam\upl fa8.\tr(mi32 fa)

    %52
    do'8 si16(la) sol(fa)
    fa8\noBeam\upl fa8.\tr(mi32 fa)
    do'16.\prall si32 la16.\prall sol32 fad16.\prall mi32\mbreak

    %55
    si,8-\upl r16 si'(fad' si,)
    sol(mi') fad,[(mi')] fad,(red')
    <<mi8\upl\\\once\stemUp \once\override Stem #'transparent = ##t si\\{\once\stemDown \once\override Stem #'transparent = ##t mi,}>> si' [si]

    %58
    <<mi8\upl\\\once\stemUp \once\override Stem #'transparent = ##t do\\{\once\stemDown \once\override Stem #'transparent = ##t la}>> do [do]
    <<mi8\upl\\\once\stemUp \once\override Stem #'transparent = ##t si\\{\once\stemDown \once\override Stem #'transparent = ##t sol}>> si[mi]
    do\tr\noBeam~\tuplet 3/2 {
        do16(si la) si[(la sol)]

        %61
        la(sol fad) sol[(fad mi)] fad[(mi red)]
    }
    mi8_\upl mi'4~\mbreak
    mi8\prall mi\prall mi\prall

    %64
    mi16. re32 do16. si32 la16. sol32
    do16. si32 la16. sol32 fad16. mi32
    si8 r r

    %67
    r r _\fermata

}

IIIvlIIn = \relative do'' {


    sol'8
    do\noBeam~\tuplet 3/2 { do16(si la) sol[(fa sol)] la(sol fa) } \grace fa mi16. fa32 fa8\tr sol16(la) fa(re)
    \grace do16 si8\prall do sol'8~sol16.\tr la32 \grace sol8 fa8. sol16 mi8\tr do'
    mi,\tr re sol16 sol8 do16 fa,16.\prall re'32 fa,16.\prall re'32 mi,16.\prall do'32 mi,16.\prall do'32

    %4
    \grace mi,8 re8. sol16\p \grace sol8 fad8. do16 \grace do8 si8. sol16\f \grace sol8 fad8. do16
    si16.\tr la32 sol8 \tuplet 3/2 { r16 sol''\p(fa) mi[(re do)]\mbreak \grace mi re(do si) } \grace si do8\noBeam \tuplet 3/2 { fa16(mi re) } \grace re mi8\noBeam
    \tuplet 3/2 { re16 (do si) do[(re mi)] fa(mi re) mi[(fa sol)] } la,8. la'16 \grace la8 sol8. si,16

    %7
    \grace si8 do8. [\appoggiatura {fa32[sol]} la16] \tuplet 3/2 { sol(fa mi) re[(do si)] } do8 do'~\tuplet 3/2 { do16(si la)  la[(sol fad)]}
    \grace fad?8 sol8.\tr(la32 si) do(si la16) la32[(sol fad16)]\mbreak sol8 fa~\tuplet 3/2 {
        fa16(mi re) la'[(sol fa)]
        \grace fa mi(re mi) \grace sol fa[(mi re)]
    } \grace do re8.\tr do16 do'8\prall do\prall do32.\prall si64 la32.\prall sol64 fa32.\prall mi64 re32.\prall do64

    %10
    sol,4 re''8.\tr do16 do8\upl\noBeam sol16._\upl mi32_\upl do4_\upl
    r8 sol''\p do8~\tuplet 3/2 { do16(si la) sol[(fa mi)] re(do si) } do8. fa16\mbreak %%OK fine primo sistema p. 10
    \grace mi re8\prall do\upl r8 do'4 do si8\tr

    %13
    do mi,16.\prall(fa32) sol8 do, sol si si si
    r do16.\prall re32 mi8[mi] do do mi[do]\mbreak
    do si do[la\parenthesize \upl ] sol,_\upl^\f sol'16.\prall la32 si8 si\upl

    %16
    r8 re16.\p\prall mi32 fad8[fad,] r8 si16.\prall do32 re8[sol]
    r8 fad16.\prall sol32 la8[\once\stemUp fad,] r sol'16.\prall la32 si8[\once\stemUp sol,]
    sol8 sol la sol\mbreak re16(do') si(sol) fad8 sol\tr

    %19
    re'2 re,4\f r\fermata
    r8 fad' \tuplet 3/2 { sol16[(re do)] si(la sol) la[(sol fad)] } \grace fad sol8\noBeam \tuplet 3/2 { do16(si la) } \grace la si8\noBeam
    \tuplet 3/2 { la16(sol fad) sol[(la si)] do(si la) si[(do re)] } mi,8.mi'16 \grace mi re8. fad,16\mbreak

    %22
    \grace fad? sol8. si16\grace si la8. do16\tuplet 3/2 { si(la si) \grace re do[(si la)] } \grace sol16 fad8.\tr  sol16
    re'8.\tr(do32 re) \tuplet 3/2 { mi16(re do) si[(la sol)] } re4 fad\tr
    sol8 sol'\f ~\tuplet 3/2 { sol16(fad mi) mi[(re dod)] }\grace dod re8.\tr (mi32 fad) sol[(fad mi16)] mi32( re dod16)\mbreak

    %25
    re8 do!~\tuplet 3/2 { do16(si la) mi'[( re do)] si(la si) \grace re do[(si la)] } \grace sol la8.\tr sol16
    sol'8\prall sol\prall sol32.\prall fad64 mi32.\prall re64 do32.\prall si64 la32.\prall sol64 re8.\tr mi64(fad sol la) la8.\tr sol16
    sol8 sol,_\upl  r4 r8 sol''\p do4~\mbreak

    %28
    \tuplet 3/2 { do16(si la) sol[(fa mi)] } sol,8 do do\prall si \tuplet 3/2 {
        r16 re(do) si[(la sol)]
        r re'(do) si[(la sol)] r sol'(fa) mi[(re do)]
    } sol,8_\upl^\f \once\stemDown si'\tr\p \tuplet 3/2 {
        do16(sol fa) mi[(re do)]
        r do'(si) la[(sol fa)]
    } fa'4~\tuplet 3/2 { fa16(mi red) } mi16.\upl\f [mi,32] re8 re'?\p~

    %31
    \tuplet 3/2 { re16(do si) } do32[(mi sol16)] si,8\tr do\mbreak r sol'\noBeam sib32(la sol16) sol8\prall\noBeam
    r sol \noBeam sib32(la sol16) sol8\prall\noBeam r dod,16. \prall (re32) \once\stemDown mi8[dod,_\upl]
    r fa' la32[(sol fa16)] fa8\prall r fa la32[(sol fa16)] fa8\prall

    %34
    r la,_\upl mi'[fa\upl] r re16.\prall(mi32) \once\stemDown fa8[re,]\mbreak
    mi do' ~\tuplet 3/2 { do16(si la) la[(sol fad)] } \grace fad sol8.\prall(la32 si) do32[(si la16)] la32(sol fad16)
    sol8 fa!~\tuplet 3/2 { fa16 re'(do) si[(la sol)] } mi16._\upl do'32 do8^\tr \tuplet 3/2 { \once\stemUp sol, 16 \slurUp re''(do) si[(la sol)] }\slurNeutral

    %37
    mi16. do'32 do8^\tr \tuplet 3/2 { \once\stemUp sol, 16 \slurUp sol''(fa) mi[(re do)] }\slurNeutral la8. la'16\grace la8 sol8. si,16
    do8.^\tr(si32 la) sol8 fa\tr  \grace fa mi8.[(\appoggiatura {fa32[sol]} la16) ]\grace la8 sol8. fa16
    mi16. do'32 do8\tr \once\stemUp sol, \once\stemDown si'\tr\mbreak \appoggiatura {do32[re]} mi8 re16.\prall do32 si16.\prall la32 sol16.\prall fa32

    %40
    mi8 do'\prall sol,4 r8 do''\f~\tuplet 3/2 { do16(si la) la[(sol fad)] }
    \grace fad?8 sol8.\tr(la32 si) do[(si la16)] la32(sol fad16) sol8 fa~\tuplet 3/2 {
        fa16(mi re) la'[(sol fa)]
        mi(re mi) \grace sol fa[(mi re)]
    } \grace do re8.\tr do16 \appoggiatura {mi32[fa]} sol8 fa16.\prall mi32 re16.\prall do32 si16.\prall la32

    %43
    \tuplet 3/2 { sol16\upl sol'-. fa-. mi-.[re-. do-.] } sol,16 \once\stemDown re''8.\tr do4 r8_\fermata mi,8\p\noBeam
    la16(do) si(la) sold(si)
    la(do) si(la) sold(si)

    %46
    la[(mi)] mi'(do) mi(do)
    si(mi,) mi'[(si) mi(si)]\mbreak
    do[(mi,)] mi'(do) la'(do,)

    %49
    si8\tr mi, sold
    <<la\upl\\\once\stemUp \once\override Stem #'transparent = ##t mi\\{\once\stemDown \once\override Stem #'transparent = ##t la,}>> do'16(la) mi'(do)
    fa8\noBeam\upl fa8.\tr(mi32 fa)

    %52
    do'8 si16(la) sol(fa)
    fa8\noBeam\upl fa8.\tr(mi32 fa)
    do'16.\prall si32 la16.\prall sol32 fad16.\prall mi32\mbreak

    %55
    si,8-\upl r16 si'(fad' si,)
    sol(mi') fad,[(mi')] fad,(red')
    <<mi8\upl\\\once\stemUp \once\override Stem #'transparent = ##t si\\{\once\stemDown \once\override Stem #'transparent = ##t mi,}>> sol[sol]]

    %58
    <<mi'8\upl\\\once\stemUp \once\override Stem #'transparent = ##t do\\{\once\stemDown \once\override Stem #'transparent = ##t la}>> la [la]
    <<mi'8\upl\\\once\stemUp \once\override Stem #'transparent = ##t si\\{\once\stemDown \once\override Stem #'transparent = ##t sol}>> sol[si]
    do\tr\noBeam~\tuplet 3/2 {
        do16(si la) si[(la sol)]

        %61
        la(sol fad) sol[(fad mi)] fad[(mi red)]
    }
    mi8_\upl mi'4~\mbreak
    mi8\prall mi\prall mi\prall

    %64
    mi16. re32 do16. si32 la16. sol32
    do16. si32 la16. sol32 fad16. mi32
    si8 r r

    %67
    r r _\fermata

}

IIIvlan = \relative do' {

    r8
    fa fa mi[do] sol'[fa] <<mi\\{do[la']}>>
    sol mi do[do'] do[si] do do,
    do si do[do'] do[si] do do,

    %4
    si sol'\p do,[la'] sol re\f re[la]
    r si do mi\mbreak re mi si[do]
    re mi si[do] do fa re[sol]

    %7
    mi la si,[re] sol, sol' fad[la]
    re, si' do,[la']\mbreak re, do si[re]
    do do do[si] do la' sol[do,]

    %10
    <<{mi[mi] re}\\{do[do] si[sol']}>> mi4\upl r
    do8\p re mi[fa] do re mi[fa]\mbreak
    sol[mi\upl] r sol la la sol[sol]

    %13
    sol sol16.  fa32 mi8 la, sol sol sol sol
    r do do do re sol, do[fad,]  %%% fine p. 10
    sol sol'16. fa32 mi8 fad r8 re\f sol re

    %16
    r la'\p re,[re] r sol sol[sol,]
    r la' fad re r re sol si,
    do do do[dod]\mbreak re re re[re]

    %19
    re si' fad[sol] re re, r4_\fermata
    r8 re'16. do32 si8[sol] do si fad'[sol]
    do, si fad'[sol] sol, sol' fad[re]\mbreak

    %22
    si sol'~sol [fad\prall] sol mi re[la']
    sol si, do[mi] si si re[do]
    si re mi[mi]\mbreak la[fad]<<{s8 la}\\{si[mi,]}>>

    %25
    la sol fad[la] re, mi re[re]
    re mi re[mi] si sol' fad[re]
    si4_\upl r mi8\p re mi[fa]\mbreak

    %28
    sol mi mi[do] sol sol si[si]
    si si do[do] r re sol,[do]
    la la' la [la,] sol sol' fa[fa,]

    %31
    \once\stemUp mi sol' fa\prall mi\mbreak r dod re mi\upl
    r dod re mi r mi dod[la]
    r <<re\\{la mi'^\prall re^\upl}>>  r <<re\\{la mi'^\prall re}>>

    %34
    r re mi\prall re r re si[sol]\mbreak
    do mi fad[la,] re si mi[re\upl]
    re la re[sol] sol, sol' re[sol]

    %37
    sol, sol' re[mi]\mbreak do fa re[sol]
    mi mi <<{s8 re}\\{re[si]}>> r <<{s4 re8}\\{do[re si]}>>
    do la sol[sol']\mbreak sol la re,[re]

    %40
    do sol sol4 r8 sol'\f mi[re]
    re si' mi,[la] re, re si[re]
    do la' sol[si,]\mbreak do sol' la[re,]

    %43
    si do do[si\prall] <<mi4\upl\\do>> r8\fermata r8
    mi8\p fa mi
    mi fa mi

    %46
    do la' la
    sold si, sold'\mbreak
    la la, mi'

    %49
    fa si, si\upl
    r mi la
    la, la la

    %52
    la la la
    la la la
    la si do\mbreak

    %55
    r si red
    mi fad si,
    mi mi mi

    %58
    mi mi mi
    mi mi sol
    la la, sol'

    %61
    fad mi si
    do si la\mbreak
    sol' fad mi

    %64
    la, si do
    la si do
    si8 r r

    %67
    r r\fermata

}


IIIvocen = \relative do'' {

    \autoBeamOff

    r8
    R1*9
    r2 r4 r8 sol
    do8~\tuplet 3/2 { do16[(si la)] sol[(fa sol)] la[(sol fa)] } mi8[fa\tr] sol la\mbreak

    %12
    \grace do,16 si8 do do'4 re,8.[(mi32 fa)] mi8 re
    mi16.[fa32] sol4 \appoggiatura {la16[si]} do8 \grace do si8.[la16] \grace la8 sol8. fa16
    mi16.[re32] do8 sol'8.[(la16)] \grace sol8 fa8.[(sol16)] mi8 do'\mbreak

    %15
    mi,8\prall re sol \appoggiatura {la16[si]} do8 si16.\prall[la32] sol8 r sol
    la32[(sol fad16)] fad4 la8 la sol r si
    si la4 do8 do si r re

    %18
    mi,[mi']~\tuplet 3/2 { mi16[re do] si[la] sol } \mbreak fad8[sol\tr] la16[do si sol]
    fad16.\prall [la32 sol16.\prall si32] \tuplet 3/2 { la16[re do] si[la sol] } fad4.\tr mi8\fermata
    re4 r8 sol \tuplet 3/2 { la16[(sol fad)]} \grace fad sol8 \tuplet 3/2 { do16[(si la)] } \grace la si8

    %21
    \tuplet 3/2 { la16[(sol fad)] sol[(la si)] do[(si la)] si[(do re)] } mi,8. [mi'16] \grace mi re8. fad,16\mbreak
    \grace fad? sol8. si16 \grace si la8. do16 \tuplet 3/2 { si[(la si)] \grace re do[(si la)] } \grace sol la8.\tr sol16
    re'8.\tr[(do32 re)] \tuplet 3/2 { mi16[(re do)] si[(la sol)] } re4 la'\tr

    %24
    sol r r2\mbreak
    R1*2  %%% ultima battuta p. 12
    r4 r8 sol do~\tuplet 3/2 { do16[(si la)] sol[(fa sol)] la[(sol fa)] } \mbreak

    %28
    mi16.\prall[sol32] sol16.\prall[do32] do8. mi,16 re16.[fad32] \grace fad8 sol4 re'8
    \grace sol, fa?8. [sol16] mi8 do' mi, re r sol
    do8.[(la16)] fa8 do' si mi, re la'

    %31
    sol do, r sol'\mbreak sib32[(la sol16)] sol8 r sol
    sib32[la sol16] sol8 r sol sol4\tr mi'8 sol,
    fa16.\prall [mi32] re8 r fa la32[(sol fa16)] fa8 r fa

    %34
    la32[(sol fa16)] fa8 r fa fa4\tr re'8 fa,\mbreak
    mi[do']~\tuplet 3/2 { do16[(si la)] la[(sol fad)] } \grace fad8 sol8.\prall[(la32 si)] do32[(si la16)] la32[(sol fad16)]
    sol8 fa!4 re'8 mi,\prall do'\upl r re

    %37
    mi,\prall do'\upl r sol  \tuplet 3/2 { la16[(fa mi\prall)] fa[sol la] si\prall[sol fad] sol[la si] }
    do8.\tr[(si32 la)] sol8 fa \grace fa mi8. la16 \grace la8 sol8. fa16
    \tuplet 3/2 { mi[re mi] fa[mi re] } \grace do re8.\tr do16\mbreak mi'8 re16.\prall[do32] si16.\prall[la32] sol16.\prall [fa32]

    %40
    mi8[do'] \grace do,16 re8.\tr do16 do4 r
    R1*2
    r2 r4 r8_\fermata mi

    %44
    la16[(do)] si[(la)] sold[(si)]
    la[(do)] si[(la)] sold[(si)]
    la8 mi r16 do'

    %47
    si8\prall mi, re'\mbreak
    do16.\prall[si32] la8 r16 do
    si16.[la32] sold16.[fad32] mi16.[re32]

    %50
    do16.[si32] la8 r16 do'
    do8 si16[la] sol[fa?]
    fa16.\prall[mi32] fa8 r16 do'

    %53
    do8 si16[la] sol[fa]
    do'16.[si32] la16.[sol32] fad16.[mi32]\mbreak
    \grace mi8 red4 si'8~

    %56
    si \grace si8 la4\prall
    sol8 si32[(la sol16)] mi8\prall
    r16 la32[(si] do [si la16)] mi8\prall

    %59
    r16 sol32[(la] si[la sol16)] mi8\prall
    do'\tr ~\tuplet 3/2 {
        do16[(si la)] si[(la sol)]
        la[(sol fad)] sol[(fad mi)] fad[(mi red)]
    }

    %62
    mi8 mi mi\mbreak
    mi'4.~
    mi16.[re32 do16. si32 la16. sol32]

    %65
    do16.[si32] la16.[sol32] fad16.[mi32]
    mi8\fermata fad8.\tr mi16
    mi8 r\fermata

}

IIItesto = \lyricmode {

    Bei lab - - - bri che_a -- more _ formò _ per suo nido, _ formò _ per suo nido, _ non ho più ti -- more, _ più timo - re

    vi credo, _ mi fido. _  Bei labbri _ vi credo _  giura - ste d'a -- mar - - - - - - mi,

    mi ba - - - - - - - - sta co -- sì così _ mi ba - sta mi ba - - sta co -- sì.

    Bei lab - - - - bri che_a -- more _ for -- mò per suo nido, _ non ho più ti -- more, _ più ti -- more _

    vi credo, _ mi fido _ giura - ste d'a -- mar -- mi.

    Bei labbri _ mi fido _ giura - ste d'a -- mar - - - - - mi bei labbri _ giu -- raste _ mi ba - - - - sta

    così _ così _ mi ba - sta co -- sì mi ba - - sta co -- sì.

    Se torno_a _ lagnar - mi_a lagnar - mi che Nice _ m'of -- fenda _ che Nice _ m'of -- fenda _

    per me più non splenda _ non splenda _  la luce _ del dì no non splen - - - - - - - - - - - - da non splen - da

    la luce _ del dì.

}


IIIbcn = \relative do {

    r8
    do re mi[fa] do re mi[fa]
    sol la\upl mi[do'] re, sol do,[fad]
    sol sol16. fa?32 mi8 do re[sol] do, fad

    %4
    sol si^\p la[re,] sol sol,\f re'[re,]
    r sol'16. fa32 mi8[do]\mbreak fa mi re[do]
    fa mi re[do] fa fa, sol'[sol,]

    %7
    la' fa sol[fa] mi mib re[do]
    si! mi la,[re]\mbreak si la sol[si]
    do fa sol[sol,] la fa' mi[fa]

    %10
    sol sol, sol sol do4 r
    do8\p re mi[fa] do re mi[fa]\mbreak
    sol la r mi fa fa sol[sol,]

    %13
    do, do'16. re32 mi8 fad sol sol, sol[sol]
    r do do do re sol, do[fad,]  %%% fine p. 10
    sol sol'16. fa32 mi8 fad r sol\f sol sol,

    %16
    r re'^\p re re, r re' re re,
    r re' re re, r sol' sol, si
    do do do[dod]\mbreak re re re[re]

    %19
    re si' fad[sol] re re, r4_\fermata
    r8 re'16. do32 si8[sol] do si fad'[sol]
    do, si la[sol] do do re[re]\mbreak

    %22
    mi si do[re] sol do, re[do]
    si sol do[dod] re re, re[re']
    \once\stemUp sol, si'^\f mi,[la] fad si sol[la]\mbreak

    %25
    fad mi re[fad] sol do, re[do]
    si do si[do] re re, re[re']
    \once\stemUp sol,8._\upl la'16 sol16. fa32 mi16. re32 do8\p re mi[fa]\mbreak

    %28
    do do mi[fad] sol sol, sol[sol]
    sol sol sol[sol] r sol' mi do
    la la' la [la,] sol sol' fa[fa,]

    %31
    mi mi' re[do]\mbreak r mi re dod
    r mi re dod r la la la
    r re dod re r re dod re

    %34
    r re dod re r sol, sol sol\mbreak
    do la do[do] si mi do[re]
    si re si[sol] do mi si[sol]

    %37
    do mi si[do] fa fa, sol[sol']
    la la, si[sol] r do si sol
    do fa sol[sol,]\mbreak do fa sol[si,]

    %40
    do16. re32 mi16. fad32 sol8 sol, do\f mi la,[re]
    si mi do[re] si re sol,[si]
    do fa sol[mi]\mbreak mi do' fa,[fad]

    %43
    sol do, sol'[sol,] do4 r8 r
    la' re, mi
    do re mi

    %46
    la, do la
    mi' sold mi\mbreak
    la, do la

    %49
    re mi mi,
    r la la
    la la la

    %52
    la la la
    la la la
    la si do\mbreak

    %55
    r si red
    mi fad si,
    mi mi mi

    %58
    mi mi mi
    mi mi sol
    la la, sol'

    %61
    fad mi si
    do si la\mbreak
    sol' fad mi

    %64
    la, si do
    la si do
    si4.\fermata

    %67
    mi,8 r_\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4 <6> s8 <6> <6>4
    s <6> <7>8 <7> s4
    <6 4>8 <5> s4 <7>8 <7> s <5->
    s <6> <7> <_+> s4 <_+>
    s <6> <6 4>8 <6> <6>4
    <6 4>8 <6> <6>4 s2
    s <6>4 <_+>8 <6 4+>
    <6>4 s8 <_+> <6> <6!> <7>4
    s2 s4 <6>
    <6 4> <5> s2
    s4 <6> s8 <6> <6>4
    s s8 <6> <6 5>4 <6 4>8 <5>
    s4 <6> s2
    s <7>8 <7> s <5->s1
    s8 <_+> s4 s8 <6 4> s4
    s8 <_+> <7>4 s2
    s4 <6>8 <5-> <_+> <6 4> <_+> <6 4>
    <_+> <6> <6>4 <_+> s
    s8 <_+> <6>4 <6 4+>8 <6> <5->4
    <6 4+>8 <6> <6+>4 s <_+>
    <5>8 <6> <6 5> <_+> s4 <_+>8 <6 4>
    <6>2 <6 4>4 <_+>
    s8 <6> <7> <_+><6> s <6 5> <_+>
    <6>8 <6!> <7 _+> s s4 <_+>8 <6 4+>
    <6>2 <6 4>4 <_+>
    s2 s4 <6>
    s1
    <7>4 <6 4> s <6>
    <7>8 <6>s4 <7>8 <6> <6>4
    <7>8 <6> <6>4 s8 <6+> s4
    s8 <6+> s4 s8 <7 _+> s4  %%%%%% fin qui OK bar 32
    s1
    s2 s8 < 5 7>  s4
    s <_+>8 <6 4+> <6>4 <6 5>8 <_+>
    <6> <_-> <5->4s8 <6> <6>4
    s8 <6> <6>4 s2
    s1
    s4 <4>8 <3> s4 s8 <6>
    s2 s4 s8 <_+>
    <6>4 <6 5>8 <_+> <6> <_-> <5>4
    s2 <6>4 <6>
    s1
    s4 <_+>8
    <6> s <_+>
    s4.
    <_+>8 s <7>
    s4.
    <6 5>8 <_+> s
    s4.
    <6>
    s
    s
    s8 <_+> <6>
    s <_+> <6>
    s <7> <7 _+>
    s4.
    <6 4>
    <_!>
    s4 <6>8
    <6+>4 <_+>8
    s4.
    <6>
    s
    s
    <6 4>8 <5 3+>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 60
    \partial 8 s8
    s1*42
    s2 s4 s8
    \bar"||"\break
    s8
    \mark\markup\huge "[4.] Andantino"
    \time 3/8
    \tempo 4 = 55
    s4.*23
    s4
    \bar"||"
    \mark\markup "D.C."

}


IIIvlI = {
    \global
    \notypeset
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


IIIvoce = {
    \new Voice = "labbri"
    \global
    \clef violin
    <<\IIIvocen \forma>>

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    r8 r16 la' la8[r16 la,] <<la4\\\shiftOn\stemUp mi\\\shiftOnn\stemUp dod_\upl>> r8 r16 fa'\upl
    fa8\upl[r16 fa,]  fa4_\upl r r8 r16 sol'
    sol8[r16 sol,] sol4_\upl r2

    %4
    r8 r16 la' la8[r16 do,] \mbreak do4\upl r
    R1
    r4 do reb r

    %7
    r8 r16 mi! mi4\mbreak r2
    r8 r16 <<{fa fa8\noBeam}\\{do16 do8[r16 re]}>> re4\upl r
    r8 re16.\p\prall(mib32) fa8[fa,] r2

    %10
    r8 r16 mib' mib8\upl[r16 sol]\mbreak sol4 r
    r8 r16 fa fa4 r2
    R1

    %13
    r8 r16 sol sol8[r16 sib,]\mbreak sib4 r
    r2 r8 r16 do do8\upl[r16 reb]
    reb?4 r r2

    %16
    r4 sol8.\p^\markup\italic"Adag[io]"(lab16)\mbreak sib4 r
    r sol4\f lab\upl r8 r16 do,
    do8[r16 do] do4\upl r2

    %19
    r8 r16 fad fad8\upl[r16 la?] la4\upl r8 r16 re,\mbreak
    re4 r r8 r16 re re8 [r16 sol]
    sol4\upl r r2

    %22
    sol,,4\f r r8 r16 mib'' mib8[r16 do]\mbreak
    do4 r r8 r16 fa fa8[r16 lab,]
    lab?4 r r8  r16 <<{sib sib4}\\{sol16 sol4}>>

    %25
    r2 r4 do\f\mbreak
    re8\upl r16 fa32(re) <<{sib8\noBeam r16 \stemDown re32(sib)}\\sib4\upl>> fa_\upl r
    r8 r16 sib64\f(la sol fa) mi!8\upl r16 sol64(fa mi re) do4\upl r

    %28
    r2 r8 r16 do'64\f(sib la sol) fa8_\upl\noBeam r16 sol64(fa mi re)\mbreak
    dod4 r8 r16 mi64(re dod si) la4 r8 r16 fa''
    fa8\upl[r16 la] la4 r r8 r16 do,,

    %31
    do8[r16 sib_\upl] sib8_\upl r16 re64(do sib la) sol4_\upl r
    si!4\f r\mbreak r sol
    r8 r16 re'64(do si la) sol4_\upl r8 r16 si' <<si4\\\stemUp\shiftOn fa\\\stemUp\shiftOnn sol,>>

    %34
    r2 r8 do'16\p(mi) mi(sol) sol(mi)
    re4 r r2\mbreak
    r8 r16 mi mi8\upl[r16 red] red4\upl r8 r16 <<fad\\red>>

    %37
    <<fad?8\\{red?[r16 fad,]}>> fad4_\upl r red'
    mi r r2
    r8 r16 la, <<la4\\\shiftOn\stemUp mi\\\shiftOnn\stemUp dod>>\mbreak r2

    %40
    r8 r16 la' <<la4\\\shiftOn\stemUp fad\\\shiftOnn\stemUp re>> r2
    r8 r16 si' <<si4\\\shiftOn\stemUp re,\\\shiftOnn\stemUp sol,>> r dod'
    re r r2\fermata

}

IVvlIIn = \relative do'' {

    r8 r16 mi mi8[r16 mi,] mi4_\upl r8 r16 re'
    re8[r16 re,] re4 _\upl r r8 r16 mi'
    mi8[r16do,] do4 r2

    %4
    r8 r16 fa' <fa la, re>8\upl[r16 la,] la4_\upl r
    R1
    r4 la sib r

    %7
    r8 r16 <<{sib sib4}\\{sol16 sol4}>>\mbreak r2
    r8 r16 lab lab8[r16 sol] sol4_\upl r
    r8 si!16.\prall\p(do32) re8[re,] r2

    %10
    r8 r16 do' do8\upl[r16 mib]\mbreak mib4 r
    r8 r16 sib sib4 r2
    R1

    %13
    r8 r16 sib sib8[r16 sol]\mbreak sol4 r
    r2 r8 r16 lab lab8[r16 mi!]
    mi4 r r2

    %16
    r4 mi'8.\p(fa16)\mbreak sol4 r
    r mi\f fa\upl r8 r16 lab,
    lab?8[r16 la] la4_\upl r2

    %19
    r8 r16 re re8\upl[r16 fad] fad4\upl r8 r16 la,\mbreak
    la4 r r8 r16 sib sib8[r16 re]
    re4\upl r r2

    %22
    sol,,4\f r r8 r16 sib' sib8[r16 mib,]\mbreak
    mib?4 r r8 r16 re' re8[r16 fa,]
    fa4 r r8 r16 mib mib4

    %25
    r2 r4 la\f\mbreak
    sib8 r16 re32 (sib) fa8_\upl\noBeam r16 sib32(fa) re4_\upl r
    r8 r16 sib'64\f(la sol fa) mi!8\upl r16 sol64(fa mi re) do4\upl r

    %28
    r2 r8 r16 do'64\f(sib la sol) fa8_\upl\noBeam r16 sol64(fa mi re)\mbreak
    dod4 r8 r16 mi64(re dod si) la4 r8 r16 re'
    re8\upl[r16 fad] fad4 r r8 r16 do,

    %31
    do8[r16 sib_\upl] sib8_\upl r16 re64(do sib la) sol4_\upl r
    si!4\f r\mbreak r sol
    r8 r16 re'64(do si la) sol4_\upl r8 r16 si' <<si4\\\stemUp\shiftOn fa\\\stemUp\shiftOnn sol,>>

    %34
    r2 r8 sol'16\p(do) do(mi) mi(do)
    sold4 r r2\mbreak
    r8 r16 la <<{la8[r16 la] la4}\\{s8 s16 fad fad4}>> r8 r16 si

    %37
    si8\upl[r16 do] do4\upl r fad,
    sol r r2
    r8 r16 mi mi4\mbreak r2

    %40
    r8 r16 fad fad4 r2
    r8 r16 sol sol4_\upl r mi
    fad r r2\fermata

}

IVvlan = \relative do' {

    r8 r16 dod dod8[r16 dod] dod4 r8 r16 la
    la8[r16 sib] sib4 r r8 r16 do?
    do8[r16 mi] mi4\upl r2

    %4
    r8 r16 do do8[r16 do]\mbreak do4 r
    R1
    r4 fa fa r

    %7
    r8 r16 do do4\mbreak r2
    r8 r16 do do8[r16 sol] sol4_\upl r
    r8 re'\p si!4 r2

    %10
    r8 r16 sol' sol8[r16 do,]\mbreak do4 r
    r8 r16 re re4 r2
    R1

    %13
    r8 r16 mib mib8[r16 mib]\mbreak mib4 r
    r2 r8 r16 mib mib8[r16 sold]
    sold?4 r r2

    %16
    mi!4\p r\mbreak r2
    r4 do\f do\upl r8 r16 fa
    fa8[r16 do] do4 r2

    %19
    r8 r16 la' la8[r16 re,] re4 r8 r16 fad\mbreak
    fad?4 r r8 r16 sol sol8[r16 re]
    re4\upl r r2

    %22
    sol,4\f r r8 r16 sol' sol8[r16 la,]\mbreak
    la4 r r8 r16 sib sib8[r16 re]
    re4 r r8 r16 sib sib4

    %25
    r2 r4 fa'\f\mbreak
    fa8[r16 re] re8[r16 sib] sib4 r
    r8 r16 sib'64\f(la sol fa) mi!8\upl r16 sol64(fa mi re) do4\upl r

    %28
    r2 la4 r8 r16 sol'64(fa mi re)\mbreak
    dod4 r8 r16 mi64(re dod si) la4 r8 r16 la'
    la8\upl[r16 la] la4 r r8 r16 do,

    %31
    do8[r16 sib] sib4 r2
    si!4\f r\mbreak r sol
    r8 r16 re'64(do si la) sol4_\upl r8 r16 re' re4

    %34
    r2 r8 do\p do do
    si4 r r2\mbreak
    r8 r16 do do8[r16 si] si4 r8 r16 fad'

    %37
    fad8[r16 red] red4\upl r si
    si r r2
    r8 r16 la la4\mbreak r2

    %40
    r8 r16 la la4 r2
    r8 r16 re re4\upl r la'
    <<la\\fad>> r4 r2\fermata

}


IVvocen = \relative do'' {

    \autoBeamOff

    r2 r8 la fa fa
    r2 sib8 la16 sib sol8 sol
    r4 r8 do do8. sol16 sol8 la

    %4
    fa fa r4\mbreak  r la
    la8 fa la la do la16 la la8 la16 sib
    fa4 r r  sib8 sib16 sib

    %7
    sib8 mi,! r sol16 fa\mbreak sol4 r8 sib16 lab
    fa8 fa r4 r sol8 sol16 fad
    sol8 sol r4 re8 mib fa fa16 sol

    %10
    mib8 mib r4\mbreak r8 mib fa sol
    fa fa r4 sib8. sib16 sib8 fa16 sol
    lab8 lab r sib sib8. fa16 fa8 sol

    %13
    mib4 r\mbreak r16 sol sib lab sib8 sib
    sib? reb sol, sol16 lab lab8 lab r4
    r sib8 sib r reb mi,! mi16 fa

    %16
    sol8 sol r4\mbreak r8 sol \appoggiatura {sol16. [lab32]} sib8. lab16
    fa8 fa r4 r lab
    r2 la!4. la16 do

    %19
    do8 fad, r4 r la\mbreak
    r4 re8 la16 sib sol4 r
    r8 re re re sol sol16 fad sol8 sol

    %22
    r sib16 la sol8 sol16 fa mib4 r\mbreak
    r8 do' do mib, re re r4
    r8 lab' sib fa sol sol r4

    %25
    sib8 mib la,! la16 sib fa4 r\mbreak
    r2 r4 fa8 fa16 sib
    sib?8 mi,! r4 r8 mi sol4

    %28
    r8 sol sib la fa fa r4\mbreak
    r8 la la mi r la fa fa
    r2 do'8. fad,16 fad4

    %31
    r2 r8 re sol4
    r8 re sol fad\mbreak sol8 sol r si!
    sol sol r sol si si r4

    %34
    re8 fa, fa fa16 mi do4 r
    r8 re'16[(si)] \grace la8 sold4 r8 sold si mi,\mbreak
    la la r4 r8 la la red,

    %37
    r4 r16 do' la sol mi8 mi r4
    r sol2 sol8 si
    la la r la\mbreak la mi sol fad

    %40
    re re r re' re la si do
    si4 r16 si dod re re8 la r4
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IVtesto = \lyricmode {

    Son reo, _ non mi difen - do, puni - scimi _ se vuoi. _ Pur qualche _ scusa _

    meri - ta_il mio _ timor. _ Tirsi _ t'a -- dora, _ io lo so, tu lo sai. _ Seco_in _ dispar - te

    ragio - nando _ ti trovo: _ al venir _ mio _ tu vermi - glia diven - ti, ei palli - do si fa, confu - si_en -- trambi _

    mendi - cate _ gl'accen - ti, egli _ furti - vo ti guarda _ e tu sorri - di. Ah, ah quel sorri - so

    so so che vuol dir: la prima _ volta _ appun - to ch'io d'amor _ ti parlai _ così_ar - rossis - ti, così_ar - rossis - ti,

    sorri - desti _ così. _ Nice _ cru -- dele, _ sì, sì, tu mi tradi - sci, infi - da, ingra - ta,

    barba - ra. Ahimé! _ Giurai _ fi -- darmi _  giu -- rai _ ed ecco _  torno _ a dubi - tar. Pietà _ pietà _ mio bene _

    son folle, _ in -- van giu -- rai. _ Ma pen -- sa_al fine _ che_A -- mor mi ren -- de_in -- sano, _

    che_il primo _ non son io che giu -- ra_in -- vano. _

}


IVbcn = \relative do {

    r8 r16 dod dod8[r16 dod] dod4 r8 r16 re
    re8[r16 sib] sib4 r r8 r16 do
    do8[r16 mi!] mi4 r2

    %4
    r8 r16 fa fa8[r16 mib]\mbreak mib4 r
    R1
    r4 fa8. mib16 reb4 r

    %7
    r8 r16 do do4 r2
    r8 r16 fa fa8[r16 si,!] si4_\upl r
    r8 sol\p sol4 r2

    %10
    r8 r16 do\f do8[r16 do]\mbreak do4 r
    r8 r16 re re4 r2
    R1

    %13
    r8 r16 mib mib8[r16 reb]\mbreak reb?4 r
    r2 r8 r16 do do8[r16 sib]
    sib?4 r r2

    %16
    sib4\p r\mbreak r2
    r4 do fa, r8 r16 fa'
    fa8[r16 mib] mib4 r2

    %19
    r8 r16 re re8[r16 re] re4\upl r8 r16 fad\mbreak
    fad?4 r r8 r16 sol sol8[r16 sib,]
    sib?4_\upl r r2

    %22
    sol4\f r r8 r16 sol sol8[r16 lad]\mbreak
    lad?4 r r8 r16 sib\f sib8[r16 sib]
    sib?4\p r r8 r16 mib mib4

    %25
    r2 r4 fa\f\mbreak
    sib,8[r16 sib] sib8[r16 sib] sib4 r
    r8 r16 sib'64\f(la sol fa) mi!8\upl r16 sol64(fa mi re) do4\upl r

    %28
    r2 fa4\f\upl r8 r16 sol64(fa mi re)\mbreak
    dod4 r8 r16 mi64(re dod si) la4 r8 r16 re
    re8[r16 do] do4 r r8 r16 do

    %31
    do8[r16 sib] sib4 r2
    si!4\f r\mbreak r sol
    r8 r16 re'64(do si la) sol4_\upl r8 r16 sol sol4

    %34
    r2 r8 do_\upl^\p_\markup\italic"Adag[io]" do_\upl do_\upl
    si4 r r2\mbreak
    r8 r16 do do8[r16 si] si4 r8 r16 si

    %37
    si8[r16 la] la4 r si
    mi r r2
    r8 r16 dod dod4\mbreak r2

    %40
    r8 r16 re re4 r2
    r8 r16 sol sol4 r la
    re, r r2\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8 s16 <6> s4 s2
    s2 s4 s8 s16 <_!>
    s8. <6>16 s4 s2
    s4 s8. <6 4>16 s2
    s1
    s4 <_!> <6> s
    s8. <7- _!>16 s4 s2
    s8. <_->16 s8. <6>16 s2
    s8 <7 _!> s4 s2
    s8. <_->16 s4 s2
    s8. <6->16 s4 s2
    s1
    s4 s8. <6 4>16 s2
    s2 s8. <6->16 s8. <_- 6 4!>16
    s1
    <6 4!>2 s
    s4 <_!> <_-> s8 s16 <_->
    s8. <6 4!>16 s4 s2
    s8. <_+>16 s4 s s8. <6>16
    s2 s8. <_->16 s8. <6>16
    s1
    <_->2 s8. <6->16 s8. <6->16
   s2 s4 s8. <7->16
    s1
    s2 s4 <_!>
    s1
    s8. <6 4!>16 s4 <_-> s
    s2 <_!>
    s2 <_+>4 s8. <_->16
    s8. <6 4+ _->16 s2 s8. <6 4+>16
     s8. <6>16  s4 s2
     <6>4 s s <_!>
     s8 s16 <6 4> s4 s8. <7>16 s4
     s1
     <6+>2 s
     s8. <6>16 s8. <7 _+>16 s4 s8. <_+>16
     s8. <6 4+ _->16 s2 <_+>4s1
     s8. <6>16 s4 s2
     s8. <_+>16 s4 s2
     s s4 <_+>
     <_+>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 77
    s1*42
    \bar "||"

}



IVvlI = {
    \global
    \notypeset
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


IVvoce = {
    \new Voice = "reo"
    \global
    \clef violin
    <<\IVvocen \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>
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
    \senza
}

VvlIn = \relative do'' {

    la'8 re, si'
    la re, dod
    re\upl re8.\tr[(dod32 re)]

    %4
    <mi dod la>8\upl\noBeam la,16_\upl sol fad mi
    fad32(sol la16) re,8[si']
    la re, dod

    %7
    re_\upl\noBeam re8.\tr(dod32 re)
    \tuplet 3/2 {
        la16(si la) dod[(si dod)] mi(fad mi)
        la(si la) dod[(re dod)] mi(fad mi)
    }

    %10
    la8 \grace la sol4\tr \mbreak
    <<fad8\\\stemUp\once \override Stem.transparent = ##t la, \\\stemDown re,_\upl>> \tuplet 3/2 { re''16[(dod si)] la(sol fad) }
    mi8\tr\noBeam \tuplet 3/2 { dod'16(si la) sold[(fad mi)] }

    %13
    re8\tr \noBeam \tuplet 3/2 {
        si'16\upl la(sold) fad[(mi re)]
        dod\upl mi dod la\upl[mi' dod] la\upl mi' dod
        sol mi' dod sol[mi' dod] sol mi' sol,

        %16
        fad(sol fad) sol[(la sol)] la(si la)
        si(dod si) dod[(re dod)]
    } re8\upl\noBeam
    sol \grace fad8 mi4\tr \mbreak

    %19 OK
    \tuplet 3/2 {
        fad16(mi fad) sol[fad sol] la sol la
        si la si dod [si dod]
    } re8\noBeam
    la,_\upl mi'8.\tr [re16]

    %22
    re8_\upl fad,_\upl la_\upl
    re,_\upl r si''\p
    la re, dod

    %25
    re\upl re4\tr
    <mi dod la>8\upl \noBeam la,16\f[sol fad mi]
    re8_\upl r si''\p\mbreak

    %28
    la re, dod
    re\noBeam  re,8.\tr(dod32 re)
    \tuplet 3/2 {la16\f[(si la)] dod(re dod) mi[(fad mi)] }

    %31
    <mi' dod la>8\upl \noBeam r r
    dod8\p re mi
    \tuplet 3/2 { re16(mi re) fad[(sol fad)] } lad8\tr

    %34
    si r r
    red, mi fad
    si,16-.(si-. si-. si-. si-. si-.)\mbreak

    %37
    dod mi-. (mi-. mi-. mi-. mi-.)
    mi-. (mi-. mi-. mi-. mi-. mi-.)
    fad-. (fad-. fad-. fad-. fad-. fad-.)

    %40
    re-. (re-. re-. re-. re-. re-.)
    mi-. (mi-. mi-. mi-. mi-. mi-.)
    dod-.(dod-. dod-. dod-. dod-. dod-.)

    %43
    re-. (re-. re-. re-. re-. re-.)
    si-.(si-. si-. si-. si-. si-.)
    \tuplet 3/2 { dod,16(re dod) re[(mi re)] mi(fad mi)\mbreak }

    %46
    fad8_\upl sold4\tr
    \tuplet 3/2 { la16(sold la) si[(la si)] dod(si dod) }
    re8 sold, la

    %49
    mi sold4\tr
    \tuplet 3/2 { la16(sold la) si[(la si)] dod[(si dod)] }
    re8 sold, la

    %52
    mi sold4\tr
    la8_\upl\tuplet 3/2 { la'16\f[(sold fad)] mi re dod\mbreak }
    si8\tr\noBeam \tuplet 3/2 { sold'16(fad mi) red[(dod si)] }

    %55
    la8\tr\noBeam \tuplet 3/2 {
        fad'16 mi red dod[si la]
        sold\upl mi' si sold\upl[mi' si] sold\upl mi' si
        sold\upl mi' si sold\upl[mi' si] sold\upl mi' sold,
        la(sold la) si[(la si)] dod(si dod)
    }

    %59
    re8 \grace dod8 si4\tr
    \tuplet 3/2 {
        dod16(si dod) re[(dod re)] mi(re mi)\mbreak
        fad(mi fad) sold[(fad sold)]
    } la8\noBeam\upl

    %62
    la,16. si32 si8.\tr[la16]
    la8\upl r la'\p~
    la re,[si']

    %65
    la fad16(sol) la(si)
    la8 re, dod
    re\tr \noBeam la16\f_\upl sol_\upl fad mi

    %68
    <la fad re>8_\upl re\p[si']\mbreak
    la8 fad16(sol) la(si)
    la8 re, dod

    %71
    re dod\upl r32 la(si dod)
    re16-.(re-. re-. re-. re-. re-.)
    do-.(do-. do-. do-. do-. do-.)

    %74
    do-.(do-. do-. do-. do-. do-.)
    si(si') sol(mi) fad,[(red')]
    mi-.(sol-. sol-. sol-. sol-. sol-.)\mbreak

    %77
    sol-.(-. sol-. sol-. sol-. sol-. sol-.)
    sol sol,-.(sol-. sol-. sol-. sol-.)
    <la fad re>\upl la'-.(la-. la-. la-. la-.)

    %80
    sol-.(sol-. sol-. sol-. sol-. sol-.)
    sol-.(sol-. sol-. sol-. sol-. sol-.)
    sol(mi) fad(la) fad(red)

    %83
    mi-.(mi-. mi-. mi-. mi-. mi-.)
    mi-.(mi-. mi-. mi-. mi-. mi-.)
    mi(dod) re-.(re-. re-. re-.)\mbreak

    %86
    re,(re') re,(re') re,(re')
    re,(re') re,(re') re,(re')
    re,(re') mi4\tr

    %89
    re8 dod si
    la \grace la sol4\tr
    \tuplet 3/2 { fad16(mi fad) sol [(fad sol)] la(sol la) }

    %92
    si8\prall dod\prall re
    sol, \grace fad mi4\tr \mbreak
    \tuplet 3/2 {
        fad16\f(mi fad) sol[(fad sol)] la(sol la)
        si(la si)
    } dod8\upl[re]
    si32(la sol16) \grace fad8 mi4\tr
    re8_\upl\noBeam  \tuplet 3/2 { re''16\f(dod si) la[(sol fad)] }

    %98
    mi8\prall\noBeam \tuplet 3/2 { dod'16(si la) sold[fad mi] }
    re8\prall\noBeam \tuplet 3/2 {
        si'16 la sold fad[mi re]
        dod\upl mi dod la[mi' dod] la mi' dod
        sol mi' dod sol[mi' dod] sol mi' sol,
        fad(mi fad) sol[(fad sol)] la(sol la)
        si( la si) dod[(si dod)]
    } re8\upl

    %104
    sol \grace fad8 mi4\tr
    \tuplet 3/2 {
        fad16(mi fad) sol[(fad sol)] la (sol la)
        si (la si) dod [(si dod)]
    } re8\upl\noBeam

    %107
    la,_\upl mi'8.\tr [re16]
    re8\upl r r\fermata
    la'8\p(re,) sib'

    %110
    la8 fa16(sol) la(sib)\mbreak
    la8 re, dod
    re\upl re4\tr

    %113
    <mi dod la>8\upl r32 dod\f(re mi) mi8\tr \noBeam
    fa16(la) fa(do?) fa(do)
    la8\p fa re'

    %116
    do\noBeam la16(sib) do(re)
    do8 fa, mi
    fa fa'4\tr

    %119
    <<{mi8\noBeam mi16 s mi s}\\{\once \override Stem.transparent = ##t <do mi,>8_\upl\noBeam do16\f sol do sol}>>
    mi8_\upl\p mi16 mi mi mi
    sol8 sol16 sol sol sol

    %122
    do8 \grace do sib4\tr
    la16(do) fa(la) dod,8\tr \noBeam
    re fad,16 fad fad fad

    %125
    la8 la16 la la la
    re8 \grace re do?4\tr
    si8 do\upl r\fermata

    %128
    sol'16\f(do) sol(mi) do(sol)
    sol'\p-.(sol-. sol-. sol-. sol-. sol-.)\mbreak
    sol-.(sol-. sol-. sol-. sol-. sol-.)

    %131
    fad(red) fad(si) fad(red)
    si-.(si-. si-. si-. si-. si-.)
    mi(dod) mi(la) mi(dod)

    %134
    la-.(la-. la-. la-. la-. la-.)
    \tuplet 3/2 { sol(la sol) la[(si la)] si(do si)}
    do8 fad, sol

    %137
    re la'4\tr\mbreak
    \tuplet 3/2 { si16(la si) do[(si do)] re(do re) }
    mi8 fad, sol

    %140
    re_\upl fad4\tr
    sol8 r r\fermata

}

VvlIIn = \relative do'' {

    la'8 re, si'
    la re, dod
    re\upl re8.\tr[(dod32 re)]

    %4
    <mi dod la>8\upl\noBeam la,16_\upl sol fad mi
    fad32(sol la16) re,8[si']
    la re, dod

    %7
    re_\upl\noBeam re8.\tr(dod32 re)
    \tuplet 3/2 {
        la16(si la) dod[(si dod)] mi(fad mi)
        la(si la) dod[(re dod)] mi(fad mi)
    }

    %10
    la8 \grace la sol4\tr \mbreak
    <<fad8\\\stemUp\once \override Stem.transparent = ##t la, \\\stemDown re,_\upl>> \tuplet 3/2 { re''16[(dod si)] la(sol fad) }
    mi8\tr\noBeam \tuplet 3/2 { dod'16(si la) sold[(fad mi)] }

    %13
    re8\tr \noBeam \tuplet 3/2 {
        si'16\upl la(sold) fad[(mi re)]
        dod\upl mi dod la\upl[mi' dod] la\upl mi' dod
        sol mi' dod sol[mi' dod] sol mi' sol,

        %16
        fad(sol fad) sol[(la sol)] la(si la)
        si(dod si) dod[(re dod)]
    } re8\upl\noBeam
    sol \grace fad8 mi4\tr \mbreak

    %19 OK
    \tuplet 3/2 {
        fad16(mi fad) sol[fad sol] la sol la
        si la si dod [si dod]
    } re8\noBeam
    la,_\upl mi'8.\tr [re16]

    %22
    re8_\upl fad,_\upl la_\upl
    re,_\upl r si''\p
    la re, dod

    %25
    re\upl re4\tr
    <mi dod la>8\upl \noBeam la,16\f[sol fad mi]
    re8_\upl r si''\p\mbreak

    %28
    la re, dod
    re\noBeam  re,8.\tr(dod32 re)
    \tuplet 3/2 {la16\f[(si la)] dod(re dod) mi[(fad mi)] }

    %31
    <mi' dod la>8\upl \noBeam r r
    dod8\p re mi
    \tuplet 3/2 { re16(mi re) fad[(sol fad)] } lad8\tr

    %34
    si r r
    si, \grace si la4\tr
    sold16-.(sold-. sold-. sold-. sold-. sold-.)\mbreak

    %37
    la-.(la-. la-. la-. la-. la-.)
    dod-.(dod-. dod-. dod-. dod-. dod-.)
    re la-. (la-. la-. la-. la-.)

    %40
    si-.(si-. si-. si-. si-. si-.)
    sold-.(sold-. sold-. sold-. sold-. sold-.)
    la-.(la-. la-. la-. la-. la-.)

    %43
    fad-. (fad-. fad-. fad-. fad-. fad-.)
    sold-.(sold-. sold-. sold-. sold-. sold-.)
    \tuplet 3/2 { dod,16(re dod) re[(mi re)] mi(fad mi)\mbreak }

    %46
    fad8_\upl sold4\tr
    \tuplet 3/2 { la16(sold la) si[(la si)] dod(si dod) }
    re8 sold, la

    %49
    mi sold4\tr
    \tuplet 3/2 { la16(sold la) si[(la si)] dod[(si dod)] }
    re8 sold, la

    %52
    mi sold4\tr
    la8_\upl\tuplet 3/2 { la'16\f[(sold fad)] mi re dod\mbreak }
    si8\tr\noBeam \tuplet 3/2 { sold'16(fad mi) red[(dod si)] }

    %55
    la8\tr\noBeam \tuplet 3/2 {
        fad'16 mi red dod[si la]
        sold\upl mi' si sold\upl[mi' si] sold\upl mi' si
        sold\upl mi' si sold\upl[mi' si] sold\upl mi' sold,
        la(sold la) si[(la si)] dod(si dod)
    }

    %59
    re8 \grace dod8 si4\tr
    \tuplet 3/2 {
        dod16(si dod) re[(dod re)] mi(re mi)\mbreak
        fad(mi fad) sold[(fad sold)]
    } la8\noBeam\upl

    %62
    la,16. si32 si8.\tr[la16]
    la8\upl r la'\p~
    la re,[si']

    %65
    la fad16(sol) la(si)
    la8 re, dod
    re\tr \noBeam la16\f_\upl sol_\upl fad mi

    %68
    <la fad re>8_\upl re\p[si']\mbreak
    la8 fad16(sol) la(si)
    la8 re, dod

    %71
    re dod\upl r32 la(si dod)
    re16 la-. (la-. la-. la-. la-.)
    la-.(la-. la-. la-. la-. la-.)

    %74
    <<{la-.[(la-. la-. la-. la-. la-.)]}\\{fad-[fad fad fad fad fad]}>>
    sol(si') sol(mi) fad,[(red')]
    mi si-.(si-. si-. si-. si-.)\mbreak

    %77
    si-.(si-. si-. si-. si-. si-.)
    mi-.(mi-. mi-. mi-. mi-. mi-.)
    <la, fad re>_\upl fad'-.(fad-. fad-. mi-. mi-.)

    %80
    re-.(re-. re-. re-. re-. re-.)
    re-.(re-. re-. re-. re-. re-.)
    dod-.(dod-. dod-. la'-. fad-. red-.)

    %83
    mi si-.(si-. si-. si-. si-.)
    si-.(si-. si-. si-. si-. si-.)
    la-.(la-. la-. la-. la-. la-.)\mbreak

    %86
    sol-.(-. sol-. sol-. sol-. sol-. sol-.)
    la-.(la-. la-. la-. la-. la-.)
    si8 dod4\tr

    %89
    re8 dod si
    la \grace la sol4\tr
    \tuplet 3/2 { fad16(mi fad) sol [(fad sol)] la(sol la) }

    %92
    si8\prall dod\prall re
    sol, \grace fad mi4\tr \mbreak
    \tuplet 3/2 {
        fad16\f(mi fad) sol[(fad sol)] la(sol la)
        si(la si)
    } dod8\upl[re]

    %96
    re,8 dod4\tr
    re8_\upl\noBeam  \tuplet 3/2 { re''16\f(dod si) la[(sol fad)] }
    mi8\prall\noBeam \tuplet 3/2 { dod'16(si la) sold[fad mi] }

    %99
    re8\prall\noBeam \tuplet 3/2 {
        si'16 la sold fad[mi re]
        dod\upl mi dod la[mi' dod] la mi' dod
        sol mi' dod sol[mi' dod] sol mi' sol,
        fad(mi fad) sol[(fad sol)] la(sol la)
        si( la si) dod[(si dod)]
    } re8\upl

    %104
    sol \grace fad8 mi4\tr
    \tuplet 3/2 {
        fad16(mi fad) sol[(fad sol)] la (sol la)
        si (la si) dod [(si dod)]
    } re8\upl\noBeam

    %107
    la,_\upl mi'8.\tr [re16]
    re8\upl r r\fermata
    fa\p(la,) sol'

    %110
    fa re16(mi) fa(sol)\mbreak
    fa8[la,] dod
    re\upl re4\tr

    %113
    <mi dod la>8\upl r32 dod\f(re mi) mi8\tr \noBeam
    fa16(la) fa(do?) fa(do)
    la8\p fa re'

    %116
    do\noBeam la16(sib) do(re)
    do8 fa, mi
    fa fa'4\tr

    %119
    <<{mi8}\\{\once \override Stem.transparent = ##t <do mi,>8_\upl}>> sol16\f[mi sol mi]
    do8_\upl\p do16 do do do\mbreak
    mi8 mi16 mi mi mi

    %122
    do'8 \grace do sib4\tr
    la16(do) fa(la) dod,8\tr\noBeam
    re re,16 re re re

    %125
    fad8 fad16 fad fad fad
    re'8 \grace re do4\tr
    si8 do\upl r\fermata

    %128
    do16\f(sol') mi(do) sol[(mi)]
    do'\p-. (do-. do-. do-. do-. do-.)\mbreak
    mi-.(mi-. mi-. mi-. dod-. dod-.)

    %131
    fad,(si) red(fad) red(si)
    sold-.(sold-. sold-. sold-. sold-. sold-.)
    la(mi) dod'[(mi) dod(la)]

    %134
    fad-.(fad-. fad-. fad-. fad-. fad-.)
    \tuplet 3/2 { sol(la sol) la[(si la)] si(do si)}
    do8 fad, sol

    %137
    re la'4\tr\mbreak
    \tuplet 3/2 { si16(la si) do[(si do)] re(do re) }
    mi8 fad, sol

    %140
    re_\upl fad4\tr
    sol8 r r\fermata

}

Vvlan = \relative do' {

    fad16. sol32 la8 sol
    fad la la
    fad la fad

    %4
    mi\noBeam la16 sol fad mi
    re8\upl la' re,
    re la la'

    %7
    fad la, la
    la r r
    dod mi la

    %10
    dod, re mi\mbreak
    re si' si
    dod, la' la

    %13
    si, sold' sold
    la, dod dod
    <<{mi mi mi}\\{dod dod dod}>>

    %16
    re mi fad
    sol la si
    mi, \grace re dod4\tr \mbreak

    %19
    re8 mi fad
    sol la si
    re, dod la'

    %22
    fad\upl r r
    fad16.\p sol32 la8 sol
    fad la la

    %25
    fad la, la
    la\noBeam la'16\f sol fad mi
    fad16.\p (sol32) la8 sol

    %28
    fad la la
    fad la, la
    la\f[dod] mi

    %31
    dod r r
    mi re dod
    la fad' mi

    %34
    red\upl r r
    fad mi red
    mi mi, re'\mbreak

    %37
    dod-.(dod-. dod-.)
    la-.(la-. la-.)
    re-.(re-. re-.)

    %40
    sold-.(sold-. sold-.)
    dod,-.(dod-. dod-.)
    fad-.(fad-. fad-.)

    %43
    si,-.(si-. si-.)
    mi-.(mi-. mi-.)
    la, si dod\mbreak

    %46
    la re si
    mi mi mi
    re si la

    %49
    la' mi4
    mi8 re dod
    fad si, la

    %52
    la' mi re
    dod fad\f fad\mbreak
    sold, mi' mi

    %55
    mi red red
    mi si si
    si si si

    %58
    mi mi mi
    fad sold4\tr
    la8 re, la'\mbreak

    %61
    la mi dod
    mi mi re
    dod\upl r r

    %64
    fad16.\p (sol32) la8 sol
    fad re16(mi) fad(sol)
    fad8 la mi

    %67
    fad dod\upl r
    fad16. (sol32) la8 sol
    fad re16(mi) fad(sol)

    %70
    fad8 la mi
    fad la mi
    fad fad fad

    %73
    mi mi mi
    red red red
    r mi si

    %76
    mi, mi' mi\mbreak
    re re re
    dod dod dod

    %79
    r re dod
    si si si
    si si si

    %82
    la  la la
    sol sol sol
    sol' sol sol

    %85
    fad fad fad\mbreak
    si, si si
    fad' fad fad

    %88
    sol mi la
    fad mi re
    dod si dod

    %91
    re mi fad
    sol mi fad
    mi \grace re dod4\tr \mbreak

    %94
    re8 mi fad
    sol mi re
    si la sol

    %97
    fad\upl fad'\f si
    dod, la' la
    si, sold' sold

    %100
    <<{s8 mi[mi]
      mi mi mi}\\{la dod, dod
    dod dod dod}>>\mbreak
    re mi fad

    %103
    sol mi re
    mi \grace re dod4\tr
    la'8 sol fad

    %106
    re la' fad
    re dod la'
    fad r r\fermata

    %109
    re16.\p mi32 fa8 dod
    re re, re'\mbreak
    re fa la

    %112
    sib fa re
    la mi'\f sol
    la la la

    %115
    fa do sib
    la\noBeam fa'16(sol) la(sib)
    la8 do, do

    %118
    la do do
    do\f do16 do do do
    do8\p r r\mbreak

    %121
    do do16 do do do
    mi8 fa sol
    r la sol

    %124
    fad\upl r r
    re re16 re re re
    fad8 sol la

    %127
    re, mi\upl r\fermata
    mi\f mi mi
    mi\p mi mi\mbreak

    %130
    mi mi mi
    red red red
    re! re re

    %133
    dod dod dod
    do! do do
    re re re

    %136
    la' la sol
    sol fad4\tr \mbreak
    sol8 do, sol'

    %139
    sol [re] si
    sol' re[do]
    si_\upl r r\fermata

}


Vvocen = \relative do'' {

    \autoBeamOff

    R4.*22
    la8 re, si'
    la[re,] dod

    %25
    re4.
    mi8 r r
    la re, si'\mbreak

    %28
    la [re,] dod
    re4.
    mi8 r r

    %31
    mi fad sold
    la\grace la sol!4
    fad16.\prall[mi32] fad8 r

    %34
    fad sold la
    si\grace si la4
    sold16.[fad32] sold8 r\mbreak

    %37
    la8. si16 la8
    dod[la] mi
    fad4 re'8~

    %40
    re16.[dod32 si16.\prall la32] sold16.\prall[fad32]
    mi4\tr dod'8~
    dod16.[si32 la16.\prall sold32] fad16.\prall[mi32]

    %43
    re4\tr si'8~
    si16.[la32] sold16.\prall [fad32 mi16.\prall re32]
    \tuplet 3/2 { dod16[(re dod)] re[(mi re)] mi[(fad mi)]\mbreak }

    %46
    fad8_\upl sold4\tr
    \tuplet 3/2 { la16[(sold la)] si[(la si)] dod[(si dod) ]}
    re8 [sold,] la

    %49
    mi si'4\tr
    \tuplet 3/2 { la16[(sold la)] si[(la si)] dod[(si dod)] }
    re8 [sold,] la

    %52
    mi si'4\tr
    la8 r r\mbreak
    R4.*9

    %63
    r8 r la~
    la re, si'
    la fad16[sol] la[si]

    %66
    la8[re,] dod
    re\prall mi\upl r
    la re, si'\mbreak

    %69
    la fad16[sol] la[si]
    la8[re,] dod
    re\prall mi\upl r

    %72
    la fad16[sol] la8
    la fad16[sol] la[si]
    do8[si] la

    %75
    sol16.[fad32] sol8 r
    sol mi16[fad] sol8\mbreak
    sol mi16[fad] sol[la]

    %78
    si8[la] sol
    fad16.[mi32] fad8 r
    sol8. la16 sol8

    %81
    re'[si] sol
    sol\prall[fad_\upl] r
    mi8. fad16 mi8

    %84
    si'[sol] mi
    mi[re16. mi32] fad[mi re16]\mbreak
    sol8\upl re16.[mi32] fad[mi re16]

    %87
    la'8\upl re,16.[mi32] fad[mi re16]
    si'8 dod4\tr
    re8 dod si

    %90
    la\grace la sol4\tr
    \tuplet 3/2 { fad16[(mi fad)] sol [(fad sol)] la[(sol la)] }
    si8\prall [dod\prall] re

    %93
    sol, \grace fad mi4\tr \mbreak
    \tuplet 3/2 {
        fad16[(mi fad)] sol[(fad sol)] la[(sol la)]
        si[(la si)]
    } dod8\upl re

    %96
    si32[la sol16] \grace fad8 mi4\tr
    re8 r r
    R4.*10

    %108
    R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}
    la'8 re, sib'
    la fa16[sol] la[sib]\mbreak

    %111
    la8[re,] dod
    re4.
    mi8 r r

    %114
    r r do'~
    do fa, re'
    do la16[sib] do[re]

    %117
    do8[fa,] mi
    fa4.
    sol8 r r

    %120
    do, mi sol\mbreak
    do, mi sol
    do\grace do sib4

    %123
    la16.[sol32] la8 r
    re, fad la
    re, fad la

    %126
    re \grace re do4
    si8 do\upl r\fermata
    R4.

    %129
    do8. re16 do8\mbreak
    do[si] lad
    \grace lad? si4.\tr

    %132
    \tuplet 3/2 { si?16[re do] si[re do] si[la sold] }
    la4.\tr
    \tuplet 3/2 { la16[do si] la[do si] la[sol? fad]

    %135
    sol[(la sol)] la[(si la)] si[(do si)]}
    do8 fad, sol
    re la'4\tr\mbreak

    %138
    \tuplet 3/2 { si16[(la si)] do[(si do)] re[(do re)]}
    mi8 fad, sol
    re la'4\tr

    %141
    sol8 r r\fermata

}

Vtesto = \lyricmode {

    Giu -- ra_il noc -- chier che_al mare _ non preste - rà più fe -- de, ma se tranquil - lo_il vede _

    ma se tranquil - lo_il vede _  torna _ di nuovo _ al mar - - - - - - - - - - - - - - - - di nuo -- vo_al mar - - -

    di nuo -- vo_al mar.

    Giu -- ra_il noc -- chier il noc -- chier che_al mare _ no no non preste - - rà più fe -- de, ma se tranquil - lo

    tranquil - lo_il vede _ ma se tran -- quillo _ tranquil - lo_il vede _ torna _ di nuo -- vo_al mar

    torna _ di nuo -- vo_al mar - - - - - - - - - torna _ di nuo -- vo_al mar - - - di nuo -- vo_al mar  - - - - di nuo -- vo_al mar.

    Di non trattar _ non trat -- tar più l'ar -- mi giu -- ra_il guer -- rier il guerrier _ talvol - ta, ma se

    una tromba _ una trom -- ba_a -- scolta _ ma se una tromba _ una trom -- ba_a -- scolta _

    più non si può frenar - - - - - - - - - - - - non si può fre -- nar - - - non si può frenar. _

}


Vbcn = \relative do {

    re16. mi32 fad8 sol
    re fad la
    si fad re

    %4
    la la'16[sol fad mi]
    re16. mi32 fad8 sol
    re fad la

    %7
    si fad re
    la r r
    la'\upl mi dod

    %10
    la_\upl si dod\mbreak
    re si' si
    dod, la' la

    %13
    si, sold' sold
    la, la la
    la la la

    %16
    re mi fad
    sol la si
    mi, la16 sol fad mi\mbreak

    %19
    re8 mi fad
    sol la si
    fad16. sol32 la8 la,

    %22
    re, r r
    re'16.\p mi32 fad8 sol
    re fad la

    %25
    si fad re
    la_\upl la'16[sol fad mi]
    re16. mi32 fad8 sol

    %28
    re fad la
    si fad re
    la\f[dod] mi

    %31
    la, r r
    la\p si dod
    re re, do'

    %34
    si r r
    si dod? red
    mi mi, re'\mbreak

    %37
    dod-.(dod-. dod-.)
    la-.(la-. la-.)
    re-.(re-. re-.)

    %40
    sold-.(sold-. sold-.)
    dod,-.(dod-. dod-.)
    fad-.(fad-. fad-.)

    %43
    si,-.(si-. si-.)
    mi-.(mi-. mi-.)
    la, si dod\mbreak

    %46
    re si mi\noBeam
    dod sold' la
    si mi, fad

    %49
    dod16. re32 mi8 re
    dod\f si la
    re mi fad

    %52
    dod16. re32 mi8 mi,
    la fad'\f fad\mbreak
    sold, mi' mi

    %55
    fad, si si
    mi, mi' mi
    re re re

    %58
    dod sold' la
    re, mi16[re dod si]
    la8 si dod\mbreak

    %61
    re mi fad
    dod16. re32 mi8 mi,
    la_\upl la'16\p[sol fad mi]

    %64
    re16. mi32 fad8 sol
    re re, re'
    re fad la

    %67
    re, la'16[sol fad mi]
    re16. mi32 fad8 sol\mbreak
    re re, re'

    %70
    re fad la
    re, la' sol
    fad fad fad

    %73
    mi mi mi
    red red red
    r mi si

    %76
    mi, mi' mi\mbreak
    re re re
    dod dod dod

    %79
    r re dod
    si si si
    si si si

    %82
    la  la la
    sol sol sol
    sol' sol sol

    %85
    fad fad fad\mbreak
    si, si si
    fad' fad fad

    %88
    sol mi la
    fad mi re
    dod si dod

    %91
    re mi fad
    sol la fad
    sol la la,\mbreak

    %94
    re\f mi fad
    sol la fad
    sol la la,

    %97
    re si'\f si
    dod, la' la
    si, sold' sold

    %100
    la, la la
    la la la\mbreak
    re mi fad

    %103
    sol la fad
    mi la16 sol fad mi
    re8 mi fad

    %106
    sol la si
    fad16. sol32 la8 la,
    re\upl r r\fermata

    %109
    re16.\p mi32 fa8 dod
    re re, re'\mbreak
    re fa la

    %112
    sib fa re
    la16. sib'32\f la8[sol]
    fa fa, fa'\p

    %115
    fa16. sol32 la8 sib
    fa fa, fa'
    fa la, do

    %118
    re la fa
    do'\f do16 do do do
    do8_\upl r r\mbreak

    %121
    do r r
    do re mi
    r fa mi

    %124
    re r r
    re r r
    re mi fad

    %127
    sol mi r_\fermata
    mi\f mi mi
    mi\p mi mi\mbreak

    %130
    mi mi mi
    red red red
    re! re re

    %133
    dod dod dod
    do! do do
    si fad' sol

    %136
    la re, mi
    si16. do32 re8[re,]\mbreak
    sol la si

    %139
    do re mi
    si16. do32 re8[re,]
    sol r r\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*14
    <7>4.
    s4.*9
    s8 <6> s
    s4.*2
    s8 <6>4
    s8 <6>4
    s8 <6> <_+>
    s4.*2
    s4 <6+>8
    <_+>4.
    s
    <_+>4 <6 4+>8
    <6>4.
    s4.*6
    <7 _+>4.
    s
    s8 <6+> <_+>
    <6> <6> s
    <7 > <_+> s
    <6> <_+> s
    <6> <6+> s
    s <_+> s
    <6> <_+> s
    s4.*2
    s8 <_+> s
    <_+>4.
    <6 4+>
    <6>8 <6> s
    s <_+> s
    s <6+> <6>
    s <_+> s
    <6> <_+> s
    s4.*7
    s8 <6> s
    s s <6 4>
    <6>4.
    <6- 4>
    <7->8 <6> <5>
    s s <_+>
    s4.
    <6 4>
    <7>8 <6> <5>
    s4.
    <6>
    s <7>8 <6> s
    <6>4.
    s
    <7>8 <6> s
    <6>4.
    <6>
    s8 <6>4
    <6>8 <6> <6>
    <6>4.
    s4.*3
    s8 <6> <6>
    s s <6>
    s4.*5
    <7>4.
    s4.*7
    s4 <7>8
    s4.
    s4 <_+>8
    s4.
    <_+>4 <6>8
    <5>4.
    s
    s
    s8 <6>4
    s4.*5
    s4 <6+>8
    <_+>4.
    <_+>
    s
    <_!>8 <6> s
    <6>4.
    < 6>
    <6>8 <5> <6 4+>
    <6>4.
    <6 4+>
    <6>
    <6 4+>
    <6>8 <6> <_!>
    s <_+> s
    <6> <_+> s
    <_!> <6+> <6>
    s <_+> s
    <6>8 <_+> s
    <_!>

}

forma = {

    \time 3/8
    \key re\major
    \tempo 4 = 77
    s4.*108
    \bar"||"\break
    \key re\minor
    s4.*33
    \bar "||"
    \mark \markup {"D.C."}

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


Vvoce = {
    \new Voice = "mare"
    \global
    \clef violin
    <<\Vvocen \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>
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

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup{Cantata ”Perdono amata Nice” - La Gelosia}
    composer = \markup \center-column{"N. Porpora (1686-1768)"}

}

\markup \huge {[1.] All[egr]o}

\score {

    \new ChoirStaff <<

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""primo]"}
            \IvlI
        >>

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""secondo]"}
            \IvlII
        >>

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
            \Ivla
        >>

        \new Staff
        \with {
            fontSize = #+2
            \override StaffSymbol #'staff-space = #(magstep +2)
        }
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm
        incipit-width = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\pageBreak

\markup \huge {[2.] Adagio}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""primo]"}
            \IIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""secondo]"}
            \IIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
            \IIvla
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key sol\major\time 4/4  r1^\markup \right-align"[Soprano]"}
            \clef violin
            \set Staff.midiInstrument = #"synth voice"
            \IIvoce
            \new Lyrics \lyricsto "perdono" \IItesto
        >>

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \IIbc
        >>
    >>

    \layout {

        indent = 1.5\cm
        incipit-width = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\pageBreak

\markup \huge {[3.] Lento}

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

        \new Staff <<
            \set Staff.midiInstrument = #"synth voice"
            \IIIvoce
            \new Lyrics \lyricsto "labbri" \IIItesto
        >>

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\pageBreak

\markup \huge {[5.] Rec[itativo] - Con spirito}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \IVvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \IVvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \IVvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"synth voice"
            \IVvoce
            \new Lyrics \lyricsto "reo" \IVtesto
        >>

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"cello"
            \IVbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\pageBreak

\markup \huge {[6.] Allegretto}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \VvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \VvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \Vvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"synth voice"
            \Vvoce
            \new Lyrics \lyricsto "mare" \Vtesto
        >>

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"cello"
            \Vbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
