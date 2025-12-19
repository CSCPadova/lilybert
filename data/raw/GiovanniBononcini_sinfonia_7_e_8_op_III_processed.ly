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

    sol4. sol8 do4. do8
    re re re mi16 fa mi4 sol~
    sol fad sol r

    %4
    do sib la r
    r2 r4 sold
    la si do si

    %7
    la r r2
    r do4 sib
    la r re, mib

    %10
    re4. re8 mi!4 r
    R1
    sol,4. sol8 do4. do8

    %13
    re re re mi16 fa mi4 re
    mi2 r

    %15 Vivace
    r8 do8 do do re4. do16 re
    mi4 r r2
    r8 sol16 fa mi8 sol fa fa fa sol16 fa

    %18
    mi4 r r2
    r8 sol, sol sol la4. sol16 la
    si4 r r do8 do

    %21
    re4. do16 re mi4 r
    r2 r4 sol~
    sol fad sol8 re16 do si la sol fa

    %24
    mi8 mi'16 re do si la sol fad8 fad'16 mi re do si la\mbreak
    sol8 sol'16 fad? mi re do si la4 r
    r2 sol4 sol'~

    %27
    sol fad sol8 sol16 fa? mi8 sol
    fa fa fa sol16 fa mi4 r
    R1

    %30
    r2 r8 sol fa fa
    sol4. fa16 sol la4 sol8 la16 sol
    fa8 fa4 sol16 fa mi4 r

    %33
    r re8 re do la'16 sol fa mi re do
    sib4. sib8 la fa la si
    do8 do do do re4. do16 re\mbreak

    %36
    mi4 fa2 mi4
    fa r r2
    r8 do16 sib la sol fa mib re4 r

    %39
    r2 r8 fa'16 mi re do sib la
    sol8 sol' la la sol4. sol8
    fa4 la8 si16 la sol8 sol sol la16 sol

    %42
    fa8 fa4 sol16 fa mi4 r
    R1
    r8 sol sol sol la4. sol16 la

    %45
    si4 r r2
    r4 do,8 do re4. do16 re\mbreak
    mi8 mi mi mi fa fa fa sol16 fa

    %48
    mi8do do do re4. do16 re
    mi4. mi8 re4. re8
    mi1

    %51 Adagio
    do1 si2
    do1 do2
    si mi1

    %54
    re mi2
    do la'1
    sol la2

    %57
    fad1 si4 la
    sold1 la2~
    la sold1

    %60
    la mi2~
    mi re1
    mi sol2\mbreak

    %63
    fa1 sol2
    mi1 fa2
    re1 mi2

    %66
    mi1 la2~
    la sold1
    do fa,2

    %69
    fa r mi
    mi r re
    re do si

    %72
    do si2. si4
    <<do1\\{s2 s\p}>> fa2
    fa r mi

    %75
    mi r re
    re do si
    do si2. si4

    %78
    do1 mi2~
    mi re1
    mi1.

    %81 Allegro
    sol,8 sol sol do mi16 re do8
    sol' la16 sol fa8 mi8. re16 do8
    si re16 do si8 si do16 si la8

    %84
    sol sol' mi re4 re8
    mi sol16 fa mi8 re4.
    mi r

    %87
    fad8 sol16 fad mi8 re4 mi8
    re4 re8 mi sol16 fa mi8
    re4. mi

    %90
    R2.*2
    do8 do do sol' si16 la sol8\mbreak
    mi4. re8 re re

    %94
    mi sol16. la32 si8 la4 la8
    si4. re,8 re8. re16
    sol8 si16 la sol8 fad4.

    %97
    sol8 re'16 do si8 la4.
    sol8. la16 si8 fad sol16 fad mi8
    re4 fad8 sol sol8. fad16

    %100
    sol8 la16 sol fa?8 mi4 r8
    R2.
    mi8 fa16 mi re8 do4 r8

    %103
    R2.
    do8 re16 do si8 la4 r8
    si' do16 si la8 sold4.\mbreak

    %106
    la2.~
    la4. la8 la8. sold16
    la4 r8 r la la

    %109
    sol4 r8 sol sol sol
    fa4 mi8 re4 re8
    mi4. do8 do do

    %112
    sol' la16 sol fa8 mi4.
    r re8 mi16 re do8
    si4. r

    %115
    r sol'8 la16 sol fa8
    mi sol16 fa mi8 re4 re8
    mi4. sol8\p la16 sol fa8

    %118
    mi sol16 fa mi8 re4 re8
    mi sol16 fa mi8 re4 re8
    mi4. r

}


IvlIIn = \relative do'' {

    R1
    r2 sol4. sol8
    do4. do8 si4 la

    %4
    sol2 r
    sib'4 la sold r
    mi4 r mi8 la4 sold8

    %7
    la4 r re, do\mbreak
    si r do r
    do re8 do si4 do~

    %10
    do si do r
    do do2 si4
    do r r do~

    %13
    do si do si
    do2 r

    %15 Vivace
    R1
    r4 sol2 fad4
    sol r r2

    %18
    R1
    r8 re'16 do si8 re do do do re16 do
    si4 r fad r8 la

    %21
    sol4 r r do8 do\mbreak
    re4. do16 re mi4 r
    r2 r8 si16 la sol fa mi re

    %24
    do4 r r2
    r8 mi'16 re do si la sol fad4 r
    r2 r8 sol sol sol\mbreak

    %27
    la4. sol16 la si4 do~
    do si do r
    r2 r8 sol'16 fa mi8 sol

    %30
    fa fa fa sol16 fa mi4 r
    r2 r4 do~
    do si do8 mi16 re do si la sol\mbreak

    %33
    fa4 r r fa'8 fa
    sol4. fa16 sol la4 fa
    mi r r re8 re

    %36
    do la'16 sol fa mi re do sib4. sib8
    la4 r r2
    r r8 re16 do\mbreak sib la sol fa

    %39
    mi4 r r2
    r4 fa'8 fa sol4. fa16 sol
    la8 la16 sol fa mi re do si!4 sol

    %42
    r2 r8 do do do
    re4. do16 re\mbreak mi8 re mi fad
    sol4 r r2

    %45
    r8 sol, sol sol la4. sol16 la
    si4 do2 si4
    do r r2

    %48
    r8 sol'16 fa mi8 sol fa4 re~
    re do2 si4\mbreak
    do1

    %51 Adagio
    la1 sold2
    la1 la2
    sold1 do2~

    %54
    do si1~
    si2 la1
    re,2 mi1

    %57
    la re2~
    re r do
    si1 si2

    %60
    do1 si2\mbreak
    la1.
    sold1 mi'2~

    %63
    mi re1~
    re2 do1~
    do2 do2. si4

    %66
    do1 mi2
    re si si'~
    si la la,

    %69
    si r si
    la r la\mbreak
    sold la sold

    %72
    la la2. sold4
    <<la1\\{s2 s\p}>> la2
    si r si

    %75
    la r la
    sold la sold
    la la2. sold4

    %78
    la2 do si
    la1.\mbreak
    sold

    %81 Allegro
    R2.
    r4. do,8 do do
    sol' si16 la sol8 re' mi16 re do8

    %84
    si4 do8 do4 si8
    do4 do'8 si do16 si la8
    sol4. sol8 sol sol\mbreak

    %87
    la4. sol4 do,8
    re4 re8 do sol8. la16
    si4. do

    %90
    R2.
    r4. sol8 sol sol
    do mi16 re do8~do si4

    %93
    do4. si8 si si
    do mi8. fad16\mbreak sol8 sol8. fad16
    sol4. r

    %96
    r re8 re8. re16
    sol8 si16 la sol8 fad4.
    sol r

    %99
    re8 mi16 re do8 si la4
    si4. do4 r8\mbreak
    fa8 sol16 fa mi8 red4 r8

    %102
    R2.
    re?8 mi16 re do8 si4 r8
    r4. la8 si16 la sol8

    %105
    fa4. mi
    mi la~
    la si4 si8\mbreak

    %108
    la4 si8 re mi16 re do8
    si4 r8 do re16 do si8
    la8. si16 do8 do4 si8

    %111
    do4. r
    sol8 sol sol do mi16 re do8
    si4. r

    %114
    sol'8 la16 sol fa8 mi4.
    r mi8 fa16 mi re8
    do mi16 re do8 do4 si8

    %117
    do4. mi8\p fa16 mi re8\mbreak
    do mi16 re do8 do4 si8
    do mi16 re do8 do4 si8

    %120
    do4. r

}


IvlIIIn = \relative do'' {

    do4 r8 do do4 do~
    do si8 do16 re do4 re
    do la si r

    %4
    r2 la'4 sol
    fa2 r
    r4 mi r mi

    %7
    do si la2\mbreak
    r2 sol4 r
    la4. la8 si4 r8 sol

    %10
    sol4 r sol4. sol8
    do4. do8 re re re mi16 fa
    mi4 re do r8 mi

    %13
    re4. re8 do4 re
    do2 r

    %15 Vivace
    do,4 do'2 si4
    do8 re16 do si8 re do do do re16 do
    si4 r r2

    %18
    r4 sol'2 fad4
    sol4 r r2
    r8 si16 la sol fa mi re do4 r\mbreak

    %21
    r8 sol sol sol mi4 r
    r2 r8 do' re re
    do4. re16 do si4 r

    %24
    r8 sol'16 fa mi re do si la4 r
    r2 r4 sol8 sol
    la4. sol16 la si8 re16 do\mbreak si8 re

    %27
    do do do re16 do si4 r
    r2 r8 do16 sib la8 do
    sib sib sib do16 sib la8 re do4

    %30
    r2 r8 do do do
    sib4. do16 sib la4 r\mbreak
    r2 r8 do do do

    %33
    re4. do16 re mi4 fa~
    fa mi fa do8 re
    mi mi16 re do si la sol fa4 r

    %36
    r fa'8 fa sol4. fa16 sol
    la4 fa2 mi4\mbreak
    fa r r2

    %39
    r8 mi16 re do sib la sol fa4 r
    R1
    r8 la la la si!4 do~

    %42
    do si do do~
    do si do8 si la4
    sol r r2

    %45
    r4 sol2 fad4\mbreak
    sol8 sol'16 fa mi8 sol fa fa4 sol16 fa
    mi4 r r2

    %48
    r4 do2 si4
    mi sol8 do, re2
    do1

    %51 Adagio
    la1 si2
    la do la
    si1 la2

    %54
    la si1\mbreak
    do2 mi fa~
    fa mi1~

    %57
    mi2  re2. do4
    si1 la2
    si1 si2

    %60
    la do sol
    la1 la2
    si1 do2~

    %63
    do re4 do si2~
    si do4 si la2~\mbreak
    la re1

    %66
    do do2
    re1.
    do2 do re

    %69
    si r mi
    la, r re
    si la si

    %72
    la si2. si4
    la2 do\p re
    si r mi\mbreak

    %75
    la, r re
    si la si
    la si2. si4

    %78
    la2 mi sol
    la1.
    si

    %81 Allegro
    R2.*3
    r4. sol8 sol sol
    do mi16 re do8 sol la16 sol fa8\mbreak

    %86
    mi mi'16 re do8 si re16 do si8
    la la la si4 sol8
    sol4 sol8 sol4.

    %89
    R2.
    sol8 sol sol la la la
    si re mi re4 re8

    %92
    mi4. r\mbreak
    r sol,8 sol sol
    do do16 re mi8 re re8. re16

    %95
    si4. r
    sol8 sol sol re' mi16 re do8
    si4 re8 re4 re8

    %98
    si re16 do si8 la4 la8\mbreak
    si4 do8 re re8. re16
    si4 re8 mi fa16 mi re8

    %101
    do4. r
    r do8 re16 do si8
    la4. r

    %104
    mi'8 fa16 mi re8 do4.
    r si
    la\mbreak do8 re16 do si8

    %107
    la4 do8 si4 si8
    do re16 do si8 la4.
    si8 do16 si la8 sol4.

    %110
    R2.
    sol8 sol sol do mi16 re do8
    si4. do\mbreak

    %113
    re8 re16 do si8 la4.
    si4 re8 mi sol16 fa mi8
    re4. do4 r8

    %116
    do4 r8 re4 re8
    do4. do4\p r8
    do4 r8 re4 re8

    %119
    do4 do8 re4 re8
    do4. r\mbreak

}


IvlaIn = \relative do' {

    mi4 re do mi
    re sol2 re4
    la'2 sol4 la

    %4
    mi sol fa r
    fa r mi r
    mi4. mi8 do4 r8 mi

    %7
    mi2 r\mbreak
    si'4 la sol2
    fa4 la sol r

    %10
    r sol mi r
    fa mi re2
    do4 r fa sol

    %13
    fa re8 sol sol4 sol
    mi2 r

    %15 Vivace
    R1*3\mbreak
    r4 sol8 sol la4. sol16 la
    si8  si16 la sol8 si la la la la

    %20
    sol4 r la r
    r2 r8 sol16 fa mi8 sol
    fa fa fa sol16 fa mi8 sol sol sol\mbreak

    %23
    la4. sol16 la si4 r
    r2 r8 la16 sol fad mi re do
    si4 r r sol'~

    %26
    sol fad sol r
    r2 r4 do,8 do
    re4. do16 re mi4 fa~\mbreak

    %29
    fa mi fa8 re mi mi
    fa4 r sol la
    sib sol r8 do, do do

    %32
    re re4 re8 mi do'16 si la sol fa mi
    re4 sol2 la4
    re,8 re mi do do4 r\mbreak

    %35
    r8 do'16 si la sol fa mi re4 sol
    mi do sol'4. sol8
    fa do'16 sib la8 do sib sib16 la sol8 do16 sib

    %38
    la4 r fa r
    r8 mi mi mi\mbreak fa re4 re8
    mi sol fa la re,4 mi

    %41
    fa4. fa8 sol2
    la4 r8 sol sol4 r
    R1

    %44
    r8 re16 do si8 re do do do re16 do
    si8 si16 la sol8 si\mbreak la8 la la si16 la
    sol4 r r2

    %47
    r4 do'2 si4
    do8 do, mi mi fa4 r
    mi4. mi8 sol4. sol8

    %50
    mi1

    %51 Adagio
    mi1 mi2
    mi mi1
    mi mi2\mbreak

    %54
    la r mi
    mi1 re2
    re r la'

    %57
    re,1 fad2
    sold mi1~
    mi2 mi mi

    %60
    mi1 mi2
    fa?1.
    si,2 mi mi

    %63
    la r sol~
    sol r do,
    fa re sol

    %66
    sol1 do,2
    r sold' sold
    mi1 fa2

    %69
    re r mi
    do r re
    mi1.

    %72
    mi2 mi1
    <<mi\\{s2 s\p}>> fa2
    re r mi

    %75
    do r re
    mi1.
    mi2 mi1

    %78
    mi mi2
    fa1.
    si,

    %81 Allegro
    R2.*8
    r4. do8 do do
    sol'8 si16 la sol8\mbreak re mi16 re do8

    %91
    si4 do8 do4 si8
    do4. re8 re re
    mi sol16 fa mi8 r sol sol

    %94
    sol sol sol sol r la
    sol4. fad\mbreak
    sol r

    %97
    r re8 re re
    sol si16 la sol8 fad4.
    sol4 r8 r la la

    %100
    sol4. r
    la8 si16 la sol8 fad4.
    sol4 fa!8\mbreak mi4.

    %103
    fa8 sol16 fa mi8 re4.
    r r8 do do
    re4 la8 mi'4.

    %106
    mi8 fa16 mi re8 do4 mi8
    fa4 r8 fa mi4
    mi4. la4 la8\mbreak

    %109
    re,4. sol8 sol sol
    la4 sol8 sol sol8. sol16
    mi4. r

    %112
    R2.
    r4. re8 re re
    sol4. sol

    %115
    sol8 la16 sol fa8 mi4 r8
    mi4 r8 sol4 sol8\mbreak
    mi sol16 fa mi8 mi4\p r8

    %118
    mi4 r8 sol4 sol8
    mi4. sol4 sol8
    mi4. r

}

IvlaIIn = \relative do' {

    do4 re8 mi fa fa, sol sol
    la4 r8 sol sol4 si
    do2 re

    %4
    mi4 r do2
    re4 r si4. si8
    do4 si la si

    %7
    do r re r\mbreak
    re4. re8 mi2
    la,4 re2 do4

    %10
    re2 do4 re
    do sol la sol
    sol r la sol

    %13
    la sol sol sol
    sol2 r

    %15 Vivace
    R1
    r4 sol8 sol la4. sol16 la\mbreak
    si8 mi16 re do2 si4

    %18
    do8 mi re si mi4 re
    re r r2
    r8 si si si do4 r

    %21
    si r r8 mi mi mi
    re4. re8 sol,4 si8 si
    do4 la\mbreak sol r

    %24
    sol r re' r
    r2 r4 si8 si
    mi4 re re r

    %27
    R1
    r2 r4 fa,8 fa
    sol4. fa16 sol la8 si do4~

    %30
    do si do la8 la
    sol4. sol8\mbreak fa do' mi4
    fa re do r

    %33
    r2 r4 do8 do
    sol4. sol8 fa4 r
    r do'2 sib4~

    %36
    sib la sol do
    fa,8 la la la sib4. la16 sib
    do4 r\mbreak r re16 do sib la

    %39
    sol4 r r2
    r4 fa'2 mi4
    fa r re sol,

    %42
    re'4. re8 mi4 r
    R1
    r8 si16 la sol8 si la la la si16 la

    %45
    sol8 re'16 do si8 re\mbreak do do do re16 do
    si4 sol la sol
    sol8 sol'16 fa mi8 sol fa4 re

    %48
    do8 mi sol mi la,4 si
    sol sol sol2
    sol1

    %51 Adagio
    do2 mi1
    la, mi2\mbreak
    sold1 la2

    %54
    re1 si2
    mi do re
    sol,1 mi2

    %57
    fad la fad
    si1 do2
    mi1 mi2

    %60
    do1 mi2
    r la, la
    mi1 mi'2

    %63
    do si1~
    si2 la1~\mbreak
    la2 r sol

    %66
    mi mi'1
    r2 mi si
    do1.

    %69
    si2 r sol
    la r si
    si do r

    %72
    r mi mi
    <<do1.\\{s2 s\p}>>
    si2 r sol

    %75
    la r si\mbreak
    si do r
    r mi mi

    %78
    do mi1
    r2 la, la
    mi'1.

    %81 Allegro
    R2.*5
    do,8 do do sol' si16 la sol8
    re' mi16 re do8 si4 do8

    %88
    do4 si8 do4.\mbreak
    si8 do16 si la8 sol4.
    sol4 do8 la4.

    %91
    sol8 si sol sol4.
    sol4 r8 sol sol sol
    do8 mi16 re do8 re4.

    %94
    do4 si8 re4 re8
    re4. r\mbreak
    R2.

    %97
    sol,8 sol sol re' mi16 re do8
    si4 re8 re4 r8
    re sol, la si re4

    %100
    re4. r
    r red8 mi16 red dod8
    si4. r\mbreak

    %103
    r si8 do16 si la8
    sol4. r
    re'8 mi16 re do8 si4.

    %106
    do4 r8 do4 r8
    do4 sol8 re' si mi
    do mi4 fad4.

    %109
    re mi
    do4 do8\mbreak re re4
    do4. r

    %112
    R2.
    sol8 sol sol re'4 la8
    sol re' re do4.

    %115
    re8 fa16 mi re8 mi4 r8
    sol,4 r8 r sol sol
    sol mi'16 re do8\mbreak do4\p r8

    %118
    sol4 r8 r sol sol
    sol4 r8 r sol sol
    sol4. r

}

Ivcn = \relative do {

    do4 si la mi
    fa sol do si
    la re sol fa

    %4
    mi2 fa4 mi
    re2 mi4 re
    do sold la mi'

    %7
    la sol fad2
    sol4 fa! mi2
    fa4 fad sol do,

    %10
    sol' sol, do si
    la mi fa sol
    do si la mi

    %13
    fa sol do sol
    do2 r

    %15 Vivace
    R1*2
    r8 do do do re4. do16 re\mbreak
    mi8 do' si sol do la re re,

    %19
    sol,4 sol'2 fad4
    sol8 sol16 fa? mi re do si la8 la'16 sol fa mi re do
    si8 si'16 la sol fa mi re do4 do'~

    %22
    do si do si
    la re, sol, r
    do r re fad

    %25
    sol r8 do, re4 sol8 sol
    do la re re, sol4 r
    R1*2\mbreak  %% fine pagina

    %29
    r2 r4 do,8 do
    re4. do16 re mi4 fa~
    fa mi fa mi

    %32
    re sol8 sol, do4 do'~
    do sib2 la4
    sol do, fa4. re8

    %35
    do4 r r2
    R1\mbreak
    r8 fa fa fa sol4. fa16 sol

    %38
    la4 r sib r
    do8 do16 sib la sol fa mi re8 re'16 do sib la sol fa
    mi!8 do fa la, sib sib' do do,\mbreak

    %41
    fa4 fa2 mi4
    re sol8 sol, do4 r
    R1

    %44
    r4 sol'2 fad4
    sol8 sol, si sol do la re re,
    sol sol' do do, fa re sol sol,

    %47
    do do do do\mbreak re4. do16 re
    mi4 do fa, sol
    do do sol2

    %50
    do1

    %51 Adagio
    la1 mi'2
    do la1
    mi' la2\mbreak

    %54
    fad sold1
    la re,2
    si dod1

    %57
    re re2
    mi1 la,2
    mi'1.

    %60
    la,2 la' sol
    fa1.
    mi1 do2

    %63
    la si1\mbreak
    sol2 la1
    fa2 sol1

    %66
    do do2
    si  mi1
    la, re2

    %69
    sol, r do
    fa, r si
    mi la mi

    %72
    la mi1\mbreak
    <<la,1\\{s2 s\p}>> re2
    sol, r do

    %75
    fa, r si
    mi la mi
    la mi1

    %78
    la,2 la' sol
    fa1.
    mi

    %81 Allegro
    R2.*7
    sol,8 sol sol do mi16 re do8
    sol' la16 sol fa8 mi8. re16 do8\mbreak

    %90
    si8 sol'16 fa mi8 fad4.
    sol4 do8 sol4.
    mi r

    %93
    do8 do do sol' si16 la sol8
    mi8. re16 do8 sol' re' re,
    sol,8 sol sol re' mi16 re do8

    %96
    si4. r
    R2.
    \clef tenor sol'8 sol sol re' mi16 re do8

    %99
    si do16 si la8\mbreak \clef bass sol re' re,
    sol4. do8 re16 do si8
    la4. si8 dod16 si la8

    %102
    sol4. la8 si16 la sol8
    fa4. sol8 la16 sol fa8
    mi4. fa8 sol16 fa mi8

    %105
    re4. \clef tenor mi'8 fa16 mi re8
    do re16 do si8 la si16 la sol8
    \clef bass fa8 sol16 fa mi8 re mi mi,

    %108
    la' si16 la sol8 fad4.
    sol8 la16 sol fa!8 mi4.
    fa4 do8 sol sol sol

    %111
    do4. r
    r do8 do do
    sol' si16 la sol8 fad4.

    %114
    sol8 sol sol do, mi16 re do8
    si4. do4 r8
    do4 r8 sol'4 sol,8

    %117
    do4 r8 do4\p r8
    do4 r8\mbreak sol'4 sol,8
    do4 r8 sol'4 sol,8

    %120
    do4. r

}

Ibcn = \relative do {

    do4 si la mi
    fa sol do si
    la re sol fa

    %4
    mi2 fa4 mi
    re2 mi4 re
    do sold la mi'

    %7
    la sol fad2
    sol4 fa! mi2
    fa4 fad sol do,

    %10
    sol' sol, do si
    la mi fa sol
    do si la mi

    %13
    fa sol do sol
    do2 r

    %15 %% inizia il Vivace
    \clef violin do'4 do'2 si4
    do \clef tenor sol,8 sol la4. sol16 la
    si8 \clef bass do, [do do] re4. do16 re\mbreak
    mi8 do si sol do4 re

    %19
    sol,4 sol'2 fad4
    sol8 sol16 fa? mi re do si la4 r
    si r do4 do'~

    %22
    do si do si
    la re, sol, r
    do r re fad

    %25
    sol r8 do, re4 sol8 sol
    do,4  re sol \clef violin sol'8 sol
    la4. sol16 la si4 \clef alto do,8 do
    re4. do16 re mi4 \clef tenor fa,8 fa

    %29
    sol4. fa16 sol la8 si\mbreak \clef bass do,8 [do]
    re4. do16 re mi4 fa~
    fa mi fa mi

    %32
    re sol, do do'~
    do sib2 la4
    sol do, fa4. re8

    %35
    do4 \clef tenor do'2 sib4~\mbreak
    sib la sol do
    \clef bass fa,8 fa fa fa sol4. fa16 sol

    %38
    la4 r sib r
    do, r re sib
    do sol sib do\mbreak

    %41
    fa4 fa2 mi4
    re sol do,4 \clef violin do''~
    do si do8 si la4

    %44
    sol4 \clef bass sol,2 fad4
    sol r8 sol, do4 re
    sol, do\mbreak fa8 re sol sol,

    %47
    do do do do\mbreak re4. do16 re
    mi4 do fa, sol
    do do sol2

    %50
    do1

    %51 Adagio
    la1 mi'2
    do la1
    mi' la2\mbreak

    %54
    fad sold1
    la re,2
    si dod1

    %57
    re re2
    mi1 la,2
    mi'1.

    %60
    la,2 la' sol
    fa1.
    mi1 do2

    %63
    la si1\mbreak
    sol2 la1
    fa2 sol1

    %66
    do do2
    si mi1
    la, re2

    %69
    sol, r do
    fa, r si
    mi la mi

    %72
    la mi1\mbreak
    <<la,1\\{s2 s\p}>> re2
    sol, r do

    %75
    fa, r si
    mi la mi
    la mi1

    %78
    la,2 la' sol
    fa1.
    mi

    %81 Allegro
    \clef violin sol'8 sol sol do mi16 re do8
    sol' la16 sol fa8 mi8. re16 do8
    sol si16 la sol8 si4 la8

    %84
    sol4 do8 sol sol sol
    do mi16 re do8\mbreak sol4 fa8
    \clef tenor do,8 do do sol' si16 la sol8

    %87
    re' mi16 re do8 si4 do8
    \clef bass sol,8 sol sol do mi16 re do8
    sol'4 fa8 mi8. re16 do8\mbreak

    %90
    si8 sol' mi fad4.
    sol4 do8 sol4.
    mi \clef tenor sol8 sol sol

    %93
    \clef bass do, do do sol' si16 la sol8
    mi8. re16 do8 sol re'4
    sol,8 sol sol\mbreak re'4 do8

    %96
    si \clef violin sol''[sol] re' mi16 re do8
    \clef tenor sol, 8 sol sol re' mi16 re do8
    sol sol sol re' mi16 re do8

    %99
    si4 la8\mbreak
    \clef bass sol re4
    sol4. do4 si8

    %102
    la4. si4 la8 sol4. la4 sol8
    fa4. sol4 fa8
    mi4. fa4 mi8

    %105
    re4. fa4 mi8
    do4 si8\mbreak la4 sol8
    fa'4 mi8 re mi mi,

    %108
    la'4 sol8 fad4.
    sol4 fa!8 mi4.
    fa4 do8 sol sol sol

    %111
    do \clef violin sol'' [sol] do do do\mbreak
    sol sol sol \clef bass do,, do do
    sol'4 sol8 fad4.

    %114
    sol8 sol sol do,4 do8
    si4. do4 r8
    do4 r8 sol4 sol8

    %117
    do4 r8 do4\p r8
    do4 r8\mbreak sol'4 sol,8
    do4 r8 sol'4 sol,8

    %120
    do4. r

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> <6> <6>
    <5>2 s4 <6>
    <7> <7 _+> s <6>
    <6> <5-> s <6>
    <6- > <5> <_+> <6 4+>
    <6> <6> < _-> <4>8 <3+>
    s4 <6> <6> <5->
    s4 <6> <6> <5->
    <6> <5-> s <_->
    <4> <3> <_!> <6>
    <6> <6> <6 5> s
    <6> <6> <6> s
    <6 5>1
    s

    %Vivace
    s2 <2>4 <6>
    s2 <7>4 <6>
    <6>2 <7>4 <6>
    s4 <6> <6 5> <_+>
    s s <4 2> <5->8 <6>
    s2 <6+>
    <6>1
    <2>4 <5->8 <6> s4 <6>
    <7> <7 _+> s2
    s2 s4 <6>
    s2 <_+>
    <6 5>4 <_+> s2
    <7>4 <6+> <6> s
    <7> <6> s2
    <7 _->4 <6> s8 <6>  s4
    <7> <6> <6> s
    <4- 2> <5->8 <6> s4 <6>
    <7>4 <7> s2
    <2>4 <6> <2> <6>
    <6->4 <7-> s4. <6+>8
    <6>2 <2>4 <6>
    <2> <6> <7> <7>
    s2 <7 _->4 <6>
    <6>2 <5>
    s1
    s4 <6> <6 5> s
    s4 s <2> <6>
    <7> <7> s2
    <2>4 <5-> s8 <6> <5> <6+>
    s4 s <4 2> <5->8 <6>
    s2 <6 5>4 <_+>
    s2<6 5>
    s2 <7>4 <6>
    <6>2 <6 5>
    <9>4 <8> <4> <3>
    s1

    %% Adagio
    s1 <_+>2
    <6>1.
    <_+>
    <6 5->2 <5-> <6>
    <9> <8> <_->
    <6 5-> <5-> <6>
    <9 _+> <8> <6>
    <7 _+>1 <_->2
    <4> <3+> s
    <_-> s <6>
    <7> <6> s
    <_+>1 <5>2
    <6 5> <5-> <6>
    <6 5> <5> <6>
    <6 5> <5> <6>
    s1 <6>2
    <7> <7 _+> s
    <9> <8> <_->
    <7> s <7>
    <7> s <7>
    <7 _+> <_-> <_+>
    s <4> <3+>
    <_->1 <_->2
    <7> s <7>
    <7> s <7>
    <_+> <_-> <_+>
    <_-> <4> <3+>
    <_-> s <6>
    <7> <6> s
    <_+>1.

    %% Allegro
    s2.*2
    s4. <6>4 <6+>8
    s4. s8 <4> <3>
    s2.*2
    <_+>4 <6>8 <6>4.
    <4>4 <3>8 s4.
    s <6>
    <6>4 <6>8 <6>4 <5->8
    s4. <4>4 <3>8
    s4. s8 <4> <3>
    s2.
    s4. s8 <4> <3+>
    s4. <_+>4 <6 4->8
    s4.
    <_+>
    s
    <_+>
    s <_+>
    <6>4 <6+>8 s <4> <3+>
    <8>4 <7->8 s4 <6>8
    <6>4 <5>8 <_+>4 <6 _+>8
    <6>4 <5>8 s4 <6>8
    <6>4. s4 <6>8
    <6>4 <5>8 s4.
    <6>4 <5>8 <_+>4 <6>8
    <6>4. s4 <6>8
    s4 <6>8 <6 5> <_+> s
    s4 <6>8 <6>4 <5->8
    s4 <6>8 <6>4 <5>8
    s4. s8 <4> <3>
    s2.*2
    s4. <6>4 <5->8
    s2.
    <6>
    s4. <4>4 <3>8

}

forma = {

    \time 4/4
    \key do\major
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\huge "Grave"
    \tempo 4 = 55
    s1*14
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "Vivace"
    \time 4/4
    \tempo 2 = 60
    s1*36
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\huge "Adagio"
    \time 3/2
    \tempo 1 = 50
    s1.*30
    \bar "||"\break%\pageBreak
    \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\huge "Allegro"
    \time 6/8
    \tempo 4. = 75
    s2.*40
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

IvlIII = {
    \Iglobal
    <<\IvlIIIn \forma>>

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


IItpn = \relative do'' {

    R1*16

    %17 Allegro
    re4 r re r
    mi4. mi8 fad16 sol la sol fad sol mi fad
    re8 mi fad4 mi4. mi8

    %20
    fad4 r r2\mbreak
    R1
    r2 la4 r

    %23
    la r si4. si8
    la16 si sol la fad sol mi fad re8 mi fad re
    mi4 la2 sold4

    %26
    la r r2
    R1*2\mbreak
    r2 r4 la

    %30
    r la2 sold4
    la4. la8 sol?16 fad mi fad sol8 la
    fad16 sol la sol fad8 sol mi16 fad sol fad mi8 fad

    %33
    re16 mi fad sol la8 sol16 fad\mbreak mi4 la~
    la sold la r
    R1*5

    %40
    re,4 r re r
    mi4. mi8 fad16 sol la sol fad sol mi fad
    re8 mi fad4 mi4. mi8\mbreak

    %43
    fad4 r r2
    R1
    r2 la4 r

    %46
    la r si4. si8
    la16 si sol la fad sol mi fad re8 mi fad re
    mi4 la2 sol4~

    %49
    sol fad\mbreak mi4. mi8
    fad4 r r2
    R1

    %52
    re4 r re r
    mi4. mi8 fad16 sol la sol fad sol mi fad
    re8 mi fad4 mi fad

    %55
    mi4. mi8 fad2

    %56 Adagio
    R1.*25

    %81 Vivace
    R1*2
    r4 r8 re16 mi fad8 re r4
    R1

    %85
    r2 r4 r8 re16 mi
    fad8 re r fad16 sold\mbreak la2~
    la la4 r8 re16 (dod)

    %88
    si (la) sol? (fad) mi8. mi16 fad4 r8 mi
    fad8. mi16 fad8. sold16 la4 r
    R1

    %91
    r2 r4 r8 la16 si\mbreak
    dod8 la r4 r2
    R1

    %94
    r4 r8 la16 si dod8 la r8 sold16 fad
    mi1~
    mi4 r8 la16 sold? fad mi re fad si8. si16

    %97
    la4 r8 la16 si dod8 la r4\mbreak
    R1
    r2 r4 r8 la16 si

    %100
    dod8. la16 si8. dod16 re4 r
    R1
    r2 r4 r8 re,16 mi

    %103
    fad8 re r fad16 sol la8 fad r4\mbreak
    r r8 re'16 (dod) si (la) sol (fad) mi8. mi16
    fad8. re16 mi8. fad16 sol8 sol16 la si8 sol

    %106
    R1
    r2 r4 r8 sol16 la
    si8 sol r4 r r8 re16 mi\mbreak

    %109
    fad4 r8 sol16 la si8 sol sol8. fad16
    sol8 fad mi4 re8 re16 mi fad8 re
    r2 r4 r8 re'16 (dod)

    %112
    si(la) sol(fad) mi8. mi16 fad4 sold\mbreak
    la8 la16 si dod8 la r2
    r4 r8 la16 si dod8 la la8. sold16

    %115
    la8. la16 si8. dod16 re4 r
    R1
    r2 r4 r8 re,16 mi

    %118
    fad8 re r8 fad16 sol\mbreak la2~
    la la4 r8 re16(dod)
    si(la) sol(fad) mi8. mi16 fad4 r

    %121
    R1
    r2 r4 mi
    re r r2

    %124 Adagio
    R1*5

    %129 Allegro e spiccato
    R1*3\mbreak
    r2 fad4 re
    R1

    %134
    r4 la'4 fad r
    mi r8 mi fad mi fad re
    mi4 r8 mi fad mi fad re

    %137
    mi4 re la la'
    sold la la sold\mbreak
    la r r2

    %140
    R1*2
    r2 la4 mi
    fad re mi fad

    %144
    mi la sold la~
    la sold la r
    R1*3

    %149
    r2 la4 mi
    R1\mbreak
    r2 mi4 la,

    %152
    R1*2
    r2 la'4 re,
    mi8 fad sol la fad4 la~

    %156
    la sol2 fad4
    mi4. mi8 fad4 la\p~
    la4 sol2 fad4

    %159
    mi4. mi8 fad4 r\mbreak
    R1*8
    r2 fad4 re

    %169
    mi fad sol8 fad sol mi
    fad mi fad re mi4 fad
    mi8 fad mi8. mi16 fad4 la

    %172
    fad r r2
    R1*4

}


IIvlIn = \relative do'' {

    fad4. fad8 mi2\fermopz
    r4 re la'4. sol8
    fad sol la2 sol4~

    %4
    sol fad mi4. mi8
    fad4 sol2 fad4
    sold8 la sold la si4 mi,~

    %7
    mi re~re8 dod dod si
    la4 la' re, sol?
    dod, r si'2

    %10
    la si8 la sol fad
    mi sol16 fad mi8. mi16 fad4 la~
    la sol2\parenthesize \p fad4

    %13
    fad mi2 re4
    re dod re2
    sol2. fad4

    %16
    mi2 fad

    %17 Allegro
    R1*3
    re4 r re r
    mi4. mi8 fad16 sol mi fad re mi dod re

    %22
    si4. si8 dod4 r
    R1*3
    la'4 r la r

    %27
    la4. la8\mbreak la16 si sol la fad sol mi fad
    re8 mi fad re mi4 la~
    la sold la r

    %30
    R1*4
    r2 la4 r
    r la la sold

    %36
    la4. la8 sol?2
    fad16 mi re mi fad8 sol mi re mi fad
    fad16 mi fad sol la8 sol16 fad r8 mi4 si'8

    %39
    la4. sol16 fad mi8 fad mi8. mi16
    fad4 r r2
    R1*2

    %43
    re4 r re r
    mi4. mi8 fad16 sol mi fad re mi dod re
    si4. si8 dod4 r

    %46
    r la'2 sold4
    la la16 si sol la fad8 mi re4
    dod r8 la' si2

    %49
    la4 re,2 dod4
    re4 r8 la'\p si2
    la4 re,2 dod4

    %52
    re re r re~
    re dod re la'16 si sol la
    fad8 mi re4 mi re

    %55
    mi4. mi8 re2

    %56 Adagio
    mi1 mi2
    re1 re2
    dod1 dod2

    %59
    si1 si2
    la1 la2
    sold4 la la2. sold4

    %62
    la2 mi'1
    fad fad2
    sold1 la2~

    %65
    la la2. sold4
    la2 mi1
    re1 mi2~

    %68
    mi dod1~
    dod2 si si'4 la
    sold2 fad2. fad4

    %71
    sold \parenthesize (mi) si2. si4
    dod2 mi1~
    mi2 re1~

    %74
    re2 dod4 si la si
    dod2 si2. si4
    dod1 mi2\p~

    %77
    mi re1\parenthesize ~
    re2 dod4 si la si
    dod2 si2. si4

    %80
    dod1.

    %81 Vivace
    R1*43

    %124 Grave
    si4 dod si8 si4 lad8
    si4 dod re r8 fad
    sol2 fad~

    %127
    fad4 mi8 re mi4. mi8
    fad1

    %129 Allegro e spiccato
    la4 la fad la
    sol sol fad r
    la\p la fad la

    %132
    sol sol fad r
    la r la sol
    mi mi fad r

    %135
    R1*4
    r4 r8 mi fad mi fad re
    mi4 re mi la

    %141
    sold la la sold
    la r r2
    R1*3

    %146
    dod,4 si la dod
    si si la r
    dod\p si la dod

    %149
    si si la r\mbreak
    dod re dod la
    la sold la r

    %152
    re r8 mi mi4 la~
    la sol2 fad4
    mi2 fad4 r

    %155
    R1*4
    r2 r16 la fad re la re la fad
    re4 r r16 la'' fad re la re' la fad

    %161
    re4 r r16 la' si fad sol si la sol
    fad4 r\mbreak r16 la sol la re, si' la si
    la4 r r16 fad mi fad la, re dod re

    %164
    fad, fad' mi re dod re dod si la si la sol fad8 la'16 sol
    fad4 r si2
    la sol

    %167
    fad4 la fad la
    sol sol fad r
    R1*3

    %172
    la4 la fad la
    sol sol fad r
    la\p la fad la

    %175
    sol sol fad mi
    fad r r2

}


IIvlIIn = \relative do'' {

    re4. re8 dod2\fermata
    r r4 la
    re4. dod8 \stemUp si dod \stemNeutral re4

    %4
    dod re2 dod4
    re r8 si la2
    re8 dod si la sold4 mi'\mbreak

    %7
    fad2 sold8 la la8. sold16
    la4 r r2
    r4 la2 sol?4~

    %10
    sol fad mi4. fad8
    dod re re8. dod16 re4 r
    <<\stemDown si'2\\{s4 s\p}>> la2

    %13
    sol fad\mbreak
    mi re4 r
    re2 dod4 re~

    %16
    re dod re2

    %17 Allegro
    R1*3
    la4 r sol re'~
    re dod re la~

    %22
    la sold la r
    R1*3
    dod4 r\mbreak re la'~

    %27
    la sold la r
    la, re la4. la8
    si4. si8 dod4 r

    %30
    R1*4
    r2 dod4 r
    re la si4. si8

    %36
    dod4 re2 dod4~
    dod si2 la4~\mbreak
    la8 fad'16 mi re8 si dod fad16 mi re8 mi16 re

    %39
    dod4 re2 dod4
    re r r2
    R1*2

    %43
    la4 r sol re'~
    re dod re la~
    la sold la r\mbreak

    %46
    r re8 mi fad4 mi8. re16
    dod8 mi16 fad re8. dod16 re4 r
    la8 si16(dod) re2 r8 mi

    %49
    re4. la8 si4 la
    la la'2\p sol4~
    sol fad\mbreak mi4. mi8

    %52
    re4 sol, r si
    mi4. mi8 re16 mi fad mi re4~
    re8 dod re4 dod re~

    %55
    re dod re2

    %56 Adagio
    dod1 dod2~
    dod si4(la) si2~\mbreak
    si la4(sold) la2~

    %59
    la sold4(fad) sold2~
    sold fad4 mi fad2
    si si2. si4

    %62
    dod1 mi2~
    mi re1~
    re2 dod1

    %65
    si2 si2. si4\mbreak
    dod2 mi dod
    si1.~

    %68
    si2 la la
    re1 sold4 fad
    mi2 mi2. red4

    %71
    mi(la,) la2. sold4
    la1 mi2
    fad1 fad2

    %74
    sold la1~\mbreak
    la2 la2. sold4
    la1 mi2\p

    %77
    fad1 fad2
    sold la1~
    la2 la2. sold4

    %80
    la1.

    %81 Vivace
    R1*43

    %124 Grave
    r8 si4 lad8 si4 dod
    re8 si4 lad8 si4 fad'~
    fad mi2 re8 dod

    %127
    si2. si4
    lad1

    %129 Allegro e spiccato
    fad'4 mi re re
    re dod re r\mbreak
    fad\p mi re re

    %132
    re dod re r
    re dod re re
    re dod re r

    %135
    R1*4
    r4 r8 dod re dod re si
    dod4 re dod dod

    %141
    si dod si si\mbreak
    dod4 r r2
    R1*3

    %146
    mi4 mi dod la
    la sold la r
    mi'\p mi dod la

    %149
    la sold la r
    la sold la re
    si si dod r

    %152
    fad r8 mi mi4 re~
    re mi dod re~
    re dod re r

    %155
    R1*5
    r16 re, fad la re la re fad la4 r
    r16 la fad re la re' la fad re4 r

    %162
    r16 la' si fad\mbreak sol si la sol mi4 r
    r16 fad mi fad la, re dod re fad,4 r
    r4 r16 fad' mi re dod re dod si la8 fad'16 mi

    %165
    re4 la'2 sol4~\mbreak
    sol fad mi4. mi8
    fad4 mi re re

    %168
    re dod re r
    R1*3
    fad4 mi re re

    %173
    re dod re r
    fad\p mi re re
    re dod re dod

    %176
    re r r2

}


IIvlIIIn = \relative do'' {

    la4. la8 dod2\fermopz
    re4 la'8 sol fad mi re4~
    re8 mi fad4 si2

    %4
    la4 la, la4. la8
    la4 sol la2
    si8 dod mi la, mi'4. dod8\mbreak

    %7
    la4. re8 si dod mi8. mi16
    dod4 dod2 si4~
    si la si8 dod re mi

    %10
    la,4. re8 si4 dod8 re
    mi si mi la, la4 re
    <<\stemDown re2\\{s4 s\p}>> la4 r8 fad\mbreak

    %13
    sol4 mi'8 dod fad4. la8
    sol sol mi mi fad4 r
    re4. sol8 mi4 r8 re

    %16
    mi4. mi8 re2

    %17 Allegro
    R1*3
    la4 r re r
    la r8 la la4 r8 la\mbreak

    %22
    fad4 si8 mi dod4 r
    R1*3
    mi4 r re fad8 mi

    %27
    re4 mi8. mi16 dod4 r
    fad r la, r
    fad8 fad' mi4 dod r

    %30
    R1*4
    r2 mi4 r\mbreak
    re r re4 si8 mi

    %36
    dod4 r8 fad mi2
    fad r4 la
    fad16 sol la sol fad8 mi16 re dod4 r8 mi

    %39
    mi4 fad8 fad sol la la8. sol16
    fad4 r r2\mbreak
    R1*2

    %43
    la,4 r re r
    sol, r8 la la4. la8
    la re si4 la r

    %46
    la la4. re8 si4
    dod r fad4. sold8
    la4 r8 re, si4 r8 mi\mbreak

    %49
    la4. fad8 si,4 dod
    la8 si16\p (dod) re2 mi4~
    mi8 dod fad, la si4 la

    %52
    la sol r re'
    si r8 la fad4 la~
    la8 dod la2 r8 la

    %55
    la4. la8\mbreak fad2

    %56 Adagio
    la1 dod2
    re1 si2
    dod1 la2

    %59
    si1 mi2
    mi la, la
    mi' mi2. mi4

    %62
    dod2 mi dod
    fad1 re2
    sold mi1

    %65
    si mi2
    dod1 dod2\mbreak
    fad sold mi

    %68
    dod1 la2
    fad si4 la sold2
    si si2. si4

    %71
    sold la si2. mi4
    dod1 mi2
    la, re si

    %74
    sold? mi dod'
    la mi'2. mi4\mbreak
    dod1 mi2\p

    %77
    la, re dod
    sold mi dod'
    la mi'2. mi4

    %80
    dod1.

    %81 Vivace
    R1*43

    %124 Adagio
    re4 dod si8 re dod4
    si8 re dod4 si re
    re mi dod re~

    %127
    re si si2
    dod1

    %129 Allegro e spiccato
    re4 mi fad fad
    mi mi fad r
    re\p mi fad fad

    %132
    mi mi fad r
    fad mi re si
    la la fad r

    %135
    R1*4
    mi'4 mi la, la
    dod r dod la

    %141
    sold dod mi mi
    dod r r2
    R1*3

    %146
    la4 si dod mi
    re re dod r
    la\p si\mbreak dod mi

    %149
    re re dod r
    dod r mi r
    mi mi dod dod

    %152
    si r8 si dod4 re
    si mi2 re4
    mi2 re4 r

    %155
    R1*10
    fad8 sol la fad\mbreak re4 r8 mi
    la,4 re2 dod4

    %167
    re mi fad fad
    mi mi fad r
    R1*3

    %172
    re4 mi fad fad
    mi mi fad r
    re\p mi fad fad

    %175
    mi mi fad la
    fad r r2

}


IIvlaIn = \relative do' {

    fad4. fad8 la2\fermopz
    R1
    r4 re, re si8 re

    %4
    la la' la re, mi4. mi8
    re fad mi2 fad4
    si,2. dod4

    %7
    re la' r mi\mbreak
    mi r r2
    dod4 re2 re4

    %10
    r la mi'2
    r4 mi re2
    re4 r re\p r

    %13
    sol r si, re
    mi4. la,8 la4 r
    re si dod4. la8\mbreak

    %16
    mi'4 la, la2

    %17 Allegro
    R1*3
    fad'4 r sol r
    mi2 re4. mi8

    %22
    fad4 mi mi r
    R1*3
    la4 r la fad~

    %27
    fad r8 si dod4. si8\mbreak
    la4 la8 sold dod4 r8 mi,
    si'4. si8 la4 r

    %30
    R1*4
    r2 la4 r
    la8 sol? fad2 mi4

    %36
    mi fad sol r8 dod,
    fad4 r8 re mi4 r8 re\mbreak
    re4. si8 mi fad16 sol la8 mi

    %39
    la4 la sol8 re mi4
    re r r2
    R1*2

    %43
    fad4 r sol r
    mi2 re4. mi8
    fad fad mi4 mi r

    %46
    fad4. mi8\mbreak re4 mi~
    mi r8 mi16 la, la4 r
    la'8 mi fad4 re sol8. la16

    %49
    la4. la8 mi2
    re4 r8 re\p si4 r8 mi
    mi4 la mi la,

    %52
    la si\mbreak r sol'
    sol r8 la la fad fad4~
    fad8 la fad la mi dod fad4

    %55
    r8 mi mi la, la2

    %56 Adagio
    mi'2 la1~
    la2 fad re
    mi dod1\mbreak

    %59
    fad2 mi1~
    mi2 fad1
    r2 mi mi

    %62
    mi la1~
    la2 si1
    sold mi2

    %65
    fad mi1
    r2 mi mi
    fad si, mi~

    %68
    mi mi fad~\mbreak
    fad sold1
    si2 si1

    %71
    si2 r mi,~
    mi dod1
    la si2

    %74
    si dod1
    r2 mi2. mi4
    mi2 dod1\p

    %77
    la si2
    si dod1
    r2 mi2. mi4\mbreak

    %80
    mi1.

    %81 Vivace
    R1*43

    %124 Adagio
    fad4 r fad r
    fad r8 fad fad4 r
    re r fad r

    %127
    sol1
    dod,

    %129 Allegro e spiccato
    la'4 mi la la
    mi mi re r
    la'\p mi la la

    %132
    mi mi re r
    fad sol fad si
    mi, mi re r

    %135
    R1*4
    mi4 la la fad
    la r mi mi\mbreak

    %141
    mi mi mi mi
    mi r r2
    R1*3

    %146
    mi4 mi mi mi
    fad mi mi r
    mi4\p mi mi mi

    %149
    fad mi mi r
    la r mi la
    mi mi\mbreak mi r8 mi

    %152
    si2 la4 r8 la'
    si2 la
    mi4 la fad r

    %155
    R1*10
    re4 r re r
    re r re8 sol mi4\mbreak

    %167
    re r la' la
    mi mi re r
    R1*3

    %172
    fad4 la la la
    mi mi re r
    fad\p la la la

    %175
    mi mi re mi
    re r r2

}

IIvlaIIn = \relative do' {

    la4. la8 la2\fermopz
    R1
    r4 la si2

    %4
    dod4 r8 la la2
    la4 mi'8 si dod4 la
    sold8 mi r fad sold4 la

    %7
    fad8 sol= la fad\mbreak mi mi' mi8. si16
    dod4 r r2
    mi4 la,8 re si4 r

    %10
    r re2 mi8 la,
    la si la4 la4. fad8
    <<\stemDown sol4.\\{s4 s8\parenthesize\p}>> la8 la4 re

    %13
    si r si r\mbreak
    si4 la la r
    si2. la4

    %16
    la2 la

    %17 Allegro
    R1*3
    re4 r re r
    si la la2

    %22
    re4 si la r
    R1*3
    dod4 r re4. mi8\mbreak

    %27
    fad4 r8 mi  mi2
    fad8 mi re sold mi2
    re4 mi mi r

    %30
    R1*4
    r2 dod4 r
    la4. mi'8 si2

    %36
    la r
    r mi'4. la,8
    re2\mbreak r4 re8 si

    %39
    mi4 re si8 la la4
    la r r2
    R1*2

    %43
    la4 r si r
    si la la2
    re8 re mi4 dod r

    %46
    la4. dod8\mbreak si4 r8 mi
    mi4 r la,4. si8
    dod4 r re si8. la16

    %49
    la4. la8 sol4 la~
    la r re\parenthesize \p si
    la4. la8 sol4 r8 la

    %52
    la4 re r re\mbreak
    r8 mi la,8. la16 la4 r
    la4. la8 la2~

    %55
    la la

    %56 Adagio
    la1.
    la2 r si
    sold la1

    %59
    re si2
    mi r re4 dod\mbreak
    si1.

    %62
    la
    la2 fad1
    mi1.

    %65
    re2 si'2. si4
    la1.
    r2 si si

    %68
    dod1 dod2
    re1 mi2~
    mi fad2. fad4

    %71
    mi1 si2
    la1 la2\mbreak
    fad1.

    %74
    mi
    r2 si' si
    la la1\parenthesize \p

    %77
    fad1.
    mi
    fad2 si2. si4

    %80
    la1.

    %81 Vivace
    R1*43

    %124 Adagio
    si8 re fad4 re fad
    re fad re r
    re r dod r

    %127
    r si2 si4
    fad1

    %129 Allegro e spiccato
    la4 la la la
    si la la r
    la\p la la la\mbreak

    %132
    si la la r
    fad' r fad re
    la la la r

    %135
    R1*4
    mi'4 mi re re,8 fad
    mi4 sold mi dod'

    %141
    si la si si
    la r r2
    R1*3\mbreak

    %146
    la4 r la r
    si si mi r
    la,\p r la r

    %149
    si si mi r
    dod si la fad
    si si la dod

    %152
    re r8 si dod4 fad,8 re'16 dod
    si2\mbreak dod4 la
    la2 la4 r

    %155
    R1*10
    la4 r si r
    la r si r8 la

    %167
    la4 mi la la
    si la la r
    R1*3\mbreak

    %172
    la4 mi la la
    si la la r
    la\p mi la la

    %175
    si la la la
    la r r2

}

IIvcn = \relative do {

    re4. re8 la2\fermopz
    R1
    r4 fad' sol2

    %4
    la4 re, la'4. sol8
    fad re mi re dod la re dod
    si la mi' fad\mbreak mi re dod la

    %7
    re mi fad re mi la, mi' mi,
    la si dod la si la si sol'
    la sol fad re sol la si dod

    %10
    re dod re fad, sol fad mi re\mbreak
    la' sol la la, re mi fad re
    sol la\p si dod re dod re re,

    %13
    mi re dod la si la si fad'
    sol mi la la, re4 r
    si sol la2~\mbreak

    %16
    la re

    %17 Allegro
    re'8 dod si la si la sol fad
    sol mi la la, re dod re dod
    si dod re mi16 fad sol8 mi la la,

    %20
    re' dod si la\mbreak si la sol fad
    sol mi la la, re mi fad dod
    re si mi mi, la' sol fad mi

    %23
    fad mi re dod re si mi mi,
    la' mi' re dod\mbreak si dod re si
    dod la dod la re si mi mi,

    %26
    la sol fad mi fad mi re dod
    re si mi mi, la' si la sol
    fad dod' re si\mbreak dod si dod la

    %29
    re si mi mi, la sol fad mi
    fad mi re dod re si mi mi,
    la' sol fad re mi re mi la,

    %32
    re' dod re si\mbreak dod si dod la
    si re,16 mi fad8 sol la sol fad dod
    re la mi' mi, la' sol fad mi

    %35
    fad mi re dod re si mi mi,
    la' sol fad re\mbreak sol mi la la,
    re' dod re si dod si dod fad,

    %38
    re re16 mi fad8 sol la re,16 mi fad8 sol
    la sol fad re sol re la' la,
    re' dod si la\mbreak si la sol fad

    %41
    sol mi la la, re dod re dod
    si dod re mi16 fad sol8 mi la la,
    re' dod si la si la sol fad

    %44
    sol mi la la,\mbreak re mi fad dod
    re si mi mi, la' sol fad mi
    fad mi re dod re si mi mi,

    %47
    \stemUp la' la, re la' \stemNeutral re dod re si
    la sol fad re\mbreak sol la si dod
    re dod re fad, sol mi la la,

    %50
    re mi\p fad re sol la si dod
    re dod re fad, sol mi la la,
    re' dod si la si la sol fad\mbreak

    %53
    sol mi la la, re4 r
    re8 la' re re, la' la, re re'
    la4 la, re,2

    %56 Adagio
    la'1 la'2
    fad sold1
    mi2 fad1

    %59
    re2 mi1\mbreak
    dod2 re1
    mi2 mi,1

    %62
    la2 dod1
    re1.
    mi1 la,2

    %65
    re mi mi,
    la1 la'2~
    la sold1

    %68
    la la2\mbreak
    si1 mi,2~
    mi si' si,

    %71
    mi mi1
    la, dod2
    re1.

    %74
    mi1 dod2
    re mi mi,
    la1 dod2\p

    %77
    re1.\mbreak
    mi1 dod2
    re mi mi,

    %80
    la1.

    %81 Vivace
    r4 r8 re16 mi fad8 re r fad16 sold
    la8 la, r si16 dod re8 sol la la,\mbreak
    re 4r r r8 re16 mi

    %84
    fad8 re r fad16 sold la8 la, r si16 dod
    re8 sol la la, re4 r
    r2 r4 r8 re16 mi\mbreak

    %87
    fad8 re r fad16 sold la8 la, r si16 dod
    re8 sol la la, re4 r
    r2 r4\clef tenor \key re\major r8 la'16 si\mbreak

    %90
    dod8 la r dod16 red mi8 mi, r fad16 sold
    la8 re mi mi, la4 r
    r r8 la16 si dod8 la r dod16 red\mbreak

    %93
    mi8 mi, r fad16 sold la8 re mi mi,
    la4 r r2
    r4 r8 la16 si dod8 la r dod16 red

    %96
    mi8 mi, r fad16 sold\mbreak la8 re mi mi,
    la4 r r2
    dod8 la r dod16 red mi8 mi, r fad16 sold?

    %99
    la8 re mi mi, la4 r\clef bass \key re\major
    r2 r4 r8 re,16 mi
    fad8 re r fad16 sold la8 la, r si16 dod

    %102
    re8 sol la la, re4 r
    r r8 re16 mi\mbreak fad8 re r fad16 sold
    la8 la, r si16 dod re8 sol? la la,

    %105
    re4 r r r8 sol16 la
    si8 sol r si16 dod re8 re, r mi16 fad\mbreak
    sol8 do re re, sol4 r

    %108
    r r8 sol16 la si8 sol r si16 do?
    re8 re, r mi16 fad sol8 do re re,
    sol4 r r r8 re16 mi\mbreak

    %111
    fad8 re r fad16 sold la8 la, r si16 dod?
    re8 sol? la la, re4 r
    r r8 la'16 si dod8 la r dod16 re\mbreak

    %114
    mi8 mi, r fad16 sold la8 re mi mi,
    la4 r r r8 re,16 mi
    fad8 re r fad16 sold la8 la, r si16 dod\mbreak

    %117
    re8 sol la la, re4 r
    r2 r4 r8 re16 mi
    fad8 re r fad16 sold? la8 la, r si16 dod

    %120
    re8 sol la la, re4 r8 re16 mi\mbreak
    fad8 re r fad16 sold la8 la, r si16 dod
    re8 sol la la, re4 la

    %123
    re, r r2

    %124 Adagio
    si''4 fad si, fad'
    si fad\mbreak si, r
    si dod lad si8 lad

    %127
    sol1
    fad

    %129 Allegro e spiccato
    re'4 dod re fad,
    sol la re r
    re\p dod re fad,

    %132
    sol la re r
    re mi fad sol
    la la, re r

    %135
    la8 la' dod la re dod re si
    dod la dod la re dod re si
    dod4 si dod re

    %138
    mi la,\mbreak mi mi,
    la la' re, re
    la si dod la

    %141
    mi' la, mi' mi,
    la r la dod
    re si la re

    %144
    dod fad mi la
    mi mi,\mbreak la r
    la' sold la dod,

    %147
    re mi la, r
    la'\p sold la dod,
    re mi la, r

    %150
    la si dod re
    mi mi, la la'~\mbreak
    la sold la fad

    %153
    sol2 la4 re,
    la' la, re8 mi fad re
    dod re mi dod re mi fad re

    %156
    sol la si dod re dod re fad,\mbreak
    sol mi la la, re mi fad re
    sol la si dod re dod re fad,

    %159
    sol mi la la, re2~
    re1~
    re1~

    %162
    re1~
    re1~
    re1~\mbreak

    %165
    re8 mi fad re sol la si dod
    re dod re fad, sol mi la la,
    re4 dod re fad,

    %168
    sol la re r
    dod re mi8 re mi dod
    re dod re si\mbreak dod la re fad

    %171
    sol mi la la, re4 r
    re dod re fad,
    sol la re r

    %174
    re\p dod re fad,
    sol la re la
    re r r2



}

IIbcn = \relative do {

    re4. re8 la2_\fermopz
    R1
    r4 fad' sol2

    %4
    la4 re, la'4. sol8
    fad re mi re dod la re dod
    si la mi' fad\mbreak mi re dod la

    %7
    re mi fad re mi la, mi' mi,
    la si dod la si la si sol'
    la sol fad re sol, la si dod

    %10
    re dod re fad sol fad mi re\mbreak
    la' sol la la, re mi fad re
    sol, la\p si dod \stemDown re dod re re\stemNeutral

    %13
    mi re dod la si la si fad'
    sol mi la la, re4 r
    si sol la2~\mbreak

    %16
    la re

    %17 Allegro
    re'8 dod si la si la sol fad
    sol mi la la, re dod re dod
    si dod re mi16 fad sol8 mi la la,

    %20
    re' dod si la\mbreak si la sol fad
    sol mi la la, re mi fad dod
    re si mi mi, la' sol fad mi

    %23
    fad mi re dod re si mi mi,
    la mi' re dod\mbreak si dod re si
    dod la dod la re si mi mi

    %26
    la sol fad mi fad mi re dod
    re si mi mi, la' si la sol
    fad dod' re si\mbreak dod si dod la

    %29
    re, si mi mi la sol fad mi
    fad mi re dod re si mi mi,
    la' sol fad re mi re mi la

    %32
    re, dod re si\mbreak dod si dod la
    si re16 mi fad8 sol la sol fad dod
    re la mi' mi, la' sol fad mi

    %35
    fad mi re dod re si mi mi,
    la' sol fad re\mbreak sol mi la la,
    re dod re si dod si dod fad

    %38
    re re16 mi fad8 sol la re,16 mi fad8 sol
    la sol fad re sol re la' la,
    re' dod si la\mbreak si la sol fad

    %41
    sol mi la la, re dod re dod
    si dod re mi16 fad sol8 mi la la,
    re' dod si la si la sol fad

    %44
    sol mi la la,\mbreak re mi fad dod
    re si mi mi, la' sol fad mi
    fad mi re dod re si mi mi,

    %47
    la' la, re la'  re dod re si
    la sol fad re\mbreak sol, la si dod
    re dod re fad sol mi la la,

    %50
    re mi\p fad re sol, la si dod
    re dod re fad sol mi la la,
    re' dod si la si la sol fad\mbreak

    %53
    sol mi la la, re4 r
    re8 la' re re, la' la, re4
    la la re,2

    %56 Adagio
    la'1 la'2
    fad sold1
    mi2 fad1

    %59
    re2 mi1\mbreak
    dod2 re1
    mi2 mi,1

    %62
    la2 dod1
    re1.
    mi1 la,2

    %65
    re mi mi,
    la1 la'2~
    la sold1

    %68
    la la2\mbreak
    si1 mi,2~
    mi si' si,

    %71
    mi mi1
    la, dod2
    re1.

    %74
    mi1 dod2
    re mi mi,
    la1 dod2\p

    %77
    re1.\mbreak
    mi1 dod2
    re mi mi,

    %80
    la1.

    %81 Vivace
    re4 r8 re16 mi fad8 re r fad16 sold
    la8 la, r si16 dod re8 sol, la4\mbreak
    re r r r8 re16 mi

    %84
    fad8 re r fad16 sold la8 la, r si16 dod
    re8 sol, la4 re r
    re si mi8 la, r re16 mi\mbreak

    %87
    fad8 re r fad16 sold la8 la, r si16 dod
    re8 sol, la4 re r8 dod
    re8. dod16 si8. mi16 la,4 \clef tenor \key re\major r8 la'16 si\mbreak

    %90
    dod8 la r dod16 red mi8 mi, r fad16 sold
    la8 re, mi4 la r
    r r8 la16 si dod8 la r dod16 red\mbreak

    %93
    mi8 mi, r fad16 sold la8 re, mi4
    la r r2
    r4 r8 la16 si dod8 la r dod16 red

    %96
    mi8 mi, r fad16 sold\mbreak la8 re, mi4
    la r r r8 la16 si
    dod8 la r dod16 red mi8 mi, r fad16 sold?

    %99
    la8 re, mi4 la r\clef bass \key re\major
    la8. fad16 sol8. la16 re,4 r8 re16 mi
    fad8 re r fad16 sold la8 la, r si16 dod

    %102
    re8 sol, la4 re r
    r r8 re16 mi\mbreak fad8 re r fad16 sold
    la8 la, r si16 dod re8 sol,? la4

    %105
    re r r r8 sol16 la
    si8 sol r si16 dod re8 re, r mi16 fad\mbreak
    sol8 do, re4 sol, r

    %108
    r r8 sol'16 la si8 sol r si16 do?
    re8 re, r mi16 fad sol8 do, re4
    sol8 re sol, la re4 r8 re16 mi\mbreak

    %111
    fad8 re r fad16 sold la8 la, r si16 dod?
    re8 sol,? la4 re r \clef tenor \key re\major
    r r8 la'16 si dod8 la r dod16 re\mbreak

    %114
    mi8 mi, r fad16 sold la8 re, mi4
    la \clef bass \key re\major mi8. la,16 re4 r8 re16 mi
    fad8 re r fad16 sold la8 la, r si16 dod\mbreak

    %117
    re8 sol, la4 re r
    r2 r4 r8 re16 mi
    fad8 re r fad16 sold? la8 la, r si16 dod

    %120
    re8 sol, la4 re r8 re16 mi\mbreak
    fad8 re r fad16 sold la8 la, r si16 dod
    re8 sol, la4 re la

    %123
    re, r r2

    %124 Adagio
    si''4 fad si, fad'
    si fad\mbreak si, r
    si dod lad si8 lad

    %127
    sol1
    fad

    %129 Allegro e spiccato
    re'4 dod re fad,
    sol la re r
    re\p dod re fad,

    %132
    sol la re r
    re mi fad sol
    la la, re r

    %135
    la' r8 la re4 r8 si
    la4 r8 la re,4 r8 si
    dod4 si dod re

    %138
    mi la\mbreak mi mi,
    la la' re, re
    la si dod la

    %141
    mi' la, mi' mi,
    la r la dod
    re si la re

    %144
    dod fad mi la
    mi mi,\mbreak la r
    la' sold la dod,

    %147
    re mi la, r
    la'\p sold la dod,
    re mi la, r

    %150
    la si dod re
    mi mi, la la'~\mbreak
    la sold la fad

    %153
    sol2 la4 re,
    la' la, re8 mi fad re
    dod re mi dod re mi fad re

    %156
    sol, la si dod re dod re fad\mbreak
    sol mi la la, re mi fad re
    sol, la si dod re dod re fad

    %159
    sol mi la la, re2~
    re1~
    re1~

    %162
    re1~
    re1~
    re1~\mbreak

    %165
    re8 mi fad re sol, la si dod
    re dod re fad sol mi la la,
    re4 dod re fad,

    %168
    sol la re r
    dod re mi8 re mi dod
    re dod re si\mbreak dod la re fad

    %171
    sol mi la la, re4 r
    re dod re fad,
    sol la re r

    %174
    re\p dod re fad,
    sol la re la
    re r r2

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s
    s4 <6> <9> <8>
    <7> s <4> <3>8 <6>
    <6>4 <5>8 <6> <6 5->2
    <6+>4 <_+> <_+> <6>
    <9> <6> <7 _+> <4>8 <3+>
    s4 <6> <9 5> <8 6>
    <9> <6> <9 8> <6>
    <4> <3>8 <6> <6 5>4 <6>
    s8 <6 5> <4> <3> s4 <6>
    <9> <6> <4> <3>
    <9 _->8 <_-> s <5> <4> <5> <3> <6>
    <5>1
    s4 <6> <9 7 3> <8 6 4>
    <4> <3> s2

    %17 Allegro
    s2 <6>
    <6 5>2 <6>4 <6>
    <5>8 <6> s4 <6 4>2
    s <6>
    <6 5>2 s4 <6>8 <6>
    <6 5>4  <_+> s2
    <6> <6 5>
    <_->4 <6> s2
    s <6 5>4 <_+>
    s2 <6>
    <5>4 <_+> s8 <6> <6> <6>
    <6>4 s8 <6+> <6>2
    <6 5>4 <_+> s2
    <6> <5 6>4 <_+>
    s <6> <7> <6>
    <7> <6> <7> <6>
    s8 <5> <6> <6> s4 <6>8 <6>
    s8 <5 6> <_+>4 s2
    <6> <5 6>4 <_+>
    s <6> <6 5>2
    <7>4 <6> <7> <6>8 <6>
    s4 <6>8 <6> s4 <6>8 <6>
    s4 <6> <5> s
    s2 <6>
    <6 5> s4 <6>8 <6>
    <5>8 <6> s4 <6 5>2
    s <6>
    <6 5> s4 <6>8 <6>
    <6 5>4 <_+> s2
    <6> <6 5>4 <_+>
    s2 s4 s8 <6+>
    s4 <6> <9 8> <8>
    <4> <3>8 <6> <6 5>2
    s4 s8 <6> <8 6>4 <6>
    <4> <3>8 <6> <6 5>2
    s <6>
    <6 5>1
    s
    <4>4 <3> s2

    %56 Adagio
    s1.
    <6 5>2 <5->1
    <6 5 _+>2 <5>1
    <6 5>2 <_+>1
    <5 6 _+>1.
    <_+>2 <4> <3+>
    s <6> s
    <9 5> <8 6> s
    <7 _+> <6> s
    <5> <4> <3+>
    s1.
    <4>2 <5-> <6>
    <9> <8> <6>
    <9 5> <8 6> <_+>
    <_+> <4> <3+>
    <_+> <4> <3+>
    s s <6>
    <9 5> <8 6> s
    <7 _+> <6> <6>
    <6 5> <4> <3+>
    s1 <6>2
    <9 5> <8 6> s
    <7 _+> <6> <6>
    <6 5> <4> <3+>
    s1.

    %81 Vivace
    s2 <6>4 s8 <6>
    s4 s8 <6> s <5> s4
    s1
    <6>4 s8 <6> s4 s8 <6>
    s <5> s4 s2
    s4 <7>8 <_+> s2
    <6>4 s8 <6> s4 s8 <6>
    s <6 5> s2 s8 <6>
    s1
    <6>4 s8 <6> s4 s4
    s8 <6 5> <_+>4 s2
    s <6>4 s8 <6>  %% fine pagina
    s4 s8 <6> s8 <6 5> <4> <3>
    s1
    s2 <6>4 s8 <6>
    s4 s8 <6> s <6 5> <_+>4
    s1
    <6>4 s8 <6> <_+>4 s8 <6>
    s <6 5> <_+>4 s2
    s8. <6>16 <6 5>4 s2
    <6> s4 s8 <6>
    s <6 5> <4> <3> s2
    s2<6>4 s
    s4 s8 <6> s <6 5> <4> <3>
    s1
    s2 s4 s8 <6->
    s8 <6 5> s4 s2
    s2 <6>4 s8 <6>
    s4 s8 <6> s <6 5> s4
    s <6 5> s2
    <6>2 s4 s8 <6>
    s4 <4>8 <3> s2
    s1
    <_+>2 s8 <6 5> <_+>4
    s <7> s2
    <6>4 s2 s8 <6>
    s8 <6 5> s4 s2
    s1
    <6>4 s8 <6> s4 s8 <6>
    s <6 5> s4 s2  %% fine pagina
    <6>1
    s8 <6 5> s4 s2
    s1

    %124 Grave
    s4 <4>8 <3+> s4 <4>8 <3+>
    s4 <4>8 <3+> s2
    <6 5>2 <6 5>
    <7> <6>
    <_+>1

    %129 Allegro e spiccato
    s4 <6> s <6>
    <6 5> <7> s2
    s4 <6> s <6>
    <6 5> <7> s2\mbreak
    s4 <6> <6> s
    <4>4 <3+> s2
    s4 s2 s8 <6+>
    s2 s4 s8 <6+>
    <6>4 <6+> <6> <6 5>
    <_+>2 <4>4 <3+>
    s1
    s4 <6> <6+> s
    <_+> s <4> <3+>
    s2 s4 <6>
    s <6+> s2
    <6>4 <6> <_+> s
    <4> <3+> \mbreak s2
    s4 <6> s2
    <6 5>4 <7 _+> s2 s2 s4 <6>
    <6 5> <7 _+> s2
    s4 <6+> <6> <6 5>
    <4> <3+> s2
    <6 4 2>4 <5->8 <6> s4 <6>
    <9 7> <8 6> <7> s
    <4> <3> s <6>
    <6>2 s4 <6>
    <9> <6> <4> <3>8 <6>
    <6 5>2 s4 <6>
    <9 8> <6> <4> <3>8 <6>
    <6 5>1
    s1*5
    s4 <6> <9> <6>
    <4> <3>8 <6> s2
    s4 <6> s <6>
    <6 5> <7> s2
    <6> <7>4 <6>
    <7> <6>\mbreak <6> <6>
    <6 5> <4>8 <3> s2
    s4 <6> s <6>
    <6 5> <7> s2
    s4 <6> s <6>
    <6 5> <7> s2
    s1

}


forma = {

    \time 4/4
    \key re\major
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\huge "Adagio"
    \tempo 4 = 50
    s1*16
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "Allegro"
    \time 4/4
    \tempo 2 = 55
    s1*39
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\huge "Adagio"
    \time 3/2
    \tempo 1 = 40
    s1.*25
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\huge "Vivace"
    \time 4/4
    \tempo 2 = 55
    s1*43\break
    \bar "||"
    \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\huge "Adagio"
    \time 4/4
    \tempo 4 = 50
    s1*5
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "Allegro e spic[c]ato"
    \time 4/4
    \tempo 2 = 80
    s1*48
    \bar "|."

}


IItp= {
    \IIglobal
    <<\IItpn \forma>>

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
        title = \markup\smaller\center-column {"Sinfonia Settima - Op. III""a 6. tre Violini, Alto, Tenore e Violoncello"}
        composer = \markup \center-column{"  ""G. Bononcini (1670 - 1747)"}
    }

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino Terzo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl3"
                    \IvlIII
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
                \set Staff.instrumentName = \markup \center-column{"Violone, Tiorba"\vspace #-0.3"Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
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

\bookpart {

    \header {
        title = \markup\smaller\center-column {"Sinfonia ottava - Op. III"\smaller"a 6. Tromba, due Violini, Alto, Tenore e Violoncello,"\vspace # -0.2 \smaller"con il terzo Violino, se piace"}
        composer = \markup \center-column{"  ""G. Bononcini (1670 - 1747)"}
    }

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Tromba"}
                \set Staff.midiInstrument = #"trumpet"
                \set Staff.shortInstrumentName = "tp"
                \IItp
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino Terzo"}
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
                \set Staff.instrumentName = \markup \center-column{"Violone, Tiorba"\vspace #-0.3"Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 15.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
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
