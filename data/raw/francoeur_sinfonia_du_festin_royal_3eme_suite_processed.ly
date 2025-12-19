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

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tous"

acc = ^\markup\italic"acc."

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

rinf = ^\markup\italic "rinf"

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


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

IvlIn = \relative do'' {

    sold'2 sold
    sold-+~sold4. \tuplet 3/4 { fad32 sold la }
    sold4 fad mi-+ red

    %4
    mi si mi si
    mi si mi8 mi fad sold
    fad4 si, fad' si,

    %7
    fad' si, fad'8 fad sold la
    sold fad mi red mi fad sold la\mbreak
    si2 si

    %10
    si-+~si8 la sold si
    la sold fad la sold fad mi sold
    fad mi red mi fad sold la sold

    %13
    fad mi red mi fad sold la sold
    fad1-+
    fad4.\p(sold8) fad4.(si8)

    %16
    si2.(la8-+ sold)\mbreak
    sold2 (la4.) si8
    sold1-+

    %19
    sold4. (la8) sold4.(dod8)
    dod2.(si8-+ la)
    \appoggiatura la si2 mi

    %22
    red1-+
    sold,2\f sold
    sold-+~sold4. \tuplet 3/4 { fad32 sold la }

    %25
    sold4 fad mi red
    mi si mi si
    mi si mi8 mi fad sold

    %28
    fad4 si, fad' si,
    fad' si, fad'8 fad sold la
    sold fad mi fad sold la si sold

    %31
    dod2 dod
    dod1\mbreak
    R1*4

    %37
    si8\tu la sold fad mi red mi si
    dod mi red fad mi la sold fad
    sold2 fad-+\mbreak

    %40
    mi8 red dod si la sold fad mi
    dod' si la sold fad mi red dod
    si4 mi8 fad fad4.-+(mi16 fad)

    %43
    mi1

}

IvlIIn = \relative do'' {

    sold'2 sold
    sold-+~sold4. \tuplet 3/4 { fad32 sold la }
    sold4 fad mi-+ red

    %4
    mi si mi si
    mi si mi8 mi fad sold
    fad4 si, fad' si,

    %7
    fad' si, fad'8 fad sold la
    sold fad mi red mi fad sold la\mbreak
    sold2 sold

    %10
    sold-+~sold8 fad mi sold
    fad mi red fad mi red dod mi
    red dod si dod red mi fad mi

    %13
    red dod si dod red mi fad mi
    red1-+
    red4.\p(mi8) red4.(mi8)

    %16
    \grace red dod2~dod4. fad8\mbreak
    fad1~
    fad4 mi8-+ red \grace red mi2

    %19
    mi4.(fad8) mi4.(la8)
    la2.(sold8-+ fad)
    \grace fad sold2~sold4. la8

    %22
    fad1-+
    sold2\f sold
    sold-+~sold4. \tuplet 3/4 { fad32 sold la }

    %25
    sold4 fad mi red
    mi si mi si
    mi si mi8 mi fad sold

    %28
    fad4 si, fad' si,
    fad' si, fad'8 fad sold la
    sold fad mi fad sold la si sold

    %31
    dod2 dod
    dod1\mbreak
    R1*4

    %37
    si8\tu la sold fad mi red mi si
    dod mi red fad mi la sold fad
    sold2 fad-+\mbreak

    %40
    mi8 red dod si la sold fad mi
    dod' si la sold fad mi red dod
    si4 mi8 fad fad4.-+(mi16 fad)

    %43
    mi1

}

IhbIn = \relative do'' {

    sold'2 sold
    sold-+~sold4. \tuplet 3/4 { fad32 sold la }
    sold4 fad mi-+ red

    %4
    mi si mi si
    mi si mi8 mi fad sold
    fad4 si, fad' si,

    %7
    fad' si, fad'8 fad sold la
    sold fad mi red mi fad sold la\mbreak
    si2 si

    %10
    si1-+~
    si~
    si~

    %13
    si~
    si
    R1*8

    %23
    sold2\f sold
    sold-+~sold4. \tuplet 3/4 { fad32 sold la }

    %25
    sold4 fad mi red
    mi si mi si
    mi si mi8 mi fad sold

    %28
    fad4 si, fad' si,
    fad' si, fad'8 fad sold la
    sold la sold fad mi4 mi

    %31
    mi1-+~
    mi-+\mbreak
    fad2~fad4. sold8

    %34
    fad2~fad4. sold8
    fad2~fad4. sold8
    fad1-+

    %37
    si8\tu la sold fad mi red mi si
    dod mi red fad mi la sold fad
    sold2 fad-+\mbreak

    %40
    mi1~
    mi2~mi4. la8
    fad2\prall ~fad4. si8

    %43
    sold1-+

}

IhbIIn = \relative do'' {

    sold'2 sold
    sold-+~sold4. \tuplet 3/4 { fad32 sold la }
    sold4 fad mi-+ red

    %4
    mi si mi si
    mi si mi8 mi fad sold
    fad4 si, fad' si,

    %7
    fad' si, fad'8 fad sold la
    sold fad mi red mi fad sold la\mbreak
    si2 si

    %10
    si1-+~
    si~
    si~

    %13
    si~
    si
    R1*8

    %23
    sold2\f sold
    sold-+~sold4. \tuplet 3/4 { fad32 sold la }

    %25
    sold4 fad mi red
    mi si mi si
    mi si mi8 mi fad sold

    %28
    fad4 si, fad' si,
    fad' si, fad'8 fad sold la
    sold la sold fad mi4 mi

    %31
    mi1-+~
    mi-+\mbreak
    dod4.(red8) dod4.(mi8)

    %34
    red4.(mi8) red4.(mi8)
    dod4.(red8) dod4.(mi8)
    red1-+


    %37
    si'8\tu la sold fad mi red mi si
    dod mi red fad mi la sold fad
    sold2 fad-+\mbreak

    %40
    mi1~
    mi2~mi4. la8
    fad2\prall ~fad4. si8

    %43
    sold1-+

}

IcrIn =  %\transpose do mi, {

    \relative do'' {\key do\major
    mi2 mi
    mi2-+~mi4. \tuplet 3/4 { re32 mi fa }
    mi4 re do-+ si

    %4
    do sol do sol
    do sol do8 do re mi
    re4 sol, re' sol,

    %7
    re' sol, re'8 re mi fa
    mi re do sol do re mi fa\mbreak
    sol2 sol

    %10
    sol1-+~
    sol~
    sol~

    %13
    sol\parentSlur (
    sol)
    R1*8

    %23
    mi2\f mi
    mi-+~mi4. \tuplet 3/4 { re32 mi fa }
    mi4 re-+ do sol

    %26
    do sol do sol
    do sol do8 do re mi
    re4 sol, re' sol,

    %29
    re' sol, re'8 re mi fa
    mi fa mi re do4 do
    do1-+~

    %32
    do\mbreak
    R1*4
    sol'2 sol

    %38
    sol4 fa mi8 fa mi re
    mi2 re-+\mbreak
    do1~

    %41
    do2~do4. fa8
    re2~re4. sol8
    mi1-+

}

%}

Ihcn = \relative do'' {

    si2 si
    si-+~si4. \tuplet 3/4{ la32 si dod }
    si4 la sold-+ fad

    %4
    si,2 si'
    si si
    red4.-+(dod16 red) red4.-+(dod16 red)

    %7
    red2-+~red8 red mi fad
    si, la sold fad sold la si mi\mbreak
    mi2 mi

    %10
    mi1-+
    si2 si
    si1-+~

    %13
    si~
    si
    si2\p si,

    %16
    fad'1\mbreak
    fad2 fad,
    dod'1

    %19
    dod'2~dod4. la8
    mi'1
    mi,

    %22
    si'
    si2\f si
    si-+~si4.\tuplet 3/4{ la32 si dod }

    %25
    si4 la sold-+ fad
    si,2 <si' si,>
    <si si,> <<si\\si>>

    %28
    red4.-+(dod16 red) red4.-+(dod16 red)
    red2-+~red8 red mi fad
    si,2 r4 sold

    %31
    \appoggiatura fad8 mi2 mi
    mi1\mbreak
    R1*4

    %37
    mi'2 sold,
    sold4 fad mi dod'
    si2 la-+\mbreak

    %40
    sold-+ si~
    si2. la8 sold
    red4-+ si8 dod si2

    %43
    si1

}

Ifgn = \relative do {

    si'2 si
    si2-+~si4. \tuplet 3/4 { la32 si dod }
    si4 la sold-+ fad

    %4
    sold mi' sold mi
    si mi sold mi
    red4.-+(dod16 red) red4.-+(dod16 red)

    %7
    red2-+~red8 red mi fad
    si, la sold fad sold la si mi\mbreak
    mi2 mi

    %10
    mi1-+
    r8 si dod red mi fad sold mi
    si2 si

    %13
    si1-+~
    si
    R1*8

    %23
    si2\f si
    si-+~si4. \tuplet 3/4 { la32 si dod }
    si4 la sold-+ fad

    %26
    sold mi' sold mi
    sold, mi' sold mi
    red4.-+(dod16 red) red4.-+(dod16 red)

    %29
    red2-+~red8 red mi fad
    si,2 \clef bass \key mi\major  r4 mi,,
    la2 la

    %32
    la1\mbreak
    lad'
    si

    %35
    lad
    si
    \clef tenor \key mi\major mi2 mi

    %38
    mi4 red mi dod
    si2 si\mbreak
    si sold'~

    %41
    sold2. fad8 mi
    red4-+ mi si si,
    mi1

}

Itmpn = \relative do {

    mi2 mi
    mi1
    mi4 si mi si

    %4
    mi2 r
    mi4 si mi mi
    si2 r

    %7
    si4 si si si
    mi2 mi\mbreak
    mi r

    %10
    mi mi
    si mi
    si r

    %13
    si si
    si1
    R1*8

    %23
    mi2\f mi
    mi1
    mi4 si mi si\mbreak

    %26
    mi2 r
    mi4 si mi mi
    si2 r

    %29
    si4 si si si
    mi2 r2
    R1*8
    si2 si\mbreak
    mi1

    %41
    R
    r2 si4 si
    mi1

}

Ibcn = \relative do {

    mi2 mi
    mi1
    mi4 si mi si

    %4
    mi2 r
    mi4 si mi mi,
    si'2 r

    %7
    si'4 si, si' si,
    mi2 mi\mbreak
    mi r

    %10
    mi mi
    red mi
    si r

    %13
    si si
    si1
    R1*8

    %23
    mi2\f mi
    mi1
    mi4 si mi si\mbreak

    %26
    mi2 r
    mi4 si mi mi,
    si'2 r

    %29
    si'4 si, si' si,
    mi2 r4 mi,
    la2 la

    %32
    la1\mbreak
    R1*4
    sold2 sold

    %38
    la4 si dod la
    si2 si\mbreak
    mi1

    %41
    la,~
    la4 sold8 la si4 si
    mi,1

}

Ibfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 55
    s1*14
    \bar ":..:"\break
    s1*29
    \bar ":|."

}


IvlI = {
    \Iglobal
    %\notypeset
    <<\IvlIn \forma>>
}


IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>
}


IhbI = {
    \Iglobal
    <<\IhbIn \forma>>
}


IhbII = {
    \Iglobal
    <<\IhbIIn \forma>>
}


IcrI = {
    \Iglobal
    <<\IcrIn \forma>>
}


Ihc = {
    \Iglobal
    \clef alto
    <<\Ihcn \forma>>
}


Ifg = {
    \Iglobal
    \clef tenor
    <<\Ifgn \forma>>
}


Itmp = {
    \Iglobal
    \clef bass
    <<\Itmpn \forma>>
}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    %\typeset
}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

IIvlIn = \relative do'' {

    sold2~sold8 la(sold-+ fad)
    fad2. sold8-+(fad16 sold)
    la4 la sold8-+(fad) sold-+(fad)

    %4
    \afterGrace mi1 ({red8)}
    mi2. \tuplet 3/2 { la8(fad red) }
    mi2.~ mi8(red16-+ dod)

    %7
    si4 mi16(red8.) fad16(mi8.) sold4
    la4. (sold16-+  fad32 sold) fad2\mbreak
    fad2~fad8(sold) fad(si)

    %10
    si2.(lad8-+) r
    fad2~fad8(sold) fad(la?)
    la2.(sold8-+) r

    %13
    dod2\f red8-+\p(dod) red(mi)
    dod2\f red8-+\p(dod) red(mi)
    si4 sold'~sold8(fad-+) mi(fad)

    %16
    mi1 mi

}

IIvlIIn = \relative do'' {

    mi,2~mi8 fad (mi-+ red)
    red2. mi8-+(red16 mi)
    fad4 fad si,8-+(la) si-+(la)

    %4
    sold4 sold~sold8. (la16 sold4)
    r la~la8.(si16 la4)
    r sold~sold8.(la16 sold4)

    %7
    r sold16(si8.) si16(mi8.) mi4
    fad4.(mi16-+ red32 mi) red2
    red2~red8(mi) red(sold)

    %10
    sold2.(fad8-+) r
    red2~red8(mi) red(fad)
    fad2.(mi8-+) r

    %13
    mi2\f fad8-+\p(mi) fad(sold)
    mi2\f fad8-+\p(mi) fad(sold)
    mi4 si'~si8(la-+) sold(la)

    %16
    sold1 sold

}

IIclIn = \relative do'' {

    sold'2~sold8 la(sold-+ fad)
    fad2. sold8-+(fad16 sold)
    la4 la sold8-+(fad) sold-+(fad)

    %4
    \afterGrace mi1 ({red8)}
    mi2. \tuplet 3/2 { la8(fad red) }
    mi2.~ mi8(red16-+ dod)

    %7
    si4 mi16(red8.) fad16(mi8.) sold4
    la4. (sold16-+  fad32 sold) fad2\mbreak
    fad2~fad8(sold) fad(si)

    %10
    si2.(lad8-+) r
    fad2~fad8(sold) fad(la?)
    la2.(sold8-+) r

    %13
    dod,2  red8-+(dod) red(mi)
    dod2 red8-+(dod) red(mi)
    si4 sold'~sold8(fad-+) mi(fad)

    %16
    mi1 mi

}

IIclIIn = \relative do'' {

    mi2~mi8 fad (mi-+ red)
    red2. mi8-+(red16 mi)
    fad4 fad si,8-+(la) si-+(la)

    %4
    sold4 sold~sold8. (la16 sold4)
    r la~la8.(si16 la4)
    r sold~sold8.(la16 sold4)

    %7
    r sold16(si8.) si16(mi8.) mi4
    fad4.(mi16-+ red32 mi) red2
    red2~red8(mi) red(sold)

    %10
    sold2.(fad8-+) r
    red2~red8(mi) red(fad)
    fad2.(mi8-+) r

    %13
    mi,2 fad8-+(mi) fad(sold)
    mi2 fad8-+(mi) fad(sold)
    mi4 si'~si8(la-+) sold(la)

    %16
    sold1 sold

}

IIcrIn =  %\transpose do mi, {

    \relative do'' {
        \key do\major
        sol1
        sol
        sol

        %4
        do,~
        do~
        do~

        %7
        do4 do do do
        sol'1
        sol

        %10
        sol2 mi'16(re mi fad) sol4
        sol,1
        do4.(re16 mi fa sol la si) \grace si8 do4

        %13
        do,,2 r
        do r
        do4 sol'2 sol4

        %16
        sol1 sol

    }
%}

IIcrIIn =  %\transpose do mi, {

    \relative do {
        \key do\major
        do1
        sol'
        sol,

        %4
        do~
        do~
        do~

        %7
        do4 do do do
        sol1
        sol'

        %10
        sol,
        sol'2 sol
        do,1

        %13
        do2 r
        do r
        do sol

        %16
        do1 do

    }

%}

IIfgn = \relative do {

    mi4\p mi'(mi mi)
    si,4\f si'\p(si si)
    si,4\f si'\p(si si)

    %4
    mi,\f  si'\p~si8.(dod16) si4
    r dod~dod8.(re16) dod4
    r si~si8.(dod16) si4

    %7
    r mi, mi mi,
    si' si' si,2
    si4\f si'\p(si si)

    %10
    si,4\f si'\p(si si)
    si,4\f si'\p(si si)
    mi,\f mi'\p(mi mi)

    %13
    la,,\f~la r2
    la4~la r2
    sold4\p mi si' si

    %16
    mi,2 mi''8\f si sold mi mi,1

}

IIbcn = \relative do {

    mi4 mi'(mi mi)
    si,4\f si'\p(si si)
    si,4\f si'\p(si si)

    %4
    mi,,\f mi'\p(sold mi)
    mi,\f mi'\p(la mi)
    mi,\f mi'\p(sold mi)

    %7
    mi,\f mi'\p mi mi,
    si' si' si,2
    si4\f si'\p(si si)

    %10
    si,4\f si'\p(si si)
    si,4\f si'\p(si si)
    mi,\f mi'\p(mi mi)

    %13
    la,,\f~la r2
    la4~la r2
    sold4\p mi si' si

    %16
    mi,2 mi''8\f si sold mi mi,1

}

IIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 60
    s1*8
    \bar ":..:" \break
    \repeat volta 2 {s1*7}
    \alternative {{s1}{s}}
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


IIclI = {
    \IIglobal
    <<\IIclIn \forma>>
}


IIclII = {
    \IIglobal
    <<\IIclIIn \forma>>
}


IIcrI = {
    \IIglobal
    <<\IIcrIn \forma>>
}


IIcrII = {
    \IIglobal
    \clef bass
    <<\IIcrIIn \forma>>
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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

IIIvlIn = \relative do'' {

    si2 si4 mi
    mi2(red4-+) mi
    \appoggiatura red8 dod4 la'8 \parentSlur (fad) mi4 red-+

    %4
    mi2 si
    mi8-+(red) mi-+(red) mi si-. mi-. sold-.
    fad-+(mid) fad-+(mid) fad si,-. fad'-. la-.

    %7
    sold(si) sold(mi) la(fad) sold(mi)
    fad1-+\mbreak
    si,2 si4 mi

    %10
    mi2(red4-+) mi
    \appoggiatura red8 dod4 la'8 fad mi4 red-+
    mi2 si

    %13
    mi8-+(red) mi-+(red) mi si-. mi-. sold-.
    fad-+(mid) fad-+(mid) fad si,-. fad'-. la-.
    sold la si mi, sold4 fad-+

    %16
    mi1
    sold2 mi4.-+(red16 mi)
    fad2 si,

    %19
    mi4.(fad16 sold) fad4 mi
    mi2-+ red
    red,8 si' lad si red, si' mi, si'

    %22
    fad4 r r2
    red8 si' lad si red, si' mi, si'
    fad4 r r2\mbreak

    %25
    r4 sold'8 fad mi red dod si
    lad-+ sold fad-+ mid fad2
    fad fad4 si

    %28
    si2(lad4-+) si
    \appoggiatura lad8 sold4 mi'8(dod) si4 lad-+
    si2 fad

    %31
    si8\p-+(lad) si-+(lad) si fad-. si-. red-.
    dod-+(sid) dod-+(sid) dod fad,-. dod'-. mi-.\mbreak
    red mi fad si, red4 dod-+

    %34
    si1\< ~
    si
    si2\! si4 mi

    %37
    sold2 dod,4.(red16 mi)
    mi4(red-+) sold,2
    fad'4.(sold16 la) sold4 fad\mbreak

    %40
    \grace fad8 mi2\prall \grace red8 dod2
    mi,4\p~mi r2
    red4~red r2

    %43
    mi2 red4-+ dod
    si'2 r
    fad'\f  mi8(red) dod(mi)

    %46
    mi(red) dod(sid) dod4 mi8(sold)
    fad2 mi8(red) dod(mi)\mbreak
    mi(red) dod(sid) dod4 sold'8 dod

    %49
    si la sold fad \grace mi red4.-+(dod16 red)
    dod1
    R1*4\mbreak

    %55
    fad8 _\markup {\dynamic f  \italic "en diminuant" } sold la sold fad mi red dod
    red mi fad mi red dod si la
    sold la si la la sold fad mi

    %58
    fad2 si,
    R1
    si'2 si4 mi

}

IIIvlIIn = \relative do'' {

    mi,2 mi4 sold
    sold2(fad4-+) sold
    \appoggiatura fad8 mi4 la sold fad-+

    %4
    \appoggiatura fad8 sold2 \appoggiatura fad8 mi2
    sold8-+(fad) sold-+(fad) sold si-. si-. mi-.
    red-+(dod) red-+(dod) red si-. red-. fad-.

    %7
    mi4 si si mi
    red1-+\mbreak
    mi,2 mi4 sold

    %10
    sold2(fad4-+) sold
    \appoggiatura fad8 mi4 la sold-+ fad-+
    \appoggiatura fad8 sold2 \appoggiatura fad8 mi2

    %13
    sold8-+(fad) sold-+(fad) sold si-. si-. mi-.
    red-+(dod) red-+(dod) red si-. red-. fad-.
    mi4 mi2 red4-+

    %16
    mi1\fermata
    si2 si
    si1

    %19
    si4.(dod16 red) dod4 lad-+
    si1
    red,8 si' lad si red, si' mi, si'

    %22
    fad4 r r2
    red8 si' lad si red, si' mi, si'
    fad4 r r2\mbreak

    %25
    r4 sold'8 fad mi red dod si
    lad-+ sold fad-+ mid fad2
    si, si4 red

    %28
    red2(dod4-+) red
    \appoggiatura dod si4 mi red-+ dod
    \appoggiatura dod8 red2 \appoggiatura dod8 si2

    %31
    red8\p-+(dod) red(dod) red-. fad-. fad-. si-.
    lad-+(sold) lad-+(sold) lad fad-. lad-. dod-.\mbreak
    si4 si2 lad4-+

    %34
    si8 si,\f dod si red si fad' si,
    la si dod si red si fad' la,
    <mi' sold,>2 mi4 sold

    %37
    sold'2 dod,4.(red16 mi)
    mi4(red-+) sold,2
    fad'4.(sold16 la) sold4 fad\mbreak

    %40
    \grace fad8 mi2\prall \grace red8 dod2
    dod,4~dod r2
    sid4 ~sid r2

    %43
    dod sid4 dod
    sold1
    fad''2\f  mi8(red) dod(mi)

    %46
    mi(red) dod(sid) dod4 mi8(sold)
    fad2 mi8(red) dod(mi)\mbreak
    mi(red) dod(sid) dod4 sold'8 dod

    %49
    si la sold fad \grace mi red4.-+(dod16 red)
    dod1
    lad,8 fad' dod fad lad, fad' dod fad

    %52
    si, fad' red fad si, fad' red fad
    sold, mi' si mi sold, mi' si mi
    la,? mi' dod mi la, mi' dod mi\mbreak

    %55
    la si dod si la si la sold
    fad sold la sold fad mi red fad
    mi4 si2 mi4

    %58
    red-+ si'16\f(lad si8) si,4 si'16-+(lad si8)
    dod,4 si'16(lad si8) red,4 si'16-+(lad si8)
    mi,2 mi4 sold

}

IIIclIn = \relative do'' {

    si2 si4 mi
    mi2(red4-+) mi
    \appoggiatura red8 dod4 la'8 \parentSlur (fad) mi4 red-+

    %4
    mi2 si
    mi8-+(red) mi-+(red) mi si-. mi-. sold-.
    fad-+(mid) fad-+(mid) fad si,-. fad'-. la-.

    %7
    sold(si) sold(mi) la(fad) sold(mi)
    fad1-+\mbreak
    si,2 si4 mi

    %10
    mi2(red4-+) mi
    \appoggiatura red8 dod4 la'8 fad mi4 red-+
    mi2 si

    %13
    mi8-+(red) mi-+(red) mi si-. mi-. sold-.
    fad-+(mid) fad-+(mid) fad si,-. fad'-. la-.
    sold la si mi, sold4 fad-+

    %16
    mi1\fermopz
    sold2 mi4.-+(red16 mi)
    fad2 si,

    %19
    mi4.(fad16 sold) fad4 mi
    mi2-+ red
    R1

    %22
    r4 dod(red) mi
    \appoggiatura mi8 red4 r r2
    r4 dod8(red) red(mi) mi(red)\mbreak

    %25
    red4 sold8 fad mi red dod si
    fad'1
    R1*4

    %31
    si,4 r r8 fad-. si-. red-.
    dod-+(sid) dod-+(sid) dod fad,-. dod'-. mi-.\mbreak
    red mi fad si, red4 dod-+

    %34
    si1 ~
    si
    si2 si4 mi

    %37
    sold2 dod,4.(red16 mi)
    mi4(red-+) sold,2
    fad'4.(sold16 la) sold4 fad\mbreak

    %40
    \grace fad8 mi2\prall \grace red8 dod2
    sold'1~
    sold~

    %43
    sold~
    sold
    R1*7

    %52
    r4 fad(lad-+ si)
    R1
    r4 mi,(sold-+ la?)

    %55
    R1*2
    r4 si,8(mi) mi(sold) sold(si)
    si1~

    %59
    si
    si,2 si4 mi

}

IIIclIIn = \relative do'' {

    mi,2 mi4 sold
    sold2(fad4-+) sold
    \appoggiatura fad8 mi4 la sold fad-+

    %4
    \appoggiatura fad8 sold2 \appoggiatura fad8 mi2
    sold8-+(fad) sold-+(fad) sold si-. si-. mi-.
    red-+(dod) red-+(dod) red si-. red-. fad-.

    %7
    mi4 si si mi
    red1-+\mbreak
    mi,2 mi4 sold

    %10
    sold2(fad4-+) sold
    \appoggiatura fad8 mi4 la sold-+ fad-+
    \appoggiatura fad8 sold2 \appoggiatura fad8 mi2

    %13
    si''1~-.
    si~
    si4 mi,2 red4-+

    %16
    mi1\fermopz
    si1~
    si~

    %19
    si2 lad-+
    si1
    R

    %22
    r4 lad(si) dod
    \appoggiatura dod8 si4 r r2
    r4 lad8(si) si(dod) dod(si)\mbreak

    %25
    si4 mi8 red dod si lad si
    fad1
    R1*4

    %31
    r2 r8 fad-. fad-. si-.
    lad4 r r8 fad-. lad-. dod-.\mbreak
    si4 si2 lad4-+

    %34
    si1~
    si
    mi,2 mi4 sold

    %37
    sold'2 dod,4.(red16 mi)
    mi4(red-+) sold,2
    fad'4.(sold16 la) sold4 fad\mbreak

    %40
    \grace fad8 mi2\prall \grace red8 dod2
    sold'2 la8(sold) mi(sold)
    sold2 la8(sold) red(sold)

    %43
    sold4(fad8-+ mi) fad(red) mi(dod)
    red1-+
    R1*6

    %51
    dod4.-+(si16 dod) fad4 dod
    \appoggiatura dod8 red4 r r2
    si4.-+(la16 si) mi4 si

    %54
    dod r r2\mbreak
    R1*2
    r4 si8(mi) mi(sold) sold(si)

    %58
    si1~
    si
    mi,,2 mi4 sold

}

IIIcrIn =  %\transpose do mi, {

    \relative do'' {
        \key do\major

        sol2. r4
        sol2 r4 do
        do2 sol

        %4
        sol1
        r2 r8 do do do,
        sol'2 r8 sol' sol sol,

        %7
        do4 mi re do
        sol'1\mbreak
        sol,2 r

        %10
        sol2 r4 do
        do2 sol
        sol1

        %13
        r2 r8 do do do,
        sol'2 r8 sol' sol sol,
        do4 do sol sol

        %16
        mi1\fermata
        R1*10
        re'1~

        %28
        re2. r4
        mi2 re
        re1

        %31
        sol,2 r4 sol
        re'2 r4 re\mbreak
        sol sol, re' re

        %34
        sol,1\<~
        sol
        sol2.\! r4

        %37 OOKK
        R1*14
        re'1~
        re

        %53
        do~
        do\mbreak
        re

        %56
        sol,
        do,
        sol~

        %59
        sol
        sol'2. r4

   % }

}

IIIcrIIn =  %\transpose do mi, {

    \relative do {
        \key do\major

        do2. r4
        sol2 r4 do
        do2 sol

        %4
        do1
        do4 do r2
        sol4 sol r2

        %7
        do4 do sol' do,
        sol1\mbreak
        do2 r

        %10
        sol r4 do
        do2 sol
        do1

        %13
        do4 do r2
        sol4 sol r2
        do4 do sol sol

        %16
        do1\fermata
        R1*17
        sol1\<~

        %35
        sol
        do2.\! r4
        R1*20

        %57
        do1
        sol~
        sol

        %60
        do2. r4

    %}

}

IIIhcn = \relative do'' {

    si,2 si4 mi
    mi2(red4-+) mi
    \appoggiatura red8 dod4 la'8 (fad) mi4 red-+

    %4
    mi2 si
    mi8-+(red) mi-+(red) mi4 r
    fad8-+(mid) fad\parenthesize -+(mid) fad4 r

    %7
    sold8\parentSlur (si) sold\parentSlur (mi) la\parentSlur (fad) sold\parentSlur (mi)
    fad1-+\mbreak
    si,2 si4 mi

    %10
    mi2(red4-+) mi
    \appoggiatura red8 dod4 la'8 (fad) mi4 red-+
    mi2 si

    %13
    mi8-+(red) mi\parenthesize -+(red) mi4 r
    fad8-+(mid) fad-+(mid) fad4 r
    sold8 la si mi, sold4 fad-+

    %16
    mi1\fermata
    sold2 mi4.-+(red16 mi)
    fad2 si,

    %19
    mi4.(fad16 sold) fad4 mi
    mi2-+ red
    red8 si' lad si red, si' mi, si'

    %22
    fad4 r r2
    red8 si' lad si red, si' mi, si'
    fad4 r r2\mbreak

    %25
    r8 si mi red dod si lad sold
    fad4 dod fad2
    fad fad4 si

    %28
    si2(lad4-+) si
    \appoggiatura lad8 sold4 mi'8 dod si4 lad-+
    si2 fad

    %31
    fad4 fad r2
    fad4 fad r2\mbreak
    fad4 fad2 mi4

    %34
    red8 si dod si red si fad' si,
    la si dod si red si fad' la,
    <mi' sold,>2 si4 mi

    %37 OOKK
    sold2 dod
    dod(sid4-+) r
    red2(dod4-+) sid\mbreak

    %40
    dod1
    dod,4~dod r2
    sid4 ~sid r2

    %43
    dod2 sid4 dod
    sold1
    red'2 mi

    %46
    la sold
    red mi\mbreak
    la sold

    %49
    dod sid-+
    dod1
    lad,8 fad' dod fad lad, fad' dod fad

    %52
    si, fad' red fad si, fad' red fad
    sold, mi' si mi sold, mi' si mi
    la,? mi' dod mi la, mi' dod mi\mbreak

    %55
    fad2 fad,
    si red,
    mi1

    %58
    si'4 si'16-+\ff(lad si8) red,4 si'16-+(lad si8)
    mi,4 si'16-+(lad si8) fad4 si16-+(lad si8)
    sold2 si,4 mi

}

IIIbcn = \relative do {

    mi8\tu si' sold mi mi si' sold mi
    si si' fad si  si, si' sold mi
    la sold la fad si lad si si,

    %4
    mi si mi sold mi si sold si
    mi,4 mi r2
    si'4 si r2

    %7
    mi4 mi red mi
    si8 dod red mi fad sold la si\mbreak
    mi, si' sold mi mi si' sold mi

    %10
    si si' fad si  si, si' sold mi
    la sold la fad si lad si si,
    mi si mi sold mi si sold si

    %13
    mi,4 mi r2
    si'4 si r2
    mi4 mi, si' si

    %16
    mi,1\fermata
    mi'8 si' mi red mi red mi mi,
    red si' red dod red dod red red,

    %19
    dod sold' dod si lad dod fad, lad
    si, fad' si lad si red si fad
    red si' lad si red, si' mi, si'

    %22
    fad4 r r2
    red8 si' lad si red, si' mi, si'
    fad4 r r2\mbreak

    %25
    r8 si mi red dod si lad sold
    fad4 dod fad,2
    fad'8 red' si red fad, red' si red

    %28
    fad, mi' dod mi fad, red' si red
    mi, si' sold mi fad mi fad fad,
    si fad' si red si fad red fad

    %31
    si,4\p si r2
    fad'4 fad r2\mbreak
    si4 si, fad' fad,

    %34
    <<
        {
            si8  si'\f dod si \stemDown red si fad' si,\stemUp
            la si dod si \stemDown red si fad' la,\stemUp
            sold
        }\\{
            si,1~
            si
            mi8 si' sold mi mi si' sold mi
        }
    >>

    %37
    dod8 sold' mi dod dod sold' mi dod
    sold sold' red sold sold, sold' fad sold
    sid, sold' fad sold sold, sold' fad sold\mbreak

    %40
    dod, sold' dod mi dod sold mi sold
    dod,4 r r2
    R1*3

    %45
    la'8 red mi fad sold, dod red mi
    fad, sid dod red mi, sold dod mi
    la, red mi fad sold, dod red mi\mbreak

    %48
    fad, sid dod red mi, sold dod mi
    fad,4 la sold sold,
    dod8 sold' mi dod sold mi dod4

    %51
    R1*4
    fad''2_\markup {\dynamic f  \italic "en diminuant" }  fad,
    si si,

    %57
    mi mi,
    si'4 r <<
        {
            si2
            dod red

            %60
            mi8 si' sold mi
        }\\{
            \stemUp\shiftOn si,2_\markup{\dynamic ff \italic"B[as]sons"}
            dod red
            mi8
        }
    >> mi' si' sold mi

}

IIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 40
    s1
    \mark\markup {\segno}
    s1*14
    \once \override Score.RehearsalMark.extra-offset = #'(+6 . +2)\mark\markup "Fin"
    s1 \bar "|." \break
    \repeat volta 2 {s1
    \once \override Score.RehearsalMark.extra-offset = #'(-10 . +1.5)
    \mark\markup "I.er Couplet"
    s1*18
    \once \override Score.RehearsalMark.extra-offset = #'(+8 . +0)
    \mark\markup \smaller\center-align{Le Rondeau \segno}
    s1} \break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup "2.e Couplet"
    \repeat volta 2 {s1*24
    \mark\markup {Al \segno}}

}


IIIvlI = {
    \IIIglobal
    %\notypeset
    <<\IIIvlIn \forma>>
}


IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>
}


IIIclI = {
    \IIIglobal
    <<\IIIclIn \forma>>
}


IIIclII = {
    \IIIglobal
    <<\IIIclIIn \forma>>
}


IIIcrI = {
    \IIIglobal
    <<\IIIcrIn \forma>>
}


IIIcrII = {
    \IIIglobal
    \clef bass
    <<\IIIcrIIn \forma>>
}


IIIhc = {
    \IIIglobal
    \clef alto
    <<\IIIhcn \forma>>
}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

IVvlIn = \relative do'' {

    mi4
    sold4. fad8 mi4-+
    fad si, mi
    fad fad(sold8\prall) la

    %4
    fad2-+ si4
    si4. la8 sold4
    fad-+ mi fad

    %7
    fad(sold8.) la16 fad4-+
    mi2 r4
    R2.*3

    %12
    r2 si'4_\markup\italic "a demi"
    si(dod8.\prall ) si16 la4
    \grace la8 si4 \grace la8 sold4 si

    %15
    si4.(la16-+) si \grace la8 sold4
    fad2-+ fad4\p sold4. lad8 si4
    si8.(lad16-+) \grace sold8 fad4 si

    %18
    si4. si8 lad4-+
    si2 mi,4
    sold_\markup\italic "a demi"

    %21
    sold4. fad8 mi4
    \grace mi8 red4 \grace dod8 sid4 dod
    red red(mi8.) fad16

    %24
    red2-+ sold4
    sold4.-+ fad8 sold4
    \grace sold8 la4 \grace sold8 fad4 lad

    %27
    lad?4. sid8 dod4
    sid2-+ dod4
    dod8(si) la[(sold)] la(mid)

    %30
    fad(sold) la[(fad)] sold(red)
    red4(mi8.\prall) fad16 red4-+
    dod2 mi4

}

IVvlIIn = \relative do'' {

    mi4
    mi4. red8 dod4
    red-+ fad si,
    la(sold8.-+)(la16) si8. mi16

    %4
    red2-+ mi4
    \grace red8 dod2~dod8(red16 mi)
    red4-+ mi dod

    %7
    si4. mi8 red4-+
    \grace red8 mi2 r4
    R2.*3

    %12
    r2 sold4_\markup\italic "a demi"
    sold (la8.\prall) sold16 fad4-+
    \grace fad8 sold4 \grace fad8 mi4 sold

    %15
    sold4.(fad16-+) sold \grace fad8 mi4
    red2-+  red8.\p fad16
    si,2 mi4

    %18
    dod2-+ fad4
    fad4. dod8 mi4
    red2-+ mi4\mbreak
    mi_\markup\italic "a demi"

    %21
    mi4. red8 dod4
    \grace dod8 sid4 \grace lad8 sold4 lad
    sid sid(dod8.\prall) red16

    %24
    sid2-+ mid4
    mid?4. -+red8 mid4
    \grace mid?8 fad4 dod fad

    %27
    fad4.(sold8) mi4
    red2-+ sold4
    sold dod, si

    %30
    la8(si) dod4 red
    sold, dod sid-+
    \grace sid?8 dod2 mi4

}

IVhbIn = \relative do'' {

    mi4
    sold4. fad8 mi4-+
    fad si, mi
    fad fad(sold8\prall) la

    %4
    fad2-+ si4
    si4. la8 sold4
    fad-+ mi fad

    %7
    fad(sold8.) la16 fad4-+
    mi2 si'4\p
    si4. la8 sold4

    %10
    fad mi fad-+\mbreak
    fad4(sold8.) la16 fad4-+
    mi2 sold4_\markup\italic "a demi"

    %12
    sold(la8.) sold16 fad4
    \grace fad8 sold4 \grace fad8 mi4 si'

    %15
    si4.(la16-+) si \grace la8 sold4
    fad2-+ fad4\p sold4. lad8 si4
    si8.(lad16-+) \grace sold8 fad4 si

    %18
    red,4. mi8 dod4-+
    si2 mi4
    sold_\markup\italic "a demi"

    %21
    sold4. fad8 mi4
    \grace mi8 red4 \grace dod8 sid4 dod
    red red(mi8.) fad16

    %24
    red2-+ sold4
    sold4.-+ fad8 sold4
    \grace sold8 la4 \grace sold8 fad4 lad

    %27
    lad?4. sid8 dod4
    sid2-+ dod4
    dod8(si) la[(sold)] la(mid)

    %30
    fad(sold) la[(fad)] sold(red)
    red4(mi8.\prall) fad16 red4-+
    dod2 mi4

}

IVhbIIn = \relative do'' {

    mi4
    mi4. red8 dod4
    red-+ fad si,
    la(sold8.-+)(la16) si8. mi16

    %4
    red2-+ mi4
    \grace red8 dod2~dod8(red16 mi)
    red4-+ mi dod

    %7
    si4. mi8 red4-+
    \grace red8 mi2  sold4\p
    sold4. fad8 mi4

    %10
    red-+ mi mi\mbreak
    mi4. mi8 red4-+
    mi2 sold4_\markup\italic "a demi"

    %13
    sold (la8.\prall) sold16 fad4-+
    \grace fad8 sold4 \grace fad8 mi4 sold

    %15
    sold4.(fad16-+) sold \grace fad8 mi4
    red2-+  red8.\p fad16
    si,2 mi4

    %18
    dod2-+ fad4
    fad4. dod8 mi4
    red2-+ mi4\mbreak
    mi_\markup\italic "a demi"

    %21
    mi4. red8 dod4
    \grace dod8 sid4 \grace lad8 sold4 lad
    sid sid(dod8.\prall) red16

    %24
    sid2-+ mid4
    mid?4. -+red8 mid4
    \grace mid?8 fad4 dod fad

    %27
    fad4.(sold8) mi4
    red2-+ sold4
    sold dod, si

    %30
    la8(si) dod4 red
    sold, dod sid-+
    \grace sid?8 dod2 mi4

}

IVcrIn = %\transpose do mi, {

    \relative do'' {
        \key do\major

        do4
        mi4. re8 do4
        re sol, do
        re re(mi8) fa

        %4
        re2-+ sol4
        sol4. fa8 mi4
        re-+ do re

        %7
        re(mi8.)fa16 re4-+
        do2 r4
        R2.*3

        %12
        r2 r4
        R2.*8
        r4 R2.

        %22
        R2.*11

    %}

}


IVcrIIn = %\transpose do mi, {

    \relative do'' {
        \key do\major

        sol4
        sol2.
        sol2 do4
        sol do2

        %4
        sol mi'4
        mi4. re8 do4
        sol mi do'

        %7
        do4. do8 sol4
        mi2-+ r4
        R2.*3

        %12
        r2 r4
        R2.*8
        r4 R2.

        %22
        R2.*11

    %}

}

IVfgn = \relative do {

    mi'4
    mi2 mi,4
    si' la sold
    red mi2

    %4
    si sold'4
    la4. sold8 la4
    si dod la-+

    %7
    si4. si8 si,4
    mi2 sold4\p
    la4. sold8 la4
    si dod la8.-+(sold32 la)\mbreak
    si4. si8 si,4

    %12
    mi2 mi4_\markup\italic "a demi"
    la,2 la4
    mi2 mi''4

    %15
    mi4.(red16-+) red mi4
    si2 si,4\p
    mi4. red8 dod4

    %18
    fad mi red
    sold4. mi8 fad4
    si,2 mi'4

    %21
    dod4_\markup\italic "a demi"
    dod4. sid8 dod4
    sold fad mi
    red dod2

    %24
    sold dod'4
    dod4. dod8 dod,4
    fad2 mi4

    %27
    red2 red4
    sold2 r4
    mid fad sold

    %30
    la8(sold) fad4 sid,
    dod fad, sold
    dod,2 mi''4



}

IVbcn = \relative do {

    mi'4
    mi2 mi,4
    si' la sold
    red mi2

    %4
    si sold'4
    la4. sold8 la4
    si dod la-+

    %7
    si4. si8 si,4
    mi2 r4
    R2.*3

    %12
    r2 mi4_\markup\italic "a demi"
    la,2 la4
    mi2 mi''4

    %15
    mi4.(red16-+) red mi4
    si2 si,4\p
    mi4. red8 dod4

    %18
    fad mi red
    sold4. mi8 fad4
    si,2 mi'4

    %21
    dod4_\markup\italic "a demi"
    dod4. sid8 dod4
    sold fad mi
    red dod2

    %24
    sold dod'4
    dod4. dod8 dod,4
    fad2 mi4

    %27
    red2 red4
    sold2 r4
    mid fad sold

    %30
    la8(sold) fad4 sid,
    dod fad, sold
    dod,2 mi''4

}

IVbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 50
    \partial 4 s4
    \once \override Score.RehearsalMark.extra-offset = #'(+0 . -1) \mark \markup {\segno}
    s2.*11
    \once \override Score.RehearsalMark.extra-offset = #'(  +5 . +1) \mark\markup "Fin" \set Score.measureLength = #(ly:make-moment 2 4) s2 \bar "|."\break
    \set Score.measureLength = #(ly:make-moment 1 4) s4
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup "I.er Couplet"
    \set Score.currentBarNumber = #13
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.*7
    \once \override Score.RehearsalMark.extra-offset = #'(+8 . +2)
    \mark\markup\smaller {Al\segno}
    s2. \break \bar ":|."
    \set Score.measureLength = #(ly:make-moment 1 4) s4
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup "2.e Couplet"
    \set Score.currentBarNumber = #21
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.*12
    \bar "|."
    \mark\markup {Al \segno}

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


IVhbI = {
    \IVglobal
    <<\IVhbIn \forma>>
}


IVhbII = {
    \IVglobal
    <<\IVhbIIn \forma>>
}


IVcrI = {
    \IVglobal
    <<\IVcrIn \forma>>
}


IVcrII = {
    \IVglobal
    <<\IVcrIIn \forma>>
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



Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

VvlIn = \relative do'' {

    mi8 red16 dod si mi red dod si la sold fad
    mi4 si' mi~
    mi8. fad16 fad4.-+(mi16 fad)

    %4
    sold4 mi si
    sold mi si'
    dod8 mi16 red dod red mi red dod si la sold

    %7
    la8 si,16 si red8 fad si4\mbreak
    sold8 mi16 mi sold8 si mi4
    lad,8 fad16 fad lad8 dod fad4

    %10
    red8 fad16 mi red mi fad mi red dod si la
    sold8 lad16 si dod,8 red16 mi fad8 si16 lad
    si8 lad16 sold fad si lad sold fad mi red dod

    %13
    si2. si\mbreak
    r8 si16 dod red dod si dod red mi fad sold
    la8 fad red[si] si'8. si16

    %16
    si8 mi16 mi mi4. sold8
    dod, red16 red red4. fad8
    sid,16 dod red dod sid dod sid la sold fad mi red

    %19
    mi8 dod'16 dod \once\stemDown dod8 sold,16 sold \once\stemUp sold8 dod'16 sid\mbreak
    dod,8. \tuplet 3/2 { dod32 red mid } fad4. fad16 mid
    la8 la16 sold fad sold la sold fad mi? red dod

    %22
    si16.  dod32 red mi fad sold  la4. la16 fad
    si8 si16 la sold la si la sold fad mi red
    dod16. red32 mi fad sold la si4. si16 sold\mbreak

    %25
    dod8 dod16 si la si dod si la sold fad mi
    red8 si16 si red8 fad si4
    sold8 mi16 mi sold8 si mi4

    %28
    dod8 fad,16 fad la8 dod fad4
    red8  fad16 mi red mi fad mi red dod si la
    sold8 sold'16 fad mi fad sold fad mi red dod si\mbreak

    %31
    dod8 red16 mi fad,8 sold16 la \once\stemUp si,8 mi'16 red
    mi8 red16 dod si mi red dod si la sold fad
    mi4 r r mi'8 red16 dod si mi red dod si la sold fad mi4 r r

}

VhcIn = \relative do'' {

    R2.
    mi,8 red16 dod si mi red dod si la sold \parenthesize mi
    la4 fad si

    %4
    si2.
    r8 si16 si si8 si si4
    si8 si16 si la8 la dod4

    %7
    dod8 si16 si si8 si si4\mbreak
    si8 si16 si si8 si sold'4
    dod,8 dod16 dod dod8 dod dod4

    %10
    si8 si16 si si8 si si4
    si4. si16 si si8 fad
    fad2.

    %13
    R R
    R
    r8 fad'16 fad fad8 red16 red red8 fad

    %16
    fad4 mi8 si16 si si8 si
    si4 la la
    sold4. red'16 red sid8 sold

    %19
    dod8. red16 red4.-+ dod8\mbreak
    dod2 r8 dod16 dod
    dod2 r8 fad16 fad

    %22
    fad2 r8 fad16 fad
    fad4 mi r8 sold16 sold
    sold2 r8 sold16 sold\mbreak

    %25
    sold4 fad r8 la16 la
    la4. fad16 fad red8 fad
    si,4. si'16 si si8 si

    %28
    si4. la16 la lad8 dod
    fad,8 fad16 fad fad8 fad fad4
    fad8 mi16 mi sold8 sold si4\mbreak

    %31
    si8 la16 sold la8 la fad si
    sold2.-+ R sold-+
    R

}

VhcIIn = \relative do'' {

    R2.
    mi,8 red16 dod si mi red dod si la sold mi
    la4 fad si

    %4
    sold2.-+
    r8 sold16 sold sold8 sold mi4
    mi8 mi'16 mi  mi8 mi mi4

    %7
    red8 fad16 fad fad8 fad fad4\mbreak
    fad8 si,16 si mi8 mi mi4
    mi8 mi16 mi mi8 dod red4

    %10
    red8 sold16 sold fad8 fad fad4
    fad8 mi16 red mi8 mi dod fad
    mi2.

    %13
    R2. R
    R
    r8 red16 red red8 fad16 fad fad8 la,16 la

    %16
    sold4. mi'16 mi mi8 mi
    mi fad16 fad fad4. la8
    red,4. red16 red sid8 sold

    %19
    dod8. red16 red4.-+ dod8\mbreak
    dod2 r8 dod16 dod
    dod2 r8 la16 la

    %22
    la2 r8 si16 la
    sold2 r8 si16 si
    si2 r8 dod16 si\mbreak

    %25
    la2 r8 fad'16 fad
    fad4. si,16 si la8 fad
    sold4. sold'16 sold sold8 sold

    %28
    sold4. fad16 fad dod8 dod
    si si16 si si8 si si4
    si8 si'16 si si8 si mi,4\mbreak

    %31
    mi4. mi16 mi mi8 si
    si2.  R si
    R

}

Vbcn = \relative do {

    R2.*3
    mi8 red16 dod si mi red dod si la sold fad
    mi8 si'16 si mi8 mi sold,4-+

    %6
    la8 dod16 dod fad8 fad fad,4
    si16 si' la sold fad mi red dod si8 red\mbreak
    mi sold16 fad mi fad mi red dod8 mi

    %9
    fad lad16 sold fad sold fad mi red8 fad
    sold sold16 sold si8 si red,4-+
    mi4. red16 dod fad8 fad,

    %12
    si2.
    si'8 lad16 sold fad si lad sold fad mi red fad r8 si,16 dod red dod si dod red mi fad sold\mbreak
    la8 fad red[si] fad red

    %15
    si'2 r8 r16 si
    mi4. sold16 sold sold8 mi
    la4. fad16 fad fad8 red

    %18
    sold2.
    r16 sold fad mi red dod sid lad  sold8 sold'\mbreak
    la,2 r8 la'16 sold

    %21
    fad2 r8 fad,16 fad
    sold2 r8 si'16 la
    sold2 r8 sold,16 sold

    %24
    la2 r8 dod'16 si\mbreak
    la2 r8 la,16 la
    si si' la sold fad mi red dod si8 red

    %27
    mi16 mi red dod si la sold fad mi8 sold
    la16 fad' mi red dod si la sold fad8 la
    si8 fad'16 fad si8 si red,4-+

    %30
    mi8 si'16 si mi8 mi sold,4-+\mbreak
    la4. sold16 fad si8 si,
    mi2. r16 si dod red mi red mi fad sold fad sold la mi,2. R

}

Vbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 57
    \repeat volta 2 {s2.*12}
    \alternative {{s2.}{s}}\break
    \once \override Score.RehearsalMark.extra-offset = #'(+5 . -0) \mark\markup\italic "Reprise"
    \set Score.currentBarNumber = #14
    \repeat volta 2 {s2.*18}
    \alternative {{s2. s}{ s}}
    s2.
    \bar "|."

}


VvlI = {
    \Vglobal
    %\notypeset
    <<\VvlIn \forma>>
}


VhcI = {
    \Vglobal
    \clef alto
    <<\VhcIn \forma>>
}


VhcII = {
    \Vglobal
    \clef alto
    <<\VhcIIn \forma>>
}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}



VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

VIvlIn = \relative do'' {

    sold'4. la8 sold4.(fad16-+ mi)
    \grace mi8 fad2. sold4
    mi-+ red mi fad

    %4
    red2-+ \grace dod8 si4 r
    r mi8-+(red) mi2
    mi4 mi8-+ red mi4 fad

    %7
    sold fad-+ mi la
    fad2.-+(mi8 fad)
    sold4. la8 sold4.(fad16-+ mi)\mbreak

    %10
    \grace mi8 fad2. sold4
    mi-+ red mi fad
    \grace mi8 red2 \grace dod8 si r r4

    %13
    r mi8-+ red mi2~
    mi4 mi8-+ red mi4 fad
    sold4-+ fad8 mi si4 red-+

    %16
    mi1
    si2 mi
    dod-+ fad~

    %19
    fad4 mi8 red dod4 si\mbreak
    lad2-+ \appoggiatura sold8 fad2
    si4 dod si-+ lad

    %22
    si mi red-+ dod
    fad2 red\prall
    dod1-+

    %25
    dod4 red dod-+ si
    dod4 red dod-+ si
    mi2. fad4

    %28
    red-+ mi fad2~
    fad4 sold8 fad mi4 red\mbreak
    dod4-+ \grace si8 lad4 si dod

    %31
    red2 dod-+
    si1
    sold'2 dod,

    %34
    sid2.-+ dod4
    red mi \grace red8 dod4 red
    \grace red8 mi2 \grace red8 dod2

    %37
    mi2. fad4
    red2.-+ mi4\mbreak
    dod4-+ sid dod red

    %40
    sid1-+
    sold'2 r
    la2. sold4

    %43
    fad-+ \grace mi8 red4 sold2~
    sold4 fad mi-+ \grace red8 dod4
    fad mi red dod

    %46
    sid-+ sold dod red
    mi2 red-+
    dod1\mbreak

    %49
    mi2. mi4
    mi4.-+ red8 mi4 \appoggiatura red8 dod4
    fad2 dod4.(red16 mi)

    %52
    red2-+ \grace dod8 si2
    mi4 fad mi-+ red
    mi4 si mi fad

    %55
    sold4.(fad8) lad4.-+(sold16 lad)
    si1

}

VIvlIIn = \relative do'' {

    si4.(dod8) si4.(la16-+ sold)
    \appoggiatura sold8 la2. si4
    sold-+ fad sold la

    %4
    fad2-. \appoggiatura mi8 red4 r
    <<{mi2 r
       mi2. fad4

       %7
       sold-+  fad  mi la
       \afterGrace fad1-+ ({mi16[fad)]}}\\{si,4 dod si-+ la
                                         si dod si-+ la
                                         si2 dod4 red8 mi
                                         red1-+}>>
    si'4.(dod8) si4. (la16-+ sold)\mbreak

    %10
    \appoggiatura sold8 la2. si4
    sold-+ fad sold la
    fad2-+ \appoggiatura mi8 red r r4

    %13
    <<{mi2 r
       mi2. fad4
       sold-+  fad8  mi si4 red-+}\\{si4 dod (si-+) la8 r
                                         si4 dod (si-+) la8 r
                                         si4. mi8 si4 red}>>
    %16
    mi1
    si2 mi
    dod-+ fad~

    %19
    fad4mi8 red dod4 si\mbreak
    lad2-+ r
    si4 dod si-+ lad

    %22
    si mi red-+ dod
    fad2 red\prall
    dod1-+

    %25
    dod4 red dod-+ si
    dod red dod-+ si
    mi2. fad4

    %28
    red-+ mi fad2~
    fad4 sold8 fad mi4 red\mbreak
    dod4-+ \appoggiatura si8 lad4 si dod

    %31
    red2 dod-+
    si1
    sold'2 dod,

    %34
    sid2.-+ dod4
    red mi \appoggiatura red8 dod4 red
    \appoggiatura red8 mi2 \appoggiatura red8 dod2

    %37
    mi2. fad4
    red2.-+ mi4\mbreak
    dod-+ sid dod red

    %40
    sid1-+
    <<{sold'2 r
       la2. sold4

       %43
       fad-+ \appoggiatura mi8 red4}\\{sid dod sid lad
                                       sid dod sid dod
                                       red r}>> sold2~
       sold4 fad mi \appoggiatura red8 dod4
       fad mi red dod

       %46
       sid sold dod red
       mi2 red-+
       dod1\mbreak

       %49
       mi2. mi4
       mi4.-+ red8 mi4 dod
       fad2 dod4.(red16 mi)

       %52
       red2-+ \grace dod8 si2
       mi4 fad mi-+ red
       mi si mi fad

       %55
       sold4.(lad8) lad4.-+(sold16 lad)
       si1

}

VIfgn = \relative do {

    si'4. dod8 si4. (la16-+ sold)
    \grace sold8 la2. si4
    sold fad sold la

    %4
    fad mi fad la
    sold la  sold4-+ fad8 r
    sold4 la sold-+ fad8 r

    %7
    mi4 red dod la
    si1
    si'4. dod8 si4.(la16-+ sold)\mbreak

    %10
    \grace sold8 la2. si4
    sold-+ fad sold la
    fad-+ mi fad la

    %13
    sold la sold-+ fad8 r
    sold4 la sold-+ fad
    mi la, si si

    %16
   mi,1
    \clef tenor \key mi\major sold'2 dod
    lad red~

    %19
    red4 dod8 si mi4 red\mbreak
    dod si dod mi
    red mi red dod

    %22
    red dod si lad
    si lad si dod
    lad1-+

    %25
    lad4 si lad-+ sold
    lad si lad sold
    sold si lad dod

    %28
    si dod red2~
    red4 mi8 red dod4 si\mbreak
    lad fad~fad fad'

    %31
    fad sold fad mi
    red mi red dod
    mi red mi fad

    %34
    red mi red dod
    sid dod lad sid
    dod red mi fad

    %37
    sold sold la2~
    la4 fad sold2~\mbreak
    sold fad~

    %40
    fad4 sold fad mi
    red mi red dod
    red mi red dod

    %43
    sid2 dod4 sid
    dod2. sold'4
    la sold fad mi

    %46
    red red mi sid
    dod2 sid-+
    dod1\mbreak

    %49
    R
    dod2 dod
    dod1

    %52
    fad4 la sold fad
    sold la sold fad
    sold fad mi red

    %55
    mi sold fad mi
    red1-+

}

VIbcn = \relative do {

    mi1
    si2. si4
    dod2. la4

    %4
    si1
    mi,
    mi

    %7
    mi'4 red dod la
    si1
    mi\mbreak

    %10
    red2. si4
    dod2. la4
    si1

    %13
    mi,
    mi
    mi4 la si si

    %16
    mi,1
    mi'2 dod
    fad, red

    %19
    mi1\mbreak
    fad
    fad

    %22
    fad2 fad'4  mi
    red dod red mi
    fad1

    %25
    fad,
    fad
    dod'2 fad,

    %28
    si2. si4
    mi2 mi,\mbreak
    mi2 red4 mi

    %31
    fad2 fad
    si1
    mi2 dod

    %34
    sold'1
    sold,
    dod

    %37
    dod
    si\mbreak
    la1

    %40
    sold
    sold'
    fad2. mi4

   %43
    red2 mi4 red
    dod1
    fad,4 sold la fad

    %46
    sold2 mi'4 red
    dod fad, sold sold
    dod1\mbreak

    %49
    dod4 si la sold
    la1
    lad

    %52
    si
    si
    si4 la sold fad

    %55
    mi2 fad
    si1

}

VIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 50
    \once \override Score.RehearsalMark.extra-offset = #'(+0 . -1) \mark \markup {\segno}
    s1*15
    \once \override Score.RehearsalMark.extra-offset = #'(  +3 . +1) \mark\markup "Fin"
    s1 \bar "|."\break
    \once \override Score.RehearsalMark.extra-offset = #'(+3 . +1)
    \mark\markup "I.er Couplet"
    s1*15
    \once \override Score.RehearsalMark.extra-offset = #'(+8 . +1)
    \mark\markup \smaller\center-align{Al \segno}
    s1
    \bar ":|."\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup "2.e Couplet"
    s1*24
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup \smaller{Al \segno}
    \bar ":|."

}


VIvlI = {
    \VIglobal
    %\notypeset
    <<\VIvlIn \forma>>
}


VIvlII = {
    \VIglobal
    <<\VIvlIIn \forma>>
}


VIfg = {
    \VIglobal
    \clef bass
    <<\VIfgn \forma>>
}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset
}



VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

VIIvlIn = \relative do'' {

    \stemUp <mi si mi,>4 \stemUp <sold si, mi,>
    <si si, mi,>\stemNeutral  la16 sold fad-+ mi
    dod'8\staccatissimo dod16-+ si32(dod) mi8 dod

    %4
    si4 la16 sold fad-+ mi
    dod'8\staccatissimo dod16-+ si32(dod) mi8 dod
    si mi \afterGrace si4-+ ({la16[si)]}

    %7
    la8\staccatissimo fad\staccatissimo \afterGrace la4-+({sold16[la)]}
    sold8 si la16 sold fad mi
    red8[mi fad sold]\mbreak

    %10
    fad16 mi red dod si la sold fad
    <mi' si mi,>4 \stemUp <sold si, mi,>
    <si si, mi,>\stemNeutral  la16 sold fad-+ mi

    %13
    dod'8\staccatissimo dod16-+ si32(dod) mi8 dod
    si4 la16 sold fad-+ mi
    dod'8\staccatissimo dod16-+ si32(dod) mi8 dod

    %16
    si mi \afterGrace si4-+ ({la16[si)]}
    la8\parenthesize\staccatissimo fad\parenthesize\staccatissimo \afterGrace la4-+({sold16[la)]}
    sold16-+(fad sold) la si8 si

    %19
    la4 fad-+\mbreak
    sold16-+(fad sold) la si8\staccatissimo si\staccatissimo
    la4 \afterGrace fad-+ ({mi16[fad)]}

    %22
    <mi si mi,>2
    <sold, si,>4\p <sold si,>
    <sold si,>8 fad16-+ mi fad8 sold

    %25
    <la si,>4 <la si,>
    <la si,>8 sold16-+ fad sold8 la
    si4 si

    %28
    si8.-+(la32 si) dod8\staccatissimo si\staccatissimo
    si(la) la(sold)
    fad4-+ mi

    %31
    <sold si,>4 <sold si,>
    <sold si,>8 fad16-+ mi fad8 sold\mbreak
    <la si,>4 <la si,>

    %34
    <la si,>8 sold16-+ fad sold8 la
    si4 si
    \afterGrace si4-+ ({la16[si)]} dod8 red

    %37
    mi[fad sold lad]
    \appoggiatura lad? si4 r8 fad16-+\f(mi32 fad)
    si16(lad si) fad  mi red dod-+ si

    %40
    mi-+(red mi) fad\staccatissimo sold-+(fad sold) lad\staccatissimo
    si la? sold fad mi red dod si
    mi-+(red mi) fad\staccatissimo sold-+(fad sold) lad\staccatissimo \mbreak

    %43
    si la? sold fad mi red dod si
    sold' fad mi red mi red dod si
    lad si dod si lad si lad sold

    %46
    fad8 r fad'8.-+(mi32 fad)
    red16 fad si fad red fad dod fad
    red fad si, fad' dod fad mi fad

    %49
    red fad si fad red fad dod fad
    red fad si, fad' dod fad mi fad\mbreak
    red si dod red mi fad sold lad

    %52
    si la? sold fad mi red dod si
    \stemUp <sold' si, mi,>4 r
    <si si, mi,> r

    %55
    <fad si, red,> r
    <si si, mi,> r
    \stemNeutral sold4.-+ fad16 mi

    %58
    red4 dod-+\mbreak
    si2~
    si16\p red dod(mi) red(fad) mi(sold)

    %61
    si, red dod(mi) red(fad) mi(sold)
    fad\< (la) sold(si) la(fad) sold(mi)\!
    si\f red dod(mi) red(fad) mi(sold)

    %64
    fad (la) sold(si) la(fad) sold(mi)
    si'2-+~
    si~

    %67
    si8 la16 sold fad sold fad mi
    red red red red red red red red
    si si si si si si si si

    %70
    sold sold sold sold sold sold sold sold

}

VIIvlIIn = \relative do'' {

    <mi si mi,>8 red16 dod si la sold fad
    mi si' sold si mi, si' sold si
    mi, dod' la dod  mi, dod' la dod

    %4
    mi, si' sold si mi, si' sold si
    mi, dod' la dod  mi, dod' la dod
    mi, si' sold si mi, si' sold si

    %7
    fad si fad si fad si la si
    \once\stemUp mi,8 si'' la16 sold fad mi
    red8[mi fad sold]\mbreak

    %10
    fad16 mi red dod si la sold fad
    <mi' si mi,>4 r
    mi,16 si' sold si mi, si' sold si

    %13
    mi, dod' la dod  mi, dod' la dod
    mi, si' sold si mi, si' sold si
    mi, dod' la dod  mi, dod' la dod

    %16
    mi, si' sold si mi, si' sold si
    fad si fad si fad si fad si
    mi, red' mi fad sold8 sold

    %19
    fad4 red-+\mbreak
    mi16-+(red mi) fad sold8\staccatissimo sold\staccatissimo
    fad4 \afterGrace red-+ ({dod16[red)]}

    %22
    <mi si mi,>2
    mi,4\p mi
    mi8 red16-+ dod red8 mi

    %25
    fad4 fad
    fad8 mi16-+ red mi8 fad
    sold4 sold

    %28
    sold8.-+(fad32 sold) la8\staccatissimo  sold\staccatissimo
    sold(fad) fad(mi)
    red4-+ sold

    %31
    mi mi
    mi8 red16-+ dod red8 mi
    fad4 fad

    %34
    fad8 mi16-+ red mi8 fad
    sold4 sold
    \afterGrace sold4-+ ({fad16[sold)]}  la8 fad

    %37
    sold si4 mi8
    red4-+ r8 fad16\f-+ mi32(fad)
    si16(lad si) fad  mi red dod-+ si

    %40
    mi-+(red mi) fad\staccatissimo sold-+(fad sold) lad\staccatissimo
    si la? sold fad mi red dod si
    mi-+(red mi) fad\staccatissimo sold-+(fad sold) lad\staccatissimo \mbreak

    %43
    si la? sold fad mi red dod si
    sold' fad mi red mi red dod si
    lad si dod si lad si lad sold

    %46
    fad8 r fad'8.-+(mi32 fad)
    red16 fad si fad red fad dod fad
    red fad si, fad' dod fad mi fad

    %49
    red fad si fad red fad dod fad
    red fad si, fad' dod fad mi fad\mbreak
    red si dod red mi fad sold lad

    %52
    si la? sold fad mi red dod si
    \stemUp <sold' si, mi,>4 r
    <si si, mi,> r

    %55
    <fad si, red,> r
    <si si, mi,> r
    mi,4.-+ red16 dod

    %58
    si4 lad-+\mbreak
    si2~
    si16\p red dod(mi) red(fad) mi(sold)

    %61
    si, red dod(mi) si(red) dod(mi)
    red\<(fad) mi(sold) fad(red) mi(dod)\!
    si\f(red) lad(dod) si(red) dod(mi)

    %64
    red(fad) mi(sold) fad(red) mi(dod)
    si8 si16 si la la sold sold
    fad fad sold sold fad fad mi mi

    %67
    red \stemDown si'' la sold\stemNeutral fad sold fad mi
    red red red red red red red red
    si si si si si si si si

    %70
    sold sold sold sold sold sold sold sold

}

VIIflIn = \relative do'' {

    mi4 sold
    si  la16 sold fad-+ mi
    dod'8\staccatissimo dod16-+ si32(dod) mi8 dod

    %4
    si4 la16 sold fad-+ mi
    dod'8\staccatissimo dod16-+ si32(dod) mi8 dod
    si mi \afterGrace si4-+ ({la16[si)]}

    %7
    la8\staccatissimo fad\staccatissimo \afterGrace la4-+({sold16[la)]}
    sold8 si la16 sold fad mi
    red8[mi fad sold]\mbreak

    %10
    fad16 mi red dod si la sold fad
    \appoggiatura {mi16[si']} mi4 sold
    si la16 sold fad-+ mi

    %13
    dod'8\staccatissimo dod16-+ si32(dod) mi8 dod
    si4 la16 sold fad-+ mi
    dod'8\staccatissimo dod16-+ si32(dod) mi8 dod

    %16
    si mi \afterGrace si4-+ ({la16[si)]}
    la8\staccatissimo fad\staccatissimo \afterGrace la4-+({sold16[la)]}
    sold16-+(fad sold) la si8 si

    %19
    la4 fad-+\mbreak
    sold16-+(fad sold) la si8\staccatissimo si\staccatissimo
    la4 \afterGrace fad-+ ({mi16[fad)]}

    %22
    mi2
    R2*8

    %31
    sold4 sold
    sold8 fad16-+ mi fad8 sold\mbreak
    la4 la

    %34
    la8 sold16-+ fad sold8 la
    si4 si
    \afterGrace si4-+ ({la16[si)]} dod8 red

    %37
    mi[fad, sold lad]
    \appoggiatura lad? si4 r
    si2-+\f~

    %40
    si2-+~
    si2-+~
    si2-+

    %43
    si16 la? sold fad mi red dod si
    sold' fad mi red mi red dod si
    lad si dod si lad si lad sold

    %46
    fad8 r r4
    fad'2-+~
    fad2-+~

    %49
    fad2-+~
    fad2-+
    red16 si dod red mi fad sold lad

    %52
    si la? sold fad mi red dod si
    sold'4 r
    si r

    %55
    fad r
    si r
    sold4.-+ fad16 mi

    %58
    red4 dod-+\mbreak
    si2
    si'2-+\p~

    %61
    si-+~
    si~-+\<
    si~-+\!\f

    %64
    si-+~
    si-+~
    si-+~

    %67
    si8 la16-+ sold fad sold fad mi
    red red red red red red red red
    si si si si si si si si

    %70
    sold sold sold sold sold sold sold sold

}

VIIflIIn = \relative do'' {

    mi4 mi
    sold la16 sold fad-+ mi
    la8\staccatissimo la16-+ sold32(la) dod8 la

    %4
    sold4 la16 sold fad-+ mi
    la8\staccatissimo la16-+ sold32(la) dod8 la
    sold si \afterGrace  sold4-+ ({ fad16[sold)]}

    %7
    fad8\staccatissimo red\staccatissimo  \afterGrace fad4-+ ({mi16[fad)]}
    mi8 si' la16 sold fad mi
    red8[mi fad sold]\mbreak

    %10
    fad16 mi red dod si la sold fad
    \appoggiatura {mi16[si']} mi4 mi
    sold la16 sold fad-+ mi

    %13
    la8\staccatissimo la16-+ sold32(la) dod8 la
    sold4 la16 sold fad-+ mi
    la8\staccatissimo la16-+ sold32(la) dod8 la

    %16
    sold si \afterGrace  sold4-+ ({ fad16[sold)]}
    fad8\staccatissimo red\staccatissimo  \afterGrace fad4-+ ({mi16[fad)]}
    mi16-+(red mi) fad sold8 sold

    %19
    fad4 red-+\mbreak
    mi16-+(red mi) fad sold8\staccatissimo sold\staccatissimo
    fad4 \afterGrace red-+ ({dod16[red)]}

    %22
    mi2
    R2*8
    mi4\p mi

    %32
    mi8 red16-+ dod red8 mi
    fad4 fad
    fad8 mi16-+ red mi8 fad

    %35
    sold4 sold
    \afterGrace sold4-+ ({fad32 [sold)]} la8  fad
    sold si,4 mi8

    %38
    red4-+ r
    si'2-+\f~

    %40
    si2-+~
    si2-+~
    si2-+

    %43
    si16 la? sold fad mi red dod si
    sold' fad mi red mi red dod si
    lad si dod si lad si lad sold

    %46
    fad8 r r4
    fad'2-+~
    fad2-+~

    %49
    fad2-+~
    fad2-+
    red16 si dod red mi fad sold lad

    %52
    si la? sold fad mi red dod si
    sold'4 r
    si r

    %55
    fad r
    red r
    mi4.-+ red16 dod

    %58
    si4 lad-+\mbreak
    si2
    si'2-+\p~

    %61
    si-+~
    si~-+\<
    si~-+\!\f

    %64
    si-+~
    si-+~
    si-+~

    %67
    si8 la16-+ sold fad sold fad mi
    red red red red red red red red
    si si si si si si si si

    %70
    sold sold sold sold sold sold sold sold

}

VIIcrIn = %\transpose do mi, {

    \relative do'' {
        \key do\major

        do4 mi
        sol mi
        do2~

        %4
        do~
        do~
        do4 r8 sol'

        %7
        fa4 r8 fa
        mi2
        re8[mi fa mi]\mbreak

        %10
        re2
        do4 mi
        sol mi

        %13
        do2~
        do~
        do

        %16
        do4 r8 sol'
        fa4 r8 fa
        mi8. fa16 sol8 sol

        %19
        fa4 re\mbreak
        do sol'8 sol
        fa4 re-+

        %22
        do2
        R2*8
        mi4\p mi

        %32
        mi r\mbreak
        re re
        re r

        %35
        do do
        do r
        R2*2

        %39
        re2\f
        mi
        re

        %42
        mi\mbreak
        re
        mi

        %45
        re
        re8 r r4
        re2-+~

        %48
        re2-+~
        re2-+~
        re2-+\mbreak

        %51
        re
        re
        mi4 r

        %54
        mi r
        re r
        re r

        %57
        mi2
        re4 re\mbreak
        sol,2

        %60
        R
        sol'\p~
        sol\< ~

        %63
        sol\!\f ~
        sol~
        sol~

        %66
        sol
        sol4 r
        R2

        %69
        sol4 r
        R2

   % }

}

VIIcrIIn = %\transpose do mi, {

    \relative do'' {
        \key do\major

        do,4 do'
        mi do
        do,2~

        %4
        do~
        do~
        do4 r8 mi'

        %7
        re4 r8 re
        do2
        sol8[do re do]\mbreak

        %10
        sol2
        do,4 do'
        mi do

        %13
        do,2~
        do~
        do

        %16
        do4 r8 mi'
        re4 r8 re
        do8. re16 mi8 mi

        %19
        re4 sol,\mbreak
        mi4 mi'8 mi
        re4 sol,

        %22
        do,2
        R2*8
        do'4\p do

        %32
        do r
        sol sol
        sol r

        %35
        do, do
        do r
        R2*2

        %39
        sol'2\f
        do
        sol

        %42
        do\mbreak
        sol
        do

        %45
        re
        re8 r r4
        re2-+~

        %48
        re2-+~
        re2-+~
        re2-+\mbreak

        %51
        sol,2
        sol
        do4 r


        %54
        do r
        sol r
        sol r

        %57
        do2
        sol4 re'\mbreak
        sol,2

        %60
        R
        sol\p~
        sol\<~

        %63
        sol\!\f ~
        sol~
        sol~

        %66
        sol
        sol4 r
        R2

        %69
        sol4 r
        R2

    %}

}

VIIhcn = \relative do'' {

    mi8 red16 dod si la sold fad
    mi si' sold si mi, si' sold si
    mi, dod' la dod  mi, dod' la dod

    %4
    mi, si' sold si mi, si' sold si
    mi, dod' la dod  mi, dod' la dod
    mi, si' sold si mi, si' sold si

    %7
    fad si fad si fad si la si
    mi,4 r8 si'
    si[si si si]\mbreak

    %10
    si4 si16 la sold fad
    mi4 r
    mi16 si' sold si mi, si' sold si

    %13
    mi, dod' la dod  mi, dod' la dod
    mi, si' sold si mi, si' sold si
    mi, dod' la dod  mi, dod' la dod

    %16
    mi, si' sold si mi, si' sold si
    fad si la si fad si la si
    mi,4 r8 mi'

    %19
    dod4 si\mbreak
    si r8 mi,
    dod4 si

    %22
    si2
    si4\p si
    si r

    %25
    si si
    si r
    si si

    %28
    si r
    si si
    la-+ sold

    %31
    si si
    si r\mbreak
    si si

    %34
    si r
    si si
    si la8 si
    si si' mi dod

    %38
    si\f lad16 sold fad mi red dod
    si2~
    si~

    %41
    si~
    si~\mbreak
    si

    %44
    mi
    fad
    fad,8  r r4

    %47
    si  fad'8 mi
    red [fad fad fad]
    fad4 fad8 mi

    %50
    red fad fad fad\mbreak
    fad2
    fad
    sold16 mi fad sold la si dod red

    %54
    mi red dod si la sold fad mi
    red si dod red mi fad sold la
    si la sold fad mi red dod si

    %57
    mi red mi fad sold fad sold mi
    fad4 mi\mbreak
    si16 si' la sold fad mi red dod

    %60
    si2\p~
    si~
    si~\<

    %63
    si~\!\f
    si~
    si8 si'16 si la la sold sold

    %66
    fad fad sold sold fad fad mi mi
    red4 si
    si2

    %69
    si16 si si si si' si si si
    sold sold sold sold sold sold sold sold

}

VIIfgn = \relative do {

    mi8 red16 dod si la sold fad
    mi2~
    mi~

    %4
    mi~
    mi~
    mi4 r8 mi'

    %7
    si'4 r8 si,
    mi,4 r8 mi'
    la[sold fad mi]\mbreak

    %10
    si4 si'16 la sold fad
    mi8 red16 dod si la sold fad
    mi2~

    %13
    mi~
    mi~
    mi~

    %16
    mi4 r8 mi'
    si'4 r8 si,
    mi,4 r8 mi''

    %19
    la,4 si\mbreak
    sold r8 mi
    la,4 si

    %22
    mi,2
    R2*8

    %31
    mi'4\p mi
    mi r\mbreak
    si si

    %34
    si r
    mi, mi
    mi2
    mi8 \once\stemDown si'' mi dod

    %38
    si4 r
    \clef tenor \key mi\major <<
        {
            fad'2
            sold

            %41
            fad
            sold\mbreak
            fad

            %44
            sold
            fad
        }\\{
            red
            mi
            red
            mi
            red mi fad
        }
    >>
    \clef bass \key mi\major fad,,8  r r4

    %47
    si si'8 lad
    si red lad fad
    si,4 si'8 lad

    %50
    si red lad fad\mbreak
    si2
    si,
    sold'16 mi fad sold la si dod red

    %54
    mi red dod si la sold fad mi
    red si dod red mi fad sold la
    si la sold fad mi red dod si

    %57
    mi red mi fad sold fad sold mi
    fad4 fad,\mbreak
    si'8 la16 sold fad mi red dod

    %60
    si2\p~
    si~
    si~\<

    %63
    si~\!\f
    si~
    si8 sold'16 sold fad fad mi mi

    %66
    red red mi mi red red dod dod
    si2
    si

    %69
    si16 si si si si' si si si
    sold sold sold sold sold sold sold sold

}

VIIbcn = \relative do {

    mi8 red16 dod si la sold fad
    mi2~
    mi~

    %4
    mi~
    mi~
    mi4 r8 mi'

    %7
    si'4 r8 si,
    mi,4 r8 mi'
    la[sold fad mi]\mbreak

    %10
    si4 si'16 la sold fad
    mi8 red16 dod si la sold fad
    mi2~

    %13
    mi~
    mi~
    mi~

    %16
    mi4 r8 mi'
    si'4 r8 si,
    mi,4 r8 mi''

    %19
    la,4 si\mbreak
    sold r8 mi
    la,4 si

    %22
    mi,2
    mi'4\p mi
    mi r

    %25
    si si
    si r
    mi, mi

    %28
    mi2~
    mi8[(red) red(mi)]
    si'4 mi,

    %31
    mi'\p mi
    mi r\mbreak
    si si

    %34
    si r
    mi, mi
    mi2
    mi8 \once\stemDown si'' mi dod

    %38
    si\f lad16 sold fad mi red dod
    si2~
    si~

    %41
    si~
    si~\mbreak
    si

    %44
    mi
    fad
    fad,8  r r4

    %47
    si si'8 lad
    si red lad fad
    si,4 si'8 lad

    %50
    si red lad fad\mbreak
    si2
    si,
    sold'16 mi fad sold la si dod red

    %54
    mi red dod si la sold fad mi
    red si dod red mi fad sold la
    si la sold fad mi red dod si

    %57
    mi red mi fad sold fad sold mi
    fad4 fad,\mbreak
    si'8 la16 sold fad mi red dod

    %60
    si2\p~
    si~
    si~\<

    %63
    si~\!\f
    si~
    si8 sold'16 sold fad fad mi mi

    %66
    red red mi mi red red dod dod
    si2
    si

    %69
    si16 si si si si' si si si
    sold sold sold sold sold sold sold sold

}

VIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    s2*21\once \override Score.RehearsalMark.extra-offset = #'(  +5 . +1) \mark\markup "Fin"
    s2 \bar "||"\break
    s2*48
    \bar ":|."
    \mark\markup \smaller\center-column{"Da""capo"}

}


VIIvlI = {
    \VIIglobal
    %\notypeset
    <<\VIIvlIn \forma>>
}


VIIvlII = {
    \VIIglobal
    <<\VIIvlIIn \forma>>
}


VIIflI = {
    \VIIglobal
    <<\VIIflIn \forma>>
}


VIIflII = {
    \VIIglobal
    <<\VIIflIIn \forma>>
}


VIIcrI = {
    \VIIglobal
    <<\VIIcrIn \forma>>
}


VIIcrII = {
    \VIIglobal
    <<\VIIcrIIn \forma>>
}


VIIhc = {
    \VIIglobal
    \clef alto
    <<\VIIhcn \forma>>
}


VIIfg = {
    \VIIglobal
    \clef bass
    <<\VIIfgn \forma>>
}

VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
    \typeset
}



VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

VIIIvlIn = \relative do'' {

    sol'4\p\staccatissimo sol\staccatissimo
    sol8 la16 sol fad sol mi8\staccatissimo
    la4 la

    %4
    la8 si16 la sol la fad8\staccatissimo
    la4 la
    la8 si16 la sol la fad8\staccatissimo

    %7
    \once\stemUp <sold si, re,>2~\f
    sold8 \tuplet 3/2 { sold16(la si) } la32(sold16.) fad32(mi16.)
    la16\staccatissimo la(si la) sol\staccatissimo sol(la sol)

    %10
    fad\staccatissimo fad(sol fad) mi\staccatissimo mi(fad mi)
    red8. mi16 mi8.-+(red32 mi)
    fad8 si,16 do red mi fad8\mbreak

    %13
    sol4\p sol
    sol8 la16 sol fad sol mi8\staccatissimo
    la4 la

    %16
    la8 si16 la sol la fad8\staccatissimo
    la4 la
    la8 si16 la sol la fad8\staccatissimo

    %19
    \once\stemUp <sold si, re,>2~\f
    sold8 \tuplet 3/2 { sold16(la si) } la32(sold16.) fad32(mi16.)
    la16\staccatissimo la la la sol!\staccatissimo [sol sol sol]

    %22
    fad\staccatissimo fad fad fad mi\staccatissimo mi mi mi
    fad4 red-+
    mi16\staccatissimo mi mi mi re! \staccatissimo re  re re\mbreak

    %25
    do\staccatissimo do(re do) si\staccatissimo si(do si)
    la\staccatissimo la(si la) sol\staccatissimo sol(la sol)
    la4 \afterGrace fad-+ ( {mi16[fad))]}

    %28
    <mi' si mi,>2
    <<<mi si>8\\<sol, mi> >> r mi'4~
    mi16 si'(sol) mi\staccatissimo la\staccatissimo fad(mi-+ red)

    %31
    <<<mi si>8\\sol, >> r mi'4~
    mi16 si'(sol) mi\staccatissimo la\staccatissimo fad(mi-+ red)
    mi4 si8.-+(la32 si)

    %34
    do8 r la8.-+(sol32 la)\mbreak
    si8 r sol8.-+(fad32 sol)
    la8 r fad8.-+(mi32 fad)

    %37
    sol16 fad mi8\staccatissimo mi r
    <<<mi' si>8\\sol,>> r mi'4~
    mi16 si'(sol) mi\staccatissimo la\staccatissimo fad(mi-+ red)

    %40
    <<<mi si>8\\sol,>> r mi'4~
    mi16 si'(sol) mi\staccatissimo la\staccatissimo fad(mi-+ red)
    mi8 r si8.-+(la32 si)

    %43
    do8 r la8.-+(sol32 la)\mbreak
    si4 mi~
    mi8 sol, la4-+

    %46
    si r
    fad'\p fad
    fad8 sol16 fad mi fad re8

    %49
    sol4 sol
    sol8 la16 sol fad sol mi8\staccatissimo
    sol4 sol

    %52
    sol8 la16 sol fad sol mi8-+
    fad4 fad~
    fad8 la16 sol fad mi red8
    <<<mi si>16\\{sol, \f mi' (fad sol)}>> fad\staccatissimo fad(sol la)\mbreak

    %56
    sol\staccatissimo sol(lad si) lad\staccatissimo lad(si dod)
    si\staccatissimo si(dod re) dod\staccatissimo re(si dod)
    re dod(si lad si\staccatissimo) lad\staccatissimo si\staccatissimo do?\staccatissimo

    %59
    re do(si lad) si\staccatissimo lad\staccatissimo si\staccatissimo do\staccatissimo
    re do(si lad) si\staccatissimo lad\staccatissimo si\staccatissimo do\staccatissimo
    re dod(si lad) si8\noBeam fad16-+(mi32 fad)

    %62
    \once\stemUp <sol si, mi,>4 <<<mi dod>\\la,?>>\mbreak
    <fad' la, re,>8 mi16 re dod re si8\staccatissimo
    mi4 dod\tr

    %65
    si8 r si4\f~
    si8[dod\p(red mi)]
    \appoggiatura mi red r red4\f~

    %68
    red8 [mi(fad sol)]
    \appoggiatura sol8 fad r fad4\f~
    fad8[sol\p(la si)]

    %71
    \appoggiatura la la r la4\f~\mbreak
    la16 do\p si la si la sol fad
    sol-+\< (fad sol )si\staccatissimo la32(sol16.) fad32 (mi16.)

    %74
    sol16-+ (fad sol) si\staccatissimo la32(sol16.) fad32 (mi16.)
    sol16-+ (fad sol) si\staccatissimo la32(sol16.) fad32 (mi16.)
    sol16-+ (fad sol) si\staccatissimo la32(sol16.) fad32 (mi16.)\!

    %77
    red8\f\noBeam si16 red dod\p\<(mi) red(fad)
    mi(sol) fad(la) sol8.-+(fad32 mi)\!\mbreak
    si'8\f si,16 re dod\p\<(mi) red(fad)

    %80
    mi(sol) fad(la) sol8.-+(fad32 mi)
    si'8\f r r4

}

VIIIvlIIn = \relative do'' {

    sol'4\p\staccatissimo sol\staccatissimo
    sol8 la16 sol fad sol mi8\staccatissimo
    la4 la

    %4
    la8 si16 la sol la fad8\staccatissimo
    la4 la
    la8 si16 la sol la fad8\staccatissimo

    %7
    \once\stemUp <sold si, re,>2~\f
    sold8 \tuplet 3/2 { sold16(la si) } la32(sold16.) fad32(mi16.)
    la16\staccatissimo la(si la) sol\staccatissimo sol(la sol)

    %10
    fad\staccatissimo fad(sol fad) mi\staccatissimo mi(fad mi)
    red8. mi16 mi8.-+(red32 mi)
    fad8 si,16 do red mi fad8\mbreak

    %13
    sol4\p sol
    sol8 la16 sol fad sol mi8\staccatissimo
    la4 la

    %16
    la8 si16 la sol la fad8\staccatissimo
    la4 la
    la8 si16 la sol la fad8\staccatissimo

    %19
    \once\stemUp <sold si, re,>2~\f
    sold8 \tuplet 3/2 { sold16(la si) } la32(sold16.) fad32(mi16.)
    la16\staccatissimo la la la sol!\staccatissimo [sol sol sol]

    %22
    fad\staccatissimo fad fad fad mi\staccatissimo mi mi mi
    fad4 red-+
    mi16\staccatissimo mi mi mi re! \staccatissimo re  re re\mbreak

    %25
    do\staccatissimo do(re do) si\staccatissimo si(do si)
    la\staccatissimo la(si la) sol\staccatissimo sol(la sol)
    la4 \afterGrace fad-+ ( {mi16[fad))]}

    %28
    <mi' si mi,>2
    <<<mi si>8\\<sol, mi> >> r mi'4~
    mi16 si'(sol) mi\staccatissimo la\staccatissimo fad(mi-+ red)

    %31
    <<<mi si>8\\sol, >> r mi'4~
    mi16 si'(sol) mi\staccatissimo la\staccatissimo fad(mi-+ red)
    mi4 sold,8.-+(fad32 sold)

    %34
    la8 r fad8.-+(mi32 fad)\mbreak
    sol?8 r mi8.-+(red32 mi)
    fad8 r red8.-+(do32 red)

    %37
    mi8 si sol r
    <<<mi'' si>8\\sol,>> r mi'4~
    mi16 si'(sol) mi\staccatissimo la\staccatissimo fad(mi-+ red)

    %40
    <<<mi si>8\\sol,>> r mi'4~
    mi16 si'(sol) mi\staccatissimo la\staccatissimo fad(mi-+ red)
    mi,8 r sol8.-+(fad32 sol)

    %43
    la8 r fad8.-+(mi32 fad)\mbreak
    sol4 mi'~
    mi8 sol, la4-+

    %46
    si r
    fad'\p fad
    fad8 sol16 fad mi fad re8

    %49
    sol4 sol
    sol8 la16 sol fad sol mi8\staccatissimo
    sol4 sol

    %52
    sol8 la16 sol fad sol mi8-+
    fad4 fad~
    fad8 la16 sol fad mi red8
    <<<mi si>16\\{sol,\f mi' (fad sol)}>> fad\staccatissimo fad(sol la)\mbreak

    %56
    sol\staccatissimo sol(lad si) lad\staccatissimo lad(si dod)
    si\staccatissimo si(dod re) dod\staccatissimo re(si dod)
    re dod(si lad si\staccatissimo) lad\staccatissimo si\staccatissimo do?\staccatissimo

    %59
    re do(si lad) si\staccatissimo lad\staccatissimo si\staccatissimo do\staccatissimo
    re do(si lad) si\staccatissimo lad\staccatissimo si\staccatissimo do\staccatissimo
    re dod(si lad) si8\noBeam fad16-+(mi32 fad)

    %62
    \once\stemUp <sol si, mi,>4 <<<mi dod>\\la,?>>\mbreak
    <fad' la, re,>8 mi16 re dod re si8\staccatissimo
    mi4 dod\tr

    %65
    si8 r si4\f~
    si8[dod\p(red mi)]
    \appoggiatura mi red r red4\f~

    %68
    red8 [mi(fad sol)]
    \appoggiatura sol8 fad r fad4\f~
    fad8[sol\p(la si)]

    %71
    \appoggiatura la la r la4\f~\mbreak
    la16 do\p si la si la sol fad
    sol-+\< (fad sol )si\staccatissimo la32(sol16.) fad32 (mi16.)

    %74
    sol16-+ (fad sol) si\staccatissimo la32(sol16.) fad32 (mi16.)
    sol16-+ (fad sol) si\staccatissimo la32(sol16.) fad32 (mi16.)
    sol16-+ (fad sol) si\staccatissimo la32(sol16.) fad32 (mi16.)\!

    %77
    red8\f\noBeam si16 red dod\p\<(mi) red(fad)
    mi(sol) fad(la) sol8.-+(fad32 mi)\!\mbreak
    si'8\f si,16 re dod\p\<(mi) red(fad)

    %80
    mi(sol) fad(la) sol8.-+(fad32 mi)
    si'8\f r r4

}

VIIIflIn = \relative do'' {

    sol'4\p sol
    sol8 la16 sol fad sol mi8\staccatissimo
    la4 la

    %4
    la8 si16 la sol la fad8\staccatissimo
    la4 la
    la8 si16 la sol la fad8\staccatissimo

    %7
    sold2~\f
    sold8 \tuplet 3/2 { sold16(la si) } la32(sold16.) fad32(mi16.)
    la16\staccatissimo la(si la) sol\staccatissimo sol(la sol)

    %10
    fad\staccatissimo fad(sol fad) mi\staccatissimo mi(fad mi)
    red8. mi16 mi8.-+(red32 mi)
    fad8 si,16 do red mi fad8\mbreak

    %13
    sol4\p sol
    sol8 la16 sol fad sol mi8\staccatissimo
    la4 la

    %16
    la8 si16 la sol la fad8\staccatissimo
    la4 la
    la8 si16 la sol la fad8\staccatissimo

    %19
    sold2~\f
    sold8 \tuplet 3/2 { sold16(la si) } la32(sold16.) fad32(mi16.)
    la16\staccatissimo la la la sol!\staccatissimo [sol sol sol]

    %22
    fad\staccatissimo fad fad fad mi\staccatissimo mi mi mi
    fad4 red-+
    mi16\staccatissimo mi mi mi re! \staccatissimo re  re re\mbreak

    %25
    do\staccatissimo do(re do) si\staccatissimo si(do si)
    la\staccatissimo la(si la) sol\staccatissimo sol(la sol)
    la4 \afterGrace fad-+ ( {mi16[fad))]}

    %28
    mi2
    mi''2~
    mi8 r r4

    %31
    mi2~
    mi8 r r4
    r4 si8.-+(la32 si)

    %34
    do8 r la8.-+(sol32 la)\mbreak
    si8 r sol8.-+(fad32 sol)
    la8 r fad8.-+(mi32 fad)

    %37
    sol16 fad mi8\staccatissimo mi r
    mi'2~
    mi8 r r4

    %40
    mi2~
    mi8 r r4
    r4 si8.-+(la32 si)

    %43
    do8 r la8.-+(sol32 la)\mbreak
    si4 mi~
    mi8 sol, la4-+

    %46
    si r
    si4\p si
    si r

    %49
    si si
    si r
    dod dod

    %52
    dod? r
    do! do
    do r

    %55
    si\f si\mbreak
    si4 lad16\staccatissimo lad(si dod)
    si\staccatissimo si(dod re) dod\staccatissimo re(si dod)
    re dod(si lad si\staccatissimo) lad\staccatissimo si\staccatissimo do?\staccatissimo

    %59
    re do(si lad) si\staccatissimo lad\staccatissimo si\staccatissimo do\staccatissimo
    re do(si lad) si\staccatissimo lad\staccatissimo si\staccatissimo do\staccatissimo
    re dod(si lad) si8\noBeam fad16-+(mi32 fad)

    %62
    sol4 mi\mbreak
    fad8 mi16 re dod re si8\staccatissimo
    mi4 dod\tr

    %65
    si\p r
    R2
    si'2-+~

    %68
    si-+~
    si-+~
    si-+

    %71
    \appoggiatura si8 la r la4~\mbreak
    la16 do\p si la si la sol fad
    sol2\<~

    %74
    sol~
    sol~
    sol

   %77
   fad8\! r r4
    R2
    si8 r r4

    %80
    R2
    si8\f r r4

}

VIIIflIIn = \relative do'' {

    sol'4\p sol
    sol8 la16 sol fad sol mi8\staccatissimo
    la4 la

    %4
    la8 si16 la sol la fad8\staccatissimo
    la4 la
    la8 si16 la sol la fad8\staccatissimo

    %7
    sold2~\f
    sold8 \tuplet 3/2 { sold16(la si) } la32(sold16.) fad32(mi16.)
    la16\staccatissimo la(si la) sol\staccatissimo sol(la sol)

    %10
    fad\staccatissimo fad(sol fad) mi\staccatissimo mi(fad mi)
    red8. mi16 mi8.-+(red32 mi)
    fad8 si,16 do red mi fad8\mbreak

    %13
    sol4\p sol
    sol8 la16 sol fad sol mi8\staccatissimo
    la4 la

    %16
    la8 si16 la sol la fad8\staccatissimo
    la4 la
    la8 si16 la sol la fad8\staccatissimo

    %19
    sold2~\f
    sold8 \tuplet 3/2 { sold16(la si) } la32(sold16.) fad32(mi16.)
    la16\staccatissimo la la la sol!\staccatissimo [sol sol sol]

    %22
    fad\staccatissimo fad fad fad mi\staccatissimo mi mi mi
    fad4 red-+
    mi16\staccatissimo mi mi mi re! \staccatissimo re  re re\mbreak

    %25
    do\staccatissimo do(re do) si\staccatissimo si(do si)
    la\staccatissimo la(si la) sol\staccatissimo sol(la sol)
    la4 \afterGrace fad-+ ( {mi16[fad))]}

    %28
    mi2
    mi''2~
    mi8 r r4

    %31
    mi2~
    mi8 r r4
    r4 sold,8.-+(fad32 sold)

    %34
    la8 r fad8.-+(mi32 fad)\mbreak
    sol?8 r mi8.-+(red32 mi)
    fad8 r red8.-+(do32 red)

    %37
    si16 la sol8\staccatissimo sol r
    mi''2~
    mi8 r r4

    %40
    mi2~
    mi8 r r4
    r4 sol,8.-+(fad32 sol)

    %43
    la8 r fad8.-+(mi32 fad)\mbreak
    si4 mi~
    mi8 sol, la4-+

    %46
    si r
    si4\p si
    si r

    %49
    si si
    si r
    dod dod

    %52
    dod? r
    do! do
    do r

    %55
    si\f si\mbreak
    si4 lad16\staccatissimo lad(si dod)
    si\staccatissimo si(dod re) dod\staccatissimo re(si dod)
    re dod(si lad si\staccatissimo) lad\staccatissimo si\staccatissimo do?\staccatissimo

    %59
    re do(si lad) si\staccatissimo lad\staccatissimo si\staccatissimo do\staccatissimo
    re do(si lad) si\staccatissimo lad\staccatissimo si\staccatissimo do\staccatissimo
    re dod(si lad) si8\noBeam fad16-+(mi32 fad)

    %62
    sol4 mi\mbreak
    fad8 mi16 re dod re si8\staccatissimo
    mi4 dod\tr

    %65
    si\p r
    R2
    si'2-+~

    %68
    si-+~
    si-+~
    si-+

    %71
    \appoggiatura si8 la r la4~\mbreak
    la16 do\p si la si la sol fad
    mi2\<~

    %74
    mi~
    mi~
    mi

    %77
    red8\! r r4
    R2
    si8 r r4

    %80
    R2
    si8\f r r4

}

VIIIcrIn = %\transpose do mi, {

\relative do'' {
    %\key do\minor

    do4\p do
    do r
    do do

    %4
    do r
    re re
    re r

    %7
    mi2\f~
    mi
    fa4 r

    %10
    R2*3\mbreak
    do4\p do
    do r

    %15
    do do
    do r
    re re

    %18
    re r
    mi2\f~
    mi(
    fa4) r

    %22
    R2*2
    do2\mbreak
    do

    %26
    R
    re4 re
    do2

    %29
    do~
    do8 r r4
    do2~

    %32
    do8 r r4
    R2*5
    do2~

    %39
    do8 r r4
    do2~
    do8 r r4

    %42
    R2*16
    re8 r r4
    re8 r r4

    %60
    re8 r r4
    re8 r r4
    R2*3

    %65
    r4 sol,\p~
    sol2~
    sol~

    %68
    sol~
    sol~
    sol

    %71
    R2*6
    sol'8 r r4
    R2

    %79
    sol8 r r4
    R2
    sol8 r r4

   % }

}

VIIIcrIIn = %\transpose do mi, {

\relative do'' {
    %\key do\minor

    do,\p do
    do r
    do do

    %4
    do r
    re' re
    re r

    %7
    do2\f~
    do
    do4 r

    %10
    R2*3
    do,4\p do
    do r

    %15
    do do
    do r
    re' re

    %18
    re r
    do2\f~
    do~

    %21
    do4 r
    R2*2
    do,2\mbreak

    %25
    do
    R
    re'4 sol,

    %28
    do,2
    do2~
    do8 r r4

    %31
    do2~
    do8 r r4
    R2*5

    %38
    do2~
    do8 r r4
    do2~

    %41
    do8 r r4
    R2*16
    sol'8 r r4

    %59
    sol8 r r4
    sol8 r r4
    sol8 r r4

    %62
    R2*3
    r4 sol,\p~
    sol2~

    %67
    sol~
    sol~
    sol~

    %70
    sol
    R2*6
    sol'8 r r4

    %78
    R2\mbreak
    sol8 r r4
    R2

    %81
    sol8 r r4

    %}

}

VIIIhcn = \relative do' {

    mi4\p mi
    mi r
    mi mi

    %4
    mi r
    fad fad
    fad r

    %7
    <<{si2\f~
       si
       la8}\\{mi2~
              mi
              mi8 mi'}>> re4

    %10
    do si
    la sol
    fad r\mbreak

    %13
    mi4\p mi
    mi r
    mi mi

    %16
    mi r
    fad fad
    fad r

    %19
    <<{si2\f~
       si
       la8}\\{mi2~
              mi
              mi8 mi'}>> re4

    %22
    do si
    do si
    sol2\mbreak

    %25
    mi'4 mi
    red mi
    fad red-+

    %28
    mi2
    <<{sol,8 la si do
      si}\\{mi, fad sol la
            sol}>> r r4

    %31
    <<{sol8 la si do
      si}\\{mi, fad sol la
            sol}>> r r4
    mi16 sold si sold mi re do si

    %34
    la do si do re do si la\mbreak
    sol? si la si do si la sol
    fad la sol la si la sol fad

    %37
    mi8 r r4
    <<{sol'8 la si do
      si}\\{mi, fad sol la
            sol}>> r r4

    %40
    <<{sol8 la si do
      si}\\{mi, fad sol la
            sol}>> r r4
    mi16 sol si sol mi re do si

    %43
    la la la la re re re re\mbreak
    sol, la si la sol la sol fad
    mi8 re do do'

    %46
    si4 r
    si'4\p si
    si r

    %49
    si si
    si r
    lad lad

    %52
    lad? r
    la! la
    la r

    %55
    sol\f  si\mbreak
    si dod
    fad, fad

    %58
    fad2
    fad
    fad

    %61
    fad4 r8 re'
    mi4 dod\mbreak
    re r8 si

    %64
    dod4 lad-+
    si8 si si, r
    R2

    %67
    r4 si\f~
    si8[dod\p(red mi)]
    \appoggiatura mi8 red r red4\f~

    %70
    red8[mi\p(fad sol)]
    \appoggiatura sol fad r fad4\f~\mbreak
    fad16 la\p sol fad sol fad mi red

    %73
    mi4\< mi
    do2
    si

    %76
    lad\!
    si8\f  si'4\p  si8~\<
    si do si mi\mbreak

    %79
    red\f \!si4\p si8~\<
    si si si mi
    red\f\! si16\p do si la sol fad

}

VIIIfgn = \relative do {

    si'4\p si
    si r
    do do

    %4
    do r
    do do
    do r

    %7
    si2\f~
    si4 si-+
    do8 mi re4

    %10
    do si
    la sol
    fad r\mbreak

    %13
    si4\p si
    si r
    do do

    %16
    do r
    do do
    do r

    %19
    si2\f~
    si4. si8
    do8 mi re4

    %22
    do si
    do si
    sol2\mbreak

    %25
    mi'4 mi
    red mi
    fad red-+

    %28
    mi2
    <<{sol,8 la si do
      si}\\{mi, fad sol la
            sol}>> r r4

    %31
    <<{sol8 la si do
      si}\\{mi, fad sol la
            sol}>> r r4
    mi16 sold si sold mi re do si

    %34
    fad8 r r4\mbreak
    sol?16 si la si do si la sol
    fad la sol la si la sol fad

    %37
    mi8 r r4
    <<{sol'8 la si do
      si}\\{mi, fad sol la
            sol}>> r r4

    %40
    <<{sol8 la si do
      si}\\{mi, fad sol la
            sol}>> r r4
    mi16 sol si sol mi re do si

    %43
    fad8 r r4\mbreak
    sol16 la si la sol la sol fad
    mi8 re do do'

    %46
    si4 r
    re'4\p re
    re r

    %49
    mi mi
    mi r
    mi mi

    %52
    mi r
    red red
    red? r

    %55
    sol,\f red\mbreak
    mi dod
    re lad

    %58
    si16 dod(re mi) re mi(re dod)
    si dod(re mi) re mi(re dod)
    si dod(re mi) re mi(re dod)

    %61
    si4 r8 re'
    mi4 dod\mbreak
    re r8 si

    %64
    dod4 lad-+
    si8 si si, r
    R2

    %67
    r4 si'\f~
    si8[dod\p(red mi)]
    \appoggiatura mi8 red r red4\f~

    %70
    red8[mi\p(fad sol)]
    \appoggiatura sol fad r fad4\f~\mbreak
    fad16 la\p sol fad sol fad mi red

    %73
    mi4\< mi,
    do2
    si

    %76
    lad\!
    si8\f  si'4\p  la8\<
    sol red mi do\mbreak

    %79
    si8\!\f si'4\p la8\<
    sol red mi do
    si\!\f r r4

}

VIIIbcn = \relative do {

    mi4\p mi
    mi r
    mi mi

    %4
    mi r
    red red
    red? r

    %7
    re!2\f~
    re4 re,8 re'
    do4 si

    %10
    la sol
    fad mi
    si' r\mbreak

    %13
    mi\p mi
    mi r
    mi mi

    %16
    mi r
    red red
    red? r

    %19
    re!2\f~
    re4 re,8 re'
    do4 si

    %22
    la sol
    la si
    do si\mbreak

    %25
    la sol
    fad mi
    la si

    %28
    mi,2
    mi~
    mi8 r r4

    %31
    mi2~
    mi8 r r4
    mi'16 sold si sold mi re do si

    %34
    la do si do re do si la\mbreak
    sol? si la si do si la sol
    fad la sol la si la sol fad

    %37
    mi fad sol la si do red mi
    mi,2~
    mi8 r r4

    %40
    mi2~
    mi8 r r4
    mi'16 sol si sol mi re do si

    %43
    la la la la re re re re\mbreak
    sol, la si la sol la sol fad
    mi8 re do do'

    %46
    si8 dod16 red mi fad sol lad
    si4\p si
    si r

    %49
    si si
    si r
    lad lad

    %52
    lad? r
    la! la
    la r

    %55
    sol\f red\mbreak
    mi dod
    re lad

    %58
    si16 dod(re mi) re mi(re dod)
    si dod(re mi) re mi(re dod)
    si dod(re mi) re mi(re dod)

    %61
    si4 r8 si'
    mi,4 la\mbreak
    re,4 r8 re

    %64
    mi4 fad
    si,8\p[si' si, si']
    si,[si' si, si']

    %67
    si,[si' si,\f si']
    si,[si'\p si, si']
    si,[si' si,\f si']

    %70
    si,[si'\p si, si']
    red, r red4\f~\mbreak
    red?4.\p si8

    %73
    mi2\<
    do
    si

    %76
    lad\!
    si8\f  si'4\p  la8\<
    sol red mi do\mbreak

    %79
    si8\!\f si'4\p la8\<
    sol red mi do
    si\!\f si'16\p do si la sol fad

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    s2*27\once \override Score.RehearsalMark.extra-offset = #'(  +5 . +1) \mark\markup "Fin"
    s2 \bar "||"\break
    s2*53
    \bar ":|."
    \mark\markup \smaller\center-column{"Da""capo"}

}


VIIIvlI = {
    \VIIIglobal
    %\notypeset
    <<\VIIIvlIn \forma>>
}


VIIIvlII = {
    \VIIIglobal
    <<\VIIIvlIIn \forma>>
}


VIIIflI = {
    \VIIIglobal
    <<\VIIIflIn \forma>>
}


VIIIflII = {
    \VIIIglobal
    <<\VIIIflIIn \forma>>
}


VIIIcrI = {
    \VIIIglobal
    <<\VIIIcrIn \forma>>
}


VIIIcrII = {
    \VIIIglobal
    <<\VIIIcrIIn \forma>>
}


VIIIhc = {
    \VIIIglobal
    \clef alto
    <<\VIIIhcn \forma>>
}


VIIIfg = {
    \VIIIglobal
    \clef bass
    <<\VIIIfgn \forma>>
}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
    \typeset
}



IXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

IXvlIn = \relative do'' {

    r4 mi\f\tu sold
    fad4.-+ mi8\noBeam red mi
    la4 sold-+ fad

    %4
    mi mi4.-+ red8
    mi4 mi sold
    fad4.-+ mi8\noBeam red mi

    %7
    la4 sold-+ fad
    mi mi4.-+ red8
    mi4. mi8\noBeam  si dod

    %10
    sold4-+ \appoggiatura fad8 mi8.[si'16 fad8.(sold16)]\mbreak
    sold4-+ \appoggiatura fad8 mi8. si'16 dod4~
    dod8 si la4.\prall sold8

    %13
    fad4-+ mi8. mi'16 si8. dod16
    sold4-+ \appoggiatura fad8 mi8.[si'16 fad8.(sold16)]
    sold4-+ \appoggiatura fad8 mi8. si'16 dod4~

    %16
    dod8 si la4.\prall sold8
    fad4-+ si8 dod si dod
    re4 dod fad

    %19
    red?-+ sold \appoggiatura fad8 mi4
    la fad4.\prall si8\mbreak
    sold4-+ si,8 dod si dod

    %22
    re4 dod fad
    red?-+ sold mi\prall~
    mi8 fad fad4.-+ mi8

    %25
    mi si dod red mi fad
    sold4 \appoggiatura sold8 la4. si8
    sold2-+ fad8 sold16 (la)

    %28
    sold4 fad-+ mi
    si'2 si4
    r8 si,\noBeam dod red mi fad

    %31
    sold4 \appoggiatura sold8 la4. si8\mbreak
    sold2-+ fad8 sold16(la)

    %33
    sold4 fad-+ mi
    si'2 si4
    r << <mi, si>4._\markup\italic "acc.[ent]"\\sold,4>> si8

    %36
    dod4 si-+ la
    \appoggiatura la8 si4. dod8\noBeam si mi
    red-+ mi fad[(sold)] la sold16-+(fad)

    %39
    sold4 << <mi si>4.\\sold,4>> si8
    dod4 si-+ la
    << <mi' si>4.\\sold,4>> mi'8\noBeam red la'

    %42
    sold8-+ fad fad4.-+ mi8\mbreak
    mi si16 la sold8[sold] sold la16 si %% metà p. 23
    fad si, fad' si, fad' si, sold' si, la' si, sold' si,

    %45
    fad' si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad'4-+ mi8 fad sold lad
    \appoggiatura lad?8 si2 si4

    %48
    r8 si16 la? sold8[sold] sold la16 si
    fad si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad' si, fad' si, fad' si, sold' si, la' si, sold' si,\mbreak

    %51
    fad'4-+ mi8 fad sold lad
    \appoggiatura lad?8 si2 si4
    r8 si16 la sold8[si16 la] sold fad sold mi

    %54
    dod'8 dod16 dod dod8 dod dod dod
    dod mi16 red dod red dod si lad sold lad fad
    red'8 red16 red red8 red red red

    %57
    red fad16 mi red dod red si la'4\mbreak
    sold8-. fad fad4.-+ mi8
    mi mi,16 fad sold8 si16 la sold fad sold mi

    %60
    dod'8 dod16 dod dod8 dod dod dod
    dod mi16 red dod red dod si lad sold lad fad
    red'8 red16 red red8 red red red

    %63
    red fad16 mi red dod red si la'4
    sold8-+fad fad4.-+ mi8\mbreak
    mi4 si4. dod8

    %66
    \appoggiatura dod re2 \appoggiatura dod8 si4
    r8 mi lad,[(fad)] dod'(mi)
    red?4.-+ dod8 si4

    %69
    r si4. dod8
    \appoggiatura dod re2 \appoggiatura dod8 si4
    r8 mi lad,[(fad)] dod'(mi)

    %72
    red?4.-+ dod8 si4
    r8 <fad' red>16_\markup\italic "acc." <fad red> <fad red>8 <fad red> <fad red> <fad red>
    <fad red>8 sold16 fad sold fad sold fad sold fad sold fad\mbreak

    %75
    mi8 <mi dod>16_\markup\italic "acc." <mi dod> <mi dod>8 <mi dod> <mi dod> <mi dod>
    la si sold4.-+ fad8
    fad <fad red>16_\markup\italic "acc." <fad red> <fad red>8 <fad red> <fad red> <fad red>

    %78
    <fad red>8 sold16 fad sold fad sold fad sold fad sold fad
    mi8 <mi dod>16_\markup\italic "acc." <mi dod> <mi dod>8 <mi dod> <mi dod> <mi dod>
    la si sold4.-+ fad8

    %81
    fad16 si, dod red mi fad sold la si4
    r4\once\slurUp <sold, si,>2\<  ^\dolce(
    <fad si,>8-+\!) sold la(sold) fad-+(mi)\mbreak

    %84
    fad4_\markup\italic "acc." \once\slurUp <sold si,>2\< (
    <fad si,>8-+\!) sold la(sold) fad-+(mi)
    si'4 dod2~

    %87
    dod4 si\prall la
    sold-+ fad sold~
    sold8 lad lad4.-+ sold16(lad)

    %90
    si4 \once\slurUp <sold si,>2\< ^\markup\italic"acc." (
    <fad si,>8-+\!) sold la (sold) fad-+(mi)
    fad4  \once\slurUp <sold si,>2\< (

    %93
    <fad si,>8-+\!) sold la(sold) fad-+(mi)
    si'4 dod4.(red16 mi)\mbreak
    sold,2-+ si4

    %96
    la\prall fad-+ \appoggiatura fad8 sold4~
    sold8 la fad4.-+ mi8
    mi4 si'\f mi

    %99
    sold \appoggiatura sold8 la4. si8
    sold4-+ fad8 sold la si
    sold4-+ fad mi

    %102
    si'2 si4
    r si, mi
    sold \appoggiatura sold8 la4. si8

    %105
    sold4-+ fad8 sold la si\mbreak
    sold la16(si) la4.\prall sold8
    fad2-+ fad4

    %108
    r \once\stemUp <red fad,>2\< ^\dolce (
    <dod fad,>8-+)\! red mi red dod-+ si
    dod4  \once\stemUp <red fad,>2\< \acc (

    %111
    <dod fad,>8-+)\! red mi red dod-+ si
    fad'4 dod red
    lad2-+si4

    %114
    fad2.\mbreak
    mi'4 red-+ dod
    fad4. sold8 mi4-+~

    %117
    mi8 red dod4.-+ si8
    si2.~
    si

    %120
    r4 \once\slurUp <sold si,>2\< ^\markup\italic"acc." (
    <fad si,>8-+\!) sold la(sold) fad-+(mi)
    fad4  \once\slurUp <sold si,>2^\markup\italic"acc." \< (

    %123
    <fad si,>8-+\!) sold la(sold) fad-+(mi)\mbreak
    si'4 mi red
    dod(si-+) la

    %126
    sold si mi,
    la fad4.-+(mi16 fad)
    sold4 mi' red

    %129
    dod si-+ la
    sold si mi,
    la fad4.-+(mi8)

    %132
    mi4 sold' r16 sold la si\mbreak
    dod,4 la'~la32 si la sold fad mi red dod
    si4 sold'~sold32 la sold fad mi red dod si

    %135
    dod8. la'16 fad4.-+(mi16 fad)
    sold4 sold r16 sold la si
    dod,4 la'~la32 si la sold fad mi red dod

    %138
    si4 sold'~sold32 la sold fad mi red dod si\mbreak
    dod8. la'16 fad4.-+(mi8)
    mi4 sol,\dolce si

    %141
    sol2.
    mi'8(red) mi(red) <<
        mi4\\{
            \once\tieUp mi4_\markup\italic"acc."~
            mi8[fad]
        }
    >> fad4.-+(mi16 fad)

    %144
    sol4 sol, si
    mi,2.
    mi'8(red) mi(red) <<
        mi4\\{
            \once\tieUp mi4_\markup\italic"acc."~
            mi8[fad]
        }
    >> fad4.-+(mi8)\mbreak

    %148
    mi4. sol8 la(si)
    mi,(red) fad[(si,) la(do)]
    si8. mi16 mi,8(fad) \appoggiatura fad sol4~

    %151
    sol8 la sol4.-+ fad8
    sol4 \appoggiatura fad8 \once\stemUp mi sol'(la)[si]
    mi,[(red)] fad(si,) la(do)\mbreak

    %154
    si8. mi16 mi,8(fad) \appoggiatura fad sol4~
    sol8 la fad4.-+ mi8
    mi4 si'4. mi8

    %157
    sol,(fad) si[(re)] re, (fa)
    mi4  sol4. do8
    re, do' si[(la) si(do)]

    %160
    la4-+ la8(si) la(si)\mbreak
    \appoggiatura si do2 si4
    la-+ re8(si) do(la)

    %163
    mi'4 (re\mordent) do
    si4. do16(re) do4-+~
    do8 si la4.-+ sol8

    %166
    sol4 sol' \appoggiatura fad8 mi4
    dod2.-+
    red4 mi fad\mbreak

    %169
    si,2.~
    si8 la do[si la si]
    sol2-+ fad4

    %172
    R2.*4
    r4 mi4. mi8
    si'4 si4.-+ la8

    %178
    sol4. sol8\noBeam la(si)
    do[(si)] la sol fad-+ mi
    si'4 r r

    %181
    R2.
    r4 r8 fad'\noBeam sol la
    fad4\prall \appoggiatura mi8 red4 mi

    %184
    si2 la4\mbreak
    sol-+ fad8 sol la4
    si sol4.\prall  (fad16 sol)

    %187
    fad2-+ r4
    R2.
    r4 r8 fad'\noBeam sol la

    %190
    fad4\prall \appoggiatura mi8 red4 mi
    do4\tu\f si-+ la
    mi'4. si8 la4-+~

    %193
    la8 sol fad4.-+ mi8\mbreak
    mi16\f si' mi fad sol fad  mi re do si la sol
    \once\stemUp fad la' fad sol la sol fad mi red do si la

    %196
    \once\stemUp sol si' sol la si la sol fad mi re? do si
    la8.-+ sol16 fad4.-+(mi16 fad)
    sol si mi fad sol fad  mi re do si la sol

    %199
    \once\stemUp fad la' fad sol la sol fad mi red do si la
    \once\stemUp sol si' sol la si la sol fad mi re? do si
    la8.-+ sol16 fad4.-+(mi8)

    %202
    mi4 si'2\dolce
    r8 si do[(re)] do (si)
    <<{\once \override Slur.outside-staff-priority = #500 \stemDown re4 (do)  si\mbreak}\\{s8 s^\mordent}>>

    %205
    r4 do8 do si do
    la4-+ la2
    r8 la si[(do)] si-+(la)

    %208
    <<{\stemDown do4 si la}\\{s8 s^\mordent}>>
    r4 si8 si la si
    sol4-+ sol2

    %211
    la8(si) do(si) la(sol)
    fad2-+ fad4
    R2.

    %214
    mi8(sol) fad(la) sold(si)\mbreak
    la4. do8\noBeam si(re)
    do(si) do(la) mi'[(fad)]

    %217
    sol4 fad-+ mi
    si'2.~
    si8 la si fad sol mi

    %220
    mi4(red-+) mi
    si2.
    la'4. si8 sol4-+~

    %223
    sol8 fad fad4.-+ mi8
    mi4 si2\mbreak
    r8 si do (re) do (si)

    %226
    re4 do-+ si
    r4 do8 do si do
    la4-+ la2

    %229
    r8 la\noBeam si do si la
    do4 si-+ la
    r4 si8 si la si

    %232
    sol4-+ sol2
    la8(si) do(si) la(sol)
    fad2-+ fad4

    %235
    R2.
    mi8(sol) fad(la) sold(si)\mbreak
    la4. do8\noBeam si re

    %238
    do si do(la) mi' (fad)
    sol4 fad-+ mi
    si'2.~

    %241
    si8 la si fad sol mi
    mi4(red\prall) mi
    si2.

    %244
    la'4. si8 sol4-+~
    sol8 fad fad4.-+ mi8
    mi4 \mbreak sold,16\tu si mi si sold si mi si

    %247
    la dod mi dod la dod mi dod la dod mi dod
    sold si dod red mi fad sold la si4
    \appoggiatura la8 sold4 la sold16(fad8 sold16)

    %250
    sold8-+ mi sold,16 si mi si sold si mi si
    la dod mi dod la dod mi dod la dod mi dod\mbreak
    sold si dod red mi fad sold la si4 %% inizio p. 31

    %253
    fad sold \appoggiatura fad8 mi4
    fad la8 sold la sold
    fad4.-+ mi8 fad4

    %256
    si,2 mi4~
    mi8 la fad4.-+ si8
    sold4-+ la8 sold la sold

    %259
    fad4.-+ mi8 fad4
    si,2 mi4~\mbreak
    mi8 fad fad4.-+ mi8

    %262
    mi si16 la sold8[sold] sold la16 si
    fad si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad' si, fad' si, fad' si, sold' si, la' si, sold' si,

    %265
    fad'4-+ mi8[fad] sold lad
    \appoggiatura lad si2 si4
    r8 si16 la? sold8[sold] sold la16 si\mbreak

    %268
    fad si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad' si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad'4-+ mi8 fad sold lad

    %271
    \appoggiatura lad si2 si4
    r8 <fad' red>16\acc <fad red> <fad red>8 <fad red> <fad red> <fad red>
    <fad red> sold16 fad sold fad sold fad sold fad sold fad

    %274
    mi8 <mi dod>16\acc <mi dod> <mi dod>8 <mi dod> <mi dod> <mi dod>\mbreak
    la8 si sold4.-+(fad8)
    fad8 <fad red>16\acc <fad red> <fad red>8 <fad red> <fad red> <fad red>

    %277
    <fad red> sold16 fad sold fad sold fad sold fad sold fad
    mi8 <mi dod>16\acc <mi dod> <mi dod>8 <mi dod> <mi dod> <mi dod>
    la8 si sold4.-+(fad8)

    %280
    fad16 si, dod red mi fad sold la si4
    r4 \once\slurUp <sold, si,>2\< ^\markup\italic"acc." (
    <fad si,>8-+\!) sold la(sold) fad-+(mi)

    %283
    fad4  \once\slurUp <sold si,>2^\markup\italic"acc." \< (
    <fad si,>8-+\!) sold la(sold) fad-+(mi)\mbreak
    si'4 mi red

    %286
    dod(si-+) la
    sold si mi,
    la fad4.-+(mi16 fad)

    %289
    sold4 mi' red
    dod (si-+) la
    sold si mi,~

    %292
    mi8 la fad4.-+ mi8
    \once\stemUp mi sold'16\dolce sold sold sold sold sold sold fad mi red\mbreak
    dod8 dod16 dod dod dod dod dod dod dod red mi

    %295
    fad8 fad16 fad fad fad fad fad fad mi red dod
    si8 si16 si si si si si si si dod red
    mi mi mi mi mi red dod si lad dod red mi

    %298
    red4.-+ dod8 si4
    r8 si si4.-+ (la16  si)
    dod8. dod16 dod4.-+ si16 la\mbreak

    %301
    si4 si mi
    red dod si
    la8.-+ sold16 fad4.-+ mi8

    %304
    \once\stemUp mi sold'16 sold sold sold sold sold sold fad mi red\mbreak
    dod8 dod16 dod dod dod dod dod dod dod red mi
    fad8 fad16 fad fad fad fad fad fad mi red dod

    %307
    si8 si16 si si si si si si si dod red
    mi mi mi mi mi red dod si lad dod red mi
    red4.-+ dod8 si4

    %310
    r8 si si4.-+ (la16  si)
    dod8. dod16 dod4.-+ (si16 la)
    si4 si mi

    %313
    red dod si
    la8.-+ sold16 fad4.-+ mi8
    mi8 sold16 sold si si mi mi si si sold sold\mbreak

    %316
    dod dod la la dod dod mi mi dod dod la la
    si si mi mi sold, sold mi mi si' si mi mi
    red red red red dod dod dod dod si si si si

    %319
    la'4. si8 sold4.-+ fad8 fad4.-+ mi8
    \tuplet 3/6 {
        mi red16 dod si dod si la sold la sold fad
        mi8 mi16 mi mi8 [mi mi mi]}


    %322
    mi2.

}

IXvlIIn = \relative do'' {

    r4 mi\f\tu sold
    fad4.-+ mi8\noBeam red mi
    la4 sold-+ fad

    %4
    mi mi4.-+ red8
    mi4 mi sold
    fad4.-+ mi8\noBeam red mi

    %7
    la4 sold-+ fad
    mi mi4.-+ red8
    mi4. mi8\noBeam  si dod

    %10
    sold4-+ \appoggiatura fad8 mi8.[si'16 fad8.(sold16)]\mbreak
    sold4-+ \appoggiatura fad8 mi8. si'16 dod4~
    dod8 si la4.\prall sold8

    %13
    fad4-+ mi8. mi'16 si8. dod16
    sold4-+ \appoggiatura fad8 mi8.[si'16 fad8.(sold16)]
    sold4-+ \appoggiatura fad8 mi8. si'16 dod4~

    %16
    dod8 si la4.\prall sold8
    fad4-+ si8 dod si dod
    re4 dod fad

    %19
    red?-+ sold \appoggiatura fad8 mi4
    la fad4.\prall si8\mbreak
    sold4-+ si,8 dod si dod

    %22
    re4 dod fad
    red?-+ sold mi\prall~
    mi8 fad fad4.-+ mi8

    %25
    mi si dod red mi fad
    sold4 \appoggiatura sold8 la4. si8
    sold2-+ fad8 sold16 (la)

    %28
    sold4 fad-+ mi
    si'2 si4
    r8 si,\noBeam dod red mi fad

    %31
    sold4 \appoggiatura sold8 la4. si8\mbreak
    sold2-+ fad8 sold16(la)

    %33
    sold4 fad-+ mi
    si'2 si4
    r << <mi, si>4._\markup\italic "acc.[ent]"\\sold,4>> si8

    %36
    dod4 si-+ la
    \appoggiatura la8 si4. dod8\noBeam si mi
    red-+ mi fad[(sold)] la sold16-+(fad)

    %39
    sold4 << <mi si>4.\\sold,4>> si8
    dod4 si-+ la
    << <mi' si>4.\\sold,4>> mi'8\noBeam red la'

    %42
    sold8-+ fad fad4.-+ mi8\mbreak
    mi si16 la sold8[sold] sold la16 si %% metà p. 23
    fad si, fad' si, fad' si, sold' si, la' si, sold' si,

    %45
    fad' si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad'4-+ mi8 fad sold lad
    \appoggiatura lad?8 si2 si4

    %48
    r8 si16 la? sold8[sold] sold la16 si
    fad si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad' si, fad' si, fad' si, sold' si, la' si, sold' si,\mbreak

    %51
    fad'4-+ mi8 fad sold lad
    \appoggiatura lad?8 si2 si4
    r8 si16 la sold8[si16 la] sold fad sold mi

    %54
    dod'8 dod16 dod dod8 dod dod dod
    dod mi16 red dod red dod si lad sold lad fad
    red'8 red16 red red8 red red red

    %57
    red fad16 mi red dod red si la'4\mbreak
    sold8-. fad fad4.-+ mi8
    mi mi,16 fad sold8 si16 la sold fad sold mi

    %60
    dod'8 dod16 dod dod8 dod dod dod
    dod mi16 red dod red dod si lad sold lad fad
    red'8 red16 red red8 red red red

    %63
    red fad16 mi red dod red si la'4
    sold8-+fad fad4.-+ mi8\mbreak
    mi4 si4. dod8

    %66
    \appoggiatura dod re2 \appoggiatura dod8 si4
    r8 mi lad,[(fad)] dod'(mi)
    red?4.-+ dod8 si4

    %69
    r si4. dod8
    \appoggiatura dod re2 \appoggiatura dod8 si4
    r8 mi lad,[(fad)] dod'(mi)

    %72
    red?4.-+ dod8 si4
    r8 <fad' red>16_\markup\italic "acc." <fad red> <fad red>8 <fad red> <fad red> <fad red>
    <fad red>8 mi16 red mi red mi red mi red mi red\mbreak

    %75
    dod8 <mi dod>16_\markup\italic "acc." <mi dod> <mi dod>8 <mi dod> <mi dod> <mi dod>
    fad4 si, mi
    red8 <fad red>16_\markup\italic "acc." <fad red> <fad red>8 <fad red> <fad red> <fad red>

    %78
    r8 mi16 red mi red mi red mi red mi red
    dod8 <mi dod>16_\markup\italic "acc." <mi dod> <mi dod>8 <mi dod> <mi dod> <mi dod>
    fad4 si, mi

    %81
    red16 si dod red mi fad sold la si4
    r4\once\slurUp <sold, si,>2\<  ^\dolce(
    <fad si,>8-+\!) sold la(sold) fad-+(mi)\mbreak

    %84
    fad4_\markup\italic "acc." \once\slurUp <sold si,>2\< (
    <fad si,>8-+\!) sold la(sold) fad-+(mi)
    si'4 dod2~

    %87
    dod4 si\prall la
    sold-+ fad sold~
    sold8 lad lad4.-+ sold16(lad)

    %90
    si4 r r
    R2.*7
    r4 sold mi

    %99
    mi' red si
    mi red-+ si
    mi red\mordent dod

    %102
    si2 si4
    r sold mi
    mi' red si

    %105
    mi red si\mbreak
    mi dod la
    si2 si,4

    %108
    R2.*7\mbreak
    mi'4 red-+ dod
    fad4. sold8 mi4-+~

    %117
    mi8 red dod4.-+ si8
    si2.~
    si

    %120
    r4 \once\slurUp <sold si,>2\< ^\markup\italic"acc." (
    <fad si,>8-+\!) sold la(sold) fad-+(mi)
    fad4  \once\slurUp <sold si,>2^\markup\italic"acc." \< (

    %123
    <fad si,>8-+\!) sold la(sold) fad-+(mi)\mbreak
    si'4 mi red
    dod(si-+) la

    %126
    sold si mi,
    la fad4.-+(mi16 fad)
    sold4 mi' red

    %129
    dod si-+ la
    sold si mi,
    la fad4.-+(mi8)

    %132
    mi4 sold' r16 sold la si\mbreak
    dod,4 la'~la32 si la sold fad mi red dod
    si4 sold'~sold32 la sold fad mi red dod si

    %135
    dod8. la'16 fad4.-+(mi16 fad)
    sold4 sold r16 sold la si
    dod,4 la'~la32 si la sold fad mi red dod

    %138
    si4 sold'~sold32 la sold fad mi red dod si\mbreak
    dod8. la'16 fad4.-+(mi8)
    mi4 sol,\dolce si

    %141
    sol2.
    mi'8(red) mi(red) <<
        mi4\\{
            \once\tieUp mi4_\markup\italic"acc."~
            mi8[fad]
        }
    >> fad4.-+(mi16 fad)

    %144
    sol4 sol, si
    mi,2.
    mi'8(red) mi(red) <<
        mi4\\{
            \once\tieUp mi4_\markup\italic"acc."~
            mi8[fad]
        }
    >> fad4.-+(mi8)\mbreak

    %148
    mi4. sol8 la(si)
    mi,(red) fad[(si,) la(do)]
    si8. mi16 mi,8(fad) \appoggiatura fad sol4~

    %151
    sol8 la sol4.-+ fad8
    sol4 \appoggiatura fad8 \once\stemUp mi sol'(la)[si]
    mi,[(red)] fad(si,) la(do)\mbreak

    %154
    si8. mi16 mi,8(fad) \appoggiatura fad sol4~
    sol8 la fad4.-+ mi8
    mi4 si'4. mi8

    %157
    sol,(fad) si[(re)] re, (fa)
    mi4  sol4. do8
    re, do' si[(la) si(do)]

    %160
    la4-+ la8(si) la(si)\mbreak
    \appoggiatura si do2 si4
    la-+ re8(si) do(la)

    %163
    mi'4 (re\mordent) do
    si4. do16(re) do4-+~
    do8 si la4.-+ sol8

    %166
    sol4 sol' \appoggiatura fad8 mi4
    dod2.-+
    red4 mi fad\mbreak

    %169
    si,2.~
    si8 la do[si la si]
    sol2-+ fad4

    %172
    R2.*4
    r4 mi4. mi8
    si'4 si4.-+ la8

    %178
    sol4. sol8\noBeam la(si)
    do[(si)] la sol fad-+ mi
    si'4 r r

    %181
    R2.
    r4 r8 fad'\noBeam sol la
    fad4\prall \appoggiatura mi8 red4 mi

    %184
    si2 la4\mbreak
    sol-+ fad8 sol la4
    si sol4.\prall  (fad16 sol)

    %187
    fad2-+ r4
    R2.
    r4 r8 fad'\noBeam sol la

    %190
    fad4\prall \appoggiatura mi8 red4 mi
    do4\tu\f si-+ la
    mi'4. si8 la4-+~

    %193
    la8 sol fad4.-+ mi8\mbreak
    mi16\f si' mi fad sol fad  mi re do si la sol
    \once\stemUp fad la' fad sol la sol fad mi red do si la

    %196
    \once\stemUp sol si' sol la si la sol fad mi re? do si
    la8.-+ sol16 fad4.-+(mi16 fad)
    sol si mi fad sol fad  mi re do si la sol

    %199
    \once\stemUp fad la' fad sol la sol fad mi red do si la
    \once\stemUp sol si' sol la si la sol fad mi re? do si
    la8.-+ sol16 fad4.-+(mi8)

    %202
    mi4 sold2\dolce
    r8 sold la[(si)] la (sold)
    <<{\once \override Slur.outside-staff-priority = #500 \stemDown si4 (la) sold\mbreak}\\{s8 s^\mordent}>>

    %205
    r4 la8 la sol? la
    fad4-+ fad2
    r8 fad sol[(la)] sol-+(fad)

    %208
    la4 sol-+ fad
    r4 sol8 sol fad sol
    mi4-+ mi2

    %211
    fad8(sol) la(sol) fad(mi)
    red2-+ red4
    R2.

    %214
    mi8(sol) fad(la) sold(si)\mbreak
    la4. do8\noBeam si(re)
    do(si) do(la) mi'[(fad)]

    %217
    sol4 fad-+ mi
    si'2.~
    si8 la si fad sol mi

    %220
    mi4(red-+) mi
    si2.
    la'4. si8 sol4-+~

    %223
    sol8 fad fad4.-+ mi8
    mi4 sold,2\mbreak   %%% fin qui p. 29
    r8 sold la (si) la (sold)

    %226
    si4 la-+ sold
    r4 la8 la sol? la
    fad4-+ fad2

    %229
    r8 fad\noBeam sol la sol fad
    la4 sol-+ fad
    r4 sol8 sol fad sol

    %232
    mi4-+ mi2
    fad8(sol) la(sol) fad(mi)
    red2-+ red4\mbreak

    %235
    R2.
    mi8(sol) fad(la) sold(si)\mbreak
    la4. do8\noBeam si re

    %238
    do si do(la) mi' (fad)
    sol4 fad-+ mi
    si'2.~

    %241
    si8 la si fad sol mi
    mi4(red\prall) mi
    si2.

    %244
    la'4. si8 sol4-+~
    sol8 fad fad4.-+ mi8
    mi4 \mbreak sold,16\tu si mi si sold si mi si

    %247
    la dod mi dod la dod mi dod la dod mi dod
    sold si dod red mi fad sold la si4
    \appoggiatura la8 sold4 la sold16(fad8 sold16)

    %250
    sold8-+ mi sold,16 si mi si sold si mi si
    la dod mi dod la dod mi dod la dod mi dod\mbreak
    sold si dod red mi fad sold la si4 %% inizio p. 31

    %253
    fad sold \appoggiatura fad8 mi4
    fad la8 sold la sold
    fad4.-+ mi8 fad4

    %256
    si,2 mi4~
    mi8 la fad4.-+ si8
    sold4-+ la8 sold la sold

    %259
    fad4.-+ mi8 fad4
    si,2 mi4~\mbreak
    mi8 fad fad4.-+ mi8

    %262
    mi si16 la sold8[sold] sold la16 si
    fad si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad' si, fad' si, fad' si, sold' si, la' si, sold' si,

    %265
    fad'4-+ mi8[fad] sold lad
    \appoggiatura lad si2 si4
    r8 si16 la? sold8[sold] sold la16 si\mbreak

    %268
    fad si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad' si, fad' si, fad' si, sold' si, la' si, sold' si,
    fad'4-+ mi8 fad sold lad

    %271
    \appoggiatura lad si2 si4
    r8 <fad' red>16\acc <fad red> <fad red>8 <fad red> <fad red> <fad red>
    <fad red> mi16 red mi red mi red mi red mi red

    %274
    dod8 <mi dod>16\acc <mi dod> <mi dod>8 <mi dod> <mi dod> <mi dod>\mbreak
    fad4 si, mi
    red8 <fad red>16\acc <fad red> <fad red>8 <fad red> <fad red> <fad red>

    %277
    <fad red> mi16 red mi red mi red mi red mi red
    dod8 <mi dod>16\acc <mi dod> <mi dod>8 <mi dod> <mi dod> <mi dod>
    fad4 si, mi

    %280
    red16 si dod red mi fad sold la si4
    r4 \once\slurUp <sold, si,>2\< ^\markup\italic"acc." (
    <fad si,>8-+\!) sold la(sold) fad-+(mi)

    %283
    fad4  \once\slurUp <sold si,>2^\markup\italic"acc." \< (
    <fad si,>8-+\!) sold la(sold) fad-+(mi)\mbreak
    si'4 mi red

    %286
    dod(si-+) la
    sold si mi,
    la fad4.-+(mi16 fad)

    %289
    sold4 mi' red
    dod (si-+) la
    sold si mi,~

    %292
    mi8 la fad4.-+ mi8
    \once\stemUp mi sold'16\dolce sold sold sold sold sold sold fad mi red\mbreak
    dod8 dod16 dod dod dod dod dod dod dod red mi

    %295
    fad8 fad16 fad fad fad fad fad fad mi red dod
    si8 si16 si si si si si si si dod red
    mi mi mi mi mi red dod si lad dod red mi

    %298
    red4.-+ dod8 si4
    r8 si si4.-+ (la16  si)
    dod8. dod16 dod4.-+ si16 la\mbreak

    %301
    si4 si mi
    red dod si
    la8.-+ sold16 fad4.-+ mi8

    %304
    \once\stemUp mi sold'16 sold sold sold sold sold sold fad mi red\mbreak
    dod8 dod16 dod dod dod dod dod dod dod red mi
    fad8 fad16 fad fad fad fad fad fad mi red dod

    %307
    si8 si16 si si si si si si si dod red
    mi mi mi mi mi red dod si lad dod red mi
    red4.-+ dod8 si4

    %310
    r8 si si4.-+ (la16  si)
    dod8. dod16 dod4.-+ (si16 la)
    si4 si mi

    %313
    red dod si
    la8.-+ sold16 fad4.-+ mi8
    mi8 sold16 sold si si mi mi si si sold sold\mbreak

    %316
    dod dod la la dod dod mi mi dod dod la la
    si si mi mi sold, sold mi mi si' si mi mi
    red red red red dod dod dod dod si si si si

    %319
    la'4. si8 sold4.-+ fad8 fad4.-+ mi8
    \tuplet 3/6 {
        mi red16 dod si dod si la sold la sold fad
        mi8 mi16 mi mi8 [mi mi mi]
    }

    %322
    mi2.



}

IXflIn = \relative do'' {

    R2.*155
    r8 si\noBeam mi sol si4
    r8 si,\noBeam re fad si4

    %158
    r8 sol, do mi sol4
    r8 re\noBeam sol(fad) sol(la)
    fad4-+ fad8(sol) fad(sol)\mbreak

    %161
    \appoggiatura sol la2 sol4
    fad-+ si8[(sol)] la(do)
    do4 (si-+) la

    %164
    sol4. la16(si) la4-+~
    la8 sol fad4.-+ sol8
    sol4 r r

    %167
    r mi mi
    la2.~\mbreak
    la8 sol fad mi red[(fad)]

    %170
    si,2.~
    si4 mi red-+
    R2.*74

    %146
    r4 r r
    R2.*72

    %319
    R1.
    \tuplet 3/6 {R2.*2}
    \set Score.measureLength = #(ly:make-moment 3 4) R2.

}

IXhbIn = \relative do'' {

    R2.*179
    r4 r8 fad8\noBeam sol la
    fad4\prall \appoggiatura mi8 red4 mi

    %182
    si2.~
    si2 r4
    si2 la4\mbreak

    %185
    sol-+ fad8 sol la4
    si sol4.\prall (fad16 sol)
    fad4.-+ fad'8\noBeam sol la

    %188
    fad4\prall \appoggiatura mi8 red4 mi
    si2.~
    si

    %191
    R2.*55
    r4 mi2~
    mi2.~

    %248
    mi16 si dod red mi fad sold la si4
    \appoggiatura la8 sold4 la sold16(fad8 sold16)
    sold4-+ mi2~

    %251
    mi2.~
    mi16  si dod red mi fad sold la si4
    fad sold \appoggiatura fad8 mi4

    %254
    fad la8 sold la sold
    fad4.-+ mi8 fad4

    %256
    si,2 r4
    R2.*62

    %319
    R1.
    \tuplet 3/6 {R2.*2}
    \set Score.measureLength = #(ly:make-moment 3 4) R2.

}

IXcrIn =  \relative do {

    r4 mi sold
    fad2-+ si4
    la sold fad

    %4
    mi sold fad-+
    mi mi sold

    %6
    fad2-+ si4
    la sold fad
    mi8 la sold4 fad-+

    %9
    mi2 r4
    R2.*15
    r4 si mi8 fad

    %26
    sold4 la4. si8
    sold2-+ fad4
    sold fad-+ mi

    %29
    si'2 si4
    r si, mi8 fad
    sold4 la4. si8\mbreak

    %32
    sold2-+ fad4
    sold fad mi
    si'2 si4

    %35
    R2.*8
    r4 mi,, sold
    si4. si8\noBeam si si

    %45
    si4. si8\noBeam si si
    si4 sold' fad
    fad2 si,4

    %48
    r mi mi,
    si'4. si8\noBeam si si
    si4. si8\noBeam si si\mbreak

    %51
    si4 sold' fad
    fad2 si,4
    R2.*20

    %73
    r8 si'16 si si8 si si si
    si4 mi, r\mbreak
    r8 mi16 mi mi8 mi mi mi

    %76
    la4 sold2-+
    fad8 si, si4 r
    fad' sold r

    %79
    r8 mi16 mi mi8 mi mi mi
    la4 sold2-+
    fad r4

    %82
    r mi2
    si4 r r\mbreak
    r mi2

    %85
    si r4
    R2.*4
    r4 mi2

    %91
    si4 r r
    r4 mi2
    si4 r r

    %94
    R2.*24
    si'2.\<
    si2.~

    %120
    si4\! mi,2
    si4 r r
    r mi2

    %123
    si r4\mbreak
    R2.*8
    r4 si'2~\mbreak

    %133
    si4 la2~
    la4 sold2~
    sold8 fad si4. la8

    %136
    sold4 si2~
    si4 la2~
    la4 sold2~\mbreak

    %139
    sold8. fad16 fad4.-+ mi8
    mi4 r r
    R2.*105

    %246
    r4 mi8 mi mi mi
    mi2.
    r4 sold8 la si4

    %249
    sold la fad
    sold-+ mi8 mi mi mi
    mi2.\mbreak

    %252
    r4 sold8 la si4
    fad sold mi
    si' r r

    %255
    R2.*7
    r4 mi,, sold
    si4. si8\noBeam si si

    %264
    si4. si8\noBeam si si
    si4 sold' fad
    fad2 r4

    %267
    r mi mi,\mbreak
    si'4. si8\noBeam si si
    si4. si8\noBeam si si

    %270
    si4 sold' fad
    fad2 r4
    r8 si16 si si8 si si si

    %273
    si4  mi, r
    r8 mi16 mi mi8 mi mi mi\mbreak
    la4 sold2\mordent

    %276
    fad4 si, r
    fad' sold r
    r8 mi16 mi mi8 mi mi mi

    %279
    la4 sold2-+
    fad r4
    r mi2

    %282
    si4 r r
    r mi2\mbreak
    si2 r4

    %285
    R2.*14
    r4 mi mi
    mi2 r4\mbreak

    %301
    r si' mi,
    si'2 r4
    r si2

    %304
    sold4 mi r
    R2.*5
    r4 mi mi

    %311
    mi2 r4
    r si' mi,
    si'2 r4

    %314
    r si4. la8
    sold2 mi4\mbreak
    mi mi8 mi mi mi

    %317
    mi2 si8 mi,
    si'2 r4
    \tuplet 3/6{r4 la'2

                %320
                sold2.
                mi2 si4}
                mi,2.

}

IXcrIIn = \relative do {

    r4 mi mi,
    si'2-+  r4
    r si r

    %4
    r si2
    sold4 mi mi'
    si2-+ r4

    %7
    r si2
    mi,4 si2
    mi r4

    %10
    R2.*15
    r4 r si'
    mi2 si4

    %27
    mi,2 si'4
    mi si mi
    si2 si4

    %30
    r r si
    mi2 si4\mbreak
    mi,2-+ si'4

    %33
    mi si mi
    si2 si4
    R2.*8

    %43
    r4 mi, sold
    si4. si8\noBeam si si

    %45
    si4. si8\noBeam si si
    si4 sold' fad
    fad2 si,4

    %48
    r mi mi,
    si'4. si8\noBeam si si
    si4. si8\noBeam si si\mbreak

    %51
    si4 sold' fad
    fad2 si,4
    R2.*20

    %73
    r8 fad'16 fad fad8 fad fad fad
    fad4 sold r
    r8 mi16 mi mi8 mi mi mi

    %76
    si4 mi,2
    si r4
    si' mi, r

    %79
    r8 mi'16 mi mi8 mi mi mi
    si4 si2-+
    si r4

    %82
    r mi2
    si4 r r\mbreak
    r mi2

    %85
    si r4
    R2.*4
    r4 mi2

    %91
    si4 r r
    r4 mi2
    si4 r r

    %94
    R2.*24
    si'2.\<
    mi,4 fad sold

    %120
    fad\! mi2
    si4 r r
    r mi2

    %123
    si r4\mbreak
    R2.*8
    r4 sold'2~\mbreak

    %133
    sold4 fad2~
    fad4 mi2~
    mi4 si2

    %136
    mi,4 sold'2~
    sold 4fad2~
    fad4 mi2~\mbreak

    %139
    mi4 si2
    sold4 r r
    R2.*105

    %246
    r4 mi'8 mi mi mi
    mi2.
    r4 mi si

    %249
    mi2 si4
    mi, mi'8 mi mi mi
    mi2.\mbreak

    %252
    r4 mi mi,
    si'2 mi4
    si r r

    %255
    R2.*7
    r4 mi, sold
    si4. si8\noBeam si si

    %264
    si4. si8\noBeam si si
    si4 sold' fad
    fad2 r4

    %267
    r mi mi,\mbreak
    si'4. si8\noBeam si si
    si4. si8\noBeam si si

    %270
    si4 sold' fad
    fad2 r4
    r8 fad16 fad fad8 fad fad fad

    %273
    fad4 sold r
    r8 mi16 mi mi8 mi mi mi\mbreak
    si4 mi,2

    %276
    si r4
    si' mi, r
    r8 mi'16 mi mi8 mi mi mi

    %279
    si4 si2
    si r4
    r mi2

    %282
    si4 r r
    r mi2\mbreak
    si2 r4

    %285
    R2.*14
    r4 mi mi
    mi2 r4\mbreak

    %301
    r si' mi,
    si'2 r4
    r si2

    %304
    sold4 mi r
    R2.*5
    r4 mi mi

    %311
    mi2 r4
    r si' mi,
    si'2 r4

    %314
    r si4. la8
    sold2 mi4\mbreak
    mi mi8 mi mi mi

    %317
    mi2 si8 mi,
    si'2 r4
    \tuplet 3/6{r4 si2

                %320
                mi,2.
                mi}
    mi2.

}

IXhcIn = \relative do'' {

    r4 si si
    si2 la8 sold
    fad4 si la

    %4
    sold fad la
    sold si si
    si2 la8 sold

    %7
    fad4 si si
    si8 la sold4 fad-+
    mi r fad

    %10
    mi r red\mbreak
    mi2 mi4~
    mi8 sold fad4. mi8

    %13
    red4-+ mi fad
    mi r red
    mi2 mi4~

    %16
    mi8 sold fad4.-+ mi8
    red2-+ fad4
    si la dod

    %19
    si red dod~
    dod si4. si8\mbreak
    si4 sold sold8 la

    %22
    si4 la dod
    si red dod~
    dod8 red red4.-+ dod16(red)

    %25
    mi2 si4
    mi fad red-+
    mi2 si4

    %28
    r si mi
    red4.-+ dod8 si4
    r sold si8 la

    %31
    sold mi' fad4 red-+\mbreak  %% fine p. 22
    mi2 si4
    r si mi

    %34
    red4.-+ dod8 si4
    r sold4. sold8
    la4 mi fad

    %37
    sold4. mi8 si'4~
    si8 mi red[mi dod red]
    mi4 mi, sold

    %40
    la mi fad
    sold4. sold8\noBeam fad si
    si mi red4.-+ mi8\mbreak

    %43
    mi2 si4
    si2 si4
    si2 si4

    %46
    si si dod
    fad,2 si8 la
    sold sold16 fad mi8 si si mi

    %49
    mi si' la[sold fad mi]
    red si' la[sold fad mi]\mbreak
    red4 si mi

    %52
    red2-+ si4
    r si mi
    mi2 dod4

    %55
    r dod fad
    fad2 fad4
    r fad si\mbreak %%% fine p. 23

    %58
    si8 mi red4.-+ mi8
    mi4 si mi,
    mi2 mi4

    %61
    r dod fad
    fad2 fad4
    r fad si

    %64
    si8 dod si4. la8\mbreak
    sold4-+sol2
    fad si4~

    %67
    si dod lad-+
    si2 si4
    r sol2

    %70
    fad si4~
    si dod lad
    si2 si,4

    %73
    r8 si'16 si si8 si si si
    si4 si2\mbreak
    la8 la16 la la8 la dod dod

    %76
    si4 si2
    si8 si16 si si8 si si si
    si4 si2

    %79
    la8 la16 la la8 la dod dod
    si4 si2
    si si4

    %82
    r mi,2
    si4 r r %% fine p. 24
    r mi2

    %85
    si4 r r
    r la'2
    la4(sold-+) red

    %88
    mi fad si,~
    si mi2
    red4-+ mi2

    %91
    si4 r r
    r mi2
    si4 r r

    %94
    r la' fad-+\mbreak
    mi2 sold4
    fad red-+ mi~

    %97
    mi8 fad red4.-+ mi8
    mi2 r4
    R2.*10

    %109
    r4 fad2
    fad4 r r
    r fad2

    %112
    fad r4
    dod' mi red
    dod mi red\mbreak%fine p. 25

    %115
    dod si lad
    red4. mi8 dod4~
    dod8 si lad4.-+ si8

    %118
    si4 si fad
    sold la si
    red,-+ mi2

    %121
    si4 r r
    r mi2
    si4 r r\mbreak

    %124
    r si' sold
    la sold si
    mi, red dod

    %127
    mi red2-+
    mi4 sold si
    mi,2 fad4

    %130
    mi red dod
    mi red4.-+ mi8
    mi4 si'2~\mbreak

    %133
    si4 la2~
    la4 sold4. si8
    la dod si2

    %136
    si4 si2~
    si4 dod la~
    la si sold\mbreak %% fine p. 26

    %139
    sold8(fad) si4. la8
    sold4 r r
    r sol mi

    %142
    si'2 do4
    si8 mi mi4 red-+
    mi2 r4

    %145
    r la, si
    do2 si4~
    si8 mi mi4 red-+\mbreak

    %148
    mi2 si4
    do8 si la4. red,8
    mi2 si4~

    %151
    si8 fad' mi4. red8
    mi2 si'4
    do8 si la4. red,8

    %154
    mi2 si4~
    si8 mi red4.-+ mi8
    mi4 r r

    %157
    R2.*19
    r4 sol2\mbreak
    r4 fad sol

    %178
    mi2-+ mi4
    r fad la
    red,2-+ r4

    %181
    R2.*10
    la'4\f si do
    si4. sol8 fad4~

    %193
    fad8 mi red4.-+ mi8\mbreak
    mi4 si'2
    r4 do2

    %196
    r4 si2~
    si8 mi, mi4 red-+
    mi si'2\mbreak

    %199
    r4 do2
    r4 si4. sol8
    fad mi red4.-+ mi8

    %202
    mi2 r4
    R2.*43
    r4 sold2  %% inizio Majeur

    %247
    r4 la2
    r4 sold mi
    r fad red-+

    %250
    mi sold8 sold sold sold
    la4 la fad-+\mbreak
    sold4 mi' si

    %253
    red si mi
    red mi8 red mi red
    dod2 la4

    %256
    fad2 si4
    dod si4. la8
    sold4 mi'8 red mi red

    %259
    dod4. si8 dod4
    fad,2 sold4\mbreak
    dod si4. la8

    %262
    sold2-+ si4
    si2 si4
    si2 si4

    %265
    si si dod
    fad,2 fad4
    r si, mi\mbreak

    %268
    red8 si' la[sold fad mi]
    red[si'] la sold fad mi
    red4 si mi

    %271
    red2-+ red4
    r8 si'16 si si8 si si si
    si4 si2

    %274
    la8 la16 la la8 la dod [dod]\mbreak  %% Fine p. 31
    si4 si2
    r8 si16 si si8 si si si

    %277
    si4 si2
    la8 la16 la la8 la dod dod
    si4 si2

    %280
    si r4
    r mi,2
    red4 r r

    %283
    r mi2\mbreak
    si4 r r
    r si' sold

    %286
    la sold si
    mi, red dod
    mi red2\mordent

    %289
    mi4 sold la
    mi2 fad4
    mi red dod

    %292
    mi red4.-+ mi8
    mi4 sold2\mbreak
    r4 dod2

    %295
    r4 fad,2
    r4 si2
    r4 si lad

    %298
    si2 r4
    r8 sold sold4.-+(fad16 sold)
    la4 mi la\mbreak  %% fine p. 32

    %301
    sold8 mi si'4 lad-+
    si fad sold
    red8. mi16 red4.-+ mi8

    %304
    mi4 sold2
    r4 dod la
    r fad2

    %307
    r4 si sold\mbreak
    r8 si si4 lad-+
    si2 fad4

    %310
    r8 sold sold4.-+(fad16 sold)
    la4 mi la
    sold8 mi si'4 lad-+

    %313
    si fad sold
    red8. mi16 red4.-+ mi8
    mi2 si4\mbreak

    %316
    la2 dod4
    si si'8 si si[lad]
    si4 fad si

    %319
    fad'2 si,4. mi8 red4.-+ mi8
    \tuplet 3/6 {
        mi8 red16 dod si dod si la sold la sold fad
        mi8 mi16 mi mi8 [mi mi mi]
    }

    %322
    mi2.

}

IXhcIIn = \relative do' {

    r4 si mi
    red4.-+ mi8 fad4
    si,2 red4

    %4
    mi8 dod si2
    si4 si mi
    red4.-+ mi8 fad4

    %7
    si,2 red4
    mi8 dod' si4 la
    sold mi si

    %10
    r si si\mbreak
    r sold la
    r la dod

    %13
    si sold' fad
    si, r si
    si sold la

    %16
    r la dod
    si2 si'4
    mi,2 la4

    %19
    fad si sold~
    sold fad red\mbreak
    mi2 mi4

    %22
    mi2 la4
    fad si sold
    dod si4. la8

    %25
    sold2 sold8 fad
    mi4 si' si
    si2 si4

    %28
    r si dod
    fad,2 red4-+
    r mi sold8 fad

    %31
    mi4 si' si\mbreak %% fine p. 22
    si2 si4
    r si dod

    %34
    fad,2 si,4
    r si mi
    mi2.

    %37
    mi2 mi8 sold
    fad mi si'2
    si4 si, mi

    %40
    mi2 mi4
    mi4. si8 si4
    r si'4. la8\mbreak

    %43
    sold2 mi4
    red4. mi8 fad[mi]
    red4. mi8 fad[mi]

    %46
    red4 si mi
    red2-+ si4
    r mi si

    %49
    si4. si8 si[si]
    si4. si8 si[si]\mbreak
    si4 si' dod

    %52
    fad,2-+ red4
    r si sold
    la2 la4

    %55
    r lad fad
    si2 si4
    r si' red,\mbreak  %% fine p. 23

    %58
    mi8 dod' si4. fad8
    sold4 mi sold,
    la2 la4

    %61
    r dod lad
    si2 si4
    r si' red,

    %64
    mi red4.-+ mi8\mbreak
    mi4 mi2
    si' fad4

    %67
    sol fad2
    fad fad4
    r mi2

    %70
    si' fad4
    sol fad2-+
    fad red4-+

    %73
    r8 si'16 si si8 si si si
    si,4 mi2\mbreak
    mi8 mi16 mi mi8 mi la[la]

    %76
    fad4 mi2
    fad8 si16 si si8 si si si
    si,4 mi2

    %79
    mi8 mi16 mi mi8 mi la[la]
    fad4 mi2
    fad si,4

    %82
    r mi2
    si4 r r\mbreak  %% fine p. 24
    r4 mi2

    %85
    si4 r r
    r mi2
    mi fad4

    %88
    si, la' sold~
    sold fad2
    fad4 mi2

    %91
    si4 r r
    r mi2
    si4 r r

    %94
    r mi4. red8\mbreak
    dod2 si4
    dod si si~

    %97
    si8 fad la4. si8
    sold2-+ r4
    R2.*10

    %109
    r4 si2(
    lad4-+) r r
    r si2(

    %112
    lad4-+) r r
    fad'2 si,4
    mi dod red\mbreak  %% fine p. 25

    %115
    lad si dod
    si2 sold'4~
    sold fad4. mi8

    %118
    red4 fad red
    mi fad sold
    fad-+ mi2

    %121
    si4 r r
    r mi2
    si4 r r\mbreak

    %124
    r si mi
    mi2 red4
    dod si la

    %127
    dod si2
    si4 mi sold,
    la si dod

    %130
    dod si la
    dod si4. la8
    si4 sold'2~\mbreak

    %133
    sold4 fad2~
    fad4 mi2~
    mi4 red4.-+(dod16 red)

    %136
    mi4 sold2~
    sold4 la fad~
    fad sold mi~\mbreak

    %139
    mi red4.-+ mi8
    mi4 r r   %% Inizio mineur
    r do' si

    %142
    mi,2 fad4
    sol do si
    si2 r4

    %145
    r mi, sold
    la fad sol?
    do2 si8 fad\mbreak

    %148
    sol2 sol4
    la8 sol fad4. la8
    sol4. red8 mi4

    %151
    do si2
    si sol'4
    la8 sol fad4. la8\mbreak

    %154
    sol4. red8 mi4
    do si2
    sol r4

    %157
    R2.*19
    r4 mi'2\mbreak
    r4 si re

    %178
    do2 mi8 re
    do2 la4
    fad2 r4

    %181
    R2.*10
    fad'4\f sol la
    sol mi do~

    %193
    do si2\mbreak %%fine p. 28
    sol sol'4
    red2 r4

    %196
    mi2 si4
    do si2
    sol sol'4\mbreak

    %199
    red2 r4
    mi2 r8 si
    do4 si2

    %202
    sol r4
    R2.*43
    r4 mi'2  %% inizio majeur

    %247
    r4 mi2
    r4 mi2
    r4 dod si

    %250
    si mi2
    r4 mi2\mbreak
    r4 mi sold

    %253
    si si lad-+
    si la? mi
    fad2 dod4

    %256
    red fad sold
    mi mi4.-+ red8
    mi4 mi dod

    %259
    fad2 dod4
    red fad si,~\mbreak
    si8 mi red4.-+ mi8

    %262
    mi2 mi4
    red4. mi8\noBeam fad mi
    red4. mi8\noBeam fad mi

    %265
    red4 si mi
    red2-+ red4
    r mi si\mbreak

    %268
    si2 si4
    si2 si4
    si si' dod

    %271
    fad,2 fad4
    r8 si,16 si si8 si si si
    si4 mi2

    %274
    mi8 mi16 mi mi8[mi] la la\mbreak  %%fine p. 31
    fad4 mi2
    fad8 si,16 si si8 si si si

    %277
    si4 mi2
    mi8 mi16 mi mi8 mi la la
    fad4 mi2

    %280
    fad r4
    r mi2
    si4 r r

    %283
    r mi2\mbreak
    si4 r r
    r si mi

    %286
    mi si red
    dod si la
    dod si2

    %289
    si4 si sold
    la si dod
    dod si la

    %292
    dod si4. la8
    sold4 mi'2\mbreak
    r4 dod2

    %295
    r4 red2
    r4 si2
    r4 sold' fad

    %298
    fad2 red4-+
    r si mi
    mi2 mi4\mbreak

    %301
    mi8 sold fad4 fad
    fad la mi
    fad8. si,16 si4. la8

    %304
    sold4 mi'2
    r4 dod2
    r4 red2

    %307
    r4 si2\mbreak
    r4 sold' fad
    fad2 red4\mordent

    %310
    r si mi4
    mi2 mi4
    mi8 sold fad4 fad

    %313
    fad la mi
    r si4. la8
    sold2 mi'4\mbreak

    %316
    mi mi8 mi mi la
    sold16 sold sold sold sold sold sold sold fad fad mi mi
    fad4 la mi

    %319
    si2 si si'4. la8
    \tuplet 3/6 {
        sold2.
        mi4 sold si
    }

    %322
    mi,2.

}

IXfgn = \relative do {

    r4 sold'4 mi
    si' la8 sold fad mi
    red4-+ mi fad

    %4
    sold8 la si4 si,
    mi sold mi
    si' la8 sold fad mi

    %7
    red4-+ mi fad
    sold8 la si4 si,
    mi r red

    %10
    mi r si\mbreak
    mi2 la,4~
    la8 si dod4 la

    %13
    si mi,8. mi'16 red4
    mi r si
    mi2 la,4~

    %16
    la8 si dod4 la
    si2 si'8 la
    sold4 la fad

    %19
    si sold dod~
    dod red si\mbreak
    mi8 mi red dod si la

    %22
    sold4 la fad
    si sold  dod
    la si si,

    %25
    mi2 r4
    mi' red si
    mi2 red4

    %28
    mi red-+ dod
    si si8 la sold-+ fad
    mi2.

    %31
    mi'4 red si\mbreak % fine p 22
    mi2 red4
    mi red-+ dod

    %34
    si8 la si dod si la
    sold fad mi fad sold mi
    la,2 la'4

    %37
    sold8 la sold fad sold mi
    si'2 si,4
    mi8 fad sold fad sold mi

    %40
    la,2 la4
    mi8 fad sold mi si'4
    mi8 la, si2\mbreak

    %43
    mi,2 mi'4
    si'4. mi,8 red[mi]
    si'4. mi,8 red[mi]

    %46
    si4 mi dod-+
    si4 si8 la sold-+ fad
    mi2 mi'4

    %49
    si'4. mi,8 red[mi]
    si'4. mi,8 red[mi]
    si4 mi dod-+

    %52
    si2 r8 si'16 la
    sold8 si mi, sold16 fad mi red dod si
    la8 la16 si dod re dod si la si la sold

    %55
    \once\stemUp fad8 dod'' fad, lad16 sold fad mi red dod
    si8 si16 si si8 dod16 red mi fad sold la
    si8 red16 dod si la si dod red dod red si\mbreak

    %58 %% fine p. 23
    mi8 la, si4 si,8 si'16 la
    sold8 si mi, sold16 fad mi red dod si
    la8 la16 si dod re dod si la si la sold

    %61
    \once\stemUp fad8 dod'' fad, lad16 sold fad mi red dod
    si8 si16 si si8 dod16 red mi fad sold la
    si8 red16 dod si la si dod red dod red si

    %64
    mi8 la, si4 si,\mbreak
    mi4 mi'2
    re2.

    %67
    dod
    si8 la si dod red si
    mi4 mi,2

    %70
    re2.
    dod
    si4. dod16 red mi fad sold la

    %73
    si8 si16 si si8 si si si
    si4 sold2\mbreak
    la8 la16 la la8 dod16 si la sold fad mi

    %76
    red4-+ mi mi,
    si'8 si16 si si8 si si si
    si'4 sold2

    %79
    la8 la16 la la8 dod16 si la sold fad mi
    red4 mi mi,
    si'2 r4

    %82
    r mi'2(
    red4-+) r r\mbreak  %% fine p. 24
    r mi2(

    %85
    red4-+) mi,2
    sold,4 la2
    si si4

    %88
    mi red mi~
    mi fad fad,
    si mi'2(

    %91
    red4-+) r r
    r mi2(
    red4-+) mi,2

    %94
    sold,4 la4. si8\mbreak
    dod2 sold4
    la si mi

    %97
    la, si2
    mi, r4
    R2.*3

    %102
    r4 si''8 la sold-+ fad
    mi2 r4
    R2.*4
    r4 si'2(

    %109
    lad4-+) si2\dolce
    fad4 si2(
    lad4-+) si2

    %112
    fad2.
    fad'4 dod red
    si(lad-+ si)\mbreak %% fine p. 25

    %115
    fad2 mi4
    red2 mi4~
    mi fad fad,

    %118
    si si'\f la
    sold fad mi
    si4  mi'2(

    %121
    red4-+) r r
    si,4 mi'2(
    red4-+) mi,2\mbreak

    %124
    sold,2 mi4
    la si2
    dod4 sold la~

    %127
    la si2
    mi4 sold mi
    la sold fad

    %130
    dod' sold la~
    la si si,
    mi, mi' r16 mi\f fad sold\mbreak

    %133
    la,2 fad'4
    sold,2 mi'4
    la si si,

    %136
    mi mi r16 mi fad sold
    la,2 fad'4
    sold,2 mi'4\mbreak %% fine p. 26

    %139
    la si si,
    mi r r
    r do\dolce mi

    %142
    sol,2 la4
    sol fad si
    mi, mi' re

    %145
    r do mi
    la,2 sol4
    la fad si\mbreak

    %148
    mi, mi'2
    r4 fad2
    r4 sol8 fad mi4

    %151
    la, si2
    mi,4 mi'2
    r4 fad2\mbreak

    %154
    r4 sol8 fad mi4
    la si si,
    mi, mi'2

    %157
    si2.
    do
    sol

    %160
    re'8 re' do si la sol\mbreak %% fine p. 27
    fad2 sol4
    re2.

    %163
    do4 re2
    mi4 si do~
    do re re,

    %166
    sol2 r4
    r la' sol
    fad2.\mbreak

    %169
    sol4 la si
    red,2 si4
    mi mi, si'

    %172
    r mi4. mi8
    si'4 si4.-+ la8
    sol4.~sol8 la[(si)]

    %175
    do(si) la(sol) fad-+[mi]
    si'4 mi,2\mbreak
    r4 re si-+

    %178
    do2 do8 si
    la4 si do
    si2 r4

    %181
    R2.*3
    sol'2 fad4\mbreak
    mi-+red8 mi fad4

    %186
    red-+ mi mi,
    si'2 r4
    R2.*3

    %191
    la'4\f sol-+ fad
    sol sol, la~

    %193
    la si2 %% fine p. 28
    mi,4 mi'2
    r4 fad2

    %196
    r4 sol2
    la4 si si,
    mi mi,2\mbreak

    %199
    r4 fad2
    r4 sol2
    la4 si2

    %202
    mi,4 mi''2\dolce
    sold,2 r4
    mi2 r4\mbreak

    %205
    la,4 la'2
    re4 re2
    fad, r4

    %208
    re2 r4
    sol sol2
    r4 do si

    %211
    la2.
    si2 r4
    \clef tenor \key mi\minor si8(re) dod(mi) red(fad)

    %214
    mi2.~\mbreak
    mi8 mi, fad(la) sold(si)
    la4. mi8\noBeam la do

    %217
    si4 si mi
    mi (red-+) mi
    \clef bass\key mi\minor si2.~

    %220
    si8 la si(fad) sol(mi)
    red2 si4
    fad'8 sol la do si4~

    %223
    si8 mi red4.-+ mi8
    mi4 mi2\mbreak %%fine p. 29
    sold,2 r4

    %226
    mi2 r4
    la, la'2
    re4 re2

    %229
    fad, r4
    re2 r4
    sol sol2

    %232
    r4 do si
    la2.
    si2 si,4\mbreak

    %235
    \clef tenor \key mi\minor si'8(re) dod(mi) red(fad)
    mi2.~\mbreak
    mi8 mi, fad(la) sold(si)

    %238
    la4. mi8\noBeam la do
    si4 si mi
    mi (red-+) mi

    %241
    \clef bass\key mi\minor si2.~
    si8 la si(fad) sol(mi)
    red2 si4

    %244
    fad'8 sol la do si4~
    si8 mi red4.-+ mi8
    mi4 mi2\mbreak

    %247
    r4 la,2
    mi4. fad16 sold la si dod red
    mi4 la, si

    %250
    r8 mi,\noBeam mi mi mi mi
    r8 la,\noBeam la la la la\mbreak %% fine p. 30
    mi2 mi''4

    %253
    red mi dod-+
    si dod8 si dod si
    la2.

    %256
    la,2 sold4
    la si2
    mi8[fad] dod si dod si

    %259
    la2.
    la'2 sold4\mbreak
    la si si,

    %262
    mi4. mi16 fad sold8 mi
    si'4. mi,8\noBeam red mi
    si4. mi8\noBeam red mi

    %265
    si4 mi dod-+
    si8 dod16 red mi fad sold la si dod si la
    sold la sold fad mi red mi fad sold fad sold mi\mbreak

    %268
    si'4. mi,8\noBeam red8 mi
    si4. mi8\noBeam red mi
    si4 mi dod-+

    %271
    si8 dod16 red mi fad sold la si4
    r8 si16 si si8 si si si
    si4 sold2

    %274
    la8 la16 la la8 dod16 si la sold fad mi\mbreak  %% fine p. 31
    red4 mi mi,
    si'8 si16 si si8 si si si

    %277
    si'4 sold2
    la8 la16 la la8 dod16 si la sold fad mi
    red4 mi mi,

    %280
    si'2 r4
    r mi'2(
    red4-+) r r

    %283
    r mi2(\mbreak
    red4-+) mi,2
    sold, mi4

    %286
    la si2
    dod4 sold la~
    la si2

    %289
    mi4 sold mi
    la sold-+ fad
    dod' sold la~

    %292
    la si si,
    mi2 r4\mbreak
    r8 la16\f la la la la la la sold fad mi

    %295
    red2 r4
    r8 sold16 sold sold sold sold sold sold fad mi red
    dod dod dod dod dod dod red mi fad8 fad,

    %298
    si16 fad' sold la si la si dod si dod si la
    sold la sold fad mi fad mi fad sold fad sold mi
    la8 la,16 la dod dod mi mi dod dod la la\mbreak  %%fine p. 32

    %301
    mi'16 mi mi mi red red red red dod dod dod dod
    si si si si la la la la sold sold sold sold
    fad8. mi16 si'2

    %304
    mi, r4
    r8 la'16 la la la la la la sold fad mi
    red4 red, r

    %307
    r8 sold'16 sold sold sold sold sold sold fad mi red\mbreak
    dod dod dod dod dod dod red mi fad8 fad,
    si16 fad' sold la si la si dod si dod si la

    %310
    sold la sold fad mi fad mi fad sold fad sold mi
    la la la, la dod dod mi mi dod dod la la
    mi'16 mi mi mi red red red red dod dod dod dod

    %313
    si si si si la la la la sold sold sold sold
    fad8. mi16 si'2
    mi,4. mi'16 mi sold sold mi mi\mbreak

    %316
    la la dod dod mi mi dod dod la, la dod dod
    mi mi mi mi mi mi mi mi red red dod dod
    si si si si la la la la sold sold sold sold

    %319
    red2 mi si'
    \tuplet 3/6 {
        mi'8 red16 dod si dod si la sold la sold fad
        mi8 mi16 mi mi8 [mi mi mi]
    }

    %232
    mi2.

}

IXbcn = \relative do {

    r4 sold'4 mi
    si' la8 sold fad mi
    red4-+ mi fad

    %4
    sold8 la si4 si,
    mi sold mi
    si' la8 sold fad mi

    %7
    red4-+ mi fad
    sold8 la si4 si,
    mi r red

    %10
    mi r si\mbreak
    mi2 la,4~
    la8 si dod4 la

    %13
    si mi,8. mi'16 red4
    mi r si
    mi2 la,4~

    %16
    la8 si dod4 la
    si2 si'8 la
    sold4 la fad

    %19
    si sold dod~
    dod red si\mbreak
    mi8 mi red dod si la

    %22
    sold4 la fad
    si sold  dod
    la si si,

    %25
    mi2 r4
    mi' red si
    mi2 red4

    %28
    mi red-+ dod
    si si8 la sold-+ fad
    mi2.

    %31
    mi'4 red si\mbreak % fine p 22
    mi2 red4
    mi red-+ dod

    %34
    si8 la si dod si la
    sold fad mi fad sold mi
    la,2 la'4

    %37
    sold8 la sold fad sold mi
    si'2 si,4
    mi8 fad sold fad sold mi

    %40
    la,2 la4
    mi8 fad sold mi si'4
    mi8 la, si2\mbreak

    %43
    mi,2 mi'4
    si'4. mi,8 red[mi]
    si'4. mi,8 red[mi]

    %46
    si4 mi dod-+
    si4 si8 la sold-+ fad
    mi2 mi'4

    %49
    si'4. mi,8 red[mi]
    si'4. mi,8 red[mi]
    si4 mi dod-+

    %52
    si2 r8 si'16 la
    sold8 si mi, sold16 fad mi red dod si
    la8 la16 si dod re dod si la si la sold

    %55
    \once\stemUp fad8 dod'' fad, lad16 sold fad mi red dod
    si8 si16 si si8 dod16 red mi fad sold la
    si8 red16 dod si la si dod red dod red si\mbreak

    %58 %% fine p. 23
    mi8 la, si4 si,8 si'16 la
    sold8 si mi, sold16 fad mi red dod si
    la8 la16 si dod re dod si la si la sold

    %61
    \once\stemUp fad8 dod'' fad, lad16 sold fad mi red dod
    si8 si16 si si8 dod16 red mi fad sold la
    si8 red16 dod si la si dod red dod red si

    %64
    mi8 la, si4 si,\mbreak
    mi4 mi'2
    re2.

    %67
    dod
    si8 la si dod red si
    mi4 mi,2

    %70
    re2.
    dod
    si4. dod16 red mi fad sold la

    %73
    si8 si16 si si8 si si si
    si4 sold2\mbreak
    la8 la16 la la8 dod16 si la sold fad mi

    %76
    red4-+ mi mi,
    si'8 si16 si si8 si si si
    si'4 sold2

    %79
    la8 la16 la la8 dod16 si la sold fad mi
    red4 mi mi,
    si'2 r4

    %82
    R2.
    r4 mi2\mbreak  %% fine p. 24
    si4 r r

    %85
    r mi2\tu
    sold,4 la2
    si si4

    %88
    mi red mi~
    mi fad fad,
    si r r

    %91
    r mi2
    si4 r r
    r mi2\tu

    %94
    sold,4 la4. si8\mbreak
    dod2 sold4
    la si mi

    %97
    la, si2
    mi, r4
    R2.*3

    %102
    r4 si''8 la sold-+ fad
    mi2 r4
    R2.*5

    %109
    r4 si'2\dolce
    fad4 r r
    r si2\tu

    %112
    fad2.
    fad'4 dod red
    si(lad-+ si)\mbreak %% fine p. 25

    %115
    fad2 mi4
    red2 mi4~
    mi fad fad,

    %118
    si si'\f la
    sold fad mi
    si4 r r

    %121
    r mi2
    si4 r r
    r mi2\tu \mbreak

    %124
    sold,2 mi4
    la si2
    dod4 sold la~

    %127
    la si2
    mi4 sold mi
    la sold fad

    %130
    dod' sold la~
    la si si,
    mi, mi' r16 mi\f fad sold\mbreak

    %133
    la,2 fad'4
    sold,2 mi'4
    la si si,

    %136
    mi mi r16 mi fad sold
    la,2 fad'4
    sold,2 mi'4\mbreak %% fine p. 26

    %139
    la si si,
    mi r r
    r do\dolce mi

    %142
    sol,2 la4
    sol fad si
    mi, mi' re

    %145
    r do mi
    la,2 sol4
    la fad si\mbreak

    %148
    mi, mi'2
    r4 fad2
    r4 sol8 fad mi4

    %151
    la, si2
    mi,4 mi'2
    r4 fad2\mbreak

    %154
    r4 sol8 fad mi4
    la si si,
    mi, mi'2

    %157
    si2.
    do
    sol

    %160
    re'8 re' do si la sol\mbreak %% fine p. 27
    fad2 sol4
    re2.

    %163
    do4 re2
    mi4 si do~
    do re re,

    %166
    sol2 r4
    r la' sol
    fad2.\mbreak

    %169
    sol4 la si
    red,2 si4
    mi mi, si'

    %172
    r mi2
    r4 sol, mi
    do'2 do8 si

    %175
    la4 si do
    si mi2\mbreak
    r4 re si-+

    %178
    do2 do8 si
    la4 si do
    si2 r4

    %181
    R2.*10
    la'4\f sol-+ fad
    sol sol, la~

    %193
    la si2 %% fine p. 28
    mi,4 mi'2
    r4 fad2

    %196
    r4 sol2
    la4 si si,
    mi mi,2\mbreak

    %199
    r4 fad2
    r4 sol2
    la4 si2

    %202
    mi,4 mi''2\dolce
    sold,2 r4
    mi2 r4\mbreak

    %205
    la,4 la'2
    re4 re2
    fad, r4

    %208
    re2 r4
    sol sol2
    r4 do si

    %211
    la2.
    si2 r4
    si,2 la4

    %214
    sol la si\mbreak
    do re mi
    la,2 la'4

    %217
    mi8 mi' re4 do
    si8(la) si(fad) sol(mi)
    mi4 red-+(mi)

    %220
    si2.~
    si8 la si(fad) sol(mi)
    red4 fad sol

    %223
    la si2
    mi4 mi'2\mbreak %%fine p. 29
    sold,2 r4

    %226
    mi2 r4
    la, la'2
    re4 re2

    %229
    fad, r4
    re2 r4
    sol sol2

    %232
    r4 do si
    la2.
    si\mbreak

    %235
    si,2 la4
    sol la si
    do re mi

    %238
    la,2 la'4
    mi8 mi' re4 do
    si8 la si fad sol mi

    %241
    red2-+ mi4
    si2.~
    si8 la si fad sol mi

    %244
    red4 fad sol
    la si2
    mi,4 mi''2

    %247
    r4 la,2
    mi4. fad16 sold la si dod red
    mi4 la, si

    %250
    r8 mi,\noBeam mi mi mi mi
    r8 la,\noBeam la la la la\mbreak %% fine p. 30
    mi2 mi''4

    %253
    red mi dod-+
    si dod8 si dod si
    la2.

    %256
    la,2 sold4
    la si2
    mi8[fad] dod si dod si

    %259
    la2.
    la'2 sold4\mbreak
    la si si,

    %262
    mi4. mi16 fad sold8 mi
    si'4. mi,8\noBeam red mi
    si4. mi8\noBeam red mi

    %265
    si4 mi dod-+
    si8 dod16 red mi fad sold la si dod si la
    sold la sold fad mi red mi fad sold fad sold mi\mbreak

    %268
    si'4. mi,8\noBeam red8 mi
    si4. mi8\noBeam red mi
    si4 mi dod-+

    %271
    si8 dod16 red mi fad sold la si4
    r8 si16 si si8 si si si
    si4 sold2

    %274
    la8 la16 la la8 dod16 si la sold fad mi\mbreak  %% fine p. 31
    red4 mi mi,
    si'8 si16 si si8 si si si

    %277
    si'4 sold2
    la8 la16 la la8 dod16 si la sold fad mi
    red4 mi mi,

    %280
    si'2 r4
    R2.
    r4 mi2\dolce

    %283
    si4 r r\mbreak
    r mi2\tu
    sold, mi4

    %286
    la si2
    dod4 sold la~
    la si2

    %289
    mi4 sold mi
    la sold-+ fad
    dod' sold la~

    %292
    la si si,
    mi2 r4\mbreak
    r8 la16\f la la la la la la sold fad mi

    %295
    red2 r4
    r8 sold16 sold sold sold sold sold sold fad mi red
    dod dod dod dod dod dod red mi fad8 fad,

    %298
    si16 fad' sold la si la si dod si dod si la
    sold la sold fad mi fad mi fad sold fad sold mi
    la8 la,16 la dod dod mi mi dod dod la la\mbreak  %%fine p. 32

    %301
    mi'16 mi mi mi red red red red dod dod dod dod
    si si si si la la la la sold sold sold sold
    fad8. mi16 si'2

    %304
    mi, r4
    r8 la'16 la la la la la la sold fad mi
    red4 red, r

    %307
    r8 sold'16 sold sold sold sold sold sold fad mi red\mbreak
    dod dod dod dod dod dod red mi fad8 fad,
    si16 fad' sold la si la si dod si dod si la

    %310
    sold la sold fad mi fad mi fad sold fad sold mi
    la la la, la dod dod mi mi dod dod la la
    mi'16 mi mi mi red red red red dod dod dod dod

    %313
    si si si si la la la la sold sold sold sold
    fad8. mi16 si'2
    mi,4. mi'16 mi sold sold mi mi\mbreak

    %316
    la la dod dod mi mi dod dod la, la dod dod
    mi mi mi mi mi mi mi mi red red dod dod
    si si si si la la la la sold sold sold sold

    %319
    red2 mi si'
    \tuplet 3/6 {
        mi'8 red16 dod si dod si la sold la sold fad
        mi8 mi16 mi mi8 [mi mi mi]
    }

    %232
    mi2.

}

IXbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \key mi\major
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 53
    s2.*139
    s4 \break \key mi\minor s2
    \once \override Score.RehearsalMark.extra-offset = #'(-8 . +1)\mark\markup \huge"Mineur"
    s2.*105
    s4\break \key mi\major s2
    \once \override Score.RehearsalMark.extra-offset = #'(-8 . +1)\mark\markup \huge"Majeur"
    s2.*72\break
    \time 3/2
    \tempo 1 = 30
    s1.*3
    s2.
    \bar "|."

}


IXvlI = {
    \IXglobal
    %\notypeset
    <<\IXvlIn \forma>>
}


IXvlII = {
    \IXglobal
    <<\IXvlIIn \forma>>
}


IXhbI = {
    \IXglobal
    <<\IXhbIn \forma>>
}


IXflI = {
    \IXglobal
    <<\IXflIn \forma>>
}


IXcrI = {
    \IXglobal
    \clef bass
    <<\IXcrIn \forma>>
}


IXcrII = {
    \IXglobal
    \clef bass
    <<\IXcrIIn \forma>>
}


IXhcI = {
    \IXglobal
    <<\IXhcIn \forma>>
}


IXhcII = {
    \IXglobal
    <<\IXhcIIn \forma>>
}


IXfg = {
    \IXglobal
    \clef bass
    <<\IXfgn \forma>>
}

IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn \forma \IXbfn>>
    \typeset
}



Xglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

XvlIn = \relative do'' {

    r4 sol' fad
    si, mi re
    sol, do si

    %4
    la8\staccatissimo sol\staccatissimo fad\staccatissimo do'\staccatissimo si\staccatissimo la\staccatissimo
    sol-+ fad16 mi sol'4 fad
    si, mi re

    %7
    sol, \appoggiatura {la16[si]} do4 si~
    si8 la16 sol fad4.-+ mi8
    mi4 sol4. si8\mbreak

    %10
    si8. (la16) la8.(re16) re8. \parentSlur (do16)
    do4\mordent si mi~
    mi8.[do'16 si8. la16 sol8.-+ fad16]

    %13
    \appoggiatura fad8 sol4 sol,4. si8
    si8. (la16) la8.(re16) re8. (do16)
    do4-+ si mi

    %16
    \appoggiatura re8 dod4 \appoggiatura dod8 red4. mi8
    red4-+ fad4.(sol8)\mbreak
    sol8.-+ fad16 fad4.(sold8)

    %19
    la4(sol?8.-+) fad16 si4~
    \once \override Slur.outside-staff-priority = #300 si8.(la32\prall sol)  fad4.-+ mi8
    mi4 sol,4. si8

    %22
    si8. (la16) la8.(re16) re8. do16
    do4-+ si mi~
    mi8.[do'16 si8. la16 sol8.-+ fad16]

    %25
    \appoggiatura fad8 sol4 sol,4. si8
    si8. (la16) la8.(re16) re8. (do16)
    do4-+ si mi8. re16

    %28
    dod4 dod4.(red16 mi)
    red4-+ fad,4.(sol8)
    sol8. (fad16) sol8.(la16) sold8.(si16)

    %31
    la4. (si16 do) si(la) sol-+(fad)
    si8. do16 fad,4.-+ mi8

}

XvlIIn = \relative do'' {

    r4 sol' fad
    si, mi re
    sol, do si

    %4
    la8\staccatissimo sol\staccatissimo fad\staccatissimo do'\staccatissimo si\staccatissimo la\staccatissimo
    sol-+ fad16 mi sol'4 fad
    si, mi re

    %7
    sol, \appoggiatura {la16[si]} do4 si~
    si8 la16 sol fad4.-+ mi8
    mi4 sol4. si8\mbreak

    %10
    si8. (la16) la8.(re16) re8. \parentSlur (do16)
    do4\mordent si mi~
    mi8.[do'16 si8. la16 sol8.-+ fad16]

    %13
    \appoggiatura fad8 sol4 sol,4. si8
    si8. (la16) la8.(re16) re8. (do16)
    do4-+ si mi

    %16
    \appoggiatura re8 dod4 \appoggiatura dod8 red4. mi8
    red4-+ fad4.(sol8)\mbreak
    sol8.-+ fad16 fad4.(sold8)

    %19
    la4(sol?8.-+) fad16 si4~
    \once \override Slur.outside-staff-priority = #300 si8.(la32\prall sol) fad4.-+ mi8
    mi4 sol,4. si8

    %22
    si8. (la16) la8.(re16) re8. do16
    do4-+ si mi~
    mi8.[do'16 si8. la16 sol8.-+ fad16]

    %25
    \appoggiatura fad8 sol4 sol,4. si8
    si8. (la16) la8.(re16) re8. (do16)
    do4-+ si mi8. re16

    %28
    dod4 dod4.(red16 mi)
    red4-+ fad,4.(sol8)
    sol8. (fad16) sol8.(la16) sold8.(si16)

    %31
    la4. (si16 do) si(la) sol-+(fad)
    si8. do16 fad,4.-+ mi8

}

XhcIn = \relative do'' {

    r4 si si
    si sol sol
    sol mi mi

    %4
    mi mi4. red8
    \appoggiatura red? mi4 si fad'
    mi sol, re'

    %7
    do fad, sol~
    sol8. do16 si2
    si4 mi4. sol8\mbreak

    %10
    sol8.(fad16) fad8.(la16) la8.(re,16)
    re4 sol4. si8
    fad(la) sol(fad) mi-+(red)

    %13
    mi4 mi4. sol8
    sol4 fad8. sol16 la4~
    la sol8. la16 si4~

    %16
    si8. mi,16 la4. sol8
    fad4-+ red4. (mi8)\mbreak
    mi8. dod16 re!8. dod16 re8. si16

    %19
    mi4. red8 mi4~
    mi8. fad16 red4.-+ mi8
    mi4 r mi8.(sol16)

    %22
    sol8. (fad16) fad8. (la16) la8.(re,16)
    re4 sol4. si8
    fad8.[la16 sol8. fad16 mi8.-+ re16]

    %25
    mi4 r r8 re\mbreak
    mi8. fad16 fad4.-+(mi16 fad)
    sol4. re8[sol8. fad16]

    %28
    mi4 la4. sol8
    fad4 red4.-+ mi8
    mi8.-+ dod16 re!8. (fa16) mi4

    %31
    mi8. sol16 fad4.(mi16\prall red)
    mi4 red4.-+ mi8

}

Xbcn = \relative do {

    r4 mi' red
    sol do, si
    mi la, sol

    %4
    do8. la16 si4 si,
    mi, mi' red
    sol do, \afterGrace si4 ({do16[re)]}

    %7
    mi4 la, \afterGrace sol4 ({la16[si)]}
    do8. la16 si4. si8
    mi,4 r mi'\mbreak

    %10
    fad fad, fad'
    sol sol, sol'
    la8.-+(sol32 la) si4 si,

    %13
    mi r mi
    fad r re
    sol r mi

    %16
    la8. sol16 sol4 fad8.-+ mi16
    si'4 r r\mbreak
    si, r si'

    %19
    \once \override Slur.outside-staff-priority = #300 do4  (si8.\prall ) la16 sol4~
    sol8. la16 si4 si,
    mi r mi

    %22
    fad fad, fad'
    sol sol, sol'
    la8.-+(sol32 la) si4 si,

    %25
    mi r  si\mbreak
    do8.-+(si32 do) re4 re,
    sol sol' mi

    %28
    la8 sol sol4 (fad8.-+) mi16
    si'4 r r
    si, r re

    %31
    do2~do8(si16 fad)
    sol8. la16 si4. si8

}

Xbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 53
    s2.*32
    \key mi\major
    \bar "|"

}


XvlI = {
    \Xglobal
    %\notypeset
    <<\XvlIn \forma>>
}


XvlII = {
    \Xglobal
    <<\XvlIIn \forma>>
}


XhcI = {
    \Xglobal
    \clef alto
    <<\XhcIn \forma>>
}

Xbc = {
    \Xglobal
    \clef bass
    <<\Xbcn \forma \Xbfn>>
    \typeset
}



XIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \senza

}

XIvlIn = \relative do'' {

    mi,8\noBeam \f si'16 si mi8 si mi si
    mi si'16 si la la sold sold fad fad mi mi
    fad8 si,16 si fad'8 si, fad' si,

    %4
    fad' dod'16 dod si si la la sold sold fad fad
    sold8 si16 la sold la fad sold mi fad red mi
    dod8 la16 la la8 dod16 dod dod8 mi16 mi\mbreak

    %7
    mi8 dod16 dod dod8 mi16 mi mi8 la16 la
    la8 dod16 si la si sold la fad sold mi fad
    red8 si16 si si8 red16 red red8 fad16 fad

    %10
    fad8 red16 red red8 fad16 fad fad8 si16 si
    si2.~
    si8 la16 sold fad mi red dod si la sold fad\mbreak %% fine p. 35

    %13
    mi8  si'16 si mi8 si mi si
    mi si'16 si la la sold sold fad fad mi mi
    fad8 si,16 si fad'8 si, fad' si,

    %16
    fad' dod'16 dod si si la la sold sold fad fad
    sold8 si16 la sold la fad sold mi fad red mi
    dod8 la16 la la8 dod16 dod dod8 mi16 mi\mbreak

    %19
    mi8 dod16 dod dod8 mi16 mi mi8 la16 la
    la8 dod16 si la si sold la fad sold mi fad
    red8 si16 si si8 red16 red red8 fad16 fad

    %22
    fad8 red16 red red8 fad16 fad fad8 si16 si
    si2.~
    \once \override Slur.outside-staff-priority = #300 si8.(la32\prall sold) fad4.-+ mi8

    %25
    mi4 mi,^\markup\italic"très doux" mi\mbreak
    <mi sold,>2.^\<~
    <mi sold,>4\! sold8\rinf(mi) si'(sold)

    %28
    fad4 fad fad
    <fad si,>2.^\<~
    <fad si,>4\! la8\rinf(fad) dod'(la)

    %31
    sold4 <<
        {
            sold sold
            sold
        }\\{
            mi mi
            mi
        }
    >> si'8 [sold mi'8. red16]
    red4(dod8\prall) \noBeam red[mi8.\rinf(dod16)]

    %34
    dod4(si8)\noBeam red[mi8.\rinf(si16)]\mbreak
    la4(sold\prall)  fad8 r
    r8 si, mi4 mi

    %37
    <mi sold,>2.~
    <mi sold,>8\noBeam si(sold' mi si' sold)
    fad[r16 si,] fad'4 fad

    %40
    <fad si,>2.~
    <fad si,>8\noBeam si,(la' fad dod' la)
    sold4 <<
        {
            sold sold

            %43
            sold8
        }\\{
            mi4 mi
            mi8
        }
    >> mi[(si' sold mi'8. red16)]\mbreak
    red4(dod8) \noBeam red[mi8.\rinf(dod16)]
    dod4(si8)\noBeam red[mi8.\rinf(mi,16)]

    %46
    la8 sold fad4.\mordent mi8
    mi si'16 si si4_\markup\italic "plus fort" ~si8. si16
    mi8 si16 la sold la sold fad \once \stemUp mi8. sold'16

    %49
    fad8 si,16 dod red mi red mi fad sold fad sold
    la8 dod,16 dod dod4~dod8. dod16\mbreak
    fad8 dod16 si la si la sold \once \stemUp  fad8. la'16

    %52
    sold8 dod,16 red mi fad mi fad sold la sold la
    si8 sold4 mi re8~
    re dod4 si la8

    %55
    sold-+ si16 si si4~si8. si16
    mi8 si16 la sold la sold fad \once \stemUp mi8. sold'16
    fad8 si,16 dod red mi red mi fad sold fad sold\mbreak

    %58
    la8 dod,16 dod dod4~dod8. dod16
    fad8 dod16 si la si la sold \once \stemUp  fad8. la'16
    sold8 dod,16 red mi fad mi fad sold la sold la

    %61
    si2~si16. la32 sold fad mi red
    dod8. la'16 fad4.-+ mi8
    mi r si4 dod~

    %64
    dod lad si~\mbreak
    si mi red~
    red dod\prall si~

    %67
    si mi red
    red(dod8.\prall) red16 \appoggiatura dod8 si4
    lad8. fad'16 fad4~fad8. fad16

    %70
    si4~si16 lad sold fad si lad sold fad
    sold lad si lad sold fad mi red dod si lad sold\mbreak  %% fine p. 39
    fad8. red'16 dod4.-+ si8

    %73
    si2.\<~
    si~
    si8.\! (dod32 re) dod8(si) la\prall (sold)

    %76
    \appoggiatura sold8 la2.~
    la~
    la8[dod] si(la) sold\prall(fad)

    %79
    sold mi16 fad sold8 sold16 la si8 dod16 re\mbreak
    dod8 <mi, la,>4 <mi la,> <mi la,>8
    <mi la,>\noBeam fad16 sold la8 la16 si dod8 red?16 mi

    %82
    red8 <fad, si,>4 <fad si,> <fad si,>8
    <fad si,>4 la'(sold)
    fad8-+ si,16 si si8 si si si

    %85
    si, r la''4 sold
    \afterGrace sold-+{fad16[sold]} fad8 r r4\mbreak   %%% fine p. 40
    r4 <<{sold,16 si mi mi mi mi mi mi}\\{s8 si16 si si si si si}>>

    %88
    dod la si dod re mi fad sold la mi dod'8
    <<{sold,16 si mi mi mi mi mi mi sold, si mi mi}\\{s8 si16 si si si si si s8 si16 si}>>
    red? si dod red mi fad sold la si la sold fad

    %91
    sold4-+ <<{sold,16 si mi mi mi mi mi mi}\\{s8 si16 si si si si si}>>\mbreak
    dod la si dod re mi fad sold la mi dod'8
    <<{sold,16 si mi mi mi mi mi mi sold, si mi mi}\\{s8 si16 si si si si si s8 si16 si}>>

    %94
    <la' si, fad>2 <sold si, mi,>4~
    sold8. fad16 <<{fad4.-+ mi8}\\{si4.}>>
    \stemUp <mi si mi,>4
    \key mi\minor

}

XIvlIIn = \relative do'' {

    mi,8\noBeam \f si'16 si mi8 si mi si
    mi si'16 si la la sold sold fad fad mi mi
    fad8 si,16 si fad'8 si, fad' si,

    %4
    fad' dod'16 dod si si la la sold sold fad fad
    sold8 si16 la sold la fad sold mi fad red mi
    dod8 la16 la la8 dod16 dod dod8 mi16 mi\mbreak

    %7
    mi8 dod16 dod dod8 mi16 mi mi8 la16 la
    la8 dod16 si la si sold la fad sold mi fad
    red8 si16 si si8 red16 red red8 fad16 fad

    %10
    fad8 red16 red red8 fad16 fad fad8 si16 si
    si2.~
    si8 la16 sold fad mi red dod si la sold fad\mbreak %% fine p. 35

    %13
    mi8  si'16 si mi8 si mi si
    mi si'16 si la la sold sold fad fad mi mi
    fad8 si,16 si fad'8 si, fad' si,

    %16
    fad' dod'16 dod si si la la sold sold fad fad
    sold8 si16 la sold la fad sold mi fad red mi
    dod8 la16 la la8 dod16 dod dod8 mi16 mi\mbreak

    %19
    mi8 dod16 dod dod8 mi16 mi mi8 la16 la
    la8 dod16 si la si sold la fad sold mi fad
    red8 si16 si si8 red16 red red8 fad16 fad

    %22
    fad8 red16 red red8 fad16 fad fad8 si16 si
    si2.~
    \once \override Slur.outside-staff-priority = #300 si8.(la32\prall sold) fad4.-+ mi8

    %25
    mi4 mi,^\markup\italic"tres doux" mi\mbreak
    <mi sold,>2.^\<~
    <mi sold,>4\! sold8\rinf(mi) si'(sold)

    %28
    fad4 fad fad
    <fad si,>2.^\<~
    <fad si,>4\! la8\rinf(fad) dod'(la)

    %31
    sold4 <<
        {
            sold sold
            sold
        }\\{
            mi mi
            mi
        }
    >> si'8 [sold mi'8. red16]
    red4(dod8\prall) \noBeam red[mi8.\rinf(dod16)]

    %34
    dod4(si8)\noBeam red[mi8.\rinf(si16)]\mbreak
    la4(sold\prall)  fad8 r
    r8 si, mi4 mi

    %37
    <mi sold,>2.~
    <mi sold,>8\noBeam si(sold' mi si' sold)
    fad[r16 si,] fad'4 fad

    %40
    <fad si,>2.~
    <fad si,>8\noBeam si,(la' fad dod' la)
    sold4 <<
        {
            sold sold

            %43
            sold8
        }\\{
            mi4 mi
            mi8
        }
    >> mi[(si' sold mi'8. red16)]\mbreak
    red4(dod8) \noBeam red[mi8.\rinf(dod16)]
    dod4(si8)\noBeam red[mi8.\rinf(mi,16)]

    %46
    la8 sold fad4.\mordent mi8
    mi si'16 si si4_\markup\italic "plus fort" ~si8. si16
    mi8 si16 la sold la sold fad \once \stemUp mi8. sold'16

    %49
    fad8 si,16 dod red mi red mi fad sold fad sold
    la8 dod,16 dod dod4~dod8. dod16\mbreak
    fad8 dod16 si la si la sold \once \stemUp  fad8. la'16

    %52
    sold8 dod,16 red mi fad mi fad sold la sold la
    si8 sold4 mi re8~
    re dod4 si la8

    %55
    sold-+ si16 si si4~si8. si16
    mi8 si16 la sold la sold fad \once \stemUp mi8. sold'16
    fad8 si,16 dod red mi red mi fad sold fad sold\mbreak

    %58
    la8 dod,16 dod dod4~dod8. dod16
    fad8 dod16 si la si la sold \once \stemUp  fad8. la'16
    sold8 dod,16 red mi fad mi fad sold la sold la

    %61
    si2~si16. la32 sold fad mi red
    dod8. la'16 fad4.-+ mi8
    mi r si4 dod~

    %64
    dod lad si~\mbreak
    si mi red~
    red dod\prall si~

    %67
    si mi red
    red(dod8.\prall) red16 \appoggiatura dod8 si4
    lad8. fad'16 fad4~fad8. fad16

    %70
    si4~si16 lad sold fad si lad sold fad
    sold lad si lad sold fad mi red dod si lad sold\mbreak  %% fine p. 39
    fad8. red'16 dod4.-+ si8

    %73
    si2.\<~
    si~
    si8.\! (dod32 re) dod8(si) la\prall (sold)

    %76
    \appoggiatura sold8 la2.~
    la~
    la8[dod] si(la) sold\prall(fad)

    %79
    sold mi16 fad sold8 sold16 la si8 dod16 re\mbreak
    dod8 <mi, la,>4 <mi la,> <mi la,>8
    <mi la,>\noBeam fad16 sold la8 la16 si dod8 red?16 mi

    %82
    red8 <fad, si,>4 <fad si,> <fad si,>8
    <fad si,>4 la'(sold)
    fad8-+ si,16 si si8 si si si

    %85
    si, r la''4 sold
    \afterGrace sold-+{fad16[sold]} fad8 r r4\mbreak   %%% fine p. 40
    r4 <<{sold,16 si mi mi mi mi mi mi}\\{s8 si16 si si si si si}>>

    %88
    dod la si dod re mi fad sold la mi dod'8
    <<{sold,16 si mi mi mi mi mi mi sold, si mi mi}\\{s8 si16 si si si si si s8 si16 si}>>
    red? si dod red mi fad sold la si la sold fad

    %91
    sold4-+ <<{sold,16 si mi mi mi mi mi mi}\\{s8 si16 si si si si si}>>\mbreak
    dod la si dod re mi fad sold la mi dod'8
    <<{sold,16 si mi mi mi mi mi mi sold, si mi mi}\\{s8 si16 si si si si si s8 si16 si}>>

    %94
    <la' si, fad>2 <sold si, mi,>4~
    sold8. fad16 <<{fad4.-+ mi8}\\{si4.}>>
    \stemUp <mi si mi,>4
    \key mi\minor

}

XIhbIn = \relative do'' {

    r8 si16 si mi8 si mi si
    mi si'16 si la la sold sold fad fad mi mi
    fad8 si,16 si fad'8 si, fad' si,

    %4
    fad' dod'16 dod si si la la sold sold fad fad
    sold8 si16 la sold la fad sold mi fad red mi
    dod8 la16 la la8 dod16 dod dod8 mi16 mi\mbreak

    %7
    mi8 dod16 dod dod8 mi16 mi mi8 la16 la
    la8 dod16 si la si sold la fad sold mi fad
    red8 si16 si si8 red16 red red8 fad16 fad

    %10
    fad8 red16 red red8 fad16 fad fad8 si16 si
    si2.~
    si8 la16 sold fad mi red dod si la sold fad\mbreak %% fine p. 35

    %13
    mi8  si'16 si mi8 si mi si
    mi si'16 si la la sold sold fad fad mi mi
    fad8 si,16 si fad'8 si, fad' si,

    %16
    fad' dod'16 dod si si la la sold sold fad fad
    sold8 mi16 mi mi8 mi mi mi
    mi2.-+~\mbreak

    %19
    mi8 mi16 mi mi8 mi mi mi
    la2.~
    la

    %22
    la8  fad16 fad fad8 fad fad fad
    si2.~
    si8.(la32 sold) fad4.-+ mi8

    %25
    mi4 mi,^\markup\italic"tres doux" mi\mbreak
    mi2.^\<~
    mi4\! sold8\rinf(mi) si'(sold)

    %28
    fad4 fad fad
    fad2.^\<~
    fad4\! la8\rinf(fad) dod'(la)

    %31
    sold4 sold sold
    sold2.~
    sold4 fad2

    %34
    fad4 mi2\mbreak
    la4(sold\prall) fad8 r
    r4 mi' mi

    %37
    mi2.~
    mi2 si'8 sold
    fad4 fad fad

    %40
    fad2.~
    fad2 dod'8 la
    sold4 sold sold

    %43
    sold2.~\mbreak
    sold4 fad2~
    fad4 mi2

    %46
    la,8 sold fad4.\mordent mi8
    mi si'16 si si4 ~si8. si16
    mi8 si16 la sold la sold fad \once \stemUp mi8. sold'16

    %49
    fad8 si,16 dod red mi red mi fad sold fad sold
    la8 dod,16 dod dod4~dod8. dod16\mbreak
    fad8 dod16 si la si la sold \once \stemUp  fad8. la'16

    %52
    sold8 dod,16 red mi fad mi fad sold la sold la
    si8 sold4 mi re8~
    re dod4 si la8

    %55
    sold-+ si16 si si4~si8. si16
    mi8 si16 la sold la sold fad \once \stemUp mi8. sold'16
    fad8 si,16 dod red mi red mi fad sold fad sold\mbreak

    %58
    la8 dod,16 dod dod4~dod8. dod16
    fad8 dod16 si la si la sold \once \stemUp  fad8. la'16
    sold8 dod,16 red mi fad mi fad sold la sold la

    %61
    si2~si16. la32 sold fad mi red
    dod8. la'16 fad4.-+ mi8
    mi r r4 r

    %64
    R2.*5
    r8 fad fad4~fad8. fad16

    %70
    si4~si16 lad sold fad si lad sold fad
    sold lad si lad sold fad mi red dod si lad sold\mbreak  %% fine p. 39
    fad8. red'16 dod4.-+ si8

    %73
    si4 r r
    R2.*5
    r8 mi,16 fad sold8 sold16 la si8 dod16 re\mbreak

    %80
    dod8 <<
        {
            la'4 la la8~
            la
        }\\{
            dod,4 dod dod8~
            dod8 fad,16 sold
        }
    >> la8 la16 si dod8 red16 mi
    si8 si'4 si si8~

    %83
    si2.-+~
    si~
    si

    %86
    R2.\mbreak
    r4 sold,8 mi' mi mi
    dod16 la si dod re mi fad sold la mi dod'8

    %89
    sold, mi' mi[mi] sold, mi'
    red?16 si dod red mi fad sold la si la sold fad
    sold4-+ sold,8 mi' mi mi\mbreak

    %92
    dod16 la si dod re mi fad sold la mi dod'8
    sold, [mi' mi mi ]sold, mi'16 mi
    la2 sold4~

    %95
    sold8. fad16 fad4.-+ mi8
    mi4
    \key mi\minor

}

XItpn = %\transpose do mi, {

    \relative do'' {
        \key do\major

        r8 sol16 sol do8 sol do sol
        do mi16 mi mi8 mi mi mi
        re sol,16 sol re'8 sol, re' sol,

        %4
        re' fa16 fa fa8 fa fa fa
        mi4 r r
        R2.*7

        %13
        r8 sol,16 sol do8 sol do sol
        do8 sol' fa mi re do
        re sol,16 sol re'8 sol, re' sol,

        %16
        re'8 fa mi re do sol
        do, do'16 do do8 do do do
        do2.-+~\mbreak

        %19
        do-+
        r8 re16 re re8 re re re
        re2.-+

        %22
        r8 re16 re re8 re sol sol
        sol2.-+~
        sol8.(fa32 mi) re4.-+ do8

        %25
        do r r4 r\mbreak
        R2.*21
        r8 sol16 sol sol4~sol8. sol16

        %48
        do8 do16 do do4~do8. mi16
        re2.
        R2.*2

        %52
        r4 do8.-+ re16 mi8.-+ fa16
        sol2 r8 do,
        fa4 mi\prall re

        %55
        mi8-+ sol,16 sol sol4~sol8. sol16
        do8 do16 do do4~do8. mi16
        re2.\mbreak

        %58
        R2.*2
        r4 r8 do16\staccatissimo re\staccatissimo mi(fa mi) fa\staccatissimo
        sol2.

        %62
        fa8. mi16 re4.-+ do8
        do r r4 r
        R2.*15

        %79
        r8 do16 do do8 do do do\mbreak
        do2.~
        do8\noBeam re16 re re8 re re re

        %82
        re4 sol sol
        sol2.-+~
        sol~

        %85
        sol~
        sol8 r r4 r\mbreak
        R2.*6

        %93
        r4 r8 do,16 do do8. do16
        fa2 mi4~
        mi8. re16 re4.-+ do8

        %96
        do4 \key do\major

    %}

}

XIcrIn = %\transpose do mi, {

    \relative do'' {
        \key do\major

        R2.
        r8 mi16 mi mi8 mi mi mi
        re8 r r4 r

        %4
        r8 re16 re re8 re re re
        do4 r r
        R2.*5

        %11
        r8 mi16 mi mi8 sol16 sol sol4
        fa mi re\mbreak
        do8 sol16 sol do8 sol do sol

        %14
        do sol' fa mi re do
        re sol,16 sol re'8 sol, re' sol,
        re' la' sol fa mi re

        %17
        <mi do> do16 do do8 do do do
        do2.-+~\mbreak
        do

        %20
        r8 re16 re re8 re re re
        re2.~
        re

        %23
        r8 do16 do do8 mi16 mi mi8. sol16
        sol8. fa32-+ mi re4.-+ do8
        do4 r r\mbreak  %% foine p. 36

        %26 fine p. 36 OOKK
        mi,2.~
        mi
        si~

        %29
        si~
        si
        la~

        %32
        la
        R2.*3
        r4 do' do

        %37
        do2.~
        do2 sol'8 mi
        re8. sol,16 re'4 re

        %40
        re2.~
        re2 la'8 fa
        mi4 mi mi

        %43
        mi2.~\mbreak
        mi4 re2~
        re4 do2

        %46
        fa8. mi16 re4.\mordent do8
        do sol16 sol sol4~sol8. sol16
        do8 do,16 do do4. do8

        %49
        sol'4 r r
        R2.*5
        r8 sol16 sol sol4~sol8. sol16

        %56
        do8 do,16 do do4~do8. do16
        sol'8 r r4 r\mbreak
        R2.*3

        %61
        r4 r r8 sol'
        fa8. mi16 re4.-+ do8
        do r r4 r

        %64
        R2.*15
        r8 do16 do do8 do do do\mbreak
        do2.-+~

        %81
        do8 re16 re re8 re re re
        re2.-+~
        re4 fa mi

        %84
        re8-+ sol,16 sol sol8 sol sol sol
        sol,4 fa'' mi
        mi-+ re8 r r4\mbreak

        %87
        r4 do2~
        do2.~
        do

        %90
        sol
        do~\mbreak
        do~

        %93
        do2 r8 do16 do
        fa2 mi4~
        mi8. re16 re4.-+ do8

        %96
        do4 \key do\major

    %}

}

XIcrIIn = %\transpose do mi, {

    \relative do'' {
        \key do\major

        R2.
        r8 do16 do do8 do do do
        sol r r4 r

        %4
        r8 sol16 sol sol8 sol sol sol
        do,4 r r
        R2.*5

        %11
        r8 do'16 do do8 mi16 mi mi4
        re do sol\mbreak
        mi8 sol16 sol do8 sol do sol

        %14
        do mi re do si [do,]
        sol' sol16 sol re'8 sol, re' sol,
        re' fa mi re do sol

        %17
        do, do'16 do do8 do do do
        do2.-+~\mbreak
        do
        r8 re16 re re8 re re re

        %21
        sol,2.~
        sol
        r8 mi16 mi mi8 do'16 do do8. mi16

        %24
        mi8. re32-+ do sol4.-+ sol8
        do,4 r r \mbreak
        la'2.~

        %27
        la
        mi~
        mi~

        %30
        mi
        la,~
        la

        %33
        R2.*3
        r4 do' do
        do2.~

        %38
        do2 mi8 do
        sol4 sol sol
        sol2.~

        %41
        sol2 fa'8 re
        do4 do do
        do mi2~\mbreak  %% fine p. 37

        %44 OOKK
        mi4 re2~
        re4 do2
        re8. do16 sol2

        %47
        do,8 sol'16 sol sol4 ~sol8. sol16
        do8 do,16 do do4. do8
        sol4 r r

        %50
        R2.*5
        r8 sol'16 sol sol4~sol8. sol16
        do8 do,16 do do4~do8. do16

        %57
        sol8 r r4 r\mbreak
        R2.*3
        r4 r r8 mi''

        %62
        re8. do16 sol4.-+ sol8
        do, r r4 r
        R2.*15

        %79
        r8 do16 do do8 do do do\mbreak
        la2.-+~
        la8\noBeam re16 re re8 re re re

        %82
        sol,2.~
        sol4 re'' do
        sol8 sol16 sol sol8 sol sol sol

        %85
        sol,4 re'' do
        do-+ sol8 r r4\mbreak
        r do,2~

        %88
        do2.~
        do
        sol

        %91
        do~\mbreak
        do~
        do2 r8 do16 do

        %94
        sol'2 do,4~
        do sol2
        do4 \key do\major

    %}

}

XIhcIn = \relative do'' {

    mi,4 r r
    r8 <si' mi,>16 <si mi,> <si mi,>8 <si mi,>  <si mi,>  <si mi,>
    <si red,>4 r r

    %4
    r8 <si red,>16 <si red,> <si red,>8 <si red,> <si red,> <si red,>
    <si mi,> 4 r8 si16 la sold la fad sold
    mi4 r8 la,16 la la8 dod16 dod\mbreak

    %7
    dod8 la16 la la8 dod16 dod dod8 mi16 mi
    mi4 r8 dod'16 si la si sold la
    fad4 r8 si,16 si si8 red16 red

    %10
    red8 si16 si si8 red16 red red8 fad16 fad
    fad8 si16 si si8 sold16 sold sold8 mi16 mi
    mi4~mi8 red16 dod si la sold fad\mbreak

    %13
    mi4 r r
    r8 <si'' mi,>16 <si mi,> <si mi,>8 <si mi,>  <si mi,>  <si mi,>
    <si red,>4 r r

    %16
    r8 <si red,>16 <si red,> <si red,>8 <si red,> <si red,> <si red,>
    <si mi,> <si mi,>4 <si mi,> <si mi,>8
    <dod mi,>4 r8 la16 la la4\mbreak

    %19
    r8 la16 la la8 dod16 dod dod8 mi16 mi
    mi8 mi4 mi mi8
    red4 r8 si16 si si4

    %22
    r8 <red fad,>16 <red fad,> <red fad,>8 <red fad,>16 <red fad,> <red fad,>8 <red fad,>16 <red fad,>
    mi8 si16 si si8 sold 16 sold sold4
    sold8. fad32 mi red4.-+ mi8

    %25
    mi4 r r\mbreak
    R2.*11
    <si mi,>2.~

    %38
    <si mi,>4 r r
    si r r
    <si red,>2.~

    %41
    <si red,>4 r r
    <si mi,>4 <si mi,> <si mi,>
    <si mi,>2.\mbreak

    %44 OOKK
    la2.\parentSlur (
    sold)
    fad8. mi16 si'2

    %47
    mi,4 r r
    r8 sold'16 sold sold4~sold8. mi16
    mi4 r8 si16 si re8. re16

    %50
    dod4 r r
    r8 la'16 la la4~la8. fad16
    fad4 r8 dod16 dod mi8. mi16

    %53
    mi8 si' si si si si
    la la sold sold fad fad
    mi4 r r

    %56
    r8 si'16 si si4~si8. si16
    si4 r8 si,16 dod red mi red mi\mbreak
    fad sold fad sold la4 r

    %59
    r8 dod16 dod dod4~dod8. dod16
    dod4. dod,16 red mi fad mi fad
    sold2 r16 mi mi mi

    %62
    mi8. fad16 red4.-+ mi8
    mi4 sold la
    \grace sold8 fad2 mi4\mbreak

    %65
    \appoggiatura fad8 mi4 lad si~
    si sold fad~
    fad mi4. fad8

    %68
    sold2.
    dod,8. fad16 dod8 mi lad,8. fad'16
    fad2 fad8 si16 si

    %71
    si4~si16 lad sold fad mi red dod si\mbreak
    fad'8. si16 lad4. si8
    si2.~
    si4 si(la!)

    %75
    sold2. (
    dod,4) la'2~
    la4 la sold

    %78
    fad2.
    si,8 mi16 mi mi8 mi mi mi\mbreak
    la8 <<
        {
            mi4 mi mi8

            %81
            mi fad16 fad
        }\\{
            dod4 dod dod8
            dod
        }
    >> fad fad fad fad
    si <fad si,>4 <fad si,>4 <fad si,>8
    <fad si,>4 r r

    %84
    r8 si16 si si8 si si si
    si, r red4 mi
    si8 si16 si si8 r r4\mbreak

    %87
    r4 sold'8 sold sold sold
    la la la la la la
    sold sold sold sold sold sold

    %90
    fad fad fad fad fad fad
    mi4 si'16 si si si si si si si\mbreak
    dod dod dod dod dod dod dod dod dod dod dod dod

    %93
    si si si si si si si si si si si si
    red2 mi4~
    mi8. mi16 red4.-+ mi8

    %96
    mi4 \key mi\minor

}

XIfgn = \relative do {

    mi,4 r r
    r8 mi'16 mi mi8 mi mi mi
    si'4 r r

    %4
    r8 si,16 si si8 si si si
    mi4 sold, sold
    la2 r4\mbreak

    %7
    r la la
    fad fad fad
    si2 r4

    %10
    r si si
    sold8 mi'16 mi mi4. sold,8
    la4 si si\mbreak

    %13
    mi,4 r r
    r8 mi'16 mi mi8 mi mi mi
    si'4 r r

    %16
    r8 si,16 si si8 si si si
    mi sold,4 sold sold8
    la4 r r\mbreak

    %19
    r8 la16 la la8 la16 la la8 la16 la
    fad8 fad4 fad fad8
    si4 r r

    %22
    r8 si16 si si8 si16 si si8 si16 si
    \once\stemUp sold8 si'16 si si8 mi16 mi \once\stemDown mi8. sold,,16
    la4 si2

    %25
    mi,4 r r  \mbreak %%% fine p. 36
    mi2.~
    mi4 r r

    %28
    r si' si
    si,2.~
    si4 r r

    %31
    r mi' mi
    mi sold mi
    la,2.

    %34
    sold\mbreak
    fad4 si2
    R2.

    %37
    si'~
    si~
    si~

    %40
    si~
    si~
    si~

    %43
    si4 r r\mbreak %% fine p. 37
    la,2.(
    sold)
    fad8. mi16 si'2

    %47
    mi,4 r r
    r8 mi'16 mi mi4~mi8. mi16
    si'4 r8 si,16 si si8. si16

    %50
    fad4 r r\mbreak %% fine p. 38
    r8 fad'16 fad fad4~fad8. fad16
    dod'4 r8 dod,16 dod dod8. dod16

    %53
    sold8 sold' sold sold sold sold
    la la si si si, si
    mi4 r r

    %56
    r8 mi16 mi mi4~mi8. mi16
    si'8 si,16 si si8 si si si\mbreak
    mi,4 r r

    %59
    r8 fad'16 fad fad4~fad8. fad16
    dod'8 dod,16 dod dod8 dod dod dod
    sold2 r16 mi'fad sold

    %62
    la,8. fad16 si4. si8
    mi,4 r r
    R2.*5

    %69
    fad'8. fad'16 dod8. mi16 lad,8. dod16\mbreak
    red,,2.

    %71
    mi~\mbreak  %% fine p. 39
    mi8. red32 mi fad2
    si4 r r
    R2.*6

    %80
    r8 la4 la la8
    la4 r r
    r8 si4 si si8

    %83
    si4 r r
    r8 si'16 si si8 si si si
    si,4 r r

    %86
    r8 si16 si si8 r r4\mbreak %% fine p. 40
    r4 mi'8 mi mi mi
    la, la la la la la

    %89
    mi mi mi mi mi mi
    si si si si si si
    mi4 mi16 mi mi mi mi mi mi mi\mbreak

    %92
    la, la la la la la la la la la mi' mi
    sold, sold sold sold sold sold sold sold sold sold mi' mi
    fad,2 mi4~

    %95
    mi8. la16 si4 si
    mi, \key mi\minor

}

XItmpn = \relative do {

    R2.
    r8 mi16 mi mi8 mi mi mi
    si4 r r

    %4
    r8 si16 si si8 si si si
    mi4 r r
    R2.*5

    %11
    r8 mi16 mi mi4 r
    r16 mi mi mi si4. si8\mbreak
    mi4 r r

    %14
    r8 mi16 mi mi8 mi mi mi
    si4 r r
    r8 si16 si si8 si si si

    %17
    mi4 r r
    R2.*5
    r8 mi16 mi mi8 mi16 mi mi4

    %24
    r16 mi mi mi si4~si16 si si si
    mi4 r r\mbreak
    R2.*22

    %48
    r8 mi16 mi mi4~mi8. mi16
    si4 r r
    R2.*4

    %54
    r4 r8 si si si
    mi4 r r
    r8 mi16 mi mi4~mi8. mi16

    %57
    si4 r r\mbreak
    R2.*3
    r4 r r16 mi mi mi

    %62
    mi8. mi16 si4. si8
    mi4 r r
    R2.*20

    %84
    r8 si16 si si8 si si si
    si4 r r
    r16 si si si si8 r r4\mbreak

    %87
    R2.*6
    r4 r16 mi mi mi mi8. mi16
    si2 mi4~

    %95
    mi si2
    mi4 \key mi\minor

}

XIbcn = \relative do {

    mi,4 r r
    r8 mi'16 mi mi8 mi mi mi
    si'4 r r

    %4
    r8 si,16 si si8 si si si
    mi4 sold, sold
    la2 r4\mbreak

    %7
    r la la
    fad fad fad
    si2 r4

    %10
    r si si
    sold8 mi'16 mi mi4. sold,8
    la4 si si\mbreak

    %13
    mi,4 r r
    r8 mi'16 mi mi8 mi mi mi
    si'4 r r

    %16
    r8 si,16 si si8 si si si
    mi sold,4 sold sold8
    la4 r r\mbreak

    %19
    r8 la16 la la8 la16 la la8 la16 la
    fad8 fad4 fad fad8
    si4 r r

    %22
    r8 si16 si si8 si16 si si8 si16 si
    \once\stemUp sold8 si'16 si si8 mi16 mi \once\stemDown mi8. sold,,16
    la4 si2

    %25
    mi,4 r r  %%% fine p. 36
    R2.*11
    mi2.~

    %38
    mi4 r r
    si' r r
    si2.~

    %41
    si4 r r
    mi mi mi
    mi2.\mbreak %% fine p. 37

    %44
    la,2.(
    sold)
    fad8. mi16 si'2

    %47
    mi,4 r r
    r8 mi'16 mi mi4~mi8. mi16
    si'4 r8 si,16 si si8. si16

    %50
    fad4 r r\mbreak %% fine p. 38
    r8 fad'16 fad fad4~fad8. fad16
    dod'4 r8 dod,16 dod dod8. dod16

    %53
    sold8 sold' sold sold sold sold
    la la si si si, si
    mi4 r r

    %56
    r8 mi16 mi mi4~mi8. mi16
    si'8 si,16 si si8 si si si\mbreak
    mi,4 r r

    %59
    r8 fad'16 fad fad4~fad8. fad16
    dod'8 dod,16 dod dod8 dod dod dod
    sold2 r16 mi'fad sold

    %62
    la,8. fad16 si4. si8
    mi,4 mi''2(
    red2.)(\mbreak

    %65
    dod2) si4
    mi,2 fad4
    sold2 fad4

    %68
    mid2.
    fad8. fad'16 dod8. mi16 lad,8. dod16\mbreak
    red,,2.

    %71
    mi~\mbreak  %% fine p. 39
    mi8. red32 mi fad2
    si4 si'(la!)

    %74
    sold sold fad
    mid2.
    fad,4 la'(sold)

    %77
    fad fad(mi)
    red2.
    mi,4 r r

    %80
    r8 la4 la la8
    la4 r r
    r8 si4 si si8

    %83
    si4 r r
    r8 si'16 si si8 si si si
    si,4 r r

    %86
    r8 si16 si si8 r r4\mbreak %% fine p. 40
    r4 mi'8 mi mi mi
    la, la la la la la

    %89
    mi mi mi mi mi mi
    si si si si si si
    mi4 mi16 mi mi mi mi mi mi mi\mbreak

    %92
    la, la la la la la la la la la mi' mi
    sold, sold sold sold sold sold sold sold sold sold mi' mi
    fad,2 mi4~

    %95
    mi8. la16 si4 si
    mi,\key mi\minor

}

XIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \once\override Staff.TimeSignature.transparent = ##t
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 53
    s2.*95
    s4
    \bar "|"

}


XIvlI = {
    \XIglobal
    %\notypeset
    <<\XIvlIn \forma>>
}


XIvlII = {
    \XIglobal
    <<\XIvlIIn \forma>>
}


XIhbI = {
    \XIglobal
    <<\XIhbIn \forma>>
}


XItp = {
    \XIglobal
    <<\XItpn \forma>>
}


XIcrI = {
    \XIglobal
    <<\XIcrIn \forma>>
}


XIcrII = {
    \XIglobal
    <<\XIcrIIn \forma>>
}


XIhcI = {
    \XIglobal
    \clef alto
    <<\XIhcIn \forma>>
}


XIfg = {
    \XIglobal
    \clef bass
    <<\XIfgn \forma>>
}


XItmp = {
    \XIglobal
    \clef bass
    <<\XItmpn \forma>>
}

XIbc = {
    \XIglobal
    \clef bass
    <<\XIbcn \forma \XIbfn>>
    \typeset
}



XIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
   \senza

}

XIIvlIn = \relative do'' {

   sol'4.\dolce(si8)
   si8.\parentSlur ( red,16) red4.(fad8)\mbreak
   fad8.(si,16) si4 r8 mi
   mi8.[(do16) si8. (la16) sol8._+(fad16)]

   %4
   \appoggiatura fad8 sol4 sol'4.(si8)
   si8. (red,16) red4.(fad8)\mbreak
   fad8.(si,16) si4. mi8

   %7
   fad8.(sol32 la) sol4(fad8.-+) mi16
   mi4 sol \afterGrace mi -+({re16[mi)]}\mbreak
   mi4.(fad8\prall) si,4~

   %10
   si mi \afterGrace dod-+ ( {si16[dod)]}
   dod4 re8.\prall(mi32 fad) mi16(re) dod(si)
   lad8-+ r re4 (fad)~

   %13
   fad mi sol~
   sol dod, mi~
   mi re fad~\mbreak

   %16
   fad si, re
   dod8 [sol' fad mi re dod]
   \appoggiatura dod?8 re8. si16 re4 fad~

   %19
   fad8.[(red16) mi8.(si16)] sol'4~
   sol8. la,16 dod4 mi~
   mi8.[(dod16) re8.(la16) ]fad'4~

   %22
   fad si,4. re8\mbreak %%%fine p. 42
   dod8.(re32 mi) dod4.-+ si8
   si4~si16\<(dod) si(re) re(dod) dod(mi)

   %25
   mi(red) red(fad)  fad[(mi) mi(sol)] sol(fad) fad(la)
   la(sol) sol(si)\! si4  la8.\prall (sol16)
   fad4-+ sol4.\dolce(si8)

   %28
   si8. ( red,16) red4.\parentSlur (fad8)\mbreak
   fad8.(si,16) si4. mi8
   mi8.[(do16) si8. (la16) sol8._+(fad16)]

   %31
   \appoggiatura fad8 sol4 sol'4.(si8)
   si8. (red,16) red4. \parentSlur (fad8)\mbreak
   fad8.(si,16) si4. mi8

   %34
   fad8.(sol32 la) sol4.\mordent  mi8\mbreak
   mi mi,16 fad sol8 [sol] sol8.-+(fad32  sol)
   la16 sol fad mi re8 [la'] la8.-+(sol32 la)

   %37
   si8 sol r sol' [fad-+ mi]
   la,[fad' si, mi si, red']
   mi mi,16 fad sol8 [sol] sol8.-+(fad32 sol)

   %40
   la16 sol fad mi re8[ la'] la8.-+(sol32 la)
   si8 sol r sol' [fad mi]
   la,[fad' si, mi si, red']

   %43
   mi16^\markup\italic"très fort" si' la si sol [sol fad sol] mi si' la si
   do mi, mi do' do [mi, mi do'] do mi, mi do'
   fad, la sol la fad [fad mi fad] re la' sol la\mbreak

   %46
   si re, re si' si [re, re si'] si re, re si'
   mi, sol fad sol mi [mi re mi] do sol' fad sol
   la do, do la'  la [do, do la']  la do, do la'

   %49
   red, fad mi fad red [red do red] si fad' mi fad
   sol si la sol fad [mi red do] si la sol fad
   mi' si' la si sol [sol fad sol] mi si' la si

   %52
   do mi, mi do' do [mi, mi do'] do mi, mi do'
   fad, la sol la fad [fad mi fad] re la' sol la\mbreak
   si re, re si' si [re, re si'] si re, re si'

   %55
   mi, sol fad sol mi [mi re mi] do sol' fad sol
   la do, do la'  la [do, do la']  la do, do la'
   red, fad mi fad red [red do red] si fad' mi fad

   %58
   sol si la sol fad [mi red do] si la sol fad\mbreak
   mi4 r r
   R2.

   %61
   la8\f do16 re mi8[fad16 sold] la8 la,
   re,4 r r
   R2.

   %64
   sol8\f si16 do re8[mi16 fad] sol8 sol,\mbreak %%% OOKK fine p. 44
   do,4 r r
   r8 do'\dolce do[(re)] re(mi)

   %67
   mi2.
   r8 dod_\markup\italic"enflè" dod[(re)] re(mi)
   mi2~mi8. mi16

   %70
   la, re\f do si la [sol fad mi] re mi do re \mbreak
   \once\stemUp si8 re'16\f do? si8 [re] sol, si
   r16 do, re mi fa[sol la si] do8 mi

   %73
   r mi16 re do8[mi] la, do
   r16 re, mi fad? sol [la si do] re8 fad
   r la16 sol fad8[la re, fad]\mbreak

   %76
   la,[re fad, la re, fad]
   do4 r16 re' mi fad sol8. si,16
   mi8. la,16 la4.-+ sol8

   %79
   \tuplet 3/2 {
      sol sol' re si[re si] sol si sol
      re re' la fad [la fad] re fa re\mbreak
      \once\stemUp la la'' mi do[mi do] la do la

      %82
      mi mi' si sol[si sol] mi sol mi
      \once\stemUp do mi' do sol[do sol] mi sol mi
      \once\stemUp  si mi' si sol[si sol] mi sol mi

      %85
      \once\stemUp lad, mi'' dod lad[dod lad] mi lad mi\mbreak
      red si red fad[red fad] si fad la
      sol sol' re si[re si] sol si sol

      %88
      re re' la fad[la fad] re fa re
      \once\stemUp la la'' mi do[mi do] la do la
      mi mi' si sol[si sol] mi sol mi\mbreak

      %91
      \once\stemUp do mi' do sol[do sol] mi sol mi
      \once\stemUp si mi' si sol[si sol] mi sol mi
      \once\stemUp lad, mi'' dod lad[dod lad] mi dod' mi,

      %94
      red si' fad red[si' fad] red si' fad\mbreak
      mi si' sol mi[si' sol] mi si' sol
      fad _\markup\italic "en diminuant" si la fad[si la] fad si la

      %97
      mi si' sol mi[si' sol] mi si' sol
   }
   fad  si, la'[si,] sol'4~
   sol fad mi

   %100
   mi2(red8 dod)
   \grace dod8 red2.\fermata

}

XIIvlIIn = \relative do'' {
   
   mi,2
   fad2.
   sol
   la4 si si,
   
   %4
   mi sol'4.(si8)
   si8. (red,16) red4.(fad8)\mbreak
   fad8.(si,16) si4. mi8

   %7
   fad8.(sol32 la) sol4(fad8.-+) mi16
   mi4 sol \afterGrace mi -+({re16[mi)]}\mbreak
   mi4.(fad8\prall) si,4~

   %10
   si mi \afterGrace dod-+ ( {si16[dod)]}
   dod4 re8.\prall(mi32 fad) mi16(re) dod(si)
   lad4 si,8[(re fad) si\staccatissimo]
   
   %13
   sol,[si mi sol si, mi]
   la,[dod mi la la, dod]
   r la[re fad la, re]\mbreak
   
   %16
   sol,[si(re sol si re)]
   mi,[(si') fad(si) fad(lad)]
   si4 re fad~

   %19
   fad8.[(red16) mi8.(si16)] sol'4~
   sol8. la,16 dod4 mi~
   mi8.[(dod16) re8. \parentSlur (la16)] mi'4~
   
   %22
   mi si4. re8\mbreak
   dod8.(re32 mi) dod4.-+ si8
   si2.~
   
   %25
   si16(dod) si(red) red[(dod) dod(mi)] mi(red) red(fad)
   fad(mi) mi(sol) sol4(fad8.\prall) mi16
   red4-+ mi,2\mbreak
   
   %28
   fad2.
   sol
   la4-+ si si,
   
   %31
   mi sol'4.(si8)
   si8. (red,16) red4. \parentSlur (fad8)\mbreak
   fad8.(si,16) si4. mi8

   %34
   fad8.(sol32 la) sol4.\mordent  mi8\mbreak
   mi mi,16 fad sol8 [sol] sol8.-+(fad32  sol)
   la16 sol fad mi re8 [la'] la8.-+(sol32 la)

   %37
   si8 sol r sol' [fad-+ mi]
   la,[fad' si, mi si, red']
   mi mi,16 fad sol8 [sol] sol8.-+(fad32 sol)

   %40
   la16 sol fad mi re8[ la'] la8.-+(sol32 la)
   si8 sol r sol' [fad mi]
   la,[fad' si, mi si, red']

   %43
   mi16^\markup\italic"très fort" si' la si sol [sol fad sol] mi si' la si
   do mi, mi do' do [mi, mi do'] do mi, mi do'
   fad, la sol la fad [fad mi fad] re la' sol la\mbreak

   %46
   si re, re si' si [re, re si'] si re, re si'
   mi, sol fad sol mi [mi re mi] do sol' fad sol
   la do, do la'  la [do, do la']  la do, do la'

   %49
   red, fad mi fad red [red do red] si fad' mi fad
   sol si la sol fad [mi red do] si la sol fad
   mi' si' la si sol [sol fad sol] mi si' la si

   %52
   do mi, mi do' do [mi, mi do'] do mi, mi do'
   fad, la sol la fad [fad mi fad] re la' sol la\mbreak
   si re, re si' si [re, re si'] si re, re si'

   %55
   mi, sol fad sol mi [mi re mi] do sol' fad sol
   la do, do la'  la [do, do la']  la do, do la'
   red, fad mi fad red [red do red] si fad' mi fad

   %58
   sol si la sol fad [mi red do] si la sol fad\mbreak
   mi4 r r  %%% ultimo sistema di p. 44
   re4 do si
   
   %61
   la'8\f  do16 re mi8[fad16 sold] la8 la,
   re,4 r r
   do si la

   %64
   sol'8\f si16 do re8[mi16 fad] sol8 sol,\mbreak %%% OOKK fine p. 44
   do,4 r r
   r8 la la[(si) si(do)]
   
   %67
   do2.
   r8 la la[(si) si(dod)]
   dod?2 la4
   
   %70
   re16 re'\f do? si la[sol fad mi] re mi do re\mbreak
   si8 re'16\f do? si8 [re] sol, si
   r16 do, re mi fa[sol la si] do8 mi

   %73
   r mi16 re do8[mi] la, do
   r16 re, mi fad? sol [la si do] re8 fad
   r la16 sol fad8[la re, fad]\mbreak

   %76
   la,[re fad, la re, fad]
   do4 r16 re' mi fad sol8. si,16
   mi8. la,16 la4.-+ sol8

   %79
   \tuplet 3/2 {
      sol sol' re si[re si] sol si sol
      re re' la fad [la fad] re fa re\mbreak
      \once\stemUp la la'' mi do[mi do] la do la

      %82
      mi mi' si sol[si sol] mi sol mi
      \once\stemUp do mi' do sol[do sol] mi sol mi
      \once\stemUp  si mi' si sol[si sol] mi sol mi

      %85
      \once\stemUp lad, mi'' dod lad[dod lad] mi lad mi\mbreak
      red si red fad[red fad] si fad la
      sol sol' re si[re si] sol si sol

      %88
      re re' la fad[la fad] re fa re
      \once\stemUp la la'' mi do[mi do] la do la
      mi mi' si sol[si sol] mi sol mi\mbreak

      %91
      \once\stemUp do mi' do sol[do sol] mi sol mi
      \once\stemUp si mi' si sol[si sol] mi sol mi
      \once\stemUp lad, mi'' dod lad[dod lad] mi dod' mi,

      %94
      red si' fad red[si' fad] red si' fad\mbreak
      mi si' sol mi[si' sol] mi si' sol
      fad _\markup\italic "en diminuant" si la fad[si la] fad si la

      %97
      mi si' sol mi[si' sol] mi si' sol
   }
   fad  si, la'[si,] sol'4
   mi4. re!8 dod4
   
   %100
   dod?2(mi8) lad,
   \appoggiatura lad si2.\fermata
   
}

XIIhbIn = \relative do'' {

   sol'4.(si8)
   si8.\parentSlur ( red,16) red4.(fad8)\mbreak
   fad8.(si,16) si4 r8 mi
   mi8.[(do16) si8. (la16) sol8._+(fad16)]

   %4
   \appoggiatura fad8 sol4 sol'4.(si8)
   si8. (red,16) red4.(fad8)\mbreak
   fad8.(si,16) si4. mi8

   %7
   fad8.(sol32 la) sol4(fad8.-+) mi16
   mi4 sol \afterGrace mi -+({re16[mi)]}\mbreak
   mi4.(fad8\prall) si,4~

   %10
   si mi \afterGrace dod-+ ( {si16[dod)]}
   dod4 re8.\prall(mi32 fad) mi16(re) dod(si)
   lad8-+ r re4 (fad)~

   %13
   fad mi sol~
   sol dod, mi~
   mi re fad~\mbreak

   %16
   fad si, re
   dod8 [sol' fad mi re dod]
   re8 si re4 fad~

   %19
   fad mi sol~
   sol dod, mi~
   mi re fad~

   %22
   fad si,4. re8\mbreak
   dod8.(re32 mi) dod4.-+ si8
   si2.

   %25
   \afterGrace si' ({do16[si)]}
   si2.-+~
   si4 sol4. (si8)

   %28
   si8. ( red,16) red4.\parentSlur (fad8)\mbreak
   fad8.(si,16) si4. mi8
   mi8.[(do16) si8. (la16) sol8._+(fad16)]

   %31
   \appoggiatura fad8 sol4 sol'4.(si8)
   si8. (red,16) red4. \parentSlur (fad8)\mbreak
   fad8.(si,16) si4. mi8

   %34
   fad8.(sol32 la) sol4.\mordent  mi8\mbreak
   mi r r4 r
   R2.*23

   %59
   r4 si'8[(do) si(re)]
   sold,4\prall la \afterGrace si-+ ({la16[si)]}
   si4(do8\prall) r r4
   
   %62
   r4 la8[(si) la(do)]
   fad,4\prall sol \afterGrace la\prall \parentSlur ({sol16[la)]}
   la4(si8\prall) r r4\mbreak
   
   %65
   r4 mi,8[(fad) mi(la)]
   la2.
   la8.[(do16) do8.-+(si16) si8.-+ (la16)]
   
   %68
   la2.~
   la4.(si16 la) sol8.-+(fad32 sol)
   fad2 la4\mbreak
   
   %71
   re2.(
   mi)~
   mi
   
   %74
   fad2 r4
   R2.*12
   r4 si, sol
   
   %88
   sol la re~
   re do la~
   la si sol~
   
   %91
   sol do sol~
   sol si sol
   \afterGrace sol2.-+ ({fad16[sol)]}
   
   %94
   fad4\mordent fad la~\mbreak
   la sol si~
   si fad la
   
   %97
   la sol si
   si2.~
   si2 r8 sol
   
   %100
   sol2 fad8 sol
   fad2.\fermata

}

XIIhbIIn = \relative do'' {

   sol'4.(si8)
   si8.\parentSlur ( red,16) red4.(fad8)\mbreak
   fad8.(si,16) si4 r8 mi
   mi8.[(do16) si8. (la16) sol8._+(fad16)]

   %4
   \appoggiatura fad8 sol4 sol'4.(si8)
   si8. (red,16) red4.(fad8)\mbreak
   fad8.(si,16) si4. mi8

   %7
   fad8.(sol32 la) sol4(fad8.-+) mi16
   mi4 sol \afterGrace mi -+({re16[mi)]}\mbreak
   mi4.(fad8\prall) si,4~

   %10
   si mi \afterGrace dod-+ ( {si16[dod)]}
   dod4 re8.\prall(mi32 fad) mi16(re) dod(si)
   lad8-+ r re4 (fad)~

   %13
   fad mi sol~
   sol dod, mi~
   mi re fad~\mbreak

   %16
   fad si, re
   dod8 [sol' fad mi re dod]
   re8 si re4 fad~

   %19
   fad mi sol~
   sol dod, mi~
   mi re fad~

   %22
   fad si,4. re8\mbreak
   dod8.(re32 mi) dod4.-+ si8
   si2.

   %25
   \afterGrace si' ({do16[si)]}
   si2.-+~
   si4 sol4. (si8)

   %28
   si8. ( red,16) red4.\parentSlur (fad8)\mbreak
   fad8.(si,16) si4. mi8
   mi8.[(do16) si8. (la16) sol8._+(fad16)]

   %31
   \appoggiatura fad8 sol4 sol'4.(si8)
   si8. (red,16) red4. \parentSlur (fad8)\mbreak
   fad8.(si,16) si4. mi8

   %34
   fad8.(sol32 la) sol4.\mordent  mi8\mbreak
   mi r r4 r
   R2.*23

   %59
   r4 si'8[(do) si(re)]
   sold,4\prall la \afterGrace si-+ ({la16[si)]}
   si4(do8\prall) r r4
   
   %62
   r4 la8[(si) la(do)]
   fad,4\prall sol \afterGrace la\prall \parentSlur ({sol16[la)]}
   la4(si8\prall) r r4\mbreak
   
   %65
   r4 mi,8[(fad) mi(la)]
   la2.
   la8.[(do16) do8.-+(si16) si8.-+ (la16)]
   
   %68
   la2.~
   la4.(si16 la) sol8.-+(fad32 sol)
   fad2 la4\mbreak
   
   %71
   sol2.~
   sol(
   la)
   
   %74
   la2 r4
   R2.*12
   r4 re,4 sol
   
   %88
   sol fad re
   mi mi la~
   la sol mi~
   
   %91
   mi sol mi~
   mi sol mi
   \afterGrace mi2.-+ ( {red16[mi)]}
   
   %94
   red4\mordent red fad~\mbreak
   fad mi sol~
   sol red fad
   
   %97
   fad mi sol
   si,2.~
   si2 r8 sol'
   
   %100
   sol2 fad8 sol
   fad2.\fermata

}

XIIhcIn = \relative do'' {
   
   mi,2
   fad2.
   sol
   
   %3
   la4-+ si si,
   mi si2
   do2.
   
   %6
   si4 mi2~
   mi4 mi(red8.-+) mi16
   mi8 r si'4 dod~\mbreak
   
   %9
   dod lad si~
   si sold lad-+
   lad?(si) sol
   
   %12
   dod,-+ re2~
   re4 mi(re)
   dod2.~
   
   %15
   dod4 re(dod?)\mbreak
   si2.~
   si4 si lad-+
   
   %18
   si re2~
   re2.
   dod~
   
   %21
   dod
   si~\mbreak
   si4 lad4.-+ si8
   
   %24
   si2 si'4
   la sol si
   mi, mi red8.-+ mi16
   
   %27
   si'4 mi,2\mbreak
   fad2.
   sol
   
   %30
   la4-+ si si,
   mi si2
   do?2.
   
   %33
   si4 mi2~
   mi4 mi red8. mi16\mbreak
   mi4 r8 si'[mi, sol]
   
   %36
   fad4 r8 fad[re fad]
   sol re r si'[la si]
   do[do si si la la]
   
   %39
   sol4 si do
   r la re\mbreak
   r sol, si
   
   %42
   la sol fad
   mi8 <si' mi,>4 <si mi,> <si mi,>8(
   <do mi,>) <do mi,>4 <do mi,> <do mi,>8~
   
   %45
   <do re,> <do re,>4 <do re,> <do re,>8\mbreak
   <si re,> <si re,>4 <si re,> <si re,>8~
   <si re,> <si re,>4 <si re,> <si re,>8(
   
   %48
   <la mi>8) <la mi>4 <la mi> <la mi>8~
   <la red,> <la red,>4 <la red,> <la red,>8
   mi4 mi4.-+ red8
   
   %51
   mi <si' mi,>4 <si mi,> <si mi,>8(
   <do mi,>) <do mi,>4 <do mi,> <do mi,>8~
   <do re,> <do re,>4 <do re,> <do re,>8\mbreak
   
   %54
   <si re,> <si re,>4 <si re,> <si re,>8~
   <si re,> <si re,>4 <si re,> <si re,>8(
   <la mi>8) <la mi>4 <la mi> <la mi>8~
   
   %57
   <la red,> <la red,>4 <la red,> <la red,>8
   mi4 mi4.-+ red8
   \grace red?8 mi4 r r
   
   %60
   R2.
   la,8 do16 re mi8 [fad16 sol] la8[la,]
   re,4 r r
   
   %63
   R2.
   sol8 si16  do re8 [mi16 fad] sol8 sol,\mbreak
   do,4 r r
   
   %66
   R2.*4
   r16 re'' do si la[sol fad mi] re mi do re\mbreak
   si4 r r8 re'16 re
   
   %72
   re4 sol,8 r r sol16 sol
   do4 r r8 mi16 mi
   mi4 la, r
   
   %75
   r8 la16 sol fad8[la re, fad]\mbreak
   la[re fad, la re, fad]
   do4 r16 la' la la si4~
   
   %78
   si8. la32 sol fad4.-+ sol8
   sol2 \con \tuplet 3/2 { r8 sol sol }
   sol4 fad \tuplet 3/2 { r8 re fa }\mbreak
   
   %81
   mi2 \tuplet 3/2 { r8 la la }
   la4 sol \tuplet 3/2 { r8 mi sol }
   sol2 \tuplet 3/2 { r8 mi sol }
   
   %84
   sol2 \tuplet 3/2 { r8 mi sol }
   sol2 \tuplet 3/2 { r8 mi sol }\mbreak
   fad4 fad4.-+ mi8
   
   %87
   mi4 re2
   re la4
   la2 mi'4
   
   %90
   <mi sol,>2.~
   <mi sol,>~
   <mi sol,>~
   
   %93
   <mi sol,>~
   sol,4 si'2~\mbreak
   si2.~
   
   %96
   si~
   si
   red,4 fad mi
   
   %99
   si2.~
   si2~si8(lad)
   \appoggiatura lad?8 si2.\fermata

}

XIIfgn = \relative do {

   r4 r
   R2.*3
   r4 mi2
   fad2.

   %6
   sol
   la4 si si,
   mi r2\mbreak
   R2.*9

   %18
   si2.
   sol
   la

   %21
   fad
   sol
   mi8 sol fad2

   %24
   si2.
   si
   si~

   %27
   si4 r r\mbreak
   R2.*9
   r4 r8 sol' [sol, sol']

   %38
   la[la, si si' si, si']
   mi, [sol si mi mi, do']
   re,[fad la re re, re']\mbreak

   %41
   sol,,8[si re sol sol, sol']
   la,[la' si, si' si, si']
   mi, mi'4 mi mi8  %% ripeti da qua

   %44
   la,, la'4 la la8
   re,, re''4 re re8\mbreak
   sol,, sol'4 sol sol8

   %47
   do,, do''4 do do8
   fad,, fad'4 fad fad8
   si,8 si'4 si si8

   %50
   mi8. la,16 si4 si, %%fin qua
   mi8 mi'4 mi mi8
   la,, la'4 la la8

   %53
   re,, re''4 re re8
   sol,, sol'4 sol sol8
   do,, do''4 do do8

   %56
   fad,, fad'4 fad fad8
   si,8 si'4 si si8
   mi8. la,16 si4 si, \mbreak

   %59
   mi4 r r
   R2.
   la8 do16 re mi8[fad16 sold] la8 la,

   %62
   re,,4 r r
   R2.
   sol'8 si16 do re8[mi16 fad] sol8 sol,\mbreak

   %65
   do,,4 r r
   R2.*4
   r16 re'' do si la[sol fad mi] re mi do re\mbreak

   %71
   si4 r r8 sol16 sol
   do4 r r8 do16 si
   la4 r  r8 la16 la

   %74
   re4 r r
   \clef tenor \key mi \minor r8 la''16 sol fad8[la re, fad]\mbreak
   la,8[re fad, la re, fad]

   %77
   \clef bass \key mi\minor do,4 r16 do' re do si4
   do re re,
   sol2 \con\tuplet 3/2 { r8 si' sol }

   %80
   re2 \tuplet 3/2 { r8 fa re }\mbreak
   la2 \tuplet 3/2 { r8 do' la}
   mi2 \tuplet 3/2 { r8 sol mi }

   %83
   do2 \tuplet 3/2 { r8 sol' mi }
   si2 \tuplet 3/2 { r8 sol' mi }
   lad,2 \tuplet 3/2 { r8 mi' lad, }\mbreak

   %86
   si2~si8. si16
   mi,4 sol'2
   re,2.

   %89
   la'
   mi\mbreak
   do

   %92
   si
   lad'
   si2.~\mbreak

   %95
   si~
   si~
   si~

   %98
   si~
   si~
   si~

   %101
   si\fermata

}

XIIbcn = \relative do {

   r4 r
   R2.*3
   r4 mi2
   fad2.

   %6
   sol
   la4 si si,
   mi mi'2\mbreak

   %9
   re2.
   dod2 fad4
   si, sol mi

   %12
   fad si2
   sol2.
   la

   %15
   fad\mbreak
   sol
   mi4 fad2

   %18
   si,8[re fad si si, re]
   sol, [si mi sol si, mi]
   la,[do mi la la, do]

   %21
   fad,[la re fad la, re]
   sol,[si mi sol sol, si]
   mi,8 sol fad2

   %24
   si2.
   si
   <si si,>~

   %27
   <si si,>4 r r\mbreak
   R2.*3
   r4 mi,2

   %32
   fad2.
   sol2 r8 sol
   la8.-+ sol32 la si4 si\mbreak

   %35
   mi, r8 mi'[mi, mi']
   re re,4 re'8[re, re']
   sol sol, r sol' [sol, sol']

   %38
   la[la, si si' si, si']
   mi, [sol si mi mi, do']
   re,[fad la re re, re']\mbreak

   %41
   sol,,8[si re sol sol, sol']
   la,[la' si, si' si, si']
   mi, mi'4 mi mi8  %% ripeti da qua

   %44
   la,, la'4 la la8
   re,, re''4 re re8\mbreak
   sol,, sol'4 sol sol8

   %47
   do,, do''4 do do8
   fad,, fad'4 fad fad8
   si,8 si'4 si si8

   %50
   mi8. la,16 si4 si, %%fin qua
   mi8 mi'4 mi mi8
   la,, la'4 la la8

   %53
   re,, re''4 re re8
   sol,, sol'4 sol sol8
   do,, do''4 do do8

   %56
   fad,, fad'4 fad fad8
   si,8 si'4 si si8
   mi8. la,16 si4 si, \mbreak

   %59
   mi4 r r
   R2.
   la8 do16 re mi8[fad16 sold] la8 la,

   %62
   re,,4 r r
   R2.
   sol'8 si16 do re8[mi16 fad] sol8 sol,\mbreak

   %65
   do,,4 r r
   R2.*4
   r16 re'' do si la[sol fad mi] re mi do re\mbreak

   %71
   si4 r r8 sol16 sol
   do4 r r8 do16 si
   la4 r  r8 la16 la

   %74
   re4 r r
   \clef tenor \key mi \minor r8 la''16 sol fad8[la re, fad]\mbreak
   la,8[re fad, la re, fad]

   %77
   \clef bass \key mi\minor do,4 r16 do' re do si4
   do re re,
   sol2 \con\tuplet 3/2 { r8 si' sol }

   %80
   re2 \tuplet 3/2 { r8 fa re }\mbreak
   la2 \tuplet 3/2 { r8 do' la}
   mi2 \tuplet 3/2 { r8 sol mi }

   %83
   do2 \tuplet 3/2 { r8 sol' mi }
   si2 \tuplet 3/2 { r8 sol' mi }
   lad,2 \tuplet 3/2 { r8 mi' lad, }\mbreak

   %86
   si2~si8. si16
   mi,4 sol' \tuplet 3/2 { r8 si sol }
   re,2 \tuplet 3/2 { r8 fa' re }

   %89
   la2 \tuplet 3/2 { r8 do' la }
   mi,2 \tuplet 3/2 { r8 sol' mi }\mbreak
   <do do,>2 \tuplet 3/2 { r8 sol' mi }

   %92
   si2 \tuplet 3/2 { r8 sol' mi }
   <<lad,2\\lad>>  \tuplet 3/2 { r8 mi' lad, }
   si2.~\mbreak

   %95
   si~
   si~
   si~

   %98
   si~
   si~
   si~

   %101
   si\fermata

}

XIIbfn = \figuremode {

   \bassFigureExtendersOn
   \bassFigureStaffAlignmentUp



}

forma = {

   \once\override Staff.TimeSignature.transparent = ##t
   \time 3/2
   \override Staff.TimeSignature.style = #'single-digit
   \key mi\minor
   \tempo 2 = 60
   \partial 2 s2
   \set Score.measureLength = #(ly:make-moment 3 4)
   s2.*101\key mi\major
   \bar "|"

}


XIIvlI = {
   \XIIglobal
   %\notypeset
   <<\XIIvlIn \forma>>
}


XIIvlII = {
   \XIIglobal
   <<\XIIvlIIn \forma>>
}


XIIhbI = {
   \XIIglobal
   <<\XIIhbIn \forma>>
}


XIIhbII = {
   \XIIglobal
   <<\XIIhbIIn \forma>>
}


XIIhcI = {
   \XIIglobal
   \clef alto
   <<\XIIhcIn \forma>>
}


XIIfg = {
   \XIIglobal
   \clef bass
   <<\XIIfgn \forma>>
}

XIIbc = {
   \XIIglobal
   \clef bass
   <<\XIIbcn \forma \XIIbfn>>
   \typeset
}



XIIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \override BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
   \senza

}

XIIIvlIn = \relative do'' {

   r4 r32 mi,(fad sold la si dod red) mi8.[mi16]
   mi4. \tuplet 8/4 { mi,32 (fad sold la si dod red mi) } <fad si,>8.[<fad si,>16]
   <fad si,>4. \tuplet 9/4 { mi,32[(fad sold la si dod red mi fad)] } sold8. sold16

   %4
   sold4 fad8\prall sold-. si16(la) sold(fad)\mbreak
   \appoggiatura fad8 sold4. \tuplet 7/4{ mi,32(fad sold la si dod red) } mi8.[mi16]
   mi4. \tuplet 8/4 { mi,32 (fad sold la si dod red mi) } <fad si,>8.[<fad si,>16]

   %7
   <fad si,>4. \tuplet 9/4 { mi,32(fad sold la si dod red mi fad)] }  sold8. sold16
   sold4 fad8 sold si16(la) sold(fad)\mbreak
   \appoggiatura fad8 sold si16 la sold la fad sold mi fad red mi

   %10
   dod8 la16 la la8 dod16 dod dod8 mi16 mi
   mi8 dod16 dod dod8 mi16 mi mi8 la16 la
   la8 dod16 si la si sold la fad sold mi fad

   %13
   red8 si16 si si8 red16 red red8 fad16 fad\mbreak
   fad8 red16 red red8 fad16 fad fad8 si16 si
   si2.~

   %16
   si8 la16 sold fad mi red dod si la sold fad
   \once\stemUp mi8 si''16 la sold la fad sold mi fad red mi
   dod8 la16 la la8 dod16 dod dod8 mi16 mi

   %19
   mi8 dod16 dod dod8 mi16 mi mi8 la16 la
   la8 dod16 si la si sold la fad sold mi fad
   red8 si16 si si8 red16 red red8 fad16 fad

   %22
   fad8 red16 red red8 fad16 fad fad8 si16 si\mbreak
   si2.~
   si8. la32 sold fad4.\prall mi8

   %25
   mi4 mi, _\markup\italic "très doux" mi
   <mi sold,>2.^\< ~
   <mi sold,>4\! sold8 mi si' sold

   %28
   fad4 fad fad
   <fad si,>2.~ ^\<\mbreak
   <fad si,>4\! la8(fad) dod'(la)

   %31
   sold4 <<
      {
         sold sold
         sold
      }\\{
         mi mi
         mi
      }
   >> si'8[(sold mi'8. red16)]
   red4(dod8\prall)\noBeam red[mi8.(dod16)]

   %34
   dod4\prall (si8) red[mi8. si16]
   la4(sold\prall) fad8 r\mbreak
   r8 si, mi4^\markup\italic "moins doux" mi

   %37
   <mi sold,>2.^\< ~
   <mi sold,>8\!si[(sold' mi si' sold)]
   fad8. si,16 fad'4 fad

   %40
   <fad si,>2.~^\<\mbreak
   <fad si,>8\! si,[(la' fad dod' la)]\mbreak  %% fine I sist. p 51
   sold4 <<
      {
         sold sold

         %43
         sold8
      }\\{
         mi4 mi
         mi8
      }
   >> mi[si' (sold mi'8. red16)]
   red4(dod8\prall)\noBeam red[mi8.(dod16)]
   dod4 (si8\prall) red[mi8. mi,16]

   %46
   la8. sold16 fad4.-+ mi8
   mi16\< mi si si mi mi sold sold mi mi si si\mbreak
   mi\! mi si si mi mi sold sold mi mi sold sold

   %49
   fad fad si, si fad' fad la la fad fad si, si
   fad' fad si, si fad' fad la la fad fad la la
   sold sold mi mi sold sold si si sold sold mi mi\mbreak

   %52
   sold sold mi mi sold sold si si sold sold si si
   la la mi mi la la dod dod la la mi mi
   la la mi mi la la dod dod la la dod dod

   %55
   la la fad fad la la red red la la fad fad\mbreak
   la la fad fad la la red red la la red red
   mi mi si si mi mi sold sold mi mi si si

   %58
   mi mi si si mi mi sold sold mi mi si si
   sold' sold mi mi sold sold si si sold sold mi mi\mbreak
   sold sold mi mi sold sold si si sold sold mi mi

   %61
   si' si sold sold si si mi mi si si sold sold
   si si sold sold si si mi mi si si sold sold
   mi' mi mi mi mi mi mi mi mi mi mi mi\mbreak

   %64
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi red red red red dod dod dod dod

   %67
   dod dod dod dod si si si si la la la la\mbreak
   la la la la sold sold sold sold fad fad fad fad
   fad fad fad fad mi mi mi mi red red red red

   %70
   mi, mi si si mi mi sold sold mi mi si si
   mi mi si si mi mi sold sold mi mi sold sold\mbreak
   fad fad si, si fad' fad la la fad fad si, si

   %73
   fad' fad si, si fad' fad la la fad fad la la
   sold sold mi mi sold sold si si sold sold mi mi\mbreak
   sold sold mi mi sold sold si si sold sold si si

   %76
   la la mi mi la la dod dod la la mi mi
   la la mi mi la la dod dod la la dod dod
   la la fad fad la la red red la la fad fad\mbreak

   %79
   la la fad fad la la red red la la red red
   mi mi si si mi mi sold sold mi mi si si
   mi mi si si mi mi sold sold mi mi si si

   %82
   sold' sold mi mi sold sold si si sold sold mi mi
   sold sold mi mi sold sold si si sold sold mi mi\mbreak
   si' si sold sold si si mi mi si si sold sold

   %85
   si si sold sold si si mi mi si si sold sold
   mi' mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi\mbreak

   %88
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi red red red red dod dod dod dod
   dod dod dod dod si si si si la la la la

   %91
   la la la la sold sold sold sold fad fad fad fad\mbreak
   si2 r4
   dod2 r4

   %94
   sold~sold4. fad8
   fad4-+~fad4. mi8
   mi2.

}

XIIIvlIIn = \relative do'' {

   r4 r32 mi,(fad sold la si dod red) mi8.[mi16]
   mi4. \tuplet 8/4 { mi,32 (fad sold la si dod red mi) } <fad si,>8.[<fad si,>16]
   <fad si,>4. \tuplet 9/4 { mi,32[(fad sold la si dod red mi fad)] } sold8. sold16

   %4
   sold4 fad8\prall sold-. si16(la) sold(fad)\mbreak
   \appoggiatura fad8 sold4. \tuplet 7/4{ mi,32(fad sold la si dod red) } mi8.[mi16]
   mi4. \tuplet 8/4 { mi,32 (fad sold la si dod red mi) } <fad si,>8.[<fad si,>16]

   %7
   <fad si,>4. \tuplet 9/4 { mi,32(fad sold la si dod red mi fad)] }  sold8. sold16
   sold4 fad8 sold si16(la) sold(fad)\mbreak
   \appoggiatura fad8 sold si16 la sold la fad sold mi fad red mi

   %10
   dod8 la16 la la8 dod16 dod dod8 mi16 mi
   mi8 dod16 dod dod8 mi16 mi mi8 la16 la
   la8 dod16 si la si sold la fad sold mi fad

   %13
   red8 si16 si si8 red16 red red8 fad16 fad\mbreak
   fad8 red16 red red8 fad16 fad fad8 si16 si
   si2.~

   %16
   si8 la16 sold fad mi red dod si la sold fad
   \once\stemUp mi8 si''16 la sold la fad sold mi fad red mi
   dod8 la16 la la8 dod16 dod dod8 mi16 mi

   %19
   mi8 dod16 dod dod8 mi16 mi mi8 la16 la
   la8 dod16 si la si sold la fad sold mi fad
   red8 si16 si si8 red16 red red8 fad16 fad

   %22
   fad8 red16 red red8 fad16 fad fad8 si16 si\mbreak
   si2.~
   si8. la32 sold fad4.\prall mi8

   %25
   mi4 mi, _\markup\italic "très doux" mi
   <mi sold,>2.^\< ~
   <mi sold,>4\! sold8 mi si' sold

   %28
   fad4 fad fad
   <fad si,>2.~ ^\<\mbreak
   <fad si,>4\! la8(fad) dod'(la)

   %31
   sold4 <<
      {
         sold sold
         sold
      }\\{
         mi mi
         mi
      }
   >> si'8[(sold mi'8. red16)]
   red4(dod8\prall)\noBeam red[mi8.(dod16)]

   %34
   dod4\prall (si8) red[mi8. si16]
   la4(sold\prall) fad8 r\mbreak
   r8 si, mi4^\markup\italic "moins doux" mi

   %37
   <mi sold,>2.^\< ~
   <mi sold,>8\!si[(sold' mi si' sold)]
   fad8. si,16 fad'4 fad

   %40
   <fad si,>2.~^\<\mbreak
   <fad si,>8\! si,[(la' fad dod' la)]\mbreak  %% fine I sist. p 51
   sold4 <<
      {
         sold sold

         %43
         sold8
      }\\{
         mi4 mi
         mi8
      }
   >> mi[si' (sold mi'8. red16)]
   red4(dod8\prall)\noBeam red[mi8.(dod16)]
   dod4 (si8\prall) red[mi8. mi,16]

   %46
   la8. sold16 fad4.-+ mi8
   mi16\< mi si si mi mi sold sold mi mi si si\mbreak
   mi\! mi si si mi mi sold sold mi mi sold sold

   %49
   fad fad si, si fad' fad la la fad fad si, si
   fad' fad si, si fad' fad la la fad fad la la
   sold sold mi mi sold sold si si sold sold mi mi\mbreak

   %52
   sold sold mi mi sold sold si si sold sold si si
   la la mi mi la la dod dod la la mi mi
   la la mi mi la la dod dod la la dod dod

   %55
   la la fad fad la la red red la la fad fad\mbreak
   la la fad fad la la red red la la red red
   si si sold sold si si mi mi si si sold sold

   %58
   si si sold sold si si mi mi si si sold sold
   mi' mi si si mi mi sold sold mi mi si si\mbreak
   mi mi si si mi mi sold sold mi mi si si

   %61
   sold' sold mi mi sold sold si si sold sold mi mi
   sold sold mi mi sold sold si si sold sold mi mi
   si' si sold sold si si sold sold dod dod la la\mbreak

   %64
   si si sold sold si si sold sold dod dod la la
   si si sold sold si si sold sold mi mi sold sold
   fad fad fad fad fad fad fad fad mi mi mi mi

   %67
   red red red red red red red red dod dod dod dod
   si si si si si si si si la la la la
   sold sold sold sold sold sold sold sold fad fad fad fad\mbreak

   %70
   mi mi si si mi mi sold sold mi mi si si
   mi mi si si mi mi sold sold mi mi sold sold\mbreak
   fad fad si, si fad' fad la la fad fad si, si

   %73
   fad' fad si, si fad' fad la la fad fad la la
   sold sold mi mi sold sold si si sold sold mi mi\mbreak
   sold sold mi mi sold sold si si sold sold si si

   %76
   la la mi mi la la dod dod la la mi mi
   la la mi mi la la dod dod la la dod dod
   la la fad fad la la red red la la fad fad

   %79
   la la fad fad la la red red la la red red\mbreak
   si si sold sold si si mi mi si si sold sold
   si si sold sold si si mi mi si si sold sold

   %82
   mi' mi si si mi mi sold sold mi mi si si\mbreak
   mi mi si si mi mi sold sold mi mi si si
   sold' sold mi mi sold sold si si sold sold mi mi

   %85
   sold sold mi mi sold sold si si sold sold mi mi
   si' si sold sold si si sold sold dod dod la la\mbreak
   si si sold sold si si sold sold dod dod la la

   %88
   si si sold sold si si sold sold mi mi sold sold
   fad fad fad fad fad fad fad fad mi mi mi mi
   red red red red red red red red dod dod dod dod

   %91
   si si si si si si si si la la la la
   si'2 r4
   dod2 r4

   %94
   sold4~sold4. fad8
   fad4-+~fad4. mi8
   mi2.

}

XIIIhbIn = \relative do'' {
   
   r4 r mi8. mi16
   mi4 r fad8. fad16
   fad4 r sold8. sold16
   
   %4
   sold4 fad8 sold si16(la) sold(fad)\mbreak
   \grace fad8 sold4 r mi8. mi16
   mi4 r fad8. fad16
   
   %7
   fad4 r sold8. sold16
   sold4 fad8 sold si16(la) sold(fad)\mbreak
   \grace fad8 sold\noBeam  si16 la sold la fad sold mi fad red mi

   %10
   dod8 la16 la la8 dod16 dod dod8 mi16 mi
   mi8 dod16 dod dod8 mi16 mi mi8 la16 la
   la8 dod16 si la si sold la fad sold mi fad

   %13
   red8 si16 si si8 red16 red red8 fad16 fad\mbreak
   fad8 red16 red red8 fad16 fad fad8 si16 si
   si2.~

   %16
   si8 la16 sold fad mi red dod si la sold fad
   mi8 mi'16 mi mi8[mi mi mi]
   mi2-+ r4\mbreak
   
   %19
   r8 mi16 mi mi8[mi mi mi]
   la2.~
   la4 r r
   
   %22
   r8 fad16 fad fad8 fad16 fad fad8 fad16 fad\mbreak
   si2.~
   si8.(la32-+ sold) fad4.-+ mi8
   
   %25
   mi4 mi, mi
   mi2.~
   mi2 si'8 sold
   
   %28
   fad4 fad fad
   fad2.~\mbreak
   fad2 dod'8(la)
   
   %31
   sold4 sold sold
   sold2.~
   sold4 fad2~
   
   %34
   fad4 mi2
   la4 (sold\prall) fad8 r\mbreak
   r si mi4 mi
   
   %37
   mi2.~
   mi2 si'8(sold)
   fad8.(si,16) fad'4 fad
   
   %40
   fad2.~
   fad2 dod'8 la\mbreak
   sold4 sold sold
   
   %43
   sold2.~
   sold4 fad2~
   fad4 mi2
   
   %46
   la,8. sold16 fad4.-+ mi8
   mi2.~\mbreak
   mi2 sold4
   
   %49
   fad2.~
   fad2 la4
   sold2.\mbreak
   
   %52
   si
   dod~
   dod
   
   %55
   red~\mbreak
   red 
   mi~
   
   %58
   mi
   sold~\mbreak
   sold
   
   %61
   si~
   si
   si8 sold si[sold] dod la\mbreak
   
   %64
   si8 sold si[sold] dod la
   si[mi, sold si] mi4~
   mi red dod~
   
   %67
   dod si la\mbreak
   la sold fad~
   fad mi red
   
   %70
   mi,2.
   mi2 sold4\mbreak
   fad2.~
   
   %73
   fad2 la4
   sold2.
   si\mbreak
   
   %76
   dod~
   dod
   red~
   
   %79
   red\mbreak
   mi~
   mi
   
   %82
   sold
   sold\mbreak
   si~
   
   %85
   si
   si8 sold si[sold] dod la
   si8 sold si[sold] dod la\mbreak
   
   %88
   si[mi, sold si] mi4~
   mi red dod~
   dod si la
   
   %91
   la sold fad\mbreak
   si2 r4
   dod2 r4
   
   %94
   sold4~sold4. mi8
   fad4-+~fad4. mi8
   mi2.

}

XIIIhbIIn = \relative do'' {
   
   r4 r mi8. mi16
   mi4 r red8. red16
   red4 r mi8. mi16 
   
   %4
   mi4 red8 mi sold16(fad) mi(red)\mbreak
   \grace red8 mi4 r mi8. mi16
   mi4 r red8. red16
   
   %7
   red4 r mi8. mi16 
   mi4 red8 mi sold16(fad) mi(red)\mbreak
   \grace red8 mi\noBeam  si'16 la sold la fad sold mi fad red mi

   %10
   dod8 la16 la la8 dod16 dod dod8 mi16 mi
   mi8 dod16 dod dod8 mi16 mi mi8 la16 la
   la8 dod16 si la si sold la fad sold mi fad

   %13
   red8 si16 si si8 red16 red red8 fad16 fad\mbreak
   fad8 red16 red red8 fad16 fad fad8 si16 si
   si2.~

   %16
   si8 la16 sold fad mi red dod si la sold fad
   mi8 mi'16 mi mi8[mi mi mi]
   mi2-+ r4\mbreak
   
   %19
   r8 mi16 mi mi8[mi mi mi]
   la2.~
   la4 r r
   
   %22
   r8 fad16 fad fad8 fad16 fad fad8 fad16 fad\mbreak
   si2.~
   si8.(la32-+ sold) fad4.-+ mi8
   
   %25
   mi4 mi, mi
   mi2.~
   mi2 si'8 sold
   
   %28
   fad4 fad fad
   fad2.~\mbreak
   fad2 dod'8(la)
   
   %31
   sold4 sold sold
   sold2.~
   sold4 fad2~
   
   %34
   fad4 mi2
   la4 (sold\prall) fad8 r\mbreak
   r si mi4 mi
   
   %37
   mi2.~
   mi2 si'8(sold)
   fad8.(si,16) fad'4 fad
   
   %40
   fad2.~
   fad2 dod'8 la\mbreak
   sold4 sold sold
   
   %43
   sold2.~
   sold4 fad2~
   fad4 mi2
   
   %46
   la,8. sold16 fad4.-+ mi8
   mi2.~\mbreak
   mi
   
   %49
   fad~
   fad
   sold~
   
   %52
   sold
   la~
   la
   
   %55
   si~\mbreak
   si
   mi~
   
   %58
   mi~
   mi~\mbreak
   mi
   
   %61
   sold~
   sold
   sold8 mi sold[mi] la fad\mbreak
   
   %64
   sold mi sold[mi] la fad
   sold[mi sold si] sold4
   fad2 mi4
   
   %67
   red2 dod4\mbreak
   si2 la4
   sold2 fad4
   
   %70
   mi2.
   mi\mbreak
   fad~
   
   %73
   fad
   sold\parentSlur (
   sold)\mbreak
   
   %76
   la~
   la
   si~
   
   %79
   si\mbreak
   mi~
   mi
   
   %82
   mi
   mi\mbreak
   sold~
   
   %85
   sold
   sold8 mi sold[mi] la fad\mbreak
   sold mi sold[mi] la fad
   
   %88
   sold[mi sold si] sold4
   fad2 mi4
   red2 dod4
   
   %91
   si2 la4\mbreak
   si'2 r4
   dod2 r4
   
   %94
   sold2.
   fad4-+~fad4. mi8
   mi2.
   
}

XIIItpn = %\transpose do mi, {

\relative do'' {
   \key do\major
   
   r4 r do8. do16
   do4 r re8. re16
   re4 r mi8. mi16
   
   %4
   mi4 re8 mi sol16(fa) mi (re)\mbreak
   mi4-+ r do8. do16
   do4 r re8. re16
   
   %7
   re4 r mi8. mi16
   mi4 re8 mi sol16(fa) mi (re)\mbreak
   mi2-+ r4
   
   %10
   R2.*7
   r8 do16 do do8[do do do]
   do2.-+~\mbreak
   
   %19
   do-+
   r8 re16 re re8[re re re]
   re2.-+~
   
   %22
   re2~re8.\tuplet 3/2 { fa32(mi fa) }\mbreak
   sol2.~
   sol8. fa32 mi re4.-+ do8
   
   %25
   do r r4 r
   R2.*25
   do,2.~\mbreak
   
   %52
   do~
   do~
   do
   
   %55
   sol'~
   sol
   do~
   
   %58
   do
   mi~\mbreak
   mi
   
   %61
   sol~
   sol
   <do do,>4 r8 do,[do do]\mbreak
   
   %64
   do2.-+~
   do8 do-. mi-. sol-. mi-. do-.
   sol'2.-+~
   
   %67
   sol-+~\mbreak
   sol-+
   sol,
   
   %70
   R2.*4
   do,2.~
   do~\mbreak
   
   %76
   do~
   do
   sol'~
   
   %79
   sol\mbreak
   <<{do8 sol do mi do sol
      do sol do mi do sol
      
      %82
      mi' do mi sol mi do
      mi do mi sol mi do}\\{do2.
                            do
                            mi
                            mi}>>\mbreak
   sol
   
   %85
   sol
   <<{sol8 mi sol mi la fa
      sol mi sol mi la fa\mbreak}\\{do2.
                                    do}>>
   
   %88
   sol'8 do, mi sol mi do
   sol'2.-+~
   sol
   
   %91
   fa4 mi-+ re\mbreak
   sol r r
   do, r r
   
   %94
   do2~do8.\tuplet 3/2 { re32 do re }
   re4-+~re4. do8
   do2.
   
   %}

}

XIIIcrIn = %\transpose do mi, {

\relative do'' {
   \key do\major
   
   r4 r do8. do16
   do4 r re8. re16
   re4 r mi8. mi16
   
   %4
   mi4 re8 mi sol16(fa) mi (re)\mbreak
   \grace re8 mi4 r do8. do16
   do4 r re8. re16
   
   %7
   re4 r mi8. mi16
   mi4 re8 mi sol16(fa) mi (re)\mbreak
   \grace re8 mi4 r r
   
   %10
   R2.*7
   r8 do16 do do8[do do do]
   do2.-+~\mbreak
   
   %19
   do
   r8 re16 re re8[re re re]
   re2.-+~
   
   %22
   re
   r8 do16 do do8 mi16 mi mi8. sol16
   sol8. fa32 mi re4.-+ do8
   
   %25
   do4 r r
   sol2.~
   sol~
   
   %28
   sol~
   sol~\mbreak
   sol~
   
   %31
   sol~
   sol4 r r
   R2.*3
   
   %36
   r8 sol do4 do
   do2.~
   do2 sol'8. mi16
   
   %39
   re8. sol,16 re'4 re
   re2.~
   re2 la'8 fa\mbreak
   
   %42
   mi4 mi mi
   mi2.~
   mi4 re2~
   
   %45
   re4 do2
   fa8. mi16 re4.-+ do8 
   do4 r r\mbreak
   
   %48
   do,2.~
   do~
   do~
   
   %51
   do~\mbreak
   do~
   do~
   
   %54
   do
   sol'~
   sol
   
   %57
   do8 sol do mi do sol
   do sol do mi do sol
   mi'2.~\mbreak
   
   %60
   mi~
   mi8 do mi sol mi do
   mi do mi sol mi do
   
   %63
   do2.~
   do~
   do
   
   %66
   sol~
   sol~\mbreak
   sol~
   
   %69
   sol
   do,~
   do~\mbreak
   
   %72
   do~
   do~
   do~
   
   %75
   do~\mbreak
   do~ 
   do
   
   %78
   sol'~
   sol\mbreak
   do8 sol do mi do sol 
   
   %81
   do sol do mi do sol
   mi'2.~
   mi~\mbreak
   
   %84
   mi8 do mi sol mi do
   mi do mi sol mi do
   do2.~
   
   %87
   do~\mbreak 
   do
   sol~
   
   %90
   sol~
   sol\mbreak
   do2 r4
   
   %93
   do2 r4
   sol2.~
   sol
   
   %96
   do,

   %}

}

XIIIcrIIn = %\transpose do mi, {

\relative do'' {
   \key do\major
   
   r4 r  do,8. do16
   do4 r sol'8. sol16
   sol4 r do8. do16
   
   %4
   do4 sol8 do mi16(re do sol)\mbreak
   do4 r do,8. do16
   do4 r sol'8. sol16
   
   %7
   sol4 r do8. do16
   do4 sol8 do mi16(re do sol)\mbreak
   mi4 r r
   
   %10
   R2.*7
   r8 do16 do do8 [do do do]
   fa,2.~\mbreak
   
   %19
   fa
   r8 re'16 re re8 re16 re re8 re16 re
   sol2.-+~
   
   %22
   sol\mbreak
   r8 mi16 mi mi8 do'16 do do8. mi16
   mi8. re32 do sol4. sol8
   
   %25
   do,4 r r
   do2.~
   do
   
   %28
   sol~
   sol~\mbreak 
   sol
   
   %31
   do~
   do4 r r
   R2.*3
   
   %36
   r4 do do
   do2.~
   do2 mi8. do16
   
   %39
   sol'4  sol sol
   sol,2.~
   sol2 sol'4\mbreak
   
   %42
   do do do
   do mi2~
   mi4 re2~
   
   %45
   re4 do2
   re8. do16 sol2
   do4 do,2\mbreak
   
   %48
   do2.~
   do~
   do~
   
   %51
   do~
   do~
   do~
   
   %54
   do~
   do~\mbreak
   do
   
   %57
   do8 mi sol do sol mi
   sol mi sol do sol mi
   do'2.~
   
   %60
   do~
   do8 sol do mi  do sol
   do sol do mi do sol
   
   %63
   do,2.~
   do~
   do
   
   %66
   sol~
   sol~
   sol~
   
   %69
   sol
   do~
   do~\mbreak
   
   %72
   do~
   do~
   do~
   
   %75
   do~\mbreak
   do~
   do~
   
   %78
   do~
   do\mbreak
   do8 mi sol do sol mi
   
   %81
   sol mi sol si sol mi
   do'2.~
   do~\mbreak
   
   %84
   do8 sol do mi do sol
   do sol do mi do sol
   do,2.~
   
   %87
   do~\mbreak
   do
   sol~
   
   %90
   sol~
   sol\mbreak
   do2 r4
   
   %93
   do2 r4
   sol2.~
   sol
   
   %96
   do
   
   %}

}

XIIIhcIn = \relative do'' {
   
   r4 r <<{si8. si16
           si4}\\{sold8. sold16
                  sold4}>> r <si red,>8. <si red,>16
   <si red,>4 r <si mi,>8. <si mi,>16
   
   %4
   <si mi,>4 si,8-.[si-. si-. si-.]\mbreak
   si4 r <<{si'8. si16
           si4}\\{sold8. sold16
                  sold4}>> r <si red,>8. <si red,>16
   
   %7
   <si red,>4 r <si mi,>8. <si mi,>16
   <si mi,>4 si,8-.[si-. si-. si-.]\mbreak
   si8 <si' mi,>4 <si mi,> <si mi,>8
   
   %10
   <la mi>4 r r
   r8 <dod mi,>16 <dod mi,> <dod mi,>8 <dod mi,>16 <dod mi,> <dod mi,>8 <dod mi,>16 <dod mi,>
   <dod fad,>8 <dod fad,>4 <dod fad,> <dod fad,>8
   
   %13
   <si fad>4 r r\mbreak
   r8 <fad si,>16 <fad si,> <fad si,>8 <fad si,>16 <fad si,> <fad si,>8 <fad si,>16 <fad si,>
   sold8 si16 si si8 sold16 sold sold8 mi16 mi
   
   %16
   mi4 mi red
   mi8 <si' mi,>4 <si mi,> <si mi,>8
   <la mi>4 r r\mbreak   
   
   %19
   r8  <dod mi,>16 <dod mi,> <dod mi,>8 <dod mi,>16 <dod mi,> <dod mi,>8 <dod mi,>16 <dod mi,>
   <dod fad,>8 <dod fad,>4 <dod fad,> <dod fad,>8
   <si fad>4 r r
   
   %22
   r8 si16 si si8 red16 red red8 si16 si\mbreak
   mi8 si16 si si8 sold16 sold sold8. mi16
   mi4 mi red8.-+ mi16
   
   %25
   mi4 r r
   R2.*11
   <si mi,>2.~
   
   %38
   <si mi,>4 r r
   si r r
   <red sold,>2.~
   
   %41
   <red sold,>4 r r\mbreak
   mi4 <si mi,> <si mi,>
   <si mi,>2.
   
   %44
   la
   sold
   fad8 mi si'2
   
   %47
   mi8-. (mi-. mi-. mi-. mi-. mi-.)\mbreak
   mi8-. (mi-. mi-. mi-. mi-. mi-.)
   red( red red red red red)
   
   %50
   red( red red red red red)
   mi16 mi si  si mi mi sold sold mi mi si si\mbreak
   mi mi dod dod mi mi sold sold mi mi sold sold
   
   %53
   mi mi dod dod mi mi la la mi mi dod dod
   mi mi dod dod mi mi la la mi mi  la la
   fad fad si, si fad' fad la la fad fad si, si\mbreak
   
   %56
   fad' fad si, si fad'8  la fad[la]
   sold mi sold[si] sold mi
   sold mi sold [si] sold mi
   
   %59
   si' sold si[mi] si sold\mbreak
   si sold si [mi] si sold
   mi'16 mi mi mi mi mi mi mi mi mi mi mi
   
   %62
   \repeat unfold 12 {mi}
   mi mi mi mi mi mi mi mi la, la la la\mbreak
   mi' mi mi mi mi mi mi mi la, la la la
   
   %65
   mi' mi si si mi mi si si sold sold mi mi
   si' \repeat unfold 11 {si}
   si si si si si si si si fad fad fad fad\mbreak
   
   %68
   red red red red mi mi mi mi red red red red
   mi mi mi mi si si si si si si si si
   mi8 mi mi mi mi mi
   
   %71
   mi8 mi mi mi mi mi\mbreak
   red red red red red red
   red red red red red red
   
   %74
   mi16 mi si si mi mi sold sold mi mi si si
   mi mi si si mi mi sold sold mi mi sold sold\mbreak
   mi mi dod dod mi mi la la mi mi dod dod
   
   %77
   mi8 dod mi[la] mi la
   fad si, fad'[la] fad si,
   fad' si, fad'[la] fad la\mbreak
   
   %80
   sold mi sold[si] sold mi
   sold mi sold[si] sold mi
   si sold si[mi] si sold
   
   %83
   si' sold si[mi] si sold\mbreak
   mi'16 mi mi mi mi mi mi mi mi mi mi mi
   \repeat unfold 12 {mi}
   
   %86
   mi mi mi mi mi mi mi mi la, la la la\mbreak
   mi' mi mi mi mi mi mi mi la, la la la
   mi' mi si si mi mi si si sold sold mi mi
   
   %89
   si' \repeat unfold 11 {si}
   si si si si si si si si fad fad fad fad\mbreak
   red red red red mi mi mi mi red red red red
   
   %92
   mi'2 r4
   mi2 r4
   mi2.~
   
   %95
   mi4(red4.-+) mi8
   mi2.
 
}

XIIIfgn = \relative do {
   
   r4 r mi,8. mi16
   mi4 r si'8. si16
   si4 r mi8. mi16

   %4
   mi4 si8-. si-. si-. si-.\mbreak
   mi,4 r mi8. mi16
   mi4 r si'8. si16

   %7
   si4 r mi8. mi16
   mi4 si8-. si-. si-. si-.\mbreak
   mi,8 sold4 sold sold8

   %10
   la4 r r
   r8 la16 la la8[la16 la] la8 la16
   la fad8 fad4 fad fad8

   %13
   si4 r r\mbreak
   r8 si16 si si8[si16 si] si8 si16 si
   sold8 mi'16 mi mi4. sold,8
   la4 si si

   %17
   mi,8 sold4 sold sold8
   la4 r r\mbreak
   r8 la16 la la8[la16 la] la8 la16 la

   %20
   fad8 fad4 fad fad8
   si4 r r
   r8 si16 si si8[si16 si] si8 si16 si\mbreak

   %23
   \once\stemUp sold8 si'16 si si8 mi16 mi \once\stemDown mi8. sold,,16
   la4 si2
   mi,4 r r

   %26
   mi2.~
   mi4 r r
   si' r r
   
   %29
   si,2.~\mbreak
   si4 r r
   r mi' mi
   
   %32
   mi sold mi
   la,2.
   sold
   
   %35
   fad4 si2\mbreak
   R2.
   si'~
   
   %38
   si~
   si~
   si~
   
   %41
   si~\mbreak
   si~
   si
   
   %44
   la,
   sold
   fad8. mi16 si'2
   mi8-. \parentSlur (mi-. mi-. mi-. mi-. mi-.)\mbreak
   
   %48
   mi8-. (mi-. mi-. mi-. mi-. mi-.)
   mi mi mi mi mi mi
   mi mi mi mi mi mi
   
   %51
   mi mi16 mi mi8[mi16 mi] mi8 mi16 mi\mbreak
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   
   %54
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   mi mi mi mi mi mi mi mi mi mi mi mi\mbreak
   mi mi mi mi mi mi mi mi mi mi mi mi
   
   %57
   si'2.~
   si
   mi~\mbreak
   
   %60
   mi~
   mi
   mi
   
   %63
   mi16 mi mi mi mi mi mi mi la, la la la\mbreak
   mi' mi mi mi mi mi mi mi la, la la la
   mi' mi mi mi mi mi mi mi mi, mi mi mi
   
   %66
   si' si si si si si si si si si si si
   si si si si si si si si si si si si\mbreak
   si, si si si si si si si si si si si
   
   %69
   si si si si si si si si si si si si
   mi8 mi mi mi mi mi
   mi8 mi mi mi mi mi\mbreak
   
   %72
   mi8 mi mi mi mi mi
   mi8 mi mi mi mi mi
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   
   %75
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi\mbreak
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   
   %78
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi\mbreak
   si'2.~
   
   %81
   si
   mi~
   mi~\mbreak
   
   %84
   mi~
   mi
   mi16 mi mi mi mi mi mi mi la, la la la
   
   %87
   mi' mi mi mi mi mi mi mi la, la la la\mbreak
   mi' mi mi mi mi mi mi mi mi, mi mi mi
   si' si si si si si si si si si si si
   
   %90
   si si si si si si si si si si si si
   si, si si si si si si si si si si si\mbreak
   sold2 r4
   
   %93
   la2 r4
   si2.~
   si
   
   %96
   mi,
   
}

XIIItmpn = \relative do {

   r4 r mi8. mi16
   mi4 r si8. si16
   si4 r mi8. mi16
   
   %4
   mi4 si8-. si-. si-. si-.\mbreak
   mi4 r mi8. \tuplet 3/2 { mi32 mi mi }
   mi4 r si8. \tuplet 3/2 { si32 si si }
   
   %7
   si4 r mi8. \tuplet 3/2 { mi32 mi mi }
   mi4 si8[ si] si8. \tuplet 3/2 { si32 si si }
   mi4 r r
   
   %10
   R2.*5
   r8 mi16 mi mi4 r
   r16 mi mi mi si4. si8
   
   %17
   mi4 r r
   R2.*5
   r8 mi16 mi mi8[mi16 mi] mi4
   
   %24
   r16 mi mi mi si4. \tuplet 3/2 { si16 si si }
   mi4 r r
   R2.*21
   
   %47
   mi8-. mi-. mi-. mi-. mi-. mi-.\mbreak
   mi [mi mi mi] mi8.\tuplet 3/2 { mi32 mi mi }\mbreak
   mi8 mi mi mi mi mi
   
   %50
   mi8 [mi mi mi] mi8.\tuplet 3/2 { mi32 mi mi }
   mi8 mi16 mi mi8[mi16 mi] mi8. \tuplet 3/2 { mi32 mi mi }\mbreak
   mi8 mi16 mi mi8[mi16 mi] mi8. \tuplet 3/2 { mi32 mi mi }
   
   %53
   mi8. \tuplet 3/2 { mi32 mi mi } mi8. \tuplet 3/2 { mi32 mi mi } mi8. \tuplet 3/2 { mi32 mi mi }
   mi8. \tuplet 3/2 { mi32 mi mi } mi8. \tuplet 3/2 { mi32 mi mi } mi8. \tuplet 3/2 { mi32 mi mi }
   \repeat unfold 24 {mi16}
   
   %57
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   
   %60
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   
   %63
   \repeat unfold 24 {mi32}\mbreak  
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   
   %66
   \repeat unfold 24 {si32}
   \repeat unfold 24 {si32}
   \repeat unfold 24 {si32}
   
   %69
   \repeat unfold 24 {si32}
   mi8-. mi-. mi-. mi-. mi-. mi-.
   mi [mi mi mi] mi8. \tuplet 3/2 { r32 si si }\mbreak
   
   %72
   mi8 mi mi mi mi mi
   mi [mi mi mi] mi8.\tuplet 3/2 { mi32 mi mi }
   mi8 mi16 mi mi8[mi16 mi] mi8. \tuplet 3/2 { mi32 mi mi }
   
   %75
   mi8 mi16 mi mi8[mi16 mi] mi8. \tuplet 3/2 { mi32 mi mi }\mbreak
   mi8. \tuplet 3/2 { mi32 mi mi } mi8. \tuplet 3/2 { mi32 mi mi } mi8. \tuplet 3/2 { mi32 mi mi }
   mi8. \tuplet 3/2 { mi32 mi mi } mi8. \tuplet 3/2 { mi32 mi mi } mi8. \tuplet 3/2 { mi32 mi mi }
   
   %78
   \repeat unfold 24 {mi16}
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   
   %82
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   
   %85
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {mi32}
   
   %88
   \repeat unfold 24 {mi32}
   \repeat unfold 24 {si32}
   \repeat unfold 24 {si32}
   
   %91
   \repeat unfold 24 {si32}
   mi4 r r
   mi r r8 mi16 mi
   
   %94
   si2~si8 si16 si
   si2~si8 \tuplet 3/2 { si16 si si }
   mi2.
   
}

XIIIbcn = \relative do {

   r4 r mi,8. mi16
   mi4 r si'8. si16
   si4 r mi8. mi16

   %4
   mi4 si8-. si-. si-. si-.\mbreak
   mi,4 r mi8. mi16
   mi4 r si'8. si16

   %7
   si4 r mi8. mi16
   mi4 si8-. si-. si-. si-.\mbreak
   mi,8 sold4 sold sold8

   %10
   la4 r r
   r8 la16 la la8[la16 la] la8 la16
   la fad8 fad4 fad fad8

   %13
   si4 r r\mbreak
   r8 si16 si si8[si16 si] si8 si16 si
   sold8 mi'16 mi mi4. sold,8
   la4 si si

   %17
   mi,8 sold4 sold sold8
   la4 r r\mbreak
   r8 la16 la la8[la16 la] la8 la16 la

   %20
   fad8 fad4 fad fad8
   si4 r r
   r8 si16 si si8[si16 si] si8 si16 si\mbreak

   %23
   \once\stemUp sold8 si'16 si si8 mi16 mi \once\stemDown mi8. sold,,16
   la4 si2
   mi,4 r r

   %26
   R2.*11
   mi2.~
   mi4 r r

   %39
   si' r r
   si2.
   si4 r r\mbreak
   
   %42
   mi mi mi
   mi2 mi4
   la,2.
   
   %45
   sold
   fad8. mi16 si'2
   mi8-. \parentSlur (mi-. mi-. mi-. mi-. mi-.)\mbreak
   
   %48
   mi8-. (mi-. mi-. mi-. mi-. mi-.)
   mi mi mi mi mi mi
   mi mi mi mi mi mi
   
   %51
   mi mi16 mi mi8[mi16 mi] mi8 mi16 mi\mbreak
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   
   %54
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   mi mi mi mi mi mi mi mi mi mi mi mi\mbreak
   mi mi mi mi mi mi mi mi mi mi mi mi
   
   %57
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi\mbreak
   
   %60
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi
   
   %63
   mi' mi mi mi mi mi mi mi la, la la la\mbreak
   mi' mi mi mi mi mi mi mi la, la la la
   mi' mi mi mi mi mi mi mi mi, mi mi mi
   
   %66
   si' si si si si si si si si si si si
   si si si si si si si si si si si si\mbreak
   si, si si si si si si si si si si si
   
   %69
   si si si si si si si si si si si si
   mi8 mi mi mi mi mi
   mi8 mi mi mi mi mi\mbreak
   
   %72
   mi8 mi mi mi mi mi
   mi8 mi mi mi mi mi
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   
   %75
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi\mbreak
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   mi8 mi16 mi mi8[mi16 mi] mi8 mi16 mi
   
   %78
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi\mbreak
   mi mi mi mi mi mi mi mi mi mi mi mi
   
   %81
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi
   
   %84
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi' mi mi mi mi mi mi mi la, la la la
   
   %87
   mi' mi mi mi mi mi mi mi la, la la la\mbreak
   mi' mi mi mi mi mi mi mi mi, mi mi mi
   si' si si si si si si si si si si si
   
   %90
   si si si si si si si si si si si si
   si, si si si si si si si si si si si\mbreak
   sold2 r4
   
   %93
   la2 r4
   si2.~
   <si si,>2.
   
   %96
   mi,

}

XIIIbfn = \figuremode {

   \bassFigureExtendersOn
   \bassFigureStaffAlignmentUp



}

forma = {

   \once\override Staff.TimeSignature.transparent = ##t
   \time 3/4
   \once\override Staff.TimeSignature.style = #'single-digit
   \tempo 2 = 53
   s2.*96
   \bar "|."

}


XIIIvlI = {
   \XIIIglobal
   %\notypeset
   <<\XIIIvlIn \forma>>
}


XIIIvlII = {
   \XIIIglobal
   <<\XIIIvlIIn \forma>>
}


XIIIhbI = {
   \XIIIglobal
   <<\XIIIhbIn \forma>>
}


XIIIhbII = {
   \XIIIglobal
   <<\XIIIhbIIn \forma>>
}


XIIItp = {
   \XIIIglobal
   <<\XIIItpn \forma>>
}


XIIIcrI = {
   \XIIIglobal
   <<\XIIIcrIn \forma>>
}


XIIIcrII = {
   \XIIIglobal
   <<\XIIIcrIIn \forma>>
}


XIIIhcI = {
   \XIIIglobal
   \clef alto
   <<\XIIIhcIn \forma>>
}


XIIIfg = {
   \XIIIglobal
   \clef bass
   <<\XIIIfgn \forma>>
}


XIIItmp = {
   \XIIIglobal
   \clef bass
   <<\XIIItmpn \forma>>
}

XIIIbc = {
   \XIIIglobal
   \clef bass
   <<\XIIIbcn \forma \XIIIbfn>>
   \typeset
}
#(set-global-staff-size 17)



\pointAndClickOff

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #2

    }

    \header {
        title = \markup\smaller{Simphonie du Festin Royal - Troisième Suite}
        composer = \markup \center-column{"  ""F. Francœur arr. (1698-1787)"}
    }

    \markup \huge {[1.] Marche de M. Rameau}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \IvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \IvlII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"I.er"\vspace #-0.2 "Haut[bois]"}
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb1"
                        \IhbI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.me"\vspace #-0.2"Haut[bois]"}
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb2"
                        \IhbII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Cors [in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr"
                        \IcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Alto"}
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al"
                        \Ihc
                        \key mi\major
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \Ifg
                        \key mi\major
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = \markup \center-column{"Timb[alles]"}
                        \set Staff.midiInstrument = #"timpani"
                        \set Staff.shortInstrumentName = "tmp"
                        \Itmp
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Basses"}
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \Ibc
                        \key mi\major
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[2.] Air lent de M. de Bury}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \IIvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \IIvlII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.er"\vspace #-0.2"Clarinette"}
                        \set Staff.midiInstrument = #"clarinet"
                        \set Staff.shortInstrumentName = "cl1"
                        \IIclI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.me"\vspace #-0.2"Clarinette"}
                        \set Staff.midiInstrument = #"clarinet"
                        \set Staff.shortInstrumentName = "cl2"
                        \IIclII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.er Cor"\vspace #-0.2"[in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr1"
                        \IIcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column {"2.me Cor"\vspace #-0.2"[in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr2"
                        \IIcrII
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \IIfg
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Basses"}
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \IIbc
                        \key mi\major
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[3.] Rondeau léger }

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \IIIvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \IIIvlII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.er"\vspace #-0.2"Clarinette"}
                        \set Staff.midiInstrument = #"clarinet"
                        \set Staff.shortInstrumentName = "cl1"
                        \IIIclI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.me"\vspace #-0.2"Clarinette"}
                        \set Staff.midiInstrument = #"clarinet"
                        \set Staff.shortInstrumentName = "cl2"
                        \IIIclII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.er Cor"\vspace #-0.2"[in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr1"
                        \IIIcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column {"2.me Cor"\vspace #-0.2"[in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr2"
                        \IIIcrII
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = \markup \center-column{"Alto"}
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al"
                        \IIIhc
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Basses"}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bc"
                        \IIIbc
                        \key mi\major
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[4.] Rondeau gracieux de M. Rameau }

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \IVvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \IVvlII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.er"\vspace #-0.2"Haut[bois]"}
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb1"
                        \IVhbI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.me"\vspace #-0.2"Haut[bois]"}
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb2"
                        \IVhbII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.er Cor"\vspace #-0.2"[in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr1"
                        \IVcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column {"2.me Cor"\vspace #-0.2"[in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr2"
                        \IVcrII
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \IVfg
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Basses"}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bc"
                        \IVbc
                        \key mi\major
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \markup \huge {[5.] Air vif de M. Rameau}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{[Viol[ons]}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \VvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"[1.er] Alto"}
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al1"
                        \VhcI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"[2.e] Alto"}
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al2"
                        \VhcII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"[Basses]"}
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \Vbc
                        \key mi\major
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[6.] Rondeau gracieux de M. Ferrand }

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Flutes et"\vspace #-0.2"I.es Viol[ons]"}
                        \set Staff.midiInstrument = #"flute"
                        \set Staff.shortInstrumentName = "vl1"
                        \VIvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.e Viol[on]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \VIvlII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{B[as]sons}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "fg"
                        \VIfg
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{Basses}
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \VIbc
                        \key mi\major
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper {

        systems-per-page = #2

    }

    \markup \huge {[7.] Contredanse vive de la feste de Flore de M. Trial}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Cors [in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr1"
                        \VIIcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Cors [in Mi]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr2"
                        \VIIcrII
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"P[etites]"\vspace #-0.2"Flûtes"}
                        \set Staff.midiInstrument = #"flute"
                        \set Staff.shortInstrumentName = "fl1"
                        \VIIflI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"P[etites]"\vspace #-0.2"Flûtes"}
                        \set Staff.midiInstrument = #"flute"
                        \set Staff.shortInstrumentName = "fl2"
                        \VIIflII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \VIIvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \VIIvlII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Alto"}
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al"
                        \VIIhc
                        \key mi\major
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \VIIfg
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Basses"}
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \VIIbc
                        \key mi\major
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[Contredanse d M. Trial] Mineur}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"cr1"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr1"
                        \VIIIcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"cr2"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr2"
                        \VIIIcrII
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"fl1"}
                        \set Staff.midiInstrument = #"flute"
                        \set Staff.shortInstrumentName = "fl1"
                        \VIIIflI
                        \key mi\minor
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"fl2"}
                        \set Staff.midiInstrument = #"flute"
                        \set Staff.shortInstrumentName = "fl2"
                        \VIIIflII
                        \key mi\minor
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"vl1"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \VIIIvlI
                        \key mi\minor
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{vl2}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \VIIIvlII
                        \key mi\minor
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"al"}
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al"
                        \VIIIhc
                        \key mi\minor
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = \markup \center-column{"bs"}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \VIIIfg
                        \key mi\minor
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"bc"}
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \VIIIbc
                        \key mi\minor
                    >>
                >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[8.] Chaconne de M. Francœur}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Cors [I]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr1"
                        \IXcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Cors [II]"}
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr2"
                        \IXcrII
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Flûtes"}
                        \set Staff.midiInstrument = #"flute"
                        \set Staff.shortInstrumentName = "fl"
                        \IXflI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Hautbois"}
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb"
                        \IXhbI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"1.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \IXvlI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"2.es"\vspace #-0.2"Viol[ons]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \IXvlII
                    >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\major\override MensuralStaff.TimeSignature.style = #'numbered \time 3/4\override Staff.TimeSignature.style = #'single-digit  r4^\markup \right-align"Alto [I]"  si' si'}
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \IXhcI
                \set Staff.shortInstrumentName = "al1"
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key mi\major\override MensuralStaff.TimeSignature.style = #'numbered \time 3/4\override Staff.TimeSignature.style = #'single-digit  r4^\markup \right-align"Alto [II]"  si mi'}
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IXhcII
                \set Staff.shortInstrumentName = "al2"
            >>

                    \new Staff  <<
                        \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \IXfg
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Basses"}
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \IXbc
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

}


\bookpart {

    \paper {

        systems-per-page = #4

    }

    \markup \huge {[9.] Chaconne de M. Berton}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{1.es Viol[ons]}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \XvlI
                        \key mi\minor
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{2.es Viol[ons]}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \XvlII
                        \key mi\minor
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Alto"}
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al1"
                        \XhcI
                        \key mi\minor
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Basses et"\vspace #-0.2"Bassons"}
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \Xbc
                        \key mi\minor
                    >>
                >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}


\bookpart {

    \paper {

        systems-per-page = #2

    }

    \markup \huge {Majeur}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = "vl1"
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \XIvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "vl2"
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \XIvlII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "hb"
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb"
                        \XIhbI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "tp"
                        \set Staff.midiInstrument = #"trumpet"
                        \set Staff.shortInstrumentName = "tp"
                        \XItp
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "cr1"
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr1"
                        \XIcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "cr2"
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr2"
                        \XIcrII
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "al"
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al"
                        \XIhcI
                        \key mi\major
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = "bs"
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \XIfg
                        \key mi\major
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = "tmp"
                        \set Staff.midiInstrument = #"timpani"
                        \set Staff.shortInstrumentName = "tmp"
                        \XItmp
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "bc"
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \XIbc
                        \key mi\major
                    >>
                >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

}


\bookpart {

    \paper {

        systems-per-page = #3

    }

    \markup \huge {Mineur}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = "vl1"
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \XIIvlI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "vl2"
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \XIIvlII
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "hb1"
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb1"
                        \XIIhbI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "hb2"
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb2"
                        \XIIhbII
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "al"
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al"
                        \XIIhcI
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = "bs"
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \XIIfg
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "bc"
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \XIIbc
                    >>
                >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}


\bookpart {

    \paper {

        systems-per-page = #2

    }

    \markup \huge {Majeur}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = "vl1"
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \XIIIvlI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "vl2"
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \XIIIvlII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "hb1"
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb1"
                        \XIIIhbI
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "hb2"
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "hb2"
                        \XIIIhbII
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "tp"
                        \set Staff.midiInstrument = #"trumpet"
                        \set Staff.shortInstrumentName = "tp"
                        \XIIItp
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "cr1"
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr1"
                        \XIIIcrI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "cr2"
                        \set Staff.midiInstrument = #"french horn"
                        \set Staff.shortInstrumentName = "cr2"
                        \XIIIcrII
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "al"
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.shortInstrumentName = "al"
                        \XIIIhcI
                        \key mi\major
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = "bs"
                        \set Staff.midiInstrument = #"bassoon"
                        \set Staff.shortInstrumentName = "bs"
                        \XIIIfg
                        \key mi\major
                    >>

                    \new Staff  <<
                        \set Staff.instrumentName = "tmp"
                        \set Staff.midiInstrument = #"timpani"
                        \set Staff.shortInstrumentName = "tmp"
                        \XIIItmp
                        \key mi\major
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = "bc"
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.shortInstrumentName = "bc"
                        \XIIIbc
                        \key mi\major
                    >>
                >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

}

