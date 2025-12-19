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



IvlIn = \relative do'' {

    r8 do, do do lab' lab lab lab
    si,4 r8 re sol sol sol sol
    la,4 r8 do fa fa fa fa

    %4
    fa fa mib re  mib4.^\markup \italic "adag[io]"re8\mbreak
    re \breathe sol\p^\markup\italic"[andante]" sol sol mib' mib mib mi
    fa fa, r4 r r8 re\f

    %7
    sol sol sol sol la,4 r8 do
    fa\p fa fa fa sol fa mib lab\mbreak
    sol re' re re sol[sol sol fa16(mib)]

    %10
    fa8 fa, r4 r8 do' do do
    fa[fa fa mib16 re] mib8 mib, r4
    r8 sib' sib sib sol'[sol sol fa16 (sol)]\mbreak

    %13
    mib8 mib16 re do8 fa mib mib, r4
    r8 do' do do fa fa fa fa
    sol,4 r r8 la la la

    %16
    re4 do4. sib8 sib[(la)]\mbreak
    r sol sol sol mib' mib mib mib
    fad,4  r8 la re re re re

    %19
    mi,4 r8 sol do do do do
    do do sib la sib4.^\markup \italic "adag[io]" la8\mbreak
    la4 r r2

    %22
    r8 fa fa fa re' re re re
    mi,4 r8 sol do do do do
    re,4 r8 sol sib sib sib do\mbreak

    %25
    re sol fa4. fa,8 fa' mib
    re sib mib4. re16 do re8. mib16
    mib8\breathe mib,8\f mib mib do' do do do

    %28
    re,4 r8 fa sib sib sib sib\mbreak
    do,4 r8 mib lab lab lab sol16 fa
    sol8 sib mib4 r2

    %31
    R1
    r4 mib8\f mib re sib r4\mbreak
    R1

    %34
    r8 mib,^\markup\italic{ "un poco" \dynamic p} mib mib do' do do do
    re,4 mi8(fa) mi do' do do
    fa[fa fa mib!16 fa] reb8 reb, r reb'

    %37
    do16(reb) sib(do) lab(sib) sol(lab) fa4. fa8
    mi do' sol la! sib fa r4
    r8 lab lab lab fa' fa fa fa

    %40
    sol,4 r8 sib mib mib mib  mib\mbreak
    r2 r8 mib,\f mib mib
    do' do do do re,4 r8 fa

    %43
    sib4 r r2
    r8 fa\p fa fa reb' reb reb reb\mbreak
    mi,4 r8 sol do lab do reb

    %46
    mi4 fa2 sol8(fa)
    mi re16 mi fa4. mi16 re mi8. fa16
    fa4 r r8 sib,, sib sib\mbreak

    %49
    sib'[sib sib lab16 sol] lab4 r8 lab,
    lab' lab lab sol16 fa sol8 do, do' sib
    lab fa reb' do si16(lab) si8 r4

    %52
    r8 do\f do do lab' lab lab lab\mbreak
    si,4 r8 re\p sol sol sol sol
    la,?4 r8 do fa fa fa fa

    %55
    fa4 r8 fa mib(re) mib(fa)
    re4. do8 do\breathe do,\f do do\mbreak
    lab' lab lab lab si,4_\fermata ^\markup \italic "adag[io]" r

    %58
    do_\fermata r do si8. do16
    do2 r

}

IvlIIn = \relative do'' {

    sol,4 r r8 do do do
    re re re re do4 r8 do
    do do do do sib4 r8 re

    %4
    re re do si do4.^\markup \italic "adag[io]"do8\mbreak
    si4 r r8 sol'\p sol sol
    do do do do re,4 r

    %7
    r2 r8  fa\p fa fa
    fa4 r8 re do fa sol fa16 mib\mbreak
    re4 r r r8 lab'

    %10
    lab? lab sol sol sol[fa16 mi fa8 do]
    r4 r8 sol' sol sol fa[fa]
    fa mib?16 re mib8 sib r8 sib' sib sib\mbreak

    %13
    lab sib lab2 sib8 sol
    fa4 r8 fa fa reb' re re
    sol[sol sol fa16(mi)] fa re fa sol la8 la,

    %16
    r la sol la16 sol fad8 sol sol[fad]\mbreak
    r2 r8 sol sol sol
    mib' [mib mib re16 do] re8 re, r sol

    %19
    sol sol sol sol fa fa' r la,
    la la sol fad sol4.^\markup \italic "adag[io]" fad8\mbreak
    fad?4 r r2

    %22
    r2 r8 fa? fa fa
    do' do do do fa,4 r8 sol
    sib sib sib sib mib,4r8 mib\mbreak

    %25
    re mib sib[(do)] re4 r8 do
    fa4 r8 do' fa, sib, sib' lab
    sol4 r r8 mib\f mib mib

    %28
    sib' sib sib sib mib,4 r8 mib\mbreak
    lab lab lab lab lab4 r8 re,
    sib4 r r sib'8\f sib

    %31
    sol mib r4 r2
    R1*2
    r2 r8 fa fa fa

    %35
    sib, sib sib [do] sol4 r
    r8 lab' lab lab fa fa fa fa\mbreak
    fa4 r8 do reb2

    %38
    sol,4 r r8 fa' fa fa
    do' do do do reb,4 r8 lab
    mib' mib mib mib mib4 r8 sol\mbreak

    %41
    fa[fa16 sol lab8 sib] mib,4 r8 mib\f
    mib mib mib fa r sib, sib sib
    sib4 r r2

    %44
    r8 fa'\p fa fa reb' reb reb reb\mbreak
    mi,4 r8 sol do do sib lab
    sol do lab sib16 do reb8(do) sib[(lab)]

    %47
    sol fa16 sol lab4 sol4. sol8
    fa4 r r2\mbreak
    r8 do do do re[re re re16 mi]

    %50
    fa4 r8 fa do sol' sol mi
    fa4 r8 lab re,\breathe sol\f sol sol
    mib' mib mib mib fa,4 r8 do

    %53
    sol' sol sol sol do,\breathe mib\p mib do
    fa do' do do si16(do) do(re) re do do si
    si?4 r8 si do(si!) do(re)

    %56
    si4. do8 do4 r\mbreak
    r8 do, do do lab4_\fermata r
    la!_\fermata r sol4. sol8

    %59
    sol2 r

}

Ivlan = \relative do' {

    mib,4 r r8 fa fa fa
    sol sol sol sol sol4 r8 sol
    fa fa fa fa fa4 r8 la!

    %4
    si si do[re] do do la la\mbreak
    sol4 r r2
    r8do\p do do lab' lab lab lab

    %7
    sol4 r r2
    R1*8
    r2 r8 re\f re re\mbreak

    %17
    re' re re re do,4 r8 sol'
    la la la sol16 fad sol4 r8 re
    do do do do do4 r8 mi

    %20
    fad fad sol la re,4^\markup \italic "adag[io]" mi\mbreak
    re r r2
    R1*4

    %26
    r2 r8 sib\f sib sib
    sol' sol sol sol do,4 r8 mib
    fa fa fa fa r mib mib mib\mbreak

    %29
    mib mib r do do4 r8 sib
    sib4 r r2
    r  fa'8\f fa re[sib]

    %32
    R1*9
    r2 r8 do\f do do
    lab4 r r8 fa' fa fa

    %43
    mib4 r r2
    lab,8\p sib do lab sib fa fa fa\mbreak
    do' do do do fa,4 r

    %46
    R1
    r2 r8 do'\f do do
    lab' lab lab lab fa4 r\mbreak

    %49
    R1*3
    r2 r8 do\f do do
    fa,4 r8 si do4 r

    %54
    R1*2
    r8 sol\f sol sol mib' mib mib mib\mbreak
    do4 r8 do, re4_\fermata r

    %58
    mib!4_\fermata r re4. re8
    do2  r

}

Ibasson = \relative do {

    \autoBeamOff

    R1*4
    r4 do2 do4
    lab'2 si,

    %7
    r8 do do'2~do8 do
    do4 si mib8[(re)] do[(re)]
    si8. la?16 sol4 r do~

    %10
    do8 sib? sib sib sib4 lab
    r sib4. lab8 lab lab
    lab?4 sol8 mib reb'4. sib8\mbreak

    %13
    do [sol] lab[reb] do4 reb8[sib]
    la!4 r8 la sib4(si)
    do dod re4. do8

    %16
    sib [fad] sol[mib'] re,2\mbreak
    sol, r
    R1*3\mbreak

    %21
    la'8 re, re'8. do16 sib8 do16[re] do8 sib
    la[sol] fa4 r8 sib, re sib
    sib' sib sib lab16[sol] lab[sol] lab8 r mib

    %24
    lab8 lab lab sol16[fa] sol8[(mib)] sol8[lab]\mbreak
    sib[mib re do] sib4 la!
    lab8[sol16 fa] sol8 lab sib2

    %27
    mib, r
    R1
    r2 r4 sib'8 sib

    %30
    sol[mib] sol[lab] sib4 sib,
    r mib'8 mib re[sib] do[re]
    mib4 mib, r mib'8 reb\mbreak

    %33
    do4 sib8 do lab4. sol8
    sol4 r r8 lab lab lab
    lab?[sol16 fa] sol[sib lab! sib] do8 sol r4

    %36
    fa8. fa16 fa8 fa sib sib sib lab16[sol]\mbreak
    lab8[sib] do2 sib8.[(do16)]
    do2 r8 sib fa sol

    %39
    lab mib r4 r2
    r r8 mib' sib do\mbreak
    reb4. do16 sib do4 r

    %42
    R1
    r8 sib mib reb do16[sib do reb] do8 sib
    lab16[sol] fa8 r4 r8 sib, sib sib\mbreak

    %45
    sib' sib sib lab16[sol] lab8[fa] lab sib
    do sib lab fa sib[lab] sol[lab16 sib]
    do4 fa, do4. do8

    %48
    fa, fa' fa fa reb' reb reb4\mbreak
    mib, r8 do do'8. do16 do4
    re,4 r8 re mi8. mi16 mi8 do

    %51
    fa4. fa8 sol4 r
    R1
    r2 r4 r8 mib

    %54
    mib' mib mib re16[do] re8 do si[la]
    sol4 r8 sol do, sol' do fa,
    sol4. sol8 do,2\mbreak

    %57
    R1*3

}

ItestoIV = \lyricmode {

    De pro -- fun -- dis cla -- ma -- vi ad te, Do - - mine; _

    Do -- mine, _  ex -- au -- di Do -- mine, _  ex -- au -- di ex -- au -- di

    vo -- cem me - am, ex -- au - - - di vo -- cem me -- am.

    Fi -- ant au -- res tu -- ae in -- ten -- den -- tes

    in vo -- cem de -- pre -- ca -- ti -- o -- nis in vo -- cem

    de -- pre -- ca -- ti -- o - - - - nis me -- ae.

    Si i -- ni -- qui -- ta -- tes si i -- ni -- qui -- ta -- tes

    ob -- ser -- va -- veris, _ Do -- mi -- ne,

    quis su -- sti -- ne - - bit? Do -- mine _ quis su -- sti -- ne - - - - bit?

    Qui -- a a -- pud te pro -- pi -- ti -- a -- tio _ est

    et prop -- ter le - gem tu -- am et prop -- ter prop -- ter  le -- gem tu -- am

    su -- sti -- nui _ te, Do - - - - mi -- ne  et prop -- ter le -- gem tu -- am

    su -- sti -- nui _ te, su -- sti -- nui _ te, Do -- mi -- ne,

    et prop -- ter  prop -- ter le -- gem tu -- am su -- sti -- nui _ te, Do -- mi -- ne.

}

Ibcn = \relative do {

    do4 r r8 fa, fa fa
    fa'[fa fa mib16 re] mib8 mib, r mib
    mib'8 mib mib re16 do re8 re, r re'

    %4
    sol sol sol sol do,4^\markup \italic "adag[io]" fad, \mbreak
    sol'8 fa mib re do sib lab sol
    r fa fa fa fa' fa fa mib16 re

    %7
    mib8 mib, r mib mib' mib mib re16 do
    re8 re, r sol' do, re mib fa\mbreak
    sol sol, sol' fa mib[do16 re mib8 do]

    %10
    re4 mi fa8 fa, fa' mi
    re sib16 do re8 sib do4 re
    mib?8 mib mib mib mib mib mib mib\mbreak

    %13
    lab mib fa reb mib mib mib mib
    mib[mib mib reb16 do] reb do sib la? sol8 sol'16 fa
    mib re do sib la8 la'16 sol fa8 re16 mi fa8 fad

    %16
    sol re mib? do re[re, re' re16 do]\mbreak
    sib8 sol r4 r8 do do do
    do'[do do sib16 la] sib8 sib, r sib

    %19
    sib'[sib sib la16 sol] la8 la, r la'
    re, re re re sol4^\markup \italic "adag[io]" dod,
    re4^\markup \italic "andan[te]" re8 sol, sol' fa mi fa16 sol

    %22
    fa8 fa, r4 r2
    R1*4
    r2 r8 lab lab lab

    %28
    lab' lab lab sol16 fa sol4 r8 sol,\mbreak
    sol' sol sol fa16 mib fa8 mib re sib
    mib4 mib8\p mib re sib do re

    %31
    mib fa sol[mib] sib4 sib'8 sib
    sol mib sol lab sib lab sol4\mbreak
    lab8  sol16 fa sol8 mib fa mib16 re do8 re

    %34
    mib4 r r2
    r r8 do do' sib
    lab fa fa fa sib[sib sib lab16 sol]\mbreak

    %37
    lab8 sol fa mib reb2
    do4 r8 do reb4 r8 reb
    do4 r r8 reb reb reb

    %40
    reb'[reb reb do16 sib] do8 lab sol mib\mbreak
    fa sib fa sol lab4 r
    r8 lab, lab lab lab' lab lab sol16 fa

    %43
    sol4 mib lab mi
    fa8 sol lab fa r sib, sib sib\mbreak
    sib' sib sib lab16 sol lab8 fa lab sib

    %46
    do sib lab fa sib[lab sol lab16 sib]
    do4 fa, do4. do8
    fa,4 r r2\mbreak

    %49
    R1*3
    r2 r8 fa' fa fa
    fa' fa fa mib16 re mib8 mib, r4

    %54
    R1*3
    r8 fa, fa fa fa4_\fermata r
    fad_\fermata r sol2
    do r

}

Ibfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2 s8 <_-> s4
    <6 4\+ 2>4 <4\+ 2> <6> s8 <6>16 s
    <6 4 2>4 <4 2> <6> s8 <5>
    <7 _!>8 <7 _!> <6 4> <5 _!> s4 <7>8 <6>
    <_!>4 <6> s8 <6> <7 5> <6!>
    s <_-> s4 <6 4\+ _-> <6 4\+ _->8 s
    <6>4 s <6> s
    <7> s8 <_!> s4 <6>16 s <6 _->8
    <_!>2 s4 s8 <6->
    <7 5-> <6 5-> <5>4 <9 4> <8 _->
    <6>8 s <6>4 <7 5>8 <6- 5> <5->4
    <9 4> <8 3> <7-5> <7- 5>
    s s <6 4> <5 3>
    <6 4\+ 2> <4\+ 2> <6> <_!>
    <6> <_+> <6>4 s
    s8 <_+> s4 <7 _+>8 <6> <4> <_+>
    <6>2 s
    <6 4\+ 2>4 <4\+ 2> <6> s8 <6>16 s
    <6 4\+>4 <6 4\+>8 s <6>4 s8 <5!>
    <7 _+>8 <7 _+> <6 4> <5 _+> s2
    <_+>2 s4 <6>
    <5>1
    s1*4
    s2 s8 <5> s4
    <6 4 2> <6 4 2>8 s <6>4 s8 <6>16 s
    <6 4 2->4  <4 2-> <_-> <6 5->
    s2 <6>
    s1
    <6>2 s4 <6>
    s <6> <_-> <6->8 <6->
    s1
    s2 s8 <_!>8 <_!>4
    <6>8 <_-> s4 <5 _-> <5 _->
    <6> <_-> <7>4 <6>
    s2 <6>4 s
    <6-> s s8 <5-> s4
    <6 4 2>4 s <6>8 <5> <6>16 s <6>8
    <6->4 <6-> s2
    s8 <5>8 <5> <6>16 s
    <6 4 2>4 <4 2>
    <6>2 <5>8 <6>16 s <6>4
    <_->2 s8 <_-> s4
    <4 2> <4 2> <6>2
    <_!>4 <6> <5> <6!>8 <6>
    <7>2 <4>4. <_!>8
    s1*4
    s2 s8 <_-> s4
    <6 4\+ 2> <4\+ 2> <6> s
    s1*3
    s8 <_-> s4 <6 4\+ _-> s
    <7- 5 3>4 s <5 4>4 <5 _!>

}


forma = {

    \time 4/4
    \key sol\minor
    \tempo 4 = 55
    s1*59
    \bar "|."

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

Ibasso = {
    \clef bass
    \new Voice = "profundis4"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIvlIn = \relative do'' {

    R1.*41
    la2^\markup\italic "Entrano gli strumenti"\f  la la
    sib1 sib2

    %44
    r do do
    reb reb do
    si1 do2~

    %47
    do4 re si2. do4
    do1 do2~
    do si4 do  re si

    %50
    mib1.~
    mib2 re4 do re2~
    re do4 si do2~

    %53
    do4 re si2. do4
    do2 do do
    do do do

    %56
    re2. do4 sib2
    sib2. la4 la2
    R1.\mbreak

    %59
    do2 do do4 do
    do2 do do
    sib2. sib4 sib2

    %62
    do do1
    sol r2
    R1.

    %65
    la2^\markup\italic "adag[io]" la la
    la2. la4 sib2
    la la1

    %68
    sol1.

}

IIvlIIn = \relative do'' {

    R1.*41
    fad,2\f fad fad
    sol1 sol2
    r mib mib
    fa fa fa~
    fa4 mi? re fa sol2
    lab sol2. sol4
    sol1 r2
    re'1.~
    re2 do4 re mi do
    fa1.~
    fa2 mi4 re mi2~
    mi4 fa re2. do4
    do2 sol sol
    la2. sol4 la2
    sib2.  sol4 fa2
    fa2. fa4 fa2
    R1.\mbreak
    fa2 fa fa
    fad2. sol4 la la
    la2. la4 sol2~
    sol sol fad
    sol1 r2
    lab^\markup\italic "adag[io]" lab sol
    fad2. fad4 fad2
    sol1.~
    sol4 mi fad1
    sol1.

}

IIvlan = \relative do' {

    R1.*42
    re2  re re
    do1 do2

    %45
    r  lab lab
    sol(re') mi
    re re2. do4

    %48
    do1 r2
    sol'2 sol sol
    sol mib4 fa sol mib
    do2 r sol'\parenthesize ~
    sol r do,
    lab' r sol
    mi2 mi mi

    %55
    mi2. re4 do2
    fa2. mi4 re2
    re2. do4 do2

    %58
    R1.\mbreak
    la2 la la
    la2. sol4 fad fad

    %61
    sol la sib8[sol] sib4 do re
    mib2 re4 re re2
    re1 r2

    %64
    R1.
    do2 do re
    mib2. mib4 mi2~

    %67
    mi re1
    re1.


}

IIsopranon = \relative do'' {

    \autoBeamOff

    r2 r re\soli
    do2. sib4 la2
    sib2. sol4 re'2~

    %4
    re4 si4(dod1)
    re2.\parenthesize (do?4) sib?2~
    sib la4 sol fad2

    %7
    sol1 r2
    R1.*2
    r2 r sib\mbreak

    %11
    do2. do4 sib2
    do2. do4 sib2
    do sib r

    %14
    mib mib re
    re do r
    do re4(do) sib(la)

    %17
    sib2. la4 sib2
    sib do4 \parenthesize (sib) la\parenthesize (sol)\mbreak
    la2 sib do

    %20
    sol1.~
    sol\parenthesize ~
    sol2 fa4 sol la fa

    %23
    sib1.~
    sib2 la4 sol la2~
    la4 (sib) sol2. fa4\mbreak

    %26
    fa1 r2
    R1.*9
    re'2.^\f re4 do sib

    %37
    sib la la1
    do2 do do
    do sib4(do re2)~

    %40
    re4( mib?) do2. do4
    re1 r2\mbreak
    la2  la la

    %43
    sib1 sib2
    r do do
    reb reb do

    %46
    si1 do2~
    do4 (re) si2. do4
    do1 r2

    %49
    R1.*5
    do2\tu do do
    do do do

    %56
    re2. do4 sib2
    sib2. la4 la2
    R1.\mbreak

    %59
    do2 do do4 do
    do2 do do
    sib2. sib4 sib2

    %62
    (do) do1
    sol r2
    R1.

    %65
    la2^\markup\italic "adag[io]" la la
    la2. la4 sib2
    (la) la1

    %68
    sol1.

}

IItestoI = \lyricmode {

    Su -- sti -- nu -- it a -- nima _ me -- a a -- nima _ me -- a

    Su -- sti -- nu -- it a -- nima _ me -- a in ver -- bo e -- jus,

    spe -- ra -- vit a -- nima _ me -- a spe -- ra -- vit spe -- ra - - - - - - vit

    in Do -- mi -- no.

    qui -- a a -- pud Do -- minum _ mi -- se -- ri -- cor  - - di -- a,

    et co -- pi -- o -- sa a -- pud e -- um re -- dem - - pti -- o.

    Et ip -- se re -- dimet _ re -- dimet _  Is -- raël _

    ex om -- nibus _ i -- ni -- qui -- ta -- tibus _  e -- jus,

    i -- ni -- qui -- ta -- tibus _  e -- jus.

}

IIalton = \relative do' {

    \autoBeamOff

    R1.*2
    r2 r sol'\soli
    sol2. fa4 mi2

    %5
    fa2. re4 sol2~
    sol4 (mi) fad sol la2~
    la sol la

    %8
    sol4 fa mi1
    re r2
    r r fa\mbreak

    %11
    sol2. sol4 fa2
    sol2. sol4 fa2
    sol fa r

    %14
    sol la sib
    sib la r
    la sib4(la) sol(fad)

    %17
    sol2. fad4 sol2
    sol la4(sol) fa?(mi)
    fa1.~

    %20
    fa\parenthesize ~
    fa2 mi4 fa sol mi
    la1.~

    %23
    la2 sol fa
    mi1 fa2~
    fa4 (re) mi2. fa4\mbreak

    %26
    fa1 r2
    R1.*9
    sib2.^\f sib4 la sol

    %37
    sol fad fad1
    la2 mi fad
    sol4 la sib2 (la)

    %40
    sol1 sol2
    fad1 r2\mbreak
    fad fad fad

    %43
    sol1 sol2
    r mib mib
    fa fa fa~

    %46
    fa4 mi? re fa sol2
    lab sol2. sol4
    sol1 r2

    %49
    R1.*5
    sol2 sol sol
    la2. sol4 la2

    %56
    sib2.  sol4 fa2
    fa2. fa4 fa2
    R1.\mbreak

    %59
    fa2 fa fa
    fad2. sol4 la la
    la2. la4 sol2~

    %62
    sol sol fad
    sol1 r2
    lab^\markup\italic "adag[io]" lab sol

    %65
    fad2. fad4 fad2
    sol1.~
    sol4 mi fad1

    %58
    sol1.

}

IItestoII = \lyricmode {

    Su -- sti -- nu -- it a -- ni -- ma me - - a a -- nima _ me -- a

    Su -- sti -- nu -- it a -- nima _ me -- a in ver -- bo e -- jus,

    spe -- ra -- vit a -- nima _ me -- a spe -- ra - - - - - vit

    in Do - - mi -- no.

    qui -- a a -- pud Do -- minum _ mi -- se -- ri -- cor  - -  - di -- a,

    et co -- pi -- o -- sa a -- pud e -- um re -- dem - - - - - pti -- o.

    Et ip -- se re -- dimet _ re -- dimet _  Is -- raël _

    ex om -- nibus _ i -- ni -- qui -- ta -- tibus _  e - jus,

    i -- ni -- qui -- ta -- tibus _  e - - jus.

}

IItenoren = \relative do' {

    \autoBeamOff

    R1.*4
    r2 r re\soli
    do2. sib4 la2

    %7
    sib2. sol4 re'2~
    re4 si dod1
    re r2

    %10
    r r re\mbreak
    mib 2. mib4 re2
    mib2. mib4 re2

    %13
    mib re r
    do fa, sib
    fa' fa, r

    %16
    fad fad re
    sol2. re4 sol2
    mi mi do\mbreak

    %19
    fa? sol la
    sib \parenthesize (la) sib
    do2. re4 mi do

    %22
    fa2 re4 mi fa re
    sol2 sol,4 la sib2
    do1 fa,2

    %25
    sib do2. do4\mbreak
    fa,1.
    R1.*9

    %36
    sib2.^\f sib4 do do
    re2. re,4 re2
    R1.

    %39
    sol2 sol fa
    mib1 mib2
    re1 r2\mbreak

    %42
    R1.
    re'2  re re
    do1 do2

    %45
    r  lab lab
    sol(re') mi
    re re2. do4

    %48
    do1 r2
    R1.*5
    mi2 mi mi

    %55
    mi2. re4 do2
    fa2. mi4 re2
    re2. do4 do2

    %58
    R1.\mbreak
    la2 la la
    la2. sol4 fad fad

    %61
    sol la sib8[sol] sib4 do re
    mib2 re4 re re2
    re1 r2

    %64
    R1.
    do2^\markup\italic "adag[io]" do re
    mib2. mib4 mi2~

    %67
    mi re1
    re1.

}

IItestoIII = \lyricmode {

    Su -- sti -- nu -- it a -- ni ma - me -- a

    Su -- sti -- nu -- it a -- nima _ me -- a in ver -- bo e -- jus,

    spe -- ra -- vit a -- nima _ me -- a

    in Do -- mi -- no, spe -- ra - - - - - - - - - - - - - - vit in Do -- mi -- no.

    qui -- a a -- pud Do -- minum _ mi -- se -- ri -- cor  -- di -- a,

    et co -- pi -- o -- sa a -- pud e -- um re -- dem -- pti -- o.

    Et ip -- se re -- dimet _ re -- dimet _  Is -- raël _

    ex om -- ni -- bus i -- ni -- qui -- ta - - - - - - tibus _  e -- jus,

    i -- ni -- qui -- ta -- tibus _  e -- jus.

}

IIbasson = \relative do {

    \autoBeamOff

    R1.*24
    r2 do'\solo do\mbreak
    la sol4 fa sol la

    %27
    sib2 sib, r
    lab' lab lab
    lab sol do4 sib

    %30
    la! sol fa2 r
    r re' do
    sib2. lab4 sol fa

    %33
    sol mib mib' re do sib
    la? fa fa'4. mi8 re4 do
    re sib fa2. fa4

    %36
    sib,1 r2
    R1.*6
    sol'2 sol sol

    %44
    lab1 lab2
    r fa fa
    sol fa mi

    %47
    fa sol2. sol4
    do,1  r2
    R1.*5

    %54
    do2 do do
    fa2. fa4 fa2
    sib,2. do4 re (mib?)

    %57
    fa2. fa,4 fa2
    R1.
    fa'2 fa fa4 mib

    %60
    re2 re re
    sol2. sol4 sol,2
    (do) re1
    sol, r2

    %64
    R1.
    mib'2^\markup\italic "adag[io]" mib re
    do2. do4 dod2\mbreak

    %67
    re1.
    sol,

}

IItestoIV = \lyricmode {

     A cu -- sto -- dia _  ma -- tu -- tina _ us -- que ad noc -- tem,

     spe -- ret spe - ret spe -- ret I -- sra  -- ël in Do - - - - - - - - - - - - - - mino. _

     et co -- pi -- o -- sa a -- pud e - um re -- dem -- pti -- o.

    Et ip -- se re -- dimet _ re -- dimet _  Is -- raël _

    ex om -- ni -- bus i -- ni -- qui -- ta -- tibus _  e -- jus,

    i -- ni -- qui -- ta -- tibus _  e -- jus.



}

IIbcn = \relative do {

    sol'2\soli sib sol
    la mi fad
    sol sib sol

    %4
    mi! la la,
    re sib sol
    la re re,

    %7
    sol sol' fa
    mi la la,
    re1 r2

    %10
    \clef tenor \key fa\major r r re'\mbreak
    mib2. mib4 re2
    mib2. mib4 re2

    %13
    mib re r
    do fa, sib
    fa' fa, r

    %16
    fad fad re
    sol2. re4 sol2
    mi mi do

    %19
    fa? sol la
    sib la sib
    do2. re4 mi do

    %22
    fa2 re4 mi fa re
    sol2 sol,4 la sib2
    do do, fa

    %25
    sib do do,\mbreak  %%% fine p. 13
    \clef bass \key fa\major fa fa, mib'
    re2. mib4 re sib

    %28
    do1 re2
    mib2. re4 do mib
    fa2. mib?4 re do

    %31
    sib la sol sib do re
    mib re do2 re
    mib do mib\mbreak

    %34
    fa la fa
    sib, fa' fa,
    sib\clef tenor \key fa\major sib'2 do

    %37
    re2. re,4 re2
    \clef violin \key fa\major  la'' mi fad
    \clef tenor \key fa\major sol, sol fa?

    %40
    mib1 mib2
    re1 r2\mbreak
    R1.

    %43
    \clef bass \key fa\major sol2\tu sol sol
    lab1 lab2
    r fa fa

    %46
    sol sol mi
    fa sol sol,
    do mi\solo do

    %49
    sol'2. la4 si sol
    do2 r do
    la r si

    %52
    do do, lab'
    fa sol sol,
    do\tu do do

    %55
    fa2. fa4 fa2
    sib,2. do4 re mib
    fa2. fa,4 fa2

    %58
    R1.\mbreak
    fa'2 fa fa4 mib
    re2 re re

    %61
    sol2. sol4 sol,2
    do re1
    sol, r2

    %64
    R1.
    mib'2^\markup\italic "adag[io]" mib re
    do2. do4 dod2\mbreak

    %67
    re1.
    sol,

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.
    s2 <6>1
    s1.
    <7>2 <7 _+> s
    s1.
    <9 7>2 <5 _+> s
    <9> <8> <6>
    <7> <_+> s
    s1.
    s2 s <6 3>4 s\mbreak
    \bassFigureExtendersOn <6>2 <6>4 s <6> s
    <6>4 s <6>4 s <6> s
    <6>4 s <6>2 s
    <5 _-> <7> s
    <6 4> <5 3> s
    <5 3> <5 3> <6 4>4 <5 _+>
    s2. <_+>4 s2
    <5 3>2 <5 3> <6 4>4 <5 3>8 s
    <5 3>4 s <7 3>2 <6>4 s
    <6 5>2 <6 5> <6 5>4 s
    <5 4 >2 <5 4 3> s
    <9>2 <5 3> <5 3>
    <9> <8> <5>
    <7 3> s <3>
    <7> <5> s\mbreak
    s2 s <6 4 2>4 s
    <6>1.
    <6- _->1 <6->2
    <4->2 <3> <_->
    <_!>1.
    s1 <_->2
    <5> <7>4 <6-> <4>2
    <5> <_-> <6>
    <_!> s <6>4 <5>
    s2 <4> <3>
    s1 <8 6>4 <7 5>
    <6 4>4 <5 _+> <5 _+>2 <5 _+>\mbreak
    <3>2 <6> <5>
    <4> s <6>
    <7> <6> s
    s1.\mbreak %% fine a bar 40 OOKK
    s1.
    s
    <5- 3> s2 <6- _-> <5 _->
    <7 3>4 <6>8 s <6 4\+>4 s <6>2
    <_-> <3> s
    s1.
    <5 4>2 <5 3> s
    <9> s <8>
    <6 5-> s <6 5>
    <9 4> <8 3-> <5->
    <7- _-> <_!> s
    s1.
    <7->2 s4 <6> <5>2
    s1 <6>4 s
    <6 4>2 s4 <5 3> <5 3>2
    s1.\mbreak
    <5 3>2 <5 3> <5 3>
    <7 _+> <7 _+> <7 _+>
    <9>1 <8>2
    <6 5 _-> <4+>1
    s1.
    s
    <6 4 2+>1 <8 _+>2
    <6 5 _->1 <7 3>2\mbreak
    <9! 4> <8 _+>

}


forma = {

    \time 3/2
    \key fa\major
    \tempo 1 = 50
    s1.*68
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
    \new Voice = "anima1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "anima2"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "anima3"
    <<\IItenoren \forma>>
}

IIbasso = {
    \clef bass
    \new Voice = "anima4"
    <<\IIbasson \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIvlIn = \relative do'' {

    R1*2
    sib'8 sib, r16 fa' sol la sib la sib do sib fa re sib
    sol' lab sol lab fa sol fa sol mib do mib sol do8 mib,\mbreak

    %5
    mib(re) r sib fa'16 sol fa sol fa sol fa sol
    fa8 fa, r la fa'16 sol fa sol fa sol fa sol
    fa8 fa, r fa' sib16 do lab sib sol lab fa sol

    %8
    mib fa re mib do re sib do la8 fa' sib,[sol']\mbreak
    re4 do8(sib) sib4 r
    r8 sol'\solo _\markup {\dynamic p "un poco"} sol, sol' r do, re mi

    %11
    fa16(mib) re(mib) fa8 sol16(fa) mib8 mib, r16 mib' sol la
    sib la sib do sib fa re sib sol' lab sol lab fa sol fa sol
    mib do mib sol do8 mib, mib(re) r sol

    %14
    do, do, r la' sib4.(la8)
    la4 r r2\mbreak
    R1*4

    %20
    r4 r8 sib fa'16 sol fa sol fa sol fa sol
    fa8 fa, r sib fa'16 sol fa sol fa sol fa sol
    fa8 fa, r fa' sib16 do lab sib sol lab fa sol

    %23
    mib fa re mib do re sib do la?8 fa r4
    R1\mbreak
    r2 r8 la\p fad la

    %26
    r2 r8 la fad la
    r2 r8 la\solo fad la
    sib16(do) do(re) re2 do4~

    %29
    do sib8 la sol16 sol' fad sol la sib sol la
    fad8 re sol4. fad16 mib fad8. sol16
    sol8\tu\f sol, r16 re' mib fad sol fad sol la sol re sib sol

    %32
    mib' fa mib fa re mib re mib do la do fad la8 do,\mbreak
    do(si) r4 do8 do, r fa'
    mib mib, r4 lab16 sib lab sib sol lab sol lab

    %35
    fa re fa si do8 fa, mib do r4
    r8 si' re si do sol r4
    r8 si re si do sol r4

    %38
    r8 si re si do sol r4
    fa'8 mib re do16 re mib8 re do(sib?)
    lab(do) fa mib re-! re16 re mib8 do\mbreak

    %41
    re re mib2 (re4)~
    re8 do do2 si8 re
    mib16 fa re mib do re sib do lab8 sol' fa mib

    %44
    re16 mib do re sib do lab sib sol8 fa' mib re
    do16 re sib do lab sib sol lab fa8 [mib' re do16 re]
    sol8 sol, r16 do mib fa sol fa sol la sol re si sol

    %47
    mib'8 do r do do16 reb do reb do reb do reb
    do8 lab fa do do'16 reb do reb do reb do reb\mbreak
    do8 lab fa do do'4 do

    %50
    do2. do4
    do1\fermopz

}

IIIvlIIn = \relative do'' {

    mib8 mib, r16 sib' do re mib re mib fa mib sib sol mib\mbreak
    do' reb do reb sib do sib do lab fa lab do fa8 lab,
    lab?(sol) r mib' re re, r fa'~

    %4
    fa mib4 re do8 fa,[la?]
    sib fa r4 r8re' sib re
    r do la do r re sib re

    %7
    r do la do r fa, do do'
    r sib sol sol' do,8.\tr sib32 do re16(do) do(sib)\mbreak
    la8 sib sol la sib4 r

    %10
    R1
    r2 r16 sib do re mib8 mib,
    r2 r8 do' la si\mbreak

    %13
    do do, r4 r2
    R1*6
    r8 re' fa re r do la do

    %21
    r re fa re r do la do
    r re re, re' fa,4 do'8 la
    sib4 sol fa r

    %24
    R1*2
    r8 sib\p re sib r2
    r8 sib re sib la fad re4

    %28
    R1*3
    sol8 fad sol fad sib sol r sib
    sib16(la sol8) sol sol fad8. [fad16 re8 fad]\mbreak

    %33
    sol8 sol, do'[do,] r4 r16 sol' la si
    do si do re do sol mib do lab' si lab si sol lab sol lab
    fa re fa si do8 fa, mib do mib[fa]

    %36
    sol16 lab sol lab sol lab sol lab sol2
    sol16 lab sol lab sol lab sol lab sol2
    sol16 lab sol lab sol lab sol fa mib8 do do' sib

    %39
    lab sol16 la sib8 lab sol16 fa sol8 lab8. sol16
    fa2 fa4 mib8 lab~
    lab lab sol sol fa2

    %42
    mib4(lab) sol2
    sol4 r8 sol fa4 r8 sib
    sib4 r8 sol sol4 r8 sol\mbreak

    %45
    lab4 r8 do si do sol fa~
    fa mib16 re do8 do' re re, r16 si' re si
    do si do re do sol mib do lab'8 fa mi sol

    %48
    r lab do lab r sol mi sol\mbreak
    r lab do lab r sol mi sol
    lab8 sol fa sol lab2~

    %51
    lab4 sol8 fa sol2\fermopz

}

IIIvlan = \relative do' {

    sol'8 lab sib lab sol4 r8 mib
    mib4 r8 mib fa4 r8 re
    sib4 r r8 fa' re4

    %4
    r8 do' lab sib do4 r8 fa,\mbreak
    fa4 r8 fa re4 r8 sib'
    la?4 r8 fa sib,4 r8 sib'

    %7
    la4 r8 do sib4 r8 fa
    sib,4 r8 do fa4 r8 sib,\mbreak
    fa'8 re sol fa fa4 r

    %10
    R1*10
    r4 r8 fa la4 r8 la
    re,4 r8 fa la4 r8 la

    %22
    re,4 r8 fa4 fa8 mib[do]
    sib4 r8 do do4 r
    R1*24

    %48
    fa8 [do] r do[\parenthesize (sol')]mi r mi
    fa[do] r do[(sol')] mi r mi
    fa[fa, lab sib] do[fa,] fa'4~

    %51
    fa mi8[re] mi2\fermopz

}

IIIsopranon = \relative do'' {

    \autoBeamOff

    R1*30
    re8\tu do sib do re re r re16 re
    mib8 mib re re do8. do16 do8 do\mbreak

    %33
    do si do do do do do si
    do do r do16 do do8 do do do
    re8. re16 re8 si mib re do4

    %36
    si8 si re si do sol r4\mbreak
    r8 si re si do sol \parenthesize r4
    r8 si re si do sol r4

    %39
    fa'8 mib re do16 re mib8 re do[(sib?)]
    lab[(do)] fa mib re-! re16 re mib8 do\mbreak
    re re mib2(re4)~

    %42
    re8 do do2 si8 re
    mib16[fa re mib] do [re sib do] lab8[sol' fa mib]
    re16[mib do re] sib[do lab sib] sol8[fa' mib re]\mbreak

    %45
    do16[re sib do] lab[sib sol lab] fa8[mib' re do16 re]
    si8[sol] do2 si4
    do do~do16[reb do reb] do[reb do reb]

    %48
    do2~do16[reb do reb] do[reb do reb]\mbreak
    do2. do4
    do1

    %51
    do\fermopz

}

IIItestoI = \lyricmode {

    Si -- cut si -- cut e -- rat si -- cut e -- rat  in prin -- ci -- pio, _

    et nunc et sem -- per si -- cut si -- cut e -- rat

    si -- cut e -- rat  in prin -- ci -- pio, _

    et nunc et sem -- per et nunc et sem -- per et nunc et sem -- per

    et nunc et sem -- per et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men a -- men a - - - - - - - - - - - - men

    a - - - - men  a -- men.

}

IIIalton = \relative do' {

    \autoBeamOff

    R1*30
    sol'8 fad sol fad sib sol r sib16 sib
    sol8 sol sol sol fad8. fad16 re8 fad\mbreak

    %33
    re re mib mib sol sol sol sol
    sol sol r sol16 sol lab8 lab sol sol
    fa8. fa16 fa8 fa mib8. re16 mib8 fa

    %36
    sol16[lab sol lab] sol[lab sol lab] sol2~
    sol16 [lab sol lab] sol [lab sol lab] sol2
    sol16 [lab sol lab] sol [lab sol fa] mib8 do do' sib

    %39
    lab sol16 la sib8 lab sol16[fa] sol8 lab8. sol16
    fa2 fa4 mib8 lab~\mbreak
    lab8 lab sol sol fa2

    %42
    mib4(lab) sol2
    sol4 r8 sol fa4 r8 sib
    sib4 r8 sol sol4 r8 sol

    %45
    lab4 r8 do si[do] sol fa~
    fa[mib16 re] do8[mib] sol2
    sol4 r r8 fa [mi sol]

    %48
    r lab [do lab] r sol mi [sol]\mbreak
    r lab[do lab] r sol[mi sol]
    lab[sol ]fa [sol] lab2~

    %51
    lab4 sol8 [fa] sol2\fermopz

}

IIItestoII = \lyricmode {

    Si -- cut si -- cut e -- rat si -- cut e -- rat  in prin -- ci -- pio, _

    et nunc et sem -- per si -- cut si -- cut e -- rat

    si -- cut e -- rat  in prin -- ci -- pio, _

    et nunc et nunc  et sem - - - - - - - per

    et in sæ -- cula _ sæ -- cu -- lo -- rum

    sæ -- cu -- lo - rum sæ -- cu -- lo -- rum a - - men a  - - men

    a - - men  a - men a - - men a - - - - - - men a - men.

}

IIItenoren = \relative do' {

    \autoBeamOff

    R1*8
    r2 r4 r8 sib
    mib16[re mib fa] mib[sib do reb] do[reb do reb] sib[do sib do]

    %11
    lab[sol fa sol] lab8[sib16 lab] sol8[mib] r mib'(
    re16)[do re mib] fa4. mib4 re8~
    re do4 sib16[la] sib8[re] do sib

    %14
    la[sol] fa mib' re4. do8
    do4 r fa4. mib8
    re8. do16 re4 mib16[fa re mib] do[re sib do]\mbreak

    %17
    la8[sol' fa mib] re16[mib do re] sib[do la sib]
    sol8[fa' mib re] do16[re sib do] la[sib sol la]
    fa8[mib' re do] re16[do sib8] do4

    %20
    sib r r2\mbreak
    R1*2
    r2 r4 fa'8 mib

    %24
    re16[do] re8 mib re do8. do16 re8 do\mbreak
    sib4 do re16[(mib) re(mib)] re[(mib) re(mib)](
    re2)~re16[mib re mib] re[mib re mib]

    %27
    re2~re16[mib re mib] re[mib re do]
    sib8 sol sol' fa mib re16 mib fa8 mib
    re16[do] re8 mib re do2~

    %30
    do4 sib la2\tr
    sol4 re'8 do sib sib r sib16 sib
    do8 do sol sol la8. la16 la8 la\mbreak

    %33
    sol sol sol sol mib' re do re
    mib mib r do16 do fa8 fa mib mib
    re8. do16 si8 sol do sib? lab4

    %36
    sol2 r8 mib' sol mib
    re re r4 r8 mib sol mib
    re re r4 r8 mib do4

    %39
    r8 do sib4 r8 sib fa' fa,
    fa' mib re re16 re re8 re do fa\mbreak
    fa4 mib r2

    %42
    r4 fa8 mib re re re4
    do8 sol mib'4 r8 do re4
    r8 re mib4 r8 sib do4

    %45
    r8 do do4 r8 do re4~
    re mib re2
    do4 r r r8 mi

    %48
    fa [do] r do[\parenthesize (sol')] mi r mi
    fa [do] r do[ (sol')] mi r mi
    fa[fa, lab sib] do[fa,] fa'4~

    %51
    fa mi8[re] mi2\fermopz

}

IIItestoIII = \lyricmode {

    Glo - - - - - ri -- a glo - - - - - - ria _ Pa -- tri  et Fi -- li -- o

    et Spi -- ri -- tui _ San - - - - - - - - - - cto.

    Si -- cut e -- rat in prin -- ci -- pio, _

    et nunc et sem - - - - - per

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men.

    Si -- cut e -- rat si -- cut e -- rat in prin -- ci -- pio, _

    et nunc et sem -- per, si -- cut si -- cut e -- rat

    si -- cut e -- rat in prin -- ci -- pio, _

    et nunc et sem -- per et nunc et sem -- per et nunc et sem -- per

    et nunc et nunc et sem -- per et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men,

    sæ -- cu -- lo -- rum a -- men a - - men  a - - men a -- men a - men a -- men

    a  - - men a - - men a - - - - men.

}

IIIbasson = \relative do {

    \autoBeamOff

    R1*30
    sol'8 la sib la sol sol, r sol'16 sol
    do8 do sib sib la la fad re\mbreak

    %33
    sol8. fa16 mib8 do do' re mib re
    do8 do, r4 r2
    R1

    %36
    r4 r8 sol'16 sol do [re do re] do[re do re]\mbreak
    si8 sol r sol do16 [re do re] do[re do re]
    si8 sol r sol do,4 r8 do

    %39
    fa4 r8 sib mib mib, r4
    r re'8 do si la16 si do8 lab \mbreak
    sib4 mib, sib' si

    %42
    do fa, sol2
    do,4 r8 do fa16 [sol mib fa] re [mib do re]
    sib8 [lab' sol fa] mib16 [fa re mib] do [re sib do]
    lab8 [sol' fa mib] re16[ mib do re] si [do la si]

    %46
    sol8 [sol' mib do] sol2
    do4 r r r8 do
    fa16 [sol fa sol] fa [sol fa sol ] mi8 do r do\mbreak

    %49
    fa16 [sol fa sol] fa [sol fa sol] mi4 do
    fa1
    do\fermata

}

IIItestoIV = \lyricmode {

    Si -- cut si -- cut e -- rat si -- cut e -- rat  in prin -- ci -- pio, _

    et nunc et sem -- per si -- cut si -- cut e -- rat

    nunc et sem - - per et sem - - per et nunc et nunc et sem -- per

    et in sæ -- cula _ sæ -- cu -- lo -- rum a - -  men a -- men

    a - - - - - - - - - - men a - - - men a - - - men a -- men.

}

IIIbcn = \relative do {

    mib8\solo fa sol fa mib4 r8 mib
    la4 sol fa8 mib re sib
    mib, mib' re do sib4 r8 sib

    %4
    mib do re[sol]do, do' la fa\mbreak
    sib16 do sib do sib do sib do sib8 sib, r sib
    fa'16 sol fa sol fa sol fa mib re8 sib\noBeam r sib

    %7
    fa'16 sol fa sol fa sol fa mib re4 mib8 fa
    sol16 la sib8 mib, mi fa mib re mib\mbreak
    fa sol mib fa sib, sib'16 lab sol8 fa

    %10
    mib4 r8 mib lab4 sol
    fa r8 re mib8 re do4
    sib re mib8 do re sol\mbreak

    %13
    do, do' la fa sib4 mib,
    fa8 mib re do sib sib'16 la sib8 sib,
    fa'16 sol fa sol fa sol fa mib re8 sib r fa'

    %16
    sol sol, r sol' do sib la sol\mbreak
    fa(mib) re fa sib la sol fa
    mib re do sib la' sol fa mib

    %19
    re do sib fa' sib re, mib fa
    sib16\f do sib do sib do sib do la8 fa r fa\mbreak
    sib16 do sib do sib do sib do la8 fa r fa

    %22
    sib16 do sib do sib do sib do re8 re, mib[fa]
    sol16 la sib8 mib, mi fa sol la fa
    sib la sol16 fad sol8 la sol fad8. fad16\mbreak

    %25
    sol8 fa? mib4 re\parenthesize r
    sol16 la sol la sol la sol la fad8 re r re
    sol16 la sol la sol la sol la fad8 re r fad

    %28
    sol la sib si do si lab la
    sib la sol fa mib re do mib
    re4 mib8 re do la re [re,]

    %31
    sol'\tu la sib la sol sol, r sol'
    do4 sib la8 la fad re\mbreak
    sol8. fa16 mib8 do do' re mib re

    %34
    do do,\clef tenor \key sib\major \parenthesize r8 do' \noBeam fa4 mib
    re8 do si sol do sib lab4
    sol\clef bass \key sib\major r8 sol do16 re do re do re do re

    %37
    si8 sol r sol do16 re do re do re do re
    si8 sol r sol do,4 r8 do
    fa4 r8 sib mib mib, r4

    %40
    \clef tenor \key sib\major fa'8 mib \clef bass \key sib\major re [do] si la16 si do8 lab\mbreak
    sib4 mib, sib' si
    do fa, sol2

    %43
    do,4 r8 do fa16 sol mib fa re mib do re
    sib8 lab' sol fa mib16 fa re mib do re sib do
    lab8 sol' fa mib re16 mib do re si do la si

    %46
    sol8 sol' mib do sol2
    do4 r r r8 do
    fa16 sol fa sol fa sol fa sol mi8 do r do\mbreak

    %49
    fa16 sol fa sol fa sol fa sol mi4 do
    fa1
    do_\fermata

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s4 <5> <_->4 <6 5->
    <4->8 <3> s4 s2
    <9>8 <3> <9> <7 3> <9> <8> <6>4
    s1
    s2 <6>
    s <6>4 <6>
    <6>8 <5> \bassFigureExtendersOn <6>8 <6> <5 3> <5 3> <6>16 s <6 5>16 s
    <6>8 <6>16 s <6>8 <5 4> s4 <6>16 s <6 _-> s
    \bassFigureExtendersOff s2 s4 <5>8 <6!>
    <_->4 s8 <6> s4 <5>8 <6>
    s4 <6> <9>8 <3> <9 5> <_!>
    <9> <8> \bassFigureExtendersOn <6 _ 5> <_>  <4> <3> <6>4
    \bassFigureExtendersOff s4 <6>8 <6> s2
    s <6>
    <5>4 s \bassFigureExtendersOn <5>8 <5> <6> <6>16 s
    <6>8 <6>16 s <6>8 <5>16 s <5>8 <5>16 s <5>8 <5>16 s
    <5>8 <5>16 s <5>8 <5>16 s <6>8 <6> <5> <5>
    <6> s <5>16 s <5 3>8 s4 <6>8 <6>
    s2 <6>
    s <6>
    s <6>8 s <6> <5>
    s4 <6>8 <6> s2
    s4 <6> 8 s <6\\> <6\\> <6>4
    s <6> <_+> s
    s2 <6>8 <_+> s <_+>
    s2 <6>8 <_+> s <_+>
    s4 <6>8 <6> s4 <6>16 s <6 5>8
    <9>4 <6 3>8 s <6>4 <6>
    <7 _+> <5> <6 4> <_+>
    s8 <6\\> <6> <6\\> s2
    s4 <6> <6\\> <6>8 <_+>
    <4>8 s16 <_!> <6>4 <5 3>8 <5 3> <6> <6!>
    s2 <_->4 <6>
    <6\\>8 <6\\> <6>8 <_!> s4 <7>8 <6>
    <_!>4 s8 <_!> s2
    <6>8 <3> s <3> s2
    s8 <_!> s <_!> s2
    <3->4 s8 <7-> s2
    <_->8 <_-> <6\\>4 <8>8 <6 5> s <6>
    <7->4 s  <5 4> <5 3>
    <9>8 <8> <5 _->4 <4>4 <_!>
    s2 <5 _->8 <5 _-> <6 3> <6 3>16 s
    <5 3>8 <5 3> <6> <6> <5 3> <5 3>16 s <5 3>8 <5 3>16 s
    <5 3>8 <5 3>16 s <5 _->8 <5 _-> <6\\> <8> <6 3> 16 s <6 3>8
    <7 _!>4 <6> <4> <_!>
    s2 s4 s8 <_!>
    <_->2 s8 <6\\> s <_!>
    <_->2 <6>4 < _!>
    <5->1
    <6- 4>4 <5 3>8 <4 2> <5 _!>2

}


forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 55
    s1*51
    \bar "|."

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

IIIsoprano = {
    \new Voice = "gloria1"
    <<\IIIsopranon \forma>>
}

IIIalto = {
    \new Voice = "gloria2"
    <<\IIIalton \forma>>
}

IIItenore = {
    \new Voice = "gloria3"
    <<\IIItenoren \forma>>
}

IIIbasso = {
    \clef bass
    \new Voice = "gloria4"
    <<\IIIbasson \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
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
        subtitle = \markup "De profundis [ZWV 96]"
        composer = \markup {"J. D. Zelenka (1679-1745)"}
    }

    \markup \huge {[1.] Andante}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"V[iolino] 1."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"V[iolino] 2."}
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
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bas"
                \Ibasso \global
                \new Lyrics \lyricsto "profundis4" \ItestoIV
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

}

\bookpart {

    \paper {
        systems-per-page = #2
    }

    \markup \huge {[2.] Andante}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino 1.]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \IIvlI\global
                    >>

                    \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino 2.]"}
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
                    \incipit { \clef soprano \key fa\major \time 3/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r2 r re''2^\markup\center-align "[Soprano]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "sop"
                    \IIsoprano \global
                    \new Lyrics \lyricsto "anima1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major \time 3/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1. r2 r2 sol'2^\markup\center-align "[Contralto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "alt"
                    \IIalto \global
                    \new Lyrics \lyricsto "anima2" \IItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major \time 3/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1 r1 r2 r re'^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "ten"
                    \IItenore \global
                    \new Lyrics \lyricsto "anima3" \IItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"voice oohs"
                   \set Staff.shortInstrumentName = "bas"
                    \IIbasso \global
                    \new Lyrics \lyricsto "anima4" \IItestoIV
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

    \pageBreak

    \markup \huge {[3.] Gloria. Allegro}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino 1.]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl1"
                        \IIIvlI\global
                    >>

                    \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino 2.]"}
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.shortInstrumentName = "vl2"
                        \IIIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \IIIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key sib\major \time 4/4 r1*30 re''8^\markup\center-align "[Soprano]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "sop"
                    \IIIsoprano \global
                    \new Lyrics \lyricsto "gloria1" \IIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key sib\major \time 4/4 r1*30 sol'8^\markup\center-align "[Contralto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "alt"
                    \IIIalto \global
                    \new Lyrics \lyricsto "gloria2" \IIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key sib\major \time 4/4 r1*8 r2 r4 r8 sib^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \set Staff.shortInstrumentName = "ten"
                    \IIItenore \global
                    \new Lyrics \lyricsto "gloria3" \IIItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"voice oohs"
                   \set Staff.shortInstrumentName = "bas"
                    \IIIbasso \global
                    \new Lyrics \lyricsto "gloria4" \IIItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
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

