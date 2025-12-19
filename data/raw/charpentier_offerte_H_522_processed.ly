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

   R1*11
   do2  mi4. fad8
   sol2 sol

   %14
   re4. mi8 fa?4. sol8
   mi2\prall mi4. fa8
   re2\prall re\mbreak

   %17
   mi4.(fa8) fa4.\downprall mi16 fa
   sol1
   re4. do8 re4. mi8

   %20
   fa4. mi8 fa4. sol8
   la2. la4
   la2 sol~

   %23
   sol4 sol fa2~
   fa4 fa mi4. mi8
   mi4 fa8 mi re4.\prall do8

   %26
   si2 sol
   do4. sib8 sib4.\prall la8

   %28
   la4 la re2~
   re4 si mi2~\mbreak
   mi4 do fa4. fa8

   %31
   fa2 mi4. mi8
   la sol fa mi re4.\prall do8
   do2 r

   %34
   R1*4
   sol'8 fa mi re do4
   sol' re sol

   %40
   do, do8 si do re
   si4.\prall la8 sol4
   sol'8 la sol fa mi4

   %43
   fa8 sol fa mi re4
   mi8 fa re4.\prall do8
   do2.\mbreak

   %46
   R2.*8
   re8 do re mi fa re
   mi8 fa sol la sib sol

   %56
   la2 r4
   r mi8 re mi do
   re2 r4

   %59
   r fa8 mi fa sol
   mi4. fa8 sol4
   la8 sol fa4.\prall mi8

   %62
   re2\prall r4\mbreak
   R2.
   r4 r8 do sol'4

   %65
   fa8\prall mi re4.\prall do8
   do2.
   R1*23

   %90
   r4 sol'8[fa sol la sol fa]
   mi4. re8 mi fa sol4
   do, do fa2~

   %93
   fa4 sol8 fa mi4 fa8 sol
   re4 re8[fa mi sol fa la]
   sol4 sol sol4. sol8

   %96
   sol4 fa8\prall mi fa4. fa8
   fa4 mi8\prall re mi4. mi8~\mbreak
   mi2 r8 mi fad sol

   %99
   la4. sold8 la4. si8
   sold4 sold sold4. fad16 sold
   la4 la8[sol? la si la sol]

   %102
   fad4 fad fad4. mi16 fad
   sol4 sol8[fa sol la sol fa]
   mi2 r8 re mi  fa

   %105
   sol4 fa8[mi fa mi re do]
   si2 r8 la si do
   re4 do8\prall si la4.\prall sol8\mbreak

   %108
   sol4 re'8[do re mi re do]
   si4 si8[re do mi re fa]
   mi4 mi8[re mi fa mi re]

   %111
   do4 do do4. do8
   fa4 fa8[mi fa sol fa mi]
   re4 sol sol sol

   %114
   fa fa8 mi fa4. sol8
   mi4 mi mi4. fa8\mbreak
   re1\prall

   %117
   r4 sol sol sol
   fa fa8 mi fa4. sol8
   mi4 mi mi4. fa8

   %120
   re4\prall re re re
   do do8 si do4. re8
   si4 sol8[si la do si re]\mbreak

   %123
   do2 do~
   do4 do do4. si8
   do\breve \fermata

}

IdsIIn =  \relative do'' {






}

IflIn =  \relative do'' {

   do2 mi4. fad8
   sol2 sol
   re4. mi8 fa?4. sol8

   %4
   mi2 mi4. fa8
   re4.\prall do8 re4. mi8
   fa2 fa4. sol8

   %7
   la4. la8 sol4.\prall fa8
   mi4. fa8 sol2
   do, fa

   %10
   re\prall mi4. mi8
   fad2 sol~
   sol4 sol do,4. do8

   %13
   re2 r
   sol, la4. si8
   do2 do4. re8

   %16
   si2 si\mbreak
   do4.(re8) re4.\downprall do16 re
   mi1

   %19
   re4. do8 re4. mi8
   fa4. mi8 fa4. sol8
   la2. la4

   %22
   la2 sol~
   sol4 sol fa2~
   fa4 fa mi4. mi8

   %25
   mi4 fa8 mi re4.\prall do8
   si2 sol
   do4. sib8 sib4.\prall la8

   %28
   la4 la re2~
   re4 si mi2~\mbreak
   mi4 do fa4. fa8

   %31
   fa2 mi4. mi8
   la sol fa mi re4.\prall do8
   do re mi fa sol4. sol8

   %34
   la sol fa mi re4.\prall do8
   do2 sol'4.\solo sol8
   la sol fa mi re4. do8

   %37 OOKK
   do1\fermata
   sol'8 fa mi re do4
   sol' re sol

   %40
   do, do8 si do re
   si4.\prall la8 sol4
   sol'8 la sol fa mi4

   %43
   fa8 sol fa mi re4
   mi8 fa re4.\prall do8
   do2.
   mi4 mi8 re mi fa

   %47
   re4 re mi
   fa8 mi fa sol fa sol
   mi2 mi4

   %50
   mi8 re mi fad sol la
   fad2 sol4
   sol4. la8 fad4

   %53
   sol2.\mbreak
   R2.
   sol8 fa? sol la sib sol

   %56
   la4 la8 sol la fa
   sol4 mi8 re mi do
   re4 re8 do re mi

   %59
   fa4 fa8 mi fa sol
   mi4. fa8 sol4
   la8 sol fa4.\prall mi8

   %62
   re4.\prall re8 sol4\mbreak
   fa8\prall mi re4. do8
   do4. do8 sol'4

   %65 OOKK
   fa8\prall mi re4.\prall do8
   do2.
   R1*7

   %74
   r4 sol'4\solo sol8 fa sol la
   sol4. fa8 mi fa sol mi
   fa [mi fa sol la sol la sib]

   %77
   la4. sol8 la [sib la sol]
   fa mi fa sol la4 sib8 la
   sol4 la8 sib sol4. \prall fa8

   %80
   fa4 r r2
   r4 fa\solo mi4.\prall fa8
   re4\prall r r2

   %83
   r4 la'8\solo sol sol4.\prall fa8
   mi4 r r2
   r4 sol8\solo la fa4.\prall mi8

   %86
   re4\prall r r2
   R1\mbreak
   r4 sol8\solo fa sol la sol fa

   %89
   mi4 mi8 fa re4.\prall  do8
   do2 r
   r4 do8 si do re do si

   %92
   la2. la4
   si sol do4. re8
   si4 si8[re do mi re fa]

   %95
   mi4 mi mi4. mi8
   mi4 re8\prall do re4. re8
   re2 do4 do8 re\mbreak

   %98
   mi2 r8 mi fad sol
   la4. sold8 la4. si8
   sold4 mi8[re mi fa? mi re]

   %101
   dod4 dod dod4. si16 dod
   re4. mi8 fad4. mi16 fad
   sol4 sol8 [fa? sol la sol fa]

   %104
   mi2 r8 re mi fa
   sol4 fa8[mi fa mi re do]
   si2 r8 la si do

   %107
   re4 do8\prall si la4.\prall sol8\mbreak
   sol4 re'8[do re mi re do]
   si4 si8[re do mi re fa]

   %110
   mi4 mi8 [re mi fa mi re]
   do4 do do4. do8
   fa4 fa8[mi fa sol fa mi]

   %113
   re4 re8[do re mi re do]
   si1
   r4 sol' sol sol\mbreak

   %116
   fa fa8 mi fa4. sol8
   mi4 mi mi4. fa8
   re1

   %119
   R
   r4 re re re
   do do8 si do4. re8

   %122
   si4 sol8[si la do si re]\mbreak
   do2 do~
   do4 do do4. si8

   %125
   do\breve\fermata

}

IflIIn =  \relative do'' {

   R1*2
   sol2 la4. si8
   do2 do4. re8

   %5
   si4. la8 si4. dod8
   re4. re8 do?4. si8
   la2 si4. si8

   %8
   do4. re8 mi2
   la, re
   si\prall do4. si8

   %11
   la2 sol
   la2. la4
   si2 r

   %14
   sol la4. si8
   do2 do4. re8
   si2 si\mbreak

   %17
   do4.(re8) re4.\downprall do16 re
   mi1

   %19
   re4. do8 re4. mi8
   fa4. mi8 fa4. sol8
   la2. la4

   %22
   la2 sol~
   sol4 sol fa2~
   fa4 fa mi4. mi8

   %25
   mi4 fa8 mi re4.\prall do8
   si2 sol
   do4. sib8 sib4.\prall la8

   %28
   la4 la re2~
   re4 si mi2~\mbreak
   mi4 do fa4. fa8

   %31
   fa2 mi4. mi8
   la sol fa mi re4.\prall do8
   do si do re mi4. mi8

   %34
   fa mi re do si4. do8
   do2 mi4.\solo mi8
   fa mi re do si4. do8

   %37
   do1\fermata
   sol'8 fa mi re do4
   sol' re sol

   %40
   do, do8 si do re
   si4.\prall la8 sol4
   sol'8 la sol fa mi4

   %43
   fa8 sol fa mi re4
   mi8 fa re4.\prall do8
   do2.
   mi4 mi8 re mi fa

   %47
   re4 re mi
   fa8 mi fa sol fa sol
   mi2 mi4

   %50
   mi8 re mi fad sol la
   fad2 sol4
   sol4. la8 fad4

   %53
   sol2.\mbreak
   R2.
   sol8 fa? sol la sib sol

   %56
   la4 fa8 mi fa re
   mi4 mi8 re mi do
   re4 si8 la si dod

   %59
   re4 fa8 mi fa sol
   mi4. fa8 sol4
   la8 sol fa4.\prall mi8

   %62
   re4.\prall si8 mi4\mbreak
   re8\prall do si4. do8
   do4. do8 sol'4

   %65
   fa8\prall mi re4.\prall do8
   do2.
   R1*7

   %74
   r4 mi\solo mi8 re mi fa
   mi4. fa8 sol la sib sol
   la[sol fa mi fa mi fa sol]

   %77
   fa4. mi8 fa sol fa mi
   re do re mi fa4 sol8 fa
   mi4 fa8 sol mi4.\prall fa8

   %80
   fa4 r r2\mbreak
   r4 re\solo do4.\parenthesize _\prall  re8
   si4 r r2

   %83
   r4 la\solo si4.\parenthesize _\prall si8
   do4 r r2
   r4 mi8 fa re4.\parenthesize \prall do8

   %86
   si4\parenthesize \prall r r2
   R1
   r4 mi8\solo[re mi fa mi re]

   %89
   do4 do8 re si4._\parenthesize \prall do8
   do2 r
   r4 do8 si do re do si

   %92
   la2. la4
   si sol do4. re8
   si4 si8[re do mi re fa]

   %95
   mi4 mi mi4. mi8
   mi4 re8\prall do re4. re8
   re2 do4 do8 re\mbreak

   %98
   mi2 r8 mi fad sol
   la4. sold8 la4. si8
   sold4 mi8[re mi fa? mi re]

   %101
   dod4 dod dod4. si16 dod
   re4. mi8 fad4. mi16 fad
   sol4 sol8 [fa? sol la sol fa]

   %104
   mi2 r8 re mi fa
   sol4 fa8[mi fa mi re do]
   si2 r8 la si do

   %107
   re4 do8\prall si la4.\prall sol8\mbreak
   sol4 re'8[do re mi re do]
   si4 si8[re do mi re fa]

   %110
   mi4 mi8 [re mi fa mi re]
   do4 do do4. do8
   fa4 fa8[mi fa sol fa mi]

   %113
   re4 re8[do re mi re do]
   si1
   r4 sol' sol sol\mbreak

   %116
   fa fa8 mi fa4. sol8
   mi4 mi mi4. fa8
   re1

   %119
   R
   r4 re re re
   do do8 si do4. re8

   %122
   si4 sol8[si la do si re]\mbreak
   do2 do~
   do4 do do4. si8

   %125
   do\breve\fermata

}

IobIn =  \relative do'' {

   do2 mi4. fad8
   sol2 sol
   re4. mi8 fa?4. sol8

   %4
   mi2 mi4. fa8
   re4.\prall do8 re4. mi8
   fa2 fa4. sol8

   %7
   la4. la8 sol4.\prall fa8
   mi4. fa8 sol2
   do, fa

   %10
   re\prall mi4. mi8
   fad2 sol~
   sol4 sol do,4. do8

   %13
   re2 r
   sol, la4. si8
   do2 do4. re8

   %16
   si2 si\mbreak
   do4.(re8) re4.\downprall do16 re
   mi1

   %19
   re4. do8 re4. mi8
   fa4. mi8 fa4. sol8
   la2. la4

   %22
   la2 sol~
   sol4 sol fa2~
   fa4 fa mi4. mi8

   %25
   mi4 fa8 mi re4.\prall do8
   si2 sol
   do4. sib8 sib4.\prall la8

   %28
   la4 la re2~
   re4 si mi2~\mbreak
   mi4 do fa4. fa8

   %31
   fa2 mi4. mi8
   la sol fa mi re4.\prall do8
   do re mi fa sol4. sol8

   %34
   la sol fa mi re4.\prall do8
   do2 r
   R1*2

   %38
   sol'8 fa mi re do4
   sol' re sol
   do, do8 si do re

   %41
   si4.\prall la8 sol4
   sol'8 la sol fa mi4
   fa8 sol fa mi re4

   %44
   mi8 fa re4.\prall do8
   do2.
   mi4 mi8 re mi fa

   %47
   re4 re mi
   fa8 mi fa sol fa sol
   mi2 mi4

   %50
   mi8 re mi fad sol la
   fad2 sol4
   sol4. la8 fad4

   %53
   sol2.\mbreak
   R2.
   sol8 fa? sol la sib sol

   %56
   la4 la8 sol la fa
   sol4 mi8 re mi do
   re4 re8 do re mi

   %59
   fa4 fa8 mi fa sol
   mi4. fa8 sol4
   la8 sol fa4.\prall mi8

   %62
   re4.\prall re8 sol4\mbreak
   fa8\prall mi re4. do8
   do4. do8 sol'4

   %65 OOKK
   fa8\prall mi re4.\prall do8
   do2.
   r4 re\solo re8 do re mi

   %68
   re4.\prall do8 si do re mi
   fa4 fa mi8 re mi fa\mbreak
   sol4 sol re8 do re mi

   %71
   re4 re re sol8 fa
   mi re mi fa sol4 fa8\prall mi\mbreak
   re1\prall

   %74
   R1*6
   r4 do8\solo[mi re fa mi sol]\mbreak
   fa4 r r2

   %82
   r4 re8\solo[fa mi sol fa la]
   sol4 r r2
   r4 mi8[sol fa la sol sib]

   %85
   la4 r r2
   r4 sol8\solo[fa sol la sol fa]
   mi4 mi8 fa re4.\prall do8\mbreak

   %88
   do4 r r2
   R1*2
   r4 do8 si do re do si

   %92
   la2. la4
   si sol do4. re8
   si4 si8[re do mi re fa]

   %95
   mi4 mi mi4. mi8
   mi4 re8\prall do re4. re8
   re2 do4 do8 re\mbreak

   %98
   mi2 r8 mi fad sol
   la4. sold8 la4. si8
   sold4 mi8[re mi fa? mi re]

   %101
   dod4 dod dod4. si16 dod
   re4. mi8 fad4. mi16 fad
   sol4 sol8 [fa? sol la sol fa]

   %104
   mi2 r8 re mi fa
   sol4 fa8[mi fa mi re do]
   si2 r8 la si do

   %107
   re4 do8\prall si la4.\prall sol8\mbreak
   sol4 re'8[do re mi re do]
   si4 si8[re do mi re fa]

   %110
   mi4 mi8 [re mi fa mi re]
   do4 do do4. do8
   fa4 fa8[mi fa sol fa mi]

   %113
   re4 re8[do re mi re do]
   si1
   r4 sol' sol sol\mbreak

   %116
   fa fa8 mi fa4. sol8
   mi4 mi mi4. fa8
   re1

   %119
   R
   r4 re re re
   do do8 si do4. re8

   %122
   si4 sol8[si la do si re]\mbreak
   do2 do~
   do4 do do4. si8

   %125
   do\breve\fermata

}

IobIIn =  \relative do'' {

   R1*2
   sol2 la4. si8
   do2 do4. re8

   %5
   si4. la8 si4. dod8
   re4. re8 do?4. si8
   la2 si4. si8

   %8
   do4. re8 mi2
   la, re
   si\prall do4. si8

   %11
   la2 sol
   la2. la4
   si2 r

   %14
   sol la4. si8
   do2 do4. re8
   si2 si\mbreak

   %17
   do4.(re8) re4.\downprall do16 re
   mi1

   %19
   re4. do8 re4. mi8
   fa4. mi8 fa4. sol8
   la2. la4

   %22
   la2 sol~
   sol4 sol fa2~
   fa4 fa mi4. mi8

   %25
   mi4 fa8 mi re4.\prall do8
   si2 sol
   do4. sib8 sib4.\prall la8

   %28
   la4 la re2~
   re4 si mi2~\mbreak
   mi4 do fa4. fa8

   %31
   fa2 mi4. mi8
   la sol fa mi re4.\prall do8
   do si do re mi4. mi8

   %34
   fa mi re do si4. do8
   do2 r
   R1*2

   %38
   sol'8 fa mi re do4
   sol' re sol

   %40
   do, do8 si do re
   si4.\prall la8 sol4
   sol'8 la sol fa mi4

   %43
   fa8 sol fa mi re4
   mi8 fa re4.\prall do8
   do2.
   mi4 mi8 re mi fa

   %47
   re4 re mi
   fa8 mi fa sol fa sol
   mi2 mi4

   %50
   mi8 re mi fad sol la
   fad2 sol4
   sol4. la8 fad4

   %53
   sol2.\mbreak
   R2.
   sol8 fa? sol la sib sol

   %56
   la4 fa8 mi fa re
   mi4 mi8 re mi do
   re4 si8 la si dod

   %59
   re4 fa8 mi fa sol
   mi4. fa8 sol4
   la8 sol fa4.\prall mi8

   %62
   re4.\prall si8 mi4\mbreak
   re8\prall do si4. do8
   do4. do8 sol'4

   %65
   fa8\prall mi re4.\prall do8
   do2.
   r4 si\solo si8 la si do

   %68
   si4.\prall do8 re do si do
   la[sol la si do si do re]\mbreak
   mi4 mi si8 la si do

   %71
   la4 re8 do si4 si
   do8 si do re mi4 re8\prall do\mbreak
   si1\parenthesize \prall

   %74
   R1*6
   r4 la8\solo[do si re dod mi]\mbreak
   re4 r r2

   %82
   r4 si8\solo[re do mi re fa]
   mi4 r r2
   r4 do8[mi re fa mi sol]

   %85
   fa4 r r2
   r4 si,8\solo[la si do si la]
   sol4 do8 re si4.\parenthesize _\prall do8\mbreak

   %88
   do4 r r2
   R1*2
   r4 do8 si do re do si

   %92
   la2. la4
   si sol do4. re8
   si4 si8[re do mi re fa]

   %95
   mi4 mi mi4. mi8
   mi4 re8\prall do re4. re8
   re2 do4 do8 re\mbreak

   %98
   mi2 r8 mi fad sol
   la4. sold8 la4. si8
   sold4 mi8[re mi fa? mi re]

   %101
   dod4 dod dod4. si16 dod
   re4. mi8 fad4. mi16 fad
   sol4 sol8 [fa? sol la sol fa]

   %104
   mi2 r8 re mi fa
   sol4 fa8[mi fa mi re do]
   si2 r8 la si do

   %107
   re4 do8\prall si la4.\prall sol8\mbreak
   sol4 re'8[do re mi re do]
   si4 si8[re do mi re fa]

   %110
   mi4 mi8 [re mi fa mi re]
   do4 do do4. do8
   fa4 fa8[mi fa sol fa mi]

   %113
   re4 re8[do re mi re do]
   si1
   r4 sol' sol sol\mbreak

   %116
   fa fa8 mi fa4. sol8
   mi4 mi mi4. fa8
   re1

   %119
   R
   r4 re re re
   do do8 si do4. re8

   %122
   si4 sol8[si la do si re]\mbreak
   do2 do~
   do4 do do4. si8

   %125
   do\breve\fermata

}

Ihcn = \relative do'' {

   R1*16
   sol2 la4. si8
   do2 do4. re8
   
   %19
   si4. la8 si4. dod8
   re2 re
   do2. do4
   
   %22
   re2. re4
   do2. do4
   si2. do8 si
   
   %25
   la4 la la4.\parenthesize \prall sol8
   sol1
   sol2. sol4
   
   %28
   fa4. sol8 la4 la
   sol4. la8 si4 si\mbreak
   la4. si8 do4. re8
   
   %31
   si2 do4. do8
   do4 la8 sol sol4. sol8
   sol2 r
   
   %34
   R1*4
   do2 sol8 la
   si do si la sol4
   
   %40
   sol4. la8 fad4
   sol8 fad sol la si4
   si2 do4
   
   %43
   do4. re8 si4
   do8 re si4. do8
   do2.
   
   %46
   R2.*9
   do4 do4. do8
   do2 r4
   
   %57
   r do8 si do la
   si2 r4
   r re re
   
   %60
   do2 do4
   do8 si la4. la8
   si2 r4\mbreak
   
   %63
   R2.
   r4 la8 si do4
   re8 do si4. do8
   
   %66
   do2.
   R1*28
   r4 do8[si do re do si]
   
   %96 OOKK
   la4 la la4. la8
   si4 sol8[si la do si re]\mbreak
   do4 do8[si do re do si]
   
   %99
   la la si do re4. re8
   re4 do si4.\prall la8
   la2 la4. la8
   
   %102
   la4 la8[do si re do mi]
   re4 si do re8 si
   do la si do re4. re8
   
   %105
   do si do si la sol fad4
   sol4. sol8 la4. la8
   si4 la8 sol fad4. sol8\mbreak
   
   %108
   sol2 la4 fad
   sol sol8[si la do si re]
   do4 do8[si do re do si] 
   
   %111
   la4 la la4. la8
   re4 re8[do re mi re do]
   si1
   
   %114
   r4 re re re
   do4 do8 si do4. re8\mbreak
   si4 si si4. si8
   
   %117
   do4 do8 si do4. re8
   si4 si si4. si8
   do4 do8 si do4. re8
   
   %120
   si1
   r4 sol sol sol
   fa fa8 mi fa4. sol8\mbreak
   
   %123
   mi4 mi mi4. fa8
   re4 sol sol4. sol8
   mi\breve\fermata

}

Itln =  \relative do' {
   
   R1*14
   do2 mi4. fa8
   sol2 sol4. fa8\mbreak
   
   %17
   mi2 re
   do sol'~
   sol4 sol sol4. sol8
   
   %20
   la2. sol4
   fa2. fa4
   fa2 sol
   
   %23
   la2. la4
   re,2 mi
   fa4 la8 sol fa4.\prall mi8
   
   %26
   re2 si4 si
   mi2. mi8 re
   do4 do fa2~
   
   %29
   fa4 re sol2~\mbreak
   sol4 mi la4. la8
   re,4 sol sol4. sol8
   
   %32
   fa mi re do si4 sol'8 fa
   mi2 r
   R1*4
   
   %38
   mi8 fa sol fa mi4
   re2 re4
   mi2 re4
   
   %41
   re2 re4
   mi8 fa mi re do4
   re la' sol
   
   %44
   sol8 fa sol la sol fa
   mi2.\mbreak
   R2.*9
   
   %55
   mi4 mi4. mi8
   fa2 r4
   r sol fad
   
   %58
   sol2 r4
   r la la
   la2 sol4
   
   %61
   fa2 fa4
   sol2 r4 \mbreak
   R2.
   
   %64
   r4 r8 mi mi4
   la sol4. fa8
   mi2.
   
   %67
   R1*27
   r4 sol8[fa sol la sol fa]
   mi4 do8[mi re fa mi sol]
   
   %96
   fa2. re4
   sol4. sol8 mi4. mi8\mbreak
   mi4 mi mi4. mi8
   
   %99
   mi2 re
   mi2. mi4
   mi2 mi4. mi8
   
   %102
   re2. la'4
   sol2. sol4
   sol4. la8 fa si, do re
   
   %105
   mi re do4 re4. re8
   re4. mi8 do4 re
   sol8 fa mi4 re4. do8\mbreak
   
   %108
   re2 la4 re
   re2. re4
   sol2. sol4
   
   %111
   fa2. fa8 sol
   la2. la4
   sol2. sol4
   
   %114
   sol1
   sol2. sol4\mbreak
   sol1
   
   %117
   sol2. sol4
   sol1
   r4 sol sol sol
   
   %120
   fa fa8 mi fa4. sol8
   mi4 mi mi4. fa8
   re4 si do re\mbreak
   
   %123
   sol,2 sol
   sol2. sol4
   sol\breve\fermata
 
}

Ibcn = \relative do {

   R1*17
   do2 mi4. fa8

   %19
   sol2 sol
   re4. do8 re4. mi8
   fa4. fa8 sol4. la8

   %22
   sib2. sib4
   la2. la4
   sol2. la8 sol

   %25
   fa2. fa4
   fa1
   mi2. do4

   %28
   fa2. re4
   sol2. mi4\mbreak
   la2. fa4

   %31
   sol2 do,4. do8
   fa4 fa sol sol,
   do2 r

   %34
   R1*4
   do2 do4
   si2 si4

   %40
   la2 re4
   sol, sol'8 la sol fa
   mi2 la4

   %43
   re,2 sol4
   do, sol2
   do2.

   %46
   R2.*9
   do4 do4. do8
   fa2 r4

   %57
   r do do
   sol2 r4
   r re' re

   %60
   la la' mi
   fa2 re4
   sol2 r4\mbreak

   %63
   R2.
   r4 r8 la mi4
   fa sol sol,

   %66
   do2.
   R1*30
   r4 do8[si do re do si]\mbreak
   la4 la'8[sol la si la sol]

   %99
   fa1
   mi2 mi,
   la la'4. la8

   %102
   re,4 re8[do re mi re do]
   si4 sol8[si la do si re]
   do[do' sib la sib la sol fa]

   %105
   mi4 la re,2
   sol,8[sol' fa mi fa mi re do]
   si4 do re re,\mbreak

   %108
   sol4 sol' fad re
   sol sol8[fa sol la sol fa]
   mi4 do8[mi re fa mi sol]

   %111
   fa4 fa8[mi fa sol fa mi]
   re4 re re4. re8
   sol1

   %114
   sol
   sol\mbreak
   sol

   %117
   sol
   sol
   sol,

   %120
   sol
   sol
   sol

   %123
   sol
   sol
   do,\breve\fermata

}

Ifgn = \relative do {

   R1*3
   do2 mi4. fa8
   sol2 sol

   %6
   re4. do8 re4. mi8
   fa2 sol
   la mi

   %9
   fa re
   sol do~
   do si

   %12
   la1
   sol
   R1*4
   do,2 mi4. fa8

   %19
   sol2 sol
   re4. do8 re4. mi8
   fa4. fa8 sol4. la8

   %22
   sib2. sib4
   la2. la4
   sol2. la8 sol

   %25
   fa2. fa4
   fa1
   mi2. do4

   %28
   fa2. re4
   sol2. mi4\mbreak
   la2. fa4

   %31
   sol2 do,4. do8
   fa4 fa sol sol,
   do2 do'4. do8

   %34
   fa,2 sol8 la sol fa
   mi [fa mi re do sib la sol]
   fa2 sol

   %37
   do,1\fermata
   do'2 do4
   si2 si4

   %40
   la2 re4
   sol, sol'8 la sol fa
   mi2 la4

   %43
   re,2 sol4
   do, sol2
   do2.

   %46
   do4 do4. do8
   sol' la sol fa mi fa
   re4 re4. re8

   %49
   la'4 la,8 sol la si
   do2 si4
   la2 sol4

   %52
   do re re,
   sol2.
   R

   %55
   do4 do4. do8
   fa4 fa, fa
   do' do do

   %58
   sol sol' sol
   re re re
   la la' mi

   %61
   fa2 re4
   sol4. fa8 mi4\mbreak
   fa sol sol,

   %64
   la4. la'8 mi4
   fa sol sol,
   do2.

   %67
   sol'2. sol4
   sol8 fad sol la sol2
   re8 mi fa? sol la4 la

   %70
   mi8 re mi fa sol4 sol
   fa2 sol8 fa mi re
   do4 do do fa,\mbreak

   %73
   sol sol' sol8 fa sol la
   sol fa mi re do4 do
   do8 si do re do2

   %76
   fa,2. fa'4
   fa8 mi fa sol fa4 la,
   sib2 la8 sol la sib

   %79
   do4 sib do2
   fa,4 fa' fa4. mi8\mbreak
   re4 si do2

   %82
   sol4 sol' sol4. fa8
   mi4 fa sol2
   la4 la la4. sol8

   %85
   fa4 do fa4. fa8
   sol4 sol, sol4. sol8
   do4 do sol' sol,\mbreak

   %88
   do do do4. re8
   mi4 fa sol sol,
   do2 r

   %91
   R1*6
   r4 do8[si do re do si]\mbreak
   la4 la'8[sol la si la sol]

   %99
   fa1
   mi2 mi,
   la la'4. la8

   %102
   re,4 re8[do re mi re do]
   si4 sol8[si la do si re]
   do[do' sib la sib la sol fa]

   %105
   mi4 la re,2
   sol,8[sol' fa mi fa mi re do]
   si4 do re re,\mbreak

   %108
   sol4 sol' fad re
   sol sol8[fa sol la sol fa]
   mi4 do8[mi re fa mi sol]

   %111
   fa4 fa8[mi fa sol fa mi]
   re4 re re4. re8
   sol1

   %114
   sol
   sol\mbreak
   sol

   %117
   sol
   sol
   sol,

   %120
   sol
   sol
   sol

   %123
   sol
   sol
   do,\breve\fermata

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key do\major
   \time 2/2
   \tempo 2 = 65
   s1*37
   \bar "||"\break
   \once\override Staff.TimeSignature.style = #'single-digit
   \time 3/4
   \tempo 2. = 60
   s2.*29\break
   \time 2/2
   \tempo 2 = 85
   s1*58
   s\breve
   \bar "|."

}

Ids = {
   \Iglobal
   %\notypeset
   <<\Idsn \forma>>

}

IflI = {
   \Iglobal
   <<\IflIn \forma>>

}

IflII = {
   \Iglobal
   <<\IflIIn \forma>>

}

IobI = {
   \Iglobal
   <<\IobIn \forma>>

}

IobII = {
   \Iglobal
   <<\IobIIn \forma>>

}

Ihc = {
   \Iglobal
   <<\Ihcn \forma>>

}

Itl = {
   \Iglobal
   <<\Itln \forma>>

}

Ifg = {
   \Iglobal
   \clef bass
   <<\Ifgn \forma >>

}

Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \forma \Ibfn>>
   \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper {
   systems-per-page = #2
   print-first-page-number = ##t
   first-page-number = #2
} 

\header {
      subtitle = \markup "Offerte non encore exećuteé [H.522]"
      composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
   }

   \markup \huge  {"[1.] Offerte non encore exécutée"}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2 r1^\markup \center-align\smaller\center-column {"Viol[on]"} }
            \set Staff.shortInstrumentName = "vl"
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Ids
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2 do''2^\markup \center-align\smaller\center-column {"flu[te I]"}}
            \set Staff.shortInstrumentName = "fl1"
            \clef violin
            \set Staff.midiInstrument = #"flute"
            \IflI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2 r1^\markup \center-align\smaller\center-column {"flu[te II]"} }
            \set Staff.shortInstrumentName = "fl2"
            \clef violin
            \set Staff.midiInstrument = #"flute"
            \IflII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2 do''2^\markup \center-align\smaller\center-column {"haut[bois I]" }}
            \set Staff.shortInstrumentName = "hb1"
            \clef violin
            \set Staff.midiInstrument = #"oboe"
            \IobI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key do\major \time 2/2 r1^\markup \center-align\smaller\center-column {"haut[bois II]" }}
            \set Staff.shortInstrumentName = "hb2"
            \clef violin
            \set Staff.midiInstrument = #"oboe"
            \IobII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 2/2 r1^\markup \center-align\column\smaller{"viol[on]"} }
            \set Staff.shortInstrumentName = "hc"
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Ihc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key do\major \time 2/2 r1^\markup \center-align\column\smaller{"viol[on]"} }
            \set Staff.shortInstrumentName = "tl"
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \Itl
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse de]""Viol[lon]"}
            \set Staff.shortInstrumentName = "bvl"
            \set Staff.midiInstrument = #"contrabass"
            \Ibc
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basson"}
            \set Staff.shortInstrumentName = "fg"
            \set Staff.midiInstrument = #"bassoon"
            \Ifg
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
