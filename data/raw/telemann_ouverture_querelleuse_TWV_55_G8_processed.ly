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
}

IvlIn = \relative do'' {

   si4~si16 sol la si do8.[si16 do8. re16]
   mi4. re16 do si4. do8
   re4 sol, sol'4. sol8

   %4
   sol8. fad32 mi fad8. sol16 la4. la8
   la8. sol32 fad sol8. mi16 red4. mi8
   fad4 si, si'4. si8

   %7
   si4. la8 la4(sol8) la\mbreak
   re,4. mi8 dod4(si8)\tr la
   re4. re8 mi4. fa8

   %10
   mi4.\tr re16 mi fa4. re8
   sib'4. la8 sol8.[fa16 mi8. re16]
   dod2 re4. re8

   %13
   sol4. fa8 mi4. re8
   re2 \grace do8 si4 \grace la8 sol4
   do4. re16 mi re8.[re16 mi8. fa16]

   %16
   mi4. fad!16 sol fad4. sol8
   la4 la, do4. re8
   si8.[la16 sol8. la16] si8.[do16 si8. do16]

   %19
   re4. mi8 do4. si8
   la1 la2.
   re8 mi16 fad sol8 re mi si

   %22
   do4 la8 si16 do re8 la\mbreak
   si8 sol'4 fad la8
   re, mi16 fad sol4 mi8 fad16 sol

   %25
   la8 mi fad dod re4
   si8 dod16 re mi8 si dod la
   la' la,16 la' sol8 la,16 sol' fad8 la,16 fad'

   %28
   mi8 la,16 mi' fad8 la,16 fad' sol8 la,16 sol'
   la8 la,16 la'  sol8 la,16 sol' fad8 la,16 fad'
   mi8 re16 mi fad8 dod re la

   %31
   si8.[dod16 re8. mi16 dod8. re16]
   re4 r re8 mi16 fad
   sol8 re mi fad16 sol la8 mi

   %34
   fad sol16 la si8 fad sol red
   mi4 dod8 re?16 mi fad8 dod
   red fad si,4.sol'8

   %37
   la, la'4 sol8 fad sol16 la\mbreak
   si8 si,16 si' la8 si,16 la' sol8 si,16 sol'
   fad8 si,16 fad' sol8 si,16 sol' la8 si,16 la'

   %40
   si8 si,16 si' la8 si,16 la' sol8 si,16 sol'
   fad8 mi16 fad sol8 red mi dod
   red8.[red16 mi8. fad16 fad8. mi16]

   %43
   mi sol fad sol mi fad sol fad mi re? do si
   la la' sol la fad sol la sol fad mi re do\mbreak
   si si'la si sol la si la sol fad mi re

   %46
   do mi re mi do re mi re do si la sol
   fad4 la8 si16 do re8 la
   si8 fad sol re'4 mi16 fad

   %49
   sol8 re mi si do16 mi fad sol
   la8 mi fad dod re4
   r si8 do!16 re mi8 si

   %52
   do4 la8 si16 do re8 la\mbreak
   si4 sol8 la16 si do8 mi,
   fad re re' mi16 fad sol8 re

   %55
   mi fad16 sol la8 mi fad dod
   re re,16 re' do!8 re,16 do' si8 re,16 si'
   la8 re,16 la' si8 re,16 si' do8 re,16 do'

   %58
   re8 re,16 re' do8 re,16 do' si8 re,16 si'
   la la' sol la si8 fad sol re
   mi8.[mi16 fad8. sol16 fad8. sol16]\mbreak

   %61
   sol8 si,4 sol mi'8~
   mi do4 la fad'8~
   fad re4 si sol'8~

   %64
   sol mi4 do la'8~
   la fad4 re si'8~
   si16 sol fad sol mi fad sol fad mi re do si

   %67
   la fad' mi fad re mi fad mi re do si la
   sol si la si do re mi re do si la sol
   fad sol fad mi re mi fad sol la si do la\mbreak

   %70
   re8 re,16 re' do8 re,16 do' si8 re,16 si'
   la8 re,16 la' si8 re,16 si' do8 re,16 do'
   re8 re,16 re' do8 re,16 do' si8 re,16 si'

   %73
   la8 sol16 la si8 la16 si do8. re16
   mi8 fad16 sol la8 mi fad re
   sol8.[la,16 si8. do16 la8. sol16]

   %76 OK
   sol2 si4. si8
   mi4. sol8 fad4(mi8) fad
   si,4. dod8 re2~\mbreak

   %79
   re8.[dod16 re8. mi16] dod4. mi8
   lad,2 fad'4. sol8
   mi4. re8 re4(si8) do!

   %82
   si2 do4. re8
   mi4~mi16 re do si dod8. si32 la sol'8. fad32 mi
   fad4 r16 re mi fad fad4. mi16 fad

   %85
   sol4(fad8) sol la4 sol8 la
   re,2~re8.[re16 do8. si16]\mbreak
   la4. si8 do4. do8

   %88
   do4. re8 si8.[do16 re8. si16]
   do8.[re16 si8. dod16] dod4. si16 dod
   re8.[la16 si8. sol'16] la,4. sol8

   %91
   sol2. sol1  %%%% OK

}

IvlIIn = \relative do'' {

   sol2 sol4. sol8
   sol2 sol4. do8
   do4. si16 la si4. si8

   %4
   la4. sol8 fad4. fad'8
   si,2 la4. mi'8
   mi4. re16 dod re4. re8

   %7
   re4. do!8 do4(si8) do\mbreak
   si2 la4. la8
   la4. si8 dod4. re8

   %10
   sol,2 do!4. sib8
   re4. dod8 re4. re8
   la2 la4. la8

   %13
   sol4. re'8 dod4. re8
   re2 sol,4. sol8
   sol2 sol4. sol8

   %16
   sol2 do!4. si8\mbreak
   la2~la8.[fad16 sol8. la16]
   re,4. mi16 fad sol8.[la16 sol8. la16]

   %19
   si4. sol8 fad4. sol8
   fad1 fad2.
   r4 sol8 la16 si do8 sol

   %22
   la mi fad4 fad8 sol16 la
   sol8 re la' si16 dod re8 la\mbreak
   si4 sol8 la16 si dod8 re16 mi

   %25
   la,4 r8 la fad si
   sol sold4 mi8 mi dod'
   re4 dod re

   %28
   dod re mi
   re dod re
   dod la fad

   %31
   re8.[sol16 fad8. sol16 mi8. la16]
   la8 si16 dod re8 la si la\mbreak
   sol8 sol4 mi'8 dod re16 mi

   %34
   la,8 fad' red mi16 fad si,4
   sol8 si mi, fad16 sol la8 mi
   fad sol16 la si8 fad sol4

   %37
   mi8 fad16 sol la8 mi si' red
   mi4 red mi
   red mi fad

   %40
   mi red mi
   red si sol8 la\mbreak
   fad8.[fad16 mi8. red16 red8. mi16]

   %43
   mi si' la si sol la si la sol8 sol
   la16 do si do la si do si la8 la
   si16 re do re si do re do si8 si

   %46
   mi,16 do' si do la si do si la8 la
   la si16 do re8 la si fad\mbreak
   sol re'4 mi16 fad sol8 re

   %49
   mi si do16 mi fad sol la8 mi
   fad [dod re sol,] fad sol16 la
   si8 fad sol4. si8

   %52
   mi, re16 mi fad4. la8
   re, mi16 fad sol8 fad mi4
   re si'8 la sol4~

   %55
   sol8 mi' dod re16 mi la,8 sol\mbreak
   fad4 la sol
   fad sol la

   %58
   sol la sol
   fad re8 re' si re
   sol,8.[sol16 la8. si16 la8. sol16]

   %61
   sol si la si sol la si la si8 si
   r16 do si do la si do si do8 si
   r16 re do re si do re do re8 re\mbreak

   %64
   r16 mi re mi do re mi re mi8 mi
   r16 fad mi fad re mi fad mi fad8 fad
   mi16 si la si sol4 la

   %67
   fad16 la sol la fad4 sol
   mi16 sol fad sol mi8 do'16 re mi re do si
   la si la sol fad mi re mi fad sol la fad

   %70
   sol4 fad sol\mbreak
   fad sol la
   sol fad sol

   %73
   fad re8 mi16 fad sol8 sol
   sol la16 si do4 la8 si16 do
   re8.[fad,16 sol8. la16 fad8. sol16]

   %76
   sol2 si4. si8
   si4. la8 la4. la8
   la8. sol32 fad sol8. mi16 fa8.[sol16 la8. sib16]\mbreak

   %79
   mi,2 mi4. sol8
   fad!2 si4. si8
   dod4 si si4. si8

   %82
   sol2 sol4. sol8
   sol4. sold8 la4 dod
   la2 re4. re8

   %85
   re4. do!8 do4. do8
   do4 si8. la16 si4 la8. sol16
   fad4. sold8 la4. la8\mbreak

   %88
   la4. si8 sold8.[la16 si8. sold16]
   la8.[si16 sold8. la16] sol4. sol8
   fad4 sol fad4. sol8

   %91
   sol2. sol1

}

Ivlan = \relative do' {

   re2 do4. sol'8
   sol4. sol8 re4. sol,8
   sol'2. re4

   %4
   re2 si'4. red,8
   mi4. mi8 fad4. si,8
   si'2. si4

   %7
   sol2 re
   re mi4. mi8
   re4. re8 sol4. la8\mbreak

   %10
   do2 fa,4. fa8
   sol4. mi8 re4 sol
   mi2 re4. re8

   %13
   re4. re8 la'4. la8
   la2 re,4. re8
   do4. do8 sol'4. sol8

   %16
   do,2 do4. re8
   re2 re4. re8\mbreak
   re2 re4 sol,

   %19
   sol4. sol8 la4 re
   re1 re2.
   R2.

   %22
   r4 r re8 mi16 fad
   sol4 re re
   re mi mi

   %25
   re8 mi re mi re fad
   mi re dod si la mi'\mbreak
   re4 sol la

   %28
   la2 si4
   re, sol la
   la4. la8 re, re

   %31
   re8. mi16 la,4 la
   fad' re8 mi16 fad sol8 re
   mi si do4 la8 si16 dod

   %34
   re4 fad mi8 fad
   mi4 mi8 dod re sol\mbreak
   fad red mi fad mi si

   %37
   la4 la fad'
   mi la si
   si2 do4

   %40
   mi, la si
   si4. si8 mi, mi
   si4 si8.[si16 si8. si16]

   %43
   si4 r8 mi16 fad sol fad mi re
   do4 r8 fad16 sol la sol fad mi\mbreak
   re4 r8 sol16 fad sol la sol fad

   %46
   mi4 r8 mi mi do
   re4 r8 re re4
   re r8 re si re

   %49
   si sol sol'4 r8 sol
   re sol la mi la fad
   re fad mi re do mi

   %52
   mi4 re re8 re\mbreak
   re re si do16 re do8 la
   la4 si8 re si re

   %55
   do4 mi8 mi re mi
   re4 re re
   re2 re4

   %58
   re re re
   re4. re8 re sol
   sol8.[sol16 do,8. re16 re8. re16]\mbreak

   %61
   si8 re r mi16 fad sol fad mi re
   do8 mi r fad16 sol la sol fad mi
   re8 fad r sol16 la si la sol fad

   %64
   mi8 sol r la16 si do si la sol
   fad8 la r si16 do re do si la
   sol4 r8 mi16 re do re mi do\mbreak

   %67
   re4 r8 re16 do si do re si
   do4 r8 do do mi
   la,4 la8 la re re

   %70
   re4 la' re,
   re2 mi4
   re la' re,

   %73
   re4. re8 do sol'
   do,4 do8 re16 mi re4\mbreak
   re8.[re16 re8. mi16 re8. re16]

   %76
   si2 mi4. mi8
   mi4. mi8 si4. si8
   si4 mi la,4. sol8

   %79
   mi'2 mi4. sol8
   dod,2 si4. si8
   fad'4 fad fad4. fad8

   %82
   re2 do!4. sol8\mbreak
   sol4. mi'8 mi4 mi
   re2 re4. re8

   %85
   sol,2 re'4. re8
   re2 re4. re8
   re4. re8 mi4. mi8

   %88
   mi1
   mi
   la4 re, re4. re8

   %91
   si2. si1

}

Ibcn = \relative do {

   sol'4~sol16 sol fad sol mi4 si
   do4. mi8 re4. do8
   sol'2~sol8.[la16 si8. sol16]

   %4
   re'2 red4. dod16 si
   mi4. sol,8 fad4. mi8
   si'2~si8.[dod16 re?8. si16]

   %7
   mi,4. fad8 fad4.\tr  mi16 fad\mbreak
   sol1
   fa4. fa8 mi4. re8

   %10
   sib'2 la4. sib8
   sol4. la8 sib8.[la16 sib8. sol16]
   la4. sol8 fa8.[mi16 re8. do16]

   %13
   sib8. la16 sol4 la~la16 la' sol la
   fad!8.[re16 mi8. fad16] sol4~sol16  sol fad sol
   mi8.[mi16 re8. do16]\mbreak si4~si16 sol la si

   %16
   do8.[re16 do8. si16] la8.[si16 la8. sol16]
   \once\tieDashed fad!2 ~fad8.[re16 mi8. fad16]
   sol2 sol'4 mi

   %19
   si4. do8 la4 sol
   re'~re16 re' dod re la8.[do16 si8. la16] re,2.
   R2.*2

   %23
   sol8 si16 dod re8 la si fad
   sol4 mi8 fad16 sol la8 mi
   fad [dod re la'] si dod16 re

   %26
   mi8 si dod sold la sol
   fad4 mi re
   la'2 sol4

   %29
   fad mi re
   la'8 si16 dod re8 la si fad
   sol mi fad re la' la,\mbreak

   %32
   re4 r r
   R2.
   r4 si'8 dod16 red mi8 si

   %35
   do! sold la4 fad8 sol16 la
   si8 fad sol red mi4
   dod8 red16 mi fad8 dod red si

   %38
   sol'4 fad mi
   si'2 la4
   sol fad mi

   %41
   si'8 dod16 red mi8 si do la\mbreak
   si fad sol mi si' si,
   mi, mi'4 mi, mi'8

   %44
   fad, fad'4 fad, fad'8
   sol, sol'4 sol, sol'8
   la, la'4 la, la'8

   %47
   re,4 re, r8 re'
   sol4 sol, r8 fad'
   mi sol do,4 r8 mi

   %50
   re4 re, re'8 mi16 fad
   sol8 re mi si do sold\mbreak
   la' si16 do re8 la si fad

   %53
   sol re  mi4 la,8 si16 do
   re8 mi16 fad sol8 re mi si
   do4 la8 si16 dod re8 la

   %56
   si4 fad sol
   re'2 do!4
   si fad sol

   %59
   re'8 mi16 fad sol8 re mi si
   do si la sol re' re,\mbreak
   sol16 sol' fad sol mi fad sol fad mi re do si

   %62
   la la' sol la fad sol la sol fad mi re do
   si si' la si sol la si la sol fad mi re
   do do' si do la si do si la sol fad mi

   %65
   re re' do re si do re do si la sol fad\mbreak
   mi8 mi,4 do' la8
   re re,4 si' sol8

   %68
   do do,4 la' do8
   re re,4 re' do8
   si4 la sol

   %71
   re'2 do4
   si la sol
   re'8 mi16 fad sol8 re mi si

   %74
   do4 la8 si16 do re4
   si8 re sol do, re re,
   sol4~ sol16 sol' fad sol mi8.[mi16 fad8. sol16]

   %77
   dod,4. red16 mi red4.\tr dod16 red
   mi2 re!8.[mi16 fa8. sol16]
   la2~la8.[ fad!16 sol8. mi16]

   %80
   fad4. mi8 re8.[dod16 re8. si16]
   lad4 si fad' fad,\mbreak
   fa'4~fa16 fa mi re mi4~mi16 re do si

   %83
   do4. mi8 la,2
   do'!4~do16 do si la si4. si8
   mi,4(re8) mi fad4(mi8) fad

   %86
   sol2 sol,4. sol8
   re'4. do16 si la8.[si16 do8. re16]
   mi1\mbreak

   %89
   mi,
   re4 sol re 're,
   sol2. sol1

}


Ibfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 4/4
   \key sol\major
   \tempo 2 = 55
   \repeat volta 2{
      s1*19
   }
   \alternative {{s1}{\time 3/4 \tempo 2 = 60 s2.}}\break
   \set Score.currentBarNumber = #21
   \repeat volta 2{
      s2.*55 \break
      \time 4/4 \tempo 2 = 55
      s1*15
   }
   \alternative {{\time 3/4 s2.}{\time 4/4 s1}}
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
}

IIvlIn = \relative do'' {

   sol'4 sol
   fad fad mi mi
   re2 do8 si la sol
   fad4 sol la8 si do la

   %4
   si4 sol sol' sol
   fad fad mi mi\mbreak
   re2 do8 si la sol

   %7
   fad4 sol la fad
   sol2 si4 si %% ripresa
   si si si si

   %10
   si2 si4 mi8 re
   do si la sol fad4 si
   sol mi la la

   %13
   la la la la\mbreak
   la2 re4 mi
   fad sol mi la

   %16
   fad2 sol4 sol
   fad fad mi mi
   re2 do8 si la sol

   %19
   fad4 sol la8 si do la
   si4 sol sol' sol
   fad fad mi mi

   %22
   re2\mbreak do8 si la sol
   fad4 sol la fad
   sol2 si4 do

   %25
   re mi fa re
   mi2 fa8(mi) re(do)
   si4 do re si

   %28
   do la dod re
   mi fad! sol fad
   sol2 la4 sol\mbreak

   %31
   fad mi8(re) fad mi re dod
   re2 sol4 sol
   fad fad mi mi

   %34
   re2 do8 si la sol
   fad4 sol la8 si do la
   si4 sol sol' sol

   %37
   fad fad mi mi\mbreak
   re2 do8 si la sol
   fad4 sol la fad

   %40
   sol2\fermata r



}

IIvlIIn = \relative do'' {

   si4 si
   re re do do
   si2 sol4 mi
   re sol sol fad

   %4
   sol re si' si
   re re do do
   si2 sol4 mi\mbreak

   %7
   re re mi re
   re2 sol4 sol % rip
   fad fad sol sol

   %10
   red2 mi4 mi
   mi mi mi red
   mi2 fad4 fad

   %13
   mi mi fad fad
   dod2 la'4 dod\mbreak
   re re re dod

   %16
   re2 si4 si
   re re do! do
   si2 sol4 mi

   %19
   re sol sol fad
   sol re si' si
   re re do do

   %22
   si2 sol4 mi\mbreak
   re re mi re
   re2 sol4 la

   %25
   si do re si
   do2 do4 si8(la)
   sold4 la si sold

   %28
   la mi la si
   dod re mi re
   dod2 mi4 dod\mbreak

   %31
   re la si la
   la2 si4 si
   re re do do

   %34
   si2 sol4 mi
   re sol sol fad
   sol re si' si

   %37
   re re do do
   si2 sol4 mi\mbreak
   re re mi re

   %40
   re2\fermata r

}

IIvlan = \relative do' {

   re4 re
   re re sol sol
   sol2 sol,4 do
   la re mi re

   %4
   re si re re
   re re sol sol
   sol2 sol,4 do\mbreak

   %7
   la sol do la
   si2 mi4 mi %5 rip
   red red mi mi

   %10
   si2 si4 si
   la la si si
   si2 re4 re

   %13
   dod dod re re
   la2 la4 mi'\mbreak
   la si la la

   %16
   la2 sol4 re
   re re sol sol
   sol2 sol,4 do

   %19
   la re mi re
   re si re re
   re re sol sol

   %22
   sol2 sol,4 do
   la sol do la\mbreak
   si2 re4 fad

   %25
   sol sol si sol
   sol2 sol4 fa
   si, mi mi mi

   %28
   mi do mi sold
   la la dod la
   la2 la4 la

   %31
   la la sol mi
   fad2 re4 re
   re re sol sol

   %34
   sol2 sol,4 do
   la re mi re
   re si re re

   %37
   re re sol sol
   sol2 sol,4 do\mbreak
   la sol do la

   %40
   si2\fermata r

}

IIbcn = \relative do {

   sol'4 sol
   si si do do
   sol2 mi4 do

   %3
   re si do re
   sol2 sol4 sol
   si si do do\mbreak

   %6
   sol2 mi4 do
   re si do re
   sol,2 r  %%%%%ripresa

   %9
   R1
   r2 sol'4 mi
   la fad si si,

   %12
   mi mi, r2
   R1
   r2 fad'4 mi

   %15
   re sol la la,\mbreak
   re re, sol' sol
   si si do do

   %18
   sol2 mi4 do
   re si do re
   sol2 sol4 sol

   %21
   si si do do
   sol2 mi4 do
   re si do re

   %24
   sol,2 sol'4 sol\mbreak
   sol sol sol sol
   do,2 do4 re

   %27
   mi re8 do si4 mi
   la,2 la'4 la
   la la la la

   %30
   la2 dod4 la
   re fad, sol la
   re,2 sol4 sol

   %33
   si si do do
   sol2 mi4 do
   re si do re

   %36
   sol2 sol4 sol
   si si do do\mbreak
   sol2 mi4 do

   %39
   re si do re
   sol,2\fermata r  %%%%%ripresa

}


IIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 2/2
   \key sol\major
   \tempo 1 = 50
   \partial 2 s2
   s1*40
   \bar "|."

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
}

IIIvlIn = \relative do'' {

   si8 sol si la si dod
   re la re mi fad re
   sol fad sol la si sol

   %4
   la sol fad mi re do
   si4 r8 sol' sol sol
   sol4 r8 fad fad fad \mbreak

   %7
   fad4 r8 mi mi mi
   mi dod la'4. sol8
   fad la si fad sol re

   %10
   mi sol la mi fad dod
   re fad sol re mi si
   dod la re4. si8

   %13
   mi dod fad4. re8
   sol4. mi8 fad4~
   fad8 re mi dod re si\mbreak

   %16
   dod la re si dod la
   mi' dod fad re sol mi
   fad re sol mi fad re

   %19
   si'sold la fad sol mi
   fad re mi dod re4~
   re8 mi mi4. re8

   %22
   re la la fad fad re
   re fad fad la la re
   re2 r4

   %25
   re8 la re dod re mi
   fad re fad mi fad sol
   la fad si la sol fad

   %28
   sol fad mi fad sol la
   si4 mi, r8 si'
   do4 r8 si la la

   %31
   la4. fad8 sol4~
   sol8 la fad4. mi8
   mi sol fad mi re dod\mbreak

   %34
   re si mi4. si8
   do! la si do re do
   si sol si re sol fad

   %37
   mi do mi sol la sol
   fad re sol4. re8
   mi do re4. si8

   %40
   do4. la8 si4~
   si8 sol la fad sol mi\mbreak
   fad re sol mi fad re

   %43
   la' fad si sol do la
   si sol do la si sol
   mi' dod re si do la

   %46
   si sol la fad sol4~
   sol8 la la4. sol8
   sol re' re si si sol

   %49
   sol si si re re sol
   sol2 r4

}

IIIvlIIn = \relative do'' {

   sol4 r8 sol sol sol
   la4 r8 la la la
   si4 r8 sol sol sol

   %4
   fad4 r8 fad fad fad\mbreak
   sol la si do re mi
   la, re la sol la fad

   %7
   si la si dod re si
   dod4 r8 re mi dod
   re4 re r8 re

   %10
   la4 la r8 la
   fad4 si r8 si
   la4. fad8 si la\mbreak

   %13
   sol mi la dod re do
   si dod re mi la, si
   la4 dod si

   %16
   la sold la
   dod re mi
   re dod re

   %19
   re dod mi
   la, sol fad8 la
   si4 la4. la8\mbreak

   %22
   la fad fad la la fad
   fad re re fad fad la
   la2 r4

   %25
   la4 r8 la la la
   la4 r8 la la la
   fad'4 r8 fad fad fad

   %28
   mi4 r8 mi mi mi
   mi4 si8 la si sol
   mi mi' do re mi fad\mbreak

   %31
   red mi fad red si red
   mi do si4. si8
   si4 dod r8 lad

   %34
   fad4 si8 sold la si
   mi,4 r8 mi la fad
   re4 r8 la' si4

   %37
   do8 sol do re mi do
   la4 re8 si do re\mbreak
   sol,4 la8 fad si sold

   %40
   mi sol! la fad re mi
   re4 fad mi
   re mi re

   %43
   fad sol la
   sol fad sol
   sol fad la

   %46
   re, fad mi8 re
   mi4 re4. re8\mbreak
   re si' si sol sol re

   %49
   re sol sol si si re
   re2 r4

}

IIIvlan = \relative do' {

   re4 r8 re re re
   re4 r8 re re re
   si4 r8 mi mi mi

   %4
   la,4 r8 re re re\mbreak
   re4 r8 sol, sol sol
   re'4 r8 re re re

   %7
   re4 r8 sol sol sol
   mi4 mi4. la8
   la4 re, r8 sol

   %10
   mi4 mi r8 la
   re,4 re r8 sol
   mi4 re8 la' sol4\mbreak

   %13
   si8 la la4 fad8 la
   re,4 si8 mi re4
   re la' sold

   %16
   mi si' mi,
   la la dod
   la mi la

   %19
   sold mi dod
   re dod re
   re dod la\mbreak

   %22
   fad'8 re re re re la
   la la la re re fad
   fad2 r4

   %25
   fad r8 fad fad fad
   re4 r8 re re re
   si4 r8 si' si si

   %28
   si4 r8 si si si
   si4 r si\mbreak
   la4 la4. la8

   %31
   fad4 fad mi
   r red fad
   sol dod, fad

   %34
   r8 fad mi4 mi
   mi r re
   re sol,4. si8

   %37
   do4 do4. mi8
   re4 re4. re8\mbreak
   do4 la8 re si mi

   %40
   mi4 re8 la' sol4
   sol, do si
   la mi' la,

   %43
   re re fad
   re la re
   dod la fad'

   %46
   sol do,! si8 re
   sol,4 fad la\mbreak
   si8 sol' sol re re si

   %49
   si re re sol sol si
   si2 r4

}

IIIbcn = \relative do {

   sol'4 r8 sol sol sol
   fad4 r8 fad fad fad
   mi4 r8 mi mi mi

   %4
   re4 r8 re re re\mbreak
   sol,8 fad sol la si dod
   re re, re' mi fad re

   %7
   sol fad sol la si sol
   la sol la si dod la
   re4 si r8 si

   %10
   dod4 la r8 la
   si4 sol r8 sol
   la4 fad8 re sol fad\mbreak

   %13
   mi la fad la si la
   sol la si dod re sol,
   la4 r8 la, la la

   %16
   la4 r8 la la la
   la4 r8 la la la
   la4 r8 la la la

   %19
   la4 r8 la la la
   la4 r8 la' si fad\mbreak
   sol mi la4 la,

   %22
   re re8 re re re
   re4 re,8 re re re
   re2 r4

   %25
   re'' r8 re re re
   re,4 r8 re re re
   red4 r8 si si si

   %28
   mi4 r8 mi mi mi\mbreak
   sol la sol fad sol mi
   la sol la si do la

   %31
   si dod red si mi si
   do! la si la si si,
   mi4 lad r8 lad

   %34
   si la! sold mi fad sold
   la4 r8 sol! fad re\mbreak
   sol4 r8 fad mi re

   %37
   do mi do si la do
   re4 si'8 sol la si
   do4 fad,8 si sold mi

   %40
   la mi fad re sol! do,
   re4 r8 re, re re
   re4 r8 re re re

   %43
   re4 r8 re re re\mbreak
   re4 r8 re re re
   re4 r8 re re re

   %46
   re4 r8 re' mi si
   do la re4 re,
   sol sol'8 sol sol sol

   %49
   sol4 sol,8 sol sol sol
   sol2 r4

}


IIIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 3/4
   \key sol\major
   \tempo 2 = 67
   s2.*24
   \bar ":..:"\break
   s2.*26
   \bar":|."

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
}

IVvlIn = \relative do'' {

   re8
   \grace mi re do16(si) do8 si\tr la16(sol) la8
   sol si re sol,16(la si do) re8
   \grace mi re do16(si) do8 si\tr la16(sol) la8

   %4
   sol4. re4 re'8\mbreak
   sol fad16(mi) fad8 mi re16(dod) re8
   la' sol16(fad) sol8 fad mi16(re) mi8

   %7
   la, sol' fad la, fad' mi
   la, la' sol la, sol' fad
   la, fad' mi la, sol'16(fad) mi(re)

   %10
   la8 fad' mi la, la'4
   fad8 mi16(re) mi8 dod si16(la) dod8\mbreak
   re4. la4 do!8

   %13
   \grace re do si16(la) mi'8 do si16(la) la'8
   fad mi16(re) sol8 mi4 si'8
   \grace do si la16(sold) la8 \grace si la sol16(fad) sol8

   %16
   \grace sol fad mi16(red) mi8 mi,4 mi'8
   fa re16(mi) fa(sol) mi8 do16(mi) re(mi)
   fa8 re16(mi) fa(sol)\mbreak mi8 do16(re) mi(fa)

   %19
   sol8 fa16(mi) fa8 mi re16(do) re8
   do mi sol do,16(re) mi(fa) sol8
   \grace la sol fa16(mi) fa8 \grace fa mi re16(do) re8

   %22
   do4. sol4 si8
   do si16(la) si8 la sol16(fad) sol8
   re' do16(si) do8 si la16(sol) la8\mbreak

   %25
   re, do' si re, si' la
   re, re' do re, do' si
   re, si' la re, do'16(si) la(sol)

   %28
   re8 si' la re, re'4
   si8 la16 (sol) la8 fad mi16(re) fad8
   sol4. re4

}

IVvlIIn = \relative do'' {

   si8
   si4 la8 sol4 fad8
   mi4 fad8 mi4 la8
   si4 la8 sol4 fad8

   %4
   re4. si4 si'8
   dod4 re8 dod4 si8\mbreak
   re4 dod8 re4 dod8

   %7
   r mi re r re dod
   r fad mi r mi re
   r re dod r dod re

   %10
   r re dod mi, mi' dod
   re4 si8 la4 la8
   la4. fad4 la8

   %13
   la4 si8 la4 mi'8
   re4 re8 sol,4 mi'8
   mi4 mi8 red4 si8

   %16
   si4 si8 sol4 si8
   re(re re) do(do do)
   re(re re) do4 mi8

   %19
   mi4 re8 do4 si8\mbreak
   la4 si8 la4 re8
   mi4 re8 do4 si8

   %22
   sol4. mi4 sol8
   fad4 sol8 fad4 mi8
   sol4 fad8 sol4 fad8

   %25
   r la sol r sol fad
   r si la r la sol\mbreak
   r sol fad r fad sol

   %28
   r sol fad r la fad
   sol4 mi8 re4 re8
   re4. si4

}

IVvlan = \relative do' {

   sol'8
   sol4 re8 re4 re8
   si4 si8 si4 la8
   sol4 re'8 re4 re8

   %4
   sol,4. sol4 sol8
   sol'4 la8 la4 fad8\mbreak
   re4 sol8 la4 la8

   %7
   r dod la r la sol
   r re' dod r dod la
   r la sol r mi la

   %10
   r la la, dod mi la
   la4 sol8 mi8 re16(dod) mi8
   fad4. re4 mi8

   %13
   mi4 mi8 mi4 mi8
   la4 re,8 do4 mi8
   do4 do'8 fad,4 mi8

   %16
   red fad mi si4 sol'8
   sol(sol sol) sol(sol sol )
   sol(sol sol) sol4 sol8

   %19
   do4 sol8 sol4 sol8\mbreak
   mi4 mi8 mi4 re8
   sol4 sol8 sol4 sol8

   %22
   do,4. do4 re8
   do4 re8 re4 si8
   sol4 do8 re4 re8

   %25
   r fad re r re do
   r sol' fad r fad re\mbreak
   r re do r la re

   %28
   r re re r re re
   re4 do8 la4 la8
   si4. sol4

}

IVbcn = \relative do {

   sol'8
   sol4 fad8 sol4 re8
   mi4 re8 mi4 fad8
   sol4 fad8 sol4 re8

   %4
   si re sol sol,4 sol'8\mbreak
   mi4 re8 la'4 si8
   fad4 mi8 re4 la'8

   %7
   la,4 r8 la4 r8
   la4 r8 la4 r8
   la4 r8 la4 r8

   %10
   la4 r8 la' dod la
   re4 sol,8 la4 la,8
   re fad, la re,4 la'8

   %13
   la4 sold8 la4 dod8
   re4 si8 do!4 sold8
   la4 do8 si4 mi8

   %16
   si'4 si,8 mi4 mi8
   si8(si si) do(do do)
   si(si si) do4 do'8\mbreak

   %19
   do4 si8 do4 sol8
   la4 sol8 la4 si8
   do4 si8 do4 sol8

   %22
   mi sol do do,4 si8
   la4 sol8 re'4 mi8
   si4 la8 sol4 re'8

   %25
   re,4 r8 re4 r8
   re4 r8 re4 r8\mbreak
   re4 r8 re4 r8

   %28
   re4 r8 re' fad re
   sol4 do,8 re4 re,8
   sol si re sol,4

}


IVbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 6/8
   \key sol\major
   \tempo 2. = 30
   \partial 8 s8
   s2.*11
   s4. s4 \bar":..:"\break s8
   s2.*17
   s4. s4
   \bar":|."

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
}

VvlIn = \relative do'' {

   re4 sol
   fad4. sol8 la4 sol
   fad\tr mi8 re sol4 fad8(sol)
   mi(fad) re(mi) do(re) si(do)

   %4
   la2 re4 sol
   fad4. sol8 la4 sol\mbreak
   fad mi8 re mi4 dod

   %7
   re4. mi8 mi4. re8
   re2 la4 si
   do4. mi8 re4 si

   %10
   do la fa' mi
   re do8 si si4. la8
   la2 mi'4 fad!

   %13
   sol4. mi8 la4 sol\mbreak
   fad mi8 re sol4 fad8(sol)
   mi(fad) re(mi) do(re) si(do)

   %16
   la2 sol4 do
   si4. do8 re4 do
   si la8 sol la4 fad

   %19
   sol4. la8 la4. sol8
   sol2\fermata si8\p(do) si(do)
   re2 mi4 do

   %22
   re2 sol4 fad8 mi\mbreak
   re4 do8 re mi4 do
   re2 sol,8(si4.)

   %25
   la8(do4.) si4 la8 sol
   la4 re, si'8(do) si(do)
   re2 mi4 do

   %28
   re2 sol4 fad8 mi
   re4 do8 re mi4 do
   re2 sol,8(si4.)

   %31
   la8(do4.)\mbreak si4 la8(si)
   sol2 fad8(sol) la(si)
   la4 si la sol

   %34
   la2 re4 dod8 re
   mi4 dod re si
   la2 re8(mi) fad(sol)

   %37
   fad4 mi sol fad
   mi re fad8(sol) la(si)
   la2 sol8(fad) mi(re)\mbreak

   %40
   mi4\tr re fad8(sol) la(si)
   la2 sol8(fad) mi(re)
   mi4\tr re dod8(re) mi(fad)

   %43
   mi4 re mi dod
   re2 la8(si) do!(re)
   do4 si la sol

   %46
   la re, sol8(si) la(re,)
   la'2 la8(do) la(re,)
   si'2 si8(re) si(sol)\mbreak

   %49
   la(do) la(fad) sol(si) sol(re)
   la'2 si8(do) si(do)
   re2 mi4 do

   %52
   re2 sol4 fad8 mi
   re4 do8 re mi4 do
   re2 sol,8(si4.)

   %55
   la8(do4.) si4 la8 si
   sol2

}

VvlIIn = \relative do'' {

   sol4 si
   la4. si8 la4 dod
   re la sol sol
   sol sol fad sol

   %4
   fad2 sol4 si
   la4. si8 la4 dod\mbreak
   re la si la

   %7
   fad4. si8 la4. la8
   la2 fad4 sold
   la4. do8 si4 sold

   %10
   la2 la4 sold
   la4. la8 sold4. la8
   la2 dod4 re

   %13
   mi4. dod8 re4 dod\mbreak
   re la sol sol
   sol sol fad sol

   %16
   fad2 mi4 mi
   re4. mi8 re4 fad
   sol re mi re

   %19
   sol4. sol8 fad4. sol8
   sol2\fermata sol8\p(la) sol(la)
   si2 do4 la

   %22
   si2\mbreak si4 do8 la
   si4 la8 si do4 la
   si2 re,4 sol

   %25
   sol fad sol fad8 mi
   fad2 sol8(la) sol(la)
   si2 do4 la

   %28
   si2 si4 do8 la
   si4 la8 si do4 la
   si2 re,4 sol\mbreak

   %31
   sol sol sol fad
   re2 re8(mi) fad(sol)
   fad4 sol fad mi

   %34
   fad2 fad4 mi8 fad
   sol4 mi fad sol
   fad2 la4 la

   %37
   la dod re dod
   si la re8(mi) fad(sol)
   fad2 re4 fad,\mbreak

   %40
   sol\tr fad re'8(mi) fad(sol)
   fad2 re4 fad,
   sol\tr fad mi8(fad) sol(la)

   %43
   sol4 fad sol mi
   fad2 fad8(sol) la(si)
   la4 sol fad mi

   %46
   fad2 re
   r fad
   r sol

   %49
   fad re\mbreak
   fad sol8(la) sol(la)
   si2 do4 la

   %52
   si2 si4 do8 la
   si4 la8 si do4 la
   si2 re,4 sol

   %55
   sol sol sol fad
   re2

}

Vvlan = \relative do' {

   sol'4 re
   re4. re8 mi4 la
   la fad re re
   do re la' re,

   %4
   re2 re4 re
   re4. re8 mi4 la\mbreak
   la la sol mi

   %7
   re4. re8 dod4 la
   fad'2 re4 re

   %9
   mi4. mi8 fa4 mi
   mi do re si
   la fa' si, mi

   %12
   do2 la4 la'
   si4. la8 la4 la\mbreak
   la fad re re

   %15
   do re la' re,
   re2 si4 do
   re4. sol,8 la4 re

   %18
   re re do do
   si4. mi8 re4 la
   si2\fermata re4\p re

   %21
   sol2 sol4 sol
   sol2 sol4 sol\mbreak
   sol sol sol sol

   %24
   sol2 sol,4 re'
   mi do re re
   re2 re4 re

   %27
   sol2 sol4 sol
   sol2 sol4 sol
   sol sol sol sol

   %30
   sol2 sol,4 re'
   mi mi re re\mbreak
   si2 la4 re

   %33
   re re re re
   re2 la'4 la
   dod, la' la re,

   %36
   re2 fad4 mi
   re mi re fad
   sol la la re

   %39
   re2 la4 la
   dod, re la' re\mbreak
   re2 la4 la

   %42
   dod, re la' dod,
   dod re si la
   la2 re4 fad

   %45
   fad re re dod
   re2 si
   r re

   %48
   r re
   re si\mbreak
   re2 re4 re

   %51
   sol2 sol4 sol
   sol2 sol4 sol
   sol sol sol sol

   %54
   sol2 sol,4 re'
   mi mi re re
   si2

}

Vbcn = \relative do {

   si'4 sol
   re'4. si8 dod4 la
   re re, si' sol
   do! si la sol

   %4
   re2 si'4 sol
   re'4. si8 dod4 la\mbreak
   re fad, sol la

   %7
   si sol la la,
   re2 re4 si
   la4. la'8 re,4 mi

   %10
   la la, re mi
   fa re mi mi,
   la2 la'4 fad!

   %13
   mi4. sol8 fad4 mi\mbreak
   re re' si sol
   do si la sol

   %16
   re2 mi4 do
   sol'4. mi8 fad4 re
   sol si, do re

   %19
   mi do re re,
   sol2\fermata sol4\p sol
   sol2 sol4 sol

   %22
   sol2 sol4 sol\mbreak
   sol sol sol sol
   sol2 si4 sol

   %25
   do la sol sol'
   re2 sol,4 sol
   sol2 sol4 sol

   %28
   sol2 sol4 sol
   sol sol sol sol
   sol2 si4 sol

   %31
   do la re re,\mbreak
   sol2 re'4 re
   re re re re

   %34
   re2 re4 re
   re re re re
   re2 re'4 dod

   %37
   re la si la
   sol fad re re
   re2 re4 re\mbreak

   %40
   re re re re
   re2 re4 re
   re re la' la

   %43
   la si sol la
   re,2 re4 re
   re re re re

   %46
   re2 r
   re r
   re r

   %49
   R1
   re2 sol,4 sol\mbreak
   sol2 sol4 sol

   %52
   sol2 sol4 sol
   sol sol sol sol
   sol2 si4 sol

   %55
   do la re re,
   sol2

}


Vbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 2/2
   \key sol\major
   \tempo 1 = 47
   \partial 2 s2
   s1*7
   s2 \bar":..:"\break s
   s1*11
   s2 \bar":..:"\break s
   s1*11
   s2 \bar":..:"\break s
   s1*23
   s2 \bar":|."
   \mark\markup\smaller \center-column{"Da""Capo"}

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
}

VIvlIn = \relative do'' {

   sol'4 si,2\tr
   sol'4 do,2\tr
   sol'4 fad8 mi re do

   %4
   si4 sol8(la) si dod
   re4 fad,2\tr
   re'4 mi,2\tr

   %7
   fad4 mi' dod\mbreak
   re2.
   la'4 fad2\tr

   %10
   sol4 mi2\tr
   la4 fad8 sol la fad
   sol4 mi8 fad sol  la

   %13
   si4 do,2\tr
   la'4 si,2\tr
   sol'4 la, fad'

   %16
   sol2. sol\fermata

}

VIvlIIn = \relative do'' {

   si4 sol sol
   sol sol sol
   sol la fad

   %4
   sol re sol
   la re, re
   re re re

   %7
   re sol mi
   fad2.\mbreak
   mi'4 la, si

   %10
   si sol si
   mi la, si
   si sol si

   %13
   mi, mi la
   re, re sol
   sol mi la

   %16
   si2. si\fermata

}

VIvlan = \relative do' {

   re4 re re
   do mi mi
   re la re

   %4
   re si sol
   re' la la
   si si si

   %7
   la si la
   la2.
   la'4 la fad

   %10
   mi si sol'
   la la fad
   mi si mi

   %13
   mi la, do
   re sol, si
   re mi re

   %16
   re2. re\fermata

}

VIbcn = \relative do {

   sol'4 sol, sol'
   mi mi, mi'
   si do re

   %4
   sol,2 sol'4
   fad re fad
   si, sol si

   %7
   la sol la
   re re, re'\mbreak
   dod' re red

   %10
   mi mi, mi'
   dod re red
   mi mi, mi'

   %13
   sold, la la,
   fad' sol! sol,
   si do re

   %16
   sol sol, sol' sol2.\fermopz

}


VIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 3/4
   \key sol\major
   \tempo 2 = 68
   s2.*8
   \bar ":..:" \break
   \repeat volta 2{
   s2.*7
   }
   \alternative {{s2.}{s}}
   \bar "|."


}

VIvlI = {
   \VIglobal
   \clef violin
   %\notypeset
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
}

VIIvlIn = \relative do'' {

   si4 sol la\tr
   si r r
   re si do

   %4
   si8 do re do si la
   si4 sol la\tr
   si r r

   %7
   re si do\mbreak
   si4\tr r r
   si8 sol si re si sol

   %10
   la re, la' re, la' re,
   si' sol si re si sol
   la re, la' re, la' re,

   %13
   re'2.~
   re~
   re4 fad8(mi) re(dod)

   %16
   re(mi) fad(sol) la(fad)\mbreak
   sol4 sol fad
   mi r r

   %19
   fad fad mi
   re r r
   mi mi re

   %22
   do do si
   do do si
   la la8 si do la

   %25
   si4 sol la\tr
   si r r\mbreak
   re si do

   %28
   si8 do re do si la
   si4 sol la\tr
   si r r

   %31
   sol' re8 do si la
   sol2. sol

}

VIIvlIIn = \relative do'' {

   sol4 si, re
   sol8 re si re sol la
   si4 sol la

   %4
   sol8 la si la sol re
   sol4 si, re
   sol8 re si re sol la

   %7
   si4 sol la
   sol8 re sol re si sol
   sol'4 sol sol

   %10
   re r r
   sol sol sol
   re r r

   %13
   la'8 re, la' re, la' re,
   si' re, si' re, si' re,
   la'4 la la\mbreak

   %16
   la r r
   si8(la) si(do) la(si)
   do(si) do(re) do(si)

   %19
   la(sol) la(si) sol(la)
   si(la) si(do) si(la)
   sol(fad) sol(la) fad(sol)

   %22
   la(sol) la(si) sol(si)\mbreak
   la sol la si sol4
   re r r

   %25
   sol si, re
   sol8 re si re sol la
   si4 sol la

   %28
   sol8 la si la sol re
   sol4 si, re
   sol8 re si re sol la\mbreak

   %31
   si4 sol re
   si8 re si sol si re si4 r r

}

VIIvlan = \relative do' {

   sol'4 si, re
   sol r r
   si sol la

   %4
   sol r r
   sol si, re
   sol r r

   %7
   si sol la
   sol r r
   sol sol sol

   %10
   fad r r
   sol sol sol
   fad r r

   %13
   fad fad fad
   sol sol sol
   fad re la

   %16
   re r r
   si' si si
   do r r\mbreak

   %19
   la la la
   si r r
   sol sol sol

   %22
   la la sol
   fad fad sol
   re r r

   %25
   sol si, re
   sol r r
   si sol la

   %28
   sol r r\mbreak
   sol si, re
   sol r r

   %31
   si sol re
   sol, r r sol r r

}

VIIbcn = \relative do {

   R2.*8
   R2.*24
   R2.

}


VIIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 3/4
   \key sol\major
   \tempo 2 = 68
   s2.*8
   \bar ":..:"\break
      \repeat volta 2 {s2.*23}
      \alternative {{s2.}{s}}
   \bar "|."
   \mark\markup\tiny\center-column {"D.C.""Menuet 1"}

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

\markup \huge {[1.] Ouverture la Querelleuse}

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

\markup \huge {[2.] Rondeau}

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

        indent = 1\cm

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

\markup \huge {[3.] Les combattans}

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

        indent = 1\cm

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

\markup \huge {[4.] Passetemps}

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

        indent = 1\cm

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

\markup \huge {[5.] Badinerie}

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

        indent = 1\cm

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

\markup \huge {[6.] Menuet 1.}

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

        indent = 1\cm

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

\markup \huge {[7.] Menuet 2.}

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

        indent = 1\cm

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