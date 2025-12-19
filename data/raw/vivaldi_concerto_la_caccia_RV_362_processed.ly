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
    \senza
}

Ivln = \relative do'' {

    sib4 sib'8 sib, sib sib
    sib4 sib'8 sib, sib sib
    sib4 sib8 fa' mib re

    %4
    do4 fa, r
    fa r8 sol16[la sib do re mi]
    fa4 fa, r

    %7
    sib 4 sib'8 sib, sib sib
    sib4 lab'8 sib, sib sib
    sib4 sib8 lab' sol fa

    %10
    sol4 mib r
    mib, r8 fa16[sol lab sib do re]
    mib4 mib, r

    %13
    do' do'8 do, do do
    do4 sib'8 do, do do
    do4 do8 sib' la? sol

    %16
    la4 fa r
    fa, r8 sol16[la sib  do re mib]
    fa4 fa, r

    %19
    r8 sib' la sol fa mib
    re sol fa mib re do
    sib re do sib la sol

    %22
    fa4 fa'8 fa, fa fa
    fa4 mib'8 fa, fa fa
    fa4 re'8 fa, fa fa

    %25
    fa4 do'8 fa, fa fa\mbreak
    fa4 r r
    sib r8 do16[re mib fa sol la]

    %28
    sib8 sib, do4 la
    sib, r8 do16[re mib fa sol la]
    sib8 sib, do4 la

    %31
    \tuplet 3/2 {
        sib8-.\solo do-. sib-. re-.[mib-. re-.] fa-. sol-. fa-.
        sib do sib re[mib re] fa sol fa
    }
    sib4 sib, r

    %34
    <<
        {
            re4^1 re8 re mib mib
            re4 re8 re mib mib
            re4 re8 re mib mib

            %37
            re4 sib sib
            re4 re8 re mib mib
            re4 re8 re mib mib

            %40
            re4 re8 re mib mib
            re4 sib sib
        }\\{
            sib4_3 sib8 sib do do
            sib4 sib8 sib do do
            sib4 sib8 sib do do
            sib4 fa re
            sib'4 sib8 sib do do
            sib4 sib8 sib do do
            sib4 sib8 sib do do
            sib4 fa re
        }
    >>
    \tuplet 3/2 {
        sib'8(do) sib re[(mib) re] fa(sol) fa

        %43
        mib,(fa) mib sol[(la) sol] sib(do) sib
        do(re) do mib[(fa) mib] sol(la) sol
        fa,(sol) fa la[(sib) la] do(re) do

        %46
        re^1(mib) re fa[(sol) fa] la(sib) la
        sol,^1(la) sol sib[(do) sib] re(mib) re
        mib^1(fa) mib sol[(la) sol] sib(do) sib

        %49
        mib(re do) re[(do sib)] do((sib la)
        sib(la sol la)[sol(fa] mi) fa(sol
    }
    fa2.)

    %52
    \tuplet 3/2 {
        mib'8(re do re)[do(sib] do) sib(la
        sib) la(sol la)[sol(fa] mi) fa(sol
    }
    fa2.)

    %55
    <<
        {
            fa4^1 fa8 fa fa fa
            la4 fa8 fa fa fa
            la4 (sol fa)

            %58
            sol(fa mi)
            fa2.
        }\\{
            do4_2 do8 do la do
            do4 do8 do la do
            do2.~
            do~
            \once\stemUp \once \override Stem.transparent = ##t do2.
        }\\{\stemDown s2.*4 fa,2.}
    >>
    <<
        {
            fa'4 fa8 fa fa fa

            %61
            la4 fa8 fa fa fa
            la4 (sol fa)
            sol(fa mi)

            %64
            fa4
        }\\{
            do4 do8 do la do
            do4 do8 do la do
            do2.~
            do~
            \once\stemUp \once \override Stem.transparent = ##t do4
        }\\{\stemDown s2.*4 fa,4}
    >> fa'8 fa, fa fa
    fa4 fa'8 fa, fa fa\mbreak
    fa4 fa8 do' sib la

    %67
    sol4 r r
    do r8 re16[mi fa sol la sib]
    do4 do, r

    %70
    r8 fa mi re do sib
    la re do sib la sol
    fa do' sib la sol fa

    %73
    do4 do'8 do, do do
    do4 sib'8 do, do do
    do4 la'8 do, do do

    %76
    do4 sol'8 do, do do
    do2 r4\mbreak
    fa r8 sol16[la sib do re mi]

    %79
    fa8 fa, sol4 mi
    fa r8 sol16[la sib do re mi]
    fa8 fa, sol4 mi %%fine del tutti

    %82
    <<
        {
            do'8\solo^2 do do do do do
            re^2 re re re re re
            do do do do do do

            %85
            re re re re re re
            re^1 re re re re re
            mib!^2 mib mib mib mib mib

            %88
            re re re re re re\mbreak
            mib mib mib mib mib mib
            mi^0 mi mi mi mi mi

            %91
            fa fa fa fa fa fa
            mi mi mi mi mi mi
            fa fa fa fa fa fa
        }\\{
            fa,_2 la fa la fa la
            fa sib fa sib fa sib
            fa la fa la fa la
            fa sib fa sib fa sib
            sol_2 si sol si sol si
            sol_2 do sol do sol do
            sol si sol si sol si\mbreak
            sol do sol do sol do
            la_0 dod la dod la dod
            la re la re la re
            la dod la dod la dod
            la re la re la re
        }
    >>

    %94
    \tuplet 3/2 { sib'(la) sib sol[(fa) sol] mi(re) mi}
    dod[si16 la sol fa mi re] dod8 r
    \tuplet 3/2 { la''(sol) la fa[(mi) fa] re(do) re\mbreak }

    %97
    sib[la16 sol fa mi? re do] sib8 r
    \tuplet 3/2 { sol''(fa) sol mi[(re) mi] dod(si) dod }
    la[sol16 fa mi re dod si] la8 r

    %100
    \tuplet 3/2 {
        re'^2(fa) la re[(la) fa] re(fa) la
        sol,^2(sib) re sol[(re) sib] sol(sib) re
        do_2 mi sol do[sol mi] do mi sol

        %103
        fa,^2 la do fa[do la] fa la do\mbreak
        sib re fa sib[fa re] sib re fa
        mib, sol sib mib[sib sol] mib sol sib

        %106
        fad la do mib[do la] fad la do
        si re fa lab[fa re] si re fa
        mib do mib fa[re fa] sol mib sol

        %109
        lab fa lab fa[re fa] re si re
        fa, si re fa,[si re] fa, mib re\mbreak
        mib sol do mib,[sol do] re, sol si
    }

    %112
    do4\tu do'8 do, do do
    do4 do'8 do, do do
    do4 do'8 do, do do

    %115
    re4 si'8 fa fa fa
    fa4 si8 fa fa fa
    fa4 si8 fa fa fa

    %118
    mib4 do8 do, do do
    do4 sib'8 do, do do
    do4 lab'8 do, do do\mbreak

    %121
    do4 sol'8 do, do do
    fad8 re sol re la' re,
    sib' sol re'4 re,

    %124
    <<
        {
            sol'8\solo sol sol sol sol sol
            sib, sib sib sib sib sib
            sol' sol sol sol sol sol

            %127
            sib, sib sib sib sib sib
        }\\{
            re16(sib) re(sib) re(sib) re(sib) re(sib) re(sib)
            sol8 re sol re sol re
            re'16 sib re sib re sib re sib re sib re sib
            sol8 re sol re sol re
        }
    >>
    sol'16 sib la sib sol sib la sib sol sib la sol
    la8 fad re4 r\mbreak

    %130
    sib'16 la(sol) fa(sib) la(sol) fa(sib) la(sol) fa(
    sol4) mib8 mib, mib mib
    do''16_4 sib(la) sol(do) sib(la) sol(do) sib(la) sol(

    %133
    la4) fa8 fa, fa fa
    re''16 _4 do(sib) la(re) do(sib) la(re) do(sib) la(
    sib4) sol8 sol, sol sol

    %136
    mib''16_4 re(do) sib(mib) re(do) sib(mib) re(do) sib(
    la,8) fa do (fa la4)\mbreak
    sib8 fa sib, (fa' sib4)

    %139
    do8 fa, la, (fa' do'4)
    re8 fa, sib, (fa' re'4)
    mib8 fa, la, (fa' mib'4)

    %142
    mib8(do re2)
    sib'16(la) sol(fa) sol(fa) mib(re) mib(re) do(sib)
    do(sib) la(sol) la(sol) fa(mib) fa(mib) re(do)

    %145
    re8 fa' sib re, do la'
    sib4 r r\mbreak
    sib16(la) sol(fa) sol(fa) mib(re) mib(re) do(sib)

    %148
    do(sib) la(sol) la(sol) fa(mib) fa(mib) re(do)
    re8 fa' sib re, do la'
    sib sib la sol fa mib

    %151
    re sol fa mib re do
    sib re do sib la sol
    fa4 fa'8 fa, fa fa

    %154
    fa4 mib'8 fa, fa fa
    fa4 re'8 fa, fa fa
    fa4 do'8 fa, fa fa\mbreak

    %157
    fa4 r r
    sib r8 do16[re mib fa sol la]
    sib8 sib, do4 la

    %160
    sib, r8 do16[re mib fa sol la]
    sib8 sib, do4 la
    sib2.\fermata

}

IvlIn =  \relative do'' {

    sib4 sib'8 sib, sib sib
    sib4 sib'8 sib, sib sib
    sib4 sib8 fa' mib re

    %4
    do4 fa, r
    fa r8 sol16[la sib do re mi]
    fa4 fa, r

    %7
    sib 4 sib'8 sib, sib sib
    sib4 lab'8 sib, sib sib
    sib4 sib8 lab' sol fa

    %10
    sol4 mib r
    mib, r8 fa16[sol lab sib do re]
    mib4 mib, r

    %13
    do' do'8 do, do do
    do4 sib'8 do, do do
    do4 do8 sib' la? sol

    %16
    la4 fa r
    fa, r8 sol16[la sib  do re mib]
    fa4 fa, r

    %19
    r8 sib' la sol fa mib
    re sol fa mib re do
    sib re do sib la sol

    %22
    fa4 fa'8 fa, fa fa
    fa4 mib'8 fa, fa fa
    fa4 re'8 fa, fa fa

    %25
    fa4 do'8 fa, fa fa\mbreak
    fa4 r r
    sib r8 do16[re mib fa sol la]

    %28
    sib8 sib, do4 la
    sib, r8 do16[re mib fa sol la]
    sib8 sib, do4 la

    %31
    sib4 r r
    R2.
    fa''4 sib8 fa fa fa

    %34
    fa4 r r\mbreak
    R2.*29
    fa,4 fa'8 fa, fa fa

    %65
    fa4 fa'8 fa, fa fa\mbreak
    fa4 fa8 do' sib la

    %67
    sol4 r r
    do r8 re16[mi fa sol la sib]
    do4 do, r

    %70
    r8 fa mi re do sib
    la re do sib la sol
    fa do' sib la sol fa

    %73
    do4 do'8 do, do do
    do4 sib'8 do, do do
    do4 la'8 do, do do

    %76
    do4 sol'8 do, do do
    do2 r4\mbreak
    fa r8 sol16[la sib do re mi]

    %79
    fa8 fa, sol4 mi
    fa r8 sol16[la sib do re mi]
    fa8 fa, sol4 mi

    %82
    fa4 r r
    R2.*12
    dod'8[si16 la sol fa mi re] dod8 r

    %96
    R2.
    sib'8[la16 sol fa mi re do] sib8 r
    R2.

    %99
    la'8[sol16 fa mi re dod si] la8 r
    R2.*12
    do'4 do'8 do, do do
    do4 do'8 do, do do
    do4 do'8 do, do do

    %115
    re4 si'8 fa fa fa
    fa4 si8 fa fa fa
    fa4 si8 fa fa fa

    %118
    mib4 do8 do, do do
    do4 sib'8 do, do do
    do4 lab'8 do, do do\mbreak

    %121
    do4 sol'8 do, do do
    fad8 re sol re la' re,
    sib' sol re'4 re,

    %124
    sol4 r r
    R2.*6
    mib4 mib'8 mib, mib mib

    %132
    mi4 r r
    fa fa'8 fa, fa fa
    fad4 r r

    %135
    sol4 sol'8 sol, sol sol
    sol4 r r
    R2.*13
    r8 sib' la sol fa mib

    %151
    re sol fa mib re do
    sib re do sib la sol
    fa4 fa'8 fa, fa fa

    %154
    fa4 mib'8 fa, fa fa
    fa4 re'8 fa, fa fa
    fa4 do'8 fa, fa fa\mbreak

    %157
    fa4 r r
    sib r8 do16[re mib fa sol la]
    sib8 sib, do4 la

    %160
    sib, r8 do16[re mib fa sol la]
    sib8 sib, do4 la
    sib2.\fermata

}

IvlIIn = \relative do'' {

    R2.*3
    fa,4 fa'8 fa, fa fa
    fa4 fa'8 fa, fa fa

    %6
    fa4 fa8 mib' re do
    re4 sib r
    sib r8 do16[re mib fa sol lab]

    %9
    sib4 sib, r
    mib, mib'8 mib, mib mib
    mib4 reb'8 mib, mib mib

    %12
    mib4 mib8 reb' do sib\mbreak
    do4 lab r
    do r8 re16[mi fa sol la? sib]

    %15
    do4 do, r
    fa, fa'8 fa, fa fa
    fa4 fa8 mib' fa, fa

    %18
    fa4 fa8 mib' re do
    re4 r r
    r8 sib' la sol fa mib

    %21
    re fa mib re do sib
    la4 fa'8 fa, fa fa
    fa4 mib'8 fa, fa fa

    %24
    fa4 re'8 fa, fa fa
    fa4 do'8 fa, fa fa\mbreak
    fa4 r r
    sib r8 do16[re mib fa sol la]

    %28
    sib8 sib, do4 la
    sib, r8 do16[re mib fa sol la]
    sib8 sib, do4 la

    %31
    sib4 r r
    R2.
    re'4 fa8 re re re

    %34
    re4 r r\mbreak
    R2.*32
    do,4 do'8 do, do do

    %68
    do4 sib'8 do, do do
    do4 do8 sib' la sol
    fa4 r r

    %71
    r8 fa' mi re do sib
    la la sol fa mi re
    do4 do'8 do, do do

    %74
    do4 sib'8 do, do do
    do4 la'8 do, do do

    %76
    do4 sol'8 do, do do
    do2 r4\mbreak
    fa r8 sol16[la sib do re mi]

    %79
    fa8 fa, sol4 mi
    fa r8 sol16[la sib do re mi]
    fa8 fa, sol4 mi

    %82
    fa4 r r
    R2.*12
    dod'8[si16 la sol fa mi re] dod8 r

    %96
    R2.
    sib'8[la16 sol fa mi re do] sib8 r
    R2.

    %99
    la'8[sol16 fa mi re dod si] la8 r
    R2.*12
    mib''4 sol8 mib mib mib

    %113
    mib4 sol8 mib mib mib
    mib4 sol8 mib mib mib
    re4 fa8 re re re

    %116
    re4 fa8 re re re
    re4 fa8 re re re
    do4 do8 do, do do

    %119
    do4 sib'8 do, do do
    do4 lab'8 do, do do\mbreak

    %121
    do4 sol'8 do, do do
    fad8 re sol re la' re,
    sib' sol re'4 re,

    %124
    sol4 r r
    R2.*6
    mib4 mib'8 mib, mib mib

    %132
    mi4 r r
    fa fa'8 fa, fa fa
    fad4 r r

    %135
    sol4 sol'8 sol, sol sol
    sol4 r r
    R2.*14

    %151
    r8 sib' la sol fa mib
    re fa mib re do sib
    la4 fa'8 fa, fa fa

    %154
    fa4 mib'8 fa, fa fa
    fa4 re'8 fa, fa fa
    fa4 do'8 fa, fa fa\mbreak

    %157
    fa4 r r
    sib r8 do16[re mib fa sol la]
    sib8 sib, do4 la

    %160
    sib, r8 do16[re mib fa sol la]
    sib8 sib, do4 la
    sib2.\fermata

}

Ivlan =  \relative do' {

    re8 re re4 re
    re8 re16 re re4 re
    re8 re16 re re4 re

    %4
    la8 la16 la la4 la
    la8 la16 la la4 la
    la8 la16 la la4 la

    %7
    fa8 re'16 re re4 re
    re8 re16 re re4 re
    re8 re16 re re4 re

    %10
    sib8 sol16 sol sol4 sol
    sol8 sol16 sol sol4 sol
    sol8 sol16 sol sol4 sol\mbreak

    %13
    mib'8 mib16 mib mib4 lab
    sol8 sol16 sol sol4 sol
    sol8 sol16 sol sol4 mi

    %16
    do8 la16 la la4 la
    la8 la16 la la4 la
    la8 la16 la la4 la

    %19
    sib2.~
    sib~
    sib

    %22
    do4 la'8 fa fa fa
    fa4 do'8 fa, fa fa
    fa4 sib8 fa fa fa

    %25
    fa4 la8 fa fa fa\mbreak
    fa4 r r
    re8 re' la sol fa mib

    %28
    re4 la' fa
    re8 re' la sol fa mib
    re4 la' fa

    %31
    re r r
    R2.
    sib'4 sib8 sib sib sib

    %34
    sib4 r r\mbreak
    R2.*29
    la8 la16 la la4 la

    %65
    la8 la16 la la4 la\mbreak
    la8 la16 la la4 la
    mi8 mi16 mi mi4 mi

    %68
    mi?8 mi16 mi mi4 mi
    mi?8 mi16 mi mi4 mi
    fa2.~

    %71
    fa~
    fa
    sol4 do,8 do do do

    %74
    do4 sol'8 do, do do
    do4 fa8 do do do
    do4 mi8 do do do

    %77
    do2 r4\mbreak
    la4 r r
    la re do

    %80
    la r r
    la re do
    la r r

    %83
    R2.*12
    dod'8[si16 la sol fa mi re] dod8 r
    R2.

    %97
    sib'8[la16 sol fa mi re do] sib8 r
    R2.
    la'8[sol16 fa mi re dod si] la8 r

    %100
    R2.*12
    sol'8 sol16 sol sol4 sol
    sol8 sol16 sol sol4 sol

    %114
    sol8 sol16 sol sol4 sol
    si,8 si16 si si4 si
    si?8 si16 si si4 si

    %117
    si?8 si16 si si4 si
    sol4 do'8 do, do do
    do4 sib'8 do, do do

    %120
    do4 lab'8 do, do do\mbreak
    do4 sol'8 do, do do
    re4 re re
    sol re' re,

    %124
    sol r r
    R2.*6
    mib4 mib'8 mib, mib mib
    mi4 r r

    %133
    fa fa'8 fa, fa fa
    fad4 r r
    sol sol'8 sol, sol sol

    %136
    sol4 r r
    R2.*13
    sib,2.~

    %151
    sib~
    sib
    do4 la'8 fa fa fa

    %154
    fa4 do'8 fa, fa fa
    fa4 sib8 fa fa fa
    fa4 la8 fa fa fa

    %157
    fa4 r r\mbreak
    re8 re' la sol fa mib
    re4 sol do,

    %160
    re8 re' la sol fa mib
    re4 sol, do,
    re2.\fermata

}

Ibcn = \relative do {

    sib8 sib sib4 sib'
    sib,8 sib16 sib sib4 sib'
    sib,8 sib16 sib sib4 sib'

    %4
    fa,8 fa16 fa fa4 fa'
    fa,8 fa16 fa fa4 fa'
    fa,8 fa16 fa fa4 fa'

    %7
    sib,8 sib16 sib sib4 sib'
    sib,8 sib16 sib sib4 sib'
    sib,8 sib16 sib sib4 sib'

    %10
    mib,,8 mib16 mib mib4 mib'
    mib,8 mib16 mib mib4 mib'
    mib,8 mib16 mib mib4 mib'\mbreak

    %13
    lab,8 lab16 lab lab4 fa'
    mi8 mi16 mi mi4 mi'
    mi,?8 mi16 mi mi4 mi'?

    %16
    fa,8 fa,16 fa fa4 fa'
    fa,8 fa16 fa fa4 fa'
    fa,8 fa16 fa fa4 fa'

    %19
    sib,2.~
    sib~
    sib

    %22
    fa'4 fa8 fa fa fa
    fa4 fa8 fa fa fa
    fa4 fa8 fa fa fa

    %25
    fa4 fa8 fa fa fa\mbreak
    fa4 r r
    sib,8 sib' fa mib re do

    %28
    sib4 fa'8 fa fa, fa
    sib sib' fa mib re do
    sib4 fa'8 fa fa, fa

    %31
    sib4 r r
    R2.
    sib4 sib8 sib sib sib

    %34
    sib4 sib la\mbreak
    sib sib la
    sib sib la

    %37
    sib sib sib
    sib sib la
    sib sib la

    %40
    sib sib la
    sib sib sib
    sib2 re4

    %43
    mib2 r4
    mib2 r4
    fa2 r4\mbreak

    %46
    fa2 r4
    sol2 r4
    sol2 r4

    %49
    do sib la
    sol fa do
    fa fa8 fa fa fa

    %52
    do'4 sib la
    sol fa do\mbreak
    fa fa8 fa fa fa

    %55
    fa4 r r
    fa r r
    fa2.

    %58
    do'2 do,4
    fa fa8 fa fa fa
    fa4 r r

    %61
    fa r r
    fa2.
    do'2 do,4

    %64
    fa8 fa16 fa fa4 fa'
    fa,8 fa16 fa fa4 fa'\mbreak
    fa,8 fa16 fa fa4 fa'

    %67
    do,8 do16 do do4 do'
    do,8 do16 do do4 do'
    do,8 do16 do do4 do'

    %70
    fa,2.~
    fa~
    fa

    %73
    do4 do8 do do do
    do4 do8 do do do
    do4 do8 do do do

    %76
    do4 do8 do do do
    do2 r4\mbreak
    fa r r

    %79
    fa sib, do
    fa, r r
    fa' sib, do

    %82
    fa2 r4
    sib,2 r4
    fa'2 r4

    %85
    sib,2 r4
    sol'2 r4
    do,2 r4

    %88
    sol'2 r4\mbreak
    do,2 r4
    la'2 r4

    %91
    re,2 r4
    la'2 r4
    re,2 r4

    %94
    R2.
    dod'8[si16 la sol fa mi re] dod8 r
    R2.\mbreak

    %97
    sib'8[la16 sol fa mi re do] sib8 r
    R2.
    la'8[sol16 fa mi re dod si] la8 r

    %100
    fa'4 fa, fa'
    sib sib, sib'
    mi, mi, mi'

    %103
    la la, la'\mbreak
    re, re, re'
    sol sol, sol'

    %106
    re' fad, re'
    sol, sol, sol'
    do, re mib

    %109
    fa re fa
    sol  sol, sol'\mbreak
    do, sol' sol,

    %112
    do8 do16 do do4 do'
    do,8 do16 do do4 do'
    do,8 do16 do do4 do'

    %115
    sol,8 sol16 sol sol4 sol'
    sol,8 sol16 sol sol4 sol'
    sol,8 sol16 sol sol4 sol'

    %118
    do,4 do'8 do, do do
    do4 sib'8 do, do do
    do4 lab'8 do, do do\mbreak

    %121
    do4 sol'8 do, do do
    re4 re re
    sol re' re,

    %124
    sol r r
    sol r r
    sol r r

    %127
    sol r r
    sol r r
    re re'8 re, re re\mbreak

    %130
    re4 r r
    mib mib'8 mib, mib mib
    mi4 r r

    %133
    \clef tenor \key sib\major fa fa'8 fa, fa fa
    fad4 r r
    sol sol'8 sol, sol sol

    %136
    sol4 r r
    \clef bass \key sib\major fa4 r8 fa fa, fa'\mbreak
    sib4 r8 sib, re sib

    %139
    fa'4 r8 fa la fa
    sib4 r8 sib re, sib
    fa'4 r8 fa la fa

    %142
    sib4 sib,8 do re do
    sib4 r r
    R2.

    %145
    sib4 r8 sib fa' fa,
    sib4  sib'8 sib, sib sib\mbreak
    sib4 r r

    %148
    R2.
    sib4 r8 sib fa' fa,
    sib2.~

    %151
    sib~
    sib
    fa'4 fa8 fa fa fa

    %154
    fa4 fa8 fa fa fa
    fa4 fa8 fa fa fa
    fa4 fa8 fa fa fa

    %157
    fa4 r r\mbreak
    sib,8 sib'  fa mib re do
    sib4 mib fa

    %160
    sib,8 sib' fa mib re do
    sib4 mib fa
    sib,2.\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*5
    s4 <7> s
    s2.
    s4 <7-> s
    s2.*2
    s4 <7-> s
    s2.*2
    s4 <6 5> s
    s2.*2
    s4 <7> s
    s2.*5
    s4 <7 5>2
    s4 <6 4>2
    s4 <5 3>2
    s2.*18
    <6>2.  %%OK bar 44
    s
    <6>
    s
    <6>
    s
    s2 <_!>4
    s2.*2
    s2 <_!>4
    s2.*14
    s4 <7>2  %%%%% ok bar 68
    s2.*5
    s4 <7 5>2
    s4 <6 4>  s
    s <5 3> s
    s2.*9
    <_!>2.
    s
    <_!>
    s
    <_+>
    s
    <_+>
    s2.*14
    <_!>2.
    s
    <_->
    <7 _!>
    s4 <6 4> <5 3!>
    s2.*3
    <_!>4 <7> s
    s2.*6
    <_+>4 <6 4> <5 3+>
    s2.*6
    <_+>2.
    <6>
    s
    <6>
    s
    <6>
    s
    <6>
    s2.*4
    <7>2.
    <6 4>4 < 5 3> s
    s2.*11
    s4 <7 5>2
    s4 <6 4>  s
    s <5 3> s

}

forma = {

    \key sib\major
    \time 3/4
    \tempo 2 = 65
    s2.*162
    \bar"|."

}

Ivl = {
    \Iglobal
    \notypeset
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
    \typeset

}

IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIvln = \relative do'' {

    la'8\solo re,16 sib' mi,8 fa16 sol dod,8 re r la'
    sib8 la16 sib re,8 mi16 fa mi re do8 r sib'
    la16 re do re, mi8. fa16 fa2

    %4
    la8 fad16 la do,8 la'\mbreak sib16 la sol8 r dod,
    re16 sib' la sol fad8.\tr sol16 sol4 r8 re
    la'8 re,16 sib' mi,8 fa16 sol dod,8 re r la'

    %7
    sib,8 mi16(sol) si,8 dod16(re) dod8 fa16(la) dod,8 re16(mi)
    re8 sol16(sib) mi,8 fa16(sol)\mbreak sol,4. sol'8
    fa mi16 re dod8.\tr re16 re2\fermata

}

IIbcn = \relative do {

    re'8 re, sol[sol,] la' sib r fa
    sol fa si,[sol] do do, r do'
    fa16 sib la sib do8 do, fa2

    %4
    fad8 re la' fad\mbreak sol sol, r mib'
    re do re[re,] sol4 r8 sol'
    fa re sol sol, la' sib r fa

    %7
    sol sol, sol'[fa] mi la la sol
    fa sib sol sol,\mbreak  la si dod la
    re sol la[la,] re2\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <_+>
  s4 s8 <7> s2
  s1
  s2 s4 s8 <6+>
  s1
  s2 <_+>
  s4 <_!> <_+>2
  s4 <6> <7 _+>

}

forma = {

  \key fa\major
  \time 4/4
  \tempo 4 = 45
  s1*3
  \bar ":..:"\break
  s1*6
  \bar":|."

}

IIvl = {
  \IIglobal
  \notypeset
  <<\IIvln \forma>>

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
  \terzine\con
}

IIIvln = \relative do'' {

    sib16(re fa8) sib
    sib, fa sib,
    sib'16(re fa8) sib

    %4
    sib, fa sib,
    sib' la16 sol fa mib
    re8 do sib

    %7
    sib'16(re fa8) sib
    sib, fa sib,
    sib'16(re fa8) sib

    %10
    sib, fa sib,
    fa'' mib16 re do sib
    fa4.

    %13
    do'16\p(reb mib8) reb
    do(sib) do\mbreak
    do16(reb mib8) reb

    %16
    do(sib) do
    sib'16 \f sib, sib'4
    sib16 sib, sib'4

    %19
    sib16 sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %22
    re,8 mib do
    sib4 r8
    sib'16\p sib, sib'4

    %25
    sib16 sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %28
    sib16 sib, sib'4\mbreak
    re,8 mib do
    sib16\solo(re fa) sib sib sib

    %31
    sib,(re fa) sib sib sib
    la,(do fa) la la la
    la,(do fa) la la la

    %34
    sol,(sib mib) sol sol sol
    sol,(sib mib) sol sol sol
    fa,(la re) fa fa fa

    %37
    fa,(la re) fa fa fa
    mib,(sol sib) mib mib mib
    mib,(sol sib) mib mib mib\mbreak

    %40
    la,8 fa r
    re'16_2(fa sib) re re re
    re,16(fa sib) re re re

    %43
    mib,_2(sol sib) re re re
    mib,(sol sib) re re re
    mib,(sol sib) mib mib mib

    %46
    mib,(sol sib) mib mib mib
    fa,_2(la do) mib mib mib
    fa,(la do) mib mib mib

    %49
    fa,(la do) fa fa fa
    fa,(la do) fa fa fa
    fa,(sib re) fa fa fa\mbreak

    %52
    fa,(sib re) fa fa fa
    fa,(la do) fa fa fa

    %54
    fa,(la do) fa fa fa
    fa,(sib re) fa fa fa
    fa,(sib re) fa fa fa

    %57
    do8 fa, r
    <<{fa8. mi16 re8
       do8. sib16 la8

       %60
       fa fa mi
       la4}\\{la r8
              mi4 fa8
              la, sib do
              \stemUp \override Stem.transparent = ##t fa}\\{s4.*3 \stemDown do4}>> r8
    <<{fa'8. mi16 re8

       %63
       do8. sib16 la8
       fa fa mi}\\{la4 r8
              mi4 fa8
              la, sib do}>>
    fa16(la do8) fa

    %66
    do fa, do
    fa16(la do8) fa
    do fa, do

    %69
    do' sib16 la sol fa
    mi8 re do
    sol'16(sib re8) sol

    %72
    re sol, re
    sol16(sib re8) sol
    re sol, re

    %75
    re' do16 sib la sol
    fad8 mi re\mbreak
    sol'16\p sol, sol'4

    %78
    sol,16 sol, sol'4
    sol'16 sol, sol'4
    sol,16 sol, sol'4

    %81
    sol'16 sol, sol'4
    sol8 la fad
    sol16\solo sol re sol sib, do\mbreak

    %84
    sol sib re, sol sib, re
    sol,4 sol''8
    sib(la sol)

    %87
    sol4\tr fad8
    r16 sol re sol sib, re
    sol, sib re, sol sib, re

    %90
    sol,4 sib''8_2
    re(do sib)
    sib4\tr la8

    %93
    r16 re la re fad, la
    re,(mi fad) sol la sib
    do8(sib la)

    %96
    sib16 sol re sol sib, re\mbreak
    sol,(la si) do re mib
    fa8(mib) re

    %99
    mib(re) do
    reb(do) si
    do16 re mib fa sol8

    %102
    do, re si
    do16(mib sol8) do
    do,8 sol do,

    %105
    do'16(mib sol8) do
    do,8 sol do,
    do' sib16 lab sol fa

    %108
    mib8 re do
    do'16(mib sol8) do\mbreak
    do,8 sol do,

    %111
    do'16(mib sol8) do
    sol, fa16 mib re do
    sol4 r8

    %114
    mib''16\p(fa sol8) fa
    mib(re) mib
    mib16(fa sol8) fa

    %117
    mib(re) mib
    mib fa re
    do8\solo do8.\tr(si32 do)

    %120
    re8 re8.\tr(do32 re)
    mib8 mib8.\tr(re32 mib)
    fa8 fa8.\tr(mib32 fa)

    %123
    sol8 mib do\mbreak
    sol'8 sol8.\tr(fad32 sol)
    la8 la8.\tr(sol32 la)

    %126
    sib8_2 sib8.\tr(la32 sib)
    do8 do8.\tr(sib32 do)
    re8 sib sol

    %129
    \tuplet 3/2 { sib16(do re) sib[(do re)] sib(do re)
    \senza mib,(fa sol) mib[(fa sol)] mib(fa sol)
    la(sib do) la[(sib do)] la(sib do)

    %132
    re,(mib fa) re[(mib fa)] re(mib fa)
    sol(la sib) sol[(la sib)] sol(la sib)\mbreak
    do, re mib do[re mib] do re mib

    %135
    fa sol la fa[sol la] fa sol la
    sib, do re sib[do re] sib do re
    mib, fa sol mib[fa sol] mib fa sol

    %138
    do re mib do[re mib] do re mib
    fa, sol la fa[sol la] fa sol la
    re mib fa re[mib fa] re mib fa

    %141
    sol,la sib sol[la sib] sol la sib
    mib fa sol mib[fa sol]} mib8
    la,4 r8

    %144
    fa16(la do8) mib
    la,16(do mib8) la
    sib16 la sol fa mib re

    %147
    do sib la sol fa mib
    re8 sib r
    reb''(do) sib

    %150
    dob(sib) la
    sib(fa) reb'
    do?16 sib la8.\tr[sib16]

    %153
    sib4 r8
    reb,(do) sib\mbreak
    dob(sib) la

    %156
    sib fa reb'
    do?16[sib] la8.\tr sib16
    sib16(re fa8) sib

    %159
    sib, fa sib,
    sib'16(re fa8) sib
    sib, fa sib,

    %162
    sib''16  sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %165
    sib16 sib, sib'4
    sib16 sib, sib'4
    re,8 mib do

    %168
    sib la16 sol fa mib\mbreak
    re8 sib fa'
    mib do fa

    %171
    sib,4 fa'8
    mib do fa
    sib,4.\fermopz

}

IIIvlIn =  \relative do'' {

    sib16(re fa8) sib
    sib, fa sib,
    sib'16(re fa8) sib

    %4
    sib, fa sib,
    sib' la16 sol fa mib
    re8 do sib

    %7
    sib'16(re fa8) sib
    sib, fa sib,
    sib'16(re fa8) sib

    %10
    sib, fa sib,
    fa'' mib16 re do sib
    fa4.

    %13
    do'16\p(reb mib8) reb
    do(sib) do\mbreak
    do16(reb mib8) reb

    %16
    do(sib) do
    sib'16 \f sib, sib'4
    sib16 sib, sib'4

    %19
    sib16 sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %22
    re,8 mib do
    sib4 r8
    sib'16\p sib, sib'4

    %25
    sib16 sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %28
    sib16 sib, sib'4\mbreak
    re,8 mib do
    sib4 r8

    %31
    R4.*34
    fa16(la do8) fa

    %67
    do fa, do
    fa16(la do8) fa
    do fa, do

    %70
    do' sib16 la sol fa
    mi8 re do
    sol'16(sib re8) sol

    %73
    re sol, re
    sol16(sib re8) sol
    re sol, re

    %76
    re' do16 sib la sol
    fad8 mi re\mbreak
    sol'16\p sol, sol'4

    %79
    sol,16 sol, sol'4
    sol'16 sol, sol'4
    sol,16 sol, sol'4

    %82
    sol'16 sol, sol'4
    sol8 la fad
    sol4 r8\mbreak

    %85
    R4.*19
    do,16(mib sol8) do
    do,8 sol do,

    %106
    do'16(mib sol8) do
    do,8 sol do,
    do' sib16 lab sol fa

    %109
    mib8 re do
    do'16(mib sol8) do\mbreak
    do,8 sol do,

    %112
    do'16(mib sol8) do
    sol, fa16 mib re do
    sol4 r8

    %115
    mib''16\p(fa sol8) fa
    mib(re) mib
    mib16(fa sol8) fa

    %118
    mib(re) mib
    mib fa re
    do4 r8

    %121
    R4.*9
    sol8\p sol sol
    do, do do

    %132
    fa fa fa
    sib, sib sib
    mib mib mib\mbreak

    %135
    la, la la
    re re re
    sol sol sol

    %138
    do, do do
    la' la la
    re, re re

    %141
    sib' sib sib
    mib, mib mib
    do' do do\mbreak

    %144
    fa,4 r8
    R4.*14
    sib16(re fa8) sib

    %160
    sib, fa sib,
    sib'16(re fa8) sib
    sib, fa sib,

    %163
    sib''16  sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %166
    sib16 sib, sib'4
    sib16 sib, sib'4
    re,8 mib do

    %169
    sib la16 sol fa mib\mbreak
    re8 sib fa'
    mib do fa

    %170
    sib,4 fa'8
    mib do fa
    sib,4.\fermopz

}

IIIvlIIn = \relative do'' {

    sib16(re fa8) sib
    sib, fa sib,
    sib'16(re fa8) sib

    %4
    sib, fa sib,
    sib' la16 sol fa mib
    re8 do sib

    %7
    sib'16(re fa8) sib
    sib, fa sib,
    sib'16(re fa8) sib

    %10
    sib, fa sib,
    fa'' mib16 re do sib
    fa4.

    %13
    la16\p(sib do8) sib
    la(sol) la\mbreak
    la16(sib do8) sib

    %16
    la(sol) la
    sib'16 \f sib, sib'4
    sib16 sib, sib'4

    %19
    sib16 sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %22
    re,8 mib do
    sib4 r8
    sib'16\p sib, sib'4

    %25
    sib16 sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %28
    sib16 sib, sib'4\mbreak
    re,8 mib do
    sib4 r8

    %31
    R4.*34
    fa16(la do8) fa

    %66
    do fa, do
    fa16(la do8) fa
    do fa, do

    %69
    do' sib16 la sol fa
    mi8 re do
    sol'16(sib re8) sol

    %72
    re sol, re
    sol16(sib re8) sol
    re sol, re

    %75
    re' do16 sib la sol
    fad8 mi re\mbreak
    sol'16\p sol, sol'4

    %78
    sol,16 sol, sol'4
    sol'16 sol, sol'4
    sol,16 sol, sol'4

    %81
    sol'16 sol, sol'4
    sol8 la fad
    sol4 r8\mbreak

    %84
    R4.*19
    do,16(mib sol8) do
    do,8 sol do,

    %105
    do'16(mib sol8) do
    do,8 sol do,
    do' sib16 lab sol fa

    %108
    mib8 re do
    do'16(mib sol8) do\mbreak
    do,8 sol do,

    %111
    do'16(mib sol8) do
    sol, fa16 mib re do
    sol4 r8

    %114
    do'16\p(re mib8) re
    do (si) do
    do16(re mib8) re

    %117
    do (si) do
    do re si
    do4 r8

    %120
    R4.*9
    sol8\p sol sol
    do, do do

    %131
    fa fa fa
    sib, sib sib
    mib mib mib\mbreak

    %134
    la, la la
    re re re
    sol sol sol

    %137
    do, do do
    la' la la
    re, re re

    %140
    sib' sib sib
    mib, mib mib
    do' do do\mbreak

    %143
    fa,4 r8
    R4.*14
    sib16(re fa8) sib

    %159
    sib, fa sib,
    sib'16(re fa8) sib
    sib, fa sib,

    %162
    sib''16  sib, sib'4
    sib16 sib, sib'4
    sib16 sib, sib'4

    %165
    sib16 sib, sib'4
    sib16 sib, sib'4
    re,8 mib do

    %168
    sib la16 sol fa mib\mbreak
    re8 sib fa'
    mib do fa

    %171
    sib,4 fa'8
    mib do fa
    sib,4.\fermopz

}

IIIvlan =  \relative do' {

    fa8 fa16 mib re8
    fa8 fa16 mib re8
    fa8 fa16 mib re8

    %4
    fa8 fa16 mib re8
    sib' la16 sol fa mib
    re8 do sib

    %7
    fa'8 fa16 mib re8
    fa8 fa16 mib re8
    fa8 fa16 mib re8

    %10
    fa8 fa16 mib re8
    fa mib16 re do sib
    fa'4.

    %13
    fa4\p sib,8
    fa'4 fa8\mbreak
    fa4 sib,8

    %16
    fa'4 fa8
    re'\f re re
    do do do

    %19
    sib sib sib
    la la la
    sol sol sol

    %22
    fa do' la
    sib4 r8
    re\p re re

    %25
    do do do
    sib sib sib
    la la la

    %28
    sol sol sol\mbreak
    fa do' la
    sib4 r8

    %31
    R4.*34
    do,8 do16 sib la8
    la do16 sib la8

    %67
    do8 do16 sib la8
    la do16 sib la8
    do' sib16 la sol fa

    %70
    mi8 re do
    re re16 do sib8
    sib re16 do sib8

    %73
    re re16 do sib8
    sib re16 do sib8
    re' do16 sib la sol

    %76
    fad8 mi re\mbreak
    sib\p sib sib
    la la la

    %79
    sol sol sol
    fa fa fa
    mib mib mib

    %82
    re' mib re
    sib4 r8\mbreak
    R4.*19

    %103
    sol'8 sol16 fa mib8
    sol8 sol16 fa mib8
    sol8 sol16 fa mib8

    %106
    sol8 sol16 fa mib8
    do' sib16 lab sol fa
    mib8 re do

    %109
    sol'8 sol16 fa mib8
    sol8 sol16 fa mib8
    sol8 sol16 fa mib8

    %112
    sol fa16 mib re do
    sol4 r8
    do4 sol8

    %115
    do4 do,8
    do'4 sol8
    do4 do,8

    %118
    do' fa, sol
    do4 r8
    R4.*38

    %158
    fa8 fa16 mib re8
    re fa16 mib re8
    fa8 fa16 mib re8

    %161
    re fa16 mib re8
    re8 re re
    do do do

    %164
    sib sib sib
    la la la
    sol sol sol

    %167
    fa' sol la
    sib la16 sol fa mib\mbreak
    re8 sib fa'

    %170
    mib do fa
    sib,4 fa'8
    mib do fa

    %173
    sib,4.\fermata

}

IIIbcn = \relative do {

    sib'8 re16 do sib8
    sib, re16 do sib8
    sib'8 re16 do sib8

    %4
    sib, re16 do sib8
    sib' la16 sol fa mib
    re8 do sib

    %7
    sib'8 re16 do sib8
    sib, re16 do sib8
    sib'8 re16 do sib8

    %10
    sib, re16 do sib8
    \clef tenor \key sib\major fa''8 mib16 re do sib
    \clef bass \key sib\major fa8 la16 sol fa8

    %13
    R4.*4
    sib8 sib sib
    la la la

    %19
    sol sol sol
    fa fa fa
    mib mib mib

    %22
    sib' mib, fa
    sib,4 r8
    sib'\p sib sib

    %25
    la la la
    sol sol sol
    fa fa fa

    %28
    mib mib mib\mbreak
    sib' mib, fa
    sib,4 r8

    %31
    sib4 r8
    fa'4 r8
    fa4 r8

    %34
    mib4 r8
    mib4 r8
    re4 r8

    %37
    re4 r8
    sol4 r8
    sol4 r8\mbreak

    %40
    fa fa16 mib re do
    sib4 r8
    sib'4 r8

    %43
    sol4 r8
    sol4 r8
    sol4 r8

    %46
    sol4 r8
    la4 r8
    la4 r8

    %49
    la4 r8
    la4 r8
    sib4 r8\mbreak

    %52
    sib4 r8
    la4 r8
    la4 r8

    %55
    sib4 r8
    sib4 r8
    la8 do16 sib la sol

    %58
    fa4 sib8
    do4 fa,8
    la sib do

    %61
    fa, do'16 sib la sol
    fa4 sib8\mbreak
    do4 fa,8

    %64
    la sib do
    fa, la16 sol fa8
    fa, la16 sol fa8

    %67
    fa' la16 sol fa8
    fa, la16 sol fa8
    do'' sib16 la sol fa

    %70
    mi8 re do
    sol' sib16 la sol8
    sol, sib16 la sol8

    %73
    sol' sib16 la sol8
    sol, sib16 la sol8
    re'' do16 sib la sol

    %76
    fad8 mi re\mbreak
    sol sol sol
    fa? fa fa

    %79
    mib mib mib
    re re re
    do do do

    %82
    sib do re
    sol,4 r8\mbreak
    sol4 r8

    %85
    sol4 r8
    sol16 la sib8 do
    re4 re,8

    %88
    sol4 r8
    sol4 r8
    sol4 r8

    %91
    sol16 la sib8 do
    re4 re,8
    re'4 r8

    %94
    fad4 r8
    re4 r8
    sol4 r8\mbreak

    %97
    si,4 r8
    sol4 r8
    do4 mib8

    %100
    fa4 sol8
    mib re do
    mib fa sol

    %103
    do, mib16 re do8
    do mib16 re do8
    do mib16 re do8

    %106
    do mib16 re do8
    do' sib16 lab sol fa
    mib8 re do

    %109
    do mib16 re do8\mbreak
    do mib16 re do8
    do mib16 re do8

    %112
    sol' fa16 mib re do
    sol4 r8
    R4.*4

    %118
    do8 fa, sol
    do' mib, do
    sol' si, sol

    %121
    do' mib, do
    re' si sol
    do4 do,8\mbreak

    %124
    sib' sol sol,
    fad' la, fad
    sol' sib, sol

    %127
    la' fad re
    sib' sol sol,
    R4.*14

    %143
    fa'16 sol la sib do la
    fa4 r8
    fa4 r8

    %146
    sib,4 r8
    R4.
    sib16 do re8 do

    %149
    sib4.
    mib4 fa8
    reb4 sib8

    %152
    mib fa fa,
    sib16 do reb8 do
    sib4.\mbreak

    %155
    mib4 fa8
    reb4 sib8
    mib fa fa,

    %158
    sib' re16 do sib8
    sib, re16 do sib8
    sib' re16 do sib8

    %161
    sib, re16 do sib8
    sib'8 sib sib
    la la la

    %164
    sol sol sol
    fa fa fa
    mib mib mib

    %167
    sib' mib, fa
    sib la16 sol fa mib\mbreak
    re8 sib fa'

    %170
    mib do fa
    sib,4 fa'8
    mib do fa

    %173
    sib,4.\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4.*37
  <6>4.
  s4.*6
  <6>4.
  s4.*3
  <6>4.
  s4.*9
  <_!>4.
  s4.*3
  <_!>4.
  s4.*23
  <5 4>4 <3+>8
  s4.*4
  <6 4>4 <5 3+>8
  s4.
  s
  <7>
  s
  s
  <7>
  s
  <6->4 <_!>8
  s4.*48
  <_->4.
  <6->
  s4 <_->8
  s4.*2
  <_->4.
  <6->
  s4 <_->8

}

forma = {

  \key sib\major
  \time 3/8
  \tempo 4. = 70
  s4.*173
  \bar"|."

}

IIIvl = {
  \IIIglobal
  %\notypeset
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
  \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\header {
  title = \markup\smaller {"Concerto ”La Caccia” RV 362"}
  composer = \markup \center-column{"A. Vivaldi (1678-1741)"}
}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[1.] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"principale"}
                \Ivl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Alto"\vspace #-0.2"Viola"}
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Organo e"\vspace #-0.2"Violoncello"}
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup\huge "[2.] Adagio"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  = "main"
        \with {
            fontSize = #+2
            \override StaffSymbol #'staff-space = #(magstep +2)}
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvl
            >>

            \new Staff
        \with {
            fontSize = #+2
            \override StaffSymbol #'staff-space = #(magstep +2)}
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #11
                \override BarLine.hair-thickness = #1.2
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[3.] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \IIIvl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
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
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
