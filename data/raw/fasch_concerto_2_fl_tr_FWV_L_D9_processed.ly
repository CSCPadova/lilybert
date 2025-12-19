\language "italiano"
\version "2.24.0"

%********************************** VARIABILI

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

"|" = \bar "||"

piuf = _\markup \italic "più f"

demi = _\markup \italic "à demi jeu"

sciolto = _\markup \italic "sciolto"

presto = ^\markup \italic \large "Presto."

tr = \trill

aduec = _\markup \italic "à 2 Cordes"

ba = _\markup \italic "Basso"

fo = _\markup \italic "f"

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

rf = _\markup \italic "rf"

prinf = _\markup \italic "p rinf"

vite = ^\markup \large \center-align"Vite"

lent = ^\markup \large \center-align"Lent"

fortl = _\markup \italic "fort"

piano = _\markup \italic "piano"

dolce = _\markup \italic \center-align"doux"

dolcel = _\markup \italic "dolce"

forte = _\markup \italic "forte"

fss = _\markup \italic {fortiss\super mo}

sf = _\markup \italic \bold "sf"

rr = _\markup \italic \bold "r"

pp = _\markup \italic "più piano"

ilf = _\markup \italic \bold "il f"

il = _\markup \italic \bold "il"

mf = _\markup \italic "mf"

unis = ^\markup \italic\center-align "Unis"

pizz = _\markup \italic "pizzic"

for = _\markup \italic "for."

pofo = _\markup \italic "pf"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

flsolo = ^\markup \italic \column{"Flute""Solo"}

flu = ^\markup \italic \column{"Flu."}

tu = _\markup \italic "Tutti"

ts = ^\markup \italic \bold "T. S."

adue = ^\markup \italic "à 2"

pia = _\markup \italic "pia."

fi = _\markup \italic "Fine."

fin = ^\markup "Fin"

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.6

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

ds = _\markup \italic \right-align {"Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber.transparent = ##t

terzinecon = \override TupletNumber.transparent = ##f

volti = _\markup \italic \bold \column {"Volti"}

trillo = ^\markup \italic \bold "t."

seguesu = _\markup \italic \bold \column {"Segue""subito"}

trio = _\markup\italic"trio"

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

%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.15.7, 2.15.9, 2.15.10, 2.15.16, 2.15.17,
2.15.18, 2.15.19, 2.15.20, 2.15.25, 2.15.32, 2.15.39, 2.15.40,
2.15.42, 2.15.43, 2.16.0, 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11,
2.17.14, 2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27,
2.17.29, 2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }

Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    %\padall
    \override Staff.VerticalAxisGroup.minimum-Y-extent = #'(-1 . 1)
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IflIn = \relative do'' {

    re8
    la' la la fad16 sol
    la8 (si) fad\p sol
    la (si) fad\fo sol

    %4
    la (si) re,4\upl
    mi\upl dod\upl
    re16 re, mi fad sol la si dod

    %7
    re la si dod re mi fad sol
    la8 la la fad16 sol
    la8(si) fad\p sol

    %10
    la(si) fad\fo sol\mbreak
    la(si) re,4\upl
    sol\upl fad\upl

    %13
    mi\upl r
    r16 la sol fad mi re dod si
    dod8 mi la4\upl

    %16
    sol\upl fad\upl
    mi\upl r
    r16 la sol fad mi re dod si

    %19
    dod8 la re'4\upl
    sol,\upl fad\upl\mbreak
    mi4. fad16(re)

    %22
    mi4. fad16(re)
    mi8 la mi fad
    sol mi fad re

    %25
    mi4. fad16(re)
    mi4. fad16(re)
    mi8 la mi fad

    %28
    sol mi fad re
    mi la, r4
    la'8 do,4 si8

    %31
    la[sol fad mi]\mbreak
    re la''4 sol8
    fad [mi re do]

    %34
    si4\upl mi\upl
    re\upl do\upl
    si\upl r

    %37
    si'8 re,4 dod!8
    si[la sold fad]
    mi si''4 la8

    %40
    sold [fad mi re]
    dod4\upl fad\upl
    mi\upl re\upl

    %43
    dod\upl r8 la\mbreak
    mi'8.-+ re32 dod fad8.-+ mi32 re
    mi8 sol4 fad16 mi
    fad8.-+ mi32 re sol8.-+ fad32 mi

    %47
    fad8 la4 sol16 fad
    sol8.-+ fad32 mi la8.-+ sol32 fad
    sol8 si4 la16 sol

    %50
    fad8 la4 sol16 fad
    mi8 la, r16 dod si la
    re4\upl la'\upl

    %53
    r8 si,16\p sol' fad8 dod16 mi\mbreak
    re4\upl la'\upl
    r8 si,16\fo sol' fad8 dod16 mi

    %56
    re8[mi fad sol]
    la4\upl si\upl
    la,8.-+ sold32 la si8.-+ la32 si

    %59
    dod8.-+ si32 dod re8.-+ dod32 re
    mi8 la, sol'4
    fad32(mi re8.) mi4-+

    %62
    re4 r
    re fad
    la re\mbreak

    %65
    re,16 mi fad sol la8 re
    re,[re re re]
    re4 r

    %68
    R2
    re16 mi fad sol la8 re
    si re16 si sol8.-+ fad32 sol

    %71
    la8 re16 la fad8.-+ mi32 fad
    sol8 si16 sol mi8.-+ re32 mi
    fad8 mi r4

    %74
    R2\mbreak
    la4. sol16 fad
    mi8 re16 dod re8 mi

    %77
    dod mi r4
    R2
    la4. sol16 fad

    %80
    mi8 re16 dod re8 mi
    la,16 dod si la si re dod si
    dod mi re dod re fad  mi re

    %83
    mi sol fad mi fad la sol fad
    sol4. la16(fad)\mbreak
    sol4. la16(fad)

    %86
    sol4 r
    R2
    sol4. la16(fad)

    %89
    sol4. la16(fad)
    sol4 r
    R2*2

    %93
    la8 do,4 si8
    la[sol fad mi]
    re la''4 sol8
    fad[mi re do]

    %97
    si16 re do si sol'8 r
    do,16 mi re do sol'8 r
    re16 fa mi re sol8 r

    %100
    mi sol16 mi do8.-+ si32 do
    re8 sol16 re si8.-+ la32 si
    do8 mi16 do la8.-+ sol32 la\mbreak

    %103
    si16 re, mi fad sol la si do
    re sol, la si do re mi fad
    sol si, do re mi fad sol la

    %106
    si8 re,4 dod8
    si[la sold fad]
    mi si''4 la8

    %109
    sold[fad mi re]
    dod16 mi re dod la'8 r
    re,16 fad mi re la'8 r\mbreak

    %112
    mi16 sol fad mi la8 r
    fad la16 fad re8.-+ dod32 re
    mi8 la16 mi dod8.-+ si32 dod

    %115
    re8 fad16 re si8.-+ la32 si
    dod4 r
    R2

    %118
    dod16 mi re mi la,4-+
    re16 fad mi fad la,4-+\mbreak
    mi'16 sol fad sol la,4-+

    %121
    fad'16 la sol la la,4-+
    mi'16 sol fad sol la,4-+
    re16 fad mi fad sold,4-+

    %124
    dod8 la32(si dod re) mi8 dod32(re mi fad)
    sol8 r r4
    sol16 si mi, sol dod, mi la, sol'

    %127
    fad8 r r4
    mi16 sol dod, mi la, dod mi, mi'\mbreak
    re8 r r4

    %130
    la'8.-+ sold32 la si8 sold
    la4 r
    la8.-+ sold32 la si8 sold

    %133
    la4 r
    mi16 la, si dod re mi fad sol
    la8 la la fad16 sol

    %136
    la8 (si) fad\p sol
    la(si) fad\fo sol\mbreak
    la(si) r4

    %139
    R2
    re,16 re, mi fad sol la si dod
    re la si dod re mi fad sol

    %142
    la8 la la fad16 sol
    la8(si) fad\p sol
    la(si) fad\fo sol

    %145
    la(si) r4
    R2\mbreak
    si,16 re do si sol'8 fa

    %148
    mi[re do si]
    do?4 r
    R2

    %151
    re16 fad mi re si'8 la
    sol[fad mi re]
    mi4 r

    %154
    R2
    fad16 la, sol la re, do' si la
    fad'8 la,\parenthesize r4

    %157
    sol'16 si, la si re, re' do si
    sol'8 si, r4
    la'16 do, si do re, mi' re do

    %160
    la'8 do, r4
    si'16 re, sol re si re sol si
    la do, fad do la do fad la

    %163
    sol dod,! mi dod la dod mi sol
    fad sol fad mi re do si la\mbreak
    si sol' fad mi re do si la

    %166
    sol4 r
    R2*2
    r4 sol\upl

    %170
    la\upl  fad\upl
    sol\upl r
    R2*4

    %176
    r4 sol\upl
    do\upl si\upl
    la8 la si dod!

    %179
    re4. mi16 dod
    re4. la'16 dod,
    re4. mi16 dod

    %182
    re4. la'16 dod,
    re8 do16 si do8 si16 la
    si4 r\mbreak

    %185
    R2*5
    dod16 mi re dod la'8 sol

    %191
    fad[mi re dod]
    re4 r
    R2\mbreak

    %194
    mi16 sol fad mi la8 sol
    fad[mi re dod]
    fad si re,8.-+ dod32 re

    %197
    mi8 la dod,8.-+ si32 dod
    re8 sol si,8.-+ la32 si
    dod8 la r4

    %200
    r16 mi' sol si sol si sol mi
    fad4 r\mbreak
    r16 la, dod mi dod sol' mi dod

    %203
    re4 r
    dod16 la re si mi dod fad re
    sol mi la fad sol mi fad re

    %206
    mi8 la, r4
    R2
    r8 la'[mi fad]

    %209
    sol mi fad re\mbreak
    mi4 r
    R2

    %212
    r8 la[mi fad]
    sol[mi fad re]
    mi la, r4

    %215
    la'8 do,4 si8
    la[sol fad mi]
    re4 r

    %218
    R2*3
    r8 mi'[re do]
    si mi re\p do

    %223
    si4 r
    si'8\fo re,4 dod!8
    si la sold fad

    %226
    mi4 r
    R2*3\mbreak
    r8 fad'[mi re]

    %231
    dod [fad mi\p re]
    dod4 r8 la\fo
    mi'8.-+ re32 dod fad8.-+ mi32 re

    %234
    mi8 sol4 fad16 mi
    fad8.-+ mi32 re sol8.-+ fad32 mi
    fad8 la4 sol16 fad

    %237
    sol8.-+ fad32 mi la8.-+ sol32 fad
    sol8 si4 la16 sol
    fad8 la4 sol16 fad

    %240
    mi8 la, si dod
    re mi fa4
    mi r

    %243
    R2
    r8 sol16 sib dod,!8 mi16 sol
    la,4 r

    %246
    r r16 dod si la
    re4\upl la'\upl
    r8 si,16\p sol' fad8 dod16 mi
    re4\upl la'\upl\mbreak
    r8 si,16\fo sol' fad8 dod16 mi


    %251
    re8[mi fad\solo sol]
    la4 si
    dod,8.-+ si32 dod re8 mi\tu

    %254
    fad sol la si
    la,8.-+ sold32 la si8.-+ la32 si
    dod8.-+ si32 dod re8.-+ dod32 re

    %257
    mi8 la, sol'4
    fad32(mi re8.) mi4-+
    re2

}


IflIIn = \relative do'' {

    re8
    fad fad fad re16 mi
    fad8(sol) re\p mi
    fad(sol) re\fo mi

    %4
    fad(sol) re4\upl
    mi\upl dod\upl
    re\upl r

    %7
    r16 fad, sol la si dod  re mi
    fad8 fad fad re16 mi
    fad8(sol) re\p mi

    %10
    fad(sol) re\fo mi\mbreak
    fad(sol) re4\upl
    mi\upl re\upl

    %13
    dod16 la' sol fad mi re dod si
    dod fad mi re dod si la sold
    la8 dod re4\upl

    %16
    mi\upl re\upl
    dod16 la' sol fad mi re dod si
    dod fad mi re dod si la sold

    %19
    la8 dod re4\upl
    mi\upl re\upl\mbreak
    dod4. re16(si)

    %22
    dod4. re16(si)
    dod8 re dod re
    mi dod re si

    %25
    dod4. re16(si)
    dod4. re16(si)
    dod8 re dod re

    %28
    mi dod re si
    dod la r4
    la'8 do,4 si8

    %31
    la[sol fad mi]
    re la''4 sol8
    fad [mi re do]

    %34
    si4\upl do\upl
    si\upl la\upl
    sol\upl r

    %37
    si'8 re,4 dod!8
    si[la sold fad]
    mi si''4 la8

    %40
    sold [fad mi re]
    dod4\upl re\upl
    dod\upl si\upl

    %43
    la\upl r8 la\mbreak
    dod8.-+ si32 la re8.-+ dod32 si
    dod8 mi4 re16 dod
    re8.-+ dod32 si mi8.-+ re32 dod

    %47
    re8 fad4 mi16 re
    mi8.-+ re32 dod fad8.-+ mi32 re
    mi8 sol4 fad 16 mi

    %50
    re8 fad4 mi16 re
    dod8 la r16 dod si la
    re4\upl la'\upl

    %53
    r8 si,16\p sol' fad8 dod16 mi\mbreak
    re4\upl la'\upl
    r8 si,16\fo sol' fad8 dod16 mi

    %56
    re8[mi fad sol]
    la4\upl si\upl
    la,8.-+ sold32 la si8.-+ la32 si

    %59
    dod8.-+ si32 dod re8.-+ dod32 re
    mi8 la, sol'4
    fad32(mi re8.) mi4-+

    %62
    re r
    R2*4
    re16 mi fad sol la8 re

    %68
    re,8[re re re]
    re4 r
    r si'8 re16 si

    %71
    la8 r la re16 la
    sol8 r sol dod16 sol
    re'8 dod r4

    %74
    R2\mbreak
    fad,4. mi16 re
    dod8 si16 la si8 sold

    %77
    la dod r4
    R2
    fad4. mi16 re

    %80
    dod8 si16 la si8 sold
    la4 r
    la16 dod si la si re dod si

    %83
    dod mi re dod re fad mi re
    mi4. fad16(re)\mbreak
    mi4. fad16(re)

    %86
    mi4 r
    R2
    mi4. fad16(re)

    %89
    mi4. fad16(re)
    mi4 r
    R2*2

    %93
    la8 do,4 si8
    la[sol fad mi]
    re la''4 sol8

    %96
    fad[mi re do]
    si r si16 re do si
    sol'8 r do,!16 mi re do

    %99
    sol'8 r re16 fa mi re
    mi8 r mi sol16 mi
    re8 r re sol16 re

    %102
    do8 r do la'16 do,\mbreak
    si re, mi fad sol la si do
    re sol, la si do re mi fad

    %105
    sol si, do re mi fad sol la
    si8 re,4 dod!8
    si[la sold fad]

    %108
    mi si''4 la8
    sold[fad mi re]
    dod8 r dod16 mi re dod

    %111
    la'8 r re,16 fad mi re\mbreak
    la'8 r mi16 sol fad mi
    fad8 r fad la16 fad

    %114
    mi8 r mi la16 mi
    re8 r re la'16 re,
    dod4 r

    %117
    R2
    r4 dod32(mi re dod la'8)
    r4 re,32(fad mi re la'8)\mbreak

    %120
    r4 mi32(sol fad mi la8)
    r4 re,32(fad mi re la'8)
    r4 dod,32(mi re dod la'8)

    %123
    r4 si,32(re dod si sold'8)
    la, r r4
    dod8 la32(si dod re) mi8 dod32(re mi fad)

    %126
    sol8 r r4
    fad16 la re, fad la, re fad, fad'
    mi8 r r4\mbreak

    %129
    re16 fad si, re sold, si mi, mi'
    dod8.-+ si32 dod re8 si
    dod4 r

    %132
    dod8.-+ si32 dod re8 si
    dod4 r
    dod8. la16 si dod re mi

    %135
    fad8 fad fad re16 mi
    fad8(sol)  re\p mi
    fad(sol) re\fo mi\mbreak

    %138
    fad sol r4
    R2*2

    %141
    re16 fad, sol la si dod re mi
    fad8 fad fad re16 mi
    fad8(sol) re\p mi

    %144
    fad(sol) re\fo mi
    fad(sol) r4
    R2*3

    %149
    do,16 mi re do la'8 sol
    fad[mi re do]
    re4 r

    %152
    R2
    mi16 sol fad mi do'8 si
    la[sol fad mi]

    %155
    fad4 r
    re,16 do' fad do la do fad do\mbreak
    sol'8 si, r4

    %158
    re,16 re' sol re si re sol re
    la'8 do, r4
    re,16 do' mi do fad la fad re

    %161
    sol8 si, r16 re si sol
    fad'8 la, r16 do la fad
    mi'8 sol, r16 mi' dod! la

    %164
    fad' sol fad mi re do si la\mbreak
    si sol' fad mi re do si la
    sol4 r

    %167
    R2*2
    r4 sol\upl

    %170
    la\upl fad\upl
    sol\upl r
    R2*4

    %176
    r4 sol\upl
    la\upl sol\upl
    fad\upl r

    %179
    R2*5
    r8 si[dod! red]\mbreak
    mi4. fad16 red

    %186
    mi4. si'16 red,
    mi4. fad16 red
    mi4. si'16 red,

    %189
    mi8 re!16 dod re8 dod16 si
    dod4 r
    R2

    %192
    re16 fad mi re la'8 sol
    fad mi re8.-+ dod!32 re\mbreak
    mi4 r

    %195
    R2
    r4 sol,16 si re sol
    mi8 r fad,16 la dod fad

    %198
    re8 r mi,16 sol si mi
    dod mi dod la mi la dod mi
    dod4 r

    %201
    r16 la re fad re la' fad re\mbreak
    mi4 r
    r16 sold, si re si fad' re si

    %204
    dod8 si dod re
    mi fad mi re
    dod la r4

    %207
    R2
    r8 la[dod re]
    mi dod re si\mbreak

    %210
    dod4 r
    R2
    r8 la[dod re]

    %213
    mi[dod re si]
    dod la r4
    R2*2
    r8 la'4 sol8

    %218
    fad [mi re do]
    si4 r\mbreak
    R2

    %221
    r8 do[si la]
    sol do si\p la
    sol4 r

    %224
    R2*2
    r8 si'4\fo la8
    sold[fad mi re]

    %228
    dod4 r
    R2\mbreak
    r8 re[dod si]

    %231
    la[re dod\p si]
    la4 r8 la\fo
    dod8.-+ si32 la re8.-+ dod32 si

    %234
    dod8 mi4 re16 dod
    re8.-+ dod32 si mi8.-+ re32 dod
    re8 fad4 mi16 re

    %237
    mi8.-+ re32 dod fad8.-+ mi32 re
    mi8 sol4 fad16 mi
    re8 fad4 mi16 re\mbreak

    %240
    dod4 r
    R2
    r8 la[si dod]

    %243
    re mi fa4
    mi r
    r8 sol16 sib dod,!8 mi16 sol

    %246
    la,4 r16 dod si la
    re4\upl la'\upl
    r8 si,16\p sol' fad8 dod16 mi

    %249
    re4\upl la'\upl\mbreak
    r8 si,16\fo sol' fad8 dod16 mi
    re4 r

    %252
    R2
    r4 r8 mi\tu
    fad sol la si

    %255
    la,8.-+ sold32 la si8.-+ la32 si
    dod8.-+ si32 dod re8.-+ dod32 re
    mi8 la, sol'4

    %258
    fad32(mi re8.) mi4-+
    re2

}

IvlIn = \relative do'' {

    r8
    R2*3

    %4
    r4 re\upl
    mi\upl dod\upl
    re\upl r

    %7
    R2*4\mbreak
    r4 re\upl
    sol\upl fad\upl

    %13
    mi\upl r
    R2
    r4 la\upl

    %16
    sol\upl fad\upl
    mi\upl r
    R2

    %19
    r4 re'\upl
    sol,\upl fad\upl\mbreak
    mi4. fad16(re)

    %22
    mi4. fad16(re)
    mi8 fad,16\p sol la8 la
    la[la la la]

    %25
    mi'4.\fo fad16(re)
    mi4. fad16(re)
    mi8 fad,16\p sol la8 la

    %28
    la[la la la]
    la la, r4
    la''8\fo do,4 si8

    %31
    la[sol fad mi]\mbreak
    re la''4 sol8
    fad mi re do

    %34
    si4 r
    R2*2
    si'8 re,4 dod!8

    %38
    si[la sold fad]
    mi si''4 la8
    sold[fad mi re]

    %41
    dod4 r
    R2
    r4 r8 la\mbreak

    %44
    mi'8.-+ re32 dod fad8.-+ mi32 re
    mi8 sol4 fad16 mi
    fad8.-+ mi32 re sol8.-+ fad32 mi

    %47
    fad8 la4 sol16 fad
    sol8.-+ fad32 mi la8.-+ sol32 fad
    sol8 si4 la16 sol

    %50
    fad8 la4 sol16 fad
    mi8 la, r16 dod si la
    re4\upl la'\upl

    %53
    r8 si,16\p sol' fad8 dod16 mi\mbreak
    re4\upl la'\upl
    r8 si,16\fo sol' fad8 dod16 mi

    %56
    re8[mi fad sol]
    la4\upl si\upl
    la,8.-+ sold32 la si8.-+ la32 si

    %59
    dod8.-+ si32 dod re8.-+ dod32 re
    mi8 la, sol'4
    fad32(mi re8.) mi4-+

    %62
    <<
        {
            \stemDown re2~
            re~
            re\mbreak
        }\\{s4 s\p}
    >>

    %65
    re8[re re re]
    re8[re re re]
    re8[re re re]

    %68
    re8[re re re]
    re4 r
    R2*3

    %71
    r4 sol\upl\fo
    fad\upl mi\upl\mbreak
    R2*2

    %77
    r4 sol\upl
    fad\upl mi\upl
    R2*5

    %84
    dod4\p r
    dod r
    dod8 la'\fo dod, re

    %87
    mi dod fad re
    mi4\p r
    dod r

    %90
    dod8 la'\fo dod,re
    mi dod fad re
    mi la, r4

    %93
    la'8 do,4 si8
    la sol fad mi\mbreak
    re la''4 sol8

    %96
    fad [mi re do]
    si[r si\p] r
    do[r do] r

    %99
    re[r re] r
    mi r r4
    R2*2\mbreak

    %103
    si16 re, mi fad sol la si do
    re sol, la si do re mi fad
    sol si, do re mi fad sol la

    %106
    si8 re,4 dod!8
    si[la sold fad]
    mi si''4 la8

    %109
    sold[fad mi re]
    dod[r dod\p] r
    re[r re] r\mbreak

    %112
    mi[r mi] r
    fad r r4
    R2*2

    %116
    dod16\fo mi, fad sold la si dod re
    mi la, si dod re mi fad sold
    la8[la\p la la]

    %119
    la[la la la]\mbreak
    la[la la la]
    la[la la la]
    la[la la la]

    %123
    sold[sold sold sold]
    la2~
    la~

    %126
    la8[dod, dod dod]
    r re[re re]
    r dod[dod dod]\mbreak

    %129
    r si[si si]
    dod4 r
    mi8\forte\upl fad\upl sol!\upl fad\upl
    mi4 r
    mi8\upl[fad\upl sol\upl fad\upl]

    %134
    mi4 r
    R2*3\mbreak
    r4 re\upl

    %139
    mi\upl dod\upl
    re\upl r
    R2*4

    %145
    r4 re\upl
    do\upl la\upl\mbreak
    si\upl r

    %148
    r8 si\p[si si]
    do4 r
    r8 do?[do do]

    %151
    re4 r
    r8 re[re re]
    mi4 r

    %154
    r8 mi[ mi mi]
    fad2~
    fad8[fad fad fad]\mbreak

    %157
    sol2~
    sol8[sol sol sol]
    la2~

    %160
    la8[la la la]
    r sol[sol sol]
    r fad[fad fad]

    %163
    r mi[mi mi]
    fad4 r\mbreak
    r r8 sol,\fo

    %166
    re' re re si16 do
    re8(mi) si\p do
    re(mi) si\fo do

    %169
    re(mi) sol,4\upl
    la\upl fad\upl
    sol16 sol, la si do re mi fad

    %172
    sol re mi fad sol la si do
    re8 re re si16 do\mbreak
    re8(mi) si\p do

    %175
    re(mi) si\fo do
    re(mi) sol,4\upl
    do\upl si\upl

    %178
    la\upl r
    r8 fad16\p sol la8 si
    la[si la sol]

    %181
    la fad16 sol la8 si
    la si la sol
    la4 r

    %184
    R2\mbreak
    r8 sold16 la si8 dod
    si dod si la

    %187
    si sold16 la si8 dod
    si dod si la
    si4 r

    %190
    R2*9
    la'2~\p
    la~

    %201
    la~\mbreak
    la
    sold

    %204
    la8 [ la,, la la]
    la[la la la]
    mi''4.\fo fad16(re)

    %207
    mi4. fad16(re)
    mi8 fad,16\p sol la8 la
    la[la la la]\mbreak

    %210
    mi'4.\fo fad16(re)
    mi4. fad16(re)
    mi8 fad,16\p sol la8 la

    %213
    la[la la la]
    la la, r sol'
    re'\p[re re re]

    %216
    re[re re re]
    re[re re re]
    re[re re re]

    %219
    re4\upl mi\upl\fo\mbreak
    re\upl do\upl
    si\upl r

    %222
    R2*2
    mi8\p[mi mi mi]
    mi[mi mi mi]

    %226
    mi[mi mi mi]
    mi[mi mi mi]
    mi4 fad\upl\fo

    %229
    mi\upl re\upl\mbreak
    dod4 r
    R2

    %232
    r4 r8 la\fo
    mi'8.-+ re32 dod fad8.-+ mi32 re
    mi8 sol4 fad16 mi

    %235
    fad8.-+ mi32 re sol8.-+ fad32 mi
    fad8 la4 sol16 fad
    sol8.-+ fad32 mi la8.-+ sol32 fad

    %238
    sol8 si4 la16 sol
    fad8 la4 sol16 fad\mbreak
    mi4 r

    %241
    R2
    r4 r8 sol,\p
    fa mi re sold

    %244
    la4 r
    r8 la[la la]
    la4 r16 dod si la

    %247
    re4\upl la'\upl
    r8 si,16\p sol' fad8 dod16 mi
    re4\upl la'\upl\mbreak
    r8 si,16\fo sol' fad8 dod16 mi

    %251
    re4 r
    R2
    r4 r8 mi

    %254
    fad sol la si
    la,8.-+ sold32 la si8.-+ la32 si
    dod8.-+ si32 dod re8.-+ dod32 re

    %257
    mi8 la, sol'4
    fad32(mi re8.) mi4-+
    re2

}


IvlIIn = \relative do'' {

    r8
    R2*3

    %4
    r4 re\upl
    si\upl la\upl
    la\upl r

    %7
    R2*4\mbreak
    r4 re\upl
    mi\upl re\upl

    %13
    dod\upl r
    R2
    r4 re\upl

    %16
    mi\upl re\upl
    dod\upl r
    R2

    %19
    r4 re\upl
    mi\upl re\upl\mbreak
    dod4. re16(si)

    %22
    dod4. re16(si)
    dod8 fad,16\p sol la8 la
    la[la la la]

    %25
    dod4. re16(si)
    dod4. re16(si)
    dod8 fad,16\p sol la8 la

    %28
    la[la la la]
    la la, r4
    la''8\fo do,4 si8

    %31
    la[sol fad mi]\mbreak
    re la' la la
    la[la la la]

    %34
    si4 r
    R2*2
    si'8 re,4 dod!8

    %38
    si[la sold fad]
    mi[si' si si]
    si[si si si]

    %41
    dod4 r
    R2
    r4 r8 la\mbreak

    %44
    dod8.-+ si32 la re8.-+ dod32 si
    dod8 mi4 re16 dod
    re8.-+ dod32 si mi8.-+ re32 dod

    %47
    re8 fad4 mi16 re
    mi8.-+ re32 dod fad8.-+ mi32 re
    mi8 sol4 fad 16 mi

    %50
    re8 fad4 mi16 re
    dod8 la r la
    la4\upl fad'\upl

    %53
    r8 si,\p[la la]\mbreak
    la4\upl fad'\upl
    r8 si,\fo[la la]

    %56
    la sol la dod
    la4\upl sol\upl
    la si

    %59
    la sold
    la4 r16 dod re mi
    re8 re dod4

    %62
    <<
        {
            la2~
            la~
            la
        }\\{s4 s\p}
    >>

    %65
    la8[la la si]
    do[la si sol]
    la[la la si]

    %68
    do[la si sol]
    la4 r
    R2*3
    r4 mi'\upl\fo

    %74
    re\upl dod\upl\mbreak
    R2*2

    %77
    r4 mi\upl
    re\upl dod\upl
    R2*5

    %84
    la,8\p[la' la la]\mbreak
    la,8[la' la la]
    la, re'\fo la si

    %87
    dod la re si
    dod [la\p la la]
    la,[la' la la]
    la, re'\fo la si

    %91
    dod la re si
    dod la r4
    la'8 do,4 si8

    %94
    la sol fad mi\mbreak
    re[la' la la]
    la[la la la]

    %97
    sol[r sol\p] r
    sol[r sol] r
    sol[r re'] r
    do r r4

    %101
    R2*2\mbreak
    si16 re, mi fad sol la si do
    re sol, la si do re mi fad

    %105
    sol si, do re mi fad sol la
    si8 re,4 dod!8
    si[la sold fad]

    %108
    mi8[si' si si]
    si[si si si]
    la[r la\p] r

    %111
    la[r la] r
    la[r mi'] r
    re r r4

    %114
    R2*2
    dod16\fo mi, fad sold la si dod re
    mi la, si dod re mi fad sold

    %118
    mi8[mi\p mi mi]
    fad[fad fad fad]\mbreak
    sol[sol sol sol]

    %121
    fad[fad fad fad]
    mi[mi mi mi]
    re[re re re]

    %124
    dod2~
    dod~
    dod8[la la la]

    %127
    r la[la la]
    r la[la la]\mbreak
    r sold[sold sold]

    %130
    la4 r
    dod8\fo re mi re
    dod4 r

    %133
    dod8[re mi re]
    dod4 r
    R2*3\mbreak

    %138
    r4 re\upl\fo
    si\upl la\upl
    la\upl r

    %141
    R2*4
    r4 la\upl
    sol\upl la\upl\mbreak

    %147
    sol\upl r
    r8 mi\p[mi mi]
    mi4 r

    %150
    r8 fad[fad fad]
    re4 r
    r8 sol[sol sol]

    %153
    sol4 r
    r8 la[la la]
    la2~

    %156
    la8[la la la]\mbreak
    si2~
    si8[si si si]

    %159
    do2~
    do8[do do do]
    r si[si si]

    %162
    r la[la la]
    r dod![dod dod]
    re4 r\mbreak

    %165
    r r8 sol,\fo
    si si si sol16 la
    si8(do) sol\p la

    %168
    si(do) sol\fo la
    si(do) sol4\upl
    mi\upl re\upl

    %171
    re\upl r
    sol16 si, do re mi fad sol la
    si8 si si sol16 la\mbreak

    %174
    si8(do) sol\p la
    si(do) sol\fo la
    si(do) sol4\upl

    %177
    la\upl sol\upl
    fad\upl r
    r8 re16\p mi fad8 sol

    %180
    fad[sol fad mi]
    fad re16 mi fad8 sol
    fad sol fad mi

    %183
    fad4 r
    R2\mbreak
    r8 mi16 fad sold8 la

    %186
    sold? la sold fad
    sold? mi16 fad sold8 la
    sold? la sold fad

    %189
    sold?4 r
    R2*9
    mi'2\p~

    %200
    mi
    fad\mbreak
    mi

    %203
    re
    dod8 [ la, la la]
    la[la la la]

    %206
    dod'4.\fo re16(si)
    dod4. re16(si)
    dod8 fad,16\p sol la8 la

    %209
    la[la la la]\mbreak
    dod4.\fo re16(si)
    dod4. re16(si)

    %212
    dod8 fad,16\p sol la8 la
    la[la la la]
    la la, r sol'

    %215
    fad[fad fad fad]
    fad[fad fad fad]
    fad[fad fad fad]

    %218
    fad[fad fad fad]
    sol4\upl do\upl\fo\mbreak
    si\upl la\upl

    %221
    sol\upl r
    R2*2
    sold8\p[sold sold sold]

    %225
    sold?[sold sold sold]
    sold?[sold sold sold]
    sold?[sold sold sold]

    %228
    la4 re\upl\fo
    dod\upl si\upl\mbreak
    la r

    %231
    R2
    r4 r8 la\fo
    dod8.-+ si32 la re8.-+ dod32 si

    %234
    dod8 mi4 re16 dod
    re8. dod32 si mi8.-+ re32 dod
    re8 fad4 mi16 re

    %237
    mi8.-+ re32 dod fad8.-+ mi32 re
    mi8 sol4 fad16 mi
    re8 fad4 mi16 re\mbreak

    %240
    dod4 r
    R2
    r4 r8 sol\p

    %243
    fa mi re sold
    la4 r
    r8 la[la la]

    %246
    la4 r8 la\fo
    la4\upl fad'\upl
    r8 si,\p[la la]

    %249
    la4\upl fad'\upl\mbreak
    r8 si,\fo[la la]
    la4 r

    %252
    R2
    r4 r8 sol
    la dod la sol

    %255
    la4 si
    la sold
    la r16 dod re mi

    %258
    re4 dod
    la2

}


Ivlan = \relative do' {

    r8
    R2*3

    %4
    r4 fad\upl
    sol\upl mi\upl
    fad\upl r

    %7
    R2*4\mbreak
    r4 la\upl
    la\upl la\upl

    %13
    la\upl r
    R2
    r4 la\upl

    %16
    la\upl la\upl
    la\upl r
    R2

    %19
    r4 la\upl
    la\upl la\upl\mbreak
    la8[la la la]

    %22
    la[la la la]
    la4 r
    R2

    %25
    la8[la la la]
    la[la la la]
    la4 r

    %28
    la8[la la la]
    la la, r4
    la'8\fo do,4 si8

    %31
    la[sol fad mi]\mbreak
    re'[re re re]
    re[re re re]

    %34
    re4 r
    R2*2
    mi8[mi mi mi]

    %38
    mi8[mi mi mi]
    mi8[mi mi mi]
    mi8[mi mi mi]

    %41
    mi4 r
    R2
    r4 r8 dod\mbreak

    %44
    la'[la la la]
    la dod4 la8
    la[la la la]

    %47
    la re4 la8
    dod dod la re
    dod dod4 re16 dod

    %50
    re8 re4 dod16 re
    la8 dod, r16 mi re dod
    re4\upl re'\upl

    %53
    r8 sol,\p re mi16 dod\mbreak
    re4\upl re'\upl
    r8 sol,\fo re mi16 dod

    %56
    re8 dod re sol
    re4\upl re\upl
    mi mi

    %59
    mi re
    la' r8 la
    la la la4

    %62
    <<
        {
            \stemDown fad2~
            fad2~
            fad
        }\\{s4 s\p}
    >>\mbreak

    %65
    fad8[fad fad sol]
    la[fad sol mi]
    fad8[fad fad sol]

    %68
    la[fad sol mi]
    fad4 r
    R2*3
    r4 la\upl\fo

    %74
    la\upl la\upl\mbreak
    R2*2

    %77
    r4 la4\upl
    la\upl la\upl
    R2*5

    %84
    la,8\p[la' la la]\mbreak
    la,[la' la la]
    la, la'\fo mi mi

    %87
    la la la la
    la,[la'\p la la]
    la,[la' la la]

    %90
    la, la'\fo mi mi
    la la la la
    la dod, r4

    %93
    re8[re re re]
    re[re re re]\mbreak
    re8[re re re]

    %96
    re[re re re]
    re[r re\p] r
    do[r do] r

    %99
    sol'[r sol] r
    sol r r4
    R2*5

    %106
    mi8\forte[mi mi mi]
    mi[mi mi mi]
    mi[mi mi mi]

    %109
    mi[mi mi mi]
    mi[r mi\p] r
    re[r fad] r\mbreak

    %112
    la[r la] r
    la r r4
    R2*4

    %118
    dod8[dod\p dod dod]
    re[re re re]\mbreak
    mi[mi mi mi]

    %121
    re[re re re ]
    dod[dod dod dod]
    si[si si si]

    %124
    mi,2~
    mi~
    mi8[mi mi mi]

    %127
    r fad[fad fad]
    r mi[mi mi]\mbreak
    r re[re re]

    %130
    mi4 r
    la8\fo[la la la]
    la4 r

    %133
    la8[la la la]
    la4 r
    R2*3\mbreak

    %138
    r4 fad\fo\upl
    sol\upl mi\upl
    fad\upl r

    %141
    R2*4
    r4 fad\upl
    mi\upl re\upl\mbreak

    %147
    re\upl r
    r8 sol,\p[sol sol]
    la4 r

    %150
    r8 la[la la]
    si4 r
    r8 si[si si]

    %153
    do4 r
    r8 do?[do do]
    re2~

    %156
    re8[re re re]\mbreak
    re2~
    re8[re re re]

    %159
    re2~
    re8[re re re]
    r re[re re]

    %162
    r re[re re]
    r sol[sol sol]
    la4 r\mbreak

    %165
    R2*4
    r4 si,\upl\fo
    do\upl la\upl

    %171
    si\upl r
    R2*4
    r4 re\upl

    %177
    re\upl re\upl
    re\upl r
    R2*20
    dod'2\p~

    %200
    dod
    re\mbreak
    dod

    %203
    si
    mi,4 r
    R2

    %206
    la8\fo[la la la]
    la[la la la]
    la4 r

    %209
    R2\mbreak
    la8[la la la]
    la[la la la]

    %212
    la4 r
    R2
    r8 la4\p sol8

    %215
    fad[fad fad fad]
    fad[fad fad fad]
    fad[fad fad fad]

    %218
    fad[fad fad fad]
    sol4 sol\upl\fo\mbreak
    sol\upl fad\upl

    %221
    re\upl r
    R2
    r8 sol\p [si re]

    %224
    sold,\p[sold sold sold]
    sold?[sold sold sold]
    sold?[sold sold sold]

    %227
    sold?[sold sold sold]
    la4 la\upl\fo
    la\upl sold\upl\mbreak

    %230
    mi r
    R2
    r4 r8 dod\fo

    %233
    la'[la la la]
    la dod4 la8
    la la dod la

    %236
    la re4 dod16 re
    dod8 dod la re
    dod dod4 re16 dod

    %239
    re8 re4 dod16 re
    la4 r
    R2*5

    %246
    r4 r16 mi re dod
    re4\upl re'\upl
    r8 sol,\p re mi16 dod

    %249
    re4\upl re'\upl\mbreak
    r8 sol, re mi16 dod
    re4 r

    %252
    R2
    r4 r8 dod\fo
    re sol re re

    %255
    mi4 mi
    mi re
    la' r8 la

    %258
    la4 la
    fad2

}

Ibcn = \relative do {

    r8
    R2*3

    %4
    r4 si'\upl
    sol\upl la\upl
    re,\upl r

    %7
    R2*4\mbreak
    r4 fad\upl
    dod\upl re\upl

    %13
    la\upl r
    R2
    r4 fad''\upl

    %16
    dod\upl re\upl
    la\upl r
    R2

    %19
    r4 fad\upl
    dod\upl re\upl\mbreak
    la8[la' la la]

    %22
    la,[la' la la]
    la,4 r
    R2

    %25
    la8[la' la la]
    la,[la' la la]
    la,4 r

    %28
    R2
    r8 la'4 sol8
    fad[fad fad fad]

    %31
    fad[fad fad fad]\mbreak
    fad[fad fad fad]
    fad[fad fad fad]

    %34
    sol4 r
    R2
    r8 sol[si re]

    %37
    sold,[sold sold sold]
    sold?[sold sold sold]
    sold?[sold sold sold]

    %40
    sold?[sold sold sold]
    la4 r
    R2

    %43
    r8 la [dod \parenthesize mi]\mbreak
    la,,[la' la, la']
    la,[la' la la]

    %46
    la,[la' la, la']
    la,[la' la la]
    la,[la' la, la']

    %49
    la,[la' la la]
    la,[la' la la]
    la,[la' la sol]

    %52
    fad4 r16 fad\p mi re
    sol8 mi la sol\mbreak
    fad4 r16 fad\fo mi re

    %55
    sol8 mi la sol
    fad mi re mi
    fad4\upl sol\upl

    %58
    dod, sold
    la si
    dod r16 la si dod

    %61
    re8 fad la la,
    re re' la\p fad
    re4 r

    %64
    R2\mbreak
    fad8[fad fad sol]
    la[fad sol mi]

    %67
    fad8[fad fad sol]
    la[fad sol mi]
    r8 re^\markup\italic"Cemb."\p [fad re]

    %70
    sol sol mi mi
    fad fad re re
    mi mi la, la

    %73
    re la' dod4\upl\fo\tu
    re\upl la\upl\mbreak
    R2*2
    r4 dod,\upl
    re\upl la\upl

    %79
    R2*2
    la8\p la'^\markup\italic"Cemb." sold mi

    %82
    la4 r
    R2
    mi4 \parenthesize r\mbreak

    %85
    R2
    r8 fad16\fo\tu sol la8 la
    la[la la la]

    %88
    la,4 r
    R2
    r8 fad'16 sol la8 la

    %91
    la[la la la]
    la la,4 sol'8
    fad[fad fad fad]

    %94
    fad[fad fad fad]\mbreak
    fad[fad fad fad]
    fad[fad fad fad]

    %97
    sol[r sol\p^\markup\italic"Cemb."] r
    la[r la] r
    si[r si] r

    %100
    do do la la
    si si sol sol
    la la fad fad\mbreak

    %103
    sol4 r
    R2*2
    sold8\fo\tu[sold sold sold]

    %107
    sold?[sold sold sold]
    sold?[sold sold sold]
    sold?[sold sold sold]

    %110
    la[r la\p^\markup\italic"Cemb."] r
    si[r si] r\mbreak
    dod[r dod] r

    %113
    re re si si
    dod dod la la
    si si sold sold

    %116
    la4 r
    R2*7
    la8\p^\markup\italic"Cemb."[r la] r

    %125
    la[r la] r
    la, r r4
    la8 r r4

    %128
    la8 r r4\mbreak
    la r
    R2

    %131
    la'8\tu\fo [re dod re]
    la4 r
    la,8[re dod re]

    %134
    la4 r
    R2*3\mbreak
    r4 si'\upl\fo

    %139
    sol\upl la\upl
    re,\upl r
    R2*4

    %145
    r4 re\upl
    mi\upl fad\upl\mbreak
    sol\upl r

    %148
    R2*7
    re4\p r
    r8 re[re re]\mbreak

    %157
    re4 r
    r8 re[re re]
    re4 r

    %160
    r8 re[re re]
    re4 r
    re r

    %163
    re r
    re8 mi fad re\mbreak
    sol4 r

    %166
    R2*3
    r4 mi\tu\upl
    do\upl re\upl

    %171
    sol,\upl r
    R2*4
    r4 si'\upl

    %177
    fad\upl sol\upl
    re\upl r
    R2*4

    %183
    r8 re\p^\markup\italic"Cemb."[mi fad]
    sol4 r\mbreak
    R2*4

    %189
    r8 mi[fad sold]
    la4 r8 la
    la[la la la]

    %192
    si4 r8 si
    si[si si si]\mbreak
    dod4 r8 dod

    %195
    dod[dod dod dod]
    re re si si
    dod dod la la

    %198
    si si sol sol
    la2~
    la~

    %201
    la~\mbreak
    la~
    la~

    %204
    la4 r
    R2
    la,8\tu\fo[la' la la]

    %207
    la,[la' la la]
    la,4 r
    R2\mbreak

    %210
    la8[la' la la]
    la,[la' la la]
    la,4 r

    %213
    R2*6
    r4 do'\fo\upl\mbreak
    re\upl re,\upl

    %221
    sol\upl r
    R2*6
    r4 re'\upl\fo

    %229
    mi\upl mi,\upl\mbreak
    la r
    R2

    %232
    r8 la,\tu\fo[dod mi]
    la, la' la, la'
    la,[la' la la]

    %235
    la, la' la, la'
    la,[la' la la]
    la, la' la, la'

    %238
    la,[la' la la]
    la,[la' la la]\mbreak
    la,4 r8 sol'\p^\markup\italic"Cemb."

    %241
    fa[mi re sold]
    la4 r
    R2

    %244
    r8 la[la la]
    la4 r
    r8 si\tu\fo[la sol]

    %247
    fad4 r16 fad\p mi re
    sol8 mi la sol
    fad4 r16 fad\p mi re\mbreak

    %250
    sol8 mi la sol
    fad mi re\p^\markup\italic"Cemb." mi
    fad4 sol~

    %253
    sol fad8 mi\fo\tu
    re  mi fad sol
    dod,4 sold

    %256
    la si
    dod r16 la si dod
    re8 fad la4

    %259
    re,2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}



forma = {

    \time 2/4
    \key re\major
    \tempo 2 = 60
    \partial 8 s8
    s2*259
    \bar "|."


}


IflI = {
    \Iglobal
    \notypeset
    <<\IflIn \forma>>
}


IflII = {
    \Iglobal
    <<\IflIIn \forma>>
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


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}

IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    %\padall
    \override Staff.VerticalAxisGroup.minimum-Y-extent = #'(-1 . 1)
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IIflIn = \relative do'' {

    R2.
    r8 mi\upl re\upl do\upl si\upl la\upl
    si4 r8 r4.

    %4
    r8 dod!\upl re\upl mi\upl fad\upl sol\upl
    fad\upl re\upl mi\upl fad sol la
    si8 [sol, mi'32(sol fad mi)] si'8 la sol\mbreak

    %7
    la8[fad, re'32(fad mi re)] la'8 sol fad
    sol [mi, dod'32(mi re dod)] sol'8 fad mi
    fad [dod8.-+ si32 dod] re8\upl [si'\upl sol,32\p(fad mi16)]

    %10
    fad8 [dod'8.-+\fo si32 dod] re8\upl [si'\upl sol,32\p(fad mi16)]
    fad8\upl la\upl\fo do!\upl si\upl la\upl r
    sol'[fad la32(sol fad16)] sol8[fad la32(sol fad16)]

    %13
    sol8 la si do si la\mbreak
    si[la do32(si la16)] si8[la do32(si la16)]
    si8 si, do re do si

    %16
    mi fad sol \afterGrace la (si8) re,4
    \afterGrace sol8 (la) re,4 \afterGrace la'8 (si) do,4
    si8 [\grace {do16[re]} mi8 si] si-+ la r

    %19
    R2.
    r8 mi'\upl re\upl do\upl si\upl la\upl
    si8. mi16 re8 sol fad sol\mbreak

    %22
    la4 r8 r4.
    r8 fad sol la si do
    si\upl[fad16(sol32 la) sol8\upl] red16[(mi32 fad) mi8\upl si\upl]

    %25
    la'\upl[mi16(fad32 sol) fad8\upl] dod16[(re32 mi) re8\upl la\upl]
    sol'\upl[re16(mi32 fad) mi8\upl] si16[(dod32 re) dod8\upl sol\upl]
    \autoBeamOff fad'16 sol8 la si16~si8 r r\mbreak

    %28
    mi,16 fad8 sol la16~la8 r r
    re,16 mi8 fad sol la \autoBeamOn sol32[fad mi16 re]
    dod8.[dod32 re mi16 fad] sol4.~

    %31
    sol16 dod, re mi fad sol fad8 mi r
    R2.
    r8 si'\upl la\upl sol\upl fad\upl mi\upl\mbreak
    fad4 r8 r4.

    %35
    r8 fad\upl mi\upl re\upl dod\upl si\upl
    la8.\tu dod16 mi8 la8 dod,4-+
    la'8 re,4-+ la'8 mi4-+

    %38
    fad8 la, fad'~\solo fad16[mi32 re mi16 si si'8]~
    si16 la sol fad mi si mi[re32 dod re16 la la'8]~
    la16 sol fad mi re la re \grace do!16 si16 \grace la16 sol4-+\mbreak

    %41
    fad8 la' si do! si la
    si16 la32 sol fad16(sol) sol(la) la re, re'4~
    re2.~

    %44
    re8 fad, sol la si do
    si32[(la sol16) fad mi do'8] la32[(sol fad16) mi re si'8]
    sol32[(fad mi16) re do la'8] fad4 r8\mbreak

    %47
    R2.
    r4. r16 la32[(sol fad16) mi re do!]
    \autoBeamOff si do8 re mi fad sol la16~

    %50
    la si8 do re16~\autoBeamOn re[sol, si8 la]
    sol16 mi mi(do) do(re) re(mi) mi(do) do(re)
    re32 [sol fad mi re16 do si la] si [mi32 re do16 si la sol]\mbreak

    %53
    fad mi' re do si la sol do la4-+
    sol mi'32\tu(sol fad mi) si'8 la sol
    la [fad, re'32(fad mi re)] la'8 sol fad

    %56
    sol[mi, do'32(mi re do)] sol'8 fad mi
    fad16 do la' do, fad do la' do,32 re mi16\piano[mi re do]
    si sol la4-+ sol4.

}


IIflIIn = \relative do'' {

    R2.
    r8 do\upl si\upl la\upl sol\upl fad\upl
    sol4 r8 r4.

    %4
    r8 mi'\upl fad\upl sol\upl la\upl si\upl
    la\upl re,\upl mi\upl fad sol la
    si8 [sol, mi'32(sol fad mi)] si'8 la sol\mbreak

    %7
    la8[fad, re'32(fad mi re)] la'8 sol fad
    sol [mi, dod'32(mi re dod)] sol'8 fad mi
    fad [dod8.-+ si32 dod] re8\upl [si'\upl sol,32\p(fad mi16)]

    %10
    fad8 [dod'8.-+\fo si32 dod] re8\upl [si'\upl sol,32\p(fad mi16)]
    fad8\upl la\upl\fo do!\upl si\upl la\upl r
    si[la do32(si la16)] si8[la do32(si la16)]

    %13
    si8 fad' sol la sol fad\mbreak
    sol8[fad la32(sol fad16)] sol8[fad la32(sol fad16)]
    sol8 sol,4~sol4.

    %16
    sol8 la si do fad,4
    sol8 sol4 la8 la4
    sol8 sol sol sol fad r

    %19
    R2.
    r8 do'\upl si\upl la\upl sol\upl fad\upl
    si8. mi16 re8 sol fad sol\mbreak

    %22
    la4 r8 r4.
    re,2.~
    re8[la16(si32 do) si8] fad16[(sol32 la) sol8] r

    %25
    r dod16[(re32 mi) re8] mi,16[(fad32 sol) fad8] r
    r si16[(dod32 re) dod8] sol16.[(fad32) mi8] r8
    r4. r16 \autoBeamOff dod'8 re mi16~\mbreak

    %28
    mi8 r r r16 si8 dod re16~
    re8 r r r4.\autoBeamOn
    R2.

    %31
    r16 la si dod re mi re8 dod r
    R2.
    r8 sol'\upl fad\upl mi\upl re\upl dod\upl\mbreak

    %34
    re4 r8 r4.
    r8 re dod si la sold
    la8. dod16 mi8 la dod,4-+

    %37
    la'8 re,4-+ la'8 mi4-+
    fad4 r8 r4.
    R2.*2\mbreak

    %41
    r8 fad sol la sol fad
    sol16 fad32 mi re16(mi) mi(fad) fad(re) re'4~
    re2.~

    %44
    re8 re,4~re fad16(sol32 la)
    sol8[si, sol'16(la32 si)] re,8[la fad'16(sol32 la)]
    si,8[sol mi'16(fad32 sol)] la,4 r8\mbreak

    %47
    R2.*4

    %51
    r16 do do(la) la(si) si(do) do(la) la(si)
    si8 r r r4.\mbreak
    R2.

    %54
    si'8\forte[sol, mi'32\tu(sol fad mi)] si'8 la sol
    la [fad, re'32(fad mi re)] la'8 sol fad
    sol[mi, do'32(mi re do)] sol'8 fad mi

    %57
    fad16 do la' do, fad do la' do,32 re mi16\piano[mi re do]
    si sol la4-+ sol4.

}

IIvlIn = \relative do'' {

    sol8. mi'16 re8 fad,\upl sol\upl dod,\upl
    re4 r8 r4.
    sol8. mi'16 re8 fad, sol dod,

    %4
    re4 r8 r4.
    r8 re' mi fad sol la
    si8 [sol, mi'32(sol fad mi)] si'8 la sol\mbreak

    %7
    la8[fad, re'32(fad mi re)] la'8 sol fad
    sol [mi, dod'32(mi re dod)] sol'8 fad mi
    fad [dod8.-+ si32 dod] re8\upl [si'\upl sol,32\p(fad mi16)]

    %10
    fad8 [dod'8.-+\fo si32 dod] re8\upl [si'\upl sol,32\p(fad mi16)]
    fad8\upl la\upl\fo do!\upl si\upl la\upl r
    re2.~\p

    %13
    re~\mbreak
    re~
    re4 r8 r4.

    %16
    R2.*3
    sol,8.\fo mi'16 re8 fad, sol dod,
    re4 r8 r4.

    %21
    si'8. mi16 re8 sol fad sol\mbreak
    la la,\upl\p si\upl do\upl re\upl si\upl
    la4 r8 r r la'\upl

    %24
    si\upl r r r r sol
    la r r r r fad
    sol r r r r mi

    %27
    fad r r r dod\upl re\upl\mbreak
    mi\upl r r r si\upl dod\upl
    re\upl r r r4.

    %30
    r16 la' sol fad  mi re dod si la si dod re
    mi8 la,, la' sold la r
    re,8.\fo si'16 la8 dod, re sold,

    %33
    la4 r8 r4.\mbreak
    re8. si'16 la8 dod, re sold,
    la4 r8 r4.

    %36
    la'8.\fo dod16 mi8 la8 dod,4-+
    la'8 re,4-+ la'8 mi4-+
    fad4 r8 r mi\p mi

    %39
    r4. r8 re re
    R2.*2
    r4. r8 fad\p sol

    %43
    la sol fad sol16 fad32 mi re16(mi) mi(fad)
    fad8 r r r4.
    R2.

    %46
    r4. r8 dod8.-+\fo [si32 dod]\mbreak
    re8[si' sol,32\p(fad mi16)] fad8[dod'8.-+\fo si32 dod]
    re8[si' sol,32\p(fad mi16)] fad4 r8

    %49
    R2.*2
    sol2.\p~
    sol8 fad re sol mi do\mbreak

    %53
    re8 fad re mi16 do re4
    si''8\forte[sol, mi'32\tu(sol fad mi)] si'8 la sol
    la [fad, re'32(fad mi re)] la'8 sol fad

    %56
    sol[mi, do'32(mi re do)] sol'8 fad mi
    fad16 do la' do, fad do la' do,32 re mi16\piano[mi re do]
    si sol la4-+ sol4.

}


IIvlIIn = \relative do'' {

    sol8. mi'16 re8 fad,\upl sol\upl dod,\upl
    re4 r8 r4.
    sol8. mi'16 re8 fad, sol dod,

    %4
    re4 r8 r4.
    r8 re'\upl mi\upl re\upl re\upl re\upl
    re[ r mi] mi mi mi\mbreak

    %7
    mi[r re] re re re
    re[r dod] dod dod dod
    re [sol,8.-+ fad32 sol] la8\upl sol\upl mi\upl\p

    %10
    re [sol8.-+\fo fad32 sol] la8\upl sol\upl mi\upl
    re\upl la'\upl\fo la\upl sol\upl fad\upl r
    re'2.\p~

    %13
    re~\mbreak
    re~
    re4 r8 r4.

    %16
    R2.*3
    sol,8.\fo mi'16 re8 fad, sol dod,
    re4 r8 r4.

    %21
    sol4 sol8 dod dod sol'\mbreak
    fad fad,\upl\p sol\upl la\upl fad\upl sol\upl
    fad4 r8 r r re'

    %24
    re r r r r mi
    mi r r r r re
    re r r r r dod

    %27
    re r r r la la\mbreak
    la r r r sol sol
    la r r r4.

    %30
    r16 mi' re dod si la sol[fad mi8 mi]
    la la, la' sold la r
    re,8.\fo si'16 la8 dod, re sold,

    %33
    la4 r8 r4.\mbreak
    re8. si'16 la8 dod, re sold,
    la4 r8 r4.

    %36
    mi'8.\fo la16 dod8 dod la4
    la8 la4 la8 mi'4
    re r8 r si\p si

    %39
    r4. r8 la la
    R2.*2
    r4. r8 la\p si

    %43
    do si la si16 la32 sol fad16[(sol) sol(la)]
    la8 r r r4.
    R2.

    %46
    r4. r8 sol8.-+\fo [fad32 sol]\mbreak
    la8\upl sol\upl mi\upl\p re [sol8.-+\fo fad32 sol]
    la8\upl sol\upl mi\p re4 r8

    %49
    R2.*2
    sol2.\p~

    %52
    sol8 fad re sol mi do\mbreak
    re fad re mi16 do re4
    re'8\forte[r mi] mi mi mi

    %55
    mi[r re] re re re
    re[r do] do do do
    do do do do la la

    %58
    sol fad4 re4.

}


IIvlan = \relative do' {

    sol'8. mi'16 re8 fad,\upl sol\upl dod,\upl
    re4 r8 r4.
    sol8. mi'16 re8 fad, sol dod,

    %4
    re4 r8 r4.
    r8 la' la la sol re
    sol[r si] si si si\mbreak

    %7
    la[r la] la la la
    sol[r sol] sol sol sol
    la\upl[mi8.-+ re32 mi] fad8\upl sol\upl la,\p

    %10
    la[mi'8.-+\fo re32 mi] fad8\upl sol\upl la,\p
    la re\upl\fo fad\upl re\upl re\upl r
    R2.*7

    %19
    sol8.\fo mi'16 re8 fad, sol dod,
    re4 r8 r4.
    re8. do16 sol'8 sol sol sol\mbreak

    %22
    re'4 r8 r4.
    r r8 r fad,\p
    sol r r r r si

    %25
    la r r r r la
    sol r r r r la
    la r r r sol fad\mbreak

    %28
    dod r r r sol' mi
    fad r r r4.
    r16 dod' si la sol fad mi re dod si la si

    %31
    dod8 la la' sold la r
    re,8.\fo si'16 la8 dod, re sold,

    %33
    la4 r8 r4.\mbreak
    re8. si'16 la8 dod, re sold,
    la4 r8 r4.

    %36
    dod8. mi16 la8 mi mi4
    re8 fad4 mi8 la4
    la r8 r sol\p sol

    %39
    r4. r8 fad fad
    R2.*6
    r4. r8 mi8.-+\fo[re32 mi]\mbreak

    %47
    fad8\upl sol\upl la,\p la[mi'8.-+\fo re32 mi]
    fad8\upl sol\upl la,\p la4 r8
    R2.*5

    %54
    sol'8\tu\fo[r si] si si si
    la[r la] la la la
    sol[r sol] sol sol sol

    %57
    la fad la fad la,\p re
    re re4 si4.

}

IIbcn = \relative do {

    sol'8. mi'16 re8 fad,\upl sol\upl dod,\upl
    re4 r8 r4.
    sol8. mi'16 re8 fad, sol dod,

    %4
    re4 r8 r4.
    r8 fad\upl dod\upl re\upl mi\upl fad\upl
    sol[r sol] sol[sol sol]\mbreak

    %7
    fad[r fad] fad fad fad
    mi[r mi] mi mi mi
    re re re re[r dod\p]

    %10
    re re\fo re re[r dod\p]
    re fad\fo re sol re r
    R2.*3

    %15
    r8 sol^\markup\italic"Cemb." la\p si la sol
    do16 re do si la sol fad8[do'16 si do8]
    si,[si'16 la si8] fad,[fad'16 mi fad8]

    %18
    sol, do dod re re, r
    sol'8.\tu mi'16 re8 fad, sol dod,
    re4 r8 r4.

    %21
    sol8. do16 si8 mi mi mi\mbreak
    re4 r8 r4.
    r8 re,\p^\markup\italic"Cemb." mi fad mi re

    %24
    sol r r r r mi
    fad r r r r re
    mi r r r r la,

    %27
    re si' fad sol r r\mbreak
    dod, re mi fad r r
    fad' dod re mi, fad sol

    %30
    la4 r8 r4.
    R2.
    re,8.\tu\fo si'16 la8 dod, re sold,

    %33
    la4 r8 r4.\mbreak
    re8. si'16 la8 dod, re sold,
    la4 r8 r4.

    %36
    sol'!4 sol,8 sol' sol sol
    fad fad fad dod' dod dod
    re4 re,8\p^\markup\italic"Cemb." sol4 r8

    %39
    sol sol sol fad4 r8
    fad fad fad mi la, la\mbreak
    re4 r8 r4.

    %42
    R2.*2
    r8 re mi fad mi re
    sol sol mi fad fad re

    %46
    mi mi do re re\tu\fo re\mbreak
    re[r dod\p] re re\fo re
    re[r dod\p] re re'^\markup\italic"Cemb." fad,

    %49
    sol mi si' do la si
    fad sol la, si16[mi] re8 re,
    sol4 r8 r4.

    %52
    R2.*2
    sol8\fo\tu[r sol'] sol sol sol
    fad[r fad] fad fad fad

    %56
    mi[r mi] mi mi mi
    re re re re fad,\p fad
    sol16 si re4 sol,4.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}



forma = {

    \time 6/8
    \key sol\major
    \tempo 4. = 50
    s2.*57
    s4. s\fermata
    \bar "|."


}


IIflI = {
    \IIglobal
    \notypeset
    <<\IIflIn \forma>>
}


IIflII = {
    \IIglobal
    <<\IIflIIn \forma>>
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


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    %\padall
    \override Staff.VerticalAxisGroup.minimum-Y-extent = #'(-1 . 1)
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IIIflIn = \relative do'' {

    r2.
    r8 re [mi fad sol mi]
    fad4 r r
    r8 re [mi fad sol mi]

    %5
    fad re16 fad la8[la la la]
    la sol fad[mi] re do
    si mi re16 do si re do si la do

    %8
    si8 mi16 sol si8 si si si\mbreak
    si la sol[fad] mi re
    dod! fad mi16 re dod mi re dod si re

    %11
    dod8 la' sol[fad] mi re
    dod si la[si] dod re
    mi re16 dod re8 mi fad sol

    %14
    fad4 mi r
    la8 la4 la8 [la la]
    la la4 la8 [la la]

    %17
    la16 si, dod red mi fad sol la si la sol fad\mbreak
    sol la si sol fad sol la fad sol8 r
    sol sol4 sol8 [sol sol]

    %20
    sol sol4 sol8 [sol sol]
    sol16 la, si dod re mi fad sol la sol fad mi
    fad sol la fad mi fad sol mi fad8 r

    %23
    la fad16 re la'8 la la la
    la mi16 dod la'8 la la la\mbreak
    la4 r8 re,16 fad la8[la,]

    %26
    r4 r8 dod16 mi la8[la,]
    r re [mi fad] do4~
    do8 si16 la si8 fad sol re

    %29
    mi mi' fad sol re4~
    re8 dod!16 si dod8[sol] la mi
    fad la'4 fad,8 [mi re]

    %32
    si' la'4 sol,8 [fad mi]\mbreak
    dod' la'4 la,8[sol fad]
    re' la'4 si,8[la sol]

    %35
    mi' la4 dod,8[si la]
    fad'4 r r
    R2.

    %38
    fad16 la sol fad mi sol fad mi re fad mi re
    dod mi re dod si re dod si la dod si la\mbreak
    sol8 si'4 sol,8[fad mi]

    %41
    sol' si4 sol,8[fad mi]
    sol' sol4 sol8[sol sol]
    sol sol4 fad16[sol] la8 sol

    %44
    fad re mi4\upl dod\upl
    re16 re, mi fad sol la si dod re mi fad re
    sol8\p sol4 sol8[sol sol]

    %47
    sol sol4 fad16\fo[sol] la8 sol\mbreak
    fad re mi2-+
    re4 re'4\solo la

    %50
    \grace sol8 fad2 sol8.(la32 si)
    la4 sol8 fad mi re
    dod4 r r

    %53
    r8 la'[sol fad mi re]
    dod4 r r
    r8 la'16 si sol la fad sol mi fad re mi

    %56
    dod8 re mi[fad] sol fad16 mi\mbreak
    fad4 r r
    R2.*2

    %60
    si,16 sol fad sol re' sol, fad sol fad' la,sol la
    sol' si, la si re sol, fad sol fad' la, sol la
    sol'4 r r

    %63
    R2.*2
    dod,16 la sold la mi' la, sold la sold' si, la si
    la' dod, si dod mi la, sold la sold' si, la si

    %67
    la'8 la\tu sol![fad] mi re
    dod fad\solo mi re dod[si]
    la[la'\tu sol fad mi re]

    %70
    dod si la[si] dod re
    mi re16 dod re8[mi] fad sol
    fad4 mi r\mbreak

    %73
    la8 la4 la8[la la]
    la la4 la8[la la]
    la16 si, dod red mi fad sol la si la sol fad

    %76
    sol la si sol fad sol la fad sol8 r
    R2.*2
    r16 la, si dod re mi fad sol la sol fad mi

    %80
    fad sol la fad mi fad sol mi fad8 r\mbreak
    fad16 sol fad mi re mi re dod si dod re si
    mi fad mi re dod re dod si lad si dod lad

    %83
    re4 r8 si'[la sol]
    mid sold dod[mid,] mid4-+
    fad r8 la[fad mi!]

    %86
    red fad si[red,] red4-+
    mi r8 sol[mi re!]\mbreak
    dod mi la[dod,] dod4-+

    %89
    re8 fad16 mi re8[dod] si lad
    si sol'16 fad mi8[re dod si]
    lad si4 dod re8~

    %92
    re red4 mi fad8~
    fad sol4 sold lad8~
    lad si4 dod16 si lad8[si]

    %95
    dod4 fad, r\mbreak
    R2.
    r8 si\solo[dod re mi dod]

    %98
    re4 r r
    r8 si[dod re mi dod]
    re4 r r

    %101
    r8 mi,16\tu[fad] sol8 sol la si
    dod,4 r r
    r8 re16[mi] fad8 fad sol la\mbreak

    %104
    si,4 r r
    r8 dod16[re] mi8 mi fad sol
    lad,4 r r

    %107
    R2.*2
    re16 si lad si fad' si, lad si lad' dod, si dod
    si' re, dod re fad si, lad si lad' dod, si dod

    %111
    \parenthesize si'4 r r
    R2.*2
    dod,16 la sold la mi' la, sold la sold' si, la si

    %115
    la' dod, si dod mi la, sold la sold' si, la si
    la'4 la, r
    la'16 sol! mi sol la sol mi sol la fad re fad\mbreak

    %118
    la4 la, r
    la'16 mi dod mi la mi dod mi la fad re fad
    la4 la, r

    %121
    R2.
    r8 re[mi fad sol mi]
    fad4 r r

    %124
    r8 re[mi fad sol mi]\mbreak
    fad re16\tu fad la8 la la la
    la sol fad[mi] re do

    %127
    si mi\solo re[do] si la
    sol mi'16\tu sol si8 si si si
    si la sol[fad] mi re

    %130
    dod fad16\solo sol mi fad re mi dod re si dod
    la8 la' sol[fad] mi re\mbreak
    dod si la[si] dod re

    %133
    mi re16 dod re8[mi] fad sol
    fad4 mi r
    la8\tu la4 la8[la la]

    %136
    la la4 la8[la la]
    la16 si,\solo dod red mi fad sol la si la sol fad
    sol la si sol fad sol la fad sol8 r\mbreak

    %139
    sol\tu sol4 sol8[sol sol]
    sol sol4 sol8[sol sol]
    sol4 r r

    %142
    re16 mi fad re dod re mi dod re8 r
    la' fad16 re la'8 la la la
    la4 r r\mbreak

    %145
    la8 fad16 re la'8 la la la
    la4 r r
    r8 re,\tu[mi fad] do4~

    %148
    do8 si16 la si8[fad] sol re
    mi[mi'fad sol] re4~
    re8 dod!16 si dod8[sol] la mi\mbreak

    %151
    fad la'4\solo fad,8[mi re]
    si'4 r r
    r8 la'4 la,8[sol fad]

    %154
    re'4 r r\mbreak
    r8 la'4 dod,8[si la]
    fad'4 r r

    %157
    R2.
    fad16\tu la sol fad mi sol fad mi re fad mi re
    dod mi re dod si re dod si la dod si la

    %160
    sol8 si'4 sol,8[fad mi]\mbreak
    sol' si4 sol,8[fad mi]
    sol' sol4 sol8[sol sol]

    %163
    sol sol4 fad16 sol la8[sol]
    fad re mi4\upl dod\upl
    re16 la fad re fad la re fad la re la fad

    %166
    re4 r r
    re16 si fad re fad si re fad si re si fad\mbreak
    re4 r r

    %169
    re16 la fad re fad la re fad la re la fad
    re4 r r
    sol8\tu\fo sol4 sol8[sol sol]

    %172
    sol sol4 fad16 sol la8[sol]
    fad re mi2-+
    re8 dod16 si la8 sol fad mi

    %175
    fad[si la sol fad mi]
    fad mi16 re la'4 la
    re,2.

}


IIIflIIn = \relative do'' {

    R2.
    r8 fad,[sol la si dod]
    re4 r r

    %4
    r8 fad,[sol la si dod]
    re re16 fad la8 la la la
    la sol fad[mi] re do

    %7
    si do si16 la sol si la sol fad la
    sol8 mi'16 sol si8 si si si\mbreak
    si la sol[fad] mi re

    %10
    dod! re dod16 si la dod si la sold si
    la8 la' sol[fad] mi re
    dod si la[si] dod re

    %13
    mi re16 dod re8 mi fad sol
    fad4 mi r
    la8 la4 la8 [la la]
    la la4 la8 [la la]

    %17
    la16 si, dod red mi fad sol la si la sol fad\mbreak
    mi fad sol mi red mi fad red mi8 r
    sol sol4 sol8 [sol sol]

    %20
    sol sol4 sol8 [sol sol]
    sol16 la, si dod re mi fad sol la sol fad mi
    re mi fad re dod re mi dod re8 r

    %23
    r4 r8 re16 fad la8[la,]
    r4 r8 dod16 mi la8[la,]\mbreak
    la' re,16 fad la8 la la la

    %26
    la dod,16 mi la8la la la
    la re, mi fad do4~
    do8 si16 la si8 fad sol re

    %29
    mi mi' fad sol re4~
    re8 dod!16 si dod8[sol] la mi
    fad la'4 fad,8 [mi re]

    %32
    si' la'4 sol,8 [fad mi]\mbreak
    dod' la'4 la,8[sol fad]
    re' la'4 si,8[la sol]

    %35
    mi' la4 dod,8[si la]
    fad'4 r r
    R2.

    %38
    fad16 la sol fad mi sol fad mi re fad mi re
    dod mi re dod si re dod si la dod si la\mbreak
    sol8 si'4 sol,8[fad mi]

    %41
    sol' si4 sol,8[fad mi]
    sol' sol4 sol8[sol sol]
    sol sol4 fad16[sol] la8 sol

    %44
    fad re mi4\upl dod\upl
    re16 re, mi fad sol la si dod re mi fad re
    sol8\p sol4 sol8[sol sol]

    %47
    sol sol4 fad16\fo[sol] la8 sol\mbreak
    fad re mi2-+
    re4 r r

    %50
    R2.*3
    r8 re4 dod8[(si) si]
    la4 r r

    %55
    r8 re4 dod8[si si]
    la si dod[re] sol fad16 mi\mbreak
    re4 la'\solo re

    %58
    \grace sol,8 fad2 sol8.(la32 si)
    la8 sol fad[mi] re do
    si4 r r

    %61
    R2.
    r4 si' mi
    sold,2 la8.(si32 dod)

    %64
    si8 la sold[fad] mi re\mbreak
    dod4 r r
    R2.

    %67
    r8 la'\tu sol![fad] mi re
    dod re\solo dod[si] la sold
    la [la'\tu sol fad mi re]

    %70
    dod si la[si] dod re
    mi re16 dod re8[mi] fad sol
    fad4 mi r\mbreak

    %73
    R2.*2
    r16 si dod red mi fad sol la si la sol fad
    mi fad sol mi red mi fad red mi8 r

    %77
    sol sol4 sol8[sol sol]
    sol sol4 sol8[sol sol]
    sol16 la, si dod re mi fad sol la sol fad mi

    %80
    re mi fad re dod re mi dod re8 r\mbreak
    fad16 sol fad mi re mi re dod si dod re si
    mi fad mi re dod re dod si lad si dod lad

    %83
    re8 [si16 re] sol8 r r4
    R2.
    r8 la,16 [dod] fad8 r r4

    %86
    R2.
    r8 sol,16[si] mi8 r r4\mbreak
    R2.*9

    %97
    r8 re[mi fad sol lad]
    si4 r r
    r8 re,[mi fad sol lad]

    %100
    si4 r r
    r8 mi,16 fad sol8 sol la si
    dod,4 r r

    %103
    r8 re16 mi fad8 fad sol la\mbreak
    si,4 r r
    r8 dod16 re mi8 mi fad sol

    %106
    lad,4 fad'\solo dod
    \grace si8 lad2 si4
    dod8 sol' fad[mi] re dod

    %109
    re4 r r
    R2.
    r4 re8[(fad)] re(si)\mbreak

    %112
    \grace la8 sold2 la4
    si8 fad' mi[re] dod si
    dod4 r r

    %115
    R2.
    la'16 mi dod mi la mi dod mi la fad mi fad
    la4 la, r\mbreak

    %118
    la'16 mi dod mi la mi dod mi la fad re fad
    la4 la, r
    R2.*2

    %122
    r8 fad[sol la si dod]
    re4 r r
    r8 fad,[sol la si dod]\mbreak

    %125
    re re16\tu fad la8 la la la
    la sol fad[mi] re do
    si do si[la] sol fad

    %128
    sol mi'16 sol si8 si si si
    si la sol[fad] mi re
    dod re16 \solo mi dod re si dod la si sold la

    %131
    la4 r r\mbreak
    R2.*3
    la'8 la4 la8[la la]

    %136
    la la4 la8[la la]
    la4 r r
    mi16 fad sol mi red mi fad red mi8 r\mbreak

    %139
    sol8\tu sol4 sol8[sol sol]
    sol sol4 sol8[sol sol]
    sol16 la,\solo si dod re mi fad sol la sol fad mi

    %142
    fad sol la fad mi fad sol mi fad8 r
    R2.
    la8 mi16 dod la'8 [la] la la

    %145
    la4 r r
    la8\p mi16 dod la'8 la la la
    la re,\fo mi fad do4~

    %148
    do8 si16 la si8[fad] sol re
    mi[mi'fad sol] re4~
    re8 dod!16 si dod8[sol] la mi\mbreak

    %151
    fad4 r r
    r8 la'4 sol,8[fad mi]
    dod'4 r r

    %154
    r8 la'4 si,8[la sol]\mbreak
    mi'4 r r
    R2.*2

    %158
    fad16\tu la sol fad mi sol fad mi re fad mi re
    dod mi re dod si re dod si la dod si la

    %160
    sol8 si'4 sol,8[fad mi]\mbreak
    sol' si4 sol,8[fad mi]
    sol' sol4 sol8[sol sol]

    %163
    sol sol4 fad16 sol la8[sol]
    fad re mi4\upl dod\upl
    re4 r r

    %166
    re16 la fad re fad la re fad la re la fad
    re4 r r\mbreak
    re16 si fad re fad si re fad si re si fad

    %169
    re4 r r
    re16 la fad re fad la re fad la re la fad
    sol8\tu\fo sol4 sol8[sol sol]

    %172
    sol sol4 fad16 sol la8[sol]
    fad re mi2-+
    re8 dod16 si la8 sol fad mi

    %175
    fad[si la sol fad mi]
    fad mi16 re la'4 la
    re,2.

}

IIIvlIn = \relative do'' {

    re8 re,16 fad la8 la la la
    la4 r r
    re8 re,16 fad la8 la la la
    la4 r r

    %5
    r8 re16 fad la8[la la la]
    la sol fad[mi] re do
    si4 r r

    %8
    r8 mi16 sol si8 si si si
    si la sol[fad] mi re
    dod!4 r r

    %11
    r8 la' [sol fad mi re]
    dod si la[si] dod re
    mi re16 dod re8 mi fad sol

    %14
    fad4 mi r
    la8 la4 la8 [la la]
    la la4 la8 [la la]

    %17
    la16 si, dod red mi  fad sol la si la sol fad\mbreak
    sol4 r r
    sol8 sol4 sol8 [sol sol]

    %20
    sol sol4 sol8 [sol sol]
    sol16 la, si dod re mi fad sol la sol fad mi
    fad4 r r

    %23
    fad,4\p fad fad
    sol sol sol\mbreak
    fad fad fad

    %26
    sol sol sol
    fad8[re'\fo mi fad] do4~
    do8 si16 la si8 fad sol re

    %29
    mi mi' fad sol re4~
    re8 dod!16 si dod8[sol] la mi
    fad la'4 fad,8 [mi re]

    %32
    si' la'4 sol,8 [fad mi]\mbreak
    dod' la'4 la,8[sol fad]
    re' la'4 si,8[la sol]

    %35
    mi' la4 dod,8[si la]
    fad'4\upl sol\upl mi\upl
    fad\upl\p sol\upl mi\upl

    %38
    fad16 la sol fad mi sol fad mi re fad mi re
    dod mi re dod si re dod si la dod si la\mbreak
    sol8 si'4 sol,8[fad mi]

    %41
    sol' si4 sol,8[fad mi]
    sol' sol4 sol8[sol sol]
    sol sol4 fad16[sol] la8 sol

    %44
    fad re mi4\upl dod\upl
    re16 re, mi fad sol la si dod re mi fad re
    sol8\p sol4 sol8[sol sol]

    %47
    sol sol4 fad16\fo[sol] la8 sol\mbreak
    fad re mi2-+
    re4 r r

    %50
    R2.*2
    r8 la16 dod mi8 mi mi mi

    %53
    mi fad,\p si[la] sol sold
    la la16\fo dod mi8 mi mi mi
    mi fad,\p si[la] sol sold

    %56
    dod8\fo re mi[fad] sol fad16 mi\mbreak
    fad4 r r
    R2.*2

    %60
    sol,4\p si re
    sol, si re
    sol, r r

    %63
    R2.*2
    la4 dod mi
    la, dod mi

    %67
    la,8  la'\fo sol![fad] mi re
    dod4 r r
    r8 la'[sol fad mi re]

    %70
    dod si la[si] dod re
    mi re16 dod re8[mi] fad sol
    fad4 mi r\mbreak

    %73
    fad,\p fad mi
    red red dod
    si16 si'\fo dod red mi fad sol la si la sol fad

    %76
    sol4 r r
    mi,\p mi re
    dod dod si

    %79
    la16 la'\fo si dod re mi fad sol la sol fad mi
    fad4 r r\mbreak
    fad16 sol fad mi re mi re dod si dod re si

    %82
    mi fad mi re dod re dod si lad si dod lad
    re4 r r
    mid\p\upl mid\upl mid\upl

    %85
    fad\upl r r
    red\upl red\upl red\upl
    mi\upl r r\mbreak

    %88
    dod\upl dod\upl dod\upl
    re\upl r r
    R2.*2

    %92
    r4 red\upl mi\upl
    fad\upl sol\upl r
    R2.*2\mbreak

    %96
    si8 si,16 re fad8 fad fad fad
    fad4 r r
    r8 si,16 re fad8 fad fad fad

    %99
    fad4 r r
    r8 si,16 re fad8 fad fad fad
    fad mi16 fad sol8 sol la si

    %102
    dod, la16 dod mi8 mi mi mi
    mi re16 mi fad8 fad sol la\mbreak
    si, sol16 si re8 re re re

    %105
    re dod16 re mi8 mi fad sol
    lad,4 r r
    R2.*2

    %109
    si4\p re fad
    si, re fad

    %111
    si, r r\mbreak
    R2.*2
    la4 dod mi

    %115
    la, dod mi
    la, r fad'
    sol r fad\mbreak

    %118
    mi r fad
    sol r fad
    mi r r

    %121
    re8\fo re,16 fad la8 la la la
    la4 r r
    r8 re16 fad la8 la la la
    la4 r r\mbreak
    r8 re,16 fad la8 la la la

    %126
    la sol fad[mi] re do
    si4 r r
    r8 mi16 sol si8 si si si

    %129
    si la sol[fad] mi re
    dod4 r r
    r8 fad,\p[mi re dod si]\mbreak

    %132
    la4 r r
    R2.*2

    %135
    la''8\fo la4 la8[la la]
    la la4 la8[la la]
    la4 r8 mi,\p[red si]

    %138
    mi4 r r\mbreak
    sol'8\fo sol4 sol8[sol sol]
    sol sol4 sol8[sol sol]

    %141
    sol4 r8 re,\p[dod la]
    re4 r r
    la'' la la

    %144
    la la la\mbreak
    la la la
    la\p la la

    %147
    la8 re,\fo mi fad do4~
    do8 si16 la si8[fad] sol re
    mi[mi'fad sol] re4~

    %150
    re8 dod!16 si dod8[sol] la mi\mbreak
    fad16 fad fad\p fad \repeat unfold 8{la}
    \repeat unfold 12{si}

    %153
    \repeat unfold 12{dod}
    \repeat unfold 12{re}\mbreak
    \repeat unfold 12{mi}

    %156
    fad4\upl\fo sol\upl mi\upl
    fad\upl\p sol\upl mi\upl
    fad16 la sol fad mi sol fad mi re fad mi re

    %159
    dod mi re dod si re dod si la dod si la
    sol8 si'4 sol,8[fad mi]\mbreak
    sol'8 si4 sol,8[fad mi]

    %162
    sol' sol4 sol8[sol sol]
    sol sol4 fad16 sol la8[sol]
    fad re mi4\upl dod\upl

    %165
    re2.~\p
    re~
    re~\mbreak

    %168
    re~
    re~
    re

    %171
    sol8\fo sol4 sol8[sol sol]
    sol sol4 fad16 sol la8[sol]
    fad re mi2-+

    %174
    re8 dod16 si la8 sol fad mi
    fad[si la sol fad mi]
    fad mi16 re la'4 la,

    %177
    re2.

}


IIIvlIIn = \relative do'' {

    fad,8 la,16 re fad8 fad fad fad
    fad4 r r
    fad8 la,16 re fad8 fad fad fad

    %4
    fad4 r r
    r8 la16 re fad8 fad fad fad
    la,4 la la

    %7
    si r r
    r8 si16 mi sol8 sol sol sol\mbreak
    si,4 si si

    %10
    dod r r
    r8 la[la la la sold]
    la si la[sold] la la

    %13
    la la la[la] re mi
    re4 dod r
    dod dod dod

    %16
    si si mi
    red r8 si[si si]\mbreak
    si4 r r

    %19
    si si si
    la la re
    dod r8 la[la la]

    %22
    la4 r r
    re,\p re re
    dod dod dod\mbreak

    %25
    re re re
    dod dod dod
    re8[re'\fo mi fad] do4~

    %28
    do8 si16 la si8 fad sol re
    mi mi' fad sol re4~
    re8 dod!16 si dod8[sol] la mi
    fad la'4 fad,8 [mi re]

    %32
    si' la'4 sol,8 [fad mi]\mbreak
    dod' la'4 la,8[sol fad]
    re' la'4 si,8[la sol]

    %35
    mi' la4 dod,8[si la]
    re4\upl re\upl mi\upl
    re\upl\p re\upl mi\upl

    %38
    fad16 la sol fad mi sol fad mi re fad mi re
    dod mi re dod si re dod si la dod si la\mbreak
    sol8 si'4 sol,8[fad mi]

    %41
    sol' si4 sol,8[fad mi]
    sol' sol4 sol8[sol sol]
    sol sol4 fad16[sol] la8 sol

    %44
    fad re mi4\upl dod\upl
    re16 re, mi fad sol la si dod re mi fad re
    sol8\p sol4 sol8[sol sol]

    %47
    sol sol4 fad16\fo[sol] la8 sol\mbreak
    fad re mi2-+
    re4 r r

    %50
    R2.*2
    r8 mi,16 la dod8 dod dod dod
    dod fad,\p si[la] sol sold

    %54
    la mi16 la dod8 dod dod dod
    dod fad,\p si[la] sol sold
    la\fo si dod[re] mi re16 dod\mbreak

    %57
    re4 r r
    R2.*2

    %60
    sol,4\p si re
    sol, si re
    sol, r r

    %63
    R2.*2
    la4 dod mi
    la, dod mi

    %67
    la,8 la\fo la[la] la sold
    la4 r r
    r8 la[la la la sold]

    %70
    la si la[sold] la la
    la la la[la] re mi
    re4 dod r\mbreak

    %73
    fad,\p fad mi
    red red dod
    si r8 si'\fo[si si]

    %76
    si4 r r
    mi,\p mi re
    dod dod si

    %79
    la r8 la'\fo[la la]
    la4 r r\mbreak
    r fad' r

    %82
    r mi dod
    re r r
    dod\upl\p dod\upl dod\upl

    %85
    dod\upl r r
    si\upl si\upl si\upl
    si\upl r r\mbreak

    %88
    la\upl la\upl la\upl
    la\upl r r
    R2.*2

    %92
    r4 si\upl si\upl
    si\upl si\upl r
    R2.*2\mbreak

    %96
    re8 fad,16 si re8 re re re
    re4 r r
    r8 fad,16 si re8 re re re

    %99
    re4 r r
    r8 fad,16 si re8 re re re
    si4 r8 si[si si]

    %102
    la mi16 la dod8[dod dod dod]
    la4 r8 la[la la]\mbreak
    sol re16 sol si8 si si si

    %105
    sol4 r8 sol[sol sol]
    fad4 r r
    R2.*2

    %109
    si4\p re fad
    si, re fad
    si, r r\mbreak

    %112
    R2.*2
    la4 dod mi
    la, dod mi

    %116
    la,  r re
    mi r re\mbreak
    dod r re

    %119
    mi r re
    dod r r
    fad,8\fo la,16 re fad8 fad fad fad

    %122
    fad4 r r
    r8 la,16 re fad8 fad fad fad
    fad4 r r\mbreak

    %125
    r8 la16 re fad8 fad fad fad
    la,4 la la
    si r r

    %128
    r8 si16 mi sol8 sol sol sol
    si,4 si si
    dod r r

    %131
    r8 fad,\p[mi re dod si]\mbreak
    la4 r r
    R2.*2

    %135
    dod'4\fo dod dod
    si si mi
    red r8 mi,\p[red dod]

    %138
    mi4 r r\mbreak
    si'4\fo si si
    la la re

    %141
    dod r8 re,\p[dod la]
    re4 r r
    fad' fad fad

    %144
    sol sol sol\mbreak
    fad fad fad
    sol sol sol

    %147
    fad8 re\fo mi fad do4~
    do8 si16 la si8[fad] sol re
    mi[mi'fad sol] re4~

    %150
    re8 dod!16 si dod8[sol] la mi\mbreak
    fad16 fad fad\p fad \repeat unfold 8{la}
    \repeat unfold 12{si}

    %153
    \repeat unfold 12{dod}
    \repeat unfold 12{re}\mbreak
    \repeat unfold 12{mi}

    %156
    re4\upl\fo re\upl mi\upl
    re\upl\p re\upl mi\upl
    fad16\fo la sol fad mi sol fad mi re fad mi re

    %159
    dod mi re dod si re dod si la dod si la
    sol8 si'4 sol,8[fad mi]\mbreak
    sol'8 si4 sol,8[fad mi]

    %162
    sol' sol4 sol8[sol sol]
    sol sol4 fad16 sol la8[sol]
    fad re si4\upl la\upl

    %165
    la2.~
    la
    si~\mbreak

    %168
    si
    la~
    la

    %171
    sol4\fo si si
    la dod la
    la la la

    %174
    re8 dod16 si la8 sol fad mi
    fad[si la sol fad mi]
    fad mi16 re la'4 la,

    %177
    re2.

}


IIIvlan = \relative do' {

    la8 fad16 la re8 re re re
    re4 r r
    la8 fad16 la re8 re re re

    %4
    re4 r r
    r8 fad16 la re8 re re re
    re,4 re re

    %7
    re r r
    r8 sol16 si mi8 mi mi mi\mbreak
    mi,4 mi mi

    %10
    mi r r
    r8 re[dod re mi sold]
    mi fad mi[re] mi re

    %13
    la' mi re[la'] la la
    la4 la r
    la la sol

    %16
    fad fad mi
    fad r8 mi[fad red]\mbreak
    mi4 r r

    %19
    sol sol fad
    mi mi re
    mi r8 re[mi dod]

    %22
    re4 r r
    R2.*4
    r4 r8 fad[sol la]

    %28
    re,4 r re
    si r8 sol'[la si]
    mi,4 r mi

    %31
    la, r8 la[sol re']
    re4 r8 dod[re si]\mbreak
    la4 r8 re[si dod]

    %34
    re4 r8 re[dod re]
    mi4 r8 mi[re la']
    la4\upl si\upl la\upl

    %37
    la\upl\p si\upl la\upl
    la\upl\fo la\upl sold\upl
    mi\upl dod\upl re\upl\mbreak

    %40
    si r si
    mi r re
    dod dod re

    %43
    mi dod mi
    re8 fad si4 mi,
    la r fad

    %46
    sol si si
    la r dod\fo\mbreak
    la4 dod2

    %49
    fad,4 r r
    R2.*2
    r8 dod16 mi la8 la la la

    %53
    la4 r r
    r8 dod,16 mi la8 la la la
    la4 r r

    %56
    mi la la\mbreak
    la r r
    R2.*9

    %67
    r8 dod,\tu[dod re mi sold]
    mi4 r r
    r8 re[dod re mi sold]

    %70
    mi fad mi[re] mi re
    la' mi re[la'] la la
    la4 la\p\upl sol\upl

    %73
    fad fad mi
    red red dod
    si r8 mi\fo[fad red]

    %76
    mi4 r r
    mi\p mi re!
    dod dod si

    %79
    la r8 re\fo[mi dod]
    re4 r r\mbreak
    r si' r

    %82
    r lad fad
    fad r r
    sold\upl\p sold\upl sold\upl

    %85
    la!\upl r r
    fad\upl fad\upl fad\upl
    sol!\upl r r\mbreak

    %88
    mi\upl mi\upl mi\upl
    fad\upl r r
    R2.*2

    %92
    r4 la\upl sol\upl
    red\upl mi\upl r
    R2.*2\mbreak

    %96
    fad8 re16 fad si8 si si si
    si4 r r
    r8 re,16 fad si8 si si si

    %99
    si4 r r
    r8 re,16 fad si8 si si si
    sol4 r8 mi [mi mi]

    %102
    mi dod16 mi la8 la la la
    fad4 r8 re[re re]\mbreak
    re si16 re sol8 sol sol sol

    %105
    dod,4 r8 dod[dod dod]
    dod4 r r
    R2.*9

    %116
    r4 r re'\p
    dod r re\mbreak
    la r re

    %119
    dod r re
    la r r
    la,8\fo fad16 la re8 re re re

    %122
    re4 r r
    r8 fad,16 la re8 re re re
    re4 r r\mbreak

    %125
    r8 fad16 la re8 re re re
    re,4 re re
    re r r

    %128
    r8 sol16 si mi8 mi mi mi
    mi,4 mi mi
    mi r r

    %131
    R2.*4
    la4\fo la sol
    fad fad mi

    %137
    fad r r
    R2.\mbreak
    sol4 sol fad

    %140
    mi mi re
    mi r r
    R2.

    %143
    re'4\p re re
    dod dod dod\mbreak
    re re re

    %146
    dod dod dod
    re r8 fad,\fo[sol la]
    re,4 r re

    %149
    si r8 sol'[la si]
    mi,4 r mi\mbreak
    la, r r

    %152
    R2.*4
    la'4\upl\fo si\upl la\upl
    la\upl\p si\upl la\upl

    %158
    la\upl\fo la\upl sold\upl
    mi\upl dod\upl re\upl
    si\upl r si\mbreak

    %161
    mi r re
    dod dod re
    mi dod mi

    %164
    re8 fad sol4 mi
    fad2.~
    fad~

    %167
    fad~\mbreak
    fad~
    fad~

    %170
    fad
    si,4\fo mi mi
    mi mi mi

    %173
    mi dod2
    re'8 dod16 si la8 sol fad mi
    fad[si la sol fad mi]

    %176
    fad mi16 re la'4 la,
    re2.

}

IIIbcn = \relative do {

    re4 re re
    re r r
    re re re

    %4
    re r r
    r re' re
    fad, fad fad

    %7
    sol r r
    r mi' mi\mbreak
    sol, sol sol

    %10
    la r r
    r8 fad[mi re dod si]
    la re' dod[si] la si

    %13
    dod si16 la si8[dod] re dod
    re4 la r
    fad fad mi

    %16
    red red dod
    si r8 mi[red si]\mbreak
    mi4 r r

    %19
    mi mi re
    dod dod si
    la r8 re[dod la]

    %22
    re4 r r
    R2.*4
    r4 r8 re[mi fad]

    %28
    sol4 r si
    sol r8 mi[fad sold]
    la4 r dod,

    %31
    re r8 re[mi fad]
    sol4 r8 mi[fad sol]\mbreak
    la4 r8 fad[sol la]

    %34
    si4 r8 sol[la si]
    dod!4 r8 la[si dod]
    re4\upl si\upl dod\upl

    %37
    re\upl\p si\upl dod\upl
    re\fo\upl dod\upl si\upl
    la\upl sol\upl fad\upl\mbreak
    mi r re
    dod r si

    %42
    la la' si,
    dod la' dod,
    re8 si' sol4 la

    %45
    fad r si
    mi,\p mi' re
    dod r la\fo\mbreak

    %48
    re8 fad, la4 la,
    re2 dod4\p^\markup\italic"Cemb."
    re2 si'4

    %51
    fad2 sol4
    la la,\fo\tu la
    la' r r

    %54
    r la, la
    la' r r
    la la, la'\mbreak

    %57
    re,4 r r
    r re\p^\markup\italic"Cemb." si'
    fad re fad

    %60
    sol r r
    R2.*2
    r4 mi dod'

    %64
    sold mi sold\mbreak
    la r r
    R2.

    %67
    r8 fad\tu mi [re] dod si
    la4 r r
    r8 fad' mi[re] dod si

    %70
    la re' dod[si] la si
    dod si16 la si8[dod] re dod
    re4 la r\mbreak

    %73
    R2.*2
    r4 r8 mi[red si]
    mi4 r r

    %77
    R2.*2
    r4 r8 re![dod la]
    re4 r r\mbreak

    %81
    re r sol
    dod, r fad
    si, si\upl\p^\markup\italic"Cemb." si\upl

    %84
    si'\upl si\upl si\upl
    la la, la
    la' la la

    %87
    sol sol, sol\mbreak
    sol'\upl sol\upl sol\upl
    fad\upl r fad\upl

    %90
    sol\upl r mi\upl
    fad\upl re\upl lad'\upl
    si\upl r r

    %93
    r r re
    dod re dod8 si
    lad dod16 si lad8[dod] fad, la?\mbreak

    %96
    si,4\tu\fo si si
    si r r
    r si si

    %99
    si r r
    r si' si
    mi, r8 mi[fad sol]

    %102
    la4 la la
    re, r8 re[mi fad]\mbreak
    sol4 sol sol

    %105
    dod, r8 dod[re mi]
    fad4 r r
    r fad'\p^\markup\italic"Cemb." re

    %108
    lad2 fad4
    si r r
    R2.*2\mbreak

    %112
    r4 mi dod
    sold2 mi4
    la r r

    %115
    R2.*5
    r8 si[la sol fad mi]
    re4\fo\tu re re

    %122
    re r r
    r re re
    re r r\mbreak

    %125
    r re' re
    fad, fad fad
    sol r r

    %128
    r mi' mi
    sol, sol sol
    la r r

    %131
    R2.\mbreak
    r8 re^\markup\italic"Cemb."[dod si la si]
    dod si16 la si8 dod re dod

    %134
    re4 la sol
    fad\fo\tu fad mi
    red red dod

    %137
    si r r
    R2.
    mi4 mi re

    %140
    dod dod si
    la r r
    R2.*5

    %147
    r4 r8 re\fo[mi fad]
    sol4 r si
    sol r8 mi[fad sold]

    %150
    la4 r dod,\mbreak
    re4 r8re^\markup\italic"Cemb."\p[mi fad]
    sol4 r8 mi[fad sol]

    %153
    la4 r8 fad[sol la]
    si4 r8 sol[la si]\mbreak
    dod4 r8 la[si dod]

    %156
    re4\upl\tu\fo si\upl dod\upl
    re\upl\p si\upl dod\upl
    re\upl\fo dod\upl si\upl

    %159
    la\upl sol\upl fad\upl
    mi r re\mbreak
    dod r si

    %162
    la la' si,
    dod la' dod,
    re8 si' sol4 la

    %165
    re,4 re\p^\markup\italic"Cemb." re
    re re re
    si si si\mbreak

    %168
    si si si
    fad' fad fad
    fad fad fad

    %171
    mi\fo\tu mi re
    dod la' dod,
    re8 fad la4 la,

    %174
    re'8 dod16 si la8[sol] fad mi
    fad[si la sol fad mi]
    fad mi16 re la'4 la,

    %177
    re2.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}



forma = {

    \time 3/4
    \key re\major
    \tempo 2. = 42
    s2.*176
    s2.\fermata
    \bar "|."


}


IIIflI = {
    \IIIglobal
    %\notypeset
    <<\IIIflIn \forma>>
}


IIIflII = {
    \IIIglobal
    <<\IIIflIIn \forma>>
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


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}
#(set-global-staff-size 16.0)

\pointAndClickOff


\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge"[1.] Allegro"

\score {
    {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \small \center-column{"Flûte Trav. I""e Concertino"}
                    \set Staff.midiInstrument = #"flute"
                    \IflI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \small \center-column{"Flûte Trav. II""e Concertino"}
                    \set Staff.midiInstrument = #"flute"
                    \IflII
                >>
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Cembalo""[e Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>
    }

    \layout {

        indent = 1.4\cm

        \context	{
            %\Staff \RemoveEmptyStaves
        }

        \context	{
            \Score
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)  %aumenta lo spazio orizzontale
            skipBars = ##t
        }

    }

    \midi { }

}

\pageBreak

\markup\huge"[2.] Andante"

\score {
    {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIflI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIflII
                >>
            >>

            \new ChoirStaff <<

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
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>
    }

    \layout {

        indent = 0.5\cm

        \context	{
            %\Staff \RemoveEmptyStaves
        }

        \context	{
            \Score
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)  %aumenta lo spazio orizzontale
            skipBars = ##t
        }

    }

    \midi { }

}

\pageBreak

\markup\huge"[3.] Allegro"

\score {
    {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIflI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIflII
                >>
            >>

            \new ChoirStaff <<

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
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>
    }

    \layout {
        indent = 0.5\cm

        \context	{
            %\Staff \RemoveEmptyStaves
        }

        \context	{
            \Score
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)  %aumenta lo spazio orizzontale
            skipBars = ##t
        }

    }

    \midi { }

}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}
