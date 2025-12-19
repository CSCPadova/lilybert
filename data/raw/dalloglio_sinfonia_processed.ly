\language "italiano"
%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

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

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

parentSlur =
-\tweak stencil
#(lambda (grob)
     (let* ((cp (ly:grob-property grob 'control-points))
            (lp (grob-interpret-markup grob (markup #:teeny "(")))
            (rp (grob-interpret-markup grob (markup #:teeny ")"))))
         (set! lp (ly:stencil-aligned-to lp Y CENTER))
         (set! lp (ly:stencil-aligned-to lp X 0.2))
         (set! lp (ly:stencil-translate lp (first cp)))
         (set! rp (ly:stencil-aligned-to rp Y CENTER))
         (set! rp (ly:stencil-aligned-to rp X -0.2))
         (set! rp (ly:stencil-translate rp (last cp)))
         (list-set! cp 0
                    (cons (cdr (ly:stencil-extent lp X))
                          (cdr (first cp))))
         (list-set! cp (1- (length cp))
                    (cons (car (ly:stencil-extent rp X))
                          (cdr (last cp))))
         (ly:grob-set-property! grob 'control-points cp)
         (apply ly:stencil-add (list lp rp
                                     (ly:slur::print grob)))))
\etc


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
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    fa,2 fa'
    mi4 sib' la sol
    fa do fa2

    %4
    mi8 sib' la sol la fa sol mi
    fa4 do, re mi
    fa do\p re mi

    %7
    fa do\f re mi
    fa sol la si
    do re mi fa

    %10
    sol sol2 fa8 mi\mbreak
    fa4 re8 do re fa mi sol
    fa4 fa2 mi8 re

    %13
    mi4 do8 si do re mi fa
    sol4\p sol2 fa8 mi
    fa4 re8 do re fa mi sol

    %16
    fa4 fa2 mi8 re
    mi sol\f la si do si do si
    do si la sol fa mi re do

    %19
    re re sol la si la si la
    si? la sol fad mi re do si\mbreak
    do do fad sol la sol la sol

    %22
    la sol fad mi re do si do
    si sol'\p la sol la sol la sol
    sib,! sol' la sol la sol la sol

    %25
    \once\stemUp la, dod'\f re dod re dod re dod
    mi re dod sib la sol fa mi
    fa fa\p sol fa sol fa sol fa

    %28
    lab, fa' sol fa sol fa sol fa\mbreak
    \once\stemUp sol, si'\f do si do si do si
    re do si la sol fa mi re

    %31
    mi do\p re do re do re do
    mib, do' re do re do re do
    \once\stemUp re, fad'\f sol fad sol fad sol fad

    %34
    la sol fad mi re do si do
    si4 sol16(la si do) re2
    do4 do16(re mi fa?) sol2

    %37
    si,4\p sol16(la si do) re2\mbreak
    do4 do16(re mi fa) sol2
    si,4\f  sol16 \parenthesize (la si do) re2~

    %40
    re4 si16 \parenthesize (do re mi) fa2~
    fa4 re16 \parenthesize (mi fa sol) la2~
    la4 sol8 fa sol mi fa re

    %43
    mi do re mi fa sol la si
    do do, do' do, do' do, do' do,
    do' do, re mi fa sol la si

    %46
    do do, do' do, do' do, do' do,
    do'4 si8 la sol fa mi re\mbreak
    mi2 re\tr

    %49
    do4 mi8 fa sol4 sol
    r mi fa re
    mi mi8\p fa sol4 sol

    %52
    r do, re si
    do sol\f la8 do si re
    do4 mi, fa sol

    %55 OOKK
    do,2 r
    r4 sol'_\upl la_\upl si\upl
    do\upl si\upl do\upl re\upl

    %58
    mib\upl re\upl do\upl sib?\upl
    do\upl sib\upl la_\upl sol_\upl
    <fad' la, re,>2 la

    %61
    r4 do, sib la\mbreak
    <sol' sib, re,>2 sib
    r4 re, do sib

    %64
    do8 la sib do re mi fad sol
    la4. do,8 sib4.\tr la8
    sib4 sol8 sib re4 sib8 re

    %67
    sol4 sib8 la sib la sol fa
    mi4 sol8 fa sol fa mi re
    do mi fa sol do, do sib la

    %70
    sib4. sib8 mi2
    r4 r8 sib sol'2
    r4 r8 mi sib'2~

    %73
    sib8 la sol fa mi re do sib\mbreak
    sib' la sol fa mi re do sib
    sib' la sol fa mi re do sib

    %76
    do,4. sib'8 mi4. sib8
    sol' fa mi re do4 sib
    la fa' do la

    %79
    fa2 fa'\p
    mib4 mib mib2~
    mib4 re8 do si4 do

    %82
    si re re2~
    re sol
    fa4 fa fa2~

    %85
    fa4 mi?8 re dod4 re
    dod mi mi2~
    mi la\mbreak

    %88
    sol4 sol sol2~
    sol8 mi fa sol la,4 sol'
    fa fa fa2~

    %91
    fa8 re mi fa la,4 la'
    sol sol sol2~
    sol8 mi fa sol la,4 sol'

    %94
    fa8  re\f dod re re, re' dod re
    mi, re' dod re fa, re' dod re
    sol, re' dod re re, re' dod re

    %97
    mi, re' dod re fa, re' dod re\mbreak
    sol, re' dod re sol, re' dod re
    sold, re' dod re sold, re' dod re

    %100
    dod la si? dod re mi fa sol
    la fa mi re la' fa mi re
    dod la si? dod re mi fa sol

    %103
    la sol fa mi re do? sib? la
    re do sib la sol fa mi re
    sib' la sol fa mi re dod sib\mbreak

    %106
    la2 sol''
    r8 mi fa sol la, sol' fa mi
    fa mi re dod re sib la sol

    %109
    fa2 mi\tr
    re4 re' re,2
    fa fa'

    %112
    mi4 sib' la sol
    fa do fa2
    mi8 sib' la sol la fa sol mi

    %115
    fa4 do, re mi
    fa do\p re mi
    fa do\f re mi

    %118
    fa sol la si\mbreak
    do4 mib8 re do4 sib!
    la do8 sib la4 sol

    %121
    fad la8 sol fad4 mib
    re do' fad do
    la'8 sol fad mib? re do sib la

    %124
    sib4 sol'2 sib4
    la, la'2 do4
    sib re,8 do sib4 la

    %127
    sol sib8 la sol4 fa
    mi sol8 fa mi4 re
    do sib' mi sib\mbreak

    %130
    sol'8 fa mi re do sib la sol
    la4 fa'2 la4
    sol, sol'2 sib4

    %133
    la fa fa, r
    do''1\p~
    do4 la(sib2)

    %136
    sib1~
    sib4 sold(la2)
    la1~

    %139
    la4 fad(sol2)
    sol1~
    sol4 mi \parenthesize (fa2)

    %142
    fa\tr~fa8 mi fa sol
    mi4 do'2\f sol4
    la do2 la4

    %145
    sol do2\p sol4
    la do2 la4\mbreak
    sol2 <<
        {
            <mi do>\f \override Rest.staff-position = #0

            %148
            fa r2
            r mi\p
            fa r

            %151
            r <sib do,>
            <la do,>
        }\\{
            <do, sol>
            <do la> s
            s <do sol>
            <do la> s
            s mi,\f
            fa
        }
    >> sol'4.\tr fa8

    %153 OOKK
    mi4 re8 do fa sib la sol
    la2 sol\tr
    fa4 la8 sib do4 do

    %156
    r la sib sol
    la la,8\p sib do4 do
    r la sib sol

    %159
    la do\f re8 \parenthesize (fa) mi \parenthesize (sol)
    fa4 la, sib do
    fa,2 r

}

IvlIIn = \relative do'' {

    fa,2 la
    sol4 sol' fa mi
    fa do la2

    %4
    sol4 sol' fa mi
    fa do, re mi
    fa do\p re mi

    %7
    fa do\f re mi
    fa sol la si
    do re mi fa

    %10
    mi4 mi2 re8 do
    re4 si8 la si re do mi\mbreak
    re4 re2 do8 si

    %13
    do4 do8 si do re mi fa
    mi4\p mi2 re8 do
    re4 si8 la si re do mi

    %16
    re4 re2 do8 si
    do sol'\f la si do si do si
    do si la sol fa mi re do

    %19
    re re sol la si la si la
    si? la sol fad mi re do si\mbreak
    do do fad sol la sol la sol

    %22
    la sol fad mi re do si do
    si sol'\p la sol la sol la sol
    sib,! sol' la sol la sol la sol

    %25
    \once\stemUp la, dod'\f re dod re dod re dod
    mi re dod sib la sol fa mi
    fa fa\p sol fa sol fa sol fa

    %28
    lab, fa' sol fa sol fa sol fa\mbreak
    \once\stemUp sol, si'\f do si do si do si
    re do si la sol fa mi re

    %31
    mi do\p re do re do re do
    mib, do' re do re do re do
    \once\stemUp re, fad'\f sol fad sol fad sol fad

    %34
    la sol fad mi re do si do
    si re si sol si re si sol
    mi' sol mi do mi sol mi do\mbreak

    %37
    si\p re si sol si re si sol
    mi' sol mi do mi sol mi do
    si\f re si sol si re si sol

    %40
    re' fa re si re fa re si
    fa' la fa re fa la fa re
    re4 re, re re'

    %43
    mi8 do re mi fa sol la si
    do do, do' do, do' do, do' do,
    do' do, re mi fa sol la si

    %46
    do do, do' do, do' do, do' do,
    do'4 si8 la sol fa mi re
    do2 si\tr

    %49
    do4 do8 re mi4 mi
    r do re si
    do do8\p re mi4 mi

    %52
    r mi, fa re
    mi sol\f la8 do si re
    do4 mi, fa sol

    %55
    do,2 r
    r4 sol'_\upl la_\upl si\upl
    do\upl si\upl do\upl re\upl

    %58
    mib\upl re\upl do\upl sib?\upl
    do\upl sib\upl la_\upl sol_\upl
    fad2 fad'

    %61
    r4 la, sol fad
    sol2 sol'
    r4 sib, la sol

    %64
    la8 la sib do re mi fad sol
    fad4. la,8 sol4._\tr  fad8
    sol4 sol sib8 re sib re

    %67
    sol4 r r2\mbreak
    r4 sib8 la sib la sol fa
    mi mi fa sol la, la sib la

    %70
    sib4 do, mi sol
    sib mi, sol sib
    mi sib mi sol

    %73
    sib8 la sol fa mi re do sib\mbreak
    sib' la sol fa mi re do sib
    sib' la sol fa mi re do sib

    %76
    do,4. sib'8 mi4. sib8
    sol' fa mi re do4 sib
    la fa' do la

    %79
    fa2 r
    do'4\p do do do
    do do do do

    %82
    si si si si
    si si si si
    re re re re

    %85
    re re re re
    dod dod dod dod
    dod?2 la'

    %88
    sol4 sol sol2~
    sol8 mi fa sol la,4 sol'
    fa fa fa2~

    %91
    fa8 re mi fa la,4 la'
    sol sol sol2~
    sol8 mi fa sol la,4 sol'

    %94
    fa8  re\f dod re re, re' dod re
    mi, re' dod re fa, re' dod re
    sol, re' dod re re, re' dod re

    %97
    mi, re' dod re fa, re' dod re\mbreak
    sol, re' dod re sol, re' dod re
    sold, re' dod re sold, re' dod re

    %100
    dod la si? dod re mi fa sol
    la fa mi re la' fa mi re
    dod la si? dod re mi fa sol

    %103
    la sol fa mi re do? sib? la
    re do sib la sol fa mi re
    sib' la sol fa mi re dod sib\mbreak

    %106
    la2 sol''
    r8 mi fa sol la, sol' fa mi
    fa mi re dod re sib la sol

    %109
    fa2 mi\tr
    re4 re' re,2
    fa la\mbreak

    %112
    sol4 sol' fa mi
    fa do la2
    sol4 sol' fa mi

    %115
    fa do, re mi
    fa do\p re mi
    fa do\f re mi

    %118
    fa sol la si\mbreak
    do4 mib8 re do4 sib!
    la do8 sib la4 sol

    %121
    fad la8 sol fad4 mib
    re do' fad do
    la'8 sol fad mib? re do sib la

    %124
    sib4 sib2 re4\mbreak
    fad, fad'2 la4
    sol re8 do sib4 la

    %127
    sol sib8 la sol4 fa
    mi sol8 fa mi4 re
    do sib' mi sib\mbreak

    %130
    sol'8 fa mi re do sib la sol
    la4 la2 do4
    mi, mi'2 sol4

    %133
    fa do la r
    mib'1\p
    re

    %136
    re
    do
    do

    %139
    sib
    sib
    la

    %142
    la2 si\tr
    do4 mi!2\f mi4\mbreak
    fa fa2 fa4

    %145
    mi mi2\p mi4
    fa fa2 fa4
    <<
        {
            <mi do>2\override Rest.staff-position = #0 r

            %148
            r fa\f
            mi r
            r fa\p

            %151
            <mi do> <sib' do,>\f
            <la do,>
        }\\{
            sol, s
            s <do la>
            <do sol> s
            s <do la>
            <do sol> mi,
            fa
        }
    >> sol'4.\tr fa8

    %153
    mi4 re8 do fa2
    fa mi\tr
    fa4 fa8 sol la4 la

    %156
    r fa sol mi
    fa fa,8\p sol la4 la
    r fa sol mi

    %159
    fa mi' \f re8(fa) mi(sol)
    fa4 la, sib do
    fa,2 r

}

Ivlan = \relative do' {

    do2 do'
    do do
    do do,

    %4
    do do
    do4 do re mi
    fa do\p re mi

    %7
    fa do\f re mi
    fa sol la si
    do2 r

    %10
    do do,
    si sol'
    si sol\mbreak

    %13
    sol r
    do\p do,
    si sol'

    %16
    si sol
    sol r
    sol \f sol

    %19
    sol sol
    sol sol
    la fad

    %22
    re re
    re\p re
    sol sib?

    %25
    mi,\f mi
    la la
    la\p la

    %28
    fa lab
    re,\f re
    sol sol

    %31
    sol\p sol
    sol sol
    fad\f la\mbreak

    %34
    re, re
    re sol
    sol sol

    %37
    sol\p sol
    sol sol
    sol\f sol

    %40
    sol sol
    re re
    re sol

    %43
    sol4 sol si, re
    do fa mi re
    do sol' si, re

    %46
    do fa mi re
    do r r la'
    sol2 sol

    %49
    sol4 do sol do
    sol do la sol
    sol do\p sol do\mbreak

    %52
    sol do la sol
    sol sol\f la si
    do mi, fa sol

    %55
    do,2 r
    R1*4
    r4 re fad la

    %61
    fad re re re
    re sol sib re
    sib sol sol sol

    %64
    fad2 fad
    re re
    re r

    %67
    R1*3
    r4 mi sol mi\mbreak
    do sol' sib sol

    %72
    do, sol' sol mi
    mi mi' mi, mi
    mi mi' mi, mi

    %75
    mi mi' mi, mi
    mi2 sol
    do, do

    %78
    do r
    R1
    la'4\p la la la

    %81
    la la la la
    re, re re re
    re re re re

    %84
    si' si si si
    si? si si si\mbreak
    mi, mi mi mi

    %87
    mi la, dod mi
    la la la la
    la la la la

    %90
    la la la la
    la la re re
    re re re re

    %93
    dod dod mi, la
    la2\f fa
    sol la

    %96
    sib fa
    sol la
    sib sib

    %99
    si si
    mi, r
    fa fa

    %102
    mi r\mbreak
    fa r
    fa r

    %105
    re re
    dod mi
    la la

    %108
    la4 sol fa mi
    re2 dod
    re r

    %111
    do? do'
    do do
    do do,

    %114
    do do
    do4 do re mi
    fa do\p re mi

    %117
    fa  do\f re mi
    fa sol la si
    do mib8 re do4 sib!

    %120
    la do8 sib la4 sol\mbreak
    fad la8 sol fad4 mib
    re2 fad

    %123
    fad? fad
    sol re
    re re

    %126
    sol4 re'8 do sib4 la
    sol sib8 la sol4 fa
    mi sol8 fa mi4 re

    %129
    do2 mi
    mi mi
    fa do

    %132
    do do
    do r
    fa1\p

    %135
    fa
    mi
    mi

    %138
    re
    re
    do

    %141
    do
    re2 sol\mbreak
    sol2. do4\f

    %144
    la2. fa4
    sol2. do4\p
    la2. fa4

    %147
    do2 do'\f
    do1\tr
    do\tr\p

    %150
    do\tr
    do2\tr sol\f
    la re

    %153
    do do4. re8
    do2 do
    do4 fa, do fa

    %156
    do fa re do
    do fa\p do fa
    do fa re do

    %159
    do do\f re mi
    fa la, sib do
    fa,2 r

}


Ibcn = \relative do {

    fa,2 fa'
    do' do,
    fa, fa'

    %4
    do' do,
    fa,4 do' re mi
    fa do\p re mi

    %7
    fa do\f re mi
    fa sol la si
    do2 r

    %10
    do do,
    sol' sol,
    sol' sol

    %13
    do, r
    do'\p do,\mbreak
    sol' sol,

    %16
    sol' sol
    do, r
    do'\f do,

    %19
    sol' sol
    r sol,
    re' re

    %22
    r fad
    sol\p sol
    r sol

    %25
    dod,\f la
    r dod
    re\p re,

    %28
    r do'!
    si\f sol
    r si

    %31
    do\p do,
    r mib'
    re\f re

    %34
    r fad\mbreak
    sol4 sol, sol sol'
    sol4 sol, sol sol'

    %37
    sol4\p sol, sol sol'
    sol4 sol, sol sol'
    sol4\f sol, sol sol'

    %40
    si si,? si si'
    si si,? si si'
    si si,? si si'

    %43
    do do, re sol
    mi la sol fa
    mi do re sol

    %46
    mi la sol fa
    mi r r fa
    sol2 sol,

    %49
    do4 do' do, do
    do do' fa, sol\mbreak
    do, do'\p  do, do

    %52
    do do' fa, sol
    do, sol'\f la si
    do mi, fa sol

    %55
    do,2 r
    R1*4
    r4 re' re, re

    %61
    re re' re, re
    sol, sol' sol, sol
    sol sol' sol, sol

    %64
    re re' re, re
    re re' re, re
    sol sol' sol, sol

    %67
    sol4 r r2
    R1*2
    r4 do' do, do\mbreak

    %71
    do do' do, do
    do do' do, do
    do do' do, do

    %74
    do do' do, do
    do do' do, do
    do2 do

    %77
    r do
    fa4 fa fa, fa
    fa2 r

    %80
    fad'4\mf^\markup\italic "Violoncello Solo" fad fad fad
    fad fad fad fad
    sol sol sol sol

    %83
    sol sol sol sol
    sold sold sold sold
    sold sold sold sold

    %86
    la la la la\mbreak
    la2 r
    dod,4 dod dod dod

    %89
    dod? dod dod dod
    re re re re
    re re fa fa

    %92
    mi mi mi mi
    la, la dod dod
    re2\f\tu re

    %95
    mi fa
    sol re
    mi fa

    %98
    sol sol
    sold sold
    la r

    %101
    re re,
    la' r
    re, r

    %104
    re r
    sol, sol\mbreak
    la la

    %107
    dod dod
    re4 mi fa sol
    la2 la,

    %110
    re r
    fa, fa'
    do' do,

    %113
    fa, fa'
    do' do,
    fa,4 do' re mi

    %116
    fa do\p re mi
    fa do\f re mi
    fa sol la si

    %119
    do mib8 re do4 sib!
    la do8 sib la4 sol
    fad la8 sol fad4 mib

    %122
    re2 re4. re8
    re2 re\mbreak %% fine terz'ultima riga
    sol sol,

    %125
    re' re,
    sol4 re''8 do sib4 la
    sol sib8 la sol4 fa

    %128
    mi sol8 fa mi4 re
    do2 do4. do8
    do2 do

    %131
    fa fa,
    do' do
    fa4 la do sib

    %134
    la\p sol la fa
    sib sib, sib' la
    sol fa sol mi

    %137
    la la, la' sol
    fa mi fa re
    sol sol, sol' fa

    %140
    mi re mi do
    fa fa, fa' mi\mbreak
    re do re sol,

    %143
    do2 do\f
    do do
    do do\p

    %146
    do do
    do4 do\f mi sol
    do do, fa la

    %149
    do do,\p mi sol
    do do, fa la
    do do, do2\f

    %152
    fa sib,~
    sib la4. sib8
    do2 do,

    %155
    fa4 fa' fa, fa
    fa fa' sib, do
    fa, fa'\p fa, fa

    %158
    fa fa' sib, do
    fa do\f re mi
    fa la, sib do

    %161
    fa,2 r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*10
    <_!>1
    <7>
    s
    s
    <_!>
    <7>
    s
    s
    <_!>
    s
    s
    s2 <6 5!>
    <_!>1
    s
    <6>
    s2 <6 5/>
    s1
    s2 <2>
    <6>1
    s2 <6 5!>
    s1
    s2 <6>
    <_+>1
    s2 <6 5!>
    <_!>1
    <6 4>
    <_!>
    <6 4>
    <5 4>2 <_!>
    s1*4
    <6>1
    <6>
    <6>
    <6>2 s4 <6 5>
    <6 4>2 <_!>
    s1
    s2 <6 5>4 <_!>
    s1
    s2 <6 5>4 <_!>
    s1*7
    s4 <_+> s2
    s1
    s
    s
    <7 _+>
    s1*30
    s2 <6>
    s1
    s2 <6>
    s1
    <6 5!>
    <_+>
    s
    <_+>
    s
    s
    <6 5>
    <_+>
    s2 <6 5!>
    s <6>
    <6 4> <_+>
    s1*12
    <_+>1
    s
    s
    <7 _+>
    s1*4
    <7>1
    s
    <7>
    s
    <6 5!>
    <9>2 <8>
    <6 5> s
    <9> <8>
    <6 5> s
    <9> <8>
    <6 5/> s
    <9> <8>
    <7> <6!>4 <7 _!>
    s1
    <6 4>
    <3>
    <6 4>
    <3>
    <6 4>
    <3>
    <6 4>
    <3>
    s2 <6>4 <5>
    <2>2 <6>
    <6 4> <3>
    s1
    s2 <6 5>4 <7>
    s1
    s2 <6 5>4 <7>

}

forma = {

    \time 2/2
    \key fa\major
    \tempo 1 = 55
    s1*55
    \bar":..:"\break
    s1*106
    \bar":|."

}



IvlI = {
    \global
    <<\IvlIn \forma>>

}

IvlII = {
    \global
    <<\IvlIIn \forma>>

}


Ivla = {
    \global
    \clef alto
    <<\Ivlan \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}

IIvlIn = \relative do'' {

    fa4. mib16(reb do4)
    reb4. do16(sib lab4)
    sib~\tuplet 3/2 { sib8(lab sol) fa[(mi fa)] }

    %4
    mi4 fa r
    do' do\tr~do16(sib do reb)
    sib4 sib\tr~sib16(lab sib do)

    %7
    lab4 lab\tr~lab16(sol lab sib)
    sol8 si4 do8 do,4
    mib'2.

    %10
    reb\tr\mbreak
    do8 mib4 sol lab8
    r r16 fa mib4 reb

    %13
    do8 mib4 sol8 \grace sib lab(sol16 fa)
    \grace mib8 re2.\tr
    \tuplet 3/2 { mib8(solb fa) } solb4. fa16(mib)

    %16
    \grace reb8 do2.\tr
    \tuplet 3/2 { reb!8(fa mi) } \grace mi8 fa4. mib16(reb)
    \grace do8 si2.\tr

    %19
    \tuplet 3/2 { do8(mib re?) } mib4. re16(do)
    \grace sib8 la2.\tr \mbreak
    \tuplet 3/2 { sib8(reb? do) } reb4. do16(sib)

    %22
    \grace lab8 sol2.\tr
    lab4 do8(sib) reb(do)
    \grace mib reb2\tr do4

    %25
    lab4\p do8(sib) reb(do)
    \grace mib reb2\tr do4
    fa2\f mib16(reb do sib)

    %28
    mib2 reb16(do sib lab)
    \tuplet 3/2 { reb8(do sib) } do4 sib\tr
    lab lab, r\mbreak

    %31
    do'4 mi8(fa) do(reb)
    sib4 mi16(fa sol8) sib,4
    lab re16(mib fa8) lab,4

    %34
    lab2\tr sol4
    do\p mi8(fa) do(reb)
    sib4 mi16(fa sol8) sib,4

    %37
    lab re16(mib? fa8) lab,4
    sol8 si4 do8 do,4
    sib''8\f sol sol4\tr do,8 sib'

    %40
    lab(mi) mi(fa) fa4\tr \mbreak
    sib,8\p sol sol4\tr do,8 sib'
    lab(mi) mi(fa) fa4\tr

    %43
    reb'2.\f
    do\p
    sib'\f

    %46
    lab\p
    reb\f
    do4 sib8(lab) sol(fa)

    %49
    reb4 do si
    \grace si?8 do2 r4
    sib!8 sol' sol4.\tr sib,8

    %52
    lab fa' fa4.\tr do8
    sib\p sol' sol4.\tr sib,8\mbreak
    lab fa' fa4.\tr do8

    %55
    sib\f sib' sib4. sol8
    lab(mi) mi(fa) fa4
    \tuplet 3/2 { reb8(do sib) } lab4 sol\tr

    %58
    fa \tuplet 3/2 { reb'!8\p(mi fa)  do[(mi fa)]}
    \tuplet 3/2 { reb(do sib) } lab4 sol\tr
    fa \tuplet 3/2 { reb'8\f(mi fa)  do[(mi fa)]}

    %61
    \tuplet 3/2 { reb(do sib) } lab4 sol\tr
    fa2 r4

}

IIvlIIn = \relative do'' {

    fa4. mib16(reb do4)
    reb4. do16(sib lab4)
    sib~\tuplet 3/2 { sib8(lab sol) fa[(mi fa)] }

    %4
    mi4 fa r
    r fa'8(do) lab'4
    r mi8(do) sol'4

    %7
    r do,8 fa,\parenthesize ~ fa16(mi fa sol)
    \grace fa8 mi2 r4
    r4 mib'?8(do) lab'4

    %10
    r sib,8(mib,) sib''4\mbreak
    do,8 mib4 sol lab8
    r r16 fa mib4 reb

    %13
    do8 mib4 sol8 \grace sib lab(sol16 fa)
    \grace mib8 re2.\tr
    \tuplet 3/2 { mib8(solb fa) } solb4. fa16(mib)

    %16
    \grace reb8 do2.\tr
    \tuplet 3/2 { reb!8(fa mi) } \grace mi8 fa4. mib16(reb)
    \grace do8 si2.\tr

    %19
    \tuplet 3/2 { do8(mib re?) } mib4. re16(do)
    \grace sib8 la2.\tr \mbreak
    \tuplet 3/2 { sib8(reb? do) } reb4. do16(sib)

    %22
    \grace lab8 sol2.\tr
    lab4 do8(sib) reb(do)
    \grace mib reb2\tr do4

    %25
    lab4\p do8(sib) reb(do)
    \grace mib reb2\tr do4
    fa2\f mib16(reb do sib)

    %28
    mib2 reb16(do sib lab)
    \tuplet 3/2 { reb8(do sib) } do4 sib\tr
    lab lab, r

    %31
    do'4 mi8(fa) do(reb)\mbreak
    sib4 r sol'16(lab sib8)
    r4 r fa16(sol lab8)

    %34
    fa,2\tr mi4
    do'\p mi8(fa) do(reb)
    sib4 r sol'16(lab sib8)

    %37
    r4 r fa16(sol lab8)
    \grace fa8 mi2 r4
    sol8\f mi mi4.\tr sol8

    %40
    fa(sol,) sol(lab) lab4\tr
    sol8\p mi mi4.\tr sol8\mbreak
    fa(sol,) sol(lab) lab4\tr

    %43
    r \tuplet 3/2 { sib'8\f(la? sib) } sib4 ~
    sib \tuplet 3/2 { lab?8\p(sol lab) } lab4
    r \tuplet 3/2 { sol'8\f(fa sol) } sol4~

    %46
    sol \tuplet 3/2 { fa8\p(mi fa) } fa4
    reb'2.\f
    do4 sib8(lab) sol(fa)

    %49
    reb4 do si
    \grace si?8 do2 r4
    mi,8 mi'4 mi mi,8

    %52
    fa lab4 lab lab8\mbreak
    sol\p mi'4 mi mi,8
    fa lab4 lab lab8

    %55
    sol\f sol'4 sol mi8
    fa4 sol, lab
    \tuplet 3/2 { sib8(lab sol) } fa4 mi\tr

    %58
    fa \tuplet 3/2 { reb'!8\p(mi fa)  do[(mi fa)]}
    \tuplet 3/2 { reb(do sib) } lab4 sol\tr
    fa \tuplet 3/2 { reb'8\f(mi fa)  do[(mi fa)]}

    %61
    \tuplet 3/2 { reb(do sib) } lab4 sol\tr
    fa2 r4

}

IIvlan = \relative do' {

    r4 lab' fa
    fa fa r
    r fa reb

    %4
    do do r
    lab' lab do
    sol sol mi

    %7
    fa do do
    do2 r4
    r do' do

    %10
    sib sib mib,
    mib mib r
    do' sib sol

    %13
    lab lab, r
    fa' fa sib
    sib sib r\mbreak

    %16
    mib, mib lab
    lab lab r
    re, re sol

    %19
    sol sol r
    do, do fa
    fa fa r

    %22
    sib, sib mib
    mib r r
    fa sol lab

    %25
    R2.
    fa4\p sol lab
    r sib\f sib

    %28
    r lab do
    fa, mib mib
    mib2 r4

    %31
    fa lab fa\mbreak
    sol do, mi
    fa fa, si

    %34
    do do,8 do do4
    fa'\p lab fa
    sol do, mi

    %37
    fa fa, si
    do2 r4
    do'\f do do

    %40
    do do r
    do,\p do do
    do do r

    %43
    r fa\f fa
    r fa\p fa
    r mi\f mi

    %46
    r fa\p fa
    fa2.\f \mbreak
    fa

    %49
    reb4 do si
    do2 r4
    do' do do

    %52
    do do do
    do\p do do
    do do do

    %55
    do\f do do
    do do do
    reb do do

    %58
    do r r
    r do,\p do
    do r r

    %61
    r do\f do
    do2 r4

}


IIbcn = \relative do {

    r4^\markup\italic "Senza Cembalo" fa lab
    sib fa r
    r reb sib

    %4
    sib lab sol
    fa fa' fa,
    r do'' do,

    %7
    r fa fa,
    do'2 r4
    r lab' lab,

    %10
    mib' sol mib
    lab lab, r
    lab' sol mib

    %13
    lab lab, r
    sib' sib lab
    solb solb r\mbreak

    %16
    lab lab solb
    fa fa r
    sol! sol fa

    %19
    mib mib r
    fa fa mib
    reb reb r

    %22
    mib mib reb
    do r r
    sib' mib, lab

    %25
    R2.
    sib4\p mib, lab
    r reb\f reb,

    %28
    r do' do,
    reb mib mib
    lab,2 r4

    %31
    fa' lab fa\mbreak
    sol do, mi
    fa fa, si

    %34
    do do,8 do do4
    fa'\p lab fa
    sol do, mi

    %37
    fa fa, si
    do2 r4
    do2\f do4

    %40
    fa fa, r
    do'2\p do4
    fa fa, r

    %43
    r sib'\f sib,
    r fa'\p fa,
    r do''\f do,

    %46
    r fa\p fa
    sib2.\f \mbreak
    lab

    %49
    reb,4 do si
    do2 r4
    do do do

    %52
    do do do
    do\p do do
    do do do

    %55
    do\f do do
    fa do fa,
    sib do do

    %58
    fa r r
    r do'\p do,
    fa, r r

    %61
    r do''\f do,
    fa,2 r4

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key fa\minor
    \tempo 2 = 43
    s2.*30
    \bar":..:"\break
    s2.*32
    \bar":|."


}



IIvlI = {
    \global
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

}


IIvla = {
    \global
    \clef alto
    <<\IIvlan \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}

IIIvlIn = \relative do'' {

    do4. la'8
    \grace do, sib4. sol'8
    \grace sib, la4. fa'8

    %4
    sol,\tr(fad) sol4
    do8\p la' sol16(fa) mi(re)
    \grace do8 sib4. sol'8

    %7
    \grace sib, la4. fa'8
    sol,4 do\f
    re8[la' sol si,]

    %10
    do16(si? do8) do\p\tr(dod)
    re[la' sol si,]
    do do4\f  do8~\mbreak

    %13
    do la'16 sol fad mi re do
    si8 si4\tr la16 sol
    mi'8 mi4\tr re16 do

    %16
    si8 si4\tr la16 sol
    mi'8\p mi4\tr re16 do
    si8 si4\tr la16 sol

    %19
    la'8\f la4 sol16 fa
    mi sol fa la sol mi re do
    re8 do4 si8

    %22
    do4 do'
    si16 la sol fa mi re do si\mbreak
    la4 la'

    %25
    sol16 fa mi re do sib? la sol
    fa4 fa'
    la16 sol fa mi re do si do

    %28
    si8 do4(re8)
    mib fad4(sol8)
    si, do4\p(re8)

    %31
    mib fad4(sol8)
    si,4 la'\tr\f
    sol\tr fa\tr

    %34
    \tuplet 3/2 { mi8(sol fa) mi[(re do)] }
    sol4 re'\tr \mbreak
    \tuplet 3/2 {
        do8 do, re mi[fa sol]

        %37
        la(do fa) si,(re sol)
        do, la' sol fa[mi re]
    }
    mi4 re\tr
    \tuplet 3/2 {

        %40
        do8 do, re mi[fa sol]
        la(do fa) si,(re sol)
        do, la' sol fa[mi re]
    }

    %43
    mi4 re\tr
    do4 r  %% OOKK fine ritornello
    do4. do'8

    %46
    \grace sol fad4. mib8
    \grace mib re4. do8\mbreak
    mib,4(re8) mi

    %49
    fad[sol la sib]
    do re mib4~
    mib8 re16 do sib8 la

    %52
    sib[re sol(sib)]
    r16 la, sib do re, do' sib la
    sib8[re sol(sib)]

    %55
    r16 la, sib do re, do' sib la
    sib8 sol sol,4
    sib' sib'8(la16 sol)

    %58
    \grace fa8 mi4. re8
    \grace re do4. sib8\mbreak
    re,4(do8) [\appoggiatura mi re]

    %61
    \appoggiatura fa mi[\appoggiatura sol fa \appoggiatura la sol\appoggiatura sib la]
    sib mi16 fa sol4~
    sol16 fa mi re do8 sib

    %64
    la fa' fa,4
    mib'2
    re16(do sib4.)

    %67
    fa8 do'4 mib8
    re16(do sib4.)
    fa'2

    %70
    mi16(re do4.)
    sol8 re'4 fa8
    mi16(re do4.)

    %73
    sib'2\mbreak
    la16(sol fa4.)
    do8 sol'4 sib8

    %76
    la16(sol fa4) re'8\p
    \grace do8 si4. do8
    \grace sib!8 la4. sib8

    %79
    \grace la sold4. la8
    \grace sol? fad4. sol8
    \grace fa? mi4. fa8\f

    %82
    sib la16 sol \grace sib8 la sol16 fa
    sol(mi) do4\p re32(mi fa sol64 la)
    sib8 la16 sol \grace sib8 la sol16 fa

    %85
    sol(mi) do4\f re32(mi fa sol64 la)\mbreak
    sib8 la16 sol \grace sib8 la sol16 fa
    \grace la8 sol fa16 mi fa do sib' la

    %88
    la4 sol\tr
    \tuplet 3/2 {
        fa8 fa, sol la[sib do]
        re(fa sib) mi,[(sol do)]

        %91
        fa, re' do sib[la sol]
    }
    la4 sol\tr
    \tuplet 3/2 {
        fa8 fa, sol la[sib do]

        %94
        re(fa sib) mi,[(sol do)]
        fa, re do sib[la sol]
    }
    la4 sol\tr

    %97
    fa r

}

IIIvlIIn = \relative do'' {

    do4. la'8
    \grace do, sib4. sol'8
    \grace sib, la4. fa'8

    %4
    sol,\tr(fad) sol4
    do8\p la' sol16(fa) mi(re)
    \grace do8 sib4. sol'8

    %7
    \grace sib, la4. fa'8
    sol,4 do\f
    re8[la' sol si,]

    %10
    do16(si? do8) do\p\tr(dod)
    re[la' sol si,]
    do do4\f  do8~\mbreak

    %13
    do la'16 sol fad mi re do
    si8 sol4 la16 si
    do8 do4\tr si16 la

    %16
    sol8 sol4\tr la16 si
    do8\p do4\tr si16 la
    sol8 si4 la16 sol

    %19
    fa'8\f fa4 mi16 re
    mi sol fa la sol mi re do
    re8 do4 si8

    %22
    do4 do'~
    do si~
    si la~

    %25
    la sol~
    sol fa
    la16 sol fa mi re do si la\mbreak

    %28
    sol8 la4(si8)
    do do4(si8)
    sol8 la4\p (si8)

    %31
    do do4(si8)
    si?4 fa'\f\tr
    mi\tr re\tr

    %34
    do do~
    do si\tr
    \tuplet 3/2 {
        do8 do, re mi[fa sol]

        %37
        la(do fa) si,(re sol)
        do, la' sol fa[mi re]
    }
    do4 si\tr
    \tuplet 3/2 {

        %40
        do8 do, re mi[fa sol]
        la(do fa) si,(re sol)\mbreak
        do, la' sol fa[mi re]
    }

    %43
    do4 si\tr
    do r
    do4. do'8

    %46
    \grace sol fad4. mib8
    \grace mib re4. do8\mbreak
    mib,4\parenthesize (re8) mi

    %49
    fad[mi fad sol]
    la sib do4~
    do8 sib16 la sol8 fad

    %52
    sol8[sib re(sol)]
    r16 fad, sol la fad la sol fad
    sol8[sib re(sol)]\mbreak

    %55
    r16 fad, sol la fad la sol fad
    sol8 sib, sib4
    sib' sib'8(la16 sol)

    %58
    \grace fa8 mi4. re8
    \grace re do4. sib8
    re,4\parenthesize (do8) [\appoggiatura mi re]

    %61
    \appoggiatura fa mi[\appoggiatura mi re \appoggiatura fa mi\appoggiatura sol fa]
    sol sib4 mi8
    sol16 fa mi re do8 sib

    %64
    la fa' fa,4
    do'2
    sib16(do re4.)

    %67
    do8 la4 do8
    sib16(do re4.)
    re2\mbreak

    %70
    do16(re mi4.)
    re8 si?4 re8
    do16(re mi4.)

    %73
    sol2
    fa16(sol la4.)
    sol8 mi4 sol8

    %76
    fa16(sol la8) r4
    r8 fa\p mib4
    r8 mib re4

    %79
    r8 re do4
    r8 do sib4
    r8 sib la4

    %82
    sol'8\f fa16 mi fa8 la,
    sol mi4 mi'8\p
    sol8\f fa16 mi fa8 la,

    %85
    sol mi4 mi'8\f\mbreak
    sol fa16 mi fa8 la,
    sol la16 sib la fa' sol fa

    %88
    fa4 mi\tr
    \tuplet 3/2 {
        fa8 fa, sol la[sib do]
        re(fa sib) mi,[(sol do)]

        %91
        fa, re' do sib[la sol]
    }
    fa4 mi\tr
    \tuplet 3/2 {
        fa8 fa, sol la[sib do]

        %94
        re(fa sib) mi,[(sol do)]
        fa, re do sib[la sol]
    }
    fa4 mi\tr

    %97
    fa r

}

IIIvlan = \relative do' {

    fa8[sol la fa]
    sol[fa mi do]
    fa fa, sib si

    %4
    do do, do4
    fa'8\p[sol la fa]
    sol[fa mi do]

    %7
    fa fa, sib si
    do4 sol'\f
    la si

    %10
    mi, sol\p
    la si
    mi, mi\f

    %13
    re re
    re re
    la la

    %16
    si re
    la\p la
    si re

    %19
    re\f re8 sol\mbreak
    sol4 sol
    la sol

    %22
    sol sol
    sol sol
    mi mi

    %25
    mi mi
    do do
    do re

    %28
    re sol
    sol sol
    sol sol,\p

    %31
    sol sol
    sol sol'\f
    sol sol

    %34
    sol la
    sol sol
    sol do,

    %37
    do sol'
    sol la
    sol sol

    %40
    sol do,
    do sol'
    sol la

    %43
    sol sol\mbreak
    sol r
    sol sol

    %46
    la la
    R2*2
    la4 la

    %50
    fad fad
    fad? re
    re re

    %53
    re re
    re re
    re re

    %56
    re r
    sol fa
    mi sol

    %59
    R2*2
    sol4 sol
    sol sol

    %63
    mi mi
    fa8[la la sol]
    \repeat unfold 32 {fa16}

    %69
    \repeat unfold 32 {sol}
    \repeat unfold 24 {do}
    do4 r

    %77
    R2*5
    do4\f do
    do do,\p

    %84
    do do
    do do\f
    do do

    %87
    do do
    do do
    do fa

    %90
    fa mi
    fa re
    do do

    %93
    do fa
    fa mi
    fa re

    %96
    do do
    do r

}


IIIbcn = \relative do {

    fa8[sol la fa]
    sol[fa mi do]
    fa fa, sib si

    %4
    do do, do4
    fa'8\p[sol la fa]
    sol[fa mi do]

    %7
    fa fa, sib si
    do4 mi\f
    fa sol

    %10
    la mi\p
    fa sol
    la sol\f

    %13
    fad fad
    sol sol
    fad fad\mbreak

    %16
    sol sol
    fad\p fad
    sol sol

    %19
    si\f si
    do do,
    fa sol

    %22
    do,8[do mi do]
    sol'4 sol
    la8[la, do la]

    %25
    mi'4 mi
    fa8[fa, la fa]
    fa'4 fad

    %28
    sol sol
    sol sol
    sol sol,\p

    %31
    sol sol
    sol \parenthesize fa\f
    sol sol

    %34
    do fa\mbreak
    sol sol,
    do do

    %37
    fa sol
    mi fa
    sol sol,

    %40
    do do
    fa sol
    mi fa

    %43
    sol sol,
    do4 r
    mib mib

    %46
    re re
    R2*2
    re4 re

    %50
    re re
    re re
    sol sol,

    %53
    re' re
    sol sol,
    re' re

    %56
    sol, sol'8 fa
    mi4 re\mbreak
    do do

    %59
    R2*2
    do4 do
    do do

    %63
    do do
    fa8[fa, fa sol]
    la[la' la la,]

    %66
    sib[sib' sib sib,]
    la[la' la la,]
    sib[sib' sib sib,]

    %69
    si[si'? si si,]
    do[do' do do,]
    si[si'? si si,]

    %72
    do[do' do do,]
    mi[mi' mi mi,]\mbreak
    fa[fa' fa fa,]

    %75
    mi[mi' mi mi,]
    fa[fa, fa] r
    R2*5

    %82
    do'4\f fa
    do' do,
    do\p fa

    %85
    do' do,\f
    do fa
    do' fa,

    %88
    do' do,
    fa fa
    sib do

    %91
    la sib
    do do,
    fa fa,

    %94
    sib do
    la sib
    do do,

    %97
    fa r

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*13
    <_!>2
    s
    <_!>
    s
    <_!>
    s
    s
    s4 <_!>
    s2
    <_!>
    s2*4
    <_!>2
    <6- 4>
    <_!>
    <6- 4>
    <3>
    s2*4
    s4 <_!>
    s2
    s4 <_!>
    s2
    s4 <_!>
    s2
    <_!>
    s
    s
    <_+>
    s
    s
    <_+>
    s2*3
    <_+>2
    s
    <_+>

}

forma = {

    \time 2/4
    \key fa\major
    \tempo 2 = 60
    s2*44
    \bar":..:"\break
    s2*53
    \bar":|."

}



IIIvlI = {
    \global
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}


IIIvla = {
    \global
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    la'4\upl mi\upl dod\upl la_\upl
    la_\upl mi_\upl dod_\upl la8 mi'
    la mi si' mi, dod' mi, re' mi,

    %4
    mi' re16 dod si8 [la] sold mi r mi'
    red16(mi fad sold) la4~la8 sold4 fad16 mi\mbreak
    red\p(mi fad sold) la4~la8 sold4 fad16 mi

    %7
    red,\f(mi fad sold) la4~la8 sold4 fad16 mi
    red\p(mi fad sold) la4~la8 sold4 fad16 mi
    red4  fad'\f si, la

    %10
    sold mi'4. red16 mi fad8 [la,]
    sold mi mi'4. red16 mi fad8 [la,]
    sold16 si la sold la8. [dod16] si red dod si dod8. [mi16]\mbreak

    %13
    red8 si mi si fad' si, sold' si,
    la'4\upl la\upl la8 fad red si
    la4_\upl la_\upl la8 fad red si

    %16
    sold mi'4 sold,8 la mi'4 la,8
    lad mi'4 lad,8 si la'!4 fad8
    sold dod4 la8 si red mi la

    %19
    sold4  fad\tr mi8 si sold mi
    si'4 si, mi2
    mi'4\upl si\upl sold_\upl mi_\upl \mbreak

    %22
    dod'\upl sold_\upl mi_\upl dod_\upl
    dod'4 mid fad8 dod4 la'8
    sold dod,4 si'8 la16(si la sold) \grace sold8 la4

    %25
    r8 dod,(re la') sold16(la sold fad) \grace fad8 sold4
    r8 sid,(dod sold') fad16(sold fad mid) \grace mid8 fad4
    r8 lad,(si fad') mid dod fad dod

    %28
    sold' dod, la' [sold16(fad)] mid8 dod fad dod\mbreak
    sold' dod, la' dod, si' mid,(sold) si,(
    re) mid,(sold) si, la fad'4 la,8

    %31
    si fad'4 si,8 sid fad'4 sid,8
    dod si'?4 sold8 la re4 si8
    dod mid fad si la4 sold\tr

    %34
    fad8 dod la fad dod'4 dod,
    fad la8. dod16 fad,4 r
    la'4\upl mi\upl dod\upl la_\upl

    %37
    la_\upl mi_\upl dod_\upl la8 mi'\mbreak
    la8 mi si' mi, dod' mi, re' mi,
    mi' re16 dod si8 [la] sold mi r mi'

    %40
    red16(mi fad sold) la4~la8 sold4 fad16 mi
    red16\p(mi fad sold) la4~la8 sold4 fad16 mi
    red8\f mi r si sold16(la si dod) re?4~

    %43
    re8 mi4 si16 la sold16\p(la si dod) re4~
    re8 dod4 si16 la sold8\f la r mi
    fad re'16 si sold8 [mi'16 dod] la8 fad'16 re si8 [sold'16 mi]
    dod8 la'16 fad re8 [si'] sold mi r mi

    %47
    mi\tr(re) re\tr(dod) re lad'4(si8)
    re,\tr(dod) dod\tr(si) dod sold'4(la?8)
    mi\p\tr(re) re\tr(dod) re lad'4(si8)\mbreak

    %50
    re,\tr(dod) dod\tr(si) dod sold'4(la?8)
    fad16\f mi re dod si [la sold fad] mi4 si'
    mi, re\tr dod8 la'4 dod,8

    %53
    re la'4 re,8 red la'4 red,8
    mi re'?4 si8 dod fad4 re8
    mi la fad re dod4 si\tr

    %56
    la8 mi' dod la mi'4 mi,
    la,2 r

}

IVvlIIn = \relative do'' {

    la'4\upl mi\upl dod\upl la_\upl
    la_\upl mi_\upl dod_\upl la8 mi'
    la mi si' mi, dod' mi, re' mi,

    %4
    mi' re16 dod si8 [la] sold mi r4
    r8 si' red fad r si, mi sold
    r si,\p red fad r si, mi sold\mbreak

    %7
    r8 si,,\f red fad r si, mi sold
    r si,\p red fad r si, mi sold
    fad4 fad'\f si, la

    %10
    sold mi'4. red16 mi fad8 [la,]
    sold mi mi'4. red16 mi fad8 [la,]
    sold16 si la sold la8. [dod16] si red dod si dod8. [mi16]\mbreak

    %13
    red8 si mi si fad' si, sold' si,
    la'4\upl la\upl la8 fad red si
    la4_\upl la_\upl la8 fad red si

    %16
    sold mi'4 sold,8 la mi'4 la,8
    lad mi'4 lad,8 si la'!4 fad8
    sold dod4 la8 si red mi la

    %19
    sold4  fad\tr mi8 si sold mi
    si'4 si, mi2
    mi'4\upl si\upl sold_\upl mi_\upl \mbreak

    %22
    dod'\upl sold_\upl mi_\upl dod_\upl
    dod'4 mid fad8 dod4 la'8
    sold dod,4 si'8 la16(si la sold) \grace sold8 la4

    %25
    re, re2 dod4
    dod dod2 si4
    si si si la8 fad'

    %28
    mid sold, fad la sold dod fad, fad'
    mid sold, fad la sold mid'(sold) si,(
    re) mid,(sold) si, la fad'4 la,8

    %31
    si fad'4 si,8 sid fad'4 sid,8
    dod si'?4 sold8 la re4 si8
    dod mid fad si la4 sold\tr

    %34
    fad8 dod la fad dod'4 dod,
    fad la8. dod16 fad,4 r
    la'4\upl mi\upl dod\upl la_\upl

    %37
    la_\upl mi_\upl dod_\upl la8 mi'\mbreak
    la8 mi si' mi, dod' mi, re' mi,
    mi' re16 dod si8 [la] sold mi r4

    %40
    r8 si' red fad r si, mi sold\mbreak
    r8 si,\p red fad r si, mi sold
    fad\f sold r4 r8 mi, sold si

    %43
    r mi, la dod r mi,\p sold si
    r mi, la dod si\f dod r mi,
    fad re'16 si sold8 [mi'16 dod] la8 fad'16 re si8 [sold'16 mi]

    %46
    dod8 la'16 fad re8 [si'] sold mi r4
    dod8\tr(si) si(\tr(la) si4 r
    si8\tr(la) la\tr(sold) la4 r\mbreak

    %49
    dod8\p\tr(si) si(\tr(la) si4 r
    si8\tr(la) la\tr(sold) la4 r
    fad'16\f mi re dod si [la sold fad] mi4 si'

    %52
    mi, re\tr dod8 la'4 dod,8
    re la'4 re,8 red la'4 red,8
    mi re'?4 si8 dod fad4 re8

    %55
    mi la fad re dod4 si\tr
    la8 mi' dod la mi'4 mi,
    la,2 r

}

IVvlan = \relative do' {

    R1
    la'4\upl mi\upl dod\upl la_\upl
    la sold la si

    %4
    dod fad mi8 fad sold la
    si4 si si si
    si\p si si si

    %7
    si,\f si si si
    si\p si si si
    si red\f fad si,\mbreak

    %10
    si si' la fad8 si
    si4 si la fad8 si
    si4 mi, mi mi8 dod'

    %13
    fad,4 si si si8 sold
    fad4 red red fad
    fad red red fad

    %16
    sold si, dod dod
    dod dod red si'
    si fad sold8 la sold mi

    %19
    mi4 red mi8 si' sold mi\mbreak
    si'4 si, mi2
    R1

    %22
    dod'4\upl sold\upl mi\upl dod\upl
    sold' dod dod dod
    dod dod dod dod

    %25
    la fad mid mid
    mi! mi red red
    re! re dod dod'

    %28
    dod dod dod dod
    dod dod dod r
    mid, mid mid dod

    %31
    re re red red
    mid dod' dod sold\mbreak
    la8 si la fad fad4 mid

    %34
    fad8 dod' la fad dod'4 dod,
    fad r fad8.[mi16 fad8. sold16]
    la4 r r2

    %37
    la4\upl mi\upl dod\upl la_\upl
    la sold la si
    dod fad mi8 fad sold la

    %40
    si4 si si si
    si\p si si si
    si8\f si r4 mi, mi

    %43
    mi mi mi\p mi
    mi mi mi8\f mi r la,~\mbreak
    la si4 dod re mi8~

    %46
    mi fad4 fad8 mi4 sold
    la mi mi mi
    mi mi mi mi

    %49
    mi\p mi mi mi
    mi mi mi mi
    re\f fad sold sold

    %52
    si mi, mi mi
    fad fad fad si
    si mi, mi si'

    %55
    dod la la sold
    la8 mi dod la mi'4 mi,
    la2 r

}


IVbcn = \relative do {

    R1
    la'4\upl mi\upl dod_\upl la_\upl
    la sold la si

    %4
    dod re mi8 fad sold la
    si4 si si si
    si\p si si si

    %7
    si,\f si si si
    si\p si si si
    si si\f red red\mbreak

    %10
    mi sold fad si,
    mi sold fad si,
    mi dod' sold la

    %13
    si sold red mi
    si8 si' fad[red] si4 si
    si8 si' fad[red] si4 si

    %16
    mi sold, la la
    lad lad si red
    mi la sold8 fad sold la

    %19
    si4 si, mi8 si' sold mi\mbreak
    si'4 si, mi,2
    R1

    %22
    dod''4\upl sold\upl mi\upl dod_\upl
    dod si la fad'
    mid mid fad fad

    %25
    fad fad mid mid
    mi! mi red red
    re! re dod la'

    %28
    mid fad dod' la
    mid fad dod r
    r dod fad la,

    %31
    si si sid sid
    dod mid fad si
    la8 sold la si dod4 dod,

    %34
    fad8 dod' la fad dod'4 dod,
    fad, r fad'8.[mi16 fad8. sold16]
    la4 r r2

    %37
    la4\upl mi\upl dod_\upl la_\upl
    la sold la si
    dod re mi8 fad sold la

    %40
    si4 si si si
    si\p si si si
    si8\f mi, r4 mi mi

    %43
    mi mi mi\p mi
    mi mi mi8\f la, dod la\mbreak
    re4 mi fad sold

    %46
    la fad8 re mi4 mi,
    mi' mi mi mi
    mi mi mi mi

    %49
    mi\p mi mi mi
    mi mi mi mi
    re\f re mi mi

    %52
    sold, sold la  dod
    re re red red
    mi sold la re

    %55
    dod re8 si mi4 mi,
    la8 mi dod la mi'4 mi,
    la2 r

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s1
    s
    s4 <6> s <6>
    <6> <6 5> s2
    <_+> s4 <6 4>
    <5 3+> s <6 4> s
    <5 3+> s s <6 4>
    <5 3+> s s <6 4>
    <5 3+> s s <6 5>
    s <6> <7> <7 _+>
    s <6> <7> <7 _+>
    s <6> <6> <6 5>
    <_+> <6> <6> s
    <_+>2 <7>
    s <7>
    s4 <6> s2
    <6 5> <_+>4 <6 5>
    s <6> <6> s
    <6 4> <5 3+> s2
    <_+>1
    s
    s
    <_+>4 <4+ 2> <6> s
    <6 5>1
    <6>2 <7>4 <6>
    <6> s <7> <6>
    <6> s <_+> <6>
    <6> s <_+> <6>
    <6> s <_+> s
    s <_+> s <6>
    s2 <6 5>
    <_+>4 <6 5> s <6>
    <6>2 <6 4>4 <5 3+>
    s2 <4>4 <3+>
    s1*3
    s4 <6> s <6>
    <6> <6 5> s2
    <_+> s4 <6 4>
    <5 3+> s s <6 4>
    <5 3+>1
    s4 <6 5> <5 3> s
    s <6 4> <5 3> <6>
    <56> <56> <56> <56>
    s4 <6> s s
    <6 4>2 <5 3>
    <7> <6 4>
    s <5 3>
    <7> <6 4>
    <6>1
    <6>
    s2 <6 5>
    s4 <6> s <6>
    <6> s <6 4> <5 3>
    s s <4> <3>

}

forma = {

    \time 2/2
    \key la\major
    \tempo 2 = 67
    s1*20
    \bar":..:"\break
    s1*37
    \bar":|."

}



IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}


IVvla = {
    \global
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VvlIn = \relative do'' {

    mi16\mp
    mi4~mi16 fa-.(mi-. re-. do-. si-. la-. sold-.)
    \grace sold?8 la4~la16 sib-.(la-. sol-. fa-. mi-. re-. dod-.)
    \once\stemUp re8 fa' r mi16(re) mi(do) re(si)

    %4
    do8. si16 la8 do si la
    si16(red) \grace red8 mi4 si16(re) do(si) la(sold)
    la8 fa'~fa16 mi(re do) si8 la

    %7
    \grace la sold2 r4\mbreak
    mi'4~mi16(re) do(si) la(sold) la(do)
    sib4. sol'4 mi8

    %10
    \grace re dod4~dod16(sib) la(sold) la sol'?(fa mi)
    \grace mi8 fa4~fa8 la16(sol) fa(mi) re(do)
    si(re) do(mi) re(do) si(la) sol8 fa\tr

    %13
    mi16 sol'(si, do) \grace re8 do16(si do16.) do32 \grace re8 do16(si do16.) do32
    fa,16 la'(dod, re) \grace mi8 re16(dod re16.) re32 \grace mi8 re16(dod re16.) re32\mbreak
    mi,16 sol'(si, do) \grace re8 do16(si do16.) do32 \grace re8 do16(si do16.) do32

    %16
    fad16(sol) la8~la16 fad(sol la) re,8 do\tr
    \grace do si4~si16 si(do re) sol,8 fa\tr
    mi do' fa, do' sol do

    %19
    la fa'16(re) mi4 re\tr
    mi,8 do' fa, do' sol do
    la fa'16(re) mi4 re\tr

    %22
    do8 sol do,4 r8 r16 do'\mbreak
    do4~do16 re(do si do re mi fa)
    sol4. sib8 \grace la sol fa16 (mi)

    %25 OOKK
    \grace re8 dod4~dod16(re) mi (fa) sol(la,) mi'(la,)
    fa'8 la r sol r fad16(mi)
    \grace mi8 red4~red16(mi) fad(sol) la(si,) fad'(si,)

    %28
    sol'8 si r si sold fad16 (mi)
    la8. mi16 red(mi) fad(mi) red(mi) fad(mi)\mbreak
    sib'8. mi,16  red(mi) fad(mi) red(mi) fad(mi)

    %31
    do'(si la sold) la(sol? fa? mi) fa8 do'
    do(si) si(lad) \grace lad8 si4~
    si16 (la? sol fad) sol(fad mi red) mi8 si'

    %34
    si(la) la(sold) \grace sold8 la4~
    la16 (sol? fa mi) fa(mi re dod) re8 la'
    \grace la sold4. re8 do si

    %37
    do16(re mi4) do8[si la]\mbreak
    sold16(la si4) si8[la sold]
    la16(si do4) la8[sold fad]

    %40
    mi16(fad sold4) mi8[sold si]
    re-.(re-. re-. re-. re-. re-.)
    red-.(red-. red-. red-. red-. red-.)

    %43
    mi si' re,!4. do16 (si)
    do8 si16(la) si4. do16(re)
    do8 si16(la) si4. do16(re)

    %46
    do8 la'16 (la,) do4 si\tr
    la8 mi la,4 r8 r16

}

VvlIIn = \relative do'' {

    mi16\mp
    mi4~mi16 fa-.(mi-. re-. do-. si-. la-. sold-.)
    \grace sold?8 la4~la16 sib-.(la-. sol-. fa-. mi-. re-. dod-.)
    \once\stemUp re8 fa' r mi16(re) mi(do) re(si)

    %4
    do8. si16 la8 do si la
    si16(red) \grace red8 mi4 si16(re) do(si) la(sold)
    la8 fa'~fa16 mi(re do) si8 la

    %7
    \grace la sold2 r4\mbreak
    mi'4~mi16(re) do(si) la(sold) la(do)
    sib4. sol'4 mi8

    %10
    \grace re dod4~dod16(sib) la(sold) la sol'?(fa mi)
    \grace mi8 fa4~fa8 la16(sol) fa(mi) re(do)
    si(re) do(mi) re(do) si(la) sol8 fa\tr

    %13
    mi16 sol'(si, do) \grace re8 do16(si do16.) do32 \grace re8 do16(si do16.) do32
    fa,16 la'(dod, re) \grace mi8 re16(dod re16.) re32 \grace mi8 re16(dod re16.) re32\mbreak
    mi,16 sol'(si, do) \grace re8 do16(si do16.) do32 \grace re8 do16(si do16.) do32

    %16
    fad16(sol) la8~la16 fad(sol la) re,8 do\tr
    \grace do si4~si16 si(do re) sol,8 fa\tr
    mi do' fa, do' sol do

    %19
    la fa'16(re) mi4 re\tr
    mi,8 do' fa, do' sol do
    la fa'16(re) mi4 re\tr

    %22
    do8 sol do,4 r8 r16 do'\mbreak
    do4~do16 re(do si do re mi fa)
    sol4. sib8 \grace la sol fa16 (mi)

    %25 OOKK
    \grace re8 dod4~dod16(re) mi (fa) sol(la,) mi'(la,)
    fa'8 la r sol r fad16(mi)
    \grace mi8 red4~red16(mi) fad(sol) la(si,) fad'(si,)

    %28
    sol'8 si r si sold fad16 (mi)
    la8. mi16 red(mi) fad(mi) red(mi) fad(mi)\mbreak
    sib'8. mi,16  red(mi) fad(mi) red(mi) fad(mi)

    %31
    do'(si la sold) la(sol? fa? mi) fa8 do'
    do(si) si(lad) \grace lad8 si4~
    si16 (la? sol fad) sol(fad mi red) mi8 si'

    %34
    si(la) la(sold) \grace sold8 la4~
    la16 (sol? fa mi) fa(mi re dod) re8 la'
    \grace la sold4. si,8 la sold

    %37
    la16(si do4) la8 sold fad
    mi16(fad sold4) re8 do si\mbreak
    do16(re mi4) do8 si la

    %40
    sold16(la si4) si8 mi sold
    la-.(la-. la-. la-. la-. la-.)
    la-.(la-. la-. la-. la-. la-.)

    %43
    sold4 si4. la16(sold)
    la8 sold16 (fad) sold4. la16(si)
    la8 sold16( fad) sold4. la16(si)

    %46
    si8 la la4 sold\tr
    la8 mi la,4 r8 r16

}

Vvlan = \relative do' {

    r16
    do8\mp do do do mi mi
    mi mi mi mi fa sol
    fa la sold si la sold

    %4
    la mi mi mi mi mi
    mi mi si' si si si
    do do do do la la

    %7
    si2 r4
    la8 la la la mi mi
    mi mi mi mi mi mi\mbreak

    %10
    mi mi mi mi mi la
    la la la la re, re
    re re re re re sol

    %13
    sol sol sol sol sol sol
    r la la la la la
    r sol sol sol sol sol

    %16
    fad fad fad fad la la
    re, re re re re sol
    sol mi re re mi mi\mbreak

    %19
    fa la sol4 sol
    sol8 mi re re mi mi
    fa la sol4 sol

    %22
    sol2 r8 r16 r
    sol8 sol sol sol sol sol
    mi mi mi mi mi mi

    %25
    mi mi mi mi la la
    la fa fa mi re do
    si fad' fad fad si si

    %28
    si si si si mi, mi\mbreak
    mi la la la la la
    mi si' si si si si

    %31
    mi, mi fa fa fa fa
    fa fa fa fa fa fa
    mi mi mi mi mi mi

    %34
    mi mi mi mi mi mi
    re re re re re re
    si si si mi mi mi

    %37
    mi mi, mi mi' mi mi\mbreak
    mi mi, mi mi' mi mi
    mi mi, mi mi' mi mi

    %40
    mi mi, mi mi' mi mi
    fa fa fa fa fa fa
    fa fa fa fa fa fa

    %43
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %46
    mi mi fa fa mi mi
    mi2 r8 r16

}


Vbcn = \relative do {

    r16
    la8\mp la la la si si
    do do do dod re mi
    fa re mi mi mi mi

    %4
    la la la la la la
    sol sol sol sol sol sol
    fa fa fa fa fa fa

    %7
    mi mi' mi, fa mi re
    do do do do do do
    dod dod dod dod dod dod \mbreak

    %10
    dod dod dod dod dod dod
    re re re re fa fa
    sol sol sol sol si, si

    %13
    do mi mi mi mi mi
    r fa fa fa fa fa
    r mi mi mi mib mib

    %16
    re re re re fad fad
    sol sol sol sol si, si
    do do re re mi mi\mbreak

    %19
    fa fa sol sol sol, sol
    do do re re mi mi
    fa fa sol sol sol, sol

    %22
    do2 r8 r16 r
    do'8 do do do do do
    sib sib sib sib sib sib

    %25
    la la la la dod, dod
    re re re mi re do?
    si si si si red red

    %28
    mi mi mi mi re! re\mbreak
    do do do do do do
    sold sold sold sold sold sold

    %31
    la la' la la la la
    sold sold sold sold sold sold
    sol! sol sol sol sol sol

    %34
    fad fad fad fad fad fad
    fa! fa fa fa fa fa
    mi mi mi mi mi mi

    %37
    mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %40
    mi mi mi mi mi mi
    fa fa fa fa fa fa
    fa fa fa fa fa fa

    %43
    mi mi mi mi mi mi
    la la mi mi mi mi
    la la mi mi mi mi

    %46
    la la re, re mi mi
    la,2 r8 r16

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s16
    s2 <6+ 4 3>4
    <6>2 s8 <6+>
    <6>4 <_+> s
    s2.
    <6>
    <6>
    <_+>
    <6>
    <7- 5>
    s
    s2 <6 5>4
    s2 <6 5>4
    s8 <6> s2
    s8 <6> s2
    s8 <6> s2
    <_+> <6 5>4
    s2 <6 5>4
    s <6> <6>
    <5> <6 4> <5 3>
    s <6> <6>
    <5> <6 4> <5 3>
    s2.
    s
    <4 2>
    <7 _+>2 <6 5>4
    s2.
    <_+>2 <6 5>4
    s <_+> <4+ 2>
    <6>2.
    <6>
    s4 <6>2
    <7>2.
    <6>
    <7>
    <6>
    <7 _+>
    <6 4>
    <5 3+>
    <6 4>
    <5 3+>
    <6>
    <6+>
    <_+>2 <7>4
    s <_+>2
    s4 <_+>2
    s4 <6 5> <7 _+>

}

forma = {

    \time 3/4
    \key la\minor
    \tempo 2 = 30
    \partial 16 s16
    s2.*21
    s2 s8 s16
    \bar":..:"\break
    s
    s2.*24
    s2 s8 s16
    \bar":|."

}



VvlI = {
    \global
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}


Vvla = {
    \global
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIvlIn = \relative do'' {

    r16 la dod mi
    la4 sold8. la16
    fad4\tr  mi8. fad16
    re4\tr dod8. re16

    %4
    si4\tr la16 mi fad sold
    la8 mi4 dod'8
    si mi,4 re'8

    %7
    dod si16 la mi'8 dod
    dod\tr si r16 si dod red
    mi8 si4 sold'8

    %10
    fad si,4 la'8
    sold fad16 sold la8 sold\mbreak
    sold\tr fad r si,

    %13
    si[(lad) lad\upl mi'\upl]
    mi[(red) red\upl si\upl\p]
    si[(lad) lad\upl mi'\upl]

    %16
    mi[(red) red\upl  la'\upl\f]
    la[(sold) sold(fad)]
    sold fad16 sold la8. mi16

    %19
    sold4 fad\tr
    mi8[mi, mi' mi,]
    mi'[mi, mi' mi,]

    %22
    mi' [dod si mi,]
    sold4 fad\tr
    mi4 r	\mbreak

    %25
    sol'\tr\p sol\tr
    sol\tr sol\tr
    sol?8[(mid) fad mi]

    %28
    mi[(re) re(dod)]
    re[(dod) dod\upl mi\upl]
    mi[(re) re(dod)]

    %31
    \once\stemDown re[si,\f re fad]
    si[si, re fad]
    si si, r4

    %34
    fad''\p\tr fad\tr
    fad\tr fad\tr
    fad8[(red) mi re]

    %37
    re[(dod) dod(si)]
    dod[(si) si re]\mbreak
    re[(dod) dod(si)]

    %40
    \once\stemDown dod[la,\f dod mi]
    la[la, dod mi]
    la la, r16 la' dod mi

    %43
    la4 sold8. la16
    fad4\tr mi8. fad16
    re4\tr dod8. re16

    %46
    si4\tr la16 mi fad sold
    la8 mi4 dod'8
    si mi,4 re'8

    %49
    dod si16 la mi'8 dod
    dod\tr si r mi\p\mbreak
    sold,[la si dod]

    %52
    dod\tr si r mi
    sold,[la si dod]
    re\tr dod r mi\f

    %55
    fad4 sold\tr
    la8 sold16 fad mi8 fad
    fad,4. re'8

    %58
    sold,4\tr la8 re16 si
    dod4 si\tr
    la8[ la, la' la,]

    %61
    la'[ la, la' la,]
    la'[fad mi la,]
    dod4 si\tr

    %64
    la

}

VIvlIIn = \relative do'' {

    r16 la dod mi
    la4 sold8. la16
    fad4\tr  mi8. fad16
    re4\tr dod8. re16

    %4
    si4\tr la16 mi fad sold
    la8 mi4 dod'8
    si mi,4 re'8

    %7
    dod si16 la mi'8 dod
    dod\tr si r16 si dod red
    mi8 si4 sold'8

    %10
    fad si,4 fad'8
    mi red16 mi fad8 mi\mbreak
    mi\tr red r si

    %13
    si[(lad) lad\upl mi'\upl]
    mi[(red) red\upl si\upl\p]
    si[(lad) lad\upl mi'\upl]

    %16
    mi[(red) red\upl fad\upl\f]
    fad[(mi) mi(red)]
    mi4 mi~

    %19
    mi red\tr
    mi8[mi, mi' mi,]
    mi'[mi, mi' mi,]

    %22
    mi' [dod si mi,]
    mi4 red\tr
    mi r

    %25
    mi'4\p\parenthesize \tr re!\parenthesize \tr
    dod\parenthesize \tr si\parenthesize \tr
    lad lad8 dod

    %28
    dod8[(si) si(lad)]
    si[(lad) lad_\upl dod_\upl]
    dod[(si) si(lad)]

    %31
    si [si,\f re fad]
    si[si, re fad]
    si si, r4

    %34
    re'\p \parenthesize \tr dod\parenthesize \tr
    si\parenthesize \tr la\parenthesize \tr
    sold sold8 si

    %37
    si[(la) la(sold)]
    la[(sold) sold si]\mbreak
    si[(la) la(sold)]

    % 40
    la[la,\f dod mi]
    la[la, dod mi]
    la la, r16 la' dod mi

    %43
    la4 sold8. la16
    fad4\tr mi8. fad16
    re4\tr dod8. re16

    %46
    si4\tr la16 mi fad sold
    la8 mi4 dod'8
    si mi,4 re'8

    %49
    dod si16 la mi'8 dod
    dod\tr si r mi\p
    mi,[fad sold la]]\mbreak

    %52
    la\tr sold r mi'
    mi,[fad sold la]]
    si\tr la r mi'\parenthesize \f

    %55
    fad4 sold\tr
    la8 sold16 fad mi8 fad
    fad,4. re'8

    %58
    sold,4\tr la8 re16 si
    dod4 si\tr
    la8[ la, la' la,]

    %61
    la'[ la, la' la,]
    la'[fad mi la,]
    la4 sold\tr

    %64
    la

}

VIvlan = \relative do' {

    r4
    la si8. dod16
    re4 dod8. re16
    si4 la

    %4
    mi' la,
    mi' mi
    mi mi

    %7
    mi8 dod'4 la8
    la sold r4
    si si

    %10
    si si
    si dod
    si red,

    %13
    mi mi
    fad fad
    mi\p mi

    %16
    fad fad
    si,\f si'
    si dod

    %19
    si si,
    mi red
    dod si8 la\mbreak

    %22
    sold4 sold8 la
    si4 si
    mi, r

    %25
    R2*2
    r4 fad'\p
    fad fad

    %29
    fad fad
    fad fad
    si8 [si,\f re fad]

    %32
    si [si, re fad]
    si si, r4
    R2*2

    %36
    r4 mi\p
    mi mi
    mi mi

    %39
    mi mi
    la8 [la,\f dod mi]
    la [la, dod mi]

    %42
    la la, r4
    la si8. dod16\mbreak
    re4 dod8. re16

    %45
    si4 la
    mi' la,
    mi' mi

    %48
    mi mi
    mi8 dod'4 la8
    la sold r4

    %51
    R2
    mi4\p mi,
    R2

    %54
    la'4 la\f
    la re,
    dod r

    %57
    re re
    mi mi8 la
    la4 sold

    %60
    la sold
    fad mi8 re
    dod4 dod8 re

    %63
    mi4 mi,
    la

}


VIbcn = \relative do {

    r4
    la si8. dod16
    re4 dod8. re16
    si4 la

    %4
    mi' la,
    la la
    sold sold

    %7
    la la
    mi' fad
    sold sold

    %10
    red red
    mi la,
    si si

    %13
    dod dod
    si si
    dod\p dod

    %16
    si si
    si\f si
    mi dod

    %19
    si si
    mi red
    dod si8 la\mbreak

    %22
    sold4 sold8 la
    si4 si
    mi r

    %25
    R2*2  %%% OOKK
    r4 fad\p
    fad fad

    %29
    fad fad
    fad fad
    si8 [si,\f re fad]

    %32
    si [si, re fad]
    si si, r4
    R2*2

    %36
    r4 mi\p
    mi mi
    mi mi

    %39
    mi mi
    la8 [la,\f dod mi]
    la [la, dod mi]

    %42
    la la, r4
    la si8. dod16\mbreak
    re4 dod8. re16

    %45
    si4 la
    mi' la,
    la la

    %48
    sold sold
    la la
    mi' mi,

    %51
    R2
    mi'4\p mi,
    R2

    %54
    la'4 la,8.\f dod16
    re4 si
    dod r

    %57
    re re
    mi dod8 re
    mi4 mi

    %60
    la sold
    fad mi8 re
    dod4 dod8 re

    %63
    mi4 mi,
    la

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2
    s
    <6>
    s
    s
    <6>
    s
    s4 <6+>
    <6>2
    <6>
    s4 <6 5>
    <_+>2
    <6+>
    <_+>
    <5+>
    <_+>
    <7>
    s4 <6>
    <6 4> <5 3+>
    s <4 2>
    <7 5> <6 4>
    <6> s
    <6 4> <5 3+>
    s2*3
    s4 <_+>
    s2
    <6 4>4 <5 3+>
    <7>2
    s2*7
    <6 4>4 <5 3>
    <7>2
    s2*5
    <6>2
    s
    s
    <6>
    s2*3
    <6 4>4 <5 3>
    s2
    <6 4>4 <5 3>
    s <6>
    <6>2
    <6 5>
    s4 <6>
    <6 4> <5 3>
    s <6 4 2>
    <7 5> <6 4>
    <6> s
    <6 4> <5 3>

}

forma = {

    \time 2/4
    \key la\major
    \tempo 2 = 60
    \partial 4 s4
    s2*23
    s4
    \bar":..:"\break
    s
    s2*39
    s4
    \bar":|."

}



VIvlI = {
    \global
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}


VIvla = {
    \global
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>

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
        title = \markup\smaller{Sinfonia I in Fa maggiore}
        composer = \markup \center-column{"D. Dall'Oglio (1700ca -1764)"}

    }

    \markup\huge {[I.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
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

    \pageBreak

    \markup\huge {[I.2] Andante}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
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

    \pageBreak

    \markup\huge {[I.3] Presto}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
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

    \header {
        title = \markup\smaller{Sinfonia II in La maggiore}
        composer = \markup \center-column{"D. Dall'Oglio (1700ca -1764)"}

    }

    \markup\huge {[II.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
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

    \pageBreak

    \markup\huge {[II.2] Andante}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
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

    \pageBreak

    \markup\huge {[II.3] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
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