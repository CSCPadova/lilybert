\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

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
}

IvlIn = \relative do'' {

    re16 re re re re dod re mi fa fa fa fa fa mi fa sol
    la la la la la sol fa mi re re re re re dod re mi
    fa fa fa fa fa mi fa sol la la la la la sol fa mi

    %4
    re dod re mi fa mi fa sol la8 la, r4
    la'16 la la la la sol fa mi re re re re re do? sib la
    sol' sol sol sol sol fa mi re\mbreak do do do do do sib la sol

    %7
    fa' fa fa fa fa mi re do sib sib sib sib sib la sol fa
    mi' mi mi mi mi re dod si la[la la la la sol fa mi]
    re[re re re re mi fa sol] la[la la la la sol fa mi]

    %10
    fa8 re' mi, dod' re4 r
    la16 la la la la sold la si do do do do do si do re\mbreak
    mi mi mi mi mi re do si la la la la la sold la si

    %13
    do do do do do si do re mi mi mi mi mi re do si
    do8 la r4 do'16 do do do do si la sol
    fa[re re fa fa la la do] si[si si si si la sol fa]

    %16
    mi[do do mi mi sol sol si] la [la la la la sol fa mi]
    re[si si re re fa fa la] sol[sol sol sol sol fa mi re]\mbreak
    do do do do do si do re mi mi mi mi mi re mi fa

    %19
    sol[sol sol sol sol fa sol la] sib[sib sib sib sib sol fa mi]
    la[do, do do do sib la sol] la8 fa' sol, mi'
    fa4 r fa,16 fa fa fa fa mi fa sol\mbreak

    %22
    la la la la la sol la sib do do do do do sib do re
    mib mib mib mib mib do sib la sib8 sol sib'16 sib sib sib
    do, do do do la' la la la sib, sib sib sib sol' sol sol sol

    %25
    la, la la la fa' fa fa fa sol, sol sol sol mib' mib mib mib
    fad, re re re re do sib la sol[sol sol sol sol la sib do]
    re[re re re re do sib la]\mbreak \stemUp sib8 \stemDown sol'' \stemUp re, \stemDown fad'

    %28
    \stemNeutral sol16[sib sib sib sib la sol fa] mib[mib mib mib mib re do sib]
    la' la la la la sol fa mib\mbreak re re re re re do sib la
    sol'[sol sol sol sol fa mib re] do[do do do do sib la sol]

    %31
    la[fa fa fa fa mib re do] sib[sib sib sib sib do re mib]
    fa[fa fa fa fa mib re do] \stemUp re8 \stemDown sib'' \stemUp fa, \stemDown la'
    sib4 r re,16 re re re re dod re mi

    %34
    fa fa fa fa fa mi fa sol\mbreak la la la la la sol fa mi
    re [re re re re dod re mi] fa[fa fa fa fa mi fa sol]
    la[la la la la sol fa mi] fa8 re r16 la' la sib

    %37
    sib sol sol mi mi do do sib' la fa fa re re sib sib la'
    sol mi mi dod dod la la sol' fa re re re re mi fa sol
    la la la la la sol fa mi re[re re re re mi fa sol]

    %40
    la[la la la la sol fa mi]\mbreak fa8 re' mi, dod'
    re4 r re,,16[re re re re mi fa sol]
    la[la la la la sol fa mi] re[re re re re mi fa sol]

    %43
    la[la la la la sol fa mi] fa8 re' mi, dod'
    re1\fermata

}

Ivlan = \relative do' {

    fa8[fa16 mi fa8 fa] la la la fa
    mi[mi16 re mi8 mi] fa[fa16 mi fa8 fa]
    la la la fa mi [mi16 re mi8 dod]

    %4
    la[fa'16 mi fa8 re] dod[dod'16 si dod8 mi,]
    mi[mi16 re mi8 dod] la[la'16 sol la8 fad]
    re[re16 do re8 si]\mbreak sol[sol'16 fa? sol8 mi]

    %7
    do[do'16 sib do8 la] fa[fa16 mi fa8 re]
    sib sib' sib sol mi[mi16 re mi8 mi]
    fa[fa16 mi fa8 fa] mi[mi16 re mi8 mi]

    %10
    la, fa' mi mi fa[fa16 mi fa8 re]
    do[do16 si do8 do] do[do16 si do8 do]\mbreak
    si[si16 la si8 si] do[do16 si do8 do]

    %13
    mi mi mi do si[si16 la si8 mi]
    mi[do16 si do8 do] mi mi do'4~
    do8 la fa4~fa8 re si'4~

    %16
    si8 sol mi4~mi8 do la'4~
    la8 fa re4~re8 si re4\mbreak
    mi8[mi16 re mi8 mi] sol sol sol sol

    %19
    mi8[mi16 re mi8 mi] mi8[mi16 re mi8 mi]
    do la' sol mi do16 [sib do re do8 do]
    la[la16 sol la8 la] la[la16 sol la8 la]\mbreak

    %22
    do do do do la[la16 sol la8 la]
    la[la16 sol la8 la] re re re re
    sol sol do do fa, fa sib sib

    %25
    mib, mib la la re, re sol mib
    la,[la16 sol la8 la] sib[sib16 la sib8 sib]
    la[la16 sol la8 la]\mbreak re16[do re mib re8 re]

    %28
    re8 re sib'4~sib8 sol mib4~
    mib8 do la'4~\mbreak la8 fa re4~
    re8 sib sol'4~sol8 [sol16 fa sol8 mib]

    %31
    do[do16 sib do8 do] re[re16 do re8 re]
    do[do16 sib do8 do] fa16[mib fa sol fa8 fa]
    re[re16 do re8 mi?] fa[fa16 mi fa8 fa]

    %34
    la la la fa\mbreak  mi[mi16 re mi8 mi]
    fa[fa16 mi fa8 fa] la la la fa
    mi[mi16 re mi8 dod] la[fa'16 mi fa8 fa]

    %37
    re sib'4 mi,8~mi la4 re,8~
    re sol4 dod,8 la[fa'16 mi fa8 fa]
    mi[mi16 re mi8 mi] fa[fa16 mi fa8 fa]

    %40
    mi[mi16 re mi8 dod] \mbreak la[la'16 sib la8 la]
    fa[fa,16 mi fa8 fa] fa[fa16 mi fa8 fa]
    mi[mi16 re mi8 mi] fa[fa16 mi fa8 fa]

    %43
    mi[mi16 re mi8 mi] fa[la16 sib la8 la']
    fa1\fermata

}


Ibcn = \relative do {

    re,8[re'16 dod? re8 re,] re8[re'16 dod re8 re,]
    dod8[dod'16 si dod8 dod,] re8[re'16 dod re8 re,]
    re8[re'16 dod re8 re,] dod8[dod'16 si dod8 la]

    %4
    re,8[re'16 dod re8 sib]  la8[ la'16 sol la8  la, ]
    \stemUp la[\stemDown dod'16 si dod8 la] \stemNeutral fad[fad16 mi fad8 re]
    si[si'16 la si8 sol]\mbreak mi[mi16 re mi8 do]

    %7
    la[la'16 sol la8 fa] re[re16 do re8 sib]
    sol[sol'16 fa sol8 sol,]  la[ dod'16 si dod8 dod,]
    re[re'16 dod re8 re,] dod[dod'16 si? dod8 dod,]

    %10
    re16[mi fa sol la8 la,] re,[re'16 do! re8 sold,]
    la[la'16 sold la8 la,] la[la'16 sold la8 la,]\mbreak
    sold[sold'16 fad sold8 sold,] la[la'16 sold la8 la,]

    %13
    la[la'16 sold la8 la,] sold[sold'16 fad sold8 sold,]
    la[la'16 sold la8 la,] la[la'16 sold la8 la,]
    re[re'16 do re8 re,] sol,[sol'16 fa sol8 sol,]

    %16
    do[do'16 si do8 do,] fa,[fa'16 mi fa8 fa,]
    si[si'16 la si8 si,]  si[si'16 la si8 si,]\mbreak
    do[do'16 si do8 do,] do[do'16 si do8 do,]

    %19
    do[do'16 sib! do8 do,] do[do'16 sib do8 do,]
    fa, fa' mi do fa,16 sol la sib do8 do,
    fa[fa'16 mi fa8 fa,] fa[fa'16 mi fa8 fa,]\mbreak %% fine prima riga p. 3

    %22
    fa[fa'16 mi fa8 fa,] fa[fa'16 mi fa8 fad,]
    fad?[fad'!16 mi fad8 fad,!] sol[sol'16 fad sol8 sol,]
    mib mib' fa? mib re re mib re

    %25
    do do re do sib sib' do do,
    re[fad16 mi fad8 fad,] sol[sol'16 fad sol8 sol,]
    fad[fad'16 mi fad8 fad,]\mbreak sol16 la sib do re8 re,

    %28
    sol[sol'16 fa? sol8 sol,] do[do'16 sib do8 do,]
    fa,[fa'16 mib fa8 fa,]\mbreak sib[sib'16 la sib8 sib,]
    mib,[mib'16 re mib8 mib,] mib[mib'16 re mib8 mib,]

    %31
    fa'[la16 sol la8 la,] sib[sib'16 la sib8 sib,]
    la[la'16 sol la8 la,] sib16 do re mib fa8 fa,
    sib[sib'16 la sib8 dod,] re[re16 dod re8 re,]

    %34
    re[re'16 dod re8 re,]\mbreak dod[dod'16 si dod8 dod,]
    re[re'16 dod re8 re,] re[re'16 dod re8 re,]
    dod[dod'16 si dod8 la] re,[re'16 dod re8 re,]

    %37
    sol sol' do? do, fa, fa' sib sib,
    mi, mi' la la, re,[re'16 dod re8 re,]
    dod[dod'16 si dod8 dod,] re[re'16 dod re8 re,]

    %40
    dod[dod'16 si dod8 dod,]\mbreak re'16 mi fa sol la8 la,
    re,[re'16 dod re8 re,] re[re'16 dod re8 re,]
    dod[dod'16 si dod8 dod,] re[re'16 dod re8 re,]

    %43
    dod[dod'16 si dod8 la] re16 mi fa sol la8 la,
    re,1\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*14
    <7>2 <7>
    <7> <7>
    <7> <6>
    s1*5
    <7->2 s
    <6 5> <6 5>
    <6 5> s
    <_+> s
    s1
    s2 <7 3->
    <7-> <7>
    <7> <6>
    s1*6
    s4 <7> <7> <7>
    <7> <7 _+> s2

}

forma = {

    \time 4/4
    \key re\minor
    \tempo 2 = 65
    s1*44
    \bar"||"

}



IvlI = {
    \global
    %\notypeset
    <<\IvlIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    fa2.
    mi\fermata
    la4(sol fad)

    %4
    fad?2.
    sol\fermata
    sib4 \parentSlur (la sold)

    %7
    sold?2.
    la\fermata
    fa4(mib re)

    %10
    mib dod2
    re4 la re~
    re dod2

    %13
    re2.
    sold4(mi re)
    dod2 re4~

    %16
    re dod2
    re2.\fermata

}

IIvlIIn = \relative do'' {

    re2.
    dod\fermata
    R

    %4
    re
    re\fermata
    R

    %7
    mi
    mi\fermata
    R

    %10
    sol4 mi?2
    fa2.
    mi

    %13
    re
    R
    mi2 fa4

    %16
    mi2.
    fa\fermata

}

IIvlan = \relative do' {

    si'2.
    mi,\fermata
    R

    %4
    la
    sib?\fermata
    R

    %7
    si
    dod\fermata
    R

    %10
    sib?
    la4 fa la
    sib la2

    %13
    fa2.
    R
    la2 la4

    %16
    sib la2
    la2.\fermata

}


IIbcn = \relative do {

    sold2.
    la\fermata
    R

    %4
    do
    sib\fermata
    R

    %7
    re
    dod\fermata
    R

    %10
    sol'
    fa4 re fa
    sol la la,

    %13
    re2.
    R
    sol2 fa4

    %16
    sol la la,
    re,2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <7!>2.
    s
    s
    <6 4+>
    s
    s
    <6 4+>
    s
    s
    <6->4 <5> <6 4+>
    s2.
    <6 5>4 <3+>2
    s2.*2
    <6 4+>2.
    <6 5>

}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key re\minor
    \tempo 4 = 60
    s2.*17
    \bar"||"

}



IIvlI = {
    \global
    %\notypeset
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    r16 la sib la sib la
    re la sib la sib la
    mi' la, sib la sib la

    %4
    fa' la, sib la sib la
    sol' la, sib la sib la
    fa' re mi re mi re

    %7
    sib' re, mi re mi re
    dod mi fa mi fa mi
    la  do, re do re do

    %10
    si re mi re mi re
    sol sib,? do sib do sib
    la la si la si la\mbreak

    %13
    fa' mi re do si la
    fa' mi re do si la
    fa' mi re do si la

    %16
    re8 mi mi,
    la16 mi fa mi fa mi
    la mi fa mi fa mi

    %19
    si' mi, fa mi fa mi
    do' mi, fa mi fa mi
    re' mi, fa mi fa mi

    %22
    do' la si la si la
    fa' la, si la si la
    sold si do si do si

    %25
    mi sol, la sol la sol\mbreak
    fad la sib la sib la
    re fa, sol fa sol fa

    %28
    mi fad sold la si do
    sold la si do re mi
    dod re mi fad sol la

    %31
    fad sol la sol fad mi
    re mib re do sib la
    sib re do sib la sol

    %34
    mib' re do sib la sol
    mib' re do sib la sol
    mib' re do sib la sol

    %37
    do8 re re,\mbreak
    sol16 re mib re mib re
    sol re mib re mib re

    %40
    la' re, mib re mib re
    sib' re, mib re mib re
    do' re, mib re mib re

    %43
    sib' sol la sol la sol
    mib' sol, la sol la sol
    fad la sib la sib la

    %46
    re fa,? sol fa sol fa
    mi sol la sol la sol
    do mib, fa mib fa mib\mbreak

    %49
    re fa sol la sib do
    re do sib do re mib
    fa mib re do sib la

    %52
    sib la sol fa mib re
    sib' la sol fa mib re
    sib' la sol fa mib re\mbreak

    %55
    mib'8 fa fa,
    sib16 fa sol fa sol fa
    sib fa sol fa sol fa

    %58
    do' fa, sol fa sol fa
    re' fa, sol fa sol fa
    mib' fa, sol fa sol fa

    %61
    re' sib do sib do sib
    sib' re, mi re mi re
    dod mi fa mi fa mi

    %64
    la do, re do re do
    si re mi re mi re\mbreak
    sol sib, do sib do sib

    %67
    la la sib la sib la
    re la sib la sib la
    mi' la, sib la sib la

    %70
    fa' la, sib la sib la
    sol' la, sib la sib la
    fa' mi re do sib la

    %73
    re do sib la sol fa
    sib la sol fa mi re
    sol8 la la,\mbreak

    %76
    re4 r8
    sib'16 la sol fa mi re
    sib' la sol fa mi re\mbreak

    %79
    sib' la sol fa mi re
    sol8 la la,
    re4.\fermata

}

IIIvlan = \relative do' {

    fa8 fa fa
    fa fa fa
    la mi mi

    %4
    la fa fa
    mi mi  dod
    la fa' fa

    %7
    re sib' sib
    mi, mi dod
    re la' la

    %10
    re, re si
    do sol' sol
    do, do do\mbreak

    %13
    fa16 mi re do si la
    fa'mi re do si la
    fa' mi re do si la

    %16
    re'8 mi mi,
    mi do do
    do do do

    %19
    mi mi mi
    mi do do
    si si mi

    %22
    mi do do
    la la re
    si sold sold

    %25
    la mi' mi\mbreak
    la, fad' fad
    fa! fa re

    %28
    si si si
    si? si mi
    mi mi la

    %31
    la la la
    la la la
    re, re re

    %34
    mib16 re do sib la sol
    mib' re do sib la sol
    mib' re do sib la sol

    %37
    do'8 re re,\mbreak
    sol sib, sib
    sib sib sib

    %40
    re re re
    re re re
    re re re

    %43
    re re sib
    sol sol do
    la la re

    %46
    re re re
    sol, mi' mi
    sol, sol do\mbreak

    %49
    re mib16 fa sol la
    fa8 fa fa
    do la' la

    %52
    sib16 la sol fa mib re
    sib' la sol fa mib re
    sib' la sol fa mib re\mbreak

    %55
    mib8 fa fa,
    sib re re
    re re re

    %58
    fa do do
    fa re re
    fa fa fa

    %61
    fa fa fa
    re sib' sib
    mi, dod dod

    %64
    re la' la
    re, si si\mbreak
    do sol' sol

    %67
    do, do do
    fa fa fa
    la la la

    %70
    la la la
    mi mi dod
    fa16 mi re \once\set suggestAccidentals = ##t do? sib la

    %73
    re' do sib la sol fa
    sib la sol fa mi re
    sol8 la la,\mbreak

    %76
    re4 r8
    sib'16 la sol fa mi re
    sib' la sol fa mi re\mbreak

    %79
    sib' la sol fa mi re
    sol8 la la,
    re4.\fermata

}


IIIbcn = \relative do {

    re8 re re
    re re re
    dod dod dod

    %4
    re re re
    dod dod dod
    re re re

    %7
    sol sol sol
    la la la
    fad fad fad

    %10
    sol sol sol
    mi mi mi
    fa? fa fa\mbreak

    %13
    \clef tenor \key re\minor fa'16 mi re do si la
    fa' mi re do si la
    fa' mi re do si la

    %16
    re8 mi mi,
    \clef bass\key re\minor la, la la
    la la la

    %19
    sold sold sold
    la la la
    sold sold sold

    %22
    la la la
    re re re
    mi mi mi

    %25
    dod dod dod\mbreak
    re re re
    re re re

    %28
    mi mi mi
    mi mi mi
    la, la la

    %31
    re re re
    fad fad fad
    sol sol sol

    %34
    \clef tenor \key re\minor mib'16 re do sib la sol
    mib'16 re do sib la sol
    mib'16 re do sib la sol

    %37
    do8 re re,\mbreak
    \clef bass \key re \minor sol, sol sol
    sol sol sol

    %40
    fad fad fad
    sol sol sol
    fad fad fad

    %43
    sol sol sol
    do do do
    re re re

    %46
    si si si
    do do do
    do do do\mbreak

    %49
    sib mib16 re do8
    sib sib sib
    la fa' fa

    %52
    sib16 la sol fa mib re
    sib' la sol fa mib re
    sib' la sol fa mib re\mbreak

    %55
    \clef tenor\key re\minor  mib'8 fa fa,
    \clef bass\key re\minor sib, sib sib
    sib sib sib

    %58
    la la la
    sib sib sib
    la la la

    %61
    sib sib sib
    sol' sol sol
    la la la

    %64
    fad fad fad
    sol sol sol\mbreak
    mi mi mi

    %67
    fa? fa fa
    re re re
    dod dod dod

    %70
    re re re
    dod dod la
    \clef tenor\key re\minor fa''16 mi re do sib la

    %73
    re do sib la sol fa
    sib la sol fa mi re
    \clef bass\key re\minor sol8 la la,

    %76
    re4 r8
    sib'16 la sol fa mi re
    sib' la sol fa mi re\mbreak

    %79
    sib' la sol fa mi re
    sol8 la la,
    re,4.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*7
    <_+>4.
    s
    <_!>
    s4.*13
    <_+>4.
    s
    <_+>
    s
    <_+>
    s
    <_+>
    <_+>
    s4.*12
    <_->4.
    <_+>
    s
    s
    <_->
    s4.*11
    <6 5->4.
    s
    s
    <_+>
    s
    <_!>

}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key re\minor
    \tempo 4. = 85
    s4.*81
    \bar"|."

}



IIIvlI = {
    \global
    %\notypeset
    <<\IIIvlIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    re,8 re re re fad sol
    la la, la la si dod
    re re re re fad sol

    %4
    la,4 r r
    re8\p re re re fad sol
    la la, la la si dod

    %7
    re re re re fad sol
    la,4 r r
    re'8\f fad, fad fad sol la

    %10
    si mi, mi mi fad sol\mbreak
    la re, re re mi fad
    sol dod, dod dod re mi

    %13
    fad4 r r
    fad8 re re re sol mi
    fad re re re sol mi

    %16
    fad re re re sol mi
    fad re la'4 la,
    re r r

    %19
    fad8\p re re re sol mi
    fad re re re sol mi
    fad re re re sol mi\mbreak

    %22
    fad re la'4 la,
    re8 la''\p la la si sol
    la la la la si sol

    %25
    la la la la si sol
    la\f la la la la la
    si2.~

    %28
    si8 mi, mi mi mi mi
    la2.~
    la8 re, re re re re

    %31
    sol2.~\mbreak
    sol8 dod, dod dod dod dod
    fad4(re' dod)

    %34
    si(la sol)
    fad(re' dod)
    si(la sol)

    %37
    fad(re) re'~
    re(dod si)
    dod si2\tr

    %40
    la8 la, la la dod re
    mi mi, mi mi fad sold
    la la, la la dod re\mbreak

    %43
    mi4 r r
    dod'8 la la la re si
    dod la la la re si

    %46
    dod la la la re si
    dod la mi'4 mi,
    la8 la,\p la la re si\mbreak

    %49
    dod la la la re si
    dod la la la re si
    dod la mi'4 mi

    %52
    la,4 mi''8 re mi4
    r re8 dod re4
    r dod8 si dod4

    %55
    r mi8 re mi4
    r re8 dod re4
    r dod8 si dod4

    %58
    r8 mi\f mi mi la la\mbreak
    la4 sold2
    r8 fad fad fad si si

    %61
    si4 la2
    r8 sold sold sold dod dod
    dod4 si2

    %64
    la2.
    sold
    fad

    %67
    mid2 fad4~
    fad mid2\mbreak
    fad8 la, la la si dod
    re sold, sold sold la si

    %71
    dod fad, fad fad sold la
    si mid, mid mid fad sold\mbreak
    la fad fad fad si sold

    %74
    la fad fad fad si sold
    la fad fad fad si sold
    la fad dod'4 dod,

    %77
    fad la'2
    sid,2.\mbreak
    la'4(sold fad)

    %80
    mi(red dod)
    sol'!2.
    lad,

    %83
    sol'4(fad mi)
    re(dod si)
    fad'2.

    %86
    sold,
    fad'4(mi re)
    dod(si la)\mbreak

    %89
    la8 la la la dod re
    mi mi, mi mi fad sold
    la la, la la dod re

    %92
    mi sold' sold sold la si
    re,2.
    dod8 la la la sol'? la

    %95
    do,2.
    si8 sol sol sol fa' sol
    sib,2.

    %98
    la8 re re re fad! la\mbreak
    sib,2.
    la8 la'\p la la si? sol

    %101
    la la la la si sol
    la la la la si sol
    la\f la la la la la

    %104
    si2.~
    si8 mi, mi mi mi mi\mbreak
    la2.~

    %107
    la8 re, re re re re
    sol2.~
    sol8 dod, dod dod dod dod

    %110
    fad4(re' dod)
    si(la sol)
    fad (re' dod)

    %113
    si(la sol)
    fad(la fad)
    mi(la mi)

    %116
    re8 fad, fad fad sol la\mbreak
    si mi, mi mi fad sol
    la re, re re mi fad

    %119
    sol dod, dod dod re mi
    fad re re re sol mi
    fad re re re sol mi

    %122
    fad re la'4 la,
    re r r
    fad8 re re re sol mi

    %125
    fad re re re sol mi\mbreak
    fad re la'4 la,
    re2.\fermata

}

IVvlIIn = \relative do'' {

    re,8 re re re fad sol
    la la, la la si dod
    re re re re fad sol

    %4
    la,4 r r
    re8\p re re re fad sol
    la la, la la si dod

    %7
    re re re re fad sol
    la,4 r r
    re'8\f fad, fad fad sol la

    %10
    si mi, mi mi fad sol\mbreak
    la re, re re mi fad
    sol dod, dod dod re mi

    %13
    fad4 r r
    fad8 re re re sol mi
    fad re re re sol mi

    %16
    fad re re re sol mi
    fad re la'4 la,
    re r r

    %19
    fad8\p re re re sol mi
    fad re re re sol mi
    fad re re re sol mi\mbreak

    %22
    fad re la'4 la,
    re8 fad'\p fad fad sol mi
    fad fad fad fad sol mi

    %25
    fad fad fad fad sol mi
    fad\f fad fad fad fad fad
    fad2.

    %28
    sol8 sol sol sol sol sol
    mi2.
    fad8 fad fad fad fad fad

    %31
    re2.\mbreak
    mi8 mi mi mi mi mi
    re4(si' la)

    %34
    sol(fad mi)
    re(si' la)
    sol(fad mi)

    %37
    re(la) fad'
    si(la sold)
    la2sold4

    %40
    la8 la, la la dod re
    mi mi, mi mi fad sold
    la la, la la dod re\mbreak

    %43
    mi4 r r
    dod'8 la la la re si
    dod la la la re si

    %46
    dod la la la re si
    dod la mi'4 mi,
    la8 la,\p la la re si\mbreak

    %49
    dod la la la re si
    dod la la la re si
    dod la mi'4 mi

    %52
    la, dod'8 si dod4
    r si8 la si4
    r la8 sold la4

    %55
    r dod8 si dod4
    r si8 la si4
    r la8 sold la4

    %58
    R2.\mbreak
    r8 si\parenthesize \f si si mi mi
    mi4 re2

    %61
    r8 dod dod dod fad fad
    fad4 mid2
    r8 sold sold sold sold sold

    %64
    sold?4 fad2~
    fad4 mi?2~
    mi4 re2~

    %67
    re4 dod8 si la4
    sold2.\mbreak
    fad'8 la, la la si dod

    %70
    re sold, sold sold la si
    dod fad, fad fad sold la
    si mid, mid mid fad sold\mbreak
    la fad fad fad si sold

    %74
    la fad fad fad si sold
    la fad fad fad si sold
    la fad dod'4 dod,

    %77
    fad fad'2~
    fad2.~\mbreak
    fad4(mi red)

    %80
    dod(red mi)
    mi2.~
    mi~

    %83
    mi4(re? dod)
    si(dod re)
    re2.~

    %86
    re~
    re4(dod si)
    la(si dod)\mbreak

    %89
    la8 la la la dod re
    mi mi, mi mi fad sold
    la la, la la dod re

    %92
    mi4 r r
    si'2.
    la4 r r

    %95
    la2.
    sol4 r r
    sol2.

    %98
    fad?8 la la la re fad\mbreak
    sol,2.
    fad8 fad'\p fad fad sol mi

    %101
    fad fad fad fad sol mi
    fad fad fad fad sol mi
    fad\f fad fad fad fad fad

    %104
    fad2.
    sol8 sol sol sol sol sol\mbreak
    mi2.

    %107
    fad8 fad fad fad fad fad
    re2.
    mi8 mi mi mi mi mi

    %110
    re4(si' la)
    sol(fad mi)
    re(si' la)

    %113
    sol(fad mi)
    re(fad re)
    dod(mi dod)

    %116
    re8 fad, fad fad sol la\mbreak
    si mi, mi mi fad sol
    la re, re re mi fad

    %119
    sol dod, dod dod re mi
    fad re re re sol mi
    fad re re re sol mi

    %122
    fad re la'4 la,
    re r r
    fad8 re re re sol mi

    %125
    fad re re re sol mi\mbreak
    fad re la'4 la,
    re2.\fermata

}

IVvlan = \relative do' {

    re8 re re re fad sol
    la la, la la si dod
    re re re re fad sol

    %4
    la,4 r r
    re8\p re re re fad sol
    la la, la la si dod

    %7
    re re re re fad sol
    la,4 r r
    re'8\f fad, fad fad sol la

    %10
    si mi, mi mi fad sol\mbreak
    la re, re re mi fad
    sol dod, dod dod re mi

    %13
    fad4 r r
    fad8 re re re sol mi
    fad re re re sol mi

    %16
    fad re re re sol mi
    fad re la'4 la,
    re r r

    %19
    fad8\p re re re sol mi
    fad re re re sol mi
    fad re re re sol mi\mbreak

    %22
    fad re la'4 la,
    re8 re'\p re re sol, sol
    re' re re re sol, sol

    %25
    re' re re re sol, sol
    re'2.\f~
    re

    %28
    dod~
    dod
    si~

    %31
    si\mbreak
    la~
    la8 fad fad fad fad fad

    %34
    re re re re mi mi
    fad fad fad fad fad fad
    re re re re mi mi

    %37
    fad fad fad fad fad fad
    sold sold sold sold sold sold
    mi mi mi mi mi mi

    %40
    la,8 la' la la dod re
    mi mi, mi mi fad sold
    la la, la la dod re\mbreak

    %43
    mi4 r r
    dod'8 la la la re si
    dod la la la re si

    %46
    dod la la la re si
    dod la mi'4 mi,
    la8 la,\p la la re si\mbreak

    %49
    dod la la la re si
    dod la la la re si
    dod la mi'4 mi,

    %52
    la 4 r r
    mi' r r
    mi r r

    %55
    mi r r
    mi r r
    mi r r

    %58
    dod\f dod dod\mbreak
    si mi mi
    fad si, si

    %61
    dod fad fad
    sold dod, dod
    mid8 mid mid mid mid mid

    %64
    mid? mid fad fad la la
    dod dod dod dod dod, dod
    la la la' la fad fad

    %67
    sold sold mid mid dod dod
    re re dod dod dod dod\mbreak
    fad la la la si dod
    re sold, sold sold la si

    %71
    dod fad, fad fad sold la
    si mid, mid mid fad sold\mbreak
    la fad fad fad si sold

    %74
    la fad fad fad si sold
    la fad fad fad si sold
    la fad dod'4 dod,

    %77
    fad8 dod dod dod fad fad
    red red red red red red \mbreak
    \once\set suggestAccidentals =##t red? red red red sold sold

    %80
    sold? sold fad fad mi mi
    si si si si mi mi
    dod dod dod dod dod dod

    %83
    dod dod dod dod fad fad
    fad fad mi mi re re
    la la la la re re

    %86
    si si si si si si
    si si si si mi mi
    mi mi re re dod dod\mbreak

    %89
    la' la la la dod re
    mi mi, mi mi fad sold
    la la, la la dod re

    %92
    mi4 r r
    sold8 sold sold sold la si
    mi,4 r r

    %95
    fad8 fad fad fad sol? la
    re,4 r r
    mi8 mi mi mi fad! sol

    %98
    re4 r r\mbreak
    mi8 mi mi mi fad sol
    re re'\parenthesize \p re re sol, sol

    %101
    re' re re re sol, sol
    re' re re re sol, sol
    re'2.\parenthesize \f ~

    %104
    re
    dod~\mbreak
    dod

    %107
    si~
    si
    la~

    %110
    la8 fad fad fad fad fad
    re re re re mi mi
    fad fad fad fad fad fad

    %113
    re re re re mi mi
    fad fad fad fad la la
    la la la la la la
    fad8 fad fad fad sol la\mbreak

    %117
    si mi, mi mi fad sol
    la re, re re mi fad
    sol dod, dod dod re mi

    %120
    fad re re re sol mi
    fad re re re sol mi
    fad re la'4 la,

    %123
    re r r
    fad8 re re re sol mi
    fad re re re sol mi\mbreak

    %126
    fad re la'4 la,
    re2.\fermata

}


IVbcn = \relative do {

    re8 re re re fad sol
    la la, la la si dod
    re re re re fad sol

    %4
    la,4 r r
    re8\p re re re fad sol
    la la, la la si dod

    %7
    re re re re fad sol
    la,4 r r
    re'8\f fad, fad fad sol la

    %10
    si mi, mi mi fad sol\mbreak
    la re, re re mi fad
    sol dod, dod dod re mi

    %13
    fad4 r r
    fad8 re re re sol mi
    fad re re re sol mi

    %16
    fad re re re sol mi
    fad re la'4 la,
    re r r

    %19
    fad8\p re re re sol mi
    fad re re re sol mi
    fad re re re sol mi\mbreak

    %22
    fad re la'4 la,
    re r r
    R2.*2

    %26
    re'8\parenthesize \f re re re re re
    re dod si la sol fad
    mi dod' dod dod dod dod

    %29
    dod si la sol fad mi
    re si' si si si si
    si la sol fad mi re\mbreak

    %32
    dod la' la la la la
    re, re re re re re
    sol sol la la la, la

    %35
    re re re re re re
    sol sol la la la, la
    re re re re re re

    %38
    mi mi mi  mi mi mi
    la, la mi' mi mi, mi
    la la' la la dod re

    %41
    mi mi, mi mi fad sold
    la la, la la dod re\mbreak
    mi4 r r

    %44
    dod'8 la la la re si
    dod la la la re si
    dod la la la re si

    %47
    dod la mi'4 mi,
    la8 la,\p la la re si\mbreak
    dod la la la re si

    %50
    dod la la la re si
    dod la mi'4 mi,
    la r r

    %53
    la r r
    la r r
    la r r

    %56
    la r r
    la r r
    la\parenthesize \f la la\mbreak

    %59
    mi' mi mi
    si si si
    fad' fad fad

    %62
    dod dod dod
    dod8 dod dod dod dod dod
    dod8 dod dod dod dod dod

    %65
    dod8 dod dod dod dod dod
    re re re re re re
    dod8 dod dod dod  fad[fad]

    %68
    si, si dod dod dod, dod\mbreak
    fad'' la, la la si dod
    re sold, sold sold la si

    %71
    dod fad, fad fad sold la
    si mid, mid mid fad sold\mbreak
    la fad fad fad si sold

    %74
    la fad fad fad si sold
    la fad fad fad si sold
    la fad dod'4 dod,

    %77
    fad8 fad fad fad fad fad
    sold sold sold sold sold sold\mbreak
    sid, sid sid sid sid sid

    %80
    dod dod dod dod dod dod
    mi mi mi mi mi mi
    fad fad fad fad fad fad

    %83
    lad, lad lad lad lad lad
    si si si si si si
    re re re re re re

    %86
    mi mi mi mi mi mi
    sold, sold sold sold sold sold
    la la la la la la\mbreak

    %89
    la' la la la dod re
    mi mi, mi mi fad sold
    la la, la la dod re

    %92
    mi4 r r
    mi8 mi mi mi fad sold
    la4 r r

    %95
    re,8 re re re mi fad
    sol?4 r r
    dod,8 dod dod dod re mi

    %98
    fad!4 r r\mbreak
    dod8 dod dod dod re mi
    fad4 r r

    %101
    R2.*2
    re'8\parenthesize \f  re re re re re
    re dod si la sol fad

    %105
    mi dod' dod dod dod dod\mbreak
    dod si la sol fad mi
    re si' si si si si

    %108
    si la sol fad mi re
    dod la' la la la la
    re, re re re re re

    %111
    sol sol la la la, la
    re re re re re re
    sol sol la la la, la

    %114
    re re re re re re
    la' la la, la la la
    re' fad, fad fad sol la\mbreak

    %117
    si mi, mi mi fad sol
    la re, re re mi fad
    sol dod, dod dod re mi

    %120
    fad re re re sol mi
    fad re re re sol mi
    fad re la'4 la,

    %123
    re r r
    fad8 re re re sol mi
    fad re re re sol mi\mbreak

    %126
    fad re la'4 la,
    re2.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*26
    <6>2.
    <6 5>8 <7> s2
    <6>2.
    <6 5>8 <7> s2
    <6>2.
    <6 5>8 <7> s2
    s2.
    s4 <6 8> <5 7>
    s2.
    s4 <6 8> <5 7>
    s2.
    <7 5 3+>
    s2.*14
    <6 4 2>2.
    <5 3>
    s
    <6 4 2>
    <5 3>
    s
    <5 4>4 <3+>2
    <5 4>4 <3>2
    <5 4>4 <3>2
    <5+ 4>4 <3+>2
    s4 <7 5>2
    <6 5>4 <6 4> s
    <5+ 4> <3!> s
    <9> <8> s
    <9 3+> <6> s
    <6 5+> <_+> s
    s2.*9
    <7 3+>2.
    <7 9>4 <6+ 4> <5 3+>
    s2.
    <_!>
    <7 3+>
    <7 5>4 <6 4> <6 3>
    s2.*2
    <7 3+>2.
    <7 5>4 <6 4> <5 3>
    s2.*5
    <7>2.
    s
    <7->
    s
    <7->
    s
    <7->
    s2.*4
    <6>2.
    <6 5>8 <7> s2
    <6>2.
    <6 5>8 <7> s2
    <6>2.
    <6 5>8 <7> s2
    s2.
    s4 <8 6> <7 5>
    s2.
    s4 <8 6> <7 5>

}

forma = {

    \time 3/4
    \key re\major
    \tempo 2. = 60
    s2.*127
    \bar"||"

}



IVvlI = {
    \global
    %\notypeset
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VvlIn = \relative do'' {

    re2 dod
    si1
    lad\fermata

    %4
    fad'
    mi
    re

    %7
    dod2 fad~
    fad mid
    fad1\fermata

    %10
    r2 fad\tr~
    fad~fad~
    fad~fad\mbreak

    %13
    r re,\p
    r dod
    r dod

    %16
    si1\fermata

}

VvlIIn = \relative do'' {

    si2 la
    sol sold
    fad1\fermata

    %4
    r2 re'~
    re dod~
    dod si~

    %7
    si la
    si1
    lad\fermata

    %10
    r2 re
    dod re
    dod re\mbreak

    %13
    r si,\p
    r si
    r lad

    %16
    si1\fermopz

}

Vvlan = \relative do' {

    fad2 dod4 re
    mi2 dod
    dod1\fermata

    %4
    si'2 re,
    mi fad~
    fad4 re mi2~

    %7
    mi dod\mbreak
    re2 si
    dod1\fermata

    %10
    r2 si'
    lad si
    lad si

    %13
    r fad,\p
    r fad
    r fad

    %16
    fad1\fermata

}


Vbcn = \relative do {

    si2 fad'
    sol mid
    fad1\fermata

    %4
    re2 si
    dod lad
    si sold

    %7
    la?1
    sol?
    fad\fermata

    %10
    r2 si
    fad' si,
    fad' si,\mbreak

    %13
    r si\p
    r fad
    r fad

    %16
    si1\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <6 5>
    <3+>1
    s
    <9>2 <6 5>
    <[9]> <6 5>
    <9> <6 8>
    <7> <6+>
    <_+>1
    s
    <_+>
    <_+>
    s
    s2  <5 4>
    s <3+>

}

forma = {

    \time 4/4
    \key si\minor
    \tempo 4 = 60
    s1*16
    \bar"||"

}



VvlI = {
    \global
    %\notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}


Vvla = {
    \global
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \global
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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIvlIn = \relative do'' {

    re16 re re re re re re re
    la' re, re re re re re re
    la' re, re re re re re re

    %4
    la'8 [sol16 fad mi8 re]
    dod si la4
    re16 re re re re re re re

    %7
    la' re, re re re re re re\mbreak
    la' re, re re re re re re
    la'8[sol16 fad mi8 re]

    %10
    la4 r8 la'
    la16 la la la la la la la
    si[la sol fad mi re dod si]

    %13
    sol'[sol sol sol sol sol sol sol]
    la[sol fad mi re dod si la]\mbreak
    fad'[fad fad fad fad fad fad fad]

    %16
    sol[fad mi re dod si la sol]
    mi'[mi mi mi mi mi mi mi]
    fad[re re re re re re re]

    %19
    la'[re, re re re re re re]
    la'[re, re re re re re re]
    re'4. dod16 si

    %22
    la8[sol16 fad mi8 la,]\mbreak
    re8 re'4 dod16 si
    la8[sol16 fad mi8 la,]

    %25
    re4 r
    re16[re re re re re re re]
    la'[re, re re re re re re]

    %28
    la'[re, re re re re re re]
    la'8[sol16 fad mi8 re]
    dod la la,4

    %31
    la'16[la la la la la la la]\mbreak
    mi'[la, la la la la la la]
    mi'[la, la la la la la la]

    %34
    fad'8 mi4 la,8
    sold' la4 la,8\mbreak
    sold' la4 sold16 fad

    %37
    mi8[re16 dod si8 mi,]
    la, la''4 sold16 fad
    mi8[re16 dod si8 mi,]

    %40
    la4 r
    dod16[dod dod dod dod dod dod dod]
    fad dod dod dod fad dod dod dod

    %43
    re si si si si si si si\mbreak
    sold' red red red sold red red red
    mid dod dod dod fad dod dod dod

    %46
    sold' dod, dod dod la' dod, dod dod
    si' dod, dod dod la' dod, dod dod
    sold' dod, dod dod fad dod dod dod

    %49
    mid dod dod dod fad dod dod dod
    sold' dod, dod dod la' dod, dod dod\mbreak
    si'4. la16 sold

    %52
    la8[sold16 fad dod8 dod,]
    fad si'4 la16 sold
    la8[sold16 fad dod8 dod,]

    %55
    fad 4 r
    fad'16 fad fad fad la la la la
    red, red red red fad fad fad fad

    %58
    sid, sid sid sid red red red red\mbreak
    fad, fad fad fad sold sold sold sold
    mi8 dod dod4

    %61
    mi'16 mi mi mi sol! sol sol sol
    dod, dod dod dod mi mi mi mi
    lad, lad lad lad dod dod dod dod

    %64
    mi, mi mi mi fad fad fad fad
    re8 si si4
    si'16[si si si si si si si]

    %67
    fad' [si, si si si si si si]\mbreak
    sol'[si, si si si si si si]
    lad'8 si4 si,8

    %70
    lad'8 si4 la?16 sol
    fad8[mi16 re dod8 fad,]
    si, si''4 la16 sol

    %73
    fad8[mi16 re dod8 fad,]\mbreak
    si4 r
    re16[re re re re re re re]

    %76
    la'[re, re re re re re re]
    la'[re, re re re re re re]
    la'8[sol16 fad mi8 re]

    %79
    dod si la4
    la'16 [la la la la la la la]
    si[la sol fad mi re dod si]

    %82
    sol'[sol sol sol sol sol sol sol]\mbreak
    la[sol fad mi re dod si la]
    fad'[fad fad fad fad fad fad fad]

    %85
    sol[fad mi re dod si la sol]
    mi'[mi mi mi mi mi mi mi]
    fad[re re re re re re re]

    %88
    la'[re, re re re re re re]
    la'[re, re re re re re re]
    re'4. dod16 si\mbreak

    %91
    la8[sol16 fad mi8 la,]
    re re'4 dod16 si
    la8[sol16 fad mi8 la,]

    %94
    re4 r8 la
    re16[la la la la la la la]
    si[sol sol sol sol sol sol sol]

    %97
    mi'[si si si si si si si]
    dod[la la la la la la la]\mbreak
    fad'[dod dod dod dod dod dod dod]

    %100
    re[si si si si si si si]
    sol'[re re re re re re re]
    mi[dod dod dod dod dod dod dod]

    %103
    la'[mi mi mi mi mi mi mi]
    fad[la sol fad mi re dod si]
    la re dod si la sol fad mi

    %106
    re re re re re re re re\mbreak
    la'[re, re re re re re re]
    si'8 la4 re,8

    %109
    dod' re4 re,8
    dod' re4 dod16 si
    la8[sol16 fad mi8 la,]

    %112
    re re'4 dod16 si
    la8[sol16 fad mi8 la,]\mbreak
    re16[re re re re re re re]

    %115
    la'[re, re re re re re re]
    la'[re, re re re re re re]
    re'8 [sol, la la,]

    %118
    re2\fermata

}

VIvlIIn = \relative do'' {

    re16 re re re re re re re
    la' re, re re re re re re
    la' re, re re re re re re

    %4
    la'8 [sol16 fad mi8 re]
    dod si la4
    re16 re re re re re re re

    %7
    la' re, re re re re re re\mbreak
    la' re, re re re re re re
    la'8[sol16 fad mi8 re]

    %10
    la4 r8 la'
    la16 la la la la la la la
    si[la sol fad mi re dod si]

    %13
    sol'[sol sol sol sol sol sol sol]
    la[sol fad mi re dod si la]\mbreak
    fad'[fad fad fad fad fad fad fad]

    %16
    sol[fad mi re dod si la sol]
    mi'[mi mi mi mi mi mi mi]
    fad[re re re re re re re]

    %19
    la'[re, re re re re re re]
    la'[re, re re re re re re]
    re'4. dod16 si

    %22
    la8[sol16 fad mi8 la,]\mbreak
    re8 re'4 dod16 si
    la8[sol16 fad mi8 la,]

    %25
    re4 r
    re16[re re re re re re re]
    la'[re, re re re re re re]

    %28
    la'[re, re re re re re re]
    la'8[sol16 fad mi8 re]
    dod la la,4

    %31
    la'16[la la la la la la la]\mbreak
    mi'[la, la la la la la la]
    mi'[la, la la la la la la]

    %34
    fad'8 mi4 la,8
    sold' la4 la,8\mbreak
    sold' la4 sold16 fad

    %37
    mi8[re16 dod si8 mi,]
    la, la''4 sold16 fad
    mi8[re16 dod si8 mi,]

    %40
    la4 r
    dod16[dod dod dod dod dod dod dod]
    fad dod dod dod fad dod dod dod

    %43
    re si si si si si si si\mbreak
    sold' red red red sold red red red
    mid dod dod dod fad dod dod dod

    %46
    sold' dod, dod dod la' dod, dod dod
    si' dod, dod dod la' dod, dod dod
    sold' dod, dod dod fad dod dod dod

    %49
    mid dod dod dod fad dod dod dod
    sold' dod, dod dod la' dod, dod dod\mbreak
    si'4. la16 sold

    %52
    la8[sold16 fad dod8 dod,]
    fad si'4 la16 sold
    la8[sold16 fad dod8 dod,]

    %55
    fad 4 r
    fad'16 fad fad fad la la la la
    red, red red red fad fad fad fad

    %58
    sid, sid sid sid red red red red\mbreak
    fad, fad fad fad sold sold sold sold
    mi8 dod dod4

    %61
    mi'16 mi mi mi sol! sol sol sol
    dod, dod dod dod mi mi mi mi
    lad, lad lad lad dod dod dod dod

    %64
    mi, mi mi mi fad fad fad fad
    re8 si si4
    si'16[si si si si si si si]

    %67
    fad' [si, si si si si si si]\mbreak
    sol'[si, si si si si si si]
    lad'8 si4 si,8

    %70
    lad'8 si4 la?16 sol
    fad8[mi16 re dod8 fad,]
    si, si''4 la16 sol

    %73
    fad8[mi16 re dod8 fad,]\mbreak
    si4 r
    re16[re re re re re re re]

    %76
    la'[re, re re re re re re]
    la'[re, re re re re re re]
    la'8[sol16 fad mi8 re]

    %79
    dod si la4
    la'16 [la la la la la la la]
    si[la sol fad mi re dod si]

    %82
    sol'[sol sol sol sol sol sol sol]\mbreak
    la[sol fad mi re dod si la]
    fad'[fad fad fad fad fad fad fad]

    %85
    sol[fad mi re dod si la sol]
    mi'[mi mi mi mi mi mi mi]
    fad[re re re re re re re]

    %88
    la'[re, re re re re re re]
    la'[re, re re re re re re]
    re'4. dod16 si\mbreak

    %91
    la8[sol16 fad mi8 la,]
    re re'4 dod16 si
    la8[sol16 fad mi8 la,]

    %94
    re4 r8 la
    re16[la la la la la la la]
    si[sol sol sol sol sol sol sol]

    %97
    mi'[si si si si si si si]
    dod[la la la la la la la]\mbreak
    fad'[dod dod dod dod dod dod dod]

    %100
    re[si si si si si si si]
    sol'[re re re re re re re]
    mi[dod dod dod dod dod dod dod]

    %103
    la'[mi mi mi mi mi mi mi]
    fad[la sol fad mi re dod si]
    la re dod si la sol fad mi

    %106
    re re re re re re re re\mbreak
    la'[re, re re re re re re]
    si'8 la4 re,8

    %109
    dod' re4 re,8
    dod' re4 dod16 si
    la8[sol16 fad mi8 la,]

    %112
    re re'4 dod16 si
    la8[sol16 fad mi8 la,]\mbreak
    re16[re re re re re re re]

    %115
    la'[re, re re re re re re]
    la'[re, re re re re re re]
    re'8 [sol, la la,]

    %118
    re2\fermata

}

VIvlan = \relative do' {

    re8 [mi fad mi]
    re8 [mi fad mi]
    re8 [mi fad mi]

    %4
    re[mi fad sol]
    la[sol fad mi]
    re8 [mi fad mi]

    %7
    re8 [mi fad mi]\mbreak
    re8 [mi fad mi]
    re[mi fad sol]

    %10
    la[sol fad mi]
    re[mi fad re]
    sol[la si sol]

    %13
    mi[fad sol mi]
    fad[sol la fad]\mbreak
    re[mi fad re]

    %16
    mi[fad sol mi]
    dod[re mi dod]
    re[mi fad mi]

    %19
    re[mi fad mi]
    re[mi fad mi]
    re [mi fad sol]

    %22
    fad[re la' la,]\mbreak
    re[mi fad sol]
    fad[re la' la,]

    %25
    re4 r
    re8[mi fad mi]
    re[mi fad mi]

    %28
    re[mi fad mi]
    re[mi fad sol]
    la,[si dod si]

    %31
    la[si dod si]\mbreak
    la[si dod si]
    la[si dod si]

    %34
    la[si dod la]
    mi'[dod si la]\mbreak
    mi'[fad mi re]

    %37
    dod[la mi' mi,]
    la[si dod re]
    dod[la mi' mi,]

    %40
    la4 r
    fad'8[sold lad sold]
    fad[sold lad fad]

    %43
    si[dod re dod]\mbreak
    sid[lad sid sold?]
    dod[si? la? fad]

    %46
    mid dod fad, fad'
    mid dod fad, fad'
    mi[dod' la fad]

    %49
    dod'[si la fad]
    mid dod fad, fad'\mbreak
    sold[fad mid dod]

    %52
    fad,[fad' dod' dod,]
    fad[sold mid dod]
    fad,[fad' dod' dod,]

    %55
    fad,4 r
    la'8[sold fad la]
    fad[mi red fad]

    %58
    red[dod sid red]\mbreak
    sid[lad sold sid]
    dod[red mi dod]

    %61
    sol'![fad mi sol]
    mi[re? dod mi]
    dod[si lad dod]

    %64
    lad[sold fad lad]
    si[dod re dod]
    si[dod re dod]

    %67
    si[dod re \parenthesize si]\mbreak
    mi[fad sol mi]
    fad[re dod si]

    %70
    fad'[sol fad mi]
    re si fad' fad,
    si[dod re mi]

    %73
    re[si fad' fad,]\mbreak
    si4 r
    re8[mi fad mi]

    %76
    re8[mi fad mi]
    re8[mi fad mi]
    re[mi fad sol]

    %79
    la[sol fad mi]
    re[mi fad re]
    sol[la si sol]

    %82
    mi[fad sol mi]\mbreak
    fad[sol la fad]
    re[mi fad re]

    %85
    mi[fad sol mi]
    dod[re mi dod]
    re[mi fad mi]

    %88
    re[mi fad mi]
    re[mi fad mi]
    re[mi fad sol]\mbreak

    %91
    fad[re la' la,]
    re[mi fad sol]
    fad[re la' la,]

    %94
    re [mi fad mi]
    re[mi fad re]
    sol[la si la]

    %97
    sold[fad sold mi]
    la[si dod si]\mbreak
    lad[sold lad fad]

    %100
    si[dod re dod]
    si[la? si sol?]
    dod,[re mi dod]

    %103
    la[si dod la]
    re[mi fad sol]
    fad re dod la

    %106
    re[mi fad mi]\mbreak
    re [mi fad mi]
    re [mi fad re]

    %109
    la'[fad mi re]
    la'[si la sol]
    fad[re la' la,]

    %112
    re[mi fad sol]
    fad[re la' la,]\mbreak
    re [mi fad mi]

    %115
    re [mi fad mi]
    re [mi fad re]\mbreak
    re'[sol, la la,]

    %118
    re,2\fermata

}


VIbcn = \relative do {

    re8 [mi fad mi]
    re8 [mi fad mi]
    re8 [mi fad mi]

    %4
    re[mi fad sol]
    la[sol fad mi]
    re8 [mi fad mi]

    %7
    re8 [mi fad mi]\mbreak
    re8 [mi fad mi]
    re[mi fad sol]

    %10
    la[sol fad mi]
    re[mi fad re]
    sol[la si sol]

    %13
    mi[fad sol mi]
    fad[sol la fad]\mbreak
    re[mi fad re]

    %16
    mi[fad sol mi]
    dod[re mi dod]
    re[mi fad mi]

    %19
    re[mi fad mi]
    re[mi fad mi]
    re [mi fad sol]

    %22
    fad[re la' la,]\mbreak
    re[mi fad sol]
    fad[re la' la,]

    %25
    re4 r
    re8[mi fad mi]
    re[mi fad mi]

    %28
    re[mi fad mi]
    re[mi fad sol]
    la,[si dod si]

    %31
    la[si dod si]\mbreak
    la[si dod si]
    la[si dod si]

    %34
    la[si dod la]
    mi'[dod si la]\mbreak
    mi'[fad mi re]

    %37
    dod[la mi' mi,]
    la[si dod re]
    dod[la mi' mi,]

    %40
    la4 r
    fad'8[sold lad sold]
    fad[sold lad fad]

    %43
    si[dod re dod]\mbreak
    sid[lad sid sold?]
    dod[si? la? fad]

    %46
    mid dod fad, fad'
    mid dod fad, fad'
    mi[dod' la fad]

    %49
    dod'[si la fad]
    mid dod fad, fad'\mbreak
    sold[fad mid dod]

    %52
    fad,[fad' dod' dod,]
    fad[sold mid dod]
    fad,[fad' dod' dod,]

    %55
    fad,4 r
    la'8[sold fad la]
    fad[mi red fad]

    %58
    red[dod sid red]\mbreak
    sid[lad sold sid]
    dod[red mi dod]

    %61
    sol'![fad mi sol]
    mi[re? dod mi]
    dod[si lad dod]

    %64
    lad[sold fad lad]
    si[dod re dod]
    si[dod re dod]

    %67
    si[dod re \parenthesize si]\mbreak
    mi[fad sol mi]
    fad[re dod si]

    %70
    fad'[sol fad mi]
    re si fad' fad,
    si[dod re mi]

    %73
    re[si fad' fad,]\mbreak
    si4 r
    re8[mi fad mi]

    %76
    re8[mi fad mi]
    re8[mi fad mi]
    re[mi fad sol]

    %79
    la[sol fad mi]
    re[mi fad re]
    sol[la si sol]

    %82
    mi[fad sol mi]\mbreak
    fad[sol la fad]
    re[mi fad re]

    %85
    mi[fad sol mi]
    dod[re mi dod]
    re[mi fad mi]

    %88
    re[mi fad mi]
    re[mi fad mi]
    re[mi fad sol]\mbreak

    %91
    fad[re la' la,]
    re[mi fad sol]
    fad[re la' la,]

    %94
    re [mi fad mi]
    re[mi fad re]
    sol[la si la]

    %97
    sold[fad sold mi]
    la[si dod si]\mbreak
    lad[sold lad fad]

    %100
    si[dod re dod]
    si[la? si sol?]
    dod,[re mi dod]

    %103
    la[si dod la]
    re[mi fad sol]
    fad re dod la

    %106
    re[mi fad mi]\mbreak
    re [mi fad mi]
    re [mi fad re]

    %109
    la'[fad mi re]
    la'[si la sol]
    fad[re la' la,]

    %112
    re[mi fad sol]
    fad[re la' la,]\mbreak
    re [mi fad mi]

    %115
    re [mi fad mi]
    re [mi fad re]\mbreak
    re'[sol, la la,]

    %118
    re,2\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*33
    <6 4>2
    <_+>
    <_+>
    s2*4
    <_+>2
    <_+>
    s
    s
    <_+>
    s
    <6 5>8 <7> s4
    s2
    <_+>
    s
    s4 s8 <7>
    s2
    s4 s8 <7>
    s2*3
    <6+>2
    <6+>
    <6 5>
    s
    s
    <6>
    <6+>
    <6 5>
    s2*4
    <_+>2
    <_+>
    s2*37
    <6 4>4 <5 3>

}

forma = {

    \time 2/4
    \key re\major
    \tempo 2 = 65
    s2*118
    \bar"|."

}



VIvlI = {
    \global
    %\notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}


VIvla = {
    \global
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \header {
        title = \markup\smaller{Concerto di Parigi n. 8 in Re minore [RV 127]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"Vio[lin]i""unis[oni]"}
                \set Staff.shortInstrumentName = "vl"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #9
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

%\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[2.] Largo }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\column  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

%\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[3.] All[egr]o}

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Vio[lin]i""unis[oni]"}
                \set Staff.shortInstrumentName = "vl"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #9
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Concerto di Parigi n. 10 in Re maggiore [RV 121]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o molto }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino II]"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    %\pageBreak

    \markup \huge {[2.] Ad[agi]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino II]"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino II]"}
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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