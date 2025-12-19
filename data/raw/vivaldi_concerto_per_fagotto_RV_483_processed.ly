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

dolce = _\markup\italic"dolce"

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
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IvlIn =  \relative do'' {

    mib,16 mib mib mib mib fa sol lab
    sib sib sib sib sib sib sib sib
    sib, sib sib sib sib sib do re

    %4
    mib mib mib mib mib mib fa sol
    lab lab lab lab lab lab sol fa
    sol sol sol sol sol sol fa mib

    %7
    lab lab lab lab lab lab sol fa
    sol sol sol sol mib' mib mib mib
    fa, fa fa fa re' re re re\mbreak

    %10
    mib4 r
    sib16\pp sib sib sib sib sib sib sib
    \repeat unfold 56 {sib}

    %19
    \repeat unfold 40 {do}
    \repeat unfold 8 {re}
    lab? lab lab lab lab lab lab lab
    lab lab lab lab lab lab lab lab
    \repeat unfold 24 {sol}

    %30
    sol sol sol sol sol sol do do
    la?16 la la la la la la la
    la? la la la la la la la

    %33
    R2
    do16 do do do do la sib do
    fad, fad fad fad fad fad la sib

    %36
    do do do do do do sib la?
    \repeat unfold 8 {sib}
    \repeat unfold 8 {re}

    %39
    \repeat unfold 8 {mib}
    \repeat unfold 8 {re}
    \repeat unfold 8 {do}

    %42
    \repeat unfold 8 {sib}
    \repeat unfold 24 {la}
    sib8 [sol do, re]

    %47
    sol16_\markup {[\musicglyph #"f"]} sol sol sol sol la sib do\mbreak
    re[re re re re re re re]
    re, re re re re re mib fa

    %50
    sol sol sol sol sol sol la sib
    do do do do do do sib la
    sib sib sib sib sib sib la? sol

    %53
    do do do do do do sib la
    sib sib sib sib sol' sol sol sol
    la, la la la fad' fad fad fad

    %56
    sol4 r
    \repeat unfold 72 {re16}\mbreak
    \repeat unfold 16 {do}

    %68
    \repeat unfold 16 {sib}
    \repeat unfold 16 {la}
    \repeat unfold 8 {sol}

    %73
    \repeat unfold 16 {sib}
    \repeat unfold 16 {do}
    \repeat unfold 16 {sib}

    %79
    \repeat unfold 24 {do}
    re re re re do do do do
    sib4 r  %%%% pag. 5

    %84
    mib,16 mib mib mib mib fa sol lab
    sib[sib sib sib sib sib sib sib]
    sib, sib sib sib sib sib do re

    %87
    mib mib mib mib mib mib fa sol
    lab lab  lab lab lab lab sol fa\mbreak
    sol sol sol sol sol sol fa mib

    %90
    lab lab lab lab lab lab sol fa
    sol8 mib r4
    R2*6\mbreak

    %98
    mib'16 mib mib mib mib mib mib  mib
    reb reb reb reb reb reb reb reb
    reb? reb reb reb reb reb reb reb

    %101
    reb? reb reb reb reb reb reb reb
    \repeat unfold 8 {do}
    \repeat unfold 24 {mib}

    %106
    re? \repeat unfold 7 {re}
    R2*6
    sol,16 sol sol sol sol sol fa mib

    %115
    lab lab lab lab lab lab sol fa
    sol sol sol sol sol sol fa mib
    lab lab lab lab lab lab sol fa

    %118
    sol sol sol sol sol sol fa mib\mbreak
    lab lab lab lab lab lab sol fa
    reb' reb reb reb reb reb reb reb

    %121
    \repeat unfold 8 {do}
    \repeat unfold 8 {mib}
    re? \repeat unfold 7 {re}

    %124
    fa, \repeat unfold 15 {fa}
    \repeat unfold 8 {sol}
    \repeat unfold 8 {fa}

    %128
    \repeat unfold 8 {sol}
    \repeat unfold 8 {fa}\mbreak
    sol4 r

    %131
    R2
    \repeat unfold 16 {sol16}
    \repeat unfold 8 {fa}

    %134
    sol4 r
    mib16 mib mib mib mib fa sol lab
    sib sib sib sib sib sib sib sib

    %137
    sib, sib sib sib sib sib do re
    mib mib mib mib mib mib fa sol
    lab lab lab lab lab lab sol fa

    %140
    sol sol sol sol sol sol fa mib
    lab lab lab lab lab lab sol fa
    sol sol sol sol mib' mib mib mib

    %143
    fa, fa fa fa re' re re re\mbreak
    mib4\fermopz r

}

IvlIIn = \relative do'' {

    mib,16 mib mib mib mib fa sol lab
    sib sib sib sib sib sib sib sib
    sib, sib sib sib sib sib do re

    %4
    mib mib mib mib mib mib fa sol
    fa fa fa fa fa fa mib re
    mib mib mib mib mib mib fa sol

    %7
    fa fa fa fa fa fa mib re
    mib mib mib mib sol sol sol sol
    fa fa fa fa fa fa fa fa\mbreak

    %10
    sol4 r
    sol16\pp \repeat unfold 47 {sol}
    sol sol sol sol fa fa fa fa

    %18
    \repeat unfold 24 {sol}
    \repeat unfold 32 {fa}
    \repeat unfold 16 {re}

    %27
    \repeat unfold 24 {mib}
    mib mib mib mib mib mib mib' mib
    fad,16 fad fad fad fad fad fad fad

    %32
    fad? fad fad fad fad fad fad fad
    R2
    la16 la la la la fad sol la\mbreak

    %35
    re, re re re re re fad sol
    la la la la la la sol fad
    \repeat unfold 32 {sol}

    %41
    sol sol sol sol fad fad fad fad
    sol sol sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad

    %44
    fad? fad fad fad fad fad fad fad
    fad? fad fad fad fad fad fad fad
    sol8[sol do, re]

    %47
    sol16_\markup {[\musicglyph #"f"]} sol sol sol sol la sib do\mbreak
    re[re re re re re re re]
    re, re re re re re mib fa

    %50
    sol sol sol sol sol sol la sib
    la la la la la la sol fad
    sol sol sol sol sol sol la sib

    %53
    la la la la la la sol fad
    sol sol sol sol sib sib sib sib
    la[la la la la la la la]

    %56
    sib4 r
    sib16 sib sib sib sib sib sib sib\mbreak
    \repeat unfold 16 {sib}

    %60
    la la la la la la la la
    la? la la la la la la la
    la? la la la la la la la

    %63
    la? la la la la la la la
    sib sib sib sib sib sib sib sib
    \repeat unfold 16 {sol}

    %67
    \repeat unfold 16 {fa}\mbreak
    mib! \repeat unfold 15 {mib}
    \repeat unfold 16 {re}

    %73
    fa fa fa fa fa fa fa fa
    \repeat unfold 16 {sol}
    la la la la la la la la

    %77
    fa fa fa fa fa fa fa fa
    \repeat unfold 16 {sol}\mbreak
    la la la la la la la la

    %81
    \repeat unfold 16 {fa}
    re4 r

    %84
    mib16 mib mib mib mib fa sol lab
    sib[sib sib sib sib sib sib sib]
    sib, sib sib sib sib sib do re

    %87
    mib mib mib mib mib mib fa sol
    fa fa fa fa fa fa mib re\mbreak
    mib mib mib mib mib mib fa sol

    %90
    fa fa fa fa fa fa mib re
    mib8 sib r4
    R2*6

    %98
    sib'16 \repeat unfold 31 {sib}
    \repeat unfold 32 {do}
    re re re re sib sib sib sib

    %107
    R2*6
    mib,16 mib mib mib mib mib fa sol
    fa fa fa fa fa fa mib re

    %115
    mib mib mib mib mib mib fa sol
    fa fa fa fa fa fa mib re
    mib mib mib mib mib mib fa sol\mbreak

    %118
    fa fa fa fa fa fa mib re
    sib' sib sib sib sib sib sib sib
    lab lab lab lab lab lab lab lab

    %121
    do do do do do do do do
    sib sib sib sib sib sib sib sib
    re, re re re re re re re

    %124
    re re re re re re re re
    mib mib mib mib mib mib mib mib
    re re re re re re re re

    %127
    mib mib mib mib mib mib mib mib
    mib mib mib mib re re re re\mbreak
    mib4 r

    %130
    R2
    \repeat unfold 16 {mib16}
    mib mib mib mib re re re re

    %134
    mib4 r
    mib16 mib mib mib mib fa sol lab
    sib sib sib sib sib sib sib sib

    %137
    sib, sib sib sib sib sib do re
    mib mib mib mib mib mib fa sol
    fa fa fa fa fa fa mib re

    %140
    mib mib mib mib mib mib fa sol
    fa fa fa fa fa fa mib re
    mib mib mib mib sol sol sol sol

    %143
    fa fa fa fa fa fa fa fa\mbreak
    sol4\fermopz r

}

Ivlan =  \relative do' {

    sol16[sol sol sol sol sol sol sol]
    \repeat unfold 16 {fa}
    mib mib mib mib mib mib mib mib

    %6
    re' re re re re re re re
    sib sib sib sib sib sib sib sib
    re re re re re re re re

    %9
    sib sib sib sib sib sib sib sib
    do do do do sib sib sib sib\mbreak
    sib4 r

    %12
    mib16\pp \repeat unfold 47 {mib16}
    mib mib mib mib re re re re
    \repeat unfold 16 {mib}

    %20
    \repeat unfold 8 {mi}
    mib! \repeat unfold 23 {mib}\mbreak
    re re re re re re re re

    %25
    \repeat unfold 16 {sib}
    \repeat unfold 32 {do}
    \repeat unfold 16 {re}

    %33
    R2
    fad16 fad fad fad fad fad fad fad\mbreak
    la, la la la la la la la

    %36
    fad' fad fad fad fad fad fad fad
    \repeat unfold 16 {re}
    do do do do do do do do

    %40
    re re re re re re re re
    la la la la la la la la
    \repeat unfold 32 {re}

    %46
    re8[sol do, re]
    sib16_\markup {[\musicglyph #"f"]} sib sib sib sib sib sib sib\mbreak
    la la la la la la la la

    %49
    la? la la la la la la la
    sol sol sol sol sol sol sol sol
    fad' fad fad fad fad fad fad fad

    %52
    re re re re re re re re
    fad fad fad fad fad fad fad fad
    re re re re re re re re

    %55
    mib mib mib mib re re re re
    re4 r
    sol16 sol sol sol sol sol sol sol\mbreak

    %58
    \repeat unfold 16 {sol}
    fad fad fad fad fad fad fad fad
    fad? fad fad fad fad fad fad fad

    %62
    fad? fad fad fad fad fad fad fad
    fad? fad fad fad fad fad fad fad
    \repeat unfold 16 {sol}

    %66
    mib mib mib mib mib mib mib mib
    fa? fa fa fa fa fa fa fa
    re re re re re re re re\mbreak

    %69
    mib mib mib mib mib mib mib mib
    do do do do do do do do
    re re re re re re re re

    %72
    sib sib sib sib sib sib sib sib
    re re re re re re re re
    sib sib sib sib sib sib sib sib

    %75
    mib mib mib mib mib mib mib mib
    do do do do do do do do
    fa fa fa fa fa fa fa fa

    %78
    mib mib mib mib mib mib mib mib
    sol sol sol sol sol sol sol sol\mbreak
    fa fa fa fa fa fa fa fa

    %81
    mib? mib mib mib mib mib mib mib
    sib sib sib sib la la la la
    sib4 r

    %84
    sol16 sol sol sol sol sol sol sol
    \repeat unfold 16 {fa}
    mib mib mib mib mib mib mib mib

    %88
    re' re re re re re re re\mbreak
    sib sib sib sib sib sib sib sib
    re re re re re re re re

    %91
    sib8 sol r4
    R2*6
    sol'16 sol sol sol sol sol sol sol

    %99
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %102
    \repeat unfold 8 {lab}
    la! \repeat unfold 7 {la}
    la? la la la la la la la

    %105
    la? la la la la la la la
    sib sib sib sib sib sib sib sib\mbreak
    R2*6

    %113
    sib,16 sib sib sib sib sib sib sib
    \repeat unfold 40 {sib}
    sol' sol sol sol sol sol sol sol

    %120
    mib mib mib mib mib mib mib mib
    la la la la la la la la
    fa fa fa fa fa fa fa fa

    %123
    sib, \repeat unfold 31 {sib}
    mib mib mib mib mib mib mib mib
    lab, lab lab lab sib sib sib sib\mbreak

    %129
    sib4 r
    R2
    \repeat unfold 24 {sib16}

    %134
    sib4 r
    sol16[sol sol sol sol sol sol sol]
    \repeat unfold 16 {fa}

    %138
    mib mib mib mib mib mib mib mib
    re' re re re re re re re
    sib sib sib sib sib sib sib sib

    %141
    re re re re re re re re
    sib sib sib sib sib sib sib sib
    do do do do sib sib sib sib\mbreak

    %144
    sib4\fermopz r

}

Ifgn = \relative do {

    R2*9
    mib2
    sol4  sib

    %12
    mib2~
    mib4~mib16 re do sib
    mib2~

    %15
    mib4~mib16 re do sib
    mib2~
    mib8 [re16 do sib8 lab]

    %18
    sol16 fa mib8 r4
    do'4 mib8 (do)
    sib2(

    %21
    la4) fa'
    \appoggiatura sib,8 la2\tr~
    la\mbreak

    %24
    sib
    re~
    re8.[do16 sib lab? sol fa]

    %27
    \appoggiatura fa8 mib2\tr ~
    mib
    mib'~

    %30
    mib8.[re16 do sib la sol]
    \appoggiatura sol8 fad2~
    fad

    %33
    do'4 la?
    re,~re16 mi32 fad sol la? sib do
    do16 sib la4.

    %36
    do16 sib la4.
    \appoggiatura la?8 sib2
    sol8[re sib sol]

    %39
    do mib'4.
    sib,8 re'4.
    la,8 do'4.

    %42
    sol,8 sib'4.
    re,8 do'4 sib16 la
    re,8 do'4 sib16 la

    %45
    re,8 do'4 sib16 la
    sib8[sol do, re]
    sol,4 r\mbreak

    %48
    R2*8
    sol'2~
    sol4~sol16 sib do re\mbreak

    %58
    sol,2~
    sol4~sol16 sib do re
    fad,2~

    %61
    fad4~fad16 la? sib do
    re,8[(fad) fad(la?)]
    la?[do re16 do sib la]

    %64
    sib la? sol8 r4
    re'16[do sib la sol fa? mib re]
    mib[do do do do do do do]

    %67
    do'[sib la sol fa mib re do]
    re[sib sib sib sib sib sib sib]\mbreak
    sib'[la sol fa mib re do sib]

    %70
    do[la la la la la la la]
    la'[sol fad mi re do sib la]
    sib[sol sol sol sol sol sol sol]

    %73
    sib' do re4.
    sol,,8\staccatissimo [fa\staccatissimo mib\staccatissimo] \parenthesize r
    do''16 re mib4.

    %76
    la,,8\staccatissimo[sol\staccatissimo fa\staccatissimo] r
    sib'16 sib do sib re, sib' do sib
    mib, sib' do sib mib, sib' do sib

    %79
    do do re do mi, do' re do\mbreak
    fa, do' re do fa, do' re do
    mib?[re do sib la sol fa mib]

    %82
    re8[do16 sib fa'8 fa,]
    sib4 r
    R2*7
    r4 r8 mib

    %92
    mib16 mib mib mib mib fa sol lab
    sib[sib, sib sib sib sib do re]
    mib[mib mib mib mib mib fa sol]

    %95
    lab[lab lab lab lab lab sol fa]
    sol fa mib4.
    lab16 lab lab lab lab lab sol fa\mbreak

    %98
    sol fa mib8 r sib'
    reb2~
    reb16[mib reb do sib lab sol fa]

    %101
    mi[fa sol fa mi re? do sib]
    lab8 fa r fa'
    mib'2~

    %104
    mib16[fa? mib re do sib la sol]
    fad[sol la sol fad mi re do]
    sib8 sol r re'

    %107
    mib? do'4.\mbreak
    re,8 sib'4.
    do,8 lab'?4.

    %110
    sib,8 sol'4.
    lab,!8 fa'4.
    re16 sib re fa lab8 sol16 fa

    %113
    sol8 mib r mib
    re'16[do sib lab sol fa mib re]
    mib'[re do sib lab sol fa mib]

    %116
    re'[do sib lab sol fa mib re]
    mib'[re do sib lab sol fa mib]\mbreak
    re do sib8 r4

    %119
    mib8 reb'4.
    do16 sib lab4.
    fa8 mib'4.

    %122
    re16 do sib4 r8
    sib,16 sib' do sib sib, sib' sib, sib'
    sib, lab' sib lab sib, lab' sib, lab'

    %125
    sib, sol' lab sol sib, sol' sib, sol'
    sib,4 r8 sib'
    mib16[re do sib lab sol fa mib]

    %128
    lab,4\tr sib\tr \mbreak
    mib8[sol fa mib]
    r sib'[lab sol]

    %131
    mib'16[re do sib lab sol fa mib]
    mib'[re do sib lab sol fa mib]
    lab,4\tr sib\tr

    %134
    mib,4 r
    R2*9
    R2^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibcn = \relative do {

    mib8[mib mib mib]
    re[re re re]
    re[re re re]

    %4
    do[do do do]
    \repeat unfold 3 {sib[sib sib sib]}
    mib [mib mib sol,]

    %9
    lab [lab sib sib]\mbreak
    mib4 r
    mib8\pp[mib mib mib]

    %12
    \repeat unfold 5 {mib8[mib mib mib]}
    mib[mib re re]
    \repeat unfold 2 {mib[mib mib mib]}

    %20
    mi[mi mi mi]
    mib![mib mib mib]
    \repeat unfold 2 {mib[mib mib mib]}

    %24
    re[re re re]
    \repeat unfold 2 {sib[sib sib sib]}
    \repeat unfold 4 {do[do do do]}

    %31
    \repeat unfold  6 {re[re re re]}
    sol[sol sol sol]
    sol,[sol sol sol]

    %39
    do[do do do]
    sib[sib sib sib]
    la[la la la]

    %42
    sol[sol sol sol]
    re'[re re re]
    \repeat unfold 2 {re[re re re]}

    %46
    sol,[sol' do, re]
    sol,\f[sol sol sol]\mbreak
    fa'?[fa fa fa]

    %49
    fa[fa fa fa]
    mib[mib mib mib]
    \repeat unfold 3 {re[re re re]}

    %54
    sol[sol sol sib,]
    do[do re re]
    sol,[sol' sol sol]

    %57
    sol[sol sol sol]\mbreak
    \repeat unfold 2 {sol[sol sol sol]}
    \repeat unfold  4 {re[re re re]}

    %64
    sol,[sol sol sol]
    sib[sib sib sib]
    do[do do do]

    %67
    la[la la la]
    sib[sib sib sib]\mbreak
    sol[sol sol sol]

    %70
    la[la la la]
    fad[fad fad fad]
    sol[sol sol sol]

    %73
    re[re re re]
    mib[mib mib mib]
    mib[mib mib mib]

    %76
    fa?[fa fa fa]
    re'[re re re]
    mib[mib mib mib]

    %79
    mi[mi mi mi]\mbreak
    fa[fa fa fa]
    la,[la la la]

    %82
    sib[sib fa' fa,]
    sib4 r
    mib8[mib mib mib]

    %85
    \repeat unfold 2 {re[re re re]}
    do[do do do]
    sib[sib sib sib]\mbreak

    %89
    \repeat unfold 2 {sib[sib sib sib]}
    mib mib, r mib'
    mib[mib mib mib]

    %93
    re[re re re]
    do[do do do]
    \repeat unfold 3 {sib[sib sib sib]}\mbreak

    %98
    mib[mib mib mib]
    mi[mi mi mi]
    mi,[mi mi mi]

    %101
    mi?[mi mi mi]
    fa[fa fa fa]
    fad'[fad fad fad]

    %104
    fad,[fad fad fad]
    fad?[fad fad fad]
    sol[sol sol sol]

    %107
    do[do do do]\mbreak
    sib[sib sib sib]
    lab![lab lab lab]

    %110
    sol[sol sol sol]
    fa[fa fa fa]
    \repeat unfold 7 {sib[sib sib sib]}

    %119
    mib[mib mib mib]
    lab,[lab lab lab]
    fa'[fa fa fa]

    %122
    sib, [sib  sib sib]
    \repeat unfold 4 {sib[sib sib sib]}
    mib[mib mib mib]

    %128
    lab,[lab sib sib]\mbreak
    mib4 r
    mib r

    %131
    mib8[mib mib mib]
    mib[mib mib mib]
    lab,[lab sib sib]

    %134
    mib,4 r
    mib'8[mib mib mib]
    re[re re re]

    %137
    re[re re re]
    do[do do do]
    \repeat unfold 3 {sib[sib sib sib]}

    %142
    mib [mib mib sol,]
    lab [lab sib sib]\mbreak
    mib4\fermopz r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mib\major
    \time 2/4
    \tempo 2 = 60
    s2*144
    \bar"|."


}

IvlI = {
    \Iglobal
    \notypeset
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

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}

IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIvlIn =  \relative do'' {

    R2.*2
    r8. do16 [sol8. sib16 mib,8. sol16]
    do,4 r r

    %5
    R2.
    r8. lab'16[fa8. lab16 re,8. fa16]
    sib,4 r r

    %8
    R2.\mbreak
    sib'8 sib sib sib sib sib
    do do do do do do

    %11
    sib sib sib sib sib sib
    sib sib sib sib sib sib
    sib sib re re re re

    %14
    sib8. [mib16 sib8. mib16 sol,8. sib16]
    mib,4 r r
    R2.*4

    %20
    r8. do' 16 [sol8. do16 mib,8. sol16]
    do,4 r r\mbreak
    r8. do'16 [fa,8. lab16 re,8. fa16]

    %23
    sib,4 r r
    r8. sib'16[mib,8. sol16 do,8. mib16]
    lab,4 r r

    %26
    re'8 re re re re re
    mib mib mib mib mib mib
    do do do do do do\mbreak

    %29
    re re re re re re
    mib mib sol, sol sol sol
    sol sol sol sol sol sol

    %32
    sol sol sol sol sol sol
    sol8.[do16 sol8. do16 mib,8. sol16]
    do,8.[sol'16 mib8. sol16 do,8. mib16]

    %35
    sol,8 fa' sol4 sol,
    do2.

}

IIvlIIn = \relative do'' {

    R2.*2
    r8. do16 [sol8. sib16 mib,8. sol16]
    do,4 r r

    %5
    R2.
    r8. lab'16[fa8. lab16 re,8. fa16]
    sib,4 r r

    %8
    R2.\mbreak
    sol'8 sol sol sol sol sol
    mib mib mib mib lab lab

    %11
    fa fa fa fa fa fa
    sol sol sol sol sol sol
    sol sol fa fa fa fa

    %14
    sol8. [mib'16 sib8. mib16 sol,8. sib16]
    mib,4 r r
    R2.*4

    %20
    r8. do' 16 [sol8. do16 mib,8. sol16]
    do,4 r r\mbreak
    r8. do'16 [fa,8. lab16 re,8. fa16]

    %23
    sib,4 r r
    r8. sib'16[mib,8. sol16 do,8. mib16]
    lab,4 r r

    %26
    si'8 si si si si si
    sol sol sol sol sol sol
    lab lab lab lab lab lab\mbreak

    %29
    si si si si si si
    sol sol mib mib mib mib
    mib mib mib mib mib mib

    %32
    mib mib re re re re
    mib8. [do'16 sol8. do16 mib,8. sol16]
    do,8.[sol'16 mib8. sol16 do,8. mib16]

    %35
    sol,8 fa' sol4 sol,
    do2.

}

IIvlan =  \relative do' {

    R2.*2
    r8. do'16 [sol8. sib16 mib,8. sol16]
    do,4 r r

    %5
    R2.
    r8. lab'16[fa8. lab16 re,8. fa16]
    sib,4 r r

    %8
    R2.\mbreak
    r8 mib mib mib mib mib
    lab, lab lab lab lab lab

    %11
    sib sib sib sib sib sib
    mib mib mib mib mib mib
    mib mib sib sib sib sib

    %14
    mib8. [mib'16 sib8. mib16 sol,8. sib16]
    mib,4 r r
    R2.*4

    %20
    r8. do' 16 [sol8. do16 mib,8. sol16]
    do,4 r r\mbreak
    r8. do'16 [fa,8. lab16 re,8. fa16]

    %23
    sib,4 r r
    r8. sib'16[mib,8. sol16 do,8. mib16]
    lab,4 r r

    %26
    sol8 sol sol sol sol sol
    do do do do do do
    lab lab lab lab lab lab\mbreak

    %29
    sol sol sol sol sol sol
    do do do do do do
    do do do do do do

    %32
    sol sol sol sol sol sol
    do8.[do'16 sol8. do16 mib,8. sol16]
    do,8.[sol'16 mib8. sol16 do,8. mib16]

    %35
    sol,8 fa' sol4 sol,
    do2.

}

IIfgn = \relative do {

    do'4 do,8.[mib'16 \appoggiatura mib8 re8. do16]
    \appoggiatura do8 re4 sol,,16(si re fa si re fa re)
    mib8.[do16 sol8. do16 mib,8. sol16]

    %4
    do,4~do16(re mib fa sol la si do32 re)
    mib8.[re16 do8. sib?16 lab?8. sol16]
    lab8.[lab16 fa8. lab16 re,8. fa16]

    %7
    sib,16(re fa sib) re,(fa sib re) fa,\parentSlur ( sib re fa)
    lab,4~lab16 sol fa mib re do sib lab\mbreak
    sol8 mib' sol8.\tr fa32 mib sib'8.\tr lab32 sol

    %10
    do8.\tr sib32 lab mib'8.\tr re32 do do8.\tr sib32 lab
    re4~re16 mib fa mib re do sib lab
    sol4~sol32 mib fa sol lab sib do re mib4

    %13
    mib, fa2\tr
    mib8.[mib'16 sib8. mib16 sol,8. sib16]
    mib,32 fa sol lab sib do re mib

    %16
    sib sol fa mib sib'[sol fa mib] mib' re do sib lab sol fa mib\mbreak
    re mib fa sol lab sib do re sib[fa mib re] sib' fa mib re re' do sib lab sol fa mib re
    do re mib fa sol lab sib do lab mib re do lab'[mib re do] do' sib lab sol fa mib re do

    %19
    sib16(re) re(fa) fa(sib) sib(re) re\parentSlur ( fa) fa\parentSlur ( re)
    re si si fa fa re re si si sol sol fa'
    mib4 r r

    %22
    r8 do' mib4~mib16. re32 do sib lab sol\mbreak
    lab8.[do16 fa,8. lab16 re,8. fa16]
    sib,8 sib' re4~re16. do32 sib lab sol fa

    %25
    sol8.[sib16 mib,8. sol16 do,8. mib16]
    lab,8 lab' do4~do32 sib lab sol fa mib re64 do sib lab
    sol8 si' si4~si16.(do32 re16) do32 si

    %28
    do8 do do4~do16.(re32 mib16) re32 do
    fa,8 fa fa4~fa16.(sol32 lab16) sol32 fa\mbreak
    si,16 si' re8~re16 fa, si8~si16 re, fa si,

    %31
    do8 do' do8.\tr(si32 do) do8.\tr(si32 do)
    do8.\tr(si32 do) do8.\tr(si32 do) do8.\tr(si32 do)
    sol,8 do' re2\tr

    %34
    do8. [do16 sol8. do16 mib,8. sol16]
    do,8.[sol'16 mib8. sol16 do,8. mib16]
    sol,8 fa' sol4 sol,

    %36
    do2.

}

IIbcn = \relative do {

    do2.
    sol'4 sol,2
    do8. [do'16 sol8. do16 mib,8. sol16]

    %4
    do,4. sib?8 lab sol
    do2.
    fa8.[lab16 fa8. lab16 re,8. fa16]

    %7
    sib,2.~
    sib\mbreak
    mib,4 r r

    %10
    R2.*4
    mib'8.[mib'16 sib8. mib16 sol,8. sib16]
    mib,8 mib mib mib mib mib\mbreak

    %16
    re re re re re re
    do do do do do do
    sib sib sib sib sib sib

    %19
    si si si si si si
    do8. [do'16 sol8. do16 mib,8. sol16]
    do,4 do do\mbreak

    %22
    lab'8.[do16 fa,8. lab16 re,8. fa16]
    sib,4 sib sib
    mib8.[sib'16 mib,8. sol16 do,8. mib16]

    %25
    lab,4 lab lab
    sol r r
    R2.*6

    %33
    r8. do'16[sol8. do16 mib,8. sol16]
    do,8.[sol'16 mib8. sol16 do,8. mib16]
    sol,8 fa' sol4 sol,

    %36
    do2.

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key mib\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 50
  s2.*36
  \bar"|."

}

IIvlI = {
  \IIglobal
  \notypeset
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

IIfg = {
  \IIglobal
  \clef bass
  <<\IIfgn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}

IIIvlIn =  \relative do'' {

    mib,8 mib' sib sol sib sol mib4.
    re8 fa re sib re sib lab4.
    sol8 mib' fa sol fa mib sol, r r

    %4
    mib'' sib lab sol fa mib sol, r r
    mib'' sib lab sol fa mib sol,4 la8
    \tuplet 6/9{sib2.}

    %7
    sol''8 sib sol mib sol mib reb4.
    \tuplet 6/9{do2.}
    la'8 do la fa la fa mib4.\mbreak

    %10
    \tuplet 6/9{re?2.}
    sib8\p mib sib sib mib sib sib mib sib %%%%%ripresa
    do\f mib do do mib do do mib do

    %13
    do\p fa do do fa do do fa do
    re\f fa re re fa re re fa re
    re\p sol re re sol re re sol re

    %16
    mib\f sol mib mib sol mib mib sol mib
    mib\p lab mib mib lab mib mib lab mib
    lab\f sib lab fa sol fa re mib re\mbreak

    %19
    lab sib lab fa sol fa re mib re
    mib4. r8 mib' sib sol fa mib
    sol,8 r r  r mib' 'sib sol fa mib

    %22
    sib' 4. sib, re
    mib r r %%%%%% fine ripresa
    R1*9/8*19

    %43
    sib8 sib' fa re fa re sib4.\mbreak
    la'8 do la fa la fa mib4.
    re8 sib' do re do sib re, r r

    %46
    fa'8\p sib fa fa sib fa fa sib fa
    sol\f sib sol sol sib sol sol sib sol
    sol\p do sol sol do sol sol do sol

    %49
    la\f sib la do, re do la sib la
    la' sib la do, re do la sib la
    sib4. mib, fa\mbreak

    %52
    sib,4. r r
    R1*9/8*2
    re'4. re re

    %56
    \tuplet 6/9{re2.}
    do4. mib mib
    \tuplet 6/9{mi2.}

    %59
    re4. fad fad\mbreak
    \tuplet 6/9{fad?2.}
    sol4. r r

    %62
    R1*9/8*2
    sol,4. sol sol
    sol mi' mi

    %66
    re la' la\mbreak
    sol r r
    sib,8 re sib sib re sib sib re sib

    %69
    sib\p mib? sib sib mib sib sib mib sib
    do\f mib do do mib do do mib do
    do\p fa do do fa do do fa do

    %72
    re\f fa re re fa re re fa re
    lab'! sib lab fa sol fa re mib re
    lab! sib lab fa sol fa re mib re\mbreak

    %75
    mib mib' sib sol sib sol mib4 r8
    fa lab fa re fa re sib4 r8
    R1*9/8*6

    %83
    sib'8 mib sib sib mib sib sib mib sib
    sib4. r r
    mib8 lab mib mib lab mib mib lab mib

    %86
    do4. r r
    fa8 sib fa fa sib fa fa sib fa
    re4. r r

    %89
    sol8 do sol sol do sol sol do sol\mbreak
    lab4. r r
    R1*9/8*2

    %93
    sib,8 mib sib sib mib sib sib mib sib
    sib4. r r
    R1*9/8*6

    %101
    fa'8 sib fa fa sib fa fa sib fa
    sol4 r8 sol sib sol sol sib sol
    \tuplet 6/9{sol2.}

    %104
    lab4 r8 fa lab fa fa lab fa
    \tuplet 6/9{fa2.}\mbreak
    do4 r8 mib sol mib mib sol mib

    %107
    \tuplet 6/9{mib2.}
    re4 r8 mib lab mib mib lab mib
    \tuplet 6/9{re2.}

    %110
    mib4. r r
    R1*9/8*3
    sib8\p mib sib sib mib sib sib mib sib %%%%%ripresa

    %115
    do\f mib do do mib do do mib do
    do\p fa do do fa do do fa do
    re\f fa re re fa re re fa re

    %118
    re\p sol re re sol re re sol re
    mib\f sol mib mib sol mib mib sol mib
    mib\p lab mib mib lab mib mib lab mib

    %121
    lab\f sib lab fa sol fa re mib re\mbreak
    lab sib lab fa sol fa re mib re
    mib4. r8 mib' sib sol fa mib

    %124
    sol,8 r r  r mib'' sib sol fa mib
    sib' 4. sib, re
    mib\fermata  r r

}

IIIvlIIn = \relative do'' {

    mib,8 mib' sib sol sib sol mib4.
    re8 fa re sib re sib lab4.
    sol8 mib' fa sol fa mib sol, r r

    %4
    mib'' sib lab sol fa mib sol, r r
    mib'' sib lab sol fa mib sol,4 la8
    \tuplet 6/9{sib2.}

    %7
    R1*9/8
    do'8 mib do lab do lab mib4.
    \tuplet 6/9{fa2.}\mbreak

    %10
    re'8 fa re sib re sib fa4.
    sol8\p sib sol sol sib sol sol sib sol
    lab\f do lab lab do lab lab do lab

    %13
    lab\p do lab lab do lab lab do lab
    sib\f re sib sib re sib sib re sib
    sib\p re sib sib re sib sib re sib

    %16
    do\f mib do do mib do do mib do
    do\p mib do do mib do do mib do
    fa\f sol fa re mib re sib do sib\mbreak

    %19
    fa sol fa re mib re sib do sib
    sol4. r8 mib'' sib sol fa mib
    sol,8 r r  r mib' 'sib sol fa mib

    %22
    sib' 4. sib, re
    mib r r %%%%%% fine ripresa
    R1*9/8*19

    %43
    sib8 sib' fa re fa re sib4.\mbreak
    la'8 do la fa la fa mib4.
    re8 sib' do re do sib re, r r

    %46
    re'8\p fa re re fa re re fa re
    mib\f sol mib mib sol mib mib sol mib
    mib\p sol mib mib sol mib mib sol mib

    %49
    fa\f sol fa la, sib la fa sol fa
    fa' sol fa la, sib la fa sol fa
    sib4. mib, fa\mbreak

    %52
    sib,4. r r
    R1*9/8*2
    fa'4. fa fa

    %56
    \tuplet 6/9{sol2.}
    sol4. sol sol
    \tuplet 6/9{la2.}

    %59
    la?4. la la\mbreak
    \tuplet 6/9{re2.}
    re4. r r

    %62
    R1*9/8*2
    mi,4. mi mi
    mi?  dod' dod

    %66
    la? la do?\mbreak
    sib4. r r
    sol8 sib sol sol sib sol sol sib sol

    %69
    sol\p sib sol sol sib sol sol sib sol
    sol\f do sol sol do sol sol do sol
    la\p do la la do la la do la

    %72
    sib\f re sib sib re sib sib re sib
    fa' sol fa re mib re sib do sib
    fa sol fa re mib re sib do sib\mbreak

    %75
    sol mib'' sib sol sib sol mib4 r8
    fa lab fa re fa re sib4 r8
    R1*9/8*6

    %83
    sol'8 sib sol sol sib sol sol sib sol
    sol4. r r
    do8 mib do do mib do do mib do

    %86
    la4. r r
    re8 fa re re fa re re fa re
    si4. r r

    %89
    mib8 sol mib mib sol mib mib sol mib\mbreak
    mib4. r r
    R1*9/8*2

    %93
    sol,8 sib sol sol sib sol sol sib sol
    sol4. r r
    R1*9/8*6

    %101
    re'8 fa re re fa re re fa re
    mib4 r8 mib sol mib mib sol mib
    \tuplet 6/9{do2.}

    %104
    do4 r8 lab' do lab lab do lab
    \tuplet 6/9{re,2.}\mbreak
    mib4 r8do mib do do mib do

    %107
    \tuplet 6/9{do2.}
    sol4 r8 lab do lab lab do lab
    \tuplet 6/9{lab2.}

    %110
    sol4. r r
    R1*9/8*3
    sol8\p sib sol sol sib sol sol sib sol

    %115
    lab\f do lab lab do lab lab do lab
    lab\p do lab lab do lab lab do lab
    sib\f re sib sib re sib sib re sib

    %118
    sib\p re sib sib re sib sib re sib
    do\f mib do do mib do do mib do
    do\p mib do do mib do do mib do

    %121
    fa\f sol fa re mib re sib do sib\mbreak
    fa sol fa re mib re sib do sib
    sol4. r8 mib'' sib sol fa mib

    %124
    sol,8 r r  r mib' 'sib sol fa mib
    sib' 4. sib, re
    mib\fermata r r

}

IIIvlan =  \relative do' {

    mib8 mib' sib sol sib sol mib4.
    re8 fa re sib re sib lab4.
    sol8 mib' fa sol fa mib sol, r r

    %4
    mib'' sib lab sol fa mib sol, r r
    mib'' sib lab sol fa mib sol,4 la8
    \tuplet 6/9{sib2.}

    %7
    sib'4. sol sol
    mib mib do
    do' la la\mbreak

    %10
    fa fa re
    mib8\p sol mib mib sol mib mib sol mib%%%%% ripresa
    mib\f lab mib mib lab mib mib lab mib

    %13
    fa\p lab fa fa lab fa fa lab fa
    fa\f sib fa fa sib fa fa sib fa
    sol\p sib sol sol sib sol sol sib sol

    %16
    sol\f do sol sol do sol sol do sol
    lab\p do lab lab do lab lab do lab
    re,4.\f re re\mbreak

    %19
    re fa, sib
    sib r8 mib' sib sol fa mib
    sol, r r r mib'' sib sol fa mib

    %22
    sib'4. sib, re
    mib r r %%%%%% fine ripresa
    R1*9/8*19

    %43
    sib8 sib' fa re fa re sib4.
    la'8 do la fa la fa mib4.
    re8 sib' do re do sib re, r r

    %46
    sib'8\p  re sib sib re sib sib re sib
    sib\f mib sib sib mib sib sib mib sib
    do\p mib do do mib do do mib do

    %49
    do4\f do8 fa,4 fa8 do4 do8
    do4 do8 do4 do8 do4 do8
    sib'4. mib, fa\mbreak

    %52
    sib,4. r r
    R1*9/8*2
    re4. re re

    %56
    \tuplet 6/9{si2.}
    sol4. sol sol
    \tuplet 6/9{mi'2.}

    %59
    la,4. la la\mbreak
    la? la la
    sib r r

    %62
    R1*9/8*2
    la?4. la la
    la sol' sol

    %66
    fad? fad! fad\mbreak
    re r r
    re8 sol re re sol re re sol re

    %69
    mib\p sol mib mib sol mib mib sol mib
    mib\f sol mib mib sol mib mib sol mib
    fa\p la fa fa la fa fa la fa

    %72
    fa\f sib fa fa sib fa fa sib fa
    re4. re re
    re re re\mbreak

    %75
    sib8 mib' sib sol sib sol mib4 r8
    fa lab fa re fa re sib4 r8
    R1*9/8*6\mbreak

    %83
    mib8 sol mib mib sol mib mib sol mib
    mib4. r r
    lab8 do lab lab do lab lab do lab

    %86
    la4. r r
    sib8 re sib sib re sib sib re sib
    si4. r r

    %89
    do8 mib do do mib do do mib do\mbreak
    do4. r r
    R1*9/8*2

    %93
    mib,8 sol mib mib sol mib mib sol mib
    mib4. r r
    R1*9/8*6

    %101
    sib'8 re sib sib re sib sib re sib
    sib4. sib sib
    sib sib sib

    %104
    lab lab lab
    lab lab lab\mbreak
    sol sol sol

    %107
    la la la
    sib mib, mib
    fa fa re

    %110
    sib r r
    R1*9/8*3
    mib8\p sol mib mib sol mib mib sol mib%%%%% ripresa

    %115
    mib\f lab mib mib lab mib mib lab mib
    fa\p lab fa fa lab fa fa lab fa
    fa\f sib fa fa sib fa fa sib fa

    %118
    sol\p sib sol sol sib sol sol sib sol
    sol\f do sol sol do sol sol do sol
    lab\p do lab lab do lab lab do lab

    %121
    re,4.\f re re\mbreak
    re fa, sib
    sib r8 mib' sib sol fa mib

    %124
    sol, r r r mib'' sib sol fa mib
    sib'4. sib, re
    mib\fermata r r

}

IIIfgn = \relative do {

    R1*9/8*22
    mib8 mib'  re mib, re' do mib, do' sib
    mib, sib' lab sol fa mib re do sib

    %25
    mib mib'  re mib, re' do mib, do' sib
    mib, sib' lab sol fa mib re do sib\mbreak
    mib4. r8 mib' re do sib lab

    %28
    sib4. r8 re do sib lab sol
    lab4. r8 do sib lab sol fa
    sol4. r8 sib lab sol fa mib

    %31
    re sib re mib sib mib fa sib, fa'
    sol sib, sol' lab sib, lab' sib sib, sib'
    do sib, do' re sib, re' mib sib, mib'

    %34
    la,4. r8 do sib la sol fa\mbreak
    mib4. r8 sol fa mib re do
    re4. r8 sib re fa re fa

    %37
    sib fa sib re sib re fa4. ~
    \tuplet 6/9 {
        fa8\p[(mib re do sib la)]
        sol[(fa mib re do sib)]

        %40
        fa'2.
    }
    re8\f sib' re, mib sib' mib, fa la fa
    sib, sib' re, mib sib' mib, fa la fa

    %43
    sib,8 r r r4. r\mbreak
    R1*9/8*8
    sib'8 re16 do sib lab? sol8 sib16 lab sol fa mib8 sol16 fa mib re

    %53
    do8 mib'16 re do sib la8 do16 sib la sol fa8 la16 sol fa mib
    re8 fa sib re, fa sib sib,4 r8
    \tuplet 6/9 {fa'2.}~

    %56
    fa8 sol lab! lab sol fa fa mib re
    mib8 r r sol2.~
    sol8 la sib sib la sol sol fad mi

    %59
    fad r r   do'2.~\mbreak
    do8 re mib mib re do do sib la
    sib4. r8 re16 do sib la sol8 la sib

    %62
    mib,4. r8 do'16 sib la sol fa?8 sol la
    re,4. r8 sib'16 la sol fa mib8 fa sol
    \tuplet 6/9 {dod,2.}~

    %65
    dod4 sib'8 sib(la?) sib sib(la) sol
    sol(fad) mib' mib(re) mib mib(re) do\mbreak
    sib8 re16 do sib la? sib8 do re re, mi fad

    %68
    sol,8 r r r4. r
    R1*9/8*8
    mib'8 mib' re mib, re' do mib, do' sib

    %78
    mib, mib' re mib, re' do mib, do' sib
    mib, sib' lab sib, lab' sol sib, sol' fa
    sib, sib' lab sib, lab' sol sib, sol' fa

    %81
    sib, mib re mib, re' do mib, do' sib
    mib, mib' re mib, re' do mib, do' sib\mbreak
    mib,4. r r

    %84
    mib'16 fa sol lab sib8 mib, fa sol sib, do reb
    do4. r r
    fa16 sol la sib do8 fa, sol la do, re mib

    %87
    re4. r r
    sol16 la si do re8 fa, sol lab? re, mib fa
    mib4. r r\mbreak

    %90
    lab16 sib do sib lab8 fa16 sol lab sol fa8 re16 mib fa mib re8
    sib sib' lab sib, lab' sol sib, sol' fa
    sib, sib' lab sib, lab' sol sib, sol' fa

    %93
    sib,4. r r
    sol8 mib' sol sol, mib' sol sol, mib' sol
    lab, mib' sol lab, mib' sol lab, mib' sol

    %96
    la, fa' la la, fa' la la, fa' la
    sib, fa' lab! sib, fa' lab sib, fa' lab\mbreak
    si, sol' si si, sol' si si, sol' si

    %99
    do, mib sol do, mib sol do, mib sol
    mib lab do mib, lab do mib, lab do
    re,4. r r

    %102
    r reb'2.~
    reb4. do8 reb do sib do sib
    \tuplet 6/9 {lab2.}~

    %105
    lab4. sol8 lab sol fa sol fa\mbreak
    mib4. mib'2.~
    mib4. re8 mib re do re do

    %108
    sib4. lab2.~
    lab8 sib lab re mib re fa, sol fa
    sol sib mib sol, sib mib sol, fa mib

    %111
    sol, mib' sol lab, mib' sol sib, re fa
    mib sib' mib sol, sib mib sol, fa mib
    sol, mib' sol lab, mib' sol sib, re fa

    %114
    mib,4. r r
    R1*9/8*11
    R1*9/8^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIIbcn = \relative do {

    mib8 mib' sib sol sib sol mib4.
    re8 fa re sib re sib lab4.
    sol8 mib' fa sol fa mib sol, r r

    %4
    mib'' sib lab sol fa mib sol, r r
    mib'' sib lab sol fa mib sol,4 la8
    \tuplet 6/9{sib2.}

    %7
    mib4. mib mib
    lab, lab lab
    fa' fa fa\mbreak

    %10
    sib ,sib sib
    mib\p r r %%%%% ripresa
    lab,8 lab' lab, lab lab' lab, lab lab' lab,

    %13
    lab4. r r
    sib8 sib' sib, sib sib' sib, sib sib' sib,
    sib4. r r

    %16
    do8 do' do, do do' do, do do' do,
    do4. r r
    sib sib sib\mbreak

    %19
    sib sib sib
    mib r8 mib' sib sol fa mib
    sol, r r r mib'' sib sol fa mib

    %22
    sib'4. sib, re
    mib mib mib %%%%%% fine ripresa
    mib mib sib

    %25
    mib mib mib
    mib mib sib\mbreak
    mib lab2.~

    %28
    lab8 sol fa sol2.~
    sol8 fa mib fa2.~
    fa8 mib re mib2.

    %31
    sib4. sib sib
    sib sib sib
    sib sib sib

    %34
    fa'8 la do fa,4. r\mbreak
    fa,8 lab do fa,4. r
    sib8 re fa sib,4. r

    %37
    sib sib' sib,
    \tuplet 6/9{
        re'8\p[(do sib la sol fa)]
        mib[(re do sib la sol)]
    }

    %40
    fa4. sol la
    sib\f mib fa
    sib, mib fa

    %43
    sib,8 sib' fa re fa re sib4.\mbreak
    la'8 do la fa la fa mib4.
    re8 sib' do re do sib re, r r

    %46
    R1*9/8
    mib,8 mib' mib, mib mib' mib, mib mib' mib,
    mib4. r r

    %49
    fa8 fa' fa, fa fa' fa, fa fa' fa,
    fa fa' fa, fa fa' fa, fa fa' fa,
    sib4. mib fa\mbreak

    %52
    sib,4 r8 sol'4 r8 mib4 r8
    do4 r8 la'4 r8 fa4 r8
    re4. sib sib

    %55
    sib sib sib
    \tuplet 6/9{si2.}
    do4. do do

    %58
    \tuplet 6/9{dod2.}
    re4. re re\mbreak
    \tuplet 6/9{re2.}

    %61
    sol,4. sol' r
    do, do' r
    sib, sib' r

    %64
    la,? la la
    la? dod dod
    re fad fad\mbreak

    %67
    sol sol, re'
    sol,8 sol' sol, sol sol' sol, sol sol' sol,
    sol4. r r

    %70
    mib'8 mib' mib, mib mib' mib, mib mib' mib,
    la,4. r r
    sib8 sib' sib, sib sib' sib, sib sib' sib,

    %73
    sib4. sib sib
    sib sib sib\mbreak
    mib8  mib' sib sol sib sol mib4 r8

    %76
    fa lab fa re fa re sib4 r8
    mib4. mib mib
    mib mib mib

    %79
    mib sib sib
    sib sib sib
    sib mib, mib

    %82
    mib mib mib\mbreak
    mib' mib mib
    mib, mib mib

    %85
    lab lab lab
    fa fa fa
    sib sib sib

    %88
    sol sol sol
    do do do\mbreak
    do r r

    %91
    sib sib sib
    sib sib sib
    mib mib mib

    %94
    mib sol, sol
    lab lab lab
    la la la

    %97
    sib sib sib\mbreak
    si si si
    do do do

    %100
    do do do
    sib? sib sib
    mib mib mib

    %103
    mi mi mi
    fa fa fa
    si, si si\mbreak

    %106
    do do do
    fad fad fad
    sol do, do

    %109
    sib ?sib sib
    mib mib mib
    sol, lab sib

    %112
    mib, mib' mib
    sol, lab sib
    mib, r r

    %115
    lab8 lab' lab, lab lab' lab, lab lab' lab,
    lab4. r r
    sib8 sib' sib, sib sib' sib, sib sib' sib,

    %118
    sib4. r r
    do8 do' do, do do' do, do do' do,
    do4. r r

    %121
    sib sib sib\mbreak
    sib sib sib
    mib r8 mib' sib sol fa mib

    %124
    sol, r r r mib'' sib sol fa mib
    sib'4. sib, re
    mib\fermata r r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mib\major
    \time 9/8
    \tempo 2. = 50
    s4.*3*126
    \bar"|."

}

IIIvlI = {
    \IIIglobal
    %\notypeset
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

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] Presto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"primo]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"secondo]"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto"}
            \Ifg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[2.] Larghetto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

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

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[3.] All[egr]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

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

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
