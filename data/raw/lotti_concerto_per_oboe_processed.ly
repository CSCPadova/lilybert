\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = "up"

giu = \change Staff = "down"

tasto = _\markup\italic"Tasto Solo"

tr = \trill

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


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Iobn = \relative do'' {

    re8
    sol4 re
    sib8. la16 sol la sib do
    re8 re re mi16 fad

    %4
    sol fad sol la sib8 la16 sol
    la8 re, r la'
    sib-![sib-! sib-! sib-!]

    %7
    do, re16 mib? fa sol la sib
    la8-![la-! la-! la-!]\mbreak
    sib, do16 re mib fa sol la

    %10
    sol8-![sol-! sol-! sol-!]
    la,4 fad'-!
    sol-! la-!

    %13
    re,-! fad-!
    sol-! la-!
    do,8 sib16 la sib8 sol'

    %16
    sib,4 la
    sol r8 re'\p
    sol4 re

    %19
    mib4. re16 do
    re4 r8 re
    sol4 re

    %22
    mib4. re16 do
    re4 r8 re\mbreak
    sol, sol4 la8

    %25
    sib sib4 do8
    re re4 mib8
    fa4 sol

    %28
    fa8 mib16 re mib8 do
    re4 mib
    re8 do16 sib do8 la

    %31
    sib4 r8 sol'
    fa4. la,8
    sib[la sib sol']

    %34
    fa4. mib8\mbreak
    re do16 sib do8 la
    sib4 r

    %37
    R2*4
    r4 r8 re
    fa4 re

    %43
    mib4. re16 do
    re4. re8
    fa4 mib8 re

    %46
    mib4. re16 do
    re4. re8
    sol,4 do8 sib16 la

    %49
    sib8 do16 re mib8 do\mbreak
    re4. re8
    sol, do4 sib16 la

    %52
    sib8 do16 re mib8 do
    re mi16 fad sol8 do,
    sib4 la

    %55
    sol re'8 mi
    fa4 re
    mi?4. re16 do

    %58
    re8 mi16 fad sol8 re
    sib4 do
    re8 mi16 fad sol8 re

    %61
    sib4 la
    sol r8 re'\f\mbreak
    sol4 re

    %64
    sib8. la16 sol la sib do
    re8 re re mi16 fad
    sol fad sol la sib8 la16 sol

    %67
    la8 re, r la'
    sib-![sib-! sib-! sib-!]
    do, re16 mib! fa sol la sib

    %70
    la8-![la-! la-! la-!]
    sib, do16 re mib fa sol la\mbreak
    sol8-![sol-! sol-! sol-!]

    %73
    la,4 fad'-!
    sol -! la-!
    re,-! fad-!

    %76
    sol-! la-!
    do,8 sib16 la sib8 sol'
    sib,4 la

    %79
    sol8[re' sol re]
    sib4 la
    sol\fermata r8 sib

    %82
    la4 sib
    do8.[re16 mib8 re]
    do4 sib

    %85
    fa'8 mib16 re do8 re\mbreak
    mib4 re
    la'8.[la16 fa8. mib16]

    %88
    re4 mib
    do r8 re
    dod4. re8

    %91
    la8 si16 dod re mi fa sol
    fa8[mi re mi]
    dod4 re

    %94
    mib! r8 re
    dod4 re
    la8 si16 dod re mi fa sol

    %97
    fa8[mi re mi]
    dod4. re8\mbreak
    re4 r8 sib

    %100
    la4. re8
    dod2
    re4 r8

}

IvlIn =  \relative do'' {

    re8
    sol4 re
    sib8. la16 sol la sib do
    re8 re re mi16 fad

    %4
    sol fad sol la sib8 la16 sol
    la8 re, r la'
    sib-![sib-! sib-! sib-!]

    %7
    do, re16 mib? fa sol la sib
    la8-![la-! la-! la-!]
    sib, do16 re mib fa sol la\mbreak

    %10
    sol8-![sol-! sol-! sol-!]
    la,4 fad'-!
    sol-! la-!

    %13
    re,-! fad-!
    sol-! la-!
    do,8 sib16 la sib8 sol'

    %16
    sib,4 la
    sol r8 sol\p
    %\clef bass \key sol\minor
    sol4 sib,

    %19
    do la
    sib r8 sib
    sol4 sib

    %22
    do la
    sib8 la sol4
    sol' re

    %25
    sol,8 sol4 la8
    sib8 sib4 do8
    re4 mib\mbreak

    %28
    re do8 fa
    sib,4 do
    sib fa'

    %31
    sib,8[do re mib]
    re4 fa
    sol4. mib8

    %34
    re4 la
    sib fa'
    %\clef violin\key sol\minor
    sib,4 r8 re'

    %37
    sol4 re
    sib8. la16 sol la sib do
    re8 re re mi16 fad

    %40
    sol fad sol la sib8 la16 sol\mbreak
    la8 re, r re,
    %\clef bass\key sol\minor
    si4 si

    %43
    do la
    sib!4. sib8
    re4 sol,

    %46
    do la
    sib re
    mi fad

    %49
    sol do,8 la
    sib4 re
    mi fad

    %52
    sol do,8 la
    sib4. la8
    sol4 la

    %55
    sib4. do8
    re2
    sol,4 sol'\mbreak

    %58
    re8 do si4
    do4 la
    sib!4. do8

    %61
    re2
    sol,4 r8 re''\f
    sol4 re

    %64
    sib8. la16 sol la sib do
    re8 re re mi16 fad
    sol fad sol la sib8 la16 sol

    %67
    la8 re, r la'
    sib-![sib-! sib-! sib-!]
    do, re16 mib! fa sol la sib

    %70
    la8-![la-! la-! la-!]
    sib, do16 re mib fa sol la\mbreak
    sol8-![sol-! sol-! sol-!]

    %73
    la,4 fad'-!
    sol-! la-!
    re,-! fad-!

    %76
    sol-! la-!
    do,8 sib16 la sib8 sol'
    sib,4 la

    %79
    sol8[re' sol re]
    sib4 la
    sol\fermata
    %\clef bass \key sol\minor
    r8 re

    %82
    do4 sib
    la4. sib8
    fa'4 sol

    %85
    fa4. fa8\mbreak
    sol4 fa
    mib re8 do

    %88
    sib4 mib
    fa r8 fa
    mi!4 re

    %91
    dod4 r8 dod
    re4. sol,8
    la4 sib

    %94
    la r8 fa'
    mi!4 re
    dod4.dod8

    %97
    re[mi fa sol]
    la4 la,
    re r8 sol

    %100
    la2
    la,\mbreak
    re4 r8

}

IvlIIn = \relative do'' {

    re8
    sol4 re
    sib8. la16 sol la sib do
    re8 re re mi16 fad

    %4
    sol fad sol la sib8 la16 sol
    la8 re, r la'
    sib-![sib-! sib-! sib-!]

    %7
    do, re16 mib? fa sol la sib
    la8-![la-! la-! la-!]
    sib, do16 re mib fa sol la\mbreak

    %10
    sol8-![sol-! sol-! sol-!]
    la,4 fad'-!
    sol-! la-!

    %13
    re,-! fad-!
    sol-! la-!
    do,8 sib16 la sib8 sol'

    %16
    sib,4 la
    sol r8 sol\p
    %\clef bass \key sol\minor
    sol4 sib,

    %19
    do la
    sib r8 sib
    sol4 sib

    %22
    do la
    sib8 la sol4
    sol' re

    %25
    sol,8 sol4 la8
    sib8 sib4 do8
    re4 mib\mbreak

    %28
    re do8 fa
    sib,4 do
    sib fa'

    %31
    sib,8[do re mib]
    re4 fa
    sol4. mib8

    %34
    re4 la
    sib fa'
    %\clef violin\key sol\minor
    sib,4 r8 re'

    %37
    sol4 re
    sib8. la16 sol la sib do
    re8 re re mi16 fad

    %40
    sol fad sol la sib8 la16 sol\mbreak
    la8 re, r re,
    %\clef bass\key sol\minor
    si4 si

    %43
    do la
    sib!4. sib8
    re4 sol,

    %46
    do la
    sib re
    mi fad

    %49
    sol do,8 la
    sib4 re
    mi fad

    %52
    sol do,8 la
    sib4. la8
    sol4 la

    %55
    sib4. do8
    re2
    sol,4 sol'\mbreak

    %58
    re8 do si4
    do4 la
    sib!4. do8

    %61
    re2
    sol,4 r8 re''\f
    sol4 re

    %64
    sib8. la16 sol la sib do
    re8 re re mi16 fad
    sol fad sol la sib8 la16 sol

    %67
    la8 re, r la'
    sib-![sib-! sib-! sib-!]
    do, re16 mib! fa sol la sib

    %70
    la8-![la-! la-! la-!]
    sib, do16 re mib fa sol la\mbreak
    sol8-![sol-! sol-! sol-!]

    %73
    la,4 fad'-!
    sol-! la-!
    re,-! fad-!

    %76
    sol-! la-!
    do,8 sib16 la sib8 sol'
    sib,4 la

    %79
    sol8[re' sol re]
    sib4 la
    sol\fermata
    %\clef bass \key sol\minor
    r8 re

    %82
    do4 sib
    la4. sib8
    fa'4 sol

    %85
    fa4. fa8\mbreak
    sol4 fa
    mib re8 do

    %88
    sib4 mib
    fa r8 fa
    mi!4 re

    %91
    dod4 r8 dod
    re4. sol,8
    la4 sib

    %94
    la r8 fa'
    mi!4 re
    dod4.dod8

    %97
    re[mi fa sol]
    la4 la,
    re r8 sol

    %100
    la2
    la,\mbreak
    re4 r8

}

Ivlan =  \relative do' {

    r8
    sib'4 la
    sol8.[fad16 sol8 sol]
    sol[sol sol do]
    sib la sol fad16 mi
    fad8[fad la fad]
    sol-![re-! re-! re-!]
    sol[sol sol sol]
    fa?-![do-! do-! do-!]
    fa[fa fa fa]
    mib-![sib-! sib-! sib-!]
    mib4 la,\mbreak
    re mib8 do
    fad4 la
    re do8 sib
    la4 sol8 sol
    sol4 fad
    sol4 r8 sol\p
    sol4 sib,
    do la
    sib4. sib8
    sol4 sib
    do la
    sib8 la sol4
    sol'4 re
    sol, sol8 la
    sib4 sib8 do
    re4 mib
    re do8 fa\mbreak

    %29 OOKK anche con Giove
    sib,4 do
    sib fa'
    sib,8[do re mib]
    re4 fa
    sol4. mib8
    re4 la\mbreak
    sib fa'
    sib, r8 sol'
    sib4 la
    sol8. fad16 sol8 sol
    sol[sol sol do]
    sib8. la16 sol8 fad16 mi
    fad4 r8 re
    si4 si\mbreak
    do la
    sib4. sib8
    re4 sol,
    do la
    sib re
    mi fad
    sol do,8 la
    sib4 re
    mi fad\mbreak
    sol do,8 la
    sib4. la8
    sol4 la
    sib4. do8
    re2
    sol,4 sol'
    re8 do si4
    do la\mbreak
    sib!4. do8
    re2
    sol,4 r8 sib'\f
    sib4 la
    sol8. fad16 sol8 sol
    sol[sol sol do]
    sib8. la16 sol8 fad16 mi
    fad8[ fad la fad]
    sol-![re-! re-! re-!]\mbreak
    sol[sol sol sol]
    fa-![do-! do-! do-!]
    fa[fa fa fa]
    mib-![sib-! sib-! sib-!]
    mib4 la,
    re mib8 do
    fad4 la
    re do8 sib
    la4 sol8 sol
    sol4 fad
    sol4. fad8
    sol4 fad\mbreak
    sol4\fermata r8 re


    %82
    do4 sib
    la4. sib8
    fa'4 sol

    %85
    fa4. fa8\mbreak
    sol4 fa
    mib re8 do

    %88
    sib4 mib
    fa r8 fa
    mi!4 re

    %91
    dod4 r8 dod
    re4. sol,8
    la4 sib

    %94
    la r8 fa'
    mi!4 re
    dod4.dod8

    %97
    re[mi fa sol]
    la4 la,
    re r8 sol

    %100
    la2
    la,\mbreak
    re4 r8

}

Ibcn = \relative do {

    r8
    sol'4 fad
    sol4. la8
    sib[sib sib la]

    %4
    sol4. sol,8
    re'[re fad re]
    sol-![fa?-! mib-! re-!]

    %7
    mib [mib mib mib]
    fa-![mib-! re-! do-!]
    re[re re re]

    %10
    mib-![re-! do-! sib-!]\mbreak
    do4 re
    sib do

    %13
    re re'
    sib la8 sol
    fad4 sol8 sol,

    %16
    re'4 re,
    sol r
    R2*18

    %36
    r4 r8 sib'
    sol4 fad
    sol4. la8

    %39
    sib[sib sib la]
    sol4. sol,8
    re'4 r

    %42
    R2*20
    r4 r8 sol
    sol4 fad

    %64
    sol4. la8
    sib[sib sib la]
    sol4. sol,8

    %67
    re'[re fad re]
    sol-![fa?-! mib-! re-!]
    mib [mib mib mib]

    %70
    fa-![mib-! re-! do-!]
    re[re re re]
    mib-![re-! do-! sib-!]\mbreak

    %73
    do4 re
    sib do
    re re'

    %76
    sib la8 sol
    fad4 sol8 sol,
    re'4 re,

    %79
    sol4. la8
    sol do re re,
    sol4\fermata r8 r

    %82
    R2*20
    r4 r8

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\minor
    \time 2/4
    \tempo 2 = 55
    \partial 8 s8
    s2*80\once \override Score.RehearsalMark.extra-offset = #'(+2 . +0.5)
    \mark\markup "Fine"
    s4 s8 \bar "||"\break
    s8
    s2*21
    \bar"||"
    \mark\markup\smaller \center-column {"Da capo""al Fine"}

}

Iob = {
    \Iglobal
    %\notypeset
    <<\Iobn \forma>>

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

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

IIobn = \relative do'' {

    R1.*3
    mib4 mib8 mib8. re16 do8 sib4. sol
    do8. re16 mib8 sib4 lab8 sol4. r8 r sol\mbreak

    %6
    do4 do8 sol' mib do la4. r8 r fa
    mib'4 mib8 mib8. re16 do8 re4 la!8 sib4 re8
    mib2. mi

    %9
    fa4. r8 r mib! re8. do16 sib8 re8. mib16 do8
    sib2. r
    r sib4 sib8 sol'8. mib16 re8

    %12
    do4. sib do8. re16 mib8 la,4.
    sib r8 r \mbreak sib sib4 sol8 mib4 reb'8
    do4 lab8 fa4 mib'8 re!4. r8 r re

    %15
    mib4. fa sol4 fa8 mib8. re16 do8
    sib4 do8 reb8. do16 sib8 do4 re8 mib4 do8
    mib4. re mib r8 r mib,

    %18
    reb'4 reb8 reb8. do16 sib8  do4 fa8 re8. do16 sib8
    lab4.~ lab8. sib16 lab8 re2.
    r8 r mib sib4 lab8\mbreak sol4. fa

    %21
    mib2.\fermata r
    R1.*2
    sib'8. do16 sib8 do4 re8 mib4. r8 r mib

    %25
    fa4 do8 re4. do r8 r la
    re8. mib16 re8 re4 fad8 sol4 mib8 re4 fad8
    sol8. fa!16 mib8 re4. ~re8. do16 sib8 sib4 la8

    %28
    sol4. r8 r re' sol4 mib8 dod4.
    re4 mib8 do!4 do8\mbreak fad8. mi16 re8 sol4 do,8
    sib4. la sol2.

}

IIvlIn =  \relative do'' {

    mib8.^\markup\italic\smaller "pizzicato" fa16 mib8 mib8. re16 do8 sib8. do16 re8 mib8. fa16 sol8
    lab8. sol16 fa8 sol8. fa16 mib8 fa8. sol16 fa8 fa4 sol8
    fa8. sol16 fa8 fa4 sol8 fa8. sol16 mib8 mib8. fa16 re8

    %4
    mib4 mib8 mib8. re16 do8\mbreak sib4 sib8 sol4 sol8
    do8. re16 mib8 sib4 lab8 sol4 sol8 sol4 sol8
    do4 do8 do4 do8 do4 do8 do4 do8

    %7
    mib4 mib8 mib8. re16 do8 re4 la!8 sib4 re8
    sol,4 sol8 sol4 sol8 sol4 sol8 sol4 sol8
    la4 la8 do4 mib8 re4 re8 re4 do8

    %10
    sib4 fa8 fa8. sol16 lab8 sib4 sib8 sib8. lab16 sol8\mbreak
    fa4 fa8 fa8. sol16 lab8 sib4 sib8 sib4 sib8
    do4 do8 sib4 sib8 do4 do8 do4 do8

    %13
    re4 re8 sib4 sib8 sib4 sib8 sib4 reb8
    do4 do8 do4 mib8 re!4 re8 re4 re8
    mib4 mib8 fa4 fa8 sol4 fa8 mib8. re16 do8

    %16
    sib4 do8 reb8. do16 sib8 do4 re8 mib4 do8
    fa,4 fa8 fa4 fa8\mbreak sol4 sol8 sib4 sib8
    reb4 reb8 reb4 reb8 do4 fa8 re8. do16 sib8

    %19
    lab4 lab8 lab4 lab8 re4. r4 r8
    r r mib sib4 lab8 sol4. fa
    mib'8. fa16 mib8 mib8. re16 do8 sib8.  do16 re8 mib8. fa16 sol8

    %22
    lab8. sol16 fa8 sol8. fa16 mib8 fa8. sol16 fa8 fa4 sol8\mbreak
    fa8. sol16 fa8 fa4 sol8 fa8. sol16 mib8 mib8. fa16 re8
    mib4.\fermata do4 re8 mib4 mib8 mib4 do8

    %25
    fa4 do8 re4 re8 do4 do8 do4 do8
    re8. mib16 re8 re4 fad8 sol4 mib8 re4 fad8\mbreak
    sol8. fa!16 mib8 re4 do8 sib8. do16 sib8 sib4 la8

    %28
    sol4 sib8 re4 re8 sol4 mib8 dod4 dod8
    re4 mib8 do!4 do8 fad8. mi16 re8 sol4 do,8
    sib4 sib8 la4 la8 sol2.

}

IIvlIIn = \relative do'' {

    mib8.^\markup\italic\smaller "pizzicato" fa16 mib8 mib8. re16 do8 sib8. do16 re8 mib8. fa16 sol8
    lab8. sol16 fa8 sol8. fa16 mib8 fa8. sol16 fa8 fa4 sol8
    fa8. sol16 fa8 fa4 sol8 fa8. sol16 mib8 mib8. fa16 re8

    %4
    mib4 mib8 mib8. re16 do8\mbreak sib4 sib8 sol4 sol8
    do8. re16 mib8 sib4 lab8 sol4 sol8 sol4 sol8
    do4 do8 do4 do8 do4 do8 do4 do8

    %7
    mib4 mib8 mib8. re16 do8 re4 la!8 sib4 re8
    sol,4 sol8 sol4 sol8 sol4 sol8 sol4 sol8
    la4 la8 do4 mib8 re4 re8 re4 do8

    %10
    sib4 fa8 fa8. sol16 lab8 sib4 sib8 sib8. lab16 sol8\mbreak
    fa4 fa8 fa8. sol16 lab8 sib4 sib8 sib4 sib8
    do4 do8 sib4 sib8 do4 do8 do4 do8

    %13
    re4 re8 sib4 sib8 sib4 sib8 sib4 reb8
    do4 do8 do4 mib8 re!4 re8 re4 re8
    mib4 mib8 fa4 fa8 sol4 fa8 mib8. re16 do8

    %16
    sib4 do8 reb8. do16 sib8 do4 re8 mib4 do8
    fa,4 fa8 fa4 fa8\mbreak sol4 sol8 sib4 sib8
    reb4 reb8 reb4 reb8 do4 fa8 re8. do16 sib8

    %19
    lab4 lab8 lab4 lab8 re4. r4 r8
    r r mib sib4 lab8 sol4. fa
    mib'8. fa16 mib8 mib8. re16 do8 sib8.  do16 re8 mib8. fa16 sol8

    %22
    lab8. sol16 fa8 sol8. fa16 mib8 fa8. sol16 fa8 fa4 sol8\mbreak
    fa8. sol16 fa8 fa4 sol8 fa8. sol16 mib8 mib8. fa16 re8
    mib4.\fermata do4 re8 mib4 mib8 mib4 do8

    %25
    fa4 do8 re4 re8 do4 do8 do4 do8
    re8. mib16 re8 re4 fad8 sol4 mib8 re4 fad8\mbreak
    sol8. fa!16 mib8 re4 do8 sib8. do16 sib8 sib4 la8

    %28
    sol4 sib8 re4 re8 sol4 mib8 dod4 dod8
    re4 mib8 do!4 do8 fad8. mi16 re8 sol4 do,8
    sib4 sib8 la4 la8 sol2.

}

IIvlan =  \relative do' {

    sib4^\markup\italic\smaller "pizzicato"  sib8 sib4 re8 mib4 fa8 sol8. fa16 mib8
    re4 sib'8 sib do sib sib4 sib8 sib4 mib,8
    sib'4 sib8 sib4 mib,8 sib4 sib8 sib4 sib8

    %4
    sib4 mib8 mib4 mib8 mib4 mib8 mib4 mib8
    lab,4 lab8 sib4 sib8 mib4 mib8 mib4 mib8
    mib4 mib8 mib4 mib8 mib4 mib8 mib4 mib8\mbreak

    %7
    la,?4 la8 la4 la8 sib4 do8 re4 sib8
    do4 do8 do4 do8 sib4 sib8 sib4 sib8
    la4 la8 la4 la8 sib4 sib8 fa'4 fa8

    %10
    sib,4 sib8 sib4 sib8 sib4 sib8 sib4 sib8
    sib4 sib8 sib4 lab8 sol4 mib'8 mib4 mib8
    lab,4 lab8 sol4 sol8 mib'4 mib8 fa4 fa8\mbreak

    %13
    sib,4 sib8 sib4 sib8 sol4 sol8 sol4 sol8
    lab4 lab8 la4 la8 sib4 sib8 lab4 lab8
    sol4 sol8 re'4 re8 mib4 mib8 mib4 mib8

    %16
    mib4 mib8 mib4 mib8 lab,4 lab8 lab4 lab8
    sib4 sib8 sib4 sib8 mib4 mib8 mib4 mib8\mbreak
    mib4 mib8 mib4 mib8 lab,4 lab8 lab4 sol8

    %19
    fa4 fa8 fa4 fa8 sib4. r4 r8
    r r sol sol4 lab8 sib4. sib
    sib4 sib8 sib4 re8 mib4 fa8 sol8. fa16 mib8

    %22
    re4 sib'8 sib do sib sib4 sib8 sib4 mib,8
    sib'4 sib8 sib4 mib,8\mbreak sib4 sib8 sib4 sib8
    sib4.\fermata mib4 re8 do4 do8 do4 do8

    %25
    la4 la8 sib4 sib8 fa'4 fa8 fa4 fa8
    fad4 fad8 re4 do8 sib4 do8 sib4 la8\mbreak
    sol4 do8 sib4 la8 sol4 do8 re4 re8

    %28
    sol,4 sol8 sol4 sol8\mbreak sol4 sol8 mib'4 mib8
    re4 re8 re4 re8 do4 do8 sib4 do8
    re4 re8 re4 re8 sol,2.

}

IIbcn = \relative do {

    mib4^\markup\italic\smaller "pizzicato" mib8 mib4 mib8 mib4 mib8 mib4 mib8
    sib4 sib8 mib4 mib8 sib4 sib8 sib4 la8
    sib4 sib8 sib4 la8 sib4 mib8 sib4 sib8

    %4
    mib4 mib8 mib4 mib8 mib4 mib8 mib4 mib8
    lab,4 lab8 sib4 sib8 mib4 mib8 mib4 mib8\mbreak
    mib4 mib8 mib4 mib8 mib4 mib8 mib4 mib8

    %7
    la,4 la8 la4 la8 sib4 do8 re4 sib8
    do4 do8 do4 do8 sib4 sib8 sib4 sib8
    la4 la8 la4 la8 sib4 sib8 fa'4 fa8

    %10
    sib,4 sib8 sib4 sib8 sib4 sib8 sib4 sib8\mbreak
    sib4 sib8 sib4 lab8 sol4 mib'8 mib4 mib8
    lab4 lab8 sol4 sol8 mib4 mib8 fa4 fa8

    %13
    sib,4 sib8 sib4 sib8 sol'4 sol8 sol4 sol8
    lab4 lab8 la4 la8 sib4 sib8 lab4 lab8
    sol4 sol8 re4 re8\mbreak mib4 mib8 mib4 fa8

    %16
    mib4 mib8 mib4 mib8 lab,4 lab8 lab4 lab8
    sib4 sib8 sib4 sib8 mib4 mib8 mib4 mib8
    mib4 mib8 mib4 mib8 lab4 lab8 lab4 sol8

    %19
    fa4 fa8 fa4 fa8 sib,4. r4 r8
    r r sol'\mbreak sol4 lab8 sib4. sib,
    mib4 mib8 mib4 mib8 mib4 mib8 mib4 mib8

    %22
    sib4 sib8 mib4 mib8 sib4 sib8 sib4 la8
    sib4 sib8 sib4 la8 sib4 mib8 sib4 sib8
    mib4.\fermata mib4 re8 do4 do8 do4 do8

    %25
    la4 la8 sib4 sib8\mbreak fa'4 fa8 fa4 fa8
    fad4 fad8 re4 do8 sib4 do8 sib4 la8
    sol4 do8 sib4 la8 sol4 do8 re4 re8

    %28
    sol4 sol8 sol4 sol8 sol4 sol8 mib4 mib8
    re4 re8 re4 re8 do4 do8 sib4 do8\mbreak
    re4 re8 re4 re8 sol,2.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\minor
    \time 12/8
    \tempo 4. = 60
    s1.*30
    \bar"||"
    \mark\markup\smaller\center-column {"DC a"\fermata}

}

IIob = {
    \IIglobal
    <<\IIobn \forma>>

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}

IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}



IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIobn = \relative do'' {

    sol8 la sib do re4 re
    mib2 re~
    re4 do8 sib do4 la

    %4
    sib la sol2
    sib8 do re mib fa4 sol
    fa re mib do

    %7
    re la sib sib'
    la mib re la'
    sol re do sol'\mbreak

    %10
    fad4 sol8 la do,4 do
    do2. sib8 la
    sib4 la8 sol la4 fad

    %13
    sol do2 sib8 la
    sib4 la8 sol la4 fad
    sol2 r

    %16
    sol8 la sib do re4 re
    mib2 re~
    re4 do8 sib do4 la\mbreak

    %19
    sib la sol2
    R1
    sol8 la sib do re4 re

    %22
    mib2 re~
    re4 do8 sib do4 la
    sib la sol2

    %25
    sib8 do re mib fa4 sol
    fa re mib do
    re la sib2

    %28
    r4 sol' fa mib
    re2 do\mbreak
    sib1~

    %31
    sib
    r4 re8 mib fa4 re
    mib sol, do2

    %34
    r4 do8 re mib4 do
    re4 fa, sib2
    r4 sib8 do re4 sib

    %37
    do fad, la2
    r4 la re la
    sib la8 sol do4 sib8 la\mbreak

    %40
    re4 do8 sib mib4 re8 do
    re1~
    re4 mi8 fad sol4 fa8 mib

    %43
    re4 do sib sol'
    sib,2 la
    sol1~

    %46
    sol
    sol8 la sib do re4 re
    mib2 re~

    %49
    re4 do8 sib do4 la
    sib la sol2
    sib8 do re mib fa4 sol

    %52
    fa re mib do
    re la sib sib'
    la mib re la'

    %55
    sol re do sol'\mbreak
    fad4 sol8 la do,4 do
    do2. sib8 la

    %58
    sib4 la8 sol la4 fad
    sol do2 sib8 la
    sib4 la8 sol la4 fad

    %61
    sol1\fermata
    r4 sib8 la sib4 do
    la2 sib~

    %64
    sib4 do8 re mib4 do
    re2 do
    r4 sib8 la sib4 do

    %67
    la2 sib~
    sib4 do8 re mib4 do
    re2 do

    %70
    r4 re8 do re4 do\mbreak
    si4 sol sol' re
    mib re do2~

    %73
    do4 si do la
    si1
    do

    %76
    r4 mi8 re mi4 re
    dod la la' mi
    fa mi re2~

    %79
    re4 dod re si\mbreak
    dod2 re
    re1

}

IIIvlIn =  \relative do'' {

    sol8 la sib do re4 re
    mib2 re~
    re4 do8 sib do4 la

    %4
    sib la sol2
    sib8 do re mib fa4 sol
    fa re mib do

    %7
    re la sib sib'
    la mib re la'
    sol re do sol'\mbreak

    %10
    fad4 sol8 la do,4 do
    do2. sib8 la
    sib4 la8 sol la4 fad

    %13
    sol do2 sib8 la
    sib4 la8 sol la4 fad
    sol1

    %16
    R1*31
    sol8 la sib do re4 re
    mib2 re~

    %49
    re4 do8 sib do4 la
    sib la sol2
    sib8 do re mib fa4 sol

    %52
    fa re mib do
    re la sib sib'
    la mib re la'

    %55
    sol re do sol'\mbreak
    fad4 sol8 la do,4 do
    do2. sib8 la

    %58
    sib4 la8 sol la4 fad
    sol do2 sib8 la
    sib4 la8 sol la4 fad

    %61
    sol1\fermata
    R1*20

}

IIIvlIIn = \relative do'' {

    sol8 la sib do re4 re
    mib2 re~
    re4 do8 sib do4 la

    %4
    sib la sol2
    sib8 do re mib fa4 sol
    fa re mib do

    %7
    re la sib sib'
    la mib re la'
    sol re do sol'\mbreak

    %10
    fad4 sol8 la do,4 do
    do2. sib8 la
    sib4 la8 sol la4 fad

    %13
    sol do2 sib8 la
    sib4 la8 sol la4 fad
    sol1

    %16
    R1*31
    sol8 la sib do re4 re
    mib2 re~

    %49
    re4 do8 sib do4 la
    sib la sol2
    sib8 do re mib fa4 sol

    %52
    fa re mib do
    re la sib sib'
    la mib re la'

    %55
    sol re do sol'\mbreak
    fad4 sol8 la do,4 do
    do2. sib8 la

    %58
    sib4 la8 sol la4 fad
    sol do2 sib8 la
    sib4 la8 sol la4 fad

    %61
    sol1\fermata
    R1*20

}

IIIvlan =  \relative do' {

    sol'4. la8 sib4 sib
    do4 do2 sib4~
    sib la8 sol8 la4 fad

    %4
    sol fad sol2
    fa!8 do' sib sib  sib4 sib
    sib sib2 la4

    %7
    sib do, re mib~
    mib la2 re,4~
    re sol2 do,4

    %10
    re mi fad sol\mbreak
    la sol fad re~
    re do8 sib do4 la

    %13
    sib la'2 sol8 fad
    sol4 do,8 sib do4 la
    sib1

    %16
    R1*31
    sol'4. la8 sib4 sib
    do4 do2 sib4~

    %49
    sib la8 sol8 la4 fad
    sol fad sol2
    fa!8 do' sib sib sib4 sib

    %52
    sib sib2 la4
    sib do, re mib~
    mib la2 re,4~

    %55
    re sol2 do,4
    re mi fad sol\mbreak
    la sol fad re~

    %58
    re do8 sib do4 la
    sib la'2 sol8 fad
    sol4 do,8 sib do4 la

    %61
    sib1\fermata
    R1*20

}

IIIbcn = \relative do {

    sol'2. sol4
    do la sib la8 sol
    fad2 re

    %4
    sol sol,
    re'2. mib4
    re2 do

    %7
    sib2. sol'4
    fad2 fa\mbreak
    mi mib

    %10
    re2. mi4
    fad mi re fad
    sol sol, re' re,

    %13
    sol fad' re2
    sol4 sol, re' re,
    sol1

    %16
    sol'2 sib4 sol
    do la sib la8 sol
    fad2 re

    %19
    sol,1
    sol'8 la sib do re4 re,
    sol2. sol4

    %22
    do la sib la8 sol\mbreak
    fad2 re
    sol,1

    %25
    re'2. mib4
    re2 do
    sib2. re4

    %28
    mib2. mib4
    fa2 fa,\mbreak
    sib4 sib' fa re

    %31
    sib1
    si2. si4
    do2. do'8 sib

    %34
    la4 la, r la'
    sib2 r4 sib8 la
    sol4 sol, r sol'

    %37
    la2 r4 la8 sol \mbreak
    fad2. re4
    sol sol, la' la,

    %40
    sib' sib, do' la
    sib la8 sol fad4 mi
    re do sib do

    %43
    re2 sol4 sol,\mbreak
    re'2 re,
    sol4 sol' re sib

    %46
    sol1
    sol'2. sol4
    do la sib la8 sol

    %49
    fad2 re
    sol sol,
    re'2. mib4

    %52
    re2 do
    sib2. sol'4
    fad2 fa\mbreak

    %55
    mi mib
    re2. mi4
    fad mi re fad

    %58
    sol sol, re' re,
    sol fad' re2
    sol4 sol, re' re,

    %61
    sol1\fermata
    sol'2. mib!4
    fa2 re

    %64
    do2. fa4
    sib,2 fa'
    sol2. mib4

    %67
    fa2 re
    do2. fa4\mbreak
    sib,2 fa'

    %70
    fad2. re4
    sol2 si,
    do2. re4

    %73
    mib2. fa4
    sol2 sol,
    do4 do'8 sib do4 sib\mbreak

    %76
    la2. sib4
    la2. dod,4
    re2. mi4

    %79
    fa2. sol4
    la2 la,
    re1

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\minor
    \time 2/2
    \tempo 1 = 60
    s1*60\once \override Score.RehearsalMark.extra-offset = #'(+4 . 1.5)
    \mark\markup "Fine"
    s1\break
    s1*20
    \bar"||"
    \mark\markup\smaller\center-column {"DC a"\fermata}

}

IIIob = {
    \IIIglobal
    <<\IIIobn \forma>>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}




%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller {"Concerto a 5 con Oboe in Sol minore"}
    composer = \markup \center-column {"A. Lotti (1667-1740)"}
}

\markup\huge "[1. Allegro] [Quegl'occhi amabili - Giove in Argo]"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff   <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"Oboe"}
            \set Staff.shortInstrumentName = "ob "
            \Iob
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1 "
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2 "
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.shortInstrumentName = "bc "
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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

\markup\huge "[2.] Largo [Vile e debole il cuor da te non chiede - Ascanio]"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff   <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"Oboe"}
            \set Staff.shortInstrumentName = "ob "
            \IIob
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"pizzicato strings"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1 "
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"pizzicato strings"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2 "
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"pizzicato strings"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"pizzicato strings"
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.shortInstrumentName = "bc "
            \IIbc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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

\markup\huge "[3.] Presto [Agitata da spaventi - Ascanio]"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff   <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"Oboe"}
            \set Staff.shortInstrumentName = "ob "
            \IIIob
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1 "
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2 "
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.shortInstrumentName = "bc "
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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

