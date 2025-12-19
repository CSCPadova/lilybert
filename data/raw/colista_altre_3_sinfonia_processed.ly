\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

"|" = \bar "||"

piuf = _\markup \italic "più f"

demi = _\markup \italic "à demi jeu"

sciolto = _\markup \italic "sciolto"

presto = ^\markup \italic \large "Presto."

tr = ^\markup \italic "tr"

p = _\markup \italic "p"

aduec = _\markup \italic "à 2 Cordes"

aa = _\markup \italic \bold "a"

fo = _\markup \italic "f"

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

rf = _\markup \italic "rf"

prinf = _\markup \italic "p rinf"

vite = ^\markup \large \center-align"Vite"

lent = ^\markup \large \center-align"Lent"

fortl = _\markup \italic "fort"

piano = _\markup \italic "piano"

dolce = _\markup \italic \center-align"doux"

dolcel = _\markup \italic "doux"

fort = _\markup \italic\center-align "fort"

fss = _\markup \italic {fortiss\super mo}

sf = _\markup \italic \bold "sf"

rr = _\markup \italic \bold "r"

pp = _\markup \italic "pp"

ff = _\markup \italic "ff"

ilf = _\markup \italic \bold "il f"

il = _\markup \italic \bold "il"

mf = _\markup \italic "mf"

unis = ^\markup \italic\center-align "Unis"

pizz = _\markup \italic "pizzic"

for = _\markup \italic "For."

pofo = _\markup \italic "pf"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

flsolo = ^\markup \italic \column{"Flute""Solo"}

flu = ^\markup \italic \column{"Flu."}

tu = ^\markup \italic "Tutti"

ts = ^\markup \italic \bold "T. S."

adue = ^\markup \italic "à 2"

pip = _\markup \italic "più p."

fi = _\markup \italic "Fine."

fin = ^\markup "Fin"

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.6 

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

ds = _\markup \italic \right-align {"Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber.transparent = ##t

terzinecon = \override TupletNumber.transparent = ##f

volti = _\markup \italic \bold \column {"Volti"}

trillo = ^\markup \italic \bold "t."

seguesu = _\markup \italic \bold \column {"Segue""subito"}
mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    sol'4 sol8. fa16 mi4 sol
    fa8. [sol16 mi8. fa16] re2
    fa4 fa8. mi16 re8 si do4~

    %4
    do si8. do16 do2
    mi4 mi8. red16 fad8 mi mi4\mbreak
    mi red8. mi16 mi2

    %7
    sol4 sol8. la16 fa8.[sol16 mi8. fa16]
    re4 re8. mi16 do8 mi r re
    r fa r mi r la r sol

    %10
    r si4 do16 si la4 la8. si16
    sol8 si r fa r la r mi\mbreak
    r sol4 fa16 mi re4 re8. mi16
    do1

    %14 secondo mov.
    sol'4. fa8 mi4. fa8 re4. mi8
    do4 do,8 re mi4 fa sol la
    si4. la8 sol4. la8 fad4. sol8

    %17
    sol2 re'4 mi fa? sol\mbreak
    la2 la,4 si do re
    mi4. re8 do4. re8 si4. do8
    do1.

    %21 terzo mov.
    sol'4 sol,8 la16 si do8[do re do16 re]
    mi8[sol16 fa mi re do si] la8 re4 mi8
    mi mi,4 fa16 sol\mbreak la8 si4 do8

    %24
    do la fa'2 mi4
    re2 do4 la
    R1

    %27
    do4 do,8 re16 mi fa8[fa sol fa16 sol]
    la8[do16 si la sol fa mi] re8 mi16 fa sol4~
    sol fad\mbreak sol' sol,8 la16 si

    %30
    do8[do re do16 re] mi4 do16 si la sol
    fa8[do' si la16 si] do2
    si r

    %33
    r4 sol' do,8[re16 mi fa8 fa]
    sol4. fa16 sol la8[do16 si la sol fa mi]
    re8 sol4 fa8\mbreak mi4 re

    %36
    re do2 r8 do
    sol8[la16 si do8 do] re4. do16 re
    mi4 sol16 fa mi re do8 si la4

    %39
    r2 r8 sol'[do, re16 mi]
    fad8[fad sol fad16 sol] la2\mbreak
    r8 sol16[fa mi re do si] do8 la la'4

    %42
    r sol sol,8 la16 si do4~
    do8 do si2 la4~
    la sol2 fa4~

    %45
    fa mi4. re16[do re8 re']
    sol,[la16 si do8 do] re4. do16 re\mbreak
    mi8[sol16 fa mi re do si] la4 la16 si do8
    do4 si do2

    %49 ultimo mov.
    r4 r sol'
    sol2 sol4
    la sol4. fa8

    %52
    mi4 sol2
    do,4 fa2
    fa4 mi re

    %55
    mi re4. mi8
    do4 mi2\mbreak
    re4 fa2

    %58
    mi4 la2
    sol4 fa mi
    fa mi4. fa8

    %61
    re2.
    R
    r4 do4. si8

    %64
    la4 re4. do8
    si4 mi4. re8
    do4 si4. do8

    %67
    do4 r r\mbreak
    r fa4. mi8
    re4 sol4. fa8

    %70
    mi4 re4. mi8
    do4 mi4. re8
    do4 si4. do8

    %73
    do4 r r

}

IvlIIn = \relative do'' {

    r2 do4 do8. si16
    la4 do si2
    r4 fa'4. fa8 mi4

    %4
    re re8. mi16 do2
    sol'4. fad16 sol la8.[si16 sol si la sol]\mbreak
    fad4 fad8. sol16 mi2

    %7
    mi4 mi8. fa?16 re8. mi16 do4
    do si8. do16 do8 r si r
    la r dod r re r mi r

    %10
    re4 sol4. la16[sol fad8. sol16]
    sol8 r re r fa? r do r\mbreak
    sol4 do4. si16[la si8. do16]
    do1

    %14 secondo mov.
    mi4. re8 do4. re8 si4. do8
    do2 sol4 la si do
    re4. do8 si4. do8 la4. si8

    %17
    sol4 la si do re mi\mbreak
    fa2 la1
    sol4. fa8 mi4. fa8 re4. mi8
    do1.

    %21 secondo mov.
    R1*2
    do4 do,8 re16 mi\mbreak fa8[fa sol fa16 sol]
    la8[do16 si la sol fa mi] re8 re'4 do8~

    %25
    do si16 la si4 mi fa
    sol8 sol, la si do[do re do16 re]
    mi8[sol16 fa mi re do si] la8 fa' mi re

    %28
    do[la'16 sol fa mi re do] si4. la16 sol
    la2\mbreak r4 sol
    do,8[re16 mi fa8 fa] sol[fa16 sol la8 do16 si]

    %31
    la sol fa mi re8 sol4 sol8 fad mi16 fad
    sol4 sol' sol,8[la16 si do8 do]
    re do16 re mi4. fa16[sol la8 fa]~

    %34
    fa mi16 re mi4 fa8[la16 sol fa mi re do]
    si4 re\mbreak do4. si8
    sol4 sol'2 fad4

    %37
    r sol8 sol, la16[si do8 do8. si16]
    do8[sol'16 fa? mi re do si] la8[sol fad mi16 fad]
    sol8[sol' sol, la16 si] do4. do8

    %40
    re do16 re mi4 r8 fa16[mi re do si la]\mbreak
    sol8 mi sol'2 fad4
    sol sol,8 la16 si do4. do8

    %43
    re[do16 re mi8 re] do2
    si4. sol'8 do,[re16 mi fa8 fa]
    sol4. fa16 sol la[sol fa mi re do si la]

    %46
    si8 re sol,4 la si\mbreak
    do r8 fa do[re16 mi fa8 fa]
    re4. do16 re do2

    %49 ultimo mov.
    r4 r mi
    re2 mi4
    fa mi4. re8

    %52
    do4 mi2
    la, re4
    sol, do2

    %55
    do4 si4. do8
    do4 do2\mbreak
    si4 re2

    %58
    dod4 la2
    si4 dod2
    re4 dod4. re8

    %61
    re4 fa4. mi8
    re4 sol4. fa8
    mi4 r r

    %64
    r fa4. mi8
    re4 sol4. fa8
    mi4 re4. mi8

    %67
    do4 do4. si8\mbreak
    la4 re4. do8
    si4 mi4. re8

    %70
    do4 si4. do8
    do4 sol'4. fa8
    mi4 re4. mi8

    %73
    do4 r r

}

Iltn = \relative do {

    do'4 sol la mi
    fa do sol'2
    re'4 re8. do16 si8 re do mi,

    %4
    fa4 sol do,2
    do'4 do8. si16 la4 mi\mbreak
    si' si, mi2

    %74

    do4. do8 re4 mi
    fa sol do, sol'
    re la' fa do'

    %10
    sol2 re
    sol4 sib fa la\mbreak
    mi fa sol sol,
    do1

    %14 secondo mov.
    do4. re8 mi4 do sol' sol,
    do2 do' si4 la
    sol4. la8 si4 sol re' re,

    %17
    sol,2 sol' fa4 mi\mbreak
    re mi fa sol la si
    do,4. re8 mi4 do sol' sol,
    do1.

    %21 terzo mov.
    R1
    do'4 do,8 re16 mi fa8[fa sol fa16 sol]
    la8[do16 si la sol fa mi]\mbreak re4 mi

    %24
    fa2 r
    sol4 sol,8 la16 si do8[do re do16 re]
    mi8[sol16 fa mi re do si] la4 sol

    %27
    do2 re4 mi
    fa2 sol4 sol,8 la16 si
    do8[do re do16 re]\mbreak mi8[sol16 fa mi re do si]

    %30
    la4 r8 re do re16 mi fa4~
    fa8[fa sol fa16 sol] la2
    sol do4 do,8 re16 mi

    %33
    fa8[fa sol fa16 sol] la4 fa8 sol16 la
    sib8 sib do4 fa,2
    sol4 sol,8 la16 si\mbreak do8[do re do16 re]

    %36
    mi8[sol16 fa mi re do si] la4 la'
    mi2 fa4 sol
    r8 do,[sol la16 si] do8[do re do16 re]

    %39
    mi8[sol16 fa mi re do si] \once\stemUp la8[do'16 si la sol fa mi]
    re4 do fa2\mbreak
    R1

    %42
    r2 do'4 do,8 re16 mi
    fa8[fa sol fa16 sol] la8 sol fa mi
    re4 mi la, la'

    %45
    si do fa,2
    fa4. mi8 re4 sol\mbreak
    r8 do[do, re16 mi] fa4. fa8
    sol2 do,

    %49 ultimo mov.
    r4 r do'
    si2 do4
    fa, sol2

    %52
    la4 mi2
    fa4 re2
    mi fa4

    %55
    sol sol,2
    do4 do'2\mbreak
    sol4 re2

    %58
    la'4 fa2
    sol4 la2
    re,4 la2

    %61
    re4 re'4. do8
    si4 sol2
    do4 mi,2

    %64
    fa4 re2
    sol4 mi2
    fa4 sol2

    %67
    do,4 mi2\mbreak
    fa4 re2
    sol4 mi2

    %70
    fa4 sol2
    do,4 mi,2
    fa4 sol2

    %73
    do4 r r

}

Ibcn = \relative do {

    do'4 sol la mi
    fa do sol'2
    re' si8 re do mi,

    %4
    fa4 sol do,2
    do'4 do8. si16 la4 mi\mbreak
    si2 mi

    %7
    do re4 mi
    fa sol do, sol'
    re la' fa do'

    %10
    sol2 re
    sol4 sib fa la\mbreak
    mi fa sol sol,
    do1

    %14 secondo mov.
    do1 sol'2
    do, do' si4 la
    sol1 re2

    %17
    sol1 fa4 mi\mbreak
    re mi fa sol la si
    do,1 sol'2
    do,1.

    %21 terzo mov.
    do'4 si la sol
    do do, fa sol
    la4. fa16 mi\mbreak re4 mi

    %24
    fa2 sol
    sol4 sol, do re
    mi mi, la sol

    %27
    do2 re4 mi
    fa2 sol4 sol,
    do re\mbreak mi2

    %30
    la,4 re do fa~
    fa sol la2
    sol do4 do,

    %33
    fa sol la fa
    sib do fa,2
    sol4 sol,\mbreak do re

    %36
    mi2 la,
    mi' fa4 sol
    do, sol8 la16 si do4 re

    %39
    mi4. do8 \stemUp la \stemDown do' la \stemUp la,\stemNeutral
    re4 do fa2\mbreak
    sol la

    %42
    si4 do2 do,4
    fa sol la8 sol fa mi
    re4 mi la, la'

    %45
    si do fa,2
    fa4. mi8 re4 sol\mbreak
    do do, fa2
    sol do,

    %49 ultimo mov.
    r4 r do'
    si2 do4
    fa, sol2

    %52
    la4 mi2
    fa4 re2
    mi fa4

    %55
    sol sol,2
    do4 do'2\mbreak
    sol4 re2

    %58
    la'4 fa2
    sol4 la2
    re,4 la2

    %61
    re4 re'2
    si4 sol2
    do4 mi,2

    %64
    fa4 re2
    sol4 mi2
    fa4 sol2

    %67
    do,4 mi2\mbreak
    fa4 re2
    sol4 mi2

    %70
    fa4 sol2
    do,4 mi2
    fa4 sol2

    %73
    do,4 r r

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

IbfIn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s2 <5>8 <6> s4
    <6 5>1
    s2 <6+>8 <5> s4
    <4>4 <3> s2
    s1
    <6 5>
    s
    s2 <4>4 <3>
    s1*3

    s1.*7

    s1
    s2 <5>8 <6> <5> <6>
    s2 <5>8 <6> <5> <6>
    <5>2 <5>4 <6 4>
    <4> <3> s2
    s1*3
    <6 5>1
    s1*3
    s4 <6> s2
    s1
    s2 s4 <7>8 <6>
    s2 <7>4 <[6+]>
    <5> <6> s2
    s1
    s4 s8 <6> <6>4 s8 <6>
    s1
    s2 <7>4 <[6+]>
    s1
    <6 5>4  <6>8 <5> s2
    <6 5>2 <7>4 <6>
    s1
    <4>
    s
    <4>4 <3> s2
    s2.*10
    s4 <6> <5>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 65
    s1*13
    \bar ":..:"\break
    \time 3/2
    \tempo 1 = 60
    s1.*7
    \bar ":..:"\break
    \time 4/4
    \tempo 2 = 60
    s1*28
    \bar ":..:"\break
    \time 3/4
    \tempo 2. = 60
    s2.*25
    \bar ":|."

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}


Ilt = {
    \Iglobal
    \clef bass
    <<\Iltn \forma\Ibfn>>

}



Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \IbfIn>>

}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    la'\breve
    R1\fermata
    la4. sol8 la4 sib

    %5
    la1
    R\fermata
    la4. sol8 la4 sib

    %8
    la4. sol8[fa mi re do]\mbreak
    sib4 la sol fa
    sol1

    %11
    sol'4. fa8 sol4 la
    sol4. la8 fa mi fa sol
    la4. sol8 la4 sib

    %14
    la4. sib8 sol fa sol la
    sib2 la\mbreak
    sol fa

    %17
    mi re
    do sib
    la sol

    %20
    fa8 sol la sib do fa, do' la
    re4. do8 sib2~
    sib4 la\mbreak sol2

    %23
    fa4 do' sol la
    sib fa' do re
    mi sol2 fa4~

    %26
    fa mi8 re mi2
    fa1

    %28 secondo mov.
    do2~do8 re do sib la2\mbreak
    re sib sol
    la1 r2

    %31
    R1.
    fa'2~fa8 sol fa mib re2
    sol mib do

    %34
    re1 mi2~
    mi fa2. mi4
    mi1 r2\mbreak

    %37
    R1.
    la,2~la8 sib la sol fa2
    re' sib sol

    %40
    la1 si2
    do1 si2
    do1 fa2~

    %43
    fa8 sol fa mi re1\mbreak
    mi2~mi8 fa mi re dod2
    re1 dod2

    %46
    re1.
    r2 sol~sol8 la sol fa
    mi1 fa2~

    %49
    fa8 sol fa mi re2 mi
    fa fa mi
    fa1.\mbreak

    %52
    do2~do8 re do sib la2
    re~re8 mib re do sib2
    la sol1

    %55
    fa4 do' re mi fa2
    fa fa mi
    fa1.

    %58 terzo mov
    do1
    re2 mi
    fa1~

    %61
    fa2 mi4 re
    mi2 mi,
    fad sol~

    %64
    sol fad
    re'1~
    re

    %67
    do~\mbreak
    do
    fa~

    %70
    fa2 mi4 re
    mi1
    fa2 do

    %73
    re sib~
    sib la4 sol
    la2 la'~

    %76
    la sol~
    sol4 fa fa2~
    fa mi4 re

    %79
    mi1
    fa

    %81 quarto mov.
    do4 fa sol la
    sib sol la8.[sol16 fa8. mi16]
    re4 do re mi

    %84
    fa la, si do~
    do si do mi,
    fa sol sib?2

    %87
    la4 si do2
    fa,4 do' re mi\mbreak
    fa re mi8.[re16 do8. sib16]

    %90
    la4 re mi fa~
    fa mi2 re8. do16
    si8. la16 sol4 do8. si16 la4

    %93
    si do2 si4
    r do fa sol\mbreak
    la sib sol la8. sol16

    %96
    fa8. mi16 re4 mi fa~
    fa do r fa,
    fa' sol la sib

    %99
    sol la8. sol16 fa8. mi16 re4~
    re mi8. re16 dod4 re~
    re do!2 sib4

    %102
    la re2 do4~
    do sib2 la4
    sol2 fa4 do'~

    %105
    do re2 mi4
    fa2 re4 mi8. re16\mbreak
    do8. sib16 la4 re fa~

    %108
    fa mi fa8.[mi16 re8. do16]
    sib4 la8. sol16 fa4 sol
    r do fa sol

    %111
    la sib sol la~
    la8.[sol16 fa8. mi16] re4 sol8. fa16
    mi8. re16 do4 fa4. mi8\mbreak

    %114
    re8. do16 sib4 do8. sib16 la4
    sol1
    fa

    %117 ultimo mov.
    fa2 do'4
    re2 mi4
    fa2 re4

    %120
    mi4. re8 do sib
    la2 sol4
    la2 si4\mbreak

    %123
    do2.
    fa,4. do'8 re do
    sib2 la4

    %126
    sol2 do4
    do4. sib8 la4
    sib4. sib8 la sol

    %129
    fa2 r4
    do2 do'4
    re2 mi4\mbreak

    %132
    fa2 re4
    mi4. re8 do sib
    la2 sol4

    %135
    la2 re4
    do4. re8 mi re
    do2 sib4

    %138
    la4. sib8 do4
    si2 do4
    do2 si4

    %141
    do2 fa4\mbreak
    sol2 la4
    sib2 sol4

    %144
    la4. sol8 fa mi
    re4. re8 do sib
    la2 si4

    %147
    do4. re8 mi4
    fa4. mi8 re4
    mi2 fa4

    %150
    fa2 mi4
    fa4. re8 do sib\mbreak
    la4. sol8 fa mi

    %153
    re2 re'4
    mi2 fa4

    %155 coda
    fa2 mi
    fa4 sol la2~
    la4 sol4. fa8 mi re

    %158
    mi2 do4 fa~
    fa2 mi
    fa1\fermata

}

IIvlIIn = \relative do'' {

    do\breve
    R1\fermata
    fa4. mi8 fa4 re

    %5
    do1
    R\fermata
    fa4. mi8 fa4 re

    %8
    do4. mi8[re do sib la]\mbreak
    re, mi fa4 mi re
    mi1

    %11
    mi'4. re8 mi4 fa
    mi4. fa8 re do re mi
    fa4. sib,8 do4 re

    %14
    do4. re8 sib la sib do
    re2 do4 fa~\mbreak
    fa mi2 re4~

    %17
    re do2 sib4~
    sib la2 sol4~
    sol fa2 mi4

    %20
    fa2 r
    sib8 do re mi fa sib, fa' re
    sol do, fa4~\mbreak fa mi

    %23
    fa2 mi4 do
    re sib la sib~
    sib la8 sol la2

    %26
    sol1
    fa

    %28 secondo mov.
    la2~la8 sib la sol fa2\mbreak
    fa' fa mi
    fa1 r2

    %31
    R1.
    re2~re8 mib re do sib2
    sib' sib la

    %34
    sib2. fa4 sol2~
    sol la2. sol4
    sol1 r2\mbreak

    %37
    R1.
    do,2~do8 re do sib la2
    fa fa mi

    %40
    fa do' fa
    mi re2. re4
    mi1 la2~

    %43
    la8 sib la sol fa1\mbreak
    sol2~sol8 la sol fa mi2
    fa mi1

    %46
    fa2~fa8 sol fa mi re2~
    re sib~sib8 do sib la
    sol2 sol' la~

    %49
    la8 sib la sol fa2 sol
    la sol2. fa4
    fa1.\mbreak

    %52
    r2 fa,~fa8 sol fa mi
    re2 re' mi
    fa fa mi

    %55
    fa2. sol4 la2
    sol sol1
    fa1.

    %58 terzo mov.
    la,1
    si2 do~
    do si~

    %61
    si sol'~
    sol sol,
    la sib?

    %64
    do1~
    do2 sib4 la
    sib1~

    %67
    sib2 la4 sol\mbreak
    la1~
    la

    %70
    sol~
    sol
    la2 la'~

    %73
    la sol4 fa
    mi2 sol~
    sol fa

    %76
    sib1
    la2 sib4 do
    sol1~

    %79
    sol
    fa

    %81 quarto mov.
    R1*3
    fa,4 do' re mi
    fa re mi8.[re16 do8. sib16]

    %86
    la4 mi fa sol~
    sol fa sol8.[fa16 mi8. re16]
    do4 do'2 sib4\mbreak

    %89
    la fa r2
    do'4 fa sol la
    sib sol la8.[sol16 fa8. mi16]

    %92
    re4 sol8. fa16 mi4 fa8. mi16
    re4 do re2
    mi8.[re16 do8. sib16] la8.[fa'16 mi8. re16]\mbreak

    %95
    do4 fa, do'2
    do4 fa sol la
    sib sol la8.[sol16 fa8. mi16]

    %98
    re4 mi fa2
    mi la,4 re8. do16
    sib8. la16 sol2 fa4\mbreak

    %101
    mi do' fa sol
    la sib sol la8. sol16
    fa8. mi16 re4 mi fa~

    %104
    fa mi fa mi8. re16
    do8. sib16 la4 r do~
    do fa sol2\mbreak

    %107
    la sib
    sol la8.[sol16 fa8. mi16]
    re4 do re8. do16  sib4

    %110
    fa do' re mi
    fa re mi8.[re16 do8. sib16]
    la4 re8. do16 sib8. la16 sol4

    %113
    do4. sib8 la sol fa4\mbreak
    sib4. la8 sol4 fa~
    fa mi8 re mi2
    fa1

    %117 ultimo mov.
    R2.*7
    do'2 fa4
    sol2 la4

    %126
    sib2 sol4
    la4. sol8 fa mi
    re2 do4

    %129
    re2 mi4
    fa2 la,4
    si2 do4\mbreak

    %132
    do2 si4
    do4. sib?8 la sol
    fa2 r4

    %135
    do'2 fa4
    sol2 la4
    fa2 sol4

    %138
    la4. sol8 fa mi
    re2 do4
    re2 do4

    %141
    do2 re4\mbreak
    mi2 fa4
    fa4. fa8 mi re

    %144
    do4. sib8 la sol
    fa2 sol4
    do,4. la'8 sol fa

    %147
    sol2.
    do2 fa4
    sol2 la4

    %150
    sol2 sol4
    fa2.~
    fa

    %153
    fa2 fa4
    sol2 la4

    %155 coda
    sol2. sol4
    fa2. mi4
    re2 sib'~

    %158
    sib8 sib la sol la2
    sol1
    fa\fermata

}

IIltn = \relative do {

    fa,\breve
    R1\fermata
    fa'4. do8 fa4 sib,

    %5
    fa1
    R\fermata
    fa'4. do8 fa4 sib,

    %8
    fa'4. do8[re la sib fa]\mbreak
    sol4 fa do' re
    do1

    %11
    do4. re8 do4 fa,
    do'4. la'8 sib do sib sol
    fa4. sol8 fa4 sib,

    %14
    fa'4. re8 mib fa mib do
    sib do re mi fa sol la sib\mbreak
    do do, mi do re mi fa sol

    %17
    la sib do mi, fa re sol fa
    mi do fa fa, sol la sib do
    re mi fa la, sib sol do do,

    %20
    fa4. sol8 la4 fa
    sib2 re
    do\mbreak do

    %23
    fa8 sol la sib do do, fa fa,
    sib do re mi fa fa, sib' sib,
    do2~ do

    %26
    do1
    fa,

    %28 secondo mov. do
    R1.*2
    fa'2~fa8 sol fa mib re2
    sol mib do

    %32
    re1 r2
    R1.
    sib'2~sib8 do sib la sol2

    %35
    do la fa
    do~do8 re do sib la2\mbreak
    re sib sol

    %38
    la1 r2
    R1.
    fa'2~fa8 sol fa mi re2

    %41
    do sol' sol,
    do~do8 re do sib la2~
    la sib~sib8 do sib la\mbreak

    %44
    sol1 la2
    re, la'1

    %46
    re sib'2~
    sib8  do sib la sol1
    do2~do8 re do sib la2~

    %49
    la sib sol
    fa do'1
    fa,2 fa, sol\mbreak

    %52
    la1 fa2
    sib~sib8 do sib la sol2
    fa do'1

    %55
    fa2~fa8 re do sib la2
    sib do1
    fa,1.

    %58 terzo mov.

    fa'1~
    fa2 mi
    re1

    %61
    do
    do'~
    do2 sib

    %64
    la1
    sol~
    sol2 fa

    %67
    mi1\mbreak
    fa2 mi
    re do

    %70
    si1
    do2 sib?
    la1

    %73
    sib
    do~
    do

    %76
    do
    do
    do~

    %79
    do
    fa,

    %81 quarto mov.
    R1
    r2 fa4 fa'
    sol la sib sol

    %84
    la8.[sol16 fa8. mi16] re4 do
    re sol do,2
    fa,4 do' re mi

    %87
    fa re mi8.[re16 do8. sib16]
    la4 fa fa' sol\mbreak
    la sib sol la8. sol16

    %90
    fa8. mi16 re4 do8. sib16 la4
    sol do fa, fa'~
    fa mi la8. sol16 fa4

    %93
    sol la sol2
    \clef tenor \key fa\major do,4 do' re mi
    fa re mi8.[re16 do8. sib16]

    %96
    la4 sib8. la16 sol4 fa8. mi16
    re4 mi8. re16 do4 re8. do16
    \clef bass \key fa\major sib8. la16 sol4 fa8. mi16 re4

    %99
    mi'8. re16 dod4 re8.[dod16 sib8. la16]
    sol2 la\mbreak
    la re4 mi

    %102
    fa re mi la,
    re sol, do fa,
    do do' re mi

    %105
    fa2 re4 la'8. sol16
    fa8. mi16 re4 sib do\mbreak
    la8.[sol16 fa8. mi16] re4 re'8. do16

    %108
    sib4 do fa, fa'
    sol la sib sol
    la8. [sol16  fa8. mi16] re4 do

    %111
    fa sol mi fa~
    fa re~re mi8. re16
    do8. sib16 la2 re8. do16\mbreak

    %114
    sib8.[la16 sol8. fa16] mi4 fa
    do'1
    fa,

    %117 ultimo mov.
    R2.*3
    \clef tenor \key fa\major do'2 do'4
    re2 mi4

    %122
    fa2 re4\mbreak
    mi4. re8 do sib
    la2 sib4

    %125
    sol2 fa4~
    fa2 mi4
    \clef bass \key fa\major fa,2 fa'4
    sol2 la4

    %129
    sib2 sol4
    la4. sol8 fad? mi
    re2 do4\mbreak

    %132
    re2 sol,4
    do,2 do'4
    re2 mi4

    %135
    fa2 re4
    mi4. re8 do sib
    la2 sol4

    %138
    fa2 fa'4
    sol2 la4
    fa2 sol4

    %141
    do,4. do'8 sib la\mbreak
    sol4. sol8 fa mi
    re2 mi4

    %144
    fa,2 do'4
    re2 mi4
    fa2 re4

    %147
    mi4. re8 do sib
    la4. do8 sib la
    sol2 fa4

    %150
    do'2.
    fa4. sib8 la sol\mbreak
    fa4. mib8 re do

    %153
    sib4. do8 sib la
    sol2 fa4

    %155 coda
    do'1
    fa4 mi re do
    sib1

    %158
    do
    do
    fa,\fermata

}

IIbcn = \relative do {

    fa,\breve
    R1\fermata
    fa'4. do8 fa4 sib,

    %5
    fa1
    R\fermata
    fa'4. do8 fa4 sib,

    %8
    fa'4. do8[re la sib fa]\mbreak
    sol4 fa do' re
    do1

    %11
    do4. re8 do4 fa,
    do'4. la'8 sib do sib sol
    fa4. sol8 fa4 sib,

    %14
    fa'4. re8 mib fa mib do
    sib2 fa'\mbreak
    do re

    %17
    la'4 mi fa sol
    mi fa sol2
    re4 la sib do

    %20
    fa,4. sol8 la4 fa
    sib2 re
    do\mbreak do

    %23
    fa4 la do fa,
    sib re, fa sib,
    do2 do

    %26
    do1
    fa,

    %28 secondo mov.
    fa'1.\mbreak
    sib,2 sol do
    fa1 re2

    %31
    sol mib do
    re1 sol2
    mib do fa

    %34
    sib1 sol2
    do la fa
    do1 la2\mbreak

    %37
    re sib sol
    la2 fa1
    sib2 sol do

    %40
    fa1 re2
    do sol1
    do la2~

    %43
    la sib1\mbreak
    sol la2
    re, la'1

    %46
    re sib'2~
    sib sol1
    do la2~

    %49
    la sib sol
    fa do1
    fa2 fa, sol\mbreak

    %52
    la1 fa2
    sib1 sol2
    fa do'1

    %55
    fa, la2
    sib do1
    fa,1.

    %58 terzo mov.
    fa'1~
    fa2 mi
    re1

    %61
    do
    do'~
    do2 sib

    %64
    la1
    sol~
    sol2 fa

    %67
    mi1\mbreak
    fa2 mi
    re do

    %70
    si1
    do2 sib?
    la1

    %73
    sib
    do
    do

    %76
    do
    do
    do~

    %79
    do
    fa,

    %81 quarto mov.
    fa'2 do
    sol fa4 fa'
    sol la sib sol

    %84
    la fa re do
    re sol do,2
    fa,4 do' re mi

    %87
    fa re mi do
    la fa fa' sol\mbreak
    la sib sol la

    %90
    fa re do la
    sol do fa, fa'~
    fa mi la fa

    %93
    sol la sol2
    do, re4 mi\mbreak
    fa re mi do

    %96
    la sib sol fa'
    re mi do re
    sib sol fa re

    %99
    mi' dod re sib
    sol2 la\mbreak
    la re4 mi

    %102
    fa re mi la,
    re sol, do fa,
    do'2 re4 mi

    %105
    fa2 re4 la'
    fa re sib do\mbreak
    la fa re re'

    %108
    sib do fa2
    sol4 la sib sol
    la fa re do

    %111
    fa sol mi fa~
    fa re~re mi
    do la2 re4\mbreak

    %114
    sib sol mi fa
    do'1
    fa,

    %117 ultimo mov.
    fa'2.
    sib,
    re

    %120
    do
    re2 mi4
    fa2 re4\mbreak

    %123
    mi2 do4
    la2 sib4
    sol2 fa4~

    %126
    fa2 mi4
    fa2 fa'4
    sol2 la4

    %129
    sib2 sol4
    la2 fad4
    re2 do4\mbreak

    %132
    re2 sol,4
    do2.
    re2 mi4

    %135
    fa2 re4
    mi2 do4
    la2 sol4

    %138
    fa2 fa'4
    sol2 la4
    fa2 sol4

    %141
    do2 sib8 la\mbreak
    sol2 fa8 mi
    re2 mi4

    %144
    fa,2 do'4
    re2 mi4
    fa2 re4

    %147
    mi2 do4
    la4. do8 sib la
    sol2 fa4

    %150
    do'2.
    fa4. sib8 la sol\mbreak
    fa4. mib8 re do

    %153
    sib4. do8 sib la
    sol2 fa4

    %155 coda
    do'1
    fa4 mi re do
    sib1

    %158
    do
    do
    fa,\fermata

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*8
    <6>1
    s
    s
    s2 s4 s8 <6>
    s1
    s4 s8 <6> s4 s8 <6>
    s1<4>4 <3> <9> <8>
    <4> <6> <6 5> <_->
    <6 5>2 <9>4 <8>
    <4> <6> <6 5>2
    s
    <6>
    s <6>
    <7 3>4  <6 4> <5 4> <5 3>
    s <6> s2
    s4 <6> s2
    <7 3>4 <5> <6 5> <6 4>
    <5 4>2 <5 3>
    s1

    s1.*3
    s1 <6 _->2
    s1.*3
    s2 <6> s
    s1.
    s2 <5> s
    s1.
    s
    s1 <6+>2
    s2 <4> <[3+]>
    s1 <6>2
    s1.
    <6>1 <_+>2
    s <4> <[3+]>
    s1.*2
    s1 <6>2
    s1 <6>2
    s <4> <3>
    s1.
    <6>
    s
    s2 <4> <3>
    s1.
    s2 <4> <3>
    s1.

    s1
    <4\+ 2>2 <6>
    <7> <6+>
    <5 4> <5 3>
    s1
    <4\+ 2>2 <6>
    <7> <6+>
    <5 4> <5 3>
    s1
    <6 5>
    s
    s
    <6 5>
    s
    s
    <7>2 <6>
    <7 3> <5>
    <6 5> <4>
    <7 6> <7 5>
    <6 5> <6 4>
    <5 4> <5 3>
    s1*2

    s2 <6>
    <5>4 <6> s2
    s s4 <6>
    <6>2 <6+>
    <7>4 <_+> s2
    s <6>
    s4 <6+> <6> <6>
    <6> s <6> <6>
    <6> s <6> s
    s2 s4 <6>
    <7>1
    <4+ 2>4 <6> s2
    <_+>1
    s
    s4 <6> <6>2
    <6> <6>
    <6> <6>
    s4 <6> s2
    s1
    <5>4 <6> <6 3+>2
    <5 4>4 <3-> <7 3> <5>
    s <6> <7> s
    <7>2 <7->
    <4>4 <3> s <6>
    <5> <6> s2
    s <6>
    s <6>
    <6 5>1
    s
    <6>
    s
    s4 <5> <6> s
    s <5> <6> s
    s1*3

    s2.
    s
    <5>2 <6>4
    s2.
    s
    s2 <6+>4
    <6>2.
    <6>
    s
    <4 2>
    s
    s
    s2 <6>4
    <5>2.
    <6+>
    <7>2 <_+>4
    s2.*3
    <6>2 <6>4
    <6>2 <6>4
    s2.
    <_+>
    <6 5>2 <_+>4
    s2.
    <6>
    <6>
    s2 <6>4
    s2.
    s2 <6+>4
    <6>2.
    <6>
    <6>
    s2.*4
    <6>2.

    <4>2 <3>
    s1
    <7>2 <6>
    <7 3> <6 4>
    <5 4> <5 3>

}

forma = {


    \key fa\major
    \tempo 2 = 65
    \time 4/4
    s\breve
    s1*25
    \bar ":..:"\break
    \time 3/2
    \tempo 1 = 60
    s1.*30
    \bar ":..:"\break
    \time 4/4
    \tempo 1 = 45
    s1*23
    \bar ":..:"\break
    \time 4/4
    \tempo 2 = 60
    s1*36
    \bar ":..:"\break
    \time 3/4
    \tempo 2. = 60
    s2.*38
    \bar ":..:"
    \tempo 2 = 65
    \time 4/4
    s1*6
    \bar ":|."

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}


IIlt = {
    \IIglobal
    \clef bass
    <<\IIltn \forma>>

}



IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    r4 fa2 fa4~
    fa mi8. fa16 fa2
    do'4 sib la4. sol8

    %4
    sol4 fa mi4. re8\mbreak
    re4 re8. do16 do4 re
    mi2 fa4 sol

    %7
    la2 sib4. la8
    sol4. fa8 sol4 sol8. fa16
    fa1

    %10
    do2 dod4 re
    mi2 la,4 re\mbreak
    dod4. re8 mi2~

    %13
    mi4 re8 do? si do re4~
    re do8 sib? la sib do4
    sib8 la sol do~do si16 la si4

    %16
    do mi fa sol~
    sol8 fa16 mi fa4. mi16 re mi4~
    mi8 re16 do re4~\mbreak  re8 do16 si do4~

    %19
    do8 sib?16 la sib4. la16 sol la4
    fa'8 sol4 la sol16 fa sib4~
    sib8 la16 sol do8 sib16 la sib4. la16 sol

    %22
    la4. sol16 fa sol4 sol8. fa16
    fa1

    %24 secondo mov.
    fa,8 sol la sib do4
    re do4. sib8
    la4 fa fa'

    %27
    re8 mi fa sol la4
    fa fa mi
    fa2.

    %30
    do8 re mi fa sol4
    la sol4. fa8
    mi fa sol la re,4\mbreak

    %33
    do do si
    do2.
    la4 sib?2

    %36
    la8 sib do re sol,4
    fa fa mi
    fa2.

    %39
    la'8 sol fa mi re4
    do2 re4
    mi fa2

    %42
    mi4. re8 do sib\mbreak
    la4 si do
    si do re

    %45
    re do sol'~
    sol fa la8 sol
    fa mi re4. do8

    %48
    do2.
    r4 la'8 sol fa mi
    re2 mi4

    %51
    fa re8 do sib4
    la sol2\mbreak
    la4. sol8 fa mi

    %54
    re4 mi fa
    mi fa sol~
    sol fa do'

    %57
    do sib re8 do
    sib la sol4. fa8
    fa2.

    %60 terzo mov.
    do'2 do2. do4
    do1.
    re2 do2. do4

    %63
    re1.
    mi2 fa2. mi4
    mi1.

    %66
    mi,2 re2. re4
    mi1.
    do'2 do2. do4

    %69
    do1.\mbreak
    re2 mib2. re4
    re2. re4 do2

    %72
    sib2. sib4 la2
    sol2. la4 sib2
    la2. sib4 do2

    %75
    do1 sib2
    sib2. do4 la2~
    la sol1
    fa1.\fermata

    %79 quarto mov.
    fa2 do'4 re
    do2 r8 fa fa fa
    mi do fa16 sol la sib do8 la4 sol8

    %82
    sol2 fa8.[mi16 re do sib do]
    la8 do do do la fa4 do'16 re
    mi fa sol mi la4 sol8 fa16 mi fa4\mbreak

    %85
    mi4. re8 re2
    do16 sol' mi fa sol fa mi re do4 re8. re16
    la sib do sib la sol fa8 sol2

    %88
    fa r
    r r4 do'\mbreak
    fa sol fa4. sib,8

    %91
    sib sib la fa fa'16 sol la sib do8 fa,~
    fa mi16 re mi4 fa r
    r8 fa, fa fa mi do fa16 sol la sib

    %94
    do4 mi la sib\mbreak
    la sol8 fa sol2
    fa4 fa, do' re~

    %97
    re do r8 fa, fa fa
    mi do do'16 re mi fa sol8.[fa16 mi re do re]
    si8 sol do4 re4. mi8\mbreak

    %100
    do4. sib8 la2
    sol8 fa4 mi8 fa fa' fa fa
    mi do fa16 sol la sib do8.[sib16 la sol fa sol]

    %103
    mi8 do fa sol la8.[fa16 mi fa re mi]
    dod8 la re2 dod4\mbreak
    re8 fa fa fa mi do? fa16 sol la sib

    %106
    do4 r8 fa, fa fa mi4
    do8[fa16 mi re do sib do] la4 fa
    do' re2 do4~

    %109
    do r8 sib\mbreak sib8 sib la fa
    sib16 do re mi fa4 r8 fa fa fa
    mi do fa16 sol la sib do8 la sol4

    %112
    do, fa sol fa~
    fa mi8 re mi2
    fa1

    %115 ultimo mov.
    r4 r la,8 sib
    do4 re4. re8
    do4. sib8 la4

    %118
    sib sol4. do8
    la2 fa'8 sol
    la4 sib4. sib8

    %121
    la4. sol8 fa4
    fa mi4. mi8
    fa2 do'4~

    %124
    do si2
    do4. sib?8 la4~
    la sol4. sol8

    %127
    sol2 mi,8 fa
    sol4 la4. la8
    sol2 mi'8 fa

    %130
    sol4 la4. la8
    sol2 do4
    fa, sol4. sol8

    %133
    la2 sol4\mbreak
    sib la2
    sol4. la8 fa4~

    %136
    fa8 sol sol4. fa8
    fa2 sol4
    sib la2

    %139
    sol4. la8 fa4~
    fa8 sol sol4. fa8
    fa2.

    %142
    R2.*2\mbreak
    r4 r fa8 sol
    la4 sib4. la8

    %146
    la2 do4~
    do si4. si8
    do2.

    %149
    sib4 la4. la8
    sol4. fa8 mi4~
    mi re4. re8

    %152
    sol,2 la8 sib
    do4 re4. re8\mbreak
    do2 do'8 sib

    %155
    la4 sol4. fa8
    fa2 do'8 sib
    la4 sol2~

    %158
    sol fa mi4. fa8
    fa2.

}

IIIvlIIn = \relative do'' {

    la4. sib8 do4 re
    sib4. la8 la2
    la'4. sol4 fa8 fa4~

    %4
    fa8 mi4 re  do8 do4~\mbreak
    do si8. do16 do2~
    do4 sib la sol

    %7
    fa mi re4. re'8
    mi do fa4~fa mi8. fa16
    fa1

    %10
    la,2 sol4 fa
    mi la fa sol\mbreak
    la4. si8 dod4 la'8 sol

    %13
    fa sol la2 sol8 fa
    mi fa sol2 fa8 mi
    re4 mi fa4. mi16 re

    %16
    mi8 do sol' la sib4. la16 sol
    la4. la8 sol4. sol8
    fa4. fa8\mbreak mi4. mi8

    %19
    re4. re8 do4. do8
    re4 mi fa4. mi16 re
    sol8 fa16 mi la4~la8 sol16 fa sol4~

    %22
    sol8 fa16 mi fa2 mi8. fa16
    fa1

    %24 secondo mov.
    R2.*3
    fa,8 sol la sib do4
    re do4. sib8

    %29
    la4 fa do'
    la8 sib do re mi4
    do do si

    %32
    do2 si4\mbreak
    do re2
    mi8 fa sol la la, sib

    %35
    do re sol,2~
    sol4 fa mi
    fa sol4. fa8

    %38
    fa2.
    R
    r4 la'8 sol fa4

    %41
    mi re2
    mi4 fa sol\mbreak
    la4. sol8 fa mi

    %44
    re4 mi fa
    mi4. re8 do sib
    la2.

    %47
    si8 do si4. do8
    do2 mi8 re
    do sib la2

    %50
    re8 do sib la sol4
    fa2 sol4
    la sib2\mbreak

    %53
    la4 sib do
    re4. do8 sib la
    sol4 la sib

    %56
    la4. sol8 fa mi
    re2.
    mi8 fa mi4. fa8
    fa2.

    %60 terzo mov.
    la2 sol2. sol4
    la1.
    fa'2 fa2. fa4

    %63
    fa1.
    sib2 la2. sol4
    sol1.

    %66
    sol,2 sol2. sol4
    sol1.
    la2 sol2. sol4

    %69
    la1.\mbreak
    sib2 sib la
    sib2. sib4 la2

    %72
    sol2. sol4 fa2
    mi2. fa4 sol2
    fa2. sol4 la2

    %75
    re2. mi4 fa2
    mi2. sol4 do,2
    fa fa2. mi4
    fa1.\fermata

    %79 quarto mov.
    R1
    r2 fa,
    do'4 re do2

    %82
    r8 do do do la fa sib16 do re mi
    fa4 fa,16 sol la sib do8 la la'4
    sol8 fa16 mi fa4 mi4. re8\mbreak

    %85
    re do16 si do2 si4
    r do fa sol
    fa2 r8 do do do

    %88
    la fa fa'16 sol la sib do8.[sib16 la sol fa sol]
    mi8 do fa4 sol la~\mbreak
    la8 fa4 mi re16 do re4

    %91
    r8 do do do la fa fa'16 sol la sib
    sol8 do, do do la fa sib16 do re mi
    fa2 r

    %94
    r4 do fa sol~\mbreak
    sol8 fa fa2 mi4
    fa8 fa,16 sol la sib do re mi fa sol mi fa4

    %97
    mi4. re16 do re2
    do r
    r r4 do\mbreak

    %100
    fa sol2 fa4
    r8 sib, sib sib la fa fa'16 sol la sib
    do8.[sib16 la sol fa sol] mi8.[re16 do sib la sib]

    %103
    sol4 la8 sib do la sol4~
    sol8[fa fa mi16 re] mi2\mbreak
    r4 fa do' re

    %106
    do2 r8 do do do
    la fa sib16 do re mi fa4 la
    sol fa mi4. re16 do

    %109
    re2\mbreak do4. fa8
    fa fa re sib fa'16 sol la sib do8 la
    sol4 r8 fa fa fa mi do

    %112
    fa16 sol la sib do8 do, do do la fa
    do' re mi fa sol2
    fa1

    %115 ultimo mov.
    r4 r fa,8 sol
    la4 sib4. sib8
    la4. sol8 fa4

    %118
    fa mi4. fa8
    fa2 la8 sib
    do4 re4. re8

    %121
    do4. sib8 la4
    sib sol4. do8
    la4. la'8 sol4~\mbreak

    %124
    sol8 la fa4. sol8
    mi2 fa4~
    fa mi2

    %127
    mi do,8 re
    mi4 fa4. fa8
    mi2 do'8 re

    %130
    mi4 fa4. fa8
    mi4. re8 do4
    re mi4. mi8

    %133
    fa2 do4\mbreak
    fa mi2
    re4. mi8 fa4~

    %136
    fa mi4. fa8
    fa2 do4
    fa2 mi4

    %139
    re4. mi8 fa4~
    fa mi4. fa8
    fa2.

    %142
    R2.*4
    r4 r do8 re
    mi4 fa4. fa8

    %148
    mi2.
    R
    r4 r do8 re

    %151
    mi4 fa4. fa8
    mi2 do'8 sib
    la4 sol2~\mbreak

    %154
    sol fa4~
    fa mi4. fa8
    fa2 la,8 sib

    %157
    do4 re4. re8
    do2 do'8 sib la4 sol4. fa8
    fa2.

}

IIIltn = \relative do {

    fa4. sol8 la4 sib
    sol do fa,2
    fa,4 sol la4. sib8

    %4
    do4 re mi4. fa8\mbreak
    sol4 sol, do sib
    la sol fa mi

    %7
    re' do sib2
    do4. re8 do2
    fa,1

    %10
    fa'2 mi4 re
    dod2 re4 sib\mbreak
    la la'4. si8 dod4

    %13
    re re, sol si,
    do mi fa fa,
    sib do re2

    %16
    do re4 mi
    fa8 do re la sib sol do sib
    la fa sib fa'\mbreak sol mi la sol

    %19
    fa re sol fa mi do fa la,
    sib4 do re2
    do do

    %22
    do do
    fa,1

    %24 secondo mov.
    fa'4. sol8 la4
    sib do2
    re la4

    %27
    sib la8 sol fa4
    sib do2
    fa, mi4

    %30
    fa mi8 re do4
    fa, sol2
    do8 re mi fa sol4\mbreak

    %33
    la sol4. fa8
    mi4 do fa~
    fa fa4. mi8

    %36
    fa, sol la sib do4
    re do2
    fa,2.

    %39
    fa2 sol4
    la'8 sol fa mi re4
    do do si

    %42
    do re mi\mbreak
    fa2.
    sol2 re4

    %45
    mi2.
    fa4 la8 sol fa mi
    re do sol'4 sol,

    %48
    do mi8 re do sib
    la2.
    sib2 do4

    %51
    re'8 do sib la sol4
    fa~fa mi\mbreak
    fa sol la

    %54
    sib2.
    do2 sol4
    la2.

    %57
    sib4 re8 do sib la
    sol fa do'4 do,
    fa2.

    %60 terzo mov
    fa2 mi2. mi4
    fa1.
    sib,2 la2. la4

    %63
    sib1.
    sol'2 fa fa,
    do'1.

    %66
    do'2 si2. si4
    do1.
    fa,2 mi2. mi4

    %69
    fa1.\mbreak
    re2 do1
    sib2. sib4 fa'2

    %72
    sol2. sol4 la2
    do2. la4 sol2
    re'2. sib4 la2

    %75
    sib,2. do4 re2
    do1.~
    do
    fa,\fermata

    %79 quarto mov.
    fa'2 la4 sib
    la8 sol fa mi re2
    do4 sib8 la16 sol la4 sib

    %82
    do2 fa4 sol
    fa2 r8 fa fa fa
    mi do fa16 sol la sib do8 la re re,\mbreak

    %85
    mi4. fa8 sol4 sol,
    do,8 do' do do la fa sib do
    re mi fa2 mi4

    %88
    r8 fa fa fa mi do fa16 sol la sib
    do8.[sib16 la sol fa sol] mi8 do fa mi\mbreak
    re4 do8 do'16 sib la8 fa sib16 la sol fa

    %91
    mi8 do fa la re re, la'[la,]
    do,4 do' fa sol
    fa r8 fa, do' 4re

    %94
    do8 do' do do la fa sib16 do re mi\mbreak
    fa8 re sib la sol[la16 sib do8 do,]
    fa, fa' fa fa mi do fa sol

    %97
    la si do2 si4
    \clef tenor \key fa\major r8 do do do si sol do16 re mi fa

    %99
    sol8.[fa16 mi re do re] si8 sol do si\mbreak
    \clef bass \key fa\major la8[sol16 fa mi8 do] fa mi re do
    sib re sol, do \once\stemUp fa, la' re, fa

    %102
    do la re re, mi mi' fa fa,
    do'8.[sib16 la sib sol la] fa4 sol
    la1\mbreak

    %105
    re2 do8 fa fa fa
    mi do fa16 sol la sib do4 do,
    fa sol fa8 fa, fa fa

    %108
    mi do fa16 sol la sib do8[do'16 sib la sol fa mi]
    fa re mi fa sol fa mi re\mbreak mi do re mi fa mi re do
    re8 sib sib sib la fa fa'16 sol la sib

    %111
    do4 re do8 do, do do
    la fa' fa fa mi do fa16 sol la sib
    do1
    fa,

    %115 ultimo mov.
    r4 r la8 sol
    fa4 sib,4. sib8
    fa'4. sol8 la4

    %118
    sol do2
    fa,2 la,8 sol
    fa4 sib4. sib8
    fa'4. sol8 la4

    %122
    sol do,2
    fa,4. fa'8 mi4~\mbreak
    mi8 fa re4. mi8

    %125
    do2 do4~
    do si2
    do2 mi'8 re

    %128
    do4 fa,4. fa8
    do'2 mi,8 re
    do4 fa,4. fa8

    %131
    do'4. sib8 la4
    sib sol2
    fa mi'4\mbreak

    %134
    re do2
    sib4. do8 la4
    sib do2

    %137
    fa mi4
    re do2
    sib4. do8 la4

    %140
    sib do2
    fa,2.
    r4 r fa'8 sol

    %143
    la4 sib4. sib8\mbreak
    la2 fa4~
    fa mi4. mi8

    %146
    fa2 mi4~
    mi re2
    do  do'8 re

    %149
    \clef tenor \key fa\major mi4 fa4. fa8
    mi 2do4~
    do si4. si8

    %152
    do2 fa,8 sol
    la4 sib?4. sib8\mbreak
    \clef bass\key fa\major la2.

    %155
    sib4 do2
    fa, fa,8 sol
    la4 sib4. sib8

    %158
    la2. sib4 do2
    fa,2.

}

IIIbcn = \relative do {

    fa4. sol8 la4 sib
    sol do fa,2
    fa,4 sol la4. sib8

    %4
    do4 re mi4. fa8\mbreak
    sol4 sol, do sib
    la sol fa mi

    %7
    re' do sib2
    do4. re8 do2
    fa,1

    %10
    fa'2 mi4 re
    dod2 re4 sib\mbreak
    la la'4. si8 dod4

    %13
    re re, sol si,
    do mi fa fa,
    sib do re2

    %16
    do re4 mi
    fa8 do re la sib sol do sib
    la fa sib fa'\mbreak sol mi la sol

    %19
    fa re sol fa mi do fa la,
    sib4 do re2
    do do

    %22
    do do
    fa,1

    %24 secondo mov.
    fa'4. sol8 la4
    sib do2
    re la4

    %27
    sib la8 sol fa4
    sib do2
    fa, mi4

    %30
    fa mi8 re do4
    fa, sol2
    do8 re mi fa sol4\mbreak

    %33
    la sol4. fa8
    mi4 do fa~
    fa fa4. mi8

    %36
    fa, sol la sib do4
    re do2
    fa,2.

    %39
    fa2 sol4
    la'8 sol fa mi re4
    do do si

    %42
    do re mi\mbreak
    fa2.
    sol2 re4

    %45
    mi2.
    fa4 la8 sol fa mi
    re do sol'4 sol,

    %48
    do mi8 re do sib
    la2.
    sib2 do4

    %51
    re'8 do sib la sol4
    fa~fa mi\mbreak
    fa sol la

    %54
    sib2.
    do2 sol4
    la2.

    %57
    sib4 re8 do sib la
    sol fa do'4 do,
    fa2.

    %60 terzo mov
    fa2 mi2. mi4
    fa1.
    sib,2 la2. la4

    %63
    sib1.
    sol'2 fa fa,
    do'1.

    %66
    do'2 si2. si4
    do1.
    fa,2 mi2. mi4

    %69
    fa1.\mbreak
    re2 do1
    sib2. sib4 fa'2

    %72
    sol2. sol4 la2
    do2. la4 sol2
    re'2. sib4 la2

    %75
    sib,2. do4 re2
    do1.~
    do
    fa,\fermata

    %79 quarto mov.
    fa'2 la4 sib
    la8 sol fa mi re2
    do4 sib8 la16 sol la4 sib

    %82
    do2 fa4 sol
    fa1
    mi8 do fa4 do'8 la re re,\mbreak

    %85
    mi4. fa8 sol4 sol,
    do2 la8 fa sib do
    re mi fa2 mi4

    %88
    fa2 mi8 do fa4
    do' la8 fa mi do fa mi\mbreak
    re4 do8 do' la fa sib sol

    %91
    mi do fa la re re, la'[la,]
    do2 fa4 sol
    fa4. fa,8 do'4 re

    %94
    do4. do'8 la fa sib4\mbreak
    \clef tenor \key fa\major fa'8 re sib la sol4 do
    fa,2 mi8 do fa sol

    %97
    la si do4~do si
    do2 si8 sol do4
    sol' mi8 do si sol do si\mbreak

    %100
    la4 mi8 do\clef bass \key fa\major fa8 mi re do
    sib re sol, do \once\stemUp fa, la' re, fa
    do la re4 mi fa

    %103
    do la8 sol fa4 sol
    la1\mbreak
    re2 do8 fa4 fa8

    %106
    mi do fa4 do' do,
    fa sol fa fa,
    mi8 do fa4 do' la'

    %109
    fa sol\mbreak mi fa
    re8 sib4 sib8 la fa fa'4
    do' re do do,

    %112
    la8 fa'4 fa8 mi do fa4
    do1
    fa,

    %115 ultimo mov.
    r4 r fa
    fa'4 sib,2
    fa'4. sol8 la4

    %118
    sol do2
    fa,2.
    fa,4 sib2
    fa'4. sol8 la4

    %122
    sol do,2
    fa mi4~\mbreak
    mi re2

    %125
    do do4~
    do si2
    do2.

    %128
    do'4 fa,2
    do'2.
    do,4 fa,2

    %131
    do' la4
    sib sol2
    fa mi'4\mbreak

    %134
    re do2
    sib la4
    sib do2

    %137
    fa mi4
    re do2
    sib la4

    %140
    sib do2
    fa,2.
    fa2 fa'4

    %143
    la sib2\mbreak
    la fa4~
    fa mi2

    %146
    fa mi4~
    mi re2
    do fa4

    %149
    \clef tenor \key fa\major mi' fa2
    mi do4~
    do si2

    %152
    do fa,4
    la sib?2\mbreak
    \clef bass\key fa\major la2.

    %155
    sib4 do2
    fa, fa,4
    la sib2

    %158
    la2. sib4 do2
    fa,2.

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    <7>1
    s4 <9>8 <8> <7> <6> s4
    <4>8 <3> <9> <8> <7> <6> s4
    s1*5
    s2 <6+>
    s s4 <6>
    <_+>1
    <9 5>4 <8> <9 5+> s
    s2 <9>4 <6>8 <5>
    s2 <7>4 <6+>
    s2 <6>
    <9>2 <6 5>
    <6 5> <6 5>
    <6 5> <6 5>
    <5>8 <6> <5> <6> <5>4 <6>
    <7> <6> <7>2
    <6> <4>4 <3>
    s1

    s2 <6>4
    s <4> <3>
    s2.*2
    s4 <4> <3>
    s2.*2
    s4 <4> <3>
    s2 <_+>4
    s <4> <3>
    s2.
    s4 <4 2> s
    s2.*3
    s2 <_+>4
    s2 <5>8 <6>
    s4 <4 2> s
    s2.*2
    s2 <_+>4
    <7> <6> <5>
    s2.
    <_+>
    s
    <6>
    s
    s2 <6>4
    s <4 2> s
    s2.*3
    <7>4 <6> s
    s2.
    <6>
    s

    s1.*4
    <6>1.
    s1.*5
    <6>2 <_- 7> <_- 6>
    s1.
    s1 <6>2
    s2. <6>4 s2
    s1.
    s1 <6>2
    <7 3>1 <6 4>2
    <6 4> <5 3>1
    s1.

    s2 <6>
    s <7>4 <6>
    s1
    <4>4 <3> s2
    s1*2
    <7>8 <6> s <6 5> <4>4 <3>
    s2 <6>4 <6>
    s1*2
    s4 <6 5> <6 5> s8 <6>
    s2 <6 5>
    <6 5>4 <6>8 <6> s2
    <4>4 <3> s2
    s1*2
    s2 <7>
    s s4 <6>
    <5 4>2 <2>
    s1
    s
    <6>
    <6>4 <7> s2
    s1
    s4 <6> s <6>
    <7 [3+]> <6 4> <5 [3+]>2
    s1
    s2 <4>4 <3>
    <6 5>1
    s
    <6 5>2 <6 5>
    <6>1
    s2 <6 4>4 <5 3>
    s1
    <4>2 <3>
    s1

    s2.*2
    s2 <6>4
    <7> s2
    s2.*2
    s2 <6>4
    <7>2.
    s2 <6>4
    <6> <6+>2
    s <6 4>4
    s <6 5>2
    s2.*6
    s2 <6>4
    <6> <6>2
    <6> <6>4
    <6 5>2.
    s2 <6>4
    <6> <6>2
    s <6>4
    <6 5>2.
    s2.*3
    <6>2.
    s4 <6 5->2
    s2.
    s4 <6+>2
    s2.
    s
    <6>
    s4 <5>2
    s2.
    s4 <6>2
    <7>2 <6>4
    s2.*3
    <7>2 <6> <4>4 <3>

}

IIIbfIn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*23
    s2.*36
    s1.*10
    <6>2 <_- 7> <_- 6>
    s1.
    s1 <6>2
    s2. <6>4 <6>2

}

forma = {

    \key fa\major
    \tempo 2 = 60
    \time 4/4
    s1*9
    \bar ":..:"
    s1*14
    \bar ":..:"\break
    \time 3/4
    \tempo 2 = 60
    s2.*15
    \bar ":..:"
    s2.*21
    \bar ":..:"\break
    \time 3/2
    \tempo 1 = 50
    s1.*19
    \bar ":..:"\break
    \time 4/4
    \tempo 2 = 60
    s1*36
    \bar ":..:"\break
    \time 3/4
    \tempo 2. = 60
    s2.*27
    \bar ":..:"
    s2.*16\set Score.measureLength = #(ly:make-moment 6 4)
    s1.\set Score.measureLength = #(ly:make-moment 3 4)
    s2.
    \bar ":|."

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}


IIIlt = {
    \IIIglobal
    \clef bass
    <<\IIIltn \forma\IIIbfIn>>

}



IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \header {
        title = \markup \center-column{"Sinfonia in Do maggiore W-K14"}
        composer = \markup \center-column{"L. Colista (1629-1680)"}
    }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Liuto]"}
                \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                \set Staff.shortInstrumentName = "lt"
                \Ilt
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"[Continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
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

    \header {
        title = \markup \center-column{"Sinfonia in Fa maggiore W-K26"}
        composer = \markup \center-column{"L. Colista (1629-1680)"}
    }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Liuto]"}
                \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                \set Staff.shortInstrumentName = "lt"
                \IIlt
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"[Continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
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

    \header {
        title = \markup \center-column{"Sinfonia in Fa maggiore W-K25"}
        composer = \markup \center-column{"L. Colista (1629-1680)"}
    }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"[Liuto]"}
                \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                \set Staff.shortInstrumentName = "lt"
                \IIIlt
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"[Continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
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
