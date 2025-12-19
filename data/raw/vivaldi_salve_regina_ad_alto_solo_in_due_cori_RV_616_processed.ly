\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = ^\markup\italic"tasto solo"

tr = \trill

ten = ^\markup \italic "ten"

dolce = _\markup\italic "dolce"

arco = _\markup \italic "Con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "Pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

tasto = _\markup\italic "Tasto Solo"

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



mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    %\set Score.skipTypesetting = ##t

}

IflIn = \relative do'' {

    do4~do8.[re16 mib8. re16]
    do4~do8.[re16 mib8. re16]
    do4~do8.[re16 mib8. fa16]

    %4
    sol4 r r
    re4~re8.[mib16 fa8. re16]
    re4~re8.[mib16 fa8. re16]

    %7
    mib4 r r
    sol~sol8. [lab16 sib8. sol16]
    lab4 r r

    %10
    fa4~fa8.[ sol16 lab8. fa16]
    sol4 r r
    mib4~mib8. [fa16 sol8. mib16]

    %13
    mib4\tr re r
    mib\tr\p re r
    mib\tr\pp re r

    %16
    sol sol sol
    do8(sib lab sol fa mib)
    fa4 fa fa

    %19
    \slurDashed sib8 (lab sol fa mib re)
    mib4 mib mib
    lab8 (sol fa mib re do)

    %22
    re4 re re\mbreak
    mib4 r r
    R2.*2\slurSolid

    %26
    sib'8(sol mi reb si do)
    lab'(fa re do la !sib)
    sol'(mib do sib sol lab)

    %29
    fa'(re si lab fad sol)
    r mib'(re mib fa mib)
    r mib(re mib fa mib)

    %32
    r re(do re fa re)
    mib4 r r
    fa,4\p r r

    %35
    sol r r
    do r r
    r8 sol' fa sol lab sol

    %38
    R2.*4
    r8 fa(mib fa sol fa)
    R2.*8

    %51
    r8 sol(fa sol lab sol)
    R2.
    r8 sol(fa sol lab sol)

    %54
    R2.
    r8 sol(fa sol lab sol)
    R2.*8  %%% dal F di p.6

    %64
    sol4\f sol sol
    sol r r
    sol r r

    %67
    sol8 sol lab lab fa fa
    sol4 r r
    R2.*5\mbreak

    %74
    sol4~sol8. [lab16 sib8. sol16]
    lab4 r r
    fa4~fa8.[ sol16 lab8. fa16]

    %77
    sol4 r r
    mib4~mib8. [fa16 sol8. mib16]
    fa2~fa8. mib16

    %80
    mib4\tr re r
    mib\tr re r
    mib\tr re r

    %83
    r8 mib(re mib fa mib)
    r mib(re mib fa mib)
    r mib(re mib fa mib)

    %86
    R2.*9
    sib'8(sol mi reb si do)
    lab'(fa re do la! sib)

    %97
    sol'(mib do sib sol lab)
    fa'(re si lab fad sol)
    mib'4 fa re

    %100
    do2.\fermata

}

IflIIn = \relative do'' {

    do4~do8.[re16 mib8. re16]
    do4~do8.[re16 mib8. re16]
    do4~do8.[re16 mib8. fa16]

    %4
    sol4 r r
    si,4~si8.[do16 re8. si16]
    si4~si8.[do16 re8. si16]

    %7
    do4 r r
    mi~mi8.[fa16 sol8. mi16]
    fa4 r r

    %10
    re~re8.[mib?16 fa8. re16]
    mib4 r r
    do~do8.[re16 mib8. do16]

    %13
    do4\tr si r
    do4\tr\p si r
    do4\tr\pp si r

    %16
    mib mib mib
    lab8(sol fa mib re do)
    re4 re re

    %19
    sol8(fa mib re do sib)
    do4 do do
    fa8(mib re do sib lab)

    %22
    fa'4 fa si,\mbreak
    do4 r r
    R2.*2

    %26
    sib'8(sol mi reb si do)
    lab'(fa re do la !sib)
    sol'(mib do sib sol lab)

    %29
    fa'(re si lab fad sol)
    r8 do(si do re do)
    r do(si do re do)

    %32
    \once\slurDashed r si(la si re si)
    do4 r r
    fa,4\p r r

    %35
    sol r r
    do r r
    r8 mib re mib fa mib

    %38
    R2.*4\mbreak
    r8 re (do re mib re)
    R2.*8

    %51
    r8 mib(re  mib fa mib)
    R2.
    r8 mib(re mib fa mib)

    %54
    R2.
    r8 mib(re mib fa mib)
    R2.*8

    %64
    mib4\f mib mib
    mib r r
    mib r r

    %67
    mib8 mib fa fa re re
    mib4 r r
    R2.*5\mbreak

    %74
    mi4~mi8.[fa16 sol8. mi16]
    fa4 r r
    re~re8.[mib?16 fa8. re16]

    %77
    mib4 r r
    do~do8.[re16 mib8. do16]
    re2~re8. do16

    %80
    do4\tr si r
    do4\tr si r
    do4\tr si r

    %83
    r8 do(si do re do)
    r8 do(si do re do)
    r8 do(si do re do)

    %86
    R2.*9
    sib'8(sol mi reb si do)
    lab'(fa re do la! sib)

    %97
    sol'(mib do sib sol lab)
    fa'(re si lab fad sol)
    do4 re si

    %100
    do2.\fermata

}

IvlIn = \relative do'' {

    do4~do8.[re16 mib8. re16]
    do4~do8.[re16 mib8. re16]
    do4~do8.[re16 mib8. fa16]

    %4
    sol4 r r
    re4~re8.[mib16 fa8. re16]
    re4~re8.[mib16 fa8. re16]

    %7
    mib4 r r
    sol~sol8. [lab16 sib8. sol16]
    lab4 r r

    %10
    fa4~fa8.[ sol16 lab8. fa16]
    sol4 r r
    mib4~mib8. [fa16 sol8. mib16]

    %13
    mib4\tr re r
    mib\tr\p re r
    mib\tr\pp re r

    %16
    sol sol sol
    lab2.\f~
    lab

    %19
    sol~
    sol
    fa~

    %22
    fa\mbreak
    mib4 r r
    R2.

    %25
    r8 mib,\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo sol\staccatissimo
    sib8(sol mi reb si do)
    lab'(fa re do la !sib)

    %28
    sol'(mib do sib sol lab)
    fa'(re si lab fad sol)
    r mib'(re mib fa mib)

    %31
    r mib(re mib fa mib)
    r re(do re fa re)
    mib4 r r

    %34
    fa,4\p r r
    sol r r
    do r r

    %37
    R2.
    r8 sol'\p fa sol lab sol
    R2.

    %40
    do,8 r mib, r do r
    R2.*2
    r8 fa'(mib fa sol fa)

    %44
    R2.
    fa,8 r si, r sol r
    R2.

    %47
    sib'4 sib sib
    do do do
    do do do

    %50
    re re re
    mib, mib mib
    mib mib mib

    %53
    mib mib mib
    mib mib mib
    mib mib mib

    %56
    sib' sib sib
    do do do\mbreak
    re re re

    %59
    mib mib mib
    fa fa fa
    sol sol sol

    %62
    fa fa fa
    sol fa fa
    sol\f sol sol

    %65
    sol8 sol,(fa sol lab sol)
    sol'4 r r
    sol8 sol lab lab fa fa

    %68
    sol4 r r
    R2.*4
    r8 mib,_\markup {[\musicglyph #"f"]}\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo sol\staccatissimo

    %74
    sol4\p~sol8. [lab16 sib8. sol16]
    lab4 r r
    fa4~fa8.[ sol16 lab8. fa16]

    %77
    sol4 r r
    mib4~mib8. [fa16 sol8. mib16]
    fa2~fa8. mib16

    %80
    mib4\tr re r
    mib\tr re r
    mib\tr re r

    %83
    r8 mib(re mib fa mib)
    r mib(re mib fa mib)
    r mib(re mib fa mib)

    %86
    R2.*2
    mib,4 r r
    fa r r

    %90
    sol r r
    do, r r\mbreak
    R2.*2

    %94
    r8 mib\f\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo sol\staccatissimo
    sib8(sol mi reb si do)
    lab'(fa re do la! sib)

    %97
    sol'(mib do sib sol lab)
    fa'(re si lab fad sol)
    mib'4 fa re

    %100
    do2.\fermata

}

IvlIIn = \relative do'' {

    do4~do8.[re16 mib8. re16]
    do4~do8.[re16 mib8. re16]
    do4~do8.[re16 mib8. fa16]

    %4
    sol4 r r
    si,4~si8.[do16 re8. si16]
    si4~si8.[do16 re8. si16]

    %7
    do4 r r
    mi~mi8.[fa16 sol8. mi16]
    fa4 r r

    %10
    re~re8.[mib?16 fa8. re16]
    mib4 r r
    do~do8.[re16 mib8. do16]

    %13
    do4\tr si r
    do4\tr\p si r
    do4\tr\pp si r

    %16
    mib mib mib
    fa2.\f~
    fa

    %19
    mib~
    mib
    re~

    %22
    re\mbreak
    do4 r r
    R2.

    %25
    r8 do,\staccatissimo mib\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo
    sib'8(sol mi reb si do)
    lab'(fa re do la !sib)

    %28
    sol'(mib do sib sol lab)
    fa'(re si lab fad sol)
    r8 do(si do re do)

    %31
    r do(si do re do)
    \once\slurDashed r si(la si re si)
    do4 r r

    %34
    fa,4\p r r
    sol r r
    do r r

    %37
    R2.
    r8 mib\p(re mib fa mib)
    R2.

    %40
    do8 r mib, r do r
    R2.*2
    r8 re'(do re mib re)

    %44
    R2.
    fa,8 r si, r sol r
    R2.

    %47
    mib'4 mib mib
    mib mib mib
    fa fa fa

    %50
    fa fa fa
    sib, sib sib
    sib sib sib

    %53
    sib sib sib
    sib sib sib
    sib sib sib

    %56
    mib mib mib
    mib mib fa\mbreak
    fa fa sol

    %59
    sol sol lab
    lab? lab re
    mib mib mib

    %62
    re re re
    mib mib re
    mib\f mib mib

    %65
    mib8 \once\slurDashed  mib, (re mib fa mib)
    mib'4 r r
    mib8 mib fa fa re re

    %68
    mib4 r r
    R2.*4
    r8 do,_\markup {[\musicglyph #"f"]}\staccatissimo mib\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo

    %74
    mi4\p~mi8.[fa16 sol8. mi16]
    fa4 r r
    re~re8.[mib?16 fa8. re16]

    %77
    mib4 r r
    do~do8.[re16 mib8. do16]
    re2~re8. do16

    %80
    do4\tr si r
    do4\tr si r
    do4\tr si r

    %83
    r8 do(si do re do)
    r8 do(si do re do)
    r8 do(si do re do)

    %86
    R2.*2
    mib,4 r r
    fa r r

    %90
    sol r r
    do, r r\mbreak
    R2.*2

    %94
    r8 do\f\staccatissimo mib\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo
    sib'8(sol mi reb si do)
    lab'(fa re do la! sib)

    %97
    sol'(mib do sib sol lab)
    fa'(re si lab fad sol)
    do4 re si

    %100
    do2.\fermata

}

IvlaIn = \relative do' {

    mib4 mib mib
    re re re
    fa fa fa

    %4
    si, r r
    sol' sol sol
    sol sol sol

    %7
    sol r r
    sol sol mi
    do r r

    %10
    fa fa re
    sib r r
    sol' sol sol

    %13
    sol r r
    sol\p r r
    sol\pp r r

    %16
    do do do
    do r r
    re2.\f~

    %19
    re
    do~
    do

    %22
    si\mbreak
    sol4 r r
    R2.

    %25
    sol,4 r r
    sol' sol r
    fa fa r

    %28
    mib mib r
    re re r
    R2.*4

    %34
    fa4\p r r
    sol r r
    do, r r

    %37
    mib\p r r
    mib r r
    R2.

    %40
    do'8 r mib, r do r
    R2.
    si4 r r

    %43
    si r r
    R2.
    fa'8 r si, r sol r

    %46
    R2.
    mib'4 mib mib
    lab, lab lab

    %49
    do do do
    sib sib sib
    sol sol sol

    %52
    sol sol sol
    sol sol sol
    sol sol sol

    %55
    sol sol sol
    mib' mib mib
    do do do\mbreak

    %58
    fa fa re
    do do do
    re re re

    %61
    sib sib sib
    sib sib sib
    sib sib sib

    %64
    sib '\f sib sib
    sib r r
    sib r r

    %67
    sib8 sib do do sib sib
    sib4 r r
    R2.*5\mbreak

    %74
    sol4\p sol mi
    do r r
    fa fa re

    %77
    sib r r
    mib mib do
    lab r r

    %80
    sol' r r
    sol r r
    sol r r

    %83
    R2.*5
    mib4 r r
    fa r r

    %90
    sol r r
    do, r r\mbreak
    R2.*2

    %94
    sol4\f sol sol
    sol' sol r
    fa fa r

    %97
    mib mib r
    re re r
    sol lab sol

    %100
    mib2.\fermata

}

Ivocen = \relative do' {

    \autoBeamOff
    R2.*35
    do2.~
    do4(sol') mib

    %38
    \appoggiatura mib8 do2.~
    do4 sol' \appoggiatura fa8 mib4
    \appoggiatura re8 do4 do8. re16 mib8. do16

    %41
    re4 sol, r\mbreak
    si2.
    re

    %44
    fa
    lab4 sol8. fa16 mib8. re16
    mib8. [re16] do4 r

    %47
    mib4 sib8. sol'16 mib8. reb16
    do8. sib16 lab4 r
    fa' do8. lab'16 fa8. mib16

    %50
    re8. do16 sib4 r
    mib mib mib
    mib16[fa sol la] sib[lab sol fa] sol[fa] mib[re]

    %53
    mib4. sib'16[lab] sol[fa] mib[re]
    mib16[fa sol la] sib[lab sol fa] sol[fa mib re]
    mib4 r r

    %56
    sib~sib16[re do sib] mib[reb do sib]
    do4~do16[mib re? do] fa[mib re do]\mbreak
    re4~re16[fa mib re] sol[fa mib re]

    %59
    mib4~mib16[sol fa mib] lab[sol fa mib]
    re4~re16[sib re fa] lab4
    sol~sol16 [sib, mib sol] sib [sol fa mib]

    %62
    fa4~fa16 [sib, re fa] lab4
    sol8 fa16[mib] fa2\tr
    mib4 r r

    %65
    R2.*4
    mib4 sib8 mib sol mib
    mib4re8 fa lab fa

    %71
    fa8. mib16 mib8 sol sib sol
    sol4 fa8 lab sol16[fa] mib re
    mib4 r r\mbreak

    %74
    do4 mi sol
    lab8.[sol16 fa8. mib16 re8. do16]
    re4. sib8 [re fa]

    %77
    sol8.[fa16 mib8. re16 do8. sib16]
    do4. lab8 [do mib]
    lab8.[sol16 fa8. mib16 re8. do16]

    %80
    do4\tr si r
    mib\tr re r
    mib\tr re r

    %83
    mib2.
    fa
    sol

    %86
    lab4 sol8[fa mib re]
    mib re16[do] re2\tr
    do4 r mib

    %89
    fa8[mib] fa4 r8 lab
    sol2.
    lab8[sol] fa[mib] re[do]\mbreak

    %92
    si8[lab' sol fa mib re]
    mib re16[do] re2\tr
    do r4

    %95
    R2.*6

}

Itesto = \lyricmode {

    Sal -- ve, sal - ve salve _ Regina, _ _ Mater _  sal - - ve Re - gi -- na,  Mater _  Mater _ misericordiae, _ _ _ _ _

    Mater _ misericordiae, _ _ _ _ _ vita, _ dulce  - - do et spes spes nostra  _ sal - - ve sal - - - - - - - - - - - - - - ve salve _

    sal -- ve Regina,  _ _ Mater _  misericordiae, _ _ _ _ _ vita, _ dulce  - do dulce - do et spes spes nostra _ sal - - - - - - - ve

    vita _ nostra _ sal - - - - - ve salve _ dul -- cedo _ et spes spes nostra _ sal - ve salve. _

}

IbcIn = \relative do {

    do'4 do do
    sib sib sib
    lab lab lab

    %4
    sol r r
    sol sol sol
    sol sol sol

    %7
    do, r r
    do do do
    fa r r

    %10
    sib, sib sib
    mib r r
    do do do

    %13
    sol r r
    sol^\p r r
    sol^\pp r r

    %16
    do' r8 sib lab sol
    fa4 fa fa
    sib r8 lab sol fa

    %19
    mib4 mib mib
    lab r8 sol fa mib
    re4 re re

    %22
    sol sol sol\mbreak
    do,4 r r
    R2.

    %25
    do4 r r
    sol' do, r
    fa sib, r

    %28
    mib lab, r
    re sol, r
    R2.*3

    %33
    do4 r r
    fa^\p r r
    sol r r

    %36
    do, r r
    do r r
    do r r

    %39
    R2.
    do'8 r mib, r do r
    R2.

    %42
    sol4 r r
    sol r r
    R2.

    %45
    fa'8 r si, r sol r
    R2.
    sol4\tasto sol sol

    %48
    lab lab lab
    lab? lab lab
    sib sib sib

    %51
    mib mib mib
    mib mib mib
    mib mib mib

    %54
    mib mib mib
    mib mib mib
    sol, sol sol

    %57
    lab lab lab\mbreak
    sib sib sib
    do do do

    %60
    sib sib sib
    sib sib sib
    sib sib sib

    %63
    mib sib sib
    mib \f mib mib
    mib r r

    %66
    mib r r
    mib8 mib lab, lab sib sib
    mib4 r r

    %69
    mib mib mib
    sib sib sib
    mib mib mib

    %72
    sib sib si
    do do do\mbreak
    do do do

    %75
    fa r r
    sib, sib sib
    mib r r

    %78
    lab, lab lab
    re r r
    sol, r r

    %81
    sol r r
    sol r r
    R2.*3

    %86
    do4 re sol,
    do sol' sol,
    do r r

    %89
    fa r r
    sol r r
    do, re si\mbreak

    %92
    sol sol sol
    do8 lab' sol4 sol,
    do do do

    %95
    sol' do, r
    fa sib, r
    mib lab, r

    %98
    re sol, r
    do fa sol
    do,2.\fermata

}

IbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s
    <6>
    <_!>
    s2.*3
    <_!>4 s <7>
    <_-> s s
    s s <7>
    s2.
    s
    <6 4>
    <6 4>
    <6 4>
    s
    s
    <7>
    <7>
    <7>
    <7>
    <7 _!>
    s2.*3
    s4 <_!> s
    s2.
    s
    s4 <_!> s
    s2.*4
    <7 5>2.
    <_!>
    s2.*6
    <_!>2.
    s
    s
    <_->
    s
    s
    s
    <6>
    s2.*6
    <6>2.
    <5>2 <6>4
    <5>2 <6>4
    <5>2 <6>4
    <7->2.
    <6 4>
    <5 3>
    s4 <5 4> <3>
    s2.*7
    <9>8 <8> s2
    <6 4>4 <5 3> s
    s2 <_!>4
    s2.
    <_->
    s2 <7>4
    s2.
    s2 <7>4
    s2.
    <6 4>
    <6 4>
    <6 4>
    s2.*3
    <6->4 s <_!>
    s2.
    s
    <7 5>
    <6 4>
    <6->
    s
    s
    s2 <_!>4
    s <_!>4 s
    <_->2.
    s
    s4 <_!>

}

IvlIIIn = \relative do'' {

    R2.*3
    r4 si,8 r sol r
    R2.*2

    %7
    r4 mib'8 r do r
    R2.
    r4 fa8 r sib, r

    %10
    R2.
    r4 mib8 r la, r
    R2.

    %13
    r4 si8 r sol r
    r4 si8\p r sol r
    r4 si8\pp r sol r

    %16
    R2.
    lab''4 r r
    lab? r r

    %19
    sol r r
    sol r r
    fa r r

    %22
    fa r r\mbreak
    r8 mib(re mib fa mib)
    r8 mib(re mib fa mib)

    %25
    R2.*5
    mib,4 r r
    fa r r

    %32
    sol r r
    do,8 mib'\p(re mib fa mib)
    r mib(re mib fa mib)

    %35
    r re(do re fa re)
    mib4 r r
    R2.*2

    %39
    r8 sol\p(fa sol lab sol)
    R2.
    sol,8 r si, r sol r\mbreak

    %42
    R2.*2
    r8 fa''(mib fa sol fa)
    R2.

    %46
    do8 r mib, r do r
    r4 mib8 r sol r
    r4 do,8 r lab r

    %49
    r4 fa'8 r lab r
    r4 re,8 r sib r
    R2.

    %52
    mib8 r sol r mib r
    R2.
    mib8 r sol r mib r

    %55
    R2.*9
    sol'4\f sol sol
    sol r r

    %66
    sol8 sol,(fa sol lab sol)
    R2.
    sol8 sol lab lab fa fa

    %69
    sol4 r r
    R2.*5
    r4 fa8 r sib, r

    %76
    R2.
    r4 mib8 r lab, r
    R2.

    %79
    r4 re8 r sol, r
    r4 si8\p r sol r
    r4 si8 r sol r

    %82
    r4 si8 r sol r
    mib'4 r r
    fa r r

    %85
    sol r r
    do, r r
    R2.

    %88
    r8 mib'(re mib fa mib)
    r8 mib(re mib fa mib)
    r8 mib(re mib fa mib)

    %91
    R2.*3
    r8 mib,\f\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo sol\staccatissimo
    sib8(sol mi reb si do)

    %96
    lab'(fa re do la! sib)
    sol'(mib do sib sol lab)
    fa'(re si lab fad sol)

    %99
    mib'4 fa re
    do2.\fermata

}

IvlIVn = \relative do'' {

    R2.*3
    r4 si,8 r sol r
    R2.*2

    %7
    r4 mib'8 r do r
    R2.
    r4 fa8 r sib, r

    %10
    R2.
    r4 mib8 r la, r
    R2.

    %13
    r4 si8 r sol r
    r4 si8\p r sol r
    r4 si8\pp r sol r

    %16
    R2.
    fa''4 r r
    fa r r

    %19
    mib r r
    mib r r
    re r r

    %22
    re r r\mbreak
    r8 do(si do re do)
    r do(si do re do)

    %25
    R2.*5
    mib,4 r r
    fa r r

    %32
    sol r r
    do,8 do'\p(si do re do)
    r do(si do re do)

    %35
    r si(la si re si)
    do4 r r
    R2.*2

    %39
    r8 mib\p(re mib fa mib)
    R2.
    sol,8 r si, r sol r\mbreak

    %42
    R2.*2
    r8 re''(do re mib re)
    R2.

    %46
    do8 r mib, r do r
    r4 mib8 r sol r
    r4 do,8 r lab r

    %49
    r4 fa'8 r lab r
    r4 re,8 r sib r
    R2.

    %52
    mib8 r sol r mib r
    R2.
    mib8 r sol r mib r

    %55
    R2.*9
    mib'4\f mib mib
    mib r r

    %66
    mib8 mib,(re mib fa mib)
    R2.
    mib8 mib fa fa re re

    %69
    mib4 r r
    R2.*5
    r4 fa8 r sib, r

    %76
    R2.
    r4 mib8 r lab, r
    R2.

    %79
    r4 re8 r sol, r
    r4 si8\p r sol r
    r4 si8 r sol r

    %82
    r4 si8 r sol r
    mib'4 r r
    fa r r

    %85
    sol r r
    do, r r
    R2.

    %88
    r8 do'(si do re do)
    r8 do(si do re do)
    r8 do(si do re do)

    %91
    R2.*3
    r8 do,\f\staccatissimo mib\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo
    sib'8(sol mi reb si do)

    %96
    lab'(fa re do la! sib)
    sol'(mib do sib sol lab)
    fa'(re si lab fad sol)

    %99
    do4 re si
    do2.\fermata

}

IvlaIIn = \relative do' {

    R2.*3
    r4 si8 r sol r
    R2.*2

    %7
    r4 mib'8 r do r
    R2.
    r4 fa8 r sib, r

    %10
    R2.
    r4 mib8 r la, r
    R2.

    %13
    r4 si8 r sol r
    r4 si8\p r sol r
    r4 si8\pp r sol r

    %16
    R2.
    do'4 r r
    re r r

    %19
    re r r
    do r r
    do r r

    %22
    si r r\mbreak
    sol, r r
    sol r r

    %25
    sol r r
    R2.*4
    mib'4 r r

    %31
    fa r r
    sol r r
    do, r r

    %34
    R2.*2
    do4 r r
    R2.*2

    %39
    mib4\p r r
    R2.
    sol8 r si, r sol r

    %42
    R2.*2
    si4 r r
    R2.

    %46
    do'8 r mib, r do r
    r4 mib8 r sol r
    r4 do,8 r lab r

    %49
    r4 fa'8 r lab r
    r4 re,8 r sib r
    R2.

    %52
    mib8 r sol r mib r
    R2.
    mib8 r sol r mib r

    %55
    R2.*9
    sib'4\f sib sib
    sib r r

    %66
    sib r r
    R2.
    sib,8 sib do do sib sib

    %69
    sib4 r r
    R2.*5
    r4 fa'8 r sib, r

    %76
    R2.
    r4 mib8 r lab, r
    R2.

    %79
    r4 re8 r sol, r
    r4 si8\p r sol r
    r4 si8 r sol r

    %82
    r4 si8 r sol r
    mib'4 r r
    fa r r

    %85
    sol r r
    do, r r
    R2.*7

    %94
    sol4\f sol sol
    sol' sol r
    fa fa r

    %97
    mib mib r
    re re r
    sol lab sol

    %100
    mib2.\fermata

}

IbcIIn = \relative do {

    R2.*3
    r4 si8 r sol r
    R2.*2

    %7
    r4 mib'8 r do r
    R2.
    r4 fa8 r sib, r

    %10
    R2.
    r4 mib8 r la, r
    R2.

    %13
    r4 si8 r sol r
    r4 si8\p r sol r
    r4 si8\pp r sol r

    %16
    R2.
    fa'4 r r
    sib r r

    %19
    mib, r r
    lab r r
    re, r r

    %22
    sol r r\mbreak
    do, r r
    do r r

    %25
    do r r
    R2.*4
    mib4 r r

    %31
    fa r r
    sol r r
    do, r r

    %34
    R2.*2
    do4 r r
    R2.*2

    %39
    do4 r r
    R2.
    sol'8 r si, r sol r\mbreak

    %42
    R2.*2
    sol4 r r
    R2.

    %46
    do'8 r mib, r do r
    r4 mib8 r sol r
    r4 do,8 r lab r

    %49
    r4 fa'8 r lab r
    r4 re,8 r sib r
    R2.

    %52
    mib8 r sol r mib r
    R2.
    mib8 r sol r mib r

    %55
    R2.*9
    mib4\f mib mib
    mib r r

    %66
    mib r r
    R2.
    mib8 mib lab, lab sib sib

    %69
    mib,4 r r
    R2.*5
    r4 fa'8 r sib, r

    %76
    R2.
    r4 mib8 r lab, r
    R2.

    %79
    r4 re8 r sol, r
    r4 si8\p r sol r
    r4 si8 r sol r

    %82
    r4 si8 r sol r
    mib'4 r r
    fa r r

    %85
    sol r r
    do, r r
    R2.*7

    %94
    do4 do do
    sol' do, r
    fa sib, r

    %97
    mib lab, r
    re sol, r
    do fa sol

    %100
    do,2.\fermata

}

IbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*8
    s4 <_->2
    s2.*7
    <_->2.
    <7>
    <_->
    <7>
    <7>
    <7 _!>
    s2.*8
    <7 5>2.
    <_!>
    s2.*15
    s4 <6-> s
    s <_-> s
    s2.*25
    s4 <_-> s
    s2.*3
    s2 <_!>4
    s2 <_!>4
    s2 <_!>4
    s2 <_!>4
    s2.
    <7 5>
    <6 4>
    <6->
    s2.*7
    s2 <_!>4
    s <_!> s
    <_->2.

}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key sol\minor
    \tempo 2 = 50
    s2.*100
    \bar "||"

}

IflI = {
    \Iglobal
    <<\IflIn\forma>>
}

IflII = {
    \Iglobal
    <<\IflIIn\forma>>
}

IvlI = {
    \Iglobal
    <<\IvlIn\forma>>
}

IvlII = {
    \Iglobal
    <<\IvlIIn\forma>>
}

IvlaI = {
    \Iglobal
    \clef alto
    <<\IvlaIn\forma>>
}

Ivoce = {
    \new Voice = "salve"
    \Iglobal
    \clef alto
    <<\Ivocen\forma>>
}

IbcI = {
    \Iglobal
    \clef bass
    <<\IbcIn\forma\IbfIn>>

}

IvlIII = {
    \Iglobal
    <<\IvlIIIn\forma>>
}

IvlIV = {
    \Iglobal
    <<\IvlIVn\forma>>
}

IvlaII = {
    \Iglobal
    \clef alto
    <<\IvlaIIn\forma>>
}

IbcII = {
    \Iglobal
    \clef bass
    <<\IbcIIn\forma\IbfIIn>>
    \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  %\set Score.skipTypesetting = ##t

}

IIflIn = \relative do'' {

  r8
  R1*17
  R2
  R1*10
  R2
  R1*12

}

IIflIIn = \relative do'' {

  r8
  R1*17
  R2
  R1*10
  R2
  R1*12

}

IIvlIn = \relative do'' {

    sib8
    mib sib mib sib sol'16 lab sib lab sol8 mib
    R1
    sol8 mib r4 sib8 sol r4

    %4
    mib8 sib r4 sol''8[lab16 sib lab8 sol]
    sol\tr fa r4 sib16[lab sol fa mib re do sib]
    do8 mib lab r lab16[sol fa mib re do sib lab]\mbreak

    %7
    sib8 re sol r sol16 fa mib re do sib lab sol
    lab8 do fa r fa16[mib re do sib lab sol fa]
    sol4~sol~sol8.[(fa32 sol lab8) sol]

    %10
    sib,4 r r2
    r4 sib'~sib8.[(lab32 sib do8) sib]
    sib, re' fa lab sol8. fa32 mib fa4\tr

    %13
    mib r8 sib\p mib sib mib sib
    sol'16 lab sib lab sol8 mib r2
    r sol8 mib r4

    %16
    sib8 sol r4 mib8 sib r4
    sol''8[lab16 sib lab8 sol] sol\tr fa r4
    sib16\pp[lab sol fa mib re do sib]\mbreak

    %19
    do8 mib lab r lab16[sol fa mib re do sib lab]\mbreak
    sib8 re sol\noBeam r sol16 [fa mib re do sib la sol]
    la8 do fa\noBeam r fa16 mib re do sib la sol fa

    %22
    re'8 r re4~re8.[(do32 re mib8) do]
    fa,4 r r2
    r4 fa'~fa8.[(mib32 fa sol8) mib]

    %25
    fa,4 r r2
    r sib8\f fa sib fa
    re'16 mib fa mib re8 sib  r2

    %28
    r4 r8 fa' sib re, do la'\mbreak
    sib4 r
    r2 sol8\p mib r4

    %31
    sib8 sol r4 sol'8 fa r4
    sib,8 fa r4 lab'8 sol r4
    sib16[lab sol fa mib re do sib] do8 mib lab r

    %34
    lab16[sol fa mib re do sib lab] sib8 re sol r
    sol16[fa mib re do sib lab sol] lab8 do fa r
    r2 sol8 mib r4

    %37
    sib8 sol r4 mib8 sib r4
    re'8 sib r4\mbreak mib8 sib r4
    sol'8 mib r4 sib8 sol r4

    %40
    mib8 sib r4 mib8 sib r4
    sol''8 r fa r mib2\fermata

}

IIvlIIn = \relative do'' {

    sol8
    sib sol sib sol mib'16 fa sol fa mib8 sib
    R1
    mib8 sib r4 sol8 mib r4

    %4
    sib8 sol r4 mib''8[fa16 sol fa8 mib]
    mib\tr re r4 sol16[fa mib re do sib lab sol]
    lab8 do mib r fa16 mib re do sib lab sol fa\mbreak

    %7
    sol8 sib re r mib16 re do sib lab sol fa mib
    fa8 lab do r re16[do sib lab sol fa mib re]
    mib4 mib~mib8.[(re32 mib fa8) mib]

    %10
    sib4 r r2
    r4 sol'~sol8.[(fa32 sol lab8) sol]
    sib, sib' re fa mib4 re\tr

    %13
    mib r8 sol,\p sib sol sib sol
    mib'16 fa sol fa mib8 sib r2
    r mib8 sib r4

    %16
    sol8 mib r4 sib8 sol r4
    mib''8[fa16 sol fa8 mib] mib re r4
    sol16\pp[fa mib re do sib lab sol]\mbreak

    %19
    lab8 do mib8 r fa16 mib re do sib lab sol fa
    sol8 sib re r mib16 re do sib la sol fa mib
    fa8 la do r re16 do sib la sol fa mib re

    %22
    sib'8 r sib4~sib8.[(la32 sib do8) la]
    fa4 r r2
    r4 re'~re8.[(do32 re mib8) do]

    %25
    fa,4 r r2
    r2 fa8\f re fa re
    sib'16 do re do sib8 fa r2

    %28
    r4 r8 re' fa sib,  la do\mbreak
    re4 r
    r2 mib8\p sib r4

    %31
    sol8 mib r4 mib'8 re r4
    fa,8 re r4 fa'8 mib r4
    sol16 [fa mib re do sib lab sol] lab8 do mib r

    %34
    fa16 mib re do sib lab sol fa sol8 sib re r
    mib16 re do sib lab sol fa mib fa8 lab do r
    r2 mib8 sib r4

    %37
    sol8 mib r4 sib8 sol r4
    sib'8 fa r4\mbreak  sib8 sol r4
    mib'8 sib r4 sol8 mib r4

    %40
    sib8 sol r4 sib8 sol r4
    mib''8 r re r mib2\fermata

}

IIvlaIn = \relative do' {

    mib8
    sol mib sol mib sib' r sib r
    R1
    sib8 sol r4 mib8 sib r4

    %4
    sol8 mib r4 sib''8 sib do do
    sib4 r mib, mib
    mib r re re\mbreak

    %7
    re r do do
    do r sib sib
    sib8 sib sib sib sib4 r

    %10
    sib r r2
    r8 sib sib sib sib4 r
    sib8 fa' sib re sib4 sib

    %13
    sol r8 mib\p sol mib sol mib
    sib' r sib r r2
    r sib8 sol r4

    %16
    mib8 sib r4 sol8 mib r4
    sib''8 sib do do sib sib r4
    mib,\pp mib\mbreak

    %19
    mib r re re
    re r do do
    do r sib sib

    %22
    sib8 fa' fa fa fa4 r
    fa8 fa fa fa fa4 r
    fa8 fa fa fa fa4 r

    %25
    R1
    r2 re8\f sib re sib
    fa' r fa r r2

    %28
    r4 r8 sib re r fa, r\mbreak
    fa4 r
    r2 sib8\p sol r4

    %31
    mib8 sib r4 sib'8 sib r4
    re,8 sib r4 re8 sib r4
    mib mib mib r

    %34
    re re re r
    do do do r
    r2 sib'8 sol r4

    %37
    mib8 sib r4 sol8 mib r4
    fa'8 re r4\mbreak sol8 mib r4
    sib'8 sol r4 mib8 sib r4

    %40
    sol8 mib r4 sol8 mib r4
    sib''8 r sib r sib2\fermata

}

IIvocen = \relative do' {

  \autoBeamOff

  r8
  R1*12
  r4 r8 sib mib sib mib sib
  mib16[fa sol fa] mib4 r2

  %15
  r sib8. sol16 sol4
  mib'8. sib16 sib4 sol'8. mib16 mib4
  mib8[fa16 sol] fa8 mib mib re r fa

  %18
  sol4 r8 sol
  sol do, r do fa4 r8 fa
  fa sib, r4 mib8. mib16 mib4

  %21
  mib4. re16 do re[do] sib8 r fa'
  sib,16[do] re[mib] fa8 fa fa16[mib] fa8 r fa
  fa4~fa16 [sol fa sol] fa4~fa16 [sol fa sol]

  %24
  fa8[mib16 re mib fa] sol[la] sib fa fa8 r fa
  fa [mib16 re] mib8[re16 do] re[do re mib fa8] mib
  re8 do16 sib do4\tr sib r

  %27
  R1*2
  r4 r8 sib
  mib sib mib16[fa] sol[fa] mib8 sib r4

  %31
  mib8 sib16 sib sib8 sol' sol fa r4
  fa8 sib,16 sib sib8 lab' lab sol r mib
  sol4 r8 sol sol do, r do

  %34
  fa4 r8 fa fa sib, r4
  mib8 mib16 mib mib8 mib16 mib lab8[sol16 fa mib re] do[sib]
  sol'8 fa16[mib] re4 mib r8 sib

  %37
  mib mib mib mib mib16[fa] sol[fa] mib8 r
  fa8 sib,16 sib sib8 sib16 lab'\mbreak sol8 fa16 mib fa4\tr
  mib r r2

  %40
  R1*2

}

IItesto = \lyricmode {

    Ad te ad te cla -- mamus _ exsules _ _ exsules _ _ exsules _ _ filii _ _ Evae _

    ad te cla -- mamus _ ad te cla -- mamus _ exsules _ _ filii _ _ Evae _

    ad te ad te cla -- mamus _ clama - - - mus exsules _ _ cla -- ma - - mus filii _ _ Evae. _

    Ad te ad te cla -- mamus _ exsules _ _ filii _ Evae _ exsules _ _ filii _ Evae _ ad te cla -- mamus _

    ad te cla -- mamus _ exsules _ _ filii _ _ E -- vae filii _ Evae _

     ad te cla -- mamus _ exsules _ _ exsules _ _ filii _ _ filii _ _ Evae. _

}

IIbcIn = \relative do {

    r8
    mib r mib r mib r mib, r
    R1
    mib'4 r mib r

    %4
    mib r mib,8 mib' lab la
    sib sib, lab sol mib''4 mib,
    lab r re re,\mbreak

    %7
    sol r do do,
    fa r sib sib,
    mib8 sib sib sib sib4 r

    %10
    sib r r2
    r8 sib sib sib sib4 r
    sib8 sib sib sib mib mib, sib''[sib,]

    %13
    mib4 r mib8 r mib r
    mib r mib, r r2
    r mib'4 r

    %16
    mib r mib r
    mib,8 mib' lab la sib sib, sib sib
    mib4\pp mib,\mbreak

    %19
    lab' r re re,
    sol r do do,
    fa r sib sib,

    %22
    fa'8 fa fa fa fa4 r
    fa8 fa fa fa fa4 r
    fa8 fa fa fa fa4 r

    %25
    fa8 r fa r sib, sib' lab fa
    sib sib, fa'[fa,] sib r sib r
    sib r sib r r2

    %28
    r4 r8 sib' sib sib, fa' fa,\mbreak  %%% OK
    sib sib' sol fa
    mib r mib r mib mib, r4

    %31
    mib'8 mib, r4 sib''8 sib, r4
    sib'8 sib, r4 sib'8 mib, r4
    mib' mib, lab r

    %34
    re re, sol r
    do do, fa r8 sib,
    mib lab sib sib,mib mib, r4

    %37
    mib'8 mib, r4 mib'8 mib, r4
    sib''8 sib, r4\mbreak mib8 mib, r4
    mib'8 mib, r4 mib'8 mib, r4

    %40
    mib'8 mib, r4 mib'8 mib, r4
    mib'8 r sib r mib,2\fermata

}

IIbfIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s1*3
  s2 s4 s8 <7>
  <6 4> <5 3> s4 s2
  s1*3
  s8 <6 4> s4 s2
  s1
  s8 <6 4> s4 s2
  s4 s8 <7> s2
  s1*4
  s4 s8 <7> <6 4> <9 6 3> s4
  s2
  s1*2
  <_!>1
  <6 4>
  <7 5>
  <6 4>
  s4 <7> s2
  s1*3
  s2
  s1
  s2 <6 4>8 <5 3> s4
  s2 <7 5>8 <3> s4

}

IIvlIIIn = \relative do'' {

    r8
    r2 r4 r8 sib\p
    mib sib mib sib sol'16 lab sib lab sol8 mib
    r4 sol8 mib r4 sib8 sol

    %4
    r4 mib8 sib sol''8\f[lab16 sib lab8 sol]
    sol\tr fa r4  r2
    mib16\f[re do sib lab sol fa mib] fa8 lab re r\mbreak

    %7
    re16[do sib lab sol fa mib re] mib8 sol do r
    do16[sib lab sol fa mib re do] re8 fa sib r
    R1

    %10
    r4 lab~lab8.[(sol32 lab sib8) lab]
    sib,4 r r2
    r8 re' fa lab sol8. fa32 mib fa4\tr

    %13
    mib r r2
    r4 r8 sib\p mib sib mib sib
    sol'16 lab sib lab sol8 mib r4 sol8 mib

    %16
    r4 sib8 sol r4 mib8 sib
    sol''8[lab16 sib lab8 sol] sol\tr fa r4
    R2

    %19
    mib16\pp[re do sib lab sol fa mib] fa8 lab re r
    re16[do sib lab sol fa mib re] mib8 sol do r
    do16[sib la sol fa mib re do] re' do sib la sol fa mib re

    %22
    sib'4 r r2
    r4 mib~mib8.[(re32 mib fa8) re]
    fa,4 r r2

    %25
    R1*2
    r2 sib8\f fa sib fa
    re'16 mib fa mib re8 fa sib re, do la'\mbreak

    %29
    sib4 r
    r2 r4 sol8 \pp mib
    r4 sib8 sol r4 fa8 re

    %32
    r4 re'8 sib r4 sol8 mib
    r2 mib'16[re do sib lab sol fa mib]
    fa8 lab re r re16[do sib lab sol fa mib re]

    %35
    mib8 sol do r re4 r
    r2 r4 sol8 mib
    r4 sib8 sol r4 mib8 sib

    %38
    r4 re'8 sib\mbreak r4 sib8 fa r4
    sol'8 mib r4 sib8 sol
    r4 mib8 sib r4 mib8 sib

    %41
    sol'' r fa r sol2\fermata

}

IIvlIVn = \relative do'' {

    r8
    r2 r4 r8 sol\p
    sib sol sib sol mib'16 fa sol fa mib8 sib
    r4 mib8 sib r4 sol8 mib

    %4
    r4 sib8 sol mib''8\f[fa16 sol fa8 mib]
    mib\tr re r4 r2
    do16[sib lab sol fa mib re do] re8 fa lab r\mbreak

    %7
    sib16[lab sol fa  mib re do sib] do8 mib sol r
    lab16[sol fa mib re do sib lab] sib8 re fa r
    R1

    %10
    r4 fa~fa8.[(mib32 fa sol8) fa]
    sib,4 r r2
    r8 sib' re fa mib4 re\tr

    %13
    mib r r2
    r4 r8 sol,\p sib sol sib sol
    mib'16 fa sol fa mib8 sib r4 mib8 sib

    %16
    r4 sol8 mib r4 sib8 sol
    mib''8[fa16 sol fa8 mib] mib re r4
    R2

    %19
    do16\pp[sib lab sol fa  mib re do] re8 fa lab r
    sib16[lab sol fa mib re do sib] do8 mib sol r
    la16[sol fa mib re do sib la] sib'[la sol fa mib re do sib]

    %22
    re'4 r r2
    r4 do~do8.[(sib32 do re8) sib]
    fa4 r r2

    %25
    R1*2
    r2 fa8\f re fa re
    sib'16 do re do sib8 re

    %29
    fa sib,  la do\mbreak
    re4 r
    r2 r4 mib8\pp sib

    %31
    r4 sol8 mib r4 re8 sib
    r4 sib'8 fa r4 mib8 sib
    r2 do'16[sib lab sol fa mib re do]

    %34
    re8 fa lab r sib16[lab sol fa mib re do sib]
    do8 mib sol r sib4 r
    r2 r4 mib8 sib

    %37
    r4 sol8 mib r4 sib8 sol
    r4 sib'8 fa\mbreak r4 fa8 re
    r4 mib'8 sib r4 sol8 mib

    %40
    r4 sib8 sol r4 sib8 sol
    mib'' r re r mib2\fermata

}

IIvlaIIn = \relative do' {

    r8
    r2 r4 r8 mib\p
    sol mib sol mib sib' r sib r
    r4 sib8 sol r4 mib8 sib

    %4
    r4 sol8 mib sib''\f  sib do do
    sib4 r r2
    lab,4 lab lab r\mbreak

    %7
    sol sol sol r
    fa fa fa r
    R1

    %10
    r8 sib sib sib sib4 r
    R1
    r8 fa' sib re sib4 sib

    %13
    sol4 r r2
    r4 r8 mib\p sol mib sol mib
    sib' r sib r r4 sib8 sol

    %16
    r4 mib8 sib r4 sol8 mib
    sib''8 sib do do sib sib r4
    R2\mbreak

    %19
    lab,4\pp lab lab r
    sol sol sol r
    fa fa fa r

    %22
    R1
    fa'8 fa fa fa fa4 r
    fa8 fa fa fa fa4 r

    %25
    R1*2
    r2 re8\f sib re sib
    fa' r fa r fa r fa r\mbreak

    %29
    fa4 r
    r2 r4 sib8\pp sol
    r4 mib8 sib r4 sib8 fa

    %32
    r4 fa'8 re r4 sib8 sol
    r2 lab4 lab
    lab r sol sol

    %35
    sol r re' r
    r2 r4 sib'8 sol
    r4 mib8 sib r4 sol8 mib

    %38
    r4 fa'8 re\mbreak r4 re8 sib
    r4 sib'8 sol r4 mib8 sib
    r4 sol8 mib r4 sol8 mib

    %41
    sib''8 r sib r sib2\fermata

}

IIbcIIn = \relative do {

    r8
    R1
    mib8 r mib r mib r mib, r
    r4 mib' r mib

    %4
    r mib mib,8\f mib' lab la
    sib sib, lab sol r2
    lab'4 lab, re r\mbreak

    %7
    sol sol, do r
    fa fa, sib r
    R1

    %10
    r8 sib sib sib sib4 r
    R1
    r8 sib sib sib sib8 mib, sib''[sib,]

    %13
    mib4 r r2
    r mib8\p r mib r
    mib r mib, r r4 mib'

    %16
    r mib r mib
    mib,8 mib' lab la sib sib, sib sib
    R2\mbreak

    %19
    lab'4 lab, re r
    sol sol, do r
    fa fa, sib r

    %22
    fa'8 fa fa fa fa4 r
    fa8 fa fa fa fa4 r
    fa8 fa fa fa fa4 r

    %25
    R1*2
    r2 sib,8 r sib r
    sib r sib r sib' sib, fa'[fa,]\mbreak

    %29
    sib4 r
    r2 r4 mib8 mib,
    r4 mib'8 mib, r4 sib''8 sib,

    %32
    r4 sib'8 sib, r4 mib8 mib,
    r2 lab'4 lab,
    re r sol sol,

    %35
    do r sib r
    r2 r4 mib8 mib,
    r4 mib'8 mib, r4 mib'8 mib,

    %38
    r4 sib''8 sib,\mbreak r4 sib'8 sib,
    r4 mib8 mib, r4 mib'8 mib,
    r4 mib'8 mib, r4 mib'8 mib,

    %41
    mib' r sib r mib,2\fermata

}

IIbfIIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s1*3
  s2 s4 s8 <7>
  <6 4> <5 3> s4 s2
  s1*4
  s8 <7 5> s4 s2
  s1
  s4 s8 <7> s2
  s1*4
  s4 s8 <7> <6 4> <9 6 3> s4
  s2
  s1*2
  <_!>1
  <6 4>
  <7 5>
  <6 4>

}

forma = {

  \time 4/4
  \key do\minor
  \tempo 2 = 60
  \partial 8 s8
  s1*17
  \set Score.measureLength = #(ly:make-moment 2 4)
  s2
  \set Score.measureLength = #(ly:make-moment 4 4)
  s1*10
  \set Score.measureLength = #(ly:make-moment 2 4)
  s2
  \set Score.measureLength = #(ly:make-moment 4 4)
  s1*12
  \bar "||"

}

IIflI = {
  \IIglobal
  <<\IIflIn\forma>>
}

IIflII = {
  \IIglobal
  <<\IIflIIn\forma>>
}

IIvlI = {
  \IIglobal
  <<\IIvlIn\forma>>
}

IIvlII = {
  \IIglobal
  <<\IIvlIIn\forma>>
}

IIvlaI = {
  \IIglobal
  \clef alto
  <<\IIvlaIn\forma>>
}

IIvoce = {
  \new Voice = "salve"
  \IIglobal
  \clef alto
  <<\IIvocen\forma>>
}

IIbcI = {
  \IIglobal
  \clef bass
  <<\IIbcIn\forma\IIbfIn>>

}

IIvlIII = {
  \IIglobal
  <<\IIvlIIIn\forma>>
}

IIvlIV = {
  \IIglobal
  <<\IIvlIVn\forma>>
}

IIvlaII = {
  \IIglobal
  \clef alto
  <<\IIvlaIIn\forma>>
}

IIbcII = {
  \IIglobal
  \clef bass
  <<\IIbcIIn\forma\IIbfIIn>>
  \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \senza
    %\set Score.skipTypesetting = ##t

}

IIIfltn = \relative do'' {

    re8
    sol[la16 sib la8 sol] do sib r la
    sib[la16 sol fad8 sol] la re, r re
    \tuplet 3/2 { sol16 sib la sol[fad sol] sol la sib sib[la sol] } do8 sib r la

    %4
    \tuplet 3/2 { sib16 re do sib[la sol] fad sol la sol[la sib] } la8 re, r re
    \tuplet 3/2 { mib16 sol fa mib[re do] } do8\tr sol' \tuplet 3/2 { fad16 la sol fad[mi ?re] } re8\tr la'
    \tuplet 3/2 { sol16 sib la sol[fa mib]  } mib8 do' \tuplet 3/2 { fad,16 la sol fad[mi? re] do mib! re do[sib la] }\mbreak

    %7
    sib8 sol' r la r sib r do
    \tuplet 3/2 { sib16  re do sib[la sol] } lab4~\tuplet 3/2 { lab16 do sib lab[sol fad] sol sib la? sol [fa? mib] }
    re8 sol16 la la4\tr sol r  %%% fine ripresa

    %10
    R1*6
    re8[fa16 sol la8 re,] sib' la r sol
    \tuplet 3/2 { fa16 la sol fa[mi re] dod mi re dod[si la] } fa'8 re \tuplet 3/2 { r16 re mi fa[sol la]

    %18
    la re, mi fa[sol la] la re, mi fa[sol la]} sib8 la~\tuplet 3/2 { la16 mi fa sol[fa mi]
    fa mi re sol[fa mi]} mi4\tr re r
    R1*3

    %23
    r4 r8 sol la2~
    la8[sib16 la sib la sol fa] sol2~
    sol8[la16 sol la sol fad mi!] fad2

    %26
    sol16 la sib8 r4 r r8 sib
    dod2\mbreak  re4 do?
    sib r8 sib sib do4 sib16 la

    %29
    sib8 do4 sib16 la sib8 do4 sib16 la
    sib8 sib sib sib sib32 la sol8. sol32 fa mib8.
    mib?2~mib4 re8 do

    %32
    sib4 r8 sib' sib[la16 sib do8 sib16 la]
    sib8[la16 sib do8 sib16 la] sib8[la16 sib do8 sib16 la]
    sib8 sol r4 r r8 sol

    %35
    mib2~mib4. re16 do
    sib8 sib' la4\fermata\mbreak  sol4 r8 re
    sol[la16 sib la8 sol] do sib r la

    %38
    sib[la16 sol fad8 sol] la re, r re
    \tuplet 3/2 { sol16 sib la sol[fad sol] sol la sib sib[la sol] } do8 sib r la
    \tuplet 3/2 { sib16 re do sib[la sol] fad sol la sol[la sib] } la8 re, r re

    %41
    \tuplet 3/2 { mib16 sol fa mib[re do] } do8\tr sol' \tuplet 3/2 { fad16 la sol fad[mi ?re] } re8\tr la'
    \tuplet 3/2 { sol16 sib la sol[fa mib]  } mib8 do' \tuplet 3/2 { fad,16 la sol fad[mi? re] do mib! re do[sib la] }\mbreak
    sib8 sol' r la r sib r do

    %44
    \tuplet 3/2 { sib16  re do sib[la sol] } lab4~\tuplet 3/2 { lab16 do sib lab[sol fad] sol sib la? sol [fa? mib] }
    re8 sol16 la la4\tr sol \fermata r

}

IIIvlIn = \relative do'' {

    r8
    sol,\p sol' fa  mib re sol re' fad,
    sol sib la sol fad mi re do
    sol  sol' sib sol fad sol re' fad,

    %4
    sol sol, re'[sol] fad  re sib[sol]
    do re mib do re mi? fad re
    mib fa? sol mib re mi? fad re\mbreak

    %7
    sol, sol' fad re sol, sol' fad re
    sol, sol' do,[si] do do' sib do
    fad, sol re' re, sol,4 r % ripresa

    %10
    r8 sib'\p sib sib r la la la
    r la do do r do do do
    r sib sib sib r do do do\mbreak

    %13
    r do do do r do do do
    r la la la r sib sib sib
    r mi mi mi r re dod dod

    %16
    re, mi fa re sol fa la dod,
    re re' la[la,] re mi fa mi
    re mi fa re\mbreak sol re dod la

    %19
    re sib' la la, re la' la la
    r la la la r la la la
    r la la la r la la la

    %22
    r la la la r sib sib sib
    R1*5
    r4 r8 sol sol do re re,

    %29
    sol, do' re re, sol, do' re re,
    sol, la sib sol do re mib re
    do re mib do re mi? fad re

    %32
    sol, la sib la sol sol' do, re
    sol, sol' do, re sol, sol' do, re
    sol, la sib la sol la sib sol

    %35
    do re mib do re re mib fad
    sol sol, re'4\fermata\mbreak sol,4 r
    sol8\p sol' fa  mib re sol re' fad,

    %38
    sol sib la sol fad mi re do
    sol  sol' sib sol fad sol re' fad,
    sol sol, re'[sol] fad  re sib[sol]

    %41
    do re mib do re mi? fad re
    mib fa? sol mib re mi? fad re\mbreak
    sol, sol' fad re sol, sol' fad re

    %44
    sol, sol' do,[si] do do' sib do
    fad, sol re' re, sol,4\fermata r

}

IIIvlIIn = \relative do'' {

    r8
    sol,\p sol' fa  mib re sol re' fad,
    sol sib la sol fad mi re do
    sol  sol' sib sol fad sol re' fad,

    %4
    sol sol, re'[sol] fad  re sib[sol]
    do re mib do re mi? fad re
    mib fa? sol mib re mi? fad re\mbreak

    %7
    sol, sol' fad re sol, sol' fad re
    sol, sol' do,[si] do do' sib do
    fad, sol re' re, sol,4 r % ripresa

    %10
    r8 sol'\p sol sol r fad fad fad
    r fad? la la r la la la
    r sol sol sol r sol sol sol\mbreak

    %13
    r sol sol sol r la la la
    r fad fad fad r sol sol sol
    r la la la r la la la

    %16
    re, mi fa re sol fa la dod,
    re re' la[la,] re mi fa mi
    re mi fa re\mbreak sol re dod la

    %19
    re sib' la la, re fa fa fa  %%%%%% OK
    r fa fa fa r fa fa fa
    r fa fa fa r fad fad fad

    %22
    r fad? fad fad r sol sol sol
    R1*5
    r4 r8 sol sol do re re,

    %29
    sol, do' re re, sol, do' re re,
    sol, la sib sol do re mib re
    do re mib do re mi? fad re

    %32
    sol, la sib la sol sol' do, re
    sol, sol' do, re sol, sol' do, re
    sol, la sib la sol la sib sol

    %35
    do re mib do re re mib fad
    sol sol, re'4\fermata\mbreak sol,4 r
    sol8\p sol' fa  mib re sol re' fad,

    %38
    sol sib la sol fad mi re do
    sol  sol' sib sol fad sol re' fad,
    sol sol, re'[sol] fad  re sib[sol]

    %41
    do re mib do re mi? fad re
    mib fa? sol mib re mi? fad re\mbreak
    sol, sol' fad re sol, sol' fad re

    %44
    sol, sol' do,[si] do do' sib do
    fad, sol re' re, sol,4\fermata r

}

IIIvlaIn = \relative do' {

    r8
    sol\p sol' fa  mib re sol re' fad,
    sol sib la sol fad mi re do
    sol  sol' sib sol fad sol re' fad,

    %4
    sol sol, re'[sol] fad  re sib[sol]
    do re mib do re mi? fad re
    mib fa? sol mib re mi? fad re\mbreak

    %7
    sol, sol' fad re sol, sol' fad re
    sol, sol' do,[si] do do' sib do
    fad, sol re' re, sol,4 r % ripresa

    %10
    r8 re'\p re re r re re re
    r fad fad fad r fad fad fad
    r re re re r mib mib mib\mbreak

    %13
    r mi! mi mi r fa fa fa
    r fad re re r re re re
    r dod dod dod r fa mi mi

    %16
    re mi fa re sol fa la dod,
    re re' la[la,] re mi fa mi
    re mi fa re\mbreak sol re dod la

    %19
    re sib' la la, re re la la
    r re re re r re re re
    r re re re r re re re

    %22
    r re re re r re re re
    R1*5
    r4 r8 sol sol do re re,

    %29
    sol, do' re re, sol, do' re re,
    sol, la sib sol do re mib re
    do re mib do re mi? fad re

    %32
    sol, la sib la sol sol' do, re
    sol, sol' do, re sol, sol' do, re
    sol, la sib la sol la sib sol

    %35
    do re mib do re re mib fad
    sol sol, re'4\fermata\mbreak sol4 r
    sol,8\p sol' fa  mib re sol re' fad,

    %38
    sol sib la sol fad mi re do
    sol  sol' sib sol fad sol re' fad,
    sol sol, re'[sol] fad  re sib[sol]

    %41
    do re mib do re mi? fad re
    mib fa? sol mib re mi? fad re\mbreak
    sol, sol' fad re sol, sol' fad re

    %44
    sol, sol' do,[si] do do' sib do
    fad, sol re' re, sol,4\fermata r

}

IIIvocen = \relative do' {

    \autoBeamOff

    r8
    R1*8
    r2 r4 r8 re
    sol sol r sol sol fad r la

    %11
    do,2~do8 [fad] la do,
    do sib r re mib4 mib8 sol\mbreak
    \appoggiatura fa8 mi!2 fa4. la8

    %14
    \appoggiatura sol8 fad2 sol4~ sol16 [fa? mi re]
    dod[si] la8 r mi'16 sol fa8 mi16[re] dod4\tr
    re4 r r2

    %17
    R1*2  %%%%%% OK
    r4 r8 la' fa16[sol] la8 r dod,
    re16[dod] re8 r la' sib16[sol] la8 r fa

    %21
    sol16[mi] fa8 r la do,4 do8 do
    la'16[sol fad mi] re8 do do sib r re
    mib2~mib8[fa16 mib fa mib re do]

    %24
    re2~re8[mib16 re mib re do sib]
    do2~do8[re16 do re do sib la]
    sib[do] re8 r sol sol4 sol8 sol

    %27
    sol2\mbreak fad
    sol4 r8 sol sol la4 sol16[fad]
    sol8 la4 sol16[fad] sol8 la4 sol16[fad]

    %30
    sol8 [sol sol sol] sol32[fa? mib8.] mib32[re do8.]
    do4 la' \appoggiatura sol8 fad2
    sol8 re r sol sol fad16 sol la8 sol16[fad]

    %33
    sol8 fad16 sol la8 sol16 fad sol8 fad16 sol la8 sol16 fad
    sol8 re r sol re4 re8 re
    re4 do fad4. sol16[la]

    %36
    re,8 sol fad4\fermata sol4 r
    R1*9

}

IIItesto = \lyricmode {

    Ad te sus -- piramus _ _  ge -- men -- tes et flentes _ in hac lacri - ma - - - - - rum lacrimarum _ _ _ valle. _

    Ad te sus -- pi -- ramus _  ge -- men -- tes et flentes _ in hac lacri - ma -  rum valle _

    ge -- men - - - tes gementes _ _ et flen - tes in hac lacrima - - - - - - - - - - - - - - rum

    in hac lacri - marum _ valle _ gementes _ _ et flentes  _ gementes _ _ et flentes  _

    in hac lacrima - - - - - - rum val -- le.

}

IIIbcIn = \relative do {

    r8
    R1*9
    r8 sol' sol sol r re re re
    r re re re r re re re

    %12
    r sol, sol sol r do do do\mbreak
    r sib sib sib r la la la
    r re re do r sib sib sib

    %15
    r la la la r re la' la,
    re4 r r2
    R1*2

    %19
    r2 r8 re la la
    r re re re r re re re
    r re re re r re re re

    %22
    r re re re r sol, sol sol
    r do do do r fa fa fa
    r sib, sib sib r mib mib mib

    %25
    r la, la la r re re re
    r sol, sol sol r sol' sol sol
    r la la la\mbreak r re, re re

    %28
    r sol sol sol r2
    R1*17

}

IIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1*9
    s2 s8 <_+> s4
    s8 <7> s4 s2
    s s8 <_-> s4
    s8 <6 4!> s4 s8 <6> s4
    s8 <_+> s4 s2
    s8 <_+> s4 s <_+>
    s1*6
    s8 <_+> s4 s2
    s8 <_-> s4 s8 <7> s4
    s8 <7> s4 s8 <7> s4
    s8 <7> s4 s8 <7 _+> s4
    s2 s8 <_-> s4
    s8 <7 _+> s4 s8 <_+> <7>

}

forma = {

    \time 4/4
    \key re\minor
    \tempo 4 = 50
    \partial 8 s8
    s1*45
    \bar "||"

}

IIIflt = {
    \IIIglobal
    <<\IIIfltn\forma>>
}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn\forma>>
}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn\forma>>
}

IIIvlaI = {
    \IIIglobal
    \clef alto
    <<\IIIvlaIn\forma>>
}

IIIvoce = {
    \new Voice = "ad te"
    \IIIglobal
    \clef alto
    <<\IIIvocen\forma>>
}

IIIbcI = {
    \IIIglobal
    \clef bass
    <<\IIIbcIn\forma\IIIbfIn>>
    \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IVglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    %\set Score.skipTypesetting = ##t

}

IVvlIn = \relative do'' {

    mib,4\f sol
    sib mib,
    sib8[fa'(sol lab)]

    %4
    sol\staccatissimo fa\staccatissimo mib4
    sib8[fa'(sol lab)]
    sol fa mib4

    %7
    lab4. fa8
    sol4. mib8
    fa4. re8

    %25
    mib[sib lab sol]
    sib'4 r8 do
    la[sib do fa,]

    %13
    mib4 r8 fa
    re[mib fa sib]
    mib, sol fa4\tr

    %16
    sib,2
    mib4 sol
    sib mib,\mbreak

    %19
    sib8 [fa' (sol lab)]
    sol[fa] mib4
    sib8 [fa' sol lab]

    %22
    sol[fa] mib4
    lab4. fa8
    sol4. mib8

    %25
    fa4. re8
    mib[sib ] sol sib'
    mib,4 r8 fa

    %28
    re[mib fa sib]
    mib,4 r8 fa
    re[mib fa fa]

    %31
    fa  [mib mib re]
    re [mib fa sib]
    mib, sol fa4\tr \mbreak

    %34
    sib,2
    mib4\f  sol
    sib mib,

    %37
    sib8[fa' sol lab]
    sol fa mib4
    mib\p sol

    %40
    sib mib,
    sib8[fa' sol lab]
    sol fa mib4

    %43
    sol4 sol
    sol4 sol8 sol
    sol [sol sol sol]

    %46
    lab8. sol16 lab4
    la la
    la? la8 la

    %49
    la? la la la
    sib8. la16 sib8 fa
    sib, lab'?4 sol16[fa]

    %52
    sol8 sol4 fa16[mib]\mbreak
    fa8 fa4 mib16[re]
    mib[fa sol lab] sib8 fa

    %55
    sib,4 r8 lab'8
    sol8[fa mib fa]
    sib,4 r8 lab'

    %58
    sol[fa mib sib]
    lab' [lab lab lab]
    lab sol16 fa sol8 mib

    %61
    lab, do sib4\tr
    mib r
    sol8 [fa mib reb]

    %64
    reb?4 do
    la'8 [sol fa mib]
    mib4 re

    %67
    fa sib,
    fa' sib,
    r4 r8 sib

    %70
    do [do re re]\mbreak
    mib [mib fa fa]
    sol [sol lab lab]

    %73
    lab sol16 fa sol8 mib
    sib mib fa4\tr
    mib r8 sol

    %76
    lab [lab lab lab]
    lab sol16 fa sol8 mib
    lab,4 do

    %79
    sib2
    mib8\f[fa sol lab]
    sib[do re sib]

    %82
    mib[sib do sol]
    lab[fa sib sib,]
    mib2\fermata

}

IVvocen = \relative do' {

    \autoBeamOff

    R2*16
    mib4 sol
    sib mib,\mbreak

    %19
    sib8 fa'[(sol lab)]
    sol[fa] mib4
    sib8 fa' sol lab

    %22
    sol[fa] mib4
    lab4. fa8
    sol4 sol8 mib

    %25
    fa fa fa re
    mib8. sib16 sib8 sib'
    mib,4 r8 fa

    %28
    re[mib] fa sib
    mib,4 r8 fa
    re[mib] fa fa

    %31
    fa  mib mib re
    re mib fa sib
    mib, sol fa4\tr \mbreak

    %34
    sib,2
    R2*4
    mib4 sol

    %40
    sib mib,
    sib8 fa' sol lab
    sol[fa] mib4

    %43
    sol sol
    sol4 sol8 sol
    sol sol sol sol

    %46
    lab8. sol16 lab4
    la la
    la? la8 la

    %49
    la? la la la
    sib8. la16 sib8 fa
    sib, lab'?4 sol16[fa]

    %52
    sol8 sol4 fa16[mib]\mbreak
    fa8 fa4 mib16[re]
    mib[fa sol lab] sib8 fa

    %55
    sib,4 r8 lab'8
    sol8[fa] mib fa
    sib,4 r8 lab'

    %58
    sol[fa] mib sib
    lab' lab lab lab
    lab sol16[fa] sol8 mib

    %61
    lab, do sib4\tr
    mib r
    sol8 fa mib reb

    %64
    reb?4 do
    la'8 sol fa mib
    mib4 re

    %67
    fa sib,
    fa' sib,
    r4 r8 sib

    %70
    do do re re\mbreak
    mib mib fa fa
    sol sol lab lab

    %73
    lab sol16[fa] sol8 mib
    sib mib fa4\tr
    mib r8 sol

    %76
    lab lab lab lab
    lab sol16[fa] sol8 mib
    lab,4 do

    %79
    sib2
    mib4 r
    R2*4

}

IVtesto = \lyricmode {

    Eia _ ergo, _ advo - cata _ advo - cata _ nostra, _ illos _ tuos _ mi -- sericordes _ _ _ ocu - los ad nos con -- verte _

    ad nos con -- verte _ mise - ricordes  _ _ ocu - los ad nos conver - te.

    Eia _ ergo, _ advo - cata _ nostra, _ illos _ tuos _ mi -- sericordes _ _ _ ocu - los

    illos _ tuos _ mi -- sericordes _ _ _ ocu - los ad nos conver - - - - - - - - te ad nos con -- verte _ ad nos con -- verte _

    mise - ricordes  _ _ ocu - los ad nos conver - te advo - cata _ nostra, _ advo - cata _ nostra, _ eia _ ergo _

    mi -- sericordes _ _ _ ocu - los  mi -- sericordes _ _ _ ocu - los ad nos conver - te

    mi -- sericordes _ _ _ ocu - los ad nos conver - te.

}

IVbcIn = \relative do {

    mib4\f sol
    sib mib,
    sib8[fa'(sol lab)]

    %4
    sol\staccatissimo fa\staccatissimo mib4
    sib8[fa'(sol lab)]
    sol fa mib4

    %7
    lab8 [sol lab fa]
    sol[fa sol mib]
    fa[mib fa re]

    %10
    mib[sib lab sol]
    sib'4 r8 do
    la[sib do fa,]

    %13
    mib4 r8 fa
    re[mib fa sib]
    mib, sol fa4\tr

    %16
    sib,2
    mib4 \p sol
    sib mib,\mbreak

    %19
    sib8[fa' sol lab]
    sol fa mib4
    sib8[fa' sol lab]

    %22
    sol fa mib4
    lab8 [sol lab fa]
    sol[fa sol mib]

    %25
    fa[mib fa re]
    mib[sib ] sol sib'
    mib,4 r8 fa

    %28
    re[mib fa sib]
    mib,4 r8 fa
    re[mib fa fa]

    %31
    fa[mib mib re]
    re[mib fa sib]
    mib, sol fa4\mbreak

    %34
    sib,2
    mib4\f  sol
    sib mib,

    %37
    sib8[fa' sol lab]
    sol fa mib4
    mib\p sol

    %40
    sib mib,
    sib8[fa' sol lab]
    sol fa mib4

    %43
    mib8[fa sol fa]
    mib[fa sol mib]
    reb[do reb sib]

    %46
    do[sib do lab]
    fa'[sol la sol]
    fa[sol la fa]

    %49
    mib[re mib do]
    re[do re sib]
    sib4 sib

    %52
    sib sib\mbreak
    sib sib
    mib8[fa sol fa]

    %55
    sib,4 r8 lab'
    sol[fa mib fa]
    sib,4 r8 lab'

    %58
    sol[fa mib sib]
    sib[do re do]
    sib[sib' sol mib]

    %61
    lab, do sib4
    mib8[fa sol fa]
    mib4 mib,

    %64
    lab8[sib do lab]
    fa'4 fa,
    sib8[do re do]

    %67
    sib[do re do]
    sib[do re do]
    sib[do re sib]

    %70
    do[do re re]\mbreak
    mib[mib fa fa]
    sol[sol lab lab]

    %73
    sib,[sib' sol mib]
    sib[mib sib' sib,]
    mib[fa sol mib]

    %76
    fa[mib re do]
    sib[sib' sol mib]
    lab, [lab do do]

    %79
    sib2
    mib8\f[fa sol lab]
    sib[do re sib]

    %82
    mib[sib do sol]
    lab[fa sib sib,]
    mib2\fermata

}

IVbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*44
    <6 4>2
    s
    <_!>
    s
    <6 4!>
    s
    s8 <7>4 s8
    <6 4>2
    <5 3>
    s2*5
    <7>2
    s2*3
    s4 s8 <7->
    <5 4->4 s8 <3>
    <_!>4 s8 <7>
    <5 4>2
    <3>
    s2*5
    <7>2
    s2*3
    <7>2

}

forma = {

    \time 2/4
    \key do\minor
    \tempo 2 = 50
    s2*84
    \bar "||"

}

IVvlI = {
    \IVglobal
    <<\IVvlIn\forma>>
}

IVvoce = {
    \new Voice = "eia"
    \IVglobal
    \clef alto
    <<\IVvocen\forma>>
}

IVbcI = {
    \IVglobal
    \clef bass
    <<\IVbcIn\forma\IVbfIn>>
    \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


Vglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    %\set Score.skipTypesetting = ##t \senza

}

VvlIn = \relative do'' {

    \tuplet 3/2 { sol16(sib re) sol,[(sib re)] sol,(sib re) }
    fad,4 r8
    \tuplet 3/2 { sol16(sib re) sol,[(sib re)] sol,(sib re) }

    %4
    fad,4 r8
    \tuplet 3/2 { re'16(sol sib) re,[(sol sib)] re,( sol sib) }
    mi,4 r8

    %7
    \tuplet 3/2 { do16 fa la do,[fa la] do, fa la }
    re,4 r8
    \tuplet 3/2 { sib16 mib sol sib,[mib sol] sib, mib sol }

    %10
    do,4 r8
    \tuplet 3/2 { la16 re fad la,[re fad] la, re fad }
    <<{sol^\markup\italic"P.mi" re re mib mib re}\\{sol_\markup\italic"2.di"  sib, sib do do sib}>>

    %13
    <<re4\\sib>> r8
    \tuplet 3/2 { sib16 re sol sib,[re sol] la, re fad }\mbreak
    sol4 r8

    %16
    \tuplet 3/2 { sol,16\p sib re sol,[sib re] sol, sib re }
    fad,4 r8
    \tuplet 3/2 { fad16 la re fad,[la re] fad, la re }

    %19
    re,4 r8
    \tuplet 3/2 { sib'16 re sol sib,[re sol] sib, re sol}
    sib,4 r8

    %22
    \tuplet 3/2 { la16 dod mi la,[dod mi] la, dod mi }
    la,4 r8
    \tuplet 3/2 { sol16 si re sol,[si re] sol, si re }

    %25
    sol,4 r8
    \tuplet 3/2 { fa16 la do fa,[la do] fa, la do }
    fa,4 r8\mbreak

    %28
    \tuplet 3/2 { fa16 sib re fa,[sib re] fa, sib re }
    fa,4 r8
    \tuplet 3/2 { fa16 sib re fa,[sib re] fa, sib re }

    %31
    fa,4 r8
    \tuplet 3/2 { fa16 sib re fa,[sib re] fa, sib re }
    fa,4 r8

    %34
    \tuplet 3/2 { re'16\f fa sib re,[fa sib] re, fa sib }
    \tuplet 3/2 { do, fa la do,[fa la] do, fa la }
    sib4 r8

    %37
    \tuplet 3/2 { fa,16\p sib re fa,[sib re] fa, sib re }
    do4 r8
    \tuplet 3/2 { la16 do mib la,[do mib] fa, la do }

    %40
    sib4 r8\mbreak
    \tuplet 3/2 { sib16 re sol sib,[re sol] sib, re sol}
    re4 r8

    %43
    \tuplet 3/2 { la16 dod mi la,[dod mi] la, dod mi }
    la,4 r8
    \tuplet 3/2 { sol16 si re sol,[si re] sol, si re }

    %46
    sol,4 r8
    \tuplet 3/2 { fa16 la do fa,[la do] fa, la do }
    fa,4 r8

    %49
    \tuplet 3/2 { do'16 mib sol do,[mib sol] do, mib sol}
    la,4 r8
    \tuplet 3/2 { sol16 sib re sol,[ sib re] sol, sib re }

    %52
    sol,4 r8\mbreak
    \tuplet 3/2 { sol16 sib re sol,[ sib re] sol, sib re }
    sol,4 r8

    %55
    \tuplet 3/2 { sol16\f sib re sol,[ sib re] sol, sib re }
    fad,4 r8
    sol'8 la fad

    %58
    sol4.\fermata

}

VvlIIn = \relative do'' {

    \tuplet 3/2 { sol16(sib re) sol,[(sib re)] sol,(sib re) }
    fad,4 r8
    \tuplet 3/2 { sol16(sib re) sol,[(sib re)] sol,(sib re) }

    %4
    fad,4 r8
    \tuplet 3/2 { re'16(sol sib) re,[(sol sib)] re,( sol sib) }
    mi,4 r8

    %7
    \tuplet 3/2 { do16 fa la do,[fa la] do, fa la }
    re,4 r8
    \tuplet 3/2 { sib16 mib sol sib,[mib sol] sib, mib sol }

    %10
    do,4 r8
    \tuplet 3/2 { la16 re fad la,[re fad] la, re fad }
    sol sib, sib do do sib

    %13
    sib4 r8
    \tuplet 3/2 { sib16 re sol sib,[re sol] la, re fad }\mbreak
    sol4 r8

    %16
    \tuplet 3/2 { sol,16\p sib re sol,[sib re] sol, sib re }
    fad,4 r8
    \tuplet 3/2 { fad16 la re fad,[la re] fad, la re }

    %19
    re,4 r8
    \tuplet 3/2 { sib'16 re sol sib,[re sol] sib, re sol}
    sib,4 r8

    %22
    \tuplet 3/2 { la16 dod mi la,[dod mi] la, dod mi }
    la,4 r8
    \tuplet 3/2 { sol16 si re sol,[si re] sol, si re }

    %25
    sol,4 r8
    \tuplet 3/2 { fa16 la do fa,[la do] fa, la do }
    fa,4 r8\mbreak

    %28
    \tuplet 3/2 { fa16 sib re fa,[sib re] fa, sib re }
    fa,4 r8
    \tuplet 3/2 { fa16 sib re fa,[sib re] fa, sib re }

    %31
    fa,4 r8
    \tuplet 3/2 { fa16 sib re fa,[sib re] fa, sib re }
    fa,4 r8

    %34
    \tuplet 3/2 { re'16\f fa sib re,[fa sib] re, fa sib }
    \tuplet 3/2 { do, fa la do,[fa la] do, fa la }
    sib4 r8

    %37
    \tuplet 3/2 { fa,16\p sib re fa,[sib re] fa, sib re }
    do4 r8
    \tuplet 3/2 { la16 do mib la,[do mib] fa, la do }

    %40
    sib4 r8\mbreak
    \tuplet 3/2 { sib16 re sol sib,[re sol] sib, re sol}
    re4 r8

    %43
    \tuplet 3/2 { la16 dod mi la,[dod mi] la, dod mi }
    la,4 r8
    \tuplet 3/2 { sol16 si re sol,[si re] sol, si re }

    %46
    sol,4 r8
    \tuplet 3/2 { fa16 la do fa,[la do] fa, la do }
    fa,4 r8

    %49
    \tuplet 3/2 { do'16 mib sol do,[mib sol] do, mib sol}
    la,4 r8
    \tuplet 3/2 { sol16 sib re sol,[ sib re] sol, sib re }

    %52
    sol,4 r8\mbreak
    \tuplet 3/2 { sol16 sib re sol,[ sib re] sol, sib re }
    sol,4 r8

    %55
    \tuplet 3/2 { sol16\f sib re sol,[ sib re] sol, sib re }
    fad,4 r8
    sol'8 la fad

    %58
    sol4.\fermata

}

VvlaIn = \relative do' {

    sib8 re sib
    la4 r8
    sib re sib

    %4
    la4 r8
    sib' sib sib
    sol4 r8

    %7
    la la la
    fa4 r8
    sol sol sol

    %10
    mib4 r8
    fad fad fad
    re4 r8

    %13
    R4.
    re8 re re\mbreak
    re4 r8

    %16
    sib\p sib sib
    la4 r8
    la la la

    %19
    sib4 r8
    re re re
    re4 r8

    %22
    mi mi mi
    fad4 r8
    re re re

    %25
    mib4 r8
    do do do
    re4 r8\mbreak

    %28
    re re re
    la4 r8
    sib sib sib

    %31
    la4 r8
    re re re
    re4 r8

    %34
    fa fa fa
    fa fa fa
    fa4 r8

    %37
    re\p re re
    mib4 r8
    do do la

    %40
    fa4 r8\mbreak
    re' re re
    sib4 r8

    %43
    mi mi mi
    re4 r8
    re re re

    %46
    mib4 r8
    do do do
    re4 r8

    %49
    mib mib mib
    re4 r8
    re re re

    %52
    re4 r8\mbreak
    re re re
    re4 r8

    %55
    re\f re sib
    la4 r8
    re mib re

    %58
    sib4.\fermata

}

Vvocen = \relative do' {

    \autoBeamOff

    R4.*14
    r8 r sol'
    sol[re] sol

    %17
    la[re,] do
    do4.
    sib4 r8

    %20
    re[mib] re
    sib'[la] sol
    sol4.\tr

    %23
    fad4 r8
    sol re16 re do re
    mib re mib8 r

    %26
    fa do16 do sib do
    re do re8 fa\mbreak
    fa[mib re]

    %29
    do[re mib]
    re16[mib fa8 re]
    do[re mib]

    %32
    re16[mib] fa8 r
    sib, do4\tr
    sib r8

    %35
    R4.
    r8 r fa'
    fa[re] sib

    %38
    sol'[fa] mib
    mib?4.
    re\mbreak

    %41
    sib8[re] sol
    sib[la] sol
    sol4.

    %44
    fad4 r8
    sol re16 re do re
    mib re do8 r

    %47
    fa do16 do sib do
    re do re8 re
    mib4.

    %50
    fad
    sol8[fa16 mib] re8
    sol la4\tr\mbreak

    %53
    sol r8
    \tuplet 3/2 { sib16[la sol] } fad4\tr
    sol r8

    %56
    R4.*3

}

Vtesto = \lyricmode {

    Et Iesum, _ benedic - - tum fructum _ ventris _ tu -- i,  nobis, _ post hoc exsi - lium, _ nobis, _ post hoc exsi - lium, _  os --
    ten - - - - de osten - de.
    Et Iesum, _ bene - dic -- tum fructum _ ventris _ tu -- i,  nobis, _ post hoc exsi - lium, _ nobis, _ post hoc exsi - lium, _  os --
    ten - - de osten - de osten - de.

}

VbcIn = \relative do {

    sol8 sib sol
    re'4 r8
    sol, sib sol

    %4
    re'4 r8
    sol sol sol
    do,4 r8

    %7
    fa fa fa
    sib,4 r8
    mib mib mib

    %10
    la,4 r8
    re re re
    sol,4 r8

    %13
    R4.
    sol8 re' re,\mbreak
    sol4 r8

    %16
    sol' sol sol
    re4 r8
    re re re

    %19
    sol,4 r8
    sol' sol sol
    sol,4 r8

    %22
    dod dod dod
    re4 r8
    si si si

    %25
    do4 r8
    la la la
    sib4 r8\mbreak

    %28
    sib sib sib
    fa'4 r8
    fa fa fa

    %31
    fa4 r8
    sib, sib sib
    sib4 r8

    %34
    sib sib sib
    fa' fa fa,
    sib4 r8

    %37
    sib sib sib
    la4 r8
    fa' fa fa

    %40
    sib,4 r8
    sib sib sib
    sol4 r8

    %43
    dod dod dod
    re4 r8
    si si si

    %46
    do4 r8
    la la la
    sib4 r8

    %49
    do do do
    do4 r8
    sol sol sol

    %52
    sol4 r8
    sol' sol sol
    sol,4 r8

    %55
    sol sol sol
    re'4 r8
    sol, do re

    %58
    sol,4.\fermata

}

VbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <_+>
    s
    <_+>
    s
    <7 _->
    s
    <7>
    s
    <7>
    <_+>
    s
    s
    s8 <6 4> <5 3+>\mbreak
    s4.
    s
    <_+>
    s4.*4
    <6 5>4.
    <_+>
    s
    <_->
    s4.*4
    <6 4>4.
    <7- 5>
    s4.*6
    <7 5->4.
    <7->
    s
    <6>
    s
    <6 5>
    <_+>
    s
    <_->
    s
    s
    <_->
    <6 4+>

}

VvlIIIn = \relative do'' {

    R4.
    \tuplet 3/2 { fad,16 la re fad,[la re] fad, la re }
    sol,4 r8

    %4
    \tuplet 3/2 { fad16 la re fad,[la re] fad, la re }
    sol,4 r8
    \tuplet 3/2 { do16 mib sol do,[mib sol] do, mib sol }

    %7
    la4 r8
    \tuplet 3/2 { sib,16 re fa sib, [re fa] sib, re fa }
    sol4 r8

    %10
    \tuplet 3/2 { la,16 do mib la,[do mib] la, do mib }
    fad,4 r8
    R4.

    %13
    r16 <<{re'16^\markup\italic"P.mi"[re mib mib re]}\\{sib_\markup\italic"2.di"[sib do do sib]}>>
    \tuplet 3/2 { sol sib re sol,[sib re] fad, la re }\mbreak
    sib4 r8

    %16
    R4.
    \tuplet 3/2 { fad16\p la re fad,[la re] fad, la re }
    la4 r8

    %19
    \tuplet 3/2 { sol16 sib re sol,[sib re] sol, sib re }
    sol,4 r8
    \tuplet 3/2 { sib16 re sol sib,[re sol] sib, re sol }

    %22
    mi!4 r8
    \tuplet 3/2 { la,16 re fad la,[re fad] la, re fad }
    re4 r8

    %25
    \tuplet 3/2 { sol,16 do mib sol,[do mib] sol, do mib }
    do4 r8
    \tuplet 3/2 { fa,16 sib re fa,[sib re] fa, sib re }\mbreak

    %28
    re,4 r8
    \tuplet 3/2 { fa16 la do fa,[la do] fa, la do }
    fa,4 r8

    %31
    \tuplet 3/2 { fa16 la do fa,[la do] fa, la do }
    sib4 r8
    \tuplet 3/2 { fa16 sib re fa,[la do] fa, la do }

    %34
    \tuplet 3/2 { sib\f re fa sib,[re fa] sib, re fa }
    \tuplet 3/2 { la, do fa la,[do fa] la, do fa }
    re4 r8

    %37
    R4.
    \tuplet 3/2 { do16\p mib sol do,[mib sol] do, mib sol }
    do,4 r8

    %40
    \tuplet 3/2 { sib16 re fa sib, [re fa] sib, re fa }\mbreak
    sib,4 r8
    \tuplet 3/2 { sib16 re sol sib,[re sol] sib, re sol }

    %43
    la,4 r8
    \tuplet 3/2 { la16 re fad la,[re fad] la, re fad }
    re4 r8

    %46
    \tuplet 3/2 { sol,16 do mib sol,[do mib] sol, do mib }
    do4 r8
    \tuplet 3/2 { fa,16 sib re fa,[sib re] fa, sib re }

    %49
    sol,4 r8
    \tuplet 3/2 { re'16 fad la re,[fad la] re, fad la }
    re,4 r8

    %52
    \tuplet 3/2 { sol,16 sib re fad,[la do] fad, la do }\mbreak
    sib4 r8
    \tuplet 3/2 { re,16 sol sib la[do fad] la, do la }

    %55
    sib4 r8
    \tuplet 3/2 { fad16\f la re fad,[la re] fad, la re }
    sib8 do la

    %58
    sib4.\fermata

}

VvlaIIn = \relative do' {

    R4.
    la8 la la
    re4 r8

    %4
    la la la
    re4 r8
    mib mib mib

    %7
    do4 r8
    re re re
    sib4 r8

    %10
    do do do
    la4 r8
    R4.

    %13
    sib4 r8
    re re re\mbreak
    re4 r8

    %16
    R4.
    la8\p la la
    fad4 r8

    %19
    re' re re
    re4 r8
    re re re

    %22
    la4 r8
    fad' fad fad
    sol4 r8

    %25
    mib mib mib
    fa4 r8
    re re re\mbreak

    %28
    sib4 r8
    la la la
    sib4 r8

    %31
    la la la
    fa4 r8
    re' la la

    %34
    re fa fa
    fa fa fa
    fa4 r8

    %37
    R4.
    mib8\p mib mib
    la,4 r8

    %40
    re re re\mbreak
    re4 r8
    re re re

    %43
    mi4 r8
    fad fad fad
    sol4 r8

    %46
    mib mib mib
    fa4 r8
    re re re

    %49
    mib4 r8
    la la la
    sol4 r8

    %52
    re re re\mbreak
    re4 r8
    re re re

    %55
    re4 r8
    re\f re re
    re mib re

    %58
    re4.\fermata

}

VbcIIn = \relative do {

    R4.
    re,8 re' do
    sib4 r8

    %4
    re, re' do
    sib4 r8
    do do do

    %7
    fa4 r8
    sib, sib sib
    mib4 r8

    %10
    la, la la
    re4  r8
    R4.

    %13
    sol,4 r8
    sol re 're,
    sol4 r8

    %16
    R4.
    re'8 re re
    re,4 r8

    %19
    sol' sol sol
    sol,4 r8
    sol'8 sol sol

    %22
    dod,4 r8
    re re re
    si4 r8

    %25
    do do do
    la4 r8
    sib sib sib

    %28
    sib4 r8
    fa' fa fa
    fa4 r8

    %31
    fa fa fa
    sib,4 r8
    sib fa' fa,

    %34
    sib sib sib
    fa' fa fa,
    sib4 r8

    %37
    R4.
    la8 la la
    fa'4 r8

    %40
    sib, sib sib\mbreak
    sib4 r8
    sol sol sol

    %43
    dod4 r8
    re re re
    si4 r8

    %46
    do do do
    la4 r8
    sib sib sib

    %49
    do4 r8
    do do do
    sib4 r8

    %52
    sol re' re,\mbreak
    sol4 r8
    sol re' re,

    %55
    sol4 r8
    re' re re
    sol do, re

    %58
    sol,4.\fermata

}

VbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <_+>8 s <6 4+>
    s4.
    s8 s <6 4+>
    s4.
    <7 _->
    s
    <7>
    s
    <7>
    <_+>
    s
    s
    s8 <6 4> <5 3+>
    s4.
    s
    <_+>
    s4.*4
    <6 5>4.
    <_+>
    s
    <_->
    s4.*4
    <6 4>4.
    <7- 5>
    s4.*6
    <7 5->4.
    <7>
    s
    <6>
    s
    <6 5>
    <_+>
    s
    <_->
    s
    s
    <_->
    <6 4+>
    s
    s8 <_+> s

}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key re\minor
    \tempo 4 = 50
    s4.*58
    \bar "||"

}

VvlI = {
    \Vglobal
    <<\VvlIn\forma>>
}

VvlII = {
    \Vglobal
    <<\VvlIIn\forma>>
}

VvlaI = {
    \Vglobal
    \clef alto
    <<\VvlaIn\forma>>
}

Vvoce = {
    \new Voice = "iesus"
    \Vglobal
    \clef alto
    <<\Vvocen\forma>>
}

VbcI = {
    \Vglobal
    \clef bass
    <<\VbcIn\forma\VbfIn>>

}

VvlIII = {
    \Vglobal
    <<\VvlIIIn\forma>>
}

VvlaII = {
    \Vglobal
    \clef alto
    <<\VvlaIIn\forma>>
}

VbcII = {
    \Vglobal
    \clef bass
    <<\VbcIIn\forma\VbfIIn>>
    \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  %\set Score.skipTypesetting = ##t

}

VIflIn = \relative do'' {

    sol'8. lab16 sol8
    sol fa r
    mib8. fa16 mib8

    %4
    mib re r
    do8. re16 do8
    do fa lab

    %7
    do16 sib lab sol fa mib
    mib8\tr re r
    R4.*3

    %12
    lab'4.
    si
    do

    %15
    mib,32(fa sol16)~sol8\noBeam mib32(fa sol16)
    mib32(fa sol16)~sol8\noBeam si,32(do re16)
    do4 r8

    %18
    R4.*6
    do'4 r8
    la sib r

    %26
    do4 r8
    la sib r
    R4.*3

    %31
    re,4.\f
    mib
    fad

    %34
    sol32(la sib16)~sib8\noBeam sol32(la sib16)
    sol32(la sib16)~sib8\noBeam fad32(sol la16)
    sol4 r8

    %37
    R4.*2
    r8 sib16 la sib do
    re8 sib,16 la sib do\mbreak

    %41
    R4.*3
    sol'4.
    lab

    %46
    si
    do
    R

    %49
    sol8. lab16 sol8
    sol fa r
    mib8. fa16 mib8

    %52
    mib re r
    do8. re16 do8
    do fa lab

    %55
    si,4 r8
    R4.*6
    mib16 re mib fa sol8

    %63
    do4 r8
    la sib r
    do4 r8

    %66
    la sib r
    R4.*3
    r8 do mib,

    %71
    re re re
    mi4.\fermata

}

VIflIIn = \relative do'' {

    mib8. fa16 mib8
    mib re r
    do8. re16 do8

    %4
    do sib r
    lab8. sib16 lab8
    lab? do fa

    %7
    lab16 sol fa mib re do
    do8\tr si r
    R4.*2

    %11
    sol'16 sol sol sol sol sol
    sol sol sol sol sol sol
    fa fa fa fa fa fa

    %14
    mib mib mib mib mib mib
    do32(re mib16)~mib8\noBeam do32(re mib16)
    do32(re mib16)~mib8\noBeam re32(mib fa16)

    %17
    mib4 r8
    R4.*6
    lab4 r8

    %25
    fad sol r
    lab4 r8
    fad sol r

    %28
    R4.*3
    re16\f re re re re re
    re re re re re re

    %33
    do do do do do do
    sib32(do re16)~re8\noBeam sib32(do re16)
    sib32(do re16)~re8\noBeam la32(sib do16)

    %36
    sib4 r8
    R4.*2
    r8 sol'16 fad sol la

    %40
    sib8 sol,16 fad sol la\mbreak
    R4.*3
    sol'16 sol sol sol sol sol

    %45
    sol sol sol sol sol sol
    fa fa fa fa fa fa
    mib mib mib mib mib mib

    %48
    R4.
    mib8. fa16 mib8
    mib re r

    %51
    do8. re16 do8
    do sib r
    lab8. sib16 lab8

    %54
    lab? do fa
    re4 r8
    R4.*6

    %62
    do16 si do re mib8
    lab4 r8
    fad sol r

    %65
    lab4 r8
    fad sol r
    R4.*3

    %70
    r8 sol do,
    do si si
    do4.\fermata

}

VIvlIn = \relative do'' {

    do,8 mib do
    sol' sol, r
    do mib do

    %4
    sol' mi r
    fa lab fa
    R4.

    %7
    fa8 sol lab
    sol sol, r
    sol''16 sol lab(sol fa) lab

    %10
    sol4 r8
    R4.
    lab,

    %13
    si
    do
    mib32(fa sol16)~sol8\noBeam mib32(fa sol16)

    %16
    mib32(fa sol16)~sol8\noBeam si,32(do re16)
    do4 sol'8\p
    sol fa mib

    %19
    fa mib re
    mib32 fa sol16 r8 r
    R4.*3

    %24
    do,4 r8
    la sib r
    do4 r8

    %27
    la sib r
    R4.*3
    re4.\f

    %32
    mib!
    fad
    sol32(la sib16)~sib8\noBeam sol32(la sib16)

    %35
    sol32(la sib16)~sib8\noBeam fad32(sol la16)
    sol4 re8\p
    re4.

    %38
    mib
    mib8 re r
    R4.*4

    %44
    sol,4.\p
    lab
    si

    %47
    do
    R4.
    do,8\p mib do

    %50
    sol' sol, r
    do mib do
    sol' mi r

    %53
    fa lab fa
    fa4 fa8
    sol4 r8

    %56
    mib'32\f(fa sol16)~sol8\noBeam mib32(fa sol16)
    mib8 r r
    re32(mib fa16)~fa8\noBeam re32(mib fa16)

    %59
    re4 r8
    R4.*3
    do4\p r8

    %64
    la sib r
    do4 r8
    la sib r

    %67
    R4.*3
    r8 do'\f mib,
    re re re

    %72
    mi4.\fermata

}

VIvlIIn = \relative do'' {

    do,8 mib do
    sol' sol, r
    do mib do

    %4
    sol' mi r
    fa lab fa
    R4.

    %7
    fa8 sol lab
    sol sol, r
    mib''16 mib fa(mib re) fa
    mib4 r8

    %11
    r16 sol, sol sol sol sol
    sol sol sol sol sol sol
    fa fa fa fa fa fa

    %14
    mib mib mib mib mib mib
    do'32(re mib16)~mib8\noBeam do32(re mib16)
    do32(re mib16)~mib8\noBeam re32(mib fa16)

    %17
    mib4  mib8\p
    mib re do
    re do si

    %20
    do32 re mib16 r8 r
    R4.*3
    lab,4 r8

    %25
    fad sol r
    lab4 r8
    fad sol r

    %28
    R4.*3
    re'16\f re re re re re
    re re re re re re

    %33
    do do do do do do
    sib32(do re16)~re8\noBeam sib32(do re16)
    sib32(do re16)~re8\noBeam la32(sib do16)

    %36
    sib4 sib8\p
    sib4.
    do

    %39
    do8 sib r
    R4.*4
    sol16\p sol sol sol sol sol

    %45
    sol sol sol sol sol sol
    fa fa fa fa fa fa
    mib mib mib mib mib mib

    %48
    R4.
    do8\p mib do
    sol' sol, r

    %51
    do mib do
    sol' mi r
    fa lab fa

    %54
    fa4 fa8
    sol4 r8
    do32\f(re mib16)~mib8\noBeam do32(re mib16)

    %57
    do8 r r
    si32(do re16)~re8\noBeam si32(do re16)
    si4 r8

    %60
    R4.*3
    lab4\p r8
    fad sol r

    %65
    lab4 r8
    fad sol r
    R4.*3

    %70
    r8 sol'\f do,
    do si si
    do4.\fermata

}

VIvlaIn = \relative do' {

    do8 mib do
    sol' sol, r
    do mib do

    %4
    sol' mi r
    fa lab fa
    R4.

    %7
    fa8 sol lab
    sol sol, r
    mib' do re

    %10
    sol,4 r8
    r16 mib' mib mib mib mib
    do do do do fa fa

    %13
    re re re re si[si]
    sol sol sol sol sol  sol
    sol sol sol sol sol  sol

    %16
    sol sol sol sol sol  sol
    sol4 do8\p
    do sol' do,

    %19
    fa sol sol,
    sib r r
    R4.*3

    %24
    do4 r8
    do re r
    do4 r8

    %27
    do re r
    R4.*3
    sib'16\f sib sib sib sib sib

    %32
    sol sol sol sol mib mib
    la, la la la re[re]
    re re re re re re

    %35
    re re re re re re
    re4 sol8\p
    sol4.

    %38
    do,
    sol'8 sol r
    R4.*4

    %44
    mib16\p mib mib mib mib mib
    do do do do fa fa
    re re re re si si

    %47
    sol sol sol sol sol sol
    R4.
    do8\p mib do

    %50
    sol' sol, r
    do mib do
    sol' mi r
    fa lab fa

    %54
    fa4 fa8
    sol4 r8
    sol8\f sol sol

    %57
    sol r r
    sol sol sol
    sol4 r8

    %60
    R4.*3
    do,4\p r8
    do8 re r

    %65
    do4 r8
    do re r
    R4.*3

    %70
    r8 mib\f sol
    sol sol sol
    mi?4.\fermata

}

VIvocen = \relative do' {

  \autoBeamOff

  R4.*16
  r8 r sol'
  \appoggiatura lab8 sol[fa mib]

  %19
  fa[mib] re
  mib32[re] do16 r8 sol'
  sol[fa] mib\mbreak

  %22
  fa[mib] re
  mib16[re] do8 r
  lab'4 r8

  %25
  fad sol r
  lab4 r8
  fad sol r

  %28
  la? do, re
  sib[re] sol
  do,(sib)[la\tr]

  %31
  sol4 r8
  R4.*4
  r8 r re'

  %37
  do[sib la]
  mib' [sol] mib
  mib re r

  %40
  r r re\mbreak
  sib[la] sol
  mib'[sol] mib

  %43
  mib4 re8
  sol4.
  sol

  %46
  fa
  mib16[re] do8 r
  lab' re,4

  %49
  do r8
  r fa [re]
  mib16[re] do8 r

  %52
  r sol' [do,]
  lab'16[sol] fa8 r
  R4.

  %55
  sol8 sol sol
  sol16[fa] sol4
  sol8 sol sol

  %58
  sol16[fa] sol4
  sol8 re si
  do16[re mib fa] sol8\mbreak

  %61
  do, re4
  do r8
  lab'4 r8

  %64
  fad sol r
  lab4 r8
  fad sol r

  %67
  sol do, do
  do16[re mib fa] sol8
  do, re4\tr\fermata

  %70
  do4 r8
  R4.*2

}

VItesto = \lyricmode {

    O cle -- mens, o pia, _ o dulcis _ dulcis _ Virgo _  o clemens, _ o pia, _ o dulcis _ Virgo _ Mari -- a!

     O cle -- mens, o pia, _ o dulcis _ dulcis _ Virgo _  o dul -- cis Virgo _ Mari - a!

     O clemens, _ o pia, _ o dulcis _ Virgo _  o Virgo _ clemens _ o dulcis _ Virgo _ Mari - a o clemens, _ o pia, _ o dulcis _ Virgo _ Mari - a!

}

VIbcIn = \relative do {

    R4.*7
    sol16 si re sol re sol,
    do8 fa si,

    %10
    do4 r8
    do16 do do do do do
    fa fa fa fa fa fa

    %13
    sol sol sol sol sol sol
    do, do do do do do
    do do do do do do

    %16
    sol' sol sol sol sol, sol
    do4 r8
    R4.*2

    %20
    do'8 mib, do
    R4.*3
    do'4 r8

    %25
    re sol, r
    do4 r8
    re sol, r

    %28
    fad la re,
    sol sib, sol
    mib' re re,

    %31
    sol16 sol' sol sol sol sol
    do, do do do do do
    re re re re re re

    %34
    sol, sol sol sol sol sol
    sol sol re' re re, [re]
    sol4 sol'8

    %37
    sol4.~
    sol~
    sol8 sol, r

    %40
    R4.*4
    do16 do do do do do
    fa fa fa fa fa fa

    %46
    sol sol sol sol sol sol
    do, do do do do do
    fa8 sol sol,

    %49
    do4 r8
    R4.*6
    do8 do' do,

    %57
    do r r
    sol sol' sol,
    sol4 r8

    %60
    R4.\mbreak
    do8 sol' sol,
    do4 r8

    %63
    do4^\p r8
    re sol, r
    do4 r8

    %66
    re sol, r
    r do' do,
    r do' do,

    %69
    r sol4\fermata
    do8\f do do
    sol' sol, sol

    %72
    do4.\fermata

}

VIbfIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4.*8
  s8 <_-> s
  s4.
  s
  <9 3->
  <3! 7>
  s
  s
  s8 <5 4> <3!>
  s4.*7
  <6->4.
  <7 _+>
  <6->
  <7 _+>
  s4 <7>8
  s4.
  <6>8 <6 4> <5 3+>
  s4.
  <9 _->
  <7 _+>
  s
  s8 <6 4> <5 3+>
  s4.
  s
  <6- 4>
  s8 <5 3> s
  s4.*5
  <_- 9>4.
  <7 3!>
  s
  <_->
  s4.*14
  <6->4.
  <7 _+>
  <6->
  <7 _+>
  s
  s
  s
  s
  <5 4>8 <3!> s
  <_!>

}

VIvlIIIn = \relative do'' {

    R4.*9
    sol'16 sol lab(sol fa) lab
    sol16 sol sol sol sol sol

    %12
    sol sol sol sol sol sol
    fa fa fa fa fa fa

    %14
    mib mib mib mib mib mib
    do32(re mib16)~mib8\noBeam do32(re mib16)
    do32(re mib16)~mib8\noBeam re32(mib fa16)

    %17
    do4 r8
    R4.*2
    r8 r sol'

    %21
    sol(fa mib)\mbreak
    fa mib re
    mib16 re do8 r

    %24
    R4.*7
    re4.\f
    mib!

    %33
    fad
    sol32(la sib16)~sib8\noBeam sol32(la sib16)
    sol32(la sib16)~sib8\noBeam fad32(sol la16)

    %36
    sol4 r8
    R4.*3
    r8 r re\p\mbreak

    %41
    re4.
    mib
    mib4\tr re8

    %44
    sol,4.\p
    lab
    si

    %47
    do
    R4.*9
    mib32\f(fa sol16)~sol8\noBeam mib32(fa sol16)

    %58
    si,4 r8
    re32(mib fa16)~fa8\noBeam re32(mib fa16)
    mib4 r8\mbreak

    %61
    R4.*2
    do4\p r8
    la sib r

    %65
    do4 r8
    la sib r
    R4.*3

    %70
    r8 do'\f mib,
    re re re
    mi4.\fermata

}

VIvlIVn = \relative do'' {

    R4.*9
    mib16 mib fa(mib re) fa
    mib16 sol, sol sol sol sol

    %12
    sol sol sol sol sol sol
    fa fa fa fa fa fa

    %14
    mib mib mib mib mib mib
    do'32(re mib16)~mib8\noBeam do32(re mib16)
    do32(re mib16)~mib8\noBeam re32(mib fa16)

    %17
    do4 r8
    r8 r mib\p
    R4.*2

    %21
    mib8(re do)\mbreak
    re do si
    do16 re mib8 r

    %24
    R4.*7
    re16\f re re re re re
    re re re re re re

    %33
    do do do do do do
    sib32(do re16)~re8\noBeam sib32(do re16)
    sib32(do re16)~re8\noBeam la32(sib do16)

    %36
    sib4 r8
    R4.*3
    r8 r sib\p\mbreak

    %41
    sib4.
    do
    do4\tr sib8
    sol16\p sol sol sol sol sol

    %45
    sol sol sol sol sol sol
    fa fa fa fa fa fa
    mib mib mib mib mib mib

    %48
    R4.*9
    do'32\f(re mib16)~mib8\noBeam do32(re mib16)
    re4 r8

    %59
    si32(do re16)~re8\noBeam si32(do re16)
    do4 r8\mbreak
    R4.*2

    %63
    lab4\p r8
    fad sol r

    %65
    lab4 r8
    fad sol r
    R4.*3

    %70
    r8 sol'\f do,
    do si si
    do4.\fermata

}

VIvlaIIn = \relative do' {

    R4.*9
    mib8 do re
    sol,16 mib' mib mib mib mib
    do do do do fa fa

    %13
    re re re re si[si]
    sol sol sol sol sol  sol
    sol sol sol sol sol  sol

    %16
    sol sol sol sol sol  sol
    sol4 r8
    R4.*2

    %20
    r8 r do\p
    do sol' do,\mbreak
    fa sol sol,

    %23
    do4 r8
    R4.*7
    sib'16\f sib sib sib sib sib

    %32
    sol sol sol sol mib mib
    la, la la la re[re]
    re re re re re re

    %35
    re re re re re re
    re4 r8
    R4.*3

    %40
    r8 r sol\p\mbreak
    sol4.
    do,

    %43
    sol'8 sol, sol
    mib'16\p mib mib mib mib mib
    do do do do fa fa
    re re re re si si

    %47
    sol sol sol sol sol sol
    R4.*9
    sol'8\f sol sol

    %58
    sol4 r8
    sol sol sol
    sol4 r8\mbreak

    %61
    R4.*2
    do,4\p r8
    do8 re r

    %65
    do4 r8
    do re r
    R4.*3

    %70
    r8 mib\f sol
    sol sol sol
    mi4.\fermata

}

VIbcIIn = \relative do {

    R4.*9
    do8 fa si,
    do16 do do do do do
    fa fa fa fa fa fa

    %13
    sol sol sol sol sol sol
    do, do do do do do
    do do do do do do

    %16
    sol' sol sol sol sol, sol
    do4 r8
    R4.*5

    %23
    do'8 mib, do
    R4.*7
    sol'16 sol sol sol sol sol

    %32
    do, do do do do do
    re re re re re re
    sol, sol sol sol sol sol

    %35
    sol [sol] re' re re,  re
    sol4 r8
    R4.*3

    %40
    r8 r sol'\mbreak
    sol4.~
    sol

    %43
    sol8 sol, sol
    do16 do do do do do
    fa fa fa fa fa fa

    %46
    sol sol sol sol sol sol
    do, do do do do do
    R4.*9

    %57
    do8 do' do,
    sol4 r8
    sol sol' sol,

    %60
    do4 r8\mbreak
    R4.*2
    do4^\p r8

    %64
    re sol, r
    do4 r8
    re sol, r

    %67
    R4.*3
    r8 do\f do
    sol' sol, sol

    %72
    do,4.\fermata

}

VIbfIIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4.*9
  s8 <_-> s
  s4.
  <9 3->
  <3! 7>
  s
  s
  s8 <5 4> <3!>
  s4.*15
  <9 _->4.
  <7 _+>
  s
  s8 <6 4> <5 3+>
  s4.*6
  <6- 4>4.
  s4 <5 3>8
  s4.
  <9 _->
  <7 3!>
  s4.*11
  <_!>4.
  s4.*4
  <6->4.
  <7 _+>
  <6->
  <7 _+>
  s
  s
  s
  s
  <5 4>8 <3!> s
  <_!>

}

forma = {

  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \key sol\minor
  \tempo 4 = 60
  s4.*72
  \bar "|."

}

VIflI = {
  \VIglobal
  <<\VIflIn\forma>>
}

VIflII = {
  \VIglobal
  <<\VIflIIn\forma>>
}

VIvlI = {
  \VIglobal
  <<\VIvlIn\forma>>
}

VIvlII = {
  \VIglobal
  <<\VIvlIIn\forma>>
}

VIvlaI = {
  \VIglobal
  \clef alto
  <<\VIvlaIn\forma>>
}

VIvoce = {
  \new Voice = "clemens"
  \VIglobal
  \clef alto
  <<\VIvocen\forma>>
}

VIbcI = {
  \VIglobal
  \clef bass
  <<\VIbcIn\forma\VIbfIn>>

}

VIvlIII = {
  \VIglobal
  <<\VIvlIIIn\forma>>
}

VIvlIV = {
  \VIglobal
  <<\VIvlIVn\forma>>
}

VIvlaII = {
  \VIglobal
  \clef alto
  <<\VIvlaIIn\forma>>
}

VIbcII = {
  \VIglobal
  \clef bass
  <<\VIbcIIn\forma\VIbfIIn>>
  \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-default-paper-size "a4" 'landscape)

#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #1

}

\bookpart {

    \paper  {

        systems-per-page = #1

    }

    \markup \huge {[1.] And[ant]e  / Con Sordini }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new PianoStaff\with {instrumentName = \markup\huge\center-column{"Coro"\vspace #-0.2"P[ri]mo"}} <<

                \new Staff = "main" <<
                    \set Staff.instrumentName = \markup\center-column {"Flauto [I]"}
                    \set Staff.midiInstrument = #"recorder"
                    \IflI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup\center-column {"Flauto [II]"}
                    \set Staff.midiInstrument = #"recorder"
                    \IflII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IvlaI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"synth voice"
                    \Ivoce
                    \new Lyrics \lyricsto "salve" \Itesto
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IbcI
                >>
            >>

            \new PianoStaff\with {instrumentName = \markup\huge\center-column{"Coro"\vspace #-0.2"2.do"}} <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlIII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlIV
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IvlaII
                >>
                \new Staff <<
                    \set Staff.midiInstrument = #"contrabass"
                    \IbcII
                >>
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \markup \huge {[2.] All[egr]o }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new PianoStaff <<

                \new Staff = "main" <<
                    \set Staff.midiInstrument = #"recorder"
                    \IIflI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"recorder"
                    \IIflII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvlaI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"synth voice"
                    \IIvoce
                    \new Lyrics \lyricsto "salve" \IItesto
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIbcI
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlIII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlIV
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvlaII
                >>
                \new Staff <<
                    \set Staff.midiInstrument = #"contrabass"
                    \IIbcII
                >>
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

        systems-per-page = #2

    }

    \markup \huge {[3.] Larghetto }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new PianoStaff\with {instrumentName = \markup\huge\center-column{"  ""  ""   ""  ""  ""  ""  ""  ""P[ri]mo"\vspace #-0.2"Coro"}} <<

                \new Staff = "main" <<
                    \set Staff.instrumentName = \markup\center-column {"Flauto"\vspace #-0.2"Trav[ersier]"}
                    \set Staff.midiInstrument = #"flute"
                    \IIIflt
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup\center-column {"Violini"\vspace #-0.2"P[ri]mi"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup\center-column {"Violini"\vspace #-0.2"2.di"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup\center-column {Violette}
                    \set Staff.midiInstrument = #"viola"
                    \IIIvlaI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"synth voice"
                    \IIIvoce
                    \new Lyrics \lyricsto "ad te" \IIItesto
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIIbcI
                >>
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

        systems-per-page = #4

    }

    \markup \huge {[4.] Eia ergo }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new PianoStaff\with {instrumentName = \markup\huge\center-column{"  ""  ""  ""  ""  ""Due Cori"\vspace #-0.2"Unisoni"}} <<

                \new Staff <<
                    \set Staff.instrumentName = \markup\center-column {"Violini"\vspace #-0.2"e Violette"}
                    \set Staff.midiInstrument = #"violin"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"synth voice"
                    \IVvoce
                    \new Lyrics \lyricsto "eia" \IVtesto
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IVbcI
                >>
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

        systems-per-page = #2

    }

    \markup \huge {[5.] And[ant]e  molto }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
        } <<

            \new PianoStaff\with {instrumentName = \markup\huge\center-column{"P[rimo]"\vspace #-0.2"C[oro]"}} <<

                \new Staff \with {
                    fontSize = #-1
                    \override StaffSymbol #'staff-space = #(magstep -1)
                }  <<
                    \set Staff.instrumentName = \markup\center-column {"V[iolini""I & II]"}
                    \set Staff.midiInstrument = #"violin"
                    \VvlI
                >>

                \new Staff  \with {
                    fontSize = #-1
                    \override StaffSymbol #'staff-space = #(magstep -1)
                }  <<
                    \set Staff.midiInstrument = #"viola"
                    \VvlaI
                >>

                \new Staff \with {
                    fontSize = #-1
                    \override StaffSymbol #'staff-space = #(magstep -1)
                }  <<
                    \set Staff.midiInstrument = #"synth voice"
                    \Vvoce
                    \new Lyrics \lyricsto "iesus" \Vtesto
                >>

                \new Staff  \with {
                    fontSize = #-1
                    \override StaffSymbol #'staff-space = #(magstep -1)
                }  <<
                    \set Staff.midiInstrument = #"cello"
                    \VbcI
                >>
            >>

            \new PianoStaff\with {instrumentName = \markup\huge\center-column{"2.do"\vspace #-0.2"C[oro]"}} <<

                \new Staff \with {
                    fontSize = #-1
                    \override StaffSymbol #'staff-space = #(magstep -1)
                }  <<
                    \set Staff.instrumentName = \markup\center-column {"V[iolini""III & IV]"}
                    \set Staff.midiInstrument = #"violin"
                    \VvlIII
                >>

                \new Staff \with {
                    fontSize = #-1
                    \override StaffSymbol #'staff-space = #(magstep -1)
                }  <<
                    \set Staff.midiInstrument = #"viola"
                    \VvlaII
                >>
                \new Staff \with {
                    fontSize = #-1
                    \override StaffSymbol #'staff-space = #(magstep -1)
                }  <<
                    \set Staff.midiInstrument = #"contrabass"
                    \VbcII
                >>
            >>
        >>

        \layout {

            indent = 2.2\cm

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

\bookpart {

    \paper  {

        systems-per-page = #1

    }

    \markup \huge {[6.] And[ant]e }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new PianoStaff <<

                \new Staff = "main" <<
                    \set Staff.midiInstrument = #"recorder"
                    \VIflI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"recorder"
                    \VIflII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIvlII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \VIvlaI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"synth voice"
                    \VIvoce
                    \new Lyrics \lyricsto "clemens" \VItesto
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \VIbcI
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIvlIII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIvlIV
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \VIvlaII
                >>
                \new Staff <<
                    \set Staff.midiInstrument = #"contrabass"
                    \VIbcII
                >>
            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

