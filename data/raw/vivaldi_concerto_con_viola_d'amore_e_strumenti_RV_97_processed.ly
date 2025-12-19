\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tr = \trill

ten = ^\markup \italic "ten"

dolce = _\markup\italic "dolce"

arco = _\markup \italic "Con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "Pizzicato"

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

trasp = \once \override Stem #'transparent = ##t

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



mbreak = { }

Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 8 \senza
}


Ivlan = \relative do'' {

    R1*5
    fa8~fa32 do sib do la8~la32 do sib do\mbreak fa,8~fa32 do' sib do la,8. \once\stemDown mib''16
    re16. sib32 sib,8 r4 re'8~re32 sol fa sol si,8~si32 re do re

    %8
    sol,8~sol32 re' do re si,8.\once\stemDown fa''16 mi16. [do32 do,8] r4
    sol''8.[sol16 la8. la16] sib?4. sib8
    sib8.[sib16 la8. sib16] \appoggiatura la8 sol8~sol32 fa mi re do8~do32 re mi fa

    %11
    sol8.[sol16 la8. la16]\mbreak sib4. sib8
    sib8.[sib16 la8. sib16] \appoggiatura la8 sol2\fermata
    <fa la, fa do la fa>8 [la16 sol fa8 la,] fa la do,  la'

    %14
    <fa' la, fa do la fa>8 [la16 sol fa8 la,] fa la do,  la'
    fa'8 sol16 la <<
        {
            s8 la la4\tr sol
            <fa la, fa do la fa>8 [sol16 la sib8 la] la4\tr sol
        }\\{
            sib8 do, do4 do
            s4 r8 do do4 do
        }
    >>
    R1*7

    %24
    <<
        {
            <<
                {
                    la'8[la la sib16 la] sol8[sol sol fa16 sol]
                    la8 [la la sib16 la] \appoggiatura la8 sol4 r
                    la,8[la la sib16 la] sol8[sol sol fa16 sol]

                    %27
                    la8[la la sib16 la] sol4
                }\\{
                    do8 do do do do do do do
                    do do do do do4 r
                    do, 8 do do do do do do do
                    do do do do do4
                }
            >> r
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \key fa\major <<
                {
                    la''8^\markup\italic"manoscritto"[la la sib16 la] sol8[sol sol fa16 sol]
                    la8 [la la sib16 la] \appoggiatura la8 sol4 r
                    la,8[la la sib16 la] sol8[sol sol fa16 sol]
                    la8[la la sib16 la] sol4
                }\\{
                    do1~
                    do2~do4 r
                    do,1~
                    do2~do4
                }
            >>
        }
    >>

    <<
        {
            la'16 la do do la la sol sol la la do do la la sol sol
            la8 fa' sol mi
        }\\{fa,16 fa fa fa fa fa do do fa fa fa fa fa fa do do fa4}
    >>  fa'4 r

    %30
    <<
        {
            la,16\p la do do la la sol sol la la do do la la sol sol
            la8 fa' sol mi
        }\\{fa,16 fa fa fa fa fa do do fa fa fa fa fa fa do do fa4}
    >>  fa'4 r
    R1*6

    %38
    r2 la,16. fa'32 do16. fa32 la,16. do32 fa,16. mib'32
    re16. sib32 fa16. [re32] sib8 r re'16. sol32 re16. sol32 si,16. re32 sol,16. fa'32
    mi16. do32 sol16. mi32 \once\stemUp do8 \once\stemDown fa' \tuplet 3/2 {
        sol16(fa mi) la[(sol fa)]  sib(la sol) la[(sol fa)]

        %41
        sol fa mi fa[mi re] mi re do re[do si] sol si do re[do si] sol si do re[do si]\mbreak
        fa si do re[do si] fa si do re [do si] mi re do re[do si] mi re do re[do si]
    }
    la'8 sol4 fa8 \tuplet 3/2 { mi16(sol fa mi[re do)] re(fa mi re[do si)] }

    %44
    \appoggiatura si?8 do4 r8 re \tuplet 3/2 { mi16 re do re[do si] mi re do re[do si] }
    la'8 sol4 fa8 \tuplet 3/2 { mi16(sol fa mi[re do)] re(fa mi re[do si)] }\mbreak
    do4 r r2

    %47
    R1*3
    <mi dod la>8[mi16 re dod8\tr si16 la] <fa' la, fa>8[ la16(sol fa mi re do?)]
    <sib? sol>8[re16 do sib8\tr la16 sol] <dod la>8[mi16 re dod8\tr si16 la]\mbreak

    %52
    fad'16 la do,? mib la, do fad, do' sib8[re16-.(do-. sib-. la-. sol-. fa?-.)]
    mib8[do'16-.(sib-. la-. sol-. fa-. mib-.)] re8[sib'16-.(la-. sol-. fa-. mib-. re-.)]
    do8[la'16-. (sol-.  fad-. mib?-. re-. do-.)] sib4 r8 re'

    %55
    \tuplet 3/2 { mib16(re do) mib[(re do)]  mib(re do) mib[(re do)]} re8 (fad sol la)
    \tuplet 3/2 { mib16(re do) mib[(re do)]  mib(re do) mib[(re do)]} re8 (fad sol la)
    \tuplet 3/2 { do,16(sib la) do[(sib la)]  do(sib la) do[(sib la)]} sib8 sol' la, fad'

    %58
    <<sol4\\<sol sib, sol> >> r r2
    R1*6
    <<
        {
            la,16 la do do la la sol sol la la do do la la sol sol
            la la do do la la sol sol la4
        }\\{
            fa8 fa fa do fa fa fa do
            fa fa fa do fa4
        }
    >> r

    %67
    <fa' la, fa do la fa>8 [la16 sol fa8 la,] fa la do,  la'
    <fa' la, fa do la fa>8 [la16 sol fa8 la,] fa la do,  la'
    <<sol4\\do,>> r r2

    %70
    <<
        {
            sol''16 [la sol la sol la sol sib] la[sib la sib la sib la sib]
            sol16 [la sol la sol la sol sib] la[sib la sib la sib la sib]
            sol4
        }\\{
            do,8 do do do do do do do
            do do do do do do do do
            do4
        }
    >>r r2\mbreak

    %73
    R1*3
    r4 r8 fa fa[do16 do do8 do]
    <<
        {
            la la16 la la8 do fa[fa16 fa fa8 sol]

            %78
            la16 la fa fa sol8 sol la16 la fa fa sol8 sol
            fa[do16 do do8 do]\mbreak do[la16 la la8 la]
        }\\{
            fa8 fa16 fa fa4 do'8[do16 do do8 do]
            do4 r8 do do4 r8 do
            do[la16 la la8 la]\mbreak la8[fa16 fa fa8 fa]
        }
    >>
    <<
        {
            <fa' do la fa do la fa>16 la, fa' la, fa la fa' la, fa la fa' la, fa la fa' la,

            %81
            fa la fa' la, fa la fa' la, fa sib fa' sib, fa sib fa' sib,
            sol si sol' si, sol si sol' si, sol si sol' si, sol si sol' si,
            sol si sol' si, sol si sol' si, sol do sol' do, sol do sol' do,

            %84
            sol do sol' do, sol do sol' do, sol do sol' do, sol do sol' do,
            sol do sol' do, sol do sol' do, sol do sol' do, sol do sol' do,
            <sol' do, sol>4 r4 r2
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \key fa\major <<
                {
                    fa1^\markup\italic"manoscritto"~
                    fa2 fa
                    sol1~
                    sol2 sol~
                    sol1~
                    sol2~sol~
                    sol4
                }\\{
                    <la, fa do la fa>1
                    <la fa do la fa>2 fa
                    <si sol>1
                    sol2 sol
                    <do sol>1
                    sol2 sol
                    sol4
                }\\{s1 s2 \stemUp\trasp sib s1 \trasp si2 \trasp do s1 \trasp do2 \trasp do \trasp do4}
            >>
        }
    >>

    %87
    R1
    r2 <<
        {
            la16 [la do do la la sol sol]
            la[la do do la la sol sol] la[ la do do la la sol sol]

            %90
            la8 fa' sol mi fa4
        }\\{
            fa,8 fa fa do
            fa fa fa do fa fa fa do
            fa4 s <fa' la, fa do la fa>
        }
    >> r
    <<
        {
            la,16 [la do do la la sol sol]  la[la do do la la sol sol]
            la[ la do do la la sol sol]  la8 fa' sol mi

            %93
            fa1\fermata
        }\\{
            fa,8 fa fa do fa fa fa do
            fa fa fa do fa4 s
            <la fa do la fa>1
        }
    >>

}

IcrIn = %\transpose fa do

\relative do' {

    fa,8.[fa16 la8. la16] do4. do8
    fa8.[fa16 do8. do16] la4. la8
    do8.[do16 la'8. la16]sol8. sol16 sol8. sol16

    %4
    do,2~do~
    do1
    R1*3

    %9
    sol'8.[sol16 la8. la16] sib4. sib8
    sib8.[sib16 la8. sib16] \appoggiatura la8 sol4 r
    sol8.[sol16 la8. la16] sib4. sib8

    %12
    sib8.[sib16 la8. sib16] \appoggiatura la8 sol2 \fermata
    R1*4
    fa8[la16 sol fa8 do] do la la fa'

    %18
    fa8[la16 sol fa8 do] do la la fa'\mbreak
    la16 sib la sib la sib la sib sol la sol la sol la sol sib
    la sib la sib la sib la sib sol4r

    %21
    R1*5
    la16 sol la8 r la sol16 fa sol8 r sol
    la16 sol la8 r la sol4 r

    %28
    la16 la do do la la sol sol la la do do la la sol sol
    la8 la sol sol fa4 r

    %30
    la16_\markup {[\musicglyph #"p"]} la do do la la sol sol la la do do la la sol sol
    la8 la sol sol fa4 r8 do
    fa[do16 do la8 fa'] la[fa16 fa do8 la']

    %33
    do la16 la fa4\mbreak  r r8 la
    la1\tr~
    la2 fa16 la do la fa la do la

    %36
    do, fa la fa do fa la fa la, do fa do la do fa do
    fa,8[fa16 fa fa fa fa fa]\mbreak la8[la16 la la la la la] %%%% inizio p.9
    do8[do16 do do do do do] fa4 r

    %39
    R1*26
    la16 la do do la la sol sol la la do do la la sol sol
    la la do do la la sol sol \mbreak fa8[la16 sol fa8 do]

    %67
    do la la fa' fa[la16 sol fa8 do]
    do la la sol' la16 sib la sib la sib la sib]
    sol[la sol la sol la sol sib] la[sib la sib la sib la sib]

    %70
    sol4 r r2
    R1
    r4 r8 do,  do la16 la la8 la]\mbreak

    %73
    fa[fa16 fa fa8 do'] fa[fa16 fa fa8 sol]
    la16 la fa fa sol8 do, la'16 la fa fa sol8 do,
    fa [do16 do do8 do] do[la16 la la8 la]

    %76
    la[fa16 fa fa8 fa] fa4 r
    R1*11
    r2 la'16 la do do la la sol sol

    %89
    la la do do la la sol sol la la do do la la sol sol
    la8 la sol sol fa4 r
    la16 la do do la la sol sol la la do do la la sol sol

    %92
    la la do do la la sol sol la8 la sol sol
    fa1\fermata

}


IcrIIn = \relative do' {

    r2 fa,8.[fa16 la8. la16]
    do4. do8 fa8.[fa16 do8. do16]
    la8. [la16 fa'8. fa16] do8. do16 do8. do16

    %4
    do2~do~
    do1
    R1*3

    %9
    do8.[do16 fa8. fa16] sol4. sol8
    sol8.[sol16 fa8. sol16] do,4 r
    do8.[do16 fa8. fa16] sol4. sol8

    %12
    sol8.[sol16 fa8. sol16] do,2\fermata
    R1*4
    do8 fa do la la fa fa do'

    %18
    do fa do la la fa fa  do'\mbreak
    fa16 sol fa sol fa sol fa sol do,8 do do do
    fa16 sol fa sol fa sol fa sol do,4 r

    %21
    R1*5
    fa16 do fa8 r fa do do r do
    fa16 do fa8 r fa\mbreak do4 r

    %28
    fa16 fa la la fa fa do do fa fa la la fa fa do do
    fa8 fa fa do la4 r
    fa'16_\markup {[\musicglyph #"p"]}  fa la la fa fa do do fa fa la la fa fa do do

    %31
    fa8 fa fa do la4 r
    r r8 do  fa[do16 do la8 fa']
    la fa16 fa do8 fa\mbreak fa16 la do la fa la do la

    %34
    do, fa la fa do fa la fa la, do fa do la do fa do
    fa,8[fa16 fa fa fa fa fa] fa4 r8 la'
    la1\tr~

    %37
    la2\mbreak do,8[do16 do do do do do]
    la8[la16 la la la la la] fa4 r
    R1*26

    %65
    fa'16 fa la la fa fa do do fa fa la la fa fa do do
    fa fa la la fa fa do do do8 fa do la
    la fa fa do' do fa do la

    %68
    la fa fa do'  fa16[sol fa sol fa sol fa sol]
    do,8 do do do fa16[sol fa sol fa sol fa sol]
    do,4 r r2

    %71
    R1
    r2 r4 r8 do\mbreak
    do[la16 la la8 la] fa[fa16 fa fa8 do']

    %74
    fa do do16 do do do fa8 do do16 do do do
    do8[la16 la la8 la]la[fa16 fa fa8 fa]
    fa[do16 do do8 do] la4 r

    %77
    R1*11
    r2 fa''16 fa la la fa fa do do
    fa fa la la fa fa do do fa fa la la fa fa do do

    %90
    fa8 fa do do la4 r
    fa'16 fa la la fa fa do do fa fa la la fa fa do do
    fa fa la la fa fa do do fa8 fa do do

    %93
    la1\fermata

}


IobIn = \relative do'' {

    R1*3
    sol'8. fa32 mi la8. la16 la4\tr sol
    sol8. fa32 mi la8. la16 la4\tr sol

    %6
    R1
    re8.[re16 \appoggiatura re8 mi8. fad16] \appoggiatura fad8 sol4 r
    r2 mi8.[mi16 mi8. fa?16]

    %9
    sol8.[sol16 la8. la16] sib4. sib8
    sib8.[sib16 la8. sib16] \appoggiatura la8 sol4 r
    sol8.[sol16 la8. la16] sib4. sib8

    %12
    sib8.[sib16 la8. sib16] \appoggiatura la8 sol2\fermata
    R1*7
    r2  mi16(fa sol8) \once\slurDashed sol16 (la sib8)

    %21
    la,16(sib do8) do16(re mi8) mi16(fa sol8) sol16 (la sib8)
    la,16 sib do8 do16 re mib8 re16 sib la sib re sib la sib
    si do re8 re16 mi? fa8 mi16 do si do mi do si do

    %24
    la' sol la8 r la sol16 fa sol8 r sol
    la16 sol la8 r la sol4 r
    R1*2

    %28
    la,16 la do do la la sol sol la la do do la la sol sol
    la8 la sol sol fa4 r
    la16_\markup {[\musicglyph #"p"]}  la do do la la sol sol la la do do la la sol sol

    %31
    la8 la sol sol la4 r
    R1*9
    \tuplet 3/2 { sib'16 la sol la[sol fa] sol fa mi fa[mi re] } sol2\tr~

    %42
    sol~sol4 r
    R1
    r4 r8 sol \tuplet 3/2 { sol16 fa mi fa[mi re] sol fa mi fa[mi re] }

    %45
    fa8 mi4 re8 do4 r\mbreak
    r8 sol'16[fa sol mi re do] la'2~
    la8[fa16 mi fa re do si] sol'2~

    %48
    sol8[mi16 re mi do sib! la] fa'2
    mi16 fa fa sol sol fa fa mi mi fa fa sol sol fa fa mi
    mi4 r r2

    %51
    R1*4
    \tuplet 3/2 { do16 sib la do[sib la] do sib la do[sib la] } r2
    r8 fad'(sol la) do,4 r

    %57
    \tuplet 3/2{ la16 sol fad la[sol fad] la sol fad la[sol fad]}\mbreak r2
    r2 do'16 mib sol do do, mib sol do
    la8 la la4\tr sib,16 re fa sib sib, re fa sib

    %60
    sol8 sol sol4\tr la,16 do fad la la, do fad la
    re, sib mib8~mib16 do re8~re16 sib mib8~mib16 do re8~
    re16 sib mib8~mib16 do re8~re sol fa?16 mi fa re\mbreak

    %63
    dod la re8~re16 si dod8~dod16 la re8~re16 si mi8~
    mi16 dod re sol mi8.\tr re16 re4 r
    la16 la do do la la sol sol la la do do la la sol sol

    %66
    la la do do la la sol sol\mbreak la4 r
    R1*3
    mi'16[fa mi fa mi fa mi sol] fa[sol fa sol fa sol fa sol]

    %71
    mi[fa mi fa mi fa mi sol] fa[sol fa sol fa sol fa sol]
    mi4 r r2
    R1*3

    %76
    r4 r8 fa, fa4 r8 fa
    fa4 r8 fa fa4 r8 do
    fa[fa16 fa mi8 do] fa[fa16 fa mi8 do]

    %79
    fa[fa16 fa fa8 fa]\mbreak fa[fa16 fa fa8 fa]
    do'16 fa la8~la16 fa do8~do16 la mib'8~mib16 do fa8~
    fa16 do la'8~la16 mib re do re8 sib r4

    %82
    re16 sol si8~si16 sol re8~re16 si fa'8~fa16 re sol8~
    sol16 re si'8~si16 fa mi re mi8 do r do

    %84
    do16 mi sol mi do mi sol mi do8 sol4 mi8
    do'16 mi sol mi do mi sol mi\mbreak do8 sol4 mi8
    sol'8.[la16 la8. sib?16] sib4. la8

    %87
    sib4. la8 sib4. la16 sol
    la8 la, sib sol la16[la do do la la sol sol]
    la[la do do la la sol sol] la[la do do la la sol sol]

    %90
    la8 la sol sol fa4 r
    la16[la do do la la sol sol] la[la do do la la sol sol]
    la[la do do la la sol sol] la8 la sol sol

    %93
    la1\fermata

}


IobIIn = \relative do'' {

    R1*3
    mi8. re32 do fa8. fa16 fa4\tr mi
    mi8. re32 do fa8. fa16 fa4\tr mi

    %6
    R1
    re8.[re16 \appoggiatura re8 do8. do16] \appoggiatura do8 si4 r
    r2 do8.[do16 do8. re16]

    %9
    mi8. [mi16 fa8. fa16] sol4. sol8
    sol8.[sol16 fa8. sol16] \appoggiatura fa8 mi4 r
    mi8. [mi16 fa8. fa16] sol4. sol8

    %12
    sol8.[sol16 fa8. sol16] \appoggiatura fa8 mi2\fermata
    R1*7
    r2 do16(re mi8) mi16(fa sol8)

    %21
    fa,16(sol la8) la16(sib do8) \slurDashed do16 (re mi8) mi16 (fa sol8)\slurSolid
    fa,16 sol la8 la16 sib do8 sib fa\tr sib[fa\tr]
    sol16 la si8 si16 do re8 do[sol\tr] do sol\tr \mbreak

    %24
    fa'16 mi fa8 r fa mi16 re mi8 r mi
    fa16 mi fa8 r fa mi4 r
    R1*2

    %28
    fa,16 fa la la fa fa mi mi fa fa la la fa fa mi mi
    fa8 fa fa mi fa4 r
    fa16_\markup {[\musicglyph #"p"]} fa la la fa fa mi mi fa fa la la fa fa mi mi

    %31
    fa8 fa fa mi fa4 r
    R1*8
    r2 \tuplet 3/2 { mi'16 re do fa[mi re] sol fa mi fa[mi re] }

    %41
    mi4 r r2
    r \tuplet 3/2 { sol16 fa mi fa[mi re] sol fa mi fa[mi re] }
    fa8 mi4 re8 do4 r

    %44
    R1*2
    r2 r8 do16[si? do la sol fa]
    re'2~re8[si16 la si sol fa mi]

    %48
    do'2~do8[la16 sol la fa mi re]
    dod' re re mi mi re re dod dod re re mi mi re re dod
    dod?4 r r2

    %51
    R1*4
    r8 fad(sol la) do,4 r
    \tuplet 3/2 { do16 sib la do[sib la] do sib la do[sib la] } r2

    %57
    R1
    sol16 sib re sol sol, sib re sol mib8 mib mib4
    fa,16 la do fa fa, la do fa re8 re re4\tr

    %60
    mib,16 sol sib mib mib, sol sib mib do8 do do4\tr
    sib16 sol do8~do16 la sib8~sib16 sol do8~do16 la sib8~
    sib16 sol do8~do16 la sib8~sib8 sib' la16 sol la fa\mbreak

    %63
    mi!16 dod fa8~fa16 re mi8~mi16 dod fa8~fa16 re sol8~
    sol16 mi fa re dod8.\tr re16 re4 r
    fa,16 fa la la fa fa mi mi fa fa la la fa fa mi mi

    %66
    fa fa la la fa fa mi mi\mbreak fa4 r
    R1*9
    r4 r8 fa fa4 r8 fa

    %77
    fa4 r8 fa fa4 r8 do
    fa[fa16 fa mi8 do] fa[fa16 fa mi8 do]
    fa[fa16 fa fa8 fa]\mbreak fa[fa16 fa fa8 fa]

    %80
    la16 do fa8~fa16 do la8~la16 fa do'8~do16 la do8~
    do16 la fa'8~fa16 do sib la sib4 r
    si16 re sol8~sol16 re si8~si16 sol re'8~re16 si re8~

    %83
    re16 si sol'8~sol16 re do si do4 r
    r r8 do do16 mi sol mi do mi sol mi
    do8 sol4 mi8\mbreak do'16 mi sol mi do mi sol mi

    %86
    mi8.[fa16 fa8. sol16] sol4. fa8
    sol4. fa8 sol4. fa16 mi
    fa8 fa, sol mi fa16 [fa la la fa fa mi mi]

    %89
    fa [fa la la fa fa mi mi] fa [fa la la fa fa mi mi]
    fa8 fa fa mi fa4 r
    fa16 [fa la la fa fa mi mi] fa [fa la la fa fa mi mi]

    %92
    fa [fa la la fa fa mi mi] fa8 fa fa mi
    fa1\fermata

}


Ifgn = \relative do {

    fa8 r32 fa mi re do8 r32 sib la sol fa8 r32 fa' mi re do8 r32 sib la sol
    fa8 r32 fa' mi re do8 r32 sib la sol fa8 r32 fa' mi re do8 r32 sib la sol
    fa8 r32 fa' mi re do8 r32 la sol fa do'2~

    %4
    do1~
    do
    fa8.[sol16 fa8. fa,16]\mbreak fa'8.[sol16 fa8. fa,16]

    %7
    sib8.[sib16 la8. la16] sol8.[sol'16 sol8. sol,16]
    sol'8. [la16 sol8. sol,16] do8. [do16 do8. do16]
    do8 r32 sib' la sol fa8 r32 fa mi re do8 r32 do' sib la sol8 r32 fa mi re

    %10
    do8 r32 do re mi fa8 r32 re do sib do4 r
    do8 r32 sib' la sol fa8 r32 fa mi re\mbreak do8 r32 do' sib la sol8 r32 fa mi re
    do8 r32 do re mi fa8 r32 re do sib do2\fermata

    %13
    fa4 r8 fa fa16 mi fa sol la8[fa]
    fa,4 r8 fa' fa16 mi fa sol la8[fa]
    fa, fa' mi fa do16 sib do re mi8 do

    %16
    fa, fa' mi fa do16 sib do re mi8 do
    fa,4 r8 fa' fa16 la do la fa la do la
    fa4 r8 fa fa16 la do la fa la do la\mbreak

    %19
    fa4 r8 fa mi16 fa mi fa mi fa mi sol
    fa4 r8 sib, do4 r
    R1*3

    %24
    r8 fa16[sol la sol fa8] r do16 re mi re do8
    r fa16 sol la sol fa8 r do16 re mi fa sol do,
    fa,8 fa'16 sol la sol fa8 r do16 re mi re do8

    %27
    r fa16 sol la sol fa8\mbreak r do16[re  mi fa sol do,]
    fa,8 fa fa do' fa, fa fa do'
    fa, fa do' do, fa16[fa' mi re do sib la sol]

    %30
    fa8 fa fa do' fa, fa fa do'
    fa, fa do' do, fa4 r
    fa'16[sol la sib do sib la sol] fa[sol la sib do sib la sol]

    %33
    fa[sol la sib do sib la sol]\mbreak fa4. fa16 fa
    la,4. la16 la fa4. fa16 fa
    fa8[fa16 fa fa fa fa fa] fa'4. fa16 fa

    %36
    la,4. la16 la fa4. fa16 fa
    fa8[fa16 fa fa fa fa fa]\mbreak fa8[fa16 fa fa fa fa fa]
    fa8[fa16 fa fa fa fa fa] fa8[fa'16 mi fa la sol fa]

    %39
    sib,4~sib16 sib do re sol,8[sol'16 fa sol si la sol]
    do,4. fa,8 do'2~
    do4. sol'8 sol,4 r\mbreak

    %42
    sol r do8 sol do sol
    fa4 sol do sol
    do16 re mi fa sol si, la sol do8 sol do sol

    %45
    fa4 sol do sol\mbreak
    do8[mi16 re mi do re mi] fa16[fa, la' sol la fa sol la]
    si[si, re do re si do re] mi[mi, sol' fa sol mi fa sol]

    %48
    la[la, do sib! do la sib do] re[re, fa' mi fa re mi fa]
    la,1~
    la8 la si dod r re mi fa

    %51
    r sol, la sib? r la si! dod\mbreak
    re4 r sol, r
    do r sib r

    %54
    la r sol8[mib'16 re do sib la sol]
    fad4 fad fad r
    fad? fad fad r

    %57
    re' re\mbreak sol,16 la sib do re8 re,
    sol la sib sol do re mib do
    fa sol la fa sib, do re sib

    %60
    mib fa sol mib fad, sol la fad
    sol4 sol sol sol
    sol sol sol8 sol' re' re,\mbreak

    %63
    la4 la la la
    la8 re16 sib' la8 la, re4 r
    fa,8 fa fa do' fa, fa fa do'

    %66
    fa, fa fa do' fa,4 r8 fa
    fa4 r8 fa fa4 r8 fa
    fa4 r8 do' fa,4 r8 sib'

    %69
    mi,16 fa mi fa mi fa mi sol fa4 r8 sib,
    do4 r8 do fa4 r8 fa
    do4 r8 do fa4 r8 fa

    %72
    do16 re mi fa sol mi re do fa sol la sib do sib la sol\mbreak
    fa sol la sib do la sol fa fa,sol la sib do sol fa mi
    fa8[fa'16 fa mi8 mi] fa[fa16 fa mi8 mi]

    %75
    fa16[sol la sib do sib la sol] fa16[sol la sib do sib la sol]
    fa16[sol la sib do sib la sol] fa4 r
    R1*3

    %80
    fa4 fa fa fa
    fa fa sib,16 re mib fa sib, re mib fa
    sol4 sol sol sol

    %83
    sol sol do,16 mi? fa sol do, mi fa sol
    do,4 do do do
    do do\mbreak do do

    %86
    do do do16 mi sol mi do mi la fa
    do mi sol mi do mi la fa do mi sol mi do mi sol do,
    fa8 fa sib, do fa, fa fa do'

    %89
    fa, fa fa do' fa, fa fa do'
    fa, fa do' do, fa16[fa' mi re do sib la sol]
    fa8 fa fa do' fa, fa fa do'

    %92
    fa, fa fa do' fa, fa do' do,
    fa1\fermata

}


Ibcn = \relative do {

    \once\tieUp fa,1_\markup {
        \center-column{"Accordatura della"\vspace #-0.2" Viola d'Amor" \vspace #-0.2 \smaller "[all'ottava]" }
        \hspace #-9
        \score {
            \new Staff  \with {fontSize = #-2 \override StaffSymbol #'staff-space = #(magstep -2)}<<
               \clef bass <mi' la, fa do la fa,>
            >>
        }
    }~
    fa~
    fa2 do'~

    %4
    do1~
    do
    R1*3

    %9
    do8. [do16 do8. do16] do4. do8
    do8. do16 fa8. sib,16 do4 r
    do8. [do16 do8. do16]\mbreak do4. do8

    %12
    do8. do16 fa8. sib,16 do2\fermata
    R1*4
    fa,1~

    %18
    fa\mbreak
    fa4 r8 sib do4 r8 mi
    fa4 r8 sib, do sib' la sol

    %21
    fa, fa' mi re do sib' la sol
    fa, la' sol fa sib,4 r
    sol8 si' la sol do,4 r\mbreak % fine p. 5

    %24
    fa,4 r do' r
    fa, r do' r
    fa, r do' r

    %27
    fa, r do' r
    fa,8 fa fa do' fa, fa fa do'
    fa, fa do' do, fa4 r

    %30
    fa8 fa fa do' fa, fa fa do'
    fa, fa do' do, fa4 r
    fa r fa r

    %33
    fa r\mbreak fa2~
    fa1~
    fa8[fa16 fa fa fa fa fa] fa2~

    %36
    fa1~
    fa8[fa16 fa fa fa fa fa] \mbreak fa8[fa16 fa fa fa fa fa]
    fa8[fa16 fa fa fa fa fa] fa2

    %39
    sib sol
    do4. fa,8 do'2~
    do4. sol'8 sol,4 r\mbreak

    %42
    sol r do8 sol do sol
    fa4 sol do sol
    do4 r do8 sol do sol

    %45
    fa4 sol do sol\mbreak
    do4 r fa r
    si, r mi r

    %48
    la, r re r
    la1~
    la4 r re r

    %51
    sol, r la r\mbreak
    re r sol, r
    do r sib r

    %54
    la r sol r
    fad fad fad r
    fad? fad fad r

    %57
    re' re\mbreak sol,16 la sib do re8 re,
    sol la sib sol do re mib do
    fa sol la fa sib, do re sib

    %60
    mib fa sol mib fad, sol la fad
    sol4 sol sol sol
    sol sol sol8 sol' re' re,\mbreak

    %63
    la4 la la la
    la8 re16 sib' la8 la, re4 r
    fa,8 fa fa do' fa, fa fa do'

    %66
    fa, fa fa do' fa,4 r8 fa
    fa4 r8 fa fa4 r8 fa
    fa4 r8 do' fa,4 r8 sib

    %69
    do4 r8 do fa4 r8 sib,
    do4 r8 do fa4 r8 fa
    do4 r8 do fa4 r8 fa

    %72
    do4 r8 do fa fa fa fa\mbreak
    fa fa fa fa fa fa fa fa
    fa,[fa'16 fa mi8 mi] fa[fa16 fa mi8 mi]

    %75
    fa4 r8 fa fa4 r8 fa
    fa4 r8 fa fa4 r\mbreak
    R1*3

    %80
    fa4 fa fa fa
    fa fa sib, r
    sol' sol sol sol

    %83
    sol  sol do, r
    do do do do
    do do\mbreak do do

    %86
    do do do r
    do r do r
    fa8 fa sib, do fa, fa fa do'

    %89
    fa, fa fa do' fa, fa fa do'
    fa, fa do' do, fa4 r
    fa8 fa fa do' fa, fa fa do'

    %92
    fa, fa fa do' fa, fa do' do,
    fa1\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 4/4
    \tempo 4 = 50
    \key fa\major
    s1*12
    \bar"||"\break
    \mark\markup\huge"[2.] Allegro"
    \tempo 2 = 50
    s1*81
    \bar"|."

}

Ivla = {
    \Iglobal
    \notypeset
    <<\Ivlan \forma>>

}

IcrI = {
    \Iglobal
    \clef "treble_8"
    <<\IcrIn \forma>>

}

IcrII = {
    \Iglobal
    \clef "treble_8"
    <<\IcrIIn \forma>>

}

IobI = {
    \Iglobal
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

}

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma\Ibfn >>
    \typeset

}


IIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\tupletSpan 4 \senza
			}


IIvlan = \relative do' {

    fa'4 \appoggiatura la8 sol fa16 mi \appoggiatura mi8 fa4 r8 do
    la' fa do16(sib la sib) sib8\tr la r4
    R1

    %4
    r4 r8 la' la4\tr sol
    fa,8(la do la') la sol16 fa sol4
    R1\mbreak

    %7
    \parenthesize mi,8_\markup\italic\smaller"half measure missing (Malipiero source)" \parenthesize  sol\parenthesize  do \parenthesize  mi <<{\stemDown fa16. sol32(fa16.) mi32(re16.) mi32(re16.) do32(
    \stemUp si4)}\\{\stemDown s2 sol8 [sol']}>> fa16(mi) re(do) <<si4\\{sol8[sol']}>> fa16(mi) re(do)
    <<si4\\{sol8[la']}>> sol16(fa) mi(re)  <<mi4\\{do8[sol']}>> fa16(mi) re(do)

    %10
    <<{si4.\tr do8 <mi do sol>2}\\{sol, do,}>>
    do'4 \appoggiatura fa8 mi re16 do sol'2~
    sol8 sib? la16(sol) fa(mi) fa8 la, re4~

    %13
    re8[dod16 si dod8 sol'] fa16 la sol fa mi8. re16
    re4 r fa \appoggiatura la8 sol fa16 mi\mbreak
    fa4 r8 do la'(fa) do16(sib la sib)

    %16
    sib8\tr la r la' la[sol16 fa sol8 sib,]
    sib la16 sol la8 fa' mi16. sol32 do,16. sol'32 sib,16. sol'32 sol,16. sib32
    la8 do mib re16 do re8 sib fa' mi?16  re

    %19
    mi8 do sib' la16 sol la sol fa mi fa8 sib
    sol4.\tr fa8 fa2\fermata

}


IIobIn = \relative do'' {

    R1
    r2 fa4 \appoggiatura la8 sol fa16 mi
    \appoggiatura mi8 fa4 r8 do la' fa do16 sib la sib

    %4
    sib8\tr la r fa' fa4\tr mi
    R1
    sol,8 do mi sib' sib\tr la16 sol la4\mbreak

    %7
    \parenthesize do(\parenthesize sib) la16. sib32(la16.) sol32(fa16.) sol32(fa16.) mi32(
    re4) re16(do) si(la) sol4 re'16(do) si(la)
    sol4 mi'16(re) do(si) do4 la'16(sol) fa(mi)

    %10
    re4.\tr do8 do2
    r sol4 \appoggiatura do8 si la16 sol
    dod8(sol' mi dod) re4 r8 la

    %13
    mi'4. mi8 re16 fa mi re dod8.\tr re16
    re4 r r2\mbreak
    fa4 \appoggiatura la8 sol fa16 mi fa4 r

    %16
    r r8 fa fa[mi16 re mi8 sol,]
    sol fa16 mi fa8 la' sol mi16. fa32 sol8 mi
    fa fa, r fa' fa re r sol

    %19
    sol mi r mi fa8.[sol16 la8 fa]
    fa4 mi fa2\fermata

}


IIfgn = \relative do {

    fa16 sol la fa sib8 do fa,16 sol la fa mi fa sol mi
    fa8 la mi do fa16 sol la fa sib8 do\mbreak
    fa,16 sol la fa mi fa sol  mi  fa8 la mi do

    %4
    fa16 sol la sol fa sol la fa do re mi fa do re mi do
    fa4. fa8 do'4 do,
    do4. do8 fa4 fa,

    %7
    \parenthesize do' \parenthesize do' fa,2
    sol 4 r sol, r
    sol r mi'8 do fa4

    %10
    sol sol, do2
    do16 re  mi re do8 do' si16 do si la sol8 sol,
    la4. la8 re16 mi fa mi re8 re'

    %13
    la4. la,8 re sol la la,
    re16 fa  mi re do sib? la sol fa sol la fa sib8 do\mbreak
    fa16 sol la fa sib8 do fa, la mi do

    %16
    fa16 sol la sib do la sol fa do4. do8
    fa4. fa8 do do16. re32 mi8 do
    fa4 r8 la sib sib, r si'

    %19
    do do, r do' fa, do' fa, re'
    do4 do, fa,2\fermata

}


forma = {

\time 4/4
\tempo 4 = 40
\key fa\major
s1*10
\bar":..:"\break
s1*10
\bar":|."

}

IIvla = {
	\IIglobal
	\notypeset
	<<\IIvlan \forma>>

}

IIobI = {
	\IIglobal
	<<\IIobIn \forma>>

}

IIfg = {
	\IIglobal
	\clef bass
	<<\IIfgn \forma>>
	\typeset

}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 4 \con
}


IIIvlan = \relative do'' {

    <<{<fa la, fa do la>8[la16 sol fa8]}\\fa,,4>>
    <<{<fa'' la, fa do la>8[la16 sol fa8]}\\fa,,4>>
    <<
        {
            mi''8 fa sol

            %4
            <la do, fa, do la>[sol16 la fa8]
            <fa la, fa do la>[la16 sol fa8]
            <fa la, fa do la>[la16 sol fa8]

            %7
            la,[\slurDown sib16(la) sol(fa)]
            sol4.
            la8 sib16 la sol fa

            %10
            sol4.
        }\\{
            do
            fa,,4 s8
            fa4 s8
            fa4 s8
            fa'4 s8
            do4.
            fa4 s8
            do4.
        }
    >>\slurNeutral
    R4.*9
    sib''16 do, sib' do, sib' do,

    %21
    sib' do, sib' do, sib' do,
    la' do, la' do, la' do,
    la' do, la' do, la' do,

    %24
    sol' do, sol' do, sol' do,
    sol' do, sol' do, sol' do,
    <<fa4\\do>> r8

    %27
    R4.*3
    fa16 la sol32[(la) sol(fa)] mi16 re
    do fa mi32[(fa) mi(re)] do16 sib

    %32
    la re do32[(re) do(sib)] la16 sol
    fa la sol32[(la) sol(fa)] mi16 re
    do fa mi32[(fa) mi(re)] do16 sib

    %35
    la re do32[(re) do(sib)] la16 sol
    fa4 r8
    R4.*8

    %45
    <<
        {
            <fa'' la, fa do la>8[mi16 re do8]
            re4\tr do8
            <fa la, fa do la> mi16 re do sib

            %48
            sib4\tr la8
            <fa' la, fa do la> sol la
        }\\{
            fa,,4 s8
            fa'4 fa8
            fa,4 r8
            fa'4 fa8
            fa,4 r8
        }
    >>
    sol''16 mi do sol do,8

    %51
    <<{sib''8 la sol}\\do,4.>>
    la'16 fa do la fa8
    fa'16 mi re do si la

    %54
    sol fa mi re do8\mbreak
    <<
        {
            do' re si
            mi4 s8
        }\\{
            sol,4 sol8
            \once\slurUp \once\stemUp \appoggiatura si? <do sol do,>4.
        }
    >>

    %57
    fa16 mi re do si la
    sol fa mi re do8
    <<
        {
            do' re si

            %60
            mi4 s8
        }\\{
            sol,4 sol8
            \once\slurUp \once\stemUp \appoggiatura si? <do sol do,>4.
        }
    >>
    R4.*9

    %70
    <<
        {
            re8 do16 sib? la8
            sib4\tr la8
        }\\{
            fa4.
            sol4 fa8
        }
    >>
    re' mi16 fa sol mi

    %73
    <<
        {
            \appoggiatura re8 dod8.\tr si16 la8
            dod8 dod16 re mi re
            re4\tr dod8

            %76
            dod? dod16 re mi re
            re4\tr dod8
            dod,8 dod16 re mi re

            %79
            re4\tr dod8
            dod? dod16 re mi re
            re4\tr dod8
        }\\{
            la'8 la la
            la4 la8
            la4 la8
            la la la
            la4 la8
            la,  la la
            la4 la8
            la la la
            la4 la8
        }
    >>

    %82
    la16 la'(sol fa  mi re)
    la sib'(la sol fa mi)
    la, dod'(si la sol fa)

    %85
    la, re' dod si la sol\mbreak
    la, mi'' re dod si la
    la, fa'' mi re dod si

    %88
    la sol' <<{fa8 mi16\tr re}\\la4>>
    re4 r8
    R4.*22

    %112
    <<
        {
            la'16 la fa fa fa fa
            fa fa do do la la
            do do la la fa fa
        }\\{
            do' do do do la la
            do do fa, fa fa fa
            fa fa fa fa do do
        }
    >>

    %115
    R4.*16
    <<{<fa' la, fa do la>8[la16 sol fa8]}\\fa,,4>>
    <<{<fa'' la, fa do la>8[la16 sol fa8]}\\fa,,4>>

    %133
    <<
        {
            mi''8 fa sol
            <la do, fa, do la>[sol16 la fa8]
            la,[\slurDown sib16(la) sol(fa)]

            %136
            sol4.
            la8 sib16 la sol fa
            sol4.
        }\\{
            do
            fa,,4 s8
            fa'4 s8
            do4.
            fa4 s8
            do4.
        }
    >>\slurNeutral

    %139
    R4.*5
    <<{<fa' la, fa do la>8[la16 sol fa8]}\\fa,,4>>
    <<{<fa'' la, fa do la>8[la16 sol fa8]}\\fa,,4>>

    %146
    <<
        {
            mi''8 fa sol
            <la do, fa, do la>[sol16 la fa8]
        }\\{
            do4.
            fa,,4 s8
        }
    >>
    <<
        {
            fa''8 fa16 fa fa fa

            %149
            la,8 fa'16 fa fa fa
            fa8 sol16 sol sol sol
            la8 sol16 sol sol sol\mbreak

            %152
            fa4
        }\\{
            do8 do16 do do do
            fa,8 do'16 do do do
            la8 do16 do do do
            do8 do16 do do do\mbreak
            <la fa do la>4
        }
    >> r8
    <<
        {
            fa'8 fa16 fa fa fa
            la,8 fa'16 fa fa fa

            %155
            fa8 sol16 sol sol sol
            la8 sol16 sol sol sol
            fa8 do16 do do do

            %158
            do8 la16 la la la
            la8 fa16 fa fa fa
            fa4 s8

            %161
            fa'4.\fermata
        }\\{
            do8 do16 do do do
            fa,8 do'16 do do do
            la8 do16 do do do
            do8 do16 do do do
            do8 la16 la la la
            la8 fa16 fa fa fa
            fa8 do16 do do do
            do8 sol'' mi
            <la, fa do la fa>4.
        }
    >>   %%%%% 161

}

IIIcrIn =  \relative do' {

    R4.*17
    la8 do4
    fa8 la4

    %20
    sol8 sib4
    do,8 do16 do do do
    fa8 la4

    %23
    do,8 do16 do do do
    sol'8 sib4
    do,8 do16 do do do

    %26
    la' sol la sib do sib
    la sol la sib do sib\mbreak
    la4.\tr~

    %29
    \once\tieDashed la~
    la~
    la~

    %32
    la~
    la~
    la~

    %35
    la~
    la4 r8
    R4.

    %38
    la,16 do fa la fa do
    la do fa la fa do\mbreak
    la8 la16 la la la

    %41
    fa'8 sol16 sol sol sol
    la8 sol16 sol sol sol
    fa8 sol16 sol sol sol

    %44
    la8 sol16 sol sol sol
    fa4 r8
    R4.*57

    %103
    la,8 do4
    fa8 la4
    sol8 sol16 sol sol sol

    %106
    la8 sib do
    sol sol16 sol sol sol
    la8 sib do

    %109
    la16 la fa fa do do
    fa fa do do la la
    do do la la fa fa\mbreak

    %112
    R4.*10
    do'8 do16 do do do
    la8 la16 la la la

    %124
    fa'8 sol16 sol sol sol\mbreak
    la8 sol16 sol sol sol
    fa4 r8

    %127
    do8 do16 do do do
    la8 la16 la la la
    fa'8 sol16 sol sol sol

    %130
    la8 sol16 sol sol sol
    fa4 r8
    la4 r8

    %133
    sol4 r8
    la4 r8
    la4 r8

    %136
    sol4 r8
    la4 r8
    sol4 r8\mbreak

    %139
    R4.*5
    fa8 la16 sol fa8
    fa la16 sol fa8

    %146
    mi fa sol
    la sol16 la fa8
    do do16 do do do

    %149
    la8 do16 do do do
    fa8 sol16 sol sol sol
    la8 sol16 sol sol sol\mbreak

    %152
    fa4 r8
    do do16 do do do
    la8 la16 la la la

    %155
    fa'8 sol16 sol sol sol
    la8 sol16 sol sol sol
    fa8 do16 do do do

    %158
    la8 la16 la la la
    fa8 fa16 fa fa fa
    fa'8 sol mi

    %161
    fa4.\fermata

}


IIIcrIIn = \relative do' {

    R4.*17
    fa,8 la4
    do8 fa4

    %20
    do8 do16 do do do
    sol'8 sib4
    do,8 do16 do do do

    %23
    fa8 la4
    do,8 do16 do do do
    sol'8 sib4

    %26
    fa16 do fa sol la sol
    fa do fa sol la sol\mbreak
    fa4.\tr~

    %29
    fa~
    fa~
    fa~

    %32
    fa~
    fa~
    fa~

    %35
    fa~
    fa4 r8
    R4.

    %38
    fa,16 la do fa do la
    fa la do fa do la\mbreak
    fa8 fa16 fa fa fa

    %41
    la8 do16 do do do
    fa8 do16 do do do
    la8 do16 do do do

    %44
    fa8 do16 do do do
    la4 r8
    R4.*57

    %103
    fa8 la4
    do8 fa4
    do8 do16 do do do

    %106
    fa8 sol la
    do,8 do16 do do do
    fa8 sol la

    %109
    fa16 fa do do la la
    do do la la fa fa
    la la fa fa do do\mbreak

    %112
    R4.*11
    do'8 do16 do do do
    la8 do16 do do do\mbreak

    %125
    fa8 do16 do do do
    la4 r8
    R4.

    %128
    do8 do16 do do do
    la8 do16 do do do
    fa8 do16 do do do

    %131
    la4 r8
    fa'4 r8
    do4 r8

    %134
    fa4 r8
    fa4 r8
    do4 r8

    %137
    fa4 r8
    do4 r8\mbreak
    R4.*5

    %144
    do4 do8
    do4 do8
    do4 do8

    %147
    do4 do8
    la8 la16 la la la
    fa8 la16 la la la

    %150
    do8 do16 do do do
    fa8 do16 do do do\mbreak
    la4 r8

    %153
    la8 la16 la la la
    fa8 do'16 do do do
    la8 do16 do do do

    %156
    fa8 do16 do do do
    la8 la16 la la la
    fa8 fa16 fa fa fa

    %159
    do8 do16 do do do
    do'8 do do
    la4.\fermata

}


IIIobIn = \relative do'' {

    R4.*10
    sol'16 la sib8 mi,
    la,16 sib do8 fa,

    %13
    sol'16 la sib8 mi,
    la,16 sib do8 fa,\mbreak
    la'4.

    %16
    sib
    sol
    fa

    %19
    R4.*9
    la,16 sol la sib do sib
    la sol la sib do sib

    %30
    la4 r8
    r16 la' sol32[(la) sol(fa)] mi16 re
    do fa mi32[(fa) mi(re)] do16 sib

    %33
    la4 r8
    R4.*2
    la16 do fa la fa do

    %37
    la do fa la fa do
    la4.~
    la

    %40
    R4.*21
    sol'8(la) sib
    \appoggiatura re,8 dod4\tr re8

    %63
    sol fa mi
    fa16 mi re dod re8
    sib(la) re

    %66
    sib(la) re
    sol4 r8
    fa4 r8

    %69
    mi4 r8\mbreak
    re4.~
    re

    %72
    fa8 sol16 la sib sol
    mi4.~
    mi8 mi16 fa sol fa

    %75
    fa4\tr mi8~
    mi mi16 fa sol fa
    fa4\tr mi8

    %78
    R4.*11
    re8(fa la)
    sib4.

    %91
    do,8(mi sol)
    la4.
    sib,8(re fa)

    %94
    sol4.
    la,8 dod mi
    fa4 la8

    %97
    sold4.\mbreak
    la8 si do
    re,4.~

    %100
    re4 do8~
    do16 re si8.\tr[la16]
    la4 r8

    %103
    R4.*12
    sol'16 la sib8 mi,
    la,16 sib do8 fa,

    %117
    sol'16 la sib8 mi,
    la,16 sib do8 fa,
    sol'4.

    %120
    la
    sib
    sol

    %123
    R4.*3
    la,16 sol la sib do sib
    la4 r8

    %128
    R4.*3
    fa'4 r8
    fa4 r8

    %133
    mi4 r8
    fa4 r8
    fa4 r8

    %136
    mi4 r8
    fa4 r8
    mi4 r8\mbreak

    %139
    mi16 sol mi do mi sol
    fa la fa do fa la
    mi  sol mi do mi sol

    %142
    fa sol fa sol la8
    fa sol mi
    fa la16 sol fa8

    %145
    fa la16 sol fa8
    mi fa sol
    la8 sol16 la fa8
    do do16 do do do

    %149
    la8 do16 do do do
    fa8 sol16 sol sol sol
    la8 sol16 sol sol sol\mbreak

    %152
    fa4 r8
    do do16 do do do
    la8 la16 la la la

    %155
    fa'8 sol16 sol sol sol
    la8 sol16 sol sol sol
    fa8 do16 do do do

    %158
    la8 la16 la la la
    fa8 fa16 fa fa fa
    fa'8 sol mi

    %161
    fa4.\fermata

}


IIIobIIn = \relative do'' {

    R4.*10
    mi16 fa sol8 do,
    fa,16 sol la8 do,

    %13
    mi'16 fa sol8 do,
    fa,16 sol la8 do,\mbreak
    fa'4.

    %16
    sol
    mi
    fa

    %19
    R4.*9
    fa,16 mi fa sol la sol
    fa mi fa sol la sol

    %30
    fa4 r8
    R4.*5
    fa16 la do fa do la

    %37
    fa la do fa do la
    fa4.~
    fa\mbreak

    %40
    R4.*21
    mi'8 fa sol
    sol4 fa8

    %63
    mi re dod
    re8. mi16 fa8
    sol,(fa) la

    %66
    sol(fa) la
    mi'4 r8
    re4 r8

    %69
    dod4 r8\mbreak
    re4 r8
    R4.*19

    %90
    sol,8(sib re)
    mi4.
    fa,8(la do)

    %93
    re4.
    mi,8(sol si)
    dod4.

    %96
    re8 la re~
    re do si\mbreak
    do4.

    %99
    si8 do re
    sold,4 \once\tieDashed la8~
    la16 si sold8.[la16]

    %102
    la4 r8
    R4.*12
    mi'16 fa sol8 do,

    %116
    fa,16 sol la8 do,
    mi'16 fa sol8 do,
    fa,16 sol la8 do,

    %119
    mi'4.
    fa
    fa

    %122
    mi
    R4.*3
    fa,16 mi fa sol la sol

    %127
    fa4 r8
    R4.*3
    do'4 r8

    %132
    do4 r8
    do4 r8
    do4 r8

    %135
    do4 r8
    do4 r8
    do4 r8

    %138
    do4 r8\mbreak
    do16 mi do sol do mi
    do fa do la do fa

    %141
    sol mi do sol do mi
    la, sib la sib la8
    la sib sol

    %144
    fa do'16 sib la8
    la do16 sib la8
    sol la sib

    %147
    do sib16 do la8
    la la16 la la la
    fa8 la16 la la la

    %150
    do8 do16 do do do
    fa8 do16 do do do\mbreak
    la4 r8

    %153
    la8 la16 la la la
    fa8 do'16 do do do
    la8 do16 do do do

    %156
    fa8 do16 do do do
    la8 la16 la la la
    fa8 fa16 fa fa fa

    %159
    do8 do16 do do do
    do'8 do do
    la4.\fermata

}


IIIfgn = \relative do {

    fa4 r8
    fa4 r8
    do re mi

    %4
    fa4 r8
    fa4 r8
    fa4 r8

    %7
    fa4 r8
    mi16 fa mi do re mi
    fa4 r8

    %10
    mi16 re mi fa sol  mi
    do8. do16 re mi
    fa8. fa16 mi re

    %13
    do8. do16 re mi
    fa8. sol16 la sol\mbreak
    fa16 mi fa sol la fa

    %16
    sib la sib do re sib
    do, sib do re mi do
    fa,4 r8

    %19
    fa4 r8
    do' do16 do do do
    do4 r8

    %22
    do do16 do do do
    do4 r8
    do do16 do do do

    %25
    do4 r8
    fa4 r8
    fa4 r8

    %28
    fa4 r8
    fa4 r8
    fa,4.~

    %31
    fa~
    fa~
    fa

    %34
    r16 la' sol32[la sol fa] mi16 re
    do fa mi32[fa mi re] do16 sib
    la4 r8

    %37
    fa4 r8
    fa4 r8
    fa4 r8\mbreak

    %40
    fa'8 fa16 fa fa fa
    fa8 mi16 mi mi mi
    fa8 mi16 mi mi mi

    %43
    fa8 mi16 mi mi mi
    fa8 do16 do do do
    fa8 do'16 sib la sol

    %46
    fa mi fa sol la sol
    fa8 do'16 sib la sol
    fa mi fa sol la sol

    %49
    fa la sol mi fa si,
    do4 r8
    do16 sib? do re mi do

    %52
    fa4 r8
    re'16 do si la sol fa
    mi re do si do8\mbreak

    %55
    do sol' sol,
    do16 si do re mi do
    re' do si la sol fa

    %58
    mi re do si do8
    do'8 sol sol,
    do16 sib? do re mi fa

    %61
    sol4.
    la,4 re8
    sib' la la,

    %64
    re la' re,
    dod re16 mi fa8
    dod re16 mi fa8

    %67
    la,16 sol la si dod la
    re dod re mi fa re
    la sol la si dod la\mbreak

    %70
    re4.
    re4 re,8
    re' sol,4

    %73
    la4.
    la4 r8
    la'4 la,8

    %76
    la4 r8
    la'4 la,8
    la4 r8

    %79
    la4 la8
    la4 r8
    la4 la8

    %82
    la4 r8
    la4 r8
    la4 r8\mbreak

    %85
    la4 r8
    la4 r8
    la4 r8

    %88
    fa'16 [sib] la8 la,
    re'16 dod re fa, mi re
    sol fad sol sib, la sol

    %91
    do' si do mi, re do
    fa mi fa la, sol fa
    sib' la sib re, do sib

    %94
    mi re mi sol, fa mi
    la' sol la dod, si la
    re dod re mi fa re

    %97
    mi re mi fad sold mi\mbreak
    la sold la do si la
    re, do re fa mi re

    %100
    mi fad sold mi la8
    re, mi mi,
    la16 re do sib? la sol

    %103
    fa8 fa'16 sol la sol
    fa8 fa16 sol la fa
    mi8 mi16 mi mi mi

    %106
    fa8 fa16 fa fa fa
    mi8 mi16 mi mi mi
    fa8 fa16 fa fa fa

    %109
    fa4 r8
    fa4 r8
    fa4 r8\mbreak

    %112
    fa4 r8
    fa4 r8
    fa4 r8

    %115
    do8. do16 re mi
    fa8. fa16 mi re
    do8. do16 re mi

    %118
    fa8. fa16 mi re
    do sib do re mi do
    fa mi fa sol la fa

    %121
    sib, la sib do re sib
    do4 r8
    fa fa16 fa fa fa

    %124
    fa8 do16 do do do\mbreak
    la8 do16 do do do
    fa4 r8

    %127
    fa4 r8
    fa fa16 fa fa fa
    fa8 do16 do do do

    %130
    la8 do16 do do do
    fa4 r8
    fa4 r8

    %133
    do4 r8
    fa4 r8
    fa4 r8

    %136
    do4 r8
    fa4 r8
    do4 r8\mbreak

    %139
    do4 r8
    fa4 r8
    do4 r8

    %142
    fa4 r8
    fa sib, do
    fa4 fa8

    %145
    fa4 fa8
    do4 do8
    fa4 fa8

    %148
    fa fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 do16 do do do

    %151
    la8 do16 do do do\mbreak
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %154
    fa8 fa16 fa fa fa
    fa8 do16 do do do
    la8 do16 do do do

    %157
    fa,8 fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %160
    fa8 do' do,
    fa4.\fermata

}


IIIbcn = \relative do {

    fa4 r8
    fa4 r8
    do re mi

    %4
    fa4 r8
    fa4 r8
    fa4 r8

    %7
    fa4 r8
    do4 r8
    fa4 r8

    %10
    do4 r8
    do4 r8
    fa4 r8

    %13
    do4 r8
    fa4 r8\mbreak
    fa4.

    %16
    sib,
    do
    fa,4 r8

    %19
    fa4 r8
    do' do16 do do do
    do4 r8

    %22
    do do16 do do do
    do4 r8
    do do16 do do do

    %25
    do4 r8
    fa4 r8
    fa4 r8

    %28
    fa4 r8
    fa4 r8
    fa,4.~

    %31
    fa~
    fa~
    fa~

    %34
    fa~
    fa
    fa4 r8

    %37
    fa4 r8
    fa4 r8
    fa4 r8\mbreak

    %40
    fa'4 r8
    fa4 r8
    fa do4

    %43
    fa, r8
    fa' do4
    fa, r8

    %46
    fa'4 r8
    fa4 r8
    fa4 r8

    %49
    fa4 r8
    do4 r8
    do4 r8

    %52
    fa4 r8
    si,4 r8
    do4 r8\mbreak

    %55
    do sol' sol,
    do4 r8
    si4 r8

    %58
    do4 r8
    do sol' sol,
    do4 r8

    %61
    sol4.
    la4 re8
    sib' la la,

    %64
    re4 r8
    dod re4
    dod8 re4

    %67
    la4 r8
    re4 r8
    la4 r8\mbreak

    %70
    re4.
    re4 re,8
    re' sol,4

    %73
    la4.
    la4 r8
    la'4 la,8

    %76
    la4 r8
    la'4 la,8
    la4 r8

    %79
    la4 la8
    la4 r8
    la4 la8

    %82
    la4 r8
    la4 r8
    la4 r8\mbreak

    %85
    la4 r8
    la4 r8
    la4 r8

    %88
    fa'16 [sib] la8 la,
    re'4.
    sol,

    %91
    do
    fa,
    sib

    %94
    mi,
    la
    re,

    %97
    mi\mbreak
    la,
    re

    %100
    mi4 la,8
    re mi mi,
    la4 r8

    %103
    fa4 r8
    fa'4 r8
    do do16 do do do

    %106
    R4.
    do8 do16 do do do
    R4.

    %109
    fa4 r8
    fa4 r8
    fa4 r8\mbreak

    %112
    fa4 r8
    fa4 r8
    fa4 r8

    %115
    do4 r8
    fa4 r8
    do4 r8

    %118
    fa4 r8
    do4.
    fa

    %121
    sib,
    do4 r8
    fa fa16 fa fa fa

    %124
    fa8 do16 do do do\mbreak
    la8 do16 do do do
    fa4 r8

    %127
    fa4 r8
    fa fa16 fa fa fa
    fa8 do16 do do do

    %130
    la8 do16 do do do
    fa4 r8
    fa4 r8

    %133
    do4 r8
    fa4 r8
    fa4 r8

    %136
    do4 r8
    fa4 r8
    do4 r8\mbreak

    %139
    do4 r8
    fa4 r8
    do4 r8

    %142
    fa4 r8
    fa sib, do
    fa4 fa8

    %145
    fa4 fa8
    do4 do8
    fa4 fa8

    %148
    fa fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 do16 do do do

    %151
    la8 do16 do do do\mbreak
    fa,4 r8
    fa'8 fa16 fa fa fa

    %154
    fa8 fa16 fa fa fa
    fa8 do16 do do do
    la8 do16 do do do

    %157
    fa,8 fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %160
    fa8 do' do,
    fa4.\fermata

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4. = 65
    \key fa\major
    s4.*161
    \bar"|."

}

IIIvla = {
    \IIIglobal
    %\notypeset
    <<\IIIvlan \forma>>

}

IIIcrI = {
    \IIIglobal
    \clef "treble_8"
    <<\IIIcrIn \forma>>

}

IIIcrII = {
    \IIIglobal
    \clef "treble_8"
    <<\IIIcrIIn \forma>>

}

IIIobI = {
    \IIIglobal
    <<\IIIobIn \forma>>

}

IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

}

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma\IIIbfn >>
    \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff


\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[1.] Largo}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff  = "main" <<
                \set Staff.instrumentName = \markup  \center-column{"Viola""d'Amor"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new PianoStaff\with {instrumentName = \markup\center-column{"2 Corni "\vspace #-0.2"da Caccia "\vspace #-0.2"Sordini "\vspace #-0.2"[in Do]"}} <<

                \new Staff <<
                    \set Staff.midiInstrument = #"french horn"
                    \IcrI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"french horn"
                    \IcrII
                >>
            >>

            \new PianoStaff\with {instrumentName = \markup\center-column{"2 Hau[t]bois""Sordini"}} <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \Ifg
            >>
            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"cello"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup \huge {[3.] Largo}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff  = "main" <<
                \set Staff.instrumentName = \markup  \center-column{"Viola""d'Amor"}
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

                \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Hau[t]bois"}
                    \set Staff.midiInstrument = #"oboe"
                    \IIobI
                >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \IIfg
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[4.] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff  = "main" <<
                \set Staff.instrumentName = \markup  \center-column{"Viola""d'Amor"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new PianoStaff\with {instrumentName = \markup\center-column{"2 Corni "\vspace #-0.2"da Caccia "\vspace #-0.2"Sordini "\vspace #-0.2"[in Do]"}} <<

                \new Staff <<
                    \set Staff.midiInstrument = #"french horn"
                    \IIIcrI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"french horn"
                    \IIIcrII
                >>
            >>

            \new PianoStaff\with {instrumentName = \markup\center-column{"2 Hau[t]bois""Sordini"}} <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \IIIfg
            >>
            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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
