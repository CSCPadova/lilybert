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
  \senza \tupletSpan 4
}

Ivln = \relative do'' {

    do1
    sol'8 mib re do sib lab sol fa
    mib1

    %4
    sol'8 mib re do sib lab sol fa
    mib2~mib8[re16 mib fa8 fa]
    mib2~mib8[re16 mib fa8 fa]

    %7
    mib sol do  mib re, fa si re
    mib, sol do mib\mbreak re, fa si re
    mib,2~mib4 do'

    %10
    mib8 do fad4~fad2
    sol4 re si sol
    mib'8 do fad4~fad2

    %13
    sol r
    do,8 sol mib sol do mib do sol %%%% inizio ripresa
    lab4 r do r

    %16
    fa r lab r\mbreak
    sib,8 fa re fa sib re sib fa
    sol4 r sib r

    %19
    mib r sol r
    lab8[sib lab sol fa mib re do]
    si2 r

    %22
    re8 mib re do si la? sol fa
    mib2 r
    do'1\p~

    %25
    do~\mbreak
    do4~do16\f re mib fa sol4 do,
    re2 si

    %28
    do r
    reb1\p ~
    reb~

    %31
    reb4~reb16\f mib fa sol lab4 do,
    re?2 si
    do r4 sol'\solo\mbreak  %%%% fine ripresa

    %34 OO KK
    \tuplet 3/2 { do8(sol do) sol[(mib sol)] mib(do mib) do[sol do] }
    do,(sol' do4)~\tuplet 3/2 { do8 re mib fa[mib re] }
    do,(sol' do4)~\tuplet 3/2 { do8 re mib fa[mib re] }

    %37
    \appoggiatura re mib4 do r sol'
    mib'2~\tuplet 3/2 { mib8 re do si[do re] }
    re2(\tuplet 3/2 { do8) sib? lab  sol[lab sib]}

    %40
    sib2(\mbreak \tuplet 3/2 { lab8) sol fa mib[fa sol]
    fa mib re do[re mib] re do si la[si do]}
    \appoggiatura do si4 sol, r sol''

    %43
    \appoggiatura lab8 sol16(fa sol8) \appoggiatura lab8 sol16[(fa sol8)] \appoggiatura lab8 sol16(fa sol8) \appoggiatura lab8 sol16[(fa sol8)]
    \tuplet 3/2 { do sol fa mib[re do] } fa,2
    \appoggiatura sib'8 lab16[(sol lab8)] \appoggiatura sib8 lab16(sol lab8) \appoggiatura sib8 lab16(sol lab8) \appoggiatura sib8 lab16[(sol lab8)]

    %46
    \tuplet 3/2 { re la! sol fad[mi re]\mbreak } sol,2
    mib''4 dod \appoggiatura re8 dod16(sib dod8)~dod4
    dod?2(re16) fa, re fa la, [fa' re fa]

    %49
    re'4 si \appoggiatura do?8 si16 (la si8)~si4
    si?2(do16) mib, do mib sol, [mib' do mib]
    do'4 la \appoggiatura sib8 la16(sol la8)~la4

    %52
    la2(sib16) re, sib re fa, [re' sib re]
    sib'4 \appoggiatura la8 sol16(fa sol8) <<lab4\\lab>> \appoggiatura sol8 fad16(mi fad8)\mbreak %%% <======== OK
    sol16(re sib re) re,([re' sib re)] sol(re sib re) re,[(re' sib re)]

    %55
    fad(re la re) re, [(re' la re) ] fad[ (re la re) ] re, (re' la re)
    la'( fad re fad) re,[(fad' re fad)] la[( fad re fad)] re,(fad' re fad)
    do'(fad, re fad) re,[(fad' re fad)] do'(fad, re fad) re,[(fad' re fad)]

    %58
    \once\slurDown sib8-.(do-. do-. re-. re-. mi-. mi-. fad-.)
    sol2~sol8 [fa?(mib?) re16(do)]\mbreak
    re r do8[(sib) lab16(sol)] lab r sib8[(la?) sol16(fad)]

    %61
    sol r la8[(sol) fad?16(mib)] re8 r sol16\tr(fad! sol la)
    sol4 sol16\tr(fad sol la) la2\tr
    <<sol4\\sol\\sol,1>>

    %64 OK
    re'8[sib la sol fa  mib re do]
    sib1
    re'8[sib la sol fa mib re do]\mbreak

    %67
    sib4 sib'~sib8[la16 sib do8 do]
    sib2~sib8[la16 sib do8 do]
    sib re sol sib la, do fad la

    %70
    sib, re sol sib la, do fad la
    sol2 r
    sol,1\p~

    %73
    sol~
    sol4~sol16\f la sib do re4  sol,\mbreak
    la2 fad

    %76 OK
    sol8 sol'\solo \appoggiatura la sol16[(fad sol8)] re8-. sol-. \appoggiatura la sol16[(fad sol8)]
    la8 la \appoggiatura sib la16[(sol la8)] re,8 la'  \appoggiatura sib la16[(sol la8)]
    sib8[sib] \appoggiatura do sib16(la sib8) re,8[si'] \appoggiatura do si16(la si8)

    %79
    do8[do] \appoggiatura re do16(si? do8) re,[dod'] \appoggiatura re dod16(si? dod8)
    re[do?16 sib? la sol fad mi] re8[do16 sib la sol fad mi]
    re2\tr sib''16 fa? re sib fa' [re sib fa]\mbreak

    %82
    re' [sib fa re] sib' fa re sib lab''(sib, re, sib' lab'8\noBeam) r
    sol16(sib, mib, sib' sol'8\noBeam) r do16 sol mi do sol'[mi do sol]
    mi'[do sol do,] do' sol mi do sib''(do, mi, do' sib'8\noBeam) r

    %85
    la16(do, fa, do' la'8\noBeam) r re16 la fad re la'[fad re la]
    fad'[re la re,] fad' re la re, do''(re, fad, re' do'8\noBeam) r
    sib16(re, sol, re'  sib'8\noBeam) r\mbreak re16 do do sib sib [mib! mib re]

    %88
    re do do fa fa [mib mib re] re sol sol fa fa [mib mib la]
    la [sol sol fa] fa la la sib sib4 r8 sib
    sib16(do, mib, do' sib'8\noBeam) r la16(do, fa, do' la'8\noBeam) r

    %91
    la16(sib, re, sib' la'8\noBeam) r sol16(sib, mib, sib' sol'8\noBeam) r
    sol4(fa16) mib re do mib4(re16) do sib la
    do4(sib16) la sol fa\mbreak la4(sol16) fa mib re

    %94
    mib(re) do(sib) do[(sib) la(sol)] fa4\tr r
    fa16(sol la32 sib do re \stemUp mib4) re16 (do sib4.)\stemNeutral
    fa16(sol la32 sib do reb \stemUp mib4) reb16 (do sib4.)\stemNeutral

    %97
    sib16 (do re?32 mib fa sol lab4) sol16(fa mib4.)
    do16(re mi32 fa sol la? sib4) la16(sol fa4.)
    \terzine \tuplet 3/2 { sib,16 re mib fa[sol la] sib re, mib fa[sol la]\mbreak  } sib8 r mib32(reb do8.)

    %100
    reb32(do sib8.) mib32[(re do8.)] do2\tr
    <<sib4\\sib,1>>
    fa'8 [re do sib la sol fa mib]

    %103 OK
    re1
    fa'8 [re do sib la sol fa mib]
    re1

    %106
    mib8 sol do mib re, fa si re
    mib, sol do mib re, fa si re
    mib,2. do'4

    %109
    mib8 do fad2~fad4
    sol re si sol
    mib'8 do fad2~fad4

    %112
    sol16 sol fa mib re do si la sol8 fa16 mib re do si la
    sol2 r4 sol''
    \tupletSpan 4 \tuplet 3/2 { do8(sol) do sol[(mib) sol] mib(do) mib do[(sol) do] }\mbreak

    %115
    do,(sol' do4)~\tuplet 3/2 { do8 re  mib fa[mib re] }
    do,(sol' do4)~\tuplet 3/2 { do8 re  mib fa[mib re] }
    mib4 do r mib'

    %118
    mib8-. sol,-. sol-. mib'-. mib-. sol,-. sol-. mib'-.
    mib-. fa,-. fa-. lab,-. lab2~
    lab4 mib'' re8(do) sib(lab)

    %121
    sol(fa) mib(re) \appoggiatura mib re2
    re'8 fa, fa re' re fa, fa re'\mbreak
    re mib, mib sol, sol2~

    %124
    sol4 re'' do8(sib) lab(sol)
    fa(mib) re(do) \appoggiatura re do2
    do'8 mib, mib do' do mib, mib do'

    %127
    do re, re fad, fad2~
    fad4 \appoggiatura{la'16[si]} do4 si la
    si8 la sol4 r2

    %130
    r8 do, \appoggiatura re do16[(si do8)] sol'-.[(sol-.)] \appoggiatura lab sol16(fa sol8)
    lab8-.(do,-.) \appoggiatura re do16[(si do8)]\mbreak si-.[(fa'-.)] \appoggiatura sol fa16(mi fa8)
    mib!-.[(do-.)] \appoggiatura re do16(si do8) mib,[do'] \appoggiatura re do16(si do8)

    %133
    fa,[do'] \appoggiatura re do16(si do8) fad,[do'] \appoggiatura re do16(si do8)
    si[(sol')] \appoggiatura lab sol16(fa sol8) do,[(sol')] \appoggiatura lab sol16(fa sol8)
    lab[(sib,)] \appoggiatura do sib16(lab sib8) \once\stemUp re,[lab''] \appoggiatura sib lab16(sol lab8)

    %136
    sol[sib,] \appoggiatura do sib16(lab? sib8) mib,4 sol'\mbreak
    \tupletSpan 4 \tuplet 3/2 { lab8-. sol-. fa-. mib-.[re-. do-.] } si r do r
    sol2~sol4 sol'

    %139
    \tuplet 3/2 { lab8-. sol-. fa-. mib-.[re-. do-.] } si r do r
    fa,2~fa4 fad'
    \appoggiatura sol8 fad?16(mi fad8)~fad4 \appoggiatura sol8 fad?16(mi fad8)~fad4

    %142
    \appoggiatura fa?8 sol2~\tuplet 3/2 { sol8 si-. do-. re-.[do-. si-.]
    re,-. re-. mib-. fa-.[mib-. re-.] sol, sol la si[la sol]}
    mib'2 r4 sol

    %145
    do16(sib8.) lab16(sol8.) fa16(mib8.) reb16(do8.)
    reb16(do8.) reb16(do8.) fa16(mib8.) re16(do8.)
    reb16(do8.) reb16(do8.) fa16(mib8.) re?16(do8.)

    %148
    \tuplet 3/2 { do'8 sol fa mib[re do] } re2\tr
    do8 sol mib sol do mib do sol %%%% inizio ripresa
    lab4 r do r

    %151
    fa r lab r\mbreak
    sib,8 fa re fa sib re sib fa
    sol4 r sib r

    %154
    mib r sol r
    lab8[sib lab sol fa mib re do]
    si2 r

    %157
    re8 mib re do si la? sol fa
    mib2 r
    do'1\p~

    %160
    do~\mbreak
    do4~do16\f re mib fa sol4 do,
    re2 si

    %163
    do r
    reb1\p ~
    reb~

    %166
    reb4~reb16\f mib fa sol lab4 do,
    re?2 si
    do\fermata r\mbreak  %%%% fine ripresa

}

IvlIn =  \relative do'' {

    do1
    sol'8 mib re do sib lab sol fa
    mib1

    %4
    sol'8 mib re do sib lab sol fa
    mib2~mib8[re16 mib fa8 fa]
    mib2~mib8[re16 mib fa8 fa]

    %7
    mib sol do  mib re, fa si re
    mib, sol do mib\mbreak re, fa si re
    mib,2~mib4 do'

    %10
    mib8 do fad4~fad2
    sol4 re si sol
    mib'8 do fad4~fad2

    %13
    sol r
    do,8 sol mib sol do mib do sol %%%% inizio ripresa
    lab4 r do r

    %16
    fa r lab r\mbreak
    sib,8 fa re fa sib re sib fa
    sol4 r sib r

    %19
    mib r sol r
    lab8[sib lab sol fa mib re do]
    si2 r

    %22
    re8 mib re do si la? sol fa
    mib2 r
    do'1\p~

    %25
    do~\mbreak
    do4~do16\f re mib fa sol4 do,
    re2 si

    %28
    do r
    reb1\p ~
    reb~

    %31
    reb4~reb16\f mib fa sol lab4 do,
    re?2 si
    do2 r4 sol\mbreak  %%%% fine ripresa

    %34
    sol sol sol sol
    sol sol sol si
    sol sol sol si

    %37
    sol r r mib'
    mib mib fa fa
    fa fa mib mib

    %40
    fa fa\mbreak fa8 r mib r
    re r mib r si r do r
    re4 r r2

    %43
    mib,8 fa sol fa mib fa sol fa
    mib4 r r2
    lab8 sib do sib lab sib do sib

    %46
    la!4 r\mbreak r2
    mib'!4 mi mi mi
    mi? mi re re

    %49
    re re re re
    re re do do
    do do do do

    %52
    do do sib sib
    re re mib! fad\mbreak
    re8 sib re, sib' re sib re, sib'

    %55
    re la re, la' re la re, la'
    fad' re fad, re' fad re fad, re'
    la' fad fad, fad' la fad fad, fad'

    %58
    R1*5
    sol,1

    %64 OK
    re'8[sib la sol fa  mib re do]
    sib1
    re'8[sib la sol fa mib re do]\mbreak

    %67
    sib4 sib'~sib8[la16 sib do8 do]
    sib2~sib8[la16 sib do8 do]
    sib re sol sib la, do fad la

    %70
    sib, re sol sib la, do fad la
    sol2 r
    sol,1\p~

    %73
    sol~
    sol4~sol16\f la sib do re4  sol,\mbreak
    la2 fad

    %76 OK
    sol4 r r2
    R1*4
    r8 la re la r2\mbreak

    %82
    r lab'2
    sol r
    r sib

    %85
    la r
    r do
    sib\mbreak sib,8  la sol do

    %88
    sib la re do sib mib re do
    fa mib re mib re do sib4
    do8 do do do do do do do

    %91
    sib sib sib sib sib sib sib sib
    re do re la sib la sib fa
    sol fa sol re\mbreak mib re mib sib

    %94
    do re mib mi fa do' do do
    do do do do fa,4 r8 re'
    do do do do fa,4 r8 reb'

    %97
    fa, re'! re re sib sib sib sib
    do do do do do do do do
    re4 r r2

    %100
    R1
    sib
    fa'8 [re do sib la sol fa mib]

    %103 OK
    re1
    fa'8 [re do sib la sol fa mib]
    re1

    %106
    mib8 sol do mib re, fa si re
    mib, sol do mib re, fa si re
    mib,2. do'4

    %109
    mib8 do fad2~fad4
    sol re si sol
    mib'8 do fad2~fad4

    %112
    sol16 sol fa mib re do si la sol8 fa16 mib re do si la
    sol2 r4 sol'
    sol sol sol sol\mbreak

    %115
    sol sol sol si
    sol sol sol si
    sol r r2

    %118
    mib4 fa sol mib
    lab sib do sib
    lab sib do lab

    %121
    re, mib fa mib
    re mib fa re\mbreak
    sol lab sib lab

    %124
    sol lab sib sol
    do, re mib re
    do re mib do

    %127
    fad sol la sol
    fad sol la fad
    re do re si

    %130
    mib fa sol mib
    do lab'\mbreak re, sol
    sol8 mib  sol mib r mib sol mib

    %133
    r mib  sol mib r mib sol mib
    r si re si r mib sol mib
    r re fa re r re fa re

    %136
    r sol sib sol r sol sol mib\mbreak
    R1*3
    r2 r4 la

    %141
    la la la la
    sol sol sol sol
    sol sol\mbreak sol sol

    %144
    sol sol sol sol
    mib'mib mib mib
    lab, lab lab lab

    %147
    lab lab lab lab
    sol do do si
    do8 sol mib sol do mib do sol %%%% inizio ripresa

    %150
    lab4 r do r
    fa r lab r\mbreak
    sib,8 fa re fa sib re sib fa

    %153
    sol4 r sib r
    mib r sol r
    lab8[sib lab sol fa mib re do]

    %156
    si2 r
    re8 mib re do si la? sol fa
    mib2 r

    %159
    do'1\p~
    do~\mbreak
    do4~do16\f re mib fa sol4 do,

    %162
    re2 si
    do r
    reb1\p ~

    %165
    reb~
    reb4~reb16\f mib fa sol lab4 do,
    re?2 si

    %168
    do2\fermata r

}

IvlIIn = \relative do'' {

    sol1
    mib'8 do sib lab sol fa mib re
    do1

    %4
    mib'8 do sib lab sol fa mib re
    do2~do8 si16 do re8 re
    do2~do8 si16 do re8 re

    %7
    do mib sol do, si re sol si,
    do mib sol do,\mbreak si re sol si,
    do2~do4 sol'

    %10
    do1
    si4 sol' re si
    do1

    %13
    si2 r
    sol8 mib do mib sol do sol mib %%%% ripresa
    fa4 r lab r

    %16
    do r fa r\mbreak
    fa,8 re sib re fa sib fa re
    mib4 r sol r

    %19
    sib r mib r
    fa8[sol fa mib re do si la]
    sol2 r

    %22
    si8 do si la sol fa mib re
    do2 r
    sol'8\p sol lab sol sol sol lab sol

    %25
    sol sol lab sol sol sol lab sol\mbreak
    sol4 do16\f re mib fa sol4 mib
    fa2 re

    %28
    do r
    lab8\p lab sib lab lab lab sib lab
    lab? lab sib lab lab lab sib lab

    %31
    lab?4 reb16\f mib fa sol lab4 mib
    fa2 re
    do r4 mib, %%%% fine ripresa

    %34
    mib mib mib mib
    mib mib mib re
    mib mib mib sol

    %37
    mib r r do'
    do do do re
    si si do do

    %40
    do do\mbreak re8 r do r
    si r do r re r mib r
    si4 r r2

    %43
    do,8 re mib re do re mib re
    do4 r r2
    fa8 sol lab sol fa sol lab sol

    %46
    fad4 r\mbreak r2
    sol'4 dod, dod dod
    dod? dod la la

    %49
    fa' si, si si
    si? si sol sol
    mib' la, la la

    %52
    la la fa fa
    sib sib lab la\mbreak
    sib8 sol sib, sol' sib sol sib, sol'

    %55
    la fad la, fad' la fad la, fad'
    re' la la, la' re la la, la'
    fad' re re, re' fad re re, re'

    %58
    R1*5
    re,1
    sib'8[sol fa mib re do sib la]

    %65
    sol1
    sib'8[sol fa mib re do sib la]
    sol4 sol'~sol8 fad16 sol la8 la

    %68
    sol2~sol8 fad16 sol la8 la
    sol sib re sol, fad la re fad,
    sol sib re sol, fad la re la

    %71
    sib2 r
    re,8\p re mib re re re mib re
    re re mib re re re mib re

    %74
    re4 sol16\f la sib do re4 sib\mbreak
    do2 la
    sib4 r r2

    %77
    R1*4
    r8 fad la fad r2\mbreak
    r fa'

    %83
    mib r
    r sol
    fa r

    %86
    r la
    sol\mbreak sib,8 la sol do
    sib la re do sib mib re do

    %89
    fa mib re mib re do sib4
    sol8 sol sol sol la la la la
    fa fa fa fa sol sol sol sol

    %92
    re' do re la sib la sib fa
    sol fa sol re\mbreak mib re mib sib
    do re mib mi fa la la sol

    %95
    fa  mib re do re mib fa sol
    la fa mib do reb mib fa mib
    reb fa fa fa sol sol sol sol

    %98
    sol sol sol sol la la la la
    fa4 r\mbreak r2
    R1

    %101
    fa1
    re'8[sib la sol fa mib re do]
    sib1

    %104
    re'8[sib la sol fa mib re do]
    si1
    do8 mib sol do, si re sol si,

    %107
    do mib sol do,\mbreak si re sol si,
    do2. sol'4
    do1

    %110
    si4 sol' re si
    do1
    si16 sol' fa mib re do si la sol8 fa16 mib re do si la

    %113
    sol2 r4 mib'
    mib mib mib mib\mbreak
    mib mib mib re

    %116
    mib mib mib sol
    mib r r2
    mib4 fa sol mib

    %119
    lab sib do sib
    lab sib do lab

    %121
    re, mib fa mib
    re mib fa re\mbreak
    sol lab sib lab

    %124
    sol lab sib sol
    do, re mib re
    do re mib do

    %127
    fad sol la sol
    fad sol la fad
    re do re si

    %130
    mib fa sol mib
    do lab'\mbreak re, sol
    sol8 mib  sol mib r mib sol mib

    %133
    r mib  sol mib r mib sol mib
    r si re si r mib sol mib
    r re fa re r re fa re

    %136
    r sol sib sol r sol sol mib\mbreak
    R1*3
    r2 r4 fad

    %141
    fad? fad fad fad
    re re re re
    re re\mbreak re re

    %144
    mib mib mib mib
    sol sol sol sol
    lab lab lab lab

    %147
    lab lab lab lab
    sol do do si
    do8 mib, do mib sol do sol mib %%%% ripresa

    %150
    fa4 r lab r
    do r fa r\mbreak
    fa,8 re sib re fa sib fa re

    %153
    mib4 r sol r
    sib r mib r
    fa8[sol fa mib re do si la]

    %156
    sol2 r
    si8 do si la sol fa mib re
    do2 r

    %159
    sol'8\p sol lab sol sol sol lab sol
    sol sol lab sol sol sol lab sol\mbreak
    sol4 do16\f re mib fa sol4 mib

    %162
    fa2 re
    do r
    lab8\p lab sib lab lab lab sib lab

    %165
    lab? lab sib lab lab lab sib lab
    lab?4 reb16\f mib fa sol lab4 mib
    fa2 re

    %168
    do\fermata r

}

Ivlan =  \relative do' {

    mib8 mib  re do sib lab sol fa
    mib2 r
    sol8 mib' re do sib lab sol fa

    %4
    mib2 r
    sol~sol4 si
    sol2~sol4 si

    %7
    sol2~sol~
    sol~\mbreak sol
    sol8 mib' re do sib lab sol fa

    %10
    mib sol' la4~la4. fad8
    re1
    sol8 sol la4~la4. fad8

    %13
    re2 r
    mib8 mib mib mib mib mib mib mib %%% ripresa
    do4 r fa r

    %16
    lab r do r\mbreak
    re,8 re re re re re re re
    sib4 r mib r

    %19
    sol r sib r
    R1
    si8[la sol fa mib re do si]

    %22
    R1
    mib8[re do sib lab sol fa mib]
    mib'\p mib fa mib mib mib fa mib

    %25
    mib mib fa mib mib mib fa mib\mbreak
    mib mib sol\f sol sol sol sol sol
    lab lab lab lab sol sol sol sol

    %28
    mib2 r
    fa8\p fa sol fa fa fa sol fa
    fa fa sol fa fa fa sol fa

    %31
    fa fa lab\f[lab] lab lab sol sol
    lab lab lab lab sol sol sol sol
    mib2 r4 do\mbreak

    %34
    do do do do
    do do do sol
    do do do sol

    %37
    do r r sol
    sol sol sol sol
    sol sol sol sol

    %40
    sol sol\mbreak sol8 r sol r
    sol r sol r sol r sol r
    sol4 r r2

    %43
    do8 re mib re do re mib re
    do4 r r2
    fa8 sol lab sol fa sol lab sol

    %46
    fad4 r\mbreak r2
    sol4 sol sol sol
    sol sol fa fa

    %49
    fa fa fa fa
    fa fa mib mib
    mib mib mib mib

    %52
    mib mib re re
    sol, sol do re\mbreak
    sol, sol sol sol

    %55
    fad fad fad fad
    fad? fad fad fad
    la la la la

    %58
    R1*5
    sib8 [sib' la sol fa mib re do]
    sib4 r r2

    %65
    sib8 [sib' la sol fa mib re do]
    sib4 r r2\mbreak
    re2. fad4

    %68
    re2. fad4
    re1~
    re

    %71
    re2 r
    sib8\p sib do sib sib sib do sib
    sib sib do sib sib sib do sib

    %74
    sib4 re\f re re\mbreak
    mib mib re re
    re r r2

    %77
    R1*4
    r8 re fad re r2
    r re'

    %83
    sib r
    r mi
    do r

    %86
    r fad,
    re sib'8 la sol do
    sib la re do sib mib re do

    %89
    fa mib re mib re do sib4
    mib,8 mib mib mib fa fa fa fa
    re re re re mib mib mib mib

    %92
    re 'do re la sib la sib fa
    sol fa sol re\mbreak mib re mib sib
    do re mib mi fa fa fa mi

    %95
    re do sib la sib do re mi
    fa reb do la sib do reb do
    sib sib sib sib mib mib mib mib

    %98
    mi mi mi mi fa fa fa la,
    sib4 r r2
    R1

    %101
    re8 [re' do sib la sol fa mib]
    re2 r
    re8 [re' do sib la sol fa mib]

    %104
    re2 r
    si'8[la sol fa mib re do si]
    sol1~

    %107
    sol
    sol8[mib' re do sib lab sol fa]
    mib sol' la4~la4. fad8

    %110
    re1
    sol8 sol la4~la4. fad8
    re2 sib

    %113
    sol r4 do
    do do do do\mbreak do do do sol
    do do do sol

    %116
    do r r2
    do4 re mib do
    fa sol lab sol

    %119
    fa sol lab fa
    sib, do re do
    sib do re sib\mbreak

    %122
    mib fa sol fa
    mib fa sol mib
    lab, sib do sib

    %125
    lab sib do lab
    re mi fad mi
    re mi fad re

    %128
    sol, la si sol
    do re mib? do
    fa, fa'\mbreak sol, si

    %131
    do8 do mib do r do mib do
    r do mib do r do mib do
    r sol si sol r do mib do

    %134
    r sib re sib r sib re sib
    r mib sol mib r do mib do\mbreak
    R1*3

    %139
    r2 r4 do
    do do do do
    si si si si

    %142
    si? si\mbreak si si
    do do do do
    do do do do

    %145
    fa fa fa fa
    fa fa fa fa
    mib do sol' sol,

    %148
    do8 mib mib mib mib mib mib mib %%% ripresa
    do4 r fa r
    lab r do r\mbreak

    %151
    re,8 re re re re re re re
    sib4 r mib r
    sol r sib r

    %155
    R1
    si8[la sol fa mib re do si]
    R1

    %158
    mib8[re do sib lab sol fa mib]
    mib'\p mib fa mib mib mib fa mib
    mib mib fa mib mib mib fa mib\mbreak

    %161
    mib mib sol\f sol sol sol sol sol
    lab lab lab lab sol sol sol sol
    mib2 r

    %164
    fa8\p fa sol fa fa fa sol fa
    fa fa sol fa fa fa sol fa
    fa fa lab\f[lab] lab lab sol sol

    %167
    lab lab lab lab sol sol sol sol
    mib2\fermata r

}

Ibcn = \relative do {

    do8 do' sib lab sol fa mib re
    do4 do, r2
    do'8 do' sib lab sol fa mib re

    %4
    do4 do, r2
    do'8 re mib re do4 sol
    do8 re mib re do4 sol

    %7
    do8 re mib do sol' fa sol sol,
    do re mib do\mbreak sol' fa sol sol,
    do[do' sib lab sol fa mib re]

    %10
    do do' sib la? sol fad mi re
    sol2 sol,
    r8 do' sib la sol fad mi re

    %13
    sol2 r
    do,8 do' do, do do do' do, do %%%%%% ripresa
    fa4 r fa r

    %16
    fa r fa r\mbreak
    sib, 8sib' sib, sib sib sib' sib, sib
    mib4 r mib r

    %19
    mib r mib r
    R1
    sol8 fa mib re do si la sol

    %22
    R1
    do'8[sib? lab sol fa mib re do]
    R1*2\mbreak

    %26
    do8 do do\f do do do do do
    fa fa fa fa sol sol sol sol
    do,2 r

    %29
    R1*2
    fa8 fa fa\f fa fa fa do do
    fa fa fa fa sol sol sol sol

    %33
    do,2 r\mbreak
    R1*3
    do'8[sib lab sol fa mib re do]

    %38
    R1*4
    sol'8 fa mib re do si la sol
    R1

    %44
    r2 fa'4 fa,
    R1
    r2 sol'4 sol,

    %47
    R1*7
    sol4 sol sol sol
    re' re re re

    %56
    re re re re
    re re re re
    sol,2~sol~

    %59
    sol8 la sib la sol4 r\mbreak
    sol sol do do
    sib dod re8 dod sib la

    %62
    sib la sib sol re'4 re,
    sol8[sol' fa  mib re do sib la]
    sol4 r r2

    %65
    sol8[sol' fa  mib re do sib la]
    sol4 r r2\mbreak
    sol8 la sib la sol4 re'

    %68
    sol,8 la sib la sol4 re'
    sol,8 la sib sol re' do re re,
    sol la sib sol re' do re re,

    %71
    sol[sol' fa  mib re do sib la]
    sol4 r r2
    R1

    %74
    r4 sol sol sol\mbreak
    do do re re
    sol,8 sol sib sol r sol sib sol

    %77
    r re' fad re r re fad re
    r sol, sib sol r sol si sol
    r do mib do r la dod la

    %80
    re4 r re r
    re r sib sib\mbreak
    sib sib sib8 do re sib

    %83
    mib fa sol mib do4 do
    do do do8 re mi do
    fa sol la fa re4 re

    %86
    re re re8 mi fad re
    sol la sib sol\mbreak  r2
    R1*11

    %99
    sib,8 r sib r\mbreak sib8 reb' do fa,
    sib reb do mib, fa mib fa fa,
    sib[sib' la sol fa mib re do]

    %102
    sib2 r
    sib8[sib' la sol fa mib re do]
    sib2 r

    %105
    sol'8[fa mib re do si la sol]
    do re mib do sol' fa sol sol,
    do re mib do\mbreak sol' fa sol sol,

    %108
    do[do' sib? lab sol fa mib re]
    do[do' sib la? sol fad mi? re]
    sol2 sol,

    %111
    r8 do'[sib la sol fad mi re]
    sol2 sol,
    sol r

    %114
    R1*3
    do'8[sib lab sol fa mib re do]
    R1*19

    %137
    r2 r8 sol' fa mib
    re do si la sol4 r
    r2 r8 sol' fa mib

    %140
    re do si la sol4 r
    R1*8
    do8 do' do, do do do' do, do %%%%%% ripresa

    %150
    fa4 r fa r
    fa r fa r\mbreak
    sib, 8sib' sib, sib sib sib' sib, sib

    %153
    mib4 r mib r
    mib r mib r
    R1

    %156
    sol8 fa mib re do si la sol
    R1
    do'8[sib? lab sol fa mib re do]

    %159
    R1*2\mbreak
    do8 do do\f do do do do do
    fa fa fa fa sol sol sol sol

    %163
    do,2 r
    R1*2
    fa8 fa fa\f fa fa fa do do

    %167
    fa fa fa fa sol sol sol sol
    do,2\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\minor
  \time 2/2
  \tempo 2 = 67
  s1*168
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

    do8. do16 do8(re16) mib mib8(si16) si si8(do16) re
    re8 (fa,16) fa fa8(sol16) re re8(mib16) do' do8(re16) mib
    mib8(fa,16) mib' mib8(re16) do do4\tr si

    %4
    sol'8. sol16 sol8(lab16) sib sib8(do,)~do~do32 sib lab sol
    lab?8.[lab16 sol8. fa16] fa'8. fa16 fa8(sol16) lab\mbreak
    lab?8 sib,~sib~sib32 lab sol fa sol8.[sol16 fa8. mib16]

    %7
    sol'8 r32 sol fa mib re8\noBeam r32 do si la sol8 r32 lab sol fa mib8\noBeam r32 fa mib re
    do8-. do'-. re-. si-. do4 r8 sol'
    sol do, do do' \appoggiatura do si4. do8

    %10
    re fa, fa sol mib re16 do sol'8 do
    lab4 sol\mbreak fad4. do'8
    \appoggiatura do si4 r8 sol lab2~

    %13
    lab16 sib,(re fa sib8) lab sol2~
    sol16 lab,(do mib lab8) sol fa2~
    fa16 sib, re fa sib,8 lab sol sib mib4~

    %16
    mib16 sol(sib re,) mib4~mib16 sol(sib re,) mib4~\mbreak
    mib16 re(do sib sib') lab (sol fa) sol8 fa16 mib re8.\tr mib16
    mib4 r8 sol sol sol sol sol

    %19
    reb'4~reb16 sib(sol mi) do,(mi sol sib mi sib') reb sib
    sib8 lab reb,4~reb8 sol do,4~
    do8 fa sib,4~sib16 reb(do sib sib'8) sol

    %22
    lab sol16 fa mi8.\tr fa16\mbreak fa4 r8 lab
    sol do, do do' do\tr si fa4~
    fa8[sol16 lab sol8 fa] mib8 do do'4~

    %25
    do8[re16 mib re8 do] do si r sol
    sol [sol, sol la16 sib] \appoggiatura sib la4 r8 fa'
    lab16 sol fa mib re8 do si4. sol'8

    %28
    do,4.  sol'8 re4. sol8\mbreak
    mib8 sol do,4~do16 sol'(mib si) do4~
    do16 sol'(mib si) do4~do8 sol'(lab) do,(

    %31
    reb) fa(sol) si,(do) mib(fa) lab,(
    sol) fad'(sol) sib(do) sol do,4~
    do16 sol'(do) do, re4\tr do8.[do16 mib8. fad16]

    %34
    sol8 r32 sol fa mib re8\noBeam r32 do si la sol8 r32 lab sol fa mib8\noBeam r32 fa mib re
    do8 mib' fa re do2\fermata

}

IIvlIn =  \relative do'' {

    do8. do16 do8(re16) mib mib8(si16) si si8(do16) re
    re8 (fa,16) fa fa8(sol16) re re8(mib16) do' do8(re16) mib
    mib8(fa,16) mib' mib8(re16) do do4\tr si

    %4
    sol'8. sol16 sol8(lab16) sib sib8(do,)~do~do32 sib lab sol
    lab?8.[lab16 sol8. fa16] fa'8. fa16 fa8(sol16) lab\mbreak
    lab?8 sib,~sib~sib32 lab sol fa sol8.[sol16 fa8. mib16]

    %7
    sol'8 r32 sol fa mib re8\noBeam r32 do si la sol8 r32 lab sol fa mib8\noBeam r32 fa mib re
    do8-. do'-. re-. si-. do4 r
    r r8 mib re re re mib

    %10
    fa re4 si8 do mib mib mib
    mib mib mib mib\mbreak la, la la la
    si si, si4 r8 do' do do

    %13
    re re re re re re re re
    do do do do do do do do
    re re re re sib4 r8 sib

    %16
    sib sib sib sib sib sib sib sib\mbreak
    sib sib sib sib sib sib re re
    sib sib sib4 r r8 sib

    %19
    sib sib sib sib sib sib sib sib
    fa fa r reb' sib sib do do
    lab lab sib sib sol sol sol do

    %22
    do re mi,[do']\mbreak do do, do4
    r r8 mib' re re re re
    re re re re mib mib mib mib

    %25
    mib mib mib mib re re re4
    r8 do do do do do do4
    r8 do do re re re re re

    %28
    mib mib mib mib fa fa fa fa\mbreak
    mib mib r sol, sol sol sol sol
    sol sol sol sol sol4 r8 do

    %31
    reb4 r8 re do4 r8 re
    sol,4 r8 si sol4 r8 mib'
    mib mib re re do8.[do16 mib8. fad16]

    %34
    sol8 r32 sol fa mib re8\noBeam r32 do si la sol8 r32 lab sol fa mib8\noBeam r32 fa mib re
    do8 mib' fa re do2\fermata

}

IIvlIIn = \relative do'' {

    do8. do16 do8(re16) mib mib8(si16) si si8(do16) re
    re8 (fa,16) fa fa8(sol16) re re8(mib16) do' do8(re16) mib
    mib8(fa,16) mib' mib8(re16) do do4\tr si

    %4
    sol'8. sol16 sol8(lab16) sib sib8(do,)~do~do32 sib lab sol
    lab?8.[lab16 sol8. fa16] fa'8. fa16 fa8(sol16) lab\mbreak
    lab?8 sib,~sib~sib32 lab sol fa sol8.[sol16 fa8. mib16]

    %7
    sol'8 r32 sol fa mib re8\noBeam r32 do si la sol8 r32 lab sol fa mib8\noBeam r32 fa mib re
    do8-. do'-. re-. si-. do4 r
    r4 r8 sol si si si sol

    %10
    sol4. sol8 sol sol sol sol
    lab  lab do do\mbreak do do do fad,
    re' re, re4 r8 lab' lab lab

    %13
    fa fa fa fa sol sol sol sol
    mib mib mib mib fa fa fa fa
    fa fa fa fa sol4 r8 sol

    %16
    fa fa mib mib re re do do\mbreak
    sib sol' fa fa sol sol fa fa
    sol sol sol4 r r8 sol

    %19
    sol sol sol sol sol sol sol do
    do do r lab sol sol sol sol
    fa fa fa fa mi mi mi mi

    %22
    fa lab sol sol\mbreak lab lab, lab4
    r r8 sol' sol sol si si
    sol sol sol sol sol sol sol' sol

    %25
    la,! la la do sol sol sol4
    r8 sol sol sol la la la4
    r8 lab lab la si? si si si

    %28
    do do do do re re re re\mbreak
    do sol r mib re re do do
    si si lab lab sol4 r8 sol'

    %31
    lab4 r8 sol sol4 r8 fa
    mib4 r8 re mib4 r8 do'
    do do si si do8.[do16 mib8. fad16]

    %34
    sol8 r32 sol fa mib re8\noBeam r32 do si la sol8 r32 lab sol fa mib8\noBeam r32 fa mib re
    do8 do' re si do2\fermata

}

IIvlan =  \relative do' {

    mib8.[mib16 mib8. mib16] re8.[re16 re8. si16]
    si?8.[si16 si8. si16] sol8.[sol16 sol8. sol16]
    do8.[do16 do8. do16] re8.[re16 re8. re16]

    %4
    sol8.[sol16 sol8. sol16]sol8.[sol16 sol8. mi16]
    do8.[do16 do8. lab16] sib8.[sib16 sib8. sib16]
    fa'8.[fa16 fa8. re16] sib8.[sib16 sib8. sol16]

    %7
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    sol8 sol' lab sol mib4 r
    r r8 do sol' sol, sol do

    %10
    si4. sol8 do do, do do'
    do do do do\mbreak re re re re
    sol sol, sol4 r8 fa' fa fa

    %13
    sib, sib sib sib  mib mib mib mib
    lab, lab lab lab re re re re
    sib sib sib sib mib4 r8 mib

    %16
    re re do do sib sib lab lab\mbreak
    sol sol re' re mib mib sib sib
    mib mib mib4 r r8mi

    %19
    mi? mi mi mi mi mi mi mi
    fa fa, r fa' mi mi mib mib
    re re reb reb do do do do

    %22
    fa, si do do,\mbreak fa fa fa4
    r r8 do' sol' sol, sol sol
    si si si si do do, do \once\stemDown do''

    %25
    fad, fad fad fad sol sol, sol4
    r8 mi' mi mi fa fa, fa4
    r8 fa' fa fad sol sol, sol sol

    %28
    sol sol sol sol sol sol sol sol\mbreak
    do do, r do' sib sib lab lab
    sol sol fa fa mib4 r8 mib'

    %31
    fa4 r8 fa mib4 r8 si
    do4 r8 sol do4 r8 do
    sol' sol, sol sol mib'8.[mib16 re8. do16]

    %34
    si8.[si 16 si8. si16] si8.[si 16 si8. si16]
    sol8 sol' lab sol mib2\fermata

}

IIbcn = \relative do {

    do8.[do16 do8. do16] sol8.[sol16 sol8. sol16]
    sol8.[sol16 sol8. sol16] do8.[do16 do8. do16]
    lab8.[lab16 lab8. lab16] sol8.[sol'16 sol8. fa16]

    %4
    mi8.[mi16 mi8. mi16] mi8.[mi16 mi8. mi16]
    fa8.[fa16 fa8. fa16] re8.[re16 re8. re16]\mbreak
    re8.[re16 re8. re16] mib?8.[mib16 mib8. mib16]

    %7
    sol,8.[sol16 sol8. sol16]  sol8.[sol16 sol8. sol16]
    do8 do fa, sol do,4 r
    R1*24

    %33
    r2 do'8.[do16 sib8. lab16]
    sol8.[sol16 sol8. sol16]  sol8.[sol16 sol8. sol16]
    do8 do fa, sol do,2\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\minor
  \time 4/4
  \tempo 4 = 40
  s1*35
  \bar"|."

}

IIvl = {
  \IIglobal
  \notypeset
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
  \typeset

}

IIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIIvln = \relative do'' {

    do,8[mib sol do]
    si[sol,16 la si8 sol]
    sol'[si re fa]

    %4
    mib[do,16 re mib8 do]
    do'[mib sol do]
    lab[fa,16 sol lab8 fa]

    %7
    sib[re fa sib]
    sol[mib,16 fa sol8 mib]
    sol16\p [mib sol mib sol mib sol mib]

    %10
    fa [re fa re fa re fa re]
    lab'[fa lab  fa lab fa lab fa]
    sol8 mib' r re\mbreak

    %13
    r8 do r sib
    r lab r sol
    r fa16[mib fa8 re]

    %16
    \once\stemUp mib sol' r fa
    r mib r re
    r do r sib

    %19
    r lab16[sol lab8 fa]
    mib8\f[sol sib mib]
    re[sib,16 do re8 sib]

    %22
    fa'[lab do fa]
    mib[do,16 re mib8 do]
    sol'[si re fa]

    %25
    mib do, r do'\p \mbreak
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)

    %28
    lab'8.[sol16-. fa-. mib-. re-. do-.]
    si(do re do si la sol fa)
    mib8\f[sol' si, do16 re]

    %31
    do4 r8 do\p
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)

    %34
    lab'2
    si,16(do re do si la sol fa)
    mib8\f[sol' si, do16 re]

    %37
    do8[sol' si, do16 re]\mbreak
    do4 r8 sol'
    lab16(sol lab sib lab sib lab sol)

    %40
    lab(sol lab sib lab sib lab sol)
    lab4\tr(sol8) do
    do16(si do re do re do si)

    %43
    do(si do re do mib re do)
    do4\tr(si8) mib
    lab,,(fa') mib'4

    %46
    re16-.[do-. sib?-. lab-. sol-. fa-. mib-. re-.]
    sol,8(mib') re'4
    do16[sib lab sol fa mib re do]\mbreak

    %49
    fa,8(re') do'4
    sib16[lab sol fa mib re do sib]
    sol' sol32 lab sib16[lab32 sib] do16 sib32 do re16 do32 re

    %52
    mib4 r8 sib
    fa4(mi8) sol
    reb4(do8) sol'

    %55
    do,4(sib8) sol'
    lab16 fa do lab \once\stemUp fa8 do''
    sol4(fad8) la?

    %58
    mib4(re8) la'
    re,4(do8) la'\mbreak
    sib16 sol re sib sol8 re'

    %61
    \terzine \senza \tuplet 3/2 { mib16-. re-. do-. fad-.[mi-. re-.] } sol8 r
    \tuplet 3/2 { la16 sol fad sib[la sol]} do8 r
    \tuplet 3/2 { re16 do sib mib[re do] } fad8 r

    %64
    sol[fad?16 mi? re do sib la]
    sib8 re,(mib4)
    re8 re(mib4)

    %67
    re8 sol sol16.\tr(fad32 sol16.) la32
    sib8 fad fad16.\tr(mi32 fad16.) la32
    sol8 sib, sib16.\tr(la32 sib16.) do32\mbreak

    %70
    re8 fad, fad16.\tr(mib32 fad16.) la32
    sol8\tu[re sib sol]
    sol'[sib re sol]

    %73
    fad[re,16 mi fad8 re]
    re'[fad la do]
    sib[sol,16 la sib8 sol]

    %76
    re'16\p[sib re sib re sib re sib]
    do[la do la do la do la]
    mib'[do mib do mib do mib do]

    %79
    sib8 sib' r la\mbreak
    r sol r fad
    r mib! r re

    %82
    r do16[sib do8 la]
    sib re' r do
    r sib r la

    %85
    r sol r fad
    r sol\f[sib, la]
    sol[sol' la fad]

    %88
    sol4 r16 re mib re
    re4(do16) do re do\mbreak
    do4(sib16) sib' do sib

    %91
    sib4(la16) la sib la
    la4(sol16) re' mib re
    re4(do16) do re do

    %94
    sib8 sol r re'
    \appoggiatura do si16(la si8) \appoggiatura sol fa16(mib fa8)
    \tuplet 3/2 { sol,16-. sol'-. fa-. sol,-.[sol'-. fa-.] sol, sol' fa sol,[sol' fa]

    %97
    sol, sol' mi sol,[sol' mi]} \once\stemUp do,8 do''
    \appoggiatura sib la16(sol la8) \appoggiatura fa mib16 re mib8\mbreak
    \tuplet 3/2 { fa,16 fa' mib fa,[fa' mib]  fa,16 fa' mib fa,[fa' mib]

    %100
    fa,16 fa' re fa,[fa' re]} \once\stemUp sib,8 sib''
    \appoggiatura la sol16(fa sol8) \appoggiatura mib reb16(do reb8)
    \tuplet 3/2 { mi,16 mib' reb mi,[mib' reb]  mi,16 mib' reb mi,[mib' reb]

    %103
    mi, reb' do mi,[reb' do] mi, reb' do mi,[reb' do]
    do sib' sol do,[sib' sol] do, sib' sol do,[sib' sol]
    lab-. sol-. lab-. sol-.[fa-. sol-.] fa(mib fa) mib[(reb mib)]}

    %106 inizio p. 21
    \appoggiatura mib8 reb16(do reb8)  \appoggiatura mib8 reb16(do reb8)
    \appoggiatura do8 si16(la si8) \appoggiatura do8 si16(la si8)
    \tuplet 3/2 { sol'16-. fa-. sol-. fa-.[mib-. fa-.] mib(re mib) reb[(do reb)] }

    %109
    \appoggiatura reb8 do16(sib do8) \appoggiatura reb8 do16(sib do8)
    \appoggiatura sib8 la!16(sol la8) \appoggiatura sib8 la16(sol la8)
    fa'16(reb do sib reb fa sol lab)

    %112
    sib(sol fa mi fa sol lab sib)\mbreak
    do(lab sol fa sol lab sib do)
    reb2~

    %115
    \tuplet 3/2 { reb16 sib( la! sib[la sib)] reb16(sib la! sib[la sib)] }
    do,,4 r16 do'\noBeam do\tr(sib32 do)
    fa16[(r32 fa)] fa16\tr(mi32 fa) lab16[(r32 lab)] lab16\tr(sol32 lab)

    %118
    do8 fa,16. sol32 sol4\tr
    <<fa4\\fa\\{ fa,8^\markup\italic"[Tutti]" [lab do fa]}>>
    sol,[si re fa]

    %121
    do[mib sol do]\mbreak
    fa,,[lab do fa]
    sib,[re fa sib]

    %124
    mib,,[sol sib mib]
    re[sib,16 do re8 sib]
    fa'[lab do fa]

    %127
    mib[do,16 re mib8 do]
    sol'[si re fa]
    \once\stemDown mib8 do, r do'\p

    %130
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)
    lab'8.[sol16-. fa-. mib-. re-. do-.]

    %133
    si-. do-. re-. do-. si-. la-. sol-. fa-.
    mib8\f[sol' si, do16 re]
    do4 r8 do

    %136
    reb16\p(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)
    lab'2

    %139
    si,16-. do-. re-. do-. si-. la-. sol-. fa-.
    mib8\f[sol' si, do16 re]
    do8[sol' si, do16 re]\mbreak

    %142
    do4 r8 sol'
    do16[sib(lab) sol(fa) mib(reb) do]\mbreak
    reb4(do8) sol'

    %145
    \appoggiatura sib lab16[sol(fa) mib(re) do(si) do]
    si4\tr \appoggiatura si8 do mib
    do16 mib sol, do mib, sol do, do'

    %148
    si sol fa4 fa'8
    si,16 re fa, lab re, fa sol, fa''
    mib re do4 sib'8

    %151
    mi,16 sol sib, reb mi, sol sib, \once\stemDown sib''
    lab sol fa4 lab8\mbreak
    sib,16 re fa, lab re, fa sib, lab''

    %154
    sol fa mib4 do8
    \tuplet 3/2 { do16 si do re[do si]  do16 si do re[do si]
    do re mib fa[mib re] mib re mib fa[mib re]

    %157
    mib fa sol lab[sol fa] sol fa sol lab[sol fad]}
    fad?4(sol)
    \tuplet 3/2 { sol16(do, mib,) mib[(do' sol')] sol(do, mib,) mib[(do' sol')] }\mbreak

    %160
    sol32(lab sol fad sol16)\noBeam r sol32(lab sol fad sol16\noBeam) r
    sol4(\tuplet 3/2 { lab16) sol-. fa?-. mib-.[re-. do-.]
    fa(sib, re,) re[(sib' fa')] fa(sib, re,) re[(sib' fa')]}

    %163
    fa32(sol fa mi fa16\noBeam) r fa32(sol fa mi fa16\noBeam) r
    fa4(\tuplet 3/2 { sol16) fa-. mib-. re-.[do-. sib-.]
    lab-. sib-. do-. re-.[mib-. fa-.]} si,8 sol'

    %166
    \tuplet 3/2 { do,16 re mib fa[sol lab] } re,8 sib'\mbreak
    \tuplet 3/2 { mib, 16fa sol lab[sib do] } fa,8 re'
    sol,,,4 r8 sol''

    %169
    sol16(fad sol sol) sol (fad sol sol)
    mib'8.[re16 (do) sib(lab) sol]
    fa(mi fa fa) fa(mi fa fa)

    %172
    fa'8.[mib?16(re) do(si?) lab]
    sol(fad sol sol) sol(fad sol sol)
    sol'8.[fa16-.(mib-. re-. do-. si-.)]\mbreak

    %175
    do8.[sib?16-.(lab-. sol-. fa-. mi-.)]
    \tuplet 3/2 { fa-. sol-. la-. si,[do re] fa, sol lab re,[mib fa] }
    sol,8 r do'\tr~ do32 si(do re)

    %178
    mib8 r mib-\parenthesize \trill ~mib32 re(mib fa)
    sol8 r do8\tr~do32 si(do re)
    mib8 r r16 mib,\p(re do)

    %181
    mib8~mib32 re(do re) do4\mbreak
    mib8~mib32 re(do re) do4
    do'16\f sib32 lab sol16 do, re4\tr

    %184
    do16\tu [sol do sol do sol do sol]
    mib'[do mib do mib do mib do]
    sol'8[do, re si]

    %187
    do[do' re si]
    do2\fermata

}

IIIvlIn =  \relative do'' {

    do,8[mib sol do]
    si[sol,16 la si8 sol]
    sol'[si re fa]

    %4
    mib[do,16 re mib8 do]
    do'[mib sol do]
    lab[fa,16 sol lab8 fa]

    %7
    sib[re fa sib]
    sol[mib,16 fa sol8 mib]
    sol16\p [mib sol mib sol mib sol mib]

    %10
    fa [re fa re fa re fa re]
    lab'[fa lab  fa lab fa lab fa]
    sol8 mib' r re\mbreak

    %13
    r8 do r sib
    r lab r sol
    r fa16[mib fa8 re]

    %16
    \once\stemUp mib sol' r fa
    r mib r re
    r do r sib

    %19
    r lab16[sol lab8 fa]
    mib8\f[sol sib mib]
    re[sib,16 do re8 sib]

    %22
    fa'[lab do fa]
    mib[do,16 re mib8 do]
    sol'[si re fa]

    %25
    mib do, r do'\p \mbreak
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)

    %28
    lab'8.[sol16-. fa-. mib-. re-. do-.]
    si(do re do si la sol fa)
    mib8\f[sol' si, do16 re]

    %31
    do4 r8 do\p
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)

    %34
    lab'2
    si,16(do re do si la sol fa)
    mib8\f[sol' si, do16 re]

    %37
    do8[sol' si, do16 re]\mbreak
    do4 r8 sol'
    fa[fa fa fa]

    %40
    fa[fa fa fa]
    mib[mib mib mib]
    mib[mib mib mib]

    %43
    mib[mib mib mib]
    mib[mib re mib]
    mib[mib mib mib]

    %46
    fa[fa re re]
    re[re re re]
    mib[mib do do]\mbreak

    %49
    do[do do do]
    re[re sib sib]
    sib4 r

    %52
    R2
    sib8[sib sib sib]
    sib8[sib sib sib]

    %55
    do[do do do]
    do4 r
    do8[do do do]

    %58
    do[do do do]
    re[re re re]\mbreak
    re4 r

    %61
    R2*4
    re8[re mib mib]
    re[re mib mib]

    %67
    re[re re re]
    re[re re re]
    re[sib sib sib]\mbreak

    %70
    la[la la la]
    sol [re sib sol]
    sol'[sib re sol]

    %73
    fad[re,16 mi fad8 re]
    re'[fad la do]
    sib[sol,16 la sib8 sol]

    %76
    re'16\p[sib re sib re sib re sib]
    do[la do la do la do la]
    mib'[do mib do mib do mib do]

    %79
    sib8 sib' r la\mbreak
    r sol r fad
    r mib! r re

    %82
    r do16[sib do8 la]
    sib re' r do
    r sib r la

    %85
    r sol r fad
    r sol\f[sib, la]
    sol[sol' la fad]

    %88
    sol4 r
    r8 la, la4\mbreak
    r8 re re4

    %91
    r8 sol fad4
    r8 re re4
    r8 fad fad4

    %94
    r8 re[re re]
    fa[fa re re]
    fa4 r

    %97
    r4 r8 mib
    mib[mib do do]\mbreak
    mib4 r

    %100
    r r8 re
    reb[reb sib sib]
    reb4 r

    %103
    R2*3
    reb8[reb reb reb]
    re![re re re]

    %108
    do4 r
    do8[do do do]
    do[do do do]

    %111
    sib[sib sib sib]
    mi[mi mi mi]\mbreak
    do[do do do]

    %114
    lab[lab lab lab]
    sib[sib sib sib]
    sib[sib sib sib]

    %117
    lab[lab lab lab]
    lab?[fa fa mi]
    fa[lab do fa]
    sol,[si re fa]

    %121
    do[mib sol do]\mbreak
    fa,,[lab do fa]
    sib,[re fa sib]

    %124
    mib,,[sol sib mib]
    re[sib,16 do re8 sib]
    fa'[lab do fa]

    %127
    mib[do,16 re mib8 do]
    sol'[si re fa]
    \once\stemDown mib8 do, r do'\p

    %130
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)
    lab'8.[sol16-. fa-. mib-. re-. do-.]

    %133
    si-. do-. re-. do-. si-. la-. sol-. fa-.
    mib8\f[sol' si, do16 re]
    do4 r8 do

    %136
    reb16\p(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)
    lab'2

    %139
    si,16-. do-. re-. do-. si-. la-. sol-. fa-.
    mib8\f[sol' si, do16 re]
    do8[sol' si, do16 re]\mbreak

    %142
    do8 [do re mib]
    lab,[do, re mib]
    fa[sol lab mib]

    %145
    fa[re mib fa]
    sol[fa mib do]
    mib'[mib mib mib]

    %148
    re[re re re]
    re[re re re]
    mib[mib mib mib]

    %151
    sol,[sol sol sol]
    lab[lab lab lab]\mbreak
    fa[fa fa fa]

    %154
    sol[sol sol sol]
    R2*5\mbreak
    mib8[do mib do]  %%%% inizio p. 24

    %161
    mib [do fa lab]
    re,4 r
    re8[sib re sib]

    %164
    re[sib mib sol]
    fa4 r
    R2*3

    %169
    sol'8[sol sol sol]
    sol[sol sol mib]
    fa[fa fa fa]

    %172
    fa[fa fa re]\mbreak
    sol[sol sol sol]
    sol[sol sol sol]\mbreak

    %175
    sol[sol sol sol]
    fa4 r
    r sol,8 sol

    %178
    sol[sol sol sol]
    sol[sol sol sol]
    sol[sol sol do]

    %181
    do[si sol do]\mbreak
    do[si sol mib']
    mib[mib re re]

    %184
    do16 [sol do sol do sol do sol]
    mib'[do mib do mib do mib do]
    sol'8[do, re si]

    %187
    do[do' re si]
    do2\fermata

}

IIIvlIIn = \relative do'' {

    R2
    sol8[si re fa]
    \once\stemDown fa[sol,,16 la si8 sol]

    %4
    mib'[sol do mib]
    \once\stemDown  sol[do,,16 re mib8 do]
    fa[lab do fa]

    %7
    \once\stemDown fa[sib,,16 do re8 sib]
    mib[sol sib mib]
    mib,16\p[sib mib sib mib sib mib sib]

    %10
    re[sib re sib re sib re sib]
    fa'[re fa re fa re fa re]
    mib8 do' r sib\mbreak

    %13
    r lab r sol
    r fa r mib
    r lab16[sol lab8 fa]

    %16
    sol mib' r re
    r do r sib
    r lab r sol

    %19
    r fa16[mib fa8 re]
    mib8\f[sol sib mib]
    re[sib,16 do re8 sib]

    %22
    fa'[lab do fa]
    mib[do,16 re mib8 do]
    sol'[si re fa]

    %25
    mib do, r do'\p \mbreak
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)

    %28
    lab'8.[sol16-. fa-. mib-. re-. do-.]
    si(do re do si la sol fa)
    mib8\f[sol' si, do16 re]

    %31
    do4 r8 do\p
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)

    %34
    lab'2
    si,16(do re do si la sol fa)
    mib8\f[sol' si, do16 re]

    %37
    do8[sol' si, do16 re]\mbreak
    do4 r8 mib
    lab,[lab lab lab]

    %40
    lab?[lab lab lab]
    do[do sol sol]
    sol[sol sol sol]

    %43
    sol[sol sol sol]
    sol[sol si sol]
    lab[lab lab lab]

    %46
    lab?[lab lab fa]
    sol[sol sol sol]
    sol[sol sol mib]

    %49
    fa[fa fa fa]
    fa[fa fa fa]
    sol4 r

    %52
    R2
    sol8[sol sol sol]
    sol[sol sol sol]

    %55
    sol[sol sol do]
    lab4 r
    la!8[la la la]

    %58
    la[la la la]
    la[la la re]\mbreak
    sib4 r

    %61
    R2*4
    sib8[sib do do]
    sib[sib do do]

    %67
    sib[sib sib sib]
    sib[la la la]
    sib[sol sol sol]\mbreak

    %70
    fad[fad fad fad]
    sol[re sib sol]
    R2

    %73
    re''8[fad la do]
    do[re,16 mi fad8 re]
    sib[re sol sib]

    %76
    sib,16\p[sol sib sol sib sol sib sol]
    la[fad la fad la fad la fad]
    do'[la do la do la do la]

    %79
    sib8 sol' r fad\mbreak
    r mib! r re
    r do r sib

    %82
    r la16[sol la8 fad]
    sol sib' r la
    r sol r fad

    %85
    r mib! r re
    r sib\f[sol fad]
    sol[sib do la]

    %88
    sol4 r
    r8 re' do4\mbreak
    r8 do sib4

    %91
    r8 sol la4
    r8 sib sib4
    r8 la la4

    %94
    r8 sib[sib sib]
    si[si si si]
    si?4 r

    %97
    r r8 sol
    la![la la la]\mbreak
    la4 r

    %100
    r r8 fa
    sol[sol sol sol]
    sol4 r

    %103
    R2*3
    lab8[lab lab lab]
    sol[sol sol sol]

    %108
    sol4 r
    sol8[sol sol sol]
    fa[fa fa fa]

    %111
    fa[fa fa fa]
    sol[sol sol sol]\mbreak
    fa[fa fa fa]

    %114
    reb'[reb reb reb]
    sol,[sol sol sol]
    sol[sol sol sol]

    %117
    do[do do do]
    do[sib sol sol]
    fa[fa lab do]

    %120
    re,[sol si re]
    mib,[sol do mib]
    do,[fa lab do]
    fa,[sib re fa]

    %124
    mib,[sol sib mib]
    re[sib,16 do re8 sib]
    fa'[lab do fa]

    %127
    mib[do,16 re mib8 do]
    sol'[si re fa]
    \once\stemDown mib8 do, r do'\p

    %130
    reb16(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)
    lab'8.[sol16-. fa-. mib-. re-. do-.]

    %133
    si-. do-. re-. do-. si-. la-. sol-. fa-.
    mib8\f[sol' si, do16 re]
    do4 r8 do

    %136
    reb16\p(do reb mib reb mib reb do)
    reb(do reb mib reb mib reb do)
    lab'2

    %139
    si,16-. do-. re-. do-. si-. la-. sol-. fa-.
    mib8\f[sol' si, do16 re]
    do8[sol' si, do16 re]\mbreak

    %142
    do8 [do re mib]
    lab,[do, re mib]
    fa[sol lab mib]

    %145
    fa[re mib fa]
    sol[fa mib do]
    sol'[sol sol sol]

    %148
    si[si si si]
    si?[si si si]
    sol[sol sol sib?]

    %151
    sib[sib sib sib]
    do[do do do]\mbreak
    sib[sib sib sib]

    %154
    sib[sib sib sol]
    R2*5
    mib8[do mib do]  %%%% inizio p. 24

    %161
    mib [do fa lab]
    re,4 r
    re8[sib re sib]

    %164
    re[sib mib sol]
    fa4 r
    R2*3

    %169
    do'8[do do do]
    do[do do do]
    si[si si si]

    %172
    si?[si si si]
    do[do do do]
    mib[mib mib mib]

    %175
    mib[mib mib mib]
    re4 r
    r mib,8 mib

    %178
    mib[mib mib mib]
    mib[mib mib mib]
    mib[mib mib sol]

    %181
    sol[sol mib sol]\mbreak
    sol[sol mib sol]
    sol[do do si]

    %184
    sol16[mib sol mib sol mib sol mib]
    do'[sol do sol do sol do sol]
    mib'8[mib fa re]

    %187
    mib[mib fa re]
    do2\fermata

}

IIIvlan =  \relative do' {

    r8 sol[mib' sol,]
    r re'[si si]
    r re[si si]

    %4
    r mib[sol, sol]
    r sol[sol mib]
    r do'[do lab]

    %7
    r fa'[fa re]
    r sib[sib sol]
    sib\p[sib sib sib]

    %10
    sib[sib sib sib]
    sib[sib sib sib]
    sib[do re re]\mbreak

    %13
    mib[fa sol sib,]
    do[re mib sol]
    fa[mib do sib]

    %16
    sib sib' r sib
    r do r fa,
    r fa r sib,

    %19
    r sib[do re]
    sib4\f r
    sib8[re fa sib]

    %22
    lab[fa,16 sol lab8 fa]
    do'[mib sol do]
    si[sol,16 la si8 sol]

    %25
    do4 r8 sol'\p \mbreak
    lab[lab lab lab]
    lab?[lab lab lab]

    %28
    lab?[lab lab lab]
    re,[re re si]
    sol\f[mib' re sol]

    %31
    mib[sol sol sol\p]
    lab[lab lab lab]
    lab?[lab lab lab]

    %34
    do,[do do fa]
    re[re re si]
    sol\f[mib' re si]

    %37
    mib[mib re si]\mbreak
    sol4 r8 do
    do[do do do]

    %40
    do[do do do]
    do[do do do]
    do[do do do]

    %43
    do[do do do]
    sol sol sol do
    fa[fa fa fa]

    %46
    sib,[sib sib sib]
    mib[mib mib mib]
    lab,[lab lab lab]

    %49
    re[re re re]
    re[re re re]
    mib4 r

    %52
    R2
    do8[do do do]
    mi[mi mi mi]

    %55
    mi?[mi mi mi]
    fa4 r
    re8[re re re]

    %58
    fad[fad fad fad]
    fad?[fad fad fad]\mbreak
    sol4 r

    %61
    R2*4
    sol8[sol sol sol]
    sol8[sol sol sol]

    %67
    sol8[sol sol sol]
    sol[re re re]
    sol[sol, sol sol]\mbreak

    %70
    re'[re re re]
    sol[re sib sol]
    r sol'[sib re,]

    %73
    r la'[re, re]
    r fad[fad fad]
    r re[re re]

    %76
    re\p[re re re]
    re[re re re]
    re[re re re]

    %79
    re[re' fad, la]\mbreak
    sol[mib la fad]
    sib[sol la sib]

    %82
    la[fad fad fad]
    re[sib' mib, la]
    re,[mi fad fad]

    %85
    re mib la, fad'
    re\f[re re re]
    re[re mib re]

    %88
    sib4 r
    r8 fa'! fa4\mbreak
    r8 sol sol4

    %91
    r8 re re4
    r8 sol, sol4
    r8 re' re4

    %94
    r8 sol,[sol sol]
    sol[sol sol sol]
    sol4 r

    %97
    r r8 do
    fa[fa fa fa]\mbreak
    fa4 r

    %100
    r r8 sib,
    mib[mib mib mib]
    mi4 r

    %103
    R2*3
    fa8[fa fa fa]
    fa[fa fa fa]

    %108
    mib4 r
    mib8[mib mib mib]
    mib[mib mib mib]

    %111
    reb[reb reb reb]
    do[do do sib]\mbreak
    lab[lab lab sol]

    %114
    fa[fa fa fa]
    mi[mi mi mi]
    mi?[mi mi'! mi]

    %117
    fa[fa fa fa]
    fa[reb do do]
    do[do do lab]

    %120
    sol[sol sol sol]
    sol[sol sol sol]\mbreak
    fa[do' do do]

    %123
    re[re re re]
    sib4 r
    sib8[re fa sib]

    %126
    lab[fa,16 sol lab8 fa]
    do'[mib sol do]
    si[sol,16 la? si8 sol]

    %129
    do mib sol\p do
    lab8[lab lab lab]
    lab?[lab lab lab]

    %132
    lab?[lab lab lab]
    re,[re re si]
    sol\f[mib' re sol]

    %135
    mib[sol sol sol]
    lab\p[lab lab lab]
    lab?[lab lab lab]

    %138
    do,[do do fa]
    re[re re si]
    sol\f[mib' re si]

    %141
    mib[mib re si]
    sol4 r
    R2*4

    %147
    do8[do do do]
    sol[sol sol sol]
    sol[sol sol sol]

    %150
    do[do do do]
    do[do do do]
    fa[fa fa fa]\mbreak

    %153
    re[re re re]
    mib[mib mib mib]
    R2*14

    %169
    mib8[mib mib mib]
    mib[mib mib mib]
    re[re re re]

    %172
    re[re re re]
    mib[mib mib mib]
    do[do do do]\mbreak

    %175
    do[do do do]
    sol4 r
    r do8 do

    %178
    do[do do do]
    do[do do do]
    do[do do do]

    %181
    sol[sol do do]\mbreak
    sol[sol do do]
    do[do sol sol]
    mib'16[do mib do mib do mib do]
    sol'[mib sol mib sol mib sol mib]
    sol8[sol lab sol]
    sol8[sol lab sol]
    mib2\fermata

}

IIIbcn = \relative do {

    r8 do[do, do']
    r sol'[sol, sol']
    r sol[sol, sol']

    %4
    r do,[do, do']
    r do[do, do']
    r fa[fa, fa']

    %7
    r sib[sib, sib']
    r mib,[mib, mib']
    mib\p[mib mib mib]

    %10
    sib[sib sib sib]
    sib[sib sib sib]
    mib\p[lab sib sib,]\mbreak

    %13
    do[re mib sol,]
    lab[sib do mib]
    re[mib lab, sib]

    %16
    mib,[mib' sib' sib,]
    mib,[mib' sib' sib,]
    do[re mib sol,]

    %19
    lab[mib' lab, sib]
    mib,4\f r
    sib'8[re fa sib]

    %22
    lab[fa,16 sol lab8 fa]
    do'[mib sol do]
    si[sol,16 la si8 sol]

    %25
    do[mib sol\p do]\mbreak
    fa,[fa fa fa]
    fa[fa fa fa]

    %28
    fa[fa fa fa]
    sol[sol, sol sol]
    do\f[do sol' sol,]

    %31
    do[mib mib mib]\p
    fa[fa fa fa]
    fa[fa fa fa]

    %34
    fa[fa fa fa]
    sol[sol, sol sol]
    do\f[do sol' sol,]

    %37
    do[do sol' sol,]\mbreak
    do4 r
    R2*12

    %51
    mib8[sol lab sib]
    mib,[fa sol mib]
    R2*3

    %56
    fa4 fa,
    R2*3\mbreak
    sol'4 sol,

    %61
    do8[re sib sol]
    re'[sol la fad]
    sol[do re re,]

    %64
    sol[do fad, re]
    sol4 r
    R2*5

    %71
    sol8[re sib sol]
    r sol'[sol, sol']
    r re[re, re']

    %74
    r re[re, re']
    r sol[sol, sol']
    sol[sol sol sol]

    %77
    re[re re re]
    re[re re re]
    sol, sib' re re,\mbreak

    %80
    mib[do' fad, re]
    sol[do fad, sol]
    re[re' re re,]

    %83
    sol,[sol' do fad,]
    sol[dod re re,]
    sol[do fad, re]

    %86
    sol\f sol, re' re,
    sol'[sol, do re]
    sol,4 r

    %89
    R2*7
    si8[si si si]
    do[do do] r

    %98
    R2
    la8[la la la]
    sib[sib sib] r

    %101
    R2
    do8[do do do]
    do[do do do]

    %104
    do[do do do]\mbreak
    fa4 r
    R2*2

    %108
    do4 r
    R2*10
    fa8[fa16 mi fa8 fa]

    %120
    si,[si16 la si8 si]
    do[do16 si do8 do]\mbreak
    lab\f[fa'16 mi fa8 fa]

    %123
    re[sib16 lab? sib8 lab!]
    sol4 r
    sib8[re fa sib]

    %126
    lab[fa,16 sol lab8 fa]
    do'[mib sol do]
    si[sol,16 la? si8 sol]

    %129
    do mib sol\p do
    fa,[fa fa fa]
    fa[fa fa fa]

    %132
    fa[fa fa fa]
    sol [sol, sol sol]\mbreak
    do\f [do sol' sol,]

    %135
    do[mib mib mib]
    fa\p[fa fa fa]
    fa[fa fa fa]

    %138
    fa[fa fa fa]
    sol[sol sol sol,]
    do\f[do sol' sol,]

    %141
    do[do sol' sol,]
    do4 r
    R2*12

    %155
    do8[sol do sol]
    do8[sol do sol]
    do fa, do' do'

    %158
    si[la si sol]
    mib[do mib do]\mbreak
    R2*2

    %162
    re8[sib re sib]
    R2*2
    fa'8[fa, sol' sol,]

    %166
    lab'[lab, sib' sib,]\mbreak
    do' [do, re' si]
    sol[re si sol]

    %169
    R2*7
    sol8[sol sol sol]
    sol4 r

    %178
    R2*6
    do8[do do do]
    do[do do do]

    %186
    do[do fa, sol]
    do,[do' fa, sol]
    do,2\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\minor
  \time 2/4
  \tempo 2 = 45
  s2*188
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

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

    \markup\huge "[1.] All[egr]o molto"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""principale]"}
                \Ivl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
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

    \pageBreak

    \markup\huge "[2.] Larghetto"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \IIvl
            >>

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
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 0.8\cm

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

    \pageBreak

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
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 0.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
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






