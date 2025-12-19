\language "italiano"
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

ten = _\markup \italic \center-align "ten"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

upl =
#(let ((m (make-articulation 'stopped)))
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
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IvlIn = \relative do'' {

    fa2 re2. re4
    do1 fa2
    fa mib mib

    %4
    re1 sol4 fa
    mib2 mi la4 (sol)
    fa2 fad1

    %7
    sol2 r fa!
    mib1 re2
    do do2. do4

    %10
    re1 mi?2
    fa1 mib2
    re1 do2

    %13
    sib (si) do
    sib la2. la4
    sib1 si2

    %16
    mib1 mib2
    re re2. mib?4
    mi!1 fad2

    %19
    sol mib1\mbreak
    re1 re2
    do1 do2

    %22
    re sol fad
    sol mib re\parenthesize ~
    re do4 sib do2

    %25
    re1.   %%% fine del Grave
    sib4. re16 mib fa8 re mib fa
    sib,16 sib' la sol fa mib re do sib do re mi? fa4~

    %28
    fa16 mi fa sol la8. la16 sol8 la sol8. sol16
    la[ la sol fa mi re do sib] la4 r8 do
    re4 r r2

    %31
    r16 re [do sib la sol fa mib?] re4 r8 la'
    sib4 do fa,8 fa' mib4\mbreak
    re do re r

    %34
    r8 sib4 la8 sib4 r
    sib r r16 re'[do sib la sol fa mib]
    re4 r r2

    %37
    r16 re[do sib la sol fa mib] re4 re'
    mi! fa2 mi4
    fa r r2

    %40
    R1
    do4. mi16 fa sol8 mi fa sol
    do,16[do' sib la sol fa mi re] do8 do re mi

    %43
    fa16 mi fa sol la8. sol16 sol8 la sol8. sol16\mbreak
    la4 r la8 fa mib4
    re do sib8 la sol4

    %46
    la8 sib do4 re r
    R1
    r2 fa,4. la16 sib

    %49
    do8 la sib do fa,16[fa' mi re do sib la sol]
    fa8 fa sol la sib16 la sib do re8. re16
    do8 re do8. re16 re4 r

    %52
    r8 sib'16[la sol fa mib re] do8 do fa4~
    fa mi? fa4. fa8
    mi8 fa4 mi8 fa fa mib4

    %55
    re do re r
    R1\mbreak
    r16 re'[do sib la sol fa mib] re4 r

    %58
    re r8 fa do re do8. do16
    re[re' do sib la sol fa mib] re8 do do8. do16
    re4 fa,2 mib4~

    %61
    mib re do8 re16 mi? fa8 sol16 la
    sib4 r8 do la sol16 fa sib4~
    sib8 la16 sol do4 do8 sib16 la sib4~

    %64
    sib8 la16 sol la8 sib16 do re4 re16 fa mib re
    do4~ do16 re mib re do4. do8
    re1

    %67 inizia adagio
    la'4. la8 sol2
    fa8 do fa4~ fa8 mi16 re mi8. mi16
    fa8 la sol8. sol16 la4. la8

    %70
    sol2 la8 si do4
    do si do r
    mi,4. mi8 re2

    %73
    r re4. re8
    mi mi re8. re16 mi4 sol
    fa4. sol8 mi4 fa~

    %76
    fa mi fa r
    sib4. la8 sol fa mib[re]
    do4 reb do4. do8
    re1

    %80 OOKK  inizia vivace
    sib8 re fa
    sib, sib' la\mbreak
    re4 do8

    %83
    sib4 do8
    sib4.
    la

    %86
    R
    fa,8 la do
    fa,4 fa'8

    %89
    mi4 r8
    do mi sol
    do do,\noBeam si

    %92
    do mi sol
    re fa sol
    mib do4

    %95
    re do8~
    do sib? fa'
    fa mi?4

    %98
    fa r8
    fa, la do
    fa, fa' mi

    %101
    la4 sol8
    fa do4~
    do8 si4\mbreak

    %104
    do8 sol'4
    mi re8
    mi4 r8
    r do'16 re do sib

    %108
    la4.
    r8 r do,~
    do sib4

    %111
    r8 re16 mib re do
    sib4.
    r8 r fa'~

    %114
    fa mib sol
    r sol16 la sol fa
    mi4.

    %117
    r8 r sol~
    sol fa4
    r8 fa16 sol la do

    %120
    re4 do8
    sib4 la8
    sol4 fa8

    %123
    mib do do'\noBeam\mbreak
    re4 do8
    sib4 la8

    %126
    sol4 sol8
    la16[(sol)] sol8. fad16
    sib4 la8

    %129
    sol4 fa?8
    mib4 re8
    do do8. do16

    %132
    sib8 re fa
    sib, sib' la
    re,4 r8

    %135
    r fa4~
    fa8 mi?4
    fa sol8

    %138
    la4 la,8
    sib re fa
    re re do

    %141
    re4.

}


IvlIIn = \relative do'' {

    re2 sib2. sib4
    la1 la2
    sib1 do2~

    %4
    do sib re~
    re do mi!
    mi re2. re4

    %7
    sib2 si re~
    re do sib!~
    sib sib2. la4

    %10
    sib1 sib2~
    sib la do~
    do la1~

    %13
    la2 sol sol~
    sol sol2. fad4
    sol2 re'1~

    %16
    re2 do do~
    do do2. si4
    mi2 r do

    %19
    sib1 do2~\mbreak
    do sib1~
    sib2 sib2. la4

    %22
    sib2 re do
    sib1 la2
    sol1.

    %25 OOKK
    fad
    R1*2 %% OOKK inizia vivace
    fa?4. la16 sib do8 la sib do

    %29
    fa,16[fa'  mi re do sib la sol] fa8 fa sol la
    sib16 la sib do re8. re16 do8. re16 do8. do16
    re4 r re8 sib la fa

    %32
    sol4. sol8 la la sib do~\mbreak
    do sib4 la8 sib4 re
    do8 re do8. do16 re[re do sib la sol fa mib]

    %35
    re4 r r16 sib''[la sol fa mib re do]
    sib4 r r2
    r16 sib[do re mib fa sol la] \parenthesize sib8. [la16 sol fa mib re]

    %38
    do4. do8 sib4 r8 sol
    fa4. la16 sib do8 la sib do
    fa,16[fa' mi? re do sib la sol] fa8 sol la si

    %41
    do16 si do re mi8. mi16 re8[mi re8. re16]
    mi8.[do'16 si la sol fa] mi4 r8 sol
    la4 r r2\mbreak

    %44
    r16 la[sol fa mi re do sib] la8 la sib do~
    do sib4 la8 [sol] fa4 mi8
    fa sib4 la8 sib4. re16 mib

    %47
    fa8 re mib[fa] sib,16[sib' la sol fa mib? re do]
    sib8 do re mi? fa16 mi fa sol la8. la16
    sol8 la sol8. sol16 la[la sol fa mi re do sib]

    %50
    la4 r8 do re4 r
    r2 r16 re[do sib la sol fa mib]
    re4 r mi!4 r8 fa

    %53
    sib2 la8 fa do'4~
    do8 do sib[sol] la la sib do~
    do4 sib8 la sib do re4
    do8 re do8. do16 re4 r\mbreak

    %57
    r16 sib'[la sol fa mib re do] sib4 r
    sib16 fa sol la sib4 la8 sib4 la8
    sib4 r sib8 sib sib8. la16

    %60
    sib4 r8 fa sol2
    fa4. sol8 mi! re16 do la'4~
    la sol16 fa mib re do4 re

    %63
    do la'8 sib16 do re4~re16 fa mib re
    do8 fa, do'4~do8 sib16 la sib4~
    sib8 sib16 do sib2 la4

    %66
    sib1
    fa'4. fa8 mi2 %% comincia adagio OOKK
    r2 sol4. sol8

    %69
    la fa fa8. mi16 fa4 re8 do
    sib4 do2 sol'4
    fa4. fa8 mi4 r

    %72
    do4. do8 si2
    do8 do, do'4~do16 si la8 si8. si16
    do8 do do8. si16 do4. mi8

    %75
    re4. re8 do2
    sib? la4 la'8 sol
    fa4 r r do8 sib

    %78
    la4 sib2 la4
    sib1
    R4. %% inizia vivace

    %81
    sib8 re fa\mbreak
    sib, sib'\noBeam la
    re re,[fa]~

    %84
    fa mi4
    fa sol8
    fa4 sol8

    %87
    la do,4~
    do8 si4
    do8 mi sol

    %90
    do do,\noBeam si
    mi4 r8
    mi4 mi8

    %93
    fa re4
    do8 mib fa
    re sib la

    %96
    re4 do8
    sib4.
    do4 r8

    %99
    R4.
    fa,8 la do
    fa, fa' mi

    %102
    la4 sol8
    fa4 fa8\mbreak
    mi4 re8

    %105
    do sol\noBeam re'~
    re do4
    r8 r sol'~

    %108
    sol fa4
    r8 fa16 sol fa mib
    re4.

    %111
    r8 r la~
    la sol4
    r8 sib'16 do sib la

    %114
    sol4.
    r8 r re~
    re do4

    %117
    r8 do'16 re do sib
    do4.
    r8 r do

    %120
    do sib la
    la sol fa~
    fa mib re

    %123
    do do'4~\mbreak
    do8 sib la~
    la sol fa~

    %126
    fa mib re
    do16(sib) la8\noBeam la'~
    la sol fa~

    %129
    fa mib re~
    re do sib
    sib sib8. la16

    %132
    sib4 r8
    sib re fa
    sib, sib' la

    %135
    re,4 r8
    re4 r8
    fa, la do

    %138
    fa, fa' mib?
    fa re do
    sib sib\noBeam la

    %141
    sib4.

}


IvlaIn = \relative do' {

    fa2 fa2. fa4
    fa2 la1
    sol do,2

    %4
    re re1
    mib2 sol mi
    fa la2. la4

    %7
    sol2 si1
    sol2 sib?1
    sol2 fa2. fa4

    %10
    fa1 sol2
    do,1 do2
    re1.

    %13
    re1 mib2
    re la2. la4
    sol1 r2

    %16
    sol'1 la2
    re, sol2. sol4
    sol1 la2

    %19
    sib1 la2\mbreak
    fa1 fa2
    sol fa2. fa4

    %22
    fa2 re la'
    sib sib, re
    sol1.

    %25
    re
    R1*2 %% inzia il vivace OOKK
    la'4 r8 fa mi fa4 mi8

    %29
    fa4 r fa8 re do4
    sib fa' fa r8 fa
    fa4 r fa8.[sol16 la8 la]

    %32
    sol4. sol8 fa4 r\mbreak
    fa do sib4. re16 mib
    fa8 re mib fa sib,16 [sib' la sol fa mib re do]

    %35
    sib sib do re mib? fa sol la sib4 r
    fa8 sol16 la sib4 la8 sib4 la8
    sib4 r sib r

    %38
    sol fa sol2
    la4 r8 fa mi? fa4 mi8
    fa4 r fa8 mi re4

    %41
    do r r2
    R1
    r4 fa mi8 fa4 mi8\mbreak

    %44
    fa4 r fa r
    fa r8 fa sol la do4
    la8 fa sol[fa] fa4 r

    %47
    R1
    r2 la4 r8 fa
    mi fa4 mi8 fa4 r

    %50
    fa8 re do4 sib16 fa' sol la sib8 fa
    fa4 r8 fa fa4 r
    fa sib16 la sol fa mi!4 la

    %53
    sib sol fa8 la16 sol fa4
    do r8 sol' fa4 r
    fa r fa r8 fa

    %56
    fa8 fa sol fa fa16[sib, do re mib? fa sol la]\mbreak
    sib4 r r16 sib, do re mib fa sol la
    sib4 r8 fa fa fa sol[fa]

    %59
    fa4 r fa8 sol fa8. fa16
    fa4 r8 sib sol2
    la4 fa8 re sol4 fa

    %62
    re mib8 do fa4. fa8
    fa4 r r2
    R1

    %65
    mib4 sol fa2
    fa1\mbreak
    do4. do8 do2  %% inizia adagio

    %68
    r do
    do do4 r8 la
    re4 do2 mi!4

    %71
    fa2 sol4 r
    sol4. sol8 sol2
    r sol

    %74
    sol sol4 mi
    la re, sol fa
    sol2 fa4 r

    %77
    fa4. fa8 sol4. sol8
    la4 sol do, fa
    fa1

    %80 OO KK inizia vivace
    R4.*2
    sib,8 re fa
    sib4 la8

    %84
    sol4.
    fa8 do mi
    la4 sol8

    %87
    fa4 sol8
    fa4.
    do4 re8

    %90
    mi4 re8
    mi sol fa
    mi sol4

    %93
    fa8 sib4
    mib,8 la sib
    fa4 fa8

    %96
    fa4 la8
    sib4 sib8
    la4 sol8

    %99
    la4 r8
    R4.*4\mbreak
    do,8 mi? sol

    %105
    mi sol4
    sol8 sol4~
    sol8 fa mi

    %108
    r la16 sol fa mib
    re4 r8
    r fa8. fad16\noBeam

    %111
    sol4 fad8
    r sib16 la sol fa?
    sol4 r8

    %114
    sib sol4
    sol8 sol si
    r mi,!16 re do sib

    %117
    la4 r8
    r la'16 sol fa mib
    re4 r8

    %120
    fa4 fa8
    sib4 fa8
    sol4 re8

    %123
    sol fa fa\mbreak
    fa4 fa8
    sib4 fa8

    %126
    sol4 re8
    mi re4
    sib8 sib' fa

    %129
    sol4 re8
    sol mib fa
    sol fa8. fa16

    %132
    fa4 r8
    R4.*2
    sib,8 re fa

    %136
    sib4 sib8
    la4 sol8
    fa4.

    %139
    r8 fa fa
    fa fa fa
    fa4.

}

IvlaIIn = \relative do' {

    sib2 re sib
    do1 do2
    sib2 r la

    %4
    fa sol1~
    sol2 r la~
    la la re~

    %7
    re re1
    sol,2 mib' fa
    mib do2. do4

    %10
    sib2 r sib
    fa' do1
    la1.

    %13
    re2 si sol
    re'1 re2~
    re sib sol~

    %16
    sol do1
    r2 sol re'~
    re do1

    %19
    re2 mib do\mbreak
    re1 sib2
    mib4 re do2. do4

    %22
    sib1 r2
    re mib fa
    sol sol,1

    %25
    la1.
    sib4 r8 sib la sib4 la8
    sib4 r sib8 la sol4

    %28
    fa r r2
    R1
    r8 sib4 la8 sib la sib4

    %31
    sib r sib r
    sib sol8 do la4 r\mbreak
    fa' sol8 fa fa4 r

    %34
    R1
    r16 re[do sib la sol fa mib] re4 r
    re re' do8 re do8. do16

    %37
    re4 r re r8 sib
    do4 r8 fa sib,2
    la4 r r2

    %40
    R1
    r4 do si8 do4 si8
    do4 r do8 la sol4

    %43
    fa r8 do'16 re mi8 do re do\mbreak
    do4 r do r
    re r mi8 fa sol[do,]

    %46
    do re do8. do16 sib4 r8 sib
    la sib4 la8 sib4 r
    sib8 la sol4 fa r

    %49
    R1
    r2 r4 sib
    la8 sib4 la8 sib4 r

    %52
    re4. sib8 do4. do8
    sib4 do do4. do16 re
    mi8 do fa[do] do4 r

    %55
    re fa re r8 sib
    la sib4 la8 sib16[re do sib la sol fa mib]\mbreak
    re4 r8 fa fa16[re' do sib la sol fa mib]

    %58
    re4 re' la8 fa do'8. do16
    sib4 r re8 mib do8. do16
    sib4 sib2 do4~

    %61
    do re mi! do
    sib r8 sol la4 fa8 sib
    fa4 r r2

    %64
    R1
    sol2 do
    sib1

    %67  OOKK adagio
    la4. la8 do2
    do r
    la4 do8 sol fa4 la

    %70
    sib sol fa sol
    re'2 do4 r
    mi,4. mi8 sol2

    %73
    sol r
    sol8 do re4 do8 re mi do
    re4. re8 mi4 do

    %76
    sib do do8 sib la4
    sib re sib8 la sol4
    do r do4. do8

    %79
    sib1
    R4.*5%OOKK inizia vivace
    fa8 la do

    %86
    fa, fa' mi
    fa4 do8
    re4.

    %89
    mi4 re8
    do4 r8
    R4.

    %92
    sol8 do[mi]
    re4 re8
    r do do

    %95
    sib sib do
    re fa do
    sol4.

    %98
    la8 do[mi]
    fa4 r8
    R4.

    %101
    fa,8 la do
    fa, fa'[mi]
    re4.\mbreak

    %104
    do4 si8
    do4 si8
    mi mi16 re do sib?

    %107
    la4 r8
    r do4~
    do8 sib la

    %110
    re8. mib16 re do
    sib4 r8
    re sib4~

    %113
    sib8 sib re
    r8 sol16 fa mib re
    mib4 r8

    %116
    r sol,4~
    sol8 fa mi
    r do'4~

    %119
    do8 sib la
    r fa' fa
    re4 re8

    %122
    r sib4
    sib8 sib8. la16\mbreak
    re4 fa8

    %125
    re4 re8
    r sib sib
    la re4

    %128
    re re8
    r sib sib\noBeam
    sol4 re'8

    %131
    sol, do8.[do16]
    re4 r8
    R4.

    %134
    re8 fa do
    re4 do8
    sib4.

    %137
    do4 do8
    do do4
    re8 fa4

    %140
    sib,8 fa' do
    sib4.

}

Ivcn = \relative do {

    sib1.
    fa'1 fa,2
    sol1 la2

    %4
    sib1 si2
    do do dod
    re re1

    %7
    sol2 re si
    do1 re2
    mib fa fa,

    %10
    sib1 sol2
    fa1 do'2
    fad,1.

    %13
    sol2 sol do
    re1.
    sol,1 sol2

    %16
    do1 fad2
    sol1 sol,2
    do do la

    %19
    sol1 la2\mbreak
    sib1 re2
    mib fa fa,

    %22
    sib1 la2
    sol sol' fa
    mib1.

    %25
    re
    R1*4 %% inizia il vivace
    sib4. re16 mib fa8 re mib fa

    %31
    sib,16 sib' la sol fa mib re do sib do re mi? fa4~
    fa mi fa8 fa sol la\mbreak
    sib16 do re sib mib, do fa fa, sib4 r

    %34
    R1
    r16 sib' [la sol fa mib re do] sib sib do re mib fa sol la
    sib4 sib,8 re16 mib fa8 re mib fa

    %37
    sib,16 [sib' la sol fa mib re do] sib4 sib'~
    sib la sol8 la16 sib do8 do,
    fa4 r r2

    %40
    R1*3
    fa4. la16 sib do8 la sib do\mbreak
    fa,16 fa mi re do sib la sol fa8 fa' sol la

    %45
    sib4 fa do8 fa do'[do,]
    fa re mib fa sib,4 r
    R1*3

    %50
    r2 sib4. re16 mib
    fa8 re mib fa sib,16 [sib' la sol fa mib re do]
    sib4 sib'2 la4

    %53
    sol do, fa4. la16 sib
    do8 la sib do fa, fa sol la
    sib4 fa sib,4. re16 mib

    %56
    fa8 re mib fa sib,16 [sib' la sol fa mib re do]\mbreak
    sib [sib do re mib fa sol la] sib4 r
    sib,4. re16 mib fa8 re mib fa

    %59
    sib,16 [sib' la sol fa mib re do] sib8  mib fa[fa,]
    sib4 re mib2
    lad8 sol16 fa sib2 la?8 sol16 fa

    %62
    sol8 la16 sib mib,2 re8. mib16
    fa1~
    fa

    %65
    mib4 mi fa2
    sib,1
    fa'8.[sol16 la8 fa] do'2 %%% inizia adagio OOKK

    %68
    fa,8.[sol16 la8 fa] do'8 sib la sol
    fa fa do'[do,] fa4 fa~
    fa mi fa mi

    %71
    re8 mi16 fa sol8 sol, do4 r
    do8 re mi do sol'2
    do,8.[re16 mi8 do] sol' fa mi re

    %74
    do8[do'] sol sol, do4 do'~
    do sib2 la4
    sol do, fa4. mib8

    %77
    re4. re8 mib4. mib8
    fa4 mi! fa2
    sib,1

    %80
    R4.*6  %% finale
    fa8 la do
    fa, fa' mi
    re4.

    %89
    do8 do'[si]
    do4 r8
    do, mi sol

    %92
    do, do'4~
    do8 sib4~
    sib8 la [la,]

    %95
    sib re fa
    sib, sib' la
    sol4 sol8

    %98
    fa la do
    fa,4 r8
    R4.*5

    %105
    do8 mi sol
    do,8 do16 sib la sol

    %107
    fa8 la do
    fa, fa'16 mib re do
    sib8 re fa

    %110
    sib,8 sib'16 do sib la
    sol8 sib re
    sol,8 sol16  fa mib re

    %113
    mib8 sol sib
    mib,8 mib16  re do si
    do8 mib sol

    %116
    do, do'16 sib la sol
    fa8 la do
    fa,8 fa16 mib re do

    %119
    sib8 re fa
    \clef tenor \key fa\major sib16 sib re sib fa' fa,
    r sib fa' sib, la' fa,

    %122
    r sib re sib fa' fa,\noBeam
    r8 do' do\mbreak
    r16 sib re sib fa'[fa,]

    %125
    \clef bass \key fa\major r16 sol sib sol re'[re,]
    r mib? sol mib sib8\noBeam
    do re4

    %128
    r16 sol sib sol re' re,
    r mib? sol mib sib' sib,
    r do mib? do re8

    %131
    mib fa fa,
    sib4 r8
    R4.

    %134
    sib8 re fa
    sib, sib' la
    sol4.

    %137
    fa4 mi?8
    fa fa16 mib re do
    sib4 la8

    %140
    sib re fa
    sib,4.

}

Ibcn = \relative do {

    sib1.
    fa'1 fa,2
    sol1 la2

    %4
    sib1 si2
    do do dod
    re re1

    %7
    sol2 re si
    do1 re2
    mib fa fa,

    %10
    sib1 sol2
    fa1 do'2
    fad,1.

    %13
    sol2 sol do
    re1.
    sol,1 sol2

    %16
    do1 fad2
    sol1 sol,2
    do do la

    %19
    sol1 la2\mbreak
    sib1 re2
    mib fa fa,

    %22
    sib1 la2
    sol sol' fa
    mib1.

    %25
    re
    \clef tenor \key fa\major sib'4 r8 sib la\noBeam sib4 la8
    sib4 r sib8 la sol4

    %28
    fa r8 fa' mi fa4 mi8
    fa4 r fa8 re do4
    \clef bass \key fa\major  sib,4. re16 mib fa8 re mib fa

    %31
    sib,16 sib' la sol fa mib re do sib4 fa'~
    fa mi? fa8 fa sol la\mbreak
    sib4 mib,8 fa sib,4 \clef alto \key fa\major sib'8 re16 mib

    %34
    fa8 re mib fa sib,16 sib' la sol fa mib re do
    \clef bass \key fa\major  sib16 sib la sol fa mib re do sib4 r
    sib4. re16 mib fa8 re mib fa

    %37
    sib,4 r sib sib'~
    sib la sol do,
    fa \clef tenor \key fa\major r8 fa' mi? fa4 mi8

    %40
    fa4 r fa8 mi re4
    do do si8 do4 si8
    do4 r do8 la sol4

    %43
    \clef bass \key fa\major  fa4. la16 sib do8 la sib do\mbreak
    fa,16 fa mi re do sib la sol fa8 fa' sol la
    sib4 fa do8 fa do4

    %46
    fa8 re mib fa sib,4 sib'
    la8 sib4 la8 sib4 r
    \clef tenor \key fa\major sib8 la sol4 fa r8 fa'

    %49
    mi8 fa4 mi8 fa4 r
    fa8 re do4 \clef bass \key fa\major sib,4. re16 mib
    fa8 re mib fa sib,4 r

    %52
    sib sib'2 la4
    sol do, fa4. la16 sib
    do8 la sib do fa, fa sol la

    %55
    sib4 fa sib,4. re16 mib
    fa8 re mib? fa sib,4 r\mbreak
    sib4 r sib r

    %58
    sib4. re16 mib fa8 re mib fa
    sib,4 r sib8 mib fa[fa,]
    sib4 re mib2

    %61
    lad8 fa sib2 la?8 fa
    sol la16 sib mib,2 re8. mib16
    fa1~

    %64
    fa
    mib4 mi fa2
    sib,1

    %67 %% OOKK adagio
    fa'4. fa8 do2
    fa8.[sol16 la8 fa] do' sib la sol
    fa4 do fa fa~

    %70
    fa mi fa mi
    re4 sol, do r
    do4. do8 sol2

    %73
    do8.[re16 mi8 do] sol' fa mi re
    do4 sol do do'~
    do sib2 la4

    %76
    sol do, fa4. mib8
    re4. re8 mib4. mib8
    fa4 mi! fa2

    %79
    sib,1
    \clef alto \key fa\major R4.*2 %%% Inizia vivace finale OOKK
    sib'8 re fa

    %83
    sib4 la8
    sol4.
    \clef tenor \key fa\major fa,8 la do

    %86
    \clef bass \key fa\major fa,,8 la do
    fa, fa' mi
    re4.

    %89
    do4 si8
    do4 r8
    do mi sol

    %92
    do, do'4~
    do8 sib4~
    sib8 la[la,]

    %95
    sib re fa
    sib, sib' la
    sol4 sol8

    %98
    fa la do
    fa,4 r8
    R4.

    %101
    \clef tenor  \key fa\major fa8 la do
    fa, fa' mi
    re4.\mbreak

    %104
    do4 si8
    \clef bass \key fa\major do, mi sol
    do,8. sib16 la sol

    %107
    fa8 la do
    fa, fa'16 mib re do
    sib8 re fa

    %110
    sib,8. do16 sib la
    sol8 sib re
    sol8. fa16 mib re

    %113
    mib8 sol sib
    mib,8. re16 do si
    do8 mib sol

    %116
    do, do'16 sib la sol
    fa8 la do
    fa,8. mib16 re do

    %119
    sib8 re fa
    sib,4 fa'8
    sol4 re8

    %122
    mib4 sib8
    mib fa fa\mbreak
    sib,4 fa'8

    %125
    sol4 re8
    mib4 sib8
    do re4

    %128
    sol re8
    mib4 re8
    do4 re8

    %131
    mib fa fa,
    sib4 r8
    R4.

    %134
    sib8 re fa
    sib, sib' la
    sol4.

    %137
    fa4 mi?8
    fa fa16 mib re do
    sib4 la8

    %140
    sib re fa
    sib,4.

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*2
    <7>2 <6-> <5->
    <9> <8> <6>
    <9 _-> <_!> <6>
    <9 _-> <8> s
    <_-> <6+> <5->
    <9> <8> <6->
    <6 5> <5 4> <3>
    s1.
    <4>2 <3> <_->
    <6 5->1.
    <9 _->2 <8 _!> <_->
    <6- 4> <5 4> <3+>
    <_-> s <_+>
    <9-> <8> <7- 5->
    <4> <3> <_+>
    <9> <8> <6+>
    <5> <6-> <5->
    <9> <8> s
    <6 5> <5 4> <3>
    <5> <6> <6+>
    <_-> <6-> <6>
    <7> <6> s
    <_+>1.  %%% fine del Grave
    s1
    s2 s8 <6> <5> <6>
    s1
    s2 s8 <6> <5> <6>
    s2 s4 <5>
    s1
    <4 2>2 s4 <6->
    s1*3
    s2 s8 <6> <6 5> s
    s1
    <2>4 <6> <7> <7>
    s1
    s2 s8 <6> <5> <6+>
    s2 <6>8  s <4 2> s
    s2 s8 <6> <5> <6>
    s1
    s2 s4 <6->8 <5->
    <9> <8> <4> <3> s4 <4>8 <3>
    s <6> s <5> s2
    <6>8 s <4 2> s s2
    s8 <6> <5> <6> s2
    s1
    s8 <6> <5> <6> s2
    s8 <6> <5> s s2
    s2 <2>4 <6>
    <7> <7> s2
    s s4 <6->8 <5->
    <9> <8> <4> <3> s2
    s1*3
    s2 s8 <6 5> s4
    s <6> <9 5> <8 6>
    s2 <4 2>
    <9 8>4 <5>8 <6> <4 2>4 <6>
    <4> <3> <6 5> <6 4>
    <4> <3> <6 5> <6 4>
    <6 5> <6 5-> <4> <3>
    s1  %%% fine del vivace
    s1
    s2 <4 5>8 <2> s4
    s <4>8 <3> s2
    s8 <4 2> s4 s2
    <7>4 <7 _+> s2
    s <_+>
    s < 4 5>
    s4 <4>8 <3> s2
    <2>4 s2 <6>4
    <7> <7> s2
    <6>4. <5>8 <6>2
    s4 <7- 5-> <4> <3>
    s1 %%% dell'adagio
    s4.*5
    s8 <6>4
    s4.
    s4 <6>8
    <7>8 <6+>4
    s <6>8
    s4.
    s4 <7 _+>8
    s4.
    <2>8 <7> <6>
    s4.*2
    <9>8 <8> s
    <7>4 <6>8
    s8 <6>4
    s4.*3
    s4 <6>8
    <7> <6+>4
    s4.*3
    <9>8 <6> s
    <9> <8> s
    <9> <6> s
    s4.
    s8 <6>4
    <9>8 <8> s
    s4.
    <9>8 <8> s
    s <6> <_+>
    <_!>4.
    <9>
    <9>8 <8> s
    <9> <6> s
    <9>8 <8> s
    <9>8 <8> s
    <9>8 <8> s
    <6 5>4.
    <9>8 <8> s
    <9>8 <8> s
    <9>8 <8> s
    <_!>8 <_+> s
    <9>8 <8> s
    <9>8 <8> s
    <9>8 <8> s
    <6 5>4.
    s
    s
    s8 <6>4
    s4 <6>8
    <7>8 <6>  s
    s4 <6>8
    s4.*2
    s8 <6> s

}


forma = {

    \time 3/2
    \key fa\major
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup\huge "Grave"
    \tempo 1 = 30
    s1.*25
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "Vivace"
    \time 4/4
    \tempo 2 = 60
    s1*41
    \bar "||"\break
    %\override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup\huge "Adagio"
    \time 4/4
    \tempo 4 = 50
    s1*13
    \bar "||"\break
    %\override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup\huge "Vivace"
    \time 3/8
    \tempo 4. = 75
    s4.*62
    \bar "|."

}


IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}


IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}


IvlaI = {
    \Iglobal
    \clef alto
    <<\IvlaIn \forma>>

}

IvlaII = {
    \Iglobal
    \clef tenor
    <<\IvlaIIn \forma>>

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

    la'2. la4
    sold1
    mi2. mi4

    %4
    re2 mi
    do si4. si8
    sol4. sol'8 fad2

    %7
    mi4 r la4. sol8
    sol4 fad sold la~
    la sold la8 si dod si

    %10
    la2 sold4 r
    mi r r2
    fad4 r8 si sold4 la\mbreak

    %13
    sold la2 sold4
    la1  %%% fine adagio OOKK
    r4 la2 sold4

    %16
    la r r2
    r4 mi8 fa16 mi re4. mi16 re
    do4 r r2

    %19
    r4 mi2 red4
    mi r r2
    r8 la16 sol fa mi re do re8 re16 do si re do si

    %22
    do8. mi16 re mi do re mi4 r
    R1\mbreak
    r4 mi2 red4

    %25
    mi8 si'16 la sol8 la16 sol fad4. fad8
    sol4 r r2
    r4 si,2 lad4

    %28
    si8 si' si do16 si la8 la la si16 la
    sol4 r r2
    R1

    %31
    r4 mi2 red4
    mi8 sol16 fa mi re do si la8 la la si16 la
    sol8. si16 la si sol la si4 r\mbreak

    %34
    R1
    r8 fad'8 fad fad16 mi re4 red8 mi16 fad
    mi4 r r2

    %37
    r8 mi re mi16 re do8. re16 mi4
    fa fad sold la~
    la sold la la,

    %40
    si2 la8 do si do16 si
    la8 la la si16 la sol4 r
    r2 r8 mi' mi fa16 mi

    %43
    re8 re re mi16 re do4  r\mbreak
    r2 r4 mi~
    mi red mi8 si' si do16 si

    %46
    la8 la la si16 la sold4 r
    r2 r4 la~
    la sold la r

    %49
    r2 r8 do si do16 si
    la8 la la si16 la sold4 la~
    la sold la r

    %52
    r si2 la4
    sold la2 sold4
    la1

    %55 %% Grave OOKK
    sol4 sol fad
    sol mi do'
    do r si

    %58
    si r la
    la sol fad
    sol fad4. fad8

    %61
    sol4 sold2
    la4 r r
    do, dod2

    %64
    re4 r r
    fa fad2
    sol4 r r

    %67
    si sib2
    la4 la2
    sib?4 re2

    %70
    dod?4 dod2
    sib4 sib2\mbreak
    la2.

    %73
    R
    mi
    do4 do2

    %76
    si2.
    R
    dod2 dod4

    %79
    re red2
    mi4 fad2
    sol2 sol4

    %82
    fad sol fad
    sol fad4. fad8
    sold2.

    %85 %% Vivace
    la4 mi8 la do16 si la8
    sold4 la8 sold4.
    la8 la, sold la8. si16 do re\mbreak

    %88
    mi4 do8 si4 si8
    do mi mi do4.
    R2.*2

    %92
    mi4 la,8 mi' fa16 mi re8
    do4 si8 do mi16 re do8
    si4 do8 si4 si8

    %95
    do mi mi do mi16 re do8
    si4 do8 r4.
    la'4 mi8 sold4 la8~

    %98
    la la8. sold16 la4 mi8
    fa4 sol8 mi4 fa8
    re4 mi8 do4 do8

    %101
    si4 si8 do4 mi8~
    mi re4 mi r8
    r4. si4 mi,8\mbreak

    %104
    si'8 do16 si la8 sol4 fad8
    sol si16 la sol8 fad4 sol8
    si4. si

    %107
    R2.
    R
    r4. la'4 mi8

    %110
    la do16 si la8 sold4 la8
    sold4. la4 sold8
    la4. r

    %113
    r mi8 fa16(mi) mi8
    re mi16(re) re8 re mi16(re) re8
    do4. si

    %116
    do re\mbreak
    mi sold,8 si16 la sold8
    la do16(si) la8 si do16(si) la8

    %119
    sold4. sold8 si16(la) sold8
    la do16(si) la8 si do16 si la8
    sold si do si4 si8

    %122
    dod2.

}


IIvlIIn = \relative do'' {

    mi2. mi4
    mi1
    mi2. do4

    %4
    si re2 si4~
    si la2 fad'4~
    fad mi2 red4

    %7
    mi r r mi~
    mi re2 do4
    si4. si8 [do re] mi4~

    %10
    mi re2 do4
    si2 la4 mi'~
    mi re2 do4\mbreak

    %13
    si do si2
    dod1
    R1 %% allegro

    %16
    r4 mi~ mi red
    mi r r2
    r4 mi8 fa16 mi re4. mi16 re

    %19
    do4 r r2
    r4 la'2 sold4
    la la16 sol? fa mi re8 fa mi8. re16

    %22
    do4 r r8 mi16 re do si la sold?
    la8 la16 sold? fad? la sold fad sold8. si16 la si sold la\mbreak
    si4 r r2

    %25
    r4 mi2 red4
    mi8 si' si do16 si la4. si16 la
    sol4 r r2

    %28
    R1
    r4 mi2 red4
    mi8 sol fad sol16 fad mi8 mi mi fad16 mi

    %31
    red8 mi16 fad sol8 la16 sol fad4. fad8
    sol mi16 re do si la sol fad8 fad fad sol16 fad
    mi8 mi mi8. fa?16 red4 r\mbreak

    %34
    R1
    r8 dod' dod re16 dod si4 si8 fad
    sol4 r r8 si si si

    %37
    do do si do16 si la8 la mi'4~
    mi re2 do4
    si4. si8 do4 r

    %40
    r2 r4 mi~
    mi red mi8 do do red16 do
    si8 si si si do4 r

    %43
    r2 r4 la'~\mbreak
    la sold la r
    r2 r8 sol sol la16 sol

    %46
    fad8 fad fad sol16 fad mi4 r
    r2 r8 mi mi fa?16 mi
    re8 re re mi16 re do4 r

    %49
    r2 r8 la' sol la16 sol
    fad8 fad fad sol16 fad mi4 do
    si2 do8 mi mi fa?16 mi

    %52
    re8 re re mi16 re do4 re8 do
    si4 do si2
    dod1

    %55 Grave
    mi4 mi red
    mi2 mi4
    fad r fad

    %58
    mi r mi
    red mi red
    mi mi4. red8

    %61
    mi4 r r
    mi re? mi
    do r r

    %64
    la' sol la
    fa r r
    re do re

    %67
    si sol'2~
    sol4 sol4. fad8
    sol2 sib4~

    %70
    sib r la
    la sol2\mbreak
    sol4 mi2

    %73
    fa2.
    mi
    r4 mi mi

    %76
    fad2.
    sol
    fad

    %79
    R
    sol4 r fad~
    fad mi mi

    %82
    red mi red
    mi mi4. red8
    mi2.

    %85 inizia il 6/8
    R2.
    mi4 la,8 mi' fa16 mi re8
    do4 si8 do mi16 re do8\mbreak

    %88
    si4 do8 mi4 mi8
    mi4 r8 r4.
    R2.

    %91
    la4 mi8 la do16 si la8
    sold4 la8 sold4.
    la8 la, sold la si16 do re8

    %94
    mi4 do8 si4 si8
    la4 sold8 la4 mi'8
    mi4 do8 si4.

    %97
    do8. mi16 re do si4 do8
    si4 si8 la mi'4~
    mi8 re4 re8 do4~

    %100
    do8 si4 si8 la4~
    la sold8 la do si
    la4 la8 sold mi' si

    %103
    mi8. sol16 fad mi red4 mi8\mbreak
    red4. mi8 mi, red
    mi8. fad16 sol la si4 sol8

    %106
    fad4 fad8 sol si si
    sol8. la16 si8 si4 sol'8
    fad4 fad8 mi8. re16 do8

    %109
    si4 si8 do4 r8
    r4. mi4 la,8
    mi' fa16 mi re8 do4 r8

    %112
    r4. mi4 la,8
    mi' fa16(mi) re8 do4.~
    do si~

    %115
    si8 la4 sold4.
    la si4 r8\mbreak
    si4. mi,8 sold16 fa mi8

    %118
    fad la16 sold fad8 sold la16 sold fad8
    mi4. mi8 sold16 fa? mi8
    fad la16 sol? fad8 sold! la16 sold fad8

    %121
    mi sold la la4 sold8
    la2.

}


IIvlIIIn = \relative do'' {

    do2. do4
    si1
    do2. do4

    %4
    re2 si
    do r
    r4 mi fad2

    %7
    sol4 fad mi r
    r2 r4 mi
    mi r8 mi [do si] la4

    %10
    r la si la~
    la sold la r
    la si2 la4\mbreak

    %13
    si la si2
    la1
    la2 si %% inizia allegro

    %16
    la8 do si do16 si la4. si16 la
    sold4 do re si
    do r r2

    %19
    r4 si'8 do16 si la4. si16 la
    sold4 r r2
    r4 la, si2

    %22
    la4 la8. la16 sold4 mi'16 re do si
    la8. do16 si8. la16 sold4 r\mbreak
    r8 sol'?16 fa mi red? do si la4. la8

    %25
    sol4 r r2
    r4 mi'2 red4
    mi8 sol fad sol16 fad mi8 mi mi fad16 mi

    %28
    red4 r r2
    r4 mi, fad2
    mi8 mi' re mi16 re dod8 dod dod re16 dod

    %31
    si4 r r2
    r4 mi fad2
    sol4 r r8 red16 do si la sol fad\mbreak

    %34
    mi8 mi' mi fad16 mi re8. fad16 mi fad re mi
    fad4 r r2
    r8 si la si16 la sold4. sold8

    %37
    la4 r r la,
    la r8 la sold4 r8 mi
    mi4 mi' do la'~

    %40
    la sold la r
    r2 r8 mi mi fad?16 mi
    r8 re re mi16 re do4 r

    %43
    r2 r4 la\mbreak
    si2 si8 do si do16 si
    la8 la la si16 la sol4 r

    %46
    r2 r8 mi' mi fad16 mi
    re8 re re mi16 re do4 r
    r2 r4 la'~

    %49
    la sold la r
    r2 r4 la,
    si4. si8 la do do re16 do

    %52
    si8 si si do16 si mi,8 mi' do la
    si4 la si2
    la1

    %55
    si4 mi fad
    mi sol la
    fad r re

    %58
    mi r dod
    red r fad
    mi fad4. fad8

    %61
    mi4 r r
    do? si2
    la4 r r

    %64
    fa' mi2
    re4 r r
    re la2

    %67
    si4 r mi
    la,2.
    sol4 si re

    %70
    mid2 la,4
    sib? re2\mbreak
    mi4 r mi~

    %73
    mi re2~
    re4 si2~
    si4 la la

    %76
    la fad fad'~
    fad? mi2
    mi4 dod2

    %79
    si4 fad2
    mi4 r r
    r si' si

    %82
    red r fad
    mi fad4. fad8
    mi2.

    %85 %% 6/8
    R2.*2
    la,4 mi8 la do16 si la8\mbreak
    sold4 la8 sold4.

    %89
    la4 sold8 la8. si16 do re
    mi4 do8 si4 si8
    do mi mi do4.

    %92
    R2.*2
    mi4 la,8 mi' fa16 mi re8
    do4 si8 la4.

    %96
    si4 la8 r si si
    do8. re16 mi8 mi4 mi8
    re r si do4 si8

    %99
    do re8. do16 si8 do8. si16
    la8 si4 do8 mi4
    re8 r si la4 mi8

    %102
    la4. si4 r8
    R2.
    r4. mi,4 si8
    mi sol16 fad? mi8 red4 mi8

    %106 OOKK
    red4. mi8 red4
    mi8. fad?16 sol la si4.
    si si4 r8

    %109
    si4. la4 r8
    do mi16 re do8 si4 do8
    si4. do4 si8

    %112
    la8. si16 do re mi4.
    r mi8 la, do
    la4. si

    %115
    mi, r
    mi'8 sol16 fa mi8 re mi16 re do8\mbreak
    si do16 si la8 sold4.

    %118
    r si4 r8
    si do16 si la8 sold4.
    r si4 r8

    %121
    si4 la8 si4 si8
    la2.

}


IIvlaIn = \relative do' {

    la'2 mi
    mi1
    sol2. sol4

    %4
    sol2 si
    mi, fad
    sol8 la si4 si si

    %7
    sol r la r
    la4. la8 mi4 r
    r mi mi8 re do4

    %10
    fa2  si,4 do8. re16
    mi4 r la4. sol8
    fad2 sol4 r8 mi\mbreak

    %13
    sold4 r mi2
    mi1
    R1  %%% inizia l'allegro

    %16
    r4 mi fad2
    mi4 r r2
    r4 do'8 re16 do si4. si8

    %19
    la4 sold8 la16 sold fad4. fad8
    si,4 la si2
    do4 r r2

    %22
    r r4 mi
    fad2 mi4. mi8\mbreak
    red4 si r fad'

    %25
    sol8 sol16 fad mi8 fad16 mi fad4 r8 si
    sol4 r r2
    r4 si, dod2

    %28
    si4 sol'8 la16 sol fad4. fad8
    sol sol sol la16 sol fad4. fad8
    sol4 r r2

    %31
    r4 mi fad2
    mi4 r r2
    r r8 si'16 la sold  fa mi red?\mbreak

    %34
    dod8 dod' dod re16 dod si4 r8 si
    lad4 r r2
    r8 sol fad sol16 fad mi4 r

    %37
    mi r8 mi mi4 r8 do
    fa4 la r mi
    mi2 mi4 r

    %40
    r2 r4 mi
    fad2 mi4 r
    r2 r8 do' do re16 do

    %43
    si8 si la do16 si la4 r\mbreak
    r2 r4 mi
    fad2 mi4. mi8

    %46
    fad4. fad8 sold4 la~
    la sold la r
    r2 r8 mi mi fa?16 mi

    %49
    re4 r8 si do4 r
    r fad sold r8 mi
    mi2 mi4 r8 mi

    %52
    fa4 r8 mi mi4 r
    mi4. mi8 mi2
    mi1

    %55 grave
    sol4 si si
    sol2 mi4
    re r re

    %58
    do r r
    r si si
    si si4. si8

    %61
    si4 si'2
    la4 r r
    mi mi2

    %64
    re4 r r
    la' la2
    sib4 r r

    %67
    sol2.
    r4 re re
    re2 sib4

    %70
    do2 la4
    re2.\mbreak
    R

    %73
    fa2 re4
    si2.
    do4 r r

    %76
    fad si2
    sol r4
    R2.

    %79
    re4 la'2
    si4 la si
    sol2 mi4

    %82
    fad sol la~
    la la2
    fad2.

    %85 %% 6/8
    R2.*3
    mi4 la,8 mi' fa16 mi re8
    do4 si8 do mi16 re do8

    %90
    si4 do8 mi4.
    mi r
    R2.

    %93
    la4 mi8 la do16 si la8
    sold4 la8 sold4.
    la8 mi mi mi4.

    %96
    mi r
    r mi4 la,8
    fa' mi8. mi16 mi4 mi8

    %99
    do r sol' si r r
    mi,4~mi8 do4.
    fa8 mi mi mi4 mi8

    %102
    fa4 la8 mi4 r8
    R2.*4
    r4. si'4 mi,8

    %108
    si' do16 si la8 sold4 la8
    sold4. la4 si8
    la4. r

    %111
    r mi8 la, si
    do mi16 re do8 si4 do8
    si4. do4 la8

    %114
    la4. r
    la'8 mi la si4.
    la4 do8 sold mi4\mbreak

    %117
    mi4 mi8 mi4.
    r mi4 r8
    sold8 la16 sold fad8 mi4.

    %120
    r mi4 r8
    mi4 mi8 mi4.
    mi2.

}

IIvlaIIn = \relative do' {

    la2. la4
    si1
    mi2. mi4

    %4
    si2 r
    mi si
    r4 si2 si4

    %7
    si r8 si dod4 la~
    la fad mi r
    mi' si la4. mi'8

    %10
    la,4 re sold, la
    r mi'2 mi4
    la, re si8 mi mi mi\mbreak

    %13
    mi4 do8 [mi mi mi] mi4
    dod1
    R1*2 %% inizio allegro

    %17
    r4 la2 sold4
    la8 la16 si do8 la si4 r8 mi
    mi4 r r2

    %20
    r4 do8 re16 do si4. si8
    la4 r r2
    r r4 mi'~

    %23
    mi red mi do\mbreak
    si4 r r2
    r4 si do si

    %26
    si mi fad2
    mi4 r r2
    r4 mi2 red4

    %29
    mi si do si
    si r r2
    r8 si si si si si si si16 la

    %32
    sol8 do16 re mi2 red4
    mi do si r\mbreak
    R1*2

    %36
    r4 r8 si mi4 r
    mi si do r8 do
    re2  si4 la

    %39
    si4. si8 la4 r
    R1
    r2 r4 la~

    %42
    la sold la8 mi' mi mi
    fa4 r8 mi mi do do re16 do\mbreak
    si8 si \parenthesize si do16 si la4 r

    %45
    r2 r4 mi'~
    mi re2 do4
    si2 la8 do do re16 do

    %48
    si4. si8 do do16 re mi4
    fa mi mi8 mi mi mi
    fad4 r8 si, si si la mi'

    %51
    mi4 r8 mi do4 r8 la
    si4 r8 si do4 mi~
    mi8 mi do mi mi2

    %54
    dod1
    si4 si si %%% grave
    si2 do4

    %57
    re r r
    sol, r la
    si r r

    %60
    si si2
    sol4 r si
    mi r si

    %63
    la r mi'
    fa r r
    la, la2

    %66
    sol4 r la
    re mi2
    re re4

    %69
    si r sib
    sol2 r4
    r re' re\mbreak

    %72
    la2.
    la2 la4
    mi' r mi

    %75
    mi mi4. mi8
    si2 si4
    si si mi

    %78
    dod2 fad4~
    fad r fad,
    sol fad si~

    %81
    si r si
    si si4. si8
    si4 si2

    %84
    si2.
    R2.*5  %% inizia il 6/8
    mi4 la,8 mi' fa16 mi re8

    %91
    do4 si8 do mi16 re do8
    si4 do8 si re16 do si8
    la4 r8 r4.

    %94
    R2.
    la4 mi8 la do16 si la8
    sold4 la8 sold4.

    %97
    la4. sold8 si la
    si4 mi8 do la si
    la re si~si la4~

    %100
    la8 sold4 do4 la8
    si4 mi8 do4 r8
    r4. si4 r8

    %103
    R2.*2
    r4. si4 mi,8
    si' do16 si la8 sol4 fad8

    %107
    sol si16 la sol8 fad4 sol8
    si4 r8 mi4.~
    mi8 mi4 mi4.

    %110
    mi r8 mi mi
    mi4 si8 la4 mi'8
    do4. r

    %113
    si8 re16 do si8 la la16 si do8
    re4.~re4 si8
    do4 r8 mi4.

    %116
    mi4 mi8 si mi la,\mbreak
    mi4. sold
    r mi4 r8

    %119
    mi4. sold
    r mi4 r8
    si' mi4 mi mi8

    %122
    dod2.

}

IIvcn = \relative do {

    la2. la4
    mi'1
    do2. do4

    %4
    sol2 sold
    la red
    mi si'4 si,

    %7
    mi4 re dod4. dod8
    re4 re mi la,
    mi' mi, la la'8 sol

    %10
    fa2 mi4 la
    mi2 dod4. dod8
    re2 mi4 la,\mbreak

    %13
    mi' la mi2
    la,1
    R1*2

    %17
    r4 la si2
    la4 la'2 sold4
    la mi fad2

    %20
    mi8 mi' do la, re re' mi mi,
    la do16 si la2 sold4
    la8 la, fa fa' mi4 r

    %23
    R1\mbreak
    r4 mi fad2
    mi8 mi sol sol, la la' si si,

    %26
    mi4 r r2
    R1
    r4 mi fad2

    %29
    mi8 mi sol sol, la la' si si,
    mi4 si'2 lad4
    si mi, si2

    %32
    mi4 r r2
    r r4 si'~\mbreak
    si lad si sol

    %35
    fad4. fad8 si4 la?
    sol red mi8 mi' re mi16 re
    do4 sold la8 la,16 si do8 la

    %38
    re4 r8 re mi mi la la,
    mi'4 mi, la r
    R1

    %41
    r2 r4 la
    si2 la4 la'~
    la sold la8 la, do la\mbreak

    %44
    re si mi mi, la4 r
    R1*2
    r2 la

    %48
    si2 la8 la'16 si do8 do,
    re re' mi mi, la4 mi~
    mi red mi8 mi la la,

    %51
    mi'4 mi, la la'~
    la sold la la,
    mi' la, mi2

    %54
    la1
    mi'4 mi si %55 grave
    mi2 la,4

    %57
    re r sol,
    do r fad
    si mi, si

    %60
    mi si2
    mi4 mi re
    do sold2

    %63
    la4 la(sol?)
    fa dod'2
    re4 re do?

    %66
    sib fad2
    sol4 dod2
    re2.

    %69
    sol2 sol4
    mid2 fad4
    sol4. fa?8 mi? re\mbreak

    %72
    dod2.
    re4. do?8 si la
    sold2.

    %75
    la4 la'8 sol fad mi
    red2.
    mi4. re?8 dod si

    %78
    lad2.
    si4 si la
    sol red'2

    %81
    mi mi4
    si mi si
    mi si2

    %84
    mi2.
    R2.*4
    la4 mi8 la do16 si la8

    %90
    sold4 la8 sold4.
    la4 sold8 la la,16 si do re
    mi4 do8 mi4 mi8

    %93
    la4 r8 r4.
    R2.*2
    mi4 la,8 mi' fa16 mi re8

    %97
    do do' la[mi'] mi, do
    re mi mi, la8 la' sold
    la si4 sold8 la4

    %100
    fad8 sold4 la8 la, do
    re mi mi, la8 la' sol
    fa4. mi4 r8

    %103
    R2.*3
    r4. mi4 si8
    mi sol16 fad mi8 red4 mi8

    %108
    red4. mi4 la,8
    mi' fa16 mi re8 do do' sold
    la4. r

    %111
    r la4 mi8
    la do16 si la8 sold4 la8
    sold4. la4 la8

    %114
    fad4. sold
    la mi8 fa16 mi re8
    do mi16 re do8 si do16 si la8\mbreak

    %117
    sold4. mi'
    mi2.~
    mi~

    %120
    mi
    mi4 la,8 mi'4.
    la,2.

}

IIbcn = \relative do {

    la2. la4
    mi'1
    do2. do4

    %4
    sol2 sold
    la red
    mi si

    %7
    mi4 re dod4. dod8
    re4 re mi la,
    mi' mi, la la'8 sol

    %10
    fa2 mi4 la
    mi2 dod4. dod8
    re2 mi4 la,\mbreak

    %13
    mi' la mi2
    la,1
    \clef violin la''2 si

    %16
    la4 \clef alto mi fad2
    mi4\clef bass la,, si2
    la4 la'2 sold4

    %19
    la mi fad2
    mi4 do re mi
    la, la'2 sold4

    %22
    la fa mi\clef tenor mi'~
    mi red mi do\mbreak
    \clef bass mi,4 mi fad2

    %25
    mi4 sol8 sol, la4 si
    mi \clef tenor mi' fad2
    mi4 si dod2

    %28
    si4\clef bass mi, fad2
    mi4 sol8 sol, la4 si
    mi si'2 lad4

    %31
    si mi, si2
    mi4 \clef tenor mi'2 red4
    mi do si\clef bass si~\mbreak

    %34
    si lad si sol
    fad4. fad8 si4 la?
    sol red mi red

    %37
    do sold la4. la8
    re4 re mi la,
    mi2 la4 \clef violin la''4

    %40
    si2 la4\clef alto mi
    fad2 mi4\clef bass la,,4
    si2 la4 la'~

    %43
    la sold la8 la, do la\mbreak
    re4 mi la,\clef alto mi''
    fad2 mi4 \clef tenor mi~

    %46
    mi re2 do4
    si2\clef bass la,
    si la4 do

    %49
    re mi la, mi'~
    mi red mi la,
    mi' mi, la la'~

    %52
    la sold la la,
    mi' la, mi2
    la1

    %55 grave
    mi'4 mi si
    mi2 la,4

    %57
    re r sol,
    do r fad
    si mi, si

    %60
    mi si2
    mi4 mi re
    do sold2

    %63
    la4 la(sol?)
    fa dod'2
    re4 re do?

    %66
    sib fad2
    sol4 dod2
    re2.

    %69
    sol2 sol4
    mid2 fad4
    sol4. fa?8 mi? re\mbreak

    %72
    dod2.
    re4. do?8 si la
    sold2.

    %75
    la4 la'8 sol fad mi
    red2.
    mi4. re?8 dod si

    %78
    lad2.
    si4 si la
    sol red'2

    %81
    mi mi4
    si mi si
    mi si2

    %84
    mi2.
    \clef violin la''4 mi8 la do16 si la8
    mi4 la,8 mi' fa16 mi re8

    %87
    la4 mi8 la do16 si la8\mbreak
    \clef alto mi4 la,8 mi' fa16 mi re8 \clef bass
    la4 mi8 la do16 si la8

    %90
    sold4 la8 sold4.
    la4 sold8 la la,16 si do re
    mi4 do8 mi4.

    %93
    la8\clef alto la' mi la do16 si la8
    sold4 la8 sold4.
    \clef tenor la,4 mi8 la do16 si la8

    %96
    \clef bass mi4 la,8 mi' fa16 mi re8
    do4 la8 mi'4 do8
    re mi4 la,8 la' sold

    %99
    la si4 sold8 la4
    fad8 sold4 la8 la, do
    re mi4 la,8 la' sol

    %102
    fa4. mi8 sol re
    sol si16 la sol8 red?4 sol,8\mbreak
    \clef violin si''8 do16 si la8 mi4 si8

    %105
    mi sol16 fad mi8\clef tenor si4 mi,8
    si' do16 si la8 \clef bass mi4 si8
    mi sol16 fad mi8 red4 mi8

    %108
    red4. mi4 la,8
    mi' fa16 mi re8 do4 sold8
    la4. mi'4 do8

    %111
    mi4. la4 mi8
    la4 la8 sold4 la8
    sold4. la4 la8

    %114
    fad4. sold
    la mi4 re8
    do4 do8 si4 la8\mbreak

    %117
    sold4. mi'
    mi2.~
    mi~

    %120
    mi
    mi4 la,8 mi'4.
    la,2.

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <_+>
    s
    s2 <6 5->
    <9>4 <8> <6 5-> s
    <9+> <8> <4> <3+>
    s <6> <6> s
    <9> <8 _+> <7 _+> s
    <4> <3+> s s8 <6>
    <7>4 <6> <7> <_->
    <4>4 <3+> <6> s
    <9 _+> <8> <7 _+> s
    <_+> <_-> <4> <3+>
    <_+>1

%%% vivace
    s2 <7>4 <6+>
    s2 <7>4 <6+>
    s2 <7>4 <6+>
    s1
    s2 <7>4 <6+>
    <_+> <6> <6 5> <_+>
    s2 <2>4 <6>8. <5->16
    s1
    <4 2>4 <5-> <_+> <6>
    s2 <7>4 <6+>
    s4 <6> <6 5> <_+>
    s2 <7>4 <6+>
    s2 <7>4 <6+>
    s2 <7>4 <6+>
    s4 <6> <5> <_+>
    s2 <2>4 <6 5->
    <_+> <_-> <4> <3+>
    s2 <4 2>4 <6>
    <_-> <6> <_+> s
    <2> <5-> s <6>
    <_+> s <_-> <6 4+>
    <6>8 <5-> <6> <6> <_+>4 <6 4+>
    <6> <5>8 <5-> <_->2
    <9 _->4 <8> <7 _+> <_->
    <4> <3+> s2
    s1
    <7>4 <6+> s2
    <7>4 <6+> <_->2
    <2>4 <5-> <_-> <6>
    <6 5> <_+> <_->2s1
    <2+>4 s <4+ 2> <6>
    <7> <6+> s2
    <7>4 <6+> s <6>
    <6 5> <_+> s2
    <4 2+>4 <5->8 <6> s2
    <4>4 <3+> s2
    <4 2>4 <5-> <9> <8>
    <_+> <_-> <4> <3+>
    <_+>1

%%% grave
    s4 s <_+>
    <_->2.
    <_+>4 s <7+>
    <7> s <7>
    <_+> <_-> <_+>
    <_-> <4> <3+>
    <_-> <_+> s
    <6> <5-> <6>
    <_-> <_+> <4+>
    <6> <5-> <6>
    <_-> <_+> <6 4+>
    <6> <5-> <6>
    <_!> <7- 5-> s
    <4>2 <3+>4
    <_!>2 <_->4
    s2 <5->4
    <9>4 <8> s
    <6 5->2.
    <9>4 <8> s
    <6 5->2.
    <9>4 <8> s
    <6 5->2.
    <9>4 <8> s
    <6 5->2.
    <_->4 <_+> <6 4+>
    <6>4 <5-> <6>
    <9> <8> <_->
    <_+> <_-> <_+>
    <_-> <4> <3+>
    <_+>2.

    %% il 6/8
    s2.*2
    s4 <_+>8 s4.
    <_+>4 <8>8 <_+>4.
    s4 <_+>8 <_->4.
    <6>4  <8>8 <6>4 <5->8
    s4 <6>8 <_->4.
    <_+>4 <6>8 <_+>4.
    s2.*2
    s4 <_+>8  s <6>4
    s4. s4 <6 4+>8
    <6>4. <_+>
    <6 5>8 <4> <3+> <_-> s <6>
    <6 5> <5> <6> <6 5-> <5> <6>
    <6 5> <5-> <6> <9> <8> s
    <6 5>4. s4 <6>8
    <7> <6> s s4.
    s4 <_+>8 s4.
    <_+> s4 <_+>8
    s8 <6>16 <_+> s8 <_+>4 <_->8
    <_+>4. <_->4 <_+>8
    s4. <6>4 <_->8
    <6>4 <5->8 <_+>4 <_->8
    <_+> s <6 4+> <6>4.
    <_-> <_+>4 <6>8
    <_+>4. <_->4 <_+>8
    s4. <6>4 <_->8
    <6>4 <5->8 s4.
    <6 5-> <5->
    <9>8 <8>4 <_+> <4+>8
    <6>4. <6+>4 <_->8
    s4. <_+>
    <_+>2.
    s
    s
    <_+>4. <4>4 <3+>8
    <_+>2.

}


forma = {

    \time 4/4
    \key la\minor
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\huge "Adagio"
    \tempo 2 = 40
    s1*14
    \bar "||"\break
    \once\override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "Allegro"
    \time 4/4
    \tempo 2 = 60
    s1*40
    \bar "||"\break
    %\override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup\huge "Grave"
    \time 3/4
    \tempo 4 = 55
    s2.*30
    \bar "||"\break
    %\override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup\huge "[Vivace]"
    \time 6/8
    \tempo 4. = 75
    s2.*38
    \bar "|."

}


IIvlI = {
    \IIglobal
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


IIvlaI = {
    \IIglobal
    \clef alto
    <<\IIvlaIn \forma>>

}

IIvlaII = {
    \IIglobal
    \clef tenor
    <<\IIvlaIIn \forma>>

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

\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \header {
        title = \markup\smaller\center-column {"Sinfonia Quarta - Op. III"}
        composer = \markup \center-column{"  ""G. Bononcini (1670 - 1747)"}
    }

    \score {

        \new ChoirStaff <<


            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Alto Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "alt"
                    \IvlaI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Tenore Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "ten"
                    \IvlaII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "vc"
                \Ivc
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }
    \pageBreak
}

\bookpart {

    \header {
        title = \markup\smaller\center-column {"Sinfonia Sesta - Op. III"}
        composer = \markup \center-column{"  ""G. Bononcini (1670 - 1747)"}
    }

    \score {

        \new ChoirStaff <<


            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 3."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl3"
                    \IIvlIII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Alto Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "alt"
                    \IIvlaI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Tenore Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "ten"
                    \IIvlaII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "vc"
                \IIvc
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 2.2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

}
