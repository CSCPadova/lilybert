\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"


acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzic."

soli = ^\markup \italic { seules}

dolce = _\markup \italic { dolce }

solo = ^\markup \italic { seul }

tu = ^\markup \italic "tous"

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
mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IflIn = \relative do'' {

    la'2 fad4. fad8
    sol2 mi
    fad re

    %4
    mi dod4 la
    re4. do8 do4.\prall si8
    sol4 dod? re mi

    %7
    fad sol8 la mi4.\prall  re8
    re1~
    re2 r4 fad

    %10
    sol4. la8 si2
    mi, la~
    la sol~

    %13
    sol4 fad mi4.\prall re8\mbreak
    dod4 re re4.\prall dod8
    re1%%% fine

    %16
    re4. dod8 re4. mi8
    fad4. mi8 fad4. sol8
    la4. dod,8 re4. mi8

    %19
    fad4. mi8 fad4. sol8
    la2 la
    la4. si8 la4. si8

    %22
    la4 sol8\prall fad sol4. la8
    si2 si
    si4. la8 si4. do8

    %25
    si4. la8 si4 la8\prall sol
    la [sol la si la si la si]\mbreak
    la2 la

    %28
    fad4.\prall mi8 fad4. sol8
    fad4 fad8[sol la si la sol]
    fad4 la8[sol fad sol mi sol]

    %31
    fad4 re8 mi fad4 fad8 sol
    la4 la, re re8 mi
    fad4 fad fad fad8 mi

    %34
    re4 re la' la8 sol
    fad4 la sol8 la fad sol\mbreak
    mi2 mi

    %37
    dod4. dod8 re2
    si dod
    la si

    %40
    sold mi'4. re8
    dod4 dod re4. mi8
    fad4 mi8 fad re4.\prall dod8

    %43
    si2 si'4. fad8
    sol4 sol sold r8 la
    si4 mi, do'2~

    %46
    do4 do si4. si8
    si4 mi, la4. si8\mbreak
    sold2 la4. sold8

    %49
    fa4 mi8 fa re4.\prall re8
    re2 do4. do8
    do4. si8 si4.\prall la8

    %52
    la1
    R1*27
    la'2 fad4. fad8

    %81
    sol2 mi
    fad re
    mi dod4 la

    %84
    re4. do8 do4.\prall si8
    sol4 dod? re mi
    fad sol8 la mi4.\prall  re8

    %87
    re1~
    re2 r4 fad
    sol4. la8 si2

    %90
    mi, la~
    la sol~
    sol4 fad mi4.\prall re8\mbreak

    %93
    dod4 re re4.\prall dod8
    re1

}

IflIIn = \relative do'' {

    la'2 fad4. fad8
    sol2 mi
    fad re

    %4
    mi dod4 la
    re4. do8 do4.\prall si8
    sol4 dod? re mi

    %7
    fad sol8 la mi4.\prall  re8
    re1~
    re2 r4 fad

    %10
    sol4. la8 si2
    mi, la~
    la sol~

    %13
    sol4 fad mi4.\prall re8\mbreak
    dod4 re re4.\prall dod8
    re1%%% fine

    %16
    R1
    re4. dod8 re4. mi8
    fad4. mi8 fad4. sol8

    %19
    la4. dod,8 re4. mi8
    fad2 fad
    fad4. sol8 fad4. sol8

    %22
    fad4 mi8\prall re mi4. fad8
    sol2 re
    sol4. fad8 sol4. la8

    %25
    sol4. fad8 sol4 fad8\prall mi
    fad[mi fad sol fad sol fad sol]\mbreak
    fad2 fad

    %28
    re4.\prall dod8 re4. mi8
    re4 re8[mi fad sol fad mi]
    re4 fad8[mi re mi dod mi]

    %31
    re4 r r2
    r4 re8 mi fad4 fad8 sol
    la4 la, re re8 mi

    %34
    fad4 fad fad fad8 mi
    re4 fad mi8 fad re mi\mbreak
    dod2 mi

    %37
    dod4. dod8 re2
    si dod
    la si

    %40
    sold mi'4. re8
    dod4 dod re4. mi8
    fad4 mi8 fad re4.\prall dod8

    %43
    si2 si'4. fad8
    sol4 sol sold r8 la
    si4 mi, do'2~

    %46
    do4 do si4. si8
    si4 mi, la4. si8\mbreak
    sold2 la4. sold8

    %49
    fa4 mi8 fa re4.\prall re8
    re2 do4. do8
    do4. si8 si4.\prall la8

    %52
    la1
    R1*27
    la'2 fad4. fad8

    %81
    sol2 mi
    fad re
    mi dod4 la

    %84
    re4. do8 do4.\prall si8
    sol4 dod? re mi
    fad sol8 la mi4.\prall  re8

    %87
    re1~
    re2 r4 fad
    sol4. la8 si2

    %90
    mi, la~
    la sol~
    sol4 fad mi4.\prall re8\mbreak

    %93
    dod4 re re4.\prall dod8
    re1

}

IvlIn = \relative do'' {

    la'2 fad4. fad8
    sol2 mi
    fad re

    %4
    mi dod4 la
    re4. do8 do4.\prall si8
    sol4 dod? re mi

    %7
    fad sol8 la mi4.\prall  re8
    re1~
    re2 r4 fad

    %10
    sol4. la8 si2
    mi, la~
    la sol~

    %13
    sol4 fad mi4.\prall re8\mbreak
    dod4 re re4.\prall dod8
    re1%%% fine

    %16
    R1*21
    dod4. dod8 re2
    si dod
    la si

    %40
    sold mi'4. re8
    dod4 dod re4. mi8
    fad4 mi8 fad re4.\prall dod8

    %43
    si2 si'4. fad8
    sol4 sol sold r8 la
    si4 mi, do'2~

    %46
    do4 do si4. si8
    si4 mi, la4. si8\mbreak
    sold2 la4. sold8

    %49
    fa4 mi8 fa re4.\prall re8
    re2 do4. do8
    do4. si8 si4.\prall la8

    %52
    la1


    mi'2\solo fad4. sol8
    la4 mi8 sol fad4 mi8\prall re

    %55
    dod2 re\mbreak
    mi4 dod re mi8 fad
    mi4 la la4. si8

    %58
    sol4\prall fad sol4. la8\mbreak
    fad2.\prall fad8 sol
    la2.~la8 la

    %61
    la4 re, sol2~
    sol4 la fad4. sol8
    sol4 si si4. la8

    %64
    si4 do8 si la sol fad mi
    red4 mi fad4. sol8
    la4 sol8\prall fad fad4. mi8

    %67
    mi2 r
    R1*3
    r4 la la4. si8

    %72
    sol4\prall fad sol4. la8
    fad4 fad sol4. la8
    si4 la8 si sol4.\prall sol8

    %75
    sol2 fad4.\prall fad8
    fad4 mi mi4.\prall re8
    dod4 la re4. mi8

    %78
    fad4 sol la sol8\prall fad
    mi1\prall

    %80
    la2 fad4. fad8
    sol2 mi
    fad re

    %83
    mi dod4 la
    re4. do8 do4.\prall si8
    sol4 dod? re mi

    %86
    fad sol8 la mi4.\prall  re8
    re1~
    re2 r4 fad

    %89
    sol4. la8 si2
    mi, la~
    la sol~

    %92
    sol4 fad mi4.\prall re8\mbreak
    dod4 re re4.\prall dod8
    re1%%% fine

}

IvlIIn = \relative do'' {

    la'2 fad4. fad8
    sol2 mi
    fad re

    %4
    mi dod4 la
    re4. do8 do4.\prall si8
    sol4 dod? re mi

    %7
    fad sol8 la mi4.\prall  re8
    re1~
    re2 r4 fad

    %10
    sol4. la8 si2
    mi, la~
    la sol~

    %13
    sol4 fad mi4.\prall re8\mbreak
    dod4 re re4.\prall dod8
    re1%%% fine

    %16
    R1*21
    dod4. dod8 re2
    si dod
    la si

    %40
    sold mi'4. re8
    dod4 dod re4. mi8
    fad4 mi8 fad re4.\prall dod8

    %43
    si2 si'4. fad8
    sol4 sol sold r8 la
    si4 mi, do'2~

    %46
    do4 do si4. si8
    si4 mi, la4. si8\mbreak
    sold2 la4. sold8

    %49
    fa4 mi8 fa re4.\prall re8
    re2 do4. do8
    do4. si8 si4.\prall la8

    %52
    la1
    R1*2
    mi'2\solo fad4. sol8
    la4 mi8 sol fad4 mi8\prall re

    %57
    dod2 r
    R1*3
    r4 re re4. mi8

    %62
    do4 si do4. re8
    si4 sol' sol4. sol8
    sol sol, la si do si la sol

    %65
    fad4 fad' red4. red8
    mi4. fad8 red4. mi8
    mi4 mi mi4. fad8

    %68
    re4\prall dod re?4. mi8
    dod2. dod8 re
    mi2.~mi8 mi

    %71
    mi4 la, re2~
    re4 mi dod4. re8
    re4 re mi4. fad8

    %74
    sol4 fad8 sol mi4.\prall re8
    dod4 la re4. do8
    si4 sol sol'4. fad8

    %77
    mi4 dod? si4. dod8
    re4 dod re4. mi8
    dod1
    la'2 fad4. fad8

    %81
    sol2 mi
    fad re
    mi dod4 la

    %84
    re4. do8 do4.\prall si8
    sol4 dod? re mi
    fad sol8 la mi4.\prall  re8

    %87
    re1~
    re2 r4 fad
    sol4. la8 si2

    %90
    mi, la~
    la sol~
    sol4 fad mi4.\prall re8\mbreak

    %93
    dod4 re re4.\prall dod8
    re1

}

Ihcn = \relative do'' {

    r2 re
    si4. si8 dod2
    re si

    %4
    dod la
    fad2. fad4
    sol la si dod

    %7
    re mi8 re dod4. re8
    re4 la si2
    la4 si dod2

    %10
    si mi
    dod2. re4
    si2 mi

    %13
    dod si\prall\mbreak
    la4 la8 si la4.\prall la8
    la1 %%% fin

    %16
    R1*21
    la2 la4. la8
    sol2 sol

    %39
    fad fad
    mi4 si' si4. si8
    la4 la si4. dod8

    %42
    re2 la
    sol si
    si1~

    %45
    si2 mi
    fa1
    mi4. re8 do4. re8\mbreak

    %48
    si2 mi
    re4 do8 re si4.\prall la8
    sold2 la4. sold8

    %51
    fad !sold la4 la4.\prall sold8
    la1
    R1*27

    %80
    r2 re
    si4. si8 dod2
    re si

    %83
    dod la
    fad2. fad4
    sol la si dod

    %86
    re mi8 re dod4. re8
    re4 la si2
    la4 si dod2

    %89
    si mi
    dod2. re4
    si2 mi

    %92
    dod si\prall\mbreak
    la4 la8 si la4.\prall la8
    la1 %%% fin

}

Itln = \relative do' {

    R1
    r2 la'
    fad4. fad8 sol2

    %4
    mi fad
    re2. re4
    sol sol fad mi

    %7
    re sol8 fad la4 la,
    re fad fad4. fad8
    fad4 sol la2

    %10
    re, sol4 si
    la mi fad fad
    re re'8 dod si la sol fad

    %13
    mi4 fad sol si,\mbreak
    mi4 fad mi4.\prall la8
    fad1  %%% fin

    %16
    R1*21
    mi2 fad4. mi8
    re2 mi

    %39
    dod re
    si r8 mi mi mi
    mi4 mi fad4. sol8

    %42
    la4 sol8 la fad4. mi8
    re2 r4 fad
    mi2.~mi8 fad

    %45
    sol2 la
    la re,4 re'
    sold,2 la4 fa\mbreak

    %48
    mi2. la4
    la1
    si4 mi, mi4. mi8

    %51
    mi4 re re4. mi8
    dod1
    R1*27

    %80
    R1
    r2 la'
    fad4. fad8 sol2

    %83
    mi fad
    re2. re4
    sol sol fad mi

    %86
    re sol8 fad la4 la,
    re fad fad4. fad8
    fad4 sol la2

    %89
    re, sol4 si
    la mi fad fad
    re re'8 dod si la sol fad

    %92
    mi4 fad sol si,\mbreak
    mi4 fad mi4.\prall la8
    fad1  %%% fin

}


Ibsn = \relative do {

    \clef alto \key re\major
    R1
    r2 la''
    fad4. fad8 sol2

    %4
    mi fad
    re2. re4
    sol sol fad mi

    %7
    re sol8 fad la4 la,
    \clef bass \key re\major re2 si4. si8
    do2 la

    %10
    si sol
    la fad4 re
    sol2. mi4

    %13
    la2 sol~\mbreak
    sol4 fad8 sol la4 la,
    re1 %%% fin

    %16
    R1*21
    la'2 fad4. fad8
    sol2 mi

    %39
    fad re
    mi sold,
    la4 la'8 sol fad4. mi8

    %42
    re2. re4
    sol2 red
    mi2. mi4

    %45
    re2 do
    re1
    do2. re4\mbreak

    %48
    mi4. re8 dod!2
    re4 mi fa2
    mi la,

    %51
    re, mi
    la1
    R1*27

    %80
    \clef alto \key re\major
    R1
    r2 la''
    fad4. fad8 sol2

    %83
    mi fad
    re2. re4
    sol sol fad mi

    %86
    re sol8 fad la4 la,
    \clef bass \key re\major re2 si4. si8
    do2 la

    %89
    si sol
    la fad4 re
    sol2. mi4

    %92
    la2 sol~\mbreak
    sol4 fad8 sol la4 la,
    re1 %%% fin

}


Iorgn = \relative do {

    \clef alto \key re\major
    R1
    r2 la''
    fad4. fad8 sol2

    %4
    mi fad
    re2. re4
    sol sol fad mi

    %7
    re sol8 fad la4 la,
    \clef bass \key re\major re2 si4. si8
    do2 la

    %10
    si sol
    la fad4 re
    sol2. mi4

    %13
    la2 sol~\mbreak
    sol4 fad8 sol la4 la,
    re1 %%% fin

    %16
    re_\markup\italic \column{"orgue seul jouant le trio comme il""est écrit dans la partie des flutes"}
    re
    re

    %19
    re
    re2 re
    re'1

    %22
    re4. dod8 si4. la8
    sol2 sol
    sol1

    %25
    sol
    re'\mbreak
    re2 re

    %28
    re1
    re
    re

    %31
    re
    re,
    re

    %34
    re
    re4 re sol re\mbreak
    la'1

    %37
    la2 fad4. fad8
    sol2 mi
    fad re

    %40
    mi sold,
    la4 la'8 sol fad4. mi8
    re2. re4

    %43
    sol2 red
    mi2. mi4
    re2 do

    %46
    re1
    do2. re4\mbreak
    mi4. re8 dod!2

    %49
    re4 mi fa2
    mi la,
    re, mi

    %52
    la1
    la'2\solo re,
    dod re

    %55
    la4 la' re,2
    dod4 la re2
    la2. la4

    %58
    si2 dod\mbreak
    re4 re' re4. mi8
    do4 si do4. re8

    %61
    si2. do4
    la2 re
    sol,2. sol4

    %64
    la2. la4
    si2. si4
    do la si si,

    %67
    mi2. mi4
    fad2 sold
    la4 la la4. si8\mbreak

    %70
    sol4\prall fad sol4. la8
    fad2. sol4
    mi2 la

    %73
    re,4 re'8 dod si4. la8
    sol2. mi4
    la2 re,

    %76
    sol1
    sol2 fad4. mi8
    re4 mi fad sol

    %79
    la1
    \clef alto \key re\major
    R1
    r2 la'

    %82
    fad4. fad8 sol2
    mi fad
    re2. re4

    %85
    sol sol fad mi
    re sol8 fad la4 la,
    \clef bass \key re\major re2 si4. si8

    %88
    do2 la
    si sol
    la fad4 re

    %91
    sol2. mi4
    la2 sol~\mbreak
    sol4 fad8 sol la4 la,

    %94
    re1 %%% fin

}


Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*5
    s2 <6 4>
    s1*6
    <7>4 <6> <6>2
    s1*30
    <_->2 <_+>
    <4+>1
    s
    <7 5+>2 <6>
    s1
    <_->
    s1*11
    <7>2 <6>
    <7> <7>
    s s
    <9 7> <8 6>
    <_+>1
    s1*5
    <7>2 <6>
    <7> <7>
    s1*4
    s2 <6 4>
    s1*2
    s1*5
    s2 <6 4>
    s1*6
    <7>4 <6> <6>2

}


forma = {

    \time 2/2
    \tempo 1 = 50
    \key re\major
    s1*79 %\break
    \once \override Score.RehearsalMark.extra-offset = #'(+5 . +1)\mark\markup "Reprise"
    s1*15
    \bar"|."
    \mark\markup "Fin"

}

IflI = {
    \Iglobal
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

Ihc = {
    \Iglobal
    <<\Ihcn \forma>>

}

Itl = {
    \Iglobal
    <<\Itln \forma>>

}

Ibs = {
    \Iglobal
    \clef bass
    <<\Ibsn \forma >>

}

Iorg = {
    \Iglobal
    \clef bass
    <<\Iorgn \forma\Ibfn>>

}




IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    r4 re\tu re
    sol sol4. la8
    fad4. mi8 fad4

    %4
    sol re4.\prall re8
    mi4 do mi
    re mi8 re do si

    %7
    do4 la re
    si4. la8 sol si
    la4 la la

    %10
    re re4.\prall do8
    si4 re re
    sol sol4.\prall fad8

    %13
    mi4 la mi
    fa!4. sol8 la4\mbreak
    re, sib' la

    %16
    sol4. la8 sib4
    dod,4. dod8 re4~
    re8 mi dod4. re8

    %19
    re2. re4 fad re
    la'2.
    r4 la fad

    %22
    si la fad
    sol la si
    mi, la8 sol fad mi

    %25
    red2.
    fad~
    fad4 sol fad\mbreak

    %28
    mi fad mi
    re re4. mi8
    dod4 dod8 re mi4~

    %31
    mi8 fad red4. mi8
    mi2.~
    mi~

    %34
    mi4 mi fad
    sol4. la8 si4
    mi, do' si

    %37
    la mi la
    fad2.
    re

    %40
    r4 sol re
    mi si re\mbreak
    sol, la si

    %43
    do4. re8 mi re
    do si la4.\prall sol8
    sol4 si do

    %46
    re4. mi8 fa? re
    mi4 mi fad
    sol mi la

    %49
    fad re sol~
    sol8 la la4.\prallprall sol16 la
    si4. mi,8 fad4

    %52
    sol8 la fad4. sol8
    sol2.

}

IIhcn = \relative do'' {

    R2.
    r4 sol\tu sol
    re' re4. do8

    %4
    si4. la8 si4
    do2 do4
    si do8 si la sol

    %7
    la4 fad fad
    sol re8 do si dod
    re4 re4. re8

    %10
    re4 la'4. la8
    sol4 si si
    mi mi4. re8

    %13
    dod4 dod dod
    re2 fad,4\mbreak
    sol re' dod

    %16
    re4. do?8 sib4
    la2 la4
    sib la4. la8

    %19
    la2. la
    r4 la la
    la re re

    %22
    si2 si4
    si do re
    sol, do2

    %25
    si2.
    si
    si\mbreak

    %28
    si
    si4 si4. si8
    la2.

    %31
    do4 si4. si8
    si2.
    si

    %34
    do4 sol la
    si4. do8 re4
    do do re

    %37
    mi2 mi4
    re2.
    sol,4 la si

    %40
    la si2
    sol4 fad2\mbreak
    mi fa?4

    %43
    sol4. sol8 la4
    sol8 la fad4. sol8
    sol4 sol la

    %46
    si4. do8 re4
    re do re
    mi2.

    %49
    re2 re4
    mi do re
    re mi8 re do4

    %52
    si8 do la4.\prall re8
    si2.

}

IItln = \relative do' {

    R2.*6
    r4 re re
    sol sol4. la8

    %9
    fad4 fad fad
    sol re4. re8
    re4 re re

    %12
    mi mi4. mi8
    mi4 mi la
    la2 la4\mbreak

    %15
    sol sol fad
    sol mi2
    mi4. mi8 fa!4

    %18
    mi4. fad8 sol4
    fad2. fad
    r4 mi dod

    %21
    fad2.
    r4 fad fad
    mi2 fad4

    %24
    sol mi la8 sol
    fad2.
    red

    %27
    red4 mi fad\mbreak
    sol re mi
    mi2~mi8 mi

    %30
    mi4 la sol~
    sol8 la fad4 si8 la
    sol2.

    %33
    r4 sol fa?
    mi do2
    re4 sol2

    %36
    sol4 mi mi
    la2 la4
    la fad fad

    %39
    sol re4. mi8
    fa4 sol2
    mi4 re re\mbreak

    %42
    si do re
    mi4. re8 do re
    mi4 re4. do8

    %45
    si4 re2
    sol~sol8 sol
    sol2 fad4

    %48
    mi la2
    la4. la8 si4
    sol sol fad

    %51
    sol4. sol8 la4
    sol8 mi re4. re8
    re2.

}


IIbcn = \relative do {

    R2.*7
    r4 sol sol
    re' re4. do8

    %10
    si4 fad4. fad8
    sol4 sol' sol
    mi mi4. mi8

    %13
    la4 la, la
    re re' do\mbreak
    sib sol la

    %16
    sib4. la8 sol4
    la4. sol8 fa!4
    sol la la,
    re2. re

    %20
    r4 dod' la
    re2.
    r4 red red

    %23
    mi2 re?4
    do?4. si8 la4
    si do si

    %26
    la si la
    sol2.\mbreak
    sol

    %29
    sold
    la4. si8 do4
    la si si,

    %32
    mi fa mi
    re mi re
    do2.

    %35
    si4. la8 sol4
    do2.
    dod

    %38
    re4 re' la
    si fad sol
    re si2

    %41
    do4 re2\mbreak
    mi re4
    do4. si8 do4

    %44
    do re2
    sol,4 sol'2
    si, si4

    %47
    do2.
    dod
    re4. do?8 si4

    %50
    do la re
    sol, do8 si la4
    mi'8 do re4 re,

    %53
    sol2.

}


IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*26
    <4+>2.
    <7 5+>
    <6>
    s
    <_+>

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 60
    \key do\major
    \repeat volta 2{s2.*18}
    \alternative {{s2.}{\bar ":..:" s}}
    \set Score.currentBarNumber = #20
    s2.*34
    \bar":|."

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIhc = {
    \IIglobal
    <<\IIhcn \forma>>

}

IItl = {
    \IIglobal
    <<\IItln \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma\IIbfn>>

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IIIflIn = \relative do'' {

    R1*2
    r2 sol'4.^\markup\italic "Flûte" sol8
    la4 la sol4.\prall fa8

    %5
    mi4 do mi4. fa8
    sol4 mi la8 sol fa mi
    re4\prall re8 dod re4  mi

    %8
    fa8 sol la4 sol4.\prall fa8
    mi4 mi8 re mi4 fa\mbreak
    sol4 la sib la8\prall sol

    %11
    la2~la8 la sol fa
    sol[fa sol la sol la sol fa]
    mi[re mi fa mi fa mi fa]

    %14
    sol4 mi do8 re mi fa
    sol4 la8 sol fa4 fa8 mi
    re4 sol, r2

    %17
    R1
    r2 sol'4. sol8
    la8 sol fa mi re4.\prall do8\mbreak

    %20
    do2 r
    r sol'4.\tu sol8
    la4 la sol4.\prall fa8

    %23
    mi4 do mi4. fa8
    sol4 mi la8 sol fa mi
    re4 re8 dod re4 mi

    %26
    fa8 sol la4 sol4.\prall fa8
    mi4 mi8 re mi4 fa
    sol4 la sib la8 sol

    %29
    la2~la8 la sol\prall fa
    sol4 sol sol4. la8\mbreak
    fad4 re sol4. sol8

    %32
    sol4. la8 fad4. sol8
    sol4 re8 dod re4 mi
    fa8 sol la4 sol4.\tr fa8

    %35
    mi4 mi8 re mi4 fa
    sol la sib la8 sol
    la mi fa sol la4. la8

    %38
    la4 sib8[la sol fa mi re]
    dod4. re8 mi4 la,
    fa'4. mi8 mi4.\prall  re8\mbreak

    %41
    re2 re4.\solo re8
    mi4 mi re4.\prall do8
    si4 si sol'2\tu~

    %44
    sol4 la8 sol fad4. sol8
    sol2 sol4.\solo sol8
    la4 la sol4.\prall fa8

    %47
    mi4 do fa4.\tu fa8
    sol8 la sib la sol4.\prall fa8
    fa2 sol4.\solo sol8

    %50
    la4 la sol4.\prall fa8\mbreak
    mi4 do fa4. fa8
    sol4 sol fa4.\prall mi8

    %53
    re2 sol4. sol8
    sol4 fa8 mi re4.\prall do8
    do2 sol'4.\tu sol8

    %56
    sol4 do, fa4. fa8
    fa4 mi8 re mi4. mi8
    la4 la8 sol fa4 fa8 mi

    %59
    re4 sol, sol'4. do,8\mbreak
    fa8 sol mi fa re4.\prall do8
    do2 do'4. sib8

    %62
    la sol fa mi re4.\prall do8
    do\breve

}

IIIflIIn = \relative do'' {

    r2 sol'4. ^\markup\italic "Flûte" sol8
    la4 la sol4.\prall fa8
    mi4 do mi4. mi8

    %4
    fa4 fa mi4.\prall re8
    do4 la do4. re8
    mi[fa sol mi fa mi re do]

    %7
    si4\prall  si8 la si4 dod
    re la si4. si8
    do?4 do8 si do4 re\mbreak

    %10
    mi fa sol2~
    sol8 sol fa mi fa2
    mi8[re mi fa mi fa mi fa]

    %13
    sol[fa sol la sol la sol fa]
    mi4 do8 re mi fa sol fa
    mi4 fa8 mi re4 re8 do

    %16
    si4 si sol'4. sol8
    sol4 fa8\prall mi re4. do8
    do1~

    %19
    do4 re8 do si4. \prall do8\mbreak
    do2 r
    r sol'4.\tu sol8
    la4 la sol4.\prall fa8

    %23
    mi4 do mi4. fa8
    sol4 mi la8 sol fa mi
    re4 re8 dod re4 mi

    %26
    fa8 sol la4 sol4.\prall fa8
    mi4 mi8 re mi4 fa
    sol4 la sib la8 sol

    %29
    la2~la8 la sol\prall fa
    sol4 sol sol4. la8\mbreak
    fad4 re sol4. sol8

    %32
    sol4. la8 fad4. sol8
    sol4 re8 dod re4 mi
    fa8 sol la4 sol4.\tr fa8

    %35
    mi4 mi8 re mi4 fa
    sol la sib la8 sol
    la mi fa sol la4. la8

    %38
    la4 sib8[la sol fa mi re]
    dod4. re8 mi4 la,
    fa'4. mi8 mi4.\prall  re8\mbreak

    %41
    re2 si4.\solo si8
    do4 do si4.\prall la8
    sol4 sol sol'2\tu~

    %44
    sol4 la8 sol fad4. sol8
    sol2 mi4.\solo mi8
    fa4 fa mi4.\prall re8

    %47
    do4 la fa'4.\tu fa8
    sol la sib la sol4.\prall fa8
    fa2 r

    %50
    R1\mbreak
    r2 re4. \solo re8
    mi4 mi re4.\prall do8

    %53
    si2 mi4. mi8
    mi4 re8 do si4.\prall do8
    do2 sol'4.\tu sol8

    %56
    sol4 do, fa4. fa8
    fa4 mi8 re mi4. mi8
    la4 la8 sol fa4 fa8 mi

    %59
    re4 sol, sol'4. do,8\mbreak
    fa8 sol mi fa re4.\prall do8
    do2 do'4. sib8

    %62
    la sol fa mi re4.\prall do8
    do\breve

}

IIIvlIn = \relative do'' {

    R1*2
    r2 sol'4. sol8
    la4 la sol4.\prall fa8

    %5
    mi4 do mi4. fa8
    sol4 mi la8 sol fa mi
    re4\prall re8 dod re4  mi

    %8
    fa8 sol la4 sol4.\prall fa8
    mi4 mi8 re mi4 fa\mbreak
    sol4 la sib la8\prall sol

    %11
    la2~la8 la sol fa
    sol[fa sol la sol la sol fa]
    mi[re mi fa mi fa mi fa]

    %14
    sol4 mi do8 re mi fa
    sol4 la8 sol fa4 fa8 mi
    re4 sol, r2

    %17
    R1
    r2 sol'4. sol8
    la8 sol fa mi re4.\prall do8\mbreak

    %20
    do2 r
    r sol'4. sol8
    la4 la sol4.\prall fa8

    %23
    mi4 do mi4. fa8
    sol4 mi la8 sol fa mi
    re4 re8 dod re4 mi

    %26
    fa8 sol la4 sol4.\prall fa8
    mi4 mi8 re mi4 fa
    sol4 la sib la8 sol

    %29
    la2~la8 la sol\prall fa
    sol4 sol sol4. la8\mbreak
    fad4 re sol4. sol8

    %32
    sol4. la8 fad4. sol8
    sol4 re8 dod re4 mi
    fa8 sol la4 sol4.\tr fa8

    %35
    mi4 mi8 re mi4 fa
    sol la sib la8 sol
    la mi fa sol la4. la8

    %38
    la4 sib8[la sol fa mi re]
    dod4. re8 mi4 la,
    fa'4. mi8 mi4.\prall  re8\mbreak

    %41
    re2 r
    R1
    r2 sol2~

    %44
    sol4 la8 sol fad4. sol8
    sol2 r2
    R1

    %47
    r2 fa4. fa8
    sol8 la sib la sol4.\prall fa8
    fa2 r

    %50
    R1*5
    r2 sol4. sol8

    %56
    sol4 do, fa4. fa8
    fa4 mi8 re mi4. mi8
    la4 la8 sol fa4 fa8 mi

    %59
    re4 sol, sol'4. do,8\mbreak
    fa8 sol mi fa re4.\prall do8
    do2 do'4. sib8

    %62
    la sol fa mi re4.\prall do8
    do\breve

}

IIIvlIIn = \relative do'' {

    r2 sol'4.  sol8
    la4 la sol4.\prall fa8
    mi4 do mi4. mi8

    %4
    fa4 fa mi4.\prall re8
    do4 la do4. re8
    mi[fa sol mi fa mi re do]

    %7
    si4\prall  si8 la si4 dod
    re la si4. si8
    do?4 do8 si do4 re\mbreak

    %10
    mi fa sol2~
    sol8 sol fa mi fa2
    mi8[re mi fa mi fa mi fa]

    %13
    sol[fa sol la sol la sol fa]
    mi4 do8 re mi fa sol fa
    mi4 fa8 mi re4 re8 do

    %16
    si4 si sol'4. sol8
    sol4 fa8\prall mi re4. do8
    do1~

    %19
    do4 re8 do si4. \prall do8\mbreak
    do2 r
    r sol'4. sol8
    la4 la sol4.\prall fa8

    %23
    mi4 do mi4. fa8
    sol4 mi la8 sol fa mi
    re4 re8 dod re4 mi

    %26
    fa8 sol la4 sol4.\prall fa8
    mi4 mi8 re mi4 fa
    sol4 la sib la8 sol

    %29
    la2~la8 la sol\prall fa
    sol4 sol sol4. la8\mbreak
    fad4 re sol4. sol8

    %32
    sol4. la8 fad4. sol8
    sol4 re8 dod re4 mi
    fa8 sol la4 sol4.\tr fa8

    %35
    mi4 mi8 re mi4 fa
    sol la sib la8 sol
    la mi fa sol la4. la8

    %38
    la4 sib8[la sol fa mi re]
    dod4. re8 mi4 la,
    fa'4. mi8 mi4.\prall  re8\mbreak

    %41
    re2 r
    R1
    r2 sol2~

    %44
    sol4 la8 sol fad4. sol8
    sol2 r2
    R1

    %47
    r2 fa4. fa8
    sol8 la sib la sol4.\prall fa8
    fa2 r

    %50
    R1*5
    r2 sol4. sol8

    %56
    sol4 do, fa4. fa8
    fa4 mi8 re mi4. mi8
    la4 la8 sol fa4 fa8 mi

    %59
    re4 sol, sol'4. do,8\mbreak
    fa8 sol mi fa re4.\prall do8
    do2 do'4. sib8

    %62
    la sol fa mi re4.\prall do8
    do\breve

}

IIIhcn = \relative do'' {

    R1*19
    r4 sol sol fad
    sol si do2~

    %22
    do4 re mi4. re8
    do4 la do4. re8
    mi4. do8 re mi re do

    %25
    si4 si8 la si4 dod
    re la si4. si8
    do4 do8 si do4 re

    %28
    mi1~
    mi8 mi re dod re2~
    re do?~\mbreak

    %31
    do si4. si8
    si4 mi la, si8 do
    si4 si8 la si4 dod

    %34
    re la si4. \prall si8
    do4 do8 si do4 re
    mi do do4. do8

    %37
    do2~do8 la sib do
    re4 re8 do sib4. sib8
    la2 la4. la8

    %40
    la4 la8 sib la4. la8\mbreak
    la2 r
    R1

    %43
    r2 re4. re8
    mi4 mi8 re do4 la
    si2 r

    %46
    R1
    r2 do4. do8
    re do si do do4. do8

    %49
    do2 r
    R1*5
    r2 mi4. mi8

    %56
    mi4 la, re4. re8
    re4 do8 si do4. do8
    do4 do do  re8 do

    %59
    si4 si do4. la8\mbreak
    si4 si8 sol sol4. sol8
    sol2 sol4. sol8

    %62
    la sol fa sol sol4. sol8
    sol\breve

}

IIItln = \relative do' {

    R1*18
    r2 re4. re8
    mi4 mi re4.\prall do8

    %21
    si4 re mi2~
    mi4 re8 do si4. si8
    do re mi fa sol4. sol8

    %24
    sol4 sol fa8 sol la4
    sol2. sol4
    la8 sol fa4 mi4. re8

    %27
    do4 la la'4. la8
    sol1~
    sol8 sol fa mi fa4. fa8

    %30
    mi2 r4 la8 la\mbreak
    la4 fad sol8 fad mi re
    mi4 mi re4. re8

    %33
    re4 sol sol sol
    la fa? mi4.\prall re8
    do4 la la' la

    %36
    sol fa mi fa8 sol
    fa do re mi fa2~
    fa4 fa8 mi re4 sol

    %39
    mi2 r8 mi mi mi
    mi4 re dod re8 mi\mbreak
    fad2 r

    %42
    R1
    r2 sol4. sol8
    la4 sol la8 mi re re

    %45
    re2 r
    R1
    r2 la'4. la8

    %48
    sol fa mi fa mi4 fa8 sol
    la2 r
    R1*5

    %55
    r2 do4. si8
    la4 la la4. la8
    si4 sol sol4. sol8

    %58
    fa4 la la la
    sol sol sol sol8 fa\mbreak
    fa4 sol8 do, si4 do8 re

    %61
    mi4 mi8 fa sol fa mi re
    do4 si8 do si4 do8 re
    mi\breve

}


IIIbsn = \relative do {

    R1*3
    r2 sol'4. sol8
    la4 la sol4.\prall fa8

    %6
    mi4 do fa4. fa8
    sol2. sol4
    re8 mi fa4 sol4. sol8

    %9
    la2. la4\mbreak
    mi1
    fa2~fa8 fa mi re

    %12
    do1
    do
    do

    %15
    do4 fa, fa'4. fa8
    sol2 r
    R1

    %18
    r2 mi
    fa sol\mbreak
    do, re

    %21
    sol,4 sol' mi2
    fa sol4. sol8
    la4 la sol4.\prall fa8
    mi4 do fa4. fa8

    %25
    sol2. sol4
    re8 mi fa4 sol4. sol8
    la2. la4

    %28
    mi2. mi4
    fa2~fa8 fa mi re
    mi2 la\mbreak

    %31
    re, mi4. si8
    do4 do re re,
    sol sol' fa mi

    %34
    re8 mi fa4 sol4. sol8
    la2. la4
    mi2. mi4

    %37
    fa2~fa8 fa sol la
    sib2. sol4
    la2 dod,4. dod8

    %40
    re8 mi fa sol la4 la,\mbreak
    re2 sol4. sol8
    do,4 do re4. re8

    %43
    mi4 re8 do si4. si8
    do4 do8 si la4 re
    sol,2 do4. do8

    %46
    fa4 fa sol4. sol8
    la4 la la4. la8
    sib la sol fa do'4 do,

    %49
    fa2 mi
    fa4 fa sol4. sol8\mbreak
    la4 la8 sol fa2

    %52
    mi4 mi fa4. fa8
    sol2 mi4. mi8
    fa4 fa sol sol,
    la la' mi4. mi8

    %56
    fa4 fa8 mi re4. re8
    sol4 sol do,4. do8
    fa4 fa8 sol la4 fa

    %59
    sol2 mi4. mi8\mbreak
    re4 do sol' sol,
    do do8 re mi4 do

    %62
    fa8 mi re do sol'4 sol,
    do\breve

}


IIIorgn = \relative do {

    do'1~
    do2 si
    do1

    %4
    fa,2 r
    R1*11
    r2 mi

    %17
    fa sol4. sol8
    la2 r
    R1*3

    %22
    r2 sol4. sol8
    la4 la sol4.\prall fa8
    mi4 do fa4. fa8

    %25
    sol2. sol4
    re8 mi fa4 sol4. sol8
    la2. la4

    %28
    mi2. mi4
    fa2~fa8 fa mi re
    mi2 la\mbreak

    %31
    re, mi4. si8
    do4 do re re,
    sol sol' fa mi

    %34
    re8 mi fa4 sol4. sol8
    la2. la4
    mi2. mi4

    %37
    fa2~fa8 fa sol la
    sib2. sol4
    la2 dod,4. dod8

    %40
    re8 mi fa sol la4 la,\mbreak
    re2 r
    R1

    %43
    r2 si4. si8
    do4 do8 si la4 re
    sol,2 r

    %46
    R1
    r2 la'4. la8
    sib la sol fa do'4 do,

    %49
    fa2 r
    R1*5
    r4 la mi4. mi8

    %56
    fa4 fa8 mi re4. re8
    sol4 sol do,4. do8
    fa4 fa8 sol la4 fa

    %59
    sol2 mi4. mi8\mbreak
    re4 do sol' sol,
    do do8 re mi4 do

    %62
    fa8 mi re do sol'4 sol,
    do\breve

}


IIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s
    s
    s
    s2 <6 4>
    s <5>4 <6>
    s1
    s2 <6>
    s1
    <6>2 <5->
    <9> <8>
    s1*3
    s2 <6>
    s1
    s
    s1
    s
    s2 <4>4 <3>
    s2 <6>
    <5>4 <6> s2
    s1
    s1*4
    s1*14
    s2 <6>
    <5>1
    s1*7
    s2 <6>
    s1
    s
    <9 7>4 <8 6> <3> s

}


IIIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6 4>
    s
    s
    s1*12
    <9>4 <8> <5 4> <5 3>
    s1
    s
    s
    s
    s
    s2 <6 4>
    s1*4
    <6>2 <5->
    <9 7> <8 6>
    <7> <_->
    <7> <5>
    s <3+>
    s1
    s2 <6>
    s1*3
    <7>2 <6>
    <_+>1
    <9>2 <_+>
    <_+>1
    s
    s
    <6 5>4 <5> s2
    s1*3
    s2 <3>
    s1*11
    s2 <3>

}


forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    \key do\major
    s1*62
    s\breve
    \bar"|."

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

IIIhc = {
    \IIIglobal
    <<\IIIhcn \forma>>

}

IIItl = {
    \IIIglobal
    <<\IIItln \forma>>

}

IIIbs = {
    \IIIglobal
    \clef bass
    <<\IIIbsn \forma \IIIbfIn>>

}

IIIorg = {
    \IIIglobal
    \clef bass
    <<\IIIorgn \forma\IIIbfIIn>>

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \header {
        subtitle = \markup \center-column{"Après Confitebor - Antienne H.516""pour 2 fls, cordes (4), bc [1675]"}
        composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
    }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/2 la''2^\markup \center-align\smaller\center-column {"Flûte I"} fad''4. fad''8 }
                \set Staff.shortInstrumentName = "fl1"
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IflI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/2 la''2^\markup \center-align\smaller\center-column {"Flûte II"} fad''4. fad''8 }
                \set Staff.shortInstrumentName = "fl2"
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IflII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/2 la''2^\markup \center-align\smaller\center-column {"Violon I"} fad''4. fad''8 }
                \set Staff.shortInstrumentName = "vl1"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/2 la''2^\markup \center-align\smaller\center-column {"Violon II"} fad''4. fad''8 }
                \set Staff.shortInstrumentName = "vl2"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 2/2 r2^\markup \center-align\smaller\center-column {"[Haute-contre]"} re'' }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ihc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key re\major \time 2/2 r1^\markup \center-align\smaller\center-column {"[Taille]"} r2 la' }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Itl
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basses]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bs"
                \Ibs
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"Orgue"}
                \set Staff.midiInstrument = #"church organ"
                \set Staff.shortInstrumentName = "org"
                \Iorg
            >>
        >>

        \layout {

            indent = 2.0\cm

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

    \header {
        subtitle = \markup \center-column{"Après Beati omnes - Antienne H.517""pour cordes (4), bc [1675]"}
        composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
    }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4^\markup \center-align\smaller\center-column {"[Violons]"} re'' re'' }
                \set Staff.shortInstrumentName = "vl1"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1^\markup \center-align\smaller\center-column {"[Haute-contre]"} r2 sol'4 sol' }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1^\markup \center-align\smaller\center-column {"[Taille]"} r r r r r r4 re' re' }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IItl
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Basse]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 2.0\cm

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

        systems-per-page = #2

    }

    \header {
        subtitle = \markup \center-column{"Antienne pour les violons, flûtes et hautbois à quatre parties""pour 2 fls, hbs, cordes (4), bc H.532 (ca 1691)"}
        composer = \markup \center-column{" ""M-A. Charpentier (1643-1707)"}
    }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1 r r2^\markup \center-align\smaller\center-column {"Flûte et Haubois I"} sol''4. sol''8 }
                \set Staff.shortInstrumentName = "fl1"
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IIIflI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r2^\markup \center-align\smaller\center-column {"Flûte et Hautbois II"} sol''4. sol''8 }
                \set Staff.shortInstrumentName = "fl2"
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IIIflII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1 r r2^\markup \center-align\smaller\center-column {"Violon I"} sol''4. sol''8 }
                \set Staff.shortInstrumentName = "vl1"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r2^\markup \center-align\smaller\center-column {"Violon II"} sol''4. sol''8 }
                \set Staff.shortInstrumentName = "vl2"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4^\markup \center-align\smaller\center-column {"[Haute-contre]"} sol' 4 sol'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r2^\markup \center-align\smaller\center-column {"Taille"} re'4. re'8 }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IIItl
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basses]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bs"
                \IIIbs
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"Orgue"}
                \set Staff.midiInstrument = #"church organ"
                \set Staff.shortInstrumentName = "org"
                \IIIorg
            >>
        >>

        \layout {

            indent = 2.0\cm

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
