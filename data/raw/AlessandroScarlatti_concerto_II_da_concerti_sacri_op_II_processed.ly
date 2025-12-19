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


Icanton = \relative do'' {

    \autoBeamOff

    R1*4
    r2 r8 do do sol
    do16[re mi fa] re[mi fa sol] mi8. re16 do4
    R1

    %8
    r8 do do sol do16[re mi fa] re[mi fa sol]\mbreak
    mi8. re16 do8 re re16[do si do] re8 mi
    re8. sol,16 sol4 r8 sol do re

    %11
    mi16[fa re mi] do[re si re] do8. sol16 sol4
    r sol8 sol sol la16 si do[re mi fad]\mbreak
    sol8 fad16 mi re8. [do16] si4 r

    %14
    r2 r8 re mi16[re] mi[do]
    re8. re16 do4 r8 re mi16[re] mi[do]
    re8. re16 do4 r8 re mi16[re] mi[do]

    %17
    re8. re16 do8 do16 si\mbreak la8 la16 si do [re mi fa]
    sol8 fa16 mi re4 do r8 do16 si
    la8 la16 si do[re mi fa] sol8 fa16 mi re4

    %20
    do r r2
    R1
    r2 r4 r8 mi\mbreak

    %23
    re16[si] mi[re] do8. do16 si4 r8 mi
    re16[si] mi[re] do8. do16 si4 r
    r8 re re re re16[mi re mi] re[mi re mi]

    %26
    re8. do16 si8 sol'16 re\mbreak mi8 re r sol16 re
    mi8 re16 do re[mi do re] re8 do16 si la4
    sol r r2

    %29
    r4 r8 re' re16[si] mi[re] do8. do16
    si4 r8 re re16[si] mi[re] do8. do16\mbreak
    si4 r r8 mi mi mi

    %32
    mi16[fa mi fa] mi [fa mi fa] mi8. re16 dod8 la'16 mi
    fa8 mi r la16 mi fa8 mi16 re mi[fa re mi]
    fa8 re16 do si4\mbreak la r

    %35
    r2 r8 do do sol
    do16[re mi fa] re[mi fa sol] mi8. re16 do4
    R1

    %38
    r8 do do sol do16[re mi fa] re[mi fa sol]\mbreak
    mi8. re16 do8 re re16[do si do] re8 mi
    re8. sol,16 sol4 r8 sol do re

    %41
    mi16[fa re mi] do[re si re] do8. sol16 sol4
    r sol8 sol sol la16 si do[re mi fad]\mbreak
    sol8 fad16 mi re8. [do16] si4 r

    %44
    r2 r8 re mi16[re] mi[do]
    re8. re16 do4 r8 re mi16[re] mi[do]
    re8. re16 do4 r8 re mi16[re] mi[do]

    %47
    re8. re16 do8 do16 si\mbreak la8 la16 si do [re mi fa]
    sol8 fa16 mi re4 do r8 do16 \parenthesize si
    la8 la16 si do[re mi fa] sol8 fa16 mi re4

    %50
    do r r2
    R1*2

}

Itesto = \lyricmode {

    Jam sole _ cla - - rior, _ jam sole _ cla - - rior _
    A -- mic - tus lu -- mine _ coe -- lesti _ glo - - ri -- a
    Nico - laus _ ad E - thera _ spi -- rat.

    Jam so -- le cla -- rior, _
    A -- mic -- tus lu -- mine _ coe -- les -- ti glo -- ria _
    Nico - laus _ ad E - thera _ spi -- rat,
    Nico - laus _ ad E - thera _ spi -- rat.

    Et ple -- nus me -- ritis _ or -- na -- tus gra -- tia _ a -- more _ fer - - vidus _
    coelum _  pe -- tit coelum _ pe -- tit  ad As - tra su -- spi -- rat,
    & ple -- nus me -- ritis _ or -- na -- tus gra -- ti -- a a -- more _ fer - - vidus _
    coelum _  pe -- tit coelum _ pe -- tit  ad As - tra su -- spi -- rat,

   jam so -- le cla - - rior, _ jam so -- le cla - - rior _
    A -- mic - tus lu -- mine _ coe -- les -- ti glo - - ri -- a
    Nico - laus _ ad E - thera _ spi -- rat,

    jam so -- le cla -- rior, _
    A -- mic -- tus lu -- mine _ coe -- les -- ti glo -- ria _
    Nico - laus _ ad E - thera _ spi -- rat,
    Nico - laus _ ad E - thera _ spi -- rat.

}


IvlIn = \relative do'' {

    R1
    r8 sol' sol do, sol'16 la si do la si do re
    si8. la16 sol4 r r8 sol

    %4
    sol16 fa mi fa sol8 si sol si r16 si la sol\mbreak
    fa sol mi fa re8. re16 do4 r
    r2 r8 sol' sol do,

    %7
    sol'16 la si do la si do re re8 si si re
    sol,4 r r2
    R1

    %10
    r8 sol, do re\mbreak mi16 fa re mi do re si re
    do8 re mi sol r2
    sol16 la fa sol mi fa re fa mi4 r

    %13
    r re8 re re mi16 fad sol la si do
    re8 do16 si la4 sol r
    r8 re mi16 re mi do re8. re16 do4

    %16
    r8 re mi16 re mi do re8. re16 do4
    r4 r8 mi16 re do4 r
    r r8 sol'16 fa mi8 mi mi4

    %19
    r2 r4 r8 sol16 fa\mbreak
    mi4 r8 do'16 si la8 la,16 si do re  mi fa
    sol8 fa16 mi re4 do16 do re mi fa sol la si

    %22
    do8 do do8. si16 do4 r
    R1
    r2 r8 re, re re\mbreak

    %25
    re sol, r4 r2
    r8 sol' sol sol sol16 la sol la sol la sol la
    sol4 r r r8 re16 la

    %28
    si8 sol r sol'16 re mi8 re16 do re mi do re
    mi8 do16 si la4\mbreak sol8 si r4
    R1

    %31
    r8 mi mi mi mi la, r4
    r2 la'16 sib la sib la sib la sib
    la8 dod, re la fa'4 r

    %34
    r r8 mi16 si do8 mi la, la'\mbreak
    sol do do8. si16 do4 r
    r2 r8 sol sol do,

    %37
    sol'16 la si do la si do re si8 sol sol si
    sol4 r r2
    R1

    %40
    r8 sol, do re\mbreak mi16 fa re mi do re si re
    do8 re mi sol r2
    sol16 la fa sol mi fa re fa mi4 r

    %43
    r re8 re re mi16 fad sol la si do
    re8 do16 si la4 sol r
    r8 re mi16 re mi do re8. re16 do4

    %46
    r8 re mi16 re mi do re8. re16 do4
    r4 r8 mi16 re do4 r
    r r8 sol'16 fa mi8 mi mi4

    %49
    r2 r4 r8 sol16 fa\mbreak
    mi4 r8 do'16 si la8 la,16 si do re  mi fa
    sol8 fa16 mi re4 do16 do re mi fa sol la si

    %52
    do8 do do8. si16 do4 r

}

IvlIIn = \relative do'' {

    r8 do do sol do16 re mi fa re mi fa sol
    mi8. re16 do4 r r8 re
    re16 do si do re8 mi\mbreak re16 do re mi do re mi fad

    %4
    sol8 sol, mi' re mi fa?16 sol do,8 do'
    si do do8. si16 do4 r
    r2 r8  mi, mi fad

    %7
    re re re re\mbreak re mi mi re
    mi4 r r2
    R1*2

    %11
    r8 sol, do re mi16 fa re mi do re si re
    do8 re sol, sol' sol4 r
    r2 re8 re mi16 fad sol la\mbreak

    %14
    si8 la16 sol sol8. fad16 sol4 r
    r8 si,16 la sol4 r8 si16 la sol4
    r8 si16 la sol4 r8 si16 la sol4

    %17
    r8 sol'16 fa mi4 r2
    r r8 mi16 re do4
    R1\mbreak

    %20
    r8 mi16 re do4 r8 do16 si la si do re
    mi8 re16 do do8. si16 do8 sol re'16 mi fa re
    sol8 la re,4 do r  %% ricopiare fin qui dalla battuta 8

    %23
    R1
    r2 r8 sol si fad\mbreak
    sol re r4 r2

    %26
    r r8 si' mi si
    mi4 r r2
    r8 sol16 re mi8 re sol, sol' sol sol,

    %29
    sol sol' sol8. fad16 sol8 mi r4
    R1
    r8 si do sold\mbreak la mi r4

    %32
    R1
    la'16 sib la sib la sib la sib la4 r
    r2 r8 la16 mi fa mi fa mi

    %35
    re la' fa mi re8. re16 do4 r\mbreak
    r2 r8 fa mi fad
    re re re re re mi mi re

    %38
    mi4 r r2
    R1*2
    r8 sol, do re mi16 fa re mi do re si re

    %42
    do8 re sol, sol' sol4 r
    r2 re8 re mi16 fad sol la\mbreak
    si8 la16 sol sol8. fad16 sol4 r

    %45
    r8 si,16 la sol4 r8 si16 la sol4
    r8 si16 la sol4 r8 si16 la sol4
    r8 sol'16 fa mi4 r2

    %48
    r r8 mi16 re do4
    R1\mbreak
    r8 mi16 re do4 r8 do16 si la si do re

    %51
    mi8 re16 do do8. si16 do8 sol re'16 mi fa re
    sol8 la re,4 do r

}

Ibcn = \relative do {

    do'4. si8 la do si sol
    do4 r8 la si sol fad re
    r sol sol do, sol'16 la si do la si do re

    %4
    si8 do do sol do16 si la sol la sol fa mi\mbreak
    re8 do sol' sol, do4 r
    r2 r8 do' do la

    %7
    si sol fad re sol si si sol
    do4. si8 la do si sol
    do si la fad r sol sol do,

    %10
    sol'16 fa mi re mi re do si do8 si la sol
    do si la sol\clef tenor r do do' re

    %12
    mi16 fa re mi do re si re do8 si \clef bass la la,
    si do re re, sol' fad mi re16 do
    si8 do re re, sol sol' do do,\mbreak

    %15
    r sol' do do, r sol' do do,
    r sol' do do, r sol' do do,
    r sol' la mi fa4 mi~

    %18
    mi8 fa sol sol, do do'16 si la8 mi
    fa4 mi4. fa8 sol sol,
    do do'16 si la8 mi fa fa16 sol la8 sol16 fa\mbreak

    %21
    mi8 fa sol sol, do4 r8 re
    mi fa sol sol, do4 r8 do'
    si do16 si la8 re, sol4 r8 do

    %24
    si do16 si la8 re, sol16 la si la sol8 re
    sol16 la si la sol8 re sol re sol re
    sol16 la si la sol8 si\mbreak do sol do sol

    %27
    do si16 la si8 la16 si do8 do, re re,
    sol si do si do si16 la si8 la16 si
    do8 do re re, sol sold la do16 re

    %30
    mi4 r8 fad sold4 la8 la,
    mi' sold la mi\mbreak do'16 si la si do8 sold
    la mi la mi la mi la dod,

    %33
    re la' fa dod re re' dod si16 dod
    re8 re, mi mi, la do re re'16 do
    si8 do fa, sol do,4 r\mbreak

    %36
    r2 r8 do' do la
    si sol fad re sol do do sol
    do4 r8 si8 la do si sol %% copiare 17 battute da battuta 8 a 22

    %39
    do si la fad r sol sol do,
    sol'16 fa mi re mi re do si do8 si la sol

    %41
    do si la sol\clef tenor r do do' re
    mi16 fa re mi do re si re do8 si \clef bass la la,
    si do re re, sol' fad mi re16 do

    %44
    si8 do re re, sol sol' do do,\mbreak
    r sol' do do, r sol' do do,
    r sol' do do, r sol' do do,

    %47
    r sol' la mi fa4 mi~
    mi8 fa sol sol, do do'16 si la8 mi
    fa4 mi4. fa8 sol sol,

    %50
    do do'16 si la8 mi fa fa16 sol la8 sol16 fa\mbreak
    mi8 fa sol sol, do4 r8 re
    mi fa sol sol, do4 r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4. <6>8 s4 <6>
    s2 <6>4 <6>
    s1
    <6>
    <6>4 <5 4>8 <3> s2
    s1
    <6>4 <6> s8 <6> s4
    s4. <6>8 s4 <6>
    s4 s8 <6 5-> s2
    s1
    s2 s4 s8 <6>
    <6>1
    <6>4 <5 4>8 <3+> <6>2
    <6>4 <5 4>8 <_+> s2
    s1*2
    s4 s8 <6> s4 <6>
    s8 <6 5> <5 4> <3> s4 s8 <6>
    s4 <6>4. <6 5>8 <5 4> <3>
    s4 s8 <6> s4 <6>
    <6>8 <6 5> <5 4> <3> s4 s8 <6>
    <6> <6 5> <5 4> <3> s2
    <5>4 s8 <7 _+> s2
    <6>4 s8 <7 _+>  s <6> s <_+>
    s4 s8 <_+> s <_+> s <_+>
    s4 s8 <6> s2
    s4 <6> s <5 4>8 <_+>
    s2 s4 <6>
    s4 <5 4>8 <_+> s <6> s <6>
    <_+>4 s8 <6> <6>4 s
    <_+>8 <6> s4 <6> s8 <6>
    s2 s4 s8 <6>
    <_-> <_+> <6> <6> s4 <6>
    s <5 4>8 <_+> s2
    <6>4 <6 5>s2
    s s4 s8 <6+>
    <6>4 <6> s2
    s4 s8 <6> s4 <6>
    s8 <6> s <6 5-> s2
    s4 <6> s2
    s2 s4 s8 <6>
    <6>2 s4 s8 <6+>
    <6>4 <5 4>8 <_+> s <6> s4
    <6>8 <6 5> <5 4> <_+> s2
    s1*2
    s2 s4 <6>
    s8 <6 5> <5 4> <3> s4 s8 <6>
    s4 <6>4. <6 5>8 <5 4> <3>
    s4 s8 <6> s2
    <6>8 <6 5> <6 4> <3> s4 s8 <6>
    <6>8 <6 5> <6 4> <3>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 55
    s1*52
    \bar "||"

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Icanto = {
    \new Voice = "jam"
    <<\Icanton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIcanton = \relative do'' {

    \autoBeamOff

    r4 re2 si8 re
    sol, sol sol la si4 si
    r16 re,[mi fad] sol[fad sol la] si[la sol la] si[la si do]

    %4
    re[do si do] re[mi fad re]\mbreak sol8 re16 re mi8 mi
    mi mi r mi mi si do re
    do do r mi fa fa16 mi re8 do

    %7
    si[mi16 re] mi[si do re] do[re mi do] la[si do re]
    si2 la

}

IItesto = \lyricmode {

    Hic magnus _ ille _ Nico - laus _
    glo - - - - - - ria _ sacer - dotum _ qui potens _ fuit _
    semper _  in o -- pere _ & ser -- mo - - - - ne

}

IIbcn = \relative do {

    sol'1~
    sol
    sol,~

    %4
    sol
    sold
    la2 re

    %7
    sold, la
    mi' la,

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    <6>1
    s
    <6>
    <5 4+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 65
    s1*8
    \bar "||"

}
IIcanto = {
    \new Voice = "hic"
    <<\IIcanton \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIcanton = \relative do'' {

    \autoBeamOff

    R1.*3
    r2. re8 [mi re] dod [re dod]
    re [mi re] dod [re dod] re [mi re] la [sib la]

    %6
    sib [do? sib] sol [la sol] la2.~
    la la
    R1.*2

    %10
    re8 [mi re] dod [re dod] re [mi re] dod [re dod]
    re [mi re] la [sib la] sib [do? sib] sol [la sol](
    la4.) si? dod re

    %13
    mi fa\mbreak mi8 [fa re] dod [si dod]
    re2.~re8[mi re] do?[re do]
    si[do si] mi4.~mi8[fa mi] re[mi re]

    %16
    dod[re dod] fa4.~fa8[sol fa] mi[fa mi]
    re[fa mi] re4.~\mbreak re8[mi re] dod4.
    re r4 r8 sib8 [do sib] la[sib la]

    %19
    sib[do sib] la[sib la] fa[sol fa] sol[la sol]
    la4. si? dod re
    mi fa mi8[fa re] dod[si dod]

    %22
    re2.~re8[mi re] do?[re do]
    si[do si] mi4.~mi8[fa mi] re[mi re]
    dod[re dod] fa4.~fa8[sol fa] mi[fa mi]

    %25
    re[fa mi] re4.~\mbreak re8[mi re] dod[si dod]
    re4. r4 r8 r2.
    la8[si la] si[do si] do[re do] mi[fa mi]

    %28
    la,[si la] si[do si] do2.~
    do\mbreak sol8[la sol] do[re do]
    do2. sol8[la sol] do[re do]

    %31
    la[si la] re[mi re] si[do si] mi[fa mi]
    do[re do] fa[sol fa] re[mi re] sol[la sol]\mbreak
    mi4. re fa mi

    %34
    re do fa mi
    re do do8[re do] si[la si]
    do2.~do~

    %37
    do8[re do] sol[la sol] mi[fa mi] do[re do]\mbreak
    do'2.~do~
    do8[re do] sol[la sol] mi[fa mi] do[re do]

    %40
    do'[re do] re[mi re] mi[fa mi] fa[sol fa]
    sol[fa mi] mi[re do] sol'[fa mi] mi[re do]\mbreak
    sol'[fa mi] re4. do r4 r8

    %43
    R1.
    r2. mi,8[fad mi] fad[sold fad]
    sold[la sold] la[si la] fad[sold fad] sold[la sold]

    %46
    la2.~\mbreak la
    mi'8[fa? mi] do[re do] la2.
    mi'8[fa mi] do[re do] la[si la] mi[fad mi]

    %49
    fad[sol fad] si[do si] sold[la sold] mi'[fa mi]\mbreak
    do4. si re do
    si la re do

    %52
    si la la8[si la] sold[fad sold]
    la2.~la~
    la8[si la] mi[fa? mi] la[si la] do[re do]\mbreak

    %55
    mi2.~mi~
    mi8[fa mi] si[do si] sold[la sold] mi[fa mi]
    la2.~la~

    %58
    la8[si la] do[re do] mi[fa mi] fa[mi re]
    mi[fa mi] fa[mi re]\mbreak mi[re do] do[si la]
    mi'[re do] do[si la] mi'[re do] si4.

    %61
    la do4 la8 mi'[re do] do[si la]
    mi'[re do] si4. la r4 r8
    R1.*3

    %66
    r2. re8 [mi re] dod [re dod]
    re [mi re] dod [re dod] re [mi re] la [sib la]

    %68
    sib [do? sib] sol [la sol] la2.~
    la la
    R1.*2

    %72
    re8 [mi re] dod [re dod] re [mi re] dod [re dod]
    re [mi re] la [sib la] sib [do? sib] sol [la sol](
    la4.) si? dod re

    %75
    mi fa\mbreak mi8 [fa re] dod [si dod]
    re2.~re8[mi re] do?[re do]
    si[do si] mi4.~mi8[fa mi] re[mi re]

    %78
    dod[re dod] fa4.~fa8[sol fa] mi[fa mi]
    re[fa mi] re4.~\mbreak re8[mi re] dod4.
    re r4 r8 sib8 [do sib] la[sib la]

    %81
    sib[do sib] la[sib la] fa[sol fa] sol[la sol]
    la4. si? dod re
    mi fa mi8[fa re] dod[si dod]

    %84
    re2.~re8[mi re] do?[re do]
    si[do si] mi4.~mi8[fa mi] re[mi re]
    dod[re dod] fa4.~fa8[sol fa] mi[fa mi]

    %87
    re[fa mi] re4.~\mbreak re8[mi re] dod[si dod]
    re4. r4 r8 r2.

}

IIItesto = \lyricmode {

    In -- ter un -- das fluc -- tu -- an- - - tes.
    In -- ter un -- das fluc -- tu -- an- - tes
    tam -- quam la -- pis an -- gu -- la- - - - - - - - - - - ris,
    in -- ter un -- das fluc -- tu -- an -- tes
    tam -- quam la -- pis an -- gu -- la- - - - - - - - - - - ris.

    In -- ter fluc -- tus jam spu -- man- - - - - - - - - - - - - - - tes
    sem -- per cons -- tans, sem -- per cons -- tans
    im -- mor -- ta- - - - - - - - - - - - - - - - - - lis.
    In -- ter fluc -- tus jam spu -- man- - - - - - - - - - - - - tes
    sem -- per cons -- tans, sem -- per cons -- tans
    im -- mor -- ta- - - - - - - - - - - - - - - - - - - - lis, im -- mor -- ta- - - - lis.

    In -- ter un -- das fluc -- tu -- an- - - tes,
    in -- ter un -- das fluc -- tu -- an - tes
    tam -- quam la -- pis an -- gu -- la- - - - - - - - - - - ris,
    in -- ter un -- das fluc -- tu -- an -- tes
    tam -- quam la -- pis an -- gu -- la- - - - - - - - - - - ris.

}

IIIbcn = \relative do {

    re'8 mi re dod re dod re mi re dod re dod
    re mi re la sib la sib do? sib sol la sol
    la sib la fa sol fa sol la sol la sol la\mbreak

    %4
    re,4. r4 r8 r2.
    R1.
    r2.  re'8 mi re dod re dod

    %7
    re mi re dod re dod re mi re la sib la
    sib do? sib sol la sol la sib la fa sol fa\mbreak
    sol la sol la sol la re,4. r4 r8

    %10
    re4. mi fa mi
    re fa sol mi
    fa8 sol fa sol la sol mi fa mi fa sol fa

    %13
    dod re dod re mi re\mbreak sol4. la
    re,8 mi re fad sol fad sol4. la
    sol sold8 la sold la4. si

    %16
    la fa8 sol fa re4. la'
    sib~sib8 la sol fa4 sol8 la4 la,8\mbreak
    re mi re fa sol fa sol4. dod,

    %19
    re dod re mi
    fa8 sol fa re mi re mi fa mi fa sol fa
    dod re dod re mi re sol4. la\mbreak

    %22
    re,8 mi re fad sol fad sol4. la
    sol sold8 la sold la4. si
    la fa?8 sol fa re4. la'

    %25
    sib~sib8 la sol fa4 sol8 la4 la,8
    re4. r4 r8 re8 mi re mi fa mi
    fa4. re mi do

    %28
    fa re do r4 r8
    mi fa mi fa sol fa mi4. r4 r8
    mi fa mi fa sol fa mi4. r4 r8

    %31
    fa4. re\mbreak  sol mi
    la re si sol
    do8 re do si do si la si la sol la sol

    %34
    fa sol fa mi fa mi la si la sol la sol
    fa sol fa mi fa mi fa4. re\mbreak
    do8 re do fa sol fa mi fa mi fa sol fa

    %37
    do4. r4 r8 r2.
    do8 re do fa sol fa mi fa mi fa sol fa
    do4. r4 r8 do'4. la

    %40
    mi re do re\mbreak
    mi r4 r8 mi4. r4 r8
    mi4 do8 sol'4 sol,8 do' si la la sol fa

    %43
    mi re do la' sol fa mi re do sol' fa sol
    do,4. r4 r8 do4. la
    si do\mbreak re si

    %46
    la r4 r8 do'8 re do re mi re
    do4. r4 r8 do8 re do re mi re
    do4. r4 r8 do,4. r4 r8

    %49
    re4. si mi sold
    la8 si la sol la sol\mbreak fa sol fa mi fa mi
    re mi re do re do fa sol fa mi fa mi

    %52
    re mi re do re do re4. si
    la8 si la re mi re do re do fa sol fa\mbreak
    do4. r4 r8 r2.

    %55
    mi8 fa mi la si la sold la sold la si la
    mi4. r4 r8 r2.
    la8 si la re mi re do re do re mi re

    %58
    la4. r4 r8 do4. re\mbreak
    do re la r4 r8
    do,4. r4 r8 do4 la8 mi'4 mi,8

    %61
    la4. r4 r8 do4. r4 r8
    do4 la8 mi'4 mi,8 la4. r4 r8
    re' mi re dod re dod\mbreak re mi re dod re dod

    %64
    re mi re la sib la sib do? sib sol la sol
    la sib la fa sol fa sol la sol la sol la
    re,4. r4 r8 r2.

    %67
    R1.\mbreak
    r2.  re'8 mi re dod re dod
    re mi re dod re dod re mi re la sib la
    sib do? sib sol la sol la sib la fa sol fa\mbreak

    %71
    sol la sol la sol la re,4. r4 r8
    re4. mi fa mi
    re fa sol mi

    %74
    fa8 sol fa sol la sol mi fa mi fa sol fa
    dod re dod re mi re\mbreak sol4. la
    re,8 mi re fad sol fad sol4. la

    %77
    sol sold8 la sold la4. si
    la fa8 sol? fa re4. la'
    sib~sib8 la sol fa4 sol8 la4 la,8\mbreak

    %80
    re mi re fa sol fa sol4. dod,
    re dod re mi
    fa8 sol fa re mi re mi fa mi fa sol fa

    %83
    dod re dod re mi re sol4. la\mbreak
    re,8 mi re fad sol fad sol4. la
    sol sold8 la sold la4. si?

    %86
    la fa?8 sol fa re4. la'
    sib~sib8 la sol fa4 sol8 la4 la,8
    re4. r4 r8 r2.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4. <6> s <6>
    s <_+> s <6>
    <_+> <6> <_-> s
    s1.*2
    s2. s4. <6>
    s <6> s <_+>
    s <_-> s <6>
    <_-> <_+> s s
    s <6+> <6> <6+>
    s <6> <_-> <6+>
    <6> s <6+> <6>
    <6> s <6 5> <_+>
    <_+> <6> s s
    s <6> s s
    <_+> <6> s <_+>
    s s <6>4 <6 5>8 <5 4>4 <_+>8\mbreak %%battuta 17
    s4. <6> <_-> <6>
    <6-> <6> s <6+>
    <6> <6!> <6+> <6>
    <6> s <6 5> <_+>\mbreak %%fine pagina
    <_+> <6> s s
    s <6> <_+> <6+>
    <_+> <6> s <_+>
    s s <6>4 <6 5>8 <5 4>4 <_+>8

    s4. s s <6>
    s <6> <6> s
    s <6> s s
    <6> s <6> s
    <6> s <6> s
    s1.
    s4. s <6> s
    s <6> <6> <6>
    <6> <6> <6> <6>
    <6> <6> s <6>
    s s <6> s
    s1.
    s2. <6>
    s1.
    <6>4. <6> s <6>
    <6> s <6> s
    <6> <5 4>4 <3>8 s2.
    <6> <6>
    s s4. <6+>
    <6+> <6> <_+> <6+>
    s2. <6>
    <6> <6>
    <6> <6>
    <_+> <_+>4. <6>
    s <6> <6> <6>
    <6> <6> <6> <6>
    <6> <6> s <6+>
    s2. <6>
    <6> s
    <_+> <6>
    <_+> s
    s <6>
    s <6>
    <6> s

    <6> <6>4. <5 4>4 <_+>8
    s2. <6>
    <6>4. <5 4>4 <_+>8 s2.
    s4. <6> s <6>
    s <6> s <_->
    <6> <6> <6 5> <6 5>4 <_+>8
    s1.*2
    s2. s4. <6>
    s <6> s <6>
    s <_-> <6> <6>
    <6 5> <5 4>4 <_+>8 s2.
    s4. <6+> s <6+>
    s <6> <_-> <6+>
    <6> s <6+> <6>
    <6> s <6 5> <_+>
    s <6> s <6+>
    s <6> <_+> <7>4 <6+>8
    <_+>4. <6> s <_+>
    s s <6> <5 4>4 <_+>8
    s4. <6> <_-> <6>
    <6-> <6 _+> <6-> <5->
    <6> <6!> <6+> <6>
    <6> s <6 5> <_+>
    s <6> s s
    s <6> <_+> s
    <_+> <6> s <_+>
    s s <6>4 <6 5>8 <5 4>4 <_+>8

}


forma = {

    \time 12/8
    \key do\major
    \tempo 2. = 65
    s1.*88
    \bar "||"

}

IIIcanto = {
    \new Voice = "inter"
    <<\IIIcanton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}





IVvlIn = \relative do'' {

    fa8 sol fa mi fa mi fa sol fa mi fa mi
    fa sol fa re mi re mi fa mi re mi re
    mi fa mi do re do re mi re si do si\mbreak

    %4
    dod4. la'8 sib la fa sol fa fa sol fa
    sol la sol sol la sol mi fa mi mi fa mi
    fa sol fa fa sol fa re mi re mi fa mi

    %7
    dod4. r4 r8\mbreak la4. si
    dod re mi fa
    mi8 fa re dod si dod re fa mi fa la sol

    %10
    la fa mi fa4.~fa8 mi re dod si dod
    re fa mi fa la sol\mbreak la fa mi fa4.~
    fa8 mi re dod si dod re4. r4 r8

}

IVvlIIn = \relative do'' {

    re8 mi re dod re dod re mi re dod re dod
    re mi re si do? si do re do si do si
    do re do la si la\mbreak si do si sold la sold

    %4
    la4. r4 r8 r4 r8 la4.
    re4. r4 r8 r4 r8 sol,4.
    do r4 r8 fa sol fa sol la sol

    %7
    mi4. r4 r8 re4. re,\mbreak
    sol la la la
    sib mid, fa8 la sol la fa' mi?

    %10
    fa la sol la4.~ la8 sol fa mi re mi
    fa4. r4 r8 r4 r8 r la sol
    la sol fa mi fa mi re4. r4 r8

}

IVbcn = \relative do {

    r4 r8 la'4. re, la'
    re, sol do, sol'
    do, fa re mi

    %4
    la, r4 r8 r4 r8 re'4.
    sib r4 r8 r4 r8 do4.
    la r4 r8 sib4. sol

    %7
    la r4 r8 \mbreak fa8 sol fa sol la sol
    mi fa mi fa sol fa dod re dod re mi re
    sol4. la re, r4 r8

    %10
    r4 r8 r re dod re4. la'
    re, r4 r8 r2.
    re4. la' re, r4 r8

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4. <_+> s <_+>
    s1.
    s4. s <6 5> <_+>
    <_+>1.
    <6>
    <6>2. s4. <6 5 _->
    <_+> s <6> <6 5>
    <6+> <6> <6> s
    <6 5> <_+> s s
    s s4 <6>8 s4. <_+>
    s1.
    s4. <_+>

}


forma = {

    \time 12/8
    \key do\major
    \tempo 2. = 65
    s1.*12
    \bar "||"

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}




Vcanton = \relative do'' {

    \autoBeamOff

    r4 re8 sib fa'4 re8 fa
    mib8. [re16] mib[do re mib] la,8.[sib16] do[sib la sib]
    do[sib la sib] do[re mib re] mib8 mib fa do

    %4
    re4 re r fa,\mbreak
    sib8 sib sib sib16 la do8. do16 do4
    r do8 re re[do16 si?] la[sol fad mi?]

    %7
    re4 re re'8 la si do
    si8. si16 si4 r re8 mi
    mi[re16 do]si[la sold fad]\mbreak mi4 mi

    %10
    mi'8 si do re do8. do16 do8 mi
    la,[si16 do] re[mi do re] si8[do16 re] sol,8[la16 si]
    la2 sol

}

Vtesto = \lyricmode {

    No -- vus is -- te de -- fen - - - - - - sor ve -- ri -- tatis. _
    Non mi -- nas ju -- dicum _ ti -- muit _ nec
    ter -- re - - næ di -- gni -- ta -- tis glo -- riam _ nec
     ter -- re - - næ di -- gni -- ta --  tis glo -- riam -  que
    sci - - - - vit.

}

Vbcn = \relative do {

    sib1
    do~
    do

    %4
    sib
    sol2 fa
    fa fad

    %7
    fa?1
    sol
    sold~

    %10
    sold2 la
    fad' sol
    re sol,

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <7 _->2 <6>
    <6 _->1
    s
    <6 _->4 <6> s2
    s <6>
    <6>1
    s
    <6>
    <6>4 <5-> s2
    <6>1
    <4+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 55
    s1*12
    \bar "||"

}

Vcanto = {
    \new Voice = "novus"
    <<\Vcanton \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}




VIcanton = \relative do'' {

    \autoBeamOff

    sol4.
    do
    re

    %4
    mi8. re16 do8
    R4.*3
    sol4.

    %9
    do
    re
    mi8. re16 do8

    %12
    mi re do
    si8. la16 sol8
    R4.*4

    %18
    re'8 mi16[re] do[si]
    la4 la8
    R4.*2\mbreak

    %22
    re8 mi16[re] do[si]
    la8 la la
    fad16[mi fad mi fad re]

    %25
    la'8 r r
    r16 la [re la re la]
    re8 r r

    %28
    r16 re[fad re fad re]
    fad8 r r\mbreak
    r16 fad[la fad re la]

    %31
    re [la re la fad re]
    re'8 la r
    R4.

    %34
    r8 re re
    re4.~
    re~

    %37
    re~
    re~
    re~

    %40
    re
    re4 re8
    si sol sol'16 fa?\mbreak

    %43
    mi8 do r
    R4.
    mi8 la,4

    %46
    sol r8
    mi'8 la,4
    sol r8

    %49
    R4.
    sol
    do

    %52
    re
    mi8. re16 do8

    %54
    R4.*2
    mi8 re do
    si8. la16 sold8

    %58
    R4.*4\mbreak
    mi'8 fa16[mi] re[do]
    si4 si8

    %64
    R4.*2
    mi8 fa16[mi] re[do]
    si8 si si

    %68
    sold16[fad sold fad sold mi]
    si'8 r r
    r16 si[mi si mi si]

    %71
    mi8 r r\mbreak
    r16 si[mi si sold mi]
    mi'[si mi si sold mi]

    %74
    mi'8 si r
    R4.
    r8 mi mi

    %77
    mi4.~
    mi~
    mi~

    %80
    mi~
    mi~
    mi
    mi4 mi8\mbreak

    %84
    do8 la la'16 sol
    fa8 re re
    si sol sol'16 fa

    %87
    mi8 do r
    R4.
    la'8 re,4

    %90
    do r8
    la'8 re,4
    do r8

    %93
    R4.
    sol8 sol sol
    si8. si16 si do\mbreak

    %96
    re[re sol re si do]
    re8 sol, r
    R4.

    %99
    sol8 sol sol
    si8 si16 si si do
    re[re sol re si do]

    %102
    re8 sol, r
    R4.
    sol8 sol sol

    %105
    do do r\mbreak
    do do do
    mi mi r

    %108
    r16 mi sol mi do sol
    do8 do r
    r16 mi sol mi do sol

    %111
    do8 do r
    r16 do do8 sol\mbreak
    r16 mi' mi8 do

    %114
    r16 sol' mi8 do
    R4.

}

VItesto = \lyricmode {

    Et for -- ti a -- nimo, _ et for -- ti a -- nimo, _
    in -- genti _ gau -- dio _ pro Chri -- sti fi -- de
    pro Chri -- sti fi -- de pu -- gna - - - - - - - - vit,
    su -- pe -- ra -- vit, pu -- gnavit, _
    su -- pe -- ravit, _ et vi -- cit, & vi -- cit, &
    for -- ti a -- nimo, _ in -- genti _ gau -- dio, _
    pro Chri -- sti fi -- de
    pro Chri -- sti fi -- de pu -- gna - - - - - - vit,
    su -- pe -- ra -- vit, pu -- gnavit, _
    su -- pe -- ra -- vit, pu -- gnavit, _
    su -- pe -- ravit, _ et vi -- cit, & vi -- cit, &
    for -- ti a -- nimo, _ pu -- gna - vit,
    in -- genti _ gau -- dio _ su -- pe -- ra - vit,
    pro Chri -- sti fi -- de
    pro Chri -- sti fi -- de pu -- gna -- vit,
    su -- pe -- ravit, _  pu -- gna -- vit,
    su -- pe -- ravit, _ et vi -- cit, & vi -- cit, & vi -- cit.

}


VIvlIn = \relative do'' {

    R4.*4
    sol'16 sol, sol sol si sol
    do do, do do' do do

    %7
    re re, re re' re re
    mi8. fa16 sol8
    R4.*5

    %14
    re'16 re, re re fad re
    sol sol, sol sol' sol sol\mbreak
    la la, la la' la la

    %17
    si8. do16 re8
    R4.
    re,8 do la

    %20
    si16 do si do re8
    R4.*4
    fad,16 mi fad mi fad re

    %26
    la'8 r r
    r16 la re la re la
    re8 r r\mbreak

    %29
    r16 re fad re fad re
    fad8 r r
    R4.

    %32
    r16 fad la fad re la
    re la re la fad re
    re'8 la r

    %35
    re'16 re, re re fad re
    la' la, la la' si sol\mbreak
    re' re, re re fad re

    %38
    sol sol, sol sol' si sol
    la re, re re fad re
    sol re re sol si sol

    %41
    re'8 re, r
    sol16 re si sol re si
    do' sol la si do re\mbreak

    %44
    mi fa sol la si do
    sol8 sol8. fad16
    sol si sol re si sol

    %47
    sol'8 sol8. fad16
    sol si, re do si la
    sol sol' sol8. fad16

    %50
    sol4 r8
    R4.*3
    sol8 fa re\mbreak

    %55
    mi16 fa mi fa sol8
    R4.*2
    mi'16 mi, mi mi sold mi

    %59
    la la, la la' la la
    si si, si si' si si
    do8. re16 mi8

    %62
    R4.*2
    mi,8 re si
    do16 re do re mi8

    %66
    R4.*3\mbreak
    r16 mi, sold fad sold mi
    si'8 r r

    %71
    r16 si mi si mi si
    mi8 r r
    R4.

    %74
    r16 si mi si sold mi
    mi' si mi si sold mi
    mi'8 si r

    %77
    mi'16 mi, mi mi sold mi
    la la, la la' do la
    mi' mi, mi mi  sold mi

    %80
    la la, la la' do la
    si mi, mi mi sold mi
    la mi do la mi mi

    %83
    mi'8 mi, r
    R4.*3
    sol'16 mi do sol mi do

    %88
    do' sol do mi sol mi
    do'8 do8. si16
    do16 mi, do sol do mi

    %91
    do'8 do8. si16
    do16 mi, sol fa mi re
    do do' do8. si16

    %94
    do4 r8
    re,4 r8\mbreak
    re4 r8

    %97
    si16 si si si si sol
    si si si si si sol
    si8 re r

    %100
    re4 r8
    re4 r8
    si16 si si si si sol

    %103
    si si si si si sol
    si8 re r
    do16 do do do do sol

    %106
    la8 do r
    sol16 sol sol sol sol mi
    sol mi mi' mi sol8

    %109
    r16 mi sol mi do sol
    do8 do, r
    r16 mi' sol mi do sol

    %112
    do8 r16 do mi sol\mbreak
    sol,8 r16 do mi sol
    do,8 r16 do mi sol

    %115
    do8 r r

}

VIvlIIn = \relative do'' {

    R4.*19
    si'8 la fad
    sol16 la sol la si8

    %22
    R4.*26
    r16 sol si la sol fad
    mi8 la,8. la16

    %50
    si4 r8\mbreak
    R4.*3
    mi8 re si

    %55
    do16 re do re mi8
    R4.*8
    do'8 si sold

    %65
    la16 si la si do8
    R4.*26
    r16 do, mi re do si

    %93
    la la' re,8. re16\mbreak
    mi4 r8
    si'4 r8

    %96
    si4 r8
    re,16 re re re re re
    re re re re re re

    %99
    re8 si r
    si'4 r8
    si4 r8

    %102
    re,16 re re re re re
    re re re re re re\mbreak
    re8 si r

    %105
    mi16 mi mi mi mi mi
    fa8 la, r
    mi'16 mi mi mi mi sol

    %108
    mi sol, do mi mi8
    R4.*7

}

VIbcn = \relative do {

    do8 do' si
    la mi fa
    re sol sol,

    %4
    do4.
    do8 do' si
    la mi fa

    %7
    re sol sol,
    do do' si
    la mi fa

    %10
    re sol sol,
    do4.
    do'8 si la

    %13
    sol4.\mbreak
    sol,8 sol' fad
    mi si do

    %16
    la re re,
    sol4.
    si8 do sol

    %19
    re'4 re8
    si do re
    sol,4.

    %22
    si8 do sol
    re'4 r8
    re4 r8

    %25
    re4 r8
    re4 r8
    re4 r8

    %28
    re4 r8
    re4 r8
    re4 r8

    %31
    re4 r8
    re4 r8
    re4 r8

    %34
    re4 r8
    re4 r8
    si4 r8

    %37
    fad4 r8
    si4 r8
    re4 r8

    %40
    si4 r8
    fad4 r8
    sol si sol

    %43
    do4 r8\mbreak
    do4 r8
    do re re,

    %46
    sol4 r8
    do re re,
    sol4 sol'8

    %49
    do re re,
    sol, sol' fa
    mi fa mi

    %52
    re sol sol,
    do4.
    mi8 fa sol

    %55
    do,4.
    la8 sol fa
    mi'4.\mbreak

    %58
    mi8 mi' re
    do re la
    re, mi mi,

    %61
    la4 r8
    do re la
    mi'4 r8

    %64
    do re mi
    la,4 r8
    do re la

    %67
    mi'4 r8
    mi4 r8
    mi4 r8

    %70
    mi4 r8
    mi4 r8
    mi4 r8

    %73
    mi4 r8
    mi4 r8
    mi4 r8

    %76
    mi4 r8
    mi4 r8
    do4 r8

    %79
    sold4 r8
    do4 r8
    mi4 r8

    %82
    do4 r8
    sold4 r8
    la do la

    %85
    re fa re
    sol si sol\mbreak
    do4 r8

    %88
    R4.
    fa,8 sol sol,
    do4 r8

    %91
    fa sol sol,
    do4 do'8
    fa, sol sol,

    %94
    do4 r8
    sol'4 r8
    sol4 r8

    %97
    sol16 sol sol sol sol si
    sol sol, sol' sol sol si
    sol8 sol, r\mbreak

    %100
    sol'4 r8
    sol4 r8
    sol16 sol sol sol sol si

    %103
    sol sol, sol' sol sol si
    sol8 sol, r
    la'16 la la la la do

    %106
    fa,8 fa, r
    do''16 do do do do mi
    do8 do, r

    %109
    R4.*7

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    s8 <6>4
    s8 <5 4> <3>
    s4.*2
    s8 <6>4
    s8 <5 4> <3>
    s4.
    s8 <6>4
    s8 <5 4> <3>
    s4.
    s8 s <6+>
    s4.
    s4 <6>8
    s <6> <6 5>
    s <5 4> <_+>
    s4.
    <6>
    <_+>
    <6>8 <6 5> <_+>
    s4.
    <6>8 <6 5> s
    <_+>4.
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <6>
    <6>
    <6>
    <_+>
    <6>
    <6>
    s8 <6> s
    s4.*2
    <6 5>8 <5 4> <_+>
    s4.
    <6 5>8 <5 4> <_+>
    s4.
    <6 5>8 <5 4> <_+>
    s4.
    <6>8 s <6>
    s <5 4> <3>
    s4.
    <6>8 <6 5> s
    s4.
    s8 <6+> s
    <_+>4.
    <_+>8 <_+> s
    <6>4.
    <6 5>8 <5 4> <_+>
    s4.
    <6>
    <_+>
    <6>8 <6 5> <_+>
    s4.
    <6>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <6>
    <6>
    <6>
    <_+>
    <6>
    <6>
     s8 <6>4
     s8 <6>4
     s8 <6>4
     s4.*2
     <6 5>8 <5 4> <3>
     s4.
     <6 5>8 <5 4> <3>
     s4.
     <6 5>8 <5 4> <3>

}


forma = {

    \time 3/8
    \key do\major
    \tempo 4. = 60
    s4.*115
    \bar "|."

}

VIvlI = {
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIcanto = {
    \new Voice = "forti"
    <<\VIcanton \forma>>
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
        title = \markup\smaller\center-column {"Concerto Sacro II Op. II"}
        composer = \markup \center-column{"A. Scarlatti (1660 - 1725)"}
    }

    \markup \huge {[1.] Jam sole clarior - Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 r2 r8 do''^\markup\center-align "Canto" do'' sol'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cnt"
                \Icanto \global
                \new Lyrics \lyricsto "jam" \Itesto
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

    \markup \huge \column{"[2.] [Recitativo] - Hic magnus"}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 r4 re''2^\markup\center-align "Canto"  si'8 re''}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cnt"
                \IIcanto \global
                \new Lyrics \lyricsto "hic" \IItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column  {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #5
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

    %\pageBreak

    \markup \huge {[3.] Inter undas fluctuantes - Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 12/8\numericTimeSignature r2 re''8^\markup\center-align "Canto" mi'' re''}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cnt"
                \IIIcanto \global
                \new Lyrics \lyricsto "inter" \IIItesto
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

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #5
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

\bookpart {

    \paper {

        systems-per-page = #5

    }

    \markup \huge {[4] Ritornello}

    \score {

        \new ChoirStaff <<

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
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge \column{"[5.] [Recitativo] - Novus iste"}

    \score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        }  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 r4 re''8^\markup\center-align "Canto"  sib'8 fa''4}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cnt"
                \Vcanto \global
                \new Lyrics \lyricsto "novus" \Vtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column  {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 19)
            indent = 2\cm

            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            }

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #5
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

    \markup \huge {[6.] Et forti animo - Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/8\numericTimeSignature sol'4. do''^\markup\center-align "Canto" re''}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cnt"
                \VIcanto \global
                \new Lyrics \lyricsto "forti" \VItesto
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