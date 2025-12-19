\language "italiano"
	%********************************** VARIABILI

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
      \musicglyph "scripts.prall"}}
mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    R1*9
    r2 r8 sib' sib sib
    si[si si la16 si] do4 r

    %12
    r2 r8 la la la
    la[la la\tr sol16 la] sib4 r
    r2 r8 sol sol sol

    %15
    sol[sol sol\tr fa16 sol] la4 r
    r2 r8 fad fad fad\mbreak
    fad?[fad fad\tr mi16 fad!] sol4 r

    %18
    sol r sol r
    sol r \once\stemDown sol16 sol,, sol sol sib sol sol sol
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol

    %21
    si sol sol sol si sol sol sol do sol sol sol do sol sol sol
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    dod sol sol sol dod sol sol sol\mbreak \once\stemUp re'8 la''(sib do)

    %24
    r la(sib do) r la(sib do)
    sib8.[la16 sol fa mib re] sol8.[fa16 mib re do sib]
    mib8.[re16 do sib la sol] fad4 r16 fad' sol la

    %27
    sib8 sol la fad sol4 r
    R1*11
    r2 r8 sib sib sib

    %40
    sib la16 sol la4 r8 la la la
    la sol16 fa sol4 r8 sol sol sol
    sol fa16 mib fa4 r8 fa fa fa\mbreak

    %43
    fa mib16 re mib4 r8 mib mib mib
    mib? [do16 re mib!8 mib] mib la(sib do)
    r la(sib do) re sib do la

    %46
    sib4 r r2
    R1*8
    r2 sol8 r sol r

    %56
    fa r fa r mib r mib r
    re r re r do4 r
    r2 sol'8 r sol r

    %59
    fa r fa r mib r mib r
    re r re r do4 r
    r2 r8 sol' sol sol

    %62
    lab lab lab sol fad fad fad fad
    sol sol sol fa? mi mi mi mi
    fa fa fa mib re re re re

    %65
    mib16 mib, mib mib sol mib mib mib sol mi mi mi sol mi mi mi\mbreak
    lab fa fa fa lab fa fa fa la fad fad fad la fad fad fad
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol

    %68
    do sol sol sol do sol sol sol re' sol, sol sol re' sol, sol sol
    mib'4 r r2
    R1*6

    %76
    r2 r8 sib'8 sib sib
    do do do sib lab lab lab lab
    sib sib sib lab sol sol sol sol

    %79
    la? la la sol fad fad fad fad
    sol4 r r2
    R1

    %82
    fad4 r r2\mbreak
    R1
    sol4 r r2

    %85
    R1*8
    sol,,16 sol sol sol sib sol sol sol si sol sol sol si sol sol sol
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol

    %95
    \once\stemUp re'8 la''(sib do) r la(sib do)
    sib8.[la16 sol fa mib re] sol8.[fa16 mib re do sib]
    mib8.[re16 do sib la sol] fad4 r16 fad'? sol la

    %98
    sib8 sol la fad sol2\fermata

}

IvlIIn = \relative do'' {

    R1*9
    r2 r8 sol' sol sol
    fa[fa fa\tr mib16 re] mib4 r

    %12
    r2 r8 fa fa fa
    mib[mib mib\tr re16 do] re4 r
    r2 r8 mib mib mib

    %15
    re[re re\tr do16 sib] do4 r
    r2 r8 re re re\mbreak
    do[do do\tr sib16 la] sib4 r

    %18
    sib r sib r
    sib r sib16 sol, sol sol sib sol sol sol
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol

    %21
    si sol sol sol si sol sol sol do sol sol sol do sol sol sol
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    dod sol sol sol dod sol sol sol\mbreak \once\stemUp re'8 fad'(sol la)

    %24
    r fad(sol la) r fad(sol la)
    sol8.[fa?16 mib re do sib] mib8.[re16 do sib la sol]
    sol'8.[fa16 mib re do sib]  la4 r16 la sib do

    %27
    re8 sib do la sib4 r
    R1*12
    r8 mib mib mib mib re16 do do4

    %41
    r8 re re re re do16 sib do4
    r8 do do do do sib16 la sib4\mbreak
    r8 sib sib sib sib la16 sol la4

    %44
    do8[la16 sib do8 do] do fa(sol la)
    r fa(sol la) sib re, mib do
    re4 r r2

    %47
    R1*8
    r2 mib8 r mib r
    do r re r sib r do r

    %57
    la! r si r sol4 r
    r2 mib'8 r mib r
    do r re r sib r do r

    %60
    la r si r sol4 r
    r2 r8 mib' mib mib
    mib? mib mib mib re re re re

    %63
    re re re re do do do do
    do do do do sib sib sib sib
    sib16 mib, mib mib sol mib mib mib sol mi mi mi sol mi mi mi\mbreak

    %66
    lab fa fa fa lab fa fa fa la fad fad fad la fad fad fad
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol
    do sol sol sol do sol sol sol re' sol, sol sol re' sol, sol sol

    %69
    mib'4 r r2
    R1*6
    r2 r8 sol sol sol

    %77
    sol sol sol sol fa fa fa fa
    fa fa fa fa mib mib mib mib
    mib? mib mib mib re re re re

    %80
    sib4 r r2
    R1
    re4 r r2\mbreak

    %83
    R1
    sib4 r r2
    R1*8

    %93
    sol,16 sol sol sol sib sol sol sol si sol sol sol si sol sol sol
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    \once\stemUp re'8 fad'(sol la) r fad(sol la)

    %96
    sol8.[fa?16 mib re do sib] mib8.[re16 do sib la sol]
    sol'8.[fa16 mib re do sib]  la4 r16 la sib do
    re8 sib do la sib2\fermata

}

IvcIn = \relative do {

    sol8 [sol'16 fad sol8 sol,] \clef tenor sib' do? re mib
    \clef bass sol,,8 [sib'16 la sib8 sol, ]\clef tenor re'' mib? fad sol
    \clef bass sol,,8 [sol'16 fad sol8 sol,] \clef tenor sib' do? re mib

    %4
    \clef bass \once\stemUp sol,,8[re''16 do re8 sib]\once\stemUp  sol,[do'16 sib do8 la]
    \clef bass \once\stemUp sol,8[re''16 do re8 sib]\once\stemUp  sol,[do'16 sib do8 la]
    sib,16 re sol re sib re sol re sib8 re sol sib

    %7
    re,16 sol sib sol re sol sib sol re8 sol sib re
    sol,16 sib re sib sol sib re sib\mbreak  sol8\clef tenor sib re sol
    \once\stemUp re, fa' \once\stemUp do, mib' \clef bass \once\stemUp sib, re'\once\stemUp la, do'

    %10
    \once\stemUp sol, sib'\once\stemUp fad, la' \once\stemDown sib sol, sol sol
    sol sol sol sol do\clef tenor mib' mib mib
    mi![mi mi\tr re16 mi] fa8 \clef bass fa, fa fa

    %13
    fa fa fa fa \once\stemUp sib, re' re re
    re[re re\tr do16 re] mib8 mib, mib mib
    mib? mib mib mib \once\stemUp la, do' do do

    %16
    do [do do\tr sib16 do] re8 re, re re\mbreak
    re re re re sol,4 r
    \once\stemUp sol16[sib' la sol fa mib re do] \once\stemUp sib[re' do sib la sol fa mib]

    %19
    re[\clef tenor sol' fa mib re do sib la] sol\clef bass sol, sol sol sib sol sol sol
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol
    si sol sol sol si sol sol sol do sol sol sol do sol sol sol

    %22
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    dod sol sol sol dod sol sol sol\mbreak re'4 r
    re r re r

    %25
    sol,8 sol sol sol sol sol sol sol
    sol sol sol sol re'4 r16 do sib la
    sol8 sol' do, re sol16 la sib do re sib la sol

    %28
    la sib do re mib do sib la sib8 la16 sol la8 sol16 fad
    sol8 re sol,4 r2
    r\mbreak sol'16 la sib do re sib la sol %% inizio riga centrale p 3 bar 30

    %31
    mib'8 sol, mib sol fa16 sol la sib do la sol fa
    re'8 fa, re fa mib16 fa sol la sib sol fa mib
    do'8 do, la do re16 sib' do sib re sib do sib

    %34
    re, sib' do sib re sib do sib mib, sib' do sib re sib do sib
    mib, sib' do sib re sib do sib fa la sib la do la sib la
    fa la sib la do la sib la\mbreak sib,4 r

    %37
    re r mib r
    mib? r fa r
    fa, r sib8 sib sib sib

    %40
    do do do do fa fa fa fa
    sib, sib sib sib mib mib mib mib
    la, la la la re re re re\mbreak

    %43
    sol, sol sol sol do do do do
    fa,4 r fa r
    fa r sib8 sib' mib, fa

    %46
    sib16 re do sib la sib la sol fa sib la sol fa sol fa mib
    re sol fa mib re mib re do sib sib re fa sib4
    sib, r sib r

    %49
    sib \clef tenor r16 sib' la sib\mbreak do do sib do re re do re
    mib mib re mib fa fa mib fa sol sol fa sol la la sol la
    sib[sib sib sib sib la sol fa] sol[sol sol sol sol fa mib re]

    %52
    la'[la la la la sol fa mib] fa[fa fa fa fa mib re do]
    sol'[sol sol sol sol fa mib re] mib[mib mib mib mib re do sib]
    fa'[fa fa fa fa mib re do] re[do sib la sib do re mib]\mbreak

    %55
    fa8[mib16(re) do(si)  do(re)] mib8[sol16 fa sol si,? lab sol]
    lab8 fa'16 mib fa lab, sol fa sol8 mib'16 re mib sol, fa mib
    fa8 re'16 do re fa, mib re mib sol la si do\clef bass mib, re do

    %58
    \once\stemUp sol do' re do \once\stemUp sol, do' re si do4 mib,4
    fa re\mbreak mib?8 r do r
    re r si r do4 mib8 do

    %61
    sol4 sol do8 do do do
    do do do do do do do do
    sib sib sib sib sib sib sib sib

    %64
    la la la la la la la la
    sol16 mib' mib mib sol mib mib mib sol mi mi mi sol mi mi mi\mbreak
    lab fa fa fa lab fa fa fa la fad fad fad la fad fad fad

    %67
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol
    do sol sol sol do sol sol sol re' sol, sol sol re' sol, sol sol
    \clef tenor mib'16 mib mib mib sol mib mib mib \clef bass sol,, \clef tenor re'' re re fa re re re

    %70
    \once\stemUp \clef bass do,,\clef tenor mib'' mib mib sol mib mib mib\clef bass sol,,\clef tenor re'' re re fa re re re
    \once\stemUp \clef bass do,,\clef tenor mib'' mib mib sol mib mib mib lab8 lab lab sol
    fa16 re re re fa re re re sol8 sol sol fa

    %73
    mib16 do do do mib do do do fa8 fa fa mib
    \clef bass  re16[do sib lab sol fa mib re] do8 sib mib'16 re do sib
    lab8 sol mib'16 re do sib lab8 sol mib'16 re do sib

    %76
    lab8 sol lab fa mib8 mib mib mib\mbreak
    mi! mi mi mi fa fa fa fa
    re re re re mib mib mib mib

    %79
    do do do do re re re re
    sol16[fa mib re do sib la sol] \clef tenor sol'8 sib re sol
    \clef bass sol,16[fa mib re do sib la sol] \clef tenor sol'8 sib re sol

    %82
    \clef bass re,16[do sib la sol fad mi re] re'8 fad la re\mbreak
    \clef bass re,16[do sib la sol fad mi re] re'8 fad la re
    \clef tenor sol,16 sol' fa sol sol, sol' fa sol sol, sol' fa sol sol, sol' fa sol

    %85
    mib8 do mib sol r do, mib sol
    fa,16 fa' mib fa fa, fa' mib fa fa, fa' mib fa fa, fa' mib fa
    re8 sib re fa r sib, re fa\mbreak

    %88
    mib,16 mib' re mib mib, mib' re mib mib, mib' re mib mib, mib' re mib
    do8 la do mib r la, do mib
    re,16 re' do re re, re' do re  re, re' do re  re, re' do re

    %91
    sib do sib do re mib re mib sib do sib do re mib re mib
    sib do sib do re mib re mib fad,8  re' la, dod'\mbreak
    \clef bass sol,16 sol sol sol sib sol sol sol si sol sol sol si sol sol sol

    %94
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    re'4 r re r
    sol,8 sol sol sol sol sol sol sol

    %97
    sol sol sol sol re'4 r16 do sib la
    sol8 sol' do, re sol,2\fermata

}

IvcIIn = \relative do {

    R1
     sol8 [sol'16 fad sol8 sol,] \clef tenor sib' do? re mib
    \clef bass sol,,8 [sol'16 fad sol8 sol, ]\clef tenor re'' mib? fad sol

    %4
    \clef bass\once\stemUp  sol,,[sib'16 la sib8 sol] \once\stemUp  sol,[la'16 sol la8 fad]
    \clef bass\once\stemUp  sol,[sib'16 la sib8 sol] \once\stemUp  sol,[la'16 sol la8 fad]
    sol,16 sib re sib sol sib re sib sol8 sib re sol

    %7
    sib,16 re sol re sib re sol re sib8 re sol sib
    re,16 sol sib sol re sol sib sol\mbreak re8 sol sib re
    \once\stemUp sib, re' \once\stemUp la, do' \once\stemUp sol, sib' \once\stemUp fa, la'

    %10
    \once\stemUp mib, sol' \once\stemUp re, fad' sol sol, sol sol
    sol sol sol sol do do' do do
    sib[sib sib\tr la!16 sol] la8 fa fa fa

    %13
    fa fa fa fa sib, sib' sib sib
    la[la la sol16 fa] sol8 mib mib mib
    mib? mib mib mib la, la' la la

    %16
    sol[sol sol fad16 mi?] fad8 re re re\mbreak
    re re re re sol,16[sol' fa mib re do sib la]
    sol[sol' fa mib re do sib la] \once\stemUp sol[sib' la sol fa mib re do]

    %19
    sib[sib' la sol fa mib re do] sib sol sol sol sib sol sol sol
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol  %%% fin qui OOKK
    si sol sol sol si sol sol sol do sol sol sol do sol sol sol

    %22
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    dod sol sol sol dod sol sol sol\mbreak re'4 r
    re r re r

    %25
    sol,8 sol sol sol sol sol sol sol
    sol sol sol sol re'4 r16 do sib la
    sol8 sol' do, re sol,4 sol'~

    %28
    sol fad sol8 sib, do re
    sol16 la sib do re sib la sol la sib do re mib do sib la
    sib8 la16 sol la8 sol16 fad?\mbreak sol8 re sol,4  %% inizio ultima riga p.3 bar 30

    %31
    do16 re mib fa sol mib re do la'8 do, la do
    sib16 do re mib fa re do sib sol'8 sib, sol sib
    la16 sib do re mib do sib la fa'4 r

    %34
    sib, r mib r
    mib? r fa r
    fa, r\mbreak sib16 sib' do sib re sib do sib

    %37
    re, sib' do sib re sib do sib mib, sib' do sib re sib do sib
    mib, sib' do sib re sib do sib fa la sib la do la sib la
    fa la sib la do la sib la sib,8 sib sib sib

    %40
    do do do do fa fa fa fa
    sib, sib sib sib mib mib mib mib
    la, la la la re re re re\mbreak

    %43
    sol, sol sol sol do do do do
    fa,4 r fa r
    fa r sib8 sib' mib, fa

    %46
    sib,4 r sib r
    sib r sib'16 re do sib la sib la sol
    fa sib la sol fa sol fa mib re sol fa mib re mib re do

    %49
    sib sib re fa sib4\mbreak la, sib
    do re mib fa
    sib, do8 re \clef tenor mib'16 [mib mib mib mib re do sib]

    %52
    do[do do do do sib la sol] re'[re re re re do sib la]
    sib[sib sib sib sib la sol fa] do'[do do do do sib la sol]
    la[la la la la sol fa mib?] sib'4 r

    %55
    \clef bass si,2 do4 mib
    fa8 r re r mib r do r
    re r si r do4 mib8 do

    %58
    sol r sol r r \clef tenor sol''16 fa sol si,? lab sol
    lab8 fa'16 mib fa lab, sol fa\mbreak sol8 mib'16 re mib sol, fa mib
    fa8 re'16 do re fa, mib re mib sol la si do\clef bass mib, re do

    %61
    \once\stemUp sol16 do' re do \once\stemUp sol, do' re si do,8 do do do
    do do do do do do do do
    sib sib sib sib sib sib sib sib

    %64
    la la la la la la la la
    sol16 mib' mib mib sol mib mib mib sol mi mi mi sol mi mi mi\mbreak   %% Fin qui ookk
    lab fa fa fa lab fa fa fa la fad fad fad la fad fad fad

    %67
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol
    do sol sol sol do sol sol sol re' sol, sol sol re' sol, sol sol
    mib' do do do mib do do do \once\stemUp sol, si' si si re si si si

    %70
    \once\stemUp do,, do'' do do mib do do do\once\stemUp sol, si' si si re si si si\mbreak
    do,,4 r r16 lab'' lab lab do lab lab lab
    re8 re re do sib?16 sol sol sol sib sol sol sol

    %73
    do8 do do sib lab16 fa fa fa lab fa fa fa
    sib[lab sol fa mib re do sib] lab8 sol do'16 sib lab sol
    fa8 mib do'16 sib lab sol fa8 mib do'16 sib lab sol

    %76
    fa8 mib fa re mib8 mib mib mib\mbreak
    mi! mi mi mi fa fa fa fa
    re re re re mib mib mib mib

    %79
    do do do do re re re re
    sol,4 r sol'16[fa mib re do sib la? sol] %% scale incrociate
    \clef tenor sol'8 sib re sol \clef bass sol,16[fa mib re do sib la sol]

    %82
    re'8 fad la re re,16[do sib la sol fad mi re]\mbreak
    re'8 fad la re re,16[do sib la sol fad mi re]
    sol4 r r2

    %85
    do16 do' sib do do, do' sib do do, do' sib do do, do' sib do
    la8 fa la do r fa, la do
    sib,16 sib' la sib sib, sib' la sib sib, sib' la sib sib, sib' la sib\mbreak

    %88
    sol8 mib sol sib r mib, sol sib
    la,16 la' sol la la, la' sol la la, la' sol la la, la' sol la
    fad8 re fad la r re, fad la

    %91
    sol16 la sol la sib do sib do sol la sol la sib do sib do
    sol la sol la sib do sib do re,8 sib' \parenthesize dod, la'\mbreak
    sol,16 sol sol sol sib sol sol sol si sol sol sol si sol sol sol

    %94
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    re'4 r re r
    sol,8 sol sol sol sol sol sol sol

    %97
    sol sol sol sol re'4 r16 do sib la
    sol8 sol' do, re sol,2\fermata

}

Ivlan = \relative do' {

    R1*9
    r2 r8 re re re
    re re si si sol4 r

    %12
    r2 r8 do do do
    do do la la fa4 r
    r2 r8 sib sib sib

    %15
    sib sib sol sol re4 r
    r2 r8 la'' la la\mbreak
    la la fad fad re4 r

    %18
    re r re r
    re r re16 sol, sol sol sib sol sol sol
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol

    %21
    si sol sol sol si sol sol sol do sol sol sol do sol sol sol
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    dod sol sol sol dod sol sol sol\mbreak re'4 r

    %24
    re r re r
    sol,8 sol sol sol sol sol sol sol
    sol sol sol sol re'4 r16 mib re do

    %27
    sib8 re mib re re4 r
    R1*11
    r2 r8 re re re

    %40
    sol sol mib mib do do la la
    fa' fa re re sib sib sol sol
    mib' mib do do la la fa fa\mbreak

    %43
    re' re sib sib sol sol mib mib
    la4 r la' r
    la r fa8 fa sol fa

    %46
    fa4 r r2
    R1*8
    r2 do'8 r do r

    %56
    lab r sib r sol r lab r
    fa r sol r mib4 r
    r2 do'8 r do r

    %59
    lab r sib r sol r lab r
    fa r sol r mib4 r
    r2 r8 sol sol sol

    %62
    mib mib mib sol la la la la
    sib sib sib sib sol sol sol sol
    la la la la fa fa fa fa

    %65
    sol16 mib mib mib sol mib mib mib sol mi mi mi sol mi mi mi\mbreak
    lab fa fa fa lab fa fa fa la fad fad fad la fad fad fad
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol

    %68
    do sol sol sol do sol sol sol re' sol, sol sol re' sol, sol sol
    mib'4 r r2
    R1*6

    %76
    r2 r8 sib sib sib
    sol sol sol sol do, do do do
    fa fa fa fa sib, sib sib sib

    %79
    mib mib mib mib la la la fad
    re4 r r2
    R1

    %82
    la4 r r2
    R1
    re4 r r2

    %85
    R1*8
    sol,16 sol sol sol sib sol sol sol si sol sol sol si sol sol sol
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol

    %95
    re'4 r re r
    sol,8 sol sol sol sol sol sol sol
    sol sol sol sol re'4 r16 mib re do

    %98
    sib8 re mib re re2\fermata

}


Ibcn = \relative do {

    sol4 r sol r
    sol r sol r
    sol r sol r

    %4
    sol r sol r
    sol r sol r
    sol8 sol sol sol sol4 r

    %7
    sol8 sol sol sol sol4 r
    sol8 sol sol sol sol4 r
    sib8 r la r sol r fa r

    %10
    mib r re r sol sol sol sol
    sol sol sol sol do do do do
    do do do do fa fa fa fa

    %13
    fa fa fa fa sib, sib sib sib
    sib sib sib sib mib mib mib mib
    mib? mib mib mib la, la la la

    %16
    la la la la re re re re\mbreak
    re re re re sol,4 r
    sol r sol r

    %19
    sol r sol16 sol sol sol sib sol sol sol
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol  %%% fin qui OOKK
    si sol sol sol si sol sol sol do sol sol sol do sol sol sol

    %22
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    dod sol sol sol dod sol sol sol\mbreak re'4 r
    re r re r

    %25
    sol,8 sol sol sol sol sol sol sol
    sol sol sol sol re'4 r16 do sib la
    sol8 sol' do, re sol,4 sol'~

    %28
    sol fad sol8 sib, do re
    sol,4 sol'2 fad4
    sol8 sib, do re sol, 4 sol

    %31
    do do fa, fa
    sib sib mib mib
    la, la sib r

    %34
    sib r mib r
    mib? r fa r
    fa, r\mbreak sib r

    %37
    re r mib r
    mib? r fa r
    fa, r sib8 sib sib sib

    %40
    do do do do fa fa fa fa
    sib, sib sib sib mib mib mib mib
    la, la la la re re re re\mbreak

    %43
    sol, sol sol sol do do do do
    fa,4 r fa r
    fa r sib8 sib' mib, fa

    %46
    sib,4 r sib r
    sib r sib r
    sib r sib r

    %49
    sib r8 sib\mbreak la4 sib
    do re mib fa
    sib, do8 re mib4 fa8 sol

    %52
    la,4 sib8 do re4 mib8 fa
    sol,4 la8 sib do4 re8 mib
    fa,4 sol8 la sib4 r\mbreak

    %55
    si2 do8 r mib r
    fa r re r mib r do r
    re r si r do4 mib8 do

    %58
    sol r sol r  do r mib r
    fa r re r\mbreak mib? r do r
    re r si r do4 mib8 do

    %61
    sol4 sol do8 do do do
    do do do do do do do do
    sib sib sib sib sib sib sib sib

    %64
    la la la la la la la la
    sol16 mib' mib mib sol mib mib mib sol mi mi mi sol mi mi mi\mbreak
    lab fa fa fa lab fa fa fa la fad fad fad la fad fad fad

    %67
    sib sol sol sol sib sol sol sol si sol sol sol si sol sol sol
    do sol sol sol do sol sol sol re' sol, sol sol re' sol, sol sol
    mib'4 r sol,, r

    %70
    do, r sol' r\mbreak
    do, r fa' r
    sib, r mib r

    %73
    lab, r re r
    sib r lab8 sol mib16 fa sol lab
    sib8 mib, mib16 fa sol lab sib8 mib, mib16 fa sol lab

    %76
    sib8 mib lab,[sib] mib8 mib mib mib\mbreak
    mi! mi mi mi fa fa fa fa
    re re re re mib mib mib mib

    %79
    do do do do re re re re
    sol,4 r sol r
    sol r sol r

    %82
    re' r re r\mbreak
    re r re r
    sol sol sol sol

    %85
    do, do do do
    fa fa fa fa
    sib, sib sib sib\mbreak

    %88
    mib mib mib mib
    la, la la la
    re re re re

    %91
    sol, r sol r
    sol r re8 sol dod,?[dod'?]\mbreak
    sol16 sol sol sol sib sol sol sol si sol sol sol si sol sol sol

    %94
    do sol sol sol do sol sol sol dod sol sol sol dod sol sol sol
    re'4 r re r
    sol,8 sol sol sol sol sol sol sol

    %97
    sol sol sol sol re'4 r16 do sib la
    sol8 sol' do, re sol,2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 55
    s1*98
    \bar"|."

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

IvcI = {
    \global
    \clef bass
    <<\IvcIn \forma>>

}

IvcII = {
    \global
    \clef bass
    <<\IvcIIn \forma>>

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

}\version "2.24.0"


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvcIn = \relative do {

    sol'8 sib16. re32 sol8 re mib\tr re r sib
    do\tr sib r re mib16. re32 re16. do32 do16. sib32 sib16. la32
    la8 re16. mi?32 fad8 mi16. re32 sol2~

    %4
    sol8 fa?16 mi fa8 mi16 re mi8 la, sol' fa16 mi
    fa la sol fa mi8.\tr re16 re2\fermopz\mbreak
    \clef bass re,8 fa16. la32 re8 la sib\tr la r fa

    %7
    sol\tr fa r \clef tenor fa' sol16. fa32 fa16. mi32 mi16. re32 re16. dod32
    dod?8 la fa'4~fa8 mi16 re mi4~
    mi8 re16 do re4~re8 do16 sib do4~

    %10
    do8 sib16 la sib4~sib8 do16 re do sib la sol
    la8 fa do'4~\mbreak do8[re16 mib re do sib la]
    sib8 sol mib'4~mib8[re16 do sib8 la]

    %13
    sib8 sol r re' mib\tr re r sib
    do\tr sib r re mib\tr re r sib
    do\tr sib r re sol[re16 do sib8 la16 sol]

    %16
    re' sol fad sol la,8.\tr sol16 sol2\fermata

}

IIvcIIn = \relative do {

    r2 sol'8 sib16. re32 sol8 re
    mib\tr re r sib do16. sib32 sib16. la32 la16. sol32 sol16. fad32
    fad?4 r \clef bass re8 sol16. la32 sib8 la16. sol32

    %4
    dod4 re~re dod
    \clef tenor re16 fa mi re dod8.\tr re16 re2\fermata\mbreak
    r \clef bass re,8 fa16. la32 re8 la

    %7
    sib\tr la r8 \clef tenor re mi16. re32 re16. dod32 dod16. si32 si16. la32
    la4 r8 \clef bass la sib4. la16 sol
    la4. sol16 fa sol4. fa16 mi

    %10
    fa4. mi16 re mi4. mi8
    fa4 r8 fa16 sol\mbreak la8[sib16 do sib la sol fad]
    sol4 r8\clef tenor  sol' fad4. fad8

    %13
    sol sol, r sib do\tr sib r8 re
    mib\tr re r sib do\tr sib r re
    mib\tr re r4 r2

    %16
    \clef bass r16 sib la sib fad8.\tr sol16 sol2\fermata

}


IIbcn = \relative do {

    sol'8 sol, r sol do sol r sol
    do sol sib[sol] do4. do8
    re4 do sib sol

    %4
    la re la'4. la,8
    re sol la la, re2\fermopz\mbreak
    re8 re, r re' sol, re r re'

    %7
    sol re fa re sol,4. sol8
    la4 r8 re sol4 do,
    fa sib, mi la,

    %10
    re sol, do4. do8
    re4 r\mbreak  fad4. fad8
    sol4 r8 do, re4. re8

    %13
    sol sol, sib sol r sol sib sol
    r sol sib sol r sol sib sol
    r sol sib sol r2

    %16
    sol4 re' sol,2\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 40
    s1*5
    \bar ":..:"\break
    s1*11
    \bar":|."

}

IIvcI = {
    %\notypeset
    \global
    \clef tenor
    <<\IIvcIn \forma>>

}

IIvcII = {
    \global
    \clef tenor
    <<\IIvcIIn \forma>>

}

IIbc = {
    \global
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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \con
}

IIIvlIn = \relative do'' {

    sol'8 sib,4 do mib8
    re fad,4 sol sib8
    la re,4 mi fad8

    %4
    sol re sib la sol r
    sib''8 re,4 mib sol8
    fa la,4 sib re8

    %7
    do fa,?4 sol la8
    sib fa re do sib r
    re'' fa,4 sol sib8

    %10
    la dod,4 re fa8
    mi la,4 si dod8\mbreak
    re la fa mi re r

    %13
    fa' re'4 fa,8 mi dod'
    re re,4 fa,8 mi dod'
    re re la fa re r

    %16
    R2.*24
    re'8 fa,4 sol sib8
    la dod,4 re fa8

    %42
    mi la,4 si \parenthesize dod8\mbreak
    re re' la fa re r
    fa' la,4 sib re8

    %45
    do mi,4 fa la8
    sol do,4 re mi8
    fa fa' do la fa r

    %48
    la' do,4 re fa8
    mi sold,4 la do8
    si mi,4 fad sold8

    %51
    la mi do si la \once\stemDown mi''
    la do,4 si sold'8
    la do,4 si \parenthesize sold'8

    %54
    la4 r r
    R2.*18
    sib8 re,4 mib sol8

    %74
    fa la,4 sib re8
    do fa,4 sol la8
    sib fa re do sib r

    %77
    fa'' la,4 sib re8
    do mi,4 fa la8
    sol do,4 re mi8

    %80
    fa fa' la, sol fa r
    do'' mib,4 fa lab8
    sol si,4 do mib8

    %83
    re sol,4 la si8\mbreak
    do sol mib re do r
    mib' do'4 mib,8 re si'

    %86
    do do,4 mib,8 re si'
    do4 r r
    sol'16[sol sol sol sol sol sol sol sol sol sol sol]

    %89
    R2.
    sol16[sol sol sol sol sol sol sol sol sol sol sol]
    R2.

    %92
    sib16[sib sib sib sib sib sib sib sib sib sib sib]\mbreak
    R2.
    fad16[fad fad fad fad fad fad fad fad fad fad fad]

    %95
    R2.
    sol16[sol sol sol sol sol sol sol sol sol sol sol]
    R2.*25

    %122
    sol8 sib,4 do mib8
    re fad,4 sol sib8
    la re,4 mi fad8

    %125
    sol re sib la sol r\mbreak
    sib' sol'4 sib,8 la fad'
    sol sol,4 sib,8 la fad'

    %128
    sol sol'4 sib,8 la fad'
    sol sol,4 sib,8 la fad'
    sol2.\fermata

}

IIIvlIIn = \relative do'' {

    sol'8 sib,4 do mib8
    re fad,4 sol sib8
    la re,4 mi fad8

    %4
    sol re sib la sol r
    sib''8 re,4 mib sol8
    fa la,4 sib re8

    %7
    do fa,?4 sol la8
    sib fa re do sib r
    re'' fa,4 sol sib8

    %10
    la dod,4 re fa8
    mi la,4 si dod8\mbreak
    re la fa mi re r

    %13
    fa' re'4 fa,8 mi dod'
    re re,4 fa,8 mi dod'
    re re la fa re r

    %16
    R2.*24
    re'8 fa,4 sol sib8
    la dod,4 re fa8

    %42
    mi la,4 si \parenthesize dod8\mbreak
    re re' la fa re r
    fa' la,4 sib re8

    %45
    do mi,4 fa la8
    sol do,4 re mi8
    fa fa' do la fa r

    %48
    la' do,4 re fa8
    mi sold,4 la do8
    si mi,4 fad sold8

    %51
    la mi do si la \once\stemDown mi''
    la do,4 si sold'8
    la do,4 si \parenthesize sold'8

    %54
    la4 r r
    R2.*18
    sib8 re,4 mib sol8

    %74
    fa la,4 sib re8
    do fa,4 sol la8
    sib fa re do sib r

    %77
    fa'' la,4 sib re8
    do mi,4 fa la8
    sol do,4 re mi8

    %80
    fa fa' la, sol fa r
    do'' mib,4 fa lab8
    sol si,4 do mib8

    %83
    re sol,4 la si8\mbreak
    do sol mib re do r
    mib' do'4 mib,8 re si'

    %86
    do do,4 mib,8 re si'
    do4 r r
    re16[re re re re re re re re re re re]

    %89
    R2.
    mib16[mib mib mib mib mib mib mib mib mib mib mib]
    R2.

    %92
    fa16[fa fa fa fa fa fa fa fa fa fa fa]\mbreak
    R2.
    la16[la la la la la la la la la la la]

    %95
    R2.
    sib16[sib sib sib sib sib sib sib sib sib sib sib]
    R2.*25

    %122
    sol8 sib,4 do mib8
    re fad,4 sol sib8
    la re,4 mi fad8

    %125
    sol re sib la sol r\mbreak
    sib' sol'4 sib,8 la fad'
    sol sol,4 sib,8 la fad'

    %128
    sol sol'4 sib,8 la fad'
    sol sol,4 sib,8 la fad'
    sol2.\fermata

}

IIIvcIn = \relative do {

    sol'8 fa mib re do sol'
    fad mi? re do sib re'
    do [sib la sol fad mi16 re]

    %4
    sol8 re sib la sol sol'
    sib la sol fa mib sib'
    la sol fa? mib re fa

    %7
    mib [re do sib la sol16 fa]
    sib'8 fa re do sib sib'
    re do sib la sol re'

    %10
    dod si la sol fa la
    sol[fa mi? re dod si16 la]\mbreak
    re'8 la fa mi re la'

    %13
    re, mi fa re la' la,
    re mi fa re la' la,
    re re' la fa re r %% OOKK

    %16
    sol, \clef tenor sib'4 re sol8
    mib sol16(fa) mib16(re) do(sib) la8 sol
    \clef bass fa, \clef tenor la'4 do fa8

    %19
    re8 fa16(mib) re(do) sib(la) sol8 fa
    \clef bass mib, \clef tenor sol'4 sib mib8\mbreak
    do8[mib16(re) do(sib) la(sol)] fad8 mi

    %22
    \clef bass re, fad'4 la re8
    sib4 sol,8 sol sol sol
    sol4 sol8 sol sol sol

    %25
    sol4 sol8 sol sol sol
    <<re''8\\{re,8[\once\slurUp re'16 (dod))]}>> re(re,) re'(re,) re'(re,) re'(re,)
    <<do'?8\\{re, \once\slurUp do'16 (sib)}>> do(re,) do'(re,) do'(re,) do'(re,)

    %28
    <<sib'8\\{re, \slurUp sib'16(la)}>> sib(re,) sib'(re,) sib'(re,) sib'(re,)\mbreak
    <<la'4\\re,>> r r
    \clef tenor r16 re re sol sol sib sib re re sol sol dod,

    %31
    dod?8\clef bass la mi dod la\noBeam r
    \clef tenor r16 re re fa fa la la re re fa fa mib
    mib? sol sol dod, dod mi mi la, la dod dod sol

    %34
    \clef bass sol sib sib mi, mi sol sol dod, dod mi mi la,
    la4 r16 dod [re mi fa \parenthesize sol \parenthesize la \parenthesize si?]
    \clef tenor dod mi dod la dod mi dod la dod mi dod la

    %37
    re fa re la re fa re la re fa re la
    dod mi dod la dod mi dod la dod mi dod la
    \tuplet 3/2 { re8.(mi16 fa8) sib,8.[(dod?16 re8)] \clef bass dod,8.(re16 mi8)}

    %40
    re' do? sib? la sol re'
    dod? si la sol fa la
    sol fa mi re dod si\mbreak

    %43
    re re' la fa re re'
    fa, mi re do? sib? fa'
    mi re do sib la do'

    %46
    sib[ la sol fa mi re16 do]
    fa8 fa' do la fa la
    la sol fa mi re la'

    %49
    sold fad mi re do mi
    re[do si la sold fad16 mi]
    la8 mi' do si la la'

    %52
    la si do re mi mi,
    la si do re mi mi,\mbreak
    la16 mi fa mi la mi fa mi la mi fa mi

    %55
    si' mi, fa mi si' mi, fa mi si' mi, fa mi
    do'8 la mi do la4
    sold r8 mi' sold mi

    %58
    \clef tenor mi'16 fa mi la, mi' fa mi la, mi' fa mi la,
    sol4(mi' sol)
    mi16 fa mi la, mi' fa mi la, mi' fa mi la,

    %61
    fa4(la re)
    re16 mi re la re mi re la re mi  re la\mbreak
    sol4(sib re)

    %64
    do16 re do fa, do' re do fa, do' re do fa,
    fa4(la do)
    sib16 do sib fa sib do sib fa sib do sib fa

    %67
    do4(mi sol)
    do16(sib do re) do(sib do re) sib(la sib do)
    la sib la fa la sib la fa la sib la fa

    %70
    la4(do mib)
    re~re16[do sib la sib do re mib]
    fa8 sib, do4.\tr sib8\mbreak

    %73
    sib la sol fa mib sib'
    \clef bass la sol fa mib re fa
    mib [re do sib la sol16 fa]

    %76
    sib8 fa' re do sib sib'
    \clef tenor fa' mi? re do sib fa'
    mi re do sib la\clef bass do

    %79
    sib[la sol fa mi re16 do]
    fa8 fa' la, sol fa si
    do si?  lab sol fa do'

    %82
    si la? sol fa mib sol
    fa [mib? re do si la16 sol]\mbreak
    do8 sol' mib re do sol'

    %85
    do, re mib do sol' sol,
    do re mib do sol' sol,
    \clef tenor mib''16 do mib do mib do mib do mib do mib do

    %88
    \clef bass sol,16[sol sol sol sol sol sol sol sol sol sol sol]
    \clef tenor fa''16 [re fa re fa re fa re fa re fa re]
    \clef bass do,[do do do do do do do do do do do]

    %91
    \clef tenor mib'[do mib do mib do mib do mib do mib do]
    \clef bass sib,[sib sib sib sib sib sib sib sib sib sib sib]\mbreak  %%inizio seconda riga p 7a
    \clef tenor re'[sib re sib re sib re sib re sib re sib]

    %94
    \clef bass re,[re re re re re re re re re re re]
    \clef tenor mib'[do mib do mib do mib do mib do mib do]
    \clef bass sol,[sol sol sol sol sol sol sol sol sol sol sol]

    %97
    sol8\clef tenor sib'4 re sol8
    \clef bass re, \clef tenor la'4 re fad8
    \clef bass sol,,\clef tenor sib'4 re sol8

    %100
    fad\clef bass fad, re la fad r\mbreak
    re''[do16 sib la sol fa mib] re8 fa
    mib do mib sol do r

    %103
    mib8[re16 do sib la sol fa] mi?8 sol
    fad re fad la re r
    \clef tenor fad[mi16 re do sib la sol] fad8 la

    %106
    sol mib sol sib mib r
    sol[fa16 mib re do sib la] sol8 mib'
    fad,(re fad la) do4

    %109
    \clef bass sib8 fad sol sib, do re
    sol,2 r4\mbreak
    do2 r4

    %112
    do2 r4
    re2 r4
    re2 r4

    %115
    mib2 r4
    mib?2 r4
    re2 r4

    %118
    sol8 re mib sib do re\mbreak
    \once\stemUp sol,16 sib' sib sib re, sib' sib sib re, sib' sib sib
    re, la' la la re, la' la la re, la' la la

    %121
    re, la' la la re, la' la la re, la' la la
    sol8 fa mib re do sol'
    fad mi? re do sib re'

    %124
    do[sib la sol fad mi16 re]
    sol8 re sib la sol re'\mbreak
    sol la sib sol re'[re,]

    %127
    sol, la sib sol re'[re,]
    sol' la sib sol re'[re,]
    sol, la sib sol re'[re,]

    %130
    sol2.\fermata

}

IIIvcIIn = \relative do {

    sol'8 fa mib re do sol'
    fad mi? re do sib re'
    do [sib la sol fad mi16 re]

    %4
    sol8 re sib la sol sol'
    sib la sol fa mib sib'
    la sol fa? mib re fa

    %7
    mib [re do sib la sol16 fa]
    sib'8 fa re do sib sib'
    re do sib la sol re'

    %10
    dod si la sol fa la
    sol[fa mi? re dod si16 la]\mbreak
    re'8 la fa mi re la'

    %13
    re, mi fa re la' la,
    re mi fa re la' la,
    re re' la fa re r %% OOKK

    %16
    sol, la sib la sib sol
    do4 r r
    fa,8 sol la sol la fa

    %19
    sib4 r r
    mib,8 fa sol fa sol mib\mbreak
    la4 r r

    %22
    re,8 mi? fad mi fad re
    <<sol'8\\{\slurUp sol, sol'16(fad) }>> sol(sol,) sol'(sol,) sol'(sol,) sol'(sol,)
    <<fa'?8\\{\slurUp sol, fa'16(mib) }>> fa(sol,) fa'(sol,) fa'(sol,) fa'(sol,)

    %25
    <<mib'8\\{\slurUp sol, mib'16(re) }>> mib(sol,) mib'(sol,) mib'(sol,) mib'(sol,)
    re'4 re8 re re re
    re4 re8 re re re

    %28
    re4 re8 re re re\mbreak
    re16 re re fa fa la la\clef tenor re re fa fa sol,
    sol8\clef bass sol re sib sol r

    %31
    r16 la la dod dod mi mi la la dod dod mi
    fa,8 re la fa re r
    r4 r16 \clef tenor sol'' sol dod, dod mi mi la,

    %34
    la dod dod sol\clef bass sol sib sib mi, mi sol sol dod,
    dod4 r16 la[si dod re \parenthesize mi\parenthesize fa\parenthesize sol]
    la16 dod la mi la dod la mi la dod la mi

    %37
    la re la fa la re la fa la re la fa
    la dod la mi la dod la mi la dod la mi
    \tuplet 3/2 {fa8.(sol16 la8) sol8.[(la16 sib8)] la,8.(si16 dod8)}

    %40
    re'8 do? sib? la sol re'
    dod? si la sol fa la
    sol fa mi re dod si\mbreak

    %43
    re re' la fa re re'
    fa, mi re do? sib? fa'
    mi re do sib la do'

    %46
    sib8[ la sol fa mi re16 do]
    fa8 fa' do la fa la
    la sol fa mi re la'

    %49
    sold fad mi re do mi
    re[do si la sold fad16 mi]
    la8 mi' do si la la'

    %52
    la si do re mi mi,
    la si do re mi mi,\mbreak
    la,4 r8 la do la

    %55
    sold4 r8 mi' sold mi
    la16 mi fa mi la mi fa mi la mi fa mi
    si' mi, fa mi si' mi, fa mi si' mi, fa mi

    %58
    do'8 la mi do la4
    fad'16 sol fad re fad sol fad re fad sol fad re
    do4(la' do)

    %61
    sol16 la sol re sol la sol re sol la sol re
    sib4(re sol)\mbreak
    \clef tenor re'16 mi re sol, re' mi re sol, re' mi re sol,

    %64
    mi4(sol do)
    do16 re do fa, do' re do fa, do' re do fa,
    re4 \parentSlur (fa sib)

    %67
    sib16 do sib sol sib do sib sol sib do sib sol
    mi4(sol do)
    do16 re do la do re do la do re do la

    %70
    fa4(la do)
    sib4~sib16 la sib do re mib fa sol
    re8 sib la4.\tr sib8\mbreak

    %73
    sib la sol fa mib sib'
    \clef bass la sol fa mib re fa
    mib [re do sib la sol16 fa]

    %76
    sib8 fa' re do sib sib'
    \clef tenor fa' mi? re do sib fa'
    mi re do sib la\clef bass do

    %79
    sib[la sol fa mi re16 do]
    fa8 fa' la, sol fa si
    do si?  lab sol fa do'

    %82
    si la? sol fa mib sol
    fa [mib? re do si la16 sol]\mbreak
    do8 sol' mib re do sol'

    %85
    do, re mib do sol' sol,
    do re mib do sol' sol,
    \clef tenor do'16 sol do sol do sol do sol do sol do sol

    %88
    \clef bass sol,16[sol sol sol sol sol sol sol sol sol sol sol]
    \clef tenor re''16 [si re si re si re si re si re si]
    \clef bass do,[do do do do do do do do do do do]

    %91
    \clef tenor do'[la do la do la do la do la do la]
    \clef bass sib,[sib sib sib sib sib sib sib sib sib sib sib]\mbreak  %%inizio seconda riga p 7a
    \clef tenor sib'[sol sib sol sib sol sib sol sib sol sib sol]

    %94
    \clef bass re[re re re re re re re re re re re]
    \clef tenor do'[la do la do la do la do la do la]
    \clef bass sol,[sol sol sol sol sol sol sol sol sol sol sol]

    %97
    sol8 sol'4 sib re8
    re, fad4 la re8
    sol,, sol'4 sib re8

    %100
    re re, la fad re r\mbreak
    sol2 r4
    do2 r4

    %103
    do2 r4
    re2 r4
    re2 r4

    %106
    mib2 r4
    mib?2 r4
    re2 r4

    %109
    sol8 re mib sib do re
    re'8 [do16 sib la sol fa mib] mib8 sol
    mib do mib sol do r

    %112
    mib[re16 do sib la sol fa] mib8 sol
    fad re fad la re r
    \clef tenor fad8[mi16 re do sib la sol] fad8 la

    %115
    sol mib sol sib mib r
    sol[fa16 mib re do sib la] sol8 mib'
    fad,(re fad la) do4

    %118
    \clef bass sib8 fad sol sib, do re\mbreak
    sol,16 sol' sol sol sib, sol' sol sol sib, sol' sol sol
    la, sol' sol sol la, sol' sol sol la, sol' sol sol

    %121
    la, fad' fad fad la, fad' fad fad la, fad' fad fad
    sol8 fa mib re do sol'
    fad mi? re do sib re'

    %124
    do[sib la sol fad mi16 re]
    sol8 re sib la sol re'\mbreak
    sol la sib sol re'[re,]

    %127
    sol, la sib sol re'[re,]
    sol' la sib sol re'[re,]
    sol, la sib sol re'[re,]

    %130
    sol2.\fermata

}

IIIvlan = \relative do' {

    sib'8 la sol fa mib  sib'
    la sol fad mi re fa
    mib [re do sib la sol16 fad]

    %4
    sol8 re' sib la sol sib'
    re do sib la sol re'
    do sib la sol fa la

    %7
    sol [fa mib re do sib16 la]
    sib8 fa' re do sib re
    fa mi? re do sib fa'

    %10
    mi re dod si la do'!
    sib? [la sol fa mi re16 dod]\mbreak
    re8 la' fa mi re mi

    %13
    fa la4 la8 la la
    fa la4 la8 la la
    fa re' la fa re r

    %16
    R2.*24
    fa8 mi re do sib! fa'
    mi re dod si la do

    %42
    sib? la sol fa mi re\mbreak
    re re' la' fa re fa
    la sol fa mi re la'

    %45
    sol fa mi re do mi
    re[do sib la sol fa16 mi]
    fa8 fa' do' la fa do'

    %48
    do si la sol fa do'
    si la sold fad mi sol
    fad?[mi re do si la16 sold]

    %51
    la8 mi' do si la mi'
    do re mi fa mi si
    do re mi fa mi si\mbreak

    %54
    do4 r r
    R2.*18
    re'8 do sib la sol re'

    %74
    do sib la sol fa la
    sol[fa mib re do sib16 la]
    sib8 fa' re do sib re

    %77
    la' sol fa mi re la'
    sol fa mi re do mi
    re[do sib la sol fa16 mi]

    %80
    fa8 fa' la sol fa re'
    mib re do sib lab mib'
    re do si la sol sib

    %83
    lab [sol fa mib re do16 si]\mbreak
    do8 sol' mib re do re
    mib sol4 sol8 sol sol

    %86
    mib sol,4 sol8 sol sol
    mib4 r r
    si''16[si si si si si si si si si si si]

    %89
    R2.
    do16[do do do do do do do do do do do]
    R2.

    %92
    re16[re re re re re re re re re re re]\mbreak
    R2.
    re,16[re re re re re re re re re re re]

    %95
    R2.
    re16[re re re re re re re re re re re]
    R2.*25

    %122
    sib'8 la sol fa mib  sib'
    la sol fad mi re fa
    mib [re do sib la sol16 fad]

    %125
    sol8 re' sib la sol fad'\mbreak
    re8 re4 re8 re re
    sib re,4 re8 re re

    %128
    do re'4 re8 re re
    sib re,4 re8 re re'
    sib2.\fermata

}


IIIbcn = \relative do {

    sol'8 fa mib re do sol'
    fad mi ?re do sib re'
    do [sib la sol fad mi16 re]

    %4
    sol8 re sib la sol sol'
    sib la sol fa mib sib'
    la sol fa? mib re fa

    %7
    mib [re do sib la sol16 fa]
    sib'8 fa re do sib sib'
    re do sib la sol re'

    %10
    dod si la sol fa la
    sol[fa mi? re dod si16 la]\mbreak
    re'8 la fa mi re la'

    %13
    re, mi fa re la' la,
    re mi fa re la' la,
    re re' la fa re r %% OOKK

    %16
    sol, la sib la sib sol
    do4 r r
    fa,8 sol la sol la fa

    %19
    sib4 r r
    mib,8 fa sol fa sol mib\mbreak
    la4 r r

    %22
    re,8 mi? fad mi fad re
    sol4 sol8 sol sol sol
    sol4 sol8 sol sol sol

    %25
    sol4 sol8 sol sol sol
    re'4 re8 re re re
    re4 re8 re re re

    %28
    re4 re8 re re re\mbreak
    re4 r r
    sol,8 sol' re sib sol r

    %31
    la la' mi dod la r
    re, re' la fa re r
    sol4 r r

    %34
    la r r
    la r r\mbreak
    la2.~

    %37
    la~
    la
    re4 sol, la

    %40
    re'8 do? sib? la sol re'
    dod? si la sol fa la
    sol fa mi re dod si\mbreak

    %43
    re re' la fa re re'
    fa, mi re do? sib? fa'
    mi re do sib la do'

    %46
    sib8[ la sol fa mi re16 do]
    fa8 fa' do la fa la
    la sol fa mi re la'

    %49
    sold fad mi re do mi
    re[do si la sold fad16 mi]
    la8 mi' do si la la'

    %52
    la si do re mi mi,
    la si do re mi mi,\mbreak
    la,4 r8 la do la

    %55
    sold4 r8 mi' sold mi
    la,4 r8 la do la
    sold4 r8 mi' sold mi

    %58
    la,4 la la
    la la la
    la la la

    %61
    re re re
    fa fa fa\mbreak
    mi mi mi

    %64
    mi mi mi
    re re re
    re re re

    %67
    do do do
    mi mi mi
    fa fa fa

    %70
    fa fa fa
    sib, sib sib
    sib fa' fa,\mbreak

    %73
    sib'8 la sol fa mib sib'
    la sol fa mib re fa
    mib [re do sib la sol16 fa]

    %76
    sib8 fa' re do sib sib'
    \clef tenor fa' mi? re do sib fa'
    mi re do sib la\clef bass do

    %79
    sib[la sol fa mi re16 do]
    fa8 fa' la, sol fa si
    do si?  lab sol fa do'

    %82
    si la sol fa mib sol
    fa [mib? re do si la16 sol]\mbreak
    do8 sol' mib re do sol'

    %85
    do, re mib do sol' sol,
    do re mib do sol' sol,
    do4 r r

    %88
    sol16[sol sol sol sol sol sol sol sol sol sol sol]
    R2.
    do16[do do do do do do do do do do do]

    %91
    R2.
    sib16[sib sib sib sib sib sib sib sib sib sib sib]\mbreak  %%inizio seconda riga p 7a
    R2.

    %94
    re16[re re re re re re re re re re re]
    R2.
    sol,16[sol sol sol sol sol sol sol sol sol sol sol]

    %97
    sol4 r r
    re' r r
    sol, r r

    %100
    re' r r8 re\mbreak
    sol,2 r4
    do2 r4

    %103
    do2 r4
    re2 r4
    re2 r4

    %106
    mib2 r4
    mib?2 r4
    re2 r4

    %109
    sol8 re mib sib do re
    sol,2 r4\mbreak
    do2 r4

    %112
    do2 r4
    re2 r4
    re2 r4

    %115
    mib2 r4
    mib?2 r4
    re2 r4

    %118
    sol8 re mib sib do re\mbreak
    sol,4 sol sol
    re re re

    %121
    re re re
    sol'8 fa mib re do sol'
    fad mi? re do sib re'

    %124
    do[sib la sol fad mi16 re]
    sol8 re sib la sol re'\mbreak
    sol la sib sol re'[re,]

    %127
    sol, la sib sol re'[re,]
    sol' la sib sol re'[re,]
    sol, la sib sol re'[re,]

    %130
    sol2.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 60
    s2.*130
    \bar"|."

}


IIIvlI = {
    \global
    %\notypeset
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}IIIvcI = {
    \global
    \clef bass
    <<\IIIvcIn \forma>>

}

IIIvcII = {
    \global
    \clef bass
    <<\IIIvcIIn \forma>>

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
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

    systems-per-page = #3

}

    \header {
        title = \markup\smaller "Concerto con 2 Violoncelli [RV 531]"
        composer = \markup \center-column{"A. Vivaldi (1678 - 1741)"}
    }

    \markup \huge {[1.] All[egr]o}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"[Violino"\vspace #-0.2 "Primo]"}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2 "Secondo]"}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.2 "[Primo]"}
                    \set Staff.shortInstrumentName = "vc1"
                    \set Staff.midiInstrument = #"cello"
                    \IvcI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2 "[Secondo]"}
                    \set Staff.shortInstrumentName = "vc2"
                    \set Staff.midiInstrument = #"cello"
                    \IvcII
                >>
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

    \paper {

    systems-per-page = #6

}

    \markup \huge {[2.] Largo}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.2 "[Primo]"}
                    \set Staff.shortInstrumentName = "vc1"
                    \set Staff.midiInstrument = #"cello"
                    \IIvcI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2 "[Secondo]"}
                    \set Staff.shortInstrumentName = "vc2"
                    \set Staff.midiInstrument = #"cello"
                    \IIvcII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

    \paper {

    systems-per-page = #3

}

    \markup \huge {[3.] All[egr]o}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"[Violino"\vspace #-0.2 "Primo]"}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2 "Secondo]"}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.2 "[Primo]"}
                    \set Staff.shortInstrumentName = "vc1"
                    \set Staff.midiInstrument = #"cello"
                    \IIIvcI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2 "[Secondo]"}
                    \set Staff.shortInstrumentName = "vc2"
                    \set Staff.midiInstrument = #"cello"
                    \IIIvcII
                >>
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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
