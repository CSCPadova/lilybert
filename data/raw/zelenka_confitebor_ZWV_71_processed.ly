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


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    r4 do si
    do2 sol4
    r lab sol8 fa

    %4
    \appoggiatura fa sol4. do,8 do4
    do' sib do
    \appoggiatura sib8 lab4. sib8 sol4~

    %7
    sol8 lab fa4.\tr sol8
    sol8 sol' re (do) si32[(do re8.)]
    r8 sol mib (re) do32[(re mib8.)]

    %10
    r8 fa re (do)  si32[(do re8.)]
    mib8 [(sol,) lab(fad) sol\breathe re'\p]
    mib\upl(fad,) sol re' mib(fad,)\mbreak

    %13
    sol[\breathe re'\f] fa!4 r8 fa
    mib(si') do la, fa'(si)
    do8.(mib,16) re4.\tr do8

    %16
    do2 r4
    R2.*6
    r8 sol'\f re(do) si32[(do re8.)]

    %24
    r8 sol mib(re) do32[(re mib8.)]\mbreak
    r8 fa re(do) si32(do re8.)
    mib8\upl do\upl do,4 r

    %27
    R2.
    r8 sol''\p re(do) si32(do re8.)
    R2.*2

    %31
    r8 sol\p re(do) si32(do re8.)
    R2.*6
    mib8\f (sol,) lab(fad) sol re'

    %39
    mib8 (fad,) \appoggiatura fad8 sol4 r
    R2.*3
    r8^\markup\italic"Moderato" re' la(sol) fad32(sol la8.)

    %44
    r8 re sib(la) sol32\parentSlur ( la sib8.)
    r8 mib do(sib) la32[\parentSlur (sib do8.)]\mbreak
    r8 fad mib! re do32\parentSlur (re mib8.)

    %47
    re4 fad sol~
    sol8 la fad4. sol8
    sib,\f [(re,) mib(dod) re\breathe la'\p]

    %50
    sib(dod,) re(la'!) sib dod,
    re \breathe la'\f  do!4. sib16 la
    sib8 la sol4 r

    %53
    R2.
    r8 sol'\f re(do) si32(do re8.)
    R2.*2\mbreak

    %57
    r8 sol\p re(do) si32(do re8.)
    R2.*2
    r8 do sol(fa) mib32(fa sol8.)

    %61
    r8 fa' re\parentSlur ( do) si32(do re8.)
    do4 sol mib'
    la,!8 re re,4 r

    %64
    \stemDown mib'8\f[(sol,) lab(fad?) sol (re')]\breathe\stemNeutral
    mib\p \parentSlur (fad,) sol (re') mib(fad,)\mbreak
    sol8\breathe re'\f fa4. mib16 re

    %67
    mib8 do mi4. re16 mi
    fa8 do fad4. mi?16 fad
    sol8 sib, la4.\tr sol8

    %70
    sol4 r r8 re'
    sol,\p(fa) mi32(fa sol8.) r4
    r4 r r8 do

    %73
    fa,8(mib?) re32(mib fa8.) r4
    r8 mib'\f sib(lab) sol32\parentSlur (lab sib8.)
    r8 fa' lab,(sol) fa32(sol lab8.)\mbreak

    %76
    sol8(fa) mib4 r
    R2.*3
    r8 sib'^\markup\italic"Moderato" fa(mib) re32(mib fa8.)

    %81
    r8 sib sol(fa) mib32(fa sol8.)
    r8 do lab(sol) fa32\parentSlur(sol lab8.)
    r8 re lab(sol) fa32\parentSlur(sol lab8.)

    %84
    sib4 re mib~
    mib8 do re4.\tr mib8\mbreak
    mib4 r r

    %87
    R2.
    r8 sol\f re(do) si32(do re8.)
    R2.*2

    %91
    r8 sol\p re(do) si32\parentSlur (do re8.)
    R2.*2
    r8 do'\p sol(fa) mib32\parentSlur (fa sol8.)

    %95
    r8 fa re(do) si32(do re8.)\mbreak %%%% fine p. 7
    do4 sol mib'
    lab8 fa re4. do8

    %98
    do[\breathe sol'\f mib(re)] do32[(re mib8.)]
    r8 fa re(do) si32(do re8.)
    mib8[(sol,) lab(fad) sol (\breathe re'\p)]

    %101
    mib(fad,) sol (re') mib(fad,)
    sol[\breathe re'\f ] fa!4 r8 fa
    mib si'? do do, fa si!

    %104
    do8. mib,16 re4.\tr do8
    do2

}

IvlIIn = \relative do'' {

    mib,2 fa4
    sol8(fa) mib(re) do4~
    do fa8 sol lab4

    %4
    si, sol sol'~
    sol8(fa) sol fa mi8[re]
    do4 fa sib,

    %7
    do do'8(si) do4
    si r r8 si
    do4 r r8 sol

    %10
    la!4 r r8 si
    sol4 mib re
    mib re mib\mbreak

    %13
    re re'4. si8
    do(sol) mib'4 \parenthesize r
    lab,8. do16 si4.\tr do8

    %16
    do2 r4
    R2.*6
    si4 r r8 si

    %24
    do4 do, r8 sol'\mbreak
    la4 r r8 si
    do8 mib sol4 r

    %27
    R2.
    r8 sol\p re(do) si32(do re8.)
    R2.*2

    %31
    r8 sol\p re(do) si32(do re8.)
    R2.*6
    r4 mib, re

    %39
    mib re \parenthesize r
    R2.*3
    r8 re' la(sol) fad32(sol la8.)

    %44
    r8 re sib(la) sol32\parentSlur ( la sib8.)
    r8 mib do(sib) la32[\parentSlur (sib do8.)]\mbreak
    r8 fad mib! re do32\parentSlur (re mib8.)

    %47
    re4 fad sol~
    sol8 la fad4. sol8
    sib,\f [(re,) mib(dod) re\breathe la'\p]

    %50
    sib(dod,) re(la'!) sib dod,
    re \breathe la'\f  do!4. sib16 la
    sib8 la sol4 r

    %53
    R2.
    r8 sol'\f re(do) si32(do re8.)
    R2.*2\mbreak

    %57
    r8 sol\p re(do) si32(do re8.)
    R2.*2
    r8 do sol(fa) mib32(fa sol8.)

    %61
    r8 fa' re\parentSlur ( do) si32(do re8.)
    do4 sol mib'
    la,!8 re re,4 r

    %64
    r4 mib re
    mib re mib\mbreak
    re re'4. do16 si

    %67
    do4 sol do~
    do8 sib? la[re,] re'4~
    re8 sol fad4. sol8

    %70
    sol4 r r8 re
    sol,\p(fa) mi32(fa sol8.) r4
    r4 r r8 do

    %73
    fa,8(mib?) re32(mib fa8.) r4
    sol\f sib sol
    fa r sib\mbreak

    %76
    sib2 r4
    R2.*3
    r8 sib fa(mib) re32(mib fa8.)

    %81
    r8 sib sol(fa) mib32(fa sol8.)
    r8 do lab(sol) fa32\parentSlur(sol lab8.)
    r8 re lab(sol) fa32\parentSlur(sol lab8.)

    %84
    sib4 re mib~
    mib8 do re4.\tr mib8\mbreak
    mib4 r r

    %87
    R2.
    r8 sol\f re(do) si32(do re8.)
    R2.*2

    %91
    r8 sol\p re(do) si32\parentSlur (do re8.)
    R2.*2
    r8 do'\p sol(fa) mib32\parentSlur (fa sol8.)

    %95
    r8 fa re(do) si32(do re8.)\mbreak %%%% fine p. 7
    do4 sol mib'
    lab8 fa re4. do8

    %98
    do4 r r8 sol\f
    fa4 r r8 si
    sol4 mib re

    %101
    mib\p re mib
    re re'4.\f do16 si
    do8 sol mib'4 r

    %104
    lab8. do,16 si4.\tr do8
    do2

}

Ivocen = \relative do {

    \autoBeamOff
    R2.*15
    r4 do' si
    \grace si?4 do2 sol4

    %18
    r lab sol8 [fa]
    \grace fa8 sol4. do,8 do4
    do' sib do

    %21
    lab4. sib8 sol4~
    sol8 [lab] fa4.\tr  sol8
    sol4 r r

    %24
    R2.*2
    r4 mib' re
    do si2

    %28
    do8[(sol)] sol2
    r4 mib' re
    do si2

    %31
    do8. sol16 sol4 r
    fa re' fa,
    fa8[sol16\tr la] sol8[fa mib re]

    %34
    mib16[fa] sol4 la16[si] do8[re16 mib]
    fa,16[sol] la4 si16[do] re8[mib16 fa]\mbreak %fine pagina
    sol,4 si do~

    %37
    do8 la si4. do8
    do,2 r4
    r sol' sol

    %40
    do4. sib?8 do la
    sib[la] sib[do] la [sib]
    sol[fad] sol[la] sib do

    %43
    re2.~
    re
    re2 do4~\mbreak

    %46
    do~do2
    do4 sib8 [la] sib4~
    sib8 mib re,2

    %49
    sol r4
    R2.*2
    r4 mib' re

    %53
    do si2
    do8[sol] sol2
    r4 mib' re\mbreak

    %56
    do si2
    do8 sol sol2
    fa4 re' fa,

    %59
    fa8[lab sol fa mib re]
    mib16[fa] sol4 la?16[si] do8[re16 mib]
    fa,16[sol] la4 si16[do] re8[mib16 fa]

    %62
    sol,4 si do~
    do8 la si4. do8
    do,2 r4

    %65
    R2.*4
    r4 r re'
    sib4. la8 si4

    %71
    do4. sib?8 lab sol
    lab4. sol8 la4
    r sib lab

    %74
    sol8[fa] mib4 r
    R2.\mbreak
    r 4 sib' sib

    %77
    do8. do16 sib4 mib8[reb]
    do4 sib4. lab?8
    sol[fa mib fa sol lab]

    %80
    sib2.\parentSlur (
    sib)~
    sib4 lab?8[sib] lab!4~

    %83
    lab fa' lab,
    lab? sol8 fa sol4
    lab?8 lab sib4. sib8\mbreak

    %86
    mib,4 mib' re
    do si2
    do8[sol] sol2

    %89
    r4 mib' re
    do si2
    do8 sol sol2

    %92
    fa4 re' fa,
    fa8[lab sol fa mib re]
    mib16[fa] sol4 la?16[si] do8[re16 mib]

    %95
    fa,16[sol] la4 si16[do] re8[mib16 fa]\mbreak
    sol,4 si do~
    do8 re si4.(do8)

    %98
    do,2 r4
    R2.*6
    r2

}

Itesto = \lyricmode {

    Confi - tebor _ ti -- bi Domi - ne, in to -- to cor - de me - o;

    Confi - tebor _ ti -- bi ti -- bi ti -- bi Domi - ne, in to -- to to - - - -  - - - - - - to cor -- de me - o;

    in con -- sili - o justo - rum, et con -- grega - ti -- o -- ne - con -- gre -- ga -- ti -- o -- ne.

    Confi - tebor _ ti -- bi ti -- bi ti -- bi Domi - ne, in to -- to to - - - -  - - - - - to cor -- de me - o;

    Con -- fessi - o et magni - ficen - ti -- a opus _  e  -- jus;

    et justi - ti -- a e -- jus ma -- net  ma - - - - net ma -- net in saecu - lum sae -- cu -- li.

    Confi - tebor _ ti -- bi ti -- bi ti -- bi Domi - ne, in to -- to to - - - -  - - - - - to cor -- de me -- o.

}


Ibcn = \relative do {

    do2 re4
    mib do8 re mib4
    fa fa, fa'~

    %4
    fa mib8 re mib do
    mib4 mi do
    fa re mib?

    %7
    lab, lab'?2
    sol,4 sol' fa
    mib r mib

    %10
    re sol sol,
    do do' si
    do\p si do\mbreak

    %13
    si2^\f sol4
    do r lab8 sol
    fa4 sol sol,

    %16
    do2\p re4
    mib do8 re mib4
    fa fa, fa'~

    %19
    fa mib8 re mib do
    re4 mi do
    fa sib, mib?

    %22
    lab, lab'2
    sol,4 sol'\f fa
    mib4 r mib

    %25
    re sol sol,
    do2\p re4
    mib re sol8 fa

    %28
    mib4 si sol'
    do,2 re4
    mib re sol8 fa

    %31
    mib4 si sol
    la si la
    sol si sol'

    %34
    do, r do
    re r re\mbreak % fine pagina
    mib re do

    %37
    fa sol sol,
    do do'\f sib
    do sib sol

    %40
    lab?^\p fad re
    sol, sol' fad?
    mib2.

    %43
    re4 re' do
    sib r sib
    do2 do,4(\mbreak

    %46
    re) r re
    fad re sol
    do, re re,

    %49
    sol\breathe sol'\f fad
    sol fad^\p sol
    fad mib\f re

    %52
    sol,\breathe do\p re
    mib re sol8 fa?
    mib4 si sol'

    %55
    do,2 re4\mbreak
    mib re sol8 fa
    mib4 si sol

    %58
    la si la
    sol si sol'
    do, r do

    %61
    re r re
    mib re do
    fa sol sol,

    %64
    do \breathe do'_\markup {[\musicglyph #"f"]} si\breathe
    do\p si do\mbreak
    si^\f r sol

    %67
    do, do' sib
    la re do
    sib?8 do re4 re,

    %70
    sol\p sol, fa'
    mib do mi
    fa fa, mib'?

    %73
    re sib re
    mib \f sol mib
    re sib re\mbreak

    %76
    mib\breathe sol^\p mib
    lab sol mib
    lab? re, sib

    %79
    mib do2
    sib4 sib' lab
    sol r sol

    %82
    lab r lab
    sib r sib,
    re sib mib

    %85
    lab sib sib,\mbreak
    mib do re
    mib re sol8 fa

    %88
    mib4 si sol'
    do,2 re4
    mib re sol8 fa

    %91
    mib4 si sol
    la si la
    sol si sol

    %94
    do r do re r re\mbreak
    mib re do
    fa sol sol,

    %97
    do\f r do
    re sol sol,
    do do' si\breathe

    %100
    do\p si do
    si\f r sol
    do do, lab'8 sol

    %103
    fa4 sol sol,
    do2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6!>4
    <6>2 <6>4
    <_->2.
    <4\+ 2>2 <6>4
    <6> <6> <_!>
    <_-> <5-> s
    <7 _-> <6>2
    \bassFigureExtendersOn <_!>4 <_!> <_!>\bassFigureExtendersOff
    <6> s <6> <7> <_!> s
    s s <6>
    s <6> s
    <6> <5> <_!>
    s2 <6>8 <_!>
    <_->4 <_!> s
    s2 <6!>4
    <6>2 <6>4
    <_->2.
    \bassFigureExtendersOn <4\+>4 <4\+> <6>\bassFigureExtendersOff
    s <5> <_!>
    <_-> <7> s
    <7> <6> s
    <_!>2.
    s
    <7>4 s < _!>
    s2 <6!>4
    <6> <6!> <_!>
    <6> s <6>
    s s <6!>
    <6> <6\\> <_!>
    s <6> <_!>
    \bassFigureExtendersOn <6> <6> s
    <_!> <6> <_!>\bassFigureExtendersOff
    s2.
    <5>4 s <6!>
    <6> <6!> s
    <_!> <_!> s
    s s <6>
    s <6> s
    <6\\> s <_+>
    s s <6>
    <7>4 s <6>
    <_+> s <4\+>
    <6> s s
    <9>2 <8>4
    <7 _+> s <7 _+>
    <6 5> <_+> s
    s <_+> s
    s s <6>
    s <6> s
    <6> s <_+>
    s s <6!>
    <6> <6!> <_!>
    <6> <6> <5>
    s2 <6!>4
    <6> <6!> s
    s <6> s
    <6> <6> <6>
    <_!> s s
    s2.
    <5>4 s <6!>
    <6> <6!> s
    s2.
    s2 <6>4
    s <6> s
    <6> s <7>
    \bassFigureExtendersOn s <_!> <_!>
    <6>4 <_+> <_+>\bassFigureExtendersOff
    s <_+> s
    s s <4!>
    <6> <_!> <6>
    <_-> s <6 4>
    <6> s <5->
    s2.
    <6>4 <7-> <6>
    s <6> s
    s <5> <6>
    s <6> s
    <5> <7> <6>
    \bassFigureExtendersOn <5 3> <5 3> <5 3>\bassFigureExtendersOff
    <6> s <6>
    <5>2.
    <7->4 s <7>
    <6 5-> <7> s
    <6 5>2.
    s4 <5> <6!>
    <6> <6!> <_!>
    <6> <6> <_!> s2 <6!>4
    <6> <6!> <_!>
    <6> <6> <_!>
    <6> s <6>
    <_!> <6> <_!>
    s2.
    <5>4 s <6!>
    <6> <6!> s
    <5> <_!> s

}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key sib\major
    \tempo 2 = 50
    s2.*104
    s2
    \bar"||"

}


IvlI = {
    \Iglobal
    \notypeset
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}

Ivoce = {
    \new Voice = "confitebor"
    \Iglobal
    \clef bass
    <<\Ivocen \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    R2*5
    r8 sib\f mib4
    r16 mib, sol lab sib do reb sib

    %8
    do8 lab fa'4
    r16 fa, la! sib do re mib do
    re8 sib lab'4\mbreak

    %11
    lab8 [sib, sol' sib,]
    fa'[\breathe sib,\p] lab'!4~
    lab16  sol lab sib, sol'(fa sol) sib,

    %14
    fa'8[\breathe sib,\f] mib4~
    mib8 fa32(mib re16) \appoggiatura re8 mib4\p~
    mib8 fa32(mib re16) mib8[\breathe lab,\f]

    %17
    sol4 fa8. mib16
    mib4 r
    R2*3

    %22
    r8 sib'^\markup\italic"Moderato" mib4
    R2
    r8 fa sib4

    %25
    R2*2
    r4 r8 sol
    do4 r8 fa,

    %29
    sib4 r
    R2*2
    r16 mib,,\f sol lab sib do reb sib

    %33
    do8\upl lab\upl lab,?4
    R2
    r16 fa' la? sib do re mib do

    %36
    re8\upl sib\upl sib,4
    R2*3
    r4 r8 fa''\f\mbreak

    %41
    fa8[fa fa sol16 la]
    \appoggiatura la8 sib8.[sib,16 sib'8 lab]
    sol8.[(mib16) fa8.(re16)]

    %44
    \appoggiatura re8 mib4.\tr( re8)
    re4 r
    R2*3

    %49
    r8 sib^\markup\italic"Mode[rato]" mib4
    R2*7
    fa32\f(mib re8.)mib32\parentSlur (re do8.)

    %58 %%%%ricontare da qua
    si32(la sol8.) r4
    R2*8
    r8 re\f do'4~

    %68
    do8[re, sib' re,]
    la' re, r4
    R2*3

    %73
    r8 sol\f fa'4~
    fa8[sol, mib' sol,]
    re' sol, r4

    %76
    R2*2
    r8 sib mib4~
    mib8 fa32(mib re16) \appoggiatura re8 mib4\p~

    %80
    mib8 fa32 \parentSlur (mib re16) mib8 sol32\f\parentSlur (fa mib16)\mbreak
    re do sib8 r4
    r r8 sol'^\markup\italic"Moderato"

    %83
    sol,4 r8 fa'
    fa,4 r
    R2

    %86
    r16 mib\f sol lab sib do reb sib
    do8 lab lab,?4
    R2

    %89
    r16 fa'\f la? sib do re? mib do   %%%5 fine sistema 9
    re8 sib sib,4\mbreak
    R2*2

    %93
    r8 re^\markup\italic"Moderato" do'4~
    do8[re, sib' re,]
    la' re, do'4~

    %96
    do16 sib do re, sib' la sib re,
    la'8_\upl re,_\upl r4
    R2*9 %%%5 inizio ultimo sistema di p. 13

    %107 Inizio sistema 11
    r8 sol\f fa'4~
    fa8 [sol, mib' sol,]
    re' sol, do4\p~

    %110
    do8[re, sib' re,]
    la' re, sol'4_\markup {[\musicglyph #"f"]}~
    sol8 la32(sol fad16) \grace fad8 sol4\p~

    %113
    sol8 la32\parentSlur (sol fad?16) sol8[\breathe do,\f]\mbreak  %%% fine 11
    sib4 la
    sol4 r r

    %116
    R2.
    r8 sol' \f re (do) si32[(do re8.)]
    R2.*2

    %120
    r8 sol\p re (do) si32[(do re8.)]
    R2.*2
    r8 do sol(fa) mi32(fa sol8.)\mbreak % fine s. 12

    %124
    r8 fa' re ( do) si32(do re8.)
    do4 sol mib'
    lab8 fa re4.\tr do8

    %127
    do [\breathe sol'\f mib(re)] do32(re mib8.)
    r8 fa re(do) si32(do re8.)
    mib8[(sol,) lab(fad) sol\breathe re'\p]

    %130
    mib(fad,) sol(re') mib(fad,)
    sol[\breathe re'\f ] fa!4 r8 fa
    mib si' do do, fa si

    %133
    do8. mib,16 re4.\tr do8\mbreak  %% fine sistema 13
    do4 r
    r r8 sib\f

    %136 Inizio sistema 14
    sib[\upl sib\upl sib do16 re]
    mib8 [sol, mib' reb]
    do8.[(sol16) sib8.(sol16)]

    %139
    \appoggiatura sol8 lab4.\tr sol8
    sol4 r
    R2*3

    %144 inizio sistema 15
    r16 mib\f sol lab sib do reb sib
    do8 lab lab,?4
    R2*4

    %150
    r16 lab' do reb mib fa solb mib
    fa sib, reb mib fa sol lab fa
    sol8 mib lab4~

    %153
    lab8 sib32 \parentSlur (lab sol16)  \appoggiatura sol8 lab4\p~
    lab8 sib32(lab sol16) lab8[\breathe  reb,\f]  %% inizio sistema 16
    do4 sib8.\tr lab16

    %156
    lab4 r
    R2*3
    r8 mib\p lab4~

    %161
    lab8 sib32 \parentSlur (lab sol16)  \appoggiatura sol8 lab4\p~
    lab8 sib32(lab sol16) lab \breathe do\f si? lab
    sol8\p [fa mib sol]

    %164 inizio sistema 17
    re^\f_\upl [fa_\upl sib re]
    mib [\breathe mib,\p  sol mib]
    re_\upl^\f [fa_\upl sib_\upl re]

    %167
    mib[\breathe mib,\p sol mib]
    re[\breathe sib\f mib sol]
    lab[\breathe   lab,\p  lab' sol]

    %170
    fa[lab fa mib]
    re[sib do re]
    fa[\breathe sib\f] mib4~

    %173
    mib8 fa32\parentSlur (mib re16) \appoggiatura re8 mib4~\mbreak
    mib8_\markup {[\musicglyph #"p"]}  fa32(mib re16)  \appoggiatura re8 mib4~   % pagina 17 sistema 18
    mib16\f do re sib do sol la! sib

    %176
    la8 fa r4
    R2
    r8 re\f do'4~

    %179
    do8_\upl[re,_\upl sib' re,]
    la' re, r4
    R2*3\mbreak % fine 18

    %184    % sistema 19 p. 18
    r8 fa\f mib'4~
    mib16 re mib fa, re' do re fa,
    do'8 fa, r4

    %187
    R2*2
    r8 do^\markup\italic"Moderato" _\markup {[\musicglyph #"f"]} sib'4~
    sib8 [do, la' do, ]

    %191
    sol'[do,] sib'4\p~
    sib16 la sib do, la' sol la do,
    sol'8\f la, do mi? % fine 19

    %194
    sib'8[\breathe sib,\p sib' la]
    sol [sib, sol' fa]
    mi[do re mi]

    %197
    \stemDown fa[\breathe do'\f] \stemNeutral fa4~
    fa8 sol32\parentSlur (fa mib16) \appoggiatura mib8 fa4\p~
    fa8 sol32\parentSlur (fa mib16) \appoggiatura mib8 fa4\f~

    %200
    fa16 re mib! do re la si do
    si8. la16 sol4  %% fine 20
    R2*3

    %205
    r4 r8 sib?\f
    sib[sib sib do16 re]
    mib8. mib,16 mib4

    %208
    R2*4  %% fine 21
    R2.*2
    r8 sol'\f re do si32(do re8.)

    %215
    R2.*2
    r8 sol\p re do si32\parentSlur (do re8.)
    mib8\f do do,4  %%%%% 218 OK

    %219
    R2*5\mbreak
    r8 sib'8^\markup\italic"Mode[rato]" mib4
    r16 mib, sol lab sib do reb sib

    %226
    do8 lab? fa'4
    r16 fa, la! sib do re mib do
    re8[\breathe sib\f]  lab'4~

    %229
    lab8 [sib, sol' sib,]
    fa' sib, lab'4\p~
    lab16 sol lab sib, sol' fa sol sib,

    %232
    fa'8[\breathe sib,\f] mib4~
    mib8 fa32\parentSlur (mib re16) \grace re8 mib4\p\mbreak % fine sistema 23
    mib8 fa32 (mib re16) mib8 lab,?

    %235
    sol4 fa8.\tr mib16
    mib4 r
    R2*2

    %239
    r8 sol\f fa'4~
    fa8[sol, mib' sol,]
    re' sol, fa'4\p~

    %242
    fa16 mib fa sol, mib' re mib sol,
    re'8 sol, r4
    R2*4

    %248
    r8 sol\f sol'4\parentSlur (
    sol8) la32(sol fad16) \appoggiatura fad8 sol4\p ~
    sol8 la32(sol fad16) sol8[\breathe do,\f]

    %251
    sib4 la8.\tr sol16
    sol4 r r
    R2.

    %254
    r8 sol' re (do) si32\parentSlur(do re8.)
    R2.*2
    r8 sol re (do) si32(do re8.)\mbreak

    %258
    R2.*6
    mib8(sol,) lab(fad) sol(re')
    mib(fad,) \grace fad8 sol4 r

    %266
    r8 do sol(fa?) mi32\parentSlur (fa sol8.)
    r8 fa' re(do) si32(do re8.)\mbreak
    do4 sol mib'

    %269
    re8 do si4 do
    do8 sol' mib(re) do32(re mib8.)
    r8 fa re(do) si32\parentSlur (do re8.)

    %272
    mib8[(sol,) lab(fad) sol(\breathe re'\p)]
    mib(fad,) sol(re') mib(fad,)
    sol[\breathe re'\f] fa4 r8 fa

    %275
    mib si' do do, fa si
    do8. mib,16 re4.\tr do8
    do2 r4

}

IIvlIIn = \relative do'' {

    R2*5
    r8 sib\f mib4
    r16 mib, sol lab sib do reb sib

    %8
    do8 lab fa'4
    r16 fa, la! sib do re mib do
    re8 sib lab'4\mbreak

    %11
    lab8 [sib, sol' sib,]
    fa'[\breathe sib,\p] lab'!4~
    lab16  sol lab sib, sol'(fa sol) sib,

    %14
    fa'8[\breathe sib,\f] mib4~
    mib8 fa32(mib re16) \appoggiatura re8 mib4\p~
    mib8 fa32(mib re16) mib8[\breathe lab,\f]

    %17
    sol4 fa8. mib16
    mib4 r
    R2*3

    %22
    r8 sib' mib4
    R2
    r8 fa sib4

    %25
    R2*2
    r4 r8 sol
    do4 r8 fa,

    %29
    sib4 r
    R2*2
    r16 mib,,\f sol lab sib do reb sib

    %33
    do8\upl lab\upl lab,?4
    R2
    r16 fa' la? sib do re mib do

    %36
    re8\upl sib\upl sib,4
    R2*3
    r4 r8 fa''\f\mbreak

    %41
    fa8[fa fa sol16 la]
    \appoggiatura la8 sib8.[sib,16 sib'8 lab]
    sol8.[(mib16) fa8.(re16)]

    %44
    \appoggiatura re8 mib4.\tr( re8)
    re4 r
    R2*3

    %49
    r8 sib mib4
    R2*7
    fa32\f(mib re8.)mib32\parentSlur (re do8.)

    %58 %%%%ricontare da qua
    si32(la sol8.) r4
    R2*8
    r8 re\f do'4~

    %68
    do8[re, sib' re,]
    la' re, r4
    R2*3

    %73
    r8 sol\f fa'4~
    fa8[sol, mib' sol,]
    re' sol, r4

    %76
    R2*2
    r8 sib mib4~
    mib8 fa32(mib re16) \appoggiatura re8 mib4\p~

    %80
    mib8 fa32 \parentSlur (mib re16) mib8 sol32\f\parentSlur (fa mib16)\mbreak
    re do sib8 r4
    r r8 sol'

    %83
    sol,4 r8 fa'
    fa,4 r
    R2

    %86
    r16 mib\f sol lab sib do reb sib
    do8 lab lab,?4
    R2

    %89
    r16 fa'\f la? sib do re? mib do   %%%5 fine sistema 9
    re8 sib sib,4\mbreak
    R2*2

    %93
    r8 re do'4~
    do8[re, sib' re,]
    la' re, do'4~

    %96
    do16 sib do re, sib' la sib re,
    la'8_\upl re,_\upl r4
    R2*9 %%%5 inizio ultimo sistema di p. 13

    %107 Inizio sistema 11
    r8 sol\f fa'4~
    fa8 [sol, mib' sol,]
    re' sol, do4\p~

    %110
    do8[re, sib' re,]
    la' re, sol'4_\markup {[\musicglyph #"f"]}~
    sol8 la32(sol fad16) \grace fad8 sol4\p~

    %113
    sol8 la32\parentSlur (sol fad?16) sol8[\breathe do,\f]\mbreak  %%% fine 11
    sib4 la
    sol4 r r

    %116
    R2.
    r8 sol' \f re (do) si32[(do re8.)]
    R2.*2

    %120
    r8 sol\p re (do) si32[(do re8.)]
    R2.*2
    r8 do sol(fa) mi32(fa sol8.)\mbreak % fine s. 12

    %124
    r8 fa' re ( do) si32(do re8.)
    do4 sol mib'
    lab8 fa re4.\tr do8

    %127
    do4 r r8 sol
    fa4 r r8 si
    sol4 mib re

    %130
    mib re mib
    re re'4. do16 si
    do8 sol mib'4 r

    %133
    lab8. do,16 do4 si8\tr (do)\mbreak
    do4 r
    r r8 sib\f

    %136 Inizio sistema 14
    sib[\upl sib\upl sib do16 re]
    mib8 [sol, mib' reb]
    do8.[(sol16) sib8.(sol16)]

    %139
    \appoggiatura sol8 lab4.\tr sol8
    sol4 r
    R2*3

    %144 inizio sistema 15
    r16 mib\f sol lab sib do reb sib
    do8 lab lab,?4
    R2*4

    %150
    r16 lab' do reb mib fa solb mib
    fa sib, reb mib fa sol lab fa
    sol8 mib lab4~

    %153
    lab8 sib32 \parentSlur (lab sol16)  \appoggiatura sol8 lab4\p~
    lab8 sib32(lab sol16) lab8[\breathe  reb,\f]  %% inizio sistema 16
    do4 sib8.\tr lab16

    %156
    lab4 r
    R2*3
    r8 mib\p lab4~

    %161
    lab8 sib32 \parentSlur (lab sol16)  \appoggiatura sol8 lab4\p~
    lab8 sib32(lab sol16) lab \breathe do\f si? lab
    sol8\p [fa mib sol]

    %164 inizio sistema 17
    re^\f_\upl [fa_\upl sib re]
    mib [\breathe mib,\p  sol mib]
    re_\upl^\f [fa_\upl sib_\upl re]

    %167
    mib[\breathe mib,\p sol mib]
    re[\breathe sib\f mib sol]
    lab[\breathe   lab,\p  lab' sol]

    %170
    fa[lab fa mib]
    re[sib do re]
    fa[\breathe sib\f] mib4~

    %173
    mib8 fa32\parentSlur (mib re16) \appoggiatura re8 mib4~\mbreak
    mib8_\markup {[\musicglyph #"p"]}  fa32(mib re16)  \appoggiatura re8 mib4~   % pagina 17 sistema 18
    mib16\f do re sib do sol la! sib

    %176
    la8 fa r4
    R2
    r8 re\f do'4~

    %179
    do8_\upl[re,_\upl sib' re,]
    la' re, r4
    R2*3\mbreak % fine 18

    %184    % sistema 19 p. 18
    r8 fa\f mib'4~
    mib16 re mib fa, re' do re fa,
    do'8 fa, r4

    %187
    R2*2
    r8 do^\markup\italic"Moderato" _\markup {[\musicglyph #"f"]} sib'4~
    sib8 [do, la' do, ]

    %191
    sol'[do,] sib'4\p~
    sib16 la sib do, la' sol la do,
    sol'8\f la, do mi? % fine 19

    %194
    sib'8[\breathe sib,\p sib' la]
    sol [sib, sol' fa]
    mi[do re mi]

    %197
    \stemDown fa[\breathe do'\f] \stemNeutral fa4~
    fa8 sol32\parentSlur (fa mib16) \appoggiatura mib8 fa4\p~
    fa8 sol32\parentSlur (fa mib16) \appoggiatura mib8 fa4\f~

    %200
    fa16 re mib! do re la si do
    si8. la16 sol4  %% fine 20
    R2*3

    %205
    r4 r8 sib?\f
    sib[sib sib do16 re]
    mib8. mib,16 mib4

    %208
    R2*4  %% fine 21
    R2.*2
    r8 sol'\f re do si32(do re8.)

    %215
    R2.*2
    r8 sol\p re do si32\parentSlur (do re8.)
    mib8\f do do,4  %%%%% 218 OK

    %219
    R2*5\mbreak
    r8 sib'8^\markup\italic"Mode[rato]" mib4
    r16 mib, sol lab sib do reb sib

    %226
    do8 lab? fa'4
    r16 fa, la! sib do re mib do
    re8[\breathe sib\f]  lab'4~

    %229
    lab8 [sib, sol' sib,]
    fa' sib, lab'4\p~
    lab16 sol lab sib, sol' fa sol sib,

    %232
    fa'8[\breathe sib,\f] mib4~
    mib8 fa32\parentSlur (mib re16) \grace re8 mib4\p\mbreak % fine sistema 23
    mib8 fa32 (mib re16) mib8 lab,?

    %235
    sol4 fa8.\tr mib16
    mib4 r
    R2*2

    %239
    r8 sol\f fa'4~
    fa8[sol, mib' sol,]
    re' sol, fa'4\p~

    %242
    fa16 mib fa sol, mib' re mib sol,
    re'8 sol, r4
    R2*4

    %248
    r8 sol\f sol'4\parentSlur (
    sol8) la32(sol fad16) \appoggiatura fad8 sol4\p ~
    sol8 la32(sol fad16) sol8[\breathe do,\f]

    %251
    sib4 la8.\tr sol16
    sol4 r r
    R2.

    %254
    r8 sol' re (do) si32\parentSlur(do re8.)
    R2.*2
    r8 sol re (do) si32(do re8.)\mbreak

    %258
    R2.*6
    mib8(sol,) lab(fad) sol(re')
    mib(fad,) \grace fad8 sol4 r

    %266
    r8 do sol(fa?) mi32\parentSlur (fa sol8.)
    r8 fa' re(do) si32(do re8.)\mbreak
    do4 sol mib'

    %269
    re8 do si4 do
    do4 r r8 sol
    fa4 r r8 si

    %272
    sol4 mib re
    mib re mib
    re re'4. do16 si

    %275
    do8 sol mib'4 r
    lab8. do,16 si4. \tr do8
    do2 r4

}

IIvocen = \relative do {

    \autoBeamOff

    r4 r8 sib'
    sib4 do8 re
    mib mib, mib' reb

    %4
    do8. lab16 sib8 sol
    lab2
    sol4 r

    %7
    R2*10
    r4 r8 sib
    sib4 do8 re

    %19
    mib mib, mib' reb
    do lab sib sol\mbreak
    lab2

    %22
    sol4 r8 sib
    do4 la
    sib r8 sib

    %25
    do sib do sib
    do4 la
    sib mib

    %28
    fa, re'
    mib, do'
    re,8 fa sib4~\mbreak %%% fine sistema 3

    %31
    sib8[lab] lab8 [sol16 fa]
    sol8. fa16 mib4
    r8 mib do'4~

    %34
    do8[sib] sib[la!16 sol]
    la8. sol16 fa4
    r8 fa re'4\parentSlur (

    %37
    re8)[do] do[sib16 la]
    sib8[sol do sib]
    la8. la16 sib8[(mib)]

    %40
    re8[do16 sib] do4\mbreak  %% fine sistema 4
    sib4 r
    R2*3

    %45
    sib8 sib sib do16[re]
    mib8. mib,16 mib4
    do'8 lab sib sol

    %48
    lab2
    sol4 r8 sib
    do sib do sib\mbreak  %%% fine sistema 5

    %51
    do sib do4
    sib r8 re
    do4 do

    %54
    do 4. re8
    mib do re[(sib)]
    la![sol] fa4

    %57
    R2
    r4 sol8 do
    lab[sol] lab fa

    %60
    sib do sib lab\mbreak %%% fine sistema 6
    sol8. fa16 sol4
    do8. re16 do8 [sib]

    %63
    la!8. sol16 la4
    re8[mib] re[do]
    sib8. la16 sib4

    %66
    do8[sib] la[sol]
    re'8. re,16 re4
    R2

    %69
    r4 r8 re'
    sib8. la16 si4\mbreak %% fine sistema7
    do8 si do mib

    %72
    re[mib] do [re]
    si[(la)] sol4
    R2

    %75
    r4 sol8 fa
    mib[sol] lab [sol]
    fa lab sib lab

    %78
    sol8. fa16 mib4
    R2*2\mbreak %%% fine sistema 8
    r4 mib'

    %82
    fa, re'
    mib,8 mib do'4
    re,8 fa sib4~

    %85
    sib8 lab lab4
    sol \parenthesize r
    r8 mib do'4~

    %88
    do8 sib sib4
    la! r
    r8 fa re'4\parentSlur( \mbreak   %%% fine sistema 9

    %91
    re8) do do4
    sib8 la sol la
    fad re r re'

    %94
    fad,4 sol
    fad8[sol] la re
    fad,4 sol

    %97
    fad8[sol la sib]
    do4. sib16[la]
    sib8[re] mib4

    %100
    do, mib'
    re8[sib16 do] re4
    sib, re'\mbreak %%% fine sistema 10

    %103
    do8[la16 sib] do4
    la, do'
    sib8[fad sol mib']

    %106
    re,2
    sol
    R2*7  %%%% fine sistema 11

    %115
    r4 mib' re
    do si2
    do8[sol] sol2

    %118
    r4 mib' re
    do si2
    do8 sol sol2

    %121
    fa4 re' fa,
    fa8[lab sol fa mib re]
    mib16[fa] sol4 la16[si] do8[re16 mib]\mbreak  %% fine sistema 12

    %124
    fa,16[sol] la4 si16[do] re8[mib16 fa]
    sol,4 si do~
    do8 la si4. do8

    %127
    do,2 r4
    R2.*6\mbreak %%%% fine sistema 13
    r4 r8 do'

    %135
    lab fa sib lab
    sol[fa] mib4
    R2*2

    %139
    r4 r8 sib'
    sib sib sib do16[re]
    mib8 mib, mib' reb

    %142
    do lab sib[sol]
    lab2\mbreak %%% fine sistema 14
    sol4 r

    %145
    r r8 do
    sib mib do sib16[mib]
    do4 sib

    %148
    reb8 do sib lab?
    sib4 sol
    lab r

    %151
    R2*5  %%%% fine 15 e inizio 16
    lab8. sib16 do8 lab
    mib'8. mib,16 mib8 mib'

    %158
    do4. sib16 do
    reb8 reb reb4
    do r

    %161
    R2*2
    r4 sib\mbreak % fine sistema 16
    sib4. sib8

    %165
    sib4 sib~
    sib sib
    sib4. sib8

    %168
    sib2
    do
    lab

    %171
    sib4. sib8
    sol2
    R2*3  %%fine sistema 17 e inizio 18

    %176
    r4 sib8. sib16
    sol8 sib la sol
    fad mib re4

    %179
    R2
    r4 re'8. re16
    sib8 re do sib

    %182
    la8 sol16 la sib8 sib
    do sib16 do re4\mbreak%% fine sistema 18
    do r

    %185
    R2
    r4 r8 fa,
    sib sib16 la sol8 fa

    %188
    sol4\upl mib8 do
    do'2~
    do2

    %191
    do~
    do
    do  %%%%% fine sistema 19

    %194
    re4. re8
    sib2
    do4. do8

    %197
    la2
    R2*3
    sol4 sol8 fa

    %202
    mib[do] mib sol
    do8. do,16 do4\mbreak %%% fine sistema 20
    r4 do'8 sib16 sib

    %205
    lab8 fa sib sib16 lab
    sol8[(fa)] mib4
    r sib'8 sib

    %208
    sib sib sib do16[re]
    mib8. mib,16 mib8 mib'
    do[lab] sib[sol]

    %211
    lab2
    sol4 mib' re
    do si2\mbreak %% fine sistema 21

    %214
    do8 [sol] sol2
    r4 mib' re
    do si2

    %217
    do8 sol sol4 r
    r4 sol8 sol
    sol sol sol[la16 si]

    %220
    do8. do,16 do8 do'
    lab fa sib lab
    sol mib lab lab16 sol

    %223
    fa8 sol16[lab] sib8 lab\mbreak %%% fine sistema 22
    sol[mib sol sib]
    mib4 mib,

    %226
    r8 fa [la do]
    fa4 fa,
    r r8 re'

    %229
    sib re mib4
    re r
    re8 sib mib8. mib16

    %232
    re8 do sib lab16 sib
    do4 sib\mbreak %%%% fine sistema 24
    do sib

    %235
    R2
    r8 mib[do la]
    fa[fa' re si]

    %238
    sol[si] do[re]
    sol,4 r
    r8 si do4

    %241
    r8 re si\upl[sol\upl]
    r si do4
    r8 re[si sol]

    %244
    r mib'[do lab]
    fa[fa' re si]\mbreak
    sol[si? do fa,]

    %247
    sol2^\markup\italic"Cad[enza] ad libitum"
    do,
    R2*3

    %252
    r4 mib' re
    do si2
    do8[sol] sol2

    %255
    r4 mib' re
    do si2
    do8 sol sol2\mbreak

    %258
    fa4 re' fa,
    fa8[lab sol fa mib re]
    mib16[fa] sol4 la16[si] do8[re16 mib]\mbreak  %% fine sistema 12

    %261
    fa,16[sol] la!4 si16[do] re8[mib16 fa]
    sol,4 si do~
    do8 la si4. do8

    %264
    do,2 r4
    r r8 re sol fa
    mib16[fa] sol4 la16[si] do8[re16 mib]

    %267
    fa,16[sol] la!4 si16[do] re8[mib16 fa]\mbreak
    sol,4 si do~
    do8 sol sol2

    %270
    do,4 r r
    R2.*7

}

IItesto = \lyricmode {

    Memo - ri -- am fe -- cit mira - bili - um suo - rum, memo - ri -- am fe -- cit mira - bili - um suo - rum,

    mise - ri -- cors et mise - ra -- tor Do -- mi -- nus. Es -- cam de -- dit de -- dit ti -- men - - tibus _

    ti -- men - - tibus _ ti -- men - - - ti -- bus e - um.

    Me -- mor e -- rit_in sae -- culum _ testa - men -- ti su -- i. Virtu - tem ope - rum suo - rum

    an -- nun -- ti -- a -- bit po -- pu -- lo su -- o.

    Ut det il -- lis here - dita - tem gen -- ti -- um;

    ope - ra manu - um e -- jus veri - tas et ju -- di -- cium. _

    Fide - li -- a om -- ni -- a man -- da -- ta e -- jus,

    Confir - ma -- ta in saecu - lum sae -- culi, _

    fac -- ta in veri - ta -- te in ve -- ri -- ta -- te et aequi - ta -- te

    in veri - ta -- te et aequi - ta -- te in veri - ta -- te et aequi - ta - - - - - - - - - - - - - - - - te.

    Confi - tebor _  ti -- bi ti -- bi ti -- bi Domi - ne, in to -- to to - - - - - - - - - to cor -- de me - o.

    Redem - ptio - nem mi -- sit  Redem - ptio - nem mi -- sit mi -- sit popu - lo su -- o;

    manda - vit in ae -- ter -- num testa - men -- tum su - um.

    Sanc -- tum et ter -- ribi - le  ter -- ribi - le no -- men e -- jus:

    I -- ni -- ti -- um sa -- pien - ti -- ae ti -- mor Do -- mini; _

    Intel - lec -- tus bo -- nus omni - bus intel - lec -- tus bo -- nus omni - bus

    faci - enti - bus e -- um.

    Lau - dati - o e -- jus ma -- net ma -- net in sae -- cu -- lum sae -- cu -- li.

    Glori - a Pa -- tri et Fili - o glori - a et Spi -- ritu - i San -- cto.

    Si -- cut e -- rat in prin -- ci -- pio, _ et nunc, et sem -- per.

    Confi - tebor _ ti -- bi ti -- bi ti -- bi Domi - ne.

    Si -- cut e -- rat in prin -- ci -- pio, et nunc, et sem -- per et in sae -- cu -- la sae -- cu -- lo -- rum.

    A - men a - men et nunc, et sem -- per et in sae -- cu -- la  in sae -- cu -- la  sae -- cu -- lo -- rum.

    A - - - men a - - men a - men a - - - men.

    Confi - tebor _ ti -- bi ti -- bi ti -- bi Domi - ne in to -- to to - - - - - - - - - to cor -- de me - o

    in to -- to to - - - - - - - - to cor -- de me -- o.

}


IIbcn = \relative do {

    mib8[fa sol fa]
    mib [sol lab fa]
    mib[fa sol mib]

    %4
    lab4 sol
    fa sib
    mib, r8 mib\f

    %7
    sol4 mib
    lab r8 fa
    la!4 fa

    %10
    sib r8 sib \mbreak
    sib,4 mib
    re r8 sib'\p

    %13
    sib,4 mib
    re r8 sol^\f
    lab4 sol8^\p mib

    %16
    lab4\breathe sol8^\f lab
    sib4 sib,
    mib8\p[sol lab fa]

    %19
    mib[fa sol mib]
    lab4 sol\mbreak  %%% fine sistema 2
    fa sib

    %22
    mib,8[fa sol fa]
    mib do fa mib
    re sib16 do re8 sib

    %25
    mib[re mib re]
    mib[do fa mib]
    re sib do4

    %28
    r8 la sib4
    r8 sol la4
    sib r8 sib\mbreak %%%fine sistema 3

    %31
    do4 re
    mib r8 mib
    lab4 r8 do,

    %34
    re4 mi
    fa r8 fa
    sib4 r8 re,

    %37
    mi4 fad
    sol mi
    fa8[mib? re do]

    %40
    sib[re mib fa]\mbreak %%% fine sistema 4
    sib,[sib' la fa]
    sol4 re

    %43
    mib re
    do fa
    sib8[sib, sib' lab]

    %46
    sol[fa mib sol]
    lab4 sol
    fa sib

    %49
    mib,8[fa sol fa]
    mib[re mib re]\mbreak %%fine sistema 5
    mib[re mib re16 do]

    %52
    re8[mib re sib]
    mib[re mib fa]
    sol[fa mib re]

    %55
    do[fa sib, mib]
    fa[fa, fa' mib]
    re\f[sol do, fa]

    %58
    sol^\p[fa mib do]
    r8 fa,[fa' mib]
    re re, r sib'\mbreak %%%% fine sistema 6

    %61
    mib mib, r re'
    do4 mi
    fa8 fa, r mib'?

    %64
    re4 fad
    sol r8 fa
    mib2

    %67
    re4 r8 re'^\f
    re,4 r8 re'
    re,[mib\breathe fad\p re]

    %70
    sol[sol, sol' fa?]\mbreak %%% fine sistema 7
    mib[re mib do]
    fa4 fad

    %73
    sol, r8 sol'^\f
    sol,4 r8 sol'
    sol,[la\p si sol]

    %76
    do4 r8 do
    re4 r8 re
    mib\f[fa sol mib]

    %79
    lab4\breathe sol8^\p mib
    lab4 \breathe sol8 la^\f \mbreak   %%%% fine sistema 8
    sib sib, do4

    %82
    r8 la si4
    do4 la
    sib?8[do re sib]

    %85
    do4 re
    mib r8 mib\f
    lab4 r8\breathe do,^\p

    %88
    re4 mi
    fa r8 fa\f
    sib4 r8 re,^\p\mbreak %%%% fine sistema 9

    %91
    mi4 fad
    sol8[sol, sib do]
    re4 r

    %94
    re^\f r
    re r
    re^\p r

    %97
    re r8 re
    mib4 fad
    sol do,

    %100
    r la
    sib r
    r sol\mbreak %%% fine sistema 10

    %103
    la r
    r fad
    sol8[la sib do]

    %106
    re[do re re,]
    sol4 r8 sol'^\f
    sol,4 do

    %109
    si8 do r la^\p
    re4 sol
    fad8[\breathe  sol\f] mib do

    %112
    do'4\breathe si8^\p sol
    do4 sib!8 do\f \mbreak %%% fine sistema 11
    re[do re re,]

    %115
    sol4\breathe do,\p re
    mib re sol8 fa
    mib4 si sol'

    %118
    do,2 re4
    mib re sol8 fa
    mib4 si sol

    %121
    la si la
    sol si sol'
    do, r do %% fine sistema 12

    %124
    re r re
    mib re do
    fa sol sol,

    %127
    do\f r do
    re sol sol,
    do do' si

    %130
    do\p si do
    si^\f r sol
    do r lab8 sol

    %133
    fa4 sol sol,\mbreak %%% Fine sistema 13
    do8\f[re mib do]
    fa4^\p re

    %136
    mib8\f[fa sol fa]
    mib[fa sol mib]
    lab4 sol

    %139
    fa sib
    mib,8\p[fa sol lab]
    sol[fa sol mib]

    %142
    lab4  sol
    fa sib\mbreak %%fine sistema 14
    mib,\f sol

    %145
    lab8[\breathe sib\p do lab]
    sol[mib lab sol]
    lab sol16 fa sol8 mib

    %148
    fa[mib reb do]
    reb?4 mib
    lab\f do

    %151
    reb4 re
    mib8 re do lab
    reb4\breathe do8^\p lab\mbreak %%% fine sistema 15

    %154
    reb8 [reb,\breathe do^\f reb]
    mib4 mib,
    lab lab'?\p

    %157
    sol8[fa sol mib]
    lab?[lab,? lab' sol]
    fa[reb16 mib fa8 sol]

    %160
    lab?4 r8 lab
    reb4^\p do8 lab?
    reb4 do8[\breathe re^\f]

    %163
    mib[\breathe mib,\p sol mib]\mbreak %%% fine sistema 16
    re^\f[fa sib re]
    mib[\breathe mib,^\p sol mib]

    %166
    re^\f[fa sib re]
    mib[\breathe mib,^\p sol mib]
    re[sib^\markup {[\musicglyph #"f"]} mib sol]

    %169
    lab[lab, _\markup {[\musicglyph #"p"]}lab' sol]
    fa[fa, fa' mib]
    re[sib do re]

    %172
    mib[fa\f sol mib]
    lab4 sol8 mib\mbreak %% fine sistema 17
    lab4\p sol8 mib

    %175
    fa[\breathe sib^\f] mib,4
    fa8[mib re^\p sib]
    mib re do la

    %178
    re4 r8 re'^\f
    re,4 sol
    fad8[\breathe sol^\p fad re]

    %181
    sol[fa? mib do]
    fa[mib re sib]
    la[la' sib sib,]\mbreak %%%fine sistema 18

    %184
    fa'4 r8 fa,\f
    fa'4 sib
    fa8\p[mib re sib16 do]

    %187
    re4 sib
    do r
    r r8 do'^\f

    %190
    do,4 fa
    mi r8 do'^\p
    do,4 fa

    %193
    mi8^\f[do mi sol] %%% fine sistema 19
    sib[\breathe sib,\p sib' la]
    sol [sol, sol' fa]

    %196
    mi[do re mi]
    fa[\breathe sol\f la fa]
    sib4 la8[\breathe fa\p]

    %199
    sib4 la8 fa
    sol^\f do fa,4
    sol8[\breathe sol,16\p la] si8 sol

    %202
    do4 r
    r8 do16[re mib8 fa]\mbreak %%%fine sistema 20
    mib[re mib do]

    %205
    fa[mib re sib]
    mib[fa sol lab]
    sol[\breathe lab^\p sol mib]

    %208
    re[do sib lab]
    sol mib'16 fa sol8 mib
    lab?4 sol

    %211
    fa sib
    mib, do re
    mib re sol8 fa %%% fine sistema 21

    %214
    mib4 si sol'
    do,2 re4
    mib re sol8 fa

    %217
    mib4 si sol'
    do,8[re mib do]
    si[sol sol' fa]

    %220
    mib[re mib do]
    fa[mib re sib]
    mib[re do lab]

    %223
    reb[do sib re]\mbreak %%%fine sistema 22
    mib4 r8 mib
    sol4 r8 mib\f

    %226
    lab?4 r8 fa\p
    la!4 r8 fa^\f
    sib4 r

    %229
    sib, r
    sib\p r
    sib \parenthesize r

    %232
    sib8[lab sol sol']
    lab4 sol\mbreak %%%%fine sistema 23
    lab8[lab, sol lab]

    %235
    sib4 sib,
    do' r8 do
    re4 r8 re

    %238
    mib8[re do fa]
    sol4 r8 sol
    sol,4 r8 sol'

    %241
    sol,4 r8 sol'
    sol, sol' sol,4
    r8 sol'[sol, si]

    %244
    do4 r8 do
    re4 r8 re\mbreak
    mib[re do fa]

    %247
    sol4\fermata r
    do,8\f^\markup\italic"adag[io]" [re mib do]
    do'4 si

    %250
    do si?8 do
    re4 re,
    sol\breathe do,^\p re

    %253
    mib re sol8 fa
    mib4 si sol'
    do,2 re4

    %256
    mib re sol8 fa
    mib4 si \parenthesize sol'\mbreak
    la, si4. lab?8

    %259
    si4 do sol
    do r do
    re4 r re

    %262
    mib re do
    fa sol sol,
    do do' sib

    %265
    do4 si8 la sol si
    do4 r do,
    re r re\mbreak

    %268
    mib re do
    fa sol sol,
    do r do\f

    %271
    re sol sol,
    do do' si
    do\p si do

    %274
    si2^\f sol4
    do r lab8 sol
    fa4 sol sol,

    %277
    do2 \parenthesize r4

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*2
    s4 <6>
    s <6>
    <7-> <7>
    s2
    <6>
    <5>
    <6>4 <_!>
    <5>2   %%%%% fine 1
    s
    <6>
    s
    <6>4 s8 <6>
    s4 <6> s <6>
    <6 4> <5 3>
    s8 <6> s <6>
    s2
    s4 <6>  %%% fine 2 bar 20
    <7-> <7>
    s2
    <6>4 <3>
    <6> <6>
    <6>8 <6> <6> <6>
    <6>4 <3>
    <6>2
    s8 <6> s4
    s8 <6> <6>4
    s2 %%% fine 3 bar 30
    <7>4 <5->
    s s8 <7->
    <5>4 s8 <5>
    <7>4 <5>
    <_!>2
    s2
    <7>4 <5>
    s <6>
    s <6>
    s2 %% fine 4 bar 40
    s4 <6>
    s <6>
    s <6>
    <7>2
    s
    <6>
    s4 <6>
    <7 _-> <7>
    s4 <6>8\bassFigureExtendersOn <6>\bassFigureExtendersOff
    <6> <6> <6> <6>  % fine 5 bar 50
    <6> <6> <6> \bassFigureExtendersOn <6>\bassFigureExtendersOff
    <6> <5> <6>4
    <6 5>2
    <4 3>4 <6 5>
    s2
    <_!>
    s8 <7 _!> s <_->
    <_!>4 <6>
    s8 <_->\bassFigureExtendersOn <_-> <_->\bassFigureExtendersOff
    <6>4 s %%% fine 6 bar 60
    <5>4 s8 \bassFigureExtendersOn <_>16 <_>\bassFigureExtendersOff
    <_!>4 <6>
    <5>4 s8 \bassFigureExtendersOn <_>16 <_>\bassFigureExtendersOff
    <_+>4 <6>
    <5>4 s8 \bassFigureExtendersOn <_>16 <_>\bassFigureExtendersOff
    <6>2
    <_+>4 s8 <_+>
    s4 s8 <_+>
    <_+>2
    s4 <_!> %%% fine 7 bar 70
    s2
    <6>4 <6>
    <_!> s8 <_!>
    s4 s8 <_!>
    <_!>4 <6>
    s s8 <6->
    <6 3>4 s8 <5->
    s4 <6>
    <5> <6>
    s <6>8 <6> %%% fine 8 bar 80
    s4 <5>
    s8 <6>\bassFigureExtendersOn  <6>4\bassFigureExtendersOff
    s <6>
    s <6>
    <7> <5->
    s2
    <5>4 s8 <6>
    <7 5->4 <5>
    s2
    s4 s8 <6>  %%% fine 9 bar 90
    <7 5>4 <5>
    s <6>
    <_+>2
    <_+>
    <_+>
    <_+>
    <_+>
    <6>4\bassFigureExtendersOn <6>\bassFigureExtendersOff
    s2
    s4 <6 5->
    <5>2
    s4 <5> %%% fine 10 bar 102
    <5!>2
    s4 <6>
    s <6>
    s8 <4> s <_+>
    s4 s8 <_!>\bassFigureExtendersOn
    <_!>4\bassFigureExtendersOff s
    s4 s8 <5!>
    <7 _+>2
    s4 <6>
    s <6>
    s <6> %%% fine 11 bar 113
    <6 4> <5 _+>
    s2 <6>4
    <6> <_!> <_!>
    <6> <6> s
    s2 <6!>4
    <6> <6!> <_!>
    <6> <6> <_!>
    <6> s2
    <_!> 4<5> <_!>
    <5> s <6>  %%% fine 12 bar 123
    <6>4 s s
    <6> <6!> s
    <5> <_!> s
    s2.
    <7>4 <_!> s
    s s <6>
     s <6> s
      <_!> s <7 _!>
      s s <6>8 <_!>
      s4 <4> <_!>  %%% fine 13 bar 133
      s2
      <_->4 <6>
      s2*2
      s4 <6>
      <7>2
      s
      <6>
      s4 <6>
      s2  %%% fine 14 bar 143
      s4 <6>
      s2
      <6>4 s8 <6>
      s4 <6>
      <6->8 <6> <6> <6>
      <6>2
      s4 <5->
      <_-> <5->
      <_-> <6->
      <5-> <6->%%% fine 15 bar 153
      <5-> <6>
      <6 4> <5 4>
      s2
      <6>4 \bassFigureExtendersOn <6>\bassFigureExtendersOff
      <5>2
      <6>4\bassFigureExtendersOn <6> \bassFigureExtendersOff
      s2
      <5->4 <6->
      <5-> <6->8 \bassFigureExtendersOn <6-> \bassFigureExtendersOff
      s4 <6> %%% fine 16 bar 163
       <6>4\bassFigureExtendersOn <6>
       <5>4 <5>
       <6> <6>
       <5> <5>
       <6>4 <5>8 <5>\bassFigureExtendersOff
       <5>2
       <_->
       <6>4\bassFigureExtendersOn <6> \bassFigureExtendersOff
       s <6>
       s <6> %%% fine 17 bar 173
       s4 <6>
       <_!>8 <5> <6>4
       <_!> <6>
       <5>8\bassFigureExtendersOn <5> <6>4\bassFigureExtendersOff
       <_+> s8 <_+>
       s2
       <6>4 <6>
       s <6>8 <_!>
       <_!>4 <6>
       s2 %%% fine 18 bar 183
       s2
       s
       s4 <6>
       <6>  <6 >8 <5>
       <_!>2
       s4 s8 <_!>
       s2
       <6>4 s8 <_!>\bassFigureExtendersOn
       <_!>4 s
       <6>2\bassFigureExtendersOff %%% fine 19 bar 193
       <5>2
       <5>
       <6>
       s4 <6>
       s <6>
       s <6>
       <7 _!>
       <6 _!>
       <_!> <6>
       s2
       s4 <6>%%% fine 20 bar 203
       s4 <6>
       <_-> <6>
       s2
       <6>4\bassFigureExtendersOn <6>\bassFigureExtendersOff
       <6>2
       <6>4\bassFigureExtendersOn <6>
       s <6>
       <7> <7>
       s s <6\\>
       <6> <6!> <_!>8 <_!>\bassFigureExtendersOff  %%% fine 21 bar 213
       <6>4 <6> s
       s2 <6!>4
       <6> <6!> <_!>
       <6> <6> s
       s <6>
       <6>8 <_!>8 \bassFigureExtendersOn <_!> <_!>\bassFigureExtendersOff
       <6>2
       <_->4 <6>
       s <6->
       <5> <5> %% fine 22 bar 223
       <5>2
       <6>
       s
       <6>4 s8 <_!>
       s2*4
       <_->4 <6>
       s <6> %%% fine 23 bar 233
       s4 <6>
       <6> <4 3>
       s4 s8 <6->
       <6>4 s8 <6->
       <6>8 <6!> s4
       <_!> s8 <_!>
       s2*4
       s4 s8 <6-> <6>4 s8 <6!> %%% fine 24 bar 243
       s2*3
       s4 <6>
       s <6>
       <6 4> <5 _+>
       s <6> <6!>4
       <6>4 <6!> <_!>
       <6> <6> <_!>
       s2 <6!>4
       <6> <6!> <_!>
       <6> <6> s
       <6> s <6>
       <5> s <_!>
       s2.
       <_!>4 s <6!>
       <6> <6!> s
       s <_!> s
       s s <6>
       s s <6>8 <_!>
       s2.
       <5!>4 s <6!>
       <6> <6!> s
       s <_!> s
       s2.
       <5>4 s <_!>
       s2 <6>4
       s4 <6> s
       <6>2 <7 _!>4

}

forma = {

    \time 2/4
    \override Staff.TimeSignature.style = #'single-digit
    \key sib\major
    \tempo 2 = 50
    s2*114\break
    \mark\markup\huge "[3.] Larghetto"
    \time 3/4
    \tempo 2 = 50
    s2.*19\break
    \mark\markup\huge "[4.] [Allegro]"
    \time 2/4
    \tempo 2 = 50
    s2*78\break
    \mark\markup\huge "[5.] [Larghetto]"
    \time 3/4
    \tempo 2 = 50
    s2.*6\break
    \mark\markup\huge "[6.] Allegro"
    \revert  Staff.TimeSignature.style
    \time 2/4
    \tempo 2 = 50
    s2*34\break
    \mark\markup\huge "[7.] [Larghetto]"
    \time 3/4
    \tempo 2 = 50
    s2.*26
    \bar"|."

}



IIvlI = {
    \IIglobal
    %\notypeset
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}

IIvoce = {
    \new Voice = "memoria"
    \IIglobal
    \clef bass
    <<\IIvocen \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = "Confitebor ZWV 71"
    %subsubtitle = #(string-append "  ")
    composer = \markup \center-column{"   ""J. D. Zelenka (1679-1745)"}
}

\markup \huge {[1.] Larghetto}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""Primo]"}
            \IvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""Secondo]"}
            \IvlII
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \set Staff.midiInstrument = #"voice oohs"
            \Ivoce
            \new Lyrics \lyricsto "confitebor" \Itesto
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"[Basso""continuo]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 8)  %aumenta lo spazio orizzontale
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

\markup \huge {[2.] Allegro}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"voice oohs"
            \IIvoce
            \new Lyrics \lyricsto "memoria" \IItesto
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 8)  %aumenta lo spazio orizzontale
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



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
