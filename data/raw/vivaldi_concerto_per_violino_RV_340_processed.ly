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
    \terzinequarto\con
}

Ivln = \relative do'' {

    la,4 r8 la16 si dod8 dod mi mi
    la4 r8 la,16 si dod8 dod mi mi
    la [la, la la'16 si] dod8 dod mi mi

    %4
    mi,4 r mi r8 mi16 fad
    sold8 sold si si mi4 r8 mi,16 fad
    sold8 sold si si mi[\mbreak mi, mi sold16 la]

    %7
    si8 si re re do si4 re8
    do si4 re8\mbreak do si r la'
    red, si r re do? la r do!

    %10
    sib sold! r la mi4 r8 mi16 fad
    sold8 sold si? si re4 dod
    si la sold fad

    %13
    mi8[fad16 sold la8 re] dod4 si
    la16 mi' la dod dod8(si16) la si mi, si' re re8(dod16) si\mbreak
    dod mi, dod' mi mi8(re16) dod re mi, re' fad fad8(mi16) re

    %16
    mi8[re16 dod si la sold fad] mi8[re16 dod si la sold fad]
    mi4 r8 mi16 fad sold8 sold si si
    mi4 r8 mi,16 fad sold8 sold si si

    %19
    \tuplet 3/2 { mi8 mi fad sold[la16(sold) fad(mi)] la8 la, si dod[re16(dod) si(la)]
    mi8 mi' fad sold[la16(sold) fad(mi)] la8 la, si dod[re16(dod) si(la)]\mbreak
    \senza mi8 mi' fad sold[la16(sold) fad(mi)] si'8 si, dod re[mi16(re) dod(si)]

    %22
    dod8 la' si dod[re16(dod) si(la)] mi'8 mi, fad sol[la16(sol) fad(mi)]
    fad8 si dod re[mi16(re) dod(si)] fad'8 fad, sold? la[si16 la sold fad]
    sold8 mi' fad sold[la16 sold fad mi] la8 la,16(si) dod(si) la8 [la16(si) dod(si)]\mbreak

    %25
    la8 la16(si) dod(si) la8[mi fad] re[re'16(mi) fad(mi)] re8 la si
    sold sold16(la) si(la) sold8[re mi] dod dod'16 (re) mi(re) dod8[sold la]
    fad fad16(sold) la(sold) fad8[dod re] si si'16(dod) re(dod) si8[fad sold]

    %28
    mi mi16(fad) sold(fad) mi8 [si dod] la la'16(si) dod(si) la8[la16(si) dod(si)]
    la8 la,16(si) dod(si) la8[la16(si) dod(si)]\mbreak la8 la,16(si) dod(si) la8[la16(si) dod(si)]}
    la4 r la16[(si dod re) mi fad sold mi]

    %31
    la [si dod re mi fad sold mi] la mi dod re mi dod re mi
    la, mi dod re mi dod re mi la,4 r8 la16 si
    dod8 dod mi mi la4 r8 la16 si

    %34
    dod8 dod mi mi mi,4 \parenthesize r8 mi16 fad\mbreak  %% fine p. 7
    sold8 sold si si do si4 mi,8
    do' si4 mi,8 do' si r8 la'

    %37
    red,8 si r re do? la r do!
    sib sold! r la mi16[fad sold la si? dod red si]
    mi[fad sold la si sold fad mi] si' dod red dod si red dod si

    %40
    mi8 mi, r4 \con \tuplet 3/2 { si'8(dod) red mi[(red) mi]\mbreak
    dod(si) dod la,[dod16(si la8)] la'(si) dod red[(dod) red]
    si(la) si sold,[si16(la sold8)] sold'(la) si dod[(si) dod]

    %43
    la(sold) la fad,[la16(sold fad8)] \senza fad'(sold) la si[(la) si]
    sold si la sold[fad mi] red fad16 (mi red8) si[la si]
    mi sold16(fad mi8) si[la si] fad' la16(sold fad8) si,[la si]

    %46
    sold' si16(la sold8) si,[la si] la' dod16(si la8) si,[la si]\mbreak
    si'(dod) red mi[(red) mi] dod(red) mi la,[(si) dod]
    fad,(sold) la red,[(mi) fad] si,(si' la sold[fad mi)]

    %49
    si(si' la sold[fad mi)] fad4.~fad4 mi8}
    mi4 r8 mi,16 fad sold8 sold si si
    mi[mi, mi mi16 fad] sold8 sold si si

    %52
    re?[mi, mi mi16 fad] sold8 sold si si
    dod4 r8 la16 si\mbreak dod8 dod mi mi
    la[la, la la16 si] dod8 dod mi mi

    %55
    sol[la, la la16 si] dod8 dod mi mi
    fad4 r8 si,16 dod red8 red fad fad
    si[si, si si16 dod] red8 red fad fad

    %58
    la[si, si si16 dod] red8 red fad fad
    sold4 r8 si lad fad r la\mbreak
    sold mi r sol fa red r mi

    %61
    si[dod16 red mi8] la sold?4 fad?
    mi r8 si lad fad r la
    sold mi r sol fa red r mi

    %64
    si red mi la sold?4 fad?
    mi16 sold fad mi si' red dod si mi sold fad mi si' red? dod si\mbreak
    mi sold, fad sold mi re'! dod si dod dod, si dod la dod' si dod

    %67
    red fad, mi fad red dod' si la si si, la si sold si' dod si
    dod mi, re? mi dod si' la sold la la, sold la fad la' sold la
    si red, dod red si la' sold fad sold sold, fad sold mi sold' fad sold

    %70
    la si sold la fad sold mi fad red mi dod red sid dod lad sid\mbreak
    sold sold fad sold sid sold fad sold sid, sold' fad sold sid sold fad sold
    sid, sold' fad sold sid red dod red fad red dod red sold red dod red

    %73
    mi8[dod dod mi,16 fad]sold8 sold dod dod
    mi4 r8 dod16 re? mi8 mi sold sold
    la4 r8 fad,16 sold la8 la dod dod

    %76
    sid4\solo sold \tuplet 3/2 { sid8(dod sid } red4)\mbreak
    fad(red) \tuplet 3/2 { fad8(sold fad } la!4)
    sid4(red)\tuplet 3/2 { red8(dod sid la![sold fad)] }

    %79
    mi4(dod') \tuplet 3/2 { dod8(si? la sold[fad mi)]  }
    red4(si') \tuplet 3/2 { si8\parentSlur (la sold fad[mi red)]}
    dod4(la') \tuplet 3/2 { la8(sold fad mi[red dod)] }

    %82
    sid4(red) \tuplet 3/2 { fad,8(sold fad } la4)
    \tuplet 3/2 { fad8(sold fad } red'4) \tuplet 3/2 { fad,8(sold fad } la4)\mbreak
    \tuplet 3/2 { fad8(sid red fad[la fad)] mi(sold fad mi[red dod)]

    %85
    sid4.~sid4 dod8} dod4 r8 mi,16 fad
    sold8 sold dod dod mi[dod, dod dod'16 re]
    mi8 mi sold sold la[fad, fad fad'16 sold]

    %88
    la8 la fad fad red[si si fad'16 sold]
    la8 la fad fad sold[mi, mi mi16 fad]
    sold8 sold si si\mbreak mi[mi, mi sold16 la]

    %91
    si8 si re re dod si4 re8
    dod si4 re8 do si4 re8
    do si r16 si do re mi(re) mi(re) mi(re) mi(re)

    %94
    dod?(si) dod(si) la mi' fad sol la(sol) la(sol) la(sol) la(sol)
    fad(mi) fad(mi) re fad sold? la si(la) si(la) si(la) si(la)\mbreak
    sold(fad) sold(fad) mi si' dod re mi(re) mi(re) mi(re) mi(re)

    %97
    dod(si) dod(si) la dod re mi fad(mi) fad(mi) fad(mi) fad(mi)
    re(dod) re(dod) si re mi fad sold(fad) sold(fad) sold(fad) sold(fad)
    mi(re) mi(re) dod mi fad sold la(sold) la(sold) la(sold) la(sold)

    %100
    fad(mi) fad(mi) re fad sold la si(la) si(la) si(la) si(la)
    sold(fad) sold(fad) mi4\mbreak la,16 dod, mi, dod' la' dod, mi, dod'
    sold' si, mi, si' sold' si, mi, si' la'16 dod, mi, dod' la' dod, mi, dod'

    %103
    sold' si, mi, si' sold' si, mi, si' la' dod, mi, dod' la' dod, mi, dod'
    la' si, mi, si' la' si, mi, si' sold' si, mi, si' sold' si, mi, si'
    la'4 r la16 dod, mi, dod' la' dod, mi, dod'

    %106
    sold' si, mi, si' sold' si, mi, si' la' dod, mi, dod' la' dod, mi, dod'
    sold' si, mi, si' sold' si, mi, si' la' dod, mi, dod' la' dod, mi, dod'
    la' si, mi, si' la' si, mi, si' sold'  si, mi, si' sold' si, mi, si'\mbreak

    %109
    la'4 r8 la,,16 si dod8 dod mi mi
    la la dod dod mi[mi dod si16 la]
    sold4 r8 mi16 fad sold8 sold si si

    %112
    re4 dod si la
    sold fad mi8[fad16 sold la8 re]
    dod4 si la8[sold16 fad mi8 re]

    %115
    dod4 si la2\fermata

}

IvlIn =  \relative do'' {

    la,4 r8 la16 si dod8 dod mi mi
    la4 r8 la,16 si dod8 dod mi mi
    la [la, la la'16 si] dod8 dod mi mi

    %4
    mi,4 r mi r8 mi16 fad
    sold8 sold si si mi4 r8 mi,16 fad
    sold8 sold si si mi[\mbreak mi, mi sold16 la]

    %7
    si8 si re re do si4 re8
    do si4 re8\mbreak do si r la'
    red, si r re do? la r do!

    %10
    sib sold! r la mi4 r8 mi16 fad
    sold8 sold si? si re4 dod
    si la sold fad

    %13
    mi8[fad16 sold la8 re] dod4 si
    la r mi8 fad sold mi\mbreak
    la si dod la re dod re si

    %16
    dod4 r mi, r
    mi r8 mi16 fad sold8 sold si si
    mi4 r8 mi,16 fad sold8 sold si si

    %19
    mi4 r r2
    R1*9
    r2 r4 r8 la,,16 si

    %30
    dod8 dod mi mi la4 r
    R1
    r2 la,4 r8 la16 si

    %33
    dod8 dod mi mi la4 r8 la16 si
    dod8 dod mi mi mi,4 \parenthesize r8 mi16 fad\mbreak  %% fine p. 7
    sold8 sold si si do si4 mi,8

    %36
    do' si4 mi,8 do' si r8 la'
    red,8 si r re do? la r do!
    sib sold! r la mi4 r

    %39
    R1*11
    mi4 r8 mi16 fad sold8 sold si si
    mi[mi, mi mi16 fad] sold8 sold si si

    %52
    re?[mi, mi mi16 fad] sold8 sold si si
    dod4 r8 la16 si\mbreak dod8 dod mi mi
    la[la, la la16 si] dod8 dod mi mi

    %55
    sol[la, la la16 si] dod8 dod mi mi
    fad4 r8 si,16 dod red8 red fad fad
    si[si, si si16 dod] red8 red fad fad

    %58
    la[si, si si16 dod] red8 red fad fad
    sold4 r8 si lad fad r la\mbreak
    sold mi r sol fa red r mi

    %61
    si[dod16 red mi8] la sold?4 fad?
    mi r8 si lad fad r la
    sold mi r sol fa red r mi

    %64
    si red mi la sold?4 fad?
    mi r r2
    mi8 fad sold mi la, si dod la

    %67
    si dod red si sold' fad mi sold
    la si dod mi, fad mi red fad
    sold la si red, mi red dod mi

    %70
    fad mi red dod sid4 r
    sid?2~sid~
    sid?1

    %73
    dod4 r8 mi16 fad sold8 sold dod dod
    mi4 r8 dod16 re? mi8 mi sold sold
    la4 r8 fad,16 sold la8 la dod dod

    %76
    sid4 r r2\mbreak
    R1*8
    r2 r4 r8 mi,16 fad

    %86
    sold8 sold dod dod mi[dod, dod dod'16 re]
    mi8 mi sold sold la[fad, fad fad'16 sold]
    la8 la fad fad red[si si fad'16 sold]

    %89
    la8 la fad fad sold[mi, mi mi16 fad]
    sold8 sold si si\mbreak mi[mi, mi sold16 la]
    si8 si re re dod si4 re8

    %92
    dod si4 re8 do si4 re8
    do si r4 sold8 fad sold mi
    la4 r dod,8 si dod la

    %95
    re4 r red8 dod red si\mbreak
    mi4 r sold8 fad sold mi
    la4 r lad8 sold lad fad

    %98
    si4 r si8 la si sold
    dod4 r dod8 si dod la
    re4 r red8 dod red si\mbreak

    %101
    mi,1~
    mi~
    mi~

    %104
    mi
    la,4 r r2
    R1*3

    %109
    r4 r8 la16 si dod8 dod mi mi
    la la dod dod mi[mi dod si16 la]
    sold4 r8 mi16 fad sold8 sold si si

    %112
    re4 dod si la
    sold fad mi8[fad16 sold la8 re]
    dod4 si la8[sold16 fad mi8 re]

    %115
    dod4 si la2\fermata

}

IvlIIn = \relative do'' {

    la,4 r8 la16 si dod8 dod mi mi
    la4 r8 la,16 si dod8 dod mi mi
    la [la, la la'16 si] dod8 dod mi mi

    %4
    mi,4 r mi r8 mi16 fad
    sold8 sold si si mi4 r8 mi,16 fad
    sold8 sold si si mi[\mbreak mi, mi sold16 la]

    %7
    si8 si si si la sold4 si8
    la sold4 si8\mbreak la sold r mi'
    red si r re do? la r do!

    %10
    sib sold! r la mi4 r8 mi16 fad
    sold8 sold si? si re4 r
    re dod si la

    %13
    sold8[la16 si dod8 si] la4 sold
    la r mi8 fad sold mi\mbreak
    la si dod la re dod re si

    %16
    dod4 r mi, r
    mi r8 mi16 fad sold8 sold si si
    mi4 r8 mi,16 fad sold8 sold si si

    %19
    mi4 r r2
    R1*9
    r2 r4 r8 la,,16 si

    %30
    dod8 dod mi mi la4 r
    R1
    r2 la,4 r8 la16 si

    %33
    dod8 dod mi mi la4 r8 la16 si
    dod8 dod mi mi mi,4 \parenthesize r8 mi16 fad\mbreak  %% fine p. 7
    sold8 sold si si la sold4 si8

    %36
    la sold4 si8 la sold r la'
    red,8 si r re do? la r do!
    sib sold! r la mi4 r

    %39
    R1*11
    mi4 r8 mi16 fad sold8 sold si si
    mi[mi, mi mi16 fad] sold8 sold si si

    %52
    re?[mi, mi mi16 fad] sold8 sold si si
    dod4 r8 la16 si\mbreak dod8 dod mi mi
    la[la, la la16 si] dod8 dod mi mi

    %55
    sol[la, la la16 si] dod8 dod mi mi
    fad4 r8 si,16 dod red8 red fad fad
    si[si, si si16 dod] red8 red fad fad

    %58
    la[si, si si16 dod] red8 red fad fad
    sold4 r8 si lad fad r la\mbreak
    sold mi r sol fa red r mi

    %61
    si[dod16 red mi8] la sold?4 fad?
    mi r8 si lad fad r la
    sold mi r sol fa red r mi

    %64
    si red mi la sold?4 fad?
    mi r r2
    mi8 fad sold mi la, si dod la

    %67
    si dod red si sold' fad mi sold
    la si dod mi, fad mi red fad
    sold la si red, mi red dod mi

    %70
    fad mi red dod sid4 r
    sid?2~sid~
    sid?1

    %73
    dod4 r8 mi16 fad sold8 sold dod dod
    mi4 r8 dod16 re? mi8 mi sold sold
    la4 r8 fad,16 sold la8 la dod dod

    %76
    sid4 r r2\mbreak
    R1*8
    r2 r4 r8 mi,16 fad

    %86
    sold8 sold dod dod mi[dod, dod dod'16 re]
    mi8 mi sold sold la[fad, fad fad'16 sold]
    la8 la fad fad red[si si fad'16 sold]

    %89
    la8 la fad fad sold[mi, mi mi16 fad]
    sold8 sold si si\mbreak mi[mi, mi sold16 la]
    si8 si si si la sold4 si8

    %92
    la sold4 si8 la sold4 si8
    la sold r4 sold8 fad sold mi
    la4 r dod,8 si dod la

    %95
    re4 r red8 dod red si\mbreak
    mi4 r sold8 fad sold mi
    la4 r lad8 sold lad fad

    %98
    si4 r si8 la si sold
    dod4 r dod8 si dod la
    re4 r red8 dod red si\mbreak

    %101
    mi,1~
    mi~
    mi~

    %104
    mi
    la,4 r r2
    R1*3

    %109
    r4 r8 la16 si dod8 dod mi mi
    la la dod dod mi[mi dod si16 la]
    sold4 r8 mi16 fad sold8 sold si si

    %112
    re4 r re dod
    si la sold8[la16 si dod8 si]
    la4 sold la r

    %115
    la, sold la2\fermata

}

Ivlan =  \relative do' {

    la4 r8 la16 si dod8 dod mi mi
    la4 r8 la,16 si dod8 dod mi mi
    la [la, la la'16 si] dod8 dod mi mi

    %4
    mi,4 r mi r8 mi16 fad
    sold8 sold si si mi4 r8 mi,16 fad
    sold8 sold si si mi[mi, mi sold16 la]

    %7
    si8 si mi, mi do? do mi mi
    do? do mi mi mi mi r dod'?
    fad, fad si si mi, mi fad fad

    %10
    fa re mi fa sold,4 r8 mi'16 fad?
    sold8 sold si si sold4 la
    sold mi mi mi

    %13
    si mi8 fad mi4 mi
    dod r r2
    R1*2

    %17
    r4 r8 mi16 fad sold8 sold si si
    mi4 r8 mi,16 fad sold8 sold si si
    mi4 r r2

    %20
    R1*9
    r2 r4 r8 la,,16 si
    dod8 dod mi mi la4 r

    %31
    R1
    r2 la,4 r8 la16 si
    dod8 dod mi mi la4 r8 la16 si

    %34
    dod8 dod mi mi mi,4 \parenthesize r8 mi16 fad\mbreak  %% fine p. 7
    sold8 sold sold sold mi mi sold sold
    mi mi sold sold mi mi r dod'

    %37
    fad, fad si si mi, mi fad [fad]
    fa re mi fa si,4 r
    R1*11

    %50
    mi4 r8 mi16 fad sold8 sold si si
    mi[mi, mi mi16 fad] sold8 sold si si
    re[mi, mi mi16 fad] sold8 sold si si

    %53
    dod4 r8 dod,\mbreak mi mi la la
    dod[dod, dod dod16 re] mi8 mi dod dod
    mi[dod dod dod16 re] mi8 mi dod' dod

    %56
    la fad fad fad fad fad si si
    \parenthesize red[red, red red16 mi] fad8 fad red red
    fad[red red red16 mi] fad8 fad red red

    %59
    si4 r8 sold' dod dod fad, fad\mbreak
    si si mi,[mi] do' si si dod
    fad, fad mi red mi4 red

    %62
    mi r8 sold, dod dod fad fad
    si, si mi[mi] do si si dod
    fad, fad mi red mi4 red

    %65
    mi r r2
    R1*7
    r4 r8 mi' mi mi sold sold

    %74
    dod4 r8 mi,16fad sold8 sold dod dod
    dod4 r8 dod, fad fad la la
    red,4 r  r2\mbreak

    %77
    R1*8
    r2 r4 r8 si16 dod
    mi8 mi sold sold sold[la, la mi'16 mi]

    %87
    sold8 sold dod dod dod[dod, dod la'16 si]
    dod8 dod la la fad fad fad fad
    fad fad red red si si si si

    %90
    mi mi sold sold\mbreak sold si, si si
    sold' sold sold sold mi mi sold sold
    mi mi sold sold mi mi sold sold

    %93
    mi4 r r2
    R1*15
    la,4 r8 la16 si dod8 dod mi mi

    %110
    la la dod dod mi [mi dod si16 la]
    sold4 r8 mi16 fad sold8 sold sold sold
    sold4 la sold mi

    %113
    mi mi si mi8 fad
    mi4 mi dod r
    mi, mi mi2\fermata

}

Ibcn = \relative do {

    la4 r8 la16 si dod8 dod mi mi
    la4 r8 la,16 si dod8 dod mi mi
    la [la, la la'16 si] dod8 dod mi mi

    %4
    mi,4 r mi r8 mi16 fad
    sold8 sold si si mi4 r8 mi,16 fad
    sold8 sold si si mi[mi, mi sold16 la]

    %7
    si8 si mi, mi la mi mi mi
    la mi mi mi\mbreak la mi r la
    la la sold sold la la red, red

    %10
    re! re dod re mi4 r8 mi16 fad
    sold8 sold si si mi,4 mi
    mi mi mi mi

    %13
    mi dod8 re mi4 mi,
    la r r2\mbreak
    R1*2

    %17
    r4 r8 mi'16 fad sold8 sold si si
    mi4 r8 mi,16 fad sold8 sold si si
    mi4 mi, dod la

    %20
    sold mi' dod la\mbreak
    sold mi' sold mi
    la la, dod la

    %23
    re fad red si
    mi mi, la r\mbreak
    la dod' si fad

    %26
    mi si' la mi
    re la' sold re
    dod sold' la r

    %29
    la, r\mbreak la r8 la16 si
    dod8 dod mi mi la4 r
    la, r la r

    %32
    la r la r8 la16 si
    dod8 dod mi mi la4 r8 la16 si
    dod8 dod mi mi mi,4 r8 mi16 fad\mbreak

    %35
    sold8 sold mi mi la mi mi mi
    la mi mi mi la mi r la
    la la sold sold la la red,[red]

    %38
    re! re dod re mi4 r
    mi r mi r
    mi8[mi16 fad sold8\clef tenor mi'] red si \clef bass sold mi\mbreak

    %41
    dod'4 r dod8 la fad red
    sold4 r si8 sold mi dod
    fad4 r la8 fad red si

    %44
    mi fad sold la si2~
    si~si~
    si~si\mbreak

    %47
    si8 la sold mi la4 fad
    red si sold mi'
    sold mi si' si,

    %50
    mi r8 mi16 fad sold8 sold si si
    mi[mi, mi mi16 fad] sold8 sold si si
    re[mi, mi mi16 fad] sold8 sold si si

    %53
    dod4 r8 la\mbreak  la la, la la'
    la la la la la la, la la'
    la la la la la la, la la'

    %56
    re re, re re' si si, si si'
    si si si si si si, si si'
    si si si si si si, si si'

    %59
    mi mi, mi mi' mi mi red red\mbreak
    mi mi lad,[lad] la la sold[la]
    si la sold la si4 si,

    %62
    mi r8 mi mi mi red red
    mi mi lad,[lad] la la sold[la]
    si la sold la si4 si

    %65
    mi4 r mi r\mbreak
    mi r r2
    R1*6

    %73
    r4 r8 dod dod dod dod dod
    dod dod dod dod dod dod dod dod
    fad, fad fad fad fad fad fad fad

    %76
    sold1~\mbreak
    sold~
    sold

    %79
    dod'8 red mi dod fad,2
    si8 dod red si mi,2
    la8 si dod la red,2

    %82
    sold,1~
    sold~\mbreak
    sold2 dod4 fad

    %85
    sold sold, dod r8 dod
    dod dod dod dod dod dod dod dod
    dod dod dod dod fad fad fad fad

    %88
    fad fad fad fad si, si si si
    si si si si mi mi mi mi
    mi mi mi mi\mbreak mi mi mi mi

    %91
    mi mi mi mi la mi mi mi
    la mi mi mi la mi mi mi
    la mi r4 r2

    %94
    la,8 si dod si la4 r
    re8 mi fad mi si4 r\mbreak
    mi8 fad sold fad mi4 r

    %97
    la8 si dod si lad4 r
    si8 dod re dod si4 r
    dod8 re mi re dod4 r

    %100
    \clef tenor re8 mi fad re red4 r
    \clef bass R1*4
    la,8 si dod la mi'2~

    %106
    mi~mi~
    mi~mi~
    mi~mi\mbreak

    %109
    la,4 r8 la16 si dod8 dod mi mi
    la la dod dod mi [mi dod si16 la]
    sold4 r8 mi16 fad sold8 sold si si

    %112
    mi,4 mi mi mi
    mi mi mi8 re dod re
    mi4 mi, la r

    %115
    la mi la2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key la\major
    \time 4/4
    \tempo 2 = 55
    s1*115
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

    mi8. fa16 mi8 mi fa4 re8. mi16 re8 re mi4
    do8. re16 do8 do re4 si4. r
    sol'8. la16 sol8 sol la4 sib2.

    %4
    la8. sib16 la8 la sol4 fa2.
    re8. mi16 re8 re mi4 fa2.
    mi8. fa16 mi8 mi re4\mbreak do2.

    %7
    sib'8. do16 sib8 sib la4 sold la8 la4 sold8
    la8.\solo si?16 la8 la si4 do8. si16 la8 mi' la,4
    sold8. fad16 mi8 mi4. sol8. la16 sol8 sol la4

    %10
    sib8 la16 sol fa mi la8 sol16 fa mi re dod4 re8 mib re dod
    re2.\mbreak fa8. sol16 fa8 fa sol4
    lab4.~lab8 sol16 fa mib re \appoggiatura do si4 do8 reb8(do) si8

    %13
    do2. mi?8. fa16 mi8 mi la4
    fa8. mi16 re8 \appoggiatura do sib4 la8 sold4 la8 r r mi'
    mi8. fa16 mi8 mi la4 dod,8. re16 dod8 dod la'4

    %16
    re,8. mi16 re8 re fa4 \mbreak si,8. do16 si8 si sol'4
    do,8. re16 do8 do4 la'8 sib8. do16 sib8 sib dod4
    re4.~re4 la8 sold4 la8 do,?8. si16 la8

    %19
    red4.~red4 si'8 re,4.~re4 si'8
    do,4 la'8 do,8. re16 si8 la4. mi'8 fa4\mbreak
    re8. mi16 re8 re mi4 do8. re16 do8 do re4

    %22
    si4. r la'8. si16 la8 la la4
    sib8. do16 sib8 sib la4 sold la8 la8. si?16 sold8
    la4 do,8 do8. re16 si8 la2.\fermata

}

IIvlIn =  \relative do'' {

    mi8. fa16 mi8 mi fa4 re8. mi16 re8 re mi4
    do8. re16 do8 do re4 si4. r
    sol'8. la16 sol8 sol la4 sib2.

    %4
    la8. sib16 la8 la sol4 fa2.
    re8. mi16 re8 re mi4 fa2.
    mi8. fa16 mi8 mi re4\mbreak do2.

    %7
    sib'8. do16 sib8 sib la4 sold la8 la4 sold8
    la4 do,8 do si4 mi, do'8 do do4
    si4 si8 si si4 mi mi8 mi mi4

    %10
    mi mi8 fa sib,4 mi, la8 sib8 la mi'?
    fa4 fa8 fa fa4 re4 re8 re mib4
    fa fa8 mib re4 re sol,8 lab sol re'?

    %13
    mib4 mib8 mi mi4 do4 do8 do4 do8
    la4 la8 re re4 si do8 do do4
    do do8 do do4 mi mi8 mi mi4

    %16  OOKK
    la, la8 la la4\mbreak re,4 re8 re re'4
    sol, sol8 sol mi'4 fa fa8 fa mi4
    la la8 la la4 si, do8 la sold4

    %19
    fad fad8 fad fad4 si si8 sold sold4
    mi la8 la sold mi' mi8. fa16 mi8 mi fa4\mbreak
    re8. mi16 re8 re mi4 do8. re16 do8 do re4

    %22
    si4. r la'8. si16 la8 la la4
    sib8. do16 sib8 sib la4 sold la8 la8. si?16 sold8
    la4 do,8 do8. re16 si8 la2.\fermata

}

IIvlIIn = \relative do'' {

    do8. re16 do8 do re4 si8. do16 si8 si do4
    la8. si16 la8 la si4 sold4. r
    mi'8. fa16 mi8 mi fa4 sol2.

    %4
    mi4 mi8 mi mi4 re2.
    si8. do16 si8 si4 do8 re2.
    si4 si8 si si4\mbreak la2.

    %7
    fa'4 fa8 fa fa4 mi do8 do4 si8
    do4 do8 do si4 mi, do'8 do do4
    si4 si8 si si4 mi mi8 mi mi4

    %10
    mi mi8 fa sib,4 mi, la8 sib8 la mi'?
    fa4 fa8 fa fa4 re4 re8 re mib4
    fa fa8 mib re4 re sol,8 lab sol re'?

    %13
    mib4 mib8 mi mi4 do4 do8 do4 do8
    la4 la8 re re4 si do8 do do4
    do do8 do do4 mi mi8 mi mi4

    %16  OOKK
    la, la8 la la4\mbreak re,4 re8 re re'4
    sol, sol8 sol mi'4 fa fa8 fa mi4
    la la8 la la4 si, do8 la sold4

    %19
    fad fad8 fad fad4 si si8 sold sold4
    mi la8 la sold si do8. re16 do8 do re4\mbreak
    si8. do16 si8 si do4 la8. si16 la8 la si4

    %22
    sold4. r mi'4 mi8 mi mi4
    fa fa8 fa fa4 mi do8 do8. re16 si8
    do4 la8 la8. si16 sold8 la2.\fermata

}

IIvlan =  \relative do' {

    mi4 mi8 mi mi4 sold sold8 mi mi4
    mi mi8 fad fad4 si, si8 si si4
    la la'8 la la4 mi mi8 mi mi4

    %4
    dod dod8 dod dod4 la la8 la la4
    mi' mi8 mi mi4 si si8 si si4
    sold sold'?8 sold sold4\mbreak mi mi8 mi mi4

    %7
    re re8 re re4 si mi8 mi4 mi8
    mi4 la,8 la sold4 la la8 la la4
    mi' mi8 mi re4 dod dod8 dod dod4

    %10
    dod? dod8 re sol,4 la fa'8 sol la4
    re, re8 re re4\mbreak si si8 si si4
    si si8 do fa4 sol mib8 fa sol4

    %13
    do, do8 do si4 la la8 la la4
    re re8 re re4 mi la,8 la la4
    la la8 la la4 sol sol8 sol sol4

    %16
    fa fa8 fa fa4\mbreak fa' fa8 fa fa4
    mi mi8 mi do4 re re8 re mi4
    fa fa8 fa fa4 mi la,8 mi' mi4

    %19
    si si8 la la4 sold sold8 mi' mi4
    la, la8 mi' mi4 la,fa'8 fa fa4\mbreak
    sold sold8 mi mi4 mi mi8 fad fad4

    %22
    si, si8 si si4 do do8 mi mi4
    re re8 re re4 si mi8 mi mi4
    mi mi8 mi mi4 mi2.\fermata

}

IIbcn = \relative do {

    la4 la8 la la4 si si8 sold sold4
    la la8 red red4 mi8. fa16 mi8 mi re?4
    dod2. dod'8. re16 dod8 dod dod4

    %4
    dod,2. re8. dod16 re8 re re4
    sold,2. sold'8. la16 sold8 sold sold4
    sold?2.\mbreak la8. si16 la8 la la,4

    %7
    re2. mi4 la,8 mi'4 mi,8
    la4. r r2.
    R1.*11

    %20
    r2. la4 la8 la la4\mbreak
    si4 si8 sold sold4 la la8 red red4
    mi8. fa16 mi8 mi re4 do do8 do do4

    %23
    re re8 re re4 mi la,8 mi' mi,4
    la la8 mi' mi,4 la2.\fermata



}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key la\minor
    \time 12/8
    \tempo 4. = 45
    s1.*24
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

    la,8 dod mi
    la dod mi
    dod la mi

    %4
    la, dod mi
    la dod mi
    dod si la

    %7
    sold4 r8
    mi' mi,16 mi mi mi
    fad8 mi re
    fad' fad,16 fad fad fad

    %11
    sold8 fad mi
    sold' sold,16 sold sold sold
    la8 sold fad

    %14
    la' la,16 la la la
    si8 la sold\mbreak
    si' si,16 si si si

    %17
    dod8 si mi,
    fad mi si'
    dod si mi,

    %20
    fad mi si'
    dod si re
    dod si re

    %23
    dod re si
    la4 si,8
    dod si re

    %26
    dod si re
    dod re si
    la4 r8

    %29
    r16 mi'' dod mi si mi
    la, mi' dod mi si mi\mbreak
    la, fad' re fad dod fad

    %32
    si, fad' re fad dod fad
    si, sold' mi sold re sold
    dod, sold' mi sold re sold

    %35
    dod, la' fad la mi la
    re, la' fad la mi la
    re, si' sold si fad si

    %38
    mi, si' sold si fad si
    mi,4 r8
    dod'16( re mi8) dod

    %41
    dod4\tr si8
    dod16( re mi8)  si
    si4\tr la8\mbreak

    %44
    si16 dod re8 la
    la4\tr sold8
    la16 si dod8 sold

    %47
    sold4\tr fad8
    sold16 la si8 fad
    fad4\tr mi8

    %50
    la16 red, fad, la' fad, la'
    sold si, mi, sold' mi, sold'
    fad si, red, fad' red, fad'

    %53
    sold si, mi, sold' mi, sold'
    fad si, red, fad' red, fad'
    sold si, mi, sold' mi, sold'\mbreak

    %56
    fad8 si, r
    \con\terzine \tuplet 3/2 { sold'16(fad mi) la[(sold fad)] si(la sold)
    dod(si la) red[(dod si)] red(dod si)}

    %59
    mi sold, si, mi' si, mi'
    red fad,si, red' si, red'
    dod mi, la, dod' la, dod'

    %62
    si red, sold, si' sold, si'
    la dod, fad, la' fad, la'
    sold si, mi, sold' mi, sold'\mbreak

    %65
    sold dod, mi, sold' mi, sold'
    la dod, fad, la' fad, la'
    la sid, fad la' fad, la'

    %68
    sold sid, fad sold' fad, sold'
    sold dod, mi, sold' mi, sold'
    la dod, fad, la' fad, la'

    %71
    sid,(la') sold(fad) sold(red)
    mi dod sid8.\tr[dod16]
    dod8 mi, sold

    %74
    dod mi sold
    mi dod sold
    dod, mi sold\mbreak

    %77
    dod mi sold
    mi re dod
    sid4 r8

    %80
    mi red sold,
    la sold red'
    mi red sold,

    %83
    la sold red'
    mi red fad
    mi red fad

    %86
    mi fad red
    dod16(re mi fad sol8)~
    sol fad16(mi re dod)

    %89
    si(dod re mi fa8)~\mbreak
    fa mi16( re do si)
    la(si do re mib8)~

    %92
    mib re16(do si la)
    si(dod! re mi fa8)~
    fa mi16(re dod si)

    %95
    dod(re mi fad? sol8)~
    sol fad16(mi red dod)
    red(mi fad sold! la8)~

    %98
    la sold16(fad mid red)
    mid(dod sid dod) mid(dod)
    sold'(dod, si dod) mid(dod)

    %101
    si' dod,(sid dod mid dod)\mbreak
    re'8(dod) si
    la sold fad

    %104
    sold mid4
    fad8 la,16 la la la
    si8 la sold

    %107
    sold' si,16 si si si
    dod8 si la
    la' dod,16 dod dod dod

    %110
    re8 dod si
    si' re,16 re re re
    re8(dod) si

    %113
    si'(la) sold
    re(dod) si
    si'(la) sold\mbreak

    %116
    la r fad
    sold dod, mid
    <<{fad dod16 dod dod dod

       %119
       re8 dod dod
       fad dod16 dod dod dod
       re8 dod dod

       %122
       sold' sold16 la si sold
       la8 sold fad}\\{dod fad,16 fad fad fad
                       fad8 fad fad
                       dod' fad,16 fad fad fad
                       fad8 fad fad
                       dod' dod dod
                       dod dod dod}>>
    R4.

    %125
    <<{sold'8 dod,16 dod dod dod
       re8 dod si
       sold' dod,16 dod dod dod

       %128
       re8 dod si\mbreak
       sold' sold16 la si sold
       la8 sold fad}\\{dod mid,16 mid mid mid
                       mid?8 mid mid
                       dod' mid,16 mid mid mid
                       mid?8 mid mid\mbreak
                       dod' dod dod
                       dod dod dod}>>

    %131
    R4.
    <<{la'8 la16 la la la
       re,8 re16 re re re

       %134
       sold8 sold16 sold sold sold
       dod,8 dod16 dod dod dod
       fad8 fad16 fad fad fad

       %137
       si,8 si16 si si si
       re8 re16 re re re
       re8 re16 re re re}\\{fad8 fad16 fad fad fad
                            si,8 si16 si si si
                            mi8 mi16 mi mi mi
                            la,8 la16 la la la
                            re8 re16 re re re
                            sold,8 sold16 sold sold sold
                            mi8 mi16 mi mi mi
                            sold8 sold16 sold sold sold}>>

    %140
    dod mi la dod, si la\mbreak
    sold si mi re dod si
    dod mi la dod si la

    %143
    si si mi sold, fad mi
    fad la re fad, mi re
    mi sold dod mi, re dod

    %146
    re fad si re, dod si
    dod mi la dod, si la
    sold si mi re dod si

    %149
    dod8 mi,16 mi mi mi
    fad8 mi re\mbreak
    fad' fad,16 fad fad fad

    %152
    sold8 fad mi
    sold' sold,16 sold sold sold
    la8 sold fad

    %155
    la' la,16 la la la
    si8 la sold
    si' si,16 si si si

    %158
    dod la re la mi' la,
    fad' la, sold' la, la' la,
    si' la, dod' la, re' la,

    %161
    mi'' la,, fad'' la,, sold'' la,,\mbreak
    la''8 r16 mi mi la
    la dod, dod mi mi la

    %164
    si, sold sold si si mi
    mi si si mi mi si
    la fad fad la la re

    %167
    sold, mi mi sold sold dod
    fad, re re fad fad si
    mi, dod dod mi mi la

    %170
    re, si si re re sold
    dod, la la dod dod fad
    si, sold sold si si mi\mbreak

    %173
    la, fad fad la la re
    sold, mi mi re' re sold
    sold re re si' si re,

    %176
    dod8(si) mi,
    fad(mi) si'
    dod(si) mi,

    %179
    fad(mi) si'
    dod(si) re
    dod(si) re

    %182
    dod(re) si
    la4 si,8
    dod(si) re

    %185
    dod(si) re\mbreak
    dod(re) si
    la4 r8\break

    %188
    \MyCadenza
    mi''8 mi,16 mi mi mi
    fad8 mi re'

    %191
    dod(si) re
    dod(si) re
    dod(re) si

    %194
    la4 la'8
    si, la' sold
    la4.\fermata

}

IIIvlIn =  \relative do'' {

    la,8 dod mi
    la dod mi
    dod la mi

    %4
    la, dod mi
    la dod mi
    dod si la

    %7
    sold4 r8
    mi' mi,16 mi mi mi
    fad8 mi re
    fad' fad,16 fad fad fad

    %11
    sold8 fad mi
    sold' sold,16 sold sold sold
    la8 sold fad

    %14
    la' la,16 la la la
    si8 la sold\mbreak
    si' si,16 si si si

    %17
    dod8 si mi,
    fad mi si'
    dod si mi,

    %20
    fad mi si'
    dod si re
    dod si re

    %23
    dod re si
    la4 si,8
    dod si re

    %26
    dod si re
    dod re si
    la4 r8

    %29
    R4.*44
    dod8 mi sold

    %74
    dod mi sold
    mi dod sold
    dod, mi sold\mbreak

    %77
    dod mi sold
    mi re dod
    sid4 r8

    %80
    mi red sold,
    la sold red'
    mi red sold,

    %83
    la sold red'
    mi red fad
    mi red fad

    %86
    mi fad red
    dod4 r8
    R4.*17

    %105
    fad8 la,16 la la la
    si8 la sold

    %107
    sold' si,16 si si si
    dod8 si la
    la' dod,16 dod dod dod

    %110
    re8 dod si
    si' re,16 re re re
    re8(dod) si

    %113
    si'(la) sold
    re(dod) si
    si'(la) sold\mbreak

    %116
    la r fad
    sold dod, mid
    fad fad,16 fad fad fad

    %119
    fad8 fad fad
    fad fad16 fad fad fad
    fad8 fad fad

    %122
    mid mid16 mid mid mid
    fad8 fad fad
    fad' fad,16 fad fad fad

    %125
    mid8 mid16 mid mid mid
    mid?8 mid mid
    mid?mid16 mid mid mid

    %128
    mid8 mid mid\mbreak
    mid mid16 mid mid mid
    fad8 fad fad

    %131
    fad' fad,16 fad fad fad
    fad4 r8
    R4.*16

    %149
    dod'8 mi,16 mi mi mi
    fad8 mi re\mbreak
    fad' fad,16 fad fad fad

    %152
    sold8 fad mi
    sold' sold,16 sold sold sold
    la8 sold fad

    %155
    la' la,16 la la la
    si8 la sold
    si' si,16 si si si

    %158
    dod4 r8
    R4.*17
    dod8(si) mi,

    %177
    fad(mi) si'
    dod(si) mi,

    %179
    fad(mi) si'
    dod(si) re
    dod(si) re

    %182
    dod(re) si
    la4 si,8
    dod(si) re

    %185
    dod(si) re\mbreak
    dod(re) si
    la4 r8\break

    %188
    \salta
    mi''8 mi,16 mi mi mi
    fad8 mi re'

    %191
    dod(si) re
    dod(si) re
    dod(re) si

    %194
    la4 la'8
    si, la' sold
    la4.\fermata

}

IIIvlIIn = \relative do'' {

    la,8 dod mi
    la dod mi
    dod la mi

    %4
    la, dod mi
    la dod mi
    dod si la

    %7
    sold4 r8
    mi' mi,16 mi mi mi
    fad8 mi re
    fad' fad,16 fad fad fad

    %11
    sold8 fad mi
    sold' sold,16 sold sold sold
    la8 sold fad

    %14
    la' la,16 la la la
    si8 la sold\mbreak
    si' si,16 si si si

    %17
    dod8 si mi,
    fad mi si'
    dod si mi,

    %20
    fad mi si'
    dod si re
    dod si re

    %23
    dod re si
    la4 si,8
    dod si re

    %26
    dod si re
    dod re si
    la4 r8

    %29
    R4.*44
    dod8 mi sold

    %74
    dod mi sold
    mi dod sold
    dod, mi sold\mbreak

    %77
    dod mi sold
    mi re dod
    sid4 r8

    %80
    mi red sold,
    la sold red'
    mi red sold,

    %83
    la sold red'
    mi red fad
    mi red fad

    %86
    mi fad red
    dod4 r8
    R4.*17

    %105
    fad8 la,16 la la la
    si8 la sold

    %107
    sold' si,16 si si si
    dod8 si la
    la' dod,16 dod dod dod

    %110
    re8 dod si
    si' re,16 re re re
    re8(dod) si

    %113
    si'(la) sold
    re(dod) si
    si'(la) sold\mbreak

    %116
    la r fad
    sold dod, mid
    fad fad,16 fad fad fad

    %119
    fad8 fad fad
    fad fad16 fad fad fad
    fad8 fad fad

    %122
    mid mid16 mid mid mid
    fad8 fad fad
    fad' fad,16 fad fad fad

    %125
    mid8 mid16 mid mid mid
    mid?8 mid mid
    mid?mid16 mid mid mid

    %128
    mid8 mid mid\mbreak
    mid mid16 mid mid mid
    fad8 fad fad

    %131
    fad' fad,16 fad fad fad
    fad4 r8
    R4.*16

    %149
    dod'8 mi,16 mi mi mi
    fad8 mi re\mbreak
    fad' fad,16 fad fad fad

    %152
    sold8 fad mi
    sold' sold,16 sold sold sold
    la8 sold fad

    %155
    la' la,16 la la la
    si8 la sold
    si' si,16 si si si

    %158
    dod4 r8
    R4.*17
    dod8(si) mi,

    %177
    fad(mi) si'
    dod(si) mi,

    %179
    fad(mi) si'
    dod(si) re
    dod(si) re

    %182
    dod(re) si
    la4 si,8
    dod(si) re

    %185
    dod(si) re\mbreak
    dod(re) si
    la4 r8\break

    %188
    \salta
    mi''8 mi,16 mi mi mi
    fad8 mi re'

    %191
    dod(si) re
    dod(si) re
    dod(re) si

    %194
    la4 la'8
    si, la' sold
    la4.\fermata

}

IIIvlan =  \relative do' {

    dod8 la dod
    mi la dod
    la mi dod

    %4
    dod la dod
    mi la dod
    la sold fad

    %7
    si, si16 si si si
    dod8 dod dod
    la la16 la la la

    %10
    red8 red red
    si si16 si si si
    mid8 mid mid

    %13
    dod dod16 dod dod dod
    fad8 fad fad
    re? re16 re re re\mbreak

    %16
    sold8 sold16 sold sold sold
    la8 sold dod,
    re dod mi

    %19
    mi sold dod,
    re dod sold'
    la sold si

    %22
    la sold si
    la si sold
    la4 sold,8

    %25
    la sold si
    la sold si
    la si sold

    %28
    la4 r8
    R4.*44
    mi'8 dod mi

    %74
    sold dod mi
    dod sold mi
    mi dod mi\mbreak

    %77
    sold dod mi
    dod si la
    red,4 r8

    %80
    dod' sid mi,
    fad mi sid'
    dod sid mi,

    %83
    fad mi sid'
    dod sid red
    dod sid red

    %86
    dod red sid
    dod4 r8
    R4.*17

    %105
    dod,8 dod16 dod dod dod
    mid8 mid16 mid mid mid
    mid?8 mid sold

    %108
    la la16 la la la
    la8 la la
    sold sold16 sold sold sold

    %111
    sold8 sold sold
    si(la) sold
    re'(dod) si

    %114
    si(la) sold
    sold sold16 sold sold sold\mbreak
    dod,8 r dod'

    %117
    re sold, sold
    la4 r8
    R4.*5

    %124
    la,8 la16 la la la
    sold!4 r8
    R4.*5

    %131
    la8 la16 la la la
    la4 r8
    R4.*16

    %149
    dod8 dod dod
    la la16 la la la\mbreak
    red8 red red

    %152
    si si16 si si si
    mi8 mi mi
    dod dod16 dod dod dod

    %155
    re?8 re re
    sold, sold16 sold sold sold
    sold'8 sold sold

    %158
    mi4 r8
    R4.*17
    la8(sold) dod,

    %177
    re(dod) mi
    mi(sold) dod,
    re(dod) sold'

    %180
    la(sold) si
    la(sold) si
    la(si) sold

    %183
    la4 sold,8
    la(sold) si
    la(sold) si\mbreak

    %186
    la(si) sold
    la4 r8
    \salta

    %189
    dod8 dod16 dod dod dod
    re8 dod si'
    la(sold) si

    %192
    la(sold) si
    la \parentSlur (si) sold
    la4 mi8

    %195
    fad fad mi
    dod4.\fermata

}

IIIbcn = \relative do {

    la8 la16 la la la
    la8 la16 la la la
    la8 la16 la la la

    %4
    la8 la16 la la la
    la8 la16 la la la
    la8 la16 la la la

    %7
    mi'8 mi16 mi mi mi
    la,8 la la
    re8 re16 re re re

    %10
    si8 si si
    mi mi16 mi mi mi
    dod8 dod dod

    %13
    fad fad16 fad fad fad
    re8 re re
    sold sold16 sold sold sold\mbreak

    %16
    mi8 mi16 mi mi mi
    la8 mi la
    sold la mi

    %19
    la mi la
    sold la mi
    la mi mi

    %22
    la mi mi
    la re, mi
    la,4 r8

    %25
    la mi mi
    la mi mi
    la re, mi

    %28
    la4 r8
    la la' sold
    la la, sold\mbreak

    %31
    la si' la
    si si, la
    si dod' si

    %34
    dod dod, si
    dod re' dod
    re re, dod

    %37
    re mi' red
    mi mi, red
    mi sold mi

    %40
    la,4 r8
    mi' mi' mi,
    R4.

    %43
    mi8 mi' mi,\mbreak
    R4.
    mi8 mi' mi,

    %46
    R4.
    mi8 mi' mi,
    R4.

    %49
    mi8 mi' mi,
    si4 r8
    mi4 r8

    %52
    si4 r8
    mi4 r8
    si4 r8

    %55
    mi4 r8\mbreak
    si red si
    mi fad sold

    %58
    la si la
    sold4 r8
    si4 r8

    %61
    la4^\markup\italic"Per li Coglioni" r8
    sold4 r8
    fad4 r8

    %64
    mi4 r8\mbreak
    mi4 r8
    fad4 r8

    %67
    sid,4 r8
    sid?4 r8
    dod4 r8

    %70
    fad4 r8
    sold sid,4
    dod8 sold' sold,

    %73
    dod8 dod16 dod dod dod
    dod8 dod16 dod dod dod
    dod8 dod16 dod dod dod

    %76
    dod8 dod16 dod dod dod\mbreak
    dod8 dod16 dod dod dod
    dod8 dod16 dod dod dod

    %79
    sold'8 sid sold
    dod sold r
    sid, dod r

    %82
    dod' sold r
    sid, dod r
    dod' sold sold

    %85
    dod sold sold
    dod fad, sold
    dod,4.

    %88
    lad
    si?\mbreak
    sold!

    %91
    la
    fad
    sol

    %94
    sold!
    la
    lad

    %97
    si
    sid
    dod

    %100
    dod
    dod\mbreak
    si16 dod re8 mi

    %103
    fad sold la
    si dod dod,
    fad fad fad

    %106
    dod dod16 dod dod dod
    dod8 dod dod
    fad fad16 fad fad fad

    %109
    fad8 fad fad
    mid mid16 mid mid mid
    mid?8 mid mid

    %112
    mid?8 mid16 mid mid mid
    mid?8 mid16 mid mid mid
    mid?8 mid16 mid mid mid

    %115
    mid?8 mid16 mid mid mid\mbreak
    fad8 r la
    si dod dod,

    %118
    fad4 r8
    R4.*5
    fad8 fad16 fad fad fad

    %125
    dod4 r8
    R4.*5
    fad8 fad16 fad fad fad

    %132
    fad4 r8
    si4 r8
    mi,4 r8

    %135
    la4 r8
    re,4 r8
    sold4 r8

    %138
    sold4 r8
    sold4 r8
    la dod,[re]\mbreak

    %141
    mi sold mi
    la la, dod
    mi r r

    %144
    re' r r
    dod r r
    si r r

    %147
    la r r
    mi sold mi
    la, la la

    %150
    re re16 re re re\mbreak
    si8 si si
    mi mi16 mi mi mi

    %153
    dod8 dod dod
    fad fad16 fad fad fad
    fad8 fad fad

    %156
    mi mi16 mi mi mi
    mi8 mi mi
    la,4.~

    %159
    la~
    la~
    la\mbreak

    %162
    la8 la' la,
    la8 la' la,
    sold sold' sold,

    %165
    sold sold' sold,
    fad'4 r8
    mi4 r8

    %168
    re4 r8
    dod4 r8
    si4 r8

    %171
    la4 r8
    sold4 r8\mbreak
    fad4 r8

    %174
    mi4 r8
    mi'4 r8
    la mi la

    %177
    sold la sold
    la mi la
    sold la mi

    %180
    la mi mi
    la mi mi
    la re, mi

    %183
    la,4 r8
    la mi mi
    la mi mi\mbreak

    %186
    la re, mi
    la4 r8
    \salta

    %189
    la8 la16 la la la
    re8 la r
    la' mi mi

    %192
    la mi mi
    la re, mi
    la,4 dod8

    %195
    re re mi
    la,4.\fermopz

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*60
    <7>4 <6>8
    <7>4 <6>8
    <7>4 <6>8
    <7>4.
    <6>
    <5>

}

forma = {

    \key la\major
    \time 3/8
    \tempo 4. = 65
    s4.*196
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

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}

IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IVvln = \relative do'' {

    r16 la' sold fad mi fad mi re dod re dod si
    dod si la si dod si la si dod si dod re
    mi fad sold fad mi fad sold fad mi fad sold mi

    %4
    la si dod si la si dod si la si dod re\mbreak
    mi4. dod16[(re mi8) mi]
    mi,8[dod'16(re mi8 re mi dod)]

    %7
    re4. si16[(dod re8) re]
    mi,[si'16(dod re8 dod re si)]
    dod16 dod re mi mi, dod' re mi mi, dod' re mi

    %10
    mi,8 la4 dod8 re mi\mbreak
    fad,16 sold la sold fad sold la sold fad sold la sold
    fad8 si4 re8 mi fad

    %13
    sold,16 la si la sold la si la sold la si la
    sold8 dod4 mi8 fad sold
    la,16 si dod si la si dod si la si dod si\mbreak

    %16
    la8 la' dod,16 si dod la' dod, si dod la'
    si, la si re si la si re si la si re
    si la si sold' si, la si sold' si, la si sold'

    %19
    la, sold la dod la sold la dod la sold la dod\mbreak
    la sold la fad' la, sold la fad' la, sold la fad'
    sold, fad sold si sold fad sold si sold fad sold si

    %22
    sold fad sold mi' sold, fad sold mi' sold, fad sold mi'
    fad, mi fad la fad mi fad la fad mi fad la\mbreak
    fad mi fad re' fad, mi fad re' fad, mi fad re'

    %25
    <<{mi, mi mi mi fad mi fad mi sold mi sold mi(
    la) mi la mi si' mi, si' mi, dod' mi, dod' mi,(
    re') mi, re' mi, re' mi, re' mi, dod' mi, dod' mi, (

    %28
    si') mi, si' mi, si' mi, si' mi, dod' mi, dod' mi,(
    re') mi, re' mi, re' mi, re' mi, dod' mi, dod' mi,}

      \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"violin"
            \key la\major <<{mi8^\markup\italic"manoscritto" mi fad fad sold sold(
                             la) la si si dod dod(
                             re) re re re dod[dod](
                             si) si si si dod[dod](
                             re) re re re dod[dod]}\\{mi,2.
        mi
        mi
        mi
        mi}>>}>>
    <<si'4\\{mi,16 mi sold si}>> sold mi sold si sold mi sold si

    %31
    sold re sold si sold re sold si sold re sold si
    dod,8(la dod mi la mi)
    fa(red mi si do sold!)

    %34
    la(red, mi do' sib dod)
    re(mi fa sold!) la4~
    \terzinequarto\tuplet 3/2 { la8(sold fad!) sold[(fa mi)] fa(mi red) }

    %37
    re!4.(mi32 fad sold la si8)[dod,]
    re4.(mi32 fad sold la si8) [red,]
    mi la, si4.\tr la8

    %40
    la2.\fermata

}

forma = {

  \key la\major
  \time 3/4
  \tempo 2 = 60
  s2.*40
  \bar"||"

}

IVvl = {
  \IIglobal
  %\notypeset
  <<\IVvln \forma>>
  \typeset

}
#(set-global-staff-size 15)


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
        title = \markup\smaller {"Concerto per Pisendel [RV 340]"}
        composer = \markup \center-column{"   ""A. Vivaldi (1678-1741)"}
    }

    \markup\huge "[1.] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""Principale]"}
                \Ivl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

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

    \markup\huge "[2.] [Adagio]"

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
                \IIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

    \markup\huge "[3.] All[egr]o"

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
                \IIIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine #'hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

        systems-per-page = #12

    }

    \markup\huge "[3.bis] [Cadenza mov. III]"

    \score {

        \new Staff  = "main"
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"violin"
            \IVvl
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
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

}

