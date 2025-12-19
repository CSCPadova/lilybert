\language "italiano"
%********************************** VARIABILI
\version "2.24.0"


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

    do16 la' sol8 r16  la sol8 r16 do, re mi fa8 mi16 re
    mi16 la sol8 r16  la sol8 r16 do, re mi fa8 mi16 re
    mi sol mi8 r16 re do sib la la fa' sol la8 la,

    %4
    r16 la' fad8 r16 mi re do si? si sol' la si8 si,
    r16 sol' la si do8 \once\stemUp mi,, \once\stemUp re16 fa' sol la si8 \once\stemUp re,,\mbreak
    \once\stemUp do16 mi' fa sol la8 \once\stemUp do,, \once\stemUp si16 re' mi fa \once\stemDown sol8 si,,

    %7
    \once\stemUp la16 do' re mi fa8 la, si16 re do mi re fa mi sol
    fa2 si,16 re do mi re fa mi sol
    fa8[mi16(fa) sol(fa) mi(re)] mi8 do re si

    %10
    do16 la' sol8 r16  la sol8 r16 do, re mi fa8 mi16 re\mbreak
    mi16 la sol8 r16  la sol8 r16 do, re mi fa8 mi16 re
    mi8 do' re si do4 r

    %13
    R1*12
    sol,16 mi' re8 r16 mi re8 r16 sol, la si do8 si16 la
    si16 mi re8 r16 mi re8\mbreak r16 sol, la si do8 si16 la

    %27
    si re mi fad sol8 si, la16 do re mi fad8 la,
    sol16 si do re mi8 sol, fad16 la si do re8 fad,
    mi16 sol la si do8 mi, fad16 la sol si la do si re

    %30
    do2 fad,16 la sol si la do si re
    do8[si16(do) re(do) si(la)] si8 sol' la fad\mbreak
    sol4 r r2

    %33
    R1*7
    mi16 do' si8 r16 do si8 r16 mi, fad sol la8 sol16 fad
    sol do si8 r16 do si8 r16 mi, fad sol la8 sol16 fad\mbreak

    %42
    sol8 mi fad red mi4 r
    R1*10
    r2 do16 la' sol8 r16 la sol8

    %54
    r16 do, re mi fa8 mi16 re mi la sol8 r16 la sol8
    r16 do, re mi fa8 mi16 re mi8 do r4
    R1*7

    %63
    r16 sol' la si do8 \once\stemUp mi,, \once\stemUp re16 fa' sol la si8 \once\stemUp re,,\mbreak
    \once\stemUp do16 mi' fa sol la8 \once\stemUp do,, \once\stemUp si16 re' mi fa \once\stemDown sol8 \once\stemUp si,,
    \once\stemUp la16 do' re mi fa8 la, si16 re do mi re fa mi sol

    %66
    fa2 si,16 re do mi re fa mi sol
    fa8[mi16(fa) sol(fa) mi(re)] mi8 do re si
    do16 la' sol8 r16  la sol8 r16 do, re mi fa8 mi16 re\mbreak

    %69
    mi16 la sol8 r16  la sol8 r16 do, re mi fa8 mi16 re
    mi8 do' re si do4\fermata r

}

IvlIIn = \relative do'' {

    r16 do re mi fa8 mi16 re mi la sol8 r16 la sol8
    r16 do, re mi fa8 mi16 re mi la sol8 r16 la sol8
    r16 do, mi fa sol8 sol, la16 do la8 r16 sol fa mi

    %4
    re fad la re fad8 fad, r16 re' si8 r16 la sol fa?
    mi4 r8 do'' do fa, r si\mbreak  %% da qui
    si mi, r la la re, r sol

    %7
    sol do, r fa fa2
    si,16 re do mi re fa mi sol fa2
    re8[do16(re) mi(re) do(si)] do8 mi fa re

    %10
    do16 do re mi fa8 mi16 re mi la sol8 r16 la sol8\mbreak
    r16 do, re mi fa8 mi16 re mi la sol8 r16 la sol8
    r mi fa re mi4 r  %%%%%%%fine ripresa

    %13
    R1*12
    r16  sol, la si do8 si16 la si mi re8 r16 mi re8
    r16  sol, la si do8 si16 la\mbreak si mi re8 r16 mi re8

    %27
    r4 r8 sol sol do, r fad
    fad? si, r mi mi la, r re
    re sol, r do do2

    %30
    fad,16 la sol si la do si re do2
    la8[sol16(la) si(la) sol(fad)] sol8 si do la\mbreak
    si4 r r2

    %33
    R1*7
    r16 mi fad sol la8 sol16 fad sol do si8 r16 do si8
    r16 mi, fad sol la8 sol16 fad sol do si8 r16 do si8\mbreak

    %42
    r8 sol la fad mi4 r
    R1*10
    r2 r16 do re mi fa8 mi16 re

    %54
    mi la sol8 r16 la sol8 r16 do, re mi fa8 mi16 re
    mi la sol8 r16 la sol8 sol mi r4
    R1*7

    %63
    mi,4 r8 do'' do fa, r si\mbreak  %% da qui
    si mi, r la la re, r sol
    sol do, r fa fa2

    %66
    si,16 re do mi re fa mi sol fa2
    re8[do16(re) mi(re) do(si)] do8 mi fa re
    do16 do re mi fa8 mi16 re mi la sol8 r16 la sol8\mbreak

    %69
    r16 do, re mi fa8 mi16 re mi la sol8 r16 la sol8
    r mi fa re mi4\fermata r  %%%%%%%fine ripresa

}

Ivlan =  \relative do' {

    r8 do'4 si8 r do4 si8
    r do4 si8 r do4 si8
    r do, do4 r8 do do4

    %4
    r8 re re4 r8 re\noBeam re sol,
    sol sol' sol sol la la fa fa %%da qui
    sol sol mi mi fa fa re re

    %7
    mi mi do do re sol si sol
    re sol si sol re sol si sol
    si, sol' si sol sol sol la sol

    %10
    mi do'4 si8 r do4 si8\mbreak
    r do4 si8 r do4 si8
    r sol la sol sol4 r %% fin qui

    %13
    R1*12
    r8 sol4 fad8 r sol4 fad8
    r sol4 fad8\mbreak r sol4 fad8

    %27
    r re re re mi mi do do
    re re si si do do la la
    si si sol sol la re fad re

    %30
    la re fad re la re fad la,
    fad fad fad' fad re re mi re\mbreak
    re4 r r2

    %33
    R1*7
    r8 mi4 red8 r mi4 red8
    r8 mi4 red8 r mi4 red8\mbreak

    %42
    r si' do si sol4 r
    R1*10
    r2 r8 do4 si8

    %54
    r do4 si8 r do4 si8
    r do4 si8 do sol r4
    R1*7

    %63
    sol,8 sol' sol sol la la fa fa %%da qui
    sol sol mi mi fa fa re re
    mi mi do do re sol si sol

    %66
    re sol si sol re sol si sol
    si, sol' si sol sol sol la sol
    mi do'4 si8 r do4 si8\mbreak

    %69
    r do4 si8 r do4 si8
    r sol la sol sol4\fermata r %% fin qui

}

Ivcn = \relative do {

    \set fontSize = -3 do8 do' fa, sol mi do fa sol
    do, do' fa, sol mi do fa sol
    do, do do do fa fa fa fa

    %4
    fad fad fad fad sol sol sol sol
    do, do mi mi re re re re\mbreak
    do do do do si si si si

    %7
    la la la la sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol do do' fa, sol

    %10
    do, do' fa, sol mi do fa sol\mbreak
    do, do' fa, sol mi do fa sol
    do, do' fa, sol  \set fontSize = 0 do,16 la' sol8 r16 la sol8
    r16 do [si la sol fa mi re] mi sol fa8 r16 la sol si
    la do si8 r16 re do mi re[do si la sol fa mi re]
    mi8 do r4 mi'16 do re do re do re do
    do, do' re do re do re do\mbreak re si do si do si do si
    si, si' do si do si do si do la si la si la si la
    la, la' si la si la si la si8 \once\stemUp sol, si'16 do re si
    \once\stemDown la8 fa, la'16 si do la \once\stemDown sol8 mi, sol'16 la si sol
    \once\stemDown fa8 re, fa'16 sol la fa mi8[do16 si do re mi fad]\mbreak
    sol4 r8 si la16 sol fad8 r do'
    si16 la sol8 r re' la, do' sol, si'
    fad, la' mi, sol' re,[mi16 fad sol la si do]
    re8[mi16 fad sol la si do] re8 sol, do, re

    %25
    \set fontSize = -3 sol, sol' do, re si sol do re
    sol, sol' do, re\mbreak si sol do re
    \once\stemUp sol, si' si si la la la la

    %28
    sol sol sol sol fad fad fad fad
    mi mi mi mi re re re re
    re re re re sol sol, do re\mbreak

    %31
    sol, sol sol sol sol sol sol sol
    \set fontSize = 0 sol4 re''~re16 do do si si la la sol
    sol fa fa mi mi re re do do4 mi'~
    mi16 re re do do si si la la sol sol fad fad mi mi mi
    re4 r16 si'32 do re16 re do re, re,8 r16 la''32 si do16 do
    si re, re,8 r16 sol'32 la si16 si la re, re,8 r16 fad'32 sol la16 la\mbreak
    sol16[si32 la sol fad mi re] mi16[do'32 si la sol fad mi] si16 si' do si mi re do si
    si, la' si la re do si la si, sol' la sol do si la sol
    si, fad' sol fad si la sol fad sol8 fad16 mi si'8 si,
    mi \set fontSize = -3 mi' la, si sol mi la si\mbreak
    mi, mi' la, si \set fontSize = 0 mi,16[mi' mi re do si la sol]
    fad[re' re do si la sol fad] mi[do' do si la  sol fad mi]
    red[si' si la sol fad mi red] do la' la sol fad mi red dod
    si4 r16 si' do si si, la' si la si, sol' la sol
    si,4 r8 si' do16 la mi'8 r16 do si la
    si sol mi'8 r16 si la sol\mbreak la fad mi'8 r16 la, sol fad
    sol mi mi'8 r16 sol, fad mi red do' si8 r16 do si8
    r16 la sol fad si la sol fad sol mi si'8 r16 do si8
    r16 sold fad mi mi' re do si do la re8 r16 mi re8
    r16 la sol? fad re'  do si la si sol do8 r16 re do8
    r16 sol la sib do sib la sol\mbreak la fa? re'8 r16 do si? la
    si sol si do re fa, mi re mi8 do \set fontSize = -3 fa sol
    mi do fa sol do, do' fa, sol
    mi do fa sol \set fontSize = 0 do, do, do''16 mi do sol
    la do la fa si re si fa sol si sol mi la do la mi
    fa la fa re sol si sol re\mbreak mi sol mi do r mi' re do
    \once \stemUp sol, re'' do si \once \stemUp sol, do' si la \once \stemUp sol, si' la sol \once \stemUp sol, la' sol fa
    sol, sol' fa mi sol, fa' mi re \once \stemUp sol, do' si8 r16 do si8
    r16 si la sol re' fa, mi re mi fa mi8 r16 fa mi8
    r16 mi re do sol' mi re do si la sol8 r16 si' do re
    sol, re' fa, re' mi, re' re, re'\mbreak do, re mi fa sol8 sol,
    do \set fontSize = -3 do mi mi re re re re\mbreak
    do do mi mi re re re re
    do do do do si si si si

    %65
    la la la la sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol do do' fa, sol

    %68
    do, do' fa, sol mi do fa sol\mbreak
    do, do' fa, sol mi do fa sol
    do, do' fa, sol do,4\fermata r

}

Ibcn = \relative do {

    do8 do' fa, sol mi do fa sol
    do, do' fa, sol mi do fa sol
    do, do do do fa fa fa fa

    %4
    fad fad fad fad sol sol sol sol
    do, do mi mi re re re re\mbreak
    do do do do si si si si

    %7
    la la la la sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol do do' fa, sol

    %10
    do, do' fa, sol mi do fa sol\mbreak
    do, do' fa, sol mi do fa sol
    do, do' fa, sol do, mi fa si,

    %13
    do fa si, sol do[re16 mi fa8 mi]
    fa8[sol16 la si8 la] si sol si, sol
    do,[do'16 re mi8 re] do4 r

    %16
    do r\mbreak si r
    si r la r
    la r sol r

    %19
    fa r mi r
    re r do4. do'8\mbreak
    si la sol sol' fad mi re fad

    %22
    sol la si sol la,4 sol
    fad mi re r
    re r re8 sol' do, re

    %25
    sol, sol' do, re si sol do re
    sol, sol' do, re\mbreak si sol do re
    \once\stemUp sol, si' si si la la la la

    %28
    sol sol sol sol fad fad fad fad
    mi mi mi mi re re re re
    re re re re sol sol, do re\mbreak

    %31
    sol, sol sol sol sol sol sol sol
    sol sol sol sol do do do do
    do do do do do do do do

    %34
    re re re4 r8 re, re4
    r8 re re4 r8 re re4\mbreak
    sol8 r do r si4 r

    %37
    si r si r
    si r mi8 mi, si''[si,]
    mi mi' la, si sol mi la si

    %40
    mi, mi' la, si sol mi la si\mbreak
    mi, mi' la, si mi,4 r
    re r do r

    %43
    si r la r
    si si si si
    si8 si' sol mi la  la la la

    %46
    sol sol sol sol\mbreak fad fad fad fad
    mi mi mi mi si si' sol mi
    red fad red si mi sol fad red

    %49
    mi fad sold mi la fad la sol?
    fad re? mi fad sol la si sol
    mi re mi do\mbreak fa? sol la fad

    %52
    sol re si sol do do' fa, sol
    mi do fa sol do, do' fa, sol
    mi do fa sol do, do, mi'\noBeam r

    %55
    fa r re r mi r do r
    re r si r\mbreak do re mi do
    sol r sol r sol r sol r
    sol r sol r sol sol' mi re16 do

    %59
    sol8 sol' si, sol do, do' la sol16 fa
    mi8 do' do do, sol' la si sol
    mi' re do si\mbreak do16 re mi fa sol8 sol,

    %62
    do do mi mi re re re re\mbreak
    do do mi mi re re re re
    do do do do si si si si

    %65
    la la la la sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol do do' fa, sol

    %68
    do, do' fa, sol mi do fa sol\mbreak
    do, do' fa, sol mi do fa sol
    do, do' fa, sol do,4\fermata r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 4/4
    \tempo 2 = 53
    s1*70
    \bar"|."


}

Ivc = {
    \Iglobal
    \clef bass
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

}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine\senza
}

IIvcn = \relative do {

    la'4~la8. sol32 fa mi4
    fa~fa8. mi32 re do4
    re~re8. do32 si la4

    %4
    fa'32 mi re8. do32 si la8. do'32 si la8.
    la4\tr sold r\mbreak
    \tuplet 3/2 { do16 mi re do[re mi] la, do si la[si do] fa, la sol fa[sol la] }

    %7
    si,4 re sol
    \tuplet 3/2 { si16 re do si[do re] sol, si la sol[la si] mi, sol fa mi[fa sol] }
    la,4 do fa\mbreak

    %10
    \tuplet 3/2 { la16 do si la[si do] fa, la sol fa[sol la] re, fa mi re[mi fa] }
    sol,4 r8 re''16[do si la sol fa]
    mi8.[do16 sol'8. mi16 la8. fa16]

    %13
    si4 do r32 mi[re do si la sol fa]
    mi16 do' si do re,4.\tr do8\mbreak
    do4 r8 r16 do' do8\tr~do32 si do re

    %16
    si,4 r8 r16 si' si8\tr~si32 la si do
    la,4 r8 r16 la' la8\tr~la32 sol la si
    sol,4 r8 r16 re'' re8.\tr do32 si

    %19
    do16 si la8 r fa'16[mi re do si la]
    sold mi fa mi si' mi, fa mi re' mi, fa mi
    do'4 mi~mi32 re do si la sol fa mi\mbreak

    %22
    fa4 re'~re32 do si la sol fa mi re
    mi4 do'~do32 si la sol fa mi re do
    re4 si'~si32 la sold fad mi re do si

    %25
    do16 la la8\tr mi'16 do do8\tr la'16 mi mi8\tr
    fa16 re re8\tr la'16 fa fa8\tr re'16 la la8\tr
    sold16 mi mi8\tr si'16 sold sold8\tr re'16 si si8\tr

    %28
    do4 r16 mi[re do si la sold fad]
    mi re' do si si4.\tr la8
    la2.\fermata

}

IIbcn = \relative do {

    la'4 la, do
    re si do
    si sold la

    %4
    re la la
    mi' sold mi\mbreak
    la fa re

    %7
    si la sol
    sol' mi do
    la sol fa\mbreak

    %10
    fa' re si
    sol si sol
    do mi fa

    %13
    fa mi do
    do sol2\mbreak
    do4 do do

    %16
    si si si
    la la la
    sol sold sold

    %19
    la la la
    mi' mi mi
    la do, do\mbreak

    %22
    re si si
    do la la
    si sold sold

    %25
    la la la
    re re re
    mi mi mi

    %28
    la, la' red,
    mi mi mi,
    la2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 50
    s2.*30
    \bar"|."


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
    \terzine\senza
}

IIIvlIn =  \relative do'' {

    do8 sol4~
    sol8 mi16 fa sol8
    do sol4~

    %4
    sol8 mi'16 fa sol8
    r si,16 do re8
    do sol'8. la16

    %7
    fa8 fa8. sol16
    mi8 mi8. fa16
    re8 re8. fa16

    %10
    mi sol mi sol mi sol
    la, do la do la do
    fa la fa la fa la

    %13
    si, re si re si re\mbreak
    sol si sol si sol si
    do8 do,16\p re mib8

    %16
    r re16 do re si
    do8 do16 re mib8
    r re16 do re si

    %19
    do4 r8
    R4.*19
    sol'8 re4~

    %40
    re8 si16 do re8
    sol re4~
    re8 si16 do re8

    %43
    r fad,16 sol la8
    sol re'8. mi16
    do8 do8. re16

    %46
    si8 si8. do16
    la8 la8. do16
    si re si re si re\mbreak

    %49
    sol re sol re sol re
    si8 sol'16 la sib8
    r la16 sol la fad

    %52
    sol8 sol16 la sib8
    r la16 sol la fad
    sol4 r8

    %55
    R4.*25
    si,16 mi si mi si mi
    do mi do mi do mi\mbreak

    %82
    do la' do, la' do, la'
    fad la fad la fad la
    sol8 la fad

    %85
    sol4 r8
    R4.*9\mbreak
    do,8 sol4~

    %96
    sol8 mi16 fa sol8
    do sol4~
    sol8 mi'16 fa sol8

    %99
    r si,16 do re8
    mi4 r8
    R4.*20

    %121
    mi16 sol mi sol mi sol
    la, do la do la do
    fa la fa la fa la

    %124
    si, re si re si re\mbreak
    sol si sol si sol si
    do8 do,16\p re mib8

    %127
    r re16 do re si
    do8 do16 re mib8
    r re16 do re si

    %130
    do4.\fermata




}

IIIvlIIn = \relative do'' {

    mi8 do4~
    do8 do,16 re mi8
    mi' do4~

    %4
    do8 do16 re mi8
    r sol,16 la si8
    do mi8. fa16

    %7
    re8 re8. mi16
    do8 do8. re16
    si8 si8. re16

    %10
    do mi do mi do mi
    do fa do fa do fa
    re fa re fa re fa

    %13
    re sol re sol re sol\mbreak
    re sol re sol re sol
    sol8 mib16\p re  sol8

    %16
    r fa16 mib fa re
    mib8 mib16 fa sol8
    r fa16 mib fa re

    %19
    mi!4 r8
    R4.*19
    si'8 sol4~

    %40
    sol8 sol,16 la si8
    si' sol4~
    sol8 sol,16 la si8

    %43
    r re,16 mi fad8
    sol si8. do16
    la8 la8. si16

    %46
    sol8 sol8. la16
    fad8 fad8. la16
    sol si sol si sol si\mbreak

    %49
    re si re si re si
    re8 sib'16 do re8
    r do16 sib do la

    %52
    sib8 sib16 do re8
    r do16 sib do la
    si!4 r8

    %55
    R4.*25
    sol,16 si sol si sol si
    la do la do la do\mbreak

    %82
    la mi' la, mi' la, mi'
    red fad red fad red fad
    mi8 fad red

    %85
    mi4 r8
    R4.*9
    mi8 do4~

    %96
    do8 do,16 re mi8
    mi' do4~
    do8 do16 re mi8

    %99
    r sol,16 la si8
    do4 r8
    R4.*20

    %121
    do16 mi do mi do mi
    do fa do fa do fa
    re fa re fa re fa

    %124
    re sol re sol re sol\mbreak
    re sol re sol re sol
    sol8 mib16\p re  sol8

    %127
    r fa16 mib fa re
    mib8 mib16 fa sol8
    r fa16 mib fa re

    %130
    mi!4.\fermata

}

IIIvlan =  \relative do' {

    sol'8 mi4~
    mi8 mi16 re do8
    sol' mi4~

    %4
    mi8 mi16 re do8
    r re si
    sol do' do,

    %7
    r sol' sol,
    r do' do,
    r sol' sol,

    %10
    sol'16 do sol do sol do
    do,8 do do
    la'16 re la re la re

    %13
    re,8 re re\mbreak
    si'16 re si re si re
    mi8 sol,\p sol

    %16
    r si si
    sol sol sol
    r si si

    %19
    sol4 r8
    R4.*19
    re'8 si4~

    %40
    si8 si16 la sol8
    re' si4~
    si8 si16 la sol8

    %43
    r la re,
    re sol sol,
    r re' re,

    %46
    r sol' sol,
    r re' re,
    re'16 sol re sol re sol\mbreak

    %49
    \footnote #' (-1 . 2) \markup\column\smaller {"Le sei battute seguenti sono state ricostruite perché mancanti"} sol re sol re sol re
    sol,8 sol sol
    r fad' fad

    %52
    sol, sol sol
    r fad' fad
    mi4 r8

    %55
    R4.*25
    mi16 sol mi sol mi sol
    mi la mi la mi la\mbreak

    %82
    mi do' mi, do' mi, do'
    si8 si si
    si do si

    %85
    si4 r8
    R4.*9
    sol8 mi4~

    %96
    mi8 mi16 re do8
    sol' mi4~
    mi8 mi16 re do8

    %99
    r re si
    sol4 r8
    R4.*20

    %121
    sol'16 do sol do sol do
    do,8 do do
    la'16 re la re la re

    %124
    re,8 re re\mbreak
    si'16 re si re si re
    mi8 sol,\p sol

    %127
    r si si
    sol sol sol
    r si si

    %130
    sol4.\fermata

}

IIIvcn = \relative do {

    \set fontSize = -3 do16 re mi re do si
    do8 do, r
    do'16 re mi re do si

    %4
    do8 do, r
    si'16 do re si la sol
    do4 r8

    %7
    R4.*3
    do8 do' do,
    fa, fa' fa,

    %12
    fa fa' fa,
    sol sol' sol,\mbreak
    sol sol' sol,

    %15
    do do'\p do,
    r sol' sol,
    do, do'' do,

    %18
    r sol' sol,
    \set fontSize = 0 \tuplet 3/2 { do'16 re mi la,[si do] fa, sol la }
    \tuplet 3/2 { re, mi fa  si,[do re]} sol,8\noBeam

    %21
    \tuplet 3/2 {
        si'16 do re sol,[la si] mi, fa sol
        do, re mi la,[si do]
    } fa,8\noBeam
    \tuplet 3/2 {
        la'16 si do fa,[sol la] re, mi fa\mbreak

        %24
        si, do re sol,[la si]
    } mi,8\noBeam
    mi'16 do' si do mi, do'
    fa, do' si do fa, do'

    %27
    re, si' la si re, si'
    mi, si' la si mi, si'
    do, la' sol la do, la'

    %30
    re, la' sol la re, la'
    si, sol' fa sol si, sol'
    do,4 r8

    %33
    mi'16 re do si la sol
    fad mi re do si la
    \once\stemUp sol8 si'16 do re8\mbreak

    %36
    r8 la16 si do8
    si16 re si sol la fad
    sol re si sol la re,

    %39
    sol8 \set fontSize = -3 si'16 la sol fad
    sol8 sol, r
    sol'16 la si la sol fad

    %42
    sol8 sol, r
    fad'16 sol la fad mi re
    sol4 r8

    %45
    R4.*3
    sol,8 sol' sol,
    sol sol' sol,

    %50
    sol sol' sol,
    r re'' re,
    sol, sol' sol,

    %53
    r re'' re,\set fontSize = 0
    sol,16 sol' fad sol si, sol'
    la, sol' fad sol la, fad'

    %56
    sol, re'' do re fad, re'
    mi, re' dod re mi, dod'
    re,4 r8

    %59
    \tuplet 3/2 { si'16 do? re sol,[la si] re, mi fa? }
    mi do' si do mi, do'\mbreak
    \tuplet 3/2 { la16 si do fad,[sol la] do, re mi }

    %62
    re si' la si re, si'
    \tuplet 3/2 { sol la si mi,[fad? sol] si, do re}
    do la' sol la do, la'

    %65
    si, do' si la sol fad
    sol fad mi8 r
    sol,16 mi'' mi mi sol,, mi''

    %68
    la,, mi'' mi mi la,, mi''
    fad,, re'' re re fad,, re''
    sol,, re'' re re sol,, re''\mbreak

    %71
    mi,, do'' do do mi,, do''
    fad,, do'' do do fad,, do''
    red,, si'' si si red,, si''

    %74
    mi,,4 r8
    mi''16 re re do do si
    si la la sol sol fad

    %77
    fad? mi mi red red dod
    dod? si si la la sol
    sol8 la si

    %80
    mi, \set fontSize = -3 mi' mi,
    la la' la,\mbreak
    la la' la,

    %83
    si si' si,
    mi la, si\set fontSize = 0
    mi mi' mi,

    %86
    do16 re si do la8
    re re' re,
    si16 do la si sol8

    %89
    do do' do,
    la16 si sol la fa8
    si si' si,

    %92
    do16 mi re fa mi sol
    fa la sol si la do
    si8 la sol\mbreak

    %95
    \set fontSize = -3  do,16 re mi re do si
    do8 do, r
    do'16 re mi re do si

    %98
    do8 do, r
    si'16 do re  si la sol\set fontSize = 0
    do'16 mi32 re do si la sol fa mi re do

    %101
    si16 re'32 do si la sol fa mi re do si
    la16 do'32 si la sol fa mi re do si la
    sol4 r8

    %104
    do'32 re do si la[si la sol] fa sol fa mi
    re4 r8
    si'32 do si la sol[la sol fa] mi fa mi re\mbreak

    %107
    do4 r8
    la'32 si la sol fa[sol fa mi] re mi re do
    si4 r8

    %110
    sol'32 la sol fa mi[fa mi re] do re do si
    la4 r8
    sol16 si' la si sol, si'

    %113
    sol, do' si do sol, do'
    sol, re'' do re sol,, re''
    sol, ,do' si do sol, do'\mbreak

    %116
    sol, si' la si sol, si'
    do8 si16 la sol fa
    mi8 re do

    %119
    fa sol sol,
    do4.
    \set fontSize = -3 do8 do' do,

    %122
    fa, fa' fa,
    fa fa' fa,
    sol sol' sol,\mbreak

    %125
    sol sol' sol,
    do do'\p do,
    r sol' sol,

    %128
    do, do'' do,
    r sol' sol,
    do4.\fermata

}

IIIbcn = \relative do {

    do16 re mi re do si
    do8 do, r
    do'16 re mi re do si

    %4
    do8 do, r
    si'16 do re si la sol
    do4 r8

    %7
    R4.*3
    do8 do' do,
    fa, fa' fa,

    %12
    fa fa' fa,
    sol sol' sol,\mbreak
    sol sol' sol,

    %15
    do do'\p do,
    r sol' sol,
    do, do'' do,

    %18
    r sol' sol,
    do la' fa
    re si sol

    %21
    sol' mi do
    la fa re
    fa' re si\mbreak

    %24
    sol mi do
    mi'4 mi8
    fa4 fa8

    %27
    re4 re8
    mi4 mi8
    do4 do8

    %30
    re4 re8
    si4 si8
    do16 re mi8 re

    %33
    do4.
    re
    sol,4 r8\mbreak

    %36
    fad4 r8
    sol re' re
    sol, re re

    %39
    sol'16 la si la sol fad
    sol8 sol, r
    sol'16 la si la sol fad

    %42
    sol8 sol, r
    fad'16 sol la fad mi re
    sol4 r8

    %45
    R4.*3
    sol,8 sol' sol,
    sol sol' sol,

    %50
    sol sol' sol,
    r re'' re,
    sol, sol' sol,

    %53
    r re'' re,
    sol,4 si8
    la4 la8

    %56
    sol4 fad'8
    mi4 mi8
    re fad re

    %59
    sol, sol' sol,
    do4 r8\mbreak
    fad, fad' fad,

    %62
    si4 r8
    mi, mi' mi,
    la4 r8

    %65
    si red red
    mi sol mi
    sol,4 sol8

    %68
    la4 la8
    fad4 fad8
    sol4 sol8\mbreak

    %71
    mi4 mi8
    fad4 fad8
    red4 red8

    %74
    mi sol mi
    do'' si la
    sol fad mi

    %77
    red dod si
    la sol fad
    sol la si

    %80
    mi, mi' mi,
    la la' la,\mbreak
    la la' la,

    %83
    si si' si,
    mi la, si
    mi4 r8

    %86
    do si la
    re4 r8
    si la sol

    %89
    do4 r8
    la sol fa
    si4 r8

    %92
    do re mi
    fa sol la
    sol4.\mbreak

    %95
    do,16 re mi re do si
    do8 do, r
    do'16 re mi re do si

    %98
    do8 do, r
    si'16 do re  si la sol
    do4 r8

    %101
    si4 r8
    la4 r8
    sol si sol

    %104
    do4 r8
    re do si
    sol'4 r8\mbreak

    %107
    do, si la
    fa'4 r8
    si, la sol

    %110
    mi'4 r8
    la, sol fa
    sol4 sol8

    %113
    sol4 sol8
    sol4 sol8
    sol4 sol8\mbreak

    %116
    sol4 sol8
    do4 r8
    do4 r8

    %119
    fa sol sol,
    do4.
    do8 do' do,

    %122
    fa, fa' fa,
    fa fa' fa,
    sol sol' sol,\mbreak

    %125
    sol sol' sol,
    do do'\p do,
    r sol' sol,

    %128
    do, do'' do,
    r sol' sol,
    do4.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4. = 60
    s4.*130
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
        title = \markup\smaller{Concerto per Violoncello [RV 398]}
        composer = \markup \center-column{"A. Vivaldi (1678 -1741)"}
    }

    \markup\huge "[1.] All[egr]o"

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

\bookpart {

    \paper  {

        systems-per-page = #7

    }

    \markup\huge "[2.] Largo"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.shortInstrumentName = "vc"
                \IIvc
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm
            #(layout-set-staff-size 17)


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

    \markup\huge "[3.] [Presto]"

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
