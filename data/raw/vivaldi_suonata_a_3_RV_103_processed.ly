\language "italiano"
%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

pipeSymbol = \bar "||"

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph "scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

pia = _\markup \italic "pia."

fort = _\markup \italic "fort"

piano = _\markup \italic "piano"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

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


mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinesenza \terzine
}

Ifln = \relative do'' {

    r8 re sol4~
    sol8[re sol la]
    sib4 la

    %4
    sol8 re mib4~
    mib8[do re la]
    sib sol sib'4

    %7
    la sol
    fad r
    r r8 re

    %10
    sol4 fad
    sol r8 sib
    la4~la16 sol fad mi

    %13
    re4 r8 re\mbreak
    mib4 sib
    la8[la'16 sib do8 sib16 la]

    %16
    sib8[re, sol re]
    do'8 sib4 la8~
    la[re, fa re]

    %19
    sib' la4 sol8~
    sol[do, mib do]
    la' fad4 do8~

    %22
    do[sib16 do re do sib la]
    sib8[sol' la fad]
    sol4 r

    %25
    re'2~
    re
    do~\mbreak

    %28
    do
    fad,~
    fad

    %31
    sol4 r
    sol8 re sol4~
    sol8[re sol la]

    %34
    sib4 \tieDashed lab~
    lab8[sol16 fad sol8 la?]\tieSolid
    re,4 mib

    %37
    re8[do16 sib do8 la]
    sib re sib'4
    la8[sol16 fad sol8 la]

    %40
    re, sol sib4
    la8[sol16 fad sol8 la]\mbreak
    re,4 r

    %43
    re'8 do4 sib8~
    sib[la16 sol fa8 re]
    mib sol4 mib8

    %46
    do' sib4 la8~
    la[sol16 fa mib8 do]
    re fa4 re8

    %49
    sib' la4 sol8~
    sol[fa16 mib re8 sib]
    fa'4. mib16 re

    %52
    sol4. fa16 mib
    la4. sol16 fa
    sib8[la16 sol fa8 mi!]\mbreak

    %55
    fa2
    sib8[la16 sol fa8 mi]
    fa8[mib16 re do8 sib]

    %58
    do2
    sib4 r
    r r8 fa'

    %61
    sib4 la
    sib r8 re
    do4~do16 sib la sol

    %64
    fa4 r8 fa
    sol4 re
    do8[fa(sol fa)]

    %67
    re' sib4 la8
    sol[mib (fa mib)]
    do' la4 sol8

    %70
    fa[re(mib re)]
    sib'[re, (mib re)]
    sib' [fa re sib]

    %73
    do4.\tr sib8
    sib[do16 re mib fa sol la]\mbreak
    sib8[fa re\tr do16 sib]

    %76
    sib'8[fa re\tr do16 sib]
    fa'2
    sib8[(re sib sol)]

    %79
    mib[(fa16 sol fa8 mib)]
    la[do la fa]
    re[(mib16 fa mib8 re)]

    %82
    sol[(sib sol mib)]
    \appoggiatura re8 dod4. la'8
    sib(la16 sol) la8(sol16 fa)

    %85
    sol8(fa16 mi) fa8(mi16 re)
    dod8[(la dod mi)]
    sib'[(sold) la (fad)]

    %88
    sol![(mi) fa!(re)]
    sib'[(dod,) re(sol)]\mbreak
    fa4(mi\tr)

    %91
    re r
    r r8 la'
    re4 dod

    %94
    re r8 fa,
    mi4~mi16 re dod si
    la4 r8 la'

    %97
    sib4 fa
    mi8 la re4~
    re8[la re mi]

    %100
    fa4 mi
    re8 la sib4~
    sib8[sol la mi]

    %103
    fa re fa4
    mi4 re
    dod8[mi16 fa sol8 fa16 mi]\mbreak

    %106
    fa8[re fa re]
    sol fa4 mi8~
    mi[la, do la]

    %109
    fa' mi4 re8~
    re[sol, sib sol]
    mi' dod4 sol'8~

    %112
    sol[fa16 sol la sol fa mi]
    fa8[re mi dod]
    re4 r

    %115
    la'2~
    la
    sol~

    %118
    sol\mbreak
    <<
        {
            \tieDown dod,2~
            dod

            %121
            re4 r
        }
        \new CueVoice {
            \stemUp \tieUp dod'2~
            dod
            re8 re,
        }
    >> \stemNeutral \tieNeutral
    re4~re16 fa mi re
    mi4~mi16 sol fa mi

    %124
    fa8[mi16 re fa8 sol]
    la[si16 dod re8 la]
    fa[mi16 re fa8 sol]

    %127
    la4 r8 la
    re,16 re' re8~re16 la la8~
    la16 fad fad8~fad16 do' sib la

    %130
    sib8[(do re do]
    sib[la sol fa)]
    mi16 do' do8~do16 sol sol8~\mbreak

    %133
    sol16 mi mi8~mi16 sib' la sol
    la8[(sib do sib]
    la[sol fa mi)]

    %136
    re16 sib' sib8~sib16 fa fa8~
    fa16 re re8~re16 la' sol fa
    sol8[(la sib la]

    %139
    sol[fa mi re)]
    dod16 la' la8~la16 mi mi8~
    mi16 dod dod8~dod16 sol' fa mi

    %142
    fa4 r8 re
    fad[(mib re do]
    fad[mib re do)]

    %145
    sol'16 fad sol8 r re\mbreak
    si'[(lab sol fa)]
    si?[(lab sol fa)]

    %148
    do'16 si do8 r do,
    re[(si la sol)]
    sol'[ mib re do]

    %151
    lab'[fa mib re]
    si'[(sol fa mib)]
    do'[sol lab do,]

    %154
    reb[(do) sol'(do,)]
    reb[do sol' do,]
    do'[sol lab do,]

    %157
    si4. do8
    do4 r
    r4 r8 sol'

    %160
    do4 si
    do8 sol do4~
    do8[sol do re]

    %163
    mib4 re
    do8 sol lab4~
    lab8[fa sol re]

    %166
    mib do mib'4
    re do
    si8 fa16 sol lab8 sol16 fa\mbreak

    %169
    mib4 r
    sol2~
    sol

    %172
    fa~
    fa
    si,~

    %175
    si
    do4 r
    do\tr do\tr

    %178
    do8[sol'16 fa mib8 re]
    do4\tr do\tr\mbreak
    do16 re mib fa sol8 do,

    %181
    lab'4\tr lab \tr
    lab8[do16 sib lab8 sol]
    fa4\tr fa\tr

    %184
    fa16 sol lab sib do8 sol
    fad4\tr fad\tr
    fad?8[do'16 sib la8 sol]

    %187
    fad4\tr fad\tr
    fad?16 sol la sib do8 la
    sib sol r sib

    %190
    sib16(do re8) re16(do sib8)
    sib8 la4 la8\mbreak
    la16(sib do8) do16(sib la8)

    %193
    la8 sol4 sol8
    sol16(la sib8) sib16(la sol8)
    fad4 r

    %196
    r r8 re
    sol4 fad
    sol4 r8 sib

    %199
    la4~la16 sol fad mi
    re8 re sol4~
    sol8[re sol la]

    %202
    sib4 la
    sol8 re mib4~
    mib8[do re la]

    %205
    sib4 r\mbreak
    re'2~
    re

    %208
    do~
    do
    fad,~

    %211
    fad
    sol4 r
    sol8[re sol la]

    %214
    sib4 lab~
    lab8[sol16 fad sol8 la?]
    re,4 mib

    %217
    re8[do16 sib do8 la]
    sib re sib'4\mbreak
    la8[sol16 fad sol8 la]

    %220
    re, sol sib4
    la8[sol16 fad sol8 la]
    re,4 r

    %223
    re'8.[(do16) sib8.(la16)]
    sol4 fa
    mib2

    %226
    do'8.[(sib16) la8.(sol16)]
    fa4 mib
    re2

    %229
    sib'8.[la16 sol8. fa16]
    mib4 re
    do4. la'8

    %232
    fad la4 do8
    la do4 mib8
    do2~

    %235
    do8[sib16(do) re(do) sib(la)]
    sib8[(fad) sol(do)]
    sib4(la\tr)

    %238
    sol8[re sol sib]
    do2~
    do8[[sib16(do) re(do) sib(la)]

    %241
    sib8[(fad) sol(do)]
    sib4 la
    sol r

    %244
    re'2~
    re\mbreak
    do~

    %247
    do
    fad,~
    fad

    %250
    re8[sib' do la]
    sol[re sol re]
    do' sib4 la8~

    %253
    la[re, fa re]
    sib' la4 sol8~
    sol8[do, mib do]

    %256
    la' fad4 do8~
    do[sib16(do) re(do) sib(la)]\mbreak
    sib8[sol' la fad]

    %259
    sol2\fermata

}

Iobn = \relative do'' {

    R2
    r4 r8 re
    sol4 fad

    %4
    sol r8 sib
    la4~la16 sol fad mi
    re4 r8 re

    %7
    mib4 sib
    la8 re sol4~
    sol8[re sol la]

    %10
    sib4 la
    sol8 re mib4~
    mib8[do re la]

    %13
    sib sol sib'4\mbreak
    la sol
    fad8[fad16 sol la8 sol16 fad]

    %16
    sol4 r
    <<
        {
            \tieDown re2~
            re

            %19
            do~
            do
        }
        \new CueVoice {
            \stemUp \tieUp re'2~
            re
            do~
            do
        }
    >>
    fad,~

    %22
    fad
    sol4 r
    r8 re[sol re]

    %25
    do' sib4 la8~
    la8[re, fa re]
    sib' la4 sol8~\mbreak

    %28
    sol[do, mib do]
    la' fad4 do8~
    do[sib16 do re do sib la]

    %31
    sib8[sol' la fad]
    sol4 r
    R2*26

    %59
    r8 <<
        {
            \stemDown \tieDown fa,8 sib4~
            sib8[fa sib do]
            re4 do

            %62
            sib8 fa'
        }
        \new CueVoice {
            \stemUp \tieUp fa sib4~
            sib8[fa sib do]
            re4 do
            sib
        }
    >> \stemNeutral \tieNeutral sol4~
    sol8[mib fa do]
    re sib re4

    %65
    do sib\mbreak
    do8[la'(sib la)]
    R2

    %68
    r8 sol[la sol]
    R2
    r8 fa[sol fa]

    %71
    r fa[sol fa]
    r4 r8 re
    la4. fa'8

    %74
    re4 r\mbreak
    R2*16
    r8 la re4~

    %92
    re8[la re mi]
    fa4 mi
    re8 la sib4~

    %95
    sib8[sol la mi]
    fa re fa'4
    mi re

    %98
    dod r
    r r8 la
    re4 dod

    %101
    re r8 fa
    mi4~mi16 re dod si
    la4 r8 la

    %104
    sib4 fa
    mi8[dod'16 re mi8 re16 dod]\mbreak
    re4 r

    %107
    la'2~
    la
    sol~

    %110
    sol
    <<
        {
            \tieDown \stemDown dod,2~
            dod

            %113
            re4
        }
        \new CueVoice {
            \stemUp \tieUp dod'2~
            dod
            re8 re,
        }\\
    >> \stemNeutral \tieNeutral r4
    r8 re[fa re]
    sol fa4 mi8~
    mi[la, do la]

    %117
    fa' mi4 re8~
    re[sol, sib sol]\mbreak
    mi' dod4 sol8~

    %120
    sol[fa16 sol la sol fa mi]
    fa8[re' mi dod]
    re4 r

    %123
    R2*35
    r8 sol, do4~\mbreak
    do8[sol do re]

    %160
    mib4 re
    do r
    r r8 sol

    %163
    do4 si
    do r8 mib
    re4~re16 do si la

    %166
    sol4 r8 sol'
    lab4 mib
    re8[re16 mib fa8 mib16 re]\mbreak

    %169
    do8[do mib do]
    fa mib4 re8~
    re[sol, sib sol]

    %172
    mib' re4 <<
        {
            \stemDown \tieDown do8~
            do[fa, lab fa]
            re' si4 fa8~

            %175
            fa[mib16 fa sol fa mib re]
            mib8[do' re si]
            do4
        }
        \new CueVoice {
            \stemUp \tieUp s8
            s fa8[lab fa]
            re' si4 fa8~
            fa[mib16 fa sol fa mib re]
            mib8[do' re si]
            do4
        }
    >> r\stemNeutral \tieNeutral

    %178
    R2*17
    r8 re, sol4~
    sol8[re sol la]

    %197
    sib4 la
    sol8 re mib4~
    mib8[do re la]

    %200
    sib sol r4
    r r8 re'
    sol4 fad

    %203
    sol r8 sib
    la4~la16 sol fad mi
    re8[re sol re]\mbreak

    %206
    do' sib4 la8~
    la[re, fa re]
    sib' la4 sol8~

    %209
    sol[do, mib do]
    la' fad4 do8~
    do[sib16 do re do sib la]

    %212
    sib8[sol' la fad]
    sol4 r
    R2*29

    %243
    r8 re[sol re]
    do' sib4 la8~
    la[re, fa re]\mbreak

    %246
    sib' la4 sol8~
    sol[do, mib do]
    la' fad4 do8~

    %249
    do[sib16 do re do sib la]
    sib8[sol' la fad]
    sol4 r

    %252
    <<
        {
            \stemDown \tieDown re2~
            re
            do~

            %255
            do
        }
        \new CueVoice {
            \stemUp \tieUp re'~
            re
            do~
            do
        }
    >> \stemNeutral \tieNeutral
    fad,2~
    fad

    %258
    sol8[sib, do la]
    sol2\fermata

}

Ifgn = \relative do {

    r4 r8 sol'
    sib,[la sol fad']
    sol4 re

    %4
    sol,8[la sib sol]
    fad[mi fad re]
    sol[la sib sol]

    %7
    do4 dod
    re r8 sol
    sib,[la sol fad']

    %10
    sol4 re
    sol,8[la sib sol]
    fad[mi fad re]

    %13
    sol[la sib sol]\mbreak
    do4 dod
    re r8 re

    %16
    sol4 sol
    fad fad
    fa! fa

    %19
    mi mi
    mib mib
    re re

    %22
    re re
    sol8[sib, do re]
    sol4 sol

    %25
    fad fad
    fa! fa
    mi mi\mbreak

    %28
    mib mib
    re re
    re re

    %31
    sol8[sib, do re]
    sol[la sib la]
    sol4 r8 fad

    %34
    sol,[sol' do si]
    do[re sib! do]
    sib[sol do fad,]

    %37
    sol[sol, la' fad]
    sol[la sib sol]
    do[re sib fad]

    %40
    sol[la sib sol]
    do[re sib do]\mbreak
    re[la fad re]

    %43
    sib'[la16 sol fad8 sol]
    re4 si
    do8[re mib do]

    %46
    la'[sol16 fa mi!8 fa]
    do4 la
    sib8[do re sib]

    %49
    sol'[fa16 mib re8 mib]
    do4 sib
    re8[do re sib]

    %52
    mib[re mib do]
    fa[mib fa re]
    sol[la sib do]\mbreak

    %55
    la[sol la fa]
    sol[la sib do]
    la[sib la sol]

    %58
    fa[mib fa fa,]
    sib4 r8 sib'
    re,[do sib la']

    %61
    sib4 fa
    sib,8[do re sib]
    la[sol la fa]

    %64
    sib[re do sib]
    mib4 mi\mbreak
    fa4 r

    %67
    sib8[la sol fa]
    mib4 do
    la'8[sol fa mib]

    %70
    re4 sib
    re sib
    re sib

    %73
    fa' fa,
    sib r\mbreak
    re sib

    %76
    re sib
    la8[fa' sib la]
    sol4. mib8

    %79
    do[re mib do]
    fa4. re8
    sib[do re sib]

    %82
    sib'4. sol8
    la[si dod la]
    la,2~

    %85
    la~
    la~
    la~

    %88
    la~
    la~
    la

    %91
    re4 r8 re'
    fa,[mi re dod']
    re4 la

    %94
    re, r8 re
    dod[si dod la]
    re[fa mi re]

    %97
    sol4 sold
    la r8 re
    fa,[mi re dod']

    %100
    re4 la
    re, r8 re
    dod8[si dod la]

    %103
    re[fa mi re]
    sol,4 sold
    la r8 la'\mbreak

    %106
    re4 re
    dod dod
    do! do

    %109
    si si
    sib! sib
    la2~

    %112
    la8[la, dod la]
    re[fa sol la]
    re4 re

    %115
    dod dod
    do do
    si si

    %118
    sib! sib\mbreak
    la2~
    la8[la, dod la]

    %121
    re[fa sol la]
    re,[re'16 dod re8 re,]
    dod[dod'16 si dod8 dod,]

    %124
    re[re'16 dod re8 sol,]
    la[sol fa dod]
    re do! sib4

    %127
    la8[si dod la]
    fad'8.[fad16 fad8. fad16]
    re8.[re16 re8. re16]

    %130
    sol2~
    sol
    do,8.[do16 do8. do16]

    %133
    do8.[do16 do8. do16]
    fa2~
    fa

    %136
    sib,8.[sib16 sib8. sib16]
    sib8.[sib16 sib8. sib16]
    sib2~

    %139
    sib
    la8.[la16 la8. la16]
    la8.[la16 la8. la16]

    %142
    re8[mi fa re]
    do2~
    do

    %145
    sib8[la sib sol]\mbreak
    fa'2~
    fa

    %148
    mib8[re mib do]
    sol'2
    mib

    %151
    fa
    sol
    mib4 fa~

    %154
    fa8[mib re do]
    fa[mib re do]
    r do fa4

    %157
    sol sol,
    do r8 do'\mbreak
    mib,[re do si']

    %160
    do4 sol
    do, r8 do'
    mib,[re do si']

    %163
    do4 sol
    do,4 r8 do
    si[la si sol]

    %166
    do[mib re do]
    fa4 fad
    sol r8 sol\mbreak

    %169
    do4 do
    si si
    sib! sib

    %172
    la la
    lab lab
    sol2~

    %175
    sol8[sol, si sol]
    do[mib fa sol]
    do,[re mib re]

    %178
    do4 r
    do8[re mib re]\mbreak
    do4 r

    %181
    fa8[sol lab sol]
    fa4 r
    fa8[sol lab sol]

    %184
    fa4 r
    re8[mi fad mi]
    re4 r

    %187
    re8[mi fad mi]
    re4 r
    sol8[la sib la]

    %190
    sol4 sol
    fad fad\mbreak
    fa! fa

    %193
    mi mi
    mib mib
    re r8 sol

    %196
    sib,[la sol fad']
    sol4 re
    sol, r8 sol'

    %199
    fad[mi fad re]
    sol4 r8 sol
    sib,8[do sol fad']

    %202
    sol4 re
    sol, r8 sol'
    fad[mi fad re]

    %205
    sol4 sol\mbreak
    fad4 fad
    fa! fa

    %208
    mi mi
    mib mib
    re2~

    %211
    re8[re fad re]
    sol[sib, do re]
    sol, 4 r8 fad'

    %214
    sol[sib do do,]
    re[re' sib fad]
    sol[sib do fad,]

    %217
    sol[sol, la' fad]
    sol8[la sib sol]\mbreak
    do[re sib do]

    %220
    sib[la sib sol]
    do[re sib do]
    re[do re re,]

    %223
    R2*2
    do8[re mib do]
    R2*2

    %228
    sib8[do re sib]
    R2*2
    la8[sib do la]

    %232
    re re' re,4
    re8 re' re,4
    re8[mi fad mi]

    %235
    re4 r8 fad
    sol[re mib do]
    re4 re,

    %238
    sol'8[la sib sol]
    la[sol fad mi]
    re4. fad8

    %241
    sol[re mib do]
    re4 re,
    sol sol'

    %244
    fad fad
    fa! fa\mbreak
    mi mi

    %247
    mib mib
    re2~
    re8[re fad re]

    %250
    sol[sol, do re]
    sol,4 sol'
    fad fad

    %253
    fa! fa
    mi mi
    mib mib

    %256
    re2~
    re8[re fad re]\mbreak
    sol[sol, do re]

    %259
    sol,2\fermata

}

forma = {

    \time 2/4
    \key re\minor
    \tempo 2 = 60
    s2*259
    \bar "|."

}


Ifl = {
    \Iglobal
    <<\Ifln\forma>>
}

Iob = {
    \Iglobal
    <<\Iobn\forma>>
}

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn\forma>>
}




IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinesenza \terzine
}

IIfln = \relative do'' {

    r4 r8 sib' la sib16 do fad,4
    \appoggiatura fad?8 sol4 r r2
    r8 sib sib4~sib16 sib do re do8[sib]

    %4
    la la la4~la16 la sib do sib8[la]
    sol sol sol4~sol16 sol la sib la8[sol]
    fa4 r8 sib, sol'4. la8

    %7
    sib16 fa mib re do8.\tr sib16\mbreak sib2
    r4 r8 mib re mib16 fa la,4\tr
    \appoggiatura la8 sib4 r r2

    %10
    r4 r8 sol' fa sol16 la dod,4
    re8 re' re4~re16 do sib la sol8[fa]
    mib do' do4~do16 sib la sol fa8[mib]

    %13
    re sib' sib4~sib16 la sol fa mib8[re]
    do la' la4~la16 sol fad mi re8[do]
    sib4 r8 sib' do sib r sib,

    %16
    do sib r sib' do sib r sib
    la4. la8 re,4 r8 re mi4. fad8
    sol16 re(do sib la8.\tr sol16

    %19
    sol4) r8 re' mi4. fad8
    sol16 re(do sib la8. sol16 sol2)

}

IIobn = \relative do'' {

    R1
    r4 r8 <<
        {
            \stemDown sib la sib16 do fad,4_\tr
            \appoggiatura fad8 sol4
        }
        \new CueVoice {
            \stemUp sib'8 la sib16 do fad,4\tr
            sol4
        }
    >> \stemNeutral r r8 mib mib4~

    %4
    mib16 mib fa sol fa8[mib] re re re4~
    re16 re mib fa mib8[re] do do do4
    re8 sib fa'4~fa8 mib16 re mib8 mib

    %7
    re16 re do sib la8.\tr sib16 sib2
    R1
    r4 r8 fa'8 mib fa16 sol si,4\tr

    %10
    \appoggiatura si8 do4 r r2
    r r8 sol' sol4~
    sol16 fa mib re do8[sib] la fa' fa4~

    %13
    fa16 mib re do sib8[la] sol mib' mib4~\mbreak
    mib16 re do sib la8[sol] fad re' \tieDashed re4~
    re8 \tieSolid sol, r sol' la sol r sol,

    %16
    la sol r sol' la sol r sol
    fad8 sol16 la re,8 do sib sol re'4~
    re8 do16 sib do8 do <<
        {
            \stemDown sib16 sib la sol fad8._\tr sol16

            %19
            sol8 sol
        }
        \new CueVoice {
            \stemUp sib16 sib' la sol fad8.\tr sol16
            sol4
        }
    >> \stemNeutral re~re8 do16 sib do8 do
    <<
        {\stemDown sib16 sib la sol fad8._\tr sol16 sol2_\fermata}
        \new CueVoice {\stemUp sib16 sib' la sol fad8.\tr sol16 sol2}
    >>

}

IIfgn = \relative do {

    sol'8 la sib sol do la re re,
    sol la sib sol do, la re re,
    sol sol' sib sol r do, mib do

    %4
    r fa la fa r sib, re sib
    r mib sol mib r la, do la
    sib do re sib mib4. fa8

    %7
    sib, mib fa fa,\mbreak sib2
    sib8 do re la sib sib' fa fa,
    sib do re si do do' sol sol,

    %10
    do re mi dod re re' la la,
    re mi fa re sol la sib sol
    do, re mib do fa sol la fa

    %13
    sib, do re sib mib fa sol mib\mbreak
    la, sib do la re mi fad re
    sol la sib sol re sol sib sol

    %16
    re sol sib sol re sol sib sol
    re4 mi8 fad sol la sib sol
    do,4. re8 sol, sol' re[re,]

    %19
    sol la sib sol do4. re8
    sol, sol' re[re,] sol2

}

forma = {

    \time 4/4
    \key re\minor
    \tempo 4 = 50
    s1*7\break
    \bar ":..:"
    s1*12
    s2 s\fermata
    \bar ":..:"

}


IIfl = {
    \IIglobal
    \notypeset
    <<\IIfln\forma>>
}

IIob = {
    \IIglobal
    <<\IIobn\forma>>
}

IIfg = {
    \IIglobal
    \clef bass
    <<\IIfgn\forma>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16,
2.19.22, 2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40,
2.19.46, 2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2,
2.23.3, 2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10,
2.23.11, 2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinesenza \terzine
}

IIIfln = \relative do'' {

    sol'8(
    fad)[fa (mi) mib]
    (re16) do sib la sol8 sib'
    (la)[lab(sol) fad]

    %4
    sol16 fad sol la sol8 \slurDashed sib
    (la) sol4 la8
    sib4 r8 re,

    %7
    (mib)[do' (sib) la]
    sol4 r8 re'\mbreak
    re16 do sib la re do sib la

    %10
    sib8 sib4 sib8
    do16 sib la sol do sib la sol
    la8 la4 la8

    %13
    sib16 la sol fa sib la sol fa\mbreak
    sol8 sol4 sol8
    la16 sol fa mi la sol fa mi

    %16
    fa8 la4 fa8
    fa8 la4 fa8
    mi[fa mi mi]

    %19
    re4 r8 fa
    (mi) re4 mi8
    fa4 r8 la

    %22
    (sib)[sol (fa) mi]
    re4 r8 re'(\mbreak
    dod)[do (si) sib]

    %25
    (la16) sol fa mi re8 fa
    (mi)[mib (re)\slurSolid dod]
    re16 dod re mi re4

    %28
    R2
    re'16 mi re la re mi re la
    sib4. sib8

    %31
    do16 re do sol do re do sol
    la4. la8\mbreak
    sib16  do sib fa sib do sib fa

    %34
    la sib sib do do sib sib la
    la sib sib do do sib sib la
    la8[sib sib la]
    sib4 r8 \slurDashed sib

    %38
    (la)[la (sol) sol]
    (fa16) mib re do sib8 re'
    (do)[do (sib) la]

    %41
    (sib16) la sib do sib8 re(\mbreak
    do)[la (sib) do]\slurSolid
    re4 r8 fa,

    %44
    sol[sol re do]
    sib4 r8 fa'
    sib[fa re do16 sib]

    %47
    fa'4~fa16 fa sol la
    sib8[ fa re do16 sib]
    fa'4~fa16 fa sol la

    %50
    sib fa sib fa sib la sol fa\mbreak
    sol4. sol8
    lab16 mib lab mib lab sol fa mib

    %53
    fa4. fa8
    sol16 re sol re sol fa mib re
    mib fa fa sol sol fa fa mib

    %56
    mib? fa fa sol sol fa fa mib
    mib?8 [do' do si]
    do4 r8\slurDashed  mib,(\mbreak

    %59
    re8) do4 re8
    mib4 r8 sol
    (lab)[fa (mib) re]

    %62
    do4 r8 do'
    (si)[sib (la) lab]
    (sol16) fa mib re do8 mib

    %65
    (re)[reb (do)\slurSolid si]
    do16 si do re do8 sol'\mbreak
    sol8[fa fa mib]

    %68
    mib?[re re sol]
    sol[fa fa mib]
    mib?[re re si']

    %71
    do[do do sib!]
    la4. la8
    sib[sib sib lab]

    %74
    sol4. sol8
    lab[lab lab sol]\mbreak
    fad[sol sol fad]

    %77
    \slurDashed sol4 r8 sol
    (fad)[fa (mi) mib]
    (re16) do sib la sol8 sib'

    %80
    (la) sol4 la8
    sib4 r8 sib
    (la)[lab (sol) fad]

    %83
    (sol16) fad sol la sol8 re(\mbreak
    mib)[do (sib)\slurSolid la]
    sol4 r8 re''

    %86
    re16 do sib la re do sib la
    sib8 sib4 sib8
    do16 sib la sol do sib la sol

    %89
    la8 la4 la8
    sib16 la sol fa sib la sol fa
    sol8 sol4 sol8\mbreak

    %92
    la16 sol fad mi la sol fad mi
    fad4 r8 sib
    la16 sib sib do do sib sib la

    %95
    la sib sib do do sib sib la
    la8[sib la la]
    sol4 r8 re'

    %98
    re16 do sib la re do sib la
    sib8 sib4 sib8\mbreak
    do16 sib la sol do sib la sol

    %101
    la8 la4 la8
    sib16 la sol fa sib la sol fa
    sol8 sol4 sol8

    %104
    la16 sol fa mi la sol fa mi
    fad8[sol sol fad]
    sol[sol sol fad]

    %107
    sol2

}

IIIobn = \relative do'' {

    sib'8
    la sol4 la8
    sib4 r8 re,
    mib[do sib la]

    %4
    sol4 r8 sol'(
    fad)[fa(mi) mib](
    re16) do sib la sol8 sib'(

    %7
    la8)[lab(sol) fad]
    sol16 fad sol la sol4
    R2

    %10
    sol16 fa mib re sol fa mib re
    mib8  mib4 mib8
    fa16 mib re do fa mib re do

    %13
    re8 re4 re8\mbreak
    mi16 re dod si mi re dod si
    dod8 dod4 dod8

    %16
    re fa4 re8
    re fa4 re8
    dod[re re dod]

    %19
    re4 r8 \slurDashed re
    (dod)[do (si) sib](
    <<
        {\stemDown la16) sol fa mi re8 fa'(}
        \new CueVoice {\stemUp la,8 sib16 dod re8 fa}
    >> \stemNeutral

    %22
    mi8)[mib(re) dod]
    re16 dod re mi re8 fa\mbreak
    mi re4 fa8

    %25
    fa4 r8 la(
    sib)[sol(fa) mi]
    re4 r8 la'

    %28
    la16 sib la mi la sib la mi
    fa4. fa8
    sol16 la sol re sol la sol re

    %31
    mib4. mib8
    fa16 sol fa do fa sol fa do\mbreak
    re4. re8

    %34
    do16 re re mib mib re re do
    do re re mib mib re re do
    do8[re do do]

    %37
    sib4 r8 re
    (do)[la (sib) do]
    re4 r8 fa

    %40
    (sol)[sol (re) do]
    sib4 r8 sib'(\mbreak
    la)[la (sol) sol]

    %43
    (fa16) mib re do sib8 re(
    do)[do (sib) la]
    sib16 la sib do sib4

    %46
    R2
    fa'8[do la sol16 fa]
    sib4~sib16 do re mi

    %49
    fa8[do la sol16 fa]
    sib4 r8 re\mbreak
    mib16 sib mib sib mib re do sib

    %52
    do4. do8
    re16 la re la re la re la
    si4. si8

    %55
    do16 re re mib mib re re do
    do16 re re mib mib re re do
    do8[mib re re]

    %58
    do4 r8 do'(\mbreak %fine prima riga p. 11
    si)[sib(la) lab]
    (sol16) fa  mib re do8 mib

    %61
    (re)[reb(do) si]
    do16 si do re do8 mib
    re do4 re8

    %64
    mib4 r8 sol(
    lab)[fa(mib) re]
    do4 r8 mib\mbreak

    %67
    mib?[re re do]
    do[si si mib]
    mib?[re re do]

    %70
    do si si4
    r r8 mi!
    fa[fa fa mib]

    %73
    re4. re8
    mib[mib mib re]
    do4. do8\mbreak

    %76
    do[sib la la]
    sib4 r8 sib'
    la sol4 la8

    %79
    sib4 r8 sol(
    fad)[fa(mi) mib]
    (re16) do sib la sol8 re'

    %82
    (mib) [do(sib) la]
    sol4 r8 sib'(\mbreak
    la)[lab(sol) fad]

    %85
    sol16 fad sol la sol4
    r r8 fad
    sol16 fa! mib re sol fa mib re

    %88
    mib8 mib4 mib8
    fa16 mib? re do fa mib re do
    re8 re4 re8

    %91
    mib16 re do sib mib re do sib\mbreak
    do8 do4 do8
    la4 r8 sol'

    %94
    fad16 sol sol la la sol sol fad
    fad16 sol sol la la sol sol fad
    fad8[sol sol fad]

    %97
    sol4 r
    R2
    sol16 fa mib re sol fa mib re\mbreak

    %100
    mib?8 mib4 mib8
    fa16 mib re do fa mib re do
    re8 re4 re8

    %103
    mib16 re do sib mib re do sib
    do8 do4 do8
    do[sib la la]

    %106
    sib[sib la la]
    sol2

}

IIIfgn = \relative do {

    sol'8
    re'[si do fad,]
    sol [re sib sol]
    do[do re re,]

    %4
    sol4 r8 sol'
    re'[si do fad,]
    sol [re sib sol]

    %7
    do[do re re,]
    sol4 r8 sol'
    fad[fad fad fad]

    %10
    sol[sol sol sol]
    do,[do do do]
    fa[fa fa fa]

    %13
    sib,[sib sib sib]
    mi[mi mi mi]
    la,[la la la]

    %16
    re[re' re, re']
    re,[re' re, re']
    la[re, la' la,]

    %19
    re[mi fa re]
    la'[fad sol dod,]
    re[la fa re]

    %22
    sol[sol' la la,]
    re4 r8 re\mbreak
    sol[fad sol dod,]

    %25
    re[la fa re]
    sol[sol' la la,]
    re4 r8 re'

    %28
    dod[dod, dod dod']
    re[re, re re']
    sol,[sol, sol sol']

    %31
    do[do, do do']
    fa,[fa, fa fa']\mbreak
    sib[sib, sib sib']

    %34
    fa[fa, fa fa']
    fa[fa, fa fa']
    fa sib, fa' fa,

    %37
    sib[do re sib]
    fa'[fa mib la,]
    sib[do re sib]

    %40
    mib[mi fa fa,]
    sib4 r8 sib\mbreak
    fa'[fa mib la,]

    %43
    sib[do re sib]
    mib[mi fa fa,]
    sib4 r8 sib

    %46
    sib4 r8 sib
    la4 r8 fa'
    re sib r sib

    %49
    la4 r8 fa'
    re4 r8 sib\mbreak
    mib mib, r mib'

    %52
    lab lab, r lab'
    re, re, r re'
    sol sol, r sol'

    %55
    do, do, r do'
    do do, r do'
    do[do' sol sol,]

    %58
    do[re mib do]\mbreak
    sol'[mi fa si,]
    do[re mib do]

    %61
    fa,[fa' sol sol,]
    do4 r8 do
    sol'[mi fa si,]

    %64
    do[re mib do]
    fa,[fa' sol sol,]
    do4 r8 do\mbreak

    %67
    do[sol' sol do,]
    do[sol' sol do,]
    do[sol' sol do,]

    %70
    do[sol' sol fa]
    mi![mi mi do]
    fa[fa fa fa]

    %73
    sib,[sib sib sib]
    mib[mib mib mib]
    lab,[lab lab lab]\mbreak

    %76
    re[sol re' re,]
    sol[la sib sol]
    re'[si do fad,]

    %79
    sol[la sib sol]
    re'[si do fad,]
    sol[la sib sol]

    %82
    do,[do' re re,]
    sol4 r8 sol\mbreak
    do,[do' re re,]

    %85
    sol4 r8 sol
    fad[fad fad re]
    sol[sol sol sol]

    %88
    do,[do do do]
    fa[fa fa fa]
    sib,[sib sib sib]

    %91
    mib[mib mib mib]\mbreak
    la,[la la la]
    re[re' sib sol]

    %94
    re[re re re]
    re[re re re]
    re sol re' re,

    %97
    sol[la sib sol]
    fad[fad fad fad]
    sol[sol sol sol]\mbreak

    %100
    do,[do do do]
    fa[fa fa fa]
    sib,[sib sib sib]

    %103
    mib[mib mib mib]
    la,[la la la]
    re[sol, re' re,]

    %106
    sol sol' re re,
    sol2

}

forma = {

    \time 2/4
    \key re\minor
    \tempo 2 = 60
    \partial 8 s8
    s2*106
    s2\fermata
    \bar "|."

}


IIIfl = {
    \IIIglobal
    <<\IIIfln\forma>>
}

IIIob = {
    \IIIglobal
    <<\IIIobn\forma>>
}

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn\forma>>
}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #5
    print-first-page-number = ##t
    first-page-number = #2

}


\header {
    title = \markup \smaller{"Concerto per Flauto, Oboe e Fagotto [RV 103]"}
    composer = \markup \center-column{"A. Vivaldi (1678-1741)"}
}

\markup \huge "[1.] All[egr]o: ma cantabile"

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Flauto"}
            \set Staff.midiInstrument = #"recorder"
            \set Staff.shortInstrumentName = "fl"
            \Ifl
        >>
        \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Aubois"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \Iob
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup\center-column {"Fagotto"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \Ifg
        >>
    >>

    \layout {

        indent = 1.7\cm

        \context	{
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup \huge "[2.] Largo"

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Flauto"}
            \set Staff.midiInstrument = #"recorder"
            \set Staff.shortInstrumentName = "fl"
            \IIfl
        >>
        \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Aubois"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \IIob
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup\center-column {"Facotto"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \IIfg
        >>
    >>

    \layout {

        indent = 1.7\cm

        \context	{
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup \huge "[3.] All[egr]o non molto"

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Flauto"}
            \set Staff.midiInstrument = #"recorder"
            \set Staff.shortInstrumentName = "fl"
            \IIIfl
        >>
        \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Aubois"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \IIIob
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup\center-column {"Fagotto"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \IIIfg
        >>
    >>

    \layout {

        indent = 1.7\cm

        \context	{
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

