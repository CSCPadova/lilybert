\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

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

tasto = _\markup\italic"Tasto solo"

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

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


Iglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f

}

Ivln =  \relative do'' {

    sib4~sib16 do re mib fa4~fa16 fa sol la
    sib8 fa sol sol fa[sol16 fa mib sol fa mib]
    re4 sib2 la4

    %4
    re2 r
    fa,4\parentSlur (fa16) sol la sib do4~do16 do re mi?\mbreak
    fa8 do re re do[re16 do sib re do sib]

    %7
    la4 fa2 mi4
    la2 r8 fa' sol sol
    fa[sol16 fa mib sol fa mib] re8 sib do do

    %10
    sib[do16 sib la do sib la] sol4 fa
    sib4~sib16 do re mib?\mbreak fa4~fa16 fa sol la
    sib8 sib, re[re] do[re16 do sib re do sib]

    %13
    la4 r8 fa8.[sol16 la sib] do4~
    do16 do re mi fa8 fa, la[la sol fa16 sol]
    fa la sol fa mi4 r8 do' re re

    %16
    do[re16 do sib re do sib]\mbreak la8 fa' sol sol
    fa[sol16 fa mi sol fa mi] re8 sib do do
    sib[do16 sib la do sib la] sol8 fa4 mi8

    %19
    fa\noBeam sib8. do16 re mib fa4~fa16 fa sol la
    sib8 fa sol sol fa[sol16 fa mib sol fa mib]\mbreak
    re8 sib do do sib[do16 sib la do sib la]

    %22
    sol8 mib' fa fa mib[fa16 mib re fa mib re]
    do4 r8 sib8. [do16 re mi?] fa4~
    fa16 fa sol la sib8 sib, re[re do re16 do]

    %25
    sib re do sib la4\mbreak r8 sib8. [do16 re mib?]
    fa4~fa16 fa sol la sib8 fa sol sol
    fa[sol16 fa mib sol fa mib] re fa mib re do4

    %28
    sib16 do re mib? fa4~fa16 fa sol la sib8 sib,
    do do sib4~sib8[do16 sib la do sib la]\mbreak
    sib do re mib? fa4~fa16 fa sol la sib8 sib,

    %31
    do do sib4. do16[sib la do sib la]
    sib1
    r4 re2 fa8. sib,16  %%% 4/4 lento

    %34
    do2~do4 re8. la16
    sib2. do8. sol16
    la2. sol8. re16\mbreak

    %37
    mi8 do' sol'2 la8. mi16
    fa2. sol8. re16
    mi4 fa sol8. sol,16 la4

    %40
    sib do2 sib4~
    sib la2 lab4
    sol2 fa

    %43 OOKK 3/2
    do'2 re mib
    fa sib,4 do re2
    mib do fa

    %46
    re2. do4 sib2
    fa' sol lab
    sib mib,4 fa sol2

    %49
    lab fa sib
    sol2. fa4 mib2
    sol, la sib\mbreak

    %52
    do1.
    la2 sib do
    re1.~

    %55
    re2 do sib
    mib1 re2~
    re do sib

    %58
    la re do
    sib mib4 re do re
    sib2 la1

    %61
    sol2 sib4 do re mib\mbreak
    fa2 sib,2. sib4
    mib2 la,2. la4

    %64
    re2 sol2. sol4
    re2 sol4 fa mib re
    do2 fa4 mib re do

    %67
    sib2 mib4 re do sib
    la2 re4 do sib la
    sol2 sib'4 la sol fa\mbreak

    %70
    mib re do2. sib4
    sib2 re4 do sib la
    sol2 sib'4 la sol fa

    %73
    mib re do2. sib4
    sib1. %%% OOKK
    r8 re do sib la2 %%% 4/4 lento

    %76
    r8 sib la sol fad re re'4~
    re8 sol, do4. fa,8 fa'4~\mbreak
    fa8 sib, sib'2 la4

    %79
    sol mib2 re4
    do2 sib
    la sol

    %82
    fa8 fa' re sib mib4 re8 sib
    la fa sib[sib'] sol mib sib'[re,]
    do re mib2 re4~

    %85
    re(reb) do2
    sib4 r8 re? do re mib4~
    mib re2 (reb4)

    %88
    do2 sib  %%% OOKK
    fa2 sib4 do %%% 4/4 andante
    re8 sib fa'4 sol16 fa mib re do8 fa

    %91
    re fa sib,16 re do sib la8 fa sib16 do re mi?
    fa4 mi fa sol
    la fa, sib do

    %94
    re8 sib fa'4\mbreak sol16 fa mib re do8 fa
    re sib' la16 sol fa mib? re8 fa mib16 re do sib
    la8 re r fa, sib4 do

    %97
    re8 sib fa'4 sol16 fa mib re do8 fa
    re sib fa'4 re16 do sib la sol8 do\mbreak
    la re, la'4 r do

    %100
    fa sol la8 la, do4
    re16 do sib la sol8 do la re fa16 mib? re do
    sib8 sol do16 sib la sol fa4 r8 sib

    %103
    fa'4 sol la8 la, do4\mbreak
    re16 do sib la sol8 do la2
    fa sib4 do

    %106
    re8 fa, sib4 re16 do sib la sol8 do
    la do fa4 sol la8 do,
    fa4 sol16 fa mib re do8 fa re16 do sib la

    %109
    sol8 do la4\mbreak fa sib
    do re sib fa'
    re16 do sib la sol8 sol'16 fa mib re do8 fa16 mib re do

    %112
    sib8 sib'16 la sol fa mib8 do16 sib la sol fa8 sib~
    sib4 la r fa
    sib do\mbreak re8 sib fa'4

    %115
    sol16 fa mib re do8 fa re16 do sib la sol8 do
    fa,4 r8 fa sib4 do
    re8 sib fa'4 sol la~

    %118
    la8 fa sib2 la4
    sib8 sib, fa'4 sol la\mbreak
    la8 fa sib2 la4

    %121 OOOKK inizio 9/8
    sib8 la sol fa4 sol8 mib4 fa8
    re2. mib?4.
    fa8 mib re do4 re8 sib4 do8

    %124
    la2. sib4.
    do8 sib la sol4 la8\mbreak fa4 sol8
    mi?2. fa4.

    %127
    do'8 sib la sol4 la8 sol4 fa8
    fa1*9/8
    R1*9/8

    %130
    fa8 sol la sib4 sol8 do4 la8\mbreak
    re4. sol, la
    sib8 do re mib4 do8 fa4 re8

    %133
    sol2. r4 r8
    sib lab? sol fa4 sol8 mib4 fa8
    re4. sib8 do re mib4.\mbreak

    %136
    do8 re mib fa4. re8 mib fa
    sol fa mib re4 mib8 do4 sib8
    sib4. sib8 do re mib4.

    %139
    do8 re mib fa4. re8 mib fa
    sol fa mib re4 mib8 do4 sib8\mbreak
    sib fa' mib re4 mib8 do4 sib8

    %142
    sib fa' mib re4 mib8 do4 sib8
    sib1*9/8\fermata

}

Ivcn = \relative do {

    R1*2
    sib4~sib16 do re mib? fa4~fa16 fa sol la
    sib8 fa sol sol fa[sol16 fa mib sol fa mib]

    %5
    re4 fa~fa mi?\mbreak
    la sib la sol
    fa,~fa16 sol la sib do4~do16 do re mi

    %8
    fa8 do re re do[re16 do sib re do sib]
    la8 fa' sol sol fa[sol16 fa mib? sol fa mib]
    re8 sib' do do sib[do16 sib la do sib la]

    %11
    sol2\mbreak fa4 sib,~
    sib16 do re mib fa4~fa16 fa sol la sib8 sib,
    re[re do re16 do] sib re do sib la4

    %14
    fa~fa16 sol la sib do4~do16 do re mi
    fa8 fa, la la sol[la16 sol fa la sol fa]
    \once\stemUp mi8 do'' re re\mbreak do[re16 do sib re do sib]

    %17
    la8 fa sol sol fa[sol16 fa mib sol fa mib]
    re8 sib' do do sib fa sol sol
    fa[sol16 fa mib sol fa mib] re8 la sib sib

    %20
    sol re' mib mib re sib' do do\mbreak
    sib[do16 sib la do sib la] sol8 mib fa fa
    mib[fa16 mib re fa mib re] do8 sib8. do16 re mib

    %23
    fa4~fa16 fa sol la sib4. re8
    la[la sol la16 sol] fa4. sib,8~
    sib16 do re mib? fa4~\mbreak fa16 fa sol la sib8 sib,~

    %26
    sib16 do re mib? fa8. fa16 sol8 la sib sib,
    re[re do re16 do] sib re do sib fa'4
    sib,~sib16 do re mib? fa8.[fa16 sol la] sib8

    %29
    r fa sol sol fa2\mbreak
    sib,4\parentSlur (sib16) do re mib? fa8. [fa16 sol la] sib8
    r fa sol sol fa2

    %32
    sib,1
    r2 sib'
    \parentSlur (sib) la4 fa~

    %35
    fa sol8. re16 mi2
    fa4 re8. la16 sib4 si\mbreak
    do4. sol'8 do2~

    %38
    do4 re8. la16 sib2\parentSlur (
    sib4) la8. re,16 mi4 fa
    sol8. sol,16 la4 sib sol'8. re16

    %41
    <<mi4\\{do8.[sol16]}>> la4 sib si
    do2 fa, %%\pageBreak
    fa'1 mib2 %%% OOKK 3/2

    %44
    re sol fa
    mib fa \parenthesize fa,
    sib2. fa'4 sol la

    %47
    sib1 lab2
    sol lab sol
    fa sib sib,

    %50
    \clef tenor \key fa\major mib?2. sib'4 do re
    mib1 re2\mbreak
    do re mib

    %53
    \clef bass \key fa\major fa, sol la
    sib, do re
    mib1 re2~

    %56
    re do sib
    mib1 mi2
    fa1 fad2

    %59
    sol do,1
    re2 re,1
    sol2 sol'2. sol4\mbreak

    %62
    re2 sol4 fa mib re
    do2 fa4 mib re do
    sib2 mib4 fa sol la

    %65
    sib2 mib,2. mib4
    la!2 re,2. re4
    sol2 do4 sib la sol

    %68
    fa2 sib4 la sol fa
    mib2 sol4 fa mib re\mbreak
    do sib fa'2 fa,

    %71
    sib sib'4 la sol fa
    mib2 sol4 fa mib re
    do sib fa'2 fa,

    %74
    sib1.
    r8 sib' la sol fad2  %%% 4/4 lento
    r8 sol fad? mib re4. sib8

    %77
    mib4. do8 fa4. fa,8\mbreak
    sib4. sol'8 mi? do fa[re]
    si sol do do' la fa sib? [sol]

    %80
    \clef tenor \key fa\major mib? do fa fa' re sib mib! mib,?
    \clef bass \key fa\major do la re re' sib sol do do,
    fa,4 r8 sib' sol mib sib' sib,

    %83
    \clef tenor \key fa\major fa' fa' re sib mib mib, re sib
    fa' re' do la\clef bass\key fa\major sib4 re,
    mib mi fa2

    %86
    sib, r8 re' do la
    sib4 re, mib mi
    fa fa, sib2 %%\pageBreak

    %89 4/4 OOKK andante
    R1*2
    sib2 fa'4 sol
    la8 fa do'4 re16 do sib la

    %93
    sol8 do
    la fa re16 do sib la sol8 sol' la16 sol fa mi?
    re4 r8 sib\mbreak mib4 fa

    %96
    sol r8 fa, sib4 do
    re8 sib fa'4 sol16 fa mib re do8 fa
    \clef tenor \key fa\major re8 mib' re16 do sib la sol8 do la fa

    %99
    sib4 r8 fa sib4 do\mbreak
    re8 sib fa'4 sol16 fa mib? re do8 fa
    re16 do sib la sol8 do \clef bass\key fa\major la,4 fa

    %102
    sib do re8 sib fa'4
    sol16 fa mib re do8 fa re16 do sib la sol4
    fa r8 do' fa8 sol la fa\mbreak

    %105
    sib8 sib, do do, fa4 \clef tenor \key fa\major fa'
    sib do re8 sib fa'4
    re16 do sib la sol8 sol' re4 mib?

    %108
    fa4. fa,8 sib4 do
    re8 sib mib4 fa16 mib re do sib4
    do16 sib la sol fa4\mbreak sib sib,

    %111
    fa'2 sol4 la8 fa
    sib sol16 fa mib re do8 do'16 sib la sol fa8 sib16 la
    sol fa mib8 mib'16 re do sib la8\noBeam fa16[mib re do] sib8

    %114
    \clef bass \key fa\major fa'2 sib,4 fa'
    sol la8 fa\mbreak sib4 re16 do sib la
    sol8 do la \once\stemUp fa, sib4 do

    %117
    re8 sib fa'4 sol16 fa mib? re do8 fa
    re4. fa,8 sib4 do
    re4. sib8 fa'2

    %120
    sib4. fa,8 sib4 do\mbreak re4. sib8 fa'2

    %121 OOKK 9/8
    sib,2. r4 r8
    sib' la sol fa4 sol8 mib4  fa8
    re4. mib sol

    %124
    fa8 mib? re do4 re8 sib4 do8
    la4. sib\mbreak re
    do'8 sib la sol4 la8 fa4 sol8

    %127
    mi?4. do'8 sib la do,4.
    fa,1*9/8
    fa'8 sol la sib4 sol8 do4 la8

    %130
    re4. sol, la\mbreak
    sib,8 do re mib4 do8 fa4 re8
    sol4. do, re

    %133
    \clef tenor \key fa\major mib'8 re do sib4 do8 lab4 sib8
    sol4. lab mib
    \clef bass \key fa\major sib8 do re mib4. do8 re mib\mbreak

    %136
    fa4. re8 mib fa sol4.
    mib8 re do sib4 mib8 fa4.
    sib,8 do re mib4. do8 re mib

    %139
    fa4. re8 mib fa sol4.
    mib8 re do sib4 mib8 fa4.\mbreak
    \once\stemUp sib,8 re' do sib4 mib,8 fa4.

    %142
    sib,8 re do sib4 mib8 fa4.
    sib,1*9/8\fermata

}

Ibcn = \relative do {

    sib'2 la
    sol8 re mib4 re do
    sib2 fa'

    %4
    sib8 fa sol4 fa mib
    re fa~fa mi?\mbreak
    la sib la sol

    %7
    fa2 do
    fa8 do re4 do8 re sib4
    la8 fa' sol4 fa8 sol mib?4

    %10
    re8 sib' do4 sib la
    sol2\mbreak fa4 sib,~
    sib fa'2 sib,4

    %13
    re do8 re sib do16 sib la4
    fa2 do'4. re16 mi
    fa4 la sol8 la fa4

    %16
    mi re\mbreak do8 re sib4
    la8 fa' sol4 fa8 sol mib?4
    re8 sib' do4 sib8 fa sol4

    %19
    fa8 sol mib fa16 mib re8 la sib4
    sol8 re' mib4 re8 sib' do4\mbreak
    sib la sol8 mib fa4

    %22
    mib re do8 sib4 re8
    fa4. sol16 la sib4. fa8
    la4 sol fa4. sib,8~

    %25
    sib re fa4~\mbreak fa8 sol16 la sib4
    sib, fa' sol8 la sib sib,
    re4 do sib fa'

    %28
    sib,2 fa'4 sol
    fa sol fa2\mbreak
    sib, fa'4 sol

    %31
    fa sol fa2
    sib,1
    sib'1~ %%% 4/4 lento OOKK
    sib2
    la4 fa~

    %35
    fa sol8. re16 mi2
    fa4 re8. la16 sib4 si\mbreak
    do4. sol'8 do2~

    %38
    do4 re8. la16 sib2~
    sib4 la8. re,16 mi4 fa
    sol la sib sol8. re16

    %41
    do8. sol16 la4 sib si
    do2 \parenthesize fa,
    fa'1 mib2 %%% OOKK 3/2

    %44
    re sol fa
    mib fa1
    sib,2. fa'4 sol la

    %47
    sib1 lab2
    sol lab sol
    fa sib sib,

    %50
    \clef tenor \key fa\major mib?2. sib'4 do re
    mib1 re2\mbreak
    do re mib

    %53
    \clef bass \key fa\major fa, sol la
    sib, do re
    mib1 re2~

    %56
    re do sib
    mib1 mi2
    fa1 fad2

    %59
    sol do,1
    re2 re,1
    sol2 sol'1\mbreak

    %62
    re2 sol4 fa mib re
    do2 fa4 mib re do
    sib2 mib4 fa sol la

    %65
    sib2 mib,1
    la!2 re,1
    sol2 do4 sib la sol

    %68
    fa2 sib4 la sol fa
    mib2 sol4 fa mib re\mbreak
    do sib fa'1

    %71
    sib,2 sib'4 la sol fa
    mib2 sol4 fa mib re
    do sib fa'2 fa,

    %74
    sib1.
    r8 sib' la sol fad2  %%% 4/4 lento
    r8 sol fad? mib re4. sib8

    %77
    mib4. do8 fa4. fa,8\mbreak
    sib4. sol'8 mi? do fa[re]
    si sol do do' la fa sib? [sol]

    %80
    \clef tenor \key fa\major mib? do fa fa' re sib mib! mib,?
    \clef bass \key fa\major do la re re' sib sol do do,
    fa,4 r8 sib' sol mib sib' sib,

    %83
    \clef tenor \key fa\major fa' fa' re sib mib mib, re sib
    fa' re' do la sib4 re,
    mib mi fa2

    %86
    sib, r8 re' do la
    sib4 re, mib mi
    \clef bass \key fa\major fa fa, sib2

    %89 OOKK 4/4 andante
    sib'2. la4
    sol re mib fa
    sib,2 fa'4 sol

    %92
    la8 fa do'4 re8 sib sol do
    fa,4 re8 sib sol4 la'8 fa
    re4. sib8\mbreak mib4 fa

    %95
    sol fa8 fa, sib4 do
    re8 sib fa'4 sol8 mib do[fa]
    re mib re sib' sol do la fa

    %98
    \clef tenor \key fa\major sib4. fa8 sib4 do\mbreak
    re8 sib fa'4 sol8 mib? do fa
    re sib sol do \clef bass \key fa\major la,4 fa

    %101
    sib do re8 sib fa'4
    sol8 mib do[fa] re sib sol4
    fa do' fa8 sol la fa\mbreak

    %104
    sib,4 do fa, fa'
    sib do \clef tenor \key fa\major re8 sib fa'4
    re8 sib sol4 re' mib?

    %107
    fa4. fa,8 sib4 do
    re8 sib mib4 fa8 re sib4
    do8 la fa4\mbreak sib do

    %110
    \clef bass \key fa\major fa,2 sol4 la8 fa
    sib sol mib[do] do' la fa[sib]
    sol mib mib'[do] la fa re sib

    %113
    fa'2 sib,4 fa'
    sol la8 fa\mbreak sib4 re8 sib
    sol do la \once\stemUp fa, sib4 do

    %116
    re8 sib fa'4 sol8 mib do fa
    re4. fa,8 sib4 do
    re4. sib8 fa'2

    %119
    sib4. fa,8 sib4 do\mbreak
    re4. sib8 fa'2
    sib,4. sib' do %%% 9/8 OOKK

    %122
    sib fa mib
    re mib sol
    fa do sib

    %125
    la sib\mbreak re
    do sol' fa
    mi? do'4 fa,8 do4.

    %128
    fa,1*9/8
    fa'4. sib4 sol8 do4 la8
    re4. sol, la\mbreak

    %131
    sib, mib4 do8 fa4 re8
    sol4. do, re
    mib sib' lab

    %134
    sol lab mib
    sib mib do\mbreak
    fa re sol

    %137
    mib4 do8 sib4 mib8 fa4.
    sib, mib do
    fa re sol

    %140
    mib4 do8 sib4 mib8 fa4.\mbreak
    sib, sib'4 mib,8 fa4.
    sib, sib'4 mib,8 fa4.

    %143
    sib,1*9/8\fermata

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <6>
  s8 <6> s4 <6> <7>8 <6>
  s2 <4>4 <3>
  s <6> s <6>
  <6>2 <2>
  <6>4 <6> s2
  s <4>4 <3>
  s8 <6> s4 s <6>
  <6> <6> <6> s
  <6> <6> <6> <6>
  s1
  s4 <6> <5> s
  s2 s8 <6>16 <6> <6>4
  s2 <6>4 <5>
  s2 s4 <6>
  s <6> s8 <6> <6>4
  s <6> s2
  s8 <6> s4 <6>4 <7>8 <6>
  s4 s8 <6> <6> <6> s4
  s2 s8 <6-> s4
  s1
  s4 <6> s2
  s1
  <6>2 <6>4 <5>
  s1
  s2 s8 <6> <6> s
  <6->4 <6> s <4>8 <3>
  s1
  s2 <4>4 <3>
  s1
  s4 <6> <4> <3>
  s1

  %%% 4/4 lento
  s1
  <2>4 <4+> <6> <6>
  <4 2> s <5-> <6>
  s2 <7>8 <5> <6 5>4
  s2 <5>4 <6>
  <4 2> s <5> <6>
  <2>8 <4> s4 s2
  <6>4 <6> s2
  <7>4 <6> <7 5> <7 5>
  <4- 3>1

  %%% 3/2
  <5>2 <6> <6>
  <6> s <6>
  s <4> <3>
  s1.
  <5>2 <6> <6>
  <6-> s <6->
  <7-> <4> <3>
  s1.
  s1 <6>2
  s1.*3
  <7>2 <6> <6->
  <2-> s s
  <7> <6> <5>
  <5> <6> <5>
  s <_->1
  <6 4>2 <5 4>1
  s1.*5
  s2 <_->1
  s2 <_->1
  s1.*2
  s2 <4> <3>
  s1.*2
  s2 <4> <3>
  s1.

  %%% 4/4 lento
  s1*2
  <5>4 <6> s2
  s <6 5>
  <6 5> <6 5>
  <6 5>1
  s2 <6 5>
  s1*2
  s4 <_-> <4-> <6>
  <7 5> <7- 5> <4> <3>
  s1
  <4->4 s <7 5> <7- 5>
  s1

  %%% bar 89 OOKK 4/4 andante
  s2 s4 <6>
  s <6> s2
  s1
  s2 s4 <6>
  s1
  <6>1
  s
  s2 s4 <6>
  s1*3
  <6>4 <6> s2
  s1*6
  s2 <6>4 <6>
  s1*2
  <5>4 <6> s <6>
  s1
  s
  <4>4 <3> s2
  s1*3
  s2 <6>4 <6->
  s2 <4>4 <3>
  s2 <6>4 <6->
  <5>4 <6> <4> <3>

  %%9/8 OOKK
  s4. s <6->
  s <6> <6>
  <6> <6> <6+>
  s <6-> s
  <6> <6> <6+>
  s <6> s
  s1*9/8*3
  s4. s <6>
  s1*9/8
  s4. <_-> <6>
  s1*9/8
  <6->4. <6> s
  s1*9/8
  s1*9/8
  s4 <6>8 s2.
  s1*9/8
  s1*9/8
  s4 <6>8 s2.

}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 50
  s1*32
  \bar"||"\break
  \time 4/4
  \tempo 2 = 35
  s1*10
  \bar"||"\break
  \time 3/2
  \tempo 1. = 55
  s1.*32
  \bar"||"\break
  \time 4/4
  \tempo 2 = 35
  s1*14
  \bar"||"\break
  \time 4/4
  \tempo 2 = 50
  s1*32
  \bar"||"\break
  \time 9/8
  \tempo 2. = 55
  s1*9/8*8
  %\set Score.measureLength = #(ly:make-moment 4 4)
  %s1
  \bar":..:"
  \set Score.measureLength = #(ly:make-moment 9 8 )
  s1*9/8*15
  %\set Score.measureLength = #(ly:make-moment 4 4)
  %s1
  \bar":|."

}

Ivl = {
  \Iglobal
  \notypeset
  <<\Ivln \forma>>

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
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f

}

IIvln =  \relative do'' {

    r16 la'[sib fa la re, fa dod] re[la sib fa la re, fa dod]
    re2 r
    r16 mi'[fa do mi la, do sold] la2

    %4
    r16 la' do sold la4\mbreak r16 mi fa do mi4
    r16 si do sold la4 r16 mi fa do mi4~
    mi16[re mi fa sol ?la si do] re2

    %7
    r16 mi[re mi si mi re mi] sold,2
    r16 la[sol? la mi la sol la] fa2~
    fa16 re mi fa sol4~\mbreak sol16 fa mi re mi4

    %10
    r16 mi'[re mi do re si do] la2
    r16 la'[sol la fa sol mi fa] re2~
    re16 si do re mi4~mi16 re do si do4~

    %13
    do16 la si do re4~re16 sol, la si do4\parentSlur (
    do16) fad, sol la si4~si16[mi, fa? sol la si do re]\mbreak
    mi2. red8. dod16

    %16
    red2 r4 si8. la16
    sol2. sold4
    la8. si16 do2 dod4

    %19
    re8. mi16 fa2 fad4
    sol8. la16 sib2 la4~
    la8 sol16 fa mi4. fa16 sol fa8. mi16\mbreak

    %22
    fa4 la,4. sib?16 do re8. mi16\noBeam
    dod8 la la'4. re,8 sol4~
    sol8 do, fa4\parentSlur (fa8) sib,? mib8. re16

    %25
    dod4 re2 dod4
    re1
    R1 %%% 4/4 OOKK
    r8 la la la la si16 la sold8 mi
    la[si16 la sol? la fa sol] mi4. la8
    si do16 re do8 si do4 la
    mi'~mi16 re do si do4 mi~
    mi8 fa16 sol fa8. mi16 fa8 re re re\mbreak
    re mi16 re dod8 la re[fa16 mi re mi do? re]
    si4 do la8 re4 do8
    sib4 la8 la'4 sol8 fa4 mi8 la4 sol8 la fa mi4
    re8 la la la la si16 la sold8 mi
    la[fa'16 mi re mi do re]\mbreak si4 r8 mi
    mi[mi mi fad16 mi] red8 si mi4~
    mi8[re16 mi do re si do] la8 la' la la
    la2 r8 la la la
    la2\parentSlur ( la8) si16 la sold8 mi
    la4. sol16 la fa8 la sol fa\mbreak  %%% bar 43 fine p. 5

    %44 OOKK
    mi16[do re mi fa sol fa mi] re[sib do re mi fa mi re]
    dod2 r8 re re re
    re mi16 re dod8 la re la la la

    %47
    sib4 sol la8 la' la la
    la si?16 la sold8 mi la mi fa[re]
    mi do re[si]\mbreak  do la sib[sol]

    %50
    la fa sol[mi] fa16[re mi fa sol la si do]
    re[si dod? re mi fa sol la] fa[mi re dod si la sol fa]
    sol[mid fa sol la si sol la] fa[mi? re mi fa sol la si]

    %53
    do[si la sol fa mi re do] fa[la sol fa mi mi' re mi]
    dod?[la' si la sol la sol la]\mbreak fa[la, si dod re mi fa sol]
    dod,8 la16 si dod8 la  re16[dod si la sol fa mi re]

    %56
    dod?8 la la'4~la8 re, re'4~
    re16 dod re si dod4\parentSlur (dod16) la si dod re4~
    re16 dod re si dod8 si16 dod re2

    %59 adagio
    r fa,\mbreak
    mi la~
    la4 la sol2~

    %62
    sol fa~
    fa mi
    re sol~

    %65
    sol4 fa  mi2~
    mi fa
    re4 mi fa sol\mbreak

    %68
    la2. sol8 fa
    mi4 fa sol la
    fad re sol2~

    %71
    sol4 fa re  mi
    fa sol la si
    dod2 re~

    %74
    re dod
    re1
    re,8 fa re la' mi la fa4. dod %%% 12/8 OOKK

    %77
    re8 fa re la'4. la8 do? la mi' si mi
    do4. sold la8 do la si mi, si'
    mi,4. red mi8 sol mi fad si fad

    %80
    sol[si sol la re, re'] si4. dod\mbreak
    re8 la re si4. mi8 si mi dod4.
    fad8 dod fad re la re si4. dod

    %83
    re8 fa! re mi la, la' fa4. dod
    re8 fa re la'4. la mi8 re dod
    re1.\fermata

    %86 4/4 adagio
    la1~
    la4 la sol2
    fa2. mi8 re

    %89
    mi4 la, la'2
    fad4 re sol2~
    sol fad

    %92
    sol2. fa4
    mi2 do
    fa2. mi8 re

    %95
    do4 re mi fa\mbreak
    sol1~
    sol4 fa re mi

    %98
    fa2. mi8 re
    mi4 do'2 si8 la
    si4 mi, do'2

    %101
    si1
    la %\pageBreak
    fa'4 fa fa %103 3/4 OOKK

    %104
    fa mi4. re16 mi
    fa4 re la'~
    la8 re, sol fa mi re\mbreak

    %107
    dod4 la re
    mi4. fa16 sol fa8 mi
    fa re la'2~

    %110
    la4 si4. la16 si
    do?4 la4. sol16 la
    sib4 sol4. fa16 sol

    %113
    la4 fa4. mi16 fa
    sol4 fa4. sol16 fa
    mi2.

    %116
    do'8 la fa la[sol fa]
    sol2 la4
    sib8 sol re sol fa mi

    %119
    fa4. fa8 mi re
    do4. la8 si do
    re mi fa sol la si

    %122
    do4 si4. la16 si
    la8 si do si la si
    sol la sib la sol la

    %125
    fa sol la sol fa sol\mbreak
    mi la, si dod re mi
    fa re mi fa sol la

    %128
    sib4 re, fa
    dod8 la si dod re mi
    fa sol mi4. re16 mi

    %131
    re2.
    r8 fa mi fa re fa % 3 single digit OOKK
    mi la sol la mi la

    %134
    fa re mi fa sol la\mbreak
    re, la sib? do re mi
    dod mi fa sol la fa

    %137
    mi la sol fa mi la
    fa mi re do? si la
    la'4 si4. la16 si

    %140
    do4 la4. la8
    sib?4 sol4. sol8
    la sol fa mi re do\mbreak

    %143
    sib la sib do re mi
    dod2.
    la'8 sol fa do'[sib la]

    %146
    sol2 la4
    sib re,4. mi8
    fa4 la,4. si?8

    %149
    do4. la8 si do
    re2 la'8 si
    do4 si4. la16 si\mbreak

    %152
    la4. fa8 sol la
    sol4. sib8 la sol
    fa4. la8 sol fa

    %155
    mi la, dod la mi' dod
    fa re fa re la'[fa]
    sib16[re, mi fa sol la sib la sol fa mi re]

    %158
    dod4. dod8 re mi\mbreak
    fa4 mi4. fa16 mi
    re2.

}

IIvcn = \relative do {

    R1
    r16 mi'[fa dod re la sib sol] la[mi fa do? re la sib sol]
    la2 r16 mi'[fa do mi la, do sold]

    %4
    la4 r16 si' do sold\mbreak la4 r16 si do sold
    la4 r16 si do sold la4 r16 sol? la mi
    fa2~fa16[mi re do si la sol fa]

    %7
    mi2 r16 mi'[re mi si mi re mi]
    la,2 r16 re[do re la re do re]
    sib4~sib16 sol la sib\mbreak do4~do16 sib la sol

    %10
    la2 r16 la'[sol la fa sol mi fa]
    re2 r16 re'[do re si do la si]
    sold4~sold16 mi fa sold la4~la16 sol? fa mi

    %13
    fa4~fa16 re mi fa mi4~mi16 la, si do
    re4~re16 sol, la si] do2~\mbreak
    do16[si do re mi fa sol la] si2

    %16
    r4 si,8. dod16 red2
    mi4 mi'8. re16 do4 si
    la4. sol8 fa4 mi

    %19
    re4. do8 sib4 la
    sol4. fa8 mi4 fa
    do'2 dod\mbreak

    %22
    re4. do?8 sib4 sol
    la4. fa8 sib4. mi,8
    la4. re,8 sol2~

    %25
    sol4 fa8. sol16 la2
    re,1
    \clef tenor r8 re'' re re re mi16 re dod8 la

    %28
    re8[fa16 mi re mi do? re] si4 mi
    do4. re8 re4 do
    si mi, \clef bass r8 la la la

    %31
    la si16 la sold8 mi la[si16 la sol? la fa sol]
    mi4 la re,8[re'16 do sib? do la sib]\mbreak
    sol4 la fa4. do8

    %34
    re mi4 fa re8 la'4~
    la8 sol\noBeam fa4 mi8\clef tenor mi'4 re8~
    re do\noBeam sib4 la8 re4 dod8
    re8.[mi16 fa mi re do] si4 mi

    %38
    do8 la la la la si16 la sold8 mi
    la la la la la si16 la sold8 mi
    la2~la8[sol16 la fa sol mi fa]

    %41
    re8 re' re re re mi16 re dod8 la
    re[fa16 mi re mi do re] si4 r8 mi
    do la re4. do16 re si8 re\mbreak

    %44
    do si la16 fa sol la \clef bass sib16[do sib la sol mi fa sol]
    la[sib sol la fa sol mi fa] re[mi do re sib do la sib]
    sol[sol' do sib? la sol fa mi] re8[fa16 mi re do sib? la]

    %47
    sol la sib sol do'sib? la sol fa[sol la sol fa mi re do]
    si? do re si mi re do si la la' sol la re, sol fa sol
    do, re mi do fa re mi mi,\mbreak la si do re sol, la sib do

    %50
    fa, sol la sib? sol mi la la' re,8 re' re re
    re mi16 re dod8 la re re, re re
    re dod16 si dod8 la re re' do? si

    %53
    \clef alto la la' la la la si16 la sold8 mi
    la la,16 si do8 la\clef bass re,16[fa mi re do si la sol]
    la[si la sol la sol fa mi] re[mi fa sol la si dod? re]

    %56
    la'[sol fa mi re dod? si la] sib4~sib16 la sib sol
    la4~la16 sib la sol fa4~fa16 mi fa re
    la'2 re,

    %59 adagio OOKK
    re''1~\mbreak
    re4 re do2
    sib2. la8 sol

    %62
    la4 re, re'2
    si4 sol do2\parentSlur (
    do) si

    %65
    do2. sib4
    la2 fa
    sib2. la8 sol\mbreak

    %68
    fa4 sol la sib?
    do1~
    do4 sib sol la

    %71
    sib2. la8 sol
    fa2. mi8 re
    mi4 la, fa'2

    %74
    mi1
    re
    re4. dod re8 fa re la' mi la % 12/8 OOKK

    %77
    fa4. re8 fa re la'4. sold
    \clef tenor la8 do la mi' si mi do4. sold
    la8 do la si fad si \clef bass mi,4. red

    %80
    mi fad sol8 [si sol la mi la]\mbreak
    fad4. sol8 re sol mi4. la8 mi la
    fad4. si8 fad si sol re sol mi la, la'

    %83
    re,4. dod re8 fa re mi la, la'
    fa4. re8 fa  re la' fa re la' mi la
    re,1.\fermata

    %86
    \clef alto r2 do'
    si mi~
    mi4 mi re2~

    %89
    re do~
    do si
    la re4 do

    %92
    si2 sol
    do2. si4
    la fa fa'2

    %95
    mi2. re8 do\mbreak
    si4 do8 re mi4 re
    dod la re2~

    %98
    re4 do? la si
    do4. re8 mi4 fad
    sold2 la~

    %101
    la sold
    la1 %%\pageBreak
    \clef bass re,4 re re %% 3/4 OOKK

    %104
    re4 dod4. si16 dod
    re4. mi8 do re
    sib4. sol8 do sib\mbreak

    %107
    la sol fa4 re
    la'8 la, dod4 la
    re4. mi8 fa do

    %110
    re si mi4 mi,
    la8 si do la re re,
    sol la sib sol do do,

    %113
    fa sol la fa sib la
    sol4 re'8 mi fa re
    la'2.

    %116 OOKK
    fa
    do8 mi do do' sib la
    sol2 sol,4

    %119
    re'8 fa re re'[do si?]
    la mi re do si la
    re4. mi8 fa sol

    %122
    la la, mi'4 mi,
    la fa2
    do'4 sol2

    %125
    re'8 mi fa4 sol\mbreak
    la4. la,8 si do
    re mi re do sib la

    %128
    sol la sol fa mi re
    la'4 la' fa
    re la' la,

    %131
    re2.
    re8 re' do re si re
    dod si dod la si dod

    %134
    re mi re do! si la\mbreak
    sib do sib la sib sol
    la sol fa mi fa re

    %137
    la' si, do re mi dod
    re mi fa sol la do,
    re si  mi re mi mi,

    %140
    la si do re mi fa
    \clef tenor sol la sib do re mi
    fa mi re do sib la\mbreak

    %143
    \clef bass sol fa mi re do sib
    la2.
    fa8 sol la fa[la si]

    %146
    do [mi'16 re do8] sol [mi do]
    sol[sib'16 la sol8] re' sib sol
    re [fa16 mi re8] la'[fa re]

    %149
    la'16[si? do si la sol fa mi re do si la]
    re[mi fa mi re do si la sol fa mi re]
    la' si do re mi4 mi,\mbreak

    %152
    la8 la' fa la do fa,,
    do' mi do sol'[sib sol]
    re' re, fa re sol re

    %155
    la'2 la,4
    re2 re,4
    sol2 sol'4

    %158
    la16[si? dod re mi re dod si la sol fa mi]\mbreak
    re[mi fa sol la la, si! sol la fa sol la]
    re,2.

}

IIbcn = \relative do {

    re1~
    re
    la~

    %4
    la~
    la
    fa

    %7
    mi
    la2 re
    sib\mbreak do

    %10
    la1
    re
    mi2 la

    %13
    fa mi4 la,
    re sol, do2~
    do si\parentSlur (

    %16
    si) red
    mi4 mi'8. re16 do4 si
    la4. sol8 fa4 mi

    %19
    re4. do8 sib4 la
    sol4. fa8 mi4 fa
    do'2 dod\mbreak

    %22
    re4. do?8 sib4 sol
    la4. fa8 sib4. mi,8
    la4. re,8 sol2~

    %25
    sol4 fa8. sol16 la2
    re,1
    R1*3 %%% inizia la fuga bar 27

    %30
    r2 r8 la'' la la
    la si16 la sold8 mi la[si16 la sol? la fa sol]
    mi4 la re, sib'

    %33
    sol la fa4. do8
    re mi4 fa re8 la'4~
    la8 sol\noBeam fa4 mi8\clef tenor mi'4 re8~

    %36
    re do\noBeam sib4 la8 re4 dod8
    re4. do8 si4mi,
    la2\mbreak la4 sold

    %39
    la2 la4 sold
    \clef bass la2~la8 sol fa mi
    re2 la'

    %42
    re,4. la'8 mi2
    fa4. mi8 re4 sol\mbreak
    la fa sib sol

    %45
    la2 re,
    sol,4 la re2
    sol4 do fa, re

    %48
    si mi la,?8 la' re,[sol]
    do,4 fa8 mi\mbreak la,4 sol
    fa8 sib sol[la] re2

    %51 OOKK
    \clef alto re'4 dod re2
    \clef bass re,4 dod re2
    \clef alto la'2 re4 mi

    %54
    \clef bass la,2\mbreak re
    la re,
    la sib4. sol8

    %57
    la4. sol8 fa4. re8
    la'2 re,
    R1*17 % adagio

    %76
    re'4. dod re la
    re2. la'4. sold
    la mi la sold

    %79
    la si mi, red
    mi fad sol, la\mbreak
    re sol, mi la

    %82
    fad si8 fad si sol4. la
    re dod re la
    re re, re' la'

    %85
    re,1.\fermata
    R1*17  %% OOKK 4/4
    re'2.  %%% 3/4

    %104
    re4 la2
    re do4
    sib2.\mbreak

    %107
    la4 fa re
    la dod la
    re4. mi8 fa do

    %110
    re si mi4 mi,
    la2 re4
    sol,2 do4

    %113
    fa,2 sib4
    sol re2
    la'2.

    %116
    fa'
    do
    sol

    %119
    re'
    la2 la'4
    re,2.

    %122
    la4 mi'2
    la,4 fa2
    do'4 sol2

    %125
    re'8 mi fa4 sol\mbreak
    la la,2
    re2.

    %128
    sol,2 re'4
    la la' fa
    re la' la,

    %131
    re2.
    re2.
    la'

    %134
    re2 do4\mbreak
    sib2 sol4
    la2 re,4

    %137
    la'2 dod,4
    re2 la'4
    re,8 si mi4 mi,

    %140
    la2 la'4
    sol2.
    fa\mbreak

    %143
    sol
    la
    fa2 la,4

    %146
    do2.
    sol
    re'

    %149
    la'
    re,
    la4 mi'2\mbreak

    %152
    la,4 fa2
    do' sol4
    re'2 sol,4

    %155
    la2.
    re2 re,4
    sol2 sol'4

    %158
    la2 la,4\mbreak
    re la'2
    re,2.

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1*5
  <7>2 <6>
  <3+>1
  s
  <5>4 <6> s2
  s1
  <5>2 <6>
  <_+>1
  <5>4 <6> <_+> s
  <_+>2 <7>
  <6> <_+>
  s1
  s2 s4 <6+>
  s1*2
  s2 <6 5>
  s1
  s
  s2 <7>4 <6>
  s2 s4 <6>8. <7>16
  <4+ 2>4 <6> s2
  s1

  %%% fuga
  s1*6
  s4 <_+> <6>2
  s8 <5> <6> <5> <6> s <4> <3>
  <2>8 s s4 <4>8 <3> <2> <3>
  <2> <6> <7> <6>  s <3> <2> s
  s4. <6>8 <7>4 <_+>
  s1
  <2 4+>2 s4 <6>
  s1
  s2 <4>4 <_+>
  <3>1
  <5>4 <6> s2
  s s4 <6>
  <_+>1
  <3->
  <_->
  s2 <_+>
  s4 <6>8 <_+> s4 <6 3->4
  s1
  s4 <6> s2
  <4 2+>4 <6> s2
  s1
  <_+>4 <3> s2
  <_+>1
  <_+>2 <7>4 <6>8 <6>
  <4>4 <3>8 <_+> s2
  s1*18

  %% 12/8 OOKK
  s4. <6> s <_+>
  s1.
  s4. <_+> s2.
  s4. <_+> s2.
  s4. <6> s2.
  <_+> <_+>4. <_+>
  s4. s8 <3> s s4. <_+>
  s1.*3
  s1*17  %% 4/4

  %%% 3/4
  s2.
  s4 <_+>2
  s <6>4
  s2.
  <_+>4 <6> s
  <_+>2.
  s2.*5
  <_->2.
  <_+>
  s
  <5>2 <6>4
  <3->2.
  s2.*3
  s4 <_+>2
  s2.
  s4 <_->2
  s4 <6> s
  s4 <_+>2
  s2.*2
  <_+>2 <6>4
  s2.*2

  %% 3 single digit
  s2.
  <_+>
  s2 <6>4
  s2.
  <_+>
  <_+>
  s
  s4 <_+>2
  s2.
  <6 5>4 <3 6>2
  s2.
  <3->
  <3+>
  s2 <6>4
  <5>2 <6>4
  <3->2.
  s2.*3
  s4 <_+>2
  s2.
  s2 <_->4
  s2.
  <3+>
  s
  <3>4 <6>2
  <3+>2.

}

forma = {

  \key do\major
  \time 4/4
  \tempo 2 = 40
  s1*26
  \bar"||"\break
  \time 4/4
  \tempo 2 = 47
  s1*32\break
  \override Score.RehearsalMark.break-align-symbols = #'(key-signature)
  \mark\markup\italic"[Adagio]"
  \tempo 2 = 40
  s1*17
  \bar"||"\break
  \time 12/8
  \tempo 2. = 65
  s1.*10
  \bar":|."\break
  \time 4/4
  \tempo 2 = 50
  s1*17
  \bar"||"\break
  \time 3/4
  \tempo 2. = 60
  s2.*13
  \bar":..:"
  s2.*16
  \bar":..:"\break
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  s2.*13
  \bar":..:"
  s2.*16
  \bar":|."

}

IIvl = {
  \IIglobal
  %\notypeset
  <<\IIvln \forma>>

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
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #5
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge \column\bold{"I. Sinfonia n. 4 in Sib maggiore""  "}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino]"}
            \Ivl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
            \Ivc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.instrumentName = \markup \center-column{"[Basso""Continuo]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.7\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

\pageBreak

\markup\huge \column\bold{"II. Sinfonia n. 2 in Re minore""  "}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino]"}
            \IIvl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
            \IIvc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.instrumentName = \markup \center-column{"[Basso""Continuo]"}
            \IIbc
        >>
    >>

    \layout {

        indent = 1.7\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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
