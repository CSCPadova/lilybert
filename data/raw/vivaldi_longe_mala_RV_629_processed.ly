\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

unis = _\markup\italic "Unisoni"

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzic."

soli = ^\markup \italic { Soli}

dolce = _\markup \italic { dolce }

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

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }



IvlIn = \relative do'' {

    <sol' sol,>4-!<sol sol,>4-! sol,16-![ sol' fa mib re do sib la]
    sib sol sib re sib sol sib re <sol sol,>4-!<sol sol,>4-!
    sol,16-![ sol' fa mib re do sib la] sib sol sib re sib sol sib do

    %4
    <re re,>4 r re-! re-!
    re16-! [re' do sib la sol fad mi] fad re fad la fad re fad la
    <re re,>4 <re re,> re,16[re' do sib la sol fad mi]

    %7
    fad re fad la fad re fad la sib4 r\mbreak
    sib sib sib16[la sol fa mib re do sib]
    la'4 la la16[sol fa mib re do sib la]

    %10
    sol'4 sol sol16[fa mib re do sib la sol]
    fad'4 fad fad16[sol la sol fad mi re do]
    <sol' sib,>4 r8 sib sol sol sol la

    %13
    fa fa fa sol mib mib mib fa
    re re re mib do do do re
    sib4 r8 sib' la16(sol fad4) sol8

    %16
    fad16(mi re4) sib'8 la16(sol fad4) sol8
    fad16(mi re4) mi8\mbreak do16(sib la4) do8
    sib16 la sol8 r r16 sib' do4 la

    %19
    sib4 r8 r16 sol la4 fad
    sol r r2
    sib4 r r2

    %22
    la4 r r2
    la4 r sol8 sol sol la
    fa fa fa sol mib mib mib fa

    %25
    re re re mib? do do do mi
    la,4 r fa' fa
    mib r r2

    %28
    r mib4 mib
    re r r2
    R1*2  %%% inizia p. 3

    %32
    r2 sib8 sib sib sib
    sib sib sib sib do do do do
    do do do do re re re re

    %35
    re re re re mib mib re re
    do do do do do do re re
    mib mib fa fa\mbreak mib mib re re

    %38
    do do sib sib \footnote #' (-1 . 3) \markup\column\smaller {"Da qui fino alla battuta 41, parte cancellata da Vivaldi, ma ripresa nelle esecuzioni moderne""  "}la la do do
    fa, fa fa fa fa fa fa fa
    fa fa fa fa reb'8 reb4 do16 sib

    %41
    reb8 reb4 do16 sib la8[sol' fa16 mib re? do]
    sib'4 sib sib16[la sol fa mib re do sib]
    la'4 la la16[sol fa mib re do sib la]

    %44
    sol'4 sol sol16[fa mib re do sib la sol]
    fa'[mib re do sib la sol fa] re'8 sib' sib la
    sib4 r sib r

    %47
    sib r sib r
    sib r sib16-! fa re fa sib-! fa re fa\mbreak
    lab-! fa re fa lab-! fa re fa <<sol4\\mib>> r

    %50
    do' r do r
    do r do r
    do r sol,16[la sib do re8 mib]

    %53
    fad,8 re4 re' mib16[re do8 sib]
    fad? re4 do'8~do[re16 do sib8 la]\mbreak
    sib4 r re,2\fermata

    %56
    sol4 sol sol16[sol' fa mib re do sib la]
    sib sol sib re sib sol sib re sol,4 sol
    sol16[sol' fa mib re do sib la] sib sol sib re sib sol sib do

    %59
    <<fad4\\re>> r sib' sib
    sib16[la sol fa mib re do sib] la'4 la
    la16[sol fa mib re do sib la] sol'4 sol

    %62
    sol16[fa mib re do sib la sol] fad'4 fad
    fad16[sol la sol fad mi re do] sib4 r8 r16 sol'
    la4 fad sol r8 r16 sib

    %65
    do4 la sol\fermata r
    R1
    sib,16 re fa sib sib, re fa sib sib,4 r

    %68
    r2 sib16 re fa sib sib, re fa sib
    sib,4 r r2
    R1

    %71
    r16 sib re fa sib4 r2\mbreak
    r16 sib, re fa sib8 fa sib, re4 sib8
    sib mib4 sib8 do mi4 do8

    %74
    do fa4 do8 re fad4 re8
    re sol4 re8 mib(re) re(dod)
    dod?16 re dod la sib dod sib sol la sib la fa sol la sol mi

    %77
    fa8\tr mi16 re sol8\tr fa16 mi la8\tr sol16 fa sib8\tr la16 sol\mbreak
    dod4 re re dod
    la'16 fa re fa la fa re fa la mi dod mi la mi dod mi

    %80
    fa4 r8 la, re re re re
    sol sol sol sol do, do do do
    fa fa fa fa sib, sib sib sol'

    %83
    do, do do la' re, re re sib'
    mib, mib mib do' fa, fa fa fa
    \tuplet 3/2 { mib do mib re sib re do la do sib sol sib }

    %86
    la do re re sib mib do fa
    re sol mib la fa sib la la,
    sib re, mib fa sib,4 r8 mib'

    %89
    re4 do\fermata  sib2\fermopz

}

IvlIIn = \relative do'' {

    <sol' sol,>4-!<sol sol,>4-! sol,16-![ sol' fa mib re do sib la]
    sib sol sib re sib sol sib re <sol sol,>4-!<sol sol,>4-!
    sol,16-![ sol' fa mib re do sib la] sib sol sib re sib sol sib do

    %4
    <re re,>4 r re-! re-!
    re16-! [re' do sib la sol fad mi] fad re fad la fad re fad la
    <re re,>4 <re re,> re,16[re' do sib la sol fad mi]

    %7
    fad re fad la fad re fad la sol4 r\mbreak
    sol sol sol16[fa mib re do sib la sol]
    fa'4 fa fa16[mib re do sib la sol fa]

    %10
    mib'4 mib mib16[re do sib la sol fa mib]
    re'4 re la16[sib do sib la sol fad mi]
    <sib' re,>4 r8 re re re re mib

    %13
    do do do re sib sib sib do
    la la la sib la la fad fad
    sol4 r8 sol' fad16(mi? re4) mib8

    %16
    re16 (do sib4) sol'8 fad16(mi? re4) mib8
    re16 (do sib4) do8\mbreak la16(sol fad4) la8
    sol16 fad sol8 r r16 sol' la4 fad

    %19
    sol r8 r16 sib, do4 la
    sib r r2
    sol'4 r r2

    %22
    fad4 r r2
    fad4 r re8 re re mib\mbreak
    do do do re sib sib sib do

    %25
    la la la sib sol sol sol sol
    fad4 r re' re
    do r r2

    %28
    r do4 do
    sib r r2
    R1*2

    %32
    r2 fa8 fa fa fa
    sol sol sol sol sol sol sol sol
    la la la la la la la la

    %35
    sib sib sib sib sib sib sib sib
    la la la la la la sib sib
    do do re re\mbreak la la sib sib

    %38
    la la sol sol fa fa mib? mib
    re re re re re re re re
    re re re re sib' sib4 la16 sol

    %41
    sib8 sib4 la16 sol fa8[mib' re16 do sib la]
    re4 re sol16[fa mib re do sib la sol]
    fa'4 fa fa16[mib re do sib la sol fa]

    %44
    mib'4 mib mib16[re do sib la sol fa mib]
    la'[sol fa mib re do sib la] sib8 re do do
    re4 r fa r

    %47
    fa r fa r
    fa r fa16-! re sib re fa-! re sib re\mbreak
    fa-! re si re fa-! re si re <<mib4\\do>> r

    %50
    sol' r sol r
    sol r sol r
    sol r sib,16[do re do sib8 do]

    %53
    la la4 sib do16[sib la8 sol]
    <re' la fad> la4 la sib16[la sol8 fad]\mbreak
    sol4 r re2\fermata\mbreak

    %56
    sol4 sol sol16[sol' fa mib re do sib la]
    sib sol sib re sib sol sib re sol,4 sol
    sol16[sol' fa mib re do sib la] sib sol sib re sib sol sib do

    %59
    re4 r sol sol
    sol16[fa mib  re do sib la sol] fa'4 fa
    fa16[mib re do sib la sol fa] mib'4 mib

    %62
    mib16[re do sib la sol fa mib] re'4 re
    la16[sib do sib la sol fad mi] re4 r8 r16 sib'
    do4 la sib r8 r16 sol'

    %65
    la4 fad sol\fermata r\mbreak
    R1
    re,16 fa sib re re, fa sib re re,4 r

    %68
    r2 re16 fa sib re re, fa sib re
    re,4 r r2
    R1

    %71
    r16 re fa sib re4 r2\mbreak
    r16 fa, sib re fa8 sib, fa sib4 fa8
    sol sib4 sol8 sol do4 sol8

    %74
    la do4 la8 la re4 la8
    sib re4 sib8 sib4 si8 mi
    mi4 sol re dod

    %77
    la' sol fa re8 sol\mbreak
    mi la,4 la8 sib mi,4 la8
    fa'16 re la re fa re la re mi dod la dod mi dod la dod

    %80
    re4 r8 re sib sib sib sib
    do do do sib la la la la
    sib sib sib lab sol sol sol sib

    %83
    la? la la do\mbreak sib sib sib re
    do do do mib re re re re
    \tuplet 3/2 { do la do sib sol sib la fa la sol mi! sol }

    %86
    fa la sib sib sol sol la la
    sib sib do do re re do do
    re re, mib fa sib,4 r8 sib'

    %89
    sib4 la\fermata sib2\fermata

}

Ivlan = \relative do' {

    sol'4-! sol-! sol-! r
    r2 sol4-! sol-!
    sol-! r r2

    %4
    re4 r re'-! re-!
    re-! r r2
    re4 re re r

    %7
    r2 re4 r\mbreak
    re4 re mib r
    do do re r

    %10
    sib sib do r
    la la la r
    re, r8 sol sib sib sib do

    %13
    la la la sib sol sol sol la
    fad fad fad sol la la re, re
    sol sol, sol sol' re re re re

    %16
    re re la la' re, re re re
    re re re re\mbreak re re re re
    sol8 sol, r r16 re' mi4 re

    %19
    re r8 r16 re mib4 re
    re r r2
    re4 r r2

    %22
    re4 r r2
    re4 r sib'8 sib sib do\mbreak
    la la la sib sol sol sol la

    %25
    fad fad fad sol mib mib do dod
    re4 r si' si
    sol r r2

    %28
    r la4 la
    fa r r2
    R1*2

    %32
    r2 re8 re re re
    mib mib mib mib mi mi mi mi
    fa fa fa fa fad fad fad fad

    %35
    sol sol sol sol sol sol mi! mi
    fa fa fa fa fa fa fa fa
    fa fa fa fa\mbreak fa, fa fa fa

    %38
    fa fa fa fa fa fa fa fa
    sib sib sib sib sib sib sib sib
    sib sib sib sib mi mi mi mi

    %41
    mi mi mi mi fa fa fa fa
    fa4 fa mib r
    do' do re r

    %44
    sib sib do r
    do r fa,8 fa fa fa
    fa4 r re' r

    %47
    re r re r
    re r re re\mbreak
    re si sol r

    %50
    mib r mib r
    mib? r mib r
    mib? r sol,8 sol sol do

    %53
    re4 re re re
    re re re re\mbreak
    sol, r re'2\fermata\mbreak

    %56
    sol4 sol sol r
    r2 sol4 sol
    sol r r2

    %59
    la4 r re re
    mib r do do
    re r sib sib

    %62
    do r la la
    la r sol, r8 r16 re'
    mib4 re re r8 r16 re

    %65
    mib4 re sib\fermata r\mbreak
    R1
    fa'4 fa fa r

    %68
    r2 fa4 fa
    fa r r2
    R1

    %71
    r8 fa fa4 r2\mbreak
    r8 re re re re4 re
    mib mib mi mi

    %74
    fa fa fad fad
    sol sol sol sold
    la sol? fa mi

    %77
    re mi fa sol\mbreak
    la8 sol fa re sol,4 la
    la' la dod dod

    %80
    la r8 fa sol sol sol sol
    mi mi mi mi fa fa fa fa
    re re re re mib mib mib mib

    %83
    fa fa fa fa\mbreak sol sol sol sol
    la, la la la sib sib sib sib
    fa fa fa fa fa fa fa fa

    %86
    fa fa sib sib mib, mib fa fa
    sol sol la la sib sib fa fa
    sib re mib fa sib,4 r8 sol

    %89
    fa2\fermata sib\fermata

}

Icanton = \relative do'' {

    \autoBeamOff
    R1*19
    r2 sol4 sib
    re sol, re'8 do16 [sib la sol] fad[mi]

    %22
    fad4 re re8 mi16[fad sol la] sib[do]
    re4 re, re'4. mib8\mbreak
    do4. re8 sib4. do8

    %25
    la4. sib8 sol[do] mib[sol,]
    fad4 r si si
    do16 [mib re mib] do[re sib do] la[do sib do] la[sib sol la]

    %28
    fa?4 r la la
    sib16[re do re] sib[do la sib] sol[sib la sib] sol[la fa sol]
    mib4 r mib' fa,8. mib'16\mbreak

    %31
    re4 fa, re' fa,8. re'16
    do4 fa, sib lab
    sol32 [fa mib8.] sol32[fa mib8.] do'4 sib\tr

    %34
    la32[sol fa8.] la32[sol fa8.] re'4 do
    sib32[la sol8.]  sib32[la sol8.] mib'4 re
    do r16 fa, [sol fa] la[fa sol fa] sib[fa sol fa]

    %37
    do'[fa, sol fa] re'[fa, sol fa]\mbreak mib'\tr[re do8] re16\tr[do sib8]
    do16\tr[sib la8] sib16\tr[la sol8] la16\tr[sol fa8] sol16\tr[fa mib8]
    re4 r8 fa sib16[la sol fa] sib[la sol fa]

    %40
    sib[la sol fa] sib[la sol fa] reb'8 reb4 do16[sib]
    reb8 reb4 do16[sib] fa8 mib' re?16[do] sib[la]
    sib4 r r2

    %43
    R1*3
    sib4 fa re' sib
    fa re8. fa16 sib4 fa8. sib16

    %48
    re4 sib8. re16 fa4 fa,\mbreak
    r2 do'4 sol
    mib' do mib, do8. mib16

    %51
    sol4 mib8. sol16 do4 sol8. do16
    mib4 do sol16[la sib do re8] mib
    fad, re4 re' mib16[re do8 sib]

    %54
    fad? re4 do'8~do[re16 do sib8 la]\mbreak
    sol4 r8 re' re, do' sib la\mbreak
    sol4 r r2

    %57
    R1*9
    fa8 [mib16 re mib fa] sol[la] sib[la sol fa] sib[la sol fa]
    sib8 fa r4 fa8 mib16[re mib fa] sol[la]

    %68
    sib[la sol fa] sib[la sol fa] sib8 fa r4
    fa8[sol16 la sib8] fa sol16[fa mib sol] la[sol fa la]
    sib[la sol sib] do[sib la do] re[do sib re] mib[re do mib]

    %71
    re8[sib] r16 fa[sol la] sib[do sib do sib do sib do]\mbreak
    sib8 fa r fa \appoggiatura sol fa16[mi? fa8] \appoggiatura sol fa16[mi? fa8]
    sol16[la sib8] r sol\appoggiatura la sol16[fa sol8] \appoggiatura la sol16[fa sol8]

    %74
    la16[sib do8] r la \appoggiatura sib la16[sol la8] \appoggiatura sib la16[sol la8]
    sib16[do re8] r sib mib[re re dod]
    dod?16 [re dod la] sib [dod sib sol] la [sib la fa] sol [la sol mi]

    %77
    fa8\tr [mi16 re] sol8\tr [fa16 mi] la8\tr [sol16 fa] sib8\tr [la16 sol]\mbreak
    dod8[si16 la] re8 r r sib? la16[sol] fa[mi]
    re4 r r2

    %80
    r8 la' re16[do sib la] sib8[sib sib\tr la16 sol]
    do8[do do sib\tr] la[la la\tr sol16 fa]
    sib8[sib sib lab] sol4~sol16 [mib sol sib]

    %83
    la4~la16[fa la do]\mbreak sib4~sib16[sol sib re]
    do4~do16[la do mib] re4 r8 re
    mib16[do sib do] re[sib la sib] do[la sol la] sib[sol fa mi]

    %86
    fa4 r8 fa sol16[fa mib8] la16[sol fa8]
    sib16[la sol8] do16[sib la8] re16[do sib8] do16[sib la8]
    sib re, mib fa sib,4 r8 mib'

    %89
    re4 do\fermopz sib2\fermata

}

Itesto = \lyricmode {

    Lon -- ge ma -- la, um -- brae, ter -- rores, _ um -- brae, ter -- rores, _
    sors a -- ma -- ra, sors a -- ma -- ra,_i -- ni -- qua sors.
    Lon -- ge ma - - - la lon -- ge ma - - - la
    um -- brae, ter -- rores, _ um -- brae, ter -- rores, _
    sors a -- ma - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ra_i --
    ni -- qua sors.
    Lon -- ge ma -- la, um -- brae, ter -- rores, _ ter -- rores, _ ter -- ro -- res,
    lon -- ge ma -- la, um -- brae, ter -- rores, _ ter -- rores, _ ter -- rores, _
    sors a -- ma - - - - - - ra a -- ma -- ra_i -- niqua _ sors.

    Bel -- la, pla - - gae, i -- rae, fu -- ro - -  res,
    te--la_et ar - - - - - - - - - - ma, ae -- ter - - - - - - - - - - - - - - - - - - - - - na
    ae -- ter -- na mors, ae -- ter - - - - - - - - - - - - - - na
    ae -- ter - - - - - na  ae -- ter -- na mors, ae -- ter -- na mors.

}

Ibcn = \relative do {

    sol'4 sol sol r
    r2 sol4 sol
    sol r r2

    %4
    re4 r re' re
    re r r2
    re4 re re r

    %7
    r2 sol,4 r
    sol sol do, r
    fa fa sib, r

    %10
    mib mib la, r
    re re re r
    sol, r r2

    %13
    R1*5
    r4 r8 r16 sol' do,4 re
    sol,4 r8 r16 sol' do,4 re

    %20
    sol,4 r r2
    sol4 r r2
    re'4 r r2

    %23
    re4 r r2\mbreak
    R1*2
    r2 sol4 sol

    %27
    do, r r2
    fa4 r fa fa
    sib, r r2

    %30
    mib4 r fa fa\mbreak
    fa fa fa fa
    fa fa r2

    %33
    R1*9
    sib,4 sib do r
    fa fa sib, r

    %44
    mib mib la, r
    la r sib8 sib fa' fa,
    sib4 r sib r

    %47
    sib r sib r
    sib r sib sib\mbreak
    si si do r

    %50
    do r do r
    do r do r
    do r r2

    %53
    R1*3
    sol'4 sol sol r
    r2 sol4 sol

    %58
    sol r r2
    re4 r sol sol
    do, r fa fa

    %61
    sib, r mib mib
    la, r re re
    re r sol, r8 r16 sol'

    %64
    do,4 re sol, r8 r16 sol'
    do,4 re sol,\fermata r\mbreak
    sib sib sib sib

    %67
    sib sib sib sib
    sib sib sib sib
    sib4 r8 re mib4 fa

    %70
    sol la sib do
    sib r sib, sib\mbreak
    sib r r2

    %73
    R1*6
    re4 re dod dod
    re r r2

    %81
    R1*7
    r8 re mib fa sib,4 r8 sol'
    fa2_\fermata sib,\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 62
    s1*54\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup\huge "Ad[agi]o"
    s1\once \override Score.RehearsalMark.extra-offset = #'(+6 . +1)
    \mark\markup\huge "[Allegro]"
    s1*34
    \bar "||"
    \mark "D.C."

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

Icanto = {
    \new Voice = "mala"
    <<\Icanton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIcanton = \relative do'' {

   \autoBeamOff
   r4 r8 sol sol16 mib mib8 r mib'
   mib? sib16 sib sol8 sol16 sib mib, mib mib8 r sib'16 reb
   sol,8 sol r4 sol8 lab sib lab16 sol
   lab8 lab r do16 fa,\mbreak si si si8 r si16 do
   sol8 sol r do16 mib fad,16 fad fad8 r la16 sib
   do8 do do sib16 la sib8 sib r sib\mbreak
   sol sol la sib fa fa r4\fermata

}

IItesto = \lyricmode {

   Re -- ce -- di -- te re -- ce -- di -- te nu -- bes et ful -- gu -- ra,
   et se -- re -- no co -- ro -- na -- ta ful -- go -- re
   coe -- li, si -- de -- ra, co -- rus -- ca -- te. 
   Om -- nes a -- ni -- mae su -- per
   ter -- ram et su -- per a -- stra
   vi -- ven -- tes,  iu -- bi -- la -- te.

}

IIbcn = \relative do {

   mib1~
   mib
   mi!
   fa
   sol4 do, re2~
   re sol
   mib fa4 sib,\fermata

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   %\override Staff.TimeSignature.style = #'single-digit
   \key fa\major
   \tempo 4 = 55
   s1*7
   \bar "||"

}

IIcanto = {
   \new Voice = "nubes"
   <<\IIcanton \forma>>
}

IIbc = {
   \clef bass
   <<\IIbcn \forma \IIbfn>>
}





IIIvlIn = \relative do'' {

    sol8
    mib' mib, mib mib' mib re r re16 mib
    fa8 fa, fa fa' fa mib r mib
    re16-. si-. re-. fa-. sol8 re do16 la do mib fa8 do

    %4
    si4 r8 re\tuplet 3/2 { mib16 (fa sol) mib[(fa sol)] } sol8 sol
    \tuplet 3/2 { mib16 (fa sol) mib[(fa sol)] } sol8 sol \tuplet 3/2 { mib16 (fa sol) mib[(fa sol)] } sol8 fa
    mib[re16 do si8.\tr do16] do4 r\mbreak

    %7
    r4 r8 mib mib sol, sol fa'
    fa4 r8 fa mib sol, sol mib'
    mib fa, fa mib' re mib fa, lab'

    %10
    sol sib, sib sib do do'4 fa,8
    re sib'4 mib,8 do lab'4 re,8\mbreak
    sib sol' sol, sol' sol, sol sol sol

    %13
    lab lab' lab, lab' lab, lab lab lab
    sol sol' sol, sol' sol, sol sol sol
    fa fa' fa, fa' lab, lab sol sol

    %16
    fa fa mib mib re re' do do
    re re re re\mbreak mib mib mib mib
    re sib la re sib' sib, sib sib'

    %19
    sib la r la16 sib do8 fad, fad do'
    do sib r sib la sol la fad
    sol4 r8 do, la' la, la la'

    %22
    fad4 r8 fad re re, re re'
    re re re re re re mib mib\mbreak
    la, fad fad fad' fa si, si fa'

    %25
    mib mib mib mib re re re re
    do do do do re re re re\mbreak
    re fa si, fa' mib do do do

    %28
    re re re re mib mib mib mib
    fa fa fa fa fa sol, mib' mib
    re re do do sib sib lab lab

    %31
    sol sol fa fa \mbreak sol sol do do
    do do do do do do si si\fermata
    mib mib, mib mib' mib re r re16 mib

    %34
    fa8 fa, fa fa' fa mib r re
    \tuplet 3/2 { mib16(fa sol) mib[(fa sol)]} sol8 sol \tuplet 3/2 { mib16(fa sol) mib[(fa sol)]} sol8 sol
    \tuplet 3/2 { mib16(fa sol) mib[(fa sol)]} sol8 fa mib re16 do si8.\tr do16

    %37
    do4\fermata r r2
    R1
    r2 sib8 sib sib sol

    %40
    mib mib mib do' fa, fa fa re'
    sol, sol sol mib' sib sib sib lab
    sol sol fa fa sol sib' sol, sib'

    %43
    sol, sib' sol, sol'\mbreak fa, sib' fa, sib'
    sol, sib sib sib do do re re
    mib mib, r mib' mib4 re\fermata

    %46
    mib\fermata r8 sol, mib' mib, mib mib'
    mib re r re16 mib fa8 fa, fa fa'
    fa mib r mib re4. sol8\mbreak

    %49
    do,4.  fa8 \appoggiatura do si4 r8 fa'
    sol fa16 mib re8.\tr do16 do4 r
    r4 r8 mib mib sol, sol fa'

    %52
    fa4 r8 fa mib sol, sol mib'
    mib fa, fa mib' re mib fa, lab'
    sol sib, sib sib do do'4 fa,8

    %55
    re sib'4 mib,8 do lab'4 re,8\mbreak
    sib sol' sol, sol' sol, sol sol sol
    lab lab' lab, lab' lab, lab lab lab

    %58
    sol sol' sol, sol' sol, sol sol sol
    fa fa' fa, fa' lab, lab sol sol
    fa fa mib mib re re' do do

    %61
    re re re re\mbreak mib mib mib mib
    re sib la re sib' sib, sib sib'
    sib la r la16 sib do8 fad, fad do'

    %64
    do sib r sib la sol la fad
    sol4 r8 do, la' la, la la'
    fad4 r8 fad re re, re re'

    %67
    re re re re re re mib mib\mbreak
    la, fad fad fad' fa si, si fa'
    mib mib mib mib re re re re

    %70
    do do do do re re re re\mbreak
    re fa si, fa' mib do do do
    re re re re mib mib mib mib

    %73
    fa fa fa fa fa sol, mib' mib
    re re do do sib sib lab lab
    sol sol fa fa \mbreak sol sol do do

    %76
    do do do do do do si si\fermata
    mib mib, mib mib' mib re r re16 mib
    fa8 fa, fa fa' fa mib r re

    %79
    \tuplet 3/2 { mib16(fa sol) mib[(fa sol)]} sol8 sol \tuplet 3/2 { mib16(fa sol) mib[(fa sol)]} sol8 sol
    \tuplet 3/2 { mib16(fa sol) mib[(fa sol)]} sol8 fa mib re16 do si8. do16
    do4\fermata r r2

}

IIIvlIIn = \relative do'' {

    mib,8
    do' do, do do' do si r si16 do
    re8 re, re re' re do r lab'
    lab16-. re,-. fa-. lab-. re,8 sol sol16 do, mib sol do,8 fa

    %4
    fa4 r8 si, \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 mib
    \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 mib \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 re
    do16 sol fa mib re8.\tr do16 do4 r\mbreak  %%% Inizia la ripresa

    %7
    r4 r8 do' do re, re si'
    si?4 r8 re do mib, mib do'
    do fa, fa do' si sol' re fa

    %10
    mib sol, sol sol mib mib fa fa'~
    fa sib, sol mib'~mib lab, fa re'\mbreak
    mib, mib' mib, mib' mib, mib mib mib

    %13
    fa fa' fa, fa' fa, fa fa fa
    mib mib' mib, mib' mib, mib mib mib
    re re' re, re'fa, fa mib mib

    %16
    re re do do sib sib la'! la
    sib sib si si\mbreak do do do do
    sib? sol fad fad' sol sol, sol sol'

    %19
    sol fad r fad16 sol la8 re, re la'
    la sol r sol fad sib, do la
    sib4 r8 sol' fad fad, fad do'

    %22
    do4 r8 do sib sib, sib sib'
    la la la la sib sib sol sol\mbreak
    fad re re do' si re, re si'

    %25
    sol sol sol sol sol sol sol sol
    sol sol sol sol si si si si\mbreak
    si re sol, re' do mib, mib mib

    %28
    fa fa fa fa sol sol sol sol
    lab lab lab lab si sol do do
    sib? sib lab lab sol sol fa fa

    %31
    mib mib re re\mbreak mib mib mib' mib
    mib mib mib mib re re re re\fermata
    do do, do do' do si r si16 do

    %34
    re8 re, re re' re do r si
    \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 mib \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 mib
    \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 re do16 sol' fa mib re8.\tr do16

    %37
    do4\fermata r r2  %% fine ripresa
    R1
    r2 sol8 sol sol sol

    %40
    do, do do do re re re re
    mib mib mib mib fa re sol mib
    mib  mib re re mib sol' mib, sol'

    %43
    mib, sol' mib, mib'\mbreak re, fa' re, fa'
    mib, sol sol sol fa fa fa fa
    sib4 r8 do fa,2\fermata

    %46
    sol4\fermata r8 mib do' do, do do'
    do si r si16 do re8 re, re re'
    re do r lab' lab fa4 re8\mbreak

    %49
    sol mib4 do8 re4 r8 re
    mib re16 do si8.\tr do16 do4 r
    r4 r8 do do re, re si' %% ripresa

    %52
    si?4 r8 re do mib, mib do'
    do fa, fa do' si sol' re fa
    mib sol, sol sol mib mib fa fa'~

    %55
    fa sib, sol mib'~mib lab, fa re'\mbreak
    mib, mib' mib, mib' mib, mib mib mib
    fa fa' fa, fa' fa, fa fa fa

    %58
    mib mib' mib, mib' mib, mib mib mib
    re re' re, re'fa, fa mib mib
    re re do do sib sib la'! la

    %61
    sib sib si si\mbreak do do do do
    sib? sol fad fad' sol sol, sol sol'
    sol fad r fad16 sol la8 re, re la'

    %64
    la sol r sol fad sib, do la
    sib4 r8 sol' fad fad, fad do'
    do4 r8 do sib sib, sib sib'

    %67
    la la la la sib sib sol sol\mbreak
    fad re re do' si re, re si'
    sol sol sol sol sol sol sol sol

    %70
    sol sol sol sol si si si si\mbreak
    si re sol, re' do mib, mib mib
    fa fa fa fa sol sol sol sol

    %73
    lab lab lab lab si sol do do
    sib? sib lab lab sol sol fa fa
    mib mib re re\mbreak mib mib mib' mib

    %76
    mib mib mib mib re re re re\fermata
    do do, do do' do si r si16 do
    re8 re, re re' re do r si

    %79
    \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 mib \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 mib
    \tuplet 3/2 { do16(re mib) do[(re mib)] } mib8 re do16 sol' fa mib re8.\tr do16
    do4\fermata r r2

}

IIIvlan = \relative do' {

    r8
    r4 r8 do sol' sol, sol sol'
    sol4 r8 sol do do, do do'
    si si sib sib la la lab lab

    %4
    sol4 r8 sol mib mib mib mib
    re re re re do do do re
    sol, sol sol sol mib4 r\mbreak

    %7
    r4 r8 do' sol8 la si sol  %% inizia ripresa
    sol4 r8 sol do re mib do
    fa, fa fa fad sol do sib? sib

    %10
    mib mib mib mib lab, lab re re
    sol, sol do do fa, fa sib sib\mbreak
    sib sib sib sib sib sib sib sib

    %13
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %16
    sib sib sib sib sib sib fa' fa
    fa fa fa fa\mbreak fad fad fad fad
    sol sol, re' re, sol4 r8 re'

    %19
    re re re re re4 r8 re
    re re re re re re mib! re
    re4 r8 do re re, re re'

    %22
    re4 r8 re sol sol, sol sol'
    fad fad fad fad sol sol do, do\mbreak
    re re, re re' sol sol, sol sol'

    %25
    do, do do do si si si si
    do do do do sol sol sol sol\mbreak
    sol sol sol sol sol sol sol sol

    %28
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %31
    sol sol sol sol\mbreak do do do do
    fad, fad fad fad sol sol sol sol\fermata
    sol4 r8 sol' sol sol sol sol

    %34
    si,4 r8 si' sol sol sol sol
    sol do do do sib sib sib sib
    lab lab lab si, do fa sol sol,

    %37
    do4\fermata r r2\mbreak %% fine ripresa
    R1
    r2 mib8 mib mib mib

    %40
    lab, lab lab lab sib sib sib sib
    do do do do re sib mib do
    sib sib sib sib mib mib mib mib

    %43
    mib mib mib mib\mbreak sib sib sib sib
    mib mib mib mib lab, lab lab lab
    sol4 r8 lab sib2\fermata

    %46
    mib,4\fermata r r r8 sol'
    sol sol sol sol si,4 r8 si'
    sol sol mib mib fa fa re re\mbreak

    %49
    mib mib do do sol'4 r8 si
    sol sol sol sol mib4 r
    r4 r8 do sol8 la si sol  %% inizia ripresa

    %52
    sol4 r8 sol do re mib do
    fa, fa fa fad sol do sib? sib
    mib mib mib mib lab, lab re re

    %55
    sol, sol do do fa, fa sib sib\mbreak
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %58
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib fa' fa

    %61
    fa fa fa fa\mbreak fad fad fad fad
    sol sol, re' re, sol4 r8 re'
    re re re re re4 r8 re

    %64
    re re re re re re mib! re
    re4 r8 do re re, re re'
    re4 r8 re sol sol, sol sol'

    %67
    fad fad fad fad sol sol do, do\mbreak
    re re, re re' sol sol, sol sol'
    do, do do do si si si si

    %70
    do do do do sol sol sol sol\mbreak
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %73
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol\mbreak do do do do

    %76
    fad, fad fad fad sol sol sol sol\fermata
    sol4 r8 sol' sol sol sol sol
    si,4 r8 si' sol sol sol sol

    %79
    sol do do do sib sib sib sib
    lab lab lab si, do fa sol sol,
    do4\fermata r r2\mbreak

}

IIIcanton = \relative do'' {

    \autoBeamOff
    r8
    R1*5
    r2 r4 r8 sol
    do do, do do' do[si] r si16[do]

    %8
    re8 fa, fa re' mib,4 r8 mib'
    mib fa, fa do' si4 r
    sib! lab16[sol] fa[mib] do'[sib do8]\terzine\con \tuplet 3/2 { r16 do [sib] lab[sol fa] }

    %11
    sib[lab sib8] \tuplet 3/2 { r16 sib[lab] sol[fa mib] } lab[sol lab8] \tuplet 3/2 { r16 lab[sol] fa[mib re] } \mbreak
    sol4 r8 mib16[fa] sol[fa mib fa] sol[mib sib' sol]
    fa4 r8 re16[mib] fa[mib re mib] fa[re lab' fa]

    %14
    mib4 r8 do16[re] mib[re do re] mib[do sol' mib]
    re4 r8 sib' \appoggiatura do sib32[la sib16] lab8 \appoggiatura sib lab32[sol lab16] sol8
    \appoggiatura lab? sol32[fa sol16] fa8 \appoggiatura sol fa32[mib fa16] mib8 re[do16 sib] la'!4

    %17
    sib si\mbreak do4~\senza \tuplet 3/2 { do16[mib re] do[sib? la] }
    sib8 la16 sol fad4 sol r
    R1

    %20
    r2 r4 r8 re'
    re sol, sol mib' fad,4 r8 fad16[sol]
    la8 re, re do' sib4 r8 sib

    %23
    la la re la sol sol mib' sol,
    fad4 r si si8 si
    do16[sol lab sol] do[sol lab sol] re'[sol, lab sol] re'[sol, lab sol]

    %26
    mib'[sol, lab sol] mib'[sol, lab sol] fa'8[mib16 re do si lab sol]
    fa4 r8 fa mib16[re do re] mib[do mib sol]
    fa[mib re mib] fa[re fa lab] sol[fa mib fa] sol[mib sol sib]

    %29
    lab[sol fa sol] lab[fa lab do] si4 r8 mib
    \appoggiatura mib re32[do re16] mib8 \appoggiatura re do32[sib? do16] re8 \appoggiatura do sib32[la sib16] do8 \appoggiatura sib lab32[sol lab16] sib8\mbreak
    sol16[fa sol8] fa16[mib fa8]\mbreak mib16[re] do8 \appoggiatura re' do16[si do8]

    %32
    \appoggiatura re do16[si do8] \appoggiatura re do16[si do8] do16[si32 la] sol16 fa mib8[re]
    do4 r r2
    R1*3   %%% fine ripresa

    %37
    r4 r8 sib' sib mib, mib mib'
    re4 r8 sib\mbreak lab re, re lab'
    sol4 r mib8 [sol] sib sib,

    %40
    do[lab']~lab16[sol fa mib] re8[sib']~sib16[lab sol fa]
    mib8[do']~do16[sib lab sol] fa8[mib16 re] mib8 lab
    sol4(fa\tr) mib r

    %43
    sib'16[sol] mib8 r4\mbreak fa16[re] sib8 r4
    sib'~sib16[sol fa mib] do'[lab sol fa] re'[sib lab sol]
    mib'8 mib, r lab sol4 fa\tr

    %46
    mib4\fermata r r2
    R1*3
    r2 r4 r8 sol

    %51
    do do, do do' do[si] r si16[do]
    re8 fa, fa re' mib,4 r8 mib'
    mib fa, fa do' si4 r

    %54
    sib! lab16[sol] fa[mib] do'[sib do8] r fa,
    sib16[lab sib8] r8 mib, lab16[sol lab8] r re,\mbreak
    sol4 r8 mib16[fa] sol[fa mib fa] sol [lab sib sol]

    %57
    fa4 r8 re16[mib] fa[mib re mib fa sol lab fa]
    mib4 r8 do16[re] mib[re do re] mib[fa sol mib]
    re4 r8 sib' lab16[sol lab8] sol16[fa sol8]

    %60
    fa16[mib fa8] mib16[re mib8] re[do16 sib] la'!4
    sib si\mbreak do4~\tuplet 3/2 { do16 mib[re] do[sib? la] }
    sib8 la16 sol fad4 sol r

    %63
    R1
    r2 r4 r8 re'
    re sol, sol mib' fad,4 r8 fad16[sol]

    %66
    la8 re, re do' sib4 r8 sib
    la la re la sol sol mib' sol,
    fad4 r si si8 si

    %69
    do16[sol lab sol] do[sol lab sol] re'[sol, lab sol] re'[sol, lab sol]
    mib'[sol, lab sol] mib'[sol, lab sol] fa'8[mib16 re do si lab sol]
    fa4 r8 fa mib16[re do re] mib[fa sol mib]

    %72
    fa[mib re mib] fa[sol lab fa] sol[fa mib fa] sol[lab sib sol]
    lab[sol fa sol] lab[sib] do[re] si4 r8 mib
    re16[do re8] do16[sib do8] sib16[lab sib8] lab16[sol lab8]

    %75
    sol16[fa sol8] fa16[mib fa8]\mbreak mib16[re] do8 \appoggiatura re' do16[si do8]
    \appoggiatura re do16[si do8] \appoggiatura re do16[si do8] do16[si32 la] sol16 fa mib8[re]
    do4 r r2

    %78
    R1*4

}

IIItesto = \lyricmode {

    De -- scende,_o _ coe -- li vox, ex al -- to_a -- sperge _  nos,
    ex al -- to_a -- sperge _  nos, tol -- le
    mae -- ro - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - rem
    mae -- ro -- rem.

    De -- scende,_o _ coe -- li vox, ex al -- to_a -- sperge _  nos,
    ex al -- to_a -- sperge _  nos, a -- sperge _  nos tol -- le
    mae -- ro - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  rem
    tol -- le mae -- ro -- rem mae -- ro -- rem.

    Re -- splende,_o _ ve -- ra lux, es tu se -- cura _ dux,
    spar -- ge ful -- go - - - rem ful -- go -- rem spar -- ge
    spar -- ge spar - - - ge ful -- go - rem.

    De -- scende,_o _ coe -- li vox, ex al -- to_a -- sperge _  nos,
    ex al -- to_a -- sperge _  nos, tol -- le
    mae -- ro - - - - - - - - - - - - - - - - - - - - - - - - - - - -  rem tol -- le
    mae -- ro -- rem.

    De -- scende,_o _ coe -- li vox, ex al -- to_a -- sperge _  nos,
    ex al -- to_a -- sperge _  nos, a -- sperge _  nos tol -- le
    mae -- ro - - - - - - rem a -- sper - - - - - - - ge nos tol -- le
    mae -- ro - - - - rem tol -- le mae -- ro -- rem mae -- ro -- rem.

}

IIIbcn = \relative do {

    r8
    R1*3
    sol'8 sol, sol sol' do do do do
    sib sib sib sib lab lab lab si,

    %6
    do do sol' sol, do4 r
    R1*11
    r2 sol4 r8 sol

    %19
    re' re, re re' re4 r8 re
    sol sol, sol sol' re sol do, re
    sol,4 r r2

    %22
    R1*11
    do4 r8 do sol' sol, sol sol'
    sol4 r8 sol do do, do sol'

    %35
    do do do do sib sib sib sib
    lab lab lab si, do fa sol sol,
    do4\fermata r mib r8 mib

    %38
    sib' sib, sib sib'\mbreak sib4 r8 sib,
    mib mib, mib mib' mib4 r
    R1*6

    %46
    r2 do4 r8 do
    sol' sol, sol sol' sol4 r8 sol
    do do, do do' si si sib sib\mbreak

    %49
    la la lab lab sol sol, sol sol'
    do, fa sol[sol,] do4 r
    R1*11%% ripresa

    %62
    r2 sol4 r8 sol
    re' re, re re' re4 r8 re
    sol sol, sol sol' re sol do, re

    %65
    sol,4 r r2
    R1*11
    do4 r8 do sol' sol, sol sol'

    %78
    sol4 r8 sol do do, do sol'
    do do do do sib sib sib sib
    lab lab lab si, do fa sol sol,

    %81
    do4\fermata r r2

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key sol\minor
    \tempo 4 = 60
    \partial 8 s8
    s1*6
    s1*75
    \bar "||"

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}

IIIcanto = {
    \new Voice = "coeli"
    <<\IIIcanton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}





IVvlIn = \relative do'' {

    R2*4
    r4 r8 sib
    mib16[re do sib] mib[re do sib]

    %7
    la4\tr r8 la
    re16[do sib la] re[do sib la]
    sol4\tr r8 sol

    %10
    do16[sib la sol] do[sib la sol]
    re8 dod'4 re8
    re, si'4  do8

    %13
    re, la'4 sib8
    re,16[mi re mi] fad[sol fad sol]\mbreak
    la[sib la sib] do[re do re]

    %16
    sib8 [sol la fad]
    sol2\f
    sib

    %19
    re4 sol,
    do, re
    sol8 sib'16 do re do sib8

    %22
    r mib,16 fa sol fa mib8
    r la16 sib do sib la8
    r re,16 mib fa mib re8

    %25
    r sol16 la sib la sol8
    r fad16[sol la sol fad8]
    sol,2\f

    %28
    sib
    re4 sol,
    do,4\p re

    %31
    sol r
    R2*6
    r4 r8 fad'\p

    %39
    fa!2
    mib~
    mib

    %42
    re~
    re
    do8[do do do]

    %45
    sib4 sib
    sib8 lab16 sol lab8 sol16 fa
    sol8[mib sol sib]

    %48
    do4 do\mbreak
    do8 sib16 la16 sib8 la16 sol
    la8[fa la do]

    %51
    re4 re
    re8 do16 sib do8 sib16 la
    sib8[sol sib re]

    %54
    dod16(re mi4.)
    sol,16(la sib4.)
    mi,16(fa sol4.)

    %57
    fa4 sol
    la si
    dod re

    %60
    mi16[re dod si la sol fa mi]\mbreak
    fa8[re' fa, mi]
    re2\f

    %63
    fa
    la4 re
    sol, la

    %66
    R2*6
    la8 [fa fa fa]
    sol[fa fa fa]

    %74
    do' [fa, fa fa]\mbreak
    re'[fa, fa fa]
    mib'[re16 do sib? la sol fa]

    %77
    re'8[sib do la]
    sib,2
    re

    %80
    fa4 sib
    mib, fa
    sib,8[re' re re]

    %83
    re[re re re]
    re[re re re]
    do,2

    %86
    mib
    sol4 do
    fa, sol

    %89
    do,8[mib' mib mib]\mbreak
    mi![mi mi mi]
    mi[mi mi mi]

    %92
    re,2\f
    fa
    la4 re

    %95
    sol, la
    re, r
    R2*2

    %99
    \tuplet 3/2 {
        mib'8\p[(do sib] la [sol fa)]
        re'[(sib la] sol [fa mib)]\mbreak
        do'[(la sol] fad[mi re)]

        %102
        sib'[(re do] sib[la sol]
        do)[mib (re] do[sib la]
        sib)[re(do] sib[la sol]

        %105
        fad)[la(sol] fad[mi re]
        sib')[re(do] sib [la sol)]
    }
    la4 fad

    %108
    sol r8 la
    \tuplet 3/2 {
        sib8[(la sib)] sib[(la sib)]
        si[(la si)] si[(la si)]

        %111
        do[(si do)] do[(si do)]\mbreak
        dod[(si? dod)] dod[(si dod)]
        re[(dod? re)] mib[(re mib)]

        %114
        fad,[(la sol] fad[mi? re]
        sib')[re( do?] sib [la sol]
        fad)[la(sol] fad[mi re]

        %117
        sib') [re(do] sib[la sol]
        do)[mib?(re] do[sib la]
        sib)[re( do] sib[la sol])
    }

    %120
    la4 fad
    sol r
    sol2

    %123
    sib\mbreak
    re4 sol,
    do, re
    sol2

    %127
    sib
    re4 sol,
    do, re

    %130
    sol,8[sol'' la fad]
    sol[sol la fad]
    sol2\fermata

}

IVvlIIn = \relative do'' {

    R2*4
    r4 r8 sib
    mib16[re do sib] mib[re do sib]

    %7
    la4\tr r8 la
    re16[do sib la] re[do sib la]
    sol4\tr r8 sol

    %10
    do16[sib la sol] do[sib la sol]
    re8 dod'4 re8
    re, si'4  do8

    %13
    re, la'4 sib8
    re,16[mi re mi] fad[sol fad sol]\mbreak
    la[sib la sib] do[re do re]

    %16
    sib8 [sol la fad]
    sol2\f
    sib

    %19
    re4 sol,
    do, re
    sol8 sib'16 do re do sib8

    %22
    r mib,16 fa sol fa mib8
    r la16 sib do sib la8
    r re,16 mib fa mib re8

    %25
    r sol16 la sib la sol8
    r fad16[sol la sol fad8]
    sol,2\f

    %28
    sib
    re4 sol,
    do,4\p re

    %31
    sol r
    R2*6
    r4 r8 fad'\p

    %39
    fa!2
    mib~
    mib

    %42
    re~
    re
    do8[do do do]

    %45
    sib4 sib
    sib8 lab16 sol lab8 sol16 fa
    sol8[mib sol sib]

    %48
    do4 do\mbreak
    sol mi
    do'8[do, fa la]

    %51
    la4 la
    la fad
    re'8[re, sol sib]

    %54
    la16(si dod4.)
    mi,16\parenthesize (fa sol4.)
    dod,16(re mi4.)

    %57
    re4 mi
    fa sol
    la si

    %60
    la la,\mbreak
    re8[re re dod]
    re2\f

    %63
    fa
    la4 re
    sol, la

    %66
    R2*6
    do8[fa, fa fa]
    re'[fa, fa fa]

    %74
    mib'[fa, fa fa]\mbreak
    fa'[fa, fa fa]
    do'[la fa la]

    %77
    sib[re mib do]
    sib,2
    re

    %80
    fa4 sib
    mib, fa
    sib,8[sib' sib sib]

    %83
    si[si si si]
    si?[si si si]
    do,2

    %86
    mib
    sol4 do
    fa, sol

    %89
    do,8[do' do do]\mbreak
    dod[dod dod dod]
    dod?[dod dod dod]

    %92
    re,2\f
    fa
    la4 re

    %95
    sol, la
    re, r
    R2*2

    %99
    mib'2\p
    re\mbreak
    do

    %102
    re~
    re~
    re~

    %105
    re~
    re4 \tuplet 3/2 { re8(do sib) }
    do4 la

    %108
    sib la
    sol sol
    sol sol

    %111
    sol sol\mbreak
    mi! mi
    la sib

    %114
    la re
    re2~
    re~

    %117
    re~
    re~
    re4  \tuplet 3/2 { re8\parenthesize (do sib) }

    %120
    do4 la
    sol r
    sol2

    %123
    sib\mbreak
    re4 sol,
    do, re

    %126
    sol2
    sib
    re4 sol,

    %129
    do, re
    sol,8[sib' do la]
    sib[sib do la]

    %132
    sib2\fermata

}

IVvlan = \relative do' {

    R2*16
    sol'2\f
    sib

    %19
    re4 sol,
    do, re
    sol,8[re' re re]

    %22
    mib[mib mib mib]
    do[do do do]
    re[re re re]

    %25
    sib[sib sib mib]
    la,[la re re]\mbreak
    sol2\f

    %28
    sib
    re4 sol,
    do,4\p re

    %31
    sol r
    R2*6
    r4 r8 fad\p

    %39
    sol[sol sol sol]
    do,[do do do]
    fa[fa fa fa]

    %42
    sib,[sib sib sib]
    mib[mib mib mib]
    fa[fa mib mib]

    %45
    re4 re
    re sib
    mib mib

    %48
    mi! mi\mbreak
    mi do
    fa fa

    %51
    fad fad
    fad? re
    sol sol,

    %54
    la la
    la la
    la la

    %57
    re mi
    fa sol
    la si

    %60
    la la,\mbreak
    re8[re sol, la]
    re2\f

    %63
    fa
    la4 re
    sol, la

    %66
    R2*6
    fa8[fa fa fa]
    fa[fa fa fa]

    %74
    fa[fa fa fa]\mbreak
    fa[fa fa fa]
    fa[fa fa fa]

    %77
    sib,[sib mib fa]
    sib,2
    re

    %80
    fa4 sib
    mib, fa
    sib,8[sib sib sib]

    %83
    sol'[sol sol sol]
    sol[sol sol sol]
    do,2

    %86
    mib
    sol4 do
    fa, sol

    %89
    do,8[do do do]
    la'[la la la]
    la[la la la]

    %92
    re,2\f
    fa
    la4 re

    %95
    sol, la
    re, r
    R2*2

    %99
    do4\p fa,
    sib mib,\mbreak
    la re,

    %102
    sol sol
    fad fad
    sol sol

    %105
    re' re
    sol, sol
    do re

    %108
    sol, fad'
    sol sol
    fa? fa

    %111
    mib mib\mbreak
    la,4 sol
    fad sol

    %114
    re' re
    sol, sol
    re' re

    %117
    sol, sol
    fad fad
    sol sol

    %120
    do re
    sol, r
    sol'2

    %123
    sib\mbreak
    re4 sol,
    do, re

    %126
    sol2
    sib
    re4 sol,

    %129
    do, re
    sol,8[re' mib re]
    re[re mib re]

    %132
    re2\fermata

}

IVcanton = \relative do'' {

    \autoBeamOff

    sol2
    sib
    re4 sol,

    %4
    r8 do sib16[la] sol[fad]
    sol4  r8 sib
    mib16[re do sib] mib[re do sib]

    %7
    la4\tr r8 la
    re16[do sib la] re[do sib la]
    sol4\tr r8 sol

    %10
    do16[sib la sol] do[sib la sol]
    re8 dod'4 re8
    re, si'4  do8

    %13
    re, la'4 sib8
    re,16[mi re mi] fad[sol fad sol]\mbreak
    la[sib la sib] do[re do re]

    %16
    sib8[sol] la fad
    sol4 r
    R2*13

    %31
    sol8[re'] sib[fad]
    sol16[fad] sol8 r mib'
    re32[do sib8.] do32[sib la8.]

    %34
    sib16[la] sol8 r4
    re'\tr do16[sib] la[sol]
    la[fad] sol[mi?] re4\mbreak

    %37
    re'\tr do16[sib la sol]
    la[fad] sol[mi] re4
    si'4~si16 [sol la si]

    %40
    do[re mib8] r do
    \appoggiatura sib la4~la16[fa sol la]
    sib[do re8] r sib

    %43
    sol[mib'16 re do sib] la[sol]
    la[sol] fa8 r4
    \appoggiatura do'8 sib16[la sib8] \appoggiatura do8 sib16[la sib8]

    %46
    sib[lab16 sol] lab8[sol16 fa]
    sol8[mib sol sib]
    \appoggiatura re8 do16[sib do8] \appoggiatura re8 do16[sib do8]\mbreak

    %49
    do8[sib16 la sib8 la16 sol]
    la8[fa la do]
    \appoggiatura mi8 re16[do re8] \appoggiatura mi8 re16[do re8]

    %52
    re[do16 sib] do8 sib16[la]
    sib8 sol r re'
    dod16[re] mi4.

    %55
    sol,16[la] sib4.
    mi,16[fa] sol4.
    fa8[re16 fa] sol8[mi16 sol]

    %58
    la8 [fa16 la] si8[sol16 si]
    dod8[la16 dod] re8[si16 re]
    mi [re dod si la sol fa mi]\mbreak

    %61
    fa8[re'] fa, mi
    re4 r
    R2*3

    %66
    re8 re'4 do16 [sib]
    la8 sib4 la16[sol]
    fa8 sol4 fa16 [mi]\mbreak

    %69
    re[mi re mi] fa[sol fa sol]
    la[si la si] dod[re dod re]
    mi8 la, r4

    %72
    la8[fa fa fa]
    sol[fa fa fa]
    do' [fa, fa fa]\mbreak

    %75
    re'[fa, fa fa]
    mib'[re16 do sib? la sol fa]
    re'8[sib] do la

    %78
    sib4 r
    R2*3
    sib16[do sib do] sib[ do re do]

    %83
    si[do si do] si[do] re[do]
    si8 la16 sol la8 si
    do4 r

    %86
    R2*3
    do16[re do re] do[re mib re]\mbreak
    dod[re dod re] dod[re] mi?[re]

    %91
    dod8 si16 la si8 dod
    re4 r
    R2*3

    %96
    re8[do16 sib la8 sol]
    mib'16[re do sib la8] sol
    fad re r re'

    %99
    \tuplet 3/2 {
        mib[(do sib] la [sol fa)]
        re'[(sib la] sol [fa mib)]\mbreak
        do'[(la sol] fad[mi re)]

        %102
        sib'[(re do] sib[la sol]
        do)[mib (re] do[sib la]
        sib)[re(do] sib[la sol]

        %105
        fad)[la(sol] fad[mi re]
        sib')[re(do] sib [la sol)]
    }
    la4 fad

    %108
    sol r8 la
    \tuplet 3/2 {
        sib8[(la sib)] sib[(la sib)]
        si[(la si)] si[(la si)]

        %111
        do[(si do)] do[(si do)]\mbreak
        dod[(si? dod)] dod[(si dod)]
        re[(dod? re)] mib[(re mib)]

        %114
        fad,[(la sol] fad[mi? re]
        sib')[re( do?] sib [la sol]
        fad)[la(sol] fad[mi re]

        %117
        sib') [re(do] sib[la sol]
        do)[mib?(re] do[sib la]
        sib)[re( do] sib[la sol])
    }

    %120
    la4 fad
    sol r
    sol2

    %123
    sib\mbreak
    re4 sol,
    do, re

    %126
    sol2\tr ~
    sol~
    sol~

    %129
    sol4 r
    r8 sol do la
    sib sol la fad

    %132
    sol2\tr

}

IVtesto = \lyricmode {

    Al -- le -- lu -- ia al -- le -- lu -- ia al - - - - - - - - - - - - - - - - - - - - - - - - le -- lu -- ia
    Al -- le -- lu -- ia al -- le - lu -- ia al - - le -- lu -- ia al - le -- lu -- ia al - - - - - - le -- lu -- ia
    al - - - - - - - - - - - - le -- lu -- ia al - - - - - - - - - - - - - - le -- lu -- ia
    Al - - - - - - - - - - - le -- lu -- ia al - - - - - le -- lu -- ia al - - - le -- lu -- ia al -- le -- lu -- ia
    al - - - le -- lu -- ia al -- le -- lu -- ia  al - le -- lu -- ia al - - - -  le -- lu -- ia
    al - - - - - - - - - - - le -- lu -- ia al -- le -- lu -- ia  al -- le -- luia al -- le -- lu -- ia al -- le -- lu -- ia.

}

IVbcn = \relative do {

    sol8[sol'16 fad sol8 sol,]
    r8 sol'16 [fad sol8 sol,]
    r8 sol'16 [fad sol8 sol,]

    %4
    do4 re
    sol,8[sol'16 fad sol8 sol,]
    sol'4 sol

    %7
    fad fad
    fa! fa
    mi mi

    %10
    mib mib
    re re
    re re

    %13
    re re
    re re\mbreak
    re re

    %16
    sol8 [sib, do re]
    sol2\f
    sib

    %19
    re4 sol,
    do, re
    sol,8[sol sol sol]

    %22
    do[do do do]
    fa,[fa fa fa]
    sib[sib sib sib]

    %25
    mib,[mib mib mib]
    re[re' re re]\mbreak
    sol2\f

    %28
    sib
    re4 sol,
    do,4\p re

    %31
    sol, r8 re'
    mib[sol do fad,]
    sol[sol, do re]

    %34
    sol[la sib sol]
    fad4 sol
    re re,\mbreak %%fine p. 17

    %37
    fad' sol
    re re,
    R2*23

    %62
    re'2\f
    fa
    la4 re

    %65
    sol, la
    re, re
    re re

    %68
    re dod\mbreak
    re dod8 si
    la4 r

    %71
    la8[la' re re,]
    R2*6
    sib2

    %79
    re
    fa4 sib
    mib, fa

    %82
    sib,4 r
    R2*2
    do2

    %86
    mib
    sol4 do
    fa, sol

    %89
    do, r\mbreak
    R2*2
    re2\f

    %93
    fa
    la4 re
    sol, la

    %96
    re, r8 sib
    do4 dod
    re8[la fad re]

    %99
    R2*23
    sol'2
    sib\mbreak

    %124
    re4 sol,
    do, re
    sol2

    %127
    sib
    re4 sol,
    do, re

    %130
    sol,8[sol' do, re]
    sol,[sol' do, re]
    sol,2\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 55
    s2*132
    \bar "|."

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}

IVcanto = {
    \new Voice = "alleluia"
    <<\IVcanton \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{"Longe mala, umbrae, terrores [RV 629]"}
        composer = \markup{"A. Vivaldi (1678 - 1741)"}
    }

    \markup \huge {[1.] Longe mala - All[egr]o}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 4/4 r2^\markup\center-align "Canto  "sol'4 sib'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cto"
                \Icanto\global
                \new Lyrics \lyricsto "mala" \Itesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #6

    }

    \markup \huge {[2.] Recedite nubes - [Recitativo]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 4/4 r4^\markup\center-align "Canto  "r8 sol' sol'16}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cto"
                \IIcanto\global
                \new Lyrics \lyricsto "nubes" \IItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2)
                %\override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] Descende, o coeli vox - Largo}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\minor \time 4/4 r2 ^\markup\center-align "Canto  "r4 r8 sol'8}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cto"
                \IIIcanto\global
                \new Lyrics \lyricsto "coeli" \IIItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[4.] Alleluia}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\minor \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi sol'2 ^\markup\center-align "Canto  "}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "cto"
                \IVcanto\global
                \new Lyrics \lyricsto "alleluia" \IVtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2)
                \override SpacingSpanner.uniform-stretching = ##f
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


