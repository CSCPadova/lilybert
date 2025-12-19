\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

MyCadenza = \relative do'' {

    \cadenzaOn s4.*5^\markup\italic\center-align"[Cadenza]" \bar"|"

    \cadenzaOff

}

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

dolce = _\markup\italic"dolce"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tasto = _\markup\italic"tasto solo"

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #2

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

terzinesenza = \override TupletNumber.transparent = ##t

terzinecon = \override TupletNumber.transparent = ##f

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
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f

}

Ivln = \relative do'' {

    sib'4 r la r
    sib r8 re,,16 mib fa8 mib16 fa sol8 sol
    fa mib16 fa sol8 sol fa mib16 fa sol8 sol

    %4
    fa sib fa sol fa4 r
    sib'4\p r la r
    sib r8 re,,16 mib fa8 mib16 fa sol8 sol

    %7
    fa8 mib16 fa sol8 sol fa mib16 fa sol8 sol
    fa sib fa sol fa4 r
    sib'8\f sib sib sib sib la16 sol la(sol) la(sol)

    %10
    la8 la la la la sol16 fa sol(fa) sol(fa)\mbreak
    sol8 sol sol sol sol fa16 mi fa(mi) fa(mi)
    fa8 fa fa fa fa mi16 re mi re mi re

    %13
    mi8 mi mi mi fa2
    fa8\solo sib,(re fa) fa sib,(re fa)
    lab sib,(re fa) lab sib,(re  fa)

    %16
    sol mib,(sol sib) sib mib,(sol sib)
    reb mib,(sol sib) reb mib,(sol sib)
    do lab(do mib) lab do,(fa lab)

    %19
    si, fa(si re) re si(re fa)
    fa re(fa lab) lab fa(si, fa')\mbreak
    mib do(mib sol) do(sib la sol)

    %22
    fad la16 sol la8 fad do[la'16 sol fad mi re do]
    <sol' sib, re, sol,>4 r fad\tu r
    sol r8 sol16 la sib8 \stemUp sol, sol\stemDown sib'\stemNeutral

    %25
    dod, [la, la dod'16 re] mi8 mi16 fa sol8 fa16 mi
    fa8 [re, re fa'16 sol] la8 \stemUp re,, re \stemDown la''\stemNeutral
    si, [sol, sol si'16 do] re8 re16 mib fa8 mib16 re

    %28
    mib8[ do, do do'16 re] \stemDown mib8 \stemUp do, do \stemDown mib'\stemNeutral
    fad, re16 mib \mbreak fad8 fad'16 sol la8 \stemUp re,,16 mi\stemNeutral fad8 fad'16 sol
    la8 la,16 sib do8 sib16 la sib4 r8 sib'\solo

    %31
    sol(fa? mi re) dod(sib la) sib'
    sol fa mi re la4. sold'8
    la (sold la) dod, re dod re sib'

    %34
    la sold la dod, re dod re sold,
    la dod re sold, la dod re sold,
    la[la'16 sol? fa mi re dod] re8 fa, la, dod'

    %37
    re4\tu r mi r \mbreak
    fa4 r8 fa,16 sol la8 sol16 la sib8 sib
    la[sol16 la sib8 sib] la[sol16 la sib8 sib]

    %40
    la re la sib la4 r8 fa'16 sol
    la8 \stemUp re,, re \stemDown la''\stemNeutral sib [sol, sol sol'16 la]
    sib8 \stemUp sol, sol\stemDown sib'\stemNeutral mi, [do, do do'16 re]

    %43
    mi8[mi16 fa sol8 fa16 mi] la8 [fa, fa fa'16 sol]
    la8 \stemUp fa, fa\stemDown la'\stemNeutral re,[sib, sib sib'16 do]
    re8 re16 mi fa8 mi16 re sol8[mi, mi mi'16 fa]\mbreak

    %46
    sol8\stemUp mi, mi \stemDown sol' fa \stemUp re, \stemNeutral re16 fa' sol la
    sib8 re, re sib' mi, do fa la,
    sib fa' do mi fa16 do(sib do) la(sib do) la

    %49
    fa' do(sib do) la(sib do) la fa' re(do re) sib(do re) sib
    fa' re(do re) sib re(do re) sol re(do re) si(do re) do
    sol' re(do re) si(do re) si sol' mi(re mi)do(re mi) do\mbreak

    %52
    sol' mi(re mi) do(re mi) do la' mi(re mi) dod(re mi) dod
    la' mi(re mi) dod(re mi) dod la' fa (mi fa) re(mi fa) re
    la' fa(mi fa) re(mi fa) re sib'(la) sol(fa) sol(fa) mib!(re)

    %55
    mib(re do) sib do(sib) la(sol) la8 fa r16 fa sol la
    sib fa(mib fa) re(mib fa) re sib' fa(mib fa) re(mib fa) re
    sib' sol(fa sol) mib(fa sol) mib\mbreak do' sol(fa sol) mi(fa sol) mi

    %58
    do' la(sol la) fa(sol la) fa re' la(sol la) fad(sol la) fad
    re' sib(la sib) sol(la sib) sol mib' sib(la sib) sol(la sib) sol
    la fa? sol la sib do re mib fa sib, do re mib fa sol la

    %61
    sib8\tu sib sib sib sib la16(sol) la(sol) la(sol)
    la8 la la la la sol16 fa sol(fa) sol(fa)
    sol8 sol sol sol\mbreak sol fa16 mib fa mib fa mib

    %64
    fa8 fa fa fa fa mib16 re mib re mib re
    mib8 mib mib mib mib re16 do re do re do
    re8[re16 re re8 re] do8[do16 do do8 do]

    %67
    do8[do16 do do8 do] sib4 r16 fa' sol la
    sib fa(mib fa) re(mib fa) re sib' sol(fa sol) mib(fa sol) mib
    do' sol(fa sol) mi (fa sol) mi do' la(sol la) fa(sol la) fa\mbreak

    %70
    re' la(sol la) fad(sol la) fad sib(la sib) re sib la(sib do)
    sib (la sib) re sib(la sib) do sib la sib  re sib la sib do
    sib la sib do la sib do la sib4 r8 re,,16 mib

    %73
    fa8 mib16 fa sol8 sol fa mib16 fa sol8 sol
    fa8 mib16 fa sol8 sol fa [re'16 re re8 re]
    do[do16 do do8 do] do[do16 do do8 do]

    %76
    sib1\fermata

}

IvlIn =  \relative do'' {

    sib'4 r la r
    sib r8 re,,16 mib fa8 mib16 fa sol8 sol
    fa mib16 fa sol8 sol fa mib16 fa sol8 sol

    %4
    fa sib fa sol fa4 r
    sib'4\p r la r
    sib r8 re,,16 mib fa8 mib16 fa sol8 sol

    %7
    fa8 mib16 fa sol8 sol fa mib16 fa sol8 sol
    fa sib fa sol fa4 r
    sib'8\f sib sib sib sib la16 sol la(sol) la(sol)

    %10
    la8 la la la la sol16 fa sol(fa) sol(fa)\mbreak
    sol8 sol sol sol sol fa16 mi fa(mi) fa(mi)
    fa8 fa fa fa fa mi16 re mi re mi re

    %13
    mi8 mi mi mi fa2
    fa4\p fa fa fa
    fa fa fa fa

    %16
    sol sib, sib sib
    sib sib sib sib
    do do do do

    %19
    re re re re
    re re re re
    do do do do

    %22
    do do la' la
    sol\f r fad r
    sol r8 sol16 la sib8 \stemUp sol, sol\stemDown sib'\stemNeutral

    %25
    dod, [la, la dod'16 re] mi8 mi16 fa sol8 fa16 mi
    fa8 [re, re fa'16 sol] la8 \stemUp re,, re \stemDown la''\stemNeutral
    si, [sol, sol si'16 do] re8 re16 mib fa8 mib16 re

    %28
    mib8[ do, do do'16 re] \stemDown mib8 \stemUp do, do \stemDown mib'\stemNeutral
    fad, re16 mib \mbreak fad8 fad'16 sol la8 \stemUp re,,16 mi\stemNeutral fad8 fad'16 sol
    la8 la,16 sib do8 sib16 la sib4 r

    %31
    R1
    r2 la,4\p la
    la la la la

    %34
    la la la la
    la la la la
    la r8 la re4 la

    %37
    re' r mi r
    fa r8 fa,16 sol la8 sol16 la sib8 sib
    la[sol16 la sib8 sib] la[sol16 la sib8 sib]

    %40
    la re la sib la4 r8 fa'16 sol
    la8 \stemUp re,, re \stemDown la''\stemNeutral sib [sol, sol sol'16 la]
    sib8 \stemUp sol, sol\stemDown sib'\stemNeutral mi, [do, do do'16 re]

    %43
    mi8[mi16 fa sol8 fa16 mi] la8 [fa, fa fa'16 sol]
    la8 \stemUp fa, fa\stemDown la'\stemNeutral re,[sib, sib sib'16 do]
    re8 re16 mi fa8 mi16 re sol8[mi, mi mi'16 fa]\mbreak

    %46
    sol8\stemUp mi, mi \stemDown sol' fa \stemUp re, \stemNeutral re16 fa' sol la
    sib8 re, re sib' mi, do fa la,
    sib fa' do mi  fa\p fa fa do

    %49
    r fa fa do r fa fa re
    r fa fa re r sol sol re
    r sol sol re\mbreak r sol sol mi

    %52
    r sol sol mi r la la mi
    r la la mi r la la fa
    r la la fa fa4 r

    %55
    R1
    re,8\p re re re re re re re
    mib mib mib mib\mbreak mi mi mi mi

    %58
    fa fa fa fa fad fad fad fad
    sol sol sol sol sol sol sol sol
    fa4 r r2

    %61
    sib'8 sib sib sib sib la16 sol la sol la sol
    la8 la la la\mbreak la sol16 fa sol fa sol fa
    sol8 sol sol sol sol fa16 mib fa mib fa mib

    %64
    fa8 fa fa fa fa mib16 re mib re mib re
    mib8 mib mib mib mib re16 do re do re do\mbreak
    re8[re16 re re8 re] do[do16 do do8 do]

    %67
    do[do16 do do8 do] sib4 r
    R1*4
    r2 r4 r8 re,16 mib

    %73
    fa8 mib16 fa sol8 sol fa mib16 fa sol8 sol
    fa8 mib16 fa sol8 sol fa [re'16 re re8 re]
    do[do16 do do8 do] do[do16 do do8 do]

    %76
    sib1\fermata

}

IvlIIn =  \relative do'' {

    re4 r do r
    re r8 sib,16 do re8 [do16 re mib8 mib]
    re [do16 re mib8 mib] re [do16 re mib8 mib]

    %4
    re sib' fa mib re4 r
    re'\p r do r
    re r8 sib,16 do \mbreak re8 [do16 re mib8 mib]

    %7
    re [do16 re mib8 mib] re [do16 re mib8 mib]
    re sib' fa mib re4 r
    fa'8\f fa fa fa mib4 r

    %10
    do8 do do do sib4 r
    sib8 sib sib sib\mbreak la4 r
    la8 la la la sol4 r

    %13
    sol8 sol sol sol la2
    re4\p re re re
    re re re re

    %16
    sib sol sol sol
    sol sol sol sol
    mib mib fa fa'

    %19
    fa fa fa fa
    si, si si si\mbreak
    sol sol mib' mib

    %22
    la, la fad' fad
    sib,\f r la r
    sib r8 sol'16 la sib8 sib, sib sib'

    %25
    dod, [la, la dod'16 re] mi8 mi16 fa sol8 fa16 mi
    fa8[re, re fa'16 sol]\mbreak la8 \stemUp re,, re \stemDown la''\stemNeutral
    si, [sol, sol si'16 do] re8 re16 mib fa8 mib16 re

    %28
    mib8[ do, do do'16 re] \stemDown mib8 \stemUp do, do \stemDown mib'\stemNeutral
    fad, re16 mib \mbreak fad8 fad'16 sol la8 \stemUp re,,16 mi\stemNeutral fad8 fad'16 sol
    la8 la,16 sib do8 sib16 la sib4 r

    %31
    R1
    r2 la,4\p la
    la la la la

    %34
    la la la la
    la la la la
    la r8 la re4 la

    %37
    re' r dod r\mbreak
    re r8 re,16 mi fa8 mi16 fa sol8 sol
    fa8 mi16 fa sol8 sol fa8 mi16 fa sol8 sol

    %40
    fa re' la sol fa4 r8 fa'16 sol
    la8 \stemUp re,, re \stemDown la''\stemNeutral sib [sol, sol sol'16 la]
    sib8 \stemUp sol, sol\stemDown sib'\stemNeutral mi, [do, do do'16 re]

    %43
    mi8[mi16 fa sol8 fa16 mi] la8 [fa, fa fa'16 sol]
    la8 \stemUp fa, fa\stemDown la'\stemNeutral re,[sib, sib sib'16 do]
    re8 re16 mi fa8 mi16 re sol8[mi, mi mi'16 fa]\mbreak

    %46
    sol8\stemUp mi, mi \stemDown sol' fa \stemUp re, \stemNeutral re16 fa' sol la
    sib8 re, re sib' mi, do fa la,
    sib fa' do mi  fa4 r8 la,16\p (do

    %49
    fa8) do r la16(do fa8) sib, r sib16(do
    fa8) sib, r\mbreak  sib16(re sol8) si, r si16(re
    sol8) si, r si16(re sol8) do, r do16(mi

    %52
    sol8) do, r do16(mi la8) dod, r dod16(mi
    la8) dod,  r dod16(mi la8) re, r re16(fa
    la8) re,\mbreak r re16 fa sib4 r

    %55
    R1
    re,,8\p re re re re re re re
    mib mib mib mib mi mi mi mi

    %58
    fa fa fa fa fad fad fad fad
    sol sol sol sol sol sol sol sol\mbreak
    fa4 r r2

    %61
    fa'8 fa fa fa mib4 r
    do8 do do do sib4 r
    sib8 sib sib sib la4 r

    %64
    la8 la la la sib4 r
    do8 do do do fa,4 r
    sib8 sib16 sib sib8 sib  sib8 sib16 sib sib8 sib\mbreak

    %67
    la[la16 la la8 la] sib4 r
    R1*4
    r2 r4 r8 re,16 mib

    %73
    fa8 mib16 fa sol8 sol fa mib16 fa sol8 sol
    fa8 mib16 fa sol8 sol fa8 mib16 fa sol8 sol
    sib8[sib16 sib sib8 sib]\mbreak do[do16 do  do8 do]

    %76
    sib1\fermata

}

Ivlan = \relative do'{

    fa4 r fa r
    fa r8 sib,16 do re8 [do16 re mib8 mib]
    re [do16 re mib8 mib] re [do16 re mib8 mib]

    %4
    re8 re re mib re4 r
    fa4\p r fa r
    fa r8 sib,16 do re8 [do16 re mib8 mib]\mbreak

    %7
    re [do16 re mib8 mib] re [do16 re mib8 mib]
    re8 re re mib sib4 r
    re'8\f re re re sol,4 r

    %10
    la8 la la la fa4 r
    do8 do do do do4 r
    do8 do do do re4 r\mbreak

    %13
    do8 do do do sib2
    sib4\p sib sib sib
    sib sib sib sib

    %16
    mib mib mib mib
    mib mib mib mib
    lab, lab lab lab

    %19
    sol sol sol sol
    sol sol sol sol
    do do do do\mbreak

    %22
    re re re re
    re\f r re r
    re r8 re' re sib16 sib sib sib sol sol

    %25
    mi8[mi16 mi mi mi mi mi] dod8[dod16 dod dod dod dod dod]
    la8[la16 la la la la la]\mbreak fa'8[fa16 fa fa fa fa fa]  %%% inizio quinta riga
    re8[re16 re re re re re] si8[si16 si si si si si]

    %28
    sol8[sol16 sol sol sol sol sol] sol8[mib'16 mib mib mib do do]
    la8 la16 la la8 la'16 la fad8 la,16 la la8 la'16 la\mbreak
    fad8 fad16 sol la8 sol16 fad sol4 r

    %31
    R1
    r2 la,4\p la
    la la la la

    %34
    la la la la
    la la la la
    la r8 la re4 la

    %37
    la'4 r la r
    la r8 re,16 mi fa8 mi16 fa sol8 sol
    fa8 mi16 fa sol8 sol fa8 mi16 fa sol8 sol

    %40
    fa fa fa sol re4 r8 la'
    fa8 fa16 fa fa fa fa fa re8 re16 re re re re re
    re8[sib16 sib sib sib sib sib] sol8[sol16 sol sol sol sol sol]\mbreak

    %43
    sol'8[sol16 sol mi mi mi mi] do8[do16 do do do do do]
    do8[la'16 la la la la la] fa8[fa16 fa fa fa fa fa]
    fa8[fa16 fa re re re re] mi8[si16 si si si si si]\mbreak

    %46
    dod8[dod16 dod dod dod dod dod] la8[la'16 la la la fa fa]
    re8[re16 re re re sol sol] sol4 do,?
    re do la8\p la' la la~

    %49
    la8 la la la sib sib sib sib
    sib sib sib sib si si si si\mbreak
    si? si si si do do do do

    %52
    do do do do do do do do
    do do do do re re re re
    re re re re re4 r

    %55
    R1*6
    re8 re re re sol,4 r
    la8 la la la re,4 r\mbreak

    %63
    do8 do do do do4 r
    do'8 do fa, fa re4 r
    fa8 fa fa fa fa4 r

    %66
    fa8[fa16 fa fa8 fa] sol8[sol16 sol sol8 sol]
    fa8[fa16 fa fa8 fa] re4 r
    R1*4

    %72
    r2 r4 r8 sib16 do\mbreak
    re8 do16 re mib8 mib re8 do16 re mib8 mib
    re8 do16 re mib8 mib re[fa16 fa fa8 fa]

    %75
    sol[sol16 sol sol8 sol] fa[fa16 fa fa8 fa]
    re1\fermata

}

Ibcn = \relative do {

    sib4 r fa' r
    sib, r r2
    R1*2

    %5
    sib4 r fa' r
    sib, r r2
    R1*2

    %9
    sib8 sib sib sib do4 r
    fa8 fa fa fa sol4 r
    mi8 mi mi mi fa4 r\mbreak

    %12
    la,8 la la la sib4 r
    mi8 mi do do fa,2
    R1*9

    %23
    sol4 r re' r
    sol, r8 sol' sol sol16 sol sol sol sol sol
    la8 la16 la la la la la la,8 la16 la la la la la\mbreak

    %26
    re8 re16 re re re re re re8 re16 re re re re re
    sol8 sol16 sol sol sol sol sol sol,8 sol16 sol sol sol sol sol
    do8 do16 do do do do do do8 do16 do do do do do

    %29
    re8 re16 re re re re re re8 re16 re re re re re\mbreak
    re8 re16 re re8 re16 re sol,4 r
    r2 la4 r

    %32
    r2 la4 r
    R1*4
    re4 r la r

    %38
    re r r2
    R1
    r2 re8 re16 re re re re re

    %41
    re8 re16 re re re re re sol8 sol16 sol sol sol sol sol\mbreak
    sol,8 sol16 sol sol sol sol sol sol8 sol16 sol sol sol sol sol
    do8 do16 do do do do do fa8 fa16 fa fa fa fa fa

    %44
    fa,8 fa16 fa fa fa fa fa sib8 sib16 sib sib sib sib sib
    sib'8 sib16 sib sib sib sib sib mi,8 mi16 mi mi mi mi mi\mbreak
    la,8 la16 la la la la la re8 re16 re re re re re

    %47
    sol8 sol16 sol sol sol sol sol do,4 la
    sol do fa, r
    R1*5

    %54
    r2 re''8 re sib sib
    sol sol mib mib fa fa mib mib
    re4 r r2\mbreak

    %57
    R1*3
    fa8 fa mib mib re re do do
    sib sib sib sib do4 r

    %62
    fa8 fa fa fa sol4 r
    mi8 mi mi mi fa4 r
    fa8 fa fa fa sol4 r

    %65
    la8 la la la sol4 r\mbreak
    sib,8 sib16 sib sib8 sib mib8 mib16 mib mib8 mib
    fa fa16 fa fa8 fa sib,4 r

    %68
    re r mib r
    mi r fa r
    fad r sol4 r8 re

    %71
    mib?4 fa  sol4 r8 re
    mib4 fa sib, r8 sib16 do\mbreak
    re8 do16 re mib8 mib re8 do16 re mib8 mib

    %74
    re8 do16 re mib8 mib re sib16 sib sib8 sib
    mib8 mib16 mib mib8 mib fa8 fa16 fa fa8 fa
    sib,1\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*8
    s2 <7>
    s <9>
    <6 5> <9>
    <6> <6 5>
    <6>4 <_!> s2
    s1*11
    <7 _+>1
    s1
    <7 _!>
    s1*3
    s2 <_+>
    s1*12
    s2 <7>
    s1
    s
    s2 <_!>
    s1*6
    s2 <6>4 <6>
    <6> <6> <6> s
    s1*5
    s2 <7>
    s <9>
    <6 5> <9>
    s <7>
    <6 5> <5 4>
    <3> <6 5>
    s1*9
    <7>2 <6>

}

forma = {

    \key sib\major
    \time 4/4
    \tempo 2 = 60
    s1*13
    \bar":..:"
    s1*63
    \bar ":|."

}

Ivl = {
    \Iglobal
    <<\Ivln \forma>>

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

}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f

}

IIvln = \relative do'' {

    R2.*2
    la'4 fa mi8 re
    mi re dod si? la4

    %5
    la8. dod16 mi4 la8. sol16
    fa8. mi16 re4 r
    fa sib sib

    %8
    sib16 la sol fa mi4 r
    do4 la'4. la8
    la16 sol fa mi re4 r

    %11
    si sol'4. sol8
    re8. [dod16 la8. sol'16 fa8. mi16]
    fa8.[mi16 re8. fa16 sib8. la16]

    %14
    sold4. mi8 la mi
    re8. do16 si4. la8\mbreak
    la2 r4

    %17
    la'8.[sol16 fa8. mi16 re8. mi16]
    dod8. si16 la4 r
    la'8.[sol16 fa8. mi16 re8. do?16]

    %20
    sib4. la8 sol4
    sib'8.[la16 sol8. fa16 mi8. re16]
    dod4. la8 re la

    %23
    sol fa mi4. re8
    re2.
    la''8.[sol16 fa8. mi16 re8. fa16]

    %26
    mib8.[fa16 sol8. la16 sib8. mib,16]
    dod'4. la8 re la
    sol fa mi4. re8

    %29
    re2 r4\mbreak
    R2.*3

}

IIvlIn =  \relative do'' {

    \stemUp re,8_\markup\italic {
        \dynamic p "e spiccato"
    }\stemDown la'' \stemUp re,, \stemDown la'' \stemUp re,, \stemDown la''
    \stemUp dod,,8 \stemDown la'' \stemUp dod,, \stemDown la'' \stemUp dod,, \stemDown la''
    \stemUp re,, \stemDown la'' \stemUp re,, \stemDown la'' \stemUp re,, \stemDown la''

    %4
    \stemUp la,, \stemDown la'' \stemUp la,, \stemDown la'' \stemUp la,,\stemDown la''\mbreak
    \stemUp la,, \stemDown la'' \stemUp la,, \stemDown la'' \stemUp la,,\stemDown la''
    \stemUp re,, \stemDown la'' \stemUp re,, \stemDown la'' \stemUp re,,\stemDown la''

    %7
    \stemUp re,, \stemDown sib'' \stemUp re,, \stemDown sib'' \stemUp re,,\stemDown sib''
    \stemUp do,, \stemDown sib'' \stemUp do,, \stemDown sib'' \stemUp do,,\stemDown sib''
    \stemUp fa, \stemDown la' \stemUp fa, \stemDown la' \stemUp fa, \stemDown la'

    %10
    \stemUp sib,, \stemDown la'' \stemUp sib,, \stemDown la'' \stemUp sib,,\stemDown la''
    \stemUp mi, \stemDown sol' \stemUp mi, \stemDown sol' \stemUp mi, \stemDown sol'
    \stemUp la,, \stemDown sol'' \stemUp la,, \stemDown sol'' \stemUp la,,\stemDown sol''

    %13
    \stemUp re, \stemDown fa' \stemUp re, \stemDown la'' \stemUp re,,\stemDown sib''
    \stemUp mi,, \stemDown si'' \stemUp re,, \stemDown si'' \stemUp do,,\stemDown la''
    \stemUp re,, \stemDown la'' \stemUp mi, \stemDown la' \stemUp mi,\stemDown sold'

    %16
    \stemUp la,, \stemDown la'' \stemUp dod,, \stemDown la'' \stemUp la,,\stemDown la''
    \stemUp re,, \stemDown fa' \stemUp re, \stemDown fa' \stemUp re,\stemDown fa'
    \stemUp la,, \stemDown mi'' \stemUp la,, \stemDown mi'' \stemUp la,,\stemDown mi''

    %19
    \stemUp re, \stemDown fa' \stemUp re, \stemDown fa' \stemUp re,\stemDown fa'\mbreak
    \stemUp sol,, \stemDown sib' \stemUp sol, \stemDown sib' \stemUp sol, \stemDown sib'
    \stemUp sol, \stemDown re'' \stemUp sol,, \stemDown mi'' \stemUp sol,,\stemDown mi''

    %22
    \stemUp la,, \stemDown mi'' \stemUp sol,, \stemDown mi'' \stemUp la,,\stemDown re'
    \stemUp sol,, \stemDown re'' \stemUp la, \stemDown re' \stemUp la,\stemDown dod'
    \stemUp re, \stemDown fa' \stemUp re, \stemDown fa' \stemUp re,\stemDown fa'

    %25
    \stemUp re, \stemDown fa' \stemUp re, \stemDown fa' \stemUp re,\stemDown fa'
    \stemUp sol,, \stemDown sib' \stemUp sol, \stemDown sib' \stemUp sol, \stemDown sib'\mbreak
    \stemUp la, \stemDown mi'' \stemUp \parenthesize sol,, \stemDown mi'' \stemUp la,,\stemDown re'

    %28
    \stemUp sol,, \stemDown re'' \stemUp la, \stemDown re' \stemUp la,\stemDown dod'\stemNeutral
    re, re' re, re' re, re'
    \stemUp sold,, \stemDown re'' \stemUp sold,, \stemDown re'' \stemUp sold,,\stemDown re''

    %31
    \stemUp la, \stemDown re' \stemUp la, \stemDown re' \stemUp la,\stemDown dod'
    re2.\fermata

}

IIvlIIn =  \relative do'' {

    \stemUp re,8_\markup\italic {
        \dynamic p "e spiccato"
    }\stemDown la'' \stemUp re,, \stemDown la'' \stemUp re,, \stemDown la''
    \stemUp dod,,8 \stemDown la'' \stemUp dod,, \stemDown la'' \stemUp dod,, \stemDown la''
    \stemUp re,, \stemDown la'' \stemUp re,, \stemDown la'' \stemUp re,, \stemDown la''

    %4
    \stemUp la,, \stemDown la'' \stemUp la,, \stemDown la'' \stemUp la,,\stemDown la''\mbreak
    \stemUp la,, \stemDown la'' \stemUp la,, \stemDown la'' \stemUp la,,\stemDown la''
    \stemUp re,, \stemDown la'' \stemUp re,, \stemDown la'' \stemUp re,,\stemDown la''

    %7
    \stemUp re,, \stemDown sib'' \stemUp re,, \stemDown sib'' \stemUp re,,\stemDown sib''
    \stemUp do,, \stemDown sib'' \stemUp do,, \stemDown sib'' \stemUp do,,\stemDown sib''
    \stemUp fa, \stemDown la' \stemUp fa, \stemDown la' \stemUp fa, \stemDown la'

    %10
    \stemUp sib,, \stemDown la'' \stemUp sib,, \stemDown la'' \stemUp sib,,\stemDown la''
    \stemUp mi, \stemDown sol' \stemUp mi, \stemDown sol' \stemUp mi, \stemDown sol'
    \stemUp la,, \stemDown sol'' \stemUp la,, \stemDown sol'' \stemUp la,,\stemDown sol''

    %13
    \stemUp re, \stemDown fa' \stemUp re, \stemDown la'' \stemUp re,,\stemDown sib''
    \stemUp mi,, \stemDown si'' \stemUp re,, \stemDown si'' \stemUp do,,\stemDown la''
    \stemUp re,, \stemDown la'' \stemUp mi, \stemDown la' \stemUp mi,\stemDown sold'

    %16
    \stemUp la,, \stemDown la'' \stemUp dod,, \stemDown la'' \stemUp la,,\stemDown la''
    \stemUp re,, \stemDown fa' \stemUp re, \stemDown fa' \stemUp re,\stemDown fa'
    \stemUp la,, \stemDown mi'' \stemUp la,, \stemDown mi'' \stemUp la,,\stemDown mi''

    %19
    \stemUp re, \stemDown fa' \stemUp re, \stemDown fa' \stemUp re,\stemDown fa'\mbreak
    \stemUp sol,, \stemDown sib' \stemUp sol, \stemDown sib' \stemUp sol, \stemDown sib'
    \stemUp sol, \stemDown re'' \stemUp sol,, \stemDown mi'' \stemUp sol,,\stemDown mi''

    %22
    \stemUp la,, \stemDown mi'' \stemUp sol,, \stemDown mi'' \stemUp la,,\stemDown re'
    \stemUp sol,, \stemDown re'' \stemUp la, \stemDown re' \stemUp la,\stemDown dod'
    \stemUp re, \stemDown fa' \stemUp re, \stemDown fa' \stemUp re,\stemDown fa'

    %25
    \stemUp re, \stemDown fa' \stemUp re, \stemDown fa' \stemUp re,\stemDown fa'
    \stemUp sol,, \stemDown sib' \stemUp sol, \stemDown sib' \stemUp sol, \stemDown sib'\mbreak
    \stemUp la, \stemDown mi'' \stemUp \parenthesize sol,, \stemDown mi'' \stemUp la,,\stemDown re'

    %28
    \stemUp sol,, \stemDown re'' \stemUp la, \stemDown re' \stemUp la,\stemDown dod'\stemNeutral
    re, re' re, re' re, re'
    \stemUp sold,, \stemDown re'' \stemUp sold,, \stemDown re'' \stemUp sold,,\stemDown re''

    %31
    \stemUp la, \stemDown re' \stemUp la, \stemDown re' \stemUp la,\stemDown dod'
    re2.\fermata

}

IIvlan = \relative do'{

    re8 r re r re r
    dod r dod r dod r
    re r re r re r
    la r la r la r
    la r la r la r
    re r re r re r\mbreak
    re r re r re r
    do r do r do r
    fa r fa r fa r
    sib, r sib r sib r
    mi r mi r mi r
    la, r la r la r
    re r re r re r\mbreak
    mi r re r do r
    re r mi r mi r
    la, r dod r la r
    re r re r re r
    la r la r la r
    re r re r re r
    sol, r sol r sol r\mbreak
    sol r sol r sol r
    la r sol r fa r
    sol r la r la r
    re r re r re r
    re r re r re r
    sol, r sol r sol r
    la r sol r fa r\mbreak
    sol r la r la r
    re r re r re r
    sold, r sold r sold r
    la r la r la r
    re2.\fermata

}

IIbcn = \relative do {

    R2.*32

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\minor
    \time 3/4
    \tempo 4  = 55
    s2.*32
    \bar "|."

}

IIvl = {
    \IIglobal
    <<\IIvln \forma>>

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

}


IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f

}

IIIvln = \relative do'' {

    sib16(do re8) sib
    fa re' (do)
    sib16(do re8) sib

    %4
    fa re' (do)
    sib16(do re8) sib
    fa'16 (sol la8) fa

    %7
    sib8 sib,16 do re mib
    fa4 r8
    fa16 (sol lab8) fa

    %10
    sib,(re fa)
    re(fa lab)
    sol4 r8

    %13
    sol16(la? sib8) sol
    do,(mi sol)
    mi(sol sib)

    %16
    la4 r8
    do,16\p(reb mib8) reb
    do16(reb mib8) reb

    %19
    do16 reb mib8 reb
    do4 r8
    fa,16(sol la8 sib)\mbreak

    %22
    do16(re mib8) re
    do16 sib la8 sol
    fa4 sib8

    %25
    re,16 (mib fa8) fa
    sol4 mib8
    re16 mib fa8 fa

    %28
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %31
    re16 mib fa8 fa
    sib16 \solo re do sib re fa
    sib re, do sib re fa

    %34
    sib re, do sib re fa
    sib la sol fa mib re
    sol fa mib re do sib

    %37
    mib re do sib la sol
    fa8. fa'16 sib fa
    sol(fa) sol(fa) sib(fa)\mbreak

    %40
    sol(fa) sol(fa) sib(fa)
    sol(fa) sol(fa) sib(fa)
    sol8 r16 sol do sol

    %43
    la(sol) la(sol) do(sol)
    la(sol) la(sol) do(sol)
    la(sol) la(sol) do(sol)

    %46
    la8 r16 la re la
    sib(la) sib(la) re(la)
    sib(la) sib(la) re(la)

    %49
    sib(la) sib(la) re(la)
    sib8 re, sib
    fa\tu (re') do

    %52
    sib16 (do re8) sib
    fa re' do
    sib16\parenthesize \solo (fa') sol(fa) sol(fa)\mbreak

    %55
    sib(fa) sol(fa) sol(fa)
    sib(fa) sol(fa) sol(fa)
    sib(fa) sol(fa) sol(fa)

    %58
    mi(do) re(do) re(do)
    mi(do) re(do) re(do)
    mi(sib) do(sib) do(sib)

    %61
    mi(sib) do(sib) do(sib)
    la\tu(sib do8) sib
    la (do sib)

    %64
    la16(sib do8) sib
    la(do sib)
    la16(sib do8) fa,

    %67
    la do sib
    sib do do,
    fa16 fa'\parenthesize \solo (sol fa) mi sol

    %70
    fa fa sol fa mi sol\mbreak
    fa do re do sib re
    do8 fa, r

    %73
    r16 fa' lab sol fa lab
    sol do,(re do)  si re
    do(mib lab) sol fa lab

    %76
    sol do,(re do) si re
    do sol' sib? (la? sol fa32) la
    la16 re,(mi re) dod mi

    %79
    re la'(sib la) sol sib
    la16 re,(mi re) dod mi
    re8\parenthesize \tu re,16 mi fa sol

    %82
    la8 la, la
    re' re,16 mi fa sol
    la8 la, la\mbreak

    %85
    re' re,16 mi fa sol
    la8 r re,16 mi
    fa sol la8 la,

    %88
    re4 r8
    fa'16 (sol la8) sol
    fa mi mi

    %91
    fa16 sol la8 sol
    fa mi mi
    fad16 sol la8 fad

    %94
    sol re re
    mi16 fa? sol8 mi
    fa do do

    %97
    fa16\parenthesize \solo fa (sol fa) mib? fa
    sol sol(la sol) fa sol
    la la(sib la) sol la

    %100
    sib sib do sib la sib\mbreak
    do do(re do) sib do
    re sib la sib re, sib'

    %103
    mib, sib'(la sib) mib, sib'
    fa sib la sib fa sib
    sol sib la sib sol sib

    %106
    re, sib' la sib re, sib'
    mib, sib' la sib mib, sib'
    fa sib la sib fa sib

    %109
    sol sib la sib fa sib
    re, sib' la sib re, sib'
    mib, sib' la sib mib, sib'

    %112
    fa sib la sib fa sib
    sib8 re, sib
    fa re' do\mbreak

    %115
    sib16(do re8) sib
    fa re' do
    sib16 do re8 mib

    %118
    fa16(sol lab8) fa
    sib, fa' lab
    lab?4-+ sol8

    %121
    do,16(re mi8) fa
    sol16(la? sib8) sol
    do, sol' sib

    %124
    sib4-+ la8
    do,16 reb mib8 reb
    do16 (reb mib8) reb

    %127
    do16 (reb mib8) reb
    do4 r8
    fa,16 (sol la8 sib)

    %130
    do16 (re? mib8) re
    do16 sib la8 sol
    fa4 sib8

    %133
    re,16 mib fa8 fa\mbreak
    sol4 mib8
    re16 mib fa8 fa

    %136
    sib, sib'16(do re mib)
    fa8 mib16 re do sib
    la8 fa'(do)

    %139
    reb(fa) sib,
    la(fa') do
    reb(fa) \parenthesize sib,

    %142
    la fa' do
    reb do sib
    mi sol(fa)

    %145
    mi reb do
    sib(mi16 fa) sol8
    reb(do sib)

    %148
    la sol fa
    reb' do sib
    la' sol fa

    %151
    reb do sib
    la' sol fa\mbreak
    fa,16\f (sol la8 sib)

    %154
    do16(re mib8) re
    do16(sib la8 sol)
    fa4 sib8

    %157
    re,16 mib fa8 fa
    sol4 mib8
    re16 mib fa8 fa

    %160
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %163
    re16 mib fa8 fa
    sib, sib' re,
    mib do la'

    %166
    \stemUp sib, \stemDown sib'' re,
    do sib' la
    sib4.\fermata

}

IIIvlIn =  \relative do'' {

    sib16(do re8) sib
    fa re' (do)
    sib16(do re8) sib

    %4
    fa re' (do)
    sib16(do re8) sib
    fa'16 (sol la8) fa

    %7
    sib8 sib,16 do re mib
    fa4 r8
    fa16 (sol lab8) fa

    %10
    sib,(re fa)
    re(fa lab)
    sol4 r8

    %13
    sol16(la? sib8) sol
    do,(mi sol)
    mi(sol sib)

    %16
    la4 r8
    do,16\p(reb mib8) reb
    do16(reb mib8) reb

    %19
    do16 reb mib8 reb
    do4 r8
    fa,16(sol la8 sib)\mbreak

    %22
    do16(re mib8) re
    do16 sib la8 sol
    fa4 sib8

    %25
    re,16 (mib fa8) fa
    sol4 mib8
    re16 mib fa8 fa

    %28
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %31
    re16 mib fa8 fa
    sib,4 r8
    R4.*17

    %50
    sib'16(do re8) sib
    fa(re') do

    %52
    sib16 (do re8) sib
    fa re' do
    sib4 r8

    %55
    R4.*7
    la16(sib do8) sib
    la (do sib)

    %64
    la16(sib do8) sib
    la(do sib)
    la16(sib do8) fa,

    %67
    la do sib
    sib do do,
    fa4 r8

    %70
    R4.*11
    re'8 re,16 mi fa sol

    %82
    la8 la, la
    re' re,16 mi fa sol
    la8 la, la\mbreak

    %85
    re' re,16 mi fa sol
    la8 r re,16 mi
    fa sol la8 la,

    %88
    re4 r8
    fa'16 (sol la8) sol
    fa mi mi

    %91
    fa16 sol la8 sol
    fa mi mi
    fad16 sol la8 fad

    %94
    sol re re
    mi16 fa? sol8 mi
    fa do r

    %97
    R4.*5
    fa8\p r re
    mib r mib

    %104
    fa r fa
    sol r sol
    re r re

    %107
    mib r mib
    fa r fa\mbreak
    sol r sol

    %110
    re r re
    mib r mib
    do r do

    %113
    sib16(do re8) sib
    fa re' do

    %115
    sib16(do re8) sib
    fa re' do
    sib4 r8

    %118
    R4.*7\mbreak
    do16 reb mib8 reb
    do16 (reb mib8) reb

    %127
    do16 (reb mib8) reb
    do4 r8
    fa,16 (sol la8 sib)

    %130
    do16 (re? mib8) re
    do16 sib la8 sol
    fa4 sib8

    %133
    re,16 mib fa8 fa\mbreak
    sol4 mib8
    re16 mib fa8 fa

    %136
    sib,4 r8
    R4.*16
    fa'16\f (sol la8 sib)

    %154
    do16(re mib8) re
    do16(sib la8 sol)
    fa4 sib8

    %157
    re,16 mib fa8 fa
    sol4 mib8
    re16 mib fa8 fa

    %160
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %163
    re16 mib fa8 fa
    sib, sib' re,
    mib do la'

    %166
    \stemUp sib, \stemDown sib'' re,
    do sib' la
    sib4.\fermata

}

IIIvlIIn =  \relative do'' {

    sib16(do re8) sib
    fa re' (do)
    sib16(do re8) sib

    %4
    fa re' (do)
    sib16(do re8) sib
    fa'16 (sol la8) fa

    %7
    sib8 sib,16 do re mib
    fa4 r8
    fa16 (sol lab8) fa

    %10
    sib,(re fa)
    re(fa lab)
    sol4 r8

    %13
    sol16(la? sib8) sol
    do,(mi sol)
    mi(sol sib)

    %16
    la4 r8
    la,16\p(sib do8) sib
    la16(sib do8) sib

    %19
    la16(sib do8) sib
    la4 r8
    fa16(sol la8 sib)

    %22
    do16(re mib8) re
    do16 sib la8 sol
    fa4 sib8\mbreak

    %25
    re,16 (mib fa8) fa
    sol4 mib8
    re16 mib fa8 fa

    %28
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %31
    re16 mib fa8 fa
    sib,4 r8
    R4.*17

    %50
    sib'16(do re8) sib
    fa(re') do

    %52
    sib16 (do re8) sib
    fa re' do
    sib4 r8

    %55
    R4.*7
    fa16(sol la8) sol
    fa la sol

    %64
    fa16(sol la8) sol
    fa la sol
    fa16(sol la8) sol

    %67
    fa16 (sol la8) fa
    sib do do,
    fa4 r8

    %70
    R4.*11\mbreak
    re'8 re,16 mi fa sol
    la8 la, la

    %83
    re' re,16 mi fa sol
    la8 la, la\mbreak
    re' re,16 mi fa sol

    %86
    la8 r re,16 mi
    fa sol la8 la,
    re4 r8

    %89
    re'16(mi fa8) mi
    re dod dod\mbreak
    re16 mi fa8 mi

    %92
    re dod dod
    do!4 r8
    si4 r8

    %95
    sib!4 r8
    la4.
    R4.*5

    %102
    re8\p r sib
    do r do
    re r re

    %105
    mib r mib
    sib r sib\mbreak
    do r do

    %108
    re r re
    mib r mib
    sib r sib

    %111
    do r do
    fa, r fa
    sib16(do re8) sib

    %114
    fa re' do
    sib16(do re8) sib
    fa re' do

    %117
    sib4 r8
    R4.*7\mbreak
    la16(sib do8) sib

    %126
    la16(sib do8) sib
    la16(sib do8) sib
    la4 r8

    %129
    fa16(sol la8 sib)
    do16(re mib8) re
    do16 sib la8 sol

    %132
    fa4 sib8
    re,16 mib fa8 fa
    sol4 mib8

    %135
    re16 mib fa8 fa
    sib,4 r8
    R4.*16
    fa'16\f (sol la8 sib)

    %154
    do16(re mib8) re
    do16(sib la8 sol)
    fa4 sib8

    %157
    re,16 mib fa8 fa
    sol4 mib8
    re16 mib fa8 fa

    %160
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %163
    re16 mib fa8 fa
    sib, sib' re,
    mib do la'

    %166
    \stemUp sib, \stemDown re' sib'
    sib do, do
    re4.\fermata

}

IIIvlan = \relative do'{

    re16(mib fa8) re
    sib sib' la
    re,16(mib fa8) re
    sib sib' la
    re,16(mib fa8) sol
    la16(sib do8) la
    fa mib16 re do sib
    la8\p la'16(sol fa mib)
    re16(mib fa8) sib,
    re16(mib fa8) sib,\mbreak
    fa'16 (sol lab8) fa
    sib, sib'16 lab sol fa
    mi16(fa sol8) do,
    mi16 fa sol8 do,
    sol'16 la? sib8 sol
    do, do'16 sib la sol
    fa8\p fa sib,
    fa' fa sib,
    fa' fa sib,
    fa'4 r8
    fa16 (sol la8 sib)\mbreak
    do16 (re mib8) re
    do16 sib la8 sol
    fa4 sib8
    re,16 (mib fa8) fa
    sol4 mib8
    re16 mib fa8 fa
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8
    re16 mib fa8 fa
    sib,4 r8
    R4.*17\mbreak

    %50
    re16(mib fa8) re
    sib (sib') la
    re,16(mib fa8) re
    sib sib' la
    re,4 r8
    R4.*7
    fa16(sol la8) sol
    fa la sol

    %64
    fa16(sol la8) sol
    fa la sol
    fa16(sol la8) sol

    %67
    fa16(sol la8) sol
    sib do do,
    fa4 r8

    %70
    R4.*11\mbreak
    re'8 re,16 mi fa sol
    la8 la, la

    %83
    re' re,16 mi fa sol
    la8 la, la\mbreak
    re' re,16 mi fa sol

    %86
    la8 r re,16 mi
    fa sol la8 la,
    re4 r8

    %89
    la'4 sol8
    la la la
    la4 sol8
    la la la
    la4 fa8
    re4.
    sol4 do,8
    do4.
    R4.*5
    re'8\p r sib
    do8 r do\mbreak
    re r re
    mib r mib
    sib r sib
    do r do
    re r re
    mib r mib
    sib r sib
    do r do
    fa,4 fa8
    re16(mib fa8) re
    sib sib' la
    re,16(mib fa8) re
    sib sib' la
    re,4 r8
    R4.*7
    fa8 fa sib,
    fa' fa sib,
    fa' fa sib,
    fa'4 r8

    %129
    fa16(sol la8 sib)
    do16(re mib8) re
    do16 sib la8 sol

    %132
    fa4 sib8
    re,16 mib fa8 fa
    sol4 mib8

    %135
    re16 mib fa8 fa\mbreak
    sib,4 r8
    R4.
    fa'8\p (fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa(fa fa)
    fa16\f (sol la8 sib)
    do16(re mib8) re
    do16(sib la8 sol)
    fa4 sib8

    %157
    re,16 mib fa8 fa
    sol4 mib8
    re16 mib fa8 fa

    %160
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %163
    re16 mib fa8 fa
    sib, sib' re,
    mib do fa

    %166
    sib, fa' fa
    sol fa fa
    fa4.\fermata

}

IIIbcn = \relative do {

    sib4 sib16 do
    re8 mib fa
    sib,4 sib16 do

    %4
    re8 mib fa
    sib, sib'16 la sol8
    fa4 mib8

    %7
    re do16 sib la sol
    fa8 fa'16 mib re do
    sib8 sib' re,

    %10
    sib sib' re,
    sib sib' re,
    mib sol16 fa mi re\mbreak

    %13
    do8 do' mi,
    do do' mi,
    do do' mi,

    %16
    fa4 r8
    R4.*4
    fa16(sol la8 sib)\mbreak

    %22
    do16(re mib8) re
    do16 sib la8 sol
    fa4 sib8

    %25
    re,16 (mib fa8) fa
    sol4 mib8
    re16 mib fa8 fa

    %28
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %31
    re16 mib fa8 fa
    sib,4 r8
    sib sib' sib,

    %34
    sib4 r8
    sib sib' sib,
    mib4 r8

    %37
    mib mib' mib,
    fa mib re
    mib sib' re,

    %40
    mib sib' re,
    mib sib' re,
    mib4 mi8\mbreak

    %43
    fa do' mi,
    fa do' mi,
    fa do' mi,

    %46
    fa4 fad8
    sol re' fad,
    sol re' fad,

    %49
    sol re' fad,
    sol4 sib,16 do
    re8 mib fa

    %52
    sib,4 sib16 do
    re8 mib fa
    sib, sib' re,\mbreak

    %55
    sib sib' re,
    sib sib' re,
    sib sib' sib,

    %56
    do do' mi,
    do do' mi,
    do do' mi,

    %59
    do do' mi,
    fa do' mi,
    fa do' mi,

    %62
    fa do' mi,
    fa do' mi,
    sol4 fa8\mbreak

    %65
    fa4 fa8
    sib do do,
    fa mi do

    %68
    fa mi do
    fa sib sib,
    fa' fa16 mib? re do

    %71
    si8 fa' re
    mib fa sol
    do, fa re

    %74
    mib fa sol
    do, sol' mi
    fa sol la

    %77
    re, sol mi\mbreak
    fa sol la
    re re,16 mi fa sol

    %80
    la8 la, la
    re' re,16 mi fa sol
    la8 la, la\mbreak

    %85
    re' re,16 mi fa sol
    la8 r re,16 mi
    fa sol la8 la,

    %88
    re la' la
    re,4 la'8
    re, la' la\mbreak

    %91
    re,4 la'8
    re, la' la
    re, re' re,

    %94
    sol4 r8
    do, do' do,
    fa fa16 mib re do

    %97
    sib4 r8
    mib4 r8
    fa4 r8

    %100
    sol4 r8
    la4 r8
    sib4 r8

    %103
    R4.*10
    sib,4 sib16 do
    re8 mib fa\mbreak

    %115
    sib,4 sib16 do
    re8 mib fa
    sib,4 r8

    %118
    sib sib' sib,
    sib4 r8
    mib sib' sol

    %121
    mi4 r8
    do do' mi,
    do4 r8

    %124
    fa do' la
    fa4 r8
    R4.*3

    %129
    fa16 (sol la8 sib)
    do16 (re mib8) re
    do16 sib la8 sol
    fa4 sib8

    %133
    re,16 mib fa8 fa\mbreak
    sol4 mib8
    re16 mib fa8 fa

    %136
    sib,4 r8
    R4.*16
    fa'16\f (sol la8 sib)

    %154
    do16(re mib8) re
    do16(sib la8 sol)
    fa4 sib8

    %157
    re,16 mib fa8 fa
    sol4 mib8\mbreak
    re16 mib fa8 fa

    %160
    sib,4 sib'8
    re,16 mib fa8 fa
    sol4 mib8

    %163
    re16 mib fa8 fa
    sib, sib' re,
    mib do fa

    %166
    sib, sib' sib,
    mib fa fa,
    sib4.\fermata

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*72
    <7->8 <5 4> <5->
    s4 <_!>8
    s4.*3
    s4 <_+>8
    s4.*3
    <_+>4.
    s4.*11
    <_!>4.
    <7 _!>
    s4.*22
    <7->4.
    s
    <4->
    <6>
    <7>

}

forma = {

    \key sib\major
    \time 3/8
    \tempo 4. = 70
    s4.*168
    \bar "|."
    \mark\markup \smaller\center-column {"Da""Capo"}

}

IIIvl = {
    \IIIglobal
    <<\IIIvln \forma>>

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

}
#(set-global-staff-size 16.5)


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
        title = \markup\smaller {"Concerto a cinque in Sib maggiore [RV 377]"}
        composer = \markup \center-column {"A. Vivaldi (1678 -1741)"}
    }

    \markup\huge "[1.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<
            \new Staff = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""principale"}
                \set Staff.shortInstrumentName = "vlp"
                \Ivl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Violetta"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello""Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc

            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 12)
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

    \markup\huge "[2.] Largo"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<
            \new Staff = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""principale"}
                \set Staff.shortInstrumentName = "vlp"
                \IIvl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Violetta"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello""Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc

            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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

    \markup\huge "[3.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<
            \new Staff = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""principale"}
                \set Staff.shortInstrumentName = "vlp"
                \IIIvl
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Violetta"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>
            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello""Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc

            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 12)
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
