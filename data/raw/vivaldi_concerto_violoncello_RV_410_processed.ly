\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

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
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IvlIn =  \relative do'' {

    fa8 fa4 fa fa8
    mi mi4 mi mi8
    sib' sib4 sib sib8

    %4
    la la4 la la8 %%%%%fine prima ripresina
    do do4 do do8
    sib sib4 sib sib8

    %7
    la la4 la la8
    sol4 r8 do, si4\tr
    do r8 sib'? la4\tr\mbreak

    %10
    sol r8 do, si4\tr
    do r8 sib'? la4\tr
    sol r8 sol16[fa mi re do sib]

    %13
    la4 r8 fa'16[mi re do sib la]
    sol4 r8 mi'16 [re do sib la sol]
    fa4 r8 re'16[do sib la sol fa]

    %16
    mi8 sib''4 sib sib8
    la16 fa do fa la fa do fa la fa do fa\mbreak  %%% riprende da qui
    sib8 sib4 sib sib8

    %19
    la16 fa do fa la fa do fa la fa do fa
    sol mi do mi sol mi do mi sol mi do mi
    fa4 r r %%%fine ripresa

    %22
    R2.*16
    do8 do4 do do8
    si8 si4 si si8

    %40
    fa' fa4 fa fa8
    mi mi4 mi mi8\mbreak
    sol sol4 sol sol8

    %43
    fa fa4 fa fa8
    mi mi4 mi mi8
    re4 r8 sol fad4\tr

    %46
    sol r8 fa! mi4\tr
    re r8 sol fad4\tr
    sol r8 fa! mi4\tr

    %49
    re8 fa4 fa fa8
    mi16 do sol do mi do sol do mi do sol do
    fa8 fa4 fa fa8\mbreak % fine p4

    %52
    mi16 do sol do mi do sol do mi do sol do
    re si sol si re si sol si re si sol si
    do4 r r

    %55
    R2.*7
    re,4 re re
    do do do

    %64
    do do do
    sib sib sib
    sib sib sib\mbreak

    %67
    la la la
    la la la
    re re re

    %70
    sol, sol sol
    sib' sib, r
    la' la, r

    %73
    re' re, r
    sol la la,\mbreak
    re'8 re4 re re8

    %76
    dod dod4 dod dod8
    sol' sol4 sol sol8
    fa4 r8 la16[sol fa mi re do?]  %%%%%%%5fin qui OK bar 79

    %79
    sib4 r8 sol'16[fa mi re do sib]
    la4 r8 fa'16[mi re do sib la]
    sol4 r8 mi'16[re do sib la sol]

    %82
    fa4 r8 fa'16[mi re do si la]
    sold8 re'4 re re8\mbreak
    do16 mi la mi do mi la mi do mi la do,

    %85
    si mi la mi si  mi la mi si mi la mi
    si mi sold mi si mi sold mi si mi sold mi
    do8 la do mi la do

    %88
    r sold, si mi sold si
    r do, mi la do mi\mbreak
    r la,, re fa la re

    %91
    r mi,, sold si mi si'
    r mi,, la dod mi la
    r re,, fad la re la'

    %94
    r re,, sol si re sol
    r do,, mi sol do sol'
    r do,, fa la do fa\mbreak

    %97
    r re, fa sib re fa
    r mi, sol do mi sol
    fa fa4 fa fa8

    %100
    mi  mi4 mi  mi8
    sib' sib4 sib sib8
    la la4 la la8

    %103
    sol4 r8 do, si4\tr
    do r8 sib'? la4\tr
    sol r8 do, si4\tr \mbreak

    %106
    do r8 sib'? la4\tr
    sol4 r r
    R2.*23

    %131
    \footnote #' (-1 . 3) \markup\column\smaller {"Nota autografa di Vivaldi ai copisti per la coda: «Scrivete D.C. poi dà uno # si passa all'altro # sino al segno 𝄐»" "  "} fa8 fa4 fa fa8
    mi mi4 mi mi8
    sib' sib4 sib sib8

    %134
    la16 fa do fa la fa do fa la fa do fa\mbreak
    sib8 sib4 sib sib8
    la16 fa do fa la fa do fa la fa do fa

    %137
    sol mi do mi sol mi do mi sol mi do mi
    fa4\fermata r r

}

IvlIIn = \relative do'' {

    fa4 fa fa
    mi mi mi
    sib' sib sib % fine I rip

    %4
    la la la
    do do do
    sib sib sib

    %7
    la la la
    sol r8 mi fa4\tr
    mi4 r8 sol fa4\tr \mbreak

    %10
    mi r8 mi fa4\tr
    mi r8 sol fa4\tr
    mi r r8 mi

    %13
    mi16 la sol la re,4 r8 re
    re16 sol fa sol do,4 r8 do
    do16 fa mi fa sib,4 r8 sib

    %16
    sib sol'4 sol sol8
    fa16 do la do fa do la do fa do la la'\mbreak %% inizio 2da rip
    sol8 sol4 sol sol8

    %19
    fa16 do la do fa do la do fa do la do
    mi do sol do mi do sol do mi do sol do
    la4 r r %% fine rip.

    %22
    R2.*16
    do4 do do
    si si si

    %40
    fa' fa fa
    mi mi mi\mbreak
    sol sol sol

    %43
    fa fa fa
    mi mi mi
    re r8 si do4\tr

    %46
    si r8 re do4\tr
    si r8 si do4\tr
    si r8 si do4\tr

    %49
    si8 re4 re re8
    do16 sol mi sol do sol mi sol do sol mi mi'
    re8 re4 re re8\mbreak

    %52
    do16 sol mi sol do sol mi sol do sol mi sol
    si sol re sol si sol re sol si sol re sol
    mi4 r r

    %55
    R2.*7
    re4 re re
    do do do

    %64
    do do do
    sib sib sib
    sib sib sib\mbreak

    %67
    la la la
    la la la
    re re re

    %70
    sol, sol sol
    sib' sib, r
    la' la, r

    %73
    re' re, r
    sol la la,\mbreak
    fa''4 fa fa

    %76
    mi mi mi
    mi mi mi
    re r r8 fa

    %79
    fa16 sib la sib mi,4 r8 mi
    mi16 la sol la re,4 r8 re
    re16 sol fa sol do,4 r8 do

    %82
    do16 fa mi fa si,4 r8 si
    si? sold'4 sold sold8\mbreak
    la16 mi do mi la mi do mi la mi do la'

    %85
    la mi si mi la mi si mi la mi si mi
    sold mi si mi sold mi si mi sold mi si sold'
    la4 r r

    %88
    R2.*11
    la8 la4 la la8
    sol sol4 sol sol8

    %101
    sol sol4 sol sol8
    fa fa4 fa fa8
    mi4 r8 mi fa4\tr

    %104
    mi r8 sol fa4\tr
    mi4 r8 mi fa4\tr \mbreak
    mi r8 sol fa4\tr

    %107
    mi4 r r
    R2.*23
    fa4 fa fa

    %132
    mi mi mi
    sib' sib sib
    fa16 do la do fa do la do fa do la la'\mbreak %% inizio 2da rip

    %135
    sol8 sol4 sol sol8
    fa16 do la do fa do la do fa do la do
    mi do sol do mi do sol do mi do sol do

    %138
    la4\fermata r r

}

Ivlan = \relative do'{

    la'4 la la
    sol sol sol
    mi mi mi %%% fine I rip

    %4
    do do do
    la' la la
    sol sol sol

    %7
    fa fa fa
    mi sol sol
    sol mi do\mbreak

    %10
    do sol' sol
    sol mi do
    do mi mi

    %13
    do fa fa
    sib, mi mi
    la, re re

    %16
    sol,8[mi'16 fa sol8 fa sol mi]
    do4 do do % tinizio 2da rip
    mi8[mi16 fa sol8 fa sol mi]

    %19
    do4 do do
    do do do
    do r r %%%% fine rip

    %22
    R2.*16
    mi4  mi mi
    re re re

    %40
    si' si si
    sol sol sol\mbreak
    mi mi mi

    %43
    re re re
    do do do
    si re re

    %46
    re si sol
    sol re' re
    re si sol

    %49
    sol8[si16 do re8 do re si]
    sol4 sol sol
    sol8[si16 do re8 do re si]\mbreak

    %52
    sol4 sol sol
    sol sol sol
    sol4 r r

    %55
    R2.*7
    re'4 re re
    do do do

    %64
    do do do
    sib sib sib
    sib sib sib\mbreak

    %67
    la la la
    la la la
    re re re

    %70
    sol, sol sol
    sib' sib, r
    la' la, r

    %73
    re' re, r
    sol la la,\mbreak
    la' la la

    %76
    la la la
    dod dod dod
    la la la8 fa

    %79
    re4 sib' sib
    do, la' la
    sib, sol' sol

    %82
    la, fa' fa
    mi si' si\mbreak
    la mi mi

    %85
    mi mi mi
    mi mi mi
    mi4 r r

    %88
    R2.*11
    do'4 do do
    do do do

    %101
    mi, mi mi
    do do do
    do sol' sol

    %104
    sol mi do
    do sol' sol\mbreak
    sol mi do

    %107
    do r r
    R2.*23
     la'4 la la

    %132
    sol sol sol
    mi mi mi %%% fine I rip
    do4 do do % tinizio 2da rip

    %135
    mi8[mi16 fa sol8 fa sol mi]
    do4 do do
    do do do

    %138
    do\fermata r r

}

Ivcn = \relative do{

    r8 fa16[mi fa8 sol la fa]
    r do16[sib do8 re mi do]
    r do'16[sib do8 re mi do]

    %4
    r fa,16[mi fa8 sol la fa]  %%% fine I ripresa
    r fa,16[mi fa8 sol la fa]
    r do'16[sib do8 re mi do]

    %7
    r8 fa16[mi fa8 sol la fa]
    do do4 do do8
    do do4 do do8\mbreak

    %10
    do do4 do do8
    do do4 do do8
    do do4 do do8

    %13
    fa fa4 fa fa8
    mi mi4 mi mi8
    re re4 re re8

    %16
    do[do16 re mi8 re mi do]
    fa fa4 fa fa8\mbreak  %%% II rip.
    do[do16 re mi8 re mi do]

    %19
    fa fa4 fa fa8
    do' do4 do, do8
    \clef tenor fa fa4 fa la16 sib %% fine rip

    %22
    do8 do4 do re16 mi
    fa8 fa4 fa sol16(fa)
    mi[(fa) sol(fa) mi(re) do(si)] do4

    %25
    la16 fa' mi fa la, fa' mi fa la, fa' mi fa\mbreak
    sol,8(sib mi fa sol4)
    mi,16 do' sib do mi, do' sib do mi, do' sib do

    %28
    la8 \clef bass fa do la fa4
    \clef tenor r8 fa'16 sol la8 sol16 fa do'8 sib16 la
    sol8 mi16 fa sol8 fa16 mi sib'8 la16 sol

    %31
    la8 fa16 sol la8 sib16 do re8 mi16 fa
    fa4(sol,8) la16 si do8 re16 mi
    mi4(fa,8) sol16 la si8 do16 re\mbreak

    %34
    re8(mi,16) do' do8(re,16) si' si8(do,16) la'
    \appoggiatura la8 si4. si16[(do re mi fa8)]
    fa4. mi16[re do si la sol]

    %37
    \clef bass \once\stemUp sol, do' si do \once\stemUp sol, do' si do \once\stemUp sol, si' la si  %% OK
    do,8[do16 re mi8 re mi do]
    r sol16 [la si8 la si sol]

    %40
    r sol16[la si8 la si sol]
    r do16[re mi8 re mi do]\mbreak
    r do16[re mi8 re mi do]

    %43
    r sol16[la si8 la si sol]
    r do16[re mi8 re mi do]
    sol' sol4 sol sol8

    %46
    sol sol4 sol sol8
    sol sol4 sol sol8
    sol sol4 sol sol8

    %49
    sol[sol,16 la si8 la si sol]
    do do4 do do8
    si[sol16 la si8 la si sol]\mbreak

    %52
    do do4 do do8
    sol' sol4 sol, sol8 %%%OK
    \clef tenor do'16 si do re do sol fa sol re sol fa sol

    %55
    do si do re do sol fa sol re sol fa sol
    mi8 do mi sol do mi
    re\clef bass si sol re sol, r

    %58
    \clef tenor re''16 [dod re mi re fa, mi re]\clef bass la la' si dod
    re dod re mi re fa, mi re la la' si dod
    re8 re, fa la re fa

    %61
    mi la, mi dod la r
    \clef tenor fa''4 fa\tr\(~fa8~fa32 mi fa sol\)
    mi8\staccatissimo do?\staccatissimo la\staccatissimo mi\staccatissimo la\staccatissimo do\staccatissimo

    %64
    mi4 mi\tr\(~mi8~mi32 re mi fa\)
    re8\staccatissimo sib\staccatissimo sol\staccatissimo re\staccatissimo sol\staccatissimo sib\staccatissimo
    re4 re\tr\(~re8~re32 dod re mi\)\mbreak

    %67
    dod16 mi dod la dod mi dod la dod mi dod la
    sol8 dod, sol' dod mi sol,
    \clef bass fa16 la fa re fa la fa re fa la fa re

    %70
    sib8 sol sib re sol sib
    \clef tenor re4. do16[(sib) la(sol) fa(mi)]
    mi'4. re16[(dod) si(la) sol(fa)]

    %73
    fa'4. mi16(re) do? (sib?) la(sol)
    sol'(mi re mi) mi2\tr\mbreak
    re8[\clef bass re,16 mi fa8 mi fa re]

    %76
    r la16[si dod8 si dod la]
    r la16[si dod8 si dod la]
    re re4 re re8

    %79
    sol sol4 sol sol8
    fa fa4 fa fa8
    mi mi4 mi mi8

    %82
    re re4 re re8
    mi[mi16 fad sold8 fad sold mi]\mbreak
    la4 la, la

    %85
    mi' mi mi
    mi, mi mi
    la16 mi' mi la la do do mi mi do do si

    %88
    si? mi, mi sold sold si! si re re si si do
    do la, la do do mi mi la la do do mi,\mbreak
    fa re re fa fa la la re re fa fa sold,

    %91
    sold?4~sold16 fa' fa mi mi re re dod
    dod? mi mi la, la mi' mi sol, ?sol mi' mi fad,
    fad?4~fad16 mi' mi re re do do si

    %94
    si? re re sol, sol re' re fa,? fa re' re mi,
    mi4~mi16 re' re do do sib? sib la
    la do do fa, fa do' do mib, mib do' do re,\mbreak

    %97
    re sib sib re re fa fa sib sib re re mi,?
    mi do do mi mi sol sol do do sib sib la
    la8[fa16 sol la8 sol la fa]

    %100
    r do16[re mi8 re mi do]
    r do16[re mi8 re mi do]
    r fa,16[sol la8 sol la fa]

    %103
    do' do4 do do8
    do do4 do do8
    do do4 do do8\mbreak

    %106
    do do4 do do8
    do do4 do re16 mi
    fa8 fa4 fa la16 sib

    %109
    \clef tenor do8 do4 do re16 mi
    fa8 fa4 fa sol16(fa)
    mi(fa) sol(fa) mi(re) do(si) do4

    %112
    fa,8 fa4 fa fa32(sol la sib)
    do8 do4 do la32(sib do re)
    mib8 mib4 mib re16 do\mbreak

    %115
    re16(do sib) la sib\clef bass fa re fa sib,8 r
    \clef tenor sol' sol4 sol sol32(la si do)
    re8 re4 re si32(do re mi)

    %118
    fa8 fa4 fa mi16 re
    mi16(re do) si do\clef bass sol mi sol do,8 r
    \clef tenor mi'16(fa) sol(fa) sol[(fa) mi(re) do(sib?) la(sol)]

    %121
    re'(mi) fa(mi) fa[mi re do sib la sol fa]\mbreak
    do' re mi re mi re do sib la sol fa mi
    sib' do re do re do sib la sol fa mi re

    %124
    \once\stemUp do8 mi'(fa sol  mi do)
    sib(mi sol mi do sib)
    la(fa' sol la fa do)

    %127
    sib(sol' la sib sol re)
    do8 la16(sib) do(sib) do(la) re(do) re(sib)
    mi(re) mi(do) fa(mi) fa(re) sol(fa) sol(mi)

    %130
    la8 sol16 fa sol2\tr
    fa8[\clef bass fa,16 mi fa8 sol la fa]
    r do16[sib do8 re mi do]

    %133
    r do'16[sib do8 re mi do]
    fa, fa4 fa fa8
    do[do16 re mi8 re mi do]

    %136
    fa fa4 fa fa8
    do' do4 do, do8
    fa4\fermata r r

}

Ibcn = \relative do {

    r8 fa16[mi fa8 sol la fa]
    r do16[sib do8 re mi do]
    r do'16[sib do8 re mi do]

    %4
    r fa,16[mi fa8 sol la fa]  %%% ripresa
    r fa,16[mi fa8 sol la fa]
    r do'16[sib do8 re mi do]

    %7
    r8 fa16[mi fa8 sol la fa]
    do do4 do do8
    do do4 do do8\mbreak

    %10
    do do4 do do8
    do do4 do do8
    do do4 do do8

    %13
    fa fa4 fa fa8
    mi mi4 mi mi8
    re re4 re re8

    %16
    do[do16 re mi8 re mi do]
    fa fa4 fa fa8\mbreak
    do[do16 re mi8 re mi do]

    %19
    fa fa4 fa fa8
    do' do4 do, do8
    fa4 fa fa %%%% fine ripresa

    %22
    mi mi mi
    re re si
    do2 do,4

    %25
    fa' fa fa\mbreak
    mi2.
    do4 do do

    %28
    fa la, fa
    fa' fa fa
    mi mi mi

    %31
    fa fa fa
    sol sol do,
    fa fa sol\mbreak

    %34
    mi re do8 fa,
    sol4 sol sol
    sol sol sol

    %37
    sol sol sol
    do8[do16 re mi8 re mi do]
    r sol16 [la si8 la si sol]

    %40
    r sol16[la si8 la si sol]
    r do16[re mi8 re mi do]\mbreak
    r do16[re mi8 re mi do]

    %43
    r sol16[la si8 la si sol]
    r do16[re mi8 re mi do]
    sol' sol4 sol sol8

    %46
    sol sol4 sol sol8
    sol sol4 sol sol8
    sol sol4 sol sol8

    %49
    sol[sol,16 la si8 la si sol]
    do do4 do do8
    si[sol16 la si8 la si sol]\mbreak

    %52
    do do4 do do8
    sol' sol4 sol, sol8 %%%OK
    do4 r si

    %55
    do r si
    do2 r4
    sol2 r4

    %58
    re' r \mbreak la
    re r la
    re2 r4

    %61
    la2 r4
    R2.*13
    re8[re16 mi fa8 mi fa re]

    %76
    r la16[si dod8 si dod la]
    r la16[si dod8 si dod la]
    re re4 re re8

    %79
    sol sol4 sol sol8
    fa fa4 fa fa8
    mi mi4 mi mi8

    %82
    re re4 re re8
    mi[mi16 fad sold8 fad sold mi]\mbreak
    la4 la, la

    %85
    mi' mi mi
    mi, mi mi
    la la la

    %88
    mi' mi mi
    la, la la\mbreak
    re re re

    %91
    mi mi mi
    la, la la
    re re re

    %94
    sol, sol sol
    do do do
    fa, fa fa\mbreak

    %97
    sib sib sib
    do do do
    fa,8[fa'16 sol la8 sol la fa]

    %100
    r do16[re mi8 re mi do]
    r do16[re mi8 re mi do]
    r fa,16[sol la8 sol la fa]

    %103
    do' do4 do do8
    do do4 do do8
    do do4 do do8\mbreak

    %106
    do do4 do do8
    do4 do sib
    la sol fa

    %109
    mi mi mi
    re re si'
    do2 do,4

    %112
    la' la la
    la la la
    la la la\mbreak

    %115
    sib sib sib
    si si si
    si? si si

    %118
    si? si si
    do do do
    do' do, r

    %121
    sib' sib, r
    la' la, r
    sol' sol, r

    %124
    do2 r4
    do2 r4
    fa2 r4

    %127
    sol2 r4
    la la, sib
    do re mi

    %130
    fa do2
    fa,8 [fa'16 mi fa8 sol la fa]
    r do16[sib do8 re mi do]

    %133
    r do'16[sib do8 re mi do]
    fa, fa4 fa fa8
    do[do16 re mi8 re mi do]

    %136
    fa fa4 fa fa8
    do' do4 do, do8
    fa4\fermata r r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}

forma = {

    \key fa\major
    \time 3/4
    \tempo 2 = 60
    s2.*138
    \bar"|."

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

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>

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


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IIvcn = \relative do' {

    sib4. fa'16(re) \appoggiatura do8 sib4. sol'16(do,)
    \appoggiatura sib8 la sib mib re re\tr do r do
    fa4. re16(si) sol8 fa'16(re) si8 sol'16(fa)

    %4
    mib re do8 r mib \appoggiatura re dod4. mi16 dod
    la8 sol'16 mi dod8 sib'16 sol fa mi re8 r la
    sib!4 dod\mbreak re4~\tuplet 3/2 { re16 mi(fa sol[fa mi)] }

    %7
    fa8 mi16 re dod8.\tr re16 re2
    re4. mib?16 fa si,8 do16 re sol,8 fa'
    fa\tr mib r sol lab8(do,4) re8

    %10
    sol(si,4) do8 fa,4~fa16 fa' mib re
    mib8 re16 do si8. do16\mbreak do4 r8 fa,
    sib?4. fa'16(re) \appoggiatura do8 sib4. sol'16(do,)

    %13
    \appoggiatura sib8 la sib mib re re\tr do r re,
    mib mib'~mib16 do la sol fa8 fa'~fa16 re sib la
    sol8 sol'~sol16 mib do sib la sol fa8 r do'

    %16
    reb do r fa\mbreak reb\tr do r fa,
    reb' do16 sib fa8 mib' mib4. re!16 do
    re8 fa16(sib,) la8. sib16 sib2\fermata

}

IIbcn = \relative do {

    r8 sib sib4 r8 sib sib4
    r8 sib do sib fa fa' fa4
    r8 sol, sol4 r8 sol sol4

    %4
    r8 do do4 r8 la la4
    r8 la la4 r8 re re fa
    sol sol, la' la,\mbreak fa' re re4

    %7
    r8 re la' la, re2
    r8 fa fa4 r8 si, si4
    r8 do do4 r8 lab' lab4

    %10
    r8 sol sol4 r8 lab  si,4
    r8 do sol' sol,\mbreak  do, do' do4
    r8 sib? sib4 r8 sib sib4

    %13
    r8 sib do sib fa fa' fa sib,
    do do do4 r8 re re4
    r8 mib mib4 r8 fa fa4

    %16
    r8 fa fa4\mbreak r8 fa fa4
    r8 fa fa4 r8 fa fa4
    r8 sib, fa' fa, sib2\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}

forma = {

    \key sib\major
    \time 4/4
    \tempo 4 = 40
    s1*7
    \bar":..:"
    s1*11
    \bar":|."

}

IIvc = {
    \IIglobal
    \notypeset
    \clef tenor
    <<\IIvcn \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn =  \relative do'' {

    fa,16 do fa4 sol8 la16 fa la4 sib8
    do16 la do4 mi8 fa do la fa
    mi'16 do mi4 fa8 sol16 mi sol4 la8

    %4
    sib16 sol sib4 do8 la4 r
    fa16 sol la4. fa16 do la fa mib' do la fa % inizio ripresa
    re' sib fa re sib8 r sol''16 la si4.\mbreak

    %7
    sol16 re si sol fa' re si sol mi' ?do sol mi do8 r
    do'16 la fa'4 do8 re16 sib? fa'4 re8
    do16 la fa'4 do8 re16 sib fa'4 re8

    %10
    do16 la fa' do la' fa do' la sol8 la sol sol
    fa4 r r2 %%% fine ripresa
    R1*9

    %21
    do16 sol do4 re8 mi16 do mi4 fa8\mbreak
    sol16 mi sol4 si8 do sol mi do
    sol'16 la sib!4. la16 fa do la fa' do la fa

    %24
    la' si? do4. si!16 sol re si sol' re si sol
    sol' mi do'4 sol8 la16 fa do'4 la8
    sol16 mi do'4 sol8 la16 fa do'4 la8

    %27
    si do do si\mbreak do4 r
    R1*11
    r2 mi,16 do la'4 mi8

    %40
    fa16 re la'4 fa8 mi16 do la'4 mi8
    fa16 re la'4 fa8 mi16 do la' mi do' la mi do
    sold'8 la la sold la4 r

    %43
    R1*6
    mi16 do mi4 fa8 sol16 mi sol4 la8\mbreak
    sib16 sol sib4 do8 la4 r

    %51
    R1*18
    \footnote #'(-1 . 3) \markup\column{"Vivaldi: ”D. C. al Segno # sino al Segno 𝄐”""  "} fa16 sol la4. fa16 do la fa mib' do la fa % inizio ripresa
    re' sib fa re sib8 r sol''16 la si4.\mbreak

    %71
    sol16 re si sol fa' re si sol mi'? do sol mi do8 r
    do'16 la fa'4 do8 re16 sib? fa'4 re8
    do16 la fa'4 do8 re16 sib fa'4 re8

    %74
    do16 la fa' do la' fa do' la sol8 la sol sol
    fa4\fermata r r2

}

IIIvlIIn = \relative do'' {

    r2 fa,16 do fa4 sol8
    la16 fa la4 sib8 do la fa do
    sol''16 mi sol4 fa8 mi16 do mi4 fa8

    %4
    sol16 mi sol4 la8 fa4 r
    do1 % rip
    re~\mbreak

    %7
    re2 mi
    la,16 fa do'4 la8 sib?16 fa re'4 sib8
    la16 fa do'4 la8 sib16 fa re'4 sib8

    %10
    la16 fa do' la fa' do la' fa mi8 fa4 mi8
    fa4 r r2 %% fine rip
    R1*9

    %21
    r2 do16 sol do4 re8\mbreak
    mi16 do mi4 fa8 sol mi do sol
    do1

    %24
    re
    mi16 do sol'4 mi8 fa16 do la'4 fa8
    mi16 do sol'4 mi8 fa16 do la'4 fa8

    %27
    fa mi re4\tr\mbreak mi r
    R1*11
    r2 do16 la mi'4 do8

    %40
    re16 la fa'4 re8 do16 la mi'4 do8
    re16 la fa'4 re8 do16 la mi' do la' fa do' la
    si8 do si si la4 r

    %43
    R1*6
    sol16 mi sol4 fa8 mi16 do mi4 fa8\mbreak
    sol16 mi sol4 la8 fa4 r

    %51
    R1*18
    do1 % rip
    re~\mbreak

    %71
    re2 mi
    la,16 fa do'4 la8 sib16 fa re'4 sib8
    la16 fa do'4 la8 sib16 fa re'4 sib8

    %74
    la16 fa do' la fa' do la' fa mi8 fa4 mi8
    fa4\fermata r r2

}

IIIvlan = \relative do'{

    r8 la16 [sol la8 sol] r8 la16 [sol la8 sol]
    r8 la16 [sol la8 sol] la4 la
    r8 mi'16 [re mi8 do] r8 mi16 [re mi8 do]

    %4
    r8 mi16 [re mi8 do] do4 r
    la8 sib do sib la sib do la %%% rip
    fa2 si8 do re do\mbreak

    %7
    si do re si sol2
    r8 fa'16[mi fa8 fa,] r8 fa'16[mi fa8 fa,]
    r8 fa'16[mi fa8 fa,] r8 fa'16[mi fa8 fa,]

    %10
    r8 fa'16[mi fa8 fa,] do' do do do
    la4 r r2 %%%%fine rip
    R1*9

    %21
    r8 mi'16[re mi8 re] r8 mi16[re mi8 re]
    r8 mi16[re mi8 re] mi4 mi
    mi8 fa sol mi do sib do fa

    %24
    fad sol la fad re do re sol
    r8 do16[si do8 do,] r8 do'16[si do8 do,]
    r8 do'16[si do8 do,] r8 fa16[mi fa8 fa,]

    %27
    re' mi sol sol\mbreak sol4 r
    R1*11
    r2 la,8[la'16 sold la8 la,]

    %40
    r la'16[sold la8 la,]  r la'16[sold la8 la,]
    r la'16[sold la8 la,]  r la'16[sold la8 la,]
    mi' mi mi mi do4 r

    %43
    R1*6
    r8 mi16[re mi8 do] r8 mi16[re mi8 do]\mbreak
    r8 mi16[re mi8 do] do4 r

    %51
    R1*18
    la8 sib do sib la sib do la %%% rip
    fa2 si8 do re do\mbreak

    %71
    si do re si sol2
    r8 fa'16[mi fa8 fa,] r8 fa'16[mi fa8 fa,]
    r8 fa'16[mi fa8 fa,] r8 fa'16[mi fa8 fa,]

    %74
    r8 fa'16[mi fa8 fa,] do' do do do
    la4\fermata r r2

}

IIIvcn = \relative do{

    r8 fa16 [mi fa8 do] r fa16 [mi fa8 do]
    r fa16[mi fa8 do] fa4 fa,
    r8 do'16[sib do8 fa,] r do'16[sib do8 fa,]

    %4
    r do'16[sib do8 fa,] fa fa' do la
    fa' sol la sol fa sol la fa %%% rip
    sib, do re sib sol' la si la\mbreak

    %7
    sol la si sol do, re mi do
    r fa16 [mi fa8 fa,]  r fa'16 [mi fa8 fa,]
    r fa'16 [mi fa8 fa,] r fa'16 [mi fa8 fa,]

    %10
    r fa'16 [mi fa8 fa,] do' fa do[do,]  %% fine r
    fa'16 do la' fa do' la fa' do re mi fa4 la,8
    sib16 do re4 sol,8\mbreak la16 sol fa mi fa8 r

    %13
    fa16 do la' fa do' la fa' do re mi fa4 la,8
    sib16 do re4 sol,8 la16 fa mi fa la fa mi fa
    do' fa, mi fa do' fa, mi fa \clef tenor fa'[sol la sol fa mi re do]

    %16
    si\clef bass sol fa sol sol, sol' fa sol  si sol fa sol sol, sol' fa sol
    do sol fa sol sol, sol' fa sol\mbreak re' sol, fa sol sol, sol' fa sol
    mi' sol, fa sol sol, sol' fa sol \clef tenor \senza fa'4~\tuplet 3/2 {
        fa16 fa(sol la[sol fa)]

        %19
        \once\stemUp sol,, mi''(fa sol[fa mi)] \once\stemUp sol,, re''(mi fa[mi re)] \once\stemUp sol,, do'(re mi[re do)] \once\stemUp sol, si'(do re[do si)]
    }
    do sol re' si mi do fa re mi sol mi do \once\stemUp sol,8 \once\stemDown si'
    \clef bass do,8[do16 si do8 sol] r do16[si do8 sol]\mbreak %%%%%% basso

    %22
    r do16 [si? do8 sol] do4 do,
    do'8 re mi do fa sol la fa
    re mi fad re sol la si sol

    %25
    r do16[si do8 do,] r do'16 [si do8 do,]
    r do'16 [si do8 do,] r fa16 [mi fa8 fa,]
    sol' do, sol' sol,\mbreak \clef tenor do'16(re mi8)~mi16 re do si

    %28
    do\clef bass sol mi do sol8 r \clef tenor mi''16(fa sol8)~sol16 fa mi re
    mi\clef bass do sol mi do8 r \clef tenor mi'4~\tuplet 3/2 {
        mi16 mi(fa sol[fa sol)]
        dod, dod re mi [re mi] \clef bass sol, sol la sib[la sib]
    } la,4 \clef tenor r16 dod' dod(re)

    %31
    re(mi) mi(fa) fa(sol) sol(mi)\mbreak \appoggiatura mi8 fa4~fa16 la32(sol fa16 mi)
    re fa32 mi re16 do sib re32 do sib16 la sol4~sol16 sol'32 fa mi16 re
    dod mi32 re dod16 si la dod32 si la16 sol \tuplet 3/2 {
        fa re' la fa[mi re] la' re la fa[mi re]

        %34
        la' do la fa[mi re] la' do la fa[mi re] \clef bass sol, sol' re sib?[la sol] re' sol re sib[la sol]
        re' sol re sib[la sol] re' sol re sib[la sol]\mbreak la la' mi dod[si la] mi' la mi dod[si la]
        mi' la mi dod[si la] mi' la mi dod[si la] re re' la fa[mi re] la' re la fa[mi re]

        %37
        la' re la fa[mi re] la' re la fa[mi re] mi mi' si sold[fad mi] si' mi si sold[fad mi]
        si' mi si sold[fad? mi] si' mi si sold[ fad! mi]\clef tenor do' si la re[do si] mi re do fa[mi re]
    }
    do \clef bass la la, la' re, la' mi sold la,8[la'16 sold la8 la,]

    %40
    r la'16[sold la8 la,] r la'16[sold la8 la,]
    r la'16[sold la8 la,] r la'16[sold la8 la,]
    mi'8 la, mi'[mi,] la'16 sol?32 fa mi16 re do sib la8

    %43
    \clef tenor mi''16 re32 do si16 la sold fad mi8\mbreak la'16 sol?32 fa? mi16 re do si la8
    \tuplet 3/2 {
        mi'16 dod la mi'[dod la] mi'16 dod la mi'[dod la] fa' re la fa'[re la] fa' re la fa'[re la]
        re si sol re'[si sol] re' si sol re'[si sol] mi' do? sol mi'[do sol] mi' do sol mi'[do sol]

        %46
        do la fa do'[la fa] do' la fa do'[la fa] re' sib? fa re'[sib fa] re' sib fa re'[sib fa]
        do' sol mi do'[sol mi] do' sol mi do'[sol mi] do' la fa do'[la fa] do' la fa do'[la fa]
        do' sol mi do'[sol mi] do' sol mi do'[sol mi] do' la fa do'[la fa] do' la fa do'[la fa]
    }

    %49
    \clef bass do8[do16 sib do8 fa,] r8 do'16[sib do8 fa,]\mbreak
    r8 do'16[sib do8 fa,] fa'16 do la' fa do' la \clef tenor fa' do
    \tuplet 3/2 { re[(mi fa)]}  fa8\noBeam~\tuplet 3/2 { fa16 re(mi fa[mi re)] mi(fa sol) } sol8\noBeam~\tuplet 3/2 {
        sol16 mi(fa sol[fa mi)]

        %52
        fa(sol la)
    } la8\noBeam~\tuplet 3/2 { la16 fa(sol la[sol fa)]sol(la sib) } sib8\noBeam~\tuplet 3/2 { sib16 sol(la sib[la sol)] }
    la8 fa r fa mi sol, do, mi'
    re fa, sib, re'\mbreak do fa, la, do'

    %55
    sib mi, sol, sib' la\clef bass fa, r \clef tenor do''
    \tuplet 3/2 { la16(sol fa) re'[(do sib)] la sol fa do'[sib la] } fa' do la fa mib' do la fa
    re' sib fa re sib8 re' \tuplet 3/2 { si16 la sol re'[do si] si la sol re'[do si] }

    %58
    sol' re si sol fa' re si sol mi' do sol mi do8 mi'\mbreak
    \tuplet 3/2 { fa16 do la fa'[do la]  fa' do la fa'[do la] fa' do sol fa'[do sol] fa' do sol fa'[do sol]}
    \tuplet 3/2 {
        mi' do sol mi'[do sol]  mi' do sol mi'[do sol] re' do sol re' [do sol]re' do sol re' [do sol]

        %61
        re' sib? sol re'[sib sol] re' sib sol re'[sib sol] mi' sib sol mi'[sib sol] mi' sib sol mi'[sib sol]
        fa' do la fa'[do la] fa' do la fa'[do la] fa' do sol fa'[do sol] fa' do sol fa'[do sol]
        mi' do sol mi'[do sol] mi' do sol mi'[do sol]
    } fa'4 r8 fa

    %64
    \tuplet 3/2 {
        sol16(fa mi) fa[(mi re)] mi(re do) re[(do sib)] do sib la sib[la sol] la sol fa \clef bass sol[fa mi]\mbreak
        fa mi re mi[re do] re do sib do[sib la]
    } \clef tenor fa''4 \appoggiatura sol8 fa16(mi) fa8
    \appoggiatura fa mib16(re) mib8 \appoggiatura fa mib16 re mib8 re16 re32 mib fa16 re sib fa re sib

    %67
    mi? mi32 fa sol16[sol32 la] sib16 sib32 do re16[re32 mi] fa2~
    fa16 (la fa mi) fa(la fa mi) fa(la fa re) mi8.\tr fa16
    fa8 \clef bass sol, la sol fa sol la fa %%% rip

    %70
    sib, do re sib sol' la si la\mbreak
    sol la si sol do, re mi do
    r fa16 [mi fa8 fa,]  r fa'16 [mi fa8 fa,]

    %73
    r fa'16 [mi fa8 fa,] r fa'16 [mi fa8 fa,]
    r fa'16 [mi fa8 fa,] do' fa do[do,]  %% fine r
    fa4\fermata r r2

}

IIIbcn = \relative do {

    r8 fa16 [mi fa8 do] r fa16 [mi fa8 do]
    r fa16[mi fa8 do] fa4 fa,
    r8 do'16[sib do8 fa,] r do'16[sib do8 fa,]

    %4
    r do'16[sib do8 fa,] fa fa' do la
    fa' sol la sol fa sol la fa %%% rip
    sib, do re sib sol' la si la\mbreak

    %7
    sol la si sol do, re mi do
    r fa16 [mi fa8 fa,]  r fa'16 [mi fa8 fa,]
    r fa'16 [mi fa8 fa,] r fa'16 [mi fa8 fa,]

    %10
    r fa'16 [mi fa8 fa,] do' fa do[do,]
    fa4 fa sib la8 fa  %%% fine ripresa
    sol4 sib8 mi,\mbreak fa do' fa fa,

    %13
    fa4 fa sib la8 fa
    sol4 sib8 mi, fa4 fa
    fa fa fa fa

    %16
    sol sol sol sol
    sol sol\mbreak sol sol
    sol sol sol sol

    %19
    sol sol sol sol
    do8 si do re mi do sol sol'
    do,8[do16 si do8 sol] r do16[si do8 sol]\mbreak %%%%%% basso

    %22
    r do16 [si? do8 sol] do4 do,
    do'8 re mi do fa sol la fa
    re mi fad re sol la si sol

    %25
    r do16[si do8 do,] r do'16 [si do8 do,]
    r do'16 [si do8 do,] r fa16 [mi fa8 fa,]
    sol' do, sol' sol,\mbreak do4 do8 sol

    %28 OK
    do4 r do do8 si
    do4 r la la
    la la la8 la' la sol

    %31
    fa dod re mi\mbreak re4 re
    re re sib sib
    la la re re

    %34
    re re sol, sol
    sol sol\mbreak la la
    la la re re

    %37
    re re mi mi
    mi mi\mbreak la8 si do sold
    la la, re mi la,[la'16 sold la8 la,]

    %40
    r la'16[sold la8 la,] r la'16[sold la8 la,]
    r la'16[sold la8 la,] r la'16[sold la8 la,]
    mi'8 la, mi'[mi,] la4 r

    %43
    sold r\mbreak la r
    dod8 dod dod dod re re re re
    si si si si do? do do do

    %46
    la la la la sib? sib sib sib
    mi mi mi mi fa fa fa fa
    mi mi mi mi fa fa fa fa

    %49
    do8[do16 sib do8 fa,] r8 do'16[sib do8 fa,]\mbreak
    r8 do'16[sib do8 fa,] fa4 r
    sib re do mi

    %52
    re fa mi sol
    fa8 sol la fa do4 do
    sib sib\mbreak la la

    %55
    sol sol fa8 sol la fa
    fa4 fa fa fa
    sib sib sol sol

    %58
    sol sol do do\mbreak
    la'8 la la la sol sol sol sol
    sol sol sol sol sol sol sol sol

    %61
    sol sol sol sol sol sol sol sol
    fa fa fa fa do do do do
    do do do do fa sol la fa

    %64
    do1~\mbreak
    do2 fa8 sol la sol
    fa sol la fa \parenthesize sib,2

    %67
    do fa8 sol la sol
    fa4 fa fa do
    fa8 sol la sol fa sol la fa %%% rip

    %70
    sib, do re sib sol' la si la\mbreak
    sol la si sol do, re mi do
    r fa16 [mi fa8 fa,]  r fa'16 [mi fa8 fa,]

    %73
    r fa'16 [mi fa8 fa,] r fa'16 [mi fa8 fa,]
    r fa'16 [mi fa8 fa,] do' fa do[do,]
    fa4\fermata r r2

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}

forma = {

    \key fa\major
    \time 4/4
    \tempo 2 = 47
    s1*75
    \bar"|."


}

IIIvlI = {
    \IIIglobal
    %\notypeset
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

IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma>>

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
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[1.] All[egr]o"

    \score {

                \new ChoirStaff \with {
                    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                }<<

                    \new PianoStaff <<

                        \new Staff <<
                            \set Staff.midiInstrument = #"violin"
                            \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
                            \IvlI
                        >>

                        \new Staff <<
                            \set Staff.midiInstrument = #"violin"
                            \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                            \IvlII
                        >>
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                        \Ivla
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"cello"
                        \set Staff.instrumentName = \markup \center-column{"Violon[cel]lo]"}
                        \Ivc
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol.staff-space = #(magstep +1)
                    }<<
                        \set Staff.midiInstrument = #"contrabass"
                        \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                        \Ibc

                    >>
                >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

        systems-per-page = #7

    }

    \markup\huge "[2.] Largo - Solo a piacimento"

    \score {

                \new ChoirStaff \with {
                    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                } <<

                    \new Staff \with {
                        fontSize = #+2
                        \override StaffSymbol.staff-space = #(magstep +2)
                    } <<
                        \set Staff.midiInstrument = #"cello"
                        \IIvc
                    >>

                    \new Staff \with {
                        fontSize = #+2
                        \override StaffSymbol.staff-space = #(magstep +2)
                    }<<
                        \set Staff.midiInstrument = #"viola"
                        \IIbc

                    >>
                >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup\huge "[3.] [Allegro]"

    \score {

                \new ChoirStaff \with {
                    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                }<<

                    \new PianoStaff <<

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
                        \set Staff.midiInstrument = #"cello"
                        \IIIvc
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol.staff-space = #(magstep +1)
                    }<<
                        \set Staff.midiInstrument = #"contrabass"
                        \IIIbc

                    >>
                >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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



