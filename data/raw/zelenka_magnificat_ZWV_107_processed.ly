\language "italiano"
	%********************************** VARIABILI
\version "2.24.0"

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
      \musicglyph "scripts.prall"}}

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }



IobIn = \relative do'' {

    sol2 la(
    do2.) do4
    do2 do

    %4
    do4 do si2\mbreak
    do la~
    la4 la sol r

    %7
    do4. do8 do4 si~
    si8 la la8. la16 si4 r\mbreak
    R1*3
    r2 r4 r8 sol'

    %13
    la, fa' r mi fa, re' mi,16 do'(re do)
    fad, do'(re do) re, do'(re do) si do re8~re16 fad, mi re
    mi8 do' re, do' si16\p(do) re8~re16 fa, mi re

    %16
    mi8 do'\f re, si' do [do,] r4\mbreak
    R1
    r2 r4 r8 sol''\f

    %19
    la, fa' r mi fa, re' sol,4
    R1*3
    r4 sol16\f sol' \parenthesize (la sol) dod, sol' \parenthesize (la sol) la, sol' \parenthesize (la sol)

    %24
    fad sol la8~la16 do,? si la si8 sol' sol,4
    R1*11
    r4 sol16\f sol' (la sol) dod, sol'(la sol) la, sol'(la sol)\mbreak

    %37
    fad16 sol la8~la16 do, si la si8 sol' la, sol'
    fad16\p sol la8~la16 do, si la si8 sol' la, fad'
    sol4 r r2

    %40
    R1*6
    r4 r8 mi\f [fa, re'] r do
    re, si'~si la16 sold la(si) do(re) mi8(fa)

    %48
    sold, fad mi4 r2
    R1*13
    r4 r8 sol'\f la, fa' r mi

    %63
    fa, re' mi,16 do'(re do) fad, do'(re do) re, do'(re do)
    si do re8~re16 fa, mi re mi8 do' re, do'\mbreak
    si16 \p do re8~re16 fa, mi re mi8 do' sol16\f la sib8~

    %66
    sib la16 sol la fa' \parenthesize (sol fa) si, fa' \parenthesize  (sol fa) sol, fa' \parenthesize  (sol fa)
    mi fa sol8 ~sol16 sib, la sol la8 fa' sol, fa'
    mi16\p fa sol8~sol16 sib, la sol la8 \caesura fa' sol, mi'\mbreak

    %69
    do2 re(
    fa2.) fa4
    fa2 fa

    %72
    fa4 fa mi2\mbreak %% va a p. 14
    fa re~
    re4 re do2

    %75
    fa4. fa8 fa4 mi~
    mi8 re re8. re16 mi2
    R1*2

    %79
    r2 r4 do,16\f do'\parenthesize (re do)
    fad, do'(re do) re, do'(re do) si!8 -! re-! sol,4
    R1*2
    r4 la16 la'\f(si la) red, la'(si la) si, la' (si la)

    %84
    sold(la si8) mi, do, r2
    R1
    r4 fa16\f fa'\parenthesize (sol fa) si,! fa'\parenthesize (sol fa) sol, fa'\parenthesize (sol fa)

    %87
    mi8-! sol-! do,4 r2
    R1
    r2 r8 re,16\f re fa fa la la

    %90
    fa re32 mi fa16 re fa re fa la re8 re, r4
    R1*2
    r8 fa16 fa la la do do la fa32 sol la16 fa la fa la do

    %94
    fa8 fa, r4 r2
    r r8 do16\f do mi mi sol sol
    mi do32 re mi16 do mi do mi sol do8 do, r4

    %97
    R1*4
    r2 r8 sol'16\f sol si si re re
    si sol32 la si16 sol si sol si re sol8 sol, r4

    %103
    R1*5
    r4 r8 sol'\f la, fa' r mi\mbreak
    fa, re' mi,16 do'(re do) fad, do'(re do) re, do'(re do)
    sol2 la(

    %111
    do2.) do4
    do2 do\mbreak
    do4 do si2

    %114
    do la~
    la4 la sol r
    do4. do8 do4 si~

    %117
    si8 la la8. la16 si4 re16\f sol(la sol)
    dod,(sol' la sol) la, sol'(la sol) fad8 sol la, fad'
    sol2 r r    %%% inizia 3/2
    R1.

    %121
    R
    r2 r re\mbreak
    re4 si(do) fad la do,

    %124
    do2 si r
    R1.*50
    la'2\f mi fa\mbreak

    %176
    sol re mi
    fa1.
    mib

    %179
    re
    dod2 re4 mi fa2~
    fa4 re mi2. fa4\mbreak   %%% fine 3/2

    %182
    do2 re(
    fa2. )fa4
    fa2 fa

    %185
    fa4 fa mi2
    fa re~
    re4 re do2

    %188
    fa4. fa8 fa4 mi8 mi
    re4. re8 mi4
    do,16 do' re do %% fine prima riga p.28

    %190
    fad, do' re do re, do' re do si8 sol' la, fad'
    sol4 r r2
    R1*6
    r4 r8 mi fa, re' r do

    %199
    re, si'~si la16 sold la(si) do(re) mi8(fa)
    sold,(fad) mi4 r2
    R1*14

    %215
    r8 sol' la, fa' r mi fa, re'
    sol,2 la(
    do2.) do4

    %218
    do2 do
    do4 do si2
    do la~

    %221
    la4 la sol r\mbreak
    R1

    %223
    r2 r4 r8 sol'
    la, fa' r mi fa, re' mi,16 do'(re do)
    fad, do'(re do) re, do'(re do) si(do re8)~re16 fad, mi re\mbreak

    %226
    mi8 do' re, do' si16\p do re8~re16 fa,? mi re
    mi8 do' re, si' do\f mi sol4
    sol8 mi sol4~sol8_\markup\italic "ad[agio]" fa16 mi fad8. sol16

    %229
    sol2 r

}

IobIIn = \relative do'' {

    r2 do,
    mi4(sol4.) sol8 sol4~
    sol fa la4. la8

    %4
    sol4 sol2  sol4
    sol mi fa4.(sol8)
    la [sol] fad16[sol la8] si[la sol fa?]

    %7
    mi [fa sol mi] fad!16 [sol] la4 sol8~
    sol [fad16 mi] fad8. fad16 sol4 r\mbreak
    R1*3
    r2 r4 r8 sol'

    %13
    la, fa' r mi fa, re' mi,16 do'(re do)
    fad, do'(re do) re, do'(re do) si do re8~re16 fad, mi re
    mi8 do' re, do' si16\p(do) re8~re16 fa, mi re

    %16
    mi8 do'\f re, si' do [do,] r4\mbreak
    R1
    r2 r4 r8 sol''\f

    %19
    la, fa' r mi fa, re' sol,4
    R1*3
    r4 sol16\f sol' \parenthesize (la sol) dod, sol' \parenthesize (la sol) la, sol' \parenthesize (la sol)

    %24
    fad sol la8~la16 do,? si la si8 sol' sol,4
    R1*11
    r4 sol16\f sol' (la sol) dod, sol'(la sol) la, sol'(la sol)\mbreak

    %37
    fad16 sol la8~la16 do, si la si8 sol' la, sol'
    fad16\p sol la8~la16 do, si la si8 sol' la, fad'
    sol4 r r2

    %40
    R1*6
    r4 r8 mi\f [fa, re'] r do
    re, si'~si la16 sold la(si) do(re) mi8(fa)

    %48
    sold, fad mi4 r2
    R1*13
    r4 r8 sol'\f la, fa' r mi

    %63
    fa, re' mi,16 do'(re do) fad, do'(re do) re, do'(re do)
    si do re8~re16 fa, mi re mi8 do' re, do'\mbreak
    si16 \p do re8~re16 fa, mi re mi8 do' sol16\f la sib8~

    %66
    sib la16 sol la fa' \parenthesize (sol fa) si, fa' \parenthesize  (sol fa) sol, fa' \parenthesize  (sol fa)
    mi fa sol8 ~sol16 sib, la sol la8 fa' sol, fa'
    mi16\p fa sol8~sol16 sib, la sol la8 \caesura fa' sol, mi'\mbreak

    %69
    r2 fa,
    la4(do2) do4
    do si8[do] re4. re8

    %72
    do4. la8 sol4. sol8\mbreak
    do,4 do'4. do8 la4
    sol sol2 la4~

    %75
    la8 si! do[ la] si [la] sol [fa16 mi]
    fa8[la] sol8. sol16 sol2
    R1*2

    %79
    r2 r4 do,16\f do'\parenthesize (re do)
    fad, do'(re do) re, do'(re do) si!8 -! re-! sol,4
    R1*2
    r4 la16 la'\f(si la) red, la'(si la) si, la' (si la)

    %84
    sold(la si8) mi, do, r2
    R1
    r4 fa16\f fa'\parenthesize (sol fa) si,! fa'\parenthesize (sol fa) sol, fa'\parenthesize (sol fa)

    %87
    mi8-! sol-! do,4 r2
    R1
    r2 r8 re,16\f re fa fa la la

    %90
    fa re32 mi fa16 re fa re fa la re8 re, r4
    R1*2
    r8 fa16 fa la la do do la fa32 sol la16 fa la fa la do

    %94
    fa8 fa, r4 r2
    r r8 do16\f do mi mi sol sol
    mi do32 re mi16 do mi do mi sol do8 do, r4

    %97
    R1*4
    r2 r8 sol'16\f sol si si re re
    si sol32 la si16 sol si sol si re sol8 sol, r4

    %103
    R1*5
    r4 r8 sol'\f la, fa' r mi\mbreak
    fa, re' mi,16 do'(re do) fad, do'(re do) re, do'(re do)

    %110
    r2 do,
    mi4(sol4.) sol8 sol4~
    sol fa la4. la8\mbreak

    %113
    sol4 sol2 sol4
    sol mi fa4. (sol8)
    la[sol] fad16[sol la8] si[la sol fa]

    %116
    mi[fa sol mi] fad16[sol] la4 sol8~\mbreak
    sol[fad16 mi] fad8. fad16 sol4 re'16\f sol(la sol)
    dod,(sol' la sol) la, sol'(la sol) fad8 sol la, fad'

    %119
    sol2 r r    %%% inizia 3/2
    R1.

    %121
    R
    r2 r sol,\mbreak
    si2 la la

    %124
    sol1 r2
    R1.*50
    do1.\f\mbreak

    %176
    sib
    la4 sib do sib8 do re4 sol,~
    sol la sib la8 sib do4 fa,~

    %179
    fa sol la sol8 la sib4 sol
    mi2 fa4 sol la2 ~
    la4 sib? sol2. la4\mbreak

    %182  %% riprende il 4/4
    r2 fa
    la4(do2) do4

    %184
    do sib8[do] re4. re8
    do4. la8 sol4. sol8
    do,4 do'4. si8 la4

    %187
    sol sol2 la4~
    la8 [si!] do[la] si[la] sol[fa16 mi]
    fa8[la] sol8. sol16 sol4 do,16 do' re do %% fine prima riga p.28

    %190
    fad, do' re do re, do' re do si8 sol' la, fad'
    sol4 r r2
    R1*6
    r4 r8 mi fa, re' r do

    %199
    re, si'~si la16 sold la(si) do(re) mi8(fa)
    sold,(fad) mi4 r2
    R1*14

    %215
    r8 sol' la, fa' r mi fa, re'
    r2 do,
    mi4(sol4.) sol8 sol4~

    %218
    sol fa la4. la8
    sol4 sol2 sol4
    sol mi fa4. (sol8)

    %221
    la8[sol] fad[sol16 la] si4 r
    R1

    %223
    r2 r4 r8 sol'
    la, fa' r mi fa, re' mi,16 do'(re do)
    fad, do'(re do) re, do'(re do) si(do re8)~re16 fad, mi re\mbreak

    %226
    mi8 do' re, do' si16\p do re8~re16 fa,? mi re
    mi8 do' re, si' do\f mi sol4
    sol8 mi sol4~sol8_\markup\italic "ad[agio]" fa16 mi fad8. sol16

    %229
    sol2 r

}


IvlIn = \relative do'' {

    do,8 re mi do fa [fa fa mi16 re]
    do8 re mi re do re mi do
    fa fa16 sol la8 sol fa sol, la si

    %4
    do re mi do sol' sol, sol' fa
    mi re do do' fa, sol la sol
    fad mi re fad sol, sol'16 fad mi8 re

    %7
    do re mi do re fad sol sol,
    re' do re re sol,4 r8 do'
    re do re do16 si do si do8~do16 mi re do

    %10
    re do si la sol la sol fa mi8. re16 do4
    R1
    r2 r4 r8 sol''_\markup \italic\center-align "stac[cato]"\mbreak

    %13
    la, fa' r mi fa, re' mi,16 do'(re do)
    fad, do'(re do) re, do'(re do) si do re8~re16 fad, mi re
    mi8 do' re, do' si16\p(do) re8~re16 fa, mi re

    %16
    mi8 do'\f re, si' do [do,] r4\mbreak
    R1
    r2 r4 r8 sol''\f

    %19
    la, fa' r mi fa, re' sol,4
    R1*3
    r4 sol16\f sol' \parenthesize (la sol) dod, sol' \parenthesize (la sol) la, sol' \parenthesize (la sol)

    %24
    fad sol la8~la16 do,? si la si8 sol' sol,4\mbreak
    r2 sol'4 r
    sol r sol r

    %27
    r2 r4 sol,,16\p sol' (la sol)
    dod, sol'(la sol) la, sol'(la sol) fad sol la8~la16 dod, si la
    sol8 sol' sol,4 r2

    %30
    si'16\p re(mi re) la8 re fad,re r4
    sol16 re'(mi re) la8 re fad, re r4
    re16 re'(mi re) sol, sol'(la sol) fad8 sol16 (la) re,4\mbreak

    %33
    r2 r4 sol,16 sol'(la sol)
    fad8 sol16(la) re,4 r2
    R1

    %36
    r4 sol,16\f sol' (la sol) dod, sol'(la sol) la, sol'(la sol)\mbreak
    fad16 sol la8~la16 do, si la si8 sol' la, sol'
    fad16\p sol la8~la16 do, si la si8 sol' la, fad'

    %39
    <sol si, re, sol,>4 r sol r
    sol r sol r\mbreak
    R1

    %42
    r4 r8 re [mi, do'] r si
    do, la r4 la'' r
    la r la r\mbreak

    %45
    R1
    r4 r8 mi\f [fa, re'] r do
    re, si'~si la16 sold la(si) do(re) mi8(fa)

    %48
    sold, fad mi4 r mi'16 (fa mi8)\mbreak
    la,4 r r2
    la'16\p(sib la8) re,4 r2

    %51
    r4 re16(dod re8) fa,4 r
    mi'16(fa mi8) sold,4 r si16(do si8)\mbreak
    mi,4 r r2

    %54
    r2 mi'16(re) do4 re16(mi)
    re(do) si4 do16(re) do8 la r4
    R1

    %57 OOKK fine p. 11
    r2 r4 mi'16\parenthesize (fa mi8)
    la,4 r r2
    r sol'16\p(fa) mi4 fa16(sol)

    %60
    fa\parenthesize (mi) re4 mi16\parenthesize (fa) mi8 do r4\mbreak
    R1
    r4 r8 sol'\f la, fa' r mi

    %63
    fa, re' mi,16 do'(re do) fad, do'(re do) re, do'(re do)
    si do re8~re16 fa, mi re mi8 do' re, do'\mbreak
    si16 \p do re8~re16 fa, mi re mi8 do' sol16\f la sib8~

    %66
    sib la16 sol la fa' \parenthesize (sol fa) si, fa' \parenthesize  (sol fa) sol, fa' \parenthesize  (sol fa)
    mi fa sol8 ~sol16 sib, la sol la8 fa' sol, fa'
    mi16\p fa sol8~sol16 sib, la sol la8 \caesura fa' sol, mi'\mbreak

    %69
    fa,8 sol la fa  sib sib, sib' la16 sol
    fa8 sol la sol fa sol la fa
    sib sib,16 do re8 do sib do re mi

    %72
    fa sol la fa do' do, do' sib?\mbreak  %%% vai a 14 prima riga
    la sol fa la sib do re do
    si! la sol si do sib la sol

    %75
    fa sol la fa sol si! do do,
    fa fa sol sol, do4 do16 do'(re do)
    la fa'(mi fa) fa,\f fa'(mi fa) fa,4 r

    %78
    r do'16\p fa(sol fa) sib, fa'(sol fa) sib, sol'(la sol)
    do,8 do, r4 r do16\f do'\parenthesize (re do)
    fad, do'(re do) re, do'(re do) si!8 -! re-! sol,4\mbreak

    %81
    r2 do,16 fa'(sol fa) r4
    r sol,16 re'(dod re) r2
    r4 la16 la'\f(si la) red, la'(si la) si, la' (si la)

    %84
    sold(la si8) mi, do,\p re16 re'(mi re) la mi'(fa mi)\mbreak
    la,4 r r2
    r4 fa16\f fa'\parenthesize (sol fa) si,! fa'\parenthesize (sol fa) sol, fa'\parenthesize (sol fa)

    %87
    mi8-! sol-! do,4 r2
    R1\mbreak
    r2 r8 re,16\f re fa fa la la

    %90
    fa re32 mi fa16 re fa re fa la re8 re, r4
    R1*2\mbreak
    r8 fa16 fa la la do do la fa32 sol la16 fa la fa la do

    %94
    fa8 fa, r4 r2
    r r8 do16\f do mi mi sol sol
    mi do32 re mi16 do mi do mi sol do8 do, r la'\pp\mbreak

    %97
    si16(do) re4 do16(si) la8 la, la'[do]
    si4.(la4) sold16(fad) sold8 r16 sold\f
    la8 sol?16 fa? mi fa mi re do8 la r4

    %100
    R1
    r2 r8 sol'16\f sol si si re re
    si sol32 la si16 sol si sol si re sol8 sol, r4

    %103
    r2 r8 sol16 sol si si re re
    si8 sol r4 r2\mbreak
    r r8 sol16 sol si si re re

    %106
    si8 sol r4 lab2\p
    sol8 si! do4. si16 la si8. si16
    do8 do, r sol''\f la, fa' r mi\mbreak

    %109
    fa, re' mi,16 do'(re do) fad, do'(re do) re, do'(re do)
    si8 sol16 fa mi8 do fa fa fa mi16 re
    do8 re mi re do re mi do

    %112
    fa fa16 sol la8 sol fa sol la si\mbreak
    do, re mi do sol' sol, sol' fa
    mi re do do' fa, sol la sol

    %115
    fad mi re fad sol, sol'16 fad mi8 re
    do re mi do re fad sol sol,\mbreak
    re' do re re  sol,4 re''16\f sol(la sol)

    %118
    dod,(sol' la sol) la, sol'(la sol) fad8 sol la, fad'
    <sol si, re, sol,>2 r r    %%% inizia 3/2
    R1.

    %121
    R
    r2 r re\mbreak
    re4 si(do) fad la do,

    %124
    do2 si r
    R1.*4
    r2 r r4 sol\pp

    %130
    la2(sol) r
    do si sol4 si
    la1 r2

    %133
    R1.*4
    r2 mi'\p\solo si
    do (si) r

    %139
    r mi si
    do(si) r
    R1.

    %142
    fa'1.
    mi\mbreak
    re~

    %145
    re2 mi4 re do2~
    do4 re si1
    la2 la' mi

    %148
    fa(mi) r
    r la mi
    fa(mi) r

    %151
    r r la~\mbreak
    la sol1\parenthesize ~
    sol2 fa1~

    %154
    fa2 mi1~
    mi2 re4 dod re2~
    re4 mi dod2. re4

    %157
    re2 r r
    R1.*3
    do2. sib4 la sol

    %162
    fa la re2 r
    R1.*3
    sol2 re mi

    %167
    fa1.\mbreak
    mib
    re

    %170
    dod2 re4 mi fa2~
    fa4 re mi1~
    mi2 re4 dod re2 ~

    %173
    re do?4 si do re8(mi)
    fa4 re si2. la4
    la'2\tu\f mi fa\mbreak

    %176
    sol re mi
    fa1.
    mib

    %179
    re
    dod2 re4 mi fa2~
    fa4 re mi2. fa4\mbreak   %%% fine 3/2

    %182  %% riprende il 4/4
    fa,8 sol la fa sib [sib, sib' la16 sol]
    fa8 sol la sol fa sol la fa

    %184
    sib sib,16 do re8 do sib do re mi
    fa sol la fa do' do, do' sib\mbreak
    la sol fa la sib do re do

    %187
    si! la sol si do sib la sol
    fa sol la fa sol si! do do,
    fa fa sol, sol' do,4 do16\tu do' re do %% fine prima riga p.28

    %190
    fad, do' re do re, do' re do si8 sol' la, fad'
    sol4 r sol r
    sol r sol r

    %193
    R1
    r4 r8 re[mi, do'] r si
    do, la r4 la'' r

    %196
    la r la r
    R1
    r4 r8 mi\tu fa, re' r do

    %199
    re, si'~si la16 sold la(si) do(re) mi8(fa)
    sold,(fad) mi4 r mi'16(fa mi8)
    la,4 r r2\mbreak

    %202
    r4  la'16\p(si la8) re,4 r
    r re16(dod re8) fa,4 r
    mi'16(fa mi8) sold,4 r si16(do si8)

    %205
    mi,4 r r2\mbreak
    r mi'16(re) do4 re16(mi)
    re(do) si4 do16(re) do8 la r4

    %208
    R1
    r4 la16\f la' si la red, la' si la si, la' si la
    sold(la si8) mi,4 r mi16(fa mi8)

    %211
    la,4 r r2
    r sol'16(fa) mi4 fa16(sol)
    fa16(mi) re4 mi16(fa) mi8 do r4\mbreak

    %214
    R1
    r8 sol' la, fa' r mi fa, re'
    mi, re mi do fa[fa fa mi16 re]

    %217
    do8 re mi re do re mi do\mbreak
    fa [fa16 sol la8 sol] fa sol, la si
    do re mi do sol' sol, sol' fa

    %220
    mi re do do' fa, sol la sol
    fad mi re fad sol, sol'16 fa? mi8 re\mbreak
    R1

    %223
    r2 r4 r8 sol'
    la, fa' r mi fa, re' mi,16 do'(re do)
    fad, do'(re do) re, do'(re do) si(do re8)~re16 fad, mi re\mbreak

    %226
    mi8 do' re, do' si16\p do re8~re16 fa,? mi re
    mi8 do' re, si' do\f mi sol4
    sol8 mi sol4~sol8_\markup\italic "ad[agio]" fa16 mi fad8. sol16

    %229
    sol2 r

}

IvlIIn = \relative do'' {

    do,8 re mi do fa [fa fa mi16 re]
    do8 re mi re do re mi do
    fa fa16 sol la8 sol fa sol, la si

    %4
    do re mi do sol' sol, sol' fa
    mi re do do' fa, sol la sol
    fad mi re fad sol, sol'16 fad mi8 re

    %7
    do re mi do re fad sol sol,
    re' do re re sol,4 r8 sol'
    la8 sol la sol16 fa mi8. fa16 sol8 la~

    %10
    la sol~sol16 la sol fa mi8. re16 do4
    R1
    r2 r4 r8 sol''\mbreak

    %13
    la, fa' r mi fa, re' mi,16 do'(re do)
    fad, do'(re do) re, do'(re do) si do re8~re16 fad, mi re
    mi8 do' re, do' si16\p(do) re8~re16 fa, mi re

    %16
    mi8 do'\f re, si' do [do,] r4\mbreak
    R1
    r2 r4 r8 sol''\f

    %19
    la, fa' r mi fa, re' sol,4
    R1*3
    r4 sol16\f sol' \parenthesize (la sol) dod, sol' \parenthesize (la sol) la, sol' \parenthesize (la sol)

    %24
    fad sol la8~la16 do,? si la si8 sol' sol,4\mbreak
    r2 sol'4 r
    sol r sol r

    %27
    r2 r4 sol,,16\p sol' (la sol)
    dod, sol'(la sol) la, sol'(la sol) fad sol la8~la16 dod, si la
    sol8 sol' sol,4 r2

    %30
    si'16\p re(mi re) la8 re fad,re r4
    sol16 re'(mi re) la8 re fad, re r4
    re16 re'(mi re) sol, sol'(la sol) fad8 sol16 (la) re,4\mbreak

    %33
    r2 r4 sol,16 sol'(la sol)
    fad8 sol16(la) re,4 r2
    R1

    %36
    r4 sol,16\f sol' (la sol) dod, sol'(la sol) la, sol'(la sol)\mbreak
    fad16 sol la8~la16 do, si la si8 sol' la, sol'
    fad16\p sol la8~la16 do, si la si8 sol' la, fad'

    %39
    <sol si, re, sol,>4 r sol r
    sol r sol r\mbreak
    R1

    %42
    r4 r8 re [mi, do'] r si
    do, la r4 la'' r
    la r la r\mbreak

    %45
    R1
    r4 r8 mi\f [fa, re'] r do
    re, si'~si la16 sold la(si) do(re) mi8(fa)

    %48
    sold, fad mi4 r mi'16 (fa mi8)\mbreak
    la,4 r r2
    la'16\p(sib la8) re,4 r2

    %51
    r4 re16(dod re8) fa,4 r
    mi'16(fa mi8) sold,4 r si16(do si8)\mbreak
    mi,4 r r2

    %54
    r2 mi'16(re) do4 re16(mi)
    re(do) si4 do16(re) do8 la r4
    R1

    %57 OOKK fine p. 11
    r2 r4 mi'16\parenthesize (fa mi8)
    la,4 r r2
    r sol'16\p(fa) mi4 fa16(sol)

    %60
    fa\parenthesize (mi) re4 mi16\parenthesize (fa) mi8 do r4\mbreak
    R1
    r4 r8 sol'\f la, fa' r mi

    %63
    fa, re' mi,16 do'(re do) fad, do'(re do) re, do'(re do)
    si do re8~re16 fa, mi re mi8 do' re, do'\mbreak
    si16 \p do re8~re16 fa, mi re mi8 do' sol16\f la sib8~

    %66
    sib la16 sol la fa' \parenthesize (sol fa) si, fa' \parenthesize  (sol fa) sol, fa' \parenthesize  (sol fa)
    mi fa sol8 ~sol16 sib, la sol la8 fa' sol, fa'
    mi16\p fa sol8~sol16 sib, la sol la8 \caesura fa' sol, mi'\mbreak

    %69
    fa,8 sol la fa  sib sib, sib' la16 sol
    fa8 sol la sol fa sol la fa
    sib sib,16 do re8 do sib do re mi

    %72
    fa sol la fa do' do, do' sib?\mbreak  %%% vai a 14 prima riga
    la sol fa la sib do re do
    si! la sol si do sib la sol

    %75
    fa sol la fa sol si! do do,
    fa fa sol sol, do4 do16 do'(re do)
    la fa'(mi fa) fa,\f fa'(mi fa) fa,4 r

    %78
    r do'16\p fa(sol fa) sib, fa'(sol fa) sib, sol'(la sol)
    do,8 do, r4 r do16\f do'\parenthesize (re do)
    fad, do'(re do) re, do'(re do) si!8 -! re-! sol,4\mbreak

    %81
    r2 do,16 fa'(sol fa) r4
    r sol,16 re'(dod re) r2
    r4 la16 la'\f(si la) red, la'(si la) si, la' (si la)

    %84
    sold(la si8) mi, do,\p re16 re'(mi re) la mi'(fa mi)\mbreak
    la,4 r r2
    r4 fa16\f fa'\parenthesize (sol fa) si,! fa'\parenthesize (sol fa) sol, fa'\parenthesize (sol fa)

    %87
    mi8-! sol-! do,4 r2
    R1\mbreak
    r2 r8 re,16\f re fa fa la la

    %90
    fa re32 mi fa16 re fa re fa la re8 re, r4
    R1*2\mbreak
    r8 fa16 fa la la do do la fa32 sol la16 fa la fa la do

    %94
    fa8 fa, r4 r2
    r r8 do16\f do mi mi sol sol
    mi do32 re mi16 do mi do mi sol do8 do, r la'\pp\mbreak

    %97
    si16(do) re4 do16(si) la8 la, la'[do]
    si4.(la4) sold16(fad) sold8 r16 sold\f
    la8 sol?16 fa? mi fa mi re do8 la r4

    %100
    R1
    r2 r8 sol'16\f sol si si re re
    si sol32 la si16 sol si sol si re sol8 sol, r4

    %103
    r2 r8 sol16 sol si si re re
    si8 sol r4 r2\mbreak
    r r8 sol16 sol si si re re

    %106
    si8 sol r4 lab2\p
    sol8 si! do4. si16 la si8. si16
    do8 do, r sol''\f la, fa' r mi\mbreak

    %109
    fa, re' mi,16 do'(re do) fad, do'(re do) re, do'(re do)
    si8 sol16 fa mi8 do fa fa fa mi16 re
    do8 re mi re do re mi do

    %112
    fa fa16 sol la8 sol fa sol la si\mbreak
    do, re mi do sol' sol, sol' fa
    mi re do do' fa, sol la sol

    %115
    fad mi re fad sol, sol'16 fad mi8 re
    do re mi do re fad sol sol,\mbreak
    re' do re re  sol,4 re''16\f sol(la sol)

    %118
    dod,(sol' la sol) la, sol'(la sol) fad8 sol la, fad'
    <sol si, re, sol,>2 r r    %%% inizia 3/2
    R1.

    %121
    R
    r2 r sol,\mbreak
    si2 la la

    %124
    sol1 r2
    R1.*4
    r2 r r4 re\pp

    %130
    mi2(re) r
    la'2 re, mi
    fad1 r2

    %133
    R1.*42
    do'1.\f\mbreak

    %176
    sib
    la4 sib do sib8 do re4 sol,~
    sol la sib la8 sib do4 fa,~

    %179
    fa sol la sol8 la sib4 sol
    mi2 fa4 sol la2 ~
    la4 sib? sol2. la4\mbreak

    %182  %% riprende il 4/4
    fa8 sol la fa sib [sib, sib' la16 sol]
    fa8 sol la sol fa sol la fa

    %184
    sib sib,16 do re8 do sib do re mi
    fa sol la fa do' do, do' sib\mbreak
    la sol fa la sib do re do

    %187
    si! la sol si do sib la sol
    fa sol la fa sol si! do do,
    fa fa sol, sol' do,4 do16\tu do' re do %% fine prima riga p.28

    %190
    fad, do' re do re, do' re do si8 sol' la, fad'
    sol4 r sol r
    sol r sol r

    %193
    R1
    r4 r8 re[mi, do'] r si
    do, la r4 la'' r

    %196
    la r la r
    R1
    r4 r8 mi\tu fa, re' r do

    %199
    re, si'~si la16 sold la(si) do(re) mi8(fa)
    sold,(fad) mi4 r mi'16(fa mi8)
    la,4 r r2\mbreak

    %202
    r4  la'16\p(si la8) re,4 r
    r re16(dod re8) fa,4 r
    mi'16(fa mi8) sold,4 r si16(do si8)

    %205
    mi,4 r r2\mbreak
    r mi'16(re) do4 re16(mi)
    re(do) si4 do16(re) do8 la r4

    %208
    R1
    r4 la16\f la' si la red, la' si la si, la' si la
    sold(la si8) mi,4 r mi16(fa mi8)

    %211
    la,4 r r2
    r sol'16(fa) mi4 fa16(sol)
    fa16(mi) re4 mi16(fa) mi8 do r4\mbreak

    %214
    R1
    r8 sol' la, fa' r mi fa, re'
    mi, re mi do fa[fa fa mi16 re]

    %217
    do8 re mi re do re mi do\mbreak
    fa [fa16 sol la8 sol] fa sol, la si
    do re mi do sol' sol, sol' fa

    %220
    mi re do do' fa, sol la sol
    fad mi re fad sol, sol'16 fa? mi8 re\mbreak
    R1

    %223
    r2 r4 r8 sol'\mbreak
    la, fa' r mi fa, re' mi,16 do'(re do)
    fad, do'(re do) re, do'(re do) si(do re8)~re16 fad, mi re\mbreak

    %226
    mi8 do' re, do' si16\p do re8~re16 fa,? mi re
    mi8 do' re, si' do\f mi sol4
    sol8 mi sol4~sol8_\markup\italic "ad[agio]" fa16 mi fad8. sol16

    %229
    sol2 r

}

Ivlan = \relative do' {

    do8 re mi do fa [fa, fa' mi16 re]
    do8 re mi re do re mi do
    fa fa,16 sol la8 sol fa sol la si

    %4
    do re mi do sol' sol, sol' fa
    mi re do do' fa, sol la sol
    fad mi re fad sol, sol'16 fad mi8 re

    %7
    do re mi do re fad sol sol,
    re' do re re sol,4 r8 mi'
    fa sol fa mi16 re do8 la' sol [fa]

    %10
    fa8. mi16 re8. re16 mi4 r
    R1
    r2 r4 r8 mi\f

    %13
    do la' sol4 r8 sol sol,[sol']
    r8 la la, la' r re, sol, sol'
    r sol, la[la'] r si,\p sol[sol']~

    %16
    sol sol\f la[re,] mi4 r\mbreak
    R1
    r2 r4 r8 mi\f

    %19
    do la' sol4 r8 sol mi4
    R1*3
    r8 si'16\f do re8 si mi,4 r8 mi'

    %24
    la,4 r8 re re,4 r\mbreak
    R1*2
    r2 r8 si16\p do re8 si

    %28
    mi4 r8 mi la,4 r8 re\mbreak
    re4 r r2
    R1*6

    %36
    r8 si'16\f [do re8 si] mi,4 r8 mi\mbreak
    la4 r8 re, re4 r8 re
    la4 r8 re\p  re\caesura re\f mi la,

    %39
    si do\p re la re4. mi8
    re si sol4 r2\mbreak
    R1

    %42
    r4 r8 si'[sol la] fad mi
    mi re do si mi4. fa8
    mi do si4 r2

    %45
    R1
    r4 r8 do'[la sold] la4
    r8 mi do [re] mi re do[re]

    %48
    r si si4 r2\mbreak
    R1*13
    r4 r8 mi'\f do si do4

    %63
    r8 sol4 la fad la8
    re,4 r8 sol sol4 r8 sol\mbreak
    re4\p r8 re sol4 r8 fa!\f

    %66
    sol4 do,8 re4 re8 re4~
    re8 do4 do8 do4 re8 do
    sol'4\p r8 sol do,\caesura do\f re sol,

    %69
    fa8\tu sol la fa  sib' sib, sib' la16 sol
    fa8 sol la sol fa sol la fa
    sib sib,16 do re8 do sib do re mi

    %72
    fa sol la fa do' do, do' sib?\mbreak  %%% vai a 14 prima riga
    la sol fa la sib do re do
    si! la sol si do sib la sol

    %75
    fa sol la fa sol si! do do,
    fa fa, sol sol' do,4 r
    R1*2

    %79
    r2 mi8 fa sol mi
    la,4 r8 la' re,4 r\mbreak
    R1*2

    %83
    r8 dod16 re mi8 dod fad,4 r8 fad'
    si,4 r r2\mbreak
    R1

    %86
    la'8 si do la re,4 r8 re'
    sol,4 r r2
    R1

    %89
    r2 r8 fa16\f fa re re fa fa
    la la la, la re re re re la4 r
    R1*2

    %93
    la16 la do do fa fa fa, fa  do' do do do fa fa fa, fa
    do'8 do r4 r2
    r r8 mi16\f mi do do mi mi

    %96
    sol sol sol, sol do do do do sol'4 r\mbreak
    R1*4
    r2 si,16\f si re re sol sol sol, sol

    %102
    re' re re re sol sol sol, sol re'8 re r4
    r2 si16 si re re sol sol si, si
    re8 re r4 r2\mbreak

    %105
    r2 r8 re16 re si si si si
    sol8\p si do2 re4~
    re8 sol4 do,8 lab'(fa) sol8. sol16

    %108
    sol4 r8 mi\f do la' sol4\mbreak
    r8 sol sol, sol' r fad la la,
    re4 mi8 do fa fa, fa' mi16 re

    %111
    do8 re mi re do re mi do
    fa fa,16 sol la8 sol fa sol la si\mbreak
    do re mi do sol' sol, sol' fa

    %114
    mi re do do' fa, sol la sol
    fad mi re fad sol, sol'16 fad mi8 re
    do re mi do re fad sol sol,\mbreak

    %117
    re' do re re \once\stemUp sol,8 [si'16 do re8 si]
    mi,4 r8 mi' la, re do la
    si2 r r

    %120
    R1.*2
    r2 r sol\mbreak
    sol la re,

    %124
    re1 r2
    R1.*4
    r2 r r4 si

    %130
    do2(si) r
    fad sol dod
    si1 r2

    %133
    R1.*44
    r2 la'(sol)
    r sol(fa)

    %179
    r fa(mi)
    r r do
    re r do\mbreak

    %182  riprende il 4/4
    fa8 sol la fa sib [sib, sib' la16 sol]
    fa8 sol la sol fa sol la fa

    %184
    sib sib,16 do re8 do sib do re mi
    fa sol la fa do' do, do' sib\mbreak
    la sol fa la sib do re do

    %187
    si! la sol si do sib la sol
    fa sol la fa sol si! do do,
    fa fa, sol sol'  mi8 fa sol mi

    %190
    la,4 r8 la' re,4 mi8 la,
    si\p do re la re4. mi8
    re si sol4 r2

    %193
    R1
    r4 r8 si' sol la fad mi~
    mi re do si mi4. fa8

    %196
    mi re la4 r2
    R1\mbreak
    r4 r8 do' la [sold] la4

    %199
    r8 mi do re mi re do re
    r si si4 r2
    R1*8

    %209
    r8 do'16 re mi8 do fad,4 r8 fad
    si4 r r2
    R1*4

    %215
    r8 mi, do re sol,4 r8 re'
    do re mi do fa[fa fa mi16 re]

    %217
    do8 re mi re do re mi do\mbreak
    fa [fa16 sol la8 sol] fa sol, la si
    do re mi do sol' sol, sol' fa

    %220
    mi re do do' fa, sol la sol
    fad mi re fad sol, sol'16 fa? mi8 re\mbreak
    R1

    %223
    r2 r4 r8 mi
    do re sol,4 r8 sol' sol, sol'
    r la la, la' r re, sol, sol'\mbreak

    %226
    r8 sol, la la' r si,\p sol sol'
    sol sol la re, mi4\f  r8 mi
    mi sol r re do4._\markup\italic "ad[agio]" do8

    %229
    si2 r

}

Isopranon = \relative do'' {

    \autoBeamOff

    sol2 la(
    do2.) do4
    do2 do

    %4
    do4 do si2\mbreak
    do la~
    la4 la sol r

    %7
    do4. do8 do4 si~
    si8 la la8. la16 si4 r\mbreak
    R1

    %10
    r2 r4 r8 do
    re do re[do16 si] do[si do8]~ do16[mi re do]
    re[do si la] sol[la sol fa] mi8.[(re16)] do4

    %13
    R1*3
    r2 r4 r8 do'
    re do re[do16 si] do[si do8]~ do16[mi re do]

    %18
    re[do si la] sol[la sol fa] mi8.[(re16)] do4
    r2 r4 r8 mi'
    fa8 mi4 fa16[mi] re8(do4 re16)[mi]

    %21
    fa8 mi4 fa16[mi] re8(do4 re16)[mi]
    re8 mi re4. do8 si[la]
    si[la] sol4 r2

    %24
    r r4 r8 do\mbreak
    re do re do16[si] do[re mi fa] sol8 [si,]
    do16[re mi fa] sol8 [si,] do16[re mi fa] sol8 fa

    %27
    mi4(fad8)[sol] re2
    R1\mbreak
    r4 r8 mi re mi16[do] re8 mi16[do]

    %30
    re8 sol4 fad16[mi] re[do si la] sol8[mi']
    re sol4 fad16[mi] re[do si la] sol8[do]
    si4 dod re8 do4 si16[la]\mbreak

    %33
    si16[do si la] sol8[do] si16[la si re] dod[si dod mi]
    re8 do!4 si16[la] si8[sol' fad mi]
    re[do] si[sol] la2

    %36
    sol r
    R1*2
    re'4 re8 do si[la] sol4

    %40
    r8 re' si re mi4 re8 si\mbreak
    do4. la8 si4 dod8[re]
    la4 r r2

    %43
    mi'4 mi8 re do[si] la4
    r8 mi'do mi fa4 mi8 do
    re4. si8 do2

    %46
    si4 r r2
    R1
    r4 si mi, r\mbreak

    %49
    r mi'8 re dod4 re8 mi
    fa4. mi8 re4 mi8 re16[dod]
    re4 la r re~

    %52
    re8 mi16 [fa] mi8 re do re mi4~
    mi16 [mi, fad sold] la[si do re] mi[(re)] do4 re16[(mi)]
    re[(do)] si4 do16[( re)] do[(si)] la4 si16[(do)]

    %55
    si[(la)] sold4 la16[(si)] la8[fa' mi(red)]
    mi[fad16 sold] la8 [la,] si2\mbreak  %%% fino p. 11
    la4 si mi, r

    %58
    r mi' la, re8 do
    si do fa4 mi16[re] do4 re16[mi]
    re16[(do)] si4 do16[(re)] do[sol la si] do[re mi fa]\mbreak

    %61
    sol8[si, do fa] mi[do] re4
    do r r2
    R1*6

    %69
    do2 re(
    fa2.) fa4
    fa2 fa

    %72
    fa4 fa mi2\mbreak %% va a p. 14
    fa re~
    re4 re do2

    %75
    fa4. fa8 fa4 mi~
    mi8 re re8. re16 mi2\mbreak
    r4 do8 la re sib16[do] re8 re

    %78
    do4 fa,8 do' fa[mi16 re] do8[sib]
    la[(si!16 do)] si8.[do16] do4 r
    r2 r4 r8 do\mbreak

    %81
    do8 sib sib sib sib la fa' mi
    re dod re4.(fa8) mi re
    dod[si] la4 r2

    %84
    r4 la8 la la sold mi' sol,16 sol
    sol8 fa re' la sib do16 re do8 sib
    la8. sol16 fa4 r2

    %87
    r4 r8 la sib4(si)
    do dod re2~
    re8 dod16 si dod4 re r

    %90
    r2 r8 re, fa la
    fa16[re32 mi fa16 re] fa[re fa la] re8. re,16 re8 re'
    do[sol] do4. sib16 sib sib4

    %93
    la r r2
    r8 fa la do la16[fa32 sol la16 fa] la[fa la do]
    fa8 fa,4 fa'8 mi do r4

    %96
    r2 r4 fa~\mbreak
    fa mi2 re4~
    re do si2

    %99
    la4 r8 la mi'[re16 do] si[do si la]
    sold8 fad mi mi' re4 re8 do16[si]
    do8[re16 mi] re[la re do] si8[la] sol4

    %102
    r2 r8 sol si re
    si16[sol32 la si16 sol] si[sol si re] sol4 sol,
    r do8 sib la16[fa32 sol la16 si] do[re mi fa]\mbreak

    %105
    si,16[sol32 la si16 do] re[mi fa sol] si,8[la] sol4
    r sol2^\p fa4~
    fa mib re4. re8

    %108
    do4 r r2
    R1
    sol'2 la(

    %111
    do2.) do4
    do2 do\mbreak
    do4 do si2

    %114
    do la~
    la4 la sol r
    do4. do8 do4 si~

    %117
    si8 la la8. la16 si4 r
    R1
    si2 do re   %%% inizia 3/2

    %120
    re la re~
    re do4 (si) do2
    do si r\mbreak

    %123
    R1.
    r2 r re
    mi4(do) do(la) la sol
    fad(mi) re2 r4 sol

    %127
    la2 sol r\mbreak
    do si sol4 (si)
    la1 r2

    %130
    R1.*3
    re,2 fad la
    re2. re4 do2

    %135
    si mi re\mbreak
    do2. re4 si2
    do4 (si) la2 r

    %138
    r mi' si
    do si r
    r mi si

    %141
    do si mi~
    mi re1~
    re2 do1~

    %144
    do2 si1~
    si2 si la~
    la4 si la2 (sold)

    %147
    la1 r2
    r la mi
    fa mi r

    %150
    r la mi
    fa mi r\mbreak  %% fine p.21
    sib'1.

    %153
    la
    sol
    fa1 fa2

    %156
    mi mi1
    re2 r r
    r re' re4 do

    %159
    sib2. la4 sol (si)\mbreak
    do2 sol' sib,
    sib? la r

    %162
    fa'2. mib4 re do
    sib2. sib4 do (sib)
    la2 la si!

    %165
    do sol la
    sib1.
    la4 sib do sib8 [do] re4 sol,~\mbreak

    %168
    sol4 la sib la8 [sib] do4 fa,~
    fa sol la sol8 [la] sib4 sol
    mi2 fa4 sol la2~

    %171
    la4 sib sol2. sol4
    fa2 r la
    sold mi mi'4 re

    %174
    do si8 [la] sold2. la4
    la1 r2
    R1.*6

    %182
    do2 re(
    fa2. )fa4
    fa2 fa

    %185
    fa4 fa mi2
    fa re~
    re4 re do2

    %188
    fa4. fa8 fa4 mi8 mi
    re4. re8 mi2\mbreak
    R1

    %191
    re4 re8 do si[la] sol4
    r8 re'16[do] si[do re si] mi[fa mi8] re8 do16 si
    do4 si8 la si4. si8\mbreak

    %194
    la4 r r2
    mi'4 mi8 re do8. si16 la4
    r8 mi'16[re] do[re mi do] fa8. fa16 mi8 do

    %197
    re4. do16 si do2\mbreak
    si4 r r2
    R1

    %200
    r4 si8 la sold[fad] mi4
    r mi'8 re dod16[si] dod8 re mi\mbreak
    fa8. fa16 fa8 mi re re mi re16[dod]

    %203
    re4 la r re~
    re8 si mi re16 mi do?8 re mi4~
    mi16[mi, fad sold] la[si do re] mi[(re)] do4 re16[(mi)]\mbreak

    %206
    re[(do)] si4 do16[(re)] do[(si)] la4 si16[(do)]
    si16[(la)] sold4 la16[(si)] la8[fa' mi(red)]
    mi8[fad16 sold] la8 [la,] si2

    %209
    la r\mbreak
    r4 si8 la sold8. fad?16 mi4
    r mi'8 re dod si16 dod re8 dod

    %212
    si8 [do?] fa4 mi16[(re)] do4 re16[(mi)]
    re[(do)] si4 do16[(re)] do[sol la si] do[re mi fa]\mbreak
    sol8[si, do fa] mi[do] re4

    %215
    do r r2
    sol2 la(
    do2.) do4

    %218
    do2 do
    do4 do si2
    do la~

    %221
    la4 la sol r\mbreak
    do4. do8 do4 si~
    si8 la la8. la16 si4 r

    %224
    R1*6

}

ItestoI = \lyricmode {

    Ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do -- minum _

    a -- ni -- ma me  -- a Do -- minum. _

    Et ex -- sul -- ta - - - - vit et ex -- sul -- ta - - - - vit

    et ex -- sul - ta - - - - - vit spi -- ritus _ me -- us in Deo _

    sa -- lu -- ta - - - - - ri me -- o in Deo _

    sa -- lu -- ta - - - - - - - - - - - - - - - - - - - - - - - ri me -- o.

    Qui -- a res -- pe -- xit hu -- mi -- li ta -- tem an -- cil -- lae su - ae

    qui -- a res -- pe -- xit hu -- mi -- li ta -- tem an -- cil -- lae su -- ae.

    Ec -- ce ec -- ce e -- nim ex hoc be -- a -- tam me di -- cent

    om -- nes ge -- nera - ti -- o - - - - - - - - - - - - - - - - - nes

    om -- nes  om -- nes ge -- ne -- ra -- ti --  o - - - - - - - - - - - nes.

    Ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do -- minum _

    a -- ni -- ma me  -- a Do -- minum. _

    Qui -- a fe -- cit mi -- hi ma -- gna, qui po - - tens est

    et Sanc -- tum no -- men e -- ius

    et mi -- se -- ri -- cor -- dia _ e -- ius et mi -- se -- ri -- cor -- dia _ e -- ius

    a pro -- ge -- nie _ in pro -- ge -- nies _  ti -- men - - - tibus _ e -- um.

    Fe -- cit po -- ten - - tiam _  in bra - chio _ su -- o,

    dis -- per - - - - sit su -- perbos _ men -- te cor -- dis su -- i.

    de -- po - - suit _ po -- tentes _ de se - - de,

    et ex -- al -- ta - - vit ex -- al -- ta - - - - vit hu - - - mi -- les.

    Ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do -- minum _

    a -- ni -- ma me  -- a Do -- minum. _

    e -- su -- ri -- entes _ im -- ple -- vit bonis, _

    et di -- vi -- tes di -- mi -- sit in -- a -- nes in -- a - nes.

    Su -- sce -- pit Is -- ra -- el, su -- sce -- pit pu -- e -- rum su -- um,

    re -- cor -- da -- tus re -- cor -- da -- tus

    mi -- se -- ri -- cor -- di -- ae _ su -- ae

    re -- cor -- da -- tus re -- cor -- da -- tus

    mi -- se -- ri -- cor -- di -- ae su -- ae.

    Si -- cut lo -- cu -- tus est ad Pa -- tres no -- stros

    A -- bra -- ham et se -- mi -- ni e -- ius

    in sae - - - - - - - - - - - - - - - - - - - - - - - - - cu -- la

    in sae - - - - - - cu -- la.

    Ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do -- minum _

    a -- ni -- ma me  -- a Do -- minum. _

    Glo -- ria _ Pa -- tri glo - - - ria _ Pa -- tri et Fi -- li -- o

    glo -- ria _  Fi -- li -- o  glo - - ria _

    Spi -- ri -- tui _ San -- cto.

    Si -- cut e -- rat si -- cut e -- rat in prin -- ci -- pio, _

    et nunc et sem - - per

    et in sae -- cula _ sæ -- cu -- lo - - - - - - - - - - - - - - - - - rum

    et in sae -- cula _  et in sae -- cula _ sæ -- cu -- lo - - - - - - - - - - - - rum.

    Ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do -- minum _

    a -- ni -- ma me  -- a Do -- minum.

}

Ialton = \relative do' {

    \autoBeamOff

    r2 do
    mi4(sol4.) sol8 sol4~
    sol fa la4. la8

    %4
    sol4 sol2  sol4
    sol mi fa4.(sol8)
    la [sol] fad16[sol la8] si[la sol fa?]

    %7
    mi [fa sol mi] fad!16 [sol] la4 sol8~
    sol [fad16 mi] fad8. fad16 sol4 r\mbreak
    R1*60

    %69
    r2 fa
    la4(do2) do4
    do si8[do] re4. re8

    %72
    do4. la8 sol4. sol8\mbreak
    do,4 do'4. do8 la4
    sol sol2 la4~

    %75
    la8 si! do[ la] si [la] sol [fa16 mi]
    fa8[la] sol8. sol16 sol2\mbreak
    R1*33

    %110
    r2 do,
    mi4(sol4.) sol8 sol4~
    sol fa la4. la8\mbreak

    %113
    sol4 sol2 sol4
    sol mi fa4. (sol8)
    la[sol] fad16[sol la8] si[la sol fa]

    %116
    mi[fa sol mi] fad16[sol] la4 sol8~\mbreak
    sol[fad16 mi] fad8. fad16 sol4 r
    R1

    %119
    R1.*63
    r2 fa
    la4(do2) do4

    %184
    do sib8[do] re4. re8
    do4. la8 sol4. sol8
    do,4 do'4. si8 la4

    %187
    sol sol2 la4~
    la8 [si!] do[la] si[la] sol[fa16 mi]
    fa8[la] sol8. sol16 sol2\mbreak

    %190
    R1*26
    r2 do,
    mi4(sol4.) sol8 sol4~

    %218
    sol fa la4. la8
    sol4 sol2 sol4
    sol mi fa4. (sol8)

    %221
    la8[sol] fad[sol16 la] si8[la sol fa]\mbreak
    mi[fa sol mi] fad16[sol] la4 sol8~
    sol[fad16 mi] fad8. fad16 sol4 r

    %224
    R1*6

}

ItestoII = \lyricmode {

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do - - - - - - - minum _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat

    ma -- gni -- fi -- cat  a -- ni -- ma me  -- a Do - - - - - - minum. _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma

    me  -- a Do - - - - - - - minum. _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma

    me  -- a Do - - - - - minum. _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma

    me  -- a Do - - - - - - - minum. _


}

Itenoren = \relative do' {

    \autoBeamOff

    R1
    r2 sol2
    la4(do2) do4

    %4
    do 4. mi8 re4. re8\mbreak
    mi4 sol4. fa8 mi4
    re2 re4 mi8[fa]

    %7
    sol16[fa mi re] do8.[si16] la4 si8[do]
    re4. re8 re4 r
    R1*61

    %70
    r2 do
    re4(fa2) fa4
    fa2 r\mbreak

    %73
    r2 fa
    fa4 fa mi(fa)
    fa r re do~

    %76
    do si! do2
    R1*34
    r2 sol

    %112
    la4(do2) do4\mbreak
    do4. mi8 re4. re8
    mi4 sol4. fa8 mi4

    %115
    re2 re4 mi8[fa]
    sol16[fa mi re] do8.[si16] la4 si8[do]\mbreak
    re4. re8 re4 r

    %118
    R1
    R1.*63
    R1

    %183
    r2 do
    re4 (fa2) fa4
    fa2 r

    %186
    r fa
    fa4 fa mi fa~
    fa r re(do)~

    %189
    do si! do2\mbreak
    R1*27
    r2 sol

    %218
    la4(do2) do4
    do4. mi8 re4. re8
    mi4 sol4. fa8 mi4

    %221
    re2 re4 mi8[fa]\mbreak
    sol16[fa mi re] do8.[si16] la4 si8[do]
    re4. re8 re4 r

    %224
    R1*6


}

ItestoIII = \lyricmode {

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do - - - - - minum _

    Ma -- gni -- fi -- cat  a -- ni -- ma me  -- a Do - minum _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do - - - - - minum. _

    Ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do -- minum. _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma me  -- a

    Do - - - - - minum. _

}

Ibasson = \relative do {

    \autoBeamOff

    R1*2
    r2 do
    mi4( sol4.) sol8 sol fa\mbreak

    %5
    mi re do4 r do'~
    do8 do do4 si2
    do re4(sol,)

    %8
    re4. re8 sol,4 r
    R1*62
    r2 fa'

    %72
    la4(do4.) do8 do sib\mbreak
    la8. sol16 fa4 sib8[do re do]
    si!8 la sol[si] do[sib] la[sol]

    %75
    fa[sol la fa] sol[si! do do,]
    fa4 sol8. sol16 do,2
    R1*35

    %112
    r2 do
    mi4(sol4.) sol8 sol fa
    mi re do4 r do'~

    %115
    do8 do do4 si2
    do re4(sol,)\mbreak
    re4. re8 sol,4 r

    %118
    R1
    R1.*63
    R1*2

    %184
    r2 fa'
    la4(do4.) do8 do sib
    la8. sol16 fa4 sib8 [do re do]

    %187
    si! la sol[si] do[sib la sol]
    fa[sol la fa] sol[si do do,]
    fa4(sol8.) sol16 do,2\mbreak

    %190
    R1*28
    r2 do
    mi4(sol4.) sol8 sol fa

    %220
    mi8. re16 do4 r do'~
    do8 do do4 si2
    do re4 (sol,)

    %223
    re4. re8 sol,4 r
    R1*6

}

ItestoIV = \lyricmode {

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do -  minum _

    Ma -- gni -- fi -- cat  ma -- gni -- fi -- cat a - ni -- ma me  -- a Do - - - minum _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do - minum. _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a - ni -- ma me  -- a Do - minum. _

    Ma -- gni -- fi -- cat ma -- gni -- fi -- cat a -- ni -- ma me  -- a Do - minum. _

}

Ibcn = \relative do {

    do8 re mi do fa [fa, fa' mi16 re]
    do8 re mi re do re mi do
    fa [fa,16 sol la8 sol] fa sol la si

    %4
    do re mi do sol' sol, sol' fa
    mi re do do' fa, sol la sol
    fad mi re fad sol, [sol'16 fad mi8 re]

    %7
    do re mi do re fad sol sol,
    re' do re re, sol sol' mi do\mbreak
    fa mi fa sol la sol16 fa mi8 fa

    %10
    re sol si, sol' do do,16 re mi8 do\p
    fa mi fa sol la sol16 fa mi8 la
    fa4 r8 sol do, re mi \caesura do\f\mbreak

    %13
    fa re mi do re si do4
    re fad sol si
    do8 mi, fa mi16 fa sol4 si\p

    %16
    do8 \caesura mi,\f fa sol do, re mi \caesura do\p\mbreak
    fa mi fa sol la sol16 fa mi8 la
    fa re mi sol do, re mi\caesura do\f

    %19
    fa re mi do re si do do'16\p si
    la8 sol fa4 r8 mi16 re mi8 do\mbreak
    la' sol fa4 r8 mi16 re mi8 do

    %22
    sol' do si la16 sol fad4 r8 re
    sol, sol'16 la si8 sol la4 dod
    re4 fad, sol8 fad mi do\mbreak

    %25
    fa? mi fa sol mi do si sol'16 fa
    mi8 do si sol'16 fa mi8 do si sol'
    do si la4 r8 sol16\f [la si8 sol]

    %28
    la4 dod, re fad\mbreak
    sol8\caesura sol,16\p la si8 do sol do' si do
    sol si re4 r8 re mi [do]

    %31
    si sol re'4 r8 re mi [fad,]
    sol fad mi la re, mi fad re\mbreak
    sol8 la si fad sol fad mi la

    %34
    re, mi fad re sol4 r8 do
    fad, re sol si, do la re re,
    sol \caesura [sol'16\f la si8 sol] la4 dod\mbreak

    %37
    re4 fad, sol8[si, do si16 do]
    mi4 fad\p sol8 \caesura si,\f do re
    sol\p la si fa sol la si do

    %40
    si sol r si do do, sol'[sol,]\mbreak
    la la' mi fad sol fad mi4
    re8\caesura re'16\f do si8 sol do la si sold

    %43
    la\p si do sold la si do re
    do la r8 do\noBeam re re, la'[la,]\mbreak %% vai a p. 11
    si8 si' fad sold la la,16 si do8 re

    %46
    mi\caesura mi'16\f re do8 la re si do[la]
    si sold la[si] do si la[re]
    mi\caesura mi,16\p fad sol8 si sold la sold mi\mbreak

    %49
    fa mi16 re dod8 re mi sol fa[mi]
    re mi fa sol16 la sib?8 la sol la
    fa re16 mi fa8 mi re re'16 do si8 la

    %52
    sold4 r8 mi la fa mi[re]\mbreak
    do4 r8 si do4 la
    si mi la, r8 la'

    %55
    re4 r8 mi la,4 r8 si
    do si la do re, si mi mi,\mbreak  %%% fine p.11
    la' do sold mi16 fad sold8 la sold[mi]

    %58
    fa? mi16 re dod8 la' fa re16 mi fa8 mi
    re do?16 si la8 sol do4 r8 do
    fa4 r8 sol do,4 r8 do'\mbreak %vai a prima linea p 13

    %61
    si sol la si do la fa[sol]
    do, do'16 re mi8 do fa re mi [do]
    re si do4 re r8 fad,

    %64
    sol4 si do8 mi, fa! mi16 fa\mbreak %% torna a 12
    sol4\p si do r8 re,\f
    mi4 fa sol si?

    %67
    do mi, fa8 la sib la16 sib
    do4\p r8 mi, fa\caesura la, sib do\mbreak
    fa8\tu sol la fa  sib sib, sib' la16 sol

    %70
    fa8 sol la sol fa sol la fa
    sib sib,16 do re8 do sib do re mi
    fa sol la fa do' do, do' sib?\mbreak  %%% vai a 14 prima riga

    %73 OOKK
    la sol fa la sib do re do
    si! la sol si do sib la sol
    fa sol la fa sol si! do do,

    %76
    fa fa, sol sol' do,\solo re mi do\mbreak
    fa sol la fa sib sib, sib'[sol]
    la fa16 sol la8 fa re4 mi

    %79
    fa8 mi re sol do, re mi do
    re4 fad sol8 fa? mi[do]
    re sol re mi fa mi re dod

    %82
    re la' sib[la] sol4 r8 sold
    la la,16 si dod8 la si4 red
    mi8 re? do? la si4 dod

    %85
    re8 mi fa fad sol fa? mi do
    fa sol la fa sol4 si!
    do8[sib la fa16 mi] re8 re' sol, fa

    %88
    mi mi' la, sol fa fad sol sold\mbreak
    la4 r8 la, re\f re r4
    re8 re r4 re8\p re r4

    %91
    re8 re r4 re8 mi fa re
    mi4. re16 do re8 sol re[mi]\mbreak
    fa8\f fa r4 fa8 fa r4

    %94
    fa8\p fa r4 fa8 fa r4
    fa8 sol la sib do\f do r4
    do,8 do r4 do'8 sib la fa\mbreak

    %97
    sol si! do do, fa4 r8 fad
    sold mi la la, re si mi mi,
    la4 r la re

    %100
    mi8 fad sold mi fad si fad sold\mbreak
    la sol? fad re sol\f sol r4
    sol8 sol r4 sol8\p sol r4

    %103
    sol8 sol r4 sol8 sol r4
    sol8 fa mi do fa4 r8 fa\mbreak
    sol4 r8 sol sol,4 r

    %106
    r8 sol'\p mib do fa mib re do
    si! sol do lab' fa re sol sol,
    do\caesura re\f mi do fa re mi do\mbreak

    %109
    re si do4 re fad
    sol8\tu fa? mi do fa fa, fa' mi16 re
    do8 re mi re do re mi do

    %112
    fa fa,16 sol la8 sol fa sol la si\mbreak
    do re mi do sol' sol, sol' fa
    mi re do do' fa, sol la sol

    %115
    fad mi re fad sol, sol'16 fad mi8 re
    do re mi do re fad sol sol,\mbreak
    re' do re re, sol sol'16 la si8 sol

    %118
    la4 dod re8 si dod re
    sol,2 r sol  %%% inizia il 3/2
    fad r re

    %121
    mi1 fad2
    sol2. la4 si sol\mbreak
    mi2 la fad

    %124
    sol2. la4 si2
    do r do
    do1 r4 si

    %127
    do2 si r\mbreak
    fad sol dod,
    re2. do?4 si si'\pp

    %130
    do2 si r
    fad sol dod,
    re fad\f  la

    %133
    re2. re4 do?2
    si sold la~
    la sold mi\mbreak

    %136
    la fad sold
    la r sold
    la4 mi' sold, mi' mi, mi'

    %139
    la, mi' sold, mi' mi, mi'
    la, mi' sold, mi' mi, mi'
    la, do mi re do si

    %142
    la2 si4 do re si
    sold2 la4 si do la\mbreak
    fad2 sold4 la si sold

    %145
    mi2 sold la
    red, mi mi,
    la2. si4 dod la

    %148
    re la' dod, la' la, la'
    re, la' dod, la' la, la'
    re, la' dod, la' la, la'

    %151
    mi fa la sol fa re\mbreak
    sol2 mi4 re do mi
    fa2 re4 do sib re

    %154
    mi2 dod4 si? la dod
    re2 fa sib
    sold la la,

    %157
    re la' la4 sol?
    fa2. mi4 re fad
    sol sol, sol'2 sol4 fa\mbreak

    %160
    mi2. re8 do re4 mi
    fa fa, fa'2. mi4
    re do sib2 sib'4 la

    %163
    sol fa mi re do mi
    fa2 re sol
    do,1 r2

    %166
    R1.
    re'2 la si!\mbreak
    do sol la

    %169
    sib fa sol
    la2. sol4 fa2
    sib do do,

    %172
    re2. mi4 fa2
    mi sold la
    re, mi mi,

    %175
    la r r\mbreak
    R1.
    re'2\f la si!

    %178
    do sol la
    sib fa sol
    la2. sol4 fa2

    %181
    sib do do,\mbreak  %%% fine 3/2
    fa8 sol la fa sib [sib, sib' la16 sol]
    fa8 sol la sol fa sol la fa

    %184
    sib sib,16 do re8 do sib do re mi
    fa sol la fa do' do, do' sib\mbreak
    la sol fa la sib do re do

    %187
    si! la sol si do sib la sol
    fa sol la fa sol si! do do,
    fa fa, sol sol' do,\solo re mi do\mbreak

    %190
    re4 fad sol8 si, do re
    sol\p la si fad sol la si do
    si sol r si do do, sol' sol,

    %193
    la la' mi fad sol[sol,16 la si8 do]\mbreak
    re re'16 do si8 sol do[la] si sold
    la si do sold la si do re

    %196
    do la r do re re, la' la,
    si si' fad sold la la,16 si do8 re\mbreak %% fine p 25
    mi8 mi'16 re do8 la re si do[la]

    %199
    si sold la[si] do si la re
    mi mi,16 fad sold8 la mi fad sold mi
    fa! mi16 re dod8 re mi sol fa mi\mbreak

    %202
    re mi fa sol16 la sib8 la sol la
    fa re16 mi fa8 mi re re'16 do si8 la
    sold4 r8 mi la fa mi re

    %205
    do4 r8 si do4 la\mbreak
    si mi la, r8 la'
    re4 r8 mi la,4 r8 si

    %208
    do si la do re, si mi mi,
    la [la'16 si do8 la] si4 red
    mi8 mi,16 fad sold8 la mi fad sold mi

    %211
    fa? mi16 re dod8 re la' sol fa mi
    re do16 si la8 si do4 r8 do
    fa4 r8 sol do,4 r8 do'\mbreak

    %214
    si sol la si do [la fa sol16 fa]
    mi8 do fa re mi do re si
    do\tu re mi do fa fa, fa' mi16 re

    %217
    do8 re mi re do re mi do\mbreak
    fa [fa,16 sol la8 sol] fa sol la si
    do re mi do sol' sol, sol' fa

    %220
    mi re do do' fa, sol la sol
    fad mi re fad sol, sol'16 fa? mi8 re\mbreak
    do re mi do re fad sol sol,

    %223
    re' do re re, sol sol'16 fa mi8 do
    fa re mi do re si do4
    re fad sol si

    %226
    do8 mi, fa mi16 fa sol4 si\p
    do8 mi, fa sol do,4\f r8 do
    si4 r8 si la2^\markup\italic "demy"

    %229
    sol r

}

Ibfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1*2
    <9>4 <6> s2
    s1
    <6>2 <9>4 <5>
    <6> <_+> s2
    <5>2 <7 _+>4 <7 _+>\bassFigureExtendersOff
    <6 4> <5 _+> s2
    <6>8 <6> <6> <5 3> <5>4\bassFigureExtendersOn <6>8 <6>
    \bassFigureExtendersOff s4 <6> s2
    <6>8 <6> <6>4 <5> <6>
    <6>1
    s4 <5> s2
    <7 _+>1
    s8 <6> <5> <6> s2
    s4 <6> s2
    <6>8 <6> <6>4 <5> s
    s1
    s
    <6>8 <6> <7> <6> s <6> s4
    <6>8 <6> <7> <6> s \bassFigureExtendersOn <6> <6>4
    s4 <6>s s8 <_+>
    s2 <7 _+>4 s
    <_+>2 s4 <6>8 s\bassFigureExtendersOff
    <6> <6> <6> s <6>4 <6>
    <6> s s <6>
    <5> <6\\> s2
    <7 _+> <_+>
    s1
    s4 <4+> s8 <_+> <5> s
    <6>4 <4+> s8 <_+> <5>4
    s <6\\>8 <_+> <_+>2
    s4 s8 <5> s4 <6\\>8 <_+>
    <_+>2 s4 s8 <6 3>
    <6> <_+> s4 <6> <_+>
    s2 <7+>
    <_+> s8 <6> <6> <6>
    <_+>2 s4 <6>8 <_+>
    s1
    <6>  %%% fine p. 9 OOKK bar 40
    <5>4 \bassFigureExtendersOn <6>8 <6> s4 \bassFigureExtendersOff <6\\>
    <_+> <6> s <5+>8 <6>
    s2 s4 <6>
    <6> s8 <6> <5>2
    \bassFigureExtendersOn <5+>8 <5+> <6> <6>\bassFigureExtendersOff s4 <6>
    <_+> <6><5>8 <6\\> <6>4
    <6\\> s <6>2
    <_+>1
    <6>4 <6>8 s \bassFigureExtendersOn <6\\> <6\\> <6> <6\\>
    \bassFigureExtendersOff s8 <6\\> <6>4 <5> <_->8 <_+>
    <6>4 <6\\> s <6\\>
    s4 s8 <_+> s8 <6> \bassFigureExtendersOn <_+>8 <_+>
    \bassFigureExtendersOff <6>4 s8 <6\\> <6>2
    <7>4 <_+> s2
    <6>4 s8 <_+> s4 s8 <_+>
    <6> <6\\> s4 <6> <5 _+>  %%% fine p. 11 bar 56
    s4 <6\\> s2
    <5>4 s8 <_+> <6>4 <6>8 <6>
    <6> <8>\bassFigureExtendersOn <6> <6> s2
    <6>2 s
    s4 <6>8 <6> s4 <6>8 <6>\bassFigureExtendersOff
    s2 s8 <6> <6>4
    s <5>8 <6> <_+>2
    s2 s8 <6> <6> <6>
    s2 s4 s8 <6->
    \bassFigureExtendersOn <5>8 <5>\bassFigureExtendersOff <5>4 <_!>2
    s4 <6> s <6>8 <6>
    s4 s8 <6> s <6> <6>4
    s1
    s
    s4 <6> s2
    s4 <6> s2  %%% fine p. 13 bar 72
    <6>2 s4 <5>8 s
    \bassFigureExtendersOn <6 5>4 <6 5> s <6>\bassFigureExtendersOff
    s4 <6> <_!>2
    <7>8 <6> <5 4>4 s2
    s2 s4 s8 <5 3>
    <6>4 <6>8 s \bassFigureExtendersOn <6->4 <6 6->
    \bassFigureExtendersOff s4 <6!>8 <_!> s4 <6>
    <7 _+>2 s4 <6>
    <7>8 <_->16 s \bassFigureExtendersOn <6->8 <6-> <5 4->4 <6>
    s8 <_+> <6 5>4 s s8 <6>
    <_+>4 s <_+> <6>
    <_+>8 <_+> <6>4\bassFigureExtendersOff <7>8 <6\\> <6>4
    \bassFigureExtendersOn <4>8 <4> <6> <6> <_->2
    s <7 _!>4 <6>
    s <6> <6-> <_!>
    <6> <_+> <6>8 <6> <5> <5>\bassFigureExtendersOff  %% fine p. 15 bar 88
    <5 4>8 <3+> s8 <5 _+> s2
    s1
    s
    <6>2 <7>8 <_-> \bassFigureExtendersOn <6-> <6->
    s1
    s
    s4 <6> s2
    s s4 <6>
    <7>4 s <7> s8 <6>
    <5> <5 _+> s4 <6>8 <6> <5 _+>4
    s2 s4 <6>
    <_+>2 <6>
    s4 <6>8 <_+> s2
    s1
    s
    s4 <6> s2
    <_+>1\bassFigureExtendersOff
    s4 <6> <9 _-> <5- 3>
    <6 5> s <6 5 _->8 <7 3> <5 _!>4
    <_!>1
    s2 <7 _+>4 <6>
    s1
    s
    s2 s4 <6>
    s1
    <6>2 <9>4 <5>
    <6 5> <_+> s <6>
    s2 <7 _+>
    <5 4>4 <_+> s2
    <7 _+>1  %%% fine 4/4

    % 3/2
    s1.
    <6>2 s <_+>
    <7>1 <5>2
    <4> <3> s
    <7> <6\\> s
    s1.*2
    <6 4\+ 2>1 s4 <6>
    <6>2 <6> s
    <5> s <5> <_+> s <6>
    <6> <6> s
    <5> s <5>
    <_+>1 s2
    \bassFigureExtendersOn <5 _+> < 5 _+> s\bassFigureExtendersOff
    <6\\>2 <6> <_->
    <2> <6> <_+>\mbreak
    s <6> s
    s s <6>
    s s <_+>
    s1.
    s2 s <_+>
    s <_+> <6>4 s
    \bassFigureExtendersOn <6 5>2 <6 3> <6>4 s
     <6 5>2 <6 3> <6>4 s
     <6 5>2 <6 3> <6>4 s
     <7 _+>1 s2
     <7>2 <5 4> <5 _+>
     s1 <6>2
     s s <_+>
     s s <_+>
     s s <_+>
     s <_+> <6>\mbreak %% fine pagina 25 batt. 151
     <9 _-> <3 _-> <_->
     <9 3>4 s <3 >2 s
     <9 3>4 s <3>2 s
     <9 3>2 <6> <5>4 s
     <6 5> s <5 _+>2 <5 _+>
     s <_+> s
     <6> s s4 <5 _+>
     <_->2 <_-> <_!>4 <_!>\bassFigureExtendersOff
     <6>1 <6->2
     <5 4->2 <3> s
     s1.
     \bassFigureExtendersOn <_->2 <5-> <5->
     s s <_!>
     s1.
     s
     s2 <6> <6>\mbreak
     <_->4 s <4 6- _->2 <6->
     s <6> <6 _->
     <5 _+> s <6 3>
     <7> <5 3> <5 3>4  s
     <9 3>2 <8> <6>
     <7 _+> s s
     <7> <5 _+> s
     s1.
     s
     s2 <6> <6>
     <_->4 s <6- _->2 <6->
     s <6> <6 _->
     <5 _+> s <6>
     <7> <5 3> <5 3>\bassFigureExtendersOff %%Fine 3/2  OOKK

     %%% 4/4 finale
     s1*2
     s4 <6> s2
     s1
     <6>2 <9>4 <5>
     <6 5>4 <_!> s <6>
     s <6> \bassFigureExtendersOn <7 3>8 <7> s4\bassFigureExtendersOff
     <6 5>4 <5 3> s2\mbreak
     <7 _+>4 <6> <_!> <6>8 <_+>
     s1*2
     s4 <5> s2
     <_+>  s4 <5+>8 <6>
     s1
     <6>4 s8 <6> s4 <_->
     <5+>\bassFigureExtendersOn <6>8 <6> s4 <6>\bassFigureExtendersOff
     <_+>2 s8 <6\\> <6>4
     <6\\>2 <6>
     <_+> <_+>
     \bassFigureExtendersOn <6>8 <6> s4 <6>8 <6>16 s \bassFigureExtendersOff <6>8 <5/>
     s4 <6> <5> <6>8 <_+>
     <6>8 s \bassFigureExtendersOn <6>8 <6> <5>4 <6\\>
     <6>4 s8 <_+> s8 <6> <_+> <_+>
     <6>4 s8 <6-> <6>2\mbreak
     <7>4 <_+> s2
     <6>4 s8 <_+> <5> <6> s <_+>
      <6>8 <6\\> s <6>16 s <6 5>4 <6 _+>\bassFigureExtendersOff
      s2 <7 _+>4 <_+>
      <_+> <6> <_+>2
      <6>4 <6> <_+> <6>8 <6\\>
      <6> <6>16 s \bassFigureExtendersOn <6>8 <6> <5 3>2
      <6> s\mbreak
      s4 <6>8  <6> s <5> <6> <6>16 s \bassFigureExtendersOff
      <6>2 s4 s8 <6>
      s1*2
      <9>4 <6> s2
      s1
      s2 <9>4 <5>8 s
      \bassFigureExtendersOn <6 5>4 <6 5> s <6>\mbreak
      s2 <7 _+>
      <6 4>4 <5 _+> s <6>
      s2 s8 <6> s4
      <7 _+>2 s4 <6\\>\bassFigureExtendersOff
      s8 <6> <6> <6> s2
      <6>8 <6> s4 s s8 <6>
      <6>2 <7>4 <6\\>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*118  %%% fine a p. 19
    \bar "||"\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\larger "Largo"
    \time 3/2
    \tempo 1 = 40
    s1.*63
    \bar "||"\break
    \time 4/4
    \tempo 2 = 50
    s1*48
    \bar "|."

}

IobI = {
    <<\IobIn \forma>>

}

IobII = {
    <<\IobIIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}

Isoprano = {
    \new Voice = "magnificat1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "magnificat2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "magnificat3"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "magnificat4"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}



IIvlIn = \relative do'' {

    R1*3
    r8 do[la si] do[la] re4
    do fa4. mi16[re] mi4~\mbreak

    %6
    mi8[re re do] si[re sol, la]
    si[re do re] mi4 r
    r8 do[la si] do[si16 la] sol4~

    %9
    sol fad sol2
    r8 re'[si do] re[si] mi4\mbreak
    re do si la

    %12
    re2. do4~
    do si la r8 re
    si[do re si] mi4 re8[mi]

    %15
    do[re] mi2 re4\mbreak
    mi2 r8 mi[do re]
    mi[do] fa4 mi re

    %18
    do8 re4 do16[si] do2
    re2. la4~
    la8[si dod re] mi4 re~\mbreak

    %21
    re8[dod] re[sib] la4 r
    R1*2
    r8 fa'[re mi] fa[re] sol4

    %25
    fa4. mi16[re] mi2\mbreak
    re4 r4 r8  fa[re mi]
    fa4 r r2

    %28
    r8 fa[re mi] fa[re] sol4
    fa r r2
    R1*2

    %32
    r4 r8 do la[sib do la]
    re4 do sib8 do4 re8~
    re do4 si!8 do sol do4~

    %35
    do si do2\mbreak
    r r8 do[la si]
    do[la] re4. do16[si] do4~

    %38
    do si mi4. re8
    do[si la do] re[do si re]
    re do do2 si4\mbreak

    %41
    la2 sol8 sol'[re fa]
    sol[mi] la4 sol8 fa4 re8
    sol4 fa8[mi] re2

    %44
    r4 r8 do si[do re si]
    mi4 re8[do] si4 do
    si8[mi re do] re2

    %47
    r8 do si[do re si] mi4
    re do2 si4
    do8 sol[mi fa] sol[mi] la4

    %50
    sol2 r

}

IIvlIIn = \relative do'' {

    r8 sol[mi fa] sol[mi] la4
    sol4. fa8 mi[do] fa4
    mi8[re] sol[fa16 mi] re8 sol4 fad8

    %4
    sol4 r8 fa mi[fa] sol4~
    sol8[mi] la4 sol2\mbreak
    la r8 sol mi[fad]

    %7
    sol[re] la'4 sol la
    sol8 la4 fa8 sol2
    la re,

    %10
    r8 si'[sol la] si8.[la16] sol8[la]\mbreak
    re,[fad mi fad] sol4 la
    si la8[si] sol[fad mi sol]

    %13
    la4 r8 sol fad[sol la fad]
    sol4 r8 si sol[la si sol]
    la4 si la r8 la\mbreak

    %16
    sold[la si sold] do4. si16[la]
    sold8 la4 si8 do4 r
    r8 la[fad sold] mi4 mi

    %19
    re mi mi2
    re4 mi2 fa4\mbreak
    mi r4 r8 la[fa sol]

    %22
    la[fa] sol2 fa4
    r8 la[fa sol] la[fa] sib4
    la4. sol8 fa[sol] dod,[mi]

    %25
    la2 sol4. fa16[mi]\mbreak
    fa8[re] sib'4 la sib
    r8 do[la sib] do[la] re4

    %28
    do8 la[fa sol] la fa r sib
    la[sib do la] re4 do
    sib do sol2\mbreak

    %31
    fad4 sol8[sib] do4. sib16[la]
    sol2 fa?4 r8 la
    fa[sol la fa] sib[sol] la[sol]~

    %34
    sol la4 fa8 sol4 la
    sol2 r8 sol[mi fa]\mbreak
    sol[mi] la4 sol8[mi fa re]

    %37
    mi fa4 mi16[re] mi4. re16[do]
    re4 sol4. la8 sol4~
    sol fad sol r8 sol

    %40
    mi[fad sol mi] fad4 r8 sol\mbreak
    fad[sol la fad] si4 do8[la]
    si sol r4 r8 do[la si]

    %43
    do[sol re' do] si[la sol la]
    si[sol] do4 sol2~
    sol r8 sol[mi fa]\mbreak

    %46
    sol[mi] sol2 sol4
    sol1~
    sol

    %49
    sol8 mi[do re] mi[do] fa4
    mi2 r

}

IIvlan = \relative do' {

    R1
    r8 do[la si] do[la] re4
    do8[si sol la] si[sol] do4

    %4
    si8 mi do re mi do r4
    r2 r4 r8 do\mbreak
    la8[si do la] re4 do

    %7
    r2 r8 mi[do re]
    mi[do] fa4 mi8[mi, mi' re]
    do2 si8 re si do

    %10
    re[si] mi4 re4. do8\mbreak
    si8[la16 si] do8[la] re4 r8 fad
    re[mi fad re] sol2

    %13
    fad4 sol8 si, la[si do la]
    re[do si re] do4 si8[mi]~
    mi[re16 do] si4 do8[si] la4\mbreak

    %16
    si2 r
    r r8 do[la si]
    do la r4 r2

    %19
    r4 r8 mi' do[re mi do]
    fa4 mi8[re] dod4 re\mbreak
    mi4 r r r8 re

    %22
    dod[re] mi[si] mi4. re8
    dod4 re2 sol,4
    re' r r2

    %25
    R1\mbreak
    r8 fa[re mi] fa[re] sol4
    fa r r2

    %28
    R1
    r4 r8 fa re[mi fa do]
    sol'4 fa2  mib4\mbreak

    %31
    re2 mi4 fa~
    fa mi fa r8 fa
    re[mi fa re] sol4 fa

    %34
    mi fa mi fa8[mi]
    re2 mi\mbreak
    R1*3

    %39
    r4 r8 do si[do re si]
    do[re mi do] la4 si8[do]\mbreak
    re2 re4 r

    %42
    r8 mi[do re] mi[do] fa4
    mi r r8 re[si do]
    re[si] mi4 re8[mi fa re]

    %45
    do4 si8[do] re4 do\mbreak
    re8 sol, r8 mi' re[mi fa re]
    sol4 fa8[mi] re4 do

    %48
    re mi re2
    mi4 r r do
    do2 r

}

IIsopranon = \relative do'' {

    \autoBeamOff

    R1*3
    r8 do[la si] do[la] re4
    do fa4. mi16[re] mi4~\mbreak

    %6
    mi8[re re do] si[re sol, la]
    si[re do re] mi4 r
    r8 do[la si] do[si16 la] sol4~

    %9
    sol fad sol2
    r8 re'[si do] re[si] mi4\mbreak
    re do si la

    %12
    re2. do4~
    do si la r8 re
    si[do re si] mi4 re8[mi]

    %15
    do[re] mi2 re4\mbreak
    mi2 r8 mi[do re]
    mi[do] fa4 mi re

    %18
    do8 re4 do16[si] do2
    re2. la4~
    la8[si dod re] mi4 re~\mbreak

    %21
    re8[dod] re[sib] la4 r
    R1*2
    r8 fa'[re mi] fa[re] sol4

    %25
    fa4. mi16[re] mi2\mbreak
    re4 r4 r8  fa[re mi]
    fa4 r r2

    %28
    r8 fa[re mi] fa[re] sol4
    fa r r2
    R1*2

    %32
    r4 r8 do la[sib do la]
    re4 do sib8 do4 re8~
    re do4 si!8 do [sol] do4~

    %35
    do si do2\mbreak
    r r8 do[la si]
    do[la] re4. do16[si] do4~

    %38
    do si mi4. re8
    do[si la do] re[do si re]
    re do do2 si4\mbreak

    %41
    la2 sol8 sol'[re fa]
    sol[mi] la4 sol8 fa4 re8
    sol4 fa8[mi] re2

    %44
    r4 r8 do si[do re si]
    mi4 re8[do] si4 do
    si8[mi re do] re2

    %47
    r8 do si[do re si] mi4
    re do2 si4
    do8 sol[mi fa] sol[mi] la4

    %50
    sol2 r

}

IItestoI = \lyricmode {

    A - - men a - - - - men a - - - men a - - - men  a --  men a -- men a -- men  a - - - - - - men

    a - - - - - - - - - - - - - men a - - - - - men a -- men a - - men a - - - - - - - - - - - men

    a - - - - men a - - - - men a - - men a - - - - - - - men a - - - - - - men

    a - - - - - men a - - men.



}

IIalton = \relative do' {

    \autoBeamOff

    r8 sol'[mi fa] sol[mi] la4
    sol4. fa8 mi[do] fa4
    mi8[re] sol[fa16 mi] re8 sol4 fad8

    %4
    sol4 r8 fa mi[fa] sol4~
    sol8[mi] la4 sol2\mbreak
    la r8 sol mi[fad]

    %7
    sol[re] la'4 sol la
    sol8 la4 fa8 sol2
    la re,

    %10
    r8 si'[sol la] si8.[la16] sol8[la]\mbreak
    re,[fad mi fad] sol4 la
    si la8[si] sol[fad mi sol]

    %13
    la4 r8 sol fad[sol la fad]
    sol4 r8 si sol[la si sol]
    la4 si la r8 la\mbreak

    %16
    sold[la si sold] do4. si16[la]
    sold8 la4 si8 do4 r
    r8 la[fad sold] mi4 mi

    %19
    re mi mi2
    re4 mi2 fa4\mbreak
    mi r4 r8 la[fa sol]

    %22
    la[fa] sol2 fa4
    r8 la[fa sol] la[fa] sib4
    la4. sol8 fa[sol] dod,[mi]

    %25
    la2 sol4. fa16[mi]\mbreak
    fa8[re] sib'4 la sib
    r8 do[la sib] do[la] re4

    %28
    do8 la[fa sol] la fa r sib
    la[sib do la] re4 do
    sib do sol2\mbreak

    %31
    fad4 sol8[sib] do4. sib16[la]
    sol2 fa?4 r8 la
    fa[sol la fa] sib[sol] la[sol]~

    %34
    sol la4 fa8 sol4 la
    sol2 r8 sol[mi fa]\mbreak
    sol[mi] la4 sol8[mi fa re]

    %37
    mi fa4 mi16[re] mi4. re16[do]
    re4 sol4. la8 sol4~
    sol fad sol r8 sol

    %40
    mi[fad sol mi] fad4 r8 sol\mbreak
    fad[sol la fad] si4 do8[la]
    si sol r4 r8 do[la si]

    %43
    do[sol re' do] si[la sol la]
    si[sol] do4 sol2~
    sol r8 sol[mi fa]\mbreak

    %46
    sol[mi] sol2 sol4
    sol1~
    sol

    %49
    sol8 mi[do re] mi[do] fa4
    mi2 r

}

IItestoII = \lyricmode {

    A - - - - - - - - - - - men a - - - - men a - - -  men a - - - - - men a - - - - - - - - men

    a - men a - - - men a - - - - - - men a - men a -- men a -- men a - men

    a - -  men a - - - - - - - - - - - - men a - -  men a - men a - - - - - - - - - - - men

    a - - - - - - - men a - - - - - - - - - - - - -  men a - men a - - - - men a - - - - men

    a - - men a -- men a - - men.






}

IItenoren = \relative do' {

    \autoBeamOff

    R1
    r8 do[la si] do[la] re4
    do8[si sol la] si[sol] do4

    %4
    si8 mi[do re] mi do r4
    r2 r4 r8 do\mbreak
    la8[si do la] re4 do

    %7
    r2 r8 mi[do re]
    mi[do] fa4 mi8[mi, mi' re]
    do2 si8 re[si do]

    %10
    re[si] mi4 re4. do8\mbreak
    si8[la16 si] do8[la] re4 r8 fad
    re[mi fad re] sol2

    %13
    fad4 sol8 si, la[si do la]
    re[do si re] do4 si8[mi]~
    mi[re16 do] si4 do8[si] la4\mbreak

    %16
    si2 r
    r r8 do[la si]
    do la r4 r2

    %19
    r4 r8 mi' do[re mi do]
    fa4 mi8[re] dod4 re\mbreak
    mi4 r r r8 re

    %22
    dod[re] mi[si] mi4. re8
    dod4 re2  sol,4
    re' r r2

    %25
    R1\mbreak
    r8 fa[re mi] fa[re] sol4
    fa r r2

    %28
    R1
    r4 r8 fa re[mi fa do]
    sol'4 fa2  mib4\mbreak

    %31
    re2 mi4 fa~
    fa mi fa r8 fa
    re[mi fa re] sol4 fa

    %34
    mi fa mi fa8[mi]
    re2 mi\mbreak
    R1*3

    %39
    r4 r8 do si[do re si]
    do[re mi do] la4 si8[do]\mbreak
    re2 re4 r

    %42
    r8 mi[do re] mi[do] fa4
    mi r r8 re[si do]
    re[si] mi4 re8[mi fa re]

    %45
    do4 si8[do] re4 do\mbreak
    re8 sol, r8 mi' re[mi fa re]
    sol4 fa8[mi] re4 do

    %48
    re mi re2
    mi4 r r do
    do2 r

}

IItestoIII = \lyricmode {

    A - - - - - men a - men a - - men a - - - - men a - - - - - - men

    a - - - men a - - - - - - - men a - men a - - - - - men a - - - - - - - men

    a - - men a - - - - - - - - men a - - - - - - - - men a - - - - - men

    a - - men a - - - - - - - - men a - - - - - - men a -- men a -- men.

}

IIbasson = \relative do {

    \autoBeamOff

    R1*2
    r8 sol'[mi fa] sol[mi] la4
    sol8[mi fa re] do fa4 mi16[re]

    %5
    mi4 re mi do\mbreak
    fa4. fad8 sol[si do la]
    sol4 r r8 do[la si]

    %8
    do[la] re4 do8[do, do' si]
    la2 sol
    r r8 sol [mi fad]\mbreak

    %11
    sol[fad] la4 sol r8 re'
    si[do re si] mi2
    re4 sol, re2

    %14
    sol,4 r8 sol' mi[fad] sol[mi]
    la4 sol fa!2\mbreak
    mi r

    %17
    r r8 la[fad sold]
    la[fad] si4. la16[sold] la4~
    la sold la2

    %20
    re,4 la'4. sol8[fa re]\mbreak
    la la'[fa sol] la[fa] sib4
    la  r r2

    %23
    R1
    r8 re[si? dod] re[si] mi4~
    mi8[re16 dod] re2 dod4\mbreak

    %26
    re r r2
    R1
    r4 r8 do [la sib] do[la]

    %29
    re4 do sib la
    sol la si! do~\mbreak
    do sib2 la4

    %32
    sib do fa,2
    r r8 do'[la si!]
    do[la] re4 do fa,

    %35
    sol2 do,
    R1*2
    r4 r8 sol' [mi fa] sol[mi]

    %39
    la2 sol
    do, re4 sol\mbreak
    re2 sol,4 r

    %42
    r8 do'[la si] do[la] re4
    do fa, sol2~
    sol~ sol~

    %45
    sol sol~
    sol4 r8 do si[do re si]
    mi4 re8[do] si[sol] do4

    %48
    si do sol2
    do,4 r r fa
    do2 r

}

IItestoIV = \lyricmode {

    A - - - men a - - - - - men a - men a - - - - men a - - men a - - - - - men a - - - men

    a -- men a - - - - - - men a - men a - - men a - - - - men a - - - - - - - - - - - - - men

    a - - - - - men a - - men a - - - men a - - - men a -- men a - - - - - - men a -- men

    a -- men.

}

IIbcn = \relative do {

    \clef alto r8 sol''[mi fa] sol[mi] la4
    sol4. fa8 mi[do] fa4
    mi8 \clef bass  sol,[mi fa] sol[mi] la4
    sol8[mi fa re] do fa4 mi16[re]

    %5
    mi4 re mi do\mbreak
    fa4. fad8 sol[si do la]
    sol4 r r8 do[la si]

    %8
    do[la] re4 do8[do, do' si]
    la2 sol
    r r8 sol [mi fad]\mbreak

    %11
    sol[fad] la4 sol r8 re'
    si[do re si] mi2
    re4 sol, re2

    %14
    sol,4 r8 sol' mi[fad] sol[mi]
    la4 sol fa!2\mbreak
    mi r

    %17
    r r8 la[fad sold]
    la[fad] si4. la16[sold] la4~
    la sold la2

    %20
    re,4 la'4. sol8[fa re]\mbreak
    la la'[fa sol] la[fa] sib4
    la \clef tenor mi'8[si] mi4. re8
    dod4 re2  sol,4
    re8\clef bass re'[si? dod] re[si] mi4~
    mi8[re16 dod] re2 dod4\mbreak

    %26
    re8\clef tenor fa[re mi] fa[re] sol4
    fa8[\clef alto do'-! la-! sib-!] do-![la-!] re4-!
    do8-! [la fa\clef bass do] la [sib] do[la]

    %29
    re4 do sib la
    sol la si! do~\mbreak
    do sib2 la4

    %32
    sib do fa,2
    r r8 do'[la si!]
    do[la] re4 do fa,

    %35
    sol2 do,8\clef violin sol''-! mi-! fa-!]
    sol-![mi-!] la4-! <<{r8 do la si]
    do[la] re4. do16[si] do4~

    %38
    do si8}\\{sol8-![mi fa re]

    %37
    mi fa4 mi16[re] mi4. re16[do]
    re4 sol8[\clef bass sol,]}>>
    mi [fa] sol[mi]

    %39
    la2 sol
    do, re4 sol\mbreak
    re2 sol,4 r

    %42
    r8 do'[la si] do[la] re4
    do fa, sol2^\markup \italic "fagotto solo"~
    sol~ sol~

    %45
    sol~sol~
    sol~sol~
    sol~sol~

    %48
    sol4 do sol2
    do,4 r r fa
    do2 r

}

IIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1*2
    s4 <6>8 <6> s4 <7>8 <6\\>
    s <6> s <6> s \bassFigureExtendersOff <6 5>4 <6 2>8
    <6 3>2 <9>
    \bassFigureExtendersOn <7>4 <6>8 <6> s4 s8 <6\\>
    s2 s4 <5>8 <5>
    s4 <5>8 <6> s2
    <7>4 <6\\> s2
    s s4 <7>8 <5>16 s
    <5>8 <5>16 s <5>8 <6\\> s4 s8 <_+>
    <6>8 <6> <5 _+> <6> <7>4 <6>
    <7 _+>4 s <5 _+>2
    \bassFigureExtendersOff s2 <6>4 <6>
    s4 <6> <7> <6>
    s1
    s2 s4 <6>
    s8 <6> <5+>8 <6\\> <6 4 2>4 <6 4>4
    <4 2> <6> <9> <8>
    s <_+> s <6>
    <_+>4 <6> <_+>8 <6> <5> <6>
    <_+>4 <3>8 <6> <3>4 <2>
    <6>2 s4 <_->
    s4 <6> s8 <6> <6>4
    <4 2> <5 3> <4 2> <6 3>
    s8 <6> <3> <3> <3> <_+> <5>4
    <5>1
    <6>8 <6> s  s <6>2
    <5>8 <6> s4 s <6>
    s <6> <6 5> <_->
    <6 4\+> <6> <4!> <6>
    s1
    s2 s4 <6>
    s8 <5> <7>8 <6!> s4 <6>
    <4!>1
    s1
    s1
    s2 <6>
    <7>4 <6\\> s2
    <9>4 <8> <7 _+>2
    <_+>1
    s4 <5>8 <6> s <6> <5> <6>
    s2 <5 3>
    s1*4
    <5 3>2 <4>4 <3>
    s2 s4 <5 3>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*50
    \bar "|."

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIvla = {
    \clef alto
    <<\IIvlan \forma>>

}

IIsoprano = {
    \new Voice = "amen1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "amen2"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "amen3"
    <<\IItenoren \forma>>
}

IIbasso = {
    \clef bass
    \new Voice = "amen4"
    <<\IIbasson \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}
#(set-global-staff-size 16)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza\terzine

}

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {
        systems-per-page = #2
    }

    \header {
        subtitle = \markup "Magnificat a 4 [ZWV 107] "
        composer = \markup {"J. D. Zelenka (1679-1745)"}
    }

    \markup \huge {[1.] Vivace}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Oboi"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "ob1"
                        \IobI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "ob2"
                        \IobII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \IvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \IvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \Ivla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 sol'2 la'^\markup\center-align "Soprano"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "sop"
                    \Isoprano \global
                    \new Lyrics \lyricsto "magnificat1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r2 do'^\markup\center-align "Contralto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                        \set Staff.shortInstrumentName = "alt"
                    \Ialto \global
                    \new Lyrics \lyricsto "magnificat2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1 r2 sol^\markup\center-align"Tenor"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "ten"
                    \Itenore \global
                    \new Lyrics \lyricsto "magnificat3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                     \set Staff.shortInstrumentName = "bas"
                    \Ibasso \global
                    \new Lyrics \lyricsto "magnificat4" \ItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortmagnificat-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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
        systems-per-page = #2
    }

    \markup \huge {[2.] Presto ma non troppo}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 1.""Oboe 1. e 2."}
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.shortInstrumentName = "vl1"
                        \IIvlI\global
                    >>

                    \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \IIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \IIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r1*3 r8 do''[la' si']^\markup\center-align "Soprano"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "sop"
                    \IIsoprano \global
                    \new Lyrics \lyricsto "amen1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r8 sol'[mi' fa']^\markup\center-align "Contralto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "alt"
                    \IIalto \global
                    \new Lyrics \lyricsto "amen2" \IItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1 r8 do'[la si]^\markup\center-align"Tenor"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "ten"
                    \IItenore \global
                    \new Lyrics \lyricsto "amen3" \IItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                   \set Staff.shortInstrumentName = "bas"
                    \IIbasso \global
                    \new Lyrics \lyricsto "amen4" \IItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortmagnificat-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}
