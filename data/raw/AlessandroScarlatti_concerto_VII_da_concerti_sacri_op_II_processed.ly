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


Isopranon = \relative do'' {

    \autoBeamOff
    R1*2
    r2 do8. si16 la8 si
    sold fad16 mi mi'8 mi fa mi mi8. re16(

    %5
    mi4) r r2
    R1*2
    r2 sold,8 fad16 mi fad8 sold

    %9
    la la sol?4 fad r
    R1
    r2 si8 la16 sold la8 si

    %12
    do do si [do16 si] la4 sol?
    r8 si16 si si8 si16 do\mbreak re8 re r16 mi mi re
    do[re mi fa] si,[do re mi] la,[si do re] sol,[do si do]

    %15
    la8 fa'16[mi] re4 do r
    R1*5
    r8 re16 re re8 re16 mi\mbreak fa8 fa r16 fa fa mi

    %22
    re[mi fa sol] do,[re mi fa] re[mi fa8]fa8. mi16(
    fa4) r r2
    do8. sib16 la4 r2

    %25
    r4 dod8 dod\mbreak re re do4
    si r do8. si16 la4
    do8. si16 la8 si sold8. fad16 mi4

    %28
    r2 si'8 la16 sol si8 dod
    re re do?4\mbreak si8 si16 si si8 si16 dod!
    re8 re r4 r8 do do re

    %31
    mi4. re16 [do si8] do si4
    la8 do do re mi4. re16[do]\mbreak
    si8 do si4 la r

    %34
    R1*4

}

ItestoI = \lyricmode {

    Di -- li -- gam te, Do -- mine, _  for -- ti -- tu -- do me -- a.

    Do -- minus _ fir -- ma -- mentum _ me -- um, Do -- minus _ fir -- ma -- mentum _ me - um,

    et re -- fu -- gium _ meum, _ et li -- be -- ra - - - - tor me -- us,

    et re -- fu -- gium _ meum, _ et li -- be -- ra - tor me -- us.

    Di -- li -- gam for -- ti -- tu -- do me -- a, di -- li -- gam di -- li -- gam te, Do -- mine, _

    Do -- minus _ fir -- ma -- mentum _ me -- um,  et re -- fu -- gium _ meum, _ et li -- be -- ra - tor me -- us,

    et li -- be -- ra - - tor me -- us.

}

Ialton = \relative do' {

    \autoBeamOff
    R1*5
    sold'8 fad16 mi fad8 sold la la sol?4
    fad8 fad16 fad sol8 sol16 fad\mbreak mi8 [fad16 sol] la [si la sol]

    %8
    fad [si la sol] fad4 mi r
    R1
    sol8. fad16 mi8 fad red dod16 si mi8 mi

    %11
    fad mi mi8. red16(mi4) r\mbreak
    mi8 re16 do re8 mi fa? fa mi4
    re r r2

    %14
    R1*2
    r2 r8 mi16 mi mi8 mi16 fa
    sol8 sol r16 la la sol fa[sol la sib] mi,[fa sol la]\mbreak

    %18
    re,[mi fa sol] do,[fa mi fa] re8 sib'16[la] sol4
    fa r r2
    r r8 mi16 mi mi8 mi16 fad

    %21
    sol8 sol r4 r16 la la sol fa?4~\mbreak
    fa16[sol la sib] mi,[fa sol la] fa8 la sol4
    fa r r2

    %24
    la8. sol16 fa4 la8. sol16 fa8 sol
    mi8. re16 dod4 r2
    re8 do?16 si do8 re\mbreak mi8 mi fa4

    %27
    mi r r2
    mi8 re16 do mi8 fad sol sol sol4
    fad8 sold la4 sold r

    %30
    r8 fa16 fa fa8 fa16 sol\mbreak la8 la r4
    r8 mi mi fad sold la la8. sold16(
    la4) r r8 mi mi fad

    %33
    sold sold la8. sold16(la4) r
    R1*4

}

ItestoII = \lyricmode {

    Do -- minus _ fir -- ma -- mentum _ me -- um

    et re -- fu -- gium _ me - - - um,

    Di -- li -- gam te, Do -- mine, _  for -- ti -- tu -- do me -- a.

    Do -- minus _ fir -- ma -- mentum _ me -- um,

    et re -- fu -- gium _ me -- um, et li -- be -- ra - -  - -  tor me -- us,

    et re -- fu -- gium _ me -- um, et li -- be -- ra - -  tor me -- us.

    Di -- li -- gam, di -- li -- gam te Do -- mine, _ Do -- minus _ fir -- ma -- mentum _ me -- um,

    Do -- minus _ fir -- ma -- mentum _ me - - - um,

    et re -- fu -- gium _ me -- um, et li -- be -- rator _ me -- us, et li -- be -- rator _ me -- us.

}

Itenoren = \relative do' {

    \autoBeamOff
    R1*3
    r2 do8. si16 la8 si
    sold fad16 mi mi'8 mi fa? mi mi8. re16(

    %6
    mi4) r r2
    R1*2\mbreak
    dod8 si16 la si8 dod re re do?4

    %10
    si r r2
    do8. si16 la8 si sold fad16 mi fad8 sold
    la4 sol? fa?16 [sol la si] do4\mbreak

    %13
    sol r r2
    R1*6
    r8 la16 la la8 la16 si do8 do r4

    %21
    r8 si16 si si8 si16 dod re8 re r16 re re do?
    sib4. la8 sib fa do'4\mbreak
    fa, r r2

    %24
    r fa'8. mi16 re8 mi
    dod8. si16 la4 fad8 mi16 re mi8 fad
    sol sol la si do do re4

    %27
    la r r8 mi' mi re\mbreak
    do la do re mi2
    re8[si] la4 mi' r

    %30
    r8 re16 re re8 re16 mi fa8 fa r4
    r8 do do re mi la, mi'4
    la, r\mbreak r8 do do re

    %33
    mi la, mi'4 la, r
    R1*4

}

ItestoIII = \lyricmode {

    Di -- li -- gam te, Do -- mine, _  for -- ti -- tu -- do me -- a, Do -- minus _ fir -- ma -- mentum _ me -- um,

    di -- li -- gam te, Do -- mine, _  for -- ti -- tu -- do me - a, et re -- fu -- gium _ me -- um, et re -- fu -- gium _ me -- um,

    et li -- be -- ra - -  tor me -- us.

    Di -- li -- gam te, Do -- mine, _  Do -- minus _ fir -- ma -- mentum _  fir -- ma -- mentum _ me -- um,

    et li -- be -- rator, _  li -- be -- ra --  tor me -- us, et re -- fu -- gium _ me -- um,

    et li -- be -- rator _ me -- us, et li -- be -- rator _ me -- us.

}


IvlIn = \relative do'' {

    do8. si16 la8 si sold fad16 mi mi'8 mi
    fa mi mi8. re16 mi4 r8 mi,
    fa16 sol mi fa re8 re' do4 r\mbreak

    %4
    R1
    r4 do8 do la sold la4
    sold r r2

    %7
    R1*2
    mi'8 re16 dod re8 mi la,4. la8
    si si'16 la sol8 la fad mi16 red mi4

    %11
    R1*2\mbreak
    r2 r8 fad8 mi4
    R1

    %15
    r2 r4 r16 do' si do
    la8 do4 si8 do4 r
    R1*2

    %19
    r16 do sib do la la sol la fa sol la fa sol4
    fa r r2\mbreak
    R1*2

    %23
    r4 fa16 sol la sib sol8 la sol4
    fa r r2
    R1*2

    %27
    r2 r8 si, si do16 re
    mi4 r r2
    r r4 r8 mi

    %30
    fa la16 la la8 fa\mbreak do do r4
    R1*3
    r8 sol'16 sol sol8 sol16 la si8 si,16 si si8 si16 dod

    %35
    re8 la'16 la la8 la16 si do4. si16 la
    sold8 la la8. sold16\mbreak la8 mi4 re16 do
    si8 do si4 la r

}

IvlIIn = \relative do'' {

    R1
    do8. si16 la8 si sold fad16 mi la8 la
    si la la8. sold16 la4 r

    %4
    R1
    r4 mi'8 mi re si la re\mbreak
    si4 r r2

    %7
    R1*2
    r2 fad'8 mi16 re mi8 fad
    sol4 r r8 fad sol4

    %11
    R1*2
    r2 r8 re16 do si4
    R1

    %15
    r2 r16 la' sol la mi mi re mi\mbreak
    do re mi do re4 do r
    R1*2

    %19
    r4 r16 fa mi fa re8 fa4 mi8
    fa4 r r2
    R1*2

    %23
    do16 re  mi fa re mi fa sol mi8 fa4 mi8
    fa4 r r2
    R1*2\mbreak

    %27
    r2 r8 sold, sold la16 si
    do4 r r2
    r r4 r8 sold

    %30
    la fa'16 fa fa8 re la la r4
    R1*2
    r2 r8 do16 do do8 do16 re

    %34
    mi4. re16 do\mbreak re8 re16 re re8 re16 mi
    fa4. mi16 re mi4. re16 do
    si8 do si4 la8 do4 si16 la

    %37
    sold8 la la8. sold16 la4 r

}

Ibcn = \relative do {

    la'8 sol fa re mi mi' do sold
    la sol? fa4 mi do8 do'
    re do si4 la8 sol fa re

    %4
    mi mi' do sold la sol? fa4
    mi do re8 mi fa4\mbreak
    mi8 mi' re si dod si16 la si8 dod

    %7
    re do! si sol do si la mi
    red mi si' si, mi mi' re si
    dod si16 la si8 dod re re do?4\mbreak

    %10
    si8 sol do la si4 sol8 fad16 mi
    la8 sol fad4 mi fad8 sold
    la la sol?4 fa16 sol la si do8 do,

    %13
    sol'4 r8 fa fad4 sold
    la,8 la'4 sol fa? mi8\mbreak
    fa4 sol8 sol, do4 r8 mi

    %16
    fa do sol' sol, do4 r8 do
    si4 dod re8 re'4 do?8~
    do sib la4 sib8 sib, do do,

    %19
    fa4 r8 la sib fa do' do,
    fa fa'4 re8\mbreak do do'4 la8
    sol si16 si si8 si16 dod re4. re16 do

    %22
    sib4. la8 sib fa do' do,
    fa4 sib,8 fa do'16 sib la sib do8 do,
    fa'4. mi8 re4. sol,8

    %25
    la4 la'8 sol\mbreak fad mi16 re mi8 fad
    sol mi la si do4 re
    la8 sol fa re mi4. re8

    %28
    do la do re mi2
    re8 si la4 mi' r8 mi
    re re16 re re8 re16 mi fa8 fa mi re\mbreak

    %31
    do do do re mi la, mi' mi,
    la la' la si do do, do re
    mi la, mi' mi, la la' la fa

    %34
    do' do,4 si16 la sol8 sol'8. sol16 fa mi
    re8 re'8. re16 do si la8 la, do re\mbreak
    mi la, mi' mi, la la do re

    %37
    mi la, mi' mi, la2

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> <_+> <6>8 <6>
    s <6> <7> <6> <_+>4 <6>
    s8 <6> <7> <6+> s8 <6> s4
    <_+> <6>8 <6> <6> <6> <7> <6>
    <_+>4 <6> s8 <_+> <7> <6>
    <_+>4 <_+>8 <6+> <6>4 <6>8 <6 5->
    <_+> <4+ 2> <6>4 s8 <6> s4
    <6> <4>8 <3+> <_+> s <_+> <6+>
    <6>4 s8 <6 5-><5 4> <_+> <6 4+ 2>4  %OOKK
    <6>4 s8 <6+> <_+>4 <6>
    <6+>8 <6> <7> <6+> <_+>4 <6>8 <6 5->
    s4 <6> s2
    s <6>4 <6>8 <5->
    s <5> <4 2> <6> <4 2> <6> <4+ 2> <6>%OOKK bar 14
    <6 5>4 <5 4>8 <3> s4 s8 <6>
    s4 <4>8 <3> s2
    <6>4 <6> s8 <6-> <4 2> <6>
    <4 2> <6> <6>4 s <5 4>8 <3>
    s4 s8 <6> <6 5> s <5 4> <3>
    s8 s4 <6>8 \mbreak s s4 <6+>8 %OOKK bar 20
    s8 <6> <6>4 s2
    <5>4 <4 2>8 <6> s4 <5 4>8 <3>
    s2 s8 <6> <5 4> <3>
    s4. <4 2>8 s4. <6 5>8
    <_+>2 <6>4 <6>8 <6- 5>
    s1
    s4 <6> <_+>4. <4+ 2>8
    <6>4 <6>8 <_+> <5>4 <6+>
    <_+>8 <6+> s4 <_+> s8 <6+>
    <_->2 s4 <6>%OOKK bar 30
    s4 s8 <_+> <_+>4 <4>8 <_+>
    s4 s8 <6> s4 s8 <_+>
    <_+>4 <4>8 <_+> s2
    s1
    s2 s4 <6>
    <_+>4 <4>8 <_+> s4 <6>
    <_+> <4>8 <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 50
    s1*37
    \bar "||"

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Isoprano = {
    \new Voice = "diligam1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "diligam2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "diligam3"
    <<\Itenoren \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIsopranon = \relative do'' {

    \autoBeamOff
    r8 la mi'16[re mi si] do[si do la] mi'[re mi si]
    do8 la r4 r2
    r8 mi 'do16[si] la[si] sold8. fad16 mi4

    %4
    r8 mi' do16[si] la[si]\mbreak sold8. fad16 mi4
    r r8 si' do si16([la] si4)
    r r8 si do16[mi re do] re[mi re do]

    %7
    mi8 re do16[re] mi[do] la8 si16 do si[la si8]\mbreak
    do4 r r2
    r8 mi fa16[mi re fa] mi8 la, r4

    %10
    r8 mi' fa16[mi re fa] mi8 la, r4
    r8 mi' do16[si] la[si] sold8. fad16 mi4
    r4 r8 si'\mbreak do si r si

    %13
    do si r si16 do re8 mi16 fa do8. si16(
    la4) r8 si16 do re8 mi16 fa do8. si16(
    la4) r r2

    %16
    r r4 r8 mi'\mbreak
    do16[re si do] la[re do re] si8 la16([si] sol4)
    r2 r4 r8 mi'

    %19
    do16[re si do] la[re do re] si8 sol re' re16 re
    mi8. mi16 mi8 fad\mbreak sol8. re16 re8 re
    do16[re si do] la8. la16 sol4 r

    %22
    r2 r8 si mi16[re do si]
    do[si la sol] fad[si la si] sol8 fad16[(sol] mi4)
    r2 r8 si' mi16[re do si]\mbreak

    %25
    do[si la sol] fad[si la si] sol8 mi si' si16 si
    dod8. dod16 dod8 red mi2~
    mi2. mi4

    %28
    mi2 r4 r8 mi
    fad16[sol mi fad] red8. mi16\mbreak mi4 si8 si16 si
    si8. la16 sol4 r si8 si16 si

    %31
    si8. la16 sol8 mi' fad16[sol mi fad] red8. mi16
    mi4 r r2
    r8 la, mi'16[re mi si] do[si do la] mi'[re mi si]

    %34
    do8 la r4 r2
    r8 mi' do16[si] la[si] sold8. fad16 mi4
    r8 mi' do16[si] la[si]\mbreak sold8. fad16 mi4

    %37
    r r8 si' do si16([la] si4)
    r r8 si do16[mi re do] re[mi re do]
    mi8 re do16[re] mi[do] la8 si16 do si[la si8]\mbreak

    %40
    do4 r r2
    r8 mi fa16[mi re fa] mi8 la, r4
    r8 mi' fa16[mi re fa] mi8 la, r4

    %43
    r8 mi' do16[si] la[si] sold8. fad16 mi4
    r4 r8 si'\mbreak do si r si
    do si r si16 do re8 mi16 fa do8. si16(

    %46
    la4) r8 si16 do re8 mi16 fa do8. si16(
    la4) r r2
    R1

}

IItestoI = \lyricmode {

    Can -- ta - - - bo, can -- ta -- bo  Do -- mi -- no, can -- ta -- bo  Do -- mi -- no

    qui bo -- na,  qui bo - - na bo -- na tri -- buit  _ mi -- hi: can -- ta - bo, can -- ta - bo, can -- ta -- bo  Do -- mi -- no,

    qui bona, _ qui bona, _ bona _  tri -- buit  _ mi -- hi, bona _  tri -- buit  _ mi -- hi.

    Et psal - - lam, et psal - - lam no -- mini _ Do -- mini _ al -- tis -- simi, _ al -- tis - simi, _

    et psal - - - lam, et psal - - - lam no -- mini _ Do -- mini _ al -- tis -- si -- mi,  al -- tis - si -- mi,

    no -- mini _ Do -- mini, _ no -- mini _ Do -- mini _ al -- tis - si -- mi.

    Can -- ta - - - bo, can -- ta -- bo  Do -- mi -- no, can -- ta -- bo  Do -- mi -- no

    qui bo -- na,  qui bo - - na bo -- na tri -- buit  _ mi -- hi: can -- ta - bo, can -- ta - bo, can -- ta -- bo  Do -- mi -- no,

    qui bona, _ qui bona, _ bona _  tri -- buit  _ mi -- hi, bona _  tri -- buit  _ mi -- hi.

}


IIvlIn = \relative do'' {

    R1
    r8 la mi'16 re mi si do si do la mi' re mi si
    do8 la r4 r8 mi' do16 si la si

    %4
    sold8. fad16 mi4 r r8 mi'
    mi4 mi,\mbreak r r8 mi'
    mi4 mi, r2

    %7
    R1
    mi'16 fa sol mi la8 sol do,8 re16 mi re do re8
    mi4 r r8 mi fa16 mi re fa

    %10
    mi8 la, r4 r8 mi' fa16 mi re fa
    mi8 la, r4\mbreak r8 mi' do16 si la si
    sold8. fad16 mi4 r8 si' do si

    %13
    r si do si r2
    r8 mi fa si, r la la8. sold16
    la8 mi' fa re\mbreak mi do re si16 do

    %16
    re8 mi16 fa do8. si16 la4 r
    r2 r4 r8 mi'
    do16 re si do la re do re si8 la16 si sol4

    %19
    R1*2
    r2 r8 re' sol4~\mbreak
    sol8 sol sol8. fad16 sol4 r

    %23
    r2 r8 si, mi16 re do si
    do si la sol fad si la si sol8 fad16 sol mi4
    R1*2

    %27
    si''16 la si la si la sol fad\mbreak mi4 r
    si'16 la si la si la sol fad mi4 r
    r8 si si8. si16 si4 r

    %30
    r4 si8 si16 si si8. la16 sol4
    r8 si si mi red mi fad4\mbreak
    sol8 sol fad4 mi r

    %33
    R1
    r8 la, mi'16 re mi si do si do la mi' re mi si
    do8 la r4 r8 mi' do16 si la si

    %36
    sold8. fad16 mi4 r r8 mi'
    mi4 mi,\mbreak r r8 mi'
    mi4 mi, r2

    %39
    R1
    mi'16 fa sol mi la8 sol do,8 re16 mi re do re8
    mi4 r r8 mi fa16 mi re fa

    %42
    mi8 la, r4 r8 mi' fa16 mi re fa
    mi8 la, r4\mbreak r8 mi' do16 si la si
    sold8. fad16 mi4 r8 si' do si

    %45
    r si do si r2
    r8 mi fa si, r la la8. sold16
    la8 mi' fa re\mbreak mi do re si16 do

    %48
    re8 mi16 fa do8. si16 la4 r

}

IIvlIIn = \relative do'' {

    R1
    r8 do si4 mi,8 la16 do si4
    mi, r r8 si' la mi

    %4
    si'4 la r r8 si
    do si16 la si4 r r8 si
    do si16 la si4 r2

    %7
    R1\mbreak
    r4 do16 re mi do la8 si16 do si la si8
    do4 r r8 do la16 sol la si

    %10
    do4 r r8 do la16 sol la si
    do4 r r8 si la mi
    si'8. la16 sold4\mbreak r8 sold la sold

    %13
    r sold' la sold r2
    r8 do, re sold, la fad mi4
    mi8 do' re si do la si sold

    %16
    la la' la8. sold16 la4 r   %%% OOKK
    r2 r4 r8 si,
    mi, mi' re16 fad, mi fad re4 r

    %19
    R1*2
    r2 r4 r8 re'
    do16 re si do la8. la16 sol4 r

    %23
    r2 r8 sol si sol
    mi4 fad si, r\mbreak
    R1

    %26
    r2 si''16 la si la si la sol fad
    mi4 r si'16 la si la si la sol fad
    mi4 r mi16 re mi re mi re do re

    %29
    si la sol la fad8. fad16\mbreak mi4 r
    r sol8 sol16 sol sol8. fad16 mi4
    r8 sol sol la fad sol si4

    %32
    si8 mi mi8. red16 mi4 r
    R1
    r8 do si4 mi,8 la16 do si4

    %35
    mi, r r8 si' la mi
    si'4 la r r8 si
    do si16 la si4 r r8 si

    %38
    do si16 la si4 r2
    R1\mbreak
    r4 do16 re mi do la8 si16 do si la si8

    %41
    do4 r r8 do la16 sol la si
    do4 r r8 do la16 sol la si
    do4 r r8 si la mi

    %44
    si'8. la16 sold4\mbreak r8 sold la sold
    r sold' la sold r2
    r8 do, re sold, la fad mi4

    %47
    mi8 do' re si do la si sold
    la la' la8. sold16 la4 r

}

IIbcn = \relative do {

    la'4 sold la sold
    la sold la sold
    la r8 fa mi4 la8 do,16 re

    %4
    mi4 la8 do,16 re mi4 r8 sold
    la4 sold la sold
    la sold la si\mbreak

    %7
    do8 sol la mi fa4 sol8 sol,
    do4 fa8 mi fa16 mi re do sol'8 sol,
    do4 re la'8 do, re4

    %10
    la'8 do, re4 la'8 do, re4
    la r8 fa' mi sold la do,16 re
    mi4 r8 mi\mbreak la, mi' la, mi'

    %13
    la mi la mi fa mi16 re mi8 mi,
    la la' re, mi fa re mi mi,
    la la'16 sol fa8 sol mi fa16 mi re8 mi

    %16
    fa re mi mi, la4 r
    la'8 sol fad re\mbreak sol4 r8 sol
    la sol fad re sol4 r8 sol

    %19
    la sol fad re sol sol16 sol si8 sol
    do do,4 la8 si4 r
    la8 sol re' re, sol4 r8 si

    %22
    do sol re' re, sol4 mi'\mbreak
    la red, mi sol
    la red, mi sol

    %25
    la red, mi8 mi16 fad sol8 mi
    la4 r8 fad sol4 r
    sol r sol r

    %28
    sol r8 mi16 fad sol4 r8 la
    red, mi si4\mbreak mi r
    R1

    %31
    r8 mi mi do si mi si' si,
    mi sol16 la si8 si, mi4 r8 mi
    la4 sold la sold

    %34
    la sold la sold
    la r8 fa mi4 la8 do,16 re
    mi4 la8 do,16 re mi4 r8 sold

    %37
    la4 sold la sold
    la sold la si\mbreak
    do8 sol la mi fa4 sol8 sol,

    %40
    do4 fa8 mi fa16 mi re do sol'8 sol,
    do4 re la'8 do, re4
    la'8 do, re4 la'8 do, re4

    %43
    la r8 fa' mi sold la do,16 re
    mi4 r8 mi\mbreak la, mi' la, mi'
    la mi la mi fa mi16 re mi8 mi,

    %46
    la la' re, mi fa re mi mi,
    la la'16 sol fa8 sol mi fa16 mi re8 mi
    fa re mi mi, la4 r

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> s <6>
    s4 <6> s <6>
    s4 s8 <6> <_+>4 s8 <6>
    <_+>4 s8 <6> <_+>4 s8 <6>
    s4 <6> s <6>
    s4 <6> s <6>
    s4 s8 <6> <6 5>4 <5 4>8 <3>
    s4 s8 <6> s4 <4>8 <3>
    s2 s8 <6> s4
    s8 <6> s4 s8 <6> s4
    s s8 <6> <_+> <6> s <6>
    <_+>4 s8 <_+> s <_+> s <_+>
    s <_+> s <_+> <6>4 <6 4>8 <5 _+>
    s4 <_->8 <_+> <6>4 <6 4>8 <5 _+>
    s4 <6> <6> <6>8 <_+>
    <6>4 <6 4>8 <5 _+> s2

    s4 <6> s s8 <6>
    s4 <6> s s8 <6>
    s4 <6> s <6>
    s8 s4 <6+>8 <6>2
    <6+>4 <4>8 <_+> s4 s8 <6>
    s4 <4>8 <_+> s2
    s4 <6> s <6>
    s <6> s <6>
    s <6> s <6>
    <_+>4 s8 <6+> <6>2
    <6>4 s <6> s
    <6>2 <6>
    <6>4 <_+> s2
    s1
    s4 s8 <6> s <_+> <4> <_+>
    s <6> <4> <_+> s2

    s4 <6> s <6>
    s4 <6> s <6>
    s4 s8 <6> <_+>4 s8 <6>
    <_+>4 s8 <6> <_+>4 s8 <6>
    s4 <6> s <6>
    s4 <6> s <6>
    s4 s8 <6> <6 5>4 <5 4>8 <3>
    s4 s8 <6> s4 <4>8 <3>
    s2 s8 <6> s4
    s8 <6> s4 s8 <6> s4
    s s8 <6> <_+> <6> s <6>
    <_+>4 s8 <_+> s <_+> s <_+>
    s <_+> s <_+> <6>4 <6 4>8 <5 _+>
    s4 <_->8 <_+> <6>4 <6 4>8 <5 _+>
    s4 <6> <6> <6>8 <_+>
    <6>4 <6 4>8 <5 _+> s2

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 48
    s1*48
    \bar "||"

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIsoprano = {
    \new Voice = "cantabo"
    <<\IIsopranon \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIalton = \relative do' {

    \autoBeamOff
    R1
    r2 re8 fa mi sol
    fa8. mi16 re4 r2

    %4
    re8 fa mi sol fa8. mi16 re8 sib'~\mbreak
    sib la sol16[fa sol8] la4 r
    r2 r8 la sol fa16 mi

    %7
    fa8 mi r4 r8 la sol fa16 mi
    fa8 mi fa mi fa16[sol mi fa] re[sol fa sol]\mbreak
    mi[fa re mi] fa4 r16 fa[sol fa] sol4

    %10
    r16 sol[fa sol] mi[fa re mi] fa[sol la sib] sol4
    fa r r8 la la la16 la
    sib8 la fa sol\mbreak la2~

    %13
    la la
    r r8 la16 sol fa4
    r16 fa[mi fa] sol4 r8 sol16[fa] mi4

    %16
    r16 mi[re mi] fa4 r8 fa16[mi] re4
    r8 sib'16[la] sol[fa mi re]\mbreak la'2
    r16 la[sol fa] mi4 re r

    %19
    r8 re16 re re[mi re mi] re4 r
    r16 fa[mi fa] re4 r16 fa[mi fa] re4
    r16 sib' [la sib] sol[la fa sol] la[sol fa sol] mi4

    %22
    re r r2
    r r4 r8 fa16 fa
    sol8 fa sib4 la r

    %25
    r2 r4 r8 fa16 fa
    sol8 fa sib4 la8 la16 la la8 la
    sol do, fa4 mi sol8 fa16[mi]\mbreak

    %28
    re8 do r4 r sol'16[la fa sol]
    la8 fa16[mi] re4 do r
    r2 sol'8. fa16 mi4
    r2 sol8. fa16 mi8 mi

    %32
    la si16 la sold mi la sold\mbreak fa[mi fa8] r16 sol?[fa sol]
    mi[re mi8] r16 la[sol la] fa[sol mi fa] re8. re16
    mi4 r r2

    %35
    r8 mi mi mi16 mi fad8 fad sold sold\mbreak
    la2 r16 la[si la] sold8. sold16
    la8 mi mi mi16 mi fad8 fad sold8. sold16

    %38
    la2 r16 la[si la] sold8. sold16
    la4 r r2
    R1

    %41
    r2 re,8 fa mi sol
    fa8. mi16 re4 r2
    re8 fa mi sol fa8. mi16 re8 sib'~\mbreak

    %44
    sib la sol16[fa sol8] la4 r
    r2 r8 la sol fa16 mi
    fa8 mi r4 r8 la sol fa16 mi

    %47
    fa8 mi fa mi fa16[sol mi fa] re[sol fa sol]\mbreak
    mi[fa re mi] fa4 r16 fa[sol fa] sol4
    r16 sol[fa sol] mi[fa re mi] fa[sol la sib] sol4

    %50
    fa r r8 la la la16 la
    sib8 la fa sol\mbreak la2~
    la la

    %53
    r r8 la16 sol fa4
    r16 fa[mi fa] sol4 r8 sol16[fa] mi4
    r16 mi[re mi] fa4 r8 fa16[mi] re4

    %56
    r8 sib'16[la] sol[fa mi re]\mbreak la'2
    r16 la[sol fa] mi4 re r
    r8 re16 re re[mi re mi] re4 r

    %59
    r16 fa[mi fa] re4 r16 fa[mi fa] re4
    r16 sib' [la sib] sol[la fa sol] la[sol fa sol] mi4
    re r r2

    %62
    R1

}

IIItestoII = \lyricmode {

    Be -- ne -- dicam _ Do -- minum, _ be -- ne -- dicam _ Do -- minum, _ be -- ne -- di -- cam,

    qui tri -- buit _ mihi, _ qui tri -- buit _ mihi _ in -- tel -- lec - - - - - - - - - tum,

    qui tri -- buit _ mihi _  in -- tel -- lec -- tum,

    in -- tel -- lec - - - - - - - - - - - - - tum, in -- tel -- lec - - - - - - - - - tum.

    Pro -- vi -- debam _ De -- um, pro -- vi -- debam _ De -- um in con -- spectu _ me -- o

    semper, _ semper, _ semper, _ sem - per, sem -- per.

    Quo -- niam, _ quo -- niam _ a dextris _ est mihi _ ne com -- mo - - - - - ve -- ar,

    a dextris _ est mihi _ ne com -- mo - - ve -- ar, a dextris _ est mihi _ ne com -- mo - - ve -- ar.

    Be -- ne -- dicam _ Do -- minum, _ be -- ne -- dicam _ Do -- minum, _ be -- ne -- di -- cam,

    qui tri -- buit _ mihi, _ qui tri -- buit _ mihi _ in -- tel -- lec - - - - - - - - - tum,

    qui tri -- buit _ mihi _  in -- tel -- lec -- tum,

    in -- tel -- lec - - - - - - - - - - - - - tum, in -- tel -- lec - - - - - - - - - tum.

}


IIIvlIn = \relative do'' {

    R1*2
    r8 la' fa8. mi16 re8 re re8. dod16
    re4 r r2

    %5
    r r4 r8 la'
    fa8. mi16 re4 dod r
    r8 la' sol fa16 mi fa8 mi r4\mbreak

    %8
    R1
    r4 r16 do re do re4 r16 re mi re
    mi4 r8 sol do, fa4 mi8

    %11
    fa16 sol la sib sol4 fa r
    r2 r8 mi mi mi16 mi
    fa8 mi dod re\mbreak mi16 re dod si la8 dod16 si

    %14
    la8 la'4 sold8 la4 r8 fa16 mi
    re4 r16 re do re mi4 r8 mi16 re
    do4 r16 do sib do re4 r8 re16 do\mbreak

    %17
    sib8 sol r4 r16 la' sol fa mi8 re
    la re4 dod8 r re16 re re mi re mi
    re4 r 4 r2

    %20
    re4 r16 fa mi fa re4 r16 fa mi fa
    re4 mi\mbreak la,8 re4 dod8
    re16 fa mi fa re4 r16 sib' la sib sol la fa sol

    %23
    la sol fa sol mi4 re r
    r2 r4 r8 fa16 fa
    sol8 fa sib4 la8 fa fa4

    %26
    R1*2\mbreak
    r4 sol8 fa16 mi re8 do r4
    r2 sol'16 la fa sol la8 la

    %30
    si do4 si8 do4 r
    sol8. fa16 mi4 r2
    R1*2

    %34
    r4 r16 la sol la fa sol mi fa re8. re16\mbreak
    mi4 r r2
    r4 r16 la sol la fa mi re do si8. si16

    %37
    la do si do la4 r2
    r4 r16 la' sol la fa mi re do si8. si16
    do8 la'4 sold8 la2\mbreak

    %40
    R1*2
    r8 la fa8. mi16 re8 re re8. dod16
    re4 r r2

    %44
    r r4 r8 la'
    fa8. mi16 re4 dod r
    r8 la' sol fa16 mi fa8 mi r4\mbreak

    %47
    R1
    r4 r16 do re do re4 r16 re mi re
    mi4 r8 sol do, fa4 mi8

    %50
    fa16 sol la sib sol4 fa r
    r2 r8 mi mi mi16 mi
    fa8 mi dod re\mbreak mi16 re dod si la8 dod16 si

    %53
    la8 la'4 sold8 la4 r8 fa16 mi
    re4 r16 re do re mi4 r8 mi16 re
    do4 r16 do sib do re4 r8 re16 do\mbreak

    %56
    sib8 sol r4 r16 la' sol fa mi8 re
    la re4 dod8 r re16 re re mi re mi
    re4 r 4 r2

    %59
    re4 r16 fa mi fa re4 r16 fa mi fa
    re4 mi\mbreak la,8 re4 dod8
    re16 fa mi fa re4 r16 sib' la sib sol la fa sol

    %62
    la sol fa sol mi4 re r

}

IIIvlIIn = \relative do'' {

    R1*2
    r2 r8 la fa8. mi16
    re4 r r2

    %5
    r r8 mi' dod8. si16
    la8 la'4 sol8 la4 r
    r8 dod, re mi la, dod r4

    %8
    R1\mbreak
    r4 r8 la fa4 r8 sib
    sol4. sol8 la do re do16 sib

    %11
    la8 fa'4 mi8 fa4 r
    R1
    r2 r8 mi mi mi16 mi

    %14
    fa8 mi dod re mi4 la,\mbreak
    sib r sol r
    la r fa r

    %17
    sol8 re r4 r r16 la'' sol fa
    mi8 la, sib la16 sol fa8 la sib la16 sol
    la4 r r8 la sib la16 sol

    %20
    la4 r la4 r
    sib do do8 fa, sib la
    la4 r16 fa' mi fa re4 mi

    %23
    la,8 re4 dod8 re4 r
    r2 r8 do?16 do re8 do\mbreak
    re16 mi fa4 mi8 fa do16 do re8 do
    R1*2

    %28
    r4 mi8 re16 do si8 do r4
    r2 r4 do16 re si do
    re8 mi re4 do r

    %31
    mi8. re16 do4 r2\mbreak
    R1*2
    r16 mi re mi do8 si16 do la8 sold la la'

    %35
    sold4 r r2
    r16 mi re mi do4 r r16 mi re mi
    do mi re mi do4 r2\mbreak

    %38
    r16 mi re mi do do si do la8 fa' mi4~
    mi16 mi re do si8. si16 la4 r
    R1*2

    %42
    r2 r8 la fa8. mi16
    re4 r r2
    r r8 mi' dod8. si16

    %45
    la8 la'4 sol8 la4 r
    r8 dod, re mi la, dod r4
    R1\mbreak

    %48
    r4 r8 la fa4 r8 sib
    sol4. sol8 la do re do16 sib
    la8 fa'4 mi8 fa4 r

    %51
    R1
    r2 r8 mi mi mi16 mi
    fa8 mi dod re mi4 la,\mbreak

    %54
    sib r sol r
    la r fa r
    sol8 re r4 r r16 la'' sol fa

    %57
    mi8 la, sib la16 sol fa8 la sib la16 sol
    la4 r r8 la sib la16 sol
    la4 r la4 r

    %60
    sib do do8 fa, sib la
    la4 r16 fa' mi fa re4 mi
    la,8 re4 dod8 re4 r

}

IIIbcn = \relative do {

    re8 fa  mi sol fa8. mi16 re8 re'
    sib la16 sol la8 la, re4 dod
    re r8 re'sib la16 sol la8 la,

    %4
    re4 dod re r8 re
    mi fa sib,4 la r8 la\mbreak
    re re'16 do sib4 la8 la si? dod

    %7
    re la si dod re la si dod
    re dod re dod re do sib si
    do sib la la, sib4 r8 sib\mbreak

    %10
    do do'4 sib8 la fa sib, do
    fa, fa' sib, do fa,4 r8 fa'
    sol la sib4 la dod,

    %13
    re8 dod la si dod4 r
    re8 dod la si dod4 re8 re'16 do?\mbreak
    sib4  r16 sib la sib do4 r8 do16 sib

    %16
    la4 r16 la sol la sib4 r8 sib16 la
    sol4 r dod,4. re8
    dod re sol, la re fa sol fa16 mi

    %19
    fa8 fa sol fa16 mi fa8 fa sol fa16 mi
    fa4 r fa r
    sol do, fa8 re sol, la

    %22
    re4 r16 re' do re sib4 do
    fa,8 re sol, la re4 la
    sib8 la re mi fa la sib la\mbreak

    %25
    sib la sol4 fa8 la sib la
    sib la re, mi fa4 r8 fa
    mi fa re4 do8 re mi fa

    %28
    sol la mi fa sol la mi re16 mi
    fa8 fa, sol sol' do,4 fa\mbreak
    re8 do sol' sol, do4 r

    %31
    do' r do, r8 do
    fa8 re mi do re re'16 do si8 la16 si
    do4 r8 do, re mi fa4

    %34
    mi la, re8 mi fa4
    mi do8 la\mbreak r16 re do re si mi re mi
    do4 la r8 re mi mi,

    %37
    la4 do8 la r16 re do re si mi re mi
    do4 la r8 re mi mi,
    la do re mi la,4 r

    %40
    re8 fa  mi sol fa8. mi16 re8 re'
    sib la16 sol la8 la, re4 dod
    re r8 re'sib la16 sol la8 la,

    %43
    re4 dod re r8 re
    mi fa sib,4 la r8 la\mbreak
    re re'16 do sib4 la8 la, si? dod

    %46
    re la' si dod re la si dod
    re dod re dod re do sib si
    do sib la la, sib4 r8 sib\mbreak

    %49
    do do'4 sib8 la fa sib, do
    fa, fa' sib, do fa,4 r8 fa'
    sol la sib4 la dod,

    %52
    re8 dod la si dod4 r
    re8 dod la si dod4 re8 re'16 do?\mbreak
    sib4  r16 sib la sib do4 r8 do16 sib

    %55
    la4 r16 la sol la sib4 r8 sib16 la
    sol4 r dod,4. re8
    dod re sol, la re fa sol fa16 mi

    %58
    fa8 fa sol fa16 mi fa8 fa sol fa16 mi
    fa4 r fa r
    sol do, fa8 re sol la

    %61
    re,4 r16 re' do re sib4 do
    fa,8 re sol, la re4 r

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    <6>4 <4>8 <_+> s4 <6>
    s2 <6>4 <4>8 <_+>
    s4 <6> s s8 <6->
    <5->4 <7>8 <6> <_+>2
    s4 <7>8 <6> <_+>4 <6>8 <6>
    s <_+> <6> <5> s <_+> <6> <5>
    s <6> s <6> s <6> <7> <6>
    s <6>  <6> s s4 s8 <6>
    s8 s4 <4! 2>8 <6>4 <6 5>
    s <6 5> s2
    <_->4 <7>8 <6> <_+>4 <6>
    s8 <6> <_+>4 <6>2
    <_->4 <_+>8 <6+> <6>4 s
    s1*2
    <_->2 <6>
    <6>4 <6 5>8 <_+> s4 <_->
    <6> <_-> s <_->
    <6>2 <6>
    <_-> s4 <6 5>8 <_+>
    s1
    s4 <6 5>8 <_+> s4 <6>
    s8 <6> <6-> <5-> s <6> s <6>
    s <6> <7> <6> s <6> s <6>
    s <6> <6-> <5-> s2
    <6>4 <7>8 <6> s4 <6>
    s <6> s <6>
    s8 <6 5> <4> <3> s2
    <6>4 <4>8 <3> s2
    s1
    s8 <6 5> <_+> <6> s4 <6>
    s2 s4 <7>8 <6>
    s2 s8 <_+> <7> <6>
    <_+>4 <6> s16< _+> s8 <6+>4
    <6>2 s8 <6 5> <4> <_+>
    s4 <6> s16 <_+> s8 <6+>4
    <6>2 s8 <6 5> <4> <_+>
    <6> <6 5> <_+> s s2

    s2 <6>
    <6>4 <4>8 <_+> s4 <6>
    s2 <6>4 <4>8 <_+>
    s4 <6> s s8 <6->
    <5->4 <7>8 <6> <_+>2
    s4 <7>8 <6> <_+>4 <6>8 <6>
    s <_+> <6> <5> s <_+> <6> <5>
    s <6> s <6> s <6> <7> <6>
    s <6>  <6> s s4 s8 <6>
    s8 s4 <4! 2>8 <6>4 <6 5>
    s <6 5> s2
    <_->4 <7>8 <6> <_+>4 <6>
    <_->8 <6> <_+>4 <6>2
    <_->4 <_+>8 <6+> <6>4 s
    s1*2
    <_->2 <6>
    <6>4 <6 5>8 <_+> s4 <_->
    <6> <_-> s <_->
    <6>2 <6>
    <_-> s4 <6 5>8 <_+>
    s1
    s4 <6 5>8 <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 55
    s1*62
    \bar "||"

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIalto = {
    \new Voice = "benedicam"
    <<\IIIalton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}





IVtenoren = \relative do' {

    \autoBeamOff

    R1*3
    fa8 fa fa do fa4 r
    fa8 fa fa do fa4 r

    %6
    r8 fa16 [mi] re8[do16 sib] fa'4. mi8
    fa4 r r2
    do8. sol16 sol4\mbreak sib8 re do8. sib16

    %9
    la4 r fa'8. do16 do4
    mib8 sol fa8. mib16 re4 r
    sib8 sib16 do re8 re re16 re re mib fa8 fa\mbreak

    %12
    fa, fa16 sol la8 la la16 la la sib do8 do
    do16 do do re mi8 mi fa do fa4
    r8 fa16 mi re [do re sib] fa'8 fa4 mi8\mbreak

    %15
    fa4 r r8 fa4 mi8
    fa4 r r2
    R1

    %18
    r4 do8. sib16  la8 fa do' do16 do
    do4 r r8 do mi mi16 mi
    mi4 r8 mi sol4 r\mbreak

    %21
    r mi8 sol do,2~
    do do4 r8 do
    do4. si?8 do2

    %24
    r r8 fa, sib sib16 sib
    sib4 r r8 sib re re16 re
    re4 r8 re fa4 r

    %27
    r re8 la\mbreak re2~
    re re4 r8 re
    re4. dod8 re2

    %30
    R1*4
    fa8 fa fa do fa4 r
    fa8 fa fa do fa4 r

    %36
    r8 fa16 [mi] re8[do16 sib] fa'4. mi8
    fa4 r r2
    do8. sol16 sol4\mbreak sib8 re do8. sib16

    %39
    la4 r fa'8. do16 do4
    mib8 sol fa8. mib16 re4 r
    sib8 sib16 do re8 re re16 re re mib fa8 fa\mbreak

    %42
    fa, fa16 sol la8 la la16 la la sib do8 do
    do16 do do re mi8 mi fa do fa4
    r8 fa16 mi re [do re sib] fa'8 fa4 mi8\mbreak

    %45
    fa4 r r8 fa4 mi8
    fa4 r r2
    R1*2

}

IVtestoIII = \lyricmode {

    Ex -- al -- tabo _ te, ex -- al tabo _ te Do - - mi -- ne, quo -- niam _ su -- sce -- scepisti _ me,

    quo -- niam _ su -- sce -- scepisti _ me, nec de -- lec -- tasti _ i -- nimicos _ _ meos, _

    nec del -- ec -- tasti _ i -- nimicos _ _ meos, _  i -- nimicos _ _ meos _ su -- per me, su -- per me,  - su -- per me, su -- per me.

    Do -- mine _ cla -- mavi _ ad te, cla -- mavi _ ad te, ad te,  et sa -- nas -- ti, sa -- nas -- ti me,

    cla -- mavi _ ad te, cla -- mavi _ ad te, ad te,  et sa -- nas -- ti, sa -- nas -- ti me.

    Ex -- al -- tabo _ te, ex -- al tabo _ te Do - - mi -- ne, quo -- niam _ su -- sce -- scepisti _ me,

    quo -- niam _ su -- sce -- scepisti _ me, nec de -- lec -- tasti _ i -- nimicos _ _ meos, _

    nec del -- ec -- tasti _ i -- nimicos _ _ meos, _  i -- nimicos _ _ meos _ su -- per me, su -- per me,  - su -- per me, su -- per me.

}


IVvlIn = \relative do'' {

    R1
    fa8 fa fa do fa4 r
    fa8 fa fa do re fa4 mi8

    %4
    fa4 r do8 do do mi
    do4 r fa8 fa fa do
    re4 r r2

    %7
    r8 do'16 sib la8 sol16 fa do'4. si8
    do4 r r2
    fa,8 fa fa do fa4 r

    %10
    r2 sib,8 sib16 do re8 re
    re16 re re mib fa8 fa sib, sib16 do re re re mi\mbreak
    fa4 fa,8 fa16 sol la8 la la16 la la sib

    %13
    do8 do do do do do do16 do do do
    fa4 r r2
    do16 do do do fa fa fa fa fa8 sib sol8. sol16

    %16
    la la la sol fa4 r sib16 sib sib la
    sol sol sol fa mi mi mi re do8 fa4 mi8
    fa4 r r do'8. sib16

    %19
    la8 la sol sol16 sol sol4 r
    r8 mi sol sol16 sol sol8 mi sol sol16 sol
    sol4 r r2\mbreak

    %22
    lab,2 sol
    lab4 sol sol4. do8
    la! do fa,4 re r

    %25
    r8 re' fa fa16 fa fa4 r
    r8 re fa fa16 fa fa8 fa sib4
    la r r2

    %28
    sib, la
    sib4 la la8 la re4~
    re dod re2

    %31
    R1\mbreak
    fa8 fa fa do fa4 r
    fa8 fa fa do re fa4 mi8

    %34
    fa4 r do8 do do mi
    do4 r fa8 fa fa do
    re4 r r2

    %37
    r8 do'16 sib la8 sol16 fa do'4. si8
    do4 r r2
    fa,8 fa fa do fa4 r

    %40
    r2 sib,8 sib16 do re8 re
    re16 re re mib fa8 fa sib, sib16 do re re re mi\mbreak
    fa4 fa,8 fa16 sol la8 la la16 la la sib

    %43
    do8 do do do do do do16 do do do
    fa4 r r2
    do16 do do do fa fa fa fa fa8 sib sol8. sol16

    %46
    la la la sol fa4 r sib16 sib sib la
    sol sol sol fa mi mi mi re do8 fa4 mi8
    fa4 r r2

}

IVvlIIn = \relative do'' {

    r2 fa8 fa fa do
    fa4 la la,8 la la mi
    fa4 r8 fa' fa la sol4

    %4
    fa r la,8 la la do
    la4 r la8 la la la
    fa4 r r2\mbreak

    %7
    r4 r8 la' sol fa16 mi fa4
    mi r r2
    la,8 la la fa la4 r

    %10
    r2 r4 sib8 sib16 do
    re8 re re16 re re mib fa8 fa fa16 fa fa sol
    la4 r\mbreak fa,8 fa16 sol la8 la

    %13
    la16 la la fa sol8 sol la la la16 la la la
    la4 r r2
    la16 la la la la la la la re8 re do4

    %16
    do fa16 fa fa mi\mbreak re re re do sib4
    r sol16 sol sol sol la8 la' sol8. sol16
    fa4 r r2

    %19
    r8 do mi mi16 mi mi4 r
    r8 do mi mi16 mi mi8 do mi mi16 mi\mbreak
    mi4 r r sol,~

    %22
    sol fa2 mib4
    re4. re8 mi!8 sol do,4
    do la'8 do fa,4 r

    %25
    r8 sib re re16 re re4 r
    r8 sib re re16 re re8 re re mi\mbreak
    fa4 r r la,~

    %28
    la sol2 fa4
    mi4. mi8 fa4 r8 fa'
    mi2 re

    %31
    r2 fa8 fa fa do
    fa4 la la,8 la la mi
    fa4 r8 fa' fa la sol4

    %34
    fa r la,8 la la do
    la4 r la8 la la la
    fa4 r r2\mbreak

    %37
    r4 r8 la' sol fa16 mi fa4
    mi r r2
    la,8 la la fa la4 r

    %40
    r2 r4 sib8 sib16 do
    re8 re re16 re re mib fa8 fa fa16 fa fa sol
    la4 r\mbreak fa,8 fa16 sol la8 la

    %43
    la16 la la fa sol8 sol la la la16 la la la
    la4 r r2
    la16 la la la la la la la re8 re do4

    %46
    do fa16 fa fa mi\mbreak re re re do sib4
    r sol16 sol sol sol la8 la' sol8. sol16
    fa4 r r2


}

IVbcn = \relative do {

    fa8 fa fa do fa4 la
    fa r fa8 fa fa do
    re re re la sib fa do' do,

    %4
    fa4 r fa'8 fa fa do
    fa4 r re'8 re re la
    sib4 r la8 sol16 fa sol4\mbreak

    %7
    fa4 r8 fa mi re16 do re4
    do8 re mi re16 do re4 mi8 do
    fa4 r fa8 sol la sol16 fa

    %10
    sol4 la8 fa sib4 r
    sib, r sib' r
    fa r fa r\mbreak

    %13
    fa do'16 do do sib la la la sol fa fa fa mi
    re re re do sib8 sib' la16 sol la fa do'8 do,
    fa16 fa fa mi re re re do sib8 sib' do do,\mbreak

    %16
    fa16 fa fa mi re4 sib'16 sib sib la sol sol sol fa
    mi mi mi re do do do sib la sol la fa do'8 do,
    fa4 r r8 fa' mi do

    %19
    fa fa do'8 do16 do do4 r\mbreak
    r8 do, do' do16 do do4 r
    do r mi, r

    %22
    fa2 do
    fa,4 sol do mi
    fa la, sib r

    %25
    r8 sib sib' sib16 sib sib4 r\mbreak
    r8 sib, sib' sib16 sib sib4 sol
    re r fa r

    %28
    sol2 re
    sol,4 la re r8 re
    sol,4 la re2

    %31
    fa8 fa fa do fa4 la
    fa r fa8 fa fa do
    re re re la\mbreak sib fa do' do,

    %34
    fa4 r fa'8 fa fa do
    fa4 r re'8 re re la
    sib4 r la8 sol16 fa sol4\mbreak

    %37
    fa4 r8 fa mi re16 do re4
    do8 re mi re16 do re4 mi8 do
    fa4 r fa8 sol la sol16 fa

    %40
    sol4 la8 fa sib4 r
    sib, r sib' r
    fa r fa r\mbreak

    %43
    fa do'16 do do sib la la la sol fa fa fa mi
    re re re do sib8 sib' la16 sol la fa do'8 do,
    fa16 fa fa mi re re re do sib8 sib' do do,\mbreak

    %46
    fa16 fa fa mi re4 sib'16 sib sib la sol sol sol fa
    mi mi mi re do do do sib la sol la fa do'8 do,
    fa4 r r2

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 s4 <6>
    s1
    s4 s8 <6> <6 5> s <4> <3>
    s1
    s2 s4 s8 <6>
    s2 <6>4 <7 _->8 <6>
    s2 <6>4 <7>8 <6>
    s4 <6> <6-> <6>8 <7->
    s2 s4 <6>
    <6- _-> <6> s2
    s1*2
    s2 <6>
    s <6>4 <4>8 <3>
    s2 s8 <6 5> <4> <3>
    s2 s4 <_->
    <6>2 <6>4 <4>8 <3>

    s2 s4 <6>
    s1*2
    s2 <6>
    <9>4 <8> <5 4> <3 _->
    <_->4 s <_!> <6>
    <_!> <6> s2
    s1
    s2 s4 <_->
    s1
    <_->2 <5 4>4 <3>
    s4 <_+> s2
    <6 5>4 <_+> s2
    s s4 <6>
    s1
    s4 s8 <6> <6 5>4 <4>8 <3>
    s1

    s2 s4 s8 <6>
    s2 <6>4 <7 _->8 <6>
    s2 <6>4 <7>8 <6>
    s4 <6> <6-> <6>8 <7->
    s2 s4 <6>
    <6- _-> <6> s2
    s1*2
    s2 <6>
    s <6>4 <4>8 <3>
    s2 s8 <6 5> <4> <3>
    s2 s4 <_->
    <6>2 <6>4 <4>8 <3>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*17
    \tempo 4 = 55
    s1*13
    \tempo 2 = 50
    s1*18
    \bar "||"

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVtenore = {
    \new Voice = "exaltabo"
    <<\IVtenoren \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}




Vsopranon = \relative do'' {

    \autoBeamOff

    sol4. sol8 sol2
    r si4. si8
    si4 do2 si8 si

    %4
    la[sol] sol4 sol(fad)
    sol r r8 si si si16 si
    mi2 mi4 r8 mi\mbreak

    %7
    mi16[ fa? mi fa] mi [fa mi fa] mi4 mi
    r8 mi do4 r8 si[la sol]
    fa2 mi4 mi'

    %10
    r8 re[do si] do4. do8
    si4 r r8 si si si16 si\mbreak
    mi16[fa mi fa] mi[fa mi re] do[re do re] do[re do re]

    %13
    si8 si r si do[si] la4~
    la sold  la do~
    do8[si la sol] fa[mi do' si]

    %16
    la4. la8\mbreak sold8.[la16 sold8 la]
    si2 r
    R1*3

    %21
    r2 la4 la8 la
    do do16 do do4 si si8 dod
    re re re re re[do16 si] do8[re16 do]\mbreak

    %24
    si8[la16 sold] la2 sold4
    la2 r
    R1

    %27
    mi4 mi8 mi fa fa16 fa fa4
    mi r r mi8 fad
    sol sol sol sol sol[fa16 mi] fa8. [sol16]

    %30
    la4 r\mbreak la4 la8 la
    do do16 do do4 si sol8 la
    si8 si si si si[la16 sol] la8[si16 la]

    %33
    sol8[la16 sol] fad8. fad16 mi4 r
    la4 la8 la\mbreak do8 do16 do do4~
    do8[si16 la] si4 do r

    %36
    r si8 dod re re re re
    re[do16 si] do8[re16 do] sib4. do16[sib]
    la4. sib16[la] sol4. sol8\mbreak

    %39
    fa4 r r do'
    re8 re re re16 re re8[sol,] do4
    si r r2

    %42
    mi4 mi8 mi fa fa16 fa fa4
    mi si8 do re re re re\mbreak
    re[do16 si] do4. si16[la] si8[do16 si]

    %45
    la8[si16 do] re4. re8 do4
    si si8 si do do16 do do4
    si r r2

    %48
    r4 mi,8 fad sold sold sold la\mbreak
    si4. do8 re[do16 si] do8[re16 do]
    si4. si8 la2

}

VtestoI = \lyricmode {

    Do -- mine _ Do -- mi -- ne De -- us sa -- lu -- tis me -- ae in die _ cla -- ma -- vi, cla -- ma - - vi,

    et noc - - te co - - ram te, in die _ cla -- ma - - - - vi, et noc - - te co - - ram te. -

    In -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - - - mi -- ne,

    in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do -- mi -- ne,

    in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - - - mine, _

    in -- tret o -- ra -- tio _ me - a in con -- spectu _ tu -- o Do - - - - - - mi -- ne,

    in -- tret o -- ra -- tio _ me - a, in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - - - - - mi -- ne,

    in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - - - - mi -- ne.

}

Valton = \relative do' {

    \autoBeamOff
    mi4. mi8 mi2
    r sol4. sol8
    sol2 fad4 fad8 fad

    %4
    mi4 re do2
    si8 re re re16 re sol2\mbreak
    sol4 r8 sol sol16 [la sol la] sol[la sol la]

    %7
    sol2 sol4 r8 sol
    mi4. re8 do2~
    do4 si do2

    %10
    sol'2. fad4
    sol8 re re re16 re\mbreak sol[la sol la] sol[la sol fa]
    mi4 mi8 mi la16[si la si] la[si la si]

    %13
    sol8 sol r sol la [sol fa mi]
    re2 do
    mi4. re8 do4 mi~\mbreak

    %16
    mi re mi8.[fad16 mi8 fad]
    sold2 r
    mi4 mi8 mi fa fa16 fa fa4

    %19
    mi mi8 fad sol sol sol sol
    sol[fa16 mi] fa8[sol16 fa]\mbreak mi4. fad8
    sol8[fa?16 mi] re8[mi] fa [sol] la[sol16 fa]

    %22
    mi8. mi16 la4 r2
    r mi4 mi8 mi
    fa fa16 fa fa4 mi r

    %25
    la, la8 la\mbreak do do16 do do4
    si si8 dod re re re re
    re[do16 si] do4. si16[la] si8. si16

    %28
    do4 r8 do16 re mi8 mi mi4
    re r r2\mbreak
    mi4 mi8 mi fa fa16 fa fa4

    %31
    mi mi8 fad sol sol sol sol
    sol[fad16 mi] fad8[sol16 fad] mi2~
    mi4. red8 mi4 r

    %34 OOKK
    r2 mi4 mi8 mi
    fa fa16 fa fa4 mi mi8 fad
    sol sol sol sol sol [fa16 mi] fa8[sol16 fa]

    %37
    mi8[fa16 sol] la4. re,8 sol4~\mbreak
    sol8[do,]fa2 mi4
    fa r mi mi8 mi

    %40
    fa fa16 fa fa4 mi mi8 fad
    sol sol sol sol sol[fa16 mi] fa8[sol16 fa]\mbreak
    mi8[fa16 sol] la8. la16 la4 r

    %43
    mi8 fad sol4. sol8 sol fa?
    mi4. re16[do] re8[mi16 fa] sol4~
    sol8[fa16 mi] fa8[sol16 fa] mi8[fad16 sold] la4~\mbreak

    %46
    la8 sold sold4 r2
    r4 la,8 dod re re re re
    re[do?16 si] do8[re16 do] si8[do16 re] mi8[fad]

    %49
    sold4. la8 si[la16 sold] la4~\mbreak
    la sold la2

}

VtestoII = \lyricmode {

    Do -- mine _ Do -- mi -- ne De -- us sa -- lu -- tis me -- ae in die _ cla -- ma -- vi, cla -- ma - - vi,

    et noc - - - te co -- ram te, in die _ cla -- ma - - vi, cla -- ma - - vi, et noc - te co - - - ram te. -

    In -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - - - - - - - - mi -- ne,

    in -- tret o -- ra -- tio _ me -- a, in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - - -  mi -- ne,

    in con -- spectu _ tu -- o,  in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - -  mi -- ne,

    in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - -  - - - - mi -- ne,

    in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - -  - mi -- ne,

    in con -- spec -- tu tu -- o Do - -  - - - - mi -- ne, in con -- spectu _ tu -- o Do - -  - - - - - mi -- ne.

}

Vtenoren = \relative do' {

    \autoBeamOff
    do4. do8 do2
    r mi4. mi8
    mi2 re4 re8 re

    %4
    do4 si la2
    sol4 r r8 sol sol sol16 sol
    do2 do4 r8 do

    %7
    do16[re do re] do[re do re]\mbreak do4 do
    r8 do la4~la8[si fa re]~
    re2 do4 do'~

    %10
    do8[si la sol] la4. la8
    sol4 r r8 sol sol sol16 sol
    do[re do re] do[re do si] la4 la8 la\mbreak

    %13
    mi'4 mi8 mi do4 re8[do]
    si2 la
    do4. si8 la4. sol8

    %16
    fa4. fa8 mi2~
    mi r
    r la4 la8 la

    %19
    do8 do16 do do4 si si8 dod\mbreak
    re re re re re[do?16 si] do8[re16 do]
    si4. dod8 re[mi] fa[mi16 re]

    %22
    do?4. si16[la] sol8[mi sol la]
    fa16[sol fa mi] re8. re16 la'4 r\mbreak
    r2 mi4 mi8 mi

    %25
    fa fa16 fa fa4 mi mi8 fad
    sol sol sol sol sol[fa?16 mi] fa8[sol16 fa]
    mi8[fa16 sol] la8. la16 re,2

    %28
    la'4 la8 la\mbreak do do16 do do4
    si si8 dod re re re re
    re[dod16 si] dod8. dod16 re4 r

    %31
    r do?8 re mi mi mi mi
    mi[re16 do] re8[mi16 re]\mbreak do4. do8
    si2 mi,4 mi8 mi

    %34
    fa fa16 fa fa4 mi la
    re8 re16 re re4 do r
    R1*3

    %39
    la4 la8 la do do16 do do4~
    do si\mbreak do8.[si16] la4
    mi' si8 dod re re re re

    %42
    re[dod16 si] dod8[re16 dod] re8 la4 si8
    do? [re] mi8. mi16 si2
    do4. do8 sol4 sol\mbreak

    %45
    re' re la4. la8
    mi'2 r4 mi,8 fad
    sol sol sol sol fad8[mi fad sol]

    %48
    la4. la8 mi4 r
    r mi'8 mi\mbreak mi mi la, la
    mi'4. mi8 la,2

}

VtestoIII = \lyricmode {

    Do -- mine _ Do -- mi -- ne De -- us sa -- lu -- tis me -- ae in die _ cla -- ma -- vi, cla -- ma - - vi,

    et noc -- te co - ram te, in die _ cla -- ma - - vi, cla -- ma -- vi, et noc - - te co - - - - ram te.

    In -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - - - - - - - - - - mi -- ne,

    in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - - - mi -- ne,

    in -- tret o -- ra -- tio _ me -- a in con -- spectu _ tu -- o Do - mi -- ne, in con -- spectu _ tu -- o Do - - mi -- ne,

    in -- tret o -- ra -- tio _ me -- a, o -- ra -- tio _ me -- a, in -- tret o -- ra -- tio _ me - - - a

    in con -- spectu _ tu -- o Do - - - - - - mi -- ne, in con -- spec -- tu tu -- o Do -- mi -- ne,

    in con -- spectu _ tu -- o Do - mi -- ne, in con -- spectu _ tu -- o Do -- mi -- ne.

}


VvlIn = \relative do'' {

    sol4 do4. do8 mi mi
    sol sol do4 si r
    r8 mi, sol4 r8 fad si4

    %4
    r8 do, sol'4 r8 la, la'4
    si r r8 si si si16 si\mbreak
    sol16 la sol la sol la sol la sol4 r8 sol

    %7
    sol sol, sol'4 r8 mi sol4
    r8 sol, do4 r r8 do
    fa4 r8 fa, do'4 r8 mi

    %10
    sol4 r r8 la, la'4
    si r\mbreak r8 re, si'4
    r8 mi, do'4 r8 mi, do'4

    %13
    r8 si, sol'4 r8 la, mi'4
    r8 re, si'4 do8 do mi mi
    la la do4 r8 la, la'4

    %16
    r8 la, re4 r8 sold, si4\mbreak
    sold'8. [la16 sold8 la] si2
    R1*3

    %21
    r2 r4 la,
    la8 la do4 mi mi8 mi
    fa fa16 fa fa4 mi4. mi8

    %24
    re4 fa r r8 mi~
    mi re16 do re4\mbreak mi8 fad sol4
    re sol,8 la si do re re

    %27
    sol,4 r r2
    r mi8 fad sol la
    si do re mi la,2~

    %30
    la fa4 r
    R1*2
    r4 si\mbreak si8 si do do16 do

    %34
    la2 mi'8 re do4
    re2 mi8 re do4
    si8 la sol4 re' r

    %37
    R1
    r2 sol,4 sol8 sol
    la la16 la la4 sol r

    %40
    r sol'\mbreak sol8 sol la la16 la
    sol4 r re re8 re
    mi mi16 mi mi4 re r

    %43
    mi mi8 mi sol sol16 sol sol4
    sol mi r2
    r la,4 la8 la\mbreak

    %46
    si8 si16 si si4 la r
    si8 dod re mi la,4. si8
    mi,4 la si si~

    %49
    si mi mi2~
    mi mi

}

VvlIIn = \relative do'' {

    r4 sol do4. do8
    mi4. fad8 sol4 r
    r r8 mi fad4 r8 si,
    mi4 r8 sol, do4 r8 do

    %5
    sol'4 r r8 sol sol sol16 sol\mbreak
    mi fa mi fa mi fa mi fa mi4 r8 mi
    mi mi, mi'4 r8 do mi4

    %8
    r8 mi, la4 r8 mi' la4
    r8  re,, re4 mi r8 do'
    mi4 r8 sol, do4 r8 do

    %11
    sol'4 r\mbreak r8 si, sol'4
    r8 do, mi4 r8 do mi4
    r8 sol, si4 r8 mi la,4

    %14
    r8 si, re4 mi8 mi do'4
    r8 la la'4 r8 do, do4
    r8 fa la,4 r8 mi' sold,4\mbreak

    %17
    mi'8. [fad16 mi8 fad] sold2
    R1*4
    mi,4 mi8 mi sol sol16 sol sol8 mi

    %23
    la4. la8 la4. la8
    fa re4 re'8 si do16 re mi re do si\mbreak
    la2 sol4 sol8 la

    %26
    si4 re8 do si la16 sol la8 la
    mi'4 r r2
    R1

    %29
    r2 re4 re8 re
    mi mi16 mi mi4 la, r
    R1*2

    %33
    r2 r4 mi'~\mbreak
    mi8 re16 do re4 sol, la8 sol
    fa2 sol4 la

    %36
    re, mi8 mi' la,4 r
    R1*2
    r4 do8 re mi mi mi mi

    %40
    re4. re8 mi4 r\mbreak
    si8 do re mi la,4. la8
    sol4 mi8 la la si do re

    %43
    sol,4. la8 si4 re
    sol,8 do do4 r2
    R1

    %46
    r4 mi,4. fad8 sol la
    re,4 r r2\mbreak
    r r4 mi~

    %49
    mi8 mi sold4. si8 la4
    si2 dod

}

Vbcn = \relative do {

    do4. do8 do2
    do'4 la mi4. mi8
    mi2 re

    %4
    do4 si la2
    sol r8 sol' sol sol16 sol
    do2 do4 r8 do

    %7
    do4 do,8 do' do4 do,
    r8 do' la4. sol8 fa mi\mbreak
    re2 do4 do'~

    %10
    do8 si la sol la2
    sol r8 sol sol sol16 sol
    do4. si8 la4 la8 la

    %13
    mi4 mi8 mi' do4 re8 do
    si2 la
    do4. si8 la4. sol8

    %16
    fa2 mi~
    mi1
    \clef tenor mi'4 mi8 mi\clef bass la,4 la8 la

    %19
    do do16 do do4 si si8 dod
    re re re re re do?16 si do4
    si8 si,4 dod8 re mi fa mi16 re

    %22
    do!4. si16 la mi'4 sol8 la\mbreak
    fa16 sol fa mi re4 la'4. la8
    re4 re, mi mi8 mi

    %25
    fa fa16 fa fa4 mi mi8 fad
    sol sol sol sol sol fa?16 mi fa8 sol16 fa
    mi4 la, re2

    %28
    la'4 la8 la do do16 do do4\mbreak
    si4 si8 dod re re re re
    re dod16 si dod4 re re,

    %31
    la' do,?8 re mi mi mi mi
    mi re16 do re8 mi16 re do2
    si mi4 mi8 mi

    %34
    fa fa16 fa fa4 mi la\mbreak
    re,2 do4 la
    sol mi' re4. re8

    %37
    la'4. fa8 sol4. mi8
    fa4. fa,8 sib4 do
    fa la8 la do do16 do do4

    %40
    la si do la
    mi si8 dod re re re re
    re dod16 si dod4 re8 la4 si8

    %43
    do? re mi4 si2
    do4. do8 sol'4 sol,
    re'4. re8 la'4 la,

    %46
    mi'2 la,4 mi'8 fad
    sol sol sol sol sol fad16 mi fad8 sold
    la4 la, mi'2~

    %49
    mi mi4 la,
    mi2 la

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s4 <6+> s2
    s <7 _+>4 <6>
    <6> <6> <7> <6+>
    s1*4
    <7>4 <6> s2
    s <7>4 <6+>
    s1*2
    s2 <6>4 s8 <6>
    <7>4 <6+> s2
    <6> <6>4 s8 <6>
    <7>4 <6> <_+>2
    s1*2
    s2 <6>4 s8 <5>
    <4> <3> s4 <4 2> <3>8 <4+ 2>
    <6>8 s4 <5>8 s4 <6>
    <6> s8 <6> <6>4 <6>8 <_+>  %% fine terza riga bar 22
    <6>4 s <4>4 <3>
    <6> <5> <4> <_+>
    <7> <6> <6> <6>8 <5>
    s2 s4 <6>
    <7>8 <6> s4 <7>4 <6>
    s1
    s4 <6> <4>8 <3> s4
    <5 2>8 <6> <6>4 s2
    s4 <6>8 <_+> s2
    s4 <6 _+> <7> <6>
    <6 4> <5 _+> s <6>
    <7>8 <6> <6>4 <6>2
    <7>4 <6> s <5>8 <6+>
    s4 <5>8 <6+> <4>4 <3>
    <4>4 <3>8 <6> <_->4 s8 <6>
    <9>4 <8> <6 5>2
    s1
    s4 <6> <9>8 <8> <5> <6+>
    s4 <6>8 <5> <4> <3> s4
    <4 2> <6> s8 <6>4 <5>8
    s <_+> s4 <6>2
    <9>4 <8> <4> <3>
    <4> <3> <4> <3>
    <4+>2 s4 <6>8 <5>
    s2 <4 2>8 <6> <6>4
    <4> <3> <_+>2
    s <7 _+>4 s
    <4>4 <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 50
    s1*50
    \bar "|."

}

VvlI = {
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vsoprano = {
    \new Voice = "salutis1"
    <<\Vsopranon \forma>>
}

Valto = {
    \new Voice = "salutis2"
    <<\Valton \forma>>
}

Vtenore = {
    \new Voice = "salutis3"
    <<\Vtenoren \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}


global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller\center-column {"Concerto Sacro VII Op. II"}
        composer = \markup \center-column{"A. Scarlatti (1660 - 1725)"}
    }

    \markup \huge {[1.] Diligam te Domine}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 r1 r r2 do''8.^\markup\center-align "Canto" si'16}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \Isoprano \global
                \new Lyrics \lyricsto "diligam1" \ItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r1 r r r r sold'8 fad'16^\markup\center-align "Alto"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto \global
                \new Lyrics \lyricsto "diligam2" \ItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major \time 4/4 r1 r r r2 do'8. si16^\markup\center-align "Tenore"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \Itenore \global
                \new Lyrics \lyricsto "diligam3" \ItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[2.] Cantabo Domino}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 r8 la'^\markup\center-align "Canto" mi''16[re'' mi'' si']}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIsoprano \global
                \new Lyrics \lyricsto "cantabo" \IItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \pageBreak

    \markup \huge {[3.] Benedicam Dominum}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r1 r2 re'8^\markup\center-align "Alto" fa' mi' sol'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto \global
                \new Lyrics \lyricsto "benedicam" \IIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \pageBreak

    \markup \huge {[4.] Exaltabo te. A tempo giusto}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major \time 4/4 r1 r r fa'8^\markup\center-align "Tenore" fa' fa'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IVtenore \global
                \new Lyrics \lyricsto "exaltabo" \IVtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[5.] Domine Deus salutis meæ}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 sol'4. sol'8^\markup\center-align "Canto"  sol'2}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \Vsoprano \global
                \new Lyrics \lyricsto "salutis1" \VtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 mi'4. mi'8^\markup\center-align "Alto" mi'2}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Valto \global
                \new Lyrics \lyricsto "salutis2" \VtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major \time 4/4 do'4. do'8^\markup\center-align "Tenore" do'2}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \Vtenore \global
                \new Lyrics \lyricsto "salutis3" \VtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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



