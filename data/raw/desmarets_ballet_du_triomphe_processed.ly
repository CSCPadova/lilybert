\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

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

fort = _\markup\italic"fort"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

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

Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


Idsn = \relative do'' {

    r8 sol sib sol re'4. re8
    re4 sol, sol'4. sol8
    sol4. la8 fa4. fa8

    %4
    fa4. sol8 mib4. fa8\mbreak
    mib4. fa8 re4. re8
    re2 do4. do8

    %7
    do4~do16 sib la sib sib4. la8
    la2. la'4
    fa mi8 re16 mi mi4. re8

    %10
    dod4. re8 mi4. la,8\mbreak
    fa'2. fa4
    fa4. mi8  mi4. re8

    %13
    re1\fermopz re2.
    re4 re re
    fad,8 sol la sib do la\mbreak

    %16
    sib la sib sol mib'4
    re4. do8 si4
    do4. re8 sib?4

    %19
    la4. sol8 la sib
    do4. re8 mib fa
    re sol fa mib re4\mbreak

    %22
    do4. sib8 la4
    sol2 mib'4~
    mib do re

    %25
    re8 do sib re do4
    do8 sib la do sib4
    la2.\mbreak

    %28
    sol
    R
    sol'4 sol sol

    %31
    si,8 do re mi fa re
    mib4. re8 mib fa
    re2 r4\mbreak

    %34
    re re re
    fad,8 sol la sib do la
    sib4. la8 sib do

    %37
    re mib re do sib la
    sol2 sol'4
    fa8 mi? fa sol fad sol\mbreak

    %40
    la sib la sol fad mi
    re2 sib'8 la
    sol lab sol fa mib re

    %43
    do sib do re mib do
    re4 sib fa'
    re re4. mib8\mbreak

    %46
    do4 do re
    mib2.
    re4 re sib'

    %49
    la8 sib la sol fad sol
    la2 re,4
    sib8 la sib do re mi\mbreak

    %52
    fa4. mib8 re4
    re4. re8 do sib
    la sol la sib do la

    %55
    sib2 sol'8 fa
    mib fa mib re do sib
    la sib la4. sol8\mbreak

    %58
    sol4. la8 sib do
    re2 re4
    re4. re8 re4

    %61
    mib2 do4
    do4. do8 si4
    do2 mi4\mbreak

    %64
    mi4. mi8 mi4
    fad4. fad8 fad4
    sol4. la8 fad4

    %67
    sol2.

}

Ihcn = \relative do'' {

    sib4. sib8 sib4. sib8
    sol sol sib sol do4. do8
    la la do la re2~

    %4
    re8 re si re do2~\mbreak
    do8 do la do sib?4. sib8
    sib sol sib sol la4. la8

    %7
    re, re fad re sol4. sol8
    sol4 la fa?4. mi8
    re4 sib'~sib8 re do sib

    %10
    la2~la8 la sol la\mbreak
    fa4 re re'2~
    re4 re dod4. re8

    %13
    re1\fermopz re2.
    R2.*7
    re4 re re\mbreak

    %22
    fa,8 sol la sib do la
    sib4. la8 sib sol
    la4. sol8 la fa

    %25
    sol4. sol8 la sol
    fad4. fad8 sol4
    re re' fad,\mbreak

    %28
    sol8 fad sol la si do
    re4. do8 si la
    sol4 do8 sib? la sol

    %31
    fad4. mi8 re4
    sol8 fa? sol la sib sol
    la4 fad4. fad8\mbreak

    %34
    sol2 re'4
    do8 re do sib la do
    sib do re do re mi

    %37
    fa4. mib8 re4
    re sib mib
    la,8 sol la sib la sib\mbreak

    %40
    do4. sib8 la do
    fa,4 re'4. re8
    re4 do sib

    %43
    sib8 la sib do la4
    sib4. sib8 la sol
    fa mib fa sol fa sol\mbreak

    %46
    lab4. sol8 lab sib
    sol4 sol la?
    sib re re

    %49
    fad,8 mi fad sol la sib
    do4.  sib8 la4
    sol8 fad sol la si do\mbreak

    %52
    re4. do8 sib? la
    sol4 la4. sol8
    fa mi fa sol la4

    %55
    sol4. sol8 la si
    do re do sib la sol
    fad sol fad4. sol8\mbreak

    %58
    sol4. fad8 sol la
    sib2 sib4
    si4. si8 si4

    %61
    do4. sib?8 la sol
    fa4. mi8 fa4
    mi2 sol4\mbreak

    %64
    sol4. sol8 sol4
    la2 la4
    sib la2

    %67
    sol2.

}

Itln = \relative do' {

    re4. re8 sol,4 re'
    re2 do4 re8 mib
    re4 la' la4. sib8
    sol4. sol8 sol2\mbreak
    fa4. fa8 fa re fa re
    sol4. sol8 sol4 fad8 mi
    re2 re~
    re8 re fa re la'4. la8
    la2 sol4. sol8
    sol2. fa8 mi\mbreak
    re do re mi fa fa sol la
    sib4 sib la4. la8
    fad1\fermopz fad2.
    R2.*2
    sol4 sol sol
    si,8 do re mi fa re
    mib4 re sol~
    sol fad8 mi? fad sol
    la2 la4
    la re, sib'\mbreak
    la8 sol fad2
    sol4. fad8 sol4
    fa?4. mi8 fa re
    mib2 mib4
    re re re
    fad,8 sol la sib do la\mbreak
    sib la sib do re mi
    fa4. mi8 re4
    re8 do re mib do4
    re4. do8 si4
    do2.
    la'4 la la
    re,8 mi fa sol fa sol
    la4. sol8 fad4
    sol sol sol
    si,8 do re mi fa re
    mib4. re8 do4
    re2.\mbreak
    r4 la'4. la8
    la4 sol fa
    sol2 sol4
    fa2 fa4
    re2.
    r4 sib8 do re sib\mbreak
    fa'2 fa4
    mib re do
    re sol4. sol8
    la4 re,2
    r4 la' la
    re,2.\mbreak
    r4 fa fa
    sib, do2
    re4. re8 do4
    sib 8sol sib sol do re
    mib2 mib4
    re2.\mbreak
    si4. do8 re4
    re4. re8 sol4
    re4. re8 fa re
    sol4 do,4. do8
    re2.
    sol4 sol4. sol8\mbreak
    mi4 mi4. sol8
    do,4 do4. do8
    re4 re4. re8
    si2.

}

Ibcn = \relative do {

    sol'4. sol8 sol sol, sol' sol,
    mib'4. mib8 mib4 re8 do
    re2 r8 re' do re

    %4
    si4 sol do,8 do' sib? do\mbreak
    la4 fa sib,8 sib' la sib
    mi,?4. mi8 fad4. fad8

    %7
    sol2~sol8 sol, sib sol
    re'2~re8 re fa re
    sib'2~sib8 sib la sol

    %10
    la4. la8 dod,2\mbreak
    re8 la' sib do re do sib la
    sol la sib sol la4 la,

    %13
    re2\fermopz~re8 re fad re re2.
    R2.*5

    %19
    re'4 re re
    fad,8 sol la sib do la
    sib4. la8 sib sol\mbreak

    %22
    la4. sol8 la re,
    sol fa sol la sol do,
    fa mi fa sol fa sib,

    %25
    mib4. re8 mib do
    re2.~
    re\mbreak

    %28
    sol4 sol sol
    si,8 do re mi fa re
    mib2 mib4

    %31
    re2 sol4
    do, do' do
    fad,8 sol la sib do la\mbreak

    %34
    sib2 sib4
    la2 la4
    sol2 sol4

    %37
    fa2 fa4
    mib2 mib4
    re re re\mbreak

    %40
    fad,8 sol la sib do la
    sib la sib do re sib
    mib re mib fa? sol mib

    %43
    fa4 fa,2
    sib2.
    sib'4 sib sib\mbreak

    %46
    fa fa fa
    do8 sib do re mib do
    sol' fa sol la sib sol

    %49
    re'4 re re
    fad, re8 mi fad re
    sol4 sol sol\mbreak

    %52
    si,8 do re mi fa re
    mib4 do la
    re re fad,

    %55
    sol sol'8 fa? mib re
    do sib do re mib do
    re4 re,2\mbreak

    %58
    sol2.
    sol'4 sol4. sol8
    fa4 fa4. fa8

    %61
    mib4 mib4. mib8
    re4 re4. re8
    do4 do4. do8\mbreak

    %64
    sib4 sib4. sib8
    la4 la4. la8
    sol4 re' re,

    %67
    sol2.

}



Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    \key fa\major
    \repeat volta 2 {s1*12}
    \alternative {
        {s1}{ \time 3/4 \tempo 2. = 65 s2.}
    }\break
    \set Score.currentBarNumber = #14
    s2.*54
    \bar"|." \mark\markup\center-column\smaller {
        \parenthesize "D.C. al"\parenthesize \musicglyph "scripts.ufermata"
    }
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
    <<\Ibcn \forma\Ibfn>>
    \typeset

}

IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


IIdsn = \relative do'' {

    r8 sol'
    re4. do8 sib4. la8
    sib4 sol sol'4. la8
    fad2. r16 re mi fad

    %4
    sol4. fad8 sol4. la8
    sib2 fa4. fa8\mbreak
    fa4. sol8 mib4. fa8

    %7
    re2 do4. do8
    do4. re8 sib4. do8
    la2. r16 fa sol la

    %10
    sib4. do8 do4. re8
    re2. r8  sol re2. r8 la'\mbreak
    la4. sib8 sol4. la8

    %13
    fad4 re sol4. fa?8
    mib4. re8 do4. fa8
    re4 sib fa'4. sib,8

    %16
    la4 sib sib4. la8
    sib2 si4. si8\mbreak
    do2 re4. re8

    %19
    mib2 mi4. mi8
    fa4. sol8 fad4. sol8
    la4 re, sol4. re8

    %22
    do4 sib8 la la4. sol8
    sol2. r8 la' sol,1

}

IIhcn = \relative do'' {

    r8 re
    sib4. la8 sol2
    sol4 sib do2
    la2. la4

    %4
    sib4. la8 sib4. do8
    re2. do4\mbreak
    sib2 do4. do8

    %7
    sib2 la4. la8
    la4. sib8 sol4. la8
    fad4. sol8 la2

    %10
    sol4. la8 la4. sol8
    fad2. r8 re' fad,2. r8 re'
    mi2 mi4. fa8

    %13
    re2 re4. re8
    do2 do4. do8
    sib4 fa la4. sib8

    %16
    do4 fa, fa4. fa8
    fa2 sol4. sol8\mbreak
    sol2 sol4. sol8

    %19
    sol2. sol4
    do4. sib8 la4. sib8
    la4 sol sol4. sol8

    %22
    sol4. fad8 fad4. sol8
    sol2. r8 re' sol,1

}

IItln = \relative do' {

    r8 sib'
    sol2 re4. re8
    mib2 mib4. fa8
    re2. re4

    %4
    re1
    sol4. sib8 la4. la8\mbreak
    re,2 fa4. fa8

    %7
    fa2 fa4. fa8
    re2 re4. re8
    re2 do4 re

    %10
    re4. re8 do4. do8
    la2. r8 sib' la,2. r8 fad'\mbreak
    la2 la4. la8

    %13
    la2 sol4. sol8
    sol4 mib fa?4. fa8
    fa4 re re4. re8

    %16
    mib4 re do4. sib8
    sib4 re re4. re8\mbreak
    mib2 re4. re8

    %19
    do2. sol'4
    la re, re4. re8
    re4 re re2

    %22
    mib re4. re8
    re2. r8 fad re1

}

IIbcn = \relative do {

    r8 sol
    sol2 sol'4. fa8
    mib4. re8 do2
    re4 r16 la' sib do re4. do8

    %4
    sib4. do8 sib4. la8
    sol2 la\mbreak
    sib4 sib, la2

    %7
    sib fa'
    fad sol4 sol,
    re'4. mi8 fa4 re

    %10
    sol4. fa8 mib2
    re2. r8 sol, re'2. r8 re'\mbreak
    dod1

    %13
    re4. do?8 si4 sol
    do4. sib?8 la4 fa
    sib2 re,4. re8

    %16
    do4 sib fa' fa,
    sib sib'8 la sol4. fa8\mbreak
    mib4. re16 do si2

    %19
    do do'4. sib8
    la4. sol8 re'4. sol,8
    fad4 sol si,2

    %22
    do re4 re,
    sol2. r8 re'' sol,,1



}



IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \tempo 2 = 65
    \key fa\major
    \partial 4 s4
    \repeat volta 2{s1*10}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #12
    \repeat volta 2 {s1*11}
    \alternative {{s1}{s}}
    \bar"|."

}


IIds = {
    \IIglobal
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
    <<\IIbcn \forma\IIbfn>>
    \typeset

}

IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


IIIdsn = \relative do'' {

    sol8
    sol la sib do re mi fa re
    sol4. la8 la4. sol8
    fad4. sol16 la re,4. re8

    %4
    mib4 re8 do re sib do la
    sib4 sol sol'4. re8\mbreak
    mib4 do fa4. do8

    %7
    re4 sib sib'4. la8
    sol4 la8 sol la mi fa re
    dod2 la'4. sol8

    %10
    fa4. mi8 mi4. re8
    re2. r8 sol, re'2. r8 la'\mbreak
    la4 do8 sib la sol la mi

    %13
    fad2. r8 fad
    sol4. sol8 la4. sol16 la
    sib4 sib8 la sol fa? mib re

    %16
    mib4 fa8 sol do,4. sib8
    la4 fa sib4. sib8\mbreak
    do4 re do4. sib8

    %19
    sib2 r8 sib do re
    do2 r8 do re mib
    re2 r8 do re mi?

    %22
    fa4. sol8 fad4. sol8
    la4 re, sib'4. la8\mbreak
    sol fad sol la la4. sol8

    %25
    sol2. r8 la8 sol1

}

IIIhcn = \relative do'' {

    re,8
    re4 sol fa4. sib8
    sib4. do8 do4. do8
    la2 sol4. sol8

    %4
    sol2 la
    sol sol4. sol8\mbreak
    sol2 la4. la8

    %7
    fa4 fa sol4. sol8
    do4 sib la2
    la4. sib8 do2

    %10
    re4. do8 dod4. re8
    re2. r8 re,8 re'2. r8 re\mbreak
    re2. re4

    %13
    re2. do4
    sib4. sib8 la2
    sol2. sol4

    %16
    sol fa fa4. fa8
    fa4 fa fa4. fa8\mbreak
    sol4 sib la4. sib8

    %19
    sib2 r8 sol sol fa
    sol2 r8 la sib do
    sib2 r8 sib sib sib

    %22
    do4. do8 do4. do8
    la2 sol4. la8\mbreak
    sib8 la sib do fad,4. sol8

    %25
    sol2. r8 re' sol,1

}

IIItln = \relative do' {

    sib8
    sib do re4 re re
    mib4. mib8 mib4. mib8
    re2 re4. re8

    %4
    do4 re8 mib re2
    re re4. re8\mbreak
    do2 do4. do8

    %7
    sib4 re re4. re8
    mi4 fa mi re
    mi4. mi8 fa4. sol8

    %10
    la4 sib la4. sol8
    fad2. r8 sib, fa'2. r8 fad\mbreak
    fad2. fad4

    %13
    la2. la4
    re,4. re8 re2
    re2. re4

    %16
    do8 sib la sol la4. sib8
    do4 la re4. re8\mbreak
    mib4 fa fa4. fa8

    %19
    re2 r8 re mib re
    mib2 r8 mib re do
    re2 r8 mi? fa sol

    %22
    la4 la la4. la8
    re,2 re4. re8\mbreak
    mib4 mib re4. re8

    %25
    si2. r8 fad' si,1

}

IIIbcn = \relative do {

    sol'8
    sol4 sol,8 la sib do re sib
    mib fa mib re do re mib do
    re4 re'8 do si la si sol

    %4
    do2 fad,
    sol si,\mbreak
    do la

    %7
    sib?4 sib8 la sol4 sol'8 fa
    mi4 re dod re
    la'4. sol8 fa4. mi8

    %10
    re4 sol, la2
    re4. mi8 fad re mi fad re2. r8 re\mbreak
    re2. r8 re'

    %13
    re4 mib8 re do sib do la
    sib2 fad
    sol si,

    %16
    do4 re8 mib fa?2
    fa4 fa8 mib re4. re8\mbreak
    do4 sib fa' fa,

    %19
    sib8 fa' sol la sib4. sib8
    sib2 la
    sib2. sib4

    %22
    la4. sib8 la4. sol8
    fad2 sol4. fad8\mbreak
    mib4 do re re,

    %25
    sol2. r8 re' sol,1

}



IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \tempo 1 = 55
    \key fa\major
    \partial 8 s8
    \repeat volta 2{s1*10}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #12
    \repeat volta 2 {s1*13}
    \alternative {{s1}{s}}
    \bar"|."

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
    \typeset

}

IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


IVdsn = \relative do'' {

    sol8 la
    sib4 do re sol
    fad re2 sol8 fad
    mib4 re do re

    %4
    sib la2 sol8 la
    sib4 do re sol\mbreak
    fad re2 sol8 fad

    %7
    mib re do sib la4. sol8
    sol2. sol8 la sol2. sol'8 la
    sib4. fa8 fa4 sol8 mi

    %10
    fa2. do8 re
    mib4. mib8 fa4 sol\mbreak
    si,4 si2 sol'8 re

    %13
    mib4. re8 re4. do8
    do2. fa8 mi
    re do sib la sol4. la8

    %16
    fad4 fad2 re'8 mib
    do4. sib8 sib4. la8\mbreak
    la2. sol8 la

    %19
    sib4 do re sol
    fad re2 sol8 fad
    mib4 re do re

    %22
    sib la2 sol8 la
    sib4 do re sol\mbreak
    fad re2 sol8 fad

    %25
    mib re do sib la4. sol8
    sol2. do8 sib
    la4. la8 la4. si8

    %28
    do4 do r8 do sib la
    sol4. sol8 sol4. la8\mbreak
    sib4 do re mib

    %31
    fa mib8 re do4. sib8
    sib2. r16 fa' sol la
    sib4. la8 sol4. fad8

    %34
    sol4 re2 la'8 sol
    fa4. mi8 fa4 re\mbreak
    dod la re mi

    %37
    fa sol8 mi mi4. re8
    re2. sol,8 la
    sib4 do re sol

    %40
    fad re2 sol8 fad
    mib4 re do re
    sib la2 sol8 la

    %43
    sib4 do re sol\mbreak
    fad re2 sol8 fad
    mib re do sib la4. sol8

    %46
    sol1

}

IVhcn = \relative do'' {

    sib8 fad
    sol2 fa?4 sib
    la fad2 re'4
    do sib la sib

    %4
    sol fad2 sib8 fad
    sol2 fa?4 sib\mbreak
    la fad2 re'4

    %7
    do8 sib la sol fad4. sol8
    sol2. sib8 fad sol2. re'8 re
    re4 re do4. do8

    %10
    do4 la8 sib do2
    sib4 do re sol,\mbreak
    sol sol2 sol4

    %13
    sol8 la sib do si4. do8
    do4 sol la2
    fa4 sol sol8 fa mib4

    %16
    re re2 re8 re
    mi4 la sol4. la8\mbreak
    fad2. sib8 fad

    %19
    sol2 fa?4 sib
    la fad2 re'4
    do sib la sib

    %22
    sol fad2 sib8 fad
    sol2 fa?4 sib\mbreak
    la fad2 re'4

    %25
    do8 sib la sol fad4. sol8
    sol2. sol4
    fa2 fa4. fa8

    %28
    mi1~
    mi4. mi8 mi4. fa8\mbreak
    sol1

    %31
    re'4 do8 sib la4. sib8
    sib4 r16 la sib do re4. re8
    re2 re4. re8

    %34
    re4 do2 la4
    la4. sol8 la2\mbreak
    la la4 dod

    %37
    re4. dod?8 dod!4. re8
    re2. sib8 fad
    sol2 fa?4 sib

    %40
    la fad2 re'4
    do sib la sib
    sol fad2 sib8 fad

    %43
    sol2 fa?4 sib\mbreak
    la fad2 re'4
    do8 sib la sol fad4. sol8

    %46
    sol1

}

IVtln = \relative do' {

    re8 re
    re2. re4
    re la'2 sol4

    %3
    sol2 la4 re,
    re re2 re8 re
    re2. re4\mbreak

    %6
    re4 la'2 sol4
    sol mib re4. re8
    si2. re8 re si2. sib'!8 la

    %9
    sol4 la2 sol4
    la fa2 mib8 fa
    sol4 sol fa mib\mbreak

    %12
    re4 re2 re4
    do do sol'2
    mi?2. do4

    %15
    sib sib sib4. do8
    la4 la2 sib8 la
    sol4 re' re4. re8\mbreak

    %18
    re2. re8 re
    re2. re4
    re la'2 sol4

    %21
    sol2 la4 re,
    re re2 re8 re
    re2. re4\mbreak

    %24
    re4 la'2 sol4
    sol mib re4. re8
    si?2. mi8 re

    %27
    do4. do8 re2
    sol, r8 sol la sib
    do2. do4\mbreak

    %30
    re2. do4
    sib4. sib8 fa'4. fa8
    re2. r16 re mi fa

    %33
    sol4. sol8 sol2
    sol4 sol2 mi4
    fa re2 fa4\mbreak

    %36
    mi mi fa sol
    la sib la2
    fad2. re8 re

    %39
    re2. re4
    re la'2 sol4
    sol2 la4 re,

    %42
    re re2 re8 re
    re2. re4\mbreak
    re4 la'2 sol4

    %45
    sol mib re4. re8
    si1

}

IVbcn = \relative do {

    sol'8 re
    sol4 la sib sol
    re' re2 si4
    do2 fad,

    %4
    sol4 re2 sol,8 re
    sol4 la sib sol\mbreak
    re'4 re2 si4

    %7
    do2 re4 re,
    sol2. sol'8 re sol,2. sol'8 fad
    sol4 re'8 sib? do4 do,

    %10
    fa fa8 sol lab2
    sol4 mib re do\mbreak
    sol' sol2 si,4

    %13
    do fa, sol2
    do4 do'8 sib la2
    sib8 la sol fa mib4 do

    %16
    re re2 sol8 fa
    mi4 fad sol sol,\mbreak
    re'2. sol8 re

    %19
    sol4 la sib sol
    re' re2 si4
    do2 fad,

    %22
    sol4 re2 sol,8 re
    sol4 la sib sol\mbreak
    re'4 re2 si4

    %25
    do2 re4 re,
    sol sol'8 fa mi4 mi
    fa fa8 mib re2

    %28
    do1~
    do2 r8 do sib la\mbreak
    sol4 la sib do

    %31
    re mib fa fa,
    sib r16 fa' sol la sib4. la8
    sol4. la8 si2

    %34
    si4 do2 dod4
    re2 re,\mbreak
    la'4 la8 sol fa4 mi

    %37
    re sol, la2
    re2. sol8 re
    sol4 la sib sol

    %40
    re' re2 si4
    do2 fad,
    sol4 re2 sol,8 re

    %43
    sol4 la sib sol\mbreak
    re'4 re2 si4
    do2 re4 re,

    %46
    sol1

}



IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \tempo 1 = 50
    \key fa\major
    \partial 4 s4
    \repeat volta 2{s1*7}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #9
    s1*38
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
    <<\IVbcn \forma\IVbfn>>
    \typeset

}

Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


Vdsn = \relative do'' {

    sol'8 fad
    sol4 mib8 re mib4 re8 do
    re4. sib8 do4 re
    sib4. la8 sib4. do8

    %4
    re4 sol,2 sol'8 fad
    sol4 mib8 re mib4 re8 do
    re4. sib8 do4 re

    %7
    mib4. re8 do4. re8
    re2. sol8 fad re2. sib'8 la
    sib4 la8 sol fa4 mib8 re

    %10
    mib4. fa8 sol fa mib re
    do4 re8 mib do4. sib8\mbreak
    sib2. sib'8 la

    %13
    sib4 la8 sol fa4 mib8 re
    mib4.  re8 do sib la sol
    fad4 sol8 la sib4 do

    %16
    la sol2 sib'8 la la,4 sol2.

}

Vhcn = \relative do'' {

    re8 re
    re2 do
    sib la
    sol2. sol4

    %4
    fa mib re2
    re' do\mbreak
    sib la

    %7
    sol4. fad8 sol4. la8
    fad2. re'8 re fad,2. re'8 re
    re4 do re2

    %10
    do4. do8 sib4 do8 sib
    la4 sib8 do la4. sib8\mbreak
    sib2. re8 re

    %13
    re4 do re sol,
    sol2 do,8 re mib4
    re mi?8 fa sol4 la

    %16
    fad sol2 re'8 re fad,4 sol2.

}

Vtln = \relative do' {

    sib'8 la
    sib2 la
    sol re
    re4. re8 mib2

    %4
    la,4 do sol4. la8
    sib4 sib' la2\mbreak
    sol4 sol, la sib

    %7
    do2 do4. do8
    la2. sib'8 la la,2. sol'8 la
    sol2. sol4

    %10
    sol4. sol8 sol4 sol
    fa2 fa4. fa8\mbreak
    re2. sol8 la

    %13
    sol2 sol4. fa8
    mib re do2 sol4
    la re re mib

    %16
    re si2 sol'8 la re,4 si2

}

Vbcn = \relative do {

    sol'8 re
    sol2 la
    sib fad
    sol4. fa?8 mib2

    %4
    re4 do sib4.  la8
    sol4 sol' la2\mbreak
    sib8 la sol fa mib4 re

    %7
    do re mib2
    re2. sol8 re re2. sol8 fad
    sol4 la si2

    %10
    do4 do,8 re mib4 do
    fa sib, fa2\mbreak
    sib4 sib'8 la sol4. fad8

    %13
    sol4 la si2
    do4 do,8 re mib4 do
    re8 do sib la sol4 do,

    %16
    re sol2 sol'8 fad re,4 sol2.

}



Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \tempo 1 = 60
    \key fa\major
    \partial 4 s4
    \repeat volta 2{s1*7}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #9
    \repeat volta 2 {s1*7}
    \alternative {{s1}{s}}
    \bar"|."

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
    <<\Vbcn \forma\Vbfn>>
    \typeset

}

VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


VIdsn = \relative do'' {

    sol4 sol re' re
    mi4. fad8 sol4 re
    sol sol8 fad mi4 re

    %4
    dod8 re mi dod re2
    la4 la la  si
    do si8 la si4. si8

    %7
    dod? si la sol fad4 re'
    la do si la
    la la la si

    %10
    do si8 la si4. si'8
    la sol fad mi re4 sol
    sol fad sol2

}

VIhcn = \relative do'' {

    si4 si si8 do re4
    do do si si
    si si la la8 si

    %4
    la4 la la2
    re4 re mi re
    do re si si\mbreak

    %7
    dod? mi re re
    re re re re
    re re mi re

    %10
    do re si2
    mi4 re re si8 dod?
    re4. do?8 si2

}

VItln = \relative do' {

    sol'4 sol fad8 sol la4
    mi mi mi2
    re4 re mi mi

    %4
    mi mi re2
    fad4 fad mi fad8 sol
    la4 sol sol sol\mbreak

    %7
    la8 sol fad mi re4 fad8 sol
    la4 fad sol fad
    fad fad mi fad8 sol

    %10
    la4 fad sol sol8 fad
    mi4 re re dod
    re2 re

}

VIbcn = \relative do {

    sol'8 fad mi4 re8 do si4
    do la mi'8 fad sol la
    si4 si dod re8 sol,

    %4
    la4 la, re2
    re'4 re do? si
    la re sol,8 fad mi re\mbreak

    %7
    dod4 dod re re8 mi
    fad4 re sol re
    re re do? si

    %10
    la re sol8 fad mi re
    dod4 re8 dod si4 mi
    re2 sol,

}



VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \tempo 1 = 50
    \key sol\major
    s1*4%\break
    \bar":..:"
    s1*8
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
    <<\VIbcn \forma\VIbfn>>
    \typeset

}

VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


VIIdsn = \relative do'' {

    sol'2 sol
    sol sol,4. la8
    sib4. la8 sib4. do8

    %4
    la2 sol
    re' re
    re sib4. do8

    %7
    re4. sib8 re4. mib8\mbreak
    fa1
    sib2 sib

    %10
    sib la4. sol8
    fa4. sol8 mi4. fa8
    dod2 la

    %13
    la' la
    la sol4. fa8\mbreak
    mi4. mi8 fa4. sol8

    %16
    fad2 re fad1
    re2 re
    si2. r8 si

    %19
    do4. re8 mib4. fa8
    re2 do
    fa fa\mbreak

    %22
    sol2. r8 fa
    mib4. re8 do4. sib8
    sib1

    %25
    sib'2 sib
    sol2. r8 fad
    sol4. la8 fad4. sol8\mbreak

    %28
    la2 re,
    mib mib
    do2. r8 sib

    %31
    la4. sib8 sol4. la8
    fa2 re'4. la8
    la2. r8 sol

    %34
    sol1

}

VIIhcn = \relative do'' {

    sib2 sib
    do4. la8 sib4 fa
    sol4. la8 sol4. sol8
    sol4 fad sol4. la8

    %5
    sib4. la8 sib4. do8
    sib4. do8 re4 re,
    sol8 la sib4 la sib8 do\mbreak

    %8
    sib4 la sib fa
    sol4. la8 sib4. do8
    re4 do8 sib do2

    %11
    do sib
    la4. mi8 fa4. sol8
    fa4. sol8 la4. sib8

    %14
    do4. do8 do4. re8\mbreak
    dod2 re
    re1 re

    %17
    la2. re4
    re2. re4
    sol,4. sol8 do4. do8

    %20
    sib2 la4 la
    la2 la4. sib8\mbreak
    sib2 do4. re8

    %23
    sol,4. sib8 la2
    fa4 sib8 do re2
    re2. re4

    %26
    sib2 do4. re8
    sib4. do8  la4 la8 re\mbreak
    re4. do8 si2

    %29
    do4. sol8 do4. sib8
    la2 sol
    do4. re8 sib4. do8

    %32
    la4. la8 sib4. la16 sol
    fad2. r8 sol8
    sol1

}

VIItln = \relative do' {

    re4. do8 re4. re8
    mi4. fa8 re2
    re re4. mib8

    %4
    re2 re
    sol sol
    sol4. fa8 sol4. la8

    %7
    sib4. re,8 fa4. do8\mbreak
    re4. mib8 re4. do8
    re4. re8 sol4. la8

    %10
    sib4 sol fa mib
    re2 sol
    mi?4. sol8 do,2

    %13
    do4. do8 fa4. sol8
    fa4 do8 re mi4 la\mbreak
    la1

    %16
    la la
    fad4. sol8 la2
    sol4. sol8 sol4 re

    %19
    mib4. fa8 sol4. la8
    fa2 fa4 do
    re4. mib8 re4. fa8\mbreak

    %22
    mib4. re8 do4. si8
    do4. fa8 fa2
    re4. mi8 fa4 re

    %25
    sol re fa2~
    fa mib4. fad?8
    mib2 re4 sib'\mbreak

    %28
    la2 sol~
    sol sol
    fa4 do8 re mi fa sol4~

    %31
    sol fa2 mib4
    re1
    re

    %34
    re

}

VIIbcn = \relative do {

    sol'4. la8 sib4. sol8
    do4. do8 sib4. la8
    sol4. fad8 sol4. do,8

    %4
    re2 sol,
    sol'4. fa8 sol4. la8
    sib2 sib4. la8

    %7
    sol4. sol8 fa4. mib8\mbreak
    re4. do8 sib4. la8
    sol2 sol'

    %10
    sol la
    sib sol
    la4. sol8 fa4. mi8

    %13
    fa2 fa
    fa mi4. re8\mbreak
    la'2 la,

    %16
    re4. mi8 fad4 re re1
    re4. mi8 fad2
    sol2. sol8 fa?

    %19
    mib4. re8 do4. la8
    sib2 fa'
    re4. do8 re4. sib8\mbreak

    %22
    mib4. fa8 mib4. re8
    do4. sib8 fa'2
    sib, sib'

    %25
    sol re
    mib2. r8 re
    mib4. do8 re4. mib8

    %28
    fad2 sol
    do, do
    fa? mi

    %31
    fa4. re8 mib4. do8
    re4. do8 sib4. do8
    re2 re,

    %34
    sol1

}



VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 60
    \key fa\major
    \repeat volta 2{s1*15}
    \alternative {{s1}{s}}%\break
    \bar ":..:"
    \set Score.currentBarNumber = #17
    \repeat volta 2 {s1*18}
    \bar":|."

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
    <<\VIIbcn \forma\VIIbfn>>
    \typeset

}

VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


VIIIdsn = \relative do'' {

    r8 sol'
    sol4. la8 fad4. la8
    sol2 re4. mib8
    fa?4. do8 re4. mib8

    %4
    do2 sib4. sib8
    la4. do8 sib4. sol8\mbreak
    mib'2 re4. mib8

    %7
    do4. la8 sib4. do8
    re2. r8 sol re2. r8 la'
    la4. sib8 sol4. mi8

    %10
    fa2. r8 fa
    sol4. la8 sib4. do8\mbreak
    la2 sib4. fa8

    %13
    mib4. fa8 sol4. la8
    fad2. r8 re
    sol2. r8 re

    %16
    mib2. r8 do
    re4. la8 sib4. do8\mbreak
    fad,4. fad8 sol4. la8

    %19
    la2. r8 sol
    sol2. r8 la' sol,1

}

VIIIhcn = \relative do'' {

    r8 re
    re2 re
    re4. do8 sib2
    do sib4. do8

    %4
    la2 sol
    fad sol\mbreak
    sol sol

    %7
    la2 sol4. la8
    fad2. r8 re' fad,2. r8 re'
    mi1

    %10
    re
    re2 re4 mib\mbreak
    do2 re4. re8

    %13
    do4. sib8 sib4. do8
    la2~la4. la8
    sol2~sol4. si8

    %16
    do2~do4. do8
    sib4. re,8 re4. re8\mbreak
    re4. re8 re4 sol

    %19
    fad2~fad4. sol8
    sol2. r8 re' sol,1

}

VIIItln = \relative do' {

    r8 sib'
    sib2 la
    sib fa
    la fa

    %4
    fa re
    re re\mbreak
    do sib

    %7
    la4. do8 sib4. sol8
    la2. r8 sib' la,2. r8 fa'
    la1

    %10
    la
    sib4. fa8 sol4. sol8\mbreak
    fa2 fa4. sib8

    %13
    sol2 mib4. mib8
    re2~re4. re8
    re2~re4. sol8

    %16
    sol2 la4. la8
    fa4. la8 sol4 sol,\mbreak
    la4. la8 sib4. re8

    %19
    re1
    si2. r8 fa' si,1

}

VIIIbcn = \relative do {

    r8 sol'
    sol2 re
    sol4. la8 sib2
    la sib4 sib,

    %4
    fa'2 sol
    re sol\mbreak
    do, sol'

    %7
    fad sol4 mib
    re2. r8 sol re2. r8 re'
    dod1

    %10
    re4. mib8 re4. do?8
    sib4. la8 sol4. mib8\mbreak
    fa2 sib,4. sib8

    %13
    do4. re8 mib4. do8
    re4. la'8 re4. re8
    si4. sol8 si4. sol8

    %16
    do4. do8 la4. fa8
    sib4. fad8 sol4. sol,8\mbreak
    re'4. do8 sib4 sol

    %19
    re'2 re,
    sol2. r8 re'' sol,,1

}



VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 60
    \key fa\major
    \partial 4 s4
    \repeat volta 2{s1*7}
    \alternative {{s1}{s}}%\break
    \set Score.currentBarNumber = #9
    \repeat volta 2 {s1*11}
    \alternative {{s1}{s}}
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
    <<\VIIIbcn \forma\VIIIbfn>>
    \typeset

}

IXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


IXdsn = \relative do'' {

    r8 sol'
    fa4. re8 mib4. do8
    re2. r8 sib
    do4. re8 la4. do8

    %4
    sib4 sol2 r8 sol'
    fa4. re8 mib4. do8\mbreak
    re2. r8 sol

    %7
    la4. sib8 re,4. sol8
    fad2. r8 sol fad2. r8 la
    la4. fa8 sol4. mi8

    %10
    fa2. r8 re
    mib4. fa8 re4. mib8\mbreak
    do2 sib4. sib'8

    %13
    la4. sol8 fad4. sol8
    la2. r8 sib
    do4. fad,8 sol4. la8

    %16
    la2 sol4. la8 la2 sol

}

IXhcn = \relative do'' {

    r8 sib
    la4. sib8 sol4. la8
    sib2 sib4 fa
    sol2 la

    %4
    sib do
    re4. sib8 do4. la8\mbreak
    sib2. r8 sib

    %7
    la4. sol8 sol4. sol8
    la2. r8 sib la2. r8 la
    la4. la8 sib4 sol

    %10
    la2 la8 sib do re
    do4. re8 sib4. do8\mbreak
    la2 sib4. sol8

    %13
    la4. la8 la4. sol8
    fad2. r8 sol
    la4. la8 sib4 do8 re

    %16
    re2 si4. la8 re2 si

}

IXtln = \relative do' {

    r8 re
    re4. re8  do4. do8
    re2. r8 re
    do4. sib8 la4 re

    %4
    re4. re8 mib2
    fa4. sol8 sol4. fa8\mbreak
    fa2 re

    %7
    re re4. re8
    re2. r8 re re2. r8 re
    fa4 sol mi4. sol8

    %10
    fa2. r8 fa
    mib4 sol fa4. sol8\mbreak
    fa2 fa

    %13
    mi fa
    fad?4. fad8 mi4. re8
    do4. sib8 re4 sol

    %16
    sol fad sol4. re8 sol4 fad sol2

}

IXbcn = \relative do {

    r8 sol
    re'4. sol8 do,4. fa8
    sib,2 sib'4. sib8
    mi,2 fad

    %4
    sol4. fa?8 mib2
    re4. sol8 do,4. fa8\mbreak
    sib,2 sib'

    %7
    fad sol4 sol,
    re'2. r8 sol, re'2. r8 re
    re4. re8 sib4. do8

    %10
    fa,2 fa'8 sol la sib
    do4. la8 sib4. mib,8\mbreak
    fa4.mib8 re2

    %13
    dod re
    re'4. re8 do4. sib8
    la4. re8 sib4. sol8

    %16
    re2 sol,4. re'8 re2 sol,

}



IXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \tempo 1 = 60
    \key fa\major
    \partial 4 s4
    \repeat volta 2{s1*7}
    \alternative {{s1}{s}}%\break
    \set Score.currentBarNumber = #9
    \repeat volta 2 {s1*7}
    \alternative {{s1}{s}}
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
    <<\IXbcn \forma\IXbfn>>
    \typeset

}

Xglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


Xdsn = \relative do'' {

    sol8 la sib do
    re4 sol, sol' re
    mib re sol re
    mib re sol8 fad sol la

    %4
    fad4 sol sol,8 la sib do fad1
    sol4. la8 sib4\mbreak
    fa?4 sol2

    %7
    fa2.~
    fa2 sib4
    re,4. mib8 fa4
    mib re2

    %11
    do re4\mbreak
    mib re2
    do4. sib8 la4

    %14
    sib sib4. la8
    la2.~
    la2 la4

    %17
    sib4. do8 re4\mbreak
    mib do2
    re2.

    %20
    sol
    re4. do8 sib4
    la sib sol

    %23
    fad2 sol4\mbreak
    la sib2
    fad sol8 la

    %26
    la2.
    sol

}

Xhcn = \relative do'' {

    re,4 re
    la' sib re4. re8
    do4 sib sol2
    sol4 sib sib do

    %4
    la sol re re \parenthesize la'1
    sib4. do8 re4\mbreak
    re sib2

    %7
    la2.~
    la2 sol4
    fa4. sol8 la4
    re, sib'2

    %11
    la sib4\mbreak
    do re2
    la4. la8 re4

    %14
    re, sol2
    fad2.~
    fad2 fad4

    %17
    sol4. la8 sib4\mbreak
    do la2
    sib2.

    %20
    sib
    sib
    do4 re do

    %23
    re2 re4\mbreak
    re2 sib4
    la2 sol4

    %26
    fad2.
    sol

}

Xtln = \relative do' {

    sib8 do re mib
    re2 sol4 sol
    sol2 re
    do4 re mib mib

    %4
    re si sib?8 do re mib re1
    re4. re8 sol4\mbreak
    la sol re

    %7
    re2.~
    re2 sib'4
    sib fa fa

    %10
    fa fa2
    fa fa4\mbreak
    fa fa2

    %13
    fa4. sol8 la4
    sol re2
    re2.~

    %16
    re2 re4
    re2 sol4\mbreak
    sol fa2

    %19
    fa re4
    re2.
    sol4. sol8 re mi

    %22
    fa2 sol4
    la2 sib4\mbreak
    la sol2

    %25
    la4 re, sib
    re re2
    si2.

}

Xbcn = \relative do {

    sol'2
    fad4 sol si,2
    do4 sol' si,2
    do4 sol mib' do

    %4
    re sol, sol'2 re1
    sol2.\mbreak
    re4 sol,2

    %7
    re'2.~
    re2 sol8 la
    sib2 la4

    %10
    la sib2
    fa sib,4\mbreak
    la sib2

    %13
    fa' fad4
    sol sol,2
    re'2.\parenthesize ~

    %16
    re2 re'4
    sol,2.\mbreak
    mib4 fa fa,

    %19
    sib2 sib'8 la
    sol2.
    sol

    %22
    fa2 mib4
    re2 sol,4\mbreak
    fad2 sol4

    %25
    re'2 mib4
    re re,2
    sol2.

}



Xbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 4/4
    \tempo 2 = 80
    \key fa\major
    \partial 2 s2
    \repeat volta 2{s1*3}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #5
    \bar ".|:"
    \tempo 2. = 90 \time 3/4 \override Staff.TimeSignature.style = #'single-digit
    s2.*23
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
    <<\Xbcn \forma\Xbfn>>
    \typeset

}

XIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XIdsn = \relative do'' {

    sol'16 fad8
    sol8. sib16 la8
    sib8. la16 sol8
    la4.

    %4
    re,8. re16 mi8
    fa8. mi16 re8\mbreak
    sol8. la16 fa8

    %7
    sol8. sol16 fad8 sol8. re16 mi8
    fa8. sol16 fa8
    mib8. re16 do8

    %10
    re4.
    sib8. mib16 re8\mbreak
    do8. re16 do8

    %13
    sib8. do16 sib8
    la4.~
    la8. re8 mi16

    %16
    fa8. sol16 fa8
    mib8. re16 do8\mbreak
    re4.

    %19
    sib8. mib16 re8
    do8. re16 sib8
    la8. sol16 fad8

    %22
    sol8. re'16 mi8 sol,4.

}

XIhcn = \relative do'' {

    sib16 la8
    sib8. re16 re8
    re8. sib16 sol8
    fad4.

    %4
    sib8. sib16 sib8
    la8. la16 re8\mbreak
    sib8. do16 la8

    %7
    sol8. sib16 la8 sol8. sol16 la8
    re8. mib16 re8
    do8. sib16 la8

    %10
    sib8. sib16 do8
    re8. do16 sib8\mbreak
    la4 la8

    %13
    sib8. la16 sol8
    fad4.~
    fad8. fad16 sol8

    %16
    re'8. mib16 re8
    do8. sib16 la8\mbreak
    sib4.

    %19
    sib8. sib16 fa8
    la8. la16 sib8
    fa8. sol16 la8

    %22
    sol8. sol16 la8 sol4.

}

XItln = \relative do' {

    sol'16 re8
    sol8. sol16 fad8
    sol8. re16 re8

    %3
    re4.
    re8. fa16 mi8
    re8. mi16 fa8\mbreak

    %6
    mib8. mib16 re8
    re8. sol16 re8 re8. sol16 sol8
    la8. la16 sib8

    %9
    sol8. sol16 fa8
    fa8. fa16 fa8
    sol4 sol8\mbreak

    %12
    la4 la8
    sol re8. re16
    re4.~

    %15
    re8. re16 re8
    re4 re8
    mi4 fa8\mbreak

    %18
    fa4.
    fa4 fa8
    fad4 sol8

    %21
    re4 re8
    re8. sol16 sol8 re4.

}

XIbcn = \relative do {

    r16 r8
    r r16 sol' re8
    sol8. sol16 sol,8
    re'4.

    %4
    sib8. sib16 do8
    re4.\mbreak
    mib8. do16 re8

    %7
    sol,8. r16 r8 sol8. sol'16 sol8
    re4 re8 mib8. mib16 fa8
    sib,8. sib'16 la8

    %10
    sol4 sol8\mbreak
    fad4.
    sol4 sol,8

    %13
    re'4.~
    re8. re16 do8
    si4.

    %16
    do4 fa8\mbreak
    sib,?4.
    sib4 sib8

    %19
    la4 sol8
    re'4 re,8

    %22
    sol8. sol'16 sol8sol,4.

}



XIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 60
    \key fa\major
    \partial 8. s8.
    \repeat volta 2{s4.*6}
    \alternative {{s4.}{s}}%\break
    \set Score.currentBarNumber = #8
    \bar ".|:"
    \repeat volta 2 {s4.*14}
    \alternative {{s4.}{s}}
    \bar"|."

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
    <<\XIbcn \forma\XIbfn>>

}

XIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XIIdsn = \relative do'' {

    r8 sol
    re'4. do8 sib4. la8
    sib2 sol4. re'8
    sol4. la8 la4. sol8

    %4
    fad2 sol4. sib8
    la4. sol8 fa?4. mib?8\mbreak
    fa2 re4. re8

    %7
    mib4. re8 do4. sib8
    la2 fa'4. sol8
    la4. re,8 re4. mi8

    %10
    dod2 re4. mi8
    fa4. mi8 mi4. re8\mbreak
    re2. r8 sol, re'2. r8 la

    %13
    la4. la8 si4. si8
    do4. sib?8 do re mib fa
    re4 sol do,4. sib8

    %16
    la4 fa do'4. do8
    do4. re8 do4. sib8\mbreak
    sib2. r8 fa'

    %19
    fa4 fa fad4. fad8
    sol2 la4. re,8
    mib4. re8 do sib la sol

    %22
    fad2 re'4. do8
    sib4. la8 la4. sol8
    sol2. r8 la sol1

}

XIIhcn = \relative do'' {

    r8 sol
    sol2 sol4. fad8
    sol2 sib4. sib8
    sib2 do

    %4
    la4. re8 re4. re8
    re2 mib4. mib8\mbreak
    re4 re re4. re8

    %7
    do4. sib8 la4. sol8
    fad2 la4. la8
    la2 sib

    %10
    la la4. la8
    la4 sib la2\mbreak
    fad2. r8 sol fad2. r8 fad

    %13
    fad4. fad8 sol4. sol8
    sol4. sol8 la4. la8
    fa?4 sol fa4. fa8

    %16
    do4 do do fa
    fa fa fa4. fa8\mbreak
    re2. r8 re'

    %19
    re2 do
    sib la4 sol
    sol4. fa8 mib4 mib

    %22
    re la' sol4. fad8
    sol4. fad8 fad4. sol8
    sol2. r8 fad sol1

}

XIItln = \relative do' {

    r8 sib
    sib4. do8 re4. re8
    re2 mib4. mib8
    mib2 mib4. mib8

    %4
    re4. la'8 sol4. sol8
    la2 la4. la8\mbreak
    la4 la sol4. sol8

    %7
    sol2 mib4. mib8
    re2 re4. re8
    do2 sol'

    %10
    mi fa4. dod8
    re4. re8 dod4. re8\mbreak
    re2. r8 sib8 re2. r8 re8

    %13
    re4. re8 re4. re8
    mib4. mib8 mib4 do
    sib sib la2

    %16
    la la4. sib8
    do4. sib8 la4. sib8\mbreak
    sib2. r8 sib'

    %19
    sib4 fa la2
    re, re4 re
    do2. do4

    %22
    la2 sib4. do8
    re4 mib re2
    si2. r8 re si1

}

XIIbcn = \relative do {

    r8 sol8
    sol2 sol4. re'8
    sol4. fa8 mib4. re8

    %3
    mib2 do
    re4. re'8 sib4 sol
    re'2 dod\mbreak

    %6
    re4 re, si2
    do4. re8 mib4. do8
    re2 re4. mi8

    %9
    fa2 sol
    la4. sol8 fa4. mi8
    re4 sol, la2\mbreak

    %12
    re2. r8 sol, re'2. r8 re
    re4. re8 sol4. fa8
    mib4. re8 do4 la

    %15
    sib mib, fa2
    fa' fa4. sol8
    la4 sib fa fa,\mbreak

    %18
    sib1
    sib'2 la
    sol fad4 sol

    %21
    do,4. re8 mib4 do
    re4. do8 sib4. la8
    sol4 do, re2

    %24
    sol2. r8 re'8 sol,1

}



XIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 60
    \key fa\major
    \partial 4 s4
    \repeat volta 2{s1*11}
    \alternative {{s1}{s}}%\break
    \set Score.currentBarNumber = #13
    \repeat volta 2 {s1*11}
    \alternative {{s1}{s}}
    \bar"|."

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


XIIbc = {
    \XIIglobal
    \clef bass
    <<\XIIbcn \forma\XIIbfn>>
    \typeset

}

XIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XIIIdsn = \relative do'' {

    sol4 sol
    re' mib8 re do re mib fa
    re2 re4 re
    sol sol8 la sib sib la sol

    %4
    fad4 re sol, sol fad'4 re la la
    la4. sib8 do[do do8. si16]\mbreak
    do4. sib8 la sib sol la

    %7
    fad4. sol8 fad sol fad sol
    la4 re, la' la
    la4. sib8 do[do do8. sib16]

    %10
    do4. la8 sib do re mi
    fa fa sol la la4. sol8
    sol2 la,4 la sol'1

}

XIIIhcn = \relative do'' {

    re,4 re
    re2 fa4 do
    re sib' sib sib
    sib2. do4

    %4
    la2 re,4 re la'2 fa4 fa
    fa2 sol4 fa\mbreak
    mi sol fa mib

    %7
    re2 re4 re
    re re fa fa
    fa2 sol4 fa

    %10
    mi do fa4. sol8
    la4 sib fad4. sol8
    sol2 fa4 fa sol1

}

XIIItln = \relative do' {

    sib4 sib
    sib2 do4 fa
    fa2 fa4 sol
    sol4. fa8 mib2

    %4
    re sib4 sib re2 re4 re
    re2 mib8 do re4\mbreak
    sol,4 mib'8 re do re sib do

    %7
    la2 la4. sib8
    do4 sib la re
    re2 mib8 do re4

    %10
    sol, la la sib
    do re re4. re8
    si2 re4 re si 1

}

XIIIbcn = \relative do {

    sol'4 sol
    sol2 la
    sib4 sib8 do re do sib la
    sol fa mib re do2

    %4
    re sol4 sol re2 re4 re
    re8 mi fa4 mib re\mbreak
    do2 fa8 re mib do

    %7
    re4. re8 do sib la sol
    fad4 sol re re'
    re8 mi fa4 mib re

    %10
    do fa8 mib re do sib la
    la4 sol re' re,
    sol2 re'4 re sol,1

}



XIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 1 = 40
    \key fa\major
    \partial 2 s2
    \repeat volta 2{s1*3}
    \alternative {{s1}{s}}%\break
    \set Score.currentBarNumber = #5
    \repeat volta 2 {s1*7}
    \alternative {{s1}{s}}
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
    <<\XIIIbcn \forma\XIIIbfn>>

}

XIVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XIVdsn = \relative do'' {

    sol'4 re4. sol8
    fad4 sol la
    sib la4. sol8

    %4
    la4 re, mib
    fa? sol8 fa mib re
    do4. re8 mib4\mbreak

    %7
    re do4. re8 re2.
    re4 do4. re8
    sib4 sol2

    %10
    sol'4 fa4. re8
    mib4 do2\mbreak
    mib8 re do4. sib8

    %13
    la4. re8 fad,4
    sol la4. sib8
    la2 sol4 sol2.

}

XIVhcn = \relative do'' {

    sib4 sib4. sib8
    la4 sib do
    re re4. re8

    %4
    re4 sib do
    re2 do8 sib
    la4. si8 do4\mbreak

    %7
    sib?8 la sol4. la8
    fad2.
    fad8 sol la4. la8

    %10
    sol2.
    si8 do re4. re8
    do2.\mbreak

    %13
    do4 sol4. la8
    fad2 re4
    re8 mi fad4 sol

    %16
    fad2 sol4 sol2.

}

XIVtln = \relative do' {

    re4 re4. re8
    re4 sol fad
    sol fad4. sol8

    %4
    re4 re do
    sib sol sol'
    fa2 sol4\mbreak

    %7
    sol sol,4. sol8
    la2.
    re4 re4. re8

    %10
    re2.
    sol4 sol4. sol8
    sol2.\mbreak

    %13
    sol8 fa mib4. mib8
    re2 la4
    sib do re

    %16
    re4. re8 si4 si2.

}

XIVbcn = \relative do {

    sol'8 la sib4 sol
    re'8 do sib4 la
    sol re'2

    %4
    fad,4 sol2
    re4 mib2
    fa do4\mbreak

    %7
    sol'8 fa mib2
    re2.
    re8 mi fad4 re

    %10
    sol2.
    sol8 la si4 sol
    do2.\mbreak

    %13
    do,8 re mib4 do
    re2 re8 do
    sib4 la sol

    %16
    re' re, sol sol2.

}



XIVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2 = 60
    \key fa\major
    s2.*8
    \bar ":..:"
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}
    \bar"|."

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
    <<\XIVbcn \forma\XIVbfn>>

}

XVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XVdsn = \relative do'' {

    sol8
    sol4. la8 sib4
    la4. sib8 do4
    sib4. do8 la4

    %4
    sib2 re4
    re4. mi8 fa4\mbreak
    sol4. la8 sib4

    %7
    do,2.
    sib2 r8 sol sib2 r8 re
    re4. mi8 fa4

    %10
    fa4. sol8 fa4
    fa4. sol8 mi4\mbreak
    fa2 sib4

    %13
    re,4. mib8 fa4
    mib re2
    do2.~

    %16
    do2 r8 fa
    fa4. mib8 re4\mbreak
    mib4. re8 do4

    %19
    re4. do8 sib4
    la2 la'4
    re,4. do8 sib4

    %22
    mib2 la,4
    la2.
    sol2 r8 re' sol,2.

}

XVhcn = \relative do'' {

    re,8
    re2 sol4
    la2 la4
    sol sol fa

    %4
    fa2 fa4
    sib2 sib4\mbreak
    sib2 sib4

    %7
    sib la2
    sib2 r8 re, sib'2 r8 sib
    sib2.

    %10
    do
    re4 re do\mbreak
    do fa,2

    %13
    sib la4
    do sib2
    la2.~

    %16
    la2 do4
    re4. do8 sib4\mbreak
    do4. sib8 la4

    %19
    la2 sol4
    fad2 fad4
    sol2 sol4

    %22
    sol2.
    fad
    sol2 r8 sib sol2.

}

XVtln = \relative do' {

    sib8
    sib4. do8 re4
    do4. sib8 la4
    sib mib do

    %4
    re2 re4
    fa2 fa4\mbreak
    mib2 re4

    %7
    fa fa2
    re r8 sib re2 r8 fa
    fa2 re4

    %10
    sol2.
    la4 sol2\mbreak
    la fa4

    %13
    fa2 fa4
    fa fa2
    fa2.~

    %16
    fa2 la4
    la2 sol4\mbreak
    sol2 sol4

    %19
    re2 re4
    re2.
    re2 mib4

    %22
    mib2 mib4
    re2.
    si2 r8 fa' si,2.

}

XVbcn = \relative do {

    sol'8
    sol2.
    fad
    sol4 mib fa

    %4
    sib,2 sib'4
    sib2 re,4\mbreak
    mib4. fa8 sol4

    %7
    fa fa,2
    sib r8 sol' sib,2 r8 sib'
    sib2.

    %10
    la
    re4 sib do\mbreak
    fa,2 re4

    %13
    sib4. do8 re4
    la sib2
    fa2.~

    %16
    fa2 fa'4
    re2 sol4\mbreak
    do,2 fa4

    %19
    fad2 sol4
    re2 do4
    sib2 mib4

    %22
    do2 do4
    re re,2
    sol r8 sib' sol,2.

}



XVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \override Staff.TimeSignature.style = #'single-digit
    \time 3/4
    \tempo 2. = 70
    \key fa\major
    \partial 8 s8
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}
    \set Score.currentBarNumber = #9
    \repeat volta 2 {s2.*15}
    \alternative {{s2.}{s}}
    \bar"|."

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
    <<\XVbcn \forma\XVbfn>>

}

XVIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XVIdsn = \relative do'' {

    sol'8
    sol4. la8 sib4. fa8
    sol2 re4. re8
    mib4. re8 do4. re8

    %4
    sib2 sol4. sol8
    do2 la4. la8\mbreak
    re2 sib4. sib8

    %7
    mib4. re8 do4. sib8
    la4. la8 sib4. do8
    do2. r8 sib

    %10
    sib2. r8 sol' sib,2. r8 sib'
    la4. sol8 fa4. mi8\mbreak
    fa2 re4. mi8

    %13
    fa4. sol8 mi4. fa8
    fa2 fa4. fa8
    sib4. re,8 mib4. fa8

    %16
    sol2 sol4. sol8
    sol4. sol8 la4. sib8\mbreak
    fad2 re4. re8

    %19
    sol2 do,4. do8
    fa2 sib,4. sib8
    mib4. mib8 re4. do8

    %22
    re2 re4. re8
    sol,4. la8 la4. sol8\mbreak
    fad2 re'4. do8

    %25
    sib4. la8 la4. sol8
    sol2. r8 sib' sol,1

}

XVIhcn = \relative do'' {

    re8
    re2 re4. re8
    sib2 sol
    sol la

    %4
    sol sol4. sol8
    sol2 fa4. fa8\mbreak
    la2 sol4. sol8

    %7
    sol2 sol4. sol8
    fa2 fa4 sib
    la2. r8 sib

    %10
    sib2. r8 re sib2. r8 re
    do4. sib8 la2\mbreak
    la sib

    %13
    do4. do8 do4. sib8
    la2 re4. re8
    re4. si8 do2

    %16
    re do
    sib do\mbreak
    la sib4. sib8

    %19
    sol2 la4. la8
    fa2 sol4. sol8
    sib4. sib8 sib4. la8

    %22
    sib2 fa4. fa8
    mib2 mib4. mib8\mbreak
    re2 re4. re8

    %25
    sol4. fad8 fad4. sol8
    sol2. r8 re' sol,1

}

XVItln = \relative do' {

    sib'8
    sib4. la8 sol4. sib8
    mib,2 re
    do re

    %4
    re mib4. mib8
    mib2 do4. do8\mbreak
    fa2 re4. re8

    %7
    do2 do4. do8
    do2 re4. fa8
    fa1

    %10
    re2. r8 sib' re,2. r8 fa
    mi2 la4. sol8\mbreak
    fa2 fa4. sol8

    %13
    la2 sol4. fa8
    fa2 la4. la8
    sol2 sol4. sol8

    %16
    sol4. fa8 mib2
    mib mib\mbreak
    re re4. re8

    %19
    re2 fa4. fa8
    do2 re4. re8
    sol4. sol8 fa4. fa8

    %22
    fa2 sib,4. sib8
    sib2 do\mbreak
    la sib4. do8

    %25
    re4 mib re2
    si2. r8 fa' si,1

}

XVIbcn = \relative do {

    sol8
    sol2 sol'4. re8
    mib2 si
    do fad,

    %4
    sol4. sol8 mib'2
    do4. do8 fa2\mbreak
    re4. re8 sol2

    %7
    do,4. re8 mib4 do
    fa4. mib8 re4 sib
    fa'2 fa,

    %10
    sib2. r8 sol sib2. r8 sib'
    do2 dod\mbreak
    re4. do?8 sib4. sib8

    %13
    la4 fa do' do,
    fa4. fa8 re2
    sol4. sol8 do,2

    %16
    si do4. re8
    mib2 do\mbreak
    re4 re'8 do sib2~

    %19
    sib4. sib8 la2~
    la4. la8 sol2~
    sol4. mib8 fa4 fa,

    %22
    sib2 sib4. sib8
    mib2 do\mbreak
    re4. do8 sib4 la

    %25
    sol do, re2
    sol2. r8 sib' sol,1

}



XVIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 2 = 80
    \key fa\major
    \partial 8 s8
    \repeat volta 2 {s1*9}
    \alternative {{s1}{s}}
    \set Score.currentBarNumber = #11
    \repeat volta 2 {s1*15}
    \alternative {{s1}{s}}
    \bar"|."

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
    <<\XVIbcn \forma\XVIbfn>>

}

XVIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XVIIdsn = \relative do'' {

    sol'8
    sol4. la8 si4. fad8
    sol2 si,4. do8
    re4. mi8 do4. si8

    %4
    la2 sol4. re'8
    re4. si8 do4. la8\mbreak
    si2 mi4. fad8

    %7
    sol4. re8 re4. dod8
    re2. r8 sol re2. r8 la'
    la4. fad8 sol4. mi8

    %10
    fad4. fad8 sol4. la8
    si4. red,8 mi4. fad8\mbreak
    fad2 mi4 r16 mi re do

    %13
    si4. si8 si4. do8
    re2. r16 la' sol fad
    mi4. mi8 fad4. sol8

    %16
    la2 si4. si8
    mi, fad sol4 sol4. fad8
    sol2. r8 la sol1

}

XVIIhcn = \relative do'' {

    re8
    re2 re
    si4. do8 re2
    sol, sol

    %4
    re4 fad sol4. si8
    si2 la\mbreak
    si do

    %7
    re4. fad,8 la2
    fad2. r8 re' fad,2. r8 re'
    re2 mi

    %10
    la, re4. do8
    si4. la8 sol4 do\mbreak
    si2 sold

    %13
    sold4. sold8 mi2
    re4. re8 re'2
    mi la,

    %16
    re sol,8 la si4
    do si la2
    sol2. r8 re' sol,1

}

XVIItln = \relative do' {

    si8
    si4. do8 re2
    sol fad4. mi8
    re2 mi

    %4
    fad4 re re4. re8
    sol2 la\mbreak
    sol sol

    %7
    sol4. fad8 mi2
    re2. r8 si re2. r8 fad
    fad2 mi

    %10
    fad si
    si, mi\mbreak
    red2 mi

    %13
    mi4. mi8 sol4. sol8
    sol2 fad
    la la4. la8

    %16
    re,2 re
    mi re
    si2. r8 fad' si,1

}

XVIIbcn = \relative do {

    sol'8
    sol2 re
    mi re4. do8
    si2 do

    %4
    re sol,4. sol'8
    sol2 fad\mbreak
    sol do,

    %7
    si4 do8 re la2
    re2. r8 sol re2. r8 re'
    re2 dod

    %10
    re4. do8 si4. la8
    sol4. fad8 mi4 la,\mbreak
    si2 mi

    %13
    mi2. r16 mi re do
    si4. do8 re2
    dod re4. mi8

    %16
    fad2 sol
    do, re4 re,
    sol2. r8 re'' sol,,1

}



XVIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    %\override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 2 = 80
    \key sol\major
    \partial 8 s8
    \repeat volta 2 {s1*7}
    \alternative {{s1}{s}}
    \set Score.currentBarNumber = #9
    \repeat volta 2 {s1*9}
    \alternative {{s1}{s}}
    \bar"|."

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
    <<\XVIIbcn \forma\XVIIbfn>>

}

XVIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XVIIIdsn = \relative do'' {

    sol'4. fad8 mi4
    re4. do8 si4
    do4. re8 mi4

    %4
    la,2 sol4
    sol'4. fad8 mi4
    re4. do8 si4\mbreak

    %7
    re mi dod
    re2.
    la4. si8 do4

    %10
    si4. do8 re4
    mi4. fad8 sol4
    la2 re,4\mbreak

    %13
    sol4. fad8 mi4
    re4. do8 si4
    la4. sol8 fad4

    %16
    sol2.

}

XVIIIhcn = \relative do'' {

    re4. re8 do4
    si4. la8 sold4
    la2 sol?4

    %4
    fad2 re4
    re4.  re8 la'4
    fad2 sol8 la\mbreak

    %7
    si2 la4
    fad2.
    fad4. sol8 la4

    %10
    sol4. la8 si4
    la2 si4
    do2 si4\mbreak

    %13
    si4. si8 sol4
    fad2 sol4
    mi4. mi8 re4

    %16
    si2.

}

XVIIItln = \relative do' {

    si'4. si8 sol4
    fad2 mi4
    mi4. mi8 mi4

    %4
    re2 si4
    si4. re8 do4
    la2 sol4\mbreak

    %7
    sol'4. fad8 mi4
    re2.
    re4. re8 mi4

    %10
    mi4. mi8 sol4
    do,2 re4
    re2 re4\mbreak

    %13
    re2 do4
    la2 sol4
    do4. si8 la4

    %16
    sol2.

}

XVIIIbcn = \relative do {

    sol'4. si,8 do4
    re2 mi4
    la,4. si8 do4

    %4
    re2 sol,8 la
    si4. si8 do4
    re2 mi8 fad\mbreak

    %7
    sol4 mi  la
    re,2.
    re4. re8 la4

    %10
    mi'4. mi8 si4
    do8 si la4 sol
    fad2 sol4\mbreak

    %13
    la4. si8 do4
    re2 mi4
    do4. do8 re4

    %16
    sol,2.

}



XVIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 80
    \key sol\major
    s2.*8%\break
    \bar":..:"
    s2.*8
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
    <<\XVIIIbcn \forma\XVIIIbfn>>
    \typeset

}

XIXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XIXdsn = \relative do'' {

    sol'4 sol
    fad8 sol la4 sol fad
    mi re re8 mi fa4
    mi re re dod

    %4
    re2 sol4 sol re2 si4 si
    si8 do? re4 do si\mbreak
    do4 la si8 si la sol

    %7
    fad4. sol8 fad4 sol
    la2 si4 si
    si8 do re4 do si

    %10
    do la si8 si la sol
    fad4 sol8. la16 si4 la
    sol2 si4 si sol1

}

XIXhcn = \relative do'' {

    re4 re
    re2 mi4 re
    dod re la la
    la fa  la la

    %4
    fad?2 re'4 re fad,2 sol4 sol
    sol2 la4 sol\mbreak
    sol fad sol mi

    %7
    re4. re8 re4. sol8
    fad2 sol4 sol
    sol2 la4 sol

    %10
    sol fad sol mi
    re si8 sol' sol4 fad
    sol2 sol4 sol sol1

}

XIXtln = \relative do' {

    si'4 si
    la2 la4 la
    la fa fa re
    dod re8 mi fa4 mi

    %4
    re2 si'4 si re,2 re4 re
    re2 re4 re\mbreak
    mi re re do

    %7
    si4. si8 si4. mi8
    re2 mi4 mi
    mi2 fad4 mi

    %10
    mi re re do
    la mi' re re
    si2 re4 re si1

}

XIXbcn = \relative do {

    sol'8 la si do
    re2 dod4 re
    la re, re re

    %3
    la' sib la la,
    re re'8 do si? do si la re, mi fad re sol4 sol
    sol2 fad4 sol\mbreak

    %6
    do, re si do
    re4. mi8 re4 sol,
    re2 sol'4 sol

    %9
    sol2 fad4 sol
    do, re si do
    re mi8 do re4 re,

    %12
    sol2 sol'4 sol sol,1

}



XIXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 60
    \key sol\major
    \partial 2 s2
    \repeat volta 2 {s1*3}
    \alternative {{s1}{s}}
    \set Score.currentBarNumber = #5
    \repeat volta 2{s1*7}
    \alternative {{s1}{s}}
    \bar"|."

}


XIXds = {
    \XIXglobal
    <<\XIXdsn \forma>>

}

XIXhc = {
    \XIXglobal
    <<\XIXhcn \forma>>

}


XIXtl = {
    \XIXglobal
    <<\XIXtln \forma>>

}


XIXbc = {
    \XIXglobal
    \clef bass
    <<\XIXbcn \forma\XIXbfn>>
    \typeset

}

XXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XXdsn = \relative do'' {

    r16 sol' fad mi
    re4. re8 re4. mi8
    dod4. si16 dod re8 si dod la
    si4. do?8 si la si sol

    %4
    re'2. r16 mi fad re
    la'4. la8 si4. la8\mbreak
    sol4. mi8 la4. la8

    %7
    la4. si8 sol4. fad16 sol
    fad2. r16 si la sol
    fad4. sol8 red4. mi8

    %10
    fad2. r8 fad
    sol4. fad8 fad4. mi8\mbreak
    mi4 si8 do re si mi re

    %13
    dod4. mi8 fad4. sol8
    la2. si8 fad
    sol4. la8 si4. mi,8

    %16
    mi2. r8 re
    re2. r16 sol fad mi re2. mi4\mbreak
    fad sol la8 sol fad sol

    %19
    red4 red2 si'4
    la fad sol4. la8
    sol4 mi2 mi4

    %22
    la4. la8 la4. sold8
    la4 mi8 fa sol4 fa8 mi\mbreak
    fa4. fa8 re4. mi8

    %25
    dod4 dod2 la'4
    fa4. mi8 mi4. re8
    re4. la'16 la la4 si

    %28
    fad?4. sol8 re4 re
    sol mi2 fad8 mi\mbreak
    re mi fad sol fad4. mi16 fad

    %31
    sol4. la16 la la4 si
    fad4. sol8 re4 re
    sol mi2 la8 sol

    %34
    fad mi fad sol sol4. fad8
    sol2. r8 mi sol1

}

XXhcn = \relative do'' {

    si4
    si2 la
    la la
    sol sol

    %4
    la1
    la4 re re2\mbreak
    mi mi

    %7
    re si
    la1
    si2 si

    %10
    si si
    si4 do si2\mbreak
    sold4. la8 si2

    %13
    la4. la8 la4. la8
    la4 re8 do si2
    si si

    %16
    la2. sol4
    fad2. si4 fad2. do'4\mbreak
    re si do do
    si si2 re4

    %20
    do2 si
    si4 sol2 sol4
    do do si2

    %23
    la4 la la2
    la4. la8 sib4. sib8
    la4 la2 do4

    %26
    sib sib la2
    fad~fad4. fad16 sol
    la4. sol8 fad2

    %29
    si4 sol2 fad4\mbreak
    fad8 sol la si la4. sol8
    sol4. fad8 fad4. fad16 sol

    %32
    la4. sol8 fad2
    si4 sol2 do8 si
    la4 si la2

    %35
    sol2. do4 sol1

}

XXtln = \relative do' {

    sol'4
    sol2 re
    mi fad
    re2. re4

    %4
    fad1
    fad4 la sol2\mbreak
    sol4 si la2

    %7
    fad re
    re2. fad4
    fad2 fad4. sol8

    %10
    la2 fad
    mi4.  mi8 red4. mi8\mbreak
    mi2 mi

    %13
    mi4. mi8 mi4. mi8
    re2 fad
    mi re~

    %16
    re dod
    re2. sol4 re2. la'4\mbreak
    la sol mi la

    %19
    fad fad2 sol4
    mi2 red
    mi4 mi2 mi4

    %22
    mi mi mi2
    dod4 dod8 re mi2\mbreak
    re4. mi8 fad4 sol

    %25
    mi mi2 fad4
    re4. mi8 dod4. re8
    re4. re16 re re4 re

    %28
    re2 re
    re4 do2 la4\mbreak
    re re re4. re8

    %31
    si4. re16 re re4 re
    re2 re
    re4 do2 mi4

    %34
    re4. re8 re2
    si2. la'4 si,1

}

XXbcn = \relative do {

    sol'4
    sol2 fad
    mi4 la re,2
    sol, sol'

    %4
    fad1~
    fad2 sol4. fad8\mbreak
    mi2 dod

    %7
    re8 mi fad re sol4 sol,
    re'1
    re4. mi8 si4 r16 si' la sol

    %10
    fad4. sol8 red2
    mi4 la, si2\mbreak
    mi sold,

    %13
    la4. la'8 la4. sol8
    fad4. mi8 red2
    mi4. fad8 sol mi fad sol

    %16
    la2 la,
    re2. sol4 re2. la4\mbreak
    re mi do la

    %19
    si si2 sol4
    la2 si
    mi,4 mi2 mi'4

    %22
    do la mi' mi,
    la la' dod,2\mbreak
    re4. do8 sib4 sol

    %25
    la la2 fad4
    sib sol la2
    re2~re4. re16 re

    %28
    re4. mi8 si2
    si4 do2 re8 do\mbreak
    si4 la8 sol re'4 re,

    %31
    sol4. re'8 re4. re16 re
    re4. mi8 si2
    si4 do2 la4

    %34
    re4. sol,8 re2
    sol2. la4 sol1

}



XXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 70
    \key sol\major
    \partial 4 s4
    \repeat volta 2 {s1*16}
    \alternative {{s1}{\time 2/2\tempo 1 = 45  s}}
    \set Score.currentBarNumber = #18
    \repeat volta 2{s1*17}
    \alternative {{s1}{\time 2/2\override Staff.TimeSignature.style = #'single-digit s}}
    \bar"|."

}


XXds = {
    \XXglobal
    <<\XXdsn \forma>>

}

XXhc = {
    \XXglobal
    <<\XXhcn \forma>>

}


XXtl = {
    \XXglobal
    <<\XXtln \forma>>

}


XXbc = {
    \XXglobal
    \clef bass
    <<\XXbcn \forma\XXbfn>>
    \typeset

}

XXIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


XXIdsn = \relative do'' {

    r8 sol
    sol4. la8 sib4 la fad?4. sib8
    sib4. do8 re4 do sib4. re8
    re4. mi8 fa4 sol la2

    %4
    sib2. fa
    sol4. fa8 mib4 re do4. sib8\mbreak
    sib2.~sib2 r8 sol sib2.~sib2 r8 re

    %7
    re4. mi8 fa4 fa fa4. mi8
    fa2.~fa2 r8 re
    re4. re8 mib4 re do4. sib8

    %10
    la2.~la2 r8 si?
    si?2. sol2 r8 do\mbreak
    do2. la2 r8 re

    %13
    re4. mi8 fa4 sol fad4. sol8
    la4 re, mi8 fa sol4 fad2
    sol2.~sol2 r8 re sol2.~sol

}

XXIhcn = \relative do'' {

    r8 re,
    re4. re8 sol4 fa fad4. fad8
    sol4. sol8 la4 la re,4. re8
    re4. re8 re'4 re do2

    %4
    sib2. la
    sol4. sol8 la4 sib la4. sib8\mbreak
    sib2.~sib2 r8 re, sib'2.~sib2 r8 sib

    %7
    sib4. sib8 do4 do sib2
    la2.~la2 r8 sol
    sol4. sol8 sol4 sol sol4. sol8

    %10
    fad2.~fad2 r8 sol
    sol2.~sol2 r8 sol\mbreak
    sol2. la2 r8 sib

    %13
    sib4. sib8 do4 re re4. re8
    re4 si do2 la
    sol2.~sol2 r8 sib sol2.~sol

}

XXItln = \relative do' {

    r8 sib
    sib4. do8 re4 re re4. re8
    re4. re8 re4 la' sol4. sol8
    fa4. fa8 fa4 fa fa2

    %4
    re2. re
    sib4. sib8 do4 re fa fa\mbreak
    re2.~re2 r8 sib re2. ~re2 r8 fa

    %7
    fa4. fa8 fa2 sol
    do,2.~do2 r8 sib
    re4. re8 sol4 fa mib mib

    %10
    re2.~re2 r8 si
    si2.~si2 r8 si\mbreak
    do2. do2 r8 re

    %13
    re4. re8 re4 sib'! la4. la8
    re,4 re mib2 re
    si2.~si2 r8 fa' si,2.~si

}

XXIbcn = \relative do {

    r8 sol'
    sol4. sol8 sol4 re re4. re8
    sol,4. sol8 fad2 sol
    sib4. do8 re4 mib fa2

    %4
    sib,2. re
    mib4. re8 do4 sib fa' fa,\mbreak
    sib2.~sib2 r8 sol' sib,2.~sib2 r8 sib'

    %7
    sib4. sib8 la2 sol
    fa2.~fa2 r8 sol
    si,4. si8 do4 re mib do

    %10
    re2.~re2 r8 sol,
    sol2. mib'2 r8 mib\mbreak
    mi!2. fa2 r8 sib

    %13
    sib4. sib8 la4 sol re'4. sol,8
    fad4 sol do,2 re4 re,
    sol2.~sol2 r8 sib' sol,2.~sol

}



XXIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 3/2
    \tempo 2. = 65
    \key fa\major
    \partial 4 s4
    \repeat volta 2 {s1.*5}
    \alternative {{s1.}{s}}
    \set Score.currentBarNumber = #7
    \repeat volta 2{s1.*8}
    \alternative {{s1.}{s}}
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


XXIbc = {
    \XXIglobal
    \clef bass
    <<\XXIbcn \forma\XXIbfn>>
    \typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup\larger "Ballet du Triomphe des Richesses "
    composer = \markup {"H. Desmarets (1661-1741)"}
}

\markup \huge {[1.] Ouverture }

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r8^\markup \center-align\smaller"[Dessus]" sol'[sib' sol']}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \Ids
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'4.^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} sib'8}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \Ihc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'4.^\markup \center-align\smaller"[Taille]"re'8}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \Itl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \Ibc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[2.] Prologue - La fortune}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2 r8^\markup \center-align\smaller"[Dessus]" sol''}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \IIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2 r8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} re''}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \IIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 r8^\markup \center-align\smaller"[Taille]"sib'8}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \IItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[3.] Le sort le azard le destin. Viste}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2 sol'8^\markup \center-align\smaller"[Dessus]"}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \IIIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2 re'8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \IIIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 sib8^\markup \center-align\smaller"[Taille]"}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \IIItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[4.] Rondeau. Les gens de bien}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2 sol'8^\markup \center-align\smaller"[Dessus]" [sib']}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \IVds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2 sib'8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} [fad'] }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \IVhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 re'8^\markup \center-align\smaller"[Taille]" [re']}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \IVtl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \IVbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[5.] Bourée. Les scélérats}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2 sol''8^\markup \center-align\smaller"[Dessus]" [fad'']}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \Vds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2 re''8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} [re''] }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \Vhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 sib'8^\markup \center-align\smaller"[Taille]" [la']}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \Vtl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \Vbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[6.] Plutus aveuglé}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key sol\major \time 2/2 sol'4^\markup \center-align\smaller"[Dessus]" sol'}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \VIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key sol\major \time 2/2 si'4^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} si' }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \VIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key sol\major \time 2/2 sol'4^\markup \center-align\smaller"[Taille]"sol'}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \VItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \VIbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[7.] Cremille et son vallet}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol''2^\markup \center-align\smaller"[Dessus]" sol''}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \VIIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'2^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} sib' }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \VIIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'4. do'8^\markup \center-align\smaller"[Taille]" re'4. re'8}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \VIItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \VIIbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[8.] Phidippe}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r8^\markup \center-align\smaller"[Dessus]" sol''}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \VIIIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} re'' }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \VIIIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r8^\markup \center-align\smaller"[Taille]" sib'}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \VIIItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \VIIIbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[9.] La famille}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2 r8^\markup \center-align\smaller"[Dessus]" sol''}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \IXds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2 r8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} sib' }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \IXhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 r8^\markup \center-align\smaller"[Taille]" re'}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \IXtl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \IXbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[10.] Les médecins}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 4/4 r8^\markup \center-align\smaller"[Dessus]" sol' [la']}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \Xds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 4/4 re'4^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} re'}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \Xhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 4/4 sib8^\markup \center-align\smaller"[Taille]" [do']}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \Xtl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \Xbc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[11.] Les vendeurs de mitridat}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol''16^\markup \center-align\smaller"[Dessus]" [fad''8]}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'16^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} [la'8]}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'16^\markup \center-align\smaller"[Taille]" [re'8]}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XIbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[12.] Plutus des aveugle}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r8^\markup \center-align\smaller"[Dessus]" sol']}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XIIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} sol'}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XIIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r8^\markup \center-align\smaller"[Taille]" sib}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XIItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XIIbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[13.] Les hollandois}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'4^\markup \center-align\smaller"[Dessus]" sol'}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XIIIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'4^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} re'}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XIIIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib4^\markup \center-align\smaller"[Taille]" sib}
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XIIItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XIIIbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[14.] Les espagnols}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol''4^\markup \center-align\smaller"[Dessus]"}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XIVds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'4^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XIVhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'4^\markup \center-align\smaller"[Taille]" }
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XIVtl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XIVbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[15.] Les anglois}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'8^\markup \center-align\smaller"[Dessus]"}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XVds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XVhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib8^\markup \center-align\smaller"[Taille]" }
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XVtl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XVbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[16.] Les françois}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol''4^\markup \center-align\smaller"[Dessus]"}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XVIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XVIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sib'8^\markup \center-align\smaller"[Taille]" }
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XVItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XVIbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[17.] Les volontaires}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key sol\major \time 2/2 sol''4^\markup \center-align\smaller"[Dessus]"}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XVIIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key sol\major \time 2/2 re''8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} }
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XVIIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key sol\major \time 2/2 si8^\markup \center-align\smaller"[Taille]" }
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XVIItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XVIIbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[18.] Canarie}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key sol\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  sol''4. ^\markup \center-align\smaller"[Dessus]" fad''8}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XVIIIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key sol\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  re''4.^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"}  re''8}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XVIIIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key sol\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  si'4.^\markup \center-align\smaller"[Taille]" si'8 }
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XVIIItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XVIIIbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[19.] Les gueux}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  sol''4^\markup \center-align\smaller"[Dessus]" sol''}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XIXds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  re''4^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"}  re''}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XIXhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  si'4^\markup \center-align\smaller"[Taille]" si' }
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XIXtl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XIXbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[20.] Les riches}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  r16^\markup \center-align\smaller"[Dessus]" sol''[fad'' mi'']}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XXds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  re''4.^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"}  re''8}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XXhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key sol\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit  si'4.^\markup \center-align\smaller"[Taille]" si'8 }
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XXtl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XXbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup \huge {[21.] Les cuisiniers et cuisinières}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 3/2\numericTimeSignature  r8^\markup \center-align\smaller"[Dessus]" sib'8}
            \clef violin
            \set Staff.shortInstrumentName = "ds"
            \set Staff.midiInstrument = #"violin"
            \XXIds
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 3/2\numericTimeSignature r8^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"}  re'8}
            \clef violin
            \set Staff.shortInstrumentName = "hc"
            \set Staff.midiInstrument = #"violin"
            \XXIhc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 3/2\numericTimeSignature  r8^\markup \center-align\smaller"[Taille]" sib8 }
            \clef alto
            \set Staff.shortInstrumentName = "tl"
            \set Staff.midiInstrument = #"viola"
            \XXItl
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.shortInstrumentName = "bc"
            \set Staff.midiInstrument = #"cello"
            \XXIbc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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