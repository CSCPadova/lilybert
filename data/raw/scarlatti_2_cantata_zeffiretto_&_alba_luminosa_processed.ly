\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

dolce = _\markup\italic "dol."


arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

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

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

Ivocen = \relative do'' {

    \autoBeamOff

    R4.*6
    r8 sib16[la] sib[sol]
    re'8 mib16[re] mib[re]

    %9
    do8 re16[do] re[do]
    sib[la sol fad sol la]
    sib[la sol la sib do]\mbreak

    %12
    re[do] re8 r
    r do16[si] do[si]
    do8. re16 mib8

    %15
    re fa16[mib] re[do]
    sib8. do16 la8
    sib4.

    %18
    R
    r8 sib16[la] sib8
    sib16[la] la[sol] la[si]

    %21
    do[si] do8. do16
    do[sib?] sib[la] sib[do]\mbreak
    re8 mib16[re] mib[re]

    %24
    do8 re16[do] re[do]
    sib[la sol fad sol la]
    sib[la sol la sib do]

    %27
    re[do] re8 r
    r re,16[fad] mi[sol]
    fad[mi fad la sol sib]

    %30
    la[sol la do sib re]
    do[si do mib re fa]
    mib[re] do8. mib16

    %33
    re[fad,] sol8. mib'16\mbreak
    sib[la] la8. sib16
    sol4.

    %36
    r8 do16[si] do[si]
    do8. re16 mib[do]
    fad8 sol16[fad] sol[sol,]

    %39
    sib8. la16 sol8
    sol4.
    R4.*5

    %46
    r8\fermopz re'16[do] re[sib]\mbreak
    fa'[mib] re[mib] fa8
    mib16[re] do[re] mib8

    %49
    mib16[re] re4~
    re8 do16[si] do[re]
    mib8. re16 do8

    %52
    reb4.~
    reb8 do16[si] do8
    mib16[re] re8. mib16

    %55
    do4.
    R4.*2
    r8 mib16[re] mib[do]

    %59
    fa[mib] re[mib] fa8
    mib16[re] do[re] mib8
    mib16[re] re4~

    %62
    re8 mib16[re] mib[re]
    mib8 fa16[mib] fa[re]
    dod4.~

    %65
    dod8 re16[dod] re8
    fa16[mi?] mi8. fa16
    re8 fa re

    %68
    sib re sib
    sold4.
    la4 re8\mbreak

    %71
    re16[dod] dod8. re16
    re8 r r

}

Itesto = \lyricmode {

    Zef -- fi -- retto  _ che_in -- driz -- zi_il tuo vo - - lo do -- ve stas -- si l'in -- grato _

    l'in -- grato _ mio ben;  zef -- firet - to, che_in -- driz -- zi_il tuo vo -- lo

    che_in -- driz -- zi_il tuo vo -- lo_il tuo vo - - lo do -- ve stas - - - si l'in -- grato _

    l'in -- grato _  mio ben, do -- ve stas -- si l'in -- grato _

    l'in -- grato _ mio ben. Deh su l'a -- li gli por -- ta quel duo -- lo,

    che_ad ogn' o -- ra tra -- fig -- ge tra -- fig -- ge_il mio sen.

    Deh su l'a -- li gli por -- ta quel duo -- lo,

    che_ad ogn' o -- ra tra -- fig -- ge tra -- fig -- ge_il mio sen,

    che_ad ogn' o -- ra tra -- fig -- ge tra -- fig -- ge_il mio sen.




}

Ibcn = \relative do {

    r8 sib'16 la sib sol
    re'8 mib16 re mib re
    do8 re16 do re do

    %4
    sib la sol fad sol la
    sib la sol la sib do
    re do re8[re,]

    %7
    sol r r
    fad sol4
    la8 fad4

    %10
    sol re8
    sol8. fa?16 mib8\mbreak
    re sib'16 [la sib sol]

    %13
    re'8\noBeam mib16 re mib re
    do8 sib la
    sib4 sib,16 do

    %16
    re8 mib do
    sib\noBeam re16 do re sib
    mib8 fa16 mib fa mib

    %19
    re do sib[do re mi!]
    fa8 fa,4
    mib'16 re do re mi[fad]

    %22
    sol sol, sol'[fad sol la]\mbreak
    sib8 sol4
    la8 fad4

    %25
    sol re8
    sol8. fa?16 mib8
    re\noBeam re16 fad mi? sol

    %28
    fad8. la16 sol sib
    la8. la16 sib sol
    fad8. re16 sol8

    %31
    mib8. do16 si8
    do8. sib?16 do la
    sib8. la16 sib do\mbreak

    %34
    re16 do re8[re,]
    sol\noBeam do16 si do si
    do4 sol'8

    %37
    mib do4
    re16 do sib la sib do
    re do re8[re,]

    %40
    sol\noBeam sib'16 la sib sol
    re'8\noBeam mib16 re mib re
    do8 re16 do re do

    %43
    sib la sol fad sol la
    sib la sol la sib do
    re do re8[re,]

    %46
    sol8\fermopz r r
    la8 sib4
    sol8 la fa

    %49
    sib sib,16 do re8
    mib4 re8
    do16 si do re mib8\noBeam

    %52
    fa16 mib fa8 sol
    lab mib16 re mib fa
    sol fa sol8[sol,]

    %55
    do\noBeam mib16 re mib do
    sol'8\noBeam lab16 sol lab sol
    fa8\noBeam sol16 fa sol fa

    %58
    mib re do4\mbreak
    la'8 sib4
    sol8 la fa

    %61
    sib8. la16 sib la
    sol8 fad4
    sol8 la[re,]

    %64
    mi? la sol
    fa8. mi16 fa sol
    la sol la8[la,]

    %67
    re r r
    re r r
    si\noBeam mi16 re mi re

    %70
    dod8 re16 dod re mi\mbreak
    fa sol la8[la,]
    re\noBeam sib'16 la sib sol

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8 <6>4
    <_+>4.
    <6 5 _->8 <_+>4
    <6>4.
    <6>
    <6 4>8 <3>4
    s4.
    <6>8 <6->4
    <6+>4.
    s4 <_+>8
    s4 <5>16 <6>
    <_+>8 <6>4
    <_+>8 <6>16 <6!> <6> <6!>
    <_->4.
    s
    <6>8 s <6>
    s4.
    <6 5>
    <6>
    <4>8 <3>4
    <6>4.
    <4>8 <3-> s16 <6+>
    <6>8 <6->4
    <6+>4.
    s4 <_+>8
    s4 <5>16 <6>
    s4.
    s8. <6+>16 <6> <6>
    s8. <6+>16 <6> s
    s4.
    <6>
    <_->4 s16 <6+>
    <6>8. <6+>16 <6> s
    <6 4>8 <3>4
    s8 <_->4
    <_-> <_!>8
    <6>4.
    <_+>8 <6>4
    <6 4>8 <3>4
    s8 <6>4
    <_+>4.
    <6 4 _->8 <_+>4
    <6>4.
    <6>
    <6 4>8 <3>4
    s4.<6>
    <6->
    <4->8 <3> <6>
    <7> <6> <6!>
    <_->4 <6>8
    <6->4.
    <4->16 <3> <6>4
    <6- 4>16 <3> s4
    <_->8 <6>4
    <_!>4.
    <6 5 _->8 <_!>4
    <6>4.
    s
    <6->8 <6>4
    <4>8 <3> s
    s <7- 5>4
    <6->8 <6>4
    <6+>4.
    <5+>8 <6>4
    <6 4>8 <3>4
    s4.
    <6>
    <6+>8 <_+>4
    s4.
    s8 <_+>4
    s8 <6>4

}

forma = {

    \time 3/8
    \key fa\major
    \tempo 4. = 37
    s4. \inStaffSegno
    s4.*44
    s8 \bar "|." \break s s
    s4.*26
    \bar "||"
    \mark\markup\smaller\center-column{"Dal""Segno"}

}

Ivoce = {
    \new Voice = "volo"
    \Iglobal
    <<\Ivocen\forma>>
}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn\forma\Ibfn>>
}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

IIvocen = \relative do'' {

    \autoBeamOff

    r4 mib8 sib sib4 sib8 do
    lab4 lab lab8 sib8 sib sib16 sib
    sol4 sol mib'8 re do re16 mib

    %4
    lab,4 lab r8 lab lab8 sol
    sol4 sol\mbreak re'8 re re re16 dod
    re8 re r re re sol, la sib

    %7
    la4 la re8 do mib mib16 re
    si8[do16 si] do4 r8 mib mib re
    do[reb16 do] reb4. do8 do4\mbreak

    %10
    sib r8 fa' fa sib, sib la
    sib sib r sib re4 re8 mib16 fa
    lab,4 lab r8 lab16 lab lab8 sib16 do

    %13
    sib8. sib16 re8 sib sol4 sol\mbreak
    mib'8 mib16 mib mib8 reb reb4 do~
    do8 si16 do do8 sol r2

}

IItesto = \lyricmode {

    E per -- ché_in quel ge -- la -- to cuor di lei, che m'ac -- cen -- de

    scen -- da_al -- men di mie pe -- ne un pic -- ciol sag -- gio

    del bel la -- bro_a -- do -- rato _ con -- fon -- di_in fra_i res -- pi -- ri mi -- sti_ai

    dol -- ci suoi fia -- ti i miei so -- spi - - - ri;

    che for -- se_in simil _ guisa _ po -- trà den -- tro_a quel pet -- to

    o -- ve_a -- mor non de -- stò giam -- mai fa -- vil -- la

    giunger _ del foco _ mio qual -- che scin -- tilla. _




}

IIbcn = \relative do {

    mib1~
    mib2. re4
    mib1

    %4
    do
    si
    sib!

    %7
    fad'
    fa!4 mib2~mib4
    mi!2 fa\mbreak

    %10
    sib,1~
    sib
    re~

    %13
    re2 mib~\mbreak
    mib fa
    fad4 sol do, r

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <4- 2>2. <6>4
    s1
    <6->
    s
    <6>
    s
    <4! 2>4 <6>2.
    <6>4 <7- 5> <6 4> <3>
    <_!>1
    s
    <5->
    <6>
    s2 <6->4 <5>
    <7- 5> <4>8 <3> s2

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 60
    s1*15
    \bar "||"

}

IIvoce = {
    \new Voice = "cuor"
    \IIglobal
    <<\IIvocen\forma>>
}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn\forma\IIbfn>>
}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

IIIvocen = \relative do'' {

    \autoBeamOff

    r4 r8 r4 r8 r2.
    R1.
    r2. r8 r sol sib4 do8

    %4
    re8. [mib16 re8] mib4. r8 r do re4 la8
    sol4(fad8) sol4.\mbreak r8 r la re4 do8
    si4. do~do4 fa8 mib4 re8

    %7
    mib2.~mib4 reb8 reb4 reb8
    mib?8. reb16 do8 do4 do8 do8. fa16 mib8 mib4 re8
    do4. r4 r8 r2.

    %10
    r\mbreak r8 r mib mib4 mib8
    mib8.[fa16 re8] mib4.~mib4 re8 re4 re8
    re8.[mib16 do8] re4.~re4 do8 do4 do8

    %13
    do8.[re16 sib8] do4.~do4 do8 sib4 la8
    sib2.~sib4 lab8 lab4 lab8\mbreak
    sib8. lab16 sol8 sol4 sol8 sol8. do16 sib8 sib4 la?8

    %16
    sol4. r8 r sib la8.[sib16 la8] sib4 do8
    re8.[mib16 do8] re4 sib8 la8.[sib16 la8] sib4 do8
    re8.[mib16 do8] re4.~re4 do8 do4 do8

    %19
    do8.[re16 sib8] do4.~\mbreak do4 do8 sib4 la8
    sib2.~sib4 lab8 lab4 lab8
    sib8. lab16 sol8 sol4 sol8sol8. do16 sib8 sib4 la?8

    %22
    sol2. r8 r lab^\p lab4 lab8
    sib8. lab16 sol8 sol4 sol8 sol8. do16 sib8 sib4 la?8\mbreak
    sol4. r4 r8 r2.

    %25
    r r8 r sib sib4 sib8
    do8. [sib16 la8] sib4. r8 r do re4 mib8
    mib8. [re16 do8] re4.~re4 re8 do4 sib8

    %28
    la4 sib8 do8. re16 mib8\mbreak fa8. mib16 re8 re4 do8
    sib2.~sib4 lab8 lab4 lab8
    lab4(sol8) do4.~do4 si8 do4 re8

    %31
    mib4(re8) do4.~do4 mib8 re4 do8
    sib4 sol8 re'8. re16 mi!8\mbreak fa8. mi16 re8 re4 re8
    re2. mib4(re8) mib4 re8

    %34
    mib8. [re16 dod8] re4.~re4 mi!8 la,4 dod8
    re4.

}

IIItesto = \lyricmode {

    Au -- retta _ ca -- ra mia do -- glia_a -- ma -- ra da te con -- for -- to spe -- rando _

    va mia do -- glia_a -- mara _ da te con -- forto _ spe -- rando _ va,

    au -- retta _ ca -- ra mia do -- glia_a -- ma -- ra da te con -- for -- to spe -- rando _

    va mia do -- glia_a -- mara _ da te con -- forto _ spe -- rando _ va,

    au -- ret - ta ca -- ra mia do - glia_a -- ma -- ra da te con -- for -- to spe -- rando _

    va mia do -- glia_a -- mara _ da te con -- forto _ spe -- rando _ va,

    mia do -- glia_a -- mara _ da te con -- forto _ spe -- rando _ va.

    Se tan -- ta sor -- te go -- der m'è da -- to tuo dol -- ce fia -- to

    spir -- to di vi -- ta per me sa -- rà, se tan -- ta sor -- te go -- der m'è da -- to tuo dol -- ce fia -- to

    spir -- to di vi -- ta per me sa -- rà, spir -- to di vi -- ta per me sa -- rà.

}

IIIbcn = \relative do {

    r8 r sol' sib4 do8 re8. mib16 re8 mib4.
    r8 r do re4 la8 sib4 fad8 sol8. la16 sib8
    do4 do,8 re4 re,8 sol4. r4 r8

    %4
    sol'4. do4 sib8 la4. fad
    sol4 la8 sib8. la16 sol8\mbreak fad4. re
    sol4 re8 mib8. re16 do8 fa?4. sol

    %7
    do4 sib8 lab4 sol8 fa4. r4 r8
    sol4. mib fa sol
    do,4 do8 mib4 fa8 sol8. lab16 sol8 lab4 mib8

    %10
    fa4 fa,8 sol'4 sol,8\mbreak do4. do'4 sib8
    la4.~la4 sol8 fa4. fad
    sol~sol4 fa?8 mib4. la,!

    %13
    re~re4 mi!8 fad4. r4 r8
    sol4 fa?8 mib4 re8 do4. do'\mbreak
    sib r4 r8 do4. re4 re,8

    %16
    sol4 sib8 la4 sol8 fad4. sol4 mib8
    re4. r8 r sol fad4. sol4 mib8
    re4. r8 r sib mib4. la,!

    %19
    re~re4 mi!8\mbreak fad4. r4 r8
    sol4 fa?8 mib4 re8 do4. do'
    sib r4 r8 do4. re4 re,8

    %22
    sol4 fa8 mib4 re8 do4. r4 r8
    sib4. r4 r8 do4. re4 re,8\mbreak
    sol4 sol'8 sib4 do8 re8. mib16 re8 mib4 re8  %% inizio ripresa

    %25
    do4 do,8 re4 re,8 sol4. re'
    mib re4 sib8 mib4. fa
    sib4 la8 sib4 la8 sol4 fa8 mib4.

    %28
    fa mib\mbreak re4 sib8 fa'4 fa,8
    sib4 mib8 mib4 re8 do4. do'
    sib lab4 sol8 fa4. mib4 re8

    %31
    do4. do'4 sib8 la4 sol8 fad4.
    sol r4 r8\mbreak fa?4 sol8 la4 la,8
    re4 mi?8 fa4 re8 sol4. r8 r fa

    %34
    sol4 la8 sib4 la8 sold4. la
    re,4 sol8

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4. <6> <_+>2.
    s4. s4 <6+>8 <6>2.
    <_->4. <4>4 <3>8 s2.
    s4. <_->4 <6>8 <6+>2.
    s4 <6+>8 <6>4. s2.
    <_!>4 <6!>8 <6>4. <_-> <6- 4>4 <3>8
    <_->2. <7- _->4 <6->8 s4.
    <6-> <6> <_-> <6- 4>4 <3>8
    <_->4. <6> <_!> s
    <_-> <4>4 <3>8 <_->4. <_->
    <6 5->2. <_! 7->
    <_!> <7>4 <6>8 <7>4.
    <_+ 7>2. <6 5>
    s <_- 7>4 <6->8 <6->4.
    <6>2. <_->4. <6 4>4 <3>8
    s4. <6+> s s4 <6>8
    <_+>2. s4. s4 <6>8
    <_+>4. s4 <6>8 <7>4 <6>8 <7>4.
    <_+ 7>2. <6 5>
    s <7>4 <6->8 <6->4.
    <6>2. <_->4. <6 4>4 <3>8
    s2. <_- 6->2.
    <6> <_->4. <6 4>4 <3>8
    s2.  <_+>
    s4. <4>4< 3>8 s4. <6>
    <6> <6> <6 5> <_!>
    <4->2. s4 <6>8 <6>4 <5>8
    s4. <6> <6> <6 4>4 <3>8
    s2. <_- 7>4 <6->8 <6->4.
    <7->4 <6>8 s4. <_-> <6>4 <6!>8
    <_->2. <6+>4 <6->8 s4.
    s2. <6>4. <4>4 <3>8
    s4 <6+>8 <6>4. <6-> s4 <6>8
    <6->4 <_+>8 s4. <6 5>4. <_+>8

}

forma = {

    \time 12/8
    \key fa\major
    \tempo 2. = 57
    s4. \inStaffSegno s s2.
    s1.*22
    s4. \fermopz\bar "|."\break s s2.
    s1.*10
    s4.
    \bar "||"
    \mark\markup \smaller\center-column{"Dal""Segno"}

}

IIIvoce = {
    \new Voice = "cara"
    \IIIglobal
    <<\IIIvocen\forma>>
}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn\forma\IIIbfn>>
}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

IVvocen = \relative do'' {

    \autoBeamOff

    r4 mi2  mi4(
    fad) fad la fad16[mi red8]
    red?4(mi) mi2\mbreak

    %4
    r8 mi si do re?2
    re4 re re mi8 fad
    re4 re r si8 si\mbreak

    %7
    si4 do8 re mi2
    r8 si si la dod4 dod
    r la'8 la fad4 sol8 la\mbreak

    %10
    re,4 r8 re si4 sol'~
    sol8 sol[fad8. mi16] re4 la'8[sol16 fad]
    fad4 (mi) re2

    %13
    r4 si8 si re16[do re mi] re[do re mi](\mbreak %% fine p. 3
    re4) re8 la si4 si
    r sol'8 sol sol sol sol sol\mbreak

    %16
    mi8 mi si si si4 si8 do
    re8. fad16 mi8. re16 dod4 dod\mbreak
    la'2 sol4 (fad) sol(la)

    %19
    fad1 fad2
    re mi fad
    si, dod re4(mi)\mbreak

    %22
    fa1(mi4 re)
    re1.
    re2 do4(si) do(re)

    %25
    si1 si2
    sol' la si\mbreak
    mi, mi sol

    %28
    fa mi4 fa red fa
    mi1.
    fa2 mi4 fa red fa\mbreak

    %31
    mi1.~
    mi1 fad?4 sol
    mi1.

}

IVtesto = \lyricmode {

    Già l'al -- ba lu -- mi -- no -- sa uscia _ dal mar quan -- do Fi -- lau -- ro_a -- mante _

    den -- tro_il bosco _ vi -- cin mo -- vea le pian -- te, che_un se -- guace  _ d’a -- mor

    mai mai mai non -  ri -- po -- sa e gi -- ran - do d’in -- torno, _

    vis -- to_in -- ciso _ in un orno _ il bel nome _ di lei, ch’a -- mava _ tan -- to,

    sciol -- se la vo -- ce e con la vo -- ce il pian -- to,

    sciol -- se la vo -- ce e con la vo -- ce il pian - - - - - - - - - - - - - to.

}

IVbcn = \relative do {

    mi1~
    mi~
    mi~

    %4
    mi2 si
    si~si~
    si1~

    %7
    si2 sol
    sol fad
    re'1~

    %10
    re2 sol
    la si4 fad
    sol la re,2

    %13
    si fad~\mbreak
    fad sol
    sol1

    %16
    sold~
    sold2 la\mbreak
    la si2. do4

    %19
    re2 mi fad
    si, do re
    sol, la si\mbreak

    %22
    sold1 la2
    re mi fad
    re mi2. fad4

    %25
    sol2 la si
    mi, fad sol\mbreak
    do, si4 la sol2

    %28
    la1 si2
    do si4 do sol si
    la1 si2\mbreak

    %31
    do si4 do sol la
    si1.
    mi,

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 2 = 55
    s1*17\break
    \time 3/2
    \key mi\minor
    \tempo 1 = 60
    s1.*16
    \bar "||"

}

IVvoce = {
    \new Voice = "alba"
    \IVglobal
    <<\IVvocen\forma>>
}



IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn\forma\IVbfn>>
    \typeset
}


Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

VvlIn = \relative do'' {

    r2 sol' fad
    mi red1
    r2 sol fad

    %4
    mi red mi
    do do do\mbreak
    do si r

    %7
    r do si
    red mi fad
    mi red4 mi fad red

    %10
    mi2 re? mi4 si\mbreak
    do2 fa1~
    fa2 mi4 red mi fad?

    %13
    sol2 (fad1)
    mi1.
    R1.*2

    %17
    r2 si' la
    sol fad1
    R1.*3

    %22
    r2 r mi
    do do do\mbreak
    do si r

    %25
    R1.*5
    si2 la mi'~
    mi4 re do si la2

    %32
    si la do
    si do si\mbreak
    si1.

    %35
    r2 fad' si
    la4 sol fad sol la2
    la sol r

    %38
    R1.*2
    r2 r sol
    fa4 mi re mi fa2

    %42
    fa? mi1
    R1.
    r2 mi mi

    %45
    mi re1
    r2 la' la
    la sold1

    %48
    R1.*6
    la,4 si do re mi fa
    si, la sol la si do

    %56
    re do re mi fa si,
    do2 si1
    la1.\mbreak

    %59
    R1.*2
    r2 mi' mi
    mi re1

    %63
    r2 la' la\mbreak
    la sol1
    R1.*6

    %71
    la,4 si do si la2
    si4 dod red? dod si2
    mi4 red mi fad mi2

    %74
    mi1 red2
    mi4 red mi fad sol la
    si la sol fad mi si'

    %77
    do si la sol fad mi
    sol2 fad1
    mi1.

}

VvlIIn = \relative do'' {

    r2 si la
    sol fad1
    r2 si la

    %4
    si la sol4 fad
    mi2 mi la4 sol\mbreak
    fad2 sol r

    %7
    r mi mi
    la la si
    do fad,4 sol la si

    %10
    sol2 la si\mbreak
    mi, do' do
    si mi1~

    %13
    mi red2
    mi1.
    R1.*2

    %17
    r2 sol fad
    mi red1
    R1.*3

    %22
    r2 r sol,4 fad
    mi2 mi la4 sol\mbreak
    fad2 sol r

    %25
    R1.*5
    sold2 la si
    mi, la do

    %32
    si mi, mi'
    mi1 red2\mbreak
    mi si mi

    %35
    re2. do4 si2
    do4 si la si do2
    do si r

    %38
    R1.*2
    r2 r si
    do re re

    %42
    sol,1.
    R\mbreak
    r2 do do

    %45
    do si1
    r2 do do
    do si1

    %48
    R1.*6
    r2 la4 si do re
    mi2. fa4 sol sol,

    %56
    la sol fa sol la2
    la1 sold2
    la1.\mbreak

    %59
    R1.*2
    r2 do do
    do si1

    %63
    r2 do do\mbreak
    do si1
    R1.*5

    %70
    si4 la sol la si2
    mi, mi' re
    re2. dod4 si2

    %73
    dod1.\mbreak
    do2 do! si
    si2. la4 si do

    %76
    re dod si re mi2~
    mi4 re do? si la mi'
    mi1 red2

    %79
    mi1.

}

Vvocen = \relative do'' {

    \autoBeamOff

    R1.*14
    r2 sol' fad
    mi red1\mbreak

    %17
    R1.*2
    r2 sol fad
    mi red mi

    %21
    do do do
    do si1
    R1.\mbreak

    %24
    r2 r mi
    do do do
    do si1

    %27
    r2 do si
    red mi sol\mbreak
    mi red4(mi) fad(mi)

    %30
    mi2 re? mi4 si
    do2 fad1~
    fad2 mi4 red mi fad

    %33
    sol2 fad1\mbreak
    mi1.
    R1.*2

    %37
    r2 si mi
    re2. do4 si2\mbreak
    do4(si) la(si) do2

    %40
    do si1
    R1.
    r2 r sol'

    %43
    fa4(mi) re(mi) fa2\mbreak
    fa? mi1
    r2 re re

    %46
    re do1
    r2 si do
    re mi fa\mbreak

    %49
    do2. si4 do2
    la4 si do re mi fa
    si, la sol la si do

    %52
    re do re mi fa si,
    do2 (si1)\mbreak
    la1.

    %55
    R1.*3
    r2 mi' la\mbreak
    sol2. fa4 mi2

    %60
    fa4(mi) re (mi) fa2
    fa? mi1
    r2 re re

    %63
    re do1\mbreak
    r2 si dod
    red mi fad?

    %66
    sol2. fad4 mi2
    mi4 red mi fad sol mi
    fad mi re? do si re\mbreak

    %69
    mi re do si la do
    re do si la sol si
    do si la si do re

    %72
    si la si dod? red mi
    dod si dod red mi fad\mbreak
    sol2 fad1

    %75
    mi1.
    R1.*4

}

Vtesto = \lyricmode {

    Dol -- ce no -- me dol -- ce no -- me di quel -- la ch’a -- doro, _ di quel -- la, ch’a -- doro, _

    sei de -- lizia _ d’un se -- no pe -- nan - - - - - - - - - - - te;

    tu sei ci -- fra d’un ca -- ro te -- soro, _ d’un ca -- ro te -- soro, _

    ch’o -- gni tron -- co ch’o -- gni tron -- co sa ren -- de -- re_a -- man - - - - - - - - - - - - - - - - -  - te,

     tu sei ci -- fra d’un ca -- ro te -- soro, _ ch’o -- gni tron -- co ch’o -- gni tron -- co

     sa ren -- de -- re_a -- man - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - te.

}

Vtestobis = \lyricmode {

    Ca -- re no -- te, ca -- re no -- te, por -- tenti _ d’a -- more, _ por -- tenti _ d’a -- more, _

    che per gio -- ia que -- st’al -- ma ucci -- de - - - - - - - - - - - te,

    sie -- te stra -- li, ch’im -- pia -- ga -- no_il core, _

    ch’im -- pia -- ga -- no_il core, _

    va -- ghi se -- gni, va -- ghi se -- gni che Fil -- li_es -- pri -- me - - - - - - - - - - - - - - - - - - te.

     Sie -- te stra -- li, ch’im -- pia -- ga -- no_il core, _

     va -- ghi se -- gni va -- ghi se -- gni che

     Fil -- li_es -- pri -- me - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  te.

}

Vbcn = \relative do {

    r2 mi fad
    sol si1
    r2 mi, fad

    %4
    sol fad mi
    la2. sol4 fad mi\mbreak
    red2 mi r

    %7
    r la sol
    fad sol mi
    la si si,

    %10
    mi fad sold\mbreak
    la1 la2
    sol do la

    %13
    si la si
    mi,1.
    r2 mi fad

    %16
    sol fad1\mbreak
    r2 mi fad
    sol si1

    %19
    r2 mi, fad
    sol fad mi
    la2. sol4 fad mi

    %22
    red2 mi mi
    la2. sol4 fad mi\mbreak
    red2 mi mi

    %25
    la2. sol4 fad mi
    red2 mi1
    r2 la sol

    %28
    fad sol mi\mbreak
    la si si,
    mi fad sold

    %31
    la1 la2
    sol do la
    si la si\mbreak

    %34
    mi, mi do
    si2. la4 sol2
    la re re,

    %37
    sol1 sol'2
    fad re sol\mbreak
    mi fad re

    %40
    sol1 sol2
    la si sol
    do1 sol2

    %43
    la si sol
    do1 do,2
    sol'1 sold2

    %46
    la1 la,2
    mi'1 mi2
    fa mi re\mbreak

    %49
    mi re mi
    la,1 la'2
    sol1 mi2

    %52
    fa1 re2
    mi re mi\mbreak
    la,1 la'2

    %55
    sol1 mi2
    fa1 re2
    mi re mi

    %58
    la,1 la'2\mbreak
    si sol do
    la si sol

    %61
    do1.
    sol1 sold2
    la1 la,2\mbreak

    %64
    mi'1 mi2
    fad sol red
    mi si' si,

    %67
    mi1 mi'2
    re1 re2\mbreak
    do1 do2

    %70
    si1 si2
    la1 fad2
    sol1 sold2

    %73
    la1 lad2\mbreak
    si la? si
    mi,1 mi2

    %76
    re1 do4 sold
    la2. si4 do2
    si la si

    %79
    mi1.

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 3/2
    \key mi\minor
    \tempo 1 = 37
    s1.*14\break \inStaffSegno \once \override Score.RehearsalMark.extra-offset = #'(10 . 0)
    \mark\markup {Da qui al fine: 2\super da Aria ”Care note”}
    s1.*79
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

Vvoce = {
    \new Voice = "soprano"
    \Vglobal
    <<\Vvocen\forma>>
}



Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn\forma\Vbfn>>
}




VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

VIvocen = \relative do'' {

    \autoBeamOff

    r4 si8 re si4 si
    sol sol8 sol sol4 sol8 fad
    fad4 fad\mbreak r8 si16 dod re8 re16 dod

    %4
    dod?4 r8 sold si4 si8 do?\mbreak
    lad4 lad r r8 fad
    dod' dod dod re si4 si

    %7
    r8 si16 si fad8 fad16 mi fad4 fad\mbreak
    r8 fad la sol sol sol la sib
    sib?2 r4 fad'\mbreak

    %10
    sib,16[do sib do] re[do sib la] sold[la sold la] si? [la sold fad]
    mi[sold fad sold] la2 sold4
    la1

}

VItesto = \lyricmode {

    Sì di -- ce -- a l’a -- mator _ mu -- to ri -- masto _

     del bel -- l’i -- dolo _ suo leg -- gendo _ il no -- me.

     Ma to -- sto, non so co -- me, su le la -- bra do -- len -- ti

     tor -- nar gli spir -- ti_a ri -- pi -- gliar gl’ac -- cen - - - - - -  ti.

}

VIbcn = \relative do {

    si1
    lad
    si2~si

    %4
    mi1
    fad~
    fad2 red~

    %7
    red1~\mbreak
    red2 mi
    re?1\mbreak

    %10
    re2~re~
    re4 do8 la mi2
    la1

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown





}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 4 = 70
    s1*12
    \bar "||"

}

VIvoce = {
    \new Voice = "dicea"
    \VIglobal
    <<\VIvocen\forma>>
}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn\forma\VIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

VIIvocen = \relative do'' {

    \autoBeamOff

    R1*3
    r4 la8 si do la mi' la\mbreak
    sol la16[sol] fa8 sol16[fa] mi8 fa16[mi] re8 mi16[re]

    %6
    do8 re16[do] si8 la sold la do8. si16\mbreak
    la8.[do16] si[do la si] do[re mi fa] re[mi do re]
    mi1~\mbreak

    %9
    mi~
    mi8 la, mi' la sol la16[sol] fa8 sol16[fa]\mbreak
    mi8 fa16[mi] re8 mi16[re] do8 re16[do] si8 la

    %12
    sold la do8. si16 la4 la'8 sol\mbreak
    fad? mi red mi fad sol red mi
    fad sol red mi fad sol red mi\mbreak

    %15
    fad sol sol8. fad16 mi8 mi16[re] do8. si16
    si4 r r red8 mi\mbreak
    fad sol red mi fad sol red mi

    %18
    fad sol sol8. fad16 mi4 r\mbreak
    r2 r4 la,8 si
    do la mi' la sol la16[sol] fa8 sol16[fa]\mbreak

    %21
    mi8 fa?16[mi] re8 mi16[re] do8 re16[do] si8 la
    sold la do8. si16 la8.[do16] si[do la si]\mbreak
    do[re mi fa] re[mi do re] mi2~

    %24
    mi1~
    mi2~mi8 la, mi' la
    sol la16[sol] fa8 sol16[fa] mi8 fa16[mi] re8 mi16[re]\mbreak

    %27
    do8 re16[do] si8 la sold la do8. si16
    la4 si8 la\mbreak sold la do8. si16
    la4 r r2

}

VIItesto = \lyricmode {

    Per te, Fil -- li,_o -- gni mar -- tire, _ ch’in me de -- sta_un pu -- ro_af -- fetto, _

    vo -- len -- tieri _ sof -- fri -- rò, - - - - o -- gni mar -- tire, _ ch’in me

    de -- sta_un pu -- ro_af -- fetto, _ vo -- len -- tieri _ sof -- fri -- rò,

    ma quel cor do -- vrà sof -- frire, _  se quel cor, ch’a -- vea nel pet -- to,

    il tuo bel me l’in -- volò _ me l’in -- vo -- lò se quel cor, ch’a -- vea nel pet -- to,

    il tuo bel me l’in -- volò. _

    Per te, Fil -- li,_o -- gni mar -- tire, _ ch’in me de -- sta_un pu -- ro_af -- fetto, _

    vo -- len -- tieri _ sof -- fri -- rò, - - - - o -- gni mar -- tire, _ ch’in me

    de -- sta_un pu -- ro_af -- fetto, _  vo -- len -- tieri _ sof -- fri -- rò,

    vo -- len -- tieri _ sof -- fri -- rò.

}

VIItestobis = \lyricmode {

    Per te bel -- la_in do -- glie_a -- mare _  que -- sto se -- no tor -- men -- tato _

    vo -- len -- tieri _ pe -- ne -- rà, - - - -

    in do -- glie_a -- mare _  que -- sto se -- no tor -- men -- tato _

    vo -- len -- tieri _ pe -- ne -- rà, ma quel sen po -- trà pe -- nare, _

    se quel sen, che t’ha ce -- lato, _ sol che gio -- ie_e -- gli non ha e -- gli non ha

    se quel sen, che t’ha ce -- lato, _ sol che gio -- ie_e -- gli non ha.

    Per te bel -- la_in do -- glie_a -- mare _  que -- sto se -- no tor -- men -- tato _

    vo -- len -- tieri _ pe -- ne -- rà, - - - -

    in do -- glie_a -- mare _  que -- sto se -- no tor -- men -- tato _

    vo -- len -- tieri _ pe -- ne -- rà,  vo -- len -- tieri _ pe -- ne -- rà.

}

VIIbcn = \relative do' {

    r4 la8 si do[la] mi'[la]
    sol la16 sol fa8 sol16 fa mi8 fa16 mi re8 mi16 re
    do8 re16 do si8 la sold[la] re, mi

    %4
    la,4 r la'8 si do[la]\mbreak
    si sol la[si] do[la] si sold
    la si16 la sol?8 fad mi do re[mi]\mbreak

    %7
    la, la' sold[mi] la sold fa mi16 re
    do4 la'8 si do[la] mi' la\mbreak
    sol la16 sol fa8 sol16 fa mi8 fa16 mi re8 mi16 re

    %10
    do8 la do[re] mi do re[si]\mbreak
    do la si[sold] la si16 la sold8 fad
    mi do re[mi] la4 do8 si\mbreak

    %13
    la sol fad[sol] red mi fad[sol]
    red mi fad sol red mi fad[sol]\mbreak
    la sol16 la si8 si, mi4 r

    %16
    r8 mi'16 re] do8. si16 si4 fad8 sol\mbreak
    red mi fad[sol] red[mi] fad sol
    la sol16 la si8 si, mi4 la8 si\mbreak

    %19
    do la mi'[la] sol la16 sol fa8 sol16 fa
    mi8 do4 si16 la si8 sol la[si]\mbreak
    do la si[sold] la si16 la sol?8 fa

    %22
    mi do re[mi] la, la' sold[mi]\mbreak
    la sol fa mi16 re do4 la'8 si
    do la mi'[la] sol la16 sol fa8 sol16 fa\mbreak

    %25
    mi8 fa?16 mi re8 mi16 re do8 la do[re]
    mi do re[si] do la si[sold]\mbreak
    la si16 la sol?8 fa mi do re[mi]

    %28
    la si16 la sol8 fa\mbreak mi do re[mi]
    la4 r r2

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 2 = 45
    s1*29
    \bar "||"

}

VIIvoce = {
    \new Voice = "soprano"
    \VIIglobal
    <<\VIIvocen\forma>>
}

VIIbc = {
    \VIIglobal
    \clef tenor
    <<\VIIbcn\forma\VIIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

VIIIvlIn = \relative do'' {

    r8 la mi'[la] sol16 fa mi fa sol la sol la
    fa mi re mi fa sol fa sol mi re do re si8 la\mbreak
    si16 la sol la si do si do la sol fa sol la si la si

    %4
    sol fa mi fa sol la sol la fa8 re fa4\mbreak
    mi r r8 mi si' mi
    re16 do si do re mi re mi do si la si do re do re

    %7
    mi fa sol fa mi8 do re16 do si do re8 si\mbreak
    do16 do' si la la8. sold16 la2

}

VIIIvlIIn = \relative do'' {

    r2 r8 mi, si'[mi]
    re16 do si do re mi re mi do re mi fa sol la fa sol\mbreak
    mi8 mi mi[mi] mi mi re[re]

    %4
    do do do[do] si do do8. si16\mbreak
    do4 r r2
    r r8 la mi' la

    %7
    sol16 fa mi fa sol la sol la fa mi re mi fa sol fa sol\mbreak
    mi8 re16 do si4 la2

}

VIIIbcn = \relative do {

    R1
    r2 r8 la mi' la\mbreak
    sol16 fa mi fa sol la sol la fa mi re mi fa sol  fa sol

    %4
    mi re do re mi fa mi fa re8 do re4\mbreak
    do8 la mi'[la] sol16 fa mi fa sol la sol la
    fa8 re fa[sol] la do16 si la8 sol16 fa

    %7
    mi8 do mi[fa] re fa16 mi re8 sol\mbreak
    do, re mi mi, la2

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 2 = 45
    s1*8
    \bar "||"

}


VIIIvlI = {
    \VIIIglobal
    <<\VIIIvlIn\forma>>
}

VIIIvlII = {
    \VIIIglobal
    <<\VIIIvlIIn\forma>>
}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn\forma\VIIIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


IXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

IXvocen = \relative do'' {

    \autoBeamOff

    r4 mi dod8. dod16 dod8 la
    mi' mi mi fad sol4 sol8 fad\mbreak
    re re r la re4 re8 mi16 fad

    %4
    dod8 dod dod re mi4 mi8 fad\mbreak
    re re r fad re re mi fad
    dod4 dod8 dod16 dod la8 la r dod\mbreak

    %7
    re dod si16[dod la si] dod8 si la sold
    fad [sold16 la] sold8. [fad16] mid4 fad8 sold8\mbreak
    la16 [sold si la] sold4 fad r8 fad'

    %10
    sol fad mi16[fad re mi] fad8 mi re dod\mbreak
    si8[dod16 re] dod8.[si16] lad4 si8 dod
    re16[dod mi re] dod4 si2\mbreak

    %13
    R1*2

}

IXtesto = \lyricmode {

    Sì bar -- baro _ spie -- tato _  con -- tro me s’ar -- mi_il Fa -- to,

    sian pur cru -- de_e ru -- belle _  a miei dan -- ni le stel -- le

    che di lor non po -- trà l’a -- spro te -- nore _

    il no -- do scior - re,_on -- de m’av -- vin - - se a -- mo - re,

     il no -- do scior - re,_on -- de m’av -- vin - - se a -- mo - re.

}

IXbcn = \relative do {

    la'1~
    la
    re,

    %4
    lad
    si
    mid2 fad

    %7
    si,8 dod re4 dod dod'~
    dod si~ si8 la16 sold la8 si
    dod si dod[dod,] fad4 r8 re

    %10
    mi fad sol4 fad fad~\mbreak
    fad mi~mi8 re16 dod re8 mi
    fad mi fad[fad,] si4 mi8. fad16\mbreak

    %13
    sol8 mi dod'[la] si mi, fad[dod]
    re si fad'[fad,] si4 r

}

IXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key si\minor
    \tempo 4 = 70
    s1*14
    \bar "||"

}

IXvoce = {
    \new Voice = "barbaro"
    \IXglobal
    <<\IXvocen\forma>>
}

IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn\forma\IXbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


Xglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

Xvocen = \relative do'' {

    \autoBeamOff

    r4 si8. dod16 re8 si sol' mi
    fad si, r4 r8 si sol' mi\mbreak
    fad si, mi re mi si do si

    %4
    do si r fad' sol fad fad8. mi16(\mbreak
    fad4) re8 la si la si la
    si la mi' si dod si dod si\mbreak

    %7
    dod si r dod16 dod re8[mi16 dod] re8[mi16 dod]
    re8[mi16 dod] si8[dod16 la] si8[dod16 la] sold8[la16 fad]\mbreak
    mid8 fad r si dod re  la8. sold16(

    %10
    fad4) r8 si dod re la8. sold?16(\mbreak
    fad2) r
    r4 si8. dod16 re8 si sol' mi\mbreak

    %13
    fad8 si, r4 r8 si sol' mi
    fad si, mi re mi si do si\mbreak
    do si r fad' sol fad fad8. mi16(

    %16
    fad4) r8 fad16 fad sol8 do, do do\mbreak
    do lad si4. mi8 re8. dod?16(
    si4) si4 si8 mi8 re8. dod16(\mbreak

    %19
    \footnote #' (1 . 3) \markup\column\smaller {"  ""b1 a conclusione della seconda strofa"} si4) r r2

}

Xtesto = \lyricmode {

    Il ri -- gor di tan  -- te pe -- ne di tan  -- te pe -- ne for -- se_a te ras -- sembra _ po -- co,

    ras -- sembra _ po -- co. Vi -- vo_in mez -- zo_al -- le ca -- tene, _

    vi -- vo_in mez -- zo_al -- le ca -- tene, _

    son ca -- te - - - - - - ne e son di fo -- co, e son di fo -- co.

    Il ri -- gor di tan  -- te pe -- ne di tan  -- te pe -- ne for -- se_a te ras -- sembra _ po -- co,

    ras -- sembra _ po -- co, - a te ras -- sembra _ po -- co po -- co po -- co po - co po  -- co.

}

Xtestobis = \lyricmode {

    Vie -- ni dun -- que_e_i lac -- ci spezza, _ e_i lac -- ci spezza, _

    ch’han tur -- bato_i _  miei  ri -- posi, _ i  miei  ri -- po -- si,

    per mo -- strar la lor fie -- rezza _ per mo -- strar la lor fie -- rezza _

    ba -- sta dir: lac - - - - - ci  lac -- ci_a -- moro - si,  lac -- ci_a -- moro - si.

    Vie -- ni dun -- que_e_i lac -- ci spezza, _ e_i lac -- ci spezza, _

    ch’han tur -- bato _ ch’han tur -- bato _ i  miei  ri -- po -- si,

    ch’han tur -- bato _ ch’han tur -- bato_i _ miei  ri -- po -- si,  i  miei  ri -- po -- si.

}

Xbcn = \relative do {

    r4 re8. dod16 si8 si' mi,[la]
    re,4 sol8 mi fad si, mi[la]\mbreak
    re, sol mi[fad] sol re mi[re]

    %4
    mi fad sol[fad] mi re sol[sol,]\mbreak
    fad4 r8 fad' sol fad16 re sol8 fad16 re
    sol8 re r sold la sold16 mi la8 sold16 mi\mbreak

    %7
    la8 mi r8 lad si lad si[lad]
    si mi,16 la sold8 la sold la mi[fad]\mbreak
    dod re16 dod \once\stemUp si re' dod si la8 si dod[dod,]

    %10
    fad si dod re dod si dod[dod,]\mbreak
    fad4 si,8. dod16 re8 si sol'[mi]
    fad si, re8. dod16 si8 si' mi,[la]\mbreak

    %13
    re,4 sol8 mi fad si, mi[la]
    re, sol mi[fad] sol re mi[re]\mbreak
    mi fad sol[fad] mi re sol[sol,]

    %16
    fad4 r8 re' mi4. fad8\mbreak
    sol4. fad16 mi re8 mi fad[fad,]
    si si'16 la sol8 fad16 mi re8 mi fad[fad,]\mbreak

    %19
    \footnote #' (1 . 3) \markup\column\smaller {"  ""b1 a conclusione della seconda strofa""  "} si4 r r2

}

Xbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key si\minor
    \tempo 2 = 40
    s1*19
    \bar "||"

}

Xvoce = {
    \new Voice = "soprano"
    \Xglobal
    <<\Xvocen\forma>>
}

Xbc = {
    \Xglobal
    \clef bass
    <<\Xbcn\forma\Xbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


XIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

XIvocen = \relative do'' {

    \autoBeamOff

    r8 sol si re sol4. sol8
    sol
    re16 re re8 mi do do re mi
    do4 do8 si si4 si
    r si8 sol re' re re do
    mi mi r mi fad4. sol8
    sib,4(la) sol2

}

XItesto = \lyricmode {

    Co -- sì sfo -- ga -- va il tor -- men -- tato_a - mante _  i suoi fol -- li de -- si -- ri

    e nar -- rava _ ad un tron -- co i suoi mar -- ti -- ri.

}

XIbcn = \relative do {

    sol'1~
    sol~
    sol~
    sol2 si,
    do~do4 si
    re2 sol,

}

XIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 60
    s1*6
    \bar "||"

}

XIvoce = {
    \new Voice = "soprano"
    \XIglobal
    <<\XIvocen\forma>>
}

XIbc = {
    \XIglobal
    \clef bass
    <<\XIbcn\forma\XIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


XIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

XIIvlIn = \relative do'' {

    r4 si'8. lad16 si8 fad sol[mi]
    fad fad r16 fad mi re dod8 re re dod
    si fad' sol4 r8 mi fad4~
    fad fad16. fad32 mi16 re dod8 re re dod
    si sol' do,8. do16 do8 si  r16 fad' mi re
    dod8 re re dod si2

}

XIIvlIIn = \relative do'' {

    r4 si8 dod re[re] re dod
    re re r16 re dod si lad8 si si lad
    si4 r8 si dod4. lad8\mbreak
    si4 re16. re32 dod16 si lad8 si si lad
    si r mi8. fad16 sol8 sol r16 re dod si
    lad8 si si lad si2

}

XIIbcn = \relative do {

    r4 si8 fad' si,4 la
    re,8 re' r16 re mi mi fad8 sol mi[fad]
    si,2 r4 r8 fad'\mbreak
    si,4 re16. re32 mi16. mi32 fad8 sol mi[fad]
    si,4 la sol r16 re' mi mi
    fad8 sol mi fad si,2

}

XIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key si\minor
    \tempo 2 = 40
    s1*6
    \bar "||"

}


XIIvlI = {
    \XIIglobal
    <<\XIIvlIn\forma>>
}

XIIvlII = {
    \XIIglobal
    <<\XIIvlIIn\forma>>
}

XIIbc = {
    \XIIglobal
    \clef bass
    <<\XIIbcn\forma\XIIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


XIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

XIIIvlIn = \relative do'' {

    r2 r4 si
    mi2. re4
    mi4. re8 do4 si

    %4
    la sol8 fad mi sol la si\mbreak
    do mi4 red8 mi si do re?
    mi sol, la si do4 sol

    %7
    la8 si do2 do4\mbreak
    do si r sol8 la
    si4. la8 sol la si4

    %10
    mi,2 re
    r4 sib'?8 do re4 re8 do\mbreak
    sib4 la la4. si?16 do!

    %13
    si4. do16 re do8 re mi red16 dod?
    red4. do16 si mi4 lad,
    si8 do red mi16 fad sol4 fad\mbreak

    %16
    mi fad4. red16 dod red8 mi16 fad
    sol8 fad16 mi la8 sol fad2~
    fad sold4 la8 si

    %19
    la la, si4~si8 la sold? fad\mbreak
    mi fad sold la si4 si
    dod2 re

    %22
    mi red8 mi fad sol16 la
    si8 si,16[dod] red8 mi mi red dod4\mbreak
    fad, sold8 la si2

    %25
    la4. si16 dod re4 mi8 fa
    mi4. mi,8 fad?2
    si4. do8 la sol fad sol16 la\mbreak

    %28
    si2 mi,8 fad sold la
    si4. la16 si do4. mi8
    red4 mi2 red4

    %31
    mi1

}

XIIIvlIIn = \relative do'' {

    r4 mi, si'2~
    si4 la sol fad
    sol4. fad8 mi4. mi8

    %4
    mi mi'4 red8 mi4. sold,8\mbreak
    la4 sol?8 fad mi sol la si
    do mi, fad sol la si do4

    %7
    do8 re mi4 la,2\mbreak
    sol r4 mi8 fad
    sol4. fad8 mi fad sol4~

    %10
    sol sol sol fad
    r4 sol8 la sib4 la\mbreak
    sol8 fad mi4 fad8 sol la4

    %13
    re, si' la8 si dod4
    si si4. la16 sol fad8 mi
    fad4. sol16 la si4. si8\mbreak

    %16
    si4. la8 sol fad16 mi fad8 sol16 la
    si8 dod red mi red4 dod
    red mi8 fad si,4 la8 sold

    %19
    la4 si do? si~\mbreak
    si8 la si do sold4. fad8
    mi4 fad4. fad8 fad sol

    %22
    mi2 fad8 mi red16 red' mi fad
    sol8 sol, la si do4 dod\mbreak
    si si4. dod?16 si la8 sold

    %25
    dod4. re16 mi fa8 la,16 si dod8 re
    dod4. si8 la4 si~
    si8 la sol4 la la~\mbreak

    %28
    la8 sold16 fad sold8 la16 si do8 si16 la re8 do
    sold la si2 la4~
    la8 sol sol fad16 mi fad2

    %31
    mi1

}

XIIIvocen = \relative do'' {

    \autoBeamOff

    R1
    r2 r4 si
    mi2. mi4

    %4
    r8 do si la sol4 mi\mbreak
    r8 do' si la sol4 mi
    r4 mi'2 fa8 sol

    %7
    do,4 do8 re mib2~\mbreak
    mib4 re r si~
    si do8 re sol,4 sol8 la

    %10
    sib2. la4
    r re4. mi8 fa4\mbreak
    re dod re2~

    %13
    re8 [do?16 si] mi4.  re16 [dod] fad?4~
    fad8[mi16 red] sol4. fad8 mi4~
    mi red r si8 la\mbreak

    %16
    sol4 fad8 mi si'2
    si r4 fad'8 mi
    red4 dod8 si mi2

    %19
    mi4 mi, mi2~\mbreak
    mi mi4 sold
    lad2~lad8[sold16 fad] si4~

    %22
    si lad si2
    r r4 fad'8 mi\mbreak
    red4 dod8 si mi2

    %25
    mi4 la, la2
    la4 dod red2~
    red8[dod16 si] mi2 red4\mbreak

    %28
    mi1
    r4 mi re?2
    si1~

    %31
    si

}

XIIItesto = \lyricmode {

    A -- man -- ti in -- sani,_a - man -- ti  in -- sani,_a - man -- ti  ah quan -- te vol -- te, ahi las -- si,

    ah quan -- te vol -- te, ahi las -- si, o -- don i vo -- stri pian - - - - - - ti

    ma -- sche -- rati _ d’af -- fet -- to ma -- sche -- rati _ d’af -- fet -- to i tron -- chi e_i sas - - si,

    ma -- sche -- rati _ d’af -- fet -- to i tron -- chi e_i sas - - si, e_i sas -- si.

}

XIIIbcn = \relative do {

    mi2. re4
    do2 si4 si'8 la
    sol4 mi la sold

    %4
    la si r8 mi, do si\mbreak
    la4 si mi4. re8
    do4. si8 la4 mi'

    %7
    fa mi4 fa2\mbreak
    sol r4 sol8 fad?
    mi4 si do si

    %10
    do2 re
    r4 sib'8 la sol4 fa\mbreak
    sol la re, fad,

    %13
    sol sold la lad
    si2 do4 dod
    si si'8 la sol4 red\mbreak

    %16
    mi re8 do si4 si'8 la
    sol4 fad8 mi si'4 lad
    si la? sold fad8 mi

    %19
    la4 sold la mi8 re\mbreak
    do4 si8 la mi'4. re8
    dod4 fad8 mi re4. dod16 si

    %22
    dod2 si4 si'8 la
    sol4 fad8 mi la4 lad\mbreak
    si la? sold fad8 mi

    %25
    la4 la8 sol fa4 mi8 re
    la'4. sol8 fad?4 si8 la
    sol4. fad16 mi fad2\mbreak

    %28
    mi4 mi8 re do4 si8 la
    mi'4 sold la2
    si1

    %31
    mi,

}

XIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 2 = 40
    s1*31
    \bar "||"

}


XIIIvlI = {
    \XIIIglobal
    <<\XIIIvlIn\forma>>
}

XIIIvlII = {
    \XIIIglobal
    <<\XIIIvlIIn\forma>>
}

XIIIvoce = {
    \new Voice = "soprano"
    \XIIIglobal
    <<\XIIIvocen\forma>>
}

XIIIbc = {
    \XIIIglobal
    \clef bass
    <<\XIIIbcn\forma\XIIIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


XIVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

XIVvocen = \relative do'' {

    \autoBeamOff

    R4.*8
    r8 r si
    mi fad16 mi red8

    %11
    mi4.
    R4.*4
    r8 r si

    %17
    mi fad16 mi red8
    mi4 mi8
    re mi16 re do8

    %20
    si4 re8\mbreak
    re mi16 re mi8
    fad4 fad8

    %23
    si, dod16 si lad8
    si4 fad'8
    si, dod16 si lad8\mbreak

    %26
    si4 fad'8
    sol mi16 re dod8
    si4 mi8

    %29
    fa fa16 mi red8
    mi4 mi8\mbreak
    fa fa16 mi red8

    %32
    mi4 mi8
    fad? la16 sol fad8
    mi4 mi8

    %35
    fad la16 sol fad8\mbreak
    mi4.

}

XIVtesto = \lyricmode {

    Tal vol -- ta l’a -- mo -- re tal vol -- ta l’a -- mo -- re

    si glo -- ria d’u -- di -- re un mi -- sero _ co -- re un mi -- sero _ co -- re

    pia -- gato _  langui - re pia -- gato _  langui - re un mi -- sero _ co -- re

    pia -- gato _  langui - re pia -- gato _  langui - re pia -- gato _  langui - re.

}

XIVtestobis = \lyricmode {

    Tal vol -- ta Cu -- pi -- do  tal vol -- ta Cu -- pi -- do tri -- onfa _ ve -- de -- re

    un co -- re più fi -- do un co -- re più fi -- do sve -- nato _ cade - re

    sve -- nato _ cade - re un co -- re più fi -- do sve -- nato _ cade - re

    sve -- nato _ cade - re sve -- nato _ cade - re.

}

XIVbcn = \relative do {

    r8 r si
    mi fad16 mi red8\noBeam
    mi4 si'8

    %4
    do do16 si la8\noBeam
    si4 sol8
    la la16 sol fad8\noBeam

    %7
    mi4 sol8\mbreak
    la16 sol la8 si\noBeam
    mi,4.

    %10
    r8 r si
    mi fad16 mi red8\noBeam
    mi4 si'8

    %13
    do do16 si la8\noBeam
    si4 sol8\mbreak
    la16 sol la8 si\noBeam

    %16
    mi,4 re8
    do4 si8
    mi4 do8

    %19
    si4 la8
    sol4 sol'8\mbreak
    fad4 mi8

    %22
    re4 re8
    mi4 fad8
    sol4 re8

    %25
    mi4 fad8\mbreak
    sol4 re8
    mi4 fad8

    %28
    si4 sol8
    la4 si8
    do4 sol8\mbreak

    %31
    la4 si8
    do4 sol8
    la fad si

    %34
    do4 sol8
    la fad si\mbreak
    mi,4.

}

XIVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 3/8
    \key mi\minor
    \tempo 2. = 45
    s4.*36
    \bar "||"

}

XIVvoce = {
    \new Voice = "soprano"
    \XIVglobal
    <<\XIVvocen\forma>>
}

XIVbc = {
    \XIVglobal
    \clef bass
    <<\XIVbcn\forma\XIVbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


XVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

XVvlIn = \relative do'' {

    r8 r si
    mi fad16 mi red8\noBeam
    mi4 sol8

    %4
    sol la16 sol fad8\noBeam
    sol4 re8\mbreak
    re mi16 re mi8\noBeam

    %7
    fad4 fad8
    si, dod16 si lad8\noBeam
    si4 fad'8

    %10
    sol mi16 re dod8\noBeam
    si4 si'8\mbreak
    mi, fad16 mi red8\noBeam

    %13
    mi4 si'8
    do\noBeam  la16 sol fad8\noBeam
    mi4 si'8

    %16
    do la16 sol fad8\noBeam
    mi4.

}

XVvlIIn = \relative do'' {

    r8 r sol
    sol la16 si la8\noBeam
    sol4 mi'8

    %4
    re mi16 re do8\noBeam
    si4 si8\mbreak
    la si16 la sol8\noBeam

    %7
    la4 la8
    sol la16 sol fad8\noBeam
    mi\noBeam si'16 dod re8\noBeam

    %10
    si4 lad8
    si4 mi8\mbreak
    do re16 do si8\noBeam

    %13
    do mi16 fad sol8\noBeam
    mi fad16 mi red8\noBeam
    mi4 sol8

    %16
    mi fad16 mi red8\noBeam
    mi4.

}

XVbcn = \relative do {

    r8 r mi
    do4 si8
    mi4 do8

    %4
    si4 la8
    sol4 sol'8\mbreak
    fad4 mi8

    %7
    re4 re8
    mi4 fad8
    sol4 re8

    %10
    mi fad4
    sol mi8\mbreak
    la4 si8

    %13
    do4 sol8
    la4 si8
    do4 sol8

    %16
    la4 si8
    mi,4.

}

XVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 3/8
    \key mi\minor
    \tempo 2. = 45
    s4.*17
    \bar "||"

}


XVvlI = {
    \XVglobal
    <<\XVvlIn\forma>>
}

XVvlII = {
    \XVglobal
    <<\XVvlIIn\forma>>
}

XVbc = {
    \XVglobal
    \clef bass
    <<\XVbcn\forma\XVbfn>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


XVIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

XVIvlIn = \relative do'' {

    r8 si' si si si4 r
    R1
    r8 sol fad re sol si si la

    %4
    si4 r r r8 mi,
    red mi fad red sol [red mi8. fad16]\mbreak
    fad4 r r2

    %7
    r r4 r8 fad
    re si fad'[fad] sol sol16 fad mi4~
    mi8 fad16 mi re8 dod?16 re mi fad re mi dod!4

    %10
    si r8 mi do? la mi'4\mbreak
    R1*3
    r4 r8 la fad sol la[la]

    %15
    sol16 la fad sol mi8 mi re4 r\mbreak
    r2 r8 la' fad16 sol fad sol
    mi8 mi re16 mi re mi dod8 dod re4\mbreak

    %18
    r8 fad fad fad r2
    r r8 fad fad mid
    fad re dod[lad] re lad si8. dod16\mbreak

    %21
    dod4 r r8 fad fad mi
    fad fad fad fad fad4 fad8 mi
    fad4 r r2\mbreak

    %24
    r r4 r8 dod
    la fad dod'[dod] dod re16 dod si4~
    si8. si16 la8 sol16 la si8 la sold8. fad16\mbreak

    %27
    fad4 r8 si' sold mi si'4
    R1*3\mbreak
    r4 r8 mi, do re mi[mi]

    %32
    re16 mi do re si8 si la4 fad'8 fad
    re4 r8 re16 re sol4 mi\mbreak
    R1

    %35
    r4 r8 si' sol16 la sol la fad8 fad\mbreak
    mi16 fad mi fad red8 red mi4 r8 la
    fad fad si[si] sol si mi,[mi]\mbreak

    %38
    red mi mi[red] mi4 r

}

XVIvlIIn = \relative do'' {

    r8 sol' fad red sol4 r
    r2 r4 r8 mi\mbreak
    re si' si si si sol fad mi

    %4
    red mi fad red r2
    r8 si' si si si4 si8 la\mbreak
    si4 r r2

    %7
    R1
    r4 re,8 re sol16 sol, la si dod4\mbreak
    fad16 fad, sol la si8 lad16 si dod?8 si si[lad]

    %10
    si4 r mi8 do? la[mi']\mbreak
    R1*3
    r2 r4 r8 la,

    %15
    si re re[dod] re4 r\mbreak
    R1
    r8 la' fad16 sol fad sol mi8 mi re4\mbreak

    %18
    r8 re dod lad r2
    R1
    r8 fad' fad fad fad4 fad8 mid\mbreak

    %21
    fad8 fad fad fad re r r4
    r r8 dod re lad si8.dod16
    dod?4 r r2\mbreak

    %24
    R1
    r4 la8 la re16 re mi fad sol4
    si,16 do re mi fad8 mi16 fad sold8 fad fad[mid]\mbreak

    %27
    fad4 r si8 sold mi[si']
    R1*3
    r2 r4 r8 mi,

    %32
    fad la la[sold] la4 re,8 re
    si4 r8 si16 la sol8 la16 si dod4\mbreak
    R1

    %35
    r2 r4 r8 si'\mbreak
    sol16 la sol la fad8 fad mi4 r8 dod
    re re re[re] mi re la'[si]\mbreak

    %38
    si do si4 si r

}

XVIvocen = \relative do'' {

    \autoBeamOff

    r4 r8 si sol mi si' mi
    red4 r8 fad sol red mi8.[fad16]\mbreak
    fad4 r r2

    %4
    r4 r8 fad sol red mi[fad]
    fad4 r r2\mbreak
    r4 fad8 fad sol4 do,8 re16[mi]

    %7
    fad8 fad r si, mi16[fad] sol[fad] re8. dod?16(
    si4) r r2\mbreak
    r r4 r8 mi

    %10
    red si mi mi r4 la8 la\mbreak
    la[sol16 fad] sol8[fad16 mi] fad4 fad8 fad

    %12
    fad[mi16 re] mi4~mi8[re16 dod?] re8[mi16 fad]\mbreak
    sol8[fad16 sol] dod,8 re16[mi] fad8 fad r la
    sol16[la] fad[sol] mi4 re r

    %15
    r r8 la' fad re sol16[la fad sol]\mbreak
    mi[la sol la] fad[sol fad sol] mi4 re
    R1\mbreak

    %18
    r4 r8 fad re si fad' si,
    lad4 r8 dod re lad si8[dod]
    dod?4 r r2\mbreak

    %21
    r4 r8 dod re lad si[dod]
    dod?4 r r2
    r4 dod?8 dod re4 sol,8 la16[si]\mbreak

    %24
    dod8 dod r fad, si16[dod] la[si] sold4
    fad r r2
    r r4 r8 dod'\mbreak

    %27
    lad fad si si r4 mi8 mi
    mi8[re16 dod?] re8[dod16 si] dod4 dod8 dod
    dod?[si16 la] si4. la16[sold?] la8[si16 do?]

    %30
    re8[do16 re] sold,8 la16 si do8 do r mi\mbreak
    re16[mi] do[re] si4 la r
    r r8 mi' dod la re re

    %33
    r re16 do si8 do16 re mi4 r8 dod\mbreak
    fad16[sol] mi[fad] re8 re16 fad sol[la] fad[sol] mi8 mi16 mi
    la16[si] sol[la] fad4 mi r\mbreak

    %36
    r4 r8 si sold mi la la
    r fad' sol16[la] fad[sol] mi[mi fad sol] la[si sol la]\mbreak
    fad[sol la sol] fad4 mi r

}

XVItesto = \lyricmode {

    Ma_il cor d’o -- gni do -- lor sia pur con -- ten -- to,  sia pur con -- ten -- to,

    ch’il pe -- nar per a -- more _ è go -- di -- men -- to, è go -- di -- men -- to,

    ch’il pe -- nar - - ch’il pe -- nar - - - per a -- more _  è go -- di -- men -- to, è go -- di -- men - - - to.

    Ma_il cor d’o -- gni do -- lor sia pur con -- ten -- to,  sia pur con -- ten -- to,

    ch’il pe -- nar per a -- more _ è go -- di -- men -- to, è go -- di -- men -- to,

    ch’il pe -- nar - - ch’il pe -- nar - - - - - per a -- more _ è go -- di -- men -- to, è go -- di -- men -- to,

    ch’il pe -- nar per  a -- mor è go -- di -- men -- to, è go -- di -- men -- to,

    è go -- di -- men -- to, è go -- di -- men -- to, è go -- di -- men - - - to.

}

XVIbcn = \relative do {

    r8 mi red si mi4 red8 do
    si dod? red[si] mi si do?4\mbreak
    si8 mi red si mi4 red8 do

    %4
    si dod red si mi si do?4
    si8 dod? red si mi si do?4\mbreak
    si si'8 la16 si mi,8 fad16 sol la4

    %7
    re,8 mi16 fad sol4 mi fad
    si, si'8 la16 si mi,8 fad16 sol la4\mbreak
    re,8 mi16 fad sol4 fad fad

    %10
    si,8 si' sold[mi] la4 la,\mbreak
    si4. do8 re4. re8
    sol4. fad16 mi fad4. fad8\mbreak

    %13
    mi4 la, re8 mi fad mi16 re
    sol8 re la'[la,] re mi fad mi16 re
    sol8 re la'[la,] r re si sol\mbreak

    %16
    dod4 re la re
    la re la re\mbreak
    r8 si' lad fad si4 lad8 sol

    %19
    fad sold lad[fad] si fad sol?4
    fad8 si lad [fad] si fad sol4\mbreak
    fad8 sold? lad fad si fad sol?4

    %22
    fad8 sold lad[fad] si8 fad sol?4
    fad fad8 mi16 fad si,8 dod?16 re mi4\mbreak
    la,8 si16 dod? re4 si dod!

    %25
    fad, fad'8 mi16 fad si,8 do16 re mi4
    la,8 si16 do re4 si dod\mbreak
    fad,8 fad' red [si] mi4 mi,

    %28
    fad4. sold8 la4 la'
    re,4. do16 si do4. do8
    si4 mi la,8 si do si16 la\mbreak

    %31
    re8 la mi'4 la,8 si do si16 la
    re8 la mi'[mi,] la la' fad[re]
    sol4 r8 sol16 fad mi8 fad16 sol la4\mbreak

    %34
    fad si8 la sol4 do8 si
    la mi si4 mi si\mbreak
    mi si mi8 mi do[la]

    %37
    re re si[sol] do si la[mi]\mbreak
    si' la si4 mi, r

}

XVIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 2 = 40
    s1*38
    \bar "|."

}

XVIvlI = {
    \XVIglobal
    <<\XVIvlIn\forma>>
}

XVIvlII = {
    \XVIglobal
    <<\XVIvlIIn\forma>>
}

XVIvoce = {
    \new Voice = "soprano"
    \XVIglobal
    <<\XVIvocen\forma>>
}

XVIbc = {
    \XVIglobal
    \clef bass
    <<\XVIbcn\forma\XVIbfn>>
}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \header {
        subtitle = \markup {Cantata ”Zeffiretto che indrizzi il tuo volo” [14-12-1702]}
        composer = \markup\center-column {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] [Aria] Andante ”Zeffiretto che indrizzi il tuo volo”}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 3/8\override MensuralStaff.TimeSignature.style = #'numbered r4.^\markup \center-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \Ivoce
                \new Lyrics \lyricsto "volo" \Itesto
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[2.] [Recitativo]  ”E perché in quel gelato cuor”}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \time 4/4 \key fa\major r4^\markup \center-align"[Soprano]" mib''8}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \IIvoce
                \new Lyrics \lyricsto "cuor" \IItesto
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##tå
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

    \markup \huge {[3.] Aria All[egr]o ”Auretta cara mia doglia amara”}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \time 12/8\override MensuralStaff.TimeSignature.style = #'numbered \key fa\major r1.^\markup \center-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \IIIvoce
                \new Lyrics \lyricsto "cara" \IIItesto
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##tå
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

    \header {
        subtitle = \markup {Cantata per Soprano: ”Già l'alba luminosa”}
        composer = \markup\center-column {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] [Recitativo-arioso] ”Già l'alba luminosa”}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 4/4 r4^\markup \center-align"[Soprano]" mi''2}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \IVvoce
                \new Lyrics \lyricsto "alba" \IVtesto
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[2.] [Aria] Largo }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff  = "soprano" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 3/2\override MensuralStaff.TimeSignature.style = #'numbered r1.^\markup \center-align"[Soprano]" }
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \Vvoce
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\Vtestobis}
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\Vtesto}
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup \huge {[3.] Rec[itativ]o ”Si dicea l'amator”}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 4/4 r4^\markup \center-align"[Soprano]" si'8 re''}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \VIvoce
                \new Lyrics \lyricsto "dicea" \VItesto
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[4.] Aria [\italic\smaller {seconda strofa dopo il Ritornello}]}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 4/4 r1^\markup \center-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \VIIvoce
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\VIItesto}
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\VIItestobis}
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[5.] Rit[ornello] }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIIIvlI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VIIIvlII
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 18)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[6.] Rec[itativ]o ”Si barbaro spietato”}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key si\minor\time 4/4 r4^\markup \center-align"[Soprano]" mi''4}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \IXvoce
                \new Lyrics \lyricsto "barbaro" \IXtesto
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IXbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    %\pageBreak

    \markup \huge {[7.] Aria [\italic\smaller {seconda strofa dopo il Ritornello}]}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 4/4 r4^\markup \center-align"[Soprano]" si'8. do''16}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \Xvoce
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\Xtesto}
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\Xtestobis}
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Xbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 16.5)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    %\pageBreak

    \markup \huge {[8.] [Recitativo] [\italic\smaller {A conclusione della seconda strofa dopo il Ritornello}]}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major\time 4/4 r8^\markup \center-align"[Soprano]" sol'8 si'}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \XIvoce
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\XItesto}
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \XIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    %\pageBreak

    \markup \huge {[9.] Rit[ornello]}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XIIvlI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XIIvlII
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \XIIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 16)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[10.] [Arioso] ”Amanti insani”}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XIIIvlI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XIIIvlII
            >>

            \new Staff  = "soprano" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 4/4 r1^\markup \center-align"[Soprano]" }
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \XIIIvoce
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\XIIItesto}
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \XIIIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup \huge {[11.] Allegro [\italic\smaller {seconda strofa dopo il Ritornello}]}

    \score {

        \new ChoirStaff <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 3/8\override MensuralStaff.TimeSignature.style = #'numbered r4.^\markup \center-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \XIVvoce
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\XIVtesto}
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\XIVtestobis}
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \XIVbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 16.5)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    \markup \huge {[12.] Rit[ornello]}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XVvlI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XVvlII
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \XVbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 16)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[13.] [Arioso] ”Ma il cor d'ogni dolor” }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XVIvlI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XVIvlII
            >>

            \new Staff  = "soprano" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 4/4 r4^\markup \center-align"[Soprano]" r8 si' }
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop"
                \XVIvoce
                \new Lyrics \with { alignBelowContext = #"soprano" } \lyricsto  "soprano" {\XVItesto}
            >>

            \new Staff  \with {
                fontSize = #+2
                \override StaffSymbol.staff-space = #(magstep +2)
            }<<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \XVIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
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

}
