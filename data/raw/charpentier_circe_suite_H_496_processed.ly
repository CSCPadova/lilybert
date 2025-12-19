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
   
   sol'2 r8 sol fa sol
   mib4. re8 mib4. fa8
   re2 r8 re mi? fad
   
   %4
   sol4. fad8 sol4. la8
   fad4 fad2 fad4
   sol sol sol4. fad8
   
   %7
   sol2. la4
   sib8 la sol4 fa?4. mib8
   re4 sol do, fa
   
   %10
   sib, mib8 re do4.\prall sib8
   sib2 fa'4. fa8\mbreak
   sol4. la8 la4.\downprall  sol16 la
   
   %13
   sib4. la8 sol4. sol8
   sol2 fa~
   fa4 mi la r16 sol fad sol 
   
   %16
   fad4 re8 fad mi sol fad la fad2.~fad4. re8 mib4
   fa4. mib8 re4 mib4. re8 do4
   re2 re4 re4. sib'8 fa4\mbreak
   
   %19
   sol8 lab sol fa mib re do4. sib8 la?4
   sib2.~ sib4. fa'8 mib4
   re4. mib8 fa4 mib4. re8 do4
   
   %22
   si si2~si4. fa'8 sol4
   lab4. sol8 fa mib re4. do8 si4
   do2.~do4. sol'8 fa4
   
   %25
   mi2.~mi4. la8 sol4\mbreak
   fad2.~fad4. sol8 la4
   sib4. la8 sib4 sol4.la8 sib4
   
   %28
   la4. sol8 la4 fa4. mib8 re4
   sol4. fa8 mib4 re4. mib8 do4
   re2 mi?4 fad4. mi8 re4
   
   %31
   la'2.~la
   r4 re,\solo re mib
   si si si4. si8
   
   %34
   do2 r8 do sib? la
   sib4 do8 re mib re do sib
   la4 re2 do4
   
   %37
   re mi? fa sol8 fa
   mi4 fad sol la8 sol
   fad2 sol~
   
   %40
   sol4 sol sol4. fad8
   sol1\mbreak
   r4 sol\tu sol lab
   
   %43
   mi mi mi4. mi8
   fa?2. fa4
   fa mib8 re re4.\prall do8
   
   %46
   do2. do4
   do re8 mi mi4.\downprall re16 mi
   fa4 fa fa sol
   
   %49
   re re re4. re8
   mib2 r8 sol fa mib\mbreak
   re4 mib8 fa do4.\prall sib16 do
   
   %52
   re2 do4. sib8
   la4 la' la sib
   fad fad fad4. fad8
   
   %55
   sol2 re4. re8
   mi4 fa8 sol sol4.\downprall fa16 sol
   la4 sol8 la fa4.\prall  mib8
   
   %58
   re4 re re mib\mbreak
   si si si4. si8
   do4 do do re
   
   %61
   la fa' mib4. fa8
   re2 sib'4 la
   sol4. fa8 mi?2
   
   %64
   do'4 sib la4. sol8
   fad4 re sol2~
   sol4 la8 sib fad4. sol8
   
   %67
   sol2.~sol4. re8 mib4 sol\longa
   
}

Ihcn = \relative do'' {
   
   re2. re4
   do4. sib8 do4. re8
   sib2 sib4. sib8
   
   %4
   sib2 do~
   do4 do sib la
   sib sol la sib8 do
   
   %7
   sib2 re4. re8
   re do sib4 do4. do8
   sib4 sib la la
   
   %10
   sol8 la sib4 sib4.\prall la8
   sib2 sib4 re
   do2. do4
   
   %13
   re2 dod4. sib8
   la2. la4
   la2. r8 la
   
   %16
   la4 la sib do la2.~la4. sib8 do4
   re4. do8 sib4 sib2 la4
   sib2 sib4 sib4. do8 re4\mbreak
   
   %19
   mib4. re8 do sib la4. sol8 fa4
   fa2.~fa4. sib8 do4
   sib4. do8 re4 sib2 lab4
   
   %22
   sol2 sol4 re'4. re8 do4
   do8 re do sib do la si4. la8 sol4
   sol2.~sol4. do8 re4
   
   %25
   do2.~do4. re8 dod4
   re2.~re4. sib8 do4
   re2 re4 do2 do4
   
   %28
   re2 do4 sib2 sib4
   sib2 la4 sol4. fad8 sol4
   fad2 sol4 la4. sib8 sol4
   
   %31
   fad2.~fad
   R1
   r4 sol\solo sol lab
   
   %34
   mi mi mi4. fad8
   sol4 la8 si do \once\set suggestAccidentals = ##t sib? la sol
   fad4 fad fad4. mi16 fad
   
   %37
   sol2 re'4. re8
   re2 do4. do8
   do4 sib do4. re8
   
   %40
   la4 re\tu re mib
   si si si4. si8\mbreak
   do2 do4. do8
   
   %43
   do2. do4
   do sib la re8 do
   si4 do si4. do8
   
   %46
   do4 mi,2 fa4
   sol do do re
   la la la4. la8
   
   %49
   sib2. sib4
   sib2. do4\mbreak
   sib sib la4. sib8
   
   %52
   sib4 la la sib
   fad fad fad4. sol8
   la2 r8 la sib do
   
   %55
   re4 do si4. la8
   sol2 do4. do8
   do4 sib8 do la4. sol8
   
   %58
   fa4 sol la4. la8\mbreak
   sol2. sol4
   sol1
   
   %61
   fa4 fa8 sol la4. la8
   sib4. do8 re2
   do4 si do2
   
   %64
   r4 re do4. do8
   do2 sib?~
   sib4 sib la re8 do
   
   %67
   sib2.~sib4. sib8 do4 sib\longa
   
}

Itln =  \relative do' {
   
   sib'2. sol4
   la2. la4
   la sol2 re4
   
   %4
   re2 do
   re2. re4
   re sib do sib8 la
   
   %7
   re2 sib'4 la
   sol re8 mib fa4. fa8
   fa4 mib do re
   
   %10
   re sol8 fa fa4. \once\set suggestAccidentals = ##t mib?8
   re2 re4. re8\mbreak
   mi4. fad8 fad4.\downprall mi16 fad
   
   %13
   sol4 re mi4. re8
   dod2 re~
   re4 re dod4. re8
   
   %16
   re4 fad8 la sol sib la do re,2.~re4. fa?8 mib4
   re4. mib8 fa4 sol4.  sol8 fa4
   fa8 sol fa mib re do re4. mib8 fa4\mbreak
   
   %19
   sib,2 do4 do4. sib8 do4
   re2.~re4. fa8 fa4
   fa2 sib4 sol4. fa8 mib4
   
   %22
   re4. re8 mib4 fa4. re8 sol4
   fa4. sol8 lab4 sol8 lab sol fa mib re
   mib2.~mib4. sol8 sol4
   
   %25
   sol4. fad8 sol4 la?2.~\mbreak
   la4. sol8 la4 re,4. mi8 fad4
   sol4. fa?8 sol4 mi4. fa8 [sol mi]
   
   %28
   fa4. mib8 fa4 re4. mib8 fa4
   mib4. re8 do4 sib4. la8 sol4
   la4. sib8 do4 re2 re4
   
   %31
   re2.~re
   R1*4
   r4 re\solo re mib
   si si si4. si8
   do4 sib? la4. la8
   re2 mib4 do
   re1
   <<r4\\\once\stemUp sol,>> sol'\tu re4. re8\mbreak
   sol4 mi8 fa sol4. sol8
   sol2. sol4
   do,2 re4. re8
   sol4 lab sol4. fa8
   mi4 sol sol lab
   mi mi mi4. re8
   do2 fa4. fa8
   fa2. fa4
   sol2. sol4\mbreak
   fa sol fa4. fa8
   fa2 mib
   re2. re4
   re1
   r4 sol sol lab
   mi mi mi4. mi8
   fa2 do4 re8 do
   sib2 re4. re8\mbreak
   re1
   mi4 mi mi4. re8
   do2 r8 fa fa fa
   fa2 sol4 re
   mib4. fa8 sol2
   la4 sol fad4. mi8
   re2. mib4
   re2. re4
   re2.~re4. fa?8 mib4 re\longa
  
}

Ibcn = \relative do {
   
   sol2 sol'
   sol fad
   sol r8 sol \once\set suggestAccidentals = ##t fad? sol
   
   %4
   mib4. re8 mib4. fa8
   re2 re4 do
   sib2 la
   
   %7
   sol2.  fad4
   sol sol' la2
   sib4 mib, fa re
   
   %10
   sol mib fa fa,
   sib2 sib'~\mbreak
   sib4 sib la sib8 la
   
   %13
   sol4. fa8 mi?2
   fa2. re4
   la'2 la,
   
   %16
   re,4 re'8 do sib4 la re,2.~re4. re'8 do4
   sib2 sib'4 mib,2 fa4
   sib,2. sib'8 do sib lab sol fa\mbreak
   
   %19
   mib4. re8 mib4 fa2 fa,4
   sib2.~sib4. sib'8 la4
   sib2 re,4 mib2 fa4
   
   %22
   sol4. fa8 mib4 re2 mib4
   fa2 fa4 sol4. fa8 sol4
   do,2.\parentSlur (do4.) do8 si4
   
   %25
   do4. do'8 sib4 la2 la,4\mbreak
   re4. re'8 do4 sib4. sib8 la4
   sol4. la8 sib4 do4. sib8 la sol
   
   %28
   fa4. sol8 la4 sib sib,8 do re4
   mib2 fa4 sol4. fa8 mib4
   re2.~re
   
   %31
   re,~re
   R1*9
   r4 sol'\tu sol lab\mbreak
   
   %42
   mi mi mi4. fa8
   do4 do' do sib
   lab sol fa re
   
   %45
   mib4. fa8 sol4 sol,
   do1
   do'2. do,4
   
   %48
   fa2. fa4
   sib, sib' sib do
   sol sol sol4. la?8\mbreak
   
   %51
   sib4 mib, fa fa,
   sib2 do
   re2. sol,4
   
   %54
   re re' re mib
   si si si4. si8
   do2 r8 sib?8 la sol
   
   %57
   fa4 sol la fa
   sib2 fad\mbreak
   sol4 sol' sol lab
   
   %60
   mi mi mi4. mi8
   fa2 la,4 fa?
   sib sib'8 la sol4 fa
   
   %63
   mib4. re8 do4 do'8 sib
   la2. la,4
   sib2. do4
   
   %66
   re2 re,
   sol2.~sol4. re'8 do4 sol\longa
   
}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 65
  \repeat volta 2 {s1*15}
  \alternative {{s1}{\time 6/4 \tempo 1. = 55 s1.}}\break
  \set Score.currentBarNumber = #17
  \repeat volta 2{s1.*15\break
                  \once \override Score.RehearsalMark.extra-offset = #'(0 . -1) \mark\markup\italic "Fugue" 
                  \time 2/2
                  \tempo 2 = 73
                  s1*35}
  \alternative {{\time 6/4 s1.}{\time 2/2 s\longa}}
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
   
   sol'1
   re2 re4. mi8
   fa2 re
   
   %4
   sol2. sol8 re
   mib2. mib4
   mib2 re4. re8
   
   %7
   re2. re4
   do4. re8 do4.\prall sib8
   la2 re4. do8
   
   %10
   sib2 do\mbreak
   re4 mib fa mib8\prall re
   mib2 mi4. mi8
   
   %13
   fa2 fad4. fad8
   sol4 la sib la8\prall sol
   la sol fa4 fa4.\prall mib8
   
   %16
   re2 sib'~
   sib4 sib la4. sib8
   fad2 sol~
   
   %19
   sol4 sol sol4. fad8
   sol\longa

}

IIhcn = \relative do'' {
   
   sib1
   sib2. do8 sib
   la2 si
   
   %4
   do re8 do si la
   sol2 do4 sib?
   la2. r8 la
   
   %7
   la2 sol~
   sol4. sib8 la4.\prall sol8
   fad2 fad4. fad8
   
   %10
   sol2 la\mbreak
   sib2 si4. si8
   do2. do4
   
   %13
   do sib? la4. la8
   sib4 do re do8 sib
   do2. do4
   
   %16
   sib4. do8 re2~
   re4 re do4. sib8
   la2 sib
   
   %19
   la4 re re4. mib8
   si\longa

}

IItln =  \relative do' {
   
   re2 sol
   fa sol4 re
   re2 fa
   
   %4
   mib re
   do2. r8 do
   do1
   
   %7
   sib2 r8 sib do re
   mib2. mib4
   re2. re4
   
   %10
   re2 do\mbreak
   fa4 mib re4. re8
   sol2. sol4
   
   %13
   la sol fad4. mi8
   re4 fa? fa4. mi8
   fa2. fa4
   
   %16
   fa2. sol8 fa
   mi2\prall mib4. fa8
   re2. mib4
   
   %19
   re2. r8 re
   re\longa

}

IIbcn = \relative do {
   
   sol2 sol4. la8
   sib2 sol
   re'2. re4
   
   %4
   mib2 si
   do4 sib? la sol 
   fad1
   
   %7
   sib,2. sib4
   do1
   re2. re'4
   
   %10
   mib2. fa8 mib\mbreak
   re2. mib8 re
   do2 do'4 sib
   
   %13
   la2 re4 do
   sib la sol2
   fa la,
   
   %16
   sib2. sol4
   do2. do4
   do2 sib4 do
   
   %19
   re2 re,
   sol\longa
   
}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 70
  s1*19
  s\longa
  \bar "|."


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
   
   sol'2. r8 re mib4. fa8
   re4.\prall mib16 re do4. re8 sib4.\prall la8
   sib4 sol re'4. mib8 fa4 re
   
   %4
   sol8[fad sol la sib la sib sol fad \once\set suggestAccidentals = ##t mi? fad sol]\mbreak
   la4 re, la'4. la8 la4. sol16 fad
   sol4. sol8 sol4 fa mi \once\set suggestAccidentals = ##t fad?8 sol
   
   %7
   fad2. re4 mi fad fad1
   la2 re,4. do8
   si4 sol sol'4. sol8\mbreak
   
   %10
   re4 mi fa sol8 fa
   mi4 do mib4. mib8
   mib4 fa8 sol fa4.\prall mib8
   
   %13
   re2 do4.^\markup\italic "petite reprise" re8
   mib re do sib la4. sol8
   sol2 do4. re8
   
   %16
   mib re do sib la4. sol8
   sol1 sol2 do4. re8
   mib re do sib la4. sol8
   
   %19
   sol1

}

IIIhcn = \relative do'' {
   
   sib2 si4. si8 do4 \once\set suggestAccidentals = ##t sib?8 la
   sib4. la8 sol4. la16 sol fad4. fad8
   sol4 sib la4. la8 la4 sib8 fa?
   
   %4
   sol4. sol8 fa4 sib la4. la8\mbreak
   re2. re4 re2
   re4. do8 sib4 sib la4. la8
   
   %7
   la2. fad4 sol la la1
   fad4 sol la2
   sol4 la8 si do4 si8 la\mbreak
   
   %10
   sol2 re'4. re8
   do4. sib8 la4 sib
   do sib la4.\downprall sol16 la
   
   %13
   sib4 sol la4. si8
   do sib? la sol fad4. sol8
   sol2 la4. si8
   
   %16
   do sib? la sol fad4. sol8
   sol1 sol2 la4. si8
   do sib? la sol fad4. sol8
   
   %19
   sol1
   
}

IIItln =  \relative do' {
   
   re2 sol2. sol4
   sol re mi2 re4. re8
   re4 re8 mi fa4 fa8 do re4 sib
   
   %4
   sib8 [la sib do re do re mib re dod re \once\set suggestAccidentals = ##t mi?]\mbreak
   fad2. fad4 fad4. sol16 la
   re,4. re8 mi4 re dod4. re8
   
   %7
   re2. la4 sib do? re1
   re2. re4
   re2 do4. do8\mbreak
   
   %10
   re2. sol4
   sol mi do sol'
   fa sib, do fa
   
   %13
   fa4. re8 mib4. fa8
   mib4 mib re4. do8
   si2 mib4. fa8
   
   %16
   mib4 mib re4. do8
   si1 si2 mib4. fa8
   mib4 mib re4. do8
   
   %19
   si1 
   
}

IIIbcn = \relative do {
   
   sol1 do2
   sol' mi fad4 re
   sol2 fa?4. mib8 re2
   
   %4
   mib sib4. do8 re2\mbreak
   re,2. re'4 do4. re8
   sib2 sol la
   
   %7
   re, re'4 do sib la re,1
   re'4 mi fad re
   sol fa? mib re8 do\mbreak
   
   %10
   si4. la8 si4 sol
   do4. re8 do4 sib
   la sol fa2
   
   %13
   sib mib4. re8
   do4 do re re,
   sol2 mib'4. re8
   
   %16
   do4 do re re,
   sol1 sol4 sol'8 fa mib4. re8
   do4 do re re,
   
   %19
   sol1

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 3/2
  \tempo 1 = 50
  \repeat volta 2 {s1.*6}
  \alternative {{s1.}{\time 2/2 s1}}\set Score.currentBarNumber = #8
  \repeat volta 2 {s1*9}
  \alternative {{s1}{s}}\set Score.currentBarNumber = #18
  s1*2
  \bar"|."

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
   
  re4 re4.\downprall do16 re
  mib4 mib2
  do4 fa4. mib8
  
  %4
  re4\prall re2
  mi?4 mi4. la8
  fad4 re sib'8 la
  
  %7
  sol4. la8 fad4
  sol2.  % fine rondeau
  sib4 re,4. mi8
  
  %10
  fa4. mib8 re4
  mib do4. do8
  do2.
  
  %13
  fa4 fa4. fa8
  fa4 sol8 fa mib4
  re8 mib do4.\prall sib8
  
  %16
  sib2.
  re4 re4.\downprall do16 re
  mib4 mib2
  
  %19
  do4 fa4. mib8
  re4\prall re2
  mi?4 mi4. la8
  
  %22
  fad4 re sib'8 la
  sol4. la8 fad4
  sol2. 
  
  %25
  la4 sol4. la8 %%% suite du rondeau
  fa4 fa2
  mi8 fa re4. mi8
  
  %28
  dod4 dod2
  mi4 mi4. mi8
  mi4. fa8 re4
  
  %31
  re4. mi8 dod4
  re2.
  re4 re4.\downprall do16 re
  
  %34
  mib4 mib2
  do4 fa4. mib8
  re4\prall re2
  
  %37
  mi?4 mi4. la8
  fad4 re sib'8 la
  sol4. la8 fad4
  
  %40
  sol2. 
  
}

IVhcn = \relative do'' {
   
   sol4 sol4. sol8
   sol4 sol2
   la4 la4.\downprall sol16 la
   
   %4
   sib4 sib2
   sol4 la4. la8
   la2 re8 do
   
   %7
   sib4. do8 la4
   sol2. %% rondò
   re'4 sib4. do8
   
   %10
   la4. la8 si4
   do sol4. sib?8
   la2.
   
   %13
   sib4. do8 re4
   sol,4. sol8 la4
   sib la4. sol8
   
   %16
   fa2 fad4
   sol4 sol4. sol8
   sol4 sol2
   
   %19
   la4 la4.\downprall sol16 la
   sib4 sib2
   sol4 la4. la8
   
   %22
   la2 re8 do
   sib4. do8 la4
   sol2. %% rondò
   
   %25
   fa4 sol la
   la la2
   la4 la sol
   
   %28
   la la2
   la4 sol4. sol8
   sol4. la8 fa4
   
   %31
   mi fad4. sol8
   fad4. re8 mi fad
   sol4 sol4. sol8
   
   %34
   sol4 sol2
   la4 la4.\downprall sol16 la
   sib4 sib2
   
   %37
   sol4 la4. la8
   la2 re8 do
   sib4. do8 la4
   
   %40
   sol2. %% rondò

}

IVtln =  \relative do' {
   
   sib4 si4.\downprall la16 si
   do4 do2
   fa fa8 fa
   
   %4
   fa4 fa2
   mi4 dod4. dod8
   re8 mi fad4 sol
   
   %7
   mib re4. do8
   si2. %% OOKK
   sol'4 sol re
   
   %10
   re2 re4
   sol mi4. sol8
   fa2 do4
   
   %13
   re4. mib8 fa4
   mib4. si8 do4
   fa fa4. mib8
   
   %16
   re4. mib8 re do
   sib4 si4.\downprall la16 si
   do4 do2
   
   %19
   fa fa8 fa
   fa4 fa2
   mi4 dod4. dod8
   
   %22
   re8 mi fad4 sol
   mib re4. do8
   si2. 
   
   %25
   re4 mi?4. mi8
   mi4 re2
   mi4 mi4. sol8
   
   %28
   mi4 mi2
   mi4 dod4. si8
   la2 sib?4
   
   %31
   sib la4. la8
   la4. fad8 sol la
   sib4 si4.\downprall la16 si
   
   %34
   do4 do2
   fa fa8 fa
   fa4 fa2
   
   %37
   mi4 dod4. dod8
   re8 mi fad4 sol
   mib re4. do8
   
   %40
   si2. 

}

IVbcn = \relative do {
   
   sol4 sol'8 fa mib re
   do re do sib la sol
   fa4 fa'8 mib re do
   
   %4
   sib4 sib2
   do4 la4. la8
   re4. do8 sib4
   
   %7
   do re2
   sol,2.  %%%rondò
   sol2 sol'4
   
   %10
   re2 sol4
   mib mi4. mi8
   fa4. sol8 fa mib
   
   %13
   re4. do8 sib4
   mib4. re8 do4
   sib fa' fa,
   
   %16
   sib8 do re do sib la
   sol4 sol'8 fa mib re
   do re do sib la sol
   
   %19
   fa4 fa'8 mib re do
   sib4 sib2
   do4 la4. la8
   
   %22
   re4. do8 sib4
   do re2
   sol,2.
   
   %25
   re'2 dod4
   re re2
   do4 sib!2
   
   %28
   la4 la2
   dod dod4
   fa,2 sol4~
   
   %31
   sol la2
   re,4 re'8 do sib la
   sol4 sol'8 fa mib re
   
   %34
   do re do sib la sol
   fa4 fa'8 mib re do
   sib4 sib2
   
   %37
   do4 la4. la8
   re4. do8 sib4
   do re2
   
   %40
   sol,2.
   
}

IVbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 3/4
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \repeat volta 2{s2.*8}
  s2.*8 
  \bar "||"
  s2.*8
  \bar "||"
  s2.*8
  \repeat volta 2 {s2.*8}

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

   sol4
   do la4. si8
   do4 sol do
   re4. mi8 fa re

   %4
   mi4 do mi
   re4.\prall do8 re si
   do2 si4

   %7
   re4. mi8 dod4
   re2 re4
   sol,4. la8 fad4

   %10
   sol2 sol4 sol2 re'4
   si do4. re8
   mi4 mi fa

   %13
   mi re4.\prall do8
   si2 mi4~
   mi4. si8 dod re

   %16
   dod4 la re~
   re4. la8 si do?
   si4 sol do

   %19
   sib4. la8 sib4
   la2 fa'4\mbreak
   re mi4. fa8

   %22
   sol[(fa)] mi re do4
   do4. re8 si4
   do2.

   %25
   r4 r re do2.

}

Vhcn = \relative do'' {

    mi,4
    la fa2
    sol4 mi sol
    la si2

    %4
    do4 sol la
    la4. si8 sold4
    la2 mi4

    %7
    la sol2
    fad sol?8 \once\set suggestAccidentals = ##t fa?
    mi2 re8 re

    %10
    re2 mi4 re2 \mbreak la'4
    sol la4. si8
    do4 do si8 la

    %13
    sold4 la4. si8
    sold2 la4
    si2.

    %16
    la2 la8 si
    la4 fad sol
    sol2 sol8 la

    %19
    sol4 mi sol
    fa4. sol8 la4\mbreak
    sol sol4. sol8

    %22
    do4. si8 la4
    la sol4. sol8
    sol4. fad8 sol la

    %25
    si2 la4 sol2.

}

Vtln =  \relative do' {

    do4
    mi re2
    do4. re8 mi4
    re4. do8 re4

    %4
    do mi la,
    si4. la8 si4
    mi4. re8 dod4

    %7
    re mi2
    la, re4
    do4. si8 la4

    %10
    si2 do4 si4. do8re4
    re mi8 fa sol4
    sol mi re

    %13
    do re8 mi fa4
    mi2.
    mi

    %16
    mi2 re4
    re2.
    re2 do4

    %19
    do2.
    do2 re4\mbreak
    si do4. re8

    %22
    mi re do4 do
    fa4. mi8 re4
    mi4. re8 mi fad

    %25
    sol4 re re mi2.

}

Vbcn = \relative do {

   do4
   la re2
   mi2.
   fa4 sol2

   %4
   do,2.
   si
   la4 la' sol

   %7
   fa mi2
   re4. do8 si4
   do la re

   %10
   sol, sol'8 fa mi re sol,4 sol' fad
   sol4. fa?8 mi re
   do2 re4

   %13
   mi fa re
   mi2 fad4
   sold2.

   %16
   la4. mi8 fad sol?
   fad4 re sol~
   sol4. re8 mi fa?

   %19
   mi4 do mi
   fa4. mi8 re4\mbreak
   sol, sol'4. fa8

   %22
   mi2 fa4
   re sol sol,
   do4. do8 si la

   %25
   sol4 sol' fad do2.

}

Vbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 3/4
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \partial 4 s4
  \repeat volta 2 {s2.*9}
  \alternative {{s2.}{s	\break}}\set Score.currentBarNumber = #11
  \once \override Score.RehearsalMark.extra-offset = #'(8 . 0) \mark\markup\italic {grand reprise}
  \repeat volta 2{s2.*13}
  \alternative {{s2.*2}{s2.}}
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

VIdsn =  \relative do'' {

    do4_\markup\italic "deux fois le commencement" do
    sol' mi\prall la fa\prall
    sol mi\prall fa re\prall
    mi do sol' sol,

    %4
    do2 sol'4 sol
    sol la sib la8 sol
    la2 la4(sol8.\prall) fa16

    %7
    mi4(fa) sol(fa8.\prall) mi16
    re2.\prall re4
    re4.\prall do8 re4 mi\mbreak

    %10
    re4\prall re re8 do re mi
    re2\prall re8 do re mi
    re2\prall re4 mi

    %13
    fa2 r8 mi fa sol
    la4 la mi4. fa8
    sol4 do, re4. do8

    %16
    si2 si1
    R1*9
    r2 r8 re^\markup\italic "recit"mi fad

    %27
    sol4 sol sol  re
    sol sol r8 re mi fad
    sol4 sol sol re\mbreak

    %30
    sol2 do4. sol8
    la4 la8 la sol4. fa8
    mi4\prall re fa fa

    %33
    fa4. sol8 la4 sib
    sol\prall fa la sol
    fa mi re4. sol8

    %36
    si,2 re4 mi
    fa8[(mi) fa(sol) la(sol) la(si?)]\mbreak
    do4 sol la^\markup \italic"reprise seulement icy" mi

    %39
    fa8[mi] re do sol'4 sol,
    do2 la'8(sol) fa(mi)
    re4 mi8 fa re4.\prall do8

    %42
    do2 la'4 mi
    fa8[mi] re do sol'4 sol,
    do2 la'8(sol) fa(mi)

    %45
    re4 mi8 fa re4.\prall do8
    do\longa

}

VIhcn = \relative do'' {

    sol4 la
    si sol la si
    do si la si
    sol la si4. la8

    %4
    sol2 do4 do
    do mi re do
    do2 do4 si

    %7
    do(re) mi(re8.\prall)  do16
    si2.\prall si4
    si4.\prall la8 si4 do\mbreak

    %10
    si si si8 la si do
    si2\prall si8 la si do
    si2\prall si4 dod

    %13
    re2 do
    do4 si la4. la8
    si4 la la4. sol8

    %16
    sol2 sol1
    sol4^\markup\italic "recit" la si sol
    do2 do4. sol8

    %19
    la2 sib4. la8\mbreak
    sol4 fa do' do,
    fa fa r2

    %22
    r4 la^\markup\italic "recit" sol fa
    mi fa mi re
    dod2. la'4

    %25
    sol fa sol8 mi la4
    <<fad4\\{r8 la^\markup\italic "recit" si dod}>> re4 la
    re mi si8 sol la si

    %28
    do la si do re4 la
    re mi si8 sol la si\mbreak
    do2 mi4.\tu re8

    %31
    dod4 re re4. mi8
    dod4 la la la
    sib2 do4 re

    %34
    do la re4. do8
    si4 la sol fad
    sol2 fa?4 sol

    %37
    la8[(sol) la(si) do(si) do(re)]\mbreak
    mi4 do re do
    si4. la8 si4. la8

    %40
    sol2 la4. la8
    sol4 la sol4. sol8
    sol2 re'4 do

    %43
    si4. la8 si4. la8
    sol2 la4. la8
    sol4 la sol4. sol8

    %46
    sol\longa

}

VItln =  \relative do' {

    mi4 mi
    re do do re
    mi4. re8 do4 si
    do do re4. re8

    %4
    mi4 fa mi fa
    sol mi fa sol
    fa2 fa4(mi8.\prall) re16

    %7
    do4 si do re
    re sol2 sol4
    sol2 sol4 fad\mbreak

    %10
    sol8 fad sol la sol4 fad
    sol8 fad sol la sol4 \once\set suggestAccidentals = ##t fad?
    sol2. sol4

    %13
    la2 la,8 do re mi
    fa4 mi8 re do4. re8
    mi4 mi fad re8 re

    %16
    re2 re1
    R1*4
    r4 la'^\markup\italic "recit" sol fa

    %22
    mi fa mi re
    dod re dod si
    la2. fa'4

    %25
    mi re re dod
    re2 r
    R1*3

    %30
    r2 sol4.\tu sol8
    fa4 fa8 fa mi4. mi8
    mi4\prall fa re re

    %33
    re4. mi8 fa4 sol
    mi do fa4. do8
    re4 mi si do

    %36
    re2. r8 re
    do2 fa4 re\mbreak
    sol mi re mi

    %39
    la,8[do si do re si do re]
    mi2 fa8(mi) re(do)
    si4 do8 re si4. sol'8

    %42
    mi2 re4 mi
    la,8[do si do re si do re]
    mi2 fa8(mi) re(do)

    %45
    si4 do8 re si4. sol'8
    mi\longa

}

VIbcn = \relative do {

    do2
    si4 do fa,2
    do' fa4 sol
    mi la sol4. fa8

    %4
    mi4 re do re
    mi do re mi
    fa fa, fa' sol

    %7
    la sol8 fa mi4 fa
    sol1
    sol\mbreak

    %10
    sol,
    sol
    sol4 sol' fa mi

    %13
    re8 do re mi fa2
    r8 mi fa sol la4 sol8 fa
    mi4 la, re2

    %16
    sol, sol1
    R
    do4^\markup\italic "recit" re mi do

    %19
    fa2 sib,\mbreak
    do4 re do4. sib8
    la4 fa sol2

    %22
    la4 fa sol2
    la1~
    la4 sol fa2

    %25
    sol la
    re,4 sol re' do
    si do sol sol'8 fa

    %28
    mi4 sol re do
    si do sol sol'8 fa\mbreak
    mi4 re do2\tu

    %31
    fa, sol
    la4 re, re' do
    sib2 la4 sol

    %34
    do fa, fa' mi
    re do si? la
    sol la sib2

    %37
    la4 la'8 sol fa2\mbreak
    mi2 fa8 sol mi fa
    re do si la sol4 sol'8 fa

    %40
    mi re do4 fa,2
    sol4 fa sol2
    do2 fa8 sol mi fa

    %43
    re do si la sol4 sol'8 fa
    mi re do4 fa,2
    sol4 fa sol2

    %46
    do\longa

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 2/2
    \tempo 1 = 46
    \repeat volta 2 {
        \partial 2 s2
        s1*15
    }
    \alternative {{\set Score.measureLength = #(ly:make-moment 2 4) s2}{\set Score.measureLength = #(ly:make-moment 4 4) s1}}\set Score.currentBarNumber = #17
    \bar "||"
    s1*29
    s\longa
    \bar"|."

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

    r4 la'4. la8
    re,4 sol4. sol8
    dod,4 la'8 sol fa4

    %4
    sol8 fa mi4 re8 dod
    re4 la'4. la8
    re,4 sol4. sol8
    dod,4 la'8 sol fa4

    %8
    sol8 fa mi4 re8 dod
    re4 la'^\markup\tiny {\musicglyph "scripts.segno"}  _\markup\italic "pour suivre apres la fin" sib~
    sib8 [la sib8. sol16] la4~

    %11
    la8[sol la8. fad16] sol4~
    sol8[fa sol8. mi16 fa8. sol16]
    fa4. mi8[fa8. re16]

    %14
    mi4. re8[mi8. dod16]
    re4. do?8[re8. \once\set suggestAccidentals = ##t sib?16]
    do4 dod4.\downprall si16 dod

    %17
    re4 la'4. la8\mbreak
    re,4 sol4. sol8
    dod,4 la'8 sol fa4

    %20
    sol8 fa mi4 re8 dod
    re4 la'4. la8
    re,4 sol4. sol8

    %23
    dod,4 la'8 sol fa4
    sol8 fa mi4 re8 dod
    re mi fa sol la si

    %26
    do4. sib8 la4\mbreak
    sib8 la sib sol la sib
    sol2\prall fa4

    %29
    la8 sib la sol fa mi
    fa4. mi8 re4
    do8 si si4.\prall la8

    %32
    la4 la'8 sol fa mi
    re4 sol8 fa mi re
    dod4 la'8 sol fa4

    %35
    sol8 fa mi4 re8 dod\mbreak
    re4 la'8 sol fa mi
    re4 sol8 fa mi re

    %38
    dod4 la'8 sol fa4
    sol8 fa mi4 re8 dod
    re4 la'2

    %41
    r4 re,2
    r4 sol2
    r4 dod,4.\downprall si16 dod

    %44
    re8 mi fa mi re do?\mbreak
    si do re si do re
    mi re mi fa sol mi

    %47
    fa mi fa la, si dod
    re4 la'8 sol fa mi
    re4 sol8 fa mi re

    %50
    dod4 la'8 sol fa4
    sol8 fa mi4 re8 dod
    re4 la'8 sol fa mi

    %53
    re4 sol8 fa mi re
    dod4 la'8 sol fa4
    sol8 fa mi4 re8 dod\mbreak

    %56
    re4 fa re
    mi mi dod
    re re8 do re mi

    %59
    fa4 fa4. mi8
    fa sol la4 r
    sol8 fa mi4 r

    %62
    fa8 mi re4 r
    fa mi8.[fa16 mi8. re16]
    dod4 la'8 sol fa mi

    %65
    re4 sol8 fa mi re
    dod4 la'8 sol fa4
    sol8 fa mi4 re8 dod

    %68
    re4 la'8 sol fa mi
    re4 sol8 fa mi re
    dod4 la'8 sol fa4

    %71
    sol8 fa mi4 re8 dod\mbreak
    re2.
    re4 sol4. sol8

    %74
    sol fa sol mi fa sol
    fa4 fa4.\prall mi16 fa
    mi8 sol fa sol fa mi

    %77
    re dod re mi fa re
    sol la sib la sol fa
    mi re mi do? re mi

    %80
    fa4 la4. la8
    re,4 sol4. sol8\mbreak
    dod,4 la'8 sol fa4

    %83
    sol8 fa mi4 re8 dod
    re4 la'8[sol la8. la16]
    re,8 [re sol fa sol8. sol16]

    %86
    dod,8 la la' sol fa la
    sol fa mi re mi dod
    re\breve re4 s8^\markup\tiny {\musicglyph "scripts.segno"}  _\markup\italic \right-align "quand on veut pour finire l'on prend cette derniere notte"

}

VIIhcn = \relative do'' {

    r4 fa,4. fa8
    fa4 sib4. sib8
    la4. la8 la4

    %4
    sib la4. la8
    la4 fa4. fa8
    fa4 sib4. sib8

    %7
    la4. la8 la4
    sib la4. la8\mbreak
    la4 re4. ^\markup\tiny {\musicglyph "scripts.segno"} re8

    %10
    sol,4 do4. do8
    fa,4 sib4. sib8
    mi,4 la4. la8

    %13
    la4 la sib~
    sib8[la sib8. sol16] la4~
    la8[sol la8. fad16] sol4~

    %16
    sol8[fa? sol8. mi16 fa8. sol16]
    fa4 fa4. fa8\mbreak
    fa4 sib4. sib8

    %19
    la4. la8 la4
    sib la4. la8
    la4 fa4. fa8

    %22
    fa4 sib4. sib8
    la4. la8 la4
    sib la4. la8

    %25
    la2 la4
    la4 \once\set suggestAccidentals = ##t sib? do8 re\mbreak
    re4 do do

    %28
    do4. sib8 la4
    dod8 re dod si? la4
    la8 sol fa sol la4

    %31
    la sold4. fad8
    mi4 fa?8 sol? la sol
    fa4 sib4. sib8

    %34
    la4. la8 la4
    sib la4. la8\mbreak
    la8 sol fa mi fa4

    %37
    fa sib4. sib8
    la4. la8 la4
    sib la4. la8

    %40
    la4. re8[do8. re16]
    sib8 do sib la sib do
    si!4 mi8 dod re sib

    %43
    la2 r8 la
    la4 la2\mbreak
    r4 sol2

    %46
    r4 sol2
    r4 la sol
    fa fa8 sol la sol

    %49
    fa4 sib4. sib8
    la4. la8 la4
    sib la4.la8

    %52
    la sol fa mi fa4
    fa sib4. sib8
    la4. la8 la4

    %55
    sib la4. la8\mbreak
    la4 la8 sol la si
    do4 sol8 fa sol la

    %58
    sib4 fa8 mi fa sol
    la4 sib do8 sib
    la si? do la re do

    %61
    si4 do8 re mi4\mbreak
    re la8 sol la si
    do4 si4. la8

    %64
    la sol fa mi fa4
    fa sib4. sib8
    la4. la8 la4

    %67
    \once\set suggestAccidentals = ##t sib? la4. la8
    la sol fa mi fa4
    fa sib4. sib8

    %70
    la4. la8 la4
    sib la4. la8\mbreak
    la4 la4. la8

    %73
    sib do sib la sol fa
    mi2 la4
    la8 sol fa sol la sib

    %76
    do sib do la sib do
    sib \once\set suggestAccidentals = ##t  dod? sib la sol la
    sib la sol do sib re

    %79
    do sib la do sib sol
    la4 fa4.fa8
    fa4 sib4. sib8\mbreak

    %82
    la4. la8 la4
    sib la4. la8
    la [sol fa mi fa8. fa16]

    %85
    fa8[fa sib do sib sib]
    la4. la8 la la
    si? si la la la la

    %88
    fad\breve fa!4 s8^\markup\tiny {\musicglyph "scripts.segno"}

}

VIItln =  \relative do' {

    r4 re4. dod8
    re2 mi4
    mi4. mi8 re4

    %4
    mi8 re dod4 re8 mi
    fa4 re4. dod8
    re2 mi4

    %7
    mi4. mi8 re4
    mi8 re dod4 re8 mi\mbreak
    fa4. mi8^\markup\tiny {\musicglyph "scripts.segno"}[fa8. re16]

    %10
    mi4. re8[mi8. dod16]
    re4. do?8[re8. \once\set suggestAccidentals = ##t sib?16]
    do4 dod4. si16 dod

    %13
    re4 re4. re8
    sol,4 do4. do8
    fa,4 sib sol
    la la4. la8

    %17
    la4 re4. dod8\mbreak
    re2 mi4
    mi4. mi8 re4

    %20
    mi8 re dod4 re8 mi
    fa4 re4. dod8
    re2 mi4

    %23
    mi4. mi8 re4
    mi8 re dod4 re8 mi
    fa mi re mi fa sol

    %26
    mi2 fad4\mbreak
    sol8 fa? sol mi fa sol
    mi4. re8 do4

    %29
    mi2 mi4
    re4. re8 do4
    fa8 sol fa mi re mi

    %32
    dod4 re4. dod8
    re2 mi4
    mi4. mi8 re4

    %35
    mi8 re dod4 re8 mi\mbreak
    fa mi re dod re dod
    re2 mi4

    %38
    mi8 re mi dod re4
    mi8 re dod4 re8 mi
    fa mi fa sol la sol

    %41
    fa4. mi8 re4
    sol mi4. mi8
    mi re mi dod re mi

    %44
    fa sol la sol fa mi\mbreak
    re do si sol la si
    do si do la sib do

    %47
    la4 re mi
    la, re4. dod8
    re2 mi4

    %50
    mi4. mi8 re4
    mi8 re dod4 re8 mi
    fa mi re dod re dod

    %53
    re2 mi4
    mi8 re mi dod re4
    mi8 re dod4 re8 mi\mbreak

    %56
    fa4 re fa
    sol do, mi
    fa sib,4. sib8

    %59
    do4 re do
    do fa8 sol fa4
    mi8 fa sol mi la4\mbreak

    %62
    la8 sol fa4. sol8
    la4 sold4. fad8
    mi4 re4. dod8

    %65
    re2 mi4
    mi4. mi8 re4
    mi8 re dod4 re8 mi

    %68
    fa mi re dod re dod
    re2 mi4
    mi8 re mi dod re4

    %71
    mi8 re dod4 re8 mi\mbreak
    fa4 fad4. fad8
    sol la sol fa? mi re

    %74
    dod4 dod4. si16 dod
    re2 sib4
    la la'8 sib la sol

    %77
    fa mi re do re re
    re do sib do re sol
    sol fa mi la sol mi

    %80
    do4 re4. dod8
    re2 mi4\mbreak
    mi4. mi8 re4

    %83
    mi8 re dod4 re8 mi
    fa mi re dod re dod
    re4. re8[mi8. mi16]

    %86
    mi8 re mi dod re fa
    mi re dod re dod mi
    re\breve re4. s8^\markup\tiny {\musicglyph "scripts.segno"}

}

VIIbcn = \relative do {

    r4 re4. la'8
    sib2 sol4
    la4. dod,8 re4

    %4
    sol, la4. la8
    re,4 re'4. la'8
    sib2 sol4

    %7
    la4. dod,8 re4
    sol, la2\mbreak
    re2.

    %10
    do?^\markup\tiny {\musicglyph "scripts.segno"}
    sib
    la

    %13
    re4 re, re'
    do do, do'
    sib sib, sib'

    %16
    la la'4. la8
    re,4 re4. la'8\mbreak
    sib4. la8 sol4

    %19
    la4. dod,8 re4
    sol, la4. la8
    re,4 re'4. la8

    %22
    sib4. la8 sol4
    la8 si? dod la re4
    sol, la2

    %25
    re re4
    la4. la8 re4\mbreak
    sol, do fa,

    %28
    do'2 fa,4
    dod'2.
    re8 \once\set suggestAccidentals = ##t dod? re mi fa4

    %31
    re mi4. mi8
    la,4 re4. la'8
    sib4. la8 sol4

    %34
    la8 sol fa dod re4
    sol la8 sol fa mi\mbreak
    re4 re4. la8

    %37
    sib4. la8 sol4
    la8 si? dod la re4
    sol, la2

    %40
    re8 dod re mi fa re
    sib' la sib do sib la
    sol fa sol la sib sol

    %43
    la sib la sol fa mi
    r4 re2\mbreak
    r4 sol,2

    %46
    r4 do2
    r4 fa, mi
    re re'4. la'8

    %49
    sib do sib la sol4
    la8 sol fa dod re4
    sol la8 sol fa mi

    %52
    re4 re4. la8
    sib do sib la sol4
    la8 si? dod la re4

    %55
    sol, la2\mbreak
    re2.
    do

    %58
    \once\set suggestAccidentals = ##t sib?
    la4 sol do
    fa, fa'8 mi re4

    %61
    mi mi8 re dod4
    re re8 mi fa4
    re mi8 re mi mi,

    %64
    la4 re4. la'8
    sib do sib la sol4
    la8 sol fa dod re4

    %67
    sol la8 sol fa mi
    re4 re4. la8
    sib do sib la sol4

    %70
    la8 si? dod la re4
    sol, la2\mbreak
    re8 mib re do sib la

    %73
    sol fa sol la sib sol
    la \once\set suggestAccidentals = ##t sib? la sol fa mi
    re dod' re mi fa sol

    %76
    la sol la fa sol la
    sib la sib do sib la
    sol fa sol la \once\set suggestAccidentals = ##t sib? sol

    %79
    do re do la sib do
    fa,4 re4. la'8
    sib2 sol4\mbreak

    %82
    la4. dod,8 re4
    sol la8[sol la8. la16]
    re,4 re4. la8

    %85
    sib [do sib la sol8. sol16]
    la8 si? dod la re re
    sol, [sol la sol la8. la16]

    %88
    re,\breve re'2. s8^\markup\tiny {\musicglyph "scripts.segno"}

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 60
    s2.*87
    \set Score.measureLength = #(ly:make-moment 8 4) s\breve \bar "||"\set Score.measureLength = #(ly:make-moment 3 4) s2.

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

    re4 la'2
    sol4. fa8 mi4
    fa8 sol fa mi re4

    %4
    sol8 la sol fa mi4
    re la'2
    sol4. fa8 mi4

    %7
    fa8 sol fa mi re4
    mi2.
    mi4 la,2
    mi'4. re8 dod4\mbreak

    %11
    re mi4.\downprall re16 mi
    fa8 sol fa mi re4
    sol fad2

    %14
    sol8 fad sol la sib4
    sol8 la fad4. mi16 fad
    sol2.

    %17
    mi4 la,2
    mi'4. re8 dod4
    re mi4.\downprall re16 mi\mbreak

    %20
    fa8 sol fa mi re4
    sol mi2
    la8 sol fa mi re dod

    %23
    re mi mi4.\prall re8
    re2.
    sol4^\markup\italic "petite reprise" mi2
    la8 sol fa mi re dod

    %27
    re mi mi4.\prall re8
    re2. re re4
    la' sol8 fa sol4 fa8 mi

    %30
    fa4 re2 mi4
    fa8 mi re do si4 mi8 re\mbreak
    dod4 la2 re4

    %33
    la' sol8 fa sol4 fa8 mi
    fa4 re2 mi4
    fa8 mi re do si4. la8

    %36
    la2. mi'4^\markup\italic"grande reprise"
    fa fa8 mi re4 re8 do
    si4 si2 sol'8 mi

    %39
    fa sol mi fa re4.\prall do8\mbreak
    do2. mi8 fa
    sol4 re8 mi fa4 fa8 sol

    %42
    la4 la2 sol8 fa
    sib la sol fa mi4 re8 dod
    re2. re mi8_\markup\italic "petite reprise" fa

    %45
    sol4 re8 mi fa4 fa8 sol
    la4 la2 sol8 fa
    sib la sol fa mi4 re8 dod

    %48
    re2.

}

VIIIhcn = \relative do'' {

    la4 la re
    sib2 la4
    la2 sib4

    %4
    sib2 la4
    la la re
    sib2 la4

    %7
    la4. la8 \once\set suggestAccidentals = ##t sib?4
    dod2.
    la4 fad2

    %10
    sold4. fad8 mi4\mbreak
    fa?4 sol?2
    la sib4

    %13
    sib do2
    re4. do8 sib4
    do8 sib la2

    %16
    sib2.
    la4 fad2
    sold4. fad8 mi4

    %19
    fa? sol?2\mbreak
    la2 sol4
    si2 la4

    %22
    la2 sib8 la
    sol sib la4. sol8
    fad2.
    si2 la4

    %26
    la2 sib8 la
    sol sib la4. sol8
    fad2. fad la4

    %29
    la re mi8 re dod si?
    la4 la2 dod4
    re8 do? si la sold4 fad8 sold\mbreak

    %32
    la4 mi2 la4
    la re mi8 re dod si
    la4 la2 dod4

    %35
    re8 do? si la sold4. la8
    la2. dod4
    re re8 do? si4 la

    %38
    sol sol2 do4
    la8 si do re si4. do8\mbreak
    do sol la sib do4 do

    %41
    si? si8 dod re4. re8
    do?4 sib8 do re4. re8
    re4 sib la4. la8

    %44
    la2. la do4
    si? si8 dod re4. re8
    do?4 sib8 do re4. re8

    %47
    re4 sib la4. la8
    la2.

}

VIIItln =  \relative do' {

    fa4 fa2
    mi4. re8 dod4
    re dod re

    %4
    mi8 fa mi re dod4
    fa4 fa2
    mi4. re8 dod4

    %7
    re8 dod re mi fa sol
    la2.
    dod,4 dod2

    %10
    si la4
    si dod2
    re8 dod re mi fa4

    %13
    sol la2
    sib8 do sib la sol fa
    mib4 re2

    %16
    re2.
    dod4 dod2
    si la4

    %19
    si dod2\mbreak
    re8 mi re do? si4
    mi sol dod,

    %22
    re2 re4
    re dod4. re8
    re2.

    %25
    mi4 sol dod,
    re2 re4
    re dod4. re8

    %28
    re2. re fa4
    fa mi8 re sol4 la8 sol
    fa4 fa2 la4

    %31
    la fa mi4. mi8\mbreak
    mi4 dod2 fa4
    fa mi8 re sol4 la8 sol

    %34
    fa4 fa2 la4
    la fa mi4. re8
    dod2. la'4

    %37
    la sol sol re
    re do8 re mi4. re8
    do4 do re do8 re\mbreak

    %40
    mi2. do8 re
    mi4 fa8 sol la4. sol8
    fa4 fa2 mi8 re

    %43
    sol fa mi re dod4 la'8 sol
    fa2. fa do8 re
    mi4 fa8 sol la4. sol8

    %46
    fa4 fa2 mi8 re
    sol fa mi re dod4 la'8 sol
    fad2.

}

VIIIbcn = \relative do {

    re2 re4
    sol,2 la4
    fa2 sib4

    %4
    sol2 la4
    re2 re4
    sol,2 la4

    %7
    re4. do8 sib4
    la2.
    la2 la'4

    %10
    sold2 la4\mbreak
    fa mi la
    re,4. do8 sib4

    %13
    \once\set suggestAccidentals = ##t sib'? la2
    sol4. fad8 sol4
    do, re2

    %16
    sol,2.
    la2 la'4
    sold2 la4

    %19
    fa mi la\mbreak
    re,2 sol4
    mi2 la4

    %22
    fa4. fa8 sol la
    sib sol la4 la,
    re,2.
    mi'2 la4

    %22
    fa4. fa8 sol la
    sib sol la4 la,
    re,2. re re'4

    %25
    re2 dod
    re re,4 la'
    re2 mi8 re do? si?\mbreak

    %28
    la4 la la' re,
    re2 dod
    re re,4 la'

    %31
    re,2 mi
    la2. la'4
    re, mi8 fa sol4 fad

    %34
    sol sol8 fa? mi4 do
    fa do sol' sol,\mbreak
    do do'8 sib la4 la

    %37
    sol fa8 mi re4 re,8 mi
    fa4 sol8 la sib4. la8
    sol2 la

    %40
    re,2. re2. la''4
    sol fa8 mi re4 re,8 mi
    fa4 sol8 la sib4. la8

    %43
    sol2 la
    re,2.

}

VIIIbfn = \figuremode {

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
    \repeat volta 2 {s2.*19}
    \alternative {{s2.}{\time 2/2 \tempo 1 = 50 \set Score.measureLength = #(ly:make-moment 4 4) s2.}} \repeat volta 2{
        \break\once \override Score.RehearsalMark.extra-offset = #'(+7 . 1.) \mark\markup "Bouree" s4
        \set Score.currentBarNumber = #29
        s1*7
        s2.
    } \bar":..:"  \repeat volta 2{
        s4
        s1*7
    }
    \alternative {{\set Score.measureLength = #(ly:make-moment 3 4) s2.}{\set Score.measureLength = #(ly:make-moment 4 4) s2.}} s4
    \set Score.currentBarNumber = #46
    s1*4
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

    sib2 r16 do[re mib fa sol la fa]
    sib4 r16 fa sol lab sol8. sol16 fa8. mib16
    re4 r16 mib fa re sol[lab sol fa mib fa mib re]\mbreak

    %4
    do2. r16 do re \once\set suggestAccidentals = ##t mib?
    fa2. ^\markup\italic "marques d'obeissance" r8 mib re4.\prall do8
    sib2. fa'4 re4. mib8

    %7
    fa2. sib4 fa4. fa8
    sol1.
    re4.^\markup\italic "joye" re8 sol4

    %10
    do,4. re8 mib4\mbreak
    lab fa4.\prall fa8
    sib4. re,8 mib4

    %13
    fa fa4.\prall mib8
    mib2.
    sol2^\markup\italic "complaisance" re4. mib8

    %16
    si2 do4. re8
    la1
    fa'16^\markup\italic "colere" [sol fa mib re do re8] sib sib'16 lab sol fa mib re

    %19
    mib8 do sol'8. sol16 sol2^\markup\italic "et tendresse"~
    sol4 sol8 lab fa4. fa8
    fa2 mib4. mib8

    %22
    mib2. r16 mib^\markup\italic "rage" re do
    re4 r16 mib re mib fa4 r16 mib re do
    sib2 sib4.^\markup\italic "et pitie" do8

    %25
    lab2 lab4. sib8
    sol1
    sol'8^\markup\italic "fureur et promptitude" sol16 fa mib re do sib la?8 fa'16 mib re do sib la

    %28
    sib8 fa sib16 la sib do re do re mib re mib fa8
    do4 r16 sib la sol la fa sol la sib do re mib
    fa1 fa

    %31
    do2^\markup\italic "estonnement" r4 r16 re mib fa
    si,2 r4 r16 sol' fa sol
    mib2 r

    %34
    lab^\markup\italic "marques d'empuissance" fa4. fa8
    fa2 r
    r4 mib8 re re4.\prall do8

    %37
    do1
    sol'2.^\markup\italic "elles marquent ?" r8 sol fa4. sol8\mbreak
    mi!2. fa4 sol4. mi8

    %40
    la1.
    sib4.^\markup\italic "marques d'impuissance" la8 sol4. fad8
    sol4 \once\set suggestAccidentals = ##t mib? la4. sib8

    %43
    fad2 r
    r4 sol^\markup\italic "et refus" sol4. fad8
    sol1

    %46
    mib4^\markup\italic "fureur et desespoir" mib8 fa sol la
    sib4 sib,8 do re mib
    fa sol fa re  mib fa

    %49
    sol lab sib lab sol fa
    mib fa mib re do sib
    fa'2.

    %52
    fa4^\markup\italic "elles s'en fuyent" fa8 mib re4 sib'8 lab\mbreak
    sol[fa mib re mib do re mib]
    fa sol fa do re4 mib8 re

    %55
    mib fa re mib do4. sib8
    sib1

}

IXhcn = \relative do'' {

    fa,4. sol8 la4 r16 sib do la
    re4. do8 sib[sib la8. la16]
    sib4 do8 re mib8. re16 do re do sib\mbreak

    %4
    la2. r16 la sib do
    re2. r8 do sib4.\prall la8
    sol2.\prall re'4 sib4. do8

    %7
    re2. re8 do sib4. sib8
    sib1.
    sol4. lab8 sib4

    %10
    lab2 sib4\mbreak
    do sib4. do8
    re4. si8 do4

    %13
    do sib?4. sib8
    sib2.
    sib2 lab

    %16
    sol2. sol4
    fa1
    la16 sib la sol fa4 sol8 re'16 do si la sol8\mbreak

    %19
    sol4 r16 la sib do re4 sib
    do2. r16 \once\set suggestAccidentals = ##t mib? re do
    sib4. la8 sib4. do8

    %22
    la2. r16 fa sol la
    sib2 sib4 fa
    sol2 sol4. sol8

    %25
    fa2 fa4. sol8
    mib1\mbreak
    sib'4 do16 sib la sol fa sol la fa sib la sol la

    %28
    fa8 re mib16 fa sol la sib la sib do sib8  do16 sib
    la4 r16 sol fa \once\set suggestAccidentals = ##t mib? fa4. sol8
    la1 la

    %31
    lab2 r4 fa
    sol4. re'8 si4. la8
    sol2 r

    %34
    do re4. do8
    si2 r
    r4 do si4. la8

    %37
    sol1
    do2. r8 do re2\mbreak
    do2. re4 mi!4. re8

    %40
    do1.
    sib2 do4 re
    do4. si8 do4. \once\set suggestAccidentals = ##t sib?8

    %43
    la2 r
    r4 re do4. re8
    si1\mbreak

    %46
    sol4 sol8 la sib do
    re4. do8 sib4
    sib2 sib4

    %49
    sib re si
    do sol4. sol8
    la2.

    %52
    do4 do sib sib8 do\mbreak
    re4. re8 do4 sol
    la4. sol8 fa4 sib

    %55
    do8 re sib do la4.\prall sol8
    fa1

}

IXtln =  \relative do' {

    re4. mi8 fa4. fa8
    sol4 fa mib8. re16 do8 fa16 fa
    fa4 r16 mib re do sib8 sib' sol8. sol16\mbreak

    %4
    fa2. fa4
    sib2. r8 mib, fa4. fa8
    \once\set suggestAccidentals = ##t mib?2. fa4 sol re

    %7
    sib'2. r8 lab  lab4 fa
    mib1.
    sib4. sib8 mib4

    %10
    mib4. fa8 sol4\mbreak
    do, re4. re8
    sol2 sol4

    %13
    lab re,8 mib fa re
    sol2.
    mib4 sol fa4.\prall mib8

    %16
    re2 mi!4. re8
    do1
    do4 sib16 la sib do re4. re8\mbreak

    %19
    do8. re16 mib8. mib16 re4. re8
    \once\set suggestAccidentals = ##t mib?2 fa
    sol2. sol4

    %22
    do,2. fa4
    fa r16 sol fa mib re4 r16 sib do re
    mib4 re mib4. mib8

    %25
    mib2 re4. do8
    sib1\mbreak
    mib8. fa16 sol4 do, re8 mib

    %28
    re4. mib8 fa4. fa8
    fa4 r16 do do do do4. do8
    do1 do\mbreak

    %31
    fa2 r4 do
    re2 r4 r16 re do re
    do2 r

    %34
    fa fa4. fa8
    sol2 r
    r4 sol sol4. fa8

    %37
    mi!1
    mi4. fa8 sol2. r8 sol\mbreak
    sol1 sol2

    %40
    fa1.
    re2 sol4. lab8
    sol4. fa8 mib2

    %43
    re r
    r4 sib' la re,8 re
    re1

    %46
    do2.
    fa4. mib8 re4
    re8 do re sib do re

    %49
    mib4 fa mib8 fa
    sol2 do,4
    do2 fa4

    %52
    la la8 sol fa4 sol\mbreak
    re4 sol8 fa mib4 re
    do4. do8 sib4 mib

    %55
    fa fa fa4. \once\set suggestAccidentals = ##t mib?8
    re1

}

IXbcn = \relative do {

    sib'2 la
    sol4 re mib fa
    sib,2 mib\mbreak

    %4
    fa2. mib4
    re2 sib4 do re sib
    mib2. re4 sol2

    %7
    re2. sib8 do re2
    mib1.
    sol4. fa8 mib4

    %10
    lab4. lab8 sol4\mbreak
    fa sib4. lab8
    sol4. sol8 do4

    %13
    lab sib sib,
    mib2.
    mib2 fa

    %16
    sol4 fa mi!2
    fa1
    la,4 sib sol sib\mbreak

    %19
    do2 sib
    lab2. lab4
    sol2. r16 sib la sol

    %22
    fa2. fa'4
    sib,2 lab
    sol do

    %25
    fa, sib
    mib,1
    mib'2 fa4 sib,8 do

    %28
    re4. do8 sib4 r16 do re mib
    fa1
    fa,4 r16 mib' re do re sib do re mib fa sol la fa,1

    %31
    fa'2 lab
    sol si
    do r

    %34
    fa, re4. re8
    mib2 r
    r4 do sol' sol,

    %37
    do1
    do'2. r8 do si2\mbreak
    do1 mi,!2

    %40
    fa1.
    sol4. fa8 mib4 re
    mib4. re8 do2

    %43
    do r
    r4 sib do re
    sol,1\mbreak

    %46
    do2.
    sib
    re4. do8 sib4

    %49
    mib re mib
    do8 re do sib la sol
    fa2.

    %52
    la4 fa sib sol8 la\mbreak
    si2 do4 \once\set suggestAccidentals = ##t sib?
    la2 sib4 sol

    %55
    la sib fa2
    sib,1

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key fa\major
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 35
    \repeat volta 2 {
        s1*3
        s2. \bar "||" s4
        \time 3/2 \tempo 2 = 60 s1.*4 \bar "||"
        \time 3/4\once\override Staff.TimeSignature.style = #'single-digit
        \tempo 2. = 60 s2.*6 \bar "||"
        \time 2/2 \once\override Staff.TimeSignature.style = #'single-digit
        \tempo 2 = 60 s1*3 \bar "||"
        \tempo 1 = 35 s1*2
        \tempo 4 = 70 s1*2
        s2. \bar "||" \tempo 2 = 60 s4
        s1 s2 \tempo 4 = 70 s
        s1*2 \bar "||"
        \tempo 1 = 35 s1*3
    }
    \alternative {{s1}{s}} \bar ".|:"\break
    \set Score.currentBarNumber = #31
    \repeat volta 2 {
        \tempo 1 = 35
        s1*3 \bar "||"
        \tempo 4 = 70
        s1*4 \bar "||"
        \time 3/2 \tempo 2 = 60 s1.*3 \bar "||"
        \time 2/2 \once\override Staff.TimeSignature.style = #'single-digit
        \tempo 2 = 70 s1*5 \bar "||"
        \time 3/4\once\override Staff.TimeSignature.style = #'single-digit
        \tempo 2. = 75 s2.*6 \bar "||"
        \time 2/2 \tempo 1 = 60 s1*5
    }

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

    sib'4 sib8. lab16 sol8. sol16 fa8.\prall mib16
    re2\prall re4. mib8
    fa4. mib8 re8. do16 re8. mib16

    %4
    do4\prall r16 do re mib fa2~
    fa4 mib8. fa16 re4 r16 re  \once\set suggestAccidentals = ##t mi? fa\mbreak
    sol4 fa8. sol16 mi!4\prall r16 mi fa sol

    %7
    la4. sol8 sol4.\prall fa8
    fa4 do re mib~
    mib re mib fa8 mib

    %10
    re4 sib re4. mib8
    fa4 fa8. mib16 re8. re16 do8. sib16
    la4. sib8 do8. re16 mib8. fa16

    %13
    re8. mib16 fa8. sol16 lab8. sol16 lab8. fa16
    <<{sol8.[lab16 sol8. fa16 mib8. fa16 mib8. re16]
       do2 fa4}\\{mib8.[fa16 mib8. re16 do8. re16 do8. sib16]
                  la2 fa'4}>>  mib8. re16

    %16
    do4.\prall re8 mib8. sol16 fa8.\prall mib16
    re4 sol do,4. sib8
    sib\breve

}

Xhcn = \relative do'' {

    R1
    sib4 sib8. lab16 sol8. sol16 fa8.\prall mib16
    re8. re'16 sol,8. la16 sib8. la16 sib8. do16

    %4
    la2 la4. sib8
    do8. sib16 la8. sol16 fa4 r16 fa sol la\mbreak
    sib4 la8. sib16 sol4\prall r16 sol la sib

    %7
    do4 sib8 la sol4 do8 sib
    la4 fa2 sol4
    la la sib do

    %10
    sib fa sib4. do8\mbreak
    re4 re8. do16 sib8. la16 sol8. fa16
    fa2 fa4. fa8

    %13
    fa4 sib lab sib8. sib16
    sib4 mib,8. fa16 sol4. sol8\mbreak
    fa8. sol16 la8. fa16 sib4 la8. sol16

    %16
    la2 sib4 do~
    do sib8 do la4. sib8
    sib\breve

}

Xtln =  \relative do' {

    R1*3
    fa4 fa8. mib16 re8. re16 do8. sib16
    la2 re4 sib'8. la16\mbreak

    %6
    sol4 r16 sol, la sib do4 sib8. do16
    la4 sib do2
    do4 la sib do

    %9
    do fa  \once\set suggestAccidentals = ##t mib? do8 fa
    fa4 re sol re8. do16\mbreak
    sib8. do16 re8. mib16 fa4 mib8. re16

    %12
    do8. re16 do8. sib16 la8. sib16 do8. re16
    sib8. do16 re8. sib16 mib4 fa
    sib, do8. re16 mib4. mib8\mbreak

    %15
    mib4 do re mib~
    mib8 do fa4 mib do8 fa
    fa4 sol fa4. mib8

    %18
    re\breve

}

Xbcn = \relative do {

    R1*7
    fa4 fa8. mib16 re8. re16 do8. sib16
    la4 fa sol la

    %10
    sib sib'8. lab16 sol8. sol16 fa8. mib16\mbreak
    re4 sib8. do16 re4 mib
    fa2. la,4

    %13
    sib2 do4 re
    mib2. do4\mbreak
    fa4 fa8. mib16 re8. re16 do8. sib16

    %16
    la4 fa sol la
    sib mib, fa2
    sib,\breve

}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key fa\major
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    s1*17
    s\breve
    \bar"|."

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

XIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

XIdsn =  \relative do'' {

    sib2 re4. mib8
    fa2 fa4. sol8
    mib4.\prall re8 mib4. fa8

    %4
    re2 sib
    sib'4. sib,8 re4. mib8
    fa4. sol8 lab4. fa8

    %7
    sol2. r8 sol
    sol2 fa4. fa8
    fa2. r8 sol

    %10
    mib2. r8 mib\mbreak
    mib2. r8 fa
    re4. mib8 fa4. sol8

    %13
    do,4. re8 mib4. fa8
    la,4. sib8 sib4.\downprall la16 sib
    do1 do~

    %16
    do4 do la sib8 do
    fa,4 fa' re mib8 fa
    sib,4 fa' sib fa

    %19
    sol  lab8 sol lab sol fa \once\set suggestAccidentals = ##t mib?\mbreak
    re4 sib mib4. fa8
    sol4 lab8 sol fa4\prall \once\set suggestAccidentals = ##t mib?8 re

    %22
    mib2 sol4. sol8
    sol2 do,~
    do4 si do4. re8

    %25
    si2 re~
    re4 mib8 re do2~
    do4 re8 do si4. do8

    %28
    do4 sol' mi! fa8 sol
    do,4 fa do re8 mib\mbreak
    re4 sib sib'4. lab8

    %31
    sol[fa mib re do re sib do]
    la4 fa fa'4. do8
    re4 sib do la

    %34
    sib1~
    sib4 do la sib8 do sib1

}

XIhcn = \relative do'' {
   
   fa,2sib4. do8
   re4. do8 si4 si
   do4. \once\set suggestAccidentals = ##t sib?8 la4 la
   
   %4
   sib2 sol
   re'4. do8 sib4. do8
   la4 re do4. re8
   
   %7
   sib4. sol8 lab4. sib8
   do2. re8 do
   si2 la
   
   %10
   sol4. sol8 do4. \once\set suggestAccidentals = ##t sib?8\mbreak
   la4. la8 sib4. do8
   sib2. do8 sib
   
   %13
   la2 sol
   fa4. sol8 sol4.\downprall fa16 sol
   la1
   
   %16
   la~la4 la fa do
   re la' sib fa
   sol8 [la sib do re mib re do]
   
   %19
   sib4 do do4.\prall sib8\mbreak
   sib4 sib do4. re8
   mib8 re do4 sib4. sib8
   
   %22
   sib2 sib4. sib8
   sib2 lab4 sol
   sol2 fa
   
   %25
   sol2. r8 sol
   sol2. lab8 sol
   fa2. sol8 fa
   
   %28
   mi!4 do' sol4. sol8
   la4 la la4. la8\mbreak
   sib2. r8 sib
   
   %31
   sib4 sol sol4. sol8
   fa[fa sol la sib do re do]
   sib la sol4 sol fa
   
   %34
   fa1~
   fa4 la fa do fa1
   
}

XItln =  \relative do' {
   
   re2 sol
   fa4. mib8 re4 sol
   sol2 fa4. fa8
   
   %4
   fa2 mib
   fa fa4. mib8
   re4. re8 mib4. fa8
   
   %7
   mib2. r8 mib
   mib2 fa4. mib8
   re4. si8 do4. re8
   
   %10
   re4. sol,8 la4. \once\set suggestAccidentals = ##t sib?8\mbreak
   do4 fa2 fa4
   fa2. r8 fa
   
   %13
   fa4 mib8 re do4. do8
   do2 re4 mi!
   fa1
   
   %16
   fa~fa4 fa do la
   sib do sib do8 re
   mib fa re mib fa2
   
   %19
   mib4 sol fa4. fa8\mbreak
   fa4 re sol lab
   sol8 fa mib4 re mib8 fa
   
   %22
   sol2 mib4. mib8
   mib4 sol fa mib
   mib re do2
   
   %25
   re2. re8 do
   si4 si do2
   re re4. re8
   
   %28
   sol fa mi! re do4 re8 mi
   fa4 do fa4. fa8\mbreak
   fa4 re mib8 fa sol fa
   
   %31
   mib? re do sib mib! fa re mib
   do4 do re8 mib fa4
   fa mib mib do
   
   %34
   re1~
   re4 fa do la re1
   
}

XIbcn = \relative do {

    sib'4. la8 sol4 fa8 mib
    re4. re8 sol4 sol,
    do4. do8 fa4 fa,

    %4
    sib2 mib
    sib sib4. do8
    re4. sib8 do4. re8

    %7
    mib4. mib8 fa4. sol8
    lab2. fa4
    sol4. sol,8 la4. si8

    %10
    do4. \once\set suggestAccidentals = ##t sib?8 la4. sol8\mbreak
    fa4. fa8 sol4. la8
    sib4. do8 re4. mib8

    %13
    fa2 mib
    fa sib,
    fa_\markup\left-align\italic "la seconde foix faite la blanche entiere avec la noire liee" r8 fa' sol la fa,1~

    %16
    fa4 fa fa fa'
    re mib8 fa sib,4 sib'
    sol fa8 mib re2

    %19
    mib fa\mbreak
    sib4 lab sol fa
    mib lab, sib2

    %22
    mib, mib'?4. mib8
    mib4 mib, fa sol
    lab2. sib8 lab

    %25
    sol4. la8 si2
    mib,2. mib'4
    re2. mib8 re

    %28
    do2. do'8 sib
    la sol fa sol la4 fa\mbreak
    sib8[do sib lab sol fa mib re]

    %31
    mib2. do4
    fa8[sol fa mib re do sib la?]
    sib4 mib fa fa,

    %34
    sib1~_\markup\left-align\italic "faite la ronde et la noire liee la premier foix et finissez par la ronde seule"
    sib4 fa fa fa' sib,1

}

XIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1*24
  <7>2 <6>
  s1
  <9 7 5+>2 <8 6>
  <7>2 <6>
  <_+>1

}

forma = {

  \key fa\major
  \time 2/2
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 1 = 45
  \repeat volta 2 {s1*14}
  \alternative {{s1}{s1*2}}\set Score.currentBarNumber = #17
  \repeat volta 2 {s1*17}
  \alternative {{s1*2}{s1}}
  \bar"|."

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

   r8 re mib4
   fa4. mib8 re4 do4. do8 re4
   mib mib2~mib4. sib8 do4
   re4. mib8 fa4 do do4. re8

   %4
   sib2.~sib4. re8 mib4
   fa4. mib8 re4 do4. do8 re4
   mib mib2~mib4. sib8 do4

   %7
   re4. mib8 fa4 do do4. re8
   sib2.~sib4. sib'8 la4
   sol4. la8 sib4 fa4. fa8 mib4

   %10
   re re2~re4. sol8 re4
   mib4. re8 do4 re4. do8 sib4\mbreak
   fa'2.~fa4. re8 mib4

   %13
   fa4. mib8 re4 do4. do8 re4
   mib mib2~mib4. sib8 do4
   re4. mib8 fa4 do do4. re8

   %16
   sib2.~sib4. re8 mib4
   fa4. mib8 re4 do4. do8 re4\mbreak
   mib mib2~mib4. sib8 do4

   %19
   re4. mib8 fa4 do do4. re8
   sib2.~sib4. re8 do4
   sib4. la8 sol4 sol'4. fa8 mib4

   %22
   re re2~re4. do8 sib4
   fa'4. mib8 re4 do4. re8 sib4\mbreak
   la2.~la4. re8 mib4

   %25
   fa4. mib8 re4 do4. do8 re4
   mib mib2~mib4. sib8 do4
   re4. mib8 fa4 do do4. re8

   %28
   sib2.~sib4. re8 mib4
   fa4. mib8 re4 do4. do8 re4
   mib mib2~mib4. sib8 do4

   %31
   re4. mib8 fa4 do do4. re8
   sib2.~sib4  r8 re mib4
   fa4. mib8 re4 do4. do8 re4

   %34
   mib mib2~mib4. sib8 do4
   re4. mib8 fa4 do do4. re8
   sib1.

}

XIIhcn = \relative do'' {

   r8 sib8 do4
   re4. do8 sib4 la4. la8 si4
   do do2~do4. sol8 la4
   sib4. la8 sib4 sib la4.\prall sol8

   %4
   fa2.~fa4. sib8 do4
   re4. do8 sib4 la4. la8 si4
   do do2~do4. sol8 la4

   %7
   sib4. la8 sib4 sib la4. \parenthesize \prall sol8
   fa4. sol8 la4 sib4. do8 re4
   mib4. do8 re4 sib4. do8 do4

   %10
   sib4. sib8 la4 si4. la8 sol4
   sol4. sol8 la4 fa4. fa8 sol4\mbreak
   la4. sib8 do4 re4. sib8 do4

   %13
   re4. do8 sib4 la4. la8 si4
   do do2~do4. sol8 la4
   sib4. la8 sib4 sib la4.\prall sol8

   %16
   fa2.~fa4. sib8 do4
   re4. do8 sib4 la4. la8 si4
   do do2~do4. sol8 la4

   %19
   sib4. la8 sib4 sib la4.\prall sol8
   fa4. sol8 la4 sib2 la4
   sol4. la8 si4 do4. sib?8 la4

   %22
   sol4. la8 sib4 sib4. la8 sol4
   re'4. la8 sib4 la4. sib8 sol4\mbreak
   fa2.~fa4. sib8 do4

   %25
   re4. do8 sib4 la4. la8 si4
   do do2~do4. sol8 la4
   sib4. la8 sib4 sib la4.\parenthesize \prall sol8

   %28
   fa2.~fa4. sib8 do4
   re4. do8 sib4 la4. la8 si4
   do do2~do4. sol8 la4

   %31
   sib4. la8 sib4 sib la4. sol8
   fa2.~fa4 r8 sib8 do4
   re4. do8 sib4 la4. la8 si4

   %34
   do do2~do4. sol8 la4
   sib4. la8 sib4 sib la4. sol8
   fa1.

}

XIItln =  \relative do' {

    r8 fa sol4
    sib4. fa8 sol4 fa2 fa4
    sol4. mib8 fa4 sol4. fa8 mib4
    fa2 fa4 sol fa4. mib8

    %4
    re4. sib8 do4 re4. fa8 sol4
    sib4. fa8 sol4 fa2 fa4
    sol4. mib8 fa4 sol4. fa8 mib4

    %7
    fa2 fa4 sol fa4.\prall mib8
    re4. \once\set suggestAccidentals = ##t mi?8 fa4 sol2 re4
    sol4. mib8 fa4 re4. fa8 fa4

    %10
    fa4. mib8 re4 re2 re4
    do4. do8 fa4 re4. re8 sol4\mbreak
    do,2.~do4 r8 fa sol4

    %13
    sib4. fa8 sol4 fa2 fa4
    sol4. mib8 fa4 sol4. fa8 mib4
    fa2 fa4 sol fa4.\prall mib8

    %16
    re4. sib8 do4 re4. fa8 sol4
    sib4. fa8 sol4 fa2 fa4
    sol4. mib8 fa4 sol4. fa8 mib4

    %19
    fa2 fa4 sol fa4.\prall mib8
    re4. \once\set suggestAccidentals = ##t mi?8 fad4 sol2 re4
    re2 re4 mib4. sib8 do4

    %22
    re2 sol4 re2 sol4
    la4. la8 re,4 fa4. do8 do4\mbreak
    do4. sib8 do4 re4. fa8 sol4

    %25
    sib4. fa8 sol4 fa2 fa4
    sol4. mib8 fa4 sol4. fa8 mib4
    fa2 fa4 sol fa4. \prall mib8

    %28
    re4. sib8 do4 re4. fa8 sol4
    sib4. fa8 sol4 fa2 fa4
    sol4. mib8 fa4 sol4. fa8 mib4

    %31
    fa2 fa4 sol fa4.\prall mib8
    re2.~re4 r8 fa sol4
    sib4. fa8 sol4 fa2 fa4

    %34
    sol4. mib8 fa4 sol4. fa8 mib4
    fa2 fa4 sol fa4. mib8
    re1.

}

XIIbcn = \relative do {

   r8 fa8 mib4
   re4. re8 mib4 fa4. mib8 re4
   do4. do8 re4 mib4. re8 do4
   sib4. do8 re4 mib fa fa,

   %4
   sib4. sol'8 la4 sib4. fa8 mib4
   re4. re8 mib4 fa4. mib8 re4
   do4. do8 re4 mib4. re8 do4

   %7
   sib4. do8 re4 mib fa fa,
   sib4. sib'8 la4 sol4. sol8 fa4
   mib2 re la

   %10
   sib4. sib'8 fa4 sol4. la8 si4
   do4. sib8 la4 sib4. la8 sol4
   fa4. sol8 la4 sib4. fa8 mib4

   %13
   re4. re8 mib4 fa4. mib8 re4
   do4. do8 re4 mib4. re8 do4
   sib4. do8 re4 mib fa fa,

   %16
   sib4. sol'8 la4 sib4. fa8 mib4
   re4. re8 mib4 fa4. mib8 re4
   do4. do8 re4 mib4. re8 do4

   %19
   sib4. do8 re4 mib fa fa,
   sib4. sib'8 la4 sol2 fad4
   sol4. sol8 fa4 mib4. re8 do4

   %22
   sib4. la8 sol4 sol'4. fa8 mib4
   re4. do8 sib4 fa'2 mi!4\mbreak
   fa4. sol8 la4 sib4. fa8 mib4

   %25
   re4. re8 mib4 fa4. mib8 re4
   do4. do8 re4 mib4. re8 do4
   sib4. do8 re4 mib fa fa,

   %28
   sib4. sol'8 la4 sib4. fa8 mib4
   re4. re8 mib4 fa4. mib8 re4
   do4. do8 re4 mib4. re8 do4

   %31
   sib4. do8 re4 mib fa fa,
   sib2.~sib4 r8 fa'8 mib4
   re4. re8 mib4 fa4. mib8 re4

   %34
   do4. do8 re4 mib4. re8 do4
   sib4. do8 re4 mib fa fa,
   sib1.

}

XIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 6/4
  \tempo 1. = 47
  \partial 2 s2
  s1.*36
  \bar "|."


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
#(set-global-staff-size 17)


\pointAndClickOff

\paper {
   systems-per-page = #4
   print-first-page-number = ##t
   first-page-number = #2
}

\header {
   title = \markup\column\smaller { "Pièces à machines: Circé [H.496]"" "}
   composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
}

\markup \huge  {"[1.] Ouverture"}

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sol''2^\markup \center-align\smaller\center-column {"[Dessus]"} r8 sol'' }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \Ids
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re''2.^\markup \center-align\column\smaller{"[Haute-contre]"} }
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \Ihc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sib'2.^\markup \center-align\column\smaller{"[Taille]"} }
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

%\pageBreak

\markup \huge  {"[2.] Prélude"}

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sol''1^\markup \center-align\smaller\center-column {"[Dessus]"} r8 sol'' }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IIds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sib'1^\markup \center-align\column\smaller{"[Haute-contre]"} }
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IIhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re'2^\markup \center-align\column\smaller{"[Taille]"} sol' }
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

%\pageBreak

\markup \huge  {"[3.] Arts et Plaisirs"}

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major  \time 3/2 sol''2.^\markup \center-align\smaller\center-column {"[Dessus]"} r8 sol'' }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IIIds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \time 3/2 sib'2^\markup \center-align\column\smaller{"[Haute-contre]"} }
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IIIhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \time 3/2 re'2^\markup \center-align\column\smaller{"[Taille]"} }
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

%\pageBreak

\markup \huge  {"[4.] Rondeau"}

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t  re''4^\markup \center-align\smaller\center-column {"[Dessus]"} re''4. }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IVds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 sol'4^\markup \center-align\column\smaller{"[Haute-contre]"} sol'4. }
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IVhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 sib4^\markup \center-align\column\smaller{"[Taille]"} si4. }
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

%\pageBreak

\markup \italic  {"Au lieu du rondeau précédent l'on peut joüer les deux airs suivants"}
\markup\huge "[5.] Deux beaux yeux me charment"

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t  sol'4^\markup \center-align\smaller\center-column {"[Dessus]"} }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \Vds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 mi'4^\markup \center-align\column\smaller{"[Haute-contre]"}  }
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \Vhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 do'4^\markup \center-align\column\smaller{"[Taille]"} }
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

\markup\huge "[6.] Un jour la jeune Lizette"

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key do\major \time 2/2 do''4^\markup \center-align\smaller\center-column {"[Dessus]"} do''}
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \VIds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key do\major \time 2/2 sol'4^\markup \center-align\column\smaller{"[Haute-contre]"} la'4}
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \VIhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key do\major \time 2/2 mi'4^\markup \center-align\column\smaller{"[Taille]"} mi' }
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

%\pageBreak

\markup\huge "[7.] Passecaille"

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 r4^\markup \center-align\smaller\center-column {"[Dessus]"} la''4. la''8}
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \VIIds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 r4^\markup \center-align\column\smaller{"[Haute-contre]"} fa'4. fa'8}
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \VIIhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 r4^\markup \center-align\column\smaller{"[Taille]"} re'4. dod'8 }
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

\pageBreak

\markup\huge "[8.] Menuet - Les singes"

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 re''4^\markup \center-align\smaller\center-column {"[Dessus]"} la''2}
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \VIIIds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 la'4^\markup \center-align\column\smaller{"[Haute-contre]"} la' re''}
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \VIIIhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key do\major \once\override Staff.TimeSignature.transparent = ##t \time 3/4 fa'4^\markup \center-align\column\smaller{"[Taille]"} fa'2 }
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

%\pageBreak

\markup\huge "[9.] Les pantomimes"

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sib'2^\markup \center-align\smaller\center-column {"[Dessus]"} }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IXds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 fa'4.^\markup \center-align\column\smaller{"[Haute-contre]"} sol'8}
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IXhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re'4.^\markup \center-align\column\smaller{"[Taille]"} mi'8 }
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

\markup\huge "[10.] Prelude pour faire entrer Les Divinitez des forets"

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sib''4^\markup \center-align\smaller\center-column {"[I et II Dessus]"} }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \Xds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 r1^\markup \center-align\column\smaller{"[Haute-contre]"} sol'4}
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \Xhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 r1*3^\markup \center-align\column\smaller{"[Taille]"} fa'4 }
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

\markup\huge "[11.] Divinitez des forets et de la mer"

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 sib'2^\markup \center-align\smaller\center-column {"[Dessus]"} }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \XIds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 fa'2^\markup \center-align\column\smaller{"[Haute-contre]"}}
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \XIhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.transparent = ##t \time 2/2 re'2^\markup \center-align\column\smaller{"[Taille]"} }
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

%\pageBreak

\markup\huge "[12.] Rondeau pour trois figures"

\score {

   \new ChoirStaff <<

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \time 6/4\numericTimeSignature r4^\markup \center-align\smaller\center-column {"[Dessus]"} re''8 mib''4 }
         \set Staff.shortInstrumentName = "ds"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \XIIds
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \time 6/4\numericTimeSignature r4^\markup \center-align\column\smaller{"[Haute-contre]"} sib'8 do''4}
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \XIIhc
      >>

      \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \time 6/4\numericTimeSignature r4^\markup \center-align\column\smaller{"[Taille]"} fa'8 sol'4}
         \set Staff.shortInstrumentName = "tl"
         \clef alto
         \set Staff.midiInstrument = #"viola"
         \XIItl
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
         \set Staff.shortInstrumentName = "bc"
         \set Staff.midiInstrument = #"contrabass"
         \XIIbc
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