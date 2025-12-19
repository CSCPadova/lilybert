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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


Ivocen = \relative do'' {

    \autoBeamOff

    R1*12
    r4 sol8. sol16 sol8 sol16 sol sol8 sol16 sol
    mi8 do do' re16[(mi)] re8 mi16 re do8. re16
    si8 sol do do\mbreak do16 do re mi fa8. sol16
    mi8 mi r sol do, do r mi
    la, si do re16 do si8 sol r do
    do4.(si8) do2
    R1 r2 r4 do8 do  %%% OK
    do do16 do do8 do16 do si8 sol mi 'fa16[(sol)]
    fa8 sol16 fa mi8. fa16 re8 re sol, sol\mbreak
    sol16 sol la si do16[(si)] do[(re)] si8 si r re
    sol, sol r la re, mi fa sol16 fa
    mi8 do r4 r2
    R1
    sol'4 sol r8 la la16[(si)] do[(si)]\mbreak

    %28 OK
    si4 sol r8 do do8. sib16
    la8. sol16 fa8. sol16 mi8 do r sol'16 sol
    sol8 sol r sol16 sol do8 do r do16 do
    do do do do\mbreak do do do si do8 do r4
    R1
    do4 do  r8 re re16[(mi)] fa[(mi)]
    mi4 do r2
    r8 sol'8 sol8. fa16 mi8. re16 do8. re16
    si8 sol r4 r2

    %37 OK
    r4 r8 sol16 sol sol8 sol r sol16 sol
    sol8 sol r sol16 sol sol sol sol sol sol la sol fa
    mi8 do r do' la8. la16 la4~\mbreak
    la8 si la si sold mi la4
    do(si8.)[la16] la2
    r la4 la
    r8 si si16[do] re[do] do4 la
    r8 re re8. do16 si8. la16 sol8. la16\mbreak  %%% OK
    fad8 re r la'16 la la8 la r la16 la
    si8 sol r re'16 re re re re re re mi re do
    si8 sol r sol'\mbreak mi8. mi16 mi4~
    mi8 fad mi fad red si4 mi8
    mi4.(red8) mi2
    R1*2
    si4 si8. la16 sol8. fad?16 mi8 si'

    %53 OK
    do4 la8 re sol, si la8.(sol16)
    sol4 re'8 re re8. re16 re8 re
    re4 si8 sol do8. do16 do8 do
    do do16 do do8 re16 mi\mbreak fa8. mi16 re4
    mi8[(fa)] re mi do4 do8 re16 mi
    fa8. mi16 re4 mi8[(fa)] re mi
    do4 r r2
    mi4 mi8. re16 do8. si16 la8 mi'\mbreak
    fa4 re8 sol do, mi re8.[(do16)]
    do4 sol8 sol sol8. sol16 sol8 sol
    sol4 mi r2
    r4 r8 sol mi mi16 mi mi8 fa16 sol\mbreak
    la8 la16 la r8 la la la16 la la8 si16 do
    re8 re16 re r4 r r8 sol,
    sol sol16 sol sol8 la16 si do8 do16 do\mbreak si4~
    si8(la) la la sol4 sol
    la8[si] la8. sol16 sol2

    %70 OK
    r2 r sol
    sol1 fad2
    sol2. sol4 sol2

    %73
    R1.
    r2 r re
    sol r sol\mbreak

    %76
    do r la
    re do si
    do(si2.) la4

    %79
    si2 sol do
    do1 si2
    do2. do4 do2

    %82
    R1.
    r2 r sol
    do r do

    %85
    fa r re\mbreak
    sol fa mi
    fa(mi2.) re4

    %88
    mi2 do la
    la1 fad2
    la2. la4 la2

    %91
    R1.*2
    do2 re mi
    la, la la4 sold

    %95
    si1 si2\mbreak
    mi2 fa sol
    do, do do4 si

    %98
    re1 re2
    mi fa sol
    fa2. mi4 re2

    %101
    mi re2. do4
    do1.
    mi2 fa sol\mbreak

    %104
    fa2. mi4 re2
    mi re2. do4
    do1.

    %107 OK
    R1*3
    do8. do16 do8 do mi re do4
    si r8 re sol,4. fad16 [sol]

    %112
    la4. sol16 [la] si4 sol8 sol'\mbreak
    do,4. si16[do] re4. do16[re]
    mi4 do r2

    %115
    R1
    sol8. sol16 sol8 sol la sol fa4
    mi r r r8 la

    %118
    re,4. do16[re] mi4. re16[mi]
    fad4 re8 re' sol,4. fad16[sol]
    la4. sol16[la] si4 sol8 sol

    %121
    do do do mi re do do8.[(si16)]
    do2 r
    r4 r8 do,16 do mi8 do mi sol

    %124
    sol4 sol r2
    r4 r8 sol16 sol do8 sol do mi
    mi4 do r2

    %127
    r4 sol8 sol do do16 sib sib8. la16
    la8. la16 la8 la la la16 sol sol8.[fa16]\mbreak
    fa2 r

    %130
    R1*11
    r4 la4. la8
    si4 si r

    %143
    r dod4. dod8
    re [mi fa mi] re[mi]
    dod8. dod16 dod4 la

    %146
    si si re
    re2(dod4)
    re2.\mbreak

    %149
    R2.*2
    r4 re,4. re8
    mi2 mi4

    %153
    r fad4. fad8
    sol[la sib la] sib[la]
    fad8. fad16 fad4 re

    %156
    mi mi sol
    sol2(fad4)
    sol2.

    %159
    R2.*6
    r4 re'4. re8
    mib2.~

    %167
    mib4 re mib
    do2 do8[(re)]
    re4 sib re

    %170
    do4. do8 do4
    r r re
    do4. do8 do4

    %173
    r fa, fa
    sol8[la sol la] sib[do]\mbreak
    la[sib? la sib] do4

    %176
    do2~do8[si]
    do2.
    r4 do do

    %179
    re8[mi re mi fa sol]
    mi4 do r
    r do do

    %182
    re8[mi re mi fa sol]
    mi[fa mi fa] sol4\mbreak
    sol2~sol8[fad]

    %185
    sol2 r4
    r r mi
    re4. re8 re4

    %188
    r r mi
    re4. re8 re4
    r sol, sol

    %191
    la8[si la si do re]
    si[do si do re mi]
    do[re do re mi fa]\mbreak

    %194
    re[mi re mi fa sol]
    mi4. fa8 sol4
    fa16[(mi) re8] re2

    %197
    do r4
    R2.
    r4 re re

    %200
    mi8[fa mi fa] sol4
    fa8[mi16 re] re2
    do2.\fermopz

}

Itesto = \lyricmode {

    Dix -- it Domi - nus Domi - no me -- o,
    sede _ sede _ a dextris  _ meis, _
    donec _ ponam _ ini - mi -- cos tuos _  scabel - lum, sca -- bellum _ pedum _ tuo - rum tuo - rum.
    Dix -- it Domi - nus Domi - no me -- o,
    sede _ sede _ a dextris  _ meis, _
    donec _ ponam _ ini - mi -- cos tuos _  scabel - lum, sca -- bellum _ pedum _ tuo - rum.
    Virgam _ virtu - tis tuae _ emit - tet Domi - nus ex Sion, _
    domi - nare, _  domi - nare, _ domi - nare, _ domi - nare, _ domi - nare, _
    virgam _ virtu - tis tuae _ emit - tet Domi - nus ex Sion, _
    domi - nare, _  domi - nare, _ domi - nare, _ domi - nare, _ domi - nare, _
    in medi - o inimi - - corum _  tuo - rum.
    Virgam _ virtu - tis tuae _ emit - tet Domi - nus ex Sion, _
    domi - nare, _  domi - nare, _ domi - nare, _ domi - nare, _ domi - nare, _
    in medi - o inimi - - corum _  tuo - rum,
    te -- cum princi - pium _ in die _ virtu - tis tu -- æ,  in splendo - ribus _ Sancto _ rum
    ex ute - ro ex ute - ro ante _  lu -- cife - rum genu - i te,
    ante _  lu -- cife - rum genu - i te.
    Te -- cum princi - pium _ in die _ virtu - tis tu -- æ,  in splendo - ribus _ Sancto _ rum
    ex ute - ro ante _  lu -- cife - rum ex ute - ro ante _  lu -- cife - rum ex ute - ro ante _  lu -- cife - rum
    genu - i te, ge - nu -- i te.

    Jura - vit Domi - nus et non et non et non pæni - te -- bit eum, _
    jura - vit Domi - nus et non et non et non pæni - te -- bit eum, _
    jura - vit Domi - nus
    tu es sa -- cer -- dos in æter - num tu es sa -- cer -- dos in æter - num
    secun - dum ordi - nem Melchi - se -- dech secun - dum ordi - nem Melchi - se -- dech.

    Domi - nus a dex -- tris tuis, _
    con -- fre - - - - git con -- fre - - - - git,
    Domi - nus a dex -- tris tu -- is,
    con -- fre - - - - git con -- fre - - - - git,
    in die _ iræ _ suæ _ re -- ges.

    Judi - ca -- bit judi - ca -- bit judi - ca -- bit judi - ca -- bit judi - ca -- bit in nati - oni - bus,
    im -- ple -- bit rui - nas.

    Con -- quassa - bit Con -- quassa - bit ca  -- pi -- ta in ter -- ra mul -- to -- rum,
    con -- quassa - bit Con -- quassa - bit ca  -- pi -- ta in ter -- ra mul -- to -- rum,
    De tor -- ren -- te in vi -- a  bibet, _
    prop -- ter -- ea _ prop -- ter -- ea _ ex -- alta - -  - bit ca -- put
    ex -- alta - - bit, ex -- alta -  - bit ca -- put
    prop -- ter -- ea _ prop -- ter -- ea _ ex -- alta - - - - - - - bit ca -- put
    ex -- alta - - bit ca -- put.

}

IvlIn = \relative do'' {

    sol'4 r8 sol sol4 r8 fa
    fa[mi mi8. re16] re4 sol8. fa16
    mi4 r8 sol\p sol4 r8 fa

    %4
    fa[mi mi8. re16] re4 sol8. fa16
    mi4 r8 sol\f do2~
    do8[si si8. la16] la4. do8

    %7
    si4 r8 re, sol2~\mbreak
    sol4. dod,8 fa2~
    fa4. mi8 mi4 sib'

    %10
    la2. do,4
    mi4. re8 re2
    do1\fermata

    %13 OK
    R1*5
    r2 r4 sol'8. sol16
    sol8 sol16 sol sol8 sol16 sol mi8 do do do

    %20
    do do16 do do8. si16 do8 do r4
    R1*4\mbreak
    r4 do'8 do do do16 do do8 do16 do

    %26
    si8 sol sol sol sol sol16 sol sol8. fad16
    sol8 sol r4 r2
    R1*2

    %30
    r8 sol16 sol sol8 sol r do,16 do do8 do
    r la16 la sol sol sol sol sol8 sol r sol16 sol
    do8 do\mbreak r do16 do do do do do do do do si

    %33
    do8 do r4 r2
    sol'8 sol r4 r8 la la16(si) do(si)
    si4 sol r2

    %36
    r8 sol[sol8. fa16] mi8. re16 do8. re16
    si8 sol r4 r8 sol16 sol sol8 sol
    r sol16 sol sol8 sol r8 sol16 sol sol8 sol\mbreak

    %39
    sol8 sol r4 r2
    R1
    r2 la'4 la

    %42
    r8 si[si8. re16] dod4 la
    R1*2
    r2 r8 mi16 mi fad8 fad

    %46
    r sol16 sol la8 la r sol16 sol sol sol sol fad
    sol8 sol r4 r2
    R1

    %49
    r2 r4 r8 si
    sol8. sol16 sol4 do4. la8\mbreak
    fad red mi sol fad2

    %52
    mi4 r r2
    R1*6
    sol4 sol8. fa?16 mi8. re16 do4

    %60
    R1*3
    r4 sol8 sol sol8.[sol16 sol8 sol]
    sol4 mi r r8 mi'\mbreak

    %65
    do do16 do do8 re16 mi fa8 fa16 fa r8 fa
    re re16 re re8 mi16 fa sol8 sol16 sol r4\mbreak
    r2 r8 la la sol

    %68
    sol4. fad8 sol4 r
    R1
    R1.*2

    %72
    r2 r sol,
    sol1 fad2
    sol2. sol4 sol2

    %75
    r sol sol
    r la la
    R1.*4

    %81
    r2 r do
    do1 si2
    do2. do4 do2

    %84
    r do do
    r re re\mbreak
    r r sol

    %87
    r r fa
    r r mi
    R1.

    %90
    r2 r la,
    la1 sold2
    la2. la4 la2

    %93
    R1.*14
    R1*2
    sol'8.[sol16 sol8 sol] la sol fa4

    %110
    mi2 r
    R1*3
    r2  r8 sol, do4~

    %115
    do8 si16 do re4. re16 mi fa8 mi16 re\mbreak
    mi4 r r2
    do8.[do16 do8 do] mi re do4

    %118
    si4 si4. la16 si do4~
    do8 si16 do re4. do16 re mi4~
    mi re re8. do16 si4

    %121
    R1
    do8.[do16 do8 do] do[do do8. si16]
    do2 r

    %124
    r4 r8 do,16 do mi8 do mi sol\mbreak
    sol sol r4 r r8 sol16 sol
    sol8 sol r sol16 sol do8 sol do[mi]

    %127
    mi do r4 r2
    R1*2\mbreak
    r4 r8 do16 do do8 fa16 do la8 fa16 la

    %131
    sol8 do16 sol mi8 do16 mi sol4. sol'16 sol
    sol la fa sol la sib sol la fa sol mi fa sol la fa sol
    mi fa re mi fa4. mi8 re8. fa16

    %134
    mi8 r r4 r16 do mi do re si do la\mbreak
    si8 do16 la si sol la fad sol8 mi16 fad re mi do re
    si sol' la fa? sol mi fa re mi8[sol sol8. fad!16]

    %137
    sol2 r4 la
    sol4. fa?8 fa4. sol8
    mi2 fa~

    %140
    fa4 mi mi2
    re2 r4
    R2.*6

    %148
    r4 la'4. la8
    si2 si4\mbreak
    r4 dod4. dod8

    %151
    re2 re4
    R2.*6
    r4 re4. re8

    %159
    mi2 mi4
    r fad4. fad8
    sol8 la sib la sol la

    %162
    fad4. fad8 re4
    mi fad sol
    sol2 fad4

    %165
    sol2.
    R2.*3
    r4 r sib

    %170
    la4. la8 la4
    r r sib
    la4. la8 la4\mbreak

    %173
    R2.*2
    r4 do, do
    re8 mi re mi fa sol

    %177
    mi4. fa8 sol4
    la4. sol8 la sol
    fa sol fa sol la re,

    %180
    mi4 sol sol
    la8 si la si do re
    si do si do re4~

    %183
    re do2
    si4 la2
    sol2 r4

    %186
    r r sol
    sol4. sol8 sol4
    r r sol

    %189
    sol4. sol8 sol4
    R2.*2\mbreak
    r4 si si

    %193
    do do r
    r re re
    sol, do2

    %196
    do si4
    do mi, sol
    sol2 fad4

    %199
    sol si, si
    do8 re do re mi do
    re4 re sol8. fa16

    %202
    mi2.\fermopz

}

IvlIIn = \relative do'' {

    mi4 r8 mi do4 r8 do
    si4 do do4. si8
    do4 r8 do\p do4 r8 do
    si4 do do4. si8
    do4 r8 mi\f mi4. la8
    fad4 sol sol4. fad8
    sol4 r8 si, si4. mi8
    dod4. la8 la4 re
    si2 do?
    do1~
    do2 si
    do1\fermata

    %13 OOKK
    R1*5
    r2 r4 mi8. mi16
    mi8 mi16 mi re8 re16 re do8 sol sol sol
    sol sol16 sol sol8. sol16 mi8 do r4
    R1*4
    r4 mi'8 mi mi mi16 mi re8 re16 re
    re8 si si si mi mi16 mi la,8. la16
    si8 sol r4 r2
    R1*2\mbreak
    r8 mi'16 mi re8 re r la16 mi mi8 mi
    r re16 re re re re re mi8 mi r re16 re
    la'8 la r la16 la la la la la sol sol sol sol
    sol8 sol r4 r2
    mi'4 mi r8 mi[fad8. fad16]
    sol4 sol r2
    r8 re[re8. re16] do8[sol sol8. fad16]\mbreak
    sol8 sol r4 r8 mi16 mi mi8 mi
    r mi16 mi mi8 mi r mi16 mi mi re re re
    mi8 mi r4 r2
    R1
    r2 do'4 do
    r8 fa mi4 mi do
    R1*2
    r2 r8 la16 la la8 la
    r si16 si la8 la r si16 si la la la la
    si8 si r4 r2\mbreak
    R1
    r2 r4 r8 sol'
    mi8. mi16 mi4. fad8 mi fad
    red si4 mi8 mi4. red8
    mi4 r r2
    R1*6
    mi4 re8. re16 do8. si16 do4
    R1*3
    r4 mi,8 mi mi8.[mi16 re8 re]
    mi4 do r r8 mi
    mi mi16 mi la8 la16 la\mbreak la8 la16 la r8 la
    si si16 si si8 la16 la sol8 sol16 sol r4
    r2 r8 mi' re4
    re8 do do4 si r
    R1

    %70 OOKK
    R1.*2
    r2 r mi,
    mi1 re2
    re2. re4 re2
    r re mi
    r sol fa
    R1.*4
    r2 r la\mbreak
    la1 sol2
    sol2. sol4 sol2
    r sol la
    r do si
    r r do
    r r si
    r r do
    R1.
    r2 r mi,
    fa1 mi2
    mi2. mi4 mi2
    R1.*14

    %107 OOKK
    do'8.[do16 do8 do] mi re do4\mbreak
    si4 r8 si do[mi mi8. re16]
    mi4 r8 do do[do do8. si16]
    do2 r
    R1*3
    r4 r8 do sol4. fad16 sol
    la4. sol16 la si8 si16 do do8. si16
    do4 r r2
    sol8.[sol16 sol8 sol] sol[sol sol8. fad16]
    sol4 sol4. fad8 mi fad16 sol\mbreak  %%%% OK bar 118
    la8 sol fad sol16 la si8 la16 si mi,4~
    mi8 fad16 sol fad2 sol4
    R1
    sol8.[sol16 sol8 sol] la sol fa?4
    sol2 r
    r4 r8 do,16 do do8 sol do mi
    mi mi r4 r r8 mi16 mi\mbreak
    mi8 mi r mi16 mi sol8[mi sol8. do16]
    do8 sol r4 r2
    R1\mbreak
    r2 r4 r8 do16 do
    do8 fa16 do la8 fa16 la la4 fa8 la16 do
    do8 sol16 mi do8 sol16 do mi4. mi'16 mi
    mi fa re mi fa sol mi fa re mi do re mi fa re mi
    do re si do re mi do re si8[do do8. si16]
    do sol' la fa sol mi fa re\mbreak mi8[sol sol8. fad16]
    sol re mi do re si do la si8 do16 re si do la si
    sol8 r r4 r16 do mi do re si do la
    si2 r4 do
    do2. sib4
    la1~
    la4 sol sol4. la8\mbreak

    %141 OOOKKK
    fa2 r4
    R2.*6
    r4 fa4. fa8
    fa2 fa4\mbreak
    r sol4. sol8
    la2 la4
    R2.*6
    r4 sib4. sib8
    sib2 sib4
    r do4. do8
    re4. do8 sib do
    la8. la16 la4 sib
    sib? do re
    sib la2
    sol2.
    R2.*3
    r4 r fa'
    fa4. fa8 fa4
    r r fa
    fa4. fa8 fa4
    R2.*3\mbreak
    r4 fa, fa
    sol8 la sol la sib do
    la si? la si do4
    do2~do8 si
    do4 mi sol
    sol2 fad4
    sol sol sol
    sol la sol
    re'4. do8 do4
    si sol r
    r r do,
    si4. si8 si4
    r r do
    si4. si8 si4
    R2.*2
    r4 sol' sol
    mi mi r\mbreak
    r sol re
    mi sol2
    la4 sol4. fa8
    mi4 sol sol
    la8 si la si do re
    si4 sol sol
    sol2 sol8 do
    do2 si4
    do2.\fermata







}

IvlaIn = \relative do' {

    sol'4 r8 sol la4 r8 la
    sol4 sol sol2
    sol4 r8 sol la4 r8 la

    %4
    sol4 sol sol2
    sol r8 mi la4
    la sol la2

    %7
    sol r8 re sol4
    la2 r4 la
    sol2 sol

    %10
    sol4 fa8. mi16 fa2
    sol1
    sol\fermata

    %13 OK
    R1*5
    r2 r4 sol8. sol16
    sol8 sol16 sol sol8 sol16 sol sol8 mi mi mi

    %20
    mi mi16 mi re8. re16 do8 sol r4
    R1*4
    r4 sol'8 sol la la16 la la8 la16 la

    %26
    sol8 sol sol sol mi mi16 mi re8. re16
    re8 si r4 r2
    R1*2\mbreak %%% OK

    %30
    r8 do16 do re8 re r do16 do do8 do
    r re16 re re re re re do8 do r re16 re
    do8 do r mi16 mi re re re re re re re re

    %33
    mi8 mi r4 r2
    sol4 mi r8 mi[re8. re16]
    re4 re r2

    %36
    r8 sol sol sol sol mi mi la\mbreak
    re,8 re r4 r8 do16 do do8 do
    r do16 do do8 do r do16 do do do si si

    %39
    do8 do r4 r2
    R1
    r2 la'4 la

    %42
    r8 la[la8. sold16] la4 la
    R1*2
    r2 r8 mi16 mi re8 re

    %46
    r re16 re re8 re r re16 re re re re re\mbreak
    re8 re r4 r2
    R1

    %49
    r2 r4 r8 mi
    mi8. mi16 mi4 la4. fad8
    fad?4 mi fad!4. la8

    %52
    sold4 r r2
    R1*6
    sol?4 sol sol8. fa16 mi4

    %60
    R1*3
    r4 do8 do do8.[do16 do8 si]
    do4 do r r8 do\mbreak

    %65
    do do16 do mi8 mi16 mi re8 re16 re r8 re
    re re16 re re8 do16 do si8 si16 si r4
    r2 r8 la' fad sol

    %68
    sol mi re4 re r
    R1
    R1.*2

    %72
    r2 r si
    do1 do2

    %74
    si2. si4 si2
    r si do
    r mi re

    %77
    R1.*4\mbreak
    r2 r  mi
    fa1 fa2

    %83
    mi2. mi4 mi2
    r mi fa
    r la sol

    %86
    r r do,
    r r fa
    r r la

    %89
    R1.
    r2 r mi
    re1 re2

    %92
    do2. do4 do2
    R1.*14  %%%%%%% OOOOOOOKKK
    R1

    %108
    sol'8.[sol16 sol8 sol] mi mi la4
    sol r8 sol fa sol la fa
    sol2 r

    %111
    r r8 re mi4~
    mi8 re16 mi fa4. mi16 fa sol4~
    sol8 fa16 sol la2 sol4

    %114
    sol8. fa16 mi4 mi2
    mi4 re re2
    do4 r r2\mbreak

    %117
    mi8.[mi16 mi8 mi] do re mi do
    re4 r r2
    R1

    %120
    r2 r4 mi
    mi8[mi mi8. la16] la8[la sol8. fa16]
    mi4 r8 mi do mi  fa4

    %123
    mi2 r
    r4 r8 sol,16 sol sol8[do sol8. do16]
    do8 do r4 r r8 do16 do\mbreak

    %126
    do8 do r do16 do do8 do do do
    do do r4 r mi
    fa8. fa16 fa8 fa fa fa16 fa fa8. mi16

    %129
    fa8 fa fa4. fa16 fa fa8. mi16
    fa2 r
    R1\mbreak

    %132
    sol4 fa fa mi
    mi re re8 do re4
    do r r8 sol' sol la

    %135
    re, r r4 r8 la'16 la sol sol fa fa
    mi8 do16 re si do la si sol sol' do, mi re mi do8
    re2 r4 re

    %138
    re2 re4. mi8\mbreak
    dod2 re
    re2. dod4

    %141  OOKK
    re2 r4
    R2.*3
    r4 r mi

    %146
    fa sol la
    la sol2
    fa4 r r

    %149
    R2.*6
    r4 r fad
    sol la sib

    %157
    sib la2
    sol2.
    R2.*3

    %162
    r4 r sol
    sol la re,
    re2.

    %165
    re
    r4 sib' sib
    sib? sib sib

    %168
    sol2 fa4
    fa fa fa
    fa4. fa8 fa4
    r r fa

    %172
    fa4. fa8 fa4
    R2.*2
    r4 la sol

    %176
    fa8 sol fa mi re4
    mi8 fa sol4. mi8
    fa2.

    %179
    fa\mbreak
    sol4 mi re
    mi2 sol4

    %182
    re re re
    mi mi r
    r re re

    %185
    re8 mi re mi fa sol
    mi4 mi sol
    sol4. sol8 sol4

    %188
    r r sol
    sol4. sol8 sol4
    R2.*4

    %194
    r4 sol sol
    sol2 sol4
    r sol sol \mbreak

    %197
    sol sol si
    mi, mi la
    re, sol sol

    %200
    sol sol sol
    la sol2
    sol2.\fermopz

}

IvlaIIn = \relative do' {

    mi4 r8 mi mi4 r8 re
    re4 do re2
    do4 r8 mi mi4 r8 re

    %4
    re4 do re2
    do r8 do mi4
    re re re2

    %7
    re r8 si mi4
    mi2 r4 re
    re2 do

    %10
    do1
    do4.re8 re2
    mi1\fermata

    %13 OK
    R1*5
    r2 r4 do8. do16
    do8 do16 do re8 re16 re sol,8 do do do

    %20
    do sol16 sol sol8. sol16 sol8 mi r4
    R1*4
    r4 mi'8 mi do do16 do re8 re16 re

    %26
    re8 re mi sol, la la16 la la8. la16
    sol8 sol r4 r2\mbreak
    R1*2

    %30
    r8 sol16 sol sol8 sol r la16 la la8 la
    r la16 la re, re sol sol sol8 sol r sol16 si
    mi,8 mi r mi16 mi la la re, re re re sol sol

    %33
    sol8 sol r4 r2
    do4 do r8 do[la8. la16]
    si4 si r2

    %36
    r8 re re re mi do do la\mbreak
    si si r4 r8 sol16 sol sol8 sol
    r sol16 sol sol8 sol r sol16 sol sol sol sol sol

    %39
    sol8 sol r4 r2
    R1
    r2 mi'8 do do la

    %42
    re16 mi re do si4 la la
    R1*2
    r2 r8 la16 la la8 la

    %46
    r sol16 sol re'8 la r re,16 sol la la la la\mbreak
    sol8 sol r4 r2
    R1

    %49
    r2 r4 r8 si
    si8. si16 do4. do8 do4
    si si do si

    %52
    si4 r r2
    R1*6
    do4 re8. re16 mi8 do do4

    %60
    R1*3
    r4 sol8 sol sol8.[sol16 sol8 sol]
    sol4 sol r r8 la

    %65
    la la16 la la8 la16 la\mbreak la8 la16 la r8la
    sol sol16 sol sol'8 sol16 fa mi8 mi16 mi r4
    r2 r8 do re4

    %68
    mi16 sol, do si la4 si8 sol r4
    R1
    R1.*2

    %72
    r2 r sol
    la1 la2
    sol2. sol4 sol2

    %75
    r sol mi
    r do'4 la la2\mbreak
    R1.*4

    %81
    r2 r do
    re1 re2
    do2. do4 do2

    %84
    r do la
    r fa'4 re re2
    r r sol,

    %87
    r r re'
    r r mi
    R1.

    %90
    r2 r do
    la si1
    la2. la4 la2

    %93
    R1.*14
    R1\mbreak
    re8.[re16 re8 mi] do si la4

    %109
    si r8 mi do mi fa re
    mi2 r
    r r8 si do4~

    %112
    do8[si la si16 do] re8[do si do16 re]
    mi8 re16 mi do2 si4
    si do do2

    %115
    do4 la sol2
    sol4 r r2\mbreak
    do8.[do16 do8 do] sol si do la

    %118
    si4 r r2
    R1
    r2 r4 si

    %121
    sol8 sol do[do] fa mi re4
    do r8 do la do re4
    sol,2 r

    %124
    r4 r8 mi16 mi mi8[mi mi8. mi16]
    sol8 sol r4 r r8 sol16 sol\mbreak
    sol8 sol r sol16 sol sol8 sol mi sol

    %127
    sol mi r4 r sol
    fa8. fa16 la8 la re re16 re do8. do16
    la8 la16 sib do4 re8 re16 re do4

    %130
    la r r2
    R1\mbreak
    do4 do re sib

    %133
    do la sol8 sol sol4
    sol8 r r4 r8 do16 mi re8 do
    sol' r r4 r8 mi16 re re do do si

    %136
    si8 la16 si sol la fa sol mi8. mi16 sol8 la
    re,2 r4 re
    re sol sol2

    %139
    la1
    la\mbreak
    la2 r4

    %142
    R2.*3
    r4 r dod
    re mi fa

    %147
    fa mi2
    re r4
    R2.*6

    %155
    r4 r la
    sib do re
    re do2

    %158
    sib r4
    R2.*3
    r4 r re

    %163
    re do sib
    sol la2
    sib2.

    %166
    r4 sol' sol\mbreak
    sol fa sol
    mib2.

    %169
    re4 re4. sib8
    do4. do8 do4
    r4 r sib

    %172
    do4. do8 do4
    R2.*2
    r4 do do8 sol

    %176
    la sib la sol fa4
    do'2.
    do8 re do si? la4

    %179
    la re2
    sol,4 sol si
    do8 re do si la4\mbreak

    %182
    si sol4. si8
    do4 do r
    r la la

    %185
    si8 do si do re mi
    do4 do do
    re4. re8 re4

    %188
    r r do
    re4. re8 re4
    R2.*4

    %194
    r4 re re
    do8 re mi2
    re4 re2

    %197
    mi4 mi re
    do8 re do si la4
    si si re\mbreak

    %200
    do2~do8 mi
    re4 re2
    mi2.\fermopz

}

Ivcn = \relative do {

    do'4 r8 mi, la4 r8 re,
    sol4 do, sol' sol,
    do4 r8 mi, la4 r8 re,

    %4
    sol4 do, sol'2
    do r4 la
    re sol, re'2

    %7
    sol,2 r4 mi4
    la2 r4 re,
    sol2 do4 mi,

    %10
    fa2. la4
    sol1
    do\fermata

    %13
    R1*5
    r2 r4  do8 do
    do do16 do si8 si16 si do8 do do, do

    %20
    mi8 mi16 mi sol8. sol16 do,4 r
    R1*4
    r4 do''8 do la la16 la fad8 fad16 fad

    %26
    sol8 sol mi mi dod dod16 dod re8. re16
    sol,8 sol r4 r2
    R1*2\mbreak

    %30
    r8 do16 do si8 si r la16 la sol8 sol
    r fad16 fad sol sol sol sol do8 do r si16 si
    la8 la r sol16 sol fad fad fad fad sol sol sol sol

    %33
    do8 do r4 r2
    do4 do r8 la[re8. re16]
    sol,4 sol r2

    %36
    r8 si si si\mbreak do8. do16 la8. la16
    sol8 sol r4 r8 do16 do re8 re
    r mi16 mi fa8 fa r sol16 sol sol, sol sol sol

    %39
    do8 do r4 r2
    R1
    r2 la'4 fa

    %42
    re mi la, la
    R1*2
    r2 r8 dod16 dod re8 re\mbreak

    %46 OK
    r sol,16 sol fad8 fad r sol16 sol re re re re
    sol8 sol r4 r2
    R1

    %49
    r2 r4 r8 mi'
    mi4 do la2~
    la4 sol la si

    %52
    mi, r r2
    R1*6
    do'4 si do do

    %60
    R1*3
    r4 do8 do mi8. mi16 sol8 sol\mbreak
    do,4 do r r8 do

    %65
    la la16 la la8 si16 do re8 re16 re r8 re
    si si16 si si8 do16 re mi8 mi16 mi r4
    r2 r8 la, si4

    %68
    do re sol, r
    R1

    %70 OK

    R1.*2
    r2 r mi'
    do la re

    %74
    sol,2. sol4 sol2
    r2 sol do

    %76
    r la re
    R1.*4
    r2 r la'

    %82
    fa re sol
    do,2. do4 do2
    r do fa

    %85
    r re sol
    r r mi
    r r re

    %88
    r r do
    R1.
    r2 r la'

    %91
    fa re mi\mbreak
    la,1 la2
    R1.*14

    %107 OOKK
    R1
    sol'8.[sol16 sol8 sol] la sol fa4
    mi r8 mi fa mi re4

    %110
    do2 r
    r r8 sol' do,4~
    do re2 mi4~

    %113
    mi fa fad sol~
    sol la mi2
    fa4 fad sol2

    %116
    do,4 r r2
    do8.[do16 do8 do]\mbreak do si la4
    sol8 sol' sol,4~sol la~

    %119
    la sol~sol do
    dod re~re mi~
    mi la fa sol

    %122
    do, mi fa8 mi re4
    do2 r
    r4 r8 do16 do do8 do do do

    %125
    do do r4 r r8 do16 do
    do8 do r do16 do do8 do do do\mbreak
    do do r4 r do

    %128
    re do sib do
    re la sib do
    fa,1

    %131
    R
    do''4 la sib sol
    la fa sol sol,

    %134
    do2 r8 do si la
    \once\slurDown sol2\parentSlur (sol16) sol' la fa sol mi fa re
    mi8 fa16 re mi do re si do8 do si la

    %137
    sol2 r4 fad
    sol1~
    sol2 fa?

    %140 OOOKKK
    la1
    re2 r4
    R2.*3

    %145
    r4 r la'
    la sol fa
    la2 la,4

    %148
    re re re
    re2 re4
    r mi4. mi8

    %151
    fa2 fa4
    R2.*3
    r4 r re

    %156
    re do sib
    re2 re,4
    sol sol'4. sol8

    %159
    sol2 sol4
    r la4. la8\mbreak
    sib4 sib, do

    %162
    re2 sib4~
    sib la sol~
    sol re'2

    %165
    sol,2.
    r4 sol' sol
    sib sib sib

    %168
    sib?2 la4
    sib sib sib,
    fa'4. fa8 fa4

    %171
    r r sib,
    fa'4. fa8 fa4
    R2.*2

    %175
    r4 fa mi
    re2 re4
    do2.

    %178
    fa\mbreak
    re
    do4 do si?

    %181
    la2 la4
    sol2.
    do4. re8 mi4

    %184
    re2.
    sol,
    r4 r do

    %187
    sol'4. sol8 sol4
    r r do,
    sol'4. sol8 sol4

    %190
    R2.*2
    r4 sol sol
    la la r

    %194
    r si si
    do2 mi,4
    fa sol2\mbreak

    %197
    do,4 do si
    la2 la4
    sol sol' fa

    %200
    mi2.
    fa4 sol2
    do,2.\fermata

}


Ibcn = \relative do {

    do'4 r8 mi, la4 r8 re,
    sol4 do, sol' sol,
    do4 r8 mi, la4 r8 re,

    %4
    sol4 do, sol'2
    do r4 la
    re sol, re'2

    %7
    sol,2. mi4
    la2 re4 re,
    sol2 do4 mi,

    %10
    fa2. la4
    sol1
    do\fermata

    %13 OK
    do'2. si4
    do2 si4 la
    sol mi fa re

    %16
    do si' la sol~
    sol fad sol mi
    re sol do, do_\markup\italic "instrom[enti]"

    %19
    do si do do,
    mi sol do,2\mbreak
    do''4_\markup\italic"Sop[rano]" la sol2

    %22
    la8 si do do, sol'4 si
    do la sol re
    mi fa sol sol,

    %25
    do do'_\markup\italic "instrom" la fad
    sol mi dod re
    sol, si_\markup\italic "sop" do la

    %28
    sol sol'8. fa16 mi2\mbreak
    fa4 re do si
    do_\markup\italic "instrom" si la sol

    %31
    fad sol do si
    la sol fad sol
    do mi_\markup\italic "sop" fa sol

    %34
    do,2_\markup\italic "instrom" la4 re
    sol, sol'_\markup\italic "sop" do la
    sol si, do la

    %37
    sol si do re\mbreak %%%% fine quarta riga  OK
    mi fa sol sol,
    do2_\markup\italic "sop" do

    %40
    re~re4 do
    mi2 la,4 fa'_\markup\italic "instrom"
    re mi la, la'~

    %43
    la_\markup\italic "sop" sold la la8. sol?16
    fad2 sol4 mi
    re2 dod4_\markup\italic "instrom" re

    %46
    sol, fad sol re'\mbreak
    sol, si_\markup\italic "sop" do do'8. si16
    la2~la4 sol

    %49
    fad2 mi_\markup\italic "instrom"
    mi4 do la2~
    la4 sol la si

    %52
    mi red mi2
    mi4 fad sol8 dod, re4
    sol2~sol4 fad\mbreak

    %55
    sol4. mi8 la4. sol8
    fa4 mi re2
    do4 sol' do, si

    %58
    la fa sol2
    do4_\markup\italic "instrom" si do2
    do'4 sold la2~

    %61
    la4 si do8 fad, sol4
    do,2~do4 si
    do_\markup\italic "instrom" do mi sol\mbreak

    %64
    do,2 r4 r8 do_\markup\italic "sop"
    la4 la8 si16 do re4 r8 re
    si4 si8 do16 re mi2

    %67
    do4 si la si
    do re sol, si_\markup\italic "sop"
    do re sol,2

    %70 OK
    sol'2. la4 si2
    do si la\mbreak
    sol1 mi2_\markup\italic "instrom"

    %73
    do la re
    sol,1.
    r2 sol do_\markup\italic "sop"

    %76
    r la re
    si1.
    la

    %79
    sol2 sol' mi
    fa mi re
    do1 la'2_\markup\italic "instrom"

    %82
    fa re sol
    do,1.
    r2 do fa_\markup\italic "sop"

    %85
    r re sol
    mi1.
    re\mbreak

    %88
    do
    si
    la1 la'2_\markup\italic "instrom"

    %91
    fa re mi
    la,1.
    la2_\markup\italic "sop" si do~

    %94
    do fa1
    mi1.
    do2 re mi~

    %97
    mi la1
    sol1.
    do,2 re mi

    %100
    fa sol la
    fa sol sol,\mbreak
    do do' si

    %103
    la1 mi2
    fa sol la
    fa sol sol,

    %106  OOOKKK
    do1.
    do4 do'4. si8 la4
    sol4. sol8 la sol fa4

    %109
    mi4. mi8 fa mi re4
    do do4. si8 la4
    sol2 r8 sol' do,4~\mbreak

    %112
    do re\parentSlur (re) mi~
    mi fa fad sol~
    sol la mi2

    %115
    fa4 fad sol2
    do,4 mi fa8 mi re4
    do do4. si8 la4

    %118
    sol2~sol4 la~
    la si~si do
    dod re~\mbreak re mi~

    %121
    mi la fa sol
    do, mi fa8 mi re4
    do1~

    %124
    do~
    do
    do~

    %127
    do2. do4
    re do sib do
    re la sib do

    %130
    fa,1
    do'_\markup\italic"instrom"
    do'4 la sib sol\mbreak

    %133
    la fa sol sol,
    do2~do8 do si la
    sol2~sol16 sol' la fa sol mi fa re

    %136
    mi8 fa16 re mi do re si do4 si8 la
    sol2 r4 fad
    sol1~

    %139
    sol2 fa?
    la1   %141 OK
    re2._\markup\italic"sop"

    %142
    re
    mi\mbreak
    fa2 sol4

    %145
    la2.
    la4 sol fa
    la2 la,4

    %148
    re2._\markup\italic"instrom"
    re
    r4 mi2

    %151
    fa2.
    dod
    re

    %154
    mi
    re~
    re4 do sib

    %157
    re2.
    sol,2 sol'4
    sol2.

    %160
    r4 la2\mbreak
    sib4 sib, do
    re2 sib4~

    %163
    sib la sol
    sol re'2
    sol,2.~

    %166
    sol4 sol' sol
    sib2.~
    sib2 la4

    %169
    sib2 sib,4\tu
    fa'2.
    r4 r sib,

    %172
    fa'2.~
    fa\solo
    fa2 mi4_\markup\italic"con instrom[enti]"

    %175
    fa fa mi\mbreak
    re2.
    do

    %178
    fa
    re
    do2 si?4

    %181
    la2.
    sol
    do4. re8 mi4

    %184
    re2.
    sol,
    do2 do4

    %187
    sol'2.
    r4 r do,
    sol'2.~

    %190
    sol~
    sol2 fad4_\markup\italic"con instrom"
    sol2.

    %193
    la
    si\mbreak
    do2 mi,4

    %196
    fa sol2
    do, si4
    la2.

    %199
    sol4 sol' fa
    mi2.
    fa4 sol sol,

    %202
    do2.\fermopz

}

IbfIn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

IbfIIn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 s8 <6>
    <7>4 s8 <7>
    <7> <6> s4 <4> <3>
    s s8 <6> <7>4 s8 <7>
    <7> <6> s4 <4> <3>
    s1
    <7 _+>2 <4>4. <_+>8
    s1
    <7 _+>
    <7>2 s4 <6>
    <9>4 <8> s <6>
    <6 4>2 <5 3>
    s1
    s2. <6>4
    s2 <6>4 <6\\>
    s <6> s <6>
    s <6> s2
    <2>2 s4 <6>
    <7> <4>8 <3> s2
    s4 <6> s2
    <6>4 <4>8 <3> s2  %% OK bar 20
    s4 <6\\> <5> <6>
    <6>2 s4 <6>
    s <6> s2
    <6>4 <6 5> <5 4> <3>
    s2 s4 <6 5>
    s2 <6 5>4 <5 4>8. <_+>16  %%% OOKK 26
    s4 <6> <6> <6\\>
    s2 <6>
    s4 <6> s <6>
    s <6> s <6>
    <6 5>4 <4> <3> <6>
    s4 s8 <6 4> <6 5>4 <5 4>8 <3>
    s4 <6> <6 5> s
    s2 s4 <_+>
    s2 s4 <6\\>
    s <6> s <7>8. <6\\>16
    s4 <6> s <9 7 4> %%% OK bar 37
    <6> <9 7 5> <6 4> <6 4>8 <5 3>
    s2 <6>
    <5>4 <6\\> <4> <6>
    <6 4> <5 _+> s2
    <6 5>4 <4>8. <_+>16 <_+>4 s
    <2>1
    <6>4 <5> s <6\\>
    <_+>2 <6>4 <_+>
    s <6> s <4>8 <_+>
    s4 <6> s2
    <5>4 <6\\> <4+ 2> s
    <7>4. <6>8 s2
    s1
    <6 4+ 2>4 <6> <6 5> <4>8 <_+>
    <_+>4 <6> s2
    s4 <6> s8 <7 5 _+> <4> <_+>
    s2 <2>4 s
    s1
    s4 <6> <7> <6> s1
    <6>4 <6> <6 4> <5 3>
    s <6> s2
    s4 <6> s2
    <6>4 s s8 <7 5 _+> <5 4>8. <3>16
    s2 <2>
    s <6>4 <4>8 <3>
    s1*2
    <6>4 <6> s2
    s s4 <7>8 <6>
    <7 5> <6> <5 4> <_+> s4 <6>
    <6 5> <4>8. <_+>16 s2

    %70 juravit
    s1 <6>2 s1 <6\\>2
    s1.
    <6 5>2 <7> <_+>
    s1.*2
    s2 <7> <_+>
    <7>2 <6>1
    <7>2 <6\\>1
    s1 <6>2
    s <6> <6> s1.
    <6 5>2 <7> s
    s1.*2
    s2 <7> s
    <7>1 <6>2
    <7>1 <6>2
    <6>1.
    <7>1 <6\\>2
    s1.
    <6>2 <6 5> <_+>
    s1.
    s2 s <6>
    <6> <7> <6>
    <_+>1.
    s
    <6>2 <7> <6\\>
    s1.*2
    s1 <6 4>2
    <7 5> <4> <3>
    s1.
    s1 <6>2
    s s <6 4>
    <7 5> <4> <3>
    s1.

    %107 dominus OOOKKK
    s2 s4 <7>8 <6\\>
    s4. <6>8 s <6> <7>8. <6>16
    <_->4. <6>8 s <6> <7>8. <6>16
    s2 s8 <6> <7> <6\\>
    s1
    <6>4 <5> <6> <5>
    <6> <6 5> <6 5> s
    <6>4 s <6> <5>
    <7> <6> s8 <6> <7> <6>
    s2 s8 <6> <7> <6\\>
    s2 s8 <6> <7> <6\\>
    <6\\>2 <6>
    <6\\ 5>4 <_+> <6>2
    <6>4 <_+> <6> s
    s2 s4 <4>8. <3>16
    s4 <6> <6> <7>8. <6>16
    s1*5
    s4 <6 4> <7>8 <6 5> <4>8. <3>16
    s4 <6> <7>8 <6 5> <5 4>8. <3>16
    s1*2
    s4 <6> s <6 _->
    s <6>8 <5> <7> <6 4> <5 4>8. <3>16
    s2 s4 <6>16 <7> <6\\>8
    s2 s8 s16 <6> <6>8 <6>
    s <6> <6> <6> s4 <6>16 <7> <6\\>8
    s2 s4 <6 5>
    <4>4. <_->8 <4>4 <3>
    <6 4+ 2>2 <6>
    <6 4>2 <5 _+>

    %141 Conquassabit
    <_->2.
    <6>
    <5>4 <6\\>2
    <6> <_->4
    <_+>2 <_+>4
    <6 4 2>4 <6> <6>
    <6 4> <5 4> <_+>
    s2.
    <6>
    s4 <6\\>2
    <6>2.
    <6>
    <_+>
    <7>2 <6\\>4
    <_+>2 <_+>4
    <4 2>4 <6> <6>
    <6- 4>4 <5 4> <_+>
    <_->4 <_->2
    <6 _->2 <6 _->4
    s4 <6\\>4. <6\\>8
    <6>2.
    <_+>2 <6>4
    <4\+ 2> <6\\> <_->
    <_-> <4> <_+>
    <_->2.
    <6->4 <6- _->2
    <6 4>4 <5 3>2
    <4 2>2 <6>4
    s2.*5
    <2>2.
    s2 <6>4
    <7>2 <6>4
    s2.
    s
    <7>2 <6>4
    s2 <6>4
    <7>2 <6\\>4
    s2.
    <9>4 <8> <6>
    <6 4>2 <5 _+>4
    s2.*6
    <2>2.
    s2.*2
    <6>4 <6>2
    s2 <6>4
    <6 5> <4> <3>
    s s <6>
    <7>2 <6\\>4
    s2.
    <6>
    <6 5>4 <5 4> <3>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 45
    s1*12
    \bar"||"\break
    \mark \markup\huge "[2.] Dixit."
    s1*57
    \bar"||"\break
    \mark \markup\huge "[3.] Iuravit."
    \time 3/2
    \tempo 1. = 70
    s1.*37
    \bar"||"\break
    \mark \markup\huge"                       [4.] Dominus a dextris"
    \time 4/4
    \tempo 2 = 45
    s1*34
    \bar"||"\break
    \mark \markup\huge"                [5.] Conquassabit"
    \time 3/4
    \tempo 2. = 50
    s2.*62
    \bar"||"

}

IvlaI = {
    \global
    \notypeset
    \clef alto
    <<\IvlaIn \forma>>

}

IvlaII = {
    \global
    \clef tenor
    <<\IvlaIIn \forma>>

}



IvlI = {
    \global
    <<\IvlIn \forma>>

}

IvlII = {
    \global
    <<\IvlIIn \forma>>

}

Ivc = {
    \global
    \clef bass
    <<\Ivcn \forma\IbfIn>>

}


Ivoce = {
    \new Voice = "dixit"
    \global
    <<\Ivocen \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \IbfIIn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IIvocen = \relative do'' {

    \autoBeamOff

    sol8. sol16 sol8 sol8. sol16 sol8
    mi8. re16 (do8) do8 do' mi
    re8. [mi16 re mi] do8. si16 do8

    %4
    si8.[(la16) sol8] sol4.
    R2.*2
    do8. do16 do8 do8. do16 do8

    %8
    si8. la16[(sol8)] sol mi' sol\mbreak
    fa8. [sol16 fa sol] fa8. mi16 fa8
    mi8.[(re16) do8] do4.

    %11
    R2.*3
    r8 la si do[(re)] mi
    fa[(mi)] re mi8. re16 do8

    %16
    r r re  do4.
    r8 r si la4.\mbreak %%%5 fine pagina
    r8 sol4 sol (fad8)

    %19
    sol4. r4 r8
    R2.*2
    la4 si8 do8. do16 do8

    %23
    la[(si)] do si4 sol8
    R2.*2
    r4 r8 re'4 mi8

    %27
    fa8. fa16 fa8 re[(mi)] fa
    mi4 do8 r4 r8\mbreak
    R2.

    %30
    r8 sol[si] do[si la]
    si[do re] mi[re do]
    re[mi fa] sol[re mi]

    %33
    fa[mi do] mi re4
    do4. r4 r8
    R2.

    %36
    r8 si[re] mi[re do]
    re4 re8 r4 r8\mbreak
    r re[mi] fa[mi re]

    %39
    mi[la, si] do[si la]
    fa'[la, si] do[si mi]
    do4 la8 r4 r8

    %42
    r do[mi] fa[mi re]
    mi4 mi8 r4 r8
    r mi,[sol] la[sol fa]\mbreak

    %45
    sol[la si] do[si la]
    si[do re] mi[sol, la]
    si[do si] la[re do]

    %48
    si4 sol8 r4 r8
    r sol[si] do[si la]
    si4 si8 r4 r8

    %51
    r si[re] mi[re do]
    re4 re8 r4 r8\mbreak
    r mi[sol] la[sol fa]

    %54
    sol[do, mi] fa[mi re]
    mi4 mi8 r4 r8
    r do[re] mi[re do]

    %57
    re[mi fa] sol[si, do]
    re[fa mi] re[sol fa]
    mi4 do8 r4 r8

    %60
    R2.*3\mbreak
    r8 do[mi] sol[sol, sib]
    la[fa la] do[mi, sol]

    %65
    fa[la re] sol,[do mi]
    re4. do
    do~do4 si8

    %68
    do2.
    R2.*2
    r4 r8 r sol[si]

    %72
    do[si la] si[re mi]\mbreak
    fa[mi re] mi4.
    r8^\markup\italic"Adagio" si[do] re[do8. si16]

    %75
    do4.~do4 si8
    do\breve
    do\fermata

}

IItesto = \lyricmode {

    Glori - a Pa -- tri et Fi -- li -- o et Spi -- ri - tui _ Sanc -- to, glori - a Pa -- tri et Fi -- li -- o et Spi -- ri - tui _ Sanc -- to,

    si -- cut erat _  in princi - pio, _ et nunc et nunc et sem -- per

     et in sæcu - la sæcu - lo -- rum, et in sæcu - la sæcu - lo -- rum.

     A - - - - - - men A -- men, A - - men A - - - - - - men A - - men A - - - - - - - - men  A - - men

     A - - men  A - - - - men A - - - - - - men A - - - - - - men A - men A - - - men A - - - - men.

}

IIvlIn = \relative do'' {

    R2.*3
    sol'8. sol16 sol8 sol8. sol16 sol8
    mi8. re16 do8 do do mi\mbreak

    %6
    re8. do16 si8 si mi re
    do4. r4 r8
    R2.*2

    %10
    do'8. do16 do8 do8. do16 do8
    si8. la16 sol8 sol si re
    do8. si16 la8 la4.

    %13
    la8 la si do4.
    r8 do, re mi fa sol
    la4 si8 do4 la8

    %16
    sol4. r8 r fad
    sol4. r8 r mi
    sol4 sol,8 la4.\mbreak

    %19
    si4. la4 si8
    do8. do16 do8 si4 dod8
    re4 re8~re8 re8. dod16

    %22
    re4. r4 r8
    R2.
    re4 mi8 fa8. fa16 fa8

    %25
    mi4 fad8 sol8. sol16 sol8
    fa4 mi8 re4 re8
    R2.

    %28
    r4 r8 r do re
    mi8. fa16 sol8 sol4 fad8
    sol4. r4 r8

    %31
    R2.*4\mbreak
    r8 sol si do8. si16 la8
    si4 si8 r4 r8

    %37
    r si, re mi re do
    re4 re8 r4 r8
    R2.*2

    %41
    r8 do mi fa mi re
    mi4 mi8 r4 r8
    r mi sol la sol fa

    %44
    sol4 sol8 r4 r8
    R2.*3
    r8 si, re mi re do

    %49
    re4 re8 r4 r8
    r si re  mi re do\mbreak
    re4 re8 r4 r8

    %52
    r re mi fa mi re
    mi4 mi8 r4 r8
    R2.

    %55
    r8 la do re do si
    do4 do8 r4 r8
    R2.*2

    %59
    r8 do, mi sol4.
    r8 re fa la la, do
    mi sol sib la4.~

    %62
    la8 la, do do4 si8
    do4. r4 r8
    r4 r8 r do mi

    %65
    fa4. r8 mi sol
    la fa la do4.\mbreak
    la sol

    %68
    sol8 do, mi sol sol do
    la4.~la
    r8 re, fa mi do mi

    %71
    sol re fa mi4 sol8
    sol4 fad8 sol4.
    si,8 do re sol,4 r8

    %74
    sol'4. sol
    sol sol
    sol\breve

    %77
    sol

}

IIvlIIn = \relative do'' {

    R2.*4
    do8. do16 do8 do8. do16 do8
    si8. la16 sol8 sol sol' fa

    %7
    mi4. r4 r8
    R2.*3
    sol8. sol16 sol8 sol8. sol16 sol8\mbreak

    %12
    mi8. re16 do8 do mi sol
    fa8. mi16 re8 do do' sib
    la4. sol

    %15
    fa sol4 mi8
    re4. r8 r la
    si4. r8 r8 do

    %18
    si4 do8 re4.
    re4 mi8 fa8. fa16 fa8
    mi4 fad8 sol8. sol16 sol8

    %21
    sol4 fa?8 mi mi8. mi16
    re4. r4 r8
    R2.\mbreak

    %24
    si4 dod8 re8. re16 re8
    do?8. si16 la8 si si sol
    la8. si16 do8 si4 si8

    %27
    R2.
    r4 r8 la4 si8
    do8. do16 do8 la8. si16 do8

    %30
    si4. r4 r8
    R2.*3
    r8 do mi fa mi re

    %35
    mi mi sol  la sol fad
    sol4 sol8 r4 r8
    r sol, si do si la

    %38
    si4 si8 r4 r8\mbreak
    R2.*2
    r8 la do re do si

    %42
    do4 do8 r4 r8
    \parenthesize r do mi fa mi re
    mi4 mi8 r4 r8

    %45
    R2.*3
    r8 sol, si do si la
    si4 si8 r4 r8

    %50
    r sol si do si la
    si4 si8 r4 r8
    r si do re do si

    %53
    do4 do8 r4 r8
    R2.
    r8 mi la si la sold

    %56
    la4 la8 r4 r8\mbreak
    R2.
    r4 r8 r sol, si

    %59
    do4. r8 si re
    fa fa la do do, mi
    sol4. do,8 la do

    %62
    re4.~re8 re fa
    mi4. r4 r8
    r la, do mi sol, do

    %65
    re fa la do4.
    r8 la fa mi do mi
    re4. re

    %68
    mi r4 r8\mbreak
    r sol, do re la do
    si si re do4.

    %71
    si do4 re8
    mi re do re si do
    re do si do si la

    %74
    si re mi fa mi re
    mi4. re
    mi\breve

    %77
    mi

}

IIvlaIn = \relative do' {

    R2.
    r4 r8 r sol' sol
    sol8. sol16 sol8 sol4 fad8

    %4
    sol4. sol
    R2.*2
    la8. la16 la8 la8. la16 la8\mbreak

    %8
    sol4 sol8 sol sol sol
    do8. si16 la8 sol4.
    sol8 sol sol sol8. sol16 fad8

    %11
    sol4. sol
    la la
    la sol

    %14
    fa sol
    r4 r8 r r mi
    sol re re mi8. re16 do8

    %17
    re sol8. fa16 mi4.\mbreak
    r8 r mi la,4.
    sol8 sol' sol fa4 r8

    %20
    r la la sol4.
    la4 re,8 mi4.
    fad r4 r8

    %23
    R2.
    r4 r8 re4 re8
    mi la la sol4.

    %26
    fa4 sol8 sol4 sol8
    R2.
    r4 r8 fa4 fa8\mbreak

    %29
    mi8. mi16 mi8 mi re re
    re4. r4 r8
    R2.*3

    %34
    r8 mi sol la sol8. fa16
    mi4 re8 do4.
    re4 re8 r4 r8

    %37
    r sol sol sol4 r8
    sol4 sol8 r4 r8
    R2.*2

    %41
    r8 la la la4 r8
    la4 la8 r4 r8
    r sol sol fa sol la

    %44
    sol4 sol8 r4 r8\mbreak
    R2.*3
    r8 sol sol sol4 r8

    %49
    sol4 sol8 r4 r8
    r sol sol sol4 r8
    sol4 sol8 r4 r8

    %52
    r sol sol sol4 sol8
    sol4 sol8 r4 r8
    R2.

    %55
    r8 la mi fad4 si8
    mi,4 mi8 r4 r8
    R2.

    %58
    r4 r8 r si re
    mi4. re
    re mi

    %61
    mi4 sol8 fa4.
    r8 r la sol4.\mbreak
    sol4. r4 r8

    %64
    r do, do do4 do8
    r re re do sol' sol
    fa la la la4.

    %67
    la r8 re, sol
    sol4. r4 r8
    R2.

    %70
    r8 sol sol sol4.
    sol r4 r8
    r sol la sol4.

    %73
    sol sol
    sol sol
    sol sol

    %76
    sol\breve
    sol\breve

}

IIvlaIIn = \relative do' {

    R2.
    r4 r8 r mi do
    re8. re16 re8 mi8. re16 do8

    %4
    re8. do16 si8 si4.
    R2.*2
    mi8. mi16 mi8 re8. re16 re8

    %8
    re8. do16 si8 si si mi\mbreak
    do4. re8. do16 re8
    mi mi mi mi8. re16 do8

    %11
    re8. do16 si8 si sol si
    do8. re16 mi8 mi do mi
    re8. mi16 fa8 mi4 re8

    %14
    do4. do
    r4 r8 r r do
    re4 si8 do4 do8

    %17
    si8. do16 re8 do4.
    r8 r sol re'4.\mbreak
    re4 r8 r re re

    %20
    do4. r8 mi mi
    la,4. sib8 la4
    la4. r4 r8

    %23
    R2.
    r4 r8 la4 si8
    do8. do16 do8 si4 do8

    %26
    do4 do8 re4 re8
    R2.
    r4 r8 la4 fa8

    %29
    sol8. sol16 sol8 la4 la8
    sol4. r4 r8
    R2.*3

    %34
    r8 do do do4 si8
    do4 re8 mi re do
    si4 sol8 r4 r8\mbreak

    %37
    r re' re do re mi
    re4 re8 r4 r8
    R2.*2

    %41
    r8 mi mi re mi fa
    mi4 mi8 r4 r8
    r do do do4 r8

    %44
    do4 do8 r4 r8
    R2.*3
    r8 re re do re mi

    %49
    re4 re8 r4 r8
    r re re do re mi
    re4 re8 r4 r8

    %52
    r8 re do si do re
    do4 do8 r4 r8
    R2.\mbreak

    %55
    r8 mi mi re4 re8
    do4 do8 r4 r8
    R2.*2

    %59
    r8 mi, sol si sol si
    la4. la
    sol la8 do la

    %62
    la re re re4.
    do r4 r8
    r la la sol sol sol

    %65
    la la fa sol4.
    re'4 la8 r la do
    re la re re4.\mbreak

    %68
    do r4 r8
    R2.
    r8 re si do mi do

    %71
    re4. r4 r8
    r si do si4 sol8
    r sol' fa  mi re do

    %74
    re4 do8 si do re
    do4. re
    do\breve

    %77
    do\breve

}

IIvcn = \relative do {

    R2.
    r4 r8 r do do
    si8. si16 si8 la4.

    %4
    sol~sol
    R2.*2
    la'8. la16 la8 fad8. fad16 fad8

    %8
    sol4 sol8 mi mi mi
    la4. si\mbreak

    %10
    do la
    sol mi
    la la,

    %13
    re mi
    fa mi
    re do4 do8

    %16
    si4. r8 r la
    sol4. r8 r do
    mi4. re

    %19
    sol, re'
    la mi'4 mi,8
    fa4. sol8 la4

    %22
    re,4. r4 r8
    R2.\mbreak
    sol'4 mi8 re8. re16 re8

    %25
    la'4 la8 mi8. mi16 mi8
    fa4 do8 sol'4 sol8
    R2.

    %28
    r4 r8 fa4 re8
    do8. re16 mi8 do re4
    sol,4. r4 r8

    %31
    R2.*3
    r8 la' sol fa sol4
    do, si8 la4.

    %36
    sol r4 r8\mbreak
    r sol' sol do,4.
    sol r4 r8

    %39
    R2.*2
    r8 la' la re,4.
    la r4 r8

    %43
    r do' do fa,4.
    do r4 r8
    R2.*3

    %48
    r8 sol' sol do,4 do8
    sol4 sol8 r4 r8
    r sol' sol do,4 do8

    %51
    sol4 sol r\mbreak
    r8 sol' sol sol,4 sol8
    do4 do8 r4 r8

    %54
    R2.
    r8 do do si4 si8
    la4 la8 r4 r8

    %57
    R2.*2
    r8 do do sol4 sol8
    re'4. la

    %61
    mi fa
    fad sol
    do r4 r8

    %64
    r fa fa mi4 mi8
    re4. mi
    fa la\mbreak

    %67
    fad sol
    do, mi
    fa fad

    %70
    sol sol
    sol sol
    sol sol

    %73
    sol sol
    sol sol
    sol sol

    %76
    do,\breve
    do\breve

}


IIbcn = \relative do {

    do4. si
    do do
    si la

    %4
    sol sol'
    la mi4 fad8\mbreak
    sol4. sol

    %7
    la fad
    sol mi
    la si

    %10
    do la
    sol mi
    la la,

    %13
    re mi
    fa mi
    re do

    %16
    si la
    sol do\mbreak
    mi re

    %19
    sol, re'
    la mi'4 mi,8
    fa4. sol8 la4

    %22
    re4. mi
    fad sol
    sol4 mi8 re4.

    %25
    la' mi
    fa4 do8 sol'4.
    la si\mbreak

    %28
    do fa,4 re8
    do8. re16 mi8 do re4
    sol4. mi4 fad8

    %31
    sol4. sol
    sol sol
    la4 sol8 fa sol4

    %34
    do8 la sol fa sol4
    do, si8 la4.\mbreak
    sol8 sol' si do si la

    %37
    sol4. do,
    sol la4 si8
    do4. do

    %40
    re mi
    la re,
    la8 la' do re do si

    %43
    do4. fa,
    do fa
    mi la\mbreak

    %46
    sol do,
    re re
    sol do,

    %49
    sol' fad
    sol do,
    sol8 sol' si do si la

    %52
    sol4. sol,
    do fa
    mi re

    %55
    do si
    la8 la' si\mbreak do si la
    sol4 fa8 mi4.

    %58
    fa sol
    do, sol
    re' la

    %61
    mi fa
    fad sol
    do mi

    %64
    fa mi
    re mi
    fa la\mbreak

    %67
    fad sol
    do, mi
    fa fad

    %70
    sol sol
    sol sol
    sol sol

    %73
    sol sol
    sol sol
    sol sol

    %76
    do,\breve
    do\breve

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s
    <6>4. <7>4 <6\\>8
    s2.
    s
    s4. <6>
    s <6 5>
    s2.
    <6>4. <6 5>
    s <7>4 <6\\>8
    s2.
    <_->4. <_->
    s4. <6>
    s <6> <5>4 <6>8 <6>4.
    <6> <7>4 <6\\>8
    s2.
    <5>4 <6>8 <4>4 <_+>8
    s2.
    <5>4 <6\\>8 <5>4 <6\\>8
    <9>4 <8>8 <6 5 _-> <4> <_+>
    <_+>4. <6>
    <5> s
    s4 <6\\>8 s4.
    <5>4 <6\\>8 <5>4 <6>8
    s2.
    <6>4. <5>  %%% fine pagina
    s4. s4 <6>8
    s4 <6>8 <6 5> <4> <_+>
    s4.
    <6>4 <6>8
    s4. <6 4>
    <5 3> s
    <6>8 <5> <6 4> <7 5> <5 4> <3>
    s4. s8 <6 4> <5 3>
    s4 <6>8 <7>4 <6\\>8
    s4. s4 <6\\>8
    s4. <5>4 <6>8
    s4. <6>
    s <6>
    s <6 4>8 <5 _+>4
    s2.*6
    <6 4>4. <5 _+>
    s2.
    s4. <6>
    s2.*2
    s4. <7>
    s2.
    s4. <7>4 <6>8
    s2.*2
    s4. <6>
    <6 5> <4>4 <3>8
    s2.
    s
    <6>4 <5->8 s4.
    <6 5> <4>4 <3>8
    s4. <6>
    s <6>
    s <6>
    <6> s
    <6 5> <4>4 <3>8
    s4. <6>
    s <6>
    s <6 4>
    <5 3> <6 4>
    <6 4> <5 3>
    <5 3> <6 4>
    <5 3> s
    <6 4> <5 4>4 <3>8

}

forma = {

    \time 6/8
    \key do\major
    \tempo 2. = 40
    s2.*75
    \set Score.measureLength = #(ly:make-moment 8 4)
    s\breve
    s\breve\fermata
    \bar"|."

}

IIvlaI = {
    \global
    %\notypeset
    \clef alto
    <<\IIvlaIn \forma>>

}

IIvlaII = {
    \global
    \clef tenor
    <<\IIvlaIIn \forma>>

}


IIvlI = {
    \global
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

}

IIvc = {
    \global
    \clef bass
    <<\IIvcn \forma\IIbfn>>

}


IIvoce = {
    \new Voice = "gloria"
    \global
    <<\IIvocen \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup \smaller "Dixit Dominus [BuxWV 17]"
    %subsubtitle = #(string-append "  ")
    composer = \markup \center-column{"D. Buxtehude (1637 - 1707)"}
}

\markup \huge {[1.] Sonata}

\score {

    \new ChoirStaff   <<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major\time 4/4  r1^\markup \center-align"Soprano" _\markup\center-align "o Tenore"}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \Ivoce
            \new Lyrics \lyricsto "dixit" \Itesto
        >>

        \new PianoStaff  <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino 1."}
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino 2.do"}
                \IvlII
            >>
        >>

        \new PianoStaff  <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola 1."}
                \IvlaI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola 2.da"}
                \IvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup  \center-column{"Spinett[a]""o Violon[o]"}
            \set Staff.midiInstrument = #"cello"
            \Ivc
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup  \center-column{"Violono""Organo"}
            \set Staff.midiInstrument = #"contrabass"
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
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

\markup \huge {[6.] Gloria}

\score {

    \new ChoirStaff   <<

        \new Staff
        <<
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \IIvoce
            \new Lyrics \lyricsto "gloria" \IItesto
        >>

        \new PianoStaff  <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new PianoStaff  <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvlaI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvlaII
            >>
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \IIvc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
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
