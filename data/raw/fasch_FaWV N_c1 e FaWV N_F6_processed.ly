\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

dolce = _\markup\italic "dol."


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
      \musicglyph "scripts.prall"}}
mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    do4\f
    mib sol do,
    re(fa) si,
    do sol r8 r16 do

    %4
    re4 sol, r8 r16 re'
    mib2.
    mi

    %7
    fa2 fad4~
    fad sol fa\mbreak
    mib(mib mib)

    %10
    mib(mib mib) \grace mib8 re2.
    re8(si) sol4 r
    sol'\p sol4. lab16(sib)

    %13
    lab8(sol) lab2
    fa4 fa4. sol16(lab)
    sol8 fa sol2

    %16
    mib4 mib4. fa16(sol)
    fa8(mib) fa2\mbreak
    re4 re4. mib16(fa)

    %19
    mib2.\f
    mib4(re do)
    re si2

    %23
    do4 sol r8 r16 lab
    lab4(sol) r
    do4\pp(sol) r8 r16 fa

    %26
    fa4(mib) r\fermata

}

IvlIIn = \relative do'' {

    r4
    sol2.
    lab2 sol4
    sol2.

    %4
    sol
    sol
    sol

    %7
    fa2 la4
    re2 si4\mbreak
    sol(sol sol)

    %10
    do(do do)
    \grace do8 si2.
    si,

    %13
    do'\p~
    do
    sib!~

    %16
    sib
    lab
    lab

    %19
    sol~
    sol2  do,4
    do\f(re mib)

    %22
    lab(sol fa)
    mib mib r8 r16 fa
    fa4(mib) r

    %25
    mib\pp mib r8 r16 lab,
    lab4 sol r\fermata

}

Ivlan = \relative do' {

    r4
    do,8(do) do(do) mib(mib)
    fa(fa) fa(fa) sol(sol)
    mib(mib) mib(mib) mib(mib)

    %4
    re(re) re(re) re(re)
    do(do) do(do) do(do)
    do(do) do(do) do(do)

    %7
    do(do) lab'(lab) la(la)
    si si si si si si\mbreak
    do do do do do do

    %10
    la la la la la la
    sol sol sol sol sol sol
    sol2 r4

    %13
    r do\p mi
    r do fa
    r sib, re

    %16
    r sib mib!
    r lab, do
    r lab re\mbreak

    %19
    r sol, si
    do8\f(do) sib!(sib) lab(lab)
    sol(sol) fa(fa) mib(mib)

    %22
    fa(fa) sol(sol) sol(sol)
    do, do do do do do
    do do do do do do

    %25
    do do do do do do
    do2 r4\fermata

}


Ibcn = \relative do {

    r4
    do8(do) do(do) mib(mib)
    fa(fa) fa(fa) sol(sol)
    mib(mib) mib(mib) mib(mib)

    %4
    si(si) si(si) si(si)
    do(do) do(do) do(do)
    sib!(sib) sib(sib) sib(sib)

    %7
    lab(lab) re(re) do(do)
    si si si si sol sol\mbreak
    do do do do do do

    %10
    fad, fad fad fad fad fad
    sol sol sol sol sol sol
    sol2 r4

    %13
    r mi'\p mi
    r fa fa
    r re re

    %16
    r mib! mib
    r do do
    r re re\mbreak

    %19
    r si si
    do8\f(do) sib!(sib) lab(lab)
    sol(sol) fa(fa) mib(mib)

    %22
    fa(fa) sol(sol) sol(sol)
    do, do do do do do
    do do do do do do

    %25
    do do do do do do
    re2 r4\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key do\minor
    \tempo 2 = 38
    \partial 4 s4
    s2.*26
    \bar"||"

}



IvlI = {
    \global
    %\notypeset
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
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    do2
    mib
    re4. fa8

    %4
    mib16 re do8 r mib
    re re4 fa8
    mib4(mi

    %7
    fa fad)
    sol16 la sib8 la re,
    sol16 la? sib8 la re,

    %10
    sol8 do, la4\mbreak
    sol8 [re sib' sol]
    re' sib sol'4~

    %13
    sol fad
    sol sol,~
    sol fad

    %16
    sol r8 sol'
    sol, [sol' sol, sol']
    sol\p fa!16 mib fa8 fa\f

    %19
    sol, [fa' sol, fa']
    fa\p mib16 re mib8 re
    re[(do) do( si)]

    %22
    si[(lab!) lab(sol)]
    sol[(fa) fa(re)]\mbreak
    \once\stemUp mib\f [do'' sol mib]

    %25
    do[sol mib do]
    fa' fa16 mib fa8 re
    sol[mib sol do]

    %28
    fa, fa16 mib fa8 re
    sol[ do,(si do)]
    lab'[do,(si? do)]

    %31
    si sol mib'4
    re8 sol, mib'4
    re2\downprall

    %34
    do4 lab~\mbreak
    lab8 sol16 fa mib8 re
    mib do lab'4~

    %37
    lab8 sol16 fa mib8 re
    mib[do' lab fa]
    sol4 sol,

    %40
    do r
    do'2\p
    mib

    %43
    re 4. fa8
    mib16 re do8 r mib
    re re4 fa8

    %46
    mib4(mi\mbreak
    fa sol)
    lab16\f sol lab8 lab do,

    %49
    fa16 mi fa8 fa fa,
    sib16 lab sib8 sib sol
    do[lab do fa]

    %52
    sib,16 lab sib8 sib sol
    do lab r fa
    fa' re16 mib! fa mib re do

    %55
    sib2\p
    re\mbreak
    do4. mib8

    %58
    re16 do sib8 r re
    do do4 mib8
    re4(re

    %61
    mib fa)
    sol16\f fa sol8 sol sib,
    mib16 re mib8 mib mib,

    %64
    lab16 sol lab8 lab fa
    sib[sol sib mib]
    lab,4. fa'8\mbreak

    %67
    sib,16(lab sol8) sol16(fa mib8)
    reb'2
    do

    %70
    mib4. mib8
    mib16 do re!4.
    sib'8 fa16 sol lab!4

    %73
    sol8 re16 mib fa4
    mib8 do16 re mib8 re
    do[sib la sol]

    %76
    fad16 la do8 do do
    do[(sib) re(do)]\mbreak  %%% fine p. 8 OOKK
    sib16 re sol8 sol sol

    %79
    sol[(fad) sib(la)]
    fad16 sol la sol fad4
    do16 re mib re do4

    %82
    la16 sib do sib la8 sol
    fad re r re'
    do[sib la sol]

    %85
    fad re r re'
    do[sib la? sol]
    fad[re sol do]

    %88
    sib4 la\downprall\mbreak
    sol8[sol'\p sol(fad)]
    sol[(mib!) mib(re)]

    %91
    re[(do) do(sib)]
    sib[(la) la(do)]
    sib2\f

    %94
    re4 sol~
    sol fad
    sol sol,~

    %97
    sol fad
    sol r8 fa'!
    mib16 re mib8 mib sol,

    %100
    do16 si do8 do do,\mbreak
    fa16 mib fa8 fa re
    mib[(sol) fa(lab)]

    %103
    sol sol' fa16(mib re do)
    si la sol8 r4
    do2

    %106
    mib
    re4. fa8
    mib16 re do8 r mib

    %109
    re re4 fa8
    mib4(mi
    fa fad)

    %112
    sol4. sol,8
    fa'!4. sol,8
    mib'2~

    %115
    mib8 re16 do re8 mib16 fa
    sol2~
    sol8 fa16 mib fa4~

    %118
    fa8 mib16 re mib4~
    mib8 re16 do re8 do
    si2

    %121
    re
    sol,4. sol'8\mbreak
    fa[re mib do]

    %124
    re4 si
    do lab!~
    lab8 sol16 fa mib8 re

    %127
    mib do lab'4~
    lab8 sol16 fa mib8 re
    mib[do' lab fa]

    %130
    sol4 sol,
    do r

}

IIvlIIn = \relative do'' {

    R2*10\mbreak
    sol2
    sib

    %13
    la4. do8
    sib16 la? sol8 r sib
    la?8 la4 do8

    %16
    sib4(si
    do re)
    mib8\p[do si sol\f ]

    %19
    sol,4 r8 sol'\p
    re'[si do sol]
    sol,4 sol'

    %22
    fa si,
    si? si\mbreak
    do8[sol mib' do]

    %25
    sol' mib do'4~
    do si
    do do,~

    %28
    do si
    do sol'
    lab! la

    %31
    si16 do re8 sol, do
    si?16 do re8 sol, do
    si2\downprall

    %34
    do8 mib, mib4\mbreak
    re16 fa mib re sol8 fa
    r mib mib4

    %37
    re16 fa mib re sol8 fa
    mib[do' lab fa]
    sol4 sol,

    %40
    do r
    r8 do''\p[sol mib]
    do[sol mib do]

    %43
    sol[sol' si sol]
    do[sol mib do]
    sol[sol si sol]

    %46
    do do'4 sib!8\mbreak
    lab[fa mi do]
    fa\f[fa' do lab]

    %49
    fa[do lab \once\stemDown fa'']
    fa4 mi
    fa fa,~

    %52
    fa mi
    fa8[do' mib,! do']
    re,[sib' do, la']

    %55
    \once\stemUp sib,\p[sib'' fa re]
    sib[fa re sib]\mbreak
    fa'[fa la fa]

    %58
    sib[fa re sib]
    fa'[fa la fa]
    sib, sib'4 lab!8

    %61
    sol[mib re sib]
    mib\f[mib' sib sol]
    mib[sib sol \once\stemDown mib'']

    %64
    mib4 re
    mib mib,
    mib re\mbreak

    %67
    mib r8 sol
    sol[sol sol sol]
    lab[mib do lab]

    %70
    la'[la la la]
    sib[fa re sib]
    R2

    %73
    sib'8 fa16 sol lab!4
    lab sol
    fad8 re4 do8

    %76
    re16 do re mib] re8 re
    re2\mbreak
    re16 sol sib8 sib re

    %79
    do[(la) sol(fad)]
    la16 sib do sib la4
    la,16 sib  do sib la4

    %82
    fad'16 sol la sol fad8 mib
    re fad r fad
    la[sol do, sib]

    %85
    la fad' r fad
    la?[sol do, sib]
    la[fad' re mib]

    %88
    sol4 fad\downprall\mbreak
    sol, mib'\p
    re do

    %91
    fad sol
    re re
    \once\stemUp sol,8\f[sol'' re sib]

    %94
    sol[re sib sol]
    r do' [mib re]
    re16(do sib8) sib16(la sol8)

    %97
    r do,[mib re]
    re[sib sol] r
    do2
    mib\mbreak

    %101
    re4. fa8
    mib16 re do8 r fa
    mib do4 lab'8

    %104
    re,16 do si8 r4
    r8 do''[sol mib]
    do[sol mib do]

    %107
    fa[la fa re]
    sol16 fa mib8 r sol
    fa fa4 re8

    %110
    sol16 fa mib re do4
    do' la
    re8 si sol4\mbreak

    %113
    r8 sol re'4~
    re8 do16 si do8 re16 mib
    fa2~

    %116
    fa8 mib16 re mib8 fa16 sol
    lab4. sib16 lab
    sol4. lab16 sol

    %119
    fa4. mib8
    re[si sol re]
    si sol r fa''

    %122
    fa[re si sol]\mbreak
    re sol4 sol8
    lab?4 re,

    %125
    mib8 mib mib4
    re16 fa mib re sol8 fa
    r mib mib4

    %128
    re16 fa mib re sol8 fa
    mib[do' lab fa]
    sol4 sol,

    %131
    do r

}

IIvlan = \relative do' {

    r8 do' [sol mib]
    do[sol mib do]
    sol'[sol' si sol]

    %4
    do[sol mib do]
    sol[sol si sol]
    do do4 sib!8

    %7
    lab re4 do8
    sib[sol re' do]
    sib[sol re' do]

    %10
    sib[mib do re]\mbreak
    \once\stemUp sol, [sol' re sib]
    sol[re' sib sol]

    %13
    re' re4 re8
    sol[re sib sol]
    re re4 re8
    %16
    sol sol'4 fa!8
    mib[do si sol]
    R2*6\mbreak

    %24
    do,2
    mib
    re4. fa8

    %27
    mib16 re do8 r mib
    re re4 fa8
    mib4(mi

    %30
    fa fad)
    sol'16 la si8 do fad,
    sol16 la si8 do fad,

    %33
    sol[fad sol sol,]
    \parenthesize do4 r8  do
    si4 r8 sol

    %36
    do4 r8 sol
    si4 r8 sol
    do[do' lab fa]

    %39
    do[do'  sol sol,]
    do4 r
    R2*7

    %48
    fa,2
    lab!
    sol4. sib8

    %51
    lab16 sol fa8 r lab
    sol sol4 sib8
    lab4 la

    %54
    sib fa'8 fa,
    sib4 r
    R2*6

    %62
    mib,2
    sol
    fa4. lab8

    %65
    sol16 fa mib8 r sol
    fa fa4 lab8\mbreak
    sol16 fa mib8 r sib'

    %68
    sib[sib sib sib]
    do mib mib4
    la,8[do do do]

    %71
    re fa fa4
    sib,4  sib
    sib si

    %74
    do4 do8 sib!
    la[ sol fad mib]
    re2

    %77
    fad\mbreak %%% fine p. 8
    sol4 r8 sib
    re16 do re8 r re,

    %80
    re[re re re]
    re[re re re]
    re[re re re]

    %83
    re4 re
    re re
    re re

    %86
    re re
    re sib'8 do
    re[do re re,]\mbreak

    %89
    sol4 r
    R2*3
    sol2

    %94
    sib
    la4. do8
    sib16 la? sol8 r sib

    %97
    la? la4 do8
    sib4 si
    do8[sol sol' mib]

    %100
    do[sol mib do]
    r8 sol'[sol sol]
    do4 r8 re

    %103
    mib[do la? fa]
    sol sol sol16 fa sol fa
    mib8[sol mib do]

    %106
    sol' mib do'4~
    do si
    do4 do,

    %109
    do' si
    do do8 sib!
    lab! [fa re' do]

    %112
    si[sol re' si]\mbreak
    sol2~
    sol~

    %115
    sol~
    sol~
    sol~

    %118
    sol~
    sol
    sol4 sol

    %121
    sol sol
    si si\mbreak
    r8 si [do mib]

    %124
    fa[re sol sol,]
    do4 r8 do
    si4 r8 sol

    %127
    do4 r8 do
    si4 r8 sol
    do[do lab fa]

    %130
    sol4 sol
    do, r

}


IIbcn = \relative do {

    r8 do' [sol mib]
    do[sol mib do]
    sol'[sol' si sol]

    %4
    do[sol mib do]
    sol[sol si sol]
    do do'4 sib!8

    %7
    lab[fa re' do]
    sib[sol re' do]
    sib[sol re do]

    %10
    sib[mib do re]\mbreak
    \once\stemUp sol, [sol'' re sib]
    sol[re sib sol]

    %13
    re'[re re' re,]
    sol[re sib sol]
    re[re re' re,]

    %16
    sol sol'4 fa!8
    mib[do si sol]
    R2*6\mbreak

    %24
    do2
    mib
    re4. fa8

    %27
    mib16 re do8 r mib
    re re4 fa8
    mib4(mi

    %30
    fa fad)
    sol16 la si8 do fad,
    sol16 la si8 do fad,

    %33
    sol[fad sol sol,]
    \parenthesize do4 r8  do
    si4 r8 sol

    %36
    do4 r8 sol
    si4 r8 sol
    do[do' lab fa]

    %39
    do[do' \parenthesize sol sol,]
    do4 r
    R2*7

    %48
    fa2
    lab
    sol4. sib8

    %51
    lab16 sol fa8 r lab
    sol sol4 sib8
    lab4 la

    %54
    sib fa8 fa,
    sib4 r
    R2*6

    %62
    mib2
    sol
    fa4. lab8

    %65
    sol16 fa mib8 r sol
    fa fa4 lab8\mbreak
    sol16 fa mib8 r mib

    %68
    mib[mib mib mib]
    lab[lab lab lab]
    fa[fa fa fa]

    %71
    sib[sib sib sib]
    sib sib, r sib'
    sib sib, r si'

    %74
    do4 do8 sib!
    la[ sol fad mib]
    re2

    %77
    fad\mbreak %%% fine p. 8
    sol4 r8 sib
    re16 do re8 r re,

    %80
    re[re re re]
    re[re re re]
    re[re re re]

    %83
    re4 re
    re re
    re re

    %86
    re re
    re sib8 do
    re[do re re,]\mbreak

    %89
    sol4 r
    R2*3
    sol'2

    %94
    sib
    la4. do8
    sib16 la? sol8 r sib

    %97
    la? la4 do8
    sib4 si
    do8[do sol mib]

    %100
    do[sol mib do]
    r8 sol'[sol' sol,]
    do4 r8 re

    %103
    mib[mib la? fa]
    sol sol, sol'16 fa mib re
    do8[sol mib' do]

    %106
    sol' mib do'4~
    do si
    do4 do,~

    %109
    do si
    do do'8 sib!
    lab! [fa re' do]

    %112
    si[sol re si]\mbreak
    sol2~
    sol~

    %115
    sol~
    sol~
    sol~

    %118
    sol~
    sol
    sol'4 sol

    %121
    sol sol
    si, si\mbreak
    r8 si [do mib]

    %124
    fa[re sol sol,]
    do4 r8 do
    si4 r8 sol

    %127
    do4 r8 do
    si4 r8 sol
    do[do' lab fa]

    %130
    sol4 sol,
    do r

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/4
    \key do\minor
    \tempo 2 = 60
    s2*131
    \bar"|."

}



IIvlI = {
    \global
    %\notypeset
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
    \senza
}

IobIn = \relative do'' {

    fa4. fa8 mi re do sib
    la sol16. la32 sib8 la la (sol) r4
    fa'4.\p fa8 mi re do sib

    %4
    la sol16. la32 sib8 la la (sol) r4
    do8 re16. mi32 fa8 mib mib (re) r4\mbreak
    re8 mi!16. fa32 sol8 fa fa (mi) r4

    %7
    mi8 fa16. sol32 la8 sol  sol(fa) r fa
    mi re dod re la sol' sol4~
    sol8 mi16. fa32 sol4~ sol8 mi16. fa32 sol4~

    %10
    sol8 mi la sol fa sol mi8. [re16]
    re8~\tuplet 3/2 { re16. mi16 fa32 } re8 \tuplet 3/2 { sib16.(do16 re32) } sib8 sib sib sib
    sib(la) r4 r2

    %13
    r8 do re mi la,2~
    la8 la sol fa mi4 sol'~
    sol8. la16 fa8.[mi16]re4 r8 fa

    %16
    mi4. la8 sol4. fa8
    mi4. la8 sol4. fa8
    mi8.[fa16] re8. do16 do2~

    %19
    do r4\mbreak do8 re16. mib32
    re8 do sib8. do16 la8 fa la[sib16. do32]
    sib8 la sol fa mi do' fa4~

    %22
    fa8 mi fa4~fa8 mi fa4~
    fa8 mi fa4~fa8 mi fa[sib]
    la8.[sol16] sol8. fa16 fa4 r8 fa,16. la32\mbreak

    %25
    do4 r8 sol16. si32 do4 r8 si16. fa'32
    mi8.[re16] re8. do16 do4\fermata r

}

IobIIn = \relative do'' {

    la8 sib do sib16. la32 sol8 fa mi sol
    fa mi16. fa32 sol8 fa fa [(mi)] r4
    la8\p sib do sib16. la32 sol8 fa mi sol

    %4
    fa mi16. fa32 sol8 fa fa [\parentSlur (mi)] r4
    fa2 \parentSlur (fa8) sol16. la32 sib8 la\mbreak
    sol2~sol8 la16. sib32 do8 sib

    %7
    la2~la8 sib16. do32 re8 do
    sib la sol fa mi4 r8 re'
    dod4 r8 re mi4 r8 re

    %10
    dod4 r8 mi re8. mi16 dod8. [re16]\mbreak
    re4 r r2
    r8 \tuplet 3/2 { la16. (sib16 do32) } la8 [\tuplet 3/2 { fa16.(sol16 la32) }] fa8 fa fa fa

    %13
    fa(mi) r4 r8 re'[mi fa]
    si,4 re~re8 re do sib
    la8. fa'16 re8.[do16] si8 sol do4~

    %16
    do8 si do4~\mbreak do8 si do4~
    do8 si do4~do8 si do[re]
    do8. re16 si8.[do16] do4 sol8. la32 sib?

    %19
    la8 sol fa8. sol16 mi8 do fa'4~
    fa2 r4 do8 re16. mib32\mbreak
    re8 do sib la sol4 r8 sib

    %22
    la4. re8 do4. sib8
    la4. re8 do4. sol'8
    fa8. fa16 mi8.[fa16] fa8 fa,16. la32 do4

    %25
    r8 sol16. si32 do4 r8  fa,16. si32 fa'8 si,
    do8. re16 si8.[do16] do4\fermopz r

}


Ifgn = \relative do {

    fa,8 sol la sib do2~
    do4 sib do r
    fa,8\p sol la sib do2~

    %4
    do4 sib do do'8 sib
    la\f sol la fa sib4 re8 do
    si la si sol do4 mi8 re

    %7
    dod si dod[la] re4 sib8 la\mbreak
    sol fa mi re dod4 r8 si'
    la4 r8 si dod4 r8 si

    %10
    la4 r8 dod, re sol la la,
    re4 r re mi8 do
    fa4 r la, si8 sol

    %13
    do4 r8 do fa4 r8 fa\mbreak
    sol4 si, do mi
    fa8 fa, r fa' sol4 r8 la

    %16
    sol4. fa8 mi4. la8
    sol4. fa8 mi4. si8
    do fa sol[sol,] do re mi do

    %19
    fa sol la sib do sib la fa\mbreak
    sib, do re mi fa4 r8 la,
    sib4. sib8 do4. re8

    %22
    do4. sib8 la4. re8
    do4. sib8 la4. mi8
    fa sib do[do,] fa4 r8 fa'

    %25
    mi4 r8 mi re4 r8 sol,
    do8 fa sol[sol,] do4\fermata r

}

forma = {

    \time 2/2
    \key fa\major
    \tempo 4 = 50
    s1*26
    \bar"||"

}


IobI = {
    \global
    <<\IobIn \forma>>

}

IobII = {
    \global
    <<\IobIIn \forma>>

}

Ifg = {
    \global
    \clef bass
    <<\Ifgn \forma \Ibfn>>

}


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IIobIn = \relative do'' {
   
   fa8 fa  fa
   fa(mi) r
   R4.*2
   
   %5
   fa8 fa fa
   fa(mi) sol
   fa sol la
   
   %8
   sol fa mi
   fa4 sol8
   mi re16 do fa8~
   
   %11
   fa16 sol mi4-+
   fa4 r8
   R4.*4
   
   %17
   re16 sol re sol re sol\mbreak
   mi sol re sol do, sol'
   si, sol' re sol re sol
   
   %20
   mi sol re sol do, sol'
   si,8 sol'4~
   sol8 fa4~
   
   %23
   fa8 mi16 fa sol mi
   la sol fa8.[mi16]
   re8 sol4~
   
   %26
   sol4.~
   sol~
   sol~
   
   %29
   sol~
   sol8 fa4~\mbreak
   fa8 mi16 fa sol la
   
   %32
   fa mi re8.[do16]
   do8 do si
   la sol fa
   
   %35
   mi do' si 
   la sol fa
   mi mi' mi
   
   %38
   fa sol la
   sol16 mi fa re mi8~
   mi16 fa re4-+
   
   %41
   do4. do
   mi8 mi mi
   mi(re) r
   
   %44
   R4.*2
   mi8 mi mi
   mi(re) sol
   
   %48
   sol4.~
   sol4 sol8
   sol fa4~
   
   %51
   fa8. sol16 mi8~
   mi16 fa re4-+
   do8 mi16 do mi do
   
   %54
   fa do sol' do, la' do,
   sol'8 fa4
   mi16 fad fad4-+
   
   %57
   sol8 r r\mbreak
   R4.*4
   sol8 fa16 mi fa re
   
   %63
   mi sol  la do fa, mi
   re fa sol si mi, re
   do mi fa la re, do
   
   %66
   si re mi sol do, si
   la do re fa si, la
   sol8 la16 si do re
   
   %69
   mi8 fa mi
   mi(re) r
   fa mi re\mbreak
   
   %72
   do re16 mi fa sol
   la8 sol fa
   mi re do~
   
   %75
   do4 si8
   sol16 fa mi re do8~
   do16 fa re4
   
   %78
   do r8
   fa' fa fa
   fa(mi) r
   
   %81
   R4.*2  
   fa8 fa fa
   fa(mi) sol
   
   %85
   fa sol la
   sol fa mi
   fa4.~
   
   %88
   fa~\mbreak
   fa8 mi16 re do sib
   la8 sib16 la sol8
   
   %91
   R4.*4
   mi'16 do mi do mi do
   fa do sol' do, la'8
   
   %97
   sol sib4
   la16 sib sib8.[la16]
   sol8 sol,16 do sol do
   
   %100
   la do sol do fa, do'
   mi, do' sol do sol do\mbreak
   la do sol do fa, do'
   
   %103
   mi,8 mi'4
   fa8 fa4
   sol8 do,4
   
   %106
   la'16 sol fa mi fa8~
   fa16 mi mi4-+
   fa8 fa mi 
   
   %109
   re do sib
   la fa' mi
   re do sib
   
   %112
   la fa'4~
   fa4.~
   fa8 mi fa~
   
   %115
   fa16 sol mi4-+
   fa4.\fermopz
   
}

IIobIIn = \relative do'' {
   
   la8 la la
   la \parentSlur (sol) r
   R4.*2
   
   %5
   la8 la la 
   la \parentSlur (sol) mi'
   do4.~
   
   %8
   do~
   do8 sib4~
   sib8. do16 la8~
   
   %11
   la16 sib sol4-+
   la16 fa la fa la fa
   sib fa do' fa, re'8\mbreak
   
   %14
   do fa4
   mi8 fa-+ sol
   la re,4
   
   %17
   si si8
   do si la
   sol si si
   
   %20
   do si la
   sol sol16 la si sol
   do si la si do re
   
   %23
   sol,8 do4~
   do8 la4\mbreak
   si16 la si do la si
   
   %26
   do8 re mi
   re do si
   do re mi
   
   %29
   re do si
   do4 re8~
   re do16 re mi fa
   
   %32
   re do  si8. do16
   do do la do sol do
   fa, do' mi, do' re, do'\mbreak
   
   %35
   do, do' la do sol do
   fa, do' mi, do' re, do'
   do,8 do' do
   
   %38
   do do do
   do si do~
   do16 re si4-+
   
   %41
   do4. do
   do8 do do
   do(si) r
   
   %44
   R4.*2\mbreak
   do8 do do
   do \parentSlur (si) si
   
   %48
   do re mi
   re do si
   do4 re8
   
   %51
   si16 la si sol do8~
   do16 re si?4-+
   do8 r r
   
   %54
   R4.*3
   r8 si16 sol si sol\mbreak
   do sol re' sol, mi' sol,
   
   %59
   re'8 do4
   si?16 dod dod4-+
   re8 do!16 si? do la
   
   %62
   si8 r r 
   r mi do~
   do re si~
   
   %65
   si do la~
   la si sol~
   sol la fa~\mbreak
   
   %68
   fa mi16  sol la si
   do8 re do
   do(si) r
   
   %71
   do4.~
   do~
   do4 si8
   
   %74
   do re16 mi fa sol
   la8 sol fa
   mi16 re do si do8~
   
   %77
   do16 re si4-+
   do4 r8
   la8 la la
   
   %80
   la (sol) r
   R4.*2
   la8 la la 
   
   %84
   la (sol) mi'
   do4.~
   do4 do8
   
   %87
   sib do re
   do sib la
   sol4 sol8
   
   %90
   fa sol16 fa mi8
   la16 fa la fa la fa\mbreak
   sib fa do' fa, re'8
   
   %93
   do fa4 
   mi16 fa fa4-+
   sol8 do, r
   
   %96
   R4.*3
   r8 mi, mi
   fa mi re
   
   %101
   do mi mi
   fa mi re
   do do'4~
   
   %104
   do8 sib4~
   sib8 sib4\mbreak
   la8 sib do
   
   %107
   re sol,4-+
   fa16 fa' re fa do fa
   sib, fa' la, fa' sol, fa'
   
   %110
   fa, fa' re fa do fa
   sib, fa' la, fa' sol, fa'
   fa,8 la la
   
   %113
   sib do re
   do16 la sib sol la8~\mbreak
   la16 sib sol4-+
   
   %116
   fa4.\fermopz
   
}


IIfgn = \relative do {
   
   fa8 la fa
   do' do, do'
   la16 do sol do fa, do'
   
   %4
   mi, do' re, do' do,8
   fa la fa
   do' do, do'
   
   %7
   la16 do sol do fa, do'
   mi, do' re, do' do,8
   re4 sib8 
   
   %10
   do la re\mbreak
   sib do do,
   fa fa' mib
   
   %13
   re do sib
   la4 fa8
   do' re mi
   
   %16
   fa fad4
   sol8 sol, r
   R4.
   
   %19
   sol'8 sol, r
   R4.
   r8 mi'16 fa sol mi
   
   %22
   la sol fa sol la si\mbreak
   do8 do,16 re mi do
   fa mi re mi fa re
   
   %25
   sol8 sol,16 sol' fa sol
   mi sol re sol do, sol'
   si, sol' la, sol' sol, sol'
   
   %28
   mi sol re sol do, sol'
   si, sol' la, sol' sol, sol'
   la,4 si8\mbreak
   
   %31
   do do' mi,
   fa sol sol,
   do r r
   
   %34
   R4.*3
   r16 do' do, do' sib do
   la do sol do fa, do'
   
   %39
   mi, do' re, do' do,8
   fa sol sol,
   do do'16 sib la sol do,4.
   
   %42
   do8 mi do
   sol' sol, sol'
   mi16 sol re sol do, sol'
   
   %45
   si, sol' la, sol' sol,8
   do8 mi do
   sol' sol, sol'
   
   %48
   mi16 sol re sol do, sol'
   si, sol' la, sol' sol,8
   la4 fa8
   
   %51
   sol do, la'\mbreak
   fa sol4
   do8 do' sib
   
   %54
   sib sol fa
   mi re sol
   do la re
   
   %57
   sol, sol, fa'
   mi re do
   si la re
   
   %60
   sol mi la
   re, mi fad
   sol, la si\mbreak
   
   %63
   do4 la8
   si4 sol8
   la4 fa?8
   
   %66
   sol4 mi8
   fa4 re8
   mi mi' re
   
   %69
   do si do
   sol sol'16 la si sol
   la8 sol fa
   
   %72
   mi4 mi8
   fa mi re
   do4 mi,8\mbreak
   
   %75
   fa mi re
   do' sol la
   fa sol4
   
   %78
   \once\stemUp do,8 do''16 sib la sol
   fa8 la fa
   do' do, do'
   
   %81
   la16 do sol do fa, do'
   mi, do' re, do' do,8
   fa la fa
   
   %84
   do' do, do'
   la16 do sol do fa, do'
   mi, do' re, do' do, do' 
   
   %87
   re, fa do fa sib, fa'
   la, fa' sol, fa' sol,8
   do do' mi,
   
   %90
   fa sib, do
   fa, fa' mib
   re do sib
   
   %93
   la4 si8\mbreak
   do la fa
   do' do' sib?
   
   %96
   la sol fa
   mi4 do8
   fa re sib
   
   %99
   do r r
   R4.*3
   r8 do16 re mi do
   
   %104
   re do re mi fa re
   mi re mi fa sol mi\mbreak
   fa8 sol la
   
   %107
   sib do do,
   fa r r
   R4.*3
   
   %112
   r16 fa fa, fa' mib fa
   re fa do fa sib, fa'
   la, fa' sol, fa' fa,8
   
   %115
   sib do do,
   fa4.\fermata
  
}

forma = {

   \time 3/8
   \key fa\major
   \tempo 4. = 60
   \repeat volta 2 {s4.*40}
   \alternative {{s4.}{s4.}}\break
   \set Score.currentBarNumber = #42
   \bar".|:"
   s4.*75
   \bar ":|."

}


IIobI = {
   \global
   <<\IIobIn \forma>>

}

IIobII = {
   \global
   <<\IIobIIn \forma>>

}

IIfg = {
   \global
   \clef bass
   <<\IIfgn \forma \IIbfn>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIobIn = \relative do'' {
   
   R2.*8
   r4 la4. sol16 fa
   mi4 re2
   
   %11
   sib'4 la2
   re4 dod2
   fa4 mi re
   
   %14
   dod re2
   sib4 sol la8. sib16
   la4 la'4. sol16 fa
   
   %17
   sol4 sol4. la8\mbreak
   fa4 sib2~
   sib4 la2~
   
   %20
   la4 sol2~
   sol4 la sib
   la8. sol16 sol4. fa8
   
   %23
   fa4 r r
   R2.*4
   r4 sol4. fa16 mi
   
   %29
   re4 do2
   fa4 mi2
   la4 sol2
   
   %32
   fa4 mi4. re8\mbreak
   do4 sib'2
   la4 sol fa
   
   %35
   mi r r
   r la, fa'~
   fa mi re
   
   %38
   do la la'~
   la sol fa
   mi2.~
   
   %41
   mi4 re do
   sib sol'2~
   sol4. la8 fa4~
   
   %44
   fa8 sol mi4. re8\mbreak
   re4 r r
   r re, do'~
   
   %47
   do sib la
   sib2 la4
   la'8 fa sol4. la8
   
   %50
   la2.\fermata

}

IIIobIIn = \relative do'' {
   
   r4 la4. sol16 fa
   mi4 re2
   sib'4 la2
   
   %4
   re4 dod2
   fa4 mi re
   dod re2
   
   %7
   sib4 la4. sol8 
   fa8. sol16 sol4.-+ fa16 sol\mbreak
   la4 fa'4. mi16 re
   
   %10
   dod4 re2~
   re2.
   sol,4 la2~
   
   %13
   la~la8 sol
   sol4 fa2~
   fa4 fa mi
   
   %16
   fa r re'
   si dod2\mbreak
   re4 r sol8(mi)
   
   %19
   do2 fa8(do)
   re4. fa8 mi sol
   fa2.~
   
   %22
   fa4 mi4. fa8
   fa4 do4. sib16 la
   sol4 fa2
   
   %25
   sib4 la2
   re4 do2\mbreak
   fa4 mi4. fa8
   
   %28
   re4 do2(
   si4) do2
   do2.~
   
   %31
   do~
   do4 do si
   do2 mi4
   
   %34
   fa mi re
   dod la mi'~
   mi re do?\mbreak
   
   %37
   sib sol sol'~
   sol fa mi
   re sib sib'~
   
   %40
   sib la sol
   fa2.~
   fa4 mi re
   
   %43
   dod4. la8 re4~
   re8 mi dod4. re8
   re4 re, fad\mbreak
   
   %46
   sol fa! mi
   re2.~
   re4 re' dod
   
   %49
   re re2-+ 
   dod2.\fermata

}


IIIfgn = \relative do {
   
   re4 fa, sol 
   la sib2
   sol'4 fa2
   
   %4
   sib4 la2
   re4 do sib
   la fa2
   
   %7
   sol4 dod, la
   re sib2
   la4 fa sol\mbreak
   
   %10
   la sib2
   sol'4 fa2
   sib4 la2
   
   %13
   re4 do sib
   la sib2
   sol4 do do,
   
   %16
   fa2 fa4~
   fa mi la,
   re2 mi4
   
   %19
   fa2 la4\mbreak
   sib2 do4
   re do re
   
   %22
   sib do do,
   fa la, sib
   do re2
   
   %25
   re'4 do2
   sib4 la2
   si4 do fa,
   
   %28
   sol mi fa 
   sol la2\mbreak
   la,4 sol2
   
   %31
   fa'4 mi2
   la4 sol fa
   mi2 do4
   
   %34
   fa2 sol4
   la2 sol4
   fa2 fa4
   
   %37
   sol2 sol4
   la2 la4
   sib2 sib4\mbreak
   
   %40
   do2 dod,4
   re2 re'4
   sol,2 mi4
   
   %43
   la fa sib
   sol la la,
   re2 do4
   
   %46
   sib la sol
   fad2.
   sol2 la4
   
   %49
   sib2 sib4 
   la2.\fermopz

}

forma = {

    \time 3/4
    \key fa\major
    \tempo 4 = 60
    s2.*50
    \bar"||"

}


IIIobI = {
    \global
    <<\IIIobIn \forma>>

}

IIIobII = {
    \global
    <<\IIIobIIn \forma>>

}

IIIfg = {
    \global
    \clef bass
    <<\IIIfgn \forma>>

}


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IVobIn = \relative do'' {
   
   fa2 mi4 mib
   re4. do16 sib do8 re16 mi fa8 [fa,]
   sib re do sib la la' sol fa
   
   %4
   sol la, do [re16 mi] fa8 mi fa [mi16 re]
   mi8 re mi [re16 do] re8 sol, sol'[mi]
   do re16 mi fa2 mi4~\mbreak
   
   %7
   mi8 la, re4~re8 do16 si do4~
   do8 fa sib,? sol' la, fa' re [do16 sib]
   la8 sib do re mi fa sol4
   
   %10
   fa4. mi16 re mi8 fa16 sol la8 [fa]
   re sib la8 [la16 sib] do8 do sib la
   sib4. la16 sol\mbreak la4 fa'~
   
   %13
   fa mi re2
   do8 sol' do, r r sol' si, r
   r sol' do, r r sol' si, r
   
   %16
   r do fa, r r do' mi, r
   r do' fa, r r do' mi, r\mbreak
   r4 mib'2 re8 mi
   
   %19
   dod4 re2 dod4
   fa4. la8 sol fa mi re
   dod re mi4~mi8 la, re4~
   
   %22
   re2~re8 dod16 si dod8[si]
   la fa16 sol la8[sib!] mi,4 sol8la
   re,4 mi' dod8 la la'[sol16 fa]\mbreak
   
   %25
   sol8 sib la sol \once\stemDown fa re, r4
   R1*2
   fa'2 mi4 mib
   
   %29
   re4. do16 sib do8 re16 mi fa8 [fa,]
   sib re do sib la sib do re
   sol,4. do8 la[fa] sib4~
   
   %32
   sib8 sib la[sib16 la] sib8 do16 re mib8[re16 do]\mbreak
   re8 re16 mib! fa8[sol] la sib do4
   sib4. la16 sol la8 fa fa[mib16 re]
   
   %35
   mib4. mib8 fa fa mib re
   mib4. re16 do re2
   do4. sib16 la sib8 re do sib
   
   %38
   la4 r r2
   R1*2
   r2 sib'\mbreak
   
   %42
   la4 lab sol4. fa16 mi
   fa8 sol16 la sib8 [sib,] mib sol fa mib
   re4 sol~sol8 fa16 mi! fa8[fa,]
   
   %45
   sib re do sib la sol la[sol16 fa]
   sol8 do, do'[la] sib fa sib4~
   sib la8 sib16 do\mbreak re8[re] mi re
   
   %48
   do do sib[la] sib4. la16 sol
   la4 fa'2 mi4
   re2 do8 sol' do, r
   
   %51
   r sol' si, r r sol' do, r
   r sol' si, r r do fa, r\mbreak
   r do' mi, r r do' fa, r
   
   %54
   r do' mi, r r2
   r4 sib''2 la4
   sol2 fa4. sol8
   
   %57
   mi4 fa2 mi4
   fa r r do
   do si do2\fermata
   
}

IVobIIn = \relative do'' {
   
   R1*4
   do2 si4 sib
   la4. sol16 fa sol8[la16 si] do8 do,
   
   %7
   fa la sol fa mi4. re16 do
   re4. mi8 fa[la] sib la16 sol
   fa8 sol la sib do[sib16 la] sol8 la\mbreak
   
   %10
   sib fa sib4~sib la
   sol mi fa2~
   fa4 mi2 re8 re'
   
   %13
   si sol do2 si4
   do r8 sol' re r r fa
   mi r r sol re  r r fa
   
   %16
   mi r r do sol r r sib?\mbreak
   la r r do sol r r sib
   la4 r fa sol~
   
   %19
   sol fa mi'2~
   mi4 re2 sib'4~
   sib la8 sol fa4. fa8
   
   %22
   mi fa sol fa fa mi r4
   re2 dod4 do\mbreak
   sib4. la16 sol la8[si16 dod] re4~
   
   %25
   re dod re8 fa mi re
   mi la la, mi' re sol sol, re'
   do fa fa, do' sib la sib[la16 sol]
   
   %28
   la8 sib do re sol, la sib do\mbreak
   fa,4 sol mi8 fa16 sol la4~
   la sol2 fa4~
   
   %31
   fa8 mib16 re mib4~mib8 mib re \once\stemDown sol'
   do, do do [re16 mib] re8[mib16 fa] sol8 fa16 mib
   fa8 sib,16 do re8[mib] fa[mib16 re] do8 re\mbreak
   
   %34
   mib sib mib2 re4
   sol,8 sib la sol fa4 sib~
   sib8 la16 sol la4~la8 sib16 la sol8[fa]
   
   %37
   mi! do fa2 mi4
   fa'2 mi!4 mib
   re4. do16 sib do8[re16 mi] fa8 fa,\mbreak
   
   %40
   sib re do sib la fa' mib re
   mib sol fa mib re mib fa[mib16 re]
   do8 re mib fa sib,4 do
   
   %43
   la8 sib16 do re8[sib] sib4 la
   sib4. la16 sol la4. sol16 fa\mbreak
   sol8 fa mi! do fa4 r
   
   %46
   r2 fa'4. mi16 re
   mi8 fa16 sol la4~la8 re, sol4~
   sol8 do, fa4~fa8 mi16 re mi4~
   
   %49
   mi8 mi re do si4 do\mbreak
   do si do r8 sol'
   re r r fa mi r r sol
   
   %52
   re r r fa mi r r do
   sol r r sib la r r do
   sol r r sib la4 mib'~
   
   %55
   mib re mi fa~
   fa mi fa, sib
   sib la sol2
   
   %58
   fa4 r r sol
   fa2 mi\fermata
 
}


IVfgn = \relative do {
   
   fa8 sol la sib do sib16 la sol8[la]
   sib fa sib4~sib la
   sol mi fa2~
   
   %4
   fa4 mi re sol,
   do r r2
   R1*3
   
   %9
   fa2 mi4 mib
   re4. do16 sib\mbreak do8[re16 mi] fa8 fa,
   sib re do sib la la' sol fa
   
   %12
   sol sol, do[re16 mi] fa8 mi fa[mi16 re]
   sol8 sol, la[la'] fa re sol[sol,]
   do re mi do fa re sol sol,\mbreak
   
   %15
   do re mi do fa re sol sol,
   do sib la fa sib sol do[do,]
   fa sol la fa sib sol do do,
   
   %18
   fa sol la fa sib la sib sol
   la la' sib fa\mbreak sol mi la la,
   re re, re'[do] sib la sol mi
   
   %21
   la si dod la re mi fa re
   sol la sib sol la la, la'[sol]
   fa re16 mi fa8[sol] la sol16 fa mi8[fad]\mbreak
   
   %24
   sol re sol4~sol8 sol fa[mi16 re]
   mi4 la, re re'
   dod do si sib
   
   %27
   la la sol do,
   fa8 sol la sib do sib16 la sol8[la]
   sib fa sib2 la4\mbreak
   
   %30
   sol mi fa la,8 sib
   do4. do,8 fa fa' sol[re]
   mib do fa[fa,] sib4 r
   
   %33
   sib'2 la4 lab
   sol4. fa16 mi fa8[sol16 la] sib8 sib,
   mib sol fa mib\mbreak re re' do sib
   
   %36
   do do, fa[sol16 la] sib2~
   sib4 la8 sol16 fa sol4 do,
   fa,8 sol la sib do [sib16 la] sol8 la
   
   %39
   sib fa sib2 la4
   sol do fa4. fa8\mbreak
   sol4 la sib,8 do re mib
   
   %42
   fa mib16 re do8 [re] mib[sib] mib4~
   mib re do fa,
   sib r r2
   
   %45
   r fa'
   mi!4 mib re4. do16 sib\mbreak
   do8 re16 mi fa8[fa,] sib re do sib
   
   %48
   la la' sol fa sol sol, do[re16 mi]
   fa8 mi fa re sol sol, la mi
   fa[fa'] sol sol, do re mi do
   
   %51
   fa re sol sol,\mbreak do re mi do
   fa re sol sol, do sib la fa
   sib sol do do, fa sol la fa
   
   %54
   sib sol do do, fa sol la fa
   sib do re sib do do' re[la]\mbreak
   sib sol do do, re do re sib
   
   %57
   do do' re la sib sol do do,
   fa4 r r mi
   re2 do\fermopz
   
}

forma = {

   \time 2/2
   \key fa\major
   \tempo 2 = 60
   s1*58\once \override Score.RehearsalMark.extra-offset = #'(0 . -3.0)
   \mark\markup "Adagio"   
   \tempo 4 = 50
   s1
   \bar"||"

}


IVobI = {
   \global
   <<\IVobIn \forma>>

}

IVobII = {
   \global
   <<\IVobIIn \forma>>

}

IVfg = {
   \global
   \clef bass
   <<\IVfgn \forma>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VobIn = \relative do'' {
   
   fa8
   do fa do sib fa' sib, la4 r8 r r fa'\p 
   do fa do sib fa' sib, la4 r8 r r do\f
   la'8 fa sol la fa sol la sib sol la fa sol\mbreak
   
   %4
   la fa sol la sol fa mi fa mi re4 sol8
   sol4 sol8 sol4 sol8 sol4 sol8 sol4 sol8
   sol fa mi mi fa re do mi do re fa re
   
   %7
   mi sol mi fa la fa sol sib sol la do la\mbreak
   si sol do si sol do si sol do si sol do
   fa, la fa fa la fa fa re mi fa sol fa
   
   %10
   mi re do sol do si do4.~do4 sol'8
   sol mi sol sol mi sol sol mi sol sol mi sol\mbreak
   sol mi sol la sib la sol do sol la do la
   
   %13
   sol do sol la sib la sol4.~sol4 do8
   sol do sol fa do' fa, mi4 r8 r r do'\parenthesize \p
   sol do sol fa do' fa,\mbreak mi4 r8 r r la\parenthesize \f
   
   %16
   fa sol fa mi fa sol fa sol fa mi la, la'
   la4 la8 la4 la8 la4 la8 la4 la8
   la sol la fa sol mi re sol re re fa re\mbreak
   
   %19
   re mi re re la' re, re sib' re, re la' re,
   re sol dod, fa la sol fa mi re la re dod
   re4.~re4 re8 do4 do8 do re sib
   
   %22
   la4 sib8 do sib do\mbreak re fa mi fa la sol
   mi do' mi, fa sol la sol4.~sol4 fa8
   do fa do sib fa' sib, la4 r8 r r fa'\p 
   
   %25
   do fa do sib fa' sib, la4 r8 r r do\f \mbreak
   do la sib do la sib do re sib do la sib
   do sib la sib la sol la sib la sol4 do8
   
   %28
   do4 do8 do4 do8 do4 do8 do4 do8
   do sib la la sib sol\mbreak fa sib fa fa la fa
   fa sol fa fa do' fa, fa re' fa, fa do' fa,
   
   %31
   fa sib fa la do fa mi do fa mi do fa
   mi do fa mi do fa\mbreak sol mi fa do fa mi
   fa4 la8 la fa la la fa la la fa la
   
   %34
   la fa la la do sib la sol fa do fa mi
   fa sol mi fa do' mi, fa4.~fa4
   
}

VobIIn = \relative do'' {
   
   r8
   la4 r8 sol4 r8 fa4 r8 r4.
   la4\p r8 sol4 r8 fa4 r8 r r do'\parenthesize \f 
   do la sib do la sib do re mi fa la, sib
   
   %4
   do la sib do sib la\mbreak sol re' do si la sol
   la do la si re si do mi do re fa re
   mi re do do re si do4 do8 si re si
   
   %7
   do4 do8 do4 do8 do4 do8 do4 fa8\mbreak
   re si mi re si mi re si mi re si do
   la4 la8 re4 do8 si4 do8 re4 si8
   
   %10
   do4 mi,8 mi fa re do4.~do4 mi'8
   mi do mi mi do mi mi do mi mi do mi\mbreak
   mi do mi fa sol fa mi do mi fa sol fa
   
   %13
   mi do mi fa sol fa mi4.~mi4 r8
   mi4 r8 re4 r8 do4 r8 r4.
   mi4.\p re do r8 r mi\parenthesize \f\mbreak
   
   %16
   re mi re dod re mi re mi re dod si la
   si re si dod mi dod re fa re mi sol mi
   fa mi re re mi dod re4 r8 re4 r8
   
   %19
   re4 r8 re4 r8\mbreak re4 r8 re4 r8
   re4 dod8 re4 mi8 re4 fa,8 fa sol mi
   re4.~re4 fa8 sol4 fa8 sol4 mi8
   
   %22
   fa4 sol8 la sol la si? la sol la4 si!8\mbreak
   do4 do8 do mi fa mi4.~mi4 r8
   la,4 r8 sol4 r8 fa4 r8 r4.
   
   %25
   la4\p r8 sol4 r8 fa4 r8 r r la\f 
   la fa sol la fa sol la sib? sol la fa sol
   la sol fa sol fa mi fa sol fa mi re do
   
   %28
   re fa re mi sol mi fa la fa sol sib sol
   la sol fa fa sol mi fa4 r8 fa4 r8\mbreak
   fa4 r8 fa4 r8 fa4 r8 fa4 r8
   
   %31
   fa4 r8 fa4 la8 sol mi la sol mi la
   sol mi la sol mi la sib sol la la4 sol8
   la4 do8\mbreak do la do do la do do la do
   
   %34
   do la do do4 do8 do sib la la4 sol8
   la sib sol la[r la] la4.~la4

}


Vfgn = \relative do {
   
   r8 
   fa4 r8 fa4 r8 fa4 r8 r4.
   fa4\p r8 fa4 r8 fa4 r8 r4.
   fa4.\f r fa4 do8 fa,4 r8
   
   %4
   fa'4 r8 fa,4  la8 do4 fa8 sol4 mi8\mbreak
   fa la fa sol si sol la do la si re si
   do4 fa,8 sol4 sol,8 do4 r8 r4.
   
   %7
   do8 mi do re fa re mi sol mi fa la fa
   sol4 sol,8 sol'4 sol,8\mbreak sol'4 sol,8 sol'4 mi8
   re4 do8 si4 la8 sol4 sol8 sol'4 sol,8
   
   %10
   do4 mi8 sol4 sol,8 do' mi, sol do,4 r8
   r2. r4. r8 r do 
   do4 do8 do4 do8 do4 do8 do4 do8\mbreak
   
   %13
   do4 do8 fa4 la8 do mi, sol do,4 r8
   do4 r8 do4 r8 do4 r8 r4.
   do4\p r8 do4 r8 do4 r8 r r dod\f
   
   %16
   re4 re8 la'4 dod,8 re4 re8 la'4 fa8\mbreak
   sol si sol la dod la si re si dod mi dod
   re4 fa,8 la4 la,8 sib'4 r8 la4 r8
   
   %19
   sol4 r8 fa4 r8 sol4 r8 fa4 r8
   mi4 la8 re,4 dod8 re4 fa8 la4 la,8\mbreak  %% mancano 4 righe
   re' fa, la re,4 re8 mi4 re8 mi4 do8
   
   %22
   fa4.~fa4 fa,8 sib4 do8 fa,4 sol8
   do4 do'8 la sol fa do' mi, sol do,4 r8
   fa4 r8 fa4 r8 fa4 r8 r4.\mbreak
   
   %25
   fa4\p r8 fa4 r8 fa4 r8 r4.
   fa4. r fa,4 r8 r r fa'
   la,4 re8 sib4 do8 fa,4 la8 do sib la
   
   %28
   sib re sib do mi do re fa re mi sol mi\mbreak
   fa4 la,8 do4 do,8 re'4 r8 do4 r8
   sib4 r8 la4 r8 sib4 r8 la4 r8
   
   %31
   sol4 r8 fa4 fa8 do'4 do8 do4 do8
   do4 do8 do4 fa,8 sib4 la8 do4 do,8\mbreak
   fa4 r8 r4. r2.
   
   %34
   fa'4.~fa4 mi8 fa4 la,8 do4 do,8
   fa4 r8 r r do' fa,4.~fa4
  
}

forma = {

    \time 12/8
    \key fa\major
    \tempo 2. = 60
    \partial 8 s8
    s1.*12
    s2. s4. s4
    \bar":..:"\break
    s4
    s1.*21
    %\set Score.measureLength = #(ly:make-moment 11 8) 
    s2. s4. s4
    \bar":|."
    
}


VobI = {
    \global
    <<\VobIn \forma>>

}

VobII = {
    \global
    <<\VobIIn \forma>>

}

Vfg = {
    \global
    \clef bass
    <<\Vfgn \forma>>

}
#(set-global-staff-size 17.5)


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
        title = \markup\smaller{Sonata a 4 FaWV N:c1}
        composer = \markup \center-column{"J. F. Fasch (1688 - 1758)"}

    }

    \markup \huge {[1.] Andante }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Viol[ino] 1"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Viol[ino] 2"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Pasetel""[Viola?]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

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

    %\pageBreak

    \markup \huge {[2.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Viol[ino] 1"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Viol[ino] 2"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Pasetel""[Viola?]"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.5\cm

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

    \header {
        title = \markup\smaller{Sonata a 3 FaWV N:F6}
        composer = \markup \center-column{"J. F. Fasch (1688 - 1758)"}

    }

    \markup \huge {[1.] Largo }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""Primo"}
                \set Staff.shortInstrumentName = "ob1"
                \IobI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""2do"}
                \set Staff.shortInstrumentName = "ob2"
                \IobII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \Ifg
            >>
        >>

        \layout {

            indent = 1.5\cm

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

    \pageBreak

    \markup \huge {[2.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""Primo"}
                \set Staff.shortInstrumentName = "ob1"
                \IIobI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""2do"}
                \set Staff.shortInstrumentName = "ob2"
                \IIobII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \IIfg
            >>
        >>

        \layout {

            indent = 1.5\cm

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

    \pageBreak

    \markup \huge {[3.] Largo }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""Primo"}
                \set Staff.shortInstrumentName = "ob1"
                \IIIobI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""2do"}
                \set Staff.shortInstrumentName = "ob2"
                \IIIobII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \IIIfg
            >>
        >>

        \layout {

            indent = 1.5\cm

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

    \pageBreak

    \markup \huge {[4.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""Primo"}
                \set Staff.shortInstrumentName = "ob1"
                \IVobI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""2do"}
                \set Staff.shortInstrumentName = "ob2"
                \IVobII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \IVfg
            >>
        >>

        \layout {

            indent = 1.5\cm

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

    %\pageBreak

    \markup \huge {[5.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""Primo"}
                \set Staff.shortInstrumentName = "ob1"
                \VobI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Hautbois""2do"}
                \set Staff.shortInstrumentName = "ob2"
                \VobII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \Vfg
            >>
        >>

        \layout {

            indent = 1.5\cm

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
