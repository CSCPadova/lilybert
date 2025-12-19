\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

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
    \terzine \con

}

IvlIn = \relative do'' {

    r2 fad4 la
    mi2~mi8 la, re[dod]
    si la16(si) dod8 si16(dod) re4. dod16(si)

    %4
    dod4. si16(la) si4 si'
    la4. sol16(fad) sol4. fad16(mi)
    fad4. mi8 re4 dod

    %7
    si r r2\mbreak
    r4 si'8 mi, fad fad fad16(sol) la(si)
    sol8 mi16(fad) sol8 sol sol fad16(mi) fad8 mi16(re)

    %10
    mi4 la4. sol16(fad) sol8 sol
    sol fad16(mi) fad8 sol16(la) fad4 mi
    re r\fermata la8 la la la

    %13
    si4. si8 mi,4 fad
    mi2 fad

}

IvlIIn = \relative do'' {

    fad4 la re,2~
    re8 dod16(si) dod8 mi fad4. fad8
    sold fad16(sold) la4. sol16(fad) sol4~

    %4
    sol8 fad16(mi) fad4. mi16(re) mi8 re
    dod la re4. dod16(si) dod4~
    dod16 re dod re si2 lad4

    %7
    si fad'8 si, dod dod dod16(red) mi(fad)\mbreak
    red8 si mi2 red4
    mi r8 si dod4 re?~

    %10
    re8 dod16(si) dod8 si16(la) si4. si8
    dod dod re[re] re4 dod
    re r\fermata fad,8 fad fad fad

    %13
    fad sol16(fad) mi8 re dod4 re~
    re dod re2

}

Ivlan = \relative do' {

    r2 re4 fad
    si, la8 la' la fad re[re]
    mi4. re16(mi) fad8 mi16(re) mi4~

    %4
    mi8 re16(dod) re4. mi16(fad) sol8 fad
    mi dod fad sol16(la) si8 la16(sol) la8 la
    la fad r sol fad4. mi8

    %7
    re si re[re] mi mi mi16(fad) sol(la)\mbreak
    fad 8red r si' do8. do16 si8 si
    si sol16(la) si(la) sol(fad) mi8 la16(sol) fad(la) sol(fad)

    %10
    mi8 mi16(re) dod(mi) re(dod) si8 dod16(re) mi(fad) sol (fad)
    mi8 la la[la] la4. sol8
    fad4 r\fermata re8 re re re

    %13
    re16(dod) si(la) sol8 sol la4 la
    la4. la8 la2

}

Ibcn = \relative do {

    re4 dod si fad
    sol la re2~
    re4 dod si mi

    %4
    la, re sol, sol'~
    sol fad mi la8 la,
    re4. mi8 fad4 fad,

    %7
    si si'~si la~\mbreak
    la sol la8 fad si[si,]
    mi4 r8 mi la4 re,

    %10
    la' la, mi' mi,
    la re la' la,
    re r\fermata re8 re re re

    %13
    sol,4 sol'~sol fad8 sol
    la4 la, re2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> <5> <6>
    <6 5> s <9> <8>
    <4+ 2> <6> <7> <7 _->
    <7> <7> <7> <6>8 <5>
    <4 2>4 <6> <7> <7>
    <7> <6> <6 4> <5 3+>
    s2 <4 2>4 <6>
    <4+ 2> <6> <6 5 _-> <_+>
    <_->2 <7>
    <5 4>4 <3> <5 4> <3->
    <7>2 <6 4>4 <5 3>
    s1
    <7>4 <6>8 <5> <4 2>2
    <5 4>4 <3>

}

forma = {

    \time 4/4
    \key re\major
    \tempo 4 = 50
    s1*13
    s2 s\fermata
    \bar"||"

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIvln = \relative do'' {

    fad4 sol8.\tr(fad32 sol) la4. la8
    si16(sol fad) sol mi sol fad sol la(fad mi) fad re fad mi fad
    sol(la fad) sol mi fad sol la fad(sol fad) sol la si la sol

    %4
    fad(sol fad) sol la si la sol fad(sol fad) sol la sol fad sol
    mi4. re16(dod) re4. dod16(si)
    dod8 re mi2 re4~

    %7
    re dod16 re dod re si dod re dod si8 mi\mbreak
    dod16 la dod re mi fad sold mi la mi fad sold la si sold la
    si mi, mi' re mi re dod si dod8 mi, la4~

    %10
    la16 la si la sold4\tr la8 dod si4
    la sold fad mi
    re4. dod16(si) dod re dod re mi8 re

    %13
    dod fad si, [mi] dod4 r
    dod re8.\tr(dod32 re) mi4. mi8
    fad16(re dod) re si re dod re mi(dod si) dod la dod si dod

    %16
    re(mi dod) re si dod re mi dod(re si) dod la dod si dod
    re(la sol) la re la sol la\mbreak re(si la) si re si la si
    mi(si la) si mi si la si mi(dod si) dod mi dod si dod

    %19
    fad(dod si) dod fad dod si dod fad sol fad mi re mi re dod
    si re dod si lad4 si16 fad' mi fad re si' la si
    sol (si, la si) sol'(si, la si) dod mi re mi dod la' sol la

    %22
    fad la sol la fad mi re dod si si' la si sol fad mi re
    dod dod' si dod la sol fad mi\mbreak re re' dod re si la sol fad
    mi mi' re mi dod si la sol fad8 sol la[sol]

    %25
    fad si mi,[la] fad fad mi4
    re dod si la
    sol4. fad16(mi) fad sol fad sol la8 sol

    %28
    fad si mi,[la] fad4 r

}

IIvlIn = \relative do'' {

    fad4 sol8.\tr(fad32 sol) la4. la8
    si4 r la r
    sol mi fad r8 mi

    %4
    fad4 r8 mi fad16 (sol fad) sol la sol fad sol
    mi4. re16(dod) re4. dod16(si)
    dod8 re mi2 re4~

    %7
    re dod16 re dod re si dod re dod si8 mi\mbreak
    dod la r4 mi' r
    si' sold dod8 mi, la4~

    %10
    la16 la si la sold4\tr la8 dod si4
    la sold fad mi
    re4. dod16(si) dod re dod re mi8 re

    %13
    dod fad si, [mi] dod4 r
    dod re8.\tr(dod32 re) mi4. mi8
    fad4 r mi r

    %16
    re si dod r
    re8 re re re\mbreak re4 r
    mi8 mi mi mi mi4 r

    %19
    fad8 fad fad fad fad16 sol fad mi re mi re dod
    si re dod si lad4 si r
    sol' r mi8 mi mi mi

    %22
    fad la, re[re,] r re' mi[mi,]
    r mi' fad[fad,]\mbreak r fad' sol[sol,]
    r sol' la16 si la sol fad8 sol la[sol]

    %25
    fad si mi,[la] fad fad mi4
    re dod si la
    sol4. fad16(mi) fad sol fad sol la8 sol

    %28
    fad si mi,[la] fad4 r

}

IIvlIIn = \relative do'' {

    re4 mi8.\tr(re32 mi) fad4. fad8
    sol4 r re r
    re dod re r8 dod

    %4
    re4 r8 dod re2~
    re8 dod16 si dod4. si16 la si4~
    si la8 sold fad sold la fad

    %7
    sold16 si la sold la2 sold4\mbreak
    la r dod r
    mi mi mi4. mi8

    %10
    si16 dod re dod si8 mi dod la'4 sold8~
    sold fad4 mi re dod8~
    dod si16 la si4. la16 si dod8 si

    %13
    la la la8. sold16 la4 r
    la si8.\tr(la32 si) dod4. dod8
    re4 r la r

    %16
    la sold la r
    la8 la la la\mbreak si4 r
    si8 si si si dod4 r

    %19
    dod8 dod dod dod re8. mi16 fad sol fad mi
    re fad mi re dod8 fad re si r4
    si r dod8 dod dod dod

    %22
    re fad, r la si si, r si'
    dod dod, r dod'\mbreak re re, r re'
    mi mi, r mi' re mi fad[mi]

    %25
    re re re8. dod16 re8 re4 dod8~
    dod si4 la sol fad8~
    fad mi16 re mi4. re16 mi fad8 mi

    %28
    re re re8. dod16 re4 r

}

IIvlan = \relative do' {

    la'4 r la8 sol fad16 sol fad mi
    re4 r fad r
    sol la la r8 la

    %4
    la4 r8 la la8. sol16 fad8 la
    la mi16 re dod8 la' la sold16 fad mi8 mi
    mi re dod si la4. re8

    %7
    si si la[mi'] fad re mi[mi]\mbreak
    mi dod r4 mi r
    mi sold mi4. mi8

    %10
    fad re mi[mi] mi4~mi16 fad mi re
    dod4~dod16 re dod si la4. la'8~
    la sold16 fad mi8 mi mi8. re16 dod8 re

    %13
    mi la, r mi' mi4 r
    mi r mi8 re dod16 re dod si
    la4 r  dod r

    %16
    re mi mi r
    fad8 fad fad fad\mbreak re4 r
    sold8 sold sold sold mi4 r

    %19
    dod8 dod dod dod si8. dod16 re8 mi
    fad sol r fad fad re r4
    mi r mi8 mi mi mi

    %22
    re4 r8 re re4 r8 sol16 fad
    mi4 r8 la16 sol\mbreak fad4 r8 si16 la
    sol4 r8 dod16 si la8 sol fad[sol]

    %25
    la re, r la' la4~la16 si la sol
    fad4~fad16 sol  fad mi re4. re8~
    re dod16 si la8 la la8. sol16 fad8 sol

    %28
    la re r la la4 r

}

IIbcn = \relative do {

    re4 r re8 mi fad re
    sol4 r fad r
    mi la re, r8 la'

    %4
    re,4 r8 la' re, mi fad re
    la'4. la8 fad4 sold
    la dod, re8 mi fad re

    %7
    mi mi fad[dod] re si mi[mi,]\mbreak
    la4 r la' r
    sold mi la4. dod,8

    %10
    re si mi[mi,] la4 mi'
    fad dod re la
    fad' sold la la,8 si

    %13
    dod re mi[mi,] la4 r
    la r la8 si dod la
    re4 r dod r

    %16
    si mi la, r
    fad'8 fad fad fad\mbreak sol4 r
    sold8 sold sold sold la4 r

    %19
    lad8 lad lad lad si4 si,8 dod
    re mi fad fad, si4 r
    mi r la8 la la la

    %22
    re,4 r8 fad sol sol, r sol'
    la la, r la'\mbreak si si, r si'
    dod dod, r dod' re4 re,8 mi

    %25
    fad sol la la, re4 la'
    si fad sol re
    si dod re4. mi8

    %28
    fad sol la la, re4 r

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    s1*12
    s2 s4 s\fermata
    \bar ":..:"\break
    s1*14
    s2 s4 s\fermata
    \bar":|."

}


IIvl= {
    \global
    \notypeset
    <<\IIvln \forma>>

}


IIvlI = {
    \global
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

IIIvln = \relative do'' {

    r2 r16 sol' sol16. dod,32 dod8 dod
    dod16. fad32 fad16. fad32 fad16. mi32 mi16. mi32 mi16. re32 re16. re32 re16. dod32 dod16. dod32
    dod16. si32 si16. si32 si16. la32 la16. dod32 re16. fad32 mi16. re32 re8 dod

    %4
    si16. dod32 si16. dod32 re[(dod re) mi] fad(mi fad) re sol re(dod re) sol[re(dod re)] sol16 la,32(si dod64 re mi fad sol32. fad64)\mbreak
    fad8~fad32 re(dod re) mi[si(lad si)] dod(fad mi) fad re(mi re) dod si[(dod si) dod] re(fad si) fad re[(fad si) fad]
    sold dod,(si dod) la'[dod,(si dod)] sold' si,(la si) sold'[si, (la si)] la32(dod si dod re mi fad si64) sold la8 sold

    %7
    fad16 dod dod16. dod32 re4~re16. dod32 si16. re32 mi4~
    mi16. re32 dod16. mi32 fad4~fad16. mi32 re8~re16. re32 mi16. mi32\mbreak
    mi16. dod32 fad16. re32 sol16. fad32 sol16. la32 fad16. la32 sol16. fad32 fad8 mi

    %10
    re16. mi32 re16. mi32fad(la sol) la si[(fad sol) re] mi(sol fad) sol mi[(sol fad) sol] la(si la) sol la[(mi fad) dod]
    re(fad mi) fad re[(fad mi) fad] sol(la sol) fad sol[(re mi) si] dod(mi re) mi dod[(mi re) mi] fad(sol fad) mi fad[(dod lad) fad]
    re'16(dod si) fad' sol(si, dod) sol' fad(dod si) fad' mi(si' lad) dod,\mbreak

    %13
    re32 fad(mi fad sol lad si dod64 re) lad8. si16 si4 r16 sol sol16. sol32
    sol16. fad32 fad16. fad32 fad16. mi32 mi16. re32 re16. dod32 re16. mi32 re8 dod
    si re16. si32 fad'2 mi4

    %16
    fad1\fermata

}

IIIvlIn = \relative do'' {

    r2 r16 sol' sol16. dod,32 dod8 dod
    dod16. fad32 fad16. fad32 fad16. mi32 mi16. mi32 mi16. re32 re16. re32 re16. dod32 dod16. dod32
    dod16. si32 si16. si32 si16. la32 la16. dod32 re16. fad32 mi16. re32 re8 dod

    %4
    si4 r r2
    R1*2
    r16 dod dod16. dod32 re4~re16. dod32 si16. re32 mi4~

    %8
    mi16. re32 dod16. mi32 fad4~fad16. mi32 re8~re16. re32 mi16. mi32\mbreak
    mi16. dod32 fad16. re32 sol16. fad32 sol16. la32 fad16. la32 sol16. fad32 fad8 mi
    re4 r r2

    %11
    R1*2
    r2 r4 r16 sol sol16. sol32
    sol16. fad32 fad16. fad32 fad16. mi32 mi16. re32 re16. dod32 re16. mi32 re8 dod

    %15
    si re16. si32 fad'2 mi4
    fad1\fermata

}

IIIvlIIn = \relative do'' {

    r16 fad fad16. si,32 si8 si si8. si16 si8 si
    lad16. lad32 lad16. lad32 si16. si32 dod16. dod32 fad,16. fad32 fad16. fad32 sol16. sol32 sol16. sol32
    fad16. fad32 fad16. fad32 mi16. mi32 mi16. mi32 re16. re'32 dod16. si32 si8 lad

    %4
    si4 r r2
    R1*2
    r4 r16 la la16. la32 si4~si16. la32 sol16. si32

    %8
    dod4~dod16. si32 la16. dod32 re8. dod16 si16. la32 sol16. si32\mbreak
    dod16. la32 re4 dod8 re16. fad32 mi16. re32 re8 dod
    re4 r r2

    %11
    R1*2
    r2 r16 re re16. re32 re16. do32 do16. si32
    lad16. lad32 si16. si32 dod?16. dod32 lad16. lad32 si16. lad32 si16. dod32 si8 lad

    %15
    si4 r8 dod16. fad,32 si8 dod16 re dod8. si16
    lad1\fermata

}

IIIvlan = \relative do' {

    re8. mi16 fad8 re sol8. sol16 sold8 mid
    fad16. dod32 dod16. dod32 si16. si32 lad16. dod32 re16. re32 re16. re32 mi16. mi32 mi16. dod32
    re16. re32 re16. si32 dod16. dod32 dod16. lad32 si16. si32 sol'16.[sol32] fad8. mi16

    %4
    re8 si r4 r2\mbreak
    R1*2
    r4 r16 fad' fad16. fad32 re8 sol16. fad32 mi16. mi32 mi16. mi32

    %8
    dod8 la'16. sol32 fad16. fad32 fad16. fad32 re16. dod32 si8~si16. fad'32 sol16. sol32\mbreak
    mi16. mi32 la16. la32 si8 la la16. la32 si16. si32 la8. sol16
    fad8 re r4 r2

    %11
    R1*2\mbreak
    r2 r16 fad fad16. fad32 sol16. mi32 mi16. re32
    dod16. dod32 si16. si32 lad16. lad32 dod16. dod32 si16. si32 sol'16.[sol32] fad8. mi16

    %15
    re8 si r fad' sol4. sol8
    dod,1\fermata

}

IIIbcn = \relative do {

    si8. dod16 re8 si mi8. mi16 mid8 dod
    fad fad, sold[lad] si si' mi,[la]
    re, sol dod,[fad] si, mi fad[fad,]

    %4
    si4 r8 si' mi, mi la[la]\mbreak
    re, fad sold[lad] si si, r si'
    mid, fad fad[mid] fad si dod[dod,]

    %7
    fad4 r16 fad fad16. fad32 sol4~sol16. fad32 mi16. sol32
    la4~la16. sol32 fad16. la32 si8. la16 sol16. fad32 mi16. sol32\mbreak
    la8 fad mi[la] re, sol la[la,]

    %10
    re re re'[re] re re dod[dod]
    dod dod si[si] si si lad[lad]
    si si, mi[la] re, sol dod,[fad]\mbreak

    %13
    si, mi fad[fad,] si16 si si16. si32 mi8 mi
    fad sold lad[fad] si, mi fad[fad,]
    si si fad[fad] sol2

    %16
    fad1\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 s8. <6 5>16 <6 5>4
    <_+> <7>16. <6>32 <6 5>8 <5 4> <3!> <7> <7>
    <7> <7> <7> <_+> s4 <6 4>8 <5 3+>
    s2 <7>4 <7>
    s8 <6> <6 5> <6> <9> <8> s4
    <6>8 <5> <4 2> <6 5> s4 <6 4>8 <5+ 3+>
    s4 s16 <6> s8 <5>4 <6>
    <5> <6> s2
    s8 <6> <7> <7> s4 <6 4>8 <5 3>
    s4 <5>8 <6> <4 2>4 <6>
    <4 2> <6> <4 2> <6>
    s <7>8 <7> <7> <7> <7> <7 _+>
    s <6 5> <_+>4 s <7>8 <6->
    <_+>4 s <7> <6 4>8 <5 3+>
    s4 <6> <7> <6>
    <_+>1

}

forma = {

    \time 4/4
    \key si\minor
    \tempo 4 = 40
    s1*16
    \bar"||"

}


IIIvl = {
    \global
    \notypeset
    <<\IIIvln \forma>>

}


IIIvlI = {
    \global
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

IVvln = \relative do'' {

    r8 la re fad la sol
    la re, fad la re dod
    re4 fad, mi

    %4
    fad mi re
    dod8 mi, la dod mi re
    mi la, dod mi la sold

    %7
    la4 dod si
    dod si la
    sold8 mi sold si mi red

    %10
    mi mi, sold si mi si
    dod(si la) si dod re
    si(mi re) mi si mi\mbreak

    %13
    la,(re dod) re la re
    sold,(dod si) dod sold dod
    fad,(si la) si fad si

    %16
    mi,(la sold) la mi la
    fad(sold fad) mi re la
    re mi dod4.\tr si8

    %19
    dod mi, la dod mi re
    mi la, dod mi la mi
    fad la, re fad la sol

    %22
    la re, fad la re la
    si(sol si) re si re
    la(fad la) re la re

    %25
    sol, sol la si la sol\mbreak
    fad(mi re) mi fad sol
    mi(la sol) la mi la

    %28
    re,(sol fad) sol re sol
    dod,(fad mi) fad dod fad
    si,(mi re) mi si mi

    %31
    la,(re dod) re la re
    si(dod si) la sol re
    sol la fad4. mi8

    %34
    fad re fad la re dod
    re re, fad la re la
    si sol si re mi re

    %37
    mi mi, sold si mi si
    dod la dod mi fad mi
    fad fad, lad dod fad dod\mbreak

    %40
    re si re fad si fad
    sol4 fad2~
    fad4 mi re~
    re do si

    %44
    mi8(fad mi) fad re fad
    mi re dod4. dod8
    si si red fad si lad

    %47
    si si, re fad si fad
    sold mi, sold si mi red
    mi mi, sold? si mi si

    %50
    dod la dod mi la sold
    la la, dod mi la mi
    fad(re fad) la mi la

    %53
    fad(re fad) la mi la
    fad(re fad) la si fad
    sol?(mi sol) si fad si

    %56
    sol(mi sol) si fad si\mbreak
    sol4 do si~
    si la sol~

    %59
    sol fa mi
    la8 si la si sol si
    la sol fad4. fad8

    %62
    mi mi, sold si mi red
    mi mi, sold si mi si
    dod la dod mi la sold

    %65
    la la, dod mi la mi
    fad(mi re) mi fad sol
    mi(la sol) la mi la

    %68
    re,(sol fad) sol re sol
    dod,(fad mi) fad dod fad
    si,(mi re) mi si mi

    %71
    la,(re dod) re la re
    si(dod si) la sol re
    sol la fad4.\tr mi8

    %74
    fad la re fad la sol
    la re, fad la re dod
    re4 la8 sol fad la

    %77
    sol fad mi fad re mi
    fad4 re dod
    re la la

    %80
    la2_\upl si\upl mi,_\upl
    fad2.\fermata

}

IVvlIn = \relative do'' {

    re4 r r
    la' r r
    re fad, mi

    %4
    fad mi re
    dod r r
    mi r r

    %7
    la dod si
    dod si la
    sold r r

    %10
    si r r
    dod r r
    si si si\mbreak

    %13
    la la la
    sold sold sold
    fad fad fad

    %16
    mi mi mi
    fad8 \parentSlur (sold fad) mi re la
    re mi dod4.\parenthesize \trill si8

    %19
    dod4 r r
    mi r r
    fad r r

    %22
    la r r
    si si si
    la la la

    %25
    sol8 sol la si la sol\mbreak
    fad4 r r
    mi mi mi

    %28
    re re re
    dod dod dod
    si si si

    %31
    la la la
    si8 \parentSlur (dod si) la sol re
    sol la fad4. mi8

    %34
    fad4 r r
    la r r
    si r r

    %37
    si r r
    dod r r
    dod r r\mbreak

    %40
    re r r
    sol fad2~
    fad4 mi re~

    %43
    re do si
    mi8 \parentSlur (fad mi) fad re fad
    mi re dod4. dod8

    %46
    si4 r r
    red r r
    mi r r

    %49
    mi r  r
    dod r r
    mi r r

    %52
    fad r mi
    fad r mi
    fad r si

    %55
    sol r fad
    sol r fad\mbreak
    sol do si~

    %58
    si la sol~
    sol fa mi
    la8 si la si sol si

    %61
    la sol fad4. fad8
    mi4 r r
    mi r r

    %64
    mi r r
    mi r r
    fad r r

    %67
    mi mi mi
    re re re
    dod dod dod

    %70
    si si si
    la la la
    si8(dod si) la sol re

    %73
    sol la fad4.\parenthesize \trill mi8\mbreak
    fad4 r r
    la' r r

    %76
    la la8 sol fad la
    sol fad mi fad re mi
    fad4 re dod

    %79
    re la la
    la2_\upl re\upl sol,_\upl
    fad2.\fermata

}

IVvlIIn = \relative do'' {

    fad4 r r
    fad r r
    fad la, la

    %4
    la2 si4
    mi, r r
    dod' r r

    %7
    dod mi mi
    mi2 fad4
    si, r r

    %10
    sold' r r
    la r r
    mi mi mi

    %13
    fad fad fad
    dod dod dod
    re re re

    %16
    la la la
    la r r
    la la4.\parenthesize \trill sold8

    %19
    la4 r r
    dod r r
    re r r

    %22
    fad r r
    sol sol sol
    re re re

    %25
    re dod dod\mbreak
    re r r
    la la la

    %28
    si si si
    fad fad fad
    sol sol sol

    %31
    re re re
    re r r
    re' re4. dod8

    %34
    re4 r r
    re r r
    re r r

    %37
    mi r r
    mi r r
    fad r r\mbreak

    %40
    fad r r
    mi re dod
    si2 la4

    %43
    sol2 fad4
    lad4. lad8 si[re]
    dod si lad4. lad8

    %46
    si4 r r
    si r r
    si r r

    %49
    dod r r
    la r r
    dod r r

    %52
    la r la
    la r la
    la r fad'

    %55
    si, r si
    si r si\mbreak
    si sol' fad

    %58
    mi2 re4
    do2 si4
    red4. red8 mi sol

    %61
    fad mi red4. red8
    mi4 r r
    si r r

    %64
    dod r r
    dod r r
    re r r

    %67
    la la la
    si si si
    fad fad fad

    %70
    sol sol sol
    re re re
    re r r

    %73
    re' re4. dod8\mbreak
    re4 r r
    fad r r

    %76
    fad fad8 mi re fad
    mi re dod re si dod
    re4 la la

    %79
    la fad mi
    fad2_\upl re_\upl dod_\upl
    re2.\fermopz

}

IVvlan = \relative do' {

    la'4 r r
    la r r
    la re, mi

    %4
    re mi8 fad sold4
    la r r
    mi r r

    %7
    mi la si
    la8 la, si dod red4
    mi r r

    %10
    si' r r
    la r r
    si si si\mbreak

    %13
    re, re re
    mi mi mi
    fad fad fad

    %16
    dod dod dod
    la r r
    fad' mi mi

    %19
    mi r r
    la r r
    la r r

    %22
    la r r
    sol sol sol
    la la la

    %25
    si la la\mbreak
    la r r
    dod, dod dod

    %28
    re re re
    la la la
    si si si

    %31
    fad' fad fad
    re r r
    si la la

    %34
    la r r
    la' r r
    sol r r

    %37
    mi r r
    mi r r
    dod r r\mbreak

    %40
    si r r
    si8 [dod] re mi fad mi
    re4 mi fad

    %43
    sol8 fad mi4 fad
    mi2 fad4
    sol8 si fad4. mi8

    %46
    red4 r r
    fad r r
    mi r r

    %49
    mi r r
    mi r r
    mi r r

    %52
    re r mi
    re r mi
    re r si

    %55
    si r red
    si r red\mbreak
    si mi fad

    %58
    sol la si
    mi, la si
    la2 si4

    %61
    dod fad, si
    sold r r
    sold? r r

    %64
    la r r
    la r r
    la r r

    %67
    dod, dod dod
    re re re
    la la la

    %70
    si si si
    fad' fad fad
    re4 r r

    %73
    si la la\mbreak
    la r r
    la' r r

    %76
    la fad8 sol la4
    si mi, la
    la fad mi

    %79
    fad fad la
    fad2\upl si,_\upl la_\upl
    la2.\fermata

}

IVbcn = \relative do {

    re4 r r
    re r r
    re re' dod

    %4
    re dod si
    la r r
    la r r

    %7
    la la sold
    la sold fad
    mi r r

    %10
    mi r r
    la r r
    sold sold sold\mbreak

    %13
    fad fad fad
    mi mi mi
    re re re

    %16
    dod dod dod
    re r r
    re mi mi,

    %19
    la r r
    la r r
    re r r

    %22
    re r r
    sol sol sol
    fad fad fad

    %25
    mi la la,\mbreak
    re r r
    dod dod dod

    %28
    si si si
    la la la
    sol sol sol

    %31
    fad fad fad
    sol r r
    sol' la la,

    %34
    re r r
    fad r r
    sol r r

    %37
    sold r r
    la r r
    lad r r\mbreak

    %40
    si r r
    mi, fad2
    sol fad4

    %43
    mi2 re4
    dod2 si4
    mi fad fad,

    %46
    si r r
    si r r
    mi r r

    %49
    mi r r
    la, r r
    la r r

    %52
    re r dod
    re r dod
    re r red

    %55
    mi r red
    mi r red\mbreak
    mi mi' re

    %58
    do2 si4
    la2 sol4
    fad2 mi4

    %61
    la si si,
    mi r r
    mi r r

    %64
    la, r r
    la r r
    re r r

    %67
    dod dod dod
    si si si
    la la la

    %70
    sol sol sol
    fad fad fad
    sol r r

    %73
    sol' la la,\mbreak
    re r r
    re r r

    %76
    re4. mi8 fad4
    sol la la,
    re fad la

    %79
    fad re dod
    re2\upl sol,_\upl la_\upl
    re2.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*2
    s2 <6>4
    s <6> <6+>
    s2.*2
    s2 <6>4
    s <6> <6+>
    <_+>2.
    <_+>
    s
    <6>
    <6>
    <6>
    <6>
    <6>
    s
    s4 <6 4> <5 3>
    s2.*5
    <6>2.
    <7>4 <7> s
    s2.
    <6>
    <6>
    <6>
    <6>
    <6>
    s
    s4 <6 4> <5 3>
    s2.
    <6>
    <5>
    <6>
    <5>
    <6>
    <_->
    s4 <6> <5>
    <7> <6> <6>
    <7> <6-> <6>
    <6+>2.
    <7>4 <_+> s
    <_+>2.
    <_+>
    <_+>
    <_+>
    s
    s
    s2 <6>4
    s2 <6>4
    s2 <6>4
    s2 <6>4
    s2 <6>4
    s <6-> <6>
    <7> <6> <6>
    <7-> <6-> <6>
    <6+> s <_->
    <6 5-> <_+> s
    <_+>2.
    <_+>
    s2.*3
    <6>2.
    <6>
    <6>
    <6>
    <6>
    s
    s4 <6 4> <5 3>
    s2.*6
    s2 <6 5>

}

forma = {

    \time 3/4
    \key re\major
    \tempo 2. = 72
    s2.*79
    \set Score.measureLength = #(ly:make-moment 6 4) s1.
    \set Score.measureLength = #(ly:make-moment 3 4) s2.
    \bar"|."

}


IVvl = {
    \global
    %\notypeset
    <<\IVvln \forma>>

}


IVvlI = {
    \global
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

\markup\huge\bold\fill-line {"Concerto a 4 [TalB CV1]"}
 \markup \fill-line {"  ""  ""M. Bitti (1656-1743)"}

  \markup \huge {[1.] Adagio}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
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

}

\bookpart {

\paper  {

  systems-per-page = #3

}

  \markup \huge {[2.] Allegro}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"P[ri]mo""Solo"}
          \IIvl
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
          \IIvlI
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
          \IIvlII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
          \IIvla
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
          \IIbc

        >>
      >>

    \layout {

      indent = 1.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
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

  \markup \huge {[3.] Adagio}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \IIIvl
        >>

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
          \IIIbc
        >>
      >>

    \layout {

      indent = 0\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
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

  \pageBreak

  \markup \huge {[4.] Allegro}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \IVvl
        >>

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

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \IVbc
        >>
      >>

    \layout {

      indent = 0\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
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
