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

    mi,16 mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]
    mi si'' la si si, si' la si si, si' la si si, si' la si

    %4
    si,[si' la sold fad mi red dod] si[si' la sold fad mi red dod]
    si si' la si si, la' sold la si, sold' fad sold si, fad' mi fad\mbreak
    si, si' la si si, la' sold la si, sold' fad sold si, fad' mi fad

    %7
    si, mi red mi mi, red' dod red mi, dod' si dod mi, si' la si
    mi, mi 'red mi mi, red' dod red mi, dod' si dod mi, si' la si
    mi,8 sold'4 la16 si sold8 mi si sold

    %10
    mi sold'4 la16 si sold8 mi si sold
    la la'4 si16 dod la8 fad dod la\mbreak
    fad lad'4 si16 dod lad8 fad dod lad

    %13
    si4 si' lad32(sold fad8.) mi4
    red32(dod si8.) si'4 lad32(sold fad8.) mi4
    red16(fad si8)~si4 dod,16(fad lad8)~lad4

    %16
    si,16 si' lad? si si, si' lad si si, si' lad si si, si' lad si
    si,[si' lad sold fad mi red dod]\mbreak si[si' lad sold fad mi red dod]
    si fad' mi fad fad, mi' red mi fad, red' dod red fad, dod' si dod

    %19
    fad, fad' mi fad fad, mi' red mi fad, red' dod red fad, dod' si dod
    fad,4(mi' red dod)
    sid(la'? sold fad)

    %22
    mid16 dod' si dod dod, si' la si\mbreak dod, la' sold la dod, sold' fad sold
    dod, dod' si dod dod, si' la si dod, la' sold la dod, sold' fad sold
    la32\parentSlur(sold fad8.)~fad4 dod32(si la8.)~la4

    %25
    re32(dod si8.)~si4 la32(sold fad8.)~fad4
    re'?32(dod si8.)~si4 si'32(la sold8.)~sold4
    la32(sold fad8.)~fad4 sold32(fad mid8.)~mid4\mbreak

    %28
    fad16 la fad dod la fad' dod la fad4 r
    mi16 mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]

    %31
    mi si'' la si si, si' la si si, si' la si si, si' la si
    si,[si' la sold fad mi red dod] si[si' la sold fad mi red dod]
    si4\p sol' fad32(sol la8.)~la4

    %34
    sol32(fad mi8.) lad4 si mi,
    red32(dod si8.) la'4 sol32(la si8.) mi,4
    red32(dod si8.) fad'4 mi si'

    %37
    red,32(dod si8.) la'4 sol32\parentSlur (la si8.) mi,4
    red32(dod si8.) fad'4 red32(dod si8.) fad'4\mbreak
    mi,16\parenthesize \f mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi

    %40
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]
    mi mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,8 la si si, mi la si si,

    %43
    mi1\fermata

}

IvlIIn = \relative do'' {

    mi,16 mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]
    mi si'' la si si, si' la si si, si' la si si, si' la si

    %4
    si,[si' la sold fad mi red dod] si[si' la sold fad mi red dod]
    si si' la si si, la' sold la si, sold' fad sold si, fad' mi fad\mbreak
    si, si' la si si, la' sold la si, sold' fad sold si, fad' mi fad

    %7
    si, mi red mi mi, red' dod red mi, dod' si dod mi, si' la si
    mi, mi 'red mi mi, red' dod red mi, dod' si dod mi, si' la si
    mi,8 mi'4 fad16 sold mi8 si sold mi

    %10
    si mi'4 fad16 sold mi8 si sold mi
    mi fad'4 sold16 la fad8 dod la fad\mbreak
    dod fad'4 sold16 lad fad8 dod lad fad

    %13
    fad(red' fad red) dod32 (si lad8.) dod4
    si8(red fad red) dod32 (si lad8.) dod4
    si16(red fad8)~fad4 lad,16(dod fad8)~fad4

    %16
    red16 si' lad? si si, si' lad si si, si' lad si si, si' lad si
    si,[si' lad sold fad mi red dod]\mbreak si[si' lad sold fad mi red dod]
    si fad' mi fad fad, mi' red mi fad, red' dod red fad, dod' si dod

    %19
    fad, fad' mi fad fad, mi' red mi fad, red' dod red fad, dod' si dod
    fad,4(dod' si lad)
    sold(fad' mi red)

    %22
    dod16 dod' si dod dod, si' la si\mbreak dod, la' sold la dod, sold' fad sold
    dod, dod' si dod dod, si' la si dod, la' sold la dod, sold' fad sold
    la32\parentSlur(sold fad8.)~fad4 dod32(si la8.)~la4

    %25
    re32(dod si8.)~si4 la32(sold fad8.)~fad4
    re'?32(dod si8.)~si4 si'32(la sold8.)~sold4
    la32(sold fad8.)~fad4 sold32(fad mid8.)~mid4\mbreak

    %28
    dod16 fad dod la fad dod' la fad dod4 r
    mi16 mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]

    %31
    mi si'' la si si, si' la si si, si' la si si, si' la si
    si,[si' la sold fad mi red dod] si[si' la sold fad mi red dod]
    si4\p sol' fad32(sol la8.)~la4

    %34
    sol32(fad mi8.) lad4 si mi,
    red32(dod si8.) la'4 sol32(la si8.) mi,4
    red32(dod si8.) fad'4 mi si'

    %37
    red,32(dod si8.) la'4 sol32\parentSlur (la si8.) mi,4
    red32(dod si8.) fad'4 red32(dod si8.) fad'4\mbreak
    mi,16\parenthesize \f mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi

    %40
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]
    mi mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,8 la si si, mi la si si,

    %43
    mi1\fermata

}

Ivlan = \relative do' {

    mi16 mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]
    mi8 red red red red red red red

    %4
    red red red red red red red red
    red sold fad fad mi mi red red\mbreak
    sold sold fad fad mi mi red red

    %7
    red16 mi' red mi mi, red' dod red mi, dod' si dod mi, si' la si
    mi, mi' red mi mi, red' dod red mi, dod' si dod mi, si' la si
    mi,4 si si si

    %10
    sold sold si si
    dod dod dod dod\mbreak
    dod dod dod dod

    %13
    red8 fad fad fad fad fad fad fad
    fad fad fad fad fad fad fad fad
    fad red red red dod dod dod dod

    %16
    si16 si' lad? si si, si' lad si si, si' lad si si, si' lad si
    si,[si' lad sold fad mi red dod]\mbreak si[si' lad sold fad mi red dod]
    si4 red'8 red dod dod si si

    %19
    lad lad red red dod dod si si
    lad4 \parentSlur (fad sold lad)
    red, \parentSlur (red mi fad)

    %22
    sold8 sold sold sold\mbreak fad fad mid mid
    la? la sold sold fad fad mid mid
    dod dod dod dod la' la la la

    %25
    fad fad fad fad dod dod la' la
    fad fad fad fad sold sold sold mid
    dod dod dod dod mid mid mid mid\mbreak

    %28
    la16 dod la fad dod la' fad dod la4 r
    mi'16 mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi, [mi' red dod si la sold fad] mi [mi' red dod si la sold fad]

    %31
    mi8 si si si si si si si
    si si si si si si si si \mbreak
    si\p red mi[mi] red red fad fad

    %34
    mi mi fad fad sol sol sol sol
    fad fad red red mi mi sol sol
    fad fad red red sol sol sol sol

    %37
    fad fad red red mi mi sol sol
    fad fad red red fad fad red red\mbreak
    mi16\parenthesize \f mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi

    %40
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]
    mi mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,8 la si si, mi la si si,

    %43
    mi1\fermata

}

Ibcn = \relative do {

    mi16 mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]
    mi8 si si si si si si si

    %4
    si si si si si si si si
    si si si si si si si si\mbreak
    si si si si si si si si

    %7
    si16 mi' red mi mi, red' dod red mi, dod' si dod mi, si' la si
    mi, mi' red mi mi, red' dod red mi, dod' si dod mi, si' la si
    mi,8 mi mi mi mi mi mi mi

    %10
    mi mi mi mi mi mi mi mi
    la, la la la la la la la\mbreak
    lad4 lad lad lad

    %13
    si8 si si si fad' fad fad fad
    si, si si si fad' fad fad fad
    si, si si si fad' fad fad, fad

    %16
    si16 si' lad? si si, si' lad si si, si' lad si si, si' lad si
    si,[si' lad sold fad mi red dod]\mbreak si[si' lad sold fad mi red dod]
    si8 fad' fad fad fad fad fad fad

    %19
    fad fad fad fad fad fad fad fad
    fad16 fad' mi fad fad, fad' mi fad fad, fad' mi fad fad, fad' mi fad
    sold, sold fad sold sold, sold' fad sold sold, sold' fad sold sold, sold' fad sold

    %22
    dod,8 dod dod dod\mbreak dod dod dod dod
    dod dod dod dod dod dod dod dod
    fad,16 fad' mid fad fad, fad' mid fad fad, fad' mid fad fad, fad' mid fad

    %25
    si, si' la si si, si' la si fad, fad' mid fad fad, fad' mid fad
    si, si' la si si, si' la si mid,, mid' red? mid mid, mid' red mid
    fad, fad' mid fad fad, fad' mid fad dod dod' si dod dod, dod' si dod\mbreak

    %28
    fad,,8 fad fad fad fad4 r
    mi'16 mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi, [mi' red dod si la sold fad] mi [mi' red dod si la sold fad]

    %31
    mi8 si si si si si si si
    si si si si si si si si \mbreak
    si si si si si si si si

    %34
    si si si si si si si si
    si si si si si si si si
    si si si si si si si si

    %37
    si si si si si si si si
    si si si si si si si si
    mi16\parenthesize \f mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi

    %40
    mi,[mi' red dod si la sold fad] mi[mi' red dod si la sold fad]
    mi mi' red mi mi, mi' red mi mi, mi' red mi mi, mi' red mi
    mi,8 la si si, mi la si si,

    %43
    mi1\fermata

}

Ibfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s1*5
	s4 <7> <6> <5>
	s1*6
	s2 <_+>
	s <_+>
	s1*3
	s4 <7> <6> <5>
	s <7> <6> <5>
	s <7> <6> <5>
	<_+> <9! 7> <8 6> <9 5+>
	<_+> <7> <6> <5>
	 s <7> <6> <5>
	 s1
	 <_!>
	 s1*7
	 s4 <6!> <5>2
	 <6!>4 <7+> <6! 4>2
	 <3>4 <7> <6! 4>2
	 <5> <6! 4>
	 <5>4 <7> <6! 4>2
	 <5>1

}

forma = {

    \time 4/4
    \key mi\major
    \tempo 2 = 60
    s1*43
    \bar"||"

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

IIvlIn = \relative do'' {

    si8\noBeam \appoggiatura do si32(la si16) sol'8\noBeam
    \appoggiatura la8 sol32(fad sol16) fad8[si]
    red,16(mi fad8) sol

    %4
    sol\noBeam\parentSlur (  \tuplet 3/2 { fad16)red (mi fad[sol la)] }
    sol32(fad mi16) lad32[(sol fad16)] si8\noBeam
    re,16(dod? si4)

    %7
    re16 (dod? si4)
    re16-. si-. re,-. si'-. mi,-. si'-.
    fad sol'(fad mi re dod?)

    %10
    re\parenthesize -. si\parenthesize -. re,\parenthesize -.[si'\parenthesize -.] mi,\parenthesize -. si'\parenthesize -.
    fad (sol' fad mi re dod?)
    si4.\mbreak

    %13
    mi,8\noBeam sold'\noBeam~sold16(la32 si)
    si8\noBeam~\tuplet 3/2 { si16 la-.(sold?-. fad-.[mi-. re-.)] }
    mi,8\noBeam si'32(do re16) re32[(do si16)]

    %16
    \tuplet 3/2 { do16 fa,-.(mi-. re-. [do-. si-.)] } la8
    re8 fad'\noBeam~fad16(sol32 la)
    la8\noBeam~\tuplet 3/2 { la16 sol-.(fad-. mi-.[re-. do-.)] }

    %19
    re,8\noBeam la'32(si do16) do32[(si la16)]
    \tuplet 3/2 { si16 mi,-.(re-. do-.[si-. la-.)] } sol8\mbreak
    si'8\noBeam \appoggiatura do si32(la si16) sol'8\noBeam

    %22
    \appoggiatura la8 sol32(fad sol16) fad4
    si,8\noBeam \appoggiatura do si32(la si16) la'8\noBeam
    \appoggiatura si la32(sol la16) sol4

    %25
    \tuplet 3/2{sol16-.(si-. la-. sol-.[fad-. mi-.] re-. do-. si-.)}
    do4.
    \tuplet 3/2 {do16-.(mi-. re-. do-.[si-. la-.] sol-. fad-. mi-.)}

    %28
    red'4.
    \once\tieDown fad8\noBeam~\appoggiatura sol fad32(mi fad16) si8\noBeam\mbreak
    \appoggiatura la8 sol32(fad sol16) fad4

    %31
    si,8\noBeam \appoggiatura do si32(la si16) si'8\noBeam
    \appoggiatura la8 sol32(fad sol16) fad4
    \tuplet 3/2 { si,16 fad' (mi red[do si]) sol' fad mi }

    %34
    do8 \con \tuplet 3/2 { r16 la red } r si
    sol'8 \tuplet 3/2 { r16 mi lad} r fad
    si\noBeam mi,\noBeam sol8(fad16\tr) mi

    %37
    mi8 \senza \tuplet 3/2 { r16 si-.(la-. sol-.[fad-. mi-.)] } \mbreak
    do'8(si fad')
    \tuplet 3/2 { sol16(fad mi) } <<{fad8.\tr [mi16]}\\si4>>

    %40
    mi4.\fermata

}

IIvlan = \relative do' {

    sol'8 sol mi
    mi red red
    fad fad mi

    %4
    mi red red
    si fad' fad
    fad fad fad

    %7
    fad fad fad
    fad re mi
    fad fad lad

    %10
    fad re mi
    fad fad lad
    fad fad fad\mbreak

    %13
    si, si si
    sold sold sold
    sold? sold sold'?

    %16
    mi mi mi
    la, la la
    fad fad fad

    %19
    fad fad fad'
    re re re\mbreak
    sol sol mi

    %22
    mi red red
    red? red red
    si si si

    %25
    si' si sol
    mi mi mi
    mi mi sol

    %28
    fad fad fad
    red red mi\mbreak
    mi red red

    %31
    red? red mi
    mi red red
    red? red mi

    %34
    mi fad fad
    si, do' do
    fad,16[mi] mi8 red

    %37
    si si sol'\mbreak
    sol sol si
    si si si

    %40
    sol4.\fermata

}


IIbcn = \relative do {

    mi8_\markup\italic"Senza Cemb[alo]" mi mi
    si si si
    si si si

    %4
    si si si
    mi mi re?
    si si si

    %7
    si si si
    si re mi
    fad lad, fad'

    %10
    si, re mi
    fad lad, fad'
    si, si' la\mbreak

    %13
    sold fad mi
    mi mi mi
    sold fad mi

    %16
    la la, la
    fad' mi re
    re re re

    %19
    fad mi re
    sol sol, sol\mbreak
    mi' mi mi

    %22
    si si si
    si si si
    mi mi mi

    %25
    mi mi mi
    la, la la
    la la la

    %28
    si si si
    si si si\mbreak
    si si si

    %31
    si si si
    si si si
    si si mi

    %34
    la la la
    mi mi mi
    red16[mi] si'8 si,

    %37
    mi mi mi\mbreak
    mi mi red
    mi si' si,

    %40
    mi4.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key mi\minor
    \tempo 4 = 45
    s4.*40
    \bar"||"

}



IIvlI = {
    \global
    %\notypeset
    <<\IIvlIn \forma>>

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

    sold'16 si sold mi fad red
    mi8 si sold
    mi16 sold si mi sold[si]

    %4
    red,, fad si red fad[la]
    \senza \tuplet 3/2 { sold(fad mi } la8[fad)]
    \tuplet 3/2 { sold16(fad mi } la8[fad)]

    %7
    \tuplet 3/2 { sold16(fad mi } si'8[sold)]
    fad4 r8
    \tuplet 3/2 { si,16 dod red red[mi fad] fad sold la }

    %10
    si8 red, si
    dod dod, lad\mbreak
    si4.

    %13
    sold''16 si sold mi si sold
    mi8 sold si
    \tuplet 3/2 { re16(dod si) sold'[(fad mi)] si'(la sold) }

    %16
    la4 r8
    lad16 dod lad mi dod lad
    fad8 lad dod

    %19
    \tuplet 3/2 { mi16(red dod) lad'[(sold fad)] dod'(si lad) }
    si4 r8
    mi,,16 sold si mi sold[si]\mbreak

    %22
    red,, fad si red fad[la]
    \tuplet 3/2 { sold16(fad mi } la8[fad)]
    \tuplet 3/2 { sold16(fad mi } la8[fad)]

    %25
    \tuplet 3/2 { sold16 si la sold[fad mi] red dod si
    sold' si la sold [fad mi] red dod si}
    sold'8 fad4\tr

    %28
    mi4.\fermata

}

IIIvlIIn = \relative do'' {

    \senza sold'16 si sold mi fad red
    mi8 si sold
    mi16 sold si mi sold[si]

    %4
    red,, fad si red fad[red]
    mi( si fad'8[red)]
    mi16( si fad'8[red)]

    %7
    mi16( si sold'8[mi)]
    red4 r8
    \tuplet 3/2 { si16 dod red red[mi fad] fad sold la }

    %10
    si8 red, si
    dod dod, lad\mbreak
    si4.

    %13
    si'8(mi sold)
    sold,(si mi)
    si(mi sold)

    %16
    dod,4 r8
    dod(fad lad)
    lad,(dod fad)

    %19
    dod(fad lad)
    red,4 r8
    mi,16 sold si mi sold[si]\mbreak

    %22
    red,, fad si red fad[\parenthesize red]
    mi(si fad'8[red)]
    mi16( si fad'8[red)]

    %25
    \tuplet 3/2 { sold16 si la sold[fad mi] red dod si
    sold' si la sold [fad mi] red dod si}
    sold'8 fad4\tr

    %28
    mi4.\fermata

}

IIIvlan = \relative do' {

    si'8 si si
    sold4 r8
    sold sold sold

    %4
    fad fad fad
    si si si
    si si si

    %7
    si si si
    si4 r8
    fad fad fad

    %10
    fad fad fad
    fad fad fad\mbreak
    red4.

    %13
    sold,8 sold sold
    si si si
    sold' sold sold

    %16
    mi4 r8
    fad fad fad
    dod dod dod

    %19
    lad' lad lad
    fad4 r8
    sold sold sold\mbreak

    %22
    fad fad fad
    si si si
    si si si

    %25
    si si si
    si si si
    si red, red

    %28
    mi4.\fermata

}


IIIbcn = \relative do {

    mi8 si' si,
    mi mi, mi'
    mi, mi' mi,

    %4
    si' si' si,
    si si' si,
    si si' si,

    %7
    si si' si,
    si si' si,
    si si' si,

    %10
    si si' si,
    fad fad' fad,\mbreak
    si4.

    %13
    mi,8 mi' mi,
    mi mi' mi,
    mi mi' mi,

    %16
    la la' la,
    fad fad' fad,
    fad fad' fad,

    %19
    fad fad' fad,
    si si' red,
    mi, mi' mi,\mbreak

    %22
    si' si' si,
    si si' si,
    si si' si,

    %25
    mi si' si,
    mi mi' si
    mi, si' si,

    %28
    mi4.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key mi\major
    \tempo 4. = 65
    s4.*12
    \bar":..:"
    s4.*16
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

    la16 si
    dod8[dod(mi) re16 dod] si8[si (re) dod16 si]
    la8[la(dod) si16 la] sold fad mi8 r la16 si
    dod(si la si dod8) la' si,16 (la sold la si8) sold'

    %4
    la,16(sold fad sold la8) fad' sold,16 fad mi4 dod'16 re
    mi8[mi(la) sold16 fad] mi8[mi(fad) mi16 re]
    mi8[mi(la) sold16 fad]\mbreak mi8[mi(fad) mi16 re]

    %7
    mi8 la, si sold la4 r8 la16 si
    dod8[dod(mi) re16 dod] si8[si (re) dod16 si]
    la8[la(dod) si16 la] sold mi sold si mi8 sold,16 la

    %10
    si8[si(mi) red16 dod] si8[si(mi) red16 dod]
    si8[fad'(la) sold16 fad] sold8[sold(si) la16 sold]\mbreak
    fad8[fad(la) sold16 fad] sold8 mi fad red

    %13
    mi4 r8 dod16(re? mi fad sol4) fad16 mi
    re dod si4 re16(mi fad sold? la4) sold16 fad
    mi red dod8~dod dod16 red mi8[mi(sold) fad16 mi]

    %16
    red8 [red(fad) mi16 red]\mbreak dod8[dod(mi) red16 dod]
    sid8 la'(sold fad) mi[red16 dod red8 sid]
    dod la'(sold fad) mi[red16 dod red8 sid]

    %19
    dod4 r8 la16 si? dod8[dod(mi) re?16 dod]
    si8[si(re) dod16 si] la8[la(dod) si16 la]
    sold fad mi4 la'16 sold fad mi re4 dod16 si\mbreak

    %22
    dod si la4 la'16 sold fad mi re4 dod16 si
    dod si la8 mi' mi, fad re' sold, mi'
    la, fad' si, sold' la4 r8 re,16 dod

    %25
    re mi fad4 re16 dod re mi fad4 mi,16 fad
    sold8 la si dod re dod4 mi,16 fad
    sold8 la si dod re dod la' sold16 fad\mbreak

    %28
    mi8 re16 dod si8 la16 sold la dod si la fad' re dod si
    mi dod si la fad' re dod si mi dod si la fad' re dod si
    mi8[la, \parentSlur (si) la16 sold] la8[dod(re) dod16 si]

    %31
    dod8[la (si) la16 sold] la8[dod(re) dod16 si]
    dod8[la'(si) la16 sold] la2\fermata

}

IVvlan = \relative do' {

    r8
    r mi mi4 r8 mi mi4
    r8 la, la4 r8 si sold4
    r8 mi' mi4 r8 mi mi4

    %4
    r8 la, la4 r8 si si4
    r8 dod' dod4 r8 dod re4
    r8 dod dod4\mbreak r8 dod re4

    %7
    r8 mi, fad mi dod mi mi4
    r8 mi mi4 r8 mi mi4
    r8 la, la4 r8 si si4

    %10
    r8 sold' sold4 r8 sold sold4
    r8 si si4 r8 si si4\mbreak
    r8 si si4 r8 si dod fad,

    %13
    sold sold sold4 r8 dod dod4
    r8 fad, fad4 r8 red' red4
    r8 sold, sold4 r8 sold sold4

    %16
    r8 sold sold4\mbreak r8 sold sold4
    r8 sid red4 r8 sold, la sold
    mi4 red sold,8 sold' la sold

    %19
    mi4 r r8 mi mi4
    r8 mi mi4 r8 la,la4
    r8 si si4 r8 si' sold4\mbreak

    %22
    r8 mi mi4 r8 si' sold4
    r8 mi mi4 re mi
    fad sold8 mi mi mi mi4

    %25
    r8 si si4 r8 si si4
    mi8 fad sold la si la4 dod,16 re
    mi8 fad sold la si8 la \parenthesize r4\mbreak

    %28
    r8 mi fad si, dod mi si4
    dod si dod si
    si8 mi fad[mi] dod la' sold4

    %31
    r8 la sold r8 la sold4
    r8 mi fad mi dod2\fermata

}


IVbcn = \relative do {

    r8
    r la'16 [sold la8 la,] r sold'16[fad sold8 sold,]
    r fad'16[mi fad8 fad,] r mi'16[re mi8 mi,]
    r la'16 [sold la8 la,] r sold'16[fad sold8 sold,]

    %4
    r fad'16[mi fad8 fad,] r mi'16[re mi8 mi,]
    r la'16 [sold la8 la,]  r la'16 [sold la8 la,]
    r la'16 [sold la8 la,] \mbreak r la'16 [sold la8 la,]

    %7
    r la' re, mi la,[la'16 sold la8 la,]
    r la'16 [sold la8 la,] r sold'16[fad sold8 sold,]
    r fad'16[mi fad8 fad,] r mi'16[re mi8 mi,]

    %10
    r mi'16[red mi8 mi,] r mi'16[red mi8 mi,]
    r red''16[dod red8 red,] r mi'16[red mi8 mi,]\mbreak
    r red'16[dod red8 red,] mi sold la si

    %13
    mi,[mi16 red mi8 mi,] r lad'16[sold? lad8 lad,]
    r si'16[lad si8 si,] r sid'16[lad sid8 sid,]
    r dod'16 [sid dod8 dod,] r dod'16 [sid dod8 dod,]

    %16
    r sold'16[fad sold8 sold,]\mbreak r dod'16[sid dod8 dod,]
    sold'4 sid, dod8 mi fad sold
    dod,4 sid dod8 mi fad sold

    %19
    dod,4 r r8 la'16[sold la8 la,]
    r sold'16[fad sold8 sold,] r fad'16[mi fad8 fad,]
    r mi'16[re mi8 mi,] r mi'16[re mi8 mi,]\mbreak

    %22
    r la'16 [sold la8 la,] r mi'16[re mi8 mi,]
    r la'16 [sold la8 la,] re4 mi
    fad sold8 mi  la,[la'16 sold la8 la,]

    %25
    r sold'16[fad sold8 sold,] r sold'16[fad sold8 sold,]
    mi'4 mi mi mi
    mi mi mi8[la16 sold la8 la,]\mbreak

    %28
    r dod re mi la, dod re4
    dod re dod re
    dod8 dod re mi la, la' si mi,

    %31
    la, la' si mi, la, la' si mi,
    la, la' re, mi la,2\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1*4
    s2 s4 <6 4>
    s8 <5 3> s4 s <6 4>
    s8 <5 3> s4 s2
    s1*5
    s2 s8 <7-> s4
    s2 s8 <7> s4
    s1*2
    <_+>1
    s1*3
    s2 s8 <7> s4
    s2 s8 <7> s4
    s1
    s
    s8 <7 5> s4 s2
    s <7 5>4 <6 4>
    <5 3> <7 5> s2
    s s4 <6>
    <6> <6> <6> <6>
    <6>

}

forma = {

    \time 4/4
    \key la\major
    \tempo 2 = 62
    \partial 8 s8
    s1*32
    \bar"||"

}



IVvlI = {
    \global
    %\notypeset
    <<\IVvlIn \forma>>

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

VvlIn = \relative do'' {

    fad8 fad fad fad fad fad mid mid
    si' si si si si si la la
    la la sold fad mi mi sold sold
    la la la la sold sold lad lad
    si si si si la? la la la
    sold sold fad fad mi mi dod' dod
    dod dod sid sid dod4 r
    mi,8\p mi mi mi red red red red
    mi1

}

VvlIIn = \relative do'' {

    dod8 dod dod dod si si si si
    sold' sold sold sold fad fad fad fad
    red red red red dod dod mi mi
    fad fad fad fad mi mi fad fad
    fad fad sold! sold fad fad fad fad
    red red red red dod dod dod dod
    red red red red mi4 r
    dod8\p dod dod dod dod dod sid sid
    dod1

}

Vvlan = \relative do' {

    la'8 la la la sold sold sold sold
    mid mid mid mid dod dod dod fad
    fad fad red red sold sold sold mi
    dod dod red red si si' dod dod
    re? re dod dod dod dod dod dod
    sid sid sid sid sold sold sold sold
    la la sold sold sold4 r
    sold8\p sold sold sold la la sold sold
    sold1

}


Vbcn = \relative do {

    fad8 fad fad fad sold sold sold sold
    dod, dod dod dod fad fad fad fad
    sid, sid sid sid dod dod dod dod
    fad fad si,? si mi mi mi mi
    re re mid, mid fad fad fad fad
    sid sid sid sid dod dod mi mi
    fad fad sold sold dod,4 r
    dod8\p dod dod dod fad, fad sold sold
    dod,1

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <7>4 <6+>
    <7 _+>2 <5 4>4 <3>
    <7>1
    s4 <7 _+> <5> <6 4+>
    s <6 5> s2
    <6>4 <5> s2
    <6 5>1
    s2 <6 5>

}

forma = {

    \time 4/4
    \key la\major
    \tempo 4 = 35
    s1*8
    s1\fermata
    \bar"||"

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

VIvlIn = \relative do'' {

    mi8_\markup\italic "2 [Violini] Soli"
    la,(do) mi
    fa(mi) la
    re, do16 si do la

    %4
    fa'8(mi) mi
    la,(do) mi
    fa\parentSlur (mi) la

    %7
    re, do16 si do la
    fa'8 \parentSlur (mi) mi,
    la fa'(mi)

    %10
    sold, mi'(re)
    fa, re'(do)
    mi,4 r8

    %13
    la'16\tu sold fad8 mi
    re16 dod si8 la
    la'16 sold fad8 mi

    %16
    re16 dod si8 la
    re8 mi mi,\mbreak
    la4 \key do\major mi'8_\markup\italic "2 Soli"

    %19
    la,(do) mi
    fa(mi) la
    re, do16 si do la

    %22
    fa'8 (mi) mi
    la, \parentSlur (do) mi
    red(fad?) si

    %25
    mi, \parentSlur (sol) si
    red, \parentSlur (fad?) si
    sold8\tu si sold

    %28
    fad16 sold la8 si
    sold si sold
    fad16 sold la8 si

    %31
    sold red mi
    sold red mi\mbreak
    sold la \parentSlur (fad)

    %34
    mi16 red dod8 si
    la16 sold fad8 mi
    mi'16 red? dod8 si

    %37
    la16 sold fad8 mi
    la si si,
    mi4.
    r8 r si'8_\markup\italic"2 Soli"

    %41
    mi, \parentSlur (sol) si
    do(si) mi
    la sol16 fad sol mi

    %44
    do'8(si) si,
    mi,(sol) si
    do \parentSlur (si) mi\mbreak

    %47
    la sol16 fad sol mi
    do'8 \parentSlur (si) sol
    fad? si red,

    %50
    mi la do,
    si16\tu dod red mi fad? sol?
    la4.

    %53
    sol8 si sol
    lad fad? si
    re,? dod4

    %56
    si16 dod? re mi fad?8
    sold(la) si
    la(fad) re~

    %59
    re sold si
    dod, (sold') dod,~\mbreak
    dod fad la

    %62
    sid, \parentSlur (sold) fad'
    mi red4
    dod mi8_\markup\italic"2 Soli"

    %65
    la,(do) mi
    fa(mi) la
    re, do16 si do la

    %68
    fa'8 \parentSlur (mi) mi
    la, \parentSlur (do) mi
    fa \parentSlur (mi) la

    %71
    re, do16 si do la
    fa'8 \parentSlur (mi) mi,
    la fa'(mi)\mbreak

    %74
    sold, mi' \parentSlur (re)
    fa, re' \parentSlur (do)
    mi,4 r8

    %77
    mi'\tu (la) dod
    si(re) dod
    mi,(dod') si

    %80
    la(dod) si
    re,(si') la
    sold(si) la

    %83
    dod,(la') sold
    fad16 mi fad8 sold
    la16 sold la8 la,

    %86
    la'16 sold fad8 mi\mbreak
    re16 dod si8 la
    la'16 sold fad8 mi

    %89
    re16 dod si8 la
    re mi mi,
    la_\markup\italic"2 Soli" (do) mi

    %92
    fa(mi) la
    la, \parentSlur (do) mi
    fa \parentSlur (mi) la

    %95
    la(sold) do
    do(si) la
    si sold4\mbreak

    %98
    la16\tu sold fad8 mi
    re16 dod si8 la
    la'16 sold fad8 mi

    %101
    re16 dod si8 la
    re mi mi,
    la4.

}

VIvlIIn = \relative do'' {

    r8_\markup\italic "2 [Violini] Soli"
    r r mi
    la,(do) mi
    fa(mi) la

    %4
    re, do16 si do la
    fa'8 \parentSlur ( mi) mi
    la,(do) mi

    %7
    fa\parentSlur (mi) la
    re, do16 si do la
    r8 re(do)

    %10
    r do(si)
    r si(la)
    sold4 r8

    %13
    la'16\tu sold fad8 mi
    re16 dod si8 la
    la'16 sold fad8 mi

    %16
    re16 dod si8 la
    re8 mi mi,\mbreak
    la4 \key do\major r8_\markup\italic "2 Soli"

    %19
    r r mi'
    la,\parentSlur (do) mi
    fa(mi) la

    %22
    re, do16 si do la
    fa'8\parentSlur (mi) la
    fad? red(fad)

    %25
    sol mi(sol)
    si red,(fad?)
    mi sold mi

    %28
    red16 mi fad8 red
    mi sold mi
    red16 mi fad8 red

    %3\
    mi8 fad sold
    mi fad sold\mbreak
    mi fad \parentSlur (red)

    %34
    mi16 red dod8 si
    la16 sold fad8 mi
    mi'16 red? dod8 si

    %37
    la16 sold fad8 mi
    la si si,
    mi4.

    %40
    R4.
    r8 r si'_\markup\italic"2 Soli"
    mi,(sol) si

    %43
    do(si) mi
    la sol16 fad sol mi
    do'8 (si) si,

    %46
    mi, \parentSlur (sol) si\mbreak
    do \parentSlur (si) mi
    la sol16 fad? sol mi

    %49
    red8 fad? si,
    mi do la
    fad4\tu r8

    %52
    si16 dod red mi fad? red
    mi8 sol mi
    mi4 re?8

    %55
    si lad4
    si r8
    mi(fad) sold

    %58
    fad dod la
    sold(si) sold'
    sold(mi) dod\mbreak

    %61
    la4.
    sold8 red'4
    dod sid8

    %64
    dod4 r8_\markup\italic "2 Soli"
    r8 r mi
    la,(do) mi

    %67
    fa(mi) la
    re, do16 si do la
    fa'8(mi) mi

    %70
    la,(do) mi
    fa8(mi) la
    re, do16 si do la

    %73
    r8 re(do)\mbreak
    r do\parentSlur (si)
    r si\parentSlur (la)

    %76
    sold4 r8
    R4.
    mi'8\tu si'4~

    %79
    si8 mi,4~
    mi8 la4~
    la8 re,4~

    %82
    re8 sold4~
    sold8 dod,4
    re16 dod re8 mi

    %85
    mi re dod
    la'16 sold fad8 mi\mbreak
    re16 dod si8 la

    %88
    la'16 sold fad8 mi
    re16 dod si8 la
    re mi mi,

    %91
    la4_\markup\italic"2 Soli" r8
    la\parentSlur (do) mi
    fa(mi) la

    %94
    la,\parentSlur (do) mi
    fa\parentSlur (mi) la
    la\parentSlur (sold) do,

    %97
    re si4\mbreak
    la'16\tu sold fad8 mi
    re16 dod si8 la

    %100
    la'16 sold fad8 mi
    re16 dod si8 la
    re mi mi,

    %103
    la4.

}

VIvlan = \relative do' {

    r8
    R4.*12

    %13
    la'16 sold fad8 mi
    re16 dod si8 la
    la'16 sold fad8 mi

    %16
    re16 dod si8 la
    re8 mi mi,\mbreak
    la4\key do\major r8

    %19
    R4.*8
    si'4 si8
    si4 si8

    %29
    si4 si8
    si4 si8
    si4 si8

    %32
    si4 si8\mbreak
    si dod si

    %34
    mi16 red dod8 si
    la16 sold fad8 mi
    mi'16 red? dod8 si

    %37
    la16 sold fad8 mi
    la si si,
    mi4.

    %40
    R4.*11
    r8 fad? fad
    r fad? red

    %53
    r si si
    r dod' fad,?
    sol dod, fad

    %56
    re4 r8
    dod4.
    dod4 fad8

    %59
    si,4.
    dod\mbreak
    fad

    %62
    red4 sold8
    sold sold4
    mi r8

    %65
    R4.*12
    dod'4 la8
    si4 mi,8

    %79
    sold4 mi8
    dod4 la8
    fad'4 re8

    %82
    si4 sold8
    mi'4 dod8
    la4.

    %85
    la
    la'16 sold fad8 mi\mbreak
    re16 dod si8 la

    %88
    la'16 sold fad8 mi
    re16 dod si8 la
    re mi mi,

    %91
    la4 r8
    R4.*6
    la'16 sold fad8 mi

    %99
    re16 dod si8 la
    la'16 sold fad8 mi
    re16 dod si8 la

    %102
    re' mi mi,
    la,4.

}


VIbcn = \relative do {

    r8_\markup\italic "Violon[cel]lo Solo"
    r la' la,
    r la' la,
    r la' la,

    %4
    r la' la,
    r la' la,
    r la' la,

    %7
    r la' la,
    r la' la,
    fa'4 r8

    %10
    mi4 r8
    re4 r8
    mi4 r8

    %13
    la16\tu sold fad8 mi
    re16 dod si8 la
    la'16 sold fad8 mi

    %16
    re16 dod si8 la
    re'8 mi mi,\mbreak
    la,8 \key do\major la'_\markup\italic "Viol.lo Solo"[la,]

    %19
    r la' la,
    r la' la,
    r la' la,

    %22
    r la' la,
    r la' la,
    r si' si,

    %25
    r mi mi,
    r si'' si,
    mi\tu mi' mi,

    %28
    si si' si,
    mi mi' mi,
    si si' si,

    %31
    mi si' mi,
    r si' mi,\mbreak
    mi la, si

    %34
    mi'16 red dod8 si
    la16 sold fad8 mi
    mi'16 red? dod8 si

    %37
    la16 sold fad8 mi
    la si si,
    mi4.

    %40
    r8 mi mi,
    r mi' mi,
    r mi' mi,

    %43
    r mi' mi,
    r mi' mi,
    r mi' mi,

    %46
    r mi' mi,\mbreak
    r mi' mi,
    r mi' mi,

    %49
    si'4.
    do8 la4
    si8\tu si' si,

    %52
    r si' si,
    r mi mi,
    fad' lad si

    %55
    mi, fad? fad,?
    si si' re,
    dod4.

    %58
    fad
    mid
    mi!\mbreak

    %61
    red
    sold4 sid,8
    dod sold' sold,

    %64
    dod4 r8_\markup\italic"Viol.lo Solo"
    r la' la,
    r la' la,

    %67
    r la' la,
    r la' la,
    r la' la,

    %70
    r la' la,
    r la' la,
    r la' la,

    %73
    fa'4 r8\mbreak
    mi4 r8
    re4 r8

    %76
    mi16 fad sold8 mi
    la, \tu la' la,
    sold'4 r8

    %79
    dod,4 r8
    fad4 r8
    si,4 r8

    %82
    mi4 r8
    la,4 r8
    re4 re8

    %85
    dod si la
    la'16 sold fad8 mi\mbreak
    re16 dod si8 la

    %88
    la'16 sold fad8 mi
    re16 dod si8 la
    re' mi mi,

    %91
    la,_\markup\italic"Viol.lo Solo" la' la,
    r la' la,
    r la' la,

    %94
    r la' la,
    r mi' do
    r do la

    %97
    re mi mi,\mbreak
    la'16\tu sold fad8 mi
    re16 dod si8 la

    %100
    la'16 sold fad8 mi
    re16 dod si8 la
    re' mi mi,

    %103
    la,4.

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4.*27
    <_+>4.
    s4.*22
    <_+>4.
    s
    s
    <_+>
    s4.*4
    <7>4.
    <6>
    <7>
    <_+>
    s4.*16
    <7>4.
    <7>
    <7>
    <7>
    <7>

}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key do\major
    \tempo 4. = 75
    \partial 8 s8
    s4.*12
    \key la\major
    s4.*14
    \key la\major
    s4.*13 \bar ":|." \break
    \key do\major
    s4.*17
    \key la\major
    s4.*7
    s4 \key do\major s8
    s4.*12
    \key la\major
    s4.*14
    \key do\major
    s4.*7
    \key la\major
    s4.*5
    s4.\fermata
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

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Sinfonia per archi RV 131}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1. Allegro] }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
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
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[2.] And[ant]e }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[3.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
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
                \IIIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \header {
        title = \markup\smaller{Concerto per archi RV 159}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violini]""unisoni"}
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \IVbc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[2.] Ad[agi]o }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \Vbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \VIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

}