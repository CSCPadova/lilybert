\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

unis = _\markup\italic "Unisoni"

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzic."

soli = ^\markup \italic { Soli}

dolce = _\markup \italic { dolce }

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

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }



IvlIn = \relative do'' {

    la8 fa la do fa do
    la fa la do fa do
    la[la'16(sib do8) do sib sib]

    %4
    la[la16(sib do8) do sib sib]
    la[la,16 sib do8 do sib sib]
    la[la16 sib do8 do sib sib]

    %7
    la fa la do fa do
    sib sol sib mi sol mi
    sib sol sib mi sol mi

    %10
    sib[sol'16(la sib8) sib la la]
    sol[sol16(la sib8) sib la la]
    sol[sol,16(la sib8) sib la la]

    %13
    sol[sol16\parenthesize(la sib8) sib la la]
    sol do mi sol sib sol\mbreak
    la fa la, fa' sol, mi'

    %16
    fa4 r r
    R2.*4
    r8 la16[sib do8 sib sib la]

    %22
    la4 r r
    R2.*8
    r8 mi16[fa sol8 sol fa fa]

    %32
    mi8 [mi16 fa sol8 sol fa fa]
    mi[mi,16 fa sol8 sol fa fa]
    mi[mi16 fa sol8 sol fa fa]

    %35
    mi8 do mi sol do sol
    mi sol do mi, re si'\mbreak
    do[mi16 fa sol8 sol mi mi]

    %38
    do4 r r
    r8 mi16[fa sol8 sol mi mi]
    do4 r r

    %41
    r8 mi16[fa sol8 sol fa fa]
    mi[mi16 fa sol8 sol mi mi]
    fa4 r r

    %44
    r8 re16[mib fa8 fa fa fa]\mbreak
    re4 r r
    r8 mi?16[fa sol8 sol sib sib]

    %47
    sol[mi16 fa sol8 sol sib sib]
    sol4 r r
    r8 mi16[fa sol8 sol sib sib]

    %50
    sol4 r r
    r8 mi,16[fa sol8 sol sib sib]
    sol[mi16 fa sol8 sol sib sib]

    %53
    la4 r r
    R2.*11
    la8 fa la do fa do\mbreak

    %66
    la[la'16 sib do8 do sib sib]
    la[la,16 sib do8 do sib sib]
    la fa la do fa do

    %69
    sib sol sib mi sol mi
    sib[sol'16 la sib8 sib la la]
    sol[sol,16 la sib8 sib la la]

    %72
    sol do mi sol sib sol
    la fa la, fa' sol, mi'\mbreak
    fa4 r r

    %75
    R2.*6
    r8 fa16[sol la8 la sol sol]
    fa4 r r

    %83
    R2.*5
    r8 fa16[sol la8 la sol sol]
    fa [fa,16 sol la8 la sol sol]

    %90
    sol4 r r
    R2.*7

}

IvlIIn = \relative do'' {

    fa,8 do fa la do la
    fa do fa la do la
    fa[fa'16 \parenthesize (sol la8) la sol sol]

    %4
    fa [fa16 \parenthesize (sol la8) la sol sol]
    fa[fa,16 sol la8 la sol sol]
    fa [fa16 sol la8 la sol sol]

    %7
    fa do fa la do la
    sol mi sol do mi do
    sol mi sol do mi do

    %10
    sol[mi'16 \parenthesize (fa sol8) sol fa fa]
    mi[mi16 \parenthesize(fa sol8) sol fa fa]
    mi[mi,16 \parenthesize(fa sol8) sol fa fa]

    %13
    mi[mi16 fa sol8 sol fa fa]
    mi sol do mi sol mi\mbreak
    fa fa la, fa' sol, mi'

    %16
    fa4 r r
    R2.*4
    r8 fa16[sol la8 sol sol fa]

    %22
    fa4 r r
    R2.*8
    r8 do16[re mi8 mi re re]

    %32
    do8 [do16 re mi8 mi re re]
    do8 [do,16 re mi8 mi re re]
    do8 [do16 re mi8 mi re re]

    %35
    do sol do mi sol mi
    do sol' do mi, re si'\mbreak
    do8 [do16 re mi8 mi do do]

    %38
    sol4 r r
    r8 do16[re mi8 mi do do]
    sol4 r r

    %41
    r8 do16[re mi8 mi re re]
    do8 [do16 re mi8 mi do do]
    do4 r r

    %44
    r8 sib!16[do re8 re re re]\mbreak
    sib4 r r
    r8 do16[re mi8 mi sol sol]

    %47
    mi[do16 re mi8 mi sol sol]
    mi4 r r
    r8 do16[re mi8 mi sol sol]

    %50
    mi4 r r
    r8 do,16[re mi8 mi sol sol]
    mi[do16 re mi8 mi sol sol]

    %53
    fa4 r r
    R2.*11
    fa8 do fa la do la\mbreak

    %66
    fa[fa'16 sol la8 la sol sol]
    fa [fa,16 sol la8 la sol sol]
    fa do fa la do la

    %69
    sol mi sol do mi do
    sol[mi'16 fa sol8 sol fa fa]
    mi[mi,16 fa sol8 sol fa fa]

    %72
    mi sol do mi sol mi
    fa fa la, fa' sol, mi'\mbreak
    fa4 r r

    %75
    R2.*6
    r8 re16[mi fa8 fa mi mi]
    re4 r r

    %83
    R2.*5
    r8 re16[mi fa8 fa mi mi]
    re[re,16 mi fa8 fa mi mi]

    %90
    re4 r r
    R2.*7

}

Ivlan = \relative do' {

    do4 do do
    do do do
    do do mi

    %4
    do do mi
    do r r
    R2.

    %7
    do4 do do
    mi mi mi
    mi mi mi

    %10
    mi mi do
    do do do
    do r r

    %13
    R2.
    do4 do do\mbreak
    do do do

    %16
    la r r
    R2.*14
    sol'4 sol si

    %32
    sol sol si
    sol r r
    R2.

    %35
    sol,4 sol sol
    sol sol sol\mbreak
    sol r r

    %38
    do2.~
    do~
    do~

    %41
    do~
    do
    la4 r r

    %44
    R2.*2
    do2.~
    do~

    %48
    do~
    do~
    do~

    %51
    do~
    do
    fa,4 r r

    %54
    R2.*11
    do'4 do do\mbreak
    do do mi

    %67
    do r r
    do do do
    mi mi mi

    %70
    mi mi do
    do r r
    do do do

    %73
    do do do\mbreak
    la r r
    R2.*23

}

Ialton = \relative do' {

    \autoBeamOff
    R2.*15
    r4 fa do
    fa4. sol8 la sib

    %18
    do4 fa, do'8 sib
    la4 sol8 fa sol mi
    fa[fa16 sol la8 sol sol fa]

    %21
    fa4 r r
    r8 fa16[sol la8 sol sol fa]
    fa8[sol16 la sib8 la la sol]

    %24
    sol8[la16 sib do8 sib sib la]
    la8[si16 do re8 do do si]\mbreak
    si4 r8 fa[(mi re)]

    %27
    si'4 r8 fa[(mi re)]
    mi8[do16 re mi8 mi16 fa sol8 la16 si]
    do4. si16[la] sol4~

    %30
    sol8 fa mi4(re8) do
    do2 r4
    R2.*5\mbreak

    %37
    r4 mi sol
    do4. si16[la] sol8 fa
    mi8.[re16] do4 mi8 sol

    %40
    do4. si16 la sol8 fa
    mi8. re16 do4 r
    r r do

    %43
    fa4. la8 fa mib
    mib?8. re16 re4 r8 re\mbreak
    sol4. sib8 sol fa

    %46
    fa8. mi16 mi4 r
    r r sol
    mi re do

    %49
    sol'2.~
    sol8[do sol mi sol mi]
    do2 r4

    %52
    r r do
    fa sol la
    re,8[mi16 fa sol8 fa fa mi]\mbreak

    %55
    mi8[fa16 sol la8 sol sol fa]
    fa8[sol16 la sib8 la la sol]
    sol8[la16 sib do8 sib sib la]

    %58
    la8[sib16 la sol8 fa mi re]
    do4 mi sol
    sib r8 la16 [sol la8 fa]

    %61
    sol4 r8 fa16[mi fa8 re]
    do8[re16 mi fa8 fa16 sol la8 la16 sib]
    do8[mi,] fa4. sib8

    %64
    la4(sol4.) fa8
    fa2.\mbreak
    R2.*8\mbreak

    %74
    r4 la re,
    sib' la r
    sib sol8[fa] mi re

    %77
    dod4 re r
    r la' sol
    fa4. mi8 re4

    %80
    la'8[sol] fa[mi] re[dod]
    re2.~
    re8[mi16 fa sol8 fa fa mi]

    %83
    mi[fa16 sol la8 sol sol fa]\mbreak
    fa[sol16 la sib!8 la la sol]
    sol16 [sib la sol] la8[mi fa sol]

    %86
    fa8. sol16 la4 r8 sol
    fa4(mi4.) re8
    re2  r4

    %89
    R2.
    sib'4 la r
    sol fa r

    %92
    sib la2
    sold8[si16 la sold8 fa mi re]\mbreak
    do4. re8 mi[fa16 sold]

    %95
    la8[si16 do re8] si[do la]
    si[fad] sold4. la8
    la2.\fermata

}

Itesto = \lyricmode {

    Ves -- tro Prin -- cipi _ di -- vi -- no
    por -- tas au -- reas _ coe -- li_ex -- tol - - - - - - - -  - - - li -- te
    ex --  tol -- li -- te.

    Ves -- tro Prin -- cipi _ di -- vi -- no
    por -- tas au -- reas _ coe -- li_ex -- tol -- lite, _
    di -- vi -- no ves -- tro Prin -- cipi _ di -- vi -- no
    ves -- tro Prin -- cipi _ ex --  tol -- li -- te por -- tas
    ex --  tol -- li -- te por - - - - - - - - - - - - -  tas ex --  tol -- li -- te.

    Re -- sur -- gen -- ti et u -- no et tri -- no
    vo -- ces la -- udis _  as -- tra ex -- tol - - - - - lite _ ex --  tol -- li -- te,
    u -- no  tri -- no a -- stra_ex -- tol - li -- te - ex - tol -- li -- te.

}

Ibcn = \relative do {

    fa4 fa fa
    fa fa fa
    fa fa do

    %4
    fa fa do
    fa, r r
    R2.

    %7
    fa'4 fa fa
    do do do
    do do do

    %10
    do do fa,
    do' do fa,
    do' r r

    %13
    R2.
    do4 do do\mbreak
    fa do do

    %16
    fa, r r
    fa'4. mi8 fa sol
    la2 la8 sol

    %19
    fa2 do4
    fa r r
    R2.

    %22
    fa4 r r
    fa r r
    mi r r

    %25
    fa r r\mbreak
    sol, r r
    sol r r

    %28
    do r r
    do r r
    do sol' sol,

    %31
    do do sol
    do do sol
    do r r

    %34
    R2.
    do4 do do
    do do sol\mbreak

    %37
    do r r
    R2.*5
    fa4 fa la

    %44
    sib r r\mbreak
    sib sib si
    do r r

    %47
    R2.*6
    fa,4 r r
    sib, si2\mbreak

    %55
    do4 r r
    re r r
    mi r r

    %58
    fa r r
    mi r r
    do r r

    %61
    do r r
    do r r
    do re mi

    %64
    fa sib, do
    fa fa fa\mbreak
    fa fa do

    %67
    fa r r
    fa fa fa
    do do do

    %70
    do r r
    do r r
    do do do

    %73
    fa do' do,\mbreak
    fa r fa
    sol fa r

    %76
    sol2.
    la4 re, r
    r dod la

    %79
    re2.
    R2.*2
    re4 r r

    %83
    dod r r\mbreak
    re sol2
    dod,2.

    %86
    re4 r mi
    re la' la,
    re r r

    %89
    R2.
    sol4 fa r
    sib! la r

    %92
    re,2.
    mi\mbreak
    la,4 r r

    %95
    la r r
    re mi mi,
    la2.\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 65
    s2.*97
    \bar "|."
    \mark\markup"D.C."

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}

Ialto = {
    \new Voice = "vestro"
    <<\Ialton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}





IIalton = \relative do' {

    \autoBeamOff
    r8  la' fa la re, re r re
    fa fa fa mi mi4 mi
    r8 sol sol fa fa16 fa fa8 r re\mbreak
    sold sold r si sold sold sold la
    mi mi r4 r sol8 sol16 do
    mi,4 fa8 sol do,4 sib'!8 sib16 la
    la4 la\mbreak fa8 fa fa fa16 fa
    si4. do8 fa,4 fa8 mi
    do4 do r2\fermata

}

IItesto = \lyricmode {

    O fe -- lix cul -- pa, o cul -- pa for -- tu -- na -- ta
    quae ta -- lem me -- ruit _ ac tan -- tum
    ha -- bere _ Re -- demp -- torem. _
    Mun -- do est or -- ta per te sa -- lus, et qui -- es,
    et re -- fulsit _ per te sic fa -- usta _  di -- es.

}

IIbcn = \relative do {

    re1~
    re~
    re~
    re
    mi4 la, do2~
    do1
    fa~
    fa
    sol2 do,\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4 = 60
    s1*9
    \bar "|."

}

IIalto = {
    \new Voice = "felix"
    <<\IIalton \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}





IIIvlIn = \relative do'' {

    la'8
    fa[mi16 fa sol8 mi]
    fa4 r8 la,
    fa[mi16 fa sol8 mi]

    %4
    fa4 r8 do''
    mi, [fa sol la]
    sol4 r8 do,

    %7
    mi,[fa sol la]
    sol4 r8 do
    la'[la la la]

    %10
    sol[la16 si do8 do,]
    re4 si
    do r8 la\mbreak

    %13
    fa[mi16 fa sol8 mi]
    fa4 r8 do'
    mi, [fa sol la]

    %16
    sol4 r8 do,
    sol'[sol sol la]
    sol4 r8 sol

    %19
    do(mi,4) fa8
    do'(mi,4) fa8
    sib4 la

    %22
    sol r8 do,\mbreak
    sib'[sib la sol]
    fad4 la

    %25
    re, r8 sib'
    la[sol la fad]
    sol4. sol8

    %28
    do[mi, mi fa]
    sol4 r8 sol
    do[mi, mi fa]\mbreak

    %31
    sol4 r
    sib!8[sib16 sib sib8 la]
    sol2

    %34
    sol8[sol16 sol sol8 fa]
    mib2
    mib?8[mib16 mib mib8 re]

    %37
    dod4. sib'8
    la[dod re sib]\mbreak
    la[dod re sol,]

    %40
    fa4 mi
    re4. fa8
    do'(mi,4) fa8

    %43
    do'(mi,4) fa8
    sib[sib sib la]
    la sol r do,

    %46
    sol'[sol lab lab]
    lab? sol4 do,8\mbreak
    sol'[sol lab lab]

    %49
    lab? sol4 do8
    lab sol4 do8
    lab sol4 fa8

    %52
    si[si si si]
    do4 sib!
    la8.[sol16 fa sol la sib]

    %55
    do8 fa, r4\mbreak
    la4 sol
    fa r8 sol

    %58
    la16 sol fa mi fa sol la sib
    do8 re16 mi fa4
    la, sol

    %61
    fa4. do''8
    mi, [fa sol la]
    sol4 r8 do,

    %64
    mi,[fa sol la]
    sol4 r8 do
    sib'[sib sib sib]\mbreak

    %67
    la[sol16 fa sol8 mi]
    fa2\fermata

}

IIIvlan = \relative do' {

    fa8
    la[sol16 la sib8 sol]
    la4 r
    la,8[sol16 la sib8 sol]

    %4
    la4 r
    sol'8[la sib do]
    mi,4 r

    %7
    sol,8[la sib do]
    mi,4 r8 mi'
    do4. do8

    %10
    mi[re sol mi]
    si4 re
    mi r\mbreak

    %13
    fa, do'
    fa, r
    do'8[sib la sol16 fa]

    %16
    do'4 r
    mi8[mi mi fa]
    do4 r

    %19
    r8 do[sib la]
    r do[sib la]
    sol'4 fa

    %22
    do r8 do\mbreak
    sol4 sol
    do do

    %25
    do r8 sol'
    re sol, re' re
    sol,4. r8

    %28
    r8 do[sib la]
    mi'[re mi do]
    r8 do[sib la]\mbreak

    %31
    mi'[re mi do]
    sol2~
    sol~

    %34
    sol~
    sol~
    sol

    %37
    la4. sol'8
    fa[mi re sol]\mbreak
    fa[mi re dod]

    %40
    re4 la
    re4. r8
    r8 do[sib la]

    %43
    r8 do[sib la]
    sol'[sol sol fa]
    do[do sib la]

    %46
    mi'[mi fa fa]
    do[do sib la]\mbreak
    mi'[mi fa fa]

    %49
    do4. mi8
    fa mi4 mi8
    fa mi4 re8

    %52
    sol4 fa
    mi do
    fa r

    %55
    fa r\mbreak
    fa do
    fa r8 mi

    %58
    fa4 r
    fa r
    fa do

    %61
    fa4. fa8
    sol[la sib do]
    mi,4 r

    %64
    sol,8[la sib do]
    mi,4 r8 mi'
    mi[fa sol mi]\mbreak

    %67
    do[do re sol,]
    la2\fermata

}

IIIalton = \relative do' {

    \autoBeamOff
    r8
    R2*11
    r4 r8 la'
    fa mi16[fa] sol8 mi

    %14
    fa4 r8 do'
    mi, fa sol la
    sol4 r8 do,

    %17
    sol' sol sol la
    sol4 r8 sol
    do(mi,4) fa8

    %20
    do'(mi,4) fa8
    sib4 la
    sol r8 do,\mbreak

    %23
    sib' sib la sol
    fad4 la
    re, r8 sib'

    %26
    la sol la fad
    sol4. sol8
    do mi, mi fa

    %29
    sol4 r8 sol
    do mi, mi fa\mbreak
    sol4 r

    %32
    sib!8 sib16 sib sib8 la
    sol2
    sol8 sol16 sol sol8 fa

    %35
    mib2
    mib?8 mib16 mib mib8 re
    dod4. sib'8

    %38
    la[dod]re sib\mbreak
    la[dod] re[sol,]
    fa4 mi

    %41
    re4. fa8
    do'(mi,4) fa8
    do'(mi,4) fa8

    %44
    sib sib sib la
    la sol r do,
    sol' sol lab lab16 lab

    %47
    lab?8 sol4 do,8\mbreak
    sol' sol lab lab
    lab? sol4 do8

    %50
    lab sol8~sol do
    lab sol4 fa8
    si si si si

    %53
    do4 sib!
    la8.[sol16 fa sol la sib]
    do8 fa, r4\mbreak

    %56
    la4 sol
    fa r8 sol
    la16 [sol fa mi] fa [sol la sib]

    %59
    do8 [re16 mi] fa4
    la, sol
    fa4. r8

    %62
    R2*7

}

IIItesto = \lyricmode {

    Quid lo -- que -- ris ad cor
    o no -- vum cor in me?
    Si gau -- des in -- tra te
    de be -- ne be -- ne ges -- sta re
    o -- tiosa _ non sit spes non non o -- tiosa _ non sit spes,

    sed cur -- rat cor, et pes,  sed cur -- rat cor, et pes,
    u -- bi se -- rena _ fax
    u -- bi tran -- quilla _ lux
    u -- bi se -- cura _ pax
    re -- gna -- re re -- gna -- re fa -- cit nos.

    Do -- lo -- res, poenae
    su -- aves _  et a -- moenae _
    de -- liciae _ Fi -- lii _ De -- i
    lae -- titiae _ cor -- dis me -- i
    su -- aves _ a -- moenae _
    lae -- titiae _ cor -- dis mei
    non a - mo, lau -- do vos, non a - - mo, lau -- do vos.

}

IIIbcn = \relative do {

    r8
    fa4 do
    fa r
    fa do

    %4
    fa r
    do'8[sib16 la sol8 fa]
    do4 r

    %7
    do8[sib16 la sol8 fa]
    do'[re mi do]
    fa[sol la fa]

    %10
    do[sol' mi do]
    sol'4 sol,
    do r\mbreak

    %13
    R2*14
    r4. r8
    R2*13

    %41
    r4. r8
    R2*19
    r4. fa8

    %62
    do'8[sib16 la sol8 fa]
    do[re mi do]
    do8[sib16 la sol8 fa]

    %65
    do'[re mi do]
    do[re mi do]\mbreak
    fa[la, sib do]

    %68
    fa,2\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    \key fa\major
    \tempo 2 = 65
    \partial 8 s8
    s2*26
    s4. \bar ":..:" \break s8
    s2*13
    s4. \bar ":..:" s8
    s2*19
    s4. \bar ":|."\break  s8
    s2*7
    \bar "|."

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}

IIIalto = {
    \new Voice = "quid"
    <<\IIIalton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}





IVvlIn = \relative do'' {

    R4.*11
    la16 sib do8 sib
    la16 sib do8 sib

    %14
    la16 sib do8 sib
    la fa16 sol la sib
    do8 do, do

    %17
    fa fa16 sol la sib
    do8 la fa
    sib do do,

    %20
    fa4 r8
    R4.*8
    re8 re16 mi fa sol

    %30
    la8 si16 dod re8
    sol, la la,
    re4 r8

    %33
    R4.*8
    la'8 la16 si do re
    mi8 do la

    %43
    re mi mi,
    la4 r8
    R4.*4

    %49
    fa'8 do fa
    mi4 fa8
    sib la4

    %52
    sol4.
    R4.*4
    la8 fa re
    si'4 do8

    %59
    mi, re4
    do r8
    do'8[(la) mib]\mbreak

    %62
    mib?4 re8
    sib' do re
    mi, re do

    %65
    sib' la sol
    la sol fa
    sol mi4

    %68
    fa r8
    R4.*6
    do16 re do8 fa

    %76
    do16 re do8 fa
    do16 re do8 sib'
    la sol fa

    %79
    sol mi4
    fa16 mi fa sol la sib
    do4 fa,8

    %82
    sol mi4\tr
    fa8 fa,16 sol la sib
    do8 do, do\mbreak

    %85
    fa fa16 sol la8
    sib do do,
    fa4.\fermata

}

IVvlan = \relative do' {

    R4.*11
    fa16 sol la8 sol
    fa16 sol la8 sol

    %14
    fa16 sol la8 sol
    fa fa16 sol la sib
    do8 do, do

    %17
    fa fa16 sol la sib
    do8 la fa
    sib do do,

    %20
    fa4 r8
    R4.*8
    re8 re16 mi fa sol

    %30
    la8 si16 dod re8
    sol, la la,
    re4 r8

    %33
    R4.*8
    la'8 la16 si do re
    mi8 do la

    %43
    re mi mi,
    la4 r8
    R4.*30
    do,4.~

    %76
    do~
    do
    fa4 r8

    %79
    R4.*4
    fa8 fa16 sol la sib
    do8 do, do\mbreak

    %85
    fa fa16 sol la8
    sib do do,
    fa4.\fermata

}

IValton = \relative do' {

    \autoBeamOff

    fa16[sol la8] fa
    sib la r
    do16[sib] la[sol] fa[mi]

    %4
    fa4 r8
    la16[sol la fa sol la]
    sol8[do] r

    %7
    fa,16[mi fa re mi fa]
    mi8[la] r
    re,16[do re mi fa sol]\mbreak

    %10
    la[sib do8] r
    fa,8 sol mi
    fa16[sol la8 sol]

    %13
    fa16[sol la8 sol]
    fa16[sol la8 sol]
    fa4 r8

    %16
    R4.*4
    fa8[do] fa
    mi4 fa8

    %22
    sib la4
    sol r8\mbreak
    la16[sol fa8] mi16[re]

    %25
    sib'8 la r
    la16[sol fa8] mi16[re]
    mib8 re r

    %28
    la'16[sol] fa[mi?] re[dod]
    re4.
    R4.*2

    %32
    la'16[sol la fa sol la]
    sib[la sib sol la sib]
    mi,8[sol] r

    %35
    la16[sol la fa sol la]\mbreak
    re,8[fa] r
    sol16[fa sol mi fa sol]

    %38
    fa8[mi re]
    sold[fad mi]
    la si sold

    %41
    la4 r8
    R4.*3
    fa8[do] fa

    %46
    mi4 fa8
    sib la4\mbreak
    sol4.

    %49
    fa8 [do] fa
    mi4 fa8
    sib la4
    sol4.

    %53
    la8[fa] re
    si'4 do8
    mi, re4

    %56
    do r8
    la'[fa] re
    si'4 do8

    %59
    mi, re4
    do r8
    do'8[(la) mib]\mbreak

    %62
    mib?4 re8
    sib'[do] re
    mi,[re] do

    %65
    sib'[la] sol
    la sol fa
    sol mi4

    %68
    fa16[mi fa sol mi fa]
    sol4 do,8
    sol'16[fa sol la  fa sol]

    %71
    la4 do,8
    la'16[sol la sib sol la]
    sib[la sib do la sib]\mbreak

    %74
    do4 r8
    do,16[re do8 fa]
    do16[re do8 fa]

    %77
    do16[re do8] sib'
    la sol fa
    sol mi4\tr

    %80
    fa16[mi fa sol la sib]
    do4 fa,8
    sol mi4\tr

    %83
    fa4 r8
    R4.*4

}

IVtesto = \lyricmode {

    Al -- le -- luia _ al -- le -- lu -- ia al - - - - - -   le -- lu -- ia - - -
    Al -- le -- luia_al _  -- le -- lu -- ia Al -- le -- luia _ al -- le -- luia _ al -- le -- lu -- ia
    Al - - - - - - - - lelu _ -- ia
    Al -- le -- luia_al  _ -- le -- lu -- ia al -- le -- luia_al _  -- le -- lu -- ia al  -- le -- luia_al _  -- le -- lu -- ia
    Al -- le -- luia_al  _ -- le -- lu -- ia alle -- luia _
    al -- le -- lu -- ia al -- le -- lu -- ia al -- le -- lu ia - - - - - - - -
    al - - le -- luia _ al -- le -- lu -- ia  - al -- le -- lu -- ia.

}

IVbcn = \relative do {

    fa4.
    mi8 fa r
    fa do' do,
    fa4 r8

    %5
    fa4 r8
    mi4 r8
    re4 r8

    %8
    do4 r8
    sib4 r8\mbreak
    la4 r8

    %11
    la sib do
    fa16 sol la8 sol
    fa16 sol la8 sol

    %14
    fa16 sol la8 sol
    fa8 fa16 sol la sib
    do8 do, do

    %17
    fa8 fa16 sol la sib
    do8 la fa
    sib do do,

    %20
    fa4 fa8
    do'4 la8
    sol fa4

    %23
    do4 r8\mbreak
    re4 r8
    sol fa r

    %26
    fa4 r8
    sol fa r
    fa sol la

    %29
    re, re16 mi fa sol
    la8 si16 dod re8
    sol, la la,

    %32
    re4 r8
    sol4 r8
    do,4 r8

    %35
    fa4 r8\mbreak
    sib4 r8
    mi, dod4

    %38
    re r8
    mi4 re8
    do re mi

    %41
    la, la'16 si do re
    mi8 do la
    re mi mi,

    %44
    la4 r8
    fa4 fa8
    do4 fa8

    %47
    sol fa4\mbreak
    do4 r8
    R4.*4

    %53
    fa4.
    sol4 mi8
    fa sol sol,

    %56
    do4.
    R4.*4
    la4.\mbreak

    %62
    sib
    sib
    do

    %65
    do8 re mi
    fa sol la
    sib do do,

    %68
    fa4 r8
    mi4 r8
    mi4 r8

    %71
    fa4 r8
    fa4 r8
    sol4 r8\mbreak

    %74
    la4 r8
    R4.*3
    r8 r la,

    %79
    sib do do,
    fa4 r8
    r r la

    %82
    sib do do,
    fa fa'16 sol la sib
    do8 do, do\mbreak

    %85
    fa fa16 sol la8
    sib do do,
    fa,4.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/8
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4. = 67
    s4.*87
    \bar "|."

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}

IValto = {
    \new Voice = "alleluia"
    <<\IValton \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{"Vestro Principi divino [RV 633]"}
        composer = \markup{"A. Vivaldi (1678 - 1741)"}
    }

    \markup \huge {[1.] Vestro Principi divino - [Allegro]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r4^\markup\center-align "Alto  "fa'8 do'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto\global
                \new Lyrics \lyricsto "vestro" \Itesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #6

    }

    \markup \huge {[2.] O felix culpa - [Recitativo]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 4/4 r8^\markup\center-align "Alto"la'8 fa'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIalto\global
                \new Lyrics \lyricsto "felix" \IItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 20)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] Quid loqueris - [Allegro]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violini"\vspace #-0.2"unisoni]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r4^\markup\center-align "Alto"r8 la'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto\global
                \new Lyrics \lyricsto "quid" \IIItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[4.] Alleluia}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violini"\vspace #-0.2"unisoni]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 3/8\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi fa'16[^\markup\center-align "Alto"sol' la'8]}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IValto\global
                \new Lyrics \lyricsto "alleluia" \IVtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

