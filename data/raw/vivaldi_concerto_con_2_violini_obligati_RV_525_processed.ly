\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

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

ds = _\markup \italic \center-align \center-column{"D.C.""al Segno"}

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
    \tupletSpan 4
}

IvlIn = \relative do'' {

    \tuplet 3/2 { sib8 re fa sib[fa re] sib fa re }
    sib4 r r \senza
    \tuplet 3/2 { sib'8\p re fa sib[fa re] sib fa re }

    %4
    sib4 r r
    \tuplet 3/2 { la'8\f do fa la[fa do] la fa do }
    la4 r r

    %7
    \tuplet 3/2 { la'8\p do fa la[fa do] la fa do }
    la4 r r
    \tuplet 3/2 {
        fa''8\f re fa fa[re fa] fa re fa\mbreak

        %10
        sol mib sol sol[mib sol] sol mib sol
        fa\p re fa fa[re fa] fa re fa
        sol mib sol sol[mib sol] sol mib sol
    }

    %13
    fa4 r r
    fa8.\f[fa16 re8. re16 sib8. sib16]  %%%%% ripresa
    sol4 fad'(sol)

    %16
    sol8.[sol16 mi8. mi16 do8. do16]
    la4 sold'(la)
    la8.[la16 fad8. fad16 re8. re16]\mbreak

    %19
    sib4 la'(sib)
    mib,8.[mib16 sol8. sol16 sib8. sib16]
    la,8. [la16 do8. do16 mib8. mib16]

    %22
    fa,8. [fa16 la8. la16 mib'8. mib16]
    re4 r r
    sib'16 la sol fa sib la sol fa sib la sol fa

    %25
    sib8 re, mib do fa fa,
    sib16 la sol fa sib la sol fa sib la sol fa
    sib8 re, mib do fa la,\mbreak

    %28
    \tuplet 3/2 {
        sib'\solo sib' la sol[fa mib] re do sib  %%%fine ripresa
        \once\stemUp sib, re'' do sib[la sol] fa mib re
        \once\stemUp sib, sib'' re re,[sib' re] re, sib' re

        %31
        mib, la do mib,[la do] mib, la do
        re, fa sib re,[fa sib] re, fa sib
        do, fa la do, [fa la] do, fa la

        %34
        re, fa sib re,[fa sib] re, fa sib\mbreak
    }
    do,4 r r
    fa16 la sol fa sib fa re sib lab'8 sol16 fa

    %37
    \appoggiatura lab?8 sol16(fa sol8) \appoggiatura lab sol16(fa sol8) \appoggiatura lab sol16(fa sol8)
    sol16 sib la? sol do sol mi do sib'8 la16 sol
    \appoggiatura sib8 la16(sol la8) \appoggiatura sib8 la16(sol la8) \appoggiatura sib8 la16(sol la8)

    %40
    la16 do sib la re la fad re do'8 sib16 la
    \appoggiatura do8 sib16(la sib8) \appoggiatura do8 sib16(la sib8) \appoggiatura do8 sib16(la sib8)\mbreak
    do16(sib do re) do(sib do re) do(sib do re)

    %43
    la8-.(la-. la-. la-.) la4\tr
    sib16(la sib do) sib(la sib do) sib(la sib do)
    sol8-.(sol-. sol-. sol-.) sol4\tr

    %46
    la16(sol la sib) la(sol la sib) la(sol la sib)
    fad8-.(fad-. fad-. fad-.) fad4\tr
    sol16(la sib8)~sib4 la16 (sib do8)

    %49
    sib16(do re8)~re4 fad,16(sol la8)\mbreak
    sol16 sib la sol \once\stemUp re, la'' sol fad \once\stemUp re, la'' sol fad
    <<sol4\\{\senza \tuplet 3/2 { sol,8 sib re}}>>  \tuplet 3/2 { sol[re sib] sol re sib }

    %52
    sol4 r r
    \tuplet 3/2 { la'8 do fad la[fad do] la fad re }
    la4 r r

    %55
    re'8.[re16 sib8. sib16 sol8. sol16]
    mib4 re'(mib)
    mi8.[mi16 dod8. dod16 la8. la16]\mbreak

    %58
    fad4 mi'(fad)
    la8. la16 fad8. fad16 do8. do16
    sib8.[sol16 sib8. sib16 re8. re16]

    %61
    sol fa mib! re sol fa mib re sol fa mib re
    sol8 sib, do la re re,
    sol16 fa mib re sol fa mib re sol fa mib re

    %64
    sol8 sib, do la re re
    sol,4 sol''\solo~sol8. sib16\mbreak %%fine p 5
    la4 do(si8.) si16

    %67
    \appoggiatura si?8 do4 do, do'
    sib?32(do re8.) sib32(la sol8.) la32(sol fad8.)
    \appoggiatura fad?8 sol4 r r

    %70
    R2.*3
    sol'16 re sib sol re sol sib re sol fa mib re\mbreak
    mib8 sol, do sol mib' do\tr

    %75
    fa16 do la fa do fa la do fa mib re do
    re8 fa, sib fa re' sib\tr
    mib16 sib sol mib sib mib sol sib mib re do sib

    %78
    do8 mib, sol mib do' la\tr
    re16 la fad re la re fad la re do sib la
    \con \tuplet 3/2 { sib8(re sib) } re,2

    %81
    \tuplet 3/2 { mib8(sol mib) } sol,2\mbreak
    \tuplet 3/2 { la'8(do la) } do,2
    \tuplet 3/2 { re8(fa re) } fa,2

    %84
    \tuplet 3/2 { sol'8(sib sol) } dod,2
    \tuplet 3/2 { fa8(la fa) } re2
    \tuplet 3/2 { sol8(sib sol) } dod,2

    %87
    re16 dod re la fa' mi fa re la' sol la fa
    sib8 \once\stemUp sol, r8 re' sol sib
    do,16 si do sol mi' re mi do sol' fa sol mi\mbreak

    %90
    la8 \once\stemUp fa, r do' fa la
    sib,16 la sib sol re' do re sib fa' mib? fa re
    sol8 \once\stemUp mi, r sib'? mi sol

    %93
    dod,16 sib dod la mi' re mi dod sol' fa sol mi
    re dod re la fa' mi fa re la'8 r
    r16 re do sib la8 sol fa mi

    %96
    \tuplet 3/2 { re fa la re[la fa] re la fa }\mbreak
    mi4 r r
    \tuplet 3/2 { la8 dod mi la[mi dod] la mi dod }

    %99
    re4 r r
    \tuplet 3/2 {
        fa'8 re fa la[fa la] fa re fa
        mi dod mi sol[mi sol] mi dod mi

        %102
        fa re fa la[fa la] fa re fa
        mi dod mi sol[mi sol] mi dod mi
    }
    re16 do? sib la re do sib la re do sib la\mbreak

    %105
    re8 fa, sol mi la la,
    \tuplet 3/2 { re'8\solo fa la re[la fa] re fa la }
    \once\stemDown sib \stemUp sol, sib re sol r\stemNeutral

    %108
    \tuplet 3/2 { do, mi sol do[sol mi] do mi sol }
    \once\stemDown la \stemUp fa, la do fa r\stemNeutral
    \tuplet 3/2 { sib, re fa sib[fa re] sib re fa }

    %111
    \once\stemDown sol \stemUp mib,! sol sib mib r\stemNeutral\mbreak
    \tuplet 3/2 { la, do fa la[fa do] la do mib }
    re4 r8 fa fa8.(sol32 lab)

    %114
    sol4 r8 sol sol8.(la?32 sib)
    la4 r8 do, do8.(re32 mib)
    re4 r8 fa sib16(la) sol(fa)

    %117
    sol(fa) mib(re) mib(re) do(sib)do(sib) la(sol)
    la(sol) fa(mib) fa(mib) re(do) re(do) sib(la)\mbreak
    sib8 sib16 do re8 re'16 mib fa8 sib

    %120
    sol16 mib sib mib sol mib sib mib sol mib sib mib
    la mib do mib la mib do mib la mib do mib
    sib' fa re fa sib fa re fa sib fa re fa

    %123
    sib fa do fa sib fa do fa sib fa do fa
    la fa do fa la fa do fa la fa do la'
    \footnote #' (-1 . 3) \markup\column\smaller {"Nota autografa di Vivaldi ai copisti per la coda: «D.C. al Segno ♯ fino al Segno 𝄐»" "  "}  sib8.\f[fa16 re8. re16 sib8. sib16]  %%%%% ripresa

    %126
    sol4 fad'(sol)
    sol8.[sol16 mi8. mi16 do8. do16]
    la4 sold'(la)

    %129
    la8.[la16 fad8. fad16 re8. re16]
    sib4 la'(sib)
    mib,8.[mib16 sol8. sol16 sib8. sib16]

    %132
    la,8. [la16 do8. do16 mib8. mib16]
    fa,8. [fa16 la8. la16 mib'8. mib16]
    re4 r r

    %135
    sib'16 la sol fa sib la sol fa sib la sol fa
    sib8 re, mib do fa fa,
    sib16 la sol fa sib la sol fa sib la sol fa

    %138
    sib8 re, mib do fa la,
    sib'4\fermata r r

}

IvlIIn = \relative do'' {

    \tuplet 3/2 { sib8 re fa sib[fa re] sib fa re }
    sib4 r r \senza
    \tuplet 3/2 { sib'8\p re fa sib[fa re] sib fa re }

    %4
    sib4 r r
    \tuplet 3/2 { la'8\f do fa la[fa do] la fa do }
    la4 r r

    %7
    \tuplet 3/2 { la'8\p do fa la[fa do] la fa do }
    la4 r r
    \tuplet 3/2 {
        fa''8\f re fa fa[re fa] fa re fa\mbreak

        %10
        sol mib sol sol[mib sol] sol mib sol
        fa\p re fa fa[re fa] fa re fa
        sol mib sol sol[mib sol] sol mib sol
    }

    %13
    fa4 r r
    fa8.\f[fa16 re8. re16 sib8. sib16]  %%%%% ripresa
    sol4 fad'(sol)

    %16
    sol8.[sol16 mi8. mi16 do8. do16]
    la4 sold'(la)
    la8.[la16 fad8. fad16 re8. re16]\mbreak

    %19
    sib4 la'(sib)
    mib,8.[mib16 sol8. sol16 sib8. sib16]
    la,8. [la16 do8. do16 mib8. mib16]

    %22
    fa,8. [fa16 la8. la16 mib'8. mib16]
    re4 r r
    sib'16 la sol fa sib la sol fa sib la sol fa

    %25
    sib8 re, mib do fa fa,
    sib16 la sol fa sib la sol fa sib la sol fa
    sib8 re, mib do fa la,\mbreak

    %28
    sib'4 r r %%%%% fine rip.
    \tuplet 3/2 {
        r8\solo sib' la sol[fa mib] re do sib
        \once\stemUp sib, fa'' sib sib,[fa' sib] sib, fa' sib

        %31
        do, fa la do,[fa la] do, fa la
        sib, re fa sib,[re fa] sib, re fa
        la, do fa la,[do fa] la, do fa

        %34
        sib, re fa sib,[re fa] sib, re fa\mbreak
    }
    la,4 r r
    R2.

    %37
    sib16 re do sib mib sib sol mib reb'8 do16 sib
    \appoggiatura reb?8 do16(sib do8) \appoggiatura reb8 do16(sib do8) \appoggiatura reb8 do16(sib do8)
    do16 mib? re? do fa do la fa mib'!8 re16 do

    %40
    \appoggiatura mib8 re16(do re8) \appoggiatura mib8 re16(do re8) \appoggiatura mib8 re16(do re8)
    re16 fa? mib re sol re sib sol sol' re sib sol\mbreak
    mib'(re mib fa) mib(re mib fa) mib(re  mib fa)

    %43
    fa8-.(fa-. fa-. fa-.) fa4\tr
    re16(do re mib) re16(do re mib) re16(do re mib)
    mib8-.(mib-. mib-. mib-.) mib4\tr

    %46
    do16(sib do re) do16(sib do re) do16(sib do re)
    re8-.(re-. re-. re-.) re4\tr
    sib16(do re8)~re4 fad16(sol la8)

    %49
    sol16(la sib8)~sib4 la16(sib do8)\mbreak
    sib16 re do sib \once\stemUp re,, do'' sib la \once\stemUp re,, do'' sib la
    <<sol4\\{\senza \tuplet 3/2 { sol,8 sib re}}>>  \tuplet 3/2 { sol[re sib] sol re sib }

    %52
    sol4 r r
    \tuplet 3/2 { la'8 do fad la[fad do] la fad re }
    la4 r r

    %55
    re'8.[re16 sib8. sib16 sol8. sol16]
    mib4 re'(mib)
    mi8.[mi16 dod8. dod16 la8. la16]\mbreak

    %58
    fad4 mi'(fad)
    la8. la16 fad8. fad16 do8. do16
    sib8.[sol16 sib8. sib16 re8. re16]

    %61
    sol fa mib! re sol fa mib re sol fa mib re
    sol8 sib, do la re re,
    sol16 fa mib re sol fa mib re sol fa mib re

    %64
    sol8 sib, do la re re
    sol,4 r r\mbreak
    R2.*3

    %69
    r4 sol''~sol8. sib16
    la4 do(si8.) si16
    \appoggiatura si?8 do4 do, do'

    %72
    sib?32(do re8.) sib32(la sol8.) la32(sol fad8.)
    \appoggiatura fad?8 sol4 r r\mbreak
    do16 sol mib do sol do mib sol do sib la sol

    %75
    la8 do, fa do la' fa
    sib16 fa re sib fa sib re fa sib la sol fa
    sol8 sib, mib sib sol' mib

    %78
    la16 mib do la mib la do mib la sol fa mib
    re8 la re la fad' re
    \con \tuplet 3/2 { sol(sib sol) } sib,2

    %81
    \tuplet 3/2 { do8(mib do) } mib,2\mbreak
    \tuplet 3/2 { fa'8 (la fa) } la,2
    \tuplet 3/2 { sib8(re sib) } re,2

    %84
    \tuplet 3/2 { re'8(sol re) } mi2
    \tuplet 3/2 { re8(fa re) } la'2
    \tuplet 3/2 { re,8(sol re) } mi2

    %87
    fa4 r r
    sol,16 fad sol re sib' la sib sol re' do re sib
    \once\stemDown mi8 do, r sol' do mi\mbreak

    %90
    fa,16 mib? fa do la' sol la fa do' sib do la
    \once\stemDown re8 sib, r fa' sib re
    mi,16 re mi si sol' fa sol mi sib'? la sib sol

    %93
    mi' re mi dod sol' fa sol mi sib' la sib sol
    fa mi fa re la' sol la fa re'8 r
    r16 sib la sol fa8 mi? re dod

    %96
    \tuplet 3/2 { re fa la re[la fa] re la fa }\mbreak
    mi4 r r
    \tuplet 3/2 { la8 dod mi la[mi dod] la mi dod }

    %99
    re4 r r
    \tuplet 3/2 {
        fa'8 re fa la[fa la] fa re fa
        mi dod mi sol[mi sol] mi dod mi

        %102
        fa re fa la[fa la] fa re fa
        mi dod mi sol[mi sol] mi dod mi
    }
    re16 do? sib la re do sib la re do sib la\mbreak

    %105
    re8 fa, sol mi la la,
    re4 r r
    \tuplet 3/2 { sol8\solo sib re sol[re sib] sol sib re }

    %108
    \once\stemDown mi8 do, mi sol do r
    \tuplet 3/2 { fa, la do fa[do la] fa la do }
    \once\stemDown re sib, re fa sib r

    %111
    \tuplet 3/2 { mib,! sol sib mib[sib sol] mib sol sib }\mbreak
    \once \stemDown do la, do fa la r
    sib4 r8 re re8.(mib32 fa)

    %114
    mib4 r8 mi mi8.(fa32 sol)
    fa4 r8 la, la8.(sib32 do)
    sib4 r r8 fa'

    %117
    sib16(la) sol(fa) sol(fa) mib(re) mib(re) do(sib)
    do(sib) la(sol) la(sol) fa(mib) fa(mib) re(do)\mbreak
    re8 re16 mib fa8 sib16 do re4

    %120
    mib16 sib sol sib mib sib sol sib mib sib sol sib
    mib do la do mib do la do mib do la do
    re fa sib fa re fa sib fa re fa sib fa

    %123
    do fa sib fa do fa sib fa do fa sib fa
    do fa la fa do fa la fa do fa la fa
    re8.\f[fa16 re8. re16 sib8. sib16]  %%%%% ripresa

    %126
    sol4 fad'(sol)
    sol8.[sol16 mi8. mi16 do8. do16]
    la4 sold'(la)

    %129
    la8.[la16 fad8. fad16 re8. re16]\mbreak
    sib4 la'(sib)
    mib,8.[mib16 sol8. sol16 sib8. sib16]

    %132
    la,8. [la16 do8. do16 mib8. mib16]
    fa,8. [fa16 la8. la16 mib'8. mib16]
    re4 r r

    %135
    sib'16 la sol fa sib la sol fa sib la sol fa
    sib8 re, mib do fa fa,
    sib16 la sol fa sib la sol fa sib la sol fa

    %138
    sib8 re, mib do fa la,\mbreak
    sib'4\fermata r r

}

IvlIIIn =  \relative do'' {

    \tuplet 3/2 { fa,8 sib re fa[re sib] fa re sib }
    fa'4 r r
    \senza\tuplet 3/2 { fa8\p sib re fa[re sib] fa re sib }

    %4
    fa'4 r r
    \tuplet 3/2 { fa8\f la do fa[do la] fa do la }
    fa'4 r r

    %7
    \tuplet 3/2 { fa8\p la do fa[do la] fa do la }
    fa'4 r r
    \tuplet 3/2 {
        re'8\f sib re re[sib re] re sib re

        %10
        mib do mib mib[do mib] mib do mib
        re\p sib re re[sib re] re sib re
        mib do mib mib[do mib] mib do mib
    }

    %13
    re4 r r
    re8.\f[re16 sib8. sib16 fa8. fa16] %% inizio rip.
    sib2.

    %16
    mi8.[mi16 do8. do16 sol8. sol16]
    do2.
    fad8.[fad16 re8. re16 la8. la16]\mbreak

    %19
    re2.
    sib8.[sib16 mib8. mib16 sol8. sol16]
    mib,8. [mib16 la8. la16 do8. do16]

    %22
    do,8.[do16 fa8. fa16 do'8. do16]
    sib4 r r
    sib'16 la sol fa sib la sol fa sib la sol fa

    %25
    sib8 re, mib do fa fa,
    sib16 la sol fa sib la sol fa sib la sol fa
    sib8 re, mib do fa la,\mbreak

    %28
    sib'4 r r %%%%% fine rip.
    R2.*14
    fa16 sol la sol fa sol fa  mib! re mib re do

    %44
    sib4 r r
    mib16 fa sol fa mib fa mib re do re do sib
    la4 r r

    %47
    re16 mi fad mi re mib? re do sib do sib la
    sol4 sol' re
    sol, sol' re\mbreak

    %50
    sol, re' re
    \tuplet 3/2 { re8 sol sib re[sib sol] re sib sol }
    re'4 r r

    %53
    \tuplet 3/2 { fad8 la do fad[do la] fad re la }
    fad'4 r r
    sib8.[sib16 sol8. sol16 re8. re16]

    %56
    sol2.
    dod8.[dod16 la8. la16 mi8. mi16]\mbreak
    la2.

    %59
    fad'8. fad16 do8. do16 la8. la16
    sol8.[sol16 sib8. sib16 re8. re16]
    sol fa mib! re sol fa mib re sol fa mib re

    %62
    sol8 sib, do la re re,
    sol16 fa mib re sol fa mib re sol fa mib re
    sol8 sib, do la re re

    %65
    sol,4 r r\mbreak
    R2.*7
    r8 sol'16 la sib8 la sol4\mbreak

    %74
    r8 do,16 re mib8 re do4
    r8 fa16 sol la8 sol fa4
    r8 sib,16 do re8 do sib4

    %77
    r8 mib16 fa sol8 fa mib4
    r8 la,16 sib do8 sib la4
    r8 re16 mi fad8 mi re4

    %80
    r8 sol16 la sib8 la sib sol
    do[do,16 re mib8 re mib do]\mbreak
    fa[fa16 sol la8 sol la fa]

    %83
    sib[sib,16 do re8 do re sib]
    sib'8 sib, la[sib' la16 sol fa mi]
    re8[re16 mi fa8 mi fa re]

    %86
    sib'8 sib, la[sib' la16 sol fa mi]
    re4 r8 re fa re
    sol4 r8 sol sib sol

    %89
    do,4 r8 do mi do\mbreak
    fa4 r8 fa la fa
    sib,4 r8 sib re sib

    %92
    mi4 r8 mi sol mi
    la,4 r8 la la la
    re4 r8 re fa la

    %95
    re sol, la4 la,
    \con \tuplet 3/2 { la'8 re fa la[fa re] la fa re }\mbreak
    dod4 r r

    %98
    \tuplet 3/2 { mi8 la dod mi [dod la] mi dod la }
    la4 r r
    \tuplet 3/2 {
        re'8 la re fa[re fa] re la re

        %101
        dod la dod mi[dod mi] dod la dod
        re la re fa[re fa] re la re
        dod la dod mi[dod mi] dod la dod
    }

    %104
    re16 do? sib la re do sib la re do sib la\mbreak
    re8 fa, sol mi la la,
    re4 r r

    %107
    <<
        {\override Rest.staff-position = #-1
            sib''4^\markup\italic"P.mi" r r
            sib r r
            la r r

            %110
            la r r
            sol r r\mbreak
            fa r r

            %113
            fa r r
        }\\{
            re_\markup\italic"2.di"  s s
            mi s s
            do s s
            re s s
            sib s s
            la s s
            sib s s\revert Rest.staff-position
        }
    >>
    R2.*11
    re8.\f[re16 sib8. sib16 fa8. fa16] %% inizio rip.

    %126
    sib2.
    mi8.[mi16 do8. do16 sol8. sol16]
    do2.

    %129
    fad8.[fad16 re8. re16 la8. la16]\mbreak
    re2.
    sib8.[sib16 mib8. mib16 sol8. sol16]

    %132
    mib,8. [mib16 la8. la16 do8. do16]
    do,8.[do16 fa8. fa16 do'8. do16]
    sib4 r r

    %135
    sib'16 la sol fa sib la sol fa sib la sol fa
    sib8 re, mib do fa fa,
    sib16 la sol fa sib la sol fa sib la sol fa

    %138
    sib8 re, mib do fa la,\mbreak
    sib'4\fermata r r

}

Ivlan = \relative do' {

    re4 re re
    re r r
    re\p re re

    %4
    re r r
    do\f do do
    do r r

    %7
    do\p do do
    do r r
    sib'\f fa fa\mbreak

    %10
    do' do do
    re\p fa, fa
    do' do do

    %13
    re r r
    sib8.\f[sib16 fa8. fa16 re8. re16]  %% rip.
    mib2.

    %16
    do'8.[do16 sol8. sol16 mi8. mi16]
    fa2.
    re'8.[re16 la8. la16 fad8. fad16]\mbreak

    %19
    sol2.
    sol8.[sol16 sib8. sib16 mib8. mib16]
    do,8.[do16 mib8. mib16 la8. la16]

    %22
    la,8.[la16 do8. do16 la'8. la16]
    fa4 r r
    re'8.[re16 sib8. sib16 fa8. fa16]

    %25
    re8 re mib do fa fa,
    re''8.[re16 sib8. sib16 fa8. fa16]
    re8 re mib do fa fa,\mbreak

    %28
    sib4 r r % fine rip
    R2.*14
    fa'16 sol la sol fa sol fa  mib! re mib re do

    %44
    sib4 r r
    mib16 fa sol fa mib fa mib re do re do sib
    la4 r r

    %47
    re16 mi fad mi re mib? re do sib do sib la
    sol4 sol' re
    sol, sol' re\mbreak

    %50
    sol, re' re,
    sib' sib sib
    sib r r

    %53
    re re re
    re r r
    sol8.[sol16 re8. re16 sib8. sib16]

    %56
    do2.
    la'8. [la16 mi8. mi16 dod8. dod16]\mbreak
    re2.

    %59
    re'8. re16 la8. la16 fad8. fad16
    re8.[sol16 sib8. sib16 re8. re16]
    sib8. sib16 sol8. sol16 re8. re16

    %62
    sib8 sib' do la re re,
    sib8.[sib16 sol8. sol16 re8. re16]
    sib'8 sib do la re re,

    %65
    sol4 r r\mbreak
    R2.*7
    r8 sol'16 la sib8 la sol4\mbreak

    %74
    r8 do,16 re mib8 re do4
    r8 fa16 sol la8 sol fa4
    r8 sib,16 do re8 do sib4

    %77
    r8 mib16 fa sol8 fa mib4
    r8 la,16 sib do8 sib la4
    r8 re16 mi fad8 mi re4

    %80
    r8 sol16 la sib8 la sib sol
    do[do,16 re mib8 re mib do]\mbreak
    fa[fa16 sol la8 sol la fa]

    %83
    sib[sib,16 do re8 do re sib]
    sib'8 sib, la[sib' la16 sol fa mi]
    re8[re16 mi fa8 mi fa re]

    %86
    sib'8 sib, la[sib' la16 sol fa mi]
    re4 r8 re fa re
    sol4 r8 sol sib sol

    %89
    do,4 r8 do mi do\mbreak
    fa4 r8 fa la fa
    sib,4 r8 sib re sib

    %92
    mi4 r8 mi sol mi
    la,4 r8 la la la
    re4 r8 re fa la

    %95
    re sol, la4 la,
    fa'4 fa fa,\mbreak
    la r r

    %98
    dod dod dod
    fa, r r
    la' la la

    %101
    la la la
    la la la
    la la la

    %104
    re16 do? sib la re do sib la re do sib la\mbreak
    re8 fa, sol mi la la,
    re4 r r

    %107
    sol r r
    sol r r
    fa r r

    %110
    fa r r
    mib r r\mbreak
    do r r

    %113
    re r r
    R2.*11
    sib'8.\f[sib16 fa8. fa16 re8. re16]  %% rip.

    %126
    mib2.
    do'8.[do16 sol8. sol16 mi8. mi16]
    fa2.

    %129
    re'8.[re16 la8. la16 fad8. fad16]\mbreak
    sol2.
    sol8.[sol16 sib8. sib16 mib8. mib16]

    %132
    do,8.[do16 mib8. mib16 la8. la16]
    la,8.[la16 do8. do16 la'8. la16]
    fa4 r r

    %135
    re'8.[re16 sib8. sib16 fa8. fa16]
    re8 re mib do fa fa,
    re''8.[re16 sib8. sib16 fa8. fa16]

    %138
    re8 re mib do fa fa,\mbreak
    sib4\fermata r r

}

Ibcn = \relative do {

    sib4 sib sib
    sib r r
    sib\p sib sib

    %4
    sib r r
    fa'\f fa fa
    fa r r

    %7
    fa\p fa fa
    fa r r
    sib,\f sib sib\mbreak

    %10
    la la la
    sib\p sib sib
    la la la

    %13
    sib r r
    re16\f[re re re re re re re re re re re] %inizio rip.
    \footnote #' (-1 . 3) \markup\column\smaller {"Nota autografa di Vivaldi ai copisti: «Scrivete semicrome»" "  "}  mib mib mib mib mib mib mib mib mib mib mib mib

    %16
    mi mi mi mi mi mi mi mi mi mi mi mi
    fa fa fa fa fa fa fa fa fa fa fa fa
    fad fad fad fad fad fad fad fad fad fad fad fad

    %19
    sol sol sol sol sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol sol sol sol sol
    fa? fa fa fa fa fa fa fa fa fa fa fa

    %22
    fa fa fa fa fa fa fa fa fa fa fa fa
    sib,4 r r
    sib'8.[sib16 fa8. fa16 re8. re16]

    %25
    \once\stemUp sib8 re' mib do fa fa,
    sib8.[sib16 fa8. fa16 re8. re16]
    sib8 re mib do fa fa,\mbreak

    %28
    sib4 r r  %%%% fine rip
    sib r r
    sib sib sib

    %31
    la fa fa
    sib sib sib
    fa' fa fa

    %34
    re sib sib\mbreak
    fa'8.[fa16 do8. do16 la8. la16]
    sib4 re re

    %37
    mib mib mib
    mi mi mi
    fa fa fa

    %40
    fad fad fad
    sol sol sol\mbreak
    do, r r

    %43
    R2.*8
    sol4 sol sol
    sol'8. sol16 sib,8.[sib16 sol8. sol16]

    %53
    re'4 re re
    re'8. re16 fad,8.[fad16 re8. re16]
    sol16 sol, sol sol sol sol sol sol sol sol sol sol

    %56
    \footnote #' (-1 . 3) \markup\column\smaller {"Nota autografa di Vivaldi ai copisti: «Scrivete semicrome»" "  "} do do do do do do do do do do do do
    dod dod dod dod dod dod dod dod dod dod dod dod
    re re re re re re re re re re re re

    %59
    re re re re re re re re re re re re
    sol8. sol16 sib8. sib16 re8. re16
    sol,8. sol16 re8. re16 sib8. sib16

    %62
    \once\stemUp sol8 sib' do la re re,
    sol8. sol16 re8. re16 sib8. sib16
    sol8 sib do la re re,

    %65
    sol4 sol'8 la sib sol\mbreak
    fad4 fa8 sol lab fa
    mib4 do8 re mib do

    %68
    sol'4 re' re,
    sol, sol'8 la sib sol
    fad4 fa8 sol lab fa

    %71
    mib4 do8 re mib do
    sol'4 re' re,
    R2.*23

    %96
    re4 re re\mbreak
    la'8.[la16 mi8. mi16 dod8. dod16]
    la4 la la

    %99
    re8.[re16 la8. la16 fa8. fa16]
    re4 re re
    la' la la

    %102
    re, re re
    la' la la
    re'16 do? sib la re do sib la re do sib la

    %105
    re8 fa, sol mi la la,
    re4 r r
    sol r r

    %108
    do, r r
    fa r r
    sib, r r

    %111
    mib r r\mbreak
    fa4 r r
    sib,8 do re do re sib

    %114
    mib re do re mi do
    fa mib? fa sol la fa
    sib, la sib do re sib

    %117
    R2.*2\mbreak
    sib4 sib sib
    mib mib mib

    %121
    fa fa fa
    fa fa fa
    fa fa fa

    %124
    fa fa fa
    sib,16\f[re re re re re re re re re re re] %inizio rip.
    mib mib mib mib mib mib mib mib mib mib mib mib

    %127
    mi mi mi mi mi mi mi mi mi mi mi mi
    fa fa fa fa fa fa fa fa fa fa fa fa
    fad fad fad fad fad fad fad fad fad fad fad fad

    %130
    sol sol sol sol sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol sol sol sol sol
    fa? fa fa fa fa fa fa fa fa fa fa fa

    %133
    fa fa fa fa fa fa fa fa fa fa fa fa
    sib,4 r r
    sib'8.[sib16 fa8. fa16 re8. re16]

    %136
    \once\stemUp sib8 re' mib do fa fa,
    sib8.[sib16 fa8. fa16 re8. re16]
    sib8 re mib do fa fa,\mbreak

    %139
    sib4\fermata r r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sib\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 63
    s2.*139
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

IvlIII = {
    \Iglobal
    <<\IvlIIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}

IIvlIn = \relative do'' {

    r8 do,-. mib-. sol-. do-. mib-.
    sol2.
    fa8 mib16 re fa8 mib16 re fa8 mib16 re

    %4
    mib2.~
    mib
    re~

    %7
    re
    mib
    re8 sol, si re sol re\mbreak

    %10
    mib sol, do mib sol mib
    re sol, si re sol re
    mib sol, do mib sol mib

    %13
    re4 r r
    R2.
    do'8\solo(lab) lab(sol) sol(fa)

    %16
    fa2.
    si8(sol) sol(fa) fa(mib)
    mib4 sol~sol8. lab16

    %19
    fa4 fa~fa8. sol16\mbreak
    mib4 mib~mib8. fa16
    re4 re~re8. mib16

    %22
    do2.~
    do8(la') la(do,) do(sib)
    sib sol' la,4.\tr sol8

    %25
    sol sol\tu sib re sol sib
    la la,? re fad la fad
    sol re sol sib, la? [fad']\mbreak

    %28
    sol re \appoggiatura mib re\solo(do) \appoggiatura re do(sib)
    sib sib \appoggiatura do sib(la?) \appoggiatura sib la(sol)
    sol sol' \appoggiatura lab? sol(fa?) \appoggiatura sol fa(mib)

    %31
    mib mib \appoggiatura fa mib(re) \appoggiatura mib re(do)
    do do' do(sib) sib(lab)
    lab2.~

    %34
    lab8 lab lab(sol) sol(fa)
    fa fa fa(mib) mib(re)
    mib fa4 mib re8

    %37
    mib fa4 mib re8\mbreak
    mib lab4 sol fa8
    sol lab4 sol fa8

    %40
    sol do mib,4(re8.\tr) do16
    do8 sol do mib sol mib
    re sol, si re sol re

    %43
    mib do mib sol do sol
    fa mib re4.\tr do8
    do2.\fermata

}

IIvlIIn = \relative do'' {

    r8 do,-. mib-. sol-. do-. mib-.
    sol2.
    fa8 mib16 re fa8 mib16 re fa8 mib16 re

    %4
    mib2.~
    mib
    re~

    %7
    re
    mib
    re8 sol, si re sol re\mbreak

    %10
    mib sol, do mib sol mib
    re sol, si re sol re
    mib sol, do mib sol mib

    %13
    re4 r r
    sol8\solo(mib) mib(re) re(do)
    do2.

    %16
    fa8(re) re(do) do(si)
    si?2.
    do4 mib~mib8. fa16

    %19
    re4 re~re8. mib16\mbreak
    do4 do~do8. re16
    sib?4 sib~sib8. do16

    %22
    la8 la' la(fad) fad(do)
    do2 fad4
    sol8 sol, fad4.\tr sol8

    %25
    sol sol\tu sib re sol sib
    la la,? re fad la fad
    sol re sol sib, la? [fad']\mbreak

    %28
    sol4 r r
    r8 re\solo \appoggiatura mib re(do) \appoggiatura  re do(sib)
    sib4 r r

    %31
    r8 sol' \appoggiatura lab sol(fa) \appoggiatura sol fa(mib)
    mib4 r r
    r8 fa fa(mib) mib(re)

    %34
    re2.~
    re8 re re(do) do(si)
    do re4 do si8

    %37
    do re4 do si8\mbreak
    do8 fa4 mib re8
    mib fa4 mib re8

    %40
    mib mib do4(si8.\tr) do16
    do8 sol do mib sol mib
    re sol, si re sol re

    %43
    mib do mib sol do sol
    fa mib re4.\tr do8
    do2.\fermata

}

IIvlIIIn =  \relative do'' {

    R2.
    r8 sol,-. si-. re-. sol-. si-.
    re do16 si re8 do16 si re8 do16 si

    %4
    do2.~
    do
    si~

    %7
    si
    do
    si8 re, sol si re si\mbreak

    %10
    do mib, sol do mib do
    si re, sol si re si
    do mib, sol do mib do

    %13
    si4 r r
    R2.*11
    r8 re, sol sib re sol

    %26
    fad fad, la re fad re
    sib sib re sol, fad[la]\mbreak
    sib4 r r

    %29
    R2.*12
    r8 mib, sol do mib  do
    si re, sol si re si

    %43
    do sol do mib sol mib
    re do si4.\tr do8
    do2.\fermata

}

IIvlan = \relative do' {

    R2.*3
    r8 do-. mib-. sol-. do-. mib-.
    sol, fa16 mib sol8 fa16 mib sol8 fa16 mib

    %6
    sol2.~
    sol2 re4
    la'2.

    %9
    re,4 sol sol\mbreak
    sol sol sol
    sol sol sol

    %12
    sol sol sol
    sol r r
    R2.*11

    %25
    r8 sib, re sol sib re
    re re, fad la re re,
    re sol sib re, re re\mbreak

    %28
    re4 r r
    R2.*12
    sol4 sol sol

    %42
    sol sol sol
    sol sol sol
    lab re, sol

    %45
    mib2.\fermata

}

IIbcn = \relative do {

    R2.*5
    r8 sol si re sol si
    si, lab16 sol si8 lab16 sol si8 lab16 sol

    %8
    fad4 fad fad
    sol sol sol\mbreak
    do do do

    %11
    sol sol sol
    do do do
    sol r r

    %14
    do2.~
    do
    lab

    %17
    sol
    do4 do do
    re si sol\mbreak

    %20
    do mib fad,
    sol sol' sol,
    re'2.~

    %23
    re
    sol,4 re' re,
    sol8 sol' sol, sol' sol, sol'

    %26
    re, re' re, re' re, re'
    sol, sol' sol, sol' re,[re']\mbreak
    sol,4 r r

    %29
    sol r r
    sol r r
    do r r

    %32
    do r r
    fa2.
    si,

    %35
    sol
    sol4 sol sol
    sol sol sol\mbreak

    %38
    sol sol sol
    sol sol sol
    do sol' sol,

    %41
    do8 do' do, do' do, do'
    sol, sol' sol, sol' sol, sol'
    do, do' do, do' do, do'

    %44
    fa,, fa' sol, sol' sol, sol'
    do,2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\minor
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 30
    s2.*45
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

IIvlIII = {
    \IIglobal
    <<\IIvlIIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}

IIIvlIn = \relative do'' {

    fa16 sol fa8~fa16 sol fa8~
    fa16 sol fa8~fa16 mib re do
    re do sib8 fa' sib

    %4
    la16 sol fa8~fa16 mib re do
    re do sib8 fa' sib
    la16 sol fa8~fa16 mib re do

    %7
    re do sib8 r sib16 do %%%% rip
    reb8 re4 re8
    mib [sib mib, do'16 re]

    %10
    mib8 mi4 mi8\mbreak
    fa[do fa, re'16 mi]
    fa8 fad4 fad8

    %13
    sol[re sol, sol'16 la]
    sib sol fa?8~fa16 fa sol la
    sib sol fa8~fa16 mib re do

    %16
    re do sib8 r fa'
    sol, sol'4 sib,8
    la la'4 do,8

    %19
    sib sib'4 re,8
    do do'4 mib,8\mbreak
    re\tr do16 sib re8\tr do16 sib

    %22
    re8\tr do16 sib do4\tr
    sib4 r8 sib\solo %%%%% fine rip
    fa'16 sib la8~la16 do sib la

    %25
    sib re do8~do16 mib re do
    re fa mib8~mib16 sol fa  mib
    fa8 sib, r4

    %28
    r r8 do,
    fa16 sib la8~la16 do sib la
    sib4 r\mbreak

    %31
    r32 sib,(do re mib fa sol la sib8) sol
    fa32 sib,(do re mib fa sol la sib8) sol
    sol\tr fa r4

    %34
    R2
    re16-. sib-. fa'-. re-. sib'-. lab-. sol-. fa-.
    mib do sol' mib do' sib la? sol

    %37
    fa re la' fa re' do sib la
    sol mib sib' sol mib' re do sib\mbreak
    la fa do' la fa' mib re do

    %40
    re4 r16 fa, mib re
    sol4~sol16 sol fa mib
    la4~la16 la sol fa

    %43
    sib4~sib16 sib la sol
    do4~do16 sol fa mib
    re4 r

    %46
    do'~do16 sib do re
    do4~do16 sib do re\mbreak
    do8 la sol4\tr

    %49
    <<
        fa\tu\\{
            do16 re do8~do16 re do8~
            do16 re do8~do16 sib la sol
        }
    >>
    la8 fa do' fa

    %52
    mi16 re do8~do16 sib la sol
    la sol fa8 do' fa
    mi16 re do8~do16 sib la sol

    %55
    la sol fa8 r fa'16 sol
    lab8 la4 la8
    sib [fa sib, sol'16 la]\mbreak

    %58
    sib8 si4 si8
    do[sol do, la'16 sib]
    do8 dod4 dod8

    %61
    re[do?16 sib la8 sol]
    fa\tr mi16 re fa8\tr mi16 re
    fa8\tr mi16 re mi4\tr

    %64
    re r8 <<
        {
            fa
            fa4(mi8) sib
            sib4(la8) fa'

            %67
            mi[fa sol fa16 mi]
            fa4
        }\\{
            re8
            re4 dod8 sol
            sol4 fa8 re'
            dod[re mi re16 dod]
            re8 re,
        }
    >> r4\mbreak
    R2*3

    %72
    r4 r8 <<
        {
            la''
            sib sib4 la8
            sol sol4 sol8

            %75
            la la4 sol8
            fa fa4 fa8
            sol sol4 fa8

            %78
            mi mi4 mi8\mbreak
            fa fa4 fa8
            mi4
        }\\{
            fa8
            sol sol4 fa8
            mi mi4 mi8
            fa fa4 mi8
            re re4 re8
            mi mi4 re8
            dod dod4 dod8\mbreak
            re re4 re8
            do?32 \once\slurUp la(si dod re mi fa sol la16) sol fa mi
        }
    >>

    %81
    fa32 re,(mi fa sol la si dod re16) do? sib ?la
    sib32 sol(la sib do re mib! fa sol16) fa mib re
    mib32 do,(re mib fa sol la sib do16) sib la sol

    %84
    fad32 re(mi fad sol la sib do re16) do sib la
    sib sol' do, sol' re sol do, sol'\mbreak
    sib, sol' do, sol' re sol do, sol'

    %87
    sib, sol' do, sol' sib, sol' la, fad'
    <<
        sol4\\{
            re16 mib! re8~re16 mib re8~
            re16 mib re8~re16 do sib la
        }
    >>

    %90
    sib la sol8 re' sol
    fad16 mi re8~re16 do sib la
    sib la sol8 re' sol

    %93
    fad16 mi re8~re16 do sib la
    sib8\tr  la16 sol sib8\tr la16 sol\mbreak
    sol'8[sib,  la fad']

    %96
    sol16 re sol re la' re, la' re,
    sib' re, sib' re, la' re, la' re,
    sol re sol re la' re, la' re,

    %99
    sib' re, sib' re, la' re, la' re,
    sol4 r
    R2*5

    %106
    fa16 do fa do sol' do, sol' do,
    la' do, la' do, sol' do, sol' do,
    fa do fa do sol' do, sol' do,

    %109
    la' do, la' do, sol' do, sol' do,
    fa4 r
    r2*4

    %115
    fa16 sol fa8~fa16 sol fa8~
    fa16 sol fa8~fa16 mib re do
    re do sib8 fa' sib

    %118
    la16 sol fa8~fa16 mib re do
    re do sib8 fa' sib
    la16 sol fa8~fa16 mib re do

    %121
    re do sib8 r sib\solo\mbreak
    fa'16 sib la8~la16 do sib la
    sib re do8~do16 mib re do

    %124
    re mib re do sib4
    R2*2
    r4 r8 fa

    %128
    re16 fa sib, fa' re fa sib, fa'
    sol, sib mib, sib' sol sib mib, sib'
    mi sol do, sol' mi sol do, sol'\mbreak

    %131
    la, do fa, do' la do fa, do'
    fad la re,  la' fad la re, la'
    sib, re sol, re' sib re sol, re'

    %134
    sol sib mib, sib' sol sib mib, sib'
    sol do mib, do' sol do mib, do'
    fa, la re, la' fa la re, la'

    %137
    fa sib re, sib' fa sib re, sib'
    mib, sol do, sol' mib sol do, sol'\mbreak
    mib la do, la' mib la do, la'

    %140
    re, fa sib, fa' re fa sib, fa'
    mib sol sib, sol' mib sol sib, sol'
    do, fa la, fa' do fa la, fa'

    %143
    <<fa4\\\stemUp \once \override Stem #'transparent = ##t sib,\\\stemDown re,>> r8 sib''(
    la[sol fa mi)]
    fa16(mib? re do) \appoggiatura mib8 re16(do sib la)

    %146
    sib8[(sib' la sol)]
    fa16(re do sib) do4\tr
    sib r

    %149
    R2*4
    \footnote #' (-1 . 3) \markup\column\smaller {"Nota autografa di Vivaldi ai copisti per la coda: «D.C. al Segno ♯ fino al Segno 𝄐»" "  "}  re16 do sib8 r sib16 do %%%% rip
    reb8 re4 re8

    %155
    mib [sib mib, do'16 re]
    mib8 mi4 mi8\mbreak
    fa[do fa, re'16 mi]

    %158
    fa8 fad4 fad8
    sol[re sol, sol'16 la]
    sib sol fa?8~fa16 fa sol la

    %161
    sib sol fa8~fa16 mib re do
    re do sib8 r fa'
    sol, sol'4 sib,8

    %164
    la la'4 do,8
    sib sib'4 re,8
    do do'4 mib,8\mbreak

    %167
    re\tr do16 sib re8\tr do16 sib
    re8\tr do16 sib do4\tr
    sib4\fermata r

}

IIIvlIIn = \relative do'' {

    fa16 sol fa8~fa16 sol fa8~
    fa16 sol fa8~fa16 mib re do
    re do sib8 fa' sib

    %4
    la16 sol fa8~fa16 mib re do
    re do sib8 fa' sib
    la16 sol fa8~fa16 mib re do

    %7
    re do sib8 r sib16 do %%%% rip
    reb8 re4 re8
    mib [sib mib, do'16 re]

    %10
    mib8 mi4 mi8\mbreak
    fa[do fa, re'16 mi]
    fa8 fad4 fad8

    %13
    sol[re sol, sol'16 la]
    sib sol fa?8~fa16 fa sol la
    sib sol fa8~fa16 mib re do

    %16
    re do sib8 r fa'
    sol, sol'4 sib,8
    la la'4 do,8

    %19
    sib sib'4 re,8
    do do'4 mib,8\mbreak
    re\tr do16 sib re8\tr do16 sib

    %22
    re8\tr do16 sib do4\tr
    sib4 r %%%%% fine rip
    r4 r8 do

    %25
    fa16 sib la8~la16 do sib la
    sib4 r
    r r8 sib,

    %28
    fa'16 sib la8~la16 do sib la
    sib re do8~do16 mib re do
    re fa mib8~mib16 sol fa mib\mbreak

    %31
    fa8 sib, r4
    R2
    r32 sib,(do re mib fa sol la sib8) sol

    %34
    fa32 sib,(do re mib fa sol la sib8) sol
    sol\tr fa r16 fa mib re
    sol4~sol16 sol fa mib

    %37
    la4~la16 la sol fa
    sib4~sib16 sib la sol\mbreak
    do4~do16 sol fa mib

    %40
    re sib fa' re sib' lab sol fa
    mib do sol' mib do' sib la? sol
    fa re la' fa re' do sib la

    %43
    sol mib sib' sol mib' re do sib
    la fa do' la fa' mib re do
    re4 r

    %46
    la~la16 sol la sib
    la4~la16 sol la sib \mbreak
    la8 fa mi4

    %49
    <<
        fa\tu\\{
            do16 re do8~do16 re do8~
            do16 re do8~do16 sib la sol
        }
    >>
    la8 fa do' fa

    %52
    mi16 re do8~do16 sib la sol
    la sol fa8 do' fa
    mi16 re do8~do16 sib la sol

    %55
    la sol fa8 r fa'16 sol
    lab8 la4 la8
    sib [fa sib, sol'16 la]\mbreak

    %58
    sib8 si4 si8
    do[sol do, la'16 sib]
    do8 dod4 dod8

    %61
    re[do?16 sib la8 sol]
    fa\tr mi16 re fa8\tr mi16 re
    fa8\tr mi16 re mi4\tr

    %64
    re r
    R2*3
    r4 r8 <<
        {
            fa

            %69
            fa4(mi8) sib
            sib4(la8) fa'
            mi[fa sol fa16 mi]

            %72
            fa4
        }\\{
            re8
            re4 dod8 sol
            sol4 fa8 re'
            dod[re mi re16 dod]
            re8 re,
        }
    >> r4
    r r8 <<
        {
            re'
            mi mi4 re8

            %75
            do do4 do8
            re re4 do8
            sib sib4 sib8

            %78
            dod dod4 dod8\mbreak
            la la4 la8
            la4
        }\\{
            sib8
            do? do4 sib8
            la la4 la8
            sib sib4 la8
            sol sol4 sol8
            la la4 la8\mbreak
            fa fa4 fa8
            mi4
        }
    >> r

    %81
    R2*7
    re'16 mib! re8~re16 mib re8~
    re16 mib re8~re16 do sib la

    %90
    sib la sol8 re' sol
    fad16 mi re8~re16 do sib la
    sib la sol8 re' sol

    %93
    fad16 mi re8~re16 do sib la
    sib8\tr  la16 sol sib8\tr la16 sol\mbreak
    sol'8[sib,  la fad']

    %96
    sol4 r
    R2*4
    do,16 sol do sol re' sol, re' sol,

    %102
    mib' sol, mib' sol, re' sol, re' sol,
    do sol do sol re' sol, re' sol,
    mib' sol, mib' sol, re' sol, re' sol,

    %105
    do4 r
    R2*5
    sib16 fa sib fa do' fa, do' fa,

    %112
    re' fa, re' fa, do' fa, do' fa,
    sib fa sib fa do' fa, do' fa,
    re' fa, re' fa, do' fa, do' fa,

    %115
    sib sol' fa8~fa16 sol fa8~
    fa16 sol fa8~fa16 mib re do
    re do sib8 fa' sib

    %118
    la16 sol fa8~fa16 mib re do
    re do sib8 fa' sib
    la16 sol fa8~fa16 mib re do

    %121
    re do sib8 r4\mbreak
    R2*2
    r4 r8 sib

    %125
    fa'16 sib la8~la16 do sib la
    sib re do8~do16 mib re do
    re mib re do sib8 re,

    %128
    sib16 re fa, re' sib re fa, re'
    mib, sol sib, sol' mib sol sib, sol'
    do mi sol, mi' do mi sol, mi'\mbreak

    %131
    fa, la do, la' fa la do, la'
    re fad la, fad' re fad la, fad'
    sol, sib re, sib' sol sib re, sib'

    %134
    mib? sol sib, sol' mib sol sib, sol'
    mib sol do, sol' mib sol do, sol'
    re fa la, fa' re fa la, fa'

    %137
    re fa sib, fa' re fa sib, fa'
    do mib sol, mib' do mib sol, mib'\mbreak
    do mib la, mib' do mib la, mib'

    %140
    sib re fa, re' sib re fa, re'
    sib mib sol, mib'sib mib sol, mib'
    la, do fa, do' la do fa, do'

    %143
    <<re4\\\stemUp \once \override Stem #'transparent = ##t fa,\\\stemDown sib,>> r
    R2*4
    r4 r8 sib''(

    %149
    la[sol fa mi)]
    fa16(mib? re do) \appoggiatura mib8 re16(do sib la)
    sib8[(sib' la sol)]

    %152
    fa16(re do sib) do4\tr
    sib4 r8 sib16 do %%%% rip
    reb8 re4 re8

    %155
    mib [sib mib, do'16 re]
    mib8 mi4 mi8\mbreak
    fa[do fa, re'16 mi]

    %158
    fa8 fad4 fad8
    sol[re sol, sol'16 la]
    sib sol fa?8~fa16 fa sol la

    %161
    sib sol fa8~fa16 mib re do
    re do sib8 r fa'
    sol, sol'4 sib,8

    %164
    la la'4 do,8
    sib sib'4 re,8
    do do'4 mib,8\mbreak

    %167
    re\tr do16 sib re8\tr do16 sib
    re8\tr do16 sib do4\tr
    sib4\fermata r

}

IIIvlIIIn =  \relative do'' {

    fa16 sol fa8~fa16 sol fa8~
    fa16 sol fa8~fa16 mib re do
    re do sib8 fa' sib

    %4
    la16 sol fa8~fa16 mib re do
    re do sib8 fa' sib
    la16 sol fa8~fa16 mib re do

    %7
    re do sib8 r sib16 do %%%% rip
    reb8 re4 re8
    mib [sib mib, do'16 re]

    %10
    mib8 mi4 mi8\mbreak
    fa[do fa, re'16 mi]
    fa8 fad4 fad8

    %13
    sol[re sol, sol'16 la]
    sib sol fa?8~fa16 fa sol la
    sib sol fa8~fa16 mib re do

    %16
    re do sib8 r fa'
    sol, sol'4 sib,8
    la la'4 do,8

    %19
    sib sib'4 re,8
    do do'4 mib,8\mbreak
    re\tr do16 sib re8\tr do16 sib

    %22
    re8\tr do16 sib do4\tr
    sib4 r %%%%% fine rip
    R2*25

   %49
   do16 re do8~do16 re do8~
   do16 re do8~do16 sib la sol
    la8 fa do' fa

    %52
    mi16 re do8~do16 sib la sol
    la sol fa8 do' fa
    mi16 re do8~do16 sib la sol

    %55
    la sol fa8 r fa'16 sol
    lab8 la4 la8
    sib [fa sib, sol'16 la]\mbreak

    %58
    sib8 si4 si8
    do[sol do, la'16 sib]
    do8 dod4 dod8

    %61
    re[do?16 sib la8 sol]
    fa\tr mi16 re fa8\tr mi16 re
    fa8\tr mi16 re mi4\tr

    %64
    re r8 re,
    la'[sol la dod,]
    re[dod re sold,]

    %67
    la[re sol,? la]
    re[dod re re]\mbreak
    la'[sol la dod,]

    %70
    re[dod re sold,]
    la[re sol,? la]
    re[mi fa re]

    %73
    sol4 sol
    do,? do
    fa fa

    %76
    sib, sib
    mi mi
    la, la\mbreak

    %79
    re re
    la8[si dod la]
    re[mi fa re]

    %82
    sol,[la sib? sol]
    do[re mib do]
    re[mi fad re]

    %85
    sol[la sib la]\mbreak
    sol[la sib la]
    sol[mib re re]

    %88
    re'16mib! re8~re16 mib re8~
    re16 mib re8~re16 do sib la
    sib la sol8 re' sol

    %91
    fad16 mi re8~re16 do sib la
    sib la sol8 re' sol
    fad16 mi re8~re16 do sib la

    %94
    sib8\tr  la16 sol sib8\tr la16 sol\mbreak
    sol'8[sib,  la fad']
    sol4 re^\tu ~

    %97
    re2~
    re~
    re

    %100
    <<{sol16^\markup\italic"P.mi" re sol re fa? re fa re
       mib4}\\{re16_\markup\italic"2.di" sib re sib re si re si
               do4}>> sol\tu~
    sol2~

    %103
    sol~\mbreak
    sol
    <<{sol'16^\markup\italic"P.mi" mib sol mib sol mib sol mib

       %106
       do4~\stemDown do\tu~
      do2~
      do~

      %109
      do}\\{mib16_\markup\italic"2.di" do mib do mib do mib do
               la4}>>
    <<{fa'16^\markup\italic"P.mi" do fa do mib? do mib do
       re4}\\{do16_\markup\italic"2.di" la do la do la do la
               sib4}>> fa\tu ~

    %112
    fa2~\mbreak
    fa~
    fa

    %115
    fa'16 sol fa8~fa16 sol fa8~
    fa16 sol fa8~fa16 mib re do
    re do sib8 fa' sib

    %118
    la16 sol fa8~fa16 mib re do
    re do sib8 fa' sib
    la16 sol fa8~fa16 mib re do

    %121
    re do sib8 r4\mbreak
    R2*31
    re16 do sib8 r sib16 do %%%% rip

    %154
    reb8 re4 re8
    mib [sib mib, do'16 re]
    mib8 mi4 mi8\mbreak

    %157
    fa[do fa, re'16 mi]
    fa8 fad4 fad8
    sol[re sol, sol'16 la]

    %160
    sib sol fa?8~fa16 fa sol la
    sib sol fa8~fa16 mib re do
    re do sib8 r fa'

    %163
    sol, sol'4 sib,8
    la la'4 do,8
    sib sib'4 re,8

    %166
    do do'4 mib,8\mbreak
    re\tr do16 sib re8\tr do16 sib
    re8\tr do16 sib do4\tr

    %169
    sib4\fermata r

}

IIIvlan = \relative do' {

    re8[fa la fa]
    re[fa la la]
    fa[mib fa re]

    %4
    do[sib do la]
    fa'[mib fa re]
    do[sib do la]

    %7
    fa'[mib fa re] %%%%% rip.
    fa[fa fa fa]
    sib sib, sol'4

    %10
    sol8[sol sol sol]\mbreak
    do do, la'4
    la8[la la la]

    %13
    re re, sib'4
    fa8[fa do' la]
    fa[fa do' la]

    %16
    fa[mib fa re]
    sib[la' sib sol]
    do,[sib' do la]

    %19
    re,[do' re sib]
    mib,[re' mib fa,]\mbreak
    fa8\tr mib16 re fa8\tr mib16 re

    %22
    fa8\tr mib16 re la'8 fa
    re4 r %%%% fine rip
    R2*25

    %49
    la8[do mi do]
    la[do mi mi]
    do[sib do la]

    %52
    sol[fa' sol mi]
    do[sib do la]
    sol[fa' sol mi]

    %55
    do[sib do la]
    do'[do do do]
    fa,[fa fa] r\mbreak

    %58
    re'[re re re]
    sol,[sol sol] r
    mi'[mi mi mi]

    %61
    la,[sib mi, dod]
    la[la' la la]
    la[la la la]

    %64
    fa4 r8 re
    la'[sol la dod,]
    re[dod re sold,]

    %67
    la[re sol,? la]
    re[dod re re]\mbreak
    la'[sol la dod,]

    %70
    re[dod re sold,]
    la[re sol,? la]
    re[mi fa re]

    %73
    sol4 sol
    do,? do
    fa fa

    %76
    sib, sib
    mi mi
    la, la\mbreak

    %79
    re re
    la8[si dod la]
    re[mi fa re]

    %82
    sol,[la sib? sol]
    do[re mib do]
    re[mi fad re]

    %85
    sol[la sib la]\mbreak
    sol[la sib la]
    sol[mib re re,]

    %88
    sib'[re fad re]
    sib[re fad fad]
    re[do re sib]

    %91
    la[sol' la fad]
    re[do re sib]
    la[sol' la fad]

    %94
    re8\tr do16 sib re8\tr do16 sib\mbreak
    re8\tr do16 sib re8 re
    sib4 fad'8 fad

    %97
    sol[sol fad fad]
    sol[sol fad fad]
    sol[sol fad fad]

    %100
    sol[sol si si]
    sol mib si si
    do do si si

    %103
    do do si si\mbreak
    do do si si
    sol'[sol sol sol]

    %106
    la4 mi8 mi
    fa[fa mi mi]
    fa[fa mi mi]

    %109
    fa[fa mi mi]
    fa[fa fa fa]
    fa4 la,8 la

    %112
    sib[sib la la]\mbreak
    sib[sib la la]
    sib[sib la la]

    %115
    re[fa la fa]
    re[fa la la]
    fa[mib fa re]

    %118
    do[sib do la]
    fa'[mib fa re]
    do[sib do la]

    %121
    fa' fa r4\mbreak
    R2*31
    fa8[mib fa re] %%%%% rip.

    %154
    fa[fa fa fa]
    sib sib, sol'4
    sol8[sol sol sol]\mbreak

    %157
    do do, la'4
    la8[la la la]
    re re, sib'4

    %160
    fa8[fa do' la]
    fa[fa do' la]
    fa[mib fa re]

    %163
    sib[la' sib sol]
    do,[sib' do la]
    re,[do' re sib]

    %166
    mib,[re' mib fa,]\mbreak
    fa8\tr mib16 re fa8\tr mib16 re
    fa8\tr mib16 re la'8 fa

    %169
    re4\fermata r

}

IIIbcn = \relative do {

    sib8[re fa re]
    sib[re fa fa,]
    sib[do re sib]

    %4
    fa'[sol la fa]
    sib,[do re sib]
    fa'[sol la fa]

    %7
    sib,[do re sib] %%% rip.
    sib'[lab lab lab]
    lab?[sol sol] r

    %10
    do[sib sib sib]\mbreak
    sib[la? la] r
    re[do do do]

    %13
    do[sib sib] r
    sib,[sib' la fa]
    sib,[sib' la fa]

    %16
    sib,[do re sib]
    mib[fa sol mib]
    fa[sol la fa]

    %19
    sol[la sib sol]
    la[sib do la]\mbreak
    sib[sib, sib' sib,]

    %22
    sib' sib, fa' fa,
    sib4 r %%% fine rip.
    sib8 fa' mib4

    %25
    re8 fa fa4
    sib8[do la fa]
    re'[sib fa re]

    %28
    sib fa' mib4
    re8 fa la4
    sib8[do la fa]\mbreak

    %31
    sib sib, r sib'
    sib sib, r sib'
    sib sib, r sib'

    %34
    sib sib, r sib'
    sib4 re,8 re,
    r4 mib'8 mib,

    %37
    r4 fa'8 fa,
    r4 sol'8 sol,\mbreak
    r4 la'8 la,

    %40
    sib4 re8 re,
    r4 mib'8 mib,
    r4 fa'8 fa,

    %43
    r4 sol'8 sol,
    r4 la'8 la,
    sib[sib'16 do re8 sib]

    %46
    fa fa' fa,4
    r8 fa' fa,4\mbreak
    r8 fa [do' do,]

    %49
    fa[ la do la]
    fa[la do do,]
    fa[sol la fa]

    %52
    do[re mi do]
    fa[sol la fa]
    do[re mi do]

    %55
    fa[sol la fa]
    fa[mib mib mib]
    mib[re re ] r\mbreak

    %58
    sol[fa fa fa]
    fa[mib! mib] r
    fa[sol sol sol]

    %61
    fa[sol dod, la]
    re re' re, re'
    re, re' la la,

    %64
    re4 r
    R2*23
    sol8[sib re sib]

    %89
    sol[sib re re,]
    sol,[la sib sol]
    re'[mi fad re]

    %92
    sol,[la sib sol]
    re'[mi fad re]
    sol, [sol' sol, sol']\mbreak

    %95
    sol, sol' re re,
    sol4 r
    R2*3

    %100
    sol'8[sol sol, sol]
    do4 r
    R2*3

    %105
    do'8[do do, do]
    fa4 r
    R2*3

    %110
    fa8[fa fa, fa]
    sib4 r
    R2*3

    %115
    sib8[re fa re]
    sib[re fa fa,]
    sib[do re sib]

    %118
    fa'[sol la fa]
    sib, [do re sib]
    fa'[sol la fa]

    %121
    sib[sib sib sib,]\mbreak
    sib fa' mib4
    re8 fa la4

    %124
    sib8[la sib sib,]
    sib fa' mib4
    re8 fa la4

    %127
    sib8[la sib sib,]
    re4 r
    mib r

    %130
    mi r \mbreak
    fa r
    fad r

    %133
    sol r
    mib r
    do r

    %136
    re r
    sib r
    do r \mbreak

    %139
    la r
    sib r
    mib r

    %142
    fa r
    sib,8[do re sib]
    fa'2~

    %145
    fa~
    fa~
    fa

    %148
    sib,8[do re sib]\mbreak
    fa'2~
    fa~

    %151
    fa~
    fa
    sib,8[do re sib] %%% rip.

    %154
    sib'[lab lab lab]
    lab?[sol sol] r
    do[sib sib sib]\mbreak

    %157
    sib[la? la] r
    re[do do do]
    do[sib sib] r

    %160
    sib,[sib' la fa]
    sib,[sib' la fa]
    sib,[do re sib]

    %163
    mib[fa sol mib]
    fa[sol la fa]
    sol[la sib sol]

    %166
    la[sib do la]\mbreak
    sib[sib, sib' sib,]
    sib' sib, fa' fa,

    %169
    sib4\fermata r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sib\major
    \time 2/4
    \tempo 2 = 57
    s2*169
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

IIIvlIII = {
    \IIIglobal
    <<\IIIvlIIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o"

\score {

    \new ChoirStaff <<

        \new PianoStaff  \relative do' <<
            \new Staff <<
                \set PianoStaff.instrumentName =  \markup \center-column{"2""Violini""ob[b]ligati"}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violini]""P.mi & 2di"}
            \IvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>
        \new Staff  <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

    \new ChoirStaff <<

        \new PianoStaff  \relative do' <<
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
            \set Staff.midiInstrument = #"violin"
            \IIvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>
        \new Staff  <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

\markup\huge "[3.] All[egr]o molto"

\score {

    \new ChoirStaff <<

        \new PianoStaff  \relative do' <<
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
            \set Staff.midiInstrument = #"violin"
            \IIIvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>
        \new Staff  <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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
