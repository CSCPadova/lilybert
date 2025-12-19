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

    sol'1
    R\fermata
    r4 sol fa2

    %4
    mi4. re8 do si la4~
    la si2 do4~\mbreak
    do si8 la si2

    %7
    re1
    R\fermata
    r4 re do2

    %10
    si4. la8 sol fa mi4~
    mi fad2 sol4~
    sol fad sol sol'~

    %13
    sol8 fa mi re do si la4~
    la si2 do4\parenthesize ~
    do si8 la si2

    %16
    do1\fermata
    r8 sol'
    sol4 r8 r16 sol mi8. [mi16 la8. la16]

    %19
    sol8.[sol16 fa8. fa16] mi8.[sol16 fa8. mi16]
    re4 r16 si do re mi4 r16 mi re do
    re4 r16 re do si\mbreak do4 r16 do si la

    %22
    si sol la si do4~do16 do si la si4
    r16 mi fa sol la4 r16 re, mi fa sol4
    r16 do, re mi fa4~fa16 fa mi re mi sol fa mi

    %25
    re4~re16 fa mi re mi4 r8 sol
    sol4 r8 r16 sol mi8. [mi16 la8. la16]
    sol8.[sol16 fa8. fa16] mi8.[sol16 fa8. mi16]

    %28
    re4 r16 si do re mi4 r16 mi re do
    re4 r16 re do si\mbreak do4 r16 do si la
    si sol la si do4~do16 do si la si4

    %31
    r16 mi fa sol la4 r16 re, mi fa sol4
    r16 do, re mi fa4~fa16 fa mi re mi sol fa mi
    re4~re16 fa mi re mi4 r8 re

    %34
    re4 r8 r16 re si8.[si16 mi8. mi16]
    re8.[re16 do8. do16]\mbreak si8.[re16 do8. si16]
    la4 r16 fad? sol la si4 r16 si la sol

    %37
    la4 r16 la sol fad sol4 r16 sol fad mi
    fad re mi fad sol4~sol16 sol fad mi fad4
    r16 si do re mi4 r16 la, si do re4\mbreak

    %40
    r16 sol, la si do4~do16 do si la si re do si
    la4~la16 do si la si2
    R1*4\mbreak

    %46
    sol'2 mi4 do
    fa mi re2
    r8 do mi do sol'16 fa sol la si la sol fa

    %49
    mi8 fa sol sol, do16 re do si la si do re
    si2 r
    r\mbreak r4 sol'

    %52
    mi do fa mi
    re8 mi16 fa sol2 fad4
    sol2 mi4 re

    %55
    do2. si4\mbreak
    do2 r8 do mi do
    fa16 mi fa sol la sol fa mi re4. re8

    %58
    sol16 fa sol la si la sol fa mi re mi fa sol fa mi re
    do si do re mi re do si la8 si  do re\mbreak
    si4 sol'2 mi4

    %61
    do fa4. mi8 re4
    mi2 r
    R1

    %64
    do2 mi4 sol\mbreak
    re mi fa2
    r8 sol mi sol re16 mi re do si do re mi

    %67
    fad8 mi re sol la,16 sol la si do si la do
    si4 r r2
    r8 sol' mi sol\mbreak do,4 fa16 sol fa mi

    %70
    re4 sol16 la sol fa mi4 fa
    mi2 re
    mi sol,4 si

    %73
    re la4. si8 do4~
    do si\mbreak do2
    R1

    %76
    do2 si4 sol
    do si la2
    r8 sol si sol do16 si do re mi re do si\mbreak

    %79
    la8 si do do, fa16 sol fa mi re mi fa sol
    mi8 mi' do mi re16 do si do re do si la
    sol8 la si do mi4 fad

    %82
    sol2 mi4 do
    fa mi re2
    do1\mbreak

    %85
    r8 sol do mi sol16 fa sol la sol la sol fa
    mi2 r
    R1

    %88
    r8 do, fa la do16 si do re do re do si
    la2 r\mbreak
    r8 re si sol r4 r8 sol'

    %91
    mi do r4 r8 sol' r fa
    r mi r re r do r do
    si re si sol r4 r8 sol'

    %94
    re mi si do re sol sol sol\mbreak
    sol fa r mi r mi r mi
    r re r re r re re4

    %97
    do1
    r4 r sol'
    mi4. re8 do4

    %100
    fa4. mi8 re4
    mi4. fa8 mi4\mbreak
    la,4. si16 do re4

    %103
    sol,2 la4
    re,2 mi4
    la4. sol8 fad4

    %106
    sol2 sol'4
    mi4. re8 do4
    fa4. mi8 re4

    %109
    sol,2.
    la2 si4
    do2.\mbreak
    do

    %113
    do
    do
    do2 si4

    %116
    do8 si do re mi do
    re do re mi fa re
    mi re mi fa sol mi

    %119
    fa2.\mbreak
    fa
    fa

    %122
    fa
    fa2 mi4
    fa2.

    %125
    r4 r fa
    mi4. re8 do4
    fa4. mi8 re4\mbreak

    %128
    mi2.
    r4 r sol
    mi4. re8 do4

    %131
    fa4. mi8 re4
    mi2.
    re

    %134
    re
    re\mbreak
    re

    %137
    re
    do2 r4

}

IvlIIn = \relative do'' {

    mi1
    R\fermata
    r4 mi do re

    %4
    sol,2 la4. sol8
    fa mi re4 sol4. la8\mbreak
    re,1

    %7
    si'
    R\fermata
    r4 si sol la

    %10
    re,2 mi4 mi'8 re
    do si la4 re4. mi8
    la,4 re4. do8 si la

    %13
    sol2 la4. sol8
    fa mi re4 sol4. la8\mbreak
    re,1

    %16
    mi\fermata
    r8 mi'
    mi4 r8 r16 mi sol8.[sol16 fa8. fa16]

    %19
    mi8.[mi16 re8. re16] do8.[mi16 re8. do16]
    si re mi fa sol4 r16 mi fa sol la4
    r16 re, mi fa sol4\mbreak r16 do, re mi fa4~

    %22
    fa16 fa mi re mi sol fa mi re4~re16 fa mi re
    mi4 r16 mi re do re4 r16 re do si
    do4 r16 do si la si sol la si do4~

    %25
    do16 do si la si4 do r8 mi
    mi4 r8 r16 mi sol8.[sol16 fa8. fa16]
    mi8.[mi16 re8. re16] do8.[mi16 re8. do16]

    %28
    si re mi fa sol4 r16 mi fa sol la4
    r16 re, mi fa sol4\mbreak r16 do, re mi fa4~
    fa16 fa mi re mi sol fa mi re4~re16 fa mi re

    %31
    mi4 r16 mi re do re4 r16 re do si
    do4 r16 do si la si sol la si do4~
    do16 do si la si4 do r8 si

    %34
    si4 r8 r16 si re8.[re16 do8. do16]
    si8.[si16 la8. la16]\mbreak sol8. [si16 la8. sol16]
    fad la si do re4 r16 si do re mi4

    %37
    r16 la, si do re4 r16 sol, la si do4~
    do16 do si la si re do si la4~la16 do si la
    si4 r16 si la sol la4 r16 la sol fad\mbreak

    %40
    sol4 r16 sol fad mi fad re mi fad sol4~
    sol16 sol fad mi fad4 sol2
    sol' mi4 do

    %43
    fa mi re2
    do r
    R1\mbreak

    %46
    r8 sol si sol do16 si do re mi re do si
    la8 si do do, fa16 sol fa mi re mi fa sol
    mi8 fa sol la si do re si

    %49
    do4 sol2 fad4
    sol'2 mi4 do
    fa mi\mbreak re2

    %52
    do4 la fa do'~
    do si la2
    re4 si sol sol'

    %55
    fa mi2 re4\mbreak
    do8 mi, sol mi la16 sol la si do si la sol
    fa4 re8 re' si16 la si do re8 si

    %58
    mi2 sol16 fa sol la si la sol fa
    mi re mi fa sol fa mi re do8 re mi fa\mbreak
    re4 si sol do~

    %61
    do8 si la2 si4
    do2 r
    R1

    %64
    r8 do la do sol16 la sol fa mi fa sol la\mbreak
    si8 la sol sol' re16 do re mi fa mi re fa
    mi2 r

    %67
    R1
    r8 re si re sol,4 r
    r8 mi' do mi\mbreak la,4 re16 mi re do

    %70
    si4 mi16 fa mi re do4 re~
    re do2 si4
    do mi sol re~

    %73
    re8 mi fa4 mi2
    re\mbreak mi4 sol
    re mi fa8 fa,re fa

    %76
    mi16 fa mi re do re mi fa re2
    R1
    sol'2 mi4 do\mbreak

    %79
    fa mi re si
    r8 do mi do sol'16 fa sol la si la sol fa
    mi8 fa sol sol, do16 re do si la si do re

    %82
    si8 sol si sol do16 si do re mi re do si
    la8 si do2 si4
    do1

    %85
    R1
    r8 sol do mi sol16 fa sol la sol la sol fa
    mi2 r

    %88
    r r8 do, fa la
    do16 sib do re mi re do sib la2\mbreak
    r4 r8 re si sol r4

    %91
    r8 sol' mi do r mi r re
    r do r si r la r la
    sol4 r8 re' si sol r4

    %94
    r8 sol' re mi si do re mi\mbreak
    si re re re re do r do
    r do r do r si si4

    %97
    do1
    R2.*5
    r4 r do

    %104
    si4. la8 sol4
    do4. si8 la4
    si4. do8 si4

    %107
    sol2 r4
    r r sol'
    mi4. re8 do4

    %110
    fa4. mi8 re4
    mi2.\mbreak
    re

    %113
    re
    re
    re2 re4

    %116
    mi8 re mi fa sol mi
    fa mi re do si4
    do8 si do re mi do

    %119
    la'2.\mbreak
    sol
    sol

    %122
    sol
    sol2 sol4
    fa2 fa4

    %125
    la,4. sol8 fa4
    do'8 re mi fa sol mi
    la,4 re8 do si4\mbreak

    %128
    do2 mi4
    re4. do8 si4
    do4. re8 mi4

    %131
    re4. do8 si4
    do2.
    do

    %134
    do
    do\mbreak
    do

    %137
    do2 si4
    do2 r4

}

Ivcn = \relative do {

    do'1
    R\fermata
    r4 do la si

    %4
    do4. si8 la sol fa mi
    re2 mi4. fa8\mbreak
    sol2 sol,

    %7
    sol'1
    R\fermata
    r4 sol mi fad

    %10
    sol4. fa?8 mi re do si
    la2 si4. do8
    re2 sol4. fa8

    %13
    mi re do si la sol fa mi
    re2 mi4. fa8\mbreak
    sol1

    %16
    do\fermata
    r8 do'
    do4 r8 r16 do, do8.[do16 fa,8. fa16]
    do'8.[do16 re8. re16] mi8.[mi16 fa8. fa16]

    %20
    sol4 r16 sol, la si do4 r16 do'16 si la
    si4 r16 si, la sol\mbreak la4 r16 la' sol fa
    sol4 r16 mi re do sol'4 sol,

    %23
    do r16 do' si la si4 r16 si, la sol
    la4 r16 la' sol fa sol4 r16 mi re do
    sol'4 sol, do r8 do'\mbreak

    %26
    do4 r8 r16 do,  do re mi do fa sol la fa
    do' do, mi do re mi fa re mi fa sol mi fa sol la fa
    sol4 r16 sol, la si do sol' la si do do, si la

    %29
    si fad' sol la si si, la sol la mi' fa? sol la la, sol fa
    sol si do re do mi re do sol' fa sol la sol8 sol,\mbreak
    do4 r16 do si la si fad' sol la si si, la sol

    %32
    la mi' fa? sol la la, sol fa sol si do re do mi re do
    sol' fa sol la sol8 sol, do4 r8 sol'
    sol4 r8 r16 sol sol8.[sol16 do,8. do16]

    %35
    sol'8.[sol,16 la8. la16]\mbreak si8.[si16 do8. do16]
    re4 r16 re mi fad sol4 r16 sol fad mi
    re4 r16 fad? mi re mi4 r16 mi re do
    re4 r16 si la sol re'4 re,

    %39
    sol r16 sol' fad mi fad4 r16 fad mi re\mbreak
    mi4 r16 mi re do re4 r16 si la sol
    re'4 re, sol2

    %42
    R1*2
    r8 do mi do sol'16 fa sol la si la sol fa
    mi8 fa sol sol, do16 re do si la si do re\mbreak

    %46
    sol,2 r
    R1
    do2 si4 sol

    %49
    do si la2
    sol8 sol' si sol do16 si do re mi re do si
    la8 si do do,\mbreak fa16 sol fa mi re mi fa sol

    %52
    do,4 r r2
    r re
    si4 sol do4. si8

    %55
    la2 r8 sol si sol\mbreak
    do16 si do re mi re do si la4. la'8
    re,16 do re mi fa8 re sol16 fa sol la si la sol fa

    %58
    mi re mi fa sol fa mi re do4 r
    R1\mbreak
    sol'2 mi4 do

    %61
    fa4. mi8 re2
    r8 do la do sol16 la sol fa mi fa sol la
    si8 la sol sol' re16 do re mi fa mi re fa

    %64
    mi4 r r2\mbreak
    R1
    sol2 si4 re

    %67
    la si do2
    sol r8 sol mi sol
    do,2\mbreak fa16 sol fa mi  re4

    %70
    sol16 la sol fa mi4 la16 si la sol fa mi fa re
    sol mi fa sol la sol fa mi fa re mi fa sol4
    r do, mi sol

    %73
    re4. mi8 fa4. do8
    sol4 sol'\mbreak mi4. do8
    fa4 mi re2

    %76
    r8 do mi do sol'16 fa sol la si la sol fa
    mi8 fa sol sol, do16 re do si la si do re
    sol la sol fa mi fa sol mi la2\mbreak

    %79
    R1
    do,2 si4 sol
    do si la2

    %82
    sol8 mi' sol mi la16 sol la si do si la sol
    fa4 do sol2
    do1

    %85
    R1*2
    r8 do mi sol do16 sib do re do re do sib
    la2 fa

    %89
    r8 fa, la do fa16 mi fa sol fa sol fa mi\mbreak
    re4 r r8 sol si, sol
    r4 r8 do' mi,8 do re4

    %92
    mi8 r fa r sol r la r
    si4  r r8 sol si, sol
    r4 r8 sol' re mi si do\mbreak

    %95
    sol r la r si r do r
    re sol sol sol sol[fa sol8. sol16]
    do,1

    %98
    R2.*2
    r4 r sol'
    mi4. re8 do4\mbreak

    %102
    fa4. mi8 re4
    mi2 fad4
    sol2.

    %105
    r4 r re
    si4. la8 sol4
    do4. si8 la4

    %108
    re4. do8 si4
    do4. si8 la sol
    fa2 sol4

    %111
    do8 si do re mi do\mbreak
    fa mi fa re mi fa
    sol fa sol la si sol

    %114
    la sol la si do mi,
    fa re mi fa sol4
    mi4. re8 do4

    %117
    fa4. mi8 re4
    do2.
    fa,8 mi fa sol la fa\mbreak

    %120
    sib la sib sol la sib
    do si? do re mi do
    re do re mi fa la,

    %123
    sib sol la sib do sib
    la4. sol8 fa4
    fa'4. mi8 re4

    %126
    do8 si do re mi do
    re mi fa4 sol\mbreak
    mi4. re8 do4

    %129
    si4. la8 sol4
    do4. si8 la4
    re2 sol4

    %132
    mi4. re8 do4
    fa4. mi8 re4
    sol8 fa sol la si sol

    %135
    la sol la si do mi,\mbreak
    fa mi fa re mi fa
    sol2.

    %38
    do,2 r4

}

Ibcn = \relative do {

    do'1
    R\fermata
    r4 do la si

    %4
    do4. si8 la sol fa mi
    re2 mi4. fa8\mbreak
    sol2 sol,

    %7
    sol1
    R\fermata
    r4 sol' mi fad

    %10
    sol4. fa?8 mi re do si
    la2 si4. do8
    re2 sol4. fa8

    %13
    mi re do si la sol fa mi
    re2 mi4. fa8\mbreak
    sol1

    %16
    do\fermata
    r8 do'
    do4 r8 r16 do, do8.[do16 fa,8. fa16]
    do'8.[do16 re8. re16] mi8.[mi16 fa8. fa16]

    %20
    sol4 sol, do do'
    si si,\mbreak la la'
    sol mi sol sol,

    %23
    do do' si si,
    la la sol do
    sol' sol, do r8 do'\mbreak

    %26
    do4 r8 r16 do, do4 fa
    do re mi fa

    %28
    sol sol, do do'
    si si, la la'
    sol mi sol sol,\mbreak

    %31
    do do' si si,
    la la' sol do,
    sol' sol, do r8 sol'

    %34
    sol4 r8 r16 sol sol4 do,
    sol la\mbreak si do

    %36
    re re sol mi
    fad re mi do
    re sol, re' re,

    %39
    sol mi' fad re\mbreak
    mi do re sol,
    re' re, sol2

    %42
    sol'4 sol, do2
    re4 mi sol2
    do, sol'

    %45
    mi8 fa sol sol, do4 re\mbreak
    sol,2 do
    re4 do re sol

    %48
    do,2 si4 sol
    do si la2
    sol4 sol' do2

    %51
    la8 si do do,\mbreak fa,4 sol
    do fa re mi8 fa
    sol2 re

    %54
    si4 sol do si
    la2 r8 sol si sol\mbreak
    do4 mi8 do la4. la'8

    %57
    re,4 fa8 re sol4 si8 sol
    mi4. mi16 re do4 sol
    do4. mi8 la,4 la'\mbreak

    %60
    sol2 mi4 do
    fa4. mi8 re2
    do4 la8 do sol4 mi

    %63
    si'8 la sol sol' re4. re8
    mi4 fa mi do\mbreak
    sol' mi re2

    %66
    sol si4 re
    la si do2
    sol sol4 mi8 sol

    %69
    do,2\mbreak fa4 re
    sol mi la fa
    sol la fa sol

    %72
    do,2 mi4 sol
    re4. mi8 fa4 do
    sol'2\mbreak mi4. do8

    %75
    fa4 mi re2
    do sol'
    mi4 sol do, la

    %78
    sol mi' la2\mbreak
    fa4 do re sol
    do,2 si4 sol

    %81
    do si la2
    sol4 sol' la do
    fa, do sol2

    %84
    do1
    do
    do

    %87
    do
    la2 fa
    fa'1\mbreak

    %90
    re4 sol sol, si8 sol
    do2 do4 re
    mi8 r fa r sol r la r

    %93
    si4 sol sol, si8 sol
    sol'4 sol, re'8 mi si do\mbreak
    sol8 r la r si r do r

    %96
    re sol sol sol sol fa sol4
    do,1
    r4 r sol

    %99
    do2.
    re2 sol4
    mi4. re8 do4\mbreak

    %102
    fa4. mi8 re4
    mi2 fad4
    sol2 do,4

    %105
    la2 re4
    si4. la8 sol4
    do4. si8 la4

    %108
    re4. do8 si4
    do4. si8 la sol
    fa2 sol4

    %111
    do2.\mbreak
    fa
    sol

    %114
    la2 mi4
    fa2 sol4
    mi4. re8 do4

    %117
    fa4. mi8 re4
    do2.
    fa,\mbreak

    %120
    sib
    do
    re

    %123
    sib
    la4. sol8 fa4
    fa'4. mi8 re4

    %126
    do2.
    re4 fa sol\mbreak
    mi4. re8 do4

    %129
    si4. la8 sol4
    do4. si8 la4
    re2 sol4

    %132
    mi4. re8 do4
    fa4. mi8 re4
    sol2.

    %135
    la2 mi4\mbreak
    fa2.
    sol

    %138
    do,2 r4

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s
    s2 <6>
    s1
    <5>4 <6> <5> <6>
    <4>4 <3> s2
    s1
    s
    s2 <6>
    s1
    <5>4 <6+> s2
    <4>4 <[3+]> s2
    s1
    <5>4 <6> <5> <6>
    <4>2 <3>
    s1
    s4
    s1*3
    s4 <6> s <6>
    <7> <6> s2
    s4 <6> s <6>
    s <6> <7> s
    <4> <3> s2
    s1*3
    s4 <6> s <6>
    s <6> <4> <3>
    s <6> s <6>
    s <6> <7> s
    <4> <3> s2
    s1
    s
    <_+>
    s4 <_+> s2
    <_+> <4>4 <3>
    s2 s4 <_+>
    s2 <_+>
    <4>4 <3> s2
    s1
    s2 <4>4 <3>
    s1*5
    s2 <7>4 <6+>
    s1*3
    <4>4 <3> <4> <3>
    s1*12
    <6>1
    <6+>4 <6> <6>2
    s1
    s
    s2 s4 <6>
    <6 5>1
    s
    s
    <4>4 <3> s2
    s1*4
    s2 <_->
    s1
    s2 <5>4 <6+>
    s1
    s2
    <4>4 <3>
    s1*4
    <5>4 <6> s2
    s1*9
    s2.*2
    <_->2.
    s2.*4
    <_->2.
    s2.*6
    <6 5>2.
    <6 4>
    <4 3>
    <6 5>
    s2.*4
    <6 5>2.
    s
    <4 3>
    <6 5>
    s2.*7
    <_->2.
    s
    <6 5>
    <5 4>
    <4 3>
    <6 5>
    <4>2 <3>4

}

forma = {

    \time 4/4
    \tempo 4 = 70
    s1*16
    \bar ":..:"\break
    \time 4/4
    \tempo 2 = 60
    \partial 4 s4
    s1*7
    s2.
    \bar ":..:"\break
    s4
    s1*7
    s2.
    \bar ":..:"\break
    s4
    s1*8
    \bar ":..:"\break
    \time 4/4
    s1*42
    s1\fermata
    \bar ":..:"\break
    \time 4/4
    s1*13
    \bar ":..:"\break
    \time 3/4
    \tempo 2. = 75
    s2.*41
    \bar":|."

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}


Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>

}



Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    mi4 fad8 sold la8 la,4 si8
    dod2 r4 dod
    red mi fad2~

    %4
    fad8 mi16 red? mi2 red4~\mbreak
    red4 dod8 si dod red mi4~
    mi red8. mi16 mi4 sold,

    %7
    dod re? mi2
    mi4. la8 sold fad mi re
    dod la mi'2 re4~

    %10
    re dod8 re mi [fad si,8. la16]
    la1\fermata
    mi'4. mi8 fad[sold la8. sold16]

    %13
    sold8[mi la8. sold16] fad8 sold la la,
    si[dod re8. dod16] dod8[red mi fad16 mi]
    red8 [mid fad sold?16 fad] mid8 dod fad sold

    %16
    la[si16 la sold?8. fad16] fad2
    mi? re\mbreak
    dod8 re mi2 re4~

    %19
    re8[mi16 re dod8. si16] si4~si8. la16
    la1
    la8 si dod re mi fad

    %22
    mi fad mi fad mi re
    dod4 la mi'\mbreak
    fad2 mi8 re

    %25
    mi4 re4. dod8
    dod2 si8 la
    si2.

    %28
    mi,
    mi'4 fad2
    mi red4

    %31
    mi2.
    fad\mbreak
    sold

    %34
    la4 mi fad~
    fad re8 dod re4~
    re dod2

    %37
    la4 si2
    si4 la8 sold la4~
    la sold4. la8

    %40
    la2.
    la'8 sold fad mi re dod
    red4 mi fad

    %43
    sold, la si
    la8 sold fad mi re dod
    red4 mi fad

    %46
    mi2 mi4~
    mi red4. mi8
    mi4 mi'8 re dod si

    %49
    la sold fad sold la4\mbreak
    si4. dod8 re4
    dod2.

    %52
    re4 fad8 mi re dod
    re dod si4 dod8 re
    mi4. re8 dod si

    %55
    dod4 si4. la8
    la2.
    dod2 fad2. mi4

    %58
    mi1.
    mi2 la2. sold4
    sold1 mi2

    %61
    la fad sold
    mi2. re4 dod2
    fad re mi

    %64
    dod2. si4 la2
    re mi dod\mbreak
    si1 dod2

    %67
    la re2. dod4
    dod1 fad2
    re sol?2. fad4

    %70
    fad1 sol2
    la si2. si4
    mi,1.

    %73
    fad4. sol8 mi2. re4
    re1 sol2
    la si2. si4\mbreak

    %76
    mi,1.
    fad4. sol8 mi2. re4
    re1 fad2

    %79
    mi re2. dod4
    dod1 si2
    si si si4 la

    %82
    si2. la4 si dod
    re2 re re
    dod si si

    %85
    dod4. re8 si2. la4\mbreak
    la2. la4 si dod
    re2 re re

    %88
    dod si si
    dod4. re8 si2. la4
    la1.\fermata

    %91
    mi'2 fad4. mi16 fad
    si,8 mi mi re dod16 si la si dod re mi dod\mbreak
    re mi re mi fad sol la fad sol8 dod, re mi

    %94
    fad8.[mi16 re8 dod] si8.[la16 sol8 fad]
    la8 dod re mi la,[si16 dod re8 dod]
    si[dod16 re mi8 re] dod4 r

    %97
    r2 mi\mbreak
    fad4. mi16 fad si,8 mi mi re
    dod16 si la si dod re mi dod red8 si mi4~

    %100
    mi red mi2
    r4 la, si4. la16 si
    mi,8 la la sol fad16 mi re mi fad sol la fad\mbreak

    %103
    sold fad mi fad sold la si sold la sold fad sold la si dod re
    si8 la la2 sold8. la16
    la8 la' la sol? fad16 mi re mi fad sol la fad

    %106
    sol fad mi re dod la si dod re4 la'
    si4. la16 si mi,8 la la sol
    fad16 mi re mi fad sol la fad\mbreak sol2~

    %109
    sol fad~
    fad4 mi8 re dod16 la si dod re mi fad sol
    mi4 la2 sold8 fad

    %112
    sold2 r4 mi
    fad4. mi16 fad\mbreak si,8 mi mi re
    dod16 si la si dod re mi dod re dod si la sold mi fad sold

    %115
    la4 mi' fad4. mi16 fad
    si,8 mi mi re dod16 si la si dod re mi la,
    si1

    %118
    la\fermata
    mi'2 fad4
    mi4. re8 dod4

    %121
    re si2
    dod4. si8 la4
    mi' fad2

    %124
    sold4. la8 si4
    sold fad2
    mi2.

    %127
    si2 dod4
    si4. la8 sold4\mbreak
    la si2

    %130
    sold4. fad8 mi4
    la si2
    dod4. si8 la4

    %133
    re mi2
    fad4. sol?8 la4
    fad mi2

    %136
    re fad4
    mi re2
    mi4. re8 dod4

    %139
    re mi2
    dod si4\mbreak
    si si2

    %142
    si2 dod4
    dod  si2
    la si4

    %145
    si si2
    si dod4
    dod si2

    %148
    la2.\fermata

}

IIvlIIn = \relative do'' {

    dod4. re8 mi4 fad
    mi2 r4 mi
    fad sold la4. sold16 fad

    %4
    sold4. la16 si fad4~fad16 sold la si\mbreak
    mi,4. fad16 sold fad4. mi8
    fad16 sold la sold fad8. mi16 mi4 si~

    %7
    si8 la4 sold8 dod4 si8 la
    sold fad mi mi'~mi re dod si
    la4. sold?8 fad sold! la si

    %10
    sold mi la2 sold8. la16
    la1\fermata
    dod4. mi8 red8.[mi16 fad8. si,16]
    si4 dod8. si16 la8. sold16 fad4

    %14
    sold8 la si2 la4
    fad'8 [sold la si16 la] sold4 fad~
    fad mid8. fad16 fad4 re~

    %17
    re dod2 si4~\mbreak
    si la fad'8[sold la si16 la]
    sold8 si mi, la la4 sold8. la16

    %20
    la1
    R2.*3\mbreak
    la,4 si2

    %25
    la sold4
    la8 si dod re mi fad
    mi fad mi fad mi re

    %28
    dod4 la si
    dod2 si8 la
    si4 la4. sold8

    %31
    sold? la si dod red mi
    red2.\mbreak
    mi2 r4

    %34
    mi,8 fad sold la si dod
    si dod si dod si la
    sold4 mi mi'

    %37
    fad re8 dod re4
    dod2 si4~
    si si4. la8

    %40
    la2.
    dod4 red mi
    fad sold la

    %43
    sold8 fad mi re dod si
    dod si la sold? fad mi
    fad4 sold la

    %46
    sold2 fad4~
    fad fad4. mi8
    mi2.

    %49
    R
    r4 si''8 la sol fad
    mi dod re mi mi4

    %52
    fad4. sold8 la4
    sold2.
    la

    %55
    la4 la4. sold8
    la2.
    la,2 re2. dod4

    %58
    dod1.
    mi2 mi red
    mi1.

    %61
    dod2 la re~
    re dod2. si4
    la2 si1

    %64
    mi, fad4 sold
    la2 si la\mbreak
    sold1 la2~

    %67
    la sold2. la4
    la1 re2~
    re dod2. re4

    %70
    re1.
    do2 si2. mi4
    dod?2. si4 la2

    %73
    re1 dod2
    re1.
    do2 si2. mi4\mbreak

    %76
    dod?2. si4 la2
    re1 dod2
    re1 la2~

    %79
    la la sold
    la1.
    la2 la2. fad4

    %82
    sold1.
    fad2. mi4 fad sold
    la1 la2~

    %85
    la sold2. la4\mbreak
    la1.
    fad2. mi4 fad sold

    %88
    la1 la2~
    la sold2. la4
    la1.\fermata

    %91
    R1*3
    la'2 si4. la16 si
    mi,8 la la sol fad16 mi re mi fad sold la fad

    %96
    sold fad mi fad sold la si sold la8 la, si dod
    re sold, la si dod4 r\mbreak
    la'2 si4. la16 si

    %99
    mi,8 la la sol fad4. mi8
    fad2 r8 mi mi re
    dod16 si la si dod re mi dod re dod si la sold mi fad sold

    %102
    la4 mi' fad4. mi16 fad\mbreak
    si,8 mi mi re dod16 si la si dod re mi dod
    re8[dod dod si16 la] si4~si8. si16

    %105
    la2 r
    r4 mi' fad4. mi16 fad
    si,8 mi mi re dod16 si la si dod re mi dod

    %108
    red dod si dod red mi fad red\mbreak mi4 si
    mi2. re8 dod
    si16 la sol la si dod re si mi4. re8~

    %111
    re dod16 si dod4 re r
    r si dod4. si16 dod
    fad,8[si si8. la16]\mbreak sold fad mi fad sold la si sold

    %114
    la4 la' si4. la16 si
    mi,8 la la sol? fad16 mi re mi fad sol la fad
    sold2 la~

    %117
    la4 sold8 fad sold2
    la1\fermata
    dod,2 re4

    %120
    dod4. si8 la4
    si2.
    mi,

    %123
    si'4 la2
    si2 mi4
    mi red2

    %126
    mi2.
    sold,2 la4
    sold4. fad8 mi4\mbreak

    %129
    fad2.
    si
    la4 sold2

    %132
    la2.
    la4 sol2
    fad4. mi8 re4

    %135
    re' dod2
    re la4
    la si2

    %138
    mi, la4
    si2.
    la\mbreak

    %141
    la4 sold2
    fad4. sold8 la4
    la sold2

    %144
    la2.
    la4 sold2
    fad4. sold8 la4

    %147
    la sold2
    la2.\fermata

}

IIvcn = \relative do {

    la'4. si8 dod4 re
    la la, r la'8 sold
    fad si, mi,[mi'] mi[red16 dod red8 si]

    %4
    mi dod sold mi la la' si si,\mbreak
    dod dod' la sold la fad sold sold,
    la fad' si si, mi4. re8

    %7
    dod4 si la8 la' sold fad
    mi re dod la mi'2
    fad4 dod re2

    %10
    mi mi,
    la1\fermata
    r4 la'8 sold fad mi red si
    mi8.[re?16 dod8 la] re4 re'8 dod

    %14
    si la sold mi la si dod la
    si sold fad si, dod4 la
    si dod fad2

    %17
    sold4 la fad sold\mbreak
    dod,2 re
    mi mi,

    %20
    la1
    la'2.
    sold
    la2 dod,4\mbreak

    %24
    re2.
    dod4 si2
    la4 la'2

    %27
    sold2.
    la2 sold4
    la2.

    %30
    sold4 fad2
    mi8 fad sold la si dod
    si dod si dod si la\mbreak

    %33
    sold4 mi si'
    dod2 si8 la
    si2 si,4

    %36
    dod2.
    re2 mi4
    fad2 re8 dod

    %39
    re4 mi2
    la,2.
    la'4 si dod

    %42
    si8 la sold fad mi red
    mi4 fad sold
    la si dod

    %45
    si2 fad4
    dod'8 si la sold la fad
    sold la si4 si,

    %48
    mi2.
    fad\mbreak
    sold

    %51
    la
    re,4 re'8 dod si la
    si4 mi,8 re dod si

    %54
    dod si la si dod4
    re mi2
    la,2.

    %57
    la'2 fad re
    la'1.
    sold2 fad si,

    %60
    mi2. re4 dod2~
    dod re si
    dod2. si4 la2

    %63
    la' la sold
    la2. sold?4 fad2~
    fad sold la\mbreak

    %66
    mi2. re4 dod2
    re si mi
    la2. sol?4 fad2

    %69
    sol mi la,
    re1 mi2
    fad sol2. sol4

    %72
    la2. sol4 fad2
    re la1
    re mi2

    %75
    fad sol2. sol4\mbreak
    la2. sol4 fad2
    re la1

    %78
    re re'2
    dod si mi,
    la1 sold2~

    %81
    sold fad1
    mi1.
    si2 si si

    %84
    dod1 re2~
    re mi1\mbreak
    la,1.

    %87
    si2 si si
    dod1 re2~
    re mi1

    %90
    la,1.\fermata
    R1
    r2 la'\mbreak

    %93
    si4. la16 si mi,8 la la sol
    fad16 mi re mi fad sol la fad sol la sol la si dod re si
    dod8 la si dod re2

    %96
    mi, fad4. mi16 fad
    si,8 mi mi re dod16 si la si dod re mi dod\mbreak
    re mi re mi fad sol la fad sold8 mi fad sold

    %99
    la4 la, si dod
    si2 mi,4 mi'
    fad4. mi16 fad si,8[mi mi8. re16]

    %102
    dod16 si la si dod re mi dod re2\mbreak
    mi fad4 dod
    re la mi2

    %105
    la4 la' si4. la16 si
    mi,8 la la sol fad16 mi re mi fad sol la fad
    sol2 la4 la,

    %108
    si4. la16 si\mbreak mi,8 mi' mi re
    la16[si la si dod re mi dod] re[mi re mi fad sol la fad]
    sol4. si8 la sol fad mi

    %111
    la,4 la' si4. la16 si
    \clef tenor \key re\major mi,8 mi' mi re dod16 si la si dod re mi dod
    re2\mbreak mi4 mi,

    %114
    \clef bass \key re\major fad4. mi16 fad si,8[mi mi8. re16]
    dod16 si la si dod re mi dod re2
    mi1~

    %117
    mi
    la,\fermata
    la'2 re,4

    %120
    la2 la'4~
    la sold2
    la2.

    %123
    sold4 fad2
    mi4. fad8 sold4
    la si2

    %126
    mi,2.
    mi2 la,4
    mi2 mi'4~\mbreak

    %129
    mi red2
    mi re?4
    dod si2

    %132
    la la'4
    fad mi2
    re4. mi8 fad4

    %135
    sol la2
    re, re'4
    dod si2

    %138
    dod4. si8 la4~
    la sold2
    la sold4\mbreak

    %141
    fad mi2
    re4. mi8 dod4
    re mi2

    %144
    la sold4
    fad mi2
    re4. mi8 dod4

    %147
    re mi2
    la,2.\fermata

}

IIbcn = \relative do {

    la'4. si8 dod4 re
    la la, r la'8 sold
    fad si, mi,[mi'] mi[red16 dod red8 si]

    %4
    mi dod sold4 la si\mbreak
    dod4 la'8 sold la fad sold4
    la, si mi4. re8

    %7
    dod4 si la8 la' sold fad
    mi re dod la mi'2
    fad4 dod re2

    %10
    mi mi,
    la1\fermata
    la'4. sold8 fad mi red si
    mi8.[re?16 dod8 la] re4 re'8 dod

    %14
    si la sold mi la si dod la
    si sold fad si, dod4 la
    si dod fad2

    %17
    sold4 la fad sold\mbreak
    dod,2 re
    mi mi,

    %20
    la1
    la'2.
    sold
    la2 dod,4\mbreak

    %24
    re2.
    dod4 si2
    la4 la'2

    %27
    sold2.
    la2 sold4
    la2.

    %30
    sold4 fad2
    mi si4
    si'2.\mbreak

    %33
    sold4 mi si'
    dod2 si8 la
    si2 si,4

    %36
    dod2.
    re2 mi4
    fad2 re4~

    %39
    re4 mi2
    la,2.
    la'4 si dod

    %42
    si2.
    mi,4 fad sold
    la si dod

    %45
    si2 fad4
    dod'2 la4
    sold si2

    %48
    mi,2.
    fad\mbreak
    sold

    %51
    la
    re,
    si4 mi2

    %54
    dod4 la dod
    re mi2
    la,2.

    %57
    la'2 fad re
    la'1.
    sold2 fad si,

    %60
    mi2. re4 dod2~
    dod re si
    dod2. si4 la2

    %63
    la' la sold
    la2. sold?4 fad2~
    fad sold la\mbreak

    %66
    mi2. re4 dod2
    re si mi
    la2. sol?4 fad2

    %69
    sol mi la,
    re1 mi2
    fad sol2. sol4

    %72
    la2. sol4 fad2
    re la1
    re mi2

    %75
    fad sol2. sol4\mbreak
    la2. sol4 fad2
    re la1

    %78
    re re'2
    dod si mi,
    la1 sold2~

    %81
    sold fad1
    mi1.
    si2 si si

    %84
    dod1 re2~
    re mi1\mbreak
    la,1.

    %87
    si2 si si
    dod1 re2~
    re mi1

    %90
    la,1.\fermata
    la'2 re,
    mi la\mbreak

    %93
    si mi,8 la4 sol8
    fad2 sol
    la re,

    %96
    mi fad
    si,8 mi4 re8 dod2\mbreak
    re4 fad mi2

    %99
    la, si4 dod
    si2 mi
    fad si,8\noBeam mi8~mi8. re16

    %102
    dod2 re\mbreak
    mi fad4 dod
    re la mi2

    %105
    la4 la' si2
    mi,8 la4 sol8 fad2
    sol la4 la,

    %108
    si2\mbreak  mi,8 mi'4 re8
    dod2 re4 fad
    sol4.  si8 la sol fad mi

    %111
    la2 si
    \clef tenor \key re\major  mi dod
    re\mbreak mi

    %114
    \clef bass \key re\major fad,2 si,8\noBeam mi8~mi8. re16
    dod2 re
    mi1~

    %117
    mi
    la,\fermata
    la'2 re,4

    %120
    la2 la'4~
    la sold2
    la2.

    %123
    sold4 fad2
    mi4. fad8 sold4
    la si2

    %126
    mi,2.
    mi2 la,4
    mi2 mi'4~\mbreak

    %129
    mi red2
    mi re?4
    dod si2

    %132
    la la'4
    fad mi2
    re4. mi8 fad4

    %135
    sol la2
    re, re'4
    dod si2

    %138
    dod4. si8 la4~
    la sold2
    la sold4\mbreak

    %141
    fad mi2
    re4. mi8 dod4
    re mi2

    %144
    la sold4
    fad mi2
    re4. mi8 dod4

    %147
    re mi2
    la,2.\fermata

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <5>4 <6>8 <6+> s2
    s1
    <6+>8  <_+> s4 <4 2>2
    <_+> <6 5>4 <_+>
    s2 <6>8 <6+> s4
    <6 5> <_+> <_+> s
    <7>8 <6> <7> <6> s2
    <_+>  <5>4 <6>8 <5>
    <5>4 s <9> <8>
    <7 3> <6 4> <5 4> <3>
    s1
    s2 s4 <5>
    <_+>1
    <6+>4 <5> s8 <_+> s4
    <_+>8 <6+> <5>4 s <6>
    <7 5> <3+> <6>2
    <6 5> <6 5>
    <7>4 <6> <9> <8>
    <7 3> <6 4> <5 4> <3>
    s1
    s2.*3
    <5>4 <6>2
    s4 <7> <6+>
    s2.*3
    <5>4 <6>2
    <6>4 <7> <6+>
    <_+>2 <_+>4
    <_+>2.
    s4 <_+> <6+>
    s2.
    s
    <9>4 <8>2
    <5>4 <6> s
    <4> <3> <6 5>
    <6 5> <4> <3>
    s2.
    s4 <_+>2
    <_+>2.
    s
    s4 <_+>2
    <_+>2.
    <_+>
    s4 <_+>2
    s2.*5
    <6+>4 <_+>2
    s2.
    <7 5>4 <4> <3>
    s2.
    s1.*2
    s2 <7> <_+>
    s1.
    s1 <6+>2
    <9>2 <8> s
    <6> <4 2> s
    s1.
    <6>
    <_+>
    s2 <6+> <_+>
    s1.
    s2 <6> s
    s1.
    <5->1.
    s
    s2 <4> <3>
    s1.
    <5->1.
    s
    s2 <4> <3>
    s1.
    s2 <7> <_+>
    s1 <2>2
    s <4> <3>
    <_+>1.
    s
    s1 <6 5>2
    s <4> <3>
    s1.
    s
    s1 <6 5>2
    s <4> <3>
    s1.
    s1*5
    <5>2 <5>
    s1
    s2 <_+>
    s <_+>
    <4>4 <3> s2
    <5>1
    s
    <_+>2 <5>
    <6>8 <5> s4 s2
    s1
    s
    <5>4 <6> s2
    <_+>1
    <5>2 <9 5>
    <7>4 <6> s2
    <4>4 <3> <5> <6>8 <5>
    <_+>1
    s
    <5>1
    s
    <5 3>2 <4>
    <5 4> <3>
    s1
    s2.*2
    <4 2>2.
    s
    s4 <6+>2
    s2.
    <7+ 5>4 <4> <3>
    <_+>2.
    s
    <_+>
    <4 2>
    <_+>
    s4 <6 +>2
    s2.
    s4 <6>2
    s2.*5
    <2>2.
    s
    s4 <_+>2
    s2.*3
    s4 <_+>2
    s2.
    s4 <_+>2

}

forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 45
    s1*11
    \bar ":..:"\break
    s1*9
    \bar ":..:"\break
    \time 3/4
    \tempo 2. = 70
    s2.*20
    \bar":..:"\break
    s2.*16
    \bar":..:"\break
    \time 3/2
    \tempo 1 = 60
    s1.*34
    \bar ":..:"\break
    \time 4/4
    \tempo 2 = 55
    s1*28
    \bar ":..:"\break
    \time 3/4
    \tempo 2. = 75
    s2.*30
    \bar":|."

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}


IIvc = {
    \IIglobal
    \clef bass
    <<\IIvcn \forma>>

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

    sol'4 sol sol sol,
    la si la2
    do si

    %4
    la sol\mbreak
    sol'4 sol sol4. la16 sol
    fa2 mi

    %7
    re re4. mi16 fa
    re2 do
    r8 sol'16[fa mi re mi fa] sol8 mi la4

    %10
    sol8 la16 sol fa8 mi16 re mi8 fad sol4~\mbreak
    sol8[fad16 mi fad8. sol16] sol8[re16 do si la si do]
    re8 si mi4 re8 mi16 re do8 si16 la

    %13
    si8[do16 si la sol la si] do2~
    do4 do do do
    do si do2

    %16
    mi8 mi re do re re r4
    fa8 fa mi re mi mi la la
    sol fa mi re fa[sol16 fa mi8. re16]

    %19
    re4. fa8~fa fa mi re
    mi4 do4. do8 si la\mbreak
    si4 sol'8 sol fa mi re do

    %22
    mi[fa16 mi re8. do16] do4 sol'8 sol
    fa mi re do mi[fa16 mi re8. do16]
    do1

    %25
    r2 do mi
    sol2. fa8 mi re4 sol
    mi2. re8 do re2

    %28
    R1.
    r2 do mi
    fa2. mi8 re do4 mi

    %31
    re2. mi4 fad sol\mbreak
    la2 re, mi
    sol1 fad2

    %34
    sol1.
    r4 sol, la si do si
    la2 do mi

    %37
    fa2. mi8 re do4 mi
    re1.
    do

    %40
    do4 mi sol8[fa16 mi re8 sol]
    mi2 re
    r16 do si la sol sol' fa mi re2

    %43
    sol,4 si re8[do16 si la8 re]
    si sol' sol sol sol4 fad\mbreak
    sol16 sol, fa mi re re' do si la2

    %46
    si r16 do si la sol sol' fa mi
    re2 do4 mi
    sol8[fa16 mi re8 sol] sol fa fa fa

    %49
    fa4 mi\mbreak re8 sol sol sol
    sol4 fa2 mi4~
    mi re2 do4

    %52
    si2 do4 mi
    sol8[fa16 mi re8 sol] mi16 do si la sol sol' fa mi\mbreak
    re4 fa la8 sol16 fa mi4

    %55
    r8 sol sol sol sol4 fad
    sol sol, si re4~
    re8 [do16 si la8 re] si do do do

    %58
    do4 si\mbreak do mi
    sol8[fa16 mi re8 sol] mi16 do si la sol sol' fa mi
    re sol fa mi re4 do2\fermata

    %61
    r4 r mi8 fa
    sol4 sol la
    sol4. fa8 mi4

    %64
    fa re2
    mi4. fa8 sol4
    fa4. sol8 mi4

    %67
    re4. mi8 do4
    re4. mi8 re4
    re2.~

    %70
    re2 mi8 fa\mbreak
    sol4 sol la
    sol4. fa8 mi4

    %73
    fa re2
    mi4. fa8 sol4
    fa4. sol8 mi4

    %76
    re4. mi8 do re
    mi4 re4. do8
    do2.~

    %79
    do2 sol8 la
    si4 si do
    si2 sol8  la

    %82
    si4 si do
    si2 sol'8 la
    si4 si do

    %85
    si4. do8 la4
    sol4. mi8 fa4
    mi4. fad8 sol la

    %88
    si4 la4. sol8
    sol2 mi8 fa\mbreak
    sol4 sol la

    %91
    sol2 mi8 fa
    sol4 sol la
    sol4. la8 fa4

    %94
    mi4. fa8 sol4
    la re,4. do8
    do4. la'8 fa4

    %97
    mi4. fa8 sol4
    la re,4. do8
    do2. ~

    %100
    do2

}

IIIvlIIn = \relative do'' {

    mi4 re mi mi,
    fad sol fad2
    sol4 la4. sol8 sol4~

    %4
    sol fad sol2\mbreak
    mi'4 re mi2
    do4 re do2

    %7
    do do
    do4 si do2
    r8 mi16[re do si do re] mi8 do fa4

    %10
    mi8[do16 si la sol la si] do8[la re do16 si]\mbreak
    do4 r8 re16 do si la si do re4
    si sol r8 sol'16[fa mi re mi fa]

    %13
    sol8 mi la4 sol8[la16 sol fa8 mi16 re]
    mi8 fa16 sol re4 re re
    re4. mi8 do2\mbreak

    %16
    do8 do si la si si r4
    re8 re dod si dod dod la la
    si dod re2 dod4

    %19
    re r sol2~
    sol4 r re2~\mbreak
    re4 sol,8 sol la si do4~

    %22
    do si do sol8 sol
    la si do2 si4
    do1

    %25
    R1.*2
    r2 sol si
    do2. si8 la sol4 si

    %29
    la2. sol8 fa sol2
    r r sol
    si re2. do8 si\mbreak

    %32
    la4 re si2 do4 si
    la sol la1
    sol4 re' mi fa sol fa

    %35
    mi1.
    r2 r sol,
    si do1~

    %38
    do si2
    do1.
    R1

    %41
    r8 do do do do4 si
    do mi sol8[fa16 mi re8 sol]
    mi sol sol sol sol4 fad

    %44
    sol16 sol, fa mi re re' do si la2\mbreak
    sol4 si re8[do16 si la8 re]
    si16 re mi fa sol sol, la si do4 mi

    %47
    sol8[fa16 mi re8 sol] mi2
    sol,4 si re8[do16 si la8 re]
    si do do do\mbreak do4 si

    %50
    la la' sol2
    fa mi4. la8~
    la sold16 fa sold4 la8 do, do do

    %53
    do4 si r sol\mbreak
    si4 re8 do16 si la4 do
    mi8 re16 do si4 r16 re do si la4

    %56
    sol si re8[do16 si la8 re]
    si16 sol la si do la si do re re, mi fa sol4
    fa2\mbreak mi16 do' si la sol sol' fa mi

    %59
    re2 r8 do do do
    do4 si do2\fermata\mbreak
    r4 r do8 re

    %62
    mi4 mi fa
    mi4. re8 do4
    do si2

    %65
    do re4
    do2 si4
    la2 sol8 la

    %68
    si4 do4. si8
    si2.~
    si2 do8 re\mbreak

    %71
    mi4 mi fa
    mi4. re8 do4
    do si2

    %74
    do re4
    do2 si4
    la2 sol4

    %77
    do do si
    do2.~
    do2 si8 do

    %80
    re4 re mi
    re2 si8 do
    re4 re mi

    %83
    re2 mi8 fa
    sol4 sol la
    re,2 re4~

    %86
    re do si
    do2 re4
    sol sol fad

    %89
    sol2 do,8 re\mbreak
    mi4 mi fa
    mi2 do8 re

    %92
    mi4 mi fa
    mi2 re4
    re2 do4~

    %95
    do do si
    do4. mi8 re4
    do2 do4~

    %98
    do do si
    do2.~
    do2

}

IIIvcn = \relative do {

    do4 si do4. si8
    la4 sol re'2
    mi4 fad sol si,

    %4
    do re sol,2\mbreak
    do4 si do2
    la4 si do si

    %7
    la sol fa mi
    fa sol do2
    r2 r8 do'16[si la sol la si]

    %10
    do8 la re4 do8 re16 do si8 la16 sol\mbreak
    la2 sol4 sol,
    sol8[sol'16 fa mi re mi fa] sol8 mi la4

    %13
    sol8[la16 sol fa8 mi16 re] mi8[do'16 si la sol la si]
    do4 si8. do32 re la8. si32 do mi,8. fa32 sol
    sol,2 do\mbreak

    %16
    r2 sol'8 sol fa mi
    re4 re la'8 la sol fa
    sol la sib4 la la,

    %19
    re8 do si? la si2
    do'8 si la sol fad2\mbreak
    sol8 sol fa? mi fa sol la4

    %22
    sol8 fa sol sol, do4 mi,
    fa8 sol la4 sol8 fa sol4
    do,1\mbreak

    %25
    R1.
    r2 sol'' si
    do2. si8 la sol4 si

    %28
    la2 do, mi
    fa2. mi8 re do4 mi
    re2 do mi

    %31
    sol2. fa8 mi re4 sol\mbreak
    fad2 sol do,
    mi re1

    %34
    sol,2 sol' si
    do do, mi
    fa2. mi8 re do4 mi

    %37
    re2 do mi
    fa sol1
    do,1.\mbreak

    %40 OOKK
    R1
    do4 mi sol8[fa16 mi re8 sol]
    mi do do do do4 si

    %43
    r16 do si la sol sol' fa mi re2
    sol,4 si re8[do16 si la8 re]\mbreak
    si sol' sol sol sol4 fad

    %46
    sol8 fa? mi re do do' do do
    do4 si do do,
    mi sol8 fa16 mi re2

    %49
    sol,\mbreak sol'4 si
    re8[do16 si la8 re] si16 sol la si do do, re mi
    fa la si do re re, mi fa sol  mi fa sol la la, si do

    %52
    re si do re mi4 la,16 fa' mi re do do' si la
    sol2 do,4 mi\mbreak
    sol8 fa16 mi re4 fa la8 sol16 fa

    %55
    mi do si la sol sol' fa mi re2
    r8 sol sol sol sol4 fad
    sol fa?2 mi4

    %58
    re2\mbreak do8 do' do do
    do4 si <do do,>~<do mi,>
    sol2 do,\fermopz

    %61
    r4 r do'
    do do fa,
    do4. re8 mi4

    %64
    re sol2
    do si4
    la2 sol4

    %67
    fa2 mi4
    re do2
    sol'2.~

    %70
    sol2 do4\mbreak
    do do  fa,
    do4. re8 mi4

    %73
    re sol2
    do si4
    la2 sol4

    %76
    fa2 mi4
    do sol2
    do2.~

    %79
    do2 si'8 la
    sol4 sol do,
    sol2 sol'4

    %82
    sol sol do,
    sol2 do4
    si2 la4

    %85
    sol2 fa4
    mi2 re4
    do2 si'4

    %88
    sol re'2
    sol, mi'8 re\mbreak
    do4 do fa,

    %91
    do'2 mi8 re
    do4 do fa,
    do'2 re4

    %94
    mi4. re8 mi4
    fa sol2
    do, re4

    %97
    mi4. re8 mi4
    fa sol2
    do,2.~

    %100
    do2

}

IIIbcn = \relative do {

    do4 si do4. si8
    la4 sol re'2
    mi4 fad sol si,

    %4
    do re sol,2\mbreak
    do4 si do2
    la4 si do si

    %7
    la sol fa mi
    fa sol do2
    do2 do'4 la8. si16

    %10
    do8 la re4 do si\mbreak
    la2 sol~
    sol4 mi8. fa16 sol8 mi la4

    %13
    sol fa mi8[do' la8. si16]
    do4 si la mi
    sol2 do,\mbreak

    %16
    do2 sol'4 fa8 mi
    re2 la'4 sol8 fa
    sol la sib4 la la,

    %19
    re8 do si? la si2
    do'8 si la sol fad2\mbreak
    sol4 fa?8 mi fa sol la4

    %22
    sol8 fa sol sol, do4 mi,
    fa8 sol la4 sol8 fa sol4
    do1\mbreak

    %25
    do'1.
    do,2 sol' si
    do1 sol2

    %28
    la2 do, mi
    fa1 do2
    re2 do mi

    %31
    sol1 re4 sol\mbreak
    fad2 sol do,
    mi re1

    %34
    sol,2 sol' si
    do do, mi
    fa1 do2

    %37
    re2 do mi
    fa sol1
    do,1.\mbreak

    %40 OOKK
    do2 sol
    do4 mi sol re8 sol
    mi do4 do8 do4 si

    %43
    do4 sol re'2
    sol,4 si re la8 re\mbreak
    si sol sol'2 fad4

    %46
    sol8 fa? mi re do4 do'~
    do4 si do do,
    mi sol re2

    %49
    sol,\mbreak sol'4 si
    re la8 re si4 do
    fa, re sol la

    %52
    re, mi la, do
    sol2 do4 mi\mbreak
    sol re fa la

    %55
    mi sol re2
    sol,4 sol'2 fad4
    sol fa?2 mi4

    %58
    re2\mbreak do4 do'~
    do4 si <<do2\\{do,4 mi}>>
    sol2 do,\fermopz

    %61
    r4 r do'
    do2 fa,4
    do4. re8 mi4

    %64
    re sol2
    do si4
    la2 sol4

    %67
    fa2 mi4
    re do2
    sol'2.~

    %70
    sol2 do4\mbreak
    do do  fa,
    do4. re8 mi4

    %73
    re sol2
    do si4
    la2 sol4

    %76
    fa2 mi4
    do sol2
    do2.~

    %79
    do2 si'8 la
    sol2 do,4
    sol2 sol'4

    %82
    sol2 do,4
    sol2 do4
    si2 la4

    %85
    sol2 fa4
    mi2 re4
    do2 si'4

    %88
    sol re'2
    sol, mi'8 re\mbreak
    do2 fa,4

    %91
    do'2 mi8 re
    do2 fa,4
    do'2 re4

    %94
    mi4. re8 mi4
    fa sol2
    do, re4

    %97
    mi4. re8 mi4
    fa sol2
    do,2.~

    %100
    do2

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6+>2 <_+>
    <6 5>4 <5> <9>8 <8> s4
    <6 5>1
    s
    <6>
    <4 3>2 <6 5>
    <6 5>1
    s
    s
    <7>4 s8 <6> s2
    s1
    s
    s2 <4 3>4 <7 6>
    <4>4 s8 <3> s2
    s1
    s2 <_+>
    s <6 4>4 <5 3>
    s2 <6 5>
    s <6 5>
    s1
    <6 4>4 <5 3> s2
    s <6 4>4 <5 3>
    s1
    s1.*8
    s2 <4> <3>
    s1.*4
    <6 5>2 <4> <3>
    s1.
    s2 <4>4 <3>
    s2 <4>4 <6>
    s2 <2>
    s
    <4>4 <3>
    s2 <4>4 <6+>
    s4 <2>2 s4
    s1
    s
    s2 <4 _->4 <3>
    <7 3> <6 4> <5 4>2
    s <6 5>
    <7> <6 5>
    <6 5>4 <_+> s2
    <4>4 <3> s2
    s1
    <6>2 <4>4 <3>
    s1
    s4 <4 2>2 <6>4
    <7> <6> s2
    <2>1
    <4>4 <3> s2
    s2.*4
    s2 <6>4
    <6>2 <6>4
    <6>2 <6>4
    <6>2.
    s2.*4
    <7>4 <4> <3>
    s2 <6>4
    <6>2 <6>4
    <6>2 <6>4
    s4 <4>4 <3>
    s2.*7
    s2 <6>4
    <7> <6> <6>
    s2.
    s4 <4> <3>
    s2.*6
    s4 <4> <3>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 57
    s1*8
    \bar ":..:"%\break
    s1*7
    \bar ":..:"%\break
    s1*9
    \bar ":..:"%\break
    \time 3/2
    \key do\major
    \tempo 1 = 67
    s1.*15
    \bar":..:"\break
    \time 4/4
    \key do\major
    \tempo 2 = 65
    s1*21
    \bar":..:"\break
    \time 3/4
    \tempo 2. = 75
    s2.*18
    s2
    \bar ":..:"\break
    s4
    s2.*20
    s2
    \bar":|."

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}


IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma>>

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
        title = \markup \center-column{"Sinfonia in Do Maggiore W-K13"}
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
                \set Staff.instrumentName = \markup  \center-column{"[Violoncello]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "lt"
                \Ivc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"[Continuo]"}
                \set Staff.midiInstrument = #"contrabass"
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
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \header {
        title = \markup \center-column{"Sinfonia in La Maggiore W-K22"}
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
                \set Staff.instrumentName = \markup  \center-column{"[Violoncello]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "lt"
                \IIvc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"[Continuo]"}
                \set Staff.midiInstrument = #"contrabass"
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
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \header {
        title = \markup \center-column{"Sinfonia in Do Maggiore W-K10"}
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
                \set Staff.instrumentName = \markup  \center-column{"[Violoncello]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "lt"
                \IIIvc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"[Continuo]"}
                \set Staff.midiInstrument = #"contrabass"
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
                %\override SpacingSpanner.uniform-stretching = ##t
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
