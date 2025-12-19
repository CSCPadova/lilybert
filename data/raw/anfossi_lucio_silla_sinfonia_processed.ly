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

    do2. mi4
    sol2. mi4
    do sol do mi

    %4
    do r r2
    R1*2
    mi4 mi do do

    %8
    mi mi re re
    do2. mi4
    sol2. mi4

    %11
    do sol do mi
    do r r2
    R1*2

    %15
    mi4 mi do do
    mi mi re re
    do1~

    %18
    do4 do do do
    do1~
    do4 do do do

    %21
    do1~
    do4 do do do
    R1*4

    %27
    sol'2. re4\mbreak
    sol, sol sol sol
    re' re re re

    %30
    re re re r
    R1*12
    re2 re4 re

    %44
    mi mi mi mi
    re2 re4 re
    re r r2

    %47
    R1*2
    r4 re-!\soli re-! re-!
    re4. (mi8) fa4-! fa-!\mbreak

    %51
    r mi-! mi-! mi-!
    mi4. fa8 sol4-! mi-!
    re r r2

    %54
    R1
    r4 re-!\soli re-! re-!
    re4. mi8 fa4-! fa-!\mbreak

    %57
    r mi-! mi-! mi-!
    mi4. fa8 sol4-! mi-!
    re r r2

    %60
    R1*3\mbreak
    do2. mi4
    sol2. mi4

    %65
    do sol do mi
    do r r2
    R1*2

    %69
    mi4 mi do do
    mi mi re re
    do1~

    %72
    do4 do do do
    do r r2
    r4 mi mi mi\mbreak

    %75
    re r r2
    r4 re re re
    mi r r2

    %78
    R1
    do2. sol'4
    mi sol mi do

    %81
    re re mi mi
    re re re r
    R1*12

    %95
    mi2 mi4 mi
    do do do do\mbreak
    mi2 re4 re

    %98
    do2 mi4 mi
    do do do do
    mi2 re4 re

    %101
    do r r2
    R1*3
    do1\p~

    %106
    do~
    do~\mf
    do~

    %109
    do8\ff mi sol mi do mi sol mi\mbreak
    do mi sol mi do mi sol mi
    do4 sol do sol

    %112
    do r do r
    do r r2\fermata

}
%}


IcrIIn = %\transpose do re, {
\relative do'' {
    \key do\major

    do2. mi4
    sol2. mi4
    do sol do mi

    %4
    do r r2
    R1*2
    do4 do do, do

    %8
    do' do sol sol
    do2. mi4
    sol2. mi4

    %11
    do sol do mi
    do r r2
    R1*2

    %15
    do4 do do, do
    do' do sol sol
    do,1~

    %18
    do4 do do do
    do1 ~
    do4 do do do

    %21
    do1 ~
    do4 do do do
    R1*4

    %27
    sol''2. re4\mbreak
    sol, sol sol sol
    re' re re re

    %30
    re re re r
    R1*12
    sol,2 sol4 sol

    %44
    do do do do\mbreak
    re2 re4 re
    sol, r r2

    %47
    R1*2
    r4 sol-!\soli sol-! sol-!
    sol4.(do8) re4-! re-!

    %51
    r do-! do-! do-!
    do4.(re8) mi4-! do-!
    sol r r2

    %54
    R1
    r4 sol-!\soli sol-! sol-!
    sol4.(do8) re4-! re-!

    %57
    r do-! do-! do-!
    do4.(re8) mi4-! do-!
    sol r r2

    %60
    R1*3
    do2. mi4
    sol2. mi4

    %65
    do sol do mi
    do r r2
    R1*2

    %69
    do4 do do, do
    do' do sol sol
    do,1~

    %72
    do4 do do do
    do r r2\mbreak
    r4 mi' mi mi

    %75
    re r r2
    r4 sol, sol sol
    do r r2

    %78
    R1
    do2. sol'4
    mi sol mi do

    %81
    sol sol do do
    sol sol sol r
    R1*12

    %95
    do2 do4 do
    do, do do do
    do'2 sol4 sol

    %98
    mi2 do'4 do
    do, do do do\mbreak
    do'2 sol4 sol

    %101
    mi4 r r2
    R1*3
    do1\p~

    %106
    do~
    do~\mf
    do~

    %109
    do8\ff mi sol mi do mi sol mi\mbreak
    do mi sol mi do mi sol mi
    do4 sol' do, sol'

    %112
    do, r mi r
    mi r r2\fermata

}

%}

IobIn = \relative do'' {

    re2. fad4
    la2. fad4
    re la re fad

    %4
    re r r2
    R1*2
    la'2 si

    %8
    fad mi
    re2. fad4
    la2. fad4

    %11
    re la re fad\mbreak
    re4 r r2
    R1*2

    %15
    la'2 si
    fad mi
    fad1~

    %18
    fad4 fad fad fad
    sol1~
    sol4 sol sol sol

    %21
    fad1~
    fad4 fad fad fad
    R1*4

    %27
    la2. mi4\mbreak
    dod mi dod la
    mi' sold la la

    %30
    sold mi mi r
    R1*6
    mi1\p~

    %38
    mi~
    mi~
    mi~

    %41
    mi4 r r2
    R1
    la4-!\f la16(sold la si) la4 mi

    %44
    fad la la la\mbreak
    la2 sold
    la4 r r2

    %47
    R1*2
    r4 mi-!\soli mi-! mi-!
    mi4. (fad8) sol!4-! sol-!

    %51
    r fad-! fad-! fad-!
    fad4. sol8 la4-! fad-!
    mi r r2

    %54
    R1
    r4 mi-! \soli mi-! mi-!
    mi4. fad8 sol4-! sol-!\mbreak

    %57
    r fad-! fad-! fad-!
    fad4. sol8 la4-! fad-!
    mi r r2

    %60
    R1*3
    re2. fad4
    la2. fad4

    %65
    re la re fad
    re r r2
    R1*2

    %69
    la'2 si
    fad mi
    fad1~\mbreak

    %72
    fad4 fad fad fad
    fad r r2
    r4 fad fad la

    %75
    sol r r2
    r4 mi mi sol
    fad r r2

    %78
    R1
    re2. la'4
    fad la fad re

    %81
    mi mi fad fad\mbreak
    mi mi mi r
    R1*6

    %89
    la1\p~
    la~
    la~

    %92
    la~
    la4 r r2
    R1

    %95
    fad2\f fad4 fad
    sol si si si
    fad2 mi

    %98
    fad fad4 fad\mbreak
    sol si si si
    fad2 mi

    %101
    re4 r r2
    R1
    re~\p

    %104
    re~\mf
    re~
    re~

    %107
    re4 r r \slashedGrace mi8 re dod16 re
    mi4\slashedGrace sol8 fad mi16 fad sol4 \slashedGrace fad8 mi re16 mi\mbreak
    fad1\ff ~

    %110
    fad~
    fad4 la, re la
    re r fad r

    %113
    fad r r2\fermata

}

IobIIn = \relative do'' {

    re2. fad4
    la2. fad4
    re la re fad

    %4
    re r r2
    R1*2
    fad2 re~

    %8
    re dod
    re2. fad4
    la2. fad4

    %11
    re la re fad\mbreak
    re4 r r2
    R1*2

    %15
    fad2 re~
    re dod
    la1~

    %18
    la4 la la la
    si1~
    si4 si si si

    %21
    la1~
    la4 la la la
    R1*4

    %27
    la'2. mi4\mbreak
    dod mi dod la
    sold si dod dod

    %30
    si sold sold r
    R1*6
    mi1\p~

    %38
    mi~
    mi~
    mi~

    %41
    mi4 r r2
    R1
    dod'1\f\mbreak

    %44
    re4 fad2 fad4
    dod2 si
    la4 r r2

    %47
    R1*2
    r4 dod-!\soli dod-! dod-!
    dod4. (re8) mi4-! mi-!

    %51
    r re-! re-! re-!
    re4. mi8 fad4-! re-!
    dod r r2

    %54
    R1\mbreak
    r4 dod-!\soli dod-! dod-!
    dod4. re8 mi4-! mi-!

    %57
    r re-! re-! re-!
    re4. mi8 fad4-! re-!
    dod r r2

    %60
    R1*3
    re2. fad4
    la2. fad4

    %65
    re la re fad
    re r r2\mbreak
    R1*2

    %69
    fad2 re~
    re dod
    la1~

    %72
    la4 la la la
    la4 r r2
    r4 si si si

    %75
    si4 r r2
    r4 la la la
    la4 r r2

    %78
    R1
    re2. la'4\mbreak
    fad la fad re

    %81
    dod dod re re
    dod dod dod r
    R1*6


    %89
    la1\p~
    la~
    la~

    %92
    la~
    la4 r r2
    R1

    %95
    la2\f  la4 la
    si re re re\mbreak
    re2 dod

    %98
    la la4 la
    si re re re
    re2 dod

    %101
    re4 r r2
    R1
    re~\p~

    %104
    re~\mf
    re~
    re~

    %107
    re4 r r \slashedGrace sol,8 fad mi16 fad
    sol4 \slashedGrace  si8 la sol16 la si4 \slashedGrace re8 dod si16 dod
    re1\ff~

    %110
    re~
    re4 la re la
    re r re r

    %113
    re r r2\fermata

}

IvlIn = \relative do'' {

    \repeat unfold 12 {re16} fad fad fad fad
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad

    %4
    re4 r8 re-! mi-! re-! mi-! fad-!
    sol-! fad-! mi-! fad-! sol-! fad-! sol-! la-!
    si-! la-! sol-! la-! si-! la-! si-! dod-!\mbreak

    %7
    \stemUp <re fad, re,>4 <re fad, re,> <si re, re,> <si re, re,>
    <fad la, re,> <fad la, re,> << mi\\\stemUp dod\\ \stemDown la>> << mi'\\\stemUp dod\\ \stemDown la>>
    \stemNeutral \repeat unfold 12 {re16} fad fad fad fad

    %10
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad
    re4 r8 re-! mi-! re-! mi-! fad-!

    %13
    sol-! fad-! mi-! fad-! sol-! fad-! sol-! la-!
    si-! la-! sol-! la-! si-! la-! si-! dod-!\mbreak
    \stemUp <re fad, re,>4 <re fad, re,> <si re, re,> <si re, re,>

    %16
    <fad la, re,> <fad la, re,> << mi\\\stemUp dod\\ \stemDown la>> << mi'\\\stemUp dod\\ \stemDown la>>
    \stemNeutral re'2. dod8(re)
    re,8(fad) fad(la) la4-! re-!

    %19
    re2. dod8(re)
    re,8(sol) sol(si) si4-! re-!
    re2. dod8(re)

    %22
    re,8(fad) fad(la) la4-! re-!  %%% fine terzo sistema
    re-! \slashedGrace  re8 dod8 si16 dod si4-! \slashedGrace  si8 la sold16 la
    sold4-! \slashedGrace  sold8 fad mi16 fad mi4-! \slashedGrace  mi8 re dod16 re

    %25
    dod4 r8 la-! si-! dod-! re-! mi-!
    fad-! mi-! re-! dod-! re-! mi-! fad-! sold-!
    \repeat unfold 12 {la16} mi mi mi mi

    %28
    dod dod dod dod mi mi mi mi dod dod dod dod la la la la
    << <mi' si>4\\sold,>> <sold' si, mi,> <la dod, mi,> <la dod, mi,>\mbreak
    <sold si, mi,> <<<mi si>\\sold,>> <<<mi' si>\\sold,>> r

    %31
    r2 la'4\p-! si-!
    dod4. re16(si) la4-! si-!
    dod-! r la-! si-!

    %34
    dod4. re16(si) la4-! si-!
    dod-! r  dod,-! \p re-!
    mi4. fad16(re) dod4-! si-!

    %37
    la-! r la'-! si-!\mbreak
    dod4. re16(si) la4-! si-!
    dod-! r la-! si-!

    %40
    dod4. re16(si) la4-! si-!
    dod-! r  dod,-!\p re-!
    mi4. fad16(re) dod4-! si-!

    %43
    <<la'\f\\la,>> \slashedGrace  si'8 la16(sold la si) la4  << mi\\\stemUp dod\\ \stemDown la>>
    \stemUp <fad' la, re,> <la la, re,> <re fad, re,>4 <re fad, re,>\stemNeutral
    mi,16 dod' mi, dod' mi,16 dod' mi, dod' mi,16 si' mi, si'  mi,16 si' mi, si'

    %46
    <<la4\f\\la,>> \slashedGrace  si'8 la16(sold la si ) la4  << mi\\\stemUp dod\\ \stemDown la>>
    \stemUp <fad' la, re,> <la la, re,> <re fad, re,>4 <re fad, re,>\stemNeutral
    mi,16 dod' mi, dod' mi,16 dod' mi, dod' mi,16 si' mi, si'  mi,16 si' mi, si'

    %49
    la4 r r2\mbreak
    la,,4\p la la la
    la r r2

    %52
    la4 la la la
    la4 \slashedGrace  re''8 dod\f si16 dod re8 la fad re
    <la' la,>4 \slashedGrace re8 dod si16 dod re8 la fad re

    %55
    \once\stemUp <la' la,>4 r r2
    la,,4\p la la la
    la r r2

    %58
    la4 la la la\mbreak
    la8\noBeam-! la''\sfz la,(dod) re-! dod-! re-! si-!
    r8 la'\sfz dod,(mi) fad-! mi-! fad-! re-!

    %61
    mi-.(fad-. sol-. la-.)  si-.(la-. sol-. fad-.)
    mi-.(re-. dod-. si-.) la-.(sol-. fad-. mi-.)
    re'16\f \repeat unfold 11 {re} fad fad fad fad

    %64
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad\mbreak
    re4 r8 re-! mi-! re-! mi-! fad-!

    %67
    sol-! fad-! mi-! fad-! sol-! fad-! sol-! la-!
    si-! la-! sol-! la-! si-! la-! si-! dod-!\mbreak
    \stemUp <re fad, re,>4 <re fad, re,> <si re, re,> <si re, re,>

    %70
    <fad la, re,> <fad la, re,> << mi\\\stemUp dod\\ \stemDown la>> << mi'\\\stemUp dod\\ \stemDown la>>
    \stemNeutral re'2. dod8(re)
    re,8(fad) fad(la) la4-! re-!

    %73
    do4 la r8 la la do\mbreak  %% fine pagina
    si4-! si2 \slashedGrace si8 la sol16 la
    sol4 mi r8 sol sol si

    %76
    la4-! la2 \slashedGrace la8 sol fad16 sol
    fad4 r8 re-! mi-! fad-! sol-!  la-!
    si-! la-! sol-! fad-! sol-! la-! si-! dod-!

    %79
    \repeat unfold 12 {re16} la la la la
    fad fad fad fad la la la la fad fad fad fad re re re re
    <la' la,>4 <<mi\\\stemUp dod\\\stemDown la>> <fad' la, re,> <fad la, re,>\mbreak

    %82
    <<mi\\\stemUp dod\\\stemDown la>> \stemUp <la' dod, mi,> <la dod, mi,> r\stemNeutral
    r2 re,4-!\p mi-!
    fad4. sol16(mi) re4-! mi-!

    %85
    fad-! r  re-! mi-!
    fad4.-! sol16(mi) re4-! mi-!
    fad4 r fad-!\p sol-!

    %88
    la4. si16(sol) fad4-! mi-!
    re-! r re-! mi-!
    fad4.-! sol16(mi) re4-! mi-!\mbreak

    %91
    fad-! r  re-! mi-!
    fad4.-! sol16(mi) re4-! mi-!
    fad-! r fad-!\p sol-!

    %94
    la4. si16(sol) fad4-! mi-!
    <fad la, re,>4\f re'16(dod re dod) re4 <la re, re,>
    <si re, re,><re re, re,> <si re, re,><re re, re,>

    %97
    fad,16 re' fad, re' fad, re' fad, re' mi, dod' mi, dod' mi, dod' mi, dod'\mbreak
    re4 re16(dod re dod) re4 <la re, re,>
    <si re, re,><re re, re,> <si re, re,><re re, re,>

    %100
    fad,16 re' fad, re' fad, re' fad, re' mi, dod' mi, dod' mi, dod' mi, dod'\mbreak
    re4 r r \slashedGrace sol,,8 fad\pp mi16 fad
    mi4 r r \slashedGrace la8 sol fad16 sol

    %103
    fad4 r r  \slashedGrace sol8 fad mi16 fad\mbreak
    sol4 \slashedGrace si8 la sol16 la si4 \slashedGrace re8 dod si16 dod
    re4 r r\slashedGrace sol8 fad\mf mi16 fad

    %106
    mi4 -! r r \slashedGrace la8 sol fad16 sol
    fad4-! r r \slashedGrace sol8 fad mi16 fad
    sol4 \slashedGrace  si8 la sol16 la si4 \slashedGrace re8 dod si16 dod

    %109
    fad,16\ff re' fad, re'  fad, re' fad, re' fad, re' fad, re' fad, re' fad, re' \mbreak
    fad, re' fad, re' fad, re' fad, re' fad, re' fad, re' fad, re' fad, re'
    re re re re la la la la re re re re la la la la

    %112
    \stemUp <re fad, re,>4 r <re fad, re,> r
    <re fad, re,> r r2\fermata

}

IvlIIn = \relative do'' {

    \repeat unfold 12 {re16} fad fad fad fad
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad

    %4
    re4 r r2
    r4 r8 re,-! mi-! re-! mi-! fad-!
    sol-! fad-! mi-! fad-! sol-! fad-! sol-! la-!\mbreak

    %7
    re,4 <fad' la, re,> <sol si, re,> <sol si, re,>
    <fad la, re,> <fad la, re,> << mi\\\stemUp dod\\ \stemDown la>> << mi'\\\stemUp dod\\ \stemDown la>>
    \stemNeutral \repeat unfold 12 {re16} fad fad fad fad

    %10
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad
    re4 r r2

    %13
    r4 r8 re,-! mi-! re-! mi-! fad-!
    sol-! fad-! mi-! fad-! sol-! fad-! sol-! la-!\mbreak
    re,4 <fad' la, re,> \stemUp <sol si, re,> <sol si, re,>

    %16
    <fad la, re,> <fad la, re,> << mi\\\stemUp dod\\ \stemDown la>> << mi'\\\stemUp dod\\ \stemDown la>>\stemNeutral
    la16 fad' la, fad' la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'
    la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'

    %19
    si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol'
    si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol'
    la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'

    %22
    la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'
    re4-!\slashedGrace re8 dod8 si16 dod si4-! \slashedGrace  si8 la sold16 la
    sold4-! \slashedGrace  sold8 fad mi16 fad mi4-! \slashedGrace  mi8 re dod16 re

    %25
    dod4 r8 la'-! si-! dod-! re-! mi-!
    fad-! mi-! re-! dod-! re-! mi-! fad-! sold-!
    \repeat unfold 12 {la16} mi mi mi mi

    %28
    dod dod dod dod mi mi mi mi dod dod dod dod la la la la
    << <mi' si>4\\sold,>> <sold' si, mi,> <la dod, mi,> <la dod, mi,>\mbreak
    <sold si, mi,> <<<mi si>\\sold,>> <<<mi' si>\\sold,>> r

    %31
    la,8-!\p mi'-! la,-! mi'-! dod-! mi-! sold,-! mi'-.
    la,-! mi'-! si-! mi-! dod-! mi-! sold,-! mi'-!
    la, mi' la, mi' dod mi sold, mi'

    %34
    la, mi' si mi dod mi sold, mi'
    la,4 r mi'-!\p re-!
    dod4.-! si8 la4 sold

    %37
    la8-!\mf mi'-! la,-! mi'-! dod-! mi-! sold,-! mi'-!\mbreak
    la, mi' si mi dod mi sold, mi'
    la, mi' la, mi' dod mi sold, mi'

    %40
    la, mi' si mi dod mi sold, mi'
    la,4 r mi'-!\p re-!
    dod4.-! si8 la4 sold

    %43
    <<{mi''16\f \repeat unfold 15{mi}}\\{ \repeat unfold 16{dod}}>>
    <<{\repeat unfold 16{fad}}\\{ la, \repeat unfold 15{la}}>>
    <<{la' la la la la la la la sold sold sold sold sold sold sold sold}\\{dod, dod dod dod dod dod dod dod si si si si si si si si}>>\mbreak

    %46
    <la' la,> <mi dod> <mi dod> <mi dod> <<{\repeat unfold 12 {mi}}\\{\repeat unfold 12 {dod}}>>
    <<{\repeat unfold 16 {fad}}\\{la, \repeat unfold 15 {la}}>>
    <<
        {la' la la la la la la la sold sold sold sold sold sold sold sold}\\{
            dod, dod dod dod dod dod dod dod si si si si si si si si
        }
    >>

    %49
    \once\stemUp <la' la,>4 r r2
    la,,4\p la la la
    la r r2

    %52
    la4 la la la
    la4 la'16\f la' la, la' la, la' la, la'  la, la' la, la'\mbreak
    la, la' la, la'  la, la' la, la'  la, la' la, la'  la, la' la, la'

    %55
    \once\stemUp <la la,>4 r r2
    la,,4\p la la la
    la r r2

    %58
    la4 la la la
    la4 r r2
    r8 la''\sfz la,(dod) re-! dod-! re-! si-!

    %61
    dod-.(re-. mi-. fad-.) sol!-.(fad-. mi-. re-.)
    dod-.(si-. la-. sol-.) fad-.(mi-. re-. dod-.)
    re'16\f \repeat unfold 11 {re} fad fad fad fad

    %64
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad\mbreak
    re4 r r2

    %67
    r4 r8 re,-! mi-! re-! mi-! fad-!
    sol-! fad-! mi-! fad-! sol-! fad-! sol-! la-!\mbreak
    re,4 <fad' la, re,> \stemUp <sol si, re,> <sol si, re,>

    %70
    <fad la, re,> <fad la, re,> << mi\\\stemUp dod\\ \stemDown la>> << mi'\\\stemUp dod\\ \stemDown la>>\stemNeutral
    la16 fad' la, fad' la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'
    la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'

    %73
    la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'
    si, fad' si, fad' si, fad' si, fad' si, fad' si, fad' si, fad' si, fad'
    si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol'

    %76
    la, mi' la, mi' la, mi' la, mi' la, mi' la, mi' la, mi' la, mi'
    <<fad4\\la,>> r8 re-! mi-! fad-! sol-! la-!
    si-! la-! sol-! fad-! sol-! la-! si-! dod-!\mbreak

    %79
    \repeat unfold 12 {re16} la la la la
    fad fad fad fad la la la la fad fad fad fad re re re re
    <la' la,>4 <<mi\\\stemUp dod\\\stemDown la>> <fad' la, re,> <fad la, re,>\mbreak

    %82
    <<mi\\\stemUp dod\\\stemDown la>> \stemUp <la' dod, mi,> <la dod, mi,> r\stemNeutral
    re,,8\p-! la'-! re,-! la'-! fad-! la-! dod,-! la'-!
    re, la' mi la fad la dod, la'

    %85
    re, la' re, la' fad la dod, la'
    re, la' mi la fad la dod, la'\mbreak
    re,4 r la'-!\p sol-!

    %88
    fad4. mi8 re4-! dod-!
    re8-!\mf la'-! re,-! la'-! fad-! la-! dod,-! la'-!
    re, la' mi la fad la dod, la'

    %91
    re, la' re, la' fad la dod, la'
    re, la' mi la fad la dod, la'
    re,4 r la'-!\p sol-!

    %94
    fad4.-! mi8 re4. dod8\mbreak
    la'16\f fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'
    si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol'

    %97
    re fad re fad re fad re fad dod mi dod mi dod mi dod mi
    la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'
    si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol' si, sol'

    %100
    re fad re fad re fad re fad dod mi dod mi dod mi dod mi
    re4 r r \slashedGrace  mi,8 re\pp dod16 re
    dod4-! r r  \slashedGrace fad8 mi re16 mi\mbreak

    %103
    re4 r r \slashedGrace  mi8 re dod16 re
    mi4-! \slashedGrace sol8 fad mi16 fad sol4-! \slashedGrace fad8 mi re16 mi
    fad4 r r \slashedGrace  mi'8 re\mf dod16 re

    %106
    dod4-! r r  \slashedGrace fad8 mi re16 mi\mbreak
    re4-! r r \slashedGrace  mi8 re dod16 re
    mi4-! \slashedGrace sol8 fad mi16 fad sol4-! \slashedGrace fad8 mi re16 mi

    %109
    la,16\ff fad' la, fad' la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'
    la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'  la, fad' la, fad'\mbreak
    re re re re la la la la re re re re la la la la

    %112
    re4 r \stemUp < fad la, re,> r
    < fad la, re,> r r2\fermata

}

Ivlan = \relative do' {

    \repeat unfold 12 {re16} fad fad fad fad
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad

    %4
    re4 r r2
    r4 r8 re-! mi-! re-! mi-! fad-!
    sol-! fad-! mi-! fad-! sol-! fad-! sol-! la-!\mbreak

    %7
    re, re re re sol sol sol sol
    la la la la la, la la la
    \repeat unfold 12 {re16} fad fad fad fad

    %10
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad
    re4 r r2

    %13
    r4 r8 re-! mi-! re-! mi-! fad-!
    sol-! fad-! mi-! fad-! \mbreak sol-! fad-! sol-! la-!
    re, re re re sol sol sol sol

    %16
    la la la la la, la la la
    fad'16 la fad la fad la fad la fad la fad la fad la fad la
    fad la fad la fad la fad la fad la fad la fad la fad la

    %19
    sol si sol si sol si sol si sol si sol si sol si sol si
    sol si sol si sol si sol si sol si sol si sol si sol si
    fad la fad la fad la fad la fad la fad la fad la fad la

    %22
    fad la fad la fad la fad la fad la fad la fad la fad la\mbreak
    si8 si la la sold sold fad fad
    mi mi re re dod dod si si

    %25
    la4 r8 la-! si-! dod-! re-! mi-!
    fad-! mi-! re-! dod-! re-! mi-! fad-! sold-!
    \repeat unfold 12 {la16} mi mi mi mi

    %28
    dod dod dod dod mi mi mi mi dod dod dod dod la la la la
    mi'8 mi mi mi mi mi mi mi
    mi4 mi mi r\mbreak

    %31
    la,8-!\p mi'-! la,-! mi'-! dod-! mi-! sold,-! mi'-.
    la,-! mi'-! si-! mi-! dod-! mi-! sold,-! mi'-!
    la, mi' la, mi' dod mi sold, mi'

    %34
    la, mi' si mi dod mi sold, mi'
    la,4 r mi'-!\p re-!
    dod4.-! si8 la4 sold

    %37
    la8-!\mf mi'-! la,-! mi'-! dod-! mi-! sold,-! mi'-!\mbreak
    la, mi' si mi dod mi sold, mi'
    la, mi' la, mi' dod mi sold, mi'

    %40
    la, mi' si mi dod mi sold, mi'
    la,4 r mi'-!\p re-!
    dod4.-! si8 la4 sold

    %43
    la8\f la la la la la la la
    re re re re re re re re
    mi mi mi mi mi mi mi mi\mbreak

    %46
    la la la la la la la la
    re, re re re re re re re
    mi mi mi mi mi mi mi mi

    %49
    la,4 r r2
    la4\p la la la
    la r r2

    %52
    la4 la la la
    la4 la'8\f sol fad la fad re
    la4 la'8 sol fad la fad re

    %55
    la4 r r2\mbreak
    la4\p la la la
    la r r2

    %58
    la4 la la la
    la4 r r2
    la4 r r2

    %61
    la4 r r2
    R1
    re16\f \repeat unfold 11 {re} fad fad fad fad

    %64
    \repeat unfold 12 {la} fad fad fad fad
    re re re re la la la la re re re re fad fad fad fad\mbreak
    re4 r r2

    %67
    r4 r8 re-! mi-! re-! mi-! fad-!
    sol-! fad-! mi-! fad-! sol-! fad-! sol-! la-!
    re,8 re re re sol sol sol sol

    %70
    la la la la la, la la la
    fad'16 la fad la fad la fad la fad la fad la fad la fad la
    fad la fad la fad la fad la fad la fad la fad la fad la

    %73
    fad la fad la fad la fad la fad la fad la fad la fad la
    fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad\mbreak
    mi sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol

    %76
    \repeat unfold 16 {mi}
    re4 r8 re-! mi-! fad-! sol-! la-!
    si-! la-! sol-! fad-! sol-! la-! si-! dod-!\mbreak

    %79
    \repeat unfold 12 {re16} la la la la
    fad fad fad fad la la la la fad fad fad fad re re re re
    la8 la la la la la la la

    %82
    la4 la la r
    re8\p-! la'-! re,-! la'-! fad-! la-! dod,-! la'-!
    re, la' mi la fad la dod, la'

    %85
    re, la' re, la' fad la dod, la'
    re, la' mi la fad la dod, la'\mbreak
    re,4 r la'-!\p sol-!

    %88
    fad4. mi8 re4-! dod-!
    re8-!\mf la'-! re,-! la'-! fad-! la-! dod,-! la'-!
    re, la' mi la fad la dod, la'

    %91
    re, la' re, la' fad la dod, la'
    re, la' mi la fad la dod, la'
    re,4 r la'-! \p sol-!

    %94
    fad4.-! mi8 re4. dod8
    re8\f re re re re re re re
    sol sol sol sol sol sol sol sol

    %97
    la la la la la, la la la
    re re re re re re re re
    sol sol sol sol sol sol sol sol

    %100
    la la la la la, la la la\mbreak
    re4 r r2
    R1*3

    %105
    r8 re\pp re re re re re\mf re
    re re re re re re re re
    re re re re re re re re

    %108
    re re re re re re re re
    re\ff fad la fad re fad la fad\mbreak
    re fad la fad re fad la fad

    %111
    re re la la re re la la
    re4 r <<la'\\\stemUp fad\\\stemDown re>> r
    <<la'\\\stemUp fad\\\stemDown re>> r r2\fermata

}

Ibcn = \relative do {

    re2. fad4
    la2. fad4
    re la re fad

    %4
    re r r2
    R1*2
    re8 re re re sol sol sol sol

    %8
    \footnote #' (-1 . 2) \markup\column\smaller {"Il basso figurato è stato aggiunto a matita sulla partitura da una mano coeva""  "} la la la la la, la la la
    re2. fad4\mbreak
    la2. fad4

    %11
    re la re fad
    re r r2
    R1*2

    %15
    re8 re re re sol sol sol sol
    la la la la la, la la la
    re re re re re re re re

    %18
    re re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %21
    re re re re re re re re
    re re re re re re re re
    si' si la la sold sold fad fad

    %24
    mi mi re re dod dod si si
    la4 r8 la-! si-! dod-! re-! mi-!
    fad-! mi-! re-! dod-! re-! mi-! fad-! sold-!

    %27
    la2. mi4
    dod mi dod la
    mi'8 mi mi mi  mi mi mi mi\mbreak

    %30
    mi4 mi mi r
    R1*4
    r2 la,4\p-! si-!

    %36
    dod-! re-! mi-! mi-!
    la,-! r r2
    R1*3

    %41
    r2 la4-!\p si-!
    dod-! re-! mi-! mi-!
    la,8\f la la la la la la la

    %44
    re re re re re re re re
    mi mi mi mi mi mi mi mi\mbreak
    la la la la la la la la

    %47
    re, re re re re re re re
    mi mi mi mi mi mi mi mi
    la,4 r r2

    %50
    la4-.\p la-. la-. la-.
    la-. r r2
    la4-. la-. la-. la-.

    %53
    la-. la'8\f sol fad la fad re
    la4 la'8 sol fad la fad re\mbreak
    la4 r r2

    %56
    la4-.\p la-. la-. la-.
    la-. r r2
    la4-. la-. la-. la-.

    %59
    la-.  r r2
    la4-! r r2
    la4-! r r2

    %62
    R1
    re2.\f fad4
    la2. fad4

    %65
    re la re fad
    re4 r r2
    R1*2

    %69
    re8 re re re sol sol sol sol
    la la la la la, la la la
    re re re re re re re re

    %72
    re re re re re re re re
    re re re re re re re re
    red red red red red red red red

    %75
    mi mi mi mi mi mi mi  mi
    dod dod dod dod dod dod dod dod\mbreak
    re4 r8 re-! mi-! fad-! sol-! la-!

    %78
    si-! la-! sol-! fad-! sol-! la-! si-! dod-!
    re2. la4
    fad la fad re

    %81
    la8 la la la la la la la
    la4 la la r
    R1*4

    %87
    r2 re4\p-! mi-!
    fad-! sol-! la-! la,-!
    re4-! r r2\mbreak

    %90
    R1*3
    r2 re4\p-! mi-!
    fad-! sol-! la-! la,-!

    %95
    re8\f re re re re re re re
    sol sol sol sol sol sol sol sol
    la la la la la, la la la

    %98
    re re re re re re re re
    sol sol sol sol sol sol sol sol
    la la la la la, la la la\mbreak

    %101
    re8\noBeam re\pp re re re re re re
    re re re re re re re re
    re re re re re re re re

    %104
    re re re re re re re re
    re\noBeam re\pp re re re re re\mf re
    re re re re re re re re

    %107
    re re re re re re re re
    re re re re re re re re
    re\ff fad la fad re fad la fad\mbreak

    %110
    re fad la fad re fad la fad
    re re la la re re la la
    re4 r re r

    %113
    re r r2\fermata

}

Ibfn = \figures {
    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1*7
    <4>2 <3>
    s1*7
    <4>2 <3>
    s1
    s
    <4>2 <4>4. s8
    <4>2 <4>
    <3>1
    s\bassFigureExtendersOff
    <6\\>4 <3+> <6> <6>
    <3+> <3+> <6> <6\\>
    s1*4
    <3+>2 <4>
    <3+>1
    s1*5
    s2 <4>4 <3+>
    s1*5
    s2 <4>4 <3+>
    s1
    s
    <4>2 <3+>
    s1
    s
    <4>2 <3+>
    s1
    s2 <7!>
    <4>2 s
    \bassFigureExtendersOn
    <_4>2 <4>4 s
    <3>4 <3> <6>2
    <3> <6>
    <3>1
    s2 <7!>
    <4>2. s4
    <4>2 <4>
    <3> <4>
    <3> <4>
    <3>1
    s1*8
    <4>2 <3>
    s
    1s
    <7!>
    <6>
    <3!>
    <6>
    s1*4
    s2 <4>
    <3>1
    s1*5
    s2 <4>4 <3>
    s1*5
    s2 <4>4 <3>
    s1
    s
    <4>2 <3>
    s1
    s
    <4>2 <3>
    s1
    <7\\>
    <3>
    <7\\>4 <8> <4> <7\\>
    <8>1
    <7\\>
    <3>
    <4>4 <3> <4> <7\\>
    <8>1

}

forma = {

    \time 4/4
    \tempo 2 = 65
    \key re\major
    s1*113
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

    sol'16.\p(la32 sol16. la32) fad8(la)
    sol16.(la32 sol16. la32) fad8(la)
    sol8 la16 si do8 si

    %4
    \slashedGrace do8 si [la-. la-. ]r
    sol16.(la32 sol16. la32) fad8(la)
    sol16.(la32 sol16. la32) fad8(la)

    %7
    sol8\noBeam si16(re) \slashedGrace re8 do si16(la)\mbreak
    sol8 re sol,4
    sol'8 \slashedGrace si la16(sol16) sol8-! sol-!

    %10
    fad-! dod'-! \grace dod re4
    sol,8 \slashedGrace si la16 (sol16) sol8-! sol-!
    fad-! dod'-! \grace dod re4

    %13
    si16.(dod32 si16. dod32) la8(re)
    sol,16.(la32 sol16. la32) fad8(re')
    mi,16 (fad sol si) la(sol fad mi)

    %16
    re8 la re,4\mbreak
    re''8(sib16) re-! re8(la16) re-!
    re8(sib16) re-! re8(la16) re-!

    %19
    re8(sib16) re-! re8(dod16) sol-!
    \slashedGrace sol8 fad8. la16 re,(fad la do)
    \slashedGrace do8 sib8. sib16 la(sol fad sol)

    %22
    \slashedGrace sol8 fad8. la16 re,(fad la do)
    \slashedGrace do8 sib8. sib16 la(sol fad sol)
    re'8 re, re4\mbreak

    %25
    sol16.(la32 sol16. la32) fad8(la)
    sol16.(la32 sol16. la32) fad8(la)
    sol8 la16 si do8 si

    %28
    \slashedGrace do8 si [la-. la-.]r
    sol16.(la32 sol16. la32) fad8(la)
    sol16.(la32 sol16. la32) fad8(la)

    %31
    sol8 si16(re) \slashedGrace re8 do si16(la)
    sol8 re sol,4
    re'8 \slashedGrace fa mi16 (re) re8-! re-!\mbreak

    %34
    do-! sold'-! \grace sold la4
    do,8 \slashedGrace mi re16(do) do8-! do-!
    si fad' \grace fad sol4

    %37
    mi16.(fad32 mi16. fad32) re8(sol)
    do,16.(re32 do16. re32) si8(sol')
    la,16(si do mi) re(do si la)

    %40
    sol8-! r16 re''\f -! si(do re) fad,-!
    sol8-! r16 re' -! si(do re) fad,-!\mbreak
    sol4-! sol16\p(la si) red,-!

    %43
    mi(fad sol) do,-! si(do re) fad,_!
    sol8-! r16 re''\f -! si(do re) fad,-!
    sol8-! r16 re' -! si(do re) fad,-!

    %46
    sol4-! sol16\p(la si) red,-!
    mi(fad sol) do,-! si(do re) fad,_!
    si'8\ff\noBeam si32(do si do) re16-! si-! sol-! re-!\mbreak

    %49
    mi8-!\noBeam mi32(fad sol) mi-! re16-! do-! si-! la-!
    si'8-!\noBeam si32(do si do) re16-! si-! sol-! re-!
    mi8-!\noBeam mi32(fad sol) mi-! re16-! do-! si-! la-!

    %52
    sol8 si16. re32 \stemUp <sol si,re,>8 <si si, re,>
    <sol si, re,>4 r

}

IIvlIIn = \relative do'' {

    <<
        {
            re,2\p
            re
        }\\{
            si4(do)
            si(do)
        }
    >>
    <re si>8 r la'-! sol-!
    \slashedGrace la sol[fad-. fad-.] r
    <<
        {
            re2
            re
        }\\{
            si4(do)
            si(do)
        }
    >>
    <re si>8\noBeam sol16(si) \slashedGrace si8 la sol16 fad
    sol8 re sol,4\mbreak
    r16 mi'(sol mi) sol (mi sol mi)
    re8-! sol-! \grace sol fad4
    r16 mi(sol mi) sol (mi sol mi)
    re8-! sol-! \grace sol fad4

    %13
    si16.(dod32 si16. dod32) la8(re)
    sol,16.(la32 sol16. la32) fad8(re')
    mi,16(red mi sol) fad(mi re dod)

    %16
    re8 la re4
    r16 re(sol sib) r re, (fad la)\mbreak
    r16 re,(sol sib) r re, (fad la)

    %19
    r re,(sol sib) r sol sol sol
    \slashedGrace sol8 fad8. la16 re,(fad la do)
    \slashedGrace do8 sib8. sib16 la(sol fad sol)

    %22
    \slashedGrace sol8 fad8. la16 re,(fad la do)
    \slashedGrace do8 sib8. sib16 la(sol fad sol)
    re'8 re, re4

    %25
    <<
        {
            re2
            re
        }\\{
            si!4(do)
            si(do)
        }
    >>
    <re si>8 r la'-! sol-!
    \slashedGrace la sol[fad-. fad-.] r
    <<
        {
            re2
            re
        }\\{
            si4(do)
            si(do)
        }
    >>
    <re si>8\noBeam sol16(si) \slashedGrace si8 la sol16 fad
    sol8 re sol,4
    r16 si-! re(si) re (si re si)\mbreak
    la8-! re-! \grace re do4
    r16 la(do la)
    do (la do la)
    sol8-! do-! \grace do si4

    %37
    mi16.(fad32 mi16. fad32) re8(sol)
    do,16.(re32 do16. re32) si8(sol')
    mi16(sold la do) si(la sol fad)

    %40
    sol8-! r16 re'\f -! si(do re) fad,-!
    sol8-! r16 re' -! si(do re) fad,-!\mbreak
    sol4-!  mi16\p (fad sol) si,-!

    %43
    do(re mi) la,-! sol(la si) la-!
    sol8-! r16 re''\f -! si(do re) fad,-!
    sol8-! r16 re' -! si(do re) fad,-!
    sol4-! mi16\p (fad sol) si,-!
    do(re mi) la,-! sol(la si) la-!
    sol''8\ff -!\noBeam sol32 (la sol la) si16-! sol-! re-! si-!
    do8-!\noBeam do32(re mi) do-! si16-! la-! sol-! fad-!
    sol'8-!\noBeam sol32 (la sol la) si16-! sol-! re-! si-!
    do8-!\noBeam do32(re mi) do-! si16-! la-! sol-! fad-!

    %52
    sol8 si16. re32 \stemUp <sol si,re,>8 <si si, re,>
    <sol si, re,>4 r

}

IIvlan = \relative do' {

    si4\p(do)
    si(do)
    si8-! r la'-! sol-!

    %4
    \slashedGrace la8 sol [fad-. fad-.] r
    si,4(do)
    si(do)

    %7
    si8-! \noBeam sol'16(si) \slashedGrace si8 la sol16 fad
    sol8 re sol,4
    r16 dod (mi dod) mi (dod mi dod)\mbreak

    %10
    re8-! sol-! \grace sol fad4
    r16 dod (mi dod) mi (dod mi dod)\mbreak
    re8-! sol-! \grace sol fad4

    %13
    si16.(dod32 si16. dod32) la8(re)
    sol,16.(la32 sol16. la32) fad8(re')
    mi,16(red mi sol) fad(mi re dod)

    %16
    re8 la re4
    r16 re(sol sib) r re, (fad la)\mbreak
    r16 re,(sol sib) r re, (fad la)

    %19
    r re,(sol sib) r sol sol sol
    \slashedGrace sol8 fad8. la16 re,(fad la do)
    \slashedGrace do8 sib8. sib16 la(sol fad sol)

    %22
    \slashedGrace sol8 fad8. la16 re,(fad la do)
    \slashedGrace do8 sib8. sib16 la(sol fad sol)
    re'8 re, re4

    %25
    si!4(do)
    si(do)\mbreak
    si8 r la'-! sol-!

    %28
    \slashedGrace la sol[fad-. fad-.] r
    si,4(do)
    si(do)

    %31
    si8-!\noBeam sol'16(si) \slashedGrace si8 la sol16 fad
    sol8 re sol,4
    sold2

    %34
    la8-! re-! \grace re do4
    fad,2
    sol8-! do-! \grace do si4

    %37
    mi16. (fad32 mi16. fad32) re8(sol)\mbreak
    do,16.(re32 do16. re32) si8(sol')
    mi16(sold la do) si(la sol fad)

    %40
    sol8[r16 re'-!\f] si(do re) fad,-!
    sol8[r16 re'-!] si(do re) fad,-!
    sol4-! mi16\p(fad sol) si,-!

    %43
    do(re mi) la,-! sol(la si) la-!
    \once\stemUp sol8-![r16 re''\f] si(do re) fad,-!\mbreak
    sol8-![r16 re'-!] si(do re) fad,-!

    %46
    sol4-!mi16\p (fad sol) si,-!
    do(re mi) la,-! sol(la si) la-!
    sol\ff sol' sol sol sol sol sol sol

    %49
    do, do do do re re re re
    sol sol sol sol sol sol sol sol
    do, do do do re re re re

    %52
    sol,8[sol sol sol]
    sol4 r

}

IIbcn = \relative do {

    sol8 \p r sol r
    sol r sol r
    sol r do(dod)
    re la re,4

    %5
    sol8 r sol r
    sol r sol r
    sol r do re\mbreak

    %8
    sol re sol,4
    la2
    re4 r

    %11
    la2
    re4 r
    sol(fad)

    %14
    mi (re)
    sol la
    re,8 la re,4

    %17
    sol'8 r fad r
    sol r fad r\mbreak
    sol r mib r

    %20
    re4 re
    mib mib
    re re

    %23
    mib mib
    re8 re re4
    sol,8 r sol r

    %26
    sol r sol r
    sol r do(dod)

    %28
    re la re,4
    sol8 r sol r
    sol r sol r

    %31
    sol r do re
    sol re sol,4
    mi'2

    %34
    la,4 r
    re2
    sol,4 r

    %37
    do'(si)
    la (sol)
    do, re\mbreak

    %40
    sol16\f sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol4 r

    %43
    do,\p re
    sol16 sol sol sol sol\f sol sol sol
    sol sol sol sol sol sol sol sol

    %46
    sol4 r
    do,\p re
    sol16\ff sol sol sol sol sol sol sol

    %49
    do, do do do re re re re\mbreak
    sol sol sol sol sol sol sol sol
    do, do do do re re re re

    %52
    sol,8[sol sol sol]
    sol4 r

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <8>4 <7\\>
    <8> <7\\>
    s2
    s
    s4 <7\\>
    <8>4 <7\\>
    <8> s
    s2
    <7!>
    <3+>
    <7!>
    s2*3
    <6>4 <3+>
    \bassFigureExtendersOn <3> <3>\bassFigureExtendersOff
    <3->2
    <3->
    <3->4 <6\\>
    <3+>2
    <6\\>
    <3+>
    <6\\>
    <3+>
    <8 3!>4 <7\\>
    <8> <7\\>
    <8> s
    \bassFigureExtendersOn <3+>4 <3+>\bassFigureExtendersOff
    s <7\\>
    <8> <7\\>
    <8> s
    s2
    <7!>
    <3!>
    <7!>
    s2*13
    s4 <4>8 <3>
    s2
    s4 <4>8 <3>

}

forma = {

    \time 2/4
    \tempo 4 = 60
    \key sol\major
    s2*53
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

    R2.*4
    do2.~
    do~

    %7
    do4 r8 sol' fa mi
    re re re re4 r8
    R2.*4

    %13
    do2.~
    do~
    do4 sol'8 fa mi re

    %16
    do do do do4 r8
    R2.
    sol'8 sol sol sol4 r8

    %19
    R2.
    mi8 mi mi mi4 r8
    re4.\soli mi4 (sol8)

    %22
    \grace sol fa4. mi4 r8
    do\tu sol' fa mi re do
    sol' sol, sol sol4 r8

    %25
    R2.
    re'8 re re re4 r8
    R2.

    %28
    mi8 mi mi mi4 r8
    do4. \soli re8 re re
    mi mi mi fa fa fa

    %31
    sol4\tu sol8 fa mi re
    do do do do4 r8
    R2.

    %34
    re8 re re re4 r8
    R2.
    mi8 mi mi mi4 r8

    %37
    do4. \soli re8 re re
    mi mi mi fa fa fa
    sol4\tu sol8 fa mi re

    %40
    do4 r8 re4.
    mi4 r8 re4.
    mi4 r8 re4.

    %43
    mi4 r8 do4 r8
    mi4 sol8 fa mi re
    do4 r8 re4.

    %46
    mi4 r8 re4.
    mi4 r8 re4.
    mi4 r8 do4 r8

    %49
    mi4 sol8 fa mi re
    do4 r8 do4 r8
    do4 r8 do4 r8

    %52
    do do do do do do
    do4. do
    do r4 r8

}

%}


IIIcrIIn = %\transpose do re, {
\relative do'' {
    \key do\major

    R2.*4
    do,2.~
    do~

    %7
    do4 r8 mi' re do
    sol sol sol sol4 r8
    R2.*4

    %13
    do,2.~
    do~
    do4 mi'8 re do sol

    %16
    mi mi mi mi4 r8
    R2.
    mi'8 mi mi mi4 r8

    %19
    R2.
    do8 do do do4 r8
    sol4.\soli do4 (mi8)

    %22
    \grace mi re4. do4 r8
    do\tu sol' fa mi re do
    sol sol sol sol4 r8

    %25
    R2.
    sol8 sol sol sol4 r8
    R2.

    %28
    do8 do do do4 r8
    mi,4.\soli sol8 sol sol
    do do do re re re

    %31
    mi4\tu mi8 re do sol
    mi mi mi mi4 r8
    R2.

    %34
    sol8 sol sol sol4 r8
    R2.
    do8 do do do4 r8

    %37
    mi,4.\soli sol8 sol sol
    do do do re re re
    mi4 mi8 re do sol

    %40
    mi4 r8 sol4.
    do4 r8 sol4.
    do4 r8 sol4.

    %43
    do4 r8 do4 r8
    do4 mi8 re do sol
    mi4 r8 sol4.

    %46
    do4 r8 sol4.
    do4 r8 sol4.
    do4 r8 do4 r8

    %49
    do4 mi8 re do sol
    mi4 r8 mi4 r8
    mi4 r8 mi4 r8

    %52
    mi mi mi mi mi mi
    mi4. mi
    mi r4 r8

}

%}

IIIobIn = \relative do'' {

    R2.*4
    la'4. r8 si si
    la4. r8 si si

    %7
    la4 r8 la sol fad
    mi mi mi mi4 r8
    R2.*4

    %13
    la4. r8 si si
    la4. r8 si si\mbreak
    la4 la8 sol fad mi

    %16
    re re re re4 r8
    R2.
    la'8 la la la4 r8

    %19
    R2.
    fad8 fad fad fad4 r8
    mi4.\soli fad4 (la8)

    %22
    \grace la sol4. fad4 r8
    re\tu la' sol fad mi re\mbreak
    la' la, la la4 r8

    %25
    R2.
    sol'8 sol sol sol4 r8
    R2.

    %28
    fad8 fad fad fad4 r8
    re4.\soli mi8 mi mi
    fad fad fad sol sol sol

    %31
    la4\tu la8 sol fad mi
    re re re re4 r8\mbreak
    R2.

    %34
    sol8 sol sol sol4 r8
    R2.
    fad8 fad fad fad4 r8

    %37
    re4.\soli mi8 mi mi
    fad fad fad sol sol sol
    la4\tu la8 sol fad mi

    %40
    re4. r4 r8
    la'2.~
    la~\mbreak

    %43
    la4 r8 si4 r8
    la4 la8 sol fad mi
    re4. r4 r8

    %46
    la'2.~
    la~
    la4 r8 si4 r8

    %49
    la4 la8 sol fad mi
    re4 r8 re4 r8
    fad4 r8 la4 r8\mbreak

    %52
    la la la la la la
    la4. fad
    fad r4 r8

}

IIIobIIn = \relative do'' {

    R2.*4
    fad4. r8 sol sol
    fad4. r8 sol sol

    %7
    fad4 r8 fad mi re
    dod dod dod dod4 r8
    R2.*4

    %13
    fad4. r8 sol sol
    fad4. r8 sol sol
    fad4 fad8 mi re dod

    %16
    re fad, fad fad4 r8
    R2.
    fad'8 fad fad fad4 r8

    %19
    R2.
    re8 re re re4 r8
    dod4.\soli re4(fad8)

    %22
    \grace fad mi4. re4 r8
    re\tu la' sol fad mi re\mbreak
    la' la, la la4 r8

    %25
    R2.
    mi'8 mi mi mi4 r8
    R2.

    %28
    re8 re re re4 r8
    fad,4.\soli dod'8 dod dod
    re re re mi mi mi

    %31
    fad4\tu fad8 mi re dod
    re fad, fad fad4 r8
    R2.

    %34
    mi'8 mi mi mi4 r8
    R2.
    re8 re re re4 r8

    %37
    fad,4.\soli dod'8 dod dod
    re re re mi mi mi
    fad4\tu fad8 mi re dod

    %40
    re4. r4 r8
    la2.~
    la~

    %43
    la4 r8 re4 r8
    fad4 fad8 mi re dod
    re4. r4 r8

    %46
    la2.~
    la~
    la4 r8 re4 r8

    %49
    fad4 fad8 mi re dod
    re4 r8 la4 r8
    re4 r8 fad4 r8

    %52
    fad fad fad fad fad fad
    fad4. re
    re r4 r8

}

IIIvlIn = \relative do'' {

    la'4.\mf~la8 fad re'
    dod4\prall si16(dod) re4-! r8
    la4.~la8 fad re'

    %4
    \grace la sol4. fad4 r8
    \stemUp <la la,>\f <la la,> <la la,> r \stemNeutral re(dod)
    \stemUp <la la,> <la la,> <la la,> r \stemNeutral re(dod)

    %7
    la re la la sol fad\mbreak
    mi la, la la4.
    la'4.\mf~la8 si la

    %10
    la4.(fad4) r8
    la4.~la8 si la
    la4.(re,)

    %13
    \stemUp <la' la,>8\f <la la,> <la la,> r \stemNeutral re(dod)
    \stemUp <la la,> <la la,> <la la,> r \stemNeutral re(dod)
    la re la sol fad mi\mbreak

    %16
    re <re re,> <re re,> <re re,>4 r8
    re'4.\p dod4(si8)
    la\f la la la4 r8

    %19
    si4.\p la4(sol8)
    fad\f fad fad fad4 r8
    R2.*2

    %23
    re'8\ff la sol fad mi re
    la' la, la la4 r8
    la'4.\p si4(fad8)\mbreak

    %26
    sol\f sol sol sol4 r8
    sol4.\p la4(mi8)
    fad\f fad fad fad4 r8

    %29
    R2.*2
    la8 re la sol fad mi
    <re re,> <re re,> <re re,> <re re,>4 r8

    %33
    la'4.\p si4(fad8)
    sol\f sol sol sol4 r8
    sol4.\p la4(mi8)

    %36
    fad\f fad fad fad4 r8
    R2.*2
    la8 re la sol fad mi

    %40
    re4. dod'4\prall si16(dod)
    re8 la fad dod'4\prall si16(dod)
    re8 la fad dod'4\prall si16(dod)

    %43
    re4 r8 \once\stemUp <si re, re,>4 r8
    la re la sol fad mi
    re4. dod'4\prall si16(dod)

    %46
    re8 la fad dod'4\prall si16(dod)
    re8 la fad dod'4\prall si16(dod)
    re4 r8 \once\stemUp <si re, re,>4 r8

    %49
    la re la sol fad mi
    re4. re8 la re
    fad re fad la fad la

    %52
    re la fad re' la fad
    \stemUp <re' fad, re,>4. <re fad, re,>\mbreak
    <re fad, re,> r4 r8

}

IIIvlIIn = \relative do'' {

    fad,8-!\mf fad-! fad-! fad-! fad-! fad-!
    sol sol sol la la la
    fad fad fad fad fad fad

    %4
    <mi dod> <mi dod> <mi dod> re re re
    <fad' la,>\f <fad la,> <fad la,> r si (sol)
    <fad la,> <fad la,> <fad la,> r si (sol)\mbreak

    %7
    fad la fad fad mi re
    dod la la la4 r8
    mi-!\mf  mi-!  mi-!  mi-!  mi-!  mi-!

    %10
    fad fad fad fad fad fad
    sol sol sol sol sol sol
    la la la la la la

    %13
    <fad' la,>\f <fad la,> <fad la,> r si (sol)
    <fad la,> <fad la,> <fad la,> r si (sol)\mbreak
    fad la fad mi re dod

    %16
    re <re re,> <re re,> <re re,>4 r8
    si'4.\p la4(sol8)
    fad\f fad fad fad4 r8

    %19
    sol4.\p fad4(mi8)
    re\f re re re4 r8
    R2.*2

    %23
    re'8\ff la sol fad mi re
    la' la, la la4 r8
    fad'4.\p sol4(red8)

    %26
    mi\f mi mi mi4 r8
    mi4.\p fad4(dod8)
    re\f re re re4 r8

    %29
    R2.*2
    fad8 la fad mi re dod
    re <re re,> <re re,> <re re,>4 r8

    %33
    fad4.\p sol4 (red8)
    mi\f mi mi mi4 r8
    mi4.\p fad4(dod8)

    %36
    re\f re re re4 r8
    R2.*2
    fad8 la fad mi re dod

    %40
    re\noBeam \stemUp <la' la,> <la la,> <la la,> <la la,> <la la,>
    <la la,> <la la,> <la la,> <la la,> <la la,> <la la,>
    <la la,> <la la,> <la la,> <la la,> <la la,> <la la,>

    %43
    <la la,>4 r8 <sol si, re,>4 r8\stemNeutral
    fad la fad mi re dod
    re\noBeam \stemUp <la' la,> <la la,> <la la,> <la la,> <la la,>

    %46
    <la la,> <la la,> <la la,> <la la,> <la la,> <la la,>
    <la la,> <la la,> <la la,> <la la,> <la la,> <la la,>
    <la la,>4 r8 <sol si, re,>4 r8\stemNeutral

    %49
    fad la fad mi re dod
    re4. la8 fad la
    re la re fad re fad

    %52
    la fad re la' fad re
    <fad la, re,>4. <fad la, re,>
    <fad la, re,> r4 r8

}

IIIvlan = \relative do' {

    re8-!\mf re-! re-! re -! re-! re-!
    mi mi mi fad fad fad
    re re re re re re

    %4
    la la la re re re
    re\f re re re re re
    re re re re re re\mbreak

    %7
    re re re re re re
    la la la la4 r8
    dod-!\mf dod-! dod-! dod-! dod-! dod-!

    %10
    re re re re re re
    mi mi mi mi mi mi
    fad fad fad fad fad fad

    %13
    re\f re re re re re\mbreak
    re re re re re re
    re re re la la la

    %16
    re re re re4 r8
    <<
        {
            re'4.\p dod4 (si8)
            la\f la la la4
        }\\{
            si4. la4 sol8
            fad fad fad fad4
        }
    >> r8

    %19
    <<
        {
            si4.\p la4 (sol8)
            fad\f fad fad fad4
        }\\{
            sol4. fad4 mi8
            re re re re4
        }
    >> r8\mbreak
    R2.*2

    %23
    re'8\ff la sol fad mi re
    la' la, la la4 r8
    <<
        {
            la'4.\p si4 (fad8)
            sol \f sol sol sol4
        }\\{
            fad4. sol4 red8
            mi mi mi mi4
        }
    >> r8

    %27
    <<
        {
            sol4.\p la4 (mi8)
            fad\f fad fad fad4
        }\\{
            mi4. fad4 dod8
            re re re re4
        }
    >> r8
    R2.*2

    %31
    <<
        {
            la'8 re la sol fad mi
        }\\{
            fad8 la fad mi re dod
        }
    >> \mbreak
    re re re re4 r8
    <<
        {
            la'4.\p si4 fad8
            sol \f sol sol sol4
        }\\{
            fad4. sol4 red8
            mi mi mi mi4
        }
    >> r8

    %35
    <<
        {
            sol4.\p la4 (mi8)
            fad\f fad fad fad4
        }\\{
            mi4. fad4 dod8
            re re re re4
        }
    >> r8
    R2.*2

    %39
    <<
        {
            la'8 re la sol fad mi
        }\\{
            fad8 la fad mi re dod
        }
    >>
    re re re sol sol sol
    fad fad fad sol sol sol

    %42
    fad fad fad sol sol sol
    fad fad fad sol sol sol
    la la la la, la la

    %45
    re re re sol sol sol
    fad fad fad sol sol sol
    fad fad fad sol sol sol

    %48
    fad fad fad sol sol sol\mbreak
    la la la la, la la
    \repeat unfold 6 {re8 re re}

    %53
    re4. re
    re r4 r8

}

IIIbcn = \relative do {

    R2.*4
    re8\f re re \repeat unfold 5 {re re re}
    la la la la4 r8

    %9
    R2.*4
    re8\f re re\repeat unfold 4 {re8 re re} la la la
    re re re re4 r8

    %17
    R2.
    re8\f re re re4 r8
    R2.

    %20
    re8 re re re4 r8\mbreak
    R2.*2
    re'8\ff la sol fad mi re

    %24
    la' la, la la4 r8
    R2.
    la8 la la la4 r8

    %27
    R2.
    re8 re re re4 r8
    R2.*2

    %31
    re8 re re la la la\mbreak
    R2.
    re8 re re re4 r8

    %34
    la8 la la la4 r8
    R2.
    re8 re re re4 r8

    %37
    R2.*2
    re8 re re la la la
    re re re sol sol sol

    %41
    fad fad fad sol sol sol\mbreak
    fad fad fad sol sol sol
    fad fad fad sol sol sol

    %44
    la la la la, la la
    re re re sol sol sol
    fad fad fad sol sol sol

    %47
    fad fad fad sol sol sol
    fad fad fad sol sol sol\mbreak
    la la la la, la la

    %50
    \repeat unfold 6 {re8 re re}
    re4. re
    re r4 r8

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*4
    <3>4. <4>
    <3> <4>
    <3> s
    s2.*5
    <3>4. <4>
    <3> <4>
    <3> <7!>
    s2.*18
    <7!>2.
    s2.*5
    s4. <4\+>
    <6> <4\+>
    <6> <4\+>
    s2.
    <4>4. <3>
    s <4\+>
    <6> <4\+>
    s s
    <6> <3>
    <4> <3>

}

forma = {

    \time 6/8
    \tempo 2. = 60
    \key re\major
    \repeat volta 2 {s2.*8}\break
    \repeat volta 2 {s2.*8}\break
    \repeat volta 2 {s2.*8}\break
    \bar ":|."
    s2.*30
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
        subtitle = \markup \larger\center-column{"Sinfonia in Re maggiore da ”Lucio Silla”"}
        composer = \markup \center-column{"P. Anfossi (1727-1797)"}
    }

    \markup\huge "[1.] Allegro con spirito"

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
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni e""Trombe in D"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \IcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Oboè"}
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
                \set Staff.instrumentName = \markup \center-column\smaller{"[Violone e""Fagotto]"}
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

    \markup\huge "[2.] Andantino"

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
                \set Staff.instrumentName = \markup \center-column\smaller{"[Violone e""Fagotto]"}
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
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni e""Trombe in D"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \IIIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Oboè"}
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
