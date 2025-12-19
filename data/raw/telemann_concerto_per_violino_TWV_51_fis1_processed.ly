\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

    s4.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza]"}
    \bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

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

Iglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

Ivln = \relative do'' {

    r2 dod dod
    fad1.~
    fad2 fad la4 sold

    %4
    sold1.~
    sold2 si4(sold) mid(dod)
    la'2 dod, dod

    %7
    mi?1.~
    mi2 sol fad
    re1.~\mbreak

    %10
    re2 si'4(re,) re(dod)
    dod1.~
    dod2. fad8(mi) re(dod) si(la)

    %13
    dod2 si2. la4
    la2 mi' mi
    mid1 r2

    %16
    r fad la
    sid, sold' sold~\mbreak
    sold fad fad

    %19
    fad mi4 fad sold la
    fad mi red2. dod4
    dod2 mi dod

    %22
    lad2. dod4 si dod
    re2 fad4 re dod si
    sold'2. la4 si sold

    %25
    mid2 dod' dod\mbreak
    dod1.~
    dod2 dod, fad~

    %28
    fad4 sold sold2. fad4
    fad2 re4 dod re2
    r sold dod,

    %31
    r fad si,
    si sid2. dod4
    dod1.\fermata

}

IvlIn =  \relative do'' {

    la1 r2
    r la\parenthesize \p la
    la1.

    %4
    r2 re re
    dod1 r2
    dod1 r2

    %7
    r2 la la
    dod1 r2
    r2 si si\mbreak

    %10
    si1.
    r2 la la
    la r r

    %13
    la sold2. la4
    la1.
    r2 si si

    %16
    la1 r2
    sold sold dod\mbreak
    dod r r

    %19
    red dod dod
    dod sid2. dod4
    dod2 r r

    %22
    r dod dod
    si! r r
    r re re

    %25
    dod r r\mbreak
    r dod dod
    dod r re

    %28
    re dod dod
    dod r r
    dod r r

    %31
    si r r
    r fad1
    sold1\fermata r2

}

IvlIIn = \relative do'' {

    fad,1.
    r2 fad\p fad
    fad1.

    %4
    r2 si si
    si1 r2
    la1 r2

    %7
    r2 la la
    fad r r
    r fad fad\mbreak

    %10
    sold1 r2
    r mi mi
    fad r r

    %13
    mi mi1
    mi1 r2
    r2 sold mid

    %16
    fad r r
    red mi mi\mbreak
    mi r r

    %19
    sold sold sold
    la red, sold
    sold r r

    %22
    r lad lad
    fad r r
    r si si

    %25
    sold r r\mbreak
    r sold sold
    la r la

    %28
    si sold sold
    la r r
    sold r r

    %31
    fad r r
    r fad1
    mid1\fermata r2

}

Ivlan =  \relative do' {

    dod1.
    r2 dod\p dod
    dod1.

    %4
    r2 la la
    sold'1 r2
    fad1 r2

    %7
    r mi mi
    mi1 r2
    r2 si si

    %10
    si1.
    r2 dod dod
    re1 r2

    %13
    dod mi1
    dod r2
    r si si

    %16
    dod1 r2
    sid2 dod dod
    dod1.\mbreak

    %19
    sold2 sold dod
    dod sold red'
    mi r r

    %22
    r fad fad
    re? r r
    r sold, sold

    %25
    sold r r
    r sold' sold\mbreak
    fad r fad

    %28
    fad mid mid
    fad r r
    dod r r

    %31
    fad, r r
    r red'1
    sold,1.\fermata

}

Icbn = \relative do {

    fad,1.
    r2 fad'\p fad
    re1.

    %4
    r2 si' si
    mid,1.
    fad

    %7
    r2 dod' dod
    lad1.
    r2 si si

    %10
    mi,1.
    r2 la la
    re,1.

    %13
    mi2 mi,1
    la r2
    r sold' sold

    %16
    fad1.
    fad2 mi re\mbreak
    la r r

    %19
    sid dod dod
    fad, sold1
    dod2 r r

    %22
    r fad fad
    si,1 r2
    r2 si si

    %25
    dod1.\mbreak
    r2 mid mid
    fad r re

    %28
    si dod1
    fad2 r r
    mi r r

    %31
    re r r
    r red1
    dod1.\fermata

}

Ibcn = \relative do {

    fad,1.
    r2 fad'\p fad
    re1 r2

    %4
    r2 si' si
    mid,1.
    fad

    %7
    r2 dod' dod
    lad1.
    r2 si si

    %10
    mi,1.
    r2 la la
    re,1.

    %13
    mi2 mi,1
    la r2
    r sold' sold

    %16
    fad1.
    fad2 mi re\mbreak
    la' r r

    %19
    sid, dod dod
    fad, sold1
    dod2 r r

    %22
    r fad fad
    si,1.
    r2 si si

    %25
    dod1.\mbreak
    r2 mid mid
    fad r re

    %28
    si dod1
    fad2 r r
    mi r r

    %31
    re r r
    r red1
    dod1.\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*3
    s2 <6>1
    <6 5>1.
    s
    s2 <6>1
    <6 5>1.
    s
    <7 _+>
    s
    s
    <6 4>2 <5 3> s
    s1.
    s2 <6\\>1
    s1.
    <4\+ 2>2 <6> <2>
    <7> r r
    s <6 5>1
    s2 <_+>1
    s1.
    s2 <_+>1
    <_->1.
    s
    s
    s2 <6 5>1
    s1.
    s2 <_+>1
    s1.
    <6>
    <6>
    s2 <6\\>

}

forma = {

    \key fad\minor
    \time 3/2
    \tempo 2 = 60
    s1.*33
    \bar"|."

}

Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>

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

Icb = {
    \Iglobal
    \clef bass
    <<\Icbn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}

IIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IIvln = \relative do'' {

    r8 fad, dod'[dod] dod si16 la si8 [si]
    si la16 sold la8 [si16 la] sold8 [sold] sold dod
    la fad r dod' sold' sold sold [fad16 sold]

    %4
    la8 la la [sold16 la] si8[mi,] r mi,
    dod'16 [si dod re] dod mi re dod si la si dod si[re dod si]
    la[sold la si] la dod si la sold8 la sold8.[fad16]

    %7
    fad8 dod' fad[dod] r dod sold'[dod,]
    r dod la'[dod,] r dod si'4~
    si8 si la [sold] la4 \parentSlur (sold8.) fad16\mbreak

    %10
    fad4 fad,\solo dod'8.[(re16)] dod8.[(re16)]
    dod8.[(re16)] dod8.[(re16)]dod8.[(si16)] la8.[(sold16)]
    la4 fad r2

    %13
    R1
    r4 fad dod'8.[(re16)] dod8.[(re16)]
    dod8.[(re16)] dod8.[(re16)]\mbreak dod8.[si16] la8. sold16

    %16
    la8[la]<<
        {
            r8 fad' mi[mi] la la
            la [sold16 fad] sold8 sold fad[fad] si si
            si[mi,] la la la[sold16 fad] sold8 sold\mbreak

            %19
            fad[fad] fad fad
        }\\{
            re[re] re dod16 si dod8 [dod]
            si [si] mi mi mi re16 dod re8 [re]
            dod dod dod [si16 la] red8 red mi[ mi] \mbreak
            mi mi red[red]
        }
    >> mi mi, si'\tu [si]
    si la16 sold la8[la] la sold16 fad sold8[la16 sold]
    fad8 fad fad si sold16 mi'\solo sold mi si'[re, dod si]

    %22
    dod si' la sold la[dod, si la] si la' sold fad sold[si, dod si]
    la sold' fad mi red[fad si fad] sold fad mi fad sold[fad sold mi]
    la mi dod la mi[la dod mi] la mi dod la mi[la dod mi]

    %25
    sol fad mi fad sol[fad sol mi]\mbreak fad sol fad mi re[fad mi re]
    dod mi la mi dod[mi la mi] re fad la fad re[fad la fad]
    red fad si fad red[fad si fad] mi sold si sold mi [sold si sold]\mbreak

    %28
    re? mi si' mi, re[mi si' mi,] dod mi si' mi, dod[mi si' mi,]
    dod mi la mi dod[mi la mi] si mi la mi dod[mi la mi]
    re mi si' mi, dod[mi la mi] si mi sold mi dod[mi la mi]\mbreak

    %31
    si mi la mi si[mi sold mi] la8 la, r la\tu
    fad' fad fad[mi16 re] mi8 mi mi[re16 dod]
    re dod re mi re[fad mi re] dod si dod re dod[mi re dod]

    %34
    si8 dod si8. la16 la8 mi' la [la]\mbreak
    la(sold) r4 r8 dod, fad[fad]
    fad mid r4 r8 fad, dod'\solo[dod]

    %37
    dod sid16 dod red8[red] red dod16 red mi8[mi]
    mi red16 mi fad8[fad] fad sold16 la sold[fad mi red]
    mi sold fad mi red[fad mi red]\mbreak dod sid dod red dod[mi red dod]

    %40
    sid8 sold r sold' mi16[sold mi sold] red sold red sold
    dod, sold' dod, sold' sid,[sold' sid, sold'] dod, sold' dod, sold' red[sold red sold]
    mi8 dod r fad re!16 fad re fad dod[fad dod fad]\mbreak

    %43
    si, fad' si, fad' lad,[fad' lad, fad'] si,[fad' si, fad'] dod fad dod fad
    re8 si r mi dod16[mi dod mi] si mi si mi
    la, mi' la, mi' sold,[mi' sold, mi'] la, mi' la, mi' si[mi si mi]

    %46
    dod[la' la, la'] si, la' dod, la' re,[fad la, fad'] re fad dod fad\mbreak
    si, si' dod, si' red,[si' si, si'] mi, sold si, sold' mi[sold re? sold]
    dod, la' si, sold' la,[fad' dod la'] si, sold' dod, la' re,[si' dod, la']

    %49
    si, sold' dod, la' si,[sold' la, fad'] sold,8 mid' fad4~
    fad mid fad8 fad, dod'4
    r2 r8 fad, dod'4\mbreak

    %52
    r2 r8 fad,\tu dod'[dod]
    dod si16 la si8[si] si la16 sold la8[si16 la]
    sold8 sold sold [dod] la fad r dod'\solo

    %55
    la16 dod la dod sold[dod sold dod] fad, dod' fad, dod' mid,[dod' mid, dod']
    fad, dod' fad, dod' sold[dod sold dod] la dod la dod la[dod la dod]\mbreak
    la si la si sold[mi' sold, mi'] fad, mi' fad, mi' fad,[re' fad, re']

    %58
    mi, re' mi, re' mi,[dod' mi, dod'] re,[dod' re, dod'] red, si' red, si'
    mid, si' mid, si' fad[la fad la] si, sold' si, sold' si,[fad' si, fad']
    <<
        {
            mid4 s8 fad sold la sold la

            %61
            mid fad mid fad sold la sold la\mbreak
            mid fad mid fad sold la sold la
            si4
        }\\{
            dod, r8 dod dod dod dod dod
            dod dod dod dod dod dod dod dod\mbreak
            dod dod dod dod dod dod dod dod
            \stemUp \shiftOn sold'4
        }\\{s1*3\stemUp \shiftOnn dod,4}
    >> r8 dod' la sold16 fad dod8[mid]

    %64
    fad4 r8 <<
        {
            fad' sold la sold la
            mid fad mid fad sold la sold la
            mid fad mid fad sold la sold la\mbreak

            %67
            si4
        }\\{
            la,8 si dod si dod
            sold la sold la si dod si dod
            sold la sold la si dod si dod\mbreak
            \stemUp\shiftOn dod4
        }\\{s8 s2 s1*2 \shiftOnn mid,4}
    >> r8 dod' la'[sold16 fad] dod8 mid
    fad dod fad [dod] r dod sold'[dod,]
    r fad, dod'[dod] dod si16 la si8[si]

    %70
    si la16 sold la8[dod] sold' sold sold [fad16 sold]
    la8 la la [sold16 la] si8[mi,] r mi,
    dod'16 [si dod re] dod mi re dod si la si dod si[re dod si]

    %73
    la[sold la si] la dod si la sold8 la sold8.[fad16]
    fad8 dod' fad[dod] r dod sold'[dod,]
    r dod la'[dod,] r dod si'4~

    %76
    si8 si la [sold] la4 (sold8.) fad16
    fad4\fermata r r2

}

IIvlIn =  \relative do'' {

    r8 fad, dod'[dod] dod si16 la si8 [si]
    si la16 sold la8 [si16 la] sold8 [sold] sold dod
    la fad r dod' sold' sold sold [fad16 sold]

    %4
    la8 la la [sold16 la] si8[mi,] r mi,
    dod'16 [si dod re] dod mi re dod si la si dod si[re dod si]
    la[sold la si] la dod si la sold8 la sold8.[fad16]

    %7
    fad8 dod' fad[dod] r dod sold'[dod,]
    r dod la'[dod,] r dod si'4~
    si8 si la [sold] la4 \parentSlur (sold8.) fad16\mbreak

    %10
    fad4 r r2
    R1
    r8 fad, dod'[dod] dod si16 la si8[si]

    %13
    si la16 sold la8[si16 la] sold8 sold sold dod
    la fad r4 r la\p
    sold sold\mbreak r sold

    %16
    fad r r2
    R1*2
    r2 r8 mi si'\f[si]

    %20
    si la16 sold la8[la] la sold16 fad sold8[la16 sold]
    fad8 fad fad si sold mi r4
    R1*9

    %31
    r2 r4 r8 la\parenthesize \f
    fad' fad fad[mi16 re] mi8 mi mi[re16 dod]
    re dod re mi re[fad mi re] dod si dod re dod[mi re dod]

    %34
    si8 dod si8. la16 la4 r8 mi'
    re16 dod re mi re[fad mi re] dod si dod re dod [mi re dod]
    si la si dod si[re dod si] la4 r

    %37
    R1*3
    r8 red sold4 r2
    R1

    %42
    r8 dod, fad4 r2\mbreak
    R1
    r8 si, mi4 r2

    %45
    R1*5
    r2 r4 r8 dod
    si16 la si dod si[re dod si] la4 r8 dod\mbreak

    %52
    si16[la si dod] si[re  dod si] la4 r
    R1
    r2 r8 dod fad4

    %55
    R1*5
    r4 r8 la,\p mid fad mid fad
    sold la sold la mid fad mid fad\mbreak

    %62
    sold la sold la mid fad mid fad
    sold4 r r2
    r4 r8 dod,\p dod dod dod dod

    %65
    dod dod dod dod dod dod dod dod
    dod dod dod dod dod dod dod dod\mbreak
    dod4 r r2

    %68
    r8 dod'\f fad [dod] r dod sold'[dod,]
    r fad, dod'[dod] dod si16 la si8[si]

    %70
    si la16 sold la8[dod] sold' sold sold [fad16 sold]
    la8 la la [sold16 la] si8[mi,] r mi,
    dod'16 [si dod re] dod mi re dod si la si dod si[re dod si]

    %73
    la[sold la si] la dod si la sold8 la sold8.[fad16]
    fad8 dod' fad[dod] r dod sold'[dod,]
    r dod la'[dod,] r dod si'4~

    %76
    si8 si la [sold] la4 (sold8.) fad16
    fad4\fermata r r2

}

IIvlIIn = \relative do'' {

    r4 r8 fad, re'[re] re dod16 si
    dod8 dod fad2 mid4
    r8 dod fad[fad] fad mid16 fad sold8[sold]

    %4
    sold fad16 sold la8[la] la sold16 la si8[si]
    si mi, r la la sold r sold\mbreak
    sold dod, r fad mid fad mid8.[fad16]

    %7
    fad4 r8 dod sold' dod, r dod
    la' dod, r dod sold' dod, r fad
    mid sold fad [fad] fad4 mid8. fad16\mbreak

    %10
    fad4 r r2
    R1
    r4 r8 fad, re'[re] re dod16 si

    %13
    dod8 dod fad2 mid4
    fad r r fad,\p
    sold mid\mbreak r dod

    %16
    dod r r2
    R1*2
    r2 r4 r8 mi\f

    %20
    dod'[dod] dod si16 la si8[si] mi4~
    mi red mi r
    R1*9

    %31
    r2  r8 la, mi'[mi]
    mi re16 dod re8[re] re dod16 si dod8[dod]
    dod fad, r si si[mi,] r la

    %34
    sold la sold8. la16 la4 r8 dod\mbreak
    si16 [la si dod] si re dod si la sold la si la[dod si la]
    sold fad sold la sold[ si la sold] fad4 r

    %37
    R1*3
    r8 sid red4 r2
    R1

    %42
    r8 sold, lad4 r2\mbreak
    R1
    r8 fad sold4 r2

    %45
    R1*5
    r2 r4 r8 la
    sold16 fad sold la sold[si la sold] fad4 r8 la\mbreak

    %52
    sold16 fad sold la sold[si la sold] fad4 r
    R1
    r2 r8 la dod4

    %55
    R1*8
    mid,4 r r2
    r4 r8 dod\p dod dod dod dod

    %65
    dod dod dod dod dod dod dod dod
    dod dod dod dod dod dod dod dod\mbreak
    dod4 r r2

    %68
    r4 r8 dod'\f sold'[dod,] r dod
    la' dod, r fad, re'[re] re dod16 si
    dod8 dod fad fad fad mid16 fad sold8[sold]

    %71
    sold fad16 sold la8[la] la sold16 la si8[si]\mbreak
    si mi, r la la sold r sold
    sold dod, r fad mid fad mid8. fad16

    %74
    fad4 r8 dod sold'[dod,] r dod\mbreak
    la' dod, r dod sold' dod, r fad
    mid sold fad fad fad4 \parentSlur (mid8.) fad16

    %77
    fad4\fermata r r2

}

IIvlan =  \relative do' {

    dod4 fad fad mi
    mi fad re dod
    dod dod si si

    %4
    la dod mi, sold
    la mi' mi dod
    dod dod\mbreak dod8 dod dod4

    %7
    dod r8 dod dod4 r8 dod
    dod4 r8 dod dod4 r8 si
    dod dod dod re dod4 dod

    %10
    dod r r2
    R1
    r4 fad fad mi

    %13
    mi fad \mbreak re dod
    dod r r dod
    dod dod r dod

    %16
    la r r2
    R1*2
    r2 r4 mi'

    %20
    mi red mi mi
    dod si si r
    R1*9

    %31
    r2 r4 la'
    la sold la la
    fad mi mi mi

    %34
    mi8 mi mi4 mi r8 dod'
    si[si] si dod16 si la8[la] la si16 la
    sold8[sold] dod, dod fad4 r\mbreak

    %37
    R1*3
    r8 sold sold4 r2
    R1

    %42
    r8 mi fad4 r2
    R1
    r8 re mi4 r2

    %45
    R1*5
    r2 r4 r8 dod
    re4 sold,8 dod dod4 r8 dod

    %52
    re4 sold,8 dod\mbreak dod4 r
    R1
    r2 r8 fad la4

    %55
    R1*8
    dod,4 r r2
    R1*3

    %67
    sold4 r r2
    r4 r8 dod dod4 r8 dod
    dod4 fad fad mi\mbreak

    %70
    mi fad sold mid
    fad fad si, mi
    mi mi mi dod

    %73
    dod dod dod8 dod dod4
    dod r8 dod dod4 r8 dod
    dod4 r8 dod dod4 r8 si

    %76
    dod8 dod dod re dod4 dod
    dod\fermata r r2

}

IIcbn = \relative do {

    fad4 la si sold
    la re si dod
    fad, la sold dod,

    %4
    fad fad mi mi
    fad la, mi' mid\mbreak
    fad fad, dod'8 fad dod4

    %7
    fad, r8 fad' mid4 r8 mid
    fad4 r8 fad dod4 r8 re
    dod[mid] fad si dod si dod dod,\mbreak

    %10
    fad,4 r r2
    R1
    r4 la si sold

    %13
    la re si dod
    fad, r r2
    R1*4

    %19
    r2 r4 sold'
    la fad sold dod
    la si mi, r

    %22
    R1*9

    %31
    r2 r4 dod
    re si dod la
    si sold la la'

    %34
    mi8 la, mi'[mi,] la4 r\mbreak
    R1*15
    r2 r4 r8 fad'
    si,4 dod fad, r8 fad'\mbreak

    %52
    si,4 dod fad, r
    R1*15
    r4 r8 fad' mid4 r8 mid

    %69
    fad4 la si sold
    la la sold dod,
    fad fad mi mi\mbreak

    %72
    la la, mi' mid
    fad fad, dod'8 fad dod4
    fad, r8 fad' mid4 r8 mid\mbreak

    %75
    fad4 r8 fad dod4 r8 re
    dod8 mid fad si dod si dod dod,
    fad,4\fermata r r2

}

IIbcn = \relative do {

    fad4 la si sold
    la re si dod
    fad, la sold dod,

    %4
    fad fad mi mi
    fad la, mi' mid\mbreak
    fad fad, dod'8 fad dod4

    %7
    fad, r8 fad' mid4 r8 mid
    fad4 r8 fad dod4 r8 re
    dod[mid] fad si dod si dod dod,\mbreak

    %10
    fad,4 r r fad'
    mid dod r mid
    fad la, si sold

    %13
    la re si dod
    fad, r r fad'
    mid dod\mbreak r mid

    %16
    fad re la' la,
    mi' mi si' sold
    la fad si mi,\mbreak

    %19
    la, si mi sold
    la fad sold dod
    la si mi, r

    %22
    la r\mbreak mi r
    fad si, mi r
    dod r dod r

    %25
    la la\mbreak re si
    la r re r
    si r mi r\mbreak

    %28
    sold r la r
    la, r mi' mi
    mi mi mi mi\mbreak

    %31
    mi mi la, dod
    re si dod la
    si sold la la'

    %34
    mi8 la, mi'[mi,] la4 r\mbreak
    R1
    r2 r4 r8 fad'

    %37
    sold4 sid, dod dod'
    si si, mi sid
    dod sold'\mbreak la fad

    %40
    sold r8 sold dod4 si!
    dod sold mi sid
    dod r8 lad' si4 lad\mbreak

    %43
    si fad re lad
    si r8 sold' la4 sold
    la mi dod sold

    %46
    la r re r\mbreak
    red r mi r
    la, r si r

    %49
    si r dod r8 la'
    re si dod [dod,] fad4 r8 fad
    si,4 dod fad, r8 fad'\mbreak

    %52
    si,4 dod fad, r8 fad'
    re'[re] re dod16 si dod8[dod,] fad4~
    fad mid fad r

    %55
    fad mid fad dod
    la mid fad fad'\mbreak
    red mi la, si

    %58
    sold lad si si
    dod re si re
    dod r r2

    %61
    R1*2
    dod4 r8 mid fad si dod dod,
    fad4 r r2

    %65
    R1*2\mbreak
    dod4 r8 mid fad si dod dod,
    fad,4 r8 fad' mid4 r8 mid

    %69
    fad4 la si sold
    la la sold dod,
    fad fad mi mi\mbreak

    %72
    la la, mi' mid
    fad fad, dod'8 fad dod4
    fad, r8 fad' mid4 r8 mid\mbreak

    %75
    fad4 r8 fad dod4 r8 re
    dod8 mid fad si dod si dod dod,
    fad,4\fermata r r2

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> s <6 5>
    s s <6 5> <_+>
    s <6> <7> <_+>
    s s <5 4> <8>8 <5>
    s4 s <5 4> <8>8 <5>
    s2 <_+>
    s <6>
    s <_+>
    <7 _+>1
    s
    <6>2 s4 <6>
    s <6> s <5>
    s s <6 5> <_+>
    s1
    <6>4 <_+> s <6>
    s2 <5 4>
    <5 4> <5 4>4 <6 5>
    s2 <7 _+>
    <6 5>4 <_+> s <6>
    s <6\\> <6> <6>
    <6 5> <_+> s2
    s <5 4>8 <3> s4
    <7 _+>1
    <6>2 <6>
    <7->4 <5> s <6\\>
    s1
    <_+>
    <6>
    s2 s4 <6 4>
    <5 3> <6 4> <5 3> <6 4>
    <5 3> <6 4> s2
    s4 <6> <6> s
    s <6 5> s2
    s1*3
    <5\+ 4>4 <6> s2
    <5\+ 4>2 s4 <6>
    s <_+> s <6\\>
    <_+>4 s8 <_+>  s4 <6>
    s <_+> <6> <6>
    s4 s8 <6> <_->4 <6>
    s <_+> <6> <6>
    s1
    s2 <6>4 <6>
    s1
    <6>
    s
    s2 <_+>4 s8 <6>
    s4 <_+> s2
    <6 5>4 <_+> s2
    <6 5>4 <_+> s2
    <7>4 <6> <7 _+> s
    <4 2> <6 5> s2
    s4 <6> s <_+>
    <6> <6> s2
    <6 5> <6 5>4 <_->
    <6 5> <6 5> <5 9> <8 _+>
    s s <6> <6>
    <_+>1
    s1*6
    <_+>4 s8 <6> s4 s8 <_+>
    s1
    s4 <6> s <6 5>
    <5> <6> <7> <_+>
    s s <5 4> <8>
    s s <5 4>8 <3> <6 5>4
    s s <_+> <_+>
    s2 <6>
    s <_+>4 s8 <6>
    s2 <6 4>4 <5 _+>

}

forma = {

    \key fad\minor
    \time 2/2
    \tempo 2 = 60
    s1*77
    \bar"|."

}

IIvl = {
    \IIglobal
    \notypeset
    <<\IIvln \forma>>

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

IIcb = {
    \IIglobal
    \clef bass
    <<\IIcbn \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IIIvln = \relative do'' {

    <<
        {
            la'8 mi dod la mi4 s
            la'8 fad re la re,4 s
            mi8 la dod mi red si' fad[red]

            %4
            si red fad[si]
        }\\{
            dod, la mi dod la4 r
            re'8 la fad re sold,4 r
            la8 dod mi la fad[red'] si fad
            red[fad] si red
        }
    >> sol fad16 mi mi4~
    mi red8. mi16 <<
        {
            mi8 si' sold[mi]
            si4
        }\\{
            r8 mi si sold
            mi4
        }
    >> r r8 <<
        {
            la la[la]

            %7
            la4 r8 fad la re fad[la,]
            re fad la[fad]
        }\\{
            sol,16 fad sol[fad sol fad]
            fad4 s8 la, re[fad] re' re,
            fad la re la
        }
    >> <<{re fad16 mi fad[mi fad mi]
    mi8 si'16 mi, si'[mi, si' mi,] mi8[la16 mi] la mi la mi}\\{fad,8 re' re[re]
                                                               re8 re re[re] dod dod16 la dod[la dod la]}>>

    %10
    <do red,>2\mbreak r8 <<
        {
            si si[si]
            si re16 dod]
        }\\{
            la16 sold! la[sold la sold]
            sold4
        }
    >> do4. do16 si si8.[la16]
    la2\fermata r

}

IIIvlIn =  \relative do'' {

    mi,4 r mi8 mi mi mi
    fad4 r re8 re re re
    dod4 r si' r
    fad r mi r8 fad
    sol fad fad[si] sold4 r\mbreak
    sold8 sold sold sold  la4 r
    re,8 fad la re fad la, re[fad]
    la re, fad la la,4 r
    si r la r
    do2\mbreak r
    re4 r8 do do[do16 si] si8. la16
    la2\fermata r

}

IIIvlIIn = \relative do'' {

    dod,4 r dod8 dod dod dod
    re4 r si8 si si si
    la4 r fad' r

    %4
    red r mi r8 mi
    mi8 mi si fad' mi4 r
    mi8 mi mi mi mi4 r

    %7
    re r8 la' la4 r8 re
    re4 r8 fad, fad4 r
    sold r fad r

    %10
    la2\mbreak  r
    sold4 r8 la la4 sold
    mi2\fermopz r

}

IIIvlan =  \relative do' {

    la4 r la8 la la la
    la4 r sold8 sold sold sold
    mi4 r red' r

    %4
    si r dod r8 dod\mbreak
    si si si si si4 r
    si8 si si si la4 r

    %7
    la r8 fad' fad4 r8 la
    la4 r8 re, re4 r
    re r la r

    %10
    red2 r\mbreak
    mi4 r8 mi fad4 si,8 mi
    dod2\fermata r

}

IIIcbn = \relative do {

    la4 r la8 la la la
    la4 r la8 la la la
    la4 r la' r

    %4
    la, r lad r8 lad
    si si si si mi4 r\mbreak
    re8 re re re dod4 r

    %7
    re r8 re re4 r8 re
    re4 r8 re re4 r
    sold4 r la r

    %10
    fad2 r
    mi4 r8 la re,4 mi
    la,2\fermata r

}

IIIbcn = \relative do {

    la4 r la8 la la la
    la4 r la8 la la la
    la4 r la' r

    %4
    la, r lad r8 lad
    si si si si mi4 r\mbreak
    re8 re re re dod4 r

    %7
    re r8 re re4 r8 re
    re4 r8 re re4 r
    sold4 r la r

    %10
    fad2 r
    mi4 r8 la re,4 mi
    la,2\fermata r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6 4>2 <6 4 2>
    <8 5 3> <4\+ 2>
    <4\+ 2> <7- 5>4 s8 <6 5>
    <6 4\+>4 <5 _+> <8 _+>2
    <4\+ 2>2 <6>
    s1*2
    <6 5>1
    <6\\>
    <7- _+>4 s8 <_-> <7->2

}

forma = {

    \key fad\minor
    \time 4/4
    \tempo 4 = 40
    s1*12
    \bar"|."

}

IIIvl = {
    \IIIglobal
    \notypeset
    <<\IIIvln \forma>>

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

IIIcb = {
    \IIIglobal
    \clef bass
    <<\IIIcbn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}

IVglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \con
}

IVvln = \relative do'' {

    r4 la la
    si dod dod
    fad, dod'2~

    %4
    dod4 sid2
    dod4 dod8 si! dod re
    si la sold la si dod

    %7
    la si dod red mi fad
    red dod sid red sold fad
    mi red dod mi la mi\mbreak

    %10
    fad mi re? dod re mi
    dod4 fad2~
    fad4 mid2

    %13
    fad4. mi!8 re dod
    si la sold4. fad8
    \tuplet 3/2 {
        fad'\solo(sold la) fad[(sold la)] fad (sold la) ]

        %16
        sold(la si) sold[(la si)] sold(la si)
        la(sold la) fad[(sold la)] sold (la fad)
    }
    mid4 mid mid\mbreak

    %19
    fad sold sold
    dod, fad8 mi re dod
    si la sold4. fad8

    %22
    \tuplet 3/2 {
        fad'\solo(sold la) fad(sold la) fad(sold la)
        sold(la si) sold(la si) sold(la si)
        la(sold la) fad(sold la) sold(la fad)

        %25
        sold(fad sold) mi (fad sol) fad (sol mi)
        fad(mi fad) re(mi fad) mi(fad re)\mbreak
        mi(fad re) re(mi dod) si(dod la)

        %28
        re(dod re) si(dod re) \senza dod re si
        \con dod(si la) re(dod si) mi(re dod)
        fad(mi fad) re(mi fad) la,(re fad)

        %31
        sold(fad sold) mi(fad sold) si,(mi sold)
        la (sold la) fad (sold la) dod, (mi la)\mbreak
        si(la si) sold(la si) re,(sold si)

        %34
        dod,(mi la) dod, (mi la) si, (la' sold)
    }
    la,4 la'2\tu~
    la4 sold2~

    %37
    sold4 fad2~
    fad4 mid2
    fad4 r  r

    %40
    R2.
    \tuplet 3/2 {
        dod8(red mi) dod(red mi) dod(red mi)\mbreak
        red(mi fad) red(mi fad) red(mi fad)

        %43
        mi(red mi) dod(red mi) red(mi) dod
    }
    sid4 sold'2~
    sold4 fad2~

    %46
    fad4 sold8 fad sold la
    fad mi red4.\tr dod8
    dod4 mi\tu mi

    %49
    fad sold sold
    dod, fad2~\mbreak
    fad4 mi2~

    %52
    mi4 re8 mi fad sol
    mi re dod re mi fad
    re si mi re dod si

    %55
    dod si la sold la si
    sold la si sold la si
    la sold fad4. mi8

    %58
    \tuplet 3/2 {
        mi(fad si) sold(si mi) si(mi sold)\mbreak
        la,,(dod mi) dod(mi la) mi(la dod)
        re,(fad la) fad(la re)la(re fad)

        %61
        mi,(sold si) sold(si mi) si mi sold
        fad,(la dod) la(dod fad) dod(fad la)
        sold,(si mi) si(mi sold) mi(sold si)

        %64
        dod,(la' dod,) dod(la' dod,) dod(la' dod,)
        dod(sold' dod,) dod(sold' dod,) dod(sold' dod,)
        dod(fad dod) dod(fad dod) dod(fad dod)\mbreak
    }

    %67
    mid4 dod'2~
    dod4 si2~
    si4 la8 si dod re

    %70
    si la sold la si sold
    la4 fad2~
    fad4 mi2~

    %73
    mi4 fad8 mi fad sol
    mi re dod re mi dod
    red4 mi2~

    %76
    mi4 re!2~
    re4 mi8 re mi fad\mbreak
    re dod si dod re si

    %79
    dod si la si dod re
    si la sold la si dod
    \tuplet 3/2 {
        la fad' (la) la, fad' (la) la, fad' (la)

        %82
        si, fad' (la) si,fad' (la) si, fad'(la)
        dod, fad(la) dod, fad(la) dod, fad(la)
        re, fad(la) re, fad(la) re, fad(la)

        %85
        la, fad' (la) si, fad'(la) dod, fad(la)
        re, fad(la) dod, fad(la) dod, fad(la)
    }
    si,8. fad'16 dod8. fad16 dod,8. \once\stemDown mid'16

    %88
    fad4 re8 fad fad re
    re dod dod mi mi dod
    dod si \tuplet 3/2 { si[(dod re)] } re si

    %91
    si sold' sold re re mid,
    mid? dod' dod2
    si8 la sold4. fad8

    %94
    fad2.\fermata

}

IVvlIn =  \relative do'' {

    r4 la la
    si dod dod
    fad, dod'2~

    %4
    dod4 sid2
    dod4 dod8 si! dod re
    si la sold la si dod

    %7
    la si dod red mi fad
    red dod sid red sold fad
    mi red dod mi la mi\mbreak

    %10
    fad mi re? dod re mi
    dod4 fad2~
    fad4 mid2

    %13
    fad4. mi!8 re dod
    si la sold4. fad8
    fad4 r r

    %16
    R2.*2
    r4 mid' mid
    fad sold sold

    %20
    dod, fad8 mi re dod
    si la sold4. fad8
    fad2 r4

    %23
    R2.*12
    r4 dod' dod
    re mi mi

    %37
    la, dod dod
    re dod dod
    fad sold8 fad sold la

    %40
    fad mi red mi fad red
    mi4 r r\mbreak
    R2.*2

    %44
    r4 sid sid
    dod red red
    sold, r r

    %47
    R2.
    r4 mi' mi

    %49
    fad sold sold
    dod, fad2~\mbreak
    fad4 mi2~

    %52
    mi4 re8 mi fad sol?
    mi re dod re mi fad
    re si mi re dod si

    %55
    dod si la sold la si
    sold la si sold la si
    la sold fad4. mi8

    %58
    mi4 r r\mbreak
    mi r r
    fad r r

    %61
    sold r sold
    la r la
    si r si

    %64
    dod r dod
    dod r dod
    fad, r fad\mbreak

    %67
    sold mid' mid
    fad sold sold
    dod, fad2~

    %70
    fad4 mid2
    fad4 dod8 si dod re
    si la sold la si dod

    %73
    lad4 si2~
    si4 la!2~
    la4 sold8 la si dod

    %76
    la sold fad sold la si
    sold4 la2~\mbreak
    la4 sold2~

    %79
    sold4 fad2~
    fad4 mid2
    fad4 r r

    %82
    si r r
    R2.
    re4 r r

    %85
    r r dod
    re dod re\mbreak
    si sold sold

    %88
    la r la
    sold r sold
    fad r fad

    %91
    mid r r
    r fad dod'
    si8 la sold4. fad8

    %94
    fad2.\fermata

}

IVvlIIn = \relative do'' {

    R2.*2
    r4 mi, mi
    fad sold sold

    %5
    dod, fad2~
    fad4 mid2
    fad4 dod' dod

    %8
    la sold sid
    dod dod mi\mbreak
    re! si si

    %11
    la dod8 si dod re
    si la sold la si dod
    la sold fad sold la4

    %14
    sold8 fad mid4. fad8
    fad4 r r
    R2.*2

    %18
    r4 dod' dod\mbreak
    dod si si
    la8 sold fad sold la4

    %21
    sold8 fad mid4. fad8
    fad2 r4
    R2.*14

    %37
    r4 la la
    si dod dod
    fad, dod'2~

    %40
    dod4 sid2
    dod4 r r\mbreak
    R2.*8

    %50
    r4 la la\mbreak
    si dod dod
    fad, si2~

    %53
    si4 la2~
    la4 sold mi
    mi red red

    %56
    mi mi mi
    mi red4. mi8
    mi4 r r\mbreak

    %59
    mi r r
    re r r
    mi r mi

    %62
    dod r dod
    sold' r sold
    mi r fad

    %65
    sold r sold
    la r fad\mbreak
    dod'dod, dod

    %68
    red mid mid
    fad dod' dod
    re sold, dod

    %71
    dod dod la
    sold sold sold
    fad fad fad

    %74
    sol dod, fad
    fad mi sold?
    fad fad fad

    %77
    mi mi mi\mbreak
    fad si, mi
    mi fad fad

    %80
    fad dod dod
    dod r r
    si' r r

    %83
    R2.
    re4 r r
    r r dod

    %86
    re dod re\mbreak
    si dod, sold'
    fad r fad

    %89
    sold r mi
    fad r fad
    sold r r

    %92
    r fad la
    sold8 fad mid4. fad8
    fad2.\fermata

}

IVvlan =  \relative do' {

    R2.*4
    r4 la la
    si dod dod

    %7
    fad, sold'8 fad sold la
    fad mi red4 red
    dod sold' la

    %10
    la sold sold\mbreak
    mi fad fad
    sold dod, dod

    %13
    dod dod fad
    re sold, dod
    dod r r

    %16
    R2.*2
    r4 dod dod
    red mid mid

    %20
    fad dod fad\mbreak
    re sold, dod
    dod2 r4

    %23
    R2.*16
    r4 dod dod
    la' red, sold

    %41
    sold r r
    R2.*2
    r4 sold, sold

    %45
    lad sid sid
    dod r r\mbreak
    R2.

    %48
    r4 sold' sold
    la red, red
    mid fad r

    %51
    R2.
    r4 re! re
    mi! fad fad

    %54
    si, si mi
    mi si si\mbreak
    sold mi' mi

    %57
    dod fad, si
    si r r
    la r r

    %60
    la r r
    si r si
    la r la

    %63
    mi' r mi
    mi r la,\mbreak
    dod r dod

    %66
    fad r re
    sold, r r
    R2.

    %69
    r4 fad' la
    sold sold sold
    fad fad fad

    %72
    re sold, dod
    dod si re\mbreak
    dod dod dod

    %75
    si si si
    dod fad, si
    si la la

    %78
    si si si
    la dod la
    re sold, sold

    %81
    la r r
    R2.\mbreak
    dod4 r r

    %84
    R2.
    la4 r r
    R2.

    %87
    re4 dod dod
    dod r dod
    si r dod

    %90
    la r fad
    dod' r r
    r dod fad,\mbreak

    %93
    re' sold, dod
    dod2.\fermata

}

IVcbn = \relative do {

    R2.*6
    r4 mi mi
    fad sold sold
    dod, dod dod\mbreak

    %10
    re mi mi
    la, la la
    si dod dod

    %13
    re la la
    si dod dod
    fad, r r

    %16
    R2.*4
    r4 la la
    si dod dod

    %22
    fad, r r
    R2.*16
    r4 mi' mi

    %40
    fad sold sold
    dod, r r\mbreak
    R2.*4

    %46
    r4 mi mi
    fad sold sold
    dod, dod'2~

    %49
    dod4 sid2
    dod4 r r\mbreak
    R2.*3

    %54
    r4 sold sold
    la si si
    dod sold sold

    %57
    la si si
    mi, r r\mbreak
    R2.*10

    %69
    r4 la la
    si dod dod
    fad, la, la

    %72
    si dod dod
    fad, re' re
    mi fad fad

    %75
    si, sold' sold
    la si si
    mi, dod dod\mbreak

    %78
    re mi mi
    la, la' la
    si dod dod

    %81
    fad, r r
    R2.
    dod4 r r

    %84
    R2.
    la4 r r
    R2.*2

    %88
    r4 r fad'
    mi r mi

    %90
    re r re
    dod r r
    r la la

    %93
    si dod dod
    fad,2.\fermata

}

IVbcn = \relative do {

    \clef violin r4 la''\solo la
    si dod dod
    <<
        {
            r4 dod2~

            %4
            dod4 sid2
            dod4
        }\\{
            fad, mi mi
            fad sold sold
            dod,
        }
    >> \clef alto\key fad\minor la la
    si dod dod

    %7
    fad, \clef bass\key fad\minor mi\tu mi
    fad sold sold
    dod, dod dod\mbreak

    %10
    re mi mi
    la, la la
    si dod dod

    %13
    re la la
    si dod dod
    fad, r r

    %16
    mid r r
    fad la si
    dod r r\mbreak

    %19
    R2.
    r4 la\tu la
    si dod dod

    %22
    <<fad\\fad,>> r r
    mid' r r
    fad si si,

    %25
    mi la la,
    re r si\mbreak
    dod r fad

    %28
    si, mi mi,
    la si dod
    re r r

    %31
    mi r r
    fad r r\mbreak
    sold r r

    %34
    la mi mi,
    la r  r
    R2.*3

    %39
    r4 mi'\tu mi
    fad sold sold
    dod, dod'2~\mbreak

    %42
    dod4 sid2
    dod4 la fad
    sold r r

    %45
    R2.
    r4 mi\tu mi
    fad sold sold

    %48
    dod, dod'2~
    dod4 sid2
    dod4 la fad\mbreak

    %51
    re! dod si
    lad si\clef alto\key fad\minor re'
    mi fad fad

    %54
    si, \clef bass \key fad\minor sold\tu sold
    la si si
    dod sold sold

    %57
    la si si
    mi, r r\mbreak
    dod r r

    %60
    fad r r
    mi r mi
    fad r fad

    %63
    sold r sold
    la r fad
    mi r mi

    %66
    re r re\mbreak
    dod r r
    R2.

    %69
    r4 la' la
    si dod dod
    fad, la, la

    %72
    si dod dod
    fad, re' re
    mi fad fad

    %75
    si, sold' sold
    la si si
    mi, dod dod\mbreak

    %78
    re mi mi
    la, la' la
    si dod dod

    %81
    fad, r r
    R2.
    dod4 r r

    %84
    R2.
    la4 r r
    R2.\mbreak

    %87
    si'4 dod dod,
    fad, r fad'
    mi r mi

    %90
    re r re
    dod r r
    r la la

    %93
    si dod dod
    fad,2.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*6
    s4 <6> s
    s <_+> s
    <5> <6> s
    s2.
    s4 <6>2
    s2.
    s4 <6>2
    s4 <_+>2
    s2.
    <6>
    s4 <6> <6>
    s2.*2
    s4 <6>2
    s4 <_+>2
    s2.*4
    s2 <6>4
    <6> s <7>
    <7> <7> s
    s <6> <6>
    s2.*10
    s4 <_+>2
    s2.
    <4 2>4 <6 4>2
    s <6\\>4
    <_+>2.
    s
    s4 <6>2
    s4 <_+>2
    s2.
    <4 2>4 <6 5>2
    <_+>4 <6>2
    <6>4 <_-> <6 4>
    s2 <6>4
    s2.
    s4 <6>2
    s4 <_+>2
    s4 <6>2
    s4 <_+>2
    s2.
    <6>
    <6>
    s
    s
    <6>
    s
    s2 <6>4
    <7> s <6>
    <_+>2.
    s
    s4 <6>2
    s4 <_+>2
    s4 <6>2
    s4 <_->2
    s4 <6>2
    <_->4 <_->2
    <7 _+>4 <6>2
    s4 <6>2
    <7>4 <6>2
    s2.
    <7>4 <6> s
    s <_+>2
    s2.*4
    <6>2.
    s
    s
    s2 <6>4
    s2.*3
    s4 <6>2

}

forma = {

    \key fad\minor
    \time 3/4
    \tempo 2. = 57
    s2.*94
    \bar"|."

}

IVvl = {
    \IVglobal
    %\notypeset
    <<\IVvln \forma>>

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

IVcb = {
    \IVglobal
    \clef bass
    <<\IVcbn \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = 3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller {"Concerto per Violino [TWV 51:fis1]"}
    composer = \markup \center-column{"G. Ph. Telemann (1681-1767)"}
}

\markup\huge "[1.] Adagio"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Concertino"}
            \Ivl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1"\vspace #-0.2"in Rip[ieno]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 2"\vspace #-0.2"in Rip[ieno]"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Violone"}
            \Icb
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
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
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[2.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIcb
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"harpsichord"
            \IIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[3.] Adagio"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIIcb
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"harpsichord"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[4.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IVvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IVvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IVcb
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"harpsichord"
            \IVbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

