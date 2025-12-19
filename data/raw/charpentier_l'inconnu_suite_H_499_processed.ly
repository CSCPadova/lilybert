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
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

Idsn =  \relative do'' {

   sol'1
   r8 sol fa\prall mi fa2~
   fa4 sol8 fa mi2

   %4
   r8 fa mi fa re4.\prall re8
   re4 mi8 re do2
   r8 re do re si4.\downprall la16 si

   %7
   do4 re mi fa
   sol fa8 mi re4 mi
   fa sol la2\mbreak

   %10
   r8 re, mi fad sol2~
   sol4 la8 sol fad4. mi16 fad
   sol4 si, do re

   %13
   mi fa8[mi fa mi re do]
   si4 sol do4. do8
   do4 re mi4. fa8

   %16
   re1 re
   re4. re8 mi4
   fa4. fa8 sol4\mbreak

   %19
   la re,4. mi8
   dod2 dod4
   la'4. la8 sol4\prall

   %22
   fa4. fa8 sib la
   sol\prall fa mi4.\prall re8
   re2.

   %25
   re4. re8 re4
   mi2 mi4
   fad sol4. la8

   %28
   fad2 fad4
   re4. re8 re4
   re4. re8 mib re\mbreak

   %31
   do\prall sib la4.\prall sol8
   sol2.~sol
   r4 sol' fa mi4. fa8 sol4

   %34
   do, re mi fa mi fa
   re re re sol2.
   r4 mi mi fa fa fa

   %37
   fa mi8 re mi4 fa8 mi re4.\prall do8\mbreak
   do2.~do4 do sib
   la4. sib8 do4 fa, fa' mi

   %40
   re4. mi8 fa4 si, si si
   mi2. r4 do do
   fa4. sol8 la4 re, mi fa

   %43
   mi4. mi8 la4 sol sol4.\prall fa8\mbreak
   fa4 la sol fa4. sol8 la4
   re, mi fad sol do,4. re8

   %46
   si2. r4 sol' fa
   mi4. fa8 sol4 do, re mi
   fa4. mi8 fa4 re mi fa

   %49
   sol4. fa8 sol4\mbreak mi fa sol
   la4. sol8 fa4 mi re do
   sol'4. mi8 fa mi re do si4. do8

   %52
   do2 mi4. mi8
   mi2 re4. re8
   re2 do~

   %55
   do4 si si4.\prall la8\mbreak
   la2 r8 mi' fa sol
   la2~la4. la8

   %58
   la2 sol4. sol8
   sol2 fa~
   fa4 fa mi fad8 sol

   %61
   fad4 re sol4. sol8
   sol4 la8 sib fad4. sol8
   sol2 fa?

   %64
   r8 mi fa sol re4. do8\mbreak
   si4 do re4. mi8
   fa4 sol re4. do8

   %67
   do1

}

Ihcn = \relative do'' {

   do2 re4. mi8
   do2 r8 mi re do
   si2. do8 si

   %4
   la4. la8 si2
   sol2. sol4
   la2 sol4. sol8

   %7
   sol2 do4 si
   do re8 do si4 dod
   re do?8 si la la si do\mbreak

   %10
   re4. do8 si2
   do4. si8 do4. re8
   si4 sol la si

   %13
   do2 do4 la
   sol2 sol4. sol8
   la4 si do4. re8

   %16
   si1 si
   si4. si8 dod4
   re4. re8 do?4\mbreak

   %19
   do sib4. sib8
   la2 la4
   do4. do8 sib4

   %22
   sib re8 do sib4~
   sib8 sib la4. la8
   la2.

   %25
   sib4. do8 re4
   do2 do4
   do sib4. sib8

   %28
   la2 la4
   la4. la8 la4
   la sol sol\mbreak

   %31
   sol4. la8 fad4
   sol4 re' do si4. do8 re4
   sol,4. la8 si4 do do sib

   %34
   la si? do re do re
   si si si mi2.
   r4 do do re do re

   %37
   si4. si8 do4 re8 do si4.\prall do8\mbreak
   do4 mi, mi la2 sol4
   fa2 mi4 re fa sol

   %40
   la2 la4 sol2.
   r4 si si la2.
   r4 do do sib2 do4

   %43
   do4. do8 do4 re do4. sib8\mbreak
   la4 la la re4. re8 la4
   si2 la4 sol mi la

   %46
   sol la si do4. re8 si4
   do4. si8 do4 la si do
   re re do si4. do8 re4

   %49
   sol, la si\mbreak do2.
   do2 si4 la2 la4
   si4. sol8 la4 la sol4. sol8

   %52 OOKK
   sol2 do4.do8
   si2 si4. si8
   si2 la~

   %55
   la4 la8 si sold4. la8\mbreak
   la2 la4 sib
   do2 do4. sib8

   %58
   la2. la4
   la2. sib4
   la2. la4

   %61
   la2 sol4 si
   do4. si8 la4 re8 do
   si2 si4. si8

   %64
   do4 si la4. la8\mbreak
   sol4 la si4. dod8
   re4 do? si4. do8

   %67
   do1

}

Itln =  \relative do' {

    mi2 re
    mi8 mi re do re4. re8
    re2 sol

    %4
    do, re4. re8
    mi2. mi4
    fa8 fa mi fa re4. sol8

    %7
    mi4 fa sol fa
    mi la sol2
    la2. la4\mbreak

    %10
    la2 re,4. re8
    mi2 la
    re,4 re mi fa

    %13
    sol la8[sol la sol fa mi]
    re4 si mi4. mi8
    fa2 sol4. sol8

    %16
    sol2 r8 la sol fa sol1
    sol4. sol8 sol4
    la4. la8 sol4\mbreak

    %19
    la sol4. fa8
    mi2 mi4
    fa4. fa8 mi4

    %22
    re4. re8 sol fa
    mi4 mi4. la8
    fad2.

    %25
    fa!4. fa8 fa4
    sol2 sol4
    la re,4. re8

    %28
    re2 re4
    re4. re8 do4
    do sib4 sib\mbreak

    %31
    la4. \once\set suggestAccidentals = ##t sib?8 do4
    si?2. r4 sol' fa
    mi4. fa8 sol4 do, re mi

    %34
    fa2. r4 re re
    sol2. r4 mi mi
    la2. r4 fa fa

    %37
    sol4. sol8 do,4 fa sol sol,\mbreak
    do2.~do4. re8 mi4
    do2. sib

    %40
    la2 re4 re re re
    sol2. r4 mi mi
    la sol la fa sol la

    %43
    sol4. sol8 fa4 fa mi4. fa8\mbreak
    fa4 fa mi re re re
    sol4. mib8 re4 re do re

    %46
    re mi fa sol2 sol4
    sol2 sol4 fa2 sol4
    la sol la sol2 re4

    %49
    mi mi re\mbreak do4. re8 mi4
    la, fa'8 mi re4 do2 do4
    re4. do8 do4 fa8 mi re4. mi8

    %52 OOKK
    mi2 sol4. fa8
    mi2. mi4
    mi2. fa4

    %55
    mi2 r8 mi re mi\mbreak
    dod2 r8 do re mi
    fa2~fa4. fa8

    %58
    mi2 mi4. mi8
    mi2 re~
    re4 re8 mi dod4. re8

    %61
    re2. re4
    mi2 re4. re8
    re2 re

    %64
    mi4 re re4. re8\mbreak
    re4 sol sol4. sol8
    la4 sol8 la sol4. fa8

    %67
    mi1

}

Ibcn = \relative do {

   do4. do'8 si4. do8
   la2 r8 do si la
   sol2. la8 sol

   %4
   fa2 r8 sol fa sol
   mi2. fa8 mi
   re2 sol4 sol,

   %7
   do2 do4 re
   mi fa sol fa8 mi
   re4 mi fa8 fa sol la\mbreak

   %10
   sib2. sib4
   la1
   sol4 fa mi re

   %13
   do2 fa~
   fa4 sol8 fa mi4 do
   fa2 do

   %16
   sol4 sol'8 la sol fa mi re sol,1
   sol'4. fa8 mi4
   re4. re8 mi4\mbreak

   %19 OOKK
   fa sol4. sol8
   la4. la8 sol4\prall
   fa4. fa8 sol la

   %22
   sib4. la8 sol4
   sol la la,
   re2.

   %25
   sib2 sib4
   sib2.
   la4 sib sol

   %28
   re' do8 sib la sol
   fad2.
   sib2 do4~\mbreak

   %31
   do re2
   sol,2.~sol
   R1.*5

   %38
   r4 do' sib la4. sib8 do4
   fa,4 sol la sib re, mi
   fa4. mi8 re4 sol2.

   %41
   r4 mi mi la2.
   r4 fa fa sib2 fa4
   do'4. sib8 la4 sib do do,\mbreak

   %44
   fa2. r4 re do
   si?4. do8 re4 sol, la fad
   sol sol' fa mi4. fa8 sol4

   %47
   do, re mi fa2 mi4
   re mi fa sol2 fa4
   mi fa sol\mbreak la4. la8 sol4

   %50
   fa2 sol4 la2.
   sol4. do,8 fa4 fa sol sol,
   do2 r8 do' si la

   %53
   sold2. sold4
   do,2. re4
   mi2 mi,\mbreak

   %56
   la la'4 sol
   fa2 r8 fa mi re
   dod2. dod4

   %59
   fa,2. sol4
   la1
   sib2. sol4

   %62
   do2 re4 re,
   sol1
   sol'2 fad\mbreak

   %65
   sol fa4. mi8
   re4 mi8 fa sol4 sol,
   do1

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \repeat volta 2 {s1*15}
  \alternative {{s1}{s}}\break\set Score.currentBarNumber = #17
  \bar "||"
  \time 3/4
  \tempo 2. = 65
  s2.*15\break
  \time 6/4
  \tempo 1 = 50
  s1.*20\break
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  s1*16
  \bar"|."


}

Ids = {
  \Iglobal
  %\notypeset
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
  \typeset

}

IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIdsn =  \relative do'' {

    do4. re8 mi4 re8 do
    sol'2. r16 mi fa sol
    la[sib la sol fa sol fa mi re mi fa mi re mi re do]

    %4
    si4. la8 sol4 r16 sol la si
    do4. do8 do2~
    do4 r16 si do re mi4 r16 re do si\mbreak

    %7
    la4. la8 re16[dod re mi fa mi fa sol]
    dod,4. la'8 sol4\prall fa8 mi
    fa4. re8 sol4. fa8

    %10
    mi4. mi8 fad4. fad8
    sol4 si,8 do la4. sol8
    sol1 sol2. r8 re'

    %13
    si8 la si sol re' mi re do
    si2. mi8 fa
    sol4. mi8 la sol fa mi

    %16
    re mi fa sol mi4. re8
    do4. do8 fa4. fa8
    sol4 la8 sib sol4.\prall fa8

    %19
    fa4. la8 mi4. fa8
    sol4 fa8\prall mi re4. mi8\mbreak
    fa4 mi re4. re8

    %22
    sol4 fa8 mi re4.\prall do8
    do2.

}

IIhcn = \relative do'' {

    sol4. sol8 do4 sol8 la
    si4. si8 do2~
    do4 r16 re do si la4. la8

    %4
    sol2 re4. re8
    sol4. sol8 sol4 r16 mi fa sol
    la4 r16 sol la si do4 sol\mbreak

    %7
    fa fa8 sol la4. la8
    la2. la4
    la2 sol4. sol8

    %10
    sol4. sol8 la4. la8
    la4 sol8 la fad4. sol8
    sol4 re mi fa sol2. r8 sol

    %13
    sol2 la4. la8
    sol2 r8 sol la si
    do4. do8 do4. do8

    %16
    sib4. la8 sol4. sol8
    la sol la sib do4. do8
    do4 do do4. sib8

    %19
    la4 la8 si? do4 si8 la
    sol4 la sol4. sol8\mbreak
    la4 sol sol4. sol8

    %22
    sol4 la sol4. fa8
    mi2.

}

IItln =  \relative do' {

    mi4. fa8 sol4 fa8 mi
    re4 r16 si do re mi4. mi8
    fa16[mi fa sol la sib la sol fa sol la sol fa sol fa mi]

    %4
    re4. do8 si4 r16 si do re
    mi4. mi8 mi4. mi8
    fa2 sol4. sol8\mbreak

    %7
    do,4. do8 fa16[sol fa mi re8. re16]
    mi4 dod8 re mi4 dod
    re la re4. re8

    %10
    do?4. do8 do4. do8
    re4 mi re4. do8
    si4 si do re si2. r8 si

    %13
    si2 la4 re
    re2 r8 si do re
    mi4. mi8 fa sol la sol

    %16
    fa mi re mi do4. do8
    fa mi fa sol la4. la8
    sol4 fa8 sol mi4. fa8

    %19
    fa4. fa8 do4. re8
    mi4 re8 do si4. do8\mbreak
    re4 do si4. si8

    %22
    mi4 re8 do si4. do8
    do2.

}

IIbcn = \relative do {

    do2 do'
    si4 la8 sol do2
    fa,1

    %4
    fa2. fa4
    mi4. re8 do4 r16 do re mi
    fa2 mi\mbreak

    %7
    fa re
    la'4 la,8 si dod4 la
    re re8 do? si4 sol

    %10
    do4. si8 la4. la8
    si4 do re re,
    sol sol'8 fa mi4 re sol,2. r8 sol'

    %13
    sol2 fad
    sol8[la sol fa mi fa mi re]
    do2 fa

    %16
    sib, do4 do'8 sib
    la sib la sol fa4. fa8
    mi4 fa do2

    %19
    fa,4 fa'8 sol la4 sol8 fa
    mi4 fa sol fa8 mi\mbreak
    re4 mi fa2

    %22
    mi4 fa sol sol,
    do2.

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 65
  \repeat volta 2 {s1*11}
  \alternative {{s1}{\time 2/2 s2. }} \bar ".|:"
  \tempo 2 = 60 s4 \set Score.currentBarNumber = #13
  s1*10
  s2.
  \bar ":|."

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

IIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIIdsn =  \relative do'' {

    r8 do
    do[sol la si do si do re]
    mi[re mi do sol' re mi fa]
    mi[fa mi fa sol fa sol mi]

    %4
    la[la, si do re mi re la]
    si re mi fa sol4. sol8
    do,4. do8 fa4. fa8

    %7
    re4. re8\mbreak sib'4. sib8
    sib2. r16 mi, fa sol
    la8[sib la sib sol la sol la]

    %10
    fad2. r16 re mi fad
    sol4. \once\set suggestAccidentals = ##t fa?8 mib4. re8
    do4. sib8 la4. re8

    %13
    si?2. r8 do si2. r16 do si do\mbreak
    re8[do si la sol sol' fa sol]
    mi2. r16 mi fa sol

    %16
    la2. r16 sol fa mi
    re8[do re mi fa mi fa re]
    sol[la sol fa mi fa mi re]

    %19
    dod4. la8 fa'4. fa8
    sol4. la8 mi4. re8
    re2. r16 mi re do?\mbreak

    %22
    si2. r16 do si la
    sol4. re'8 mi4. fa8
    sol2 mi4. mi8

    %25
    fa4. sol8 re4. do8
    do2.

}

IIIhcn = \relative do'' {

    r8 sol
    sol mi fa sol la4. la8
    sol4 do re4. re8
    do4. do8 do4. do8

    %4
    do4 fa,8 sol la4. la8
    sol4. la8 si4. si8
    la sol la sib do4. do8

    %7
    sib4. do8\mbreak<<{s4. re8
                       do2}\\{re8 do sib la
                              sol4 r16 sol la sib}>> do4. do8
    do4 re~re dod

    %10
    re2 la4. la8
    si4 re do4. do8
    sol4 la fad4. sol8

    %13
    sol2. r8 sol sol2. r16 la sol la\mbreak
    si4 sol~sol sol
    sol8 si do re sol,4 la8 sib

    %16
    do4. do8 re4. do8
    sib la sib do re4. do8
    sib [do sib la sol la sol fa]

    %19
    mi4 la la4. la8
    sib4 sib la4. sol8
    fad[mi fad sol la sol la fad]\mbreak

    %22
    sol4 r16 sol fa? mi re4. re8
    mi4. fa8 sol4. la8
    si4 si do4. si8

    %25
    la4 sol8 la sol4. sol8
    mi2.

}

IIItln =  \relative do' {

    r8 mi
    mi2 mi4. re8
    do4 sol' sol4. sol8
    sol la sol fa mi re mi sol

    %4
    fa do re mi fa sol fa mi
    re si do re mi4. mi8
    mi4. mi8 la4. la8

    %7
    fa4. fa8\mbreak sol4. fa8
    mi[fa mi re do re mi do]
    fa4 re mi8 fa sol mi

    %10
    la[sib la sol fad sol fad mi]
    re4 sol sol4. fa?8
    mib4 mib re4. re8

    %13
    re2. r8 mi re2. r8 re\mbreak
    sol4 re re4. re8
    do2. r16 do re mi

    %16
    fa2 fa4. fa8
    fa2 sib,4. do8
    re4. do8 sib4 sib

    %19
    la \once\set suggestAccidentals = ##t sib?8 dod re4. re8
    re4. mi8 dod4. re8
    re2. re4\mbreak

    %22
    re r16 mi re do si?4. si8
    do4 si do mi
    re sol sol8 fa mi re

    %25
    do4 do8 re si4. do8
    do2.

}

IIIbcn = \relative do {

    r8 do
    do4. si8 la sol la si
    do2 si
    do8 si do re mi4. do8

    %4
    fa4. mi8 re2
    sol4. fa8 mi fa sol mi
    la sib la sol fa sol la fa

    %7
    sib do sib la\mbreak sol la sib sol
    do[re do sib la sib la sol]
    fa2 mi

    %10
    re8[do re mib re mib re do]
    si!2 do4. re8
    mib4 do re re,

    %13
    sol sol'8[la sol fa mi re] sol,2. r8 sol'\mbreak
    sol2 si,
    do8[sol' la si do sib la sol]

    %16
    fa[sol fa mi re fa sol la]
    sib2. r16 do sib la
    sol1

    %19
    la8[sol fa mi re do sib la]
    sol2 la
    re,4 re'8 mi fad mi fad re

    %22
    sol2 fa
    mi4. re8 do2
    si4 sol do4. do8

    %25
    fa,4 mi8 fa sol2
    do2.

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \tempo 1 = 50
      \partial 4 s4
  \repeat volta 2 {s1*12}
  \alternative {{s1}{s2.}}\break \bar ".|:" s4 \set Score.currentBarNumber = #14
      s1*12
      s2.
  \bar ":|."

}

IIIds = {
  \IIIglobal
  %\notypeset
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
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}

IVglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IVtpIn =  \relative do'' {

    do8 [do16 re mi8 mi16 fa]
    sol8[sol16 fa mi8 mi16 re]
    do8[sol' sol sol]

    %4
    la[la16 sol fa sol fa mi]
    re8[sol, sol sol]
    do[sol'16 la sol fa mi re]

    %7
    mi8[mi16 fa sol fa sol mi]
    la8[la16 la la8 la]
    fa[fa16 sol la8 sol16 fa]\mbreak

    %10
    mi8[mi16 mi mi8 fa]
    sol[la16 sol la sol fa mi]
    re8[sol, sol sol]

    %13
    do[do sol8. do16]
    do8[re16 mi fa re sol fa]
    mi8[fa16 mi re8. do16]

    %16
    do2

}

IVtpIIn = \relative do'' {

    r4 do8 do16 re
    mi8[mi16 fa sol8 sol16 fa]
    mi8 mi16 re do8 do

    %4
    fa16[sol fa mi re8 re]
    sol,]sol'16 la sol fa mi re]
    mi8[do sol sol]

    %7
    do[do16 re mi re mi do]
    fa8[fa16 fa fa8 fa]
    re8[re16 mi fa8 mi16 re]\mbreak

    %10
    do8[do16 do do8 re]
    mi[fa16 mi  fa mi re do]
    sol8[re'16 mi fa re sol fa]

    %13
    mi8[fa16 mi re8. do16]
    do8[sol sol sol]
    do[do sol8. do16]

    %16
    do2

}

forma = {

  \key do\major
  \time 4/8
  \tempo 2 = 40
  s2*16
  \bar"|."


}

IVtpI = {
  \IVglobal
  %\notypeset
  <<\IVtpIn \forma>>

}

IVtpII = {
  \IVglobal
  <<\IVtpIIn \forma>>
  \typeset

}

Vglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

Vdsn =  \relative do'' {

    sol'8 sol16 sol sol8 sol mi4 do
    sol'4. fa8 mi8. mi16 re8. do16
    si8. la16 sol8. sol16 do8. do16 re8. mi16

    %4
    fa8. fa16 re8. re16 sol4 mi8. mi16
    la4 fad8. fad16 si8. la16 la8. sol16\mbreak
    sol1 sol2.

    %7
    re4 re mi
    fa fa8 mi fa sol
    la4 la,8 sol la si

    %10
    do4 do8 mi re fa
    mi4 mi8 re mi fa
    sol4 fa4. mi8

    %13
    re4 sol do,\mbreak
    si sol'8. [sol16 sol8. sol16]
    do8. [do16 sol8. sol16 mi8. mi16]

    %16
    do8. [do16 fa8. fa16 re8. re16]
    mi8. fa16 re4. do8
    do2.

}

Vhcn = \relative do'' {

    do8 do16 do do8 do do4. la8
    si4 si do8. sol16 la8. la16
    sol4. sol8 sol8. la16 si8. do16

    %4
    re8. re16 si8. si16 si4 do8. si16
    la4 la8. la16 re8 do16 si do8. re16\mbreak
    si8 re16 re re8 re si4 sol si2.

    %7
    si4 si dod
    re4. do?8 si4
    la4. sol8 fa4

    %10
    mi la la
    sol do do
    si do4. re8

    %13
    si4 sol fad\mbreak
    sol si8. [si16 si8. si16]
    mi8.[mi16 mi8. mi16 do8. sol16]

    %16
    la8.[la16 do8. do16 si8. si16]
    do8. do16 si4. do8
    do2.

}

Vtln =  \relative do' {

    mi8 mi16 mi mi8 fa sol4 mi
    re sol sol8 sol fa8. mi16

    %3
    re8. do16 si8. si16 mi8 sol fa8. sol16
    la8. la16 sol4 sol8. sol16 la8. mi16
    fa8. la,16 re8. re16 sol8 fa16 mi re8. re16\mbreak

    %6
    re8 si16 si si8 do re4 do8. re16 re2.
    sol4 sol sol
    la la sol

    %9
    fa4. mi8 re4
    do do re
    do sol' fa

    %12
    mi sol sol
    sol si, la\mbreak
    re re8. [re16 sol8. sol16]

    %15
    sol8 [sol do do] sol do,16 re
    mi8.[mi16 la8. la16 sol8. sol16]
    sol8 sol sol4. fa8

    %18
    fa2.

}

Vbcn = \relative do {

    do2 do'8 do16 do do8 do
    si4 sol do fa,
    sol4. fa8 mi4 fa8. mi16

    %4
    re8. re16 sol4 mi8. mi16 la4
    fa8. mi16 re8. do16 si8. do16 re8. re,16
    sol2 sol'8 sol16 fa mi fa mi re sol,2.

    %7
    sol'
    re4 re mi
    fa fa sol

    %10
    la la, si
    do do re
    mi mi8 re mi fa

    %13
    sol4 sol la\mbreak
    sol sol8. [sol16 mi8. mi16]
    do4 do'8. [do16 do8. do16]

    %16
    la8.[la16 fa8. fa16 sol8. sol16]
    do,8. do16 sol4. do8
    do2.

}

Vbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 50
  \repeat volta 2 {s1*5}
  \alternative {{s1}{\time 3/4 \tempo 2. = 55 s2.}}\set Score.currentBarNumber = #7
  \bar "||"
  s2.*12
  \bar"|."

}

Vds = {
  \Vglobal
  %\notypeset
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
  \typeset

}

VIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

VIobIn =  \relative do'' {

    mi4. re8 mi4. fa8
    sol2 mi
    la fa

    %4
    sol mi
    mi4. re8 mi4. fa8
    mi4. fa8 mi4. fa8

    %7
    sol2 la
    re,1
    re4. do8 re4. mi8

    %10
    re2 si
    mi do\mbreak
    re si

    %13
    mi4. fa8 mi4. re8
    do2 si4. do8
    la2 re4. do8

    %16
    si1
    re2 re4. mi8
    fa2 mi4. re8

    %19
    do4. re8 re4.\downprall do16 re
    mi4. fa8 fa4. \prall mi16 fa\mbreak
    sol2. mi4

    %22
    la4. sol8 fa4. mi8
    re2 mi4. fa8
    mi2(re4.\prall) do8

    %25
    do1\fermata

}

VIobIIn = \relative do'' {

    do4. si8 do4. re8
    mi2 do
    fa re

    %4
    mi do
    do4. si8 do4. re8
    do4. re8 do4. re8

    %7
    mi4. mi8 re4. do8
    si1
    si4. la8 si4. do8

    %10
    si2 sol
    do la\mbreak
    si sol

    %13
    do4. re8 do4. si8
    la2 sol~
    sol4 la fad4. sol8

    %16
    sol1
    si2 si4. dod8
    re2 do4. si8

    %19
    la4. si8 si4.\downprall la16 si
    do4. re8 re4.\prall do16 re\mbreak
    mi2. do4

    %22
    fa4. mi8 re4. do8
    si2 do~
    do4 re si4. do8

    %25
    do1\fermata

}

VIbcn = \relative do {

    do'2 do4. do8
    do2 do
    fa, fa

    %4
    do do
    do' do4. do8
    do1

    %7
    mi,2 fa
    sol4. fa8 sol4. la8
    sol1

    %10
    sol2 sol
    do, do\mbreak
    sol'4. la8 sol4. fa8

    %13
    mi2 mi
    fad sol
    re re,

    %16
    sol1
    sol'2 fa4. mi8
    re2 mi

    %19
    fa4. mi8 re2
    do1\mbreak
    do'4. sib8 la4. sol8

    %22
    fa2. re4
    sol4. fa8 mi4. re8
    do4. fa,8 sol2

    %25
    do,1\fermata

}

forma = {

  \key do\major
  \time 2/2
  \tempo 1 = 50
  s1*25
  \bar"|."

}

VIobI = {
  \VIglobal
  %\notypeset
  <<\VIobIn \forma>>

}

VIobII = {
  \VIglobal
  <<\VIobIIn \forma>>

}

VIbc = {
  \VIglobal
  \clef bass
  <<\VIbcn \forma>>
  \typeset

}

VIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

VIIdsn =  \relative do'' {

    sol'4
    mi4. re8 do4
    re mi4.\prall fa8
    mi4. fa8 sol4

    %4
    sol la8 sol fa mi
    re4.\prall re8 sol4
    fa8\prall mi re4. do8

    %7
    do4. sol'8 do4
    la sib la8 sol
    fad4. mi8 fad re\mbreak

    %10
    sol4 sol4. fad8
    sol2 re4
    dod re4. mi8

    %13
    fa4 fa4.\downprall mi16 fa
    sol4 sol4.\downprall fa16 sol
    la4 sol4.\prall la8

    %16
    fa4 mi4.\prall re8
    re4. mi8 fa4
    mi fa8 mi re do\mbreak

    %19
    sol'4. re8 mi fa
    sol la re,4.\prall do8
    do2

}

VIIhcn = \relative do'' {

    do4
    sol4. sol8 la4
    sol sol4. sol8
    sol4. sol8 do4

    %4
    la4. la8 re4
    si4. si8 do4
    la sol4. sol8

    %7
    sol4 do4. do8
    do4 re do8 sib
    la4. la8 la4\mbreak

    %10
    sib la4. re8
    si?2 si4
    la si4. dod8

    %13
    re4 la sib
    do4 do4. do8
    do4 re4. re8

    %16
    dod re dod4. re8
    re2 re4
    do4. sol8 sol la\mbreak

    %19
    si4. si8 do re
    mi do si4. do8
    do2

}

VIItln =  \relative do' {

    mi4
    do4. re8 mi4
    re re4. re8
    do2.

    %4
    do4 fa4. fa8
    fa4 re mi
    re re4. sol8

    %7
    mi4. fa8 sol4
    fa fa mib
    re2 re4\mbreak

    %10
    re re4. re8
    re2 re4
    mi fa sol

    %13
    la4. sol8 fa4
    mi mi4. mi8
    fa4 re4. re8

    %16
    la' si la4. sol8
    fad4 sol2
    sol4 do,4. do8\mbreak

    %19
    re4. re8 do si
    do la sol4 sol'8 fa
    mi2

}

VIIbcn = \relative do {

    do4
    do2 do4
    si2.
    do4. re8 mi4

    %4
    fa2 re4
    sol4. fa8 mi4
    fa sol sol,

    %7
    do4. re8 mi4
    fa sib, do
    re8 mib re do sib la\mbreak

    %10
    sol4 re' re,
    sol2 sol'4
    sol fa4. mi8

    %13
    re2.
    do
    fa4 sib4. sib8

    %16
    la sol la4 la,
    re4. do8 si?4
    do4. do8 si la\mbreak

    %19
    sol4 sol'8 fa mi re
    do fa, sol4. sol8
    do2

}

VIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 3/4
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 50
  \partial 4 s4
  s2.*10
  s2 \bar ":..:" s4
  s2.*9
  s2
  \bar":|."


}

VIIds = {
  \VIIglobal
  %\notypeset
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
  \typeset

}

VIIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

VIIIdsn =  \relative do'' {

    la'8 sol
    fa mi re4 mi4. re8
    dod4. dod8 re4 mi
    fa8 mi re4 do4. sib8

    %4
    la4 la2 mi'8 mi
    fa4. sol8 sol4.\downprall fa16 sol
    la2. mi4

    %7
    la fad sol4. la8\mbreak
    sib4 sib sol8 la sib sol
    la4 sib8 la sol4.\prall fa8

    %10
    mi2. do'8 sib
    la4. sol8 sol4.\prall fa8
    fa2. la,4

    %13
    re do do4. re8
    si4 si2 sol'8 sol
    sol4 fa8 mi mi4. re8

    %16
    re2. la4
    re do do4. re8
    si4 si2 sol'8 sol

    %19
    sol4 fa8 mi mi4. re8
    re1

}

VIIIhcn = \relative do'' {

    re4
    la sib sib4. sib8
    la4. la8 si?4 dod
    re la sol4. sol8

    %4
    fa4 fa2 la4
    la la re4. mi8
    dod2. dod4

    %7
    dod la re4. re8\mbreak
    re4 re do?4. do8
    do4 re re4. re8

    %10
    do2. do4
    do re do4. si8
    la2. la4

    %13
    sol sol la4. la8
    sol4 sol2 sol4
    la la la4. sol8

    %16
    fad2.  la4
    sol sol la4. la8
    sol4 sol2 sol4

    %19
    la la la4. sol8
    fad1

}

VIIItln =  \relative do' {

    fa8 mi
    re4 re sol4. fa8
    mi4. mi8 fa4 sol
    la8 sol fa4 mi4. re8

    %4
    do4 do2 mi4
    re mi re4. mi8
    mi2. la4

    %7
    mi re mi4. fad8\mbreak
    sol4 re mi8 fa? sol4
    fa sol sol4. sol8

    %10
    sol4 sol fa sol
    fa4. sol8 mi4. re8
    do4 re8 mi fa4 mi

    %13
    re2 re4. re8
    re4 re2 mi8 mi
    mi4 re dod4. re8

    %16
    re2. mi4
    re2 re4. re8
    re4 re2 mi8 mi

    %19
    mi4 re dod4. re8
    re1

}

VIIIbcn = \relative do {

    re4
    re8 do sib la sol4. sol8
    la4 la'8 sol fa4 mi
    re2 mi4. mi8

    %4
    fa4 fa2 dod4
    re do? sib2
    la2. la'4

    %7
    la re8 do sib4. la8\mbreak
    sol4 sol8 fa mi4. mi8
    fa4 sib, si2

    %10
    do4 do'8 sib la4 mi
    fa sib, do2
    fa,4 fa'8 mi re4 do

    %13
    sib2 fad
    sol4 sol sol' mi
    la re, la2

    %16
    re,_\markup\italic"pointé pour la fin" re'4 do
    sib2 fad
    sol4 sol sol' mi

    %19
    la re, la2
    re,1

}

forma = {

  \key do\major
  \time 2/2
  \tempo 2 = 50
  \partial 4 s4
  s1*5
  s2. \bar ":|." s4
  s1*14
  \bar "|."

}

VIIIds = {
  \VIIIglobal
  %\notypeset
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
  <<\VIIIbcn \forma>>
  \typeset

}

IXglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IXdsn =  \relative do'' {

    re2 mi4. re16 mi
    fa4 re2 re8 mi
    fa4. sol8 sol4. fa8

    %4
    mi4 mi la4. sol8
    fad4 fad2 re8 re
    re4. do8 si4. mi8

    %7
    dod1 dod2. r8 mi\mbreak
    dod4. la8 re4. mi8
    fa4. fa8 fad4. fad8

    %10
    sol4. la8 la4. sol16 la
    sib2 re,4. re8
    sol4 la8 sib la4.\prall sol8

    %13
    fad4. sol8 sol4. fad8
    sol2. r16 mi fa? sol\mbreak
    la4. la8 sol4. fa8

    %16
    mi4. fa8 mi4. re8
    re2. r8 mi re1

}

IXhcn = \relative do'' {

    la2 la4. la8
    la4 la sib sib
    la2 re4. re8

    %4
    sol,4 do8 si? la4. la8
    la4 la si4. si8
    si4. la8 sold4. la8

    %7
    la1 la2. r8 la\mbreak
    la4. la8 si4. dod8
    re4. la8 re4. do?8

    %10
    sib4. re8 re4. re8
    re4. do8 sib4. sib8
    \once\set suggestAccidentals = ##t sib?4. sib8 do4. sib!8

    %13
    la4. la8 re4 re8. re16
    si4. si8 do4. do8\mbreak
    do4 r16 la sib do re4. do8

    %16
    sib4 sib la4. sol8
    fad2. r8 la fad1

}

IXtln =  \relative do' {

    fa2 mi4. mi8
    re4 fa2 sol4
    fa mi re4. re8
    do4 do8 re mi4. mi8
    re4 re2 fad8 fad
    sold4 mi mi4. mi8
    mi4 dod re mi mi2. r8 dod\mbreak
    mi4. mi8 fa4. sol8
    la4 la, sib4. do8
    re4. re8 la'4. la8
    sol4. sol8 fa4. fa8
    mib4. mib8 mib4. mib8
    re2. re4
    re4. re8 mi4. mi8\mbreak
    fa4. mi8 re2~
    re4 re8 mi dod4. re8
    re2. r8 dod re1

}

IXbcn = \relative do {

    re2 dod
    re4 re8 do? sib la sol4
    re'4 do si?2

    %4
    do dod
    re4 re8 do? si4. si8
    mi4 la, mi2

    %7
    la4 la'8 sol fa4 mi la,2. r8 la'\mbreak
    la4. sol8 fa4. mi8
    re4. do8 sib4. la8

    %10
    sol4 sol' fad2
    sol4. la8 sib4. re,8
    mib4. re8 do2

    %13
    re re,
    sol4. sol8 do4. do8\mbreak
    fa,4 r16 fa' sol la sib4. la8

    %16
    sol2 la4 la,
    re2. r8 la' re,1

}

forma = {

  \key do\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 1 = 55
  \repeat volta 2 {s1*6}
  \alternative {{s1}{\time 2/2 \tempo 2 = 60 s}} \set Score.currentBarNumber = #8
  \repeat volta 2 {s1*9}
  \alternative {{s1}{s}}
  \bar"|."

}

IXds = {
  \IXglobal
  %\notypeset
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
  <<\IXbcn \forma>>
  \typeset

}

Xglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

Xdsn =  \relative do'' {

    re8 mi fa sol la4
    sol la mi
    fa re sol

    %4
    mi8 re mi fa mi4
    re8 mi fa sol la4\mbreak
    sol la mi

    %7
    fa re sol
    mi2.
    mi8 fa mi re dod4

    %10
    re mi fa
    mi8(re) fad4.\parenthesize \downprall mi16 fad
    sol8 fa? sol la sol4

    %13
    mi8 fa sol mi la4
    sol la fa
    mi re dod

    %16
    re2.

}

Xhcn = \relative do'' {

    la4 re do
    sib la la
    la sol sib

    %4
    la2 la4
    la re do\mbreak
    sib la la

    %7
    la sol sib
    la2.
    dod8 re dod si? la4

    %10
    la2 si4
    do do4. re8
    si la si do si4

    %13
    do4. re8 mi4
    re dod8 si la4
    la la la

    %16
    la2.

}

Xtln =  \relative do' {

    fa8 sol la sol fa4
    mi mi2
    re4 si mi

    %4
    dod8 si dod re dod4
    fa8 sol la sol fa4\mbreak
    mi mi2

    %7
    re4 si mi
    dod2.
    la'2 sol4

    %10
    fa mi re
    mi la2
    re, sol4

    %13
    sol8 fa mi re dod4
    re mi re
    dod re mi

    %16
    fad2.

}

Xbcn = \relative do {

    re2.
    re4 dod2
    re4 sol,2

    %4
    la2.
    re\mbreak
    re4 dod2

    %7
    re4 sol,2
    la2.
    la'2 la,4

    %10
    re2 sol,4
    do la2
    sol2.

    %13
    do4. sib8 la4
    si dod re
    la' la,2

    %16
    re2.

}

Xbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 3/4
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 60
  s2.*8
  \bar ":..:"
  s2.*8
  \bar":|."


}

Xds = {
  \Xglobal
  %\notypeset
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
  \typeset

}
%#(set-global-staff-size 17)


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
        subtitle = \markup\column{ "Pièces à machines: L'inconnu [H.499]"" "}
        composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
    }

    \markup \huge  {"[1.] Ouverture du Prologue de l'Inconnu"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sol''1^\markup \center-align\smaller\center-column {"[Dessus]"} }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ids
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 do''2^\markup \center-align\column\smaller{"[Haute-contre]"} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ihc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 mi'2^\markup \center-align\column\smaller{"[Taille]"} }
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
           #(layout-set-staff-size 17)
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

    \markup \huge  {"[2.] Première Scène - Les Furies"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 do''4.^\markup \center-align\smaller\center-column {"[Dessus]"} re''8 }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sol'4.^\markup \center-align\column\smaller{"[Haute-contre]"} sol'8 }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 mi'4.^\markup \center-align\column\smaller{"[Taille]"} fa'8 }
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

    \pageBreak

    \markup \huge  {"[3.] Les Demons"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/2 r8^\markup \center-align\smaller\center-column {"[Dessus]"} do''8 }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/2 r8^\markup \center-align\column\smaller{"[Haute-contre]"} sol' }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major  \time 2/2 r8^\markup \center-align\column\smaller{"[Taille]"} mi' }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
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

    \markup \huge  \column{"[4.] Fanfare pour les Trompettes"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major  \time 4/8\numericTimeSignature do''8^\markup \center-align\smaller\center-column {"[Trompette I]"} [do''16 re'']}
                \set Staff.shortInstrumentName = "tp1"
                \clef violin
                \set Staff.midiInstrument = #"trumpet"
                \IVtpI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major  \time 4/8\numericTimeSignature r4^\markup \center-align\smaller\center-column {"[Trompette II]"} do''8}
                \set Staff.shortInstrumentName = "tp2"
                \clef violin
                \set Staff.midiInstrument = #"trumpet"
                \IVtpII
            >>
        >>

        \layout {
           #(layout-set-staff-size 20)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #12
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

    \markup \huge  {"[5.] Les Combattants"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sol''8^\markup \center-align\smaller\center-column {"[Dessus]"}  [sol''16 sol'']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Vds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 do''8^\markup \center-align\column\smaller{"[Haute-contre]"} [do''16 do''] }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Vhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 mi'8^\markup \center-align\column\smaller{"[Taille]"} [mi'16 mi'] }
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
           #(layout-set-staff-size 17)
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

\bookpart  {

    \paper {
        systems-per-page = #5
    }

    \markup \huge  \column{"[6.] Marche pour les Flutes"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major  \time 2/2 mi''4.^\markup \center-align\smaller\center-column {"P.r Hb et P.r Fl."} re''8}
                \set Staff.shortInstrumentName = "ob1"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \VIobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major  \time 2/2 do''4.^\markup \center-align\smaller\center-column {"S.d Hb. et S.de Fl."} si'8}
                \set Staff.shortInstrumentName = "ob2"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \VIobII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "bs"
                \set Staff.midiInstrument = #"bassoon"
                \VIbc
            >>
        >>

        \layout {
           #(layout-set-staff-size 17)
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

    \markup \huge  {"[7.] Les Plaisirs"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 sol''4^\markup \center-align\smaller\center-column {"[Dessus]"}}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 do''4^\markup \center-align\column\smaller{"[Haute-contre]"} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 mi'4^\markup \center-align\column\smaller{"[Taille]"} }
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
           #(layout-set-staff-size 17)
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

    \markup \huge  {"[8.] Nayades et Dryades"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/2 la''8^\markup \center-align\smaller\center-column {"[Dessus]"} [sol'']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/2 re''4^\markup \center-align\column\smaller{"[Haute-contre]"} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 2/2 fa'8^\markup \center-align\column\smaller{"[Taille]"} [mi']}
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
           #(layout-set-staff-size 17)
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

    \markup \huge  {"[9.] Pour le Dieu Pan"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re''2^\markup \center-align\smaller\center-column {"[Dessus]"} }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IXds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\once\override Staff.TimeSignature.transparent = ##t \time 2/2 la'2^\markup \center-align\column\smaller{"[Haute-contre]"} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IXhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major\once\override Staff.TimeSignature.transparent = ##t \time 2/2 fa'2^\markup \center-align\column\smaller{"[Taille]"}}
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
           #(layout-set-staff-size 17)
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

    \markup \huge  {"[10.] Plaisirs et Flore - Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 re''8^\markup \center-align\smaller\center-column {"[Dessus]"} [mi'']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Xds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\once\override Staff.TimeSignature.transparent = ##t \time 3/4 la'4^\markup \center-align\column\smaller{"[Haute-contre]"} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Xhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major\once\override Staff.TimeSignature.transparent = ##t \time 3/4 fa'8^\markup \center-align\column\smaller{"[Taille]"}[sol']}
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
           #(layout-set-staff-size 17)
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
