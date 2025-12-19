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


Ialton = \relative do' {

    \autoBeamOff
    r4 mi r sol8 si
    mi, mi fad sol la4 la
    r la8 fad red4 mi8 fad

    %4
    sol4 sol\mbreak r sol16 sol si8
    sol4 fad8 mi la la r la
    la la16 la la8 mi fad fad r4

    %7
    r sol8 re r4 re8 si
    r4 si'8 sol r4 la8 mi16 mi\mbreak
    r4 mi8 sol fad4 fad

    %10
    r fad si8 fad fad fad16 fad
    re4 re sol la
    si la sol fad8 sol

    %13
    mi4 fad sol la
    re,8 [mi16 fad] sol4~\mbreak sol8[fad16 mi] la4~
    la8[sol16 fad] si8[sol16 fad] sol2~

    %16
    sol4 fad sol2
    R1*2

}

ItestoII = \lyricmode {

    Quæ, quæ est ista, _ quæ pro --  cedit, _ ut Au -- ro -- ra con -- surgens, _

    cui _ sol ipse _ re -- surgens _ in suo _ ni -- tore _ cedit, _

    cœli, _ plantæ, _ stellæ, _ di -- cite _ nunci - a -- te.

    Ah, scio _ quid indi - catis, _ hæc est sponsa, _ sponsa, _ di -- vi -- næ pu -- ri -- ta - - - - - tis.

}

Ibcn = \relative do {

    mi1~
    mi2 fad~
    fad1

    %4
    mi~
    mi2 do~
    do\mbreak si4 r

    %7
    sol1~
    sol2 dod~
    dod re

    %10
    si1~
    si2 sol8 si do re
    sol, sol' fad re si' do re si\mbreak

    %13
    do si la re, mi re do la
    si la si sol do4. si16 la
    re4 r8 re mi do16 si do8 sol

    %16
    re'4 re, sol8 la si la16 sol
    do8 re mi re16 do si8 la16 sol re'8 re,
    sol4 r r2

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s
    <7>4 <6> <5+>2
    s1
    s2 <6>
    s1
    s
    s2 <6>
    s1
    s
    s2 s8 <6> <6 5> s
    s4 <6> s <6>8 <6>
    s <6> <6> s4. <6>8 <6>
    <5>4 <6> <5> <6>
    s4 s8 <6> s2
    <4>4< 3> s4 <6>
    s <6> <6> <4>8 <3>

}


forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 50
    s1*18
    \bar "||"

}

Ialto = {
    \new Voice = "ista"
    <<\Ialton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIsopranon = \relative do'' {

    \autoBeamOff
    R4.*13
    mi,4.
    si'

    %16
    si16[(la)] sol[(la)] si[(do)]
    re8. mi16[(re8)]
    do8 re16[(do)] si8

    %19
    la4 sol8
    R4.*3\mbreak
    si8 do16[(si)] do[(re)]

    %24
    \parenthesize do8 si16[(la)] si8
    si8 do16[(si)] do[(re)](
    do8) si16[(la si8)]

    %27
    do16[(si)] do16[(si)] la[(sol)]
    fad8. mi16[(fad8)]
    si sol16[(fad)] sol[(mi)]

    %30
    si'4.~\mbreak
    si~
    si~

    %33
    si
    si8 do16[(si)] do[(si)]
    la[(sol)] la[(si)] la8

    %36
    la si16[la si la]
    sol4.
    mi'16[(re)] do[(si)] la[(sol)]

    %39
    fad8. mi16[(fad8)]
    si8 la16[(si)] sol[(la)]\mbreak
    fad4 mi8

    %42
    R4.
    r8 r mi'
    red4 mi8

    %45
    R4.*2
    si8 la16[(si)] sol[(la)]
    fad4 mi8

    %49
    r r sol
    fad4 mi8
    R4.*4

    %55
    mi'8 re16[(do)] si[(do)]
    re4 re8\mbreak
    R4.

    %58
    si8 do16[(si)] do[(re)]
    do8 si16[(la si8)]
    si8 do16[(si)] do[(re)]

    %61
    do8 si16[(la si8)]
    si8 do la
    si si16[(dod re8)]

    %64
    re re8. dod16(
    re4.)\mbreak
    re8 do16[(si)] la[(si)]

    %67
    do4 do8
    R4.
    red8 mi16[(red)]mi[(fad)]

    %70
    mi8 red16[(dod red8)]
    red8 mi16[(red)]mi[(fad)]
    mi8 red16[(dod red8)]

    %73
    re?8 mi dod\mbreak
    re16[(dod re dod)] si8
    si8 si8. lad16(

    %76
    si4.)
    si8 si8. lad16(
    si4.)

    %79
    mi,
    si'
    si16[(la)] sol[(la)] si[(do)]

    %82
    re8. mi16[(re8)]
    do8 re16[(do)] si8\mbreak
    la4 sol8

    %85
    R4.*3
    si8 do16[(si)] do[(re)]
    do8 si16[(la si8)]

    %90
    si8 do16[(si)] do[(re)]
    do8 si16[(la si8)]
    do16[(si)] do16[(si)] la[(sol)]

    %93
    fad8. mi16[(fad8)]
    si sol16[(fad)] sol[(mi)]
    si'4.~\mbreak

    %96
    si~
    si~
    si

    %99
    si8 do16[(si)] do[(si)]
    la[(sol)] la[(si)] la8
    la si16[(la si la)]

    %102
    sol4.
    mi'16[(re)] do[(si)] la[(sol)]
    fad8. mi16[(fad8)]

    %105
    si8 la16[(si)] sol[(la)]\mbreak
    fad4 mi8
    R4.

    %108
    r8 r mi'
    red4 mi8
    R4.*2

    %112
    si8 la16[(si)] sol[(la)]
    fad4 mi8
    r r sol

    %115
    fad4 mi8
    R4.*4

}

IItestoI = \lyricmode {

    Hæc est, hæc est Au -- ro -- ra spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta, spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, Au -- ro -- ra, spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta, di -- lec -- ta,
    spon -- si di -- lec -- ta, di -- lec -- ta.

    Val -- de de -- co -- ra  val -- de de -- co -- ra, ut sol e -- lec -- ta,
    ut sol e -- lec -- ta, e -- lec -- ta, val -- de de -- co -- ra, val -- de de -- co -- ra,
    ut sol e -- lec -- ta,  ut sol e -- lec -- ta, e -- lec -- ta, e -- lec -- ta.

    Hæc est, hæc est Au -- ro -- ra spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta, spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, Au -- ro -- ra, spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta, di -- lec -- ta,
    spon -- si di -- lec -- ta, di -- lec -- ta.

}

IIalton = \relative do' {

    \autoBeamOff
    R4.*15
    sol'16[(fad)] mi[(fad)] sol8
    fad4 sol8

    %18
    la re, sol
    fad4 sol8
    R4.*2

    %22
    fad8 red16[(dod)] red[(si)]
    mi4.~
    mi

    %25
    mi~
    mi\mbreak
    mi8 la16[(sol)] fad[(mi)]

    %28
    red8. dod16[(red8)]
    R4.
    fad8 sol16[(fad)] sol[(la)]

    %31
    sol8 fad16[(mi fad8)]
    fad8 sol16[(fad)] sol[(la)]
    sol8 fad16[(mi fad8)]

    %34
    sol8 la16[sol la sol]\mbreak
    fad[mi fad sol fad8]
    fad sol16[fad sol fad]

    %37
    mi4.
    mi8 la16[(sol)] fad[(mi)]
    red8. dod16[(red8)]

    %40
    sol8 fad16[(sol)] mi[(fad)]
    red4 mi8
    R4.

    %43
    r8 r sol\mbreak
    fad4 mi8
    R4.*2

    %47
    sol8 fad16[(sol)] mi[(fad)]
    red4 mi8
    r r mi

    %50
    red4 mi8
    R4.*5
    si'8 la16[(sold?)] fad[(sold!)]

    %57
    la4 la8\mbreak
    sold8 la16[(sold)] la[(si)]
    la8 sold16[(fad sold8)]

    %60
    sold8 la16[(sold)] la[(si)]
    la8 sold16[(fad sold8)]
    sold? la fad

    %63
    sold4 fad8
    sol? mi4
    re4.\mbreak

    %66
    R
    la'8 sol16[(fad)] mi[(fad)]
    sol4 sol8

    %69
    fad8 sol16[(fad)] sol[(la)]
    sol8 fad16[(mi fad8)]
    fad8 sol16[(fad)] sol[(la)]

    %72
    sol8 fad16[(mi fad8)]
    fad sol mi
    fad16[(mi fad mi)] re8\mbreak

    %75
    sol dod,4
    si4.
    sol'8 dod,4

    %78
    si4.
    R4.*2
    sol'16[(fad)] mi[(fad)] sol8

    %82
    fad4 sol8
    la re, sol
    fad4 sol8

    %85
    R4.*2
    fad8 red16[(dod)] red[(si)]
    mi4.~

    %89
    mi
    mi~
    mi\mbreak

    %92
    mi8 la16[(sol)] fad[(mi)]
    red8. dod16[(red8)]
    R4.

    %95
    fad8 sol16[(fad)] sol[(la)]
    sol8 fad16[(mi fad8)]
    fad8 sol16[(fad)] sol[(la)]

    %98
    sol8 fad16[(mi fad8)]
    sol8 la16[sol la sol]\mbreak
    fad[mi fad sol fad8]

    %101
    fad sol16[(fad sol fad)]
    mi4.
    mi8 la16[(sol)] fad[(mi)]

    %104
    red8. dod16[(red8)]
    sol8 fad16[(sol)] mi[(fad)]
    red4 mi8

    %107
    R4.
    r8 r sol\mbreak
    fad4 mi8

    %110
    R4.*2
    sol8 fad16[(sol)] mi[(fad)]
    red4 mi8

    %114
    r r mi
    red4 mi8
    R4.*4

}

IItestoII = \lyricmode {

    Hæc est Au -- ro -- ra spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta,
    Au -- ro -- ra, di -- lec -- ta, hæc est Au -- ro -- ra,
    spon -- si di -- lec -- ta, di -- lec -- ta,
    spon -- si di -- lec -- ta, di -- lec -- ta.

    Val -- de de -- co -- ra,  val -- de de -- co -- ra, ut sol e -- lec -- ta,
    ut sol e -- lec -- ta, e -- lec -- ta, val -- de de -- co -- ra, val -- de de -- co -- ra,
    ut sol e -- lec -- ta,  ut sol e -- lec -- ta, e -- lec -- ta, e -- lec -- ta.

    Hæc est Au -- ro -- ra spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta,
    Au -- ro -- ra, di -- lec -- ta, hæc est Au -- ro -- ra,
    spon -- si di -- lec -- ta, di -- lec -- ta,
    spon -- si di -- lec -- ta, di -- lec -- ta.

}

IItenoren = \relative do' {

    \autoBeamOff

    R4.*15
    mi8 mi mi
    re8. do16 [(si8)]

    %18
    la si16[(la)] sol8\mbreak
    re'4 sol,8
    R4.*3

    %23
    sold8 la16[(sold)] la[(si)]
    la8 sold16[(fad sold8)]
    sold la16[(sold)] la[(si)]

    %26
    la8 sold16[(fad sold8)]
    la la la
    si4 si8

    %29
    R4.\mbreak
    red8 mi16[(red)] mi[(fad)]
    mi8 red16[(dod red8)]

    %32
    red8 mi16[(red)] mi[(fad)]
    mi8 red16[(dod red8)]
    mi8 do4

    %35
    re4.
    re8 si4
    do16[si do re do8]\mbreak

    %38
    r8 la8. la16
    si4 si8
    sol la mi

    %41
    si'4 mi,8
    R4.
    r8 r mi

    %44
    si'4 mi,8
    R4.*2
    sol8 la mi

    %48
    si'4 mi,8
    r r mi
    si'4 mi,8\mbreak

    %51
    R4.*6
    la8 do la
    mi'4.

    %59
    mi4 mi8
    mi4.
    mi

    %62
    mi8 do re
    sold, sold16[(la si8)]
    sol8 la4

    %65
    re,4.
    R4.*2
    mi8 sol mi

    %69
    si'4.
    si4 si8\mbreak
    si4.

    %72
    si
    si8 sol la
    re,4 sol8

    %75
    mi fad4
    si4.
    sol8 la4

    %78
    re,4.
    R4.*2
    mi'8 mi mi

    %82
    mi 8.do16[(si8)]
    la si16[(la)] sol8
    re'4 sol,8\mbreak

    %85
    R4.*3
    sold8 la16[(sold)] la[(si)]
    la8 sold16[(fad sold8)]

    %90
    sold la16[(sold)] la[(si)]
    la8 sold16[(fad sold8)]
    la la la

    %93
    si4 si8
    R4.\mbreak
    red8 mi16[(red)] mi[(fad)]

    %96
    mi8 red16[(dod red8)]
    red8 mi16[(red)] mi[(fad)]
    mi8 red16[(dod red8)]

    %99
    mi8 do4
    re4.
    re8 si4

    %102
    do16[si do re do8]\mbreak
    r8 la8. la16
    si4 si8

    %105
    sol la mi
    si'4 mi,8
    R4.

    %108
    r8 r mi
    si'4 mi,8
    R4.*2

    %112
    sol8 la mi
    si'4 mi,8
    r r mi

    %115
    si'4 mi,8
    R4.*4

}

IItestoIII = \lyricmode {

    Hæc est Au -- ro -- ra spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta, spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta,
    Au -- ro -- ra, di -- lec -- ta, est Au -- ro -- ra,
    spon -- si di -- lec -- ta, di -- lec -- ta,
    spon -- si di -- lec -- ta, di -- lec -- ta.

    Ut sol e -- lec -- ta, e -- lec -- ta, ut sol e -- lec -- ta,
    e -- lec -- ta,  ut sol e -- lec -- ta, e -- lec -- ta,
    ut sol e -- lec -- ta, e -- lec -- ta
    e -- lec -- ta.

    Hæc est Au -- ro -- ra spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta, spon -- si di -- lec -- ta,
    hæc est Au -- ro -- ra, spon -- si di -- lec -- ta,
    Au -- ro -- ra, di -- lec -- ta, est Au -- ro -- ra,
    spon -- si di -- lec -- ta, di -- lec -- ta,
    spon -- si di -- lec -- ta, di -- lec -- ta.



}


IIvlIn = \relative do'' {

    mi,4.
    si'
    sol'8 sol sol

    %4
    fad8. fad16 sol8
    mi16 fad sol fad sol8
    fad4 sol8

    %7
    si16 la sol fad mi8\mbreak
    red8 mi la
    fad16  mi fad sol la8

    %10
    si la16 si sol la
    fad4 mi8
    si la16 si sol la

    %13
    fad4 mi8
    R4.*6\mbreak
    si''16 la sol fad mi8

    %21
    red mi la
    fad4 r8
    R4.*11

    %34
    sol16 fad mi8 r
    r fad16 mi fad sol
    la8 sol r

    %37
    R4.*5
    si8 la16 si sol la\mbreak
    fad4 mi8

    %44
    R4.
    si8 la16 si sol la
    fad4 mi8

    %47
    R4.
    r8 r sol'
    fad4 mi8

    %50
    R4.
    si'8 la16 si sol la
    fad4 mi8

    %53
    si la16 si sol la\mbreak
    fad4 mi8
    R4.*3

    %58
    mi'16 mi, mi mi mi mi
    mi8 mi'4
    mi16 mi, mi mi mi mi

    %61
    mi8 mi'4
    R4.*7
    si'16 si, si si si si

    %70
    si8 si'4\mbreak
    si16 si, si si si si
    si8 si'4

    %73
    R4.*3
    si16 si, si si si si
    si mi dod8. dod16

    %78
    red4.
    R4.*6
    si'16 la sol fad mi8

    %86
    red mi la\mbreak
    fad4 r8
    R4.*11

    %99
    sol16 fad mi8 r
    r fad16 mi fad sol
    la8 sol r

    %102
    R4.*5
    si8 la16 si sol la
    fad4 mi8

    %109
    R4.
    si8 la16 si sol la\mbreak
    fad4 mi8

    %112
    R4.
    r8 r sol'
    fad4 mi8

    %115
    R4.
    si'8 la16 si sol la
    fad4 mi8

    %118
    si la16 si sol la
    fad4 mi8

}

IIvlIIn = \relative do'' {

    R4.*2
    mi8 mi mi
    re16 mi re do si8

    %5
    do8. re16 do si
    la4 sol8\mbreak
    r8 si' la

    %8
    si16 la sol fad mi8
    red16 dod red mi fad8
    sol fad16 sol mi fad

    %11
    red4 mi8
    sol, fad16 sol mi fad
    red4 mi8

    %14
    R4.*6\mbreak
    r8 si'' la
    si16 la sol fad mi8

    %22
    red4 r8
    R4.*11
    mi8 la r

    %35
    r re,16 dod re mi
    fad8 re r
    R4.*5

    %42
    sol8 fad16 sol mi fad\mbreak
    red4 mi8
    R4.

    %45
    sol,8 fad16 sol mi fad
    red4 mi8
    R4.

    %48
    r8 r mi'
    red4 mi8
    R4.

    %51
    sol8 fad16 sol mi fad
    red4 mi8
    sol, fad16 sol mi fad\mbreak

    %54
    red4 mi8
    R4.*4
    mi'16 mi, mi mi mi mi

    %60
    mi8 mi'4
    mi16 mi, mi mi mi mi
    mi4 r8

    %63
    R4.*7
    si''16 si, si si si si
    si8 si'4\mbreak

    %72
    si16 si, si si si si
    si4 r8
    R4.*2

    %76
    re16 re, re' dod si la
    sol8 fad4
    fad4.

    %79
    R4.*6
    r8 si' la
    si16 la sol fad mi8

    %87
    red4 r8
    R4.*11
    mi8 la r

    %100
    r re,16 dod re mi
    fad8 re r
    R4.*5

    %107
    sol8 fad16 sol mi fad\mbreak
    red4 mi8
    R4.

    %110
    sol,8 fad16 sol mi fad
    red4 mi8
    R4.

    %113
    r8 r mi'
    red4 mi8
    R4.

    %116
    sol8 fad16 sol mi fad
    red4 mi8
    sol,8 fad16 sol mi fad

    %119
    red4 mi8

}

IIbcn = \relative do {

    mi'8 mi, mi'
    red si mi
    mi,8. fad16 sol la

    %4
    si8 re? mi
    la, si16 la sol8
    re' re, sol

    %7
    r sol do
    si mi do
    si4 la8

    %10
    sol la mi
    si'4 mi,8\mbreak
    mi' la,8. la16

    %13
    si4 mi,8
    mi' mi, mi'
    red si mi

    %16
    mi mi, mi'
    re16 mi re do si8
    la si16 la sol8

    %19
    re' re, sol
    r sol do
    si mi do

    %22
    si r r\mbreak
    sold la16 sold la si
    la8 sold16 fad sold8

    %25
    sold la16 sold la si
    la8 sold16 fad sold8
    la la la

    %28
    si4.
    r8 mi, mi'
    red mi16 red mi fad

    %31
    mi8 red16 dod red8\mbreak
    red mi16 red mi fad
    mi8 red16 dod red8

    %34
    mi do4
    re?4.
    re8 si4

    %37
    do8 do, do'16 si
    la8 la la
    si4.

    %40
    sol8 la mi
    si'4 mi,8
    sol la mi\mbreak   %% fine 4to sistema

    %43 OOKK
    si' si, mi
    si' si, mi
    sol la mi

    %46
    si' si, mi
    sol la mi
    si' si, mi

    %49
    si' si, mi
    si' si, mi
    sol la mi

    %52
    si' si, mi
    mi' la,8. la16
    si4 mi,8 \clef bass\key sol\major \mbreak

    %55
    mi4 r8
    si'4 r8
    la do la

    %58
    \clef tenor \key sol\major mi'4.
    mi4 mi,8
    mi'4.

    %61
    mi4 mi,8
    mi' do re
    sold,8. la16 si8

    %64
    sol8 la la,
    re4.
    \clef bass\key sol\major re4 r8

    %67
    la4 r8\mbreak
    mi' sol mi
    si'4.

    %70
    si,
    si'
    si,

    %73
    si'8 sol la
    re,4 sol8
    mi fad fad,

    %76
    si'8. la16 sol fad
    mi8 fad fad,
    si4.

    %79
    \clef tenor \key sol\major mi'8 mi, mi'
    red si mi\mbreak
    mi mi, mi'

    %82
    re16 mi re do si8
    la si16 la sol8
    re' re, sol

    %85
    r sol do
    si mi do
    si r r\mbreak

    %88
    sold la16 sold la si
    la8 sold16 fad sold8
    sold la16 sold la si

    %91
    la8 sold16 fad sold8
    la la la
    si4.

    %94
    r8 mi, mi'
    red mi16 red mi fad
    mi8 red16 dod red8\mbreak

    %97
    red mi16 red mi fad
    mi8 red16 dod red8
    mi do4

    %100
    re?4.
    re8 si4
    do8 do, do'16 si

    %103
    la8 la, la'
    si si, si'
    sol la mi

    %106
    si' si, mi
    sol la mi
    si' si, mi

    %109
    si' si,  mi\mbreak
    sol la mi
    si' si, mi

    %112
    sol la mi
    si' si, mi
    si' si, mi

    %115
    si' si, mi
    sol la mi
    si' si, mi

    %118
    mi' la,8. la16
    si4 mi,8

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <6>
    s4 <6>8
    s <6> <6>
    s4.
    <4>8 <3> s
    s s <6>
    <_+> s <6>
    <_+> s <6>
    <6> <6> <6>
    <_+>4.
    s8 <6>4
    <_+>4.
    s  %%% haec est aurora
    <6>
    s
    s4 <6>8
    <6>4.
    <4>8 <3> s
    s s <6>
    <_+> s <6>
    <_+>4.
    <6>
    s
    <6>
    s
    s
    <_+>
    s
    <6>
    s8 <6> s
    s4.
    s8 <6> s
    s <6>4
    s4.
    s8 <6>4
    s4.
    <6>
    <_+>
    <6>
    <_+>
    <6>
    <4>8 <_+> s
    <_+>4.
    <6>8 <6> s
    <4> <_+> s
    <6>4.
    <4>8 <_+> s
    <_+>4.
    <_+>
    <6>8 <6> s
    <4> <_+> s
    s <6>8. <5>16
    <_+>4.
    <_+>
    <5>8 <6+> s
    s <6> s
    <_+>4.
    s
    <_+>
    s
    <_+>8 <6> s
    <6>4.
    s8 <4> <_+>
    s4.
    s
    <_->\mbreak
    s8 <6> <_+>
    <_+>4.
    <_+>
    <_+>
    <_+>
    <_+>8 <6> <_+>
    s4.
    <6+ 5>8 <4> <_+>
    s4.
    <6+ 5>8 <4> <_+>
    <_+>4.

    %%ripresa
    s
    <6>
    s
    s4 <6>8
    s4.
    <4>8 <3> s
    s s <6>
    <_+> s <6>
    <_+>4.
    <6>
    s
    <6>
    s
    s
    <_+>
    s
    <6>
    s8 <6> s
    s4.
    s8 <6> s
    s <6>4
    s4.
    s8 <6>4
    s4.
    <6>
    <_+>
    <6>
    <_+>
    <6>
    <_+>
    <_+>
    <6>8 <6> s
    <4> <_+> s
    <6>4.
    <4>8 <_+> s
    <_+>4.
    <_+>
    <6>8 <6> s
    <4> <_+> s
    s <6>8. <5>16
    <_+>4.







}


forma = {

    \time 3/8
    \key sol\major
    \tempo 4. = 35
    s4.*119
    \bar "||"

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIsoprano = {
    \new Voice = "giusto1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "giusto2"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "giusto3"
    <<\IItenoren \forma>>
}

IIbc = {
    \clef tenor
    <<\IIbcn \forma \IIbfn>>
}




IIIsopranon = \relative do'' {

    \autoBeamOff
    si4 sol r re'8 si
    mi4 mi8 mi do4 do
    r8 sol16 sol do8 re16 mi la,4 la

    %4
    r8 re do16 [(si)] do8 si4 si
    r re si8 si do re
    mi4 mi r mi

    %7
    mi8 si do re\mbreak do4 do
    r8 la4 do16 [si do la] do4 mi16 [re]
    mi4 r8 mi mi4 red8 red

    %10
    mi si re4. re8 mi mi16 si
    do8 do do la mi'2~
    mi\mbreak r8 mi, [do' re16 do]

    %13
    si1~
    si8 [la] sol16[fad sol fad] mi2~
    mi4 r16 mi [fad sol] la[ si sol la] fad4

    %16
    mi2\mbreak r
    R1

}

IIItestoI = \lyricmode {

    Un -- de, unde, _ for -- mæ tam bel -- læ sine _ la -- be con -- ceptæ _
    et pra -- vi -- ta -- te. Tam pu -- ram cla -- ri -- tatem _ tam cla -- ram pu -- ri -- ta -- tem
    sol - - - -  et lu -- na mi -- rantur, _ et in esta - sim rapti _ con -- tem -- plan - - - - - - - tur.

}

IIIbcn = \relative do {

    sol'1
    mi~
    mi2 fad~

    %4
    fad sol~
    sol1
    sold~

    %7
    sold2\mbreak la~
    la1
    sol2 fad

    %10
    sold1
    la2 r8 sold la sold
    la si do si\mbreak la4 r

    %13
    r8 red, mi red mi fad sol fad
    mi4 mi'4. re8 do16 si do si
    la8 sol la16 sol la sol fad8 mi si' si,

    %16
    do16 si do si la8 la'~la sol la sol
    fad mi si' si, mi4 r

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <5>2 <6>
    s <6>
    <6>4 <5-> s2
    s1
    <6>
    s1
    s
    <6>2 <7>4 <6+>
    <6>4 <5-> s2
    s s8 <6> s4
    s4 <6> s2
    s8 <6> s4 s <6>
    s2 s8 <4 2> <6>4
    s2 <6+>4 <5 4>8 <_+>

}


forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 55
    s1*17
    \bar "||"

}

IIIsoprano = {
    \new Voice = "unde"
    <<\IIIsopranon \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}




IVsopranon = \relative do'' {

    \autoBeamOff
    R1*5
    la16^\markup\italic"Solo"[(si la8)] si16[(dod si8)] dod4 re8 mi
    mi,4 fad8[(sold)] la sold la4

    %8
    R1
    r2 la16[(si la8)] si16[(dod si8)]
    dod4 re8 mi mi,4 fad8 sold\mbreak

    %11
    la[(sold)] la4 mi'4. mi8
    mi1~
    mi2 mi4 r8 mi

    %14
    dod4 re8 dod si[dod16 si] dod8[si16 dod]
    la8[si16 la] si8[la16 si]sold8[la16 sold] la8[sold16 la]\mbreak
    fad8[si16 la] si8[la16 si] sold8 sold r mi'

    %17
    si[mi] dod16 [re mi8] sold,4 r8 mi'
    si[mi] dod16 [re mi8] sold,8 [mi'] dod16 [re mi8]
    mi, la la8. sold16(la4) r\mbreak

    %20
    mi'4. mi8 mi2~
    mi1
    mi4 r8 mi dod4 re8 dod

    %23
    si8[dod16 si] dod8[si16 dod] la8[si16 la] si8[la16 si]
    sold8[la16 sold] la8[sold16 la] fad8[si16 la] si8[la16 si]\mbreak
    sold8 sold r mi' si[mi] dod16 [re mi8]

    %26
    sold,4 r8 mi' si[mi] dod16 [re mi8]
    sold,[mi'] dod16 [re mi8] mi, la la8. sold16(
    la4) r r2

    %29
    R1\mbreak
    re4 la re re8 mi
    fad[mi] re mi fad[mi] re4

    %32
    fad, si16[(la si8)] sold4 dod
    la re16[(dod re8)] si4 mi8 mi\mbreak
    fad[mi] re mi16[re] dod4 r8 fad

    %35
    dod[fad] re16 [mi fad8] lad,4 r8 fad'
    dod[fad] re16 [mi fad8] lad,[fad'] re16 [mi fad8]
    fad, si si8. lad16(si4) r\mbreak

    %38
    r2 re4 la
    re re8 mi fad[mi] re mi
    fad[mi] re4 fad, si16[(la si8)]

    %41
    sold4 dod la re16[(dod re8)]
    si4 mi8 mi\mbreak fad[mi] re mi16[re]
    dod4 r8 fad si,[fad'] re16 [mi fad8]

    %44
    lad,4 r8 fad' dod[fad] re16 [mi fad8]
    lad,[fad'] re16 [mi fad8]\mbreak fad, si si8. lad16(
    si4) r r2

    %47
    R1*5
    la16[(si la8)] si16[(dod si8)] dod4 re8 mi
    mi,4 fad8[(sold)] la sold la4

    %54
    R1
    r2 la16[(si la8)] si16[(dod si8)]
    dod4 re8 mi mi,4 fad8 sold\mbreak

    %57
    la[(sold)] la4 mi'4. mi8
    mi1~
    mi2 mi4 r8 mi

    %60
    dod4 re8 dod si[dod16 si] dod8[si16 dod]
    la8[si16 la] si8[la16 si]sold8[la16 sold] la8[sold16 la]\mbreak
    fad8[si16 la] si8[la16 si] sold8 sold r mi'

    %63
    si[mi] dod16 [re mi8] sold,4 r8 mi'
    si[mi] dod16 [re mi8] sold,8 [mi'] dod16 [re mi8]
    mi, la la8. sold16(la4) r\mbreak

    %66
    mi'4. mi8 mi2~
    mi1
    mi4 r8 mi dod4 re8 dod

    %69
    si8[dod16 si] dod8[si16 dod] la8[si16 la] si8[la16 si]
    sold8[la16 sold] la8[sold16 la] fad8[si16 la] si8[la16 si]\mbreak
    sold8 sold r mi' si[mi] dod16 [re mi8]

    %72
    sold,4 r8 mi' si[mi] dod16 [re mi8]
    sold,[mi'] dod16 [re mi8] mi, la la8. sold16(
    la4) r r2

}

IVtestoI = \lyricmode {

    Hanc Au -- roram _ con -- fla -- grans ar -- dore, _
    hanc Au -- roram _ con -- fla -- grans ar -- do -- re,
    sol æ -- ter -- nus, ah quantum _ a -- ma - - - - - - - - vit, a -- ma - - - - - - - vit,
    a -- ma -- vit, sol æ -- ter -- nus, ah quantum _ a -- ma - - - - - - - - vit,
    a -- ma - - - - - - - vit, a -- ma -- vit.

    Ip -- sam re -- plens cœ -- les -- ti can -- do -- re, si -- bi
    spon -- sam si -- bi  spon -- sam et si -- bi ma -- trem vo -- ca - - - - - - - vit, vo -- ca -- vit.
    Ip -- sam re -- plens cœ -- les -- ti can -- do -- re, si -- bi
    spon -- sam si -- bi  spon -- sam et si -- bi ma -- trem vo -- ca - - - - - - - vit, vo -- ca -- vit.

    Hanc Au -- roram _ con -- fla -- grans ar -- dore, _
    hanc Au -- roram _ con -- fla -- grans ar -- do -- re,
    sol æ -- ter -- nus, ah quantum _ a -- ma - - - - - - - - vit, a -- ma - - - - - - - vit,
    a -- ma -- vit, sol æ -- ter -- nus, ah quantum _ a -- ma - - - - - - - - vit,
    a -- ma - - - - - - - vit, a -- ma -- vit.

}


IVvlIn = \relative do'' {

    dod8 re16 mi la,8 dod si4 r
    R1
    r2 dod8 re16 mi la,8 dod

    %4
    si4 r8 mi si8 mi dod16 re mi8
    sold, mi' dod16 re mi8 mi, la la8. sold16\mbreak
    la4 r r2 %%% hanc auroram

    %7
    r r4 r8 mi'
    si mi dod16 re mi8 sold, mi' dod16 re mi8
    mi, la la8. sold16 la4 r

    %10
    R1
    r4 r8 mi' si mi dod16 re mi8\mbreak
    sold, mi' dod16 re mi8 si mi dod16 re mi8

    %13
    sold, mi' dod16 re mi8 mi, la la8. sold16
    la8 la' fad4 sol8 fad mi fad16 mi
    fad8 mi16 fad re8 mi16 re\mbreak mi8 re16 mi dod8 re16 dod

    %16
    re8 re16 dod re8 dod16 re si8 si r4
    r8 si la16 si dod8 si4 r
    r8 si la16 si dod8 si sold la16 si dod8

    %19
    mi16 re dod8 si4\mbreak la r8 mi'
    si mi dod16 re mi8 sold, mi' dod16 re mi8
    si mi dod16 re mi8 sold, mi' dod16 re mi8

    %22
    mi, la la8. sold16 la8 la' fad4\mbreak
    sol8 fad mi fad16 mi fad8 mi16 re mi8 re
    mi re16 mi dod8 re16 dod re8 re16 dod re8 dod16 re

    %25
    si8 mi dod16 re mi8 sold,4 r
    r8 mi' dod16 re mi8 sold,4 r\mbreak
    r8 sold8 la si16 dod dod8 re16 dod si4

    %28
    la r8 la' mi la fad16 sol la8
    dod, la' fad16 sol la8 la, re re8. dod16
    re4 r r2

    %31
    r r8 la' fad16 sol la8\mbreak
    re,16 mi fad8 re, \once\stemDown fad' si, mi mi,16 fad sold8
    la la' re,,16 mi fad8 mi mi' mi,16 fad sold8

    %34
    dod, dod' fad, si lad4 r
    r2 r8 fad' re16 mi fad8\mbreak
    lad,4 r r8 lad si16 dod re8

    %37
    fad16 mi re8 dod4 si8 fad' re16 mi fad8
    sol16 la si8 dod,16 re mi8 fad4 r
    R1

    %40
    r8 la fad16 sol la8 re,16 mi fad8 re, \once\stemDown fad'\mbreak
    si, mi mi,16 fad sold8 la la' re,,16 mi fad8
    mi mi' mi,16 fad sold8 dod, dod' fad, si

    %43
    lad4 r r2
    r8 fad' re16 mi fad8 lad,4 r\mbreak
    r8 lad si16 dod re8 fad mi16 re dod4

    %46
    si r r2
    dod8 re16 mi la,8 dod si4 r
    R1

    %49
    r2 dod8 re16 mi la,8 dod
    si4 r8 mi si mi dod16 re mi8\mbreak
    sold, mi' dod16 re mi8 mi, la la8. sold16

    %52
    la4 r r2
    r r4 r8 mi'
    si mi dod16 re mi8 sold, mi' dod16 re mi8

    %55
    mi, la la8. sold16 la4 r
    R1
    r4 r8 mi' si mi dod16 re mi8\mbreak

    %58
    sold, mi' dod16 re mi8 si mi dod16 re mi8
    sold, mi' dod16 re mi8 mi, la la8. sold16
    la8 la' fad4 sol8 fad mi fad16 mi

    %61
    fad8 mi16 fad re8 mi16 re\mbreak mi8 re16 mi dod8 re16 dod
    re8 re16 dod re8 dod16 re si8 si r4
    r8 si la16 si dod8 si4 r

    %64
    r8 si la16 si dod8 si sold la16 si dod8
    mi16 re dod8 si4\mbreak la r8 mi'
    si mi dod16 re mi8 sold, mi' dod16 re mi8

    %67
    si mi dod16 re mi8 sold, mi' dod16 re mi8
    mi, la la8. sold16 la8 la' fad4\mbreak
    sol8 fad mi fad16 mi fad8 mi16 re mi8 re

    %70
    mi re16 mi dod8 re16 dod re8 re16 dod re8 dod16 re
    si8 mi dod16 re mi8 sold,4 r
    r8 mi' dod16 re mi8 sold,4 r\mbreak

    %73
    r8 sold8 la si16 dod dod8 re16 dod si4
    la4 r r2

}

IVbcn = \relative do {

    la'4 r mi r8 re'
    si mi dod16 re mi8 sold, mi' dod16 re mi8
    mi, la re, mi la,4 r

    %4
    mi'8 mi' si dod sold4 la
    mi la dod,16 si la8 mi' mi,\mbreak
    la4 mi' la, r   %%% inizia

    %7
    r8 dod re mi la, si dod4
    sold la mi' la
    dod,16 si la8 mi' mi, la4 mi'

    %10
    la,4 r r8 dod re mi
    la, si dod4 sold la\mbreak
    mi' la sold la

    %13
    mi r8 la dod,16 si la8 mi' mi,
    la4 r r2
    R1

    %16
    r2 r8 mi'' dod16 re mi8
    sold,4 la mi8 mi' dod16 re mi8
    sold,4 la mi r8 la\mbreak

    %19
    dod,16 si la8 mi' mi, la4 r
    sold la mi' la
    sold la mi r8 la

    %22
    dod,16 si la8 mi' mi, la4 r
    R1*2\mbreak
    r2 r8 mi' la16 si dod8

    %26
    mi,4 r r8 mi la16 si dod8
    mi,4 r8 la dod, si16 la mi'8 mi,
    la4 r dod' re

    %29
    la r8 re fad,16 mi re8 la' la,
    re4 re'8 dod si la sol4\mbreak
    fad4 sol re r

    %32
    re r mi r
    fad r sold r
    lad si r8 fad dod re

    %35
    lad4 si fad r
    r8 fad' si16 dod re8 fad,4 r8 si
    re,16 dod si8 fad' fad,\mbreak si4 r8 si'

    %38
    mi,4 r8 la re,4 re'8 dod
    si la sol4 fad sol
    re r re r

    %41
    mi r fad r
    sold r la si
    r8 fad dod re lad4 si

    %44
    fad r\mbreak r8 fad' si16 dod re8
    fad,4 r8 si re,16 dod si8 fad' fad,
    si4 r8 si' sold si mi,16 fad sold8

    %47
    la4 r mi r8 mi'
    si mi dod16 re mi8 sold, mi' dod16 re mi8\mbreak
    mi, la re, mi la,4 r

    %50
    mi'8 mi' si dod sold4 la
    mi la dod,16 si la8 mi' mi,
    la4 mi' la, r

    %53
    r8 dod re mi la, si dod4
    sold la mi' la
    dod,16 si la8 mi' mi, la4 mi'

    %56
    la,4 r r8 dod re mi
    la, si dod4 sold la\mbreak
    mi' la sold la

    %59
    mi r8 la dod,16 si la8 mi' mi,
    la4 r r2
    R1

    %62
    r2 r8 mi'' dod16 re mi8
    sold,4 la mi8 mi' dod16 re mi8
    sold,4 la mi r8 la\mbreak

    %65
    dod,16 si la8 mi' mi, la4 r
    sold la mi' la
    sold la mi r8 la

    %68
    dod,16 si la8 mi' mi, la4 r
    R1*2
    r2 r8 mi' la16 si dod8

    %72
    mi,4 r r8 mi la16 si dod8
    mi,4 r8 la dod, si16 la mi'8 mi,
    la4 r r2

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <_+>
    <6+>8 <_+> <6> <_+> <6> <_+> <6> <_+>
    <_+>4 <6 5>8 <_+> s2
    <_+>4 <6+>8 <6> <6>2
    <_+> <6>4 <4>8 <_+>
    s4 <_+> s2  %% inizia qui
    s4 s8 <_+> s <6+> <6>4
    <6>2 <_+>
    <6>4 <4>8 <_+> s4 <_+>
    s2 s4 s8 <_+>
    s <6+> <6>4 <6>2
    <_+> <6>
    <_+> <6>4 <4>8 <_+>
    s1*2
    s2 s8 <_+> <6> <_+>
    <6>2 <_+>4 <6>8 <_+>
    <6>2 <_+>
    <6>4 <4>8 <_+> s2
    <6> <_+>
    <6> <_+>
    <6>4 <4>8 <_+> s2
    s1*2   %%% fin qui OOKK
    s2 s8 <_+> s <6>
    <_+>2 s4 s8 <6>
    <_+>2 <6>4 <4>8 <_+>
    s2 <6>
    s <6>4 <4>8 <3>
    s2 <6>
    <6>1
    <6>2 <_+>
    <6> <6>
    <6> s8 <_+> <6+> <6>
    <6>2 <_+>
    s8 <_+> s <6> <_+>2  %%% fine hanc
    <6>4 <4>8 <_+> s2
    s1
    <6>2 <6>
    s1
    <_+>2 <6>
    <6> <6>
    s8 <_+> <6+> <6> <6>2
    <_+> s8 <_+> s <6>
    <_+>2 <6>4 <4>8 <_+>
    s2 <6>4 <_+>
    s2 <_+>
    <6+>8 <_+> <6> <_+> <6> <_+> <6> <_+>
    <_+>4 <6 5>8 <_+> s2
    <_+>4 <6+>8 <6> <6>2
    <_+> <6>4 <4>8 <_+>
    s4 <_+> s2  %% inizia qui
    s4 s8 <_+> s <6+> <6>4
    <6>2 <_+>
    <6>4 <4>8 <_+> s4 <_+>
    s2 s4 s8 <_+>
    s <6+> <6>4 <6>2
    <_+> <6>
    <_+> <6>4 <4>8 <_+>
    s1*2
    s2 s8 <_+> <6> <_+>
    <6>2 <_+>4 <6>8 <_+>
    <6>2 <_+>
    <6>4 <4>8 <_+> s2
    <6> <_+>
    <6> <_+>
    <6>4 <4>8 <_+> s2
    s1*2   %%% fin qui OOKK
    s2 s8 <_+> s <6>
    <_+>2 s4 s8 <6>
    <_+>2 <6>4 <4>8 <_+>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    s1*74
    \bar "||"

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVsoprano = {
    \new Voice = "hanc"
    <<\IVsopranon \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}





VvlIn = \relative do'' {

    r4 r8 la' mi la fad16 sol la8
    dod, la' fad16 sol la8 red, si' sol16 la si8
    si, si' sol16 la si8 la, la' fad16 sol la8
    sol, sol' mi16 fad sol8\mbreak fad, fad' re16 mi fad8
    mi, mi' dod16 re mi8 sold,4 r
    r8 mi' dod16 re mi8 mi, la la8. sold16
    la4 r r2
    la4 r r8 dod' si8. si16
    la4 r r2

}

VvlIIn = \relative do'' {

    r8 mi dod16 re mi8 r mi la, fad'
    mi dod re mi fad red si4
    r8 fad' si,4 r8 red si4
    r8 fad' si,4 r8 mi la,4\mbreak
    r8 re la' mi dod dod fad re
    si si mi,4 r8 mi' dod16 re mi8
    la,4 r r8 dod si8. si16
    dod8 la' fad16 sold la8 mi la la8. sold16\mbreak
    la4 r r2

}

Vbcn = \relative do {

    r4 r8 la' dod4 re
    la re,8 do si4 mi
    red mi si' mi,
    red  mi dod? re!
    si dod la si
    sold la mi' mi,
    la r8 la'\mbreak dod,16 si la8 mi' mi,
    la4 r8 re dod16 si la8 mi' mi,
    la4 r r2

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    s2 <_+>4 <_!>
    <6>2 <7 _+>
    <6> <4 3>
    <4 3>4 <6> <7+ 5 3> <_->
    <6 5->2 <6 4>4 <5 _+>
    s2 <6>4 <4>8 <_+>
    s2 <6>4 <4>8 <_+>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    s1*9
    \bar "||"

}

VvlI = {
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}




VItenoren = \relative do' {

    \autoBeamOff

    la4 la do re8 dod!
    re re r fad re8. re16 re8 la
    si si r si re re re mi
    mi mi r mi\mbreak mi si dod re
    dod dod r la re re r re
    fad fad r re16 mi si8 si r si
    dod re mi dod la la re la\mbreak
    si16[la si dod] re[la si dod] re[la si dod] re4~
    re dod re2

}

VItestoIII = \lyricmode {

    Pro -- cul quæ -- so tor -- pores _ o vi --  giles _ fi -- deles, _
    hanc lu -- cem si vi -- detis _ quid ad -- huc su -- sti -- netis. _ Ve -- nite, _  ve -- nite, _
    exul - temus, _ et dor -- mi -- tantes _ ly -- ras ex -- ci -- te - - - - mus.

}

VIbcn = \relative do {

    fad1~
    fad
    sol
    sold
    la2 fad~\mbreak
    fad sol
    mi fad
    sol4 r fad4. re8
    la2 re

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6>
    s
    <6>
    <_+>2 <6>
    s1
    <6+>2 <5>4 <6>
    s2 <6>
    <5 4+>

}


forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 60
    s1*9
    \bar "||"

}

VItenore = {
    \new Voice = "procul"
    <<\VItenoren \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
}




VIItenoren = \relative do' {

    \autoBeamOff
    R1*2
    r2 r4 r8 re
    si la16[(si sol8)] mi' si la si do
    
    %5
    re4 la si8 la si4
    la r re2~
    re re4 re
    
    %8
    re mi\mbreak re8 do do[(si)]
    la si do4. si8 do si
    do si do re si4 re
    
    %11
    do8 si si[(la)] sol si do4~
    do8 si do si\mbreak do si do re
    si4 re do8 si si[(la)]
    
    %14
    sol4 r r2
    R1*4
    r4 r8 re' re dod re mi
    
    %20
    fa4 fa mi8 re re[(dod)]\mbreak
    re2~re4 re
    do8 do do[(si)] do2~
    
    %23
    do1~
    do2 r4 r8 mi
    mi mi re re dod4 fa
    
    %26
    mi8 re re[(dod)] re4 fa\mbreak
    mi8 re re[(dod)] re4 r
    R1*2
    
    %30
    r2 r4 r8 re
    si la16[(si sol8)] mi' si la si do
    re4 la si8 la si4
    
    %33
    la r re2~
    re re4 re
    re mi\mbreak re8 do do[(si)]
    
    %36
    la si do4. si8 do si
    do si do re si4 re
    do8 si si[(la)] sol si do4~
    
    %39
    do8 si do si\mbreak do si do re
    si4 re do8 si si[(la)]
    sol4 r r2
    
    %42
    R1*5

}

VIItestoIII = \lyricmode {
   
   O ni -- mis, o ni -- mis cla -- ra lux, gra -- ti splen -- do -- res, 
   o cla -- ra lux, gra -- ti splen -- do -- res, o ni -- mis cla -- ra,
   ni -- mis cla -- ra lux, gra -- ti splen -- do -- res, 
   o ni -- mis cla -- ra, ni -- mis cla -- ra lux, gra -- ti splen -- do -- res.
   
   Non ha -- bet lac et nix tan -- tos can -- do -- res, tan -- tos can -- do -- res,
   non ha -- bet lac et nix tan -- tos can -- do -- res, tan -- tos can -- do -- res.
   
   O ni -- mis, o ni -- mis cla -- ra lux, gra -- ti splen -- do -- res, 
   o cla -- ra lux, gra -- ti splen -- do -- res, o ni -- mis cla -- ra,
   ni -- mis cla -- ra lux, gra -- ti splen -- do -- res, 
   o ni -- mis cla -- ra, ni -- mis cla -- ra lux, gra -- ti splen -- do -- res.

}


VIIvlIn = \relative do'' {

    R1*5
    r4 r8 re si la si do
    re la si la si la si do16 si

    %8
    la4 do fad, mi
    mi la'4. sold8 la sold
    la sold la si\mbreak sol4 si

    %11
    la8 sol sol fad sol4 r8 mi
    la sold la sold la sold la si
    sol!4 si la8 sol sol fad

    %14
    sol4 r8 si, la la la la\mbreak
    la la la la la si do4~
    do8 si do si do si do re

    %17
    si4 re do8 si si la
    sol4 si' la8 sol sol fad
    sol4 r r2

    %20
    R1\mbreak
    r4 r8 fad fad mi fad mi16 re
    do8 sol  sol4 sol r8 sol

    %23
    sol fad sol la sib4. sib8
    la8 sol la4 sol r8 do
    do do la la la4 re

    %26
    sib la\mbreak fa?8 sol la4
    sol8 fa? fa mi fa mi fa sol
    la4 r r2

    %29
    R1*4
    r4 r8 re si la si do
    re la si la si la si do16 si

    %35
    la4 do fad, mi
    mi la'4. sold8 la sold
    la sold la si\mbreak sol4 si

    %38
    la8 sol sol fad sol4 r8 mi
    la sold la sold la sold la si
    sol!4 si la8 sol sol fad

    %41
    sol4 r8 si, la la la la\mbreak
    la la la la la si do4~
    do8 si do si do si do re

    %44
    si4 re do8 si si la
    sol4 si' la8 sol sol fad
    sol4 r r2

}

VIIvlIIn = \relative do'' {

    R1*5
    r4 r8 fad, sol fad sol mi
    fad8. fad16 sol8 fad sol fad sol la16 sol

    %8
    fad8 sol la4. la8 la sold
    la4 r mi4. re8
    mi re mi4 mi sol?\mbreak

    %11
    mi4 re re r8 la'
    mi4. re8 mi re mi4
    mi sol mi re

    %14
    re r8 sol fad mi fad mi
    fad mi fad mi fad4 r8 sold'
    la sold la sold\mbreak la sold la si

    %17
    sol!4 si la8 sol sol fad
    sol4 re do8 si si la
    sol4 r r2

    %20
    R1
    r4 r8 la la sol la sol16 fad
    mi8 mi' mi re\mbreak do4 r8 mi,

    %23
    mi re mi fad sol4. sol8
    fad mi fad4 mi r8 sol
    sol sol fad fad mi4 la

    %26
    sol8 fa? fa mi re4 re'
    sib la la8 sol la sol\mbreak
    fad4 r r2

    %29
    R1*4
    r4 r8 fad sol fad sol mi
    fad8. fad16 sol8 fad sol fad sol la16 sol

    %35
    fad8 sol la4. la8 la sold
    la4 r mi4. re8
    mi re mi4 mi sol?\mbreak

    %38
    mi4 re re r8 la'
    mi4. re8 mi re mi4
    mi sol mi re

    %41
    re r8 sol fad mi fad mi
    fad mi fad mi fad4 r8 sold'
    la sold la sold\mbreak la sold la si

    %44
    sol?4 si la8 sol sol fad
    sol4 re do8 si si la
    sol4 r r2

}

VIIbcn = \relative do {

    re4 r8 re' si8 la si do
    re4 r8 fad, sol fad sol fad16 mi
    re4 r8 si do sol re' re,  %% o nimis
    
    %4
    sol4 r sol' r
    si,8 do re4 sol8 fad sol sol,
    re'2 re\parenthesize ~
    
    %7
    re re~\mbreak
    re4 do re mi
    la, r la' r
    
    %10
    la, r mi' si
    do re sol la
    la, r la' r
    
    %13
    mi si do re
    sol, r8 sol' re' dod re dod
    re dod re dod re4 r\mbreak
    
    %16
    la r la, r
    mi' si do re
    mi si do re
    
    %19
    sol r8 sol fa mi re dod
    re4 r8 re sol4 la
    re, r re r
    
    %22
    mi8 do sol' sol, do4 r
    do r do r\mbreak
    do r do r
    
    %25
    do re la' fa
    sol la sib fa
    sol la re, r
    
    %28
    re4 r8 re' si8 la si do
    re4 r8 fad, sol fad sol fad16 mi
    re4 r8 si do sol re' re,  %% o nimis
    
    %31
    sol4 r sol' r
    si,8 do re4 sol8 fad sol sol,
    re'2 re
    
    %34
    re re~\mbreak
    re4 do re mi
    la, r la' r
    
    %37
    la, r mi' si
    do re sol la
    la, r la' r
    
    %40
    mi si do re
    sol, r8 sol' re' dod re dod
    re dod re dod re4 r\mbreak
    
    %43
    la r la, r
    mi' si do re
    mi si do re
    
    %46
    sol, r r2

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2 <6>
    s4 s8 <6> s <6> s4
    s4 s8 <6> s4 <4>8 <3>
    s1
    <6>
    s2 <6 4>
    <5> <6 4>  
    <5>4 <6> s <_+>
    s1
    s2 s4 <6>
    <6>1
    s
    <_->4 <6> <6 5> <6 4>8 <5 3>
    s2 s8 <6> s <6>
    s <6> s <6> s2
    <_->1
    s4 <6> <6 5> <6 4>8 <5 3>
    s4 <6> <6 5> <6 4>8 <5 3>
    s2 <6>
    <_-> s4 <4+>
    s1
    s4 <4>8 <3> s2
    s <7->
    <6 4> <5>
    s <_+>4 <6>
    <_-> <_+> s <6>
    <6 5 _-> <4+> <_+> s
    s2 <6>
    s4 s8 <6> s <6> s4
    s4 s8 <6> s4 <4>8 <3>
    s1
    <6>
    s2 <6 4>
    <5> <6 4>  
    s4 <6> s <_+>
    s1
    s2 s4 <6>
    <6>1
    s
    s4 <6> <6 5> <6 4>8 <5 3>
    s2 s8 <6> s <6>
    s <6> s <6> s2
    s1
    s4 <6> <6 5> <6 4>8 <5 3>
    s4 <6> <6 5> <6 4>8 <5 3>
    
}


forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 60
    s1*46
    \bar "||"

}

VIIvlI = {
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    <<\VIIvlIIn \forma>>

}

VIItenore = {
    \new Voice = "nimis"
    <<\VIItenoren \forma>>
}

VIIbc = {
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
}




VIIIalton = \relative do' {

    \autoBeamOff
    
    mi4 r8 sol mi mi mi sol 
    re8.[mi16] re[mi re mi] fa8 fa fa sol
    mi mi r sol mi mi fad? sol
    fad8.[sol16] fad[sol la sol]\mbreak fad8 fad fad sol
    sol4 sol r2\fermata

}

VIIItestoII = \lyricmode {
   
   Quis, quis tuam _ de -- can -- ta - - bit cla -- ri -- ta -- tem qua vin -- cit 
   An -- ge -- lo - - rum pu -- ri -- ta -- tem. 

}

VIIIbcn = \relative do {

    do1
    si
    do
    la
    sol

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1
    <5>2 <5->
    s1
    <6>

    

}


forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 60
    s1*5
    \bar "||"

}

VIIIalto = {
    \new Voice = "quis"
    <<\VIIIalton \forma>>
}

VIIIbc = {
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
}




IXsopranon = \relative do'' {

    \autoBeamOff

    R4.*9
    mi8 red16[(mi red8)]
    mi8. fad16 mi8

    %12
    mi si r
    mi red16[(mi red8)]
    mi8. fad16 mi8

    %15
    mi si r
    mi si dod\mbreak
    re?8. dod16 re8

    %18
    si re mi
    red4.
    R

    %21
    fad,8 sol16[(la sol8)]
    fad8. mi16 fad8
    R4.

    %24
    fad8 sol16[(la sol8)]
    fad8. mi16 fad8
    R4.

    %27
    fad8 fad sol\mbreak
    la8. la16 la8
    la sol16[(fad)] sol[(la)]

    %30
    fad4.
    R
    la8 sol16[(fad)] sol[(la)]

    %33
    fad4.
    red'8 mi4
    dod8. dod16 re8

    %36
    si do?4
    do8. do16 si8\mbreak
    si si si

    %39
    do8. do16 si8
    la sol16[(la)] fad[(sol)]
    mi4.

    %42
    mi'8 si4
    si8 si si
    do8. do16 si8

    %45
    la sol fad16[(sol)]
    mi4.
    mi'8 si4\mbreak

    %48
    R4.*10
    si8 mi4
    mi8. mi16  re8

    %60
    re8 dod16[(re dod8)]
    re8. dod16 si8
    mi fad sol

    %63
    fad4 si,8
    re8. dod16 si8
    si4.

    %66
    R4.*4\mbreak
    re8 si16[(do si8)]
    do8. si16 do8

    %72
    do la16[(si la8)]
    si8. la16 si8
    re re re

    %75
    re do16 si do8
    do do do
    do4 si8

    %78
    la8. la16 si8\mbreak
    sol4.
    re'8. do16 si8

    %81
    la8. la16 si8
    sol4.
    R4.*6

    %89
    mi'8 re4
    dod8. dod16 re8
    re la4

    %92
    mi'8 re4
    dod8. dod16 re8
    re la4

    %95
    re8 re re\mbreak
    dod4 si8
    lad8. lad16 si8

    %98
    lad4.
    re8. dod16 si8
    si8. si16 lad8

    %101
    si4.
    si8. si16 lad8
    si4.

    %104
    R4.*9
    mi8 red16[(mi red8)]
    mi8. fad16 mi8

    %115
    mi si r
    mi red16[(mi red8)]
    mi8. fad16 mi8

    %118
    mi si r
    mi si dod\mbreak
    re?8. dod16 re8

    %121
    si re mi
    red4.
    R

    %124
    fad,8 sol16[(la sol8)]
    fad8. mi16 fad8
    R4.

    %127
    fad8 sol16[(la sol8)]
    fad8. mi16 fad8
    R4.

    %130
    fad8 fad sol
    la8. la16 la8
    la sol16[(fad)] sol[(la)]

    %133
    fad4.
    R
    la8 sol16[(fad)] sol[(la)]

    %136
    fad4.
    red'8 mi4
    dod8. dod16 re8

    %139
    si do?4
    do8. do16 si8\mbreak
    si si si

    %142
    do8. do16 si8
    la sol16[(la)] fad[(sol)]
    mi4.

    %145
    mi'8 si4
    si8 si si
    do8. do16 si8

    %148
    la sol16[(la)] fad[(sol)]
    mi4.
    \parenthesize R

}

IXtestoI = \lyricmode {

    A -- ve lac -- tea, _ a -- ve  si -- ne ma -- cula, _ a -- ve sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, a -- ve lac -- tea _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux,  au -- ro -- ræ lux, a -- ve lac -- tea, _   si -- ne ma -- cula, _
    sem -- perque _ can -- dida, _ au -- ro -- ræ lux
    a -- ve, sem -- perque _  can -- dida, _ au -- ro -- ræ lux, a -- ve.

    Re -- ple nec -- ta -- re no -- stra pec -- to -- ra, so -- lis æ -- ter -- ni ful -- gi -- da dux.
    Re -- ple nec -- ta -- re no -- stra pec -- to -- ra, so -- lis æ -- ter -- ni,
    so -- lis æ -- ter -- ni, so -- lis ful -- gi -- da dux, ful -- gi -- da, ful -- gi -- da dux.
    Re -- ple nec -- ta -- re,  a -- ve, no -- stra pec -- to -- ra, a -- ve,
    so -- lis æ -- ter -- ni ful -- gi -- da dux, ful -- gi -- da, ful -- gi -- da dux, ful -- gi -- da dux.

    A -- ve lac -- tea, _ a -- ve  si -- ne ma -- cula, _ a -- ve sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, a -- ve lac -- tea _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux,  au -- ro -- ræ lux, a -- ve lac -- tea, _   si -- ne ma -- cula, _
    sem -- perque _ can -- dida, _ au -- ro -- ræ lux
    a -- ve, sem -- perque _  can -- dida, _ au -- ro -- ræ lux.

}

IXalton = \relative do' {

    \autoBeamOff

    mi8 red16[(mi red8)]
    mi8. fad16 mi8
    sol fad16[(sol fad8)]

    %4
    sol8. la16 sol8
    sol sol sol
    la8. sol16 fad8

    %7
    sol8 la16[(sol)] fad[(mi)]
    si'4.\mbreak
    si8 fad r

    %10
    sol fad16[(sol fad8)]
    sol8. la16 sol8
    R4.

    %13
    sol8 fad16[(sol fad8)]
    sol8. la16 sol8
    R4.

    %16
    sol8 sol sol
    la8. sol16 fad8
    sol8 la16[(sol)] fad[(mi)]\mbreak

    %19
    fad4.
    si8 fad r
    red8 mi16[(fad mi8)]

    %22
    red8. dod16 red8
    sol fad r
    red8 mi16[(fad mi8)]

    %25
    red8. dod16 red8
    si'8 fad r\mbreak
    red8 red mi

    %28
    fad8. fad16 fad8
    fad mi16[(red)] mi[(fad)]
    red4.

    %31
    si'8 fad r
    fad mi16[(red)] mi[(fad)]
    red4.

    %34
    fad8 sol4
    sol8. sol16 fad8\mbreak
    sol8 mi4

    %37
    fad8. fad16  sol8
    sol8 sol sol
    fa8. mi16 red8

    %40
    mi8 mi8. red16
    mi4.
    R

    %43
    sol8 sol sol
    fa8. mi16 red8
    mi8 mi8. red16\mbreak

    %46
    mi4.
    R4.*23
    fad8 sold16[(la sold8)]

    %71
    la8. sold16 la8
    mi fad16[(sol? fad8)]
    sol8. fad16 sol8

    %74
    sol sol re
    mi4 mi8
    la la mi\mbreak

    %77
    fad4 sol8
    sol8. sol16 fad8
    sol4.

    %80
    si8. la16 sol8
    sol8. sol16 fad8
    sol4.

    %83
    R4.*7
    sol4 fad8
    R4.*2

    %93
    sol4 fad8
    R4.*2
    sol4 fad8

    %97
    mi8. mi16 re8
    dod4.
    fad8. mi16 re8

    %100
    dod8. dod16 dod8
    si4.
    dod8. dod16 dod8

    %103
    si4.
    mi8 red16[(mi red8)]
    mi8. fad16 mi8

    %106
    sol8 fad16[(sol fad8)]
    sol8. la16 sol8\mbreak
    sol8 sol sol

    %109
    la8. sol16 fad8
    sol la16[(sol)] fad[(mi)]
    si'4.

    %112
    si8 fad r
    sol8 fad16[(sol fad8)]
    sol8. la16 sol8

    %115
    R4.
    sol8 fad16[(sol fad8)]
    sol8. la16 sol8\mbreak

    %118
    R4.
    sol8 sol sol
    la8. sol16 fad8

    %121
    sol la16[(sol)] fad[(mi)]
    fad4.
    si8 fad r

    %124
    red8 mi16[(fad mi8)]
    red8. dod16 red8
    sol8 fad r\mbreak

    %127
    red8 mi16[(fad mi8)]
    red8. dod16 red8
    si'8 fad r

    %130
    red8 red mi
    fad8. fad16 fad8
    fad mi16[(red)] mi[(fad)]

    %133
    red4.
    si'8 fad r
    fad mi16[(red)] mi[(fad)]

    %136
    red4.
    fad8 sol4
    sol8. sol16 fad8\mbreak

    %139
    sol8 mi4
    fad8. fad16  sol8
    sol8 sol sol

    %142
    fa8. mi16 red8
    mi8 mi8. red16
    mi4.

    %145
    R
    sol8 sol sol
    fa8. mi16 red8

    %148
    mi8 mi8. red16\mbreak
    mi4.
    R

}

IXtestoII = \lyricmode {

    A -- ve lac -- tea, _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, a -- ve, a -- ve lac -- tea _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux,   a -- ve a -- ve,  lac -- tea, _   a -- ve, si -- ne ma -- cula, _
    a -- ve, sem -- perque _ can -- dida, _ au -- ro -- ræ lux,
    a -- ve,  au -- ro -- ræ lux, a -- ve, lac -- tea, _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, sem -- perque _
    can -- dida, _ au -- ro -- ræ lux.

    Re -- ple nec -- ta -- re no -- stra pec -- to -- ra, so -- lis æ -- ter -- ni,
    so -- lis æ -- ter -- ni, ful -- gi -- da dux, ful -- gi -- da, ful -- gi -- da dux,
    a -- ve, a -- ve, a -- ve, ful -- gi -- da dux, ful -- gi -- da, ful -- gi -- da dux,
    ful -- gi -- da dux.

    A -- ve lac -- tea, _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, a -- ve, a -- ve, lac -- tea, _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, a -- ve, a -- ve, lac -- tea, _ a  -- ve,
    si -- ne ma -- cula, _  a -- ve, sem -- perque _ can -- dida, _ au -- ro -- ræ lux,
    a -- ve,  au -- ro -- ræ lux, a -- ve lac -- tea, _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, sem -- perque _
    can -- dida, _ au -- ro -- ræ lux.

}

IXtenoren = \relative do' {

    \autoBeamOff
    R4.*9
    mi8 si4
    mi8. red16 mi8
    R4.
    mi8 si4
    mi8. red16 mi8
    R4.
    mi8 mi mi
    fad8. mi16 re8
    mi re do
    si4.\mbreak
    R
    si

    %22
    si
    R
    si

    %25
    si
    R\mbreak
    si~

    %28
    si~
    si
    si

    %31
    R
    si
    si

    %34
    si8 mi,4
    la8. la16 re,8
    mi la4

    %37
    re8. re16 sol,8
    sol sol mi
    la8. la16 si8

    %40
    do si si
    mi,4.
    R\mbreak

    %43
    sol8 sol mi
    la la si
    do si si

    %46
    mi,4.
    R4.*43
    mi'4 re8
    R4.*2
    mi4 re8
    R4.*2
    mi4 re8
    dod8. dod16 si8
    fad4.
    si8. si16 si8
    mi,8. mi16 fad8
    si4.\mbreak
    mi,8. mi16 fad8
    si4.
    R4.*9
    mi8 si4
    mi8. red16 mi8
    R4.
    mi8 si4
    mi8. red16 mi8
    R4.
    mi8 mi mi
    fad8. mi16 re8
    mi re do
    si4.\mbreak
    R
    si

    %22
    si
    R
    si

    %25
    si
    R\mbreak
    si~

    %28
    si~
    si
    si

    %31
    R
    si
    si

    %34
    si8 mi,4
    la8. la16 re,8
    mi la4

    %37
    re8. re16 sol,8
    sol sol mi
    la8. la16 si8

    %40
    do si si
    mi,4.
    R\mbreak

    %43
    sol8 sol mi
    la8. la16 si8
    do si si

    %46
    mi,4.
    R4.

}

IXtestoIII = \lyricmode {

    A -- ve lac -- tea, _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, a -- ve, a -- ve, a -- ve, a -- ve, a -- ve,
    lac -- tea, _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, sem -- perque _
    can -- dida, _ au -- ro -- ræ lux.

    A -- ve, a -- ve, a -- ve, ful -- gi -- da dux, ful -- gi -- da, ful -- gi -- da dux,
    ful -- gi -- da dux.

    A -- ve lac -- tea, _ si -- ne ma -- cula, _  sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, a -- ve, a -- ve, a -- ve, a -- ve, a -- ve,
    lac -- tea, _ si -- ne ma -- cula, _ sem -- perque _
    can -- dida, _ au -- ro -- ræ lux, sem -- perque _
    can -- dida, _ au -- ro -- ræ lux.

}


IXvlIn = \relative do'' {

    R4.*9
    mi8 fad4
    mi si8

    %12
    R4.
    mi8 fad4
    mi si8

    %15
    R4.
    si8 si sol
    re'8. mi16 fad8

    %18
    mi si do
    fad,4.
    R\mbreak

    %21
    si8 sol4
    si4.
    R

    %24
    si8 sol4
    si4.
    R

    %27
    la8 la sol
    fad8. fad16 fad8
    fad sol4

    %30
    si4.
    R
    fad8 sol4

    %33
    si4.
    si8 sol4
    la8. la16 la8\mbreak

    %36
    sol8 la4
    la sol8
    sol sol sol

    %39
    la8. la16 red,8
    la' si fad
    sol4.

    %42
    R
    sol8 sol sol
    la8. la16 red,8

    %45
    la' si fad
    sol4.
    R

    %48
    sol'8 sol la\mbreak
    si8. si16 si8
    la sol fad

    %51
    sol8. la16 sol8
    sol sol sol
    fa8. mi16 red8

    %54
    mi mi8. red16
    mi4.
    la,8 sol16 fad sol8

    %57
    mi4.
    R4.*8\mbreak
    mi'8 fad sol

    %67
    fad4 si,8
    re8. dod16 si8
    si4.

    %70
    R4.*13
    re'8 re re
    re do16 si do8

    %85
    do do do
    do4 si8
    la8. la16 si8

    %88
    sol4.
    R\mbreak
    mi4 fad8

    %91
    R4.*2
    mi4 fad8
    R4.*2

    %96
    dod4 re8
    mi mi, fad
    lad4.

    %99
    R
    mi'4 dod8
    re4.

    %102
    mi4 dod8
    red4.
    R4.*9

    %113
    mi8 fad4
    mi si8
    R4.

    %116
    mi8 fad4
    mi si8
    R4.

    %119
    si8 si sol
    re'8. mi16 fad8
    mi si do

    %122
    fad,4.
    R\mbreak
    si8 sol4

    %125
    si4.
    R
    si8 sol4

    %128
    si4.
    R
    la8 la sol

    %131
    fad8. fad16 fad8
    fad sol4
    si4.

    %134
    R
    fad8 sol4
    si4.

    %137
    si8 sol4
    la8. la16 la8\mbreak
    sol8 la4

    %140
    la sol8
    sol sol sol
    la8. la16 red,8

    %143
    la' si fad
    sol4.
    R

    %146
    sol8 sol sol
    la8. la16 red,8
    la' si fad

    %149
    sol4.
    R

}

IXvlIIn = \relative do'' {

    R4.*9
    sol8 si4
    sol8. fad16 sol8

    %12
    R4.
    sol8 si4
    sol8. fad16 sol8

    %15
    R4.
    sol8 sol mi
    la8. dod?16 la8

    %18
    sol fad la
    red,4.
    R\mbreak  %% fine prima riga

    %21
    fad8 mi16 red mi8
    fad4.
    R

    %24
    fad8 mi16 red mi8
    fad4.
    R

    %27
    fad8 fad mi
    red8. red16 red8
    red? mi4

    %30
    fad4.
    R
    red8 mi4

    %33
    fad4. \mbreak
    fad8 mi4
    mi8. mi16 fad8

    %36
    mi mi4
    re? re8
    mi mi mi

    %39
    do'8. do16 fad,8
    mi sol si
    si4.

    %42
    R
    mi,8 mi mi
    do'8. do16 fad,8

    %45
    mi sol si
    si4.\mbreak
    R

    %48
    mi8 mi fad
    sol8. sol16 sol8
    do, si la

    %51
    si8. do16 si8
    si si si
    do16 si la sol fad8

    %54
    la sol16 la fad sol
    mi4.
    mi'8 mi8. red16\mbreak

    %57
    mi4.
    R4.*8
    sol,8 la mi'

    %67
    la, la' si
    si4 lad8
    si4.

    %70
    R4.*13
    sol8 sol re
    mi4 mi8

    %85
    la la mi
    fad4 sol8\mbreak
    sol8. sol16 fad8

    %88
    sol4.
    R
    sol,4 la8

    %91
    R4.*2
    sol4 la8
    R4.*2

    %96
    mi'4 fad8
    r dod,8. re16
    fad4.

    %99
    R
    %sol8 fad4 battute rimosse per inconsistenza
    %fad4.
    %R
    sol4 fad8
    fad4.

    %102
    sol4 fad8\mbreak
    fad4.
    R4.*9\mbreak

    %113
    sol8 si4
    sol8. fad16 sol8
    R4.

    %116
    sol8 si4
    sol8. fad16 sol8
    R4.

    %119
    sol8 sol mi
    la8. dod16 la8
    sol fad la

    %122
    red,4.
    R
    fad8 mi16 red mi8

    %125
    fad4.
    R
    fad8 mi16 red mi8

    %128
    fad4.
    R
    fad8 fad mi

    %131
    red8. red16 red8
    red?  mi4
    fad4.

    %134
    R
    red8 mi4
    fad4. \mbreak

    %137
    fad8 mi4
    mi8. mi16 fad8
    mi mi4

    %140
    re? re8
    mi mi mi
    do'8. do16 fad,8

    %143
    mi sol si
    si4.
    R

    %146
    mi,8 mi mi
    do'8. do16 fad,8
    mi sol si

    %149
    si4.\mbreak
    R

}

IXbcn = \relative do {

    mi8 si'4
    mi,4.
    mi8 si'4

    %4
    mi,4.
    mi'8 mi, mi'
    re re, re'

    %7
    mi re do
    si4.
    R

    %10
    mi8 si4
    mi8. red16 mi8
    R4.

    %13
    mi8 si4\mbreak
    mi8. red16 mi8
    R4.

    %16
    mi8 mi mi
    fad8. mi16 re8
    mi re do

    %19
    si4.
    R
    si~

    %22
    si
    R
    si~

    %25
    si
    R\mbreak
    si~

    %28
    si
    si~
    si

    %31
    R
    si
    si

    %34
    si8 mi,4
    la8. la16 re,8
    mi la4

    %37
    re,8. re16 sol8
    sol sol mi
    la8. la16 si8

    %40
    do si si,
    mi4.
    R\mbreak

    %43
    sol8 sol mi
    la8. la16 si8
    do si si,

    %46
    mi4.
    R
    mi'8 mi mi

    %49
    si8. si16 si8
    do re re,
    sol4.

    %52
    sol8 sol mi
    la8. la16 si8
    do si si,

    %55
    mi4.\mbreak
    do'8 si si,
    mi4.

    %58
    mi8. fad16 sol8
    fad4 si8
    sol la4

    %61
    re, sol8
    sol fad mi
    lad4 si8

    %64
    fad'4 fad,8
    si4.
    mi8 re dod

    %67
    re4 sol,8
    fad mi fad
    si4.\mbreak

    %70
    si8 mi,4
    la4.
    la8 re,4

    %73
    sol4.
    si
    do

    %76
    do8 do, do'
    re4 mi8
    do re re,

    %79
    sol4.
    sol4 si8
    do re re,

    %82
    sol4.
    si8 si, si'
    do4 do,8

    %85
    do' do, do'\mbreak
    re re, mi
    do re4

    %88
    sol4.
    sol8 fad4
    mi re8

    %91
    R4.
    sol'4 fad8
    mi4 re8

    %94
    R4.
    si8 re si
    mi4 re8

    %97
    dod4 si8
    fad4.
    si4.

    %100
    mi,4 fad8
    si4.\mbreak
    mi,4 fad8

    %103
    si4.
    mi8 si4
    mi,4.

    %106
    mi'8 si4
    mi,4.
    mi'8 mi, mi'

    %109
    re re, re'
    mi re do
    si4.

    %112
    R
    mi8 si4
    mi,4.

    %115
    R
    mi'8 si4
    mi,4.

    %118
    R\mbreak
    mi'8 mi mi
    fad8. mi16 re8

    %121
    mi re do
    si4.
    R

    %124
    si~
    si
    R

    %127
    si~
    si
    R\mbreak

    %130
    si~
    si
    si~

    %133
    si
    R
    si

    %136
    si
    si8 mi,4\mbreak
    la4 re,8

    %139
    mi la4
    re,8. re16 sol8
    sol sol mi

    %142
    la8. la16 si8
    do si si,
    mi4.

    %145
    R
    sol8 sol mi
    la8. la16 si8

    %148
    do si si,
    mi4.
    R

}

IXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8 <_+>4
    s4.
    s8 <_+>4
    s4.*4
    <_+>4.
    s
    s8 <_+>4
    s4.
    s
    s8 <_+>4
    s4.*2
    s8 s <6>
    s4.
    <6>
    <_+>
    s
    <_+>
    <_+>
    s
    <_+>
    <_+>
    s
    <7>
    <7 _+>
    <5 _+>8 <6 4>4
    <_+>4.
    s
    <_+>
    <_+>
    <_+>
    <_+>
    s
    s
    s
    <6->4 <_+>8
    <6> <6 4> <5 _+>
    s4.*2
    <6>4.
    <6->4 <_+>8
    <6> <6 4> <5+>
    s4.*2
    s4 <6>8
    <6>4.
    <6 5>8 <6 4> <5 3>
    s4.
    <6>
    <6->4 <_+>8
    <6> <6 4> <5 _+>
    s4.
    <6>8 <6 4> <5 _+>
    s4.
    s4 <6>8
    <7>4.
    <6 5>8 <_+>4
    s4.
    <6>
    <6>
    <5 4>4 <5 _+>8
    s4.
    s4 <5->8
    s4.
    <6 4>4 <5 _+>8
    s4.
    s8 <_+>4
    s4.*3
    <6>4.
    <9>8 <8>4   %%% fin qui bar 75 (terza riga)
    <6>4 <6>8
    <7>4 <6>8
    <6 5> <4> <3>
    s4.
    s4 <6>8
    <6 5> <4> <3>
    s4.
    <6>
    <9>8 <8>4
    <6>4 <6>8
    <7>4 <6>8
    s <4> <3>
    s4.
    s8 <6>4
    <6+>4.
    s
    s4 <6>8
    <6+>4.
    s
    s
    <6+>4 <6>8
    <6+>4.
    <_+>
    s
    <6 5>4 <_+>8
    s4.
    <6+>4 <_+>8
    s4.
    s8 <_+>4
    s4.
    s8 <_+>4
    s4.*4
    <_+>4.
    s
    s8 <_+>4
    s4.
    s
    s8 <_+>4
    s4.*3
    <6>4.
    s4 <6>8

    <_+>4.
    s
    <_+>
    <_+>
    s
    <_+>
    <_+>
    s
    <7>
    <7 _+>
    <5 _+>8 <6 4>4
    <_+>4.
    s
    <_+>
    <_+>
    <_+>
    <_+>
    <5>8 <_->4
    s4.
    s
    <6->4 <_+>8
    <6> <6 4> <5 _+>
    s4.*2
    <6>4.
    <6->4 <_+>8
    <6> <6 4> <5+>




}


forma = {

    \time 3/8
    \key sol\major
    \tempo 4. = 35
    s4.*150
    \bar "|."

}

IXvlI = {
    <<\IXvlIn \forma>>

}

IXvlII = {
    <<\IXvlIIn \forma>>

}

IXsoprano = {
    \new Voice = "ave1"
    <<\IXsopranon \forma>>
}

IXalto = {
    \new Voice = "ave2"
    <<\IXalton \forma>>
}

IXtenore = {
    \new Voice = "ave3"
    <<\IXtenoren \forma>>
}

IXbc = {
    \clef tenor
    <<\IXbcn \forma \IXbfn>>
}


global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \header {
        title = \markup\smaller\center-column {"Concerto Sacro VI Op. II"}
        composer = \markup \center-column{"A. Scarlatti (1660 - 1725)"}
    }

    \markup \huge {[1.] Quæ est ista. [Recitativo]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\major \time 4/4 r4 mi'^\markup\center-align "Alto" r sol'8}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto \global
                \new Lyrics \lyricsto "ista" \ItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[2.] Hæc est Aurora. A tempo giusto}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1 mi'4.^\markup\center-align "Canto" si'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIsoprano \global
                \new Lyrics \lyricsto "giusto1" \IItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1 sol'16[fad']^\markup\center-align "Alto"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIalto \global
                \new Lyrics \lyricsto "giusto2" \IItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1 mi'8 mi' mi'^\markup\center-align "Tenore"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \IItenore \global
                \new Lyrics \lyricsto "giusto3" \IItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup \huge {[3.] Unde formæ tam bellæ. [Recitativo]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \time 4/4 si'4 sol'^\markup\center-align "Canto"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIIsoprano \global
                \new Lyrics \lyricsto "unde" \IIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[4.] Hanc Aurora conflagrans. Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 4/4 r1 la'16[si' la'8]^\markup\center-align "Canto"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IVsoprano \global
                \new Lyrics \lyricsto "hanc" \IVtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[5.] Ritornello}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[6.] Procul quæso torpores. [Recitativo]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key sol\major \time 4/4 la4 la^\markup\center-align "Tenore"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \VItenore \global
                \new Lyrics \lyricsto "procul" \VItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 19)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #6
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[7.] O nimis clara lux. Pastorale Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key sol\major \time 4/4 r2 r4 r8 re' si^\markup\center-align "Tenore"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \VIItenore \global
                \new Lyrics \lyricsto "nimis" \VIItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \markup \huge {[8.] Quis tuam decantabit. [Recitativo]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\major \time 4/4 mi'4 r8 sol'^\markup\center-align "Alto"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \VIIIalto \global
                \new Lyrics \lyricsto "quis" \VIIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 19)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #6
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[9.] Ave lactea sine macula}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1 mi''8^\markup\center-align "Canto" red''16}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IXsoprano \global
                \new Lyrics \lyricsto "ave1" \IXtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi mi'8 red'16^\markup\center-align "Alto"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IXalto \global
                \new Lyrics \lyricsto "ave2" \IXtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key sol\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1 mi'8 si4^\markup\center-align "Tenore"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \IXtenore \global
                \new Lyrics \lyricsto "ave3" \IXtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IXvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IXvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IXbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

}



