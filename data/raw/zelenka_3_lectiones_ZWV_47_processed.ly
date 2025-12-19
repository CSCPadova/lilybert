\language "italiano"
	%********************************** VARIABILI
\version "2.24.0"

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

mbreak = { }



IvlIn = \relative do'' {

    mib,1
    fa~
    fa

    %4
    fa2 mib\mbreak
    sol do~
    do1

    %7
    sib2~sib~
    sib1\mbreak
    sib~

    %10
    sib~
    sib2. do4~
    do8-.(do-. do-. do-.) do-.(do-. do-. do-.)\mbreak

    %13
    fa fa fa fa mi mi mi mi
    sol2 fa~
    fa mib4. re8

    %16
    do2^\markup\italic"ad[agio]" re8 re,-. (re-. re-.)
    re2_\fermata r

}

IvlIIn = \relative do'' {

    do,1
    re
    re~

    %4
    re2 do\mbreak
    mib1
    do2 fa

    %7
    fa1~
    fa\mbreak
    mib2 sol~

    %10
    sol1
    sol
    fa8-.(fa-. fa-. fa-.) fa-.(fa-. fa-. fa-.)\mbreak

    %13
    lab lab lab lab sol sol sol sol
    sol2 lab
    sib1

    %16
    do2^\markup\italic"ad[agio]"  si8 si,-.(si-. si-.)
    si2_\fermata r

}

Ivlan = \relative do' {

    sol1
    fa2 re
    sol1~

    %4
    sol~\mbreak
    sol
    la2~la

    %7
    fa re'~
    re1\mbreak
    sib2 sol~

    %10
    sol mib
    mib' sol
    do,8 do do do la la fa fa\mbreak

    %13
    reb' reb fa fa sol do, do do
    do1
    re?2 sol,

    %16
    lab^\markup\italic"ad[agio]"  sol8-.(sol-. sol-. sol-.)
    sol2_\fermata r

}

Isopranon = \relative do'' {

    \autoBeamOff

    sol4. sol8 do4 do,
    lab'4. lab8 lab8. sol16 sol4
    r sol8 sol re'4 fa,

    %4
    r8 fa lab sol mib4 mib\mbreak
    r sol8 sol mib'4 mib
    r8 mib mib do la?4. sol16 la

    %7
    sib4 sib r8 sib fa' re
    lab4 lab lab8 lab16 lab sib8 fa\mbreak
    sol8 sol r4 sib8 sib16 sib sib8 sol16 lab

    %10
    sib8 sib16 sib r8 sib mib sib16 sib sol8 sib
    sib mib, reb'4~reb8 do do sib
    la!4 la r r8 la\mbreak

    %13
    si4. si8 do4 sol
    r8 sol16 sol do8 sib? lab4 r8 lab
    lab?8. do16 sib8 lab! sol fa16[sol] sol4~

    %16
    sol^\markup\italic"ad[agio]"  fad8. [sol16] sol2
    R1

}

ItestoI = \lyricmode {

    Par -- ce mi -- hi par -- ce Do -- mine, _ ni -- hil e -- nim sunt dies _ me -- i.
    Quid est ho -- mo, qui -- a ma -- gni -- ficas _ e -- um?
    Aut quid ap -- ponis _ er -- ga eum _ cor tu -- um? Vi -- sitas _
    cum  - di -- lu -- culo, _ et su -- bito _ pro -- bas il -- lum.
    Us -- que -- quo non par -- cis non par -- cis mi -- hi, nec di -- mittas _
    me, ut glu -- tiam _ sa -- li -- vam me - am?

}

Ibcn = \relative do {

    do1
    do2 si~
    si1~

    %4
    si2 do\mbreak
    do1
    fa2 mib

    %7
    re1~
    re\mbreak
    mib~

    %10
    mib~
    mib2 mi
    mib!8 mib mib mib mib mib mib mib\mbreak

    %13
    reb reb reb reb do do do do
    mi2 fa
    re mib?

    %16
    lab^\markup\italic"adag[io]"  sol8 -.(sol-. sol-. sol-.)
    sol2\fermata r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6- 4 2>2 <7->4 <6>
    <6>2 <5>
    <6>1
    s
    <7>2 <4! 2>
    <6>1
    <5->
    <5>
    s
    <5>4 <7-> <7-> <6>
    \bassFigureExtendersOn <4! 2>2 <4! 2>4 <4! 2>
    <6!>2 <_!>
    <6> <_->
    <5->s
    <7>4 <6\\> <_!>2

}


forma = {

    \time 4/4
    \key sol\minor
    \tempo 4 = 50
    s1*17
    \bar "||"

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
    \new Voice = "parce"
    <<\Isopranon \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIcln = \relative do'' {

    r4 r sib
    do4.(reb8) do4
    do(sib) sib

    %4
    fa'4 lab,8 sol lab4
    sol4. lab8 sib4~
    sib lab sol

    %7
    sol4. (fa8) fa4
    R2.
    r4 r sib

    %10
    mib4. (reb16 do) sib8.(do32 reb)
    do(sib lab?8.) sol8(lab) si(do)
    fa4. (mib16 re?) do8.(re32 mib)\mbreak

    %13
    re(do sib8.) la!8.[(sib16) la8.(sib16)]
    sol'4.(fa16 mib) re8.(mib32 fa)
    mib re do8. si8.[(do16) si8.(do16)]

    %16
    lab'2.~
    lab?4\fermata r sol~
    sol8 fa fa4.\tr mib8

    %19
    la,!2 (lab4)
    sol8.(fa16) fa4.\tr sol8
    sol4 r sol

    %22
    lab4.(sib8) lab4~
    lab sol8.(lab16) sib4\mbreak
    sib8(lab) sib4 fa'~

    %25
    fa mib8 fa sol4~
    sol fa mib
    mib8. re16 re4 r

    %28
    lab8.(fa16) sol32(fa mib8.) mib'8.(sol,16)
    sol8(fa) fa4 r
    R2.

    %31
    r4 r sol~
    sol8 fa16 sol la8 sib do reb
    mib8.(do16) reb32(do sib8.) sol'8.(sib,16)

    %34
    sib8(la!) la4 r
    R2.
    r4 r la~\mbreak

    %37
    la8 sol16 la sib8(do) re mib
    fa8.(re16) mib32(re do8.) la'!8. (do,16)
    do8(si) si4 r

    %40
    sol sol'8(mib) re(mib)
    fa2 \parenthesize r4
    mib4. fa8 sol4~

    %43
    sol(fa) fa
    fa8.(mib16 ) fa8.(mib16) mib8. (fa16)
    fa2\fermopz r4

    %46
    si, sol' sol
    sol r r
    si, sol' sol

    %49
    sol r \parenthesize r \mbreak
    R2.
    r4 r sib,

    %52
    mib4~mib8(reb16 do) sib8.(do32 reb)
    do(sib lab8.) sol8(lab) si(do)
    fa4.(mib16 re?) do8.(re32 mib)

    %55
    re(do sib8.) la?8.[(sib16) la8.(sib16)]
    sol'4.(fa16 mib) re8.(mib32 fa)
    mib(re do8.) si8.[(do16) si8.(do16)]

    %58
    lab'2.~
    lab4_\fermata r sol~
    sol8(fa) fa4.\tr mib8\mbreak

    %61
    la,!2^\markup\italic"ad libitum"~la8\tr sib
    sib1~
    sib~

    %64
    sib\mbreak
    do
    la

    %67
    sib
    sib2 lab\mbreak
    sol do

    %70
    la? sol8^\markup\italic "andante" sol sol sol
    sol sol sol sol fad fad sol sol
    sol2^\markup\italic"adag[io]" fad

}

IIvlIn = \relative do'' {

    sol4^\markup\italic "Con Sordini" sol sol
    lab4.(sib8) lab4
    lab?(sol) sol

    %4
    sib, sib sib
    sib mib8[fa] sol4~
    sol fa mib

    %7
    mib re2
    la'?8.\p(fa16) sol32(fa mib8.) mib'8.(sol,16)
    sol4. fa8 fa4

    %10
    sol8.(lab?16) sib4 sib
    lab?8. sib16 do4 do
    do do do\mbreak

    %13
    sib8.(do16)  re4 re
    re re re
    do8.(re16) mib4 mib

    %16
    do fa fa
    fa4\fermata r mib4~
    mib fa4.\tr mib8

    %19
    mib,2 fa4
    mib(re4.\tr) mib8
    mib4 sol sol

    %22
    mib mib mib
    mib mib8. \parenthesize (fa16) sol4\mbreak
    r fa fa

    %25
    sol4. (fa8) mib4
    do' do do
    sib sib fa

    %28
    fa8.(re16) mib8.\parenthesize (sol16) do,8.(mib16)
    mib8(re) re4 r
    sib' sib lab

    %31
    sol sol do,
    do do do
    do'8.(la!16) sib8.(sol16) sib8.\parenthesize ( sol16)

    %34
    do,4 do do
    do la' la
    la la re,\mbreak

    %37
    re re re
    re'8.(si16) do8.(la16) do8.(la16)
    re,4 re re

    %40
    mib mib sol
    la sol8 la si4
    do do do

    %43
    do do do
    re sol, do
    re2\fermopz r4

    %46
    re, do fa
    mib8.(fa16) fa8. \parenthesize (sol16) sol4
    re do fa

    %49
    mib8. \parenthesize (fa16) fa8.\parenthesize (sol16)  sol4\mbreak
    R2.*2
    sib8.(la16) sib4 sib

    %53
    lab8.(sib16) do4 do
    do do do
    sib8.(do16) re4 re

    %56
    re re re
    do8.(re16) mib4 mib
    do re re

    %59
    re4\fermata r mib~
    mib re4. mib8\mbreak
    mib,2.

    %62
    fa1~
    fa
    sol\mbreak

    %65
    fa~
    fa~
    fa~

    %68
    fa2 re~\mbreak
    re la
    do  re8^\markup\italic "andante" re re re

    %71
    mi mi mi mi re re re re
    sol,2^\markup\italic "adag[io]"  la

}

IIvlan = \relative do' {

    sib4 sib sib
    mib, mib mib
    mib mib mib

    %4
    sib' fa fa
    mib mib mib
    do' do do

    %7
    sib sib re~
    re mib do8.(mib16)
    mib4.(re8) re4

    %10
    mib mib mib
    mib mib mib
    mib mib fa\mbreak

    %13
    fa fa fa
    fa fa sol
    sol sol sol

    %16
    fa4. sol8(fa mib)
    re4\fermata r sib
    do sib sib

    %19
    do do re
    mib sib sib
    sib sib sib

    %22
    mib mib mib
    mib mib mib\mbreak
    re re re

    %25
    mib mib mib
    lab,? lab la
    sib sib sib

    %28
    sib sib la
    sib sib lab
    sol sol lab?

    %31
    sib sib sol
    fa fa fa
    fa fa mi

    %34
    fa fa fa
    la? la la
    la re re\mbreak

    %37
    sol, sol sol
    sol sol fad
    sol sol sol

    %40
    sol sol mib'
    re sol, sol'
    sol sol do,

    %43
    lab lab lab
    sol fa mib
    re2\fermopz \parenthesize r4

    %46
    sol r si
    do re mib
    sol, r si

    %49
    do re mib\mbreak
    R2.*2
    sol4 mib mib

    %53
    mib mib mib
    mib mib fa
    fa fa fa

    %56
    fa sol sol
    sol sol sol
    do, fa4. mib8

    %59
    re4\fermopz r sib
    do sib4. sib8\mbreak
    la2.

    %62
    re1
    re
    sol,\mbreak

    %65
    do~
    do
    re~

    %68
    re2~re\mbreak
    sol, la~
    la sib8 ^\markup\italic "andante"sib sib sib

    %71
    sol sol dod dod  re re sib sib
    mib2^\markup\italic "adag[io]" re

}

IIsopranon = \relative do'' {

    \autoBeamOff

    R2.*20
    r4 r sib
    do4.(reb8) do4

    %23
    do sib sib\mbreak
    fa'4. lab,8 lab4
    sol lab? sib~

    %26
    sib lab sol
    sol8. fa16 fa4 r
    R2.

    %29
    r4 r sib
    reb2.~
    reb4 do sib

    %32
    lab8.[ sol16] fa4 r
    R2.
    r4 r do'

    %35
    mib2.~
    mib4 re do\mbreak
    sib8[la?] sol4 r

    %38
    R2.
    sol4 re'8[si la si]
    do2.~

    %41
    do4 si8[do] re4~
    re si?8[do] mib4~
    mib reb do

    %44
    si4. si8 do4
    sol2_\fermata r4
    fa' mib re

    %47
    mib si do
    fa mib re
    mib4. si8 do4\mbreak

    %50
    do8 la si2^\markup\italic "ad lib[itum]"
    do4 r r
    R2.*10

    %62
    fa,4 fa r8 sib16 sib sib sib sib do
    re8 re re re16 mib fa8 sib, r sib
    reb8. reb16 reb4 reb8 sib16 do reb8 do\mbreak

    %65
    la!4 la r4 r8fa16 la
    do4 do r8 do mib reb
    sib4 sib r r8 sib

    %68
    fa'4 fa8 re? si4 si\mbreak
    r8 sol si re mib4 mib
    r8 mib re do sib2^\markup\italic "andante"~

    %71
    sib la8 [re,] re'4~
    re8^\markup\italic "ad libitum" do dod8.[re16] re2

}

IItestoI = \lyricmode {

    Pec -- ca - - vi. Quid fa -- ciam _ ti -- bi, o cu -- stos ho -- minum? _

    Pec -- ca -- vi pec -- ca -- vi pec -- ca - vi ti -- bi pec -- ca - vi ti -- bi

    o cu -- stos ho -- minum _ o pec -- ca -- vi ti  - bi o cu -- stos  o ho -- minum _

    pec -- ca -- vi.

    Qua -- re qua -- re po -- su -- i -- sti me con -- tra -- rium _ ti -- bi, et fac -- tus

    sum mi -- himet _ ip -- si gra -- vis?

    Cur non tol -- lis pec -- catum _ me -- um, et qua -- re

    non au -- fers i -- ni -- qui -- ta -- tem i -- ni -- qui -- ta  - - tem me -- am?

}
IIbcn = \relative do {

    mib4\pp mib mib
    mib mib mib
    mib mib mib

    %4
    re re re
    mib mib mib
    lab lab la

    %7
    sib sib, sib
    sib sib la?
    sib sib' lab

    %10
    sol sol sol
    lab lab lab
    la! la la\mbreak

    %13
    sib sib sib
    si si si
    do do do

    %16
    fa,8 mib re mib re do
    sib4_\fermata r mib
    lab sib sib,

    %19
    do do re
    mib sib' sib,
    mib mib mib

    %22
    mib mib mib
    mib mib mib\mbreak
    re re re

    %25
    mib mib mib
    lab? lab la
    sib sib sib

    %28
    sib sib la?
    sib sib lab
    sol sol fa

    %31
    mi mi mi
    fa fa fa
    fa fa mi

    %34
    fa fa fa
    fa fa fa
    fad fad fad\mbreak

    %37
    sol sol sol
    sol sol fad
    sol sol fa?

    %40
    mib mib mib
    re sol sol,
    do do do

    %43
    fa fa lab
    sol fa mib
    sib2_\fermata\parenthesize r4

    %46
    sol r si
    do re mib
    sol, r si

    %49
    do re mib\mbreak
    fa sol2^\markup\italic "adag[io]"
    do,4 do'^\markup\italic "andan[te]" sib8 la

    %52
    sol4 sol sol
    lab lab lab
    la! la la

    %55
    sib sib sib
    si si si
    do do do

    %58
    fa,8 mib re mib re do
    sib4_\fermata r mib
    la sib sib,\mbreak

    %61
    do2.
    sib1
    sib

    %64
    mi\mbreak
    mib?
    mib

    %67
    re
    re2 fa\mbreak
    fa fad~

    %70
    fad sol8^\markup\italic "andante" sol sol sol
    dod, dod dod dod re re sib sib
    mib2^\markup\italic "adag[io]" re

}

IIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2.
    <6 4->2 <6 4->8 s
    <6 4->4 <5 3> s
    <6>2.
    s
    <9 7>4 <8 6> <7 5>
    <6 4> <5 3> s
    <7- 6>8 s <6 4> s <6>4
    <5 3>2 <5 3>4
    <6>2.
    <5>
    <6>
    <5>
    <6>
    s
    <_->4  <5-> s
    <7>2.
    s
    <6!>4 s <5->
    s2.
    s
    <6 4->2 <6 4->8 s
    <6 4>4 <5 3> s
    <6>2.
    s
    <9 7>4 <6 8> <7 5>
    <6 4> <5 3> <5 3>8 s
    <7- 5>4 <6 4>8 s <6>4
    <5 3>2 <5 3>4
    <5->2 <5->4
    <7-> <6> <5>
    <_->2.
    <7 _!>4 <6- 4> <_!>
    s2.
    <7>2 s4
    <7> <6> <5>
    s2.
    <7 _!>4 <6 4>8 s <6> s
    <6 4>4 <5 _!> <5 _!>
    <6>2.
    <7>8 s <7 _!>4 s
    <9> <8> s
    s <6-> <6>
    <5 _!> <5 _!> <6>8 s
    <6 5>2 s4
    <7 _!>4 s <6>
    s <6!> <6>
    <7 _!> s <6>
    s <6!> <6>
    <_!>8 s <_!>2
    s2.
    <6>
    <5>
    <6>
    s
    <6>
    s
    <_->4 <5-> <5->
    <7-> s s
    s2.
    <6!>
    s1
    s
    <7->
    <6 4 2>2 s
    <6 4>2 s
    <6> s
    <6>4 s <6 4! _->4 s
    <6 4! 2>2 <7->
    <7>4 <6> s2
    <7> <_+>4 <6>
    <7> <6\\> <_+>

}


forma = {

    \time 3/4
    \key sol\minor
    \tempo 2 = 47
    s2.*61\break
    \time 4/4
    \tempo 4 = 60
    s1*11
    \bar "||"

}

IIcl= {
    <<\IIcln \forma>>

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvla = {
    \clef alto
    <<\IIvlan \forma>>

}

IIsoprano = {
    \new Voice = "peccavi"
    <<\IIsopranon \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}



IIIcln = \relative do'' {

    fa,8(sib) la(sol) fa(sol) fa(sib)
    do re mib16(re) mib8 mib8.\tr(re16) re4\p~
    re8-.(re-. re-. re-.) do-.(do-. do-. do-.)

    %4
    sib\f re16 mib fa8 fa fa8.(mib16)\appoggiatura mib8 re(re\p)~
    re-.(-. re-. re-. re-.) re-.(do-.) do4
    R1

    %7
    do8(la) sol(fa) sol(fa) fa4
    R1*2
    do'8(fa) mi(re) do(re) do(fa)

    %11
    sib,16(la) sib8 sol8.(la16) la8(re!) do(sib)
    la-.(la-. la-. la-.) la(do) sib(la)
    sib(do) sib re16 do si8(lab') sol(fa)

    %14
    mib8.(re16) do4 r2
    R1
    r2 r4 r8 re

    %17
    <<{re1~
       re8 [sol,]}\\{s2^\p s^\f}>> sol'2\p ~ sol8. mib16\mbreak
    \appoggiatura mib8 re4 r r2

    %20
    sol,8(do) sib(lab) sol(sib) lab sib16 lab
    sol8\p(lab') sol(fa) mi(sol) fa(mi)
    fa4 mi fa2^\markup\italic "adag[io]" ~

    %23
    fa4 mi8 re mi sol,\pp sol sol
    lab(lab) sol(fa) sol2

}

IIIvlIn = \relative do'' {

    re,8^\markup\italic "Con Sordini" sol fa mib re(mib) re[re]
    mib(fa) fa fa  fa sol fa\p mib
    re fa fa fa sol sol fa fa

    %4
    mib sib'16\f do re8[re re8.(sib16)] \grace do8 sib(fad)\p
    sol sol sol sol sol sol sol sol
    fa fa do do re(re) do(la)\mbreak

    %7
    fa' fa do do re re do la
    fa' fa do do fa fa fa fa
    re re sol sol fa fa fa mi

    %10
    fa re' do sib la sib la la
    sol16(fa) sol8 sol8. fa16 fa8 fa fa fa
    fa fa do do do do re re\mbreak

    %13
    re re re re re re re' re
    do do sol sol sol sol la re
    re re re sib sol sol sib sol

    %16
    fad(sol) la fad re sol sol fad
    sib sib sib sib lab lab lab lab
    sol sol do, do re re do sol'\mbreak

    %19
    si, sol' sol si do do do si
    do lab sol fa mi sol fa sol16 fa
    mi8\p fa mi fa sol sol do, do

    %22
    do do do do re^\markup\italic "adag[io]" re re re
    do do do do do mi\pp mi mi
    fa fa mi re mi2

}

IIIvlan = \relative do' {

    sib8-.(sib-. sib-. sib-.) sib-.(sib-. sib-. sib-.)
    sib sib do dod sib sib sib\p sib
    sib sib sib sib sib sib la la

    %4
    sib sib sib sib sib sib sib la
    sol sol16 fad sol8 sib do do, do' sib
    la la la la sib sib la fa\mbreak

    %7
    la la la la sib sib la fa
    la la la la sib sib fa fa
    sol fa mi do fa re' sib do

    %10
    fa,-.(fa-. fa-. fa-.) fa-.(fa-. fa-. fa-.)
    fa fa do' do do fa, fa fa
    mib mib mib mib fad fad fad fad\mbreak

    %13
    sol sol sol sol fa? fa si si
    do re mib do sib sib fad fad
    sol la sib sol do do sol sol

    %16
    la sol fad do sol' sib do re
    sol sol sol sol fa fa fa fa
    mib mib mib mib si4 do\mbreak

    %19
    sol'8 fa mib re do lab' fa sol
    do,-.\p(do-. do-. do-.) do-.(do-. do-. do-.)
    do-.\pp (do-. do-. do-.) do do do do

    %22
    do\pp(do-. do-. do-.) si^\markup\italic "adag[io]" si si si
    do do do do do\pp do do do
    do2 do

}

IIIsopranon = \relative do'' {

    \autoBeamOff

    R1
    r2 fa,8[(sib)] la[(sol)]
    fa4. sib8 mib,4 mib8 mib

    %4
    mib8. re16 re4 r fa8 sol16[la]
    \appoggiatura la8 sib sib sib sol16[fa] mi8. mi16 mi4
    do'8[(la)] sol[(fa)] sol[(fa)] fa4\mbreak

    %7
    R1
    do'8[(la)] sol[(fa)] re'[(sib)] do[(la)]
    sib r do sib la4 sol8.[fa16]

    %10
    fa4 r r2
    r do'8[(fa)] mi[(re)]
    do4. sib8 la[mib'!] re do\mbreak

    %13
    sib8. la16 sol4 r2
    r4 do8 re16[(mib)] re[sib] sol8 do sib16[(la)]
    \appoggiatura la sib8. do16 re4 mib8[(do)] re[(sib)]

    %16
    do la re do sib4 la8.[(sol16)]
    sol4 r si r
    do r fa8[re] mib[do]\mbreak

    %19
    re si do fa mib16[re do8] re4\tr
    do r r2
    sol8^\p [do] sib[lab] sol[sib] lab[sol]

    %22
    lab8. lab16 sol4 lab2^\markup\italic "adag[io]"~
    lab4 sol8[fa] sol2
    R1

}

IIItestoI = \lyricmode {

    Ec -- ce nunc in pul -- vere _ dor -- miam; _ et si ma -- ne me que -- si -- eris, _

    non sub -- si -- stam, non sub -- si -- stam, non non non sub -- si -- stam.

    Ec -- ce nunc in pul -- vere _ dor -- miam; _ et si ma -- ne me que -- si -- eris, _

    non sub -- si -- stam, non non sub -- si -- stam, non non non

    sub -- si -- stam, non non sub -- si -- stam.

    Ec -- ce nunc in pul -- vere _ dor -- miam.

}

IIIbcn = \relative do {

    sib8-.\pp(sib-. sib-. sib-.)  sib-.(sib-. sib-. sib-.)
    sib-.(sib-. la-. la-.)  sib-.(sib-. sib-. sib-.)
    sib sib sib sib sib sib la la

    %4
    sib sib sib sib sib sib sib la
    sol sol'16 fad sol8 sib do do, do' sib
    la la la la sib sib la fa\mbreak

    %7
    la la la la sib sib la fa
    la la la la sib sib fa fa
    sol fa mi do fa re sib do

    %10
    fa,-.(fa-. fa-. fa-.) fa-.(fa-. fa-. fa-.)
    fa' fa mi mi fa fa fa fa
    fa fa fa fa fad fad fad fad\mbreak

    %13
    sol sol sol sol fa? fa si, si
    do re mib do sib? sib' la fad
    sol la sib sol do do sol sol

    %16
    la sol fad re sol sib, do re
    sol sol sol sol fa fa fa fa
    mib mib mib mib si4 do\mbreak

    %19
    sol'8 fa mib re do lab' fa sol
    do,-.\p(do-. do-. do-.) do-.(do-. do-. do-.)
    do-.\pp (do-. do-. do-.) do do do do

    %22
    do\pp(do-. do-. do-.) si^\markup\italic "adag[io]" si si si
    do do do do do\pp do do do
    do2 do

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <4 2>4 <6> s2
    s <4 2>4 <6>
    s2 s4 s8 <6\\>
    s2 <_!>
    <6> <6>4 <6>
    <6>2 <6>4 <6>
    <6>2 <6>
    s1
    s
    <4 2>4 <6> s2
    s <5>4 <6>
    s2 <4! 2>4 <6>
    s2 <6>4 <6>
    s1
    <6\\>4 s8 <_+> s4 s8 <_+>
    s2 <6 4! _->
    <6> <6>
    <_!>4 <6>8 <6!> s4 s8 <_!>
    <_!>2 s4 <6- 4>
    s2 s4 <6 4>8 <5- 3>
    <6- 4>4 <5 _!> <7->2
    <6 4>4 <5 _!>8 <4 2> s8 <5 _!> s4
    <6- 4> <5 _!>8 <4 2> <5 _!>2

}


forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 50
    s1*24
    \bar "|."

}

IIIcl = {
    <<\IIIcln \forma>>

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}

IIIsoprano = {
    \new Voice = "ecce"
    <<\IIIsopranon \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}




IVvlIn = \relative do'' {

    la1
    la
    sib8 sib sib sib re re re re

    %4
    re1\mbreak
    mi2 do
    sib do8 do do do

    %7
    do2 re
    fa mi4(lab)\mbreak
    lab8(sol) fa(mi) re4.\tr re8

    %10
    do do do do do2~
    do1~
    do2 fa

    %13
    fa1~\mbreak
    fa2 re
    mi do

    %16
    do sib8 sib sib sib
    sib sib sib do do sib sib la
    sib2 r

}

IVvlIIn = \relative do'' {

    mib,1~
    mib
    re8 sol sol sol sib sib sib sib

    %4
    sol2 si\mbreak
    do2~do
    sol la8 la la la

    %7
    la2 si
    re sol,4 fa\mbreak
    re do la'! sol

    %10
    sol8 sol sol sol sol2~
    sol fa
    lab2. do4

    %13
    sib1~\mbreak
    sib2 lab
    sol la?

    %16
    sol sib8 fa fa fa
    sol sol sol sol fa fa sol fa
    re2 r

}

IVvlan = \relative do' {

    do1
    do
    sib8 sib sib sib sol sol' sol sol

    %4
    sol1\mbreak
    sol~
    sol2 fa8 fa fa fa~

    %7
    fa2~fa
    si, do\mbreak
    sol4 lab fad sol

    %10
    sol8 sol sib sib sib2
    sib lab
    do1

    %13
    re\mbreak
    re2~re
    sol, mib'~

    %16
    mib re
    mib fa8 re mib do
    re2 r

}

IVtenoren = \relative do' {

    \autoBeamOff

    r4 mib2 do4
    do la_\fermata la8 la16 la do8 sib
    sol4 sol r4 r8 re'

    %4
    si si16 si si8 do re re fa fa16 mi\mbreak
    do8 do r sol16 sol sol8 do do do
    reb8 reb16 reb reb8 do16 sib la4 la

    %7
    r4 do8 do fa4 si,
    r4 si8 re mi4 reb8 do\mbreak
    si si do2 si4

    %10
    do r sol8 sol16 sol do8 do
    r sib?16 sib do8. sib16 sib8. lab16 lab4
    r do8 do lab lab lab sol16 fa

    %13
    sib8 sib r sib16 do re8 re fa re\mbreak
    lab?4 r8 lab lab4. sol16 fa
    mib4 mib'8 do la?8. la16 la8 sib

    %16
    do do r do16 do fa8. sib,16 sib4
    r sol8 sib la sib sib fa16 fa
    R1

}

IVtestoIII = \lyricmode {

    Tæ -- det tæ -- det a -- nimam _  vi -- tæ me -- æ

    di -- mit -- tam ad -- ver -- sum me e -- lo -- quium _ me -- um,

    lo -- quar in a -- mari - tu -- dine _  a -- nimæ _ me -- æ.

    Di -- cam De -- o: No -- li no -- li me con -- dem -- na - re: in -- dica _ mihi, _

    quid me i -- ta iu -- dices. _ Num -- quid bo -- num ti -- bi vi -- de -- tur

    ut ca -- lum -- ni -- e -- ris me et op -- primas _ me o -- pus ma -- nuum _ tu -- arum _

    et con -- si -- lium _ im -- pi -- orum _ ad -- iuves? _

}

IVbcn = \relative do {

    fad1
    fad?
    sol8 sol sol sol sol sol sol sol

    %4
    fa1\mbreak
    mib
    mi!2 mib8 mib mib mib

    %7
    mib?2 re~
    re do4 fa\mbreak
    sol lab fad sol8[fad]

    %10
    mi!8 mi mi mi mi2~
    mi fa
    fa1

    %13
    re\mbreak
    re2 si
    do mib~

    %16
    mib re
    mib2 fa8 re mib fa
    sib,2 r

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <7- 5 3>1
    s
    s
    <4! 2>
    s1*4
    <_!>2 <5>4 <_!>
    s1*5
    <_->2 <4! 2>
    s <6>
    <5>4 <6>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 55
    s1*18
    \bar "||"

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
IVtenore = {
    \new Voice = "animam"
    <<\IVtenoren \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}




VobIn = \relative do'' {

    r2 re4(do) re2
    mib2.(re4) mib2~
    mib fa4.(mib8) fa4.(mib8)

    %4
    re4. (do8) re1~
    re2 do sib
    sib la4.(sib8) do2

    %7
    r sib4.(do8) re2
    r do4.(re8) mib2~
    mib re do

    %10
    sib4 do la2. sol4
    sol2 sol'4.(la8) sib2~
    sib lab sol

    %13
    fad2. fad4 sol2~
    sol4 la fad2.\tr sol4
    sol2 r r

    %16
    R1.*2
    r2 sib,1\solo~
    sib2 la sol

    %20
    sol fad4(sol) la2~
    la sol la
    sol1.

    %23
    fad2 la4.(sib8) do2
    r sib4.(do8) re2
    r do4. re8 mib2~

    %26
    mib re do
    sib4 la sib2 r
    R1.*5

    %33
    r2 re4.(mib8) fa2
    r mib4.(fa8) sol2
    r fa4 sol lab2~

    %36
    lab sol fa
    mib4.(re8) mib2 r
    r do4.(re8) mib2

    %39
    R1.*3
    r2 do4.(re8) mib2
    r re4.(mib8) fa2

    %44
    r mib4. fa8 sol2~
    sol fa mib
    re4(do) re1~

    %47
    re2 do sib
    la4(sol) la(sib) do(la)
    sib2 re4.(mib?8) fa2

    %50
    sol, la2. sib4
    sib2 re4.(mib8) fa2
    r r sib,\solo\mbreak

    %53
    mib2. re4 (do sib)
    la sol la sib do la
    re1 sol2~

    %56
    sol fad4 sol la2~
    la sol1~
    sol4 fad sol2.\tr fad4

    %59
    fad2 la,4.(sib8) do2
    r sib4.(do8) re2
    r do4.(re8) mib2~

    %62
    mib re do
    sib4.(la8) sib2  sib'\p~
    sib4(sol) sol(mib?) mib(sol)\mbreak

    %65
    lab1.~
    lab4(fa) fa(re) re(fa)
    sol1.~

    %68
    sol4 mib mib(do) do(sol')
    fad(re) fad(sol) la2~
    la sol4 fad sol2~

    %71
    sol sol,2.\tr sol4
    fad2 la4.(sib8) do2
    r sib4.(do8) re2

    %74
    r do4.(re8) mib2~
    mib re do
    sib la4(sib) sol2~\mbreak

    %77
    sol mib'4 re do sib
    la2 r re
    re1.\f~

    %80
    re2 sib4.(do8) re2
    si4.(do8) re2 r
    r mib4.\p(fa8) sol2~

    %83
    sol4(fad) sol(sib) la(sol)
    fad2 sol4.\f (sol8)la2
    R1.*3

    %88
    r2 re,4.(mib8) fa2
    r mib4.(fa8) sol2
    r fa4.\parenthesize (sol8) lab2~

    %91
    lab sol fa
    mib?4 re mib2  r
    R1.*2

    %95
    r2 sol4\solo fa mib re
    mib1.~
    mib2 re do

    %98
    sib1.
    sib4(do) la2. sol4\mbreak
    sol2

}

VobIIn = \relative do'' {

    r2 sib4(la) sib2
    do2. sib4 do2~
    do re4.(do8) re4.(do8)

    %4
    sib4.(la8) sib1~\mbreak
    sib2 la sol
    sol fad4.(sol8) la2

    %7
    r sol4.(la8) sib2
    r la4.(sib8) do2~
    do sib la

    %10
    sol4 la fad2. sol4
    sol2 sib4.(do8) re2~
    re do do

    %13
    do2. do4 sib2~
    sib4 do la2.\tr sol4
    sol2 r r

    %16
    R1.*7
    r2 fad4.(sol8) la2
    r sol4.(la8) sib2

    %25
    r la4. sib8 do2~
    do sib la
    sol4 fad sol2 r

    %28
    R1.*5
    r2 si4.(do8) re2
    r do4.(re8) mib2

    %35
    r re4 mib fa2~
    fa mib re
    do4.\parenthesize (si8) do2 r

    %38
    r la4.(sib?8) do2
    R1.*3
    r2 la4.(sib8) do2

    %43
    r sib4.(do8) re2
    r do4.(re8) mib2~
    mib re do

    %46
    sib4(la) sib2 r
    R1.*2
    r2 sib4.(do8) re2

    %50
    R1.
    r2 sib4.(do8) re2
    R1.*7

    %59
    r2 fad,4.(sol8) la2
    r sol4.(la8) sib2
    r la4.(sib8) do2~

    %62
    do sib la
    sol4.(fad8) sol2 r
    r r do~\mbreak

    %65
    do4(lab?) lab(fa?) fa(lab)
    sib1.~
    sib4 sol sol mib mib sol

    %68
    la!1.~
    la4 (fad) la re, re fad
    sol2 re' sib

    %71
    mib4 re do2 sol
    la fad4.\parenthesize (sol8) la2
    r sol4.(la8) sib2

    %74
    R1.*4
    r2 r sol\p
    la la la

    %80
    sol sol4.(la8) sib2
    sol4.(la8) si2 r
    r do4.\p(re8) do2

    %83
    dod4.(re8) mi!2 mi
    la, la4.\f(sib8) do2
    R1.*3

    %88
    r2 si4.(do8) re2
    r do4.(re8) mib2
    r re4.(mib?8) fa2\parenthesize ~

    %91
    fa mib re
    do4 si do2 r
    R1.*7

    %100
    r2

}

VvlIn = \relative do'' {

    sol'2 sol sol
    do, do do
    fa fa fa

    %4
    sib, sib la\mbreak
    sol do dod
    re re r

    %7
    re re r
    re re r
    fad fad fad

    %10
    sol4 do, re2 re,
    sol sol r
    do do do

    %13
    re re' sol,
    do, re re,
    sol2 sol' sol

    %16
    do, do do\mbreak
    fa fa fa
    sib, sib la

    %19
    sol do dod
    re re re
    sol sol fa

    %22
    mib? mib mib
    re re r
    re re r

    %25
    re re r
    fad fad fad
    sol sol sol

    %28
    fa? fa fa\mbreak
    fa fa fa
    mib mib mib

    %31
    si si si
    do si? lab'
    sol sol r

    %34
    sol sol r
    sol sol r
    si, si si

    %37
    do do mib?
    fa fa mib?
    re mib? re

    %40
    do la sib?
    sib mib?1^\markup\italic\center-align "ad lib[itum]"
    fa2 fa r

    %43
    fa fa r
    fa fa r
    la la la

    %46
    sib sib sib
    mib,? mib mi
    fa fa fa

    %49
    sib, sib r
    mib? fa fa,
    sib sib sib

    %52
    mib? mib mib\mbreak
    do do do
    re re do

    %55
    sib sib sib
    la re fad
    sol sol fad?

    %58
    mib mib mib
    re re r
    re re r

    %61
    re re r
    fad fad fad
    sol sol sol

    %64
    do, do do\mbreak
    fa fa fa
    sib, sib sib

    %67
    mib mib mib
    la, la la
    re re re

    %70
    sol, sol sol
    do do dod
    re re r

    %73
    re re r
    re re r
    fad fad fad

    %76
    sol la sib!\mbreak
    do, do do
    do2. do4 sib2

    %79
    fad fad' fad
    sol sol sol
    fa? fa fa

    %82
    mib mib mib
    mi! mi mi
    re re re

    %85
    sol fa mib
    re fad sol
    do, re re,\mbreak

    %88
    sol' sol r
    sol sol r
    sol sol r

    %91
    si, si si
    do do si?
    la la' sol

    %94
    fad re fad
    sol sol, sol'
    do, do do

    %97
    re re re
    sol sol dod,
    re1. ^\markup \italic "ad libitum"\mbreak

    %100
    sol,2

}

Vvlan = \relative do' {

    sol'2 sol sol
    do, do do
    fa fa fa

    %4
    sib, sib la\mbreak
    sol do dod
    re re r

    %7
    re re r
    re re r
    fad fad fad

    %10
    sol4 do, re2 re,
    sol sol r
    do do do

    %13
    re re' sol,
    do, re re,
    sol2 sol' sol

    %16
    do, do do\mbreak
    fa fa fa
    sib, sib la

    %19
    sol do dod
    re re re
    sol sol fa

    %22
    mib? mib mib
    re re r
    re re r

    %25
    re re r
    fad fad fad
    sol sol sol

    %28
    fa? fa fa\mbreak
    fa fa fa
    mib mib mib

    %31
    si si si
    do si? lab'
    sol sol r

    %34
    sol sol r
    sol sol r
    si, si si

    %37
    do do mib?
    fa fa mib?
    re mib? re

    %40
    do la sib?
    sib mib?1^\markup\italic\center-align "ad lib[itum]"
    fa2 fa r

    %43
    fa fa r
    fa fa r
    la la la

    %46
    sib sib sib
    mib,? mib mi
    fa fa fa

    %49
    sib, sib r
    mib? fa fa,
    sib sib sib

    %52
    mib? mib mib\mbreak
    do do do
    re re do

    %55
    sib sib sib
    la re fad
    sol sol fad?

    %58
    mib mib mib
    re re r
    re re r

    %61
    re re r
    fad fad fad
    sol sol sol

    %64
    do, do do\mbreak
    fa fa fa
    sib, sib sib

    %67
    mib mib mib
    la, la la
    re re re

    %70
    sol, sol sol
    do do dod
    re re r

    %73
    re re r
    re re r
    fad fad fad

    %76
    sol la sib!\mbreak
    do, do do
    do2. do4 sib2

    %79
    fad fad' fad
    sol sol sol
    fa? fa fa

    %82
    mib mib mib
    mi! mi mi
    re re re

    %85
    sol fa mib
    re fad sol
    do, re re,\mbreak

    %88
    sol' sol r
    sol sol r
    sol sol r

    %91
    si, si si
    do do si?
    la la' sol

    %94
    fad re fad
    sol sol, sol'
    do, do do

    %97
    re re re
    sol sol dod,
    re1. ^\markup \italic "ad libitum"\mbreak

    %100
    sol,2

}

Vtenoren = \relative do' {

    \autoBeamOff

    r2 r1
    R1.*13
    r2 re sol,
    mib'2. re4 mib2\mbreak

    %17
    mib fa4 mib re do
    \appoggiatura do re2 r re~
    re do sib

    %20
    sib la4 \parenthesize (sib) do2~
    do sib4 do re2~
    re4 (mib?) do2. re4

    %23
    re1 r2
    R1.*4
    r2 re si\mbreak

    %29
    sol sol (si)
    do do2. \tr \parenthesize (si8[do])
    re2. do4 re2

    %32
    mib re do
    si4 \parenthesize (la) sol2 r
    R1.*3

    %37
    sol2 do sib
    la4 \parenthesize (sol) la2 r
    sib do sib

    %40
    mib1 re2\mbreak
    re4.(sib8) re2. ^\markup\italic\center-align "ad lib[itum]" do4
    do2 r do

    %43
    fa1.~
    fa
    fa,1 r2

    %46
    r r fa'~
    fa mib re
    do4(sib) do(re) mib(do)

    %49
    re1.
    do2 do1
    sib2 re sib

    %52
    sol4 \parenthesize (fad) sol1\mbreak
    la2 do4 sib\parenthesize (la sol)
    fad mi? fad sol la fad

    %55
    sol fad sol sib la sol
    do sib la re do re
    sib2 do re~

    %58
    re4 mib? do2. re4
    re2  r r
    R1.*3

    %63
    r2 r re
    mib4 \parenthesize (re) mib1~\mbreak
    mib2 fa mib

    %66
    re4 \parenthesize (do) re2 r
    re2. mib4 re2
    do4 si do1~

    %69
    do2 re do
    sib4 \parenthesize (la) sib1~
    sib2 do sib

    %72
    la4 \parenthesize (sol) la2 r
    r re re
    re do4 \parenthesize (si) do2~

    %75
    do sib? la
    sib do (re)\mbreak
    mib4\parenthesize  (re) do \parenthesize (sib) la \parenthesize (sol)

    %78
    fad2. fad4 sol2
    r  la la
    sib4 \parenthesize (la) sib2 r

    %81
    r si si
    do4 \parenthesize (si) do2 r
    r dod dod

    %84
    re2.(do4) sib(la)
    sib2 la4 \parenthesize (sib) do2~
    do sib4 la sib2~

    %87
    sib4 do la2. sol4\mbreak
    sol1 r2
    R1.*3

    %92
    r2 sol sol
    do la4 \parenthesize (sib) do2~
    do re4 \parenthesize (do) sib \parenthesize (la)

    %95
    sib1.~
    sib2 lab(sol)
    fad sol la?~

    %98
    la sol4 \parenthesize (fad) sol2
    sol4^\markup\italic"ad lib[itum]" \parenthesize (la) fad2. sol4\mbreak
    sol2

}

VtestoIII = \lyricmode {

    Num -- quid o -- culi _ car -- nei _ ti -- bi sunt: aut

    si -- cut vi -- det ho -- mo, et tu vi -- de -- bis?

    Num -- quid si -- cut di -- es ho -- minis _ sunt di -- es tu -- i, et an -- ni tu -- i

    si -- cut hu -- ma -- na sunt tem -- po -- ra, ut quae -- ras

    i -- ni -- qui -- ta - - - tem me -- am, et pec -- ca -- tum me -- um

    scru -- te - - - - - - - - - - - - - - - - - - - - - - - ris?

    Et sci -- as qui -- a ni -- hil im -- pium _ fe -- ce -- rim, cum sit ne -- mo

    qui de ma -- nu qui de ma -- nu de ma -- nu tu -- a pos -- sit e -- ru -- ere, _

    cum sit ne -- mo qui de ma -- nu qui de ma -- nu tu -- a pos - - sit e -- ru -- e -- re.

    Cum sit ne -- mo - qui de ma -- nu  tu -- a pos -- sit e - ru -- e -- re.

}

Vbcn = \relative do {

    sol'2_\markup\italic "Senza Violone e Violoncello" sol sol
    do, do do
    fa fa fa

    %4
    sib, sib la\mbreak
    sol do dod
    re re r

    %7
    re re r
    re re r
    fad fad fad

    %10
    sol4 do, re2 re,
    sol sol r
    do do do

    %13
    re re' sol,
    do, re re,
    sol2\breathe \set Staff.midiInstrument = #"church organ" sol'_\markup\italic "Senza Fagotto" sol

    %16
    do, do do\mbreak
    fa fa fa
    sib, sib la

    %19
    sol do dod
    re re re
    sol sol fa

    %22
    mib? mib mib
    \set Staff.midiInstrument = #"bassoon" re_\markup\italic"Fagotto e Organo" re r
    re re r

    %25
    re re r
    fad fad fad
    sol sol sol

    %28
    fa? fa fa\mbreak
    fa fa fa
    mib mib mib

    %31
    si si si
    do si? lab'
    sol sol r

    %34
    sol sol r
    sol sol r
    si, si si

    %37
    do do mib?
    fa fa mib?
    re mib? re

    %40
    do la sib?
    sib mib?1^\markup\italic\center-align "ad lib[itum]"
    fa2 fa r

    %43
    fa fa r
    fa fa r
    la la la

    %46
    sib sib sib
    mib,? mib mi
    fa fa fa

    %49
    sib, sib r
    mib? fa fa,
    sib sib sib

    %52
    mib? mib mib\mbreak
    do do do
    re re do

    %55
    sib sib sib
    la re fad
    sol sol fad?

    %58
    mib mib mib
    re re r
    re re r

    %61
    re re r
    fad fad fad
    sol sol sol

    %64
    do, do do\mbreak
    fa fa fa
    sib, sib sib

    %67
    mib mib mib
    la, la la
    re re re

    %70
    sol, sol sol
    do do dod
    re re r

    %73
    re re r
    re re r
    fad fad fad

    %76
    sol la sib!\mbreak
    do, do do
    do2. do4 sib2

    %79
    fad fad' fad
    sol sol sol
    fa? fa fa

    %82
    mib mib mib
    mi! mi mi
    re re re

    %85
    sol fa mib
    re fad sol
    do, re re,\mbreak

    %88
    sol' sol r
    sol sol r
    sol sol r

    %91
    si, si si
    do do si?
    la la' sol

    %94
    fad re fad
    sol sol, sol'
    do, do do

    %97
    re re re
    sol sol dod,
    re1. ^\markup \italic "ad libitum"\mbreak

    %100
    sol,2

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*2
    <7>1.
    s
    s2 <_-> <7>
    <6 4> <5 _+> s
    <5 _+> <6 4> s
    <6 4> <5 _+> s
    <7>1.
    s2 <_+> s
    s1.
    <9 7>2 <9 6-> <7 6>
    <7 _+> s s
    <_-> <_+> s
    s1.
    <_->
    <7->
    \bassFigureExtendersOn <5 3>1 <5 3>2
    s <_-> <7>
    <6 4> <5 _+> <7>
    <9 4> <8 3> <6>
    <7> <6> s
    <_+> s s
    <5 _+> <6 4> s
    <6 4> <5 _+> s
    <7> <6> <5>
    s1.
    s2 s <4!>4 s
    <4!>1 <4!>2
    <6> s s
    <6> s s
    <_->1.
    <_!>1 s2
    <5 _!>2 <6- 4> s
    <6- 4> <5 _!> s \bassFigureExtendersOff
    <7> <6> <5>
    s s <6 5>
    s s <4>
    <6> <6> s
    <_-> <5-> s
    s2 <7>1
    <5 3>1.
    <5 3>2 <6 4> s
    <6- 4> <5 3> s
    <7> <6> <5>
     <5>1.
     <9 7>2 <8 6> <7 5>
     s1.
     s
     <6>
     s
     s\bassFigureExtendersOn
     <6>2 <6> <6>
     <_+> s <4>
     <6> s s
     <7> <_+> s
     <9> <8> <6>
     <7> <6> s
     <_+> s s
     <_+> <6 4> s
     <6 4> <5 _+> s
     <7> <6> <5>
     s1.
     <7->1 s2
     <7-> s s <7> s s
     <7> s s
     <7> s s
     <7 _+> s s
     <9>1.
     <_->2 s <7>
     <_+> s s
     <5 _+> <6 4> s
     <6 4> <5 _+> s
     <7> <6> <5>
     s <6\\> <6>
     <_-> s s
     <4\+ 2> s <6>4 s
     <6>1.
     s
     <4!>
     <6>
     <6\\>
     <_+>
     s2 <6>4 s <6>2
     <7 _+> s s
     <7-> <_+> s
     <_!> s s
     <_!> <6- 4> s
     <6- 4> <_!> s
     <7> <6> <5>
     s s <6>
     <6\\> <6\\> <4>
     s1.*2
     <_- 7>2 <6-> <5>
     <9 _+> <8> <7>
     s s <7>
     <6 4>2 <5 _+>1

}


forma = {

    \time 3/2
    \key fa\major
    \tempo 1 = 57
    s2  \bar ".|:" s1
    s1.*98
    s2
    \bar ":|."

}

VobI = {
    <<\VobIn \forma>>

}

VobII = {
    <<\VobIIn \forma>>

}

VvlI = {
    <<\VvlIn \forma>>

}

Vvla = {
    \clef alto
    <<\Vvlan \forma>>

}

Vtenore = {
    \new Voice = "oculi"
    <<\Vtenoren \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}




VIvlIn = \relative do'' {

    fa,8 fa fa fa sol sol sol sol
    fa fa fa fa mib mib mib mib
    re re re re fa fa fa fa

    %4
    fa fa fa fa sol sol sol sol\mbreak
    sol sol mib mib mib mib mib mib
    re fa fa fa sol do do do

    %7
    do do do do do do do do
    do do do la fa fa fa do'\mbreak
    do do do do do do do do

    %10
    do sib la re re re re re
    re re re re do do do do
    do do do do re re do do\mbreak

    %13
    sib re re re re re re re
    fa fa fa fa sol sol sol sol
    sol sol sol sol fa fa fa fa

    %16
    sol sol sol sol sol4^\markup\italic "adag[io]" r8 fad\mbreak
    fad la,\pp la la sib sib do do
    do do sib sib sib sib sib sib

    %19
    sib^\markup\italic "adag[io]" sib la sol la2_\fermata

}

VIvlIIn = \relative do'' {

    re,8 re re re mib mib mib mib
    mib mib re re re re do do
    sib sib sib sib re re re re

    %4
    re re re re mib mib mib mib\mbreak
    mib mib mib mib do do do do
    sib re re re do do sol' sol

    %7
    mi mi mi mi sol sol sol sol
    la la la fa fa do la' la\mbreak
    la la la la la la la la

    %10
    la sol fad fad sol sol sol sol
    sol sol sol sol sol sol sol sol
    fa? fa fa fa fa fa fa fa

    %13
    fa fa fa fa fa fa sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib do do do re re

    %16
    re re sib sib sol4 r8 la\mbreak
    la fad\parenthesize \pp fad fad sol sol la la
    fad fad sol sol sol sol sol sol

    %19
    sol sol fad mi? fad2_\fermata

}

VIvlan = \relative do' {

    sib8 sib sib sib sib sib sib sib
    sib sib sib sib sib sib la la
    sib sib sib sib sib sib sib sib

    %4
    sib sib sib sib sib sib sib sib\mbreak
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %7
    sib sib sib sib sib sib sib sib
    la la la la la la la la\mbreak
    mib'! mib mib mib re re re re

    %10
    re re re re sol sol sol sol
    fa fa fa fa mi! mi mi mi
    mib! mib mib mib re sib fa' mib\mbreak

    %13
    re re re re re re re re
    re re re re mib? mib mib mib
    mi mi mi mi fa mi re do

    %16
    sib sib sol sol mib'?2\mbreak
    re8 re re re re re fad fad
    la la sol sol fa! fa fa fa

    %19
    re re re re re2\fermopz

}

VIbasson = \relative do {

    \autoBeamOff

    R1*2
    sib'4. fa8 re4 sib8 fa'
    lab4. lab8 sol4 r\mbreak

    %5
    r8 sol sol sol lab?4. sol16 lab
    \appoggiatura la sib8. sib16 sib8 sol \appoggiatura fa mi8. mi16 mi4
    r8 sol do sol mi fa16 sol mi8 re16 do

    %8
    fa4 r8 fa do'4. lab?8\mbreak
    fad4 fad r8 fad fad sol
    la?8 re, do' sib16 la \appoggiatura la8 sib4 r8 sib16 re

    %11
    \appoggiatura do8 si8. si16 si8 si do do r sol16 do
    \appoggiatura sib16 la8. la16 la8 la sib4(la8.) sib16\mbreak
    sib4 r sib8 fa fa sol

    %14
    lab lab sib lab \appoggiatura lab sol4 r8 sol
    do do do8. sib16 lab?8 lab sib[(do)]
    re sol, re'2^\markup\italic "ad lib[itum]" dod8. [re16]

    %17
    re,4 r r2
    R1*2

}

VItestoIV = \lyricmode {

    Ma -- nus tu -- ae fe -- ce -- runt me, et plas -- ma -- ve -- runt me

    to -- tum in cir -- cu -- i -- to: et sic re -- pente _

    prae -- ci -- pitas _ me? Me -- men -- to, quae  -- so,

    quod si -- cut lu -- tum fe -- ceris _ me, et in pul -- verem _

    re -- duces _  et in pul -- verem _   re -- du -- ces  me.

    Non -- ne si -- cut lac mul -- sisti _ me, et si -- cut

    ca -- seum _ me co -- a -- gu -- la - sti?

}

VIbcn = \relative do {

    sib8 sib sib sib sib sib sib sib
    sib sib sib sib sib sib la la
    sib sib sib sib sib sib sib sib

    %4
    sib sib sib sib sib sib sib sib\mbreak
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %7
    sib sib sib sib sib sib sib sib
    la la la la la la la la\mbreak
    mib'! mib mib mib re re re re

    %10
    re re re re sol sol sol sol
    fa fa fa fa mi! mi mi mi
    mib! mib mib mib re sib fa' mib\mbreak

    %13
    re re re re re re re re
    re re re re mib? mib mib mib
    mi mi mi mi fa mi re do

    %16
    sib sib sol sol mib'?2\mbreak
    re8 re re re re re re re
    re re sol sol dod, dod dod dod

    %19
    re^\markup\italic "adag[io]" re re re re2\fermopz

}

VIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2 <6 4>4 <6 4>8 s
    <5 4> <5 3> s4 <4 3>8 s <5 3>4
    s1
    <7->2 <6 4>4 s\bassFigureExtendersOff
    <6 4>2 <7 4 2>
    <5> <6 4!>
    <6 4!> <6 4!>
    <6> s
    <6 4> s4 <7 _+>
    <7 _+>2 s
    <4!> <6>
    <4> <6>
    <6> s
    <5-> s
    <6>1
    s2 <7>4 <6\\>
    <_+> s <6 4> <7 5 _+>
    <7 _+>2 <7>
    <6>4 <5 _+>8 <4 2!> <_+>

}


forma = {

    \time 4/4
    \key sol\minor
    \tempo 4 = 50
    s1*19
    \bar "||"

}

VIvlI = {
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIvla = {
    \clef alto
    <<\VIvlan \forma>>

}

VIbasso = {
    \clef bass
    \new Voice = "manus"
    <<\VIbasson \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
}




VIIflIn = \relative do'' {

    fa4 sib sib~
    sib la8 sib do4
    do16(sol8.) la16(fa8.) fa16(mib8.)

    %4
    re8(sib) re(fa) fa(sib)
    \grace sib8 la8. sol16 fa4 r
    lab16 (sol fa4) sib, lab'8

    %7
    sol32(fa mib8.) sib8(mib) mib(sol)
    sib16(la sol4) do, sib'8
    la32(sol fa8.) do8(fa) fa(la)\mbreak

    %10
    do16(sib la4) re, do'8
    sib32(la sol8.) re8(fa) fa(sib)
    mib16(re do4) fa, mib'8

    %13
    re32(do sib8.) sol32(la sib8.) mib,32(fa sol8.)
    la,4 r8 la' sib4~
    sib8 sol la4.\tr sib8

    %16
    sib fa16(mib) re8-! [sol-!] fa(re)
    r mib16(re) do8-![mib-!] re(do)
    re(mib) do4.\tr sib8

    %19
    sib4 r r
    R2.*4
    lab'16(sol fa4) sib, lab'8

    %25
    sol32(fa mib8.) sib8(mib) mib(sol)
    sib16\parenthesize (la? sol4) do, sib'8
    la32(sol fa8.) r4 r

    %28
    R2.*7
    do4 fa fa
    fa mi8 fa sol4~

    %37
    sol16(fa8.) mi?16(re8.) do16(sib8.)
    la8(fa) la(sib) do(fa)
    mi8.(re16) do4 r

    %40
    r8 la'16(sol) fa8-![sib-!] la(fa)
    r sol16(fa) mi?8-.[sol-!] fa(mi)
    fa(sol) mi4. fa8

    %43
    fa4 r r
    R2.*4
    r8 do16(sib) la8-![re-!] do(la)

    %49
    r sib16(la) sol8-![sib-!] la(sol)
    R2.*7
    r8 la'16(sol) fa8-![sib-!] la(fa)\mbreak

    %58
    r8 sol16 \parenthesize (fa) mib8-![sol-!] fa mib
    fad la16 sol fad8-! la-! sol(\parenthesize fad)
    sol la fad4. sol8

    %61
    sol4 r r
    R2.*8
    lab16(sol fa4) sib, lab'8

    %71
    sol32(fa mib8.) sib8(mib) mib(sol)
    sib16\parenthesize (la! sol4) do, sib'8
    la32\parenthesize (sol fa8.) do8(fa) fa(la)\mbreak

    %74
    do16(sib la4) re, do'8
    sib32(la sol8.) re8(sol) sol(sib)
    mib16(re do4) fa, mib'8

    %77
    re32(do sib8.) r4 r
    R2.*3
    r8 fa16(mib) re8-![sol-!] fa(re)\mbreak

    %82
    r8 mib16(re) do8-![mib-!] re  do
    re4 r r
    R2.*7

    %91
    lab'16(sol fa4) \parenthesize sib, lab'8
    sol32(fa mib8.) sib8(mib) mib(sol)
    sib16\parenthesize (la? sol4) do, sib'8\mbreak

    %94
    la32(sib do8.) mib,32(fa sol8.) do,32\parenthesize (re mib8.)
    la2_\fermata r4
    sib8(sol) la4.\tr sib8

    %97
    sib fa16(mib) re8-![sol-!] fa(re)
    r mib16(re) do8-![mib-!] re(do)
    re(mib) do4.\tr sib8

    %100
    sib2 r4

}

VIIflIIn = \relative do'' {

    re8.(mib16) re8.(mib16) do8.(re16)
    do8.(re16) do8. (sib16) la4
    la8(sib) do4 do

    %4
    sib8[(re)] fa(re) re8.(do16)
    do4 do do
    lab? sib sib

    %7
    sib8.(lab16) sol4 do~
    do do do
    do8.(sib16) la!4 re~\mbreak

    %10
    re re re
    re8.(do16) sib8.(do16 re4)
    do4 fa fa

    %13
    fa32(mib re8.) mib32(fa sol8.) do,32 \parenthesize (re mib8.)
    fa,4 r8 fa' fa4
    mib8. re16 do4.\tr re8

    %16
    re re16(do) sib8-![mib-!] re(sib)
    r8 do16(sib) la8-! do-! sib(la)
    sib8 \parenthesize (do) la4. \parenthesize \tr sib8

    %19
    sib4 r r
    R2.*4
    fa4 sib sib

    %25
    sib8.(lab16) sol4 do
    do do do
    do r r

    %28
    R2.*7
    la8.[(sib16) la8.(sib16) la8.(sib16)]
    sol8.[la16  sol8. fa16] \parenthesize mi4

    %37
    mi8.(fa16) sol4 sol
    fa8.[la16 do8. la16 ] \parenthesize la4
    la8. \parenthesize (sol16) sol4 r

    %40
    r8 do16(sib) la8-![re-!] do(la)
    r sib16(la) sol8_![sib-!] la(sol)
    la(sib) sol4. fa8

    %43
    fa4 r r
    R2.*4
    r8 la16(sib) do8-![sib-!] la\parenthesize (fa)

    %49
    r sol16(fa) mi?8-! [sol-! fa(mi)]
    R2.*7
    r8 fa'16\parenthesize (mib) re8\parenthesize -![sol\parenthesize -!] fa\parenthesize(re)\mbreak

    %58
    r8 mib16 \parenthesize (re) dod8\parenthesize -![mib\parenthesize -! re dod]
    do! do16(sib) la8-![do-! sib(la)]
    sib do la4. sol8

    %61
    sol4 r r
    R2.*8\mbreak
    fa'4 fa fa

    %71
    fa(mib) r
    sol sol sol
    sol(fa) r

    %74
    la! la la
    la sol r
    sol fa fa

    %77
    fa r r
    R2.*3
    r8 re16(do) sib8-![mib-!] re(sib)\mbreak

    %82
    r do16(sib) la8-![do-!] sib la
    \parenthesize sib4 r r
    R2.*7

    %91
    fa4 sib sib
    sib8.(lab16) sol4 do~
    do do do\mbreak

    %94
    do do32(re mib8.) la,?32(sib do8.)
    fa2\fermata r4
    fa8(mib) do4.\tr re8

    %97
    re re16(do) sib8-![mib-!] re\parenthesize (sib)
    r do16(sib) la8-![do-!] sib(la)
    sib(do) la4.\tr sib8

    %100
    sib2 r4

}


VIIvlIn = \relative do'' {

    sib,4 sib sib
    fa' fa fa
    fa fa fa

    %4
    sib sib sib,
    fa' fa mib
    re8(sib') re,(lab') re,(sib')

    %7
    mib,4 mib mib
    mi8(do') mi,(la) mi(do')
    fa,4 fa fa\mbreak

    %10
    fad8(re') fad,(do') fad,(re')
    sol,4 sol sol
    do,8(mib) la,[(mib') la,(fa')]

    %13
    sib4 mib, mib
    mib r8 mib re4
    mib fa fa

    %16
    sib, r sib
    fa' r fa
    sib8 mib, fa4 fa

    %19 OOKK
    sib, fa' fa
    fa fa fa
    la do8 sib la sol\mbreak

    %22
    fa4 fa fa
    fa fa mib
    re8(sib') re,(lab') re,(sib')

    %25
    mib,4 mib mib
    mi8(do') mi,(la) mi(do')
    fa,4 la sol

    %28
    fa re' re
    do do do
    fa, sol mi

    %31
    fa la fa
    sol la fad
    sol sol fa?

    %34
    fa mi4. fa8
    fa4 fa fa
    do do do

    %37
    do do do
    fa fa fa
    do do'16[(sib8.) la16 sol8.]

    %40
    fa4 r fa
    do r do
    fa8 sib, do4 do

    %43
    fa fa la
    sib8 (fa') fa,(fa') fa,(fa')
    sib,(fa') la,(fa') la,(fa')\mbreak %metà p. 21

    %46 OOKK
    sib,(fa') fa,(fa') sib,(fa')
    sib,4 sib sol
    la4 r fa

    %49
    do r do
    fa la la
    sol sol fa

    %52
    dod8(la') dod,(la') dod,(la')
    re,(la') fad(la) re, (la')
    re,4 sol do,

    %55
    sol' mi fa~
    fa8 mi mi4. re8
    re4 r re\mbreak

    %58 OOKK
    la r la'
    re, r re
    sol8 do, re4 re

    %61
    sol r r
    sol8(do) re,(re') fad,?(re')
    re,(sol) re'4 \parenthesize r

    %64
    fa,8(sib) do,(do') mi,(do')
    do,(sol') do4 \parenthesize r
    r re, sib

    %67
    mib! mib re
    do sib sib'
    la8(fa') do(fa) la,(fa')\mbreak

    %70
    fa,(sib) re,(lab') re,(sib')
    mib,(sib') sol'4 \parenthesize r
    mi,8(do') mi,(sib') mi,(do')

    %73
    fa,(do') la'4 r
    fad,8 re' fad, do' fad, re'
    sol,(re') sib'4 r

    %76
    do,8 mib la, mib' fa, fa'
    sib,4 re sib
    sol fa la

    %79
    sib mib re
    sol8(mib) do4. sib8
    sib4 r r\mbreak

    %82
    fa r fa
    sib fa re
    sib do do

    %85
    do8(do') la[(do)] do,(do')
    fa,(sib) re,[(sib')] sib,(sib')
    mib,4 mib re

    %88
    do la' sib
    mib,4^\markup\italic "adag[io]" fa2
    sib4 sib, do

    %91
    re8(sib') re,(lab'?) re,(sib')
    mib,4-! mib-! mib-!
    mi8(do') mi,(sib') mi,(do')\mbreak

    %94
    fa,4 fa fa
    do'2\fermata r4
    re,8 \parenthesize (mib) fa4 fa

    %97
    sib r sib,
    fa' r fa
    sib8 \parenthesize (re,) fa4 fa

    %100
    sib,2 r4

}

VIIvlIIn = \relative do'' {

    sib,4 sib sib
    fa' fa fa
    fa fa fa

    %4
    sib sib sib,
    fa' fa mib
    re8(sib') re,(lab') re,(sib')

    %7
    mib,4 mib mib
    mi8(do') mi,(la) mi(do')
    fa,4 fa fa\mbreak

    %10
    fad8(re') fad,(do') fad,(re')
    sol,4 sol sol
    do,8(mib) la,[(mib') la,(fa')]

    %13
    sib4 mib, mib
    mib r8 mib re4
    mib fa fa

    %16
    sib, r sib
    fa' r fa
    sib8 mib, fa4 fa

    %19 OOKK
    sib, re re
    do do do
    fa fa fa\mbreak

    %22
    re re re
    do fa mib
    re8(sib') re,(lab') re,(sib')

    %25
    mib,4 mib mib
    mi8(do') mi,(la) mi(do')
    fa,4 la sol

    %28
    fa fa sol
    sol sol la
    fa do do

    %31
    do do sib
    sib sib la
    sib do do\mbreak

    %34
    sib sol sol
    la fa' fa
    do do do

    %37
    do do do
    fa fa fa
    do do'16[(sib8.) la16 sol8.]

    %40
    fa4 r fa
    do r do
    fa8 sib, do4 do

    %43
    fa fa la
    sib8 (fa') fa,(fa') fa,(fa')
    sib,(fa') la,(fa') la,(fa')\mbreak %metà p. 21

    %46 OOKK
    sib,(fa') fa,(fa') sib,(fa')
    sib,4 mi, sol
    fa4 r fa

    %49
    do r do
    fa fa fa
    sol sol fa

    %52
    dod8(la') dod,(la') dod,(la')
    re,(la') fad(la) re, (la')
    re,4 sol do,

    %55
    sol' mi fa~
    fa8 mi mi4. re8
    re4 r re\mbreak

    %58 OOKK
    la r la'
    re, r re
    sol8 do, re4 re

    %61
    sol r r
    sol8(do) re,(re') fad,?(re')
    re,(sol) re'4 \parenthesize r

    %64
    fa,8(sib) do,(do') mi,(do')
    do,(sol') do4 \parenthesize r
    r re, sib

    %67
    mib! mib re
    do sib sib'
    la8(fa') do(fa) la,(fa')\mbreak

    %70
    fa,(sib) re,(lab') re,(sib')
    mib,(sib') sol'4 \parenthesize r
    mi,8(do') mi,(sib') mi,(do')

    %73
    fa,(do') la'4 r
    fad,8 re' fad, do' fad, re'
    sol,(re') sib'4 r

    %76
    do,8 mib la, mib' fa, fa'
    sib,4 re sib
    sol fa la

    %79
    sib mib re
    sol8(mib) do4. sib8
    sib4 r r\mbreak

    %82
    fa r fa
    sib fa re
    sib do do

    %85
    do8(do') la[(do)] do,(do')
    fa,(sib) re,[(sib')] sib,(sib')
    mib,4 mib re

    %88
    do la' sib
    mib,4^\markup\italic "adag[io]" fa2
    sib4 sib, do

    %91
    re8(sib') re,(lab'?) re,(sib')
    mib,4-! mib-! mib-!
    mi8(do') mi,(sib') mi,(do')\mbreak

    %94
    fa,4 fa fa
    mib2_\fermata r4
    re8 \parenthesize (mib) fa4 fa

    %97
    sib r sib,
    fa' r fa
    sib8 \parenthesize (re,) fa4 fa

    %100
    sib,2 r4

}

VIIvlan = \relative do' {

    R2.*18
    sib4 sib sib
    fa' fa fa

    %21
    fa fa fa\mbreak
    sib re, sib
    fa'2 r4

    %24
    R2.*3
    r4 fa mi?
    re sib si

    %29
    do si? la
    re mi do
    fa, fa' re

    %32
    mi? fad re
    sol mi! fa\mbreak
    sib,? do do,

    %35
    fa r r
    R2.*7
    fa'4 fa fa

    %44
    sib, re sib
    fa' fa mib?\mbreak
    re re re

    %47
    mi do mi
    fa2 r4
    R2.

    %50
    fa4 fa, fa'
    mi mi re
    la la' sol

    %53
    fad re fad
    sol mi fa
    mi la fa

    %56
    sol la la,
    re4 r r\mbreak
    R2.*3

    %61
    sol4\p sol sol
    mi fad re
    sol sol, sol'

    %64
    re mi do
    fa fa, mi'?
    re re re

    %67
    mib! mib re
    do sib2
    fa'4 fa mib\mbreak

    %70
    re8\pp(sib') re,(lab') re,(sib')
    mib,4 mib mib
    mi8(do') mi,(sib') mi,(do')

    %73
    fa,4 fa fa
    fad8(re') fad,(do') fad,(re')
    sol,4 sol sol

    %76
    do,8 mib la, mib' la, fa'
    sib,4 re sib
    do la fa

    %79
    sib do re
    mib fa fa,
    sib r r

    %82
    R2.
    sib4 sib sib
    mib mi do

    %84
    fa, fa' mib?
    re sib re
    mib mib re

    %88
    do fa sib,
    mib^\markup\italic "adag[io]" fa fa,
    sib2 r4

    %91
    R2.*10

}

VIIbasson = \relative do {

    \autoBeamOff

    R2.*18
    fa4 sib sib
    sib4. la8 la4

    %21
    do8[(sib) la(sol) fa(mib)]\mbreak
    re4 fa sib
    la8. sol16 fa4 r

    %24
    R2.*4
    sib4. la8 sol fa
    mi4 do do'~

    %30
    do sib2
    sib4 la re~
    re do2

    %33
    sib4 sol la\mbreak
    re do,4. do8
    fa2 r4

    %36
    R2.*7
    do'4 la fa
    re' re re

    %45
    re4. do8 do4\mbreak
    r sib la
    sol(do) sib

    %48
    la8 [sol] fa4 r
    R2.
    do'4 do do

    %51
    dod4. dod8 re4
    mi8 [dod] la4 r
    r re dod?

    %54
    \appoggiatura dod?8 sib2 la4
    sol dod re(
    si) dod4. re8

    %57
    re4 r r\mbreak
    R2.*3
    re4 sib sol

    %62
    do do do
    do4. si8 si4
    sib! sib sib

    %65
    sib4. la8 la4
    r sib lab
    sol(la!) sib(

    %68
    do) re2
    do4 r r\mbreak
    R2.

    %71
    sib4 sib sib
    sol4. sol8 sol4
    r do do

    %74
    la4. la8 la4
    r re re
    do4. sib8 la4

    %77
    sib8 [la] sib2
    r4 do mib
    re4. do8 sib4

    %80
    do8 sol la4. (sib8)
    sib4 r r\mbreak
    R2.

    %83
    sib4 re sib
    sol4. la8 sib4
    la8 [sol] fa4 r

    %86
    lab lab4 sol8[lab]
    sol4(la?) sib
    mib4. do8 re4(

    %89
    mib,) fa2^\markup\italic "adag[io]"
    sib, r4
    R2.*10

}

VIItestoIV = \lyricmode {

    Pel -- le et car -- nibus _ ve - - - stisti _ me:

    os -- sibus _  et ner -- vis com -- pe -- gisti _

    com -- pe -- gisti _ com -- pe -- gi -- sti me.

    Vi -- tam et mi -- se -- ri cor -- diam _ tri -- bu -- i -- sti mi -- hi, et

    vi -- si -- ta -- tio _ tu -- a cu -- sto -- di -- vit spi -- ritum _ me - um.

    Vi -- tam et mi -- se -- ri cor -- diam _ mi -- se -- ri -- cor -- diam _

    tri -- bu -- i -- sti mi -- hi, et

    vi -- si -- ta -- tio _ vi -- si -- ta -- tio _ vi -- si -- ta -- tio _

    tu -- a cu -- sto -- di -- vit spi -- ritum _ me -- um, et

    vi -- si -- ta -- tio _ tu -- a cu -- sto - di -- vit spi -- ritum _ me -- um.

}

VIIbcn = \relative do {

    R2.*18
    sib4 sib sib
    fa'4. fa8 fa4

    %21
    fa fa fa\mbreak
    sib re, sib
    fa'2 r4

    %24
    R2.*3
    r4 fa mi?
    re sib si

    %29
    do si? la
    re mi do
    fa, fa' re

    %32
    mi? fad re
    sol mi! fa\mbreak
    sib,? do do,

    %35
    fa r r
    R2.*7
    fa'4 fa fa

    %44
    sib, re sib
    fa' fa mib?\mbreak
    re re re

    %47
    mi do mi
    fa2 r4
    R2.

    %50
    fa4 fa, fa'
    mi mi re
    la la' sol

    %53
    fad re fad
    sol mi fa
    mi la fa

    %56
    sol la la,
    re4 r r\mbreak
    R2.*3

    %61
    sol4\p sol sol
    mi fad re
    sol sol, sol'

    %64
    re mi do
    fa fa, mi'?
    re re re

    %67
    mib! mib re
    do sib2
    fa'4 fa mib\mbreak

    %70
    re8\pp(sib') re,(lab') re,(sib')
    mib,4 mib mib
    mi8(do') mi,(sib') mi,(do')

    %73
    fa,4 fa fa
    fad8(re') fad,(do') fad,(re')
    sol,4 sol sol

    %76
    do,8 mib la, mib' la, fa'
    sib,4 re sib
    do la fa

    %79
    sib do re
    mib fa fa,
    sib r r

    %82
    R2.
    sib4 sib sib
    mib mi do

    %84
    fa, fa' mib?
    re sib re
    mib mib re

    %88
    do fa sib,
    mib^\markup\italic "adag[io]" fa fa,
    sib2 r4

    %91
    R2.*10

}

VIIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2.*19
    <4>4. <3>8 s4
    s2.
    s4 <6>2
    s2.*4
    s4 <5 3> <5 3>
    <6>2.
    <5 _!>4 <5 _!> <6>
    <7> <5> <_!>
    <4> <3> <6>
    <7> <5> <_+>
    s2.*12
    <6 4>4 <5 3> <5 3>
    <6>s s
    s <_!> s
    s2.*3
    <6\\>2.
    <_+>2 <_+>4
    s <_+> s
    s2.
    <6\\>4 s <6>
    <_!> <_+> s
    s2.*5
    <6>4 s <_+>
    <4> <_!> s
    <6-> <6-> <_!>
    <4> <3> s
    <6> s s
    s <4> <6>
    s2.
    s4 s <4>
    s <6> s
    <9> <8> s
    <6> <6> <6>
    <9> <8> s
    <6> <6> <6>
    <9> <8> s
    <5> <6> s
    s2.*7
    s4 s <_!>
    s2.
    <6 5->4 s <5->
    s <4> <6>
    s <7> <3>

}


forma = {

    \time 3/4
    \key sib\major
    \tempo 2 = 50
    s2.*100
    \bar "|."

}

VIIflI = {
    <<\VIIflIn \forma>>

}

VIIflII = {
    <<\VIIflIIn \forma>>

}

VIIvlI = {
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    <<\VIIvlIIn \forma>>

}

VIIvla = {
    \clef alto
    <<\VIIvlan \forma>>

}

VIIbasso = {
    \clef bass
    \new Voice = "pelle"
    <<\VIIbasson \forma>>
}

VIIbc = {
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
}
#(set-global-staff-size 17)


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
        systems-per-page = #3
    }

    \header {
        subtitle = \markup {"Officium defunctorum - Lectio 1° Nocturni I" \super mi  "[ZWV 47]"}
        composer = \markup {"J. D. Zelenka (1679-1745)"}
    }

    \markup \huge {[1.] Parce mihi Domine}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viol[ino] 1."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viol[ino] 2."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 4/4 sol'4.^\markup\center-align "[Soprano]" sol'8}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \Isoprano \global
                \new Lyrics \lyricsto "parce" \ItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
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

    \pageBreak

    \markup \huge {[2.] Andante. Peccavi}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Chalumeux"}
                    \set Staff.midiInstrument = #"clarinet"
                    \set Staff.shortInstrumentName = "cha"
                    \IIcl\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Tutti""Violi[ni]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl"
                    \IIvlI\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r4 r sib'^\markup\center-align "[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIsoprano \global
                \new Lyrics \lyricsto "peccavi" \IItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {
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

    \pageBreak

    \markup \huge {[3.] Larghetto. Ecce nunc in pulvere }

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Chalumeux"}
                    \set Staff.midiInstrument = #"clarinet"
                    \set Staff.shortInstrumentName = "cha"
                    \IIIcl\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Tutti""Violi[ni]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl"
                    \IIIvlI\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 4/4 r2 fa'8[(sib')]^\markup\center-align "[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIIsoprano \global
                \new Lyrics \lyricsto "ecce" \IIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {
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

\bookpart {

    \paper {
        systems-per-page = #3
    }

    \header {
        subtitle = \markup {"Lectio 2" \super da "Nocturni Primi"}
        composer = \markup {"J. D. Zelenka (1679-1745)"}
    }

    \markup \huge {[1.] Tædet animam meam}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viol[ino] 1."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viol[ino] 2."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \time 4/4 r4 mib'2 ^\markup\center-align "[Tenore]" do'4}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \IVtenore \global
                \new Lyrics \lyricsto "animam" \IVtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {
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

    \pageBreak

    \markup \huge {[2.] Numquid oculi}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oboe1.""con Sordini"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \VobI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oboe 2.""con Sordini"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \VobII\global
                >>
            >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violini 1. e 2"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl"
                    \VvlI\global
                >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Vvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \time 3/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r2 re' ^\markup\center-align "[Tenore]" sol}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \Vtenore \global
                \new Lyrics \lyricsto "oculi" \VtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Fagotti e""Organo"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
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
        systems-per-page = #3
    }

    \header {
        subtitle = \markup {"Lectio 3  Nocturni Primi"}
        composer = \markup {"J. D. Zelenka (1679-1745)"}
    }

    \markup \huge {[1.] Manus tuae fecerunt me}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viol[ino] 1."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \VIvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viol[ino] 2."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \VIvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \VIbasso \global
                \new Lyrics \lyricsto "manus" \VItestoIV
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIbc\global
            >>
        >>

        \layout {
            indent = 2\cm

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

    \pageBreak

    \markup \huge {[2.] Pelle et carnibus vestisti me. Andante}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Flauto 1."}
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.shortInstrumentName = "fl1"
                    \VIIflI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Flauto 2.]"}
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.shortInstrumentName = "fl2"
                    \VIIflII\global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino [1.]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \VIIvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino [2.]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \VIIvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \VIIbasso \global
                \new Lyrics \lyricsto "pelle" \VIItestoIV
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
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


