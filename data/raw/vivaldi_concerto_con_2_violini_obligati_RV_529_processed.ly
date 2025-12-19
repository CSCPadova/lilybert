\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

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

ds = _\markup \italic \center-align \center-column{"D.C.""al Segno"}

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
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}

IvlIn = \relative do'' {

    fa8
    sib,4. fa'8 fa,4. re'8
    sol, mib' la, fa' re sib sib'\noBeam\p r
    la r sol r fa re sol\noBeam r

    %4
    fa r mib r re sib r fa'\f
    sib, re fa, sib sol4. sol'8
    do, mi sol, do la4. fa'8

    %7
    mi8.[(fa16 sol8)  fa16\staccatissimo mi\staccatissimo]\mbreak fa8 fa4.
    mi8.[(fa16 sol8)  fa16 mi] fa8 fa4 la8
    \once\stemDown sib sol, mib? do\once\stemDown la'' fa, re sib

    %10
    \once\stemDown sol'' mib, do la fa''4 fa
    fa fa \appoggiatura {sol16[la]} sib8 la16 sol fa4
    \appoggiatura {sol16[la]} sib8 la16 sol fa8 mib re do16 sib do4\tr

    %13
    sib r8 re\p la (sib) do (re)
    la8 sib4 reb8 la(sib) do (reb)\mbreak
    la sib4 fa'8 \appoggiatura {sol16[la]} sib8 [la16 sol fa8 mib]

    %16
    re do16 sib do4\tr sib r8 sib'\solo
    sib8.\tr(la32 sib) do8.\tr(sib32 do) re8 sib r re
    re8.\tr(do32 re) mib8.\tr(re32 mib) fa8 re r fa16(re)

    %19
    \appoggiatura re8 mib re r fa16(re) \appoggiatura re8 mib re r re
    \tuplet 3/2 { re16(mib fa) sib,[( do re)] fa,(sol la) re,[(mib fa)] } sib, fa re do sib4\mbreak
    r2 r4 r8 sib''16 fa

    %22
    \appoggiatura fa8 sol fa r sib16 fa \appoggiatura fa8 sol fa r fa
    re'4~\tuplet 3/2 { re16 do-. sib-. la-.[sol-. fa-.] } mib8 do'4.
    do4~\tuplet 3/2 { do16 sib-. la-. sol-.[fa-. mib-.] } re8 re'4.

    %25
    sib4~\tuplet 3/2 { sib16 la sol fa[mib re] } do8 do'4.
    la4~\tuplet 3/2 { la16 sol fa mib[re do]  } <<{sib16 fa'-.(fa-. fa-. sol4\tr)
                                                    fa}\\{s16 sib, sib sib sib4
                                                          sib}>> r \tuplet 3/2 { r16 sib'-. do-. re-.[do-. sib-.]} la8 r

    %28
    \tuplet 3/2 { r16 la sib do[sib la] } sol8 r \tuplet 3/2 { r16 sol la sib[la sol] } fa8 r
    \tuplet 3/2 { r16 mi fa sol[fa mi] fa sol la la[sol fa] sol la sib sib[la sol] la sib do do[sib la]
    sib do re re[do sib] do re mi mi[re do] fa do sib la[sol fa]} sol4\tr\mbreak

    %31
    fa4 r r2
    R1
    r4 r8 do' do,4. la'8

    %34
    re, sib' mi, do' la fa fa\noBeam\p r
    mi r re r do la re\noBeam r
    do r sib r la fa r do'\f \mbreak

    %37
    si8.[(do16 re8) do16 si] do8 do4.
    si8.[(do16 re8) do16 si] do8 do4 mi8
    fa[mi16 re do8 sib?] la sol16 fa sol4\tr

    %40
    fa r r r8 fa
    sol'4~sol16 fa32(mi) re(do) sib(la) do,8 do'(mi sol)\mbreak
    la4~la16 sol32(fa) mi(re) do(sib) fa8 do'(fa la)

    %43
    \tuplet 3/2 { la16(sol) fad do[(re) mib!] } la,8 r \tuplet 3/2 { mib'16(re) do la[(sib) do] } re,8 r
    sib''8.\tr(la32 sib) sib8.\tr(la32 sib) sib8.\tr(la32 sib) r4
    sib8.(do16 re) do32(sib) la(sol) fa(mib) \appoggiatura fa8 mib16(re mib8)  \appoggiatura fa8 mib16(re mib8)

    %46
    do'16[(re mib re do sib la sol)] \appoggiatura fa8 mib2\mbreak
    dod'2 dod4.\tr(si16 dod)
    \appoggiatura dod?8 re4~re16 dod32(si?) la(sol) fad(mi) re8 la\staccatissimo fad\staccatissimo re\staccatissimo

    %49
    \tuplet 3/2 { fad'16 la sol fad[mi re] } re,8 r \tuplet 3/2 { fad'16 la sol fad[mi re] } re,8 r
    \tuplet 3/2 { sib''16 re do sib[la sol] } sol,,8 r \tuplet 3/2 { sib''16 re do sib[la sol] } sol,,8 r
    re''16[(mib fa sol la sib do re)] re(re,) re4.\tr \mbreak

    %52
    re16[(mib fa sol la sib do re)] la32(sol fa8.) fa32(mi re8.)
    si'8(re si sol) fa4~fa16 si(do re)
    mib,!4~mib16(sol) sol(do) do(mib) mib(do) do(sol) sol(mib)

    %55
    re,8 r \tuplet 3/2 { r16 fad' sol la[sol fad] } re,8 r \tuplet 3/2 { r16 sol' la sib[la sol]}
    re,8 r \tuplet 3/2 { r16 la'' sib do[sib la] } re,,8 r \tuplet 3/2 { r16 sib'' do re[do sib] }\mbreak %% fine p 6
    re,,4 r16 la''(sib la sib la sib la sib la sib la)

    %58
    sib8 la16 sol la8 sol16 fad sol8 sol, mib! do
    la'' fa, re sib sol'' mib, do la
    fad'' re, sib sol re''4 re

    %61
    re re \appoggiatura {mi16[fad]}sol8 fad16 mi re4
    \appoggiatura {mi16[fad]} sol8[fad16 mi re8 do] sib la16 sol la4\tr\mbreak
    sol16 sib re sol sib sol re sib re4 r

    %64
    fa,16 la do fa la fa do la re4 r
    mib,16 sol do mib sol mib do sol do4 r
    re,16 fad la do fad la fad do re,4 r\mbreak

    %67
    re''8(la fad do la fad' la do)
    si1
    do8(sol mi sib ?sol mi' sol sib)

    %70
    la1
    sib8(fa re lab fa re' fa lab)
    sol(mib sib sol') la? (fa do la')

    %73
    \tuplet 3/2 { sib16 la sol fa[mib re] sol fa mib re[do sib] } fa4 r\mbreak
    sib'8 sol, mib do la'' fa, re sib
    sol'' mib, do la fa''4 r8 sib\solo

    %76
    sib8.\tr(la32 sib) do8.\tr(sib32 do) re8 sib r re
    re8.\tr(do32 re) mib8.\tr(re32 mib) fa8 re r \set Staff.ottavation = #"8va alta" fa,
    fa8.\tr(mib32 fa) fa8.\tr(mib32 fa) \tuplet 3/2 { mib16-. re-. mib-. fa-.[mib-. re-.] } mib8 mib

    %79
    mib8.\tr(re32 mib) mib8.\tr (re32 mib) \tuplet 3/2 { re16 do re mib[re do] } re8 re\mbreak
    re8.\tr(do32 re) re8.\tr(do32 re) do4 \unset Staff.ottavation r16 fa la fa
    sib sib, re sib fa' fa, la fa sib sib, re sib fa'8 r

    %82
    r2 r4 r8 sib'
    sib\tr(la) r4 la8\tr(sol) r4
    sol8\tr fa r4 mib8\tr (re) mib\tr (re)

    %85
    r16\set Staff.ottavation = #"8va alta" fa, la fa sib sol sib sol do la do la re sib re sib\mbreak
    mib do mib do fa re fa re sol mib sol mib la fa la fa
    \tuplet 3/2 { sib(la) sib sib[(la) sib] sib(la) sib sib[(la) sib] } la-.[(la-. la-. la-. la-. la-. la-. la-.)]

    %88
    \tuplet 3/2 { la(sol) la la[(sol) la] la(sol) la la[(sol) la]} sol-.[(sol-. sol-. sol-. sol-. sol-. sol-. sol-.)]
    \tuplet 3/2 { sol(fa) sol sol[(fa) sol]  sol(fa) sol sol[(fa) sol]} fa-.[(fa-. fa-. fa-. fa-. fa-. fa-. fa-.)]
    \tuplet 3/2 { fa mib fa fa[mib fa]  fa mib fa fa[mib fa] mib re mib mib[re mib] mib re mib mib[re mib]

    %91
    re do re re [do re] re do re re[do re] } do4 \unset Staff.ottavation \tuplet 3/2 { r16 fa sol la[sol fa]
    sib sib, do re[do sib] fa' fa, sol la[sol fa] sib sib, do re[do sib]} fa'8 r
    r2 r4 r8 sib'

    %94
    reb4. do8 reb8. do32 sib do4\tr\mbreak
    \once\stemDown sib8 sol, mib do\once\stemDown la'' fa, re sib
    \once\stemDown sol'' mib, do la fa''4 fa

    %97
    fa fa \appoggiatura {sol16[la]} sib8 la16 sol fa4
    \appoggiatura {sol16[la]} sib8 la16 sol fa8 mib re do16 sib do4\tr
    sib r8 re\p la (sib) do (re)

    %100
    la8 sib4 reb8 la(sib) do (reb)\mbreak
    la sib4 fa'8 \appoggiatura {sol16[la]} sib8 [la16 sol fa8 mib]
    re do16 sib do4\tr sib\fermata r

}

IvlIIn = \relative do'' {

    fa8
    sib,4. fa'8 fa,4. re'8
    sol, mib' la, fa' re sib sib'\noBeam\p r
    la r sol r fa re sol\noBeam r

    %4
    fa r mib r re sib r fa'\f
    sib, re fa, sib sol4. sol'8
    do, mi sol, do la4. fa'8

    %7
    mi8.[(fa16 sol8)  fa16\staccatissimo mi\staccatissimo]\mbreak fa8 fa4.
    mi8.[(fa16 sol8)  fa16 mi] fa8 fa4 la8
    \once\stemDown sib sol, mib? do\once\stemDown la'' fa, re sib

    %10
    \once\stemDown sol'' mib, do la fa''4 fa
    fa fa \appoggiatura {sol16[la]} sib8 la16 sol fa4
    \appoggiatura {sol16[la]} sib8 la16 sol fa8 mib re do16 sib do4\tr

    %13
    sib r8 re\p la (sib) do (re)
    la8 sib4 reb8 la(sib) do (reb)\mbreak
    la sib4 fa'8 \appoggiatura {sol16[la]} sib8 [la16 sol fa8 mib]

    %16
    re do16 sib do4\tr sib r
    r2 r4 r8 sib'
    sib8.\tr(la32 sib) do8.\tr(sib32 do)  re8 sib r re16(sib)

    %19
    \appoggiatura sib8 do sib  r re16(sib) \appoggiatura sib8 do sib  r4
    r2 r4 r8 re\mbreak
    \tuplet 3/2 { re16(mib fa) sib,[( do re)] fa,(sol la) re,[(mib fa)] } sib, fa re do \once\stemUp sib8 fa''16 re

    %22
    \appoggiatura re8 mib re r fa16 re \appoggiatura re8 mib re r4
    r r8 sib sol'4~\tuplet 3/2 { sol16 fa-. mib-. re-.[do-. sib-.] }
    la8 la'4. fa4~\tuplet 3/2 { fa16 mib re do[sib la] }

    %25
    sol8 sol'4. mib4~\tuplet 3/2 { mib16 re do sib[la sol] }\mbreak
    fa8 fa'4. re4 r
    <<{r16 fa fa fa sol4 fa}\\{s16 sib, sib sib sib4 sib}>> \tuplet 3/2 { r16 mib-. fa-. sol-.[mib-. re-.] }

    %28
    re8 r \tuplet 3/2 { r16 re mib fa[mib re] } do8 r \tuplet 3/2 { r16 do re mib[re do] }
    sib4 r r2
    R1\mbreak

    %31
    r4 \tuplet 3/2 { fa'16 sol la la[sol fa] sol la sib sib[la sol] la sib do do[sib la]
    sib do re re[do sib] do re mi mi[re do] fa do sib la[sol fa]} sol4\tr
    fa r8 do' do,4. la'8

    %34
    re, sib' mi, do' la fa fa\noBeam\p r
    mi r re r do la re\noBeam r
    do r sib r la fa r do'\f \mbreak

    %37
    si8.[(do16 re8) do16 si] do8 do4.
    si8.[(do16 re8) do16 si] do8 do4 mi8
    fa[mi16 re do8 sib?] la sol16 fa sol4\tr

    %40
    \tuplet 3/2 { fa16(do' fa) la-. [fa-. do-.]  fa,16(do' fa) la-. [fa-. do-.] fa,16(do' fa) la-. [fa-. do-.] fa,16(do' fa) la-. [fa-. do-.]
    mi,(do' sol') sib[sol do,] mi,(do' sol') sib[sol do,] mi,(do' sol') sib[sol do,] mi,(do' sol' )sib[sol do,]
    fa,(do' la') do[la do,] fa,(do' la') do[la do,] fa,(do' la') do[la do,] fa,(do' la') do[la do,]

    %43
    fad,(re' la') do[la re,] fad,(re' la') do[la re,] fad,(re' la') do[la re,] fad,(re' la') do[la re,]
    sol,(re' sib') re[sib re,] sol,(re' sib') re[sib re,] sol,(re' sib') re[sib re,] sol,(re' sib') re[sib re,]
    sol,(mib'! sib') re[sib mib,] sol,(mib'! sib') re[sib mib,] sol,(mib'! sib') re[sib mib,] sol,(mib'! sib') re[sib mib,]

    %46
    sol,(mib' do') re[do mib,] sol,(mib' do') re[do mib,] sol,(mib' do') re[do mib,] sol,(mib' do') re[do mib,]
    sol,(mi' dod') re[dod mi,] sol,(mi' dod') re[dod mi,] sol,(mi' dod') re[dod mi,] sol,(mi' dod') re[dod mi,]
    la,(fad' re') mi? [re fad,] la,(fad' re') mi? [re fad,] la,(fad' re') mi? [re fad,] la,(fad' re') mi? [re fad,]

    %49
    la,(fad' do') mib![do fad,] la,(fad' do') mib![do fad,] la,(fad' do') mib![do fad,] la,(fad' do') mib![do fad,]
    re,(sol' sib) re[sib sol] re,(sol' sib) re[sib sol] re,(sol' sib) re[sib sol] re,(sol' sib) re[sib sol]
    re,(sol' la) re[la sol] re,(sol' la) re[la sol]re,(sol' la) re[la sol]re,(sol' la) re[la sol]

    %52
    re,(fa' la) re[la fa] re,(fa' la) re[la fa] re,(fa' la) re[la fa] re,(fa' la) re[la fa]
    re,(fa' si) re[si fa] re,(fa' si) re[si fa] re,(fa' si) re[si fa] re,(fa' si) re[si fa]
    sol,(mib' do') re[do mib,] sol,(mib' do') re[do mib,] sol,(mib' do') re[do mib,] sol,(mib' do') re[do mib,]

    %55
    re,(do' fad) la[fad do] re,(do' fad) la[fad do] re,(sib' sol') sib[sol sib,] re,(sib' sol') sib[sol sib,]
    re,(do' fad) la[fad do]re,(do' fad) la[fad do] re,(sib' sol') sib[sol sib,] re,(sib' sol') sib[sol sib,]}\mbreak
    <<fad'4\\\stemUp\once \override Stem #'transparent = ##t la,\\\stemDown re,>> r16 fad' (sol fad sol fad sol fad sol fad sol fad)

    %58
    sol8 sib, do la sol sol mib! do
    la'' fa, re sib sol'' mib, do la
    fad'' re, sib sol re''4 re

    %61
    re re \appoggiatura {mi16[fad]}sol8 fad16 mi re4
    \appoggiatura {mi16[fad]} sol8[fad16 mi re8 do] sib la16 sol la4\tr\mbreak
    sol4 r sol16 sib re sol sib sol re sib

    %64
    re4 r fa,16 la do fa la fa do la
    re4 r mib,16 sol do  mib sol mib do sol
    do4 r re,16 fad la do fad la fad do\mbreak

    %67
    R1
    sol'8(re si fa re si' re fa)
    mi1

    %70
    fa8(do la  mib! do la' do mib)
    re1
    mib8(sib sol mib') mib(do la mib')

    %73
    re4 r \tuplet 3/2 { sib'16 la sol fa[mib re] sol fa mib re[do sib] }\mbreak
    sib'8 sol, mib do la'' fa, re sib
    sol'' mib, do la fa''4 r

    %76
    r2 r4 r8 sib\solo
    sib8.\tr(la32 sib) do8.\tr(sib32 do) re8 sib r \set Staff.ottavation = #"8va alta" re,
    re8.\tr(do32 re) re8.\tr(do32 re) \tuplet 3/2 { do16 sib do re[do sib] } do8 do

    %79
    do8.\tr(sib32 do) do8.\tr(sib32 do) \tuplet 3/2 { sib16 la sib do[sib la] } sib8 sib\mbreak
    sib8.\tr(la32 sib) do8.\tr(sib32 do) la4 \unset Staff.ottavation r
    r2 r4 r16 fa' la fa

    %82
    sib sib, re sib fa' fa, la fa sib sib, re sib fa'8 r
    r4 mib'8\tr(re) r4 re8\tr(do)
    r4 do8\tr(sib) do\tr sib do\tr sib

    %85
    r2 \set Staff.ottavation = #"8va alta"  r16 fa la fa sib sol sib sol\mbreak
    do la do la re sib re sib mib do mib do fa re fa re
    \tuplet 3/2 { sol(fa) sol sol[(fa) sol] sol(fa) sol sol[(fa) sol]} sol-.[(sol-. sol-. sol-. sol-. sol-. sol-. sol-.)]

    %88
    \tuplet 3/2 { fa(mib) fa fa[(mib) fa] fa(mib) fa fa[(mib) fa]} fa-.[(fa-. fa-. fa-. fa-. fa-. fa-. fa-.)]
    \tuplet 3/2 { mib(re) mib mib[(re) mib] mib(re) mib mib[(re) mib]} mib-.[(mib-. mib-. mib-. mib-. mib-. mib-. mib-.)]
    \tuplet 3/2 { re do re re[do re]  re do re re[do re] do sib do do[sib do]do sib do do[sib do]

    %91
    sib la sib sib[la sib] sib la sib sib[la sib]}  la4\unset Staff.ottavation r
    r2 r4 \tuplet 3/2 { r16 fa' sol la[sol fa]
    sib sib, do re[do sib] fa' fa, sol la[sol fa] sib sib, do re[do sib]} fa'8 fa'

    %94
    sib4. la8 sib8. la32 sol la4\tr \mbreak
    \once\stemDown sib8 sol, mib do\once\stemDown la'' fa, re sib
    \once\stemDown sol'' mib, do la fa''4 fa

    %97
    fa fa \appoggiatura {sol16[la]} sib8 la16 sol fa4
    \appoggiatura {sol16[la]} sib8 la16 sol fa8 mib re do16 sib do4\tr
    sib r8 re\p la (sib) do (re)

    %100
    la8 sib4 reb8 la(sib) do (reb)\mbreak
    la sib4 fa'8 \appoggiatura {sol16[la]} sib8 [la16 sol fa8 mib]
    re do16 sib do4\tr sib\fermata r

}

IvlIIIn =  \relative do'' {

    r8
    r fa sib,4~sib8 fa' fa, sib
    sib4 la sib16 do re8 sol\p r
    fa r mib r re sib mib\noBeam r

    %4
    re r do r sib fa r4
    re'2\f mib16(re do sib) mib8 r
    mi2 fa16(mi re do) fa8 r

    %7
    sol8.[(la16 sib8) la16\staccatissimo sol\staccatissimo]\mbreak la8 do,4.
    sol8.[(la16 sib8) la16 sol] do8 do4 fa8
    re sib'4. do,8 la'4. %%5 ripresa

    %10
    sib,8 sol'4. re8 re do do
    re re do do re re do do
    re re do do sib sib la la

    %13
    sib4 r8 fa'\p fa4 fa
    fa fa fa fa\mbreak
    fa fa re do

    %16
    sib la sib r %% fine ripresa
    r2 <<{\override Rest #'staff-position = #-2 r16^\markup\italic"Pmi" fa fa fa fa4
          r2 r16 fa fa fa fa4

          %19
          r16 fa fa fa fa4 r16 fa fa fa fa4
          r2 r16 fa fa fa fa4
          r2 r16 fa fa fa fa4

          %22
          r16 fa fa fa fa4 r16 fa fa fa fa4}\\{s16_\markup\italic"2di" re16 re re re4
                                               s2 s16 re re re re4
                                               s16 re re re re4 s16 re re re re4
                                               s2 s16 re re re re4
                                               s2 s16 re re re re4
                                               s16 re re re re4 s16 re re re re4}>>
    R1*10
    r8 do'' fa,4~fa8 do' do, fa

    %34
    fa4 mi fa16 sol la8 re,\p r
    do r sib r la fa sib\noBeam r
    la r sol r fa16 sol la8 r fa'\f \mbreak

    %37
    re8.[(mi16 fa8) mi16 re] mi8 sol,4.
    re'8.[(mi16 fa8) mi16 re] mi8 mi4 sol8
    la, la sol sol fa4 mi

    %40
    <<{\override Rest #'staff-position = #-2  fa8^\markup\italic"Pmi" do' do do r do do do
       r do do do r do do do\mbreak
       r do do do r do do do

       %43
       r do do do r do do do
       r sib sib sib r sib sib sib
       r mib! mib mib r mib mib mib

       %46
       r mib mib mib r mib mib mib\mbreak
       r dod dod dod r dod dod dod
       r re la la r la la la

       %49
       r la la la r la la la
       r sib sib sib r sib sib sib
       r la la la r la la la\mbreak

       %52
       r la la la r la la la
       r si si si r si si si
       r do do do r do do do

       %55
       r do do do r sib sib sib
       r do do do r sib sib sib\mbreak
       r la la la}\\{fa_\markup\italic"2di" la la la s la la la
                     s sol sol sol s sol sol sol\mbreak
                     s la la la s la la la
                     s la la la s la la la
                     s re, re re s re re re
                     s sib' sib sib s sib sib sib
                     s do do do s do do do\mbreak
                     s sol sol sol s sol sol sol
                     s la fad fad s fad fad fad
                     s fad? fad fad s fad fad fad
                     s sol sol sol s sol sol sol
                     s sol sol sol s sol sol sol\mbreak
                     s fa fa fa s fa fa fa
                     s fa fa fa s fa fa fa
                     s mib! mib mib s mib mib mib
                     s fad fad fad s sol sol sol
                     s fad fad fad s sol sol sol\mbreak
                     s fad fad fad}>> r2

    %58
    r2 re'8 sib'4.
    do,8 la'4. sib,8 sol'4.
    la,8 fad' sol sib, sib sib la la

    %61
    sib sib la la sib sib la la
    sib sib la la sol sol fad fad\mbreak
    sol4 r r2

    %64
    R1*10
    re'8 sib'4. do,8 la'4.
    sib,8 sol'4. <<{\override Rest #'staff-position = #-2 re16 fa,^\markup\italic"Pmi" fa fa fa4

       %76
       r2 r16 fa fa fa fa4
       r2 r16 fa fa fa fa8 sib,}\\{s16 re_\markup\italic"2di" re re re4
                                   s2 s16 re re re re4
                                   s2 s16  re re re re4}>>
    sib8 do re sib do4 r8 fa

    %79
    fa sol la fa sib4 r8 sib,\mbreak
    sib do re sib  <<{fa'16 la^\markup\italic"Pmi" la la la4}\\{s16 fa_\markup\italic"2di" fa fa fa4}>>
    R1*2

    %83
    fa8 fa sib sib mib, mib la la
    re, re sol sol fa sib, fa' sib,
    R1*2

    %87
    mib'8 mib mib mib do do do do
    re re re re sib sib sib sib
    do do do do la la la la

    %90
    sib sib sib sib\mbreak do do fa, fa
    sib sib mi, mi fa fa mib mib
    re re do do sib sib la la

    %93
    sol sol re' re sib sib sib r
    mi mi mi fa sib, sib fa' fa\mbreak
    sib,8 sib''4. do,8 la'4. %%5 ripresa

    %96
    sib,8 sol'4. re8 re do do
    re re do do re re do do
    re re do do sib sib la la

    %99
    sib4 r8 fa'\p fa4 fa
    fa fa fa fa\mbreak
    fa fa re do

    %102
    sib la sib\fermata r

}

Ivlan = \relative do' {

    r8
    r re16[mib fa8 re] r re16[mib fa8 re]
    sib8 sol do la fa fa sib'\noBeam\p r
    sib r sib r sib fa sib\noBeam r

    %4
    sib r sol la fa[re16\f mib fa8 mib]
    fa4 re sib sol
    sol' mi do la

    %7
    do8 do do do do do do do
    sib sib sib sib la la la la
    sol sol'4. fa2 %% ripresa

    %10
    mib sib'8 sib la  la
    sib sib la la sib sib la la
    sib sib la la fa fa fa fa

    %13
    fa4 r8 sib,\p fa' sib, fa' sib,
    fa' sib, fa' sib, fa' sib, fa' sib,\mbreak
    fa' sib, re sib fa'4 fa

    %16
    fa4. fa8 re4 r %%%%% fine ripresa
    r2 r16 sib sib sib sib4
    r2 r16 sib sib sib sib4

    %19
    r16 sib sib sib sib4 r16 sib sib sib sib4
    r2 r16 sib sib sib sib4\mbreak
    r2 r16 sib sib sib sib4

    %22
    r16 sib sib sib sib4 r16 sib sib sib sib4
    R1*10
    r8 la'16[sib do8 la] r8 la16 [sib do8 la]

    %34
    fa re sol mi do do fa\noBeam \p r
    fa r fa r fa do fa\noBeam r
    fa r re mi do la la' la\mbreak

    %37
    sol sol sol sol sol sol sol sol
    fa fa fa fa sol sol sol do,
    do do do do do4. do8

    %40
    la fa' fa fa r fa fa fa
    r mi mi mi r mi mi mi\mbreak
    r fa fa fa r fa fa fa

    %43
    r fad fad fad r fad fad fad
    r sol, sol sol r sol sol sol
    r sol' sol sol r sol sol sol

    %46
    r sol sol sol r sol sol sol\mbreak
    r mi mi mi r mi mi mi
    r re re re r re re re

    %49
    r re re re r re re re
    r re re re r re re re
    r re re re r re re re\mbreak

    %52
    r re re re r re re re
    r sol, sol sol r sol sol sol
    r sol sol sol r sol sol sol

    %55
    r re' re re r re re re
    r re re re r re re re\mbreak
    r re re re r2

    %58
    r sol,8 sol'4.
    fa2 mib
    re sol8 sol fad fad

    %61
    sol sol fad fad sol sol fad fad
    sol sol fad fad re re re re\mbreak
    sib4 r r2

    %64
    R1*10
    sol'2 fa
    mib re16 sib sib sib sib4

    %76
    r2 r16 sib sib sib sib4
    r2 r16 sib sib sib sib8 sib
    sib8 do re sib do4 r8 fa

    %79
    fa sol la fa sib4 r8 sib,\mbreak
    sib do re sib  fa'16 fa fa fa fa4
    R1*2

    %83
    fa8 fa sib sib mib, mib la la
    re, re sol sol fa sib, fa' sib,
    R1*2

    %87
    mib'8 mib mib mib do do do do
    re re re re sib sib sib sib
    do do do do la la la la

    %90
    sib sib sib sib\mbreak do do fa, fa
    sib sib mi, mi fa fa mib mib
    re re do do sib sib la la

    %93
    sol sol re' re sib sib sib r
    mi mi mi fa sib, sib fa' fa\mbreak
    sib,8 sol'4. fa2 %% ripresa

    %96
    mib sib'8 sib la  la
    sib sib la la sib sib la la
    sib sib la la fa fa fa fa

    %99
    fa4 r8 sib,\p fa' sib, fa' sib,
    fa' sib, fa' sib, fa' sib, fa' sib,\mbreak
    fa' sib, re sib fa'4 fa

    %102
    fa4. fa8 re4\fermata r

}

Ibcn = \relative do {

    r8
    r sib16 [do re8 sib] r sib16 [do re8 sib]
    mib8 r fa r sib,[sib'16 la sib8 sib,]
    sib[sib'16 la sib8 sib,] sib[sib'16 la sib8 sib,]

    %4
    sib sib' do fa, sib[sib,16\f do re8 do]
    sib do re sib mib4 mib,
    do'8 re mi do fa4 fa,8 la'

    %7
    sib sib sib sib\mbreak la la la la
    sol sol sol sol fa fa fa fa
    sol4 do, fa sib, %%%%ripresa

    %10
    mib la, sib r
    sib r sib r
    sib r sib8 sib fa' fa

    %13
    sib,4 r r2
    R1
    r2 sib'4 la

    %16
    sib8 sib, fa'[fa,] sib4 r %fine ripresa
    R1*6
    r16 sib' sib sib sib4 r16 do do do do4

    %24
    r16 fa, fa fa fa4 r16 sib sib sib sib4
    r16 mib, mib mib mib4 r16 la la la la4\mbreak
    r16 la la la fa4 sib, r16 sib sib sib

    %27
    sib4 r16 sib sib sib sib8 r fa' r
    sib r mib, r la r re, r
    sol do, la' fa mi do fa la

    %30
    sol sol, do sib la fa' do' do,\mbreak
    fa sol la fa mi do fa la
    sol sol, do sib la fa' do' do,

    %33
    fa, [fa'16 sol la8 fa] r fa16[sol la8 fa]
    sib r do r fa,[fa16 mi fa8\p fa,]
    fa[fa'16 mi fa8 fa,] fa[fa'16 mi fa8 fa,]

    %36
    fa fa' sol do, fa,[fa'16 mi fa8 fa]\mbreak %%% fine p 4
    fa fa fa fa mi mi mi mi
    re re re re do do do do

    %39
    fa fa mi mi fa fa do do
    fa4 r fa r
    do r do r\mbreak

    %42
    fa r fa r
    re r re r
    sol r sol r

    %45
    sol r sol r
    sol r sol r\mbreak
    sol r sol r

    %48
    fad r fad r
    re r re r
    re r re r

    %51
    re r re r\mbreak
    re r re r
    sol r sol r

    %54
    sol r sol r
    re r re r
    re r re r\mbreak

    %57
    re r r2
    sol8 sol, do re sol4 do,
    fa sib, mib la,

    %60
    re sol, sol r
    sol r sol r
    sol r  sol'8[sol,] re' re,\mbreak

    %63
    sol4 sol' sol sol
    fa fa fa fa
    mib mib mib mib

    %66
    re re re re\mbreak
    fad re(fad re)
    sol sol,(si sol)

    %69
    do' do,(mi do)
    fa fa,(la fa)
    sib' sib,(re sib)

    %72
    mib8(fa sol mib) fa(sol la fa)
    sib,4 r sib r\mbreak
    sol' do, fa sib,

    %75
    mib la, sib r
    R1*5
    sib'8 r la r sol r fa r

    %82
    mib r re do sib4 r
    R1*12
    sol'4 do, fa sib, %%%%ripresa

    %96
    mib la, sib r
    sib r sib r
    sib r sib8 sib fa' fa

    %99
    sib,4 r r2
    R1
    r2 sib'4 la

    %102
    sib8 sib, fa'[fa,] sib4\fermata r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sib\major
    \time 4/4
    \tempo 2 = 53
    \partial 8 s8
    s1*102
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

IvlIII = {
    \Iglobal
    <<\IvlIIIn \forma>>

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
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}

IIvlIn = \relative do'' {

    R1*8
    r4 r8 sib'\solo do,16[lab']~lab32 sol(fa) mib(re16)[sib']~sib32 lab(sol) fa(
    mib8.) (re32 do) sib4 r2

    %11
    r4 r8 mib' do[do16(re32) mib] sib8 lab16(sol32) lab
    \appoggiatura lab8 sol16 fa mib8~mib4 r2\mbreak
    sib'32(sol mib' re do sib lab sol) lab(fa re' do sib lab sol fa) sol(mib do' sib lab sol fa mib) fa(re sib' do sib lab sol fa)

    %14
    sol(fa mib re mib8\noBeam) r4 r2
    r4 mib'8\noBeam ~ mib32 re(do) sib( la16.)[la32 \appoggiatura la8 sib16. do32] \appoggiatura do8 mib,16.[mib32 \appoggiatura mib8 fa16. do32]\mbreak
    re32 sib'-.(la-. sol-. fa-. mib-. re-. do-. sib-. la-. sol-. fa-.) do'8\noBeam\tr sib4 r

    %17
    R1
    r4 fa'32(mi fa sol lab!16) do, si32(do re do re[si lab? sol)] fa'(sol lab sol lab[fa mib? re)]
    mib(re do si do8\noBeam) r4\mbreak r2

    %20
    r4 sol'32-.(sol lab sol sol-.[sol-. lab-. sol-.)] fa-.[(fa-. sol-. fa-.] fa-. fa-. sol-. fa-.) mib-.[( mib-. fa-. mib-.] mib-. mib-. fa-. mib-.)
    re16. sol32 fa16. mib32 re8.\tr do16 do4 r8 sol'
    do,16[lab']~lab32 sol(fa) mib(re16)[sib']~sib32 lab(sol) fa(mib8.) re32 (do sib4)\mbreak

    %23
    r2 r4 r16 sol'-.(sol-. sol-.
    lab-. lab-. lab-. lab-.) lab4\tr sol r32 mib fa mib mib[mib fa mib]
    do'4~do32[mib, fa mib] mib mib fa mib mib'4~mib16. mib32 re16. do32

    %26
    sib16. sib32 lab16. sol32 fa8.\tr mib16 mib8 sol16. lab32 sib4
    r16 sib lab sol fa8.\tr mib16 mib2\fermata

}

IIvlIIn = \relative do'' {

    R1*9
    r4 r8 sib'\solo do,16[lab']~lab32 sol(fa) mib(re16)[sib']~sib32 lab(sol) fa(
    mib8.) (re32 do) sib4 r2

    %12
    r4 r8 mib' do[do16(re32) mib] sib8 lab16(sol32) lab
    \appoggiatura lab8 sol16 fa mib8 r4 r2
    sib'32(sol mib' re do sib lab sol) lab(fa re' do sib lab sol fa) sol(mib do' sib lab sol fa mib) fa(re sib' do sib lab sol fa)

    %15
    sol(fa mib re mib8\noBeam) r4 r2\mbreak
    r2 r4 mib'8\noBeam ~ mib32 re(do) sib(
    la16.)[la32 \appoggiatura la8 sib16. do32] \appoggiatura do8 mib,16.[mib32 \appoggiatura mib8 fa16. do32] re32 sib'-.(la-. sol-. fa-. mib-. re-. do-. sib-. la-. sol-. fa-.) do'8\noBeam\tr

    %18
    sib4 r r2
    r4 fa'32(mi fa sol lab!16) [do,] \mbreak si32(do re do re[si lab? sol)] fa'(sol lab sol lab[fa mib? re)]
    mib(re do si do8\noBeam) mib32-.(mib-. fa-. mib-. mib-.[mib-. fa-. mib-.)] re-.(re-. mib-. re-. re[re-. mib-. re-.)] do-.(do-. re-.  do-. do-.[do-. re-. do-.)]

    %21
    si16. mib32 re16. do32 si8.\tr do16 do4 r
    r2 r4 r8 sib'\mbreak
    do,16[lab']~lab32 sol(fa) mib(re16)[sib']~sib32 lab(sol) fa(mib8.) re32 (do sib16) mib-.(mib-. mib-.

    %24
    fa-. fa-. fa-. fa-.) fa4\tr mib32 mib fa mib mib [mib fa mib] sib'4~
    sib32 mib, fa mib mib[mib fa mib] re'4~re32[mib, fa mib] mib mib fa mib do'16. do32 sib16. lab32
    sol16. sol32 fa16. mib32 re8.\tr mib16 mib8 mib16. fa32 sol4

    %27
    r16 sol fa mib re8.\tr mib16 mib2\fermata

}

IIvlIIIn =  \relative do'' {

    r4\tu  r8^\markup\italic"Pmi"_\markup\italic"2di" <<{sib\p  sib do do sib
                                                      sib4 r8 sol'\p sol do, do sib
                                                      sib4 r8 sib'\p sib mib, mib re

                                                      %4
                                                      do4. lab'8 lab re, re do
                                                      sib4. sol'8 sol do, do sib
                                                      lab sol sol fa fa4 r8 sib

                                                      %7
                                                      do2 re\mbreak
                                                      mib4 reb do8 re?16 mib sol,8(fa\tr)
                                                      mib4}\\{sol8 sol lab lab sol
                                                              sol4 s8 mib' sol lab, lab sol
                                                              sol4 s8 sol' sol do, do sib
                                                              lab4. fa'8 fa sib, sib lab
                                                              sol4. mib'8 mib lab, lab sol
                                                              fa mib mib re re4 s8 sib'
                                                              sib2 lab\mbreak
                                                              sol2 mib8 do' mib,[re]
                                                              mib4}>> r8 mib' lab, lab sib sib

    %10
    mib,4 r8 mib' lab, lab sib sib
    mib,4 r8 sol lab lab sib sib
    mib,4 r8 sol lab lab sib sib\mbreak

    %13
    mib16 sol sol sol fa fa fa re mib mib mib do re re re sib
    mib sol sol sol fa fa fa re mib mib mib do re re re sib
    mib4 r8 mib fa fa fa la,\mbreak

    %16
    sib sib fa' fa sib,4 r8 mib
    fa fa fa la, sib sib fa'[fa]
    sib,4 r8 fa' sol sol, sol la16. si32

    %19
    do8 mib fa fa\mbreak sol sol, sol la16. si32
    do4 r8 do re si do[fad]
    sol do, sol' sol, do4 r8 mib

    %22
    lab, lab sib sib mib,4 r8 mib'\mbreak
    lab, lab sib sib mib,4 r8 mib'
    re re sib sib mib mib mib mib

    %25
    mib mib mib mib mib mib mib mib
    mib lab sib sib, mib sol16. fa32 mib8 sol16. fa32
    mib8 lab sib sib, mib2\fermata

}

IIvlan = \relative do' {

    r4 r8 mib\p mib mib mib mib
    mib4 r8 mib\p mib mib mib mib
    mib4 r8 mib\p mib mib mib mib

    %4
    fa4. fa8 re re re re
    mib4. mib8 lab, lab lab la
    sib sib sib sib sib4 r8 mib

    %7
    lab, lab lab lab  sib sib sib sib\mbreak
    mib mib mib mib lab, lab sib sib
    mib,4 r8 mib' lab, lab sib sib

    %10
    mib,4 r8 mib' lab, lab sib sib
    mib,4 r8 sol lab lab sib sib
    mib,4 r8 mib lab lab sib sib\mbreak

    %13
    mib16 sol sol sol fa fa fa re mib mib mib do re re re sib
    mib sol sol sol fa fa fa re mib mib mib do re re re sib
    mib4 r8 mib fa fa fa la,\mbreak

    %16
    sib sib fa' fa sib,4 r8 mib
    fa fa fa la, sib sib fa'[fa]
    sib,4 r8 fa' sol sol, sol la16. si32

    %19
    do8 mib fa fa\mbreak sol sol, sol la16. si32
    do4 r8 do re si do[fad]
    sol do, sol' sol, do4 r8 mib

    %22
    lab, lab sib sib mib,4 r8 mib'\mbreak
    lab, lab sib sib mib,4 r8 mib'
    re re sib sib mib mib mib mib

    %25
    mib mib mib mib mib mib mib mib
    mib lab sib sib, mib sol16. fa32 mib8 sol16. fa32
    mib8 lab sib sib, mib2\fermata

}

IIbcn = \relative do {

    r8 mib16.\f [re32 mib8 mib,] r2
    r8 mib'16_\markup {  \dynamic f sempre  } [re mib8 mib,] r2
    r8 mib'16[re mib8 mib,] r2

    %4
    r8 mib'16[re mib8 mib,] r2
    r8 mib'16[re mib8 mib,] r2
    r r8 sib''16[lab sib8 mib,]

    %7
    R1*2
    r8 mib16 [re mib8 mib,] r2
    r8 mib'16[re mib8 mib,] r2

    %11
    r8 mib'16 [re mib8 mib,] r2
    r8 mib'16 [re mib8 mib,] r2\mbreak
    R1*2

    %15
    r8 mib'16[fa mib8 mib,] r2\mbreak
    r2 r8 sib''16.[lab!32 sol8 mib]
    R1

    %18
    r8 sib'16.[la!32 sib8 sib,] r2
    R1
    r8 do16.[re32 mib8 do] r2

    %21
    r r8 do'16. [si32 do8 do,]
    r2 r8 mib16. [re32 mib8 mib,]\mbreak
    r2  r8 mib'16.[re32 mib8 mib,]

    %24
    R1*4

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mib\major
    \time 4/4
    \tempo 4 = 40
    s1*27
    \bar"|."


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

IIvlIII = {
    \IIglobal
    <<\IIvlIIIn \forma>>

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
    \typeset

}


IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f

}

IIIvlIn = \relative do'' {

    mib8[sib sol mib]
    sib'[fa re sib]
    lab''[fa re sib]

    %4
    sol'4 r
    mib8[sib sol mib]
    do'[lab mib do]

    %7
    re'[sib fa re]
    mib4 r8 sol'\p
    fa4. sol8

    %10
    fa4. sol8
    fa4. sol8
    fa4 r8 lab

    %13
    sol4. lab8
    sol4. lab8
    sol4. lab8

    %16
    sol4 r8 sib
    la4. sib8\mbreak
    la4. sib8

    %19
    la4. sib8
    la4 r
    re8\f[sib sol re]

    %22
    mib2
    do'8[la fa do]
    re2

    %25
    sib'8[sol mib sib]
    do2
    la'8[fad re la]

    %28
    sib8 sol16 la? sib la sib do
    re do re mi fad mi fad re
    sol8 [do, re \parenthesize re,]

    %31
    sol4 r
    mib'16 sib sol mib mib' sib sol mib %%%% ripresa
    sib'8 r sib, r

    %34
    mib'16 sib sol mib mib' sib sol mib
    sib'4 r
    lab'4. sol16 fa

    %37
    sol8[mib fa re]
    mib4 sib
    lab'4. sol16 fa

    %40
    sol8[mib fa re]
    mib4 r8 mib\solo %%% fine ripresa
    re16 do sib sol' fa mib re lab'

    %43
    sol fa mib sib' lab sol fa do'\mbreak
    sib lab sol sib lab sol fa lab
    sol8 mib r4

    %46
    R2*3
    r8 sib' mib4~
    mib16 [re do sib lab sol fa mib]

    %51
    fa8 lab re4~
    re16[do sib lab sol fa mib re]
    mib8 sol do4~\mbreak

    %54
    do16[sib lab sol fa mib re do]  %%inizio p 16
    re8 fa sib4~
    sib16[lab sol fa mib re do sib]

    %57
    sol'4 r8 sib
    lab32 sol fa16 r8 r lab
    sol32 fa mib16 r8 r sol

    %60
    fa32\staccatissimo sib,(do re mib fa sol lab sib8) sol,\staccatissimo
    fa32\staccatissimo sib(do re mib fa sol lab sib8) fa,\staccatissimo
    mib32\staccatissimo sib'(do re mib fa sol lab sib8) mib,,\staccatissimo \mbreak

    %63
    re16 re'-. re-. fa-. fa sib sib re
    re mib mib fa fa mib mib re
    re mib mib fa fa mib mib re

    %66
    re8 do16 sib do4\tr\mbreak
    sib8[fa re sib]
    fa'[do la fa]

    %69
    mib'[do la fa]
    re'4 r
    sib'8[fa re sib]

    %72
    sol'[mib sib sol]
    la'[fa do la]
    sib4 fa

    %75
    mib'4. re16 do
    re8[sib do la]
    sib4 fa

    %78
    mib'4. re16 do
    re8[sib do la]\mbreak %% fine prima riga p. 17
    sib16(re fa) sib sib8 re,

    %81
    do16(mib la) do do8 mib,
    re16(fa sib) re re8 fa,
    mib16(sol do) mib mib8 sol,

    %84
    fa16(la re) fa fa8 la,
    sol16(sib mib) sol sol8 sib,
    la[fa'-.(fa-. fa-.)]

    %87
    \tupletSpan 4\tuplet 3/2 {fa(mib re do[si do)] }
    do[mib-.(mib-. mib-.)]
    \tuplet 3/2 { mib(re do sib?[la sib)] }

    %90
    sib [re-.(re-. re-.)]\mbreak %%%%%%fine p. 17
    \senza \tuplet 3/2 { re(do sib la[sol la)] }
    la [do-.(do-. do-.)]

    %93
    \tuplet 3/2 {
        do (sib la) sol[(fad sol)]
        fad16( sol la) do,[(re mib)] la,[(sib do)] fad,(sol la)
    }
    re,4 r

    %96
    re16(re' la') re,  re, (re' sib') re,
    re,(re' do') re, re,(re' re') re,
    re, (re' do') re, re,(re' sib') re,

    %99
    re,(re' la') re, re, (re' sib') re,
    re,(re' do') re, re,(re' re') re,
    re, (re' do') re, re,(re' sib') re,\mbreak

    %102
    <<
        {
            la'? \once\slurDown re_.(do_. sib_. la_. sol_. fad_. mi_.
            re_. [do_. sib_. la?_. sol_. fad_. mi_. re_.)]
        }\\{\stemUp \once \override Stem #'transparent = ##t  re'4}\\{\stemUp re,}
    >>
    \once\stemUp sol,8 sol''16 la la4\tr

    %105
    sol r
    R2*2
    sol8[re sib sol]

    %109
    re'[la fad re]
    do''[la fad re]
    sib'4 r

    %112
    sol8[re sib sol]
    mib'[do sol mib]
    fad'[re la fad]\mbreak

    %115
    sol4 r
    re''8[sib sol re]
    mib2

    %118
    do'8[la fa do]
    re2
    sib'8[sol mib sib]

    %121
    do2
    la'8[fad re la]
    sib8 sol16 la sib la sib do

    %124
    re do re  mi fad mi fad re\mbreak
    sol8[do, re re,]
    sol4 r16 mib sol sib

    %127
    mib sib mib sol sib mib, sol sib
    mib8 mib, r4
    R2

    %130
    r16 mib' re do sib do sib lab?
    sol do sib lab sol lab sol fa
    mib mib' re do sib do sib lab

    %133
    sol do sib lab sol lab sol fa
    mib4 r\mbreak
    \set Staff.ottavation = #"all'alta" \senza \tuplet 3/2 { sib16 do sib mib[re mib] sib lab sib mib[re mib]}

    %136
    do do lab lab do do mib r
    \tuplet 3/2 { do re do fa[mib fa] do re do fa[mib fa] }
    re re sib sib re re fa r

    %139
    \tuplet 3/2 { re mib re sol[fa sol] re mib re sol[fa sol] }
    mib mib do do mib mib sol r
    \tuplet 3/2 { mib fa mib lab[sol lab]  mib fa mib lab[sol lab]}

    %142
    fa fa re re fa fa lab r
    fa sib sib8~sib16 lab sol fa
    mib lab lab8~lab16 sol fa  mib

    %145
    re sol sol8~sol16 fa mib re
    do fa fa8~fa16 mib re do
    sib mib mib8~mib16 re do sib

    %148
    lab re re8~re16 do sib lab
    sol8 mib\unset Staff.ottavation r8 sib''
    \appoggiatura sib lab16(sol lab8)~lab4

    %151
    \appoggiatura lab8 sol16(fa sol8)~sol4
    \appoggiatura sol8 fa16 mib fa8~fa sib\mbreak
    sib2~

    %154
    sib8[reb do16(sib) lab(sol)]
    lab8 fa lab4~
    lab8[do sib16(lab) sol(fa)]

    %157
    sol8 mib reb4~
    reb8[fa mib16(reb) do(sib)]
    do8 lab lab'4

    %160
    lab2
    \tuplet 3/2 {
        sol16 mib sol sib[sol sib] sol mib sol sib[sol sib]
        sol mib sol sib[sol sib] sol mib sol sib[sol sib]
    }

    %163
    sol8[mib(sol mib')]\mbreak
    sol,4(fa)
    \tuplet 3/2 { sol16 mib sol sib[sol sib] } mib8 r

    %166
    sol,4(fa)
    \tuplet 3/2 { sol16 mib sol sib[sol sib] } mib8 r
    sol,4 fa\tr

    %169
    mib16 sib sol mib mib' sib sol mib %%%% ripresa
    sib'8 r sib, r
    mib'16 sib sol mib mib' sib sol mib

    %172
    sib'4 r
    lab'4. sol16 fa
    sol8[mib fa re]

    %175
    mib4 sib
    lab'4. sol16 fa
    sol8[mib fa re]

    %178
    mib4 r

}

IIIvlIIn = \relative do'' {

    mib8[sib sol mib]
    sib'[fa re sib]
    lab''[fa re sib]

    %4
    sol'4 r
    mib8[sib sol mib]
    do'[lab mib do]

    %7
    re'[sib fa re]
    mib4 r8 sol'\p
    fa4. sol8

    %10
    fa4. sol8
    fa4. sol8
    fa4 r8 lab

    %13
    sol4. lab8
    sol4. lab8
    sol4. lab8

    %16
    sol4 r8 sib
    la4. sib8\mbreak
    la4. sib8

    %19
    la4. sib8
    la4 r
    re8\f[sib sol re]

    %22
    mib2
    do'8[la fa do]
    re2

    %25
    sib'8[sol mib sib]
    do2
    la'8[fad re la]

    %28
    sib8 sol16 la? sib la sib do
    re do re mi fad mi fad re
    sol8 [do, re \parenthesize re,]

    %31
    sol4 r
    mib'16 sib sol mib mib' sib sol mib %%%% ripresa
    sib'8 r sib, r

    %34
    mib'16 sib sol mib mib' sib sol mib
    sib'4 r
    lab'4. sol16 fa

    %37
    sol8[mib fa re]
    mib4 sib
    lab'4. sol16 fa

    %40
    sol8[mib fa re]
    mib4 r  %%%% fine ripresa
    R2*3

    %45
    r4 r8 mib_\solo
    re16 do sib sol' fa mib re lab'
    sol fa mib sib' lab sol fa do'\mbreak

    %48
    sib lab sol sib lab sol fa lab
    sol8 mib r4
    r8 mib lab4~

    %51
    lab16[sol fa mib re do sib lab]
    sib8 re sol4~
    sol16[fa mib re do sib lab sol]\mbreak

    %54
    lab8 do fa4~
    fa16[mib re do sib lab sol fa]
    sol8 sib mib4

    %57
    r32 sib(do re mib fa sol lab sib8) sol,\staccatissimo
    fa32\staccatissimo sib(do re mib fa sol lab sib8) fa,\staccatissimo
    mib32\staccatissimo sib' do re mib fa sol lab sib8 mib,,\staccatissimo

    %60
    re\staccatissimo sib\staccatissimo r sib''
    la32 sol fa16 r8 r lab
    sol32 fa mib16 r8 r sol\mbreak

    %63
    sib,,16 sib'-. sib-. re-. re fa fa sib
    sib do do re re do do sib
    sib do do re re do do sib

    %66
    sib8 fa la4\tr \mbreak
    sib8[fa re sib]
    fa'[do la fa]

    %69
    mib'[do la fa]
    re'4 r
    sib'8[fa re sib]

    %72
    sol'[mib sib sol]
    la'[fa do la]
    sib4 fa

    %75
    mib'4. re16 do
    re8[sib do la]
    sib4 fa

    %78
    mib'4. re16 do
    re8[sib do la]\mbreak %% fine prima riga p. 17
    sib4 r

    %81
    R2
    sib16(re fa) sib sib8 re,
    do16(mib la) do do8 mib,

    %84
    re16(fa sib) re re8 fa,
    mib16(sol do) mib mib8 sol,
    fa[re'-.(re-. re-.)]

    %87
    \tupletSpan 4\con \tuplet 3/2 { re(do si la[sol fa)] }
    mi8 [do'-.(do-. do-.)]
    \tuplet 3/2 { do(sib? la sol[fa mib)] }

    %90
    re[sib'-.(sib-. sib-.)]\mbreak
    \senza \tuplet 3/2 { sib (la sol fa[mib re)] }
    do[la'-. (la-. la-.)]

    %93
    \tuplet 3/2 { la? (sol fad) re[(do sib)] }
    la4 r
    \tuplet 3/2{fad'16( sol la) do,[(re mib)] la,[(sib do)] fad,(sol la)}

    %96
    re,(re' fad) re re,(re' sol) re
    re,(re' la') re, re,(re' sib') re,
    re,(re' la') re, re,(re' sol) re

    %99
    re,(re' fad) re re,(re' sol) re
    re,(re' la') re, re,(re' sib') re,
    re,(re' la') re, re,(re' sol) re\mbreak

    %102
    <<fad4\\\stemUp \once \override Stem #'transparent = ##t  re\\\stemUp re,>> r4
    R2*2
    r16 re''-.[(do-. sib-. la-. sol-. fad-. mi-.]

    %106
    re-. [do-. sib-. la-. sol-. fad-. mi-. re-.)]
    \once\stemUp sol,8 sol''16 la la4\tr
    sol8[re sib sol]

    %109
    re'[la fad re]
    do''[la fad re]
    sib'4 r

    %112
    sol8[re sib sol]
    mib'[do sol mib]
    fad'[re la fad]\mbreak

    %115
    sol4 r
    re''8[sib sol re]
    mib2

    %118
    do'8[la fa do]
    re2
    sib'8[sol mib sib]

    %121
    do2
    la'8[fad re la]
    sib8 sol16 la sib la sib do

    %124
    re do re  mi fad mi fad re\mbreak
    sol8[do, re re,]
    sol4 r

    %127
    R2
    r4 r16 mib sol sib
    mib sib mib sol sib mib, sol sib

    %130
    mib8 mib, r4
    r16 mib' re do sib do sib lab
    sol do sib lab sol lab sol fa

    %133
    mib mib' re do sib do sib lab
    sol do sib lab sol lab sol fa\mbreak
    mib4 r

    %136
    \set Staff.ottavation = #"all'alta"  \tuplet 3/2 { mib,16 fa mib lab[sol lab]  mib fa mib lab[sol lab]}
    fa fa do do fa fa la r
    \tuplet 3/2 { fa sol fa sib[lab sib] fa sol fa sib[lab sib]}

    %139
    sol sol re re sol sol si r
    \tuplet 3/2 { sol lab sol do[sib? do] sol \parenthesize lab sol do[sib do]}
    lab lab mib mib lab lab do r\mbreak

    %142
    \tuplet 3/2 { lab sib lab re[do re] lab sib lab re[do re] }
    sib4 r
    R2

    %145
    sib16 mib mib8~mib16 re do sib
    lab re re8~re16 do sib lab
    sol do do8~do16 sib lab sol

    %148
    fa sib sib8~sib16 lab sol fa
    mib4 \unset Staff.ottavation r8 sol'
    \appoggiatura sol fa16(mib fa8)~fa4

    %151
    \appoggiatura fa8 mib16(re mib8)~mib4
    \appoggiatura mib8 re16(do re8)~re fa\mbreak
    mi2~

    %154
    mi8[sib' lab16(sol) fa(mi)]
    fa8 do re4~
    re8[lab' sol16(fa) mib(re)]

    %157
    mib8 sib sol4~
    sol8[reb' do16(sib) lab(sol)]
    lab8 mib mib'4

    %160
    re2
    \tuplet 3/2 {
        mib16 sib mib sol[mib sol] mib sib mib sol[mib sol]
        mib sib mib sol[mib sol] mib sib mib sol[mib sol]
    }

    %163
    mib8[ sib(mib sib')]\mbreak
    mib,4(re)
    \tuplet 3/2 { mib16 sib mib sol[mib sol] } sib8 r

    %166
    mib,4(re)
    \tuplet 3/2 { mib16 sib mib sol[mib sol] } sib8 r
    mib,4 re\tr

    %169
    mib16 sib sol mib mib' sib sol mib %%%% ripresa
    sib'8 r sib, r
    mib'16 sib sol mib mib' sib sol mib

    %172
    sib'4 r
    lab'4. sol16 fa
    sol8[mib fa re]

    %175
    mib4 sib
    lab'4. sol16 fa
    sol8[mib fa re]

    %178
    mib4 r

}

IIIvlIIIn =  \relative do'' {

    mib8[sib sol mib]
    sib'[fa re sib]
    lab''[fa re sib]

    %4
    sol'4 r
    mib8[sib sol mib]
    do'[lab mib do]

    %7
    re'[sib fa re]
    mib4 r8 mib'
    re4. mib8

    %10
    sib4. mib8
    re4. mib8
    sib4 r8 fa'

    %13
    mi4. fa8
    do4. fa8
    mi4. fa8

    %16
    do4 r8 sol'
    fad4. sol8\mbreak
    re4. sol8

    %19
    fad4. sol8
    re4 r
    R2

    %22
    sol8\f[mib do sol]
    la2
    fa'8[re sib fa]

    %25
    sol2
    mib'8[do la mib]
    fad2

    %28
    sol8 sol16 la? sib la sib do
    re do re mi fad mi fad re
    sol8 [do, re \parenthesize re,]

    %31
    sol4 r
    mib'16 sib sol mib mib' sib sol mib %%%% ripresa
    sib'8 r sib, r

    %34
    mib'16 sib sol mib mib' sib sol mib
    sib'4 r
    fa'4. mib16 re

    %37
    mib8[sol, lab fa]
    sol4 sol
    fa'4. mib16 re

    %40
    mib8[sol, lab fa]
    mib4 r %% ripresa fine
    R2*3

    %45
    <<{sol'8^\markup\italic"P.mi"[mib sib sol]}\\{mib'_\markup\italic"2.di"[sib sol mib]}>>
    R2*3
    <<{sol'8[mib sib sol]}\\{mib'[sib sol mib]}>>

    %50
    R2*17
    sib''8[fa re sib]
    fa'[do la fa]

    %69
    mib'[do la fa]
    re'4 r
    sib'8[fa re sib]

    %72
    sol'[mib sib sol]
    la'[fa do la]
    sib4 re,

    %75
    do'4. sib16 la
    sib8[re, mib do]
    re4 re

    %78
    do'4. sib16 la
    sib8[re, mib do]\mbreak
    re4 r

    %81
    R2*27
    sol'8[re sib sol]

    %109
    re'[la fad re]
    do''[la fad re]
    sib'4 r

    %112
    sol8[re sib sol]
    mib'[do sol mib]
    fad'[re la fad]\mbreak

    %115
    sol4 r
    R2
    sol'8[mib do sol]

    %118
    la2
    fa'8[re sib fa]
    sol2

    %121
    mib'8[do la mib]
    fad2
    sol8 sol16 la sib la sib do

    %124
    re do re  mi fad mi fad re\mbreak
    sol8[do, re re,]
    sol4 r

    %127
    R2*8
    sol8[sol sol sol]
    lab [lab lab lab]

    %137
    la[la la la]
    sib[sib sib sib]
    si[si si si]

    %140
    do[do do do]
    do[do do do]\mbreak
    re[re re re]

    %143
    re sib r4
    R2*5
    mib,8[fa sol mib]

    %150
    fa[mib re sib]
    mib[fa sol mib]
    sib[do re sib]\mbreak

    %153
    do[re mi re]
    do2
    fa8[lab fa re]

    %156
    sib2
    mib8[fa sol fa]
    mib2

    %159
    lab,8[sib do lab]
    sib[do re sib]
    mib[fa sol fa]

    %162
    mib[fa sol fa]
    mib[fa sol mib]\mbreak
    sib'[lab sib sib,]

    %165
    mib[fa sol mib]
    sib'[lab sib sib,]
    mib[fa sol mib]

    %168
    sib'[lab sib sib,]
    mib'16 sib sol mib mib' sib sol mib %%%% ripresa
    sib'8 r sib, r

    %171
    mib'16 sib sol mib mib' sib sol mib
    sib'4 r
    fa'4. mib16 re

    %174
    mib8[sol, lab fa]
    sol4 sol
    fa'4. mib16 re

    %177
    mib8[sol, lab fa]
    mib4 r

}

IIIvlan = \relative do' {

    sol'4 sol
    fa fa
    re re

    %4
    sib r
    sol' sol
    mib do

    %7
    fa re
    sib r8 mib
    sib'[sib sib mib,]

    %10
    re[re re mib]
    sib'[sib sib mib,]
    re4 r8 do'

    %13
    do[do do fa,]
    mi[mi mi fa]
    do'[do do fa,]

    %16
    mi4 r8 re'
    re[re re sol,]\mbreak
    fad[fad fad sol]

    %19
    re'[re re sol,]
    fad4 r
    sib8\f[sol re sib']

    %22
    mib,[do sol mib']
    la[fa do la']
    re,[sib fa re']

    %25
    sol[mib sib sol']
    do,[la? mib do']
    fad[re la fad']

    %28
    re8 sol,16 la? sib la sib do
    re do re mi fad mi fad re
    sol8 [do, re \parenthesize re,]

    %31
    sol4 r
    sol'8 r sol r  % ripresa
    fa r fa r

    %34
    mib r mib r
    re4 r
    re4. re8

    %37
    sib[sib do sib]
    sib2
    re4. re8

    %40
    sib[sib do sib]
    sib4 r %%%%% ripresa
    R2*3

    %45
    sib'8[sol mib sib]
    R2*3
    sib'8[sol mib sib]

    %50
    R2*17
    re'4 re
    do do

    %69
    la la
    fa r
    re' re

    %72
    sib sol
    do la
    fa fa

    %75
    la4. la8
    fa[fa sol fa]
    fa4 fa

    %78
    la4. la8
    fa[fa sol fa]\mbreak
    fa4 r

    %81
    R2*27
    sib4 sib
    la la

    %110
    fad fad
    re r
    sib' sib

    %113
    sol mib
    la fad\mbreak
    re r

    %116
    sib'8[sol re sib']
    mib,[do sol mib']
    la[fa do la']

    %119
    re,[sib fa re']
    sol[mib sib sol']
    do,[la? mib do']

    %122
    fad[re la fad']
    re8 sol,16 la? sib la sib do
    re do re mi fad mi fad re

    %125
    sol8 [do, re re,]
    sol4 r
    R2*8

    %135
    sol'8[sol sol sol]
    lab [lab lab lab]

    %137
    la[la la la]
    sib[sib sib sib]
    si[si si si]

    %140
    do[do do do]
    do[do do do]\mbreak
    re[re re re]

    %143
    re sib r4
    R2*5
    mib,8[fa sol mib]

    %150
    fa[mib re sib]
    mib[fa sol mib]
    sib[do re sib]\mbreak

    %153
    do[re mi re]
    do2
    fa8[lab fa re]

    %156
    sib2
    mib8[fa sol fa]
    mib2

    %159
    lab,8[sib do lab]
    sib[do re sib]
    mib[fa sol fa]

    %162
    mib[fa sol fa]
    mib[fa sol mib]\mbreak
    sib'[lab sib sib,]

    %165
    mib[fa sol mib]
    sib'[lab sib sib,]
    mib[fa sol mib]

    %168
    sib'[lab sib sib,]
    sol'8 r sol r  % ripresa
    fa r fa r

    %171
    mib r mib r
    re4 r
    re4. re8

    %174
    sib[sib do sib]
    sib2
    re4. re8

    %177
    sib[sib do sib]
    sib4 r

}

IIIbcn = \relative do {

    mib4 mib
    re re
    sib sib

    %4
    mib16[fa sol lab sib do re mib]
    mib,4 mib
    lab, lab

    %7
    sib sib
    mib r
    R2*3

    %12
    sib8\f[sib' mi ,fa]
    do4 r
    R2*2

    %16
    do8\f[do' fad, sol]
    re4 r\mbreak
    R2*2

    %20
    re8\f[re' fad, re]
    sol,16[la sib do re  mib fa? sol]
    do,[re  mib fa sol la sib do]

    %23
    fa,,[sol la sib do re mib fa]
    sib,[do re mib fa sol la sib]
    mib,,[fa sol  la sib do re mib]

    %26
    la,[sib do re mib fa sol la]
    re,,[mi fad sol la sib do re]
    sol,8 \clef tenor sol'16 la? sib la sib do

    %29
    re do re mi fad mi fad re
    sol8 [do, re \parenthesize re,]
    sol4 r

    %32
    \clef bass mib8 r mib r  %%ripresa
    re r re r
    do r do r

    %35
    sib4 r
    sib16[do re mib fa sol lab sib]
    mib,8[mib lab, sib]

    %38
    mib16 fa sol fa mib8 mib,
    sib'16[do re mib fa sol lab sib]
    mib,8[mib lab, sib]

    %41
    mib,4 r8 mib' %5fine ripresa
    sib'[sib, re sib]
    mib[sol fa lab]\mbreak

    %44
    sol[mib fa sib,]
    mib4 r8 mib
    sib'8[sib, re sib]

    %47
    mib[sol fa lab]
    sol[mib fa sib,]
    mib4 r8 mib

    %50
    do'4 r
    fa, r
    sib r

    %53
    mib, r\mbreak
    lab r
    re, r

    %56
    mib r
    mib r8 sol
    fa4 r8 fa

    %59
    mib4 r8 mib
    re sib r sol'
    fa4 r8 fa

    %62
    mib4 r8 mib\mbreak
    re8[mib re do]
    sib[fa' sib, fa']

    %65
    sib,[fa' sib, fa']
    sib,[sib' fa fa,]\mbreak
    sib'4 sib

    %68
    la la
    fa fa
    sib,16[do re mib fa sol la sib]

    %71
    sib,4 sib'
    mib, mib
    fa fa

    %74
    sib16 do re do sib8 sib,
    fa16[sol la sib do re mib fa]
    sib,8 [sib' mib, fa]

    %77
    sib16 do re do sib8 sib,
    fa16[sol la sib do re mib fa]
    sib,8[sib' mib, fa]\mbreak

    %80
    sib,4 r
    fa'2~_\markup\italic"T[asto] S[olo]"
    fa~

    %83
    fa~
    fa~
    fa~

    %86
    fa4 r
    sol sol,
    do r

    %89
    fa fa,
    sib r\mbreak
    mib mib,

    %92
    la r
    re re,
    re r

    %95
    re r
    re' re
    re re

    %98
    re re
    re re
    re re

    %101
    re re\mbreak
    re r
    re r

    %104
    sol,8[do' re re,]
    sol,4 r
    re' r

    %107
    sol,8[do' re re,]
    sol4 sol
    fad fad

    %110
    re re
    sol,16[la sib do re mi fad sol]
    sol,4 sol'

    %113
    do, do
    re re\mbreak
    sol, r

    %116
    sol16[la sib do re  mib fa? sol]
    do,[re  mib fa sol la sib do]
    fa,,[sol la sib do re mib fa]

    %119
    sib,[do re mib fa sol la sib]
    mib,,[fa sol  la sib do re mib]
    la,[sib do re mib fa sol la]

    %122
    re,,[mi fad sol la sib do re]
    sol,8 \clef tenor sol'16 la sib la sib do
    re do re mi fad mi fad re

    %125
    sol8 [do, re re,]
    sol4\clef bass r
    mib4 mib

    %128
    mib mib
    mib mib
    mib2~_\markup\italic"T.S."

    %131
    mib2~
    mib2~
    mib2~

    %134
    mib2\mbreak
    mib4 r
    R2*7

    %143
    sib2~
    sib2~
    sib2~

    %146
    sib2~
    sib2~
    sib2

    %149
    mib4 r
    R2*19
    mib8 r mib r  %%ripresa

    %170
    re r re r
    do r do r
    sib4 r

    %173
    sib16[do re mib fa sol lab sib]
    mib,8[mib lab, sib]
    mib16 fa sol fa mib8 mib,

    %176
    sib'16[do re mib fa sol lab sib]
    mib,8[mib lab, sib]
    mib,4 r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mib\major
    \time 2/4
    \tempo 2 = 55
    s2*178
    \bar"|."


}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}

IIIvlIII = {
    \IIIglobal
    <<\IIIvlIIIn \forma>>

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
    \typeset

}
#(set-global-staff-size 15)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        } \relative do' <<
            \new Staff <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Due Violini""ob[b]ligati"}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violini]""Pmi e 2di"}
            \IvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc

        >>
    >>

    \layout {

        indent = 1.6\cm

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

\pageBreak

\markup\huge "[2.] [Largo]"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        } \relative do' <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \IIbc

        >>
    >>

    \layout {

        indent = 0.8\cm

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

\pageBreak

\markup\huge "[3.] [All[egr]o]"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        } \relative do' <<
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
            \set Staff.midiInstrument = #"violin"
            \IIIvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc

        >>
    >>

    \layout {

        indent = 0.8\cm

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



