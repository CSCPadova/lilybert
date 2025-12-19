\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

MyCadenza = \relative do'' {

    \cadenzaOn

    s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

    \cadenzaOff

}

MyCadenzabis = \relative do'' {

    \cadenzaOn

    s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

    \cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

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

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn =  \relative do'' {

    sol'8
    mi re16 do re8 do16 si do8 sol fa fa'
    mi re16 do re8 do16 si do8 sol fa fa'
    mi re16 do re8 do16 si do4 r8 re

    %4
    si8 la16 sol la8 sol16 fad sol8 re do do'
    si8 la16 sol la8 sol16 fad sol8 re do do'
    si8 la16 sol la8 sol16 fad sol8[la16 si do re mi fa]\mbreak

    %7
    sol4. sol,8 fa[sol16 la si do re mi]
    fa4. fa,8 mi[fa16 sol la si do re]
    mi4. mi,8 re4 r8 sol

    %10
    mi re16 do re8 do16 si do8 sol'' fa fa,
    mi re16 do re8 do16 si do8 sol'' fa re
    mi re16 do re8 do16 si do4 r

    %13
    R1*6
    r2 sol'8 fa16 mi fa8 mi16 re
    mi8 mi, mi mi fa fa fa fa

    %21
    re re re re mi mi mi mi
    do do do do re re re re
    si si si si do do do do

    %24
    la la la la sol4 r\mbreak
    R1
    r2 r4 r8 re''

    %27
    si8 la16 sol la8 sol16 fad sol8 re do do'
    si8 la16 sol la8 sol16 fad sol8 re do do'
    si8 la16 sol  re'8 do16 si la4 r

    %30
    R1*3
    r2 r4 r8 si'
    sol fad16 mi fad8 mi16 red mi8 si la la'

    %35
    sol fad16 mi fad8 mi16 red mi8 si la la'
    sol fad16 mi si'8 la16 sol fad4 r
    R1*4

    %41
    r2 r4 r8 si
    sol fad16 mi fad8 mi16 red mi8 si la la'
    sol fad16 mi fad8 mi16 red \mbreak mi[mi, fad sol la si dod red]

    %44
    mi4. mi,8 re[mi16 fad sol la si do]
    re4. re,8 do[re16 mi fad sol la si]
    do4. do,8 si4 r8 si''

    %47
    sol fad16 mi fad8 mi16 red mi8 si la la'
    sol fad16 mi fad8 mi16 red  mi4 r
    R1*7

    %56
    r4 r8 mi do si16 la si8 la16 sold
    la8 mi re re' do si16 la si8 la16 sold
    la8 mi re re' do si16 la si8 la16 sold

    %59
    la4 r r2
    R1*13
    r2 r4 r8 sol'\mbreak

    %74
    mi re16 do re8 do16 si do8 sol fa fa'
    mi re16 do re8 do16 si do8 sol fa fa'
    mi re16 do re8 do16 si do4 r8 sol

    %77
    mi re16 do re8 do16 si do8 sol'' fa fa,
    mi re16 do re8 do16 si do8 sol'' fa re
    mi re16 do re8 do16 si do2\fermata

}

IvlIIn = \relative do'' {

    r8
    sol'4 fa mi re
    sol fa mi re
    sol fa mi r

    %4
    re do si la
    re do si la
    re do si r\mbreak

    %7
    re8 do16 si re8 do16 si fa'4 r
    re8 do16 si re8 do16 si sol'4 r
    sol,8 fa16 mi sol8 fa16 mi si'4 r

    %10
    sol fa mi re
    sol fa mi re
    sol fa mi r

    %13
    R1*6
    r2 mi'8 re16 do re8 do16 si
    do8 mi, mi mi fa fa fa fa

    %21
    re re re re mi mi mi mi
    do do do do re re re re
    si si si si do do do do

    %24
    la la la la sol4 r\mbreak
    R1*2
    re''4 do si la

    %28
    re do si la
    re8 do16 si si8 la16 sol fad4 r
    R1*4

    %34
    si'4 la sol fad
    si la sol fad
    si8 la16 sol sol8 fad16 mi red4 r

    %37
    R1*5
    si'4 la sol fad
    si la\mbreak sol r

    %44
    si,8 la16 sol si8 la16 sol la4 r
    la8 sol16 fad la8 sol16 fad sol4 r
    sol8 fad16 mi sol8 fad16 mi fad4 r

    %47
    si'4 la sol fad
    si la sol r
    R1*7

    %56
    r2 mi4 re
    do si mi re
    do si mi re\mbreak

    %59
    do r r2
    R1*14
    sol'4 fa mi re

    %75
    sol fa mi re
    sol fa mi r
    sol, fa mi re

    %78
    sol fa mi re
    sol' fa mi2\fermata

}

Ivlan =  \relative do' {

    r8
    r sol' la sol sol4 r
    r8 sol la sol sol4 r
    r8 sol la sol sol4 r

    %4
    r8 re mi re re4 r
    r8 re mi re re4 r
    r8 re mi re re4 r\mbreak

    %7
    sol,4 sol la r
    sol sol sol r
    sol sol sol r

    %10
    r8 sol la sol sol4 r
    r8 sol la sol sol4 r
    r8 sol la sol sol4 r

    %13
    R1*6
    r2 sol'8 sol la sol
    sol4 r r2

    %21
    R1*6
    r8 re mi re re4 r
    r8 re mi re re4 r

    %29
    r8 re mi re re4 r
    R1*4
    r8 si' do si si4 r

    %35
    r8 si do si si4 r
    r8 si si si si4 r
    R1*5

    %42
    r8 si do si si4 r
    r8 si do si si4 r
    sol sol re r

    %45
    fad fad do r
    mi mi si r
    r8 si' do si si4 r

    %48
    r8 si do si si4 r
    R1*7
    r2 r8 mi, fa mi

    %57
    mi4 r r8 mi fa mi
    mi4 r r8 mi fa mi\mbreak
    mi4 r r2

    %60
    R1*14
    r8 sol la sol sol4 r
    r8 sol la sol sol4 r

    %76
    r8 sol la sol sol4 r
    r8 sol, la sol sol4 r
    r8 sol la sol sol4 r

    %79
    r8 sol' la sol sol2\fermata

}

Ivcn = \relative do {

    r8
    do mi fa sol do,4 r8 re
    do mi fa sol do,4 r8 re
    do mi fa sol do,4 r

    %4
    sol8 si do re sol,4 r8 la
    sol8 si do re sol,4 r8 la
    sol si do re sol,4 r\mbreak

    %7
    si'8 la16 sol si,8 la16 sol re'4 r
    si'8 la16 sol si,8 la16 sol do4 r
    mi16 re do8 mi,16 re do8 sol'4 r8 sol

    %10
    do mi, fa sol do,4 r8 re
    do mi fa sol do,4 r8 re
    do mi fa sol do' \once\stemUp sol, \clef tenor do'16 re si do

    %13
    re8[\clef bass sol,,] \clef tenor re''16 mi do re\mbreak mi8[\clef bass sol,,] \clef tenor mi''16 fa re mi
    fa8[\clef bass sol,,]\clef tenor fa''16 sol mi fa sol4 r8 sol
    fa32(mi re8.) mi32[(re do8.)] si32 la sol8.~sol8[sol']

    %16
    fa32(mi re8.) mi32[(re do8.)] si32 la sol8.~sol8[re']
    mi16 re mi fa mi fa re mi fa mi fa sol fa sol mi fa
    sol fa sol la sol la fa sol la sol la si la si sol la\mbreak

    %19
    si la si do si do la si do4 r8 sol
    sol16[do sol do sol do sol do] la[do la do la do la do]
    fa,[si fa si fa si fa si] sol[si sol si sol si sol si]

    %22
    mi,[la mi la mi la mi la] fa[la fa la fa la fa la]
    re,[sol re sol re sol re sol] mi[sol mi sol mi sol mi sol]
    do,[fa do fa do fa do fa] si, re do si do mi re do\mbreak

    %25
    \clef bass re,8 do16 si do8 la si sol si' [do16 re]
    re,8 do16 si do8 la si sol re'[re,]
    sol si do re sol,4 r8 la

    %28
    sol si do re sol,4 r8 la
    sol4 sol' re16 fad mi re la' fad mi re
    si' fad mi re do' fad, mi re \clef tenor re'4 r8 re

    %31
    mi8.[(fad16 sol8) fad16 mi]\mbreak re si do re sol,8 re'
    mi8.[(fad16 sol8) fad16 mi] re si do re sol,8 sol'
    fad8 (sol la) mi mi4 red

    %34
    mi8 \clef bass sol, la si mi,4 r8 fad
    mi sol la si mi,4 r8 fad
    \terzinequarto mi4 mi si8 si'\tuplet 3/2 { si (la) si }

    %37
    \once\stemUp si, dod' \tuplet 3/2 {dod(si) dod }\mbreak \once\stemUp si, red' \tuplet 3/2 { red(dod) red }
    si,[\clef tenor mi'] \tuplet 3/2 { mi(red) mi } \clef bass si,[\clef tenor fad''] \tuplet 3/2 { fad(mi) fad }
    sol16 mi red mi fad re? do re mi si la si do la sol la

    %40
    si sol fad sol si fad mi fad si8 fad16 mi si'8 la16 sol
    mi'8 si sol' mi red4.\tr mi8
    mi8\clef bass sol, la si mi,4 r8 fad

    %43
    mi sol la si\mbreak mi,4 r
    sol8 fad16 mi sol8 fad16 mi fad4 r
    fad8 mi16 re fad8 mi16 re mi4 r

    %46
    mi8 re16 do mi8 re16 do red,4 r8 si'
    mi sol la si mi,4 r8 fad
    mi sol la si mi,,16 mi ' fad mi si' mi, fad mi

    %49
    do' mi, fad mi red' mi, fad mi\mbreak \clef tenor mi'8 sol~sol16 mi red fad
    mi8 sol~sol16 mi red fad mi8[re?16-. (do-. si-. la-. sol-. fad-.)]
    \clef bass mi8[re16-.(do-. si-. la-. sol-. fad-.] mi4) r8 si''

    %52
    do16 la la, la' \terzine \senza \tuplet 3/2 { do(si la) fad[(mi re)] } si' sol sol, sol' \tuplet 3/2 { si(la sol) mi[(re do)]}
    la' fad fad, fad' \tuplet 3/2 { la(sol fad) do[(si la)] } si la sol8 r16 si' do re
    sold, re' fa,! re' mi, re' do si\mbreak \tuplet 3/2 { do(si la) } do8\noBeam \tuplet 3/2 { re16(do si) } re8\noBeam

    %55
    \clef tenor \tuplet 3/2 { mi16(re do) } mi8\noBeam \tuplet 3/2 { fa16(mi re) } fa8\noBeam sold,4~sold16 fa' mi si
    do [sold la \clef bass re,] mi8 mi, la do re mi
    la,4 r8 si la do re mi

    %58
    la,4 r8 si la do re mi\mbreak
    la16 sol la si do si do re mi re do si do la sol fa
    mi fa mi re do8 do' do,16 do' si do do, do' si do

    %61
    sol,4 r8 si' do16 mi, re mi \once\stemUp sol,8 do'
    si16 fa mi fa \once\stemUp sol,8 si' do16 mi, re mi \once\stemUp sol,8 do'
    <<si4\\\once \override Stem.transparent = ##t \stemUp re,\\\stemDown sol,>> r8 \clef tenor do'\noBeam re16(do) re8 mi16(re) mi8

    %64
    fa16(mi) fa8 sol16(fa) sol8 la16(sol) la8 si16(la) si8\mbreak
    do16[re do re do re do re]\clef bass sol,,, \clef tenor do'' re do \clef bass sol,,\clef tenor si'' do si
    si[do si do si do si do] \clef bass sol,,\clef tenor si'' do si \clef bass sol,,\clef tenor si'' do si

    %67
    la[si la si la si la si] \clef bass sol,,\clef tenor la'' si la \clef bass sol,,\clef tenor la'' si la
    sol[la sol la sol la sol la] \clef bass sol,,\clef tenor sol'' la sol \clef bass sol,,\clef tenor sol'' la sol\mbreak
    fa[sol fa sol fa sol fa sol] \clef bass sol,,\clef tenor fa'' sol fa \clef bass sol,,\clef tenor fa'' sol fa

    %70
    mi do sol, do' mi do sol, do' re si sol, si' re si sol, si'
    mi do sol, do' mi do sol, do' re si sol, si' re si sol, si'
    mi do sol, do' mi do sol, do' re do sol, do' re do sol, do'

    %73
    re si sol, si'  re si sol, si' <<mi4\\\once \override Stem.transparent = ##t \stemUp do\\\stemDown sol,>> r8 \clef bass sol
    do8 mi fa sol do,4 r8 re
    do8 mi fa sol do,4 r8 re

    %76
    do8 mi fa sol do,4 r8 si
    do8 mi fa sol do,4 r8 si
    do8 mi fa sol do,4 r8 si

    %79
    do8 mi fa sol do,2\fermata

}

Ibcn = \relative do {

    r8
    do mi fa sol do,4 r8 re
    do mi fa sol do,4 r8 re
    do mi fa sol do,4 r

    %4
    sol8 si do re sol,4 r8 la
    sol8 si do re sol,4 r8 la
    sol si do re sol,4 r\mbreak

    %7
    si'8 la16 sol si,8 la16 sol re'4 r
    si'8 la16 sol si,8 la16 sol do4 r
    mi16 re do8 mi,16 re do8 sol'4 r8 sol

    %10
    do mi, fa sol do,4 r8 re
    do mi fa sol do,4 r8 re
    do mi fa sol do,4 r

    %13
    si' r\mbreak do r
    re r do8 re mi do
    re4 do sol8 la si sol

    %16
    re'4 do sol8 la si sol
    do4 r re r
    mi r fa r\mbreak

    %19
    sol r do,8 do' fa, sol
    do,4 r r2
    R1*3

    %24
    r2 sol4 do\mbreak
    si la sol r
    si la sol re'8 re,

    %27
    sol si do re sol,4 r8 la
    sol si do re sol,4 r8 la
    sol4 sol' re r

    %30
    r2 sol,8 la si sol
    do re mi do\mbreak sol la si sol
    do re mi do sol la si sol

    %33
    la4. lad8 si dod red si
    mi sol la si mi,4 r8 fad

    %35
    mi sol la si mi,4 r8 fad
    mi4 mi si2\tasto~
    si1~

    %38
    si
    mi4 re sol la
    sol fad mi mi

    %41
    mi mi si' si,
    mi8 sol la si mi,4 r8 fad
    mi sol la si\mbreak mi,4 r

    %44
    sol8 fad16 mi sol8 fad16 mi fad4 r
    fad8 mi16 re fad8 mi16 re mi4 r
    mi8 re16 do mi8 re16 do red,4 r8 si'

    %47
    mi sol la si mi,4 r8 fad
    mi sol la si mi,4 r
    r2\mbreak mi,8 mi' mi, si'

    %50
    mi, mi' mi, si' mi,4 r
    mi r mi8 fad sol mi
    la4 re sol, do

    %53
    fad, si mi,8 mi' sol fa?
    mi re sold,4\mbreak la8 la' si, si'
    do, do' re, re' mi, fa re sold,

    %56
    la8. re16 mi8 mi, la do re mi
    la,4 r8 si la do re mi
    la,4 r8 si la do re mi\mbreak

    %59
    la,4 sol8 fa mi[fa16 sol la8 si]
    do4 r do do
    sol r do r

    %62
    sol r do r
    sol8 la si do si4 do
    re mi fa sol\mbreak

    %65
    sol,1\tasto ~
    sol~
    sol~

    %68
    sol~\mbreak
    sol~
    sol~

    %71
    sol~
    sol~
    sol2 do4 r8 sol\mbreak

    %74
    do8 mi fa sol do,4 r8 re
    do8 mi fa sol do,4 r8 re
    do8 mi fa sol do,4 r8 si

    %77
    do8 mi fa sol do,4 r8 si
    do8 mi fa sol do,4 r8 si
    do8 mi fa sol do,2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 4/4
    \tempo 2 = 53
    \partial 8 s8
    s1*79
    \bar"|."


}

Ivc = {
    \Iglobal
    \clef bass
    %\notypeset
    <<\Ivcn \forma>>

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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvcn = \relative do {

    \clef tenor la'4 \appoggiatura re8 do8. si16 la4
    si(red) mi
    la,4 \appoggiatura re8 do8. si16 la4

    %4
    mi'8[re16(do si la sold fa!] mi4\tr)
    do' mi8. re16 do4
    \appoggiatura si8 la4 fa'8. mi16 re4

    %7
    \appoggiatura do8 si4 sol'8. fa16 mi4
    \appoggiatura re8 do8.[re16 mi8. fa16] sol4\mbreak
    do, re4.\tr do8

    %10
    do2.
    dod4 mi8. re16 dod4
    re8.[mi16 fa8. sol16] la4

    %13
    sib,4 sol' \appoggiatura fa8 mi4
    \appoggiatura re8 dod4. si?8 la4
    mi'8.[fa16 sol8. fa16] mi4

    %16
    fa4. mi8 re4
    mi dod2
    \appoggiatura dod?8 re2.\mbreak

    %19
    la4 \appoggiatura re8 do8. si16 la4
    si(red) mi
    la,4 \appoggiatura re8 do8. si16 la4

    %22
    sold8.[la16 si8. sold16] \appoggiatura fad8 mi4
    do' mi8. re16 do4
    re, fa8. mi16 re4

    %25
    re' fa8. mi16 re4
    mi, sold8. fad16 mi4
    re'(do) si\mbreak

    %28
    do4. si8 la4
    si sold2\tr
    la2.\fermata

}

IIbcn = \relative do {

    la'2.
    sold2 sol4
    fad2 fa4

    %4
    mi2.
    mi
    fa

    %7
    sol
    mi\mbreak
    la4 sol sol,

    %10
    do2.
    la'2 sol4
    fa2.

    %13
    sol
    la
    dod,

    %16
    re4. mi8 fa4
    sol la la,
    re4. mi8 fad sold\mbreak

    %19
    la2.
    sold2 sol4
    fad2 fa4

    %22
    mi2.
    la,
    fa

    %25
    fa'
    sold,
    mi\mbreak

    %28
    la4. si8 do4
    re mi mi,
    la2._\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 45
    s2.*10
    \bar":..:"\break
    s2.*20
    \bar":|."


}

IIvc = {
    \IIglobal
    \clef bass
    <<\IIvcn \forma>>

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

IIIvlIn =  \relative do'' {

    sol'4 r r
    sol r r
    sol r r

    %4
    sol r r
    sol r r
    sol r r

    %7
    sol r r
    sol r r
    mi8 sol mi do sol mi

    %10
    fa la' fa re la fad\mbreak
    sol si' sol re si sold
    la do' la fa re la

    %13
    si4 dod2
    re8 la re mi fa4~
    fa8 la sol fa mi re

    %16
    mi do re4. do8
    do4 r r
    R2.*12

    %30
    si8 re si sol re si
    do mi' do la mi dod
    re fad' re si fad red

    %33
    mi sol' mi do la mi
    fad4 sold2
    la8 mi la si do4~

    %36
    do8 mi re do si la
    si do la4.\tr sol8
    sol4 r r\mbreak

    %39
    la' r r
    si r r
    la la la

    %42
    la la la
    si si si
    si si si

    %45
    si si si
    sol sol sol
    fad fad fad

    %48
    sol sol sol
    la la la\mbreak
    sold sold sold

    %51
    mi mi mi
    sold sold sold
    mi mi mi

    %54
    re re re
    mi mi mi
    mi mi mi

    %57
    mi mi mi
    do8 mi do la mi do
    re fa' re la fa re

    %60
    mi sold' mi si sold mi
    do'4 red2
    mi8 sold la do, si sold'

    %63
    la4 r r
    sol r r\mbreak
    sol r r

    %66
    sol r r
    sol r r
    R2.*18

    %86
    mi8 sol mi do sol mi
    fa la' fa re la fad
    sol si' sol re si sold

    %89
    la do' la fa re la
    si4 dod2
    re8 la re mi fa4~

    %92
    fa8 la sol fa mi re
    mi do re4. do8
    do2.\fermata

}

IIIvlIIn = \relative do'' {

    mi4 r r
    re r r
    mi r r

    %4
    re r r
    mi r r
    re r r

    %7
    mi r r
    re r r
    mi8 sol mi do sol mi

    %10
    fa la' fa re la fad\mbreak
    sol si' sol re si sold
    la do' la fa re la

    %13
    si4 la2
    la2.
    si

    %16
    do2 si4
    do r r
    R2.*12

    %30
    si8 re si sol re si
    do mi' do la mi dod
    re fad' re si fad red

    %33
    mi sol' mi do la mi
    fad4 mi2
    mi2.

    %36
    fad
    sol2 fad4
    sol r r\mbreak

    %39
    fad' r r
    sol r r
    fad fad fad

    %42
    fad? fad fad
    sol sol sol
    fad fad fad

    %45
    sol sol sol
    mi mi mi
    re re re

    %48
    re re re
    re re re\mbreak
    re re re

    %51
    do do do
    si si si
    la la la

    %54
    si si si
    do do do
    si si si

    %57
    si si si
    la8 mi' do la mi do
    re fa' re la fa re

    %60
    mi sold' mi si sold mi
    mi'4 fad2
    sold8 sold la do, si sold'

    %63
    la4 r r
    mi r r\mbreak
    re r r

    %66
    mi r r
    re r r
    R2.*18

    %86
    mi8 sol mi do sol mi
    fa la' fa re la fad
    sol si' sol re si sold

    %89
    la do' la fa re la
    si4 la2
    la2.

    %92
    si
    do2 si4
    do2.\fermata

}

IIIvlan =  \relative do' {

    do'4 r r
    si r r
    do r r

    %4
    si r r
    do r r
    si r r

    %7
    do r r
    si r r
    sol r4 r8 mi

    %10
    fa4 r r8 fad\mbreak
    sol4 r r8 sold
    la4 r r8 la

    %13
    re,4 mi2
    fa2.
    re2 si4

    %16
    sol2 sol'4
    mi r r
    R2.*12

    %30
    sol,4 r r8 la
    do4 r r8 dod
    re4 r r8 red

    %33
    mi4 r r8 mi
    la,4 si2
    do2.

    %36
    la2 fad4
    re2 re'4
    si r r\mbreak

    %39
    re r r
    re r r
    re re re

    %42
    do do do
    re re re
    si si si

    %45
    mi mi mi
    do do do
    do do do

    %48
    si si si
    fad' fad fad\mbreak
    si, si si

    %51
    do do do
    mi mi mi
    mi mi mi

    %54
    mi mi mi
    mi la, la
    la la la

    %57
    sold sold sold
    la4 r r8 do
    re4 r r8 re

    %60
    mi4 r r8 mi
    mi4 si'2
    si8 sold mi4 mi

    %63
    do r r
    do' r r\mbreak
    si r r

    %66
    do r r
    si r r
    R2.*18

    %86
    do,,4 r r8 mi'
    fa4 r r8 fad
    sol4 r r8 sold

    %89
    la4 r r8 la
    re,4 mi2
    fa2.

    %92
    re2 si4
    sol2 sol'4
    mi2.\fermata

}

IIIvcn = \relative do {

    do'8 sol mi do sol do,
    re'' si sol re si sol
    mi'' do sol mi \once\stemUp do, \clef tenor mi''

    %4
    re16 mi fa sol sol,2\tr
    \clef bass do16  sol fa sol mi8 do sol do,
    re''16 si la si sol8 re si sol

    %7
    mi''16 do si do sol8 mi \once\stemUp do,\clef tenor mi''
    re16 sol re si \clef bass sol si sol re sol,4
    do r r8 mi

    %10
    fa4 r r8 fad\mbreak
    sol4 r r8 sold
    la4 r r8 la

    %13
    sol? sol sol sol sol sol
    fa fa fa fa fa fa
    sol sol sol sol sol sol

    %16
    do,4 sol' sol,
    do'8 sol16 fa sol8 mi16 re mi8 do16 si
    do8 sol do' do,, do'' re

    %19
    si sol16 fa sol8 re16 do re8 si16 la
    si8 sol \once\stemDown si' sol, \clef tenor re''[fa]\mbreak
    \terzinequarto \con \tuplet 3/2 { mi8[sol16(fa mi re)] do8\clef bass sol fa mi[re do] }

    %22
    \tuplet 3/2 {
        fa\clef tenor fa'16(mi re do) si8[\clef bass fa mi] re do si
        mi mi'16(re do si) la8[mi re] do si la
        re re'16(do si la) sol8[re do] si la sol

        %25
        \senza \once\stemUp do, do'' si \once\stemUp do,, do'' si \once\stemUp do,, do'' si
        \once\stemUp sol, re'' do \once\stemUp sol, re'' do \once\stemUp sol, re'' do
        \once\stemUp do,, mi'' re \once\stemUp do,, mi'' re \once\stemUp do,, mi'' re
    }

    %28
    \clef tenor do4~\tuplet 3/2 { do8 mi re do si la }
    fad' sol la,4. sol8
    sol4 \clef bass r r8 si,

    %31
    do4 r r8 dod
    re4 r r8 red
    mi4 r r8 mi

    %34
    re re re re re re
    do do do do do do
    re re re re re re

    %37
    sol4 re' re,
    si'16 re do re si do la si sol si la sol\mbreak
    fad sol mi fad re la' si do re do si la

    %40
    si8 sol re sol, si' sol
    re'16 re, re re' re re, re re' re re, re re'
    do re, re do' do re, re do' do re, re do'

    %43
    si re, re si' si re, re si' si re, re si'
    la red, red la'  la red, red la'  la red, red la'
    sol mi mi sol sol mi mi sol sol mi mi sol

    %46
    do sol sol do do sol sol do do sol sol do
    do fad, fad do' do fad, fad do' do fad, fad do'
    si sol sol si si sol sol si si sol sol si

    %49
    re fad, fad re' re fad, fad re' re fad, fad re'\mbreak
    re sold, sold re'  re sold, sold re'  re sold, sold re'
    do sol sol do do sol sol do do sol sol do

    %52
    si mi, mi si' si mi, mi si' si mi, mi si'
    do mi, mi do' do mi, mi do' do mi, mi do'
    re mi, mi re' re mi, mi re' re mi, mi re'

    %55
    do la la do do la la do do la la do
    si la la si si la la si si la la si
    si sold sold si si sold sold si si sold sold si

    %58
    la4 r4 r8 do,
    re4 r r8 re
    mi4 r r8 mi

    %61
    la la la la la la
    sold mi la la, mi' mi,
    la'8. si16 si4.\tr (la16 si)

    %64
    do8 sol mi do sol do,\mbreak
    re'' si sol re si sol
    mi'' do sol mi \once\stemUp do,\clef tenor mi''

    %67
    re16 mi fa sol sol,2\tr
    \clef bass do,16(re mi8) mi16(fa sol8) sol16(la sib8)
    do4 sib2\tr

    %70
    la8 fa do la fa r
    re'16(mi fad8) fad16(sol la8) la16(si do8)
    re4 do2\tr

    %73
    si8 sol re si sol r
    mi'16(fa? sold8) sold16(la si8) si16(do re8)
    mi4 re2\tr

    %76
    do8 la\clef tenor mi' la, fa'\clef bass la,
    si sol re si sol4\mbreak
    \clef tenor do'4~\tuplet 3/2 { \con do8  mi(re do si do) }

    %79
    sol4~\tuplet 3/2 { \senza sol8 mi'(re do si do) }
    fa,4~\tuplet 3/2 { fa8 mi' re do si do }
    mi,4~\tuplet 3/2 { mi8 mi' re do si do }

    %82
    sol' do, re4. do8
    do\clef bass si16 la sol la sol fa mi fa mi re
    do8 si16 la sol la sol fa mi fa mi re

    %85
    do8 do'' sol, do' sol, si'
    do,,4 r r8 mi'
    fa4 r  r8 fad

    %88
    sol4 r r8 sold
    la4 r r8 la
    sol sol sol sol sol sol

    %91
    fa fa fa fa fa fa
    sol sol sol sol sol sol
    do,4 sol' sol,

    %94
    do2.\fermata

}

IIIbcn = \relative do {

    do4 r r
    sol r r
    do r r

    %4
    sol r r
    do r r
    sol r r

    %7
    do r r
    sol r r
    do r r8 mi

    %10
    fa4 r r8 fad\mbreak
    sol4 r r8 sold
    la4 r r8 la

    %13
    sol? sol sol sol sol sol
    fa fa fa fa fa fa
    sol sol sol sol sol sol

    %16
    do,4 sol' sol,
    do r r
    do r r

    %19
    sol r r
    sol r r\mbreak
    do r r

    %22
    fa r r
    mi r r
    re r r

    %25
    do, do do
    sol' sol sol
    do, do do

    %28
    do mi'2\mbreak
    re8 sol, re'4 re,
    sol r r8 si

    %31
    do4 r r8 dod
    re4 r r8 red
    mi4 r r8 mi

    %34
    re re re re re re
    do do do do do do
    re re re re re re

    %37
    sol4 re' re,
    sol, r r\mbreak
    re' r r

    %40
    sol, r r
    re' re re
    re re re

    %43
    re re re
    red red red
    mi mi mi

    %46
    mi mi mi
    re? re re
    sol sol sol

    %49
    re re re\mbreak
    mi mi mi
    la, la la

    %52
    mi' mi mi
    la, la la
    mi' mi mi

    %55
    la, la la
    mi' mi mi
    mi, mi mi

    %58
    la r r8 do
    re4 r r8 re
    mi4 r r8 mi

    %61
    la la la la la la
    sold mi la la, mi' mi,
    la'4 sol8 fa mi re

    %64
    do4 r r\mbreak
    sol r r
    do r r

    %67
    sol r r
    do2.~
    do4 mi do

    %70
    fa,2 r4
    re'2.~
    re4 fad re

    %73
    sol,2 r4
    mi'2.~
    mi4 fad mi

    %76
    la,2 r4
    sol2 r4\mbreak
    do' do, r

    %79
    mi mi, r
    re' re, r
    do' do, r

    %82
    do' sol' sol,
    do r r
    do r r

    %85
    do, sol' sol
    do, r r8 mi'
    fa4 r  r8 fad

    %88
    sol4 r r8 sold
    la4 r r8 la
    sol sol sol sol sol sol

    %91
    fa fa fa fa fa fa
    sol sol sol sol sol sol
    do,4 sol' sol,

    %94
    do2.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 40
    s2.*94
    \bar"|."


}

IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma>>

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


IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}

IVvlIn =  \relative do'' {

    R2.*11
    sol'8 sol sol sol si sol
    fad fad fad fad si fad

    %14
    si fad fad fad si fad
    mi mi mi mi la mi
    mi mi mi mi la mi

    %17
    red fad fad fad la fad
    sol mi mi mi si' sol
    fad red red red la' fad

    %20
    sol mi mi mi si' mi,
    fad red red red la' fad
    sol mi mi mi fad red

    %23
    mi mi mi  mi fad red
    mi4 r r
    R2.*13

    %38
    re8 re re re fad re
    dod dod dod dod fad dod
    dod? dod dod dod fad dod

    %41
    si si si si mi si
    si si si si mi si
    lad dod dod dod mi dod

    %44
    re si si si fad' re\mbreak
    dod lad lad lad mi' dod
    re si si si fad' re

    %47
    dod lad lad lad mi' dod
    re si' si si dod lad
    si si si si dod lad

    %50
    si4 r r\mbreak
    R2.*14
    do,8 do do do mi do\mbreak

    %66
    si si si si mi si
    si si si si mi si
    la la la la re la

    %69
    la la la la re la
    sold si si si re si
    do la la la mi' do

    %72
    si sold sold sold re' si
    do la' la la si sold
    la la la la si sold

    %75
    la4 r r
    R2.*4
    sol8 sol sol sol si sol

    %81
    fad fad fad fad si fad
    sol sol sol sol si sol
    fad red red si si4

    %84
    R2.*7
    sol'8 sol sol sol si sol
    fad fad fad fad si fad

    %93
    sol sol sol sol si sol
    fad red red si si4
    R2.*3

    %98
    sol'8 sol sol sol si sol
    fad fad fad fad si fad
    fad fad fad fad si fad

    %101
    mi mi mi mi la mi\mbreak
    mi mi mi mi la mi
    red fad fad fad la fad

    %104
    sol mi mi mi si' sol
    fad red red red la' fad
    sol mi mi mi si' sol

    %107
    fad red red red la' fad
    sol mi mi mi fad red
    mi mi mi mi fad red

    %110
    mi2.\fermata

}

IVvlIIn = \relative do'' {

    R2.*11
    mi8 mi mi mi sol mi
    red red red red fad red

    %14
    re! re re re fad re
    dod dod dod dod mi dod
    do do do do mi do

    %17
    si red red red fad red
    mi si si si sol' mi
    red si si si fad' red

    %20
    mi si si si sol' mi
    red si si si  fad' red
    mi sol sol sol la fad

    %23
    mi sol, sol sol la fad
    mi4 r r
    R2.*13

    %38
    si'8 si si si re si
    lad lad lad lad dod lad
    la! la la la dod la

    %41
    sold sold sold sold si sold
    sol! sol sol sol si sol
    fad lad lad lad dod lad

    %44
    si fad fad fad re' si\mbreak
    lad fad fad fad dod' lad
    si fad fad fad re' si

    %47
    lad fad fad fad dod' lad
    si re re re mi dod
    re re re re mi dod

    %50
    re4 r r\mbreak
    R2.*14
    la8 la la la do la\mbreak

    %66
    sold sold sold sold si sold
    sol! sol sol sol si sol
    fad fad fad fad la fad

    %69
    fa! fa fa fa la fa
    mi sold sold sold si sold
    la mi mi mi do' la

    %72
    sold mi mi mi si' sold
    la do do do re si
    do do do do re si

    %75
    do4 r r
    R2.*4
    mi8 mi mi mi sol mi

    %81
    red red red red fad red
    mi mi mi mi sol mi
    red si si fad fad4

    %84
    R2.*7
    mi'8 mi mi mi sol mi
    red red red red fad red

    %93
    mi mi mi mi sol mi
    red si si fad fad4
    R2.*3

    %98
    mi'8 mi mi mi sol mi
    red red red red fad red
    re! re re re fad re

    %101
    dod dod dod dod mi dod\mbreak
    do! do do do mi do
    si red red red fad red

    %104
    mi si si si sol' mi
    red si si si fad' red
    mi si si si sol' mi

    %107
    red si si si fad' red
    mi sol sol sol la fad
    sol sol sol sol la fad

    %110
    sol2.\fermata

}

IVvlan =  \relative do' {

    R2.*11
    si'8 si si si si si
    si si si si si si

    %14
    si si si si fad fad
    la la la la la la
    la la la la la la

    %17
    fad fad fad si, si si
    si si si si si si
    si si si si si si

    %20
    si si si si si si
    si si si si si si
    si si' si si do si

    %23
    sol si, si si do si
    sol4 r r
    R2.*13

    %38
    fad'8 fad fad fad fad fad
    fad fad fad fad fad fad
    fad fad fad fad dod dod

    %41
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    dod dod dod dod dod dod

    %44
    fad fad fad fad fad fad\mbreak
    fad fad fad fad fad fad
    fad fad fad fad fad fad

    %47
    fad fad fad fad fad fad
    fad fad fad fad sol fad
    fad fad fad fad sol fad

    %50
    fad4 r r
    R2.*14
    mi8 mi mi mi mi mi\mbreak

    %66
    mi mi mi mi mi mi
    mi mi mi mi si si
    re re re re re re

    %69
    fa fa fa fa fa fa
    si, si si si si si
    mi mi mi mi mi mi

    %72
    mi mi mi mi mi mi
    mi mi mi mi fa mi
    mi mi mi mi fa mi

    %75
    mi4 r r
    R2.*4
    si'8 si si si si si

    %81
    si si si si si si
    si si si si si si
    si fad! fad red red4

    %84
    R2.*7
    si'8 si si si si si
    si si si si si si

    %93
    si si si si si si
    si fad fad red red4
    R2.*3

    %98
    si'8 si si si si si
    si si si si si si
    si si si si fad fad

    %101
    la la la la la la\mbreak
    do! do do do do do
    fad, fad fad fad fad fad

    %104
    si, si si si si si
    si si si si si si
    si si si si si si

    %107
    si si si si si si
    si si' si si do si
    si si si si do si

    %110
    si2.\fermata

}

IVvcn = \relative do {

    mi'4 \appoggiatura mi8 fad4. sol8
    \appoggiatura sol fad4. sold8 la4
    red,(mi) do

    %4
    \appoggiatura re8 do2\tr si4
    mi sol \appoggiatura fad8 mi4
    \appoggiatura re8 do4.(re16 si) do4

    %7
    re fad \appoggiatura mi8 re4
    \appoggiatura do8 si4.(do16 la) si4
    mi~\tuplet 3/2 { mi8 (re do si la) fad' }

    %10
    \appoggiatura mi8 red4. si8 mi(re?16 do
    si8) sol' \appoggiatura mi8 red4.\tr mi8\mbreak
    mi mi, mi mi mi mi


    %13
    si' si si si si si
    si, si si si si si
    dod dod dod dod dod dod

    %16
    la la la la la la
    si si si si si si
    si si si si si si

    %19
    si si si si si si
    si si si si si si
    si si si si si si

    %22
    mi mi mi mi la, si
    mi mi mi mi la, si
    mi4 r r\mbreak

    %25
    mi'4(fad) sol
    \appoggiatura si,8 lad2\tr si4
    mi(re) dod

    %28
    re16(si8.) dod16(lad8.) si4
    re16(mi fad re) si(do? re si) fad sol la fad
    \appoggiatura fad8 sol4. fad8 mi4

    %31
    mi'16 fad sol mi dod re mi dod lad si dod lad
    fad4. mid16[(fad sold fad mid fad)]
    dod'?4. mid,16[(fad sold fad mid fad)]\mbreak

    %34
    re'4. mid,16[(fad sold fad mid fad)]
    mi'?8.(re16) re8.(dod?16) dod8.(re16)
    re8 [dod?16-.(si-. lad-. sold-. fad-. mi-. re-. dod?-. si-. lad-.)])]

    %37
    si8 mi' dod4.\tr si8
    si si, si si si si
    fad' fad fad fad fad fad

    %40
    fad fad fad fad fad fad
    sold sold sold sold sold sold
    mi mi  mi mi mi mi

    %43
    fad fad fad fad fad fad
    fad fad fad fad fad fad\mbreak
    fad fad fad fad fad fad

    %46
    fad fad fad fad fad fad
    fad fad fad fad fad fad
    si, si si si mi fad

    %49
    si, si si si mi fad
    si,4 r r
    si'(dod) re

    %52
    \appoggiatura fad,8 mid2 fad4
    si16 si (dod re dod8) si(la sold)
    la16 sold(fad) mid \appoggiatura mid8 fad2

    %55
    fad'4 sold la
    \appoggiatura dod,8 sid2 dod4\mbreak
    fad16 fad(sold la sold8) fad(mi red)

    %58
    mi16 red(dod) sid \appoggiatura sid8 dod2
    dod16 dod(re? mi re8 dod si la)
    sold8 fad16 (mi) si'8 la16 sold re'8 do!16 si

    %61
    do4. mi16[(re do la si do)]
    fa,4. fa'16[(mi re si do re)]
    sold,4. si16[(do re si mi si)]

    %64
    do (la mi' la,) si4.\tr la8
    la la, la la la la\mbreak
    mi' mi mi mi mi mi

    %67
    mi mi mi mi mi mi
    fad fad fad fad fad fad
    re re re re re re

    %70
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %73
    la, la la la re mi
    la, la la la re mi
    la,4 r r

    %76
    mi''4 \appoggiatura mi8 fad4. sol8
    \appoggiatura sol8 fad4. sold8 la4\mbreak
    red, mi do

    %79
    do2\tr si4
    mi,8 mi mi mi mi mi
    si si si si si si

    %82
    mi mi mi mi mi mi
    si si si si si si
    mi'4(sol) \appoggiatura fad8 mi4

    %85
    \appoggiatura re8 do4.(re16 si) \appoggiatura si8 do4
    re (fad) \appoggiatura mi8 re4
    \appoggiatura do8 si4.(do16 la) \appoggiatura la8 si4

    %88
    mi~\tuplet 3/2 { mi8 (re do si la) fad' }
    \appoggiatura mi8 red4. si8 mi(re?16 do
    si8) sol' \appoggiatura mi8 red4.\tr mi8\mbreak

    %91
    mi mi, mi mi mi mi
    si si si si si si
    mi mi mi mi mi mi

    %94
    si si si si si si
    si'4 red fad
    sol4. la8 si4

    %97
    mi, red4.\tr mi8
    mi mi, mi mi mi mi
    si si si si si si

    %100
    si si si si si si
    dod dod dod dod dod dod\mbreak
    la la la la la la

    %103
    si si si si si si
    si si si si si si
    si si si si si si

    %106
    si si si si si si
    si si si si si si
    mi mi mi mi la, si

    %109
    mi mi mi mi la, si
    mi2.\fermata

}

IVbcn = \relative do {

    mi2._\markup\italic "Fagotto solo"
    la
    si4 sol red

    %4
    mi8 red mi fad sol mi
    sol2.
    la4. si8 la sol

    %7
    fad2.
    sol4. la8 sol fad
    mi4 sol la

    %10
    si8 do si la sol4~
    sol8 mi si'4 si,\mbreak
    \set Staff.midiInstrument = #"contrabass"
    mi8_\tu mi mi mi mi  mi

    %13
    si' si si si si si
    si, si si si si si
    dod dod dod dod dod dod

    %16
    la la la la la la
    si si si si si si
    si si si si si si

    %19
    si si si si si si
    si si si si si si
    si si si si si si

    %22
    mi mi mi mi la, si
    mi mi mi mi la, si
    mi,4 r r\mbreak

    %25
    \set Staff.midiInstrument = #"bassoon"
    mi'2._\markup\italic "Fagotto solo"
    fad4 mi8 re dod si
    lad2.

    %28
    si4 fad'8 mi re dod
    si2.
    mi4 mi8 fad sol mi

    %31
    dod2.
    fad2 r4
    fad2 r4\mbreak

    %34
    fad2 r4
    fad2 r4
    si,4 r r

    %37
    si8 mi fad4 fad,
    \set Staff.midiInstrument = #"contrabass"
    si8_\tu si si si si si
    fad' fad fad fad fad fad

    %40
    fad fad fad fad fad fad
    sold sold sold sold sold sold
    mi mi  mi mi mi mi

    %43
    fad fad fad fad fad fad
    fad fad fad fad fad fad\mbreak
    fad fad fad fad fad fad

    %46
    fad fad fad fad fad fad
    fad fad fad fad fad fad
    si, si si si mi fad

    %49
    si, si si si mi fad
    si,4 r r
    \set Staff.midiInstrument = #"bassoon"
    si2._\markup\italic "Fagotto solo"

    %52
    dod4 si8 la sold fad
    mid2.
    fad

    %55
    la'
    sold4 fad8 mi red dod?\mbreak
    sid2.

    %58
    dod
    la'4 fad2
    mi2.

    %61
    la,8 si do! si do la
    re mi fa mi fa re
    mi fad? sold fad sold mi

    %64
    la la, mi'4 mi,
    \set Staff.midiInstrument = #"contrabass"
    la8_\tu la la la la la\mbreak
    mi' mi mi mi mi mi

    %67
    mi mi mi mi mi mi
    fad fad fad fad fad fad
    re re re re re re

    %70
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %73
    la, la la la re mi
    la, la la la re mi
    la,4 r r

    %76
    \set Staff.midiInstrument = #"bassoon"
    mi'2._\markup\italic "Fagotto solo"
    la\mbreak
    si4 sol la

    %79
    red,2 mi4
    \set Staff.midiInstrument = #"contrabass"
    mi8_\tu mi mi mi mi mi
    si si si si si si

    %82
    mi mi mi mi mi mi
    si si si si si si
    \set Staff.midiInstrument = #"bassoon"
    sol'2._\markup\italic "Fagotto solo"

    %85
    la4. si8 la sol
    fad2.
    sol4. la8 sol fad

    %88
    mi4 la,2
    si'8 do si la sol4~\mbreak
    sol8 mi si'4 si,

    %91
    \set Staff.midiInstrument = #"contrabass"
    mi8_\tu mi mi mi mi mi
    si si si si si si
    mi mi mi mi mi mi

    %94
    si si si si si si
    \set Staff.midiInstrument = #"bassoon"
    si2._\markup\italic "Fagotto solo"
    mi4. fad8 sol4

    %97
    la si si,
    \set Staff.midiInstrument = #"contrabass"
    mi8_\tu mi mi mi mi mi
    si si si si si si

    %100
    si si si si si si
    dod dod dod dod dod dod\mbreak
    la la la la la la

    %103
    si si si si si si
    si si si si si si
    si si si si si si

    %106
    si si si si si si
    si si si si si si
    mi mi mi mi la, si

    %109
    mi mi mi mi la, si
    mi,2.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mi \minor
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \override Score.RehearsalMark.extra-offset = #'(0 . -1.5)
    \tempo 4 = 50
    s2.*11\break
    \mark\markup\huge "Allegro molto"
    \tempo 2. = 45
    s2.*13\break
    \mark\markup\huge "Adagio"
    \tempo 4 = 50
    s2.*13\break
    \mark\markup\huge "All[egr]o"
    \tempo 2. = 45
    s2.*13\break
    \mark\markup\huge "Adagio"
    \tempo 4 = 50
    s2.*14\break
    \mark\markup\huge "All[egr]o"
    \tempo 2. = 45
    s2.*11\break
    \mark\markup\huge "Adagio"
    \tempo 4 = 50
    s2.*4
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . -4)
    \mark\markup\huge "All[egr]o"
    \tempo 2. = 45
    s2.*4\break
    \mark\markup\huge "Adagio"
    \tempo 4 = 50
    s2.*7%\break
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . -1.5)
    \mark\markup\huge "All[egr]o"
    \tempo 2. = 45
    s2.*4\break
    \mark\markup\huge "Adagio"
    \tempo 4 = 50
    s2.*3
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . -4)
    \mark\markup\huge "All[egr]o"
    \tempo 2. = 45
    s2.*13
    \bar"|."

}

IVvc = {
    \IVglobal
    \clef tenor
    <<\IVvcn \forma>>

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

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}


Vglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VvlIn =  \relative do'' {

    R1*5
    r2 r8 sol' sol sol
    fad fad fad fad mi4 r

    %8
    R1*5
    r2 r8 la la la
    la la sold sold la4 r

    %15
    R1*9
    r8 sol sol sol fad fad sold sold\mbreak
    la la la la sol? sol fad fad

    %26
    mi sol, sol sol fad fad fad fad
    mi1\fermata

}

VvlIIn = \relative do'' {

    R1*5
    r2 r8 mi mi mi
    mi mi red red mi4 r

    %8
    R1*5
    r2 r8 do do do
    si si si si do4 r

    %15
    R1*9
    r8 mi mi mi mi mi re re\mbreak
    dod dod red red mi mi mi red

    %26
    mi mi, mi mi mi mi red red
    mi1\fermata

}

Vvlan =  \relative do' {

    R1*5
    r2 r8 si' si si
    do do si si sol4 r

    %8
    R1*5
    r2 r8 mi mi mi
    fa fa mi mi mi4 r

    %15
    R1*9
    r8 si' si si si si si sold\mbreak
    mi mi red si' si si si si

    %26
    si si, si si do do si si
    sol1\fermata

}

Vvcn = \relative do {

    mi16 fad sol fad mi fad sol la si la si do si do re si
    mi red mi fad  mi fad sol mi red mi dod red si4
    mi16 re? mi fa mi re do si do si do re do la si do

    %4
    re do re mi re do si la si [do si la sol si la si]
    do[si do re do si la sol] la[si la sol fad! la sol la]\mbreak
    si [la si do si la sol fad] sol8 \clef bass mi mi mi

    %7
    la, la  si si  mi16 si' la si sol si la si
    mi, si' la si sol si la sol fad re' do re fad, la sol la
    re, do' si do re, do' si la si sol fad sol si, re do re

    %10
    sol, re' do re sol, si' la sol fad la sol la  re, do' si la
    si sold fad sold mi re' do si\mbreak do la sold la mi do' si la
    sold si la si mi, re' do si\clef tenor do si do la re do re si

    %13
    mi re mi do fad mi fad re sold8\clef bass la,, la la
    re re mi mi  do'16 mi, do mi la mi do la'
    si sold mi sold si sold mi si' do la mi la do la mi la\mbreak

    %16
    do fad, re la' do la re, do' si sol re sol si sol re sol
    la fad red fad la fad red fad si do la si sol la fad sol
    mi fad re mi do do' si do la si sol la fad sol mi fad

    %19
    red mi dod red si si' la si sol mi sol si la fad la do
    \clef tenor si sol si re do la do mi\mbreak red dod si dod red si dod red
    mi fad mi fad mi fad mi fad sol fad mi fad mi fad mi fad

    %22
    sol fad mi fad mi fad mi fad sol8 mi fad red
    mi[re?16 do si do si la] sol8 mi' \clef bass si,\clef tenor red'
    \clef bass mi, mi mi mi si' si mi, mi\mbreak

    %25
    la la si si mi, mi si' si,
    mi mi mi mi la, la si si
    mi,1\fermata

}

Vbcn = \relative do {

    mi8_\markup\italic "[Fagotto solo]" mi mi mi re re re re
    do do do do si si si si
    sold' sold sold sold la la la la

    %4
    fad fad fad fad sol? sol sol sol
    mi mi mi mi fad fad fad fad\mbreak
    red red red red mi mi \parenthesize _\tu mi mi

    %7
    la, la si si mi mi_\markup\italic "[Fagotto solo]" mi mi
    mi mi mi mi re? re re re
    re re re re sol, sol sol sol

    %10
    sol sol sol sol re' re re re
    mi mi mi mi\mbreak la, la la la
    mi' mi mi mi la, la si si

    %13
    do do re re mi  la,\parenthesize _\tu la la
    re re mi mi la, la_\markup\italic "[Fagotto solo]" la la
    sold sold sold sold la la la la

    %16
    re re re re sol,? sol sol sol
    si si si red  mi4 r
    mi r fad r

    %19
    si, r mi8 mi fad fad
    sol sol la la\mbreak si si la la
    sol4 r mi r

    %22
    mi r mi8 sol, la si
    mi mi red red mi4 si
    mi8 mi\parenthesize _\tu mi mi si' si mi, mi\mbreak

    %25
    la la si si mi, mi si' si,
    mi mi mi mi la, la si si
    mi,1\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mi \minor
    \time 4/4
    \override Score.RehearsalMark.extra-offset = #'(0 . -1.5)
    \tempo 1 = 35
    s1*5
    s2 s8\once\override Score.RehearsalMark.extra-offset = #'(+2 . -3)
    \mark\markup\huge "Ad[agi]o"
    \tempo 4 = 50
    s s4
    s2 s8\once\override Score.RehearsalMark.extra-offset = #'(+2 . -1.5)
    \mark\markup\huge "All[egr]o"
    \tempo 1 = 35
    s s4
    s1*5
    s2 s8\once\override Score.RehearsalMark.extra-offset = #'(+2 . -1.5)
    \mark\markup\huge "Ad[agi]o"
    \tempo 4 = 50
    s s4
    s2 s8\once\override Score.RehearsalMark.extra-offset = #'(+2 . -1.0)
    \mark\markup\huge "All[egr]o"
    \tempo 1 = 35
    s s4
    s1*9\break
    s8
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . -3)
    \mark\markup\huge "Adagio"
    \tempo 4 = 50
    s s4 s2
    s1*3
    \bar"|."

}

Vvc = {
    \Vglobal
    \clef tenor
    <<\Vvcn \forma>>

}

VvlI = {
    \Vglobal
    <<\VvlIn \forma>>

}

VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>

}

Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}


VIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIvlIn =  \relative do'' {

    mi8 sol4 si sol8
    fad si,4 fad' la8
    sol si,4 sol' si8

    %4
    fad red si fad si, r
    mi'8[mi16 mi mi8 re do si]
    la[la16 la la8 sol fad mi]

    %7
    red mi si'4 si,
    mi4 r8 mi' sol si %%$ fin qui
    r4 r8 mi, sol si

    %10
    R2.\mbreak
    r4 r8 mi, sol si
    r4 r8 mi, sol si

    %13
    r4 r8 la, do mi
    r4 r8 re fad la
    r4 r8 sol, si re

    %16
    r4 r8 do mi la
    fad4 r r
    R2.*6

    %24
    si8 re4 si sol8
    la re4 la fad8
    sol re'4 si sol8

    %27
    fad re' la fad8 re r
    sol,8[sol16 sol sol8 fad mi re]\mbreak
    do[do16 do do8 si la sol]

    %30
    re' sol re'4 re,
    sol, r r
    R2.*12

    %44
    r8 re'' re(fa?) fa(si)
    si(re,) re(fa?) fa(re)
    do4 r r\mbreak

    %47
    R2.*2
    mi8 sol4 mi do8
    re sol,4 si re8

    %51
    mi sol,4 do mi8
    re sol re si sol r
    do,2.

    %54
    sol'
    sol
    la\mbreak
    la

    %58
    si
    si
    do

    %61
    la
    mi
    la

    %64
    re,
    re\mbreak
    mi

    %67
    la,4 mi' mi
    do'8 mi4 do la8
    si mi4 si sold8

    %70
    la mi'4 do la8
    la' do, si la' si, sold'
    la4 r r

    %73
    R2.*20
    mi8 sol4 si sol8
    fad si,4 fad' la8

    %95
    sol si,4 sol' si8
    fad red si fad si, r
    mi'8[mi16 mi mi8 re do si]

    %98
    la[la16 la la8 sol fad mi]
    red mi si'4 si,
    mi4\fermata r r

}

VIvlIIn = \relative do'' {

    si8 mi4 sol mi8
    red fad,4 red' fad8
    mi sol,4 mi' sol8

    %4
    red si fad red si r
    mi'8[mi16 mi mi8 re do si]
    la[la16 la la8 sol fad mi]

    %7
    red mi si'4 si,
    mi4 r r  %%% fin qui
    R2.*15

    %24
    sol'8 si4 sol re8
    fad la4 fad re8
    si si'4 sol re8

    %27
    re la' fad re la r
    sol[sol16 sol sol8 fad mi re]\mbreak
    do[do16 do do8 si la sol]

    %30
    re' sol re'4 re,
    sol, r r
    R2.*17

    %49
    sol'8 mi'4 do sol8
    si re,4 sol si8
    do mi,4 sol do8

    %52
    si re si sol re r
    do2.

    %54
    sol'
    sol
    la\mbreak
    la

    %58
    si
    si
    do

    %61
    la
    mi
    la

    %64
    re,
    re\mbreak
    mi

    %67
    la,4 mi' mi
    la8 do4 la mi8
    sold si4 sold mi8

    %70
    do' la'4 mi do8
    mi do si la' si, sold'
    la4 r r

    %73
    R2.*20
    si,8 mi4 sol mi8
    red fad,4 red' fad8

    %95
    mi sol,4 mi' sol8
    red si fad red si r
    mi'8[mi16 mi mi8 re do si]

    %98
    la[la16 la la8 sol fad mi]
    red mi si'4 si,
    mi4\fermata r r

}

VIvlan =  \relative do' {

    si4 si si
    si si si
    si si si

    %4
    si si si
    mi'8[mi16 mi mi8 re do si]
    la[la16 la la8 sol fad mi]

    %7
    red mi si'4 si,
    mi r r %% fin qui
    R2.*15

    %24
    re4 re re
    re re re
    re re re
    re re re

    %28
    sol8[sol16 sol sol8 fad mi re]\mbreak
    do[do16 do do8 si la sol]
    re' sol re'4 re,

    %31
    sol, r r
    R2.*17
    sol'4 sol sol

    %50
    sol sol sol
    sol sol sol
    sol sol sol
    do,2.

    %54
    sol'
    sol
    la\mbreak
    la

    %58
    si
    si
    do

    %61
    la
    mi
    la

    %64
    re,
    re\mbreak
    mi

    %67
    la,4 mi' mi,
    mi' mi mi
    mi mi mi

    %70
    mi mi mi
    mi mi mi
    do r r

    %73
    R2.*20
    si4 si si
    si si si

    %95
    si si si
    si si si
    mi'8[mi16 mi mi8 re do si]

    %98
    la[la16 la la8 sol fad mi]
    red mi si'4 si,
    mi \fermata r r

}

VIvcn = \relative do {

    mi4 mi mi
    si si si
    mi mi mi

    %4
    si si si
    mi'8[mi16 mi mi8 re do si]
    la[la16 la la8 sol fad mi]

    %7
    red mi si'4 si,
    \clef tenor si'16(la si do si4.) si8
    mi16(red mi fad mi4.) mi8

    %10
    red fad la, do fad, la\mbreak
    \clef bass sol mi si sol mi r
    \clef tenor mi''16(red mi fad mi8) sol(mi re?)

    %13
    do16(si do re do8) mi(re do)
    re16(do re mi re8) fad(re do)
    si16(la si do si8) re(do si)

    %16
    do16 re mi do la si do la fad sol la fad
    re la' si do re, la' si do re, la' si do
    re, si' do re re, si' do re re, si' do re

    %19
    re, do' re mi re, do' re mi re, do' re mi\mbreak
    re, re' mi fad re, re' mi fad re, re' mi fad
    re, mi' fad sol re, mi' fad sol re, mi' fad sol

    %22
    re, fad' sol la re,, fad' sol la re,, fad' sol la
    sol8 re, sol' la, fad' la,
    \clef bass sol,4 sol sol

    %25
    re' re re
    sol, sol sol
    re' re re

    %28
    sol8[sol16 sol sol8 fad mi re]\mbreak
    do[do16 do do8 si la sol]
    re' sol re'4 re,

    %31
    sol8 re'4 si sol8
    la re4 la fad8
    sol re'4 si sol8

    %34
    re re'4 do la8
    si sol4 fa re8
    mi do'4 sib sol8

    %37
    la fa4 re do8
    si? [si'16 do re do si la] sol la sol fa\mbreak
    mi16 do' si do mi, do' si do mi, do' si do

    %40
    re, si' la si re, si' la si re, si' la si
    do, la' sol la do, la' sol la do, la' sol la
    si, sol' fad sol si, sol' fad sol si, sol' fad sol

    %43
    la, fad' mi fad la, fa' mi fa la, fa' mi fa
    sol,8 (\clef tenor si') si(re) re(fa)
    fa?(sol) sol(re) re(mi)

    %46
    mi si do mi, re si'\mbreak
    do4. re16 mi fa?8 mi16 re
    sol8 do, re4. do8

    %49
    do4 \clef bass do, do
    sol sol sol
    do do do

    %52
    sol sol sol
    \clef tenor \appoggiatura re''8 do16(si do8) \appoggiatura re8 do16(si do8) \appoggiatura re8 do16(si do8)
    \appoggiatura do8 si4. la8 sol4

    %55
    \appoggiatura mi'8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8)
    \appoggiatura re8 do4. si8 la4\mbreak
    \appoggiatura fad'8 mi16(re mi8) \appoggiatura fad8 mi16(re mi8) \appoggiatura fad8 mi16(re mi8)

    %58
    \appoggiatura mi8 re4. do8 si4
    \appoggiatura sol'8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8)
    \appoggiatura fad8 mi4. re8 do4

    %61
    \tuplet 3/2 { do8(mi re) } do4~\tuplet 3/2 { do8(si la) }\senza
    \tuplet 3/2 { sold(si la) } sold4~\tuplet 3/2 { sold8(fad mi) }
    \tuplet 3/2 { do'8(mi re) } do4~\tuplet 3/2 { do8(si la) }

    %64
    fad'4~\tuplet 3/2 { fad8 la sol fad la sol }
    fad4~\tuplet 3/2 { fad8(la sol fad mi re) }\mbreak
    sold,4~\tuplet 3/2 { sold8 fad' mi re do si }

    %67
    \tuplet 3/2 { do si la } si4. la8
    la4 \clef bass la, la
    mi' mi mi

    %70
    la, la la
    la mi' mi,
    la'16 mi la do la mi la do la mi la do

    %73
    si sold si re si sold si re si sold si re
    \clef tenor do la do mi  do la do mi  do la do mi\mbreak
    red la red fad red la red fad red la red fad

    %76
    sol[fad fad mi mi re? re do do si si do]
    do4(mi sol)
    fad16[mi mi re re do do si si la la si]

    %79
    si4(re fad)
    mi16[re re do do si si la la sol sol la]
    la4(red fad)

    %82
    sol16(fad mi8) sol16(fad mi8) sol16(fad mi8)
    red4(dod si)\mbreak
    sol'16(fad mi8) sol16(fad mi8) sol16(fad mi8)

    %85
    red4(do? si)
    mi16 fad sol8~sol16 fad mi8~mi16 red dod si
    mi16 fad sol8~sol16 fad mi8~mi16 red do? si

    %88
    mi4 fa sold
    la4. sol?16[fad? mi red mi fad]
    sol4. fad16[(mi red8 dod)]\mbreak

    %91
    si4(red fad)
    sol8 fad16 mi red4. mi8
    mi4 \clef bass  mi ,mi

    %94
    si si si
    mi mi mi
    si si si

    %97
    mi'8[mi16 mi mi8 re do si]
    la[la16 la la8 sol fad mi]
    red mi si'4 si,

    %100
    mi4\fermata r r

}

VIbcn = \relative do {

    mi4 mi mi
    si si si
    mi mi mi

    %4
    si si si
    mi'8[mi16 mi mi8 re do si]
    la[la16 la la8 sol fad mi]

    %7
    red mi si'4 si,
    mi4. fad8 sol fad
    mi4. fad8 sol mi

    %10
    si2 r4\mbreak
    mi,2.
    sol'

    %13
    la
    fad
    sol

    %16
    la
    re,4 re re
    re re re

    %19
    re re re\mbreak
    re re re
    re re re

    %22
    re re re
    sol, re' re,
    sol sol sol

    %25
    re' re re
    sol, sol sol
    re' re re

    %28
    sol8[sol16 sol sol8 fad mi re]\mbreak
    do[do16 do do8 si la sol]
    re' sol re'4 re,

    %31
    sol sol sol
    re re re
    sol, sol sol

    %34
    re' re re
    sol, sol sol
    do do do

    %37
    la la la
    sol sol sol\mbreak
    do do do

    %40
    re re re
    do do do
    si si si

    %43
    la la la
    sol sol sol
    sol sol sol

    %46
    do8 sol' mi do sol4\mbreak
    do r r
    do sol' sol,

    %49
    do do do
    sol sol sol
    do do do

    %52
    sol sol sol
    do2.
    sol'

    %55
    sol
    la\mbreak
    la

    %58
    si
    si
    do

    %61
    la
    mi
    la

    %64
    re,
    re\mbreak
    mi

    %67
    la,4 mi' mi,
    la la la
    mi' mi mi

    %70
    la, la la
    la mi' mi,
    la la la

    %73
    mi' mi mi
    la, la la\mbreak
    si si si

    %76
    mi r r
    la, la la
    re r r

    %79
    sol, sol sol
    do r r
    red, red red

    %82
    mi mi' mi
    si2.\mbreak
    mi4 mi mi

    %85
    si2.
    mi4 mi mi
    mi mi mi

    %88
    sol la si
    red,2.
    mi\mbreak

    %91
    red2.
    mi8 la si4 si,
    mi mi mi

    %94
    si si si
    mi mi mi
    si si si

    %97
    mi'8[mi16 mi mi8 re do si]
    la[la16 la la8 sol fad mi]
    red mi si'4 si,

    %100
    mi4\fermata r r

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mi\minor
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    s2.*100
    \bar"|."

}

VIvc = {
    \VIglobal
    \clef bass
    <<\VIvcn \forma>>

}

VIvlI = {
    \VIglobal
    <<\VIvlIn \forma>>

}

VIvlII = {
    \VIglobal
    <<\VIvlIIn \forma>>

}

VIvla = {
    \VIglobal
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}
#(set-global-staff-size 16)


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
        title = \markup\smaller{Concerto per Violoncello in Do maggiore [RV 400]}
        composer = \markup \center-column{"A. Vivaldi (1678 -1741)"}
    }

    \markup\huge "[I.1] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc"
                \Ivc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #7

    }

    \markup\huge "[I.2] Largo"

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
                \IIvc
            >>

            \new Staff \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #11
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup\huge "[I.3] All[egr]o non molto"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc"
                \IIIvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \header {
        title = \markup\smaller{Concerto per Violoncello in Mi minore[RV 409]}
        composer = \markup \center-column{"A. Vivaldi (1678 -1741)"}
    }

    \markup\huge "[II.1] Ad[agi]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc"
                \IVvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup\huge "[II.2] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \set Staff.shortInstrumentName = "vl1"
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \set Staff.shortInstrumentName = "vl2"
                    \VvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc"
                \Vvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup\huge "[II.3] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \set Staff.shortInstrumentName = "vl1"
                    \VIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \set Staff.shortInstrumentName = "vl2"
                    \VIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc"
                \VIvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

