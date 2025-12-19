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
   
   do2 r8 re[mi8. fad16]
   sol2 r8 sol[la8. mi16]
   fa?2 fa4.\prall sol8
   
   %4
   mi4. fa8 sol4 la
   re, mi8. re16 do8.[la16 re8. do16]
   si4 sol do4. do8\mbreak
   
   %7
   do8.[si16 do8. re16 mi8. do16 re8. mi16]
   la,8.[mi'16 fa8. sol16] la4. la8
   la4. la16(sol fad4.)  fad8
   
   %10
   sol4.\prall la8 fad4. sol8
   sol4 re8. do16 re8.[(mi16) mi8\prall re16 mi]\mbreak
   fa?4 la,8. sol16 la8.[(si16) si8\prall la16 si]
   
   %13
   do4. re8 mi4 re8.\prall do16
   sol'8. [fa16 mi8. fa16] re4.\prall do8 
   si1 si\mbreak
   
   %16
   sol16 fad sol la si do re8 la re
   si8. si16 do re mi8. \once\set suggestAccidentals = ##t fad?16 mi fad
   re8\prall sol sol sol\prall fa?16 mi fa8
   
   %19
   fa sol16 fa mi re mi8 la la\mbreak
   la\prall sol16 fad sol8 sol la16 sol fad mi
   fad4. la8. sol16 la8
   
   %22
   sib8. la16 sol8 fa?16 sol mib8. re16
   do8. re16 mib8 re16 mib do8. sib16
   la8. re16 mib re do sib la8.\prall sol16\mbreak
   
   %25
   sol4.~sol
   re'16 si? do re mi? fad sol8 re sol
   mi8. re16 mi8 fa? sol8. sol16
   
   %28
   do, si do re mi do fa8. fa16 sol8\mbreak
   la mi8. fa16 sol8. re16 mi8
   fa do8. re16 mi8. fa16 sol8
   
   %31
   la8. sol16 la sol fa mi re8.\prall re16
   re8 sol8. sol16 do,8 fa16 mi fa re\mbreak
   mi8. re16 mi do fa mi re mi re do
   
   %34
   si8 sol sol' sol la16 sol fa8
   fa mi16 re mi8 fa16 sol re8. do16
   do8 sol do la16 sol la si do la\mbreak
   
   %37
   re8 la re si8. re16 mi fa
   sol8 re sol mi8. mi16 fa sol
   la8 fa la16 sol fa sol fa mi re do
   
   %40
   si8 sol sol' fa16 mi re8.\prall do16
   do2.
   
}

Ihcn = \relative do'' {
   
   sol8. sol16 la8. si16 do2
   si8. si16 do8. re16 mi4 do8. si16
   la8. la16 si8. do16 re4 si
   
   %4
   do2 do4. re8
   si2 la4. la8
   sol2 sol8. la16 sib8. sol16\mbreak
   
   %7
   la2 sol
   fa8. do'16 re8. mi16 fa4. mi8
   re2. do4
   
   %10
   re mib8 re re4.\prall do8
   si4 si8. la16 si4 dod\mbreak
   re re, mi fa
   
   %13
   sol8. sol16 la8. si16 do4 la
   si sol la2
   sol1 sol\mbreak
   
   %16
   R2.
   sol16 mi fa sol la si do8 sol do
   si si si do do do
   
   %19
   re8. do16 si8 do do do\mbreak
   re re re mi8. re16 dod8
   re4. re4 re8
   
   %22
   re8. do16 re8 re do8. sib16
   la8. si!16 do la sib  do la8.\prall sol16
   fad4 sol fad8. sol16\mbreak
   
   %25
   sol fad sol la si do re8 sol, re'
   si16 sol la si do re si8. si16 do re
   do8. si16 do sol la8 sol sol
   
   %28
   fa16 sol la si do la re8. do16 sib8\mbreak
   la8. si16 do re mi8 si8. dod16
   re8 la8. si16 do4 do8
   
   %31
   do4 do8 re la8. la16
   si8 do16 si do sol la sol la si do re\mbreak
   do8 si do do la la
   
   %34
   sol8. sol16 do si la8. la16 re do
   si8 la16 si do8 do16 re si8. do16
   do8 mi, mi fa mi fa16 sol\mbreak
   
   %37
   la8 sol16 fa mi8 re8. fa16 sol8
   sol16 mi fa sol la si do8 sol do
   la4 la8 la4 la8
   
   %40
   la4 do8 do16 re si8. do16
   do2.

}

Itln =  \relative do' {
   
   mi8. mi16 fad8. sol16 la2
   re,8. sol16 sol8. sol16 sol8. mi16 fa?8. do16
   re2 re4 sol8. sol16
   
   %4
   sol2. fa8. la16
   sol4. re8 mi4 re
   re si mi4. mi8\mbreak
   
   %7
   fa4 la,8. si16 do4. do8
   do2 r8 fa sol8. la16
   sib4. fad16 sol la4. la8
   
   %10
   sib4 sib la4. sol8
   sol4 sol~sol sol\mbreak
   la8. fa16 do8. si16 do4 re
   
   %13
   mi4. fa8 sol4 fa8. mi16
   re4 mi fa4. mi8
   re2 r8 si do8. re16 re1
   
   %16
   R2.
   r4. do16 si do re mi fad
   sol8 re sol mi la la
   
   %19
   sol4 sol8 sol mi mi\mbreak
   re8. do16 si8 la8. la16 la8
   la4. r8 la' la
   
   %22
   sol4. r8 sol sol
   fad4 sol mib
   re8. \once\set suggestAccidentals = ##t sib?16 do re mib8 re8. do16\mbreak
   
   %25
   si8. do16 re8 si si'16 do si la
   sol4.~sol
   sol16 mi fa sol la si do8 sol do
   
   %28
   la fa8. sol16 la8. la16 sol8\mbreak
   mi la4 sol sol8
   la fa fa sol4 sol8
   
   %31
   fa8. re16 fa sol la sol fa8. fa16
   fa8 re sol fa8. fa16 fa sol\mbreak
   sol8 sol sol la4 fa8
   
   %34
   mi8. si16 mi re do8. do16 fa mi
   re8. sol16 la8 la sol8. fa16
   mi8 do do do do8. do16\mbreak
   
   %37
   fa8 mi16 fa sol la sol8. fa16 mi re
   mi4 mi8 sol4 sol8
   do,4 do'16 sib la sib la sol fa mi
   
   %40
   re8 si mi la16 sol sol8. fa16
   mi2.
   
}

Ibcn = \relative do {
   
   do4. si8 la2
   sol8. sol'16 la8. si16 do2
   r8 do re8. la16 si4 sol
   
   %4
   do2 mi,4 fa
   sol2 sol4 fad
   sol4. fa?8 mi4 do\mbreak
   
   %7
   fa2 mi
   fa r8 mib re8. do16
   sib2. la4
   
   %10
   sol do re re,
   sol sol' fa mi\mbreak
   re fa mi re
   
   %13
   do2. do4
   si do fa,2
   sol8. re'16 mi8. fa16 sol8. fa16 mi8. re16 sol,1
   
   %16
   r4. re'16 si do re mi fad
   sol8 re sol mi8. re16 do8
   sol sol sol la la la
   
   %19
   si8. la16 sol8 do4 do8\mbreak
   si si si dod8. si16 la8
   re re mi fad8. mi16 fad8
   
   %22
   sol8. la16 sib8 sib, do8. re16
   mib8. re16 do8 sib do4
   re do re\mbreak
   
   %25
   sol,4.~sol
   sol sol'16 mi fa sol la si
   do8 sol do la mi4
   
   %28
   fa8. fa16 mi8 re8. re16 mi8\mbreak
   fa8. sol16 la8 mi8. fa16 sol8
   re8. mi16 fa8 do8. re16 mi8
   
   %31
   fa4. re
   sol8. fa16 mi8 fa16 mi fa sol la si\mbreak
   do8 sol do la fa re
   
   %34
   mi4. fa4 re8
   sol4 fa sol
   do,16 si do re mi do fa8 do fa\mbreak
   
   %37
   re16 si do re mi fa sol8 re sol
   mi8. fa16 mi re do re do sib la sol
   fa4. fa
   
   %40
   sol8 sol'16 fa mi8 fa sol sol,
   do2.
   
}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 55
  \repeat volta 2 {s1*14}
  \alternative {{s1}{s}}\set Score.currentBarNumber = #16
  \bar "||"\break
  \time 6/8
  \tempo 4. = 65
  s2.*26
  \bar"||"


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

   sol4
   do4. re8 mi4
   re sol2
   mi4. re8 mi4

   %4
   fa re4.\prall do8
   si4. do8 re4
   mi la,4. sol8

   %7
   sol2 sol4 sol2 re'4
   sol fa4. sol8
   mi4 mi4. mi8

   %10
   fa4 fa4. mi8
   fa4 fa4. sol8
   la4 sib8 la sol fa

   %13
   mi4. fa8 sol4
   la re,4. do8
   do2

}

IIhcn = \relative do'' {

   mi,8 fa
   sol4. sol8 do4
   si4. do8 re4
   do2 do4

   %4
   do la2
   sol sol4
   sol fad4. sol8

   %7
   sol4. la8 sol fa sol2 si4\mbreak
   si2 si4
   do do4. do8

   %10
   do4 re do
   do do4. do8
   do re re4 mi8 re

   %13
   do4. re8 mi4
   re8 do si4. do8
   do2

}

IItln =  \relative do' {
   
   do8 re
   mi4. fa8 sol4
   sol2 sol4
   sol4. fa8 sol4
   
   %4
   la2 re,4
   re2 re4
   do la4. re8
   
   %7
   si2 do8 re si2 sol'4\mbreak
   re2 sol4
   sol sol4. sol8
   
   %10
   la4 sib sol
   la la4. mi8
   fa4 re sib'
   
   %13
   la4. la8 sol4
   fa8 la sol4. fa8
   mi2

}

IIbcn = \relative do {

   do4
   do2 do4
   sol'4. la8 si4
   do2 do4

   %4
   fa, fad2
   sol si,4
   do re re,

   %7
   sol sol'8 fa mi re sol,2 sol4\mbreak
   sol2 sol'4
   do sib4. do8

   %10
   la4 sol do,
   fa fa,4. do'8
   fa4 sol4. sol8

   %13
   la4 sol8 fa mi4
   fa sol sol,
   do2

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key do\major
   \time 3/4
   \once\override Staff.TimeSignature.style = #'single-digit
   \tempo 2 = 50
   \partial 4 s4
   \repeat volta 2 {
      s2.*6
   }
   \alternative {{s2.}{s2\bar ".|:" s4}}
   s2.*7
   s2
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

   do8^\markup\italic"inquietude"
   do2 r16 sol' mi fa sol fa mi re
   mi2 do4 r16 re do si
   la2 r16 fa' re mi fa mi re do

   %4
   si4. la8 sol4 do8. do16\mbreak
   do4 r16 re si do re4 r16 mi fa re
   mi2 mi4.^\markup\italic "attention ou aplaudissement" mi8

   %7
   fa2 la,4. si8
   do2 r8 mi re8. do16
   si4 sol do4. do8\mbreak

   %10
   do2 si4. si8
   mi4 la, la4. sol8
   sol2. r8 do sol2. r8 re'^\markup\italic"tristesse"

   %13
   re2 sol~
   sol4\noBeam fa16 mi fa8 fa4.\prall mi8
   mi2 la4. la8\mbreak

   %16
   re,2 mi4(fa8) sol
   dod,4 dod mi4. mi8
   mi4 fa8 mi mi4.\prall re8

   %19
   re1

}

IIIhcn = \relative do'' {

    sol8
    sol2 sol4. sol8
    sol4. fa8 mi2
    fa la4. la8

    %4
    sol4 re8. fa16 mi4 sol8. sol16\mbreak
    <la fa>2 la4 si8. si16
    do2 do4. si8

    %7
    la4 sol fa4. mi8
    mi2 la4 fad
    sol2. sol4\mbreak

    %10
    la2 sol4. sol8
    sol4 sol fad4. sol8
    sol2. r8 sol sol2. r8 si

    %13
    si2. si4
    do2 re
    <do sol> do4. do8\mbreak

    %16
    sib2. sib4
    la la la4. la8
    la4 sib la4. sol8

    %19
    fad1

}

IIItln =  \relative do' {
   
   mi8
   mi2 re4. re8
   do16 mi do re mi re do si do4. do8
   do4 r16 do re mi fa8. mi16 re8. re16
   
   %4
   re8 sol si,8. re16 do8 re mi8. mi16\mbreak
   la,4 la'8. sol16 fa4 sol8. sol16
   sol2 la4 mi
   
   %7
   re2 r8 mi fa sol
   la4 la, re4. re8
   re4 si mi4. mi8\mbreak
   
   %10
   re2 re4. re8
   do4 mi re4. do8
   si4 si do re si2. r8 sol'
   
   %13
   sol2 re4 mi
   mi fa sol4. sol8
   sol4 fa mi fa\mbreak
   
   %16
   fa2 sol4. fa8
   mi4 mi la,4. si8
   dod4 re8 mi dod4. re8
   
   %19
   re1
   
}

IIIbcn = \relative do {

   do8
   do2 si
   do16 do' la si do si la sol la2
   fa4 r16 sol fa mi re2

   %4
   sol,16 sol' mi fa sol fa mi re mi4. do8\mbreak
   fa4. mi8 re4 sol
   do,2 la4. la8

   %7
   re2 re'4 re,
   la'4. sol8 fad4 re
   sol \once\set suggestAccidentals = ##t fa? mi4. mi8\mbreak

   %10
   fad2 sol4. sol8
   do,4 do re re,
   sol sol'8 fa? mi4 re sol,1

   %13
   sol'2. mi4
   la2 si
   do2. la4\mbreak

   %16
   sib la sol2
   sol dod,4. dod8
   fa,4 sol la2

   %19
   re,1

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \partial 8 s8
  \repeat volta 2 {s1*5 s2 \tempo 2 = 50 s s1*5}
  \alternative {{s1}{s2. s8\bar "||" s}}\set Score.currentBarNumber = #13
  \tempo 2 = 40
  s1*7
  \bar"||"

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

IVdsn =  \relative do'' {

   si4. si8 do4. re8
   mi4. mi8 re4. mi8
   do4. do8 si4. do8
   la4. mi'8 fa4. sol8
   la4 sib8 la sol4. fa8\mbreak
   mi4. re8 mi4. fa8
   sol4 fa8 mi re4. do8
   si4 sol sol'4. do,8
   fa4 mi8 fa re4.\prall do8
   do1\fermata

}

IVhcn = \relative do'' {

   sol4. sol8 la4. si8
   do4. do8 si4. la8
   sol2. sol4
   fa do' re2
   do sib\mbreak
   la1
   sol4. sol8 la4. la8
   sol2 sol4. la8
   re4 sol, sol4. sol8
   sol1\fermopz

}

IVtln =  \relative do' {

   re4. re8 do4. fa8
   sol4. sol8 fa4. fa8
   mi4. mi8 re4. mi8
   do4. sol'8 la4. sol8
   fa4 sol8 fa mi4. re8\mbreak
   do4. si8 do4. re8
   mi4 fa8 sol fa4. mi8
   re4 si do4. la8
   si4 do si4. sol'8
   mi1\fermata

}

IVbcn = \relative do {

   sol'4. fa8 mi4. re8
   do2 re
   mi2. do4
   fa2 re4. mi8
   fa2 sol\mbreak
   la4 sib8 la sol4. fa8
   mi2 fa
   sol4. fa8 mi4. fa8
   re4\prall do sol2
   do1\fermata

}

IVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key do\major
   \time 2/2
   \tempo 1 = 55
   s1*10
   \bar"||"


}

IVds = {
   \IVglobal
   %\notypeset
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
   \typeset

}

Vglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

Vdsn =  \relative do'' {
   
   do8
   do4. sol'8 mi4. fad8
   sol2 sol,4. sol8
   do4 re mi re8 do
   
   %4
   si4 sol sol'8 fa mi re
   mi4 fa8 sol re4. do8
   do2 sol'4. sol8\mbreak
   
   %7
   sold4. la8 la4.\prall sold16 la
   si4 mi, la4. la8
   la4 sol?8 fad sol4 fad8 mi
   
   %10
   fad4 re sol4. sol8
   sol4 fa?8 mi mi4.\prall re8
   re2. r8 do re2. r8 re
   
   %13
   re4. mi8 fa4. sol8
   mi2 mi4. mi8
   la4. sold8 la4. si8
   
   %16
   sold4. la8 si4. mi,8
   la4. si8 sold4. la8
   la2 la,4. si8\mbreak
   
   %19
   do4. re8 mi4. fa8
   sol4 fa8\prall mi re4 sol
   do, fa8 mi fa mi re do
   
   %22
   si4. do8 re4. mi8
   fa4 sol8 la re,4. do8
   do2. r8 re do1

}

Vhcn = \relative do'' {
   
   sol8
   sol4. sol8 do4. do8
   re4 sol,8 fa mi4. mi8
   la4 si do8 si la4
   
   %4
   sol1
   sol4 la sol4. sol8 
   sol2 do4. do8\mbreak
   
   %7
   re4 si do4. re8
   si4 la2 la4
   la2. la4
   
   %10
   la2 si4. si8
   do si la si do4. re8
   si2. r8 sol si2. r8 si
   
   %13
   si2 la4. la8
   la2. la4
   la2 si4. si8
   
   %16
   si4. la8 sold4 la8 si
   do4 si si4. la8
   la2 fa4. sol8\mbreak
   
   %19
   la2. la4
   sol4. la8 si4 do8 si
   la2. la4
   
   %22
   sol4. la8 si4. dod8
   re4 do? si4. do8
   do2. r8 si do1

}

Vtln =  \relative do' {
   
   mi8
   mi2 sol4. sol8
   sol4 re do4. re8
   mi4. fa8 sol4 fa8 mi
   
   %4
   re4 mi8 fa mi fa sol fa
   mi re do4 si sol'8 fa
   mi2 mi4. mi8	\mbreak
   
   %7
   re2 mi4. mi8
   mi4 dod re4. re8
   mi2. mi4
   
   %10
   re2. re4
   mi fa sol4. sol8
   sol2. r8 mi sol2. r8 sol
   
   %13
   sol4 re re4. re8
   do2 do4. do8
   do4 re re4.\prall do16 re
   
   %16
   mi2 mi4. mi8
   mi4 fa mi4. re8
   dod2 re\mbreak
   
   %19
   mi4. re8 do?4. re8
   si mi re do si4 mi8 sol
   fa4. sol8 la sol fa mi
   
   %22
   re4 sol sol4. sol8
   la4 sol sol4. fa8
   mi2. r8 sol mi1

}

Vbcn = \relative do {
   
   r8
   do2 do'
   si do4. si8
   la4 sol8 fa mi4 fa
   
   %4
   sol8[fa mi re mi re do si]
   do4 fa sol sol,
   do2. do'4
   
   %7
   si2 la
   sold4 la8 sold fa4 mi8 re
   dod2. dod4
   
   %10
   re4. do?8 si4 sol
   do fa,4 do'2
   sol2. r4 sol1
   
   %13
   sol'2 re
   la'2. sol4
   fa2. fa4
   
   %16
   mi2 re
   do4 re mi2
   la, re\mbreak
   
   %19
   la4. si8 do4. re8
   mi4. fa8 sol4 mi
   fa2 fa,
   
   %22
   sol4 sol' fa4. mi8
   re4 mi8 fa sol4 sol,
   do1 do
   
}

Vbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \partial 8 s8
  \repeat volta 2{s1*11}
  \alternative {{s1}{s}}\break
  \set Score.currentBarNumber = #13
  \repeat volta 2 {s1*11}
  \alternative {{s1}{s}}
  \bar "||"

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

VIdsn =  \relative do'' {
   
   sol16[la sib do re sib do re sol, la sib do re mi fa re]
   sol4. sol8 sol4 r16 sib la sol
   fad4 r16 mi fad sol la4. la8
   
   %4
   re,16[dod re mi fa mi fa re sol lab sol fa mib fa mib re]\mbreak
   do?[si do re mib re mib do] fa sol fa mib re mib re do
   sib4. sib8 sib4 r16 sib do re
   
   %7
   mib4 r16 re do sib la4 r16 la sib do
   re4 r16 do sib la sol fad sol la sib la sib sol\mbreak
   do4. do8 do8. sib16 sib8. la16
   
   %10
   la1 la
   la'16[fad sol la re, mi fad re sol la sib la sol la sol \once\set suggestAccidentals = ##t fa?]\mbreak
   mi4 do fa4. fa8
   
   %13
   fa16 sib la sol fa mib re do sib8. do16 do8. sib16
   sib4 fa'8. fa16 sib4 sol8. sib16
   la4 fa do8. mib16 re8. fa16\mbreak
   
   %16
   mib4 sol8. sol16 sol sol fa mib re do sib la
   sol [fad sol la sib la sib sol do sib do re mib re mib do]
   re4 sib'8. sib16 sib la sib do sib la sol fa\mbreak
   
   %19
   mi?4 r16 mi[fa sol la sol la sib la sol fa mi]
   fad8 re sol8. sol16 sol8. la16 fad8. sol16
   sol1 sol

}

VIhcn = \relative do'' {
   
   sib8. la16 sol8. re16 re8 sol16 la sib8. sib16
   sib4 r16 sol la sib do sib do re do re do sib
   la4 re re4. re8
   
   %4
   re4 do re do16 re do sib\mbreak
   la sol la si do si do la
   re mib re do \once\set suggestAccidentals = ##t sib?  do sib la
   
   %7
   sol4. sol8 fa16 fa sol lab sib8. [sib16]
   sib do sib la sol8. sol16 fa4 r16 fa sol la
   sib sib la sol fa8.[fa16] mib re do do' sib la sol fa\mbreak
   
   %10
   sol4. sol8 la sol16 fad sol8. la16
   fad1 fad
   fad16 la sol fad la8. la16 sib do re do sib do sib la\mbreak
   
   %13
   sol4 sol la4. la8
   sib16 re do sib la do sib la sol8. sol16 fa8. fa16
   fa4 la8. la16 re4 do8. do16
   
   %16
   do4 la la8. la16 si8.[si16]\mbreak
   do4 do8. do16 sib do re do sib la sol fa
   mib8. do16 fa8. sol16 la sol la sib do sib do la
   
   %19
   sib4 re8. re16 re do re mib re do sib la\mbreak
   sol sol la sib do8. sib16 la4. la8
   la8. la16 sib8. sib16 sib8. do16 la8. re16
   
   %22
   sib!1 si

}

VItln =  \relative do' {
   
   re8. do16 sib8. sib16 sib do re do sib do re sib
   mib4. mib8 mib4. mib8 
   re4 r16 dod re mi fad4. fad8
   
   %4
   sol4 la16 sol la fa? sib do sib la sol8. sol16\mbreak
   fa4 la sib! fa8. fa16
   mib4. mib8 re4 r16 re mib fa
   
   %7
   sol4 r16 fa mib re do4 r16 sol' fa mib
   re4 r16 re mib fa sib,8 mib re do16 re\mbreak
   mib fa sol fa mib re do sib la8. re16 re8. re16
   
   %10
   re1 re
   re8 mi? fad re re4. re8\mbreak
   do8. re16 mi8. re16 do4. do8
   
   %13
   re4 re8. re16 re8 sib la fa'16 mib
   re4 do8. do16 re8. re16 mi?8. mi16
   fa4 do8. re16 mib8. do16 fa8.[re16]\mbreak
   
   %16
   sol4 mib8. mib16 re8 sib sib8. sib16
   sib la sib do re do re sib mib8. re16 do8 fa16 fa
   fa2 fa4. re16 re\mbreak
   
   %19
   do si do re mi8. mi16 mi4. mi8
   re4. re8 mib8. mib16 re8. re16
   re1 re
   
}

VIbcn = \relative do {
   
   sol2. sol'8 fa
   mib4. re8 do4. do8
   re2. do4
   
   %4
   sib la8. sib16 sol4 do\mbreak
   fa mib re4. re8
   mib2 sib'16 do sib lab sol lab sol fa
   
   %7
   mib4 r16 do re mib fa4 r16 mib re do
   sib4 r16 sib do re mib re mib fa sol fa mib re\mbreak
   do re mib re do sib la sol fad4 sol
   
   %10
   re2 r16 la' sib do re sib do re re,1
   re'4. do8 sib4 si\mbreak
   do4. do'16 sib? la4 fa
   
   %13
   sib re, sol8. mib16 fa8. fa,16
   sib4 la sol do
   fa, fa' mib re\mbreak
   
   %16
   do2 sol
   mib'4 re8. mib16 do8. sib16 la8. fa16
   sib2 sib4. sib8\mbreak
   
   %19
   do2 dod4. dod8
   re8. do?16 sib8. sib16 mib8. do16 re8. re,16
   sol1 sol
   
}

VIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \repeat volta 2 {s1*9}
  \alternative {{s1}{s}}\break\set Score.currentBarNumber = #11
  \repeat volta 2{s1*10}
  \alternative {{s1}{s}}
  \bar"||"

}

VIds = {
  \VIglobal
  %\notypeset
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
  \typeset

}

VIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

VIIdsn =  \relative do'' {
   
   sol'2 re
   sol sol,4. la8
   sib4 do8 sib la4 re8 do
   
   %4
   sib4. la8 sol2
   re' sol4. la8
   fad2 sol4. la8
   
   %7
   sib4 la8 sol fa?4. sol8\mbreak
   la4 sol8 fa mi4. fa8
   sol4. fa8 mi4 re8 dod
   
   %10
   re1 re
   la'2 re,
   la' fad4. sol8
   
   %13
   la4 sol8 la sib4 la8 sol\mbreak
   la2 re,
   sol4 fa8 mi re4 mi8 fa
   
   %16
   mi4 re8 mi do4 fa8 mib
   re4 do8 sib do4 sib8 la
   sib2 sib
   
   %19
   sib4. do8 re4. mib8\mbreak
   fa4 mib8 re do4. re8
   mib4. fa8 sol4 fa8 mib
   
   %22
   re4. sol8 fad4. sol8
   la2 sol4. la8
   sib4. re,8 sol4 fa8 mi
   
   %25
   fad4. sol8 la4 sol8 fad\mbreak
   sol1 sol

}

VIIhcn = \relative do'' {
   
   sib2 sol
   re re4. re8
   sol4. sol8 fad4. fad8
   
   %4
   sol2 re
   sol4. la8 sib4 do8 sib
   la2 sib4. do8
   
   %7
   re4. do8 sib4. sib8\mbreak
   do4. sib8 la4. si8
   dod4. re16 la la4. la8
   
   %10
   fad4. fad8 sol4. la8 fad1
   fad2 la
   fad la
   
   %13
   re re\mbreak
   re la
   si2. si8 si
   
   %16
   do4. sol8 la4. la8
   sib4 fa8 sol la4 sib8 do
   sib2 sol
   
   %19
   fa sib\mbreak
   sib4 do8 sib la4. si8
   do4 \once\set suggestAccidentals = ##t sib?8 la sol4. la8
   
   %22
   sib4. do8 re4 do8 sib
   la2 r8 do do8. do16
   re2 do4. do8
   
   %25
   la4. re8 do4 sib8 la\mbreak
   sib!1 si

}

VIItln =  \relative do' {
   
   re2 sib
   sib sib4. do8
   re2 re
   
   %4
   re4. do8 sib2~
   sib4 do re mib
   re2 re
   
   %7
   sol4 fa8 mib re4. \once\set suggestAccidentals = ##t mi?8\mbreak
   fa4 mi8 re do4. re8
   mi4. fa8 dod4 re8 mi
   
   %10
   re1 re
   re2 fad
   re la'4. sol8
   
   %13
   fad4 mi8 fad sol4 fad8 mi
   fad2 fad
   sol2.~sol4
   
   %16
   sol2 fa?4. fa8
   fa2 fa4. mib8
   re2 mib
   
   %19
   re4. mib8 fa2\mbreak
   fa1
   mib4 re8 do sib mib re do
   
   %22
   sib4 la8 sol la4 la'8 sol
   fad2 mi4. fad8
   sol4 re8 re mib4. mib8
   
   %25
   re4. sol8 mib4 mib8 re\mbreak
   re1 re

}

VIIbcn = \relative do {
   
   sol1 
   sol
   sol'2 re
   
   %4
   sol sol,4. la8
   sib2. do4
   re2 sol,
   
   %7
   sol'4. la8 sib4 la8 sol\mbreak
   fa4. sol8 la4 sol8 fa
   mi4. re8 la'4. la,8
   
   %10
   re4. do8 sib4. la8 re1
   re
   re
   
   %10
   re'2 sol,\mbreak
   re'2. do4
   si2. sol4
   
   %13
   do \once\set suggestAccidentals = ##t sib?8 do
   la4. fa8
   sib4 la8 sol fa4. fa,8
   
   %16
   sib2 mib
   sib sib4. do8\mbreak
   re4. mib8 fa4 mib8 re
   
   %19
   do4. re8 mib4. fa8
   sol4 fa8 mib re2
   re'4. do8 sib4. la8
   
   %22
   sol4. fa8 mib4 re8 do
   re4. sib8 do4. re8\mbreak
   sol,1 sol

}

VIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/2
  \tempo 1 = 50
  \repeat volta 2 {s1*9}
  \alternative {{s1}{s}}\set Score.currentBarNumber = #11
  \repeat volta 2 {s1*15}
  \alternative {{s1}{s}}
  \bar"||"

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
   
   sol'4_\markup\italic "genereux" la si
   la re, sol
   sol8 la la4. sol8
   
   %4
   fad4. mi8 re4
   si2_\markup\italic "lasches" si4
   si la sol
   
   %7
   sol4. la8 fad4
   sol8_\markup\italic "genereux" fad sol la si dod\mbreak
   re4. mi8 fad4
   
   %10
   sol sol4. fad16 sol
   la4. sol8 fad4
   mi2_\markup\italic "lasches" si4
   
   %13
   dod2 re4
   re4. mi8 dod4
   re2. re
   
   %16
   la'4_\markup\italic "genereux" la4.\prall sol16 la
   si4. la8 sol4
   re_\markup\italic "lasches" re4.\prall do16 re
   
   %19
   mi2.
   do'8_\markup\italic "genereux" si la4. si8
   sold4 mi la
   
   %22
   la4. si8 sold4\mbreak
   la2. 
   dod,4_\markup\italic "lasches" dod4.\prall si16 dod
   
   %25
   re2 re4
   sol_\markup\italic "genereux"  la si
   do2.
   
   %28
   mi,4_\markup\italic "lasches" mi4.\prall re16 mi
   fad2 fad4
   sol8_\markup\italic "genereux" la la4. sol8
   
   %31
   sol2.

}

VIIIhcn = \relative do'' {
   
   si4 do re
   re2 sol,4
   do la4. la8
   
   %4
   la2 sol8 fad
   sol2 fa?4
   mi2 re4
   
   %7
   mi re4. re8
   re2 sol4\mbreak
   la2 re4
   
   %10
   re4. mi8 dod4
   re2 re4
   do si sold
   
   %13
   la2 la4
   si la4. la8
   la4. fad8[sol la] la2.
   
   %16
   re4 re4. re8
   re2 re4
   si2 re4
   
   %19
   do2.
   mi4 re4. do8
   si4 do do
   
   %22
   si si4. mi8\mbreak
   dod2.
   la4 la4. la8
   
   %25
   la2 si4
   si do re
   mi2.
   
   %28
   do4 do4. do8
   re4. mi8[re do]
   si mi re4. do8
   
   %31
   si2.
 
}

VIIItln =  \relative do' {
   
   re2 sol4
   la la, si
   mi mi4. mi8
   
   %4
   re2.
   re2 re4
   sol, la si
   
   %7
   la la4. la8
   si la si dod re mi\mbreak
   fad4. sol8 la4
   
   %10
   si mi,4. mi8
   fad4. sol8 la4
   la sold mi
   
   %13
   mi4. mi8 fad4
   mi mi4. mi8
   fad4. mi8 re4 fad2.\mbreak
   
   %16
   fad2 la4
   sol4. la8 si4
   sol sol4. sol8
   
   %19
   sol2.
   sol4 fa?4. fa8
   mi4. re8 do4
   
   %22
   fa mi4. mi8\mbreak
   mi2.
   mi4 mi4. mi8
   
   %25
   fad2 fad4
   sol8 re mi4 fa!
   sol2.
   
   %28
   sol4 la4. la8
   la2 la4
   sol fad4. sol8 
   
   %31
   sol2.

}

VIIIbcn = \relative do {
   
   sol'2 sol4
   fad2 mi8 re
   do4 dod2
   
   %4
   re8 mi re do? si la
   sol4 la si
   do2 si4
   
   %7
   do re2
   sol, sol'4\mbreak 
   fad2.
   
   %10
   mi
   re
   la'4 mi2
   
   %13
   la4. sol8 fad4
   sol la la,
   re re'8 do si la re,2.\mbreak
   
   %16
   re4 fad2
   sol sol4
   sol, si2
   
   %19
   do2.
   do4 re2
   mi4. mi8 fa4
   
   %22
   re mi2\mbreak
   la,2.
   la'8 si la sol fad mi
   
   %25
   re mi re do si la
   sol fa' mi4 re
   do2.
   
   %28
   do4 la4. la8
   re2 re4
   mi8 do re4 re,
   
   %31
   sol2.

}

VIIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 3/4
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \repeat volta 2 {s2.*14}
  \alternative {{s2.}{s}}\set Score.currentBarNumber = #16
  \bar "||"
  s2.*16
  \bar"||"

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
  <<\VIIIbcn \forma \VIIIbfn>>
  \typeset

}

IXglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IXdsn =  \relative do'' { 
   
   sib2. r16 sib do re
   mib4 r16 mib re mib do4 r16 fa mib fa
   re4 sib fa' r16 fa sol la
   
   %4
   sib4 r16 sib la sib sol4 r16 la sib sol
   la4 fa sib4. la8\mbreak
   sol4 sol8 lab fa4.\prall mib8
   
   %7
   re4 r16 re mib fa sol2~
   sol4 r16 do, re \once\set suggestAccidentals = ##t mi? fa2~
   fa4 sol8 fa mi4. fa8
   
   %10
   fa4 mib8 re do4.\prall sib8
   la1 la2.
   do4 do do
   
   %13
   fa fa fa
   re sib re
   sol sol sol
   
   %16
   mib do mib
   lab lab lab
   sol mib sib'\mbreak
   
   %19
   mib, fa re
   mib sol8\solo fa sol lab
   fa4 fa\tu sol
   
   %22
   mib mib8\solo re mib fa
   re4 re\tu mib
   do fa8\solo mib fa sol
   
   %25
   mib4 do\tu fa\mbreak
   re sib sib'
   sol mib sol
   
   %28
   mib do fa
   sib, do la
   sib2.

}

IXhcn = \relative do'' {
   
   fa,2 sol4 r16 sol la si
   do4 r16 do \once\set suggestAccidentals = ##t sib? do la4 la
   la4 r16 la sib do re4. re8
   
   %4
   re4. re8 do4 do
   do do sib sib\mbreak
   sib do8 sib lab2
   
   %7
   sol16 fa sol lab sib4 sib4. sib8
   lab2. lab4
   sib lab sol do8 sib
   
   %10
   \once\set suggestAccidentals = ##t la?2 sol
   fa1 fa2.\mbreak
   la2.
   
   %13
   la4 la la
   sib sib sib
   sib sib sib
   
   %16
   sol sol sol
   do do do
   sib sib sib\mbreak
   
   %19
   do do sib
   sib r r
   r re mib
   
   %22
   do r r
   r sib sib
   la r r
   
   %25
   r la la\mbreak
   sib2 sib4
   sib do re
   
   %28
   sol, la sib
   sol sol fa
   fa2.

}

IXtln =  \relative do' {
   
   re4. do8 sib4 sol
   sol'4. sol8 fa4 fa
   fa r16 fa sol la sib4 r16 re, mi fad
   
   %4
   sol4 r16 sol fa sol mi4 mi
   fa r16 la, sib do re4 re\mbreak
   mib mib8 fa re4. do8
   
   %7
   sib4 r16 sib do re mib4. re8
   do2. do4
   re2 do4. do8
   
   %10
   do2. do4
   do la sib do do2.\mbreak
   fa4 fa fa
   
   %13
   fa2.
   fa4 re sib
   re mib re
   
   %16
   do mib do 
   mib fa mib
   mib sol sib\mbreak
   
   %19
   lab lab fa
   sol r r
   r sib sib
   
   %22
   lab r r
   r sol sol
   fa r r 
   
   %25
   r fa fa\mbreak
   fa sol re
   mib2 re4
   
   %28
   do mib re8 fa
   mib4 mib do
   re2.

}

IXbcn = \relative do { 
   
   sib4 r16 sib do re mib4. re8
   do4 r16 do re \once\set suggestAccidentals = ##t mib? fa4 fa,
   sib2 sib'4 r16 sib la sib
   
   %4
   sol4 r16 sol la sib do4 do,
   fa r16 fa mib fa re4 sib\mbreak
   mib mib fa2
   
   %7
   sol2. r16 mib fa sol 
   lab2. r16 fa sol lab
   sol2 do4 do,
   
   %10
   fa2 \once\set suggestAccidentals = ##t mib?
   fa4 mib re do fa2.
   fa
   
   %13
   fa4 fa fa
   sib sib sib
   sol mib sol
   
   %16
   do do do
   lab fa lab
   mib2 sol4\mbreak
   
   %19
   lab fa sib
   mib, mib mib
   sib 'sib sol
   
   %22
   lab mib fa 
   sol sol mib
   fa fa fa
   
   %25
   sol la fa\mbreak
   sib sol sib
   mib, do si
   
   %28
   do do re
   mib do fa
   sib,2.
 
}

IXbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/2
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 50
  \repeat volta 2 {s1*10}
  \alternative {{s1}{\time 3/4
  \tempo 2 = 73 s2.}}\break\set Score.currentBarNumber = #12
  \once \override Score.RehearsalMark.extra-offset = #'(+2 . 1) \mark\markup\italic"reprise"
  s2.*19
  \bar"||"

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
  <<\IXbcn \forma \IXbfn>>
  \typeset

}

Xglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

Xdsn =  \relative do'' {
   
   \footnote #' (-1 . 3) \markup\column {"  ""Rondeau deux fois au commen[cement] une fois au milieu et deux fois a la fin""  "} la'4 la8 la la4 la
   fad re fad fad8 sol
   la4 si8[la si la sol fad]
   
   %4
   mi4 mi8 mi mi4 mi
   mi2\prall la4 la8 sol
   fad4 fad8 sol la4 mi\mbreak
   
   %7
   fad4 fad8[sol la sol fad mi]
   fad8 sol la4 mi4. re8
   re1 \set Staff.midiInstrument = #"violin"
   
   %10
   fad4._\markup\italic "viollons seuls" mi8 fad4. sold8
   la2 mi4. la8
   re,4 mi8 fad mi4 fad8 re\mbreak
   
   %13
   dod4. si8 la2
   mi'4 mi8 re mi4 fad
   sol sol8[la si si la sol]
   
   %16
   fad4 fad8 sol la4 sol8 fad
   mi re mi fad mi4 la,\mbreak
   mi'2_\markup\italic "viollons seuls" si4. mi8
   
   %19
   dod2 dod4. fad8
   re4. re8 sol4. fad8
   mi2\prall fad4. dod8
   
   %22
   re fad mi re dod4. si8
   si2 r8 fad' sol la\mbreak
   si2 mi,4. fad8
   
   %25
   red2 si4. si'8
   la4 si8 sol fad4 sold8 la
   sold2 mi4. mi8
   
   %28
   la4 sol?8 fad sol fad mi re\mbreak
   dod4 dod8 re mi4 la,
   
}

Xhcn = \relative do'' {
   
   re4 re8 re re4 re
   re la re re
   re2 si4 si
   
   %4
   la la8 la la4 la
   la2 la4 la
   la2 la4 la\mbreak
   
   %7
   la2 la4 la 
   la la8 si la4. sol8
   fad1
   
   %10
   re'4. dod8 si2~
   si4 dod8 si la2~
   la4 si8 la sold4. sold8\mbreak
   
   %13
   la2 mi
   la4. si8 dod4 red
   mi8 mi \once\set suggestAccidentals = ##t  re? dod si la si dod
   
   %16
   re re dod si la4 si
   dod8 si dod re dod4 dod\mbreak
   la4. dod,8 mi4. mi8
   
   %19
   mi2 la4. la8
   si4. si8 si4. si8
   dod2 dod4. dod8
   
   %22
   si4 dod8 si lad4. si8
   si2 si4. do8\mbreak
   re4 mi8 re do4. do8
   
   %25
   si2. si4
   do2 si4. si8
   si2 la8 si \once\set suggestAccidentals = ##t dod? dod 
   
   %28
   re4. re8 si4. si8\mbreak
   la4 la8 si dod4 dod

}

Xtln =  \relative do' {
   
   fad4 fad8 fad fad4 fad
   la fad8 sol la4 la8 sol
   fad4 sol8 fad sol fad mi re
   
   %4
   dod4 dod8 dod dod4 dod
   dod dod8 re mi4 dod
   re2 mi4 mi\mbreak
   
   %7
   re2 mi4 mi
   re re dod4. re8
   re1
   
   %10
   la'2 re,
   mi4 mi8 re dod2
   fad si,\mbreak
   
   %13
   mi4. re8 dod2
   dod4 la'2 la4
   sol8 sol fad mi re4. do8
   
   %16
   si \once\set suggestAccidentals = ##t dod? re mi fad4 mi8 si'
   la2 r8 si la sol\mbreak
   dod,4. la8 si2
   
   %19
   la mi'4 dod8 dod
   re4 fad mi si'
   la4. sol8 fad4. fad8
   
   %22
   fad4 sol fad4. mi8
   red2 r8 re mi fad\mbreak
   sol4 si la4.  sol8
   
   %25
   fad2 fad4. sol8
   fad4 sol8 mi red4. mi8
   mi2 \once\set suggestAccidentals = ##t dod?4. dod8
   
   %28
   fad dod dod re mi fad sol fad\mbreak
   mi2 r8 si' la sol

}

Xtmbn = \relative do {
   
   re4 re8 re re4 re
   re2 re4 re
   re2 sol,4 sol
   
   %4
   la2 la4 la
   la2 la4 la
   re2 la4 la\mbreak
   
   %7
   re2 la4 la
   re re la4. re8
   re1
   
   %10
   R1*8
   R1*12

}

Xbcn = \relative do {
   
   re4 re8 re re4 re
   re2 re4 re
   re2 sol,4 sol
   
   %4
   la2 la4 la
   la la8 si dod4 la
   re2 dod\mbreak
   
   %7
   re dod
   re8 mi fad sol la4 la,
   re,1
   
   %10
   re'2~re
   dod~dod
   si~si\mbreak
   
   %13
   la2. la'4
   la4. la8 sol4 fad
   mi fad sol sol8 la 
   
   %16
   si si la sol fad4 sol 
   la2 r8 sol fad mi\mbreak
   la,4. la'8 sold2
   
   %19
   la la4. fad8
   si4. si8 mi,2
   la lad4. lad8
   
   %22
   si4 mi, fad2
   si, si'4. la8\mbreak
   sol2 la
   
   %25
   si2. sol4
   la2 si
   mi,4. mi8 la4. sol8
   
   %28
   fad4 mi8 re sol2\mbreak
   la r8 sol fad mi

}

Xbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \mark\markup\smaller{\musicglyph "scripts.segno" }
  s1*9
  \bar":|."\break
  s1*8
  \bar"||"%\break
  \mark\markup\center-column\tiny\italic {\musicglyph "scripts.segno""rondeau"\vspace #-0.3"one fois"}
  s1*12
  \bar "||"
  \mark\markup\center-column\tiny\italic {\musicglyph "scripts.segno""rondeau"\vspace #-0.3"deux fois"}

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

Xtmb = {
  \Xglobal
  \clef bass
  <<\Xtmbn \forma>>

}

Xbc = {
  \Xglobal
  \clef bass
  <<\Xbcn \forma \Xbfn>>
  \typeset

}

XIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

XIdsn =  \relative do'' {
   
   sib2. r8 sib
   fa'2. r8 fa
   re4 sib fa'4. fa8
   
   %4
   sib4. lab16 sol lab4. sib8
   sol4 mib sol4. sol8
   do,2 fa4. fa8
   
   %7
   si,4 sol mib'4. mib8
   la,2 re4. re8
   re4 mib8 re do4. sib?8\mbreak
   
   %10
   sib4 fa sib4. do8
   re4 do8\prall sib fa'4. fa8
   fa2. r8 fa
   
   %13
   sol4. sol16(la) la4.\prall sol16 la
   sib4 re, sol4. fa8
   mib4 fa8 sol do,4.\prall do8
   
   %16
   do1 do2. la8 sib
   do4 fa, fa' fa8 mib
   re4 sib sib' sib8 lab\mbreak
   
   %19
   sol4 fa8 mib fa4 sol8 lab
   sol4 mib2 sol4
   lab lab8 sol fa mib re do
   
   %22
   si4 sol2 sol'8 mib
   lab sol fa mib re4\prall sol8 fa
   \once\set suggestAccidentals = ##t mi?4 do2 do'8 sib  %%ripresa petit
   
   %25
   la4 fa sib8 la sib fa
   sol8 [la sib lab sol fa mib re]
   mib fa sol do, do4. sib8\mbreak
   
   %28
   sib1~sib2. la8 sib
   sib2. do'8 sib  %%ripresa petit
   la4 fa sib8 la sib fa
   
   %31
   sol8[la sib lab sol fa mib re]
   mib fa sol do, do4. sib8\mbreak
   sib1

}

XIhcn = \relative do'' {
   
   fa,4. fa8 sol2
   la4 sib do4. do8
   sib1~
   
   %4
   sib4 sib sib4. sib8
   sib4 sol2 sol4
   sol2 fa4. fa8
   
   %7
   fa2 mib4. mib8
   mib2 re4 mib8 fa
   sol4 sol8 fa fa4. mib8\mbreak
   
   %10
   re2 fa4. fa8
   fa4. sol8 la4. sib8
   do4 sib8 la sib4 re
   
   %13
   do2 do4. do8
   re4 si8 do re4 si
   do4. \once\set suggestAccidentals = ##t sib?16 do la4 sol
   
   %16
   la1 la2. fa8 sol
   la4. sib8 do4 la
   sib2. r8 sib\mbreak
   
   %19
   sib4 lab8 sol sib4. sib8
   sib4 sib2 do4
   do4. sib8 lab4 lab
   
   %22
   sol2. do8 sib
   lab4 lab sol4. sol8
   sol4 sol do4. do8
   
   %25
   do2 sib4. sib8 %% rep
   sib2. r8 sib
   sib4 do8 sib la4. sib8\mbreak
   
   %28
   sib1~
   sib2. fa8 sol  sib2.  r8 sib 
   do2 sib4. sib8 %% rep
   
   %31
   sib2. r8 sib
   sib4 do8 sib la4. sib8\mbreak
   sib1
   
}

XItln =  \relative do' {
   
   re4. re8 re4 sib
   do4. do8 fa4. fa8
   fa4 re2 re8 mib
   
   %4
   fa2 re4. re8
   re4 do2 re4
   mib2 do4 re
   
   %7
   re \once\set suggestAccidentals = ##t si? do4. do8
   do2 \once\set suggestAccidentals = ##t sib?4. sib8
   sib4 do la4. sib8\mbreak
   
   %10
   sib2 re4. do8
   sib4 do2 fa4
   mib4. mib8 re4. re8
   
   %13
   mi!4. mi16 fa fad4.\prall mi16 fad
   sol2. r8 sol
   sol4 fa2 \once\set suggestAccidentals = ##t mi?4
   
   %16
   fa1 fa2. do4
   fa2. r8 fa
   fa4 re mib fa\mbreak
   
   %19
   mib mib2 re4
   mib sol2 sol4
   fa2. r8 fa16 mib
   
   %22
   re4 re mib4. re8
   do4 re8 do si4. do8
   do4. re8 \once\set suggestAccidentals = ##t mi?4. mi8
   
   %25
   fa4. mib8 re4 re %rep
   mib8 fa sol fa mib4. fa8
   sol4 sol fa4. mib8\mbreak
   
   %28
   re1~
   re2. do4 re2. \once\set suggestAccidentals = ##t mi?4
   fa4. mib8 re4 re %rep
   
   %31
   mib8 fa sol fa mib4. fa8
   sol4 sol fa4. mib8\mbreak
   re1

}

XIbcn = \relative do {
   
   sib'4 la sol2
   fa fa,4. fa8
   sib2. r8 do
   
   %4
   re2 sib4. sib8
   mib4. re8 do4 sib
   lab2. fa4
   
   %7
   sol2 do4. do8
   fa,4 fa' sib, do8 re
   mib4 mib fa fa,\mbreak
   
   %10
   sib2. fa4
   sib8 sib' la sol fa4. sol8
   la4 sol8 fa sib4. sib8
   
   %13
   sib2 la
   sol4 sol8 la si4 sol
   do8 do, re mib fa4 do
   
   %16
   fa, fa'8 sol la4 fa fa,2. fa'4
   fa4. sol8 la4 fa
   sib, sib'8 lab sol4 re\mbreak
   
   %19
   mib2 sib
   mib, mib'4 mib
   fa fa8 sol lab4 fa
   
   %22
   sol sol8 fa mib4 mib
   fa fa sol sol,
   do do'8 sib la4 la8 sol %% rep
   
   %25
   fa \once\set suggestAccidentals = ##t mib? fa do re4 sib
   mib2 mib4. sib8
   mib4 mib fa fa,\mbreak
   
   %28
   sib1~
   sib2. fa'4 sib,2 sib'4 la8 sol    
   fa \once\set suggestAccidentals = ##t mib? fa do re4 sib
   
   %31
   mib2 mib4. sib8
   mib4 mib fa fa,\mbreak
   sib1
   
}

XIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \repeat volta 2 {s1*15}
  \alternative {{s1}{\time 2/2 s}}\set Score.currentBarNumber = #17
  \repeat volta 2 {s1*11}
  \alternative{{s1~s}{s1}}\set Score.currentBarNumber = #30
  s1*4
  \bar"||"

}

XIds = {
  \XIglobal
  %\notypeset
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
  \typeset

}

XIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

XIIdsn =  \relative do'' {
   
   re4
   sol4. la8 sib4
   la sib sol
   fad4. mi8 re4
   
   %4
   sol4. la8 sib4
   la4 sib sol
   fad2 fad4
   
   %7
   sol4. la8 \once\set suggestAccidentals = ##t fa?4
   mi fa sol
   sol2\prall fa4
   
   %10
   do2.
   fa
   re4. mi8 fad4
   
   %13
   sol8 la fad4. sol8
   sol2 fad4 sol2.

}

XIIhcn = \relative do'' {
   
   sib4
   sib4. la8 sol4
   fad sol2
   la la4
   
   %4
   sib4. la8 sol [re'] 
   re2 do8 sib
   la2 la4
   
   %7
   si4. do8 re4\mbreak
   sib! la re
   do4. sib8 la4
   
   %10
   la2.
   do2 do4
   sib2 do4
   
   %13
   sib la4. re8
   sib2 la4 si2.

}

XIItln =  \relative do' {
   
   re4
   re2 re4
   re2 re4
   re2 re4
   
   %4
   re2 re8. mi16
   fad4 sol mib
   re2 re4 
   re sol2\mbreak
   
   %8
   sol4  \once\set suggestAccidentals = ##t  fa? fa
    \once\set suggestAccidentals = ##t mi?2 fa4
   fa2.
   
   %11
   la2 la4
   fad4. sol8 la4
   re, re4. re8
   
   %14
   re2 re4 re2.

}

XIIbcn = \relative do {
   
   sol'4
   sol4. fad8 sol4
   re2 mib4
   re8 mib re do sib la
   
   %4
   sol4. fad8 sol4
   re' sib do
   re2 re4
   
   %7
   sol,4. la8 si4\mbreak
   do re \once\set suggestAccidentals = ##t sib?
   do2 fa,4
   
   %10
   fa' mib8 re do sib
   la4 fa2
   sib la4
   
   %13
   sol re' re,
   sol2 re'4 sol,2.
   
}

XIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 3/4
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 50
  \partial 4 s4
  s2.*5
  s2 \bar ":..:" s4
  \repeat volta 2 {s2.*7}
  \alternative {{s2.}{s}}
  \bar"||"

}

XIIds = {
  \XIIglobal
  %\notypeset
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
  <<\XIIbcn \forma \XIIbfn>>
  \typeset

}

XIIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

XIIIdsn =  \relative do'' {
   
   re2. r8 re
   sol2. r8 sol
   sol1
   
   %4
   sol8. sol16 sol8. sol16 re8. re16 si8. re16
   sol,8. sol16 sol8. la16  si8. si16 si8. sol16\mbreak
   re'8. re16 sol8. fad16 mi8. mi16 la8. sol16
   
   %7
   fad8.[\once\set suggestAccidentals = ##t sold?16 la8. la16 fad8. fad16 re8. re16]
   re1 fad8.[\once\set suggestAccidentals = ##t sold?16 la8. la16 fad8. fad16 re8. re16] re1
   fad8. fad16 sol8. fad16 mi8. mi16 fad8. sol16\mbreak
   
   %10
   red4 mi8. mi16 dod8. dod16 la8. la16
   re?4 si8. si16 mi4 dod8. dod16
   fad4 re8. re16 sol8. fad16 mi8. mi16 
   
   %13
   la8. sol16 fad8. fad16 si8 la16 sol fad mi re dod\mbreak
   si8. si16 mi8. fad16 sol8 fad16 mi re do? si la
   sol8. la16 si8. do16 re8. sol16 fad8. sol16
   
   %16
   sol1

}

XIIIhcn = \relative do'' {
   
   si2. r8 si
   si2 do
   re mi
   
   %4
   re8. re16 re8. re16 si8. si16 sol8. re16
   mi8. mi16 mi8. re16 re8. re16 re8. mi16\mbreak
   fad8. la16 si8. si16 la8. la16 la8. la16
   
   %7
   la4 re8. re16 re8. re16 la8. la16
   si4 la8. la16 re8. re16 si8. si16  la4 re8. re16 re8. re16 la8. la16 la1
   re4 re8. re16 do8. do16 do8. do16\mbreak
   
   %10
   si8. si16 si4 la8. la16 la8. la16
   fad8. fad16 sol4  sold8. sold16 la4
   la8. [la16] si8 [re16 do si do si la sol8. sol16]
   
   %13
   la8. la16 la8. la16 re8 dod16 si la8 si16 la\mbreak
   sol8. sol16 sol8. la16 si8. la16 sol la sol fad
   mi8. fad16 sol8. fad16 sol la si8 la re16 do
   
   %16
   si1

}

XIIItln =  \relative do' {
   
   sol'2. r8 re
   mi2. r8 mi
   re2 do
   
   %4
   si8. si'16 si8. si16 sol8. sol16 re8. si16
   do8. do16 do8. la16 sol8. sol'16 sol8. sol16\mbreak
   re4 re re dod
   
   %7
   re8. mi16 fad8. sold16 la8. la16 fad8. fad16
   sol4 fad8. fad16 re8. re16 sol8. sol16 re8. mi16 fad8. sold16 la8. la16 fad8. fad16 fad1
   la8. la16 si8. la16 sol8. sol16 la8. sol16\mbreak
   
   %10
   fad4 mi8. mi16 mi8. mi16 re8. re16 
   re8. re16 re4 mi8. mi16 mi4
   fad8. fad16 fad4 sol8. sol16 sol fad mi re
   
   %13
   dod8. dod16 re8. re16 re8. mi16 re8. re16\mbreak
   mi2 re4. re8
   do4 re4. re8 re8. re16 
   
   %16
   re1

}

XIIIbcn = \relative do {
   
   sol2. r8 sol'
   mi2. r16 mi re do
   si2 do
   
   %4
   sol sol'8. sol16 sol8. sol16
   mi8. mi16 mi8. fad16 sol2\mbreak
   fad4 mi la la,
   
   %7
   re2._\markup\italic "entiere la seconde fois" r8 do
   si8.[do16 re8. re16 si8. si16 sol8. sol16 ] re'1 re,
   re''4 si8. si16 do8. si16 la8. la16\mbreak
   
   %10
   si8. do16 sold4 la8. la16 fad8. fad16
   re8. re16 sol4 mi8. mi16 la4
   fad8. fad16 si4 sol8. sol16 do8. si16
   
   %13
   la sol fad mi re mi re do si8. dod16 re8. si16\mbreak
   mi8. re16 do8. re16 si4. si8
   do4 sol8. la16 si8 sol re' re,
   
   %16
   sol1

}

XIIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \tempo 2 = 50
  \repeat volta 2 {s1*6}
  \alternative {{s1 s}{s s}}\set Score.currentBarNumber = #9
  \bar ".|:"
  s1*8
  \bar":|."


}

XIIIds = {
  \XIIIglobal
  %\notypeset
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
  \typeset

}
#(set-global-staff-size 18)


\pointAndClickOn

\paper {
   print-first-page-number = ##t
   first-page-number = #2
}

\bookpart {

   \paper {
      systems-per-page = #4
   }

   \header {
      title = \markup\smaller "Ouverture & Suite de Polieucte H.498"
      composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
   }

   \markup \huge  {"[1.] Ouverture du prologue de Polieucte pour le Collège d'Harcourt"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 do''2^\markup \center-align\smaller"[Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Ids
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sol'8.^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"}[sol'16]}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Ihc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 mi'8.^\markup \center-align\smaller"[Taille]"[mi'16]}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \Itl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.midiInstrument = #"cello"
            \Ibc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[2.] Amours profanes: jeux et plaisirs"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 sol'4}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 mi'8[fa']}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 do'8[re']}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \IItl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[3.] Panthomines pour les mesmes"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 do''8}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIIds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sol'8}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIIhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 mi'8}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \IIItl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[4.] Marques de zelle - guayement"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2 si'4. si'8}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IVds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 2/2 sol'4. sol'8}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IVhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key do\major \time 2/2 re'4. re'8}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \IVtl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \IVbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[5.] La grace et les vertus"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 do''8}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Vds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sol'8}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Vhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 mi'8}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \Vtl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \Vbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[6.] Le despespoir"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 la'16[sib']}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sib'8.[la'16]}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re'8.[do'16]}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \VItl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \VIbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[7.] Les crocheteurs"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \time 2/2 sol''2 re''}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIIds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit {
               \clef soprano \key fa\major \time 2/2
               sib'2 sol'
            }
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIIhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 re'2 sib}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \VIItl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \VIIbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[8.] Sentiments généreux et lasches"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 sol''4 la''}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIIIds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 sib'4 do''}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIIIhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 re'2 sol'4}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \VIIItl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \VIIIbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[9.] Amours forgerons"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sib'2.}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IXds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 fa'2}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IXhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re'4.}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \IXtl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \IXbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[10.] Marche de triumphe"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key re\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 la''4^\markup \center-align\smaller\center-column {"Viollons et"\vspace #-0.4"Trompettes [I]"} }
            \clef violin
            \set Staff.midiInstrument = #"trumpet"
            \Xds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re''4^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"} }
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Xhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key re\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 fad'4^\markup \center-align\column\smaller{"[Taille]"} }
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \Xtl
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup  \center-column{"Trompettes [II]"\vspace #-0.4"Timballe"}
            \set Staff.midiInstrument = #"timpani"
            \Xtmb
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.instrumentName = \markup \center-column{"Viollon"}
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
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[11.] La joye seulle"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sib'2.^\markup \center-align\smaller"[Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 fa'4.^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"}fa'8}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re'4.^\markup \center-align\smaller"[Taille]" re'8}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \XItl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.midiInstrument = #"cello"
            \XIbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[12.] Pourquoi n'avoit pas le coeur tendre retourné"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 re''4}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIIds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 sib'4}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIIhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 re'4}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \XIItl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \XIIbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge  {"[13.] Combattants"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2 re''2.}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIIIds
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 2/2 si'2.}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIIIhc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key do\major \time 2/2 sol'2.}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \XIIItl
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         } <<
            \set Staff.midiInstrument = #"cello"
            \XIIIbc
         >>
      >>


      \layout {

         indent = 2\cm
         incipit-width = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
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
