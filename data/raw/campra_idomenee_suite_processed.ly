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

dolce = _\markup\italic"doux"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { seul }

tu = ^\markup \italic "tous"

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
        \musicglyph "scripts.prall"
    }
}



mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Idsn =  \relative do'' {

    re4 sib fa'4. sib8
    la4.-+ sol8 fa4 mib8-+ re
    mib4. re8 do4 re8 mib

    %4
    re2-+~re8 re mib fa
    sib,4. sib8 sib4.-+ la8
    sol4. sol8 mib'4 do

    %7
    fa re sib'4. sib8
    sib2~sib8 sib lab-+ sol
    lab4. lab8\mbreak sol4 lab

    %10
    fa4. sol8 sol4.-+ fa8
    mi4 do fa4. la,8
    sib4. sib8 sib4. do8

    %13
    la4._+(sol16 la) sib8 sib do re
    mib4. re8 re4.-+ do8
    do1 do\mbreak

    %16
    r4 sib re
    fa8 mib fa sol la fa
    sib4 la8 sol fa mib

    %19
    re4.-+ mib8 fa re
    sol lab sol fa mib re
    do4 fa4. fa8

    %22
    fa mib re do sib do
    la4-+ fa'2
    re4 sib fa'\mbreak

    %25
    sib4. la8 sol fa
    mi4. mi8 fa sol
    la2~la8 sib

    %28
    la sol sol4.-+ fa8
    fa4 do do8 re
    mib4. mib8 re-+ do

    %31
    re4 sib' sib8 la
    sol2 sol4
    do4. sib8 la sol\mbreak

    %34
    fad mi re do sib la
    sib4 sol re'
    sol4. fa8 mib re

    %37
    do re do sib la sol
    fad4. fad8 sol4~
    sol8 la la4._+ sol8

    %40
    sol2 sol4
    mib'4. fa8 sol4
    do,2 do4

    %43
    lab'8 sol fa mib re do\mbreak
    si do re mib fa re
    mib2.~

    %46
    mib8 re re4.-+ do8
    do2.
    r4 do4. do8

    %49
    fa2.
    r4 re4. re8
    sol4. fa8 mib re

    %52
    do4 la_+ sib~
    sib8 do do4.-+(sib16 do)\mbreak
    re8 do sib do re mib

    %55
    fa sol lab4. sib8
    sol2.-+~
    sol4 do4. sol8

    %58
    la4. sol8 la fa
    sib4 fa4.-+(mib16 fa)
    sol8 fa mib re do sib

    %61
    mib4. re16 do re4. mib8 do4.-+ sib8
    sib1
    r4 r8 sib re4 sib\mbreak

    %64
    mib4. fa8 fa4.-+(mib16 fa)
    sol4 mib lab2~
    lab8 lab sol-+ fa sol4. sol8

    %67
    sol4. fa8 fa4.-+ mib8
    mib4. sol8 sol4 mib
    do4.(sib16 la)(sib4.) do8

    %70
    la4._+ sib8 do4 re
    \appoggiatura do8 sib4 \appoggiatura la8 sol4 mib'4. re8
    do8. sib16(la4) fa'4. re8

    %73
    sol4. mib8 la4. fa8
    sib4.(la16 sol) fa2~
    fa4 do8. re16 do4.-+ sib8

    %76
    sib1

}

Ihcn = \relative do'' {

    sib2 sib4 re
    do4. sib8 do4 sib
    sib2 la4._+(sol16 la)

    %4
    sib2 fa4. fa8
    sol2 fa4. fa8
    mib4 sol sol la

    %7
    re2 re4. re8
    do2 do4. do8
    do2\mbreak mib4. mib8

    %10
    reb2 reb4. reb8
    do4 sol la4. la8
    sol2~sol8 sol fa mi

    %13
    fa2 fa4. fa8
    fa2 fa4 sib
    la1_+ la\mbreak

    %16
    R2.*2
    r4 fa la
    sib8 la sib do sib la

    %20
    sol fa sol la sib4~
    sib la do
    re sib fa

    %23
    fa8 sol la sib do la
    sib4. la8 sib do\mbreak
    re2 re4

    %26
    do2 do4
    do4. la8 sib do
    re4 do4. do8

    %29
    do4 fa, la
    do8 sib la sol fa mib
    re4 re' re8 do

    %32
    sib2 sib4
    mib2 mib4\mbreak
    re la4. la8

    %35
    sol2 sib4
    mib sol,4. sol8
    la4 la re,

    %38
    re2 re4
    sol fad4. sol8
    sol2 sol4

    %41
    sol do sol
    lab2.
    lab?4 lab4. lab8\mbreak

    %44
    sol8 la si do re4
    do2 do4
    do si4. do8

    %47
    do2.
    r4 la4. la8
    re2.

    %50
    r4 sib4. sib8
    mib4. re8 do sib
    la4 fa fa

    %53
    sib la4._+(sol16 la)\mbreak
    sib2 r4
    r re fa

    %56
    mib2 sib4
    do2 do4
    do2.

    %59
    re2 re4
    sib2 sib4
    la2_+ sib4. do8 la4._+ sol8

    %62
    sib1
    r4 r8 sib sib4 sib\mbreak
    sib2 lab

    %65
    sol4 sib do4. do8
    re4 sib mib2~
    mib re4.-+ mib8

    %68
    mib2 sol,4. sol8
    sol2. sol4
    fa2. la4

    %71
    sol2. sol4
    la4. la8 sib2~
    sib4. sib8 la4. do8

    %74
    sib4. sib8 do4 re
    sib2 la4._+ sib8
    sib1

}

Itln =  \relative do' {

    fa2 fa4. fa8
    fa4. sib8 la-+ sol fa4
    sol2 fa4. fa8

    %4
    fa2 re4. re8
    mib2 fa4 re
    sib2 do4. do8

    %7
    sib4 fa' sol4. sol8
    sol2 sol4. sol8
    fa4. fa8\mbreak sol4 mib

    %10
    fa2 sib4. sib8
    sol2-+ fa4. fa8
    sol4 do, do4. do8

    %13
    do2 re4. re8
    do4. do8 re4 fa
    fa1 fa\mbreak

    %16
    R2.*3
    r4 sib, re
    mib8 re mib fa sol mib

    %21
    fa4. sol8 fa mib
    re2 re4
    do8 sib la sol fa4

    %24
    fa' fa4. fa8\mbreak
    sol4 sol4. sol8
    sol4. sol8 fa mi

    %27
    fa2 fa4
    fa mi4. fa8
    fa2.

    %30
    r4 fa fa
    fa2 fa4
    mib? sol sol

    %33
    sol do4. sib8\mbreak
    la sol fad mi? re4~
    re sol4. sol8

    %36
    sol la sib4 do~
    do do,4. do8
    do4. la8 sib do

    %39
    re4 re4. re8
    re2 mib4
    mib2 mib4

    %42
    mib2 mib4
    fa8 sol lab sol fa mib\mbreak
    re4 sol4. sol8

    %45
    sol2 lab4
    lab? sol re
    mib2.

    %48
    r4 fa4. fa8
    fa2.
    r4 sol4. sol8

    %51
    sol4 mib4. mib8
    mib4. re16 do re4~
    re8 mib do4.-+ sib8\mbreak

    %54
    sib2.
    r4 sib' sib
    sib4. la8 sol fa

    %57
    mib4 mib sol
    fa2 fa4
    fa sib4. la8

    %60
    sol2 sol4
    fa2 fa fa4. fa8
    re1

    %63
    r4 r8 fa fa4 fa\mbreak
    sol2 re4.-+(do16 re)
    mib2. do4

    %66
    fa2 mib4 sol
    lab4. lab8 lab4. sib8
    sol2 sib,4 do

    %69
    do2. do4
    do2. fa4
    re2 sol4. sol8

    %72
    fa2. fa4
    mib4. sol8 fa4. la8
    sol4. sib8 la sol fa4

    %75
    fa sol fa4.-+ fa8
    fa1

}

Ibcn = \relative do {

    sib'2 re,4 sib
    fa'4. sol8 la4 sib
    mib,2 fa4 fa,

    %4
    sib2 lab4. lab8
    sol2 re'4. re8
    mib2 do4 fa8 mib

    %7
    re do sib la sol4 sol'
    do2 do,4.  do8
    fa4. fa8\mbreak mib4 do

    %10
    reb2~reb8 do reb sib
    do4 do'8 sib la4 sib8 do
    mi,2. do4

    %13
    fa fa8 mib? re4 mib8 fa
    la,4 fa sib sib,
    fa'4. fa'8 la4 fa fa,1

    %16
    R2.*5
    r4 fa' la
    sib sib, re

    %23
    fa8 mib fa sol la fa
    sib do re do sib la\mbreak
    sol4 sol sib

    %26
    do8 re do sib la sol
    fa sol fa mib re do
    sib4 do2

    %29
    fa,2.
    r4 fa' la
    sib sib, re

    %32
    mib8 re mib fa mib re
    do sib do re mib do\mbreak
    re do re mi fad re

    %35
    sol4 sib sol
    mib mib' do
    la8 sib la sol fad mi

    %38
    re mib? re do sib la
    sol4 re' re,
    sol sol' mib

    %41
    do8 sib do re mib do
    lab' sib do sib lab sol
    fa mib fa sol lab fa\mbreak

    %44
    sol4 sol si
    do8 re do sib? lab sol
    fa4 sol sol,

    %47
    do8 sib do re mib do
    fa mib fa sol fa mib
    re do re mib fa re

    %50
    sol fa sol lab sol fa
    mib re mib fa sol mib
    fa sol fa mib re do

    %53
    sib4 fa' fa,\mbreak
    sib2.
    r4 sib re

    %56
    mib8 fa sol fa mib re
    do4 do mib
    fa8 mib fa sol fa mib

    %59
    re do re mib fa re
    mib re mib fa sol mib
    fa2 sib, fa

    %62
    sib4. sib'8 sib4 fa
    lab2. lab4\mbreak
    sol2 fa

    %65
    mib do4. do8
    sib2. sib4
    lab2 sib

    %68
    mib, mib'4. mib8
    mi2. mi4
    fa2. re4

    %71
    sol2. do,4
    fa2 re4 sib
    mib,4. mib'8 fa4. fa8

    %74
    sol4. sol8 la4 sib
    re, mib fa fa,
    sib1

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    <6>1
    s
    s
    <7 _+>
    <_->2 <6>4 <6->
    <6>1
    <_+>
    s2. <_+>4
    s2 <6>4 <6>8 <6>
    <5/>1
    s
    s
    s2.*9
    s2 <6>4
    <_+> s <6>8 <6+>
    s2.
    <7>4 <_+>2
    s2.*4
    s2 <6 4>4
    <_+>2.
    s2.*3
    <_+>2 <6>4
    s <_+> s
    s2.
    s
    s2 <_->4
    s2 <6 4>4
    <_+>2.
    s
    <7 _->4 <_+> s
    s2.*14
    <7>1.
    s1
    <6 4>
    <6>2 <6 _->
    s <_->
    <7->2 <4>
    <7>1
    s
    s
    s
    <6>
    s2 <6>
    s1
    s2 <6>
    <6>4 <6 5>

}

forma = {

    \key sib\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 2 = 68
    \repeat volta 2 {s1*14}
    \alternative {{s1}{s}}\set Score.currentBarNumber = #16
    \bar ".|"\break \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup "Reprise"
    \time 3/4
    \tempo 2. = 75
    s2.*45
    s1.\break
    \set Score.currentBarNumber = #62
    \mark\markup "Lentement"
    \time 2/2
    \tempo 2 = 55
    s1*15
    \bar"|."

}

Ids = {
    \Iglobal
    <<\Idsn \forma>>

}

Ihc = {
    \Iglobal
    <<\Ihcn \forma>>

}

Itl = {
    \Iglobal
    <<\Itln \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIdsn =  \relative do'' {

    re4 \appoggiatura do16 sib4 \appoggiatura la16 sol4
    mib' re4. re8
    sol4 sol4. la8

    %4
    fad4.-+ mi?8(re4)
    sib' la4.-+ sib8
    \appoggiatura la16 sol4. fa8 [mib8. re16]

    %7
    do[(sib8 do16)] do4.-+ re8
    re2.
    la'4 fad8.-+ mi16(re4)

    %10
    sol4. sol8 re4-+
    mib sol, do
    la4._+ sol8 fa4

    %13
    fa' sib4. re,8
    sol4. do,8 fa4
    mib8 re do4.-+ sib8

    %16
    sib2.
    re4 re4.-+ re8
    mib4. si8 do4

    %19
    re8 mib re4.-+(do16 re)\mbreak
    mib4. re8(do4)
    re la'4. sib8

    %22
    la4 re,4. sib'8
    la sol fad4.-+ sol8
    sol4. fa8 mib4

    %25
    re do4.-+ sib8
    mib4. la,8 fad4
    sol8 la la4.-+ sol8

    %28
    sol2.
    re'4 la'4. sib8
    la4 re,4. sib'8

    %31
    la sol fad4.-+ sol8
    sol4. fa8 mib4
    re do4.-+ sib8

    %34
    mib4. la,8 fad4
    sol8 la la4.-+ sol8
    sol2.

}

IIhcn = \relative do'' {

    sol2 sol4
    la2 sib4
    sib sib do

    %4
    re2.
    re4 re4. re8
    re2 sol,4~

    %7
    sol sol4. la8
    fad2.\mbreak
    re'2 re4

    %10
    re4. do8 si la
    sol2 sol4
    fa2 r4

    %13
    re'2 r4
    sib2 sib4
    sib la4._+ sib8

    %16
    sib2.
    sib4 sib4. sib8
    sib4. lab8 sol4

    %19
    do si4. si8\mbreak
    do4. sib8 la4
    sib do4. re8

    %22
    re2 re4
    mib re4. do8
    sib2 la4

    %25
    sib fad4. sol8
    mib2~mib8 mib
    re sol fad4._+ sol8

    %28
    sol2.
    sib4 do4. re8
    re2 re4

    %31
    mib re4. do8
    sib2 la4
    sib fad4. sol8

    %34
    mib2~mib8 mib
    re sol fad4._+ sol8
    sol2.

}

IItln =  \relative do' {

    re2 mib4~
    mib la, re~
    re re do

    %4
    la2 re4
    sol fa4. fa8
    fa4 re mib

    %7
    re mib do
    la2.
    la'2 la4

    %10
    sol2 sol8 fa
    mib2 mib4
    do2-+ r4

    %13
    fa2 r4
    mib2 sib4
    sol' fa4. fa8

    %16
    re2.
    fa4 fa4. fa8
    sol4. fa8 mib4

    %19
    lab re, sol\mbreak
    sol2 fa4
    fa fad4. sol8

    %22
    la2 sol4
    la la4.-+ sol8
    sol2 do4

    %25
    fa, la4. re,8
    mib2 do4
    re8 mib re4 la

    %28
    sib2.
    fa'4 fad4. sol8
    la2 sol4

    %31
    la la4.-+ sol8
    sol2 do4
    fa, la4. re,8

    %34
    mib2 do4
    re8 mib re4 la
    sib2.

}

IIbcn = \relative do {

    sol'2.
    fa
    mib

    %4
    re4 re'8 do sib la
    sol4 re2
    si do4

    %7
    sol8 fa mib2
    re2.\mbreak
    re'4 re' do

    %10
    si2.
    do2 do,4
    fa4. fa8 mib4

    %13
    re2 r4
    mib2 re4
    mib fa fa,

    %16
    sib2 sib'4
    lab2.
    sol4. re8 mib4

    %19
    fa sol sol,\mbreak
    do2 fa4
    sib la4.-+ sol8

    %22
    re2 sib4
    do re re'
    mib4. re8 do4

    %25
    sib la4.-+ sol8
    do,2~do8 la
    sib do re4 re,

    %28
    sol2.
    sib '4 la4.-+ sol8
    re2 sib4

    %31
    do re re'
    mib4. re8 do4
    sib la4.-+ sol8

    %34
    do,2~do8 la
    sib do re4 re,
    sol2.

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6->4
    <_-> s <6>
    <7> s <6>
    <_+>2.
    s4 <_+> s
    <6>2 <_+ _->4
    s2.
    <_+>2 s4
    \bassFigureExtendersOn <_+>4 <_+> <_+>
    s2.
    <_->
    <_>4 <_> <_>
    <6>2 s4
    s4 <6 4>8 <4> <6 4>4
    s2.*2
    \bassFigureExtendersOff <6 4>2.
    <6->4. <6+>8 <6>4
    <_-> <_+> s
    <_->2.
    s4 <6+> s
    <_+> s <6>
    <_- 6> <_+> s
    s4. <6>8 <_->4
    <6> <6+> s
    <_->4 s8 <6> <6 4+>4
    <6> <_+> s
    s2.
    s4 <6+> s
    <_+> s <6>
    <_- 6> <_+> s
    s4. <6>8 <_->4
    <6> <6+> s
    <_->4 s8 <6> <6 4+>4
    <6> <_+>

}

forma = {

    \key fa\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2 = 57
    s2.*8
    \bar ":..:"\break
    s2.*20
    \bar ":|."\break
    \mark\markup "Reprise"
    s2.*8
    \bar"|."

}

IIds = {
    \IIglobal
    %\notypeset
    <<\IIdsn \forma>>

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
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIobIn =  \relative do'' {

    R1
    R1.*4\mbreak
    r2 mi4 fad4. sol8 fad4
    mi2-+ la4 la4. sol8 fad4

    %7
    mi2-+ mi4 fad8(sol) mi(fad) sol(la)
    fad4-+ re la re4. mi8 dod4-+
    re2 r1

    %10
    R1.*4\mbreak
    r2 la4 do4. si8 la4
    la2_+ re4 re4. do8 si4

    %16
    la2 _+ re4 mi8(re) do(si) la(sol)
    fad4_+ re sol sol4. la8 fad4_+
    sol2 re'4 mi fad4.-+(mi16 fad)

    %19
    sol4 re re mi8(sol) fad(sol) la(fad)
    sol4 re sol sol4. la8 fad4-+
    sol2

}

IIIobIIn =  \relative do'' {

    r1
    R1.*4
    r2 dod4 re la re
    dod2 la4 re la re

    %7
    dod2-+ mi4 fad8(sol) mi(fad) sol(la)
    fad4-+ re la re4. mi8 dod4-+
    re2 r1

    %10
    R1.*4\mbreak
    r2 mi,4 la4. la8 sol4
    fad2 fad4 sol re sol

    %16
    fad2_+ re'4 mi8(re) do(si) la(sol)
    fad4_+ re sol sol4. la8 fad4_+
    sol2 re'4 mi fad4.-+(mi16 fad)

    %19
    sol4 re re mi8(sol) fad(sol) la(fad)
    sol4 re sol sol4. la8 fad4-+
    sol2

}

IIIdsn =  \relative do'' {

    re4 sol,4. la8 si4
    la4. si8 do4 re la_+ sol
    re'2 re4 mi4. sol8 fad4-+
    sol re sol sol4. la8 fad4-+

    %4
    sol2 la8-+(sol16 la) si8(la) sol(fad) mi(re)\mbreak
    dod4 la r1
    R1.

    %7
    mi'2-+ mi4 fad8(sol) mi(fad) sol(la)
    fad4-+ re la re4. mi8 dod4-+
    re2 la4 fad4._+ mi8 re4

    %10
    sol2 re'4 si4.-+ la8 sol4
    do2 do4 re re4.-+(do16 re)
    mi4 do re8-+(do16 re) mi4 re8 do si la

    %13
    sold4_+ mi la la4. si8 sold4_+\mbreak
    la2 r1
    R1.

    %16
    r2 re4 mi8(re) do(si) la(sol)
    fad4_+ re sol sol4. la8 fad4_+
    sol2 re'4 mi fad4.-+(mi16 fad)

    %19
    sol4 re re mi8(sol) fad(sol) la(fad)
    sol4 re sol sol4. la8 fad4-+
    sol2

}

IIIhcn = \relative do'' {

    r2 r4 sol
    fad4. sol8 la4 sol re mi
    fad2 si4 sol la2
    si re4 re2 re4

    %4
    re2 re4 re4. do8 si4\mbreak
    la2 r4 r2 r4
    R1.

    %7
    r4 r dod re dod4. dod8
    re4 la la la si la
    la2 r4 r r re,

    %10
    re2 r4 r r sol
    sol2 do4 do si4.-+(la16 si)
    do2 si4-+ do fa,4. fa8

    %13
    mi2 mi4 mi mi4. mi8\mbreak
    mi2 r4 r2 r4
    R1.

    %16
    r4 r sol mi2 mi4
    re2 mi4 mi re re
    re2 si'4 do do2

    %19
    re si4 do4. si8 la4
    re8(do) si(do) re(mi) re4 re4. re8
    si2

}

IIItln =  \relative do' {

    r2 r4 re
    re2 re4 re re dod
    re2 sol4 sol mi la
    sol2 re4 re2 re4

    %4
    re2 fad4 sol8(la) si(la) sol(fad)\mbreak
    mi2-+ r4 r2 r4
    R1.

    %7
    r4 r la la la4. la8
    la4 fad re fad4. fad8 mi4
    fad2\mbreak r4 r r la,

    %10
    si2 r4 r r re
    mi2 sol4 sol sol2
    sol sol4 mi fa8(mi) re(do)

    %13
    si2 do4 do si2_+\mbreak
    la r4 r2 r4
    R1.

    %16
    r4 r sol' sol mi la,
    la si2 do4 la4._+ la8
    si2 sol'4 sol la2

    %19
    si sol4 sol la4. la8
    si2. la4 la2-+
    sol

}

IIIbcn = \relative do {

    r2 r4 sol'
    re2 re'4 sol, fad mi
    re2 si4 do8 si la si do re
    si la sol la si do re4 re,2

    %4
    sol re'4 sol8(fad) sol(la) si(sol)\mbreak
    la2 la4 fad8^\markup\italic "Bassons" (mi) re(mi) fad(sol)
    la4. sol8 fad mi re(dod) re(mi) fad(sol)

    %7
    la2 la4\tu re la2
    re,4. mi8 fad4 fad, sol la
    re,2\mbreak r4 r r re'

    %10
    si sol r r r sol'
    mi do do sol2 sol4
    do2 sol4 do re2

    %13
    mi8(re) do(si) la(si) do(re) mi4 mi,\mbreak
    la2 la'4^\markup\italic "Bassons" la fad sol
    re4. do8 si la sol(fad) sol(la) si(do)

    %16
    re2 si4\tu do8(si) do(re) mi(do)
    re4 si mi do re re,
    sol2 sol'4 do la2-+

    %19
    sol sol4 do8 si la si do re
    si la sol la si do re4 re, re,
    sol2

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s <6>4 <6+>
    s1.
    <6>2. <4>4 <3>2
    s1.
    <_+>
    <_+>
    <_+>1 <_+>2
    s <6> s4 <_+>
    s1.
    s
    <6>
    s1 <_->2
    <_+>1 <4>4 <3+>
    s1.*2
    s2 <6>1
    s1.
    s1 <6>2
    s1 <6>2
    <6>1 <4>4 <3>

}

forma = {

    \key sol\major
    \time 6/4
    \tempo 2. = 60
    \partial 1 s1
    s1.*8
    s2
    \bar ":..:"\break
    s1
    s1.*11
    s2
    \bar":|."

}

IIIobI= {
    \IIIglobal
    <<\IIIobIn \forma>>

}

IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

}

IIIds = {
    \IIIglobal
    <<\IIIdsn \forma>>

}

IIIhc = {
    \IIIglobal
    <<\IIIhcn \forma>>

}

IIItl = {
    \IIIglobal
    <<\IIItln \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma\IIIbfn>>

}



IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVdsn =  \relative do'' {

    sol'2 re4.-+ re8
    mib4. re8 dod4. sib8
    la4 la' fad-+ re

    %4
    sib'4. la8 sol4 la8 sib
    la4-+ fa? la4. la8
    sol4.-+ fa8 mi fa sol la

    %7
    dod,4-+ mi la,4. la8
    re4 mi8 fa mi fa sol mi\mbreak
    fa fa sol la mi4.-+ re8

    %10
    re1 re2 la4 re
    si-+ sol mib'4. mib8
    mib?4. re8 re4. re8

    %13
    re mib re si do2~
    do4. re8 re4.-+ do8
    do4. do8 sol4 do

    %16
    la4._+ sol8[fa sol la fa]\mbreak
    sib4. do8 do4.-+(sib16 do)
    re8 do sib do re mib fa re

    %19
    sol4. sol8 la4 fa
    sib4. la8 sol fa mib re
    mib do re mib do4.-+ sib8

    %22
    sib4. re8 re mi? fa re
    sol4. sol8 mi fa sol mi
    la4. la8 la4 re,

    %25
    sol4. fa8\mbreak mib re do sib
    la fad sol la la4._+ sol8
    sol sol sib sol mib'2~

    %28
    mib8 mib re-+ do re re mib fad %% reprise
    sol4. la8 fad4.-+ sol8
    la2~la8 sib la fad

    %31
    sol4. la8 la4.-+ sol8
    sol sol, sib sol mib'2~
    mib8 mib re-+ do re re mib fad %% reprise

    %34
    sol4. la8 fad4.-+ sol8
    la2~la8 sib la fad
    sol4. la8 la4.-+ sol8

    %37
    sol1

}

IVhcn = \relative do'' {

    sib2 si4. si8
    do4 sol la4. sib?8
    fad2. re'4

    %4
    re sib do4. do8
    do2 la4._+ la8
    sib4. do8[sib la sol fa?]

    %7
    mi2. la4
    la4. si8[dod re mi dod]\mbreak
    re4 re dod4. re8

    %10
    re1 re2 re,4 fad
    sol4. sol8 sol4. sol8
    lab2~lab8 lab sol fa?

    %13
    sol2~sol8 sol fa sol
    la4 do si4. do8
    do4 sol sol4. sol8

    %16
    fa2. fa4\mbreak
    fa4. sol8 la sib do la
    sib2. sib4

    %19
    sib mib do re
    re4. re8 mib sib la sib
    do4 sib la4._+ sib8

    %22
    sib2 sib4. sib8
    sib do re sib do4. do8
    do2 re4 re

    %25
    re2\mbreak do8 sol fad sol
    mib4 re8 sol fad4._+ sol8
    sol2~sol8 sib la sol

    %28
    la la sib do sib4. sib8 %%% ripresa
    sib4 mib re4. re8
    re2. mib4

    %31
    re sol, re' la
    sib2~sib8 sib la sol
    la la sib do sib4. sib8

    %34
    sib4 mib re4. re8
    re2. mib4
    re sol, re' la

    %37
    sib1

}

IVtln =  \relative do' {

    re2 sol4. sol8
    sol4. sol8 fad4. sol8
    la2. fad4

    %4
    sol2 sol4 sol
    fa?2~fa8 fa sol la
    re,4. re8 mi re dod re

    %7
    mi2 mi4. mi8
    fa4 la la4. la8\mbreak
    la4 sib la4. la8

    %10
    la1 la2 re,4. re8
    re2 sol4 mib
    do2 fa4. fa8

    %13
    mib2~mib8 do re mib
    fa4. fa8 fa4 re
    mib2. mib4

    %16
    do4.-+ sib8[la sib do la]\mbreak
    re4 fa fa4. fa8
    fa4. mib8 re do sib4

    %19
    sol'2 fa4 la
    sol4. la8 sib sib do fa,
    fa4 fa8 sol fa4. fa8

    %22
    re2 fa4. fa8
    sib4. sib8 sol4. sol8
    la2 fad4. fad8

    %25
    sol2\mbreak sol4 la8 re,
    do4 sib8 mib re4. re8
    re2 sol4. sol8

    %28
    do,4 fa fa sib8 la
    sol4 do la4.-+ sol8
    re4. mi8 fad sol la4

    %31
    re, sol fad4. sol8
    sol2 sol4 sol
    do,4 fa fa sib8 la

    %34
    sol4 do la4.-+ sol8
    re4. mi8 fad sol la4
    re, sol fad4. sol8

    %37
    sol1


}

IVbcn = \relative do {

    sol'2 sol,4. sol8
    do4. sib8 la4._+ sol8
    re'2. re'4

    %4
    sib sol do do,
    fa2~fa8  fa mi re
    sib'4. la8[sol fa mi re]

    %7
    la'2~la8 la sol la
    fa4 mi8 re dod4 la\mbreak
    re sol, la2

    %10
    re, re''8 do sib la re,,4. re'8 fad4 re
    sol4. sol8 mib4 re
    fa2~fa8 fa mib re

    %13
    mib2~mib8 mib re do
    fa4 lab sol sol,
    do4. do8 mib4 do

    %16
    fa2. fa4\mbreak
    re sib la fa
    sib4. la8[sib do re sib]

    %19
    mib4 do fa re
    sol4. fa8 mib re do sib
    la4 sib8 mib, fa2

    %22
    sib sib'4. sib8
    sol la sib sol do4. do8
    la sib do la re4. do8

    %25
    si la sol4\mbreak do8 sib? la sol
    do, la sib do re4 re,
    sol2~sol8 sol' fa mib

    %28
    fa fa sol la sib sib do re
    mib4 do re4. sol,8
    fad4. mib?8 re4 do

    %31
    sib do re re,
    sol2~sol8 sol' fa mib
    fa fa sol la sib sib do re

    %34
    mib4 do re4. sol,8
    fad4. mib?8 re4 do
    sib do re re,

    %37
    sol1

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <_->4 s8 <6> <6+>2
    <_+>1
    <6>
    s
    <6>4 s8 <6> <6> <6> <6+>4
    <_+>1
    <6>2 s4 <_+>
    s2 <_+>
    <_+>1
    <_+>
    <_+>
    <_->2 <_->8 <6> s4
    <7>2 <6>
    <_-> <_+>
    <_->1
    s
    <6>
    s
    s4 <_-> s2
    s2 s8 <6> <6 _->4
    <5/>1
    s
    s
    s2 <_+>
    s4 <_+>  <_->8 <6> <6+>4
    <6 _->8 <6+> <6> <6 _-> <_+>2
    s1
    <_-> %%%% reprise
    s4 <_-> <7 _+>2
    \bassFigureExtendersOn <_>2 <_>4 <_>\bassFigureExtendersOff
    <6>4 <_-> <_+>2
    s1
    <_-> %%%% reprise
    s4 <_-> <7 _+>2
    \bassFigureExtendersOn <_>2 <_>4 <_>\bassFigureExtendersOff
    <6>4 <_-> <_+>2

}

forma = {

    \key fa\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 2 = 68
    \repeat volta 2 {s1*9}
    \alternative {{s1}{s}}\set Score.currentBarNumber = #11
    s1*22\break
    \mark\markup "Reprise"
    s1*5
    \bar"|."

}

IVds = {
    \IVglobal
    <<\IVdsn \forma>>

}

IVhc = {
    \IVglobal
    <<\IVhcn \forma>>

}

IVtl = {
    \IVglobal
    <<\IVtln \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


Vglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Vdsn =  \relative do'' {

    sol'4 sol re
    sol2 re4
    mi fa8 mi re do

    %4
    si4-+ la8 si sol4
    si do8 si la sol
    re'4 sol2

    %7
    fad4 sol4.-+(fad16 sol)
    la2.
    la4 re, la'

    %10
    la2 la8-+(sol16 la)
    si4 la-+ sol
    la8 sol fad-+ mi re4

    %13
    sol si,8 do re4\mbreak
    la si8 do re4
    la la4._+(sol16 la)

    %16
    si4 la8 si sol4
    si do8 si la_+ sol
    re'2 re4

    %19
    re sol fad-+
    sol2.

}

Vhcn = \relative do'' {

    si4 si la
    sol2 sol4
    sol sol fad

    %4
    sol2 sol4
    sol re sol
    fad re'2

    %7
    re4 re2
    re2.
    re4 re re

    %10
    re2 re4
    re re dod
    re2 r4

    %13
    sol,2 r4\mbreak
    sol2 sol4
    sol fad4._+(mi16 fad)

    %16
    sol2 sol4
    sol re sol
    fad2_+ si4

    %19
    re do la
    si2.

}

Vtln =  \relative do' {

    re4 re re
    mi2 sol4
    mi re re

    %4
    re2 re4
    re re mi
    fad sol2

    %7
    la4 si2
    fad2.-+
    fad4 fad fad

    %10
    fad2 fad4
    sol re mi
    fad2 r4

    %13
    re2 r4\mbreak
    mi2 re4
    mi re2

    %16
    re re4
    re re dod
    re2 re4

    %19
    sol mi re
    re2.

}

Vbcn = \relative do {

    sol'4 sol fad
    mi2 si4
    do re re,

    %4
    sol2 sol4
    sol' fad mi
    re si sol

    %7
    re' sol,2
    re2.
    re''2 re4

    %10
    re2 re,4
    sol fad mi
    re2 r4

    %13
    si2 r4\mbreak
    do2 si4
    do re re,

    %16
    sol2 sol4
    sol' fad mi
    re2 sol4

    %19
    si, do re
    sol,2.

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>4
    s2.
    s4 <4> <3>
    s2.
    s4 <6> <6+>
    s2.*5
    s4 <6> <6+>
    s2.
    s
    <6 5>
    <6>
    s
    s4 <6> <6+>

}

forma = {

    \key sol\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2. = 67
    s2.*8
    \bar ":..:"
    s2.*12
    \bar":|."

}

Vds = {
    \Vglobal
    <<\Vdsn \forma>>

}

Vhc = {
    \Vglobal
    <<\Vhcn \forma>>

}

Vtl = {
    \Vglobal
    <<\Vtln \forma>>

}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}



VIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIdsn =  \relative do'' {

    re8
    sib sol re'
    re sol, re'
    sol sib16 la sol fad

    %4
    sol8 re re
    mib fa16 mib re do
    re8 sib'4

    %7
    la8 sib16 la sol fad
    sol4 fa?8
    re sib fa'

    %10
    fa sib, fa'
    sol lab16 sol fa mib\mbreak
    fa8 sib, fa'

    %13
    sol lab16 sol fa mib
    fa8 sib fa
    re-+ mib16 re do re

    %16
    sib4 mib8
    re sib do-+
    re4 mib8

    %19
    re sib do-+
    re4 la8
    sib do16 sib la sol

    %22
    la8 fad sol
    la la8._+ sol16
    sol4 re' sol\mbreak

    %25
    sib8 la16 sib sol8
    sib la sol
    fad re sib'

    %28
    la sib16 la sol fad
    sol8 sib4
    la8 re, fad

    %31
    sol4

}

VIhcn = \relative do'' {

    sol8
    sol4 sol8
    sol4 sib8
    sib mib re

    %4
    re4 re8
    do4 do8
    sib re4

    %7
    mib8 re re
    re4 sib8
    sib4 sib8

    %10
    sib4 sib8
    sib sib do\mbreak
    re sib sib

    %13
    sib sib la
    sib4 do8
    sib sib la

    %16
    sib4 la8
    sib sol4
    fad8 sib la

    %19
    sib sol4
    fad fad8
    sol re sol

    %22
    fad re sol
    sol fad8. sol16
    sol4 sib re\mbreak

    %25
    re4 re8
    re sib do
    re4 re8

    %28
    mib re la
    sib4 re8
    do do la

    %31
    sib4

}

VItln =  \relative do' {

    re8
    re4 re8
    re4 sol8
    sib la la

    %4
    sol4 sol8
    sol sol la
    fa sol4

    %7
    la8 la4
    sol re8
    fa4 re8

    %10
    re4 re8
    mib sib do\mbreak
    re4 re8

    %13
    sib sib do
    re4 do8
    re sol fa

    %16
    fa4 do8
    sib mib4
    la,8 re do

    %19
    sib mib4
    la, re8
    re re do

    %22
    re4 re8
    mib? do la
    sib4 sol' sib\mbreak

    %25
    sol4 sol8
    sol re sol
    la4 sol8

    %28
    sol fad la
    sol sol4
    la8 la4

    %31
    sol

}

VIbcn = \relative do {

    sol'8
    sol4 sol,8
    sol4 sol'8
    sib, do re

    %4
    sol,4 sol'8
    do sib la
    sib sol sib,

    %7
    do re re,
    sol4 sib'8
    sib4 sib,8

    %10
    sib4 sib'8
    mib re do\mbreak
    sib4 re,8
    mib re do

    %14
    sib4 la8
    sib mib, fa
    sib4 do8

    %17
    re mib4
    re8 sib do
    re mib4

    %20
    re re8
    sol fa mib
    re4 sib8

    %23
    do re re,
    sol4 sib' sol\mbreak
    sol,4 sol'8

    %26
    sol fa mib
    re4 sib8
    do re re,

    %29
    sol4 sol'8
    do, re re,
    sol4

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4.*2
    <6>8 <_-> <_+>
    s4.
    <_->
    s4 <6>8
    <6> <_+>4
    s4.*3
    s8 <6> <6 _->
    s4.
    s8 <6> <6 _->
    s4.*2
    s4 <_->8
    <_+> <6+>4
    <_+>8 <6> <_->
    <_+> <7> <6>
    <_+>4.
    s8 <6>4
    <_+> <6>8
    <6 _-> s <_+>
    \bassFigureExtendersOn <_>4 <_> <_>\bassFigureExtendersOff
    s4.
    s8 <6>4
    <_+> <6>8
    <6 _-> <4> <3+>
    s4.
    <6 _->8 <4> <3+>

}

forma = {

    \key fa\major
    \time 3/8
    \tempo 4. = 77
    \partial 8 s8
    s4.*7
    s4 \bar ":..:" s8
    s4.*23
    s4
    \bar":|."

}

VIds = {
    \VIglobal
    <<\VIdsn \forma>>

}

VIhc = {
    \VIglobal
    <<\VIhcn \forma>>

}

VItl = {
    \VIglobal
    <<\VItln \forma>>

}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}



VIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIdsn =  \relative do'' {

    re2 sol4. sol8
    la2 la4.-+(sol16 la)
    sib4. la8 sol4 fa8 mib

    %4
    re4. mib16 re do4.-+ sib8
    la2_+ re4. re8
    re4 sol, mib'4. mib8

    %7
    do4.-+ do8 fa4. fa8
    fa2~fa8 re mib fa\mbreak
    sib,4. do8 do4.-+ sib8

    %10
    sib2 si4. si8
    do4 re8 mib re4 sol
    mi?4. mi8 la2~

    %13
    la8 sib la mi fad4-+ re
    sol4. la8 la4.-+ sol8
    sol1

}

VIIhcn = \relative do'' {

    sib2 do8 sib do re
    mib2 re4. re8
    re2 re4 do

    %4
    sib4. do16 sib la4._+ sol8
    fad2~fad8 fad la fad
    sol2. sib4

    %7
    la2. do4
    sib2 fa4. fa8\mbreak
    sol4 sib la4._+ sib8

    %10
    sib4 fa sol2
    sol4. la8 si do re si
    do2. do8 do

    %13
    re2~re8 la sib? do
    re4 mib re la
    sib1

}

VIItln =  \relative do' {

    sol'2 sol4. sol8
    sol2 fad4. fad8
    sol4. la8 sib4 la8-+ sol

    %4
    fa4 re mib2
    re2. re4
    re2 sol4. sol8

    %7
    fa2. fa4
    fa2 re4. re8\mbreak
    mib4 sol fa4. fa8

    %10
    fa4 re re4. re8
    mib4 si8 do re4. re8
    do4 mi? mi4. mi8

    %13
    fad4. sol8 la la sol fad
    sol4 sol fad4. sol8
    sol1

}

VIIbcn = \relative do {

    sol'4. fa8 mib re do si
    do4. do8 re4 re,
    sol4. fad8 sol4 la

    %4
    sib2 do
    re~re8 re fad re
    sol2. sol4

    %7
    la2. fa4
    sib2 lab4. lab8\mbreak
    sol4 mib fa fa,

    %10
    sib4. la8 sol4 sol'8 fa
    mib4 re8 do si4 sol
    do2 do'4. do8

    %13
    do2~do8 do sib la
    sib4 do re re,
    sol,1

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key fa\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 42
    s1*15
    \bar"|."

}

VIIds = {
    \VIIglobal
    <<\VIIdsn \forma>>

}

VIIhc = {
    \VIIglobal
    <<\VIIhcn \forma>>

}

VIItl = {
    \VIIglobal
    <<\VIItln \forma>>

}

VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}



VIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIIdsn =  \relative do'' {

    re2 re4. do8
    si4 re sol, sol'
    fad-+ re sol sol8 fad

    %4
    mi4. re8 do4.-+ si8
    la4 re la si8 do
    si4-+ mi si mi

    %7
    dod2~\mbreak dod8 la si dod
    re4 mi8 fad mi4 fad8 sol
    fad4.-+ sol8 sol4.-+(fad16 sol)

    %10
    la4. la8 fad4 la
    re,4. re8 la4 si
    do2 si4.-+ si8

    %13
    mi4. fad8 fad4.-+ mi8
    red4 fad si la8 si
    sol4.-+ fad8 fad4.-+ mi8\mbreak

    %16
    mi4. mi8 la4 la8 sol
    fad4.-+ mi8 re4 do8-+ si
    do4 la si4.-+ do8

    %19
    re4. do16 si la4 do
    fad,4._+ sol8 la4 si8 do
    si4.-+ la8 la4._+ sol8

    %22
    sol4. fad8 sol la si do
    re4. do16 si la4 do
    fad,4._+ sol8 la4 si8 do

    %25
    si4.-+ la8 la4._+ sol8
    sol1

}

VIIIhcn = \relative do'' {

    si2 si4. la8
    sol2. sol4
    la4. la8 si4 re

    %4
    do sol la4. mi8
    fad2. fad4
    sol2. sol4

    %7
    la2~\mbreak la4 la
    la2 la4. la8
    la4 re re4. re8

    %10
    re1
    fad,4. fad8 fad4 sold
    la2 sol?4. sol8

    %13
    sol2 do4. do8
    si2. si4
    si mi red4. mi8\mbreak

    %16
    mi2 mi8 re dod4
    re la si la8 sold
    la4 fad sol? re

    %19
    sol re mi4. mi8
    re2~re8 fad sol la
    sol4 sol fad4._+ sol8

    %22
    sol2. sol4
    sol2 mi4. mi8
    re2~re8 fad sol la

    %25
    sol4 sol fad4._+ sol8
    sol1

}

VIIItln =  \relative do' {

    sol'2 re
    re mi4. mi8
    fad4 la re, sol

    %4
    sol mi fad4. sol8
    re2. re4
    re si mi4. mi8

    %7
    mi2~\mbreak mi4 mi
    fad sol8 la sol4 fad8 mi
    fad4 la sol2

    %10
    fad1-+
    la4. la8 la4 re,
    mi4. fad8 sol4 fad

    %13
    mi sol la4. la8
    fad2 -+ sol4 fad
    mi2 si'4 si8 la\mbreak

    %16
    sold fad mi4 mi la
    la8 sol? fad4 fad mi
    mi re4 re8 do si la

    %19
    sol2 do4. do8
    la4 re re4. re8
    re4 mi re4. re8

    %22
    si2._+ mi4
    re si do mi
    fad re re4. re8

    %25
    re4 mi re4. re8
    si1_+

}

VIIIbcn = \relative do {

    sol'2 sol,
    sol'4. fad8 mi2
    re4 re8 do si2

    %4
    do4. si8 la4. sol8
    fad2. re4
    sol2. mi4

    %7
    la la'\mbreak mi la
    fad mi8 re do4 la
    re2 sol,

    %10
    re1
    re''4. re8 do4 si
    la8 si do la mi'4 re

    %13
    do2~do8 si do la
    si4 la8 si sol4 red
    mi la, si2\mbreak

    %16
    mi4 mi8 re dod4 la
    re re8 do? si4 mi
    la, re sol,4. la8

    %19
    si2 do4. do8
    re4. mi8 fad4 re
    sol do, re2

    %22
    mi4. re8 mi fad sol la
    si4 sol do la
    re4. sol,8 fad4 re

    %25
    sol do, re re,
    sol1

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s4. <7>8 <6+>2
    s <6>
    s4. <6>8 <6>2
    s1
    s
    \bassFigureExtendersOn <_+>2 <_+>4 <_+>\bassFigureExtendersOff
    <6>2 s4 <_+>
    s1
    s
    s2 <6 4>4 <_+>
    s2 s4 <6>
    <7>2 <6 4>
    <_+> <6>
    s4 <7> <_+>2
    <_+> s4 <_+>
    s2 s4 <7 _+>
    s <7> s2
    s <6>
    \bassFigureExtendersOn <_>2 <_>4 <_>\bassFigureExtendersOff
    s1
    s
    s2 <6>
    s <6 5/>

}

forma = {

    \key sol\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 45
    s1*26
    \bar"|."

}

VIIIds = {
    \VIIIglobal
    <<\VIIIdsn \forma>>

}

VIIIhc = {
    \VIIIglobal
    <<\VIIIhcn \forma>>

}

VIIItl = {
    \VIIIglobal
    <<\VIIItln \forma>>

}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>

}



IXglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IXdsn =  \relative do'' {

    re8 do4 sib2-+ la4
    sol fad4._+(mi16 fad) sol2 la4
    sib4. do8 re4 do4. re8 mib4
    re2 sol4 sol4. la8 fad4-+

    %4
    sol4. sib8 la4 sib sol la
    sib4. la8 sol4 fa?4. sol8 mib4
    re4.-+ mib8 fa4 do mib2

    %7
    la,4_+ fa sib sib4. do8 la4_+\mbreak
    sib4. re8 do4 sib2-+ la4
    sol'4. sib8 la4 sib sol la

    %10
    sib4. sib8 la4 sol fa-+ mi
    la4. sol8 fa4 mi re dod
    re la fa' mi4.-+ re8 dod4

    %13
    re4. re8 do?4 sib2-+ la4
    sol fad4._+(mi16 fad) sol2 la4
    sib4. do8 re4 do4. re8 mib4

    %16
    re2 sol4 sol4. la8 fad4-+
    sol4. sib8 la4 sib sol la
    sib4. la8 sol4 fa?4. sol8 mib4

    %19
    re4.-+ mib8 fa4 do mib2
    la,4_+ fa sib sib4. do8 la4_+\mbreak
    sib4. re8 do4 sib2-+ la4


    %22
    sol fad4._+(mi16 fad) sol2 la4
    sib4. do8 re4 do4. re8 mib4
    re2 sol4 sol4. la8 fad4-+

    %25
    sol1

}

IXhcn = \relative do'' {

    r8 r4 r2 r4
    r4 r8 re, re4 sol2 fad4
    sol4. la8 sib4 la4. sib8 do4
    sib re mib re2 la4

    %4
    sib2 r4 r r re
    re4. do8 sib4 do2 do4
    sib4. do8 re4 sol, sol2

    %7
    fa fa4 fa2 fa4\mbreak
    fa2 r4 r2 r4
    sib2 r4 r r re

    %10
    re4. do8 sib4 do2 do4
    do2 re4 la la sol
    la fa re la'2 la4

    %13
    la2 r4 r2 r4
    r4 r8 re, re4 sol2 fad4
    sol4. la8 sib4 la4. sib8 do4

    %16
    sib re mib re2 la4
    sib2 r4 r r re
    re4. do8 sib4 do2 do4

    %19
    sib4. do8 re4 sol, sol2
    fa fa4 fa2 fa4\mbreak
    fa2 r4 r2 r4

    %22
    r4 r8 re re4 sol2 fad4
    sol4. la8 sib4 la4. sib8 do4
    sib re mib re2 la4

    %25
    sib1

}

IXtln =  \relative do' {

    r8 r4 r2 r4
    r4 r8 re re4 re2 do4
    sib2 sib4 fa'2 fa4
    fa sib2 la4 la4.-+ sol8

    %4
    sol2 r4 r r fad
    sol4. la8 sib4 la4.-+ sol8 fa4
    fa2 fa4 mib mib2

    %7
    do4 re2 do-+ fa4\mbreak
    re2 r4 r2 r4
    sol2 r4 r r fad

    %10
    sol4. sol8 fa?4 sol fa sol
    fa4. sol8 la4 sol fa mi
    re2 re4 dod4. re8 mi4

    %13
    re2 r4 r2 r4
    r4 r8 re re4 re2 do4
    sib2 sib4 fa'2 fa4

    %16
    fa sib2 la4 la4.-+ sol8
    sol2 r4 r r fad
    sol4. la8 sib4 la4.-+ sol8 fa4

    %19
    fa2 fa4 mib mib2
    do4 re2 do-+ fa4\mbreak
    re2 r4 r2 r4

    %22
    r4 r8 re re4 re2 do4
    sib2 sib4 fa'2 fa4
    fa sib2 la4 la4.-+ sol8

    %25
    sol1

}

IXbcn = \relative do {

    r8 r4 r2 r4
    r4 r8 re' re4 sib2-+ la4
    sol sol, sol' la la, la'
    sib sib, do re re,2

    %4
    sol r4 r r re'
    sol2. la
    sib2 re,4 mib do2

    %7
    fa4 re sib fa2 fa4\mbreak
    sib2 r4 r2 r4
    sol2 r4 r r re'

    %10
    sol2.do2 do,4
    fa4. mi8 re4 dod re mi
    fa fa, sol la2 la4

    %13
    re,2 r4 r2 r4
    r4 r8 re'' re4 sib2-+ la4
    sol sol, sol' la la, la'

    %16
    sib sib, do re re,2
    sol r4 r r re'
    sol2. la

    %19
    sib2 re,4 mib do2
    fa4 re sib fa2 fa4\mbreak
    sib2 r4 r2 r4


    %22
    r4 r8 re' re4-+ sib2 la4
    sol sol, sol' la la, la'
    sib sib, do re re,2

    %25
    sol1

}

IXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8 s1
    s4 s8 <_+> s4 <6>2 <6+>4
    s2. <6>
    s2 <_->4 <4> <3+>2
    s1 s4 <_+>
    s1.
    s2 <6>4 s <_->2
    s4 <6> s <4>2 <3>4
    s1.
    s1 s4 <_+>
    s2. <5 4>4 <6> s
    s1 s4 <6+>
    <6> s <7> <_+>2.
    s1.

    s4 s8 <_+> s4 <6>2 <6+>4
    s2. <6>
    s2 <_->4 <4> <3+>2
    s1 s4 <_+>
    s1.
    s2 <6>4 s <_->2
    s4 <6> s <4>2 <3>4
    s1.

    s4 s8 <_+> s4 <6>2 <6+>4
    s2. <6>
    s2 <_->4 <4> <3+>2

}

forma = {

    \key fa\major
    \time 6/4
    \tempo 1. = 45
    \partial 8*9  s8*9
    \repeat volta 2 {s1.*7}
    \alternative {
        {
            s1.\break
        }{s}
    }
    s1.*4
    \bar "||"\break
    \mark\markup\italic "le rondeau"
    s1.*11
    s1^\fermata
    \bar"|."

}

IXds = {
    \IXglobal
    <<\IXdsn \forma>>

}

IXhc = {
    \IXglobal
    <<\IXhcn \forma>>

}

IXtl = {
    \IXglobal
    <<\IXtln \forma>>

}

IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn \forma \IXbfn>>

}



Xglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}

Xdsn =  \relative do'' {

    re16
    sol8.[sol16 la8. la16]
    sib4 la8. sib16
    sol8.[sib16 la8. sol16]

    %4
    fad8. [mi16 re8. re16]
    mib8. [re16 do8. fa16]
    re8.-+[do16 sib8. re16]

    %7
    do8.-+[sib16 la8. re16]
    sib8._+[la16 sol8. sib16]\mbreak
    \tuplet 3/2 {
        la8 (sib la) sol(la sol)

        %10
        fad_+(mi re)
    } re'8. re16
    mi8.[mi16 fad8. fad16]
    sol4 re8. re16

    %13
    do8._+[sib16 la8._+ sol16]
    sol4. r16 re'
    sol8.[sol16 la8.-+ la16]\mbreak

    %16
    sib4 fa8. fa16
    mib8. re16 do8.\prall sib16
    la8._+ [sol16 fa8. fa'16]

    %19
    sol8.(do,16) do8. mib16
    fa8.(sib,16) sib8. re16
    \tuplet 3/2 {
        mib8(fa mib) do(fa mib)

        %22
        re(do sib)
    } fa'8. fa16\mbreak
    sol8.[sol16 la8.-+ la16]
    sib4 fa8. fa16

    %25
    mib8.[re16 do8.-+ sib16]
    sib4. r16 re
    re8. la16 re8. do16

    %28
    si8.-+[la16 sol8. sol'16]
    sol8.[fa16 sol8. re16]
    mib8.[re16 do8. mib16]\mbreak

    %31
    \tuplet 3/2 {
        re8(mib re) do(re do)
        si-+(la sol)
    } sol'8. sol16
    fa8.-+[mib16 re8.-+ do16]

    %34
    do4. r16 mib
    mib8.(la,16) la8. do16
    re8.[(sol,16) sol8. sib16]

    %37
    \tuplet 3/2 {
        la8(sib la) sol(la sol)
        fad(mi re)
    } re'8. re16
    mi8.[mi16 fad8. fad16]

    %40
    sol4 re8. re16
    do8.-+[sib16 la8._+ sol16]
    sol4. r16

}

Xhcn = \relative do'' {

    re16
    re8.[re16 re8. re16]
    re4 fa8. fa16
    sib,4 do

    %4
    la_+ r
    do r
    fa, r

    %7
    la r
    re,4. re8\mbreak
    re4. do8

    %10
    re4 sib'8. sib16
    sib8.[sib16 la8._+ sib16]
    do4 sib8. sib16

    %13
    sol8.[sol16 fad8. sol16]
    sol4. r16 sib
    sib8.[sib16 la8. la16]\mbreak

    %16
    sol4 sib8. la16
    sol4 sol
    fa r

    %19
    do' r
    re r
    la r

    %22
    sib sib8. sib16\mbreak
    sib8.[mib16 do8. fa16]
    re4-+ re8. re16

    %25
    do8.^+[sib16 la8. -+ sib16]
    sib4 r
    la r

    %28
    sol r
    re' r
    do4. sol8\mbreak

    %31
    sol4 fa
    sol mib'8. mib16
    do8.[do16 si8. do16]

    %34
    do4 r
    la r
    sib r

    %37
    mib, r\mbreak
    re re'8. re16
    la8. _+[la16 la8. sib16]

    %40
    do4 sib8. sib16
    sol8.[sol16 fad8._+ sol16]
    sol4. r16

}

Xtln =  \relative do' {

    sib'16
    sib8.[sib16 la8. la16]
    sol4 la8. fa16
    sol8. fa16 mib4

    %4
    re r
    la' r
    sib r

    %7
    fad r
    sol4. sol,8\mbreak
    la4 do

    %10
    la_+ sol'8. sol16
    sol8.[sol16 re8. re16]
    sol4 sol8. sol16

    %13
    mib8.[mib16 re8. re16]
    re4. r16 sol
    sol8.[sol16 fad8. fad16]\mbreak

    %16
    sol4 sib,8. fa'16
    sol8.[fa16 mib8. re16]
    do4-+ r

    %19
    mib r
    sib' r
    do r

    %22
    fa, fa8. sib16\mbreak
    sol8.[sol16 fa8. fa16]
    sib4 sib8. la16

    %25
    sol8.[sol16 fa8. fa16]
    fa4 r
    re r

    %28
    re r
    sol r
    sol4. do,8\mbreak

    %31
    re4 fa
    re sol8. sol16
    lab8.[lab16 sol8. re16]

    %34
    mib4 r
    fa r
    fa r

    %37
    la, r\mbreak
    la sol'8. sol16
    sol8.[sol16 re8. re16]

    %40
    sol4 sol8. sol16
    mib8.[mib16 re8. re16]
    re4. r16

}

Xbcn = \relative do {

    sol'16
    sol8.[sol16 re8. re16]
    sol4 fa8. re16
    mib4 do

    %4
    re r
    do r
    sib r

    %7
    la r
    sol4. sol8\mbreak
    fa4 mib

    %10
    re sib''8. sib16
    do8.[do16 re8. re16]
    mib4 sib,8. sib16

    %13
    do8.[do16 re8. re16]
    sol,4. r16 sol'
    sol8.[sol16 re8. re16]\mbreak

    %16
    sol4 re8. re16
    mib8.[fa16 sol8. mib16]
    fa4 r

    %19
    mib r
    re r
    do r

    %22
    sib re8. re16\mbreak
    mib8.[mib16 fa8. fa16]
    sol4 re8. re16

    %25
    mib8.[mib16 fa8. fa16]
    sib,4 r
    fad' r

    %28
    sol r
    si r
    do4. do8\mbreak

    %31
    sib?4 lab
    sol mib8. mib16
    fa8.[fa16 sol8. sol16]

    %34
    do,4 r
    fa r
    sib, r

    %37
    do r\mbreak
    re sib'8. sib16
    do8.[do16 re8. re16]

    %40
    mib4 sib,8. sib16
    do8.[do16 re8. re16]
    sol,4. r16

}

Xbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s16
    s4 <_+>
    s2
    s4 <6 _->
    <_+>2
    <_->
    s
    <_+>
    s
    <6>4 <6>
    <_+>2
    s4 <_+>
    s <6>
    <_-> <_+>
    s2
    s4 <_+>
    s <6>
    s <6- 4>
    s2
    <6>
    <6>
    <6 _->
    s
    s
    s4 <6>
    s2*3
    <_+>2
    s
    <_->
    <6>4 <6>
    <_+> <6>
    <_-> <_+>
    <_->2
    <7->
    s
    <_- 6>
    <_+>4 <6>
    s <_+>
    s <6>
    <_-> <_+>

}

forma = {

    \key fa\major
    \time 4/8
    \tempo 2 = 65
    \partial 16 s16
    s2*13
    s4. s16
    \bar ":..:"\break
    s
    s2*27
    s4. s16
    \bar":|."

}

Xds = {
    \Xglobal
    <<\Xdsn \forma>>

}

Xhc = {
    \Xglobal
    <<\Xhcn \forma>>

}

Xtl = {
    \Xglobal
    <<\Xtln \forma>>

}

Xbc = {
    \Xglobal
    \clef bass
    <<\Xbcn \forma \Xbfn>>

}



XIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIdsn =  \relative do'' {

    re4 sol,8 re'4 sol8
    fad4.-+ sol8. la16 sib8
    re,8. do16 sib8 la4 re8

    %4
    sib4.-+ sol4 la8
    sib8. do16 re8 do8. re16 mib8
    re4.-+ sib4 re8

    %7
    fa8. mib16 re8 do8. re16 sib8
    la4_+ fa'8 re8.-+ do16  sib8
    fa'4 fa8 sol8. la16 sib8\mbreak

    %10
    la8.-+ sol16 fa8 sib8. la16 sol8
    fa8. mib16 re8 do4-+ sib8
    sib4 re8 sol4 la8

    %13
    sib4 la8 sol8.-+ fa16 mi?8
    la8. sol16 fa8 mi8. fa16 re8
    dod4.-+ la8. re16 mi8

    %16
    fa8. mi16 re8 dod4-+ re8
    re4.~re
    fa8. sol16 fa8 re4 sib8\mbreak

    %19
    fa'4. re4 re8
    sol8. fa16 sol8 re4 sol8
    mi4.-+ do8. fa16 do8

    %22
    re8. mi16 fa8 fa8. sol16 mi8-+
    fa4 do8 do4 re8
    mib4 sol,8 sol4 la8

    %25
    sib8. do16 sib8 la4_+ sol8
    re'4. r8 r sol,
    re'8. do16 sib8 la8. sib16 sol8

    %28
    fad4._+ re4 re'8\mbreak
    sib'8. la16 sol8 sol8. la16 fad8-+
    sol4 sib8 la8.-+ sol16 fad8

    %31
    sol8. la16 sib8 la8.-+ sol16 fad8
    sol8. la16 sib8 do,8. re16 mib8
    re8. do16 sib8 la4_+ sol8

    %34
    sol4.~sol

}

XIhcn = \relative do'' {

    sib4. sib4 do8
    re4. re8. do16 sib8
    sib8. la16 sol8 sol4 fad8

    %4
    sol4.~sol4 fad8
    sol8. la16 sib8 la8. sib16 do8
    sib4. fa?4 sib8

    %7
    sib8. la16 sib8 sol4 sol8
    fa4 fa8 fa4.
    la4 do8 re8. do16 sib8\mbreak

    %10
    do4. re
    re8. do16 sib8 la4_+ sib8
    sib4 sib8 sib4 do8

    %13
    re4 re8 dod4 re8
    mi4 re8 sib8. la16 sol8
    la4.~la4 do8

    %16
    sib4 sib8 la4 la8
    la4.~la
    sib sib4 sib8\mbreak

    %19
    sib4.~sib4 re8
    re4.~re4 si8
    do4.~do4 do8

    %22
    sib8. do16 re8 do4 do8
    la4_+ la8 la4 si8
    do4 do,8 sol'4 fad8

    %25
    sol4 sol8 re4 sol8
    fad4. r8 r mib
    fa?4. mib

    %28
    re~re8. mi?16 fad8\mbreak
    sol4 mib'8 re4 la8
    sib4 re8 re4 la8

    %31
    sib4 re8 re4 la8
    sib8. do16 sib8 la8. sib16 do8
    sib8. la16 sol8 fad4 sol8

    %34
    sol4.~sol

}

XItln =  \relative do' {

    sol'4. re4 sol,8
    re'4. sol8. fad16 sol8
    sol re mib re4 re8

    %4
    re4. sib4 re8
    re8. do16 sib8 fa'?4 fa8
    fa4. re4 fa8

    %7
    fa4. mib8. re16 mib8
    do4-+ do8 re4 fa8
    fa4 fa8 fa4 mi8\mbreak

    %10
    fa4. fa
    sol fa4 fa8
    fa4 sib8 sol4 fad8

    %13
    sol4 re8 sol4 la8
    la4. sol4 sol8
    mi4.-+ fa4 la8

    %16
    re,4 sol8 mi4 la8
    fad4.~fad
    fa!4. fa4 fa8\mbreak

    %19
    fa4.~fa4 sib8
    sol4.~sol4 sol8
    sol4. la8. sol16 la8

    %22
    fa4 sib8 sol4-+ fa8
    fa4 fa8 fa4 fa8
    sol4 mib8 re4 do8

    %25
    re4 sib8 sib4 do8
    re4. r8 r mib
    re4. do

    %28
    do4 la8 sib4 do8\mbreak
    re4 la'8 la4-+ sol8
    sol4 sol8 fad4 re8

    %31
    re4 sol8 fad4 re8
    re4 sol8 fa?4 fa8
    fa4 mib8 re4 re8

    %34
    re4.~re

}

XIbcn = \relative do {

    sol'4. fa4 mib8
    re4. sib8. la16 sol8
    sib4 do8 re4 re,8

    %4
    sol4. sol'4 re8
    sol4. la
    sib sib,4 sib'8

    %7
    re,4. mib
    fa4 la8 sib4.
    la sol\mbreak

    %10
    fa re
    mib fa4 fa,8
    sib4 sib'8 sib4 la8

    %13
    sol4 fa8 mi?4 re8
    dod4 re8 sol8. la16 sib8
    la4. fa

    %16
    sol la4 la,8
    re4.~re
    sib sib4 sib8\mbreak

    %19
    sib4.~sib4 sib'8
    si4.~si4 sol8
    do8. sib?16 do8 la4.

    %22
    sib do
    fa,4 fa8 mib4 re8
    do4 do'8 sib4 la8

    %25
    sol4 sol8 fa4 mib8
    re4. mib8. re16 mib8
    sib4. do

    %28
    re4 do8 sib4 la8\mbreak
    sol4 do8 re4 re,8
    sol4 sol'8 re'4 re,8

    %31
    sol,4 sol'8 re'4 re,8
    sol,4 sol'8 la4 la,8
    sib4 do8 re4 re,8

    %34
    sol4.~sol

}

XIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4. <6>4 <6>8
    <_+>4. <6>8. <6+>16 s8
    <6>4 <_->8 <4>4 <3+>8
    s2 s8 <_+>
    s4. <6>
    s2.
    <6>4. <6>
    s s
    <6> <6>
    s <6>
    s s
    s <6>4 <6+>8
    s4 <6>8 <6+>4.
    s s
    <_+> <6>
    <7> <_+>
    <_+> s
    s2.*2
    s2 s8 <_!>
    s2.*2
    s4. <6 4>4 <6+>8
    <_->4. <6>4 <6+>8
    s4. <6>4 <6>8
    <_+>2.
    s4. <_->
    <_+> <6>
    s <4>4 <3+>8
    s4. <_+>
    s4. <_+>
    s <6>
    s4 <_->8 <_+>

}

forma = {

    \key fa\major
    \time 6/8
    \tempo 2. = 52
    s2.*17
    \bar":..:"\break
    s2.*17
    \bar":|."

}

XIds = {
    \XIglobal
    <<\XIdsn \forma>>

}

XIhc = {
    \XIglobal
    <<\XIhcn \forma>>

}

XItl = {
    \XIglobal
    <<\XItln \forma>>

}

XIbc = {
    \XIglobal
    \clef bass
    <<\XIbcn \forma \XIbfn>>

}



XIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

XIIdsn =  \relative do'' {

    R2.
    fa,8(fa) la(la) do(do)
    \once\stemDown fa16 do, re mi fa sol fa sol la sib la sib

    %4
    do fa, sol la sib do sib do re mi re mi
    fa la, sib do re mi re mi fa sol fa sol\mbreak
    la do, re mi fa sol fa sol la sib la sib

    %7
    do sib la sol la sol fa mi re do sib la
    sib do sib la sol la sib sol do re do sib
    la2_+~la8. \tuplet 3/2 { sol32 fa mi }

    %10
    re2 \tuplet 8/4 { r32 sib do re mib fa sol la } \tuplet 7/4 { sib32 [do re mib fa sol la ]}\mbreak
    sib8. sib32 sib sib4 r16 la sol fa
    sol la sib la sol lab sol fa mib fa mib re

    %13
    do2 r16 fa, sol la
    sib sol la sib do la sib do re sib do re
    mib do re mib fa do fa do fa do fa fa

    %16
    fa2 r16 sib la sib\mbreak
    sol2 r16 sol fa sol
    la2 r16 la sol la

    %19
    fad4.-+ \tuplet 3/2 { re16 mi fad } sol8. \tuplet 7/2 { fad32 mib re do sib la sol }
    mib'16 fa mib re do re do sib la sib la sol
    fad8. \tuplet 7/2 { re32 mi fad sol la sib do } re16 la re la re la re re\mbreak

    %22
    re2 r32 sol, la sib do re mi fad
    sol4 r16 sol fa? mi fa8. sol16
    mi8-+ la16 mi fa8 sib16 fa sol8 do16 sol

    %25
    la do la fa do la' fa do la fa' do la
    fa4 r r16 re mi fa\mbreak
    sol mi sol mi fa8 sib16 fa sol8 do16 sol

    %28
    la fa sol la sib sol la sib do la sib do
    re mi fa sol mi fa sol la fa sol la sib
    sol la sib do la fa la fa do'8. \tuplet 6/2 { sib32 la sol fa mi re }

    %31
    mi8.-+ \tuplet 6/2 { do32 re mi fa sol la } sib4. \tuplet 3/2 { sib16 la sol }
    la8. \tuplet 3/2 { sib32 la sol } sol4.-+ fa8
    fa4

}

XIIhcn = \relative do'' {

    fa,8(fa) la(la) do(do)
    do,(do) fa(fa) la(la)
    do(do) la(la) fa(fa)

    %4
    fa(fa) fa(fa) sib(sib)
    la16 fa sol la sib do sib do re8.\tuplet 3/2 { re32do sib }\mbreak
    do8(do) do(do) do(do)

    %7
    do(do) do(do) la(la)
    sol(sol) sol(sol) sol(sol)
    fa(fa) do(do) do(do)

    %10
    sib2 r32 re mi fa sol la sib do
    re8(re) re(re) re(re)
    sib(sib) mib16 fa mib re do re do sib

    %13
    la8 fa fa(fa) fa(fa)
    mib(mib) mib(mib) re(re)
    do(do) fa(fa) fa(fa)

    %16
    fa2 r16 re' re re\mbreak
    mib2 r16 mib mib mib
    mib2 r16 mib mib mib

    %19
    re8(re) re(re) re(re)
    sol,(sol) mib(mib mib mib)
    re(re) fad(fad) fad(fad)\mbreak

    %22
    sol(sol) sol(sol) sol(sol)
    re'(re) re(re) re(re)
    do(do) sib(sib) sib(sib)

    %25
    la(la) la(la) fa[la,]
    re4 r r\mbreak
    mi8(mi) re(fa) mi(sol)

    %28
    fa(fa) sib,(sib) fa'(fa)
    fa sib sol do la fa
    do'(do) do(do) do(do)\mbreak

    %31
    do(do) do(do) do(do)
    do(do) do(do) do(do)
    do4

}

XIItln =  \relative do' {

    do8(do) fa(fa) la(la)
    la,(la) re(re) fa(fa)
    la(la) fa(fa) do(do)

    %4
    la16 la sib do re mi re mi fa sol fa sol
    la8(la) fa(fa) fa(fa)\mbreak
    fa16 sol fa sol la8[(la) fa(fa)]

    %7
    fa(fa) fa(fa) fa(fa)
    do(do) do(do) do(do)
    do4~do16 sib la sol fa8(fa)

    %10
    fa2 r32 fa sol la sib do re mib\mbreak
    fa8(fa) fa(fa) fa(fa)
    mib(mib) sol(sol) sol(sol)

    %13
    fa(fa) do[(do) do(do)]
    sib(sib) fa'[(fa) fa(fa)]
    fa[(fa)] do[(do) do(do)]

    %16
    re2 r16 sib' sib sib\mbreak
    sib2 r16 sib sib sib
    do2 r16 do sib do

    %19
    la8(la) la(la) re,(re)
    do16 re do re mib fa mib re do re do sib
    la8(la) la(la) la(la)\mbreak

    %22
    sib(sib) sib(sib) sib(sib)
    sol(sol) sol'(sol) sol(sol)
    sol do, fa re sol mi

    %25
    do(do) la(la) fa(fa)
    fa4 r r\mbreak
    do'8(do) sib(sib) sib(sib)

    %28
    la(la) mib'(mib) mib(mib)
    re(re) mi?(mi) fa(fa)
    sol(sol) la(la) la(la)\mbreak

    %31
    sol8. \tuplet 3/2 { la32 sol fa } mi8. \tuplet 3/2 { fa32 mi re } do8. \tuplet 3/2 { do32 re mi}
    fa8(fa) mi(mi) mi(mi)
    fa4

}

XIIfgn = \relative do {

    fa8(fa fa fa fa fa)
    fa mi16 re do re do sib la sib la sol
    fa8(fa fa fa fa fa)

    %4
    fa'(fa) fa(fa) fa(fa)
    fa(fa) fa(fa) fa(fa)\mbreak
    fa(fa) fa(fa) fa(fa)

    %7
    fa(fa fa fa fa fa)
    mi(mi mi mi mi mi)
    fa16 do re mib fa sol fa mib re mib re do

    %10
    sib8.-+ \tuplet 6/2 { do32 re mib fa sol la } sib8 sib16 sib sib8 sib\mbreak
    re,8(re) re(re) re(re)
    mib(mib mib mib mib mib)

    %13
    fa(fa fa fa fa fa)
    sol(sol) la(la) sib(sib)
    fa(fa) fa,(fa) fa(fa)

    %16
    sib8. \tuplet 7/2 {sib32 do re mib fa sol la} sib16 la sib do sib do re sib
    mib8. \tuplet 7/2 {mib,32 fa sol la sib do re} mib16 re mib fa mib fa mib re
    do8. \tuplet 7/2 {do,32 re mib fa sol la sib} do16 sib do re do re mib do

    %19
    re8 re, re(re) sib[(sib)]
    do(do) do(do) do(do)
    re(re re re re re)\mbreak

    %22
    sol(sol sol sol sol sol)
    si,(si si si si si)
    do(do) re(re) mi(mi)

    %25
    fa fa, fa(fa) fa(fa)
    re4 r r\mbreak
    do8 [do'] re(re) mi(mi)

    %28
    fa(fa) sol(sol) la(la)
    sib16 sol la sib do la sib do re8 re,
    mi(mi) fa(fa) fa,(fa)\mbreak

    %31
    do'(do) do(do) do(do)
    do(do) do(do) do(do)
    fa,4

}

XIIbcn = \relative do {

    fa,8(fa fa fa fa fa)
    fa(fa fa fa fa fa)
    fa'(fa fa fa fa fa)

    %4
    fa,(fa fa fa fa fa)
    fa(fa fa fa fa fa)\mbreak
    fa(fa fa fa fa fa)

    %7
    fa(fa fa fa fa fa)
    mi(mi mi mi mi mi)
    fa(fa fa fa fa fa)

    %10
    sib(sib sib sib sib sib)
    sib(sib) sib(sib) sib(sib)
    mib,(mib mib mib mib mib)

    %13
    fa(fa fa fa fa fa)
    sol(sol) la(la) sib(sib)
    fa(fa fa fa fa fa)

    %16
    sib(sib) sib(sib) sib(sib)\mbreak
    mib,(mib) mib(mib) mib(mib)
    do(do) do(do) do(do)

    %19
    re re' re(re) sib[(sib)]
    do(do) do(do) do(do)
    re re, re(re) re(re)\mbreak

    %22
    sol(sol)  sol(sol)  sol(sol)
    sol(sol)  sol(sol)  sol(sol)
    do(do) re(re) mi(mi)

    %25
    fa fa, fa(fa) fa(fa)
    re4 r r\mbreak
    do8(do) re(re) mi(mi)

    %28
    fa(fa) sol(sol) la(la)
    sib(sib) do(do) re(re)
    mi(mi) fa(mi) fa,(fa)

    %31
    do'(do) do(do) do(do)
    do,(do) do(do) do(do)
    fa4

}

XIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*3
    s4 <6 4>2
    s4 <6 4>2
    s2.
    s
    <6 5>
    s2.*3
    s2 <6>4
    s2.*2
    <4>2 <3>4
    s2.*2
    <6 _->2.
    <_+>
    <_->2 <6>4
    <_+>2.
    s
    <_+>
    s2.*7
    s4 <7>2
    <6 4>2 <3>4

}

forma = {

    \key fa\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2 = 60
    s2.*32
    s4
    \bar "|."

}

XIIds = {
    \XIIglobal
    <<\XIIdsn \forma>>

}

XIIhc = {
    \XIIglobal
    <<\XIIhcn \forma>>

}

XIItl = {
    \XIIglobal
    <<\XIItln \forma>>

}

XIIfg = {
    \XIIglobal
    \clef bass
    <<\XIIfgn \forma>>

}

XIIbc = {
    \XIIglobal
    \clef bass
    <<\XIIbcn \forma \XIIbfn>>

}



XIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIIIdsn =  \relative do'' {

    la16 sib la sol fa [sol fa mi] re  mi re mi fa [sol fa sol]
    la sib la sib do [la sib do] re mib re do sib [do sib la]
    sol la sib sol do[ re do sib] la sib do la re [mib re do]\mbreak
    si sol la si do [si la sol] la sol fa mi re [sol fa sol]
    mi [fa sol mi ] la sib? la sol fad re mi fad sol [la sol la]
    sib [do sib do ] re sib do re mib re do sib la [re re la]\mbreak
    sib [la sol la] sib do re mi fa la, re, mi fa [sol la sib]
    do [fa fa mib] re do sib la re do sib la sib [la sol fa]
    mi [do re mi] fa sol la sib do sol la sib mi,8._+ [fa16]
    fa2 r

}

XIIIhcn = \relative do'' {

    fa,4. do8 re4. fa8
    fa4. fa8 fa4.sol8
    mi fa sol mi fa4. la8\mbreak
    sol4. mi8 do re si8. si16
    do4. do8 re4 sol8 fad
    sol4. sol8 sol la fad8. fad16\mbreak
    sol4. sol8 fa?4. sol8
    la4. la8 re,4. re8
    do4. do8 do re do8. do16
    do2 r

}

XIIItln =  \relative do' {

    do4. do8 sib4. re8
    do4. fa8 re4. re8
    do4. do8 do4 fa\mbreak
    re do la sol8. sol16
    sol4. do8 la4 sib8 do
    re4. sol8 mib mib re8. re16\mbreak
    re4. dod8 re4. re8
    do?4. do8 sib4. re8
    mi4. do8 do fa, do' sol
    la2 r

}

XIIIbcn = \relative do {

    fa,8 sol la fa sib do re sib
    fa' sol la fa sib, do re sib
    do re mi do fa mi fa re\mbreak
    sol fa mi do fa re sol sol,
    do sib do la re do sib la
    sol la sib sol do la re[re,]\mbreak
    sol sol' fa mi re re do sib
    la fa la fa sib do re sib
    do16 do' sib la sol[fa mi re] do8 sib do do,
    fa2 r

}

XIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s1
    s2 s4 <6 4>
    s1
    <_+>4 <6> s <_+>
    s <6> <_+> <6>8 <6->
    \bassFigureExtendersOn <_>4 <_>8 <_> <_->4 <_+>\bassFigureExtendersOff
    s4 <6>8 <6+> s4 <6>8 <6>
    <6>2 s4 <6 4>

}

forma = {

    \key fa\major
    \time 2/2
    \tempo 2 = 60
    s1*10
    \bar"|."

}

XIIIds = {
    \XIIIglobal
    <<\XIIIdsn \forma>>

}

XIIIhc = {
    \XIIIglobal
    <<\XIIIhcn \forma>>

}

XIIItl = {
    \XIIIglobal
    <<\XIIItln \forma>>

}

XIIIbc = {
    \XIIIglobal
    \clef bass
    <<\XIIIbcn \forma \XIIIbfn>>

}



XIVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

XIVdsn =  \relative do'' {

    fa4. fa8 do4. do8
    la2_+ r8 do do8. do16
    fa4. mi8 re do sib la

    %4
    re4. re8 sib4 re
    sol,4. \tuplet 3/2 { sol16 la sib } do4. do8
    do8. la16 fa8. fa'16 fa2

    %7
    r8 re re8.[re16] sol4. re8
    mib8. re16 do8. lab'16 lab2~\mbreak
    lab4 r16 lab sol fa sol2~

    %10
    sol8. sol16 fa8.-+ mib16 re8. mib16 do8. re16
    si8.-+ la16 sol8. sol16 re'2~
    re8. re16 re8. mib16 si4.-+ do8

    %13
    do1 do4. sol'8 mi4-+ do8. do16
    fa4. sol8 sol4.-+(fa16 sol)\mbreak
    la4 fa8. la16 la2~

    %16
    la8. la16 sol8.-+ fa16 mi8. fa16 re8. mi16
    dod8. \tuplet 3/2 { la32 si dod } re8. \tuplet 3/2 { mi32 re dod } si8.[re16] sol4~
    sol8. sol16 fa8.-+ mi16 fa2~

    %19
    fa8. mi16 mi8. fa16 mi4.-+ re8
    re4. r16 re fad4.-+ mib?16 re\mbreak
    sol4. \tuplet 3/2 { la16 sol la } la4.-+(sol16 la)

    %22
    sib8. la16 sol8. sol16 do4. \tuplet 3/2 { sib16 la sol }
    la4. sib16 la sol8. \tuplet 3/2 { sib32 la sol } fa8. \tuplet 3/2 { la32 sol fa }
    mi8.-+ re16 do8.[sol16] sib2~

    %25
    sib8. sib16 la8._+ sib16 sol4. _+ fa8
    fa8. fa16 la8. la16 do4. do8
    mib4. mib8 mib4. re16 do\mbreak  %%% reprise

    %28
    re4. \tuplet 7/4 { sib32 do re mib fa sol la } sib4. re,8
    mi?8.-+ re16 do8. sol'16 sol2~
    sol8. sol16 la8. sib16 sol4.-+ fa8

    %31
    fa8. fa,16 la8. la16 do4. do8 fa2

}

XIVhcn = \relative do'' {

    fa,1
    fa2 sol4. sol8
    la2 r8 la la8. la16

    %4
    fa4. fa8 fa4 sol
    mi2_+ r8 mi sol8. mi16
    fa2 r8 la la8. re16

    %7
    si2 r8 si re8. si16
    do2~do8. mib16 mib8. fa16\mbreak
    re2-+~re8. re16 re8. mib16

    %10
    do2 lab4. lab8
    sol2~sol8. sol16 sol8. sol16
    sol4 lab sol4. sol8

    %13
    sol4. sol8 la4 mi sol2. r8 do
    do4. do8 do4. do8\mbreak

    %15
    do2~do8. do16 do8. la16
    sib2~sib4. sib8
    la4 la8. la16 sol8. si16 mi8. mi16

    %18
    dod8. si16 la8. dod16 re2~
    re4 re dod4. re8
    re4. r16 re mib4. mib8\mbreak

    %21
    re4. re8 do4 re
    re4. re8 mi4. mi8
    do4. do8 do4 si

    %24
    do4. mi,8 fa4. fa8
    sol8. mi16 fa8. sol16 mi4._+ fa8
    fa2 r8 la la8. la16

    %27
    do2~do8. do16 la8. do16\mbreak
    fa,2 sol4. sol8
    sol4 do sib4. sib8

    %30
    sib4 la8. fa16 do'4. do8
    la2_+ r8 la la8. la16 la2

}

XIVtln =  \relative do' {

    do1
    do2 mi4. sol8
    do,2 r8 fa fa8. fa16

    %4
    re2 re4. re8
    do2 r8 do do8. do16
    do2 r8 re re8. re16

    %7
    re2 r8 sol sol8. sol16
    sol2 mib4 lab8. lab16\mbreak
    fa2 sib4 sib8. sib16

    %10
    lab4~lab8. sol16 fa8. sol16 mib8. fa16
    re4.-+ re8 si4. si8
    do4. re8 re4.-+ do8

    %13
    do1 do2. r8 sol'
    la4. la8 sol4 mi\mbreak
    fa2~fa8. fa16 fa8. fa16

    %16
    fa4 re sol4. sol8
    mi4-+ re8. re16 re4 mi8. mi16
    mi4. la8 la8. sol16 fa8. la16

    %19
    sib4. sib8 la4 mi
    fa4. r16 fa la4. la8\mbreak
    la4 sol sol fad

    %22
    sol2 sol4. sol8
    fa4 do do re
    mi4. mi8 re4. re8

    %25
    do4 do8. re16 do4. do8
    la2 r8 fa' fa8. fa16
    fa2 fa4. fa8\mbreak

    %28
    re2 re4. sol8
    mi4 sol sol4. sol8
    sol8. mi16 fa4 mi4.-+ fa8

    %31
    fa2 r8 fa fa8. fa16 fa2

}

XIVbcn = \relative do {

    fa,1
    fa'4. fa8 do4. do8
    la2 r8 fa fa8. fa16
    sib4. sib8 re4 sib

    %5
    do2 r8 do mi8. do16
    fa2 r8 re re8. re16
    sol2 r8 sol si8. sol16

    %8
    do2~do8. do16 do8. lab16\mbreak
    sib2~sib8. sib16 sib8. sol16
    lab2~lab8. sol16 lab8. fa16

    %11
    sol4. sol8 fa4. \tuplet 3/2 { fa16 mib re }
    mib4 fa sol sol,
    do4. \tuplet 3/2 { do16 sib do } la4 do do2. r8 do'

    %14
    la4 fa mi do\mbreak
    fa2~fa8. fa16 fa8. fa16
    sib2~sib8. la16 sib8. sol16

    %17
    la8. \tuplet 3/2 { sib32 la sol } fad8. re16 sol8. \tuplet 3/2 { la32 sol fad } mi8. mi16
    la8. si16 dod8. la16 re,8. mi16 fa8. re16
    sol,2 la

    %20
    re4. \tuplet 3/2 { re16 mib re } do4. \tuplet 3/2 { do16 re do }\mbreak
    sib4. sib8 la4 re
    sol,4. \tuplet 3/2 { sol'16 fa sol } mi4 do

    %23
    fa fa, mi re
    do4. do'8 re4. re8
    mi8. do16 fa8. sib,16 do2

    %26
    fa, r8 fa' fa8. fa16
    la2 la,4. la8\mbreak
    sib4. \tuplet 3/2 { do16 sib la } sol4. \tuplet 3/2 { sol16 la sib }

    %29
    do4. do8 mib4. mib8
    mi!8. do16 fa8. sib,16 do4 do,
    fa2 r8 fa' fa8. fa16 fa,2

}

XIVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s2 <6>4 <6>
    s1
    s
    <_+>
    <_->2 <6->4 s8. <6>16
    <7->2 <6>4 s8. <_->16
    <7>1
    \bassFigureExtendersOn <_+>2 <_+>4 <_+>8 <_+>\bassFigureExtendersOff
    <6 5>4 <_-> <_+>2
    s2 <6> s1
    <6>
    s
    <7>2 <6 4>
    s <_+>
    <_+>1
    <7>2 <_+>
    s <4+ 6>
    <6> <7>4 <_+>
    s1
    s2 <6>4 <6+>
    s2 <6>
    <5/>1
    s1*4
    <6>1

}

forma = {

    \key fa\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 2 = 57
    \repeat volta 2 {s1*12}
    \alternative {{s1}{s}}\set Score.currentBarNumber = #14
    s1*13\override Score.RehearsalMark.extra-offset = #'(+5 . 0)
    \mark "Reprise"
    \repeat volta 2 {s1*4}
    \alternative {{s1}{s2}}
    \bar "|."

}

XIVds = {
    \XIVglobal
    <<\XIVdsn \forma>>

}

XIVhc = {
    \XIVglobal
    <<\XIVhcn \forma>>

}

XIVtl = {
    \XIVglobal
    <<\XIVtln \forma>>

}

XIVbc = {
    \XIVglobal
    \clef bass
    <<\XIVbcn \forma \XIVbfn>>

}



XVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XVdsn =  \relative do'' {

    fa,8 fa16 sol la sib
    do sib do re mi do
    re do re mi fa sol

    %4
    mi do re  mi fa do
    re mib re do sib la
    sol la sib sol do sib

    %7
    la sib la sib do re
    si do re mi fa re
    sol fa mi fa sol mi\mbreak

    %10
    la sib la sol fa mi
    re sol fa mi re do
    si sol la si do re

    %13
    mi fa re8.-+[do16]
    do4. do
    sol8 sol16 fa sol la

    %16
    sib la sol la sib do
    la sol la sib do la
    re dod re fa mi re\mbreak

    %19
    dod mi fa sol la mi
    fa mi fa sol la fa
    sib la sol fa mi re

    %22
    dod la si dod re mi
    fa sol mi fa sol la
    fad re mi fad sol la

    %25
    sib8 sib sib
    sib16 do sib la sol fad
    sol la la8. -+ sol16\mbreak

    %28
    sol la sib la sol fa
    mi fa mi re do sib
    la sib la sib do la

    %31
    re mib re do sib la
    sol4 la8. [sib16] sol8. _+ [fa16]
    fa8 la4

    %34
    do fa8
    la16 sol fa sol la sib
    do sib la sol fa mi\mbreak

    %37
    re mi fa re sol fa
    mi do re mi fa sol
    la sib sol8.-+ fa16

    %40
    fa4.
    sol,8 sol16 fa sol la  %%% 1er reprise
    sib la sol la sib do

    %43
    la sol la sib do la
    re dod re fa mi re\mbreak
    dod mi fa sol la mi

    %46
    fa mi fa sol la fa
    sib la sol fa mi re
    dod la si dod re mi

    %49
    fa sol mi fa sol la
    fad re mi fad sol la
    sib8 sib sib

    %52
    sib16 do sib la sol fad
    sol la la8. -+ sol16\mbreak
    sol la sib la sol fa

    %55
    mi fa mi re do sib
    la sib la sib do la
    re mib re do sib la

    %58
    sol4 la8. [sib16] sol8. _+ [fa16]
    fa'8 la,4
    do fa8  %%% 2 reprise

    %61
    la16 sol fa sol la sib
    do sib la sol fa mi\mbreak
    re mi fa re sol fa

    %64
    mi do re mi fa sol
    la sib sol8.-+ fa16
    fa4.

}

XVhcn = \relative do'' {

    fa,8 fa fa
    sol sol do
    do do si

    %4
    do do la
    sib? re, sol
    mi mi mi

    %7
    fa la la
    sol si si
    do do do\mbreak

    %10
    do la re
    si re sol,
    sol8. sol16 la si

    %13
    do8 si8. do16
    do4. do
    mi,8 mi16 re mi fad  %% Inizia 1. repr

    %16
    sol8 re16 do re  mi
    fa mi fa sol la8
    sib? sib sib\mbreak

    %19
    la la la
    la la re
    sib sib sib

    %22
    la8. la16 si dod
    re8 dod8. re16
    re8. mib16 re do?

    %25
    sib la sib do re sib
    mib8 mib mib
    mib? re re\mbreak

    %28
    re re re
    do do mi,
    fa fa fa

    %31
    fa sol sol
    mi4 fa mi
    fa8 fa4

    %34
    la4 la8 %%% inizia 2 repr.
    do do do
    do do la\mbreak

    %37
    sib re re
    do4 do8
    do do4

    %40
    la4.
    mi8 mi16 re mi fad  %% Inizia 1. repr
    sol8 re16 do re  mi

    %43
    fa mi fa sol la8
    sib? sib sib\mbreak
    la la la

    %46
    la la re
    sib sib sib
    la8. la16 si dod

    %49
    re8 dod8. re16
    re8. mib16 re do?
    sib la sib do re sib

    %52
    mib8 mib mib
    mib? re re\mbreak
    re re re

    %55
    do do mi,
    fa fa fa
    fa sol sol

    %58
    mi4 fa mi
    la8 fa4
    la4 la8 %%% inizia 2 repr.

    %61
    do do do
    do do la\mbreak
    sib re re

    %64
    do4 do8
    do do4
    la4.

}

XVtln =  \relative do' {

    la8 la16 sib do re
    mi re mi fa sol mi
    fa8 fa fa

    %4
    sol la la
    fa sib, re
    do do do

    %7
    do do fa
    re re re
    mi sol sol\mbreak

    %10
    la la la
    sol sol mi
    re8. re16 mi fa

    %13
    sol8 sol8. sol16
    mi4. -+ mi -+
    do8 do do  %%% 1re repr.

    %16
    re re re
    re fa mi
    re fa sol\mbreak

    %19
    mi mi mi
    re re fa
    sol sol sol

    %22
    mi la la
    la la la
    la re, re

    %25
    sol4 sol8
    sol sol sol
    sol fad8. sol16\mbreak

    %28
    sol8 sol sol
    sol16 la sol fa mi re
    do8 do fa

    %31
    re re re
    do4 do do
    do8 do4

    %34
    fa4 fa8  %%%2 repr
    fa la la
    la la la\mbreak

    %37
    fa sib sib
    sol8. do,16 re mi
    fa sol mi8.-+ fa16

    %40
    fa4.
    do8 do do  %%% 1re repr.
    re re re

    %43
    re fa mi
    re fa sol\mbreak
    mi mi mi

    %46
    re re fa
    sol sol sol
    mi la la

    %49
    la la la
    la re, re
    sol4 sol8

    %52
    sol sol sol
    sol fad8. sol16\mbreak
    sol8 sol sol

    %55
    sol16 la sol fa mi re
    do8 do fa
    re re re

    %58
    do4 do do
    fa8 do4
    fa4 fa8  %%%2 repr

    %61
    fa la la
    la la la\mbreak
    fa sib sib

    %64
    sol8. do,16 re mi
    fa sol mi8.-+ fa16
    fa4.

}

XVbcn = \relative do {

    fa8 fa fa
    mi mi mi
    re re re

    %4
    do la fa
    sib sib' sol
    do do, do

    %7
    fa, fa' re
    sol sol fa
    mi do' do\mbreak

    %10
    la fa re
    sol si, do
    sol'8. fa16 mi re

    %13
    do8 sol' sol,
    do, do'16 re mi do do,4.
    do''8 do do

    %16
    sol sol sol
    re' re do
    sib sib sol\mbreak

    %19
    la la dod,
    re re re
    sol sib sol

    %22
    la8. sol16 fa mi
    re8 la' la,
    re16 mib re do sib la

    %25
    sol fa sol la sib sol
    do8. sib16 do re
    mib do re8 re,\mbreak

    %28
    sol sol' sol
    do do, do
    fa fa, fa

    %31
    sib sol sol
    do4 fa, do
    fa8 fa'4

    %34
    la,4 la8  %%% 2 repr.
    fa fa' fa
    la fa fa\mbreak

    %37
    sib sib sol
    do8. sib16 la sol
    fa8 do4

    %40
    fa,4.
    do''8 do do %%% 1er repr.
    sol sol sol

    %43
    re' re do
    sib sib sol\mbreak
    la la dod,

    %46
    re re re
    sol sib sol
    la8. sol16 fa mi

    %49
    re8 la' la,
    re16 mib re do sib la
    sol fa sol la sib sol

    %52
    do8. sib16 do re
    mib do re8 re,\mbreak
    sol sol' sol

    %55
    do do, do
    fa fa, fa
    sib sol sol

    %58
    do4 fa, do
    fa8 fa'4
    la,4 la8  %%% 2 repr.

    %61
    fa fa' fa
    la fa fa\mbreak
    sib sib sol

    %64
    do8. sib16 la sol
    fa8 do4
    fa,4.

}

XVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    s
    <7>4 <_+>8
    s4.*4
    <_+>4.
    <6>
    <6>
    s8 <5/>4
    <_+> <6>16 <6+>
    s8 <_+>4
    s4.*2

    s4.  %% 1 rep
    s
    s4 <6>8
    s4 <6>8
    <_+>4.
    s
    s8 <6> <6>
    <_+>4 <6>16 <6+>
    s8 <_+> s
    <_+>4 <6>16 <6+>
    s4.
    <7 _+>4 s16 <_+>
    s8 <_+> s
    s4.*4
    s2.
    s4.
    s4.*4 %% 2 repr
    s4 <6>16 <6>
    s4.*2

    s4.  %% 1 rep
    s
    s4 <6>8
    s4 <6>8
    <_+>4.
    s
    s8 <6> <6>
    <_+>4 <6>16 <6+>
    s8 <_+> s
    <_+>4 <6>16 <6+>
    s4.
    <7 _+>4 s16 <_+>
    s8 <_+> s
    s4.*4
    s2.
    s4.
    s4.*4 %% 2 repr
    s4 <6>16 <6>
    s4.*2

}

forma = {

    \key fa\major
    \time 3/8
    \tempo 2. = 40
    \repeat volta 2 {s4.*13}
    \alternative {{s4.}{s}}\set Score.currentBarNumber = #15
    \bar ".|"\break
    s4.*17
    \set Score.measureLength = #(ly:make-moment 3 4) s2.\set Score.measureLength = #(ly:make-moment 3 8)
    s4.*8\break
    \bar "||"
    \mark \markup {P.\super re Reprise}
    s4.*17
    \set Score.measureLength = #(ly:make-moment 3 4) s2.\set Score.measureLength = #(ly:make-moment 3 8)
    s4.\break
    \bar "||"
    \mark\markup  {2.\super e Reprise}
    s4.*7
    \bar "|."

}

XVds = {
    \XVglobal
    <<\XVdsn \forma>>

}

XVhc = {
    \XVglobal
    <<\XVhcn \forma>>

}

XVtl = {
    \XVglobal
    <<\XVtln \forma>>

}

XVbc = {
    \XVglobal
    \clef bass
    <<\XVbcn \forma \XVbfn>>

}



XVIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \override BreathingSign.text = \markup {
        \musicglyph "scripts.caesura.straight"
    }
}

XVIobIn =  \relative do'' {

    la4
    la2 si-+
    do8 si do re do4 re
    mi re8 do si4 la
    sold2_+ mi4 mi'

    %5
    fa2 re-+
    mi8 fa mi re do4 mi
    re4.-+ do8 si do re mi

    %8
    do4.-+ si8 la si do re\mbreak
    mi4 re8 do si4.-+ la8
    la2.  mi'4 %%% fine rip.

    %11
    mi2 fa-+
    sol8 fa sol la sol4 fa8 mi
    fa4 mi re do

    %14
    si2-+ sol4 sol'
    fa2 mi2-+
    re8-+ do re mi re4 sol

    %17
    mi4.-+ re8 do4 sol'\mbreak
    mi4.-+ re8 do re mi fa
    sol4 fa8 mi re4.-+ do8

    %20
    do2. la4

    la2 si-+
    do8 si do re do4 re
    mi re8 do si4 la

    %24
    sold2_+ mi4 mi'
    fa2 re-+
    mi8 fa mi re do4 mi

    %27
    re4.-+ do8 si do re mi
    do4.-+ si8 la si do re\mbreak
    mi4 re8 do si4.-+ la8

    %30
    la2.  mi'4

    la2 sold-+
    la8 sold la si la4 mi

    %33
    la sol fad mi
    red2-+ si4 fad'\mbreak
    fad2 sol

    %36
    fad8 mi fad sol fad4 si
    sol4.-+ fad8 mi4 si'
    si4. la8 sol fad mi red

    %39
    mi4. fad8 fad4. mi8
    mi2. la,4

    la2 si-+
    do8 si do re do4 re

    %43
    mi re8 do si4 la
    sold2_+ mi4 mi'
    fa2 re-+

    %46
    mi8 fa mi re do4 mi
    re4.-+ do8 si do re mi
    do4.-+ si8 la si do re\mbreak

    %49
    mi4 re8 do si4.-+ la8
    la2.

}

XVIobIIn =  \relative do'' {

    la4
    la2 si-+
    do8 si do re do4 re
    mi re8 do si4 la
    sold2_+ mi4 do'

    %5
    do2 si-+
    do2. mi4
    re4.-+ do8 si do re mi

    %8
    do4.-+ si8 la si do re\mbreak
    mi4 re8 do si4.-+ la8
    la2.  mi'4 %%% fine rip.

    %11
    mi2 fa-+
    sol8 fa sol la sol4 fa8 mi
    fa4 mi re do

    %14
    si2-+ sol4 mi'4
    re2 do
    si8-+ la si do si4 sol'

    %17
    mi4.-+ re8 do4 sol'\mbreak
    mi4.-+ re8 do re mi fa
    sol4 fa8 mi re4.-+ do8

    %20
    do2. la4

    la2 si-+
    do8 si do re do4 re
    mi re8 do si4 la
    sold2_+ mi4 do'

    %25
    do2 si-+
    do2. mi4
    re4.-+ do8 si do re mi

    %28
    do4.-+ si8 la si do re\mbreak
    mi4 re8 do si4.-+ la8
    la2.  mi'4

    la2 sold-+
    la8 sold la si la4 mi

    %33
    la sol fad mi
    red2-+ si4 red\mbreak
    red2 mi

    %36
    red8 dod red mi red4 si'
    sol4.-+ fad8 mi4 si'
    si4. la8 sol fad mi red

    %39
    mi4. fad8 fad4. mi8
    mi2. la,4

    la2 si-+
    do8 si do re do4 re
    mi re8 do si4 la
    sold2_+ mi4 do'

    %45
    do2 si-+
    do2. mi4
    re4.-+ do8 si do re mi

    %48
    do4.-+ si8 la si do re\mbreak
    mi4 re8 do si4.-+ la8
    la2.

}

XVIdsn =  \relative do'' {

    la4
    la2 si-+
    do8 si do re do4 re
    mi re8 do si4 la
    sold2_+ mi4 r

    %5
    R1
    r2 r4 mi'4
    re4.-+ do8 si do re mi

    %8
    do4.-+ si8 la si do re\mbreak
    mi4 re8 do si4.-+ la8
    la2.  mi'4 %%% fine rip.

    %11
    mi2 fa-+
    sol8 fa sol la sol4 fa8 mi
    fa4 mi re do

    %14
    si2-+ sol4 r
    R1
    r2 r4 sol'4

    %17
    mi4.-+ re8 do4 sol'\mbreak
    mi4.-+ re8 do re mi fa
    sol4 fa8 mi re4.-+ do8

    %20
    do2. la4

    la2 si-+
    do8 si do re do4 re
    mi re8 do si4 la

    %24
    sold2_+ mi4 r4
    R1
    r2 r4 mi'4

    %27
    re4.-+ do8 si do re mi
    do4.-+ si8 la si do re\mbreak
    mi4 re8 do si4.-+ la8

    %30
    la2.  mi'4

    la2 sold-+
    la8 sold la si la4 mi

    %33
    la sol fad mi
    red2-+ si4 r\mbreak
    R1

    %36
    r2 r4 si'4
    sol4.-+ fad8 mi4 si'
    si4. la8 sol fad mi red

    %39
    mi4. fad8 fad4. mi8
    mi2. la,4

    la2 si-+
    do8 si do re do4 re

    %43
    mi re8 do si4 la
    sold2_+ mi4 r
    R1

    %46
    r2 r4 mi'4
    re4.-+ do8 si do re mi
    do4.-+ si8 la si do re\mbreak

    %49
    mi4 re8 do si4.-+ la8
    la2.

}

XVIhcn = \relative do'' {

    la4
    la2 sold
    la8 sold la si la4 sold
    sold?2 fa

    %4
    mi2. r4
    R1
    r2 r4 la4

    %7
    la2 sold
    la2. la8 sold\mbreak
    la4 la sold4._+ la8

    %10
    la2. do4  %%% fine  rond.
    do2 do
    do2. do4

    %13
    do si la la
    sol2. r4
    R1

    %16
    r2 r4 si4
    do2. si4\mbreak
    do2. do8 si

    %19
    do4 do si4.-+ do8
    do2. la4

    la2 sold

    %22
    la8 sold la si la4 sold
    sold?2 fa
    mi2. r4

    %25
    R1
    r2 r4 la4
    la2 sold

    %28
    la2. la8 sold\mbreak
    la4 la sold4._+ la8
    la2. do4

    %31
    mi2 mi
    mi2. mi4
    red mi si si

    %34
    si2. r4
    R1
    r2 r4 red4

    %37
    mi2. mi4
    si2 si4 si8 la
    sol4 do si4. si8

    %40
    sold2. la4

    la2 sold
    la8 sold la si la4 sold

    %43
    sold?2 fa
    mi2. r4
    R1

    %46
    r2 r4 la4
    la2 sold
    la2. la8 sold\mbreak

    %49
    la4 la sold4._+ la8
    la2.

}

XVItln =  \relative do' {

    mi4
    mi2 mi
    mi mi4 re
    do re8 mi re4 do

    %4
    si2. r4
    R1
    r2 r4 do4

    %7
    re2 mi
    mi4. re8 do re mi fa\mbreak
    mi4 fa mi si

    %10
    do2.  la'4  %% fine rond.

    la2 la
    sol2. sol4

    %13
    la sol fa mi
    re2.-+ r4
    R1

    %16
    r2 r4 sol
    sol2. sol4\mbreak
    sol2. sol8 fa

    %19
    mi4 la sol4. sol8
    mi2.-+ mi4
    mi2 mi

    %22
    mi mi4 re
    do re8 mi re4 do
    si2. r4

    %25
    R1
    r2 r4 do4
    re2 mi

    %28
    mi4. re8 do re mi fa\mbreak
    mi4 fa mi si
    do2.  la'4

    %31
    la2 si
    la2. mi4
    fad sol la sol

    %34
    fad2. r4\mbreak
    R1
    r2 r4 fad

    %27
    sol2. sol4
    fad2 sol4 sol8 fad
    mi4 mi red4. mi8

    %40
    mi2. mi4

    mi2 mi
    mi mi4 re

    %43
    do re8 mi re4 do
    si2. r4
    R1

    %46
    r2 r4 do4
    re2 mi
    mi4. re8 do re mi fa\mbreak

    %49
    mi4 fa mi si
    do2.

}

XVIbcn = \relative do {

    la'4
    la2 mi %% rondeau
    la la,4 si
    do2 re

    %4
    mi2. \breathe la4^\markup\italic "Bassons"
    fa2 sol
    do,2.\breathe do4\tu

    %7
    si2 mi
    la,2. la8 si\mbreak
    do4 re mi mi,

    %10
    la2. la'4  %%% fine rondeau
    la2 fa
    do'2. do4

    %13
    fa, sol la fa
    sol2.\breathe mi4^\markup\italic "Bassons"
    si2 do

    %16
    sol2.\breathe sol'4\tu
    do2. sol4\mbreak
    do2. do,8 re

    %19
    mi4 fa sol sol,
    do2. la'4

    la2 mi %% rondeau

    %22
    la la,4 si
    do2 re
    mi2. \breathe la4^\markup\italic "Bassons"

    %25
    fa2 sol
    do,2.\breathe do4\tu
    si2 mi

    %28
    la,2. la8 si\mbreak
    do4 re mi mi,
    la2. la'4

    %31
    la2 mi
    la2. sol4
    fad mi red mi

    %34
    si'2.\breathe si4^\markup\italic "Bassons"\mbreak
    si2 mi,
    si'2.\breathe si,4\tu

    %37
    mi2. mi4
    red si mi si
    do la si2

    %40
    mi,2. la'4

    la2 mi %% rondeau
    la la,4 si

    %43
    do2 re
    mi2. \breathe la4^\markup\italic "Bassons"
    fa2 sol

    %46
    do,2.\breathe do4\tu
    si2 mi
    la,2. la8 si\mbreak

    %49
    do4 re mi mi,
    la2.

}

XVIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2 <_+>
    s1
    s2 <6>
    <_+>1
    s1
    s2. <6>4
    <7>2 <_+>
    s1
    <6>2 <_+>
    s1  %%% fine rond.

    s1*2
    s4 <6> <6> s
    s2. <6>4
    <5/>1
    s
    s
    s2. s8 <6>
    <6>1
    s

    s2 <_+>
    s1
    s2 <6>
    <_+>1
    s1
    s2. <6>4
    <7>2 <_+>
    s1
    <6>2 <_+>
    s1

    s2 <_+>
    s2. <6>4
    <6+>2 <5/>
    <_+>1
    s
    <_+>
    s
    s4 <_+> s <_+>
    s2 <_+>
    <_+>1

    s2 <_+>
    s1
    s2 <6>
    <_+>1
    s1
    s2. <6>4
    <7>2 <_+>
    s1
    <6>2 <_+>
    s1

}

forma = {

    \key do\major
    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 60
    \partial 4 s4
    s1*20
    \bar "||"\break
    \mark\markup "Le rondeau"
    s1*9
    s2.
    \bar "||"%\break
    s4
    s1*10
    \bar "||"%\break
    \once \override Score.RehearsalMark.extra-offset = #'(+7 . +1)
    \mark\markup "Le rondeau"
    s1*10
    \bar"|."

}

XVIobI= {
    \XVIglobal
    <<\XVIobIn \forma>>

}

XVIobII = {
    \XVIglobal
    <<\XVIobIIn \forma>>

}

XVIds = {
    \XVIglobal
    <<\XVIdsn \forma>>

}

XVIhc = {
    \XVIglobal
    <<\XVIhcn \forma>>

}

XVItl = {
    \XVIglobal
    <<\XVItln \forma>>

}

XVIbc = {
    \XVIglobal
    \clef bass
    <<\XVIbcn \forma \XVIbfn>>

}



XVIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XVIIdsn =  \relative do'' {

    la2 mi'
    re2.-+ do4
    si do la si

    %4
    sold2_+ la4 si
    do si8 do re4 mi
    do2-+ si-+

    %7
    la mi'
    re2.-+ do4
    si do la si

    %10
    sold2_+ la4 si
    do si8 do re4 mi
    si1-+

    %13
    do2 sol'
    mi2.-+ sol4
    fa mi re-+ do

    %16
    re si do re\mbreak
    mi sol sol fa
    mi2-+ re-+

    %19
    do sol'
    mi2.-+ sol4
    fa mi re-+ do

    %22
    re si do sol'
    mi2-+ re-+
    do1

    %25
    mi2 si
    sold2._+ si4
    si4.-+ la8 si4 do

    %28
    si2 mi,4 si'
    si2. do4
    si mi re mi

    %31
    do2-+ si-+
    la1

}

XVIIhcn = \relative do'' {

    la2 la
    sold2. la4
    mi sol fa fa

    %4
    mi2 la4 sold
    la2 si
    la sold

    %7
    la la
    sold2. la4
    mi sol fa fa

    %10
    mi2 fad4 sold
    la la si do
    sold1_+

    %13
    do2 re
    do2. do4
    si do sol sol

    %16
    sol sol la si\mbreak
    do2 re
    do si-+

    %19
    do re
    do2. do4
    si do sol sol

    %22
    sol sol do re
    do2 si
    do1

    %25
    sol2 fa
    mi2. sold4
    sold?4. fad8 sold4 la

    %28
    sold2. sold4
    sold2. la4
    sold4. la8 si4 sold

    %31
    la2 sold_+
    la1

}

XVIItln =  \relative do' {

    mi2 mi
    si'2. mi,4
    mi mi do re

    %4
    si2_+ do4 re
    mi2 mi
    mi mi

    %7
    mi mi
    si'2. mi,4
    mi mi do re

    %10
    si2_+ do4 re
    mi2 re4 do
    mi1

    %13
    sol2 sol
    sol2. mi4
    fa sol fa mi

    %16
    re re mi fa\mbreak
    sol2 sol
    sol sol

    %19
    sol sol
    sol2. do,4
    re mi fa mi

    %22
    re re mi re
    mi2 sol
    mi1-+

    %25
    mi2 re
    si2._+ mi4
    mi2. mi4

    %28
    mi2. mi4
    mi2. mi4
    mi2 mi4 mi

    %31
    mi re re si
    do1

}

XVIIbcn = \relative do {

    la'2 do
    si2. la4
    sold mi fa re

    %4
    mi re do si
    la2 sold
    la mi'8 fad sold mi

    %7
    la2 do
    si2.-+ la4
    sold mi fa re

    %10
    mi4. fa8 mi4 re
    do re8 do si4 la
    mi'1

    %13
    do'2 si
    do2. mi,4
    re do si do

    %16
    sol' fa mi re\mbreak
    do2 si
    do sol'8 la si sol

    %19
    do2 si
    do2. mi,4
    re do si do

    %22
    sol' fa mi si
    do2 sol
    do1

    %25
    do2 re
    mi2. mi4
    mi2. la,4

    %28
    mi'2. mi4
    mi2. la,4
    mi'4. fad8 sold4 mi

    %31
    la re, mi mi,
    la1

}

XVIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    <6+>1
    s4 <6> s <6>
    <_+> s <6> <6+>
    s1
    s2 <_+>
    s <6>
    <6+>1
    s4 <6> s2
    <_+>1
    <6>2 <6+>
    s1
    s
    s2. <6>4
    <6>1
    s2 <6>4 <6>
    s1*4
    <6>1
    s2 <6>
    s1
    s
    s2 <6>
    <_+>1
    s
    <_+>
    s
    s2 s4 <_+>
    s2 <_+>

}

forma = {

    \key la\minor
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 57
    s1*12
    \bar ":..:"%\break
    s1*20
    \bar":|."

}

XVIIds = {
    \XVIIglobal
    <<\XVIIdsn \forma>>

}

XVIIhc = {
    \XVIIglobal
    <<\XVIIhcn \forma>>

}

XVIItl = {
    \XVIIglobal
    <<\XVIItln \forma>>

}

XVIIbc = {
    \XVIIglobal
    \clef bass
    <<\XVIIbcn \forma \XVIIbfn>>

}



XVIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XVIIIdsn =  \relative do'' {

    mi2 mi
    mi re4 dod
    si dod si la

    %4
    sold2_+ mi4 mi'
    fad mi fad sold
    la sold8 fad mi4 re8 dod

    %7
    si4-+la si sold
    la1
    dod2 dod4 dod

    %10
    dod2-+ si\mbreak
    dod8 si dod re dod4 dod
    dod2-+ si4 mi

    %13
    mi fad sold la
    si2 si4 la8 sold
    fad4-+ mi fad red-+

    %16
    mi si dod re?
    mi2 mi
    mi re4 dod

    %19
    si dod si la
    sold2_+ mi4 mi'\mbreak
    fad mi fad sold

    %22
    la sold8 fad mi4 re8 dod
    si4-+ la si sold
    la1

}

XVIIIhcn = \relative do'' {

    dod2 dod
    dod sold4 la
    mi mi mi red

    %4
    mi2. la4
    la sol fad re'
    dod si dod si8 la

    %7
    sold2_+ mi
    mi1
    la2 la4 la

    %10
    la2 sold_+\mbreak
    la8 sold la si la4 la
    la2 sold4_+ si

    %13
    si2 si4 la
    sold2 si4 dod
    red mi dod si

    %16
    si sold la si
    dod2 dod
    dod  sold4 la

    %19
    mi mi mi red
    mi2. la4\mbreak
    la sol fad re'

    %22
    dod si dod si8 la
    sold2_+ mi
    mi1

}

XVIIItln =  \relative do' {

    la'2 la
    la mi4 fad
    sold mi mi fad

    %4
    si,2. mi4
    re mi re si
    mi re dod mi

    %7
    mi2 si
    dod1
    mi2 mi4 mi

    %10
    mi2 mi\mbreak
    mi2 mi4 mi
    mi2 mi4 sold

    %13
    sold fad mi red
    mi2 mi4 la
    la sold fad fad

    %16
    sold mi fad sold
    la2 la
    la mi4 fad

    %19
    sold mi mi fad
    si,2. mi4\mbreak
    re mi re si

    %22
    mi re dod mi
    mi2 si
    dod1

}

XVIIIbcn = \relative do {

    la2 la'
    dod si4 la
    sold la sold fad

    %4
    mi2. dod4
    re dod  re mi
    fad sold la la,

    %7
    mi'2 mi,
    la1
    la'2 la4 la

    %10
    la2 mi\mbreak
    la la4 la
    la2 mi4 mi

    %13
    mi si mi fad
    sold mi sold la
    si dod la si

    %16
    mi,(re) dod si
    la2 la'
    dod si4 la

    %19
    sold la sold fad
    mi2. dod4\mbreak
    re dod re mi

    %22
    fad sold la la,
    mi'2 mi,
    la1

}

XVIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6>2 <6>
    s <6>4 <6+>
    s1
    s4 <6 5/> s2
    s1*7
    s4 <_+> s <6+>
    <6>1
    <_+>2 <6>4 <_+>
    s2 <6>4 <6>
    s1
    s2 s4 <6>
    s2 <6>4 <6+>
    s1
    s4 <5/> s2
    s4 <5/>

}

forma = {

    \key la\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 67
    s1*8
    \bar ":..:"
    s1*16
    \bar":|."

}

XVIIIds = {
    \XVIIIglobal
    <<\XVIIIdsn \forma>>

}

XVIIIhc = {
    \XVIIIglobal
    <<\XVIIIhcn \forma>>

}

XVIIItl = {
    \XVIIIglobal
    <<\XVIIItln \forma>>

}

XVIIIbc = {
    \XVIIIglobal
    \clef bass
    <<\XVIIIbcn \forma \XVIIIbfn>>

}



XIXglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIXobIn =  \relative do'' {

    la'4 si8 la sold4 la
    si mi, mi mi
    fa mi fa re

    %4
    mi8 re mi fa mi4 mi
    la si8 la sold4 la
    si mi, mi mi

    %7
    fa mi fa re-+
    mi1
    mi4 fa8 mi re4-+ do

    %10
    re re\mbreak re mi
    do-+ si do re
    si8-+la si do si4 si

    %13
    mi fa8 mi re4-+ do
    re re re mi
    do2 si-+

    %16
    la1

}

XIXobIIn = \relative do'' {

    do4 re8 do si4-+ la
    mi' si si do
    la do do si

    %4
    do8 si do re do4 do
    do re8 do si4-+ la
    mi' si si do

    %7
    la do do si-+
    do1
    do4 si8 la sold4 la

    %10
    si si\mbreak si do
    la_+ sold la si
    sold8_+ fad sold la sold4 sold

    %13
    do si8 la sold4 la
    si si si sold
    la2 sold_+

    %16
    la1

}

XIXfgn = \relative do {

    la'2 si4 do
    sold2. la4
    fa2 sol?

    %4
    do, do8 re do si
    la2 si4 do
    sold2. la4

    %7
    fa2 sol?
    do,1
    do''2 si4 la

    %10
    sold2.\mbreak mi4
    fa2. re4
    mi2 mi8 fa mi re

    %13
    do2 si4 la
    sold2._+ mi4
    fa re mi2

    %16
    la1

}

forma = {

    \key la\minor
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 67
    s1*8
    \bar ":..:"
    s1*8
    \bar":|."

}

XIXobI = {
    \XIXglobal
    <<\XIXobIn \forma>>

}

XIXobII = {
    \XIXglobal
    <<\XIXobIIn \forma>>

}

XIXfg = {
    \XIXglobal
    \clef bass
    <<\XIXfgn \forma >>

}



XXglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXfln =  \relative do'' {

    la8 si
    do4 do8 si la_+ sold
    la4 la do8 re
    mi16 re mi fa mi8 mi re do

    %4
    si4-+ si la8 si
    do4 do8 si la_+ sold
    la4 la do8 re

    %7
    mi re16 do si8 la si sold
    la4 la mi'8 fa\mbreak  %% fine rond.
    sol4 sol8 la sol fa

    %10
    mi4-+ re mi8 fa
    sol16 fa sol la sol8 sol fa mi
    re4-+ re8 do si do

    %13
    re4 re8 do si do
    re4 re mi8 fa
    sol fa16 mi re8 do si16 do re si

    %16
    do4 do la8 si

    do4 do8 si la_+ sold
    la4 la do8 re

    %19
    mi16 re mi fa mi8 mi re do
    si4-+ si la8 si
    do4 do8 si la_+ sold

    %22
    la4 la do8 re
    mi re16 do si8 la si sold
    la4 la la'8 sold\mbreak

    %25
    la4 mi8 mi mi re
    do4-+ la la'8 sold
    la16 sold la si la8 la la sold

    %28
    fad4-+ fad8 mi red mi
    fad4 fad8 mi red mi
    fad4 fad sol8 la

    %31
    si la16 sol fad8-+ mi fad red-+
    mi4 mi la,8 si

    do4 do8 si la_+ sold

    %34
    la4 la do8 re
    mi16 re mi fa mi8 mi re do
    si4-+ si la8 si

    %37
    do4 do8 si la_+ sold
    la4 la do8 re
    mi re16 do si8 la si sold

    %40
    la4 la r

}

XXhcn = \relative do'' {

    do,8 re
    mi4 mi8 re do_+ si
    do4 do la'8 si
    do16 si do re do8 do si la
    sold4_+ mi do8 re
    mi4 mi8 re do_+ si
    do4 do la'8 si
    do si16 la sold8 la mi re
    do4_+ la do'8 re  %% fine rond.

    mi4 mi8 fa mi re
    do4 si-+ do8 re
    mi16 re mi fa mi8 mi re do
    si4-+ si8 la sol mi
    re4 re8 mi  re do
    si4_+ sol do'8 re
    mi re16 do si8 do sol fa
    mi4_+ do do8 re

    mi4 mi8 re do_+ si
    do4 do la'8 si
    do16 si do re do8 do si la
    sold4_+ mi do8 re
    mi4 mi8 re do_+ si
    do4 do la'8 si
    do si16 la sold8 la mi re
    do4_+ la la'8 si\mbreak

    do4 do8 do do si
    la4 la do8 re
    mi4 mi8 mi fad mi
    red4-+ red8 dod si sol
    la4 la8 sol fad mi
    red4_+ red mi8 fad
    sol fad16 mi la8 do si la
    sol4_+ mi do8 re

    mi4 mi8 re do_+ si
    do4 do la'8 si
    do16 si do re do8 do si la
    sold4_+ mi do8 re
    mi4 mi8 re do_+ si
    do4 do la'8 si
    do si16 la sold8 la mi re
    do4_+ la r

}

XXfgn =  \relative do {

    r4
    la' la mi
    la, la r
    la' la re,

    %4
    mi mi r
    la la mi
    la, la r

    %7
    la' mi mi,
    la r r %%% fine rond.

    do' do sol

    %10
    do, sol r
    do' do fa,
    sol sol r

    %13
    sol sol, r
    sol' sol, r
    do sol' sol,

    %16
    do r r

    la' la mi
    la, la r

    %19
    la' la re,
    mi mi r
    la la mi

    %22
    la, la r
    la' mi mi,
    la r r

    %25
    la' la mi
    la, la r
    la' do la

    %28
    si si r
    si si, r
    si' si, r

    %31
    mi si' si,
    mi mi r

    la la mi

    %34
    la, la r
    la' la re,
    mi mi r

    %37
    la la mi
    la, la r
    la' mi mi,

    %40
    la r r

}

XXbcn = \relative do {

    r4
    la r mi
    la r r
    la r re

    %4
    mi r r
    la, r mi
    la r r

    %7
    la mi' mi,
    la r r %%% fine rond.

    do r sol

    %10
    do r r
    do r fa,
    sol r r

    %13
    sol r r
    sol r r
    do sol' sol,

    %16
    do r r

    la r mi
    la r r

    %19
    la r re
    mi r r
    la, r mi

    %22
    la r r
    la mi' mi,
    la r r

    %25
    la r mi
    la r r
    la r la

    %28
    si r r
    si r r
    si r r

    %31
    mi si' si,
    mi, r r

    la r mi

    %34
    la r r
    la r re
    mi r r

    %37
    la, r mi
    la r r
    la mi' mi,

    %40
    la r r

}

XXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 70
    \partial 4 s4
    s2.*16
    \bar "||"%\break
    \override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup "Rondeau"
    s2.*7
    s2
    \bar "||"%\break
    s4
    s2.*8
    \bar "||"%\break

    \mark\markup "Rondeau"
    s2.*8
    \bar"|."

}

XXfl = {
    \XXglobal
    <<\XXfln \forma>>

}

XXhc = {
    \XXglobal
    <<\XXhcn \forma>>

}

XXfg = {
    \XXglobal
    \clef bass
    <<\XXfgn \forma >>

}

XXbc = {
    \XXglobal
    \clef bass
    <<\XXbcn \forma \XXbfn>>

}



XXIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXIdsn =  \relative do'' {

    R2
    r16 mi, fad sold la si dod re
    mi4 r16 mi la mi

    %4
    fad4 r16 fad si fad
    sold si sold si sold si sold si
    mi, la sold fad mi fad mi re

    %7
    dod la' sold fad mi re dod si
    la dod la dod la dod la dod
    fad,4 r\mbreak

    %10
    r16 re mi fad sold la si dod
    re mi re dod si dod si la
    sold la si sold dod re dod si

    %13
    la si dod la re mi re dod
    si dod re si mi fad mi re
    dod la si dod re mi fad sold

    %16
    \once\stemDown la mi, fad sold\mbreak la si dod re
    mi sold, la si dod re mi fad
    sol4 r16 sol fad  mi

    %19
    fad la fad la fad la fad la
    re, fad re fad re fad re fad
    si, mi re dod si la sold fad

    %22
    mi4 r

}

XXIhcn = \relative do'' {

    R2
    mi,8[(mi mi mi)]
    la[(la) la (la)]

    %4
    la[(la) si (si)]
    si[(si si si)]
    si[(si si si)]

    %7
    la[(la la la)]
    mi[(mi mi mi)]
    re[(re re re)]\mbreak

    %10
    re4 r
    r fad8[(fad)]
    mi(mi) sold(sold)

    %13
    fad(fad) la(la)
    sold(sold) si(si)
    la[(la la la)]

    %16
    mi[(mi mi mi)]
    la[(la la la)]
    la[(la la la)]

    %19
    la[(la la la)]
    fad(fad) si(si)
    sold(sold) mi(mi)\mbreak

    %22
    mi4 r

}

XXItln =  \relative do' {

    R2
    dod8[(dod dod dod)]
    dod[(dod) mi(mi)]
    re[(re) fad(fad)]
    mi[(mi mi  mi)]
    mi[(mi mi  mi)]
    mi16 la, si dod re mi fad sold
    la8[la,(la la)]
    la[(la la la)]\mbreak
    la4 r
    r re8(re)
    si(si) mi(mi)
    dod(dod) fad(fad)
    mi[(mi mi mi)]
    mi[(mi mi mi)]
    dod[(dod dod dod)]
    dod[(dod dod dod)]
    mi[(mi mi mi)]
    re[(re re re)]
    re(re) fad(fad)
    mi[mi mi mi]
    si4 r

}

XXIfgn = \relative do {

    la8[la la la]
    la[la la la]
    dod[dod dod dod]

    %4
    re[re re re]
    mi[mi mi mi]
    mi[mi mi mi]

    %7
    la[la la la]
    la,[la la la]
    re[re re re]\mbreak

    %10
    re,4 r
    r8 re'16 re re8(re)
    mi mi16 mi mi8 mi

    %13
    fad fad16 fad fad8 fad
    sold sold16 sold sold8 sold
    la16 la sold fad mi re dod si

    %16
    la8[(la la la)]
    la[(la la la)]
    la[(la la la)]

    %19
    re re'16 re re8 re
    re re,16 re re8 re
    mi16 mi fad sold la si dod re\mbreak

    %22
    mi4 r

}

XXIbcn = \relative do {

    la4(la)
    la(la)
    la(la)

    %4
    re(re)
    mi(mi)
    mi,(mi)

    %7
    la(la)
    la(la)
    re,(re)\mbreak

    %10
    re4 r
    r re'8(re)
    mi[(mi mi mi)]

    %13
    fad[(fad fad fad)]
    sold[(sold sold sold)]
    la [la,(la la)]

    %16
    la[(la la la)]
    la[(la la la)]
    la[(la la la)]

    %19
    re,[(re re re)]
    re[(re re re)]
    mi[(mi mi mi)]

    %22
    mi4 r

}

XXIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key la\major
    \time 2/4
    \tempo 2 = 70
    s2*22
    \bar"|."

}

XXIds = {
    \XXIglobal
    <<\XXIdsn \forma>>

}

XXIhc = {
    \XXIglobal
    <<\XXIhcn \forma>>

}

XXItl = {
    \XXIglobal
    <<\XXItln \forma>>

}

XXIfg = {
    \XXIglobal
    \clef bass
    <<\XXIfgn \forma >>

}

XXIbc = {
    \XXIglobal
    \clef bass
    <<\XXIbcn \forma \XXIbfn>>

}



XXIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXIImusn =  \relative do'' {

    mi4\dolce mi8(fa) mi(fa)
    sol4 mi la
    sol8(la) sol(fa) mi(re)

    %4
    mi(fa) mi(re) do-+(si)
    do(si) do(re) do(sol)
    mi'(re) do(re) mi(fa)

    %7
    sol4 mi\f la
    sol8(la) sol(fa) mi(re)
    mi(fa) mi(re) do-+(si)

    %10
    do2.
    re4\dolce re8(mi) re(mi)\mbreak
    re4 sol, re'8(mi)

    %13
    fa(mi) fa(mi) re-+(do)
    re(sol) fa(mi) re(do)
    si-+(la) sol(la) si(do)

    %16
    re(mi) fa4\f mi
    re4.-+ re8 mi fa
    sol\dolce(la) sol(fa) mi-+(re)

    %19
    mi(fa) mi(re do si)
    do8. fa16\f mi4 re-+
    do8(fa\dolce) mi(re) do-+(si)

    %22
    do2.

}

XXIIfgn = \relative do {

    do'4\dolce do8(si) do(re)
    do4 do, fa
    do'8(si) do(re) do(sol)

    %4
    do(re) mi(fa) mi(re)
    do4 sol8(fa) mi(re)
    do(re) mi(fa) mi(re)

    %7
    do4 do'\f fa,
    do'8(si) do(re) do(si)
    do fa, sol4 sol,

    %10
    do2.
    sol'4 \dolce sol8(do) si(do)\mbreak
    sol(la) si(do) si(la)

    %13
    sol(do) si(do) si(la)
    sol4(sol) (sol)
    sol fa8(mi) re(do)

    %16
    si-+la sol4\f do
    sol sol'8\dolce(la) sol(fa)
    mi(fa) mi(re) do-+(si)

    %19
    do(sol') do(si) do(re)
    do8. si16\f do4 sol
    do,8\dolce(re) mi(fa) sol(sol,)

    %22
    do2.

}

XXIIbcn = \relative do {

    \repeat unfold 8 {do2.~}
    do4 sol2
    do2.
    \repeat unfold 6 {sol2.~}
    sol2.
    r4 r sol
    do2.~
    do4 do' sol
    do, do sol
    do,2.

}

XXIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2 = 60
    s2.*10
    \bar ":..:"
    s2.*12
    \bar":|."

}

XXIImus = {
    \XXIIglobal
    <<\XXIImusn \forma>>

}

XXIIfg = {
    \XXIIglobal
    \clef bass
    <<\XXIIfgn \forma>>

}

XXIIbc = {
    \XXIIglobal
    \clef bass
    <<\XXIIbcn \forma \XXIIbfn>>

}



XXIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXIIIdsn =  \relative do'' {

    mi4. re8 mi4 mi
    mi do mi fa
    sol fa mi re

    %4
    do si8-+ la sol4 sol
    la sol la si
    do re mi do

    %7
    fa2 mi\mbreak
    re1-+
    re4. do8 re4 re

    %10
    re sol, re' re
    re2 mi-+
    fa8 mi fa sol fa4 sol

    %13
    la2 re,\mbreak
    sol fa4 mi
    re-+ do re si-+

    %16
    do1

}

XXIIIhcn = \relative do'' {

    do2 do4 do
    do2 do4 si
    do do do si

    %4
    do fa, mi mi
    fa sol fa fa
    mi sol sol sol

    %7
    sol2 sol\mbreak
    sol1
    si2 si4 si

    %10
    si2 sib4 sib
    sib?2 sib
    la2. do4

    %13
    do2 si-+\mbreak
    do re4 do
    si la la sol

    %16
    sol1

}

XXIIItln =  \relative do' {

    sol'2 sol4 sol
    sol2 sol4 fa
    mi la sol fa

    %4
    mi4 re do do
    do do do sol'
    sol fa mi mi

    %7
    re2 do\mbreak
    si1-+
    sol'2 sol4 sol

    %10
    sol2 fa4 fa
    fa2 sol
    do,2. mi4

    %13
    fa2 sol\mbreak
    sol sol4 sol
    sol mi fa re

    %16
    mi1

}

XXIIIbcn = \relative do {

    do'2 do4 do
    do2 do,4 re
    mi fa sol sol,

    %4
    do re mi do
    fa mi fa sol
    la si do do,

    %7
    sol'2 do,\mbreak
    sol1
    sol'2 sol4 sol

    %10
    sol2 sib4 sib
    sib?2 sol-+
    fa2. do4

    %13
    fa2 fa\mbreak
    mi4 re8 do si4 do
    sol la fa sol

    %16
    do1

}

XXIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 60
    s1*8
    \bar ":..:"
    s1*8
    \bar":|."

}

XXIIIds = {
    \XXIIIglobal
    <<\XXIIIdsn \forma>>

}

XXIIIhc = {
    \XXIIIglobal
    <<\XXIIIhcn \forma>>

}

XXIIItl = {
    \XXIIIglobal
    <<\XXIIItln \forma>>

}

XXIIIbc = {
    \XXIIIglobal
    \clef bass
    <<\XXIIIbcn \forma \XXIIIbfn>>

}



XXIVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXIVdsn =  \relative do'' {

    sol'4 la2
    sol4 do, fa
    fa mi2-+

    %4
    re8-+do re mi re4
    sol la2
    sol4 do, fa

    %7
    fa mi2-+
    re2.-+
    re4 mi2

    %10
    re4 sol, do\mbreak
    re sol2
    mi4-+ do re

    %13
    mi fa8 mi re-+ do
    re4 sol, do
    mi fad4.-+(mi16 fad)

    %16
    sol2.~
    sol4 fa8 mi re do
    re4 sol, do

    %19
    re re2-+
    do2.

}

XXIVhcn = \relative do'' {

    do4 do2
    do do4
    re do2

    %4
    si8 la si do si4
    do do2
    do do4

    %7
    re do2
    si2.-+
    si4 do2

    %10
    si4 sol sol\mbreak
    sol sol2
    sol sol4

    %13
    sol sol sol
    sol2 sol4
    do do re

    %16
    re2 mi4
    la,2 la4
    sol2 sol4

    %19
    do si2-+
    do2.

}

XXIVtln =  \relative do' {

    mi4 fa2
    mi2 la4
    re, sol2
    sol sol4
    sol fa2
    mi4. re8 do4
    sol' sol2
    sol2.
    sol4 sol2
    sol4 re mi\mbreak
    re re2
    mi4 mi re
    do fa mi
    re2 mi4
    mi la2
    sol sol4
    do, fa2
    re mi4
    la sol2
    mi2.



}

XXIVbcn = \relative do {

    do'4 fa,2
    do'4. si8 la4
    sol do,2

    %4
    sol sol'4
    mi fa2
    do'4. si8 la4

    %7
    sol do,2
    sol2.
    sol'4 do,2

    %10
    sol'4. fa8 mi4\mbreak
    si sol2
    do sol'4

    %13
    do si do
    sol4. fa8 mi re
    do4 la re

    %16
    sol, sol' mi
    fa2 fa4
    fa2 mi4

    %19
    fa sol sol,
    do2.

}

XXIVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s2 <6>4
    <7> s2
    s2.
    s
    s2 <6>4
    <7>2.
    s
    s
    s2 <6>4
    s2.*4
    s4 <6+>2
    s2.
    <7>4 <6> s
    <6 4>2.
    <6 5>

}

forma = {

    \key do\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2. = 62
    s2.*8
    \bar ":..:"
    s2.*12
    \bar":|."

}

XXIVds = {
    \XXIVglobal
    <<\XXIVdsn \forma>>

}

XXIVhc = {
    \XXIVglobal
    <<\XXIVhcn \forma>>

}

XXIVtl = {
    \XXIVglobal
    <<\XXIVtln \forma>>

}

XXIVbc = {
    \XXIVglobal
    \clef bass
    <<\XXIVbcn \forma \XXIVbfn>>

}



XXVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXVdsn =  \relative do'' {

    mib4 do2
    lab'4 lab sol
    sol fa4.-+(mib16 fa)

    %4
    sol8 lab sol fa mib re
    mib4 do2
    lab'4 lab sol

    %7
    sol fa4.-+(mib16 fa)
    sol2.\mbreak
    sol4 re2-+

    %10
    mib4 do mib
    re do2
    si4-+ sol re'

    %13
    mib fa8 mib re do
    si4-+ sol do
    fa sol4.-+(fa16 sol)

    %16
    lab2.~
    lab4 sol8 fa mib re\mbreak
    mib4 si do

    %19
    re re2-+
    do2.

}

XXVhcn = \relative do'' {

    do2 do4
    re re mib
    do2 do4

    %4
    si4. sol8 la si
    do2 do4
    re re mib

    %7
    do2 do4
    si2.\mbreak
    si4 si2

    %10
    do sol4
    sol2 fa4
    sol2 si4

    %13
    do sol fa
    sol2 fa4
    lab sib2

    %16
    do2.
    re\mbreak
    sol,2 sol4

    %19
    do si2
    do2.

}

XXVtln =  \relative do' {

    sol'4 lab2
    lab?4 fa sib
    mib, fa2

    %4
    re4._+ re8 mib fa
    sol4 lab2
    lab?4 fa sib

    %7
    mib, fa2
    re2.-+\mbreak
    sol4 sol2

    %10
    sol sol4
    sib mib, fa
    re2 sol4

    %13
    sol sol lab
    re,2 fa4
    fa mi2

    %16
    fa2.
    re4 sol2\mbreak
    mib4 re sol

    %19
    fa fa re
    mib2.

}

XXVbcn = \relative do {

    do'2.
    sib
    lab

    %4
    sol
    do,4 do2
    sib sib4

    %7
    lab2.
    sol\mbreak
    sol'4 sol,2

    %10
    do do'4
    sib lab2
    sol sol4

    %13
    do sib lab
    sol2 lab4
    lab sol2

    %16
    fa4. mib8 re do
    si2.\mbreak
    do4 sol mib

    %19
    fa sol2
    do,2.

}

XXVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <5>4 <6->2
    <7->2 <6>4
    <7>4 <6>2
    <_+>2.
    s4 <6->2
    <7-> <6>4
    <7>4 <6>2
    <_+>2.
    <_+>
    s
    <6>4 <6>2
    <_+>2.
    s4 <6> <6>
    <_+>2 <6>4
    s <6+>2
    \bassFigureExtendersOn <_->2 <_->8 <_->\bassFigureExtendersOff
    s2.
    s4 <_+> <6>
    <6 5> <_+>

}

forma = {

    \key sib\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2. = 62
    s2.*8
    \bar ":..:"\override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup "Reprise"
    s2.*12
    \bar":|."

}

XXVds = {
    \XXVglobal
    <<\XXVdsn \forma>>

}

XXVhc = {
    \XXVglobal
    <<\XXVhcn \forma>>

}

XXVtl = {
    \XXVglobal
    <<\XXVtln \forma>>

}

XXVbc = {
    \XXVglobal
    \clef bass
    <<\XXVbcn \forma \XXVbfn>>

}



XXVIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXVIdsn =  \relative do'' {

    sol'8
    mi do sol
    do do16 re mi8
    re sol4

    %4
    mi8-+ do sol'
    mi8 do sol
    do do16 re mi8

    %7
    re16 do re mi fa sol
    mi4-+ sol8
    la sib16 la sol fa\mbreak

    %10
    sol8 mi sol
    fa mi4-+
    re8-+ si do

    %13
    re16 do re mi fa sol
    mi8-+ do fa
    sol mi8.-+ fa16

    %16
    fa4 la re,
    sol8 fa16 mi re do
    si8 do8.-+(si32 do)

    %19
    re8 sol, sol\mbreak
    do16 si do re mi fa
    sol8 mi do

    %22
    re re8.-+ do16
    do4

}

XXVIhcn = \relative do'' {

    sol8
    sol sol sol
    la4 do8
    do do si

    %4
    do sol sol
    sol sol sol
    la4 do8

    %7
    do do si
    do4 do8
    do4 do8\mbreak

    %10
    do4 mi8
    re do4
    si8-+ sol sol

    %13
    sol si16 do re8
    do4 re8
    re do4

    %16
    do do si-+
    do8 la4
    sol8 sol4

    %19
    sol sol8\mbreak
    sol sol do
    do4 do8

    %22
    do si8.-+ do16
    do4

}

XXVItln =  \relative do' {

    mi8
    mi mi re
    do mi16 fa sol8
    sol4 sol8

    %4
    sol mi mi
    mi mi re
    do mi16 fa sol8

    %7
    la la sol
    sol4 sol8
    fa sol16 fa mi re\mbreak

    %10
    mi4 mi8
    sol sol4
    sol8 re mi

    %13
    re sol4
    sol8 la la
    sol sol4-+

    %16
    fa fa sol
    sol8 do, fa
    re mi4

    %19
    re re8\mbreak
    mi8. fa16 sol8
    sol4 la8

    %22
    la sol4
    mi-+

}

XXVIbcn = \relative do {

    do'8
    do do si
    la4 mi8
    sol sol,4

    %4
    do do8
    do do si
    la la mi

    %7
    fa re sol
    do,4 do''8
    fa,4 fa8\mbreak

    %10
    do4 do'8
    si do4
    sol8 sol do,

    %13
    si sol4
    do8 la re
    sib do4

    %16
    fa, fa' fa
    mi8 fa4
    sol8 do,4

    %19
    sol sol'8\mbreak
    mi do4
    mi, la8

    %22
    fa sol4
    do,

}

XXVIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4.*6
    <6 5>4.
    s4.*3
    <5/>4.
    s4.*3
    <6>4.
    s4 s <6 4>
    s4.
    <7>
    s4.*3
    <6 5>4.

}

forma = {

    \key do\major
    \time 3/8
    \tempo 4. = 90
    \partial 8 s8
    s4.*7
    s4
    \bar ":..:"
    s8
    s4.*7
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2. \set Score.measureLength = #(ly:make-moment 3/8)
    s4.*6
    s4
    \bar":|."

}

XXVIds = {
    \XXVIglobal
    <<\XXVIdsn \forma>>

}

XXVIhc = {
    \XXVIglobal
    <<\XXVIhcn \forma>>

}

XXVItl = {
    \XXVIglobal
    <<\XXVItln \forma>>

}

XXVIbc = {
    \XXVIglobal
    \clef bass
    <<\XXVIbcn \forma \XXVIbfn>>

}



XXVIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXVIIdsn =  \relative do'' {

    do8
    mib re do
    si_+ sol do
    re re16 mib fa8

    %4
    mib do mib
    fa fa16 sol lab8
    sol mib fa

    %7
    sol fa16 mib re do
    si4-+ sol'8
    mib do fa\mbreak

    %10
    re sib sib'
    lab sol4-+
    fa8 sib, sib'

    %13
    sol lab16 sol fa mib
    fa8 re mib
    fa fa8.-+ mib16

    %16
    mib4 sol do,
    la8-+ la16 sib do re
    si8-+ do8.-+(si32 do)

    %19
    re8 sol, sol'\mbreak
    lab sib16 lab sol fa
    sol8 si, do

    %22
    re re8.-+ do16
    do4\key do\major sol'8

}

XXVIIhcn = \relative do'' {

    sol8
    sol mib fa
    sol4 sol8
    fa sol4

    %4
    sol do8
    re re re
    mib4 sib8

    %7
    sib lab4
    sol si8
    do do do\mbreak

    %10
    sib4 sib8
    sib sib4
    sib sib8

    %13
    sib sib sib
    sib4 mib8
    mib re8.-+ mib16

    %16
    mib4 sol, sol
    fa la8
    sol sol4

    %19
    sol mib'8\mbreak
    mib mib re
    mib fa, sol

    %22
    do si8. do16
    do4 \key do\major sol8

}

XXVIItln =  \relative do' {

    mib8
    sol sol lab
    re,4 mib8
    re re4-+

    %4
    do4 sol'8
    sib sib sib
    sib4 lab8

    %7
    sol lab16 sol fa mib
    re4-+ sol8
    sol lab4\mbreak

    %10
    fa4-+ sol8
    fa mib4
    re-+ fa8

    %13
    mib fa sol
    fa4 sol8
    fa fa sib

    %16
    sol4 mib sol
    do,8 fa4
    re8 mib4

    %19
    re sol8\mbreak
    fa fa fa
    mib lab sol

    %22
    fa fa re
    mib4 \key do\major mi8

}

XXVIIbcn = \relative do {

    do'8
    do sib lab
    sol4 mib8
    re sol4

    %4
    do, do8
    sib4 sib8
    mib4 re8

    %7
    mib fa4
    sol4 sol8
    do lab fa\mbreak

    %10
    sib4 sol8
    re mib4
    sib' re,8

    %13
    mib re mib
    sib4 sol8
    lab sib4

    %16
    mib, mib' mi
    fa4 re8
    sol do,4

    %19
    sol do'8\mbreak
    fa, fa sib
    mib, re mib

    %22
    fa sol sol,
    do4 \key do\major do'8

}

XXVIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s <6> <6>
    <_+>4 <6>8
    <7> <_+>4
    s4.*3
    s8 <6>4
    <_+>4.
    s
    s4 <6>8
    <5/>4.
    s
    s
    s4 <6>8
    <6 5>4.
    s2.
    s4.
    <_+>
    s
    <_- 7>
    s8 <6+> <6>
    <6 5 _-> <_+>

}

forma = {

    \key sib\major
    \time 3/8
    \tempo 4. = 90
    \partial 8 s8
    s4.*7
    s4
    \bar ":..:"
    s8
    s4.*7
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2. \set Score.measureLength = #(ly:make-moment 3/8)
    s4.*7
    \bar":|."
    \mark\markup\smaller \center-column {"Le p.er""passepied"}

}

XXVIIds = {
    \XXVIIglobal
    <<\XXVIIdsn \forma>>

}

XXVIIhc = {
    \XXVIIglobal
    <<\XXVIIhcn \forma>>

}

XXVIItl = {
    \XXVIIglobal
    <<\XXVIItln \forma>>

}

XXVIIbc = {
    \XXVIIglobal
    \clef bass
    <<\XXVIIbcn \forma \XXVIIbfn>>

}



XXVIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXVIIIdsn =  \relative do'' {

    r4 sol'\tu fad4.-+ mi16 re
    sib'4. sib8 sol4 la
    fad4.-+(mi16 fad) sol4. sol8

    %4
    sol4. la8 fad4.-+ sol8
    sol4 re mib4. mib8
    do4.-+ do8 fa4. mib16 re

    %7
    sol4 mib do fa
    re2-+ r4 fa
    sib sib8 la sol la sol fa\mbreak

    %10
    mi4-+ la fa4.-+ mi16 re
    mi4. mi8 fa4. fa8
    fa4. mi8 mi4.-+ re8

    %13
    re2 r
    r4 mib do4.-+ sib16 la
    re4. do8 sib8. do16 do8.-+ sib16

    %16
    la4._+(sol16 la) sib4. sib8
    sib4. la8 la4._+ sol8
    sol1

}

XXVIIIhcn = \relative do'' {

    r2 r4 re\tu
    sib4.-+ la16 sol mib'4 do
    la4._+ la8 sib4. sib8
    sib4 do la re

    %5
    si4.-+ la16 sol do4. do8
    la4._+ la8 re4. re8
    re4 do8 sib la4._+ sib8

    %8
    sib2 r4 re
    sol sol8 fa mi fa mi re\mbreak
    dod2-+ r4 re

    %11
    dod4.-+ sib16 la re2~
    re4. mi8 dod4.-+ re8
    re4 re sib4.-+ la16 sol

    %14
    mib'4 do la4._+ sol16 fa
    sib4. la8 sol8. la16 la8._+ sol16
    fad4._+(mi16 fad) sol4. sol8

    %17
    sol4. la8 fad4._+ sol8
    sol1

}

XXVIIIbcn = \relative do {

    R1*2
    r4 re'4\tu sib4.-+ la16 sol
    mib'4 do re re,

    %5
    sol sol mib4. re16 do
    fa4 fa re4. do16 sib
    mib,2 fa

    %8
    sib4. la8 sib do sib la
    sol1\mbreak
    la~

    %11
    la4 la' fa4.-+ mi16 re
    sib'4 sol la la,
    re2 sol

    %14
    do, fa
    re4 re' mib do
    re re, sib4.-+ la16 sol

    %17
    mib'4 do re re,
    sol1

}

XXVIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s
    s4 <_+> <6> s
    s <_-> <_+> s
    <_+>2 <6>
    s <6>
    <7>1
    \bassFigureExtendersOn <_>2 <_>4 <_>\bassFigureExtendersOff
    s2 <6>
    <6 4>1
    <_+>2 <6>
    s <_+>
    <_+>1
    <5/>
    <6>2 s4 <6 _->
    <_+>2 <6>
    s4 <_-> <_+>

}

forma = {

    \key fa\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 2 = 55
    s1*18
    \bar"|."

}

XXVIIIds = {
    \XXVIIIglobal
    <<\XXVIIIdsn \forma>>

}

XXVIIIhc = {
    \XXVIIIglobal
    <<\XXVIIIhcn \forma>>

}

XXVIIIbc = {
    \XXVIIIglobal
    \clef bass
    <<\XXVIIIbcn \forma \XXVIIIbfn>>

}



XXIXglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXIXdsn =  \relative do'' {

    la'2~^\markup\italic "moderez" la8. la16 fa8. la16
    re,4. re8 sib'2~
    sib8. sib16 sol8. mi16 la4. la8

    %4
    la4. sib8 sol4.-+ sol8
    sol4. fa8 fa4.-+ mi8
    mi2~mi8. mi16 dod8. mi16\mbreak

    %7
    la,4. la8 fa'4 re
    si-+ re sol4. sol8
    sol4 fa8.-+ mi16 re4.-+ do8

    %10
    do2 r4 do8. do16
    re2 r4 re8. re16
    mi4 do fa4. fa8

    %13
    sol4. sol8 sol4.-+(fa16 sol)
    la4. sol8 fa mi re la\mbreak
    sib2 si4.-+ si8

    %16
    do4. do8 dod4.-+ dod8
    re4. mi8 mi4.-+(re16 mi)
    fa8. mi16 re8. mi16 fa8. sol16 la8. fa16

    %19
    do'4.(sib16 la) sol4 la
    sib4. la8 sol fa mi re
    sol4 fa8-+ mi mi4.-+ re8

    %22
    re1

}

XXIXhcn = \relative do'' {

    re2 la4. la8
    la8. la16 re8. re16 re4. re8
    mi2 fa4. fa8

    %4
    re4. re8 mi4. mi8
    mi4. re16 dod re4. mi8
    dod2-+ la~\mbreak

    %7
    la8. la16 la8. la16 la4. la8
    sol2~sol8. sol16 sol8. sol16
    la4 do si4.-+ do8

    %10
    do4 sol8. sol16 la2
    r8 fa fa8. fa16 sib4. sib8
    sol8. sol16 la8. sib16 la4._+ la8

    %13
    re4 re do4. do8
    do2 r4 fa,8. fa16\mbreak
    fa2 r4 mi8. mi16

    %16
    mi2 r4 la8. la16
    la4 re dod4.-+ re8
    re2 r4 re8. re16

    %19
    mi2 r4 fa8. mi16
    re2~re8 re dod re
    mi4 re dod4.-+ re8

    %22
    re1

}

XXIXtln =  \relative do' {

    fa2. fa8. fa16
    fa4. fa8 sol4. sol8
    sol2 la4. la8

    %4
    fa4 re sol4. sol8
    mi4 la la4. la8
    la2 mi~\mbreak

    %7
    mi8. mi16 fa8. mi16 fa4. fa8
    re2 mi4. mi8
    do2 sol'4. sol8

    %10
    sol4 mi8. mi16 fa2
    r8 re re8. re16 sol4. sol8
    sol8. mi16 fa8. sol16 do,4 fa

    %13
    fa4. fa8 mi4.-+ fa8
    fa2 r4 re8. re16\mbreak
    re2 r4 sol8. sol16

    %16
    sol2 r4 mi8. mi16
    mi4 re la'4. la8
    la2 r4 fa8. fa16

    %19
    sol2 r4 fa8. fa16
    fa2 sol8 re mi fa
    dod mi fa sib la4 mi

    %22
    fa1-+

}

XXIXbcn = \relative do {

    re2 re'~
    re8. re16 sib8. re16 sol,8. sol16 sib8. sol16

    %3
    do2~do8. do16 la8. fa16
    sib2~sib8. sib16 sol8. mi16
    dod4 la re re,

    %6
    la'2 la'~\mbreak
    la8. la16 fa8. la16 re,4. re8
    sol2~sol8. mi16 sol8. mi16

    %9
    fa8. fa16 la8. fa16 sol4 sol,
    do8. do'16 do8. sib16 la2
    r8 sib sib8. la16 sol4. sol8

    %12
    do8. sib16 la8. sol16 fa8. mi16 re8. la16
    sib4 sol do do,
    fa2 r4 fa'8. fa16\mbreak

    %15
    sol2 r4 sol8. sol16
    la2 r8 la sol8. mi16
    fa4 sol la la,

    %18
    re2 r4 re'8. re16
    do2 r4 do8. do16
    sib2~sib8 la sol fa

    %21
    mi dod re sol, la2
    re,1

}

XXIXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <_->
    s <6 4>
    <7> <6>
    <5/>4 <_+> s2
    <_+>1
    s
    s2 <6 4>
    <7>4 <6> s2
    s
    <6>
    s <_->
    s1
    <6 5>4 <7 _-> s2
    s1
    <_->2 s4 <_+>
    s2 s8 <_+> s4
    <6> <_-> <_+>2
    s1
    s2 s4 <6 4>
    <6>2 s8 <6> <6 _-> <6>
    <6+>4 s8 <_-> <_+>2

}

forma = {

    \key do\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 2 = 65
    s1*22
    \bar"|."

}

XXIXds = {
    \XXIXglobal
    <<\XXIXdsn \forma>>

}

XXIXhc = {
    \XXIXglobal
    <<\XXIXhcn \forma>>

}

XXIXtl = {
    \XXIXglobal
    <<\XXIXtln \forma>>

}

XXIXbc = {
    \XXIXglobal
    \clef bass
    <<\XXIXbcn \forma \XXIXbfn>>

}



XXXglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXXdsn =  \relative do'' {

    fad4. fad8 mi4.-+ re8
    la'2 la,4. la8
    re4. re8 re4. mi8

    %4
    dod4.-+(si16 dod) re4. la8
    si4. si8 la4._+ sol8
    fad2_+ re'4. re8

    %7
    re4 si dod4.-+ re8
    mi2~mi8 dod re mi
    fad4. fad8 sold4 la\mbreak

    %10
    sold4-+ mi la dod,
    fad4. si,8 si4.-+ la8
    la1

    %13
    mi'4. mi8 la4. sol8
    fad4.-+(mi16 fad) sol4 si
    mi,4. fad8 fad4.-+ mi8

    %16
    red4-+ si fad'4. sol8
    sol4.-+ fad8 fad4.-+ mi8
    mi4. mi8 dod4-+ la\mbreak

    %19
    re4. dod8 re mi fad sol
    la2 la4.-+ (sol16 la)
    si4 sol mi fad

    %22
    dod4.-+ re8 mi4 la,
    fad'4. mi8 mi4.-+ re8
    re1

}

XXXhcn = \relative do'' {

    R1
    la2 la~
    la  sold

    %4
    la la4. la8
    sol4. sol8 fad4.-+ mi8

    %6
    re2 si'4. si8
    si2 la4. la8
    la2. sol4

    %9
    fad re' re mi\mbreak
    mi2 la,4. la8
    la2 sold4._+ la8

    %12
    la1
    dod4. dod8 mi4 dod
    re2 re4. re8

    %15
    do2 do4. do8
    si2 si4. si8
    si4 mi red4. mi8

    %18
    mi4 sold, la4. la8\mbreak
    la4. sol8 fad mi re4
    re'2 re4. re8

    %21
    re4 mi dod la
    la2 la4. la8
    la4 re dod4.-+(re8)

    %24
    re1

}

XXXtln =  \relative do' {

    R1
    fad4. fad8 mi4. fad8
    re2. re4

    %4
    mi2 fad4. fad8
    re2 dod-+
    re fad4. fad8

    %7
    mi2 mi4. re8
    dod2 mi4. mi8
    re4 fad si mi,\mbreak

    %10
    mi2 mi4. mi8
    re4. re8 re4. mi8
    dod1-+

    %13
    la'2 la4. la8
    la2 si4. si8
    sol2 la4. la8

    %16
    fad2 fad4 fad
    mi mi si'4. si8
    sold4 mi mi4. mi8

    %19
    fad4. sol8 la4 la
    re,2 fad4. fad8
    sol2 sol4 fad

    %22
    mi2 mi4 mi
    re re la'4. la8
    fad1

}

XXXbcn = \relative do {

    R1
    re'4. re8 dod4. re8
    si1

    %4
    la4. sol8 fad2
    sol la
    si~si8 si la si

    %7
    sold2 la4. re,8
    la2 la'8 la si dod
    re4. dod8 si4 la\mbreak

    %10
    mi4 mi8 re dod4. dod8
    re2 mi4 mi,
    la1

    %13
    la'4. la8 dod4 la
    re4. re8 si4 sol
    do2 la

    %16
    si red,4 si
    mi la, si2
    mi la4 la8 sol\mbreak

    %19
    fad4. mi8 re4 re'
    fad,2. re4
    sol mi la re,

    %22
    la4. si8 dod2
    re4 sol, la2
    re,1

}

XXXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s
    <6>2 <6+>
    s1*3
    <5/>1
    s
    s4. <6>8 <6+>2
    <_+>1
    s1*3
    s2 <6>
    s <_->
    <_+>1
    s4 <_-> <_+>2
    <_+>1
    s4. <6>8 s2
    s1
    s2 <7>
    s4. <6>8 <5/>2

}

forma = {

    \key re\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 2 = 75
    s1*12
    \bar ":..:"
    s1*12
    \bar":|."

}

XXXds = {
    \XXXglobal
    <<\XXXdsn \forma>>

}

XXXhc = {
    \XXXglobal
    <<\XXXhcn \forma>>

}

XXXtl = {
    \XXXglobal
    <<\XXXtln \forma>>

}

XXXbc = {
    \XXXglobal
    \clef bass
    <<\XXXbcn \forma \XXXbfn>>

}



XXXIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXXIdsn =  \relative do'' {

    re4 do4.-+ sib8
    la2.
    r4 re4. mi8

    %4
    fa4 mi la
    fa4.-+ mi8 re4
    do do4. re8

    %7
    si2-+ r8 si
    dod re dod4.-+ re8
    re4 la'4. sol8

    %10
    fa mi re fa sol la
    sib4 sib la\mbreak
    la4 sol4.-+ la8

    %13
    la2.~
    la4 la,4. la8
    re4 re4. mi8

    %16
    dod4.-+ si8 la4
    re8 mi fa sol la fa
    do'4 mi, fad

    %19
    sol4. la8 sib dod,
    re mi mi4.-+ re8
    re4 la'4.^\markup\italic "trio" sib8\mbreak

    %22
    do4 sol la
    sib2~sib8 sib
    la sib sol4.-+ fa8

    %25
    fa4 la,4.\tu si8
    do4 la re
    si4. mi8 dod4

    %28
    re mi fa
    mi-+ la4.^\markup\italic "trio" sib8
    do4 sol la

    %31
    sib2~sib8 sib
    la sib sol4. fa8\mbreak
    fa4 la,4.\tu si8

    %34
    do4 la re
    si4.-+ mi8 dod la
    mi' fa dod4.-+ re8

    %37
    re la' fad re la'4
    r8 la fad re sol4~
    sol8 fad mi fad mi re

    %40
    dod re mi la, re mi
    fad la fad re la'4
    r8 la fad re sol4~\mbreak

    %43
    sol8 fad mi fad mi re
    dod-+ re mi la, re mi
    fad sol la fad sol la

    %46
    si la si sol la si
    mi, la sol fad mi-+ re
    mi fad sol mi la sol

    %49
    fad sol la fad sol la
    si la si sol la si
    mi, la sol fad mi-+ re

    %52
    sol fad mi4.-+ re8
    re4 \mbreak fa4.^\markup\italic "trio" fa8
    fa4 mi la

    %55
    fa re fa
    mi re4. mi8
    dod4-+ mi4.\tu mi8

    %58
    mi4 si4.-+(la16 si)
    do4. re8 mi4
    si8 do si4.-+ la8

    %61
    la4 mi'4.^\markup\italic "trio" mi8
    la4 la4. la8\mbreak
    re,4 sol4. la8

    %64
    mi8. fa16 fa4.-+ mi8
    mi4 la,8\tu si do re
    si do si do re mi

    %67
    dod-+ re mi fa sol la
    sib mi, mi4.-+ re8
    re re16 mi fad sol fad sol la8 la,

    %70
    re si16 dod re mi fad re sol8 si,
    dod-+ la16 si dod re dod re mi8 la,\mbreak
    re re16 dod si la sol fad mi8 la

    %73
    fad_+ fad16 sol la si la si do si do la
    si la sol la si dod si dod re dod re si
    mi la, si dod re mi fad sol la fad sol la

    %76
    si sol la si mi,4 la~
    la8. [la16 sol8. fad16 mi8.-+ re16]
    mi8.\dolce [re16 mi8. fad16 sol8. fad16]\mbreak

    %79
    mi8. [la16\f sol8. fad16 mi8.-+ re16]
    sol4 sol sol~
    sol8 fad16 mi fad8. [sol16 la8. si16]

    %82
    la8. [sol16 la8. fad16 sol8. la16]
    si4.(mi,8) mi4
    r8 fa mi4.-+ re8

    %85 OOKK
    re4 la8. la16 sib4
    sol do4. sib8
    la4 fa'4. mi8

    %88
    re4 sib'2~
    sib4 la do\mbreak
    fad,4.-+ mi8 re4

    %91
    la'2 r8 la
    la sib fad4.-+ sol8
    sol4 sib sol

    %94
    mi la4. re,8
    dod8.-+ si16 (la4) mi'
    r8 si dod4.-+ re8

    %97
    re4 la2
    r4 si2
    r4 dod4.-+ dod8

    %100
    re mi mi4.-+ re8
    re2.

}

XXXIhcn = \relative do'' {

    la4 sol4. sol8
    fa2.
    r4 la4. sol8

    %4
    la4 la la
    la2.
    la4 la4. la8

    %7
    sol2 r8 sol
    la4 la mi
    fa2.

    %10
    r4 re'4. do8
    sib la sol4 la\mbreak
    re4. dod8 re mi

    %13
    dod4.-+ re8 mi4
    la,8 sol fa mi re4~
    re sib'4. sib8

    %16
    la2 mi4
    fa8 sol la4 re
    mi mi re

    %19
    re4. do8 sib4
    la8 re dod4. re8
    re4<<{ fa4.^\markup\italic"trio" fa8\mbreak}\\{ re4. re8}>>

    %22
    mi4-+ mi fa
    re4.-+ do8 re mi
    fa4 mi4.-+ fa8

    %25
    fa4 fa,4.\tu fa8
    sol4 fa la
    sol4. sol8 la4

    %28
    re dod re
    dod-+ fa4.^\markup\italic"trio" fa8
    mi4-+ mi fa

    %31
    re4.-+ do8 re mi
    fa4 mi4.-+ fa8\mbreak
    <<fa4\\fa,>> fa4.\tu fa8

    %34
    sol4 fa la
    sol4. si8 la4
    la la4. la8

    %37 maieur OOKK
    fad4 r8 re' mi dod
    re4 r8 re re si
    dod4 r8 la la sold

    %40
    la4. mi8 fad sol
    la4 r8 re mi dod
    re4 r8 re re si\mbreak

    %43
    dod4 r8 la la sold
    la4. mi8 fad sol
    la4 r8 re dod re

    %46
    si4 r8 mi re si
    dod4 r8 re la la
    la4 r8 dod mi dod

    %49
    re dod re4 do
    si4. si8 re si
    dod re mi la, la la

    %52
    si re dod4.-+ re8
    re4\mbreak re4.^\markup\italic"trio" re8
    re4 dod8 re mi dod

    %55
    re do? sib4 la
    la la sol_+
    la la8\tu sold la si

    %58
    sold fad sold la si sold
    la4. sold8 la4
    sold8 la sold4._+ la8

    %61
    la4 do4.^\markup\italic"trio" do8
    do4. si8 do re\mbreak
    si4-+ mi2~

    %64
    mi4 la, re
    dod4-+ fa,4.\tu fa8
    re4 sol4. sol8

    %67
    mi4 r8 re' dod re
    re4 dod4.-+ re8

    %69 maieur OOKK
    re4 r8 la la la
    si4 r8 si si si
    la4 r8 la la la\mbreak

    %72
    la16 fad sol la re,8 re re dod
    re4 r8 fad16 sol la sol la fad
    sol4 r8 si si si

    %75
    mi, la la la re re
    re4 dod4.-+(si16 dod)
    re4 r re

    %78
    dod-+ r r\mbreak
    dod4 r8 r16 re la8. si16
    dod8.[re16 dod8. re16 mi8. dod16]

    %81
    re4 r re
    re r r
    re2 re4~
    re dod4.-+ re8

    %85 mineur OOKK
    re4 fa,4. fa8
    mi4 sol2
    fa4 la2

    %88
    sib8 do re2
    mib mib4\mbreak
    re2 re4

    %91
    re2 do4
    mib re la
    sib re4. re8

    %94
    do4 do4. sib8
    la2 sol4~
    sol sol mi

    %97
    fa fa2
    r4 mi2
    r4 mi4. mi8

    %100
    fa la la4 mi
    fa2.

}

XXXItln =  \relative do' {

    fa4 mi4.-+ re8
    do2.
    r4 fa4. dod8

    %4
    re4 re dod
    re2.
    re4 re4. re8

    %7
    re2 r8 sol
    sol fa mi4.-+ re8
    re2.

    %10
    R2.*3
    r4 la'4. sol8
    fa mi re4 fa~

    %15
    fa sol4. sol8
    mi4.-+ re8 dod si
    la4 re8 mi fa re

    %18
    sol4 do la
    sib4. fad8 sol4
    fa?8 sib la4 mi

    %21
    fa re'4.^\markup\italic"trio" re8\mbreak
    do4 do4. do8
    sib do sib la sol4

    %24
    fa do' do,
    fa do4.\tu re8
    mi4 do fa

    %27
    re4. sol8 mi4
    fa sol la
    la re4.^\markup\italic"trio" re8

    %30
    do4 do4. do8
    sib8 do sib la sol4
    fa do' do,\mbreak

    %33
    fa do4.\tu re8
    mi4 do fa
    re4. sol8 mi fa
    sol8 fa mi4.-+ re8

    %37 maieur OOKK
    re4 r8 la' la sol
    fad4 r8 la si si
    la4 r8 fad la si

    %40
    mi,4. mi8 re dod
    re4 r8 la' la sol
    fad4 r8 la si si\mbreak

    %43
    la4 r8 fad la si
    mi,4. mi8 re dod
    re4 r8 la' sol fad

    %46
    re4 r8 sol fad mi
    mi4 r8 fad sol fad
    mi4 r8 mi mi mi

    %49
    fad mi re la' sol fad
    re4. sol8 fad mi
    mi re mi fad sol fad
    re4 la'4. la8

    %53 mineur OOKK
    fad4-+ re8^\markup\italic"trio" mi fa sol
    la sol la si dod la
    re4 re, re

    %56
    do sib2
    la4 do4.\tu do8
    si?4 mi4. mi8

    %59
    mi4 do'8 si la4
    mi mi4. mi8
    mi4 la8^\markup\italic"trio" sib la sol

    %62
    fad mi re mi fad re\mbreak
    sol fa mi fa mi re
    dod la re mi fa sol

    %65
    la4 do,8\tu si la4
    si mi4. mi8
    mi4. re8 sol fa

    %68
    re sib' la4. la8
    fad4-+ r8 fad mi fad16 mi
    re4 r8 re mi mi

    %71
    mi4 r8 mi mi mi\mbreak
    fad re re si la la
    la4 r8 re re re

    %74
    re4 r8 sol sol si,
    dod mi fad fad fad fad
    re4 la'4. la8

    %77
    fad4 r la
    la r r\mbreak
    la r8 r16 re, sol8. fad16

    %80
    mi8.[re16 mi8. fad16 sol8. mi16]
    fad4 r fad
    fad r r

    %83
    re2 si'4~
    si la4. la8
    la4 re,4. re8

    %86
    do2 do4
    do2 re4
    re2 sol4

    %89
    sol la4. la8\mbreak
    la2 sib4
    la fad sol

    %92
    sol fad4. sol8
    sol2 sol4
    sol fa4. fa8

    %95
    mi2 mi4~
    mi mi4.-+ re8
    re4 do2

    %98
    r4 sol'2
    r4 mi4. mi8
    re4 dod4.-+ re8

    %101
    re2.

}

XXXIbcn = \relative do {

    re4 mi4.-+ mi8
    fa2.
    fa,4. sol8 fa mi

    %4
    re4 la'2
    re2.
    fad

    %7
    sol2 r8 mi
    la re, la2_+
    re2.

    %10
    R2.*4
    r4 re'4. do8
    sib la sol la sib sol

    %16
    la4 la4. sol8
    fa mi re4. re8
    do4 do re

    %19
    sib4. la8 sol mi
    fa sol la2
    re,4 r r\mbreak

    %22
    R2.*3
    r4 fa'4. fa8
    mi4 fa re

    %27
    sol4. mi8 la4
    fa mi re
    la r r

    %30
    R2.*3\mbreak
    r4 fa'4. fa8
    mi4 fa re

    %35
    sol4. mi8 la fa
    dod re la2

    %37 maieur OOKK
    re4 r8 re' dod la
    re4 r8 re si sol
    la4 r8 re dod si

    %40
    la si la sol fad mi
    re4. re8 dod la
    re4. re8 si sol\mbreak

    %43
    la4 r8 re dod si
    la si la sol fad mi
    re4 r8 re' mi fad

    %46
    sol4 r8 mi fad sol
    la4 r8 re dod-+ re
    la4 r8 la, dod la

    %49
    re mi fad re mi fad
    sol fad sol mi fad sol
    la fad mi re dod-+ re

    %52
    si sol la2
    re,4\mbreak r r
    R2.*3

    %57
    r4 la'8 si do re
    mi re mi fad sold mi
    la sold la si do re

    %60
    mi la, mi4 mi,
    la r r
    R2.*3

    %65
    r4 fa8 sol la fa
    sol fa sol la sib sol
    la la'-+ sol fa mi re
    sol,4 la2

    %69 maieur OOKK
    re,4 r8 re'' dod re16 dod
    si4 r8 si sol fad16 mi
    la4 r8 la sol la16 sol\mbreak

    %72
    fad re mi fad sol mi fad sol la8 la,
    re4 r8 re' fad, re
    sol,4 r8 sol' si si,

    %75
    la la' fad re fad, fad'
    sol sol, la4. la8
    re,4 r re'

    %78
    la' r r\mbreak
    la r8 r16 si [dod8. re16]
    dod8.-+[si16 la8. si16 dod8. la16]

    %81
    re4 r re,
    fad, r r
    sol2 sold4~
    sold la2

    %85 mineur OOKK
    re,4 re'2
    mi4. re8 do4
    fa4. mi8 re4

    %88
    sib'4. la8 sol4
    do4. re8 mib do\mbreak
    re4. do8 sib4

    %91
    fad re mib
    do re re,
    sol sol'8 la sib sol

    %94
    do4 fa,4. sol8
    la4. la8 sib4
    sol la la,

    %97
    sib fa2
    r4 sol2
    r4 la4. la'8

    %100
    fa re la2
    re,2.

}

XXXIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s
    <6>2 s8 <6+>
    s4 <4> <3+>
    s2.*3
    <7 _+>2.
    s2.*7
    s4 <_+>2
    <6>8 <6+> s2
    s <_+>4
    <6>4. <6+>8 <_-> <6+>
    <6> <6 _-> <_+>2
    s2.*2
    s2 <5>8 <6 _->
    s2.
    s2 s8 <6 4>
    <6>2.
    s2 <_+>4
    <6> <6+> s
    <_+>2.
    s2.*3
    s2 s8 <6 4>
    <6>2.
    s2 <_+>8 <6>
    s4 <6>2
    s2.
    s2 <6>4
    s2 <6>8 <6+>
    s2 <6>8 <6>
    s2.
    s2 <6>4
    s2 <6>8 <6+>
    s2 <6>8 <6>
    s2.*5
    s2 <6>8 <6>
    s <6> <6> s4.
    <6>2.
    s
    <_+>
    s4 <6->2
    s2.
    <_+>
    <_+>
    s
    <7 _+>4 <_+> s
    s2.*3
    <5/>2.
    <_+>
    s
    <_+>8 <6 4+> <6>4 <6+>
    <_-> <_+> s
    s2.
    s2 <6>4
    s2.*9
    <5/>2.
    s
    s
    s2 <6 5/>4
    s2.
    s4 <5> <6->
    s2.
    s2 <_->4
    <5 _->8 <6> s2
    s2.
    <_+>2 <6>4
    <6> <_+> <6 4>
    <_-> <_+> s
    s2.
    s2 s8 <_->
    <_+>2 <6 4>4
    <6> <_+> s
    s2.
    s4 <6 5>2
    s4 <_+>2
    <6>4 <_+>2

}

forma = {

    \key do\major
    \override Staff.TimeSignature.style = #'single-digit
    \override Score.RehearsalMark.extra-offset = #'(0  . +1)
    \time 3/4
    \tempo 2 = 60
    s2.*36\break
    \mark\markup {maieur}
    \key re\major
    s2.*16
    s4\break
    \key do\major
    \mark\markup {mineur}
    s2
    s2.*15\break
    \mark\markup {maieur}
    \key re\major
    s2.*16
    s4\break
    \mark\markup {mineur}
    \key do\major
    s2
    s2.*16
    \bar"|."

}

XXXIds = {
    \XXXIglobal
    <<\XXXIdsn \forma>>

}

XXXIhc = {
    \XXXIglobal
    <<\XXXIhcn \forma>>

}

XXXItl = {
    \XXXIglobal
    <<\XXXItln \forma>>

}

XXXIbc = {
    \XXXIglobal
    \clef bass
    <<\XXXIbcn \forma \XXXIbfn>>

}



XXXIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXXIIdsn =  \relative do'' {

    re8 mi
    fa4 mi re dod-+
    re mi fa sol
    la sol8 fa mi4 re

    %4
    dod-+ la la mi'
    fa mi fa mi8 re
    mi4 re8 do si4-+ la

    %7
    mi la si sold_+
    la2. fa'8 mi
    fa4 do do do\mbreak

    %10
    la fa fa sol'8 fad
    sol4 re re re
    sib sol sol sib'8 la

    %13
    sol4 fa mi-+ re
    mi re8 dod re4 mi
    la, re mi dod-+

    %16
    re2.

}

XXXIIhcn = \relative do'' {

    la4
    la sib la sol
    la la la sol
    fa sib8 la sol4 sib

    %4
    la2. dod4
    re dod re do8 si
    do4 si8 la sol4 fa

    %7
    sol fa fa mi
    mi2. do'8 sib
    la4 la la sol\mbreak

    %10
    fa2. re'8 do
    sib4 sib sib la
    sol2. re'4

    %13
    dod re la la
    la la8 sol fa4 mi
    re sib' sib la

    %16
    la2.

}

XXXIItln =  \relative do' {

    fa8 mi
    re4 dod re mi
    fa mi re dod
    re mi8 fa sol4 sol

    %4
    mi2. la4
    la la la sol
    sol fa mi re

    %7
    do do si si
    la2. fa'8 sol
    fa4 fa fa mi\mbreak

    %10
    fa2. sol8 la
    sol4 sol sol fad
    sol2. sol8 re

    %13
    mi4 fa sol fa
    mi fa8 sol la4 sol
    fa fa mi mi

    %16
    re2.

}

XXXIIbcn = \relative do {

    re'8 dod
    re4 sol, fa mi
    re dod re mi
    fa sol8 la sib4 sol

    %4
    la2. la4
    re la re, sol
    do, re mi fa

    %7
    do fa re mi
    la,2. la'8 sol
    la4 la, la do\mbreak

    %10
    fa,2. sib'8 la
    sib4 sib, sib re
    sol,2. sol'8 fa

    %13
    mi4 re dod re
    la fa'8 mi re4 dod
    re sib sol la

    %16
    re,2.

}

XXXIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 70
    \partial 4 s4
    s1*7
    s2.
    \bar ":..:"
    s4
    s1*7
    s2.
    \bar":|."

}

XXXIIds = {
    \XXXIIglobal
    <<\XXXIIdsn \forma>>

}

XXXIIhc = {
    \XXXIIglobal
    <<\XXXIIhcn \forma>>

}

XXXIItl = {
    \XXXIIglobal
    <<\XXXIItln \forma>>

}

XXXIIbc = {
    \XXXIIglobal
    \clef bass
    <<\XXXIIbcn \forma \XXXIIbfn>>

}



XXXIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XXXIIIdsn =  \relative do'' {

    fad8 sol
    la4 fad re mi
    fad8 sol fad mi re mi fad sol

    %19
    la4 sol8 fad mi4-+ re
    mi la, la8 si dod re
    mi4 re8 dod si4-+ la

    %22
    si8 la si dod re4 dod8-+ si
    dod4 si8 la si4 sold_+\mbreak
    la2. mi'8 re

    %25
    mi4 fad sol mi-+
    fad8 sol fad mi re4 si'8 la
    si4 la8 sol fad sol la fad

    %28
    sol la sol la si la sol fad
    mi4 la8 sol la2~
    la4 sol8 fad sol4 fad8-+ mi

    %31
    fad4 mi8 re mi4 dod-+
    re2.

}

XXXIIIhcn = \relative do'' {

    re8\dolce mi
    fad4 re fad, sol
    re'8 mi fad sol la4 re,8 mi

    %19
    fad4 mi8 re dod4-+ si
    la8 si dod re mi4 la,8 si
    dod4 si8 la sold4 la

    %22
    mi8 fad sold la si4 la8 sold
    la4 fad re mi\mbreak
    la2. la8 si

    %25
    dod4 re sol, la
    re la re, sol'8 fad
    sol4 do, re re,

    %28
    sol sol'8 fad sol4 sol,
    la2. la8 si
    do4 si8 la si4 do-+

    %31
    re si sol la
    re,2.

}

XXXIIItln = \relative do' {

    r4
    R1*7
    r2 r4 r
    R1*7
    r2 r4

}

XXXIIIbcn = \relative do {

    r4
    R1*7
    r2 r4 r
    R1*7
    r2 r4

}



forma = {


    \key re\major
    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 70
    \partial 4 s4
    s1*7
    s2.
    \bar ":..:"
    s4
    s1*7
    s2.
    \bar ":|."
    \mark\markup\tiny\center-column {"On reprend" "la P.re Bourrée"}

}

XXXIIIds = {
    \XXXIIIglobal
    <<\XXXIIIdsn \forma>>

}

XXXIIIhc = {
    \XXXIIIglobal
    <<\XXXIIIhcn \forma>>

}

XXXIIItl = {
    \XXXIIIglobal
    <<\XXXIIItln \forma>>

}

XXXIIIbc = {
    \XXXIIIglobal
    \clef bass
    <<\XXXIIIbcn \forma >>

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper {
    print-first-page-number = ##t
    first-page-number = #2
}

\bookpart {

    \paper {
        systems-per-page = #4
    }

    \header {
        title = \markup\column\smaller { "Idoménée - Airs à joüer"" "}
        composer = \markup \center-column{"A. Campra (1660-1744)"}
    }

    \markup \huge \bold {"PROLOGUE"}
    \markup \huge  {"[1.] Ouverture"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sib\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''4^\markup\smaller\center-align {"[Dessus]" }  sib'
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ids
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'2 ^\markup\smaller\center-align{[Haute-contre]} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ihc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sib\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'2^\markup\smaller\center-align{[Taille] }  fa'4 }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Itl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[2.] Sarabande pour la suite de Venus"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''4^\markup\smaller\center-align {"[Dessus]" }  \appoggiatura do''16 sib'4
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'2 ^\markup\smaller\center-align{[Haute-contre]} sol'4 }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'2^\markup\smaller\center-align{[Taille] }  mib'4 }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[3.] Air des Tritons - Loure"}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff
                    <<
                        \set Staff.instrumentName = \markup \center-column{""}
                        \incipit {
                            \clef french \key sol\major \time 6/4\numericTimeSignature r2^\markup\smaller\center-align {"Hautbois [I]" } mi''4 fad''4.
                        }
                        \clef violin
                        \set Staff.shortInstrumentName = "ob1"
                        \set Staff.midiInstrument = #"oboe"
                        \IIIobI
                    >>

                    \new Staff
                    <<
                        \set Staff.instrumentName = \markup \center-column{""}
                        \incipit {
                            \clef french \key sol\major \time 6/4\numericTimeSignature r2^\markup\smaller\center-align {"Hautbois [II]" } dod''4 re''4
                        }
                        \clef violin
                        \set Staff.shortInstrumentName = "ob2"
                        \set Staff.midiInstrument = #"oboe"
                        \IIIobII
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit {
                        \clef french \key sol\major \time 6/4\numericTimeSignature re''4^\markup\smaller\center-align {"[Dessus]" }  sol'4.
                    }
                    \set Staff.shortInstrumentName = "ds"
                    \clef violin
                    \set Staff.midiInstrument = #"violin"
                    \IIIds
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano\key sol\major \time 6/4\numericTimeSignature r4 r r ^\markup\smaller\center-align{[Haute-contre]} sol'  }
                    \set Staff.shortInstrumentName = "hc"
                    \clef violin
                    \set Staff.midiInstrument = #"violin"
                    \IIIhc
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef mezzosoprano \key sol\major \time 6/4\numericTimeSignature r4 ^\markup\smaller\center-align{[Taille] } r r  re'4 }
                    \set Staff.shortInstrumentName = "tl"
                    \clef alto
                    \set Staff.midiInstrument = #"viola"
                    \IIItl
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup  \center-column{"[Basse]"\vspace #-0.2"Bassons"}
                    \set Staff.shortInstrumentName = "bc"
                    \set Staff.midiInstrument = #"bassoon"
                    \IIIbc
                >>
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #4
    }

    \markup \huge  {"[4.] Airs des Plaisirs"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol''2^\markup\smaller\center-align {"[Dessus]" }  re''4
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'2 ^\markup\smaller\center-align{[Haute-contre]} si'4. }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'2^\markup\smaller\center-align{[Taille] } sol'4. }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IVbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[5.] Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sol\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol''4^\markup\smaller\center-align {"[Dessus]" }  sol''4
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Vds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit si'4 ^\markup\smaller\center-align{[Haute-contre]} si'4}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Vhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'4^\markup\smaller\center-align{[Taille] } re'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Vtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Vbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[6.] Passepied"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 3/8\numericTimeSignature re''8^\markup\smaller\center-align {"[Dessus]" }  sib'
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 3/8\numericTimeSignature sol'8 ^\markup\smaller\center-align{[Haute-contre]} sol'4}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 3/8\numericTimeSignature re'8^\markup\smaller\center-align{[Taille] } re'4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \VItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge \bold {"ACTE PREMIER"}
    \markup \huge  {"[7.] Prélude pour Idamante - Gay"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''2^\markup\smaller\center-align {"[Dessus]" }  sol''4.
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'2 ^\markup\smaller\center-align{[Haute-contre]} do''8}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'2^\markup\smaller\center-align{[Taille] } sol'8}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \VIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[8.] Marche des Crétois"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''2^\markup\smaller\center-align {"[Dessus]" }  re''4.
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit si'2 ^\markup\smaller\center-align{[Haute-contre]} si'4.}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'2^\markup\smaller\center-align{[Taille] } re'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \VIIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[9.] Air pour les Crétois - Rondeau"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 6/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi re''8^\markup\smaller\center-align {"[Dessus]" }  do''4
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IXds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 6/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r8 ^\markup\smaller\center-align{[Haute-contre]} r4 r2 r4 r r8 re' re'4}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IXhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 6/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r8^\markup\smaller\center-align{[Taille] } r4 r2 r4 r r8 re' re'4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IXtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IXbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[10.] Air des Troyens - Gay"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 4/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi re''16^\markup\smaller\center-align {"[Dessus]" }  sol''8.
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Xds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 4/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi re''16 ^\markup\smaller\center-align{[Haute-contre]} re''8.}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Xhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 4/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sib'16^\markup\smaller\center-align{[Taille] } sib'8.}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Xtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Xbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[11.] Gigue"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi re''4^\markup\smaller\center-align {"[Dessus]" }  sol'8
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sib'4. ^\markup\smaller\center-align{[Haute-contre]} sib'4}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol'4.^\markup\smaller\center-align{[Taille] } re'4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #4
    }

    \markup \huge \bold {"ACTE SECOND"}
    \markup \huge  {"[12.] Prélude - Tres vîte"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r2.^\markup\smaller\center-align {"[Dessus]" }  fa'8(fa')
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef soprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'8^\markup\smaller\center-align {H[aute]-contre} (fa')
                }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do'8^\markup\smaller\center-align{Taille}  do' }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XIIfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"B.C."}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[13.] Prélude pour la Jalousie"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef soprano \key fa\major \time 2/2 la'16 [sib'^\markup\smaller\center-align {"[Dessus]" } la' sol']
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 2/2 fa'4. ^\markup\smaller\center-align{H[aute]-contre} do'8}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 2/2 do'4.^\markup\smaller\center-align{Taille} do'8}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XIIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"B. C."}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[14.] Premier Air de la Jalousie - Grave et piqué"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa''4.^\markup\smaller\center-align {"[Dessus]" } fa''8]
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  fa'1^\markup\smaller\center-align{[Haute-contre]} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do'1^\markup\smaller\center-align{[Taille]} }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XIVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[B. C.]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIVbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {[15.] 2.\super e Air - Vite}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa''4.^\markup\smaller\center-align {"[Dessus]" } fa''8]
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  fa'1^\markup\smaller\center-align{[Haute-contre]} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do'1^\markup\smaller\center-align{[Taille]} }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[B. C.]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XVbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge \bold {"ACTE TROISIÉME"}
    \markup \huge  {"[16.] Marche des matelots"}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff
                    <<
                        \set Staff.instrumentName = \markup \center-column{""}
                        \incipit {
                            \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'4^\markup\smaller\center-align {"Hautbois [I]" } la'2
                        }
                        \clef violin
                        \set Staff.shortInstrumentName = "ob1"
                        \set Staff.midiInstrument = #"oboe"
                        \XVIobI
                    >>

                    \new Staff
                    <<
                        \set Staff.instrumentName = \markup \center-column{""}
                        \incipit {
                            \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'4^\markup\smaller\center-align {"Hautbois [II]" } la'2
                        }
                        \clef violin
                        \set Staff.shortInstrumentName = "ob2"
                        \set Staff.midiInstrument = #"oboe"
                        \XVIobII
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit {
                        \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'4^\markup\smaller\center-align {"Violons" }  la'2
                    }
                    \set Staff.shortInstrumentName = "ds"
                    \clef violin
                    \set Staff.midiInstrument = #"violin"
                    \XVIds
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano\key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'4 ^\markup\smaller\center-align{H. C.} la'2  }
                    \set Staff.shortInstrumentName = "hc"
                    \clef violin
                    \set Staff.midiInstrument = #"violin"
                    \XVIhc
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef mezzosoprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi'4 ^\markup\smaller\center-align{Taille } mi'2 }
                    \set Staff.shortInstrumentName = "tl"
                    \clef alto
                    \set Staff.midiInstrument = #"viola"
                    \XVItl
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup  \center-column{"[Basse]"\vspace #-0.2"Bassons"}
                    \set Staff.shortInstrumentName = "bc"
                    \set Staff.midiInstrument = #"bassoon"
                    \XVIbc
                >>
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #4
    }

    \markup \huge  {"[17.] Air des matelots - Gay"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'2^\markup\smaller\center-align {"[Dessus]" }  mi''
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'2 ^\markup\smaller\center-align{[Haute-contre]} la' }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi'2^\markup\smaller\center-align{[Taille] }  mi' }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XVIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XVIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[18.] P[remi]er Rigaudon - Gay"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi''2^\markup\smaller\center-align {"[Dessus]" }  mi''
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit dod''2 ^\markup\smaller\center-align{[Haute-contre]} dod'' }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key la\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'2^\markup\smaller\center-align{[Taille] }  la' }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XVIIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XVIIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #5
    }

    \markup \huge  {[19.] 2\super e Rigaudon}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la''4^\markup\smaller\center-align {"Hautbois [I]" }  si''8
                }
                \set Staff.shortInstrumentName = "ob1"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XIXobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''4^\markup\smaller\center-align {"Hautbois [II]" }  re''8
                }
                \set Staff.shortInstrumentName = "ob2"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XIXobII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XIXfg
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #4
    }

    \markup \huge  {"[20.] Tambourin pour les matelots - Rondeau fort et vite"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'8^\markup\smaller\center-align {"Petites flûtes" }  [si']
                }
                \set Staff.shortInstrumentName = "fl"
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \XXfl
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do'8 ^\markup\smaller\center-align{Violons} [re'] }
                \set Staff.shortInstrumentName = "vl"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXhc
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XXfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"B[asse] de Violons"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    % \pageBreak

    \markup \huge  {"[21.] Prélude pour la tempête"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r2^\markup\smaller\center-align {"[Dessus]" } r16 mi'16 [fad' sold']
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r2 ^\markup\smaller\center-align{[Haute-contre]} mi'8[(mi')] }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key la\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r2^\markup\smaller\center-align{[Taille] } dod'8[(dod')] }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Bassons]"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XXIfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #5
    }

    \markup \huge \bold {"ACTE QUATRIÉME"}
    \markup \huge  {"[22.] Musette"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi''4^\markup\smaller\center-align {"Musette" }  mi''8
                }
                \set Staff.shortInstrumentName = "mus"
                \clef violin
                \set Staff.midiInstrument = #"harmonica"
                \XXIImus
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XXIIfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"B. C."}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXIIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #4
    }

    \markup \huge  {"[23.] Rigaudon"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi''4.^\markup\smaller\center-align {"[Dessus]" }  re''8
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''2 ^\markup\smaller\center-align{[Haute-contre]} do''4 }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'2^\markup\smaller\center-align{[Taille] }  sol'4 }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXIIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXIIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[24.] Pr[emi]er Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol''4^\markup\tiny\center-column {"Hautbois et Violons"\vspace #-0.6"alternativement" }  la''2
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XXIVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''4 ^\markup\smaller\center-align{[Haute-contre]} do''2 }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXIVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key la\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi'4^\markup\smaller\center-align{[Taille] } fa'2 }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXIVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"bassoon"
                \XXIVbc
            >>
        >>

        \layout {
            indent = 3\cm
            incipit-width = 3\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {[25.] 2\super e Menuet mineur}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sol\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mib''4^\markup\tiny\center-column {"Hautbois et Violons"\vspace #-0.6"alternativement" }  do''2
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XXVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''2 ^\markup\smaller\center-align{[Haute-contre]} do''4 }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'4^\markup\smaller\center-align{[Taille] } lab'2 }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"bassoon"
                \XXVbc
            >>
        >>

        \layout {
            indent = 3\cm
            incipit-width = 3\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {[26.] P\super er Passepied}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\minor \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol''8^\markup\tiny\center-column {"Hautb. et Viol."\vspace #-0.6"alternativ." }  mi''
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XXVIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\minor \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol'8 ^\markup\smaller\center-align{[Haute-contre]} sol' }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXVIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key la\minor \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi mi'8^\markup\smaller\center-align{[Taille] } mi' }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXVItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"bassoon"
                \XXVIbc
            >>
        >>

        \layout {
            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {[27.] 2\super e Passepied mineur}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sol\minor \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''8^\markup\tiny\center-column {"Hautbois et Violons"\vspace #-0.6"alternativement" }  mib''
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XXVIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\minor \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'8 ^\markup\smaller\center-align{[Haute-contre]} sol' }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXVIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\minor \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mib'8^\markup\smaller\center-align{[Taille] } sol' }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXVIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"bassoon"
                \XXVIIbc
            >>
        >>

        \layout {
            indent = 3\cm
            incipit-width = 3\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #5
    }

    \markup \huge \bold {"ACTE CINQUIÉME"}
    \markup \huge  {"[28.] Ritournelle"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4^\markup\smaller\center-align {"[Dessus]" }  sol''4 fad''4.
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXVIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r2^\markup\smaller\center-align {"[Haute-contre]" } r4  re''
                }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXVIIIhc
            >>


            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXVIIIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #4
    }

    \markup \huge  {"[29.] Prélude"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la''2~^\markup\smaller\center-align {"[Dessus]" }  la''8.
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXIXds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''2 ^\markup\smaller\center-align{H[aute]-contre} la'4. }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXIXhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key la\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'2.^\markup\smaller\center-align{Taille } fa'8. }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXIXtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"B. C."}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXIXbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {[30.] P\super er Air - Gay}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key si\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fad''4.~^\markup\smaller\center-align {"[Dessus]" }  fad''8
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXXds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key si\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1 ^\markup\smaller\center-align{[Haute-contre]} la'2 }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXXhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key si\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1^\markup\smaller\center-align{[Taille] } fad'4.  fad'8}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXXtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[B. C.]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXXbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {[31.] Passacaille}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''4^\markup\smaller\center-align {"[Dessus]" }  do''4.
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXXIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'4^\markup\smaller\center-align{[Haute-contre]} sol'4. }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXXIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'4^\markup\smaller\center-align{[Taille] } mi'4.-+}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXXItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[B. C.]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXXIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {[32.] Pr\super re Bourrée}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''8^\markup\center-align {"[Dessus]" }  [mi''] fa''4
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXXIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'4^\markup\smaller\center-align{[Haute-contre]} la' }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXXIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'8^\markup\smaller\center-align{[Taille] } [mi'] re'4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXXIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[B. C.]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXXIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {[33.] 2\super e Bourrée}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key re\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fad''8^\markup\center-align {Flûtes }  [sol''] la''4
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \XXXIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''8^\markup\smaller\center-align{Violons} [mi''] }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XXXIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key re\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4^\markup\smaller\center-align{[Taille] } }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XXXIIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[B. C.]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XXXIIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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


