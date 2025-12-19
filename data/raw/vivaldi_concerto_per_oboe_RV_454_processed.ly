\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = "up"

giu = \change Staff = "down"

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


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

Iobn = \relative do'' {

    re8 la'4 la la8~
    la la4 la8~la16 fa  mi re
    dod8 la'4 la la8~

    %4
    la la4 la8~la16 sol fa mi
    re8 la'4 la la8~
    la la4 la8~la16 fa mi re\mbreak

    %7
    dod8 si la4 r
    re8 re'4 la re,8~
    re re'4 sib sol8~

    %10
    sol do4 sol do,8~
    do do'4 la fa8~
    fa sib4 fa sib,8~

    %13
    sib sib'4 sol mi8~
    mi la4 mi la,8~
    la la'4 sol fa16 mi\mbreak

    %16
    fa8 re(dod) do(si) sib(
    la) la'(sold) sol(fad) fa(
    mi) re16 dod re8 [fa, mi dod']

    %19
    re re(dod) do(si) sib(
    la) la'(sold) sol(fad) fa(
    mi) re16 dod re8 [fa, mi dod']

    %22
    re la'4\solo fa mi16 re
    mi8 sol4 mi re16 do?\mbreak
    re8 fa4 re do16 sib

    %25
    la4 r r
    re8 la'4 fa mi16 re
    mi8 sol4 mi re16 do

    %28
    re8 fa4 re do16 sib
    la sol la si dod si dod re mi fa sol la
    fad8 la4 fad4 mi16 re

    %31
    sol8 sib?4 sol la16 sib
    mi,8 sol4 mi re16 do\mbreak
    fa8 la4 fa sol16 la

    %34
    sib, la sib do re do re mi fa mi fa sol
    la8 fa4 do sib16 la
    sib la sib do re do re mi fa mi fa sol

    %37
    la8 sol16 fa la8 sol16 fa sol8 fa16 mi
    fa8 do'4\tu do do8~
    do do4 do8~do16 la sol fa\mbreak

    %40
    mi8 do'4 do do8~
    do do4 do8~do16 sib la sol
    la8 fa(mi) mib(re) reb(

    %43
    do) do'(si) sib(la) lab(
    sol8) fa16 mi fa8[la, sol mi']
    fa8 do4\solo re do8

    %46
    sib sib4 do sib8
    la fa'4 sol fa8\mbreak
    fa4\tr mi r

    %49
    do16 sib la8 la'16 sol fa8 mib16 re do8
    re16 sib fa sib re sib fa sib re sib fa sib
    re do si8 si'16 la sol8 fa16 mi re8

    %52
    mi16 do sol do mi do sol do mi do sol do
    mi16 re dod8 sol'16 fa mi8 sib'16 la sol8
    fa16 re la re fa re la re fa re la re\mbreak

    %55
    fa re sold, re' fa re sold, re' fa re sold, re'
    mi si sold si mi si sold si mi si sold si
    mi do la do mi do la do mi do la do

    %58
    mi4 \stemDown \tuplet 3/2 { r16 la,(si do [si la]) mi' la,(si do[si la)]}
    fa'8 mi \tuplet 3/2 { r16 la,(si do [si la]) mi' la,(si do[si la)]}\stemNeutral \mbreak
    sold'8(la) red,(mi) si(do)

    %61
    sold(la) si4.\tr la8
    la mi'4 mi mi8~
    mi mi4 mi8~mi16 do si la

    %64
    si8 mi4\tu mi mi8~
    mi mi4 mi8~mi16 re do si
    do8 la'(sold) sol(fad) fa(\mbreak

    %67
    mi) mi(red) re(dod) do(
    si?) sold' la do, si! sold'
    la mi4\solo do si16 la

    %70
    mi'8 si4 sold fad16 mi
    la sold la si do si do re mi re mi fa
    sold,4 r8 sold si re

    %73
    dod mi16 re dod8 si16 la sol'8 fa16 mi\mbreak
    fa8 la4 fa mi16 re
    mi8 sol4 mi re16 do

    %76
    re8 fa4 re do16 sib?
    la sol la si dod si dod re mi re mi fa
    sol fa sol la sib? la sib sol la sol la mi

    %79
    fa8\tu re'4 la re,8~
    re re'4 sib sol8
    sol do4 sol do,8~\mbreak

    %82
    do do'4 la fa8~
    fa sib4 fa sib,8~
    sib sib'4 sol mi8~

    %85
    mi la4 mi la,8~
    la la'4 sol fa16 mi
    fa8\solo la~la16 sol fa mi re fa mi re

    %88
    mi8 sol~sol16 fa mi re do mi re do
    re8 fa~fa16 mi re do sib re do sib\mbreak
    la4 r16 la[si dod re mi fa sol]

    %91
    la8(sib? la sol fa mi)
    re16 sib? sol sib re sib sol sib re sib sol sib
    sol'8(la sol fa mi re)

    %94
    do16 la fa la do la fa la do la fa la
    fa'8(sol fa  mi re do)\mbreak
    sib(mi) mi(sib') sol(mi)

    %97
    dod(mi) la(mi) dod(la)
    fa'16 re la re fa re la re fa re la re
    fa8(re) si(re) fa(si,)

    %100
    sold(si) mi(re) dod(si)
    dod16 la dod mi dod la dod mi dod la dod mi\mbreak
    fa4 r16 la la fa fa re re mib

    %103
    mib?4 r16 sol sol mib! mib re re dod
    dod?4 r16 la la si si dod dod re
    re mi mi fa fa sol sol la la si si dod

    %106
    re4 r16 fa, mi re la' fa mi re
    la fa' mi re la' fa mi re la' fa mi re
    la fa' mi re mi4.\tr re8\mbreak

    %109
    re re'4 la re,8~
    re re'4 sib sol8
    sol do4 sol do,8~\mbreak

    %112
    do do'4 la fa8~
    fa sib4 fa sib,8~
    sib sib'4 sol mi8~

    %115
    mi la4 mi la,8~
    la la'4 sol fa16 mi
    fa8 re(dod) do(si) sib(

    %118
    la) la'(sold) sol(fad) fa(\mbreak
    mi) [re16 dod re8 fa, mi dod']
    re2.\fermata

}

IvlIn =  \relative do'' {

    re8 la'4 la la8~
    la la4 la8~la16 fa  mi re
    dod8 la'4 la la8~

    %4
    la la4 la8~la16 sol fa mi
    re8 la'4 la la8~
    la la4 la8~la16 fa mi re\mbreak

    %7
    dod8 si la4 r
    re8 re'4 la re,8~
    re re'4 sib sol8~

    %10
    sol do4 sol do,8~
    do do'4 la fa8~
    fa sib4 fa sib,8~

    %13
    sib sib'4 sol mi8~
    mi la4 mi la,8~
    la la'4 sol fa16 mi\mbreak

    %16
    fa8 re(dod) do(si) sib(
    la) la'(sold) sol(fad) fa(
    mi) re16 dod re8 [fa, mi dod']

    %19
    re re(dod) do(si) sib(
    la) la'(sold) sol(fad) fa(
    mi) re16 dod re8 [fa, mi dod']

    %22
    re4 re\p re
    do? do do\mbreak
    sib sib sol

    %25
    la8 sib la sol fa mi
    re4 re' re
    do do do

    %28
    sib sib sol
    la la dod,
    re re do!

    %31
    sib sib sib
    do do sib\mbreak
    la fa' fa

    %34
    re sib sib
    fa' fa fa
    re sib sib

    %37
    fa' fa do
    fa'8\f do'4 do do8~
    do do4 do8~do16 la sol fa\mbreak

    %40
    mi8 do'4 do do8~
    do do4 do8~do16 sib la sol
    la8 fa(mi) mib(re) reb(

    %43
    do) do'(si) sib(la) lab(
    sol8) fa16 mi fa8[la, sol mi']
    fa4 r r

    %46
    R2.*3
    do4\p do do
    re re re

    %51
    re re re
    mi mi mi
    mi mi mi

    %54
    fa fa fa\mbreak
    fa fa fa
    mi mi mi

    %57
    mi mi mi
    mi mi mi
    fa8 mi mi4 mi\mbreak

    %60
    sold r r
    R2.
    la,8 mi'4 mi mi8~

    %63
    mi mi4 mi8~mi16 do si la
    si8 mi4\f mi mi8~
    mi mi4 mi8~mi16 re do si
    do8 la'(sold) sol(fad) fa(\mbreak

    %67
    mi) mi(red) re(dod) do(
    si?) sold' la do, si! sold'
    la4 r r
    R2.*9

    %79
    re,8\f re'4 la re,8~
    re re'4 sib sol8
    sol do4 sol do,8~\mbreak

    %82
    do do'4 la fa8~
    fa sib4 fa sib,8~
    sib sib'4 sol mi8~

    %85
    mi la4 mi la,8~
    la la'4 sol fa16 mi
    fa4\p re re

    %88
    do do do
    sib sib sib\mbreak
    la8 sib la sol fa mi

    %91
    re fa re fa re fa
    sib,4 r r
    do8 mi do mi do mi

    %94
    la,4 r r
    sib8 re sib re sib re\mbreak
    sol,4 r r

    %97
    la8 dod la dod la dod
    re4 r r
    R2.*10

    %109
    re'8 re'4 la re,8~
    re re'4 sib sol8
    sol do4 sol do,8~\mbreak

    %112
    do do'4 la fa8~
    fa sib4 fa sib,8~
    sib sib'4 sol mi8~

    %115
    mi la4 mi la,8~
    la la'4 sol fa16 mi
    fa8 re(dod) do(si) sib(

    %118
    la) la'(sold) sol(fad) fa(\mbreak
    mi) [re16 dod re8 fa, mi dod']
    re2.\fermata

}

IvlIIn = \relative do'' {

    fa8 fa4 fa fa8~
    fa fa4 fa8~fa16 la sol fa
    mi8 mi4 mi mi8~

    %4
    mi mi4 mi8~mi16 mi re dod
    fa8 fa4 fa fa8~
    fa fa4 fa8~fa16 la sol fa\mbreak

    %7
    mi4 r r
    fad8 la4 fad la,8
    sib sib'4 sol re8

    %10
    mi sol4 mi sol,8
    la la'4 fa do8
    re fa4 re fa,8

    %13
    sol sol'4 mi sol,8
    dod mi4 dod mi,8~
    mi mi'4 dod la8\mbreak

    %16
    la re(dod) do(si) sib(
    la) la'(sold) sol(fad) fa(
    mi) re16 dod re8 [fa, mi dod']

    %19
    re re(dod) do(si) sib(
    la) la'(sold) sol(fad) fa(
    mi) re16 dod re8 [fa, mi dod']

    %22
    re4 re\p re
    do? do do\mbreak
    sib sib sol

    %25
    la8 sib la sol fa mi
    re4 re' re
    do do do

    %28
    sib sib sol
    la la dod,
    re re do!

    %31
    sib sib sib
    do do sib\mbreak
    la fa' fa

    %34
    re sib sib
    fa' fa fa
    re sib sib

    %37
    fa' fa do
    la''8\f la4 la la8~
    la la4 la8~la16 la sol fa\mbreak

    %40
    sol8 sol4 sol sol8~
    sol sol4 sol8~sol16 sol fa mi
    fa8 fa(mi) mib(re) reb(

    %43
    do) do'(si) sib(la) lab(
    sol8) fa16 mi fa8[la, sol mi']
    fa4 r r

    %46
    R2.*3
    la,4\p la la
    fa fa fa

    %51
    si si si
    sol sol sol
    la la la

    %54
    la la re\mbreak
    re re re
    re re re

    %57
    do do do
    do do do
    re8 do do4 do\mbreak

    %60
    si r r
    R2.
    do8 do4 do do8~

    %63
    do do4 do8~do16 do si la
    sold8 si4 si si8~
    si si?4 si8~si16 si la sold

    %66
    la8 la'(sold) sol(fad) fa(\mbreak
    mi) mi(red) re(dod) do(
    si?) sold' la do, si! sold'

    %69
    la4 r r
    R2.*9
    fa8\f la4 fa la,8

    %80
    sib sib'4 sol re8
    mi sol4 mi sol,8\mbreak
    la la'4 fa do8

    %83
    re fa4 re fa,8
    sol sol'4 mi sol,8
    dod mi4 dod mi,8~

    %86
    mi mi'4 dod la8
    la4\p re re
    do do do

    %89
    sib sib sib\mbreak
    la8 sib la sol fa mi

    %91
    re fa re fa re fa
    sib,4 r r
    do8 mi do mi do mi

    %94
    la,4 r r
    sib8 re sib re sib re\mbreak
    sol,4 r r

    %97
    la8 dod la dod la dod
    re4 r r
    R2.*10

    %109
    fa'8 la4 fa la,8
    sib sib'4 sol re8
    mi sol4 mi sol,8

    %112
    la la'4 fa do8
    re fa4 re fa,8
    sol sol'4 mi sol,8

    %115
    dod mi4 dod mi,8~
    mi mi'4 dod la8
    la re(dod) do(si) sib(

    %118
    la) la'(sold) sol(fad) fa(\mbreak
    mi) [re16 dod re8 fa, mi dod']
    re2.\fermata

}

Ivlan =  \relative do' {

    la'4 la la
    la la la
    la la la

    %4
    la la la
    la la la
    la la la\mbreak

    %7
    la la la
    la la la
    sol sol sol

    %10
    sol sol sol
    fa fa fa
    fa fa fa

    %13
    mi mi mi
    mi mi mi
    mi mi mi\mbreak

    %16
    re4 r r
    dod r r
    dod?8 mi la la, dod! mi

    %19
    fa4 r r
    dod r r
    dod?8 mi la la, dod! mi

    %22
    fa4 r r
    R2.*15
    do'4 do do

    %39
    do do do\mbreak
    do do do
    do do do

    %42
    do r r
    la r r
    mi do'8 la mi do'

    %45
    la4 r r
    R2.*3
    fa4\p fa fa

    %50
    sib, sib sib
    sol' sol sol
    do, do do

    %53
    dod dod dod
    re re re\mbreak
    sold, sold sold

    %56
    sold? sold sold
    la la la
    la la la

    %59
    la la la\mbreak
    mi' r r
    R2.

    %62
    mi4 mi mi
    mi mi mi
    mi mi mi

    %65
    mi mi mi
    mi r r\mbreak
    sold r r

    %68
    sold?8 si mi, do sold'! si
    do4 r r
    R2.*9

    %79
    la4 la la
    sol sol sol
    sol sol sol\mbreak

    %82
    fa fa fa
    fa fa fa
    mi mi mi

    %85
    mi mi mi
    mi mi mi
    re r r

    %88
    R2.*21
    la'4 la la
    sol sol sol

    %111
    sol sol sol
    fa fa fa
    fa fa fa

    %1114
    mi mi mi
    mi mi mi
    mi mi mi

    %117
    re r r
    dod r r\mbreak
    dod'8 la la fa dod la'

    %120
    fa2.\fermata

}

Ibcn = \relative do {

    re8 mi fa sol fa mi
    re mi fa mi fa re
    la si dod re dod si

    %4
    la si dod si la dod
    re mi fa sol fa mi
    re mi fa re fa sol\mbreak

    %7
    la si dod si dod la
    re, mi fad mi fad re
    sol la sib? la sib sib,

    %10
    do re mi re mi do
    fa sol la sol la la,
    sib do re do re sib

    %13
    mi fa sol fa sol sol,
    la si dod re dod si
    la si dod la si dod\mbreak

    %16
    re4 r r
    la r r
    la8 la' fa re la' la,

    %19
    re4 r r
    la r r
    la8 la' fa re la' la,

    %22
    re4 r r
    R2.*15
    fa,8 sol la sol la sol

    %39
    fa sol la sol fa fa'\mbreak
    do re mi re mi re
    do re mi re mi do

    %42
    fa4 r r
    fa r r
    do'8 sib la fa do' do,

    %45
    fa4 fa fa
    sol mi mi
    fa si, si\mbreak

    %48
    do8 re mi re mi do
    fa4 r r
    R2.*11

    %61
    mi8 do re si mi mi,
    la si do si do si
    la si do si la la'

    %64
    mi fad sold fad sold fad
    mi fad sold fad sold mi
    la,4 r r\mbreak

    %67
    mi' r r
    mi8 re do la mi' mi,
    la4 la' la

    %70
    sold sold sold
    la la,8 si do re
    mi4 mi mi

    %73
    la, la la\mbreak
    re re' re
    do do do

    %76
    sib sib sol
    la la la
    dod, dod dod

    %79
    re8 mi fa mi fa re
    sol la sib la sib sib,
    do re mi re mi do\mbreak

    %82
    fa sol la sol la la,
    sib do re do re sib
    mi fa sol fa sol sol,

    %85
    la si dod si dod si
    la si dod la si dod
    re4 r r

    %88
    R2.*4
    sol8 sib sol sib sol sib
    mi,4 r r

    %94
    fa8 la fa la fa la
    re,4 r r\mbreak
    mi8 sol mi sol mi sol

    %97
    dod,4 r r
    re8 fa re fa re fa
    sold,4 sold sold

    %100
    sold? sold sold
    la la la\mbreak
    re8 re' re, re' re, re'

    %103
    sol,, sol' sol, sol' sol, sol'
    la,2.\tasto~
    la

    %106
    re8 re' re, re' re, re'
    re, re' re, re' re, re'
    re,4 la' la,\mbreak

    %109
    re8 mi fa mi fa re
    sol la sib la sib sib,
    do re mi re mi do

    %112
    fa sol la sol la la,
    sib do re do re sib
    mi fa sol fa sol sol,

    %115
    la si dod si dod si
    la si dod la si dod
    re4 r r

    %118
    la r r\mbreak
    la'8[la16 sol fa8 re la' la,]
    re,2.\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*16
    <_+>2.
    s2.*27
    s2 <6>8 <5>
    s4 <5> <6 5>
    s <5> <6 5>
    s2.*30
    <6 5>2.
    s2.*20
    <7>2.
    <6 5>
    <_+>
    s <6->

}

forma = {

    \key re\minor
    \time 3/4
    \tempo 2 = 60
    s2.*120
    \bar"|."

}

Iob = {
    \Iglobal
    <<\Iobn \forma>>

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

}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IIobn = \relative do'' {

    re2\solo~re
    dod8 re16 mi la,8 sol fa8. mi16 re4
    fa'2~fa

    %4
    mi8 fa16 sol do,8 sib la8. sol16 fa8 fa'
    \tuplet 3/2 { sib16(la sib) sol[(fa sol)] } mi8 sib' sib\tr[la] r la\mbreak
    \tuplet 3/2 { sol16(fa sol) mi[(re mi)] } dod8 sol' sol\tr[fa] r fa

    %7
    sold, fa' mi16(re) do(si) do8 si16 la si4\tr
    la r mi'(fa)
    sold,8 fad16 mi sold(si re mi) dod(si la8) sol!16(dod mi) sol,\mbreak

    %10
    fa mi re8 r4 la''(sib)
    dod,8 si16 la dod16(mi sol) la fad8 mi16 re do!(fad la) do,
    sib? la sol8 sol'4~sol8 fa16 mi fa8 mi16 re

    %13
    dod8 la sib4~ sib8 do?16 sib la4~
    la8 sib16 la sol4~\mbreak sol8 mi'16[(re) dod(si) la(sol)]
    fa8 re r mi' fa mi16 re dod8.\tr re16

    %16
    re2~re4 mib8 sol
    dod,8 si16 la fa'4~fa8 mi16 re dod8.\tr re16
    re1\fermata

}


IIbcn = \relative do {

    re8 re mi mi fa fa sol sol
    la la dod, la re dod re mi
    fa fa sol sol la la sib sib

    %4
    do do mi, do fa sol la fa
    sol mi do mi fa sol la fa\mbreak
    mi dod la dod re mi fa re

    %7
    mi si sold[mi] la[la'] mi mi,
    la' la si si do do re re
    mi mi mi,[mi] la la la, la\mbreak

    %10
    re re  mi mi fa fa sol sol
    la la la, la re re re, re
    sol' la sib sol dod, dod' re sold,

    %13
    la re, r sol16 fa mi4. fa16 mi
    re4. mi16 re\mbreak dod4. dod8
    re mi fa dod re sol la la,

    %16
    re re mi mi fa fa sol sol
    la4 r8 re, sold,4 la
    re,1\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <_+>
    <5>
    s
    s4 <7> s2
    s4 <7> s2
    <_+>2 s4 <_+>
    s1
    <_+>2 <_+>
    s1
    <_+>2 <_+>4 <7>
    s2 <6 5>4 s8 <7>
    s2 <6 5>
    <6 5> <6 5>
    s1
    s2 s4 <6->
    <_+>2 <7>4 <_+>

}

forma = {

    \key re\minor
    \time 4/4
    \tempo 4 = 42
    s1*18
    \bar"|."

}

IIob = {
    \IIglobal
    <<\IIobn \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}



IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIobn = \relative do'' {

    sib4 la~la8 sol' fa mi
    fa16 mi re dod re8 la sib4 la~
    la8 sol' fa mi fa16 mi re dod re8 la'

    %4
    sib,4. sold'8 la mi dod la
    fad'2 sol16(la sib4.)
    mi,2 fa16(sol la4.)

    %7
    re,2\mbreak mib16(fa sol4.)
    sib,4 la~ la8 sol' fa mi
    sib4 la~ la8 sol' fa mi

    %10
    fa16 mi re dod re8 la fa4 mi~
    mi8 sol fa mi fa4 mi~
    mi8 sol fa mi  re4 r8 la'\solo

    %13
    re16 dod re fa mi re mi sol fa mi fa la sol fa sol sib\mbreak
    la8[sol16 fa mi8 re] dod si la la
    re16 dod re  fa mi re mi sol fa mi fa la sol fa sol sib

    %16
    la8[sol16 fa mi8 re] dod4 r8 la'
    fad16 mi fad la fad mi fad la sol fad sol sib sol fad sol sib
    mi, re mi sol mi re mi sol fa? mi fa la fa mi fa la\mbreak

    %19
    re, dod re fa re dod re fa mib re mib sol mib re mib sol
    dod, si dod mi re dod re fa mi re mi sol fa mi fa la
    sol fa sol sib la sol fa mi fa8 mi16 re dod8.\tr re16

    %22
    re4\tu la~la8 sol' fa mi
    fa16 mi re dod re8 la sib4 la~\mbreak
    la8 sol' fa mi fa16 mi re dod re8 la'

    %25
    sib,4. sold'8 la mi dod la
    dod la'\solo~la16 sol? fad mi fad[(sol la8) dod, la]
    si sol'~sol16 fa mi re mi[(fa sol8) si, sol]

    %28
    la fa'~fa16 mi re do si8 re~re16 do si la\mbreak
    sold8 mi'~mi16 re do si do si do mi re do re fa
    mi re mi fa re do re mi do si do mi re do re fa

    %31
    mi re mi fa re do re mi do la la si si do do re
    re mi mi fad fad sol sol la la mi re do si8.\tr la16
    la4\tu mi'~\mbreak mi8 re' do si

    %34
    do16 si la sold la8 mi fa4 mi~
    mi8 re' do si  do16 si la sold la8 mi
    la,4. red8 mi si sold mi

    %37
    do'4 si~si8 re do si
    do4 si~si8 re do si
    la16\solo si do8~do16 re mi fa\mbreak mi re do8~do16 si la sold

    %40
    la si do8 ~do16 re mi fa mi re do si la si do re
    mi4 r do16 re mi8~mi16 fa sol la
    sol fa mi8~mi16 re do si do re mi8~mi16 fa sol la

    %43
    sol fa mi re do re mi fa sol4 r\mbreak
    mi16 fa sol8~sol16 la sib? do la sol fa8~fa16 mi re do
    sol'16 fa mi8~mi16 re do sib fa' mi re8~re16 do sib la

    %46
    mi'16 re do8~do16 sib la sol re' do sib8~sib16 la sol fa
    mi do mi sol mi do mi sol fa do fa la fa do fa la
    sol mi sol sib sol mi sol sib la fa la do la fa la do\mbreak

    %49
    sib sol sib re sib sol sib re do la do mib do la do mib
    re sib re fa re sib re fa mi? do mi sol mi do mi sol
    fa do fa la sol do, mi sol fa do fa la sol do, mi sol

    %52
    la8 sol16 fa mi8.\tr fa16 fa4\tu do~
    do8 sib' la sol la16 sol fa mi fa8 do\mbreak
    re4 do~do8 sib' la sol

    %55
    la16 sol fa  mi fa8 do la'4 sol~
    sol8 sib la sol la4 sol~
    sol8 sib la sol fa do4\solo fa8~

    %58
    fa mib4 re16 do re8 sib4 re8~
    re fa4 mi16 re sol8 re4 sol8~\mbreak
    sol fa4 mi16 re mi8 do4 mi8~

    %61
    mi sol4 fa16 mi la8 mi4 la8~
    la sol4 fa16 mi fa8 re4 fa8~
    fa la4 sol16 fa la8 mi4 la8~

    %64
    la sol4 fa16 mi fa4\tu la,~
    la8 sol' fa mi\mbreak fa8 re re16\solo mi fa sol
    la sol fa mi re mi fa sol la sol fa mi re mi fa sol

    %67
    la sol fa mi re mi fa re sib' la sol fa sol fa mi re
    dod sol' fa mi mi8.\tr re16 re4\tu fad
    sol16(la sib4.) mi,2

    %70
    fa16(sol la4.) re,2
    mib16 fa sol4.\mbreak sib,4 la~
    la8 sol' fa mi sib4 la~

    %73
    la8 sol' fa mi fa16 mi re dod re8 la
    fa4 mi~mi8 sol fa mi
    fa4 mi~mi8 sol fa mi

    %76
    fa re' mi, dod' re2\fermata

}

IIIvlIn =  \relative do'' {

    sib4 la~la8 sol' fa mi
    fa16 mi re dod re8 la sib4 la~
    la8 sol' fa mi fa16 mi re dod re8 la'

    %4
    sib,4. sold'8 la mi dod la
    fad'2 sol16(la sib4.)
    mi,2 fa16(sol la4.)

    %7
    re,2\mbreak mib16(fa sol4.)
    sib,4 la~ la8 sol' fa mi
    sib4 la~ la8 sol' fa mi

    %10
    fa16 mi re dod re8 la fa4 mi~
    mi8 sol fa mi fa4 mi~
    mi8 sol fa mi  re4 r

    %13
    R1*9
    sib'4\f  la~la8 sol' fa mi
    fa16 mi re dod re8 la sib4 la~\mbreak
    la8 sol' fa mi fa16 mi re dod re8 la'

    %25
    sib,4. sold'8 la mi dod la
    r8 la\p dod la re fad, la fad
    r sol si sol do? mi, sol mi

    %28
    r fa la fa r re fa re\mbreak
    r mi sold mi la, la' fa re
    sold, sold' si mi, la, la' fa re

    %31
    sold, sold' si mi, la la, mi' [la]
    si do re mi do la mi4
    fa'4\f mi ~\mbreak mi8 re' do si

    %34
    do16 si la sold la8 mi fa4 mi~
    mi8 re' do si  do16 si la sold la8 mi
    la,4. red8 mi si sold mi

    %37
    do'4 si~si8 re do si
    do4 si~si8 re do si
    la4 r r2

    %40
    R1*12
    r2 re4 do~
    do8 sib' la sol la16 sol fa mi fa8 do\mbreak
    re4 do~do8 sib' la sol

    %55
    la16 sol fa  mi fa8 do la'4 sol~
    sol8 sib la sol la4 sol~
    sol8 sib la sol fa [fa,16\p sol la8 sol]

    %58
    fa[fa16 sol la8 fa] sib,[sib16 do re8 do]
    sib[sib16 do re8 do] si[si16 do re8 do]\mbreak
    si[si16 do re8 si] do[do16 re mi8 re]

    %61
    do[do16 re mi8 re] dod[dod16 re mi8 re]
    dod[dod16 re mi8 dod] re[re16 mi fa8 mi]
    re [re16 mi fa8 re] dod [dod16 re mi8 re]

    %64
    dod[dod16 re mi8 dod] sib'4\f la~
    la8 sol' fa mi\mbreak fa8 re r4
    R1*2

    %68
    r2 fad
    sol16(la sib4.) mi,2

    %70
    fa16(sol la4.) re,2
    mib16 fa sol4.\mbreak sib,4 la~
    la8 sol' fa mi sib4 la~

    %73
    la8 sol' fa mi fa16 mi re dod re8 la
    fa4 mi~mi8 sol fa mi
    fa4 mi~mi8 sol fa mi

    %76
    fa re' mi, dod' re2\fermata

}

IIIvlIIn = \relative do'' {

    sib4 la~la8 sol' fa mi
    fa16 mi re dod re8 la sib4 la~
    la8 sol' fa mi fa16 mi re dod re8 la'

    %4
    sib,4. sold'8 la mi dod la
    fad'2 sol16(la sib4.)
    mi,2 fa16(sol la4.)

    %7
    re,2\mbreak mib16(fa sol4.)
    sib,4 la~ la8 sol' fa mi
    sib4 la~ la8 sol' fa mi

    %10
    fa16 mi re dod re8 la fa4 mi~
    mi8 sol fa mi fa4 mi~
    mi8 sol fa mi  re4 r

    %13
    R1*9
    sib'4\f la~la8 sol' fa mi
    fa16 mi re dod re8 la sib4 la~\mbreak
    la8 sol' fa mi fa16 mi re dod re8 la'

    %25
    sib,4. sold'8 la mi dod la
    r8 la\p dod la re fad, la fad
    r sol si sol do? mi, sol mi

    %28
    r fa la fa r re fa re\mbreak
    r mi sold mi la, la' fa re
    sold, sold' si mi, la, la' fa re

    %31
    sold, sold' si mi, la la, mi' [la]
    si do re mi do la mi4
    fa'4\f mi ~\mbreak mi8 re' do si

    %34
    do16 si la sold la8 mi fa4 mi~
    mi8 re' do si  do16 si la sold la8 mi
    la,4. red8 mi si sold mi

    %37
    do'4 si~si8 re do si
    do4 si~si8 re do si
    la4 r r2

    %40
    R1*12
    r2 re4 do~
    do8 sib' la sol la16 sol fa mi fa8 do\mbreak
    re4 do~do8 sib' la sol

    %55
    la16 sol fa  mi fa8 do la'4 sol~
    sol8 sib la sol la4 sol~
    sol8 sib la sol fa [fa,16\p sol la8 sol]

    %58
    fa[fa16 sol la8 fa] sib,[sib16 do re8 do]
    sib[sib16 do re8 do] si[si16 do re8 do]\mbreak
    si[si16 do re8 si] do[do16 re mi8 re]

    %61
    do[do16 re mi8 re] dod[dod16 re mi8 re]
    dod[dod16 re mi8 dod] re[re16 mi fa8 mi]
    re [re16 mi fa8 re] dod [dod16 re mi8 re]

    %64
    dod[dod16 re mi8 dod] sib'4\f la~
    la8 sol' fa mi\mbreak fa8 re r4
    R1*2

    %68
    r2 fad
    sol16(la sib4.) mi,2

    %70
    fa16(sol la4.) re,2
    mib16 fa sol4.\mbreak sib,4 la~
    la8 sol' fa mi sib4 la~

    %73
    la8 sol' fa mi fa16 mi re dod re8 la
    fa4 mi~mi8 sol fa mi
    fa4 mi~mi8 sol fa mi

    %76
    fa re' mi, dod' re2\fermata

}

IIIvlan =  \relative do' {

    fa4 mi fa8 dod' re la~
    la la la mi fa4 mi
    fa8 dod' re la~la8 la la fa

    %4
    re2 dod
    la4 la' re,4. sib8
    sol4 sol' do,4. la8

    %7
    fa4 fa'\mbreak sib,4. sol'8
    fa4 mi fa8 dod' re mi,
    fa4 mi fa8 dod' re la~

    %10
    la la la mi fa, sol la sib
    dod4. la8 fa sol la sib
    dod4. dod8 la4 r

    %13
    R1*9
    fa'4\f mi fa8 dod' re la~
    la mi la mi fa4 mi\mbreak

    %24
    fa8 dod' re la~la mi la fa
    re2 dod
    r8 la'\p dod la re fad, la fad

    %27
    r sol si sol do? mi, sol mi
    r fa la fa r re fa re\mbreak
    r mi sold mi la, la' fa re

    %30
    sold, sold' si mi, la, la' fa re
    sold, sold' si mi, la la, mi' [la]
    si do re mi do la mi4

    %33
    do\f si do8 sold' la mi~
    mi mi mi si do4 si~
    si8 sold' la mi~ mi mi mi si

    %36
    do4 la' sold2
    do,8 re mi fa sold,4. mi'8
    do re mi fa sold,4. mi'8

    %39
    do4 r\mbreak r2
    R1*12
    r2 la'4 sol

    %53
    la8 mi fa do'~do do do sol\mbreak
    la4 sol la8 mi fa do'~
    do do do la la sib do re

    %56
    mi,4. do'8 la sib do re
    mi,4. do'8 la  [fa16\p sol la8 sol]

    %58
    fa[fa16 sol la8 fa] sib,[sib16 do re8 do]
    sib[sib16 do re8 do] si[si16 do re8 do]\mbreak
    si[si16 do re8 si] do[do16 re mi8 re]

    %61
    do[do16 re mi8 re] dod[dod16 re mi8 re]
    dod[dod16 re mi8 dod] re[re16 mi fa8 mi]
    re [re16 mi fa8 re] dod [dod16 re mi8 re]

    %64
    dod[dod16 re mi8 dod] fa4\f mi
    fa8 dod' re la~\mbreak la8 la r4
    R1*2

    %68
    r2 la,4 la'
    re,4. sib8 sol4 sol'
    do,4. la8 fa4 fa'

    %71
    sib,4. sol8\mbreak fa'4 mi
    fa8 dod' re mi, fa4 mi
    fa8 dod' re la~la la la mi

    %74
    fa, sol la sib dod4. la8
    fa sol la sib dod4. la8
    la la' la la fa2\fermata

}

IIIbcn = \relative do {

    re8 re' dod la re la fa dod
    re la' fa dod re re' dod la
    re la fa dod re la' fa re

    %4
    sol4 sib, la2
    re8 re' do la sib sol sib, sol
    do do' sib sol la fa la, fa

    %7
    sib sib' la fa\mbreak sol mib sib sol
    re' re' dod la re la fa dod
    re re' dod la re la fa dod

    %10
    re la' fa dod <<re4\\{re8 mi fa sol}>>
    la4 la, re8 mi fa sol
    la4 la, re8 mi fa mi

    %13
    re re'4 dod8 re re, mi4\mbreak
    fa sol la8 sol fa mi
    re re'4 dod8 re re, mi4

    %16
    fa sol la8 sol fa mi
    re re'4 do8 sib4 r
    do,8 do'4 sib8 la4 r\mbreak

    %19
    sib,8 sib'4 la8 sol4 r
    la8 sol fa re dod la' re, re'
    sib4 dod, re8 sol la la,

    %22
    re re' dod la re la fa dod
    re la' fa dod re re' dod la\mbreak
    re la fa dod re la' fa re

    %25
    sol4 sib, la2
    R1*7
    la8 la' sold mi\mbreak la mi do sold

    %34
    la mi' do sold la la' sold mi
    la mi do sold la mi' do la
    fa'2 mi

    %37
    la,8 si do re mi4 mi,
    la8 si do re mi4 mi,
    la la\mbreak la mi'

    %40
    la, la la la
    sold8 sold' la la, do'4 do
    do sol do do

    %43
    do do si8 sol do do,\mbreak
    do4 mi fa la
    mi sol re fa

    %46
    do do sib sib
    do do fa fa
    do do fa fa\mbreak

    %49
    sol sol la la
    sib sib do do
    fa, do' fa, do'

    %52
    fa,8 la do do, fa, fa' mi do
    fa do la mi fa do' la mi\mbreak
    fa fa' mi do fa do  la mi

    %55
    fa do' la fa' fa sol la sib
    do4 do, fa8 sol la sib
    do4 do, fa, r

    %58
    R1*6
    r2 re'8 re' dod la
    re la fa dod\mbreak re re, r4

    %66
    re' r re r
    re r sol r
    la la, re8 re' do do,

    %69
    sib' sol sib, sol do do' sib sib,
    la' fa la, fa sib sib' la la,
    sol' mib sib sol\mbreak re' re' dod la

    %72
    re la fa dod re re' dod la
    re la fa dod re la' fa dod
    re mi fa sol la4 la,

    %75
    re8 mi fa sol la4 la,
    re8 re la' la, re,2\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s4 <6+> <_+>2
    <_+>1
    s
    s2 <6->
    s1*5
    s8 <4 2>4 <6 5>8 s2
    s <_+>
    s8 <4 2>4 <6 5>8 s2
    s <_+>
    <_+>1
    s
    s2 <6->
    <_+>1
    s1*4
    s4 <6+> <_+>2
    s1*10
    <6+>2 <_+>
    s <_+>
    s <_+>
    s s4 <_+>
    s1
    s2 <5>4 <6>
    <5> <_!> <5> <6>
    <5>1
    s1*5
    s2 <6 5->
    <3>1
    s1*17
    s2 <_+>
    s1
    s
    <6->

}

forma = {

    \key re\minor
    \time 4/4
    \tempo 2 = 60
    s1*76
    \bar"|."

}

IIIob = {
    \IIIglobal
    <<\IIIobn \forma>>

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

}
#(set-global-staff-size 16.5)


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
        title = \markup\smaller {"Concerto per Oboe [RV 454]"}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}
    }

    \markup\huge "[1.] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff   <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hau[t]bois"}
                \set Staff.shortInstrumentName = "ob "
                \Iob
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.shortInstrumentName = "vl1 "
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.shortInstrumentName = "vl2 "
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc "
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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

        systems-per-page = #6

    }

    \markup\huge "[2.] Largo"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff   <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hau[t]bois"}
                \set Staff.shortInstrumentName = "ob "
                \IIob
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc "
                \IIbc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #12
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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

    \markup\huge "[3.] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff   <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hau[t]bois"}
                \set Staff.shortInstrumentName = "ob "
                \IIIob
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.shortInstrumentName = "vl1 "
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.shortInstrumentName = "vl2 "
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc "
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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
