\language "italiano"
	%********************************** VARIABILI

\version "2.20.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

ten = ^\markup \italic \center-align "ten"

tr = \trill

soli = ^\markup \italic { soli }

solo = ^\markup \italic { solo }

tu = ^\markup \italic "tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = \markup \italic \small \center-column{"Da""Capo"}

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
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16,
2.19.22, 2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46,
2.19.49, 2.19.80, 2.20.0
%}

mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Ivdgn = \relative do'' {

    sol16 fa sol la sol8 do sol do4 si16 la
    sol8 do4 si16 la sol fa mi re do4
    la'16 sol la si la do re32(do si la) sol16 fad sol la sol si do32(si la sol)\mbreak

    %4
    fad16 mi fad sol fad mi' re do si8 la16 sol fad4
    sol r16 sol fa? sol la fa(mi fa) la si32(do) re16 fa,
    sol mi(re mi) sol la32(si) do16 mi, fa re(do re) fa sol32(la) si16 fa

    %7
    mi do(si do) do'(si) do(si)\mbreak do4 sib~
    sib16 la32(sib) do16 sib la sol32(la) sib16 la sol fa32(sol) la16 sol fa mi32(fa) sol16 fa
    mi8 fa16 sol la sol fa mi re32 sol(fa mi re do si la) \clef bass sol sol(fad mi re do si la)

    %10
    sol8 \clef alto fa''\noBeam ~fa16 re si sol\mbreak mi'(do) re(si) sol'(mi) fa(re)
    mi(do) re(si) sol'(mi) fa(re) mi'(do) re(si) do4~
    do16 si do la si4 do r

    %13
    R1
    r4 r16 sol fa sol la fa(mi fa) la si32(do) re16 fa,
    sol \once\slurDashed mi (re mi) sol la32(si) do16 mi,  fa re(do re) fa sol32(la) si16 re,

    %16
    mi(do) re(si) sol'(mi) fa(re) mi(do) re(si) sol'(mi) fa(re)
    mi'(do) re(si)do4~ \mbreak do8 mi, \once\stemUp sol,[si']
    do16 si32(la sol fa mi re) do4 mi16 re  mi fa mi8 fa

    %19
    mi la4 sol16 fa mi8 la4 sol16 fa
    mi(re) do(si) do4\mbreak do16 si do re do mi fa32(mi re do)
    si16 la si do si re mi32(re do si) la16 sol la si la si' la sol

    %22
    fad4 re'16(do) si(la) si8 la16 sol fad8 sol
    la4 r\mbreak r2
    re16(do) si(la) si la sol fad sol8 la16 si la4

    %25
    si16(sol) la(fad) re'(si) do(la) si(sol) la(fad) re'(si) do(la)
    si8 la16 sol fad4\mbreak sol r
    R1

    %28
    r4 si8 re fa,16(sol) la8 fa re'
    mi,16(fa) sol8 do mi, mi4\tr re
    r2\mbreak r4 sol16 fa sol la

    %31
    sol4 r16 fa sol la sol4 r
    r16 fa sol la sol do si do  sol4 r
    r16 do, re mi fa sol la si do8 do, r4\mbreak

    %34
    r2 r4 sol'8 sol
    la16 fa mi fa la \once\slurDashed si32 (do) re16 fa, sol mi re mi sol la32(si) do16 mi,
    fa4~fa16 mi fa sol mi8 do' sib4~\mbreak

    %37
    sib16 la32 (sib) do16 sib la sol32(la) sib16 la sol fa32(sol) la16 sol fa mi32(fa) sol16 fa
    mi re32(mi) fa16 mi re do32(re) mi16 re do re mi fa mi(do) re(si)
    fa'8 mi16 re mi(do) re(si) sol'(mi) fa(re) mi(do) re(si)\mbreak

    %40
    sol'(mi) fa(re) mi(do) re(si) do sol do re mi8 re16 do
    si8 do4 si8 do4 r8 sol'
    la16 do, fa sol la sib~sib32 la sol fa sol16 do, mi fa sol la~la32 sol fa(mi)\mbreak

    %43
    fa16 la, re mi fa sol~sol32 fa mi re \grace re8 mi8. la16 la(sol) sol(fad)
    fad?8. sol16 sol(fad) fad(sol) \grace fad8 mi8. fad16 fad(mi) mi(fad)
    mib4~mib16 do (mib la) do re,(fad la) re re, (fad la)

    %46
    si32 mi re mi la,[re do re] sol, do si do fa,[si la si]\mbreak mi, la sol  la re,[sol fa sol] do, fa mi fa si,[mi re mi]
    la,8. si16 do re mi do fa32(la sol la) fa(la sol la) fa(la sol la) fa(la sol la)
    <<si2\fermata\\\stemUp\shiftOn fa\\\stemUp\shiftOnn re\\\stemUp\shiftOnnn si\\\stemDown \once \override NoteColumn.force-hshift = #2 sol_\fermata>> mib'16(do) re(si) sol'(mib) fa(re)

    %49
    mib(do) re(si) sol'(mib) fa(re) mib(do) re(si) do4~
    do8 la'(sol) do mi,4(re)\mbreak
    do4_\fermata r do16 si do re do8 re

    %52
    do fa4 mi16 re do8 fa4 mi16 re
    do si la sold la4 la'8 do la sol
    fad4. sol8\mbreak la do la sol

    %55
    fad(la) fad[(mi)] mi4\tr red 8fad
    sol2~sol16 mi re mi do mi do la
    fad'2~fad16 re do re si re si sol\mbreak %%% fine pagina 6

    %58
    mi'2~mi16 do si do la do la fad
    red'4 fad4. si,8 mi4~
    mi16 do re si do la si dod red fad mi fad sol8 fad16(mi)

    %61
    mi4 red\tr \mbreak mi4 mi8 mi
    fa re16(dod) re8 si' sold mi16(re) mi8 si'
    do16 re si do la do si la sold8. fad16 mi4

    %64
    R1\mbreak
    r2 r32 mi(fad sold la si do re) mi16 si sold mi
    do'32 la,(si do re mi fa sol) la16 mi do la fa'32 re(mi fa sol la si do) re16 la fa re

    %67
    si'32 sol,(la si do re mi fa) sol16 re si sol\mbreak mi'32 do(re mi fa sol la si) do16 sol mi do
    la'32 fa,(sol la sib do re mi) fa16 do la fa re'4 r16 mi re do
    <<mi2\\\stemUp\shiftOn si\\\stemUp\shiftOnn sold\\\stemDown \once \override NoteColumn.force-hshift = #1.5 mi>> <<la'2\\\stemUp\shiftOn mi\\\stemUp\shiftOnn do\\\stemDown \once \override NoteColumn.force-hshift = #1.5 la>>

    %70
    <<la'2\\\stemUp\shiftOn fa\\\stemDown \once \override NoteColumn.force-hshift = #1 re>>\mbreak <<si'2\\\stemUp\shiftOn sol\\\stemUp\shiftOnn re\\\stemDown \once \override NoteColumn.force-hshift = #1.5 sol,>>
    <<sol'2\\\stemUp\shiftOn mi\\\stemUp\shiftOnn do\\\stemDown \once \override NoteColumn.force-hshift = #1.5 sol>>\mbreak <<la'2\\\stemUp\shiftOn fa\\\stemUp\shiftOnn do\\\stemDown \once \override NoteColumn.force-hshift = #1.5 fa,>>
    <<mi'4\\\stemUp\shiftOn si\\\stemUp\shiftOnn sold\\\stemDown \once \override NoteColumn.force-hshift = #1.5 mi >> r r2

    %73
    R1\mbreak
    sol'16 fa sol la sol8 do sol do4 si16 la
    sol8 do4 si16 la sol fa mi re  do4

    %76
    la'16 sol la si la do re32(do si la) sol16 fad sol la sol si do32(si la sol)\mbreak
    fad16 mi fad sol fad mi' re do si8 la16 sol fad4
    sol r16 sol fa? sol la fa(mi fa) la si32(do) re16 fa,

    %79
    sol mi(re mi) sol la32(si) do16 mi, fa re(do re) fa sol32(la) si16 fa
    mi do(si do) do'(si) do(si)\mbreak do4 sib~
    sib16 la32(sib) do16 sib la sol32(la) sib16 la sol fa32(sol) la16 sol fa mi32(fa) sol16 fa

    %82
    mi8 fa16 sol la sol fa mi re32 sol(fa mi re do si la) \clef bass sol sol(fad mi re do si la)
    sol8 \clef alto fa''\noBeam~fa16 re si sol\mbreak mi'(do) re(si) sol'(mi) fa(re)
    mi(do) re(si) sol'(mi) fa(re) mi'(do) re(si) do4~

    %85
    do16 si do la si4 do r
    R1
    r4 r16 sol fa sol la fa(mi fa) la si32(do) re16 fa,

    %88
    sol \once\slurDashed mi (re mi) sol la32(si) do16 mi, fa re(do re) fa sol32(la) si16 re,
    mi(do) re(si) sol'(mi) fa(re) mi(do) re(si) sol'(mi) fa(re)
    mi'(do) re(si) do4~\mbreak do8 mi, \once\stemUp sol,[si']

    %91
    do16 si32(la sol fa mi re) do4 mi16 re mi fa mi8 fa
    mi la4 sol16 fa mi8 la4 sol16 fa
    mi(re) do(si) do4\mbreak do16 si do re do mi fa32(mi re do)

    %94
    si16 la si do si re mi32(re do si) la16 sol la si la si' la sol
    fad4 re'16(do) si(la) si8 la16 sol fad8 sol
    la4 r\mbreak r2

    %97
    re16(do) si(la) si la sol fad sol8 la16 si la4
    si16(sol ) la(fad) re'(si) do(la) si(sol ) la(fad) re'(si) do(la)
    si8 la16 sol fad4\mbreak sol4 r

    %100
    R1
    r4 si8 re fa,16(sol) la8 fa re'
    mi,16(fa) sol8 do mi, mi4\tr re

    %103
    r2 \mbreak r4 sol16 fa sol la
    sol4 r16 fa sol la sol4 r
    r16 fa sol la sol do si do sol4 r

    %106
    r16 do, re mi fa sol la si do8 do, r4\mbreak
    r2 r4 sol'8 sol
    la16 \slurDashed fa  (mi fa) la si32 (do) re16 fa, sol mi (re mi)\slurSolid  sol la32(si) do16 mi,

    %109
    fa4~fa16 mi fa sol mi8 do' sib4~\mbreak
    sib16 la32(sib) do16 sib la sol32(la) sib16 la sol fa32(sol) la16 sol fa mi32(fa) sol16 fa
    mi re32(mi) fa16 mi re do32(re) mi16 re do re mi fa mi(do) re(si)

    %112
    fa'8 mi16 re mi(do) re(si) sol'(mi) fa(re) mi(do) re(si)\mbreak
    sol'(mi) fa(re) mi(do) re(si) do sol do re mi8 re16 do
    si8 do4 si8 do4 r8 sol'

    %115
    la16 do, fa sol la sib~sib32 la sol fa sol16 do, mi fa sol la~la32 sol fa(mi)\mbreak
    fa16 la, re mi fa sol~sol32 fa mi re \grace re8 mi8. la16 la(sol) sol(fad)
    fad?8. sol16 sol(fad) fad(sol) \grace fad8 mi8. fad16 fad(mi) mi(fad)

    %118
    mib4~mib16 do(mib la) do re,(fad la) re re,(fad la)
    si32 mi re mi la,[re do re] sol, do si do fa,[si la si]\mbreak mi, la sol la re,[sol fa sol] do, fa mi fa si,[mi re mi]
    la,8. si16 do re mi do fa32(la sol la) fa(la sol la) fa(la sol la) fa(la sol la)

    %121
    <<si2\fermopz\\\stemUp\shiftOn fa\\\stemUp\shiftOnn re\\\stemUp\shiftOnnn si\\\stemDown \once \override NoteColumn.force-hshift = #2 sol_\fermata>> mib'16(do) re(si) sol'(mib) fa(re)
    mib(do) re(si) sol'(mib) fa(re) mib(do) re(si) do4~
    do8 la'(sol) do mi,4(re)\mbreak

    %124
    do4 r r2

}


Ivocen = \relative do' {

    \autoBeamOff

    R1*11
    r2  sol'16[fa sol la] sol8 do
    sol do4 si16 [la] sol8 do4 si16 la\mbreak

    %14
    sol16[fa mi re] do4 r2
    R1*3
    r2  sol'16[fa sol la] sol8 do

    %19
    sol do4 si16 [la] sol8 do4 si16 la\mbreak
    sol[fa mi re] do4 la'16[sol la si] la8 re
    sol,16[fad sol la] sol8 do fad,16[mi fad sol] fad8 sol

    %22
    la4 re, r2
    r4 re'16[do] si[(la)]\mbreak si8 la16[(sol)] fad8 sol
    la4 re16[(do)] si[(la)] si8 la16[sol] fad8. sol16

    %25
    sol4 r r2
    r2 r4 sol8 do
    fa,16[(sol)] la8 fa re' mi,16[(fa)] sol8 do mi,

    %28
    mi4 re r2
    R1
    r4 sol8 sol\mbreak sol16[fa sol la] sol4

    %31
    r16 fa[sol la] sol4 r16 fa[sol la] sol[do si do]
    sol4 r r16 do,[re mi] fa[sol la si]
    do8 do, r4 r sol'8 sol\mbreak

    %34
    la16[fa mi fa] la[si32 do re16 fa,] sol[mi re  mi] sol[la32 si do16 mi,]
    fa[re do re] fa[sol32 la si16 re,] mi[do(si do)]
    mi[fa32 sol la16 sol] fa[(mi)] re[(mi)] fa[(sol)] la[(si)] do4 sol\mbreak

    %37
    R1  %% inizio p 5
    r4 sol8 sol do si16[(la)] sol8 sol
    la [sol16 fa] sol[(mi)fa(re)] mi[(do) re(si)] sol'[(mi)fa(re)]

    %40
    mi[(do) re(si)] sol'[(mi)fa(re)] mi4 do'8 si16[(la)]
    sol8 fa16[(mi)] re8. do16 do4 r
    R1*9

    %51
    r2 mi16[re  mi fa] mi8 la
    mi la4 sol16 fa mi8 la4 sol16 [fa]
    mi[re do si] la4 r2

    %54
    la'8[(do)] la sol\mbreak fad[(la)] fad mi
    red[fad] la[(sol)] sol4\tr fad
    r sol8 si do2~

    %57
    do16[la sol la] fad[la fad re] si'2~\mbreak
    si16[sol fa sol] mi[sol mi do] la'2~
    la16[fad mi fad] red[fad red si] sol'[si la si] sol[si sol mi]

    %60
    do'[la si sol] la[fad sol mi] fad[red do red] mi8 si'
    sol4 fad\mbreak mi r
    R1

    %63
    r2 r4 mi8 mi
    fa[re16 dod re8] si' sold[mi16 (re) mi8] si'\mbreak
    do16[re si do] la[do si la] sold8. [fad16] mi4

    %66
    r do'8 la fa8.[(mi16)] fa4
    r8 re si sol'\mbreak mi8.\tr[(re16)] do4
    r4 la'8 la fa16[re fa la] re,[do' si la]

    %69
    sold[mi sold si] mi,[re' do si] do[la sol? la] mi[sol fa mi]
    fa[re fa la] re,[do' si la]\mbreak si[sol fa sol] re[fa mi re]
    mi[do mi sol] do,[sib' la sol] la[fa  mi fa] re[do' si? la]

    %72
    sold[mi fad sold] la[si do re] mi,8[la16 sold la8] fad
    sold4. la8 la2\mbreak
    R1*11

    %85
    r2 sol16[fa sol la] sol8 do
    sol do4 si16[la] sol8 do4 si16 la\mbreak
    sol16[fa mi re] do4 r2

    %88
    R1*3
    r2 sol'16[fa sol la] sol8 do
    sol do4 si16[la] sol8 do4 si16 la

    %93
    sol[fa mi re] do4\mbreak la'16[sol la si] la8 re
    sol,16[fad sol la] sol8 do fad,16[mi fad sol] fad8 sol
    la4 re, r2

    %96
    r4 re'16[do] si[(la)]\mbreak si8 la16[(sol)] fad8 sol
    la4 re16[(do)] si[(la)] si8 la16[sol] fad8. sol16
    sol4 r r2

    %99
    r \mbreak r4 sol8 do
    fa,16[(sol)] la8 fa re' mi,16[(fa)] sol8 do mi,
    mi4 re r2

    %102
    R1
    r4 sol8 sol\mbreak sol16[fa sol la] sol4
    r16 fa[sol la] sol4 r16 fa[sol la] sol[do si do]

    %105
    sol4 r r16 do,[re mi] fa[sol la si]
    do8 do, r4 r sol'8 sol\mbreak
    la16[fa mi fa] la[si32 do re16 fa,] sol[mi re mi] sol[la32 si do16 mi,]

    %108
    fa[re do re] fa[sol32 la si16 re,] mi[do(si do)] mi[fa32 sol la16 sol]
    fa[(mi)] re[(mi)] fa[(sol)] la[(si)] do4 sol\mbreak
    R1

    %111
    r4 sol8 sol do si16[(la)] sol8 sol
    la8[sol16 fa] sol[(mi) fa(re)] mi[(do) re(si)] sol'[(mi) fa(re)]\mbreak
    mi[(do) re(si)] sol'[(mi) fa(re)] mi4 do'8 si16[(la)]

    %114
    sol8 fa16[(mi)] re8. do16 do4 r
    R1*10

}

Itesto = \lyricmode {

    Con _ leg -- gera _ leggera _ _ navi - cel -- la

    con _ leg -- gera _ leggera _ _ navi - cel -- la

    sol - ca l'on - de ben _ so -- vente _  tutto _  giubilo_il _ _ nocchier _

    tutto _  giubilo_il _ _ noc -- chier

    con leg -- gera _ navi - cel -- la navi - cel -- la

    solca _ l'on - - - - - - - -  - de solca _  l'on - - - - - - - -  de ben sovente _ _

    tutto _ giubilo_il _ _ nocchier - - - - - - - tutto _ giubilo_il _ _ nocchier. _

    Col - to poi dalla _ procella _ _ procel - la piange _ in -- vano _ e_in -- van si pente _

    de l'auda - -  - - - - - - - - - - ce suo pen -- sier.

    Col -- to poi dalla _ pro -- cel - - la piange_in - vano, _ e_in -- van si  pente _ de l'auda - - - - - -  - - - - - - - - - - - ce

    suo pensier. _

    Con _ leg -- gera _ leggera _ _ navi - cel -- la

    con _ leg -- gera _ leggera _ _ navi - cel -- la

    sol - ca l'on - de ben _ so -- vente _  tutto _  giubilo_il _ _ nocchier _

    tutto _  giubilo_il _ _ noc -- chier

    con leg -- gera _ navi - cel -- la navi - cel -- la

    solca _ l'on - - - - - - - -  - de solca _  l'on - - - - - - - -  de ben sovente _ _

    tutto _ giubilo_il _ _ noc -- chier - - - - - - tutto _ giubilo_il _ _ nocchier. _



}


Ibcn = \relative do {

    do4\p r do8 mi fa[re]
    mi do fa[re] mi si do4
    do' r si r\mbreak

    %4
    la re, sol8 do re re,
    sol16 la fa sol mi8 do fa4 r
    mi r re r

    %7
    do r8 re\mbreak mi do re mi
    fa r fa, r mi' r re r
    do r fa, r sol4 r

    %10
    sol8 la si[sol]\mbreak do4 r
    do r do8 sol' la[mi]
    fa4 sol do, r

    %13
    do8 la' fa sol mi do fa[fa,]\mbreak
    do'4 r fa r
    mi r re r

    %16
    do r do r
    do8 sol' la[mi]\mbreak fa do sol'[sol,]
    do4 r do r

    %19
    do r do r
    do r\mbreak do' r
    si r la r8 sol

    %22
    re mi fad[re] sol la16 si la8 sol
    re mi fad4\mbreak sol8 sol, re'[mi]
    re4 r8 re sol do, re4

    %25
    sol4 r sol r8 fad
    sol do re re,\mbreak sol fa mi4
    fa re mi do

    %28
    sol' sol, sol' r
    do, r sol'8 sol, sol' fa
    mi re mi do\mbreak si la si sol

    %31
    do4 r do r
    do r do r
    do r do8 re mi do\mbreak

    %34
    fa4 r mi r
    re r do r
    re r8 re do do re mi\mbreak

    %37
    fa r fa, r mi' r re r
    do r si r do4 r
    do r do r\mbreak

    %40
    do r do~do16 re mi fa
    sol8 la16 fa sol8 sol, do4 r8 do
    fa4 r8 re mi4 r8 do\mbreak

    %43
    re4 r8 si do do'16 si do8 do,
    re la si[sol] do do, r do'
    fad, fad fad fad fad fad fad fad

    %46
    sol fa' mi re\mbreak do sib la[sol]
    fa' fa, mi[mi'] re4 r8 re
    sol,2\fermata do8 sol' mib re

    %49
    do sol' mib re do sol' mi[do]
    fa4 mi8 re16 do sol'4 sol,\mbreak
    do_\fermopz do'8 si la4 r

    %52
    la r la r
    la r la, r
    la r\mbreak la r

    %55
    la r8 lad si dod red si
    mi fad sol mi la,4 r
    re r sol r\mbreak

    %58
    do, r fad, r
    si r mi r
    la, r8 mi' si si' sol mi

    %61
    si'4 si,\mbreak mi8 mi do[la]
    re4 r8 re mi4 r8 mi
    la sol fa[re] mi re do[la]

    %64
    re4 r8 re mi4 r8 mi\mbreak
    la8 sol fa re mi4 r8 mi
    la,4 r8 la re4 r8 re

    %67
    sol,4 r8 sol\mbreak do4 r8 do
    fa4 r8 fa re4 r8 re
    mi4 r8 mi la,4 r8 la

    %70
    re4 r8 re\mbreak sol,4 r8 sol
    do4 r8 do fa4 r8 fa
    mi4 r8 re do4 r8 re

    %73
    mi4 mi, la2\mbreak
    do4 r do8 mi fa[re]
    mi do fa[re] mi si do4

    %76
    do' r si r \mbreak
    la re, sol8 do re re,
    sol16 la fa sol mi8 do fa4 r

    %79
    mi r re r
    do r8 re\mbreak mi8 do re mi
    fa r fa, r mi' r re r

    %82
    do r fa, r sol4 r
    sol8 la si[sol] do4 r
    do r do8 sol' la[mi]

    %85
    fa4 sol do, r
    do8 la' fa sol mi do fa[fa,]\mbreak  %%% fine p. 9
    do'4 r fa r

    %88
    mi r re r
    do r do r
    do8 sol' la[mi]\mbreak fa do sol'[sol,]

    %91
    do4 r do r
    do r do r
    do r\mbreak do' r

    %94
    si r la r8 sol
    re mi fad[re] sol la16 si la8[sol]
    re mi fad4\mbreak sol8 sol, re'[mi]

    %97
    re4 r8 re sol do, re4
    sol r sol r8 fad
    sol do re re,\mbreak sol fa mi4

    %100
    fa re mi do
    sol' sol, sol' r
    do, r sol'8 sol, sol' fa

    %103
    mi re mi do\mbreak si la si sol
    do4 r do r
    do r do r

    %106
    do r do8 re mi do\mbreak
    fa4 r mi r
    re r do r

    %109
    re r8 re do do re mi\mbreak
    fa r fa, r mi' r re r
    do r si r do4 r

    %112
    do r do r\mbreak
    do r do~do16 re mi fa
    sol8 la16 fa sol8 sol, do4 r8 do

    %115
    fa4 r8 re mi4 r8 do\mbreak
    re4 r8 si do do'16 si do8 do,
    re la si[sol] do do, r do'

    %118
    fad, fad fad fad fad fad fad fad
    sol fa' mi re\mbreak do sib la[sol]
    fa' fa, mi[mi'] re4 r8 re

    %121
    sol,2\fermata do8 sol' mib re\mbreak
    do sol' mib re do sol' mi[do]
    fa4 mi8 re16 do sol'4 sol,

    %124
    do r r2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 77
    s1*124
    \bar"|."

}


Ivdg = {
    \global
    \clef alto
    \notypeset
    <<\Ivdgn \forma>>

}


Ivoce = {
    \new Voice = "leggera"
    \global
    %\clef alto
    <<\Ivocen \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIfln = \relative do'' {

    re'8(la) r la re(la) r r32 la(si dod)
    re16\staccatissimo la\staccatissimo re\staccatissimo la\staccatissimo re\staccatissimo la\staccatissimo re\staccatissimo la\staccatissimo re8\staccatissimo re,\staccatissimo \grace re dod8. re16
    \grace re8 mi4 r8 mi\staccatissimo la(mi) r r32 mi(fad sold)

    %4
    la8\staccatissimo la,\staccatissimo r mi' fa8.[(sol16) fa8.(sol16)]
    fad!8.[(sol16) fad8.(sol16)] sol2(
    sold8.)[(la16) sold8.(la16)] la4 r32 re,\solo(mi fad sol? la si dod)

    %7
    re8 r16 la re8 r16 la re16. la32 re16. la32 re16. la32 re16. la32\mbreak
    re la re la re la re la re la re la re la re la re8\tu fad, mi4
    re r^\markup\italic\center-align"Adagio" re'8\solo\p(la) r4

    %10
    mi'8(la,) r4 r r8 la,^\markup\italic"Andante"_\tu \mbreak
    sib8.[(do16) sib8.(do16)] si8.[(do16) si8.(do16)]
    do?2(dod8.)[(re16) dod8.(re16)]

    %13
    re4 r32 re(mi fad sol la si dod) re8 fad, mi4
    re r\mbreak r2
    R1 %%%%%fine primo sistema p. 3

    %16
    r2 r4 la'8(mi)
    r16 mi dod16. re32 mi4 r16 la sold16. la32 mi la,(si dod re mi fad sold)
    la8 la, r mi'\mbreak fa8.[(sol16) fa8.(sol16)]

    %19
    fad!8.[(sol16) fad8.(sol16)] sol2(
    sold8.)[(la16) sold8.(la16)] la4 r
    r2 la8\f(mi) r mi

    %22
    la(mi) r mi fad[re dod8. re16]
    mi4 r32 re(mi fad sol la si dod)\mbreak re8(la) r la
    re\staccatissimo re,\staccatissimo r4 sol8\p(re) r4

    %25
    sol8(re) r4 dod'8(sol) r4
    la8(mi) r4 re'8(la) r4\mbreak
    la8\f r16 mi la8 r16 mi la16. mi32 la16. mi32 la16. mi32 la16. mi32

    %28
    la8 la, r la\p sib8.[do16 sib8. do16]
    si!8.[(do16) si8.(do16)] do2(
    dod!8.)[re16 dod8.(re16)] re4 r

    %31
    re'8(la) r r32 la(si dod) re8 re, r4
    re8\p r16 la  re8 r16 la re16. la32 re16. la32 re16. la32 re16. la32\mbreak
    re4 r8 mi, fa8.[(sol16) fa8. (sol16)]

    %34
    fad!8.[(sol16) fad8.(sol16)] sol2(
    sold8.)[(la16) sold8.(la16)] la4 r
    r2\mbreak re'8\f(la) r la

    %37
    re8(la) r r32 la(si dod) re8[re, dod8. re16]
    \grace re8 mi4 r8 mi la(mi) r r32 mi(fad sold)
    la8 la, r mi'\p fa8.[(sol16) fa8.(sol16)]

    %40
    fad!8.[(sol16) fad8.(sol16)] sol2(\mbreak
    sold8.)[(la16) sold8.(la16)] la4 r32 re,\solo(mi fad sol la si dod)
    re8 r16 la re8 r16 la re16. la32 re16. la32 re16. la32 re16. la32\mbreak

    %43
    re la re la re [la re la] re la re la re [la re la] re8\tu fad, mi4
    re r r2
    r si'16. fad32 si16. fad32 si16. fad32 si16. fad32

    %46
    si8 si, r4 r2
    fad'16. dod32 fad16. dod32 fad16. dod32 fad16. dod32 fad4 r\mbreak
    R1*3  %%%%%%% di qui la ripresa

    %51
    re'8(la) r la re(la) r r32 la(si dod)
    re16\staccatissimo la\staccatissimo re\staccatissimo la\staccatissimo re\staccatissimo la\staccatissimo re\staccatissimo la\staccatissimo re8\staccatissimo re,\staccatissimo \grace re dod8. re16
    \grace re8 mi4 r8 mi\staccatissimo la(mi) r r32 mi(fad sold)

    %54
    la8\staccatissimo la,\staccatissimo r mi' fa8.[(sol16) fa8.(sol16)]
    fad!8.[(sol16) fad8.(sol16)] sol2(
    sold8.)[(la16) sold8.(la16)] la4 r32 re,\solo(mi fad sol? la si dod)

    %57
    re8 r16 la re8 r16 la re16. la32 re16. la32 re16. la32 re16. la32\mbreak
    re la re la re la re la re la re la re la re la re8\tu fad, mi4
    re r^\markup\italic\center-align"Adagio" re'8\solo\p(la) r4

    %60
    mi'8(la,) r4 r r8 la,^\markup\italic\center-align"Andante"_\tu \mbreak
    sib8.[(do16) sib8.(do16)] si8.[(do16) si8.(do16)]
    do?2(dod8.)[(re16) dod8.(re16)]

    %63
    re4 r32 re(mi fad sol la si dod) re8 fad, mi4
    re r\mbreak r2
    R1

    %66
    r2 r4 la'8(mi)
    r16 mi dod16. re32 mi4 r16 la sold16. la32 mi la,(si dod re mi fad sold)
    la8 la, r mi'\p\mbreak fa8.[(sol16) fa8.(sol16)]

    %69
    fad!8.[(sol16) fad8.(sol16)] sol2(
    sold8.)[(la16) sold8.(la16)] la4 r
    r2 la8\f(mi) r mi

    %72
    la(mi) r mi fad[re dod8. re16]
    mi4 r32 re(mi fad sol la si dod)\mbreak re8(la) r la
    re\staccatissimo re,\staccatissimo r4 sol8\p(re) r4

    %75
    sol8(re) r4 dod'8(sol) r4
    la8(mi) r4 re'8(la) r4\mbreak
    la8\f r16 mi la8 r16 mi la16. mi32 la16. mi32 la16. mi32 la16. mi32

    %78
    la8 la, r la\p sib8.[do16 sib8. do16]
    si!8.[(do16) si8.(do16)] do2(
    dod!8.)[re16 dod8.(re16)] re4 r

    %81
    re'8(la) r r32 la(si dod) re8 re, r4
    re8\p r16 la  re8 r16 la re16. la32 re16. la32 re16. la32 re16. la32\mbreak
    re4 r8 mi, fa8.[(sol16) fa8. (sol16)]

    %84
    fad!8.[(sol16) fad8.(sol16)] sol2(
    sold8.)[(la16) sold8.(la16)] la4 r
    r2\mbreak re'8\f(la) r la

    %87
    re8(la) r r32 la(si dod) re8[re, dod8. re16]
    \grace re8 mi4 r8 mi la(mi) r r32 mi(fad sold)
    la8 la, r mi' fa8.[(sol16) fa8.(sol16)]

    %90
    fad!8.[(sol16) fad8.(sol16)] sol2(\mbreak
    sold8.)[(la16) sold8.(la16)] la4 r32 re,\solo(mi fad sol la si dod)
    re8 r16 la re8 r16 la re16. la32 re16. la32 re16. la32 re16. la32\mbreak

    %93
    re la re la re [la re la] re la re la re [la re la] re8\tu fad, mi4
    re\fermata r r2

}

IIvlan = \relative do' {

    fad8 sol la sol fad sol la sol
    fad sol la sol fad la sol fad
    dod re mi re dod re mi re

    %4
    dod re mi dod\mbreak re la r la'
    la la la la re, do si la
    si si si si la la la'[sol]

    %7
    fad sol la sol fad sol la sol\mbreak
    fad sol la[sol] fad re4 dod8
    re4 r r2

    %10
    r r4 r8 fad\mbreak
    sol re r sol sol sol sol sol
    sol fa mi re mi mi mi mi

    %13
    la si la sol fad re4 dod8
    re4 r\mbreak r2
    R1*2

    %17
    r2 dod8 re mi re
    dod4 r\mbreak r2
    R1*2

    %21
    r2 dod8\f re mi re
    dod re mi dod re la sol la
    dod dod re mi\mbreak fad sol la sol

    %24
    fad4 r r2
    R1*2
    dod8\f re mi re dod re mi[re]

    %28
    dod4 r r2
    R1*7
    r2 fad8\f sol la sol

    %37
    fad sol la sol fad la sol fad
    mi16 re dod re mi8 re dod re mi re
    dod si la[la'] la4 r8 la

    %40
    la la la la re do si la\mbreak
    si4 r8 si dod si la[sol]
    fad sol la[sol] fad sol la[sol]

    %43
    fad sol la[sol] fad re4 dod8\mbreak
    re4 r r2
    r2 re8 mi fad[mi]\mbreak

    %46
    re4 r r2
    lad'8 si dod[si] lad4 r\mbreak
    R1*3

    %51 ripresa
    fad8 sol la sol fad sol la sol
    fad sol la sol fad la sol fad
    dod re mi re dod re mi re

    %54
    dod re mi dod\mbreak re la r la'
    la la la la re, do si la
    si si si si la la la'[sol]

    %57
    fad sol la sol fad sol la sol\mbreak
    fad sol la[sol] fad re4 dod8
    re4 r r2

    %60
    r r4 r8 fad\mbreak
    sol re r sol sol sol sol sol
    sol fa mi re mi mi mi mi

    %63
    la si la sol fad re4 dod8
    re4 r\mbreak r2
    R1*2

    %67
    r2 dod8 re mi re
    dod4 r\mbreak r2
    R1*2

    %71
    r2 dod8\f re mi re
    dod re mi dod re la sol la
    dod dod re mi\mbreak fad sol la sol

    %74
    fad4 r r2
    R1*2
    dod8\f re mi re dod re mi[re]

    %78
    dod4 r r2
    R1*7
    r2 fad8\f sol la sol

    %87
    fad sol la sol fad la sol fad
    mi16 re dod re mi8 re dod re mi re
    dod si la[la'] la4 r8 la

    %90
    la la la la re do si la\mbreak
    si4 r8 si dod si la[sol]
    fad sol la[sol] fad sol la[sol]

    %93
    fad sol la[sol] fad re4 dod8\mbreak
    re4\fermata r r2

}

IIvocen = \relative do'' {

    \autoBeamOff

    R1*8
    r8 la re mi16[(dod)] re4~re16. [mi32 re16. fad32]
    mi4~mi16. [fad32 mi16. (sol32)] fad8.\tr[(mi16)] re4

    %11
    R1*3
    r8 la re mi16[(dod)]\mbreak re8 la mi' fad16 re
    mi8 la, fad' sol16 mi fad[mi] re8 sol fad16 sol\mbreak

    %16
    mi8 fad16 re dod8 re mi4 r16 mi[dod16. re32]
    mi4 r16 la[sold16. la32] mi4 r
    r8 mi mi mi\mbreak mi re16 dod re8 re

    %19
    do2 si8 si si si
    mi fad16 mi re8 mi\mbreak dod16[si] la8 fad' mi16 re
    mi[(si)] dod la sold8. la16 la4 r

    %22
    R1*2
    r8 la la la sib8.[(do16) sib8.(do16)]
    si!8.[(do16) si8.(re16)] do2(

    %26
    dod!8.)[ re16 dod8. mi16] re8 mi16 fad mi8 re
    dod8.\tr[(si16)] la4 r2
    r8 la re do sib8.[(la16)] sol4

    %29
    r8 re' sol fa mi8.[(re16)] do4\mbreak
    r8 mi la sol fad mi16 re dod8 si
    la[(dod)] re4 r8 sol fad mi

    %32
    re4 r16 fad[mi16. fad32] re4 r16 fad[mi16. fad32]\mbreak
    re4 r r8 re la si
    do[re16 mi] re8[do] si16[la sol la] si8[dod?]

    %35
    re[mi16 fad] mi8[re] dod si16[la] sol'8 fad16 mi
    fad[dod] re si dod8. re16\mbreak re4 r
    R1*7

    %44
    r8 fad lad, lad si re16 dod si8 si
    dod mi16 re dod8 dod re16[dod] si8 r4\mbreak
    r8 fad' re si mi mi16 re dod[(si)] lad[(sold)]

    %47
    fad4 r r8 dod' lad fad\mbreak
    re'8 dod16 si mi[re32(dod) fad16 mi32(re)] sol16[fad32(mi) fad16 mi32(re)] mi16[re32(dod) re16 dod32(si)]
    mi,4~mi16[mi' re dod] re[lad] si sold lad8. si16

    %50
    si[la32(sol?) fad16] fad'16 re8[(dod16)] si\mbreak si2
    R1*8
    r8 la re mi16[(dod)] re4~re16. [mi32 re16. fad32]

    %60
    mi4~mi16. [fad32 mi16. (sol32)] fad8.\tr[(mi16)] re4
    R1*3
    r8 la re mi16[(dod)]\mbreak re8 la mi' fad16 re

    %65
    mi8 la, fad' sol16 mi fad[mi] re8 sol fad16 sol\mbreak
    mi8 fad16 re dod8 re mi4 r16 mi[dod16. re32]
    mi4 r16 la[sold16. la32] mi4 r

    %68
    r8 mi mi mi\mbreak mi re16 dod re8 re
    do2 si8 si si si
    mi fad16 mi re8 mi\mbreak dod16[si] la8 fad' mi16 re

    %71
    mi[(si)] dod la sold8. la16 la4 r
    R1*2
    r8 la la la sib8.[(do16) sib8.(do16)]

    %75
    si!8.[(do16) si8.(re16)] do2(
    dod!8.)[ re16 dod8. mi16] re8 mi16 fad mi8 re
    dod8.\tr[(si16)] la4 r2

    %78
    r8 la re do sib8.[(la16)] sol4
    r8 re' sol fa mi8.[(re16)] do4\mbreak
    r8 mi la sol fad mi16 re dod8 si

    %81
    la[(dod)] re4 r8 sol fad mi
    re4 r16 fad[mi16. fad32] re4 r16 fad[mi16. fad32]\mbreak
    re4 r r8 re la si

    %84
    do[re16 mi] re8[do] si16[la sol la] si8[dod?]
    re[mi16 fad] mi8[re] dod si16[la] sol'8 fad16 mi
    fad[dod] re si dod8. re16\mbreak re4 r

    %87
    R1*8

}

IItesto = \lyricmode {

    Quell' usi - gnuo - - lo quell' usi - gnuolo _ tempra_il _ suo duolo _

    se prigioniero _ _ _ spera _ vi -- cina _ la libertà  - - - - - - tempra_il _ suo duolo _

    quell' usi - gnuolo _ tempra_il _ suo duolo _ se prigio - niero _ spera _ vi -- cina _ la libertà. _ _

    Quell' usi - gnuo - - - lo tempra_il _ suo duolo _  tempra_il _ suo duolo _

    quell' usi - gnuolo _ se prigioniero _ _ _ spera _ vi -- cina _ la liber - tà - - - - se

    prigio - nie - - - - - - ro spera _ vi -- cina _ la liber - tà.

    Con questa _ speme _ ei più non geme _ ei più non geme _

    e_un tal pensiero _ _ più lieto_il _ fa e_un tal pen -- siero _ più lie - - - - to più lieto_il _ fa più lieto_il _ fa.

    Quell' usi - gnuo - - lo quell' usi - gnuolo _ tempra_il _ suo duolo _

    se prigioniero _ _ _ spera _ vi -- cina _ la libertà  - - - - - - tempra_il _ suo duolo _

    quell' usi - gnuolo _ tempra_il _ suo duolo _ se prigio - niero _ spera _ vi -- cina _ la libertà. _ _

    Quell' usi - gnuo - - - lo tempra_il _ suo duolo _  tempra_il _ suo duolo _

    quell' usi - gnuolo _ se prigioniero _ _ _ spera _ vi -- cina _ la liber - tà - - - - se

    prigio - nie - - - - - - ro spera _ vi -- cina _ la liber - tà.

}


IIbcn = \relative do {

    re8 mi fad mi re mi fad mi
    re mi fad mi re fad mi re
    la' si dod si la si dod si

    %4
    la si dod la\mbreak re re, r re'
    do si do la si la sol fa
    mi si mi re dod la' fad mi

    %7
    re mi fad mi re mi fad mi\mbreak
    re mi fad[mi] re re' sol, la
    re,4_\markup\italic "Adagio" r r2

    %10
    r2 r4 r8 re_\markup\italic "Andante"\mbreak
    sol sol, r sol' fa mi fa re
    mi re do sib la mi' la[sol]

    %13
    fad sol fad mi re re' sol, la
    re,4 r8 la'\mbreak fad mi16 re dod8 re
    la la' re[dod] re re, si'[la]\mbreak

    %16
    sol fad mi[re] la' la, r4
    la r la8 si dod si
    la si dod la \mbreak re4 r

    %19
    re8 mi fad re sol sol, sol' fad
    mi fad sold mi\mbreak la  la, re[si]
    sold la mi'[mi,] la si dod si

    %22
    la si dod la re fad mi re
    la' sol fad mi\mbreak re mi fad mi
    re mi fad re sol sol, r sol'

    %25
    fa mi fa re mi re do sib
    la si dod la si fad sol[si]
    la si dod si la si dod si

    %28
    la la' fad[re] sol sol, r sol'
    sol la si sol do do, do'[sib]\mbreak
    la si? dod[la] re re, la'[sol]

    %31
    fad mi re sol fad sol la la,
    re16 re' dod16. re32 re,4 r16 re' dod16. re32 re,4
    r8 re' dod la re re, r4

    %34
    R1
    r2 r8 la' si dod
    re16 la si sol la8 la,\mbreak re mi fad mi

    %37
    re mi fad mi re fad mi re
    la' si dod si la si dod si
    la si dod la re re, r re'

    %40
    do si do la si la sol fa\mbreak
    mi fad sold mi la sol? fad mi
    re mi fad mi re mi fad mi

    %43
    re mi fad mi re re la'[la,]\mbreak
    re4 r8 dod <<{si'8 [la]}\\si,4>> sol'8 fad
    mi dod fad[fad,] si dod re dod\mbreak

    %46
    si4 r8 si' sol fad mi [mid]
    fad sold lad sold fad fad, r fad'\mbreak
    si si, dod[re] mi re dod[si]

    %49
    lad sold fad lad si16 dod re mi fad8 fad,
    re'16 dod re si fad'8 fad,\mbreak si4 si8 dod
    re8 mi fad mi re mi fad mi

    %52
    re mi fad mi re fad mi re
    la' si dod si la si dod si
    la si dod la\mbreak re re, r re'

    %55
    do si do la si la sol fa
    mi si mi re dod la' fad mi
    re mi fad mi re mi fad mi\mbreak

    %58
    re mi fad[mi] re re' sol, la
    re,4_\markup\italic "Adagio" r r2
    r2 r4 r8 re_\markup\italic \center-align"Andante"\mbreak

    %61
    sol sol, r sol' fa mi fa re
    mi re do sib la mi' la[sol]
    fad sol fad mi re re' sol, la

    %64
    re,4 r8 la'\mbreak fad mi16 re dod8 re
    la la' re[dod] re re, si'[la]\mbreak
    sol fad mi[re] la' la, r4

    %67
    la r la8 si dod si
    la si dod la \mbreak re4 r
    re8 mi fad re sol sol, sol' fad

    %70
    mi fad sold mi\mbreak la  la, re[si]
    sold la mi'[mi,] la si dod si
    la si dod la re fad mi re

    %73
    la' sol fad mi\mbreak re mi fad mi
    re mi fad re sol sol, r sol'
    fa mi fa re mi re do sib

    %76
    la si dod la si fad sol[si]
    la si dod si la si dod si
    la la' fad[re] sol sol, r sol'

    %79
    sol la si sol do do, do'[sib]\mbreak
    la si? dod[la] re re, la'[sol]
    fad mi re sol fad sol la la,

    %82
    re16 re' dod16. re32 re,4 r16 re' dod16. re32 re,4
    r8 re' dod la re re, r4
    R1

    %85
    r2 r8 la' si dod
    re16 la si sol la8 la,\mbreak re mi fad mi
    re mi fad mi re fad mi re

    %88
    la' si dod si la si dod si
    la si dod la re re, r re'
    do si do la si la sol fa\mbreak

    %91
    mi fad sold mi la sol? fad mi
    re mi fad mi re mi fad mi
    re mi fad mi re re la'[la,]\mbreak

    %94
    re4\fermata r r2

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    <4>1
    s1*6
    <6->2 <_+>
    s1*5
    s2 <_->
    <_+ 7->1
    s1*6
    <_+>1
    s
    s2 <_->
    <_!> s
    s1*25
    <4>1
    s1*6
    <6->2 <_+>
    s1*5
    s2 <_->
    <_+ 7->1
    s1*6
    <_+>1
    s
    s2 <_->
    <_!> s

}

forma = {

    \time 4/4
    \key re\major
    \tempo 4 = 85
    s1*94
    \bar"|."

}


IIfl = {
    \global
    %\notypeset
    <<\IIfln \forma>>

}

IIvla = {
    \global
    \clef alto
    <<\IIvlan \forma>>

}


IIvoce = {
    \new Voice = "usignuolo"
    \global
    %\clef soprano
    <<\IIvocen \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge\bold\fill-line {"  ""Aria ”Con leggera navicella”""  "}

    \markup \huge\column {"  ""[1.] Allegro"}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola""da Gamba"}
                \Ivdg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \time 4/4}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce
                \new Lyrics \lyricsto "leggera" \Itesto
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Violoncelli""soli"}
                \set Staff.midiInstrument = #"cello"
                \Ibc

            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge\bold\fill-line {"  ""Aria ”Quell'usignuolo tempra il suo duolo”""  "}

    \markup \huge\column {"  ""[2.] Andante"}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"[Flauto""traversiere]"}
                \IIfl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 4/4}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce
                \new Lyrics \lyricsto "usignuolo" \IItesto
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Basso""Continuo"}
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine #'hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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
