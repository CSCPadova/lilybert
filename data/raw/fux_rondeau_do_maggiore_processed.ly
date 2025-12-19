\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { soli }

solo = ^\markup \italic { solo }

tu = _\markup \italic "tutti"

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
#(let ((m (make-articulation "stopped")))
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
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }

Iglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}

Ivlpn = \transpose la do'{

    \relative do'' {
        \key la\major
        r4 r
        R2.*7
        r4 dod mi
        si si mi

        %10
        la la8 sold la fad\mbreak
        si la sold fad mi re
        dod4 dod8 re mi fad

        %13
        si, dod re mi fad mi
        re dod si2
        la r4

        %16
        R2.*7 %%%%%%%%%%% corretto 7 invece di 6
        r4 la8 si dod re
        mi  red mi fad sold mi\mbreak

        %25
        la sold la red, mi fad
        sold la sold fad mi re
        dod red mi fad sold la

        %28
        si4. mi,8 la4
        sold8 fad fad4. mi8
        mi4 r r

        %31
        R2.*7\mbreak %%fine terza riga OK
        r4 dod dod
        fad re4. mi8

        %40
        dod4 si4. dod8
        la4. sold8 la si
        dod4 dod dod

        %43
        fad re4. mi8
        dod4 fad8 sold la4~\mbreak
        la8 sold sold2

        %46
        fad r4
        R2.*7
        r8 la mi la,16 si dod re mi fad

        %55
        mi8 si' sold mi16 fad sold la si sold
        la8 la,16 si dod8 fad,16 sold la si dod re\mbreak
        mi8 si'16 la sold fad  mi re dod8 mi

        %58
        fad la16 sold fad mi re dod si8 re
        mi [la, si dod] re8 dod16 si
        dod8 si si2

        %61
        la2 r4
        R2.*7\mbreak
        r16 la' sold la mi dod si dod la dod si la

        %70
        si mi re mi si sold fad sold mi sold fad mi
        la dod si dod la fad' mi fad dod la' fad la
        sold si la si sold fad mi red\mbreak mi si dod re?

        %73
        dod la' sold la mi dod si dod la dod re mi
        fad re dod re la fad mi fad re la' si dod
        re4 dod8 si mi4

        %76
        dod si4. la8\mbreak
        mi'2 r4
        R2.*7

        %85
        \tuplet 3/2{
            mi8 fad mi la [la,16 si dod re] mi8 la, dod
            si dod si mi [mi,16 fad sold la] si8 sold si
            la si la re [re,16 mi fad sold] la8 fad la\mbreak

            %88
            sold la sold si [dod si] mi re mi
            dod re dod la' [la,16 si dod re] mi8 fad mi
            sold la sold si [mi,16 fad sold la] si8 sold si

            %91
            la sold la fad [re16 mi fad sold] la8 fad la\mbreak
            sold fad sold mi [re mi] si la si
        }

        %93
        dod2 r4
        R2.*7
        r4 dod4. fad8

        %102
        si,4 si4. mi8
        la,4 la4. si8
        sold16 mi' re mi dod si la si sold8 mi'\mbreak

        %105
        dod4 dod4. fad8
        si,4 si4. mi8
        la,4 la4. si8

        %108
        sold dod fad,2
        mi4 r r
        R2.*7\mbreak

        %117
        r8 dod 'fad la sold fad
        sold dod, sold la si dod
        la fad' dod re mi fad

        %120
        re dod si4. la16 si
        dod4. sold8 la4
        re8 dod si2\mbreak

        %123
        la8 dod fad la sold fad
        sold dod, sold la si dod
        la fad' dod red mi fad

        %126
        red si' fad sold  la si
        sold fad fad2
        mi4 si dod8 re\mbreak

        %129
        mi4. mi8 re dod
        re4. re8 dod si
        dod4 si la

        %132
        sold r r
        R2.*7
        la16 mi fad sold la si dod re mi dod re mi\mbreak

        %141
        fad sol la sol fad mi re fad mi re dod mi
        re fad, sold la si dod re dod si re dod si
        mi re dod si la mi' dod si la sold fad mi\mbreak

        %144
        fad la si dod re fad mi re mi sol fad mi
        re dod si dod re mi fad sol fad si la sol
        fad si la sol fad mi re dod si re mi fad\mbreak

        %147
        sol8 dod, dod2
        si8 si16 dod re8 re re mi16 re
        dod8 dod16 si dod8 dod dod re16 mi

        %150
        si8 mi la[la] la si16 la
        sold8 si, mi[mi] mi fad16 mi\mbreak
        re8 dod si4. la8

        %153
        sold!4 r r
        R2.*7
        la16 si dod re mi8 fad16 sold la sold la si

        %162
        sold mi si' la sold fad mi re mi re dod si\mbreak
        dod si la si dod la' sold fad mi dod re mi
        fad sol la sol fad mi re dod re dod si la

        %165
        sold si dod red mi sold fad mi red si dod red\mbreak
        mi red mi fad sold fad sold la si la sold fad
        sold fad mi re dod4 mi

        %168
        si4. s8 mi4
        la,4. dod8 re4
        fad si,8 dod re mi\mbreak

        %171
        dod4 dod mi
        si4. si8 mi4
        la, la'8 sol fad mi

        %174
        re dod si2
        la4\fermopz

    }

}

Ifgn = \relative do {

    do'4 mi,
    sol2 sol4
    la do8 sib la sol
    fa4 sol sol,

    %4
    do do' mi,\mbreak
    sol2 sol4
    la4. sol8 fa4

    %7
    fa sol sol,
    do do'2
    si2.

    %10
    la
    sol
    do,4. re8 mi fa

    %13
    sol4 la8 sol fa4~
    fa sol sol,\mbreak
    do4 do8 re mi fa

    %16
    sol2 sol4
    la8 si do sib la sol
    fa4 sol sol,

    %19
    do4. re8 mi fa
    sol2 sol4
    la4. sol8 fa4~

    %22
    fa sol sol,\mbreak
    do4 do'2
    si2.

    %25
    la
    sol
    do

    %28
    si2 la4
    sol re2
    sol,4  do8 re mi fa

    %31
    sol2 sol4
    la4 do8 sib la sol
    fa4 sol sol,

    %34
    do4. re8 mi fa
    sol2 sol4
    la4. sol8 fa4~

    %37
    fa sol sol,\mbreak
    do2.
    la4 re si

    %40
    do si sold
    la sol! fa\mbreak
    mi2 do'4

    %43
    la re si
    do4. si8 la4
    re mi2

    %46
    la,8 si do re mi fa
    sol2 sol4
    la do8 sib la sol

    %49
    fa4 sol sol,
    do4. re8 mi fa\mbreak
    sol2 sol4

    %52
    la4. sol8 fa4~
    fa sol sol,
    do2.

    %55
    si
    la
    sol2 do4

    %58
    fa,2 sol8 fa
    mi2 re4
    do8 fa sol2

    %61
    do4. re8 mi fa\mbreak
    sol2 sol4
    la do8 sib la sol

    %64
    fa4 sol sol,
    do do mi
    sol2 sol4

    %67
    la4. sol8 fa4~
    fa sol sol,
    do2.

    %70
    si
    la
    sol\mbreak

    %73
    do
    fa
    re4 sol mi

    %76
    do si la
    sol do8 re mi fa
    sol2 sol4

    %79
    la do8 sib la sol
    fa4 sol sol,
    do4. re8 mi fa\mbreak

    %82
    sol4. sol8 sol4
    la4. sol8 fa4~
    fa sol sol,

    %85
    do2.
    si
    la

    %88
    sol
    do
    si

    %91
    la
    sol
    do8 si do re mi fa\mbreak

    %94
    sol2 sol4
    la do8 sib la sol
    fa4 sol sol,

    %97
    do8 si do re mi fa
    sol2 sol4
    la4. sol8 fa4~

    %100
    fa sol sol,
    do16 do re mi fa sol la si do8 si16 la
    si si, do re mi fad sol la si8 la16 sol

    %103
    la la, si do re mi fa sol la8 sol16 fad
    sol sol, la si do re mi fa sol8 sol,\mbreak
    do8 re16 mi fa sol la si do8 si16 la

    %106
    si si, do re mi fad sol la si8 la16 sol
    la la, si do re mi fa sol la8 sol16 fa
    sol8 do, re4 re,

    %109
    sol4 do8 re mi fa
    sol2 sol4
    la do8 sib la sol

    %112
    fa4 sol sol,
    do8 si do re mi fa
    sol2 sol4

    %115
    la4. sol8 fa4~\mbreak
    fa sol sol,
    do la2

    %118
    sold2.
    la4 dod2
    re8 mi fa2

    %121
    mi la4
    fa sol sol,
    do la2

    %124
    sold2.\mbreak
    la4 dod2
    re4 fad2

    %127
    sol8 do, re2
    r4 sol fa
    mi si' dod8. si32 dod

    %130
    re8 re, la'4 si8. la32 si
    do8 do, si si' la fad
    sol sol, do re mi fa?

    %133
    sol2 sol4\mbreak
    la do8 sib la sol
    fa4 sol sol,

    %136
    do8 si do re mi fa
    sol2 sol4
    la4. sol8 fa4~

    %139
    fa sol sol,
    do2.
    fa2 mi4\mbreak

    %142
    re2.
    mi
    fa2 mi4

    %145
    re2.
    fa2 sib4
    sol la2

    %148
    r8 re, re' do la si
    do do, do' do do[re16 do]
    si8 si la[la] la si16 la

    %151
    sol8 fa mi re dod[la]\mbreak
    re mi fa4 re
    sol8 sol, do re mi fa

    %154
    sol2_\markup\italic"4 measures missing in ms" sol4
    la do8 sib la sol
    fa4 sol sol,

    %157
    do8 si do re mi fa
    sol2 sol4
    la4. sol8 fa4

    %160
    fa sol sol,
    do do mi
    sol8 si16 la sol fa mi re\mbreak mi re do si

    %163
    do re mi re do4 do
    fa16 sol la sol fa mi re do re do si la
    sol si do re sol, sol' fad mi re fad mi re

    %166
    mi re mi fad sol fad sol la\mbreak si la sol fad
    sol fa? mi re do8 re mi fa
    sol2 sol4

    %169
    la do8 sib la sol
    fa4 sol sol,
    do do mi

    %172
    sol2 sol4
    la4. sol8 fa4~
    fa sol sol,

    %175
    do\fermopz

}

Ivln = \relative do'' {

    mi4 sol
    re4. re8 sol4
    do,4. mi8 fa4
    la re,8 mi fa sol

    %4
    mi4 mi sol
    re4. re8 sol4
    do, do'8 sib la sol

    %7
    fa mi re2
    do r4
    R2.*6

    %15
    r4 mi4 sol
    re4. re8 sol4
    do,4. mi8 fa4

    %18
    la re,8 mi fa sol
    mi4 mi sol
    re4. re8 sol4

    %21
    do, do'8 sib la sol
    fa mi re2
    do4 r r

    %24
    R2.*6
    r4 mi4 sol
    re4. re8 sol4

    %32
    do,4. mi8 fa4
    la re,8 mi fa sol
    mi4 mi sol

    %35
    re4. re8 sol4
    do, do'8 sib la sol
    fa mi re2

    %38
    do4 r r
    R2.*7
    r4 mi4 sol

    %47
    re4. re8 sol4
    do,4. mi8 fa4
    la re,8 mi fa sol

    %50
    mi4 mi sol
    re4. re8 sol4
    do, do'8 sib la sol

    %53
    fa mi re2
    do r4
    R2.*6

    %61
    r4 mi4 sol
    re4. re8 sol4
    do,4. mi8 fa4

    %64
    la re,8 mi fa sol
    mi4 mi sol
    re4. re8 sol4

    %67
    do, do'8 sib la sol
    fa mi re2
    do4 r r

    %70
    R2.*7
    r4 mi4 sol
    re4. re8 sol4

    %79
    do,4. mi8 fa4
    la re,8 mi fa sol
    mi4 mi sol

    %82
    re4. re8 sol4
    do, do'8 sib la sol
    fa mi re2

    %85
    do4 r r
    R2.*7
    r4 mi4 sol

    %94
    re4. re8 sol4
    do,4. mi8 fa4
    la re,8 mi fa sol

    %97
    mi4 mi sol
    re4. re8 sol4
    do, do'8 sib la sol

    %100
    fa mi re2
    do4 r r
    R2.*7

    %109
    r4 mi4 sol
    re4. re8 sol4
    do,4. mi8 fa4

    %112
    la re,8 mi fa sol
    mi4 mi sol
    re4. re8 sol4

    %115
    do, do'8 sib la sol
    fa mi re2
    do4 r r

    %118
    R2.*14
    r4 mi4 sol
    re4. re8 sol4

    %134
    do,4. mi8 fa4
    la re,8 mi fa sol
    mi4 mi sol

    %137
    re4. re8 sol4
    do, do'8 sib la sol
    fa mi re2

    %140
    do4 r r
    R2.*12
    r4 mi4 sol

    %154
    re4. re8 sol4
    do,4. mi8 fa4
    la re,8 mi fa sol

    %157
    mi4 mi sol
    re4. re8 sol4
    do, do'8 sib la sol

    %160
    fa mi re2
    do4 mi sol
    re r r

    %163
    r do mi
    la, r r
    r si re

    %166
    sol, r r
    r4 mi' sol
    re4. re8 sol4

    %169
    do,4. mi8 fa4
    la re,8 mi fa sol
    mi4 mi sol

    %172
    re4. re8 sol4
    do, do'8 sib la sol
    fa mi re2

    %175
    do4\fermopz

}

IvlaIn = \relative do'' {

    do4 do
    do si4. si8
    la4 sol la8 si
    do4 do si

    %4
    do do do\mbreak
    do si4. si8
    la4. si8 do4~

    %7
    do do4. si8
    do2 r4
    R2.*6

    %15
    r4 do4 do
    do si4. si8
    la4 sol la8 si

    %18
    do4 do si
    do do do\mbreak
    do si4. si8

    %21
    la4. si8 do4~
    do do4. si8
    do2 r4

    %24
    R2.*6
    r4 do4 do
    do si4. si8

    %32
    la4 sol la8 si
    do4 do si
    do do do\mbreak

    %35
    do si4. si8
    la4. si8 do4~
    do do4. si8

    %38
    do4 r r
    R2.*7
    r4 do4 do

    %47
    do si4. si8
    la4 sol la8 si
    do4 do si

    %50
    do do do\mbreak
    do si4. si8
    la4. si8 do4~

    %53
    do do4. si8
    do2 r4
    R2.*6

    %61
    r4 do4 do
    do si4. si8
    la4 sol la8 si

    %64
    do4 do si
    do do do\mbreak
    do si4. si8

    %67
    la4. si8 do4~
    do do4. si8
    do4 r r

    %70
    R2.*7
    r4   do4 do
    do si4. si8

    %79
    la4 sol la8 si
    do4 do si
    do do do\mbreak

    %82
    do si4. si8
    la4. si8 do4~
    do do4. si8

    %85
    do4 r r
    R2.*7
    r4  do4 do

    %94
    do si4. si8
    la4 sol la8 si
    do4 do si

    %97
    do do do\mbreak
    do si4. si8
    la4. si8 do4~

    %100
    do do4. si8
    do4 r r
    R2.*7

    %109
    r4  do4 do
    do si4. si8
    la4 sol la8 si

    %112
    do4 do si
    do do do\mbreak
    do si4. si8

    %115
    la4. si8 do4~
    do do4. si8
    do4 r r

    %118
    R2.*14
    r4  do4 do
    do si4. si8

    %134
    la4 sol la8 si
    do4 do si
    do do do\mbreak

    %137
    do si4. si8
    la4. si8 do4~
    do do4. si8

    %140
    do4 r r
    R2.*12
    r4  do4 do

    %154
    do si4. si8
    la4 sol la8 si
    do4 do si

    %157
    do do do\mbreak
    do si4. si8
    la4. si8 do4~

    %160
    do do4. si8
    do4 do sol
    si r r

    %163
    r sol sol
    fa r r
    r re fad

    %166
    mi r r
    r  do'4 do
    do si4. si8

    %169
    la4 sol la8 si
    do4 do si
    do do do\mbreak

    %172
    do si4. si8
    la4. si8 do4~
    do do4. si8

    %175
    do4\fermata

}

IvlaIIn = \relative do' {

    sol'4 sol
    sol2 sol4
    mi2 do4~
    do sol'2

    %4
    sol4 sol sol
    sol2 sol4
    mi4. sol8 do,4~

    %7
    do sol'2
    mi2 r4
    R2.*6

    %15
    r4 sol4 sol
    sol2 sol4
    mi2 do4~

    %18
    do sol'2
    sol4 sol sol
    sol2 sol4

    %21
    mi4. sol8 do,4~
    do sol'2
    mi4 r r

    %24
    R2.*6
    r4 sol4 sol
    sol2 sol4

    %32
    mi2 do4~
    do sol'2
    sol4 sol sol

    %35
    sol2 sol4
    mi4. sol8 do,4~
    do sol'2

    %38
    mi4 r r
    R2.*7
    r4 sol4 sol

    %47
    sol2 sol4
    mi2 do4~
    do sol'2

    %50
    sol4 sol sol
    sol2 sol4
    mi4. sol8 do,4~

    %53
    do sol'2
    mi2 r4
    R2.*6

    %61
    r4 sol4 sol
    sol2 sol4
    mi2 do4~

    %64
    do sol'2
    sol4 sol sol
    sol2 sol4

    %67
    mi4. sol8 do,4~
    do sol'2
    mi4 r r

    %70
    R2.*7
    r4 sol4 sol
    sol2 sol4

    %79
    mi2 do4~
    do sol'2
    sol4 sol sol

    %82
    sol2 sol4
    mi4. sol8 do,4~
    do sol'2

    %85
    mi4 r r
    R2.*7
    r4 sol4 sol

    %94
    sol2 sol4
    mi2 do4~
    do sol'2

    %97
    sol4 sol sol
    sol2 sol4
    mi4. sol8 do,4~

    %100
    do sol'2
    mi4 r r
    R2.*7

    %109
    r4 sol4 sol
    sol2 sol4
    mi2 do4~

    %112
    do sol'2
    sol4 sol sol
    sol2 sol4

    %115
    mi4. sol8 do,4~
    do sol'2
    mi4 r r

    %118
    R2.*14
    r4 sol4 sol
    sol2 sol4

    %134
    mi2 do4~
    do sol'2
    sol4 sol sol

    %137
    sol2 sol4
    mi4. sol8 do,4~
    do sol'2

    %140
    mi4 r r
    R2.*12
    r4 sol4 sol

    %154
    sol2 sol4
    mi2 do4~
    do sol'2

    %157
    sol4 sol sol
    sol2 sol4
    mi4. sol8 do,4~

    %160
    do sol'2
    sol4 sol sol
    sol r r

    %163
    r do, do
    do r r
    r re re

    %166
    si r r
    r sol'4 sol
    sol2 sol4

    %169
    mi2 do4~
    do sol'2
    sol4 sol sol

    %172
    sol2 sol4
    mi4. sol8 do,4~
    do sol'2

    %175
    mi4\fermopz

}

Ibcn = \relative do {

    do'4 mi,
    sol2 sol4
    la do8 sib la sol
    fa4 sol sol,

    %4
    do do' mi,\mbreak
    sol2 sol4
    la4. sol8 fa4

    %7
    fa sol sol,
    do do'2
    si2.

    %10
    la
    sol
    do,4. re8 mi fa

    %13
    sol4 la8 sol fa4~
    fa sol sol,\mbreak
    do4 do8 re mi fa

    %16
    sol2 sol4
    la8 si do sib la sol
    fa4 sol sol,

    %19
    do4. re8 mi fa
    sol2 sol4
    la4. sol8 fa4~

    %22
    fa sol sol,\mbreak
    do4 do'2
    si2.

    %25
    la
    sol
    do

    %28
    si2 la4
    sol re2
    sol,4  do8 re mi fa

    %31
    sol2 sol4
    la4 do8 sib la sol
    fa4 sol sol,

    %34
    do4. re8 mi fa
    sol2 sol4
    la4. sol8 fa4~

    %37
    fa sol sol,\mbreak
    do2.
    la4 re si

    %40
    do si sold
    la sol! fa\mbreak
    mi2 do'4

    %43
    la re si
    do4. si8 la4
    re mi2

    %46
    la,8 si do re mi fa
    sol2 sol4
    la do8 sib la sol

    %49
    fa4 sol sol,
    do4. re8 mi fa\mbreak
    sol2 sol4

    %52
    la4. sol8 fa4~
    fa sol sol,
    do2.

    %55
    si
    la
    sol2 do4

    %58
    fa,2 sol8 fa
    mi2 re4
    do8 fa sol2

    %61
    do4. re8 mi fa\mbreak
    sol2 sol4
    la do8 sib la sol

    %64
    fa4 sol sol,
    do do mi
    sol2 sol4

    %67
    la4. sol8 fa4~
    fa sol sol,
    do2.

    %70
    si
    la
    sol\mbreak

    %73
    do
    fa
    re4 sol mi
    do si la

    %77
    sol do8 re mi fa
    sol2 sol4
    la do8 sib la sol

    %80
    fa4 sol sol,
    do4. re8 mi fa\mbreak
    sol4. sol8 sol4

    %83
    la4. sol8 fa4~
    fa sol sol,
    do2.

    %86
    si
    la
    sol

    %89
    do
    si
    la

    %92
    sol
    do8 si do re mi fa\mbreak
    sol2 sol4

    %95
    la do8 sib la sol
    fa4 sol sol,
    do8 si do re mi fa

    %98
    sol2 sol4
    la4. sol8 fa4~
    fa sol sol,

    %101
    do r r\mbreak
    <<{si^\markup\italic"B. C." r r
    la r r

    %104
    sol r r
    do r r
    si r r

    %107
    la r r\mbreak
    sol re'2
    sol,4 do8 re mi fa}\\{R2.*7_\markup\italic"Basse de Violon" r4 do mi}>>

    %110
    sol2 sol4
    la do8 sib la sol
    fa4 sol sol,

    %113
    do8 si do re mi fa
    sol2 sol4
    la4. sol8 fa4~\mbreak

    %116
    fa sol sol,
    do la2
    sold2.

    %119
    la4 dod2
    re8 mi fa2
    mi la4

    %122
    fa sol sol,
    do la2
    sold2.\mbreak

    %125
    la4 dod2
    re4 fad2
    sol8 do, re2

    %128
    sol, r4
    <<{mi'^\markup\italic"B.C." r r
    re r r

    %131
    do r r
    sol}\\{R2.*3_\markup\italic"Basse de Violon" r4}>> do8 re mi fa
    sol2 sol4\mbreak

    %134
    la do8 sib la sol
    fa4 sol sol,
    do8 si do re mi fa

    %137
    sol2 sol4
    la4. sol8 fa4~
    fa sol sol,

    %140
    do2.
    fa2 mi4\mbreak
    re2.

    %143
    mi
    fa2 mi4
    re2.

    %146
    fa2 sib4
    sol la2
    re,4 r r

    %149
    <<{do^\markup\italic"B.C." r r
    si r r
    sol r r

    %152
    re' r r
    sol, }\\{R2.*4_\markup\italic"Basse de Violon" r4}>> do8 re mi fa
    sol2 sol4

    %155
    la do8 sib la sol
    fa4 sol sol,
    do8 si do re mi fa

    %158
    sol2 sol4
    la4. sol8 fa4~
    fa sol sol,

    %161
    do do mi
    sol4 r r
    r do, do

    %164
    fa r r
    r sol re
    mi r r

    %167
    r do8 re mi fa\mbreak
    sol2 sol4
    la do8 sib la sol

    %170
    fa4 sol sol,
    do do mi
    sol2 sol4

    %173
    la4. sol8 fa4~
    fa sol sol,
    do\fermopz

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/4
    \tempo 2 = 60
    \partial 2 s2
    s2.*174
    \set Score.measureLength = #(ly:make-moment 1 4)
    s4
    \bar"|."

}

Ivlp = {
    \Iglobal
    %\notypeset
    <<\Ivlpn \forma>>

}

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}

Ivl = {
    \Iglobal
    <<\Ivln \forma>>

}

IvlaI = {
    \Iglobal
    %\clef soprano
    <<\IvlaIn \forma>>

}

IvlaII = {
    \Iglobal
    \clef alto
    <<\IvlaIIn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "Rondeau"

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"pic[c]olo"}
            \Ivlp
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto"\vspace #-0.2"conc[ertante]"}
            \Ifg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino"}
            \Ivl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola I"}
            \IvlaI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola II"}
            \IvlaII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Basse Continue"\vspace #-0.2"Basse de Violon"}
            \Ibc
        >>
    >>

    \layout {

        indent = 2.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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
