\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

cadenza_vcI = \relative do {

    \tempo 4 = 65 fa'8 _\markup\italic "And[ant]e sostenuto"^\markup\italic "Cadenza" la4 sol16 fa fa(mi sol fa la sol fa mi)
    fa8 la4  sol16 fa fa(mi sol fa) la (sol fa mi)

    %4
    fa8 r r32 la,(re la fa'[la, re la)] dod8 r r32 la(mi' la,  sol'[la, mi' la,)]
    fa'8 r r32 la,(re la fa'[la, re la)] dod8 r r32 la(mi' la,  sol'[la, mi' la,)]
    \slashedGrace sol'16 fa16 mi32 fa re-![re(mi re)] dod-![ dod(re dod)] mi-! [mi(fa mi)] re-![re(mi re)]  fa-![fa(sol fa)] mi-! [mi(fa mi)] sol-![sol(la sol)]

    %7
    fa-![fa(sol fa)] re-![re(mi re)] dod-![dod(re dod)] mi-! [mi(fa mi)] re-![re(mi re)]  fa-![fa(sol fa)] mi-! [mi(fa mi)] sol-![sol(la sol)]
    fa16 \clef violin\key re\minor la8[la la16(re do)]   sib sib8 sib sib16 dod8\noBeam\trill
    re16 la8 la la16 re[(do)] sib sib8 sib sib16 dod8\noBeam\trill

    %10
    re16 re-! re-! re-! mi8. (fa32 sol) fa(re fa la re[la fa re)] mi8.(fa32 sol)
    fa16 re re re mi8. (fa32 sol) fa(re fa la re[la fa re)] mi8.(fa32 sol)
    sol(fa mi fa mi fa sol mi)  sol(fa mi fa mi fa sol mi) sol(fa mi fa mi fa sol mi) sol(fa mi fa mi fa sol mi)

    %13
    fa16-! fa-! fa-! fa-! sol-! sol-! sol-! sol-! la-! la-! la-! la-! sib-! sib-! sib-! sib-!
    \clef bass \key re\minor la,,,2.\f\fermata dod8(mi)
    \clef tenor \key re\minor sol\f(sib! dod mi sol\p sib la sol)

    %16
    fa(mi re dod sib! la sol fa)
    mi fa sol la sib-! sib(la sol)
    fa16(la) re8~re16 dod mi8~mi16 re fa8~fa16 mi sol8

    %19
    \slashedGrace sol16 fa(mi32 fa mi fa sol mi) \slashedGrace sol16 fa(mi32 fa mi fa sol mi) \slashedGrace sol16 fa(mi32 fa mi fa sol mi) \slashedGrace sol16 fa(mi32 fa mi fa sol mi)
    \tempo 4 = 55 fa8\f^\markup\italic "Adagio" fa fa fa fa4. r16 re

}

cadenza_vcII = \relative do {

    \tempo 4 = 65 re16_\markup\italic "And[ant]e sostenuto"(fa' re, fa') re,(fa' mi re) <<{\slurDown re (dod mi re)}\\la8>> fa'16(mi re dod)
    re (fa re, fa' re, fa' mi re) re(dod mi re fa mi re dod)
    re32(re, mi fa sol la si dod) re8 r r32la(dod la) mi' [dod la mi] dod8 r

    %4
    r32 re (mi fa sol la si dod) re8 r r32 la(dod la) mi'[dod la mi] dod8 r
    re8(fa mi sol) fa\noBeam re'32-! re (mi re) dod-![ dod(re dod)] mi-! [mi(fa mi)]
    re-![re(mi re)]  fa-![fa(sol fa)] mi-! [mi(fa mi)] sol-![sol(la sol)] fa-![fa(sol fa)] re-![re(mi re)] dod-![dod(re dod)] mi-! [mi(fa mi)]

    %7
    re,16(fa' re, fa' re, fad' re, fad') re,(sol' re, sol' re, sol' re, sol')
    re,16(fa'! re, fa' re, fad' re, fad') re,(sol' re, sol' re, sol' re, sol')
    fa fa\trill \clef violin\key re\minor la re dod(sib!) la32[dod re mi] re8[r16 re] dod(sib!) la32[(dod re mi)]

    %10
    re32[fa, fa16_\trill la re] dod(sib!) la32[(dod re mi)] re8[r16 re] dod(sib!) la32[(dod re mi)]
    mi(re dod re dod re mi dod) mi(re dod re dod re mi dod) mi(re dod re dod re mi dod) mi(re dod re dod re mi dod)
    re16-! re-! re-! re-! mi-! mi-! mi-! mi-! fa-! fa-! fa-! fa-! sol-! sol-! sol-! sol-!

    %13
    \clef bass \key re\minor la,,,2.\fermata\f ~la8(dod)
    mi\f(sol sib! dod) \clef tenor \key re\minor mi\p( sol fa mi)
    re(dod sib la) sol(fa mi re)

    %16
    dod(re mi fa) sol-!\noBeam sol(fa mi)
    re8. fa16 <<{mi8 sol fa8. re'16 re dod mi8}\\{la,,4 la8. s16 la'8 la}>>
    \slashedGrace mi'16 re(dod32 re dod re mi dod) \slashedGrace mi16 re(dod32 re dod re mi dod) \slashedGrace mi16 re(dod32 re dod re mi dod) \slashedGrace mi16 re(dod32 re dod re mi dod)

    %19
    \tempo 4 = 55  <<{s8\f _\markup\italic "Adagio" re re re re2}\\{re8 sib la sold la2 }>>
    \tempo 4 = 60  <<dod1\trill\fermata\\la>>

}

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "tutti"

pf = _\markup { \italic poco \dynamic f}

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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
        \musicglyph "scripts.prall"
    }
}


mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

Ifln =\relative do'' {

    do2.\f
    do'\p
    re,\f

    %4
    re'\p
    do,\f
    do'\p

    %7
    do,\f \mbreak
    si8.(do16) do4 r
    R2.*9

    %18
    mi8\dolce(fa sol la sib do)~
    do8 \slashedGrace do16 sib16 la sol8 la \slashedGrace sib16 la8 sol16  fa
    mi8(fa sol la sib do)~

    %21
    do8 \slashedGrace do16 sib16 la sol8 la \slashedGrace sib16 la8 sol16  fa
    mi4 re2
    do do'4~

    %24
    do \slashedGrace do8 sib la sib4\mbreak
    la8\noBeam la32(sib do re) do8 do, \f la fa
    do' sol'32\dolce(la sib sol) do8 do,\f la fa

    %27
    do'4 r r
    R2.\fermata^\markup\italic\center-align "Attacca subito."

}

IvlIn =\relative do'' {

    do2.\f~
    do8 r4 r r8
    re2.~

    %4
    re8 r4 r r8
    do2.~
    do8 r4 r r8

    %7
    do2.\f
    si8.(do16) do4 r
    la8.\p(sib!16) sib4 r

    %10
    sol8.(lab16) lab4 r
    solb4.\pp solb16.\f\tr fa64 solb sib8 reb
    reb?8.(sib16) solb8 solb4 solb8

    %13
    solb4.  solb16.\tr fa64 solb sib8 reb
    reb?8.(sib16) solb8 solb4 fa8
    mi!2._\markup {\italic po \dynamic f}

    %16
    fa8. sol!16\dolce sol2\tr
    lab8 lab4\rinf lab sol16 fa
    mi8\p(fa sol la! sib do)~

    %19
    do \slashedGrace do16 sib16 la sol8 (la \slashedGrace sib16 la8 sol16 fa)
    mi8(fa sol la sib do)~
    do \slashedGrace do16 sib16 la sol8 (la \slashedGrace sib16 la8 sol16 fa)

    %22
    mi4 re2
    do do'4~
    do \slashedGrace do8 sib la sib4\mbreak

    %25
    la8 r r do\f la fa
    do\p do4 do'8\f la fa
    do\p do4 do do8

    %28
    do2.\fermata

}


IvlIIn =\relative do'' {

    <<{la8\f la4 la la8}\\{fa fa4 fa fa8}>>
    la16\p fa fa8_\tr la16 fa fa8_\tr la16 fa fa8_\tr
    <<{sib8\f sib4 sib sib8}\\{re, re4 re re8}>>

    %4
    sib'16\p fa fa8_\tr sib16 fa fa8_\tr sib16 fa fa8_\tr
    <<{la8\f la4 la la8}\\{fa fa4 fa fa8}>>
    la16\p fa fa8_\tr la16 fa fa8_\tr la16 fa fa8_\tr

    %7
    lab8\f lab4 lab lab8\mbreak
    <sol sol,>2 r4
    fa2\p r4

    %10
    mib2 r4
    R2.
    solb4.\pp solb8_\tr sib reb

    %13
    reb8.(sib16) solb8 solb4 solb8
    solb?4. solb8_\tr sib8 reb
    do_\markup {\italic po \dynamic f} do4 do do8~\mbreak

    %16
    do\p do4 do do8~
    do4\rinf si2
    do,8\p(re! mi! fa sol la)~

    %19
    la \slashedGrace la16 sol16 fa mi8(fa) \slashedGrace sol16 fa8[(re)]
    do(re mi fa sol la)~
    la sol16 fa mi8(fa) fa[(re)]

    %22
    do4 sib! sib'~
    sib la2
    sol8 sol4 sol sol8\mbreak

    %25
    fa4 r8 do'\f la fa
    do\p do4 do'8\f la fa
    do\p do4 do do8

    %28
    do2.\fermata

}


Ivlan =\relative do' {

    la8\f(do) la(do) la(do)
    fa,\p(la) fa(la) fa(la)
    sib\f(re) sib(re) sib(re)

    %4
    fa,\p(sib) fa(sib) fa(sib)
    la\f(do) la(do) la(do)
    fa,\p(la) fa(la) fa(la)

    %7
    lab\f(do) lab(do) lab(do)\mbreak
    re4 mib8\p(fa sib reb)
    do,4(reb8 fa sib reb)

    %10
    sib,4(do8 mib lab do)
    reb,8\pp reb reb reb reb reb
    reb reb reb reb reb reb

    %13
    reb reb reb reb reb reb
    reb reb reb reb reb sib
    sol!_\markup {\italic po \dynamic f} sol' sol sol sol sol\mbreak

    %16
    lab\p lab sib sib sib sib
    lab\rinf fa fa fa fa reb
    do2.\p~

    %19
    do2 si4
    do2.~
    do2 si4

    %22
    do r sol'
    mi8 mi fa fa fa fa
    mi mi mi mi mi mi\mbreak

    %25
    fa4 r8 do'\f la fa
    do\p(sib la) do'\f la fa
    do\p do do do do do

    %28
    do2.\fermata

}


IvcIn =\relative do {

    fa,8\f(la fa la fa la)
    fa r r4 r
    fa8(la fa la fa la)

    %4
    fa r r4 r
    fa8(la fa la fa la)
    fa r r4 r

    %7
    fa8 (lab fa lab fa lab)\mbreak
    fa4\f mib r
    mib'\p(reb) r

    %10
    reb(do) r
    sib8\pp sib sib sib sib sib
    sib sib sib sib sib sib

    %13
    sib sib sib sib sib sib
    sib sib sib sib sib sib
    sib_\markup {\italic po \dynamic f} sib sib sib sib sib\mbreak

    %16
    lab lab mi'! mi mi mi
    fa fa reb reb reb reb
    do4 do do

    %19
    do8 do do do si si
    do4 do do
    do8 do do do si si

    %22
    do do do do do do
    do do do do do do
    do do do do do do\mbreak

    %25
    fa,4 r8 do''\f la fa
    do r r do' la fa
    do\p do do do do do

    %28
    do2.\fermata

}


IvcIIn =\relative do {

    fa,8\f(la fa la fa la)
    fa r r4 r
    fa8(la fa la fa la)

    %4
    fa r r4 r
    fa8(la fa la fa la)
    fa r r4 r

    %7
    fa8 (lab fa lab fa lab)\mbreak
    fa4\f mib r
    mib'\p(reb) r

    %10
    reb(do) r
    sib8\pp sib sib sib sib sib
    sib sib sib sib sib sib

    %13
    sib sib sib sib sib sib
    sib sib sib sib sib sib
    sib_\markup {\italic po \dynamic f} sib sib sib sib sib\mbreak

    %16
    lab lab mi'! mi mi mi
    fa fa reb reb reb reb
    do4 do do

    %19
    do8 do do do si si
    do4 do do
    do8 do do do si si

    %22
    do4 do, do
    do do do
    do do do\mbreak

    %25
    fa r8 do'\f la fa
    <do' do,>4 r8 do la fa
    do4\p do do

    %28
    do2.\fermata


}

forma = {

    \time 3/4
    \key fa\major
    \tempo 4 = 47
    s2.*28
    \bar "|."

}


Ifl = {
    \Iglobal
    <<\Ifln \forma>>
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


IvcI = {
    \Iglobal
    \clef bass
    <<\IvcIn \forma>>
}


IvcII = {
    \Iglobal
    \clef bass
    <<\IvcIIn \forma>>
}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override TrillSpanner.bound-details.left.text = #'()
    \terzinequarto \con
}

IIfln =\relative do'' {

    fa4\f fa4. fa8\tr\noBeam la do
    do(mi,) mi2 \slashedGrace sol16 fa8 mi16 re
    \grace re8 do4 do4. re16 do\slashedGrace do16 sib8 la16 sib

    %4
    la8 la\tr do la sib sol do do
    fa,4 r r2
    R1*2

    %8
    r8 fa la do fa4 r
    R1
    re8 mi16(fa) sol-! la-! sib-! do-! re8 r r4

    %11
    R1
    do,8 re16(mi) fa-! sol-! la-! sib-! do8 r r4
    R1\mbreak

    %14
    sib,8 do16(re) mi-! fa-! sol-! la-! sib8 r r4
    R1*2
    r4 r r8 do\f la fa

    %18
    do do' la fa do do' la fa
    do4 do8. do16 do4 r\mbreak
    sol'16(la sol) mi-! fa(sol fa) re-! mi(fa mi) do-! re(mi re) si?-!

    %21
    do8(re16 mi fa sol la si) do(si do si) \slashedGrace si16 do8 si16 la
    sol16(la sol) mi-! fa(sol fa) re-! mi(fa mi) do-! re(mi re) si?-!
    do mi(fa sol la si do re) mi4 r

    %24
    R1*8
    la,1\p~\mbreak
    la~

    %34
    la
    sol4 r r2
    la1~

    %37
    la~
    la\mbreak
    sol4 r r8 sol\dolce sol8.\tr fad32 sol

    %40
    do4 r r8 sol sol8.\tr fad32 sol
    re'4 r r8 sol, sol8.\tr fad32 sol
    fa'4 r r8 sol, sol8.\tr fad32 sol

    %43
    mi'4 r r8 sol, sol8.\tr fad32 sol
    do4 r r8 sol sol8.\tr fad32 sol
    re'4 r r8 sol, sol8.\tr fad32 sol

    %46
    fa'4 r r8 sol, sol8.\tr fad32 sol
    mi'4 r r8 do, do8.\tr si32 do
    sib'!4 r r8 do, do8.\tr si32 do

    %49
    la'4. si16 do \slashedGrace re16 do8 si \slashedGrace do16 si8 [la]
    \slashedGrace la16 sol8 fa?16 sol \slashedGrace si?16 la8 sol16 fa mi4 re\tr
    do4 r r2

    %52
    R1*3
    sol'16(mi fa re mi do re si) do8 r r4
    R1*2

    %58
    si'1
    do16(sol mi sol) do8 r r4 r\mbreak
    R1*7

    %67
    sol16 mi fa re mi do re si do4 r
    R1*2
    si'1

    %71
    do16(sol mi sol) do8 r r4 r\mbreak
    R1*2
    r4 do,2  si4

    %75
    do8 mi,16 fa sol la si do re mi fa sol la si do re
    \once\stemDown mi8. [mi,,16  fa8. re16] sol4 sol
    do8 mi,16 fa sol la si do re mi fa sol la si do re

    %78
    \once\stemDown mi8. [mi,,16  fa8. re16] sol4 sol
    do16(mi sol do) do,8 do do4 r
    R1*3

    %83
    r8 do16\f re mi8 do fa re sol sol,
    sol'1\dolce
    \grace sol8 fa1\mbreak

    %86
    fa16(mi re mi re mi re mi) fa8.\tr mi32 fa sol8 fa
    mi do16 re mi8 do fa re sol mi
    dod4 r r2

    %89
    R1*6
    sold'1\dolce
    la\mbreak

    %97
    sold
    la
    sold8\f mi16 si sold8 si mi,4 r

    %100
    mi'1\p~
    mi~\mbreak
    mi~

    %103
    mi4_\markup\italic {dolcis.[simo]} mi'2 mi4~
    mi mi2 mi4~
    mi r r2

    %106
    r4 mi2 mi4~\mbreak
    mi mi2 mi4~
    mi r r2

    %109
    R1
    fa,4\f fa4. fa8\tr\noBeam la do
    do(mi,) mi2 \slashedGrace sol16 fa8 mi16 re

    %112
    \grace re8 do4 do4. re16 do \slashedGrace do sib8 la16 sib\mbreak
    la8 la\tr do la sib sol do do
    fa,4 r r2

    %115
    R1*6
    do'1
    mi

    %123
    sol
    mi8 r r4 r2\mbreak
    R1*4

    %129
    r2 r8 do do8.\tr si32 do\mbreak
    fa4 r r8 do do8.\tr si?32 do
    sol'4 r r8 do, do8.\tr si?32 do

    %132
    sib'4 r r8 do ,do8.\tr si?32 do
    la'4 r r8 do, do8.\tr si?32 do
    fa4 r r8 do do8.\tr si?32 do

    %135
    sol'4 r r8 do, do8.\tr si?32 do\mbreak
    sib'4 r r8 do, do8.\tr si?32 do
    la'4 r r8 fa, fa8.\tr mi32 fa

    %138
    mib'4 r r8 fa, fa8.\tr mi32 fa
    re'4. mi16 fa \slashedGrace sol16 fa8[mi] \slashedGrace fa16 mi8 re
    do16 fa mi fa \slashedGrace mi16 re8 do16 sib la4 sol\tr

    %141
    fa r r2\mbreak
    R1*7
    do''16(la sib sol) la fa sol mi fa4 r

    %150
    R1*2
    mi1
    fa16(do la do) fa8 r r4 r

    %154
    R1*7
    do'16(la sib sol la fa sol mi) fa4 r
    R1*2

    %164
    mi1
    fa16(do la do) fa8 r r4 r
    R1*2

    %169
    r4 fa2 mi4
    fa8 fa,16\f(sol) la sib do re mi fa sol la sib do re mi
    \stemDown fa8. [\stemUp la,,16 sib8. sol16] \stemNeutral do4 do

    %172
    fa,8 fa16(sol) la sib do re mi fa sol la sib do re mi
    \stemDown fa8. [\stemUp la,,16 sib8. sol16] \stemNeutral do4 do
    fa, fa' fa r

}

IIvlIn =\relative do'' {

    <fa la,>4\f fa4. fa8\tr\noBeam la do
    do(mi,) <<mi2\\mi>> \slashedGrace sol16 fa8 mi16 re
    \grace re8 do4 do4. re16 do\slashedGrace do16 sib8 la16 sib

    %4
    la8 la,\tr do la sib sol do do
    << <fa' la,>4\p\\fa,>> fa'4. fa8\tr \noBeam la do
    do mi, mi2 \slashedGrace sol16 fa8 mi16 re

    %7
    \grace re8 do4 do4. re16 do \slashedGrace do16 sib8 la16 sib\mbreak
    la4 r r8 do\dolce do8.\tr sib32 do
    re8 mi16(fa) sol la sib do re(dod) re(dod) re(dod) re(dod)

    %10
    re8 r r4 r8 re,re8.\tr do32 re
    do8 re16 (mi) fa sol la sib do?(si!) do(si) do(si) do(si)
    do8 r r4 r8 do,do8.\tr sib?32 do

    %13
    sib8 do16(re) mi fa sol la sib(la) sib(la) sib(la) sib(la)\mbreak
    sib8 r r4 r8 sib, sib8.\tr la32 sib
    la16(sib la) la'-! sib,(do sib) sib'-! do,(la' sol fa) mi-! sol(sib) sib,

    %16
    la16(sib la) la'-! sib,(do sib) sib'-! do,(la' sol fa) mi-! sol(sib) sib,
    la fa'(sol la sib do re mi fa8) r r4
    r8 do, \f la fa do do' la fa

    %19
    do4 do8. do16 do4 r\mbreak
    R1*2
    do''1_\markup\italic{ Soave}~

    %23
    do2~do8 do do do
    \grace re8 do si si4. si16 (do) re8 re
    \tuplet 3/2 { re(si? do) } do4~do8 mi mi mi\mbreak

    %26
    mi\tr re re4. re16(mi) fa8 fa
    fa\tr mi mi4. mi16 fa sol8 sol
    sol(fa) fa[(mi)] mi(re) re[(dod)]

    %29
    dod?2(re8) re16(mi) fa8 fa
    fa[(mi)] mi(re) re[(do!)] do(si)
    si?2(do4) r

    %32
    \once\stemUp re,,16_\markup\italic "Arpeg.[gio]" (fad' do' fad, la, fad' do' fad, do fad do' fad, la, fad' do' fad,)\mbreak
    \once\stemUp re, (fad' do' fad,) la, (fad' do' fad,) do (fad do' fad,) la, (fad' do' fad,)
    \once\stemUp re, (fad' do' fad,) la, (fad' do' fad,) do (fad do' fad,) la, (fad' do' fad,)

    %35
    sol,,8\f la16(si do re mi fad) sol4 r
    r do2\p do4
    do1~

    %38
    do\mbreak
    si16\f sol,  la si do re mi fad sol4 r
    sol'1\p

    %41
    sol,
    sol'
    sol,

    %44
    sol'
    sol,\mbreak
    sol'

    %47
    sol,
    do2(sib!)
    la8 do do do do do do do
    do do do do do do si si

    %51
    do4 do16\dolce(re mi fa) sol mi do' mi, sol mi do' mi,
    sol mi do' mi, mi' mi, do' mi, sol mi do' mi, sol mi do' mi,\mbreak
    sol mi do' mi, mi' mi, do' mi, sol mi do' mi,  mi' mi, sol' mi,

    %54
    sol mi do' mi,  mi' mi, sol' mi, sol mi do' mi,  mi' mi, sol' mi,
    sol8 r r4 r2
    R1

    %57
    sol\dolce~
    sol~
    sol4. sol8 \slashedGrace si?16 la8 sol16 la \slashedGrace do16 si!8 la16 si\mbreak

    %60
    do(sol) mi do do'(sol) mi do \slashedGrace si'?16 la8 sol16 la \slashedGrace do16 si!8 la16 si
    do(sol) mi do do'(sol) mi do \slashedGrace sib'16 la8 sol16 la \slashedGrace do16 si8 la16 si
    do(sol) do sol \slashedGrace sib?16 la8 sol16 fa mi4 re\tr

    %63
    do r mi8\p-! sol-! mi-! sol-!
    mi-! sol-! do-! sol-! mi-! sol-! mi-! sol-!
    mi-! sol-! do-! sol-! mi-! sol-! do-! mi-!\mbreak

    %66
    mi,-! sol-! do-! mi-! mi,-! sol-! do-! mi-!
    mi, r r4 mi,32[(fa sol8.) sol8-! sol-!]
    la32[(si do8.) do8-! do-!] si32[(la sol8.) sol8-! sol-!]

    %69
    fa32[(mi re8.) re8-! re-!] re32[( mi fa8.) fa8-! fa-!]
    si,32[(do re8.) re8-! re-!] re32[( mi fa8.) fa8-! fa-!]
    mi8 mi mi mi fa fa fa fa

    %72
    mi mi mi mi fa fa fa fa\mbreak
    mi mi mi mi fa fa fa fa
    mi do' do do do do si si

    %75
    do mi,16 fa sol la si do re mi fa sol la si do re
    \once\stemDown mi8. [mi,,16\f  fa8. re16] sol4 sol,
    do r r2

    %78
    r8 r16 mi16\f [fa8. re16] sol4 <sol sol,>
    <do mi, sol,>4  <do mi, sol,> <do mi, sol,> r
    R1*3

    %83
    r8 do,16\f re mi8 do fa re sol sol
    mi'1\dolce
    re2. do4\mbreak

    %86
    si8 si si si si si si si
    do4 r r2
    la'4\f la16\tr sold la si dod4 dod16\tr si dod re

    %89
    mi4 mi16\tr\dolce re mi fa sol8 sol4 sol8
    la,, la'\rinf \senza\tuplet 3/2 { la4.~la8 sol(fa mi fa sol) }
    sol8\tr fa fa4~fa8\dolce fa4 fa8~\mbreak

    %92
    fa8 mi4 la sold re'8~
    re do?4 mi la4 la,,8
    si16(re do mi re fa mi sol) \slashedGrace sol16 fa8 mi16 re \slashedGrace re do8 si16 la

    %95
    sold(mi)fad sold la si dod red mi fad sold la si sold mi re?
    do! la si do re mi fa? sold la sol fa mi re do si la\mbreak
    sold mi fa sold la si dod red mi fad sold la si(sold) mi re?

    %98
    do! la si do re mi fad sold la sol fa mi re do si la
    sold\f(si mi si) sold8 si mi,4 mi'8\p\solo(la)
    la sold sold4~sold8 si si si

    %101
    \slashedGrace do16 si?8_\markup {\italic po \dynamic f} la la4~ \con\sestine \tuplet 6/4 { la8[(do si! la si do)] }\mbreak
    do si si4~si8 si(do re)
    do16(mi,) la(mi) si' mi, re' mi, do'(mi,) la(mi) si' mi, re' mi,

    %104
    do'(mi,) la(mi) si' mi, re' mi, do'(mi,) la(mi) si' mi, re' mi,
    \slashedGrace re'16 do8 si16 la fa(re) re' si si2\tr
    do16(mi,) la(mi) si' mi, re' mi, do'(mi,) la(mi) si' mi, re' mi, \mbreak

    %107
    do'(mi,) la(mi) si' mi, re' mi, do'(mi,) la(mi) si' mi, re' mi,
    \slashedGrace re'16 do8 si16 la fa(re) re' si si2\tr
    la4 la,16\f(sib! la sib) do8 sib la sol

    %110
    <fa' la,>4 fa4. fa8\tr la[do]
    do(mi,)<<mi2\\mi>>  \slashedGrace sol16 fa8 mi16 re
    \grace re8 do4 do4. re16 do \slashedGrace do sib8 la16 sib\mbreak

    %113
    la8 la,\tr do la sib sol do do
    fa la\p la la la la la la
    sib sib sib sib sib sib sib sib

    %116
    do do do do do do do do
    fa, fa fa fa fa4 r
    r sol'8-! fa-! mi-! re-! do-! sib-!\mbreak

    %119
    la sol fa mi do(fa) fa fa
    fa(re) re re re re re re
    do  do'4 do do do8~

    %122
    do do4 do do do8~
    do do4 do do do8
    sol'8-! fa-! mi-! re-! do-! sib-! la-! sol-!\mbreak

    %125
    fa fa sol sol la la sol sol
    fa fa sol sol la la sol sol
    fa fa sol sol la la sol sol

    %128
    fa4 r r r8 fa
    mi\f do16(re) do8 do do4 r\mbreak
    do'1\dolce

    %131
    do,
    do'
    do,

    %134
    do'
    do,\mbreak
    do'

    %137
    do,
    fa'2(mib)
    re8 fa, fa fa fa fa fa fa

    %140
    fa fa fa fa fa fa mi mi
    fa do16 \f sib la8 do fa\noBeam fa'\p-! fa-! fa-!\mbreak
    fa\tr mi mi4. mi16(fa) sol8 sol

    %143
    \tuplet 3/2 { sol(mi fa) } fa4~fa8 la la la
    la\tr(sol) sol4. sol16(la) sib8 sib
    \grace sib8 la4 fa,16(sol la sib) do(la) fa' la, do(la) fa' la,

    %146
    do(la) fa' la, la' la, fa' la, do(la) fa' la, do(la) fa' la,
    do(la) fa' la, la' la, fa' la, do(la) fa' la, la' la, do' la,\mbreak
    do la fa' la, la' la, do' la, do la fa' la, la' la, do' la,

    %149
    do4 r r2
    R1
    do'\dolce ~

    %152
    do~
    do4. do8  \slashedGrace mi16 re8 do16 re \slashedGrace fa16 mi8 re16 mi
    fa(do) la fa fa'(do) la fa \slashedGrace mi'16 re8 do16 re \slashedGrace fa16 mi8 re16 mi\mbreak

    %155
    fa(do) la fa fa'(do) la fa \slashedGrace mi'16 re8 do16 re \slashedGrace fa16 mi8 re16 mi
    fa do fa do \slashedGrace mi16 re8 do16 sib la4 sol\tr
    fa r la,8\p-! do-! la-! do-!

    %158
    la-! do-! fa-! do-! la-! do-! la-! do-!
    la-! do-! fa-! do-! la-! do-! fa-! la-!
    la,-! do-! fa-! la-! la,-! do-! fa-! la-!\mbreak

    %161
    la,8 r r4 la32[(sib do8.) do8-! do-!]
    re32[(mi fa8.) fa8-! fa-!] mi32[(re do8.) do8-! do-! ]
    sib32[(la sol8.) sol8-! sol-!] sol32[(la sib8.) sib8-! sib-!]

    %164
    mi,32[(fa sol8.) sol8-! sol-!] sol32[(la sib8.) sib8-! sib-!]
    la8 la la la sib sib sib sib
    la la la la sib sib sib sib

    %167
    la la la la sib sib sib sib\mbreak
    la fa fa fa fa fa mi mi
    fa\f la,16(sib) do re mi fa sol la sib do re mi fa sol

    %170
    la8. [la,16\f sib8. sol16] do4 do,
    fa r r2
    r8 r16 la\f [sib8. sol16] do4 do,

    %173
    fa << {<fa' la,> <fa la,>}\\{fa, fa}>> r

}


IIvlIIn =\relative do'' {

    <fa la,>4\f fa4. fa8\tr\noBeam la do
    do(mi,) <<mi2\\mi>> \slashedGrace sol16 fa8 mi16 re
    \grace re8 do4 do4. re16 do\slashedGrace do16 sib8 la16 sib

    %4
    la8 la,\tr do la sib sol do do
    fa la\p la la la la la la
    sib sib sib sib sib sib la la

    %7
    sol sol sol sol sol sol sol sol\mbreak
    fa fa\f la do fa, la\p la la
    sib sib sib sib sib sib sib sib

    %10
    sib sib sib sib sib sib sib sib
    la la la la la la la la
    la la la la la la la la

    %13
    sol sol sol sol sol sol sol sol\mbreak
    sol sol sol sol sol sol sol sol
    fa fa sol sol la la sol sol

    %16
    fa fa sol sol la la sol sol
    fa16 (la sib do) re(mi fa sol) la8 do,\f la fa
    do do' la fa do do' la fa

    %19
    do4 do8. do16 do4 r\mbreak
    mi8\p mi la la sol sol fa fa
    mi do re re mi mi fa fa

    %22
    mi mi la la sol sol fa fa
    mi r r4 r8 mi'\startTrillSpan mi mi\stopTrillSpan
    mi re re2 si4

    %25
    sol2 r8 do'\dolce \startTrillSpan do do\stopTrillSpan\mbreak
    do\tr si si4. si16(do) re8 re
    re\tr do do4 r la,~

    %28
    la sib!8 sol sol fa fa[mi]
    re\f mi16 fa sol la sib dod re4 sol,~\p
    sol la8 fa fa(mi) mi[(re)]
    do\f(re16 mi fa sol la sib) do?4 r

    %32
    do1\p~\mbreak
    do~
    do

    %35
    si16\f sol, la si do re mi fad sol8 sol'\tr si sol
    \once\stemUp re,16(fad' do' fad,) la,(fad' do' fad,) do (fad do' fad,) la,(fad' do' fad,)
    \once\stemUp re,16(fad' do' fad,) la,(fad' do' fad,) do (fad do' fad,) la,(fad' do' fad,)

    %38
    \once\stemUp re,16(fad' do' fad,) la,(fad' do' fad,) do (fad do' fad,) la,(fad' do' fad,)\mbreak
    sol,,8\f  la16 (si) do re mi fad sol4 r
    r8 mi-!\p sol-! fa-! mi r r4

    %41
    r8 re-! fa-! mi-! re r r4
    r8 re-! fa-! mi-! re r r4
    r8 mi-! sol-! fa-! mi r r4

    %44
    r8 mi-! sol-! fa-! mi r r4
    r8 re-! fa-! mi-! re r r4 \mbreak
    r8 re-! fa-! mi-! re r r4

    %47
    r8 mi-! sol-! fa-! mi r r4
    r8 mi-! sol-! fa-! mi4 r
    r8 do' do la la do do do

    %50
    do do do do do do si si
    do4 r mi8\p-! sol-! mi-! sol-!
    mi-! sol-! do-! sol-! mi-! sol-! mi-! sol-!\mbreak

    %53
    mi-! sol-! do-! sol-! mi-! sol-! do-! mi-!
    mi,-! sol-! do-! mi-!  mi,-! sol-! do-! mi-!
    mi, r r4 mi,32[(fa sol8.) sol8-! sol-!]

    %56
    la32[(si do8.) do8-! do-!] si32[(la sol8.) sol8-! sol-!]
    fa32[(mi re8.) re8-! re-!] re32[(mi fa8.) fa8-! fa-!]
    si,32[(do re8.) re8-! re-!] re32[(mi fa8.) fa8-! fa-!]

    %59
    mi mi mi mi fa fa fa fa\mbreak
    mi mi mi mi fa fa fa fa
    mi mi mi mi fa fa fa fa

    %62
    mi do' do do do do si si
    do4 do16\dolce(re mi fa) sol mi do' mi, sol mi do' mi,
    sol mi do' mi, mi' mi, do' mi, sol mi do' mi, sol mi do' mi,

    %65
    sol mi do' mi, mi' mi, do' mi, sol mi do' mi, mi' mi, sol' mi,\mbreak
    sol mi do' mi, mi' mi, sol' mi, sol mi do' mi, mi' mi, sol' mi,
    sol8 r r4 r2

    %68
    R1
    sol~
    sol~

    %71
    sol4. sol8 \slashedGrace si?16 la8 sol16 la \slashedGrace do16 si!8 la16 si
    do(sol) mi do do'(sol) mi do \slashedGrace si'?16 la8 sol16 la \slashedGrace do16 si!8 la16 si\mbreak
    do(sol) mi do do'(sol) mi do \slashedGrace si'?16 la8 sol16 la \slashedGrace do16 si!8 la16 si

    %74
    do sol do sol \slashedGrace si?16 la8 sol16 fa mi4 re\tr
    do r r2
    r8 r16 mi,\f [fa8. re16] <sol sol,>4 <sol sol,>

    %77
    do8 do,16\dolce re mi fa sol la si do re mi fa sol la si
    \once\stemDown do8.[mi,,16\f fa8. re16] sol4 sol,\mbreak
    <do' mi, sol,>4  <do mi, sol,> <do mi, sol,> r

    %80
    R1*3
    r8 do,16\f re re8 do fa re sol sol,
    do\dolce do do do do do do do

    %85
    do do do do si si la la\mbreak
    sol sol sol sol sol sol sol sol
    do\f do16(re) mi8 do fa re sol mi

    %88
    dod4 r la'' la8.\tr\dolce si16
    dod4 dod8.\tr re16 mi8 mi4 mi8
    r mi,,\p mi mi mi la la la

    %91
    la la la la la la la la\mbreak
    la la la mi mi mi mi mi
    mi mi mi mi mi mi mi mi

    %94
    fa! r r4 r2
    si1\p
    do\mbreak

    %97
    si
    do
    si8\f mi16 si sold8 si mi,\p mi mi mi

    %100
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi mi mi

    %103
    mi do'(re si) do-! do(re si)
    do-! do (re si) do-! do(re si)
    la la la la la la sold sold

    %106
    la-! do(re si) do\noBeam do(re si)\mbreak
    do\noBeam do(re si) do\noBeam do(re si)
    la la la la la la sold[sold]

    %109
    la4 la16\f(sib! la sib) do8 sib la sol
    <fa' la,>4 fa4. fa8\tr la[do]
    do(mi,)<<mi2\\mi>>  \slashedGrace sol16 fa8 mi16 re

    %112
    re8 do do4~do8 re16 do \slashedGrace do sib8 la16 sib\mbreak
    la8 la,\tr do la sib sol do do
    <fa' la, fa>4 fa4.\solo fa16.\tr mi64 fa la8 do

    %115
    do\dolce(mi,) mi2~mi8 fa
    re(mib) mib4~mib16 (fa sol fa \slashedGrace la sol8 fa16 mib)
    dod8(re) re4. sib'?8 \slashedGrace la16 sol8 fa

    %118
    mi!16(fa sol la sib sol la fa sol mi fa re mi do re sib)\mbreak
    do(la sib sol la fa sol mi) fa(sol la sib) do(re mi fa)
    \tuplet 3/2 { re8[(mi fa fad sol la)] sib(la sol) \slashedGrace sol16 fa?8 mi fa}

    %121
    \slashedGrace fa mi8 re16 do sib8 sib4 sib sib8
    \tuplet 3/2 { sol'(mi re) } sib sib4 sib sib8
    sib'16(sol mi do) sib8 sib4 sib sib8


    %124
    sib'16(sol la fa sol mi fa re mi do re sib do la sib sol)\mbreak
    la(sib la) la'-! sib,(do sib) sib'-! do,-! la'(sol) fa-! mi-! sol(sib) sib,
    la(sib la) la'-! sib,(do sib) sib'-! do,-! la'(sol) fa-! mi-! sol(sib) sib,

    %127
    la(sol la) la'-! sib,(do sib) sib'-! do,-! la'(sol) fa-! mi-! sol(sib) sib,
    la(do sib la sib do re mi) fa(sol la sib)  do8 \once\stemUp la,
    sol\f do,16(re) do8 do do4 r\mbreak

    %130
    r8 la'-!\p do-! sib-! la r r4
    r8 sol-! sib-! la-! sol r r4
    r8 sol-! sib-! la-! sol r r4

    %133
    r8 la-! do-! sib-! la r r4
    r8 la-! do-! sib-! la r r4
    r8 sol-! sib-! la-! sol r r4\mbreak

    %136
    r8 sol-! sib-! la-! sol r r4
    r8 la-! do-! sib-! la r r4
    r8 la-! do-! sib-! la r r4

    %139
    r8 fa fa re re fa fa fa
    fa fa fa fa fa fa mi mi
    fa do16 \f sib la8 do fa(la)\p la-! la-!\mbreak

    %142
    la(sol) sol2 mi4
    do2 r8 fa' fa fa
    fa\tr(mi) mi4. mi16(fa) sol8 sol

    %145
    fa4 r la,8-! do-! la-! do-!
    la-! do-! fa-! do-! la-! do-! la-! do-!
    la-! do-! fa-! do-! la-! do-! fa-! la-!\mbreak

    %148
    la,-! do-! fa-! la-! la,-! do-! fa-! la-!
    la, r r4 la32[(sib do8.) do8-! do-!]
    re32[(mi fa8.) fa8-! fa-!] mi32[(re do8.) do8-! do-!]

    %151
    sib32[(la sol8.) sol8-! sol-!] sol32[(la sib8.) sib8-! sib-!]
    mi,32(fa sol8.) sol8-! sol-!] sol32[(la sib8.) sib8-! sib-!]
    la8 la la la sib sib sib sib

    %154
    la la la la sib sib sib sib\mbreak
    la la la la sib sib sib sib
    la fa fa fa fa fa mi mi

    %157
    fa4 fa16\p(sol) la sib do(la) fa' la, do(la) fa' la,
    do(la) fa' la, la' la, fa' la, do(la) fa' la, do(la) fa' la,
    do(la) fa' la, la' la, fa' la, do la fa' la, la' la, do' la,

    %160
    do la fa' la, la' la, do' la, do la fa' la, la' la, do' la,\mbreak
    do4 r r2
    R1

    %163
    do'1~
    do~
    do4. do8 \slashedGrace mi16 re8 do16 re \slashedGrace fa16 mi8 re16 mi

    %166
    fa(do) la fa fa'(do) la fa \slashedGrace mi'16 re8 do16 re \slashedGrace fa16 mi8 re16 mi
    fa(do) la fa fa'(do) la fa \slashedGrace mi'16 re8 do16 re \slashedGrace fa16 mi8 re16 mi\mbreak
    fa(do fa do) \slashedGrace mi16 re8 do16 sib la4 sol\tr

    %169
    fa r r2
    r8 r16 la,\f[sib8. sol16] do4 do,
    fa8 la,16(sib) do re mi fa sol la sib do re mi fa sol

    %172
    la8. la,16\f[sib8. sol16] do4 do,
    fa << {<fa' la,> <fa la,>}\\{fa, fa}>> r

}


IIvlan =\relative do' {

    la'8 la la la la la la la
    sib sib sib sib sib sib la la
    sol sol sol sol sol sol sol sol

    %4
    fa la,\tr do la sib sol do do,
    fa fa'\p fa fa fa fa fa fa
    sol sol sol sol sol sol fa fa

    %7
    mi mi mi mi mi mi mi mi \mbreak
    fa fa,\f la do fa, fa'\p fa fa
    fa fa fa fa fa fa fa fa

    %10
    fa fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa

    %13
    sol(mi) mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi mi mi
    fa4 r r mi

    %16
    fa r r mi
    fa8 r r4 r8 do'\f la fa
    do do' la fa do do' la fa

    %19
    <do do,>4 <do do,>8. <do do,>16 <do do,>4 r\mbreak
    do8\p do do do do do do do
    do4 r r2

    %22
    do8 do do do do do do do
    do4 r r8 do mi(fad)
    sol4 sol, sol sol

    %25
    do,8(do') do do do4 r\mbreak
    r8 sol' sol sol  sol4 sol,
    r8 do' do, do do4 <<mi\\dod>>

    %28
    <<re\\re>> sol, la la
    re8\f mi16(fa) sol la sib dod re4 << <re, si>\\si>>
    do4 fa sol sol,

    %31
    do8\f re16 mi fa sol la si do4 r
    fad,1\p~\mbreak
    fad~

    %34
    fad
    sol,8\f la16 si do re mi fad sol4 r
    fad1\p~

    %37
    fad~
    fad\mbreak
    sol,8\f  la16 si do re mi fad sol4 r

    %40
    r8 do,-! mi-! re-! do r r4
    r8 si-! re-! do-! si r r4
    r8 si-! re-! do-! si r r4

    %43
    r8 do-! mi-! re-! do r r4
    r8 do-! mi-! re-! do r r4
    r8 si-! re-! do-! si r r4\mbreak

    %46
    r8 si-! re-! do-! si r r4
    r8 do-! mi-! re-! do r r4
    r8 do-! mi-! re-! do r r4

    %49
    R1*2
    r4 r do\pp do
    do2 do4 do\mbreak

    %53
    do2 do4 do
    do2 do
    do8 r r4 do32[(re mi8.) mi8-! mi-!]

    %56
    fa32[(sol la8.) la8-! la-! ] sol32[(fa mi8.) mi8-! mi-!]
    re32[(do si8.) si8-! si-!] si32[(do re8.) re8-! re-!]
    re32[(mi fa8.) fa8-! fa-!] si,32[(do re8.) re8-! re-!]

    %59
    do8 do do do do do do do\mbreak
    do8 do do do do do do do
    do8 do do do do do do do

    %62
    do mi fa fa sol sol sol, sol
    do4 r do\pp do
    do2 do4 do

    %65
    do2 do4 do\mbreak
    do2 do
    do8 r r4 do32[(re mi8.) mi8-! mi-!]

    %68
    fa32[(sol la8.) la8-! la-! ] sol32[(fa mi8.) mi8-! mi-!]
    re32[(do si8.) si8-! si-!] si32[(do re8.) re8-! re-!]
    re32[(mi fa8.) fa8-! fa-!] si,32[(do re8.) re8-! re-!]

    %71
    do8 do do do do do do do\mbreak
    do8 do do do do do do do
    do8 do do do do do do do

    %74
    do mi fa fa sol sol sol, sol
    do4 r r2
    r8 r16 mi\f[fa8. re16] sol4 sol,

    %77
    <do do,> r r2
    r8 r16 mi\f[fa8. re16] sol4 sol,\mbreak
    <mi' sol, do,> <mi sol, do,> <mi sol, do,>  r

    %80
    do8\p do do do do do do do
    do do do do si si la la
    sol sol sol sol sol sol sol sol

    %83
    do, do'16\f re mi8 do fa re sol sol,
    do4 r r2
    R1*2

    %87
    r8 do16\f re mi8 do fa re sol mi
    dod4 r r2
    la4\p la la la

    %90
    dod8 dod dod dod dod dod dod dod
    re re re re re re re re\mbreak
    do do do do si si sold sold

    %93
    la la la la do do do do
    re re re re re re red red
    mi mi mi mi mi mi mi mi

    %96
    mi mi mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi

    %99
    mi8 mi\f  sold si mi,4 r
    r si'2\p(sold4)
    mi8 mi mi mi mi mi mi mi\mbreak

    %102
    mi4 r r2
    r8 mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi

    %105
    mi8 r r4 r2
    r8 mi mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi mi mi

    %108
    mi8 r r4 r2
    r4 la16\f(sib! la sib) do8 sib la sol
    fa8  la la la la la la la

    %111
    sib sib sib sib sib sib la la
    sol sol sol sol sol sol sol sol\mbreak
    fa la,\tr do la sib sol do do,

    %114
    fa fa'\p fa fa fa fa fa fa
    sol sol sol sol sol sol sol sol
    la la la la la la la la

    %117
    sib sib sib sib sib re, re re
    do4 r r2\mbreak
    R1

    %120
    r2 r4 sol'~
    sol8 mi mi mi mi mi mi mi
    mi sol sol sol sol sol sol sol

    %123
    sol mi mi mi mi mi mi mi
    do4 r do do\mbreak
    do r r mi(

    %126
    fa) r r mi(
    fa) r r mi(
    fa) r r r8 si,\f

    %129
    do do16(re) do8 do do4 r\mbreak
    r8 fa-!\p la-! sol-! fa r r4
    r8 mi-! sol-! fa-! mi r r4

    %132
    r8 mi-! sol-! fa-! mi r r4
    r8 fa-! la-! sol-! fa r r4
    r8 fa-! la-! sol-! fa r r4

    %135
    r8 mi-! sol-! fa-! mi r r4\mbreak
    r8 mi-! sol-! fa-! mi r r4
    r8 fa-! la-! sol-! fa r r4

    %138
    r8 fa-! la-! sol-! fa r r4
    R1*2
    r8 do16 sib la8 do fa, fa\p (la si)\mbreak

    %142
    do4 do, do do
    fa8 fa fa fa fa4 r
    r8 do'\startTrillSpan do do\stopTrillSpan do4 do,

    %145
    fa r fa\pp fa
    fa2 fa4 fa
    fa2 fa4 fa\mbreak

    %148
    fa2 fa
    fa8 r r4 fa'32[(sol la8.) la8-! la-!]
    sib32[(do re8.) re8-! re-!] do32[(sib la8.) la8-! la-!]

    %151
    sol32[(fa mi8.) mi8-! mi-!] mi32[(fa sol8.) sol8-! sol-!]
    sol32[(la sib8.) sib8-! sib-!] mi,32[(fa sol8.) sol8-! sol-!]
    fa8 fa fa fa fa fa fa fa

    %154
    fa8 fa fa fa fa fa fa fa\mbreak
    fa8 fa fa fa fa fa fa fa
    fa la, sib sib do do do do

    %157
    fa4 r fa, fa
    fa2 fa4 fa
    fa2 fa4 fa

    %160
    fa2 fa\mbreak
    fa4 r fa'32[(sol la8.) la8-! la-!]
    sib32[(do re8.) re8-! re-!] do32[(sib la8.) la8-! la-!]

    %163
    sol32[(fa mi8.) mi8-! mi-!] mi32[(fa sol8.) sol8-! sol-!]
    sol32[(la sib8.) sib8-! sib-!] mi,32[(fa sol8.) sol8-! sol-!]
    fa8 fa fa fa fa fa fa fa

    %166
    fa8 fa fa fa fa fa fa fa\mbreak
    fa8 fa fa fa fa fa fa fa
    fa la, sib sib do do do do

    %169
    fa,4 r r2
    r8 r16 la\f[sib8. sol16] do4 do,
    fa r r2

    %172
    r8 r16 la\f[sib8. sol16] do4 do,
    fa <<{la la}\\{ fa fa }>> r

}


IIvcIn =\relative do {

    fa,8\f fa' fa fa fa fa fa fa
    sol sol sol sol sol sol fa fa
    mi mi mi mi <<{mi mi mi mi}\\{do do do do}>>

    %4
    fa la,\tr do la sib sol do do,
    fa4 r r2
    R1

    %7
    do'4\p r do do\mbreak
    fa8 fa,\f la do fa,4 r
    fa8\p r r4 fa8 r r4

    %10
    fa8 r fa' r fa r fa r
    fa, r r4 fa8 r r4
    fa8 r fa' r fa r fa r

    %13
    do r r4 do8 r r4\mbreak
    do8 r do r do r do r
    fa4 fa,2 do'4

    %16
    fa4 fa,2 do'4
    fa4 r r8 do'\f la fa
    do do' la fa do do' la fa

    %19
    <do do,>4 <do do,>8. <do do,>16 <do do,>4 r\mbreak
    do8\p do do do do do do do
    do4 r r2

    %22
    do8 do do do do do do do
    do4 r r2
    \clef tenor \key fa\major r8 sol''\startTrillSpan sol sol\stopTrillSpan sol(fa) fa4

    %25
    fa4 \slashedGrace fa16 mi8. re16 mi4 do\mbreak
    sol r r sol
    \clef bass \key fa\major do do, r dod'\p

    %28
    re sol, la la,
    re8\f mi16 fa sol la sib dod re4 si!\p
    do fa, sol sol,

    %31
    do8\f re16 mi fa sol la si do8 do\p la fad
    re4 (do' la fad)\mbreak
    re4 (do' la fad)

    %34
    re4 (do' la fad)
    sol,8\f la16 si do re mi fad sol8 si re si
    do2\p la4 fad

    %37
    re do' la fad
    re do' la fad\mbreak
    sol,8\f la16  si do re mi fad sol4 r

    %40
    \clef tenor \key fa\major r r r8 mi'\p-! fa-! mi-!
    re r r4 r8 re-! fa-! mi-!
    re r r4 r8 re-! mi-! fa-!

    %43
    mi r r4 r8 mi-! sol-! fa-!
    mi r r4 r8 mi-! fa-! mi-!
    re r r4 r8 re-! fa-! mi-!\mbreak

    %46
    re r r4 r8 re-! mi-! fa-!
    mi r r4 r8 mi-! sol-! fa-!
    mi r r4 r8 mi-! fa-! sol-!

    %49
    fa4 \clef bass \key fa\major fa, fa fa
    mi8 mi fa fa sol sol sol, sol
    do4 r do8\pp r do r

    %52
    do r r4 do8 r do r\mbreak
    do r r4 do8 r do r
    do r r4 do8 r r4

    %55
    do8 r r4 r do
    r fa, r do'
    r sol' r <si sol,>

    %58
    r <si? sol,> r <si! sol,>
    do,8 do' do, do do4 do\mbreak
    do2 do4 do

    %61
    do2 do4 do
    do8 do fa fa sol sol sol, sol
    do4 r do8-! r do-! r

    %64
    do8 r r4 do8-! r do-! r
    do r r4 do8 r r4\mbreak
    do8 r r4 do8 r r4

    %67
    do8 r r4 r do
    r fa, r do'
    r sol' r <si sol,>

    %70
    r <sol sol,> r <sol sol,>
    do,8 do' do, do do4 do
    do2 do4 do

    %73
    do2 do4 do
    do8 do fa fa sol sol sol, sol
    do4 r r2

    %76
    r8 r16 mi\f [fa8. re16] sol4 sol,
    <do do,> r r2
    r8 r16 mi\f[fa8. re16] sol4 sol,\mbreak

    %79
    <do do,> <do do,> <do do,> r
    \clef tenor \key fa\major sol''1\p
    \grace sol8 fa1

    %82
    fa16( mi re mi re mi re mi) fa8.\tr mi32 fa sol8 fa
    mi \clef bass \key fa\major do,16\f re mi8 do fa re sol sol,
    do4 r r2

    %85
    R1*2
    r8 do16\f re mi8 do fa re sol mi
    dod4 r r2

    %89
    la4 la'\p la la
    la dod, dod dod
    re8 re(fa la) re4 re,\mbreak

    %92
    do la si mi,
    la8 la la la do do do do
    re re re re re re red red

    %95
    mi4 r mi mi,
    la2 la'4 la,\mbreak
    mi'2 mi4 mi,

    %98
    la2 la'4 la,
    mi8 mi'\f sold si? mi,4 r
    \clef tenor \key fa\major  r4 mi'\p  re2~

    %101
    re4 do8.\tr sib16 do4 la\mbreak
    sold8 sold sold sold sold sold sold sold
    la la sold sold la la sold sold

    %104
    la la sold sold la la sold sold
    la la re, re mi mi mi mi
    \clef bass \key fa\major la8 la sold sold la la sold sold\mbreak

    %107
    la8 la sold sold la la sold sold
    la la re, re mi mi mi mi
    la,4 la'16\f(sib! la sib) do8 sib la sol

    %110
    fa, fa' fa fa fa fa fa fa
    sol sol sol sol sol sol fa fa
    mi mi mi mi <<{mi mi mi mi}\\{do do do do}>>\mbreak

    %113
    fa la,\tr do la sib sol do do,
    fa4 r r2
    R1

    %116
    fa4\p fa' fa fa,
    sib8 sib sib sib sib sib sib sib
    do4 r  r2\mbreak

    %119
    do4 do la8 la la la
    sib sib sib sib sib sib si si
    do do, do' mi sol(sib? sol mi)

    %122
    do do, do' mi sol(sib sol mi)
    do do, do' mi sol sib sol mi
    do4 r do' do,\mbreak

    %125
    fa fa,2 do'4
    fa fa,2 do'4
    fa fa,2 do'4

    %128
    fa r r r8 si,\f
    do8 do16(re) do8 do do4 r\mbreak
    \clef tenor \key fa\major r2 r8 la''\p-! sib-! la-!

    %131
    sol r r4 r8 sol-! sib-! la-!
    sol r r4 r8 sol-! la-! sib-!
    la r r4 r8 la-! do-! sib-!

    %134
    la r r4 r8 la-! sib-! la-!
    sol r r4 r8 sol-! sib-! la-!\mbreak
    sol r r4 r8 sol-! la-! sib-!

    %137
    la r r4 r8 la-! do-! sib-!
    la r r4 r8 la,-! sib-! do-!
    sib4 \clef bass \key fa\major sib, sib sib

    %140
    la8 la sib sib do do do do
    fa do16\f(sib) la8 do fa,4 r\mbreak
    r8 do''\p do do do4 sib!~

    %143
    sib \slashedGrace sib16 la8. sol16 la4 fa
    do r r do
    fa, r fa8 r fa r

    %146
    fa r r4 fa8 r fa r
    fa r r4 fa8 r fa r\mbreak
    fa r r4 fa8 r r4

    %149
    fa8 r r4 r fa'
    r sib, r fa'
    r do' r <<mi,\\do>>

    %152
    r <<mi\\do>> r << mi\\do>>
    fa,8 fa' fa fa fa2~
    fa8 fa fa fa fa2~\mbreak

    %155
    fa8 fa fa fa fa2~
    fa8 fa, sib sib do do do do
    fa,4 r fa8 r fa r

    %158
    fa r r4 fa8 r fa r
    fa r r4 fa8 r r4
    fa8 r r4 fa8 r r4\mbreak

    %161
    fa8 r r4 r fa'
    r sib, r fa'
    r do' r <<mi,\\do>>

    %164
    r <<mi\\do>> r << mi\\do>>
    fa,8 fa' fa fa fa2~
    fa8 fa fa fa fa2~\mbreak

    %167
    fa8 fa fa fa fa2
    fa8 fa, sib sib do do do, do
    fa4 r r2

    %170
    r8 r16 la\f[sib8. sol16] do4 do,
    fa r r2
    r8 r16 la\f[sib8. sol16] do4 do,

    %173
    <<{la' la la}\\{fa fa fa}>> r

}

IIvcIIn =\relative do {

    fa,8\f fa' fa fa fa fa fa fa
    sol sol sol sol sol sol fa fa
    mi mi mi mi <<{mi mi mi mi}\\{do do do do}>>

    %4
    fa la,\tr do la sib sol do do,
    fa4 r r2
    R1

    %7
    do'4\p r do do\mbreak
    fa8 fa,\f la do fa,4 r
    R1*8

    %17
    r2 r8 do''\f la fa
    do do' la fa do do' la fa
    <do do,>4 <do do,>8. <do do,>16 <do do,>4 r\mbreak

    %20
    do8\p r do r do r do r
    do4 r r2
    do8 r do r do r do r

    %23
    do4 r r2
    sol4 r r sol
    do r r do\mbreak

    %26
    sol' r sol sol
    do, do, r2
    r4 sol'' la la,

    %29
    re8\f mi16 fa sol la sib dod re4 r
    r re,\p sol sol,
    do8\f re16 mi fa sol la si do8 do\p la fad

    %32
    <<{re2~re4}\\{re2 re4}>> r\mbreak
    <<{re2~re4}\\{re2 re4}>> r
    <<{re2~re4}\\{re2 re4}>> r

    %35
    sol,8\f la16  si do re mi fad sol4 r
    <<{re2\p~re4}\\{re2 re4}>> r
    <<{re2~re4}\\{re2 re4}>> r

    %38
    <<{re2~re4}\\{re2 re4}>> r\mbreak
    sol,8\f la16  si do re mi fad sol8 fa!\p mi re
    do4 r  \clef tenor \key fa\major r8 do'-!\p re-! do-!

    %41
    si r r4 r8 si-! re-! do-!
    si? r r4 r8 si-! do-! re-!
    do r r4 r8 do-! mi-! re-!

    %44
    do r r4 r8 do-! re-! do-!
    si r r4 r8 si-! re-! do-!\mbreak
    si r r4 r8 si-! do-! re-!

    %47
    do r r4 r8 do-! mi-! re-!
    do r r4 r8 do-! re-! mi-!
    fa4 \clef bass \key fa\major fa,4 fa fa

    %50
    mi8 mi fa fa sol sol sol, sol
    do4 r do8\pp r do r

    %52
    do r r4 do8 r do r\mbreak
    do r r4 do8 r do r
    do r r4 do8 r r4

    %55
    do8 r r4 r do
    r fa, r do'
    r sol' r <si sol,>

    %58
    r <si? sol,> r <si! sol,>
    do,8 do' do, do do4 do\mbreak
    do2 do4 do

    %61
    do2 do4 do
    do8 do fa fa sol sol sol, sol
    do4 r do8-! r do-! r

    %64
    do8 r r4 do8-! r do-! r
    do r r4 do8 r r4\mbreak
    do8 r r4 do8 r r4

    %67
    do8 r r4 r do
    r fa, r do'
    r sol' r <si sol,>

    %70
    r <sol sol,> r <sol sol,>
    do,8 do' do, do do4 do
    do2 do4 do

    %73
    do2 do4 do
    do8 do fa fa sol sol sol, sol
    do4 r r2

    %76
    r8 r16 mi\f [fa8. re16] sol4 sol,
    <do do,> r r2
    r8 r16 mi\f[fa8. re16] sol4 sol,\mbreak

    %79
    <do do,> <do do,> <do do,> r
    \clef tenor \key fa\major mi'1\p
    \grace mi8 re2. do4

    %82
    si si16(do si do) re8. do32 re mi8 re
    do \clef bass \key fa\major do,16\f re mi8 do fa re sol sol,
    do4 r r2

    %85
    R1*2
    r8 do16\f re mi8 do fa re sol mi
    dod4 r r2

    %89
    la4 la'\p la la
    la dod, dod dod
    re8 re(fa la) re4 re,\mbreak

    %92
    do la si mi,
    la r do r
    re r re(red)

    %95
    mi r mi mi,
    la2 la'4 la,\mbreak
    mi'2 mi4 mi,

    %98
    la2 la'4 la,
    mi8 mi'\f sold si? mi,4 r
    R1*2\mbreak

    %102
    mi,2\p mi'4 mi
    la,8 r mi' r la r mi r
    la, r mi' r la r mi r

    %105
    la, la re re mi mi mi mi
    la, r mi' r la r mi r\mbreak
    la, r mi' r la r mi r

    %108
    la, la re re mi mi mi mi
    la,4 la'16\f(sib! la sib) do8 sib la sol

    %110
    fa, fa' fa fa fa fa fa fa
    sol sol sol sol sol sol fa fa
    mi mi mi mi <<{mi mi mi mi}\\{do do do do}>>\mbreak

    %113
    fa la,\tr do la sib sol do do,
    fa4 r r2
    R1

    %116
    fa4\p fa' fa fa,
    sib8 sib sib sib sib sib sib sib
    do4 r  r2\mbreak

    %119
    do4 do la8 la la la
    sib sib sib sib sib sib si si
    do4 do,\pp do do

    %122
    do' do, do do
    do' do, do do
    do' r do' do,\mbreak

    %125
    fa, r r2
    R1*2
    r2 r4 r8 si\f

    %129
    do8 do16(re) do8 do do4 r\mbreak
    \clef tenor \key fa\major r2 r8 fa'-!\p sol-! fa-!
    mi r r4 r8 mi-! sol-! fa-!

    %132
    mi r r4 r8 mi-! fa-! sol-!
    fa r r4 r8 fa-! la-! sol-!
    fa r r4 r8 fa-! sol-! fa-!

    %135
    mi r r4 r8 mi-! sol-! fa-! \mbreak
    mi r r4 r8 mi-! fa-! sol-!
    fa r r4 r8 fa-! la-! sol-!

    %138
    fa r r4 r8 fa,-! sol-! la-!
    sib!4 \clef bass \key fa\major sib, sib sib
    la8 la sib sib do do do do

    %141
    fa do16\f(sib) la8 do fa,4 r\mbreak
    do'\p r r do
    fa, r r fa

    %144
    do'  r do  do
    fa, r fa8 r fa r

    %146
    fa r r4 fa8 r fa r
    fa r r4 fa8 r fa r\mbreak
    fa r r4 fa8 r r4

    %149
    fa8 r r4 r fa'
    r sib, r fa'
    r do' r <<mi,\\do>>

    %152
    r <<mi\\do>> r << mi\\do>>
    fa,8 fa' fa fa fa2~
    fa8 fa fa fa fa2~\mbreak

    %155
    fa8 fa fa fa fa2~
    fa8 fa, sib sib do do do do
    fa,4 r fa8 r fa r

    %158
    fa r r4 fa8 r fa r
    fa r r4 fa8 r r4
    fa8 r r4 fa8 r r4\mbreak

    %161
    fa8 r r4 r fa'
    r sib, r fa'
    r do' r <<mi,\\do>>

    %164
    r <<mi\\do>> r << mi\\do>>
    fa,8 fa' fa fa fa2~
    fa8 fa fa fa fa2~\mbreak

    %167
    fa8 fa fa fa fa2
    fa8 fa, sib sib do do do, do
    fa4 r r2

    %170
    r8 r16 la\f[sib8. sol16] do4 do,
    fa r r2
    r8 r16 la\f[sib8. sol16] do4 do,

    %173
    <<{la' la la}\\{fa fa fa}>> r

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 65
    s1*79
    \bar ":..:"\break
    s1*94
    \bar ":|."

}


IIfl = {
    \IIglobal
    <<\IIfln \forma>>
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


IIvcI = {
    \IIglobal
    \clef bass
    <<\IIvcIn \forma>>
}


IIvcII = {
    \IIglobal
    \clef bass
    <<\IIvcIIn \forma>>
}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override TrillSpanner.bound-details.left.text = #'()
    \terzine
}

IIIfln =\relative do'' {

    r4
    R1*11
    do'2\solo~do8 sib16 la sol fa mi fa
    \grace mi8 re4 re4. sib'8 sib([(re,)]

    %14
    re4\tr do2 fa8 fa
    \slashedGrace fa16 mi8 re16 do la'8 la \slashedGrace la16 sol8 fa16 mi do'8 do\mbreak
    do16(re la sib) sib4~sib16 la-! sol-! fa-! mi-! re-! do-! sib-!

    %17
    la32(do sib la sib do re mi) fa(mi fa sol la sol la sib) \slashedGrace re16 do sib32 la sib do re mi fa8 la,
    la4\tr sol2 r4
    do1~

    %20
    do~
    do\mbreak
    do16\fp(la) fa4 fa8 sol\fp sol4  sol8

    %23
    la\fp la4 la8 sib\f sib4 sib8
    la r r4 r2
    la2\dolce sol\tr

    %26
    fa8 r r4 r2\mbreak
    la2 sol\tr
    fa8 la,4 la8 la4  r

    %29
    R1*4
    r2 si'\mf
    do4 re mib2~

    %35
    mib4 re2 do4
    sib!2 la
    si4 do2(si4

    %38
    sib! la sol2)
    la4 sib2 la4\parenthesize ~\mbreak
    la sol2 fa4~

    %41
    fa mib re2\tr\rinf
    dod8 la\f dod mi la4 r
    R1

    %44
    r8 la, dod mi la4 r
    R1\mbreak
    r8 la, dod mi la4 r

    %47
    R1*7
    la,16.\f la'32 \slashedGrace la16 sold16. fad32 \slashedGrace fad16 mi16. re32 \slashedGrace re16 dod16. si32 la8 r r4
    la'1\p~

    %56
    la~
    la\mbreak
    la8 r r4 r2

    %59
    R1
    r16 re,\f(fa mi) re(dod re) sib'! sold(la) fa mi re do? sib la
    sold4 r r2

    %62
    R1\fermata #(skip-of-length cadenza_vcI)

    %82
    R\fermata\mbreak
    R
    fa'2 mi\tr

    %85
    re8 r r4 r2
    fa2 mi\tr
    re8 la4 la8 la2\fermata

}

IIIvlIn =\relative do'' {

    r4
    R1*7 \mbreak
    la'2\dolce sol
    fad1

    %10
    sol2 fa!
    mi1
    fa8 la, la la la la la la

    %13
    sib sib sib sib sib sib sib sib
    sib sib la la la4 r
    r fa'8 fa \slashedGrace fa16 mi8 re16 do la'8 la\mbreak

    %16
    la16(sib fad sol) sol4~sol16 fa-! mi-! re-! do-! sib-! la-! sol-!
    fa8 r r4 la8 r r fa'
    fa4\tr mi r8 sol\dolce sol(fa)

    %19
    \slashedGrace fa16 mi8 re16 do do4. do8(re mi)
    fa(la) \grace sol8 fa4~fa16 fa(la do) sib(la sol fa)
    \slashedGrace fa16 mi8 ( re16 do) do4. do8(re mi)\mbreak

    %22 fine p. 35
    fa16\fp la,8 la la la16 sol'\fp sib,8 sib sib sib16
    la'\fp do,8 do do do16 sib'\f sib8 sib sib sib16
    la-! la\dolce(sib do) do mi, (fa sol) sol(fa mi! mib) re-! re(fa re)

    %25
    do (la do la) r la(do la) r sol(sib sol) r sol(sib sol)
    la la'(sib do) do mi, (fa sol) sol(fa mi! mib) re-! re(fa re)\mbreak
    do (la do la) r la(do la) r sol(sib sol) r sol(sib sol)

    %28
    fa8 la, la la la4 r
    r2 r4 reb'~
    reb \slashedGrace reb16 do8. si16 do4 sib\mbreak

    %31
    la!1
    sib4(do reb do)
    si1

    %34
    do4 re? mib2~
    mib4 re2 do4
    sib!2 la!

    %37
    si4 do2 si4
    sib!(la sol2)
    la4 sib2 la4~\mbreak

    %40
    la sol2 fa4~
    fa mib re\rinf re'
    \once\stemDown dod8 la, \f dod mi la,4 re'8\p re

    %43
    \slashedGrace re16 dod8 si16 la re8 re \slashedGrace mi16 dod8 si16 la re8 re
    dod la, \f dod mi la,4 re'8\p re
    \slashedGrace re16 dod8 (si16 la) re8 re \slashedGrace mi16 dod8 (si16 la) re8 re

    %46
    dod la, \f dod mi la,4 r
    R1*7
    la16.\f la'32 \slashedGrace la16 sold16. fad32 \slashedGrace fad16 mi16. re32 \slashedGrace re16 dod16. si32 la8 r r4

    %55
    r8 sol'\p sol sol sol2
    r8 fa fa fa fa2
    r8 sol sol sol sol2\mbreak

    %58
    fa8 r r4 r8 re re re
    re r r4 r8 re re re
    r16 re'\f(fa mi) re(dod re sib!) sold(la) fa-! mi-! re-! do?-! sib-! la-!

    %61
    sold4 sold\p sold sold
    la2 r\fermata #(skip-of-length cadenza_vcI)

    %82
    R1\fermata\mbreak
    \once\stemUp re16\p fa'(sol la) la dod,(re mi) re(dod re do) sib!(sol sib' sol)
    fa re (fa re) r re(fa re) r dod(mi dod) r dod(mi dod)

    %85
    re fa (sol la) la dod,(re mi) re(dod re do) sib!(sol sib' sol)
    fa re (fa re) r re(fa re) r dod(mi dod) r dod(mi dod)
    re8 re, re re re2\fermata

}


IIIvlIIn =\relative do'' {

    r4
    R1*7 \mbreak
    r16 mi\p(dod la) r sol mi dod r la(dod mi) r dod(mi la)
    r la' (fad re) r do!(la fad) r re(fad la) r fad(la re)

    %10
    r re(si sol) r fa!(re si) r sol(si re) r si(re sol)
    r sol'(mi do) r sib!(sol mi) r do(mi sol) r mi(sol do)
    do8 la la la la la la la

    %13
    sib sib sib sib sib sib sib sib
    sib sib la la la4 r
    R1*3

    %18
    r4 r r8 sol-!\dolce sol(fa)
    \slashedGrace fa16 mi8 re16 do do4. do8(re mi)
    fa(la) \grace sol8 fa4~fa16 fa(la do) sib(la sol fa)

    %21
    \slashedGrace fa16 mi8 (re16 do) do4. do8(re mi)\mbreak
    fa16\fp fa8 fa fa fa16 sib16\fp sol8 sol sol sol16
    do16\fp la8 la la la16 re\f re8 re16 mi mi8 mi16

    %24
    fa la,\dolce (sib do) do mi,(fa sol) sol(fa mi mib) re-! re(fa re)
    do(fa la fa) r fa(la fa) r mi(sol mi) r mi(sol mi)
    fa(la sib do) do mi,(fa sol) sol(fa mi mib) re-! re(fa re)\mbreak

    %27
    do(fa la fa) r fa(la fa) r mi(sol mi) r mi(sol mi)
    fa8 do do do do4 r
    R1*2\mbreak

    %31
    r16 mi'\pp(do la) r mi'(do la) r mi'(do la) r mi'(do la)
    r fa(sib fa) r fa(la fa) r fa(sib fa) r fa(do' fa,)
    r fa'(re si) r fa'(re si) r fa'(re si) r fa'(re si)

    %34
    r sol(do sol) r sol(si sol) r sol(do sol) r mib?(sol do)
    r la(fad la) r la(fad la) r re,(re' re,) r re(re' re,)
    r re(re' sib?)  r sol(sib sol) r do(la do) r do(la do)

    %37
    r re(si sol) r mib'(do sol) r fa'(re fa) r fa(re fa)
    r sol, mi! do r la' fa do r sib'!(sol sib) r sib(sol sib)
    r do,(la do) r re(sib re) r mib(do mib) r mib (mib' mib,)\mbreak

    %40
    r re(re' re,) r re(re' sib) r lab(mib lab) r lab(fa lab)
    r sol(re sol) r sol(mib sol) r\rinf sol (re' sol,) r sold(re' sold,)
    la8 la,\f dod mi la, r la'\p(fa)

    %43
    mi16 (mi dod) dod re re fa fa mi mi dod dod re-! re-! fa-! fa-!
    mi8 la,\f dod mi la, r la'\p(fa)
    mi16 mi dod dod re re fa fa mi (mi dod) dod re-! re-! fa-! fa-!\mbreak

    %46
    mi8 la,\f dod mi la,4 r
    R1*7
    la16.\f la'32 \slashedGrace la16 sold16. fad32 \slashedGrace fad16 mi16. re32 \slashedGrace re16 dod16. si32 la8 r r4

    %55
    r8 sol'\p sol sol sol2
    r8 fa fa fa fa2
    r8 sol sol sol sol2\mbreak

    %58
    fa8 r r4 r8 re re re
    re r r4 r8 re re re
    r16 re'\f(fa mi) re(dod re sib!) sold(la) fa-! mi-! re-! do?-! sib-! la-!

    %61
    sold4 sold\p sold sold
    la2 r\fermata #(skip-of-length cadenza_vcI)

    %82
    R1\fermata\mbreak
    re16\p(fa sol la) la dod, (re mi) re(dod re do) sib!(sol sib' sol)
    fa-! fa(la fa) r fa(la fa) r mi(sol mi) r mi(sol mi)

    %85
    fa-!(fa sol la)  la dod,(re mi) re(dod re do) sib!(sol sib' sol)
    fa-! fa(la fa) r fa(la fa) r mi(sol mi) r mi(sol mi)
    re8 la la la la2\fermata

}


IIIvlan =\relative do' {

    la'4 \dolce
    \grace sol8 fa4(mi re fa)\rinf
    mi2. fad4\p
    sol(la sib)\slashedGrace sib16 la8 sol

    %4
    fad2(sol4)  mi
    fa? sol la \slashedGrace la16 sol8 fa
    mi2 fa4 la~

    %7
    la sol fa2\tr\mbreak
    mi8\p mi mi mi dod dod la la
    la la la la fad fad re re

    %10
    re' re re re si si sol sol
    sol sol sol sol mi mi do do
    do r r4 r2

    %13
    R1
    fa'2~fa8 fa_\markup {\italic poco \dynamic f}(la si)
    do16(sol fa mi) do8 do do2\mbreak

    %16
    do4 r r2
    R1
    r2 r8 mi\noBeam mi(fa)

    %19
    sol sol sol sol sol2
    r8 do,\startTrillSpan do do\stopTrillSpan do2
    r8 sol'\startTrillSpan sol sol\stopTrillSpan sol2\mbreak

    %22
    la8\fp fa fa fa fa,\fp fa' fa fa
    fa,\fp fa' fa fa fa16\f fa8 fa16 sol16 sol8 sol16
    la4\dolce(sib do) fa,~

    %25
    fa8 do do do r do do do
    la4(sib do) fa~\mbreak
    fa8 do do do r do do do

    %28
    la fa fa fa fa4 do'
    fa\p sol lab2
    sol1\mbreak

    %31
    do,
    reb4(mib fa do)
    re!1

    %34
    mib4 fa sol mib
    fad2 la~ _\markup {\italic poco \dynamic f}
    la4 sol2 fad4(

    %37
    fa!) mib re2
    mi!4 fa2 mi4
    mib re do2\mbreak

    %40
    sib!2(do4 re)~
    re do sib!8\rinf sib sib sib
    la8 la\f dod mi la, la' fa16\pp fa sold sold

    %43
    la la mi mi fa fa sold sold la la mi mi fa fa sold sold
    la8 la,\f  dod mi la, la' fa16\p fa sold sold
    la la mi mi fa fa sold sold la la mi mi fa fa sold sold\mbreak

    %46
    la8 la,\f dod mi la,4 la'\dolce
    \grace la8 fa4(mi re fa)
    mi2. fad4

    %49
    sol(la sib) \slashedGrace sib16 la8 sol
    fad2(sol4) mi
    fa?(sol la)\slashedGrace la16 sol8 fa

    %52
    mi2 fa4 la~\mbreak
    la sol fa2\tr
    mi16. la32 \slashedGrace la16 sold16. fad32 \slashedGrace fad16 mi16. re32 \slashedGrace re16 dod16. si32 la8(sol'?\p) sol sol

    %55
    sol(mi) mi mi mi2
    r8 re re, re re2
    r8 mi' mi mi mi2\mbreak

    %58
    re8 re, re re re4 re
    re8 re re re re4 re
    re16 re' \f (fa mi)re(dod re sib!) sold(la) fa'-! mi-! re-! do?-! sib-! la-!

    %61
    sold4 sold\p sold sold
    la2 r\fermata
    #(skip-of-length cadenza_vcI)

    %82
    R1\fermata
    fa'4\p(sol la) re,~
    re8 la la la r la la la

    %85
    fa4(sol la) re~
    re8 la la la r la la la
    fa fa fa fa fa2\fermata

}


IIIvcIn =\relative do {

    \clef tenor r4
    r2 r4 sib''\rinf~
    sib \slashedGrace sib16 la8 sold  la4 \clef violin\key re\minor la\p
    sib(do re) \slashedGrace re16 do8 sib

    %4
    la4. sib16 do sib4 \clef alto\key re\minor sol
    la sib do\slashedGrace do16 sib8 la
    sol4. la16 sib la4 \clef tenor \key re\minor sol

    %7
    \grace sol8 fa4 mi re2\tr \mbreak
    dod1
    re2 do!
    si!1

    %11
    do2 sib!
    \clef bass\key re\minor la8 fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa

    %14
    fa fa fa fa fa,4 r
    do'8 do do do do do do do\mbreak
    do do do do do2

    %17
    fa,8 r r4 fa8 r r si
    do do' do, do do2
    \clef tenor \key re\minor r8 mi'\startTrillSpan mi mi\stopTrillSpan mi4 fa8(sol)

    %20
    la la, la la la2
    r8 mi'\startTrillSpan mi mi\stopTrillSpan mi4 fa8 sol\mbreak
    fa\fp fa, fa fa \clef bass \key re\minor fa,\fp fa' fa fa

    %23
    fa,\fp fa' fa fa fa,\f fa fa fa
    fa4\p (sol la sib)
    do do do do

    %26
    fa,(sol la sib)\mbreak
    do do do do
    fa,8 fa fa fa fa4 do'

    %29
    \grace sib8 lab4\p sol fa fa'
    mi!2. mi4\mbreak
    fa(solb fa mib)

    %32
    reb(do sib lab)
    sol(lab sol fa)
    mib re do do'

    %35
    re2 fad
    sol4(mib do re)
    sol,1

    %38
    do
    fa2. fad4\mbreak
    sol sol, do(re)

    %41
    si(do) sib2\rinf
    la8 la\f dod mi la,16\p la la la la la la la
    la la la la la la la la la la la la la la la la

    %44
    la8\noBeam la\f dod mi la,16\p la la la la la la la
    la la la la la la la la la la la la la la la la\mbreak
    la8 la\f dod mi la,4 r

    %47
    r2 r4 \clef tenor\key re\minor sib''!\dolce~
    sib \slashedGrace sib16 la8 sold la4 \clef violin\key re\minor la
    sib(do re) \slashedGrace re16 do8 sib

    %50
    la4. (sib16 do) sib4 \clef alto\key re\minor sol
    la(sib do) \slashedGrace do16 sib8 la
    sol4. (la16 sib) la4 \clef tenor\key re\minor sol\mbreak

    %53
    \grace sol8 fa4 mi re2\tr
    dod16.\f\clef bass\key re\minor la32 \slashedGrace  la16 sold16. fad32 \slashedGrace fad16 mi16. re32 \slashedGrace re16 dod16. si32 la8 \clef tenor\key re\minor mi''\dolce mi mi
    \slashedGrace fa!16 mi8 re16 dod dod8~dod32 re dod re mi(re dod re mi fa mi fa) sol16(mi re dod)

    %56
    \slashedGrace mi16 re8 dod16 re re4 r2
    \clef bass\key re\minor r8 la, la la la4 la\mbreak
    \clef violin\key re\minor r8 la''4 \slashedGrace la16 sol16 fa sib8 sib4 dod8

    %59
    re16 la la4 sol32(fa mi re) sib'8 sib4 dod8
    re16 \clef tenor \key re\minor re,\f(fa mi) re(dod re sib!) sold la fa mi re do? sib la
    sold4 fa''\p fa fa

    %62
    fa1\fermata
    \cadenza_vcI

    %82
    \tempo 4 = 60 mi1\tr\fermata
    \clef bass\key re\minor re,4\p mi fa8(fad) sol sol,
    la4 la la la

    %85
    re4(mi fa8 fad) sol sol,
    la4 la la la
    re8 re, re re re2\fermata

}


IIIvcIIn =\relative do {

    la'4\dolce
    re(mi fa) re,\rinf
    dod2. do4\p
    sib(la sol) do

    %4
    re re, sol sib'(
    la sol fa) sib,
    do do, fa dod'

    %7
    re(la' sib! sold)\mbreak
    la,\p(dod mi la)
    re,,(fad la re)

    %10
    sol,(si re sol)
    do,,(mi sol do)
    fa,8 fa' fa fa fa fa fa fa

    %13
    fa fa fa fa fa fa fa fa
    fa fa fa fa fa,4 r
    do'8 do do do do do do do\mbreak

    %16
    do do do do do2
    fa,8 r r4 fa8 r r si
    do do' do, do do2

    %19
    r8 sib!\startTrillSpan sib sib\stopTrillSpan sib2
    r8 la \startTrillSpan la la\stopTrillSpan la2
    r8 sib\startTrillSpan sib sib\stopTrillSpan sib2\mbreak

    %22
    <<{la8\fp fa' fa fa}\\fa,>> fa\fp fa' fa fa
    fa,\fp fa' fa fa fa,\f fa fa fa
    fa4\p (sol la sib)
    do do do do

    %26
    fa,(sol la sib)\mbreak
    do do do do
    fa,8 fa fa fa fa4 r

    %29
    R1
    r2 r4 mi'!\mbreak
    fa(solb fa mib)

    %32
    reb(do sib lab)
    sol(lab sol fa)
    mib re do do'

    %35
    re2 fad
    sol4(mib do re)
    sol,1

    %38
    do,
    fa2. fad4\mbreak
    sol2 do4 (re)

    %41
    si(do) sib2\rinf
    la8 la\f dod mi la,16\p la la la la la la la
    la la la la la la la la la la la la la la la la

    %44
    la8\noBeam la\f dod mi la,16\p la la la la la la la
    la la la la la la la la la la la la la la la la\mbreak
    la8 la\f dod mi la,4\clef tenor \key re\minor la'\dolce

    %47
    re(mi fa) \clef bass\key re\minor re,
    dod2. do4
    sib(la sol) do

    %50
    re re, sol sib'
    la(sol fa) sib,
    do do, fa dod'\mbreak

    %53
    re(la' sib! sold)
    la16.\f la32 \slashedGrace  la16 sold16. fad32 \slashedGrace fad16 mi16. re32 \slashedGrace re16 dod16. si32 la8 r r4
    r8 la\p la la la4 la

    %56
    re, r \clef tenor \key re\minor r16 la''\dolce( re la fa' re la' fa)
    \slashedGrace fa16 mi8 re16 dod dod8~dod32 re dod re mi(re dod re mi fa mi fa) sol16(mi re dod)\mbreak
    re16 fa fa4 \slashedGrace fa16 mi re sol8 sol4 sol8

    %59
    fa fa4 fa8 sol sol4 sol8
    fa16 re\f(fa mi) re(dod re sib!) sold la fa mi re do? sib la
    sold4 re''\p re re

    %62
    re1\fermata
    \cadenza_vcII
    \clef bass\key re\minor re,4\p mi fa8(fad) sol sol,
    la4 la la la

    %85
    re4(mi fa8 fad) sol sol,
    la4 la la la
    re8 re, re re re2\fermata

}

forma = {

    \time 4/4
    \key re\minor
    \tempo 4 = 60
    \partial 4 s4
    s1*87
    \bar "|."

}


IIIfl = {
    \IIIglobal
    <<\IIIfln \forma>>
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


IIIvcI = {
    \IIIglobal
    \clef bass
    <<\IIIvcIn \forma>>
}


IIIvcII = {
    \IIIglobal
    \clef bass
    <<\IIIvcIIn \forma>>
}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IVfln =\relative do'' {

    do'4.\f sib8\p(la sol)
    fa r r4 r
    do'4.\f sib8\p(la sol)

    %4
    fa4 r r8 fa
    \slashedGrace sol16 fa8\f mi16 re re8\p re re re
    \slashedGrace mi16 re8\f do16 si si8\p si si si

    %7
    si?16\f do re mi fa8 fa fa fa
    fa4(mi) r
    R2.*3

    %12
    r4 r sol\dolce
    la2.
    sol

    %15
    la
    sol8(la sol la sol fa)
    mi(la sol la sol fa)

    %18
    mi(la sol la sol fa)
    mi(la sol la sol fa)
    mi16(do sol' mi) do'4 r

    %21
    r4 r r8 fa,\f
    fa\tr re16 si do do' (si do) \slashedGrace re16 do8 si16 la
    sol8 mi~mi16 mi fa sol \slashedGrace sol16 fa8 mi16 re

    %24
    do8 sol do4 r
    R2.*2
    la8 si16 dod re mi fa sold la8 la

    %28
    fa re4 re re8\mbreak
    R2.*2
    sol,8\f la16 si do re mi fa sol8 sol,

    %32
    mi' do4 do do8
    do'2\p \slashedGrace do16 sib!8(la)
    sib2.

    %35
    la2 si4
    do2 r4
    do2 \slashedGrace do16 sib!8(la)\mbreak

    %38
    sib2.
    la2 si4
    do2 r4

    %41
    do4.\f sib!8\p( la sol)
    fa r r4 r
    do'4.\f sib8\p( la sol)

    %44
    fa4 r r
    R2.*5
    r4 r16 fa\f mi fa \slashedGrace sol16 fa8 mi16 re

    %51
    do8 do'4 la16 do \slashedGrace do16 sib8 la16 sol
    fa8 do la4 r

    %% Seconda variazione

    R2.*32
    do'2.\p~
    do~
    do~
    do~
    do~
    do~
    do~
    do4 r r
    R2.*12

    %% terza variazione
    R2.*32
    do2.~
    do~
    do~
    do~
    do~
    do~
    do~
    do4 r r
    R2.*12

    %% quarta variazione
    R2.*52

    %quinta variazione
    do2.
    do16(sib la sol fa sol la sib do re mi fa)
    do2.

    %4
    do16(sib la sol) fa(sol la sib do re mi fa)
    fa fa, mi fa fa8.\tr mi32 fa fa8.\tr mi32 fa
    re'16 fa, mi fa fa8.\tr mi32 fa fa8.\tr mi32 fa

    %7
    re'16 fa, mi fa fa8.\tr mi32 fa fa8.\tr mi32 fa\mbreak
    mi8\noBeam do16(si) re[(do)] mi(re) fa[(mi)] sol(fa)
    \grace la8 sol2.

    %10
    sol16 mi fa re do mi re fa mi sol fa la
    sol2.
    sol16 mi fa re do8 do\tr do'[do]

    %13
    do4(la8) do,\tr do' do
    do4(sol8) do,\tr do' do
    do4(la8) do,\tr do' do\mbreak

    %16
    do4(sol8) do,\tr do'-! do-!
    do2.\tr
    do2.\tr

    %19
    do2.\tr
    do4 r8 mi,,16(sol fa la sol si)
    la(do si? re) do(mi re fa mi sol fa la)

    %22
    \slashedGrace la16 sol8 fa16 mi fa(sol la si do re mi re)
    do(sol) mi do re2\tr
    do4 r r\mbreak

    %25
    la'2(sol4
    fa2 mi4
    re2 dod 4)

    %28
    re8 mi16(fa sol la si do) re(do si la)
    sol2(fa4
    mi2 re4

    %31
    do2 si4)
    do16 (mi do sol mi sol do sol mi' do sol' mi)
    do'2.\dolce

    %34
    do
    do\mbreak
    do

    %37
    do16 do, do8\tr do'16 do, do8\tr do'16 do, do8\tr
    sib'!16 do, do8\tr sib'16 do, do8\tr sib'16 do, do8\tr
    la'16 do, do8\tr la'16 do, do8\tr  la'16 do, do8\tr

    %40
    sol'4 r r
    do2.
    do16 sib la sol fa(la sol sib la do sib re)

    %43
    do2.\mbreak
    do16(la sib sol) fa(la do la) sib (sol sib sol)
    mi4 fa16(la do la) sib (sol sib sol)

    %46
    mi4 fa8 fa(\slashedGrace fa16 mi8 re)
    do4. re16 do\slashedGrace do16 sib8\tr la16 sib
    \grace sib8 la4~la16 la'(do la) sib sol sib sol

    %49
    mi4 fa16 la do la sib(sol sib sol)
    mi(sib' sol mi) fa(la sol fa sol la sib do)\mbreak
    re(re, re' sib) la(do fa, la) \slashedGrace la16 sol8 fa16 mi

    %52
    fa(do' la fa) do(fa do la) fa4

    % sesta variazione
    R2.*32
    do''2.\p~
    do~
    do~
    do~
    do~
    do~
    do~
    do4 r r
    R2.*12

    % settima variazione
    do2.\dolce
    do,
    do'

    %4
    do,
    fa
    fa,

    %7
    fa'
    mi4 r r
    sol2.\mbreak

    %10
    sol,
    sol'
    sol,2 sol'4

    %13
    la2 si4
    do2 sol,4
    la2 si4

    %16
    do2.
    do'\mbreak
    do,

    %19
    do'
    do16(sol) mi do sol mi' do sol mi4
    R2.*2

    %23
    mi'16\f fa sol la \slashedGrace la16 sol8 fa16 mi \slashedGrace sol16 fa8 mi16 re
    do2 r4
    la'2.\dolce\mbreak

    %26
    la,
    la'8\f la4 la la8
    fa16 re mi fa sol la si? dod re dod si! la

    %29
    sol2.\p
    sol,
    sol'8\f sol4 sol sol8

    %32
    mi16 do re mi fa sol la si do sol mi do
    do'2.\mbreak
    do,

    %35
    do'
    mi,16\f(fa sol mi) do8 do do4
    do'2.\p

    %38
    do,
    do'
    mi,16\f (fa sol mi) do8 do do4\mbreak
    do'2.\dolce

    %42
    do,
    do'
    do,4 r r

    %45
    R2.
    r4 fa16\f sol la sol \slashedGrace sol16 fa8 mi16 re
    \slashedGrace re16 do8 sib16 la  \slashedGrace re16 do8 sib16 la\slashedGrace do16 sib8 la16 sol

    %48
    la(do) fa la do4 r\mbreak
    R2.
    r4 fa,16\f (sol) la sol \slashedGrace sol16 fa8 mi16 re

    %51
    do do' sib la \slashedGrace re16 do8 sib16 la \slashedGrace do16 sib8 la16 sol
    fa do la do fa,8 fa fa4

}

IVvlIn =\relative do'' {

    do4.\f sib8\p-! la-! sol-!
    fa-! sol-! la-! sib-! do-! re-!
    do4.\f sib8\p-! la-! sol-!

    %4
    fa-! la-! do-! fa-! la-![fa-!]
    \slashedGrace sol16 fa8\f mi16 re re8-!\p re-! re-! re-!
    \slashedGrace mi16 re8\f do16 si si8-!\p si-! si-! si-!

    %7
    si?16\f(do re mi) fa8 fa fa fa
    fa4(mi) r
    r8 sol,\p-! la-! si-! do-! re-!\mbreak

    %10
    mi-! fa-! sol-! r r4
    r8 sol,-! la-! si-! do-! re-!
    mi-! fa-! sol-! sol\tr do-![sol-!]

    %13
    la r r la\tr  do-! la-!
    sol r r sol\tr do-! sol-!
    la r r la\tr  do la

    %16
    sol do-! do-! do-! do-! do-!
    do-! do-! do-! do-! do-! do-!
    do-! do-! do-! do-! do-! do-!

    %19
    do-! do-! do-! do-! do-! do-!
    do4 r8 mi,,-! fa-! sol-!\mbreak
    la si-! do-! re-! mi-! fa-!

    %22
    fa\f(re16) si do-! do(si do) \slashedGrace re16 do8 si16 la
    sol8 mi~mi16 mi(fa) sol \slashedGrace sol16 fa8 mi16 re
    do8 sol do4 r

    %25
    mi'8\p-! fa-! sol4 r
    mi8-! fa-! sol4 r
    la,8\f si16 dod re mi fa sold la8 la,

    %28
    fa' <<{re,4 re re8}\\{re4 re re8}>>\mbreak
    re'-!\p mi-! fa4 r
    re8-! mi-! fa4 r

    %31
    sol,8\f la16 si do re mi fa sol8 sol,
    mi' do,4 do do8
    do'\p do4 do8(sib! la)

    %34
    sol sib4 sol mi8
    fa fa4 fa8(mi re)
    do16\tr(si do re) do8 do do do

    %37
    do'\f do4 do8\p(sib la)\mbreak
    sol sib4 sol mi8
    fa fa4 fa8(mi re)

    %40
    do16\tr(si do re) do8 do do do
    do'4.\f sib?8-! \p la-! sol-!
    fa-! sol-! la-! sib-! do-! re-!

    %43
    do4.\f sib8\p-! la-! sol-!
    la-! do-! fa-! la-! sol-! sib-!
    mi,4(fa8) \slashedGrace la16 sol fa sol8-! sib-!

    %46
    mi,4(fa8) fa \slashedGrace sol16 fa8(mi16 re)\mbreak
    do8 do4 la16 do \slashedGrace do16 sib8 la16 sol
    sib4(la8) la' sol-! sib-!

    %49
    mi,4(fa8) \slashedGrace la16 sol fa sol8 sib
    mi,4 fa16 fa\f(mi fa) \slashedGrace sol16 fa8 mi16 re
    do8 do4 la16 do \slashedGrace do16 sib8 la16 sol

    %52
    fa8 do <fa la,>4 r

    %% Seconfa variazione
    do'8.\p fa16 \slashedGrace mi16 re8 do16 sib \slashedGrace la16 sol8 fa16 mi
    fa8 r r do'-! do-! do-!
    do8. fa16 \slashedGrace mi16 re8 do16 sib \slashedGrace la16 sol8 fa16 mi

    %4
    fa8 fa_\tr sol(mi) fa[re']
    si2.
    si

    %7
    si
    do4 r8 mi, mi mi\mbreak
    mi mi'4 sol fa8

    %10
    fa4(mi8) mi mi mi
    mi do'4 mi re8
    re4(do) r

    %13
    si,(re si)
    sol2 r4
    si(re si)

    %16
    sol2 r4\mbreak
    r8 sol'-! mi-! do-! sol \noBeam r
    r8 sol'-! mi-! do-! sol\noBeam r

    %19
    mi r mi r mi r
    mi sol mi4 r
    R2.

    %22
    do'2.~
    do8 do do do si si
    do4 r r\mbreak

    %25
    dod,2.
    mi
    dod'

    %28
    dod?4. (re16 mi) re4
    si,2.
    re

    %31
    si'\mbreak
    si?4. (do16 re) do4
    la2.\p

    %34
    sib!
    la2 fa4
    mi8(fa sol la sib sol)

    %37
    la2.
    sib
    la2 si4

    %40
    mi mi, r
    R2.*3
    r4 r re

    %45
    do2(re4)
    do2 r4
    R2.

    %48
    r4 r sib'~
    sib la sib~\mbreak
    sib4 la8 fa'16 mi \slashedGrace mi16 re8 do16 sib

    %51
    la(do) sib la sol8 sib \slashedGrace la16 sol8 fa16 mi
    fa8 do <fa la,>4 r

    %% terza variazione
    R2.*19
    r4 r8 mi-!\dolce fa-! sol-!
    la-! si-! do-! re-! mi-! fa-!

    %22
    fa8(re16 si) do8 r r4\mbreak
    R2.*2
    r4 dod dod


    %25
    r dod dod
    r dod dod
    re r r

    %28
    r si si\mbreak
    r si si

    %31
    r si si
    do r r
    do4.\dolce( la8) sib!4

    %34
    sib4.(sol8 la4)
    sol8(fa) fa8._\tr mi32 fa sol8 fa
    mi16(fa sol mi) do8 r r4

    %37
    do'4.(la8 sib4)\mbreak
    sib4. (sol8 la4)
    sol8(fa) fa8._\tr mi32 fa sol8 fa

    %40
    mi16(fa sol mi) do4 r
    R2.*12

    % quarta variazione
    R2.*11
    r4 r sol'
    lab2.

    %14
    sol
    lab
    sol4 r r\mbreak

    %17
    R2.*9
    dod2.
    re?4 r r

    %28
    R2.*3
    si2.
    do4 r r\mbreak

    %33
    do8 do4 do8 \slashedGrace reb16 do8 sib16 lab
    sib8 sib4 sib8 \slashedGrace do16 sib8 lab16 sol
    lab8 lab4 lab16 sol fa8._\tr mi32 fa

    %36
    mi?16 fa sol mi do8 do do4
    R2.*16

    %% quarta variazione
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    la'8_\markup\italic "pizzicato" do sib la sib sol
    la r r4 r
    la8 do sib la sib sol

    %4
    la r r4 r
    si8 re si re si re
    si8 re si re si re

    %7
    si8 re si re si re\mbreak
    do r r4 r
    do8 mi re do re si

    %10
    do4 r r
    do8 mi re do re si
    do r r do sol do

    %13
    la do la do la do
    sol do sol do sol do
    la do la do la do\mbreak

    %16
    sol do sol do sol do
    do fa mi fa re mi
    do fa mi fa re mi

    %19
    do fa mi fa re mi
    do sol mi[do re mi]
    fa sol la si do re

    %22
    mi4 r r
    r8 do\noBeam do do si si
    do sol mi4 r\mbreak

    %25
    la8 fa la fa sol mi
    fa re fa re mi dod
    la' fa la fa sol mi

    %28
    fa r r4 r
    sol'8 mi sol mi fa re
    mi do mi do re si

    %31
    sol'8 mi sol mi fa re
    mi r r4 r
    do8 la' do, la' do, la'

    %34
    sib, sol' sib, sol' sib, sol'
    la, fa' la, fa' la, fa'\mbreak
    sol, mi' sol, mi' sol, mi'

    %37
    do8 la' do, la' do, la'
    sib, sol' sib, sol' sib, sol'
    la, fa' la, fa' la, fa'

    %40
    mi re do sib la sol
    la do sib la sib sol
    la4 r r

    %43
    la8 do sib la sib sol\mbreak
    la4 r sib8 sib'
    sib, sib' la, la' re,  sib'

    %46
    sib, sib' la,4 r
    la8 do la do sol sib
    la do la la' sib, sib'

    %49
    sib, sib' la, la' re, sib'
    sib, sib' la,\noBeam r r4\mbreak
    fa'8 re do[la] sib sol

    %52
    fa fa' fa,4 r
    \set Staff.midiInstrument = #"violin"

    %% sesta variazione
    do'8.\tr_\solo re16 do do' sib, sib' la, la' sol, sol'
    fa,8._\tr sol16 fa fa' sol, sol' la, la' sib, sib'
    do,8.\tr re16 do do' sib, sib' la, la' sol, sol'

    %4
    fa,8._\tr sol16 fa fa' mi fa \slashedGrace sol16 fa8 mi16 re
    \slashedGrace do16 si8 re,16 fa \slashedGrace mi16 re8 si'16 re \slashedGrace do16 si8 fa'16 la\mbreak
    \slashedGrace sol16 fa8 si16 re \slashedGrace do16 si8 re16 fa \slashedGrace mi16 re8 fa16 la

    %7
    \grace la8 sol4 fa16 sol la sol \slashedGrace sol16 fa8 mi16 fa
    \grace fa8 mi4 r16 do, do8\tr mi16 do do8\tr
    sol'16 do, do8\tr do'16 do, do8\tr la'16 do,  fa do

    %10
    mi16 do do8\tr mi,16 do' do8_\tr mi16 do do8\tr
    sol'16 do, do8\tr do'16 do, do8\tr la'16 do,  fa do
    mi16 do do8\tr mi, do' do do

    %13
    do16(re mi re) do do' do, do' re, re' re, re'
    mi,(fa sol fa) mi mi' mi, mi' fa, fa' fa, fa'\mbreak
    sol,(la si la) sol sol' sol, sol' la, la' si, si'

    %16
    do,(do') r8 r4 sol,16_\markup\italic "Arp.[eggio]"(do mi, do')
    sol(do mi, do') sol(do mi, do') sol(do do' do,)
    sol(do do' do,) sol(do do' do,) sol(do mi, do')

    %19
    sol(do mi, do')  sol(do mi, do')  sol(do do' do,)
    << <do' do,>8\\sol,>> r r16 sol,,16 la si do re mi fa
    sol la si do re mi fa sol la si do re\mbreak

    %22
    mi fa fa8\tr sol8 sol\tr la \once\stemUp la,,,
    sol4 re''2\tr
    do4 r r

    %25
    la'8 la4 (si16 dod re mi fa sold)
    la4 r r
    la,,,16(dod mi la) dod(mi la dod) \once\stemDown mi \stemUp la,, mi' sol\stemNeutral

    %28
    fa(la) re,[(fa)] mi (sol) dod,[(mi)] re(la fa re)
    sol,8 sol''4 la16 si do re  mi fa
    sol4 r r\mbreak

    %31
    sol,,,16(si re sol) si re sol si re8 fa,
    mi16(sol) do sol mi do sol mi do8 do
    do'16 (do') la, do' do, do' la, do' do, do' la, do'

    %34
    sib,(mi) do mi sib mi do mi sib mi do mi
    la,(fa') fa, fa'  la, fa' fa, fa' la, fa' fa, fa'
    mi,(do') do, do' mi, do' do, do' mi, do' do, do'

    %37
    do(do') la, do' do, do' la, do' do, do' la, do'\mbreak
    sib,(mi) do mi sib mi do mi sib mi do mi
    la,(fa') fa, fa' la, fa' fa, fa' la, fa' fa, fa'

    %40
    mi,(do') do, do' mi, do' do, do' mi, do' do, do'
    do8.\tr re16 do do' sib, sib' la, la' sol, sol'
    fa,8._\tr sol16 fa fa' sol, sol' la, la' sib, sib'

    %43
    do,8.\tr re16 mib!(do) la fa mib'(do) la fa
    re'(sib do re) mib (mi fa fad sol la sib sol)\mbreak
    mi(do si sib) la fa' mi fa sol la sib sol

    %46
    mi(do si sib) la fa'(sol la sib do re mi)
    fa(do) fa(re) \slashedGrace re16 do8  sib16 la\slashedGrace do16 sib8 la16 sol
    la8.\tr sib16 do(la,) fa' la sol (la sib sol)

    %49
    mi(do si sib) la fa'(mi fa sol la sib sol)
    mi(do si sib) la fa'(sol la sib do re mi)\mbreak
    fa(do) fa(re) \slashedGrace re16 do8  sib16 la\slashedGrace do16 sib8 la16 sol

    %52
    fa8 do fa,4 r

    %% Settima variazione
    la16\p^\markup\italic "Sul ponticello" sib do la sib do sib la sol la sib sol
    la sib do sib la sib do sib la sib do sib
    la sib do la sib do sib la sol la sib sol

    %4
    la sib do sib la sib do sib la sib do la
    si do re do si do re do si do re do
    si do re do si do re do si do re do

    %7
    si? do re do si do re do si do re si
    do re mi re do re mi re do re mi re
    do4 r r\mbreak

    %10
    mi16 fa sol mi fa sol fa mi re  mi fa re
    do re mi do re mi re do si do re si
    do re mi re do re mi do sol mi fa sol

    %13
    la sol fa sol la do si la si re do si
    do re mi re do re mi do sol mi fa sol
    la sol fa sol la do si la si re do si

    %16
    do re mi re do re mi re do re mi re
    do re mi re do re mi re do re mi re\mbreak
    do re mi re do re mi re do re mi re

    %19
    do re mi re do re mi re do re mi re
    do8 r r4 mi16 sol fa mi
    re fa mi re do mi re do si re do si

    %22
    la do si? la sol si la sol fa la\f sol fa
    mi fa sol la \slashedGrace la16 sol8 fa16 mi \slashedGrace sol16 fa8 mi16 re
    do8 do' do,4 r

    %25
    R2.*2
    <<{mi'16\f fa sol fa mi fa sol fa mi fa sol mi}\\la,2.>>
    fa'16 re mi fa sol la si? dod re8 r

    %29
    R2.*2
    re,16\f(mi) fa mi re(mi) fa mi re(mi) fa re
    mi do re mi fa sol la si do?4

    %33
    la,16\p sib! do sib la sib do sib la sib do la\mbreak
    sol la sib la sol la sib la sol la sib sol
    fa sol la sol fa sol la sol fa sol la fa

    %36
    mi\f fa sol mi do8 do do[(sol')]
    la16\p sib do sib la sib do sib la sib do la
    sol la sib la sol la sib la sol la sib sol

    %39
    fa sol la sol fa sol la sol fa sol la fa
    mi\f fa sol mi do8 do do4\mbreak
    R2.*2

    %43
    la'16\p sib do la sib do sib la sol la sib sol
    la sib do sib la(do) fa la sol la sib sol
    mi fa sol mi fa sol la fa sol la sib sol

    %46
    mi fa sol mi fa\f(sol) la sol \slashedGrace sol16 fa8 mi16 re
    \slashedGrace re16 do8 sib16 la \slashedGrace re16 do8 sib16 la \slashedGrace do16 sib8 la16 sol
    la(do) fa la do8 la16 fa sol\p la sib sol\mbreak

    %49
    mi fa sol mi fa sol la fa sol la sib sol
    mi fa sol mi fa(sol) la sol \slashedGrace sol16 fa8 mi16 re
    \slashedGrace re16 do8 sib16 la \slashedGrace re16 do8 sib16 la \slashedGrace do16 sib8 la16 sol

    %52
    fa(do) la do <fa la,>8 <fa la,> <fa la,>4

}


IVvlIIn =\relative do'' {

    <<la4.\f\\la>> sol8-!\p fa-! do-!
    la-! do-! fa-! sol-! la-! sib-!
    <<la4.\f\\la>> sol8-!\p fa-! do-!

    %4
    la-! do-! fa(la16 do) fa8 re
    \slashedGrace mi16 re8\f do16 si si8\p si si si
    re(re,) re\p[re re re]

    %7
    <<{re\f re4 re8}\\{re re4 re8}>> re'[re]
    re4(do) r
    r8 mi,-!\p fa-! sol-! la-! si-!\mbreak

    %10
    do-! re-! mi-! r r4
    r8 mi,-! fa-! sol-! la-! si-!
    do-! re-! mi-! do-! do-! do-!

    %13
    do[do\tr] la' do,-! do-! do-!
    do[do\tr] sol' do, do do
    do[do\tr] la' do, do do

    %16
    do do do do do do
    do do do do do do
    do do do do do do

    %19
    do do do do do do
    do4 r8 do,-! re-! mi-!
    fa-! sol-! la-! si-! do-! la-!

    %22
    <sol sol,>8\f  <sol sol,>4 <sol sol,>8 \slashedGrace sib16 la8 sol16 fa
    mi8 do~do16 do(re) mi \slashedGrace mi16 re8 do16 si
    do8 sol do4 r

    %25
    dod'8-!\p re-! mi4 r
    dod8-! re-! mi4 r
    <dod mi,>8\f <dod mi,>4 <dod mi,> <dod mi,>8

    %28
    re8 fa,16(sol) la8 fa <<re4\\re>>\mbreak
    si'8\p-! do!-! re4 r
    si8-! do-! re4 r

    %31
    <si re,>8\f <si re,>4 <si re,> <si re,>8
    do8 mi,16(fa) sol8 mi do[sib!]
    do la'4\p la8(sol fa)

    %34
    mi8 sol4 sib sib8
    la4 la,(si)
    do16\tr(si do re) do8 do do(sib!)

    %37
    la\f la'4 la8\p(sol fa)\mbreak
    mi8 sol4 sib sib8
    la4 la,(si)

    %40
    do16\tr(si do re) do8 do do(sib!)
    la\f la'4 sol8\p-! fa-! do-!
    la-! do-! fa-! sol-! la-! sib-!

    %43
    <<la4.\f\\la>> sol8\p-! fa-! mi-!
    fa la la fa re4
    do2 re4

    %46
    do~do8 do' \slashedGrace mi16 re8 do16 sib\mbreak
    la8 la4 fa16 la \slashedGrace la16 sol8 fa16 mi
    mi4(fa re)

    %49
    do2 re4
    do4. do'8\f \slashedGrace mi16 re8 do16 sib
    la8 la4 fa16 la \slashedGrace la16 sol8 fa16 mi

    %52
    fa8 do <fa la,>4 r

    %2da variazione
    la'16(fa) sib la \slashedGrace sol16 fa8 mi16 re  \slashedGrace do16 sib8 la16 sol
    fa sib(la) re(do) fa(mi) la(sol do, sib' do,)
    la'16(fa) sib la \slashedGrace sol16 fa8 mi16 re  \slashedGrace do16 sib8 la16 sol

    %4
    fa(do) la do sib(do) sol sib la8 \once\stemDown fa''
    \slashedGrace sol16 fa8 mi16 re \slashedGrace do16 si8 la16 sol fa(re) sib sol
    \slashedGrace sol''16 fa8 mi16 re \slashedGrace do16 si8 la16 sol fa(re) sib sol

    %7
    fa''\dolce(mi sol fa la sol si la) \slashedGrace sol fa8 mi16 fa
    fa4(mi8) sol sol sol
    sol do4 (mi re8)

    %10
    re4(do8) do do do
    do mi4 (sol fa8)
    fa4(mi) sol,16(la sol) sol'

    %13
    \slashedGrace sol16 fa8 mi16 fa \slashedGrace sol16 fa8 mi16 fa sol,(la sol) fa'
    \slashedGrace fa16 mi8 re16 mi \slashedGrace fa16 mi8 re16 mi sol,(la sol) sol'
    \slashedGrace sol16 fa8 mi16 fa \slashedGrace sol16 fa8 mi16 fa sol,(la sol) fa'

    %16
    \slashedGrace fa16 mi8 re16 mi \slashedGrace fa16 mi8 re16 mi mi(fa mi fa)\mbreak
    sol8.(mi16) sol8 r mi16(fa mi fa)
    sol8.(mi16) sol8 r mi16(fa mi fa)

    %19
    sol(mi) sol(mi) sol(mi) sol(mi) sol(mi) sol(mi)
    sol8 r r mi,,16(do) fa(re) sol(mi)
    la(fa) si(sol) do(la) re(si) mi(do) fa(re)

    %22
    sol(mi) la fa sol(mi) la fa sol(mi) la fa
    sol(mi) fa re re2\tr
    do8 sol do,4 r\mbreak

    %25
    la''16-!\fp la(si dod) \slashedGrace si16 la8 sold16 la \slashedGrace si16 la8 sold16 la
    dod-!\fp dod(re mi) \slashedGrace re16 dod8 si16 dod \slashedGrace re16 dod8 si16 dod
    mi8 mi\tr la-![mi-! la-! mi-!]

    %28
    mi4.(fa16 sol) fa4
    sol,!16\fp-! sol(la si) \slashedGrace la16 sol8 fad16 sol \slashedGrace la16 sol8 fad16 sol
    si-! si(do re) \slashedGrace do16 si8 la16 si \slashedGrace do16 si8 la16 si

    %31
    re8 re\tr sol-![re-! sol-! re-!]\mbreak
    re4.(mi16 fa) mi4
    do,8\dolce(fa4 la fa8

    %34
    mi) sib'?4(sol mi8)
    fa16(sol la sol) fa8 re do si
    re(do) do2~

    %37
    do8(do'4 la fa8)
    mi sib'?4 sol mi8
    fa16(sol la sol) fa (sol la sol) fa8 fa

    %40
    \slashedGrace fa16 mi8 re16 do do4 r
    do16\p(do,) do' (do,) do'(do,) sib'(do,) la'(do,) sol'(do,)\mbreak
    fa(do) mi(do) fa(do) sol'(do,) la'(do,) sib'(do,)

    %43
    do'(do,) do' (do,) do'(do,) sib'(do,) la'(do,) sol'(do,)
    la'8.\tr sib16 do4 sol'16(sib) sol[(sib)]
    mi,(sol) mi[(sol)] fa(la) fa[(la)] sol(sib) sol[(sib)]

    %46
    mi,(sol) mi[(sol)] fa8 fa'(mi re)
    re(do) do8.\tr re16 do8-! sib-!
    sib4(la) sol16 (sib) sol[(sib)]

    %49
    mi,(sol) mi[(sol)] fa(la) fa[(la)] sol(sib) sol[(sib)]\mbreak
    mi,(sol) mi[(sol)] fa16\f(sol) la sol\slashedGrace sol16 fa8 mi16 re
    do16(la') sol fa mi(sib') sol mi do(sib) la sol

    %52
    fa8 do <fa la,>4 r

    %% terza variazione
    la4~la16 (fa la fa) \slashedGrace la16 sol8 (fa16 mi)
    fa4 r r
    la~la16 (fa la fa) \slashedGrace la16 sol8 (fa16 mi)\mbreak

    %4
    fa4  r la
    si re, si'~
    si re, si'~

    %7
    si re, si'~
    si do8 mi, mi mi
    mi4 r r

    %10
    r r8 do' do do
    do4. si16 do \slashedGrace mi16 re8 do16 si
    si?4(do) mi,

    %13
    fa2.\mbreak
    mi8 mi mi mi mi mi
    fa2.

    %16
    mi8-! sol-! mi\noBeam r r4
    mi8 sol-! mi-!\noBeam r r4
    mi8 sol mi\noBeam r r4

    %19
    mi8 r mi r mi r
    mi4 r8 do-! re-! mi-!
    fa-! sol-! la-! si-! do-! la-!

    %22
    sol sol sol4 r\mbreak
    R2.*2
    r4 mi mi

    %26
    r mi mi
    r mi mi

    %28
    fa r r
    r re re\mbreak
    r re re

    %31
    r re re
    mi r r
    mi\dolce( fa sol)

    %34
    mi2 fa4
    re8 re re re re re
    do4 r r

    %37
    mi(fa sol)\mbreak
    mi2 fa4
    re8 re re re re re

    %40
    do4 r r
    la'~la16 fa la fa \slashedGrace la16 sol8 fa16 mi
    fa4 r r

    %43
    la~la16 fa la fa \slashedGrace la16 sol8 fa16 mi
    fa4 r sol(
    mi) fa8(la re, sol)\mbreak

    %46
    mi4(fa) r
    r8 la~la16 fa la fa \slashedGrace la16 sol8 fa16 mi
    \grace sol8 fa2 re8 sol

    %49
    mi4 fa8(la re, sol)
    mi4(fa) r
    r8 la~la16 fa la fa \slashedGrace la16 sol8 fa16 mi

    %52
    fa4  r r

    %quarta variazione
    R2.*11
    r4 r mib
    fa2.

    %14
    mib
    fa
    mib4 r r\mbreak

    %17
    R2.*14
    re2.
    do4 r r\mbreak

    %33
    lab'8 lab4 lab8 \slashedGrace sib16 lab8 sol16 fa
    sol8 sol4 sol8 \slashedGrace lab16 sol8 fa16 mi
    fa8 fa4 fa16(sol) lab8 si

    %36
    do do, do do do4
    R2.*16

    %% quarta variazione
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    fa8_\markup\italic "pizzicato" la sol fa sol mi
    fa r r4 r
    fa8 la sol fa sol mi

    %4
    fa r r4 r
    fa8 si' fa, si' fa, si'
    fa, si' fa, si' fa, si'

    %7
    fa, si' fa, si' fa, si'\mbreak
    do, r r4 r
    mi8 sol fa mi fa re

    %10
    mi8 r r4 r
    mi8 sol fa mi fa re
    mi r r mi do' mi,

    %13
    do' fa, do' fa, do' fa,
    do' mi, do' mi, do' mi,
    do' fa, do' fa, do' fa,\mbreak

    %16
    do' mi, do' mi, do' mi,
    do la sol la fa sol
    mi la sol la fa sol

    %19
    mi la sol la fa sol
    mi mi do do re [mi]
    fa sol la si do re

    %22
    mi4 r r
    r8 do\noBeam do do si si
    do mi, do4 r\mbreak

    %25
    la'8 la' la la la la
    la la la la la la
    la la la la la la

    %28
    la r r4 r
    mi8 do mi do re si
    sol' mi sol mi fa re

    %31
    mi8 do mi do re si
    do r r4 r
    la8 do la do la do

    %34
    sol sib sol sib sol sib
    fa la fa la fa la\mbreak
    mi sol mi sol mi sol

    %37
    la8 do la do la do
    sol sib sol sib sol sib
    fa la fa la fa la

    %40
    do sib la sol fa mi
    fa la sol fa sol mi
    fa4 r r

    %43
    fa8 la sol fa sol mi\mbreak
    fa4 r re'8 sib
    sol mi do la' re sol

    %46
    sol, mi do[fa fa fa]
    fa la fa la mi sol
    fa la fa fa' re sib

    %49
    sol mi do la' sib sol'
    sol,[mi] do fa fa fa\mbreak
    fa fa' fa fa, sol[mi]

    %52
    fa do la4 r
    \set Staff.midiInstrument = #"violin"

    %% sesta variazione
    R2.*11
    r4 r8 mi' mi mi
    mi16(fa sol la) mi8 do' si si

    %14
    do16(re mi re) do8 do re re\mbreak
    mi16(fa sol fa) mi8 mi fa fa
    mi do16(sol) mi4 r

    %17
    r r8 mi mi mi
    mi(mi') mi4 r
    r r8 mi, mi mi

    %20
    mi(mi') mi4 r
    R2.\mbreak
    do8 do do do do do

    %23
    do do do do si[si]
    do4 r r
    R2.

    %26
    r8 la(sol fa! mi re)
    dod2.
    re8 r r4 r

    %29
    R2.
    r8 sol (fa mi re do!)\mbreak
    si2.

    %32
    do4 r r
    r8 do' do do do do
    r do do do do do

    %35
    r8 do do do do do
    r8 do do do do do
    r8 do do do do do\mbreak

    %38
    r8 do do do do do
    r8 do do do do do
    r8 do do do do do

    %41
    R2.*2
    do2.
    sib4 r r\mbreak

    %45
    R2.*2
    r8 sib' \slashedGrace sib16 la8 sol16 fa \slashedGrace la16 sol8 fa16 mi
    fa8.\tr sol16 la4 r

    %49
    R2.*2
    r8 sib \slashedGrace sib16 la8 sol16 fa \slashedGrace la16 sol8 fa16 mi
    fa8 la, <<la4\\fa>> r

    %% settima variazione
    R2.*8
    mi'16\p^\markup\italic "Sul ponticello" fa sol mi fa sol fa mi re  mi fa re
    do re mi do re mi re do si do re si

    %10
    mi fa sol mi fa sol fa mi re  mi fa re
    mi fa sol fa mi fa sol mi mi, do re mi
    fa mi re mi fa la sol fa re fa mi re

    %13
    mi fa sol fa mi fa sol mi do8 do
    do4 r r
    R2.

    %16
    mi'16 fa sol fa mi fa sol fa mi fa sol fa\mbreak
    mi8 r r4 r
    mi16 fa sol fa mi fa sol fa mi fa sol fa

    %19
    mi8 r r4 do16 mi re do
    si re do si la do si la sol si la sol
    fa la sol fa mi sol fa mi re fa mi re

    %22
    do8\f do'4 do,8 \slashedGrace mi16 re8 do16 si
    do8 do' do,4 r
    dod'16\p re mi re dod re mi re dod re mi re\mbreak

    %25
    dod re mi re dod re mi re dod re mi re
    dod\f re mi re dod re mi re dod re mi dod
    re8 mi16 fa sol la si dod re8 r

    %28
    si,16\p do re do si do re do si do re do
    si do re do si do re do si do re do
    si\f do re do si do re do si do re si

    %31
    do8 re16 mi fa sol la si do?4
    R2.*2
    la,16\p sib? do sib la sib do sib la sib do la

    %35
    sol8\f sol16 mi do8 do do4
    R2.*2
    la'16 sib do sib la sib do sib la sib do la

    %38
    sol8\f sol16 mi do8 do do4\mbreak
    la'16\p sib do la sib do sib la sol la sib sol
    la sib do sib la sib do sib la sib do sib

    %41
    la8 do,4 do do8
    do4 r r
    R2.

    %44
    r4 r \slashedGrace sol''16 fa8\f mi16 re
    \slashedGrace re16 do8 sib16 la \slashedGrace re16 do8 sib16 la \slashedGrace do16 sib8 la16 sol
    la(do) fa la do4 r\mbreak

    %47
    R2.
    r4 fa,16\f sol la sol \slashedGrace sol16 fa8 mi16 re
    \slashedGrace re16 do8 sib16 la \slashedGrace re16 do8 sib16 la \slashedGrace do16 sib8 la16 sol

    %52
    fa(do) la do <fa la,>8 <fa la,> <fa la,>4






}


IVvlan =\relative do' {

    do4\f do\p do
    do r r
    do\f do do

    %4
    do r r
    r fa\p fa
    <fa fa,>\f fa\p fa

    %7
    fa16 mi re do si8 si si si
    <do do,>4 r8 mi-!\p sol-! fa-!
    mi r r4 r\mbreak

    %10
    r4 r8 mi-! sol-! fa-!
    mi r r4 r
    r r8 do-! do-! do-!

    %13
    do(la) do-![do-! do-! do-!]
    do(sol) do-![do-! do-! do-!]
    do(la) do-![do-! do-! do-!]

    %16
    do8(la' sol la sol fa)
    mi(la sol la sol fa))
    mi(la sol la sol fa)

    %19
    mi(la sol la sol fa)
    mi4 r r\mbreak
    r r r8 fa\f

    %22
    re re mi mi fa fa
    <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>
    do,8 sol <do do,>4 r

    %25
    r r8 mi-!\p sol-! fa-!
    mi r r  mi-! sol-! fa-!
    <<{mi8\f mi4 mi mi8}\\{dod dod4 dod dod8}>>

    %28
    fa fa16(sol) la8 fa <<re4\\re>>	\mbreak
    r r8 re-!\p fa-! mi-!
    re r r re-! fa-! mi-!

    %31
    <<{re8\f re4 re re8}\\{si si4 si si8}>>
    do mi16(fa) sol8[mi] do do
    do\p do do do do do

    %34
    do do do do do do
    do do do do do do
    do do do do do do

    %37
    do do do do do do\mbreak
    do do do do do do
    do do do do do do

    %40
    do do do do do do
    do4\f do\p do
    do r r

    %43
    do\f do\p do
    do r sib
    sol(la sib)

    %46
    sol(la sib)\mbreak
    do8 do do do do do
    do2 sib4

    %49
    sol (la sib)
    sol (la sib\f)
    do8 do do do do do

    %52
    fa,8 fa' fa,4 r

    %% seconda variazione
    fa'4\p do do
    la8 r r4 mi'(
    fa) do do

    %4
    la8 r r4 fa'
    <<re2.\\sol,>>
    <<re'2.\\sol,>>

    %7
    <<
        {
            re'2.~
            \stemDown re4
        }\\{sol,2.}
    >> do4 r
    R2.*3

    %12
    r4 do(mi)
    sol2.~
    sol~

    %15
    sol~
    sol4 r r\mbreak
    r8 mi'-! do-! sol-! mi\noBeam r

    %18
    r8 mi'-! do-! sol-! mi\noBeam r
    do r do r do r
    do mi do4 r

    %21
    R2.
    do~
    do8 fa sol sol sol, sol

    %24
    do4 r r\mbreak
    la8\pp la la la la la
    la la la la la la

    %27
    la la la la la la
    la4 r r
    sol8 sol sol sol sol sol

    %30
    sol sol sol sol sol sol
    sol sol sol sol sol sol\mbreak
    sol4 r r

    %33
    r r la'\pp(
    sol mi sol)
    fa2 re4

    %36
    do8(re mi fa sol mi)
    fa2 la4
    sol(mi sol)

    %39
    fa r re(
    do2) r4
    la'4. sol8(fa mi)\mbreak

    %42
    fa(do la do fa sol)
    la4. sol8 fa mi
    fa8.\tr sol16 la4 sib~

    %45
    sib la sib~
    sib la8 la(do sib)
    sib(la) la8.\tr sib16 la8-! sol-!

    %48
    sol4(fa) re
    do2 re4\mbreak
    do2 r4

    %51
    r do do
    la8 fa' do[(sib la sol)]

    % terza variazione
    fa4 do' do,
    fa r r
    fa do' do,\mbreak

    %4
    fa r fa'
    sol sol, sol
    sol' sol, sol

    %7
    sol' sol, sol
    sol do, r
    do' sol' sol,

    %10
    do do, r
    do' sol' sol,
    do do, r

    %13
    do'8 do do do do do\mbreak
    do do do do do do
    do do do do do do

    %16
    do8 mi do\noBeam r r4
    do8 mi do\noBeam r r4
    do8 mi do\noBeam r r4

    %19
    do8 r do r do r
    do4 r r
    r r r8 fa

    %22
    re8 re mi mi fa fa\mbreak
    R2.*2
    r4 la, la

    %26
    r la la
    r la la
    re, r r

    %29
    r sol sol\mbreak
    r sol sol
    r sol sol

    %32
    do r r
    r r mi
    sol2 fa4

    %35
    <<si2.\\re,>>
    <<do'4\\mi,>> r r
    r r mi\mbreak

    %38
    sol2 fa8 mi
    <<{si' si si si si si}\\{re, re re re re re}>>
    do'4 r r

    %41
    fa,,(do') do,
    fa r r
    fa do' do,

    %44
    fa r sib
    do fa, sib\mbreak
    do fa, r

    %47
    r do' do,
    fa fa' sib,(
    do) fa, sib(

    %50
    do) fa, r
    r do' do
    fa, do'8(sib! lab sol)

    %% quarta variazione
    lab8 lab'4 sol8(fa mi)
    fa do lab! do fa sol
    lab lab4 sol8(fa mi)

    %4
    fa do lab4 r8 fa'
    mib!4(re) r8 fa
    mib4(re) r

    %7
    re?2 sol,4\mbreak
    sol2 r4
    r sol'(fa)

    %10
    fa(mib) r
    r mib re
    re?(do) r

    %13
    R2.*3
    mib2 fa8(lab)\mbreak
    sol4 mib fa8(lab)

    %18
    sol4 mib fa8 lab
    sol4 r r
    r r r8 mib

    %21
    mib4 re si
    sol r r
    r8 do4 do8 si [si]

    %24
    do4 r r\mbreak
    mi? mi mi
    <<mi?2.\\dod>>

    %27
    re8(la) la4 dod
    re? r r
    do do do

    %30
    re?2.
    sol,4 sol sol
    sol2.\mbreak

    %33
    R2.*4
    lab'!2.
    sol

    %39
    fa
    mi4 r r\mbreak
    r8 lab4 sol8 fa mi

    %42
    fa(do lab) do-! fa-! sol-!
    lab lab4 sol8 fa mi
    fa4 r reb!

    %45
    do2 reb4
    do2 do'8 sib
    lab!4 lab8(fa sol mi)

    %48
    fa4 r sib\mbreak
    sol(lab) sib
    sol(lab) r

    %51
    r8 fa\noBeam fa fa mi mi
    fa4 fa, r

    % quinta variazione
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    do'8_\markup\italic "pizzicato"  do' mi, do' mi, do'
    do, r r4 r

    %3
    do8 do' mi, do' mi, do'
    do, r r4 r
    sol8 sol' sol, sol' sol, sol'

    %6
    sol, sol' sol, sol' sol, sol'
    sol, sol' sol, sol' sol, sol'\mbreak
    sol, r r4 r

    %9
    do8 sol' si, sol' si, sol'
    do,4 r r
    do8 sol' si, sol' si, sol'

    %12
    do, r r sol' mi sol
    fa la fa la fa la
    mi sol mi sol mi sol

    %15
    fa la fa la fa la\mbreak
    mi sol mi sol mi sol
    mi do' do do do do

    %18
    do do do do do do
    do do do do do do
    do do, do4 r

    %21
    R2.*4
    fa8 re fa re mi dod
    la' fa la fa sol mi

    %27
    fa re fa re mi dod
    re4 r r
    sol,8 sol' sol sol sol sol

    %30
    sol sol sol sol sol sol
    sol sol sol sol sol sol
    sol4 r r

    %33
    do8 fa, do' fa, do' fa,
    do' mi, do' mi, do' mi,
    do do' do do do do\mbreak

    %36
    do, do' do do do do
    do fa, do' fa, do' fa,
    do' mi, do' mi, do' mi,

    %39
    do do' do do do do
    do4 do, r
    do8 do' mi, do' mi, do'

    %42
    do,4 r r
    do8 do' mi, do' mi, do'\mbreak
    fa,4 r sib,8 sib'

    %45
    do, do' fa,,[fa'] sib, sib'
    do, do' sol, fa' sib,[sib']
    do, do' do do do do

    %48
    do fa, fa,[fa'] sib, sib'
    do, do' sol, fa' sib,[sib']
    do, do' fa,, fa' la, la'

    %51
    sib, sib' do, do' do, do'
    fa, do fa,4 r

    %% sesta variazione
    \set Staff.midiInstrument = #"viola"
    la'4._\markup\italic "Con l'arco" sol8(fa mi)
    fa do la do fa sol
    la4. sol8 fa mi

    %4
    fa4 r la
    re,(si) re\mbreak
    re2 si4~

    %7
    si si' si
    do8 sol mi4 r
    mi4. mi8\noBeam fa (la)

    %10
    sol(mi) do4 r
    mi4. mi8\noBeam fa (la)
    sol (mi) do4 r

    %13
    R2.*3
    r4 r8 mi mi mi
    mi(sol) mi4 r

    %18
    r r8 mi mi mi
    mi(sol) mi4 r
    R2.*6

    %26
    r8 fa(mi la sol fa)
    mi2.
    re8 r r4 r

    %29
    R2.
    r8 mi(re sol fa mi)\mbreak
    re4 r r

    %32
    R2.
    la'8\p(fa la fa la fa)
    sol2.

    %35
    fa
    <<sib!\\sol>>
    la8(fa la fa la fa)\mbreak

    %38
    sol2.
    fa
    <<sib\\sol>>

    %41
    la4. sol8(fa mi)
    fa (do la) do fa sol
    la la la la la la

    %44
    fa4 r sib\mbreak
    sol(la sib
    sol la) r

    %47
    R2.
    r4 r sib(
    sol la sib)

    %50
    sol(la) r\mbreak
    R2.*2

    %% settima variazione
    fa16\p^\markup\italic "Sul ponticello" sol la fa sol la sol fa mi fa sol mi
    fa sol la sol fa sol la sol fa sol la sol
    fa sol la fa sol la sol fa mi fa sol mi

    %4
    fa sol la sol fa sol la sol fa sol la fa
    re mi fa mi re mi fa mi re mi fa mi
    re mi fa mi re mi fa mi re mi fa mi

    %7
    re mi fa mi re mi fa mi re mi fa re
    mi fa sol fa mi fa sol fa mi fa sol fa
    do' re mi do re mi re do si do re si\mbreak

    %10
    do4 sol sol,
    do r r
    R2.*2

    %14
    r4 r mi16 do re mi
    fa mi re mi fa la sol fa re fa mi re
    mi fa sol fa mi fa sol fa mi fa sol fa

    %17
    mi4 r r\mbreak
    mi16 fa sol fa mi fa sol fa mi fa sol fa
    mi8 r r4 r

    %20
    R2.*3
    do8\p fa sol sol sol, sol
    do4 do, r

    %25
    mi'16\p fa sol fa mi fa sol fa mi fa sol fa\mbreak
    mi fa sol fa mi fa sol fa mi fa sol fa
    mi8\f la, la la la la

    %28
    re mi16 fa sol la si? dod re8 r
    re,16 \p mi fa mi re mi fa mi re mi fa mi
    re mi fa mi re mi fa mi re mi fa mi

    %31
    re8\f sol, sol sol sol sol
    do8 re16 mi fa sol la si do4
    fa,16 sol la sol fa sol la sol fa sol la fa\mbreak

    %34
    mi fa sol fa mi fa sol fa mi fa sol mi
    do8\p do do do do do
    do\f sol'16 mi do8 do do(mi)

    %37
    fa16\p sol la sol fa sol la sol fa sol la fa
    mi fa sol fa mi fa sol fa mi fa sol mi
    do8 do do do do do

    %40
    do8\f sol'16 mi do8 do do4\mbreak
    fa16\p sol la fa sol la sol fa mi fa sol mi
    fa sol la sol fa sol la sol fa sol la sol

    %43
    fa sol la fa sol la sol fa mi fa sol mi
    fa sol la sol fa la do la sib do re sib
    sol la sib sol la sib do la sib do re sib

    %46
    sol la sib sol la8 la re,16(re') do sib
    \slashedGrace sib16 la8 sol16 fa \slashedGrace sib16 la8 sol16 fa \slashedGrace la16 sol8 fa16 mi
    fa8 la4 la8 sib16\p do re sib

    %49
    sol16 la sib sol la sib do la sib do re sib
    sol la sib sol la8 la re,16\f(re') do sib
    \slashedGrace sib16 la8 sol16 fa \slashedGrace sib16 la8 sol16 fa \slashedGrace la16 sol8 fa16 mi

    %52
    <<{fa8 la, la la}\\{s8 fa fa fa}>><<la4\\fa>>

}


IVvcIn =\relative do {

    fa,4\f la\p do
    fa, r r
    fa\f la\p  do

    %4
    fa, r fa'
    <sol sol,>\f sol\p sol
    <sol sol,>\f sol\p sol

    %7
    <sol sol,>\f <sol sol,> <sol sol,>
    < do, do,> r8 \clef tenor \key fa\major do'\p-! mi-! re-!
    do4 do, do\mbreak

    %10
    do4~do8 do'-! mi-! re-!
    do4 do, do
    do r mi'

    %13
    fa2.
    mi
    fa\mbreak

    %16
    mi8(fa mi fa mi re)
    do(fa mi fa mi re)
    do(fa mi fa mi re)

    %19
    do(fa mi fa mi re)
    do4 r r
    \clef bass\key fa\major r4 r r8 fa,\f

    %22
    sol fa mi mi fa fa
    <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>
    do,4 do(sib!)

    %25
    la8 r r  \clef tenor \key fa\major dod'\p-! mi-! re-!
    dod r r dod-! mi-! re-!
    <<{s8 la la[ la la la]}\\{dod\f la la [la la la]}>>

    %28
    <<re\\{\stemUp re, fa16(sol)}>> la8 fa <<re4\\re>>\mbreak
    r4 r8 si'\p-! re-! do-!
    si? r r si-! re-! do-!

    %31
    si8\f [sol] <sol sol,> <sol sol,> <sol sol,> <sol sol,>
    do,8 mi16 fa sol8 mi do4
    R2.

    %34
    mi'2\dolce mi8(sol)
    fa2.
    mi16\tr re mi fa mi8 mi mi4

    %37
    R2.\mbreak
    mi2~mi8 sol
    fa2.

    %40
    mi16\tr re mi fa mi8 mi(fa sol)
    la4\f \clef bass \key fa\major la,,4\p(do)
    fa, r r

    %43
    fa\f la\p do
    fa, r sib'~
    sib la sib~

    %46
    sib la sib\mbreak
    do do, do
    fa, fa' sib~

    %49
    sib la sib~
    sib la sib\f
    do8 do, do do do do

    %52
    fa,4 do''8(sib la sol)

    %% seconda variazione
    fa4\p do' do,
    fa r r
    fa do' do,

    %4
    fa r fa(
    sol) sol sol
    sol sol sol

    %7
    sol sol sol
    do do, r\mbreak
    do do' sol

    %10
    do,2 r4
    do do' sol
    do,2 do'4

    %13
    re si sol
    do do, do'
    re si sol

    %16
    do do, do'\mbreak
    do, r do'
    do, r do'

    %19
    do,8 r do r do r
    do4 r8 do-! re-! mi-!
    fa-! sol-! la-! si-! do-! re-!

    %22
    mi fa mi fa mi fa
    mi, fa sol sol sol, sol
    do4 do(sib!)\mbreak

    %25
    la la' la
    la, la' la
    la, la' la

    %28
    re, re re'16(do! si la)
    sol4 sol sol
    sol sol sol

    %31
    sol sol sol\mbreak
    do,8 do do do do do
    do do do do do do

    %34
    do do do do do do
    do do do do do do
    do do do do do do

    %37
    do do do do do do
    do do do do do do
    do do do do do do

    %40
    do8 do do (sib! la sol)
    fa4(la do)\mbreak
    fa fa, r

    %43
    fa la do
    fa fa, r
    R2.*8

    %% terza variazione
    \clef violin  \key fa\major do'''4~do16(la do la) \slashedGrace do16 sib8(la16 sol)
    fa(sol la sol fa sol la sib  do re mi fa)
    fa8 do~do16 (la do la) \slashedGrace do16 sib8(la16 sol)\mbreak

    %4
    fa(sol la sol fa sol la sib)  do (re mi fa)
    fa(mi re do si la sol la) si(do re mi)
    fa(mi re do si la sol la) si(do re mi)

    %7
    fa(mi re do si la sol la) si(do re mi)
    \grace sol8 fa4\dolce mi8 do do do
    do4.(si16 do \slashedGrace mi re8 do16 si)

    %10
    si?4(do8) mi mi mi
    mi4.  re16 mi \slashedGrace sol16 fa8 mi16 re
    re4(mi8) sol sol sol

    %13
    \slashedGrace si16 la8 sol16 la \slashedGrace si16 la8 sol16 la \slashedGrace do16 si?8 la16 si\mbreak
    do8.\tr re16 do8 sol sol sol
    \slashedGrace si16 la8 sol16 la \slashedGrace si16 la8 sol16 la \slashedGrace do16 si8 la16 si

    %16
    do4 do16(re mi re) do mi sol mi
    \grace re8 do4 do16(re mi re) do mi sol mi
    \grace re8 do4 do16(re mi re) do (mi sol mi)

    %19
    do16(mi sol mi) do(mi sol mi) do(mi sol mi)
    do4 r r
    R2.

    %22
    \clef tenor \key fa\major r4 r8 do,,16(re si do la si)\mbreak
    sol8(fa' mi la sol) si,
    \grace re8 do2.

    %25
    \grace {fa,32[dod']} sol'8 sol16 sol la(sol) sol sol \grace {mi,32[dod']} sol'8 sol16 sol
    \grace { la,,32[mi' dod']} sol'8 sol16 sol la(sol) sol sol \grace {mi,32[dod']} sol'8 sol16 sol
    \grace { la,,32[mi' dod']} sol'8 sol16 sol la(sol) sol sol \grace {mi,32[dod']} sol'8 sol16 sol

    %28
    fa! (la sol fa) sol (la sib do?) re8 r
    \grace {re,,32[si']} fa'8 fa16 fa sol(fa) fa fa \grace {re,32[si']} fa'8 fa16 fa\mbreak
    \grace {sol,,32 [re' si'?]} fa'8 fa16 fa sol(fa) fa fa \grace {re,32[si']} fa'8 fa16 fa

    %31
    \grace {sol,,32 [re' si'?]} fa'8 fa16 fa sol(fa) fa fa \grace {re,32[si']} fa'8 fa16 fa
    mi(sol fa mi) fa(sol la si) do8 r
    R2.*2

    %35
    do,2.~
    do4. re16(mi fa sol la sib?)
    do4 \clef violin \key fa\major do do\mbreak

    %38
    do2.~
    do~
    do4 r r

    %41
    do~do16(la do la \slashedGrace do sib8 la16 sol)
    fa(sol la sol fa sol la sib) do(re mi fa)
    fa8 do~do16 (la do la) \slashedGrace do sib8 (la16 sol)

    %44
    la(do fa la fa do la fa)sol(do sib do)
    sib(do sib do la do fa, do' sol do sib do)\mbreak
    sib(do sib do) la(do fa la fa do fa la)

    %47
    do8 do,~do16(la do la \slashedGrace do sib8 la16 sol)
    \grace sib8 la2 sol16(do sib do)
    sib(do sib do la do fa, do' sol do sib do)\mbreak

    %50
    sib(do sib do) la(do fa la fa do fa la)
    do8 do,~do16 la do la \slashedGrace do sib8 la16 sol
    fa8 do fa,4 r

    % quarta variazione
    \clef bass fa,4 lab! (do)
    fa8 r r4 r
    fa,4 lab(do)

    %4
    fa r fa,(
    sol) sol' fa(
    sol) sol, sol'

    %7
    si, sol si\mbreak
    do do, r
    do' mib sol

    %10
    do do, r
    do do' sol
    do do, do

    %13
    do do do
    do do do
    do do do

    %16
    do do' do,\mbreak
    do do' do,
    do do' do,

    %19
    do re2
    mib4 mib(fa)
    sol sol sol,

    %22
    do r r
    do8 lab' fa re? sol sol,
    do4 do(sib!)\mbreak

    %25
    la la la
    sol sol sol
    fa(mi) la

    %28
    re, r r
    lab'!\f lab lab
    sol sol sol

    %31
    sol sol' sol,
    do,8[(do')] do do do do\mbreak
    do,[(do')] do do do do

    %34
    do,[(do')] do do do do
    do,[(do')] do do do do
    do,[(do')] do do do do

    %37
    do,[(do')] do do do do
    do,[(do')] do do do do
    do,[(do')] do do do do

    %40
    do,[(do')] do4 r\mbreak
    fa,4 lab do
    fa r r

    %43
    fa,4 lab do
    fa, r sib'~
    sib lab sib~

    %46
    sib lab sib
    do do do,
    fa r sib,\mbreak

    %49
    do fa sib,
    do fa r
    lab,8[(sib)] do do do do

    %52
    fa, fa' fa,4 r

    %% quinta variazione
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    fa' _\markup\italic "pizzicato" do do
    fa, r r
    fa' do do

    %4
    fa,8 r r4 r
    sol'4 sol, sol
    sol' sol, sol

    %7
    sol' sol, sol\mbreak
    do r r
    do sol' sol,

    %10
    do r r
    do sol' sol,
    do do do

    %13
    do do do
    do do do
    do do do

    %16
    do do do
    do do do
    do do do

    %19
    do do do
    do do, r
    R2.*2

    %23
    do'4 fa sol
    do, do sib!\mbreak
    la la la

    %26
    la la la
    la la la
    re r r

    %29
    sol, sol sol
    sol sol sol
    sol sol sol

    %32
    do r r
    do, do' do
    do, do' do

    %35
    do, do' do\mbreak
    do, do' do
    do, do' do

    %38
    do, do' do
    do, do' do
    do, do' do

    %41
    fa, do' do
    fa, r r
    fa' do do

    %44
    fa, r sib
    do fa sib,
    do fa sib,

    %47
    do do do
    fa fa, sib
    do fa sib,

    %50
    do fa la,\mbreak
    sib do do
    fa, fa' r

    %% sesta variazione
    \set Staff.midiInstrument = #"cello"
    fa,4\p do' do
    fa, r r
    fa do' do

    %4
    fa, r fa'
    sol sol sol\mbreak
    sol sol sol

    %7
    sol sol sol
    do do, do
    do2 do'4

    %10
    do do, do
    do2 do'4
    do do, r

    %13
    r do' sol
    do, do do\mbreak
    do do' do

    %16
    do do, r
    r r do'
    do do, r

    %19
    r r do'
    do do, r
    R2.

    %22
    \clef tenor \key fa\major do'8 re mi mi fa fa,
    sol sol sol sol sol sol
    \clef bass \key fa\major do4 do,(sib!)

    %25
    la8 la' la,4 r
    la la la
    la la la

    %28
    re la(re,)
    r8 sol' sol,4 r
    sol sol sol\mbreak

    %31
    sol sol sol
    do do, r
    do' do do

    %34
    do do do
    do do do
    do do do

    %37
    do do do\mbreak
    do do do
    do do do

    %40
    do do do
    fa, do' do
    fa, r r

    %43
    fa fa' fa
    sib, r sib\mbreak
    do fa sib,

    %46
    do fa(sol)
    la8 sib do4 do,
    fa fa, sib(

    %49
    do) fa sib,(
    do) fa(sol)\mbreak
    la8 sib do4 do,

    %52
    fa do8(sib la sol)

    %% settima variazione
    fa'4\pp do' do,
    fa r r
    fa do' do,

    %4
    fa r fa,
    sol sol' sol
    sol, sol' sol

    %7
    sol, sol' sol
    do, do do
    do sol' sol,\mbreak

    %10
    do sol' sol,
    do sol' sol,
    do,8(do') do[do do do]
    do,8(do') do[do do do]

    %14
    do,8(do') do[do do do]
    do,8(do') do[do do do]
    do,4 r r

    %17
    do' do do\mbreak
    do, r r
    do' do do

    %20
    <do do,> r r
    R2.*2
    do8\f fa sol sol sol, sol

    %24
    <do do,>4 do\dolce sib!
    la r r\mbreak
    la r r

    %27
    la8\f la la la la la
    <<re4\\re>> re, r
    sol\p r r

    %30
    sol r r
    <sol' sol,>8 <sol sol,> <sol sol,> <sol sol,> <sol sol,> <sol sol,>
    do do, do do do do

    %33
    do,8(do') do[do do do]\mbreak
    do,8(do') do[do do do]
    do,8(do') do[do do do]

    %36
    <do do,>\f do' do, do do do
    do,8\p(do') do[do do do]
    do,8(do') do[do do do]

    %39
    do,8(do') do[do do do]
    <do do,>\f do' do, do do'16(sib la sol)\mbreak
    fa4\p do' do,

    %42
    fa r r
    fa do' do,
    fa r sib,(

    %45
    do) fa sib,
    do fa8 fa,\f sib sib
    <do do,>  <do do,>  <do do,>  <do do,>  <do do,>  <do do,>

    %48
    fa,8 fa' fa,4 sib\p\mbreak
    do fa sib,
    do fa8 fa,\f sib sib

    %51
    <do do,>  <do do,>  <do do,>  <do do,>  <do do,>  <do do,>
    fa,8 fa' fa, fa fa4

}


IVvcIIn =\relative do {

    fa,4\f la\p do
    fa, r r
    fa\f la\p  do

    %4
    fa, r fa'
    <sol sol,>\f sol\p sol
    <sol sol,>\f sol\p sol

    %7
    <sol sol,>\f <sol sol,> <sol sol,>
    <do, do,>2 r4
    r do\p do\mbreak

    %10
    do~do8 r r4
    r do do
    do do do

    %13
    do do do
    do do do
    do do do

    %16
    do do do
    do do do
    do do do

    %19
    do do do
    do r r\mbreak
    r4 r r8 fa\f

    %22
    sol fa mi mi fa fa
    <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>  <sol sol,>
    do,4 do(sib!)

    %25
    la la'\p la,
    r la' la,
    la8\f la la la la la

    %28
    re8 fa,16(sol) la8 fa re4\mbreak
    r sol'\p sol,
    r sol' sol,

    %31
    <sol' sol,>8\f <sol sol,> <sol sol,> <sol sol,> <sol sol,> <sol sol,>
    <do, do,>8 mi16 fa sol8 mi <do do,>4
    do,8\p(do') do [do do do]

    %34
    do,(do') do [do do do]
    do, (do') do [do do do]
    do, (do') do [do do do]

    %37
    do, (do') do [do do do]\mbreak
    do, (do') do [do do do]
    do, (do') do [do do do]

    %40
    do,4 do'8(sib! la sol)
    fa4\f la\p do
    fa, r r

    %43
    fa\f la\p do
    fa, r sib'~
    sib la sib~

    %46
    sib la sib\mbreak
    do do, do
    fa, fa' sib~

    %49
    sib la sib~
    sib la sib\f
    do8 do, do do do do

    %52
    fa,4 do''8(sib la sol)

    %% seconda variazione
    fa4\p do' do,
    fa4 r r
    fa do' do,

    %4
    fa r fa(
    sol) sol, sol
    sol' sol, sol

    %7
    sol' sol, sol
    do do, r\mbreak
    R2.*14

    %23
    do'8 fa sol sol sol, sol
    do4 do(sib!)\mbreak
    la r r

    %26
    la r r
    la r r
    re re, r

    %29
    sol r r
    sol r r
    sol r r\mbreak

    %32
    do,8(do') do [do do do]
    do,8(do') do [do do do]
    do,8(do') do [do do do]

    %35
    do,8(do') do [do do do]
    do,8(do') do [do do do]
    do,8(do') do [do do do]

    %38
    do,8(do') do [do do do]
    do,8(do') do [do do do]
    do,8(do') do [(sib! la sol)]

    %41
    fa4 la do\mbreak
    fa fa, r
    fa la do

    %44
    fa2 sib,4\dolce(
    do) fa sib,(
    do) fa r

    %47
    do do do
    fa fa, sib(
    do) fa sib,\mbreak

    %50
    do fa sib,
    do do do
    fa, do'8(sib la sol)

    %% terza variazione
    fa4 r r
    R2.*19
    r4 r r8 fa'\p

    %22
    sol(fa) mi mi fa fa
    sol4 sol sol,
    do do(sib!)

    %25
    la r r
    la r r
    la r r

    %28
    re, r8 re' si la
    sol4 r r
    sol r r

    %31
    sol r r
    <do do,> r r
    do,8\p [(do')] do do do do\mbreak

    %34
    do, [(do')] do do do do
    do, [(do')] do do do do
    do, [(do')] do do do do

    %37
    do, [(do')] do do do do
    do, [(do')] do do do do
    do, [(do')] do do do do

    %40
    do4 do'8(sib! la sol)
    fa4 r r
    R2.*11

    %% quarta variazione
    \clef alto do'8(do'4) sib8 lab sol
    fa16(do mi do fa do sol' do, lab' do, sib' do,)
    do'8(do4 sib8 lab sol)

    %4
    \clef tenor \key fa\minor  fa16\tr mi fa sol fa8\f fa(sol lab)
    do,4(si8\p) sol'\tr lab-! do,-!
    do4 si?8\f fa'(sol lab)

    %7
    sol16(la sol la) si(do si do) re?8 fa,\mbreak
    fa4(\once\stemDown mib8) sol,,(do mib)
    sol8\dolce do4 mib re8

    %10
    re?4(do8) do,(mib sol)
    do mib4 sol fa8
    fa4(mib8) \clef alto\key fa\minor do do do'

    %13
    do16(lab fa) do-! do'16(lab fa) do-! do'16(lab fa) do-!
    do'(sol mib) do-!  do'(sol mib) do-!  do'(sol mib) do-!
    do'(lab fa) do-! do'16(lab fa) do-! do'16(lab fa) do-!

    %16
    do'8 do,-! \once\stemUp do, do''16 sib \slashedGrace sib16 lab8 sol16-! fa-!\mbreak
    \slashedGrace fa16 mib8 re?16 do do'(do,) do' sib \slashedGrace sib16 lab8 sol16 fa
    \slashedGrace fa16 mib8 re?16 do do'(do,) do' sib \slashedGrace sib16 lab8 sol16 fa

    %19
    \slashedGrace fa16 mib8 re?16 do si do re mib fa sol lab si
    do4 r8 \clef tenor \key fa\minor \con \tuplet 3/2 { sol16(fa mib) } re8-! do-!
    do4 si8 re?16(si) sol8-! fa-!

    %22
    mib16 do re? mib fa sol la si do re? mib fa
    sol8 do, re2\tr
    do4 r r\mbreak

    %25
    sol'4.\f(mi8) dod la
    sib!2.
    la?8 re4 dod8(mi sol)

    %28
    fa re la' fa re'?4
    fa,8.\tr\f sol16 fa8 fa fa fa
    fa(re) \grace do8 si4. do8

    %31
    re16(do si do re) mi re mi fa8 fa,
    fa2 mi4\mbreak
    R2.

    %34
    \clef alto \key fa\minor do''2.
    do
    do

    %37
    do,16(do') lab! do do,(do') lab do do,(do') lab do
    do,(sib') sol sib do,(sib') sol sib do,(sib') sol sib
    do,(lab') fa lab do,(lab') fa lab do,(lab') fa lab

    %40
    sol(fa mi re?) do8\rinf sib! lab! sol\mbreak
    <<do8\f\\lab>> do'4\dolce sib8(lab sol)
    fa16 do mi do fa do sol' do, lab' do, sib' do,

    %43
    do'8 do4 sib8 lab sol
    lab8.\tr sib16 do8(lab) \clef violin \key fa\minor sib reb!
    mi,4 fa8 do'(sib sol)

    %46
    mi4(fa8) fa' (mi? reb)
    \slashedGrace reb16 do8 do4 lab16 do \slashedGrace do16 sib8 lab16 sol
    lab(sib do reb) do8 do\tr reb fa,\mbreak

    %49
    mi16(reb') do sib lab(fa) fa' reb sib lab sol fa
    mi?(reb') do sib lab(fa) sol lab sib do reb mi?
    fa8 fa, do4 sol'\tr

    %52
    fa8 do fa,4 r

    %% quinta variazione
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    \clef bass fa _\markup\italic "pizzicato" do do
    fa, r r
    fa' do do

    %4
    fa,8 r r4 r
    sol'4 sol, sol
    sol' sol, sol

    %7
    sol' sol, sol\mbreak
    do r r
    do sol' sol,

    %10
    do r r
    do sol' sol,
    do do do

    %13
    do do do
    do do do
    do do do

    %16
    do do do
    do do do
    do do do

    %19
    do do do
    do do, r
    R2.*2

    %23
    do'4 fa sol
    do, do sib!\mbreak
    la la la

    %26
    la la la
    la la la
    re r r

    %29
    sol, sol sol
    sol sol sol
    sol sol sol

    %32
    do r r
    do, do' do
    do, do' do

    %35
    do, do' do\mbreak
    do, do' do
    do, do' do

    %38
    do, do' do
    do, do' do
    do, do' do

    %41
    fa, do' do
    fa, r r
    fa' do do

    %44
    fa, r sib
    do fa sib,
    do fa sib,

    %47
    do do do
    fa fa, sib
    do fa sib,

    %50
    do fa la,\mbreak
    sib do do
    fa, fa' r
    \set Staff.midiInstrument = #"cello"

    %sesta variazione
    R2.*15
    r4 r do'
    do do, r

    %18
    r r do'
    do do, r
    R2.*7

    %27
    la4 la la
    re, r r
    R2.*2

    %31
    sol4 sol sol
    do do, r
    do' do do

    %34
    do do do
    do do do
    do do do

    %37
    do do do
    do do do
    do do do

    %40
    do do do
    fa, r r
    R2.*11

    % settima variazione
    fa'4\pp do' do,
    fa fa, fa
    fa' do' do,

    %4
    fa fa, fa
    sol r sol
    sol r sol

    %7
    sol r sol
    do do do
    do sol' sol,\mbreak

    %10
    do sol' sol,
    do sol' sol,
    do do do

    %13
    do do do
    do do do
    do do do

    %16
    do r r
    do do do\mbreak
    do, r r
    do' do do

    %20
    <do do,> r r
    R2.*2
    do8\f fa sol sol sol, sol

    %24
    <do do,>4 do\dolce sib!
    la r r\mbreak
    la r r

    %27
    la8\f la la la la la
    <<re4\\re>> re, r
    sol\p r r

    %30
    sol r r
    <sol' sol,>8 <sol sol,> <sol sol,> <sol sol,> <sol sol,> <sol sol,>
    do do, do do do do

    %33
    do,8(do') do[do do do]\mbreak
    do,8(do') do[do do do]
    do,8(do') do[do do do]

    %36
    <do do,>\f do' do, do do do
    do,8\p(do') do[do do do]
    do,8(do') do[do do do]

    %39
    do,8(do') do[do do do]
    <do do,>\f do' do, do do'16(sib la sol)\mbreak
    fa4\p do' do,

    %42
    fa fa, fa
    fa' do' do,
    fa fa, sib(

    %45
    do) fa sib,
    do fa8 fa,\f sib sib
    <do do,>  <do do,>  <do do,>  <do do,>  <do do,>  <do do,>

    %48
    fa,8 fa' fa,4 sib\p\mbreak
    do fa sib,
    do fa8 fa,\f sib sib

    %51
    <do do,>  <do do,>  <do do,>  <do do,>  <do do,>  <do do,>
    fa,8 fa' fa, fa fa4

}

forma = {

    \time 3/4
    \key fa\major
    \tempo 2 = 57
    \once\override Score.RehearsalMark.extra-offset = #'(0 . -3.0)
    \mark\markup "1. V"
    s2.*52
    \bar "||"\break \mark\markup "2. V"
    \set Score.currentBarNumber = #1
    s2.*52
    \bar "||"\break \mark\markup "3. V"
    \set Score.currentBarNumber = #1
    s2.*52
    \bar "||"\break \mark\markup "4. V"
    \set Score.currentBarNumber = #1
    \key fa\minor
    s2.*52
    \bar "||"\break \mark\markup "5. V"
    \set Score.currentBarNumber = #1
    \key fa\major
    s2.*52
    \bar "||"\break \mark\markup "6. V"
    \set Score.currentBarNumber = #1
    s2.*52
    \bar "||"\break \mark\markup "7. V"
    \set Score.currentBarNumber = #1
    s2.*52
    \bar "|."

}


IVfl = {
    \IVglobal
    <<\IVfln \forma>>
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


IVvcI = {
    \IVglobal
    \clef bass
    <<\IVvcIn \forma>>
}


IVvcII = {
    \IVglobal
    \clef bass
    <<\IVvcIIn \forma>>
}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller{Divertimento II in Fa maggiore}
        composer = \markup \center-column{"L. Boccherini (1743 -1805)"}
    }

    \markup\huge { [1.] Grave}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \Ifl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [2.] All.[egro] e con Imperio}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [3.] Grave}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [4.] Variazioni - All[egr]o Giusto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IVfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IVvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IVvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

}