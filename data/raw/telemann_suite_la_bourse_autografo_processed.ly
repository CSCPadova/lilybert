\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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


acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"doux"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = _\markup \italic { Soli }

solo = _\markup \italic { Solo }

tu = _\markup \italic "tous"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

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

Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}


IobIn = \relative do'' {

    re4. sib8 fa'4. fa,8
    sib4. \tuplet 3/2 {sib16 do re} mib4. \tuplet 3/2 {mib16 fa sol}
    fa8. [sol16 la8. sib16] fa2~

    %4
    fa8. [sol16 la8. sib16] fa8. [mib16 re8. mib16]
    re4. sib8 fa'4. fa,8
    sib2 sib'4. sib8

    %7
    sib4. \tuplet 3/2 {do,16 sib do} la'4. la8
    la4. \tuplet 3/2 {sib,16 la sib} sol'4. sol8
    sol4. fa16 mi fa4. fa8

    %10
    fa4. sol8 sol4.-+ fa8
    mi4.-+ do8 sol'4. sib,8
    la4.-+ \tuplet 3/2 {fa16 sol la} sib4. \tuplet 3/2 {sib16 do re}

    %13
    do8. re16 mi8. fa16 do2~
    do8.[re16 mi8. fa16] do8.-+[sib16 la8. sib16]
    la4. sol'8 fa4.-+ mi8

    %16
    fa4. mi8 mi4.-+ re8
    re4. \tuplet 3/2 {sib16 la sib} mi4. \tuplet 3/2 {do16 si do}
    fa4. mi8 re8. do16 sib8. la16

    %19
    re4. sol,8 sol4._+ fa8
    fa1 fa
    fa4. fa'8

    %22
    re re do do
    sib 16 la sib do re do re sib
    do8 fa sib, sol'

    %25
    la,16 sol la sib do la sib do
    re8 sib mib4
    re16 do sib do re do re mi

    %28
    fa4 mi
    fa r8 re
    mib4 re

    %31
    mib r8 sol
    mib?8 mib re re
    do do re re

    %34
    mib mib re re
    do16 si do re mib re mib fa
    re8 re do do

    %37
    sib sib do do
    re re do do
    sib16 la sib do re sib do re

    %40
    mib8 r fa r
    sol r fa r
    mib r fa r

    %43
    sol r fa r
    mib do16 re mib fa sol la
    sib8 la16 sol fa mib re do

    %46
    re8 do16 sib do8 sib16 la
    sib4 r

    %48
    r8 re[(do sib)]
    do2~
    do8 [mib(re do)]

    %51
    re [re do do]
    sib [sib do do]
    re [re do do]

    %54
    sib4 r
    r8 re[(do sib)]
    do2~

    %57
    do8 [mib(re do)]
    re4 r8 sib
    sol'2~

    %60
    sol8 [mi do la]
    fa'2~
    fa8 [re sib sol]

    %63
    mi'4. do8
    la la sol sol
    fa fa sol sol

    %66
    la la sol sol
    fa16 mi fa sol la sib do la
    sib8 sib la la

    %69
    sol sol la la
    sib sib la la
    sol16 la sib do re sib do re

    %72
    mib8 sol re sol
    do, sol' sib, sol'
    mib sol re sol

    %75
    do, sol' sib, sol'
    la,16 sib do re mi fad sol mi
    fad sol la sol fad mi re do

    %78
    sib8. la16 la8. sol16
    sol4 r8 sol'
    sol2~

    %81
    sol~
    sol4 sol8 fa
    mib16 fa mib re mib8 la

    %84
    fa la, mi' la,
    fa' la, mi' la,
    fa' la, mi'4

    %87
    re16 mi re dod re8 la'
    sib16 la sib la sol8.-+ fa32 sol
    la16 sol la sol fa8.-+ mi32 fa

    %90
    sol16 fa sol fa mi8.-+ re32 mi
    fa2~
    fa~

    %93
    fa~
    fa8. mi32 fa sol8 mi
    fa8. mi16 mi4-+

    %96
    fa8 fa mi mi
    re re mi mi
    fa fa mi mi

    %99
    re16 dod re mi fa re sol re
    mib!8 [mib re re]
    do [do re re]

    %102
    mib [mib re re]
    do16 si do re mib do fa do
    re8 re do do

    %105
    sib sib do do
    re re do do
    sib16 la sib do re do re sib

    %108
    do8 r sib r
    la r sib r
    do r re r

    %111
    do r sib r
    la do fa4
    r8 fa mib4

    %114
    r8 mib[re do]
    re16 mib fa4 re8
    re16 mib fa4 re8
    mib16 fa sol fa mib re mib fa

    %118
    re mib fa mib re do re mib
    do sib la sib do8 la'
    sib4 la

    %121
    sib r8 fad
    sol4 fad
    sol r8 re

    %124
    mib4 re
    mib r8 fa
    re[re do do]

    %127
    sib16 la sib do re do re sib
    do8 fa sib, sol'
    la,16 sol la sib do la sib do

    %130
    re8 sib mib4
    re16 do sib do re sib do re
    mib8 r fa r

    %133
    sol r fa r
    mib r fa r
    sol16 fa sol fa sol fa sol fa

    %136
    mib re mib re mib re mib re
    do sib do sib do sib do sib
    la8 fa16 sol la sib do re

    %139
    mib8 do16 re mib fa sol la
    sib8 la16 sol fa mib re do
    re8 do16 sib do8 sib16 la

    %142
    sib8 sib do do
    re re mib mib
    re re do do

    %145
    sib sib do do
    re re mib mib
    re re do do

    %148
    re sib' do, la'
    sib4 r
    re,4. sib8  fa'4. fa,8

    %151
    sib2 r8 sib16 do re8 [mib16 fa]
    sol4. fa8 fa4 sol8. re16
    mib4. \tuplet 3/2 {do16 si do} lab'4. lab8

    %154
    si,4 do8. re16 re4.-+ do8
    do2 mib4. mib8
    mib4. \tuplet 3/2 {fa,16 mib fa} re'4. re8

    %157
    re4. \tuplet 3/2 {sib16 la sib} sib'4. la8
    sol8.[fa16 mib8. re16] mib8.[re16 do8. sib16]
    la4. \tuplet 3/2 {fa16 mi fa} sib4. \tuplet 3/2 {fa16 mi fa}

    %160
    do'4. \tuplet 3/2 {fa,16 mi fa} re'4. \tuplet 3/2 {fa,16 mi fa}
    mib'!2~mib8.[mib16 fa8. sol16]
    fa8.[sol16 la8. sib16] fa2~

    %163
    fa8. [sol16 la8. sib16] fa8.[mib16 re8. mib16]
    re8.[sib16 do8. re16] mib8.[fa16 sol8. la16]
    sib4. la8 sol8.[fa16 mib8. re16]

    %166
    sol4. do,8 do4.-+ sib8
    sib4. fa'8  sib,1

}


IobIIn = \relative do'' {

    re4. sib8 fa'4. fa,8
    sib4. \tuplet 3/2 {sib16 do re} mib4. \tuplet 3/2 {mib16 fa sol}
    fa8. [sol16 la8. sib16] fa2~

    %4
    fa8. [sol16 la8. sib16] fa8. [mib16 re8. mib16]
    re4. sib8 fa'4. fa,8
    sib2 sib'4. sib8

    %7
    sib4. \tuplet 3/2 {do,16 sib do} la'4. la8
    la4. \tuplet 3/2 {sib,16 la sib} sol'4. sol8
    sol4. fa16 mi fa4. fa8

    %10
    fa4. sol8 sol4.-+ fa8
    mi4.-+ do8 sol'4. sib,8
    la4.-+ \tuplet 3/2 {fa16 sol la} sib4. \tuplet 3/2 {sib16 do re}

    %13
    do8. re16 mi8. fa16 do2~
    do8.[re16 mi8. fa16] do8.-+[sib16 la8. sib16]
    la4. sol'8 fa4.-+ mi8

    %16
    fa4. mi8 mi4.-+ re8
    re4. \tuplet 3/2 {sib16 la sib} mi4. \tuplet 3/2 {do16 si do}
    fa4. mi8 re8. do16 sib8. la16

    %19
    re4. sol,8 sol4._+ fa8
    fa1 fa
    fa4. r8

    %22
    R2*1
    r4 r8 sib
    la la sol sol

    %25
    fa16 mi fa sol la fa sol la
    sib4 la
    sib8 fa fa sib

    %28
    do[do sib sib]
    la la16 sol fa8 fa
    sib sib lab lab

    %31
    sol sol16 fa mib8 sib'
    do do si si
    sol sol si si

    %34
    sol sol fa fa
    mib4 r8 la
    sib sib la la

    %37
    fa fa la la
    fa fa mib mib
    re4 r8 sib'

    %40
    sib4\upl sib\upl
    sib8 r sib r
    sib r sib r

    %43
    sib r sib r
    mib do16 re mib fa sol la
    sib8 la16 sol fa mib re do

    %46
    re8 do16 sib do8 sib16 la
    sib8[re(do sib)]
    sib2~

    %49
    sib8[sib (la sol)]
    la4. la8
    sib8[sib la la]

    %52
    fa[fa la la]
    fa[fa mib mib]
    re[re'(do sib)]

    %55
    sib2~
    sib8[sib(la sol)]
    la4. la8

    %58
    sib fa re'4~
    re8 sib sol mi
    do'2~

    %61
    do8 la fa re
    sib'2~
    sib8 sol mi mi

    %64
    fa[fa mi mi]
    fa[fa mi mi]
    fa[fa sol sol]

    %67
    fa4 r8 la
    sol[sol fad fad]
    sol [sol fad fad]

    %70
    sol[sol la la]
    sol4 r8 sol
    sol4_\upl sol_\upl

    %73
    sol8 r sol r
    sol r sol r
    sol r sol r

    %76
    sol sol do do
    do4 r8 la
    sib8.la16 la8. sol16

    %79
    sol4 r8 re'
    mib sol, re' sol,
    mib' sol, re' sol,

    %82
    mib' sol, re'4
    do16 re do si do8 la'
    la2~

    %85
    la~
    la4 la8 sol
    fa16 sol fa mi fa8 fa

    %88
    sol16 fa sol fa mi8.-+ re32 fa
    fa16 mi fa mi re8.-+ dod32 re

    %90
    mi16 re mi re dod8.\parenthesize -+ si32 dod
    re2~
    re~

    %93
    re~
    re8 dod16 re mi8 dod
    re8. dod16 dod4-+

    %96
    re8 re dod dod
    la la dod dod
    la la sol sol

    %99
    fa4 r8 re'
    do do si si
    sol sol si si

    %102
    sol sol fa fa
    mib!4 r8 do'
    sib sib la la

    %105
    fa fa la la
    fa fa mib mib
    re4 r8 fa

    %108
    fa4_\upl fa_\upl
    fa8 r fa r
    fa8 r fa r

    %111
    fa8 r fa r
    fa4 r8 fa
    sol sol sol fa16 sol

    %114
    la8 la la sol16 la
    sib do re8 la16 sib do8
    sib16 do re4 sib8

    %117
    do16 re mib re do sib do re
    sib do re do sib la sib do
    la sol fa sol la8 fa'

    %120
    fa[fa mib mib]
    re16 do re mib re8 re
    re[re do do]

    %123
    sib16 la sib do sib8 sib
    sib[sib lab lab]
    sol16 fa sol lab sol8 do

    %126
    sib4 r
    r r8 sib
    la la sol sol

    %129
    fa16 mi fa sol la fa sol la
    sib4 la
    sib8[fa fa sib]

    %132
    sib r sib r
    sib r sib r
    sib r sib r

    %135
    sib mib16 re mib re mib re
    do sib do sib do sib do sib
    la sol la sol la sol la sol

    %138
    fa8 fa16 sol la sib do re
    mib8 do16 re mib fa sol la
    sib8 la16 sol fa mib re do

    %141
    re8 do16 sib do8 sib16 la
    sib8 sib la la
    sib sib la la

    %144
    fa fa fa fa
    fa fa la la
    sib sib la la
    fa fa fa fa

    %148
    fa fa sol do
    re4 r
    re4. sib8  fa'4. fa,8

    %151
    sib2 r8 sib16 do re8 [mib16 fa]
    sol4. fa8 fa4 sol8. re16
    mib4. \tuplet 3/2 {do16 si do} lab'4. lab8

    %154
    si,4 do8. re16 re4.-+ do8
    do2 mib4. mib8
    mib4. \tuplet 3/2 {fa,16 mib fa} re'4. re8

    %157
    re4. \tuplet 3/2 {sib16 la sib} sib'4. la8
    sol8.[fa16 mib8. re16] mib8.[re16 do8. sib16]
    la4. \tuplet 3/2 {fa16 mi fa} sib4. \tuplet 3/2 {fa16 mi fa}

    %160
    do'4. \tuplet 3/2 {fa,16 mi fa} re'4. \tuplet 3/2 {fa,16 mi fa}
    mib'!2~mib8.[mib16 fa8. sol16]
    fa8.[sol16 la8. sib16] fa2~

    %163
    fa8. [sol16 la8. sib16] fa8.[mib16 re8. mib16]
    re8.[sib16 do8. re16] mib8.[fa16 sol8. la16]
    sib4. la8 sol8.[fa16 mib8. re16]

    %166
    sol4. do,8 do4.-+ sib8
    sib4. r8 sib1

}

IvlIn = \relative do'' {

    re4. sib8 fa'4. fa,8
    sib4. \tuplet 3/2 {sib16 do re} mib4. \tuplet 3/2 {mib16 fa sol}
    fa8. [sol16 la8. sib16] fa2~

    %4
    fa8. [sol16 la8. sib16] fa8. [mib16 re8. mib16]
    re4. sib8 fa'4. fa,8
    sib2 sib'4. sib8

    %7
    sib4. \tuplet 3/2 {do,16 sib do} la'4. la8
    la4. \tuplet 3/2 {sib,16 la sib} sol'4. sol8
    sol4. fa16 mi fa4. fa8

    %10
    fa4. sol8 sol4.-+ fa8
    mi4.-+ do8 sol'4. sib,8
    la4.-+ \tuplet 3/2 {fa16 sol la} sib4. \tuplet 3/2 {sib16 do re}

    %13
    do8. re16 mi8. fa16 do2~
    do8.[re16 mi8. fa16] do8.-+[sib16 la8. sib16]
    la4. sol'8 fa4.-+ mi8

    %16
    fa4. mi8 mi4.-+ re8
    re4. \tuplet 3/2 {sib16 la sib} mi4. \tuplet 3/2 {do16 si do}
    fa4. mi8 re8. do16 sib8. la16

    %19
    re4. sol,8 sol4._+ fa8
    fa1 fa
    fa4. fa'8

    %22
    re16 fa re fa do fa do fa
    sib, la sib do re do re sib
    do8 fa sib, sol'

    %25
    la,16 sol la sib do la sib do
    re8 sib mib4
    re16 do sib do re do re mi

    %28
    fa4 mi
    fa r8 re
    mib4 re
    mib r8 sol

    %32
    mib16 sol mib sol re sol re sol
    do, sol' do, sol' re sol re sol
    mib sol mib sol re sol re sol

    %35
    do, si do re mib re mib fa
    re fa re fa do fa do fa
    sib, fa' sib, fa' do fa do fa

    %38
    re fa re fa do fa do fa
    sib, la sib do re sib do re
    mib8 sib fa' sib,

    %41
    sol' sib, fa' sib,
    mib sib fa' sib,
    sol' sib, fa' sib,

    %44
    mib do16 re mib fa sol la
    sib8 la16 sol fa mib re do  %%%%% fin QUI
    re8 do16 sib do8 sib16 la

    %47
    sib4 r
    R2*2

    %50
    r4 r8 fa'
    re16 fa re fa do fa do fa
    sib, fa' sib, fa' do fa do fa

    %53
    re fa re fa do fa do fa
    sib,4 r
    R2*8

    %63
    r4 r8 do
    la16 do la do sol do sol do  %%% fin QUI
    fa, do' fa, do' sol do sol do

    %66
    la do la do sol do sol do
    fa, mi fa sol la sib do la
    sib re sib re la re la re
    sol, re' sol, re' la re la re

    %70
    sib re sib re la re la re
    sol, la sib do re sib do re
    mib8 sol re sol

    %73
    do, sol' sib, sol'
    mib sol re sol
    do, sol' sib, sol'

    %76
    la,16 sib do re mi fad sol mi
    fad sol la sol fad mi re do
    sib8. la16 la8. sol16

    %79
    sol4 r8 si,\p
    do16 sol' do, sol' si, sol' si, sol'
    do, sol' do, sol' si, sol' si, sol'

    %82
    do, sol' do, sol' si, sol' si, sol'
    do,4 r8 dod
    re16 la' re, la' dod, la' dod, la'

    %85
    re, la' re, la' dod, la' dod, la'
    re, la' re, la' dod, la' dod, la'
    re,4 r

    %88
    R2*7
    r4 r8 la''\f
    fa16 la fa la mi la mi la
    re, la' re, la' mi la mi la

    %98
    fa la fa la mi la mi la %fine pagina
    re, dod re mi fa re sol re
    mib! sol mib sol re sol re sol

    %101
    do, sol' do, sol' re sol re sol
    mib sol mib sol re sol re sol
    do, si do re mib do fa do

    %104
    re fa re fa do fa do fa
    sib, fa' sib, fa' do fa do fa
    re fa re fa do fa do fa

    %107
    sib, la sib  do re do re sib
    do8 fa, sib fa
    la[fa sib fa]

    %110
    do'[fa, re' fa,]
    do'[fa, sib fa]
    la fa r4

    %113
    R2*1
    r4 r8 fa'\p
    re16 fa re fa do fa do fa

    %116
    re fa re fa sib, fa' sib, fa'
    la,4 r
    R2*1

    %119
    r4 r8 la'\f
    sib4 la
    sib r8 fad

    %122
    sol4 fad
    sol r8 re
    mib4 re

    %125
    mib r8 fa
    re16 fa re fa do fa do fa
    sib, la sib do sib do re sib

    %128
    do8 fa sib, sol'
    la,16 sol la sib do la sib do
    re8 sib mib4

    %131
    re16 do sib do re sib do re
    mib8 sib fa' sib,
    sol' sib, fa' sib,

    %134
    mib sib fa' sib,
    sol'4 r16 fa sol fa
    mib4 r16 re mib re

    %137
    do4 r16 sib do sib
    la8 fa16 sol la sib do re
    mib8 do16 re mib fa sol la

    %140
    sib8 la16 sol fa mib re do
    re8 do16 sib do8 sib16 la
    sib fa' sib, fa' do fa do fa

    %143
    re fa re fa mib fa mib fa
    re fa re fa do fa do fa
    sib, fa' sib, fa' do fa do fa

    %146
    re fa re fa mib fa mib fa
    re fa re fa do fa do fa
    re8[sib' do, la']

    %149
    sib4 r
    re,4. sib8  fa'4. fa,8

    %151
    sib2 r8 sib16 do re8 [mib16 fa]
    sol4. fa8 fa4 sol8. re16
    mib4. \tuplet 3/2 {do16 si do} lab'4. lab8

    %154
    si,4 do8. re16 re4.-+ do8
    do2 mib4. mib8
    mib4. \tuplet 3/2 {fa,16 mib fa} re'4. re8

    %157
    re4. \tuplet 3/2 {sib16 la sib} sib'4. la8
    sol8.[fa16 mib8. re16] mib8.[re16 do8. sib16]
    la4. \tuplet 3/2 {fa16 mi fa} sib4. \tuplet 3/2 {fa16 mi fa}

    %160
    do'4. \tuplet 3/2 {fa,16 mi fa} re'4. \tuplet 3/2 {fa,16 mi fa}
    mib'!2~mib8.[mib16 fa8. sol16]
    fa8.[sol16 la8. sib16] fa2~

    %163
    fa8. [sol16 la8. sib16] fa8.[mib16 re8. mib16]
    re8.[sib16 do8. re16] mib8.[fa16 sol8. la16]
    sib4. la8 sol8.[fa16 mib8. re16]

    %166
    sol4. do,8 do4.-+ sib8
    sib4. fa'8  sib,1

}


IvlIIn = \relative do'' {

    fa,4. fa8 fa4. fa8
    sol4. sol8 sol4. do8
    la8. sib16 do8. re16 do8.[sib16 do8. re16]

    %4
    la8. [sib16 do8. re16] do4. do8
    sib4. fa8 fa4. fa8
    sol2 re'4. re8

    %7
    do2 do4. do8
    sib2 sib4. sib8
    la2 la4. la8

    %10
    sol2 re'4. re8
    do2 do4. sol8
    fa2 re4. sol8

    %13
    mi8.[fa16 sol8. la16] sol8.[fa16 sol8. la16]
    mi8.[fa16 sol8. la16] sol4. sol8
    mi?2 la4. la8

    %16
    la4. sib8 la4. la8
    la4. sol8 sol4. sol8
    fa4. fa8 fa4. fa8

    %19
    fa4. fa8 mi4.-+ do8
    do1 do
    do4. r8

    %22
    R2*1
    r4 r8 sib'
    la16 do la do sol do sol do

    %25
    fa, mi fa sol la fa sol la
    sib4 la
    sib8 fa fa sib

    %28
    do[do sib sib]
    la la16 sol fa8 fa
    sib sib lab lab

    %31
    sol sol16 fa mib8 sib'
    do do si si
    sol sol si si

    %34
    sol sol fa fa
    mib mib16 re do8 la'
    sib sib la la

    %37
    fa fa la la
    fa fa mib mib
    re4 r8 sib'

    %40
    sib4\upl sib\upl
    sib8 r sib r
    sib r sib r

    %43
    sib r sib r
    sol4 r8 do
    sib4 sib

    %46
    sib8 fa sol fa
    fa4 r
    R2*2

    %50
    r4 r8 do'
    sib[sib la la]
    fa[fa la la]

    %53
    fa[fa mib mib]
    re4 r
    R2*8

    %63
    r4 r8 mi
    fa fa mi mi
    do do mi mi

    %66
    do[do do do]
    do4 r8 la'
    sol[sol fad fad]

    %69
    re[re fad fad]
    re[re re re]
    re4 r8 sol

    %72
    sol4_\upl sol_\upl
    sol8 r sol r
    sol r sol r

    %75
    sol r sol r
    sol sol do do
    do4 r8 la

    %78
    sol8. fad16 fad8. re16
    re4 r8 si_\p
    do4 si

    %81
    do si
    do si
    do r8 dod

    %84
    re4 dod
    re dod
    re dod

    %87
    re r
    R2*7
    r4 r8 mi'\f
    re re dod dod

    %97
    la la dod dod
    la la sol sol
    fa4 r8 re'

    %100
    do do si si
    sol sol si si
    sol sol fa fa

    %103
    mib!4 r8 do'
    sib sib la la
    fa fa la la

    %106
    fa fa mib mib
    re4 r8 fa
    fa4_\upl fa_\upl

    %109
    fa8 r fa r
    fa r fa r
    fa r fa r

    %112
    fa4 r
    R2*1
    r4 r8 do'\p

    %115
    sib sib la la
    sib sib  re re
    do4 r

    %118
    R2*1
    r4 r8 fa\f

    %120
    fa fa mib mib
    re16 do re mib re8 re
    re re do do

    %123
    sib16 la sib do sib8 sib
    sib sib lab lab
    sol16 fa sol lab sol8 do

    %126
    sib4 r
    r r8 sib
    la16 do la do sol do sol do

    %129
    fa,16 mi fa sol la fa sol la
    sib4 la
    sib8[fa fa sib]

    %132
    sib r sib r
    sib r sib r
    sib r sib r

    %135
    sib4 r16 re mib re
    do4 r16 sib do sib
    la4 r16 sol la sol

    %138
    fa8 do fa fa
    sol sol do do
    re4 sib

    %141
    sib8 fa sol fa
    fa fa la la
    sib sib la la

    %144
    fa fa fa fa
    fa fa la la
    sib sib la la

    %147
    fa fa fa fa
    fa fa sol do
    re4 r

    %150
    fa,4. fa8 fa4. fa8
    mib4. sol8 fa4. fa8
    mib4. mib'8 re8. do16 re4

    %153
    do2 do4. do8
    sol4 sol sol4. sol8
    sol2 sol4. sol8

    %156
    fa2 fa4. fa8
    sib2 sib4. sib8
    sib2 sib4. mi,8

    %159
    fa2 fa4. fa8
    fa2 fa4. fa8
    sib4. \tuplet 3/2 {sib16 la sib} do4. sib8

    %162
    la8. sib16 do8. re16 do8. sib16 do8. re16
    la8. sib16 do8. re16 do4. do8
    sib4. sib8 sib4 sib

    %165
    sib2 sib4. sib8
    sib4. sib8 la4.-+ fa8
    fa4. r8  fa1

}


Ivlan = \relative do' {

    sib4. re8 do4. do8
    re4. sol,8 do4. do8
    do4. sib8 la4 fa'8. sib,16

    %4
    do4. sib8 la4. la'8
    fa4. re8 do4. do8
    re2 sol4. sol8

    %7
    sol2 fa4. fa8
    fa2 mi4. mi8
    mi?2 re4. re8

    %10
    re2 sol,4. sol'8
    sol2 do,4. mi8
    do2 sib4. sib'8

    %13
    sol4. fa8 mi4 do8. fa16
    sol4. fa8 mi4. mi8
    la,2 la4. mi'8

    %16
    re4. re8 dod4 la
    fa'4. re8 do4. do8
    do4. do8 sib4. do8

    %19
    sib4. re8 do4. do8
    la1 la
    la4. r8
    R2*3

    %25
    r4 r8 fa'
    re16 fa re fa do fa do fa
    sib,8 re16 do sib8 fa'

    %28
    fa fa sib, sib
    do do re sib
    sib sib re re

    %31
    sib sib sib re
    sol[sol sol sol]
    sol[sol sol sol]

    %34
    sol[sol sol sol]
    sol4 r8 fa
    fa[fa fa fa]

    %37
    fa[fa fa fa]
    fa[fa fa fa]
    fa4 r8 fa

    %40
    mib4\upl re\upl
    mib8 r fa r
    sib, r re r

    %43
    mib r fa r
    sol4 r8 mib
    fa4 fa

    %46
    fa8[fa mib re]
    re4 r
    R2*2

    %50
    r4 r8 la'
    fa8[fa fa fa]
    fa8[fa fa fa]

    %53
    fa8[fa fa fa]
    fa4 r
    R2*8

    %63
    r4 r8 do
    do[do do do]
    do[do do do]

    %66
    do[do sib sib]
    la4 r8 re
    re[re re re]

    %69
    re[re re re]
    re[re do do]
    sib4 r8 sol'

    %72
    sol4\upl sib,_\upl
    do8 r re r
    mib r sib r

    %75
    do r re r
    mib[mib do do]
    la4 r

    %78
    R2*17

    %95
    r4 r8 dod'
    la[la la la]
    la[la la la]

    %98
    la[la la la]
    la4 r8 si
    sol[sol sol sol]

    %101
    sol[sol sol sol]
    sol[sol sol sol]
    sol4 r8 la

    %104
    fa[fa fa fa]
    fa[fa fa fa]
    fa[fa fa fa]

    %107
    fa4 r8 fa
    fa4\upl sib,_\upl
    do8 r sib r

    %110
    la r fa' r
    fa r sib, r
    do4 r

    %113
    R2*6
    r4 r8 la'

    %120
    fa8[fa la la]
    fa[fa fa re]
    re[re fad fad]

    %123
    re[re re sib]
    sib[sib re re]
    sib[sib sib fa']

    %126
    fa4 fa
    re fa8 fa
    fa4 sol8 do,

    %129
    do4 r8 fa
    re16 fa re fa do fa do fa
    sib,8 re16 do sib8 fa'

    %132
    mib r re r
    mib r fa r
    sib, r re r

    %135
    mib4 r
    sol r
    fa r

    %138
    do8 la do do
    do mib16 re do8 do
    sol'4 r8 sol

    %141
    fa fa mib do
    re re fa fa
    fa fa la la

    %144
    sib sib mib, mib
    re re fa fa
    fa fa la la

    %147
    sib sib do do
    fa, sib sol fa
    fa4 r

    %150
    sib,4. sib8 re4. re8
    mib4. mib8 re4. re8
    sib4. sib8 sib4 sol

    %153
    sol2 fa'4. fa 8
    re4 do si4.-+ sol8
    mib'2 sol4. sol8

    %156
    do,2 sib4. sib8
    sib2 fa'4. fa8
    mib2 sib4. sib8

    %159
    do2 re4. re8
    do2 sib4. sib8
    sib2 mib4. re8

    %162
    do4. sib8 la4 fa'8. sib,16
    do4. sib8 la4. la'8
    fa4. fa8 sol4 sol

    %165
    fa2 mib4. mib8
    mib4. sol8 fa4. fa8
    re4. r8 re1

}

Ibcn = \relative do {

    sib'4. sib8 la4. la8
    sol4. \tuplet 3/2 {fa16 [mib re]} do4. \tuplet 3/2 {do16 [re mib]}
    fa2~fa8.[sol16 la8. sib16]

    %4
    fa2 fa,4. fa8
    sib4. sib8 la4. la8
    sol4. \tuplet 3/2 {sib'16 [la sib]} sol4. \tuplet 3/2 {sol16 fa sol}

    %7
    mi2 fa4. \tuplet 3/2 {fa16 mi fa}
    re2 mi4. \tuplet 3/2 {mi16 re mi}
    do2 re4. \tuplet 3/2 {re16 do re}

    %10
    sib2 si4._+ la16 si
    do2 mi4. do8
    fa4. \tuplet 3/2 {re16 mi fa} sol4. \tuplet 3/2 {sol,16 la sib}

    %13
    do2~do8. re16 mi8. fa16
    do2 do,4. do8
    dod'2~ dod8.[la16 si8. dod16]

    %16
    re8.[mi16 fa8. sol16] la4 la,
    re4. sol8 do,4. do'8
    la4. \tuplet 3/2 {fa16 sol la} sib8. la16 sol8. fa16

    %19
    sib,4. sib8 do4 do,
    fa4. \tuplet 3/2 {do'16 re mi} fa8.[sol16 la8. fa16] fa,1
    fa4. r8

    %22
    R2*5

    %27
    r4 r8 sib'
    la16 do la do sol do sol do
    fa, mi fa sol lab sol lab fa

    %30
    sol sib sol sib fa sib fa sib
    mib, re mib fa sol fa mib re
    do8 do sol' sol

    %33
    mib[mib sol sol]
    do do si si
    do4 r8 fa,

    %36
    sib, sib fa' fa
    re re fa fa
    sib [sib la la]

    %39
    sib4 r8 sib
    sol16 sib sol sib fa sib fa sib
    mib, sib' mib, sib' re, sib' re, sib'

    %42
    sol sib sol sib fa sib fa sib
    mib, sib' mib, sib' re, sib' re, sib'
    do,4 r8 do

    %45
    re16 sib do re mib fa sol la
    sib8 re, mib fa
    sib,4 r

    %48
    sol' _\markup\italic"Basson" r
    mib r
    fa r8 fa,\tu

    %51
    sib [sib fa' fa]
    re [re fa fa]
    sib[sib la la]

    %54
    sib4 r
    sol_\markup\italic"Basson" r
    mib r

    %57
    fa r
    sib,16 re'do re sib la sol fa
    mi sol fa sol mi re do sib

    %60
    la do' sib do la sol fa mi
    re fa mi fa re do sib la
    sol sib' la sib sol fa mi re

    %63
    do mi re mi <<{do sib la sol}\\{r8 \stemUp \shiftOn do,\tu}>>
    fa8 fa do' do
    la la do do

    %66
    fa fa mi mi
    fa4 r8 fad,
    sol sol re' re

    %69
    sib sib re re
    sol sol fad fad
    sol4 r8 sol,

    %72
    do16 sol' do, sol' sib, sol' sib, sol'
    la, sol' la, sol' sol, sol' sol, sol'
    do, sol' do, sol' sib, sol' sib, sol'

    %75
    la, sol' la, sol' sol, sol' sol, sol'
    do,8[sib do la]
    re4 r8 fad

    %78
    sol do re re,
    sol,4 r
    R2*7
    r4 r8 re''_\markup\italic"Basson"

    %88
    sol, la16 sib do sib la sol
    fa8 sol16 la sib la sol fa
    mi8 fa16 sol la sol fa mi

    %91
    re la' sol la fa sol mi fa
    re fa mi fa re mi do re
    sib re do re sib do la sib

    %94
    sol4 r8 la
    re[sol la la,]\tu
    re re la' la

    %97
    fa fa la la
    re re dod dod
    re4 r8 sol,

    %100
    do, do sol' sol
    mib! mib sol sol
    do do si si %fine pagina

    %103
    do4 r8 fa,
    sib, sib fa' fa
    re re fa fa

    %106
    sib[sib la la]
    sib4 r8 sib
    la16 do la do sol do sol do

    %109
    fa, do' fa, do' sol do sol do
    la do la do sib do sib do
    la do la do sol do sol do

    %112
    fa,2~
    \once\tieDashed fa2~
    fa2~

    %115
    fa2~
    fa2~
    fa2~

    %118
    fa2
    fa,4 r8 fa'
    re16 fa re fa do fa do fa

    %121
    sib, la sib do sib do re do
    sib re sib re la re la re
    sol, fad sol la sol la sib la

    %124
    sol sib sol sib fa sib fa sib
    mib, re mib fa sol8 la
    sib4 la

    %127
    sib re8 sib
    fa'4 mi
    fa r

    %130
    R2*1
    r4 r8 sib
    sol16 sib sol sib fa sib fa sib

    %133
    mib, sib' mib, sib' re, sib' re, sib'
    sol sib sol sib fa sib fa sib

    %135
    mib,4 r
    mib r
    fa r

    %138
    fa,8 la'16 sol fa8 mib16 re
    do8 mib16 re do8 sib16 la
    sol sib do re mib fa sol la

    %141
    sib8 re, mib fa
    sib, sib fa' fa
    sib sib do do

    %144
    sib sib la la
    sib sib la la
    sib sib do do

    %147
    sib sib la la
    sib re, mib fa
    sib,4 r

    %150
    sib'4. sib8 lab4. lab8
    sol4. mib8 sib'4. sib,8
    mib4 lab, sib si

    %153
    do4. \tuplet 3/2 {mib16 re mib} fa4. \tuplet 3/2 {fa16 mib fa}
    sol4 do, sol' sol,
    do4. \tuplet 3/2 {mib'16 re mib} do4. \tuplet 3/2 {do16 sib do}

    %156
    la2 sib4. \tuplet 3/2 {sib16 la sib}
    sol2 re4. \tuplet 3/2 {re16 do re}
    mib8. re16 mib8. fa16   sol4. sol8

    %159
    fa2 re4. re8
    la2 sib4. sib8
    sol4. \tuplet 3/2 {sol'16 fa sol} do,8. do16 re8. mib16

    %162
    fa2~fa8. sol16 la8. sib16
    fa2 fa,4. fa8
    sib4. sib'8 sol4 mib

    %165
    re4. \tuplet 3/2 {sib16 do re} mib8.[re16 do8. sib16]
    mib,4. mib8 fa2
    sib4. r8 sib1

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}



forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 50
    \repeat volta 2{
        s1*19
    }
    \alternative {{s1}{\time 2/2 \tempo 2 = 60 s \time 2/4 s2}}\break
    \set Score.currentBarNumber = #22
    \repeat volta 2{
        s2*128\break
        \time 4/4
        \tempo 2 = 50
        s1*17
    }
    \alternative {{\time 2/4 \tempo 2 = 53 s2}{\time 4/4  s1}}
    \bar "|."


}

IobI = {
    \Iglobal
    \notypeset
    <<\IobIn \forma>>

}


IobII = {
    \Iglobal
    <<\IobIIn \forma>>
}


IvlI = {
    \Iglobal
    <<\IvlIn \forma>>
}


IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>
}


Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>
}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}

IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}


IIobIn = \relative do'' {

    r8 sib do re16.[(mib32)  fa8 fa]
    re mib do re16.[(mib32) fa8 fa]
    re mib do re sib do

    %4
    re16(do) mib(re) do(sib)\mbreak la(sol') fa(mi) fa(la)
    sib(sol) fa(mi) fa(la) sib(la) sol(fa) mib(re)
    do(sib) la(sol) fa mib'  re(do) la8. [sib16]

    %7
    sib8 sib\p do re16.[(mib32) fa8 fa]\mbreak
    re8 mib do re16.[(mib32) fa8 fa]
    re mib do re sib do

    %10
    re16(do) mib(re) do(sib) fa'4.~
    fa~ fa8 do mi
    fa4.~fa8 do mi

    %13
    fa4.~\mbreak fa8 do mi
    fa4 r8 r16 la, do(mib) re(do)
    sib(la) sol8 r r16 do mib(sol) fa(mib)

    %16
    re(do) sib8 r r sib re
    mib sib re mib fa re\mbreak
    mib sib re mib fa re

    %19
    mib sib re mib4 re8
    do16(re) mib4 r8 re16(fa) mib(re)
    do2.~

    %22
    do~
    do
    r8 re16\p fa mib re\mbreak mib8 do re~

    %25
    re16 mib do8. [sib16] sib8 sib do
    re16.[(mib32) fa8 fa] re8 mib do
    re16.[(mib32) fa8 fa] re8 mib do

    %28
    re sib do re16(do) mib(re) do(sib)\mbreak
    sib8 fa'16(re) mib(fa) sol(lab) sol(fa) mib(re)
    mib(fa) mib(re) do(sib) la (sol') fa (mi) fa (la)

    %31
    sib(sol) fa(mi) fa(la) sib(la) sol(fa) mib!(re)\mbreak
    do(sib) la(sol) fa(mib') re(do) la8. [sib16]
    sib4.~sib4\fermata r8


    %34
    r4. do16\f do mi do sol' do
    la8 r r sib r r
    la r r\mbreak sib r r

    %37
    la do,16 (re) do(re) mib(re) mib8 r
    sol,16 sol sib sol re'[sol] fad8 r r
    sol r r fad r r  %%%% fin qui

    %40
    sol r r fad r r\mbreak
    sol re16(mib) re(mib) fa mib fa8 r
    r4. sib,16\f sib re sib fa' sib

    %43
    sol8 r r fa r r
    sol r r sib r r
    sol r r sib re,16 mib fa8\mbreak

    %46
    mib re16 do re8 mib8. [mib16 re do32 re]
    mib8. [mib16 re do32 re] mib8 sol sol
    sol4.~sol4 lab8

    %49
    sol8. fa16 mib re mib8. re16 mib8
    r fa sol lab4.
    sol fa\mbreak

    %52
    sol16 lab fa8. [mib16] mib4 r8
    r la,! la la4.
    sib16 do la8. [sol16] sol4.

}

IIobIIn = \relative do'' {

    r8 sib do re16.[(mib32)  fa8 fa]
    re mib do re16.[(mib32) fa8 fa]
    re mib do re sib do

    %4
    re16(do) mib(re) do(sib)\mbreak la(sol') fa(mi) fa(la)
    sib(sol) fa(mi) fa(la) sib(la) sol(fa) mib(re)
    do(sib) la(sol) fa mib' re(do) la8. [sib16]

    %7
    sib4 r8 r4.
    R2.*2\mbreak

    %10
    r4. r8 fa sol
    la16.[(sib32) do8 do] la sib sol
    la16.[(sib32) do8 do] la sib sol

    %13
    la fa sol la16(sol) sib(la) sol(fa)
    fa8 do' mib16(re) re4 r8\mbreak
    r re sol16(fa) fa4 r8

    %16
    r fa, lab16(sol) sol8 mib fa
    sol16[(lab) sib8 sib] sol lab fa
    sol16[(lab) sib8 sib] sol lab fa

    %19
    sol mib fa sol la! sib
    la16 (sib) do4\mbreak r8 sib16(re) do(sib)
    la2.~

    %22
    la~
    la
    r8 si16 re do si do8la sib?~

    %25
    sib16 do la8. [sib16] sib4.~
    sib sib8 fa la
    sib4.~\mbreak sib8 fa la

    %28
    sib4.~sib 8 fa la
    sib re16(sib) do(re) sol(lab) sol(fa) mib(re)
    mib(fa) mib(re) do(sib) la (sol') fa (mi) fa (la)

    %31
    sib(sol) fa(mi) fa(la) sib(la) sol(fa) mib!(re)\mbreak
    do(sib) la(sol) fa(mib') re do la8. [sib16]
    sib4.~sib4\fermata r8

    %34
    fa16 fa la fa do'[fa] mi8 r r
    fa r r re r r\mbreak
    fa r r re r r

    %37
    fa la,16(sib) la(sib) do (sib) do8 r
    r4. re,16\f re fad re la' re
    sib8 r r re r r

    %40
    re r r re r r\mbreak
    re sib16(do) sib(do) lab sol lab8 r
    mib16 mib sol mib sib'[mib] re8 r r

    %43
    sib r r re r r
    sib r r re r r
    sib r r\mbreak re fa,16 sol lab8

    %46
    sol16 lab fa8[sib] sol16 sib sol mib fa8
    sol16 sib sol mib fa8 sol mib r
    r do' si do16.[(re32) mib8 re]

    %49
    si8. la16 si8 do8. si16 do8\mbreak
    r do mi fa4.~
    fa8\breathe mib4. re4

    %52
    mib16 fa re8.[mib16] mib8 sol sol
    sol4. fad4.
    sol16 la fad8.[sol16] sol4.

}

IIvlIn = \relative do'' {

    r8 sib do re16.[(mib32)  fa8 fa]
    re mib do re16.[(mib32) fa8 fa]
    re mib do re sib do

    %4
    re16(do) mib(re) do(sib)\mbreak la(sol') fa(mi) fa(la)
    sib(sol) fa(mi) fa(la) sib(la) sol(fa) mib(re)
    do(sib) la(sol) fa mib'  re(do) la8. [sib16]

    %7
    sib8 re,\p fa sib la fa
    sib mib, fa sib la fa
    sib mib, fa sib, re fa\mbreak

    %10
    sib la sol fa4 r8
    R2.*5

    %16
    r4. sib~
    sib~sib~
    sib~sib~

    %19
    sib r
    r8 do16(re) mib8 re r r
    r do fa la,16.[(sib32) do8 do]\mbreak

    %22
    r do fa la,16.[(sib32) do8 do]
    la16.[(sib32) do8 do] la,16.[(sib32) do8] r
    R2.*5

    %29
    r8 fa'16(re) mib(fa) sol(lab) sol(fa) mib(re)
    mib(fa) mib(re) do(sib) la (sol') fa (mi) fa (la)
    sib(sol) fa(mi) fa(la) sib(la) sol(fa) mib!(re)\mbreak

    %32
    do(sib) la(sol) fa(mib') re(do) la8. [sib16]
    sib (fa) sol (fa) sol (mib) fa4\fermata r8
    r4. do'16^\f do mi do sol' do

    %35
    la32 sib la sol fa16 [la fa la] sib sib sib sib sib sib
    la do32 sib la [sib la sol] fa sol fa mib re16 sib' sib sib sib sib]
    la sol fa8 r r4.

    %38
    sol,16 sol sib sol re'[sol]\mbreak fad32 sol fad mi re16 [fad re fad]
    sol re sib sol re' sol fad la32 sol fad [sol fad mi] re mib re do
    sib16 sol' sol sol sol sol fad la32 sol fad[sol fad mi] re fad mi fad\mbreak

    %41
    sol8 re r r4.
    r sib16 sib re sib fa' sib
    sol32 lab sol fa mib16 [sol mib sol] sib fa re sib fa' sib

    %44
    sol sib32 lab sol [lab sol fa] mib sol fa mib fa16 sib sib sib sib sib\mbreak
    sib sib32 lab sol [lab sol fa] mib sol fa mib fa16 mib re8 r
    r4. r8 sib sib,

    %47
    r sib' sib, r4.
    R2.*1
    r4. do'16 sib32 lab sol [lab sol fa] mib fa mib re\mbreak

    %50
    do4 r8 r4.
    R2.*4

}


IIvlIIn = \relative do'' {

    r8 fa, la  sib do do
    sib do la sib do do
    sib do la sib fa la

    %4
    sib fa mi fa4 la8
    sol sib la fa sol do
    la fa fa fa fa fa\mbreak

    %7
    fa4 r8 r4.
    R2.*8
    r4. sib~

    %17
    sib~sib~
    sib~sib~
    sib r

    %20
    r8 la16[(sib) do8] sib r r
    r la do fa,16.[(sol32) la8 la]
    r la do fa,16.[(sol32) la8 la]\mbreak

    %23
    fa16.[(sol32) la8 la] do,16.[(sib32) la8] r
    R2.*5
    r8 re' re sib sib si

    %30
    do do sol fa4 la8
    fa sib la fa sol do
    la fa fa fa fa fa

    %33
    fa16(re) mib(re) mib (do) re4\fermata r8\mbreak
    fa16 fa la fa do'[fa] mi32 fa mi re do16 mi do mi
    fa do la fa do' fa re fa32 mib! re [mib re do] sib re do sib

    %36
    fa'16 fa fa fa fa fa fa fa32 mib re [mib re do] sib re do sib\mbreak
    do16 sib la8 r r4.
    r re,16 re fad re la'[re]

    %39
    sib32 do sib la sol16 [sib sol sib] re re re re re re
    re re32 do sib [do sib la] sol sib la sol la16 re re re re re\mbreak
    sib la sib8 r r4.

    %42
    mib,16 mib sol mib sib'[mib] re32 mib re do sib16 [re sib re]
    mib mib mib mib mib mib re32 mib re do sib16 [re sib re]
    mib mib mib mib mib mib \mbreak re fa32 mib re [mib re do] sib do sib lab

    %45
    sol16 mib' mib mib mib mib re do sib8 r
    r4. r8 sib sib,
    r sib' sib, r4.

    %48
    R2.*1
    r4. do'16 sib32 lab sol [lab sol fa] mib fa mib re
    do4 r8 r4.

    %51
    R2.*4

}


IIvlan = \relative do' {

    r8 sib fa'  fa fa la
    fa sol fa fa fa la
    fa sol fa fa fa fa

    %4
    fa fa sol do, do do\mbreak
    mi sol do, sib sib mib?
    fa fa do sib do re

    %7
    re4 r8 r4.
    R2.*12

    %20
    r8 fa fa fa r r
    r fa la do fa, fa
    r fa la\mbreak do fa, fa

    %23
    R2.*6
    r8 sib sib sib sib sol

    %30
    sol sol16(fa) mib(re) do8 do do
    mi sol do, sib sib mib
    fa fa do sib do mib

    %33
    re sib sib sib4\fermata r8\mbreak
    do do16 do fa do do8 sol'16 sol do, do
    do8 do16 do fa fa fa8 fa16 fa mi mi

    %36
    do8 do16 do do do sib8 fa'16 fa mi mi
    fa8 do r r4.\mbreak
    r la'8 la16 la re, re

    %39
    re8 re16 re sol sol la8 la16 la la la
    sol8 sol16 sol do do
    re8 la16 la fad fad

    %42
    re8 sol r r4.
    sol,8 sib16 sib mib mib fa8 fa16 fa sib sib\mbreak
    sib8 sol16 sib sib sib sib8 fa16 sib sib sib

    %45
    sib8 sib16 sib la la sib8 fa16 fa fa fa
    mib8 sib'16 sib la la sib8 fa r

    %47
    R2.*9

}

IIbcn = \relative do {

    sib8 re fa  sib la fa
    sib mib, fa sib la fa
    sib mib, fa sib, re fa

    %4
    sib la sol\mbreak fa fa fa
    fa fa fa re mib do
    fa sol la sib fa fa,

    %7
    sib4 r8 r4.
    R2.*2

    %10
    r4. r8 la_\markup\italic"Basson" do
    fa16.[(sol32) la8 la]\mbreak fa mi do
    fa16.[(sol32) la8 la] fa mi do

    %13
    fa la sib do4 do,8
    fa4 r8 fad4 r8
    sol4 r8 la4 r8

    %16
    sib4 r8 mib, sol sib\mbreak
    mib, re sib mib r sib'
    mib, re sib mib r sib'

    %19
    mib, re do mib16(re)  do8 sib
    fa'4 la8 sib4 sib,8
    fa'4 r8 r4.\mbreak

    %22
    fa,4 r8 r4.
    R2.*1
    sib'8 sol sol do fa, sib

    %25
    mib, fa fa, sib re fa
    sib16.[(do32) re8 re] sib la fa
    sib16.[(do32) re8 re] sib la fa\mbreak

    %28
    sib re, mib fa4 fa,8
    sib sib' sib mib, fa sol
    do, re mib fa fa fa

    %31
    fa fa fa re mib do
    fa sol la sib fa fa,\mbreak
    sib sib sib sib4\fermata r8

    %34
    fa'8 fa,16 fa' la fa do'8 do,16 do' mi, do
    fa8 fa,16 fa' la fa sib8 sib16 sib sol sol
    fa8 fa16 fa la la sib8 sib16 sib sol sol\mbreak

    %37
    fa8 fa, r fad'4 r8
    sol sol,16 sol' sib sol re8 re,16 re' fad re
    sol8 sol,16 sol' sib sol re8 re,16 re' fad re

    %40
    sol8 sol16 sol mib mib re8 re16 re re re\mbreak
    sol8 sol, r re'4 r8
    mib\tu mib,16 mib' sol mib sib'8 sib,16 sib' re sib

    %43
    mib,8 mib,16 mib' sol mib sib'8 sib,16 sib' re sib
    mib,8 mib16 mib do do sib8 sib16 sib re re
    mib8 mib16 mib do do\mbreak sib4 re8

    %46
    mib sib' sib, mib r sib'
    mib, r sib' mib, r r
    r mib' re mib16.[(re32) do8 fa,]

    %49
    sol sol, sol' do do, do'
    lab4 sol8\mbreak fa re16 sib do re
    mib re mib fa sol mib lab fa sib lab sol fa

    %52
    mib8 sib' sib, mib mib16 re mib re
    do sib do re mib do re mib re do sib la\mbreak
    sol8 re' re, sol4.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}



forma = {

    \time 6/8
    \key sib\major
    \tempo 4. = 35
    s2.*54
    \override Score.RehearsalMark #'self-alignment-X = #center
    \bar "||"
    \mark"D.C."


}

IIobI = {
    \IIglobal
    \notypeset
    <<\IIobIn \forma>>

}


IIobII = {
    \IIglobal
    <<\IIobIIn \forma>>
}


IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>
}


IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>
}


IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>
}


IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}

IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}

IIIobIn = \relative do'' {

    re8 fa4 mib16 re do8 mib4 re16 do
    re8 fa4 mib16 re do8 fa, r do'
    re(do) mib(re) fa(mib) sol(fa)\mbreak

    %4
    mib(re) fa(mib) re(do) r la
    sib re16 do sib8[sib] sib sol mib sib'
    do mib16 re do8[do] do la fa do'

    %7
    re fa16 mib re8[re] re mib16 fa sol8[fa]\mbreak
    mib re do sib la sol fa mib
    re do' fa,[la] sib4 r8 fa'

    %10
    sib, do16 re do8[re16 mib] re do re do sib do re mib
    re8 fa4 mib16 re do8 mib4 re16 do\mbreak
    re8 fa4 mib16 re do8 fa, r fa'

    %13
    sib, do16 re do8[re16 mib] re do re do sib do re mib
    fa8 re sib4 r r8 sol'
    sol mib do4 r r8 fa\mbreak

    %16
    mi(re) re[(do)] do(re) mi[(fa)]
    mi(re) re[(do)] do(re) mi(fa)
    sol16(fa) fa(mi) fa(mi) mi(re) mi8 do fa re
    fa4 (mi8.) fa16 fa4 r

    %20
    r4 sib,8(la) r4 re8(do)
    r4 do8(sib) r4 r8 do16 sib\mbreak
    la sib la sib do re sib do re do re do sib8 fa'16 mib

    %23
    re mib re mib fa sol mib fa sol fa sol fa mib8 sol
    sol mib do4 r r8 fa\mbreak
    fa re sib4 r r8 do

    %26
    do16 sib la sol fa8 fa' fa2~
    fa1~
    fa4 r8 do re(do) mib(re)

    %29
    fa(mib) sol(fa) mib(re) fa(mib)
    re(do) r fa, sib(sol) lab[(fa)]
    sol(mib) sol[(sib)] mib(do) re[(mib)]

    %32
    fa do re[sib]~sib do16(la) sib do re sib\mbreak
    do re mib re do sib la sol fa8 (la do mib)
    sol16 fa sol mib fa mib fa re mib re mib do re do re sib
    la sib do la fa8 la sib4 r

    %36
    sib8\f re16 do sib8[sib] sib sol mib [sib']
    do mib16 re do8[do] do la fa [do']
    re8 fa16 mib re8 la' sib16 la sol sib la sol fa la

    %39
    sol fa mi sol fa mi re fa\mbreak mib re do mib re do sib re
    do sib la do sib8 sol sib4(la8.) sib16
    sib4\fermata r8 re sol4 re

    %42
    sib8 la16(sib) do(sib) la(sol) re'2~
    re~re4 r8 re
    sol4 re sib8 la16 (sib) do(sib) la(sol)\mbreak
    re'4 r8 re si4 do

    %46
    re16 mib re mib fa8 mib16 re mib8 sol4 fa16 mib
    re8 fa4 mib16 re mib8 sol4 fa16 mib
    re8 fa4 mib16 re mib8 do re[mib]

    %49
    fa16 sol fa sol lab sol fa mib re mib re do sib8 mib
    re(do) do(sib) sib(do) re(mib)
    re(do) do(sib) sib2~

    %52
    sib1~
    sib8 (do) re(mib) re(mib) fa(sol)\mbreak
    fa(sol) lab(fa) sol(re) mib(do)

    %55
    mib4(re8.) mib16 mib4. re8
    do(sib) la[(sol)] la8 do4 sib16 la
    sib8 re4 do16 sib la8 do4 sib16 la

    %58
    sib8 re sol fa\mbreak mib16( fa mib re) re(mib re do)
    do(re do sib) sib(do sib la) la8 fad sol mib'
    sib4(la8.) sol16 sol2

}

IIIobIIn = \relative do'' {

    re8 fa4 mib16 re do8 mib4 re16 do
    re8 fa4 mib16 re do8 fa, r la
    sib(la) do[(sib)] re(do) mib[(re)]\mbreak

    %4
    do(sib) re[(do)] sib(la) r la
    sib re16 do sib8[sib] sib sol mib sib'
    do mib16 re do8[do] do la fa do'

    %7
    re fa16 mib re8[re] re mib16 fa sol8[fa]\mbreak
    mib re do sib la sol fa mib
    re do' fa,[la] sib4 r

    %10
    r8 fa' la, sib16 do sib8 fa16 mib re8[sib'16 do]
    re8 fa4 mib16 re do8 mib4 re16 do\mbreak
    re8 fa4 mib16 re do8 fa, r4

    %13
    r8 fa' la,[sib16 do] sib8 fa16 mib re8[sib'16 do]
    sib4 r8 re re sib sol4
    r r8 mib' la,[sib16 (do)] fa,8 do'\mbreak

    %16
    do1~
    do2~do4 r
    R1*2

    %20
    r4 sol8(fa) r4 sib8 la
    r4 la8(sol) r4 r8 mi
    fa16 sol fa sol la sib sol la sib8 fa16 mib! re8[re'16 do]

    %23
    sib do sib do re mib do re mib8 sib16 lab sol4
    r r8 mib' mib do la4
    r r8 re re sib sol4\mbreak

    %26
    r4 r8 do re(do) mib[(re)]
    fa(mib) sol[(fa)] mib(re) fa[(mib)]
    re(do) r la sib(la) do(sib)

    %29
    re(do) mib(re) do(sib) re(do)\mbreak
    sib (la) r4 r2
    R1*5

    %36
    sib8\f re16 do sib8[sib] sib sol mib [sib']
    do mib16 re do8[do] do la fa [do']
    re8 fa16 mib re8 la' sib16 la sol sib la sol fa la

    %39
    sol fa mi sol fa mi re fa\mbreak mib re do mib re do sib re
    do sib la do sib8 sol sib4(la8.) sib16
    sib4\fermata r r2

    %42
    r2 la8 do4 sib16 la
    sib8 re4 do16 sib la8 do4 sib16 la
    sib4 r do r8 sol

    %45
    fad16 sol fad sol la8 sol16 fad\mbreak sol4 r8 do~
    do si16 do re8[do16 si] do8 mib4 re16 do
    si8 re4 do16 si do8 mib4 re16 do

    %48
    si8 re4 do16 si do4 r\mbreak
    r2 r4 r8 sol
    fa(mib) mib(re) re(mib) fa(sol)

    %51
    fa(mib) mib(re) re4 r
    R1*4

    %56
    r2 fad8 la4 sol16 fad\mbreak
    sol8 sib4 la16 sol fad8 la4 sol16 fad
    sol4 r r2

    %59
    R1*2

}

IIIvlIn = \relative do'' {

    sib'16 re, sib' re, sib'16 re, sib' re, la' do, la' do, la' do, la' do,
    sib'16 re, sib' re, sib'16 re, sib' re, la'4 r8 fa,\mbreak
    fa1~

    %4
    fa2~fa4 r8 do'
    fa16 sib, fa' sib, fa' sib, fa' sib, sol' sib, sol' sib, sol' sib, sol' sib,
    sol' do, sol' do, sol' do, sol' do, la' do, la' do, la' do, la' do,

    %7
    la' re, la' re, la' re, la' re,\mbreak sib' sib la la sol sol fa fa
    mib mib re re do do sib sib la la sol sol fa fa mib mib
    re8 do' fa,[la] sib4 r

    %10
    R1*1
    sib'16 re, sib' re, sib' re, sib' re, la' do, la' do, la' do, la' do,
    sib' re, sib' re, sib' re, sib' re, la'4 r

    %13
    R1*1
    sib,16\dolce re, sib' re, sib' re, sib' re, sib' mib, sib' mib, sib' mib, sib' mib,\mbreak
    do' mib, do' mib, do' mib, do' mib, do'4 r8 la

    %16
    sol(fa) fa(mi) mi(fa) sol(la)
    sol(fa) fa(mi) mi (fa) sol\noBeam r
    R1

    %19
    r2 r4 r8 sol
    la sol r4\mbreak do8(sib) r4
    sib8(la) r4 la8(sol) r4

    %22
    R1*2
    do16 mib, do' mib, do' mib, do' mib, do' fa, do' fa, do' fa, do' fa,

    %25
    sib re, sib' re, sib' re, sib' re, sib' mib, sib' mib, sib' mib, sib' mib,
    \mbreak
    la4 r8 la sib(la) do[(sib)]
    re(do) mib[(re)] do(sib) re[(do)]

    %28
    sib(la) r fa' fa2~
    fa1~
    fa4 r r2

    %31
    R1*4

    %35
    r2 re,8(fa) sib[(re)]\mbreak
    fa16\f sib, fa' sib, fa' sib, fa' sib, sol' sib, sol' sib, sol' sib, sol' sib,
    sol' do, sol' do, sol' do, sol' do, la' do, la' do, la' do, la' do,

    %38
    la' re, la' re, la' re, la'  re, sib'8(sol) la[(fa)]
    sol(mi) fa[(re)] mib[(do)] re(sib)
    do(la) sib[(sol)] fa16(sol la sib) do,8 la'

    %41
    sib4\fermata r r2
    r fad'16\dolce la, fad' la, fad' la, fad' la,
    sol' sib, sol' sib, sol' sib, sol' sib,\mbreak fad' la, fad' la, fad' la, fad' la,

    %44
    sol'4 r r2
    R1*1
    r2 sol,16 sol, sol' sol, sol' sol, sol' sol,

    %47
    sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol,\mbreak
    sol' sol, sol' sol, sol' sol, sol' sol, sol'4 r
    R1*2

    %51
    r2 lab8 (sol) sol (fa)
    fa(sol) sol[(lab)] lab(sol) sol[(fa)]
    fa4 r r2

    %54
    R1*2
    r2 re'16 re, re' re, re' re, re' re,

    %57
    re' re, re' re,  re' re, re' re,re' re, re' re, re' re, re' re,
    re'4 r r2
    R1*2

}

IIIvlIIn = \relative do'' {

    sib'16 re, sib' re, sib'16 re, sib' re, la' do, la' do, la' do, la' do,
    sib'16 re, sib' re, sib'16 re, sib' re, la'4 r8 fa,\mbreak
    fa1~

    %4
    fa2~fa4 r8 do'
    fa16 sib, fa' sib, fa' sib, fa' sib, sol' sib, sol' sib, sol' sib, sol' sib,
    sol' do, sol' do, sol' do, sol' do, la' do, la' do, la' do, la' do,

    %7
    la' re, la' re, la' re, la' re,\mbreak sib' sib la la sol sol fa fa
    mib mib re re do do sib sib la la sol sol fa fa mib mib
    re8 do' fa,[la] sib4 r

    %10
    R1*1
    sib'16 re, sib' re, sib' re, sib' re, la' do, la' do, la' do, la' do,
    sib' re, sib' re, sib' re, sib' re, la'4 r

    %13
    R1*1
    fa,8\dolce fa fa fa sol sol sol sol
    sol sol sol sol la4 r8 la

    %16
    sol(fa) fa(mi) mi(fa) sol(la)
    sol(fa) fa(mi) mi (fa) sol\noBeam r
    R1

    %19
    r2 r4 r8 mi
    fa(mi) r4 la8(sol) r4
    sol8(fa) r4 fa8 mi r4

    %22
    R1*2
    sol8 sol sol sol la la la la

    %25
    fa fa fa fa sol sol sol sol\mbreak
    fa4 r8 la sib(la) do[(sib)]
    re(do) mib[(re)] do(sib) re[(do)]

    %28
    sib(la) r fa' fa2~
    fa1~
    fa4 r r2

    %31
    R1*5

    %36
    fa16\f sib, fa' sib, fa' sib, fa' sib, sol' sib, sol' sib, sol' sib, sol' sib,
    sol' do, sol' do, sol' do, sol' do, la' do, la' do, la' do, la' do,

    %38
    la' re, la' re, la' re, la'  re, sib'8(sol) la[(fa)]
    sol(mi) fa[(re)] mib(do) re[(sib)]
    do(la) sib[(sol)] fa16(sol la sib) do,8 la'

    %41
    sib4\fermata r r2
    r la8\dolce do4 sib16 la
    sib8 re4 do16 sib la8 do4 sib16 la

    %44
    sib4 r r2
    R1*1
    r2 sol16 sol, sol' sol, sol' sol, sol' sol,

    %47
    sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol,\mbreak
    sol' sol, sol' sol, sol' sol, sol' sol, sol'4 r
    R1*2

    %51
    r2 fa8 \parentSlur (mib) mib \parentSlur (re)
    re(mib) mib[(fa)] fa(mib) mib[(re)]
    re4 r r2

    %54
    R1*2
    r2 re'16 re, re' re, re' re, re' re,

    %57
    re' re, re' re,  re' re, re' re,re' re, re' re, re' re, re' re,
    re'4 r r2
    R1*2

}

IIIvlan = \relative do' {

    fa8 re re fa fa do do fa
    fa re re fa fa4 r
    R1*1

    %4
    r2 r4 r8 fa\mbreak
    fa8 fa fa fa mib sib sib mib
    sol sol sol sol fa do do fa

    %7
    la la la la sol16 sol la la sib sib sib sib
    la la sib sib fa fa mi mi\mbreak fa fa sib, sib sib sib la la
    sib8 sol la [do] re4 r

    %10
    R1*4
    fa8 fa fa fa sol sol sol sol

    %15
    sol sol sol sol la4 r\mbreak
    R1*8
    sol8 sol sol sol la la la la

    %25
    fa fa fa fa sol sol sol sol
    fa4 r r2
    R1*9\mbreak

    %36
    fa8\f fa fa fa mib sib sib mib
    sol sol sol sol fa do do fa
    la la la la sol(sib) do(la)

    %39
    sib(sol) la(fa) sol(la) sib(re,)
    mib(fa) sol(mib) fa4(mib8.-+) re16\mbreak
    re4\fermata r r2

    %42
    r2 re8 la la [re]
    re sib sib re re la la re
    re4 r r2

    %45
    R1*1
    r2 do8 do do do
    sol' sol sol sol do, do do do\mbreak

    %48
    sol' sol sol sol do,4 r
    R1*2
    r2 fa8(mib) mib(re)

    %52
    re(mib) mib[(re)] re(mib) mib[(sib)]
    sib4 r r2
    R1*2

    %56
    r2 re8 re re re
    sol, sol sol sol \mbreak re' re re re
    sol,4 r r2

    %59
    R1*2

}

IIIbcn = \relative do {

    sib8 sib sib sib fa' fa fa fa
    sib, sib sib sib fa'4 r
    R1*1

    %4
    r2 r4 fa8 mib\mbreak
    re re re re mib mib mib mib
    mib mib mib mib fa fa fa fa

    %7
    fa fa fa fa sol16 sol fa fa mib mib re re
    do' do sib sib la la sol sol\mbreak fa fa mib mib re re do do
    sib8 mib fa[fa,] sib4 r

    %10
    re_\markup\italic"Basson" fa sib r
    sib,8\tu sib sib sib fa' fa fa fa
    sib sib sib sib\mbreak fa4 r

    %13
    re_\markup\italic"Bassoni" fa sib r
    re,8_\markup\italic"tous, doux" re re re mib mib mib mib
    mib mib mib mib fa4 r

    %16
    R1
    r2 r4 r8 la
    sib sol la [sib]\mbreak do sib la [sib]

    %19
    do sib do do, <<{fa, la'16_\markup\italic"[Bassoni]" sol fa8 do'}\\{fa,,4 r}>>
    do''1~
    do2~do4 r8 <<do,\\do_\markup\italic"[tous]">>

    %22
    fa4 fa, sib r8 sib\mbreak
    sib'4 sib, mib r
    mib8 mib mib mib fa fa fa fa

    %25
    re re re re mib mib mib mib
    fa4 r r2
    R1*3

    %30
    r4 fa8(mib) re(mib) do[(re)]\mbreak
    mib sol16(fa) mib8[(re)] do la' sib [do]
    re la sib [mib,] fa mib re[sib]

    %33
    mib2 fa4 r
    mib'8(do) re[(sib)] do(la) sib[mib,]
    fa4 fa,\mbreak sib r

    %36
    re8\f re re re mib mib mib mib
    mib mib mib mib fa fa fa fa
    fa fa fa fa sol(sib) do(la)

    %39
    sib(sol) la(fa) sol(la) sib(re,)\mbreak
    mib(fa) sol(mib) fa4 fa,
    sib\fermata r r r8 re

    %42
    sol4 mib re8 re re [re]
    sol sol sol sol re re re re
    sol,4 r8 re' sol4 mib\mbreak

    %45
    re8 mi fad re sol sol, mib'[lab]
    sol4 fa8 sol do,4 r
    sol' r do, r

    %48
    sol' r do,8 do'4 sib8
    lab sol fa[lab]\mbreak <<
        {
            sib2^\markup\italic"Bassoni"~
            sib1~

            %51
            sib2
        }\\{sib4 sib, r1 r2}
    >> <<sib4\\sib_\markup\italic"[tous]">> r
    R1*1
    r2 sib'8(do) re(mib)

    %54
    re(sib) do[(re)] mib sib do[lab]
    sib lab sib sib,\mbreak mib(re) do[(sib)]
    la!(sol) fad[(sol)] re'4 r

    %57
    sol r re r
    sol r8 sol do8(sib) sib[(la)]
    la(sol) sol[(fad)] fad re mib[do]\mbreak

    %60
    re4 re, sol2

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}



forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 60
    s1*60
    \override Score.RehearsalMark #'self-alignment-X = #center
    \bar "||"
    \mark"D.C."

}

IIIobI = {
    \IIIglobal
    \notypeset
    <<\IIIobIn \forma>>

}


IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>
}


IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>
}


IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>
}


IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>
}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}

IVglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}

IVobIn = \relative do'' {

    sib'8
    la sol16 (fa) sib8
    la sol16 (fa) sib8
    sol lab16 sol fa mib

    %4
    re8 sib do
    re16 mib re mib re mib
    do re do re do re

    %7
    mib fa mib fa mib fa
    re mib re mib re mib
    fa sol fa mib re mib

    %10
    do sib do re do re
    mib8 re16 do re8
    do sib16 la sib8

    %13
    mib re16 do re8
    do sib16 la sib8  %%% fin qui fine 1mo sistema
    do fa, la

    %16
    sib4 sib'8
    la sol16 (fa) sib8
    la sol16 \parentSlur (fa) sib8

    %19
    sol lab16\parentSlur (sol) fa\parentSlur (mib)
    re(mib) re(do) re8
    do \parentSlur (fa,16) la sib re

    %22
    do8 \parentSlur (fa,16) la sib re
    do16 re mib8 re
    do4 sib'8

    %25
    la sol16 (fa) sib8
    la sol16 (fa) sib8
    sol fa mib

    %28
    re sib do
    re16 mib re mib re mib
    do re do re do re

    %31
    mib fa mib fa mib fa
    re mib re mib re mib
    fa mib re mib do re

    %34
    mib16 re mib8 sib
    do16 re mib8 re
    do sib16 la sib8

    %37
    do16 re mib8 re
    do sib16 la sib8
    mib re do

    %40
    fa sol16 la sib8
    do, fa, la
    sib4 r8

    %43
    r r sol'
    fa fa r
    r r sol

    %46
    fa fa sol
    fa re mi
    fa sol16 la sib8

    %49
    sib, re16(do) sib(la)
    sib4\fermata sib8
    sol4 do8

    %52
    fa,4 mi8
    fa4 fa8
    do'4 sib8

    %55
    la sol fad
    sol do re
    sol, re' mi

    %58
    fa, do' re
    mib,! sib' do
    re,4 sol'8

    %61
    do sib mib,
    re fa lab
    sol lab fa

    %64
    mib4 sol8
    fa r r
    fa r r

    %67
    fa sol16 fa sol mib
    fa8 sib, r
    R4.*3

    %72
    r8 r sib16 do
    re mib re mib re mib
    fa sol fa sol fa sol

    %75
    lab8 r lab
    sol mib sib'
    la!16 sib do8 sib

    %78
    la sol16 fad sol8
    R4.*2

    %81
    do,16 re mib8 re
    do sib la
    sib16(do) la8.[sol16]

    %84
    sol4

}


IVobIIn = \relative do'' {

    re8
    do sib16(la) re8
    do sib16(la) re8
    sib sib la

    %4
    sib fa la
    sib16 do sib do sib do
    la sib la sib la sib

    %7
    do re do re do re
    sib do sib do sib do
    re mib re do sib do

    %10
    la16 sol la sib do re
    mib8 re16 do re8
    do sib16 la sib8

    %13
    mib re16 do re8
    do sib16 la sib8
    do fa, la

    %16
    sib4 re8
    do sib16(la) re8
    do sib16(la) re8

    %19
    sib8 do la
    sib16\parentSlur (do) sib\parentSlur (la) sib8
    la16 do la fa re sib'

    %22
    la do la fa re sib'
    la sib do8 sib
    la4 re8

    %25
    do sib16\parentSlur  (la) re8
    do sib16\parentSlur (la) re8
    sib sib la

    %28
    sib fa la
    sib16 do sib do sib do
    la sib la sib la sib

    %31
    do re do re do re
    sib do sib do sib do
    lab sol fa sol mib fa

    %34
    sol fa sol8 sib
    do16 re mib8 re
    do sib16 la sib8

    %37
    do16 re mib8 re
    do sib16 la sib8
    mib re do

    %40
    fa sol16 la sib8
    do, fa, la
    sib4 r8

    %43
    r r mib
    re re r
    r r mib

    %46
    re re sol
    fa re mi
    fa sol16 la sib8

    %49
    sib, re16(do) sib(la)
    sib4\fermata sib8
    sol4 do8

    %52
    fa,4 mi8
    fa4 fa8
    do'4 sib8

    %55
    la sol fad
    sol do re
    sol,16  la sol la sol la

    %58
    fa sol fa sol fa sol
    mib fa mib fa mib fa

    %60
    re4 re'8
    do re mib
    lab,4 fa'8

    %63
    mib fa re
    mib4 mib8
    re r r

    %66
    re r r
    re mib16 re mib do
    re4 r8

    %69
    R4.*4
    r8 r sib16 do
    re mib re mib re mib

    %75
    fa8 r fa
    mib4 sib'8
    la!16 sib do8 sib

    %78
    la sol16 fad sol8
    R4.*2

    %81
    fad,4 sol8~
    sol sol fad
    sol16 la fad8.[sol16]

    %84
    sol4

}

IVvlIn = \relative do'' {

    sib'8
    la r sib
    la r sib
    sol lab16(sol) fa(mib)

    %4
    re8 sib do
    re r r
    do r r

    %7
    mib r r
    re r r
    fa r sol

    %10
    do,16(sib) do(re) do(re)
    mib8 re16 do re8
    do sib16 la sib8

    %13
    mib re16 do re8
    do sib16 la sib8
    do fa, la

    %16
    sib4 r8
    R4.*3
    r8 r re

    %21
    do (fa,16) la sib re
    do8 (fa,16) la sib re
    do16 re mib8 re

    %24
    do4 sib'8
    la r sib
    la r sib

    %27
    sol fa mib
    re sib r
    r r re

    %30
    do do r
    r r mib
    re re r

    %33
    r r re
    mib16(re) mib8 sib
    do16 re mib8 re

    %36
    do sib16 la sib8
    do16 re mib8 re
    do sib16 la sib8

    %39
    mib re do
    fa sol16 la sib8
    do, fa, la

    %42
    sib4 fa'8
    sol16(lab) sol(lab) sol(lab)
    fa(sol) fa(sol) fa(lab)

    %45
    sol(lab) sol(lab) sol(lab)
    fa4 sol8
    fa re mi

    %48
    fa sol16 la sib8
    sib, re16(do) sib(la)
    sib4\fermata fa'8

    %51
    sib la sol
    la16 sib do8 sib
    la sol fa

    %54
    sol do, sol'
    la sib do
    sib do la

    %57
    sib16(do) sib(do) sib(do)
    la(sib) la(sib) la(sib)
    sol(la) sol(la) sol(la)

    %60
    fad8 re sol
    do sib mib,
    re fa lab

    %63
    sol lab fa
    mib4 sol8
    fa sol16(lab) sib8

    %66
    fa sol16(lab) sib8
    fa sol16 fa sol mib
    fa8 sib, sol

    %69
    fa sol16(lab) sib8
    fa sol16(lab) sib8
    fa sol16(fa) sol(mib)

    %72
    fa8 sib, sib'16[(do)]
    re(mib) re(mib) re(mib)
    fa(sol) fa(sol) fa(sol)

    %75
    lab(sib) lab(sib) lab(sib)
    sol8 mib sib'
    la!16 sib do8 sib

    %78
    la sol16 fad sol8
    la,16 sib do8 sib
    la sol16 fad sol8

    %81
    do16 re mib8 re
    do sib la
    sib16(do) la8.[sol16]

    %84
    sol4

}

IVvlIIn = \relative do'' {

    re8
    do r re
    do r re
    sib sib la

    %4
    sib fa la
    sib r r
    la r r

    %7
    do r r
    sib r r
    sib r sib

    %10
    la16 sol la sib la8
    sib4 la8
    sol4 fa8

    %13
    sib4 la8
    sol4 fa8
    sol fa fa

    %16
    fa4 r8
    R4.*3

    %20
    r8 r sib
    la16 do la fa re sib'
    la do la fa re sib'

    %23
    la sib do8 sib
    la4 re8
    do r re

    %26
    do r re
    sib sib la
    sib fa r

    %29
    r r sib
    la la r
    r r do
    sib sib r
    r r fa

    %34
    sol16(fa) sol8 fa
    sol16 la sib8 la
    sol fa16 mib fa8

    %37
    sol16 la sib8 la8
    sol fa16  mib fa8
    do' sib la

    %40
    sib mib re
    sol, fa fa
    fa4 re'8

    %43
    mib16(fa) mib(fa) mib(fa)
    re(mib) re(mib) re(fa)
    mib(fa) mib(fa) mib(fa)

    %46
    re4 re8
    do re sib
    do4 sib8

    %49
    fa fa fa
    fa4\fermata re'8
    sol fa mi

    %52
    fa16 sol la8 sol
    fa mi fa
    fa mi mi

    %55
    fad sol la
    sol la fad
    sol re(mi)

    %58
    fa do(re)
    mib! sib(do)
    re4 re8

    %61
    do re mib
    lab,4 fa'8
    mib fa re

    %64
    sib4 mib8
    re r r
    re r r

    %67
    re mib16 re mib do
    re4 mib,8
    re r r

    %70
    re r r
    re mib16(re) mib(do)
    re4 r8

    %73
    r r sib'16 do
    re(mib) re(mib) re(mib)
    fa sol fa sol fa sol

    %76
    mib4 fa8
    mib16 fa sol8 fa
    mib re16 do re8

    %79
    mib,16 fa sol8 fa
    mib re16(do) re8
    fad4 sol8~

    %82
    sol sol fad
    sol16 la fad8.\tr[sol16]
    sol4

}

IVvlan = \relative do' {

    fa8
    fa r fa
    fa r fa

    %3
    fa fa fa
    fa re fa
    fa r r

    %6
    fa r r
    sol r r
    sol r r

    %9
    fa r sib,
    fa' fa fa
    sib4 la8

    %12
    sol4 fa8
    sib4 la8
    sol4 fa8

    %15
    mib la, do
    re4 r8
    R4.*3

    %20
    r8 r fa
    fa r fa
    fa r fa

    %23
    fa fa fa
    fa4 fa8
    fa r fa

    %26
    fa r fa
    sol sib fa
    fa re r

    %29
    r r fa
    fa fa r
    r r sol

    %32
    sol sol r
    r r sib,
    sib4 re8

    %35
    do sib re
    mib4 sib8
    mib sib re

    %38
    mib4 sib8
    sol'4 la8
    fa mib fa

    %41
    mib la, do
    re4 r8
    r r sib'

    %44
    sib sib r
    r r sib
    sib sib sol

    %47
    la sol sol
    la4 re,8
    re re do

    %50
    re4\fermata r8
    R4.*9

    %60
    r8 r sol
    mib fa sib
    lab4 sib8

    %63
    sib do sib
    sol4 sib8
    sib r r

    %66
    sib r r
    sib sib sib
    sib4 sib,8

    %69
    sib r r
    sib r r
    sib sib sib

    %72
    sib4 r8
    R4.*1
    r8 r sib'

    %75
    sib sib sib
    sib sib sib
    mib,4 fa8

    %78
    la4 re,8
    mib4 fa8
    do4 sol8

    %81
    do4 sol8
    mib' re do
    re re4

    %84
    sib

}

IVbcn = \relative do {

    sib8
    fa' r sib,
    fa' r sib,
    mib mib fa

    %4
    sib sib, fa'
    sib r r
    fa r r

    %7
    do' r r
    sol r r
    re r mib

    %10
    fa fa, fa'
    sol4 fa8
    mib4 re8

    %13
    sol4 fa8
    mib4 re8
    mib fa fa,

    %16
    sib4 sib8
    fa' r sib,
    fa' r sib,

    %19
    mib mib fa
    sib,4 sib'8
    fa r sib,

    %22
    fa' r sib,
    fa' la, sib
    fa4 sib8

    %25
    fa' r sib,
    fa' r sib,
    mib mib fa

    %28
    sib sib, r
    r r sib
    fa' fa r

    %31
    r r do
    sol' sol r
    r r sib

    %34
    mib,4 re8
    mib16 fa sol8 fa
    mib re16 do re8

    %37
    mib16 fa sol8 fa
    mib re16  do re8
    do4 fa8

    %40
    re do sib
    mib fa fa,
    sib4 r8

    %43
    r r mib
    sib' sib, r
    r r mib

    %46
    sib' sib, sib'
    la sib sol
    fa4 sol8

    %49
    fa mib fa
    sib,4\fermata r8
    R4.*9

    %60
    r8 r sib'
    lab4 sol8
    fa4 re'8

    %63
    mib lab, sib
    mib, sol mib
    sib' r r

    %66
    sib r r
    sib mib mib,
    sib'4 mib,8

    %69
    sib r r
    sib r r
    sib mib mib,

    %72
    sib'4.~
    sib~
    sib4 sib'8

    %75
    re, re re
    mib mib' re
    do16 re mib8 re

    %78
    do sib16 la sib8
    do,16 re mib8 re
    do sib16 la sib8

    %81
    la4 sib8
    do re mib
    re re,4

    %84
    sol

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}



forma = {

    \time 3/8
    \key sib\major
    \tempo 4. = 60
    \partial 8 s8
    s4.*83
    s4
    \override Score.RehearsalMark #'self-alignment-X = #center
    \bar "||"
    \mark"D.C."

}

IVobI = {
    \IVglobal
    \notypeset
    <<\IVobIn \forma>>

}


IVobII = {
    \IVglobal
    <<\IVobIIn \forma>>
}


IVvlI = {
    \IVglobal
    <<\IVvlIn \forma>>
}


IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>
}


IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>
}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset
}

Vglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}

VobIn = \relative do'' {

    r8 fa, re'16.[(mib32) do8_] sib[fa] mib'16.(re32) fa8
    re-+ do16. fa32 fa,16.[(sol32) la16. (sib32)] do8[re] mib16.(do32) re8
    do fa16.(sol32) fa16.[(sol32) fa8] r8 fa16.(sol32) fa8[lab,]

    %4
    sol sol'16.(la32) sol16.[(la32) sol8] r8 sol16. (la32) sol8[sib,]  %%%%% fin qui
    la[mib'] re16.(mib32) do8 fa sib, do16.[(sol32) la8]
    sib[mib] re16.(mib32) do8 fa[sib] mib,16.(re32) do8

    %7
    sib fa re'16.[(mib32) do8] sib fa mib'16.[(re32) fa8]
    re-+ do16. fa32 fa,16.[(sol32) la16.(sib32)] do8[re] mib16.(do32) re8
    do-+ r r4 r2

    %10
    r8 fa, re'16.[(mib32) do8_] sib[fa] mib'16.(re32) fa8
    re-+ do16. fa32 fa,16.[(sol32) la16. (sib32)] do8[re] mib16.(do32) re8
    do4 r8 fa, sib16.[(do32) sib8~] sib16.[(do32) sib8~]

    %13
    sib16. do32 re16.(mib32) fa8 lab, sol16.[(fa32) mib8] r sol
    do16.[(re32) do8~] do16.[(re32) do8~] do16. (re32) mi16.(fa32) sol8[sib,]
    la mib' re16.[(mib32) do8] re16.(sib32) do8 r mib8

    %16
    re16.(mib32) do8 fa[mib] re16.(sib32) do8 r fa
    sol4~sol16. sib32 la16.(sol32) fa4~fa16.(lab32) sol16.(fa32)
    mib4~mib16. sol32 fa16.(mib32) mib16. (re32) mib8 r do

    %19
    la'16.[(sib32) sol8] fa sol fa16.[(sol32) mi8] fa sol
    lab4. sol16 fa sol8[fa] re-+ do16(sib)
    sib4 r r2

    %22
    R1*4
    r2 r8\fermata  re si16.(do32) re8

    %27
    mib do la16.[(sib32) do8] re[sib16(do)] re(mib) fa(sol)
    lab8 sol lab16[(sol) fa8] sol16.(fa32) mib8 r sol
    si,16(do32 si la16) si do(re32 do si16) do re(mib32 re do16) re mib(fa32 mib re16) mib

    %30
    fa8 mib16 re mib8. fa16 re8.-+[sol,16] la si do re
    mib8 re si8.[do16] do8 re16.(mib32) fa16[(re) mib8]
    re4 r8 re mib16(sol32 fad sol16) mib re16.(do32) re16.(sib32)

    %33
    do16 (mib32 re mib16.) re32 do16.(sib32) do16.(la32) sib16 (sol32 fad sol16.) sib32 do16 (sol32 fad sol16.) do32
    re16 (sol,32 fad sol16.) re'32 mib16.(re32) mib16.(do32) fad8 sol r16 fad sol la
    re,8 [do] la8. sol16 sol4 r

}


VobIIn = \relative do'' {

    r8 fa, re'16.[(mib32) do8_] sib[fa] mib'16.(re32) fa8
    re-+ do16. fa32 fa,16.[(sol32) la16. (sib32)] do8[re] mib16.(do32) re8
    do4 r8 fa16.(sol32) fa16.[(sol32) fa8] r8 lab,

    %4
    sol4 r8 sol'16.(la32) sol16.[(la32) sol8] r8 sib,
    la[mib'] re16.(mib32) do8 fa sib, do16.[sol32 la8]
    sib[mib] re16.(mib32) do8 fa[sib] mib,16.(re32) do8

    %7
    sib4 r r2
    R1*13

    %21
    r8 fa' sol16.[(lab32) fa8] mib8 sol, do16.[(re32) sib8]
    la do fa16.[(sol32) mib8] re[fa,] sib16. (do32) lab8
    sol[re'] mib16.(fa32) re8 do16.(re32) sib8 la16.[(sib32) sol8]

    %24
    fa8[sib] do16.(sol32) la8 sib[re] mib16.(fa32) re8
    sol16. (lab32) fa8 mib16.[(fa32) re8] do16. (re32) sib8 la16.[(sib32) sol8]
    fa [mib'] re16.(mib32) do8 sib4\fermata r8 si

    %27
    do16.(re32) mib8 r la, sib16(do) re8 sib16(do) re(mib)
    fa8[mib] fa16(mib) re8 mib sol,16.(fa32) mib4
    r4 r8 sol' si,16(do32 si la16) si do(re32 do si16) do

    %30
    re8 do16 si do8.[re16] si16 sol la si do re mib fa
    sol8 fa re8.[do16] do4~do16 sib? do la
    sib8 re16.(do32) sib4 r2

    %33
    R1
    r2 r4 r16 do sib la
    sib8[la] fad8. sol16 sol4 r

}

VvlIn = \relative do'' {

    r8 fa, re'16.[(mib32) do8_] sib[fa] mib'16.(re32) fa8
    re-+ do16. fa32 fa,16.[(sol32) la16. (sib32)] do8[re] mib16.(do32) re8
    do4 r8 fa16.(sol32) fa16.[(sol32) fa8] r8 lab,

    %4
    sol4 r8 sol'16.(la32) sol16.[(la32) sol8] r8 sib,
    la[mib'] re16.(mib32) do8 fa sib, do16.[(sol32) la8]
    sib[mib] re16.(mib32) do8 fa[sib] mib,16.(re32) do8

    %7
    sib r re\upl\dolce do\upl sib r mib\upl fa\upl
    re [do] fa r fa r mib re
    do8.-+ sol'16 fa16.[(sol32) mi8] fa16.(mi32) sol8 fa16.[(sol32) mi8]

    %10
    fa r re do sib r mib fa
    re [do] fa r fa r mib re
    do do la [do] sib r sib r

    %13
    sib sib sib sib sib4 sib8 sib
    do r do r do do do do
    do mib re [do] re do mib [do]

    %16
    re do fa [mib] re do fa4~
    fa8 mib mib4~mib8 re re4~
    re8[do] do sib la4 r8 la

    %19
    do16.(re32) sib8 la[sib] la16.[(sib32) sol8] la mib
    re re re re mib re16 mib fa8[fa]
    sib, fa''\f sol16.[(lab32) fa8] mib[sol,] do16.(re32) sib8

    %22
    la do fa16.[(sol32) mib8] re[fa,] sib16. (do32) lab8
    sol[re'] mib16.(fa32) re8 do16.(re32) sib8 la16.[(sib32) sol8]
    fa8[sib] do16.(sol32) la8 sib[re] mib16.(fa32) re8

    %25
    sol16. (lab32) fa8 mib16.[(fa32) re8] do16. (re32) sib8 la16.[(sib32) sol8]
    fa [mib'] re16.(mib32) do8 sib4\fermata r
    R1*5

    %32
    r4 r8 re\dolce mib[mib,] re' re,
    do' do, la'[fad] sib r do r
    re r mib r re4 r

    %35
    R1

}


VvlIIn = \relative do'' {

    r8 re, fa la fa[re] sib' do
    sib la r fa fa sib do [sib]
    la4 r8 la sib4 r8 fa

    %4
    mib4 r8 sib' do4 r8 sol
    fa mib' re16.[(mib32) do8] fa sib, do16.[(sol32) la8]
    sib sib la[sol] sib[sib] do16.(sib32) la8

    %7
    sib r sib\dolce la fa r sib do
    sib[la] do r do r do sib
    la8._+[sib16] la16.(sib32) sol8 la16.(sol32) sib8 la16.[(sib32) sol8]

    %10
    la r sib la fa r sib do
    sib[la] do r do r do sib
    la la do [la] fa r fa r

    %13
    fa fa fa fa sol4  sol8 sol
    sol r sol r sol sol sol sol
    la do sib [la] sib la do [la]


    %16
    sib[la] re do sib la r re,
    mib4 r8 do re4 r8 sib
    do4 r8 do do'4 r8 fa,

    %19
    fa2~fa4 fa8 mib
    re fa fa fa mib[re16 mib] fa8 fa
    sib, re'\f sib[si] sol sol fa mi

    %22
    fa sib do[la] fa fa mib [re]
    mib sib' mib16.[(fa32) re8] do16.(re32) sib8 la16.[(sib32) sol8]
    fa sib do16.[(sol32) la8] sib sib sib sib

    %25
    sib[re] mib16.(fa32) re8 do16.(re32) sib8 la16.[(sib32) sol8]
    fa sib sib [la] fa4\fermata r
    R1*5

    %32
    r4 r8 sib\dolce do[do,] sib' sib,
    la' la, fad'[re] sol, r la r
    sib r do r do' sib r4

    %35
    R1

}


Vvlan = \relative do' {

    r8 sib sib do re fa sol [fa]
    fa fa r do fa fa fa [fa]
    fa4 r8 do sib4 r8 sib

    %4
    sib4 r8 mib do4 r8 do
    do sib' la [sol] sib fa sol [fa]
    re mib fa [sol] fa fa la [fa]

    %7
    fa r sib fa re r sol la
    sib[fa] la r la r la sib
    fa fa fa fa fa fa fa fa

    %10
    fa r sib fa re r sol la
    sib [fa] la r la r la sib
    fa fa mib16.[(re32) mib8] re r re r

    %13
    re re re re  mib4 sol8 fa
    mi r mi r mi mi mi mi
    fa fa fa [fa] fa fa fa [fa]

    %16
    fa fa fa [fa] fa fa r re
    mib4 r8 do re4 r8 sib
    do4 r8 do fa4 r8 fa

    %19
    fa2~fa4 fa8 mib
    re re re re mib[re16 mib] fa8 fa
    sib, sib' sol sol sol re fa sib,

    %22
    do sib la [do] sib re sib [sib]
    sib fa' sol [sib] fa mi fa [sib,]
    sib fa' sol [fa] re re sib'[sib]

    %25
    sib si do[fa,] fa mi fa[sib,]
    sib sol' fa16.[(sol32) mib8] re4 \fermata r
    R1*5

    %32
    r4 r8 sib' do[do,] sib' sib,
    la' la, fad'[re] sol, r la r
    sib r do r do' sib r4

    %35
    R1

}

Vbcn = \relative do {

    r8 sib sib' fa re[sib] sol' la
    sib fa r8 fa16.(sol32) la8 sib la [sib]
    fa4 r8 mib re4 r8 re

    %4
    mib4 r8 mib\mbreak mi4 r8 mi
    fa sol fa [mib!] re re mib fa
    sol sol fa mib re[sib] fa' fa,

    %7
    sib4 r r2
    R1*13

    %21
    r8 sib' mib re do sib la sol\mbreak
    fa sol la fa sib lab sol fa
    mib re do[sib'] la sol fa [mib]

    %24
    re re mib fa sol sib sol fa
    mib' re do sib la sol fa mib\mbreak
    re mib fa [fa,] sib4\fermata r8 sol'

    %27
    do,4 r8 fa sib,4 r8 sib'
    re, mib lab,[sib] mib4 r8 mib
    re sol mib[do] sol' sol, r do'

    %30
    si sol do[do,] sol'4 r8 fa
    mib fa sol [sol,] do sib la[fa]
    sib sib'16. la32 sol4 r2

    %33
    R1
    r2 r4 la8 sol16 fad
    sol8 do, re[re,] sol4 r

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 53
    s1*35
    \override Score.RehearsalMark #'self-alignment-X = #center
    \bar "||"
    \mark"D.C."

}

VobI = {
    \Vglobal
    \notypeset
    <<\VobIn \forma>>

}


VobII = {
    \Vglobal
    <<\VobIIn \forma>>
}


VvlI = {
    \Vglobal
    <<\VvlIn \forma>>
}


VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>
}


Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>
}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}

VIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}


VIobIn = \relative do'' {

    fa4 sib
    la sib8 la sol sib la sol
    fa2 sib8 la sol fa
    sol fa mib re do4 fa

    %4
    re sib fa'2~\mbreak
    fa1~
    fa2 fa8 sol la sib
    do4 sib la sib8 sol
    la4 fa fa sol8 fa

    %9
    sol4 lab8 sol fa sol mib fa
    sol4 fa8 mib re4 mib8 re
    mib4 fa8 mib\mbreak re mib do re

    %12
    mib4 do do'8 sib la sol
    fa4 la sib re,
    mib sol2 fa8 mib

    %15
    re4 la' sib sib,
    do mib2 re8 mib
    fa4 la sib re,

    %18
    mib sol fa mib\mbreak
    re2 do
    sib fa'4 sol8 fa

    %21
    sol4 lab8 sol fa sol mib fa
    sol4 fa8 mib re4 mib8 re
    mib4 fa8 mib re mib do re

    %24
    mib4 do do'8 sib la sol\mbreak
    fa4 la sib re,
    mib4 sol2 fa8 mib

    %27
    re4 la' sib sib,
    do mib2 re8  mib
    fa4 la sib re,

    %30
    mib4 sol fa mib
    re2 do-+
    sib\fermata r\mbreak

    %33
    R1
    r2 la4 sib
    do do do sib8 (la)

    %36
    la4 sol r2
    r4 sol la8 sol la fa
    sol2 r

    %39
    r4 mi fa8 sol la fa
    sol4 mi\mbreak fa8 sol la sib
    do4 sib8 la sol4. fa8

    %42
    fa2 r
    R1*4

    %47
    r4 re' mib do
    sib2 r4 re\mbreak
    mib do sib2

    %50
    r4 re mib lab
    sol fa8 mib fa4 mib8 re
    mib2 sib4 do8 re

    %53
    mib fa mib re do re do sib
    sib4-+ la r2\mbreak
    r4 la sib8 la sib sol

    %56
    la2 r
    r4 fad sol8 la sib sol
    la4 fad sol8 la sib do

    %59
    re4 do8 sib la4. sol8
    sol2 r
    R1*3

    %64
    r2

}


VIobIIn = \relative do'' {

    sib4 re
    do re8 do sib re do sib
    la2 sib4 sib
    sib sib sib la

    %4
    sib fa re' mib8 re
    do mib re do\mbreak re fa mib re
    do2 do4 fa

    %7
    fa fa fa mi
    fa do re mib8 re
    mib4 fa8 mib re mib do re

    %10
    mib4 re8 do si do la si\mbreak
    do4 re8 do si do la si
    do4 sol mib' do

    %13
    re mib fa sib,
    sol la8 sib do4 la
    sib8 do re mib fa4 lab,

    %16
    sol sib la! sib8 do\mbreak
    re4 mib fa sib,~
    sib sib sib sib

    %19
    sib2 la
    sib re4 mib8 re
    mib4 fa8 mib re mib do re

    %22
    mib4 re8 do si4 do8 si\mbreak
    do4 re8 do si do la si
    do4 sol mib' do

    %25
    re mib fa sib,
    sol la8 sib do4 la
    sib8 do re mib fa4 lab,

    %28
    sol sib la! sib8 do\mbreak
    re4 mib fa sib,~
    sib sib sib sib

    %31
    sib2 la
    fa\fermata r
    R1

    %34
    r2 fa4 sol
    la la la sol8 (fa)
    fa4 mi r2\mbreak

    %37
    r4 mi fa8 mi fa re
    mi2 r
    r4 mi fa8 sol la fa

    %40
    sol4 mi fa8 sol la sib
    do4 sib8 la sol4. fa8
    fa2 r

    %43
    R1*4
    r4 fa sol mib

    %48
    re2 r4 fa
    sol mib re2\mbreak
    r4 fa sol do

    %51
    sib2 lab
    sol sol4 la!8 sib
    do re do sib la sib la sol
    sol4_+ fad r2

    %55
    r4 fad sol8 fad sol mi\mbreak
    fad2 r
    r4 fad sol8 la sib sol

    %58
    sol4 fad sol8 la sib do
    re4 do8 sib la4. sol8
    sol2 r

    %61
    R1*3
    r2

}

VIvlIn = \relative do'' {

    fa4 sib
    la sib8 la sol sib la sol
    fa2 sib8 la sol fa
    sol fa mib re do4 fa

    %4
    re sib sib, do8 sib\mbreak
    la do sib la sib re do sib
    la2 fa''8 sol la sib

    %7
    do4 sib la sib8 sol
    la4 fa sib2~
    sib sib,,~

    %10
    sib sol''~
    sol sol,,~
    sol do''8 sib la sol\mbreak

    %13
    fa4 la sib re,
    mib sol2 fa8 mib
    re4 la' sib do,

    %16
    do mib2 re8 mib
    fa4 la sib re,
    mib sol fa mib

    %19
    re2 do
    sib sib'~
    sib sib,,~

    %22
    sib sol''~\mbreak
    sol sol,,~
    sol do''8 sib la sol

    %25
    fa4 la sib re,
    mib4 sol2 fa8 mib
    re4 la' sib re,

    %28
    do mib2 re8 mib
    fa4 la sib re,
    mib sol fa mib

    %31
    re2 do
    sib\fermata fa'4 fa\mbreak
    sib sib sib sib

    %34
    sib-+ la r2
    R1
    r2 la8 sol la fa

    %37
    sol2 r
    r4 sol la8 sol la fa
    sol4 mi fa8 sol la fa

    %40
    sol4 do, fa8 sol la sib
    do4 sib8 la sol4. fa8\mbreak
    fa2 fa4 lab8(sol)
    lab (sib, la sib) lab' (sib, la sib)
    sol' (sib, la sib) sol' (sib, la sib)

    %45
    lab' (sib, la sib) lab' (sib, la sib)\mbreak
    sol'4 fa8 sol lab(sol) fa(mib)
    fa4 re mib do

    %48
    sib8 do re mib fa4 re
    mib do sib8 do re mib
    fa4 re mib lab

    %51
    sol fa8 mib fa4 mib8 re
    mib2 r
    R1

    %54
    r2 sib'8 la sib sol
    la2 r
    r4 la sib8la sib sol

    %57
    la4 fad sol8 la sib sol
    la4 re, sol8 la sib do
    re4 do8 sib la4. sol8\mbreak

    %60
    sol4.(fa8) mib4.(re8)
    do4.(sib8) la4.(sol8)
    re2 r4 fad'

    %63
    sol sib, do, re'
    sol,,2

}


VIvlIIn = \relative do'' {

    sib4 re
    do re8 do sib re do sib
    la2 sib4 sib
    sib sib sib la

    %4
    sib fa sib, do8 sib\mbreak
    la do sib la sib re do sib
    la2 do'4 fa

    %7
    fa fa fa mi
    fa do sib'2~
    sib sib,,~

    %10
    sib sol''~
    sol sol,,~
    sol\mbreak mib''4 do

    %13
    re mib fa sib,
    sol la8 sib do4 la
    sib8 do re mib fa4 lab,

    %16
    sol sib la! sib8 do
    re4 mib fa sib,~
    sib sib sib sib\mbreak

    %19
    sib2 la
    fa sib'~
    sib sib,,~

    %22
    sib sol''~\mbreak
    sol sol,,~
    sol mib''4 do

    %25
    re  mib fa sib,
    sol la8 sib do4 la\mbreak
    sib8 do re mib fa4 lab,

    %28
    sol sib la! sib8 do
    re4 mib fa sib,~
    sib sib sib sib

    %31
    sib2 la
    fa\fermata sib4 do
    re re re re\mbreak

    %34
    re-+ do r2
    R1
    r2 fa8 mi fa re

    %37
    mi2 r
    r4 mi fa8 mi fa re
    mi4 do do do

    %40
    do do do mi\mbreak
    fa fa mi4. do8
    do2 sib4 r
    sib r sib r
    sib r\mbreak sib r

    %45
    sib r sib r
    sib sib fa' sib,
    do fa, sol mib

    %48
    re2 r4 fa
    sol mib re2
    r4 fa sol do

    %51
    sib2 lab\mbreak
    sol r
    R1

    %54
    r2 sol'8 fad sol mi
    fad2 r
    r4 fad sol8 fad sol mi

    %57
    fad4 re re re
    re re re fad\mbreak
    sol sol fad4. sol8

    %60
    sol4.(fa8) mib4.(re8)
    do4.(sib8) la4.(sol8)
    re2 r4 fad'

    %63
    sol sib, do, re'
    sol,,2

}


VIvlan = \relative do' {

    sib4 fa'
    fa fa sol do,
    do2 fa4 re
    mib mib fa fa

    %4
    fa re r2
    R1
    r2 la'4 fa

    %7
    fa re do do'
    do la\mbreak sib r
    mib,4 r r2

    %10
    r sol
    do, r
    r sol'4 la

    %13
    sib do sib fa
    mib re do fa
    fa do' sib re,

    %16
    mib sib' do do
    sib do fa, fa
    sol sol sib sol

    %19
    fa2 fa\mbreak
    re sib'
    mib, r

    %22
    r sol
    do, r
    r sol'4 la

    %25
    sib do sib fa
    mib re do fa
    fa do' sib re,

    %28
    mib sib' do do
    sib do fa, fa
    sol sol sib sol

    %31
    fa2 fa
    re\fermata sib'4 la
    sib sib fa fa

    %34
    fa fa r2
    R1
    r2 do'4 do

    %37
    do2 r
    r4 do do do
    do sol la fa

    %40
    mi sol fa sol
    do, re sol sol\mbreak
    la2 fa4 r
    fa r fa r
    mib r mib r

    %45
    fa r fa r
    mib mib fa sol
    fa sib, sib do

    %48
    fa2 r4 sib,\mbreak
    sib do fa2
    r4 sib, sib mib

    %51
    mib2 re
    sib r
    R1

    %54
    r2 re'
    re r
    r4 re re re

    %57
    re la sib sol\mbreak
    fad la sol la
    re, mib la, re

    %60
    sib4.(re8) mib4.(re8)
    do4.(sib8) la4.(sol8)
    la2 r4 re

    %63
    sib la8 sol la4 sol8 fad
    sol2

}

VIbcn = \relative do {

    re4 sib
    fa' re mib mi
    fa fa, re' sib
    mib do fa fa,

    %4
    sib2 sib4 r\mbreak
    fa' r sib, r
    fa r fa' re

    %7
    la sib do do,
    fa2 r
    r sib

    %10
    mib, r
    r sol
    do, do'4 fa\mbreak

    %13
    re do re sib
    do sib la fa
    sib do re sib

    %16
    mib sol fa mib
    re do re sib
    sol' mib re mib

    %19
    fa mib fa fa,
    sib2 r\mbreak
    r sib

    %22
    mib, r
    r sol
    do, do'4 fa

    %25
    re do re sib
    do sib la sol
    sib do re sib

    %28
    mib sol fa mib\mbreak
    re do re sib
    sol' mib re mib

    %31
    fa2 fa,
    sib2\fermata re4 do
    sib do re sib

    %34
    fa' fa, fa' sib
    fa sol la sib
    do do,\mbreak fa2

    %37
    do fa,
    do' fa
    do4 do' fa, fa,

    %40
    do' do' la sol
    fa sib\mbreak do do,
    fa,2 re'4 r
    re r re r

    %44
    mib r mib r
    re r re r
    mib mib' re mib

    %47
    lab,sib sol lab
    sib2 r4 lab\mbreak
    sol lab sib2

    %50
    r4 lab sol lab
    sib2 sib,
    mib mib4 re

    %53
    do re mib do
    re re, sol'2
    re sol,

    %56
    re' sol\mbreak
    re4 re' sol, sol,
    re' re' sib la

    %59
    sol do re re,
    sol8 la sol fa mib fa mib re
    do re do sib la sib la sol

    %62
    fad2 r4 re'\mbreak
    mib sib do re
    sol,2

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}



forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 90
    \partial 2 s2
    s1*31
    s2 \bar ".|:"\break
    s2
    s1*9
    s2\bar ":|."\break
    s2
    s1*21
    s2
    \override Score.RehearsalMark #'self-alignment-X = #center
    \bar "||"
    \mark"D.C."

}

VIobI = {
    \VIglobal
    %\notypeset
    <<\VIobIn \forma>>

}

VIobII = {
    \VIglobal
    <<\VIobIIn \forma>>
}

VIvlI = {
    \VIglobal
    <<\VIvlIn \forma>>
}

VIvlII = {
    \VIglobal
    <<\VIvlIIn \forma>>
}

VIvla = {
    \VIglobal
    \clef alto
    <<\VIvlan \forma>>
}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset
}

#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller {"Ouverture ”La Bourse” dall'autografo [TWV 55:B11]"}
    subsubtitle = \markup\small#(string-append "  ")
    composer = \markup \center-column{"G. Ph. Telemann (1681-1767)"}
}

\markup\huge "[1.] Ouverture"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }<<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName =  \markup \center-column{"Hautb[ois] 1."}
                \set Staff.midiInstrument = #"oboe"
                \IobI
            >>

            \new Staff <<
                \set Staff.instrumentName =  \markup \center-column{"[Hautbois] 2."}
                \set Staff.midiInstrument = #"oboe"
                \IobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Viol[ino 1.]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Viol[ino 2.]"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>
        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Basson""[Basso continuo]"}
            \Ibc

        >>
    >>

    \layout {

        indent = 2.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[2.] Le repos interrompu"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }<<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>
        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"bassoon"
            \IIbc

        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[3.] La guerre en la paix"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }<<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIIobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>
        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"bassoon"
            \IIIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[4.] Les Vainqueurs vaincus"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }<<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IVobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IVobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IVvla
        >>
        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"bassoon"
            \IVbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[5.] La Solitude associée"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }<<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \VobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \VobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \Vvla
        >>
        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"bassoon"
            \Vbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[6.] L'Espérance de Mississippi"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }<<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \VIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \VIobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \VIvla
        >>
        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"bassoon"
            \VIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
