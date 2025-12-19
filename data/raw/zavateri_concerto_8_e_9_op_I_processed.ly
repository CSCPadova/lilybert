\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

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

arco = _\markup \italic \center-align"con l'arco"

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

quarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

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
mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IvlIn = \relative do'' {

    mib,4 sol8.\tr(fa32 mib) sib'8 sib sib sib
    mib4 fa\tr  sol32(fa mib8.) r4
    mib,4\p sol8.\tr(fa32 mib) sib'8 sib sib sib

    %4
    mib4 fa\tr  sol32(fa) mib8.  r8 sol16\f-. lab-.
    sib8 \once\stemUp sol, sol32(lab sib8.) lab16(sol fa4) fa'16-. sol-.
    lab8 \once\stemUp fa, fa32(sol lab8.)\mbreak sol16(fa mib4) mib'16 fa

    %7
    sol8 \once\stemUp mib, mib32(fa sol8.) fa32(sol lab8.) lab32(sib do8.)
    \grace do8 sib4\tr r8 mib fa\tr mib r mib\p
    fa\tr mib r mib\f fa\tr mib r \tuplet 3/2 { mib16(fa sol) }

    %10
    lab8 lab lab lab lab4.\tr sol16(fa)
    \grace lab8 sol fa16 mib \grace sol8 fa mib16 (re) \grace fa8 mib re16(do) \grace do8 sib lab'\mbreak
    sol4 fa\tr mib r8 mib16 _\markup { \italic più \dynamic f} re

    %13
    do sib lab sol do sib lab sol re'4 mib
    sol16-. lab-. \tuplet 3/2 { sib[(lab sol)]} fa-. sol-. \tuplet 3/2 { lab[(sol fa)] } mib4\staccatissimo sib\staccatissimo
    mib, r4 mib'16\solo fa sol lab sib8 do

    %16
    re, \grace re mib4 mib8 sib16(re) fa(sol) lab(fa) sib,(lab')
    \grace sib8 lab16 fa \grace fa8 sol4 sib,8\noBeam \tuplet 3/2 {do16(sib lab) do[(re mib)]} \grace mib8 re8. do16\mbreak
    \tuplet 3/2 { re16(do sib) re[(mib fa)] } \grace fa8 mib8. re16 \tuplet 3/2 { mib(re do) mib[(fa sol)] } \grace sol8 fa8. mib16

    %19
    \tuplet 3/2 { fa(mib re) fa[(sol lab)] } \grace lab8 sol8. fa16 sol[(fa)] mib4 reb8
    do mi4 fa8 lab16(sol fa4) mib8
    re? fad4 sol8 sib16(la sol4) fa8

    %22
    \tuplet 3/2 { mib16( re do) } fa[sol] lab8 lab\mbreak lab do16(sib lab sol fa mib)
    re8 fa16(mib re do sib lab sol) sol'(fa mib) re8 do
    sib4 \grace re8 do4\tr sib r

    %25
    sib,\tu re8.\tr (do32 sib) fa'8 fa fa fa
    sib4 do\tr re32 (do sib8.) r4
    sib,\p re8.\tr do32 sib fa'8 fa fa fa

    %28
    sib4 do\tr \mbreak re32 (do sib8. )r8 re16\f mib
    \once\stemDown fa8  re, re32(mib fa8.) mib16[(re] do4) do'16 re
    \once\stemDown mib8  do, do32(re mib8.) re16(do sib4) sib'16 do

    %31
    \once\stemDown re8\once\stemUp sib, sib32(do re8.) do32(re mib8.) mib32(fa sol8.)
    \grace sol8 fa4\tr r8 sib do\tr sib r sib
    do\tr\p sib r sib\f do\tr sib r \tuplet 3/2 { sib16(do re) }\mbreak

    %34
    mib8 mib mib mib mib4.\tr re16(do)
    \grace mib8 re do16(sib) \grace re8 do sib16(la) \grace do8 sib la16(sol) fa8\noBeam \tuplet 3/2 { mib'16(re do) }
    re4 do\tr sib r8 sib16\f la

    %37
    sol fa mib re sol fa mib re la'8 r sib r
    re16-.[mib-.] \tuplet 3/2 { fa(mib re) } do-.[re-.] \tuplet 3/2 { mib(re do) } sib8 r fa r
    sib,4 r\mbreak sib''4.\solo \tuplet 3/2 { lab!16(sib do) }

    %40
    \grace do8 sib4. lab8 \grace lab sol[\grace sol fa] \grace fa mib \grace mib re
    \grace re8 mib4. \tuplet 3/2 { sol16(fa mib)} mib'8 re16 do sib8 lab
    sol fa r16 sib do sib \once\stemUp sol, sib' lab sol lab lab sib lab

    %43
    \once\stemUp fa, lab' sol fa sol sol lab sol  \once\stemUp mib, sol' fa mib fa fa sol fa
    \once\stemUp re, fa' mib re mib mib re do\mbreak re(la) sib4 sib8
    \tuplet 3/2 { do16-. do-. re-. mib-.[re-. do-.] } lab' sol fa mib \tuplet 3/2 { re-. re-. mib-. fa-.[mib-. re-.] } sib' lab sol fa

    %46
    sol fa mib4 do' mib do8
    \grace sib la sib4 sib reb sib8
    sol lab!4 sib,8 do re4 mib8~

    %49
    mib fa4 sol lab \tuplet 3/2 { sol16(fa mib) }
    re8 do sib8 sol'16\tu\f lab\mbreak sib8 sib, sib sib
    lab16(sol fa4) la'16\p sib \once\stemDown do8 la, la la

    %52
    sib16(la sol4) re'8\f sol\staccatissimo fad\tr sol\staccatissimo fad\staccatissimo
    sol16 sol, sib re sol8\staccatissimo lab\staccatissimo sib\staccatissimo la\tr sib\staccatissimo la\staccatissimo
    sib16 sib, re fa sib8 si do\staccatissimo si\tr do\staccatissimo si\staccatissimo

    %55
    do do, r la' \tuplet 3/2 { fad16(mi re) } sol8\noBeam \once\stemUp re,\once\stemDown fad'\mbreak %% fine pagina
    sol16\solo(sib la sol) la8 fad\tr  sol16(sib la sol) la8 fad\tr
    sol re4 mib8 re fad16 sol la8 do,

    %58
    sib16 la sol4 r8 sib'16 re(do sib) do8 la
    sib16 re(do sib) do8 la sib fa?4 sol8
    fa la16(sib) do8 mib, re16(do sib4) fa'8\mbreak

    %61
    re,16(sib' fa') fa fa-. sib,-. sib sib-. re,(sib' lab'!) lab lab-. sib,-. sib-. sib-.
    mib,(sib' sol') sol sol-. sib,-. sib-. sib-. mib,(sib' sib') sib sib-. sib,-. sib-. sib-.
    mi,(do' sol') sol sol-. do,-. do-. do-. mi,(do' sib') sib sib-. do,-. do-. do-.

    %64
    fa,(do' lab') lab lab-. do,-. do-. do-. fa,(do' do') do do-. do,-. do-. do-.
    fad,!(re' la'?) la la-. re,-. re-. re-. fad,(re' do') do do-. re,-. re-. re-.

    %66
    sol,(re' sib') sib sib-. re,-. re-. re-. sol,(re' re') re re-. re,-. re-. re-.\mbreak
    sold,(mi' si') si si-. mi,-. mi-. mi-. sold,(mi' re') re re-. mi,-. mi-. mi-.
    la,(mi' do') do do-. mi,-. mi-. mi-. la,(mi' mi'?) mi mi-. mi,-. mi-. mi-.

    %69
    sold,(mi' si') si sold,(mi' re') re sold,,(mi' re') re sold,,(mi' re') re
    la,?(mi'? do') do la,(mi' mi') mi la,,(mi' do') do la,(mi' mi') mi
    fad,,(re' la') la fad,(re' do') do fad,,(re' la') la fad,(re' do') do

    %72
    sol,?(re' sib') sib sol,(re' re') re sol,,(re' sib') sib sol,(re' re') re\mbreak
    mi,,(do' sol') sol mi,(do' sib') sib mi,,(do' sol') sol mi,(do' sib') sib
    fa,?(do' la') la fa,(do' do') do fa,,(do' la') la fa,(do' do') do

    %75
    re,,(sib' fa') fa re,(sib' lab'!) lab re,,(sib' fa') fa re,(sib' lab') lab
    mib,(sib' sol') sol  mib,(sib' sib') sib mib,,(sib' sol') sol  mib,(sib' sib') sib
    re,,(sib' fa') fa re,(sib' lab') lab re,,(sib' fa') fa re,(sib' lab') lab

    %78
    mib,(re' sol) sol mib,(re' sib') sib mib,,(re' sol) sol mib,(re' sib') sib
    lab32(sib) do8. sib4 lab\tr sol\tr\mbreak
    fa16(sol lab) sol fa8 mib\tr re do' sib16 lab sol fa

    %81
    mib8._\markup\italic "a suo modo" sib16 \grace sol'8 fa4\tr mib r8 mib\tu
    fa\tr mib r mib\p fa mib r \tuplet 3/2 { mib16\f(fa sol) }
    lab8 lab lab[lab] lab4.\tr sol16(fa)

    %84
    \grace lab8 sol fa16(mib) \grace sol8 fa mib16(re) \grace fa8 mib re16(do) \grace do8 sib lab'
    sol4 fa\tr\mbreak mib r8 mib16\f re
    do sib lab sol do sib lab sol re'4 mib

    %87
    sol16-.[lab-.] \tuplet 3/2 { sib(lab sol) } fa16-.[sol-.] \tuplet 3/2 { lab(sol fa) } mib4 sib
    mib,2

}

IvlIIn = \relative do'' {

    mib,16 mib' re do sib lab sol fa mib sol fa mib re do sib lab
    sol4 re''\tr \tuplet 3/2 { mib16(sib sol) } mib8\noBeam r4
    mib16\p mib' re do sib lab sol fa mib sol fa mib re do sib lab

    %4
    sol4 re''\tr \tuplet 3/2 { mib16(sib sol) } \grace fa8 mib\noBeam r mib'16-.\f fa-.
    sol8 \once\stemUp mib, mib32(fa sol8.) fa16(sol lab4) re16-. mib-.
    fa8\once\stemUp re, re32(mib fa8.)\mbreak mib16(fa sol4) sol'16 lab

    %7
    sib8\once\stemUp sol, sol32(lab sib8.) lab32(sol fa8.) fa32(sol lab8.)
    \grace lab8 sol4\tr r r16 mib'-. sol-. lab-. \tuplet 3/2 { sib(lab sol) } mib8\noBeam
    r16 mib-.\p sol-. lab-. \tuplet 3/2 { sib(lab sol) } mib8\noBeam r16 mib-.\f sol-. lab-. \tuplet 3/2 { sib(lab sol) } mib8\noBeam

    %10
    r16 do re mib fa8 fa fa4.\tr mib16(re)
    \grace fa8 mib lab,16 sol \grace sib8 lab sol16 (fa) sol4 mib'~
    mib re\tr mib r8 mib16_\markup { \italic più \dynamic f} re\mbreak

    %13
    do sib lab sol do sib lab sol re'4 mib
    mib16-.[fa-.] \tuplet 3/2 { sol(fa mib) } re-.[mib-.] \tuplet 3/2 { fa(mib re) } mib4\staccatissimo sib\staccatissimo
    mib, r mib8.\p fa16 sol8 lab

    %16
    sib mib, sol mib re8.[do16 re8 sib]
    mib8.[fa16 sol8 mib] lab4 r8 fa
    sib r sol r do r lab r

    %19
    re, r sib r mib r sol r
    lab4 r fa8 fa la la
    sib4 r sol8 sol si si

    %22
    do r fa, r\mbreak re r do r
    sib? r lab r mib'4 r8 mib
    fa4 fa sib, r

    %25
    sib16\f sib' la sol fa mib re do sib re' do sib la sol fa mib
    re4 la' \tr\tuplet 3/2 { sib16(fa re)} sib8\noBeam r4
    sib16\p sib' la sol fa mib re do sib re' do sib la sol fa mib

    %28
    re4 la'\tr \tuplet 3/2 { sib16(fa re)} sib8\noBeam r sib'16\f do
    \once\stemDown re8 sib, sib32(do re8.) do16(re mib4) la16 sib
    \once\stemDown do8 la, la32(sib do8.) sib16(do re4) re'16 mib

    %31
    \once\stemDown fa8 re, re32(mib fa8.) mib32(re do8.) do32(re mib8.)
    \grace mib8 re4 r r16 sib'-. re-. mib-. \tuplet 3/2 { fa(mib re) } \grace do8 sib\noBeam
    r16 sib-.\p re-. mib-. \tuplet 3/2 { fa(mib re) } \grace do8 sib\noBeam  r16 sib-.\f re-. mib-. \tuplet 3/2 { fa(mib re) } \grace do8 sib\noBeam

    %34
    r \tuplet 3/2 { sol16(la sib) } do8 do\mbreak do4. \tr sib16(la)
    sib8 sol la fa sol mib fa sib
    sib4 la sib r8 sib16\f la

    %37
    sol16 fa mib re sol fa mib re la'8 r sib r
    sib16-.[do-.] \tuplet 3/2 { re(do sib) } la-.[sib-.] \tuplet 3/2 { do(sib la) } sib8 r fa r
    sib,4 r r2

    %40
    R1*10
    r4 r8 mib'16\f fa sol8 sol, sol sol
    do, do' r do'16\p sib \once\stemDown la8 fad, fad fad

    %52
    sol sol, r la'\f sib16(sol la) re-. sib(sol la) re-.
    sib8 sol r do re16(sib do) fa-. re(sib do) fa-.
    re8 re, r re' mib16(do re) sol-. mib(do re) sol-.

    %55
    mib8 sol, do4~do8 sib la4
    <sol' sib, re, sol,> r8 re,\p re4 r8 re
    re4 r8 do' la r la r

    %58
    sib4 r fa r8 fa
    fa4 r8 fa fa4 r\mbreak
    do8 r do r re4 r

    %61
    re1_\markup {\italic sostenuto e \dynamic pp}(
    mib)
    mi

    %64
    fa
    fad
    sol

    %67
    sold
    la?
    si

    %70
    do
    la
    sib!

    %73
    do~
    do
    re

    %76
    mib
    re
    mib

    %79
    do4 r r2
    R1\mbreak
    r2 r16 mib-.\f sol-. lab-. \tuplet 3/2 { sib(lab sol) } mib8\noBeam

    %82
    r16 mib-. sol-. lab-. \tuplet 3/2 { sib(lab sol) } mib8\noBeam r16 mib-.\p sol-. lab-. \tuplet 3/2 { sib(lab sol) } mib8\noBeam
    r16 do\f re mib fa8 fa fa4.\tr mib16(re)
    \grace fa8 mib lab,16 (sol) \grace sib8 lab sol16 (fa) sol4 mib'~

    %85
    mib re\tr mib r8 mib16\f re\mbreak
    do sib lab sol do sib lab sol re'4 mib
    mib16-.[fa-.] \tuplet 3/2 { sol(fa mib) } re-.[mib-.] \tuplet 3/2 { fa(mib re) } mib4 sib

    %88
    mib,2

}

IvlIIIn = \relative do'' {

    mib,4 sol8.\tr(fa32 mib) sib'8 sib sib sib
    mib4 fa\tr  sol32(fa mib8.) r4
    mib,4\p sol8.\tr(fa32 mib) sib'8 sib sib sib

    %4
    mib4 fa\tr  sol32(fa) mib8.  r8 sol16\f-. lab-.
    sib8 \once\stemUp sol, sol32(lab sib8.) lab16(sol fa4) fa'16-. sol-.
    lab8 \once\stemUp fa, fa32(sol lab8.)\mbreak sol16(fa mib4) mib'16 fa

    %7
    sol8 \once\stemUp mib, mib32(fa sol8.) fa32(sol lab8.) lab32(sib do8.)
    \grace do8 sib4\tr r8 mib fa\tr mib r mib\p
    fa\tr mib r mib\f fa\tr mib r \tuplet 3/2 { mib16(fa sol) }

    %10
    lab8 lab lab lab lab4.\tr sol16(fa)
    \grace lab8 sol fa16 mib \grace sol8 fa mib16 (re) \grace fa8 mib re16(do) \grace do8 sib lab'\mbreak
    sol4 fa\tr mib r8 mib16 _\markup { \italic più \dynamic f} re

    %13
    do sib lab sol do sib lab sol re'4 mib
    sol16-. lab-. \tuplet 3/2 { sib[(lab sol)]} fa-. sol-. \tuplet 3/2 { lab[(sol fa)] } mib4\staccatissimo sib\staccatissimo
    mib, r mib8.\p fa16 sol8 lab

    %16
    sib mib, sol mib re8.[do16 re8 sib]
    mib8.[fa16 sol8 mib] lab4 r8 fa
    sib r sol r do r lab r

    %19
    re, r sib r mib r sol r
    lab4 r fa8 fa la la
    sib4 r sol8 sol si si

    %22
    do r fa, r\mbreak re r do r
    sib? r lab r mib'4 r8 mib
    fa4 fa sib, r

    %25
    sib\f re8. \tr(do32 sib) fa'8 fa fa fa
    sib4 do\tr re32 (do sib8.) r4
    sib,\p re8.\tr do32 sib fa'8 fa fa fa

    %28
    sib4 do\tr \mbreak re32 (do sib8.) r8 re16\f mib
    \once\stemDown fa8  re, re32(mib fa8.) mib16[(re] do4) do'16 re
    \once\stemDown mib8  do, do32(re mib8.) re16(do sib4) sib'16 do

    %31
    \once\stemDown re8\once\stemUp sib, sib32(do re8.) do32(re mib8.) mib32(fa sol8.)
    \grace sol8 fa4\tr r8 sib do\tr sib r sib
    do\tr\p sib r sib\f do\tr sib r \tuplet 3/2 { sib16(do re) }\mbreak

    %34
    mib8 mib mib mib mib4.\tr re16(do)
    \grace mib8 re do16(sib) \grace re8 do sib16(la) \grace do8 sib la16(sol) fa8\noBeam \tuplet 3/2 { mib'16(re do) }
    re4 do\tr sib r8 sib16\f la

    %37
    sol fa mib re sol fa mib re la'8 r sib r
    re16-.[mib-.] \tuplet 3/2 { fa(mib re) } do-.[re-.] \tuplet 3/2 { mib(re do) } sib8 r fa r
    sib,4 r r2

    %40
    R1*10
    r4 r8 sol''16\f lab\mbreak sib8 sib, sib sib
    lab16(sol fa4) la'16\p sib \once\stemDown do8 la, la la

    %52
    sib16(la sol4) re'8\f sol\staccatissimo fad\tr sol\staccatissimo fad\staccatissimo
    sol16 sol, sib re sol8\staccatissimo lab\staccatissimo sib\staccatissimo la\tr sib\staccatissimo la\staccatissimo
    sib16 sib, re fa sib8 si do\staccatissimo si\tr do\staccatissimo si\staccatissimo

    %55
    do do, r la' \tuplet 3/2 { fad16(mi re) } sol8\noBeam \once\stemUp re,\once\stemDown fad'
    <sol sib, re, sol,>4 r8 la,\p sib4 r8 la
    sib4 r8 sol fad r re r

    %58
    sol4 r re' r8 do
    re4 r8 do re4 r8 sib
    la r fa r sib4 r

    %61
    fa1_\markup {\italic sostenuto e \dynamic pp}
    sol
    sol

    %64
    lab!
    la
    sib\mbreak

    %67
    si
    do
    mi~

    %70
    mi
    re~
    re

    %73
    mi
    fa~
    fa

    %76
    sol
    fa
    sol

    %79
    fa4 r r2
    R1
    r2 r4 r8 mib?\f

    %82
    fa\tr mib r mib\p fa mib r \tuplet 3/2 { mib16\f(fa sol) }
    lab8 lab lab[lab] lab4.\tr sol16(fa)
    \grace lab8 sol fa16(mib) \grace sol8 fa mib16(re) \grace fa8 mib re16(do) \grace do8 sib lab'

    %85
    sol4 fa\tr\mbreak mib r8 mib16\f re
    do sib lab sol do sib lab sol re'4 mib
    sol16-.[lab-.] \tuplet 3/2 { sib(lab sol) } fa16-.[sol-.] \tuplet 3/2 { lab(sol fa) } mib4 sib

    %88
    mib,2

}

Ivlan = \relative do' {

    sib4 mib8.\tr fa16 sol4 mib
    sib8 sib sib sib sib4 r
    sib4\p mib8. fa16 sol4 mib

    %4
    sib8 sib sib sib sib4 r
    r8 do do do do4 r
    r8 sib sib sib sib4  r

    %7
    r8 do do do do4 re\mbreak
    mib8 <sib' sol> <sib sol> <sib sol> r <sib sol> <sib sol> <sib sol>
    r <sib sol>\p <sib sol> <sib sol> r <sib sol>\f <sib sol> <sib sol>

    %10
    r do, do do re4 r
    sib r8 sib sib lab sol do
    sib4 sib' sol r8 mib'16_\markup { \italic più \dynamic f} re

    %13
    do sib lab sol do sib lab sol re'4 mib
    r2 r4 sib
    mib, r r2\mbreak

    %16
    R1*9
    fa4\f sib8. do16 re4 sib
    fa4. fa8 fa re r4

    %27
    fa4\p sib8. do16 re4 sib
    fa4. fa8 fa re r4
    r8 sol,\f sol sol sol4 r

    %30
    r8 fa' fa fa fa4 r
    r8 sol sol sol sol4 la
    sib8 <re, sib> <re sib> <re sib>\mbreak r8 <sib' fa> <sib fa> <sib fa>

    %33
    r <re, sib>\p <re sib> <re sib> r <re sib>\f <re sib> <re sib>
    r8 sol sol sol la4 r
    fa fa sol8 sol fa sol

    %36
    fa4 fa re r8 sib'16\f la
    sol fa mib re sol fa mib re la'8 r sib r
    r2 sib8 r fa r

    %39
    sib,4 r r2\mbreak
    R1*10
    r2 r8 mi\f mi mi

    %51
    r fa la la fad\p re re re
    re sib16 do re8\f re re re re re
    re4 r8 fa fa fa fa fa

    %54
    fa fa, r sol' sol sol sol sol
    sol mib sol mib la, sib16 do re8 re
    sol,4 r r2\mbreak

    %57
    R1*4
    sib1_\markup {\italic sostenuto e \dynamic pp}~
    sib

    %63
    do~
    do
    re~

    %66
    re
    mi~
    mi?~

    %69
    mi?~
    mi?
    fad

    %72
    sol~
    sol
    fa?\mbreak

    %75
    sib,~
    sib~
    sib~

    %78
    sib
    do4 r r2
    R1

    %81
    r2 r8 <sib' sol>\f <sib sol> <sib sol>
    r <sib sol> <sib sol> <sib sol> r <sib sol>\p <sib sol> <sib sol>
    r do,\f do do re4 r

    %64
    sib r8 sib sib lab sol do
    sib4 sib' sol r8 mib'16\f re
    do sib lab sol do sib lab sol re'4 mib

    %87
    r2 mib4 sib
    mib,2

}

Ibcn = \relative do {

    mib'4 mib, r16 mib' re do sib lab sol fa
    mib8 mib' sib sib, mib4 r
    mib\p mib, r16 mib'' re do sib lab sol fa

    %4
    mib8 mib sib sib mib4 r
    r8 do^\f do do fa4 r
    r8 sib, sib sib mib4 r

    %7
    r8 do do do fa4 sib,\mbreak
    mib8 mib' mib mib, r mib' mib mib,
    r mib'\p mib mib,  r mib'\f mib mib,

    %10
    fa mib re do sib do re sib
    mib4 r8 sib mib fa sol lab
    sib4 sib, mib r8\clef tenor\key mib\major mib'16\f re

    %13
    do sib lab sol do sib lab sol re'4 mib
    r2 r4 \clef bass\key mib\major sib
    mib, r r2\mbreak

    %16
    R1*9
    sib'4\f sib, r16 sib' la sol fa mib re do
    sib4 fa sib r

    %27
    sib'\p sib, r16 sib' la sol fa mib re do
    sib4 fa sib r
    r8 sol^\f sol sol do4 r

    %30
    r8 fa, fa fa sib4 r
    r8 sol sol sol do4 fa
    sib,8 sib' sib sib,\mbreak  r sib' sib sib,

    %33
    r sib'\p sib sib, r sib'\f sib sib,
    do' sib la sol fa sol la fa
    sib mib la, re sol, do re, mib

    %36
    fa4 fa, sib r8 sib'16 la
    sol fa mib re sol fa mib re la'8 r sib r
    r2 sib8 r fa r\mbreak

    %39
    sib,8._\markup {\italic senza Organo e \dynamic p}[do16 re8 sib] mib4 r8 fa
    re do re sib mib4 r8 sib
    mib4 r8 fa sol lab? sib sib,

    %42
    mib sib r re mib r fa r
    re r mib r do r re r
    sib r fa' r sib r sol r\mbreak

    %45
    lab r fa r sib r re, r
    mib4 r mib8 r do r
    fa r re r mib4 r

    %48
    mib8 r fa sol lab! r sib r
    do r re r mib r lab, r
    sib8 sib16(lab) sol8 mib r8 mi\f\tu mi mi\mbreak

    %51
    fa fa mib! mib re^\p re re re
    sol, sol'16 la sib8 fad sol re sol,[re']
    sol sol, r fa'! sib fa sib,[fa']

    %54
    sib sib, r sol' do sol do, sol'
    do mib do do,re sol, re'[re,]
    sol4_\markup {\italic senza Organo e dynamic p} r8 re' sol sol, r re'\mbreak

    %57
    sol sol, sib do re r fad r
    sol sol, sol' la sib4 r8 fa?
    sib sib, r fa' sib sib, re[mib]

    %60
    fa r la, r sib sib sib sib
    sib1_\markup {\italic sostenuto e \dynamic pp}
    mib

    %63
    do
    fa
    re

    %66
    sol
    mi\mbreak
    la

    %69
    sold2 mi
    la1
    fad2 re

    %72
    sol1
    mi2 do
    fa?1

    %75
    re2 sib
    mib1
    re2 sib

    %78
    mib1
    fa4(sol fa mib)
    re8(mib re do) sib lab'! sol fa

    %81
    sol mib lab, sib\fermata\mbreak mib\f\tu mib' mib mib,
    r mib' mib mib, r mib'\p mib mib,
    fa\f mib re do sib do re sib

    %84
    mib4 r8 sib mib fa sol lab
    sib4 sib, mib r8\clef tenor\key mib\major mib'16\f re
    do sib lab sol do sib lab sol re'4 mib

    %87
    r2 \clef bass\key mib\major mib4 sib
    mib,2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    s8 <7-> s4 s2
    s8 <7-> s4 s2
    s8 <7-> s4 <7 5>2
    s1*2
    s2 <7 5->
    s1
    <6 4>4 <5 3> s2
    s1*13
    s4 <_!> s2  %%% bar 26 OOKK
    s1
    s4 <_!> s2
    s8 <7> s4 s2
    s8 <7 5!> s4 s2
    s8 <7> s4 s <7 5!>
    s1*2
    s2 <7- 5>
    s1
    <6 4>4 <3!> s2
    s1*4
    s2 <6>4 <7>
    s1*9
    <_->4 <6 4!> <7 _+> s
    s1*2
    s4 s8 <_!> s2
    s4 s8 <6> <7 _+>4 <5 4>8 <3+>
    s1*7
    <_!>1
    s
    <_+>
    s
    <_+>
    s1*6
    <_!>1
    s1*8
    s2 <7- 5>
    s1
    <6 4>4 <3> s2

}

forma = {

    \time 4/4
    \key mib\major
    \tempo 2 = 55
    s1*87
    s2
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

IvlIII = {
    \global
    <<\IvlIIIn \forma>>

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIvlIn = \relative do'' {

    fa8\solo re16. do32 sib8 sol' sol4\tr fa
    mib8 do16. sib32 la8 mib' mib4\tr re
    sol8 mi!16. re32 do8 sib' sib4. la16. sol32

    %4
    la16. mi32 fa16. sol32 fa8 sol\tr fa2
    fa8 re16. do32 si8 re fa,16(si) re(lab') sol8.\tr fa16\mbreak
    mib8. re16 do4 mib8 do16. sib32 la8 do

    %7
    mib,16(la) do(sol') fa8. mib16 re8. do16 sib4
    reb8 reb reb8.\tr do32(sib) mi!8 mi \grace fa mi8.\tr\senza \tuplet 3/2 { re?32(mi fa)  }
    mib8. re16 do32(sib la sol fa mib? re) sol' fa8 mib re do

    %10
    re16[(sib)] \con \tuplet 3/2 { sol'(fa mib?) } sib8 \grace re do sib2

}

IIvlIIn = \relative do'' {

    re,8_\markup{\dynamic p \italic sempre} re re mib mib mib re re
    mib mib fa fa fa fa fa fa
    do do do do mi! mi mi mi

    %4
    do fa fa mi fa2
    la8 la re, re re re re re
    mib mib mib mib mib mib mib mib

    %7
    do do do do re re re re
    fa fa fa fa sol sol sol sol
    mib mib mib mib la la fa fa

    %10
    fa sol fa fa \grace mib?8 re2

}

IIvlIIIn = \relative do'' {

    fa,8_\markup{\dynamic p \italic sempre} fa fa sol sol sol fa fa
    la la do do do do sib sib
    sol sol sol sol sol sol sol sol

    %4
    fa do' do do \grace sib8 la2
    do8 re re si sol sol sol sol
    sol sol sol sol sol sol la la

    %7
    la la fa fa fa fa fa fa
    sib sib sib sib sib sib sib sib
    do do do do do do sib la

    %10
    sib sib sib la sib2

}

IIvlan = \relative do' {

    sib8_\markup{\dynamic p \italic sempre} sib sib sib sib sib sib sib
    do do fa fa sib, sib sib sib
    mi! mi mi mi do do do do
    fa fa do do do2
    fa8 fa sol sol si, si si si\mbreak
    do do do do do do do do
    la la la la sib sib sib sib
    sib sib sib sib sol sol sol sol
    la la la la la la la la
    sib mib fa fa, fa2



}

IIbcn = \relative do {

    sib8_\markup {\dynamic p \italic Senza \italic Organo} sib sib sib sib sib sib sib
    do do fa fa sib, sib sib sib
    mi! mi mi mi do do do do

    %4
    fa fa do'[do,] fa2
    fa8 fa sol sol si, si si si\mbreak
    do do do do do do do do

    %7
    la! la la la sib? sib sib sib
    sib sib sib sib sol sol sol  sol
    la la la[la] la la la fa

    %10
    sib mib fa[fa,] sib2



}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 37
    s1*4
    \bar ":..:"
    s1*6
    \bar":|."

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

IIvlIII = {
    \global
    <<\IIvlIIIn \forma>>

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
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \quarto \con

}

IIIvlIn = \relative do'' {

    mib1
    fa
    sol8 fa mib re do sib lab sol

    %4
    lab2 sib
    sol8 mib' re mib mib, fa sol la
    sib4 fa' sib2~

    %7
    sib la
    sib8 la sol fa mib re do sib\mbreak
    \grace re8 do1\tr

    %10
    sib2. lab!4
    sol mib mib'2~
    mib re\tr

    %13
    mib r4 mib
    do2 sib4 lab
    sol sib mib, r

    %16
    sib''1
    do
    re8 do sib la sol fa mib re\mbreak

    %19
    mib2 fa
    re8 sib' la? sib sib, sib do re
    mib4 sib mib2~

    %22
    mib re\tr
    mib8 re do sib lab? sol fa mib
    fa1\tr

    %25
    mib2 do
    re4 sib r2
    mib'1\mbreak

    %28
    fa8 mib re do sib lab sol fa
    sol' fa mib re do sib lab sol
    lab'!1

    %31
    sol4 sib, mib2~
    mib re\tr
    mib4 sol\dolce(lab sib)

    %34
    r fa,(sol lab)
    sol fa8\f(mib) fa2\tr \mbreak
    mib_\fermata^\markup\italic \center-align"[Fine]" r

    %37
    mib'\solo \grace {lab8[sib]} do2
    \grace do8 sib2. lab8 sol
    fa4 mib \grace sol8 fa4 mib8 re

    %40
    mib4 sib mib, sol'
    \grace sol8 fa2. lab4
    \grace lab8 sol2. sib4

    %43
    \grace sib8 lab2. do4
    \grace do8 sib4 lab8(sol) fa4 mib
    \grace mib8 re2\mbreak r8 sib\staccatissimo do\staccatissimo sib\staccatissimo

    %46
    re(sib) mib(sib) fa'(sib,) sol'(sib,)
    \grace sol' fa2 r8 sib, do sib
    mib(sib) fa'(sib,) sol'(sib,) lab'(sib,)

    %49
    \grace lab' sol2 r8 sib, do sib
    fa'(sib,) sol'(sib,) lab'(sib,) sib'(sib,)
    \grace sib' lab2. sol4

    %52
    \grace sol8 fa2. mib4\mbreak
    re8(do sib2) mib4\dolce
    re8(do sib2) sol'4\f

    %55
    fa8(mib re2) sol4
    fa8(mib re2) sib'4
    mi,2 fa
    mib!2. re8 do

    %59
    \grace mib re4 do8(sib) \grace re do2
    sib r
    sib'1\tu \f

    %62
    do\mbreak
    re8 do sib la sol fa mib re
    mib2 fa

    %65
    re8 sib' la sib sib, sib do re
    mib4 sib mib2~
    mib re

    %68
    mib8 re do sib lab? sol fa mib
    fa1\tr
    mib2 do\mbreak

    %71
    fa'8 mib re do sib la sol fa
    mib' re do sib do2\tr
    sib sib'~

    %74
    sib la
    sib2. lab!4
    sol8(fa mib4) r2

    %77
    r8 sib' lab sib sib, sib do re
    mib re do sib la sol fa mib\mbreak
    re(do sib4) do2\tr

    %80
    sib4 re'\dolce(mib fa)
    r do(re mib)
    re8(do sib4) do2\tr

    %83
    sib4\f fa sib,2
    sib'\solo \grace {mib16[fa]} sol2
    \grace sol8 fa2. mib8(re)

    %86
    do4 sib \grace re8 do4 sib8(la)\mbreak
    sib4 fa sib,2
    do' \grace {fa16[sol]} lab!2

    %89
    \grace lab8 sol2. fa8(mib)
    re4 do \grace mib8 re4 do8(si)
    do sol' mib, sol' mib, sol' mib, sol'

    %92
    fa, lab' fa, lab' fa, lab' fa, lab'
    re,, fa' re, fa' re, fa' re, fa'
    sol, sib' sol, sib' sol, sib' sol, sib'

    %95
    re,, fa' re, fa' re, fa' re, fa'
    do, mib' do, mib' do, mib' do, mib'\mbreak
    \tuplet 3/2 {
        re8 sol,(la si[la sol)] \once \stemUp sol, si' do re[(do si])

        %98
        \once \stemUp sol, re'' mib fa[(mib re)] \once \stemUp sol,, fa'' sol lab![(sol fa)]
        \once \stemUp sol,, si'' do re[(do si)] \once \stemUp  sol,, re'' mib fa[(mib re)]
    }
    \tupletSpan 2\tuplet 6/4 { mib(sol fa mib re do) } \grace mib re2

    %101
    do do'\tu~
    do si\mbreak
    do,8 sib lab sol fa mib  re do

    %104
    re1\tr
    do2 r
    sol''1

    %107
    la
    sib8 la sol fa mib re do sib
    do2 re

    %110
    sol,8 sol' fad sol sol, fa' mib re
    mib4 sol do2~\parenthesize \f \mbreak
    do si

    %113
    do8 sib? lab sol fa mib re do
    re1
    do2 r

    %116
    r8 sol' fad sol \once\stemUp sol, sib' la sol
    fad1
    fa!_\markup {\italic mez[z]o \dynamic p}

    %119
    mi
    mib!\p
    re\mbreak

    %122
    do2 do'\f~
    do4 re8 do sib4 la
    sib la8 sol la2\tr

    %125
    sol4 sol, re sib
    sol2 r
    mib''8\solo [fa] \tuplet 3/2 { sol(fa mib) } sib'4 do

    %128
    \grace mib,8 re2. mib4
    fa8 sib, re fa \grace {lab?16[sib]} do4. sib16(lab)
    sol8(fa mib2) sol4\mbreak

    %131
    re,8_\markup\italic "Ond[eggi]ante" sib' fa' sib, re, sib' fa' sib,
    re, sib' fa' sib, re, sib' fa' sib,
    <<
        {
            lab'8 lab lab lab lab lab lab lab

            %134
            fa fa fa fa fa fa fa fa
        }\\{
            sib, sib sib sib sib sib sib sib
            sib sib sib sib sib sib sib sib
        }
    >>
    mib, sib' sol' sib, mib, sib' sol' sib,
    mib, sib' sol' sib, mib, sib' sol' sib,
    <<
        {
            %137
            sib' sib sib sib sib sib sib sib
            sol sol sol sol sol sol sol sol
        }\\{
            sib, sib sib sib sib sib sib sib
            sib sib sib sib sib sib sib sib
        }
    >>\mbreak
    re,8 sib' fa' sib, re, sib' fa' sib,

    %140
    re, sib' fa' sib, re, sib' fa' sib,
    <<
        {
            lab'8 lab lab lab lab lab lab lab
            fa fa fa fa fa fa fa fa
        }\\{
            sib, sib sib sib sib sib sib sib
            sib sib sib sib sib sib sib sib
        }
    >>

    %143
    mib, sib' sol' sib, mib, sib' sol' sib,
    mib, sib' sol' sib, mib, sib' sol' sib,
    <<
        {
            sib' sib sib sib sib sib sib sib

            %146
            sol sol sol sol sol sol sol sol
        }\\{
            sib, sib sib sib sib sib sib sib
            sib sib sib sib sib sib sib sib
        }
    >>\mbreak
    sol sib mi sib sol sib mi sib
    sol sib mi sib sol sib mi sib
    <<
        {

            %149
            sol' sol sol sol sol sol sol sol
            mi mi mi mi mi mi mi mi
        }\\{
            sib sib sib sib sib sib sib sib
            sib sib sib sib sib sib sib sib
        }
    >>
    lab! do fa do lab do fa do

    %152
    lab do fa do lab do fa do
    <<{lab' lab lab lab lab lab lab lab}\\{sib, sib sib sib sib sib sib sib}>>
    \grace lab'8 sol2 r4 mib

    %155
    \quarto\tuplet 3/2 { fa8(mib re) } mib4\mbreak \tuplet 3/2 { lab8(sol fa) } sol4
    \tuplet 3/2 { fa8(mib re) } mib4 r sib
    mib8 re do sib do sib lab sol

    %158
    lab sol fa mib lab sol fa mib
    sib2 fa''\tr

}

IIIvlIIn = \relative do'' {

    R1*5
    sib'1
    do
    re8 do sib la sol fa mib re
    mib2 fa
    re8 sib' la sib sib, sib do re
    mib re do sib lab! sol fa mib
    lab'1
    sol4 sib, mib2~
    mib re
    mib4 fa sol2
    fa4 fa sib2~
    sib la\mbreak
    sib8 la? sol fa mib re do sib
    do1\tr
    sib2 r
    mib1\f
    fa\tr
    sol8 fa mib re do sib lab? sol
    lab2 sib
    sol8 mib' re mib mib, fa sol la
    sib4 sib, sib'2~
    sib la
    r fa'~
    fa mib~
    mib re
    mib r4 mib
    fa1\tr
    mib4 mib\dolce(fa sol)
    r re, (mib fa)\mbreak
    mib4 mib\f mib re\tr
    mib2\fermata r
    R1*4
    r4 re\p re2\tr
    r4 mib mib2\tr
    r4 fa fa2\tr
    R1
    r4 re' re2
    R1
    r4 re, re2
    R1
    r4 sol sol2
    R1
    r4 re re2
    r4 re fa do
    re2 r
    r r4 sib
    sib2 r4 sib\mbreak
    sib2 r
    R1*9
    mib'1\f fa
    sol8 fa mib re do sib lab sol
    lab2 sib
    sol8 mib' re mib mib, fa sol la
    sib4 fa' sib2~
    sib la\tr
    sib8 la sol fa mib re do sib
    do1\tr
    sib2 r
    r8 mib re mib mib, fa sol la
    sib2 fa'\mbreak
    sol4 sol, r la
    sib4 sib,2 la4
    sib sib'\dolce(do re)
    r la(sib do)
    sib sib2 la4\f
    sib fa sib,2
    R1*3
    sib'4\p fa sib,2
    R1*3
    r2 do
    fa r
    r sib,
    mib r
    r sol,
    do r
    sol'4\pp r si r\mbreak
    re4 r fa r
    re r si r
    mib, r r2
    do'1\f
    re\tr
    mib8 re do sib lab? sol fa mib
    fa2 sol
    mib8 do' si do do, do' si lab
    sib?4 re sol2~
    sol fad\tr
    sol8 fa! mib re  do sib la sol
    la1
    sol4 la si sol\mbreak
    sol'8 fa mib re do sib? lab? sol
    fa' mib re do re2\tr
    do do'~
    do si
    do8 do, si do do, do' sib! la
    sib4 re~re8 re do sib
    la1
    re_\markup {\italic mez[z]o \dynamic p}
    sol,
    do\p
    fa,
    la
    la'4 sib8 la sol4 fad\mbreak
    sol sol sol fad
    sol sol, re sib
    sol2 r
    r4 mib'\p sol lab!
    sib sol fa mib
    re2 sib
    mib r
    R1*2
    sib4\p(do) re(do)
    sib(do) re(sib)
    mib2 r
    R1
    mib4(fa) sol(fa)\mbreak
    mib(fa) sol(mib)
    sib2 r
    R1
    sib4(do) re(do)
    sib(do) re(sib)
    mib2 r
    R1
    mib4(fa) sol(mib)
    reb reb reb reb
    do2 r
    R1
    do4(re) mi(re)
    do(re) mi(do)
    fa2 r\mbreak
    R1
    fa8_\markup {\italic mezzo \dynamic f}  fa fa fa fa fa fa fa
    mib!2 r
    R1*5

}

IIIvlIIIn = \relative do'' {

    mib1
    fa
    sol8 fa mib re do sib lab sol

    %4
    lab2 sib
    sol8 mib' re mib mib, fa sol la
    sib4 fa' sib2~

    %7
    sib la
    sib8 la sol fa mib re do sib\mbreak
    \grace re8 do1\tr

    %10
    sib2. lab!4
    sol mib mib'2~
    mib re\tr

    %13
    mib r4 mib
    do2 sib4 lab
    sol sib mib, r

    %16
    sib''1
    do
    re8 do sib la sol fa mib re\mbreak

    %19
    mib2 fa
    re8 sib' la? sib sib, sib do re
    mib4 sib mib2~

    %22
    mib re\tr
    mib8 re do sib lab? sol fa mib
    fa1\tr

    %25
    mib2 do
    re4 sib r2
    mib'1\mbreak

    %28
    fa8 mib re do sib lab sol fa
    sol' fa mib re do sib lab sol
    lab'!1

    %31
    sol4 sib, mib2~
    mib re\tr
    mib4 sol\dolce(lab sib)

    %34
    r fa,(sol lab)
    sol fa8\f(mib) fa2\tr \mbreak
    mib\fermata r

    %37
    R1*4
    r4 fa\pp fa2\tr
    r4 sol sol2\tr
    r4 lab lab2\tr
    R1\mbreak
    r4 fa'\p fa2
    sib,4(do) re(mib)
    \grace mib8 re2 r
    r4 re(mib fa)
    \grace fa8 mib2 r
    re4(mib fa sol)
    \grace sol8 fa2. mib4
    \grace mib8 re2. do4
    sib fa sib,2
    r r4 mib
    re2 r4 mib
    re2 r
    R1*4
    sib''1 \f

    %62
    do\mbreak
    re8 do sib la sol fa mib re
    mib2 fa

    %65
    re8 sib' la sib sib, sib do re
    mib4 sib mib2~
    mib re

    %68
    mib8 re do sib lab? sol fa mib
    fa1\tr
    mib2 do\mbreak

    %71
    fa'8 mib re do sib la sol fa
    mib' re do sib do2\tr
    sib sib'~

    %74
    sib la
    sib2. lab!4
    sol8(fa mib4) r2

    %77
    r8 sib' lab sib sib, sib do re
    mib re do sib la sol fa mib\mbreak
    re(do sib4) do2\tr

    %80
    sib4 re'\dolce(mib fa)
    r do(re mib)
    re8(do sib4) do2\tr

    %83
    sib4\f fa sib,2
    R1*3
    sib'4\p fa sib,2
    R1*3
    r2 sol'
    lab! r
    r re,
    mib r
    r re
    mib r
    si'4\pp r re r\mbreak
    fa4 r lab! r
    fa r re r
    sol, r r2
    r do'\f ~
    do si
    do,8 sib lab sol fa mib  re do

    %104
    re1\tr
    do2 r
    sol''1

    %107
    la
    sib8 la sol fa mib re do sib
    do2 re

    %110
    sol,8 sol' fad sol sol, fa' mib re
    mib4 sol do2~\parenthesize \f \mbreak
    do si

    %113
    do8 sib? lab sol fa mib re do
    re1
    do2 r

    %116
    r8 sol' fad sol \once\stemUp sol, sib' la sol
    fad1
    fa!_\markup {\italic mez[z]o \dynamic p}

    %119
    mi
    mib!\p
    re\mbreak

    %122
    do2 do'\f~
    do4 re8 do sib4 la
    sib la8 sol la2\tr

    %125
    sol4 sol, re sib
    sol2 r
    r4 mib'\p sol lab!

    %128
    sib sol fa mib\mbreak
    re2 sib
    mib r

    %131
    R1*2
    re4\p(mib) fa(mib)
    re(mib) fa(re)

    %135
    mib2 r
    R1
    sol4(lab) sib(lab)

    %138
    sol(lab) sib(sol)
    fa2 r
    R1

    %141
    re4(mib) fa(mib)
    re(mib) fa(re)
    mib2 r

    %144
    R1
    sol4(lab) sib(sol)
    r sol sol sol

    %147
    sol2 r
    R1\mbreak
    mi4(fa) sol(fa)

    %150
    mi4(fa) sol(mi)
    fa2 r
    R1

    %153
    lab8_\markup {\italic mezzo \dynamic f} lab lab lab lab lab lab lab
    sol2 r
    R1*5

}

IIIvlan = \relative do' {

    r2 mib~
    mib re\tr
    mib mib8 re do sib

    %4
    fa'1\tr
    mib
    re4 do sib fa'

    %7
    sol mib fa2~
    fa sib
    sol la

    %10
    fa r
    R1*2\mbreak
    mib1

    %14
    fa\tr
    sol4 fa mib2
    re2. re4

    %17
    sol2 fa4 mib
    re2 sib'
    sol la

    %20
    fa fa
    sol2. sol4
    do,2 sib~

    %23
    sib mib
    do sib
    sib r

    %26
    fa'8 mib re do\mbreak sib la sol fa
    do'1\tr
    sib2 r

    %29
    sib do~
    do fa
    sib8 lab! sol fa mib re do sib

    %32
    do2 sib4 lab
    sol2 r
    mib'\p r

    %35
    r4 sib\f do sib
    sib2\fermata  r
    R1*4

    %41
    r4 sib\p sib2\mbreak
    r4 sib sib2
    r4 do do2

    %44
    R1
    r4 sib sib2
    R1

    %47
    r4 fa' fa2
    R1
    r4 sib, sib2

    %50
    R1
    r4 sib sib2
    r4 sib re la

    %53
    sib2 r
    R1*7
    r2 sib'\f~

    %62
    sib la\tr
    sib8 la sol fa\mbreak mib re do sib
    do1\tr

    %65
    sib2 re
    sol, sol'
    do, sib~

    %68
    sib mib
    do sib
    sib do

    %71
    re r
    mib1\f
    fa2 sol~

    %74
    sol fa
    fa8 re' do re re, re mib fa
    sol2. mib4\mbreak

    %77
    re2. do4
    sib2 do
    re4 fa, sol fa

    %80
    fa2\dolce r
    fa'2 r
    r4 fa sol do,

    %83
    re\f  fa sib,2
    R1*3
    sib'4\p fa sib,2

    %88
    R1*9
    sol4\pp r sol r
    sol r si r

    %99
    si r\mbreak sol r
    do r r2
    mib4\f re mib sol

    %102
    lab2 sol
    sol r
    lab re,

    %105
    mib fad
    sol4 lab sib re,
    mib2 re~

    %108
    re sol
    mib re
    re4 do si sol

    %111
    do2 r\mbreak
    fa1
    sol2 lab!~

    %114
    lab sol~
    sol fad
    sol re4 mib

    %117
    la,2 r8 re do re
    si4 sol r8 si la si
    do2 r8 do sib! do

    %120
    la4 fa r8 la sol la
    sib2 r4 fa'
    fad2 r4 fad

    %123
    la2\mbreak re,
    re4 re mib la,
    sib sol' re sib

    %126
    sol2 r
    R1*6
    sib4\pp(do) re(do)

    %134
    sib(do) re(sib)
    mib2 r
    R1

    %137
    mib4(fa) sol(fa)
    mib(fa) sol(mib)
    sib2 r

    %140
    R1
    sib4(do) re(do)
    sib(do) re(sib)\mbreak

    %143
    mib2 r
    R1
    mib4(fa) sol(mib)

    %146
    reb reb reb reb
    do2 r
    R1

    %149
    do4(re) mi(re)
    do(re) mi(do)
    fa2 r

    %152
    R1
    re8\parenthesize \f  re re re re re re re
    sib2 r

    %155
    R1*5

}

IIIbcn = \relative do {

    mib4 fa sol mib
    lab fa sib sib,
    mib2 mib'~

    %4
    mib re~
    re do
    sib4 la sol re

    %7
    mib do fa fa,
    sib2 sib'~
    sib la

    %10
    sib r
    mib,1
    fa

    %13
    sol8 fa mib re do sib lab? sol
    lab2 sib
    mib8 mib' re mib mib, fa sol la\mbreak

    %16
    sib4 la sol re
    mib do fa fa,
    sib2 sib'~

    %19
    sib la
    sib2. lab!4
    sol fa sol mib

    %22
    lab fa sib sib,
    mib2 mib~
    mib re

    %25
    mib r
    sib1
    do

    %28
    re
    mib
    fa

    %31
    sol8 fa mib re do sib lab sol\mbreak
    lab2 sib
    mib r

    %34
    sib\p r
    r4 sol lab sib
    mib,2\fermata r

    %37
    mib'_\markup {\dynamic p \italic Senza \italic Organo} lab
    sol mib
    r4 sol lab sib

    %40
    mib,2 r
    sib4\p r r2
    sib4 r r2

    %43
    sib4 r r2
    sol2 lab
    sib4 r r2

    %46
    R1
    r4 sib sib2
    R1\mbreak

    %49
    r4 mib mib2
    R1
    r4 sib sib2

    %52
    r4 sib re la
    sib2 r
    r4 sib' sib,2

    %55
    r4 sib' sib,2
    r sib'~
    sib la

    %58
    sol4 do la fa
    sib re, mib fa
    sib,2 r

    %61
    sib'4\tu\f la sol re
    mib do fa fa,\mbreak
    sib2 sib'~

    %64
    sib la
    sib2. lab!4
    sol fa sol mib

    %67
    lab fa sib sib,
    mib2 mib~
    mib re

    %70
    mib r
    sib'1\f
    do

    %73
    re8 do sib la sol fa mib re
    mib2 fa
    re8 sib' lab! sib sib, sib do re

    %76
    mib2 do
    sib2. lab4
    sol2 do

    %79
    sib4 re mib fa
    sib,2\dolce r\mbreak
    fa' r

    %82
    r4 re mib fa
    sib,2\f r
    sib _\markup {\dynamic p \italic Senza \italic Organo} mib

    %85
    re sib
    r4 re mib fa
    sib,2 r

    %88
    do fa
    mib do
    r4 mib fa sol

    %91
    do,2 r
    r fa
    sib, r

    %94
    r mib
    si r
    r fad'

    %97
    sol4\pp r sol, r
    sol r sol r
    sol r sol r

    %100
    do mib fa sol
    do\tu sib lab! mib
    fa re sol sol,

    %103
    do2 do'~\mbreak
    do si
    do lab

    %106
    sol4 fa mib sib
    do la re re,
    sol2 sol'~

    %109
    sol fad
    sol r
    do1\f

    %112
    re
    mib8 re do sib lab! sol fa mib
    fa2 sol

    %115
    mib la,
    sol4 la sib do
    re8 re' do re re,4_\markup {\italic mez[z]o \dynamic p} re'

    %118
    r8 si la si si,4 si'
    r8 do si do do,4 do'\mbreak
    r8 la sol la la,4 la'

    %121
    r8 si la? si si,?4 si'
    r8 la sol la la,4 la'\f
    fad2 re

    %124
    sol4 sib, do re
    sol, sol' re sib
    sol2 r

    %127
    R1*4
    sib4_\markup {\dynamic pp \italic Senza \italic Organo} do re do
    sib do re do

    %133
    sib2 r
    R1
    mib4 fa sol fa

    %136
    mib fa sol fa
    mib2 r
    R1

    %139
    sib4 do re do
    sib do re do
    sib2 r

    %142
    R1\mbreak
    mib4 fa sol fa
    mib fa sol fa

    %145
    mib2 r
    R1
    do4 re mi re

    %148
    do re mi re
    do2 r
    R1

    %151
    fa4 sol lab! sol
    fa sol lab fa
    sib,8\f sib sib sib sib sib sib sib

    %154
    mib2 r
    lab4\p sol fa mib
    sib mib r2

    %157
    R1*2
    sib1\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6 5>
    <5>2 <6>
    <4- 2> <6>
    <4 2> <5>4 <6!>
    s1
    <6 5>2 <_!>
    <6 5> <6>
    <4 2> <6>
    s1
    s
    <7->2 <6>
    s1
    <6 5>
    s1
    s
    <6 5>2 <_!>
    <5> <6>
    s1
    s
    <6>
    <6 5>
    <5>2 <6>
    <4- 2> <6>
    s1
    s
    <7>2 <6!>
    <6>1
    <9>2 <6 8>
    <7-> <6>
    s1
    <6 5>
    s1*5
    <6>1
    s4 <6> <6> s
    s1
    s
    <6 4>
    s
    <6>2 <6>4 <5>
    s1*6
    s4 <7> s2
    s1*5
    <6 4 2>2 <6>
    <6->1
    s2 <6 5>
    s1
    s
    s2 <_!>
    s <6>
    <4 2> <6>
    s1
    <6>
    <6 5>
    s2 <6>
    <6 4- 2> <6>
    s1*4
    <6 5>2 <_!>
    <6>1 s2 <5>4 <6!>
    s1
    <6>2 <6!>
    s2 <6 5>4 <_!>
    s1
    s
    s2 <6 5>4 <_!>
    s1*7
    s4 <6> <6> s
    s1
    s
    <7->
    s1
    s
    s2 <7 5>
    <_!>1
    <7>2 <7>
    <7 _!> <3!>
    s1*2
    <6 5>2 <_!>
    s1
    <4 2>
    s2 <6+>
    <_->1
    <6! 5>2 <6  5>
    s <6>
    <6 4 2!> <6>
    s1
    s
    <7>2 <6!>
    s1
    <6 5>2 <_!>
    <6> <6+>
    s1
    <_+>
    s8 <5!> s4 s2
    <_!>1
    s8 <3-> s4 s2
    s8 <3!> s4 s2
    s8 <6+> s4 s2
    <_!>2 <6 4>4 <5 3+>
    s2 <6>4 <6+>
    s1*22
    <7 5>1
    <7 _!>
    <7>

}

forma = {

    \time 2/2
    \key mib\major
    \tempo 1 = 60
    s1*36\break
    s1*123
    \bar"||"
    \mark\markup\center-column {
        "D.C. al" \musicglyph "scripts.ufermata"
    }

}


IIIvlI = {
    \global
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}

IIIvlIII = {
    \global
    <<\IIIvlIIIn \forma>>

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
    \terzine \con

}

IVvlIn = \relative do'' {

    <la fa do>4 <la fa do> <la fa do> r
    fa32(sol la sol) fa8 la32(sib do sib) la8
    <<
        {
            <fa' do>4 <fa do>
            <fa do>
        }\\{
            fa, fa
            fa
        }
    >> r8 do'16 do sib sib la la sol sol fa fa

    %4
    do'8 do, do do do4 r
    do'32(re mi re) do8 mi32(fa sol fa) mi8\mbreak  <<{mi,8 mi mi mi}\\{do do do do}>>
    fa'32(sol la sol) fa8 la32(sib do sib) la8 <<{la,8 la la la}\\{fa fa fa fa}>>

    %7
    la' sol4 fa8 sib la4 sol8
    re' do4 sib8 la16(fa) sol(mi) fa8 do
    la' sol4 sib8\p la16(fa) sol(mi) fa8 do

    %10
    sib\f la r do16 do sib sib la la sol sol fa fa\mbreak
    do'8 do, r16 do' re mi fa32(sol la sol) fa8 la,32(sib do sib) la8
    sib32(do re do) sib8 r16 re mi fad sol32(la si la) sol8 si,32(do re do) si8

    %13
    do16 mi sol8. do,16 -.[mi-. sol-.] si,16 re sol8. si,16-.[re-. sol-.]
    la,16 do fa8. la,16[do fa] sol,16 si mi8. sol,16[si mi]
    fa,16 la re8. fa,16[la re] mi,32(fa sol16) sol32[(la si16) ]si32(do re16) re32[(mi fa16)]\mbreak

    %16
    fa32(sol la16) la4 sol16 fa mi32(fa sol16) do,32[(re mi16)] la,32(si do16) fa,32[(sol la16)]
    si,8 la''4 sol16 fa mi32(re do16) fa32[(mi re16)] mi8 re\tr
    mi32(re do16) fa32[(mi re16)] mi8 re\tr do4 la

    %19
    fa sol do, r
    do do do r
    do32(re mi re) do8 mi32(fa sol fa) mi8 <<
        {
            mi'4 mi

            %22
            mi
        }\\{
            <do sol> <do sol>
            <do sol>
        }
    >> r8 sol16 sol\mbreak fa fa mi mi re re do do
    sol'8 sol, sol sol sol4 r
    sol'32(la si la) sol8 si32(do re do) si8 sol'4 sol

    %25
    sol32(la sib! la) sol8 mi32(fa sol fa) mi8 dod32(re mi re) dod8 mi32(fa sol fa) mi8
    \once\stemDown fa8 re, re re re4 r8 la''\dolce
    fad sol4 sib8 mi,! fa?4 la8

    %28
    re, mib4 sol8\mbreak dod, re sol fa
    fa\tr mi r16 la,\f si la dod la re la mi' la, fa' la,
    \once\stemDown mi'8 la,, la la la4 r16 mi'' fa mi

    %31
    sold mi la mi si' mi, do' mi, re'8 do r sib!
    sib re4 la8 sold la r fa
    mi32(fad sold16) sold32[(la si16)] si32 \parenthesize (la sold16) fa32[(mi re16)]\mbreak do32(re mi16) la,32[(si do16)] fa,32(sol la16) re,32[mi fa16]

    %34
    sold,8 fa''4 mi16 re do32[(si la16)] re32(do si16) do8 si\tr
    do32[(si la16)] re32(do si16) do8 si\tr la4 fa
    re mi la, r

    %37
    <<{re re re}\\{re re re}>> r
    re'32(mi fa mi) re8 fa32(sol la sol) fa8 <<
        {
            <la, fa>4 <la fa>
            <la fa>
        }\\{
            do, do
            do
        }
    >> r4 \mbreak fa32(sol la sol) fa8 la32\parenthesize (sib do sib) la8

    %40
    <<{<fa' do>4 <fa do> <fa do>}\\{fa, fa fa}>> r8 do'16 do
    sib sib la la sol sol fa fa do'8 do, r mi'
    fa16 la do8. fa,16[la do] mi, sol do8. mi,16[sol do]

    %43
    re, fa sib8. re,16[fa sib] do, mi sol8. do,16[mi sol]
    la,32(sib do16) do32[(re mi16)] mi32(fa sol16) sol32[(la sib16)]\mbreak sib32 do re16 re4 do16 sib
    la(fa) sib(sol) sol4\tr fa r

    %46
    la,8\dolce sol4 fa8 sib la4 sol8
    re' do4 sib8 <<{la\f <la fa> <la fa> <la fa> }\\{s do, do do}>>
    sib''8 la4 sol8 re' do4 sib8

    %49
    la16(fa) sib(sol) sol4\tr fa8 do16 do sib sib la la
    sol8 sib16 sib la la sol sol <<{<la fa>8 <la fa> <la fa> <la fa> }\\{do, do do do}>>\mbreak
    << <la' fa>4\\do,>> r << <fa' do>\\ fa,>> r

    %52
    << <fa' si,>\\re,>> r << <mi' sib>\\sol,>> r
    fa'32(sol la sol) fa8 la32(sib do sib) la8 r la, sib do
    << <la fa>2\\do,>>

}

IVvlIIn = \relative do'' {

    <la fa do>4 <la fa do> <la fa do> r
    la,32((sib do sib) la8 fa'32(sol la sol) fa8 <<
        {
            la4 la
            la
        }\\{
            fa fa
            fa
        }
    >> r8 la16 la sol sol do do sib sib la la

    %4
    sol8 do, do do do4 r
    mi32(fa sol fa) mi8 do'32(re mi re) do8 <mi, do> <mi do> <mi do> <mi do>\mbreak
    la32(sib do sib) la8 fa'32(sol la sol) fa8 <fa, la,> <fa la,> <fa la,> <fa la,>

    %7
    fa'8 mi sib' la sol\tr fa4 mi8
    sib' la4 sol8 fa\tr mi la mi
    fa\tr mi4 sol8\p fa mi la la,

    %10
    sol\f\tr fa r la16 la sol sol do do sib sib la la
    sol8 do do,4 la'32(sib do sib) la8 fa32(sol la sol) fa8\mbreak
    re32\parenthesize (mib fa mib) re8 r4 si'32(do re do) si8 sol32(la si la) sol8

    %13
    mi'16 mi mi mi mi mi mi mi re re re re re re re re
    do do do do do do do do si si si si si si si si
    la la la la re, re re re do32(re mi16) mi32[(fa sol16)] sol32(la si16) si32[(do re16)]

    %16
    re32 mi fa16 fa4 mi16 re\mbreak do32(re mi16) la,32[(si do16)] fa,32(sol la16) re,32[(mi fa16)]
    sol,8 fa''4 mi16 re do8 do do si\tr
    do do do si\tr do4 la

    %19
    fa sol do, r
    do do do r
    mi32(fa sol fa) mi8 do32(re mi re) do8 <do' mi, sol,>4 <do mi, sol,>

    %22
    <do mi, sol,> r8 mi,16 mi re re sol sol fa fa mi mi\mbreak
    re8 sol, sol sol sol4 r
    si32(do re do) si8 sol'32(la si la) sol8 <si re, sol,>4 <si re, sol,>

    %25
    mi32(fa sol fa) mi8 dod32(re mi re) dod8 la32(si dod si) la8 dod32(re mi re) dod8
    re re, re re re4 r8 re\dolce
    re' re re re do do do do

    %28
    sib sib sib sib la la dod re
    re dod r fa\parenthesize \f \mbreak mi16 la fa la dod, la' re, la' \once\stemDown
    dod,8 la, la la la4 r8 la'

    %31
    mi' fa sold la si la r4
    fa8 r fa r si,\tr la r fa'
    mi32(fad sold16) sold32[(la si16)] si32 \parenthesize (la sold16) fa32[(mi re16)]\mbreak do32(re mi16) la,32[(si do16)] fa,32(sol la16) re,32[mi fa16]

    %34
    sold,8 re''4 do16 si do8 la la sold\tr\mbreak
    la la la sold\tr la4 fa
    re mi la, r

    %37
    <<{re re re}\\{re re re}>> r
    fa32(sol la sol) fa8 re'32(mi fa mi) re8
    <<
        {
            <la fa>4 <la fa>
            <la fa>
        }\\{
            do, do
            do
        }
    >> r4 la32(sib? do sib) la8 fa'32(sol la sol) fa8

    %40
    <<{la4 la la}\\{fa fa fa}>> r8 la16 la
    sol sol fa fa mi mi re re\mbreak \once\stemUp mi8 sol' sol sol
    la16 la la la la la la la sol sol sol sol sol sol sol sol

    %43
    fa fa fa fa fa fa fa fa mi mi mi mi mi mi mi mi
    fa,32(sol la16) la32[(sib do16)] do32(re mi16) mi32[(fa sol16)] sol32(la sib16) sib4 la16 sol
    fa8 fa4 mi8\tr fa4 r

    %46
    fa,8\dolce mi4 do8\mbreak sol' fa4 mi8
    sib' la4 sol8 <<{fa\f <la fa> <la fa> <la fa> }\\{s do, do do}>>
    sol'' fa4 mi8 sib' la4 sol8

    %49
    fa fa4 mi8 fa la,16 la sol sol fa fa
    do8 sol'16 sol fa fa mi mi <<{<la fa>8 <la fa> <la fa> <la fa> }\\{do, do do do}>>
    << <la' fa>4\\do,>> r << <fa' do>\\ fa,>> r

    %52
    << <fa' si,>\\re,>> r << <mi' sib>\\sol,>> r\mbreak
    la32(sib do sib) la8 fa'32(sol la sol) fa8 r la, sib do
    << <la fa>2\\do,>>

}

IVvlan = \relative do' {

    <<{do4 do do}\\{fa, fa fa}>> r
    r2 <<
        {
            do'4 do
            do
        }\\{
            fa, fa
            fa
        }
    >> r r2

    %4
    r8 <<{sol sol sol sol4}\\{mi8 mi mi mi4}>> r
    r2 <<{sol8 sol sol sol}\\{mi mi mi mi}>>
    r2 <<{fa8 fa fa fa}\\{do do do do}>>

    %7
    do' do do do do do do do
    do do do do do do do do
    do do do do do\p do do do

    %10
    do\f do r4 r2
    do4 do do do
    sib8 re re4 r8 sol, sol sol

    %13
    sol4 r8 do sol4 r8 sol
    do4 r8 do sol4 r8 sol
    la4 r8 sol sol4 r\mbreak

    %16
    r8 re' re si sol4 r
    r8 re' re si r do sol sol
    r la' sol sol mi4 la

    %19
    fa sol do, r
    <do' mi, sol, do,> <do mi, sol, do,> <do mi, sol, do,> r
    r2 <do mi, sol, do,>4 <do mi, sol, do,>

    %22
    <do mi, sol, do,> r r2
    sol8 sol, sol sol sol4 r\mbreak
    r2 r8 sol sol sol

    %25
    sol4 r r8 la la la
    la re re re re4 r
    la8\dolce sib sib sib sol' la la la

    %28
    re, sol sol sol mi fa sol la
    la la, la la la4\f r
    r8 la la la la4 r\mbreak

    %31
    r2 si8 do r4
    re8 r re r mi fa mi la
    sold sold sold sold mi4 r

    %34
    r8 si' si si mi, re mi mi
    mi fa mi mi la4 fa
    re mi la, r

    %37
    <<
        {la' la la}\\{<re, la> <re la> <re la >}
    >> r\mbreak
    r2 <<
        {
            do4 do
            do
        }\\{
            fa, fa
            fa
        }
    >> r r2

    %40
    <<{la'4 la la}\\{<fa do> <fa do> <fa do>}>> r
    r2 r8 mi mi do
    do do do do r do do do

    %43
    fa,4 r8 re' do4 r8 do
    do4 r r8 sol' sol sol
    do, re re sol,\mbreak la4 r

    %46
    do8\dolce do do do do do do do
    do do do do do\f do do do
    do do do do do do do do

    %49
    do re re sol, la4 r
    r2 <<{do8 do do do}\\{fa, fa fa fa}>>
    <<do'4\\fa,>> r <<la'\\<fa do> >> r

    %52
    <<re\\si>> r\mbreak <mi sol, do,> r
    << <la fa>\\do,>> r r8 la' sib do
    << <la fa>2\\ do,>>

}

IVbcn = \relative do {

    fa,4 fa fa r
    r2 fa'4 fa
    fa r r2
    r8 do do do do4 r
    r2 do8 do do do
    r2 fa,8 fa fa fa
    do' do do do do do do do\mbreak
    do do do do do do do do
    do do do do do^\p do do do
    do^\f fa r4 r2
    r8 do' do,4 r8 fa fa fa
    sib, sib' sib,4 r8 sol' sol sol
    do, do' do do r si si si
    r la la la\mbreak r sol sol sol
    r fa si, si do4 r
    r8 re si sol do4 r
    r8 re si sol r la' sol sol,
    r fa' sol sol, do4 la'
    fa sol do, r
    do do do r\mbreak
    r2 do4 do
    do r r2
    sol'8 sol, sol sol sol4 r
    r2 r8 sol' sol sol
    dod,4 r r8 la la la
    re re re re re4 r
    do'8^\p sib sib sib sib la la la\mbreak
    la sol sol sol sol fa mi re
    la' la, la la la4\f r
    r8 la la la la4 r
    r2 sold'8 la r4
    re,8 r re r mi fa do[re]
    mi mi mi mi la,4 r\mbreak
    r8 sold sold sold la fa' mi mi,
    la fa' mi mi, la4 fa'
    re mi la, r
    re re re r
    r2 fa4 fa
    fa r r2
    fa4 fa fa r\mbreak
    r2 r8 do' do sib
    la fa fa fa r mi mi mi
    r re re re r do do do
    fa4 r r8 mi mi mi
    fa re sib do fa4 r
    do8^\dolce do do do do do do do\mbreak
    do do do do fa\f fa fa fa
    do do do do do do do do
    fa re sib do fa4 r
    r2 fa8 fa fa fa
    fa4 r la r
    re, r do r
    fa r r8 la sib do
    fa,2

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*6
    <6 4>8 <5 3> s s <7 5> <6 4> <4> <3>
    <7 2> <6 5> s <7 5> <6 4> <5 3> <6 4> <3>
    <6 4> <3> s <7 5> <6 4> <5 3> <6 4> <6>
    <5 3>1
    s1
    s2 s8 <_!> s4
    s2 s8 <6> s4
    s2 s8 <_!> s4
    s1 s4 <7> s2
    s2 s8 <6> <6 4> <5 3!>
    s s <6 4> <5 3> s2
    s1*5
    s2 s8 <_!> s4
    s2 s8 <_+> s4
    s1
    <6 4>8 <6+> s4 <4 2>8 <6> s4
    <2>8 <6-> s s <4+ 2> <6> s4
    <6 4>8 <3+> <6 4>4 s2
    s1
    s
    <6->2 <_+>4 <6>
    <_+>1
    s8 <7 _+> s4 s8 <6> <6 4> <3+>
    s4 <6 4>8 <3+> s2
    s1*6
    s2 s8 <6> s4
    s1
    s2 s8 <7> s4
    s <6 5> s2
    <6>8 <5> s4 <7>4 <6 4>8 <7 3>
    <7> s <6 4> <7 3> s2
    <7>8 s <6 4> <7 3> <7> s <6 4> <7 3>
    s4 <6 5> s2
    s1
    s2 <6>
    <6!> <7->

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 52
    s1*53
    s2
    \bar"||"

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
    \terzine \con

}

VvlIn = \relative do'' {

    fa16._\markup {\italic mezzo \dynamic p} sol32 lab8 [fa]
    sol16 reb'(do sib lab\tr sol)
    lab16.[(sib32)] do8 do,

    %4
    red16 sib lab sol(fa mi)
    fa8_\markup {\italic mezzo \dynamic f}  do' fa~
    fa16 lab(sol fa mib\tr re)

    %7
    mib16.\dolce (fa32) sol8[do,]
    re16 fa mib re(do si)
    do4._\markup {\italic mezzo \dynamic f }~ \mbreak

    %10
    do16 lab sol fa\tr \dolce(mib re)
    do4 r8
    fa'16. sol32 lab8 [fa]

    %13
    reb16.(mib32) fa8[fa,]
    sol16. lab32 sib8[reb]
    do mib lab~

    %16
    lab sib, sol'~
    sol do, fa~
    fa16. sib32 lab8[sol]\mbreak

    %19
    lab16. sib32 do8[do,]
    reb16\dolce(sib lab sol fa mi)
    fa'4.\f~

    %22
    fa16 reb\dolce(do sib lab sol)
    \tuplet 3/2 { lab(sol fa) } lab8\f[sol\tr]
    fa4 r8 fa4 r8

}

VvlIIn = \relative do'' {

    r8 fa, fa'~
    fa8 mi16.\tr fa32 sol8~
    sol fa16.\tr sol32 lab8

    %4
    sib,16 reb do sib(lab sol)
    lab do sib lab _\markup {\italic mezzo \dynamic f} (sol fa)
    sol8 re'4~

    %7
    re8 do mib?
    fa,16\dolce lab sol fa(mib re)
    do4.\f~

    %10
    do16 fa mib re\dolce (do si)
    do4 r8
    r do do'~

    %13
    do\tr sib16. do32 reb8~
    reb sol,16. lab32 sib8~
    sib lab16. sib32 do8

    %16
    sib16 \override TrillSpanner.bound-details.left.text = #'() ^\startTrillSpan reb do sib lab sol \stopTrillSpan
    lab8. lab'16(sol fa)
    sol8(fa mi)

    %19
    fa8.\tr sol16 lab8
    sib,16\dolce \override TrillSpanner.bound-details.left.text = #'() ^\startTrillSpan reb do sib lab sol \stopTrillSpan
    fa4.\f~

    %22
    fa16 sib\dolce(lab sol fa mi)
    fa8\f fa mi
    fa4 r8 fa4 r8

}

Vvlan = \relative do' {

    lab16. sib32 do8[do]
    reb sol, do
    r do fa~

    %4
    fa do do
    do4 do8\parenthesize _\markup {\italic mezzo \dynamic f}
    re?8. do16 si re

    %7
    sol,8 sol sol'
    lab\dolce re, sol
    r16 fa\f mib re do si

    %10
    do16. do32 sol8\dolce[sol]
    mib4 r8
    do' fa fa

    %13
    fa fa sib,
    sib sib sol
    r lab lab

    %16
    sib sol' do,
    do do do
    reb do do

    %19
    r8 do_\markup {\italic mezzo \dynamic f } fa~
    fa do\dolce do
    r16 \override TrillSpanner.bound-details.left.text = #'() ^\startTrillSpan sib'\f lab sol fa mi \stopTrillSpan

    %22
    fa\dolce fa do8[do]
    do\f do do
    lab4 r8 lab4 r8

}

Vbcn = \relative do {

    fa8._\markup {\italic mezzo \dynamic p} sol16 lab8
    sib do do,
    fa fa, fa'

    %4
    sib, do do,
    fa4 lab'8_\markup {\italic mezzo \dynamic f}
    si,8. la16 sol8

    %7
    do mib do
    fa^\dolce sol sol,
    r16 lab'!^\f sol fa mib re

    %10
    mib16. fa32 sol8^\dolce[sol,]
    do do'16 sib lab sol\mbreak
    lab8 fa la

    %13
    sib, reb sib
    mib sol mib
    lab,! do lab

    %16
    mib' mi do
    fa fa, lab
    sib do do,

    %19
    fa fa' fa,
    sib^\dolce do do,
    r16 reb'^\f do sib lab sol

    %22
    lab16.\dolce  sib32 do8[do,]
    fa do' do,
    fa\noBeam do''16 sib lab sol fa,4 r8

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <6 5>
    <9>8 <8> s
    s <6 4> <3!>
    s4.
    <6 5>8 s4
    <9>8 <6> s
    <6 5> <6 4> <3!>
    s16 <6> <6> <6> <6> <6>
    s8 <6 4> <3!>
    s4.
    <6>8 s <6>
    <9> <6> s
    <3->4.
    <9>8 <6> s
    <6 4> <5> s
    <9> <8> s
    <6 5> <6> <3!>
    s4.
    <_->8 <6 4> <3!>
    s16 <6> <6> <6> <6> <6>
    s4.
    s8 <6 4> <3!>



}

forma = {

    \time 3/8
    \key mib\major
    \tempo 4 = 63
    s4.*11
    \bar":..:"\break
    \repeat volta 2 {s4.*12}
    \alternative {{s4.}{s}}
    \bar"|."

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
    \terzine \con

}

VIvlIn = \relative do'' {

    fa,8 la sib
    do sib la
    do re mi

    %4
    fa fa,4\tr
    fa'8 sol la
    re, \grace re do4\tr

    %7
    sib8\grace sib la4\tr
    sol8 do, r
    do' re mi

    %10
    fa fa fa
    fa fa fa
    fa fa,4

    %13
    do'8 mi fa\mbreak
    sol sol sol
    sol sol sol

    %16
    sol sol,4
    sol'8 fa mi
    la sol fa

    %19
    si la sol
    do fa, fa
    re' fa, fa

    %22
    fa fa fa
    fa\tr mi re
    mi re do

    %25
    la' sol fa
    sol fa mi
    do' do do

    %28
    do si16 la sol fa\mbreak
    mi32(re do8.) la'8\noBeam
    sol32 (fa mi8.) fa8\noBeam

    %31
    mi32(re do8.) la'8\p\noBeam
    sol32\parenthesize (fa mi8.) fa8\noBeam
    mi32\parenthesize (re do8.) sol'8\f\noBeam

    %34
    la, \grace do si4
    do16 re mi fa sol8
    la, \grace do si4\tr

    %37
    do8 si16 la sol fa
    \tuplet 3/2 {
        mi(re do)
    } re4\tr
    do4.

    %40
    do8 mi fa
    sol fa mi
    sol la si

    %43
    do do,4
    mi'8 re do
    la' \grace la sol4\tr

    %46
    fa8 \grace fa mi4\tr
    re8 sol,4
    sol'8 la sib!

    %49
    dod,, si la
    sib''16\dolce (sol) la(fa) sol(mi)
    \once\stemDown fa8 re, r

    %52
    fa' \f sol la
    si,, la sol\mbreak
    la''16\dolce(fa) sol(mi) fa(re)

    %55
    \once\stemDown mi8 do, r
    fa\f la sib?
    do sib la

    %58
    do re mi
    la16(sib do4)
    la16(sib do4)

    %61
    la16\p(sib do4)
    la16(sib do4)
    re8 \f do sib

    %64
    la32(sol) fa8. do'8
    sib32(la) sol8. sib8
    la32(sol) fa8. do'8

    %67
    sib32\p(la)  sol8. sib8
    la32(sol) fa8. do'8\f
    re, \grace fa mi4\tr

    %70
    fa16 sol la sib do8
    re,\grace fa mi4\tr
    fa8 mi16 re do sib

    %73
    \tuplet 3/2 { la(sol fa) } sol4\tr
    fa4.

}

VIvlIIn = \relative do'' {

    fa,8 la sib
    do sib la
    do re mi

    %4
    fa fa,4\tr
    fa'8 sol la
    re, \grace re do4\tr

    %7
    sib8\grace sib la4\tr
    sol8 do, r
    do' re mi

    %10
    fa fa fa
    fa fa fa
    fa fa,4

    %13
    do'8 mi fa\mbreak
    sol sol sol
    sol sol sol

    %16
    sol sol,4
    sol'8 fa mi
    la sol fa

    %19
    si la sol
    do fa, fa
    re' fa, fa

    %22
    fa fa fa
    fa\tr mi re
    mi re do

    %25
    la' sol fa
    sol fa mi
    do' do do

    %28
    do si16 la sol fa\mbreak
    mi32(re do8.) la'8\noBeam
    sol32 (fa mi8.) fa8\noBeam

    %31
    mi32(re do8.) la'8\p\noBeam
    sol32\parenthesize (fa mi8.) fa8\noBeam
    mi32\parenthesize (re do8.) sol'8\f\noBeam

    %34
    la, \grace do si4
    do16 re mi fa sol8
    la, \grace do si4\tr

    %37
    do8 si16 la sol fa
    \tuplet 3/2 {
        mi(re do)
    } re4\tr
    do4.

    %40
    do8 mi fa
    sol fa mi
    sol la si

    %43
    do do,4
    mi'8 re do
    la' \grace la sol4\tr

    %46
    fa8 \grace fa mi4\tr
    re8 sol,4
    sol'8 la sib!

    %49
    dod,, si la
    sib''16\dolce (sol) la(fa) sol(mi)
    \once\stemDown fa8 re, r

    %52
    fa' \f sol la
    si,, la sol\mbreak
    la''16\dolce(fa) sol(mi) fa(re)

    %55
    \once\stemDown mi8 do, r
    fa\f la sib?
    do sib la

    %58
    do re mi
    fa16(sol la4)
    fa16(sol la4)

    %61
    fa16\p(sol la4)
    fa16(sol la4)
    re8 \f do sib

    %64
    la32(sol) fa8. do'8
    sib32(la) sol8. sib8
    la32(sol) fa8. do'8

    %67
    sib32\p(la)  sol8. sib8
    la32(sol) fa8. do'8\f
    re, \grace fa mi4\tr

    %70
    fa16 sol la sib do8
    re,\grace fa mi4\tr
    fa8 mi16 re do sib

    %73
    \tuplet 3/2 { la(sol fa) } sol4\tr
    fa4.

}

VIvlan = \relative do' {

    la'8 la sol
    fa sol la
    la sol sol

    %4
    fa mi re
    do sib la
    fa' fa la

    %7
    mi fa4
    mi8 mi mi
    fa sib sol

    %10
    fa mi re
    do sib la\mbreak
    re do sib

    %13
    do sib la
    re do si
    mi fa sol

    %16
    re do si
    mi fa sol
    do, do re

    %19
    re re mi
    mi fa fa
    sol la si~

    %22
    si do re\mbreak
    sol, sol sol
    sol fa mi

    %25
    fa sol la
    mi fa sol
    do si la

    %28
    sol sol si,
    do do' do,
    do do' re

    %31
    sol, do do,\p
    do do' re
    sol, do mi,\mbreak

    %34
    fa re re
    mi mi do
    fa re re

    %37
    mi fa si,
    do do si
    do4.

    %40
    mi8 mi re
    do re mi
    mi re re

    %43
    do si la
    sol' fa mi
    fa do mi

    %46
    si do do
    si si si
    do do sol'

    %49
    dod, si la
    r r dod
    re la' sol\mbreak

    %52
    fa sol la
    si, la sol
    r r si

    %55
    do mi re
    do la' sol
    fa sol la

    %58
    fa fa sol
    la la la
    sol sol sol

    %61
    fa \p fa fa
    do do do'\mbreak
    fa,\f fa sol

    %64
    la do la
    mi sol mi
    fa do' la

    %67
    mi\p sol mi
    fa do' la\f
    sol sol sol

    %70
    la do la
    sol sol sol
    la sib? mi,

    %73
    fa fa mi
    fa4.

}

VIbcn = \relative do {

    fa,8 fa' sol
    la sol fa
    la sib do

    %4
    re do sib
    la sol fa
    sib la fa

    %7
    sol fa si,
    do do' sib?
    la sib do

    %10
    re do sib
    la sol fa
    sib la sol\mbreak

    %13
    la sol fa
    si, la sol
    do re mi

    %16
    si la sol
    do re mi
    fa mi re

    %19
    sol fa mi
    la re do
    si la sol

    %22
    re' do si
    do do, sol'
    do, re mi\mbreak

    %25
    fa mi re
    mi re do
    la' sol fa

    %28
    mi fa sol
    do,32(re mi8.) fa8\noBeam
    mi32(re do8.) si8\noBeam

    %31
    do32(re mi8.) fa8\p\noBeam
    mi32(re do8.) si8\noBeam
    do32(re mi8.) do8\f\noBeam

    %34
    fa sol fa
    mi do mi
    fa sol fa

    %37
    mi re sol
    do, sol' sol,
    do4.

    %40
    do'8 do, re
    mi re do
    mi fa sol

    %43
    la sol fa
    do re mi
    fa mi do

    %46
    re do fad,
    sol sol' fa!
    mi fa sol

    %49
    dod, si la
    sol' \dolce(fa mi)
    re fa mi\mbreak

    %52
    re\f mi fa
    si, la sol
    \override TrillSpanner.bound-details.left.text = #'() ^\startTrillSpan fa'\dolce mi re\stopTrillSpan

    %55
    do do' sib
    la\f fa sol
    la sol fa

    %58
    la sib sol
    fa fa fa
    mi mi mi

    %61
    re\dolce re re
    la la la\mbreak
    sib\f la sol

    %64
    fa' la fa
    sol mi do
    fa la fa

    %67
    sol\p mi do
    fa la fa\f
    sib do sib

    %70
    la fa la
    sib do sib
    la sol do,

    %73
    fa do' do,
    fa4.

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*18
    <_!>4.
    s4.*3
    <4>8 <3> s
    s4.*10
    s8 <_!>4
    <6>4.
    s8 <_!>4
    s8 <6!>4
    s4.*20
    s4 <6>8
    s4.*3
    <6>4.
    s4.*4
    s4 <7>8
    s4.*4
    s8 <6>

}

forma = {

    \time 3/8
    \key fa\major
    \tempo 2. = 50
    s4.*39
    \bar ":..:"\break
    s4.*35
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
        title = \markup\smaller\fill-line {"Concerto Ottavo"}
        composer = \markup \center-column{"L. Zavateri(1690 - 1764)"}
    }

    \markup \huge {[I.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino P.mo"\vspace #-0.2"ob[b]ligato"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino  P.mo"\vspace #-0.2"di Ripieno"}
                \set Staff.shortInstrumentName = "vlrp"
                \IvlIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[I.2] Adagio}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino P.mo"\vspace #-0.2"ob[b]ligato"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino  P.mo"\vspace #-0.2"di Ripieno"}
                \set Staff.shortInstrumentName = "vlrp"
                \IIvlIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[I.3] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino P.mo"\vspace #-0.2"ob[b]ligato"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino  P.mo"\vspace #-0.2"di Ripieno"}
                \set Staff.shortInstrumentName = "vlrp"
                \IIIvlIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller\fill-line {"Concerto Nono Teatrale"}
        composer = \markup \center-column{"L. Zavateri(1690 - 1764)"}
    }

    \markup \huge {[II.1] Allegro, e spicco}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino P.mo"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[II.2] Larghetto alla Francese}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino P.mo"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[II.3] Presto}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino P.mo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"Organo"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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
