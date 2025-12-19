\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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

parentSlur =
 -\tweak stencil
 #(lambda (grob)
   (let* ((cp (ly:grob-property grob 'control-points))
          (lp (grob-interpret-markup grob (markup #:teeny "(")))
          (rp (grob-interpret-markup grob (markup #:teeny ")"))))
     (set! lp (ly:stencil-aligned-to lp Y CENTER))
     (set! lp (ly:stencil-aligned-to lp X 0.2))
     (set! lp (ly:stencil-translate lp (first cp)))
     (set! rp (ly:stencil-aligned-to rp Y CENTER))
     (set! rp (ly:stencil-aligned-to rp X -0.2))
     (set! rp (ly:stencil-translate rp (last cp)))
     (list-set! cp 0
       (cons (cdr (ly:stencil-extent lp X))
             (cdr (first cp))))
     (list-set! cp (1- (length cp))
       (cons (car (ly:stencil-extent rp X))
             (cdr (last cp))))
     (ly:grob-set-property! grob 'control-points cp)
     (apply ly:stencil-add (list lp rp
       (ly:slur::print grob)))))
 \etc

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
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f

}

IvlgIn = \relative do'' {

    sol'1~
    sol
    mi~

    %4
    mi~
    mi2 fad~
    fad sol~

    %7
    sol fa?~
    fa1~
    fa

    %10
    sol
    lab2 sol\mbreak
    la? sib~

    %13
    sib1~
    sib4 la sib2\fermata

}

IvlgIIn = \relative do'' {

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
    re2 sib?
    do re~

    %13
    re sib
    do sib\fermata

}

IvlgIIIn = \relative do' {

    si'1~
    si~
    si~

    %4
    si
    la~
    la2 sib~

    %7
    sib lab~
    lab1~
    lab

    %10
    sol
    fa2 sol
    fa1~

    %13
    fa2 sol
    fa fa\fermata

}

IvlgIVn = \relative do {

    re'1~
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
    re re\fermata

}

IvlgVn = \relative do {

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
    sib2 mib~
    mib re~

    %13
    re mib
    fa sib,\fermata

}

Ialton = \relative do' {

    \autoBeamOff

    sol'8 si sol sol16 fad sol8 sol r4
    sol8 sol sol sol16 la fa?4 fa8 fa16 mi
    mi8 mi r mi sold sold la si

    %4
    mi, mi r4\mbreak mi8 mi mi mi16 mi
    la8 la r16 sol sol fad fad8 fad r4
    do'8 fad, r16 la la sib  sib4 sib

    %7
    sib?8 sol r16 sol sol lab lab4 lab\mbreak
    lab8 do lab lab16 sol lab8 lab r fa
    si si do re fa, fa lab sol

    %10
    mi! mi r4 sol8 sol16 sol sib8 lab
    lab? lab r16 fa lab sol sol8 sol r sol16 sib\mbreak
    la!4 sol8 fa sib sib r fa

    %13
    lab lab lab sol sol sol sib la?16 sib
    fa2 fa\fermata

}

Itesto  = \lyricmode {

    Summe _ Astro - rum Creator, _
    qui de nihi - lo jam cuncta _ edux -- isti, _
    et tibi_ut _ ser -- vi_es -- semus _
    ad ima - ginem _ tuam _  tu nos fe -- cisti, _
    Clemens _ in Caelo _  Pater, _
    Potens _ in Mundo _ Deus, _
    Qui Ja -- heli _ vic -- trici, _
    qui Debo - rae pugnan - ti vim de -- disti, _
    adiu - va nos in prece, _ et culpas _ tolle, _
    et de forti _ tua dextra _
    im -- belli _  dextrae _ meae _ robur _  ex -- tol -- le.

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
    sib2 mib,~
    mib re~

    %13
    re mib
    fa sib?_\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key do\major
    \tempo 4 = 60
    s1*14
    \bar "|."

}


IvlgI = {
    \Iglobal
    \clef violin
    %\notypeset
    <<\IvlgIn\forma>>
}

IvlgII = {
    \Iglobal
    <<\IvlgIIn\forma>>
}

IvlgIII = {
    \Iglobal
    \clef alto
    <<\IvlgIIIn\forma>>
}

IvlgIV = {
    \Iglobal
    \clef tenor
    <<\IvlgIVn\forma>>
}

IvlgV = {
    \Iglobal
    \clef bass
    <<\IvlgVn\forma>>
}

Ialto = {
    \new Voice = "summe"
    \Iglobal
    <<\Ialton\forma>>
}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn\forma\Ibfn>>
    \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f

}

IIvlgIn = \relative do'' {

    la'16
    la4 re,8. [la'16 sib8. la16]
    sol4~sol8. [sol16 la8. sol16]
    fa4~fa8. [fa16 sol8. fa16]

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
    re4 r r
    R2.*2
    r8 r16 la'[la8. sol16 sol8. fad16]

    %26
    fad?2.
    r8 r16 sol[sol8. fa!16 fa8. mi16]
    mi2.

    %29
    r8 r16 fa[fa8. mib16 mib8. re16]
    re2 fa4
    fa8.[fa16 mi8. mi16 mi8. mi16]\mbreak

    %32
    fa4 fa,8.[sol16 la8. sib16]
    do8.[sib16 do8. re16 mi8. do16]
    fa8.[mi16 fa8. sol16 la8. sib16]

    %35
    mi,8.[sib'16 sib8. sib16 sib8. sib16]
    sol8.[sol16 sol8. sol16 sol8. sol16]
    la4 r r8 r16 la

    %38
    la4 sib~sib8. la16
    sol4 la~la8. sol16
    fa4 sol~sol8. fa16

    %41
    fa4 mi r\mbreak
    R2.
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
    fa re8.[la'16 sib8. la16]
    sol4~sol8. [sol16 la8. sol16]
    fa4~fa8. [fa16 sol8. fa16]

    %53
    mi8.[la,16 fa'8. la,16 sol'8. la,16]
    la'8.[la,16 sol'8. la,16 fa'8. la,16]
    mi'8.[la16 la8. sol16 sol8. fa16]

    %56
    fa4. sol8 la4
    sol8 fa mi4.\tr re8
    re4\fermata r r %%%%% fine

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

IIvlgIIn = \relative do'' {

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
    r8 r16 re[re8. re16 re8. re16]
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
    r8 r16 mi[mi8. mi16 mi8. mi16]

    %26
    re2.
    r8 r16 re[re8. re16 re8. do16]
    do2.\mbreak

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

IIvlgIIIn = \relative do' {

    fa16
    fa4 fa~fa8. fa16
    sol8. sol16 sol4~sol8. sol16
    la8. la16 sold4~sold8. sold16

    %4
    mi8. mi16 dod'4~dod8. dod16
    la8. la16 sold4~sold8. sold16
    mi8.[mi16 mi8. fa16 sol8. fa16]

    %7
    mi8.[mi16 mi8. fa16 sol8. fa16]
    mi4 r r
    r8 r16 re'[re8. do16 do8. si16]

    %10
    si?2.
    r8 r16 do[do8. sib!16 sib8. la16]\mbreak
    la2.

    %13
    r8 r16 sib[sib8. sib16 sib8. sib16]
    mi,4 la8. [sol16 sol8. fa16]
    fa4 r r

    %16
    r la8. [sol16 sol8. fa16]
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
    re8.[re16 sol8. sol16 sol8. sol16]
    do8.[do16 fa,8. fa16 fa8. fa16]

    %40
    sib8.[sib16 sol8. sol16 sol8. sol16]
    la4 la r
    R2.\mbreak

    %43
    r4 la8.[sol16 sol8. fa16]
    fa4 r r
    r4 la8.[sol16 sol8. fa16]

    %46
    fa4 r r
    la r r
    si si si

    %49
    si?2 la4
    la fa~fa8. fa16
    sol8. sol16 sol4~sol8. sol16]

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

IIvlgIVn = \relative do {

    re'16
    re4 re~re8. re16
    dod8. dod16 dod4~dod8. dod16
    re8. re16 si4~si8. si16

    %4
    dod8. dod16 dod4~dod8. dod16
    re8. re16 si4~si8. si16
    dod8. [dod16 dod8. re16 mi8. re16]

    %7
    dod8. [dod16 dod8. re16 mi8. re16]
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
    la2 fa'4
    sol dod,4. la8

    %22
    la4 r r\mbreak
    R2.*3
    r8 r16 la'16 [la8. la16 la8. sol16]

    %27
    sol2.
    r8 r16 sol[sol8. sol16 sol8. fa16]
    fa2.

    %30
    r8 r16 re[re8. re16 re8. re16]
    do8.[do16 do8. do16 do8. do16]\mbreak
    do4 r r

    %33
    R2.*2
    r8 r16 mi[mi8. mi16 mi8. mi16]
    do8.[do16 re8. re16 do8. do16]

    %37
    do4 r r
    R2.*5
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
    si? si si si do do
    si si si si si si\mbreak
    do4 r r\fermata

}

IIvlgVn = \relative do {

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
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %13
    sol8.[sol16 sol8. sol,16 sol8. sol16]
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
    do8.[do16 do8. do16] do,8.[do16]\mbreak
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
    la r r\fermata

}

IItesto  = \lyricmode {

    In somno _ pro -- fundo _
    si jacet _ im -- mersus _
    non ampli - us sit vigil _
    non ampli - us sit vigil _
    qui dor -- mit in te.
    Si ja -- cet im -- mersus _
    in som -- no pro -- fundo _
    non ampli -- us sit_vi - gil
    qui dor -- mit qui dor - mit in te.
    Quies - cat ex -- an -- guis,
    et san -- guis
    sic exe - at
    su -- perbus _ in me.
    Qui -- es -- cat ex -- an -- guis,
    et san -- guis
    sic exe - at
    su -- per -- bus in me
    su -- per -- bus in me.


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
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %13
    sol8.[sol16 sol8. sol,16 sol8. sol16]
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
    do8.[do16 do8. do16] do,8.[do16]\mbreak
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

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 3/4
    \key re\minor
    \tempo 4 = 60
    \partial 16 s16
    s2.*73
    \bar "||"
    \mark\markup\smaller "D.C."

}


IIvlgI = {
    \IIglobal
    \clef violin
    %\notypeset
    <<\IIvlgIn\forma>>
}

IIvlgII = {
    \IIglobal
    <<\IIvlgIIn\forma>>
}

IIvlgIII = {
    \IIglobal
    \clef alto
    <<\IIvlgIIIn\forma>>
}

IIvlgIV = {
    \IIglobal
    \clef tenor
    <<\IIvlgIVn\forma>>
}

IIvlgV = {
    \IIglobal
    \clef bass
    <<\IIvlgVn\forma>>
}

IIalto = {
    \new Voice = "somno"
    \Iglobal
    <<\IIalton\forma>>
}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn\forma\IIbfn>>
    \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
#(set-global-staff-size 16)


\pointAndClickOff

\header {
   subtitle = \markup {"Concerto di Viole all'Inglese" "[RV 644]"}
   composer = \markup \center-column{"A. Vivaldi (1678 -1741)"}
}

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge "[1.] [Recitativo]"


\score {

    \new ChoirStaff <<

        \new PianoStaff \with { instrumentName = "Viole all'Inglese" }  <<

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IvlgI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 4/4  re''1}
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \IvlgII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IvlgIII
            >>

            \new Staff <<
                \clef tenor
                \set Staff.midiInstrument = #"viola"
                \IvlgIV
            >>

            \new Staff <<
                \clef bass
                \set Staff.midiInstrument = #"viola"
                \IvlgV
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major\time 4/4  sol'8^\markup \center-align"Ju[ditha]"}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \Ialto
            \new Lyrics \lyricsto "summe" \Itesto
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup\center-column\center-align {"Violone""Solo"}
            \set Staff.midiInstrument = #"contrabass"
            \Ibc
        >>
    >>


    \layout {

        indent = 2.5\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup \huge "[2.] Larg[h]etto"


\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvlgI
            >>

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \IIvlgII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvlgIII
            >>

            \new Staff <<
                \clef tenor
                \set Staff.midiInstrument = #"viola"
                \IIvlgIV
            >>

            \new Staff <<
                \clef bass
                \set Staff.midiInstrument = #"viola"
                \IIvlgV
            >>
        >>

        \new Staff <<
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \IIalto
            \new Lyrics \lyricsto "somno" \IItesto
        >>

        \new Staff  <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>


    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

