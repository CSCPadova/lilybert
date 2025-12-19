\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = ^\markup\italic"tasto solo"

tr = \trill

ten = ^\markup \italic "ten"

dolce = _\markup\italic "doux"

arco = _\markup \italic "Con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "Pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { seul }

tu = ^\markup \italic "tous"

pad = \once \override TextScript.padding = #1.5

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



mbreak = { }


Iglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}


IvlIn = \relative do'' {

  si4. dod8 dod4.\prallprall si16 dod
  re2. r16 re mi fad
  sol4. fad8 sol4. la8

  %4
  fad2 sol4. re8
  mi2. fad8 sol
  re2~re8 re mi si

  %7
  do1~
  do2 r8 re do re
  si4. la8 si4. do8\mbreak

  %10
  re4. mi8 re4. mi8
  re4 mi8 re mi re do si
  la4.\prall la8 la4 si

  %13
  do do8 re mi mi re do
  si4. do8 re4 sol
  mi mi la4. la8

  %16
  fad4 re sol2~
  sol fad4. fad8\mbreak
  fad4 mi mi4.\prall re8

  %19
  re1 re
  fad4. fad8 sol4
  mi4.\prall re8 mi4

  %22
  fad fad4.\prall mi8
  red2 red4
  mi8(fad) sol(fad) mi(re)

  %25
  dod4. red8 mi4
  mi4. fad?8 red4
  mi2.\mbreak

  %28
  si4. la8 si4
  do4. re8 do si
  la4.\prall sol8 la4

  %31
  si2 si4
  R2.
  sol'4 re4.\prall re8

  %34
  mi4. fa?8 sol4
  la4 re,4.\prall do8
  do2.~

  %37
  do
  do4. do8 re4\mbreak
  mi4. fa8 sol mi

  %40
  fa4 fa4. sol8
  mi2\prall mi4
  la mi4.\prall mi8

  %43
  fa4 dod4. dod8
  re4 re8 dod re mi
  dod2 dod4

  %46
  la' mi4.\prall mi8
  fa2.
  mi4. fad8 sol4\mbreak

  %49
  fad2.~
  fad4. sol8 la4
  re, sol4. sol8

  %52
  sol4 fa?4. sol8
  mi4 la4. la8
  fad4. mi8 fad4

  %55
  sol4. la8 si4
  la8 sol fad4. sol8
  sol2.

  %58
  sol4 re4.\prall re8\mbreak
  mi4. re8 do re
  mi4 do4.\prall si8

  %61
  la2.
  re
  re4 la4.\prall la8

  %64
  si4 fad4. fad8
  sol4 la8 si do re
  si4. do8 re4

  %67
  mi la,4.\prall sol8
  sol2.

}

IvlIIn = \relative do'' {

  R1*2
  si4. dod8 dod4.\prallprall si16 dod
  re4 la si re

  %5
  sol,2 do~
  do si~
  si la8 sol la mi

  %8
  fad2. fad4
  sol4. fad8 sol4. la8\mbreak
  si4. do8 si4. do8

  %11
  si4 do8 si do si la sol
  fad4. fad8 fad4 sold
  la8 la sol? fad mi4 fad

  %14
  sol4. la8 si do si la
  sol4 sol do8 re do si
  la4 la si mi

  %17
  dod la re2~\mbreak
  re4 mi dod4. re8
  re1 re

  %20
  la4. la8 si4
  sol4.\prall fad8 sol4
  la la4.\prall sol8

  %23
  fad2 fad4
  sol8(la) si(la) sol(fad)
  mi4. fad8 sol4

  %26
  fad4. sold8 la4
  sold2.\mbreak
  sold4. fad8 sold4

  %29
  la2 mi4
  fad4. mi8 fad4
  sol2 sol4

  %32
  sol' re4.\prall re8
  mi4 si4. si8
  do2.
  do8 re si4.\prall do8

  %36
  do2.
  do4 sol4. sol8
  la4. la8 si4\mbreak

  %39
  do dod4. dod8
  re4 re8 dod re mi
  dod2 dod4

  %42
  la2.~
  la
  la8 sib sol4.\prall la8

  %45
  la4 mi'4. mi8
  fa4 dod4. dod8
  re2.

  %48
  re8 mi dod4. re8\mbreak
  re2.
  re4 la4.\prall la8

  %51
  si4. la8 si4
  do re4. re8
  sol,4 do4. do8

  %54
  do4. si8 la re
  si4. do8 re4
  do8\prall si la4.\prall sol8

  %57
  sol2.~
  sol~
  sol4. sol8 la si

  %60
  do4 la4.\prall sol8
  fad2.
  sol4 la si

  %63
  fad2.
  re'4 la4. la8
  si4 fad4. fad8

  %66
  sol2.
  sol8 la fad4. sol8
  sol2.

}

Ivlan = \relative do {

  sol'1
  fad2 sol4 fad
  mi1

  %4
  re4. do8 si4 sol
  do4. si8 la4. sol8
  fad2 sold

  %7
  la1
  re,4 re'8 do si4 la
  sol1\mbreak

  %10
  sol
  sol'2 do,
  re4. re8 do4 si

  %13
  la la8 si do4 re
  mi8 mi re do si4 si
  do8 re do si la4 la

  %16
  re8 do si la sol2
  la si4 fad\mbreak
  sol2 la

  %19
  re4 re'8 do si4 la re,,1
  re'4. do8 si4
  do2 si4

  %22
  la2.
  si4 si'8 la sol fad
  mi2 mi4

  %25
  la4. la8 sol4
  la4 si si,
  mi2.\mbreak

  %28
  mi
  la,
  re

  %31
  sol,
  sol
  sol

  %34
  do4. re8 mi4
  fa? sol2
  do4 sol4. sol8

  %37
  la4 mi4. mi8
  fa2.\mbreak
  mi

  %40
  re
  la'4 mi4. mi8
  fa4 dod4. dod8

  %43
  re4 la4. la8
  sib2.
  la

  %46
  la
  re4. mi8 fa4
  sol la2\mbreak

  %49
  re,4 la'4. la8
  si4 fad4. fad8
  sol2 sol4

  %52
  la si2
  do2 do,4
  re2.

  %55
  mi4 re8 do si4
  do re2
  sol4 re4. re8

  %58
  mi4 si4. si8\mbreak
  do2.
  do4 do4. do8

  %61
  re4 la4. la8
  si4 fad sol
  re2.

  %64
  re
  re
  sol4. la8 si4

  %67
  do4 re re,
  sol2.

}

Ibcn = \relative do {

  sol'1
  fad2 sol4 fad
  mi1

  %4
  re4. do8 si4 sol
  do4. si8 la4. sol8
  fad2 sold

  %7
  la1
  re,4 re'8 do si4 la
  sol1\mbreak

  %10
  sol
  sol'2 do,
  re4. re8 do4 si

  %13
  la la8 si do4 re
  mi8 mi re do si4 si
  do8 re do si la4 la

  %16
  re8 do si la sol2
  la si4 fad\mbreak
  sol2 la

  %19
  re4 re'8 do si4 la re,,1
  re'4. do8 si4
  do2 si4

  %22
  la2.
  si4 si'8 la sol fad
  mi2 mi4

  %25
  la4. la8 sol4
  la4 si si,
  mi2.\mbreak

  %28
  mi
  la,
  re

  %31
  sol,
  sol
  sol

  %34
  do4. re8 mi4
  fa? sol2
  do4 sol4. sol8

  %37
  la4 mi4. mi8
  fa2.\mbreak
  mi

  %40
  re
  la'4 mi4. mi8
  fa4 dod4. dod8

  %43
  re4 la4. la8
  sib2.
  la

  %46
  la
  re4. mi8 fa4
  sol la2\mbreak

  %49
  re,4 la'4. la8
  si4 fad4. fad8
  sol2 sol4

  %52
  la si2
  do2 do,4
  re2.

  %55
  mi4 re8 do si4
  do re2
  sol4 re4. re8

  %58
  mi4 si4. si8\mbreak
  do2.
  do4 do4. do8

  %61
  re4 la4. la8
  si4 fad sol
  re2.

  %64
  re
  re
  sol4. la8 si4

  %67
  do4 re re,
  sol2.

}



Ibfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  <5 3>2 <6 4+ 2>
  s1
  <7>2 <6+>
  <_+>1
  s
  <6 5->1
  <10- 9>2 <8>
  <7 _+>1
  s1*2
  s2
  <5>4 <6>
  <_+>2 <4+>4 <6+>
  s2 s4 <6 _+>
  <5>1
  s
  s2 <5>4 <6>
  <7 _+>2 <5>
  <7 5>4 <6> <_+>2
  <_+>2 <6>4 <6> <_+>1
  <_+>2.
  s
  <6+>2.
  <_+>4 <_+>2
  <5>2.
  <_+>2 <6>4
  s <4> <3>
  <_+>2.
  <_+>
  <_->
  <_+>
  s
  s
  <6 4>4 <5 3>2
  s2.
  s4 <3>2
  s4 <6 4>2
  s2.
  <5>2 <6>4
  <6->4 <6+>2
  <_->2.
  <_+>4 <6+>2
  s2.
  <_->4 <_+>2
  <7>4 <6>2
  <_+>2.
  <6 4>4 <5 3+>2
  <_->2.
  <6 5>4 <_+>2
  <_+>4 <6 4>2
  <5>2.
  s
  s
  <5>4 <6>2
  <7 _+>2.
  <5>
  <6>4 <_+>2
  s4 <6 4>2
  <6>2.
  s
  <5>4 <6>2
  <_+>4 <6+>2
  <6>2.
  <_+>
  <6 4>4 <5 3+>2
  <6 4>4 <5 3+>2

}


forma = {

  \time 2/2
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 67
  \key do\major
  \repeat volta 2 {
  s1*18 }
  \alternative {{s1}{s}}\break
  \mark \markup\italic\smaller"  tendrement"
  \time 3/4
  \tempo 2. = 50
  \set Score.currentBarNumber = #20
  s2.*49
  \bar"|."

}


IvlI = {
  \Iglobal
  \notypeset
  %\clef french
  <<\IvlIn \forma>>

}

IvlII = {
  \Iglobal
  %\clef french
  <<\IvlIIn \forma>>

}


Ivla = {
  \Iglobal
  \clef bass
  <<\Ivlan \forma>>

}


Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma\Ibfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}

IIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}


IIvlIn = \relative do'' {

  si2 la4. re8
  si4. la8 sol4. sol8
  re'4 re sol4. fad8

  %4
  mi4 mi si4.\prall do8
  re4 mi8 re do4.\prall si8
  do4 la mi'4. mi8

  %7
  fa?4. re8 sol fa mi re
  dod4 la la'4. la8\mbreak
  re,4 sol mi la

  %10
  fad2 re fad re
  la'4 la8 sol la4 la si8 si la sol
  fad4 fad8 mi fad4 fad mi fad8 sol

  %13
  fad4 fad8 sol la4 la sol8 fad sol mi\mbreak
  fad4 fad8 sol la la sol fad mi4.\prall re8
  re2 re re

  %16
  re re4 re re4.\prall do8
  si4 sol sol' sol sol4.\prall fa?8
  mi [re mi fa mi fa mi fa mi re mi fa]\mbreak

  %19
  mi4 do do' si la4.\prall sol8
  fad[mi fad sol fad sol fad sol fad mi fad sol]
  fad4 re mi la la4.\prall sol8

  %22
  sol1.

}

IIvlIIn = \relative do'' {

  sol2 sol4.\prall fad8
  sol4. fad8 mi fad sol la
  si4. do8 re do si la

  %4
  sol4 do sol4. la8
  si4 la2 sold4
  la4. si8 do4 dod

  %7
  re la sib8 la sol fa?
  mi4 dod re re'8 do\mbreak
  si4 mi dod4. re8

  %10
  re4 la sol fad re'2 fad,
  fad'4 fad8 mi re4 re re re8 dod
  re4 re8 dod re4 si dod si8 dod

  %13
  re4 re8 dod re4 re mi8 re mi dod\mbreak
  re4 re8 dod re fad mi re dod4. re8
  re2 si la

  %16
  si8[la si do si si la sol fad sol la fad]
  sol2 si re
  sol, sol4 sol sol4. sol8\mbreak

  %19
  sol4 mi mi' re do4.\prall si8
  la[sol la si la si la si la sol la si]
  la4 fad si la8 sol fad4. sol8

  %22
  sol1.

}

IIvlan = \relative do {

  sol'2 re4. re8
  mi2 r8 mi re do
  si2. sol4

  %4
  do4. re8 mi4 mi
  si do8 re mi4 mi,
  la2. la'4

  %7
  re, do sib4. sol8
  la4 la'8 sol fad4. fad8\mbreak
  sol4 mi la la,

  %10
  re re'8 do si4 la re,1
  re4 re8 mi fad4 fad sol8 sol fad mi
  re4 re8 la re4 re la' la8 la

  %13
  re,4 re8 mi fad4 fad sol la\mbreak
  re,4 re8 mi fad4 sol la la,
  re2 sol, fad

  %16
  sol sol' re
  sol2. sol4 si,4. si8
  do2 do do\mbreak

  %19
  do do4 do do do
  re2 re re
  re4. do8 si4 do re re,

  %22
  sol1.

}

IIbcn = \relative do {

  sol'2 re4. re8
  mi2 r8 mi re do
  si2. sol4

  %4
  do4. re8 mi4 mi
  si do8 re mi2
  la,2. la'4

  %7
  re, do sib4. sol8
  la4 la'8 sol fad4. fad8\mbreak
  sol4 mi la la,

  %10
  re re'8 do si4 la re,1
  re4 re8 mi fad4 fad sol8 sol fad mi
  re4 re8 la re4 re la' la8 la

  %13
  re,4 re8 mi fad4 fad sol la\mbreak
  re,4 re8 mi fad4 sol la la,
  re2 sol, fad

  %16
  sol sol' re
  sol2. sol4 si,4. si8
  do2 do do\mbreak

  %19
  do do4 do do do
  re2 re re
  re4. do8 si4 do re re,

  %22
  sol1.

}



IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <4>4. <3>8
  <5>1
  <6>
  s2 <5>4 <6>
  <6+> <6> <4> <3>
  <_->2. <_+>4
  <_-> <6> <6>2
  <_+>1
  s4 <5> <_+>2
  <_+> <6>4 <6+> s1
  <_+>1.
  <_+>4 s8 <_+> <_+>2 <_+>
  s1 <6>4 <_+>
  s1 <_+>2
  <_+>1.
  s1 <_+>2
  s1.*2
  s1 <6>2
  <_+>1.
  s1 <_+>2

}


forma = {

  \time 2/2
  \once \override Staff.TimeSignature.style = #'single-digit
  \tempo 1 = 70
  \key do\major
  \repeat volta 2 {s1*9}
  \alternative {{s1}{s}}\break
  \mark\markup\italic\smaller"reprise"
  \bar".|:"
  \time 3/2
  \tempo 1 = 75
  \set Score.currentBarNumber = #11
  s1.*12
  \bar":|."

}


IIvlI = {
  \IIglobal
  \notypeset
  %\clef french
  <<\IIvlIn \forma>>

}

IIvlII = {
  \IIglobal
  %\clef french
  <<\IIvlIIn \forma>>

}


IIvla = {
  \IIglobal
  \clef bass
  <<\IIvlan \forma>>

}


IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma\IIbfn>>
  \typeset

}

IIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}


IIIvlIn = \relative do'' {

  fa4. fa8 la,16[sol fa sol la sib la sib]
  do sib do sol la do re mi fa sol fa mi re re mi fa
  sol la sol fa mi8. do16 sol'8. sol16 la8 la16 sol

  %4
  fa8. la16 re,8. fa16 sib,4 r16 fa' sol la\mbreak
  sib4 r16 do sib la sol4\prall r16 mi fa sol
  la [sib la sol fa sol la sol fa sol fa mi re mi re do]

  %7
  si sol la si do re mi fa sol8. fa16 fa8.\prall mi16
  mi1 mi
  sol8. sol16 mi8. mi16 do8. do16 fa8. fa16

  %10
  re8. [re16 sib'8. sib16 sol8. sol16 la8. la16]
  fad4 sol mi la
  re,8.[re16 mi8. mi16 fad8. sol16 sol8.\prall fad16]

  %13
  sol4 r16 sol fa? mi re do re mi fa  mi fa sol\mbreak
  mi4 r16 do' sib la sol fa sol la sib la sib do
  la[sib do sib la sib la sol fa sol la sol fa sol fa mib]

  %16
  re mib fa mib re mib re do sib4 r16 fa' sol la
  sib[do sib la sol sol la sib do do, re mi? fa sol fa sol]
  la4 r16 sol fa mib\mbreak re8. sol16 sol8.\prall fa16

  %19
  fa1

}

IIIvlIIn = \relative do'' {

  la16 sol la sib la sib la sol fa sol la sib do8 fa,16 sol
  la sol la sib do8. do16 do16 la sib do fa, fa sol la
  sib do sib la sol8 sol'16 fa mi fa mi re do4~

  %4
  do8 do fa,8. fa16 sol8 re'16 do sib la sib do\mbreak
  re re mi fa sol la sol fa mi4 r16 do re mi
  fa sol fa sol la sol fa mi re do re mi fa sol fa mi

  %7
  re si do re mi fa mi re do8. re16 si8. do16
  do4. do8 mi,16 re do re mi mi fa sol do1\mbreak
  mi4 r do8. do16 la8. la16

  %10
  fa8. fa16 sol8 re'16 do sib8. sib16 do8. do16
  la4 re sol, do
  sib8. la16 sol8. sol16 la8. sib16 la8 re16 do

  %13
  si4 re sol,8. la16 si do re si\mbreak
  do8. re16 mi8 fa16 sol do,8. re16 mi fa sol mi
  fa4 do re8 la la8. la16

  %16
  sib16 do re do sib do sib la sol sib do re mib8 do
  re sol mi?16 mi fa sol la8 la, sib do
  do16 mib re do sib8 la\mbreak sib8 re do8. sib16

  %19
  la1

}

IIIvlan = \relative do {

  fa,2 fa'4. fa8
  la,16 sib la sol fa sol fa sol la fa sol la sib do sib la
  sol sol la sib do si do re mi8. do16 fa8. sol16

  %4
  la8. [la16 sib?8. re16 sol,8. sib16 re,8. fa16]\mbreak
  sib,8. sib'16 sol sol la sib do sib do re do sib la sol
  fa2 fa4. fa8

  %7
  fa4 mi4. fa8 sol sol,
  do1 do\mbreak
  do4 do'8. do16 la8. la16 fa8. fa16

  %10
  sib8. [sib16 sol8. sol16 mib'8. mib16 do8. do16]
  re4 si do la
  sib?8. sib16 do8. sib16 la8. sol16 re'8. re,16

  %13
  sol4. la8 si4 sol\mbreak
  do4 do,8 re mi4 do
  fa16[sol la sol fa sol fa mib re mib fa mib re mib re do]

  %16
  sib4 r16 sib do re mib fa mib re do8 fa
  sib,16[sol la sib do re do sib la la sib do re mi? re mi]
  fa sol fa mib re mib re do\mbreak sib8. sib16 do8. do16

  %19
  fa,1

}

IIIbcn = \relative do {

  fa,2 fa'4. fa8
  la,16 sib la sol fa sol fa sol la fa sol la sib do sib la
  sol sol la sib do si do re mi8. do16 fa8. sol16

  %4
  la8. [la16 sib?8. re16 sol,8. sib16 re,8. fa16]\mbreak
  sib,8. sib'16 sol sol la sib do sib do re do sib la sol
  fa2 fa4. fa8

  %7
  fa4 mi4. fa8 sol sol,
  do1 do\mbreak
  do4 do'8. do16 la8. la16 fa8. fa16

  %10
  sib8. [sib16 sol8. sol16 mib'8. mib16 do8. do16]
  re4 si do la
  sib?8. sib16 do8. sib16 la8. sol16 re'8. re,16

  %13
  sol4. la8 si4 sol\mbreak
  do4 do,8 re mi4 do
  fa16[sol la sol fa sol fa mib re mib fa mib re mib re do]

  %16
  sib4 r16 sib do re mib fa mib re do8 fa
  sib,16[sol la sib do re do sib la la sib do re mi? re mi]
  fa sol fa mib re mib re do\mbreak sib8. sib16 do8. do16

  %19
  fa,1

}



IIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1
  <6>
  <_->
  <6>2 s4 <6>
  s1
  s
  <4+>2 s4 <4>8 <3>
  s1 s
  s
  s2 s4 <6>
  <_+>2 <_+>4 <6+>
  <6> <_+> <6+> <4>8. <3>16
  <_+>1
  s
  s
  s2 s4 <_->
  s1
  s4 <6> s <4>8. <3>16

}


forma = {

  \time 2/2
  \once \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 70
  \key fa\major
  \repeat volta 2 {s1*7}
  \alternative {{s1}{s}}\break
  \set Score.currentBarNumber = #9
  \mark\markup\italic\smaller "reprise"
  s1*11
  \bar"|."

}


IIIvlI = {
  \IIIglobal
  \notypeset
  %\clef french
  <<\IIIvlIn \forma>>

}

IIIvlII = {
  \IIIglobal
  %\clef french
  <<\IIIvlIIn \forma>>

}


IIIvla = {
  \IIIglobal
  \clef bass
  <<\IIIvlan \forma>>

}


IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma\IIIbfn>>
  \typeset

}

IVglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}


IVvlIn = \relative do'' {

  fa4 mi re
  la' mi sol
  fa sol8 fa mi re

  %4
  dod4. si8 la4
  re mi8 re dod si
  dod4 re mi

  %7
  fa8 sol fa mi fa re
  mi2.
  mi4^\markup\italic"fl[ûtes] seules" mi8 fa sol mi

  %10
  fa4 sol la
  sol8 la sol la sol fa
  mi fa mi re dod4

  %13
  re4.\tu mi8 fa4
  mi8 fa mi re dod4\mbreak
  re8 dod re mi fa sol

  %16
  mi2 la,4
  mi'^\markup\italic"fl seul" mi8 fa sol mi
  fa4 sol la

  %19
  sol8 la sol la sol fa
  mi fa mi re dod4
  la'2.\tu

  %22
  re,4. mi8 fa4
  sol8 fa mi re mi dod
  re2.

  %25
  la'2.
  re,4. mi8 fa4
  sol8 fa mi re mi dod

  %28
  re2.

}

IVvlIIn = \relative do'' {

  la4 la re
  dod4. si8 dod4
  re8 do? sib la sol fa
  mi2 mi4

  %5
  fa sol4. fa8
  mi2 la4
  la re8 dod re si?

  %8
  dod2.
  dod4^\markup\italic"fl[ûtes] seules" dod8 re mi dod
  re4 do?4. re8

  %11
  si4 mi8 fa mi re
  dod4 la2
  si4. dod8 re4

  %14
  dod8 re dod si la4\mbreak
  si8 la si dod re mi
  dod2 dod4

  %17
  dod^\markup\italic"fl seul" dod8 re mi dod
  re4 do?4. re8
  si4 mi8 fa mi re

  %20
  dod4 la2
  fa'8\tu sol fa mi re do?
  si4. dod8 re4

  %23
  re8 mi dod4. mi8
  re2.
  fa8 sol fa mi re do

  %26
  si4. dod8 re4
  re8 mi dod4. mi8
  re2

}

IVvlan = \relative do {

  re'4 do sib
  la2.
  re4 sol,2

  %4
  la8 sib la sol fa mi
  re4 sol2
  la4 si? dod

  %7
  re re,2
  la'2.
  la,

  %10
  re4 mi fa
  sol2.
  la8 sol  la sib la sol

  %13
  fa4. mi8 re4
  la'2.\mbreak
  re,

  %16
  la
  la'
  re,4 mi fa

  %19
  sol2.
  la8 sol la sib la sol
  fa2 fa4

  %22
  sol2 re4
  sol la la,
  re2.

  %25
  fa2 fa4
  sol2 re4
  sol la la,

  %28
  re2.

}

IVbcn = \relative do {

  re'4 do sib
  la2.
  re4 sol,2

  %4
  la8 sib la sol fa mi
  re4 sol2
  la4 si? dod

  %7
  re re,2
  la'2.
  la,

  %10
  re4 mi fa
  sol2.
  la8 sol  la sib la sol

  %13
  fa4. mi8 re4
  la'2.\mbreak
  re,

  %16
  la
  la'
  re,4 mi fa

  %19
  sol2.
  la8 sol la sib la sol
  fa2 fa4

  %22
  sol2 re4
  sol la la,
  re2.

  %25
  fa2 fa4
  sol2 re4
  sol la la,

  %28
  re2.

}



IVbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2.
  <_+>
  s4 <_->2
  <_+>2.
  s4 <6 _->2
  s2.
  <_->
  s2.*3
  <_+ 5>4 <_- 6>2
  <_+>2.
  <6 4+>
  s
  <6>
  <_+>
  <_+>
  s<_+ 5>4 <_- 6>2
  <_+>2.s
  s
  s4 <4> <3>
  <_->2.
  s
  s
  s4 <4> <3> <_->2.



}


forma = {

  \time 3/4
  \once \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 67
  \key do\major
  s2.*8
  \bar":..:"\break
  s2.*16
  \bar":|."
  s2.*4
  \bar"|."

}


IVvlI = {
  \IVglobal
  \notypeset
  %\clef french
  <<\IVvlIn \forma>>

}

IVvlII = {
  \IVglobal
  %\clef french
  <<\IVvlIIn \forma>>

}


IVvla = {
  \IVglobal
  \clef bass
  <<\IVvlan \forma>>

}


IVbc = {
  \IVglobal
  \clef bass
  <<\IVbcn \forma\IVbfn>>
  \typeset

}

Vglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}


VvlIn = \relative do'' {

  si4\tu do4. re8
  mi4 mi2
  re4 re4.\prall do8

  %4
  si4 si2\mbreak
  mi4 mi4. mi8
  fad4 fad2

  %7
  sol8 la fad4. sol8
  sol2.
  si4^\markup\italic"flu[te] seul" sol4. si8

  %10
  la4 la2
  si4 sol4. la8
  fad4 fad2

  %13
  sol4 sol4. sol8
  sol4 mi2\mbreak
  fad8 sol mi4.\prall re8

  %16
  re2.
  si4\tu do4. re8
  mi4 mi2

  %19
  re4 re4.\prall do8
  si4 si2\mbreak
  mi4 mi4. mi8

  %22
  fad4 fad2
  sol8 la fad4. sol8
  sol2.

}

VvlIIn = \relative do'' {

  sol4\tu la4. si8
  do4 do2
  si4 si4. la8
  sol4 sol2
  do4 do4. do8
  do4. si8 la4
  si8 do la4.\prall sol8
  sol2.
  si4^\markup\italic"flu[te] seul" si4. dod8
  re4 re2
  re8 mi dod4. re8
  re4 re2
  re4 re4. mi8
  dod4 dod2\mbreak
  re8 mi dod4. re8
  re2 fa,4
  sol4 la4. si8
  do4 do2
  si4 si4. la8
  sol4 sol2
  do4 do4. do8
  do4. si8 la4
  si8 do la4.\prall sol8
  sol2.

}

Vvlan = \relative do {

  sol'4 mi4. re8
  do4 do2
  re4 re4. re8

  %4
  mi4 mi2\mbreak
  do4 do4. do8
  re4 re2

  %7
  sol8 do, re4. re8
  sol,2.
  sol'4 sol4. sol8

  %10
  fad4 fad2
  sol4 mi2
  si'4 si2

  %13
  mi,4 mi4. mi8
  la4 la2\mbreak
  re,8 sol, la2

  %16
  re2.
  sol4 mi4. re8
  do4 do2

  %19
  re4 re4. re8
  mi4 mi2\mbreak
  do4 do4. do8

  %22
  re4 re2
  sol8 do, re4. re8
  sol,2.

}

Vbcn = \relative do {

  sol'4 mi4. re8
  do4 do2
  re4 re4. re8

  %4
  mi4 mi2\mbreak
  do4 do4. do8
  re4 re2

  %7
  sol8 do, re4. re8
  sol,2.
  sol'4 sol4. sol8

  %10
  fad4 fa2
  sol4 mi2
  si'4 si2

  %13
  mi,4 mi4. mi8
  la4 la2\mbreak
  re,8 sol, la2

  %16
  re2.
  sol4 mi4. re8
  do4 do2

  %19
  re4 re4. re8
  mi4 mi2\mbreak
  do4 do4. do8

  %22
  re4 re2
  sol8 do, re4. re8
  sol,2.

}



Vbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4 <6 4>2
  s2.
  <6 _+>
  <5>
  <5>4 <6>2
  <7 _+>2.
  s4 <_+>2
  s2.*3
  s4 <6+>2
  <5 _->2.
  <5 _->
  <_+>
  <_+>4 <_+>2
  <_+>2.
  s
  s
  <6 _+>
  <5>
  <5>4 <6>2
  <7 _+>2.
  s4 <_+>2

}


forma = {

  \time 3/4
  \once \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 78
  \key do\major
  s2.*16
  \bar":|."
  s2.*8
  \bar"|."

}


VvlI = {
  \Vglobal
  %\notypeset
  %\clef french
  <<\VvlIn \forma>>

}

VvlII = {
  \Vglobal
  %\clef french
  <<\VvlIIn \forma>>

}


Vvla = {
  \Vglobal
  \clef bass
  <<\Vvlan \forma>>

}


Vbc = {
  \Vglobal
  \clef bass
  <<\Vbcn \forma\Vbfn>>
  \typeset

}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}


\markup \huge {[1.] Ouverture pour les simphonistes de la Suite de la Musique}

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

      \new Staff <<
        \set Staff.midiInstrument = #"recorder"
        \set Staff.instrumentName = \markup \center-column{"Flûtes [I]""et Violes [I]"}
        \IvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \set Staff.instrumentName = \markup \center-column{"Flûtes [II]""et Violes [II]"}
        \IvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.instrumentName = \markup \center-column{"Viole"}
        \Ivla
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      }<<
        \set Staff.instrumentName = \markup \center-column{"Clavecin"}
        \set Staff.midiInstrument = #"harpsichord"
        \Ibc
      >>
    >>

  }

  \layout {

    indent = 1.8\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[2.] Air des guerriers}

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

      \new Staff <<
        \set Staff.midiInstrument = #"recorder"
        \IIvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIvla
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      }<<
        \set Staff.midiInstrument = #"harpsichord"
        \IIbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[3.] Entree de Furies}

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

      \new Staff <<
        \set Staff.midiInstrument = #"recorder"
        \IIIvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIIvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIIvla
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      }<<
        \set Staff.midiInstrument = #"harpsichord"
        \IIIbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[4.] Menuet pour les violes et flutes}

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

      \new Staff <<
        \set Staff.midiInstrument = #"recorder"
        \IVvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IVvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IVvla
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      }<<
        \set Staff.midiInstrument = #"harpsichord"
        \IVbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[5.] Sarabande de la Paix en rondeau}

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
    } <<

      \new Staff <<
        \set Staff.midiInstrument = #"recorder"
        \VvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \VvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \Vvla
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      }<<
        \set Staff.midiInstrument = #"harpsichord"
        \Vbc
      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
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
