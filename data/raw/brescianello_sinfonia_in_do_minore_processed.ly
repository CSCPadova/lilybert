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

    do4 sol16 fa mib re do8 do do do'
    do, do do do' do, do do re16 mib
    fa8 fa fa fa si fa fa fa

    %4
    si fa fa fa re' fa, fa fa
    fa' sol16 lab sol(fa) mib(re) mib re do8 r4
    mib8 mib mib mib mib fa16(sol) lab sol fa mib

    %7
    re8 re re re re mib16(fa) \mbreak sol fa mib re
    do8 do do do do re16(mib) fa(mib) re(do)
    do8 sib4 mib8 lab,16(sol) lab4 fa'8

    %10
    sol,16(fa) sol4 mib'8 \grace sol,8 fa4. sol16 lab?
    lab8 fa16 sol lab8 lab re fa,16 sol lab8 lab
    fa' fa,16 sol lab8 lab lab' sol16(fa) sol8 lab

    %13
    sol4 fa\tr mib sib16 lab sol fa\mbreak   %% fine seconda riga
    mib8 mib mib mib' mib, mib mib mib'
    mib, mib mib fa16 sol lab8 lab lab lab

    %16
    re lab lab lab re lab lab lab
    fa' lab, lab lab lab' sib16 do sib lab sol fa
    sol(fa) mib(re) mib4 r8 sol(lab sib)

    %19
    r sol(lab sib) r sol (lab sib)
    lab sol lab4 r8 la sib do\mbreak
    r la sib do r la sib do

    %22
    sib re4 do16 sib la8 do4 sib16 la
    sib8 re4 do16 sib la8 do4 sib16 la
    sib8 la16 sol la8 mi sol4 fad\tr

    %25
    sol4 re16 do sib la sol8 sol sol sol'
    sol, sol sol sol' sol, sol sol la16 sib
    do8 do do do fad do do do\mbreak

    %28
    la' do, do do fad do do do
    la' sib16 do sib8 la sib re, sol4~
    sol8 lab16 sib lab8 sol lab re, fa4~

    %31
    fa8 sol16 lab sol8 fa mi4 r8 do
    fa16 do do do do do do do fa do do do sol' do, do do
    lab' sib lab sol fa mib re do\mbreak re sib sib sib sib sib sib sib

    %34
    mib sib sib sib fa' sib, sib sib sol' lab sol fa mib reb do sib
    do lab lab  lab lab lab lab lab reb lab lab lab mib' lab, lab lab
    fa' reb reb reb mib do do do reb sib sib sib do lab lab lab

    %37
    sib8 mib, r sib'\mbreak do do4 sib16 lab
    sib8 reb4 do8 reb reb4 do16 sib
    do8 mib4 re!8 mib mib4 re16 do

    %40
    re8 sol4 fa16 mib re8 sol4 fa16 mib
    re8 sol, fa mib re sol fa mib
    re4 sol, do' sol16 fa mib re

    %43
    do8 do do do' do, do do do'\mbreak
    do, do do re16 mib fa8 sol16 lab sol8 fa
    mib do r4 mib' sib16 lab sol fa

    %46
    mib8 mib mib mib' mib, mib mib mib'
    mib, mib mib fa16 sol lab8 sib16 do sib8 lab
    sol mib r sol do do4 sol8

    %49
    lab fa4 fa8 re' re4 la8\mbreak
    sib sol4 sol8 mib' mib4 sib8
    do lab4 lab8 fa' fa4 do8

    %52
    re sib4 sib8 sol' sol4 re8
    mib do4 sol'8 lab16 lab lab lab fa fa fa fa
    re re re re sib sib sib sib sol' sol sol sol mib mib mib mib

    %55
    do do do do lab lab lab lab\mbreak fa' fa fa fa re re re re
    si si si si sol sol sol sol mib' mib mib mib do do do do
    lab lab lab lab fa fa fa fa re' re re re do do do do

    %58
    si sol la? si do8 mib, re do' sol,[si']
    fa2.   %% Adagio
    fad4 fad fad

    %61
    sol2.\mbreak
    mib16(sol) do(sol) mib[(sol) do(sol)] mib sol do sol mib [sol do sol]  %% Allegro
    re sol do sol re [sol do sol] re sol do sol re [sol do sol]

    %64
    re sol si sol re [sol si sol] re sol si sol re [sol si sol]
    do8 sol'16 fa mib8 [re] mib sol,16 fa mib8[re]
    mib sol'16 fa mib8[re]\mbreak mib[sol,16 fa] mib8 re

    %67
    do'4 si do8[mib,] re si'
    do,4\fermata mib'8.[mib16 mib8. mib16] %% Andante
    mib8.[mib16 mib8. mib16 mib8. mib16]

    %70
    mib2.
    fa8.[fa16 fa8. fa16 fa8. fa16]
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %73
    fa2 r4
    \parenthesize mi2.
    mib!2.\mbreak

    %76
    re
    reb
    do4 re! mib~

    %79
    mib re do~
    do si la
    si2.

}

IvlIIn = \relative do'' {

    do4 sol16 fa mib re do8 do do do'
    do, do do do' do, do do re16 mib
    fa8 fa fa fa si fa fa fa

    %4
    si fa fa fa re' fa, fa fa
    fa' sol16 lab sol(fa) mib(re) mib re do8 r4
    r8 sol do4 r8 mib do lab
    sib fa sib4 r8 re sib sol
    lab mib lab4 r8 do lab fa\mbreak
    r sib, mib4 r8 do re4
    r8 sib mib sol \grace mib re4. re16 mib
    fa8 re16 mib fa8 fa lab re,16 mib fa8 fa
    re' re,16 mib fa8 fa fa' mib16 re mib8 fa\mbreak
    mib4 re mib sib16 lab sol fa
    mib8 mib mib mib' mib, mib mib mib'
    mib, mib mib fa16 sol lab8 lab lab lab

    %16
    re lab lab lab re lab lab lab
    fa' lab, lab lab lab' sib16 do sib lab sol fa
    sol(fa) mib(re) mib4 r8 mi(fa sol)

    %19
    r mi(fa sol) r mi(fa sol)
    fa mi fa4 r8 fad(sol la)
    r fad(sol la)\mbreak r fad(sol la)
    sol sib4 la16(sol) fad8 la4 sol16(fad)
    sol8 sib4 la16(sol) fad8 la4 sol16(fad)
    sol8 re mib do sib4 la
    sol' re16 do sib la\mbreak sol8 sol sol sol'
    sol, sol sol sol' sol, sol sol la16 sib
    do8 do do do fad do do do\mbreak

    %28
    la' do, do do fad do do do
    la' sib16 do sib8 la sib re, sol4~
    sol8 lab16 sib lab8 sol lab re, fa4~

    %31
    fa8 sol16 lab sol8 fa mi4 r8 do
    fa16 do do do do do do do fa do do do sol' do, do do
    lab' sib lab sol fa mib re do\mbreak re sib sib sib sib sib sib sib

    %34
    mib sib sib sib fa' sib, sib sib sol' lab sol fa mib reb do sib
    do lab lab  lab lab lab lab lab reb lab lab lab mib' lab, lab lab
    fa' reb reb reb mib do do do reb sib sib sib do lab lab lab

    %37
    sib8 mib, r sol lab lab4 sol16(fa)
    sol8 sib4 la!8 sib sib4 la16 sol
    la8 do4 si8\mbreak do do4 si16 la

    %40
    si8 mib4 re16 do si8 mib4 re16 do
    si8 mib, re do sib! mib re do
    \parenthesize sib4 \parenthesize sol do' sol16 fa mib re

    %43
    do8 do do do' do, do do do'\mbreak
    do, do do re16 mib fa8 sol16 lab sol8 fa
    mib do r4 mib' sib16 lab sol fa

    %46
    mib8 mib mib mib' mib, mib mib mib'
    mib, mib mib fa16 sol lab8 sib16 do sib8 lab
    sol mib r sol do do4 sol8

    %49
    lab fa4 fa8 re' re4 la8\mbreak
    sib sol4 sol8 mib' mib4 sib8
    do lab4 lab8 fa' fa4 do8

    %52
    re sib4 sib8 sol' sol4 re8
    mib do4 sol'8 lab16 lab lab lab fa fa fa fa
    re re re re sib sib sib sib sol' sol sol sol mib mib mib mib

    %55
    do do do do lab lab lab lab\mbreak fa' fa fa fa re re re re
    si si si si sol sol sol sol mib' mib mib mib do do do do
    lab lab lab lab fa fa fa fa re' re re re do do do do

    %58
    si sol la? si do8 mib, re do' sol,[si']
    fa2.   %% Adagio
    fad4 fad fad

    %61
    sol2.\mbreak
    mib8 mib mib mib mib mib mib mib
    re re re re re re re re

    %64
    sol sol sol sol sol sol sol sol
    mib mib'16 re do8 [si]\mbreak do mib,16 re do8 [si]
    \once\stemUp do mib'16 re do8 [si] do mib,16 re do8 [si]

    %67
    mib4 re do si
    do4\fermata do'8.[do16 do8. do16]
    do8.[do16 do8. do16  do8. do16]\mbreak

    %70
    do2.
    reb8.[reb16 reb8. reb16 reb8. reb16]
    re!8.[re16 re8. re16 re8. re16]

    %73
    re2 r4
    sol,2.
    do

    %76
    fa,
    sib\mbreak
    mib,4 fa sol

    %79
    la2.~
    la4 sol fad
    sol2.

}

Ivlan = \relative do' {

    mib4 re8 sol, do sib lab sol
    do sib lab sol do sib lab sol
    fa mib re do re si'16 do re8 do

    %4
    re si16 do re8 do si si16 do re8 do
    si si si si sol4 r
    do'8 do, do do' do4 r

    %7
    sib8 sib, sib sib' sib4 r
    lab8 lab, lab lab' lab4 r\mbreak
    sol8 sol, sol sol' fa fa, fa fa'

    %10
    mib mib, mib mib' sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib r sib mib lab,

    %13
    sib4 sib sol' fa8 sib,
    mib re do sib mib re do sib
    mib re do sib lab sol fa mib

    %16
    fa re'16 mib fa8 mib fa re16 mib fa8 mib
    re re16 mib fa8 mib\mbreak re mib fa re
    sib4 r do8 do do do

    %19
    do, do' do do do, do' do do
    fa, fa fa fa re re' re re
    re, re' re re re, re' re re

    %22
    sol, sol' sol sol re, re' re re
    sol, sol' sol sol re, re' re re
    sib4 do re re,\mbreak

    %25
    sib'8 sib' la re, sol fa mib re
    sol fa mib re sol fa mib re
    do do'16 sib la8 sol la fad16 sol la8 sol

    %28
    fad fad16 sol la8 sol la fad16 sol la8 sol
    fad16 fad fad fad fad fad fad fad re re re re sib' sib sib sib
    sol sol sol sol mi mi mi mi\mbreak do do do do lab' lab lab lab

    %31
    fa fa fa fa reb reb reb reb sol, sol' sol sol  sol sol sol sol
    do,4 r do do
    do8 do'16 sib lab8 lab fa4 r

    %34
    sib, sib sib8 sib'16 lab sol8 sol
    mib4 r lab lab
    lab? lab sol8 sib mib, lab

    %37
    sol mib mib mib\mbreak mib mib mib mib
    mib mib fa fa fa fa fa fa
    fa fa sol sol sol sol sol sol

    %40
    sol sol sol sol sol sol sol sol
    sol4 r sol, r
    sol sol'16 fa mib re mib4 re8 sol,

    %43
    do sib lab sol do sib lab sol
    do sib lab sol fa mib' re si\mbreak
    sol mib' re mib16 fa sol4 fa8 sib,

    %46
    mib re do sib mib re do sib
    mib re do sib do sol' fa re
    sib sib sib sib sol'16 sol sol sol mi mi mi mi

    %49
    do do do do do do do do la' la la la fad fad fad fad
    re re re re re re re re sib' sib sib sib sol sol sol sol\mbreak
    mib mib mib mib mib mib mib mib do' do do do la la la la

    %52
    fa fa fa fa fa fa fa fa re' re re re si si si si
    sol sol sol sol mib mib mib mib do4 lab'
    fa re sib sol'

    %55
    mib do lab fa'
    re si sol mib'
    do lab lab' fa\mbreak

    %58
    re4 sol fa16 mib re do si8 re
    do2.
    do4 do do

    %61
    si2.
    do8 do do do do do do do
    do do do do do do do do

    %64
    si si si si si si si si
    sol4 r8 sol sol4 r8 sol
    sol4 r8 sol' sol4 r8 sol

    %67
    sol4 sol sol, sol\mbreak
    mib\fermata la'!8.[la16 la8. la16]
    lab8.[lab16 lab8. lab16 lab8. lab16]

    %70
    la!2.
    sib8.[sib16 sib8. sib16 sib8. sib16]
    sib8.[sib16 sib8. sib16 sib8. sib16]

    %73
    si2 r4
    sib!2.
    la

    %76
    lab
    sol~
    sol4 fa mib8. re16

    %79
    do4 re mib
    re2.
    re

}


Ibcn = \relative do {

    do'4 sib lab8 sol fa mib
    lab sol fa mib lab sol fa mib
    re do si la sol re'16 do si8 la

    %4
    sol re'16 do si8 la sol re'16 do si8 la
    sol sol sol sol do4 do,
    R1*7

    %13
    r2 mib''4 re
    do8 sib lab sol do sib lab sol
    do sib lab sol fa mib re do\mbreak

    %16
    sib8 fa'16 mib re8 do sib fa'16 mib re8 do
    sib fa'16 mib re8 do sib do re sib
    mib4 mib, r2

    %19
    R1*6
    sol'4 fa mib8 re do sib
    mib re do sib mib re do sib

    %27
    la la'16 sol fad8 mi re la'16 sol fad8 mi
    re la'16 sol fad8 mi re la'16 sol fad8 mi
    re re re re sol sib16 lab sol8 fa?\mbreak

    %30
    mi do do do fa lab16 sol fa8 mi
    reb4 sib do16 do' do do sib sib sib sib
    lab4 r lab mi

    %33
    fa r sib r
    sol re mib r
    lab r fa do

    %36
    reb8 reb' do lab sib sol lab lab,
    mib'4 r r2
    R1*4

    %42
    r2 do'4 sib
    lab8 sol fa mib lab sol fa mib\mbreak
    lab sol fa mib re do si la

    %45
    do do' sib16 lab sol fa mib4 re
    do8 sib lab sol do sib lab sol
    do' sib lab sol fa mib re sib

    %48
    mib mib mib mib mi16 mi mi mi do do do do
    fa fa fa fa lab lab lab lab fad fad fad fad re re re re
    sol sol sol sol sib sib sib sib\mbreak sol sol sol sol mib mib mib mib

    %51
    lab lab lab lab do do do do la la la la fa fa fa fa
    sib sib sib sib re re re re si si si si sol sol sol sol
    do do do do do, do do do fa8 fa4 fa8

    %54
    sib sib4 sib,8 mib mib4 mib8
    lab lab4 lab,8 re re4 re8\mbreak
    sol sol4 sol,8 do do4 do8

    %57
    fa fa4 fa,8 fa'4 lab
    sol8 fa mib do fa sol16 lab sol8 sol,
    lab2.   %% Adagio

    %60
    la4 la la
    sol2.
    sol8 sol sol sol sol sol sol sol %% Allegro

    %63
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    do,4 r8 sol' do4 r8 sol

    %66
    do4. sol'8 do4. sol8
    do4 sol \mbreak mib8 re16 do sol'8 sol,
    do4\fermata lab'8.[lab16 lab8. lab16]

    %69
    solb8.[solb16 solb8.  solb16 solb8.  solb16]
    fa2 r4
    sib8.[sib16 sib8. sib16 sib8. sib16]

    %72
    lab8.[lab16 lab8. lab16 lab8. lab16]
    sol2 r4
    do8.[do16 do8. do16 do8. do16]

    %75
    fa,8.[fa16 fa8. fa16 fa8. fa16]
    sib8.[sib16 sib8. sib16 sib8. sib16]\mbreak
    mib,8.[mib16 mib8. mib16 mib8. mib16]

    %78
    lab8.[lab16 lab8. lab16 lab8. lab16]
    fad8.[fad16 fad8. fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16 re8. re16]

    %81
    sol,2.

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 60
    \once \override Score.RehearsalMark.extra-offset = #'(+2 . +1)
    \mark\markup\huge "Allegro"
    s1*58\break
    \time 3/4
    \tempo 4 = 50
    \override Score.RehearsalMark.extra-offset = #'(+2 . +1)
    \mark\markup\huge "Adagio"
    s2.*3
    \time 2/2
    \tempo 2 = 67
    \override Score.RehearsalMark.extra-offset = #'(+5  . -2)
    \mark\markup\huge "Allegro"
    s1*6
    \time 3/4
    \tempo 2 = 50
    \override Score.RehearsalMark.extra-offset = #'(+5 . -2)
    \mark\markup\huge "[Andante]"
    s2.*14
    \bar"||"
    \override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup\center-column {
        "DC al" \musicglyph "scripts.ufermata"
    }

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
}

IIvlIn = \relative do'' {

    sol8
    do mib (re do) lab'4 sol
    sol,8 fa16 mib re8 do sol4 r8 sib'
    mib sol(fa mib) do'4 sib

    %4
    sib,8 lab16 sol fa8 mib sib4 r8 sib'
    re sib mib sib fa' sib, sol' sib,
    lab'4 sol fa r8 sib,,

    %7
    re sib mib sib fa' sib, sol' sib,
    lab'4 sol fa r8 sib'
    do do4 sib16 lab sib8 sib4 mib,8\mbreak

    %10
    lab lab4 sol16 fa sol8 sol4 fa16 mib
    fa8 fa4 sol16 lab sol8 sol4 fa16 mib
    fa8 fa4 sol16 lab sib8 lab16 sol fa8 mib

    %13
    \appoggiatura {re16[mib]} fa2\tr mib4 r8 sib\p
    do do4 sib16 lab\mbreak sib8 sib4 mib,8
    lab lab4 sol16 fa sol8 sol4 fa16 mib

    %16
    fa8 fa4 sol16 lab sol8 sol4 fa16 mib
    fa8 fa4 sol16 lab sib8 do16 re mib8 mib,
    \appoggiatura {re16[mib]} fa2\tr mib4 r8 sib'

    %19
    mib8 sol\parenthesize ( fa mib) reb'4 do
    lab8 sol16 lab sib8 sol \grace fa8 mi4. do8
    sol' do, lab' do, sib' mi, fa sib

    %22
    lab4 sol fad r8 re
    la'! re, sib' re,\mbreak do' fad, sol do
    sib4 la sol4. re8

    %25
    mib sol4 fa16 mib re8 sol4 re8
    mib sol4 fa16 mib re4 r8 sol,
    lab lab4 la8 sib sib4 si8\mbreak

    %28
    do do4 re8 mib mib4 fa8
    sol la16 si do8 lab sol si, do fa
    mib4 re do r8 sol\p

    %31
    lab lab4 la8 sib sib4 si8
    do do4 re8\mbreak mib mib4 fa8
    sol la16 si do8 lab sol si, do fa,

    %34
    mib4 re do r8

}

IIvlIIn = \relative do'' {

    r8 r4 r8 do fa4 mib
    sol,8 fa16 mib re8 do sol4 r
    r r8 mib'' lab4 sol

    %4
    sib,8 lab16 sol fa8 mib sib4 r
    r r8 sib' re sib mib sib
    fa'4 mib re r

    %7
    r r8 sib, re sib mib sib
    fa'4 mib re r8 sib''\mbreak
    do do4 sib16 lab sib8 sib4 mib,8

    %10
    lab lab4 sol16 fa sol8 sol4 fa16 mib
    re8 re4 mib16 fa mib8 mib4 fa16 sol
    re8 re4 mib16 fa sib,4. do8

    %13
    sib4 sib sol r8 sib\parenthesize \p
    do do4 sib16 lab sib8 sib4 mib,8
    lab lab4 sol16 fa\mbreak sol8 sol4 fa16 mib

    %16
    re8 re4 mib16 fa mib8 mib4 fa16 sol
    re8 re4 mib16 fa sol8 fa mib4
    mib re mib r8 r

    %19
    r2 sib''4 mi,
    fa8 do reb sib \appoggiatura lab8 sol4 r
    mi' fa sol8 mi fa4~

    %22
    fa mib! re r\mbreak
    fad4 sol la8 fad sol4~
    sol fad sol r8 si,

    %25
    do mib4 re16 do si8 si~si16 re do si
    do8 mib4 re16 do si4 r8 sol
    lab lab4 la8 sib sib4 si8

    %28
    do do4 re8 mib mib4 fa8\mbreak
    sol8 la16 si do8 lab sol si, do4~
    do si do r8 sol\p

    %31
    lab lab4 la8 sib sib4 si8
    do do4 re8 mib mib4 fa8
    sol la16 si do8 lab sol si, do do,

    %34
    do4 si do r8

}

IIvlan = \relative do' {

    r8
    R1
    sol'8 fa16 mib re8 do sol4 r
    R1

    %4
    sib'8 lab16 sol fa8 mib sib4 r
    R1
    r2 sib'4 sib,

    %7
    R1
    r2 r4 r8 sol'
    mib mib fa fa fa mib16 re mib8 sol

    %10
    do, do re re sib4 sib
    sib sib sib sib
    sib sib sib4. mib8

    %13
    mib4 re sib r8 sol'\parenthesize \p\mbreak
    mib mib fa fa fa mib16 re mib8 sib
    do do re re la4 sib

    %16
    sib sib sib sib
    sib sib mib,4. do'8
    sib4 sib sol r8 r

    %19
    R1
    do4 reb do r
    r2 r8 do' lab reb

    %22
    do4 do la r
    r2 r8 re? sib mib
    re4 re si8 sol sol,4

    %25
    r8 sol' do4\mbreak r8 re, sol4
    r8 sol do4 r8 re, sol mib
    do4 do fa re

    %28
    sol sol sol si,
    do4. do8 do fa mib lab
    sol4 sol mib4. mib8\parenthesize \p

    %31
    do4 do fa re
    sol sol sol si,
    do4. do8 do fa, mib lab

    %34
    sol4 sol mib r8

}


IIbcn = \relative do {

    r8
    R1
    sol'8 fa16 mib re8 do sol4 r
    R1

    %4
    sib'8 lab16 sol fa8 mib sib2
    R1*3
    r2 sib'4 sib,8 mib

    %9
    lab lab lab lab sol sol sol sol
    fa fa sib, sib mib mib mib mib\mbreak
    r sib sib sib r mib mib mib

    %12
    r sib' sib lab sol4. la8
    sib4 sib, mib4. mib8\parenthesize \p
    lab lab lab lab sol sol sol sol

    %15
    fa fa sib, sib mib mib mib mib
    r sib sib sib r mib mib mib\mbreak
    r sib sib lab sol4. lab8

    %18
    sib4 sib mib,4 r8 r
    R1
    fa'4 sib, do r

    %21
    r2 r8 do' reb sib
    do4 do, re? r
    r2 r8 re' mib do\mbreak

    %24
    re4 re, sol sol
    sol sol sol sol
    sol sol sol8 re sol, do

    %27
    fa fa mib mib re re sol sol
    mib mib si si do do re re
    mib4. fa8 mib re do fa,

    %30
    sol4 sol\mbreak do4. do8\parenthesize \p
    fa fa mib mib re re sol sol
    mib mib si si do do re re

    %33
    mib4. fa8 mib re do fa
    sol4 sol, do r8

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 45
    \once \override Score.RehearsalMark.extra-offset = #'(+2 . +1)
    \mark\markup\huge "Aria"
    \partial 8 s8
    s1*17
    s2 s4 s8
    \bar ":..:"\break
    s
    s1*15
    s2 s4 s8
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
}

IIIvlIn = \relative do'' {

    sol'4(mib) si
    do sol lab
    fa sol8 lab sol fa

    %4
    mib4 re8 mib do4
    mib' re do
    sib lab8 sol fa mib

    %7
    lab4 fa2
    mib2. mib
    mib8(sol) sib4 sib

    %10
    sib8(do) reb4 do
    fa,8(lab) do4 do
    do8 \parenthesize (re?) mib4 re\mbreak

    %13
    si8 (do) re4 fa,
    mib sol do
    si8(do) re4 fa,

    %16
    mib sol do
    si8(do ) re4 fa,
    mib sol do

    %19
    re4 si2\tr
    do2.

    %% Trio
    mi2 fa4

    %22
    sol mi la
    sol2 fa4
    sol2 fa4

    %25
    mi2 re4
    sol do, fa
    mi fa re

    %28
    do2.
    re2 mi4
    re si do\mbreak

    %31
    re2 mi4
    re2 do4
    si2 la4

    %34
    re do si
    la4. sol8 la4
    sol2.

    %37
    mi'2 fa4
    sol mi la
    sol2 fa4

    %40
    sol2 fa4\mbreak
    mi2 re4
    sol fa mi

    %43
    re4. do8 re4
    do2.

}

IIIvlIIn = \relative do'' {

    sol'4 mib si
    do sol lab
    fa sol8 lab sol fa

    %4
    mib4 re8 mib do4
    mib' re do
    sib lab8 sol fa mib\mbreak

    %7
    fa4 \grace mib8 re2
    mib2. mib
    sol

    %10
    sol
    lab
    la!

    %13
    sol4 fa re
    mib mib mib
    fa fa re\mbreak

    %16
    mib mib mib
    fa fa re
    mib2 mib4

    %19
    fa re sol
    mib2.

    %% Trio
    do'2 re4

    %22
    mi do fa
    mi2 fa4\mbreak
    mi2 re4

    %25
    do2 si4
    do2 do4
    do re si

    %28
    do2.
    si2 do4
    si sol la

    %31
    si2 do4\mbreak
    si2 la4
    sol2 fad4

    %34
    si la sol
    sol2 fad4
    sol2.

    %37
    do2 re4
    mi do fa
    mi2 fa4

    %40
    mi2 re4\mbreak
    do2 si4
    mi re do

    %43
    do2 si4
    do2.

}

IIIvlan = \relative do' {

    mib2 fa4
    sol2 do,4
    do si4. si8

    %4
    sol2.
    do'4 sib lab
    sol2.

    %7
    do,4 sib lab
    sol2. sol
    mib'

    %10
    mi
    fa
    fad

    %13
    re4 re si
    do do do
    re re si

    %16
    sol2 lab4
    lab? sol4. sol8
    sol2.

    %19
    lab4 sol4. sol8
    sol2.

    %% Trio
    sol'2 fa4

    %22
    mi2 re4
    mi8 fa sol4 la
    sol2.

    %25
    sol
    sol2 la4
    sol2 sol4

    %28
    mi2.
    sol2 do,4
    sol'2.

    %31
    sol2 do,4
    re2.
    re

    %34
    re2 mi4
    la,2 re4
    si2.

    %37
    sol'2 fa4
    mi2 re4
    mi8 fa sol4 la

    %40
    sol2.
    sol
    sol2 la4

    %43
    re,2 sol4
    mi2.

}


IIIbcn = \relative do {

    do2 re4
    mib2 fa4
    re sol sol,

    %4
    do2.
    do'4 sib lab
    sol2 do4

    %7
    lab sib sib,
    mib4. fa8 mib re mib2.
    mib4 mib mib\mbreak

    %10
    do do do
    fa fa fa
    re re re

    %13
    sol2.
    sol
    sol

    %16
    sol2 sol,4
    sol'2 sol,4
    do2 lab4

    %19
    fa sol sol
    do2.\mbreak
    do

    %22
    do
    do
    do2 sol'4

    %25
    do2 sol4
    mi2 fa4
    sol2 sol,4

    %28
    do mi sol
    sol,2.
    sol

    %31
    sol
    sol2 re'4\mbreak
    sol2 re4

    %34
    si2 do4
    re2 re,4
    sol sol'8 fa mi re

    %37
    do2.
    do
    do

    %40
    do
    do'2 sol4
    mi2 fa4

    %43
    sol2 sol,4
    do2.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key sib\major
    \tempo 2. = 60
    \once \override Score.RehearsalMark.extra-offset = #'(+5 . -1)
    \mark\markup\huge "Menuet alternat[ivement]"
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}\break
    \bar ".|:"
    \set Score.currentBarNumber = #9
    s2.*12
    \bar":|."\break
    \key do\major
    \once \override Score.RehearsalMark.extra-offset = #'(+2 . +1)
    \mark\markup\huge "Trio"
    s2.*8
    \bar ":..:"%\break
    s2.*16
    \bar":|."
    \mark\markup\center-column {"Menuet"\vspace # +0.1"D. C."}

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
}

IVvlIn = \relative do'' {

    do4 si
    do sol do re
    mib re mib fa
    sol fa8 mib re4 do

    %4
    si2 do4 si
    do  sol do re
    mib re\mbreak sol fa

    %7
    mib re8 do re4 si
    do2 mib4 si
    do re8 mib fa4 do

    %10
    re sib! sol' re
    mib fa8 sol lab4 mib
    fa re sib' fa\mbreak

    %13
    sol sol8 lab sib4 re,
    mib mib8 fa sol4 sib,
    do re8 mib fa,4 re'

    %16
    mib,2 do'4 si
    do sol do re
    mib re mib fa\mbreak

    %19
    sol fa8 mib re4 do
    si2 do4 si
    do sol do re

    %22
    mib re sol fa
    mib re8 do re4 si
    do2 do4 mib

    %25
    re sol, fad do'\mbreak
    do sib mib do
    re do8 sib la4 sol

    %28
    fad2 fad'4 la
    do, do la' do,
    do sib sol' mib

    %31
    re do8 sib la4 sol8 fad
    sol2 sib4 sib\mbreak
    sol' sib, sib sib

    %34
    \grace sib8 la2 lab4 lab
    fa' lab, lab lab
    \grace lab?8 sol2 do4 si

    %37
    do sol do re
    mib re mib fa
    sol fa8 mib re4 do

    %40
    si2 do4 si
    do  sol do re
    mib re\mbreak sol fa

    %43
    mib re8 do re4 si
    do2\fermata r

}

IVvlIIn = \relative do'' {

    do4 si
    do sol do re
    mib re mib fa
    sol fa8 mib re4 do

    %4
    si2 do4 si
    do  sol do re
    mib re\mbreak sol fa

    %7
    mib re8 do re4 si
    do2 mib4 si
    do re8 mib fa4 do

    %10
    re sib! sol' re
    mib fa8 sol lab4 mib
    fa re sib' fa\mbreak

    %13
    sol sol8 lab sib4 re,
    mib mib8 fa sol4 sib,
    do re8 mib fa,4 re'

    %16
    mib,2 do'4 si
    do sol do re
    mib re mib fa\mbreak

    %19
    sol fa8 mib re4 do
    si2 do4 si
    do sol do re

    %22
    mib re sol fa
    mib re8 do re4 si
    do2 do4 mib

    %25
    re sol, fad do'\mbreak
    do sib mib do
    re do8 sib la4 sol

    %28
    fad2 fad'4 la
    do, do la' do,
    do sib sol' mib

    %31
    re do8 sib la4 sol8 fad
    sol2 sib4 sib\mbreak
    sol' sib, sib sib

    %34
    \grace sib8 la2 lab4 lab
    fa' lab, lab lab
    \grace lab?8 sol2 do4 si

    %37
    do sol do re
    mib re mib fa
    sol fa8 mib re4 do

    %40
    si2 do4 si
    do  sol do re
    mib re\mbreak sol fa

    %43
    mib re8 do re4 si
    do2\fermata r

}

IVvlan = \relative do' {

    r2
    r mib4 sol
    sol si sol si,
    do2 lab'

    %4
    re, r
    r mib4 sol
    sol si, mib sib

    %7
    do mib fa  re
    mib2. mib4
    mib2 r

    %10
    fa4 fa r sol
    sol2 r4 lab
    lab?2 r4 sib

    %13
    sib2 r4 sib
    sol2 r4 sol
    mib do sib sib

    %16
    sol2 r
    r mib'4 sol\mbreak
    sol si sol  si,

    %19
    do2 lab'
    re, r
    r mib4 sol

    %22
    sol si, mib si
    do mib fa re
    mib2 mib4 do

    %25
    re2 do
    re do
    sol' mib

    %28
    re la'4 fad
    sol2 re
    re mib4 re8 do

    %31
    re4 mib la, re
    sib2 r
    sol' mi\mbreak

    %34
    do r
    fa re
    sib r

    %37
    r mib4 sol
    sol si sol si,
    do2 lab'

    %40
    re, r
    r mib4 sol
    sol si, mib sib

    %43
    do mib fa  re
    mib2\fermata r

}


IVbcn = \relative do {

    r2
    r do'4 si
    do si? do,re
    mib2 fa

    %4
    sol r
    r do4 si
    do sol do, re

    %7
    mib lab fa sol
    do,2. sol'4
    lab2 r4 lab\mbreak

    %10
    sib2 r4 sib,
    do2 r4 do
    re2 r4 re

    %13
    mib2 r4 sib'
    do2 r4 sol
    lab2 sib

    %16
    mib, r
    r do'4 si
    do sol do, re

    %19
    mib2 fa\mbreak
    sol r
    r do4 si

    %22
    do sol do, re
    mib lab fa sol
    do,2 do'

    %25
    sib la
    sol la
    sib do

    %28
    re re,
    mi fad\mbreak
    sol mib!

    %31
    sib4 do re re,
    sol2 r
    mi' do

    %34
    fa r
    re sib
    mib r

    %37
    r do'4 si
    do si? do,re
    mib2 fa

    %40
    sol r
    r do4 si
    do sol do, re

    %43
    mib lab fa sol
    do,2\fermata r

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \key sib\major
    \tempo 1 = 60
    \once \override Score.RehearsalMark.extra-offset = #'(+2 . +1)
    \mark\markup\huge "Bourrée"
    \partial 2 s2
    s1*44
    \bar"|."

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
}

VvlIn = \relative do'' {

    do16 si do re mib fa
    sol8 do,4
    si8 si do

    %4
    re re mib
    mib\tr re16 do re8
    do16 si do re mib fa

    %7
    sol8 do,4\mbreak
    si8 si do
    re re mib

    %10
    re4.
    sol16 re sol fa mib re
    mib do sol do mib do

    %13
    fa do fa mib re do
    re sib? sol sib re sib
    mib sib mib re do sib

    %16
    do lab mib lab do lab\mbreak
    sib fa re fa sib lab
    sol8 fa16 sol mib8

    %19
    sib' mib sib
    \grace sib do4.
    sib8\p mib sib

    %22
    \grace sib do4.
    do8\f fa do
    \grace do re4.

    %25
    do8\p fa do
    \grace do re4.
    re8\f sol re

    %28
    mib4 r8
    re sol re\mbreak
    mib16 re mib fa mib re

    %31
    do sib do re mib fa
    re do re mib re do
    sib la sib do re mib

    %34
    do sib do re do sib
    la sol la sib do re
    sib la sib sol do la

    %37
    re8 do16 sib la sol\mbreak
    fad sol la fad re8
    mib'(re) dod

    %40
    re(do! ) si
    do(sib!) la
    sib16 re, sib' re, sib' re,

    %43
    la' re, la' re, la' re,
    sib' re, sib' re, sib' re,
    la' re, la' re, la' re,

    %46
    sol8 la fad
    sol4.
    mib'8(re) dod\mbreak

    %49
    re(do!) si
    do(sib!) la
    sib16 re, sib' re, sib' re,

    %52
    la' re, la' re, la' re,
    sib' re, sib' re, sib' re,
    la' re, la' re, la' re,

    %55
    sol8 la fad
    sol4.
    mib'16 re mib fa sol lab

    %58
    sib8 mib,4
    re8 \grace re mib4
    fa8 fa sol
    sol fa16 mib fa8

    %62
    fa16 mi fa sol lab sib
    do8 fa,4
    mi8 \grace mi fa4

    %65
    sol8 sol lab
    sol4.
    reb'8(do) si

    %68
    do(sib!) la
    sib(lab) sol\mbreak
    lab16 do, lab' do, lab' do,

    %71
    sol' do, sol' do, sol' do,
    lab' do, lab' do, lab' do,
    sol' do, sol' do, sol' do,

    %74
    fa8 sol mi
    fa16 sol lab sol fa mib
    re fa mib re mib fa

    %77
    mib fa sol fa mib re\mbreak
    do mib re do re mib
    re mib fa mib re do

    %80
    si re sol, re' fa, re'
    mib,8 re16 mib do8
    sol'8 do sol

    %83
    \grace sol lab4.
    sol8\p do sol
    \grace sol lab4.

    %86
    la!8\f re la
    \grace la sib4.\mbreak
    la8\p re la

    %89
    \grace la sib4.
    re8\f sol re
    mib4.

    %92
    re8 sol re
    mib16 fa mib fa mib fa
    mib fa mib fa mib fa

    %95
    re mib re mib re mib
    re mib re mib re mib
    do re do re do re\mbreak

    %98
    do re do re do re
    si8 la16 si sol8
    lab'( sol fad

    %101
    sol fa! mi
    fa mib! re)
    mib16 sol, mib' sol, mib' sol,

    %104
    re' sol, re' sol, re' sol,
    mib' sol, mib' sol, mib' sol,
    re' sol, re' sol, re' sol,

    %107
    do8 re si\mbreak
    do4.
    lab'8( sol fad

    %110
    sol fa! mi
    fa mib! re)
    mib16 sol, mib' sol, mib' sol,

    %113
    re' sol, re' sol, re' sol,
    mib' sol, mib' sol, mib' sol,
    re' sol, re' sol, re' sol,

    %116
    do8 re si
    do16 sol do sib lab sol
    lab fa lab sol fa mib

    %119
    fa re sol fa mib re
    mib16 sol la! si do8
    mib,8 re si'

    %122
    do,4.

}

VvlIIn = \relative do'' {

    do16 si do re mib fa
    sol8 do,4
    si8 si do

    %4
    re re mib
    mib\tr re16 do re8
    do16 si do re mib fa

    %7
    sol8 do,4\mbreak
    si8 si do
    re re mib

    %10
    re4.
    sol16 re sol fa mib re
    mib do sol do mib do

    %13
    fa do fa mib re do
    re sib? sol sib re sib
    mib sib mib re do sib

    %16
    do lab mib lab do lab\mbreak
    sib fa re fa sib lab
    sol8 fa16 sol mib8

    %19
    sib' mib sib
    \grace sib do4.
    sib8\p mib sib

    %22
    \grace sib do4.
    do8\f fa do
    \grace do re4.

    %25
    do8\p fa do
    \grace do re4.
    re8\f sol re

    %28
    mib4 r8
    re sol re\mbreak
    mib16 re mib fa mib re

    %31
    do sib do re mib fa
    re do re mib re do
    sib la sib do re mib

    %34
    do sib do re do sib
    la sol la sib do re
    sib la sib sol do la

    %37
    re8 do16 sib la sol\mbreak
    fad sol la fad re8
    do'8\parenthesize ( sib) la\mbreak

    %40
    sib \parenthesize (la) sol
    lab \parenthesize (sol) fad
    sol16 re sol re sol re

    %43
    fad re fad re fad re
    sol re sol re sol re
    fad re fad re fad re

    %46
    sib8 do la
    sib4.
    do'8\parenthesize ( sib) la\mbreak

    %49
    sib \parenthesize (la) sol
    lab \parenthesize (sol) fad
    sol16 re sol re sol re

    %52
    fad re fad re fad re
    sol re sol re sol re
    fad re fad re fad re

    %55
    sib8 do la
    sib4.
    mib'16 re mib fa sol lab

    %58
    sib8 mib,4
    re8 \grace re mib4
    fa8 fa sol

    %61
    sol fa16 mib fa8
    fa16 mi fa sol lab sib
    do8 fa,4

    %64
    mi8 \grace mi fa4
    sol8 sol lab
    sol4.

    %67
    sib8\parenthesize ( lab) sol
    lab?\parenthesize (sol) fa
    solb\parenthesize (fa) mi

    %70
    fa16 do fa do fa do
    mi do mi do mi do\mbreak
    fa do fa do fa do

    %73
    mi do mi do mi do
    fa8 sol mi
    fa16 sol lab sol fa mib?

    %76
    re fa mib re mib fa
    mib fa sol fa mib re
    do mib re do re mib

    %79
    re mib fa mib re do\mbreak
    si re sol, re' fa, re'
    mib,8 re16 mib do8
    sol'8 do sol

    %83
    \grace sol lab4.
    sol8\p do sol
    \grace sol lab4.

    %86
    la!8\f re la
    \grace la sib4.\mbreak
    la8\p re la

    %89
    \grace la sib4.
    re8\f sol re
    mib4.

    %92
    re8 sol re
    mib16 fa mib fa mib fa
    mib fa mib fa mib fa

    %95
    re mib re mib re mib
    re mib re mib re mib
    do re do re do re\mbreak

    %98
    do re do re do re
    si8 la16 si sol8
    fa'8\parenthesize (mib re

    %101
    mib re do
    reb do si)
    do16 sol do sol do sol

    %104
    si sol si sol si sol
    do sol do sol do sol
    si sol si sol si sol

    %107
    do8 re si\mbreak
    do4.
    fa8\parenthesize (mib re

    %110
    mib re do
    reb do si)
    do16 sol do sol do sol

    %113
    si sol si sol si sol
    do sol do sol do sol
    si sol si sol si sol

    %116
    mib8 fa re\mbreak
    do4 r8
    fa4 r8

    %119
    re4 r8
    mib16 sol la si do8
    mib, re si'

    %122
    do,4.

}

Vvlan = \relative do' {

    sol'4 r8
    mib16 re mib fa sol lab
    re,8 re mib

    %4
    sol,4 do8
    si sol' fa
    mib4 r8

    %7
    mib16 re mib fa sol lab
    re,8 re mib
    sol,4 do8

    %10
    si4.
    re'\mbreak
    sol,

    %13
    do
    fa,
    sib

    %16
    mib,8 do lab
    fa' sib, sib
    sib4.

    %19
    mib16 sol mib sol mib sol
    mib lab mib lab mib lab
    mib8 do lab

    %22
    fa'16 la! fa la fa la
    fa sib fa sib fa sib
    fa la fa la fa la

    %25
    fa8 re sib
    sol'16 si sol si sol si
    sol do sol do sol do\mbreak

    %28
    sol si sol si sol si
    do si do re do sib
    la sol la sib do la

    %31
    sib la sib do sib la
    sib la sib do sib la
    sol fad sol la sib sol

    %34
    la sol la sib la sol
    fad mi fad sol la fad
    sol8 sol fa!16 mib!

    %37
    re8 re mib
    la,4.
    R4.*3

    %42
    sol4 r8
    re'4 r8
    sol,4 r8\mbreak

    %45
    re'4.
    mib8 mib re
    re4.

    %48
    R4.*3
    sol,4 r8
    re'4 r8

    %53
    sol,4 r8
    re'4 r8
    mib mib re

    %56
    re4.
    R
    sol16 fa sol lab sib do

    %59
    fa,8 fa sol
    sib,4 mib8
    mib re r

    %62
    R4.
    lab'16 sol lab sib do reb
    sol,8 sol lab

    %65
    do,4 fa8
    mi4.
    R4.*3

    %70
    fa4 r8\mbreak
    do4.
    fa4 r8

    %73
    do4 r8
    lab sib sol
    \once\stemUp lab8 do'16 sib lab sol

    %76
    fa4 r8
    sib, sib'16 lab sol fa
    mib4 r8

    %79
    lab, lab'16 sol fa mib
    re8 si re
    sol,4.

    %82
    do16 mi do mi do mi
    do fa do fa do fa
    do mi do mi do mi

    %85
    do8 lab fa
    re'16 fad re fad re fad
    re sol re sol re sol\mbreak

    %88
    re fad re fad re fad
    re8 sib sol
    sol'16 si sol si sol si

    %91
    sol do sol do sol do
    sol si sol si sol si
    do8 sol sol

    %94
    lab lab lab
    lab? lab lab
    sol sol sol

    %97
    sol sol sol
    fa fa fa
    sol4.

    %100
    R4.*3
    do,4.
    sol

    %105
    do
    sol
    mib'8 fa re

    %108
    mib4.
    R4.*3\mbreak
    do,4.

    %113
    sol'
    do,
    sol'

    %116
    lab8 lab sol
    sol4 r8
    do4 r8

    %119
    sol4 r8
    sol4.
    do8 lab re,

    %122
    mib4.

}


Vbcn = \relative do {

    do4 r8
    do16 si do re mib fa
    sol8 do, r

    %4
    si do do,
    sol' sol'16 la si sol
    do4 r8

    %7
    do,16 si do re mib fa\mbreak
    sol4 do,8
    si si do

    %10
    sol4.
    si'
    do4 r8

    %13
    lab4 r8
    sib?4 r8
    sol4 r8

    %16
    lab4 r8
    re,4 r8
    mib4 r8

    %19
    sol16 mib sol mib sol mib\mbreak
    lab mib lab mib lab mib
    sol mib sol mib sol mib

    %22
    lab sol lab sib do sib
    la! fa la fa la fa
    sib fa sib fa sib fa

    %25
    la fa la fa la fa\mbreak
    sib la sib do re do
    si sol si sol si sol

    %28
    do sol do sol do sol
    si sol si sol si sol
    do4 r8

    %31
    fa,4 r8
    sib,4 r8
    mib4 r8

    %34
    la,4 r8\mbreak
    re4 r8
    sol, sol' la

    %37
    sib sib, do
    re4.
    R4.*7

    %46
    mib8 do re
    sol,4.
    R4.*7

    %55
    mib'8 do re
    sol,4.
    R4.\mbreak

    %58
    mib'16 re mib fa sol lab
    sib4 mib,8
    re re mib

    %61
    sib4.
    R
    fa'16 mi fa sol lab sib

    %64
    do4 fa,8
    mi mi fa
    do4.

    %67
    R4.*7\mbreak
    reb8 sib do
    fa,4.

    %76
    sib'
    sol4 r8
    lab4 r8

    %79
    fa4 r8
    sol sol, si
    do4.

    %82
    mi16 do mi do mi do
    fa do fa do fa do\mbreak
    mi do mi do mi do

    %85
    fa mi fa sol lab sol
    fad re fad re fad re
    sol re sol re sol re

    %88
    fad re fad re fad re
    sol la sib do re do\mbreak
    si sol si sol si sol

    %91
    do sol do sol do sol
    si sol si sol si sol
    do re do re do re

    %94
    do re do re do re
    sib? do sib do sib do\mbreak
    sib do sib do sib do

    %97
    lab sib lab sib lab sib
    lab sib lab sib lab sib
    sol4.

    %100
    R4.*7
    lab8 fa sol
    do,4.

    %109
    R4.*7\mbreak
    lab'8 fa sol
    mi4 r8

    %118
    fa4 r8
    si,4 r8
    do4 r8

    %121
    lab8 fa sol
    do,4.

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \key sib\major
    \tempo 4. = 67
    \once \override Score.RehearsalMark.extra-offset = #'(+2 . +1)
    \mark\markup\huge "Presto"
    s4.*56
    \bar":..:"\break
    s4.*66
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
}

VIvlIn = \relative do'' {

    sol'8
    mib re do re do si do4. lab
    sol8 fa mib re mib fa mib re do r do' re
    mib fa sol lab sol lab re, mib fa sol fa sol

    %4
    do, re mib fa mib fa sib, do re mib re mib
    lab,4. lab lab lab\mbreak
    lab lab lab8 sib,16 do re mib fa8 sol lab

    %7
    sol mib4_\tr lab8 mib4_\tr sib'8 mib,4_\tr do'8 lab16 sol lab8
    re do sib sol' fa mib re do sib sol' fa mib
    re mib fa sib, do re mib2.~

    %10
    mib~mib8 re do sib do lab\mbreak
    sol4. fa mib r4 mib'8\p
    re do sib sol' fa mib re do sib sol' fa mib

    %13
    re mib fa sib, do re mib2.~
    mib~mib8 re do sib do lab
    sol4. fa mib r4 sib''8

    %16
    sol fa mib fa mib re\mbreak mib4. r4 do'8
    lab sol fa sol fa mi fa4. r4 re'8
    sib la sol la sol fad sol4. mib

    %19
    re8 do sib la sib do fad, sol la re, re' do
    sib la sol re sol fad sol4. r4 sol'8\mbreak
    lab do, lab' sol lab sib lab do, lab' fa sol lab

    %22
    sol sib, sol' fa sol lab sol sib, sol' re mib fa
    mib sib mib re mib fa mib re do lab' sol fa
    sol fa mib re mib do si re do si la sol\mbreak

    %25
    lab4. fa' sol, mib'
    fa, re' mib, r4 do'8
    si\p la sol mib' re do si la sol mib' re do

    %28
    si do re sol, la si do2.~
    do~ do8\f sib lab sol lab fa
    mib4. re do r4.

    %31
    si'8\parenthesize \p la sol mib' re do si la sol mib' re do
    si do re sol, la si do2.~
    do do'8\f sib lab sol lab fa

    %34
    mib4. re do r4

}

VIvlIIn = \relative do'' {

    sol'8
    mib re do re do si do4. lab
    sol8 fa mib re mib fa mib re do r do' re
    mib fa sol lab sol lab re, mib fa sol fa sol

    %4
    do, re mib fa mib fa sib, do re mib re mib
    lab,4. lab lab lab\mbreak
    lab lab lab8 sib,16 do re mib fa8 sol lab

    %7
    sol mib4_\tr lab8 mib4_\tr sib'8 mib,4_\tr do'8 lab16 sol lab8
    re do sib sol' fa mib re do sib sol' fa mib
    re mib fa sib, do re mib2.~

    %10
    mib~mib8 re do sib do lab\mbreak
    sol4. fa mib r4 mib'8\p
    re do sib sol' fa mib re do sib sol' fa mib

    %13
    re mib fa sib, do re mib2.~
    mib~mib8 re do sib do lab
    sol4. fa mib r4 sib''8

    %16
    sol fa mib fa mib re\mbreak mib4. r4 do'8
    lab sol fa sol fa mi fa4. r4 re'8
    sib la sol la sol fad sol4. mib

    %19
    re8 do sib la sib do fad, sol la re, re' do
    sib la sol re sol fad sol4. r4 sol'8\mbreak
    lab do, lab' sol lab sib lab do, lab' fa sol lab

    %22
    sol sib, sol' fa sol lab sol sib, sol' re mib fa
    mib sib mib re mib fa mib re do lab' sol fa
    sol fa mib re mib do si re do si la sol\mbreak

    %25
    lab4. fa' sol, mib'
    fa, re' mib, r4 do'8
    si\p la sol mib' re do si la sol mib' re do

    %28
    si do re sol, la si do2.~
    do do8\f sib lab sol lab fa
    mib4. re do r4.

    %31
    si'8\parenthesize \p la sol mib' re do si la sol mib' re do
    si do re sol, la si do2.~
    do do'8\f sib lab sol lab fa

    %34
    mib4. re do r4

}

VIvlan = \relative do' {

    r8
    r4 r8  r r sol' sol4. fa8 mib re
    mib re do do4 si8 do4. r
    sol' do8 sib lab sib4. sib8 lab sol

    %4
    lab4. lab8 sol fa sol4. sol8 fa mib
    fa4. fa fa fa
    fa fa re r\mbreak

    %7
    mib mib mib mib4 lab8
    fa4. sib8 lab sol fa4. sib8 lab sol
    fa4. r sib8 lab sol lab sib do

    %10
    sib lab sol lab sib do sib4 lab8 sol fa mib
    \parenthesize mib4. \parenthesize re mib r8 r sol\parenthesize \p
    fa4. mib8 fa sol fa4. mib8 fa sol

    %13
    fa4. r4 sib8 sib lab sol lab sib do
    sib lab sol lab sib do sib4. mib,
    mib re mib r4 r8\mbreak

    %16
    r2. sib'8 lab sol sib lab sol
    do4. r do8 sib lab do sib la
    re4. r re,8 do sib do sib la

    %19
    sib4. mib la,4 la8 sib4 fad8
    sol4 mib'8 la,4 re8 sib sib' lab sol fa mi
    fa4. mi fa8 lab fa fa mib? re

    %22
    mib4. re mib8 sol mib re do si
    do4. si do do4 lab'8
    sol4. lab re, r4 do8

    %25
    do4. sib sib lab
    lab? sol sol4 sol'8 lab sol fa\mbreak
    sol4.\parenthesize \p do,8 re mib re4. do8 re mib

    %28
    re4. r4 la'8  sol fa mib fa sol lab!
    sol fa mib fa sol lab sol4\parenthesize \f fa8 mib re do
    do4. si do r4 mib8

    %31
    re4.\parenthesize \p do8 re mib re4. do8 re mib
    re4. r4 sol8 sol fa mib fa sol lab
    sol fa mib fa sol lab sol4.\parenthesize \f do,

    %34
    do si do r4

}


VIbcn = \relative do {

    r8
    r4 r8 r r sol' mib re do re do si
    do4 mib,8 fa4 sol8 do4. do,

    %3
    do'' r8 r fa, sib4. r8 r mib,\mbreak
    lab4. r8 r re, sol4. r8 r do,
    fa re mib fa mib fa sib, re mib fa mib fa

    %6
    sib, re mib fa mib fa sib,4. r8 r sib
    mib4. fa\mbreak sol lab
    sib r sib r

    %9
    sib r8 r sib sol fa mib do' sib lab
    sol fa mib do' sib lab sol4.~sol4 lab8
    sib4. sib, mib r4 r8\mbreak

    %12
    sib'4. mib, sib' mib,
    sib' r4 sib8 sol fa mib do' sib lab
    sol fa mib do' sib lab sol4.~sol4 lab8

    %15
    sib4. sib, mib r4 r8
    r4. r8 r sib' sol fa mib sol fa mi
    fa4. r8 r do' lab sol fa lab sol fad

    %18
    sol4. r8 r re' sib la! sol la sol fad
    sol4. do,\mbreak re4 do8 sib4 la8
    sol4 do8 re4 re,8 sol sol' fa mi re do

    %21
    fa4. do fa r8 r sib,
    mib4. sib mib r8 r sol\mbreak
    do4. sol do, fa

    %24
    mib fa sol r8 r mib
    fa sol lab re, do sib mib fa sol do, sib lab
    re mib fa si, la sol\mbreak do re mib fa sol lab

    %27
    sol4. r4 r8 sol4. r4 r8
    sol4. r8 r sol mib re do lab' sol fa
    mib re do lab' sol fa mib4.~mib4 fa8\mbreak

    %30
    sol4. sol, do r8 r do
    sol'4. do, sol' do,
    sol' r8 r sol mib re do lab' sol fa

    %33
    mib re do lab' sol fa mib4.~mib4 fa8\mbreak
    sol4. sol, do, r4

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 12/8
    \key sib\major
    \tempo 2. = 67
    \once \override Score.RehearsalMark.extra-offset = #'(+2 . +1)
    \mark\markup\huge "Giga"
    \partial 8 s8
    s1.*14
    s2. s4. s4
    \bar":..:"\break
    s8
    s1.*19
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



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Sinfonia in Do minore}
    composer = \markup \center-column{"G. A. Brescianello (1690c -1758)""  "}

}

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