\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "tutti"

pf = _\markup { \italic poco \dynamic f}

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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
Applying conversion:     Il documento non è stato modificato.
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

Ifln =\relative do'' {

    r8 r4 r
    R1*3
    mib4. sib16. sib32 mib8 sib16. sib32 mib8 sib16. sib32
    mib4 r r2\mbreak

    %6
    sib'4. fa16. fa32 sib8 fa16. fa32  sib8 fa16. fa32
    sib4 r r2
    mib,2\f mib\dolce

    %9
    solb la
    sib8\f sib4 fa16 re mib2\p
    solb\mbreak la

    %12
    sib1
    la
    lab!

    %15
    sol2\f la
    sib8 fa4 fa8 fa \tuplet 3/2 { la16 sib  la do[sib la] sol fa mib }\senza\mbreak
    re8 fa4 fa8 fa \tuplet 3/2 { la16(sib la)  do[sib la] sol fa mib}

    %18
    re8 r r4 r2
    r r8 sib'16. sib32 sol16. sol32 mi16. mi32
    fa8 r r4 r2

    %21
    r2  r8 sib16. sib32 sol16. sol32 mi16. mi32
    fa4 r r2
    R1*4

    %27
    r4 fa2\f mib!4~
    mib re8 fa, sol la16. sib32 do8[do]\mbreak
    la4(sib8) r r2

    %30
    R1*6
    r2 r8 re\f mib fa
    sol r r4 r8 re mib fa\mbreak

    %38
    sib,4 r r8 re mib fa
    sol4 r r8 re mib fa
    sib, sib sib\noBeam r8 r2

    %41
    R1*3\mbreak
    sib'4.\f fa16. fa32 sib8 fa16. fa32  sib8 fa16. fa32
    sib8\noBeam \tuplet 3/2 { sib,16(do sib) re[(mib re)] fa(sol fa) } lab!8 r r4

    %46
    lab8\noBeam \tuplet 3/2 { sib,16(do sib) re[(mib re)] fa(sol fa) } lab8 fa16. fa32  lab8 fa16. fa32
    lab8\tuplet 3/2 { sib,16\solo(do sib) re[(mib re)] fa(sol fa)} lab sol(fa) mib(re) do(sib) lab'
    \slashedGrace lab8 sol4.\dolce sib8 sib4 sol8(sib)\mbreak

    %49
    sib4 fa8(lab) \grace lab16 sol8 fad16(sol)\grace sol16 fa8 mi16(fa)
    mib!(do sol do) mib(do sol' mib) do'2
    do16(si) si si si(lab) lab lab lab(sol) sol sol  sol(fa) fa fa

    %52
    \grace fa mib8 sol,16 do mib(do sol' mib) do'2
    do16(si) si si si(lab) lab lab lab(sol) sol sol  sol(fa) fa fa\mbreak
    \tuplet 3/2 { mib(fa sol) } sol-![sol-!] sol-! sol(lab fa) \tuplet 3/2 { mib(fa sol) } sol-![sol-!] sol-! sol(lab fa)

    %55
    \tuplet 3/2 { mib(fa sol) } sol-![sol-!] sol-! sol(lab fa) \grace fa16 \tuplet 3/2 { mib16 re mib \grace sol fa16[mib re] } re4\tr
    \tuplet 3/2 { mib16(fa sol) } sol-![sol-!] sol-! sol\tr(lab fa) \tuplet 3/2 { mib(fa sol) } sol-![sol-!] sol-! sol\tr(lab fa)
    \tuplet 3/2 { mib(fa sol) } sol-![sol-!] sol-! sol\tr(lab fa) \grace fa \tuplet 3/2 { mib16 re mib \grace sol fa16[mib re] } re4\tr

    %58
    do2\dolce re\mbreak
    mib fa
    sol lab

    %61
    sib4. sib8 sib lab4 sol8~
    sol fa4 mib re do8~
    do sib4 lab' sol fa8~

    %64
    fa mib4 re mib la,8
    sib16 sib sib8\tr sib'16 sib, sib8\tr sib'16 sib, sib8\tr  sib'16 sib, sib8\tr\mbreak
    sib'16 sib, sib8\tr sib'16 sib, sib8\tr sib'16 sib, sib8\tr  sib'16 sib, sib8\tr

    %67
    sib'16 sib, sib8\tr sib'16 sib, sib8\tr sib'16 sib, sib8\tr  sib'16 sib, sib8\tr
    sib'16 sib, sib8\tr sib'16 sib, sib8\tr sib'16 sib, sib8\tr  sib'16 sib, sib8\tr
    sib'16 sib, sib8\tr sib'8 r r2

    %70
    R1*5
    r4 sib2\dolce lab4~
    lab sol8 sib, do (re16. mib32) fa8 fa

    %77
    mib r r4 r2\mbreak
    R1*5
    r2 r8 sol,\f lab sib

    %84
    do r r4 r8 sol lab sib
    mib,4 r r8 sol lab sib
    do r r4 r8 sol lab sib

    %87
    mib, mib' mib,8\noBeam

}

IvlIn =\relative do'' {

    sol8\p \grace sib16 lab8(sol lab sib)
    \grace re do4 sib4. \grace sib16 lab16 sol lab8 lab
    \grace sib16 lab8 sol4 sol8 \grace sib16 lab8(sol lab sib)
    \grace re8 do4 sib~sib16 lab (do16.  lab32) sol8(fa)

    %4
    <mib sol,>4.\f sib16. sib32 <mib sol,>8 sib16. sib32 <mib sol,>8 sib16. sib32
    <mib sol,>4  r8 sib16.\p sib32 mib16\tr(re mib fa) sol\tr(fa sol la)
    <sib re,>4.\f fa16. fa32 <sib re,>8 fa16. fa32  <sib re,>8 fa16. fa32

    %7
    <sib re,>4 r8 fa16.\p fa32 sib16\tr(la sib do) \grace mib re16(do) re sib
    <mib mib,>4.\f mib8\p-! mib(la,) r mib'-!
    mib(la,) r mib'-!  mib(la,) r la

    %10
    sib16\f fa'8 sib fa re16  mib8(la,) r mib'\p
    mib(la,) r mib'\mbreak mib(la,) r la
    sib\f sib4 la16\p sib do(sib re do \grace mib16 re8 do16 sib)

    %13
    do8\f do4 si16\p do re(do mib re \grace fa16 mib8 re16 do)
    re8\f re4 do16\p re mib(re fa mib) \grace sol16 fa8 mib16 (re
    mib8\f ) mib4 mib8 mib16\ff mib8 mib mib mib16

    %16
    re8 fa4 fa8 fa \tuplet 3/2 { la16 (sib  la) do[sib la] sol fa mib }\senza\mbreak
    re8 fa4 fa8 fa \tuplet 3/2 { la16(sib la)  do[sib la] sol fa mib}
    re8\tuplet 3/2 {
        re16\p mib fa sol[la sib] sol la sib do,[re mib] do re mib fa[sol la] fa sol la

        %19
        sib, do re sib[do re] mib fa sol do,[re mib] re mib fa
    } sib,16.\f [sib32] sol16. sol32 mi16. mi32
    fa8\noBeam \tuplet 3/2 {
        re'16\dolce mib! fa sol[la sib] sol la sib do,[re mib] do re mib fa[sol la] fa sol la
        sib, do re sib[do re] mib fa sol do,[re mib]\mbreak re mib fa
    } sib,16.\f [sib32] sol16. sol32 mi16. mi32

    %22
    fa4  r8 fa\pp \grace lab16 solb8 (fa la sib)
    do4 reb8 fa,(mib! reb do sib)
    la4 sib8 fa' \grace lab16 solb8(fa la sib)

    %25
    do4(reb8) do4 \grace do16 sib16 la sib8 sib
    la fa fa'2 mib4~
    mib re8 fa, sol(la16. sib32) do8 do

    %28
    la4(sib8) r r2\mbreak
    r4 fa'2\solo mib4
    re8\dolce \tuplet 3/2 {
        sib16 do re mib[(fa sol)] la fa la sib[(fa re)] sib do re mib[(fa sol)] la fa la

        %31
        sib(fa re) sib[do re] mib(fa sol) la[fa la] sib la sol fa[mib re] sol fa mib re[do sib]
        mib re do sib[la sol] fa la sib do[re mib] re do sib sol'[mib do]
    } do4\tr
    sib8 \tuplet 3/2 { re,16 mib fa sol[la sib] do la do }\mbreak re8 \tuplet 3/2 { re,16 mib fa sol[la sib] do la do }

    %34
    re8 \tuplet 3/2 { re,16 mib fa sol[la sib] do la do } re8 r sib r
    sib r do r sib sib4 la8
    sib4 r r8 re,\f mib fa

    %37
    sol\tuplet 3/2 { sib'16 la sol fa[mib re] do sib la sol[fa mib] re do sib } mib8 fa\mbreak
    sib,8 r r4 r8 re mib fa
    sol\tuplet 3/2 { sib'16 la sol fa[mib re] do sib la sol[fa mib] re do sib } mib8 fa

    %40
    sib, sib' sib,\noBeam re'\p \grace fa16 mib8 (re mib fa)
    \grace la?8 sol4 fa4. \grace fa16 mib re mib8 mib
    \grace fa16 mib8 re4 re8 \grace fa16 mib8 re mib fa

    %43
    \grace la?16 sol4 fa~fa16 mib sol16. mib32 re8 do\mbreak
    <sib re,>4.\f fa16. fa32 sib8 fa16. fa32  sib8 fa16. fa32
    <sib re,>4 r r8 \tuplet 3/2 { sib16\dolce (do sib) re[(mib re)] fa(sol fa) }

    %46
    <lab! sib,>4.\f  fa,16. fa32 <lab sib,>8 fa16. fa32 <lab sib,>8 fa16. fa32
    <lab sib,>4 r r r8 sib\p
    sib sib(sol) r r sib sib sib\mbreak

    %49
    r sib sib sib r si si si
    do r r4 r8 sol(lab sol)
    fa fa mib mib re re si' si

    %52
    do4 r r8 sol(lab sol)
    fa fa mib mib re re si' si\mbreak
    do mib,(re) r r mib(re) r

    %55
    r mib(re) r r do'4 si8
    do mib,(re) r r mib(re) r
    r mib(re) r r do'4 si8

    %58
    do4 r r2\mbreak
    sib?1\p~
    sib8 sib mib4~mib8 re fa4~

    %61
    fa8 mib sol4~sol8 fa4 mib8
    re4(do sib lab)
    sol4 fa8 fa'4 mib8 re16(do sib lab)

    %64
    sol4(fa) mib2
    <sib'' sib, re,>4 lab16\dolce(sol fa mib) re4. sib8\mbreak
    sol'4 \grace fa16 mib8 re16(mib) la,2

    %67
    <sib' sib,>4 lab!16(sol fa mib) re4. sib8
    sol'4 fa16(mib re mib) la,2
    sib4 r8 sol\dolce \grace sib16 lab?8(sol lab sib)

    %70
    \grace re8 do4 sib~sib8 \grace sib16 lab sol lab8 lab
    \grace sib16 lab8 sol4 sol8 \grace sib16 lab8(sol lab sib)\mbreak
    \grace re8 do4 sib~sib16 lab do sib \grace sib lab8 sol

    %73
    fa sib, sib'2 lab4~
    lab sol8 sib, do (re16. mib32) fa8 fa
    re4(mib8) re mib16-! mib(re do) re8 re16 mib

    %76
    fa fa fa8\tr sol sib do (re16. mib32) fa8 fa
    mib \tuplet 3/2 { sol,16 lab sib do[re mib] fa re fa } sol8\tuplet 3/2 { sol,16 lab sib do[re mib] fa re fa }\mbreak
    sol8\tuplet 3/2 { sol,16 lab sib do[re mib] fa re fa } sol8 r mib r

    %79
    mib r fa r mib mib,4 re8
    mib\tuplet 3/2 {
        mib16 fa sol lab[(sib do)] re sib re mib[(sib sol)] mib fa sol lab[(sib do)] re sib re
        mib [sib sol] mib fa sol lab[(sib do)] re sib re mib[re do] sib lab sol do[sib lab] sol fa mib

        %82
        lab sol fa mib[re do] sib re mib fa[sol lab] sol fa mib do'[lab fa]
    } fa4\tr
    mib r r8 sol,\f lab sib
    do\noBeam \tuplet 3/2 { sol''16 fa mib re[do sib] lab sol fa mib[re do] sib lab sol } lab8 sib

    %85
    <mib sol,>4 r r8 sol, lab sib
    do8\noBeam \tuplet 3/2 { sol''16 fa mib re[do sib] lab sol fa mib[re do] sib lab sol } lab8 sib
    <mib sol,>8 mib' <mib, sol,>8\noBeam

}


IvlIIn =\relative do'' {

    mib,8\p \grace sol16 fa8(mib fa sol)
    \grace sib lab4 sol4. \grace sol16fa mib fa8 fa
    \grace sol16 fa8 mib4 mib8 \grace sol16 fa8(mib fa sol)
    \grace sib8 lab4 sol~sol16 fa (lab16. fa32) mib8 (re)

    %4
    <mib sol,>4.\f sib16. sib32 <mib sol,>8 sib16. sib32 <mib sol,>8 sib16. sib32
    <mib sol,>4  r8 sib16.\p sib32 mib16\tr(re mib fa) sol\tr(fa sol la)
    <sib re,>4.\f fa16. fa32 <sib re,>8 fa16. fa32  <sib re,>8 fa16. fa32

    %7
    <sib re,>4 r8 fa16.\p fa32 sib16\tr(la sib do) \grace mib re16(do) re sib
    <<la2\f\\la>> r8 la\p la la
    r la la la r solb solb(mib)

    %10
    re16\f(fa) re(fa) re(fa) re(re') r8 la\p la la
    r la la la\mbreak r solb-! solb(mib)
    <<{re\f[re]}\\{re[re]}>> re\p re4 re re8

    %13
    mib\f mib mib\p\noBeam mib4 mib mib8
    fa\f fa fa\p\noBeam fa4 fa fa8
    sol16\f sol sol sol sol sol sol sol <<{la\ff la la la la la la la}\\{fa fa fa fa fa fa fa fa}>>

    %16
    <<
        sib8\\{
            <sib fa>\terzine\override TupletBracket.bracket-visibility = ##f \tuplet 3/2 { \slurUp sib16(re fa) mib[fa mib] re mib re }
        }
    >>
    do8 do4 do8\mbreak
    \senza sib8\tuplet 3/2 { sib16(re fa) mib[fa mib] re mib re } do8 do4 do8
    sib8 \tuplet 3/2 {
        sib16\p do re mib[fa sol] mib fa sol la,[sib do] la sib do re[mib fa] re mib fa

        %19
        sol, la sib sol[la sib] do re mib la,[sib do] sib do re
    } sib16.\f [sib32] sol16. sol32 mi16. mi32
    fa8\noBeam \tuplet 3/2 {
        sib16\p do re mib![fa sol] mib fa sol la,[sib do] la sib do re[mib fa] re mib fa
        sol, la sib sol[la sib] do re mib la,[sib do] sib do re
    } sib16.\f [sib32] sol16. sol32 mi16. mi32

    %22
    fa4 r r8 fa4\pp fa8
    fa16 fa fa fa fa fa fa8\tr la,(sib do reb)
    mib16 mib mib mib reb8 r r fa4 fa8

    %25
    fa16 fa fa fa fa8 fa4 fa mi8
    fa4. fa8 sol la16. sib32 do8 do
    la4(sib8) r r2

    %28
    r4 fa'2 mib!4~\mbreak
    mib re8 fa, sol la16. sib32 do8 do
    sib8\dolce\tuplet 3/2 { re,16 mib fa sol[la sib] do la do } re8\tuplet 3/2 { re,16 mib fa sol[la sib] do la do }

    %31
    re8\tuplet 3/2 { re,16 mib fa sol[la sib] do la do } re8\p r sib-! r
    sib-! r do r sib sib4 la8
    sib\solo \noBeam \tuplet 3/2 { sib16 do re mib[(fa sol)] la fa la }\mbreak \tuplet 3/2 {
        sib(fa re) sib[do re] mib(fa sol) la[fa la]
    }

    %34
    \tuplet 3/2 {
        sib(fa re) sib[do re] mib(fa sol) la[fa la] sib la sol fa[mib re] sol fa mib re[do sib]
        mib re do sib[la sol] fa la sib do[re mib] re sib' fa sol[mib do]
    } do4\tr
    re8\f \tuplet 3/2 { sib'16 la sol fa[mib re] do sib  la sol[fa mib] re do sib } mib8 fa

    %37
    sol4 r r8 re\f mib fa\mbreak
    \once\stemUp sib,8\tuplet 3/2 { sib''16 la sol fa[mib re] do sib  la sol[fa mib] re do sib} mib8 fa
    sol4 r r8 re mib fa
    sib, sib' sib,\noBeam sib'\p \grace re16 do8(sib do re)

    %41
    \grace fa8 mib4 re4. \grace re16 do sib do8 do
    \grace re16 do8 sib4 sib8 \grace re16 do8(sib do re)
    \grace fa8 mib4 re~re16 do mib16. do32 sib8 la\mbreak

    %44
    <sib re,>4.\f fa16. fa32 sib8 fa16. fa32  sib8 fa16. fa32
    <sib re,>4 r r2
    <fa lab,!>8\f <fa lab,>4 re16. re32 fa8 re16. re32 fa8 re16. re32

    %47
    <fa sib,>4 r r2
    R1*2
    r2 r8 mib\p(fa mib)

    %51
    re re do do si si re re
    do4 r r8 mib(fa mib)
    re re do do si si re re\mbreak

    %54
    do do(si) r r do(si) r
    r do si r r do'4 si8
    do do,(si) r r do(si) r

    %57
    r do (si) r r do'4 si8
    do4 r r2\mbreak
    sib,1\p~

    %60
    sib8 sib mib4~mib8 re fa4~
    fa8 mib sol4~sol8 fa4 mib8
    re r r4 r2

    %63
    R1
    sib'4. lab!8 sol sol solb solb
    fa4 r lab'\dolce sol16(fa mib re)\mbreak

    %66
    mib8 sib4 sib8 solb'4 \grace fa16 mib8 re16 mib
    re4~re16 mib (fa sol) lab4 \grace sol?16 fa8 mib16 re
    mib8 sib4 sib8 solb'4 \grace fa16 mib8 re16 mib

    %69
    re4 r8 mib,\dolce\grace sol16 fa8(mib fa sol)
    \grace sib lab4 sol4. \grace sol16fa mib fa8 fa
    \grace sol16 fa8 mib4 mib8 \grace sol16 fa8(mib fa sol)

    %72
    \grace sib8 lab4 sol~sol16 fa lab sol fa8 mib
    re4. sib8 do8 (re16. mib32) fa8 fa
    re4 mib8 re mib16 mib(re do) re8 re16 mib

    %75
    fa8 fa16 re sib8 r r2
    r4 sib''2 lab4
    sol8\solo\tuplet 3/2 {
        mib16 fa sol lab[(sib do)] re sib re mib[(sib sol)] mib fa sol lab[(sib do)] re sib re

        %78
        mib(sib sol) mib[fa sol] lab(sib do) re[sib re] mib re do sib[lab sol] do sib lab sol[fa mib]
        lab sol fa mib[re do] sib re mib fa[sol lab] sol  fa mib do [lab' fa]
    } fa4\tr
    \once\stemDown mib8 \tuplet 3/2 { sol,,16 lab sib do [re mib] fa re fa } sol8\noBeam\tuplet 3/2 { sol,16 lab sib do [re mib] fa re fa }

    %81
    sol8\noBeam\tuplet 3/2 { sol,16 lab sib do [re mib] fa re fa } sol8 r mib r\mbreak
    mib r fa r mib mib4 re8
    mib\tuplet 3/2 { sol'16\f fa mib re[do sib] lab sol fa mib[re do] sib[lab sol] } lab8 sib

    %84
    do r r4 r8 sol lab sib
    \once \stemUp mib\f \tuplet 3/2 { sol'16 fa mib re[do sib] lab sol fa mib[re do] sib[lab sol] } lab8 sib
    do r r4 r8 sol lab sib

    %87
    <mib sol,>8 mib' <mib, sol,>8\noBeam

}


Ivlan =\relative do' {

    r8 mib4\p mib
    mib2 r4 r8 re(
    mib8) mib mib,\noBeam r mib'4 mib
    mib4. sol,8 lab lab sib sib

    %4
    <mib sol,>4.\f sib16. sib32 mib8 sib16. sib32 mib8 sib16. sib32
    mib8\p sol, sol sol sol4 r\mbreak
    <<<sib' re,>4.\f\\sib,>> fa'16. fa32 sib8 fa16. fa32  sib8 fa16. fa32

    %7
    sib8\p sib, sib sib sib r r4
    do8\f do do do r mib\p mib mib
    r mib mib mib r mib mib(dob)

    %10
    sib16\f(re) sib re sib(re) sib re r8 mib\p mib mib
    r mib mib mib\mbreak r mib mib(dob)
    sib\f sib' sib,\p sib sib sib sib sib

    %13
    sib sib' sib,\p sib sib sib sib sib
    sib\f sib' sib,\p sib sib sib sib sib
    sib16\f sib sib sib sib sib sib sib do\ff do do do do do do do

    %16
    sib8 fa la sib do fa la la,\mbreak
    sib fa la sib do fa la la,
    sib r r4 r2

    %19
    r4 r8 fa'\p sib, sib'16.\f  sib32 sol16. sol32 mi16. mi32
    fa8 r r4 r2
    r4 r8 fa\p \mbreak sib, sib'16.\f  sib32 sol16. sol32 mi16. mi32

    %22
    fa4 r8 fa,\pp la(sib do reb)
    mib16 mib mib mib reb8 r r fa4 fa8
    fa16 fa fa fa fa fa fa8\tr la,(sib do reb)

    %25
    mib16 mib mib mib reb8 r r2
    r4 la'_\markup\italic "dolcis[simo]"sib16-! sib(la sol) la8 la16(sib)
    do8 do16(la) fa8 la sib16-! sib(la sol) la8 la16(sib)

    %28
    do8 do16(la) fa8 la sib16-! sib(la sol) la8 la16(sib)\mbreak
    do8 do16(la) fa8 la sib16-! sib(la sol) la8 la,
    sib r r mib re(sib) r mib(

    %31
    re) sib r mib(re) r mib r
    mib r r fa fa mib fa fa,
    sib4 r8 mib\mbreak re(sib) r mib

    %34
    re sib r mib(re) r mib r
    mib r r fa fa mib fa fa,
    \senza sib\noBeam\f \tuplet 3/2 { re'16 do sib la[sol fa] mib re do sib[la sol] fa mib re } mib8 fa

    %37
    \once\stemUp  sol \tuplet 3/2 { re''16 do sib  la[sol fa] mib re do sib[la sol] fa mib re } mib8 fa
    sib\noBeam\tuplet 3/2 { re'16 do sib la[sol fa] mib re do sib[la sol] fa mib re } mib8 fa
    \once\stemUp  sol \tuplet 3/2 { re''16 do sib  la[sol fa] mib re do sib[la sol] fa mib re } mib8 fa

    %40
    <<{sib [re re]}\\{s sib [sib]}>> r sib4\p sib
    sib2 r4 r8 la'(
    sib) sib sib, r sib4 sib

    %43
    sib4. re8 mib mib fa fa,\mbreak
    <<<sib' re,>4.\f\\sib,>> fa'16. fa32 sib8 fa16. fa32  sib8 fa16. fa32
    sib4 r r2

    %46
    <<
        {
            re,8\f re re re re re re re
            re4
        }\\{
            sib8 sib sib sib sib sib sib sib
            sib4
        }
    >> r re8\p re4fa8
    mib mib mib, r r sol' sol sol\mbreak %% fine p. 11

    %49
    r fa fa fa sol4 sol,
    do8 r r4 r2
    r r8 sol' sol sol

    %52
    sol4  r r2
    r r8 sol sol sol\mbreak
    sol4 r8 re(mib4) r8 re

    %55
    mib4 r8 re mib fa sol sol,
    do r r re(mib4) r8 re
    (mib4) r8 re mib fa sol sol,

    %58
    mib'2 fa\mbreak
    sol8(lab sib sol) lab2
    sol4. sol,8 lab4. lab8

    %61
    sib4. sol8 lab4 lab
    sib8 sib sib sib sib sib sib sib
    sib8 sib sib sib sib sib sib sib

    %64
    sib8 sib sib sib sib sib sib sib
    sib r r4 fa'8 fa sib, sib\mbreak
    sib mib\tr sol sol mib mib do do

    %67
    <<fa4\\sib,>> r fa'8 fa sib, sib
    sib mib\tr sol sol mib mib do do
    <<fa4\\sib,>> r mib\p mib

    %70
    mib2 r4 r8 re
    mib mib mib, r mib'4 mib\mbreak
    mib2 lab,4. la8

    %73
    sib4 re mib16-! mib(re do) re8 re16 mib
    fa8 sib, sib'2 lab4~
    lab sol8 sib, do16-! do (re mib) fa8 fa

    %76
    re4 mib8 re mib16-! mib(re do) re8 re
    mib r r <<{sib'~sib4 s8 sib}\\{lab8 sol mib r lab}>>\mbreak
    <<
        {sib4  r8 sib sib}\\{sol8 mib s lab sol}
    >> r lab r

    %79
    lab r r sib~sib lab, sib sib
    mib4 r8 <<
        {
            sib' sib4 r8 sib
            sib4 r8 sib sib
        }\\{
            lab8 sol mib s lab
            sol mib s lab sol
        }
    >> r lab r\mbreak

    %82
    lab r r sib~sib8 lab, sib sib
    mib\f \tuplet 3/2 { mib'16 re do sib[lab sol] fa mib re do[sib lab] sol fa mib } lab8 sib
    \once \stemUp do \tuplet 3/2 { mib'16 re do sib[lab sol] fa mib re do[sib lab] sol fa mib } lab8 sib

    %85
    \once \stemUp mib, \tuplet 3/2 { mib''16 re do sib[lab sol] fa mib re do[sib lab] sol fa mib } lab8 sib
    \once \stemUp do \tuplet 3/2 { mib'16 re do sib[lab sol] fa mib re do[sib lab] sol fa mib } lab8 sib
    <<{mib, [mib' mib]}\\{s sol,[sol]}>>

}


IvcIn =\relative do {

    r8 r2
    r8 mib\p mib, sol lab4 sib
    mib,8 mib' mib,4 r2
    r8 mib' mib, sol lab lab sib sib

    %4
    <<sol4.\f\\mib>> sib'16. sib32 mib8 sib16. sib32 mib8 sib16. sib32
    mib8\p\mbreak mib mib mib mib mib mib mib
    <<
        {
            re\f re re re re re re re

            %7
            re\p re re re re re re re
            do\f do do do
        }\\{
            re re re re re re re re
            re re re re re re re re
            do, do do do
        }
    >> r8 do''\p do do
    r dob dob dob r dob, dob dob

    %10
    sib\f sib sib sib do! do'\p do do
    r dob dob dob\mbreak r dob, dob dob
    sib\f sib' sib,\p sib sib r r4

    %13
    sib8\f sib' sib,\p sib sib r r4
    sib8\f sib' sib,\p sib sib r r4
    sib8\f sib sib sib sib\ff sib sib sib

    %16
    sib re do sib la fa' fa fa,\mbreak
    sib re do sib la fa' fa fa,
    sib r r4 r2

    %19
    r r8 sib'\f sol mi
    fa r r4 r2
    r\mbreak r8 sib sol mi

    %22
    fa,4 r8 fa'\pp (mib! reb do sib)
    la4 sib8(fa') \mbreak \grace lab16 solb8 fa la sib
    do4 reb8 fa, mib(reb do sib)

    %25
    la la'(sib lab) solb solb solb, solb
    fa fa' fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa

    %28
    fa fa fa fa fa fa fa fa\mbreak
    fa fa fa fa fa fa fa fa
    sib, r r fa' sib,4 r8 fa'

    %31
    sib,4 r8 fa' sib, r mib r
    sol r la r sib mib, fa fa,
    sib4 r8 fa'\mbreak sib,4 r8 fa'

    %34
    sib,4 r8 fa' sib, r mib r
    sol r  la r sib mib, fa fa,
    sib4 r r8 re\f mib fa

    %37
    sol4 r r8 re mib fa\mbreak
    sib,4 r r8 re, mib fa
    sol4 r r8 re mib fa

    %40
    <<{sib [re re]}\\{s sib [sib]}>> r r2
    r8 sib'\p sib, re mib4 fa
    sib,8 sib' sib,4 r2

    %43
    r8 sib'\p sib, re mib mib fa fa\mbreak
    sib,4.\f fa16. fa32 sib8 fa16. fa32  sib8 fa16. fa32
    sib4 r r2

    %46
    sib8 sib' sib, sib sib sib sib sib
    sib4 r sib8\p sib sib re
    mib mib mib, r r mib'' mib mib\mbreak

    %49
    r re re re <<si2\\re,>>
    do4 r r2
    r r8 sol' sol sol,

    %52
    do4 r r2
    r r8 sol sol' sol,\mbreak
    do4 r8 si'(do4) r8 si(

    %55
    do4) r8 si(do) fa, sol sol,
    do4 r8 si'(do4) r8 si(
    do4) r8 si(do) fa, sol sol,

    %58
    do(mib re do) sib(do sib lab)\mbreak
    <<
        {sol'(fa sol mib re do re sib)}\\sol
    >>
    mib4. mib'8(fa4.) fa8(

    %61
    sol4.) sol8(lab4) lab,
    sib1~
    sib~

    %64
    sib
    sib8 sib sib sib sib sib sib sib\mbreak
    sib sib sib sib sib sib sib sib

    %67
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib' sib, r r2

    %70
    r8 mib mib, sol lab4 sib
    mib,8 mib' mib,4 r2\mbreak
    r8 mib' mib, sol lab4. la8

    %73
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %76
    sib sib sib sib sib sib sib sib
    mib r r sib' mib,4 r8 sib'\mbreak
    mib,4 r8 sib' mib, r lab r

    %79
    do r re r \once\stemDown mib lab,, sib sib
    mib mib, r sib' mib,4 r8 sib'
    mib,4 r8 sib' mib, r lab r\mbreak

    %82
    do r re r mib lab, sib sib
    mib,4\f r r8 sol lab sib
    do r r4 r8 sol lab sib

    %85
    mib,4 r r8 sol lab sib
    do r r4 r8 sol lab sib
    mib, [mib' mib,]

}


IvcIIn =\relative do {

    r8 r2
    r8 mib\p mib, sol lab4 sib
    mib,8 mib' mib,4 r2
    r8 mib' mib, sol lab lab sib sib

    %4
    <<sol4.\f\\mib>> sib'16. sib32 mib8 sib16. sib32 mib8 sib16. sib32
    mib8\p\mbreak mib mib mib mib mib mib mib
    <<
        {
            re\f re re re re re re re

            %7
            re\p re re re re re re re
            do\f do do do
        }\\{
            re re re re re re re re
            re re re re re re re re
            do, do do do
        }
    >> r8 do''\p do do
    r dob dob dob r dob, dob dob

    %10
    sib\f sib sib sib do! do'\p do do
    r dob dob dob\mbreak r dob, dob dob
    sib4\f~sib8 r r2

    %13
    sib4\f~sib8 r r2
    sib4\f~sib8 r r2
    sib8\f sib sib sib sib\ff sib sib sib

    %16
    sib re do sib la fa' fa fa,\mbreak
    sib re do sib la fa' fa fa,
    sib r r4 r2

    %19
    r r8 sib\f sol mi
    fa r r4 r2\mbreak
    r r8 sib sol mi

    %22
    fa4 r r2
    R1*2
    r2 r4 solb4\p

    %26
    fa8 fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa\mbreak

    %29
    fa fa fa fa fa fa fa fa
    sib4 r r2
    R1*5

    %36
    r2 r8 re\f mib fa
    sol4 r r8 re mib fa\mbreak
    sib,4 r r8 re, mib fa
    sol4 r r8 re mib fa

    %40
    <<{sib [re re]}\\{s sib [sib]}>> r r2
    r8 sib'\p sib, re mib4 fa
    sib,8 sib' sib,4 r2

    %43
    r8 sib'\p sib, re mib mib fa fa\mbreak
    sib,4.\f fa16. fa32 sib8 fa16. fa32  sib8 fa16. fa32
    sib4 r r2

    %46
    sib8 sib' sib, sib sib sib sib sib
    sib4 r r2
    R1\mbreak

    %49
    r2 r8 sol' sol sol,
    do4 r r2
    r r8 sol' sol sol,

    %52
    do4 r r2
    r r8 sol sol' sol,\mbreak
    do4 r8 si'(do4) r8 si(

    %55
    do4) r8 si(do) fa, sol sol,
    do4 r8 si'(do4) r8 si(
    do4) r8 si(do) fa, sol sol,

    %58
    do(mib re do) sib(do sib lab)\mbreak
    <<
        {sol'(fa sol mib re do re sib)}\\sol
    >>
    mib4. mib'8(fa4.) fa8(

    %61
    sol4.) sol8(lab4) lab,
    sib1~
    sib~

    %64
    sib
    sib8 sib sib sib sib sib sib sib\mbreak
    sib sib sib sib sib sib sib sib

    %67
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib' sib, r r2

    %70
    r8 mib mib, sol lab4 sib
    mib,8 mib' mib,4 r2\mbreak
    r8 mib' mib, sol lab4. la8

    %73
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %76
    sib sib sib sib sib sib sib sib
    mib,4 r r2\mbreak
    R1*5

    %83
    r2 r8  sol\f lab sib
    do r r4 r8 sol lab sib
    mib,4 r r8 sol lab sib

    %86
    do r r4 r8 sol lab sib
    mib, [mib' mib,]

}

forma = {

    \time 4/4
    \key mib\major
    \tempo 2 = 47
    \partial 8*5 s2 s8
    s1*39
    s4 s8 \bar ":..:"
    s8 s2
    s1*46
    s4 s8
    \bar ":|."

}


Ifl = {
    \Iglobal
    <<\Ifln \forma>>
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


IvcI = {
    \Iglobal
    \clef bass
    <<\IvcIn \forma>>
}


IvcII = {
    \Iglobal
    \clef bass
    <<\IvcIIn \forma>>
}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IIfln =\relative do'' {

    fa4\p\override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan fa8 fa fa fa\stopTrillSpan
    sib4(fa) r
    mib'8 mib\f~mib16. re32 \grace re16 do16. sib32 \grace sib16 la16. sol32 \grace sol16 fa16. mib32

    %4
    re4 r r
    fa4\p\override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan fa8 fa fa fa\stopTrillSpan
    sib4(fa) r\mbreak

    %7
    mib'8\f mib~mib16. re32 \grace re16 do16. sib32 \grace sib16 la16. sol32 \grace sol16 fa16. mib32
    mib2\p(re8) r
    do4\dolce\override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan do8 do do do\stopTrillSpan

    %10
    fa\tr la16(sol) sol2
    la16(fa re sib') \grace la8 sol2\tr
    fa r4

    %13
    R2.
    do4\p\override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan do8 do do do\stopTrillSpan
    fa4(do) r\mbreak

    %16
    do\tr fa,8 fa'(mi mib)
    re r r4 r
    r la'16\f la32\tr sol la16 si? do la fa do

    %19
    re8 fa16.\f(re32) do8 do16.\f (la32) sib8 sib16.\f(sol32)
    fa8 la fa4 r
    do'4\p\override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan do8 do do do\stopTrillSpan

    %22
    fa4(do) r\mbreak
    R2.
    r16 sol'\f \grace sol fa16. mib32 \grace mib16 re16. do32 \grace do16 sib16. la32 sol8 r

    %25
    re'4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan re8 re re re\stopTrillSpan
    sol4(re) r
    R2.

    %28
    r16 la'\f \grace la sol16. fa32 \grace fa16 mi16. re32 \grace re16 do16. si32 la8 r
    R2.*3
    la'4\tr\f la,8 r8 r4

    %33
    R2.*3
    la'4\tr\f la,8 r8 r4
    sib'!2.\p

    %38
    sib8(lab) lab4. lab16.\f (sol32)
    sol16 sol32\tr fad sol16 la?  si si32\tr la si16 do re si sol fa\mbreak
    fa(sol re mib) mib4 r

    %41
    mib\dolce~mib16 mib(fa sol) \grace fa mib8 re16 mib
    mib4(re16) re(mib fa) \grace mib re8 do16 re
    re8 do4 re16 do \grace do sib?8 la16 sib

    %44
    \grace sib la8 sol16 fa fa4 r
    R2.
    fa'4\p fa8 fa fa16.\f fa32 sol16. la32

    %47
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32\mbreak
    fa'4 r r
    R2.

    %50
    fa4\p fa8 fa fa16. fa32\f sol16. la32
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32
    la16. la32 do16. la32 fa4 r

    %53
    fa'4\p\override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan fa8 fa fa fa\stopTrillSpan
    sib4(fa) r
    fa \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan fa8 fa fa fa\stopTrillSpan

    %56
    sib4. sib,8(la lab)
    sol r r4 r\mbreak
    r r r16 re''-! sib (fa)

    %59
    sol8 sib16.\f (sol32) fa8 fa16.\f(re32) mib8 mib16.\f(do32)
    re16 re32\tr do re16-! mib-! fa8 r r4
    R2.

    %62
    r4 r r16  re'-!\f sib-! fa-!
    sol8 sib16.\f (sol32) fa8 fa16.\f(re32) mib8 mib16.\f(do32)
    sib8 fa \grace mib re4 r

}

IIvlIn =\relative do'' {

    fa,4\p\override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan fa8 fa fa fa\stopTrillSpan
    sib4(fa) r
    <mib' fa,>8 mib\f ~mib16. re32 \grace re16 do16. sib32 \grace sib16 la16. sol32 \grace sol16 fa16. mib32

    %4
    re4 r r
    fa4\p\override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan fa8 fa fa fa\stopTrillSpan
    sib4(fa) r\mbreak

    %7
    <mib' fa,>8\f mib~mib16. re32 \grace re16 do16. sib32 \grace sib16 la16. sol32 \grace sol16 fa16. mib32
    mib2\p(re4)
    do2.\pp

    %10
    do'4\override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan do8 do do do\stopTrillSpan
    do fa4 fa8 mi mi
    <<
        fa2\\<fa la,>
    >> r4

    %13
    do,4\pp\override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan do8 do do do\stopTrillSpan
    fa4(do) r
    do4\override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan do8 do do do\stopTrillSpan\mbreak

    %16
    fa4 do8(la sib do)
    re16 (mi fa fad sol la sib si) do\<(dod re mi)
    fa fa32\tr mi fa16-! sol-!\! la16\f la32\tr sol la16 si do la fa do

    %19
    re16. re32 fa16.\f(re32) do16. la32 do16.\f (la32) sib16. sol32 sib16.\f(sol32)
    fa8 do <fa la,>4 r
    la4\p(do sib)

    %22
    la r r\mbreak
    R2.
    r16 sol\f\grace sol fa16. mib32 \grace mib16 re16. do32 \grace do16 sib16. la32 sol8 r

    %25
    sib'4\p(re do)
    sib r r
    R2.

    %28
    r16 la\f \grace la sol16. fa32 \grace fa16 mi16. re32 \grace re16 do16. si32 la8 r
    R2.
    sib'!4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan sib8 sib sib sib\stopTrillSpan\mbreak

    %31
    sib2.
    <<{la8.\f[la16] la4}\\{la8.[la16] la4}>> r
    R2.

    %34
    sib4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan sib8 sib sib sib\stopTrillSpan\mbreak
    sib2.
    <<{la8.\f[la16] la4}\\{la8.[la16] la4}>> r

    %37
    sib4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan sib8 sib sib sib\stopTrillSpan
    sib(lab) lab4. lab16.\f (sol32)
    sol16 sol'32\tr fad sol16 la?  si si32\tr la si16 do re si sol fa\mbreak

    %40
    fa(sol re mib) mib4 r
    mib\dolce~mib16 mib(fa sol) \grace fa mib8 re16 mib
    mib4(re16) re(mib fa) \grace mib re8 do16 re
    re8 do4 re16 do \grace do sib?8 la16 sib

    %44
    \grace sib la8 sol16 fa fa4 r
    la2.\p
    sib8[(do re do)] sib16. fa'32\f sol16. la32

    %47
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32\mbreak
    fa4 r r
    la2.\p

    %50
    sib8[(do re do)] sib16. fa'32\f sol16. la32
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32
    la16. la32 do16. la32 fa4 r

    %53
    R2.
    fa4\p\override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan fa8 fa fa fa\stopTrillSpan
    sib4(fa) r

    %56
    fa fa8[(re mib fa)]
    sol16(la sib\< si) do (re mib mi) fa(fad sol la)\mbreak
    sib? sib32\tr la sib16-! do-! re-! re32\tr do re16-! mib?-!\! fa\f re sib fa?

    %59
    sol16. sol32 sib16.\f (sol32) fa16. re32 fa16.\f(re32) mib16. do32 mib16.\f(do32)
    re16 re32\tr do re16-! mib-! fa8 r r16 re,\p(mib fa)
    sol16(la sib\< si) do (re mib! mi) fa(fad sol la)\mbreak

    %62
    sib? sib32\tr la sib16-! do-! re-! re32\tr do re16-! mib?-!\! fa\f re sib fa?
    sol16. sol32 sib16.\f (sol32) fa16. re32 fa16.\f(re32) mib16. do32 mib16.\f(do32)
    sib8 <re, sib> <re sib>4 r

}


IIvlIIn =\relative do'' {

    re,4(fa mib)
    re4. re8(mib fa)
    <mib' fa,>8 mib\f ~mib16. re32 \grace re16 do16. sib32 \grace sib16 la16. sol32 \grace sol16 fa16. mib32

    %4
    re4 r r
    re(fa mib)
    re4. re8(mib fa)\mbreak

    %7
    <mib do>\f do'~do16. sib32 \grace sib16 la16. sol32 \grace sol16 fa16. mib32\grace mib16 re16. do32
    do2\dolce(sib4)
    sol2.\pp

    %10
    do4\override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan do8 do do do\stopTrillSpan
    do r r4 r
    R2.*2

    %14
    la'4(do sib)
    la r r\mbreak
    do8(la) fa[fa(mi mib)]

    %17
    re r r4 r8 sol\<
    do, do' do\f do fa, fa
    fa re'16.\f(sib32) la8 la16.\f(fa32) sol8 sol16.\f(mi32)

    %20
    fa8 do <fa la,>4 r
    R2.
    do4\p\override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan do8 do do do\stopTrillSpan\mbreak

    %23
    do2.
    sib16. sol'32\f\grace sol16 fa16. mib32 \grace mib16 re16. do32 \grace do16 sib16. la32 sol8 r
    R2.

    %26
    <<
        {
            re'4\p re8 re re re
            re2.
        }\\{
            re4 re8 re re re
            re2.
        }
    >>
    do16.\f la'32 \grace la16 sol16. fa32 \grace fa16 mi16. re32 \grace re16 do16. si32 la8 r

    %29
    <<
        {
            la'4\p la8 la la la
            la2.
        }\\{
            la4 la8 la la la
            la2.
        }
    >>\mbreak
    sol

    %32
    sol4\f fa r
    <<
        {
            la4\p la8 la la la
            la2.
        }\\{
            la4 la8 la la la
            la2.
        }
    >>

    %35
    sol
    sol4\f fa r
    fa8\p fa fa fa fa fa

    %38
    mib! mib mib mib mib mib
    <<{re\f re re re re re}\\{re re re re re re}>>\mbreak
    mib4 r r

    %41
    fa8\dolce fa fa fa fa fa
    fa fa fa fa fa fa
    sol sol sol sol sol sol

    %44
    do,4 r r
    mib!4\p \override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan mib8 mib mib mib\stopTrillSpan
    re[(mib fa mib)] re16. fa'32\f sol16. la32

    %47
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32\mbreak
    fa4 r r
    mib!4\p \override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan mib8 mib mib mib\stopTrillSpan

    %50
    re[(mib fa mib)] re16. fa'32\f sol16. la32
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32
    la16. la32 do16. la32 fa4 r

    %53
    re4\p(fa mib)
    re r r
    re4(fa mib)

    %56
    re r r
    r r r8 do'\<\mbreak
    fa, fa fa fa sib,\f sib'

    %59
    sib sol'16.\f(mib32) re8 re16.\f(sib32) do8 do16.\f(la32)
    sib16 sib32\tr la sib16-! do-! re8 r r4
    r r r8 do\<

    %62
    fa,8 fa fa fa sib,\f sib'
    sib sol'16.\f(mib32) re8 re16.\f(sib32) do8 do16.\f(la32)
    sib8 <re, sib> <re sib>4 r

}


IIvlan =\relative do' {

    sib4\p(re do)
    sib4. sib8(do re)
    <<{s8 fa fa fa fa fa}\\{do\f do do do do do}>>

    %4
    sib16. sib'32 \grace sib16 la16. sol32 \grace sol16 fa16.  sol32 \grace sol16 fa16. mib32 \grace mib16 re16. mib32\grace mib16 re16. do32
    sib4\p(re do)
    sib4. sib8(do re)

    %7
    <<{s8 fa fa fa fa fa}\\{do\f do do do do do}>>
    <fa sib,>\dolce fa fa fa fa fa
    mi\pp mi mi mi mi mi

    %10
    fa4 r8 sib,! sib sib
    la(sib) do do do do
    <<la2\\fa>> r4

    %13
    R2.
    fa'4(la sol)
    fa r r\mbreak

    %16
    R2.
    r4 r r8 sib\<
    la la fa\f fa la la

    %19
    sib sib,\f do do\f do do\f
    la fa' fa,4 r
    fa'4\p(la sol)

    %22
    fa do(sib)\mbreak
    la8 la la la la la
    sib16. sol'32\f\grace sol16 fa16. mib32 \grace mib16 re16. do32 \grace do16 sib16. la32 sol8 r

    %25
    sol'4\p(sib la)
    sol re do
    si8 si si si si si
    do16.\f la'32 \grace la16 sol16. fa32 \grace fa16 mi16. re32 \grace re16 do16. si32 la8 r

    %29
    la4\p \override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan la8 la la la\stopTrillSpan
    la4 r r\mbreak
    R2.

    %32
    <la' mi la,>4\f <<<la fa>\\re,>> r
    la4\p \override TrillSpanner.bound-details.left.text = #'()  _\startTrillSpan la8 la la la\stopTrillSpan
    la4 r r\mbreak

    %35
    R2.
    <la' mi la,>4\f <<<la fa>\\re,>> r
    R2.*2

    %39
    r8 sol\f sol sol sol sol\mbreak
    sol sol sol mib? \grace re16 do8 sib
    la!8\dolce la la la la la

    %42
    sib sib sib sib sib sib
    mib mib mib mib mi mi
    fa4 fa, r

    %45
    do'4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan do8 do do do\stopTrillSpan
    sib r r4 r16 fa'\f sol16. la32
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32\mbreak

    %48
    fa'4 r r
    do4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan do8 do do do\stopTrillSpan
    sib r r4 r16 fa'\f sol16. la32

    %51
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32
    la4 fa'8\p(mib! re do)
    sib4(re do)

    %54
    sib r r
    sib4(re do)
    sib4. sib8( la8 lab)

    %57
    sol r r4 r8 mib'\<\mbreak
    re8 re sib sib re\f re
    mib mib\f fa fa\f fa, fa\f

    %60
    sib r r16 sib'-!\dolce fa-! re-! sib8 r
    r4 r r8 mib\<
    re8 re sib sib re\f re

    %63
    mib mib\f fa fa\f fa, fa\f
    <<{sib[re] re4}\\{s8 sib sib4}>> r

}


IIvcIn =\relative do {

    R2.
    \clef tenor \key sib\major fa'4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan fa8 fa fa fa\stopTrillSpan
    <<{la,8\f la la la la la}\\{fa fa fa fa fa fa}>>

    %4
    sib,16. sib'32 \grace sib16 la16. sol32 \grace sol16 fa16.  sol32 \grace sol16 fa16. mib32 \grace mib16 re16. mib32\grace mib16 re16. do32
    sib4 r r
    fa''4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan fa8 fa fa fa\stopTrillSpan\mbreak

    %7
    <<{la,8\f la la la la la}\\{fa fa fa fa fa fa}>>
    \clef bass\key sib\major sib,\dolce sib' sib, sib sib sib
    sib\p sib sib sib sib sib

    %10
    la4 mi'2
    fa8 sib, do do do do
    fa,2 r4

    %13
    la'\dolce(do sib)
    la r r
    la(do sib)\mbreak

    %16
    la4 r r8 fa
    sib,4 r r8 sib'\<(
    la) la\! fa\f fa la la

    %19
    sib sib,\f do do\f do do\f
    fa, fa' fa,4 r
    R2.*2

    %23
    \clef tenor \key sib\major re''4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan re8 re re re\stopTrillSpan
    re16.\f sol,32\grace sol fa16. mib32 \clef bass\key sol\minor \grace mib16 re16. do32 \grace do16 sib16. la32 sol8 r
    R2.*2

    %27
    \clef tenor \key sib\major mi''4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan mi8 mi mi mi\stopTrillSpan
    mi?16.\f la,32 \grace la16 sol16. fa32 \clef bass\key sol\minor mi16. re32 \grace re16 do16. si32 la8 r
    \clef tenor \key sib\major dod'2.\p

    %30
    re\mbreak
    mi?4 \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan mi8 mi mi mi\stopTrillSpan
    dod4\f <re re,> r

    %33
    dod2.\p
    re
    mi?4 \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan mi8 mi mi mi\stopTrillSpan

    %36
    dod4\f <re re,> r
    re2.\p
    do!

    %39
    <<{si8\f si si si si si}	\\{sol sol sol sol sol sol}>>\mbreak
    do do do,4 r
    R2.*3

    %44
    fa'4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan fa8 fa fa fa\stopTrillSpan
    fa2.~
    fa2~fa16. fa,32\f sol16. la32

    %47
    \clef bass\key sol\minor sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32\mbreak
    \clef tenor \key sol\minor fa''4\p \override TrillSpanner.bound-details.left.text = #'()  ^\startTrillSpan fa8 fa fa fa\stopTrillSpan
    fa2.~

    %50
    fa2~fa16. fa,32\f sol16. la32
    \clef bass\key sol\minor sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32\mbreak
    la16. la32 do16. la32 fa4 r

    %53
    R2.
    re'4\p(fa mib)
    re r r

    %56
    sib sib' r8 sib,
    mib,4 r r8 mib'\<\mbreak
    re re sib sib re\f re

    %59
    mib mib\f fa fa\f fa, fa\f
    sib4 r r8 sib'\dolce
    mib, r r4 r8 mib\<

    %62
    re re sib sib re\f re
    mib mib\f fa fa\f fa, fa\f
    sib sib sib4 r

}


IIvcIIn =\relative do {

    R2.*2
    fa,8\f fa fa fa fa fa
    sib16. sib'32 \grace sib16 la16. sol32 \grace sol16 fa16.  sol32 \grace sol16 fa16. mib32 \grace mib16 re16. mib32\grace mib16 re16. do32

    %5
    sib4 r r
    R2.
    fa8\f fa fa fa fa fa

    %8
    sib2 r4
    sib\p sib sib
    la mi'2

    %11
    fa8 sib, do do do do
    fa,2 r4
    fa'4\dolce(la sol)

    %14
    fa r r
    fa(la sol)\mbreak
    fa~fa8 fa(sol la)

    %17
    sib4 r r8 sib\<(
    la) la\! fa\f fa la la
    sib sib,\f do do\f do do\f

    %20
    fa, fa' fa,4 r
    R2.
    fa'4(la sol)\mbreak

    %23
    fad8\p fad fad fad fad fad
    sol16.\f sol32\grace sol fa!16. mib!32 \grace mib16 re16. do32 \grace do16 sib16. la32 sol8 r
    R2.

    %26
    sol'4\p(sib la)
    sold8 sold sold sold sold sold
    la16.\f la32 \grace la16 sol!16. fa32 mi16. re32 \grace re16 do16. si32 la8 r

    %29
    la8\p la la la la la
    la la la la la la\mbreak
    la la la la la la

    %32
    la4\f re, r
    la'8\p la la la la la
    la la la la la la

    %35
    la la la la la la
    la4\f re, r
    re'8\p re re re re re

    %38
    do! do do do do do
    si\f si si si si si\mbreak
    do do' do,4 r

    %41
    r fa\dolce fa,
    sib r sib
    mib! mib (mi)

    %44
    fa fa, r
    R2.
    r4 r r16 fa'\f sol16. la32

    %47
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32\mbreak
    fa4 r r
    R2.

    %50
    r4 r r16 fa'\f sol16. la32
    sib16. fa32 sol16. la32 sib16. la32\grace la16 sol16. fa32 \grace fa16 mib16. re32 \grace re16 do16. sib32
    la16. la32 do16. la32 fa4 r

    %53
    R2.
    sib4\p(re do)
    sib r r

    %56
    sib4. sib8(do re)
    mib4 r r8 mib\<
    re re sib sib re\f re

    %59
    mib mib\f fa fa\f fa, fa\f
    sib4 r r8 sib'\dolce
    mib, r r4 r8 mib\<

    %62
    re re sib sib re\f re
    mib mib\f fa fa\f fa, fa\f
    sib sib sib4 r

}

forma = {

    \time 3/4
    \key sib\major
    \tempo 4 = 52
    s2.*20
    \bar ":..:"
    s2.*44
    \bar ":|."

}


IIfl = {
    \IIglobal
    <<\IIfln \forma>>
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


IIvcI = {
    \IIglobal
    \clef bass
    <<\IIvcIn \forma>>
}


IIvcII = {
    \IIglobal
    \clef bass
    <<\IIvcIIn \forma>>
}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto\senza
}

IIIfln =\relative do'' {

    sib'4\dolce sol8(lab sib do)
    \grace do8 sib4. lab8 sol4
    fa sol8(fa sib lab)

    %4
    lab2 sol4
    fa fa8. [fa16 sol8. la16]
    sib4.\tr la16 sol fa4

    %7
    \tuplet 3/2 { sol8 (la sib) } re,4 do\tr
    sib2.  sib
    fa'4 re8(mib fa sol)

    %10
    \grace sol8 fa4. mib8 re mib
    fa4 sol8[(fa sib8. lab?16)]
    lab2 sol4

    %13
    sol\f sol8. [sol16 lab8. sib16]
    sib8(re,) re4. mib8
    \grace re16 do8 sib16 lab sol4 fa\tr

    %16
    mib2 r4
    sib''2.\dolce~
    sib4 r r

    %19
    sib2.~
    sib4 r r
    R2.

    %22
    la8_\markup\italic {poco\dynamic f} la4 la la8
    la?4 r r\mbreak
    la8_\markup\italic "rinf" la4 la la8

    %25
    sib,2.\p
    sib'\f ~
    sib4 r r

    %28
    R2.
    sib4\dolce sib sib
    sib2._\markup\italic "rinf"~

    %31
    sib~\mbreak
    sib
    sib4\dolce sib sib

    %34
    sib2._\markup\italic "rinf"~
    sib~
    sib~

    %37
    sib~
    sib4 r r
    sib2.~\mbreak

    %40
    sib4 r r
    sib2.
    la

    %43
    lab!
    solb!4 r r
    R2.*2\mbreak

    %47
    sib8.\tr\f dob16 sib8 lab-! solb-! fa-!
    fa2 solb4
    R2.*2

    %51
    sib8.\tr\f dob16 sib8 lab-! solb-! fa-!
    mib2 r4

}

IIIvlIn =\relative do'' {

    sib4_\markup\italic "Sottovoce assai" sol8(lab sib do)
    \grace do8 sib4. lab8 sol4
    fa sol8(fa sib lab)

    %4
    lab2 (sol4
    fa) fa8. [fa16 sol8. la16]
    sib4.\tr la16 sol fa4

    %7
    \tuplet 3/2 { sol8 (la sib) } re,4 (do)
    sib2.  sib
    fa'4 re8(mib fa sol)

    %10
    \grace sol8 fa4. mib8 re mib
    fa4 sol8[(fa sib8. lab?16)]
    lab2 (sol4)

    %13
    <sol' sib, mib,>\f sol8. [sol16 lab8. sib16]
    sib8(re,) re4. mib8
    \grace re16 do8 sib16 lab sol4 fa\tr

    %16
    <mib sol,>2 r4
    sib'8\pp sib sib sib sib sib
    sib2.

    %19
    sib8 sib sib sib sib sib
    sib2.
    la8 la4 la la8

    %22
    la'2._\markup\italic {poco\dynamic f}
    la,8\dolce la4 la la8\mbreak
    la'2._\markup\italic "rinf"

    %25
    sib8\p sib,4 sib sib8~
    sib sib'4\f sib sib8
    sib solb(fa mib \grace mib16 reb8 do)

    %28
    sib fa sib,4 r
    sib'\p sib sib
    lab'?2._\markup\italic "rinf"

    %31
    solb!\mbreak
    fa
    sib,4\dolce sib sib

    %34
    lab'2._\markup\italic "rinf"
    solb
    fa

    %37
    mib8(sib) sib sib sib sib
    sib2.~
    sib8 sib sib sib sib sib\mbreak

    %40
    sib2.
    sib\dolce
    la

    %43
    lab!
    solb16 (lab sib do) sib8 sib sib\noBeam\tr r
    sib-! dob-!  sib-! dob-!  sib-! dob-!

    %46
    sib-! dob-!  sib-! dob-!  sib-! dob-!\mbreak
    sib8.\tr_\markup\italic "rinf" dob16 sib8 lab-! solb-! fa-!
    fa2 (solb4)

    %49
    sib8-!\p dob-!  sib-! dob-!  sib-! dob-!
    sib-! dob-!  sib-! dob-!  sib-! dob-!
    sib8.\tr_\markup\italic "rinf"dob16 sib8 lab-! solb-! fa-!

    %52
    mib2 r4

}


IIIvlIIn =\relative do'' {

    sol4_\markup\italic "Sottovoce assai" mib8(fa sol lab)
    \grace lab8 sol4. fa8 mib4
    re mib8(re sol fa)

    %4
    fa2 mib8. re16
    do2.
    fa4 sib sib~

    %7
    sib sib la
    sib2. sib
    re,4 sib8(do re mib)

    %10
    \grace mib8 re4. do8(sib do)
    re4 mib8[(re sol8. fa16)]
    fa2(mib4)

    %13
    <mib sol,>4\f <mib sol,>8. [mib16 fa8. sol16]
    lab8 <<{sib4 sib sib8}\\{lab4 lab sol8}>>
    \grace sib16 lab8 sol16 fa mib4 re

    %16
    <mib sol,>2 r4 \mbreak
    solb!16\pp(mib solb mib solb mib solb mib solb mib solb mib)
    sib8 sib sib sib sib sib

    %19
    solb'16(mib solb mib solb mib solb mib solb mib solb mib)
    sib8 sib sib sib sib sib
    solb'16(mib solb mib solb mib solb mib solb mib solb mib)

    %22
    fa_\markup\italic "rinf"(mib fa mib fa mib fa mib fa mib fa mib)
    solb\p(mib solb mib solb mib solb mib solb mib solb mib)\mbreak
    fa_\markup\italic "rinf"(mib fa mib fa mib fa mib fa mib fa mib)

    %25
    reb!\p (sib reb sib reb sib reb sib reb sib reb sib)
    reb'!\f (sib reb sib reb sib reb sib reb sib reb sib)
    reb8 mib \grace mib16 reb8 do \grace do16 sib8 la

    %28
    sib4 sib, r
    R2.
    fa'16\p(re fa re fa re fa re fa re fa re)

    %31
    solb!(mib solb mib solb mib solb mib solb mib solb mib)\mbreak
    lab(fa lab fa lab fa lab fa lab fa lab fa)
    solb(mib solb mib solb mib solb mib solb mib solb mib)

    %34
    fa(re fa re fa re fa re fa re fa re)
    solb(mib solb mib solb mib solb mib solb mib solb mib)
    lab(fa lab fa lab fa lab fa lab fa lab fa)

    %37
    solb(mib solb mib solb mib solb mib solb mib solb mib)
    sib8 sib sib sib sib sib
    solb'16(mib solb mib solb mib solb mib solb mib solb mib)\mbreak

    %40
    sib8 sib sib sib sib sib
    solb'16(mib solb mib solb mib solb mib solb mib solb mib)
    fa(mib fa mib fa mib fa mib fa mib fa mib)

    %43
    fa(re fa re fa re fa re fa re fa re)
    mib(fa solb lab) solb8 solb solb\tr\noBeam r
    solb16(mib lab mib solb mib lab mib solb mib lab mib)

    %46
    solb(mib lab mib solb mib lab mib solb mib lab mib)\mbreak
    solb8.\f\tr lab16 solb8[fa-! mib-! re-!]
    re?2(mib4)

    %49
    solb16\p(mib lab mib solb mib lab mib solb mib lab mib)
    solb(mib lab mib solb mib lab mib solb mib lab mib)
    solb8.\f\tr lab16 solb8[fa-! mib-! re-!]

    %52
    mib2 r4

}


IIIvlan =\relative do' {

    R2.
    mib4_\markup\italic "Sottovoce assai" mib mib
    sib2.

    %4
    sib'
    la4 sol8.[la16 sib8. do16]
    re4 fa, re

    %7
    mib(fa) fa,
    sib r r sib r r\mbreak
    R2.

    %10
    sib4 sib sib
    sib2.
    sib4 sib sib

    %13
    sib2\f mib4
    fa fa, sol
    lab? sib sib

    %16
    mib,2 r4
    R2.
    solb'16\pp(mib solb mib solb mib solb mib solb mib solb mib)

    %19
    sib8 r r4 r
    solb'16(mib solb mib solb mib solb mib solb mib solb mib)
    do2.

    %22
    do'8_\markup\italic "rinf" do4 do do8
    do,2.\mbreak
    do'8 do4 do do8

    %25
    sib\p(fa) fa fa fa fa
    fa\f fa fa fa fa fa
    fa mib fa4 fa,

    %28
    sib2 r4
    sib\p sib sib
    sib8 sib sib sib sib sib

    %31
    sib8 sib sib sib sib sib\mbreak
    sib8 sib sib sib sib sib
    sib4 sib sib

    %34
    sib8 sib sib sib sib sib
    sib8 sib sib sib sib sib
    sib8 sib sib sib sib sib

    %37
    sib r r4 r
    solb'!16(mib solb mib solb mib solb mib solb mib solb mib)
    sib8 r r4 r\mbreak

    %40
    solb'16(mib solb mib solb mib solb mib solb mib solb mib)
    mib,8 mib' mib mib mib mib
    do8 do do do do do

    %43
    re re re re re re
    sib4 r r
    mib, mib mib

    %46
    mib r r\mbreak
    mib'8.\f lab,16 sib4 sib
    mib,8 mib' mib\p mib mib mib

    %49
    mib,4 mib mib
    mib r r
    mib'8.\f lab,16 sib4 sib

    %52
    mib,2 r4

}


IIIvcIn =\relative do {

    mib4_\markup\italic "Sottovoce assai" mib mib
    mib2 mib,4
    sib' sib sib

    %4
    sib re mib
    mib mib mib
    re re re

    %7
    mib(fa) fa,
    sib sib'8 lab! sol fa sib,4 fa'8 mib re do
    sib4 sib sib

    %10
    sib2.
    sib4 sib sib
    sib re mib

    %13
    mib,\f mib' mib,
    fa fa' sol
    lab sib sib,

    %16
    mib,2 r4
    mib'8\p mib mib mib mib mib
    mib mib mib mib mib mib

    %19
    mib mib mib mib mib mib
    mib mib mib mib mib mib
    mib mib mib mib mib mib

    %22
    mib_\markup\italic "rinf" mib mib mib mib mib
    mib\p mib mib mib mib mib
    mib_\markup\italic "rinf" mib mib mib fa fa,

    %25
    sib4\p sib sib
    sib\f sib' sib
    sib8 mib, fa4 fa,

    %28
    sib2 r4
    sib\p sib sib\mbreak
    sib2.

    %31
    sib'
    re
    mib4 r r

    %34
    sib, sib sib
    sib'2.
    re

    %37
    mib8 mib, mib mib mib mib
    mib mib mib mib mib mib
    mib mib mib mib mib mib

    %40
    mib mib mib mib mib mib
    \clef tenor \key sib\minor
    mib'8 mib mib mib mib mib

    %43
    do do do do do do
    re re re re re re
    <<mib4\\sib>> mib, mib

    %46
    mib r r\mbreak
    R2.
    \clef bass \key sib\minor

    %49
    mib8.\f lab,16 sib4 sib
    mib,8 mib' mib\p mib mib mib
    mib4 r r

    %52
    R2.
    mib8.\f lab,16 sib4 sib
    mib,2 r4

}


IIIvcIIn =\relative do {

    mib4_\markup\italic "Sottovoce assai"  mib mib
    mib2 mib,4
    sib' sib sib

    %4
    sib re mib
    mib mib mib
    re re re

    %7
    mib(fa) fa,
    sib sib'8 lab! sol fa sib,4 fa'8 mib re do
    sib4 sib sib

    %10
    sib2.
    sib4 sib sib
    sib re mib

    %13
    mib,\f mib' mib,
    fa fa' sol
    lab sib sib,

    %16
    mib,2 r4
    mib'\p r r
    mib, mib' mib

    %19
    mib r r
    mib, mib' mib
    mib r r

    %22
    mib, _\markup\italic "rinf"mib' mib
    mib\p r r\mbreak
    r r fa,\f

    %25
    sib \p r r
    sib\f sib sib
    sib8 mib fa4 fa,

    %28
    sib2 r4
    R2.
    sib4\p sib sib

    %31
    sib8 sib sib sib sib sib\mbreak
    sib sib sib sib sib sib
    sib4 sib sib

    %34
    sib2.
    sib8 sib sib sib sib sib
    sib sib sib sib sib sib

    %37
    mib,4 r r
    mib mib' mib
    mib r r\mbreak

    %40
    mib, mib' mib
    mib r r
    R2.

    %43
    sib4 sib sib
    mib mib, mib
    mib r r

    %46
    R2.\mbreak
    mib'8.\f lab,16 sib4 sib
    mib,8 mib' mib\p mib mib mib

    %49
    mib4 r r
    R2.
    mib8.\f lab,16 sib4 sib

    %52
    mib,2 r4

}

forma = {

    \time 3/4
    \key mib\major
    \tempo 2 = 65
    \repeat volta 2{s2.*7}
    \alternative {{s2.}{s}}
    \bar ".|:"\set Score.currentBarNumber = #9
    s2.*8
    \bar ":..:"\break
    \once \override Score.RehearsalMark.extra-offset = #'(-5 . +1)
    \mark\markup\huge "Trio"
    \key sib\minor
    s2.*12
    \bar ":..:"
    s2.*24
    \bar ":|."
    \mark\markup\smaller\center-column {"D.C. il""Minuetto"}

}


IIIfl = {
    \IIIglobal
    <<\IIIfln \forma>>
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


IIIvcI = {
    \IIIglobal
    \clef bass
    <<\IIIvcIn \forma>>
}


IIIvcII = {
    \IIIglobal
    \clef bass
    <<\IIIvcIIn \forma>>
}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IVfln =\relative do'' {

    r4
    R2*5
    sib2\dolce~
    sib~

    %8
    sib4 sib'\f
    sol lab
    fa sol\mbreak

    %11
    mib fa
    re mib
    do re\tr

    %14
    mib8[fa sol lab]
    sol[fa mib re]
    mib4 r

    %17
    r8 sib'\p[(sib, sib')]
    r8 sib[(sib, sib')]
    r8 sib[(sib, sib')]

    %20
    r8 sib[(sib, sib')]\mbreak
    r8 sib[(sib, sib')]
    r8 sib[(sib, sib')]

    %23
    r8 sib[(sib, sib')]
    r8 sib[(sib, sib')]
    sol4\f la

    %26
    sib8 fa4 fa8
    fa2\p~
    fa

    %29
    sol4\f la
    sib8 fa4 fa8\p
    fa2~

    %32
    fa
    sol4\f la\mbreak
    sib fa

    %35
    sol la
    sib fa
    sol la

    %38
    sib8[la sib sol]
    fa[mib re do]
    re4 fa

    %41
    sol la
    sib fa
    sol la

    %44
    sib fa\mbreak
    sol la
    sib8[la sib sol]

    %47
    fa[mib re do]
    sib4 r
    R2*3

    %52
    r4 r8 do\f
    do8.\tr si32 do re8 mi
    fa[(do) do do]

    %55
    do8.\tr si32 do re8 mi
    fa[(sol) lab? do,]\mbreak
    do8.\tr si32 do re8 mi

    %58
    fa[(do) do do]
    do8.\tr si32 do re8 mi
    fa4 r

    %61
    R2*3
    r4 r8 sib,\f
    sib8.\tr la32 sib do8 re

    %66
    mib[(sib) sib sib]
    sib8.\tr la32 sib do8 re
    mib[(fa) sol sib,]

    %69
    sib8.\tr la32 sib do8 re\mbreak
    mib[(sib) sib sib]
    sib8.\tr la32 sib do8 re

    %72
    mib4 r
    R2*5
    sib2\p~

    %79
    sib~
    sib4 sib'\f
    sol lab

    %82
    fa sol\mbreak
    mib fa
    re mib

    %85
    do re
    mib8[fa sol lab]
    sol[fa mib re]

    %88
    mib4

}

IVvlIn =\relative do'' {

    sib'8 r
    sol r lab r
    fa r sol r
    mib8.\tr re32 mib fa8 fa

    %4
    re r mib r
    do r re r
    mib r fa r

    %7
    sol8.\tr fa32 sol lab8 sol
    fa sib, sib'16\f sib sib sib
    sol sol sol sol lab lab lab lab

    %10
    fa fa fa fa sol sol sol sol\mbreak
    mib mib mib mib fa fa fa fa
    re re re re mib mib mib mib

    %13
    do do do do re re re re
    mib mib fa fa sol sol lab lab
    sol sol fa fa mib mib re re

    %16
    mib8 sib sib'\p r
    sol r sib r
    fa r sib r

    %19
    mib, r sib' r
    re, sib sib' r\mbreak
    sol r sib r

    %22
    fa r sib r
    mib, r sib' r
    re, sib sib4\tr

    %25
    sol'16\f sol sol sol la la la la
    sib8 fa4 fa8\p~
    fa fa4 fa8~

    %28
    fa fa4 fa8
    sol16 \f sol sol sol la la la la
    sib8 fa4 fa8\p~

    %31
    fa fa4 fa8~
    fa fa4 fa8
    sol16 \f sol sol sol la la la la\mbreak

    %34
    sib sib sib sib fa fa fa fa
    sol sol sol sol la la la la
    sib sib sib sib fa fa fa fa

    %37
    sol sol sol sol la la la la
    sib sib la la sib sib sol sol
    fa fa mib mib re re do do

    %40
    sib sib sib sib fa' fa fa fa
    sol sol sol sol la la la la
    sib sib sib sib fa fa fa fa

    %43
    sol sol sol sol la la la la
    sib sib sib sib fa fa fa fa
    sol sol sol sol la la la la\mbreak

    %46
    sib sib la la sib sib sol sol
    fa fa mib mib re re do do
    sib4 sib'8\p r

    %49
    sol r lab! r
    mi r fa r
    sol sol sol8.\tr fa32 sol

    %52
    lab8-![fa-! do-!] do,\f
    do8.\tr si32 do re8 mi
    fa[(do) do do]

    %55
    do8. \tr si32 do re8 mi
    fa[(sol) lab do,]\mbreak
    do8. \tr si32 do re8 mi

    %58
    fa[(do) do do]
    do8.\tr si?32 do re8 mi
    fa4 lab'8-!\p r

    %61
    fa r sol r
    re r mib? r
    fa fa fa8.\tr mib32 fa

    %64
    sol8-![mib-! sib] sib,\f
    sib8.\tr  la32 sib do8 re
    mib![(sib) sib sib]

    %67
    sib8.\tr  la32 sib do8 re
    mib[(fa) sol sib,]
    sib8.\tr  la32 sib do8 re\mbreak

    %70
    mib[(sib) sib sib]
    sib8.\tr  la32 sib do8 re
    mib4 sib''8-!\p r

    %73
    sol-! r lab-! r
    fa-! r sol-! r
    mib8.\tr re32 mib fa8 fa

    %76
    re r mib r
    do r re r
    mib r fa r

    %79
    sol8.\tr fa32 sol lab8 sol
    fa sib, sib'16\f sib sib sib
    sol sol sol sol lab lab lab lab

    %82
    fa fa fa fa sol sol sol sol\mbreak
    mib mib mib mib fa fa fa fa
    re re re re mib mib mib mib

    %85
    do do do do re re re re
    mib mib fa fa sol sol lab lab
    sol sol fa fa mib mib re re

    %88
    <mib mib, sol,>4

}


IVvlIIn =\relative do'' {

    sib8 r
    sol r lab r
    fa r sol r
    mib8.\tr re32 mib fa8 fa

    %4
    re r mib r
    do r re r
    mib r fa r

    %7
    sol8.\tr fa32 sol lab8 sol
    fa sib,
    sib''16\f sib sib sib
    sol sol sol sol lab lab lab lab

    %10
    fa fa fa fa sol sol sol sol\mbreak
    mib mib mib mib fa fa fa fa
    re re re re mib mib mib mib

    %13
    do do do do re re re re
    mib mib mib mib mib mib mib mib
    sib sib lab lab sol sol fa fa

    %16
    sol4 r
    sib8\p sol sol4\tr
    sib8 fa fa4\tr

    %19
    sib8 mib, mib4\tr
    sib'8 re, re4\tr \mbreak
    sib'8 sol sol4\tr

    %22
    sib8 fa fa4\tr
    sib8 mib, mib4\tr
    sib'8 re,4 re8

    %25
    <mib sib>16\f   <mib sib>  <mib sib>  <mib sib>  <mib sib>  <mib sib>  <mib sib>  <mib sib>
    <re sib>8 fa fa16\p fa fa fa
    fa fa fa fa fa fa fa fa

    %28
    fa fa fa fa fa fa fa fa
    <mib sib>  <mib sib>  <mib sib>  <mib sib>  <mib sib>  <mib sib>  <mib sib> <mib sib>
    <re sib>8 fa fa16\p fa fa fa

    %31
    fa fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa
    <mib' mib,>\f <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,>\mbreak

    %34
    <re re,> <re re,> <re re,> <re re,> <re re,> <re re,> <re re,> <re re,>
    <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,>
    <re re,> <re re,> <re re,> <re re,> <re re,> <re re,> <re re,> <re re,>

    %37
    <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,>
    re re mib mib re re mib mib
    re re do do sib sib la la

    %40
    sib sib sib sib re re re re
    <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,>\mbreak
    <re re,> <re re,> <re re,> <re re,> <re re,> <re re,> <re re,> <re re,>

    %43
    <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,>
    <re re,> <re re,> <re re,> <re re,> <re re,> <re re,> <re re,> <re re,>
    <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,> <mib mib,>\mbreak

    %46
    re re mib mib re re mib mib
    re re do do sib sib la la
    sib4 r8 sib'\p

    %49
    r sol  r lab!
    r mi r fa
    do2~

    %52
    do4. do,8\f
    do8.\tr si32 do re8 mi
    fa[(do) do do]

    %55
    do8. \tr si32 do re8 mi
    fa[(sol) lab do,]\mbreak
    do8. \tr si32 do re8 mi

    %58
    fa[(do) do do]
    do8.\tr si?32 do re8 mi
    fa4 r8 lab'\p-!

    %61
    r fa r sol
    r re r mib
    sib2~

    %64
    sib4. sib,8\f
    sib8.\tr  la32 sib do8 re
    mib[(sib) sib sib]

    %67
    sib8.\tr  la32 sib do8 re
    mib[(fa) sol sib,]
    sib8.\tr  la32 sib do8 re\mbreak

    %70
    mib[(sib) sib sib]
    sib8.\tr  la32 sib do8 re
    mib4 sib'8\p r

    %73
    sol r lab r
    fa r sol r
    mib8.\tr re32 mib fa8 fa

    %76
    re r mib r
    do r re r
    mib r fa r

    %79
    sol8.\tr fa32 sol lab8 sol
    fa sib, sib''16\f sib sib sib
    sol sol sol sol lab lab lab lab

    %82
    fa fa fa fa sol sol sol sol\mbreak
    mib mib mib mib fa fa fa fa
    re re re re mib mib mib mib

    %85
    do do do do re re re re
    mib mib mib mib mib mib mib mib
    sib sib lab lab sol sol fa fa

    %88
    <mib sol,>4

}


IVvlan =\relative do' {

    r4
    R2*5
    sib2\p~
    sib~

    %8
    sib4 sib'16\f sib sib sib
    sib sib sib sib lab lab lab lab
    lab lab lab lab sol sol sol sol\mbreak

    %11
    sol sol sol sol fa fa fa fa
    fa fa fa fa mib mib mib mib
    mib mib mib mib lab lab lab lab

    %14
    sol8[lab sib do]
    sib4 sib,
    mib r

    %17
    R2
    sib2\p~
    sib~

    %20
    sib4 r\mbreak
    R2
    sib2~

    %23
    sib~
    sib4 r
    sib'16\f sib sib sib do do do do

    %26
    re4 sib,\p(
    la sib
    \grace re8 do4 sib)

    %29
    sib'16\f sib sib sib do do do do
    re4 sib,\p(
    la sib

    %32
    \grace re8 do4 sib)
    sib'16\f sib sib sib do do do do\mbreak
    re8 sib sib16 sib sib sib

    %35
    sib sib sib sib do do do do
    re8 sib sib16 sib sib sib
    sib sib sib sib do do do do

    %38
    re8[do sib mib,]
    fa[fa fa, fa]
    sib16 sib sib sib sib' sib sib sib

    %41
    sib sib sib sib do do do do
    re8 sib sib16 sib sib sib
    sib sib sib sib do do do do

    %44
    re8 sib sib16 sib sib sib
    sib sib sib sib do do do do\mbreak
    re8[do sib mib,]

    %47
    fa[fa fa, fa]
    sib4 sib'8 sol
    mi4\p(fa

    %50
    sol lab)
    sib2
    lab4. do,8\f

    %53
    do8.\tr si32 do re8 mi
    fa[(do) do do]

    %55
    do8. \tr si32 do re8 mi
    fa[(sol) lab do,]\mbreak
    do8. \tr si32 do re8 mi

    %58
    fa[(do) do do]
    do8.\tr si?32 do re8 mi
    fa4\tr lab8-!\p fa-!

    %61
    re4(mib
    fa sol)
    lab2

    %64
    sol4 r8 sib,\f
    sib8. \tr la32 sib do8 re
    mib[(sib) sib sib]

    %67
    sib8.\tr la32 sib do8 re
    mib[(fa) sol sib,]
    sib8.\tr la32 sib do8 re\mbreak

    %70
    mib[(sib) sib sib]
    sib8.\tr la32 sib do8 re
    mib4 r

    %73
    R2*5
    sib2\p~
    sib~

    %80
    sib4 sib'16\f sib sib sib
    sib sib sib sib lab lab lab lab
    lab lab lab lab sol sol sol sol\mbreak

    %83
    sol sol sol sol fa fa fa fa
    fa fa fa fa mib mib mib mib
    mib mib mib mib lab lab lab lab

    %86
    sol8[lab sib do]
    sib[sib sib, sib]
    <mib sol,>4

}


IVvcIn =\relative do {

    r4
    \clef tenor \key mib\major mib'\p do
    re sib
    do lab

    %4
    sib sol
    lab fa
    sol re'

    %7
    mib8.\tr re32 mib fa8 mib
    re4 <<re\\<re sib> >>
    mib <<mib\\do>>

    %10
    re <<re\\sib>>\mbreak
    do <<do\\lab>>
    sib <<sib\\sol>>

    %13
    lab <<fa'\\lab,>>
    sol8[lab sib do]
    \clef bass\key mib\major sib4 sib,

    %16
    mib, r
    \clef tenor \key mib\major mib''2\p
    re

    %19
    do
    sib\mbreak
    mib

    %22
    re
    do
    <<
        {
            s2
            mib8[mib mib mib]
        }\\{
            sib2~
            sib8\f[sib sib sib]
        }
    >>

    %26
    sib4 re\p(
    do) re(
    \grace fa8 mib4) re\f

    %29
    <<
        {
            mib8[mib mib mib]
        }\\{
            sib[sib sib sib]
        }
    >>
    <<re4\\sib>> re\p(
    do) re

    %32
    \grace fa8 mib4 re
    <<
        {
            mib8\f[mib mib mib]
        }\\{
            sib[sib sib sib]
        }
    >>\mbreak
    <<
        {
            re8[re re re]

            %35
            mib[mib mib mib]
            re[re re re]
            mib[mib mib mib]

            %38
            re8
        }\\{
            sib[sib sib sib]
            sib[sib sib sib]
            sib[sib sib sib]
            sib[sib sib sib]
            sib4.
        }
    >> mib,8
    fa[fa fa fa]
    <<
        {
            s4 re'8[re]

            %41
            mib[mib mib mib]
            re[re re re]
            mib[mib mib mib]

            %44
            re[re re re]
            mib[mib mib mib]\mbreak
            re
        }\\{
            sib[sib sib sib]
            sib[sib sib sib]
            sib[sib sib sib]
            sib[sib sib sib]
            sib[sib sib sib]
            sib[sib sib sib]
            sib4.
        }
    >> mib,8

    %47
    fa[fa fa fa]
    sib,4 r
    R2*2

    %51
    mi'2\p(
    fa4) \clef bass\key mib\major  r8 do,\f
    do8.\tr si32 do re8 mi

    %54
    fa[(do) do do]
    do8.\tr si32 do re8 mi
    fa[(sol) lab do,]\mbreak

    %57
    do8.\tr si32 do re8 mi
    fa[(do) do do]
    do8.\tr si32 do re8 mi

    %60
    fa4 r
    R2*2
    re'2\p

    %64
    mib?4 r8 sib,\f
    sib8. \tr la32 sib do8 re
    mib[(sib) sib sib]

    %67
    sib8.\tr la32 sib do8 re
    mib[(fa) sol sib,]
    sib8.\tr la32 sib do8 re\mbreak

    %70
    mib[(sib) sib sib]
    sib8.\tr la32 sib do8 re
    mib4 r

    %73
    \clef tenor\key mib\major mib'\p do
    re sib
    do lab

    %76
    sib sol
    lab fa
    sol re'

    %79
    mib8.\tr re32 mib fa8 mib
    re4 <<re\f\\sib >>
    mib <<mib\\do>>\mbreak

    %82
    re4 <<re\f\\sib >>
    do <<do\\lab>>
    sib <<sib\\sol>>

    %85
    lab <<fa'	\\lab,>>
    \clef bass\key mib\major sol8[lab sib do]
    sib[sib sib, sib]

    %88
    <mib sol, mib>4

}


IVvcIIn =\relative do {

    r4
    R2*5
    r4 sib-!
    mib-! mib,-!

    %8
    sib' sib8\f sib
    mib[mib do do]
    re[re sib sib]\mbreak

    %11
    do[do lab lab]
    sib[sib sol sol]
    lab[lab fa fa]

    %14
    sol[lab sib do]
    sib4 sib
    mib, r

    %17
    R2*8
    sib'8\f[sib sib sib]
    sib4 r

    %27
    R2*2
    sib8[sib sib sib]
    sib4 r

    %31
    R2*2
    sib8[sib sib sib]\mbreak
    sib8[sib sib sib]

    %35
    sib8[sib sib sib]
    sib8[sib sib sib]
    sib8[sib sib sib]

    %38
    sib4. mib8
    fa[fa fa, fa]
    sib8\ff[sib sib sib]

    %41
    sib8[sib sib sib]
    sib8[sib sib sib]
    sib8[sib sib sib]

    %44
    sib8[sib sib sib]
    sib8[sib sib sib]\mbreak
    sib4. mib8

    %47
    fa[fa fa, fa]
    sib4 r
    R2*2

    %51
    do'4\p do,
    fa r8 do\f
    do8.\tr si32 do re8 mi

    %54
    fa[(do) do do]
    do8.\tr si32 do re8 mi
    fa[(sol) lab do,]\mbreak

    %57
    do8.\tr si32 do re8 mi
    fa[(do) do do]
    do8.\tr si32 do re8 mi

    %60
    fa4 r
    R2*2
    sib4\p sib,

    %64
    mib r8 sib\f
    sib8. \tr la32 sib do8 re
    mib[(sib) sib sib]

    %67
    sib8.\tr la32 sib do8 re
    mib[(fa) sol sib,]
    sib8.\tr la32 sib do8 re\mbreak

    %70
    mib[(sib) sib sib]
    sib8.\tr la32 sib do8 re
    mib4 r

    %73
    R2*5
    r4 sib
    mib mib,

    %80
    sib' sib8\f sib
    mib[mib do do]
    re[re sib sib]\mbreak

    %83
    do[do lab lab]
    sib[sib sol sol]
    lab[lab fa fa]

    %86
    sol[lab sib do]
    sib[sib sib sib]
    mib,4

}

forma = {

    \time 2/4
    \key mib\major
    \tempo 2 = 65
    \partial 4 s4
    s2*15
    s4
    \bar ":..:"
    s
    s2*71
    s4
    \bar ":|."

}


IVfl = {
    \IVglobal
    <<\IVfln \forma>>
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


IVvcI = {
    \IVglobal
    \clef bass
    <<\IVvcIn \forma>>
}


IVvcII = {
    \IVglobal
    \clef bass
    <<\IVvcIIn \forma>>
}
#(set-global-staff-size 15.7)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller{Divertimento IV in Mib maggiore}
        composer = \markup \center-column{"L. Boccherini (1743 -1805)"}
    }

    \markup\huge { [1.] Allegretto e con moto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \Ifl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [2.] Adagio non tanto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [3.] Minuetto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [4.] Presto assai}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IVfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IVvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IVvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

}

