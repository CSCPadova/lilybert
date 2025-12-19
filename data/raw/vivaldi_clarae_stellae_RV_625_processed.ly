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


global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t

}

IvlIn = \relative do'' {

    fa4. la,16[(sib do8 re)]
    do fa sib4 la
    sol4. la,16[(sib do8 re)]

    %4
    do fa sib4 la
    sol4. do,16[(re mi8 fa)]
    sol do, si4 la

    %7
    sol4. la16[(si do8 re)]
    mi fa, mi4 re
    sol4. la16[(si do8 re)]

    %10
    mi fa, mi4 re\mbreak
    do r r
    sol''4. mi16[(fa sol8 la)]

    %13
    sib do sib4 la
    sol4. mi,16[(fa sol8 la)]
    sib do sib4 la

    %16
    sol4. mi'16[(fa sol8 lab)]
    sib4(lab) sol
    lab2.~

    %19
    lab4. sol16[(lab sib8 sol)]
    mi2 fa4
    sol4(fa mi)\mbreak

    %22
    fa2 r4
    R2.*4
    sol4. mi16[(fa sol8 la)]

    %28
    sib do sib4 la
    sol4 r8 fa16[(sol la8 do)]
    mi,4 r8 do16[(re mi8 sol)]

    %31
    do,4 r8 mi,16[(fa sol8 fa)]\mbreak
    sol4. mi16[(fa sol8 la)]
    sib do sib4 la

    %34
    sol r r
    la'8 (fa) sol (mi) fa (re)
    sib'(sol) la(fa) sol(mi)

    %37
    do'(la) sib(sol) la(fa)
    re'(do) si(la) sol(fa)
    mi fa sol4 r

    %40
    do si8(la) sol(fa)
    mi fa re2
    do4. mi,16[(fa sol8 la)]\mbreak

    %43
    sol do fa4 mi
    re4. mi,16[(fa sol8 la)]
    sol8 do fa4 mi

    %46
    re4. si16[(do re8 mi)]
    fa si re4 fa,
    mi r r

    %49
    R2.*3
    la4(sol2)
    fa2.\mbreak

    %54
    mib
    mib?4 re8[re16 mib! fa8 re]
    sib'4(la2)

    %57
    sol2.
    fa
    fa4 mi8[mi16(fa sol8 la)]

    %60
    sib do sib4 la
    sol8(mi) la(fa) sib(sol)
    la4. sol8 fa4

    %63
    sol mi2
    fa4. fa16[(sol la8 sib)]\mbreak
    do sib sib4 la

    %66
    sol4. mi16[fa sol8 la]
    sib do sib4 la
    sol4. mi,16[fa sol8 la]

    %69
    sib do sib4 la
    sol4. mi'16[(fa sol8 lab)]
    sib4(lab sol)

    %72
    lab2.~
    lab~
    lab~\mbreak

    %75
    lab4. sol16[lab sib8 sol]
    mi4 fa r
    sib(la? sol)

    %78
    fa r8 fa16[sol la8 la16 sib]
    do4 r8 fa,16[sol la8 la16 sib]
    do4 \con\override TupletBracket.bracket-visibility = ##f \tupletSpan 4\tuplet 3/2 { r8 do sib la[sol fa] }

    %81
    do' fa, sol2\tr
    fa4. la,16[(sib do8 re)]
    do fa sib4 la

    %84
    sol4. la,16[(sib do8 re)]\mbreak
    do fa sib4 la
    sol4. do,16[(re mi8 fa)]

    %87
    sol do, si4 la
    sol4. la16[(si do8 re)]
    mi fa, mi4 re

    %90
    do4. mi'16[(fa sol8 la)]
    sib do sib?4 la
    sol4.  mi,16[(fa sol8 lab)]

    %93
    sib4(lab sol)
    lab2.~
    lab4. sol'16[lab si?8 sol]\mbreak

    %96
    mi4 fa r
    sol(fa mi)
    fa2.\fermata

    %99
    R2.*3
    dod4. dod16[(re mi8 fa)]
    sol la sol4 fa

    %104
    mi r r
    r r8 sib16[(do? re8 mib)]\mbreak
    re4 r r

    %107
    r r8 la16[(sib do8 re)]
    do4 r re
    si4. sold16[(la si8 do)]

    %110
    re mi re4 do
    si4. sold16[(la si8 do)]
    re do si4 sold

    %113
    la4. do16[(re mi8 fa)]
    mi4 r r\mbreak
    mi4. la,16[(si do8 re)]

    %116
    mi la re,4 do
    si4. la16[(si do8 re)]
    mi la re,4 do

    %119
    si4 mi8[do16(re mi8 fa)]
    mi4. do16[(re mi8 fa)]
    mi4. do16[(re mi8 fa)]

    %122
    re4. si16[(do re8 mi)]
    dod4. mi16[(fa sol8 la)]\mbreak
    fa4. re16[(mi fa8 sol)]

    %125
    la sib la4 sol
    fa4. re16[(mi fa8 sol)]
    la sib la4 sol

    %128
    fa4. mi8 re4
    sib' dod,2\tr
    re2.\fermata

}

IvlIIn = \relative do'' {

    do4. fa,16[(sol la8 sib)]
    la do sol'4 fa
    mi4. fa,16[(sol la8 sib)]

    %4
    la do sol'4 fa
    mi4. la,16[ (si do8 re)]
    sol sol, sol4 fa

    %7
    mi4. fa16[(sol la8 si)]
    do re, do4 si
    mi4. fa16[(sol la8 si)]

    %10
    do re, do4 si\mbreak
    do r r
    mi'4. do16[(re mi8 fa)]

    %13
    sol la sol4 fa
    mi4. do,16[(re mi8 fa)]
    sol la sol4 fa

    %16
    mi4. do'16[(re mi8 fa)]
    sol4(fa) mi
    fa2.~

    %19
    fa4. mi16[(fa sol8 mi)]
    do2 do4
    sib(la sol)\mbreak

    %22
    la2 r4
    R2.*4
    mi'4. do16[(re mi8 fa)]

    %28
    sol la sol4 fa
    mi2 r4
    R2.*2\mbreak

    %32
    mi,4. do16[(re mi8 fa)]
    sol la sol4 fa
    mi r r

    %35
    fa'8(do) mi(do) la'(fa)
    sol(mi) fa(re) mi(do)
    la'(fa) sol(mi) fa(re)

    %38
    si'(la) sol(fa) mi(re)
    do re mi4 r
    R2.*2

    %42
    mi,4. do16[(re mi8 fa)]\mbreak
    mi sol re'4 do
    si4. do,16[(re mi8 fa)]

    %45
    mi sol re'4 do
    si4.  sol16[(la si8 do)]
    re fa fa4 re

    %48
    do r r
    R2.*3
    do2.~

    %53
    do~\mbreak
    do
    fa,

    %56
    re'~
    re~
    re

    %59
    sol,4. do16[(re mi8 fa)]
    sol la sol4 fa
    mi8(do) fa(do) sol'(mi)

    %62
    fa4. sol8 la4
    re, sol,2
    la4.  la16[(sib do8 re)]\mbreak

    %65
    la sol' sol4 fa
    mi4. do16[re mi8 fa]
    sol la sol4 fa

    %68
    mi4. do,16[re mi8 fa]
    sol la sol4 fa
    mi4. do'16[(re mi8 fa)]

    %71
    sol4(fa mi)
    fa2.~
    fa~

    %74
    fa~\mbreak
    fa4. mi16[fa sol8 mi]
    do4 do r

    %77
    sol'(fa mi)
    la8[fa16 sol la8 la16 sib] do4
    r8 fa,16[sol la8 la16 sib] do4

    %80
    r8 fa,16[sol la8 la16 sib] do4
    r8 la mi2
    do4. fa,16[(sol la8 sib)]

    %83
    la do sol'4 fa
    mi4. fa,16[(sol la8 sib)]\mbreak
    la do sol'4 fa

    %86
    mi4.  la,16[(si do8 re)]
    mi sol, sol4 fa
    mi4. fa16[(sol la8 si)]

    %89
    do re, do4 si
    do4. do'16[(re mi8 fa)]
    sol la sol4 fa

    %92
    mi4. do,16[(re mi8 fa)]
    sol4(fa mi)
    fa2.~

    %95
    fa4. mi'16[fa sol8 mi]\mbreak
    do4 do r
    sib(la sol)

    %98
    la2.\fermata
    R2.*3
    la4. la16[(si dod8 re)]

    %103
    mi fa mi4 re
    dod r r
    r4 r8 sol16[(la sib8 do?)]\mbreak

    %106
    sib4 r r
    r r8 fa16[(sol la8 sib)]
    la4 r la

    %109
    sold4. mi16[(fad sold8 la)]
    si do si4 la
    sold4. mi16[(fad sold8 la)]

    %112
    si do  re4 si
    do4. la16[(si do8 re)]
    do4 r r\mbreak

    %115
    do4. do16[(re mi8 fa)]
    do mi si4 la
    sold4. do16[(re mi8 fa)]

    %118
    do mi si4 la
    sold4 do8[la16(si do8 re)]
    do4. la16[(si do8 re)]

    %121
    do4. la16[(si do8 re)]
    si4. sold16[(la si8 do)]
    mi,4. dod'16[(re mi8 fa)]\mbreak

    %124
    la,4. fa'16[(sol la8 sol)]
    fa sol fa4 mi
    la,4. fa'16[(sol la8 sol)]

    %127
    fa sol fa4 mi
    la,2 fa'4
    re la mi

    %130
    fa2.\fermata

}

Ivlan = \relative do' {

    la'4 r r
    fa r do
    do r r

    %4
    do r do
    do r r
    do r do

    %7
    do r r
    sol r sol
    sol r r

    %10
    sol r sol\mbreak
    sol4. mi'16[fa sol 8fa]
    mi4 r r

    %13
    mi r do
    do r r
    mi r do

    %16
    do r r
    mi2.
    re4. re16[mi fa8 re]

    %19
    re2.
    sol2 lab4
    re, do2\mbreak

    %22
    do2 r4
    R2.*4
    sol'4 r r

    %28
    mi r do
    do r r
    R2.*2\mbreak

    %32
    do4 r r
    mi r do
    do2.~

    %35
    do~
    do~
    do

    %38
    si
    do4. sol'16[fa sol8 fa]
    mi4 r r

    %41
    R2.
    sol,4 r r\mbreak
    do r sol

    %44
    sol r r
    sol r sol'
    sol r re

    %47
    si r re
    sol, r r
    R2.*10

    %59
    do2 r4
    mi r do
    do r r

    %62
    R2.*3\mbreak
    do4 r r
    do r r

    %67
    do r fa
    do r r
    do r fa

    %70
    do2.~
    do
    si4. fa'16[sol lab8 sol]

    %73
    si,2.~
    si~\mbreak
    si

    %76
    sib!4 la r
    do2 r4
    fa2.~

    %79
    fa~
    fa~
    fa4 do2

    %82
    la'4 r r
    fa r do
    do r r\mbreak

    %85 OOKK
    do r do
    do r r
    do r do

    %88
    do r r
    sol r sol
    sol r r

    %91
    mi' r do
    do r r
    mi2.

    %94
    re4. re16[mi fa8 re]
    re2.\mbreak
    sol4 lab r

    %97
    re, do2
    do\fermata r4
    R2.*3

    %102
    mi4 r r
    dod r la
    la r r

    %105
    R2.*4
    mi'2.~
    mi~

    %111
    mi~
    mi~
    mi2 r4

    %114
    mi r r\mbreak
    mi r r
    mi r fad

    %117
    si, r r
    do r fad
    si, r r

    %120
    la2.~
    la
    sold

    %123
    sol!\mbreak
    re'~
    re~

    %126
    re~
    re~
    re

    %129
    sol,4 la2
    re2.\fermata

}

Ialton = \relative do' {

    \autoBeamOff
    R2.*21
    fa8 [sol] \appoggiatura fa mi2\tr
    fa8 [la] \appoggiatura la sol2\tr

    %24
    la8 [do] \appoggiatura fa, mi2
    fa8 [la sol fa mi sol]
    fa [sol la sib do la]

    %27
    sol2 r4
    R2.
    sib8 [sol] la4.  (fa8)

    %30
    sol [mi] fa4.  (re8)
    mi [do] sib'4.(la8)\mbreak
    sol[fa] sol4 r

    %33
    R2.
    mi8[fa] fa[sol] sol[la]
    la[fa]sol[mi] fa re

    %36
    sib'[sol la fa sol mi]
    do'[la sib sol la fa]
    re'[do si la sol fa]

    %39
    mi [fa] sol4 r
    do si8[la] sol[fa]
    mi [fa] re2

    %42
    do r4\mbreak
    R2.*5
    mi8[fa] fa4.(sol8)

    %49
    sol[mi re do] mi[fa]
    sol[la] sib4(la)
    la sol r

    %52
    la8[do] sol2
    fa8[do'] fa,2\mbreak
    mib8[do'] mib,2

    %55
    mib?4 re r
    sib'8[re] la2
    sol8[re'] sol,2

    %58
    fa8[re'] fa,2
    fa4 mi r
    R2.

    %61
    sol8[mi] la[fa] sib[sol]
    la4. sol8 (fa4)

    %63
    sol mi2
    fa4. fa16[sol la8 sib]\mbreak
    do [sib] sib4 la

    %66
    sol4. mi16[fa sol8 la]
    sib [do] sib4 la
    sol4. mi16[fa sol8 la]

    %69
    sib [do] sib4 la
    sol4 r r
    sol lab(sib)

    %72
    lab8[sib lab sol] fa4
    fa8[sol] lab4 sib
    lab8[sib lab sol] fa4\mbreak

    %75
    lab4. sol16[lab] sib8 sol
    mi4 fa r
    sib la? sol

    %78
    fa r8 fa16[sol la8 la16 sib]
    do4 r8 fa,16[sol la8 la16 sib]
    do4 \con\override TupletBracket.bracket-visibility = ##f \tupletSpan 4\tuplet 3/2 { r8 do [sib] la[sol fa] }

    %81
    do' fa, sol2\tr
    fa4 r r
    R2.*15

    %98
    r4 fa sol
    la8 sib mi,4. fa8
    sol la re,4. mi8

    %101
    fa sol mi4. re8
    la' sold la4 r
    R2.

    %104
    la4. la16[sib do8] la
    fad4 sol r\mbreak
    sol4. sol16[la sib8] sol

    %107
    mi4 fa r
    fa mi re
    sold4. mi16[fad sold8 la]

    %110
    si[do] si4 la
    sold4. mi16[fad sold8 la]
    si[do]  re4 si

    %113
    do r r
    la sold2\tr \mbreak
    la r4

    %116
    R2.*3
    r4 mi4. fa8
    mi la mi4. fa8

    %121
    mi la mi4. fa8
    re si' re,4. mi8
    dod la' la[sol] fa[mi]\mbreak
    fa4. re16[mi fa8 sol]

    %125
    la [sib] la4 sol
    fa4. re16[mi fa8 sol]
    la [sib] la4 sol

    %128
    fa4. mi8 re4
    sib' dod,2\tr
    re2.\fermata

}

Itesto = \lyricmode {

    Cla -- rae stel -- lae, scin -- til -- la - te
    et splen -- do -- rem no -- vum da -- te
    hu -- ius di -- ei tan -- to splen -- do - - - ri tan -- to  ful -- go - ri.

    Cla -- rae stel -- lae, scin -- til -- la -- te
    et splen -- do -- rem no -- vum da -- te et splen -- do -- rem no -- vum da -- te
    hu -- ius di -- ei tan -- to  ful -- go - - - - - - - - - - - - - - ri  et splen -- do -- rem no - vum da -- te
    hu - ius di --  e -- i tan -- to  ful -- go - - - - - -  ri  ful -- go -- ri.

    Mun -- dus vi -- vat in lae -- ti -- tias
    et mox ha -- beat _ suas de -- li  -- cias
    tan - tae pom -- pae tan - tae pom -- pae su -- o de -- co - - - - - - - - - ri
    de -- co -- ri.

    Mun -- dus vi -- vat in lae -- ti -- tias
    et mox ha -- beat _ suas de -- li  -- cias
    tan - tae pom - - - - - - - - pae suo de -- co -- ri.

}

Ibcn = \relative do {

    fa4 r r
    fa r fa
    do r r

    %4
    fa r fa
    do r r
    do r fa

    %7
    do r r
    do r sol'
    do, r r

    %10
    do r sol'\mbreak
    do,4. do'16[re mi8 re]
    do 4 r r

    %13
    do, r fa
    do r r
    do r fa

    %16
    do r r
    do2.
    si4. fa'16 [sol lab8 fa]

    %19
    si,2.
    sib!2 lab4
    sib do do,\mbreak

    %22
    fa do'2
    fa4 do2
    fa4 do2

    %25
    fa4 do2
    fa2.
    do4 r r

    %28
    do r fa
    do2.\tasto~
    do~

    %31
    do\mbreak
    do4 r r
    do r fa

    %34
    do r r
    R2.*4
    do4. do'16[(re mi8 re)]

    %40
    do2 mi,4
    fa sol sol,
    do r r\mbreak

    %43
    do r do
    sol' r r
    do, r do

    %46
    sol' r r
    sol,2 si4
    do la' fa

    %49
    do2 r4
    do2 fa4
    do4. do16[re mi8 do]

    %52
    la2.\tasto~
    la~\mbreak
    la

    %55
    sib4. sib16[do re8 sib]
    sib2.\tasto
    si~

    %58
    si
    do2 r4
    do r fa

    %61
    do2.
    fa2 la,4
    sib do2

    %64
    fa,4 r r\mbreak
    R2.*17
    fa'4 r r

    %83
    fa r fa
    do r r\mbreak
    fa r fa

    %86
    do r r
    do r fa
    do r r

    %89
    do r sol'
    do, r r
    do r fa

    %92
    do r r
    do2.
    si4. fa'16[sol lab8 fa]

    %95
    si,2.\mbreak
    sib!4 lab r
    sib do do,

    %98
    fa\fermata re' mi
    fa8 sol dod,[la16 si dod8 re]
    mi fa sib,[sol16 la sib?8 la]

    %101
    re4 sol, sib
    la r r
    la r re

    %104
    la do!2
    re4 sol, r\mbreak
    sol4 sib?2

    %107
    sib4 la r
    fa'2.
    mi4 r r

    %110
    R2.*3
    la,4 r re
    la mi'2\mbreak

    %115
    la,4 r r
    la r red
    mi r r

    %118
    la, r red
    mi r r
    R2.*11

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*7
    s2 <_!>4
    s2.
    s2 <_!>4
    s2.
    s
    <7>
    s2.*3
    <7 5>4 <6- 4> <5 3>
    <7- 5>2.
    s
    <6 4>
    s2.*23
    <_!>2.
    s
    <_!>
    <_!>
    s2.*3
    <6 4>4 <5 3> s
    s2.*9
    <5 3>4 <6 4> <7 5>
    s2.*27
    s2 <_!>4
    s2.
    <7>
    s
    <7 5>4 <6- 4> <5 3>
    <7- 5>2.
    s
    <6 4>
    s2.*5
    <_+>2.
    <7>
    <_+>
    <_+>
    s
    <6 4>
    s
    <_+>
    s2.*6
    s2 <7>4
    <_+>2.
    s2 <7>4
    <_+>2.

}


forma = {

    \time 3/4
    \key fa\major
    \tempo 2 = 65
    s2.*130
    \bar "||"
    \mark\markup "D.C."

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
    \new Voice = "clarae"
    <<\Ialton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




%{
convert-ly (GNU LilyPond) 2.22.2  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}


IIalton = \relative do' {

    \autoBeamOff

    sol'8 sol16 sol mi8 fa
    sol4 sib8 sib16 la
    la8 la r4 la16 mi mi8 r16 mi sol fa
    re8 re r16 la' la la\mbreak fad8 fad16 do' la8 sib
    sib sib r sib sol8. sol16 sol8 fa
    re re r la' re sib sib la\mbreak
    sold sold r4 sold8 sold sold16 sold fad mi
    la8 la la si16 do red,4 red8 mi
    mi4 mi r8sol sol fad16 mi\mbreak
    la8 la r4 la8 la16 la si 8 do
    sol sol r4 r2\fermata

}

IItesto = \lyricmode {

    Coe -- li re -- pleti _ iam no -- vo splen -- dore _
    pla -- udunt _  in tanta _ di -- e,
    et simul _ ter -- ra ar -- ridit _  to -- ta
    in tam so -- lemni _ pom -- pa.
    Dum fes -- tum ce -- le -- bra -- tur
    al -- mae Vi -- si -- ta -- ti -- onis _
    gau -- deat _ e -- tiam cor me -- um
    Ma -- riam _ lau -- dando _ et col -- lau -- dando _ De -- um.

}

IIbcn = \relative do {

    do1
    dod
    re2\mbreak do?
    sol1
    la4 re~re2~\mbreak
    re1
    do2 la
    sol1\mbreak
    fa
    sol2 do,\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s2 <6 4+>
    s1*2
    <6 4+>1
    s2 <6 4+>




}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4 = 50
    s1*10
    \bar "|."

}

IIalto = {
    \new Voice = "coeli"
    <<\IIalton \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}





IIIvlIn = \relative do'' {

    la'8[re, re16 mi fa sol]
    la8[fa16 sol la8 sib]
    la8[fa16 sol la8 si16 dod]
    re8 re, r la'
    la [la la la]
    re[do16 sib la8 la,]
    la[la la la]
    re[ do16 sib la8 sib']
    la[sib la sib]
    la[si16 dod re8 re,]
    fa4 mi
    re r8 sib
    la[sib la sib] la[si16 dod re8 re,]
    fa4 mi\mbreak
    re8 re' re16[mi] fa[sol]
    la8 [fa16 sol la8 sib]

    %18
    la [fa16 sol la8 si16 dod]
    re4 re,
    la'8[sol16 la] sib la sol fa

    %21
    fa4 mi
    fa r16 sol[la sib]
    do8[fa, sol mi]

    %24
    fa4 r16 sol[la sib]\mbreak
    do8[fa, sol mi]
    fa[[mi16 re do8 sib']

    %27
    la4(sol)
    fa4 r8 fa2~
    fa4 la8 sol

    %30
    fad sol la16[sib do la]
    sib8 [sol sol fa]
    mi fa sol16 la sib sol

    %33
    la4 fa\mbreak
    r la8 sib
    la [sib la sib]

    %36
    la [sib la sib]
    la[sib16 do re8 sib]
    sold4 la

    %39
    r si8 sold
    la4 si8 sold
    la2~

    %42
    la4. la16 sib
    do8 [fa, sib la]\mbreak
    la sol4 la16 sib

    %45
    do 8 [fa, sib la]
    la16[fa la do] sol4
    r lab8 sol

    %48
    lab8 [sol lab sol]
    lab8. sol16 sol4
    r sib8 la

    %51
    la [sol sol fa]
    fa[ mib mib re]\mbreak
    re8. dod16 dod4

    %54
    r r8 la'
    la [la la la]
    re8[do16 sib la8 la]

    %57
    la [la la la]
    re8[do16 sib la8 sib]
    la [sib la sib]

    %60
    la [si16 dod re8 re,]\mbreak
    fa4(mi8.) re16
    re4 r

    %63
    r8 re [re16 mi  fa sol]
    la8 [fa16 sol la8 sib]
    la [fa16 sol la8 si16 dod]

    %66
    re4 re,
    la'8[sol16 la] sib[la sol fa]
    fa4 mi

    %69
    la8[sol16 la] sib la sol fa
    fa4 mi
    r la8 la

    %72
    sib [la sib la]
    sib [la re, re]
    mib [re mib re]

    %75
    mib [re la' re,]
    dod [re sol fa]\mbreak
    mi4 r8 la

    %78
    la [la la la]
    re8[do16 sib la8 la]
    la [la la la]

    %81
    re8[do16 sib la8 sib]
    la [sib la sib]
    la [si16 dod re8 re,]\mbreak

    %84
    fa4(mi8.) re16
    re4 r8 \parenthesize la'
    la8 [la la la]

    %87
    re8[do16 sib la8 la]
    la [la la la]
    re8[do16 sib la8 sib]

    %90
    la [sib la sib]
    la [si16 dod re8 re,]\mbreak
    fa4 (mi8.) re16

    %93
    re8 re re16 mi fa sol
    la8[fa16 sol la8 sib]
    la[la la la]

    %96
    re[do16 sib la8 la,]
    la[la la la]
    re[do16 sib la8 sib']

    %99
    la[sib la sib]
    la[si16 dod re8 re,]
    fa4 mi

    %102
    re r8 sib
    la[sib la sib]
    la[si16 dod re8 re,]

    %105
    fa4 mi
    re2\fermata

}

IIIvlan = \relative do' {

    fa8[sol la sol]
    fa[re16 mi fa8 sol]
    fa[re16 mi fa8 sol16 la]

    %4
    fa8[sol la sol]
    fa8[sol la sol]
    fa8[sol la sol]

    %7
    fa8[sol la sol]
    fa8[sol la sol]
    fa[sol fa sol]

    %10
    fa[re la' fa]
    re4 dod
    re r8 re

    %13
    fa[sol fa sol]
    fa[re la re]
    re8 dod4.\mbreak

    %16
    re8 mi[ fa mi]
    re[mi fa sol]
    re8[ mi fa mi]

    %19
    re8[ mi fa mi]
    re[fa sol sol,]
    la[si dod la]

    %22
    re[la' sib sol]
    fa[la, sib do]
    fa[la sib sol]\mbreak

    %25
    fa[la, sib do]
    fa[sol mi do]
    fa[la, sib do]

    %28
    fa,4. fa2~
    fa4 dod'8 la
    re[sol fad re]

    %31
    sol[sol, si sol]
    do[fa mi do]
    fa[sol la fa]\mbreak

    %34
    mi[do do' re]
    do[re do re]
    do[re do re]

    %37
    do[la sib re,]
    mi[re do si]
    la do re mi

    %40
    la, do re mi
    la,2~
    la4. fa'8

    %43
    mi[fa re si]\mbreak
    do[re mi fa]
    mi[fa sol fa]

    %46
    do[re mi do]
    fa[mi fa mi]
    fa[mi fa mi]

    %49
    fa[sol mi re]
    dod2~
    dod4 la8 la

    %52
    re[sol sol sold]\mbreak
    la[sib la sol]
    fa[sol fa mi]

    %55
    re[mi fa mi]
    re[mi fa mi]
    re[mi fa mi]

    %58
    re[mi fa sol]
    fa[sol fa sol]
    fa[mi fa re]\mbreak

    %61
    la' [sol la la,]
    re [mi fa mi]
    re [mi fa mi]

    %64
    re [mi fa sol]
    re [mi fa mi]
    re [mi fa  mi]

    %67
    re [mi fa  mi]
    re [sol la dod,]
    re [mi fa  mi]\mbreak

    %70
    re [sol la dod,]
    re [mi fa  mi]
    sol[re sol re]

    %73
    sol[re fa re]
    sol[re sol re]
    sol[re fa re]

    %76
    la'[fa mi re]\mbreak
    la[la' fa mi]
    re[mi fa mi]

    %79
    re[mi fa mi]
    re[mi fa mi]
    re[mi fa sol]

    %82
    fa[sol fa sol]\mbreak
    fa[mi fa re]
    sol[re la' la,]

    %85
    re[mi fa mi]
    re[mi fa mi]
    re[mi fa mi]

    %88
    re[mi fa mi]
    re[mi fa sol]
    fa[sol fa sol]\mbreak

    %91
    fa[mi fa re]
    sol[re la' la,]
    re[fa la sol]

    %94
    fa[re16 mi fa8 sol]
    fa8[sol la sol]
    fa8[sol la sol]

    %97
    fa8[sol la sol]
    fa8[sol la sol]
    fa[sol fa sol]

    %100
    fa[re la' fa]
    re4 dod
    re r8 re

    %103
    fa[sol fa sol]
    fa[re la re]
    re4 dod

    %106
    re2\fermata

}

IIIalton = \relative do' {

    \autoBeamOff

    R2*15
    r8 re re16[mi] fa[sol]
    la8 fa16 sol la8 sib

    %18
    la fa16 sol la8 si16[dod]
    re4 re,
    la'8[sol16 la] sib[la] sol[fa]

    %21
    fa4 mi
    fa r16 sol[la sib]
    do8[fa, sol mi]

    %24
    fa4 r16 sol[la sib]\mbreak
    do8[fa, sol mi]
    fa[mi16 re] do8 sib'

    %27
    la4(sol)
    fa4 r8 fa2~
    fa4 la8 sol

    %30
    fad sol la16[sib] do[la]
    sib8 sol sol fa
    mi fa sol16[la] sib[sol]

    %33
    la4 fa\mbreak
    r la8 sib
    la sib la sib

    %36
    la sib la sib
    la[sib16 do re8 sib]
    sold4 la

    %39
    r si8 sold
    la4 si8 sold
    la2~

    %42
    la4. la16 sib
    do8 fa, sib la\mbreak
    la sol4 la16 sib

    %45
    do 8 fa, sib la
    la16[fa la do] sol4
    r lab8 sol

    %48
    lab8 sol lab sol
    lab8. sol16 sol4
    r sib8 la

    %51
    la sol sol fa
    fa mib mib re\mbreak
    re8. dod16 dod4

    %54
    r r8 la'
    la la la la
    re8[do16 sib] la8 la

    %57
    la la la la
    re8[do16 sib] la8 sib
    la sib la sib

    %60
    la [si16 dod] re8 re,\mbreak
    fa4(mi8.) re16
    re4 r

    %63
    r8 re re16[mi] fa[sol]
    la8 fa16 sol la8 sib
    la fa16 sol la8 si16[dod]

    %66
    re4 re,
    la'8[sol16 la] sib[la] sol[fa]
    fa4 mi

    %69
    la8[sol16 la] sib[la] sol[fa]
    fa4 mi
    r la8 la

    %72
    sib la sib la
    sib la re, re
    mib re mib re

    %75
    mib re la' re,
    dod re sol fa\mbreak
    mi4 r8 la

    %78
    la la la la
    re8[do16 sib] la8 la
    la la la la

    %81
    re8[do16 sib] la8 sib
    la sib la sib
    la [si16 dod] re8 re,\mbreak

    %84
    fa4(mi8.) re16
    re4 r8 \parenthesize la'
    la8 la la la

    %87
    re8[do16 sib] la8 la
    la la la la
    re8[do16 sib] la8 sib

    %90
    la sib la sib
    la [si16 dod] re8 re,\mbreak
    fa4(mi8.) re16

    %93
    re4 r
    R2*13

}

IIItesto = \lyricmode {

    Nunc iu -- bi -- lare, _
    sem -- per lae -- tare _ sem -- per lae -- ta -- re
    gau -- dio im -- men -- so
    a - - - - - - nima _ me -- a. a.

    Et sit ti -- bi iu -- bi -- lando, _
    et sit ti -- bi me -- mo -- ran -- do iu -- bi -- lando _ me -- mo -- ran -- do
    mun -- di_et cor - dis al -- ma spes al -- ma spes.

    Si non es lae -- titia _ ple -- na
    tan -- tae pom -- pae au -- ra sere -- na
    sit dul -- cedo _ tuae maes -- ti -- tiae, _ sit dul -- cedo _ tuae maes -- ti -- tiae, tuae maes -- ti -- tiae, _
    et in te so -- lum so -- lum et in te so -- lum so -- lum sint mil -- le mil -- le mil -- le de -- li -- ci -- ae.

    Nunc iu -- bi -- lare, _
    sem -- per lae -- tare _ sem -- per lae -- ta -- re
    gau -- dio im -- men -- so
    a -- nima _ me -- a.

    Et sit ti -- bi iu -- bi -- lando, _
    et sit ti -- bi me -- mo -- ran -- do
    mun -- di_et cor -- dis al -- ma spes,
    et in te so -- lum so -- lum et in te so -- lum so -- lum sint mil -- le mil -- le mil -- le de -- li -- ci -- ae,
    et in te so -- lum so -- lum et in te so -- lum so -- lum sint mil -- le mil -- le mil -- le de -- li -- ci -- ae.

}

IIIbcn = \relative do {

    re8[mi fa mi]
    re4 r8 sol,
    re'4 r8 sol,

    %4
    re'[mi fa mi]
    re[mi fa mi]
    re[mi fa mi]

    %7
    re[mi fa mi]
    re[mi fa sol]
    re[sol re sol]

    %10
    re[sol fa re]
    la'4 la,
    re r8 sol

    %13
    re[sol re sol]
    re[sol fa re]
    la4 la\mbreak

    %16
    re8 r4 r8
    R2*11
    r4. r2

    %29
    R2*64
    r8 re[fa mi]

    %94
    re4 r8 sol,
    re'[mi fa mi]
    re[mi fa mi]

    %97
    re[mi fa mi]
    re[mi fa sol]
    re[sol re sol]

    %100
    re[sol fa re]
    la'[sol la la,]
    re4 r8 sol

    %103
    re[sol re sol]
    re[sol fa re]
    la'[sol la la,]

    %106
    \parenthesize re2\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 60
    s2*15
    s8\repeat volta 2 {
        s4.
        s2*11
    }
    \alternative {
        {\set Score.measureLength = #(ly:make-moment 3 8) s4. }{\set Score.measureLength = #(ly:make-moment 2 4) s2}
    }
    \bar ".|:"
    \set Score.currentBarNumber = #29
    s2*13
    \bar ":|."
    s2*65
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
    \new Voice = "nunc"
    <<\IIIalton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}





IVvlIn = \relative do'' {

    fa4~fa8.[sol16 lab8. fa16]
    do'4 do, do'
    fa,4. mi8 [fa8. sol16]

    %4
    mi4(re) do
    fa4~fa8.[sol16 lab8. fa16]
    do'4 do, do'

    %7
    fa,4. mi8 [fa8. sol16]
    mi2.
    fa8 fa fa fa fa fa

    %10
    sib,, sib sib sib sib sib\mbreak
    sol'' sol sol sol sol sol
    do,, do do do do do

    %13
    sib'' sib sib sib sib sib
    sib sol sol mi mi sib
    sib sol sol mi mi do

    %16
    do do do do do do
    do do do do do do
    fa'4 sol mi

    %19
    fa~fa8.[sol16  lab8. fa16]
    do'4 do, do'
    fa,4. mi8 [fa8. sol16]

    %22
    mi4(re) do
    fa4~fa8.[sol16 lab8. fa16]
    do'4 do, do'

    %25
    fa,4. mi8 [fa8. sol16]
    mi2 r4
    lab4~lab8.[sib16 do8. lab16]

    %28
    reb8.[sib16 sib8. lab16 lab8. sol16]
    sol4~sol8.[lab16 sib8. sol16]
    do8.[lab16 lab8. sol16 sol8. fa16]\mbreak

    %31
    fa4~fa8.[sol16 lab8. fa16]
    si4~si8.[do16 re8. si16]
    do4 sol fa

    %34
    mib8.[fa16] re2
    do8 do do do do do
    fa, fa fa fa fa fa

    %37
    re' re re re re re
    sol, sol sol sol sol sol
    fa' fa fa fa fa fa

    %40
    fa re re si si fa
    fa re re si si sol\mbreak
    sol sol sol sol sol sol

    %43
    mib''4 fa re
    mib sol~sol8. lab16
    fa4 fa~fa8.[sol16]

    %46
    mib4 mib8.[re16] mib8. [fa16]
    re2.
    sol4 sol~sol8.[lab16]
    fa4 fa~fa8.[sol16]

    %50
    mib4 mib8.[re16 mib8. fa16]
    re2.\mbreak
    sib'4 sib8.[la16 sib8. do16]

    %53
    la4 r r
    fa4 fa8.[mi16 fa8. sol16]
    mi2  la4

    %56
    si sold2
    la8 [mi16 mi mi mi mi mi mi mi mi mi]
    fa,8[fa'16 fa fa fa fa fa fa fa fa fa]

    %59
    sold,8[sold'16 sold sold sold sold sold sold sold sold sold]
    la8 do,16 do si si si si si si si si\mbreak
    la4 la'~la8. sib16

    %62
    sol4 sol~sol8. la16
    fa4 fa8.[mi16 fa8. sol16]

    %64
    mi2 r4
    la4 la\tr~la16[(sol la sib)]
    sol4 sol\tr~sol16[(fa sol la)]

    %67
    fa4 fa\tr~fa16[(mi fa sol)]
    mi8[mi16 mi  mi mi mi mi mi mi mi mi]
    fa8[fa16 fa fa fa fa fa fa fa fa fa]\mbreak

    %70
    mi4 dod'8. [la16 si8. dod16]
    re8.[do16 sib?8. la16 sol8. fa16]
    sol8.[la16 sib8. sol16 la8. sib16]

    %73
    do8.[sib16 la8. sol16 fa8. mi16]
    fa8.[sol16 la8. fa16 sol8. la16]
    sib8.[do16 sib8. la16] sol8.[fa16]

    %76
    mi4.(re8) do4
    do8 do do do do do
    fa, fa fa fa fa fa

    %79
    la fa la fa la fa\mbreak
    do4 sol''8.[lab16 sib8. sol16]

    %81
    lab4 lab8.[sib16] do4
    do sib8.[lab16 sol8. fa16]
    sol4 sol8.[lab16] sib4

    %84
    sib lab8.[sol16 fa8. mi16]
    fa4 fa8.[sol16] lab4
    lab? sol8[lab! sib sol]

    %87
    mi4(re) do
    sib'4 lab~lab8.[sol16]\mbreak
    lab4 sol~sol8. fa16

    %90
    sol4 mi2
    fa8 fa fa fa fa fa
    sib,, sib sib sib sib sib

    %93
    sol'' sol sol sol sol sol
    do,, do do do do do

    %95
    lab''8.[sib16] do2
    sol8.[lab16] sib2
    fa8.[sol16] lab4 fa

    %98
    mi(re) do\mbreak
    lab'8.[sib16] do2
    sol8.[lab16] sib2

    %101
    fa8.[sol16] lab4 fa
    mi fa sib
    lab sol2

    %104
    fa,8 fa fa fa fa fa
    fa'4 sol mi
    fa,8 fa fa fa fa fa

    %107
    fa'4 sol mi
    fa,8 fa fa fa fa fa\mbreak
    sib sib sib sib sib sib

    %110
    do do do do do do
    fa,4 r r
    fa' sol mi

    %113
    fa2.\fermata

}

IVvlIIn = \relative do'' {

    fa4~fa8.[sol16 lab8. fa16]
    do'4 do, do'
    fa,4. mi8 [fa8. sol16]

    %4
    mi4(re) do
    fa4~fa8.[sol16 lab8. fa16]
    do'4 do, do'

    %7
    fa,4. mi8 [fa8. sol16]
    mi2.
    do8 do do do do do

    %10
    sib, sib sib sib sib sib\mbreak
    re' re re re re re
    do, do do do do do

    %13
    sol'' sol sol sol sol sol
    sol sib sib sol sol mi
    mi sib sib sol sol mi

    %16
    do do do do do do
    do do do do do do
    la'4 sib sol

    %19
    fa'~fa8.[sol16  lab8. fa16]
    do'4 do, do'
    fa,4. mi8 [fa8. sol16]

    %22
    mi4(re) do
    fa4~fa8.[sol16 lab8. fa16]
    do'4 do, do'

    %25
    fa,4. mi8 [fa8. sol16]
    mi2 r4
    lab4~lab8.[sib16 do8. lab16]

    %28
    reb8.[sib16 sib8. lab16 lab8. sol16]
    sol4~sol8.[lab16 sib8. sol16]
    do8.[lab16 lab8. sol16 sol8. fa16]\mbreak

    %31
    fa4~fa8.[sol16 lab8. fa16]
    si4~si8.[do16 re8. si16]
    do4 sol fa

    %34
    mib8.[fa16] re2
    sol,8 sol sol sol sol sol
    fa fa fa fa fa fa

    %37
    la la la la la la
    sol sol sol sol sol sol
    re' re re re re re

    %40
    re fa fa re re si
    si? fa fa re re si!\mbreak
    si si si si si si

    %43
    do'4 re si
    do mib~mib8. fa16
    re4 re~re8. mib16

    %46
    do4 do8.[si16 do8. re16]
    si2.
    mib4 mib~mib8. fa16

    %49
    re4 re~re8. mib16
    do4 do8.[si16 do8. re16]
    si2.\mbreak

    %52
    sol'4 sol8.[fa16 sol8. la16]
    fa4 r r
    re re8.[do16  re8. mi16]

    %55
    do2 do4
    re si2
    do8[do16 do do do do do do do do do]

    %58
    la8[la16 la la la la la la la la la]
    si8[si16 si si si si si si si si si]
    do8 la16 la la la la la sold sold sold sold\mbreak

    %61
    la4 mi'~mi8. mi16
    mi4 dod~dod8. dod16
    la4 si8.[dod16 re8. mi16]

    %64
    dod2 r4
    fa4 fa\tr~fa16[(mi fa sol)]
    mi4 mi\tr~mi16(re mi fa)

    %67
    re4 re\tr~re16(dod re mi)
    dod8[dod16 dod dod dod dod dod dod dod dod dod]
    re8[re16 re re re re re re re re re]\mbreak

    %70
    dod4 mi~mi8. mi16
    la,4 la~la8. re16
    re4 re~re8. re16

    %73
    do?4 do~do8. do16
    do4 do~do8. do16
    sib4 sib re

    %76
    sol,2 r4
    do8 do do do do do
    fa, fa fa fa fa fa

    %79
    la fa la fa la fa\mbreak
    do4 mi'8.[fa16 sol8. mi16]
    fa4 fa8. sol16 lab4

    %82
    lab? r r
    mi4 mi8. fa16 sol4
    sol r r

    %85
    reb4 reb8. mi!16 fa4
    fa sib,2
    sol2.

    %88
    sol'4 fa~fa8. mi16\mbreak
    fa4 mi~mi8. fa16
    re4 sol,2

    %91
    la8 fa' fa fa fa fa
    sib,, sib sib sib sib sib
    sol'' sol sol sol sol sol

    %94
    do,, do do do do do
    fa2.
    mib

    %97
    reb
    do \mbreak
    fa

    %100
    mib
    reb
    do4 do' reb

    %103
    fa, mi?2
    fa8 fa fa fa fa fa
    la4 sib sol

    %106
    fa8 fa fa fa fa fa
    la4 sib sol
    fa8 fa fa fa fa fa\mbreak

    %109
    sib sib sib sib sib sib
    do do do do do do
    fa,4 r r

    %112
    la4  sib sol
    la2.\fermata

}

IVvlan = \relative do' {

    fa4 fa~fa8. fa16
    mi4 mib4~mib8. mib16
    re4 reb~reb8. reb16

    %4
    do4 (re) mi
    fa4 fa~fa8. fa16
    mi4 mib4~mib8. mib16

    %7
    re4 reb~reb8. reb16
    do2.
    la'8 la la la la la

    %10
    sib,8 sib sib sib sib sib\mbreak
    si' si si si si si
    do, do do do do do

    %13
    mi mi mi mi mi mi
    mi4 r r
    sol4 r r

    %16
    do,8 do do do do do
    do do do do do do
    do4 re do

    %19
    fa4 fa~fa8. fa16
    mi4 mib4~mib8. mib16
    re4 reb~reb8. reb16\mbreak

    %22
    do4(re) mi
    fa4 fa~fa8. fa16
    mi4 mib4~mib8. mib16

    %25
    re4 reb~reb8. reb16
    do4 do'8.[sib16 lab8. sol16]
    fa4 fa~fa8. fa16

    %28
    sib,4 sib~sib8. sib16
    mib4 mib~mib8. mib16
    lab,4 lab~lab8. lab16\mbreak

    %31
    reb4 reb~reb8. reb16
    sol,4 sol'~sol8. fa16
    mib4 si sol

    %34
    do sol' sol,
    mi'8 mi mi mi mi mi
    fa fa fa fa fa fa

    %37
    fad fad fad fad fad fad
    sol sol sol sol sol sol
    si si si si si si

    %40
    si?4 r r
    re, r r\mbreak
    sol,8 sol sol sol sol sol

    %43
    sol'4 la sol
    do, do~do8. do16
    re4 si~si8. sol16

    %46
    do4 fad~fad8. fad16
    sol4 sol8.[fa16 mib8. re16]
    do4 do~do8. do16

    %49
    re4 si~si8. sol16
    do4 fad~fad8. fad16
    sol4 sol8.[fa16 mib8. re16]\mbreak

    %52
    dod2.
    re4 re'8.[do16 si8. la16]
    sold2.

    %55
    la2 la,4
    re mi mi,
    la8[do16 do do do do do do do do do]

    %58
    re8[re16 re re re re re fa fa fa fa]
    mi8[mi16 mi mi mi mi mi mi mi mi mi]
    mi8[mi16 mi fa fa fa fa] mi mi mi mi\mbreak

    %61
    mi4 do~do8. do16
    dod4 la~la8. la16
    re4 sold,~sold8. sold16

    %64
    la4 la'8.[sol16 fa8. mi16]
    re4 re~re8. re16
    mi4 dod~dod8. la16

    %67
    re4 si~si8. sold16
    la8[mi'16 mi mi mi mi mi mi mi mi mi]
    si'8[si16 si si si si si si si si si]\mbreak

    %70
    mi,4 la~la8. sol16
    fa4 fa~fa8. fa16
    mi4 mi~mi8. mi16

    %73
    mi4 mi~mi8. mi16
    re4 re~re8. re16
    sol,4 sol si

    %76
    do2.
    do'8 do do do do do
    fa, fa fa fa fa fa

    %79
    la fa la fa la fa\mbreak
    do4 do do
    do4 do do

    %82
    do4 do do
    do4 do do
    do4 do do

    %85
    do4 do do
    do4 do do
    do4 do do

    %88
    do4 do do\mbreak
    do do do
    sib do2

    %91
    fa8 do' do do do do
    sib, sib sib sib sib sib
    re' re re re re re

    %94
    do, do do do do do
    fa2.
    mib

    %97
    reb
    do\mbreak
    fa

    %100
    mib
    reb
    do4 lab sib

    %103
    do do,2
    fa'8 fa fa fa fa fa
    do4 re do

    %106
    do8 fa fa fa fa fa
    do4 re do
    fa8 fa fa fa fa fa\mbreak

    %109
    sib sib sib sib sib sib
    do do do do do do
    fa,4 r r

    %112
    do re do
    do2.\fermata

}

IValton = \relative do' {

    \autoBeamOff

    fa4~fa8.[sol16] lab8.[fa16]
    do'4 do, do'
    fa,4. mi8 fa8.[sol16]

    %4
    mi4(re) do
    fa4~fa8.[sol16] lab8.[fa16]
    do'4 do, do'

    %7
    fa,4. mi8 fa8.[sol16]
    mi2.
    R2.*10

    %19
    fa4~fa8.[sol16] lab8.[fa16]
    do'4 do, do'
    fa,4. mi8 fa8.[sol16]

    %22
    mi4(re) do
    fa4~fa8.[sol16] lab8.[fa16]
    do'4 do, do'

    %25
    fa,4. mi8 fa8.[sol16]
    mi2 r4
    lab4~lab8.[sib16 do8. lab16]

    %28
    reb8.[sib16 sib8. lab16 lab8. sol16]
    sol4~sol8.[lab16 sib8. sol16]
    do8.[lab16 lab8. sol16 sol8. fa16]\mbreak

    %31
    fa4~fa8.[sol16 lab8. fa16]
    si4~si8.[do16] re8.[si16]
    do4 sol fa

    %34
    mib8.[fa16] re2
    do r4
    R2.*8

    %44
    sol'4 sol~sol8.[lab16]
    fa4 fa~fa8.[sol16]
    mib4 mib8.[re16] mib8. [fa16]

    %47
    re2 r4
    sol4 sol~sol8.[lab16]
    fa4 fa~fa8.[sol16]

    %50
    mib4 mib8.[re16] mib8. [fa16]
    re2 r4\mbreak
    sib'4 sib8.[la16] sib8.[do16]

    %53
    la4 r r
    fa4 fa8.[mi16] fa8.[sol16]
    mi2  la4

    %56
    si sold2
    la4 r r
    R2.*3\mbreak

    %61
    r4 la~la8. sib16
    sol4 sol~sol8. la16
    fa4 fa8.[mi16] fa8.[sol16]

    %64
    mi2 r4
    la4 la\tr~la16[(sol la sib)]
    sol4 sol\tr~sol16[(fa sol la)]

    %67
    fa4 fa\tr~fa16[mi fa] sol
    mi2 r4
    R2.

    %70
    la8.[si16 dod8. la16 si8. dod16]
    re8.[do16 sib?8. la16 sol8. fa16]
    sol8.[la16 sib8. sol16 la8. sib16]

    %73
    do8.[sib16 la8. sol16 fa8. mi16]
    fa8.[sol16 la8. fa16 sol8. la16]
    sib8.[do16 sib8. la16] sol8.[fa16]

    %76
    mi4.(re8) do4
    R2.*3\mbreak
    r4 sol'8.[lab16 sib8. sol16]

    %81
    lab4 lab8.[sib16] do4
    do sib8.[lab16 sol8. fa16]
    sol4 sol8.[lab16] sib4

    %84
    sib lab8.[sol16 fa8. mi16]
    fa4 fa8.[sol16] lab4
    lab? sol8[lab!] sib[sol]

    %87
    mi4(re) do
    sib'4 lab~lab8.[sol16]\mbreak
    lab4 sol~sol8. fa16

    %90
    sol4 mi2
    fa4 r r
    R2.*3

    %95
    lab8.[sib16] do2
    sol8.[lab16] sib2
    fa8.[ (sol16] lab4) fa

    %98
    mi(re) do\mbreak
    lab'8.[sib16] do2
    sol8.[lab16] sib2

    %101
    fa8.[sol16] lab4 fa
    mi fa sib
    lab sol2

    %104
    fa r4
    fa sol mi
    fa2 r4

    %107
    fa sol mi
    fa2 r4\mbreak
    R2.*3

    %112
    fa4 sol mi
    fa2.\tr\fermata

}

IVtesto = \lyricmode {

    Al -- le -- luia _ al -- le - - lu -- ia al -- le -- luia _ al -- le - lu -- ia
    Al -- le -- luia _ al -- le - - lu -- ia al -- le -- luia _ al -- le - lu -- ia
    al - - - - -  le -- luia _ al -- le -- lu -- ia
    Al -- le -- lu -- ia al -- le -- lu -- ia al -- le -- lu -- ia al -- le -- lu -- ia
    Al -- le -- lu -- ia al -- le -- lu -- ia al -- le -- lu -- ia
    Al -- le -- lu -- ia al -- le - lu -- ia al - - - - le -- lu -- ia
    Al - - - - - le -- lu -- ia
    Al - - - - - - - - - - - - - - - le -- lu -- ia al -- le -- lu -- ia al -- le -- lu -- ia
    Al - - - -  le -- lu -- ia Al - - - -  - le -- lu -- ia al -- le -- lu -- ia al -- le -- lu -- ia al -- le -- lu -- ia
    Al -- le -- lu -- ia



}

IVbcn = \relative do {

    R2.*8
    la8 la la la la la
    sib sib sib sib sib sib\mbreak

    %11
    si si si si si si
    do do do do do do
    do do do do do do

    %14
    do4 r r
    do r r
    do8 do do do do do

    %17
    do do do do do do
    fa4 sib, do
    fa, r r

    %20
    R2.*15
    mi'8 mi mi mi mi mi
    fa fa fa fa fa fa

    %37
    fad fad fad fad fad fad
    sol sol sol sol sol sol
    sol sol sol sol sol sol

    %40
    sol4 r r
    sol r r\mbreak
    sol,8 sol sol sol sol sol

    %43
    do4 fa, sol
    do r r
    R2.*12

    %57
    la8[la16 la la la la la la la la la]
    re8[re16 re re re re re re re re re]
    re8[re16 re re re re re re re re re]

    %60
    do8[do16 do re re re re] mi mi mi mi\mbreak
    la,4 r r
    R2.*6

    %68
    la8[la16 la la la la la la la la la]
    sold8[sold16 sold sold sold sold sold sold sold sold sold]\mbreak
    la4 r r

    %71
    R2.*6
    do'8 do do do do do
    fa, fa fa fa fa fa

    %79
    la fa la fa la fa\mbreak
    do4 r r
    R2.*10

    %91
    la'8 la la la la la
    sib, sib sib sib sib sib
    si' si si si si si

    %94
    do, do do do do do
    fa,4 r r
    R2.*8

    %104
    fa'8 fa fa fa fa fa
    fa4 sib, do
    fa8 fa fa fa fa fa

    %107
    fa4 sib, do
    fa8 fa fa fa fa fa\mbreak
    sib sib sib sib sib sib

    %110
    do do do do do do
    fa,4 r r
    fa sib, do

    %113
    fa,2.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*12
    <7>2.
    s2.*5
    <_->2.
    s2.*19
    <7>2.
    <7>
    s
    s
    <_->
    <_->
    s2.*14
    <6 4+>2.
    s4 <6! 5> <_+>
    s2.*7
    <_+>2.
    <7 5>
    <_+>
    s2.*24
    <_->2.
    s2.*8
    <_!>2.

}


forma = {

    \time 3/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 60
    s2.*113
    \bar "|."

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

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
        title = \markup\smaller{"Clarae stellae, scintillate [RV 625]"}
        composer = \markup{"A. Vivaldi (1678 - 1741)"}
    }

    \markup \huge {[1.] Clarae stellae, scintillate - All[egr]o}

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
                \incipit { \clef alto \key fa\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi fa'8^\markup\center-align "Alto  " [sol']}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto\global
                \new Lyrics \lyricsto "clarae" \Itesto
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

    \markup \huge {[2.] Coeli repleti - Rec[itati]vo}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 4/4 sol'8^\markup\center-align "Alto  " sol'16 sol'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIalto\global
                \new Lyrics \lyricsto "coeli" \IItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
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

        systems-per-page = #5

    }

    \markup \huge {[3.] Nunc iubilare - All[egr]o}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violini]"\vspace #-0.2"Unisoni"}
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
                \incipit { \clef alto \key fa\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r8^\markup\center-align "Alto  " re' re'16[mi']}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto\global
                \new Lyrics \lyricsto "nunc" \IIItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
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

        systems-per-page = #4

    }

    \markup \huge {[4.] Alleluia - All[egr]o}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi fa'4^\markup\center-align "Alto  " fa'8.[sol'16]}
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

