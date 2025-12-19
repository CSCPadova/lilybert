\language "italiano"
	%********************************** VARIABILI

\version "2.20.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down
soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tous"

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}

%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##f
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con
}


IvlIn = \relative do'' {

    si'4 si si
    si la la
    la sol mi

    %4
    do' do do
    do si si
    si la la

    %7
    si2 r4\fermata
    fad fad fad
    sol fa fa

    %10
    mi red mi~\mbreak
    mi mi4.-+ red8
    mi2.

}


IvlIIn = \relative do'' {

    sol'4 sol sol
    fad fad fad
    fad mi sol

    %4
    sol sol sol
    fad fad fad
    mi mi mi

    %7
    red2 r4\fermata
    red4 red red
    mi  do do

    %10
    si la sol~
    sol sol4. fad8
    mi2.

}


Icbn = \relative do {

    mi4 mi mi
    red red red
    mi mi mi

    %4
    mi mi mi
    re? re re
    do do do

    %7
    si2 r4\fermata
    si'4 si la
    sol la la

    %10
    sol fad sol
    la si si,
    mi2.

}


Ibcn = \relative do {

    mi4 mi mi
    red red red
    mi mi mi

    %4
    mi mi mi
    re? re re
    do do do

    %7
    si2 r4\fermata
    si'4 si la
    sol la la

    %10
    sol fad sol
    la si si,
    mi2.

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <5>2.
    <6 3>4 <5->  s
    <4 2> <5> s
    <6> s s
    <7> <6> s
    <7> <6> s
    <_+>2.
    <5 _+>4 s <6 4+>
    <6> <6- 3> s
    <6> <6+ 3> <6>
    <7 5> <6 4> <5 3+>

}


forma = {

    \key sol\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 60
    s2.*12
    \bar"||"

}


IvlI = {
    \Iglobal
    \notypeset
    <<\IvlIn \forma>>
}


IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##f
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 8  \con
}


IIvlIn = \relative do'' {

    sol'8 si mi,
    mi \tuplet 3/4 { mi32[fad sol] mi fad sol }
    \once\stemDown fad16 \once\stemUp si,, \tuplet 3/4 { fad''32[sol la] fad sol la }

    %4
    sol16 \once\stemUp mi, \tuplet 3/4 { sol'32[la si] sol la si }
    la16 \once\stemUp red,, \tuplet 3/4 { la''32[si do] la si do }
    si8 \tuplet 3/4 { la32[si do] fad, sol la }

    %7
    red,4 r8
    red4 r8
    red8 si' fad

    %10
    sol16 mi \tuplet 3/4 { sol32[la si] sol la si}
    fad16 si, \tuplet 3/4 { fad'32[sol la] fad sol la }
    sol16 mi \tuplet 3/4 { sol32[la si] sol la si }

    %13
    la16 re, \tuplet 3/4 { la'32[si do] la si do }
    si16 sol \tuplet 3/4 { si32[do re] si do re }
    mi,8. fad16 sol si,

    %16
    la4 sol8
    sol \tuplet 3/4 { sol'32[la si] sol la si }
    mi,16 la, \tuplet 3/4 { mi'32[fad sol] mi fad sol }

    %19
    red4 mi8\mbreak
    mi32 mi red mi mi[mi red mi] mi mi red mi
    mi32 mi red mi mi[mi red mi] mi mi red mi

    %22
    mi32 mi red mi mi[mi red mi] mi mi red mi
    mi4.\fermata

}


IIvlIIn = \relative do'' {

    si4 r8
    sol'4 r8
    si,4 r8

    %4
    si4 r8
    red,4 r8
    mi4 r8

    %7
    si4 r8
    si4 r8
    fad''4 r8

    %10
    mi4 r8
    si' r r
    si,4 r8

    %13
    re4 r8
    sol,4 r8
    sol'4 r8

    %16
    fad4 sol8
    sol r r\mbreak
    do,4 r8

    %19
    fad4 fad8
    sol4.~
    sol~

    %22
    sol8 fad8. fad16
    mi4.\fermata

}


IIcbn = \relative do {

    mi4 r8
    mi4 r8
    red4 r8

    %4
    mi4 r8
    fad4 r8
    sol, do la

    %7
    si \tuplet 3/4 { red32[mi fad] red mi fad }
    si,4 r8
    si4 r8

    %10
    sol'4 r8
    red4 r8\mbreak
    mi4 r8

    %13
    fad4 r8
    sol4 r8
    do,4 r8

    %16
    re4 re,8
    sol4 r8
    la4 r8

    %19
    si'4 si,8
    mi sol la
    si do sol

    %22
    la si si,
    mi4.\fermata

}


IIbcn = \relative do {

    mi4 r8
    mi4 r8
    red4 r8

    %4
    mi4 r8
    fad4 r8
    sol, do la

    %7
    si \tuplet 3/4 { red32[mi fad] red mi fad }
    si,4 r8
    si4 r8

    %10
    sol'4 r8
    red4 r8\mbreak
    mi4 r8

    %13
    fad4 r8
    sol4 r8
    do,4 r8

    %16
    re4 re,8
    sol4 r8
    la4 r8

    %19
    si'4 si,8
    mi sol la
    si do sol

    %22
    la si si,
    mi4.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <5 3>4.
    s
    <6>
    s
    <6+>
    <6>8 <6> <6>
    <_+>4.
    <_+>
    <_+>
    <6>
    <6>
    <5>
    <6>
    s <5>
    s
    s
    <5>
    <_+>
    <5>8 <6> <7 5>
    <6 4> <5> <6>
    <7 5> <4> <3>

}


forma = {

    \key sol\major
    \time 3/8
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 67
    s4.*8
    \bar":..:"\break
    s4.*15
    \bar":|."

}


IIvlI = {
    \IIglobal
    \notypeset
    <<\IIvlIn \forma>>
}


IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##f
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con
}


IIIvlIn = \relative do'' {

    r4 r8 si mi mi mi mi
    fad si, fad'[fad] sol si, sol'[sol]
    la si, la'[la] si4 la16 sol fad mi

    %4
    red8 si mi4 mi4.-+ red8
    mi fad sol sol16 la si8 si si si
    lad4 lad8 lad si lad si[si]\mbreak

    %7
    dod4 dod8 dod re re re4
    dod re8 re, dod dod16 re mi8 dod
    re mi fad fad sol sol sol sol

    %10
    la fad la la sol fad sol si
    la fad la do si si do16 si la sol
    fad4 mi8 si' la4. si16 la

    %13
    sol8 la si la\mbreak la sol16 fad sol4~
    sol8 la16 sol fad4. sol16 fad mi4~
    mi8 fad16 mi red8 fad mi4 lad,8 si

    %16
    dod si dod dod si4 si8. lad16
    si4 r8 mi, si' si si si
    dod fad, dod'[dod] re fad, re'[re]\mbreak

    %19
    mi fad, mi'[mi] fad4 mi16 re? dod si
    lad8 fad si4 si4. lad8
    si do red red sol sol sol fad16 mi

    %22
    red4 red8 red mi red mi[mi]
    fad red fad[fad] sol sol fad16 mi red  do
    si8 fad' sol la16 sol fad8 la sol[fad]\mbreak

    %25
    sol sol sol fad16 mi re8 re re re
    mi fad mi mi re fad fad fad
    mi fad sol sol fad fad sol16 fad mi re

    %28
    dod8 lad si[re] dod mi re[dod]
    si4 si'8 la sol4 si
    lad8 si si[lad] si16 lad sold fad mid8 fad

    %31
    sold mid16 red dod8 dod si4 la?
    sol?8 la si[si'] si4 la
    sol8 si la8. sol16 fad8 sol fad8. fad16

    %34
    mi4 r8 si mi mi mi mi
    fad si, fad'[fad] sol si, sol'[sol]
    la si, la'[la] si4 la16 sol fad mi

    %37
    red8 si mi4 mi4.-+ red8
    mi la sol fad sol sol sol fad16 mi
    red8 red red red mi red mi mi

    %40
    fad red fad[mi] red si mi[fad]
    fad8. fad16 mi8 sol fad la sol[fad]
    sol16(la si la) sol (si la sol) fad(sol la sol) fad la sol fad

    %43
    mi(fad sol fad) mi sol fad mi red(mi fad mi) red fad mi red
    mi4\staccatissimo  si\staccatissimo la\staccatissimo la\staccatissimo
    si\staccatissimo si'\staccatissimo si\staccatissimo la\staccatissimo

    %46
    la sol sol8 fad mi4
    red8 mi mi8. red16 mi4. mi8
    fad sol16 fad mi4. mi8 re4

    %49
    dod lad8 lad' lad dod si[lad]\mbreak
    si4. si8 si lad16 sold lad8. lad16
    si4. la!8 sol4 si8 re

    %52
    do si16 la sol8 si do16 si la sol fad8. fad16
    mi4 r8 si mi mi mi[mi]
    fad si, fad'[fad] sol si, sol'[sol]

    %55
    la si, la'[la] si4 la16 sol fad mi
    red8 si mi4 mi4. red8
    mi sol fad mi re? re re re

    %58
    mi lad, lad'[lad] si lad si[si]
    dod dod dod dod re re re4
    dod re8 re, dod[mi] re  dod

    %61
    re mi fad fad sol sol sol sol
    la fad la la\mbreak sol fad sol la
    la fad la[do] si si do16 si la sol

    %64
    fad8. fad16 mi si' do si la8 do si8. la16
    sol8 sol la[sol] fad4. fad8
    sol\p [sol] la sol fad4. fad8

    %67
    do'\f si la sol fad mi red mi
    si si'\p si la\mbreak la\f sol fad8. fad16
    sol8\p fad mi re do si la sol

    %70
    fad fad' sol fad16 mi red8 mi mi8. red16
    mi1\fermata

}


IIIvlIIn = \relative do'' {

    R1*4
    r4 r8  mi, si' si si si
    dod fad, dod' dod re fad, re' re

    %7
    mi fad, mi' mi fad4 mi16 re dod si\mbreak
    lad8 fad si4 si4. lad8
    si do red red mi mi mi mi

    %10
    red red red red mi red mi mi
    fad red fad[mi] red16 mi fad sol la4~
    la8 si16 la sol8 la16 sol fad4. fad8\mbreak

    %13
    mi4. fad16 (mi) red4 r8 si
    do si do re16 do si8 la si do16 si
    la8 sol la si16 la sol8 fad mi re

    %16
    dod4 mi re dod8. dod16
    si4 r r2
    R1*3

    %21
    r4 r8 si' mi mi mi mi
    fad si, fad'[fad] sol si, sol'[sol]
    la si, la'[la] si4 la16 sol fad mi

    %24
    red8 si mi4 mi4. red8
    mi fad sol sol fad fad fad fad
    lad, lad lad lad\mbreak si lad si si

    %27
    dod dod dod si lad16 si dod re mi4~
    mi8 mi re si mi sol fad8. mi16
    re8 mi fad2 mi8 re

    %30
    dod re dod8. dod16 si4 si~
    si la8 sol \mbreak fad4. fad'8
    fad4 mi mi8 sol fad[red]

    %33
    mi4. mi8 red mi mi8. red16
    mi8 si mi[fad] sol sol sol fad16 mi
    red8 red red red mi red mi mi

    %36
    fad red fad fad\mbreak sol mi fad16 mi red dod
    si red mi fad sol8 la16 sol fad8 la sol[fad]
    sol fad16 mi red8 red16 dod si8 si si si

    %39
    la fad la la si si si si
    do fad, do' do\mbreak si si' si la
    la8. la16 sol8 si la do si8. la16

    %42
    sol4 r r2
    sol16(la si la) sol si la sol fad(sol la sol) fad la sol fad
    sol4\staccatissimo mi\staccatissimo red\staccatissimo red\staccatissimo

    %45
    mi mi fad fad\mbreak
    fad mi do'8. si16 si8 la
    la sol fad8. fad16 mi re dod si lad8 si

    %48
    dod4. dod8 dod4 si
    lad8 fad fad'4 fad4. sol8
    fad4. sol16 fad mi4. fad16 mi

    %51
    re4 fad2 mi4~\mbreak
    mi8 fad mi2 mi8. red16
    mi4 r r2

    %54
    R1*3
    r4 r8 mi, si' si si si
    dod fad, dod' dod re fad, re' re

    %59
    mi fad, mi' mi fad4 mi16 re dod si
    lad8 fad si4\mbreak si4. lad8
    si do red red mi mi mi mi

    %62
    red red red red mi red mi mi
    fad red fad mi red16 mi fad sol la4~
    la16 la si la sol sol la sol fad8 la sol[fad]\mbreak

    %65
    mi mi red [mi] si4. si8
    si mi red mi si4. si'16(la)
    sol8 fad mi[re] do si la[sol]

    %68
    fad fad' sol fad16 mi red8 mi mi8. red16
    mi8 si' la[sol]\mbreak fad mi red mi
    si si' si la la sol fad8. fad16

    %71
    mi1\fermata

}


IIIcbn = \relative do {

    R1*8
    r4 r8 si mi mi mi mi
    fad si, fad' fad sol si, sol' sol

    %11
    la si, la' la si4 la16 sol fad mi
    red8 si mi4 mi4. red8
    mi fad sol la\mbreak si la si sol

    %14
    la sol la fad sol fad sol mi
    fad mi fad red mi re? dod[si]
    lad sold lad fad si mi fad[fad,]

    %17
    si4 r r2
    R1*7
    r4 r8 mi\mbreak si' si si si

    %26
    dod fad, dod' dod re fad, re' re
    mi fad, mi'[mi] fad4 mi16 re dod si
    lad8 fad si4 si4. lad8

    %29
    si dod re si mi fad sol mi\mbreak
    fad si, fad'[fad,] si la sold[fad]
    mid dod fad mi \clef bass \key mi\minor red dod red si

    %32
    mi fad sol mi la sol la si
    do sol la fad si mi, si'[si,]
    mi4 r r2\mbreak

    %35
    R1*3
    r4 r8 si mi mi mi mi
    fad si, fad' fad sol si, sol' sol

    %40
    la si, la' la si4 la16 sol fad mi
    red8 si mi4 mi4. red8
    mi4 r r2

    %43
    R1\mbreak
    sol16 la si la sol si la sol fad sol la sol fad la sol fad
    mi fad sol fad mi sol fad mi red mi fad mi red fad mi red

    %46
    mi red mi fad sol fad sol mi\mbreak la sol la si do si do la
    si8 mi, si'[si,] mi re do[si]
    lad4. lad8 si dod re[mi]

    %49
    fad4. fad8 mi4. mi8
    re4. re8 dod4. dod8\mbreak
    si8 si' re si mi mi, sol mi

    %52
    la red, mi[sol] la fad si[si,]
    mi4 r r2
    R1*7

    %61
    r4 r8 si mi mi mi mi
    fad si, fad' fad sol si, sol' sol\mbreak
    la si, la' la si4 la16 sol fad mi

    %64
    red8 si mi4 mi4. red8
    mi mi' fad mi red si red si
    mi mi fad mi red si red si\mbreak

    %67
    mi re! do si la sol fad mi
    red si mi[la] si mi, si'[si,]
    \clef bass\key mi\minor mi re do si la sol fad mi

    %70
    red si' mi[la] si mi, si'[si,]\mbreak
    mi1\fermata

}


IIIbcn = \relative do {

    R1*8
    r4 r8 si mi mi mi mi
    fad si, fad' fad sol si, sol' sol

    %11
    la si, la' la si4 la16 sol fad mi
    red8 si mi4 mi4. red8
    mi fad sol la\mbreak si la si sol

    %14
    la sol la fad sol fad sol mi
    fad mi fad red mi re? dod[si]
    lad sold lad fad si mi fad[fad,]

    %17
    si4 r r2
    R1*7\mbreak
    \clef tenor \key mi\minor r4 r8 mi si' si si si

    %26
    dod fad, dod' dod re fad, re' re
    mi fad, mi' mi fad4 mi16 re dod si
    lad8 fad si4 si4. lad8

    %29
    si dod re si mi fad sol mi\mbreak
    fad si, fad'[fad,] si la sold[fad]
    mid dod fad mi \clef bass \key mi\minor red dod red si

    %32
    mi fad sol mi la sol la si
    do sol la fad si mi, si'[si,]
    mi4 r r2\mbreak

    %35
    R1*3
    r4 r8 si mi mi mi mi
    fad si, fad' fad sol si, sol' sol

    %40
    la si, la' la si4 la16 sol fad mi
    red8 si mi4 mi4. red8
    mi4 r r2

    %43
    R1\mbreak
    sol16 la si la sol si la sol fad sol la sol fad la sol fad
    mi fad sol fad mi sol fad mi red mi fad mi red fad mi red

    %46
    mi red mi fad sol fad sol mi\mbreak la sol la si do si do la
    si8 mi, si'[si,] mi re do[si]
    lad4. lad8 si dod re[mi]

    %49
    fad4. fad8 mi4. mi8
    re4. re8 dod2\mbreak
    si8 si' re si mi mi, sol mi

    %52
    la red, mi[sol] la fad si[si,]
    mi4 r r2
    R1*7

    %61
    r4 r8 si mi mi mi mi
    fad si, fad' fad sol si, sol' sol\mbreak
    la si, la' la si4 la16 sol fad mi

    %64
    red8 si mi4 mi4. red8
    mi\clef tenor\key mi\minor mi' fad mi red si red si
    mi mi fad mi red si red si\mbreak

    %67
    mi re! do si la sol fad mi
    red si mi[la] si mi, si'[si,]
    \clef bass\key mi\minor mi re do si la sol fad mi

    %70
    red si' mi[la] si mi, si'[si,]\mbreak
    mi1\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*8
    s4 s8 <_+> <3>2
    <6+>4 <6+> <6> <6>
    <6> <6>8 <5> <5 _+>4 <5 3>
    <5>8 <7> <3>4 <4 2>4. <5->8
    <5 3>4 <6> <_+> <6>8 <6>
    <7>4 <6>8 <6 5-> <7>4 <6>8 <6 5>
    <7>4 <6+>8 <6 5-> <5>4 <6 +>
    <6> <5->8 <7 5> <5> <7 5> <4> <3>
    s1*8
    s4 s8 <3> <5 _->2
    <6+>8 <_+> <6+> s <6>4 <6 _+>
    <6+>8 <_+> <6+> <5> <5 _+>4 <3>
    <5>8 <7 _+> <5>4 <4 2 _+>4 <6>8 <5>
    <5>4 <6> <9> <6>8 <7 5>
    <_+> <5> <4> <3> <5> s <6+>4
    <5>8 <7> <5>4 <6> <5>8 <7 5>
    <9>4 <6> <9> <6>8 <7 _+>
    <5> <6> <5> <7> <_+> s <4> <3>
    s1*4
    s4 s8 <_+> <5 3>2
    <6+>8 <_+> <6+>4 <6> <6>
    <6>8 <_+> <6> <5> <_+>4 s
    <5>8 <7 5> <5 3>4 <4 2>4 <6>8 <5>
    <5>1
    s
    <6>4 <6> <6+> <6+>4
    <5>8 <6> s16 <6> s8 <6>4 <5>
    <4 2> <6> <7>8 <6> <7> <6>
    <7 _+> <5> <4> <3+> <5> <6> <_+> <6>
    <6>4 <5> <4 2> <6>8 <7 5>
    <5 _+>2 <4+ 2>
    <6> <7>4 <6+>
    <5> <6>8 <7 5> <9> <_-> <6> <7>
    <5> <6>16 <5> <5>8 <6> <6 5> <7> <4> <3+>
    s1*8
    s4 s8 <_+> <5>2
    <6+>8 <5> <6+>4 <6> <6>
    <6>8 <5> <6>4 <5 _+> <5>
    <5>8 <7 5> <5>4 <4 2> <6>8 <5>
    <5>4 <6+>8 <5>  <6> <5> <6> <5>
    <5>4 <6+>8 <5> <6> <5> <6> <5>
    <6> <6> <6> <6> <6> <6> <6+> <5>
    <6> <5> <5 3> <6 5> <7 _+>  <5> <4> <3>
    <5> <6> <6> <6> <6> <6> <6+> <5>
    <6> <5> <5 3> <6 5> <7 _+> <5> <4> <3>

}


forma = {

    \key mi\minor
    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 57
    s1*71
    \bar"||"

}


IIIvlI = {
    \IIIglobal
    \notypeset
    <<\IIIvlIn \forma>>
}


IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##f
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con
}


IVvlIn = \relative do'' {

    fad8
    mi8. mi16 red8. red16 mi8. sol16 fad8. mi16
    red8 red ,? r sol' sol8. sol16 fad8. fad16\mbreak
    sol8. si16 la8. sol16 fad8 fad, r fad'

    %4
    la8. la16 si8. sol16 sol8. sol16 sol8. fad16
    sol4 r8 sol \p mi8. fad16 sol8. mi16
    fad8. sol16 sol8. fad16 sol4 r8 fa

    %7
    fa?8. fa16 fa8. mi16 red8. mi16 mi8. red16
    mi4 r8 fa\p fa8. fa16 fa8. mi16\mbreak
    red8. mi16 mi8. red16 mi8. sol16 fad?8. fad16

    %10
    mi8. mi16 re?8. re16 dod8. re16 dod8. dod16
    si8. fad'16 si8. dod,16 re8. re16 mi8. mi16
    fad8. fad16 sol8. sol16 fad8 fad, r si

    %13
    do'!8.\p si16 do8 si lad8. si16 si8. lad16
    si8 si, r lad'\f\mbreak si8. lad16 si8. dod16
    re8 la? r la la8. la16 la8. sold16

    %16
    la4 r8 dod, \p dod8. do16 si8. si16
    la4 r8 sold'\f la8. sold16 mi8. fad16
    fad4 mi8. re16 dod8. re16 dod8. dod16

    %19
    si8. re16 si8. lad16\mbreak si8. si'16 si8. lad16
    si4 r8 mi, mi8. la,?16 la8. sold16
    la8. mi'16 red8. si'16 si8. mi,16 mi8. red16

    %22
    mi8 sol^\markup\italic"Largo" sol[fad] mi4.-+ mi8
    red1\fermata

}


IVvlIIn = \relative do'' {

    si8
    sol8.[sol16 la8. la16] si8.[si16 do8. do16]
    si8 si, r si' si8.[si16 do8. do16]
    re8.[re16 mi8. mi16] re8 re, r re'

    %4
    re8.[re16 re8. re16] mi16(re do si) la8. la16
    sol4 r8 re'\p re8.[re16 do8. do16]
    do8.[si16 la8. la16]\mbreak sol4 r8 do

    %7
    do8.[si16 la8. la16] la8.[sol16 fad8. fad16]
    mi4 r8 do'\p do8. si16 la8. la'16
    la8.[sol16 fad8. fad16] mi8.[si'16 lad8. si16]

    %10
    si8. lad16 si8. si,16 lad8. si16 si8. lad16
    si4 r8 lad' si8. si16 lad8. lad16\mbreak
    si8. si16 dod8. si16 lad8 lad, r fad'\p

    %13
    sol8. fad16 sol8. fad16 mi8. re16 dod8. dod16
    si8 si, r dod'\f re8. dod16 re8. mi16
    fad8 fad, r mi' mi8. re16 do8. si16

    %16
    la4 r8 la\p la la la8. sold16\mbreak
    la4 r8 si\f dod8. si16 dod8. lad16
    si4. sol'8 lad, si si8. lad16

    %19
    si8. fad'16 fad8. fad16 mi8. re16 dod8. dod16
    si4 r8 do! si8. do16 do8. si16
    la8. si16 la8. sol16 fad!8. sol16 fad8. fad16\mbreak

    %22
    mi8 si'^\markup\italic"Largo" si si si do16 si la8. si16
    si1\fermata

}


IVcbn = \relative do {

    si8
    mi8. mi16 fad8. fad16 sol8. sol16 la8. la16
    si8 si, r sol'\mbreak sol8. sol16 la8. la16
    si8. si16 do8. do16 re8 re, r re

    %4
    fad8. re16 sol8. si,16 do8. la16 re8. re,16
    sol4 r8 si\p do8. re16 mi8. do16
    re8. sol,16 re'8. re,16 sol4 r8 la\mbreak

    %7
    la8. la16 la8. la16 si8. mi16 si'8. si,16
    mi4 r8 la\p la8. la16 la8. la16
    si8. mi,16 si'8. si,16 mi8. mi16 mi8. re16

    %10
    dod8. dod16 si8. mi16 fad8. si,16 fad'8. fad,16\mbreak
    si4. fad'8 si8. si16 dod8. dod16
    re8. re16 mi8. mi16 fad8 fad, r8 re'\p

    %13
    mi8. re16 mi8. re16 dod8. si16 fad'8. fad,16
    si8. si,16 r8 fad'\f si8. fad16 si8. la16
    re8 re, r dod re8. si16 mi8. mi,16\mbreak

    %16
    la4 r8 dod\p re8. red16 mi8. mi,16
    la4 r8 mi'\f la8. mi16 la8. fad16
    sol!4. mi8 fad8. si,16 fad'8. fad,16

    %19
    si8. si'16 re8. fad,16 sol8. mi16 fad8. fad,16
    si'4. la8 sold8. la16 re,8. mi16\mbreak
    la8. sol!16 fad8. mi16 red8. la'16 si8. si,16

    %22
    mi4. ^\markup \italic"Largo" re8 do2
    si1\fermata

}


IVbcn = \relative do {

    si8
    mi8. mi16 fad8. fad16 sol8. sol16 la8. la16
    si8 si, r sol'\mbreak sol8. sol16 la8. la16
    si8. si16 do8. do16 re8 re, r re

    %4
    fad8. re16 sol8. si,16 do8. la16 re8. re,16
    sol4 r8 si\p do8. re16 mi8. do16
    re8. sol,16 re'8. re,16 sol4 r8 la\mbreak

    %7
    la8. la16 la8. la16 si8. mi16 si'8. si,16
    mi4 r8 la^\p la8. la16 la8. la16
    si8. mi,16 si'8. si,16 mi8. mi16 mi8. re16

    %10
    dod8. dod16 si8. mi16 fad8. si,16 fad'8. fad,16\mbreak
    si4. fad'8 \clef tenor \key mi\minor  si8. si16 dod8. dod16
    re8. re16 mi8. mi16 fad8 fad, r8 re'^\p

    %13
    mi8. re16 mi8. re16 dod8. si16 fad'8. fad,16
    si8. si,16 r8 fad'^\f si8. fad16 si8. la16
    re8 re, r \clef bass \key mi\minor dod re8. si16 mi8. mi,16\mbreak

    %16
    la4 r8 dod^\p re8. red16 mi8. mi,16
    la4 r8 mi'\f la8. mi16 la8. fad16
    sol!4. mi8 fad8. si,16 fad'8. fad,16

    %19
    si8. si'16 re8. fad,16 sol8. mi16 fad8. fad,16
    si'4. la8 sold8. la16 re,8. mi16\mbreak
    la8. sol!16 fad8. mi16 red8. la'16 si8. si,16

    %22
    mi4. ^\markup \italic"Largo" re8 do2
    si1\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <_+>8
    s4 <6+> <6> <6>8. <5>16
    <_+>4 s s <6>
    <6> <6>8. <5>16 <5>4 s
    <6> <5>8. <6>16 <6 5>8. <7>16 <4>8. <3+>16
    s2 <9>4 <6>
    <7>8. <5>16 <4>8. <3+>16 s4 s8 <6->
    s4 <6>8. <5>16 <7 _+>4 <4>8. <3+>16
    s4 s8 <6-> s4 <6->8. <5>16
    <7 _+>8. <5>16 <4>8. <3+>16
    <5>4 <4+ 2>8. <6>16
    <7>8. <6+>16 s8. <7 5>16 <7 _+>8. <5>16 <4>8. <3+>16
    s4. <5 _+>8 s4 <6+>
    <6> <6+>8.  <5>16 <5 _+>4 s8 <6>
    <6->8. <6>16 <6->8. <6>16 <6+>4 <4>8. <3+>16
    <5>4 s8 <_+> <5>8. <_+>16 <5>8. <5 _+>16
    <5>4 s8 <6> <9 3>8. <7>16 <6 4>8. <5 3+>16
    <_+>4 s8 <6> <7 5>8. <7- 5>16 <4>8. <3+>16
    s2 <5 _+>8. <_+>16 <5>8. <_+>16
    <7>4 <6>8 <7 3> <5 _+>4 <4>8. <3+>16
    <5>4 <6>8. <5 _+>16 <6>8. <7 5>16 <4>8. <3+>16
    s4. <5 3->8 <6>8. <5->16 <7 5>8. <5 _+>16
    <_->8. <6>16 <6+>8. <5>16<6>8. <5>16 <4>8. <3+>16
    s4. <6>8 <7>4 <6>
    <_+>1

}


forma = {

    \key mi\minor
    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 75
    \partial 8 s8
    s1*23
    \bar"||"

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##f
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 8 \con
}


VvlIn = \relative do'' {

    r8 si \tuplet 3/4 { mi32 [fad mi] mi fad mi }\mbreak fad8 si, r fad'
    \tuplet 3/4 { sol32 la sol sol[la sol] } fad8 si, r fad' \tuplet 3/4 {si32[do si] si do si }
    la4.-+ si16 red, mi8 fad16 mi red8. mi16

    %4
    mi8 sol \tuplet 3/4 {re32 mi re re[mi re] } mi8 lad, fad[mi']\mbreak
    \tuplet 3/4 {  fad32 sol fad fad[sol fad] }  mi8 lad, fad mi' \tuplet 3/4 { re32[mi re] re mi re }
    dod4. re16 dod re8 mi16 re dod8. re16

    %7
    re8 fad \tuplet 3/4 { sol32[la sol] sol la sol } la8 fad red[la']
    \tuplet 3/4 { si32 do si si[do si]  } la8 fad\mbreak red la' \tuplet 3/4 { red,32 mi red red [mi red] }
    mi4. red8 si4. si8

    %10
    si la si[si'] si4 la~
    la8 sol fad8. fad16 mi8 si' lad[si]
    fad4 mi2 re4

    %13
    si8 lad si[dod]\mbreak lad si si8. lad16
    si8 mi, \tuplet 3/4 { si'32[dod si] si dod si } dod8 fad, r dod'
    \tuplet 3/4 { re32 mi re re[mi re] } dod8 fad, r dod' \tuplet 3/4 { fad32[sol fad] fad sol fad }

    %16
    mi4. fad16 lad,\mbreak si8 dod16 si lad8. si16
    si8 red \tuplet 3/4 { sol32[la sol] sol la sol } la8 red, si[la']
    \tuplet 3/4 { si32 do si si[do si] } la8 red, si[la'] \tuplet 3/4 { sol32[la sol] sol la sol }

    %19
    fad4. sol16 fad\mbreak sol8 la16 sol fad8. sol16
    sol8 si, \tuplet 3/4 { re32[mi re] re mi re } mi8 dod lad[mi']
    \tuplet 3/4 { fad32 sol fad fad[sol fad]} mi8 dod lad[mi'] \tuplet 3/4 { lad,32[si lad] lad si lad }

    %22
    si4 si'8 fad fad mi16 re dod8. si16\mbreak
    si8 dod\p si[si] lad si si8. lad16
    si4. si'8 si4 la

    %25
    sold8_\markup {[\musicglyph #"p"]} la la8. sold16 la8_\markup {[\musicglyph #"f"]} fad4 mi8~
    mi red4 dod si la8
    si si' sol[sol] fad sol fad8. fad16

    %28
    mi4 r r2
    R1*2\mbreak
    r8 mi, \tuplet 3/4 { si'32[dod si] si dod si } dod8 fad, r dod'

    %32
    \tuplet 3/4 { re32 mi re re[mi re] } dod8 fad, r dod' \tuplet 3/4 {  fad32[sol fad] fad sol fad }
    mi4. fad16 lad, si8 dod16 si lad8. si16
    si8 fad' \tuplet 3/4 { sol32 la sol sol[la sol] } la8 fad red[la']\mbreak

    %35
    \tuplet 3/4 { si32 do si si[do si] } la8 fad red la' \tuplet 3/4 { red,32 mi red red[mi red] }
    mi4. red8 si4 r8 si'\f
    mi, si mi8. fad16 \tupletSpan 4 \senza \tuplet 3/4 {  sol16 la sol fad[sol fad] }

    %38
    mi8 r r4 sol r
    mi8 si _\markup {[\musicglyph #"p"]} sol'8. si16 \tuplet 3/4 { si16 do si la[si la] }
    sol8 r r4 re_\markup {[\musicglyph #"f"]} r\mbreak

    %41
    sol8 re si'[do] \tuplet 3/4 { re16 mi re do[re do]
    si do si la[si la] sol la sol sol[la sol]}
    fad8. re16 sol8 si, la si la8. la16

    %44
    sol8 re'\p si' [do]\tuplet 3/4 { re16 mi re do[re do]
    si do si la[si la] sol la sol sol[la sol]}\mbreak
    fad8. re16 sol8 si, la si la8. la16

    %47
    sol8 sol' la4 la r8 la
    la8.[la16 sol8. sol16] la8 sol la4~
    la8 sol fad8. fad16 mi8. mi16 mi8. red16

    %50
    mi8 si \tupletSpan 8 \con \tuplet 3/4 { mi32 fad mi mi[fad mi] } fad8 si, r fad'
    \tuplet 3/4 { sol32 la sol sol[la sol] } fad8 si,\mbreak r fad' \tuplet 3/4 { si32 do si si[do si] }
    la4. si16 red, mi8 fad16 mi red8. mi16

    %53
    mi8 sol \tuplet 3/4 { re32 mi re re[mi re] } mi8 lad, fad[mi']
    \tuplet 3/4 { fad32 sol fad fad[sol fad] } mi8 lad, fad[mi'] \tuplet 3/4 { re32 mi re re[mi re] }
    dod4. re16 dod\mbreak re8 mi16 re dod8. re16

    %56
    re8 fad \tuplet 3/4 { sol32 la sol sol[la sol] } la8 fad red[la']
    \tuplet 3/4 { si32 do si si[do si] } la8 fad red[la'] \tuplet 3/4 { red,32 mi red red[mi red] }
    mi4. red8 si4 r8 si'

    %59
    mi,8 si' la8. la16 sol la fad sol mi fad re mi\mbreak
    do re si do la si sol la fad8. fad'16 mi8. mi16
    red8 mi mi8. red16 mi8 si la\p[sol]

    %62
    fad mi red\noBeam r16 la' la8. la16 sol8. sol16
    fad8^\markup\italic"Largo" si16 la sol8 la16 sol fad4. fad8
    mi1\fermata

}


VvlIIn = \relative do'' {

    R1*3
    r8 mi, \tuplet 3/4 {si'32 dod si si[dod si]} dod8 fad, r dod'
    \tuplet 3/4 { re32 mi re re[mi re]} dod8 fad, r dod' \tuplet 3/4 {fad32 sol fad fad[sol fad]}\mbreak

    %6
    mi4. fad16 lad, si8 dod16 si lad8. si16
    si8 red mi[mi] red4 r8 red
    si sol red4 r8 red' fad[fad]

    %9
    la si do fad, sol la16 sol fad8. sol16
    sol8 fad  mi re do red mi fad\mbreak
    red mi mi8. red16 mi8 fad mi[re]

    %12
    dod2. si8 fad'
    fad4 mi4. re8 dod8. dod16
    si4 r r2

    %15
    R1*2
    r8 si \tuplet 3/4 { mi32 [fad mi] mi fad mi }\mbreak fad8 si, r fad'
    \tuplet 3/4 { sol32 la sol sol[la sol] } fad8 si, r fad' \tuplet 3/4 {si32[do si] si do si }

    %19
    la4. si16 red, mi8 fad16 mi red8. mi16
    mi8 mi si'8. si16 lad4 r8 lad
    si8. si16 lad4 r8 lad dod,8. dod16

    %22
    mi8 fad sol[dod,] re mi mi8. re16
    re8 fad\p mi4\mbreak mi8 re dod8. dod16
    si8 mi fad mi16 re dod8 mi16 re dod8. dod16

    %25
    si8\p dod si8. si16 la8\f la' si4
    la sold fad mi
    red8 fad mi[mi] red mi mi8. red16

    %28
    mi8 si \tuplet 3/4 { mi32 [fad mi] mi fad mi }\mbreak  fad8 si, r fad'
    \tuplet 3/4 { sol32 la sol sol[la sol] } fad8 si, r fad' \tuplet 3/4 {si32[do si] si do si }
    la4. si16 red, mi8 fad16 mi red8. mi16

    %31
    mi8 sol \tuplet 3/4 {re32 mi re re[mi re] } mi8 lad, fad[mi']\mbreak
    \tuplet 3/4 {  fad32 sol fad fad[sol fad] }  mi8 lad, fad mi' \tuplet 3/4 { re32[mi re] re mi re }
    dod4. re16 dod re8 mi16 re dod8. si16

    %34
    si8 red mi[mi] red4 r8 red
    si sol red4 r8 red' fad[fad]
    la si do fad, sol la16 sol fad8. sol16\f

    %37
    sol8 sol, sol'8. la16 \senza \tuplet 3/4{si16 do si la[si la]}
    sol8 r r4\mbreak si,4\p r
    sol'8 sol\p si8. do16 \tuplet 3/4{re16 mi re do[re do]}

    %40
    si8 r r4 sol\f r
    re4 r8 sol sol4 la
    re,2 re4 dod

    %43
    re r8 sol, fad sol sol8. fad16
    sol4 r8 sol'\p sol4 la
    re,2 re4 dod

    %46
    re r8 sol, fad sol sol8. fad16\mbreak
    sol16  sol' fad mi red8 mi fad mi fad4~
    fad mi8 re! mi re mi[fad]

    %49
    red mi mi8. red16 mi8 sol, fad8. fad16
    mi4 r r2
    R1*2

    %53
    r8 mi \tuplet 3/4 {si'32 dod si si[dod si]} dod8 fad, r dod'
    \tuplet 3/4 { re32 mi re re[mi re]} dod8 fad, r dod' \tuplet 3/4 {fad32 sol fad fad[sol fad]}\mbreak
    mi4. fad16 lad, si8 dod16 si lad8. si16

    %56
    si8 red mi[mi] red4 r8 red
    si sol red4 r8 red' fad[fad]
    la si do fad, sol la16 sol fad8. sol16

    %59
    sol8 sol fad8. fad16 mi8 si' la[sol]\mbreak
    fad mi red\noBeam r16 la' la8. la16 sol8. sol16
    fad8 sol fad8. fad16 sol la fad sol mi\p fad re mi

    %62
    do re si do la si sol la fad8. fad16 mi8. mi16
    red4^\markup\italic"Largo" mi2 red4
    mi1\fermopz

}


Vcbn = \relative do {

    R1*6
    r8 si \senza \tuplet 3/4 { mi32 fad mi mi[fad mi]  } fad8 si, r fad'
    \tuplet 3/4 {  sol32 la sol sol[la sol] } fad8 si,\mbreak r fad' \tuplet 3/4 {  si32 do si si[do si] }

    %9
    la4. si16 red, mi8 fad16 mi red8. mi16
    mi red mi fad sol fad sol mi la sol la si do si do la
    si la si mi, si' dod red si\mbreak mi, fad re mi dod re si dod

    %12
    lad sold lad si dod si dod lad si lad si dod re dod re si
    mi re mi fad sol fad sol mi fad mi fad si, fad' sold lad fad\mbreak
    si,4 r r2

    %15
    R1*5
    r8 mi \tuplet 3/4 { si'32 dod si si[dod si] } dod8 fad, r dod'
    \tuplet 3/4 { re32 mi re re[mi re]  } dod8 fad, r dod' \tuplet 3/4 { fad32 sol fad fad[sol fad]  }

    %22
    mi4. fad16 lad, si8 dod16 si fad8. si16\mbreak
    si8 fad\p sol[mi] fad si, fad'[fad,]
    si' dod re[sold,] la sold la[re,]

    %25
    mi\p la, mi'[mi,] la'\f re sold,[dod]
    fad, si mi,[la] red, sold dod,[fad]
    si, red mi[la]\mbreak si8 mi, si'[si,]

    %28
    mi4 r r2
    R1*5
    r8 si \senza \tuplet 3/4 { mi32 fad mi mi[fad mi]  } fad8 si, r fad'

    %35
    \tuplet 3/4 {  sol32 la sol sol[la sol] } fad8 si,\mbreak r fad' \tuplet 3/4 {  si32 do si si[do si] }
    la4. si16 red, mi8 fad16 mi red8. mi16\f
    mi4 r mi r

    %38
    mi8\p si mi8. fad16 \tuplet 3/4 { sol16 la sol fad[sol fad]}
    mi4\f r sol r
    sol8 re sol8.\f la16 \tuplet 3/4 { si do si la[si la]}

    %41
    sol4 r8 sol,\mbreak si si' la,[la']
    sol, sol' fad,[fad'] mi,4 r8 mi'
    re4 r8 do re sol, re'[re,]

    %44
    sol4 r8 sol\p si si' la,[la']
    sol, sol' fad,[fad'] mi,4 r8 mi'
    re4 r8 do\mbreak re sol, re' [re,]

    %47
    sol sol' fad mi red dod red si
    mi fad sol si, do! si do[la']
    si mi, si'[si,] mi lad, si[si]

    %50
    mi4 r r2
    R1*5\mbreak
    r8 si \senza \tuplet 3/4 { mi32 fad mi mi[fad mi]  } fad8 si, r fad'

    %57
    \tuplet 3/4 {  sol32 la sol sol[la sol] } fad8 si,\mbreak r fad' \tuplet 3/4 {  si32 do si si[do si] }
    la4. si16 red, mi8 fad16 mi red8. mi16
    mi8 mi' mi red\mbreak mi16 fad re! mi do re si do

    %60
    la si sol la fad sol  mi fad red8 si mi[la]
    si mi, si'[si,] mi16 fad re mi do\p re si do
    la si sol la fad sol  mi fad\mbreak red8 si' mi[la,]

    %63
    si1^\markup\italic"Largo"
    mi\fermata

}


Vbcn = \relative do {

    R1*6
    r8 si \senza \tuplet 3/4 { mi32 fad mi mi[fad mi]  } fad8 si, r fad'
    \tuplet 3/4 {  sol32 la sol sol[la sol] } fad8 si,\mbreak r fad' \tuplet 3/4 {  si32 do si si[do si] }

    %9
    la4. si16 red, mi8 fad16 mi red8. mi16
    mi8 fad sol[mi] la si do[la]
    si mi, si'[si,] mi re dod[si]

    %12
    lad sold lad[fad] si dod re[ si]
    mi fad sol mi\mbreak fad si, fad'[fad,]
    si4 r r2

    %15
    R1*5
    \clef tenor \key mi\minor r8 mi \tuplet 3/4 { si'32 dod si si[dod si] } dod8 fad, r dod'
    \tuplet 3/4 { re32 mi re re[mi re]  } dod8 fad, r dod' \tuplet 3/4 { fad32 sol fad fad[sol fad]  }

    %22
    mi4. fad16 lad, si8 dod16 si fad8. si16\mbreak
    si8 \clef bass \key mi\minor  fad^\p sol[mi] fad si, fad'[fad,]
    si' dod re[sold,] la sold la[re,]

    %25
    mi^\p la, mi'[mi,] la'\f re sold,[dod]
    fad, si mi,[la] red, sold dod,[fad]
    si, red mi[la]\mbreak si8 mi, si'[si,]

    %28
    mi4 r r2
    R1*5
    r8 si \senza \tuplet 3/4 { mi32 fad mi mi[fad mi]  } fad8 si, r fad'

    %35
    \tuplet 3/4 {  sol32 la sol sol[la sol] } fad8 si,\mbreak r fad' \tuplet 3/4 {  si32 do si si[do si] }
    la4. si16 red, mi8 fad16 mi red8. mi16\f
    mi4 r mi r

    %38
    mi8^\p si mi8. fad16 \tuplet 3/4 { sol16 la sol fad[sol fad]}
    mi4^\f r sol r
    sol8 re sol8.\f la16 \tuplet 3/4 { si do si la[si la]}

    %41
    sol4 r8 sol,\mbreak si4 la
    sol fad mi r8 mi'
    re4 r8 do re sol, re'[re,]

    %44
    sol4 r8 sol\p si4 la
    sol fad mi r8 mi'
    re4 r8 do\mbreak re sol, re' [re,]

    %47
    sol sol' fad mi red4 r8 si
    mi fad sol si, do! si do[la']
    si mi, si'[si,] mi lad, si[si]

    %50
    mi4 r r2
    R1*5\mbreak
    r8 si \senza \tuplet 3/4 { mi32 fad mi mi[fad mi]  } fad8 si, r fad'

    %57
    \tuplet 3/4 {  sol32 la sol sol[la sol] } fad8 si,\mbreak r fad' \tuplet 3/4 {  si32 do si si[do si] }
    la4. si16 red, mi8 fad16 mi red8. mi16
    mi8 mi' mi red\mbreak mi16 fad re! mi do re si do

    %60
    la si sol la fad sol  mi fad red8 si mi[la]
    si mi, si'[si,] mi16 fad re mi do^\p re si do
    la si sol la fad sol  mi fad\mbreak red8 si' mi[la,]

    %63
    si1^\markup\italic"Largo"
    mi\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*6
    s8 <_+> <5> s <6+> <5> s <6+>
    <6> s <6+> <5> s <6+> <5 _+> s
    <5>2 <5>4 <6>
    <5>8 <6+> <6> <7> <9> s <6> <6>
    <7 _+> <5> <4> <3+> s <6> <6+>4
    <6> <5>8 <7 5> <4 2>4 <6>
    <9>8 <_+> <6> <6+> <7 _+> <5> <4> <3+>
    s1*6
    s4 <5> <6+>8 <5> s <6+>
    <6>4 <6+>8 <5> s <6+> <5 _+>4
    <3>4. <5>16 <6> <5>4 <5>
    <5>8 <_+> <6>4 <7 _+>8 <5> <4> <3+>
    s4 <6>8 <6>16 <5> <9 _+>8 <6>16 <5> <8 3+>8  <7 5>
    <_+>4 <4>8 <3+> s4 <7>8 <7>
    <7> <_+> <7+ _+> <7 _+> <7> <7> <7> <7>
    <_+> <6> <_-> <7 _-> <_+> <_-> <4> <3+>
    <_->1
    s1*5
    s8 <_+> <5>4 <6+>8 <5> s <6+>
    <6>4 <6+>8 <5> s <6+> <5 _+>4
    s4. <5>16 <6> <5>4 <5>
    s1
    <5>2 <6>4 <6+>
    <5>2 <5>
    s <6>4 <6>
    s2 <6>4 <6>
    <5> <6> <7> s8 <6+>
    <5>4 s8 <7 5> <5>4 <4>8 <3>
    s2 <6>4 <6>
    <5> <6> <7> s8 <6+>
    <5>4 s8 <7 5> s4 <4>8 <3>
    s4 <6+> <5-> s8 <7 5>
    <4 2> s <6> <6> <6> <6> <6> <6>
    <7 _+> s <4> <3+> s <7 5> <4> <3+>
    s1*6
    s8 <_+> <5>4 <6+>8 <5> s <6+>
    <6>4 <6+>8 <5> s <6+> <5>4
    s4. <5>16 <6> <5>4 <5>
    s <4 2> s8 <6> <6> <6>
    <6> <6> <6+> <5> <5- 3> <7 5> <5> <7 5>
    <5 _+> <5> <4> <3+> s <6> <6> <6>
    <6> <6> <6+> <5>
    <5- 3> <7 5> <5> <7 5>
    <5 3+>4 <6 4> <5 4> <3+>

}


forma = {

    \key mi\minor
    \time 4/4
    \tempo 2 = 45
    s1*64
    \bar"|."

}


VvlI = {
    \Vglobal
    %\notypeset
    <<\VvlIn \forma>>
}


VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>
}


Vcb = {
    \Vglobal
    \clef bass
    <<\Vcbn \forma>>
}



Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge  {"[1.] Largo e staccato"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"primo"}
            \set Staff.midiInstrument = #"violin"
            \IvlI
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"secondo"}
            \set Staff.midiInstrument = #"violin"
            \IvlII
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violone o"\vspace #-0.2"Arcileuto"}
            \set Staff.midiInstrument = #"contrabass"
            \Icb
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"Organo"}
            \set Staff.midiInstrument = #"church organ"
            \Ibc
        >>
    >>

    \layout {

        indent = 1.2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

%\pageBreak

\markup \huge  {"[2.] Spiritoso"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIcb
        >>

        \new Staff  <<
            \set Staff.midiInstrument = #"church organ"
            \IIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\markup \huge  {"[3.] Presto"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIIcb
        >>

        \new Staff  <<
            \set Staff.midiInstrument = #"church organ"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\markup \huge  {"[4.] Andante e staccato"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IVvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IVvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IVcb
        >>

        \new Staff  <<
            \set Staff.midiInstrument = #"church organ"
            \IVbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

%\pageBreak

\markup \huge  {"[5.] Presto e spiritoso"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \Vcb
        >>

        \new Staff  <<
            \set Staff.midiInstrument = #"church organ"
            \Vbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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
