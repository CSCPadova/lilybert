\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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
    \terzine\con
}

Ifln = \relative do'' {

    R1*23
    sol'2^\markup\italic"Ad[agi]o" \tuplet 3/2 { la16(sol fa sol[fa  mi] fa mi re mi[re do)]}
    la'4 fa8 re do(si) do4

    %26
    R1*3
    r2 r4 r8 do
    \senza\tupletSpan 4 \tuplet 3/2 { mi8 re do sol'[fa mi] } la4\tr sol8 la

    %31
    fa16(re do si) sol'(fa mi re) mi8 do r mi
    re16 fad sol8~sol16 re(do si)) do fad sol8~sol16 do,(si la)
    si fad' sol8~sol16 si,(la sol) fad(sol la si) do(re mi do)\mbreak

    %34
    do4\tr si8 re mi16(do si do) mi8 fad
    sol16(do, si do mi8 fad) sol[ fad16(sol) la(sol) fad(mi)]
    re8[do16(re mi do si la)] si8 [la16(si do si la sol)]

    %37
    re2 si'8 la16 si do si la sol
    re4. la''8 si16(la) si(sol) la4\tr
    sol r r2

    %40
    R1*10
    r2 r4 r8 la
    si16(fad) sol4 la8 si16(fad) sol4 re8

    %52
    mi16(do) re(si) do(la) si(sol) la(fad) sol(mi) \once\stemUp re8 la''
    si16(fad) sol4 la8 si16(fad) sol4 re8
    mi16(do) re(si) do(la) si(sol) dod4(re)

    %55
    r8 fa? \con \terzine \tuplet 3/2 { re16 do si do[si la] } sold8(si re sold)  %% secondo sistema p. 4
    \tuplet 3/2 { si16(la sold) la[(sold fad)] sold(fad mi) fa[(mi re)] } dod8 mi \tuplet 3/2 { dod16(si la) sib[[(la sol?)] }
    fad8 la re fad \tuplet 3/2 { la16(sol fad) sol[(fad mi)] fad(mi re) mi[(re do)] }

    %58
    si8 re \tuplet 3/2 { si16 la sol la[sol fa?] } mi8 sol do mi\mbreak
    \tuplet 3/2 { sol16(fa mi) fa[(mi re)] mi(re do) re[(do sib)] } la8(do fa la)
    \tuplet 3/2 { la16(sol fa) sol[(fa mi)] fa(mi re) mi[(re do)] } sib8 (re sol sib)

    %61
    \senza \tuplet 3/2 { sib?16 la sol la[sol fa] sol fa mi fa[mi re] } do8 mi sol sib!
    \tuplet 3/2 { la16 sol fa la[sol fa] } sol4\tr fa r
    R1*9

    %72
    r2 fa8[la sol16(fa) mi(re)]
    do16 si do4 do8 sol'[sib la16(sol) fa(mi)]
    la(sol) fa4 la8 dod, mi re16(dod) si?(la)

    %75
    fa'8 la sol16(fa) mi(re) sib8 re do?16(sib) la(sol)
    mi'8 sol fa16(mi) re(dod)\mbreak fa8 la sol16(fa) mi(re)
    sol8 sib? la16(sol) fa(mi) fa8 la sol16(fa) mi(re)

    %78
    dod si? la sold la8 la fa' mi16(re) do?(si) la(sold)
    mi'8[re16(do) si(la) sold(fa)] re'8[do16(si) la(sold) fad(mi)]
    la'8[sol?16(fa?) mi(re) do(si)]\mbreak do8[si16 la si8 sold]

    %81
    la4 r r2
    R1*4
    r2 r4 r8 mi'\mbreak

    %87
    do si16 la mi'8 re16 do fa4\tr mi8 fa
    re16 si la sold mi' re do si do8 la r sol'?
    mi re16 do sol'8 fa16 mi la4\tr sol8 la

    %90
    fa16(re do si) sol'(fa mi re) mi8 do r do
    sol'(fa16 mi) re8(do16 sib) sib4\tr la8 la
    la'(sol16 fad) mi8 re16 do do4\tr si?8 si

    %93
    si'(la16 sold) fa!8(mi16 re)\mbreak re8\tr do r do
    \con \tuplet 3/2 { la'16(sol? fa) sol[(fa mi)] fa(mi re) mi[(re do)] } si la sol8 r re'
    mib16 do sol'4 do,8 re16 si sol'4 re8

    %96
    mib16 do sol'4 do,8 re16 si sol'4 re8
    \tuplet 3/2 { mib16(re do)  mib[(re do)]} sol'4 \tuplet 3/2 { lab16(sol fa) lab[(sol fa)] } si4
    do8 do, r sol'\mbreak mi?16(sol mi do) re\f(fa re si)

    %99
    do(sol mi sol) do(mi sol fa) mi(sol mi do) re(fa re si)
    si8 (do4) fa8 mi16(sol mi do) re(fa re si)
    do sol mi sol do mi sol fa mi sol mi do re fa re si

    %102
    si8 (do4) r8 r2
    R1*22
    sol'2^\markup\italic"Ad[agi]o" \tuplet 3/2 { la16(sol fa sol[fa  mi] fa mi re mi[re do)]}

    %126
    la'4 fa8 re do(si) do4
    R1*4

}

IvlIn =  \relative do'' {

    do4 r8 sol do4 r8 sol
    do sol mi do do' sol mi do
    sol'4 r8 sol, sol'4 r8 sol,

    %4
    sol' re si sol sol' re si sol
    do4 r8 sol'' fa mi re do
    si la sol do si la sol fa

    %7
    mi re do sol' fa mi re do
    sol'4 r fa'4 fa\mbreak
    fa8[mi16(fa) sol(fa) mi(re)] mi8 sol, mi do

    %10
    fa'4\p fa fa8[mi16(fa) sol(fa) mi(re)]
    mi8 sol, mi do mi'2\f
    fa16 do sib do la8 fa fad'2

    %13
    sol16 re do re si8 sol do si la sol
    la sol fa mi fa mi re do
    sol'4 r mib'8 sol4 mib8\mbreak

    %16
    reb fa4 lab8 re, fad4 la8
    si, re4 sol8 si, re4 sol8
    do, mib4 sol8 do, mi4 sol8

    %19
    do, fa4 lab8 do, fad4 la8
    si,[sol16 sol sol8 sol] re'[fa,?16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak

    %22
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4 r
    R1*2

    %26
    sol'8^\markup\italic"All[egr]o"[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]

    %29
    si,8 do sol' sol, do4 r8 do  %%%fine ripresa
    do re mi do fa si, do fa
    re sol, si sol do re  mi do

    %32
    si [si'16 la si8 si,] la[la'16 sol la8 la,]
    sol[sol'16 fad sol8 sol,]  re' fad la re,\mbreak
    sol la si sol do,4. do8

    %35
    si4. la8 sol re' fad re
    sol re fad re sol re mi dod
    re[ fad'16 mi fad8 re ] si4 r

    %38
    re,8 [fad'16 sol fad8 re] \once\stemDown si sol, re'4
    sol4. sol,8 sol'4. sol,8
    sol' re si sol sol' re si sol

    %41
    re'4 r re' r8 re,
    re'4 r8 re, re' la fad re\mbreak
    re' la fad re sol4 r

    %44
    do4 do do8[si16(do) re(do) si(la)]
    si8 re, si sol do'4 do
    do8[si16 do re do si la] si8 re, si sol

    %47
    re'[re16 re re8 re] la'[do,16 do do8 do]
    si16[sol' fad mi re do si la] sol8[sol'16 sol sol8 sol]
    re'[fa,?16 fa fa8 fa] mi16 [fad sol la si do re mi]

    %50
    fad,8 sol re' re, <<{sol la si fad}\\{sol,4 r}>>
    sol'8 la si fad sol la si si,
    do4 r8 sol re' mi fad re

    %53
    sol la si fad sol la si si,
    do4 r8 sol re' do? si la
    sold re' sold, re'\mbreak mi fad sold fad

    %56
    mi4 r la,8 dod la dod
    re mi fad mi re4 r
    sol,8 si sol si do re mi re\mbreak

    %59
    do4 r  fa8 sol la fa
    sib,4 r sol'8 la sib sol
    do,4 r do8 re mi do

    %62
    fa4 do fa'8 mi re do
    re do sib la sib la sol fa
    do' sol mi do sib''4 sib

    %65
    sib?8[\once\slurDashed la16 (sib!) do(sib) la(sol)] la8 do, la fa
    sib'4 sib sib8[\once\slurDashed la16 (sib) do(sib) la(sol)]
    la8 do, la fa do' fa4 lab8

    %68
    reb, sol4 sib8 mi, sol4 do,8
    fa lab4 do,8 sol' sib4 do,8
    lab' do4 fa,8 mi[do,16 do do8 do]

    %71
    sol'[sib,16 sib sib8 sib] la16[sib do re mi fa sol la]
    mi8 fa do' do, fa4 r
    fa8 sol la fa mi4 do

    %74
    fa8 sol la re, la2
    re sol
    dod,\mbreak re

    %77
    dod re4 sib?
    la8 si? dod la re4 mi
    do re si do

    %80
    la sold\mbreak la8 do re mi
    la,4 r fa'' fa
    fa8[sol16(fa) mi(re) mi(fa)] mi4 mi

    %83
    mi8[fa16(mi) re(do) re(mi)] re4 re
    re8[mi16(re) do(si) do(re)] do4 do
    re re do la'~

    %86
    la sold <<{la4 r}\\{la,8 la, do sold]}>> \mbreak
    la si do la re sold, la fa'
    mi fad sold mi la do, re sol,?

    %89
    do re mi do fa? si, do la
    sol la si sol do re mi do
    mi4. mi8 fa sol la sol

    %92
    fad4. fad8 sol la si la
    sold4. sold8\mbreak la si do la
    fa?4. fad8 sol la si sol

    %95
    do, re mib do sol la si sol
    do re mib do sol  la si sol
    do re mib do fa sol fa re

    %98
    mi! fa sol si,\mbreak do do' sol sol,
    do re mi si do do' sol sol,
    do re mi si do do' sol sol,

    %101
    do re mi si do do' sol sol,
    do'4 r8 sol do4 r8 sol
    do sol mi do do' sol mi do

    %104
    sol'4 r8 sol, sol'4 r8 sol,
    sol' re si sol sol' re si sol
    do4 r8 sol'' fa mi re do

    %107
    si la sol do si la sol fa
    mi re do sol' fa mi re do
    sol'4 r fa'4 fa\mbreak

    %110
    fa8[mi16(fa) sol(fa) mi(re)] mi8 sol, mi do
    fa'4\p fa fa8[mi16(fa) sol(fa) mi(re)]
    mi8 sol, mi do mi'2\f

    %113
    fa16 do sib do la8 fa fad'2
    sol16 re do re si8 sol do si la sol
    la sol fa mi fa mi re do

    %116
    sol'4 r mib'8 sol4 mib8\mbreak
    reb fa4 lab8 re, fad4 la8
    si, re4 sol8 si, re4 sol8

    %119
    do, mib4 sol8 do, mi4 sol8
    do, fa4 lab8 do, fad4 la8
    si,[sol16 sol sol8 sol] re'[fa,?16 fa fa8 fa]

    %122
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4 r

    %125
    R1*2
    sol'8^\markup\italic"All[egr]o"[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak

    %129
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4\fermata r  %%%fine ripresa

}

IvlIIn = \relative do'' {

    do4 r8 sol do4 r8 sol
    do sol mi do do' sol mi do
    sol'4 r8 sol, sol'4 r8 sol,

    %4
    sol' re si sol sol' re si sol
    do4 r8 sol'' fa mi re do
    si la sol do si la sol fa

    %7
    mi re do sol' fa mi re do
    sol'4 r re' re\mbreak
    re8[do16 re mi re do si ] do8 sol mi do

    %10
    re'4\p re re8[do16 re mi re do si]
    do8 sol mi do do'2\f
    do8 la r4 re2

    %13
    re8 si r4 do8 si la sol
    la sol fa mi fa mi re do
    sol'4 r do8 mib4 do8\mbreak

    %16
    lab do4 fa8 la, re4 fad8
    re si4 re8 sol, si4 re8
    sol, do4 mib8 sol, do4 mi8

    %19
    lab, do4 fa8 la, do4 fad8
    re[sol,16 sol sol8 sol] re'[fa,?16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak

    %22
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4 r
    R1*2

    %26
    sol'8[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]

    %29
    si,8 do sol' sol, do4 r8 do  %%%fine ripresa
    do re mi do fa si, do fa
    re sol, si sol do re  mi do

    %32
    si [si'16 la si8 si,] la[la'16 sol la8 la,]
    sol[sol'16 fad sol8 sol,]  re' fad la re,\mbreak
    sol la si sol do,4. do8

    %35
    si4. la8 sol re' fad re
    sol re fad re sol re mi dod
    re[re'16 do? re8 la] sol4 r

    %38
    re8[re'16 do re8 la] sol sol, re'4
    sol4. sol,8 sol'4. sol,8
    sol' re si sol sol' re si sol

    %41
    re'4 r re' r8 re,
    re'4 r8 re, re' la fad re\mbreak
    re' la fad re sol4 r

    %44
    la4 la la8[sol16 la si la sol fad]
    sol8 re si sol la'4 la
    la8[sol16 la si la sol fad] sol8 re si sol

    %47
    re'[re16 re re8 re] la'[do,16 do do8 do]
    si16[sol' fad mi re do si la] sol8[sol'16 sol sol8 sol]
    re'[fa,?16 fa fa8 fa] mi16 [fad sol la si do re mi]

    %50
    fad,8 sol re' re, sol la si fad
    sol8 la si fad sol la si si,
    do4 r8 sol re' mi fad re

    %53
    sol la si fad sol la si si,
    do4 r8 sol re' do? si la
    sold re' sold, re'\mbreak mi fad sold fad

    %56
    mi4 r la,8 dod la dod
    re mi fad mi re4 r
    sol,8 si sol si do re mi re\mbreak

    %59
    do4 r  fa8 sol la fa
    sib,4 r sol'8 la sib sol
    do,4 r do8 re mi do

    %62
    fa4 do fa'8 mi re do
    re do sib la sib la sol fa
    do' sol mi do sol''4 sol

    %65
    sol8[\once\slurDashed fa16 (sol) la(sol) fa(mi)] fa8 do la fa
    sol'4 sol sol8[\once\slurDashed fa16 (sol) la(sol) fa(mi)]
    fa8 do la fa lab do4 fa8

    %68
    fa reb4 fa8 do mi4 sol8
    do, fa4 lab8 do, sol'4 sib8
    do, lab'4 lab8 \once\stemDown sol8 [do,,16 do do8 do]

    %71
    sol'[sib,16 sib sib8 sib] la16[sib do re mi fa sol la]
    mi8 fa do' do, fa4 r
    fa8 sol la fa mi4 do

    %74
    fa8 sol la re, la2
    re sol
    dod,\mbreak re

    %77
    dod re4 sib?
    la8 si? dod la re4 mi
    do re si do

    %80
    la sold\mbreak la8 do re mi
    la,4 r re' re
    re8[mi16(re) do(si) do(re)] do4 do

    %83
    do8[re16(do) si(la) si(do)] si4 si
    si8[do16(si) la(sold) la(si)] la4 la
    si si la do

    %86
    si2 la8 la, do sold\mbreak
    la si do la re sold, la fa'
    mi fad sold mi la do, re sol,?

    %89
    do re mi do fa? si, do la
    sol la si sol do re mi do
    mi4. mi8 fa sol la sol

    %92
    fad4. fad8 sol la si la
    sold4. sold8\mbreak la si do la
    fa?4. fad8 sol la si sol

    %95
    do, re mib do sol la si sol
    do re mib do sol  la si sol
    do re mib do fa sol fa re

    %98
    mi! fa sol si,\mbreak do do' sol sol,
    do re mi si do do' sol sol,
    do re mi si do do' sol sol,

    %101
    do re mi si do do' sol sol,
    do'4 r8 sol do4 r8 sol
    do sol mi do do' sol mi do

    %104
    sol'4 r8 sol, sol'4 r8 sol,
    sol' re si sol sol' re si sol
    do4 r8 sol'' fa mi re do

    %107
    si la sol do si la sol fa
    mi re do sol' fa mi re do
    sol'4 r re' re\mbreak

    %110
    re8[do16 re mi re do si ] do8 sol mi do
    re'4\p re re8[do16 re mi re do si]
    do8 sol mi do do'2\f

    %113
    do8 la r4 re2
    re8 si r4 do8 si la sol
    la sol fa mi fa mi re do

    %116
    sol'4 r do8 mib4 do8\mbreak
    lab do4 fa8 la, re4 fad8
    re si4 re8 sol, si4 re8

    %119
    sol, do4 mib8 sol, do4 mi8
    lab, do4 fa8 la, do4 fad8
    re[sol,16 sol sol8 sol] re'[fa,?16 fa fa8 fa]

    %122
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4 r

    %125
    R1*2
    sol'8[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak

    %129
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4\fermata r %%%fine ripresa

}

Ivlan =  \relative do' {

    do'4 r8 sol do4 r8 sol
    do sol mi do do' sol mi do
    sol'4 r8 sol, sol'4 r8 sol,

    %4
    sol' re si sol sol' re si sol
    do4 r8 \clef violin sol'' fa mi re do
    \clef alto si la sol do si la sol fa

    %7
    mi re do sol' fa mi re do
    sol'4 r r2
    si4 si sol8 sol mi do

    %10
    r2 si'4 si
    sol8 sol mi do sol'2\f
    fa8 do r4 la'2

    %13
    sol8 re r4 do'8 si la sol
    la sol fa mi fa  mi re do
    sol'4 r do,4 do\mbreak

    %16
    fa fa fad fad
    sol sol fa? fa mib mib mi mi
    fa fa fad fad

    %19
    sol8[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak

    %22
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4 r
    R1*2

    %26
    sol'8[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]

    %29
    si,8 do sol' sol, do4 r8 do
    do re mi do fa si, do fa
    re sol, si sol do re  mi do

    %32
    si [si'16 la si8 si,] la[la'16 sol la8 la,]
    sol[sol'16 fad sol8 sol,]  re' fad la re,\mbreak
    sol la si sol do,4. do8

    %35
    si4. la8 sol re' fad re
    sol re fad re sol re mi dod
    re4. fad8 sol4 r

    %38
    re4. fad8 sol sol, re'4
    sol4. sol,8 sol'4. sol,8
    sol' re si sol sol' re si sol

    %41
    re'4 r re' r8 re,
    re'4 r8 re, re' la fad re\mbreak
    re' la fad re sol4 r

    %44
    r2 fad4 fad
    re8 re si sol r2
    fad'4 fad re8 re si sol

    %47
    re'[re16 re re8 re] la'[do,16 do do8 do]
    si16[sol' fad mi re do si la] sol8[sol'16 sol sol8 sol]
    re'[fa,?16 fa fa8 fa] mi16 [fad sol la si do re mi]

    %50
    fad,8 sol re' re, sol la si fad
    sol8 la si fad sol la si si,
    do4 r8 sol re' mi fad re

    %53
    sol la si fad sol la si si,
    do4 r8 sol re' do? si la
    sold re' sold, re'\mbreak mi fad sold fad

    %56
    mi4 r la,8 dod la dod
    re mi fad mi re4 r
    sol,8 si sol si do re mi re\mbreak

    %59
    do4 r  fa8 sol la fa
    sib,4 r sol'8 la sib sol
    do,4 r do8 re mi do

    %62
    r2 \clef violin fa'8 mi re do
    \clef alto re do sib la sib la sol fa
    do' sol mi do r2

    %65
    mi4 mi do8 do' la fa
    r2 mi4 mi
    do8 do' la fa fa4 fa

    %68
    sib, sib do do
    do do do do
    do do do8[do16 do do8 do]\mbreak

    %71
    sol'[sib,16 sib sib8 sib] la16[sib do re mi fa sol la]
    mi8 fa do' do, fa4 r
    fa8 sol la fa mi4 do

    %74
    fa8 sol la re, la2
    re sol
    dod,\mbreak re

    %77
    dod re4 sib?
    la8 si?dod la re4 mi
    do re si do

    %80
    la sold\mbreak la8 do re mi
    do'4 do la8[la16 sol fa sol la fa]
    si4 si sol8[sol16 fa mi fa sol mi]

    %83
    la4 la fa8[fa16 mi re mi fa re]
    sold4 sold mi8[mi16 re do re mi do]
    sold'8 [si16 la sold la si sold] mi8[mi16 re do re mi do]

    %86
    fa8 re mi mi do la do sold\mbreak
    la si do la re sold, la fa'
    mi fad sold mi la do, re sol,?

    %89
    do re mi do fa? si, do la
    sol la si sol do re mi do
    mi4. mi8 fa sol la sol

    %92
    fad4. fad8 sol la si la
    sold4. sold8\mbreak la si do la
    fa?4. fad8 sol la si sol

    %95
    do, re mib do sol la si sol
    do re mib do sol  la si sol
    do re mib do fa sol fa re

    %98
    mi! fa sol si,\mbreak do do' sol sol,
    do re mi si do do' sol sol,
    do re mi si do do' sol sol,

    %101
    do re mi si do do' sol sol,
    do'4 r8 sol do4 r8 sol
    do sol mi do do' sol mi do
    sol'4 r8 sol, sol'4 r8 sol,

    %105
    sol' re si sol sol' re si sol
    do4 r8 \clef violin sol'' fa mi re do\clef alto
    si la sol do si la sol fa

    %108
    mi re do sol' fa mi re do
    sol'4 r r2
    si4 si sol8 sol mi do

    %111
    r2 si'4 si
    sol8 sol mi do sol'2\f
    fa8 do r4 la'2

    %114
    sol8 re r4 do'8 si la sol
    la sol fa mi fa  mi re do
    sol'4 r do,4 do\mbreak

    %117
    fa fa fad fad
    sol sol fa? fa
    mib mib mi mi

    %120
    fa fa fad fad
    sol8[sol16 sol sol8 sol] re'[fa,?16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak

    %123
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4 r
    R1*2

    %127
    sol'8[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]

    %130
    si,8 do sol' sol, do4\fermata r

}

Ibcn = \relative do {

    do'4 r8 sol do4 r8 sol
    do sol mi do do' sol mi do
    sol'4 r8 sol, sol'4 r8 sol,

    %4
    sol' re si sol sol' re si sol
    do4 r8 \clef tenor sol'' fa mi re do
    si la sol do si la sol fa

    %7
    \clef bass mi re do sol' fa mi re do
    sol'4 r r2\mbreak
    sol4 sol do8 sol  mi do

    %10
    r2 sol'4 sol
    do8 sol mi do sib'2
    la8 fa r4 do'2

    %13
    si?8 sol r4 do8 si la sol
    la sol fa mi fa  mi re do
    sol'4 r r2\mbreak

    %16
    R1*4
    r8 sol16[sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak

    %22
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4 r
    R1*2

    %26
    sol'8[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]

    %29
    si,8 do sol' sol, do4 r
    R1*9
    sol'4. sol,8 sol'4. sol,8

    %40
    sol' re si sol sol' re si sol
    re'4 r re' r8 re,
    re'4 r8 re, re' la fad re\mbreak
    re' la fad re sol4 r

    %44
    r2 re4 re
    sol8 re si sol r2
    re'4 re sol8 re si sol

    %47
    re'[re16 re re8 re] la'[do,16 do do8 do]
    si16[sol' fad mi re do si la] sol8[sol'16 sol sol8 sol]
    re'[fa,?16 fa fa8 fa] mi16 [fad sol la si do re mi]

    %50
    fad,8 sol re' re, sol,4 r
    R1*11
    r2 fa''8 mi re do

    %63
    re do sib la sib la sol fa
    do' sol mi do r2
    do'4 do fa8 do la fa

    %66
    r2 do'4 do
    fa8 do la fa r2
    R1*2

    %70
    r2 r8 do16[do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[sib do re mi fa sol la]
    mi8 fa do' do, fa4 r

    %73
    R1*8
    la4 la re,8[fa16 mi re mi fa re]
    sol4 sol do,8[mi16 re do re mi do]

    %83
    fa4 fa si,8[re16 do si do re si]
    mi4 mi la,8[do16 si la si do la]
    mi'8[sold16 fad mi fad sold mi] la8[do16 si la si do la]

    %86
    re,8 si mi mi, la4 r\mbreak
    R1*15
    do'4 r8 sol do4 r8 sol

    %103
    do sol mi do do' sol mi do
    sol'4 r8 sol, sol'4 r8 sol,
    sol' re si sol sol' re si sol

    %106
    do4 r8 \clef tenor sol'' fa mi re do
    si la sol do si la sol fa
    \clef bass mi re do sol' fa mi re do

    %109
    sol'4 r r2\mbreak
    sol4 sol do8 sol  mi do
    r2 sol'4 sol

    %112
    do8 sol mi do sib'2
    la8 fa r4 do'2
    si?8 sol r4 do8 si la sol

    %115
    la sol fa mi fa  mi re do
    sol'4 r r2\mbreak
    R1*4

    %121
    r8 sol16[sol sol8 sol] re'[fa,16 fa fa8 fa]
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]

    %124
    si,8 do sol' sol, do4 r
    R1*2
    sol'8[sol16 sol sol8 sol] re'[fa,16 fa fa8 fa]

    %128
    mi16[do' si la sol fa mi re] do8[do16 do do8 do]\mbreak
    sol'[sib,16 sib sib8 sib] la16[si? do re mi fa sol la]
    si,8 do sol' sol, do4\fermata r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 4/4
    \tempo 2 = 57
    s1*23
    \tempo 4 = 45
    s1*2
    \tempo 2 = 57
    s1*99
    \tempo 4 = 45
    s1*2
    \tempo 2 = 57
    s1*4
    \bar"|."


}

Ifl = {
    \Iglobal
    \notypeset
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
    \terzine
}

IIfln = \relative do'' {

    R1
    r2 mi16[(re) do(si) la(sold) fad(mi)]
    dod'8 dod dod dod do do do do

    %4
    si si si si sib'16[(la) sol(fa) mi(re) do(sib)]
    la8 la la' la sol sol sol sol
    fa do fa4~fa16 la sol fa sol sib? la sol\mbreak

    %7
    la sol fa mi fa4~fa16 la (sol fa) sol(sib la sol)
    la(sol fa mi) fa8 do fa16(do)re(la) sib?4\tr
    la r8 fa re'8 re re re

    %10
    \tuplet 3/2 { sol16(fa mi) fa([(mi re)] } do8 do fa[mi16(re) do(si?) do(re)]
    mi8 sol, do4~do16 sol' mi do re4\tr
    do8 mi dod4~dod16 mi re dod mi sol fa mi\mbreak

    %13
    fa8 dod re4~re16 fa mi re mi sol fa mi
    fa8 dod re4~re16 fa mi re sold, re' do? si
    do8 la la'4~\tuplet 3/2 { la16 fa mi re[mi fa] } sol4~

    %16
    \tuplet 3/2 { sol16 mi re do[(re mi)] } \once\tieDashed fa4~ \tuplet 3/2 { fa16(re do) si[(do re)] } mi4~
    \tuplet 3/2 { mi16(do si) la[(si do)] re si la sold[la si] } do8 sold la4~
    la16 mi' la do, si re do si\mbreak do8 sold la4~

    %19
    la16 mi' la do, si(re do si) do(mi do la) <<{si4}

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"violin"
            \key la\minor  <<si^\markup\italic"manoscritto"\\sold>>}>>

    la8 mi fa4~fa16 si do re fad, si do re
    sold, mi sold si re8 si do mi16 la si,4\tr

    %22
    la8 la' la la sold sold sold sold
    la16[(sol?) fa?(mi) re(do) si(la)] sold'8 sold sold sold
    la la la sold la2\fermata

}

IIvlIn =  \relative do'' {

    R1
    r2 mi16[(re) do(si) la(sold) fad(mi)]
    dod'8 dod dod dod do do do do

    %4
    si si si si sib'16[(la) sol(fa) mi(re) do(sib)]
    la8 la la' la sol sol sol sol
    fa4 r r2\mbreak

    %7
    R1*15
    la8 la la la sold sold sold sold
    la16[(sol?) fa?(mi) re(do) si(la)] sold'8 sold sold sold

    %24
    la la la sold la2\fermata

}

IIvlIIn = \relative do'' {

    R1
    la16[(sol) fa(mi) re(do) si(la)] si'8 si si si
    la la la la fad fad fad fad

    %4
    fa'!16[(mi) re(do) si(la) sol(fa)] sol8 sol sol sol
    fa fa fa' fa fa fa mi mi
    fa4 r r2

    %7
    R1*15
    mi8 mi mi mi mi16[(re) do(si) la(sold) fad(mi)]
    do'8 do do do si si si si

    %24
    do do si si la2\fermata

}

IIvlan =  \relative do' {

    r2 mi16[(re) do(si) la(sol) fa(mi)]
    mi8 mi mi mi mi' mi mi mi
    mi mi mi mi re'16[(do) sib(la) sol(fad) mi(re)]

    %4
    re8 re re re mi mi mi mi
    do do do do re re do do
    la4 r r2

    %7
    R1*15
    do'8 do do do si si si \parenthesize si
    mi, mi mi mi mi'16[(re) do(si) la(sold) fad(mi)]

    %24
    mi8 mi mi mi do2\fermata

}

IIbcn = \relative do {

    la'16[(sol) fa(mi) re(do) si(la)] mi'8 mi mi mi
    la, la la la sold sold sold sold
    la'16[(sol?) fa(mi) re(dod) si(la)] re8 re re re

    %4
    sol, sol sol sol do? do do do
    fa16[mi re do sib la sol fa] sib8 sib' do do,
    fa,4 r8 fa' sib? sol mi do\mbreak

    %7
    fa sol la fa sib? fa mi do
    fa sol la fa la fa sol mi
    fa sol la sol fa4. fa8

    %10
    mi4. mi8 re4 sol,
    do8 re mi do fa do sol' sol,
    do4 r8 la' sol mi dod la\mbreak

    %13
    re mi fa re sib' re, dod la
    re mi fa re sold4 mi
    la8 si? do la si4 mi,8 sol?

    %16
    la4 re,8 fa sol4 do,8 mi
    fa4 si,8 mi la, mi' fa re
    do fa re mi\mbreak la, mi' fa re

    %19
    do fa re mi la, la' mi mi,
    la la' fa mi re4 re
    mi4. sold8 la la, mi' mi,

    %22
    la'16[(sol?) fa(mi) re(do) si(la)] mi'8 mi mi mi
    la, la la la mi' mi mi mi
    la, la mi' mi, la2\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key la\minor
    \time 4/4
    \tempo 4 = 50
    s1*24
    \bar"|."

}

IIfl = {
    \IIglobal
    \notypeset
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

IIIfln = \relative do'' {

    do4. sol'8
    do,4. sol'8
    do,4. sol'8

    %4
    si, sol sol'16 fa mi re
    do4. sol'8
    do,4. sol'8

    %7
    do,4. sol'8
    si, sol r4
    sol'8[sol sol sol]

    %10
    sol[fa16 mi re do si la]
    fa'8[fa fa fa]
    \parenthesize fa[mi16 re do si la sol]

    %13
    mi'8[mi mi mi]
    mi[re16 do si la sol fa]
    re'8[re re re]

    %16
    re[do16 si la sol fa mi]
    mi'(re do8) mi16(fa sol8)
    mi16(re do8) mi16(fa sol8)

    %19
    mi16(re do8) mi16(fa sol8)
    mi16(re do8) mi16(fa sol8)
    mi8 [do re si]

    %22
    do16 mi sol mi do mi sol do,
    si re sol re\mbreak si re sol si,
    do mi sol mi do mi sol do,

    %25
    si8 sol r4
    do16 mi sol mi do mi sol do,
    si re sol re si re sol si,

    %28
    do mi sol mi do mi sol do,
    si8 sol r4
    do16 mi sol mi do mi sol mi

    %31
    fa, la do la fa la do la\mbreak %5 fine p. 9
    re fa la fa re fa la fa
    sol, si re si sol si re si

    %34
    mi sol si sol mi sol si sol
    la, do mi do la do mi do
    si re sol8~sol16 si la sol

    %37
    fad sol la8~la16 do, si la
    si re sol8~sol16 si la sol
    fad sol la8~la16 do, si la

    %40
    si8[sol' re, fad']
    sol,4. re'8
    sol,4. re'8

    %43
    sol,4. re'8\mbreak
    fad, re re'16 do si la
    sol4. re'8

    %46
    sol,4. re'8
    sol,4. re'8
    fad, re re'16 do si la

    %49
    si(la sol8) si16(do re8)
    si16(la sol8) si16(do re8)
    si16(la sol8) si16(do re8)

    %52
    si16(la sol8) si16(do re8)
    si8[sol' la fad?]
    sol32(la si8.) si,32(do re8.)\mbreak

    %55
    do32(re mi8.) la,32(si do8.)
    si8[la16 sol si8 dod]
    re2

    %58
    sol32(la si8.) si,32(do re8.)
    do32(re mi8.) la,32(si do8.)
    si8[la16 sol si8 dod]

    %61
    re2
    fa?32(mi re8.) do32(si la8.)
    \once\slurDashed sold32 (fad mi8.)~mi4

    %64
    mi'32(re do8.) si32(la sol?8.)\mbreak
    fa32(mi re8.)~re4
    la''32(sol fa8.) mi32(re do8.)

    %67
    si8 mi, r mi'
    mi16 do la do la do la do
    fa re la re la re la re

    %70
    mi do la do la do la do
    fa re la re la re la re
    mi8 la, r mi'

    %73
    si'32(la sold8.) re32(do si8.)\mbreak
    do8[(la do mi)]
    si'32(la sold8.) re32(do si8.)\mbreak

    %76
    do8[la do mi]
    la[sol?16 fa mi8 re]
    do32 si la8. si32 la sold8.

    %79
    la8[do' do do]
    do[si16 la sol fa mi re]
    si'8[si si si]

    %82
    si[la16 sol fa mi re do]
    la'8[la la la]
    la[sol16 fa mi re do si]\mbreak

    %85
    sold'8[sold sold sold]
    la[la la sold]
    la16 la, do la la' la, do la

    %88
    la' la, do la  la' la, do la
    si' mi, sold mi si' mi, sold mi
    si' mi, sold mi si' mi, sold mi

    %91
    do' mi, la mi do' mi, la mi
    do' mi, la mi do' mi, la mi
    re' mi, si' mi, re' mi, si' mi,

    %94
    re' mi, si' mi, re' mi, si' mi,
    do'8 la r mi\mbreak
    dod16(mi sib'4 dod,8)

    %97
    re16(fa la4 do,?8)
    si16(re sol4 si,8)
    do16(mi sol4 sib,8)

    %100
    la16(do fa4 la,8)
    sold16(si mi4 si8)
    do[si16(do) re(do) si(la)]

    %103
    re16(fa la4 dod,8)
    re[mi16(fa) sol(fa) mi(re)]
    dod16(mi la4 dod,8)\mbreak

    %106
    re[mi16(fa) sol(fa) mi(re)]
    sol,(dod mi4 sol8)
    fa[la16(sol) fa(re) mi(dod)]

    %109
    re4. la'8
    re,4. la'8
    re,4. la'8

    %112
    dod, la la'16 sol fa mi
    re4. la'8
    re,4. la'8\mbreak

    %115
    re,4. la'8
    dod, la la'16 (sol fa mi)
    fa16(mi re8) fa16(sol la8)

    %118
    fa16(mi re8) fa16(sol la8)
    fa16(mi re8) fa16(sol la8)
    fa16(mi re8) fa16(sol la8)

    %121
    fa8[re mi dod]
    re16(la sib la) sol'4
    fa16(la, sib la) fa'4\mbreak

    %124
    mi16(la, sib la) mi'4
    re16(la sib la) re4
    dod8 la r mi'

    %127
    fa(la16. sol32) fa8(la16. sol32)
    fa16[sol la sol fa mi re do]
    sib8 re16. do32 sib8 re16. do32

    %130
    sib16[do re mi fa sol la sib]
    mi,8 sol16. fa32  mi8 sol16. fa32\mbreak
    mi16[fa sol fa mi re do sib]

    %133
    la8 do16. sib32 la8 do16. sib32
    la16[sib do re mi fa sol la]
    re,8 fa16. mib32 re8 fa16. mib32

    %136
    re16[mib fa mib re do sib la]
    sol8 sib16. la32 sol8 sib16. la32
    sol16[la sib do re mi fa sol]

    %139
    la, la' sol fa  la, la' sol fa
    sib, la' sol fa\mbreak do sol' fa mi
    fa4. do'8

    %142
    fa,4. do'8
    fa,4. do'8
    mi, do4 sol'8

    %145
    do,4. sol'8
    do,4. sol'8
    do,4. sol'8

    %148
    si,?4. sol'8
    si,4. sol'8
    si,4. sol'8

    %151
    si,4. sol'8
    mi16 fa sol fa sol mi re do\mbreak
    mi fa sol fa sol mi re do

    %154
    mi fa sol fa sol re do sib
    mi fa sol fa sol sib, la sol
    la do sib  do fa do sib do

    %157
    fad sol la sol la fad mi re
    fad sol la sol la fad mi re
    fad sol la sol la mib re do\mbreak

    %160
    fad sol la sol la do, si? la
    si re do re sol re do re
    sold la si la si sold fad mi

    %163
    sold la si la si sold fad mi
    sold? la si sold si fa? mi re
    sold? la si la si fa mi re

    %166
    do mi re mi la mi re mi
    fa sol? la sol la fa mi re\mbreak
    fa sol la sol la re, do si

    %169
    mi fa sol fa sol mi re do
    re mi fa mi fa re do si
    mi fa sol fa sol mi re do

    %172
    re mi fa mi fa re do si
    do re mi fa sol8 fa
    mi re16 do re8 do16 si

    %175
    do8[sol' sol sol]\mbreak
    sol[fa16 mi re do si la]
    fa'8[fa fa fa]

    %178
    fa[mi16 re do si la sol]
    mi'8[mi mi mi]
    mi[re16 do si la sol fa]

    %181
    re'8[re re re]
    re8[do16 si la sol fa mi]
    mi'8(re16 do) mi16(fa sol8)

    %184
    mi(re16 do) mi16(fa sol8)
    mi(re16 do) mi16(fa sol8)
    mi(re16 do) mi16(fa sol8)

    %187
    mi[do re si]
    do4 r
    mi8\p(re16 do) mi16(fa sol8)

    %190
    mi(re16 do) mi16(fa sol8)
    mi(re16 do) mi16(fa sol8)
    mi(re16 do) mi16(fa sol8)

    %193
    mi[do re si]
    do2\fermata

}

IIIvlIn =  \relative do'' {

    do4. sol'8
    do,4. sol'8
    do,4. sol'8

    %4
    si, sol sol'16 fa mi re
    do4. sol'8
    do,4. sol'8

    %7
    do,4. sol'8
    si, sol r4
    sol'8[sol sol sol]

    %10
    sol[fa16 mi re do si la]
    fa'8[fa fa fa]
    \parenthesize fa[mi16 re do si la sol]

    %13
    mi'8[mi mi mi]
    mi[re16 do si la sol fa]
    re'8[re re re]

    %16
    re[do16 si la sol fa mi]
    mi'(re do8) mi16(fa sol8)
    mi16(re do8) mi16(fa sol8)

    %19
    mi16(re do8) mi16(fa sol8)
    mi16(re do8) mi16(fa sol8)
    mi8 [do re si]

    %22
    do4 r
    R2*18
    sol4. re'8
    sol,4. re'8

    %43
    sol,4. re'8\mbreak
    fad, re re'16 do si la
    sol4. re'8

    %46
    sol,4. re'8
    sol,4. re'8
    fad, re re'16 do si la

    %49
    si(la sol8) si16(do re8)
    si16(la sol8) si16(do re8)
    si16(la sol8) si16(do re8)

    %52
    si16(la sol8) si16(do re8)
    si8[sol' la fad?]
    sol4 r

    %55
    R2*24
    do8[do do do]
    do[si16 la sol fa mi re]
    si'8[si si si]

    %82
    si[la16 sol fa mi re do]
    la'8[la la la]
    la[sol16 fa mi re do si]\mbreak

    %85
    sold'8[sold sold sold]
    la4 r
    R2*22

    %109
    re,4. la'8
    re,4. la'8
    re,4. la'8

    %112
    dod, la la'16 sol fa mi
    re4. la'8
    re,4. la'8\mbreak

    %115
    re,4. la'8
    dod, la la'16 (sol fa mi)
    fa16(mi re8) fa16(sol la8)

    %118
    fa16(mi re8) fa16(sol la8)
    fa16(mi re8) fa16(sol la8)
    fa16(mi re8) fa16(sol la8)

    %121
    fa8[re mi dod]
    re4 r
    R2*18

    %141
    fa4. do'8
    fa,4. do'8
    fa,4. do'8
    mi, do4 sol'8

    %145
    do,4. sol'8
    do,4. sol'8
    do,4. sol'8

    %148
    si,?4. sol'8
    si,4. sol'8
    si,4. sol'8

    %151
    si,4. sol'8
    mi do r4
    R2*22

    %175
    sol'8[sol sol sol]\mbreak
    sol[fa16 mi re do si la]
    fa'8[fa fa fa]

    %178
    fa[mi16 re do si la sol]
    mi'8[mi mi mi]
    mi[re16 do si la sol fa]

    %181
    re'8[re re re]
    re8[do16 si la sol fa mi]
    mi'8(re16 do) mi16(fa sol8)

    %184
    mi(re16 do) mi16(fa sol8)
    mi(re16 do) mi16(fa sol8)
    mi(re16 do) mi16(fa sol8)

    %187
    mi[do re si]
    do4 r
    mi8\p(re16 do) mi16(fa sol8)

    %190
    mi(re16 do) mi16(fa sol8)
    mi(re16 do) mi16(fa sol8)
    mi(re16 do) mi16(fa sol8)

    %193
    mi[do re si]
    do2\fermata

}

IIIvlIIn = \relative do'' {

    r8 sol' do,4~
    do8 sol' do,4~
    do8 sol' do,4

    %4
    re8 si r4
    r8 sol' do,4~
    do8 sol' do,4~

    %7
    do8 sol' do,4
    re8 si r4
    mi8[mi mi mi]

    %10
    mi[re16 do si la sol fa]
    re'8[re re re]
    re8[do16 si la sol fa mi]\mbreak

    %13
    do'8[do do do]
    do[si16 la sol fa mi re]
    si'8[si si si]

    %16
    si[la16 sol fa mi re do]
    sol'16(fa mi8) do'16(re mi8)
    sol,16(fa mi8) do'16(re mi8)

    %19
    sol,16(fa mi8) do'16(re mi8)
    sol,16(fa mi8) do'16(re mi8)
    sol,8[mi' fa re]

    %22
    mi4 r
    R2*18
    r8 re sol,4~

    %42
    sol8 re' sol,4~
    sol8 re' sol,4\mbreak
    la8 fad r4

    %45
    r8 re' sol,4~
    sol8 re' sol,4~
    sol8 re' sol,4\mbreak

    %48
    la8 fad r4
    re16(do si8) sol'16(la si8)
    re,16(do si8) sol'16(la si8)

    %51
    re,16(do si8) sol'16(la si8)
    re,16(do si8) sol'16(la si8)
    sol8[si do la]

    %54
    sol4 r\mbreak
    R2*24
    la'8[la la la]

    %80
    la[sol16 fa  mi re do si]
    sol'8[sol sol sol]
    sol[fa16 mi re do si la]

    %83
    fa'8[fa fa fa]
    fa[mi16 re do si la sold]\mbreak
    si8[si si si]

    %86
    do[do si si]
    la4 r
    R2*21

    %109
    r8 la' re,4~
    re8 la' re,4~
    re8 la' re,4

    %112
    mi8 dod r4
    r8 la' re,4~
    re8 la' re,4~

    %115
    re8 la' re,4
    mi8 dod r la
    la16(sol fa8) re'16(mi fa8)

    %118
    la,16(sol fa8) re'16(mi fa8)
    la,16(sol fa8) re'16(mi fa8)
    la,16(sol fa8) re'16(mi fa8)

    %121
    re8[fa sol mi]
    re4 r
    R2*18

    %141
    r8 do' fa,4~
    fa8 do' fa,4~
    fa8 do' fa,4(

    %144
    sol8) sol do,4~
    do8 sol' do,4~
    do8 sol' do,4~

    %147
    do8 sol' do,4
    re8 sol si,4~
    si8 sol' si,4~

    %150
    si8 sol' si,4~
    si8 sol' si,4
    do r\mbreak

    %153
    R2*22
    mi8[mi mi mi]\mbreak
    mi[re16 do si la sol fa]

    %177
    re'8[re re re]
    re[do16 si la sol fa mi]
    do'8[do do do]

    %180
    do[si16 la sol fa mi re]
    si'8[si si si]
    si[la16 sol fa mi re do]

    %183
    sol'16(fa mi8) do'16(re mi8)
    sol,16(fa mi8) do'16(re mi8)
    sol,16(fa mi8) do'16(re mi8)

    %186
    sol,16(fa mi8) do'16(re mi8)
    do8[mi fa re]
    do4 r

    %189
    sol16\p(fa mi8) do'16(re mi8)
    sol,16(fa mi8) do'16(re mi8)
    sol,16(fa mi8) do'16(re mi8)

    %192
    sol,16(fa mi8) do'16(re mi8)\mbreak
    do8[mi fa re]
    do2\fermata

}

IIIvlan =  \relative do' {

    mi8[fa sol fa]
    mi[fa sol fa]
    mi[fa sol mi]

    %4
    si[do re si]
    mi[fa sol fa]
    mi[fa sol fa]

    %7
    mi[fa sol mi]
    si[si do re]
    mi4 r

    %10
    do'8[do do do]
    fa,4 r
    si8[si si si]\mbreak

    %13
    mi,4 r
    la8[la la la]
    re,4 r

    %16
    sol8[sol sol sol]
    sol[do, do do]
    si[si si si]

    %19
    la[la la la]
    sol[sol sol' sol]
    sol[sol la sol]

    %22
    sol4 r\mbreak
    R2*18
    si,8[do re do]

    %42
    si[do re do]
    si[do re si]\mbreak
    fad'[sol la fad]

    %45
    si,[do re do]
    si[do re do]
    si[do re si]

    %48
    fad'[sol la fad]
    sol,[sol sol sol]
    fad[fad fad fad]

    %51
    mi[mi mi mi]
    re[re re re]
    re[re' mi re]

    %54
    si4 r\mbreak
    R2*25
    fa'8[fa fa fa]

    %81
    si,4 r
    mi8[mi mi mi]
    la,4 r

    %84
    re8[re re re]\mbreak
    mi[mi mi mi]
    mi[mi mi mi]

    %87
    do4 r
    R2*21
    fa8[sol la sol]

    %110
    fa[sol la sol]
    fa[sol la fa]
    dod[re mi dod]

    %113
    \parenthesize fa[sol la sol]
    fa[sol la sol]\mbreak
    fa[sol la fa]

    %116
    dod[re mi dod]
    re[re re re]
    do?[do do do]

    %119
    sib[sib sib sib]
    la[la la la]
    la[la' sib la]

    %122
    fa4 r
    R2*18
    la8[sib do sib]

    %142
    la[sib do sib]
    la[sib do la]
    mi[fa sol fa]

    %145
    mi[fa sol fa]
    mi[fa sol fa]
    mi[fa sol mi]

    %148
    si?[do re do]
    si[do re do]
    si[do re do]

    %151
    si[do re si]
    sol4 r\mbreak
    R2*23

    %176
    do'8[do do do]
    fa,4 r
    si8[si si si]

    %179
    mi,4 r
    la8[la la la]
    re,4 r

    %182
    sol8[sol sol sol]
    sol[do, do do]
    si[si si si]\mbreak

    %185
    la[la la la]
    sol[sol sol sol]
    sol[sol' la sol]

    %188
    mi4 r
    do8\p[do do do]
    si[si si si]

    %191
    la[la la la]
    sol[sol sol sol]\mbreak
    sol[sol' la sol]

    %194
    mi2\fermata

}

IIIbcn = \relative do {

    do8 [re mi re]
    do8 [re mi re]
    do8 [re mi do]

    %4
    sol'[la si sol]
    do8 [re mi re]
    do8 [re mi re]

    %7
    do8 [re mi do]
    sol[fa mi re]
    do4 r

    %10
    la'8[la la la]
    re,4 r
    sol8[sol sol sol]\mbreak

    %13
    do,4 r
    fa8[fa fa fa]
    si,4 r

    %16
    si8[si si si]
    do[do' do do]
    si[si si si]

    %19
    la[la la la]
    sol[sol sol sol]
    do [do, fa sol]

    %22
    do,[re mi do]
    sol [si\mbreak la sol]
    do[re mi do]

    %25
    sol[si la sol]
    do[re mi do]
    sol[si la sol]

    %28
    do[re mi do]
    sol[si la sol]
    do[re mi do]

    %31
    fa[sol la fa]\mbreak
    re[mi fa re]
    sol[la si sol]

    %34
    mi[fa sol mi]
    la[si do la]
    sol[la si do]

    %37
    re [re, fad re]
    sol[la si do]
    re [re, fad re]

    %40
    sol[sol, re' re,]
    sol[la si la]
    sol[la si la]

    %43
    sol[la si sol]
    re'[mi fad re]
    sol,[la si la]

    %46
    sol[la si la]
    sol[la si sol]
    re'[mi fad re]

    %49
    sol[sol sol sol]
    fad[fad fad fad]
    mi[mi mi mi]

    %52
    re[re re re]
    sol,[sol do re]
    sol,4 sol'

    %55
    la fad
    sol4. sol8
    fad[mi re do]

    %58
    si4 sol
    la' fad
    sol4. sol8

    %61
    re[do si la]
    sold4 la
    mi' re

    %64
    do r\mbreak
    re si
    la r

    %67
    mi'8 [fad sold mi]
    do4 r
    re r

    %70
    do r
    re r
    do8[si do la]

    %73
    sold4 sold\mbreak
    la8[si do la]
    sold4 sold

    %76
    la8[si do si]
    la4 sold
    la8[do re mi]

    %79
    la,4 r
    re'8[re re re]
    sol,4 r

    %82
    do8[do do do]
    fa,4 r
    si8 [si si si]\mbreak

    %85
    mi,[mi mi mi]
    la,[la' mi mi,]
    la2

    %88
    la'~
    la
    sold

    %91
    la
    la,~
    la

    %94
    sold
    la8[la' do si]\mbreak
    la4 sol

    %97
    fa fad
    sol fa?
    mi do

    %100
    fa re
    mi sold,
    la r

    %103
    fa'8[re dod la]
    re4 sib'
    la sol\mbreak

    %106
    fa sib
    dod, la
    re8[fa16 sol la8 la,]

    %109
    re[mi fa mi]
    re[mi fa mi]
    re[mi fa re]

    %112
    la[si dod la]
    re[mi fa mi]
    re [mi fa mi]\mbreak

    %115
    re[mi fa re]
    la[si dod la]
    re[re' re re]

    %118
    do[do do do]
    sib[sib sib sib]
    la[la la la]

    %121
    re,[re sol, la]
    re [fa mi la,]
    re4. re8\mbreak

    %124
    dod4 r8 do
    si4 r8 sib
    la[la' dod la]

    %127
    re[dod re dod]
    re4 r
    sol,8[fad sol fad]

    %130
    sol4 r
    la8[sol! la sol]\mbreak
    do4 r

    %133
    fa,8[mi fa mi]
    fa4 r
    sib8[la sib la]

    %136
    sib4 r
    mi,8[re mi re]
    mi4 r

    %139
    fa fa
    sib,\mbreak do
    fa8[sol la sol]

    %142
    fa[sol la sol]
    fa[sol la fa]
    do[re mi re]

    %145
    do[re mi re]
    do[re mi re]
    do[re mi do]

    %148
    sol[la si la]
    sol[la si la]
    sol[la si la]

    %151
    sol[la si sold]
    do4 r
    do r

    %154
    do r
    do r
    fa r

    %157
    re r
    re r
    re r\mbreak

    %160
    re r
    sol r
    mi r

    %163
    mi r
    mi r
    mi r

    %166
    la, r
    re r
    sol, r

    %169
    do r
    sol r
    do r

    %172
    sol r
    do si
    do8[mi fa sol]

    %175
    do,4 r\mbreak
    la'8[la la la]
    re,4 r

    %178
    sol8[sol sol sol]
    do,4 r
    fa8[fa fa fa]

    %181
    si,4 r
    si8[si si si]
    do[do' do do]

    %184
    si[si si si]\mbreak
    la[la la la]
    sol[sol sol sol]

    %187
    do,[do' fa, sol]
    do,4 r
    do'8\p[do do do]

    %190
    si[si si si]
    la[la la la]
    sol[sol sol sol]\mbreak

    %193
    do,[do' fa, sol]
    do,2\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/4
  \tempo 2 = 60
  s2*194
  \bar"|."


}

IIIfl = {
  \IIIglobal
  %\notypeset
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

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[Flauto""traversiere""o Oboe]"}
            \Ifl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.8
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
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
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.8
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

\pageBreak

\markup\huge "[2.] Andante"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"flute"
            \IIfl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.8
        } <<

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
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.8
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

\pageBreak

\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"flute"
            \IIIfl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.8
        } <<

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
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.8
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






