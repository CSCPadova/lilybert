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

    R1*7
    r4 mi8 mi mi mi mi mi
    mi16[red] mi8 fad fad fad fad fad fad

    %10
    fad16[mi] fad8 fad sol\mbreak la sol fad mi
    red mi r4 r2
    r4 fad8 sol la sol fad mi

    %13
    red mi fad fad fad fad fad fad
    sol16[fad] sol8 la la\mbreak  la sold sol sol
    sol fad fa fa fa mi mi re16[do]

    %16
    si2 si~
    si r
    R1*4

    %22
    r2 r4 sol'8 sol
    la sol la sol\mbreak  la sol sold sold
    la sold la sold la sold lad lad

    %25
    si2~si8 la sol fad
    mi16 [fad re mi] dod4 si r
    R1

    %28
    r2 r4 si'8 si\mbreak
    si si si si si16[la] si8 la la
    la la la la la16[sol] la8 sol sol

    %31
    sol8. sol16 sol8 sol sol2~
    sol sol4 r8 sib\mbreak
    la16[fad] sol4 fad8 sol2~

    %34
    sol r
    R1
    r4 mi8 mi mi mi mi mi

    %37
    mi16[red] mi8 fad fad fad fad fad fad
    fad16[mi] fad8 fad sol\mbreak la sol fad mi
    red mi r4 r2

    %40
    r4 fad8 sol la sol fad mi
    red mi fad fad fad fad fad fad
    sol16[fad] sol8 la la\mbreak  la sold sol sol

    %43
    sol fad fa fa fa mi mi re16[do]
    si2 si~
    si r

    %46
    R1*5

}

Itesto = \lyricmode {

    In -- fir -- ma -- ta vul -- ne -- ra -- ta,
    in -- fir -- ma -- ta vul -- ne -- ra -- ta,  pu -- ro de -- ficit _ a -- more, _
    pu -- ro de -- ficit _ a -- more, _
    in -- fir -- ma -- ta vul -- ne -- ra -- ta,  pu -- ro de -- ficit _ a -- more, _
    pu -- ro de -- ficit _ a -- mo -- re.

    Et li -- quescens _ gra -- vi_ar -- dore, _
    & li -- quescens _ gra -- vi_ar -- dore, _
    lan -- guet a -- nima _ be -- a - ta,
    & li -- quescens _ gra -- vi_ar -- dore, _
    & li -- quescens _ gra -- vi_ar -- dore, _
    lan -- guet a -- nima _ be -- a -- ta, be -- a - - ta.

    Pu -- ro de -- ficit _ a -- more, _ pu -- ro de -- ficit _ a -- more, _
    in -- fir -- ma -- ta vul -- ne -- ra -- ta,
    in -- fir -- ma -- ta vul -- ne -- ra -- ta,  pu -- ro de -- ficit _ a -- more, _
    in -- fir -- ma -- ta vul -- ne -- ra -- ta, in -- fir -- ma -- ta vul -- ne -- ra -- ta.

}


IvlIn = \relative do'' {

    R1
    r4 fad,8 fad fad fad fad fad
    fad16 mi fad8 fad sol red mi do si

    %4
    la sol do' si red mi mi mi
    mi mi mi mi red mi fad sol\mbreak
    la16 si sol la fad8. mi16 mi8 mi mi mi

    %7
    mi mi mi mi red mi mi red
    mi4 r r2
    R1*2

    %11
    r4 fad,8 sol red mi do si
    la sol r4 r2\mbreak
    R1

    %14
    r8 red'' mi fad si,4 r
    r8 la do re sol,4 r
    r8 fad sol fad sol fad sol la

    %17
    si la sol si si mi fad mi
    red mi do si\mbreak la sol fad4
    mi r r fad8 fad

    %20
    fad fad fad fad fad 16 mi fad8 fad' sol
    la16 si sol la fad8. fad16 mi4 do8 si
    red, mi mi red mi4 r

    %23
    R1*3\mbreak
    r2 r8 si'' si si
    si2~si8 la sol fad

    %28
    mi16 fad re mi dod4 si r
    r8 fad' sol fad sol16 fad sol8 r4
    R1

    %31
    r2 r8 si, si si\mbreak
    sol sol sol sol sol sol fad sol
    la la la la si re mib re

    %34
    mib re mib re mib re mib re
    fad, sol sol8. fad16 sol4 r\mbreak
    R1*3

    %39
    r4 fad8 sol red mi do si
    la sol r4 r2
    R1

    %42
    r8 red'' mi fad si,4 r
    r8 la do re sol,4 r
    r8 fad sol fad\mbreak sol fad sol la

    %45
    si la si si si mi fad mi
    red mi do si la sol fad4
    mi r r fad8 fad

    %48
    fad fad fad fad fad16 mi fad8 fad' sol\mbreak
    la16 si sol la fad8. fad16 mi4 do8 si
    red, mi mi8. red16 mi4 r

}

IvlIIn = \relative do'' {

    r4 mi,8 mi mi mi mi mi
    mi16 red mi8 r red mi mi mi mi
    red16 dod red8 red mi la sol fad mi\mbreak

    %4
    red mi mi' mi la, si  fad fad
    fad fad fad fad fad si red mi
    fad16 sol mi8 mi8. red16 mi8 si do si

    %7
    do si do si la16 si sol la fad8. fad16\mbreak
    mi4 r r2
    R1*2

    %11
    r4 red8 mi la sol fad mi
    red mi r4 r2
    R1

    %14
    r2 r8 si' do re
    la4 r r8 sol si mi,
    red si' si si\mbreak si si si red

    %17
    mi red mi fad sol si, do si
    la sol 16 sol' fad8 mi red mi4 red8
    mi4 mi,8 mi mi mi mi mi

    %20
    mi mi mi mi\mbreak red16 dod red8 red' mi
    fad mi mi red mi mi, fad sol
    la16 si sol la fad8. fad16 mi4 r

    %23
    R1*3
    r2 r8 fad' sol fad
    sol fad sol fad\mbreak sol fad mi re

    %28
    lad si si8. lad16 si4 r
    R1
    r8 mi fad mi fad16 mi fad8 r4

    %31
    r2 r8 re, mib re
    mib re mib re mib re do re\mbreak
    mib mi re4 re8 sol sol sol

    %34
    sol sol sol sol sol sol sol sol
    la sib la4 sol r
    R1*3

    %39
    r4 red8 mi la sol fad mi
    red mi r4 r2\mbreak
    R1

    %42
    r2 r8 si' re fad
    la,4 r r8 sol si mi,
    red si' si si si si si red

    %45
    mi red mi fad sol si, do si
    la sol16 sol' fad8 mi red mi4 red8\mbreak
    mi4 mi,8 mi mi mi mi mi

    %48
    mi mi mi mi red16 dod red8 red' mi
    fad mi mi red mi mi, fad sol
    la16 si sol la fad8. fad16 mi4 r

}

Ibcn = \relative do {

    mi8 re do si la sol do si
    la sol la si do si la do
    si si' la sol fad mi la sol

    %4
    fad mi la sol fad sol la sol\mbreak
    la si do dod si sol fad mi
    red mi la, si mi sol la sol

    %7
    la sol la sol fad mi si' si,
    mi' re do si la sol do si
    la sol la si do si la do\mbreak

    %10
    si si, la' sol fad mi la sol
    fad mi si' sol fad mi la sol
    fad mi red mi fad sol la sol

    %13
    fad mi la sol la si do dod
    si si \clef tenor\key mi\minor dod? red\mbreak mi mi, si' dod!
    re re, \clef bass\key mi\minor la' si do do, sol la

    %16
    si red mi red mi red mi fad
    sol fad mi red mi sol la sol
    fad mi la sol\mbreak fad mi si' si,

    %19
    mi fad sol mi la sol la si
    do si la do si si la sol
    fad sol la si mi, sol la sol

    %22
    fad mi si' si,mi4 mi8 si
    do si do si\mbreak do si mi si
    do si do si do si dod dod'?

    %25
    re si mi, fad sol fad mi re
    dod si fad' fad, si re mi re
    mi re mi re mi fad sol si\mbreak

    %28
    dod si mi, fad \clef tenor \key mi\minor si dod red si
    mi red mi red mi si dod la
    re dod re dod re la si sol

    %31
    do si do si\mbreak do sol\clef bass \key mi\minor  do, si
    do si do si do sib  la sol
    do dod re re, sol si do? si

    %34
    do si do si do si do sib
    la sol re' re,\mbreak sol4 r
    mi''8 re do si la sol do si

    %37
    la sol la si do si la do
    si si, la' sol fad mi la sol
    fad mi si' sol fad mi la sol

    %40
    fad mi red mi\mbreak fad sol la sol
    fad mi la sol la si do dod
    si si \clef tenor\key mi\minor dod red\mbreak mi mi, si' dod

    %43
    re re, \clef bass\key mi\minor la' si do do, sol la
    si red mi red mi red mi fad
    sol fad mi red mi sol la sol

    %46
    fad mi la sol\mbreak fad mi si' si,
    mi fad sol mi la sol la si
    do si la do si si la sol

    %49
    fad sol la si mi, sol la sol
    fad mi si' si,mi4 r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 s8 <4 3> s <6> s4
    s <6 5>8 <_+> <4 3> s <6 5> <6>
    <_+> s <6 4+> s <6+> s <6> <6>
    <6+> s s <6> <6+> <6> <6 5> <7 6>
    <6 5> <_+> <4> s <_+> s <6+> s
    <5-> s <6 5> <_+> s <6> s <6>
    s <6> s <6> <6+> s <5 4> <_+>
    s2 <5>8 <6> s4
    s8 <6> <6 5> s s4 <6 5>8 <6>\mbreak

    %10 OOKK
    <_+> s <6 4+ 2> s <6+> s <6> <6>
    <6+> s <_+> <6+> <6+> s <6> <6>
    <6+> s <6> s <6+> <6> <6> <6>
    <6+> s <6 5> <7 6> <6 5> <_+> <7 4> <6 4>
    <_+>4 <6> <4>8 <_+> <_+> <6>
    <4> <3> <6-> <5-> <4-> <3> <6> s
    <_+> <6> s <6> s <6> s <6+>
    <6> <6+> s <6> s <6> <6> <6>
    <6+> s <6> <6> <6+> s <4> <_+>
    s4 <6> s8 <6> <6 5> <_+>
    <4 3> s <6 5> <6> <_+> s <6 4+> <6>
    <6+> <6> <6 5> <_+> s <6> s <6>
    <6+> s <4> <_+> s s s <6>
    <6> <6> <6> <6>\mbreak <6> <6> <_+> <6+>
    <6> <6+> <6> <6+> <6> <6+> <6+> <6+>
    <6>2 <6>
    <6+>8 s <4> <_+>  s <6> s <6>
    s <6> s <6> s s <6> <5>\mbreak
    <6+> s <6 5> <_+> <_+> s <6> s
    s <6> s <6> s <6> <6> s
    s <6> s <6> <_-> <6-> <6> s
    s <6> s <6> s4 <_->8 <6>
    <_-> <6> <_-> <6> <_-> <6> <6+> <_->
    <6 _-> <6 5-> <4> <3> <_!> <6> <_-> <6>
    <_-> <6> <_-> <6> <_-> <6> <_-> <6>
    <6+> <_-> <4> <3>\mbreak <_!>2
    s4 s8 <4> s <6> s4
    s <6 5>8 <_+> <4 3> s <6 5> <6>
    <_+> s <6 4+> <6> <6+> s <6> <6>
    <6+> s <_+> <6> <6+> s <6> <6>
    <6+> s <6> s\mbreak <6+> <6> <6> <6>
    <6+> s <6 5> <7 6> <6 5> <_+> <4 3> <6+ 4>
    <_+>4 <6>8 <5-> <4> <_+> <6-> <5->
    <4> <3> <6-> <5-> <4-> <3> <6> s\mbreak
    <_+> <6> s <6> s <6> s <6+>
    <6> <6+> s <6> s <6> <6> <6>
    <6+> s <6> <6> <6+> s <4> <_+>
    s4 <6> s8 <6> <6 5> <5 4>
    <4 3> s <6 5> <4 3>\mbreak <_+> s <4+ 2> <6>
    <6+> <6> <6 5> <_+> s <6> s <6>
    <6+> s <4> <_+>

}


forma = {

    \time 4/4
    \key mi\minor
    \tempo 4 = 45
    s1*50
    \bar "||"

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ialto = {
    \new Voice = "infirmata"
    <<\Ialton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIalton = \relative do' {

    \autoBeamOff

    r8 fad4(mi16)[re] re4 re
    r8 si'4 (la16)[sol] sol4 sol
    r8 sol sol fad re4 re
    r fad8 re16 re si'8. fad16 fad4
    r8 fad fad fad16 fad fa8 fa fa fa\mbreak
    fa [mi] mi4 r r8 mi
    mi mi mi mi la la la16[sold] la8
    si4 si r2\fermata

}

IItesto = \lyricmode {

    O! ca -- re, o! ca -- re, o dul -- cis a -- mor, quo -- modo, _
    quo -- modo, _ mu -- ta -- tus es mi -- hi in -- cru -- de -- lem,
    quem num -- quam a -- gno -- visti _ in -- fi -- delem. _

}

IIbcn = \relative do {

    si1~
    si2 si
    lad si~
    si~si~
    si la
    sold sol
    sol fa'
    mi1

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s1
    s2 <6>
    <7- 5-> s
    s1
    s2 <6!>
    <7- 5>4 <6> <6>2
    <6> <7>4 <6>
    <_+>1

}


forma = {

    \time 4/4
    \key mi\minor
    \tempo 4 = 55
    s1*8
    \bar "||"

}

IIalto = {
    \new Voice = "care"
    <<\IIalton \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIalton = \relative do' {

    \autoBeamOff

    R1.*4
    mi2. mi4 fa2
    fa2. mi4 mi2

    %7
    la red,2. mi4
    mi1.
    R1.*4

    %13
    mi2. mi4 fa2
    fa2. mi4 mi2
    la red,2. mi4

    %16
    mi1.
    si'\mbreak
    si2 la4 sold la2

    %19
    fa1 mi2~
    mi re1
    r2 mi la~

    %22
    la sold1
    la1.~
    la

    %25
    R1.*5
    la2 sol4(fad) sol2
    sol fad4(mi) fad2

    %32
    lad si lad\mbreak
    si1.~
    si~

    %35
    si2 la4 sol fa mi
    fa1.
    mi1 fad2

    %38
    sol2. fad4 mi2
    r r mi
    la2. sol4 fad2

    %41
    sol si1~
    si2 lad la\mbreak
    la sold sol

    %44
    fa2. mi4 red mi
    sol2. fa4 mi2
    mi1.~

    %47
    mi
    R1.*7
    mi2. mi4 fa2

    %56
    fa2. mi4 mi2
    la red,2. mi4
    mi1.

    %59
    R1.*4
    mi2. mi4 fa2
    fa2. mi4 mi2

    %65
    la red,2. mi4
    mi1.
    si'\mbreak

    %68
    si2 la4 sold la2
    fa1 mi2~
    mi re1

    %71
    r2 mi la~
    la sold1
    la1.~

    %74
    la
    R1.*5

}

IIItesto = \lyricmode {

    Vul -- nera _ per -- cute, _ trans -- fi -- ge cor,
    Vul -- nera _ per -- cute, _ trans -- fi -- ge cor,
    trans -- fi - - ge trans -- fi -- ge trans -- fi -- ge cor.

    Tor -- men -- ta pa - ti, tor -- menta _ pa - - - - - ti
    non ti -- meo, _ non ti -- meo, _
    non tor -- menta _ pa -- ti, non ti -- meo, _
    non ti -- meo, _ non.

    Vul -- nera _ per -- cute, _ trans -- fi -- ge cor,
    Vul -- nera _ per -- cute, _ trans -- fi -- ge cor,
    trans -- fi - - ge trans -- fi -- ge trans -- fi -- ge cor.

}


IIIvlIn = \relative do'' {

    mi,2. mi4 fa2
    fa2. mi4 mi2
    la red,2. mi4

    %4
    mi1.
    mi2 sol la
    si1 do2~

    %7
    do4 si la1~
    la2 sold1
    si2. si4 do2\mbreak

    %10
    do2. si4 si2
    do fad,1
    sold2 la si

    %13
    do si4 do re do
    si1 do2~
    do4 si la1~

    %16
    la2 sold1~
    sold4 la si2. si4
    do1 do2\mbreak

    %19
    la si do
    la1 la2
    sold si do

    %22
    do1 si2
    la re mi~
    mi4 re2 dod4 re2~

    %25
    re do?4 si do2~
    do si2. la4
    sold2 la4 si do2\mbreak

    %28
    si si1
    la1.
    dod2 dod dod

    %31
    la2. sol4 la2
    dod fad, dod'
    si sol si

    %34
    si si si
    do do do~
    do si4 do si la\mbreak

    %37
    sold2 la si
    si1 do2
    si1 si2

    %40
    fad'2. mi4 red2
    mi sol,4 la si2
    mi, fad mi

    %43
    fad sold4 la si2
    do fad, la\mbreak
    si4 si, do2 si

    %46
    si1 si2
    do2. do4 mi2
    mi1 mi2

    %49
    mi1 red2
    mi1.
    mi2. mi4fa2
    fa2. mi4 mi2

    %53
    la red,2. mi4
    mi1.\mbreak
    mi2 sol la

    %56
    si1 do2~
    do4 si la1~
    la2 sold1

    %59
    si2. si4 do2
    do2. si4 si2
    do fad,1

    %62
    sold2 la si
    do si4 do re do
    si1 do2~\mbreak

    %65
    do4 si la1~
    la2 sold1~
    sold4 la si2. si4

    %68
    do1 do2
    la si do
    la1 la2

    %71
    sold si do
    do si r
    la mi' mi~

    %74
    mi re4 dod re2~\mbreak
    re do4 si do2~
    do si2. la4

    %77
    sold2 la4 si do2
    si si1
    la1.

}



IIIvlIIn = \relative do'' {

    do,2 si la
    si1 do2
    la si1
    do1.
    do'2 si la
    sol1 sol2
    la2. sol4 fad2
    si1.\mbreak
    sold2 fad4 sold la2
    fad1 sol?2
    mi mi2. red4
    mi1 mi2
    mi sol la
    sol1 sol2
    la2. sol4 fad2
    si1.
    mi,2 fa! mi\mbreak
    mi4 re do re mi2
    re1 do2
    fa2. sol4 la re,
    mi2 sold fad
    mi1.~
    mi2 fa! mi
    fa1 fa2
    mi1 la4 sol
    fa1 fa2\mbreak
    mi1 la2
    la1 sold2
    la1.
    mi2 mi  mi
    re1 re2
    mi re mi
    fad mi fad
    sol la si
    mi,1 mi2
    re1 re2\mbreak
    si mi si
    sol4 do si2 mi4 fad
    sol2. fad4 mi2
    r fad si
    si1 fad2
    dod'1.
    si
    la2 red, mi
    mi1 red2\mbreak
    mi sol mi mi2. mi4 mi2
    do' fad,1
    fad?1.
    mi
    do2 si la
    si1 do2
    la la1~
    la2 sold1
    do'2 si la\mbreak
    sol?1 sol2
    la2. sol4 fad2
    si1.
    sold2 fad4 sold la2
    fad1 sol?2 mi mi2. red4
    mi1 mi2
    mi sol la
    sol1 sol2\mbreak
    la2. sol4 fad2
    si1.
    mi,2 fa! mi
    mi4 re do re mi2
    re1 do2
    fa2. sol4 la re,
    mi2 sold fad
    mi1.
    mi2 fa! mi\mbreak
    fa1 fa2
    mi1 la4 sol?
    fa1 fa2
    mi1 la2
    la1 sold2
    la1.

}

IIIbcn = \relative do {

    la'2 sol fa
    sol1 do,2
    fa fad1

    %4
    mi1.
    la2 sol fa?
    sol1 do,2

    %7
    fa fad1
    mi1.
    mi2 re do

    %10
    re1 sol,2
    la si si'
    mi, fad sold\mbreak

    %13
    la sol? fa?
    sol1 do,2
    fa fad1

    %16
    mi1.
    mi2 re mi
    do fa do

    %19
    re sold, la
    fa1 fa'2
    mi1 red2

    %22
    mi1 re?2
    dod re dod
    re1 re2\mbreak

    %25
    sold,1 la2
    re1 re'2~
    re do la

    %28
    re, mi mi,
    la1.
    la2 la la

    %31
    re1 re2
    dod re dod
    re mi re

    %34
    mi fad sol
    la1 la,2
    re1.\mbreak

    %37
    re2 dod red
    mi sol la
    mi1 sol2

    %40
    fad si si,
    mi1 re?2
    dod fad dod

    %43
    red mi si
    la si do
    si la si

    %46
    mi1 sol2
    la la, sol\mbreak
    la lad1

    %49
    si2 la? si
    mi1.
    la2 sol fa

    %52
    sol1 do,2
    fa fad1
    mi1.

    %55
    la2 sol fa?
    sol1 do,2
    fa fad1

    %58
    mi1.
    mi2 re do
    re1 sol,2\mbreak

    %61
    la si si'
    mi, fad sold
    la sol? fa?

    %64
    sol1 do,2
    fa fad1
    mi1.

    %67
    mi2 re mi
    do fa? do
    re sold, la

    %70
    fa1 fa'2
    mi1 dod2
    mi1 re2\mbreak

    %73
    dod re dod
    re1 re2
    sold,1 la2

    %76
    re1 re'2~
    re do la
    re, mi mi,

    %79
    la1.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6> s
    <7>1.
    <7>2 <6+>1
    <6 4>2 <5 3+> s
    s <6> s
    <7> s s
    <7> <6+> s
    <5 4> <3+> s
    <_+> <6 _+> <6>
    <7 _+> s s
    <6+ 5> <5 4> <_+>
    <_+> s s\mbreak
    s <6> s
    <7> s s
    <7> <6+> s
    <4> <3+> s
    <_+> <6 _-> <_+>
    s1.
    s2 <7- 5-> s
    <7> <6> <6>
    <_+> s <7 5->
    <6 4> <5 _+> <4+ 2>
    <6> <_-> <6>
    <9 _-> <8> s\mbreak
    <6 5-> s s
    <7> <6> <5>
    <4+> <6> s
    <6 5> <4> <_+>
    s1.
    <_+>2 s <7>
    <4> <3+> s
    <6+> <6 _+> <6+>
    <6 _+> s <6 _+>
    s <6> <6>
    <9 _-> <8> s
    <7> <6> <5>\mbreak
    <6 4+ 2> <6> <6>
    s <6> s
    s s <6>
    <7> <7> <_+>
    s s <6 _+>
    <7> <_+> <6->
    <6 5-> <_+> <6->
    <6-> <_+> <6>
    <6 4> s <_+>
    s s <6>
    <_-> s <6>\mbreak
    <_-> <6 5-> s
    <5 4> s <_+>
    s1.
    s2 <6> s
    <7> s s
    <7> <6+> s
    <5 4> <3+> s
    s <6> s
    <7> s s
    <7>  <6+> s
    <4> <3+> s
    <_+> <6 4+ 2> <8 6>
    <7 _+> <6> s\mbreak
    <6 5> <5 4> <_+>
    <_+> <7> <6>
    s <6> s
    <7> s s
    <7> <6+> s
    <5 4> <3+> s
    <_+> <6 _-> <_+>
    <7> s <6>
    s <7 5-> s
    <7> <6 > <6>
    <_+> s<7 5->
    <6 4> <5 _+> <6 4+ 2>\mbreak
    <6> <_-> <6>
    <9 _-> <8> s
    <6 5-> s s
    <7> <6> <5>
    <6 4+> <6> s
    <6 5> <4> <3+>

}


forma = {

    \time 3/2
    \key la\minor
    \tempo 1 = 40
    s1.*79
    \bar "||"

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIalto = {
    \new Voice = "vulnera"
    <<\IIIalton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}




IValton = \relative do' {

    \autoBeamOff

    R4.*7
    sol'4.
    la~

    %10
    la8 sol fa16[mi]
    re4.
    do

    %13
    R4.*2
    sol'4.
    la~

    %17
    la8 sol fa16[mi]
    re4.
    do4 do8

    %20
    re re re\mbreak
    re4.
    mi~
    mi8[re do]

    %24
    fa4.~
    fa8[mi re]
    sol4.
    fa

    %28
    mi4 sol8
    do, do do
    re4 do8

    %31
    fa4.~
    fa8[mi re]
    sol4.

    %34
    fa~
    fa\mbreak
    mi

    %37
    re4 do8
    re4 do8
    si4.

    %40
    do~
    do~
    do4 si8

    %43
    do4.
    R4.*7
    r8 r sol'

    %52
    mi fad sol
    la4.
    fad

    %55
    R4.*3\mbreak
    r8 r sol
    mi fad sol

    %60
    la4.
    fad4 la8
    sol la si
    la8[sol la16 sol]

    %64
    fad8[mi fad]
    sol4.~
    sol

    %67
    la~
    la
    sib

    %70
    la8 sol4~
    sol fad8\mbreak
    sol4.

    %73
    R4.*2
    r8 r la
    sol la si

    %77
    la[sol la16 sol]
    fad8[mi fad]
    sol4.~

    %80
    sol
    la~
    la

    %83
    sib
    la8 sol4~
    sol fad8\mbreak
    sol4.~

    %87
    sol~
    sol
    R4.*9

    %98
    sol4.
    la~
    la8 sol fa16[mi]

    %101
    re4.
    do
    R4.*2

    %105
    sol'4.
    la~
    la8 sol fa16[mi]

    %108
    re4.
    do4 do8\mbreak
    re re re

    %111
    re4.
    mi~
    mi8[re do]

    %114
    fa4.~
    fa8[mi re]
    sol4.

    %117
    fa~
    fa
    mi4 sol8

    %120
    do, do do
    fa4.~
    fa8[mi re]

    %123
    sol4.
    fa~
    fa\mbreak

    %126
    mi
    re4 do8
    re4 do8

    %129
    si4.
    do~
    do~

    %132
    do4 si8
    do4.
    R4.*21

}

IVtesto = \lyricmode {

    Cur quæ -- so cru -- de -- lis,
    cur quæ -- so cru -- de -- lis es
    fac -- tus es gra - - - - vis es,
    fac -- tus es gra - - - - vis, fac -- tus,
    fac -- tus es gra - vis,
    sum ti -- bi fi -- de -- lis,
    sum ti -- bi fi -- de -- lis,
    fis mi -- hi su -- a - - - - - - - vis,
    fis mi -- hi su -- a - - - - - - - vis.

    Cur quæ -- so cru -- de -- lis,
    cur quæ -- so cru -- de -- lis es
    fac -- tus es gra - - - - vis es,
    fac -- tus es gra - - vis,
    fac -- tus, fac -- tus es gra - vis.

}


IVvlIn = \relative do'' {

    R4.*133
    sol'4.
    la

    %136
    la8 sol fa16 mi
    re4.
    do8 re mi

    %139
    la, si do
    do si4
    do sol8

    %142
    do si la16 sol
    fad8 sol la
    re,4 sol8

    %145
    sol4 fad8\mbreak
    sol4.
    sol' la

    %148
    la8 sol fa16 mi
    re8 do re
    mi re4

    %151
    do8 do'4
    do si8
    do4.

}

IVvlIIn = \relative do'' {

    R4.*133
    do,8 re mi
    fa sol la

    %136
    re, mi fa
    sol la si
    mi,4.

    %139
    R
    re'
    mi~

    %142
    mi8 re do16 si
    la4.
    sol

    %145
    la
    si8 do re
    mi fa sol\mbreak

    %148
    do,4.
    fa8 mi re16 do
    si8 do4

    %151
    do8 si4
    do8 do re
    mi re4

    %154
    do4.

}

IVbcn = \relative do {

    do8 re mi
    fa sol la
    re, mi fa

    %4
    sol la si
    mi, re do
    fa mi fa

    %7
    sol fa sol
    do, re mi
    fa sol la

    %10
    re, mi fa
    sol la si
    mi, re do

    %13
    fa mi fa
    sol fa sol
    do, re mi

    %16
    fa sol la
    re, mi fa
    sol la si

    %19
    mi, re do
    fa mi fa
    sol fa sol

    %22
    do, re mi
    fa sol la
    re, mi fa

    %25
    sol la si
    mi, re do
    fa mi fa

    %28
    sol fa sol
    do, re mi
    fa sol la

    %31
    re, mi fa
    sol la si
    mi, re do

    %34
    fa mi fa
    sol fa sol
    do, re mi

    %37
    fa sol la
    re, mi fa
    sol la si

    %40
    mi, re do
    fa mi fa
    sol fa sol  %%bar 42 inizio quarta riga

    %43
    do, re mi
    fa sol la
    re, mi fa

    %46
    sol la si
    mi, re do
    fa mi fa

    %49
    sol fa sol
    do, si la
    sol la si\mbreak

    %52
    do re mi
    la, si do
    re mi fad

    %55
    si, la sol
    do si do
    re do re

    %58
    sol, la si
    do re mi
    la, si do

    %61
    re mi fad
    si, la sol
    do si do\mbreak

    %64
    re do re
    sol, la si
    do re mi

    %67
    la, si do
    re mi fad
    sib, la sol  %% sest'ultima

    %70
    do sib do
    re do re
    sol, la si?

    %73
    do re mi
    la, si do
    re mi fad\mbreak

    %76
    si, la sol
    do si do
    re do re

    %79
    sol, la si
    do re mi
    la, si do

    %82
    re mi fad
    sol, la sib
    do sib do

    %85
    re do re
    sol, la si?
    do re mi\mbreak

    %88
    si la sol
    re' do re
    sol,4.

    %91
    do8 re mi
    fa sol la
    re, mi fa

    %94
    sol la si
    mi, re do
    fa mi fa

    %97
    sol fa sol
    do, re mi
    fa sol la

    %100
    re, mi fa
    sol la si
    mi, re do

    %103
    fa mi fa
    sol fa sol
    do, re mi

    %106
    fa sol la
    re, mi fa
    sol la si

    %109
    mi, re do
    fa mi fa
    sol fa sol

    %112
    do, re mi
    fa sol la
    re, mi fa

    %115
    sol la si
    mi, re do
    fa mi fa

    %118
    sol fa sol
    do, re mi
    fa sol la

    %121
    re, mi fa
    sol la si
    mi, re do

    %124
    fa mi fa
    sol fa sol
    do, re mi

    %127
    fa sol la
    re, mi fa
    sol la si

    %130
    mi, re do
    fa mi fa
    sol fa sol

    %133
    do,4.
    R4.*3
    sol'4.

    %138
    la
    la8 sol fa16 mi
    re4.

    %141
    do8 re mi
    la, si do
    re mi fad

    %144
    si, la sol
    re' do re
    sol la si

    %147
    do, re mi
    fa? sol la
    re, mi fa\mbreak

    %150
    sol mi fa
    sol fa sol
    la mi fa

    %153
    sol fa sol
    do,4.

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*2
    s8 <6> s
    s4.
    <6>
    <6 5>
    <5 4>4 <3>8
    s4.*4
    <6>4.
    <6 5>
    <5 4>4 <3>8
    s4.*4
    <6>4.
    <6 5>
    <5 4>4 <3>8
    s4. <7>
    s
    <7>4 <5>8
    <6>4.
    s
    <6 4>4 <5 3>8
    s4.
    <6>
    s
    <7>4 <5->8
    <6>4.
    s
    <7>
     s4.*4
    <6>4.
    <6 5>
    <5 4>4 <3>8
    s4.*4
    <6>4.
    <6 5>
    <5 4>4 <3>8
    s4.*2\mbreak
    s8 <_+> s
    s4.
    <_+>4 <6>8
    <6>4.
    <6 5>
    <5 4>4 <_+>8
    s4.
    s8 <_+> s
    s4.
    <_+>4 <6>8
    <6> <6+> s
    <6> <6> <6 5>\mbreak
    <_+>4.
    s4.*3
    <_+>4 <6>8
    <6>4.
    <6 5>
    <5 4>4 <_+>8
    <_!>4.
    s
    s
    <_+>4 <6>8\mbreak
    <6>4.
    <6>8 <6> <6 5>
    <5 4> s <_+>  %%% bar 78
    s4.*3
    <_+>4 <6>8
    <_->4 <6>8
    <6> <6> s
    <5 4> s <_+>
    <_!>4 <6>8
    s4.\mbreak
    <6>4.
    <6 4>8 s <5 _+>
    s4.*5
    <6>4.
    <6 5>
    <5 4>4 <3>8
    s4.*3
    <7>4.
    <6>
    <6 5>
    <5 4>4 <3>8
    s4.*3
    <7>4.
    <6>
    s
    <5 4>4 <3>8
    s4.
    <7>\mbreak
    s
    <7>4 <5->8
    <6>4.
    s
    <7>
    s4.*3
    <7>4 <5->8
    <6>4.
    <6 5>
    <5 4>4 <3>8
    s4.
    <6>
    s
    s
    <6>
    <6 5>4 <5 3>8
    <5 4>4 <3>8
    s4.*5
    <5>4.
    s
    <7>8 <6>4
    s4.
    s8 <6> <6>
    <_+> s <6>
    <6> s s
    <5 4> s <_+>
    s4.*3
    s8 <6> <6>
    s <6> <6 5>
    <6 4> s <5 3>
    s4.
    <6 4>8 s <5 3>

}


forma = {

    \time 3/8
    \key do\major
    \tempo 4. = 77
    s4.*133
    \bar "||"\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +2)
    \mark\markup "Ritornello"
    s4.*21
    \bar "||"



}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IValto = {
    \new Voice = "cur"
    <<\IValton \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}




Valton = \relative do' {

    \autoBeamOff

    r4 r8 la' la mi r la
    la mi la2 sold8 si
    mi,4 mi r mi8 la

    %4
    la sol r si mi, mi sol4~
    sol8[fad16 mi] fad[sol la fad] re8[sol] si4~\mbreak
    si8[la16 sol] la[si do la] fad8[re] sib'4

    %7
    la8 sol16[fad] sol2(fad4)
    sol1

}

Vtesto = \lyricmode {

    Vi -- cis -- ti, vi -- cis -- ti a -- mor vi -- cis -- ti & cor me -- um,
    cor me -- um ces - - - - sit ces -- sit a -- mo -- ri.

}

Vbcn = \relative do {

    la1~
    la2 si
    la1

    %4
    si2 do
    la si
    do re4 sol

    %7
    dod,2 re
    sol,1

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <7>4 <6+>
    s1
    <7>8 <6>  s4 <5>2
    <7>4 <6> <6>2
    <7>4 <6> s <_->
    <6>4 <5-> <5 4> <3>

}


forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 55
    s1*8
    \bar "||"

}

Valto = {
    \new Voice = "vicisti"
    <<\Valton \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}




VIalton = \relative do' {

    \autoBeamOff

    R1*3
    mi8[fad16 sol] fad8 mi fad si, r16 mi[red mi]
    fad8 si, r16 mi [red mi] fad8 si,  r16 mi red mi

    %6
    fad8 sol16[la] si4 r2\mbreak
    r2 r4 si8 fad
    sol mi r4 mi8[fad16 sol] fad8 mi

    %9
    fad si, r16 mi red mi fad8 si,16 si si'8 si
    si1~
    si

    %12
    si4 si8 la\mbreak sol red mi fad
    sol la sol fad16 mi mi4 r8 sol
    fad4 r8 sol fad4 si8 la

    %15
    sol red mi fad sol la sol8 fad16 mi\mbreak
    mi4 sol8 fad16 mi mi4 sol8 fad16 mi
    mi4 r r2

    %18
    r4 mi8 fad sol mi sol fad16 mi
    re8 dod16 si r4 r sol'8 fad16 mi
    re8 dod16 si si'8 lad\mbreak si fad r4

    %21
    r si8 lad si fad sol sol16 sol
    sol8 fad16 fad fad8 fad si mi, mi mi16 mi
    mi8[re] sol fad lad si re, dod16 si\mbreak

    %24
    si4 r r sol'8 sol16 sol
    sol8 fad16 fad fad8 fad si mi, mi mi16 mi
    mi8[re] sol fad lad si re, dod16 si

    %27
    si4 r r2
    R1*3\mbreak
    mi8[fad16 sol] fad8 mi fad si, r16 mi[red mi]

    %32
    fad8 si, r16 mi [red mi] fad8 si,  r16 mi red mi
    fad8 sol16[la] si4 r2\mbreak
    r2 r4 si8 fad

    %35
    sol mi r4 mi8[fad16 sol] fad8 mi
    fad si, r16 mi red mi fad8 si,16 si si'8 si
    si1~

    %38
    si
    si4 si8 la\mbreak sol red mi fad
    sol la sol fad16 mi mi4 r8 sol

    %41
    fad4 r8 sol fad4 si8 la
    sol red mi fad sol la sol8 fad16 mi\mbreak
    mi4 sol8 fad16 mi mi4 sol8 fad16 mi

    %44
    mi4 r r2

}

VItesto = \lyricmode {

    Sem - per gratus, _ sem - per gra - tus,
    de -- side - ra -- bi -- lis,
    sem -- per, sem -- per, sem - per gratus, _
    de -- side - rabilis, _ _ sem -- per, sem -- per, sem -- per e -- ris,
    sem -- per, sem -- per, e -- ris
    in me, in me, in me sem -- per e -- ris,
    sem -- per, sem -- per eris _ in me, eris _ in me, in me e -- ris.

    Ve -- ni_o ca -- re to -- tus a -- ma -- bilis _
    to -- tus a -- ma -- bilis, _ ca -- re ca -- re ij _  to -- tus a -- mabi - lis,
    ca -- re in ae -- ternum _ di -- ligam _ te,
     in ae -- ternum _ di -- ligam _ te,  to -- tus a -- ma -- bilis, _
     in ae -- ternum _ di -- ligam _ te, in ae -- ternum _ di -- ligam _ te.

     Sem - per gratus, _ sem - per gra - tus,
    de -- side - ra -- bi -- lis,
    sem -- per, sem -- per, sem - per gratus, _
    de -- side - rabilis, _ _ sem -- per, sem -- per, sem -- per e -- ris,
    sem -- per, sem -- per, e -- ris
    in me, in me, in me sem -- per e -- ris,
    sem -- per, sem -- per eris _ in me, eris _ in me, in me e -- ris.

}


VIvlIn = \relative do'' {

    mi8 fad16 sol fad8 mi  fad si, r16 mi red mi
    fad8 si, r16 mi red mi fad8 si, r16 mi red mi
    fad8 sol16 la si8 mi, la16 si sol la fad8. fad16\mbreak

    %4
    mi4 r r2
    R1
    r4 r16 fad mi fad sol8 la16 si red,8 mi

    %7
    red4 r16 mi red mi fad8 si, r4
    r si'8 fad sol mi r4

    %9
    R1
    mi8 fad16 sol fad8 mi\mbreak fad8. si,16 si4
    r16 fad' mi fad sol4 r16 fad mi fad sol4

    %12
    red r r2
    r r8 mi red mi
    r si' si16 la sol8 r2

    %15
    r4 r8 si, do si si4\mbreak
    la8 mi4 red8 mi4 si'
    si mi8 fad sol mi sol fad16 mi

    %18
    re8 dod16 si r4 r2
    r4 sol'8 fad16 mi re8 dod16 si r4
    r2 r4 si'8 lad

    %21
    si fad r4 r2\mbreak
    R1*2
    r4 sol8 fad lad si r4

    %25
    R1
    r4 si,8 si mi, si'4 lad8
    si4 r r2

    %28
    mi8 fad16 sol fad8 mi fad si, r16 mi red mi
    fad8 si, r16 mi red mi fad8 si, r16 mi red mi
    fad8 sol16 la si8 mi, la16 si sol la fad8. fad16\mbreak

    %31
    mi4 r r2
    R1
    r4 r16 fad mi fad sol8 la16 si red,8 mi

    %34
    red4 r16 mi red mi fad8 si, r4
    r si'8 fad sol mi r4

    %36
    R1
    mi8 fad16 sol fad8 mi\mbreak fad8. si,16 si4
    r16 fad' mi fad sol4 r16 fad mi fad sol4

    %39
    red r r2
    r r8 mi red mi
    r si' si16 la sol8 r2

    %42
    r4 r8 si, si do si4\mbreak
    la8 mi4 red8 mi4 si'
    si r r2

}

VIvlIIn = \relative do'' {

    sol'8 la16 si red,8 mi red4 r8 la'
    red,4 r8 la' red,4 r8 la'
    red, mi16 fad sol8 do red, mi mi8. red16

    %4
    mi4 r r2
    R1\mbreak
    r4 r16 red dod red mi8 fad16 sol fad8 mi

    %7
    fad si, r la' red,4 r
    r fad8 si si sol r4
    R1

    %10
    r2 r4 r16 mi red mi\mbreak
    fad8 si, r16 mi red mi fad8 si, r16 mi red mi
    fad4 r r2

    %13
    r r8 si, la sol
    r fad' sol16 fad mi8 r2
    r4 r8 fad, mi mi4 red8\mbreak

    %16
    mi4 si' la8 mi'4 red8
    mi4 si8 si si sol si dod
    fad,4 r r2

    %19
    r4 si8 dod fad,4 r
    r2 r4 re'8 mi
    fad dod r4 r2\mbreak

    %22
    R1*2
    r4 si8 si mi re r4
    R1

    %26
    r4 sol,8 si dod fad, fad4
    fad r r2
    sol'8 la16 si red,8 mi red4 r8 la'

    %29
    red,4 r8 la' red,4 r8 la'
    red, mi16 fad sol8 do red, [mi mi8. red16]
    mi4 r r2

    %32
    R1\mbreak
    r4 r16 red dod red mi8 fad16 sol fad8 mi
    fad si, r la' red,4 r

    %35
    r fad8 si si sol r4
    R1
    r2 r4 r16 mi red mi\mbreak

    %38
    fad8 si, r16 mi red mi fad8 si, r16 mi red mi
    fad4 r r2
    r r8 si, la sol

    %41
    r fad' sol16 fad mi8 r2
    r4 r8 fad, mi mi4 red8\mbreak
    mi4 si' la8 mi'4 red8

    %44
    mi4 r r2

}

VIbcn = \relative do {

    mi4 si'8 do si4 r8 do
    si4 r8 do si4 r8 do
    si la sol la16 sol fad8 mi si' si,

    %4
    mi4 red8 mi si4 r8 do
    si4 r8 do si4 r8 do
    si4 r\mbreak mi si'8 do

    %7
    si4 r8 do si4 red,
    mi red mi8 mi red mi
    si4 r8 do si4 r

    %10
    mi red8 mi si4 r8 sol'
    red8. red16 mi4 red8. red16 mi8 mi,
    si'' la sol fad\mbreak mi fad sol red

    %13
    mi la, si  si' mi, fad16 sol fad8 mi
    si' dod16 red mi8 mi, si' la sol fad
    mi fad sol red mi la si si,

    %16
    do16 si do la si8 si'\mbreak do16 si do la si8 si,
    mi4 mi8 red mi4 mi'8 lad,
    si4 sol8 fad mi4 mi'8 lad,

    %19
    si4  mi8 lad, si4 mi8 lad,
    si4 re8 dod re lad si dod
    re lad si dod\mbreak re re, mi fad16 sol

    %22
    la8 re, r re sol dod, r dod
    fad si, mi re dod si fad' fad,
    si4 mi8 re dod si mi fad16 sol

    %25
    la8 re, r re sol dod, r dod\mbreak
    fad si, mi re dod si fad' fad,
    si dod16 red dod8 si mi16 sol fad mi si'8 si,

    %28
    mi4 si'8 do si4 r8 do
    si4 r8 do si4 r8 do
    si la sol la16 sol fad8 mi si' si,

    %31
    mi4 red8 mi si4 r8 do
    si4 r8 do si4 r8 do
    si4 r\mbreak mi si'8 do

    %34
    si4 r8 do si4 red,
    mi red mi4 red8 mi
    si4 r8 do si4 r

    %37
    mi red8 mi si4 r8 sol'
    red8. red16 mi4 red8. red16 mi4
    si'8 la sol fad\mbreak mi fad sol red

    %40
    mi la, si  si' mi, fad16 sol fad8 mi
    si' dod16 red mi8 mi, si' la sol fad
    mi fad sol red mi la si si,

    %43
    do16 si do la si8 si'\mbreak do16 si do la si8 si,
    mi4 r r2

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <_+>8 <6> <_+>4 s8 <6>
    <_+>4 s8 <6> <_+>4 s8 <6>
    <_+>4 <6> <6+> <5 4>8 <_+>
    s4 <6> <_+> s8 <6>
    <_+>4 s8 <6> <_+>4 s8 <6>
    <_+>2\mbreak s4 <_+>8 <6>
    <_+>4 s8 <6> <_+>4 <6>
    s <6> s <6>
    <_+> s8 <6> <_+>4 s
    s <6> <_+> s8 <6>
    <6>2 <6>
    <_+>4 <6>8 <6+>\mbreak s <6+> <6> <6>
    s4 <6 4>8 <5 _+> s4 <6+>
    <_+>2
    <_+>4 <6>8 <6+>
    s <6+> <6> <6> s4 <6 4>8 <5 _+>
    <6>4 <6 4>8 <5 _+>\mbreak <6>4 <6 4>8 <5 _+>
    s4 s8 <6> s4 s8 <6 5->
    <_+>4 <6>8 <6+> s4 s8 <6 5->
    s4 s8 <6 5+> s4 s8 <6 5->
    <_->4 <6>8 <6+> <6> <6 5-> s <6+>
    <6> <6> s <6+>\mbreak <6>2
    <7 _+>2 <7>8 <7> s <7>
    <_+>4 s8 <6> <6+>4 <6 4>8 <5 _+>
    s4 s8 <6>8 <6+>2
    <7 _+>2 <7>8 <7> s <7>\mbreak
    <7>4 s8 <6> <6+>4 <6 4>8 <5 _+>
    <_+>4 <6+> s <6 4>8 <5 _+>
    s4 <_+>8 <6> <_+>4 s8 <6>
    <_+>4 s8 <6> <_+>4 s8 <6>
    <_+>4 <6> <6 +> <6 4>8 <5 _+>\mbreak %% fine quart'ultima OOKK

    %31
    s4 <6> <_+> s8 <6>
    <_+>4 s8 <6> <_+>4 s8 <6>
    <_+>2 s4 <_+>8 <6>
    <_+>4 s8 <6> <_+>4 <6>
    s <6> s <6>
    <_+>4 s8 <6> <_+>2
    s4 <6> <_+> s8 <6>\mbreak
    <6>2 <6>
    <_+>4 <6>8 <6+> <6> <6+> <6> <6>
    s4 <6 4>8 <5 _+> s4 <6+>
    <_+>2 <_+>4 <6>8 <6+>
    s8 <6+> <6> <6>\mbreak s4 <6 4>8 <5 _+>
    <6>4 <6 4>8 <5 _+> <6>4 <6 4>8 <5 _+>

}


forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 40
    s1*44
    \bar "|."

}

VIvlI = {
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIalto = {
    \new Voice = "semper"
    <<\VIalton \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
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

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller\center-column {"Concerto Sacro III Op. II"}
        composer = \markup \center-column{"A. Scarlatti (1660 - 1725)"}
    }

    \markup \huge {[1.] Infirmata vulnerata - Largo}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r4 mi'8^\markup\center-align "Alto" mi'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto \global
                \new Lyrics \lyricsto "infirmata" \Itesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

    \markup \huge \column{"[2.] Recitativo - O! Care"}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key mi\minor \time 4/4 r4 fad'4(mi'16)^\markup\center-align "Alto" [re']}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIalto \global
                \new Lyrics \lyricsto "care" \IItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column  {"Violoncello"\vspace #-0.3"Basso continuo"}
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
                \override StaffGrouper.staff-staff-spacing.padding = #7
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

    \markup \huge {[3.] Vulnera percute - Largo}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key la\minor \time 3/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi mi'2. mi'4^\markup\center-align "Alto" fa'2}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto \global
                \new Lyrics \lyricsto "vulnera" \IIItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
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
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

    \markup \huge \column{"[4.] Aria andante - Cur  quæso crudelis"}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 3/8\numericTimeSignature sol'4. la'^\markup\center-align "Alto"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IValto \global
                \new Lyrics \lyricsto "cur" \IVtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column  {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

    \markup \huge \column{"[5.] Recitativo - Vicisti"}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key mi\minor \time 4/4 r4 r8  la'8 la'8^\markup\center-align "Alto" mi'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Valto \global
                \new Lyrics \lyricsto "vicisti" \Vtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column  {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 20)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #7
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

    \markup \huge {[6.] Semper gratus - Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key mi\minor \time 4/4 R1*3 mi'8[fad'16 sol']^\markup\center-align "Alto"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \VIalto \global
                \new Lyrics \lyricsto "semper" \VItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

