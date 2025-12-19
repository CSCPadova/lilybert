\language "italiano"
	%********************************** VARIABILI

acc = \once \override Stem #'stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

pipeSymbol = \bar "||"

tasto = _\markup\italic"Tasto"

tr = \trill

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "T."

sos =_\markup\italic"sostenuto"

pad = \once \override TextScript #'padding = #3

padall = \override TextScript #'padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber #'transparent = ##t

con = \override TupletNumber #'transparent = ##f

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }

Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
}

IvlsIn = \relative do'' {

    sol'1~
    sol
    mi~

    %4
    mi~
    mi2 fad~
    fad sol~

    %7
    sol fa?~\mbreak
    fa1~
    fa

    %10
    sol
    lab2 sol\mbreak
    la? sib!~

    %13
    sib1~
    sib4 la sib2\fermata

}

IvlsIIn = \relative do'' {

    re1~
    re~
    re~

    %4
    re
    dod2 do~
    do re

    %7
    mi do~
    do re~
    re1

    %10
    mi!
    re2 si\mbreak
    do re~

    %13
    re sib
    do sib\fermata

}

Ivlan = \relative do' {

    si'1~
    si~
    si~

    %4
    si
    la~
    la2 sib~

    %7
    sib lab~\mbreak
    lab1~
    lab

    %10
    sol
    fa2 sol\mbreak
    fa1~

    %13
    fa2 sol
    fa fa\fermata

}

Ivltn = \relative do' {

    re1~
    re~
    re~

    %4
    re
    mi2 re~
    re1

    %7
    do~
    do2 re~
    re1

    %10
    do
    re2 mib~
    mib fa~

    %13
    fa mib
    do re\fermata

}

Ivdgn = \relative do {

    sol1~
    sol
    sold~

    %4
    sold
    dod2 re~
    re sol,?

    %7
    do? fa,~
    fa si~
    si1

    %10
    sib~
    sib2 mib~\mbreak
    mib re~

    %13
    re mib
    fa sib,\fermata

}


Ialton = \relative do' {

    \autoBeamOff

    sol'8 si sol sol16 fad sol8 sol r4
    sol8 sol sol sol16 la fa4 fa8 fa16 mi
    mi8 mi r mi sold sold la si

    %4
    mi, mi r4\mbreak mi8 mi mi mi16 mi
    la8 la r16 sol sol fad fad8 fad r4
    do'8 fad, r16 la la sib sib4 sib

    %7
    sib?8 sol  r16 sol sol lab lab4 lab\mbreak
    lab 8do lab lab16 sol lab8 lab r fa
    si si do re fa, fa lab sol

    %10
    mi! mi r4 sol8 sol16 sol sib8 lab
    lab? lab r16 fa lab sol sol8 sol r sol16 sib\mbreak
    la!4 sol8 fa sib sib r fa

    %13
    lab lab lab sol sol sol sib lab16 sib
    fa2 fa\fermata

}

Itesto = \lyricmode {

    Summe _  Astrorum _ _  Creator, _
    qui de nihilo _ _ jam cuncta _ edu -- xisti, _
    et tibi_ut _ ser -- vi_es -- semus _
    ad i -- ma -- ginem _ tuam _ tu nos fe -- cisti, _
    Clemens _ in Caelo _ Pater, _
    Potens _ in Mundo _  Deus, _
    qui Jaheli _ _ vic -- trici, _
    qui Deborae _ _ pugnanti _ _ vim de -- disti, _
    adiuva _ _ nos in prece, _ et culpas _ tolle, _
    et de forti _ tua dextra _
    im -- belli _ dextrae _ meae _ robur _ ex -- tolle. _

}


Ibcn = \relative do {

    sol1~
    sol
    sold~

    %4
    sold
    dod,2 re~
    re sol?

    %7
    do,? fa~
    fa si~
    si1

    %10
    sib~
    sib2 mib,~\mbreak
    mib re~

    %13
    re mib
    fa sib_\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 57
    s1*14
    \bar"|."

}


IvlsI = {
    \Iglobal
    %\notypeset
    <<\IvlsIn \forma>>

}

IvlsII = {
    \Iglobal
    %\clef soprano
    <<\IvlsIIn \forma>>

}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Ivlt = {
    \Iglobal
    \clef tenor
    <<\Ivltn \forma>>

}

Ivdg = {
    \Iglobal
    \clef bass
    <<\Ivdgn \forma>>

}

Ialto = {
    \new Voice = "summe"
    \Iglobal
    \clef "treble_8"
    <<\Ialton \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}

IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
}

IIvlsIn = \relative do'' {

    la'16
    la4 re,8. [la'16 sib8. la16]
    sol4~sol8.[sol16 la8. sol16]
    fa4~fa8.[fa16 sol8. fa16]

    %4
    mi4~mi8.[mi16 fa8. sol16]
    fa4~fa8.[fa16 sol8. fa16]
    mi4 r r

    %7
    mi r r
    r8 r16 la[la8. sol16 sol8. fad16]
    fad?2.

    %10
    r8 r16 sol[sol8. fa?16 fa8. mi16]
    mi2.\mbreak
    r8 r16 fa[fa8. mi16 mi8. re16]

    %13
    re8.[sol16 sol8. fa16 fa8. mi16]
    mi8.[la,16 fa'8. la,16 sol'8. la,16]
    la'8.[la,16 sol'8. la,16 fa'8. la,16]

    %16
    mi'8.[la,16 fa'8. la,16 sol'8. la,16]
    la'8.[la,16 sol'8. la,16 fa'8. la,16]
    sol'2.~

    %19
    sol8.[la16 la8. sol16 sol8. fa16]
    fa4. sol8 la4
    sol8 fa mi4.\tr re8

    %22
    re4 r r\mbreak
    R2.*2
    r8 r16 la'[la8. sol16 sol8. fad16]

    %26
    fad?2.
    r8 r16 sol[sol8. fa!16 fa8. mi16]
    mi2.\mbreak

    %29
    r8 r16 fa[fa8.  mib16 mib8. re16]
    re2 fa4
    fa8.[fa16 mi8. mi16 mi8. mi16]\mbreak

    %32
    fa4 fa,8.[sol16 la8. sib16]
    do8.[sib16 do8. re16 mi8. do16]
    fa8.[mi16 fa8. sol16 la8. sib16]

    %35
    mi,8. [sib'16 sib8. sib16 sib8. sib16]
    sol8.[sol16 sol8. sol16 sol8. sol16]
    la4 r r8 r16 la

    %38
    la4 sib~sib8. la16
    sol4 la~la8. sol16
    fa4 sol~sol8. fa16

    %41
    fa4 mi r
    R2.\mbreak
    mi8.[la,16 fa'8. la,16 sol'8. la,16]

    %44
    la'8.[la,16 sol'8. la,16 fa'8. la,16]
    mi'8.[la,16 fa'8. la,16 sol'8. la,16]
    la'8.[la,16 sol'8. la,16 fa'8. la,16]

    %47
    mi'4 r re'
    fa,8.[sol16 fa8. sol16 fa8. sol16]
    fa4. sol8 mi4

    %50
    fa re8. [la'16 sib8. la16]
    sol4~sol8.[sol16 la8. sol16]
    fa4~fa8.[fa16 sol8. fa16]

    %53
    mi8.[la,16 fa'8. la,16 sol'8. la,16]
    la'8.[la,16 sol'8. la,16 fa'8. la,16]
    mi'8.[la16 la8. sol16 sol8. fa16]

    %56
    fa4. sol8 la4
    sol8 fa mi4.\tr re8
    re4\fermata r r

    %59
    do'8 do do do do do
    do do do do do do
    do do sib sib sib sib

    %62
    sib sib sib sib sib sib
    la la sol sol sol sol\mbreak
    fa la la la la la

    %65
    sold sold sold sold sold sold
    la la la la la la
    si si si si si si

    %68
    si? si si si si si
    la la la la la la
    la la la la la la

    %71
    sold sold sold sold la la
    la la la la sold sold\mbreak
    la4 r r\fermata

}

IIvlsIIn = \relative do'' {

    fa16
    fa4 re8.[fa16 sol8. fa16]
    mi4~mi8.[mi16 fa8. mi16]
    re4~re8.[re16 mi8. re16]

    %4
    dod4~dod8.[dod16 re8. mi16]
    re4~re8.[re16 mi8. re16]
    dod4 r r

    %7
    dod? r r
    r8 r16 mi[mi8. mi16 mi8. mi16]
    re2.

    %10
    r8 r16 re [re8. re16 re8. re16]
    do2.\mbreak
    r8 r16 do[do8. do16 do8. sib16]

    %13
    sib8.[mi16 mi8. re16 re8. dod16]
    dod?8.[la16 re8. la16 mi'8. la,16]
    fa'8.[la,16 mi'8. la,16 re8. la16]

    %16
    dod8.[la16 re8. la16 mi'8. la,16]
    fa'8.[la,16 mi'8. la,16 re8. la16]
    mi'2.~

    %19
    mi8.[mi16 mi8. mi16 mi8. re16]
    re4. mi8 fa4
    mi8 re dod4.\tr re8

    %22
    re4 r r\mbreak
    R2.*2
    r8 r16 mi[mi8. mi16 mi8. re16]

    %26
    re2.
    r8 r16 re[re8. re16 re8. do16]
    do2.

    %29
    r8 r16 do[do8. do16 do8. sib16]
    sib2.
    sib8.[sib16 sib8. sib16 sib8. sib16]\mbreak

    %32
    la4 r r
    R2.*2
    r8 r16 sol'[sol8. sol16 sol8. sol16]

    %36
    fa8.[fa16 fa8. fa16 mi8. mi16]
    fa4 r r8 r16 mi
    fa4 sol~sol8. fa16

    %39
    mi4 fa~fa8. mi16
    re4 mi~mi8. re16
    re4 dod r

    %42
    R2.\mbreak
    dod8.[la16 re8. la16 mi'8. la,16]
    fa'8.[la,16 mi'8. la,16 re8. la16]

    %45
    dod8.[la16 re8. la16 mi'8. la,16]
    fa'8.[la,16 mi'8. la,16 re8. la16]
    dod4 r fa

    %48
    re8.[mi16 re8. mi16 re8. mi16]
    re4. mi8 dod4
    re re8.[fa16 sol8. fa16]

    %51
    mi4~mi8.[mi16 fa8. mi16]
    re4~re8.[re16 mi8. re16]
    dod8.[la16 re8. la16 mi'8. la,16]\mbreak

    %54
    fa'8.[la,16 mi'8. la,16 re8. la16]
    dod8.[mi16 mi8. mi16 mi8. re16]
    re4. mi8 fa4

    %57
    mi8 re dod4.\tr re8
    re4\fermata r r
    la'8 la la la la la

    %60
    sol sol sol sol sol sol
    fa fa fa fa fa fa
    sol sol sol sol sol sol

    %63
    fa fa fa fa mi mi\mbreak
    fa fa fa fa fa fa
    re re re re re re

    %66
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    re re re re re re

    %69
    do do do do do do
    red red red red red red
    mi mi mi mi mi mi

    %72
    fa fa mi mi mi mi\mbreak
    mi4 r r\fermata

}

IIvlan = \relative do' {

    fa16
    fa4 fa~fa8. fa16
    sol8. sol16 sol4~sol8. sol16
    la8. la16 sold4~sold8. sold16

    %4
    mi8. mi16 dod'4~dod8. dod16
    la8. la16 sold4~sold8. sold16
    mi8. [mi16 mi8. fa16 sol8. fa16]

    %7
    mi8. [mi16 mi8. fa16 sol8. fa16]
    mi4 r r
    r8 r16 re' [re8. do16 do8. si16]

    %10
    si?2.
    r8 r16 do[do8. sib!16 sib8. la16]\mbreak
    la2.

    %13
    r8 r16 sib[sib8. sib16 sib8. sib16]
    mi,4 la8.[sol16 sol8. fa16]
    fa4 r r

    %16
    r la8.[sol16 sol8. fa16]
    fa4 r r
    la2.

    %19
    dod8.[dod16 dod8. dod16 dod8. dod16]
    la4. la8 la4
    sib mi,4. mi8

    %22
    fa4 r r\mbreak
    R2.*3
    r8 r16 re'[re8. do16 do8. si16]

    %27
    si?2.
    r8 r16 do[do8. sib!16 sib8. la16]
    la2.

    %30
    r8 r16 fa[fa8. fa16 fa8. fa16]
    sol8.[sol16 sol8. sol16 sol8. sol16]\mbreak
    fa4 r r

    %33
    R2.*2
    r8 r16 sol[sol8. sol16 sol8. sol16]
    la8.[la16 re8. re16 sol,8. sol16]

    %37
    fa4 r r
    re8.[re16 re8. sol16 sol8. sol16]
    do8.[do16 fa,8. fa16 fa8. fa16]

    %40
    sib8.[sib16 sol8. sol16 sol8. sol16]
    la4 la r
    R2.\mbreak

    %43
    r4 la8.[sol16 sol8. fa16]
    fa4 r r
    r la8.[sol16 sol8. fa16]

    %46
    fa4 r r
    la r r
    si si si

    %49
    si?2 la4
    la fa~fa8. fa16
    sol8. sol16 sol4~sol8. sol16

    %52
    la8. la16 sold4~sold8. sold16
    mi4 la8.[sol16 sol8. fa16]\mbreak
    fa4 r r

    %55
    r8 r16 dod'[dod8. dod16 dod8. la16]
    la2 la4
    sib mi,4. la8

    %58
    fa4\fermata r r
    fa8 fa fa fa fa fa
    sol sol sol sol sol sol

    %61
    la la fa fa fa fa
    mi mi mi mi mi mi
    fa fa sol sol sol sol\mbreak

    %64
    la la la la la la
    si si si si si si
    do do do do do do

    %67
    si si si si si si
    si? si si si si si
    do do do do do do

    %70
    fad, fad fad fad fad fad
    sold sold sold sold mi mi
    re re si' si si si\mbreak

    %73
    la4 r r\fermata

}

IIvltn = \relative do' {

    re16
    re4 re4~re8. re16
    dod8. dod16 dod4~dod8. dod16
    re8. re16 si4~si8. si16

    %4
    dod8. dod16 dod4~dod8. dod16
    re8. re16 si4~si8. si16
    dod8.[dod16 dod8. re16 mi8. re16]

    %7
    dod8.[dod16 dod8. re16 mi8. re16]
    dod4 r r
    r8 r16 la'[la8. la16 la8. la16]

    %10
    sol2.
    r8 r16 sol[sol8. sol16 sol8. sol16]\mbreak
    fa2.

    %13
    r8 r16 mi[mi8. sol16 sol8. re16]
    fa,4 fa'8.[mi16 mi8. re16]
    re4 r r

    %16
    r fa8.[mi16 mi8. re16]
    re4 r r
    dod2.

    %19
    dod?8. dod16 la8.[la16 la8. la16]
    la2  fa'4
    sol dod,4. la8

    %22
    la4 r r\mbreak
    R2.*3
    r8 r16 la'[la8. la16 la8. sol16]

    %27
    sol2.
    r8 r16 sol[sol8. sol16 sol8. fa16]
    fa2.

    %30
    r8 r16 re[re8. re16 re8. re16]
    do8.[do16 do8. do16 do8. do16]
    do4 r r

    %33
    R2.*2
    r8 r16 mi[mi8. mi16 mi8. mi16]
    do8.[do16 re8. re16 do8. do16]

    %37
    do4 r r
    R2.*5\mbreak
    r4 fa8.[mi16 mi8. re16]

    %44
    re4 r r
    r4 fa8.[mi16 mi8. re16]
    re4 r r

    %47
    dod r r
    re re re
    re2 la4

    %50
    fa re'~re8. re16
    dod8. dod16 dod4~dod8. dod16
    re8. re16 si4~si8. si16

    %53
    dod4 fa8.[mi16 mi8. re16]\mbreak
    re4 r r
    r8 r16 mi[mi8. mi16 mi8. fa16]

    %56
    fa4. mi8 re4
    mi8 fa dod4. la8
    la4\fermata r r

    %59
    do8 do do do do do
    do do do do do do
    re re re re re re

    %62
    mi mi mi mi mi mi
    do do do do do do\mbreak
    do do do do do do

    %65
    re re re re re re
    do do do do mi mi
    mi mi mi mi mi mi

    %68
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    red red red red red red

    %71
    sib sib sib sib do do
    si si si si si si\mbreak
    do4 r r\fermata

}

IIvdgn = \relative do {

    re16
    re4 re~re8. re16
    mi8. la,16 la4~la8. la16
    re8. re16 sold,4~sold8. sold16

    %4
    la8. la16 la4~la8. la16
    re8. re16 sold,4~sold8. sold16
    la4~la8.[la16 la8. la16]

    %7
    la4~la8.[la16 la8. la16]
    la8.[la16 la8. la16 la8. la16]
    re8.[re16 re8. re16 re8. re16]

    %10
    sol8.[sol16 sol8. sol16 sol8. sol16]
    do,8.[do16 do8. do16 do8. do16]\mbreak
    fa8. [fa16 fa8. fa16 fa8. fa16]

    %13
    sol8. [sol16 sol8. sol,16 sol8. sol16]
    la2.~
    la~

    %16
    la~
    la~
    la

    %19
    la8.[la16 la8. la16 la8. la16]
    re2 re4
    sol, la2

    %22
    re8.[re16 re8. re16 re8. re16]\mbreak
    sol,8.[sol16 sol8. sol16 sol8. sol16]
    sold8.[sold16 sold8. sold16 sold8. sold16]

    %25
    la8.[la16 la8. la16 la8. la16]
    re8.[re16 re8. re16 re8. re16]
    sol8.[sol16 sol8. sol16 sol8. sol16]

    %28
    do,8.[do16 do8. do16 do8. do16]
    fa8.[fa16 fa8. fa16 fa8. fa16]
    sib,8.[sib16 sib8. sib16 sib8. sib16]

    %31
    do8.[do16 do8. do16] do,8. do16\mbreak
    fa4 fa'~fa8. fa16
    mi4 mi~mi8. mi16

    %34
    re4 re~re8. re16
    do8.[do16 do8. do16 do8. do16]
    fa8.[fa16 sib,8. sib16 do8. do16]

    %37
    fa8.[sol16 fa8. mi16 re8. dod16]
    re4 r r
    R2.*2

    %41
    la8.[la16 la8. la16 la8. la16]
    la8.[la16 la8. la16 la8. la16]\mbreak
    la2.~

    %44
    la~
    la~
    la

    %47
    la4 r r
    sold sold sold
    sold?2 la4

    %50
    re, re'~re8. re16
    mi8. la,16 la4~la8. la16
    re8. re16 sold,4~sold8. sold16

    %53
    la2.~\mbreak
    la
    la8.[la16 la8. la16 la8. la16]

    %56
    re2 re4
    sol, la2
    re4\fermata r r

    %59
    fa8 fa fa fa fa fa
    mi mi mi mi mi mi
    re re re re re re

    %62
    do do do do do do
    do do do do do do\mbreak
    fa fa fa fa fa fa

    %65
    fa fa fa fa fa fa
    do do do do do do
    sold sold sold sold sold sold

    %68
    sold? sold sold sold sold sold
    la la la la la la
    si si si si si si

    %71
    mi mi re re do do
    re re mi mi mi, mi\mbreak
    la4 r r\fermata

}


IIalton = \relative do' {

    \autoBeamOff

    r16
    R2.*20
    r4 r r8 r16 la'
    la4 re,4. sib'8\mbreak

    %23
    sib4 dod,4. mi8
    fa4 sol4. fa8
    fa4 mi r8 r16 la

    %26
    la8. fad16 fad4. la8
    si4 sol r8 r16 sol
    sol8. mi16 mi4. sol8

    %29
    la4 fa r8 r16 fa
    fa2.~
    fa8. sol16 mi2\mbreak

    %32
    fa4 r r
    R2.*4
    r4 r r8 r16 la

    %38
    la4 sib~sib8. la16
    sol4 la~la8. sol16
    fa4 sol~sol8. fa16

    %41
    fa4 mi r8 r16 mi
    la4 sol fa\mbreak
    mi16[re] mi8 r4 r

    %44
    r r la
    la2.~
    la

    %47
    la4 r re
    fa,8.[sol16 fa8. sol16 fa8. sol16]
    fa4. sol8 mi4

    %50
    re r r
    R2.*7
    r4 r r8 r16 la'

    %59
    la4 do~do8. fa,16
    sol4 do~do8. mi,16
    fa4 sib~sib8. fa16

    %62
    mi8. fa16 sol4~sol8. sib16
    la8. sib16 sol2\mbreak
    fa4 r r

    %65
    r r r8 sold
    la4 mi~mi8. do'16
    si?4 mi,~mi8. si'16

    %68
    re4 do~do8. si16
    do8. si16 la4 r8 r16 la
    la4 la~la8. si16

    %71
    sold4 r r8 r16 la
    la4. si8 sold4\mbreak
    la4 r r\fermata

}

IItesto = \lyricmode {

    In somno _  pro -- fundo _
    si jacet  _ im -- mersus _
    non amplius _ _ sit vigil _
    non amplius _ _ sit vigil _
    qui dor -- mit in te, si jacet  _ im -- mersus _
    in somno _  pro -- fundo _ non amplius_sit  _  vi - gil
    qui dor -- mit qui dor - mit in te.
    Quiescat _ _  ex -- anguis, _
    et sanguis _
    sic ex -- eat _
    su -- perbus _ in me, quiescat _ _  ex -- anguis, _
    et sanguis _
    sic ex -- eat _
    su -- perbus _ in me,
    su -- perbus _ in me.

}


IIbcn = \relative do {

    re16
    re4 re~re8. re16
    mi8. la,16 la4~la8. la16
    re8. re16 sold,4~sold8. sold16

    %4
    la8. la16 la4~la8. la16
    re8. re16 sold,4~sold8. sold16
    la4~la8.[la16 la8. la16]

    %7
    la4~la8.[la16 la8. la16]
    la8.[la16 la8. la16 la8. la16]
    re8.[re16 re8. re16 re8. re16]

    %10
    sol8.[sol16 sol8. sol16 sol8. sol16]
    do,8.[do16 do8. do16 do8. do16]\mbreak
    fa8. [fa16 fa8. fa16 fa8. fa16]

    %13
    sol8. [sol16 sol8. sol,16 sol8. sol16]
    la2.~
    la~

    %16
    la~
    la~
    la

    %19
    la8.[la16 la8. la16 la8. la16]
    re,2 re4
    sol la2

    %22
    re,8.[re16 re8. re16 re8. re16]\mbreak
    sol8.[sol16 sol8. sol16 sol8. sol16]
    sold8.[sold16 sold8. sold16 sold8. sold16]

    %25
    la8.[la16 la8. la16 la8. la16]
    re8.[re16 re8. re16 re8. re16]
    sol8.[sol16 sol8. sol16 sol8. sol16]

    %28
    do,8.[do16 do8. do16 do8. do16]
    fa8.[fa16 fa8. fa16 fa8. fa16]
    sib,8.[sib16 sib8. sib16 sib8. sib16]

    %31
    do8.[do16 do8. do16] do,8. do16\mbreak
    fa4 fa'~fa8. fa16
    mi4 mi~mi8. mi16

    %34
    re4 re~re8. re16
    do8.[do16 do8. do16 do8. do16]
    fa8.[fa16 sib,8. sib16 do8. do16]

    %37
    fa8.[sol16 fa8. mi16 re8. dod16]
    re4 r r
    R2.*2

    %41
    la8.[la16 la8. la16 la8. la16]
    la8.[la16 la8. la16 la8. la16]\mbreak
    la2.~

    %44
    la~
    la~
    la

    %47
    la4 r r
    sold sold sold
    sold?2 la4

    %50
    re, re'~re8. re16
    mi8. la,16 la4~la8. la16
    re8. re16 sold,4~sold8. sold16

    %53
    la2.~\mbreak
    la
    la8.[la16 la8. la16 la8. la16]

    %56
    re2 re4
    sol, la2
    re,4\fermata r r

    %59
    fa'8 fa fa fa fa fa
    mi mi mi mi mi mi
    re re re re re re

    %62
    do do do do do do
    do do do do do do\mbreak
    fa, fa' fa fa fa fa

    %65
    fa fa fa fa fa fa
    do do do do do do
    sold sold sold sold sold sold

    %68
    sold? sold sold sold sold sold
    la la la la la la
    si si si si si si

    %71
    mi mi re re do do
    re re mi mi mi, mi\mbreak
    la4 r r\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key fa\major
    \tempo 4 = 70
    \partial 16 s16
    s2.*73
    \bar"|."
    \mark\markup\smaller "D.C."

}


IIvlsI = {
    \IIglobal
    %\notypeset
    <<\IIvlsIn \forma>>

}

IIvlsII = {
    \IIglobal
    %\clef soprano
    <<\IIvlsIIn \forma>>

}

IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>

}

IIvlt = {
    \IIglobal
    \clef tenor
    <<\IIvltn \forma>>

}

IIvdg = {
    \IIglobal
    \clef bass
    <<\IIvdgn \forma>>

}

IIalto = {
    \new Voice = "somno"
    \IIglobal
    \clef "treble_8"
    <<\IIalton \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}
#(set-global-staff-size 16)

\version "2.18.0"

\pointAndClickOff

\paper  {

  systems-per-page = #3
  print-first-page-number = ##t
  first-page-number = #2

}

  \markup \huge {[1.] Con[cer]to di Viole all'Inglese}

  \score {

        \new ChoirStaff <<

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column {"[Viola""Soprano 1]"}
            \IvlsI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column {"[Viola""Soprano 2]"}
            \IvlsII
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"[Viola""Contralto]"}
            \Ivla
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"[Viola""Tenore]"}
            \Ivlt
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"[Basso""di Viola]"}
            \Ivdg

          >>

          \new Staff
          <<
            \set Staff.instrumentName = \markup  \center-column{"Ju:[ditha]"}
            \set Staff.midiInstrument = #"voice oohs"
            \Ialto
            \new Lyrics \lyricsto "summe" \Itesto
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup  \center-column{"Violone""Solo"}
            \Ibc
          >>
        >>

    \layout {

      indent = 1.8\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8.0
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
        skipBars = ##t
      }

    }

    \midi {
      \context {
        \Voice
        \remove Dynamic_performer
      }
    }

  }

\pageBreak

  \markup \huge {[2.] Larg[h]etto}

  \score {

        \new ChoirStaff <<

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IIvlsI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IIvlsII
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IIvlt
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IIvdg

          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"voice oohs"
            \IIalto
            \new Lyrics \lyricsto "somno" \IItesto
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
          >>
        >>

    \layout {

      indent = 0.8\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8.0
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
        skipBars = ##t
      }

    }

    \midi {
      \context {
        \Voice
        \remove Dynamic_performer
      }
    }

  }
