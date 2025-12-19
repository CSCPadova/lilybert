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
    \tupletSpan 4 \con
}

IobIn = \transpose mib sol,
\relative do'' {
    \key mib\major

    sol'16(fa) sol8 r4 r8 sib16 lab sol8 fa16 mib
    fa(mib) fa8 r4 r8 sib\noBeam fa8 sol16 lab
    sol16(fa) sol8 sol16(fa) sol8 sol16(fa) sol8 r4

    %4
    sol8 lab16 sib lab8 sol fa4 r\mbreak
    r8 sib fa sol fa4 r
    r8 mib16 fa sol8 fa16 mib fa8 fa16 sol lab8 sol16 fa

    %7
    sol8 lab16 sib lab8 sol sol fa r4
    mib1~
    mib~\mbreak

    %10
    mib2~mib8 mib sib [do]
    sib mib sib[do] sib4 r
    r2 r8 sol' sol sol

    %13
    fa16 mib fa sol fa sol fa sol mib re mib fa mib fa mib fa
    re mib re mib fa mib re mib do sib lab sib do re mib do\mbreak
    re8.-+ do32 re mib8.-+ re32 mib fa8.-+ mib32 fa sol8.-+ fa32 sol

    %16
    la8 mib r16 mib re do re8 sib' re, do16 sib
    sib4 r r2
    R1

    %19
    sib16 la sib do sib do la sib do sib do re do re sib do\mbreak
    re do re mib re mib do re mib re mib fa mib fa re mib
    fa mib re mib fa sol lab! fa sol lab sib do lab sib sol lab

    %22
    fa8 lab16 sol lab4 r8 lab16 sol lab4
    r8 do sib lab sol4 r8 sol\mbreak
    fa sol lab sol16 fa sol8 fa r4

    %25
    sol16(fa) sol8 r4 r8 sib16 lab sol8 fa16 mib
    fa(mib) fa8 r4 r8 sib\noBeam fa sol16 lab
    sol16(fa) sol8 sol16(fa) sol8 sol16(fa) sol8 r4

    %28
    sol8 lab16 sib lab8 sol fa4 r\mbreak
    r8 sib fa sol fa fa fa fa
    mib mib mib re mib2~

    %31
    mib1~
    mib8 do'16 sib lab8 sol sol fa r4\mbreak
    r2 r8 fa16 lab sol8 sib

    %34
    r2 r8 lab16 sib lab8 do
    r8 sol16 lab sol8 sib r8 fa16 sol fa8 lab
    sol16(mib) fa8 fa4-+ mib2~

    %37
    mib1~\mbreak
    mib8 do'16 sib lab sol fa mib re do re mib re mib do re
    mib re mib fa mib fa re mib fa mib fa sol fa sol mib fa

    %40
    sol8 fa r sib sol16(mib) fa8 fa4-+
    mib8 sib' sib,[re] mib2

}

IobIIn = \transpose mib sol,
\relative do'' {
    \key mib\major

    sib16(lab) sib8 r4 r8 sol16 lab sib8[sib]
    sib sib r4 r8 sib sib sib
    mib16(re) mib8 mib16(re) mib8 mib16(re) mib8 r4

    %4
    mib8 fa16 sol fa8 mib re4 r\mbreak
    r8 sib16 do re8 mib re4 r
    r8 do16 re mib8 re16 do re8 re16 mib fa8 mib16 re

    %7
    mib8 fa16 sol fa8 mib mib re r4
    mib1~
    mib~\mbreak

    %10
    mib2~mib8 mib,16 fa sol8 lab
    sol mib16 fa sol8 lab sol4 r
    r2 r8 mib' mib mib

    %13
    re16 do re mib re mib re mib do sib do re do re do re
    sib do sib do re do sib do lab sol fa sol lab sib do lab\mbreak
    sib2~sib8 sib sib[mib]

    %16
    mib16(re) mib8 r16 la, sib do sib8 sib sib[la]
    sib4 r r2
    R1*2\mbreak

    %20
    sib16 la sib do sib do la sib do sib do re do re sib do
    re do sib do re mib fa re mib fa sol lab! fa sol mib fa
    re8 re16 mib fa4 r8 re16 mib fa4

    %23
    r8 lab sol fa mib4 r8 mib\mbreak
    re mib fa mib16 re mib8 re r4
    sib16(lab) sib8 r4 r8 sol16(lab) sib8 sib

    %26
    sib sib r4 r8 sib sib sib
    mib16(re) mib8 mib16(re) mib8 mib16(re) mib8 r4\mbreak
    mib8 fa16 sol fa8 mib re4 r

    %29
    r8 sib16 do re8 mib re re re re
    mib mib mib re mib2~
    mib1~

    %32
    mib8 mib16 sol fa8 mib mib re r4\mbreak
    r2 r8 re16 fa mib8 sol
    r2 r8 fa16 sol fa8 lab

    %35
    r8 mib16 fa mib8 sol r8 re16 mib re8 fa
    mib8 mib re4-+ mib2~
    mib1~\mbreak

    %38
    mib8 do do[do] sib2~
    sib~sib4. fa'8
    mib re r fa mib mib re[re]

    %41
    mib4 r8 fa, sol2

}

IvlaIn = \relative do' {

    r8 re si' si si re16 do si8 la16 sol
    la8 re, la' la la re la si16 do

    %3
    si4 r si16(la) si8 si16(la) si8
    si16(la) si8 r4 r8 re la si\mbreak
    la4 r r8 fad16 sol la8 sol16 fad

    %6
    sol4 r r8 la16 si do8 si16 la
    si8 do16 re do8 si si la r4
    r2 r8 si re16(do) re8

    %9
    r2 r8 si re16(do) re8\mbreak
    r2 r8 sol,, sol sol
    sol sol sol sol sol sol' re[mi]

    %12
    re sol re[mi] re si' si si
    la16 sol la si la si la si sol fad sol la sol la sol la
    fad sol fad sol la sol fad sol mi re do re mi fad sol mi\mbreak

    %15
    fad8.-+ mi32 fad sol8.-+ fad32 sol la8.-+ sol32 la si8.-+ la32 si
    dod8 sol r16 sol fad mi fad8 re' fad, mi16 re
    re4 r r2

    %18
    R1*3
    la'16 sol fad sol la si do la si do re mi do re si do
    la4 r8 do16 si do4 r8 do16 si

    %23
    do4 r r8 re do si\mbreak
    la si do si16 la si8 la r4
    r8 re, si' si si re16 do si8 la16 sol

    %26
    la8 re, la' la la re la si16 do
    si4 r si16(la) si8 si16(la) si8\mbreak
    si16(la) si8 r4 r8 re la si

    %29
    la4 r r2
    R1*3
    fad8.-+ mi32 fad sol8.-+ fad32 sol la8 re r si

    %34
    do8.-+ si32 do do8.-+ si32 do do8 mi r do
    si re r si la do r do
    si16(sol) la8 la4-+ sol r

    %37
    sol8 sol16(la) fa8 fa16(sol) mi8 mi16(fa) re8 re16(mi)\mbreak
    do8 mi'16 re do si la sol fad! mi fad sol fad sol mi fad
    sol fad sol la sol la fad sol la sol la si la si sol la

    %40
    si8 la r re\noBeam si16(sol) la8 la4-+
    sol8 re' re,[fad] sol2

}

IvlaIIn = \relative do' {

    r8 si re re re si16 do re8 re
    re la re re re la' la[re,]
    re4 r sol16(fad) sol8 sol16(fad) sol8

    %4
    sol16(fad) sol8 r4 r8 re16 mi fad8[sol]\mbreak
    fad4 r r8 re16 mi fad8 mi16 re
    mi4 r r8 fad16 sol la8 sol16 fad

    %7
    sol8 la16 si la8 sol sol fad r4  %%% OOKK
    r2 r8 sol si16(la) si8
    r2 r8 sol si16(la) si8\mbreak

    %10
    r2 r8 sol, sol sol
    sol sol sol sol sol sol16 la si8 do
    si8 sol16 la si8 do si sol' sol sol

    %13
    fad16 mi fad sol fad sol fad sol mi re mi fad mi fad mi fad
    re mi re mi fad mi re mi do si la si do re mi do\mbreak
    re8 re re re re re re sol

    %16
    sol dod, r la la la la [dod]
    fad,4 r r2
    R1*3

    %21
    fad'16 mi re mi fad sol la fad sol la si do la si sol la
    fad4 r8 fad16 sol fad4 r8 fad16 sol
    fad4 r r8 si la sol\mbreak

    %24
    fad sol la sol16 fad sol8 fad r4
    r8 si, re re re si16 do re8 re
    re la re re re la' la re,

    %27
    re4 r sol16(fad) sol8 sol16(fad) sol8\mbreak
    sol16(fad) sol8 r4 r8 re16(mi) fad8 sol
    fad4 r r2

    %30
    R1*3
    la,8 la sol[sol] re' fad r re
    do do mi[mi] re la' r fad

    %35
    sol si r sol fad la r fad
    sol sol fad4-+ sol8 sol16(la) fa8 fa16(sol)
    mi8 mi16(fa) re8 re16(mi) do8 do16(re) si8 si16(do)\mbreak

    %38
    la4 r8 la la la r la
    sol sol r sol re' re r re
    re re r re re mi re4

    %41
    si r8 la si2

}

IfgIn = \relative do {

    sol'8 sol sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad
    sol sol fad fad mi mi re re

    %4
    do do do do re8 re' re,[re']\mbreak
    re,[re'] re,[re'] re,[re'] re,[re']
    re,[re'] re,[re'] re,[re'] re, re

    %7
    sol sol fad[sol] re re r4
    si'16 la si8 do16 si do8 re16 do re8 r re
    mi re mi16 re do8 re16 do re8 r re\mbreak

    %10
    mi re mi16 re do8 re16 do re8 r4
    r2 r8 sol, sol sol
    sol sol sol sol sol sol, si sol

    %13
    re' re r re la' la r la,
    re re fad,[sol] la la' r la,\mbreak
    re re mi mi fad fad sol sol

    %16
    la la, r16 la si dod re8 fad la[la,]
    re16 dod re mi re mi dod re mi re mi fad mi fad re mi
    fad mi fad sol fad sol mi fad sol fad sol la sol la fad sol

    %19
    la8 fad la[la] la la la la\mbreak
    la re re,[re] re re' re,[re]
    re re re re sol, sol' fad sol

    %22
    re la' fad la re, la' fad la
    re, re' r re re, re' r re\mbreak
    re, re' re re sol, re'16 mi re do si la

    %25
    sol8 sol sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad
    sol sol fad fad mi mi re re\mbreak

    %28
    do do do do re4 r
    R1
    re'16 do re mi re mi do re si la si do si do la si

    %31
    sol fa sol la sol la fa sol mi re mi fa mi fa re mi
    do8 do do do re re' la fad\mbreak
    re re mi[mi] fad re sol,[sol']

    %34
    la la sol[sol] fad fad re[re]
    re' re re,[re] re' re re,[re]
    sol do, re[re,] sol4 r

    %37
    R1
    r8 do la do re16 do re mi re mi do re
    mi re mi fad mi fad re mi fad mi fad sol fad sol mi fad

    %40
    sol8 re r fad sol do, re[do]
    si4 r8 re sol,2

}

IfgIIn = \relative do {

    sol'8 sol sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad
    sol sol fad fad mi mi re re

    %4
    do do do do re8 re' re,[re']\mbreak
    re,[re'] re,[re'] re,[re'] re,[re']
    re,[re'] re,[re'] re,[re'] re, re

    %7
    sol sol fad[sol] re re r4
    sol16 fad sol8 la16 sol la8 si16 la si8 r si
    do si do16 si la8 si16 la si8 r si\mbreak

    %10
    do si do16 si la8 si16 la si8 r4
    r2 r8 sol, sol sol
    sol sol sol sol sol sol si sol

    %13
    re' re r re la' la r la,
    re re fad,[sol] la la' r la,\mbreak
    re re mi mi fad fad sol sol

    %16
    la la, r16 la si dod re8 fad la[la,]
    re4 r r2
    re16 dod re mi re mi dod re mi re mi fad  mi fad re mi

    %19
    fad8 re fad[fad] dod dod dod dod\mbreak
    re re' re,[re] re re' re,[re]
    re re re re sol, sol' fad sol

    %22
    re la' fad la re, la' fad la
    re, re' r re re, re' r re\mbreak
    re, re' re re sol, re'16 mi re do si la

    %25
    sol8 sol sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad
    sol sol fad fad mi mi re re\mbreak

    %28
    do do do do re4 r
    r2 re'16 do re mi re mi do re
    si la si do si do la si sol fad sol la sol la fad sol

    %31
    mi re mi fa mi fa re mi do si do re do re si do
    la8 do do do re re' la fad\mbreak
    re re mi[mi] fad re sol,[sol']

    %34
    la la sol[sol] fad fad re[re]
    re' re re,[re] re' re re,[re]
    sol do, re[re,] sol4 r

    %37
    R1
    r8 do la do re16 do re mi re mi do re
    mi re mi fad mi fad re mi fad mi fad sol fad sol mi fad

    %40
    sol8 re r fad sol do, re[do]
    si4 r8 re sol,2

}


Ibcn = \relative do {


    sol'8 sol sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad
    sol sol fad fad mi mi re re

    %4
    do do do do re2~\mbreak
    re1~
    re2~re8 re re re

    %7
    sol, sol' fad[sol] re re, r4
    sol'8 sol sol sol sol sol r sol
    sol, sol' sol sol sol sol r sol\mbreak

    %10
    sol, sol' sol sol sol sol r4
    R1
    r2 r8 sol, si sol

    %13
    re' re r re la' la r la,
    re re fad,[sol] la la' r la,\mbreak
    re re mi mi fad fad sol sol

    %16
    la la, r16 la si dod re8 fad la[la,]
    re re, r re' dod si dod la
    re4 r r2

    %19
    R1*2
    re8 re re re sol, sol' fad sol
    re la' fad la re, la' fad la

    %23
    re, re' r re re, re' r re\mbreak
    re, re' re re sol, re'16 mi re do si la
    sol8 sol sol sol sol sol sol sol

    %26
    fad fad fad fad fad fad fad fad
    sol sol fad fad mi mi re re\mbreak
    do do do do re re' re,[re']

    %29
    re,[re'] re,[re'] re,4 r
    R1*2
    r2 r8 re' la fad\mbreak
    re re mi[mi] fad re sol,[sol']

    %34
    la la sol[sol] fad fad re[re]
    re' re re,[re] re' re re,[re]
    sol do, re[re,] sol4 r

    %37
    R1
    r8 do la do re16 do re mi re mi do re
    mi re mi fad mi fad re mi fad mi fad sol fad sol mi fad

    %40
    sol8 re r fad sol do, re[do]
    si4 r8 re sol,2

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 4/4
    \tempo 4 = 70
    s1*41
    \bar"|."

}

IobI = {
    \Iglobal
    \notypeset
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

}

IvlaI = {
    \Iglobal
    \clef alto
    <<\IvlaIn \forma>>

}

IvlaII = {
    \Iglobal
    \clef alto
    <<\IvlaIIn \forma>>

}

IfgI = {
    \Iglobal
    \clef bass
    <<\IfgIn \forma>>

}

IfgII = {
    \Iglobal
    \clef bass
    <<\IfgIIn \forma>>

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
		\tupletSpan 4 \con
			}

IIobIn = \transpose mib sol,
\relative do'' {
    \key mib\major

    mib8 re mib2
    sol8 re mib2
    do'4 sib lab

    %4
    sol8 mib fa2
    sol8 fa sol[fa] mib fa16 sol
    fa8 mib fa[mib] re mib16 fa

    %7
    mib8 re mib[re] do re16 mib
    re4 r r
    r8 do re mib fa sol\mbreak

    %10
    lab4 r r
    r8 do,\p re mib fa sol
    lab\f sol lab2

    %13
    sol8 do la4.-+ sib8
    sib2.
    fa8 mib re[mib] fa sol

    %16
    fa4 sol8 fa mib[re]
    mib fa sol[lab?] fa mib
    re lab' sol[fa] mib re\mbreak

    %19
    mib8 sol16 fa mib8[re] mib fa
    mib4 do'2
    re,8 fa16 mib re8 do re[mib]

    %22
    re4 sib'2
    do,8 mi sol[sib] la sol
    la[sol] fa mib? re[do]

    %25
    sib8. do32 re mib4 do
    sib2.
    R2.*4\mbreak

    %31
    mib8 re mib2
    sol8 re mib2
    do'4 sib lab

    %34
    sol8 mib fa2
    sol8 fa mib[fa] sol fa16 mib
    lab8 sol fa[sol] lab sol16 fa

    %37
    sib8 lab16 sol lab8 fa sol[lab]
    fa mib fa[sol] lab fa
    sol4 r r

    %40
    r8 mib\p fa sol lab fa
    sol4 r r
    reb8\parenthesize \f do reb2

    %43
    do8 fa re!4.-+ mib8
    mib2.

}

IIobIIn = \transpose mib sol,
\relative do'' {
    \key mib\major

    sol8 fa sol2
    mib8 fa sol2
    lab4 sib sib

    %4
    sib8 mib re2
    mib8 re mib[re] do re16 mib
    re8 do re[do] sib do16 re

    %7
    do8 sib do[sib]la sib16 do
    sib4 r r
    r8 la sib do re mib\mbreak

    %10
    fa4 r r
    r8 la,\p sib do re mib
    fa8\f mib fa2

    %13
    mib8 sol do,4.\parenthesize -+ re8
    re2.
    re8 do sib[do] re mib

    %16
    re4 mib8 re do[si]
    do re mib[fa] re[do]
    si fa' mib[re] do si\mbreak

    %19
    do mib16 re do8[si] do re
    do2 la4
    sib8 re16 do sib8[la] sib do

    %22
    sib2 re4
    do4 do8 sol' fa[mi]
    fa[mib!] re do sib[la]

    %25
    sib8. la32 sib do4 la
    sib2.
    R2.*4\mbreak

    %31
    sol8 fa sol2
    mib8 fa sol2
    lab4 sib sib

    %34
    sib8 mib re2
    mib8 re do[re] mib re16 do
    fa8 mib re[mib] fa mib16 re

    %37
    sol8 fa16 mib fa8[re] mib fa
    mib sol, lab[sib] do re\mbreak
    mib4 r r

    %40
    r8 sol,\p lab sib do re
    mib4 r r
    sib8\parenthesize \f lab sib4 sol

    %43
    lab8 lab fa4.\parenthesize -+ sol8
    sol2.

}

IIvlaIn = \relative do' {

    sol'8 fad sol2
    si8 fad sol2
    mi'8 sol, re' [sol,] do re,

    %4
    si' sol la2
    si8 la si[la] sol la16 si
    la8[sol] la sol fad8 sol16 la

    %7
    sol8 fad sol[fad] mi fad16 sol
    fad8 re' do[si] la sol
    fad4 r r\mbreak

    %10
    r8 re'\p do si la sol
    fad4 r r
    do'8\f si do2

    %13
    si8 mi dod4. re8
    re2.
    re,2 do!4

    %16
    si2 si4
    mi sol, la
    si2 si4\mbreak

    %19
    sol'8 si16 la sol8[fad] sol la
    sol4 mi'2
    fad,8 la16 sol fad8[mi] fad sol

    %22
    fad4 re'2
    mi,8 sold si[re] dod si
    dod si la[sol] fad mi

    %25
    re8. mi32 fad sol4 mi
    re2.
    R2.*4\mbreak

    %31
    sol8 fad sol2
    si8 fad sol2
    mi'8 sol, re'[sol,] do re,

    %34
    si' sol la2
    si8 la sol[la] si la16 sol
    do8 si la[si] do si16 la

    %37
    re8 do16 si do8[la] si do
    si4 r r\mbreak
    r8 la si do re mi

    %40
    re4 r r
    r8 la\p si do re mi
    fa,8\f mi fa2

    %43
    mi8 la fad!4.-+ sol8
    sol2.

}

IIvlaIIn = \relative do' {

    si8 la si2
    sol8 la si2
    do4 re re

    %4
    re8 sol fad2
    sol8 fad sol[fad] mi fad16 sol
    fad8 mi fad[mi] re mi16 fad

    %7
    mi8 re mi[re] dod re16 mi
    re8 fad la[sol] fad mi
    re4 r r\mbreak

    %10
    r8 si'\p la sol fad mi
    re4 r r
    fad8\f sol fad2

    %13
    re8 sol mi4.-+ fad8
    fad2.
    re2 do!4

    %16
    si2 si4
    mi sol, la
    si2 si4\mbreak

    %19
    si mi8 [red] mi fad
    mi2 dod4
    re8 fad16 mi re8 [dod] re mi

    %22
    re2 fad4
    si, mi mi
    mi8 sol fad[mi] re dod

    %25
    re4 si la
    fad2.
    R2.*4\mbreak

    %31
    si8 la si2
    sol8 la si2
    do4 re re

    %34
    re8 sol fad2
    sol8 fad mi[fad] sol fad16 mi
    la8 sol fad[sol] la sol16 fad

    %37
    si8 la16 sol la8[fad] sol la
    sol4 r r\mbreak
    r8 fad sol la si do

    %40
    si4 r r
    r8 fad\p sol la si do
    sol,2\f sol4

    %43
    sol8 do la4.-+ si8
    si2.

}

IIfgIn = \relative do {

    sol'2 fad4
    mi2 re4
    do si fad'

    %4
    sol re re,
    sol'2 do4
    fad,2 si4

    %7
    mi,2 la4
    re,4 r r
    re r r\mbreak

    %10
    re\p r r
    re r r
    re'\f re re,

    %13
    sol8 mi la4 la,
    re la re,
    R2.*4

    %19
    mi'2 re4
    dod2 la4
    re2 dod4

    %22
    si2 la4
    sold2 mi4
    la2 la4

    %25
    si sol la
    re la fad
    la'16 si do8 do la do la

    %28
    do mi do4 la
    si8 re si la16 si do8 si
    la mi' re [do] si[la]\mbreak

    %31
    sol2 fad4
    mi2 re4
    do si fad'

    %34
    sol re' re,
    sol do si
    la re do

    %37
    si fad re
    sol4 r r\mbreak
    sol r r

    %40
    sol\p r r
    sol r r
    si,2\f sol4

    %43
    do8 la re4 re,
    sol2.

}

IIfgIIn = \relative do {

    sol'2 fad4
    mi2 re4
    do si fad'

    %4
    sol re re,
    sol'2 do4
    fad,2 si4

    %7
    mi,2 la4
    re,4 r r
    re r r\mbreak

    %10
    re\p r r
    re r r
    re'\f re re,

    %13
    sol8 mi la4 la,
    re la re,
    R2.*4

    %19
    mi'2 re4
    dod2 la4
    re2 dod4

    %22
    si2 la4
    sold2 mi4
    la2 la4

    %25
    si sol la
    re la fad
    fad'16 sol la8 la sol la sol

    %28
    la do la4 fad
    sol8 si sol fad16 sol la8 sol
    fad do' si[la]sol fad

    %31
    sol2 fad4
    mi2 re4
    do si fad'

    %34
    sol re' re,
    sol do si
    la re do

    %37
    si fad re
    sol4 r r\mbreak
    sol r r

    %40
    sol\p r r
    sol r r
    si,2\f sol4

    %43
    do8 la re4 re,
    sol2.

}


IIbcn = \relative do {

    sol'2 fad4
    mi2 re4
    do si fad'

    %4
    sol re re,
    sol'2 do4
    fad,2 si4

    %7
    mi,2 la4
    re,2.~
    re~\mbreak

    %10
    re\p~
    re
    re'4\f re re,

    %13
    sol8 mi la4 la,
    re la re,
    R2.*4

    %19
    mi'2 re4
    dod2 la4
    re2 dod4

    %22
    si2 la4
    sold2 mi4
    la2 la4

    %25
    si sol la
    re la fad
    re re re

    %28
    re re re
    re re re
    re2 r4

    %31
    sol'2 fad4
    mi2 re4
    do si fad'

    %34
    sol re' re,
    sol do si
    la re do

    %37
    si fad re
    sol,2.~\mbreak
    sol~

    %40
    sol\p(
    si)
    si2\f sol4

    %43
    do8 la re4 re,
    sol2.

}

IIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\time 3/4
\tempo 2 = 55
s2.*14
\bar":..:"\break
s2.*30
\bar":|."

}

IIobI = {
	\IIglobal
	\notypeset
	<<\IIobIn \forma>>

}

IIobII = {
	\IIglobal
	<<\IIobIIn \forma>>

}

IIvlaI = {
	\IIglobal
	\clef alto
	<<\IIvlaIn \forma>>

}

IIvlaII = {
	\IIglobal
	\clef alto
	<<\IIvlaIIn \forma>>

}

IIfgI = {
	\IIglobal
	\clef bass
	<<\IIfgIn \forma>>

}

IIfgII = {
	\IIglobal
	\clef bass
	<<\IIfgIIn \forma>>

}

IIbc = {
	\IIglobal
	\clef bass
	<<\IIbcn \forma\IIbfn >>
	\typeset

}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 4 \con
}

IIIobIn = \transpose mib sol,
\relative do'' {
    \key mib\major

    mib8 mib mib mib mib16 fa sol fa mib8 mib
    fa sol lab fa sol16 lab sib lab sol8 do
    fa,16 sol lab sol fa8 sib mib,16 fa sol fa mib8 lab

    %4
    re, mib fa sol16 lab sol8 fa r4
    mib8\solo mib mib mib mib16 fa sol fa mib8 mib
    fa sol lab fa sol16 lab sib lab sol8 sol

    %7
    sol16 lab sib lab sol8 sol sol16 lab sib lab sol8 fa16 sol
    lab8 lab lab sol16 fa sol8 fa r sib\tu
    do mib, mib mib mib4-+~mib16 do' sib lab

    %10
    sib8 mib, mib mib mib4-+~mib16 sib' lab sol\mbreak
    lab16 lab sol fa sol sol fa mib fa fa mib re mib mib re do
    re8 mib fa sol16 lab sol8 fa r4

    %13
    re8. mib16 mib8.-+ re32 mib fa4 r8 fa
    sol fa16 mib re8 mib fa4 r8 fa
    sol16 sib lab sol fa mib re mib fa4 r8 lab\mbreak

    %16
    sol8 sol sol sol sol fa16 sol lab8 sol16 fa
    sol8. la16 la8.-+ sol32 la  sib8 sib,\solo sib do
    re re re mib fa sol16 mib fa8 sol16 mib

    %19
    fa8 re16 mib fa8 sol16 lab sol8 fa r4
    mib!8\tu mib mib mib mib16 fa sol fa mib8 mib\mbreak
    fa sol lab fa sol16 lab sib lab sol8 sol

    %22
    fa16 sol lab sol fa8 fa mib16 fa sol fa mib8 mib
    mib8 re16 mib fa8 mib re sol sol sol
    sol1~

    %25
    sol2~sol4. fa8\mbreak
    mib8 do16 re mib8 re16 mib fa8 re16 mib fa8 mib16 fa
    sol8 mib16 fa sol8 fa16 sol la8 sol16 la si?8 la16 si

    %28
    do8 sib?16 lab! sol fa mib re do8. re16 re4-+
    do r r2
    R1\mbreak

    %31
    do4 r8 do do, do' do do
    fa,4 r8 do' fa,4 r8 do'
    lab' lab lab lab re,16 mib fa mib fa sol lab fa

    %34
    sol8 sol sol sol do,16 re mib re mib fa sol mib\mbreak
    fa8 fa fa fa si,16 do re do re mib fa re
    mib8 do16 re mib8 re16 mib fa8 re16 mib fa8 mib16 fa

    %37
    sol8 do sol fa16 sol lab sib lab sol fa mib re do
    si8 do re do16 si do4 r\mbreak
    re8 mib fa mib16 re mib8 re r4

    %40
    do8 do do do do16 re mib re do8 do
    re mib fa[re] mib16 fa sol fa mib8 sol
    fa16 sol lab sol fa8 lab re,16 mib fa mib re fa mib re\mbreak

    %43
    mib sol fa mib fa lab sol fa sol8 fa r sib
    sib, sib sib do re re re mib
    fa sol lab[sol] fa\p sol lab[sol]

    %46
    fa\f sol lab sol16 fa sol8 fa r4
    R1*2
    r2 r4 r8 sib,

    %50
    do sib16 do re8 do16 re mib8 re16 mib fa8 mib16 fa
    sol8 fa16 sol lab8 sol16 lab sib4~sib16 lab sol sib
    lab4~lab16 sol fa lab sol4. sol8\mbreak

    %53
    sol8 lab16 sib lab sol fa mib re4 r
    r r8 sib' lab sol fa mib
    sib sib sib sib mib, sib' r4

    %56
    mib8 mib mib mib mib16 fa sol fa mib8 mib\mbreak
    fa sol lab fa sol16 lab sib lab sol8 do
    fa,16 sol lab sol fa8 sib mib,16 fa sol fa mib8 lab

    %59
    re, mib fa sol16 lab sol8 fa r4
    r2 r4 r8 sib,\p \mbreak
    sib sib sib sib sib sib sib lab'\f

    %62
    sol16(mib) fa8 fa4-+ mib4. fa16(re)
    mib4. fa16(re) mib4. fa8
    sib, sib' sol fa16 mib mib2  %%OK ma controlla ancora

}

IIIobIIn = \transpose mib sol,
\relative do'' {
    \key mib\major

    sol8 sol sol sol sol16 fa mib fa sol lab sib8
    do re mib fa mib16 fa sol fa mib8 mib
    fa4 r8 re mib4 r8 do

    %4
    sib do re mib16 fa mib8 re r4
    mib8\solo mib mib mib mib4 r8 sib\mbreak
    do re mib fa mib16 fa sol fa mib8 mib

    %7
    mib16 fa sol fa mib8 mib mib16 fa sol fa mib8 re16 mib
    fa8 fa fa mib16 re mib8 re r mib\tu
    mib do do do do16reb mib reb do8 mib

    %10
    mib sib sib sib sib mib16 re! mib8 re16 mib\mbreak
    mib8 re re[do] do[sib] sib la
    sib sib sib[re] mib re r4

    %13
    sib8. do16 do8.-+ sib32 do re4 r8 re
    mib re16 do sib8 do re4 r8 re
    mib16 sol fa mib re do sib do re4 r8 re\mbreak

    %16
    mib mib mib mib mib re16 mib fa8 mib16 re
    mib8 mib mib mib re4 r
    r8 sib\solo sib do re mib16 do re8 mib16 do

    %19
    re8 sib16 do re8 mib16 fa mib8 re r4
    sol,8\tu sol sol sol sol16 fa mib fa sol lab sib8\mbreak
    do re mib fa mib16 fa sol fa mib8 mib

    %22
    re16 mib fa mib re8 re do16 re mib re do8 do
    do si16 do re8 do si4 r
    R1*2\mbreak

    %26
    do4 r8 do si4 r8 re
    do4 r8 sol' fa fa fa[fa]
    sol fa16 mib re8 si do[do] si4-+

    %29
    do r r2
    R1\mbreak
    do4 r8 do do, do' do do

    %32
    fa,4 r8 do' fa,4 r8 do'
    do fa do fa16 mib re8 sib sib re16 fa
    sib,8 mib sib mib16 re do8 lab lab do16 mib\mbreak

    %35
    lab,8 re lab re16 do si8 sol sol si16 re
    sol,8 do r do si re r re
    do sol' r mib do do16 sib do8 lab

    %38
    sol la si la16 sol la4 r\mbreak
    si8 do re do16 si do8 si  r4
    mib,8 mib mib mib mib16 re do re mib8 fa16 sol

    %41
    lab8 sib do[re] do16 re mib re do8 mib
    do4 r8 do sib16 do re do sib re do sib\mbreak
    sib8 mib fa16 fa mib re mib8 re r4

    %44
    r r8 sib' sib, sib sib do
    re mib fa[mib] re\p mib fa[mib]
    re\f mib fa mib16 re mib8 re r4

    %47
    R1*2
    r2 r4 r8 sol,
    lab lab lab[lab] sol sol sib[sib]

    %51
    sib sib re[fa] mib re do[do]
    do do sib[sib] sib sib mib re\mbreak
    do do do[do] sib4 r

    %54
    r8 sib' lab sol fa mib re mib
    sib sib sib sib mib, sib' r4
    sol8 sol sol sol sol16 fa mib fa sol lab sib8 \mbreak

    %57
    do re mib fa mib16 fa sol fa mib8 mib
    fa4 r8 re mib4 r8 do
    sib do re mib16 fa mib8 re r4

    %60
    r2 r4 r8 sib\p
    sib sib sib sib sib sib sib re\f
    mib mib re4-+ mib4. re16(fa)

    %63
    mib4. re16(fa) mib4. do8
    sib sib sib[sib] sol2

}

IIIvlaIn = \relative do' {

    sol'8 sol sol sol sol16 la si la sol8 sol
    la si do la si16 do re do si8 mi
    la,16 si do si la8 re sol,16 la si la sol8 do

    %4
    fad, sol la si16 do si8 la r4
    sol4\p fad  mi r8 si\mbreak
    do re mi[fad] sol4 r8 fad

    %7
    mi4 r8 re do4 r8 do16 si
    la8 si16 do re8 mi16 fad sol8 re r re'\f
    mi sol, sol sol sol4-+~sol16 mi' re do

    %10
    re8 sol, sol sol sol4-+~sol16 re' do si\mbreak
    do do si la si si la sol la la sol fad sol sol fad mi
    fad8 sol la si16 do si8 la r4

    %13
    r2 la16 sol fad sol la8 re
    r2 la16 sol fad sol la8 re
    r2 la16 sol fad sol la si do la\mbreak

    %16
    si8 si si si si la16 si do8 si16 la
    si8. dod16 dod8. si32 dod re4 r
    r2 r8 re,\p re re

    %19
    re re re re sol, re' r4
    sol8\f sol sol sol sol16 la si la  sol8 sol\mbreak
    la8 si do la si16 do re do si8 si

    %22
    la16 si do si la8 la sol16 la si la sol8 sol
    sol fad16 sol la8 sol fad4 r
    r8 si la sol fad16 mi red mi fad8 sol\p

    %25
    fad16 mi red mi fad8 sol\f fad16 mi red mi fad sol la fad\mbreak
    sol8 mi16 fad sol8 fad16 sol la8 fad16 sol la8 sol16 la
    si8 sol16 la si8 la16 si dod8 si16 dod red8 dod16 red

    %28
    mi8 re!16 do? si la sol fad mi8. fad16 fad4-+
    mi r r2
    R1\mbreak

    %31
    r8 si'16 la si do si do si la sold la si do re si
    do re mi re do re do si do re mi re do re do si
    do8 do do do fad,16 sol la sol la si do la

    %34
    si8 si si si mi,16 fad sol fad sol la si sol\mbreak
    la8 la la la red,16 mi fad mi fad sol la fad
    sol8 mi16 fad sol8 fad16 sol la8 fad16 sol la8 sol16 la

    %37
    si8 mi si la16 si do re do si la sol fad mi
    red4 r mi8 fad sol fad16 mi\mbreak
    fad4 r8 sol16 fad sol8 fad r4

    %40
    mi8 mi mi mi mi16 fad sol fad mi8 mi
    fad sol la fad sol16 la si la sol8 si
    la16 si do si la8 do fad,16 sol la sol fad la sol fad\mbreak

    %43
    sol si la sol la do si la si8 la r4
    r2 r4 r8 re\p
    re, re re re'\pp re, re re re'\p

    %46
    re, re re re sol, re' r sol\f
    sol, sol sol la si si si do\mbreak
    re mi fa mi re\p mi fa mi

    %49
    re\f mi fa mi16 re mi8 re r re
    mi re16 mi fad!8 mi16 fad sol8 fad16 sol la8 sol16 la
    si8 la16 si do8 si16 do re4~re16 do si re

    %52
    do4~do16 la sol do si4. si8\mbreak
    si do16 re do si la sol fad4 r
    r2 r4 r8 re'

    %55
    do si la si16 do si8 la r4
    sol8 sol sol sol sol16 la si la sol8 sol\mbreak
    la si do la si16 do re do si8 mi

    %58
    la,16 si do si la8 re sol,16 la si la sol8 do
    fad, sol la si16 do si8 la r si\solo
    do si la[sol] fad mi re[re'\p]\mbreak

    %61
    mi re do[si] la sol fad16(la) do8\tu
    si16(sol) la8 la4-+ sol4. la16(fad)
    sol4. la16(fad) sol4. la8

    %64
    re, re' si la16 sol sol2

}

IIIvlaIIn = \relative do' {

    si8 si si si si16 la sol la si do re8
    mi fad sol la sol16 la si la sol8 sol
    la4 r8 fad sol4 r8 mi

    %4
    re mi fad sol16 la sol8 fad r4
    sol\p fad mi r8 si
    do re mi[fad] sol4 r8 fad

    %7
    mi4 r8 re do4 r8 do16 si
    la8 si16 do re8 mi16 fad sol8 re r sol\f
    sol mi mi mi mi16 fa sol fa mi8 sol

    %10
    sol re re re re sol16 fad! sol8 fad16 sol\mbreak
    sol8 fad fad [mi] mi re re[dod]
    re re re[fad] sol fad r4

    %13
    r2 fad16 mi re mi fad8 fad
    r2 fad16 mi re mi fad8 fad
    r2 fad16 mi re mi fad sol la fad\mbreak

    %16
    sol8 sol sol sol sol fad16 sol la8 sol16 fad
    sol8 sol sol sol fad4 r
    r2 r8 re\p re re

    %19
    re re re re sol, re' r4
    si8\f si si si si16 la sol la si do re8\mbreak
    mi fad sol la sol16 la si la sol8 sol

    %22
    fad16 sol la sol fad8 fad mi16 fad sol fad mi8 mi
    mi red16 mi fad8 mi red4 r8 si'
    la sol fad mi red16 dod si dod red8 mi\p

    %25
    red16 dod si dod red8 mi\f red16 dod si dod red mi fad red\mbreak
    mi4 r8 mi red4 r8 red
    si4 r8 mi mi mi fad[fad]

    %28
    mi fad16 sol si,8 si la do si[si]
    sol4 r r2
    R1\mbreak

    %31
    r8 sol'16 fad sol la sol la sold fad mi fad sold la si sold
    la si do si la si la sold la si do  si la si la sold
    la8 mi mi re16 sol, la8 re re re

    %34
    re re re sol,16 si sol8 do do do\mbreak
    do do do fad,16 la fad8 si si si
    si sol16 la si8 si la red red red

    %37
    si sol'16 fad mi8 mi mi mi16 re? do si la sol
    fad4 r dod'8 red mi red16 dod\mbreak
    red4 r8 mi16 red mi8 red r4

    %40
    sol,8 sol sol sol sol16 fad mi fad sol8 la16 si
    do8 re mi fad si,4 r8 sol
    do16 re mi re do8 mi la,4 r8 re\mbreak

    %43
    re16 re do si re8 re re[re] r4
    r2 r4 r8 re' \p
    re, re re re'\pp re, re re re'\p

    %46
    re,re re re sol, re' r4
    r r8 sol\parenthesize \f sol, sol sol la\mbreak
    si do re do si\p do re do

    %49
    si\f do re do16 si do8 si r si
    do do do[do] si si re[re]
    re re fad[la] sol fad mi[mi]

    %52
    mi16 re do mi re8 re re re sol[fad]\mbreak
    mi mi mi[mi] la,4 r
    r2 r8 re' do si

    %55
    la sol fad sol16 la sol8 fad r4
    si,8 si si si si16 la sol la si do re8\mbreak
    mi fad sol la sol16 la si la sol8 sol

    %58
    la4 r8 fad sol4 r8 mi
    re mi fad sol16 la sol8 fad r fad\solo
    sol fad mi[re] do si la[si'\p]\mbreak

    %61
    do si la[sol] fad mi re[re]\tu
    re mi re[re] re do re re
    re do re re re do re mi

    %64
    fad, sol sol[fad] si2

}

IIIfgIn = \relative do {

    sol'4 fad mi r8 si
    do re mi[fad] sol4 r8 mi
    fad4 r8 re mi4 r8 do

    %4
    re re re re sol, re' r4
    R1*3
    r2 r4 r8 si'

    %9
    do do do do do16 re mi re do do si la
    si8 si si si si16 do re do si si la sol\mbreak
    la8 re sol,[do] fad, si mi,[la]

    %12
    re, mi fad[re] sol re r4
    r2 re8 re' re, re'
    re,4 r8 re' re, re' re, re'

    %15
    re,4 r8 re' re, re' re, re'\mbreak
    sol, sol16 fad mi8 mi16 re do8 do16 si la8 re
    sol mi la[la,] re4 r
    R1*2

    %20
    sol4 fad mi r8 si\mbreak
    do re mi[fad] sol4 r8 sol
    red4 r8 red mi4 r8 mi

    %23
    la, la la la si4 r
    R1*2\mbreak
    mi8 mi mi mi fad fad fad fad

    %27
    sol sol sol sol la la fad fad
    sol fad16 mi red8 si do la si si
    \once\stemUp mi, si''16 la si do si do la sol la si la si la si

    %30
    sol la si la sol la sol fad sol la si la sol la sol fad\mbreak
    sol4 r r2
    R1

    %33
    la16 si do si la sol fad mi re mi fad mi fad sol la fad
    sol la si la sol fad mi re do re mi re mi fad sol mi\mbreak
    fad sol la sol fad mi re do si dod red dod red mi fad red

    %36
    mi8 mi mi red16 mi fad8 fad fad mi16 fad
    sol8 sol sol fad16 sol la8 la, la la
    si si' si si si,4 r\mbreak

    %39
    si8 si' si si mi, si' r4
    mi, re do r8 sol
    la si do red mi4 r8 re

    %42
    do4 r8 la re4 r8 re16 do\mbreak
    si8 sol' fad[re] sol, re' r4
    R1*3

    %47
    r2 r4 r8 sol\mbreak
    sol, sol sol sol' sol,\p sol sol sol'
    sol,\f sol sol sol' do, sol' r sol,

    %50
    do do re[re] mi mi fad[fad]
    sol sol la[la] si la sold[sold]
    la sol! fad[fad] sol fad mi[re]\mbreak

    %53
    do do do do re4 r8 re'
    do si la sol re re re re
    re re re re sol, re' r4

    %56
    sol fad mi r8 si\mbreak
    do re mi[fad] sol4 r8 mi
    fad4 r8 re mi4 r8 do

    %59
    re re re re sol, re' r8 re'\solo
    mi re do[si] la sol fad r\mbreak
    r2 r4 r8 re

    %62
    sol do, re[do] si la si do
    si la si do si la si do
    do si re[re,] sol2

}

IIIfgIIn = \relative do {

    sol'4 fad mi r8 si
    do re mi[fad] sol4 r8 mi
    fad4 r8 re mi4 r8 do

    %4
    re re re re sol, re' r4
    R1*3
    r2 r4 r8 si'

    %9
    do do do do do16 re mi re do do si la
    si8 si si si si16 do re do si si la sol\mbreak
    la8 re sol,[do] fad, si mi,[la]

    %12
    re, mi fad[re] sol re r4
    re8 re' re, re' re,4 r8 re'
    re, re' re, re' re,4 r8 re'

    %15
    re, re' re, re' re,4 r8 re'\mbreak
    sol, sol16 fad mi8 mi16 re do8 do16 si la8 re
    sol mi la[la,] re4 r
    R1*2

    %20
    sol4 fad mi r8 si\mbreak
    do re mi[fad] sol4 r8 sol
    red4 r8 red mi4 r8 mi

    %23
    la, la la la si4 r
    R1*2\mbreak
    mi8 mi mi mi fad fad fad fad

    %27
    sol sol sol sol la la fad fad
    sol fad16 mi red8 si do la si si
    \once\stemUp mi, sol'16 fad sol la sol la fad mi fad sol fad sol fad sol

    %30
    mi fad sol fad mi fad mi red mi fad sol fad mi fad mi red\mbreak
    mi4 r r2
    R1

    %33
    la16 si do si la sol fad mi re mi fad mi fad sol la fad
    sol la si la sol fad mi re do re mi re mi fad sol mi\mbreak
    fad sol la sol fad mi re do si dod red dod red mi fad red

    %36
    mi8 mi mi red16 mi fad8 fad fad mi16 fad
    sol8 sol sol fad16 sol la8 la, la la
    si4 r si8 si' si si\mbreak

    %39
    si,4 r8 si' mi, si' r4
    mi, re do r8 sol
    la si do red mi4 r8 re

    %42
    do4 r8 la re4 r8 re16 do\mbreak
    si8 sol' fad[re] sol, re' r4
    R1*3

    %47
    r2 r4 r8 sol\mbreak
    sol, sol sol sol' sol,\p sol sol sol'
    sol,\f sol sol sol' do, sol' r sol,

    %50
    do do re[re] mi mi fad[fad]
    sol sol la[la] si la sold[sold]
    la sol! fad[fad] sol fad mi[re]\mbreak

    %53
    do do do do re re' do si
    la sol fad sol re re re re
    re re re re sol, re' r4

    %56
    sol fad mi r8 si\mbreak
    do re mi[fad] sol4 r8 mi
    fad4 r8 re mi4 r8 do

    %59
    re re re re sol, re' r8 re'\solo
    mi re do[si] la sol fad r\mbreak
    r2 r4 r8 re

    %62
    sol do, re[do] si la si do
    si la si do si la si do
    do si re[re,] sol2

}


IIIbcn = \relative do {

    sol'4 fad mi r8 si
    do re mi[fad] sol4 r8 mi
    fad4 r8 re mi4 r8 do

    %4
    re re re re sol, re' r4
    R1*3
    r2 r4 r8 si'

    %9
    do do do do do16 re mi re do do si la
    si8 si si si si16 do re do si si la sol\mbreak
    la8 re sol,[do] fad, si mi,[la]

    %12
    re, mi fad[re] sol re r4
    R1*2
    r2 r4 r8 re\mbreak

    %16
    sol sol16 fad mi8 mi16 re do8 do16 si la8 re
    sol mi la[la,] re4 r
    R1*2

    %20
    sol4 fad mi r8 si\mbreak
    do re mi[fad] sol4 r8 sol
    red4 r8 red mi4 r8 mi

    %23
    la, la la la si4 r
    R1*2\mbreak
    mi8 mi mi mi fad fad fad fad

    %27
    sol sol sol sol la la fad fad
    sol fad16 mi red8 si do la si si
    mi,4 r8 mi si'4 r8 si

    %30
    mi4 r8 si mi4 r8 si\mbreak
    mi,4 r r2
    R1

    %33
    la'16 si do si la sol fad mi re mi fad mi fad sol la fad
    sol la si la sol fad mi re do re mi re mi fad sol mi\mbreak
    fad sol la sol fad mi re do si dod red dod red mi fad red

    %36
    mi8 mi mi red16 mi fad8 fad fad mi16 fad
    sol8 sol sol fad16 sol la8 la, la la
    si4 r r2\mbreak

    %39
    r4  r8 si' mi, [si'] r4
    mi, re do r8 sol
    la si do red mi4 r8 re

    %42
    do4 r8 la re4 r8 re16 do\mbreak
    si8 sol' fad[re] sol, re' r4
    R1*5

    %49
    r2 r8 sol, si sol
    do do re[re] mi mi fad[fad]
    sol sol la[la] si la sold[sold]

    %52
    la sol! fad[fad] sol fad mi[re]\mbreak
    do do do do re4 r
    R1*2

    %56
    sol4 fad mi r8 si\mbreak
    do re mi[fad] sol4 r8 mi
    fad4 r8 re mi4 r8 do

    %59
    re re re re sol, re' r4
    R1
    r2 r4 r8 re

    %62
    sol do, re[do] si la si do
    si la si do si la si do
    do si re[re,] sol2

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 4/4
    \tempo 2 = 57
    s1*64
    \bar"|."

}

IIIobI = {
    \IIIglobal
    \notypeset
    <<\IIIobIn \forma>>

}

IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

}

IIIvlaI = {
    \IIIglobal
    \clef alto
    <<\IIIvlaIn \forma>>

}

IIIvlaII = {
    \IIIglobal
    \clef alto
    <<\IIIvlaIIn \forma>>

}

IIIfgI = {
    \IIIglobal
    \clef bass
    <<\IIIfgIn \forma>>

}

IIIfgII = {
    \IIIglobal
    \clef bass
    <<\IIIfgIIn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma\IIIbfn >>
    \typeset

}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 4 \con
}

IVobIn =  \transpose mib sol, \relative do'' {\key mib\major \transpose sol mib
            \relative do'' {
                \key sol\major

                sol'4.-+(fad16 sol) re'4
                re,4.-+(do16 re) sol4
                si,4.-+(la16 si)  re4

                %4
                sol,8 la si do re mi
                fad4 do' si
                la mi' re

                %7
                si8 re do si la sol
                fad4 re8 mi fad sol\mbreak
                la4 la la

                %10
                la4.-+(sol16 fad) si4
                sol sol sol
                sol4.-+( fad16 mi) la4

                %13
                fad8(mi) sol(fad) la(mi)
                fad(mi) sol(fad) la(mi)
                fad4 sol mi

                %16
                re2. re
                fad4.-+(mi16 fad) re'4
                sol,4.-+(fad16 sol) re'4

                %19
                re,4.-+(do16 re) do'4
                si la8 sol fad mi
                red4 fad la

                %22
                do si8(la) sol(fad)
                si,4 mi sol
                si la8(sol) fad(mi)\mbreak

                %25
                do'4 la4.-+(sol16 la)
                si4 fad4.-+(mi16 fad)
                sol4 mi red

                %28
                mi2.
                sol4 si, sol'
                sol16(fad mi fad sol8) sol sol sol

                %31
                fad4 la, fa'
                fa?16(mi re mi fa!8) fa fa fa\mbreak
                mi(re) fad![(mi)] sol(fad)

                %34
                la(sol) si[(la)] do(si)
                re4 do8 si la sol
                fad4 sol8 fad mi re

                %37
                sol4.-+(fad16 sol) re'4
                re,4.-+(do16 re) sol4
                si,4.-+(la16 si) re4

                %40
                sol,8 la si do re mi\mbreak
                fad4 do' si
                la mi' re

                %43
                si8 re do si la sol
                fad4 sol8 fad mi re
                re'4 re re

                %46
                re4.-+(do16 si) mi4
                do do do
                do4.-+(si16 la) re4\mbreak

                %49
                si8(la) do[(si)] re(la)
                si8(la) do[(si)] re(la)
                si4 sol fad

                %52
                sol2. sol\fermopz
}}


IVvlaIn = \relative do' {

    sol'4.-+(fad16 sol) re'4
    re,4.-+(do16 re) sol4
    si,4.-+(la16 si)  re4

    %4
    sol,8 la si do re mi
    fad4 do' si
    la mi' re

    %7
    si8 re do si la sol
    fad4 re8 mi fad sol\mbreak
    la4 la la

    %10
    la4.-+(sol16 fad) si4
    sol sol sol
    sol4.-+( fad16 mi) la4

    %13
    fad8(mi) sol(fad) la(mi)
    fad(mi) sol(fad) la(mi)
    fad4 sol mi

    %16
    re2. re
    fad4.-+(mi16 fad) re'4
    sol,4.-+(fad16 sol) re'4

    %19
    re,4.-+(do16 re) do'4
    si la8 sol fad mi
    red4 fad la

    %22
    do si8(la) sol(fad)
    si,4 mi sol
    si la8(sol) fad(mi)\mbreak

    %25
    do'4 la4.-+(sol16 la)
    si4 fad4.-+(mi16 fad)
    sol4 mi red

    %28
    mi2.
    sol4 si, sol'
    sol16(fad mi fad sol8) sol sol sol

    %31
    fad4 la, fa'
    fa?16(mi re mi fa!8) fa fa fa\mbreak
    mi(re) fad![(mi)] sol(fad)

    %34
    la(sol) si[(la)] do(si)
    re4 do8 si la sol
    fad4 sol8 fad mi re

    %37
    sol4.-+(fad16 sol) re'4
    re,4.-+(do16 re) sol4
    si,4.-+(la16 si) re4

    %40
    sol,8 la si do re mi\mbreak
    fad4 do' si
    la mi' re

    %43
    si8 re do si la sol
    fad4 sol8 fad mi re
    re'4 re re

    %46
    re4.-+(do16 si) mi4
    do do do
    do4.-+(si16 la) re4\mbreak

    %49
    si8(la) do[(si)] re(la)
    si8(la) do[(si)] re(la)
    si4 sol fad

    %52
    sol2. sol\fermopz

}

IVvlaIIn = \relative do' {

    si4 si si
    sol sol re'
    sol, sol fad

    %4
    sol8 fad sol4 sol8 (mi')
    la,4 re8 fad sol4
    mi mi la

    %7
    re, sol mi
    la,2 dod8(mi)\mbreak
    re4 re dod

    %10
    si2 red4
    si dod si
    la2 dod4

    %13
    la dod mi
    la, dod mi
    re mi dod

    %16
    re2. re
    la4 la fad
    si si sol

    %19
    la la fad'
    re do8 si la sol
    fad4 red' fad

    %22
    la sol8(fad) mi(red)
    sol,4 si mi
    sol fad8(mi) red(mi)\mbreak

    %25
    mi4 fad4.-+(mi16 fad)
    sol4 red4.-+(dod16 red)
    mi4 si8(do?) fad,4

    %28
    sol2.
    si4 si si
    la la la

    %31
    la la la
    sol sol sol\mbreak
    sol do re

    %34
    re re fad8(la)
    sol2 mi4
    la, si8 la sol fad

    %37
    si4 si si
    sol sol re'
    sol, sol fad

    %40
    sol8 fad sol4 sol8 re'\mbreak
    la4 re8 fad sol4
    mi mi la

    %43
    re, sol mi
    la, si8 la sol fad
    fad'4 sol fad

    %46
    mi mi sold
    mi fad mi
    re re fad\mbreak

    %49
    re fad la
    re, fad la
    re, si la

    %52
    si2. si\fermopz

}


IVbcn = \relative do {

    sol4 sol sol
    si si si
    re re do

    %4
    si8 la sol la si do
    re mi fad re sol4
    do, do' fad,

    %7
    sol mi do
    re2 mi4\mbreak
    fad fad, mi'

    %10
    red dod si
    mi mi, re'!
    dod si la

    %13
    re mi dod
    re mi dod
    re sol, la

    %16
    re, re'8 do! si la re,4 fad la\mbreak
    re re re
    mi mi mi

    %19
    fad fad re
    sol sol, la
    si si si

    %22
    si si si
    si si si
    si si si\mbreak

    %25
    la re re,
    sol' si si,
    mi sol, si

    %28
    mi, sol si
    mi mi re
    dod dod dod

    %31
    re re do!
    si si si\mbreak
    do la si

    %34
    fad' sol la
    si,2 do4
    re2.

    %37
    sol,4 sol sol
    si si si
    re re do

    %40
    si8 la sol la si do\mbreak
    re mi fad re sol4
    do, do' fad,

    %43
    sol mi do
    re re, do''
    si si, la'

    %46
    sold fad mi
    la la, sol'!
    fad mi re\mbreak

    %49
    sol la fad
    sol la fad
    sol si, re

    %52
    sol, sol8 la si do sol2.\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 3/4
    \tempo 2. = 50
    \repeat volta 2 {s2.*15}
    \alternative {{s2.}{s}}\break
    \set Score.currentBarNumber = #17
    \repeat volta 2 {s2.*35}
    \alternative {{s2.}{s}}
    \bar"|."

}

IVobI = {
    \IVglobal
    %\notypeset
    <<\IVobIn \forma>>

}

IVvlaI = {
    \IVglobal
    \clef alto
    <<\IVvlaIn \forma>>

}

IVvlaII = {
    \IVglobal
    \clef alto
    <<\IVvlaIIn \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma\IVbfn >>
    \typeset

}


Vglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\tupletSpan 4 \con
			}

VobIn = \transpose mib sol,
\relative do'' {
    \key mib\major

    mib8 re do4 si
    do8 re mib4 re
    mib8\p re do4 si

    %4
    do8 re mib4 re
    fa8\f lab fa[re] si re
    fa lab fa[re] si re

    %7
    mib fa fa2-+
    sol2. sol\mbreak
    re8 mib fa4 mib

    %10
    re8 do si4 do
    lab'8\p sol fa4 mib
    fa8 mib re4 do

    %13
    si8\f do fa[re] si re
    fa lab fa[re] si re\mbreak
    mib4 do si

    %16
    do2. do\fermopz

}

VobIIn = \transpose mib sol,
\relative do'' {
    \key mib\major

    sol4 sol sol
    sol do si
    do\p sol sol

    %4
    sol do si
    re8\f fa re[si] sol si
    re fa re[si] sol si

    %7
    do4 do2
    si2. si
    si8 do re4 do

    %10
    lab8 sol fa4 sol
    do\p si do
    do8 sib? lab4 sol

    %13
    sol8\f si re[si] sol si
    re fa re [si] sol si\mbreak
    sol4 mib re

    %16
    mib2. mib\fermopz

}


Vbcn = \relative do {

    mi4 sol si
    sol mi si'
    mi,\p sol si

    %4
    sol mi si'
    si,\f r r
    r r si

    %7
    mi do do
    si si'8 la sol fad si,4 dod fad\mbreak
    si dod, mi

    %10
    la8 sol fad4 sol
    la8\p sol fad4 mi
    do'8 si la4 sol8 la

    %13
    si4\f si, r
    r r si\mbreak
    mi sol, si

    %16
    mi, mi'8 fad sol la mi,2.\fermata

}

Vbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\time 3/4
    \tempo 2. = 50
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}%\break
    \set Score.currentBarNumber = #9
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}
    \bar"|."


}

VobI = {
	\Vglobal
	%\notypeset
	<<\VobIn \forma>>

}

VobII = {
	\Vglobal
	<<\VobIIn \forma>>

}

Vbc = {
	\Vglobal
	\clef bass
	<<\Vbcn \forma\Vbfn >>
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

\header {
    title = \markup\smaller {"Concerto a 7 [FaWV L:G11]"}
    composer = \markup \center-column{"J. F. Fasch (1688-1758)"}
		}

    \markup \huge {[1.] Un poco Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois""di Silve 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \IobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois""di Silve 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \IobII
                >>
            >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola 1."}
                    \set Staff.midiInstrument = #"viola"
                    \IvlaI
                    \key sol\major
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola 2."}
                    \set Staff.midiInstrument = #"viola"
                    \IvlaII
                    \key sol\major
                >>
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Bassono 1."}
                    \set Staff.midiInstrument = #"bassoon"
                    \IfgI
                    \key sol\major
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Bassono 2."}
                    \set Staff.midiInstrument = #"bassoon"
                    \IfgII
                    \key sol\major
                >>
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"harpsichord"
                \Ibc
                \key sol\major
            >>
        >>

        \layout {

            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #1
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

    \markup \huge {[2.] Air}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobII
                >>
            >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvlaI
                    \key sol\major
                >>

                \new Staff  <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvlaII
                    \key sol\major
                >>
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IIfgI
                    \key sol\major
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IIfgII
                    \key sol\major
                >>
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIbc
                \key sol\major
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #1
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

    \markup \huge {[3.] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobII
                >>
            >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvlaI
                    \key sol\major
                >>

                \new Staff  <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvlaII
                    \key sol\major
                >>
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IIIfgI
                    \key sol\major
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IIIfgII
                    \key sol\major
                >>
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIIbc
                \key sol\major
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #1
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

    systems-per-page = #5

}

    \markup \huge {[4.] Menuet 1. altern[ativement]}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois""di Silve 1. & 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \IVobI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola 1."}
                    \set Staff.midiInstrument = #"viola"
                    \IVvlaI
                    \key sol\major
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola 2."}
                    \set Staff.midiInstrument = #"viola"
                    \IVvlaII
                    \key sol\major
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Bassono 1. & 2.""Cembalo"}
                    \set Staff.midiInstrument = #"bassoon"
                    \IVbc
                    \key sol\major
                >>
        >>

\layout {

            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

    \markup \huge {[5.] Menuet 2.}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois""di Silve 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \VobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois""di Silve 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \VobII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Bassono 1. & 2.""Cembalo"}
                    \set Staff.midiInstrument = #"bassoon"
                    \Vbc
                    \key sol\major
                >>
        >>

\layout {

            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80, 2.20.0
%}
