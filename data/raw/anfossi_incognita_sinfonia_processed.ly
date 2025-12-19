\language "italiano"
\version "2.24.0"

sfz = #(make-dynamic-script "sfz")

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph "scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IcrIn = %\transpose do re, {
\relative do'' {
    \key do\major

    do,4 do do do
    do r r2
    sol'4 sol sol sol

    %4
    sol r sol sol
    do sol sol sol
    do r sol sol

    %7
    do sol' mi do
    sol' sol, sol  r
    R1*6

    %15
    do,4 do do do
    do r r2
    sol'4 sol sol sol

    %18
    sol r sol sol
    do sol sol sol
    do r sol sol

    %21
    do sol' mi do
    sol' sol, sol  r
    R1*6

    %29
    do1~
    do~
    do~

    %32
    do~
    do~
    do4 r r2

    %35
    re re
    re re
    re4 re re re

    %38
    re r r2
    R1*13
    re4 re re r

    %53
    re2 re
    mi mi
    re4 re re re

    %56
    re re re r
    re2 re
    mi mi

    %59
    re4 re re re
    re mi re re
    re mi re re

    %62
    re r r2
    R1
    r2 re4 mi

    %65
    fa mi fa re
    mi r r2
    R1\mbreak

    %68
    r2 mi4 fa
    sol fa sol mi
    fa r r2

    %71
    R1
    sol,\p~
    sol~

    %74
    sol~
    sol
    do,4\f do do do

    %77
    do r r2
    sol'4 sol sol sol
    sol r r2

    %80
    do4 sol sol sol
    do r sol sol
    do sol' mi do

    %83
    sol' sol, sol  r
    R1*6
    do1~

    %91
    do~
    do~
    do

    %94
    mi4 mi mi mi
    re r re r
    re re re re

    %97
    mi r mi r
    do do do do
    sol r r2

    %100
    R1*13
    mi'4 mi mi r
    mi2 mi

    %115
    do4 do do do
    mi2 re4 re\mbreak
    mi mi mi r

    %118
    mi2 mi
    do4 do do do
    mi2 re4 re

    %121
    do do mi re
    do do mi re
    do r do mi

    %124
    do do do do
    do r r2\fermopz

}

%}


IcrIIn = %\transpose do re, {
\relative do'' {
    \key do\major

    do,4 do do do
    do r r2
    sol'4 sol sol sol

    %4
    sol r sol sol
    do sol sol sol
    do r sol sol

    %7
    do sol' mi do
    sol' sol, sol  r
    R1*6

    %15
    do,4 do do do
    do r r2
    sol'4 sol sol sol

    %18
    sol r sol sol
    do sol sol sol
    do r sol sol

    %21
    do sol' mi do
    sol' sol, sol  r
    R1*6

    %29
    do1~
    do~
    do~

    %32
    do~
    do~
    do4 r r2

    %35
    re re
    re re
    re4 re re re

    %38
    re r r2
    R1*13
    sol,4 sol sol r\mbreak

    %53
    sol2 sol
    do do
    re4 re re re

    %56
    sol, sol sol r
    sol2 sol
    do do

    %59
    re4 re re re
    sol, do re re
    sol, do re re

    %62
    sol, r r2
    R1
    r2 sol4 do

    %65
    re do re sol,
    do r r2\mbreak
    R1

    %68
    r2 do4 re
    mi re mi do
    re r r2

    %71
    R1
    sol,\p~
    sol~

    %74
    sol~
    sol
    do,4\f do do do

    %77
    do r r2
    sol'4 sol sol sol
    sol r r2

    %80
    do4 sol sol sol
    do r sol sol
    do sol' mi do

    %83
    sol' sol, sol  r
    R1*6
    do1~

    %91
    do~
    do~
    do

    %94
    mi4 mi mi mi
    re r re r
    re re re re

    %97
    mi r mi r
    do do do do
    sol r r2

    %100
    R1*13
    do4 do do r
    do2 do

    %115
    do4 do do do\mbreak
    do2 sol4 sol
    do do do r

    %118
    do2 do
    do4 do do do
    do2 sol4 sol

    %121
    do do do sol
    do do do sol
    mi r mi sol

    %124
    mi do do do
    do r r2\fermata

}

%}

IobIn = \relative do'' {

    re4 re re re
    re r re8 mi fad re
    la'4 la la la

    %4
    la r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %7
    re4 la fad re
    la' la, la r
    R1*6

    %15
    re4\ff re re re
    re r re8 mi fad re
    la'4 la la la

    %18
    la r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %21
    re4 la fad re
    la' la, la r
    R1*6

    %29
    la'4 la la r
    la2 la
    si4 si si r

    %32
    si2 si
    la4 la la r
    la2 la\mbreak

    %35
    sold2 sold
    la la
    si si

    %38
    la4 r r2
    R1*13
    la4 la la r

    %53
    mi2 mi
    fad fad
    la4 la sold sold

    %56
    la la la r
    mi2 mi
    fad fad

    %59
    la4 la sold sold
    la fad mi sold
    la fad mi sold\mbreak

    %62
    la4 r r2
    R1
    r2 mi4 fad

    %65
    sol! fad sol mi
    fad r r2
    R1

    %68
    r2 fad4 sol
    la sol la fad
    sol r r2

    %71
    R1
    sol4(la si la)
    sol(fad mi fad)

    %74
    mi r r2
    R1
    re4 re re re

    %77
    re r re8 mi fad re\mbreak
    la'4 la la la
    la r la8 si dod la

    %80
    re4 la la8 si dod la
    re4 r la8 si dod la
    re4 la fad re

    %83
    la' la, la r
    R1*6
    la'4 la la r

    %91
    la2 la
    la4 la la r
    la2 la

    %94
    fad4 fad fad fad
    sol r sol r\mbreak
    mi mi mi mi

    %97
    fad r fad r
    sold sold sold sold
    la r r2

    %100
    R1*13
    la4 la la r
    la2 la

    %115
    si4 si si si
    fad2 mi4 mi
    fad la la r

    %118
    la2 la
    si4 si si si
    fad2 mi4 mi\mbreak

    %121
    la si fad mi
    la si fad mi
    re r fad la

    %124
    fad re re re
    re r r2\fermopz

}

IobIIn = \relative do'' {

    re4 re re re
    re r re8 mi fad re
    la'4 la la la

    %4
    la r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %7
    re4 la fad re
    la' la, la r
    R1*6

    %15
    re4\ff re re re
    re r re8 mi fad re
    la'4 la la la

    %18
    la r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %21
    re4 la fad re
    la' la, la r
    R1*6

    %29
    fad'4 fad fad r
    fad2 fad
    sol4 sol sol r

    %32
    sol2 sol
    fad4 fad fad r\mbreak
    fad2 fad

    %35
    si, si
    dod dod
    re re

    %38
    dod4 r r2
    R1*13
    dod4 dod dod r

    %53
    dod2 dod
    re re
    dod4 dod si si

    %56
    dod dod dod r
    dod2 dod
    re re

    %59
    dod4 dod si si
    la re dod si\mbreak
    la re dod si

    %62
    la r r2
    R1
    r2 dod4 re

    %65
    mi re mi dod
    re r r2
    R1

    %68
    r2 re4 mi
    fad mi fad re
    mi r r2

    %71
    R1
    mi4(fad sol fad)
    mi(re dod re)

    %74
    dod4 r r2
    R1
    re4 re re re

    %77
    re r re8 mi fad re\mbreak
    la'4 la la la
    la r la8 si dod la

    %80
    re4 la la8 si dod la
    re4 r la8 si dod la
    re4 la fad re

    %83
    la' la, la r
    R1*6
    fad'4 fad fad r

    %91
    fad2 re
    do4 do do r
    do?2 do

    %94
    si4 si si si\mbreak
    si r si r
    la la la la

    %97
    la r la r
    re re re re
    dod r r2

    %10
    R1*13
    fad4 fad fad r
    fad2 fad

    %115
    re4 re re re
    re2 dod4 dod
    re fad fad r

    %118
    fad2 fad
    re4 re re re\mbreak
    re2 dod4 dod

    %121
    re re re dod
    re re re dod
    re r re fad

    %124
    re re, re re
    re r r2\fermata

}

IvlIn = \relative do'' {

    << {re4 re re re}\\ {re, re re re}>>
    <re' re,>4 r re8 mi fad re
    <<{la'4 la la la}\\{la, la la la}>>

    %4
    <la' la,>4 r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %7
    re4 la fad re
    la' la, la r
    r la'8\p(fad) re4 (fad)\mbreak

    %10
    sol8(la) sol(la) mi4 r
    r la8\sf(fad) re4\p \parenthesize (fad)
    sol8(la) sol(la) mi4 r

    %13
    r la8\sf(fad) re4\p \parenthesize (fad)
    r mi8  \parenthesize (si') la4 dod,
    << {re4\ff re re re}\\ {re, re re re}>>

    %16
    <re' re,>4 r re8 mi fad re
    <<{la'4 la la la}\\{la, la la la}>>
    <la' la,>4 r la8 si dod la

    %19
    re4 la la8 si dod la
    re4 r la8 si dod la
    re4 la fad re

    %22
    la' la, la r
    r la'8\sf(fad) re4 \parenthesize (fad)\mbreak
    sol8(la) sol(la) mi4 r

    %25
    r la8\sf(fad) re4\p \parenthesize (fad)
    sol8(la) sol(la) mi4 r
    r la8\sf(fad) re4\p \parenthesize (fad)

    %28
    r mi8 \parenthesize (si') la4 dod,
    re'8\ff la la la la4 r
    re8 la la la re la la la

    %31
    re si si si si4 r
    re8 si si si re si si si
    re la la la la4 r

    %34
    re8 la la la re la la la
    sold32 (la si8.) si8 si sold32 (la si8.) si8 si
    la32 (si dod8.) dod8 dod la32 (si dod8.) dod8 dod

    %37
    si32 dod re8. re8 re si32 dod re8. re8 re\mbreak
    dod4 r sold8\p(la) sold(la)
    \acciaccatura sold8 fad4(mi) mi-. mi-.

    %40
    mi-! r sold8(la) sold(la)
    \acciaccatura sold? fad4(mi )mi-. mi-.
    mi4\parenthesize -! r sold8(la) sold(la)

    %43
    fad4\mf la(sold fad)
    mi (re dod si)
    la-! r sold'8\p(la) sold(la)

    %46
    \acciaccatura sold? fad4(mi) mi-. mi-.
    mi4 -! r sold8(la) sold(la)\mbreak
    \acciaccatura sold? fad4(mi) mi-. mi-.

    %49
    mi4\parenthesize -! r sold8(la) sold(la)
    fad4 la\mf(sold fad)
    mi(re dod si)

    %52
    <dod' la,>8\ff la la la la4 r
    <dod la,>8 la la la <dod la,> la la la
    si32 dod re8. re8 re si32 dod re8. re8 re

    %55
    dod32(si la8.) la8 la sold32(la si8.) si8 si
    <dod la,> la la la\mbreak la4 r
    <dod la,>8 la la la <dod la,> la la la

    %58
    si32 dod re8. re8 re si32 dod re8. re8 re
    dod32(si la8.) la8 la sold32(la si8.) si8 si
    la4 <fad la, re,> <mi dod la> <sold si, mi,>

    %61
    <la dod, mi,>  <fad la, re,> <mi dod la> <sold si, mi,>
    <la dod, mi,> r la,\p(si)
    dod4-! r dod(re)

    %64
    mi-! r\mbreak mi8\ff la, fad' la,
    sol'! la, fad' la, sol' la, mi' la,
    <fad' la,>4 r re\p(mi)

    %67
    fad-! r fad(sol)
    la-!  r fad8\f la, sol' la,
    la' la, sol' la, la' la, fad' la,

    %70
    sol'4-! r dod,\p(re)
    mi-! r mi(fad)
    sol(la si la)

    %73
    sol\mf(fad mi fad)\mbreak
    mi(re dod si)
    la(sol fad mi)

    %76
    << {re'4\f re re re}\\{ re, re re re}>>
    <re' re,>4 r re8 mi fad re
    <<{la'4 la la la}\\{la, la la la}>>

    %79
    <la' la,>4 r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %82
    re4 la fad re
    la' la, la r
    r la'8\sf(fad) re4\p \parenthesize (fad)\mbreak

    %85
    sol8(la) sol(la) mi4 r
    r la8\sf(fad) re4\p \parenthesize (fad)
    sol8(la) sol(la) mi4 r

    %88
    r la8\sf(fad) re4\p \parenthesize (fad)
    r mi8 (si') la4 dod,
    re'8\ff la la la la4 r

    %91
    re8 la la la re la la la
    do la la la la4 r
    do?8 la la la do la la la

    %94
    si fad fad fad\mbreak si fad fad fad
    sol32 fad mi8. mi8 mi sol32 fad mi8. mi8 mi
    la mi mi mi la mi mi mi

    %97
    fad32 mi re8. re8 re fad32 mi re8. re8 re
    si'32 la sold8. sold8 sold si32 la sold8. sold8 sold
    la4 r dod8\p(re) dod(re)

    %100
    \acciaccatura dod si4(la) la-. la-.
    la-! r dod8(re) dod(re)\mbreak
    \acciaccatura dod si4(la) la-. la-.

    %103
    la r dod8(re) dod(re)
    si4 re\mf(dod si)
    la(sol fad mi)

    %106
    re-!r dod'8\p(re) dod(re)
    \acciaccatura dod si4(la) la-. la-.
    la -! r dod8(re) dod(re)

    %109
    si4(la) la-. la-.
    la r dod8(re) dod(re)
    si4 re\mf(dod si)\mbreak

    %112
    la(sol fad mi)
    re'8\ff la la la la4 r
    re8 la la la re la la la

    %115
    si32 dod re8. re8 re si32 dod re8. re8 re
    fad, re' re re mi, dod' dod dod
    re la la la la4 r

    %118
    re8 la la la re la la la
    si32 dod re8. re8 re si32 dod re8. re8 re
    fad, re' re re mi, dod' dod dod

    %121
    <re re, re,>4 <si re, re,> <la re, re,> dod<re re, re,>4 <si re, re,> <la re, re,>
    <mi dod la>
    <fad la, re,> r <fad la, re,> <la la, re,>

    %124
    <fad la, re,> re, re re
    re r r2\fermopz

}

IvlIIn = \relative do'' {

    << {re4 re re re}\\ {re, re re re}>>
    <re' re,>4 r re8 mi fad re
    <<{la'4 la la la}\\{la, la la la}>>

    %4
    <la' la,>4 r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %7
    re4 la fad re
    la' la, la r
    re,2-.\p fad-.\mbreak

    %10
    mi-. dod-.
    re-. fad-.
    mi-. dod-.

    %13
    re-. si-.
    sol-. la-.
    << {re'4\ff re re re}\\ {re, re re re}>>

    %16
    <re' re,>4 r re8 mi fad re
    <<{la'4 la la la}\\{la, la la la}>>
    <la' la,>4 r la8 si dod la

    %19
    re4 la la8 si dod la
    re4 r la8 si dod la
    re4 la fad re

    %22
    la' la, la r
    re,2-.\p  fad-.
    mi-. dod-.

    %25
    re-. fad-.
    mi-. dod-.
    re-. si-.

    %28
    sol-. la-.
    <<{fad''8\ff fad fad fad}\\{la, la la la}>> <fad' la,> <fad la,> <fad la,> <fad la,>
    <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>

    %31
    <<
        {
            sol sol sol sol sol sol sol sol
            sol sol sol sol sol sol sol sol\mbreak
        }\\{
            si, si si si si si si si
            si si si si si si si si
        }
    >>
    <fad' la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>

    %34
    <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>
    si,32(dod re8.) re8 re si32(dod re8.) re8 re
    dod32(re mi8.) mi8 mi dod32(re mi8.) mi8 mi

    %37
    sold32 la si8. si8 si sold32 la si8. si8 si
    la4 r r dod,,\p
    re(dod) dod-. dod-.

    %40
    dod-! r r dod
    re(dod) dod-. dod-.\mbreak
    dod\parenthesize -! r r dod

    %43
    re\mf fad (mi re)
    dod(si la sold)
    la-! r r dod\p

    %46
    re(dod) dod-. dod-.
    dod-! r r dod
    re(dod) dod-. dod-.

    %49
    dod\parenthesize -! r r dod
    re\mf fad (mi re)
    dod(si la sold)

    %52
    <<{<la'' la,>8\ff  mi mi mi mi mi mi mi}\\{s dod dod dod dod dod dod dod}>>
    <<
        {
            mi mi mi mi mi mi mi mi\mbreak
            fad fad fad fad fad fad fad fad
        }\\{
            dod dod dod dod dod dod dod dod
            re re re re re re re re
        }
    >>

    %55
    <la' dod,> <la dod,> <la dod,> <la dod,> <sold si,> <sold si,> <sold si,> <sold si,>
    <<{<la la,>8  mi mi mi mi mi mi mi}\\{s dod dod dod dod dod dod dod}>>
    <<
        {
            mi mi mi mi mi mi mi mi\mbreak
            fad fad fad fad fad fad fad fad
        }\\{
            dod dod dod dod dod dod dod dod
            re re re re re re re re
        }
    >>

    %59
    <la' dod,> <la dod,> <la dod,> <la dod,> <sold si,> <sold si,> <sold si,> <sold si,>
    <la la,>4 <fad la, re,> <mi dod la> <sold si, mi,>
    <la dod, mi,>  <fad la, re,> <mi dod la> <sold si, mi,>

    %62
    <la dod, mi,> r dod,,\p(mi)
    la-! r la(si)\mbreak
    dod-! r dod8\ff la re la

    %65
    mi' la, re la mi' la, dod la
    re4 r fad,\p(la)
    re r re(mi)

    %68
    fad-! r re8 \f la mi' la,
    fad' la, mi' la, fad' la, re la
    mi'4 r la,\p(si)

    %71
    dod4-! r dod(re)
    mi(fad sol fad)
    mi\mf(re dod re)

    %74
    dod(si la sol)
    fad(mi re dod)

    %76
    << {re'4\f re re re}\\{ re, re re re}>>
    <re' re,>4 r re8 mi fad re
    <<{la'4 la la la}\\{la, la la la}>>

    %79
    <la' la,>4 r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %82
    re4 la fad re
    la' la, la r\mbreak
    re,2-.\p fad-.\mbreak

    %85
    mi-. dod-.
    re-. fad-.
    mi-. dod-.

    %88
    re-. si-.
    sol-. la-.
    <<{fad''8\ff fad fad fad}\\{la, la la la}>> <fad' la,> <fad la,> <fad la,> <fad la,>

    %91
    <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>
    <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>
    <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>

    %94
    <<{fad fad fad fad fad fad fad fad}\\{si, si si si si si si si}>>
    sol'32 fad mi8. mi8 mi\mbreak sol32 fad mi8. mi8 mi
    <mi la,> <mi la,> <mi la,> <mi la,> <mi la,> <mi la,> <mi la,> <mi la,>

    %97
    fad32 mi re8. re8 re fad32 mi re8. re8 re
    re re re re re re re re
    dod4 r r fad,-!\p

    %100
    sol(fad) fad-. fad-.
    fad r r fad-!
    sol(fad) fad-. fad-.

    %103
    fad r r  fad
    sol si\mf  (la sol)
    fad(mi re dod)\mbreak

    %106
    re r r fad-!\p
    sol(fad) fad-. fad-.
    fad -! r r fad-!

    %109
    sol(fad) fad-. fad-.
    fad r r  fad
    sol si \mf  (la sol)

    %112
    fad(mi re dod)
    <<{fad'8\ff fad fad fad}\\{la, la la la}>> <fad' la,> <fad la,> <fad la,> <fad la,>
    <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>

    %115
    <<
        {
            sol sol sol sol sol sol sol sol
            fad fad fad fad mi mi mi mi
        }\\{
            si si si si si si si si
            re re re re dod dod dod dod
        }
    >>
    <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>\mbreak

    %118
    <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,> <fad la,>
    <<
        {
            sol sol sol sol sol sol sol sol
            fad fad fad fad mi mi mi mi
        }\\{
            si si si si si si si si
            re re re re dod dod dod dod
        }
    >>

    %121
    <la' re, re,>4 <si re, re,> <fad la, re,> <mi dod la>
    <la re, re,>4 <si re, re,> <fad la, re,> <mi dod la>
    <fad la, re,> r <fad la, re,> <la la, re,>

    %124
    <fad la, re,> re, re re
    re r r2\fermopz

}

Ivlan = \relative do' {

    re4 re re re
    re r re8 mi fad re
    la'4 la la la

    %4
    la r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %7
    re4 la fad re
    la' la, la r
    re2-.\p fad-.

    %10
    mi-. dod-.\mbreak
    re-. fad-.
    mi-. dod-.

    %13
    re-. si-.
    sol-. la-.
    re4\ff re re re

    %16
    re r re8 mi fad re
    la'4 la la la

    %18
    la r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %21
    re4 la fad re
    la' la, la r
    re2-.\p fad-.

    %24
    mi-. dod-.\mbreak
    re-. fad-.
    mi-. dod-.

    %27
    re-. si-.
    sol-. la-.
    re8\ff re re re re re re re

    %30
    re re re re re re re re
    re re re re re re re re

    %32
    re re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %35
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi

    %38
    la,4 r r dod\p
    re(dod) dod-. dod-.

    %40
    dod-! r r dod
    re(dod) dod-. dod-.\mbreak
    dod\parenthesize -! r r dod

    %43
    re\mf fad (mi re)
    dod(si la sold)
    la-! r r dod\p

    %46
    re(dod) dod-. dod-.
    dod-!r r dod
    re(dod) dod-. dod-.

    %49
    dod\parenthesize -! r r dod
    re\mf fad (mi re)
    dod(si la sold)
    la8\ff la la la la la la la

    %53
    la la la la la la la la
    re re re re re re re re
    mi mi mi mi mi mi mi mi

    %56
    la la la la la la la la
    la la la la la la la la
    re, re re re re re re re

    %59
    mi mi mi mi mi mi mi mi\mbreak
    dod4-! re-! mi-! mi-!
    dod-! re-! mi-! mi-!

    %62
    la,-! r r2
    R1
    r2 la8\ff la la la

    %65
    la la la la la la la la
    la4 r r2
    R1

    %68
    r2 la8\f la la la
    la la la la la la la la
    la4 r r2

    %71
    R1
    la4\p r r2\mbreak
    R1

    %74
    la4 r r2
    la4 r r2
    re4\f re re re

    %77
    re r re8 mi fad re
    la'4 la la la
    la r la8 si dod la

    %80
    re4 la la8 si dod la
    re4 r la8 si dod la
    re4 la fad re

    %83
    la' la, la r
    re2-.\p fad-.\mbreak

    %85
    mi-. la,-.
    re-. fad-.
    mi-. la,-.

    %88
    re-. si-.
    sol-. la-.
    re8\ff re re re re re re re

    %91
    re re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %94
    red red red red red red red red
    mi mi mi mi mi mi mi mi
    dod dod dod dod dod dod dod dod

    %97
    re! re re re re re re re
    si si si si si si si si
    la4 r r fad'-!\p

    %100
    sol(fad) fad-. fad-.
    fad r r fad-!
    sol(fad) fad-. fad-.

    %103
    fad r r  fad
    sol si\mf  (la sol)
    fad(mi re dod)\mbreak

    %106
    re r r fad-!\p
    sol(fad) fad-. fad-.
    fad -! r r fad-!

    %109
    sol(fad) fad-. fad-.
    fad r r  fad
    sol si \mf  (la sol)

    %112
    fad(mi re dod)
    re8\ff re re re re re re re
    re re re re re re re re

    %115
    sol sol sol sol sol sol sol sol
    la la la la la, la la la
    re re re re re re re re

    %118
    re re re re re re re re
    sol sol sol sol\mbreak sol sol sol sol
    la la la la la, la la la

    %121
    fad'4 sol la la,
    fad' sol la la,
    re r re re

    %124
    re re re re
    re r r2

}

Ibcn = \relative do {

    re4 re re re
    re r re8 mi fad re
    la'4 la la la

    %4
    la r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %7
    re4 la fad re
    la' la, la r
    R1*6

    %15
    re4\ff re re re
    re r re8 mi fad re
    la'4 la la la

    %18
    la r la8 si dod la
    re4 la la8 si dod la
    re4 r la8 si dod la

    %21
    re4 la fad re
    la' la, la r
    R1*6

    %29
    re8\ff re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %32
    re re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %35
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi

    %38
    la,4 r r2
    R1*4
    re1\mf

    %44
    mi\p
    la,4-! r r2
    R1*4

    %50
    re1\mf
    mi\p
    la8\ff la la la la la la la

    %53
    la la la la la la la la
    re, re re re re re re re
    mi mi mi mi mi mi mi mi

    %56
    la la la la la la la la
    la la la la la la la la
    re, re re re re re re re

    %59
    mi mi mi mi mi mi mi mi\mbreak
    dod4-! re-! mi-! mi-!
    dod-! re-! mi-! mi-!

    %62
    la,-! r r2
    R1
    r2 la8\ff la la la

    %65
    la la la la la la la la
    la4 r r2
    R1

    %68
    r2 la8\f la la la
    la la la la la la la la
    la4 r r2

    %71
    R1
    la4\p r r2\mbreak
    R1

    %74
    la4 r r2
    la4 r r2
    re4\f re re re

    %77
    re r re8 mi fad re
    la'4 la la la
    la r la8 si dod la

    %80
    re4 la la8 si dod la
    re4 r la8 si dod la
    re4 la fad re

    %83
    la' la, la r\mbreak
    R1*6
    re8\ff re re re re re re re

    %91
    re re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %94
    red red red red red red red red
    mi mi mi mi mi mi mi mi
    dod dod dod dod dod dod dod dod

    %97
    re! re re re re re re re
    si si si si si si si si
    la4 r r2

    %100
    R1*4
    sol'1\mf
    la\p

    %106
    re,4 r r2
    R1*4
    sol1\mf

    %112
    la\p
    re,8\ff re re re re re re re
    re re re re re re re re

    %115
    sol sol sol sol sol sol sol sol
    la la la la la, la la la
    re re re re re re re re

    %118
    re re re re re re re re
    sol sol sol sol\mbreak sol sol sol sol
    la la la la la, la la la

    %121
    fad'4 sol la la,
    fad' sol la la,
    re r re re

    %124
    re re re re
    re r r2

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \time 4/4
    \tempo 1 = 45
    s1*125
    \bar "|."

}


IcrI = {
    \Iglobal
    <<\IcrIn \forma>>

}


IcrII = {
    \Iglobal
    <<\IcrIIn \forma>>

}


IobI = {
    \Iglobal
    <<\IobIn \forma>>

}


IobII = {
    \Iglobal
    <<\IobIIn \forma>>

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


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    re'16.\p sib32 sol8[fad]
    sol8.\prall  fad16 sol8
    sib16. do32 la16. [sib32] sol16. la32

    %4
    \slashedGrace sol8 fad8. mi?16 re8
    re'16. sib32 sol8[fad]
    sol8.\prall  fad16 sol8

    %7
    la16. do32 sib16. [re32] fad,16. la32
    sol4 r8
    sib16.(do32) sib16.[(do32)] la16.\f(do32)

    %10
    sib16.\p(do32) sib16.[(do32)] la16.\f(do32)\mbreak
    sib16.\p(do32) sib16.[(do32)] la16.\f(do32)
    sib4-! r8

    %13
    sib16.\ff (do32) la16. ([sib32)] sol16. (la32)
    fa16.(sol32) mib16.[(fa32)] re16.(mib32)
    do16.(sol'32) fa8[la,]

    %16
    sib4 r8
    sib'16.\p(do32) sib16.[(do32)] la16.\f(do32)
    sib16.\p(do32) sib16.[(do32)] la16.\f(do32)\mbreak

    %19
    sib16.\p(do32) sib16.[(do32)] la16.\f(do32)
    sib4-! r8
    sib16.\ff (do32) la16. ([sib32)] sol16. (la32)\mbreak

    %22
    fa16.(sol32) mib16.[(fa32)] re16.(mib32)
    do16.(sol'32) fa8[la,]
    <sib re,>4 r8

    %25
    re'16.\p sib32 sol8[fad]
    sol8.\prall  fad16 sol8
    sib16. do32 la16. [sib32] sol16. la32

    %28
    \slashedGrace sol8 fad8. mi?16 re8
    re'16. sib32 sol8[fad]
    sol8.  fad16 sol8

    %31
    la16. do32 sib16. [re32] fad,16. la32
    sol4 r8\mbreak
    re16.(mib32) re8 re'-!\noBeam \sf

    %34
    re8.\p(sib16) do8-!
    do,16.(re32) do8 do'-!\noBeam \sf
    do8.\p(la16) sib8

    %37
    sib,16.\p do32 sib16.[do32] si16. re32
    do16. re32 do16.[mib32] re16. fa32
    mib16. (si32) do16.[(sol32)] la16. (sol32)

    %40
    \slashedGrace sol8 fad4 r8
    re'16.(mib32) re8 re'-!\noBeam \sf
    re8.\p(sib16) do8-!

    %43
    do,16.(re32) do8-! do'-!\noBeam \sf
    do8.\p(la16) sib8-!
    sib,16.\p do32 sib16.[do32] si16. re32

    %46
    do16. re32 do16.[mib32] re16. fa32
    mib16. (si32) do16.[(sol32)] la16. (sol32)
    \slashedGrace sol8 fad4 r8

    %49
    sol'16.\p(la32) sol16.[(la32)] fad16.\f(la32)
    sol16.\p(la32) sol16.[(la32)] fad16.\f(la32)
    sol16.\p(la32) sol16.[(la32)] fad16.\f(la32)

    %52
    sol4-! r8\mbreak
    sol16.\ff la32 fa!16.[sol32] mib16. fa32
    re16. mib32 do16.[re32] sib16. do32

    %55
    la16. mib'32 re8 [fad,]
    \slashedGrace fad? sol4 r8
    sol'16.\p(la32) sol16.[(la32)] fad16.\f(la32)

    %58
    sol16.\p(la32) sol16.[(la32)] fad16.\f(la32)
    sol16.\p(la32) sol16.[(la32)] fad16.\f(la32)
    sol4-! r8

    %61
    sol16.\ff la32 fa!16.[sol32] mib16. fa32
    re16. mib32 do16.[re32] sib16. do32
    la16. mib'32 re8 [fad,]

    %64
    sib'16.^\markup\italic "Stacc[ato]]" sib32 re16. re32 fad,16. fad32
    sol16. sol32 sib16. sib32 re,16. re32
    mib16. mib32 sol16. sol32 sib,16. sib32

    %67
    do16. do32 la16. la32 re16. re32
    <sol, sol,>8 <sol sol,> <sol sol,>
    <sol sol,>4 r8\fermata

}

IIvlIIn = \relative do'' {

    re16.\p sib32 sol8[fad]
    sol8.\prall  fad16 sol8
    sib16. do32 la16. [sib32] sol16. la32

    %4
    \slashedGrace sol8 fad8. mi?16 re8
    re'16. sib32 sol8[fad]
    sol8.\prall  fad16 sol8

    %7
    la16. do32 sib16. [re32] fad,16. la32
    sol4 r8
    fa!\p fa fa\f

    %10
    fa\p fa fa\f \mbreak
    fa\p fa fa\f
    fa4-! r8

    %13
    sib16.\ff (do32) la16. ([sib32)] sol16. (la32)
    fa16.(sol32) mib16.[(fa32)] re16.(mib32)
    do16.(sol'32) fa8[la,]

    %16
    sib4 r8
    fa'\p fa fa\f
    fa\p fa fa\f

    %19
    fa\p fa fa\f
    fa4-! r8
    sib16.\ff (do32) la16. ([sib32)] sol16. (la32)\mbreak

    %22
    fa16.(sol32) mib16.[(fa32)] re16.(mib32)
    do16.(sol'32) fa8[la,]
    sib4 r8

    %25
    re'16.\p sib32 sol8[fad]
    sol8.\prall  fad16 sol8
    sib16. do32 la16. [sib32] sol16. la32

    %28
    \slashedGrace sol8 fad8. mi?16 re8
    re'16. sib32 sol8[fad]
    sol8.  fad16 sol8

    %31
    la16. do32 sib16. [re32] fad,16. la32
    sol4 r8
    sib16. do32 sib8 sib'-!\noBeam\sf

    %34
    sib8.\p(sol16) la8-!\mbreak
    la,16.\p sib32 la8 la'-!\noBeam\sf
    la8.\p(fad16) sol8

    %37
    sib,16.\p do32 sib16.[do32] si16. re32
    do16. re32 do16.[mib32] re16. fa32
    mib16. (si32) do16.[(sol32)] la16. (sol32)

    %40
    \slashedGrace sol8 fad4 r8
    sib16. do32 sib8 sib'-!\noBeam\sf
    sib8.\p(sol16) la8-!\mbreak

    %43
    la,16. sib32 la8 la'-!\noBeam\sf
    la8.\p(fad16) sol8-!
    sib,16.\p do32 sib16.[do32] si16. re32

    %46
    do16. re32 do16.[mib32] re16. fa32
    mib16. (si32) do16.[(sol32)] la16. (sol32)
    \slashedGrace sol8 fad4 r8

    %49
    re8-!\p re(mib\f)
    re8-!\p re(mib\f)
    re8-!\p re(mib\f)
    re4-! r8
    sol16.\ff la32 fa!16.[sol32] mib16. fa32
    re16. mib32 do16.[re32] sib16. do32

    %55
    la16. do32 sib8 [la]
    sol4 r8

    %58
    re'8-!\p re(mib\f)
    re8-!\p re(mib\f)
    re8-!\p re(mib\f)
    re4-! r8

    %61
    sol16.\ff (la32) fa!16.[(sol32)] mib16.(fa32)
    re16. (mib32) do16.[(re32)] sib16. (do32)
    la16. do32 sib8[la]

    %64
    sib''16. sib32 re16. re32 fad,16. fad32
    sol16. sol32 sib16. sib32 re,16. re32
    mib16. mib32 sol16. sol32 sib,16. sib32

    %67
    do16. do32 la16. la32 re16. re32
    <sol, sol,>8 <sol sol,> <sol sol,>
    <sol sol,>4 r8\fermata

}

IIvlan = \relative do' {

    r8 sib\p do
    re do re
    sol fa mib

    %4
    re la re
    r sib do
    re do re

    %7
    mib re re
    sol,4.
    re'8-!\p re(mib\f)

    %10
    re-!\p re(mib\f)
    re-!\p re(mib\f)
    re4-! r8

    %13
    sib4.\ff~
    sib\mbreak
    mib8 re do

    %16
    sib4 r8
    re8-!\p re(mib\f)
    re-!\p re(mib\f)

    %19
    re-!\p re(mib\f)
    re4-! r8
    sib4.\ff~

    %22
    sib
    mib8 re do
    sib4 r8

    %25
    r8 sib\p do
    re do re
    sol fa mib

    %28
    re la re
    r sib do
    re do re

    %31
    mib re re
    sol re sol,
    r8 r sol'\sf(

    %34
    la4.)
    r8 r la\sf \parenthesize (
    re,4.)

    %37
    r8 sol\p sol
    sol sol sol
    sol4 dod,8

    %40
    re la re
    r r sol\sf(
    la4.)

    %43
    r8 r la\sf  (
    re,4.)
    r8 sol sol

    %46
    sol sol sol
    sol4 dod,8
    re4 r8

    %49
    sib8-!\p sib(do\f)
    sib8-!\p sib(do\f)
    sib8-!\p sib(do\f)

    %52
    sib4-! r8
    sol4.\ff~
    sol

    %55
    do8 re re
    sol,4 r8
    sib8-!\p sib(do\f)

    %58
    sib8-!\p sib(do\f)
    sib8-!\p sib(do\f)
    sib4-! r8

    %61
    sol4.\ff~
    sol
    do8 re re

    %64
    sib' re fad,
    sol sib re,
    mib sol sib,

    %67
    do la re
    sol, sol sol
    sol4 r8\fermopz

}

IIbcn = \relative do {

    r8 sol'\p la
    sib la sib
    sol fa mib

    %4
    re la re,
    r sol' la
    sib la sib

    %7
    do re re,
    sol re sib
    R4.*3

    %12
    r8 sib'\f la
    sol fa mib
    re do sib

    %15
    mib fa fa,
    sib' fa re
    R4.*3\mbreak

    %20
    r8 sib'\f la
    sol fa mib
    re do sib

    %23
    mib fa fa,
    sib' fa re
    r8 sol\p la

    %26
    sib la sib
    sol fa mib
    re la re,

    %29
    r sol' la
    sib la sib
    do re re,

    %32
    sol re sol,
    r r sol'\sf(
    la4.)

    %35
    r8 r fad\sf(
    sol4.)
    r8 sol\p fa!

    %38
    mib mib si
    do4(dod8)
    re la re,

    %41
    r r sol'\sf(
    la4.)
    r8 r fad\sf(

    %44
    sol4.)
    r8 sol\p fa!
    mib mib si

    %47
    do4(dod8)
    re la re,
    R4.*3

    %52
    r8 sol'\f fa
    mib re do
    sib la sol\mbreak

    %55
    do re re
    sol re sol,
    R4.*3

    %60
    r8 sol'\f fa
    mib re do
    sib la sol\mbreak

    %63
    do re re
    sib' re fad,
    sol sib re,

    %66
    mib sol sib,
    do la re
    sol, sol sol

    %69
    sol4 r8\fermata

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \tempo 4 = 60
    \key sol\minor
    s4.*69
    \bar "|."

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII= {
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

}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IIIcrIn = %\transpose do re, {
\relative do'' {
    \key do\major

    do4 re
    do8[do do] r
    mi4 re

    %4
    mi8[mi mi] r
    R2*8
    do2~

    %14
    do~
    do~
    do

    %17
    do4 do
    do do
    re8 [re mi mi]

    %20
    re re re4
    R2*4
    do4 do

    %26
    do do\mbreak
    do sol8 sol
    do do do4

    %29
    R2*4
    do4 do
    do do

    %35
    do sol8 sol
    do do do4
    R2*15

    %52
    \key do\major
    do4 \parenthesize re
    do8[do do] r
    mi4 re

    %55
    mi8[mi mi] r
    R2*8
    do2~

    %65
    do~
    do~
    do

    %68
    do4 do
    do do
    re8 [re mi mi]

    %71
    re re re4
    R2*4
    do4 do

    %77
    do do\mbreak
    do sol8 sol
    do do do4

    %80
    R2*4
    do4 do
    do do

    %86
    do4 sol8 sol
    do4 re8 re
    mi4 re8 re

    %89
    mi4 mi8 mi\mbreak
    do4 sol8 sol
    do4 re8 re

    %92
    mi4 re8 re
    mi4 mi8 mi
    do4 sol8 sol

    %95
    do4 do8 do
    do4 do8 do
    do[do do mi]

    %98
    do4 do
    do r\fermopz

}

%}


IIIcrIIn = %\transpose do re, {
\relative do'' {
    \key do\major

    mi,4 sol
    mi8[mi mi] r
    do'4 sol

    %4
    do8[do do] r
    R2*8
    do2~

    %14
    do~
    do~
    do

    %17
    do4 do\mbreak
    do do
    sol8[sol do do]

    %20
    sol sol sol4
    R2*4
    do4 do

    %26
    do do
    do sol8 sol
    mi mi mi4

    %29
    R2*4
    do'4 do
    do do

    %35
    do sol8 sol
    mi mi mi4
    R2*15

    %52
    \key do\major
    mi4 sol
    mi8[mi mi] r
    do'4 sol

    %55
    do8[do do] r
    R2*8
    do2~

    %65
    do~
    do~
    do

    %68
    do4 do\mbreak
    do do
    sol8[sol do do]

    %71
    sol sol sol4
    R2*4
    do4 do

    %77
    do do
    do sol8 sol
    mi mi mi4

    %80
    R2*4
    do'4 do
    do do

    %86
    do sol8 sol
    mi4 sol8 sol
    do4 sol8 sol

    %89
    do4 do8 do
    do4 sol8 sol
    mi4 sol8 sol

    %92
    do4 sol8 sol\mbreak
    do4 do8 do
    do4 sol8 sol

    %95
    mi4 mi8 mi
    mi4 mi8 mi
    mi[mi mi sol]

    %98
    mi4 mi
    mi r\fermopz

}

%}

IIIobIn = \relative do'' {

    re4 \slashedGrace fad8 mi re16 dod
    re8[la fad] r
    fad'4 \slashedGrace la8 sol fad16 mi

    %4
    fad8 [re la] r
    R2*8
    re'4. dod8

    %14
    si4. la8
    re4. dod8
    si4. la8

    %17
    si[la si la]
    si[la si la]
    sol4 \slashedGrace sol8 fad mi16 fad

    %20
    mi8 mi mi4
    R2*4\mbreak
    si'4 si

    %26
    la la
    si la16 sol fad mi
    re8 re re4

    %29
    R2*4
    si'4 si
    la la

    %35
    si la16 sol fad mi
    re8 re re4
    R2*15

    %52
    re4 \slashedGrace fad8 mi re16 dod
    re8[la fad] r
    fad'4 \slashedGrace la8 sol fad16 mi

    %55
    fad8 [re la] r
    R2*8
    re'4. dod8

    %65
    si4. la8
    re4. dod8
    si4. la8

    %68
    si[la si la]
    si[la si la]
    sol4 \slashedGrace sol8 fad mi16 fad

    %71
    mi8 mi mi4
    R2*4\mbreak
    si'4 si

    %77
    la la
    si la16 sol fad mi
    re8 re re4

    %80
    R2*4
    si'4 si
    la la

    %86
    si la16 sol fad mi
    re4 mi8 mi
    fad4 mi8 mi\mbreak

    %89
    fad4 la8 la
    si4 la16 sol fad mi
    re4 mi8 mi

    %92
    fad4 mi8 mi
    fad4 la8 la
    si4 la16 sol fad mi

    %95
    re4 la'8 la
    la4 la8 la
    la8[fad fad la]

    %98
    fad4 fad
    fad r\fermopz

}

IIIobIIn = \relative do'' {

    re4 \slashedGrace la8 sol fad16 mi
    fad8[fad re] r
    re'4 \slashedGrace fad8 mi re16 dod

    %4
    re8 [la fad] r
    R2*8
    fad'4. la8

    %14
    sol4. fad8
    fad4. la8
    sol4. fad8

    %17
    sol[fad sol fad]
    sol[fad sol fad]
    mi4\slashedGrace mi8 re dod16 re\mbreak

    %20
    dod8 dod dod4
    R2*4
    re4 re

    %26
    re re
    re fad16 mi re dod
    re8 fad, fad4

    %29
    R2*4
    re'4 re
    re re

    %35
    re fad16 mi re dod
    re8 fad, fad4
    R2*15

    %52
    fad4 \slashedGrace la8 sol fad16 mi
    fad8[fad re] r
    re'4 \slashedGrace fad8 mi re16 dod

    %55
    re8 [la fad] r
    R2*8
    fad'4. la8

    %65
    sol4. fad8
    fad4. la8
    sol4. fad8

    %68
    sol[fad sol fad]
    sol[fad sol fad]
    mi4\slashedGrace mi8 re dod16 re\mbreak

    %71
    dod8 dod dod4
    R2*4
    re4 re

    %77
    re re
    re fad16 mi re dod
    re8 fad, fad4

    %80
    R2*4
    re'4 re
    re re

    %86
    re fad16 mi re dod
    re4 dod8 dod
    re4 dod8 dod

    %89
    re4 fad8 fad
    sol4 fad16 mi re dod
    re4 dod8 dod

    %92
    re4 dod8 dod
    re4 fad8 fad
    sol4 fad16 mi re dod

    %95
    re4 fad8 fad
    fad4 fad8 fad
    fad[re re fad]

    %98
    re4 re
    re r\fermopz

}

IIIvlIn = \relative do'' {

    <re re,>4 \slashedGrace fad8 mi re16 dod
    re8[la fad] r
    <fad' la,>4 \slashedGrace la8 sol fad16 mi

    %4
    fad8 [re la] r
    fad'16\pp la, fad' la, fad' la, sol' la,
    la' la, la' la, la' la, sol' la,

    %7
    fad' la, la' la, sol' la, mi' la,
    fad' la, sol' la, la'8 r
    fad16 la, fad' la, fad' la, sol' la,\mbreak

    %10
    la' la, la' la, la' la, sol' la,
    fad' la, la' la, sol' la, mi' la,
    re la dod la re8 r

    %13
    re'16\f re, re' re, re' re, dod' re,
    si' re, si' re, si' re, la' re,
    re' re, re' re, re' re, dod' re,

    %16
    si' re, si' re, si' re, la' re,
    si' re, la' re, si' re, la' re,
    si' re, la' re, si' re, la' re,

    %19
    sol8 sol \slashedGrace sol fad mi16 fad\mbreak
    <mi la,>8 <mi la,> <mi la,>4
    sol16\p fad mi re dod mi sol mi

    %22
    la sol fad mi re8 r
    sol16 fad mi re dod mi sol mi
    la sol fad mi re8 r

    %25
    si'16\f re, re' re, si' re, re' re,
    la' re, re' re, la' re, re' re,
    si' re dod si la sol fad mi

    %28
    re8 <fad la, re,> <fad la, re,>4
    sol16\p fad mi re dod mi sol mi\mbreak
    la sol fad mi re8 r

    %31
    sol16 fad mi re dod mi sol mi
    la sol fad mi re8 r
    si'16\f re, re' re, si' re, re' re,

    %34
    la' re, re' re, la' re, re' re,
    si' re dod si la sol fad mi
    re8 <fad la, re,> <fad la, re,>4

    %37 minore
    la8\p re r la
    sib re r sib
    la la r sol\mbreak

    %40
    fa la r4
    la8 re r la
    sib re r sib

    %43
    la mi fa  re
    dod la' la,4
    do'!8 la r do

    %46
    re sib r sib
    sib? sol r sib
    do la r la

    %49
    la re r la
    sib re r sib
    la[sol fa mi]\mbreak

    %52 maggiore
    re4\f \slashedGrace fad8 mi re16 dod
    re8 [la fad] r
    <fad' la,>4 \slashedGrace la8 sol fad16 mi

    %55
    fad8 [re la] r
    fad'16\pp la, fad' la, fad' la, sol' la,
    la' la, la' la, la' la, sol' la,

    %58
    fad' la, la' la, sol' la, mi' la,
    fad' la, sol' la, la'8 r
    fad16 la, fad' la, fad' la, sol' la,\mbreak

    %61
    la' la, la' la, la' la, sol' la,
    fad' la, la' la, sol' la, mi' la,
    re la dod la re8 r

    %64
    re'16\f re, re' re, re' re, dod' re,
    si' re, si' re, si' re, la' re,
    re' re, re' re, re' re, dod' re,

    %67
    si' re, si' re, si' re, la' re,
    si' re, la' re, si' re, la' re,
    si' re, la' re, si' re, la' re,

    %70
    sol8 sol \slashedGrace sol fad mi16 fad\mbreak
    <mi la,>8 <mi la,> <mi la,>4
    sol16\p fad mi re dod mi sol mi

    %73
    la sol fad mi re8 r
    sol16 fad mi re dod mi sol mi
    la sol fad mi re8 r

    %76
    si'16\f re, re' re, si' re, re' re,
    la' re, re' re, la' re, re' re,
    si' re dod si la sol fad mi

    %79
    re8 <fad la, re,> <fad la, re,>4
    sol16\p fad mi re dod mi sol mi\mbreak
    la sol fad mi re8 r

    %82
    sol16 fad mi re dod mi sol mi
    la sol fad mi re8 r
    si'16\f re, re' re, si' re, re' re,

    %85
    la' re, re' re, la' re, re' re,
    si' re dod si la sol fad mi
    re4 \stemDown dod'16 \stemUp la, \stemDown dod'16 \stemUp la,

    %88
    \stemNeutral re'4 \stemDown dod16 \stemUp la, \stemDown dod'16 \stemUp la,
    \stemNeutral re'4 la16 si dod re\mbreak
    si re dod si la sol fad mi

    %91
    re4 \stemDown dod'16 \stemUp la, \stemDown dod'16 \stemUp la,
    \stemNeutral re'4 \stemDown dod16 \stemUp la, \stemDown dod'16 \stemUp la,
    \stemNeutral re'4 la16 si dod re

    %94
    si re dod si la sol fad mi
    re8[r16 la'] re la re la
    re8[r16 la] re la re la

    %97
    re8\noBeam <fad, la, re,> [<fad la, re,> <la la, re,>]
    <fad la, re,>4 <fad la, re,>
    <fad la, re,> r\fermata

}

IIIvlIIn = \relative do'' {

    <fad, la,>4 \slashedGrace la8 sol fad16 mi
    fad8 [fad re] r
    <re' re,>4 \slashedGrace fad8 mi re16 dod

    %4
    re8 [la fad] r
    re-!\pp [re-! re-! mi-!]
    fad-![fad-! fad-! mi-!]

    %7
    re-![fad-! mi-! dod-!]
    re-![mi-! fad-!] r
    re[re re mi]

    %10
    fad[fad fad mi]
    re[fad mi dod]\mbreak
    re[la re] r

    %13
    fad'16\f re fad re fad re la' re,
    sol re sol re sol re fad re
    fad re fad re fad re la' re,

    %16
    sol re sol re sol re fad re
    sol re fad re sol re fad re
    sol re fad re sol re fad re

    %19
    mi8 mi \slashedGrace mi re dod16 re
    dod8 dod dod4\mbreak
    <mi, la,>8\p[ <mi la,> <mi la,> <mi la,>]

    %22
    <fad la,>[ <fad la,> <fad la,> <fad la,>]
    <mi la,>[ <mi la,> <mi la,> <mi la,>]
    <fad la,>[ <fad la,> <fad la,> <fad la,>]

    %25
    sol'16\f re si' re, sol re si' re,
    re re re re re re re re
    sol si la sol fad mi re dod

    %28
    re8 <fad la, re,> <fad la, re,>4
    <mi, la,>8\p[ <mi la,> <mi la,> <mi la,>]
    <fad la,>[ <fad la,> <fad la,> <fad la,>]

    %31
    <mi la,>[ <mi la,> <mi la,> <mi la,>]
    <fad la,>[ <fad la,> <fad la,> <fad la,>]
    sol'16\f re si' re, sol re si' re,

    %34
    re re re re re re re re
    sol si la sol fad mi re dod
    re8 <fad la, re,> <fad la, re,>4

    %37
    r8 la,-!\p[sol-! fa-!]
    r si-![la-! sol-!]
    r mi[re dod]

    %40
    r fa[sol la]
    r la[sol fa]
    r sib[la sol]

    %43
    r dod,[re sib]
    la4 r
    r8 do'![sib la]\mbreak

    %46
    r re[do sib]
    r sib?[la sol]
    r do[sib la]

    %49
    r la[sol fa]
    r sib[la sol]
    la4 la,

    %52
    fad'4\f \slashedGrace la8 sol fad16 mi
    fad8 [fad re] r
    <re' re,>4 \slashedGrace fad8 mi re16 dod

    %55
    re8 [la fad] r
    re-!\pp [re-! re-! mi-!]
    fad-![fad-! fad-! mi-!]

    %58
    re-![fad-! mi-! dod-!]
    re-![mi-! fad-!] r
    re[re re mi]

    %61
    fad[fad fad mi]
    re[fad mi dod]\mbreak
    re[la re] r

    %64
    fad'16\f re fad re fad re la' re,
    sol re sol re sol re fad re
    fad re fad re fad re la' re,

    %67
    sol re sol re sol re fad re
    sol re fad re sol re fad re
    sol re fad re sol re fad re

    %70
    mi8 mi \slashedGrace mi re dod16 re
    dod8 dod dod4\mbreak
    <mi, la,>8\p[ <mi la,> <mi la,> <mi la,>]

    %73
    <fad la,>[ <fad la,> <fad la,> <fad la,>]
    <mi la,>[ <mi la,> <mi la,> <mi la,>]
    <fad la,>[ <fad la,> <fad la,> <fad la,>]

    %76
    sol'16\f re si' re, sol re si' re,
    re re re re re re re re
    sol si la sol fad mi re dod

    %79
    re8 <fad la, re,> <fad la, re,>4
    <mi, la,>8\p[ <mi la,> <mi la,> <mi la,>]
    <fad la,>[ <fad la,> <fad la,> <fad la,>]

    %82
    <mi la,>[ <mi la,> <mi la,> <mi la,>]
    <fad la,>[ <fad la,> <fad la,> <fad la,>]
    sol'16\f re si' re, sol re si' re,

    %85
    re re re re re re re re
    sol si la sol fad mi re dod
    re4 <<
        {
            mi16 mi mi mi

            %88
            fad4 mi16 mi mi mi
            fad4
        }\\{
            dod16 dod dod dod
            re4 dod16 dod dod dod
            re4
        }
    >> fad16 sol la fad
    sol si la sol fad mi re dod

    %91
    re4 <<
        {
            mi16 mi mi mi
            fad4 mi16 mi mi mi
            fad4
        }\\{
            dod16 dod dod dod
            re4 dod16 dod dod dod
            re4
        }
    >> fad16 sol la fad

    %94
    sol si la sol fad mi re dod
    re8[r16 fad] la fad la fad
    la8[r16 fad] la fad la fad

    %97
    la8\noBeam <fad la, re,> [<fad la, re,> <la la, re,>]
    <fad la, re,>4 <fad la, re,>
    <fad la, re,> r\fermopz

}

IIIvlan = \relative do' {

    re4 la
    re8[re re] r
    re'4 la

    %4
    re,8[re re] r
    re\p[re re mi]
    fad[fad fad mi]

    %7
    re[fad mi dod]
    re[mi fad] r
    re[re re mi]

    %10
    fad[fad fad mi]
    re[fad mi dod]
    re[la re] r

    %13
    re\f[re re re]
    re[re re re]
    re[re re re]

    %16
    re[re re re]
    re[re re re]
    re[re re re]

    %19
    la[la re re]
    la' la, la4
    dod8\p[dod dod dod]

    %22
    re[re re re]
    dod[dod dod dod]
    re[re re re]

    %25
    sol\f[sol sol sol]
    fad[fad fad fad]
    sol[sol la la]

    %28
    re, re re4
    dod8\p[dod dod dod]
    re[re re re]\mbreak

    %31
    dod[dod dod dod]
    re[re re re]
    sol\f[sol sol sol]

    %34
    fad[fad fad fad]
    sol[sol la la]
    re, re re4

    %37
    r8 fa-!\p[mi-! re-!]
    r sol-![fa-! sol-!]
    r dod,[si! la]

    %40
    r re[mi fa]
    r fa[mi re]
    r sol[fa mi]

    %43
    r dod[re sib]
    la4 r\mbreak
    r8 la'[sol fa]

    %46
    r sib[la sol]
    r sol[fa mi]
    r la[sol fa]

    %49
    r fa[mi re]
    r sol [fa mi]
    la4 la,

    %52
    re4 la
    re8[re re] r
    re'4 la

    %55
    re,8[re re] r
    re\pp[re re mi]
    fad[fad fad mi]

    %58
    re[fad mi dod]
    re[mi fad] r
    re[re re mi]

    %61
    fad[fad fad mi]
    re[fad mi dod]
    re[la re] r

    %64
    re\f[re re re]
    re[re re re]
    re[re re re]

    %67
    re[re re re]
    re[re re re]
    re[re re re]

    %70
    la[la re re]
    la' la, la4
    dod8\p[dod dod dod]

    %73
    re[re re re]
    dod[dod dod dod]
    re[re re re]

    %76
    sol\f[sol sol sol]
    fad[fad fad fad]
    sol[sol la la]

    %79
    re, re re4
    dod8\p[dod dod dod]
    re[re re re]\mbreak

    %82
    dod[dod dod dod]
    re[re re re]
    sol\f[sol sol sol]

    %85
    fad[fad fad fad]
    sol[sol la la]
    re,4 la'8 la,

    %88
    re4 la'8 la,
    re4 re8 re\mbreak
    sol[sol la la]

    %91
    re,4 la'8 la,
    re4 la'8 la,
    re4 re8 re

    %94
    sol[sol la la]
    re,[re re re]
    re[re re re]

    %97
    re[re re re]
    re4 re
    re r\fermopz

}

IIIbcn = \relative do {

    re4 la
    re8[re re] r
    re'4 la

    %4
    re,8[re re] r
    R2*8
    re8\f[re re re]

    %14
    re[re re re]
    re[re re re]

    %16
    re[re re re]
    re[re re re]
    re[re re re]

    %19
    la[la re re]
    la' la, la4
    R2*4

    %25
    sol'8\f[sol sol sol]
    fad[fad fad fad]
    sol[sol la la]

    %28
    re, re re4
    R2*4
    sol8\f[sol sol sol]

    %34
    fad[fad fad fad]
    sol[sol la la]
    re, re re4

    %37
    R2*15
    re4 la
    re8[re re] r

    %54
    re'4 la
    re,8[re re] r
    R2*8

    %64
    re8\f[re re re]
    re[re re re]
    re[re re re]

    %67
    re[re re re]
    re[re re re]
    re[re re re]

    %70
    la[la re re]
    la' la, la4
    R2*4

    %76
    sol'8\f[sol sol sol]
    fad[fad fad fad]
    sol[sol la la]

    %79
    re, re re4
    R2*4
    sol8\f[sol sol sol]

    %85
    fad[fad fad fad]
    sol[sol la la]
    re,4 la'8 la,

    %88
    re4 la'8 la,
    re4 re8 re
    sol[sol la la]

    %91
    re,4 la'8 la,
    re4 la'8 la,
    re4 re8 re

    %94
    sol[sol la la]
    re,8 [re re re]
    re[re re re]\mbreak

    %97
    re[re re re]
    re4 re
    re r\fermopz

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \time 2/4
    \tempo 2 = 60
    s2*36\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1.0)
    \mark\markup "[Minore]"
    \key do\major
    s2*15\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1.0)
    \mark\markup "[Maggiore]"
    \key re\major
    s2*48
    \bar "|."

}


IIIcrI = {
    \IIIglobal
    <<\IIIcrIn \forma>>

}


IIIcrII = {
    \IIIglobal
    <<\IIIcrIIn \forma>>

}


IIIobI = {
    \IIIglobal
    <<\IIIobIn \forma>>

}


IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

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
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \header {
        subtitle = \markup \larger\center-column{"Sinfonia in Re maggiore da ”L'incognita perseguitata”"}
        composer = \markup \center-column{"P. Anfossi (1727-1797)"}
    }

    \markup\huge "[1.] Allegro con molto spirito"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff

            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr1"
                    \IcrI
                >>

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni in D"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \IcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Oboi"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
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


\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[2.] Allegretto"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \markup\huge "[3.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff

            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr1"
                    \IIIcrI
                >>

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni in D"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \IIIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Oboi"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IIIobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IIIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"[Violone e""Fagotto]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
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
