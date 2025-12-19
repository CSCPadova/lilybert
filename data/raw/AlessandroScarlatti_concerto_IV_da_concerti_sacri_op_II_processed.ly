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

    R1*5
    re4 re8 re sib' sib sib4~
    sib la re, re8 re

    %8
    fa4 fa8 mi mi4 mi
    r la2 sol8 fa\mbreak
    sol sol la sib la4 la

    %11
    r la sib8 sol sib4~
    sib8 la la mi fa4 fa
    r fa8 fa fad4. fad16 sol

    %14
    sol4 sol la4. la8
    sib4. do16 [sib]\mbreak la8 [sol fa mi]
    re [mi16 fa] sol4. fa16 [mi] fa [sol fa sol]

    %17
    mi2 re
    R1*3

}

Itesto = \lyricmode {

    Totus _ a -- more _ lan -- guens
    totus _ ar -- dore _ suc -- census, _
    er -- ga al -- taris _ sa -- cramen - tum,
    fi -- delis _ a -- nimus _ ar -- debat, _
    & in esta - sim rap -- tus, sic di -- ce - - - - - - - bat.

}


IvlIn = \relative do'' {

    re4 re8 re sib' sib sib4
    sib? la re, re8 re
    fa4 fa8 mi mi4 dod

    %4
    re8 la do!4. sib8 sib la
    la sol sol'4 mi2
    R1

    %7
    r4 la,2 sol4\mbreak
    la si mi,2
    re do

    %10
    r r4 do'
    re2. sol,4~
    sol8 fa mi la la4 re,

    %13
    re2 la'
    sib do4 re~
    re mi8 fa16 sol dod,2

    %16
    re4. re,8 la'2
    sib4 la8 sol fa2\mbreak
    re'4 re8 re sib' sib sib4

    %19
    sib? la  re2
    re4 dod re2

}

IvlIIn = \relative do'' {

    fa2 re4 sol~
    sol fa8 la4 sol8 re4~
    re re dod mi

    %4
    la,4. la'8 re,4. dod8
    re2 dod
    R1

    %7
    r4 fa,8 mi re2\mbreak
    re4 re2 dod8 si
    la1

    %10
    r2 r4 la'~
    la2 sol4 re
    mi2 re8 mi fa4

    %13
    fa2 do
    re la'~
    la4 sol fa2~

    %16
    fa4 re8 re' dod4 re~
    re dod\mbreak re re8 re
    la' la la2 sol8 re

    %19
    mi4 fa4. mi16 fa sol8 re
    mi2 re

}

Ibcn = \relative do {

    re2 sol
    dod,4 re sib'2
    la4 sold la4. sol?8

    %4
    fa4 fad sol4. la8
    sib2 la
    re, sol

    %7
    dod,4 re sib'2
    la4 sold la4. sol?8
    fa1\mbreak

    %10
    mi2 fa
    fad sol
    dod, re4. do?8

    %13
    sib2 la
    sol2. fad4
    sol2 la

    %16
    sib la4 re
    sol, la re2
    fa sol

    %19
    dod,4 re sib2
    la re

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <_->
    <7- 5-> <7>8 <6> s4
    <6 4> <7- 5-> <_+>s
    <6> <5-> <9 _->4 <8>8 <_+>
    <7>4 <6> <_+> s
    s2 <_->
    <7- 5->4  s <7> <6>
    <6 4> <7- 5-> <4> <3+>
    <6>2 <5>
    <6> s
    <6> <_->
    <7- 5-> s
    <5> <6+>
    <_->2. <6>4
    <9 _-> <8> <6 _+>2
    <6>4 <5> <7 _+> s
    <6 5 _-> <_+> s2
    <6> <_->
    <7- 5-> <5>4 <6>
    <5 4>4 <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 60
    s1*20
    \bar "||"

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ialto = {
    \new Voice = "totus"
    <<\Ialton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIalton = \relative do' {

    \autoBeamOff

    R4.*2
    r8 re16[(mi)] dod[(mi)]
    re[mi fa la sol sib]

    %5
    la8 re, r
    r8 re16[(mi)] dod[(mi)]
    re[mi fa la sol sib]

    %8
    la8 re, r\mbreak
    r la'16 la sib8~
    sib16 sib do sib la8~

    %11
    la16 la sib la sol8~
    sol16 sol la sol fa8~
    fa16 mi re[(mi)] fa[(sol)]

    %14
    la dod, re[(mi)] fa[(sol)]\mbreak
    la dod, re[(mi)] fa[(sol)]
    la[(sol)] la8 r

    %17
    R4.*2
    la16 sol fa[(mi)] fa8
    sib16 la sol[(fa)] sol8

    %21
    do16 sib la sol la8~
    la16 la sib8. la16\mbreak
    sol fa mib8 re

    %24
    sib' fa8. mi16(
    re4.)
    la'16 la sib8. la16

    %27
    sol fa mib8 re
    sib' fa8. mi16(
    re4.)

    %30
    R4.*4
    r8 fa sol\mbreak
    la16 fa sib8 do

    %36
    la16 [(sol)] fa8 r
    R4.
    r8 fa sol\mbreak

    %39
    la16 fa sib8 do
    la16 sol la8 si!
    do16 sol la [(sol)] fa8

    %42
    mi16 [(re)] do8 r\mbreak
    R4.
    sol'16 la sib [(sol)] la8

    %45
    sol16 la sib [(sol)] la8
    sol16 fa sol8 fa
    sol16 fa sol8 fa

    %48
    la16 sib do fa, mi8
    fa r r\mbreak
    la16 sib do fa, mi8

    %51
    fa r r
    r la sol
    fa16 mi fa8 sol

    %54
    mi16[(re)] do8 r
    R4.
    r8 mi la

    %57
    sold16 mi la8 si\mbreak
    sold mi la16 re,
    mi4.

    %60
    mi
    sold16 la si8 mi,
    R4.

    %63
    sold16 la si8 mi,
    R4.
    mi16 re mi la sold8

    %66
    la r r\mbreak
    mi16 re mi la sold8
    la r r

    %69
    R4.*2
    r8 re,16[(mi)] dod[(mi)]
    re[mi fa la sol sib]

    %73
    la8 re, r
    r8 re16[(mi)] dod[(mi)]
    re[mi fa la sol sib]

    %76
    la8 re, r\mbreak
    r la'16 la sib?8~
    sib16 sib do sib! la8~

    %79
    la16 la sib la sol8~
    sol16 sol la sol fa8~
    fa16 mi re[(mi)] fa[(sol)]

    %82
    la dod, re[(mi)] fa[(sol)]\mbreak
    la dod, re[(mi)] fa[(sol)]
    la [(sol)] la8 r

    %85
    R4.*2
    la16 sol fa[(mi)] fa8
    sib16 la sol[(fa)] sol8

    %89
    do16 sib la [(sol)] la8\mbreak
    la16 la sib8. la16
    sol fa mib8 re

    %92
    sib' fa8. mi16(
    re4.)
    la'16 la sib8. la16

    %95
    sol fa mib8 re\mbreak
    sib' fa8. mi16(
    re4.)

    %98
    R4.*5
    fa4 r la r8 do,
    fa sol la sol16 fa sib4 sib

    %105
    r8 sib sib la la8. la16 la4
    r sol r fa8 mi
    sol4. sol8 sol4 r

}

IItesto = \lyricmode {

    E -- pu -- la - re, de -- lec -- ta - re,
    fe -- licis - simum _ cor me -- um,
    fe -- licis - simum _ cor me -- um,
    e -- pu -- la -- re, de -- lec -- ta -- re, de -- lec -- ta -- re,
    e -- pu -- la -- re, e -- pu -- la -- re, de -- lec -- ta -- re,
    fe -- licis - si -- mum cor me -- um, cor me -- um,
    fe -- licis - si -- mum cor me -- um, cor me -- um.

    Da -- tur tibi _ man -- du -- ca -- re, da -- tur tibi _ man -- du -- ca -- re
    pa -- nem cœ -- li, ve -- rum De -- um,
    da -- tur ti -- bi man -- du -- ca -- re
    pa -- nem cœ -- li, ve -- rum De -- um, ve -- rum ve -- rum De -- um,
    ve -- rum ve -- rum De -- um,
    da -- tur tibi _ man -- du  -- ca --  re,
    man -- du -- ca -- re
    pa -- nem cœ -- li, ve -- rum De -- um,
    pa -- nem cœ -- li, ve -- rum De -- um,
    ve -- rum, ve -- rum De -- um,
    ve -- rum, ve -- rum De -- um.

     E -- pu -- la - re, de -- lec -- ta - re,
    fe -- licis - simum _ cor me -- um,
    fe -- li -- cis -- simum _ cor me -- um,
    e -- pu -- la -- re, de -- lec -- ta -- re, de -- lec -- ta -- re,
    e -- pu -- la -- re, de -- lec -- ta -- re, de -- lec -- ta -- re,
    fe -- li -- cis -- si -- mum cor me -- um, cor me -- um,
    fe -- li -- cis -- si -- mum cor me -- um, cor me -- um.

    Quid, quid, quid hoc cœ -- lesti _ ar -- dore _
    de -- lecta _ bi -- lius? _  Quid, quid su -- a -- vius? _

}


IIvlIn = \relative do'' {

    R4.*4
    r8 re16 mi dod mi
    re8 r r

    %7
    R4.
    r8 re16 mi dod mi
    re8 r r

    %10
    R4.*6
    r16 mi fa sol la sib
    dod, la la8 r\mbreak

    %18
    r16 mi' fa sol la sib
    dod,8 re fa16 mi
    re8 mi16 re mi mi,

    %21
    sol8 la do'16 sib
    la8 re, r
    r r la'

    %24
    re, la16 sib la sol
    fad8 sol16 la sib do\mbreak
    re8 r sol,16 fad

    %27
    sol la sib do re8
    re re8. dod16
    re la sib8 la

    %30
    r sol'16 mi fa8~
    fa16 mi re8 re
    sol16 fa mib8 re

    %33
    re' re8. dod16\mbreak
    re8 r r
    R4.

    %36
    r8 fa, sol
    la16 fa sib8 do
    la16 sol fa8 r

    %39
    R4.*2
    r8 do re
    mi16 re mi8 fa

    %43
    mi16 re mi8 fa
    mi r r\mbreak
    R4.*3

    %48
    r8 r r16 sol
    la8 fa16 do' sib8
    la8. re16 sol,8

    %51
    la16 sib do fa, mi8
    fa4 r8
    R4.

    %54
    r8 fa sol
    mi16 re do8 re
    sol16 fa mi8 r\mbreak

    %57
    R4.*2
    si'16 la si8 do
    si16 la si8 do

    %61
    si r r
    sold16 la si8 do,
    R4.

    %64
    sold'16 la si8 mi,
    R4.
    do16 re mi fa re8

    %67
    mi r r
    do'16 re mi la, sold8\mbreak
    la4.

    %70
    R4.*3
    r8 re,16 mi dod mi
    re8 r r

    %75
    R4.
    r8 re16 mi dod mi
    re8 r r

    %78
    R4.*6
    r16 mi fa sol la sib
    dod, la la8 r\mbreak

    %86
    r16 mi' fa sol la sib
    dod,8 re fa16 mi
    re8 mi16 re mi mi,

    %89
    sol8 la do'16 sib
    la8 re, r
    r r la'

    %92
    re, la16 sib la sol
    fad8 sol16 la sib do\mbreak
    re8 r sol,16 fad

    %95
    sol la sib do re8
    re re8. dod16
    re la sib8 la

    %98
    r sol'16 mi fa8~
    fa16 mi re8 re
    sol16 fa mib8 re

    %101
    re' re8. dod16
    re8 r r
    R1*5

}

IIvlIIn = \relative do'' {

    R4.*4
    r8 sib sol
    la r r

    %7
    R4.
    r8 sib sol
    la r r

    %10
    R4.*7
    r16 mi' fa sol la sib
    dod, la la8 r

    %19
    mi' fa r\mbreak
    sol do, r
    mi do r

    %22
    r r sol16 fad
    sol la sib do re8
    re re8. dod16

    %25
    re8. fa16 sol sol,
    la8 re, r
    r r la''\mbreak

    %28
    re, la16 sib la sol
    fad8 re re''16 la
    sib8. fa16 la8

    %31
    re,8. do16 sib8
    r sib la
    sib' fa mi

    %34
    re r r
    R4.*2
    r8 fa sol

    %38
    do, la r
    R4.*2\mbreak
    r8 la si

    %42
    do sol' la
    sol16 fa sol8 la
    sol r r

    %45
    R4.*4
    r16 do, re mi fa sol
    do,8. re16 sib8

    %51
    la4 r8
    R4.*2
    r8 fa' sol

    %55
    mi16 re do8 r
    R4.*2\mbreak
    sold'16 fad sold8 la

    %59
    sold16 fad sold8 la
    sold r r
    mi16 fad sold8 r

    %62
    R4.
    mi16 fad sold8 r
    R4.

    %65
    do,16 re mi fa? mi8
    do r r
    mi do' si

    %68
    la4.\mbreak
    R4.*3
    r8 sib, sol

    %73
    la r r
    R4.
    r8 sib sol

    %76
    la r r
    R4.*6
    r16 mi' fa sol la sib

    %84
    dod, la la8 r
    mi' fa r
    dod16 la la8 r\mbreak

    %87
    mi la r
    sol' do, r
    sol' do, r

    %90
    r r sol16 fad
    sol la sib do re8
    re re8. dod16

    %93
    re8. fa16 sol sol,
    la8 re, r
    r r la''\mbreak

    %96
    re, la16 sib la sol
    fad8 re re''16 la
    sib8. fa16 la8

    %99
    re,8. do16 sib8
    r sib la
    sib' fa mi

    %102
    re r r
    R1*5

}

IIbcn = \relative do {

    r8 re16 mi dod mi
    re mi fa la sol sib
    la8 re, la

    %4
    fa'4 mi8
    fa sol mi
    fa8. sol16 la sol

    %7
    fa4 mi8
    fa sol mi
    fa4 sol16 fa\mbreak

    %10
    mi8. mi16 fa mi
    re8. re16 mi re
    dod8. dod16 re do

    %13
    sib4.
    la8 sib r
    la sib r

    %16
    la re16 mi fa sol
    la dod, re mi fa sol\mbreak
    la dod, re mi fa sol

    %19
    la8 re, r
    sib do r
    mi fa r

    %22
    fad sol16 la sol la
    sib la sol8 fa
    sol la la,

    %25
    re'16 do sib la sol8\mbreak
    fad sol16 la sol la
    sib la sol8 fa

    %28
    sol la la,
    re sol fad
    sol16 la sib do fa,8

    %31
    sib8. la16 sol8
    r sol fa
    sol la la,

    %34
    re r mi
    fa re mi\mbreak
    fa re mi

    %37
    fa re mi
    fa4 mi8
    fa re mi

    %40
    fa16 mi fa8 re
    mi fa re
    do4 fa,8

    %43
    do'4 fa,8
    do' re16 mi fa8
    sib,16 do re mi fa8

    %46
    sib16 la sib8 la\mbreak
    sib16 la sib8 la16 sol
    fa sol la sib do do,

    %49
    fa la, sib do re mi
    fa8 la,16 sib do8
    fa16 sol la sib do do,

    %52
    fa4 do8
    fa la, si!
    do la si

    %55
    do la si\mbreak
    do4 fa8
    mi do re

    %58
    mi mi fa
    mi4 la,8
    mi'4 la,8

    %61
    mi' mi, r
    mi' mi, r
    mi' mi, r

    %64
    mi' mi, r
    la16 si do re mi8
    la8. fa16 sol8\mbreak

    %67
    do,16 si do re mi mi,
    la8 do16 re mi8
    la, re16 mi dod mi

    %70
    re mi fa la sol sib
    \stemUp la8 re, la\stemNeutral
    fa'4 mi8

    %73
    fa sol mi
    fa8. sol16 la sol
    fa4 mi8

    %76
    fa sol mi
    fa4 sol16 fa
    mi8. mi16 fa mi

    %79
    re8. re16 mi re
    dod8. dod16 re do
    sib4.

    %82
    la8 sib r
    la sib r
    la re16 mi fa sol\mbreak

    %85
    la dod, re mi fa sol
    la dod, re mi fa sol
    la8 re, r

    %88
    sib do r
    mi fa r
    fad sol16 la sol la

    %91
    sib la sol8 fa
    sol la la,\mbreak
    re'16 do sib la sol8

    %94
    fad sol16 la sol la
    sib la sol8 fa
    sol la la,

    %97
    re sol fad
    sol16 la sib do fa,8
    sib8. la16 sol8

    %100
    r sol fa
    sol la la,
    re4 r8

    %103
    fa1~
    fa2 sol~
    sol fa

    %106
    mi re
    do1

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6>8
    s <6> <_->
    <_+> <6> <_+>
    <6>4 <6+>8
    s8 <_-> <6+>
    <6>8. <6>16 <_+>8
    <6>4 <6+>8
    s <_-> <6+>
    <6>4 <_->8
    <5->4 <6>8
    <5> <6-> s
    <5->4.
    <5>4 <6>8
    <_+>4.
    <_+>
    <_+>4 <6>8
    <_+>4 <6>8\mbreak
    <_+>4 <6>8
    <_+>4.
    <6>
    <6>
    <6>8 <_->4
    <6>16 <6> <6- _->8 <6>
    <_-> <6 4> <5 _+>
    <_+>8 <6> <_->\mbreak
    <6>8 <_->4
    <6>8 <6- _-> <6>
    <_-> <6 4> <5 _+>
    <_+> <_-> <6>
    <_-> <6> s
    s4 <_->8
    s <6- _-> <6>
    <6 5 _-> <6 4> <5 _+>
    s s <6>
    s <6-> <6 5->\mbreak
    <6> s <6>
    s <6-> <6>
    s s <6>
    s <6-> <6>
    s s <6!>
    <6> s <6>
    s4.
    s
    s8 <6-> s
    <6> <6-> s
    <6>16 <6> <6>8 <6>\mbreak
    <6> <6> <6>
    s <6> s
    s s <6->
    s <6> <7- 5>
    s <6> s
    s4.
    s8 <6> <6 5->
    s <6> <6 5->
    s s <6 5->
    s4 <6>8
    <_+> <6> <6 5>
    <_+> s <6>
    <_+>4.
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    s8 <6> <_+>
    s4.\mbreak
    s8 s <_+>
    s <6> <_+>
    s s <6>
    s <6> <_->
    <_+> s <_+>
    <6> <4-> <6 5->
    <6> <_-> <6+>
    <6> s <_+>\mbreak
    <6> <4-> <5->
    <6> <_-> <6+>
    <6> s <_->
    <5->4.
    <5>8 <6-> <5->
    <5-> <6> s
    <7> s <6>
    <_+>4.
    <_+>
    <_+>4 <6>8\mbreak
    <_+> s <6>
    <_+> s <6>
    <_+>4.
    <6>
    <6>
    <6>8 <_-> s
    <6>16 <6> <6- _->8 <6>
    <_-> <6 4> <5 _+>\mbreak
    <_+> <6> <_->
    <6> <_-> s
    <6>16 <6> <6- _->8 <6>
    <_-> <6 4> <5 _+>
    <_+> <_-> <6>
    <_-> <6> s
    s s <_->
    s <6 _-> <6>
    <_-> <6 4> <5 _+>
    s4.

    % recitativo
    s1
    s2 <7 _->
    <6 _-> s
    <6> <7>4 <6>

}


forma = {

    \time 3/8
    \key do\major
    \tempo 4. = 65
    s4.*102
    \bar "||"\break
    \once \override Score.RehearsalMark.extra-offset = #'(-5 . 0.0)
    \mark\markup "[3.] Recitativo"
    \time 4/4
    \key do\major
    \tempo 4 = 65
    s1*5
    \bar "||"

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIalto = {
    \new Voice = "epulare"
    <<\IIalton \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIalton = \relative do' {

    \autoBeamOn

    sol'1.
    R1.
    sol1 sib2

    %4
    sib? la la
    re, sol4(fad)(sol2)
    R1.

    %7
    re1 r2
    R1.
    re1 fa2

    %10
    fa mi mi
    la, re4(dod)(re2)\mbreak
    R1.

    %13
    la'
    R
    la1 do,2

    %16
    do si si
    mi la4(sold)(la2)
    r mi1~

    %19
    mi2 fa1~
    fa2 mi4 fad sol2~
    sol fad4 sol la2~\mbreak

    %22
    la sol4 la sib2~
    sib la4 sib do2~
    do fa, sib

    %25
    sib la4(sol) la2
    sib1.~
    sib\parenthesize ~

    %28
    sib
    R
    r2 re,1

    %31
    mib1.~
    mib2 re4 mi fa2~\mbreak
    fa mi4 fad sol2~

    %34
    sol fad4 sol la2~
    la sol4 la sib2~
    sib la4 sib sol la

    %37
    fad2 re sol
    sol fad4(mi) fad2\mbreak
    sol1.~

    %40
    sol~
    sol
    R1.*2

}

IIItesto = \lyricmode {

    Non, non, non man -- næ dul -- ce -- do,
    non, non, non man -- næ dul -- ce -- do,
    non, non, non lac -- tis pin -- gue -- do,
    non fa - - - - - -  - - - - - - vus non fa -- vus, non mel,
    non fa - - - - - - - - - - - - - - - - - vus non fa -- vus, non mel.

}


IIIvlIn = \relative do'' {

    r2 r sib
    sol sol sol
    sib r sib

    %4
    do do do
    sib sol sol
    sol fad2. fad4

    %7
    sol2 r fad
    re re sib' \mbreak
    la r fa

    %10
    sol sol sol
    fa re1
    re2 dod2. dod4

    %13
    re2 r dod'
    la la fa
    mi r mi

    %16
    la sol sol
    sol4 mi re2 do
    si? si si\mbreak

    %19
    do do' la
    sol sol sol
    la la la

    %22
    sib2. do4 re2
    mib mib mib,
    fa fa re

    %25
    do do do
    re re fa'~
    fa mib mib\mbreak

    %28
    mib re re
    do do do
    sib fa sol

    %31
    mib sol fa
    fa fa fa
    sol sol sol

    %34
    la la la
    sib sib sib
    mib, mib mib\mbreak

    %37
    re re re
    mib re re
    re r r

    %40
    mib' mib mib
    re re sol
    sol fad fad

    %43
    sol1.

}

IIIvlIIn = \relative do'' {

    r2 r re,
    mib mib mib
    re r re

    %4
    sol fa fa
    fa4 re do2 sib
    do do do

    %7
    sib r la'
    sib sib re,
    fa r la\mbreak

    %10
    re, do do
    do4 la sol'2 fa
    mi? mi mi

    %13
    fa2 r mi
    fa fa la
    do r do,

    %16
    re re re
    do la la'\mbreak
    la sold2. sold4

    %19
    la2 la do
    si? mi, re
    do re mib

    %22
    re re sol
    sol la sol
    fa sib fa

    %25
    sol fa fa \mbreak
    fa fa r
    sol' sol sol

    %28
    fa fa sib,
    sib? la la
    sib sib sib

    %31
    sol sib do
    sib sib, do
    si! do re

    %34
    do re mib\mbreak
    re re re
    do do do'

    %37
    la fad re'
    do la la
    sib sib re~

    %40
    re do do
    do sib re
    la la la

    %43
    sol1.

}

IIIbcn = \relative do {

    sol'1 sol2
    do, do do
    sol' r sol

    %4
    mib fa fa,
    sib mib re
    do re re,

    %7
    sol r re'
    sol, sol sol
    re' r re\mbreak

    %10
    sib do do,
    fa' si? la
    sol la la,

    %13
    re r la
    re re re
    la r la'

    %16
    fa sol sol,
    do fa mi
    re mi mi,\mbreak

    %19
    la la' fa
    sol do, si
    la re do

    %22
    sib1 sol2
    do do do
    re re re

    %25
    mib fa fa,
    sib sib re
    mib sol mib\mbreak

    %28
    sib' sib, re
    mib fa fa,
    sib sib sol

    %31
    do sol la
    sib? sib la
    sol do sib

    %34
    la re do
    sib1 sol2
    do do do\mbreak

    %37
    do1 sib2
    do re re,
    sol sol sib

    %40
    do mib do
    sol' sol, sib
    do re re,

    %43
    sol1.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <_->1.
    <_->
    <_->2 s <_->
    <6 5> <4> <3>
    s <6> <6- 4>
    <6 5> <5 4> <_+>
    <_-> s <_+>
    <_->1.
    s
    <6 5>2 <4> <3>
    s <6 _-> <6 4>
    <6 5 _-> <5 4> <_+>
    s s <_+>
    s1.
    <_->
    <6 5>2 <5 4> <3>
    s <6> <6 4>
    <6 5> <5 4> <_+>
    s <6> s
    <7> <5> <6>
    <7> <_+> <6 _->
    <7> <6> <_->
    <7- _-> <6> <5>
    <7> <6-> s
    <6 5> <5 4> <3>
    s s <6->
    <9> <6-> s
    <5 4> <3> <6->
    <6 5> <5 4> <3>
    s s <_->
    <_-> <6- _-> <6 5->
    <5 4> <3> <6>
    <7 _!> s <6>
    <7> <_+> <6 _->
    <7 > <6> <_->
    <7 _-> <6> <5>
    <6 4+ 2> s <6>
   <_-> <_+> s
   <_-> s <6>
   <9 _-> <6> <_->
   <5 4> <_-> <6>
   <6 5> <5 4> <_+>
   <_->

}


forma = {

    \time 3/2
    \key do\major
    \tempo 2 = 60
    s1.*43
    \bar "||"

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIalto = {
    \new Voice = "dulcedo"
    <<\IIIalton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}




IValton = \relative do' {

    \autoBeamOff

    R1
    la'4 do fa,16[sol la sib] do8[do,]
    fa sol16 la sib8 do16  sib la8 sol16[(fa] mi4)

    %4
    r2 la4 do
    fa,16[sol la sib] do8[do,]\mbreak fa sol16 la sib8 do16  sib
    la8 sol16[(fa] mi4) r8 fa16 mi re mi fa sol

    %7
    la8 sib do fa, mi fa do' fa,
    mi fa r fa\mbreak fa fa sol sol
    sol la sib la sol4 r8 mi16 fa

    %10
    sol8 do, r mi16 fa sol8 do, r re'16 sib
    la sol fa mi re8 mi\mbreak fa sol la sib
    do sib16 [(la)] sol8 la16 sib la8 do, fa sol16 mi

    %13
    fa4 r r8 do fa sol16 mi
    fa4 r r16 do[re mi] fa[mi fa mi]\mbreak
    re[re mi fa] sol[fa sol fa] mi[fa re mi] fa [sol la sib]

    %16
    do8 sib16[(la)] sol8 la16 sib la8 do fa,4
    r8 do fa4 r2
    r4 la8 si?\mbreak do si16 la sol8 fa16 sol

    %19
    mi8 fa sol fa16 sol mi8 fa sol la
    re,4 do r sol'8 la
    si16[(la)] sol8 do sol la fa sol re\mbreak

    %22
    mi fa16 sol re8 mi16 re do8 sol' la si
    do sol re mi16 re do4 sol'8 la
    si16[(la)] sol8 do sol la fa sol re\mbreak %% fine pagina

    %25 OOKK
    mi fa16 sol re8 mi16 re do8 sol' la si
    do sol re sol mi2
    R1

    %28
    la4 do fa,16[ sol la sib] do8 [do,]
    fa sol16 la sib8 do16 sib\mbreak la8 sol16[(fa]] mi4)
    r2 la4 do

    %31
    fa,16[sol la sib] do8[do,] fa sol16 la sib8 do16 sib
    la8 sol16[(fa] mi4)] r8 fa16 mi re mi fa sol\mbreak
    la8 sib do fa, mi fa do'8 fa,

    %34
    mi fa r fa fa fa sol sol
    sol la sib la sol4 r8 mi16 fa
    sol8 do, r mi16 fa\mbreak sol8 do, r do'16 sib

    %37
    la sol fa mi re8 mi fa sol la sib
    do sib16 [(la)] sol8 la16 sib la8 do, fa  sol16 mi
    fa4 r\mbreak r8 do fa sol16 mi

    %40
    fa4 r r16 do [re mi] fa [mi fa mi]
    re [re mi fa] sol[fa sol fa] mi[fa re mi] fa[sol la sib]
    do8 sib16[(la)] sol8 la16 sib\mbreak  la8 do fa,4

    %43
    r8 do fa4 r2
    R1

}

IVtesto = \lyricmode {

    It -- e pro - - cul o da -- pes mun -- da -- næ,
    i -- te pro - - cul o da -- pes mun -- da -- næ,
    i -- e va -- næ, i -- te va -- næ, vos non que -- ro,
    vos non que -- ro, non, non
    non que -- ro, non, non, non, non, non,
    i -- te va -- næ, vos non que -- ro,
    i -- te va -- næ, va -- næ, va -- næ, vos non que -- ro,
    non, non, cu -- pio, _ non, non cu -- pio, _ non, non cu -- pio, _
    non, non - - - - - - non cu -- pio, _ non, non, non, non, non,
    ve -- stra gau -- dia, _ fo -- ris a -- mena, _ fo -- ris a -- mena, _
    in -- tus pœ -- na, in -- tus pœ -- na, ci -- bus ve -- ster,
    ci -- bus ve -- ster non sa -- tiat, _ non, non, non, non, non, non
    sa -- tiat _ non, in -- tus pœ -- na, ci -- bus ve -- ster,
    ci -- bus ve -- ster non sa -- tiat, _ non, non, non, non, non, non, non, non, non.

    It -- e pro - - cul o da -- pes mun -- da -- næ,
    i -- te pro - - cul o da -- pes mun -- da -- næ,
    i -- e va -- næ, i -- te va -- næ, vos non que -- ro,
    vos non que -- ro, non, non
    non que -- ro, non, non, non, non, non,
    i -- te va -- næ, vos non que -- ro,
    i -- te va -- næ, i -- te va -- næ, vos non que -- ro,
    non, non, cu -- pio, _ non, non cu -- pio, _
    non, non cu -- pio, _ non, non - - - - - - non cu -- pio, _
    non, non, non, non, non.

}

IVbcn = \relative do {

    la4 do fa,16 sol la sib do re mi do
    fa mi fa re mi re mi do re8 do16 sib la sib do la
    re do sib la sol4 la do

    %4
    fa,16 sol la sib do re mi do\mbreak fa mi fa re mi re mi do
    re8 do16 sib la sib do la re4 sol8 mi
    fa4 do16 re mi do fa mi re do sib8 la16 sol

    %7
    fa8 sol la sib do re la sib\mbreak
    do re r16 re do sib la sol la fa sib la sib sol
    do8 fa sol fa r do'16 do do8 do,

    %10
    r do'16 do do8 do, r do'16 do do8 do,
    fa sol sib la16 sol\mbreak fa re' do sib la sib sol la
    fa8 sib do do, fa4 r

    %13
    r16 fa fa mi re re do sib la4 r
    r16 re re do sib sib la sol fa4 r
    sib r\mbreak do re8 do16 sib

    %16
    la8 sib do do, fa4 r8 fa'
    fa,4 r16 fa' mi re do sib la sib do8 do,
    fa4 fa'8 sol la4 si?

    %19
    do si do mi,8 fa
    sol sol, la' sol16 fa\mbreak mi re do re mi8 fa
    sol sol16 fa mi do re mi fa8 re'16 do si sol la si

    %22
    do8 mi, fa sol la mi fa sol
    la mi fa sol do,16 re do re mi8 fa\mbreak
    sol sol16 fa mi do re mi fa8 re'16 do si sol la si

    %25
    do8 mi, fa sol la mi fa sol
    la mi fa sol do,4 r
    la do fa,16 sol la sib do re mi do\mbreak

    %28
    fa mi fa re mi re mi do re do sib sol la sib do la
    re do sib la sol4 la do
    fa,16 sol la sib do re mi do fa mi fa re mi re mi do\mbreak

    %31
    re8 do16 sib la sib do la re4 sol8 mi
    fa4 do16 re mi do fa mi re do sib8 la16 sol
    fa8 sol la sib do re la sib

    %e34
    do re r16 re do sib\mbreak la sol la fa sib la sib sol
    do8 fa sol fa r do'16 do do8 do,
    r do'16 do do8 do,  r do'16 do do8 do,

    %37
    fa la sib la16 sol fa re' do sib la sib sol la
    fa8 sib do do,\mbreak fa4 r
    r16 fa fa mi re re do sib la4 r

    %40
    r16 re re do sib sib la sol fa4 r
    sib r do re8 do16 sib
    la8 sib do do, fa4 r8 fa'\mbreak

    %43
    fa,4 r16 fa' mi re do sib la sib do8 do,
    fa4 r r2

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <_->2 s8 <6> s <6>
    s4 <6> s8 <6> <6>4
    s <_-> s2
    s8 <6> s <6> s4 <6>
    s8 <6> <6>4 s <_->
    s4 s8 <6> s4 s8 <6>
    s4 <6> s <6>
    s4 s <6> <6>
    s <_-> s2
    s1
    s2 <6>4 <6>
    s8 <6 5> <5 4> <3> s2
    s4 s8 <6> <6>2
    s <6>
    s1
    <6>8 <6 5> <5 4> <3> s2
    s <6>8 <6> <5 4> <3>
    s4 s s <6>
    s <6> s <6>
    s s <6> <6>
    s <6> s <6>
    s <6> s <6>
    s <6> s <6>
    s <6> s <6>
    s <6> s <6>
    s <6> s2
    s s8 <6> s <6>
    s4 <6> s2
    s4 <_-> <6>2
    s8 <6> s <6> s4 <6>
    s8 <6> s4 s <_->
    s4 s8 <6> s4 s8 <6>
    s4 <6> s <6>
    <6>2 <6>4 <6>
    s <_-> s2
    s1
    s2 s4 <6>
    s8 <6 5> <5 4> <3> s2
    s <6>
    s <6>
    s1
    <6>8 <6 5> <5 4> <3> s2
    s s8 <6> <4> <3>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 47
    s1*44
    \bar "||"

}

IValto = {
    \new Voice = "ite"
    <<\IValton \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}





VvlIn = \relative do'' {

    la4 do fa,16 sol la sib do re mi do
    fa8 re do16 re sib do la sib do re mi fa sol mi
    la4 r8 do, do mi re4

    %4
    mi sol do,16 si do la si la si sol\mbreak
    mi fa sol la si do re si sol8 do4 si8
    do4 r r8 mi16 fa sol do sib sol

    %7
    la4 r r8 la,16 sib do re mi do
    re8 fa4 mi8 fa fa do4\mbreak
    r8 do fa la, la'4 r

}

VvlIIn = \relative do'' {

    fa,16 mi fa re mi re mi do re mi fa sol la sib do la
    re, mi fa sol mi fa re mi fa sol la sib sol8 mi16 sol
    fa8 do'16 re mi fa sol mi la,8 do4 si?8\mbreak

    %4
    do16 si do la si la si sol la8 mi16 fa sol8 sol,
    do16 re mi fa sol la si sol do8 mi re4
    mi8 do16 re mi fa sol mi do4 r

    %7
    r8 do16 re mi fa sol mi\mbreak fa4 r
    r8 do' sol8. sol16 la8 la la,4
    r8 la fa do' fa4 r

}

Vbcn = \relative do {

    R1
    r2 la4 do
    fa,16 sol la sib do re mi do fa sol mi fa sol8 sol,

    %4
    do4 r r2
    r mi4 sol
    do,16 re mi fa sol la sib sol la la, do re mi fa sol mi\mbreak

    %7
    fa fa, la sib do re mi do re mi fa sol la sib do la
    sib do la sib do8 do, fa4 r8 fa
    fa,4 r8 fa' fa,4 r

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <6>
    s8 <6> s <6> s <6> <5 4> <3>
    s1
    s2 <6>4 <5 4>8 <3>
    s <6> <_->4 s8 <6> <6>4
    s8 <6> s <6> s <6> <6>4
    s8 <6> <5 4> <3>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 55
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




VIalton = \relative do' {

    \autoBeamOff

    la'4 sib la8 sol16 fa mi8 fa16 sol
    fa8 mi16[(fa] re4) r2
    la'4 sib la8 sol16 fa mi8 fa16 sol

    %4
    fa8 mi16[(fa] re4)  r8 fa fa fa\mbreak
    fa4 r16 fa[sol la] sib8. sib16 sib8 sib
    sib? fa r fa fa fa la4

    %7
    r16 la[fa sol] la8[fa] do8. do16 fa[(sol)] la[(sib)]
    do8 fa, r4 r2\mbreak
    r2 sol16 [la sol la] sol8 sol

    %10
    do,16[re do re] do[fa mi fa] re[mi re mi] re[sol fa sol]
    mi[fa re mi] fa[sol la sib] do8 sol r4\mbreak
    r2 r4 sol8 mi

    %13
    r4 la8 do sib2~
    sib4 la r fa16[(sol)] la[(sol)]
    re8 re re16[(mi)] fa[(re)] sol8 sol la16[(sol)] la[(sol)]\mbreak

    %16
    fad16[sol mi fad] sol[fad sol fad] sol[re mi fad] sol[fad sol la]
    sib8. la16 sol4. la8 fad4
    sol8 sib la sib16[(la] sol8) sib la sib16[(la]

    %19
    sol4) r r2
    R1
    r2 sol16[la sol la] sol8 sol

    %22
    do,16[re do re] do[fa mi fa] re[mi re mi] re[sol fa sol]
    mi[fa sol mi] fa[sol la sib]\mbreak do8 sol r4
    r2 r4 sol8 mi

    %25
    r4 mi8 sol fa2~
    fa4 mi r mi16[(fa)] sol[(fa)]
    la8 la fa16[(sol)] la[(fa)] re8 re sol16[(fad)] sol[(la)]\mbreak

    %28
    sib[la sib sol] la[sib sol la] sib[la sib sol] la[sib sol la]
    sib[la sol fa] mi[fa sol mi] la8. re,16 re8 sib'
    fa[sol16 fa] mi4 re8 fa mi fa16[(mi]\mbreak

    %31
    re8) fa  mi fa16[(mi] re4) r
    r2 r8 do' si do16[(si]
    la8) la sold la16[(sold] la4) r

    %34
    r2 r4 do16[(sib)] la[(sol)]
    fa8 fa sib16[(la)] sol[(fa)]\mbreak mi8 mi la16[(sol)] fa[(mi)]
    re[mi fa re] sol[fa mi re] dod[re si dod] re[mi fa sol]

    %37
    la[sib sol la] fa[sol la fa] sib8. la16 sol8 sib\mbreak
    fa8[sol16 fa] mi4 re8 fa mi fa16[(mi]
    re4) r r8 fa mi fa16[(mi]

    %40
    re4) r r8 fa mi fa16[(mi]
    re)[la si dod] re[mi fa sol] la4 r
    R1

}

VItesto = \lyricmode {

    E -- ia er -- go o a -- nima _ me -- a,
    e -- ia er -- go o a -- nima _ me -- a,
    ad hæc in -- cen - - di -- a di -- vina, _
    ad hæc iin -- cen - - - di -- a di -- vina, _
    sem - per ar - - - - - - dens, sem -- per sem -- per spi -- rans,
    sem -- per ar -- dens, sem -- per spi -- rans,
    cur -- re pro - - - - pe -- ra, festi - na, festi - na, festi - na,
    sem - per ar - - - - - - dens, sem -- per sem -- per spi -- rans,
    sem -- per ar -- dens, sem -- per spi -- rans,
    cur -- re pro - - - - - - pe -- ra, fe -- sti - na, fe -- sti -- na, fe -- sti -- na,
    fe -- sti -- na, fe -- sti -- na,  sem -- per ar -- dens, sem -- per spi -- rans,
    cur -- re pro - - - - - - pe -- ra, fe -- sti - na, fe -- sti -- na,
    fe -- sti -- na,  fe -- sti -- na. - -

}


VIvlIn = \relative do'' {

    R1
    la'4 sib la8 sol16 fa mi8 fa16 sol
    fa8 mi16 fa re4 r2

    %4
    r8 la la la re re re re
    re re re re re re re re
    re fa re re\mbreak do16 do la sib do la fa sol

    %7
    la do la sib do8 la fa' la la la
    la16 la, fa sol la sib do re do do re mi fa8 la,
    do do re do16 re\mbreak mi4 r

    %10
    R1
    r2 mi16 fa mi fa mi fa mi fa
    mi re do re mi re mi fa sol4 r

    %13
    re r r16 re mi fa sol8 re
    r16 mi fa sol la8 la,\mbreak r16 la si dod re8 la
    R1*4

    %19
    r4 sib'16 do re sib sol8 sol do16 sib la sol
    fad8 sol sol8. fad16 sol8 sib la sib16 la
    sol8 sib, la sib16 la\mbreak sol4 r

    %22
    R1
    r2 mi'16 fa mi fa mi fa mi fa
    mi re do re mi re mi fa sol4 r

    %25
    la r r16 la, si dod re8 la
    r16 si do re mi8 mi,\mbreak r16 mi' fad sold la8 mi
    R1*4

    %31
    r2 r8 fa mi fa16 mi
    re mi re do si do re mi do4 r
    r8 do' si do16 si la4 r8 sold

    %34
    la do, si do16 si\mbreak la4 r
    R1*4
    r8 fa' mi fa16 mi re4 r

    %40
    r8 fa mi fa16 mi re4 r
    R1
    r16 re' do sib la sol fa mi re4 r

}

VIvlIIn = \relative do'' {

    R1
    r4 re mi8 la, sol' la
    la re, r4 r2

    %4
    r8 fa, fa fa fa4 r16 fa sol la
    sib8 sib sib sib fa fa fa fa
    fa re' sib sib\mbreak la do, fa la

    %7
    fa do fa do' la do do do
    fa16 fa, la sol fa sol la sib la8 fa'16 sol la8 do
    la la si! la16 si do4 r

    %10
    R1\mbreak
    r2 sol16 la sol la sol la sol la
    sol fa mi fa sol si, do re mi4 r

    %13
    la r r r16 re, mi fa
    mi8 mi, r16 mi' fa sol\mbreak fa8 la, r4
    R1*4

    %19
    sib'16 do re sib sol8 re mib do'16 sib la sol do sib
    la8 sib la sib16 la sol4 r8 fad
    sol4 r8 fad, sol4 r\mbreak

    %22
    R1
    r2 sol'16 la sol la sol la sol la
    sol fa mi fa sol8 do,16 re mi4 r

    %25
    mi r r r16 la si do
    si8 si, r16 si do re do8 mi, r4
    R1*4\mbreak

    %31
    r2 r4 r8 dod'
    re16 do? si la sold la si sold la4 r
    r2 r8 do' si do16 si

    %34
    la4 r8 sold, la4 r
    R1*4
    r4 r8 dod' re4 r\mbreak

    %40
    r4 r8 dod, re4 r
    r2 r16 la si dod re mi fa sol
    la4 r r2

}

VIbcn = \relative do {

    re4 sol dod,8 re re dod
    re4 sol dod,8 re re dod
    re4 sol dod,8 re re dod

    %4
    re re re re sib sib sib sib
    sib? sib sib sib sib sib sib sib\mbreak
    sib16 do sib do re mi re mi fa8 fa, fa fa

    %7
    fa fa' fa fa fa fa, fa fa
    fa fa' fa fa fa fa, fa fa
    fa'4 re do r

    %10
    la r si r
    do re do r\mbreak
    do' r do r

    %13
    fad, r sol r
    dod, r re4. do?8
    sib la sol' fa mib re do mib

    %16
    re do sib la sib do sib la
    sib4 mib8 do sib do re re,\mbreak
    sol4 r8 re' sol,4 r8 re'

    %19
    sol,4 sib do r8 do
    re sol do, re sol4 r8 re
    sol,4 r8 re' sol4 r

    %22
    la r si! r
    do re do r
    do, r do r\mbreak

    %25
    dod r re r
    sold, r la la'8 sol?
    fa dod re re' sib sol r fad

    %28
    sol sol, fad' re sol sol, fad' re
    sol sib do do, fa la sib sol\mbreak
    la sol la la, re4 r8 la

    %31
    re4 r8 la re4 r8 la
    re4 mi la, r8 mi'
    la,4 r8 mi' la,4 r8 mi'

    %34
    la,4 r8 mi' la sol la fa
    re4 sol8 sib, do4 fa8 la\mbreak
    sib la sol sib la sol fa mi

    %37
    fa mi re fa sol la sib sol
    la sol la la, re4 r8 la
    re4 r8 la re4 r8 la

    %40
    re4 r8 la re4 r8 la
    re4 r r2
    R1

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <_-> <6> <4 2>8 <6>
    s4 <_-> <6> <4 2>8 <6>
    s4 <_-> <6> <4 2>8 <6>
    s1*2
    s4 <6-> s2
    s1*2
    s4 <6!> s2
    <6>1
    s4 <6> s2
    s1
    <6>2 <_->
    <7- 5-> s4 s8 <6>
    s4 <_-> <6> <_->
    <_+> <6> <6> <6>
    s <6> <6> <5 4>8 <_+>
    <_->4 s8 <_+> <_->4 s8 <_+>
    <_->4 <6> <_-> s8 <_->
    <_+> <_-> <6 5> <_+> <_->4 s8 <_+>
    <_->4 s8 <_+> <_->2
    <6>1
    s4 <6> s2
    s1
    <6>
    <7- 5->
    s8 <6> s4 s s8 <6>
    <_->4 <6> <_-> <6>
    <_->8 <6 5> <5 4> <3> s2
    <6 4>4 <5 _+> s s8 <_+>
    s4 s8 <_+> s4 s8 <_+>
    s4 <_+> s s8 <_+>
    s4 s8 <_+> s4 s8 <_+>
    s4 s8 <_+> s4 <6>
    s <_-> s2
    s4 <_-> <_+> <6>
    <6>2 <_->
    <6 4>4 <5 _+> s s8 <_+>
    s4 s8 <_+> s4 s8 <_+>
    s4 s8 <_+> s4 s8 <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*42
    \bar "|."

}

VIvlI = {
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIalto = {
    \new Voice = "ergo"
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
        title = \markup\smaller\center-column {"Concerto Sacro IV Op. II"}
        composer = \markup \center-column{"A. Scarlatti (1660 - 1725)"}
    }

    \markup \huge {[1.] Totus amore languens - Largo}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r4 mi'8^\markup\center-align "Alto" mi'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto \global
                \new Lyrics \lyricsto "totus" \Itesto
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

    \pageBreak

    \markup \huge {[2.] Epulare}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r4 mi'8^\markup\center-align "Alto" mi'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIalto \global
                \new Lyrics \lyricsto "epulare" \IItesto
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

    \markup \huge {[4.] Non mannæ dulcedo - Adagio}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 3/2\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi la'1.^\markup\center-align "Alto"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto \global
                \new Lyrics \lyricsto "dulcedo" \IIItesto
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup \huge \column{"[5.] Ite procul - Allegro"}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r1  la'4^\markup\center-align "Alto" do''}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IValto \global
                \new Lyrics \lyricsto "ite" \IVtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column  {"Violoncello"\vspace #-0.3"Basso continuo"}
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

        systems-per-page = #5

    }

    \markup \huge \column{"[6.] Ritornello"}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \VvlI
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
            >>

            \new Staff <<
                \VvlII
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column  {"Violoncello"\vspace #-0.3"Basso continuo"}
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

        systems-per-page = #4

    }

    \markup \huge {[7.] Eia ergo - Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 la'4^\markup\center-align "Alto" sib'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \VIalto \global
                \new Lyrics \lyricsto "ergo" \VItesto
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

    \pageBreak

}

