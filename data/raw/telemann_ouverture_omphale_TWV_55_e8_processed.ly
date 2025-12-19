\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

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

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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

%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}

mbreak = { }


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}

IvlIn = \relative do'' {

   mi4. si8 si4 si
   \grace la8 sol4 \grace fad8 mi4 r8 r16 fad [mi8.-+ red16]
   mi4. fad8 fad4.-+ mi16 fad

   %4
   sol4. la8 si8.[dod16 re8. si16]
   mi4. fad8 fad4.-+ mi8
   red2 mi4. mi8

   %7
   mi4. re8 re4 si\mbreak
   sold4.-+ la8 si8.[do16 re8. si16]
   do4. la8 la4 do

   %10
   fad,-+ \grace mi8 re4 re'4. re8
   re4. la8 si2
   si4. la8 \grace si la4 \grace sol8 fad4

   %13
   sol4. la8 la4.-+ sol8
   sol2 si4 la8.-+ sol16
   re'4. la8 la4 (si8.) do16

   %16
   si4-+ \grace la8 sol4 sol'4. sol8\mbreak
   sol4. fad8 fad4. -+fad8
   fad4. sol8 \grace fad8 mi4 \grace re8 dod4

   %19
   lad2 la4 (sold8) la
   sold4-+~sold16 sold la si dod4. dod8
   fad,2 re'4. re8

   %22
   re4. dod8 \grace re8 dod4\grace si8 lad4
   si4. dod8 dod4. si8
   si1
   mi4. si8 si4 si si2. mi4

   %26OKz
   si' si fad sold
   la2 mi4 fad
   sol fad sol la8 sol

   %29
   fad2. si4
   mi,4 fad sol fad
   mi si sol'2~
   sol4 fa8 mi fa4 re

   %33
   mi do mi2~
   mi4 re re2~\mbreak
   re4 do8 si do4 la

   %36
   si sol r sol'8 fad
   mi2 r4 la8 sol
   fad2 r4 si8 la

   %39
   sol4. la8 fad4.-+ fad8
   fad4 sol8 fad mi re mi dod
   re4. mi8 dod4.-+ dod8

   %42
   dod4 re8 dod si dod re mi\mbreak
   fad2 r8 fad sold la
   sold2-+ r8 sold la si

   %45
   lad4 fad si4. la?8
   sol fad mi re dod4 fad
   red2 r4 si

   %48
   mi mi si dod
   re2 la4 si
   do do sol la\mbreak

   %51
   si2 fad4 sold
   la la la si8 la
   sol?2 r4 do8 si

   %54
   la2 r4 re8 do
   si2 r4 do8 re
   mi re mi fad sol fad sol mi

   %57
   la sol fad mi re do si la
   si sol la si do re mi fad\mbreak
   sol4. fad16 mi re4. re8

   %60
   re2~re8 do si la
   si4. do8 la4. sol8
   sol2 r8 la sol la

   %63
   si2 si4.-+(la16 si)
   do2 r8 do si do
   dod2 dod4.-+(si16 dod)

   %66
   re4 mi8 fad mi4 fad8 sol\mbreak
   fad4 re8 mi fad sol la fad
   si4 si fad sold

   %69
   la2 mi4 fad
   sol fad sol la8 sol
   fad4 si, r mi8 re

   %72
   dod2 r4 fad8 mi
   red2 r4 sol8 fad
   mi4. fad8 fad4.-+ mi8

   %75
   mi2 r8 sol fad mi\mbreak
   re dod re mi re do si re
   do si do re do si la do

   %78
   si la si do si la sol si
   la sol la si la sol fad la
   sol fad mi fad sol la sol la

   %81
   si4 la8 sol fad sol la fad
   sol4. la8 fad4. mi8
   mi4. si'8 si4. do8

   %84
   sold2-+ la4~la16 la si do
   si4.-+ si8 si8.[do16 re8. si16]
   do4 r16 la si dod dod4.-+ si16 dod

   %87
   re4 r16 mi re mi mi4.-+ re16 mi
   fad4. sol8 la8.[fad16 si8. fad16]
   sol4. (sol16 la) si4 \grace la8 sol4\mbreak

   %90
   \grace fad8  mi4.-+ red8 mi4. fad8
   red2 re4 (dod8) re
   dod4-+~dod16 dod  re mi fad4. fad8

   %93
   si,2 sol'4. sol8
   sol4. fad8 fad4 red
   mi4. \upl fad8 fad4. mi8

   %96
   mi2. mi4 mi1

}

IvlIIn = \relative do'' {

   sol2 r
   si,4. si8 si4 si
   si2 si4. si8

   %4
   si2 fad'4. sol8
   mi4. si'8 do4. do8
   si2 \grace do8 si4 \grace la8 sol4

   %7
   fad2 fad4 fad
   mi4. fad8 sold8.[la16 si8. sold16]
   la2 mi4 mi\mbreak

   %10
   re2 sol4~sol16 sol fad sol
   la4~la16 fad sol la sol4 re
   mi2. re4

   %13
   re4. sol8 fad4. sol8
   sol2 sol4. sol8
   la1

   %16
   sol2 sol4 la8. si16
   la4. la8 la4. la8
   sol2 sol4. sol8\mbreak

   %19
   fad2 fad4. fad8
   mi4-+~mi16 mi fad sold la4. la8
   la2 si4 fad

   %22
   sol2. fad4
   fad4. si8 lad4. si8
   si4. la!8 la4 sol8. fad16

   %25
   sol2 r si r
   r r4 si\mbreak
   fad' fad dod red

   %28
   mi red mi fad8 mi
   red2 re4 mi8 re
   dod2 dod4 red

   %31
   mi2 re!4 mi
   la, la8 si do4 re
   sol,2 si4 do

   %34
   fad, fad8 sold la4 si
   mi,2 sol4 la\mbreak
   sol si8 la sol2

   %37
   r4 do8 si la2
   r4 re8 do si4. si8
   si4. do8 la4 re

   %40
   si2. la4
   la si la4.-+ la8
   la2 si4. si8

   %43
   dod4 fad8 mi re4 re8 dod\mbreak
   si4 si mi mi8 re
   dod4 lad si4. si8

   %46
   si2 lad-+
   si4 fad8 mi red4 fad
   mi2 r

   %49
   la r
   sol r
   fad r

   %52
   mi4. sol8 fad2-+\mbreak
   mi4 sol8 fad mi4 la8 sol
   fad4 la8 sol fad4 si8 la

   %55
   sol4 si8 la sol4. si8
   do si do re mi re do si
   la2~la8 fad sol la

   %58
   sol2~sol8 la si do
   re do re si la fad sol la
   si la sol la fad4. la8\mbreak

   %61
   sol4. la8 fad4. sol8
   sol2 r
   sol r

   %64
   sol r
   la r
   la4 la la mi'

   %67
   re2 re
   re4 si8 dod re2
   dod4 la8 si do2

   %70
   si4 red mi fad8 mi\mbreak
   red4 red8 dod si4 sol8 fad
   mi4 dod'8 si la4 la8 sol

   %73
   fad4 red'8 dod si4 mi
   mi4. red8 red4.-+ mi8
   mi2 si4 do

   %76
   fad, sol8 la si4 si
   mi,2 sol4 la
   re,  re8 mi fad4 sol\mbreak

   %79
   fad2 mi4 fad
   mi4. red8 mi fad mi fad
   sol4 fad8 sol red mi fad red

   %82
   mi4. fad8 red4. mi8
   mi2 r
   mi mi4. mi8

   %85
   mi4. fad8 sold8.[la16 si8. sold16]\mbreak
   la2 la4. la8
   la2 la4. la8

   %88
   la2 si4. si8
   si2 si4 si
   si2 la4. sol16 la

   %91
   si2 si4. si8
   la4~la16 la si dod si4. si8
   si2 mi4 si\mbreak

   %94
   do2. si4
   si4. mi8 red4. mi8
   mi2. r4 mi1

}

Ivlan = \relative do' {

   si2 r
   mi,4. sol8 fad4 fad
   mi sol si4. si8
   si2 si4. sol8
   sol2 la'4. la8
   fad2 mi4 si
   si2 si4 si
   si2 mi4 mi\mbreak
   mi2 la,4 la
   la2 sol4. sol8
   re'4. re8 re4 sol,
   sol2 do4 la
   sol4. re'8 re4.re8
   re2 re4. si8
   la4 re re2
   re2 re4. re8
   re2. re4\mbreak
   re2 mi4. mi8
   dod2 si4. si8
   si2 lad4.  dod8
   dod4 si fad' fad
   mi2. dod4
   si4. fad'8 fad4. fad8
   fad4. re8 re4. re8
   si2 r fad'2. r4
   R1*2\mbreak
   r2 r4 mi
   si' si fad sold
   la2 mi4 fad
   sol2 si4 la
   la2 la4 sol
   sol2 sol4 fad
   fad2 fad4 mi
   mi2 mi4 re
   re2 re4 si8 la\mbreak
   sol4 r mi' do8 si
   la4 r fad'4. fad8
   mi4. mi8 re4. re8
   re2 si4 dod
   fad4. mi8 mi4.-+ re16 mi
   fad2. mi8 re
   dod4 lad si2
   r4 si dod2\mbreak
   r4 dod fad, fad'
   mi sol2 fad4
   fad red8 dod si4 red
   si2 mi
   r re
   r do
   r si
   r si~si4 si do2\mbreak
   r4 re re2
   r4 mi mi mi8 fa
   sol2 sol4.sol8
   re2. re4

   %58
   re8 si do re do4 si8 la
   sol4. sol8 la4. la8
   sol4 re' la4. re8
   re4. mi8 re4. re8\mbreak
   si2 r
   re r
   do r
   mi r
   re4 re la' la
   la2 la
   \parenthesize sol_\markup\smaller\center-align"[Dresden source]" fad4 re8 mi
   fad2 mi4 do8 re
   mi2 si
   si4 dod8 red mi2\mbreak
   r4 mi fad2
   r4 si, mi si'8 la
   sol4. do8 si4. si8
   sol4 sol8 la si4 fad
   fad2 fad4 mi
   mi2 mi4 la
   sol2 fad4 mi8 re
   dod4 dod8 red mi4 si\mbreak
   si2 mi4 mi
   mi4. mi8 si4 si
   si4. do8 si4. si8
   si2 r
   si la4. la8
   mi'2 mi4. mi8
   mi2 mi4. mi8
   re2 la4. la8\mbreak
   re2 fad4. fad8
   mi2 mi4 mi
   mi4. fad8 mi2
   fad mi4. mi8
   mi2 red4. fad8
   fad4 mi si' si
   la2. fad4
   mi4. si'8 si4. si8\mbreak
   si2. r4 si1

}

Ibcn = \relative do {

   mi,1
   mi'4. si8 si4 si
   sol mi r8 r16 si' [dod8. red16]

   %4
   mi2 re?4. mi8
   do?4. si8 la4.-+ sol16 la
   si4. si'8 sol4  mi

   %7
   si'2 si4 si,
   mi2 mi4 mi,\mbreak
   la2 do4 la

   %10
   re~re16 re do re si4~si16 si la sol
   fad4~fad16 re mi fad sol4 si
   do,2. do'4

   %13
   si sol re' re,
   sol4~sol16 re' mi fad sol4. sol8
   fad1

   %16
   sol2 si4 la8. sol16\mbreak
   re'4. la8 la4 (si8.) do16
   si4 sol~sol8.[ fad16 sol8. mi16]

   %19
   fad4~fad16 fad mi fad red4. red8
   mi2~mi8.[mi16 re8. dod16]
   re4~re16 re dod re si4 re

   %22
   mi,2. mi'4
   re si fad' fad,
   si4. si'8 si4 si

   %25
   sol mi r2 si2. r4
   R1*4
   r2 r4 si'

   %31
   mi mi si dod
   re2 la4 si
   do? do sol la

   %34
   si2 fad4 sold
   la la mi fad\mbreak
   sol? sol,8 la si4 sol

   %37
   do la8 si do4 la
   re si8 do re4 si
   mi do re re,

   %40
   sol2. sol'4
   fad sol la la,
   re2. dod8 si

   %43
   lad4 fad si2\mbreak
   r4 mi8 re dod2
   r4 fad8 mi re4 si

   %46
   mi2 fad
   si, r4 si'8 la
   sol fad sol la sol si la sol

   %49
   fad mi fad sol fad la sol fad
   mi re mi fad mi sol fad mi\mbreak
   re dod re mi re fad mi re

   %52
   dod4. (red8) red2-+
   mi4 mi8 re? do?4 la
   re fad8 mi re4 si

   %55
   mi sol8 fad mi4 mi8 re
   do2 do'4. do8
   fad,2~fad8 re mi fad

   %58
   sol4. fa8 mi4 re8 do\mbreak
   si la si sol fad re mi fad
   sol la si do re mi fad re

   %61
   sol4 do re re,
   sol sol re mi
   fa2 r8 fa mi re

   %64
   mi4 do mi fad!
   sol2 r8 sol fad mi
   fad4 re dod la\mbreak

   %67
   re2 re'
   sol,4 sol8 la si2
   fad4 fad8 sold la2

   %70
   mi mi,
   si'4 si'8 la sol2
   r4 la8 sol fad2

   %73
   r4 si8 la sol4 sol,
   do la si si'
   do do sol la\mbreak

   %76
   si2 fad4 sold
   la la mi fad
   sol2 red4 mi

   %79
   fad fad dod red
   mi2 do!4 si8 la
   sol4 la si2

   %82
   mi4 la si si,
   mi,2 r
   re'4~re16 re do si\mbreak do4~do16 do si la

   %85
   sold2 mi4. mi8
   la2 sol'4. sol8
   fad2 dod4. dod8

   %88
   re2 red4. red8
   mi4. (mi16 fad) sol4 mi
   do'4. si8 do2

   %91
   si4~si16 si la si sold4. sold8\mbreak
   la2~la8.[la16 sol!8. fad16]
   sol4~sol16  sol fad sol mi4 sol

   %94
   la,2. la'4
   sol mi si' si,
   mi2. r4 mi1

}


Ibfn = {

   \figuremode {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 4/4
   \key mi\minor
   \tempo 2 = 60
   s1
   \repeat volta 2{\grace s8
      s1*22
   }
   \alternative {{s1 s}{\time 2/2 \tempo 1 = 55 s1}}\break
   \set Score.currentBarNumber = #26
   \repeat volta 2{
      s1*57\break
      \time 4/4
      \tempo 2 = 60
      s1*13
   }
   \alternative {{\time 2/2  s1}{\time 4/4 s1}}
   \bar "|."

}

IvlI = {
   \Iglobal
   \clef violin
   \notypeset
   <<\IvlIn \forma >>

}

IvlII = {
   \Iglobal
   \clef violin
   <<\IvlIIn \forma >>

}

Ivla ={
   \Iglobal
   \clef alto
   << \Ivlan \forma >>

}

Ibc = {
   \Iglobal
   \clef bass
   << \Ibcn \Ibfn \forma >>
   \typeset

}


IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}

IIvlIn = \relative do'' {

   re8
   si4-+ la8
   sol(si) la-+
   sol(si) la-+

   %4
   sol4 re8
   sol4 la8
   si(la) do\mbreak

   %7
   si4-+ la8
   la4 la8
   fad4 sol8

   %10
   la si do
   si si16 la sol fad
   sol4 mi8

   %13
   do' si la
   si mi la,
   fad4-+ mi8

   %16
   mi4 sold8\mbreak
   la4 si8
   do mi re

   %19
   do re si
   do4 re8
   si4 la8

   %22
   sol re do'
   la4-+ sol8
   sol4

}

IIvlIIn = \relative do'' {

   sol8
   re4 do8
   si(re) do
   si(re) do

   %4
   si4 si8
   re4 fad8
   sol(mi) la\mbreak

   %7
   sol4-+ fad8
   fad4 fad8
   re4 mi8

   %10
   fad sol la
   fad4 fad8
   mi4 mi8

   %13
   mi red mi
   mi4 fad8
   red4 mi8

   %16
   mi4 mi8
   mi fad sold\mbreak
   la do si

   %19
   la si sold
   la4 la8
   sol4 fad8

   %22
   sol4 sol8
   fad4 sol8
   sol4

}

IIvlan = \relative do' {

   si8
   sol4-+ r8
   sol4-+ r8
   sol4 r8

   %4
   sol4 sol8
   sol si re
   re do re

   %7
   re4 re8
   re4 re8
   re4 r8

   %10
   re4 r8
   fad4 red8
   mi4 mi8

   %13
   mi si mi
   si4 do8
   si4 si8

   %16
   si4 si8
   do4 re8
   mi4 mi8

   %19
   mi fa mi\mbreak
   mi4 fad!8
   re4 re8

   %22
   re4 mi8
   re4 re8
   si4

}

IIbcn = \relative do {

   r8
   sol'4 r8
   sol,4 r8
   sol'4 r8

   %4
   sol,4 sol8
   si sol re'
   sol4 fad8

   %7
   sol sol, re'\mbreak
   re,4 r8
   re''4 r8

   %10
   re,4 r8
   red'4 si8
   mi4 mi,8

   %13
   la si do
   sol4 la8
   si si, mi

   %16
   mi,4 re'8
   \parenthesize do4_\markup\smaller\center-align"[Dresden source]" si8
   la4 sold'8\mbreak

   %19
   la re, mi
   la, la' re,
   sol sol, re'

   %22
   si4 do8
   re re, sol
   sol4

}


IIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time3/8
   \key mi\minor
   \tempo 4. = 40
   \partial 8 s8
   s4.*7
   s4 \bar":..:" s8
   s4.*15
   s4
   \bar ":|."

}

IIvlI = {
   \IIglobal
   \clef violin
   \notypeset
   <<\IIvlIn \forma >>

}

IIvlII = {
   \IIglobal
   \clef violin
   <<\IIvlIIn \forma >>

}

IIvla ={
   \IIglobal
   \clef alto
   << \IIvlan \forma >>

}

IIbc = {
   \IIglobal
   \clef bass
   << \IIbcn \IIbfn \forma >>
   \typeset

}


IIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}

IIIvlIn = \relative do'' {

   sol'8 la
   si4 la sol fad
   sol mi mi re
   do si la re

   %4
   si sol sol sol'8 la
   si4 la sol fad\mbreak
   sol mi mi re

   %7
   do si la re
   sol,2. si8 dod
   re4 dod re mi

   %10
   dod si8 dod la4 dod8 red
   mi4 red mi fad
   red si si'2\mbreak

   %13
   r4 la8 sold la2
   r4 sol8 fad sol4 fad
   mi si mi red

   %16
   mi fad sol fad
   si4 si, mi red
   mi fad sol fad

   %19
   la sol fad sol
   mi2. mi1

}

IIIvlIIn = \relative do'' {

  mi4
  mi2 mi4 red
  mi si si si
  mi, fad8 sol la4 fad

  %4
  sol re re mi'
  mi2 mi4 red
  mi si si si\mbreak

  %7
  mi, fad8 sol la4 fad
  sol2. sol4
  la sol la si

  %10
  la2. la4
  si la si do
  si2 r4 red

  %13
  mi2 r4 si
  si2 r4 si
  si2 si\mbreak

  %16
  si si
  si si
  si si4 si

  %19
  mi2 red
  mi2. mi1

}

IIIvlan = \relative do' {

  si'4
  si do si si
  si sol sol la8 si

  %3
  la4 re, re re
  re si si si'
  si do si si

  %6
  si sol sol la8 si\mbreak
  la4 re, mi re
  si2. mi4

  %9
  la, mi' la, mi'
  mi re8 mi dod4 fad
  si, fad' si, fad'

  %12
  fad2 r4 fad
  mi2 r4 fad
  mi2 r4 red\mbreak

  %15
  mi2 mi4 fad
  sol red mi fad
  mi2 mi4 fad

  %18
  sol red mi fad
  mi2 si
  si2. si1



}

IIIbcn = \relative do {

   mi8 fad
   sol4 la si si,
   mi2. fad8 sol
   la4 sol fad re

   %4
   sol sol, sol mi'8 fad
   sol4 la si si,
   mi2. fad8 sol

   %7
   la4 sol do, re
   sol re sol, mi'
   fad mi fad sold

   %10
   la2. fad4
   sol fad sol la
   si2. si4

   %13
   dod2. red4
   mi2. si4\mbreak
   sol sol8 fad sol4 fad

   %16
   mi si mi red
   sol sol8 fad sol4 fad
   mi si mi re

   %19
   do la si2
   mi,4 sol mi' mi,1

}


IIIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 4/4
   \key mi\minor
   \tempo 1 = 60
   \partial 4 s4
   s1*7
   s2.
   \bar":..:"
   \repeat volta 2{s4
   s1*11}
   \alternative {{\set Score.measureLength = #(ly:make-moment 3 4) s2.}{\set Score.measureLength = #(ly:make-moment 4 4) s1}}
   \bar ":|."

}

IIIvlI = {
   \IIIglobal
   \clef violin
   \notypeset
   <<\IIIvlIn \forma >>

}

IIIvlII = {
   \IIIglobal
   \clef violin
   <<\IIIvlIIn \forma >>

}

IIIvla ={
   \IIIglobal
   \clef alto
   << \IIIvlan \forma >>

}

IIIbc = {
   \IIIglobal
   \clef bass
   << \IIIbcn \IIIbfn \forma >>
   \typeset

}


IVglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}

IVvlIn = \relative do'' {

  si8
  dod re16(dod) si(la)
  si8 la16(sold) la8
  si dod16(red) mi(dod)
  mi(red) dod(si) dod8
  red red8.-+(mi32 red)
  mi8 mi8.-+(red32 mi)\mbreak
  fad8 si, lad
  si4 si8
  sold16(si) sold(mi) si'8
  mi si la
  sold16(si) sold(mi) si'8
  mi8 si dod
  re dod4
  fad8 mi16(red!) dod(si)
  mi8 fad red
  mi4

}

IVvlIIn = \relative do'' {

  sold8
  la si16 (la) sold (fad)
  sold8 mi mi
  mi4 fad8
  fad4 lad8
  si4 si8
  si4 lad8
  si sold fad
  fad4 fad8
  mi4 r8
  mi mi red
  mi4 r8
  si'4 la8
  si la4
  dod8 si si
  si dod si
  si4

}

IVvlan = \relative do' {

  mi8
  mi mi mi
  mi4 dod8
  si la dod
  si4 dod8
  si4 fad'8
  mi4 mi8
  si mi dod
  red4\mbreak si8
  si4 r8
  si si fad'
  si,4 r8
  sold'4 mi8
  mi mi4
  la8 fad fad
  mi la fad
  sold4

}

IVbcn = \relative do {

  mi8
  la sold la
  mi4 fad8
  sold la lad
  si4 fad8
  si, si' si,
  dod dod' dod,
  red mi fad\mbreak
  si,4 red8
  mi4 r8
  mi sold fad
  mi4 r8
  mi4 la8
  sold la4
  fad8 si la
  sold la si
  mi,4

}


IVbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 3/8
   \key mi\major
   \tempo 4. = 65
   \partial 8 s8
   s4.*7
   s4 \bar":..:" s8
   s4.*7
   s4
   \bar ":|."

}

IVvlI = {
   \IVglobal
   \clef violin
   \notypeset
   <<\IVvlIn \forma >>

}

IVvlII = {
   \IVglobal
   \clef violin
   <<\IVvlIIn \forma >>

}

IVvla ={
   \IVglobal
   \clef alto
   << \IVvlan \forma >>

}

IVbc = {
   \IVglobal
   \clef bass
   << \IVbcn \IVbfn \forma >>
   \typeset

}


Vglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}

VvlIn = \relative do'' {

  sol'8. fad16 sol8
  mi red mi
  fad si, mi4\staccatissimo sol\staccatissimo

  %4
  fad8. mi16 fad8
  sol fad mi
  fad dod re4\staccatissimo mi\staccatissimo \mbreak

  %7
  dod8. re16 si8
  dod dod4-+
  si4. si8 sol' fad

  %10
  mi do! la
  re si sol
  do la re4\staccatissimo sol\staccatissimo

  %13
  mi8 do mi4\staccatissimo la\staccatissimo
  fad8. re16 sol8
  la la4-+\mbreak

  %16
  sol8 si la
  sol fad mi
  red8.-+ dod16 red8

  %19
  mi red mi
  fad4.
  sold8 sold8. fad32 sold

  %22
  la8 si do
  si fad sol~
  sol16 la fad8.[mi16]

  %25
  mi8 si dod
  re la si\mbreak
  do sol la

  %28
  si fad sol~
  sol16 la fad4
  mi mi'8~

  %31
  mi re4
  do8 re16 do si la
  si8. do16 la8~

  %34
  la fad4
  mi8 sol' fad mi,4.

}

VvlIIn = \relative do'' {

  mi8. si16 mi8
  mi la, si
  si si si4\staccatissimo si\staccatissimo

  %4
  si4 si8
  mi si mi
  dod4\staccatissimo fad,\staccatissimo mi\staccatissimo

  %7
  mi8. fad16 re8\mbreak
  sol fad4
  fad4. fad8 sol si

  %10
  sol la la
  sol4 sol8
  la la sol4\staccatissimo re'\staccatissimo

  %13
  do8 sol do4\staccatissimo mi\staccatissimo
  re8. re16 re8
  mi re4-\parenthesize -+

  %16
  re fad8
  si,4 r8\mbreak
  r si si

  %19
  si4 si8
  si4.
  mi8 mi4

  %22
  mi4 mi8
  si4 si8
  do si4

  %25
  si la8
  la4 sol8
  sol4 \parenthesize fad8_\markup\smaller\center-align"[Dresden source]"

  %28
  fad4 mi8~
  mi16 fad red4\mbreak
  mi do'8

  %31
  si la mi
  la sol re
  sol8. la16 sol8

  %34
  fad red4
  mi8 sol si mi,4.

}

Vvlan = \relative do' {

  si'4 si8
  si la sol
  red4\staccatissimo si\staccatissimo mi\staccatissimo

  %4
  red4 si'8
  si4 si8
  dod4\staccatissimo si\staccatissimo si\staccatissimo

  %7
  la8. la16 re,8\mbreak
  mi lad,4
  si4. si8 re si

  %10
  do mi fad
  sol4 mi8
  la fad sol4\staccatissimo si\staccatissimo

  %13
  sol8 mi sol4\staccatissimo do\staccatissimo
  la8. fad16 sol8
  mi fad4-+

  %16
  sol red8\mbreak
  mi fad sol
  fad8.-+ mi16 fad8

  %19
  sol la si
  si4.
  si8 si4

  %22
  mi,8 sold la
  red, fad mi~
  mi16 fad red8.[mi16]

  %25
  mi4 mi8
  re!4 re8
  do4 do8\mbreak

  %28
  si4 si8
  do si la
  sol si' la

  %31
  fad la si
  mi, sol la
  re,4 re8

  %34
  do si4
  si8 re si si4.

}

Vbcn = \relative do {

  mi'8. red16 mi8
  sol, fad mi
  si' la sold4\staccatissimo mi\staccatissimo

  %4
  si'8. dod16 red8
  mi8. red16 mi8
  lad,4\staccatissimo si\staccatissimo sold\staccatissimo

  %7
  la?8. fad16 sol?8
  mi fad fad,
  si si'16 dod red si si,8 si' sol

  %10
  do la re
  si sol do
  la re si4\staccatissimo sol\staccatissimo

  %13
  do8 do, do'4\staccatissimo la\staccatissimo
  re8. do16 si8
  do re re,

  %16
  sol4 fad8\mbreak
  mi4.
  r8 si' la

  %19
  sol fad mi
  red8. dod16 red8
  mi mi' re?

  %22
  do si la
  si red mi
  la, si la

  %25
  sold4 la8
  fad4 sol?8
  mi4 fad8\mbreak

  %28
  red4 mi8
  la si si,
  mi sol la

  %31
  si fad sold
  la mi fad
  sol?8. fad16 sol8

  %34
  la si si,
  mi si' sol mi4.

}


Vbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 3/8
   \key mi\minor
   \tempo 2 = 60
   \repeat volta 2{
     s4.*2
     \set Score.measureLength = #(ly:make-moment 3 4)
     s2.
     \set Score.measureLength = #(ly:make-moment 3 8)
     s4.*2
     \set Score.measureLength = #(ly:make-moment 3 4)
     s2.
     \set Score.measureLength = #(ly:make-moment 3 8)
     s4.*2
   }
   \alternative {{s4.}{s}}
   \set Score.currentBarNumber = #10
   \repeat volta 2{
     s4.*2
     \set Score.measureLength = #(ly:make-moment 3 4)
     s2.*2
     \set Score.measureLength = #(ly:make-moment 3 8)
     s4.*21
   }
   \alternative {{s4.}{s}}
   \bar "|."

}

VvlI = {
   \Vglobal
   \clef violin
   \notypeset
   <<\VvlIn \forma >>

}

VvlII = {
   \Vglobal
   \clef violin
   <<\VvlIIn \forma >>

}

Vvla ={
   \Vglobal
   \clef alto
   << \Vvlan \forma >>

}

Vbc = {
   \Vglobal
   \clef bass
   << \Vbcn \Vbfn \forma >>
   \typeset

}


VIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}

VIvlIn = \relative do'' {

  mi4. si8
  do4~do16 si la sol fad4. si8
  mi,2~mi8 mi mi mi
  re'4. re8 re4. do16 si\mbreak

  %4
  do2~do4~do16 si do la
  si4. do8 la4. sol8
  fad2 re4 mi

  %7
  fad sol re mi
  fad sol la si
  do4. la8 re4. si8

  %10
  mi4. red8 mi4. fad8\mbreak
  red2 red1
  r4 si mi fad

  %13
  sol red mi si
  do si8 la si4 sol
  la8 sol fad mi fad4 si

  %16
  sol mi2 mi'8 re
  do4 do8 si la4 la\mbreak
  re re8 do si4 si8 la

  %19
  sol4 sol'8 fa mi4 sol
  do,2 do4.-+ si16 do
  re8 si do re mi fad sol la

  %22
  si4 la8 sol fad4. sol8
  sol4. sol,16 la si2~
  si4. fad16 sol la2~\mbreak

  %25
  la4. sol8 fad4. mi8
  si'2 sol4 si
  mi,2 mi

  %28
  mi la4 do
  fad,2 fad
  fad4 fad si la

  %31
  sol si mi re
  dod4. dod8 re4 mi\mbreak
  \grace mi8 red2 mi4. mi,8

  %34
  la4 sol8. fad16 fad4. mi8
  mi4 si' mi fad mi,1

}

VIvlIIn = \relative do'' {

  sol4. sol8
  fad2 fad4. re8
  mi2 r
  r8 mi mi mi si'4. si8\mbreak

  %4
  si4 la8. sol16 fad8.[sol16 mi8. fad16]
  sol2 mi
  re r

  %7
  re r
  re la'4 mi
  la4. la8 sol4. sol8

  %10
  sol8.[(la16) sol8. (la16)] la4.-+ si8\mbreak
  si2 si1
  r2 r4 si

  %13
  si la si fad
  sol fad2 mi4~
  mi mi2 red4

  %16
  mi mi2 mi4
  mi mi fad fad\mbreak
  fad fad sol sol

  %19
  sol sol sol sol
  la2 la
  sol r4 do

  %22
  re do8 si la4. sol8
  sol2 re4 sol
  fad red mi fad

  %25
  mi si2 mi4
  red2 mi4 mi
  mi2 re!

  %28
  do mi4 mi
  mi2 mi
  red r4 fad

  %31
  mi2 mi4 sold
  la2 la4 si
  si2 mi,4. mi8\mbreak

  %34
  red4 mi red4. mi8
  mi2 r4 si' mi,1

}

VIvlan = \relative do' {

  si4. si8
  la2 si4. si8
  sol2 sold4. la8
  si2 mi4. mi8\mbreak

  %4
  mi2 re4. re8
  re2 mi
  la, r

  %7
  la r
  la fad'4 mi
  mi4. re8 re4. re8

  %10
  do2 do'
  fad, fad1
  r2 r4 red

  %13
  mi la sol fad
  mi la fad si,
  do2 do4 si

  %16
  si sol2 si4
  la la re re
  re re re re

  %19
  mi mi mi mi\mbreak
  mi2 fad
  sol r4 fad

  %22
  sol mi la re,
  re2 re4 mi
  si fad' mi si

  %25
  si2 si4 do
  fad,2 mi4 sold
  la2 si

  %28
  la do4 la\mbreak
  dod2 lad
  si r4 red

  %31
  si2 do4 re?
  mi2 fad4 sol
  fad2 si,4. si8

  %34
  si4 si si4. si8
  si2 r4 red si1

}

VIbcn = \relative do {

  mi4. mi8
  mi2 re4. re8
  do2 si4. la8

  %3
  sold2 la8 mi' mi mi\mbreak
  la2 re,
  sol dod,

  %6
  re r
  re4 mi fad sol
  re mi fad sold

  %9
  la4. re8 si4 sol
  do2 do,
  si si1

  %12
  r2 r4 si
  mi fad sol red
  mi fad red mi

  %15
  do2 la4 si
  mi, mi'8 fad sol4 mi
  la la8 sol fad4 fad8 mi

  %18
  re4 re sol sol8 fa\mbreak
  mi4 mi8 re do4 do'8 si
  la2 la,

  %21
  si' r4 la
  sol do re re,
  sol sol, sol' mi

  %24
  red si dod red
  mi2 re?4 do
  si2 mi4 re\mbreak

  %27
  do2 sold
  la2 la'4 la,
  lad2 fad

  %30
  si r4 si
  mi re do si
  la sol fad mi

  %33
  si' la sol sol'
  fad mi si' si,\mbreak
  mi2 r4 si mi1

}


VIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 4/4
   \key mi\minor
   \tempo 2 = 44
   \repeat volta 2{
     \partial 2 s2
      s1*10
   }
   \alternative {{\set Score.measureLength = #(ly:make-moment 2 4) s2}{\set Score.measureLength = #(ly:make-moment 4 4) s1}}
   \set Score.currentBarNumber = #12
   \break\mark\markup\italic"tres vite"
   \tempo 1 = 60
   \time 2/2
   s1
   \repeat volta 2{
      s1*13\break
      \mark\markup\italic"gravement"
      \time 4/4
      \tempo 2 = 44
      s1*9
   }
   \alternative {{\time 2/2 s1}{\time 4/4 s}}
   \bar "|."


}

VIvlI = {
   \VIglobal
   \clef violin
   \notypeset
   <<\VIvlIn \forma >>

}

VIvlII = {
   \VIglobal
   \clef violin
   <<\VIvlIIn \forma >>

}

VIvla ={
   \VIglobal
   \clef alto
   << \VIvlan \forma >>

}

VIbc = {
   \VIglobal
   \clef bass
   << \VIbcn \VIbfn \forma >>
   \typeset

}


VIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}

VIIvlIn = \relative do'' {

  mi4 si do
  la2 re4
  si do la

  %4
  fad2-+ sol4\mbreak
  mi la fad
  red2 mi4

  %7
  fad fad2
  mi2.\fermata
  sol'4 sol sol

  %10
  sol,~sol16 la32(si do re mi fad) sol4
  mi la si
  mi,2 re4

  %13
  la' la la
  la,~la16 si32(dod re mi fad sol) la4\mbreak
  fad \grace la8 sol4 \grace fad8 mi4

  %16
  red2.
  mi4 si do
  la2 re4

  %19
  si do la
  fad2 sol4
  mi la fad

  %22
  red2 mi4
  fad fad2
  mi2.\mbreak

  %25
  re4 sol8(re) si'(sol)
  re'(si) sol'(re) si'4
  sol la fad

  %28
  sol2 mi4
  dod re8(si) mi(dod)
  fad(re) sol(mi) fad4

  %31
  re mi dod
  si2.

}

VIIvlIIn = \relative do'' {

  si2 la4
  la sol8 la fad4
  sol2 mi4

  %4
  re2 re4\mbreak
  mi2 do4
  si2 mi4~

  %7
  mi red2
  mi2.\fermata
  re2 mi4

  %10
  re2 re'4
  dod re si
  dod2 re4

  %13
  mi,2 mi4
  fad2 mi4
  si' si2\mbreak

  %16
  si2.
  si2 la4
  la sol8 la fad4

  %19
  sol2 mi4
  re2 re4
  mi2 do4

  %22
  si2 mi4~
  mi red2
  mi2.

  %25
  si4. si16 si si4\mbreak
  re4. re16 re re4
  sol do la

  %28
  si2 dod4
  lad si dod
  si lad si

  %31
  si dod lad
  si2.

}

VIIvlan = \relative do' {

  sol'2 mi4
  re2 re4
  re do2

  %4
  la si4
  sol do2\mbreak
  fad, si4

  %7
  do si2
  si2.\fermata
  sol2 sol4

  %10
  sol2 si4
  la la' re,
  la'2 fad4

  %13
  la,2 mi'4
  re2 mi4
  fad mi2

  %16
  fad2.\mbreak
  sol2 mi4
  re2 re4

  %19
  re do2
  la si4
  sol do2

  %22
  fad, si4
  do si2
  si2.

  %25
  sol4. sol16 sol sol4
  si4. si16 si si4\mbreak
  re mi re

  %28
  re mi sol
  fad2 sol4
  fad mi re

  %31
  re sol fad
  fad2.

}

VIIbcn = \relative do {

  mi2 la4
  fad mi8 fad re4
  sol mi do

  %4
  re(do) si\mbreak
  do2 la4
  si(la) sol

  %7
  la si8 la si4
  mi,2_\fermata mi'4
  si2 do4

  %10
  si la sol
  la fad sol
  la2 re,4

  %13
  dod' la dod
  re2 dod4\mbreak
  red mi mi,

  %16
  si' si'8 la si4
  mi,2 la4
  fad mi8 fad re4

  %19
  sol mi do
  re(do) si
  do2 la4

  %22
  si(la) sol
  la si8 la si4\mbreak
  mi, mi8 re mi fad

  %25
  sol4. sol16 sol sol4
  sol4. sol16 sol sol4
  si do re

  %28
  sol mi dod
  fad2 mi4
  re dod re

  %31
  sol mi fad
  si, si'8 la sol fad

}


VIIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 3/4
   \key mi\minor
   \tempo 2 = 67
   s2.*32
   \bar "||"
   \mark\markup\smaller"D.C."


}

VIIvlI = {
   \VIIglobal
   \clef violin
   %\notypeset
   <<\VIIvlIn \forma >>

}

VIIvlII = {
   \VIIglobal
   \clef violin
   <<\VIIvlIIn \forma >>

}

VIIvla ={
   \VIIglobal
   \clef alto
   << \VIIvlan \forma >>

}

VIIbc = {
   \VIIglobal
   \clef bass
   << \VIIbcn \VIIbfn \forma >>
   \typeset

}

\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

#(set-global-staff-size 18)

\markup \huge {[1.] Ouverture L'Omphale}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

      \new Staff

      <<
        \set Staff.instrumentName =  \markup \center-column  {"Violino 1." }
        \set Staff.midiInstrument = #"violin"
        \IvlI
      >>

      \new Staff

      <<
        \set Staff.instrumentName =  \markup \center-column  {"Violino 2."}
        \set Staff.midiInstrument = #"violin"
        \IvlII
      >>

      \new Staff

      <<
        \set Staff.instrumentName =  \markup \center-column  {"Viola"}
        \set Staff.midiInstrument = #"viola"
        \Ivla
      >>

      \new Staff  \with {
        fontSize = #+1.5
        \override StaffSymbol #'staff-space = #(magstep +1.5)
      }
      <<
        \set Staff.instrumentName =  \markup \center-column  {"Basso"}
        \set Staff.midiInstrument = #"cello"
        \Ibc
      >>
    >>

  }

  \layout {

    indent = 1.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine #'hair-thickness = #1.2
      \override SpacingSpanner
      #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[2.] Pastorale}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

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
        \set Staff.midiInstrument = #"viola"
        \IIvla
      >>

      \new Staff  \with {
        fontSize = #+1.5
        \override StaffSymbol #'staff-space = #(magstep +1.5)
      }
      <<
        \set Staff.midiInstrument = #"cello"
        \IIbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine #'hair-thickness = #1.2
      \override SpacingSpanner
      #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[3.] Bourrée}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \IIIvlI
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \IIIvlII
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"viola"
        \IIIvla
      >>

      \new Staff  \with {
        fontSize = #+1.5
        \override StaffSymbol #'staff-space = #(magstep +1.5)
      }
      <<
        \set Staff.midiInstrument = #"cello"
        \IIIbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine #'hair-thickness = #1.2
      \override SpacingSpanner
      #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[4.] Passepied}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \IVvlI
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \IVvlII
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"viola"
        \IVvla
      >>

      \new Staff  \with {
        fontSize = #+1.5
        \override StaffSymbol #'staff-space = #(magstep +1.5)
      }
      <<
        \set Staff.midiInstrument = #"cello"
        \IVbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine #'hair-thickness = #1.2
      \override SpacingSpanner
      #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[5.] Les Jeux - vite}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \VvlI
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \VvlII
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"viola"
        \Vvla
      >>

      \new Staff  \with {
        fontSize = #+1.5
        \override StaffSymbol #'staff-space = #(magstep +1.5)
      }
      <<
        \set Staff.midiInstrument = #"cello"
        \Vbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine #'hair-thickness = #1.2
      \override SpacingSpanner
      #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[6.] Les Magiciens - gravement}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \VIvlI
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \VIvlII
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"viola"
        \VIvla
      >>

      \new Staff  \with {
        fontSize = #+1.5
        \override StaffSymbol #'staff-space = #(magstep +1.5)
      }
      <<
        \set Staff.midiInstrument = #"cello"
        \VIbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine #'hair-thickness = #1.2
      \override SpacingSpanner
      #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[7.] Menuet en Rondeau}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \VIIvlI
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"violin"
        \VIIvlII
      >>

      \new Staff

      <<
        \set Staff.midiInstrument = #"viola"
        \VIIvla
      >>

      \new Staff  \with {
        fontSize = #+1.5
        \override StaffSymbol #'staff-space = #(magstep +1.5)
      }
      <<
        \set Staff.midiInstrument = #"cello"
        \VIIbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine #'hair-thickness = #1.2
      \override SpacingSpanner
      #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
