\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

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
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}


Iobn = \relative do''{

   re8. mib16 fa8. fa16 sib8. la32 sol fa[mib re do sib8]
   sib8. sib16 fa'8. fa16 sol8. fa32 mib re do sib la sol8
   re'8. re16 mib8. mib16 do8. sib32 la sol fa mib re do8

   %4
   do'8. do16 re8. re16 do8. do16 re4
   do1\fermata
   R1*9

   %15
   r8 sib' sib sib sib sib sib sib
   la fa r sib la do fa,[do']
   re4 do sib8 la sol4\mbreak

   %18
   fa r8 fa16 sol la8 fa16 sol la fa sol la
   sib16 sib sib sib do, la' la la do, fa fa fa re fa fa fa
   sib,8 mib4 re8 do sib sib[la]\mbreak

   %21
   sib4 r8 sib16 do re8 sib16 do re do re mib
   fa fa fa fa la, re re re do8 mid fa sol16 la
   sib4. la8 sol fa fa[mi]\mbreak

   %24
   fa16 fa fa fa fa, fa' fa fa la, mib' mib mib mib, mib' mib mib
   fa, re' re re re, re' re re mib, do' do do do, do' do do
   re,8 sib''4 la sol fa8~\mbreak

   %27
   fa mib4 re do sib8
   la16 la' la la fad la la la la, la' la la la, la' la la
   re,8 sib sol4 r2

   %30
   R1\mbreak
   r8 sol' sol sol sol sol sol sol
   mib do r sol' mib sol do,[sol']

   %33
   lab4 sol fa8 mib re4
   do r8 mi16 fa sol8 mi16 fa sol mi fa sol\mbreak
   la4 r r2

   %36
   r8 fa fa fa fa fa fa fa
   re sib r fa' re fa sib,[fa']
   sol4 fa mib8 re do4

   %39
   sib16 sib' sib sib sib, sib' sib sib\mbreak do, la' la la la, la' la la
   sib, sol' sol sol sol, sol' sol sol la, fa' fa fa la, fa' fa fa
   sol, mib' mib mib mib, mib' mib mib fa, re' re re re, re' re re\mbreak

   %42
   mib, do' do do do, do' do do re, re' re re sib fa' fa fa
   la, fa' fa fa la, fa' fa fa sib, fa' fa fa sib, fa' fa fa\mbreak
   la, fa' fa fa la, fa' fa fa sib, sol' sol sol sib, sol' sol sol

   %45
   sib, sol' sol sol sib, sol' sol sol sib,2
   r2 r sib'
   sib1 lab2

   %48
   lab1.~
   lab2 sol1
   sol1.~

   %51
   sol2 fa1\mbreak
   fa1.
   mi2 mi mi

   %54
   mib! mib1
   re1.
   do\fermata

   %57
   fa4 sib2 la4~
   la sol2 \once\tieDashed fa4~
   fa mib2 re4

   %60
   mib re do2
   \parenthesize do4 re8\p mib fa4 mib8 re
   do4. re8 do4. re8

   %63
   do4. re8 do2
   fa4. fa8 sol mi fa[sol]
   mi2 fa\mbreak

   %66
   fa4\f fa fad4. fad8
   sol4 sol la re,
   sib'4. sib8 la4 sol8. la16

   %69
   fad2 sol
   re4\p mib8 fa sol4 fa8 mib\mbreak
   re4. re8 mib4 do

   %72
   fa4. fa8 sol fa mib re
   do4. sib8 la2
   fa'4\f sib2 la4~

   %75
   la sol2 fa4~
   fa mib2 re8 mib
   do2 sib

   %78
   do4\p re8 mib fa4  mib8 re
   mib4. re8 do4. re8
   do4. re8 do4 do\mbreak

   %81
   la'4.\f la8 sib do, re mib
   re do re[mib] re do re[mib]
   re4 do sib2

}


IvlIn =  \relative do'' {

   sib8. sib16 do8. do16 re8. do32 sib la[sol fa mib re8]
   fa8. sib16 re8. re16 mib8. re32 do sib[la sol fa mib8]\mbreak
   sib'8. sib16 do8. do16 la8. sol32 fa mib[re do sib la8]

   %4
   la'8. la16 sib8. sib16 la8. la16 sib4
   la1\fermata
   R1*6

   %12
   r8 fa' fa fa fa fa fa[fa]
   re sib r fa' re fa sib,[fa']
   sol4 fa mib8 re do4\mbreak

   %15
   sib8 sib16 do re8 re16 mib fa8 re16 mib fa mib fa sol
   do,8 sib16 do re8 re do4. fa8
   fa sol mi[fa] re16 mi fa4 mi8\mbreak

   %18
   fa16 do do do la do do do fa, do' do do la do do do
   re4 r8 do re la sib[la]
   sib4 la sol8 fa mib4

   %21
   re8 re16 mib fa8 sol16 la\mbreak sib8 sib sib sib
   do do r sib fa' do do[mi]
   fa4 mi re8 do sib4

   %24
   la re~re8 sol, do4~
   do8 fa, sib4~sib8[mib,] la do\mbreak
   sib re4 sib8 do sib4 la8

   %27
   sol do4 sib la sol8
   fad re' re re re8 re re[re]
   sib sol r re' sib re sol,[re']\mbreak

   %30
   mib4 re do8 sib la4
   sol16 re' re re si re re re sol, re' re re re, re' re re
   sol,8 do16 re mib8[do] do do do[do]

   %33
   do fa4 mib8 re do do[si]\mbreak
   do4 r r2
   r16 fa fa fa do fa fa fa la, fa' fa fa do fa fa fa

   %36
   re re re re fa, do' do do fa, re' re re fa, do' do do\mbreak
   sib8 re,16 mib fa8 sib sib sib sib[sib]~
   sib mib4 re8 do sib sib[la]

   %39
   sib4 sol'~sol8 do, fa4~
   fa8 sib, mib4~mib8 la, re4~\mbreak
   re8 sol, do4~do8 fa, sib4~

   %42
   sib8 mib, la la16 sol fa4 r8 re'
   do4 r8 do re4 r8 re
   do4 r8 do reb4 r8 reb\mbreak

   %45
   reb4 r8 reb reb2
   r2 r reb
   do1.

   %48
   do
   sib
   lab

   %51
   lab\mbreak
   sol
   sol2 sol sol

   %54
   do do1~
   do2 sib1
   la1.\fermata

   %57
   re4 re do4. re8
   sib4 sib la4. sib8
   sol4 sol fa sib

   %60
   do sib la2\mbreak
   la4 sib8\p do re4 do8 sib
   la4. sib8 la4. sib8

   %63
   la4. sib8 la2
   la4. la8 sib8 sol la[sib]\mbreak
   sol2 la

   %66
   re4\f re do8 sib la4
   re8 do sib do re4 la'~
   la sol8 fa mib4 sib8. do16\mbreak

   %69
   la2 sib
   si4\p do8  re mib4 re8 do
   do4 si do2

   %72
   sib!4 re2 do8 sib
   la4 sol fa2\mbreak
   re'4\f re do4. re8

   %75
   sib4 sib la4. sib8
   sol4 sol fa sib~
   sib la sib2

   %78
   la4\p sib8 do re4 do8 sib\mbreak
   do4. sib8 la4. sib8
   la4. sib8 la4 la

   %81
   do4.\f do8 re la sib do
   sib la sib do sib la sib do\mbreak
   sib4 la sib2

}

IvlIIn = \relative do'' {

  sib8. sib16 do8. do16 re8. do32 sib la[sol fa mib re8]
   fa8. sib16 re8. re16 mib8. re32 do sib[la sol fa mib8]\mbreak
   sib'8. sib16 do8. do16 la8. sol32 fa mib[re do sib la8]

   %4
   la'8. la16 sib8. sib16 la8. la16 sib4
   la1\fermata
   R1*6

   %12
   r8 fa' fa fa fa fa fa[fa]
   re sib r fa' re fa sib,[fa']
   sol4 fa mib8 re do4\mbreak

   %15
   sib8 sib16 do re8 re16 mib fa8 re16 mib fa mib fa sol
   do,8 sib16 do re8 re do4. fa8
   fa sol mi[fa] re16 mi fa4 mi8\mbreak

   %18
   fa16 do do do la do do do fa, do' do do la do do do
   re4 r8 do re la sib[la]
   sib4 la sol8 fa mib4

   %21
   re8 re16 mib fa8 sol16 la\mbreak sib8 sib sib sib
   do do r sib fa' do do[mi]
   fa4 mi re8 do sib4

   %24
   la re~re8 sol, do4~
   do8 fa, sib4~sib8[mib,] la do\mbreak
   sib re4 sib8 do sib4 la8

   %27
   sol do4 sib la sol8
   fad re' re re re8 re re[re]
   sib sol r re' sib \parenthesize re sol,[re']\mbreak

   %30
   mib4 re do8 sib la4
   sol16 re' re re si re re re sol, re' re re re, re' re re
   sol,8 do16 re mib8[do] do do do[do]

   %33
   do fa4 mib8 re do do[si]\mbreak
   do4 r r2
   r16 fa fa fa do fa fa fa la, fa' fa fa do fa fa fa

   %36
   re re re re fa, do' do do fa, re' re re fa, do' do do\mbreak
   sib8 re,16 mib fa8 sib sib sib sib[sib]~
   sib mib4 re8 do sib sib[la]

   %39
   sib4 sol'~sol8 do, fa4~
   fa8 sib, mib4~mib8 la, re4~\mbreak
   re8 sol, do4~do8 fa, sib4~

   %42
   sib8 mib, la la16 sol fa4 r8 re'
   do4 r8 do re4 r8 re
   do4 r8 do reb4 r8 reb\mbreak

   %45
   reb4 r8 reb reb2
   r2 r reb
   do1.

   %48
   do
   sib
   lab

   %51
   lab\mbreak
   sol
   sol2 sol sol

   %54
   do do1~
   do2 sib1
   la1.\fermata

   %57
   re4 re do4. re8
   sib4 sib la4. sib8
   sol4 sol fa sib

   %60
   do sib la2\mbreak
   la4 sib8\p do re4 do8 sib
   la4. sib8 la4. sib8

   %63
   la4. sib8 la2
   la4. la8 sib8 sol la[sib]\mbreak
   sol2 la

   %66
   re4\f re do8 sib la4
   re8 do sib do re4 la'~
   la sol8 fa mib4 sib8. do16\mbreak

   %69
   la2 sib
   si4\p do8  re mib4 re8 do
   do4 si do2

   %72
   sib!4 re2 do8 sib
   la4 sol fa2\mbreak
   re'4\f re do4. re8

   %75
   sib4 sib la4. sib8
   sol4 sol fa sib~
   sib la sib2

   %78
   la4\p sib8 do re4 do8 sib\mbreak
   do4. sib8 la4. sib8
   la4. sib8 la4 la

   %81
   do4.\f do8 re la sib do
   sib la sib do sib la sib do\mbreak
   sib4 la sib2

}

Ivlan = \relative do'{

  fa8. fa16 la8. la16 sib4 r
  re,8. re16 re8. sib'16 sib4 r
  fa8. fa16 sol8. sol16\mbreak la4 r

  %4
  fa8. fa16 fa8. fa16 fa8. fa16 sib,4
  fa'1\fermopz
  R1*3

  %9
  \parenthesize r8 sib sib sib sib sib sib sib
  la fa r sib la do fa,[do']\mbreak
  re4 do sib8 la sol4

  %12
  fa r8 fa16 sol la8 fa16 sol la fa sol la
  sib4 r8 \parenthesize sib16 \parenthesize do \parenthesize  re8 sib16 do re sib do re
  mib4. re8 do sib4 la8

  %15
  sib re,16 do sib8 fa'16 mib\mbreak re8 fa16 mib re8 sib
  fa' sol16 la sib8 fa fa4. fa8
  re mi16 fa sol8 la sib do do4

  %18
  do8 fa, fa[fa] fa fa fa[fa]\mbreak
  re sib r fa' re fa sib,[fa']
  sol4 fa mib8 re do4

  %21
  sib8 sib16 do re8 re16 mib fa8 fa fa fa16 sol
  la8 la r mib\mbreak la sol la[sol]
  fa4 sol8 la sib fa sol4

  %24
  do, r8 sib'16 la sol4 r8 la16 sol
  fa4 r8 sol16 fa mib4 r8 fa16 mib
  re8 fa fa[fa]\mbreak re re re[re]

  %27
  sib sol' fa[fa] mib mib re[re]
  re4 r8 fad16 sol la8 fad16 sol la fad sol la
  sol8 sol16 la sib8 sol\mbreak sol sol sol[sol]

  %30
  sol do4 sib8 la8 sol sol[fad]
  sol4. si,16 do re8 si16 do re si do re
  mib8 mib16 fa sol8 mib16 fa\mbreak sol8 mib16 fa sol mib fa sol

  %33
  fa8 do do[sol'] la! sol sol4
  mi8 do' do do do do do do
  la fa r sib la do fa,[do']\mbreak

  %36
  re4 do sib r8 fa
  fa sib,16 do re8 re16 mib fa8 re16 mib fa re mib fa
  sol8 la, sib[sib'] sol fa fa4

  %39
  re r8 mib16 re\mbreak do4 r8 re16 do
  sib4 r8 do'16 sib la4 r8 sib16 la
  sol4 r8 la16 sol fa4 r8 sol16 fa

  %42
  mib4 r8 fa16 mib re4 r8 sib'
  la4 r8 la sib4 r8 sib
  la4 r8 la sib4 r8 sib

  %45
  sib4 r8 sib sol2
  r2 r sol
  do, fa fa

  %48
  fa fa fa
  fa mib mib
  mib mib mib

  %51
  mib re do
  re re re
  do do do

  %54
  re sol fa
  fa mi1
  fa1.\fermata

  %57
  sib4 fa fa4. fa8
  re4 re re4. re8
  sib4 sib sib fa'

  %60
  sol fa fa2\mbreak
  fa4 mib\p re mib
  fa mi fa mi

  %63
  fa mi fa2
  re4 re sib2
  do fa,

  %66
  sib'4\f sib fad4. fad8
  re4 re re re
  re re mib re

  %69
  re2 re
  sol4\p fa mib fa
  sol sol, do2\mbreak

  %72
  re4 re mib2
  mib4 mi fa2
  sib4 fa fa4. fa8

  %75
  re4 re re4. re8
  sib4 sib sib fa'
  fa2 re\mbreak

  %78
  fa4\p mib re sol
  mib sib fa' mi
  fa mi fa fa

  %81
  fa4.\f fa8 fa4 fa
  fa fa fa fa
  fa fa re2

}

Ibcn = \relative do {

   sib'8. sib16 la8. la16 sol4 r
   re8. re16 sib8. sib16 mib4 r
   sib8. sib16 mib8. mib16 fa4 r\mbreak

   %4
   fa8. fa16 sib,8. sib16 fa'8. fa16 mi4
   fa1\fermata
   r8 fa fa fa fa fa fa fa

   %7
   re sib r fa' re fa sib,[fa']
   sol4 fa mib8 re do4
   sib r8 sib16 do\mbreak re8 sib16 do re do re mib

   %10
   fa4 r8 re16 mib fa8 fa16 sol la fa sol la
   sib4. la8 sol[fa] fa mi
   fa4 r r2

   %13
   R1*2
   r4 r8 sib,16 do\mbreak re8 sib16 do re do re mib
   fa4 r8 re16 mib fa8 fa16 sol la fa sol la

   %17
   sib4. la8 sol[fa]  do'[do,]
   fa4 r r2
   R1*2

   %21
   r8 sib sib sib sib sib sib sib\mbreak
   la fa r sib la do fa,[do']
   re4 do sib8  la sol4

   %24
   fa r8 re mib4 r8 do
   re4 r8 sib do4 r8 la
   sib4 fa' sol re\mbreak

   %27
   mib sib do sol
   re' r8 re16 mi fad8 re16 mi fad re  mi fad
   sol4 r8 sol16 la sib8 sol16 la sib sol la sib

   %30
   do8 do, sol'[sol,] do sol re'[re,]\mbreak
   sol4. sol'16 la si8 sol16 la si sol la si
   do4.  do,16 re mib8 do16 re mib do re mib

   %33
   fa4 do fa8 do sol'[sol,]
   do16 do'do do la do do do mi, do' do do do, do' do do\mbreak
   fa,4 r8 re16 mib fa8 fa16 sol la fa sol la

   %36
   sib4 la sib la
   sib r8 sib,16 do re8 sib16 do re sib do re
   mib4 sib mib8 sib fa'[fa,]\mbreak

   %39
   sib4 r8 sol' la4 r8 fa
   sol4 r8 mib fa4 r8 re
   mib4 r8 do re4 r8 sib

   %42
   do4 r8 la sib4 r8 sib
   fa' fa fa[fa] fa fa fa[fa]\mbreak
   fa fa fa fa mi mi mi mi

   %45
   mi mi mi mi mi2
   r2 r mi
   fa fa fa

   %48
   re re re
   mib? mib mib
   do do do\mbreak

   %51
   re re re
   si si si
   do sib? sib

   %54
   sib la la
   sib sib1
   fa'1.\fermata

   %57
   sib,8 do re mib fa sol la fa
   sol la sib do re re, fa[re]
   mib fa sol la sib sib, re sib\mbreak

   %60
   mib4 sib fa'2
   R1*5
   sib8 do re sib la re do re

   %67
   sib la sol sib fad mib fad re
   sol la sib sol do4 sol\mbreak
   re2 sol,

   %70
   R1*4
   sib8 do re mib fa sol la fa
   sol la sib do re re, fa[re]

   %76
   mib fa sol la sib4 sib,\mbreak
   fa'4 fa, sib2
   R1*3

   %81
   fa'8 sol la fa sib4 fa
   sib fa sib fa
   sib fa sib,2

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentUp




}

forma = {

   \key sib\major
   \time 4/4
   \tempo 4 = 48
   s1*5\bar"||"\break
   \mark\markup\huge \column{"  ""  ""[2.] Allegro"}
   \time 4/4
   \tempo 2 = 55
   s1*40\bar"||"\break
   \mark\markup\huge \column{"  ""  ""[3.] Adagio"}
   \tempo 2 = 60
   \time 3/2
   s1.*11
   \bar"||"\break
   \mark\markup\huge \column{"  ""  ""[4.] Presto"}
   \tempo 2 = 100
   \time 2/2
   s1*9
   \bar":..:"
   s1*18
   \bar":|."

}

IvlI = {
   \Iglobal
   %\notypeset
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

Iob = {
   \Iglobal
   <<\Iobn \forma>>

}

Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \forma \Ibfn>>
   \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] Largo e Staccato"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
    }<<

      \new Staff <<
        \set Staff.midiInstrument = #"oboe"
        \set Staff.instrumentName = \markup \center-column{"Oboe"}
        \Iob
      >>

      \new PianoStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
          \IvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
          \IvlII
        >>
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.instrumentName = \markup \center-column{"[Viola]"}
        \Ivla
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      }<<
        \set Staff.midiInstrument = #"cello"
        \set Staff.instrumentName = \markup \center-column{"[Basso]"}
        \Ibc

      >>
    >>
  }

  \layout {

    indent = 1.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
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
