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
    \con \terzinequarto
}

IvlIn = \relative do'' {

    mib,8
    mib4. sol8 sol4. sib8
    sib4. mib8 mib sib sol mib
    mib4\upl r8 do' do4(sib8) mib,

    %4
    mib4(re8) lab' sol fa mib4
    sib lab' sol8 fa mib4
    sib\p lab' sol8 fa mib4

    %7
    mib'8\f fa sol lab \appoggiatura lab sib4 re,8 mib\mbreak
    sib4. re8\p mib fa sol lab
    \appoggiatura lab sib4 re,8 mib sib4. lab'8

    %10
    sol fa mib4 sib'\f r8 lab
    sol fa mi reb do4\upl sib\upl
    lab8 sol fa4 lab'\p r8 sol

    %13
    fa mib re? do sib4\upl lab\upl
    sol8 fa mib sib'\f sib4(do8) re
    re4(mib8) fa\mbreak fa4(sol8) la

    %16
    sib fa re sib sib4\p(do8) re
    re4(mib8) fa fa4(sol8) la
    sib4 r8 sib16\f  lab? sol mib lab sol fa re sol fa  %% ripresa da metà battuta

    %19
    mib8 do r fa16 mib re sib mib re do lab re do
    sib8 sol r do16 sib lab fa sib lab sol mib lab sol
    fa8 re sib4 sib'2\mbreak

    %22
    do re
    mib16 [fa sol lab sib8] r r fa16[sol lab8 sol16 fa]
    mib4\upl mib,\upl r8 fa'16\p[sol lab8 sol16 fa]

    %25
    mib4\upl mib,\upl r8 fa16\f[sol lab8 sol16 fa]
    mib4\upl sol,\upl r8 fa'16 [sol lab8 sol16 fa]
    mib4 r sib''2\solo  %%%% fine ripresa a metà battuta

    %28
    do re
    mib8[re16 do sib8 lab]\mbreak sol fa mib4
    sib'2 do

    %31
    re mib8[re16 do sib8 mib\upl]
    fa\upl sol\upl lab\upl fa\upl sol mib r do
    do\tr sib r lab lab\tr sol r do,

    %34
    do\tr sib  r lab lab\tr sol r4
    mib'16(sib' do) sib mib,(sib' do) sib  mib,(sib' do) sib mib,(sib' do) sib
    do2\p~\mbreak do\f

    %37
    fa,16 (do' re) do fa, (do' re) do fa, (do' re) do fa, (do' re) do
    <<{s2\p s\f}\\re1>>
    sol,16(re' mib) re sol,(re' mib) re sol,(re' mib) re sol,(re' mib) re

    %40
    mib re do sib lab sol fa mib' re do sib lab sol fa mib re'
    do sib lab sol fa mib re do' sib lab sol fa mib re do sib'\mbreak
    lab sol fa mib re do sib lab' sol8 mib4 lab8

    %43
    fa re4 sol8 mib do4 fa8
    re sib4 mib8 do lab4 fa'8
    mib16 sib do sib mib sib do sib sib'4\upl sol\upl

    %46
    fa16 sib, do sib fa' sib, do sib sib'4\upl fa\upl
    sol16 sib, do sib sol' sib, do sib sib'4 sol\mbreak
    fa r8 sib lab!4(sol8\tr) fa16 sol

    %49
    lab!8 fa r do' sib4(la8\tr) sol16 la
    sib8 sol r16 sol la sol sib sib do sib re8 re,
    mib!4 r16 sol la sol do do re do mib!8 sol,

    %52
    fad sol4 la sib dod8~
    dod re4 re,8~re fad4 do'?8
    sib[la16 sol la8 fad]\mbreak  sol4. mib8 %%%%% fine p. 6 OK

    %55
    mib4(re8) sol, sol4(fad8) do'
    sib la sol4 re do'
    sib8 la sol4 re\p do'

    %58
    sib8 la? sol4 re'2\f
    mib! fad
    sol16[la sib do re8] r r la16[sib do8 sib16 la]

    %61
    sol4 sol, r8 la'16\p[sib do8 sib16 la]
    sol4 sol,\mbreak r8 la16\f[sib do8 sib16 la]
    sol16\solo sol re sol sib, sol' re sol do, mib'! do mib fad, re' la re

    %64
    sib8 sol, r4 r2
    r16 sib'' do re fa,? si re, si' fa si re, si' fa si re, si'
    do8 sol mi do sol mi r4

    %67
    r16 la'? sib? do mib,? la do, la' \mbreak mib16 la do, la' mib la do, la'
    sib8 fa re sib fa re r4
    r16 sol' lab sib mib, sol sib, sol' mib sol sib, sol' mib sol sib, sol'

    %70
    mib sol do, sol' mib sol do, sol' mib sol do, sol' mib sol do, sol'
    re sol si, sol' re sol si, sol' re sol si, sol' re sol si, sol'
    mib8 sol sol8.(lab!32 sib?)lab8 la la8.(sib32 do)\mbreak

    %73
    sib8 si si8.(do32 re) do16 do, re do do'8 r
    r16 re, mib re re'8 r r16 sol,, fa sol sol'8 r
    mib'8.[re16(do) sib(lab) sol] lab(sol) fa8 r4

    %76
    re'8.[do16(sib) lab(sol) fa] sol(fa) mib8 r4
    do'8.[sib16(lab) sol(fa) mib] fa(mib) re8 r4
    si'2(do)(\mbreak

    %79
    reb)(mi)
    fa~fa16 re fa re sol, re' fa re
    mib8[re16 do re8 si] \tuplet 3/2{
        do sol16(fa mib re) do8[mib16(re do sib?)]

        %82
        lab8 do16(sib lab sol) fa8[lab16(sol fa mib)] re8 fa16(mib re do) si8[re16(do si  la)]
    }
    sol8 do sol' sol, do' re mib fa
    \appoggiatura fa sol4 si,8 do\mbreak sol4. si8

    %85
    do re mib fa \appoggiatura fa sol4 si,8 do
    sol4 r8 sol'16 fa mib do fa mib re sib? mib re
    do8 lab r re16 do sib sol do sib lab fa sib lab

    %88
    sol8 mib r lab16 sol fa re sol fa mib do fa  mib
    re8 si sol4 sol'2
    lab! si

    %91
    do16[re mib fa sol8] r\mbreak r re16[mib fa8 mib16 re]
    do4 do, r8 re'16[mib fa8 mib16 re]
    do4 r sib'2\solo

    %94
    do re
    mib8[re16 do sib8 lab] sol fa mib4
    r8 sol'16 mib mib8.\tr re32 mib fa8 re sib4

    %97
    r8 sol'16 mib mib8.\tr re32 mib fa8 re sib4
    sib16 mib, sol,  mib' sib' do reb sib do mib, lab, mib' do' mib, lab, mib'\mbreak
    do' fa, la, fa' do' re?  mib do re fa, sib, fa' re' fa, sib, fa'

    %100
    re' sol, si, sol' re' mib fa re mib sol, do, sol' mib' sol, do, sol'
    mib' lab, do, lab' mib' lab, do, lab' re lab sib, lab' re lab sib, lab'
    re sol, sib, sol' re' sol, sib, sol' do sol lab,! sol' do sol lab, sol'

    %103
    do fa, lab, fa' do' fa, lab, fa' sib fa sol, fa' sib fa sol, fa'
    sib mib, sol, mib' sib' mib, sol, mib' lab mib fa, mib' lab mib fa, mib'\mbreak
    lab re, fa, re' lab' re, fa, re' lab' sib, re, sib' lab' sib, re, sib'

    %106
    sol' sib, mib, sib' sol' sib, mib, sib' sib'8-.\p(sib-. sib-. sib-.)
    sib16 lab(sol) fa(mib8) re do8-.(do-. do-. do-.)
    lab'8-.(lab-. lab-. lab-.) lab16 sol(fa) mib(re8) do

    %109
    sib-.(sib-. sib-. sib-.) mib,16\f sol sib mib sol8 sib,
    do lab' mib do fa,16 la do fa la8 do,\mbreak
    re sib' fa re sol,16 si re sol si8 re,

    %112
    mib mib'4\p sol,8 sol4(lab8) sol
    sol4(fa8) mib mib4. re8
    re'4. fa,8 fa4(sol8) fa

    %115
    fa4(mib8) re re4.(do8)
    do'4. mib,8 mib4(fa8) mib
    mib4(re8) do do4.(sib8)\mbreak

    %118
    sib' r16 do32 sib sib4\tr mib8 r16 do32 sib sib4\tr
    mib8 r16 do32 sib sib4\tr mib8 mib,16. fa32 fa4\tr
    mib r r2

    %121
    R1
    r16 mib sol mib sib' sol mib' sib sol mib sol mib sib' sol mib' sib
    mib8 sol,16 lab fa4\tr \mbreak mib16 mib, sol mib sib' sol mib' sib

    %124
    sol mib sol mib sib' sol mib' sib mib8 sol,16 lab fa4\tr
    mib4 r8 sib''16\f lab sol mib lab sol fa re sol fa  %% ripresa da metà battuta
    mib8 do r fa16 mib re sib mib re do lab re do

    %127
    sib8 sol r do16 sib lab fa sib lab sol mib lab sol
    fa8 re sib4 sib'2\mbreak
    do re

    %130
    mib16 [fa sol lab sib8] r r fa16[sol lab8 sol16 fa]
    mib4\upl mib,\upl r8 fa'16\p[sol lab8 sol16 fa]
    mib4\upl mib,\upl r8 fa16\f[sol lab8 sol16 fa]

    %133
    mib4\upl sol,\upl r8 fa'16 [sol lab8 sol16 fa]
    mib4\fermata r r2

}

IvlIIn = \relative do'' {

    mib,8
    mib4. sol8 sol4. sib8
    sib4. mib8 mib sib sol mib
    mib4\upl r8 do' do4(sib8) mib,

    %4
    mib4(re8) lab' sol fa mib4
    sib lab' sol8 fa mib4
    sib\p lab' sol8 fa mib4

    %7
    mib'8\f fa sol lab \appoggiatura lab sib4 re,8 mib\mbreak
    sib4. re8\p mib fa sol lab
    \appoggiatura lab sib4 re,8 mib sib4. lab'8

    %10
    sol fa mib4 sib'\f r8 lab
    sol fa mi reb do4\upl sib\upl
    lab8 sol fa4 lab'\p r8 sol

    %13
    fa mib re? do sib4\upl lab\upl
    sol8 fa mib sib'\f sib4(do8) re
    re4(mib8) fa\mbreak fa4(sol8) la

    %16
    sib fa re sib sib4\p(do8) re
    re4(mib8) fa fa4(sol8) la
    sib4 r8 sib16\f  lab? sol mib lab sol fa re sol fa  %% ripresa da metà battuta

    %19
    mib8 do r fa16 mib re sib mib re do lab re do
    sib8 sol r do16 sib lab fa sib lab sol mib lab sol
    fa8 re sib4 sib'2\mbreak

    %22
    do re
    mib16 [fa sol lab sib8] r r fa16[sol lab8 sol16 fa]
    mib4\upl mib,\upl r8 fa'16\p[sol lab8 sol16 fa]

    %25
    mib4\upl mib,\upl r8 fa16\f[sol lab8 sol16 fa]
    mib4\upl sol,\upl r8 fa'16 [sol lab8 sol16 fa]
    mib4 r sib''2~\solo  %%%% fine ripresa a metà battuta

    %28 Ok
    sib lab
    sol4. fa8\mbreak mib4 sib
    sib'2~sib

    %31
    lab sol4. sol8
    lab sol fa re' mib mib, r lab
    lab\tr sol r fa fa\tr mib r lab,

    %34
    lab\tr sol r fa fa\tr mib r4
    R1
    lab16(mib' fa) mib lab,(mib' fa) mib\mbreak  lab,(mib' fa) mib lab,(mib' fa) mib

    %37
    <<{s2\p s\f}\\fa1>>
    sib,16(fa' sol) fa sib,(fa' sol) fa sib,(fa' sol) fa sib,(fa' sol) fa
    <<{s2\p s\f}\\sol1>>

    %40
    sol8 mib4 lab8 fa re4 sol8
    mib do4 fa8 re sib4 mib8\mbreak
    do lab r4 mib''16 re do sib lab sol fa mib'

    %43
    re do sib lab sol fa mib re' do sib lab sol fa mib re do'
    sib lab sol fa mib re do sib' lab sol fa mib re do sib lab'
    sol4 r mib16 sib do sib mib sib do sib

    %46
    sib'4 fa fa16 sib, do sib fa' sib, do sib
    sib'4 sol sol16 sib, do sib sol' sib, do sib\mbreak
    re4 r8 sol fa4(mi8\tr) re16 mi

    %49
    fa8 fa, r la' sol4(fad8\tr) mi?16 fad
    sol8 sol, r4 r r16 sib do sib
    sol'sol la sol do8 do, sol'4 r16 sib do sib

    %52
    la8 sib4 fad sol la8~
    la fad4 sol8~sol do,4 la'8
    sol sib, do la\mbreak sol4. mib'8

    %55
    mib4(re8) sol, sol4(fad8) do'
    sib la sol4 re do'
    sib8 la sol4 re\p do'

    %58
    sib8 la? sol4 re'2\f
    mib! fad
    sol16[la sib do re8] r r la16[sib do8 sib16 la]

    %61
    sol4 sol, r8 la'16\p[sib do8 sib16 la]
    sol4 sol,\mbreak r8 la16\f[sib do8 sib16 la]
    sol4 r r2

    %64
    r16 sol\solo re sol sib, sol' re sol do, mib' do mib fad, re' la re
    sib8 sol, r4 r2
    r16 mi'' fa sol sib,? mi sol, mi' sib mi sol, mi' sib mi sol, mi'

    %67
    fa8 do la? fa\mbreak do la? r4
    r16 re' mib fa lab,! re fa, re' lab re fa, re' lab re fa, re'
    mib8 sib sol mib sib sol r4

    %70
    do'16 mib sol, mib' do mib sol, mib' do mib sol, mib' do mib sol, mib'
    si re sol, re' si re sol, re'  si re sol, re'  si re sol, re'
    do do re do do'8 r r16 re, mib re re'8 r\mbreak

    %73
    r16 sol,, fa sol sol'8 r r sol sol8.(lab32 sib)
    lab8 la la8.(sib32 do) sib8 si si8.(do32 re)
    do4 r lab8. [sol16(fa) mib(re) do]

    %76
    re(do) sib8 r4 sol'8. [fa16(mib) re(do) sib]
    do(sib) lab8 r4 fa'8. [mib16(re) do(sib) lab]
    fa'2(mib)\mbreak

    %79
    fa sol
    lab~lab16 fa lab fa re fa lab fa
    sol8[fa16 mib fa8 re] do4 \tuplet 3/2 {
        r8 sol'16(fa mib re)

        %82
        do8[mib16(re do sib?)] lab8 do16(sib lab sol) fa8[lab16(sol fa mib)] re8 fa16(mib re do)
    }
    si8 do sol' sol, do' re mib fa
    \appoggiatura fa sol4 si,8 do\mbreak sol4. si8

    %85
    do re mib fa \appoggiatura fa sol4 si,8 do
    sol4 r8 sol'16 fa mib do fa mib re sib? mib re
    do8 lab r re16 do sib sol do sib lab fa sib lab

    %88
    sol8 mib r lab16 sol fa re sol fa mib do fa  mib
    re8 si sol4 sol'2
    lab! si

    %91
    do16[re mib fa sol8] r\mbreak r re16[mib fa8 mib16 re]
    do4 do, r8 re'16[mib fa8 mib16 re]
    do4 r sib'2~\solo

    %94
    sib lab
    sol4. fa8 mib sib mib16 fa sol lab
    sib8 sib, r4 re8[sib mib16 fa sol lab]

    %97
    sib8 sib, r4 re8[sib mib16 fa sol lab]
    sib4 r8 sol lab do,(mib lab)\mbreak
    r4 r8 la sib re,(fa sib)

    %100
    r4 r8 si do mib,(sol do)
    r fa, (lab? do) r re,(fa sib)
    r mib,(sol sib) r do,(mib lab)

    %103
    r re,(fa lab) r sib,(re sol)
    r do,(mib sol) r lab,(do fa)\mbreak
    r sib,(re fa) r sib,(re fa)

    %106
    r sib,(mib sol) sol-.\p(sol-. sol-. sol-.)
    sol16 fa(mib) re(do8) sib lab-.(lab-. lab-. lab-.)
    fa'-.(fa-. fa-. fa-.) fa16 mib(re) do(sib8) lab

    %109
    sol8-.(sol-. sol-. sol-.) r2
    lab,16\f do mib lab do8 mib,fa fa' do[la]\mbreak
    sib,16 re fa sib re8 fa, sol sol' re[si]

    %112
    do do'4\p mib,8 mib4(fa8) mib
    mib4(re8) do do4.(sib?8)
    sib'4. re,8 re4(mib8) re

    %115
    re4(do8) sib sib4. lab8
    lab'4. do,8 do4(re8) do
    do4(sib8) lab lab4.(sol8)\mbreak

    %118
    R1*2
    sib'8 r16 do32 sib sib4\tr mib8 r16 do32 sib sib4\tr
    mib8 r16 do32 sib sib4\tr mib8 mib,16. fa32 fa4\tr

    %122
    mib16 sib mib sib sol' mib sib' sol mib sib mib sib sol' mib sib' sol
    sib8 mib,16 fa re4\tr\mbreak mib16 sib, mib sib sol' mib sib' sol
    mib sib mib sib sol' mib sib' sol sol8 mib16 fa re4\tr

    %125
    mib r8 sib''16\f  lab sol mib lab sol fa re sol fa  %% ripresa da metà battuta
    mib8 do r fa16 mib re sib mib re do lab re do
    sib8 sol r do16 sib lab fa sib lab sol mib lab sol

    %128
    fa8 re sib4 sib'2\mbreak
    do re
    mib16 [fa sol lab sib8] r r fa16[sol lab8 sol16 fa]

    %131
    mib4\upl mib,\upl r8 fa'16\p[sol lab8 sol16 fa]
    mib4\upl mib,\upl r8 fa16\f[sol lab8 sol16 fa]
    mib4\upl sol,\upl r8 fa'16 [sol lab8 sol16 fa]

    %134
    mib4\fermata r r2

}

IvlIIIn =  \relative do'' {

    sib,8
    sib4. mib8 mib4. sol8
    sol4. sib8 sib sol mib sib
    sol'4 r8 lab lab4(sol8) sol

    %4
    sol4(fa8) fa mib sib sib4
    sib fa' mib8 sib sib4
    sib\p fa' mib8 sib sib4

    %7
    mib'8\f fa sol lab \appoggiatura lab sib4 re,8 mib\mbreak
    sib4. re8\p mib fa sol lab
    \appoggiatura lab sib4 re,8 mib sib4. lab'8

    %10
    sol fa mib4 sol\f r8 do,
    do4. fa8 sol,4\upl sol\upl
    fa8 do do4 fa'\p r8 sib,

    %13
    sib4. mib8 fa,4 fa
    mib8 sib sib[sib'\f] sib4(do8) re
    re4(mib8) fa\mbreak fa4(sol8) la

    %16
    sib fa re sib sib4\p(do8) re
    re4(mib8) fa fa4(sol8) la
    sib4 r8 sib,\f sib mib lab, re

    %19
    sol,4 r8 do fa, sib mib, lab
    re,4 r8 sol do, fa sib, mib
    sib4 r sib'2~\mbreak

    %22
    sib lab
    sol8 fa mib r r re'16[mib fa8 mib16 re]
    sol4 sol, r8 re'16\p[mib fa8 mib16 re]

    %25
    sol4 sol, r8 re16\f[mib fa8 mib16 re]
    sol4 sib, r8 re16[mib fa8 mib16 re]
    mib4 r mib8\tu fa sol mib  %%%fine ripresa

    %28
    lab sib do lab sib, do re sib
    mib re mib sib\mbreak mib fa sol fa
    mib fa sol mib lab sib do lab

    %31
    sib, do re sib mib fa sol mib
    re mib re sib mib fa sol re
    mib fa sol re mib fa sol re

    %34
    mib fa sol re mib fa sol fa
    mib4 r r2
    R1*18

    %54
    r2\mbreak sol4. do8
    do4(sib8) sib sib4(la8) la
    sol re re4 re la'

    %57
    sol8 re re4 re\p la'
    sol8 re re4 re'2~
    re do

    %60
    sib8 la sol r r fad'16[sol la8 sol16 fad]
    sib4 sib, r8 fad'16\p[sol la8 sol16 fad]
    sib4 sib,\mbreak r8 fad16\f[sol la8 sol16 fad]

    %63
    sol4 r r2
    R1*11
    do,8 re mib do fa sol lab fa

    %76
    sib, do re sib mib fa sol mib
    lab, sib do lab re mib fa re
    sol, la si sol do re mib do\mbreak

    %79
    fa mib fa reb do re mi do
    fa sol lab fa si, la si sol
    do do' fa, sol do,4 do

    %82
    do do re sol,
    sol8 do sol' sol, do' re mib fa
    \appoggiatura fa sol4 si,8 do\mbreak sol4. si8

    %85
    do re mib fa \appoggiatura fa sol4 si,8 do
    sol4 r8 sol sol do fa, sib?
    mib,4 r8 lab re, sol do, fa

    %88
    sib,4 r8 mib lab, re sol, do
    si2 sol'~
    sol fa

    %91
    mib8 re do r\mbreak r si'16[do re8 do16 si]
    mib4 mib, r8 si'16[do re8 do16 si]
    do4 r mib,8\tu fa sol mib

    %94
    lab sib do lab sib, do re sib
    mib re mib sib mib4 r
    sol8 fa sol mib sib'8 sib, r4

    %97
    sol'8 fa sol mib sib' sib, r4
    R1*14
    r8 do'\tu\p si do r do si do

    %113
    r do, re mib fa sol lab sib?
    sib, sib' la sib r sib la sib
    r sib, do re mib fa sol lab?

    %116
    lab, lab' sol lab r lab sol lab
    r lab, sib do re mib fa sol\mbreak
    sol, mib' sol mib r mib sol mib

    %119
    r mib sol mib r mib sib' sib,
    mib mib sol mib r mib sol mib
    r mib sol mib r mib sib' sib,

    %122
    mib4 r r2
    R1*2
    r4 r8 sib'\f sib mib lab, re

    %126
    sol,4 r8 do fa, sib mib, lab
    re,4 r8 sol do, fa sib, mib
    sib4 r sib'2~\mbreak

    %129
    sib lab
    sol8 fa mib r r re'16[mib fa8 mib16 re]
    sol4 sol, r8 re'16\p[mib fa8 mib16 re]

    %132
    sol4 sol, r8 re16\f[mib fa8 mib16 re]
    sol4 sib, r8 re16[mib fa8 mib16 re]
    mib4\fermata r r2

}

Ivlan = \relative do' {

    sol8
    sol4. sib8 sib4. mib8
    mib4. sol8 sol mib sib sol
    sib4 r8 mib mib4 sib

    %4
    sib sib8 sib sib4 sol
    fa sib sib sol
    fa\p sib sib sol

    %7
    sib'4.\f lab8 sol4 fa8 sol\mbreak
    mib4. re8\p sib'4. lab8
    sol4 fa8 sol mib4. re8

    %10
    sib'4 sib sib\f r8 fa
    sol4. lab8 sol4 do,
    do lab lab'\p r8 mib

    %13
    fa4. sol8 fa4 sib,
    sib sol8 sol'\f fa re do sib
    r sib' lab sol\mbreak fa sol fa mib

    %16
    re mib fa mib re\p re do sib
    r sib' lab sol fa sol fa mib
    re re\f fa sib sib lab lab sol %%%%%% ripresa

    %19
    sol mib mib fa fa mib mib re
    re sib sib do do sib sib lab
    sib4 fa'8 re sol lab sib sol\mbreak

    %22
    mib4. do'8 fa,4. re8
    sib4. sol8 re' sib' sib sib
    sib4 sib, re8\p sib' sib sib

    %25
    sib4 sib, re8\f sib sib sib
    sib4 mib, re'8 sib sib sib
    sol4 r mib'8 fa sol mib  %% fine ripresa

    %28
    lab sib do lab sib, do re sib
    mib re mib sib\mbreak mib fa sol fa
    mib fa sol mib lab sib do lab

    %31
    sib, do re sib mib fa sol mib
    re mib re sib mib fa sol re
    mib fa sol re mib fa sol re

    %34
    mib fa sol re mib fa sol fa
    mib4 r r2
    R1*18

    %54
    r2\mbreak sib4. sol'8
    sol4 re re re
    re8 re re4 la fad'

    %57
    re sib la\p fad'
    re sib sib'8\f do re sib
    sol4. mib8  la,4. fad'8

    %60
    re do sib4 la8 fad' fad fad
    re4. sib8 la_\markup {[\musicglyph #"p"]}  fad' fad fad
    re4. sib8\mbreak la\f re re re

    %63
    sib4 r r2
    R1*11
    do8 re mib do fa sol lab fa

    %76
    sib, do re sib mib fa sol mib
    lab, sib do lab re mib fa re
    sol, la si sol do re mib do\mbreak

    %79
    fa mib fa reb do re mi do
    fa sol lab fa si, la si sol
    do do' fa, sol do,4 do

    %82
    do do re sol,
    sol8 do sol' sol, sol'4. fa8
    mib4 re8 mib\mbreak do4. si8

    %85
    sol'4. fa8 mib4 re8 mib
    do si re si sol' fa fa mib
    mib do do re re do do sib

    %88
    sib sol sol lab! lab sol sol fa
    sol2 mib'8 fa sol mib
    do4. fa8 re4. si8

    %91
    sol4. mib8\mbreak re' si si si
    sol4 sol8 mib' re si si si
    sol4 r mib'8 fa sol mib

    %94
    lab sib do lab sib, do re sib
    mib re mib sib mib4 r
    sol8 fa sol mib sib'8 sib, r4

    %97
    sol'8 fa sol mib sib' sib, r4
    R1*14
    r8 do'\p si do r do si do

    %113
    r do, re mib fa sol lab sib?
    sib, sib' la sib r sib la sib
    r sib, do re mib fa sol lab?

    %116
    lab, lab' sol lab r lab sol lab
    r lab, sib do re mib fa sol\mbreak
    sol, mib' sol mib r mib sol mib

    %119
    r mib sol mib r mib sib' sib,
    mib mib sol mib r mib sol mib
    r mib sol mib r mib sib' sib,

    %122
    mib4 r r2
    R1*2
    r4 r8 sib'\f sib lab lab sol %%%%%% ripresa

    %126
    sol mib mib fa fa mib mib re
    re sib sib do do sib sib lab
    sib4 fa'8 re sol lab sib sol\mbreak

    %129
    mib4. do'8 fa,4. re8
    sib4. sol8 re' sib' sib sib
    sib4 sib, re8\p sib' sib sib

    %132
    sib4 sib, re8\f sib sib sib
    sib4 mib, re'8 sib sib sib
    sol4\fermata r r2

}

Ibcn = \relative do {

    r8
    mib fa sol fa mib fa sol fa
    mib fa sol fa mib re mib mib,
    mib' re mib mib, mib' re mib mib,

    %4
    sib' do re sib mib fa sol mib
    re do re sib mib fa sol mib
    re\p do re sib mib fa sol fa

    %7
    mib\f re mib fa sol lab sib lab\mbreak
    sol fa mib sib\p mib re mib fa
    sol lab sib lab sol fa mib sib

    %10
    mib fa sol fa mi\f fa sol fa
    mi fa sol fa mi re mi do
    fa sol lab fa re\p mib? fa mib

    %13
    re mib fa mib re do re sib
    mib fa sol mib\f sib sib' lab sol
    fa sol fa mib\mbreak re mib re do

    %16
    sib do re do sib\p sib' lab sol
    fa sol fa mib re mib re do
    sib sib'\f re sib mib do re sib  %%%% ripresa

    %19
    do sib do lab sib sol lab fa
    sol fa sol mib fa re mib do
    re do re sib mib fa sol mib\mbreak

    %22
    lab sib do lab sib lab sib sib,
    mib fa sol mib sib sib' sib sib,
    mib fa sol mib sib\p sib' sib sib,

    %25
    mib fa sol mib sib sib' sib sib,
    mib fa sol mib sib sib' sib sib,
    mib,4 r r2 %%%%5 fine ripresa

    %28
    R1*7
    sol'4 sol sol sol
    lab lab\mbreak lab lab

    %37
    la la la la
    sib sib sib sib
    si si si si

    %40
    do fa sib,? mib
    lab, re sol, do\mbreak
    fa, sib mib, fa

    %43
    sib mib lab, re
    sol, do fa, sib
    mib,8 sol mib sol mib sol mib sol

    %46
    sib, re sib re sib re sib re
    mib sol mib sol mib sol mib sol\mbreak
    sib, sib' sol mi do re mi do

    %49
    fa do' la fad re mi fad re
    sol la? sib la sol re sib sol
    do' re mib! re do sol mib! do

    %52
    re4 re re re
    re re re re
    sol,8 sol' do, re\mbreak sol fad sol sol,   %%% inizio pag. 6

    %55 OK
    sol' fad sol sol, re' mi fad re
    sol la! sib sol fad mi fad re
    sol la sib sol fad\p mi fad re

    %58
    sol la sib la sol\f la sib sol
    do, re mib? do re mi! fad re
    sol la sib sol re re' re re,

    %61
    sol la sib sol re_\markup {[\musicglyph #"p"]} re' re re,
    sol la sib sol re\f re' re re,
    sol, r sol' r do, r re r

    %64
    sol, r sol' r do, r re r
    sol, r sol r sol r sol r
    do r do r do r do r

    %67
    fa r fa r\mbreak fa r fa r
    sib, r sib r sib r sib r
    mib r mib r mib r mib r

    %70
    do r do r do r do r
    sol' r sol r sol, r sol r
    do do' mi, do fa fad mi re\mbreak

    %73
    sol lab! sol fa mib do' mi,! do
    fa fad mi re sol lab! sol fa
    mib4 r r2

    %76
    R1*7
    r2 do8 si do re
    mib fa sol fa\mbreak mib re do sol

    %85
    do si do re mib fa sol fa
    mib sol si sol do lab sib?  sol
    lab sol lab fa sol mib fa re

    %88
    mib re mib do re si do la
    si la? si sol do re mib do
    fa sol lab fa sol, la si sol

    %91
    do re mib do\mbreak sol sol' sol sol,
    do re mib do sol sol' sol sol,
    do4 r r2

    %94
    R1*4
    mib8 fa sol mib lab, sib do lab\mbreak
    fa' sol la fa sib, do re sib

    %100
    sol' la si sol do, re mib do
    fa sol lab? fa sib? do re sib
    mib, fa sol mib lab sib do lab

    %103
    re, mib fa re sol lab sib sol
    do, re mib do fa sol lab fa\mbreak
    sib, do re sib sib' do re sib

    %106
    mib, fa sol mib mib2\p~
    mib fa~
    fa sib,

    %109
    mib  mib4_\markup {[\musicglyph #"f"]} r
    lab, r la r\mbreak
    sib r si r8 sol

    %112
    do4 r r2
    R1*9
    mib8 mib mib mib mib mib mib mib

    %123
    mib mib sib' sib,\mbreak mib mib mib mib
    mib mib mib mib  mib mib sib' sib,
    mib4 r8 sib' mib do re sib  %%%% ripresa

    %126
    do sib do lab sib sol lab fa
    sol fa sol mib fa re mib do
    re do re sib mib fa sol mib\mbreak

    %129
    lab sib do lab sib lab sib sib,
    mib fa sol mib sib sib' sib sib,
    mib fa sol mib sib\p sib' sib sib,

    %132
    mib fa sol mib sib_\markup {[\musicglyph #"f"]} sib' sib sib,
    mib fa sol mib sib sib' sib sib,
    mib,4\fermata r r2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mib\major
    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 57
    \partial 8 s8
    s1*134
    \bar"||"

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

    do16. mib,32
    fa8 re'16. fad,32 sol8 mib'16. sol,32 lab8 fa' r si,16. do32
    fa,?8 [sol16. lab32 sol8 sol,] do8 \once\stemDown sol'' sol4~
    sol8[fa16. sol32 lab8 sol] fa fa fa4~

    %4
    fa8[mib16. fa32 sol8 fa] mib8 mib mib4~
    mib8[re16. mib32 fa8 mib] mib\tr re r16 sol(si re)\mbreak
    mib4~mib32 re-.(do-. sib?-. lab-. sol-. fa-. mib-.) fa4 r16 fa(lab do)

    %7
    re4~re32 do-. (sib-. lab-. sol-. fa-. mib-. re-.) mib4 r16 mib(sol sib)
    do4~do32 sib-.(lab-. sol-. fa-. mib-. re-. do-.) re re(do re fa8\noBeam) lab32 lab(sol lab re8\noBeam)
    mib16\p[(re do sib lab sol fa mib)] sib8\f mib16. fa32 fa4\tr

    %10
    mib'16\p[(re do sib lab sol fa mib)] sib8\f mib16. fa32 fa4\tr
    \parenthesize mib8 \parenthesize sol, \parenthesize sol'4 \mbreak mib8 sib sib'4~
    sib8[lab16. sol32 lab8 fa'] \appoggiatura mib re mib r sol,

    %13
    fa \appoggiatura mib re16. do32 sib8 \once\stemDown re' mib mib, r mib'
    fa2 mib
    re4. do16 sib la [re,] \appoggiatura mib8 re32(do re16) sol4~\mbreak

    %16
    sol16 [re] \appoggiatura mib8 re32(do re16) sib'4~sib16 [re,]  \appoggiatura mib8 re32(do re16) re'4~
    re16do8 sib la sib16~sib la8 sol fad sol16~
    sol re do sib la8. sol16 sol4 r

    %19
    r2 r8 fa' fa4~
    fa8[mib16. fa32 sol8 fa] mib8 mib mib4~
    mib8[re16. mib32 fa8 mib] mib\tr re r4

    %22
    \tuplet 3/2 { lab'32(sib do fa,[sol lab)] lab,(sib do fa,[sol lab)] } re,8\noBeam r \tuplet 3/2 { sol'32(lab sib mib,[fa sol)] sol,(lab sib mib,[fa sol)] } do,8\noBeam r
    r16 fa'8 fa fa mib32 re mib-.(do-. do-. do-.) mib-.[(do-. do-. do-.)] sol'4~\mbreak
    sol8[fa16. mi32 fa8 fa] si4 do8 re

    %25
    mib re16 do si4\tr do16\p[mib(re do sib? lab sol fa)]
    mib8 do'16.\f mib,32 re4\tr do16[mib'\p(re do sib lab sol fa)]
    mib8 do'16.\f mib,32 re4\tr do r

    %28
    R1

}

IIvlIIn = \relative do'' {

    do16. mib,32
    fa8 re'16. fad,32 sol8 mib'16. sol,32 lab8 fa' r si,16. do32
    fa,?8 [sol16. lab32 sol8 sol,] do mib' mib4~
    mib8 [re16. mib32 fa8 mib] re8 re re4~

    %4
    re8[do16. re32 mib8 re] do8 do do4~
    do8 [si16. do32 re8 do] do\tr si r4
    r r16 do(mib sol) lab4~lab32 sol-.(fa-. mib-. re-- do-. sib-. lab-.)

    %7
    sib4 r16 sib(re fa) sol4~sol32 fa-.(mib-. re-. do-. sib-. lab-. sol-.)
    lab4 r16 lab(do mib) fa32 sib,(la sib re8\noBeam) fa32 fa(mib fa lab8\noBeam)
    sol16\p(fa mib re do sib lab sol) mib'8\f sol16. lab32 re,4\tr

    %10
    sol16\p(fa mib re do sib lab sol) mib'8\f sol16. lab32 re,4\tr\mbreak
    \parenthesize mib4 \parenthesize r mib4 r8 sib
    do'2 sib

    %13
    lab \tuplet 3/2 { sol16 mib(fa sol[lab sib)] } do8\upl do\upl
    \tuplet 3/2 { do16\upl re,(mib fa[sol lab)] } sib8\upl sib\upl \tuplet 3/2 { sib16 do,(re mib[fa sol)]} la8\upl la\upl
    \tuplet 3/2 { la16 sib,(do re[mi fad)]} sol8\upl sol\upl fad re r16 re16\noBeam re32(do re16)\mbreak

    %16
    la'4~la16 re, \appoggiatura mib8 re32[(do re16)] do'4~do16 re, \appoggiatura mib8 re32[(do re16)]
    sib' la8 sol fad re'16~re do8 sib la sib16~
    sib sib, la sol fad8. sol16 sol4  r

    %19
    r2 r8 re' re4~
    re8[do16. re32 mib8 re] do8 do do4~\mbreak
    do8[si16. do32 re8 do] do\tr si \tuplet 3/2 { mib32(fa sol do,[re mib)] mib,\parentSlur(fa sol do,[re mib)]}

    %22
    lab,8 r \tuplet 3/2 { re'32(mib fa sib,[do re)] re,(mib fa sib, [do re)] } sol,8 r \tuplet 3/2 { do'32(re  mib lab,[sib do)] do,\parentSlur ( re mib lab,[sib do)]}
    si16 re'8 re re do32 si do4 r32 do-.(do-. do-.) mib-.[(do-. do-. do-.)]\mbreak
    lab'2~lab4 sol8 fa

    %25
    mib4 re do16\p[do'(sib lab sol fa mib re)]
    do8 sol'16.\f do,32 si4\tr do16\p[do'(sib lab sol fa mib re)]
    do8 sol'16.\f do,32 si4\tr do r

    %28
    R1

}

IIvlIIIn =  \relative do'' {

    do16. mib,32
    fa8 re'16. fad,32 sol8 mib'16. sol,32 lab8 fa' r si,16. do32
    fa,?8 [sol16. lab32 sol8 sol,] do4 r8 mib16. re32
    do8 do do do re4 r8 re16. do32

    %4
    si8 sol sol sol do4 r8 mib16. re32
    do8 fad fad fad sol[si16. lab32 sol8 sol,]\mbreak
    do[do'16. si32 do8 do] fa,[fa16. mi32 fa8 fa]

    %7
    sib?[sib16. la32 sib8 sib] mib,[mib16. re32 mib8 mib]
    lab[fa16. mib32 fa8 fa]sib,[sib'16. lab?32 sib8 sib,]
    mib2~mib8 mib sib' sib,

    %10
    mib2~mib8 mib sib' sib,
    \parenthesize mib4 \parenthesize r mib8 [mib16. fa32 sol8 mib]
    lab2~lab8[sol16. fa32 sol8 mib]

    %13
    fa[sib,16. do32 re8 sib] mib[mib'16. re32 mib8 mib]
    re[re16. do32 re8 re] do[do16. sib32 do8 do]
    sib[sib16. la32 sib8 do] re re, re re\mbreak

    %16
    re re re re re re re re
    re re re re re re re re
    sol sol, re'[re] sol, si'16. sol32 do8 mib,16. do32

    %19
    sol'8 si,16. sol32 do8 mib16. do32 sol'4 r8 sol16. fa32
    sol8 sol, sol sol do4 r8 do'16. si32\mbreak
    do8 fad, fad fad sol sol, do[do]

    %22
    fa fa sib[sib] mib, mib lab[lab]
    sol, sol sol sol do re mib do\mbreak
    fa sol lab fa sol sol, sol sol

    %25
    do fad sol[sol,] do2\p~
    do8 do'\f sol sol, do2\p~
    do8 do'\f sol sol, do do'16. mib,32 fa8 re'16. fad,32

    %28
    sol8 do fa,? sol do,2

}

IIvlan = \relative do' {

    do'16. mib,32
    fa8 re'16. fad,32 sol8 mib'16. sol,32 lab8 fa' r si,16. do32
    fa,?8 [sol16. lab32 sol8 sol,] do4 r8 mib16. re32
    do8 do do do re4 r8 re16. do32

    %4
    si8 sol sol sol do4 r8 mib16. re32
    do8 fad fad fad sol[si16. lab32 sol8 sol,]\mbreak
    do[do'16. si32 do8 do] fa,[fa16. mi32 fa8 fa]

    %7
    sib?[sib16. la32 sib8 sib] mib,[mib16. re32 mib8 mib]
    lab[fa16. mib32 fa8 fa]sib,[sib'16. lab?32 sib8 sib,]
    mib2~mib8 mib sib' sib,

    %10
    mib2~mib8 mib sib' sib,
    \parenthesize mib,4 \parenthesize r mib'8 [mib16. fa32 sol8 mib]
    lab2~lab8[sol16. fa32 sol8 mib]

    %13
    fa[sib,16. do32 re8 sib] mib[mib'16. re32 mib8 mib]
    re[re16. do32 re8 re] do[do16. sib32 do8 do]
    sib[sib16. la32 sib8 do] re re, re re\mbreak

    %16
    re re re re re re re re
    re re re re re re re re
    sol sol, re'[re,] sol si'16. sol32 do8 mib,16. do32

    %19
    sol'8 si,16. sol32 do8 mib16. do32 sol'4 r8 sol16. fa32
    sol8 sol, sol sol do4 r8 do'16. si32\mbreak
    do8 fad, fad fad sol sol, do[do]

    %22
    fa,fa sib[sib] mib, mib lab[lab]
    sol sol sol sol do re mib do\mbreak
    fa sol lab fa sol sol, sol sol

    %25
    do fad sol[sol,] do2\p~
    do8 do'\f sol sol, do2\p~
    do8 do'\f sol sol, do do'16. mib,32 fa8 re'16. fad,32

    %28
    sol8 do fa,? sol do,2

}

IIbcn = \relative do {

    do'16. mib,32
    fa8 re'16. fad,32 sol8 mib'16. sol,32 lab8 fa' r si,16. do32
    fa,?8 [sol16. lab32 sol8 sol,] do4 r8 mib16. re32
    do8 do do do re4 r8 re16. do32

    %4
    si8 sol sol sol do4 r8 mib16. re32
    do8 fad fad fad sol[si16. lab32 sol8 sol,]\mbreak
    do[do'16. si32 do8 do] fa,[fa16. mi32 fa8 fa]

    %7
    sib?[sib16. la32 sib8 sib] mib,[mib16. re32 mib8 mib]
    lab[fa16. mib32 fa8 fa]sib,[sib'16. lab?32 sib8 sib,]
    mib2~mib8 mib sib' sib,

    %10
    mib2~mib8 mib sib' sib,
    \parenthesize mib,4 \parenthesize r mib'8 [mib16. fa32 sol8 mib]
    lab2~lab8[sol16. fa32 sol8 mib]

    %13
    fa[sib,16. do32 re8 sib] mib[mib'16. re32 mib8 mib]
    re[re16. do32 re8 re] do[do16. sib32 do8 do]
    sib[sib16. la32 sib8 do] re re, re re\mbreak

    %16
    re re re re re re re re
    re re re re re re re re
    sol sol, re'[re,] sol si'16. sol32 do8 mib,16. do32

    %19
    sol'8 si,16. sol32 do8 mib16. do32 sol'4 r8 sol16. fa32
    sol8 sol, sol sol do4 r8 do'16. si32\mbreak
    do8 fad, fad fad sol sol, do[do]

    %22
    fa,fa sib[sib] mib, mib lab[lab]
    sol sol sol sol do re mib do\mbreak
    fa sol lab fa sol sol, sol sol

    %25
    do fad sol[sol,] do2\p~
    do8 do'\f sol sol, do2\p~
    do8 do'\f sol sol, do do'16. mib,32 fa8 re'16. fad,32

    %28
    sol8 do fa,? sol do,2

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mib\major
    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 40
    \partial 8 s8
    s1*28
    \bar"||"


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

    mib8 mib, sib''16 lab sol fa mib8 mib, sib''16 lab sol fa
    mib8 mib, sol'8.(lab32 sib) sib8 fa sib, lab'
    sol mib, sol'8.(lab32 sib) sib8 fa sib, lab'

    %4
    sol mib, r4 mib16(sib' sol') lab sib8 sol
    sol\tr fa r4 re,16(sib' fa') sol lab8 fa
    fa\tr mib r4\mbreak la,,16(fa' mib') fa sol8 mib

    %7
    mib\tr re r4 mib,8\pp mib' sib16 lab sol fa
    mib8 mib mib mib mib\tr re sol sol
    sol\tr fa lab lab lab\tr sol sib sib

    %10
    sib\tr lab do do do\tr sib mib[(do]
    la sib reb sib sol lab? do lab
    fad sol sib sol mi fa? lab fa)\mbreak

    %13
    re8_\upl mib?_\upl r4 mib'16\f [mib, mib mib mib mib mib mib] %%%% ripresa
    do mib  mib mib sib mib mib mib lab, mib' mib mib sol, mib' mib mib
    lab, mib' mib mib sib re re re mib4 r8 mib'' %%%% fine ripresa

    %16
    do8\tr[sib16 do re8 do] sib sol mib sib'
    lab\tr[sol16 fa sol8 mib] fa re sib4
    R1

    %19
    r2 r4 r16 sib re fa
    sol sib, mib sol sib sib, mib sol fa sib, re fa sib sib, mib sol
    fa4\tr r r2

    %22
    r r4 r16 mib sol sib
    mib mib, sol sib mib mib, sol sib do4\tr r16 do re mib
    fa fa,la do fa fa, la do\mbreak re4\tr r16 re mib fa

    %25
    sol sol, si re sol sol, si re mib4\tr r8 mib
    re16(mib fa4) re8 do16(re mib4) do8
    si16(do re4) si8 do16[(mib, re mib re mib re mib)]

    %28
    lab[(fa mi fa mi fa mi fa)] sib[(re, do re do re do re)]
    sol[(mib? re mib re mib re mib)]\mbreak lab[(do, si do si do si do)]
    fa[(re do re do re do re)] sol[(si, la? si la si la si)]

    %31
    mib32(re do8.) sol'32(fa mib8.) do'32(sib lab8.) lab32(sol fa8.)
    mib32(re do8.) sol'32(fa mib8.) do'32(sib lab8.) lab32(sol fa8.)
    mib8 sol sol,, si' do16 do mib sol do do, mib sol\mbreak

    %34
    lab do, fa lab do do, fa lab sol do, mib sol do do, mib sol
    lab do, fa lab do do, fa lab sol8 do,16 re re4\tr
    do8 do, sol''16 fa mib re do8 do, sol''16 fa mib re

    %37 p. 17
    do8 do, mib'8.(fa32 sol) sol8 re sol, fa'
    mib8 do, mib'8.(fa32 sol) sol8 re sol, fa'\mbreak
    mib16[do do do do do do do] lab do do do sol do do do

    %40
    fa, do' do do mib, do' do do fa, do' do do sol si si si
    do,[do'\p do do do do do do] lab do do do sol do do do
    fa, do' do do mib, do'\f do do fa, do' do do sol si si si

    %43
    do8 sol'\solo do mib, \once\stemUp sol,, si'' re fa,\mbreak %%% fine p. 17
    \once\stemUp do, do'' mib sol, lab, re' fa lab,
    \once\stemUp si, mib' sol si, do do, r4

    %46
    R1*2
    r8 sol' do, do' fa,,16(do' lab') sib do8 r
    r fa, sib, sib' mib,,16(sib' sol') lab sib8 r\mbreak

    %50
    r8 mib, do lab' sol,,16(re' si') do re8 r
    r2 sib'16(la sib) do re8 r
    la16(sol la) sib do8 r sib16 sol sol sib sib re re mi

    %53
    mi? fad fad sol sol re re mib? mib4 r8 do
    mib, sol do, mib'\mbreak la,16 fa fa la la do do re
    re mib mib fa fa do do re re4 r8 sib

    %56
    re, fa sib, re' sol,16 mib mib sol sol sib sib do
    do re re mib mib sib sib la la sib do8 r re,
    sib'16 do do re re mib mib fad, fad sol sol la la sib sib re,\mbreak

    %59
    re mib! mib fad fad sol sol sib, sib8 sol' re16 do sib la
    sol8 sol sol sol sol \tr fad sib\p sib
    sib\tr la do do do\tr sib re re

    %62
    re\tr do mib mib mib\tr re sol[(mib]
    dod re fa re si do? mib do
    la sib? re sib\mbreak sol lab do lab)

    %65
    fad8_\upl sol_\upl sol16 fa? mib re do sib la sol re''8 re,
    sol,4 r \tuplet 3/2 { mib'16\solo sol sib mib[sib sol] } mib8 mib'
    \tuplet 3/2 { sib16 re fa sib[fa re] } sib8 sib' sol4 \tuplet 3/2 {r16 sib lab sol[fa mib]}

    %68
    fa4 \tuplet 3/2 { r16 lab sol fa[mib re] } mib8 mib' mib4\mbreak
    \tuplet 3/2 { r16 sib lab sol[fa mib]} reb'8 sib do fa fa4
    \tuplet 3/2 { r16 do sib la[sol fa] } mib'8 do re sol sol4

    %71
    \tuplet 3/2 { r16 re do si[la sol] } fa'8 re\tuplet 3/2 { mib16\p(re) mib mib[(re) mib] mib(re) mib mib[(re) mib] }
    \tuplet 3/2 { fa,\f(mib) fa mib[(mib) fa] fa(mib) fa mib[(mib) fa] re'\p do re re[do re] re do re re[do re]}\mbreak
    \tuplet 3/2 {
        mib,\f re mib mib[re mib] mib re mib mib[re mib]  do'\p sib do do[sib do] do sib do do[sib do]

        %74
        re,\f do re re[do re] re do re re[do re] sib' lab sib sib[lab sib] lab sol lab lab[sol lab]
    }
    sol4 r8 sol(lab2)~
    lab8[fa'16-.(mib-. re-. do-. sib-. lab-.)] sol8 la(sib4)~

    %77
    sib8[sol'16-.(fa-. mi-. re-. do-.sib-.)]\mbreak la8 si(do4)
    si2\p do4(sib
    la2) sib4(lab)

    %80
    \tuplet 3/2 { sol16\f sib lab sol[fa mib] } sol,8 mib sol, sib mib sol
    \tuplet 3/2 { sol'16 sib lab sol[fa mib] } sol,8 mib sol, sib mib sol
    sol'8.\tr(fa32 sol) lab8.\tr(sol32 lab) sib8.\tr(lab32 sib) do8.\tr(sib32 do)\mbreak

    %83
    re8.\tr(do32 re) mib8.\tr(re32 mib) fa8(mib re do
    sib lab sol fa sol16)[mib32 (fa sol16) sol32(lab] sib16) mib sib sol
    lab sib, mib lab sol8 fa\tr mib4 r

    %86
    r2 \tuplet 3/2 {
        r16 sib' lab sib[(lab) sib] sol(sib) lab sib[(lab) sib]
        fa(sib) lab sib[(lab) sib] mib,(sib') lab sib[(lab) sib] re, sib'\p lab sib[lab sib] sol sib lab sib[lab sib]
        fa sib lab sib[lab sib] mib, sib' lab sib[lab sib]
    } re,8 sol16 lab fa4\tr

    %89
    mib4 r mib16\f [mib, mib mib mib mib mib mib] %%%% ripresa
    do mib  mib mib sib mib mib mib lab, mib' mib mib sol, mib' mib mib
    lab, mib' mib mib sib re re re mib4\fermata r

}

IIIvlIIn = \relative do'' {

    mib8 mib, sib''16 lab sol fa mib8 mib, sib''16 lab sol fa
    mib8 mib, sol'8.(lab32 sib) sib8 fa sib, lab'
    sol mib, sol'8.(lab32 sib) sib8 fa sib, lab'

    %4
    sol mib, r4 mib16(sib' sol') lab sib8 sol
    sol\tr fa r4 re,16(sib' fa') sol lab8 fa
    fa\tr mib r4\mbreak la,,16(fa' mib') fa sol8 mib

    %7
    mib\tr re r4 mib,8\pp mib' sib16 lab sol fa
    mib8 mib mib mib mib\tr re sol sol
    sol\tr fa lab lab lab\tr sol sib sib

    %10
    sib\tr lab do do do\tr sib mib[(do]
    la sib reb sib sol lab? do lab
    fad sol sib sol mi fa? lab fa)\mbreak

    %13
    re8_\upl mib?_\upl r4 mib'16\f [mib, mib mib mib mib mib mib] %%%% ripresa
    do mib  mib mib sib mib mib mib lab, mib' mib mib sol, mib' mib mib
    lab, mib' mib mib sib re re re mib4 r

    %16
    R1
    r2 r4 r8 mib''
    do\tr[sib16 do re8 do] sib sol mib sib'\mbreak

    %19
    lab\tr [sol16 fa sol8 mib] fa8 re sib4
    R1
    r4 r16 sib re fa sol sib, mib sol sib sib, mib sol

    %22
    fa sib, re fa sib sib, mib sol fa4\tr r
    r2 mib16 do lab mib mib' do lab mib
    do'4 r\mbreak fa16 re sib fa fa' re sib fa

    %25
    re'4 r sol16 mib do sol sol' mib do sol
    sol' re si sol sol' re si sol sol' mib do sol sol' mib do sol
    sol' re si sol sol' re si sol sol'4. fa16(mib)

    %28
    re4(do8) sib16 lab fa'4. mib16(re)
    do4(sib8) lab16 sol\mbreak mib'4. re16(do)
    sib4(lab8) sol16 fa re'4. do16(si)

    %31
    do do mib sol do do, mib sol lab do, fa lab do do, fa lab
    sol do, mib sol do do, mib sol lab do, fa lab do do, fa lab
    sol8 do,16 re re4\tr do32(re mib8.) sol32(fa mib8.)\mbreak

    %34
    do'32(sib lab8.) lab32(sol fa8.) mib32(re do8.) sol'32(fa mib8.)
    do'32(sib lab8.) lab32(sol fa8.) mib8 sol sol,, si'
    do8 do, sol''16 fa mib re do8 do, sol''16 fa mib re

    %37 p. 17
    do8 do, mib'8.(fa32 sol) sol8 re sol, fa'
    mib8 do, mib'8.(fa32 sol) sol8 re sol, fa'\mbreak
    mib16[do do do do do do do] lab do do do sol do do do

    %40
    fa, do' do do mib, do' do do fa, do' do do sol si si si
    do,[do'\p do do do do do do] lab do do do sol do do do
    fa, do' do do mib, do'\f do do fa, do' do do sol si si si

    %43
    do4 r r2
    R1
    r2 r8 sol'\solo do mib,

    %46
    \once\stemUp  sol,, si'' re fa, \once\stemUp do, do'' mib sol,
    lab, re' fa lab, \once\stemUp si, mib' sol si,
    do do, r4 r8 do fa, fa'

    %49
    sib,,16(fa' re') mib fa8 r r sib, mib, mib'\mbreak
    lab,,16(mib' do') re mib8 r r re sol, sol'
    re,16(la' fad') sol la8 r sol16(fad sol) la sib8 r

    %52
    fad16(mi? fad) sol la8 r r2
    r mib16 do do mib mib sol sol la
    la? sib sib do do sol sol la!\mbreak la?4 r8 fa

    %55
    la,? do fa, fa' re16 sib sib re re fa fa sol
    sol lab? lab sib sib fa fa sol sol4 r8 mib
    sol, sib mib, sol' fad16 sol la8 r fad

    %58
    sol16 la? la sib sib do do re, re mib! mib fad fad sol sol sib,\mbreak
    sib do do re re mib mib sol, sol8 sol' re16 do sib la
    sol8 sol sol sol sol \tr fad sib\p sib

    %61
    sib\tr la do do do\tr sib re re
    re\tr do mib mib mib\tr re sol[(mib]
    dod re fa re si do? mib do

    %64
    la sib? re sib\mbreak sol lab do lab)
    fad8_\upl sol_\upl sol16 fa? mib re do sib la sol re''8 re,
    sol,4 r r \tuplet 3/2 { r16 sib''\solo lab sol[fa mib] }

    %67
    fa4 \tuplet 3/2 { r16 lab sol fa[mib re] mib, sol sib mib[sib sol] } mib8 mib'
    \tuplet 3/2 {sib16 re fa sib[fa re]} sib8 sib' \tuplet 3/2 { sol16 sib lab sol[fa mib] sol sib lab sol[fa mib] }\mbreak  %%%%% fine primo sistema p. 20
    sol lab sib4 sol8 \tuplet 3/2 { lab16 do sib la[sol fa] la do sib la[sol fa] }

    %70
    la sib do4 la8 \tuplet 3/2 { si16 re do si[la sol] si re do si[la sol] }
    si do re4 si8 \tuplet 3/2 {
        do16\p(si) do do[(si) do] do(si) do do[(si) do]
        lab?\f(sol) lab lab[(sol) lab] lab(sol) lab lab[(sol) lab] sib?\p lab sib sib[lab sib] sib lab sib sib[lab sib]

        %73
        sol\f fa sol sol[fa sol] sol fa sol sol[fa sol] lab\p sol lab lab[sol lab] lab sol lab lab[sol lab]
        fa\f mib fa fa[mib fa] fa mib fa fa[mib fa] sol fa sol sol[fa sol] fa mib fa fa[mib fa]
    }
    mib4 r8 mib fa2~

    %76
    fa8[re'16-.(do-. sib-. lab-. sol-. fa-.)] mib8 fa(sol4)~
    sol8[mi'16-.(re-. do-. sib -. la-. sol-.)]\mbreak fa8 sol(lab?4)
    sol\p(fa mi2)

    %79
    fa4(mib! re2)
    r \tuplet 3/2 { sol16\f sib lab sol[fa mib] } sol,8 mib
    sol, sib mib sol \tuplet 3/2 { sol'16 sib lab sol[fa mib] } sol,8 mib

    %82
    sol,4 r sol''8.\tr(fa32 sol) lab8.\tr(sol32 lab)
    sib8.\tr(lab32 sib) do8.\tr(sib32 do) re8(do sib lab
    sol fa mib re mib4) r

    %85
    r2 r16 mib32 [(fa sol16) sol32(lab] sib16) mib sib sol
    lab sib, mib lab sol8 fa\tr \tuplet 3/2 {
        mib16 sol fa  sol[fa sol]  mib sol fa  sol[fa sol]
        re sol fa sol[fa sol] do, sol' fa sol[fa sol] sib, sol '\p fa sol[fa sol] mib sol fa sol[fa sol]

        %88
        re sol fa sol[fa sol] do, sol' fa sol[fa sol]
    } sib,8 mib16 fa re4\tr
    mib4 r mib16\f [mib, mib mib mib mib mib mib] %%%% ripresa
    do mib  mib mib sib mib mib mib lab, mib' mib mib sol, mib' mib mib

    %91
    lab, mib' mib mib sib re re re mib4\fermata r

}

IIIvlIIIn =  \relative do'' {

    mib8 mib, sib''16 lab sol fa mib8 mib, sib''16 lab sol fa
    mib8 mib, sol'8.(lab32 sib) sib8 fa sib, lab'
    sol mib, sol'8.(lab32 sib) sib8 fa sib, lab'

    %4
    sol mib, r4 mib16(sib' sol') lab sib8 sol
    sol\tr fa r4 re,16(sib' fa') sol lab8 fa
    fa\tr mib r4\mbreak la,,16(fa' mib') fa sol8 mib

    %7
    mib\tr re r4 mib,8\pp mib' sib16 lab sol fa
    mib8 mib mib mib mib\tr re mib mib
    mib\tr re fa fa fa\tr mib sol sol

    %10
    sol\tr fa lab lab lab\tr sol sol[(mib')]
    do (reb) r reb (sib do) r do(
    la sib) r sib(sol lab?) r lab\mbreak

    %13
    fa_\upl sol_\upl r4 mib'16\f [mib, mib mib mib mib mib mib] %%%% ripresa
    do mib  mib mib sib mib mib mib lab, mib' mib mib sol, mib' mib mib
    lab, mib' mib mib sib re re re mib4 r8 sol\tu

    %16
    lab fa sib lab sol fa sol mib
    fa re mib do sib4 r8 sol'
    lab fa sib lab sol fa sol mib\mbreak

    %19
    fa re mib do sib4 <<{r8^\markup\italic"Pmi" sib'
                         sol sol sol sol sib fa sol[sol]
                         sib fa fa fa sib sol sol sol

                         %22
                         sib fa sol[sol] sib fa sol sol}\\{r_\markup\italic"2di" re mib mib mib mib re re mib mib
                                                             re re re re mib mib mib mib
                                                             re re mib mib re re mib mib}>>
    R1*4
    r2 mib8\tu fa mib do

    %28
    fa4. lab8 re, mib re sib
    mib4. sol8\mbreak do, re do lab
    re4. fa8 si, do si sol

    %31
    do re mib do fa4 r8 fa
    do re mib do fa4 r8 fa
    do' do, sol sol' do, re mib do\mbreak

    %34
    fa4 r8 fa do re mib do
    fa4 r8 fa do' do, sol sol'
    do do, sol''16 fa mib re do8 do, sol''16 fa mib re

    %37 p. 17
    do8 do, mib'8.(fa32 sol) sol8 re sol, fa'
    mib8 do, mib'8.(fa32 sol) sol8 re sol, fa'\mbreak
    mib16[do do do do do do do] lab do do do sol do do do

    %40
    fa, do' do do mib, do' do do fa, do' do do sol si si si
    do,[do'\p do do do do do do] lab do do do sol do do do
    fa, do' do do mib, do'\f do do fa, do' do do sol si si si

    %43
    do4 r r2
    R1*15
    r2 sol8 sol' re16 do sib la

    %60
    sol8 sol sol sol sol \tr fad sol\p sol
    sol\tr fad la la la\tr sol sib sib
    sib\tr la do do do\tr sib sib[sol'](

    %63
    mi fa) r fa(re mib?) r mib(
    do re) r re(\mbreak sib do) r do
    la8_\upl sib_\upl sol16 fa? mib re do sib la sol re''8 re,

    %66
    sol,4 r r2
    R1*8
    r2 r8 sib'\tu fa re

    %76
    sib4 r mib r8 do'
    mi,4 r\mbreak fa4 r8 fad
    sol_\markup {[\musicglyph #"p"]} sol sol sol do, do do do

    %79
    fa fa fa fa sib, sib sib sib
    mib4 r r2
    R1*8

    %89
    r2 mib'16\f [mib, mib mib mib mib mib mib] %%%% ripresa
    do mib  mib mib sib mib mib mib lab, mib' mib mib sol, mib' mib mib
    lab, mib' mib mib sib re re re mib4\fermata r

}

IIIvlan = \relative do' {

    sol'16 sol sol sol fa fa fa fa sol sol sol sol fa fa fa fa
    sol sol sol sol sib sib sib sib fa [fa fa fa fa fa fa fa]
    sib[sib sib sib sib sib sib sib] fa[fa fa fa fa fa fa fa]

    %4
    sib,[sib sib sib sib sib sib sib] sib sib sib sib mib mib mib mib
    mib[mib re re re re re re] re[re re re re re re re]
    sol sol sol sol mib mib mib mib\mbreak do do do do do do sol' sol

    %7
    sol8 fa r4  sol,8\pp sol fa fa
    sol sol sol sol fa fa sib sib
    sib re re re sib sib mib mib

    %10
    mib sib sib re sib sib sol[sol]
    fa fa fa fa mib mib mib mib
    re? re re re do do do do'\mbreak

    %13
    sib_\upl sib_\upl r4 sol8\f sol sol sol % ripresa
    do do sib sib lab lab sol sol
    lab lab sib sib mib4 r8 sol

    %16
    lab fa sib lab sol fa sol mib
    fa re mib do sib4 r8 sol'
    lab fa sib lab sol fa sol mib\mbreak

    %19
    fa re mib do sib4 r8 sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %22
    sib sib sib sib sib sib sib sib
    R1*4
    r2 mib8 fa mib do

    %28
    fa4. lab8 re, mib re sib
    mib4. sol8\mbreak do, re do lab
    re4. fa8 si, do si sol

    %31
    do re mib do fa4 r8 fa
    do re mib do fa4 r8 fa
    do' do, sol sol' do, re mib do\mbreak

    %34
    fa4 r8 fa do re mib do
    fa4 r8 fa do' do, sol sol'
    mib16 mib mib mib re re re re mib mib mib mib re re re re

    %37
    mib mib mib mib sol sol sol sol re[re re re re re re re]
    sol[sol sol sol sol sol sol sol] re[re re re re re re re]\mbreak
    sol,[sol sol sol sol sol sol sol] fa'8 fa mib mib

    %40
    re re do do re re sol, sol
    do\p do do do fa fa mib mib
    re re do do _\markup {[\musicglyph #"f"]}re re sol, sol

    %43
    do4 r r2\mbreak
    R1*15
    r2 sib8 sib la la

    %60
    sib sib sib sib la la re\p re
    re fad fad fad re re sol sol
    sol re la' fad re re sib[sib]

    %63
    la la la la sol sol sol' sol
    fa fa fa fa\mbreak mib mib mib mib
    re re sol16 fa? mib re do sib la sol re''8 re,

    %66
    sol,4 r r2
    R1*8
    r2 r8 sib'\tu fa re

    %76
    sib4 r mib r8 do'
    mi,4 r\mbreak fa4 r8 fad
    sol_\markup {[\musicglyph #"p"]} sol sol sol do, do do do

    %79
    fa fa fa fa sib, sib sib sib
    mib4 r r2
    R1*8

    %89
    r2 sol,8\f sol sol sol % ripresa
    do do sib sib lab lab sol sol
    lab lab sib sib mib4\fermata r % fine ripresa

}

IIIbcn = \relative do {

    mib16 mib mib mib re re re re mib mib mib mib re re re re
    mib[mib mib mib mib mib mib mib] re[re re re re re re re]
    mib[mib mib mib mib mib mib mib] re[re re re re re re re]

    %4
    mib[mib mib mib mib mib mib mib] mib[mib mib mib mib mib mib mib]
    sib[sib sib sib sib sib sib sib] sib[sib sib sib sib sib sib sib]
    do[do do do do do do do] fa,[fa fa fa fa fa fa fa]

    %7
    sib8 sib r4 mib8\pp mib re re
    mib mib mib mib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %10
    sib sib sib sib mib mib mib[mib]
    mib reb reb reb reb do do do
    do sib sib sib sib lab lab lab \mbreak

    %13
    lab_\upl sol_\upl r4 mib'8\f mib mib mib %% ripresa
    do do sib sib lab lab sol sol
    lab lab sib sib mib4 r %%%%% fine ripresa

    %16
    R1*7
    sol8 fa sol mib lab sol lab lab,
    la' sol la fa\mbreak sib la sib sib,

    %25
    si' la si sol do si do do,
    si' la si si, do' si do do,
    sol' fa sol sol, r2

    %28
    R1*8
    do16 do do do si si si si do do do do si si si si
    do[do do do do do do do] si[si si si si si si si]

    %38
    do[do do do do do do do] si[si si si si si si si]\mbreak
    do8 do do do fa fa mib mib
    re re do do re re sol, sol

    %41
    do\p do do do fa fa mib mib
    re re do do _\markup {[\musicglyph #"f"]}re re sol, sol
    do4 r sol r\mbreak

    %44
    do r fa r
    sol r do, r
    sol r do r

    %47
    fa r sol r
    do, r8 mi fa4 r8 la
    sib4 r8 re, mib4 r8 sol\mbreak

    %50
    lab?4 r8 do, si4 r8 sol'
    fad4 r8 re sol4 r8 sol,
    re'4 r8 re sol re sib sol

    %53
    r2 do'8 sol mib do
    r2\mbreak fa'8 do la fa
    r2 sib8 fa re sib

    %56
    r2 mib'8 sib sol mib
    r2 re'8 la fad re
    sol re sib sol re'' la fad re\mbreak

    %59
    sol re sib sol sol' sol fad fad
    sol sol sol sol re re re\p re
    re re re re re re re re

    %62
    re re re re sol sol sol sol
    sol fa fa fa fa mib mib mib
    mib re re re\mbreak re do do do

    %65
    do sib sol'16 fa mib re do sib la? sol re''8 re,
    sol,4 r mib' r
    sib r mib r

    %68
    sib r mib8 sol sol sol\mbreak
    mib4 r lab,8 fa' fa fa
    fa4 r si,?8 sol' sol sol

    %71
    sol4 r do, r
    fa8 fa fa fa sib,4 r\mbreak
    mib8 mib mib mib lab,4 r

    %74
    re8 re re re sol, mib' fa[sib,]
    mib fa sol mib r2
    R1*4

    %80
    mib4 mib mib mib
    mib mib mib mib
    mib r mib r\mbreak

    %83
    sib r sib2~
    sib mib8 fa sol mib
    sib2 mib8 fa sol mib

    %86
    sib2 mib4 r
    R1
    r2 r8 mib sib' sib,

    %89
    mib4 r mib8\f mib mib mib %% ripresa
    do do sib sib lab lab sol sol
    lab lab sib sib mib4\fermata r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key mib\major
    \time 4/4
    \tempo 2 = 50
    s1*91
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
#(set-global-staff-size 15.7)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup {"Concerto con 2 Violini obbligati [RV 515]"}
    composer = \markup \center-column{"A. Vivaldi (1678-1741)"}
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
            \set Staff.instrumentName = \markup \center-column{"[Violini""P.mi & 2di]"}
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
            \override StaffGrouper.staffgroup-staff-spacing.padding = #0.5
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

\markup\huge "[2.] Largo"

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

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override StaffGrouper.staffgroup-staff-spacing.padding = #0.5
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override StaffGrouper.staffgroup-staff-spacing.padding = #0.5
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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
