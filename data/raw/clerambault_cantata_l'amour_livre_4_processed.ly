\language "italiano"
	%********************************** VARIABILI

\version "2.17.97"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

ten = ^\markup \italic \center-align "ten"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = \markup \italic \small \center-column{"Da Capo""dal Segno"}

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


Ivocen = \relative do'' {

    \autoBeamOff
    r4 re8 re16 re
    la8 la16 sib mi,8_+ mi16 fa
    fa8. fa16 r8 la\mbreak re r16 fa, re8_+ re

    %4
    sib'4. sib16 sib sol4-+ sol8. sol16
    mi2_+\mbreak r4 do'
    r8 do16 fa \appoggiatura mi16 re8. re16 mi8. fa16 sib,8. la16

    %7
    sol4-+ sol8 do do4 sib8 sib16 do\mbreak
    la4.-+ do16 re mi4-+ mi8 fa
    fa2

}

Itesto = \lyricmode {

    Pour oublier _ _ l'inconstante _ _ _ Cli -- meine _ Tir -- cis
    d'un antre af -- freux avoit _ fait son sé -- jour;
    L'à, du récit _ de sa cruelle _ _ peine _ sans cesse il
    fati - guoit les E'chos _ d'alen - tour.

}


Ibcn = \relative do {

    re1~
    re2 sib
    sol1

    %4
    la4. r32 sib la sol fa4. r32 mi fa sol
    la8 fa sib8. do32 sib64 la sol8 fa mi[fa]
    do4. do'8 re4 mi

    %7
    fa4. la,16 sib do4 do,
    fa2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 s4 <7+ 6- 4 2>4
    <3>2 <7>
    <_- 9 7> <8 6 5>
    <_+> <5>
    <6> <6>4 <5/>
    s2 <7>4 <5/>
    \bassFigureExtendersOn s4. <6>16 <6> <7->4 <7->

}

forma = {

    \time 4/4
    \key la\minor
    \tempo 4 = 60
    s1*7
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    s2
    \bar "||"

}


Ivoce = {
    \new Voice = "oublier"
    \notypeset
    \global
   % \clef soprano
    <<\Ivocen \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIfln = \relative do'' {

    r4_\markup\italic"fort tendrement"
    R2.*2
    r4 r r8 mi

    %4
    \appoggiatura mi fa2 fad4
    sol8.(fad16) fad4 sold8. la16
    sold4.-+ mi8 la4~\mbreak

    %7
    la8 si32(la) sold(la si4.) do16(la)
    la4(sold4.-+) la8
    la2 r8 mi

    %10
    mi2~mi16 (re dod si)
    la32(si dod re mi fa mi fa) fad4.-+(mi16 fad)
    sol8 (la32 sol fad sol64 la) la4.-+-+(sol16 la)\mbreak

    %13
    \appoggiatura la8 sib4~sib16 (la sol fa) mi4~
    mi8 (re16-+ dod) dod4 r8 fa
    fa4(mi4.-+) re8

    %16
    re2 r4
    R2.*3\mbreak % fine p. 6
    r8 mi la4. la8

    %21
    la4.(sib8) la8.(sib16)
    la4.(sol16-+ fa) mi8(fa16 re)
    dod4-+ r8 la' la(sol16-+ fa)

    %24
    mi4 r r
    R2.*2
    r4 r8 fa mi8-+[(re16)] mi

    %28
    \appoggiatura mi8 fa4 r16 la(sib do) sol8. sib16
    \appoggiatura fa8 mi8. fa16 mi4.-+ fa8
    fa4 r16 mi(fa sol sol8.-+ fa32 sol)\mbreak

    %31
    la4 r16 sib (la sib) do8(sib16-+ la)
    sol8[(mi16)] la sol4.-+ fa8
    fa2 r4

    %34
    R2.*3 \mbreak % reprise
    r8 mi la4. la8
    la4.(sib8) la8.(sib16)

    %39
    la4.(sol16-+) fa mi8 fa16 (re)
    dod4-+ r16 mi (fa sol) la8[(fad16)] sol
    fad2-+ r4

    %42
    R2.\mbreak
    r4 r sib8 la
    sol2-+ sol8 la

    %45
    mi2-+ r8 fa
    fa4.(mi16-+ re) re8[(dod16)] re
    dod2-+ r4

    %48
    r r r8 la'\mbreak
    la4.(sol8) sib4
    \appoggiatura re,8 dod2 r8 re

    %51
    re4(dod4.-+) re8
    re2 r8 mi
    mi2~mi16(re dod si)

    %54
    la32(si dod re mi fa mi fa) fad4.-+(mi16 fad)
    sol8 (la32 sol) fad(sol64 la) la4.-+(sol16 la)\mbreak
    \appoggiatura la8 sib4~sib16(la sol fa) mi4~

    %57
    mi8(re16-+ dod) dod4 r8 fa
    fa4(mi4.-+) re8
    re2 re2.

    %60
    R2.*13
    r4 r r8 la
    \appoggiatura la sib4~sib16 [do(sib do re8.)] sold,16

    %75
    \appoggiatura sold?8 la2 r8 mi'\mbreak
    \appoggiatura mi8 fa8.\(fad16 \appoggiatura fad8 sol4 \once\slurDown sold8.-+(fad32 sold)\)
    la4~la16[(sol fa mi re do si la)]

    %78
    sold'8. la16 si,4.-+ la8
    la2 r4
    R2.*3

    %83
    r8 mi' la4. la8
    la4.(sib8) la8.(sib16)
    la4.(sol16-+) fa mi8 fa16 (re)

    %86
    dod4-+ r16 mi (fa sol) la8[(fad16)] sol
    fad2-+ r4
    R2.\mbreak

    %89
    r4 r sib8 la
    sol2-+ sol8 la
    mi2-+ r8 fa

    %92
    fa4.(mi16-+ re) re8[(dod16)] re
    dod2-+ r4
    r r r8 la'\mbreak

    %95
    la4.(sol8) sib4
    \appoggiatura re,8 dod2 r8 re
    re4(dod4.-+) re8

    %98
    re2 r8 mi
    mi2~mi16(re dod si)
    la32(si dod re mi fa mi fa) fad4.-+(mi16 fad)

    %101
    sol8 (la32 sol) fad(sol64 la) la4.-+(sol16 la)\mbreak
    \appoggiatura la8 sib4~sib16(la sol fa) mi4~
    mi8(re16-+ dod) dod4 r8 fa

    %104
    fa4(mi4.-+) re8
    re2 re2.\fermata

}

IIvln = \relative do'' {

    r8 la
    \appoggiatura la sib2 si4
    do8. (si16) si4 dod8. re16
    dod4-+ \appoggiatura si8 la4 r8 la\dolce

    %4
    re,4. la'8 re[do]
    \appoggiatura do si4 r8 do si8.-+[la16]
    mi'4. mi8 fa(mi16-+ re)\mbreak

    %7
    do8(si16-+ la) sold4._+ la8
    mi'4 mi,2
    la2.

    %10
    R
    r4 r la
    sib8(la16_+ sol) fad4_+ \appoggiatura mi8 re4\mbreak

    %13
    sol2.~
    sol2 r8 fa
    \appoggiatura {fa16[sol]} la4 la,2

    %16
    re la'4
    la8.(sol16) sol4 fa
    mi4. re8 mi[fa]

    %19
    mi2_+ fa8 la\mbreak
    dod,2.
    r4 r8 re la'[la]

    %22
    sib2~sib8[(la16)] sib
    \appoggiatura sib?8 la2 r4
    r r do

    %25
    fa,2 mib4\mbreak
    mib?8.(re16) re4 r
    r sib do

    %28
    re2 sib4
    do8. fa16 do'4 do,
    fa2 r4\mbreak

    %31
    r fa'8. sol16 la8. la,16
    sib8. fa16 do'4 do,
    fa2 la4

    %34
    la8.(sol16) sol4 fa %% rip
    mi4. re8 mi[fa]
    mi2_+ fa8 la\mbreak

    %37
    dod,2._+
    r4 r8 re la'[la]
    sib2~sib8[(la16)] sib

    %40
    \appoggiatura sib?8 la2 r8 la
    re2 fad,4
    la4. la8 re[fad,]\mbreak

    %43
    sol2 r4
    r r sib8 la
    sol2 la4

    %46
    la2 r8 sol
    \appoggiatura fa mi2 r4
    r r la8 la\mbreak

    %49
    sib2 sol4
    \appoggiatura fa8 mi2 la4
    la2~la8 mi

    %52
    \appoggiatura mi fa2 r4
    la2 r4
    r r la

    %55
    sib8(la16_+ sol) fad4_+ \appoggiatura mi8 re4\mbreak
    mi2.~
    mi2 r8 fa

    %58
    \appoggiatura {fa16[sol]} la4 la,2
    re2 re2. %% fine rip
    la'2 r4

    %61
    mi2 r4
    dod2 r4\mbreak
    re2 re8 mi

    %64
    fa2 r4
    fad2 r4
    si,2 r4

    %67
    mi2.~
    mi4. re8 la'4
    sold2_+ r8 do,\mbreak

    %70
    re2 mi4
    fa2 fa8 re
    la'4 sold4._+ la8

    %73
    la2 r4
    re,2 r8 mi
    fa2 r8 dod'\mbreak

    %76
    re8.(red16 mi4) r8 mi
    fa2 r4
    si,8. la16 mi'4 mi,

    %79
    la2 la4
    la8.(sol16) sol4 fa %% rip
    mi4. re8 mi[fa]

    %82
    mi2_+ fa8 la\mbreak
    dod,2._+
    r4 r8 re la'[la]

    %85
    sib2~sib8[(la16)] sib
    \appoggiatura sib?8 la2 r8 la
    re2 fad,4

    %88
    la4. la8 re[fad,]\mbreak
    sol2 r4
    r r sib8 la

    %91
    sol2 la4
    la2 r8 sol
    \appoggiatura fa mi2 r4

    %94
    r r la8 la\mbreak
    sib2 sol4
    \appoggiatura fa8 mi2 la4

    %97
    la2~la8 mi
    \appoggiatura mi fa2 r4
    la2 r4

    %100
    r r la
    sib8(la16_+ sol) fad4_+ \appoggiatura mi8 re4\mbreak
    mi2.~

    %103
    mi2 r8 fa
    \appoggiatura {fa16[sol]} la4 la,2
    re2 re2.\fermata

}


IIvocen = \relative do'' {

    \autoBeamOff
    r4
    R2.*15
    r4 r r8 la
    \appoggiatura la sib2 si4

    %18
    do8.[(si16)] si4 dod8 re
    dod4-+ dod la8 la\mbreak
    mi'2 mi8 fa

    %21
    fa2 mi8 fa
    mi4(re8.-+[dod16)] dod8 re
    \appoggiatura re mi2 r4

    %24
    r r la,8 sib
    \appoggiatura sib do4 do8 do do do\mbreak
    fa,4 fa fa'8 mib

    %27
    re2 do8 sib
    la2-+ re4
    sol,8 la sol4._+ fa8

    %30
    fa2 r4\mbreak
    R2.*2
    r4 r r8 la

    %34
    \appoggiatura la sib2 si4 %% rip.
    do8.[(si16)] si4 dod8 re
    dod4-+ dod la8 la\mbreak

    %37
    mi'2 mi8 fa
    fa2 mi8 fa
    mi4(re8.-+[dod16)] dod8 re

    %40
    \appoggiatura re mi2 r4
    r r la,8 re
    \appoggiatura sol, fad4 fad8 fad sol la\mbreak

    %43
    \appoggiatura la sib4 \appoggiatura la8 sol4 sol'8 fa
    mi2-+ mi8 fa
    dod2-+ la4

    %46
    re4. fa,8 fa sol
    \appoggiatura sol8 la2 la8 la
    fa'2 fa8 fa\mbreak

    %49
    \afterGrace fa2(mi8) mi4
    la,2 r8 fa'
    fa4(mi4.-+) re8

    %52
    re2 r4
    R2.*6
    r2 R2.

    %60
    fa,4 r8 fa fa fa
    sib2 sib8 sib
    \appoggiatura fa mi2 mi8 la\mbreak

    %63
    la4. la8 si dod
    re2 mi8 fa
    si,2-+ si8 si

    %66
    sold2_+ mi'4
    la,2 la8 la
    \appoggiatura sol fa2 fa8 la

    %69
    mi2 mi8 do'\mbreak
    do4. \appoggiatura sib16 sib8 sib la16[sold]
    \appoggiatura sold?8 la2 re8 fa

    %72
    mi[(re16-+ do)] si4.-+ la8
    la2 r4
    R2.*5

    %79
    r4 r r8 la
    \appoggiatura la8 sib2 si4 %% rip.
    do8.[(si16)] si4 dod8 re

    %82
    dod4-+ dod la8 la\mbreak
    mi'2 mi8 fa
    fa2 mi8 fa

    %85
    mi4(re8.-+[dod16)] dod8 re
    \appoggiatura re mi2 r4
    r r la,8 re

    %88
    \appoggiatura sol, fad4 fad8 fad sol la\mbreak
    \appoggiatura la sib4 \appoggiatura la8 sol4 sol'8 fa
    mi2-+ mi8 fa

    %91
    dod2-+ la4
    re4. fa,8 fa sol
    \appoggiatura sol8 la2 la8 la

    %94
    fa'2 fa8 fa\mbreak
    \afterGrace fa2(mi8) mi4
    la,2 r8 fa'

    %97
    fa4(mi4.-+) re8
    re2 r4
    R2.*6

    %105
    r2 R2.

}

IItesto = \lyricmode {

    Souffrez, _ plaintive _ _ Philomele, _ _ _ que je mesle _ mes cris à vos tris -- tes accens, _
    Vostre _ peine _ la plus cru -- elle _ ne sçavroit _ égaler _ _ les
    maux que je res -- sens.

    Souffrez, _ plaintive _ _ Philomele, _ _ _ que je mesle _ mes cris à vos tris -- tes accens, _
    Vostre _ peine _ la plus cru -- elle _ ne sçavroit _ égaler _ _ les
    maux que je res -- sens, ne sçavroit _ éga - ler les
    maux que je res -- sens.

    Vous qui d'un destin _ deplorable _ _ _ sçavez  _ si vivement _ _ exprimes _ _ les rigueurs, _
    sen -- sible_à _ l'e -- nuy qui m'accable,  _ _  prê -- tés vos tons plaintfs _ a mes  vives _ douleurs. _

    Souffrez, _ plain -- tive _ Philo - mele, _ que je mesle _ mes cris à vos tris -- tes accens, _
    Vostre _ peine _ la plus cru -- elle _ ne sçavroit _ égaler _ _ les
    maux que je res -- sens, ne sça -- vroit éga - ler les
    maux que je res -- sens.

}


IIbcn = \relative do {

    r4
    R2.*15
    r4 r fad,
    sol2 sold4 %rip

    %18
    la2 sold4
    sol!2 r4\mbreak
    R2.*4

    %24
    r4 r fa'
    la,2 la4\mbreak
    sib2 r4

    %27
    R2.*6
    r4 r fad
    sol2 sold4

    %35
    la2 sold4
    sol!2 r4\mbreak
    R2.*4

    %41
    r4 r re'
    do4. do8 sib[la]\mbreak
    sol2 r4

    %44
    R2.
    r4 r fa'
    sib,2 r4

    %47
    la2 r4
    r r re8 re\mbreak
    sol2 r4

    %50
    sol,2 fa8 sol
    la4 la,2
    re r4

    %53
    R2.*6
    r2 R2.
    re'2 r4

    %61
    sol,2 r4
    la2 r4\mbreak
    fa2 fa'8 mi

    %64
    re2 r4
    red2 r4
    mi2 r4

    %67
    dod2 r4
    re2 r4
    re,2 r4\mbreak

    %70
    R2.
    r4 r si'
    do8 re mi4 mi,

    %73
    la2 r4
    R2.*5
    r4 r fad

    %80
    sol2 sold4 %rip
    la2 sold4
    sol!2 r4\mbreak

    %83
    R2.*4
    r4 r re'
    do4. do8 sib[la]\mbreak

    %89
    sol2 r4
    R2.
    r4 r fa'

    %92
    sib,2 r4
    la2 r4
    r r re8 re\mbreak

    %95
    sol2 r4
    sol,2 fa8 sol
    la4 la,2

    %98
    re r4
    R2.*6
    r2 R2.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2.*15
    s4 s <5/>
    <9 _-> <8> <7->
    <3> <2> <5/>
    <4+> s s\mbreak
    s2.*5
    <6>2 <5/>4
    <4> <3> s
    s2.*6
    s4 s <5/>
    <9 _-> <8> <7->
    <3> <2> <5/>
    <4+> s s
    s2.*4
    s4 s <_+>
    \bassFigureExtendersOn <4+>4. <4+>8 <6> <6\\>  \bassFigureExtendersOff
    <_->2 s4
    s2.
    s4 s <6>
    <7>2 <6>4
    <_+>2 s4
    s2.
    <_- 7 9>
    <4+>2 <6>8 <7>
    <4>4 <_+>2
    s2.*7
    s2 s2.
    s
    <6 5 _->
    <_+>
    <6>2 <4+>8 <6\\>
    s2.
    <5/>
    <_+>
    <6 5/>
    <9>4. <8>8 s4
    <4+>2.
    s
    s2 <6\\ 5/>4
    <6>8 <6 5> <4>4 <_+>
    s2.*6
    s4 s <5/>
    <9 _-> <8>  <7->
    <3> <2> <5/>
    <4+> s s
    s2.*4
    s4 s <_+>
    \bassFigureExtendersOn <4+>4. <4+>8 <6> <6\\>  \bassFigureExtendersOff
    <_->2 s4
    s2.
    s4 s <6>
    <7>2 <6>4
    <_+>2 s4
    s2.
    <_- 7 9>
    <4+>2 <6>8 <7>
    <4>4 <_+>2

}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key la\minor
    \tempo 4 = 55
    \repeat volta 2 {\partial 4 s4
    s2.*58}
    \alternative {{\set Score.measureLength = #(ly:make-moment 2 4) s2}{\set Score.measureLength = #(ly:make-moment 3 4) s2.}} \break
    \set Score.currentBarNumber = #60
    \repeat volta 2 {s2.*45}
    \alternative {{\set Score.measureLength = #(ly:make-moment 2 4) s2}{\set Score.measureLength = #(ly:make-moment 3 4) s2.}}
    \bar "|."

}



IIfl = {
	\global
	%\clef french
	\notypeset
	<<\IIfln \forma>>

}

IIvl = {
	\global
	%\clef french
	<<\IIvln \forma>>

}


IIvoce = {
	\new Voice = "souffrez"
	\global
	%\clef soprano
	<<\IIvocen \forma>>

}

IIbc = {
	\global
	\clef bass
	<<\IIbcn \forma \IIbfn>>
	\typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \override Score.RehearsalMark.X-offset = #3
    \override Score.RehearsalMark.Y-offset = #4

}


IIIvln = \relative do'' {

    R1
    R2.
    R1*26

    %29
    r4. r16 do
    do4 r8 re16. re32
    sol,16. do,32 mi16. sol32 do,16. sol'32 do16. sib32

    %32
    la16. fa32 la16. do32 mi,16. do'32 re,16. sib'32
    do,16. la'32 sib,16. sol'32 \stemUp la,8. \stemDown fa''32 mi64 re\stemNeutral \mbreak
    mi16. la32 sib,16. sol'32 la,16. fa'32 sol,16. mi'32

    %35
    fa,16. la32 re16. do64 si128 la si16. sol32 do16. mi32
    re16. sol,32 do16. mi32 re8.-+ do16
    do4 r16 r32 sol sol16. la32\mbreak

    %38
    sib16. fa32 do'16. fa,32 re'16. sib32 mi16. do32
    fa16. do32 sol'16. sib32 la16. do32 mi,16. do'32
    re,16. sib'32 do,16. la'32 sib,16. sol'32 la,16. fa'32

    %41
    sol,16. mi'32 fa16. la,32 sol8._+ fa16\mbreak
    fa16. fa32 sib,16. re32 do8 do
    fa16.\dolce do'32 la16. fa32 sib8. sol32 la64 sib

    %44
    do,16. do32 mi16. sol32 do,8. do32 re64 mi
    fa16. fa32 la16. do32 fa,8. fa32 sol64 la
    re,16. re'32 la16. re32 si16. re32 si16. sol32\mbreak

    %47
    do16. do,32 mi16. sol32 do16. do,32 sib16. la32
    sol8. sol'32 la64 sib fa16. re'32 mi,16. dod'32
    re,16. re32 fa16. la32 re16. la32 fad16. re32

    %50
    sol16. re'32 si16. sol32 la16. do32 fa,16. la32\mbreak
    sol16. do32 si16. do32 sol8 sol,
    do r16 sol''\fort sol4

    %53
    r16 r32 la32 fa16. re32 si16. re32 si16. sol32
    sol'16. sol32 la,16. fa'32 sol,16. mi'32 fa,16. re'32
    mi,16. si'32 mi16. mi,32 re8._+ do16\mbreak

    %56
    do16. la'32 sib,!16. sol'32 la,16. fa'32 sol,16. mi'32
    fa16.\dolce do'32 la16. fa32 sib8. sol32 la64 sib
    do,16. do32 mi16. sol32 do,8. do32 re64 mi

    %59
    fa16. fa32 la16. do32 fa,8. fa32 sol64 la
    re,16. re'32 la16. re32\mbreak si16. re32 si16. sol32
    do16. do,32 mi16. sol32 do16. do,32 sib16. la32

    %62
    sol8. sol'32 la64 sib fa16. re'32 mi,16. dod'32
    re,16. re32 fa16. la32 re,16. la'32 do,16. la'32\mbreak
    sib,16. sol'32 la,16. fa'32 sol,16. re'32 sib16. sol32

    %65
    do16. do'32 sol16. sib32 la16. fa32 la16. do32
    re,16. do'32 la16. do32 sol16. re32 sol16. sib32
    do,16. sib'32 sol16. sib32 mi,16. do32 fa16. la32\mbreak

    %68
    sib,16. la'32 fa16. la32 do,8 do
    fa4 r16 r32 sol\fort sol16. la32
    sib16. fa32 do'16. fa,32 re'16. sib32 mi16. do32

    %71
    fa16. do32 sol'16. sib32 la16. do32 mi,16. do'32
    re,16. sib'32 do,16. la'32 sib,16. sol'32 la,16. fa'32
    sol,16. mi'32 fa16. la,32 sol8._+ fa16

    %74
    fa16. fa32 sib,16. re32 do8 do
    fa r fad\dolce r %%% fine
    sol r sold r

    %77
    la4\mbreak r8 r16 re,
    mi8. mi32 mi64 mi fad16. re32 re16. re32
    sol16. sol,32 sib16. re32 sol16. re'32 re16. re32

    %80
    mi,16. sib'32 sib16. sib32 dod,16. mi32 dod16. la32
    re16. re32 re16. re32 fa8 re\mbreak
    la16. la'32 la16. si32 do16. do32 la16. do32

    %83
    fa,16. la32 la16. la32 si,16. re32 do16. re32
    mi16. mi32 sold16. si32 mi,8 mi
    la,8. do'32 si64 la si16. mi32 fa,16. re'32

    %86
    mi,16. do'32 re,16. si'32\mbreak do,16. mi32 la16. sol64 fad128 mi
    fad16. la32 re16. do64 si128 la sold16. mi32 la16. do32
    si16. mi,32 la16. do32 si8._+ la16

    %89
    la8 r fad\dolce r
    sol r\mbreak sold r
    la4 r8 r16 re,

    %92
    mi8. mi32 mi64 mi fad16. re32 re16. re32
    sol16. sol,32 sib16. re32  sol16. re'32 re16. re32
    mi,16. sib'32 sib16. sib32\mbreak dod,16. mi32 dod16. la32

    %95
    re16. re32 re16. re32 fa8 re
    la16. la'32 la16. si32 dod8. la32 si64 dod
    re8. do?32 sib?64 la sol16. fa32 mi16. re32\mbreak

    %98
    dod8. re32 dod64 si la8 la
    re8. fa'32 mi64 re mi16. la32 sib,16. sol'32
    la,16. fa'32 sol,16. mi'32 fa,16. la32 re16. do64 sib128 la

    %101
    sib16. la32 sol16. fa32 mi8._+ re16\mbreak
    re8. fa32 mi64 re mi16. do32 do'16. sib32
    la16.\dolce do32 la16. fa32 sib8. sol32 la64 sib

    %104
    do,16. do32 mi16. sol32 do,8. do32 re64 mi
    fa16. fa32 la16. do32 fa,8. fa32 sol64 la
    re,16. re'32 la16. re32 si16. re32 si16. sol32\mbreak

    %107
    do16. do,32 mi16. sol32 do16. do,32 sib16. la32
    sol8. sol'32 la64 sib fa16. re'32 mi,16. dod'32
    re,16. re32 fa16. la32 re16. la32 fad16. re32

    %110
    sol16. re'32 si16. sol32 la16. do32 fa,16. la32\mbreak
    sol16. do32 si16. do32 sol8 sol,
    do r16 sol''\fort sol4

    %113
    r16 r32 la32 fa16. re32 si16. re32 si16. sol32
    sol'16. sol32 la,16. fa'32 sol,16. mi'32 fa,16. re'32
    mi,16. si'32 mi16. mi,32 re8._+ do16\mbreak

    %116
    do16. la'32 sib,!16. sol'32 la,16. fa'32 sol,16. mi'32
    fa16.\dolce do'32 la16. fa32 sib8. sol32 la64 sib
    do,16. do32 mi16. sol32 do,8. do32 re64 mi

    %119
    fa16. fa32 la16. do32 fa,8. fa32 sol64 la
    re,16. re'32 la16. re32\mbreak si16. re32 si16. sol32
    do16. do,32 mi16. sol32 do16. do,32 sib16. la32

    %122
    sol8. sol'32 la64 sib fa16. re'32 mi,16. dod'32
    re,16. re32 fa16. la32 re,16. la'32 do,16. la'32\mbreak
    sib,16. sol'32 la,16. fa'32 sol,16. re'32 sib16. sol32

    %125
    do16. do'32 sol16. sib32 la16. fa32 la16. do32
    re,16. do'32 la16. do32 sol16. re32 sol16. sib32
    do,16. sib'32 sol16. sib32 mi,16. do32 fa16. la32\mbreak

    %128
    sib,16. la'32 fa16. la32 do,8 do
    fa4 r16 r32 sol\fort sol16. la32
    sib16. fa32 do'16. fa,32 re'16. sib32 mi16. do32

    %131
    fa16. do32 sol'16. sib32 la16. do32 mi,16. do'32
    re,16. sib'32 do,16. la'32 sib,16. sol'32 la,16. fa'32
    sol,16. mi'32 fa16. la,32 sol8._+ fa16

    %134
    fa16. fa32 sib,16. re32 do8 do
    fa2\fermata
    R2
    R2.*3
    R1
    R2.*2
    R1*3
    R2.*2
    R1*5
    R2.
    R1*7

}


IIIvocen = \relative do'' {

    \autoBeamOff

    r4 r8 do la8.-+ la16 la8 sib
    sol4-+ do8 re16 mib \appoggiatura do8 si do
    do4 do8 r r4 sol8 re16 sol\mbreak

    %4
    mi4_+ r r do'8 sol16 do
    la4-+ la8 r r4 r8 r16 do
    fa8. fa16 fa8 la, re4 mi8 fa\mbreak

    %7
    sol,4-+ sol8 la \appoggiatura sol fa4 r
    r r8 sol16 sol re'4 re8 r16 re
    sol,4. r16 sol re'8. re16 mib8. fa16\mbreak

    %10
    mib4-+ \appoggiatura re8 do r16 mib re8.-+ do16 sib8. lab16
    sol8-+ sol16 sol do8 do16 do fa,4 fa8 r
    sib sib16 mib re8.-+ mib16\mbreak \appoggiatura mib? fa4. re16 sib

    %13
    mib4. mib16 re \appoggiatura re8 mib4 r
    sol2 mib8. mib16 mib8. re16
    do8. sib16 la8. sol16\mbreak fad4_+ fad8 r16 la

    %16
    re4. sib8 \appoggiatura la sol8. sib16 sib8. do16
    \appoggiatura do8 re4 r8 sol re8. re16 sib8 sol\mbreak
    mib' do16 mib la,8-+ la16 re sol,8. sol16 r4

    %19
    r8 mib'^\markup\italic"animé" sol,8. mib16 sib'8 sol do8. re16\mbreak
    si4.-+ r16 re mib4 r8 r16 sol,
    do4 do8 re16 mib la,4-+ la8 r\mbreak

    %22
    re re16 re mib8 fa sib, sib16 mib do8-+ re16 mib
    re4-+ r r8 fa sib,8. sib16\mbreak
    fa8. sib16 lab32[(sol16.)] fa16[mib] re4.-+ r16 fa

    %25
    sib8. re16 fa4 r r8 r16 fa,
    lab4 lab8 lab16 sol\mbreak sol4 sol8 r
    mib' mib16 mib fa8 sol do, do16 fa re8-+ re16 mib

    %28
    \appoggiatura re8 do2 r
    R2*13
    r4 r8 r16 do

    %43
    do4 r8 re16 re
    sol,4-+ sol8. do16 %%% rip.
    la4-+ \appoggiatura sol8 fa r16 do'

    %46
    fa8 fa16 re sol8 sol16 sol\mbreak
    mi4-+ r8 sol,16 la
    sib8 la16 sol re'8. mi16

    %49
    \appoggiatura mi8 fa4 la,8 si16 do
    si8-+ sol' do,8. fa16\mbreak
    mi4(re8.-+[do16)]

    %52
    do4 r
    R2*3
    r4 r8 r16 do

    %57
    do4 r8 re16 re
    sol,4-+ sol8. do16
    la4-+ \appoggiatura sol8 fa r16 do'

    %60
    fa8 fa16 re sol8 sol16 sol
    mi4-+ r8 sol,16 la
    sib8 la16 sol re'8. mi16

    %63
    \appoggiatura mi8 fa4 la,8 sib16 do\mbreak
    re8 do sib16[la] sol[fa]
    mi8_+ mi do'8. do16

    %66
    \afterGrace do4.(sib8) sib
    sib4.. la16\mbreak
    la4(sol8._+[fa16)]

    %69
    fa4 r
    R2*5 %%%%% fine ripresa
    r8 la4 si16 do

    %76
    si8.-+ si16 mi8. mi16
    dod8.-+ la16\mbreak fa'4~
    fa8. mi16 re do sib la

    %79
    sib8 \appoggiatura la sol r sib16 re
    sol,4 sol8 la
    fa4._+(mi16) fa\mbreak

    %82
    mi8_+ mi mi'4~
    mi8. do16 re8 mi
    sold,4.-+ sold16 la

    %85
    la4 r
    R2*3
    r8 la4 si16 do

    %90
    si8.-+ si16 mi8. mi16
    dod8.-+ la16\mbreak fa'4~
    fa8. mi16 re do sib la

    %93
    sib8 \appoggiatura la sol r sib16 re
    sol,4 sol8 la
    fa4._+(mi16) fa\mbreak

    %96
    mi8_+ mi mi'4
    fa8. re16 sib8 sol\mbreak
    mi4._+ mi16 la

    %99
    re,4 r
    R2*3
    r4 r8 r16 do'

    %104
    do4 r8 re16 re
    sol,4-+ sol8. do16 %%% rip.
    la4-+ \appoggiatura sol8 fa r16 do'

    %107
    fa8 fa16 re sol8 sol16 sol\mbreak
    mi4-+ r8 sol,16 la
    sib8 la16 sol re'8. mi16

    %110
    \appoggiatura mi8 fa4 la,8 si16 do
    si8-+ sol' do,8. fa16\mbreak
    mi4(re8.-+[do16)]

    %113
    do4 r
    R2*3
    r4 r8 r16 do

    %118
    do4 r8 re16 re
    sol,4-+ sol8. do16
    la4-+ \appoggiatura sol8 fa r16 do'

    %121
    fa8 fa16 re sol8 sol16 sol
    mi4-+ r8 sol,16 la
    sib8 la16 sol re'8. mi16

    %124
    \appoggiatura mi8 fa4 la,8 sib16 do\mbreak
    re8 do sib16[la] sol[fa]
    mi8_+ mi do'8. do16

    %127
    \afterGrace do4.(sib8) sib
    sib4.. la16\mbreak
    la4(sol8._+[fa16)]

    %130
    fa4 r
    R2*4
    r4 r8 do'

    %136
    la4-+ r16 la la la
    re,4 la'8 la16 si! \appoggiatura si8 do re
    si!4-+ si8 r16 si do8. re16\mbreak

    %139
    sol,4. fa8 fa mi
    mi4_+ mi'8 mi16 re do8. sol16 la8 sib!
    la4.-+ do8 re mi\mbreak

    %142
    fa4 re8 mi16 fa si,8.-+ do16
    \appoggiatura do8 re4 re8 r r4 sol,8. sol16
    sol4 sol8 sol si4 r8 r16 re\mbreak

    %145
    si8.-+ si16 do8. re16 \appoggiatura re8 mi  mi16 sol mi8-+ mi16 mi
    \appoggiatura re8 do4 do8 re16 mi fa8. sol16\mbreak
    mi4-+ r do8. do16

    %148
    sold4-+ sold8 sold la4 si8. do16
    si8.-+[(la16)] si[(do re si)] mi8.[(re32-+ do)] si8.[(re16)](
    do4)sold8 la do4( si8.-+[la16)]\mbreak

    %151
    la4 r r la8. mi16
    \appoggiatura mi8 fa4 fa8 r r4 fa'8. fa16
    dod4-+ dod8 dod16 dod re8 mi

    %154
    la,4. la8\mbreak sib!8. sib16 do8 re
    fad,4_+ fad8. fad16 sol4 sol8. la16
    \appoggiatura la sib!4 \appoggiatura la8 sol r re'8. re16 mi8. fa16\mbreak

    %157
    sol4 sol8 mi dod4-+ dod8. la16
    mi'8. mi16 mi8. fa16 fa4. mi16 sol
    dod,2.-+ dod8 re

    %160
    re1

}

IIItesto = \lyricmode {

    Ainsy _ de son tourment _ il se plaignoit _ sans cesse. _
    Vain déses - poir! Vaine _ tristesse! _ _
    L'amour _ regnoit _ encor _ plus ar -- dent dans son cœur.
    Que deviens-je, _ _ dit' il, qu'elle_est _ mon espe - rance? _
    J'éprouve _ _ vainement _ _ le secours _ de l'absence, _ _
    une _ fatale _  j -- mage _ entre  -- tient mon ardeur! _ Ah!
    puisque _ rien ne peut finir _ ma peine, _ le jour pour moy n'a plus d'ap -- pas,
    du moins mourrons _ aux  yeux de l'ingratte _ _ Cli -- meine, _ affreux _
    dépit _ suivez _ mes pas! Allons: _ peut -- estre _ l'inhu - mai -- ne par de nouveaux _
    mé -- pris hâtera _ _ mon tre -- pas! Affreux _
    dé -- pit suivez _ mes pas; al -- lons: allons: _ peut -- estre _ l'inhu - mai -- ne par de nouveaux _
    mé -- pris hâtera _ _ mon tre -- pas!
    Amour, _ sur un cœur trop fi -- délle, _ si -- gnale _ tes traits  rigou - reux; ma Ber -- gere_a _ brisé _ ses nœuds
    et je ne puis changer _  comme -- el -- le.
    A -- mour, sur un cœur trop fi -- délle, _ si -- gnale _ tes traits  rigou - reux; ma Ber -- gere_a _ brisé _ ses nœuds
    et je ne puis changer _  comme -- el -- le, je ne puis changer _  comme -- el -- le.
    Ah! si mes maux te semblent _ doux, cru __ el, achȇve _ _ ton ouvrage; _ _ de ma mort pour der -- nier hom --
    mage _ viens repaistre _ en -- cor ton cour -- roux.
    Ah! si mes maux te semblent _ doux, cru __ el, achȇve _ _ ton ouvrage; _ _ de ma mort pour der -- nier hom --
    mage _ viens viens repaistre _ en -- cor ton cour -- roux.
    A -- mour,  sur un cœur trop fi -- délle, _ si -- gnale _ tes traits  rigou - reux; ma Ber -- gere_a _ brisé _ ses nœuds
    et je ne puis changer _  comme -- el -- le.
    A -- mour, sur un cœur trop fi -- délle, _ si -- gnale _ tes traits  rigou - reux; ma Ber -- gere_a _ brisé _ ses nœuds
    et je ne puis changer _  comme -- el -- le, je ne puis changer _  comme -- el -- le.
    Il dit, et pene - tré d'une _ douleur _ mortelle, _ _ il appro - choit de son Hameau; _ l'orsque _ sous un épais _ ormeau, _ il
    apper - çût une _ beauté _ nou -- velle. _ Il s'arréste _ _ surpris; _ ja -- mais le Dieu d'amour _ n'offrit _ rien de si beau
    dans ce charmant _ sé -- jour. Mille _ graces _ sembloient _ voltiger - - - - - autour _ d'el -- le:
    il sou -- pire, _ et le cœur d'un nouveau _ soin pres -- sé il gouste en se troublant _ une _ paix salu - taire: _
    et de sa vo -- lage _ Bergere _ _ le triste _ souvenir _ _ est bien tost effa - cé.

}


IIIbcn = \relative do {

    fa1
    mi4 mib re
    do4. r32 sol' fa64 mi re do si2

    %4
    do4. r32 do' sib64 la sol fa mi2
    fa4. r32 fa mi64 re do sib la2~
    la4. fa8 sib8. la16 sol8 fa

    %7
    do'4 do, fa8 fa'16 mib re8._+ do16
    \appoggiatura do8 si1~
    si?

    %10
    do2 re
    mib4 lab, sib2
    r4 r lab2

    %13
    sol8 mib sib'[sib,] mib'4. r32 fa  mib re
    do1~
    do2 re

    %16
    r4 r8 re mib2
    re8. mib32 re64 do sib2 r8 r32 sib do re
    do4  re8. mib32 re64 do si8. do32 si64 la sol8. fa32 mib64 re

    %19
    do4 r8 r16 do' sib4 lab
    sol8. re'32 mib64 fa sol8. la32 si64 sol do4. r32 do, do re
    mib16 fa mib re do re mib do fa8. do32 re64 mib fa8. sol32 fa64 mib

    %22
    re4. r32 re mi fa sol8[mib] fa fa,
    sib8. do32 re64 mib fa8. sol32 la64 fa sib4. r32 sib lab64 sol fa mib
    re4. mib8 sib8. fa'32 sol64 la sib4

    %25
    r r8 r32 sib, sib do re4. r32 mib re do
    sib16 lab sib do re do re sib mib8. re32 mib64 fa sol8. fa32 mib64 re
    do4. r32 mib fa sol lab8[fa] sol sol,

    %28
    do2. \parenthesize r8 r32 sib la sol
    fa4._\markup\italic "Fort et piqué" r16  fa'
    fa16. do'32 la16. fa32 sib,8. sol32 la64 sib

    %31
    do16. do32 mi16. sol32 do,8. do32 re64 mi
    fa,16. fa'32 la16. do32 mi,16. mi32 re16. re32
    do16. do32 sib16. sib32 la16. do32 la16. fa32

    %34
    do'16. do32 sib16. sib32 la16. la32 sol16. sol32
    fa16. la'32 fa16. re32 sol16. sol32 mi16. do32
    fa16. fa,32 mi16. fa32 sol8 sol

    %37
    do,8. do'32 do64 re mib16.[mib32] mib,16. mib'32
    re16. re32 do16. do32 sib8. sib'32 do64 sib
    la16. la32 sol16. sol32 fa16. fa32 mi16. mi32

    %40
    re16. re32 do16. do32 sib16. sib32 la16. la32
    sol16.[sib64 la128 sol fa16. la32] do8 do,\mbreak
    fa16. fa32 sib,16. re32 do8 do

    %43
    fa16. do'32 la16. fa32 sib8. sol32 la64 sib
    do16. do32 mi16. sol32 do,8. do32 re64 mi %44 Reprise
    fa,16. fa'32 la16. do32 fa,8. fa32 sol64 la

    %46
    re,16. re'32 la16. re32 si16. re32 si16. sol32\mbreak
    do16. do,32 mi16. sol32 do16. do,32 sib16. la32
    sol8. sol'32 la64 sib fa16. fa32 mi16. mi32

    %49
    re16. re32 fa16. la32 re16. la32 fad16. re32
    sol16. re'32 si16. sol32 la16. do32 fa,16. la32\mbreak
    sol16. do32 si16. do32 sol8 sol,

    %52
    \senza do16. do32 mi16. sol32 do,8. \tuplet 5/2{re32 do sib la sol}
    fa8 r32 re' mi fa sol8 r32 fa sol la
    sib!16. sib32 la16. la32  sol16. sol32 fa16. fa32

    %55
    mi16.[fa64 mi128 re do16. mi32] sol8 sol,\mbreak
    do16. do32 sib!16. sib32 la16. la32 sol16. sol32
    fa16. do'32 la16. fa32 sib8. sol32 la64 sib

    %58
    do16. do32 mi16. sol32 do,8. do32 re64 mi
    fa,16. fa'32 la16. do32 fa,8. fa32 sol64 la
    re,16. re'32 la16. re32\mbreak si16. re32 si16. sol32

    %61
    do16. do,32 mi16. sol32 do16. do,32 sib16. la32
    sol8. sol'32 la64 sib fa16. fa32 mi16. mi32
    re16. re32 fa16. la32 re,16. re32 do16. do32\mbreak

    %64
    sib16. sib32 la16. la32 sol16. re'32 sib16. sol32
    do16. do'32 sol16. sib32 la16. fa32 la16. do32
    re,16. do'32 la16. do32 sol16. re32 sol16. sib32

    %67
    do,16. sib'32 sol16. sib32 mi,16. do32 fa16. la32\mbreak
    sib,16. la'32 fa16. la32 do,8 do,
    fa8. do'32 do64 re mib16. [mib32] mib,16. mib'32

    %70
    re16. re32 do16. do32 sib8. sib'32 do64 sib
    la16. la32 sol16. sol32 fa16. fa32 mi16. mi32
    re16. re32 do16. do32 sib16. sib32 la16. la32\mbreak

    %73
    sol16. sib64 la128 sol fa16. la32 do8 do,
    fa16. fa32 sib,16. re32 do8 do
    fa8 r fad r  % fine ripresa

    %76
    sol r sold r
    la4\mbreak r8 r16 re
    mi8. mi32 mi64 mi fad16. re32 re16. re32

    %79
    sol16. sol,32 sib16. re32 sol16. re'32 re16. re32
    mi,16. sib'32 sib16. sib32 dod,16. mi32 dod16. la32
    re16. re,32 re16. re32 fa8 re\mbreak %%% fine pagina 17

    %82
    la'16. la'32 la16. si32 do16. do32 la16. do32
    fa,16. la32 la16. la32 si,16. re32 do16. re32
    mi16. mi32 sold16. si32 mi,8 mi,

    %85
    la16. la'32 la16. la32 sol16. sol32 fa16. fa32
    mi16. mi32 re16. re32\mbreak do16. mi32 do16. la32
    re16. re32 si16. si32 mi16. mi32 do16. la32

    %88
    re,16. re'32 do16. re32 mi8 mi,
    la r fad r
    sol r\mbreak sold r

    %91
    la4 r8 r16 re
    mi8. mi32 mi64 mi fad16. re32 re16. re32
    sol16. sol,32 sib16. re32  sol16. re'32 re16. re32

    %94
    mi,16. sib'32 sib16. sib32\mbreak dod,16. mi32 dod16. la32
    re16. re,32 re16. re32 fa8 re
    la'16. la'32 la16. si32 dod8. la32 si64 dod

    %97
    re8. do?32 sib?64 la sol16. fa32 mi16. re32\mbreak
    dod8. re32 dod64 si la16. sib32 la16. sol32
    fa16. re32 re'16. re32 do16. do32 sib16. sib32

    %100
    la16. la32 sol16. sol32 fa16. la32 fa16. re32
    sol16. la32 sib16. sol32 la8 la\mbreak
    re8. fa32 mi64 re mi16. sol32 mi16. do32

    %103
    fa16. do'32 la16. fa32 sib,8. sol32 la64 sib
    do16. do32 mi16. sol32 do,8. do32 re64 mi
    fa,16. fa'32 la16. do32 fa,8. fa32 sol64 la

    %106
    re,16. re'32 la16. re32 si16. re32 si16. sol32\mbreak
    do16. do,32 mi16. sol32 do16. do,32 sib16. la32
    sol8. sol'32 la64 sib fa16. fa32 mi16. mi32

    %109
    re16. re32 fa16. la32 re16. la32 fad16. re32
    sol16. re'32 si16. sol32 la16. do32 fa,16. la32\mbreak
    sol16. do32 si16. do32 sol8 sol,

    %112
    \senza do16. do32 mi16. sol32 do,8. \tuplet 5/2{re32 do sib la sol}
    fa8 r32 re' mi fa sol8 r32 fa sol la
    sib!16. sib32 la16. la32  sol16. sol32 fa16. fa32

    %115
    mi16.[fa64 mi128 re do16. mi32] sol8 sol,\mbreak
    do16. do32 sib!16. sib32 la16. la32 sol16. sol32
    fa16. do'32 la16. fa32 sib8. sol32 la64 sib

    %118
    do16. do32 mi16. sol32 do,8. do32 re64 mi
    fa,16. fa'32 la16. do32 fa,8. fa32 sol64 la
    re,16. re'32 la16. re32\mbreak si16. re32 si16. sol32

    %121
    do16. do,32 mi16. sol32 do16. do,32 sib16. la32
    sol8. sol'32 la64 sib fa16. fa32 mi16. mi32
    re16. re32 fa16. la32 re,16. re32 do16. do32\mbreak

    %124
    sib16. sib32 la16. la32 sol16. re'32 sib16. sol32
    do16. do'32 sol16. sib32 la16. fa32 la16. do32
    re,16. do'32 la16. do32 sol16. re32 sol16. sib32

    %127
    do,16. sib'32 sol16. sib32 mi,16. do32 fa16. la32\mbreak
    sib,16. la'32 fa16. la32 do,8 do,
    fa8. do'32 do64 re mib16. [mib32] mib,16. mib'32

    %130
    re16. re32 do16. do32 sib8. sib'32 do64 sib
    la16. la32 sol16. sol32 fa16. fa32 mi16. mi32
    re16. re32 do16. do32 sib16. sib32 la16. la32\mbreak

    %133
    sol16. sib64 la128 sol fa16. la32 do8 do,
    fa16. fa32 sib,16. re32 do8 do
    fa2\fermata

    %136
    fad2~
    fad2.
    sol\mbreak

    %139
    si
    do2 mi,
    fa fa'8 mi\mbreak

    %142
    re2 sol8 do,
    sol2 si~
    si1~\mbreak

    %145
    si2 do4 do'
    la~la16 sol fa mi re8 sol\mbreak
    do,2.

    %148
    si2 la
    sold~sold
    la4 mi'8 re mi4 mi,\mbreak

    %151
    la la8 si dod2
    re r4 re
    mi2 r4

    %154
    fa fad\mbreak sol2
    do, sib!4. la8
    sol2 sol'4. fa8\mbreak

    %157
    mi2 la
    sib! fa4. sol8
    la2 la,

    %160
    re1

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6>4 <6> <6\\>
    \bassFigureExtendersOn <3!>4. <3!>16 <3!> <5/>2
    s4. <_>16 <_> <5/>2
    s4. <_>16 <_> <6>2
    <6> s4 <6>
    <4> <3> <_>8 <_> <6\\>8. <6\\>16
    <6 5/>2 s
    <5/>1
    <_->2 <5/>
    s4 <6 5> s2
    s <2  4+>
    <6->4 <4>8 <3> s2
    <_->1
    <6 5>2 <_+>
    s4 s8 <6 _+> <7>4 <6>
    <_+>8. <_+>32 <_+>64 <_+> <6>2 <6>8 <6>16 <6>32 s
    <6 5 _->4 <_+>8. <_+>32 <_+>64 <_+> <6>4 <_+>8. <_+>32 <_+>64 <_+>
    <_->4 s <6>8 s <6> s
    <_+>4 <_+>8. <_+>32 <_+>64 <_+> <_->2
    <6>4 <6>8 <6> <_>4  <_>8 <_>
    <6>4. <6>16 <6> <6->8 <6 5> <4> <3>
    s1
    <5/>
    s2 <6>
    <7->4 <5/> s <_+>8. <_+>32 <_+>64 <_+>
    <_->4. <_->16 <_-> <6> s <6 5>8 <4> <_+>16 s
    <_+>2. <_+>8 <_+>16 <_+>
    s2
    <_>8 <_> <9 7>8 <8_ 6>16 <_>32 <_>64 <_>
    <7>4 <7>8 <7>
    <_>8 <_> <6>16 s <6> s
    <6>16 s <6> s <6>8. <6>16
    s16. <6>64 s <6>16 s <6> s <6> s
    <_>16 <_>32 s <6 _ 5>16 <_> <_+>8 <6>
    <4+> <6> <4>  <_+>
    s4 <5>8 <5>16. <4+>32
    <6>16 s <6> s <3>8 <4+>16 <4+>
    <6>16 s <6> s s8 <6>16 s
    <6>16 s <6> s <6>16 s <6> s  %%%%% ripresa
    <6>16. <6>32 <3>16. <3>32 <4>8 <3>
    s8 <6 _ 4>16. <_>32 <4>8 <3>
    s4 <9 7>8 <8 _ 6>16 <_>32 <_>64 <_>
    <7>4 <7>8 <7>
    <_>4 <_>8 <_>16 s
    <_>8 <_> <5/> <5/>
    <_>8  <_> <_> <6>16. <6\\>32
    <_>8. <_>16 <6>8 <6\\>
    <_>8 <_> <_> <5/>16. <5/>32
    <_+>8 <_+> <6>16. <6>64 s <6 _ 5>16. <_>64 s
    <6 _ 4>8 <_>
    <4> <_+>
    <_>4 <_>8 <_>
    <9 7>16 <8 _ 6>16 <_> <_> <_+>8 <_+>16 <_+>
    <6> s <6> s <6> s <6> s
    <6>8 <6>16 <6> <4>8 <_+>  %% fine p. 15 bar 55
    s16. <6>64 s <6>16 s <6> s <6> s
    <_>8 <_> <9 7>8 <8_ 6>16 <_>32 <_>64 <_>
    <7>4 <7>8 <7>
    <_>4 <_>8 <_>16 s
    <_>8 <_> <5/> <5/>
    <_>8  <_> <_> <6>16. <6\\>32
    <_>8. <_>16 <6>8 <6\\>
    <_>8 <_>16 <_> s8 <6 4 3->
    s16. <6>64 s <6>8 <7> <7>16 <7>
    <_>8 <_>16 <_> <6>8 <6>16 <6>
    <7>8 <7>16 <7> <4>16. <4>32 <3>16. <3>32
    <7>8 <7>16 <7> <5/>16. <5/>32 <3>16. <3>32
    <7>8 <7>16 <7> <4>8 <3>
    <_>8 <_>16 <_> <5>16. <5>32 <5>16. <4+>32
    <6>16 s <6 _->8 <3> <4+>16 <4+>32 <4+>64 <4+>
    <6>8 <6\\> s <6>16 s
    <6>16 s <6>16 s <6>16 s <6>16 s
    <6>16 <6>32 <6>64 <6> <3>16. <3>32 <4>8 <3>
    s8 <6 5>16. <5>32 <4>8 <3>  %%%%%%% fine ripresa
    s4 <5/>
    <_+> <5/>
    <_+> s
    <9 7>8 <8 _ 6>16 <_>32 <_>64 <_> <5/>8 <5/>16 <5/>
    <_>4 <_>8 <_>16 <_>32 s
    <6\\ _ 5/>8 <_>8 <5/>8 <5/>
    s4 <6>8 <6\\ 5>
    <3-> <3-> <6> <6>
    <7> <7> <6\\ _ 5/>16. <_>32 <6>16. <6>32
    <_+>8 <_+>16 s <7 _+>8 <7>
    s4 <6 3+>16 s <3 4+ 6> s
    <4 6>8 <4+> <6>8 <6>
    <6\\ 5 3+>8 <3+> <_+> <6>
    <4+>16. <4+>32 <6>16. <6>32 <4>8 <_+>16 s
    <_+>4 <5/>
    <_+> <5/>
    <_+> s
    <9 7>8 <8 _ 6>16 <_>32 <_>64 <_> <5/>8 <5/>16 <5/>
    <_>4 <_>8 <_>16 <_>
    <6\\ 5>8 <6\\>16 <6\\> <5/>8 <5/>16 <5/>
    s4 <6>8 <6\\ 5/>
     <_+>8 <_+>16 s <5>8 <5>16 <5>
     <_>8 <_>16 <_>32 s <6 _ 5>8 <_>16 <_>
     <5/>8 <5/>16 <5/> <7 _ _+>8 <_>16 <_>
     <6>8 s <6>16 s <6 4+ 3> s
     <4 6> s <4+ 6> s <6>8 <6>16 <6>32 s
     <6 _ 5>8 <_>16 <_> <4>8 <_+>
     <_>8 <_>16 <_> <5/>8 <5/>16 <5/>
     <_>8 <_>16 <_> <9 7>8 <8 _ 6>16 <_>32 <_>64 <_>

     <7>4 <7>8 <7>
    <_>4 <_>8 <_>16 s
    <_>8 <_> <5/> <5/>
    <_>8  <_> <_> <6>16. <6\\>32
    <_>8. <_>16 <6>8 <6\\>
    <_>8 <_> <_> <5/>16. <5/>32
    <_+>8 <_+> <6>16. <6>64 s <6 _ 5>16. <_>64 s
    <6 _ 4>8 <_>
    <4> <_+>
    <_>4 <_>8 <_>
    <9 7>16 <8 _ 6>16 <_> <_> <_+>8 <_+>16 <_+>
    <6> s <6> s <6> s <6> s
    <6>8 <6>16 <6> <4>8 <_+>  %% fine p. 15 bar 55
    s16. <6>64 s <6>16 s <6> s <6> s
    <_>8 <_> <9 7>8 <8_ 6>16 <_>32 <_>64 <_>
    <7>4 <7>8 <7>
    <_>4 <_>8 <_>16 s
    <_>8 <_> <5/> <5/>
    <_>8  <_> <_> <6>16. <6\\>32
    <_>8. <_>16 <6>8 <6\\>
    <_>8 <_>16 <_> s8 <6 4 3->
    s16. <6>64 s <6>8 <7> <7>16 <7>
    <_>8 <_>16 <_> <6>8 <6>16 <6>
    <7>8 <7>16 <7> <4>16. <4>32 <3>16. <3>32
    <7>8 <7>16 <7> <5/>16. <5/>32 <3>16. <3>32
    <7>8 <7>16 <7> <4>8 <3>
    <_>8 <_>16 <_> <5>16. <5>32 <5>16. <4+>32
    <6>16 s <6 _->8 <3> <4+>16 <4+>32 <4+>64 <4+>
    <6>8 <6\\> s <6>16 s
    <6>16 s <6>16 s <6>16 s <6>16 s
    <6>16 <6>32 <6>64 <6> <3>16. <3>32 <4>8 <3>
    s8 <6 5>16. <5>32 <4>8 <3>

    s2
    <5/>4 s
    <5/>2.
    <_+>
    <5/>
    s2 <5/>
    s <6 4+>8 <6\\>
    s2.
    s2 <6>
    <6>1
    <5/>2 s
    s4 <_>16 <_> <4+> <6> <7> s <7>8
    s2.
    <6\\>1 <5/>
    s4 <_+>8 <6 5>16 s <6 4>4 <_+>8 s
    <_+>4 <_+>8 <_+> <5/>2
    s1
    <6\\>2.
    <6>4 <5/> <_->2
    <4+> <6>4. <6\\>8
    <_->2 <_->4. <_->8
    <7 5/>2 <_+>
    <4+ 2+> <6>4 s8 <_- 5 6>8
    <7 _+>2 <_+>4 s
    <_+>1

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 60
    s1
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    s2.
    \time 4/4
    s1*26\break
    \mark\markup\left-align{[4.] Air \italic\smaller "Vivement et piqué"}
    \time 2/4
    s2
    \tempo 4 = 70
    s2*105\break
    \mark\markup\left-align{[5.] Recitatif}
    \tempo 4 = 60
    \key do\major
    s2*2
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    s2.*3
    \time 4/4
    s1
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    s2.*2
    \time 4/4
    \appoggiatura s8 s1*3
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \appoggiatura s8 s2.*2
    \time 4/4
    s1*5
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    s2.
    \time 4/4
    s1*5
    \time 2/2
    s1*2

    \bar "|."

}

IIIvl = {
    \global
    \notypeset
    %\clef french
    <<\IIIvln \forma>>

}

IIIvoce = {
    \new Voice = "ainsy"
    \global
    %\clef soprano
    <<\IIIvocen \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IVvln = \relative do'' {

    re4
    dod2-+ \appoggiatura si8 la4
    r re fad
    mi4.-+ re8 mi4

    %4
    fad \appoggiatura mi8 re8. la'16 \tuplet 3/2 { la8(si la)}
    si,8. do16 si8. la16 sol8. fad16
    mi4. r16 sol' \tuplet 3/2 { sol8(la sol) }

    %7
    la,8.[si16 la8. sol16 fad8._+ mi16]
    re4. r16 re' la8. la16\mbreak
    \tuplet 3/2 { si8(do la) si[(dod re)] dod(si-+ la)

    %10
    mi'(la, mi') fad[(sol la)] sol(la, sol')
    fad(mi-+ re)} dod4.-+ re8
    re2 r4

    %13
    r r8 r16 la\dolce la8. la16\mbreak % fine 1mo sistema p 22
    \tuplet 3/2 { si8(la sol) fad[(mi fad)] re(mi fad)
    sol(fad mi) la[(si dod)] la(si dod)}

    %16
    re4 re,8. re'16 \tuplet 3/2 { re8(mi re) }
    dod8. la16 la8. dod16 \tuplet 3/2 { dod8(re dod) }\mbreak
    si8. la16 \tuplet 3/2 { sold8(fad mi) } la8. re,16

    %19
    la4. r16 la''\fort \tuplet 3/2 { la8(si la) }
    si,8. do16 si8. la16 sol8. fad16
    mi4. r16 sol' \tuplet 3/2 { sol8(la sol) }\mbreak

    %22
    la,8.[si16 la8. sol16 fad8._+ mi16]
    re2 r4
    r r8 r16 la'\dolce la8. la16

    %25
    \tuplet 3/2 { si8(la sol) fad[(mi fad)] re(mi fad)
    sol(fad mi) la[(si dod)] la(si dod)} \mbreak %%%%%%%5 ripresa
    re4 re,8. re'16 \tuplet 3/2 { re8(mi re) }

    %28
    dod8. la16 la8. dod16 \tuplet 3/2 { dod8(re dod) }\mbreak
    si8. la16 \tuplet 3/2 { sold8(fad mi) } la8. re,16
    la4. r16 mi'' \tuplet 3/2 { mi8(fad mi) }

    %31
    re8.[dod16 si8. la16 sold8._+ fad16]\mbreak
    mi4. r16 mi' \tuplet 3/2 { red8-+(dod red) }
    mi4. r16 si \tuplet 3/2 { si8(la_+ sold)

    %34
    la(mi la) si[(mi, mi')] mi(fa re)
    mi(re-+ do)} si4.-+ la8\mbreak
    la4. r16 la'\fort \tuplet 3/2 { la8(si la) }

    %37
    si,8.[do16 re8. mi16 fa8. sol16]
    mi4.-+ r16 do' \tuplet 3/2 { do8(si do)
    re,(mi fa)} mi8. re16 do8.-+ si16\mbreak

    %40
    do4. r16 mi \tuplet 3/2 { la8(sol-+ fad!)
    sold(mi la)} do,4(si8.-+) la16
    la8. si16 la8. sol16 fad8._+ mi16

    %43
    re4. r16 re\dolce re8. re16
    \tuplet 3/2 { fad8(mi re) } sol8. mi16 mi8. mi16\mbreak
    \tuplet 3/2 { sol8(fad mi) } la8. la16 la8. la16

    %46
    \tuplet 3/2 { re8(mi dod) } re8. dod16 si8. la16
    \tuplet 3/2 { sol8(fad mi) } la4 la
    re,4. r16 la'' \tuplet 3/2 { la8(si la) }\mbreak %%% fine p. 24

    %49
    si,8. do16 \tuplet 3/2 { si8(dod! re) dod[(re mi)] }
    la,4 la (sold8.-+) la16
    la2 r8 dod

    %52
    dod2.
    r8 r16 la' \tuplet 3/2 { la8(si la) la[(sol-+ fad)]
    mi(la,) re } dod4.-+ re8

    %55
    re2 re4\fort
    dod2-+ \appoggiatura si8 la4
    r re fad

    %58
    mi4.-+ re8 mi4
    fad \appoggiatura mi8 re8. la'16 \tuplet 3/2 { la8(si la) }\mbreak
    si,8. do16 si8. la16 sol8. fad16

    %61
    mi4. r16 sol' \tuplet 3/2 { sol8(la sol) }\mbreak
    la,8.[si16 la8. sol16 fad8._+ mi16]
    re4. r16 re' la8. la16

    %64
    \tuplet 3/2 { si8(do la)  si8[(dod! re)] dod[(si-+ la)]
    mi'(la, mi') fad[(sol la)] sol(la, sol')
    fad(mi-+ re)} dod4.-+ re8

    %67
    re2 r8 r16 si %%% fine ripresa
    si4 lad8._+ si16 dod8. re16
    sol,8. fad16 mi8. fad16 sol8. mi16\mbreak

    %70
    fad4. r16 red' mi8. red16
    dod8. lad16 si4 si,
    fad'4. r16 fad'\fort \tuplet 3/2 { fad8(sol fad)

    %73
    si,(dod re)} mi8. re16 dod8. si16
    lad4.-+ r16 mi' \tuplet 3/2 { mi8(fad sol)\mbreak }
    sol8. lad,16 lad8. lad16 si8. dod16

    %76
    re4 \appoggiatura dod8 si4. r16 si
    si4 lad8._+ si16 dod8. re16
    sol,8. fad16 mi8. fad16 sol8. mi16

    %79
    fad4. r16 red' mi8. red16  \mbreak
    dod8. lad16 si4 si,
    fad'2 r4

    %82
    R2.*2\mbreak
    r4 r la8.\dolce si16
    dod8. re16 \tuplet 3/2 { dod8(si dod) la[(si dod)]

    %86
    si(dod re)} dod4 dod
    fad, fad8.\fort sold16 lad8. si16
    dod2 r4\mbreak

    %89
    R2.
    r4 r  si8.\dolce dod16
    re8. mi16 \tuplet 3/2 { re8(dod si) } lad8.-+ fad16

    %92
    si8. mi,16 fad4 fad\mbreak
    si,4 r r
    R2.

    %95
    r4 r si'8.\dolce dod16
    re8. mi16 \tuplet 3/2 { re8(dod si) } lad8._+ fad16
    si8. mi,16 fad4 fad\mbreak

    %98
    si,2 re'4\fort
    dod2-+ \appoggiatura si8 la4
    r re fad

    %101
    mi4.-+ re8 mi4
    fad \appoggiatura mi8 re4 r
    r r8 r16 la\dolce la8. la16

    %104
    \tuplet 3/2 { si8(la sol) fad[(mi fad)] re(mi fad)
    sol(fad mi) la[(si dod)] la(si dod)} \mbreak %%%%%%%5 ripresa
    re4 re,8. re'16 \tuplet 3/2 { re8(mi re) }

    %107
    dod8. la16 la8. dod16 \tuplet 3/2 { dod8(re dod) }\mbreak
    si8. la16 \tuplet 3/2 { sold8(fad mi) } la8. re,16
    la4. r16 mi'' \tuplet 3/2 { mi8(fad mi) }

    %110
    re8.[dod16 si8. la16 sold8._+ fad16]\mbreak
    mi4. r16 mi' \tuplet 3/2 { red8-+(dod red) }
    mi4. r16 si \tuplet 3/2 { si8(la_+ sold)

    %113
    la(mi la) si[(mi, mi')] mi(fa re)
    mi(re-+ do)} si4.-+ la8\mbreak
    la4. r16 la'\fort \tuplet 3/2 { la8(si la) }

    %116
    si,8.[do16 re8. mi16 fa8. sol16]
    mi4.-+ r16 do' \tuplet 3/2 { do8(si do)
    re,(mi fa)} mi8. re16 do8.-+ si16\mbreak

    %119
    do4. r16 mi \tuplet 3/2 { la8(sol-+ fad!)
    sold(mi la)} do,4(si8.-+) la16
    la8. si16 la8. sol16 fad8._+ mi16

    %122
    re4. r16 re\dolce re8. re16
    \tuplet 3/2 { fad8(mi re) } sol8. mi16 mi8. mi16\mbreak
    \tuplet 3/2 { sol8(fad mi) } la8. la16 la8. la16

    %125
    \tuplet 3/2 { re8(mi dod) } re8. dod16 si8. la16
    \tuplet 3/2 { sol8(fad mi) } la4 la
    re,4. r16 la'' \tuplet 3/2 { la8(si la) }\mbreak %%% fine p. 24

    %128
    si,8. do16 \tuplet 3/2 { si8(dod! re) dod[(re mi)] }
    la,4 la (sold8.-+) la16
    la2 r8 dod

    %131
    dod2.
    r8 r16 la' \tuplet 3/2 { la8(si la) la[(sol-+ fad)]
    mi(la,) re } dod4.-+ re8

    %134
    re2 re4\fort
    dod2-+ \appoggiatura si8 la4
    r re fad

    %137
    mi4.-+ re8 mi4
    fad \appoggiatura mi8 re8. la'16 \tuplet 3/2 { la8(si la) }\mbreak
    si,8. do16 si8. la16 sol8. fad16

    %140
    mi4. r16 sol' \tuplet 3/2 { sol8(la sol) }\mbreak
    la,8.[si16 la8. sol16 fad8._+ mi16]
    re4. r16 re' la8. la16

    %143
    \tuplet 3/2 { si8(do la)  si8[(dod! re)] dod[(si-+ la)]
    mi'(la, mi') fad[(sol la)] sol(la, sol')
    fad(mi-+ re)} dod4.-+ re8

    %146
    re2\fermata r4

}


IVvocen = \relative do'' {

    \autoBeamOff
    r4
    R2.*11
    r4 r re
    dod2-+ \appoggiatura si8 la4

    %14
    r re fad
    mi4.-+(re8) mi4
    fad\appoggiatura mi8 re4 fad8 sol

    %17
    mi2-+ la,4\mbreak
    re2 dod8 re
    \appoggiatura re mi2 r4

    %20
    R2.*3
    r4 r re
    dod2-+ \appoggiatura si8 la4

    %25
    r re fad
    mi4.-+(re8) mi4 \mbreak %%%%%%%%% ripresa
    fad\appoggiatura mi8 re4 fad8 sol

    %28
    mi2-+ la,4
    re2 dod8 re
    \appoggiatura re mi2 r8 la,

    %31
    si4. dod8 re4\mbreak
    dod4 si4.-+ la8
    sold2_+ \appoggiatura fad8 mi mi'

    %34
    mi4. si8 do4
    \appoggiatura si8 la4 sold4.-+ la8\mbreak
    la2 r4

    %37
    R2.*5
    r4 r r8 la
    fad4._+ sol8 la4

    %44
    re si4.-+ si8\mbreak
    mi2 dod8-+ mi
    \appoggiatura mi fad4. mi8 re4

    %47
    dod16[(si8 dod16)] dod4.-+ re8
    re2 r8 fad\mbreak
    fad4. mi8 sol4

    %50
    fad mi4.-+ re8
    dod2-+ dod8 la
    mi'2.~

    %53
    mi4. dod8 re4~\mbreak
    re8 mi mi4.-+ re8
    re2 r4

    %56
    R2.*11
    r4 r r8 si %%%%%% fine ripresa
    dod4.-+ re8 mi fad

    %69
    mi-+ re \tuplet 3/2 { dod8[(re dod)] }  si[(dod)](
    lad4-+) \appoggiatura sold8 fad fad' sol fad
    mi fad re4-+(dod8) re

    %72
    dod2-+ r4
    R2.*3
    r4 r r8 si

    %77
    dod4. -+ re8 mi fad
    mi-+ re  \tuplet 3/2 { dod8[(re dod)] }  si[(dod)](
    lad4-+) \appoggiatura sold8 fad fad' sol fad

    %80
    mi fad re4-+(dod8) re
    dod2-+ r4
    r fad8 mi re dod

    %83
    re2 si8 si\mbreak
    sold4_+ sold dod8 fad
    mid2-+ dod4

    %86
    red8 [(mid16 fad)] mid4.-+ fad8
    fad2 r4
    r fad,8 sold lad si\mbreak

    %89
    dod2 re8 si
    mi4 \appoggiatura re8 dod r re mi
    \appoggiatura mi8 fad2 dod4

    %92
    re8[(dod16-+ si)] lad4.-+ si8\mbreak
    si4 fad8 sold lad si
    dod2 re8 si

    %95
    mi4 \appoggiatura re8 dod r re mi
    \appoggiatura mi8 fad2 dod4
    re8[(dod16-+ si)] lad4.-+ si8

    %98
    si2 r4
    R2.*3
    r4 r re

    %103
    dod2-+ \appoggiatura si8 la4
    r re fad
    mi4.-+(re8) mi4 \mbreak %%%%%%%%% ripresa

    %106
    fad\appoggiatura mi8 re4 fad8 sol
    mi2-+ la,4
    re2 dod8 re

    %109
    \appoggiatura re mi2 r8 la,
    si4. dod8 re4\mbreak
    dod4 si4.-+ la8

    %112
    sold2_+ \appoggiatura fad8 mi mi'
    mi4. si8 do4
    \appoggiatura si8 la4 sold4.-+ la8\mbreak

    %115
    la2 r4
    R2.*5
    r4 r r8 la

    %122
    fad4._+ sol8 la4
    re si4.-+ si8\mbreak
    mi2 dod8-+ mi

    %125
    \appoggiatura mi fad4. mi8 re4
    dod16[(si8 dod16)] dod4.-+ re8
    re2 r8 fad\mbreak

    %128
    fad4. mi8 sol4
    fad mi4.-+ re8
    dod2-+ dod8 la

    %131
    mi'2.~
    mi4. dod8 re4~\mbreak
    re8 mi mi4.-+ re8

    %134
    re2 r4
    R2.*11
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IVtesto = \lyricmode {

    L'absen - çe, d'une ar -- deur ex -- trȇme _ guérit _ mal un cœur mal' heu -- reux,
    l'absen - çe, d'une ar -- deur ex -- trȇme _ guérit _ mal un cœur mal' heureux; _
    souvent _ c'est a l'absençe _ _ mesme _ qu'a -- mour doit ses plus tendres _  feux.
    Sou -- vent c'est a l'absen - çe mesme _ qu'a -- mour doit ses plus tendres _  feux.
    Sou -- vent c'est a l'absen - çe mesme _ qu'a -- mour doit ses plus tendres _  feux.
    Prenez _ une _ nou -- velle _ chaî - ne, et vous pourrez _ tout esperer; _ _
    prenez _ une _ nouvelle _ _ chaî - ne, et vous pour -- rez tout es -- perer; _
    vous vous adres - sés à la Haine; _ c'est  l'amour _ qu'il faut implo - rer.
    Vous vous adres - sés à la Haine; _ c'est  l'amour _ qu'il faut im -- plo -- rer.
    Vous vous adres - sés à la Haine; _ c'est  l'amour _ qu'il faut implo - rer.
    L'absen - çe, d'une ar -- deur ex -- trȇme _ guérit _ mal un cœur mal' heu -- reux,
    l'absen - çe, d'une ar -- deur ex -- trȇme _ gué -- rit mal un cœur mal' heureux; _
    sou -- vent c'est a l'absençe _ _ mesme _ qu'a -- mour doit ses plus tendres _  feux.
    Sou -- vent c'est a l'absen - çe mesme _ qu'a -- mour doit ses plus tendres _  feux.
    Sou -- vent c'est a l'absen - çe mesme _ qu'a -- mour doit ses plus tendres _  feux.

}


IVbcn = \relative do {

    r4
    r r8 r16 la' la8. la16
    \tuplet 3/2 { si8(la sol) fad[(mi fad)] re(mi fad)
    sol(fad mi) la[(si dod)] la(si dod)}

    %4
    re4. r16 re, re8. re16\mbreak
    \tuplet 3/2 { sol8(la fad) } sol8. fad16 mi8. re16
    dod4. r16 dod dod8. dod16

    %7
    \tuplet 3/2 { fad8(sol mi) } fad8.[mi16 re8. dod16]
    si8. si'16 \tuplet 3/2 { si8(dod re) fad,[(mi re)] }\mbreak
    sol4. r16 sold la8. si16

    %10
    dod8. la16 re8. la16  mi'8. la,16
    \tuplet 3/2 { re8(fad, sol) } la4 la,
    re2 r4

    %13
    R2.*6
    r8 r16 la' \tuplet 3/2 { la8(si la) } fad8. re16
    \tuplet 3/2 { sol8(la fad) } sol8.[fad16 mi8. re16]

    %21
    dod4. r16 dod dod8. dod16\mbreak
    \tuplet 3/2 { fad8(sol mi) } fad8.[mi16 re8. dod16]
    si8. si'16 \tuplet 3/2 { si8(dod re) fad,[(mi re)] }

    %24
    la'4 la, r
    R2.*5
    r4 r r8 r16 la'

    %31
    \tuplet 3/2 { la8(si la) sold[(fad sold)] mi(fad sold) }\mbreak
    la4 sold fad
    mi4. r16 mi \tuplet 3/2 { re8(mi re)}

    %34
    do8.mi16 sold,8. mi16 la8. si16
    do8. re16 mi4 mi,\mbreak
    la8. do'16 \tuplet 3/2 { do8(re do) } la8. do16

    %37
    sold8.-+ la16 si8. do16 \tuplet 3/2 { re8(do si) }
    do4. r16 la la8. la16
    \tuplet 3/2 { si8(do la) sold[(fad sold)] mi(fad sold) }\mbreak

    %40
    la8. la,16 \tuplet 3/2 { la8(si do) la[(si do)]
    re(do re)} mi4 mi,
    la2 r4

    %43
    R2.*5
    r4 r8 r16 re' re8. re16\mbreak %%% fine p. 24
    \tuplet 3/2 { sol,8(la fad) sol[(la si)] mi,(re dod) }

    %50
    re4 dod si
    la8. la'16 \tuplet 3/2 { la8(si la) } sol8.-+ fad16
    sol,8. sol'16 \tuplet 3/2 { sol8(la sol) } fad8.-+ mi16

    %53
    fad,8. fad'16 \tuplet 3/2 { fad8(sol fad) fad[(mi-+ re)]\mbreak
    sol(fad-+ mi)} la4 la,
    re re, r

    %56
    r r8 r16 la'' la8. la16
    \tuplet 3/2 { si8(la sol) fad[(mi fad) ] re(mi fad)
    sol(fad mi) la[(si dod)] la(si dod)}

    %59
    re4. r16 re, re8. re16\mbreak
    \tuplet 3/2 { sol8(la fad) } sol8. fad16 mi8. re16
    dod4. r16 dod dod8. dod16

    %62
    \tuplet 3/2 { fad8(sol mi) } fad8. mi16 re8. dod16
    si8. si'16 \tuplet 3/2 { si8(dod re) fad,[(mi re)] }
    sol4. r16 sold la8. si16\mbreak

    %65
    dod8. la16 re8. la16 mi'8. la,16
    \tuplet 3/2 { re8(fad, sol) } la4 la,
    re re, r  %%%%%%%%% fine ripresa

    %68
    R2.*4
    r4 r8 r16  fad' fad8. fad16
    \tuplet 3/2 { sol8(la fad) } sol8. fad16 mi8. re16

    %74
    dod4. r16 dod dod8. dod16
    \tuplet 3/2 { fad8(sol mi) } fad8. mi16 re8. dod16
    si4 si, r

    %77
    R2.*4
    r8 r16 fad'' \tuplet 3/2 { fad8(sold la) sold[(lad si)] }
    lad8.-+ fad16 fad8. sold16 lad8. fad16

    %83
    si8. si,16 si8. dod16 re8. si16\mbreak
    dod2 r4
    R2.*2

    %87
    r8 r16 fad \tuplet 3/2 { fad8(mi re) } dod8. si16
    lad8. _+ sold16 fad8. fad'16 \tuplet 3/2 { fad8(sol fad)\mbreak }
    mi8. fad16 \tuplet 3/2 { sol8(fad-+ mi) re[(mi re)] }

    %90
    dod4 fad r
    R2.*2
    r4 r8 r16 fad \tuplet 3/2 { fad8(sol fad) }

    %94
    mi8. fad16 \tuplet 3/2 { sol8(fad-+ mi) re[(mi re)] }
    dod4 fad r
    R2.*2

    %98
    r8 r16 si \tuplet 3/2 { si8(dod re) fad,[(mi re)] }
    la'4 la,8. la'16 la8. la16
    \tuplet 3/2 { si8(la sol) fad[(mi fad)] re(mi fad)

    %101
    sol(fad mi) la[(si dod)] la(si dod)\mbreak}
    re8. re,16 re8. mi16 fad8. re16
    la'4 la, r

    %104
    R2.*5
    r4 r r8 r16 la'
    \tuplet 3/2 { la8(si la) sold[(fad sold)] mi(fad sold) }\mbreak

    %111
    la4 sold fad
    mi4. r16 mi \tuplet 3/2 { re8(mi re)}
    do8.mi16 sold,8. mi16 la8. si16

    %114
    do8. re16 mi4 mi,\mbreak
    la8. do'16 \tuplet 3/2 { do8(re do) } la8. do16
    sold8.-+ la16 si8. do16 \tuplet 3/2 { re8(do si) }

    %117
    do4. r16 la la8. la16
    \tuplet 3/2 { si8(do la) sold[(fad sold)] mi(fad sold) }\mbreak
    la8. la,16 \tuplet 3/2 { la8(si do) la[(si do)]

    %120
    re(do re)} mi4 mi,
    la2 r4
    R2.*5

    %127
    r4 r8 r16 re' re8. re16\mbreak %%% fine p. 24
    \tuplet 3/2 { sol,8(la fad) sol[(la si)] mi,(re dod) }
    re4 dod si

    %130
    la8. la'16 \tuplet 3/2 { la8(si la) } sol8.-+ fad16
    sol,8. sol'16 \tuplet 3/2 { sol8(la sol) } fad8.-+ mi16
    fad,8. fad'16 \tuplet 3/2 { fad8(sol fad) fad[(mi-+ re)]\mbreak

    %133
    sol(fad-+ mi)} la4 la,
    re re, r
    r r8 r16 la'' la8. la16

    %136
    \tuplet 3/2 { si8(la sol) fad[(mi fad) ] re(mi fad)
    sol(fad mi) la[(si dod)] la(si dod)}
    re4. r16 re, re8. re16\mbreak

    %139
    \tuplet 3/2 { sol8(la fad) } sol8. fad16 mi8. re16
    dod4. r16 dod dod8. dod16
    \tuplet 3/2 { fad8(sol mi) } fad8. mi16 re8. dod16

    %142
    si8. si'16 \tuplet 3/2 { si8(dod re) fad,[(mi re)] }
    sol4. r16 sold la8. si16\mbreak
    dod8. la16 re8. la16 mi'8. la,16

    %145
    \tuplet 3/2 { re8(fad, sol) } la4 la,
    re2\fermata r4

}


IVbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s4
    s2.
    <6>8 s <6>4 <6>8 <6>16 s
    <6 5>2.
    s
    <9>4 <8> <8>8 <8>
    <5/>2 <5/>8 <5/>
    <9 7>4 <8 _ 6>4 <_>8 <_>
    <7>4 <6> <5/> %%%%%%% fine p. 21
    s4. s16 <5/> <3>8. <3>16
    <5/>8. <5/>16 <3>8. <3>16 <6\\>8. <6\\>16
    s4 <4> <3>
    s2.*7
    s2 <6>4
    <9> <8>4. <8>8
    <5/>2 <5/>8 <5/>8
    <9 7>4 <8 _ 6>4. <_>8
    <7>4 <6>8 s <6>4
    s2.*2
    s2. *5  %%%5 ripresa
    <2>4 <5/>4. <5/>8
    s4 <6> <6\\>
    <_+>2 <_+>8 <_+>8
    <6>8. <6>16 <5/>8. <5/>16 <_->8. <_->16
    <6>8. <6>16 <4>4 <_+>
    <_-> <6>4. <6>8
    <5/>8. <5/>32 s <6\\  _ 5/>4. <_>8
    <6>2 <_->4
    <6\\  _ 5/>8 <_>8 <5/>4. <5/>8
    <_->2 <_->8 <_->8
    <4+>8 <6>16 <6><4>4 <_+>8 s
    <_+>2 s4  %%%% bar 42 OK
    s2.*6
    <7>4 <6 _ 5>8. <_>16 <6\\>8. <6\\>16
    s4 <6> <6\\>
    <_>2 <_>8 <_>
    <4+>2 <4+>8 <4+>
    <7>4. <7>8 <6>8 s
    <5 _ 6>8. <_>32 s <4>4 <3>
    s2.*2
    <6>8 s <6>4. <6>16 s
    <6 5>2.
    s
    <9>8. <9>16 <8>4. <8>8
    <5/>2 <5/>8 <5/>
    <9 _ 7>8. <_>32 s <8 _ 6>4. <_>8
    <7>4 <6> <5/>
    s4. s16 <5/> <3>8. <3>16
    <5/>8. <5/>16 <3>8. <3>16 <6\\>8. <6\\>16
    s4 <4> <3>  %%%%% fine ripresa
    s2.*5
    s2 <_+>4
    <7> <6 4+ 3> <6>
    <6\\ _ 5/>2 <_>8 <_>
    <9 _+>4 <8 _+> <6>8. <6\\>16
    s2.*5
    s4 <_+> <6>
    <5/>2 <5/>8 <5/>
    s4 <5/ _ 6\\>4. <_>8
    <_+>2 s4
    s2.*2
    s4 <_+>8. <_+>16 <6\\>8. <3>16
    <6>8. <6>16 <_+>4. <_+>8
    <3 4+ 6>4. <4+>8 <6>8. <6>16
    <5/ 7>4 <_+> s
    s2.*2
    s2 <_+>4
    <3 4+ 6>4. <3>8 <6>8. <6>16
    <7 5/>4 <_+> s
    s2.*2
    s2 <6>4
    s2.
    <6>8 s <6>4 s
    <6 5>2.
    s2 <6>4
    s2.*2

    s2. *5  %%%5 ripresa
    <2>4 <5/>4. <5/>8
    s4 <6> <6\\>
    <_+>2 <_+>8 <_+>8
    <6>8. <6>16 <5/>8. <5/>16 <_->8. <_->16
    <6>8. <6>16 <4>4 <_+>
    <_-> <6>4. <6>8
    <5/>8. <5/>32 s <6\\  _ 5/>4. <_>8
    <6>2 <_->4
    <6\\  _ 5/>8 <_>8 <5/>4. <5/>8
    <_->2 <_->8 <_->8
    <4+>8 <6>16 <6><4>4 <_+>8 s
    <_+>2 s4  %%%% bar 42 OK
    s2.*6
    <7>4 <6 _ 5>8. <_>16 <6\\>8. <6\\>16
    s4 <6> <6\\>
    <_>2 <_>8 <_>
    <4+>2 <4+>8 <4+>
    <7>4. <7>8 <6>8 s
    <5 _ 6>8. <_>32 s <4>4 <3>
    s2.*2
    <6>8 s <6>4. <6>16 s
    <6 5>2.
    s
    <9>8. <9>16 <8>4. <8>8
    <5/>2 <5/>8 <5/>
    <9 _ 7>8. <_>32 s <8 _ 6>4. <_>8
    <7>4 <6> <5/>
    s4. s16 <5/> <3>8. <3>16
    <5/>8. <5/>16 <3>8. <3>16 <6\\>8. <6\\>16
    s4 <4> <3>

}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key re\major
    \tempo 2 = 60
    \partial 4 s4
    s2.*146
    \bar "|."

}

IVvl = {
    \global
    %\notypeset
    %\clef french
    <<\IVvln \forma>>

}


IVvoce = {
    \new Voice = "gay"
    \global
    %\clef soprano
    <<\IVvocen \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset

}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup \huge {[1.] Recitatif.}

    \score {

        \new ChoirStaff <<

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce
                \new Lyrics \lyricsto "oublier" \Itesto
            >>

            \new Staff
            \with {
                fontSize = #+2
                \override StaffSymbol #'staff-space = #(magstep +2)
            }
            <<
                \set Staff.instrumentName = \markup  \center-column{"B. C."}
                \set Staff.midiInstrument = #"cello"
                \Ibc

            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner
                #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[2.] Air \italic\smaller "trés lent."}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Flûte""allemande"}
                \IIfl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violon""seul"}
                \IIvl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce
                \new Lyrics \lyricsto "souffrez" \IItesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"B. C."}
                \IIbc

            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner
                #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[3.] Recitatif}

    \score {


        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"voice oohs"
                \IIIvoce
                \new Lyrics \lyricsto "ainsy" \IIItesto
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violons"}
                \IIIvl
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"B. C."}
                \IIIbc

            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner
                #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[5.] Air. \italic\smaller  "Gay et gratieusement."}

    \score {


        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"voice oohs"
                \IVvoce
                \new Lyrics \lyricsto "gay" \IVtesto
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violons"}
                \IVvl
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[B. C.]"}
                \IVbc

            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine #'hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner
                #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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
