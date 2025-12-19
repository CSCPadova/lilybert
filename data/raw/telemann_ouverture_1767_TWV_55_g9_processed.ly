\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"doux"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = _\markup \italic { Soli }

solo = _\markup \italic { Solo }

tu = _\markup \italic "Tous"

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
  \senza
}

IobIn = \relative do'' {

  re4._\markup\italic"Tendrement" mib8 re8. [do16 sib8. la16]
  \grace do8 sib4 \grace la8 sol4 do4. do8
  do4. re8 \grace do sib4.-+(la16) sib-.

  %4
  la2 la'4. la8
  la4(sib8.) fad16 sol4. sol8
  sol4. fa!8 fa4(sol8.) re16\mbreak

  %7
  \grace fa8 mib4 \grace re8 do4 \grace mib8 re4 \grace do8 si4
  do4. re8 re4.-+ do8
  do4. re8 do8. [sib16 la8. sib16]

  %10
  la4 do fa4. fa8
  fa4. sol8 fa8. [mib16 re8. do16]
  \grace mib8 re4 \grace do8 sib4 \grace re8 do4 \grace sib8 la4\mbreak

  %13
  sib4. do8 do4.-+ sib8
  sib2(la4) sol8.-+ fad16
  sol4 mib' \grace re8 do4 \grace sib8 la4

  %16
  \grace sol4 fad1-+ fad?2 la'4
  sib_\markup\italic"très vite" sib fad
  sol2 re4\mbreak

  %19
  mib sol8 fa mib fa
  re4 mib8 re do re
  sib la sib re do sib

  %22
  la4 do mi
  fa fa dod
  re8 mi fa sol la re,

  %25
  sib' la sol fa mi re\mbreak
  dod2 la4
  sib la dod

  %28
  re dod mi
  fa mi sol~
  sol fa8 mi fa sol

  %31
  la sol fa la sol fa
  sol fa mi sol fa mi
  fa la sol4 fa\mbreak

  %34
  fa-+ mi la
  sib sib dod,
  re8 mi fa re sol mi

  %37
  fa sol la fa sib sol
  la4 la, re4~
  re8 mi mi4. re8

  %40
  re4. mib!8 re do
  si do re mib fa re\mbreak
  mib sol fa mib re do

  %43
  fa lab sol fa mib re
  mib re do4 sol
  lab sol si

  %46
  do si re
  mib re fa~
  fa mib8 re mib fa

  %49
  sol fa mib sol fa mib\mbreak
  fa mib re fa mib re
  mib sol fa4 mib

  %52
  mib-+ re sol,
  lab sol re'
  mib8 do fa re mib do

  %55
  lab' sol fa mib re do
  fa4 re mib~
  mib8 fa re4.-+ do8\mbreak

  %58
  do4 sol' sib,
  la2 la'4
  sib sib fad

  %61
  sol2 re4
  mib mib si
  do2 la4

  %64
  sib!8 re do sib la sol
  do re mib do re mib
  re do re fa mib re\mbreak

  %67
  sol fad sol sib la sol
  fad sol sol4.-\parenthesize -+ fad16 sol
  la8 la, sib do sib la

  %70
  sib' sib, do re do sib
  fad' fad, sol la sol fad
  sol' sol, la sib la sol

  %73
  fad' sol sol4.-+ fad16 sol
  la2_\markup\italic"Tendrement" r
  re,4. mib8 re8. do16 sib8. [la16]

  %76
  sib4.\tuplet 3/2 { do16 sib do} re4. do8
  re4(mib8.) si16 do8. mib16 re8. [do16]
  fa4. sol8 fa8. mib16 re8. [mib16]

  %79
  re4. re16 mi fa4. sol8\mbreak
  mib4.-+ sib'8 la8. sol16 fad8. [sol16]
  fad4.-+ la8 sib8.[la16 sol8. fad16]

  %82
  sol4 re-. sib-. sol-.
  mib'2 la,8.[sib16 do8. la16]
  re4. do8 \grace sib8 la4. sol8

  %85
  sol2 la'4 sol,2 r

}

IobIIn = \relative do'' {

  re4. mib8 re8. [do16 sib8. la16]
  \grace do8 sib4 \grace la8 sol4 do4. do8
  do4. re8 \grace do sib4.-+(la16) sib-.

  %4
  la2 la'4. la8
  la4(sib8.) fad16 sol4. sol8
  sol4. fa!8 fa4(sol8.) re16\mbreak

  %7
  \grace fa8 mib4 \grace re8 do4 \grace mib8 re4 \grace do8 si4
  do2 si4. do8
  do4. re8 do8. [sib16 la8. sib16]

  %10
  la4 do fa4. fa8
  fa4. sol8 fa8. [mib16 re8. do16]
  \grace mib8 re4 \grace do8 sib4 \grace re8 do4 \grace sib8 la4\mbreak

  %13
  sib4. fa8 mib4.-+ re16 mib
  re2~re8. la'16 sol8. fad16
  sol4 mib' \grace re8 do4 \grace sib8 la4

  %16
  \grace sol4 fad1-+ fad?2 r4
  r r re'
  mib mib si\mbreak

  %19
  do mib8 re do re
  sib4 do8 sib la sib
  sol la sib re do sib

  %22
  la4 do mi
  fa fa dod
  re8 mi fa sol la re,

  %25
  sib' la sol fa mi re\mbreak
  dod2 r4
  r r la

  %28
  sib la dod
  re dod mi~
  mi re8 dod re mi

  %31
  fa mi re fa mi re
  mi re dod mi re dod
  re fa mi4 re\mbreak

  %34
  fa4-+ mi la
  sib sib dod,
  re8 mi fa re sol mi

  %37
  fa sol la fa sib sol
  la4 la, re4~
  re dod4. re8

  %40
  re4. mib!8 re do
  si do re mib fa re\mbreak
  mib sol fa mib re do

  %43
  fa lab sol fa mib re
  mib re do4 r
  r r sol

  %46
  lab sol si
  do si re~
  re do8 si do re

  %49
  mib re do  mib re do\mbreak
  re do si re do si
  do mib re4 do

  %52
  do si sol
  lab sol re'
  mib8 do fa re mib do

  %55
  lab' sol fa mib re do
  fa4 re mib~
  mib8 re si4.-+ do8\mbreak

  %58
  do4 sol' sib,
  la2 la'4
  sib sib fad

  %61
  sol2 re4
  mib mib si
  do2 la4

  %64
  sib!8 re do sib la sol
  do re mib do re mib
  re do re fa mib re\mbreak

  %67
  sol fad sol sib la sol
  fad sol sol4.-\parenthesize -+ fad16 sol
  la8 fad, sol la sol fad

  %70
  sol' sol, la sib la sol
  la la sib do sib la
  sib sib do re do sib

  %73
  la4 sib re
  fad,2 r\mbreak
  re'4. mib8 re8. do16 sib8. [la16]

  %76
  sib4.\tuplet 3/2 { do16 sib do} re4. do8
  re4(mib8.) si16 do8. mib16 re8. [do16]
  fa4. sol8 fa8. mib16 re8. [mib16]

  %79
  re4. re16 mi fa4. sol8\mbreak
  mib4.-+ sib'8 la8. sol16 fad8. [sol16]
  fad4.-+ la8 sib8.[la16 sol8. fad16]

  %82
  sol4 re-. sib-. sol-.
  mib'2 la,8.[sib16 do8. la16]
  re4. la8 fad4. sol8

  %85
  sol2 r4 sol2 r

}

IvlIn =  \relative do'' {

  re4. mib8 re8. [do16 sib8. la16]
  \grace do8 sib4 \grace la8 sol4 do4. do8
  do4. re8 \grace do sib4.-+(la16) sib-.

  %4
  la2 la'4. la8
  la4(sib8.) fad16 sol4. sol8
  sol4. fa!8 fa4(sol8.) re16\mbreak

  %7
  \grace fa8 mib4 \grace re8 do4 \grace mib8 re4 \grace do8 si4
  do4. re8 re4.-+ do8
  do4. re8 do8. [sib16 la8. sib16]

  %10
  la4 do fa4. fa8
  fa4. sol8 fa8. [mib16 re8. do16]
  \grace mib8 re4 \grace do8 sib4 \grace re8 do4 \grace sib8 la4\mbreak

  %13
  sib4. do8 do4.-+ sib8
  sib2(la4) sol8.-+ fad16
  sol4 mib' \grace re8 do4 \grace sib8 la4

  %16
  \grace sol4 fad1-+ fad?2 la'4
  sib sib fad
  sol2 re4\mbreak

  %19
  mib sol8 (fa) mib fa
  re4 mib8 (re) do re
  sib la sib re do sib

  %22
  la4 do mi
  fa fa dod
  re8 mi fa sol la re,

  %25
  sib' la sol fa mi re\mbreak
  dod2 r4
  R2.*6

  %33
  r4 r re
  re dod la'
  sib sib dod,
  re8 mi fa re sol mi

  %37
  fa sol la fa sib sol
  la4 la, re4~
  re8 mi mi4. re8

  %40
  re4. mib!8 re do
  si do re mib fa re\mbreak
  mib sol fa mib re do

  %43
  fa lab sol fa mib re
  mib re do4 r4
  R2.*7

  %52
  r4 r sol
  lab sol re'
  mib8 do fa re mib do

  %55
  lab' sol fa mib re do
  fa4 re mib~
  mib8 fa re4.-+ do8\mbreak

  %58
  do4 sol' sib,
  la2 la'4
  sib sib fad

  %61
  sol2 re4
  mib mib si
  do2 la4

  %64
  sib!8 re do sib la sol
  do re mib do re mib
  re do re fa mib re\mbreak

  %67
  sol fad sol sib la sol
  fad sol sol4.-\parenthesize -+ fad16 sol
  la4 r r

  %70
  sib r r
  fad r r
  sol r r

  %73
  fad8 sol sol4.-+ fad16 sol
  la2 r
  re,4. mib8 re8. do16 sib8. [la16]

  %76
  sib4.\tuplet 3/2 { do16 sib do} re4. do8
  re4(mib8.) si16 do8. mib16 re8. [do16]
  fa4. sol8 fa8. mib16 re8. [mib16]

  %79
  re4. re16 mi fa4. sol8\mbreak
  mib4.-+ sib'8 la8. sol16 fad8. [sol16]
  fad4.-+ la8 sib8.[la16 sol8. fad16]

  %82
  sol4 re-. sib-. sol-.
  mib'2 la,8.[sib16 do8. la16]
  re4. do8 \grace sib8 la4. sol8

  %85
  sol2 la'4 sol,2 r

}

IvlIIn =  \relative do'' {

  sib4. do8 sib8.[la16] sol8. fad16
  sol2 mib4. mib8
  re4. la'8 \grace la sol4.-+(fad16 sol)

  %4
  fad2~fad8 la sol8.-+ fad16
  re'2~re8. re16 do8. sib16
  do2 re4. re8\mbreak

  %7
  do4 sol lab sol~
  sol do si4.-+ do8
  do2 sol4. sol8

  %10
  fa8. sol16 la4~la8. [do16 sib8. la16]
  sib2~sib8. [la16 sib8. do16]
  sib4 fa sol fa~\mbreak

  %13
  fa4. fa8 mib4.-+(re16 mib)
  re2~re4.-+ \tuplet 3/2 { re16 mib fa }
  mib4 sol r mib

  %16
  re1 re2 r4
  r r re'
  mib mib si\mbreak

  %19
  do4 mib8(re) do re
  sib!4 do8(sib) la sib
  sol4 sol sol

  %22
  fa la la
  la2 la4
  fa sib la

  %25
  sol sib si\mbreak
  la2 r4
  R2.*7

  %34
  r4 r la'
  sib sib dod,
  re8 mi fa re sol mi

  %37
  fa sol la fa sib sol
  la4 la, re4~
  re8 mi mi4. re8

  %40
  re4. mib!8 re do
  si do re mib fa re\mbreak
  do2.~

  %43
  do4. re8 do si
  do2 r4
  R2.*7

  %52
  r4 r si,
  do si sol'~
  sol re' do

  %55
  do2.
  re4 si do~
  do8 re si4.-+ do8\mbreak

  %58
  do2 sol4
  fa8 mi fa4 mi'
  fa fa mib!

  %61
  re8 do re4 re
  do sol lab
  sol sol la!

  %64
  sol2 r4
  fa!2 r4
  fa2 r4\mbreak

  %67
  mib sib' do
  re re re
  fad, r r

  %70
  sol r r
  la r r
  sib r r

  %73
  la sib re
  fad,2 r\mbreak
  sol2~sol8. fad16 sol8.[la16]

  %76
  sol2. sol4
  sol2~sol8. mib16 fa8.[sol16]
  fa4 sib~sib8.la16 sib8.[do16]

  %79
  sib4. sib16 do re4. re8\mbreak
  re4(do8.) re16 mib!4. do8
  re4. fad8 fad4 re~

  %82
  re sib-. sol-. r
  sol8. fa16 sol8. sol16 fa4. fa8
  fa8. sib16 la4 \grace sol8 fad4. sol8

  %85
  sol2 r4 sol2 r

}

Ivlan = \relative do' {

  sol'2 r
  re4 sib8. re16 do4. do8
  la4 fad' re re

  %4
  re2. re4
  re2 sol,4. sol'8
  do,2 fa4. fa8\mbreak

  %7
  sol2 fa4 re
  do sol'2 fa4
  mib2 mi4. mi8

  %10
  do2 do4. do8
  sib2 fa'4. fa8
  fa4 fa mib do\mbreak

  %13
  sib sib la4.-+ sib8
  sib4 re fa sib,
  sib do mib re

  %16
  la2 r la2 r4
  R2.*2\mbreak
  r4 r la'

  %20
  sib sib fad
  sol2 do,4
  do fa mi

  %23
  re re mi
  re2 re4
  re2 mi4\mbreak

  %26
  mi2 r4
  R2.*8
  r4 r mi

  %36
  re re mi
  re re do
  do2 sib4

  %39
  sib' la la
  fa fa la
  re, sol sol\mbreak

  %42
  sol2 sol4
  lab2 sol4
  sol8 fa mib4 r

  %45
  R2.*8
  r4 r \parenthesize re
  do sol sol'

  %55
  fa2 lab4
  lab? sol sol
  lab sol sol\mbreak

  %58
  sol do, do
  do2 mi4
  re re do'

  %61
  sib sib sol
  sol2 fa4
  mib! mib re

  %64
  re2 r4
  do2 r4
  sib2 r4\mbreak

  %67
  sib'2 mib4
  la, sib sib,
  re r r

  %70
  re r r
  re r r
  re r r

  %73
  re mib sib
  re2 r\mbreak
  re2 re4. re8

  %76
  re2 si8. re16 do8.[si16]
  sol'2 do,4. mib8
  sib2 fa'4. fa8

  %79
  fa4 sib8. la16 sol4. sol8\mbreak
  sol2 do4. sol8
  la4. do8 re4. re8

  %82
  sol,4 r sol, sib
  do4 do~do8.[sib16] la8. do16
  sib4 mib re do

  %85
  sib2 r4 re2 r

}

Ibcn = \relative do {

  sol2 r
  sol'4. sib8 la8.[sol16] fa8.mi16
  \grace sol8 fad4 \grace mi8 re4 sol sol,

  %4
  re'4. mib?8 re8. do16 sib8. la16
  sib2~sib8. sib'16 la8. sol16
  la8. [sib16 la8. sib16] si4.-+ la16 si\mbreak

  %7
  do4 mib fa,4. \tuplet 3/2 { re16 mib fa }
  mib4 do sol' sol,
  do2 do'4. do8

  %10
  fa,4. sol8 fa8. mib16 re8.[do16]
  re4.-+ mib'8 re8. do16 sib8.[la16]

  %12
  sib4 re, mib4. \tuplet 3/2 { do16 re mib }\mbreak
  re4 sib fa'-+ fa,
  sib2~sib4. \tuplet 3/2 { sib16 do re}

  %15
  mib4 do la do
  re,4. mib'8 re8. do16 sib8.[la16] re,2 r4
  R2.*4

  %21
  r4 r mi'
  fa4 fa dod
  re2 la'4

  %24
  sib sib fad
  sol2 sold4\mbreak
  la2 r4

  %27
  \set Staff.midiInstrument = #"bassoon" la2._\markup\italic"Basson."~
  la~
  la2 dod4

  %30
  re re sib
  fa sib re
  mi, la r

  %33
  re, dod re\mbreak
  la2 r4
  r r \set Staff.midiInstrument = #"cello" la'\tu

  %36
  sib sib dod,
  re re mi
  fa2 sib4

  %39
  sol la la,
  sib sib fad
  sol2 sol'4\mbreak

  %42
  do,2 mib4
  re2 sol4
  do,2 r4

  %45
  R2.
  r4 r \set Staff.midiInstrument = #"bassoon" sol'_\markup\italic"Basson."
  sol2 si4

  %48
  do do lab
  mib lab r\mbreak
  re, sol r

  %51
  do, si do
  sol2 r4
  r r \set Staff.midiInstrument = #"cello" si'\tu

  %54
  do si do
  fa, lab fa
  re sol do

  %57
  fa, sol fa\mbreak
  mib2 mi4
  fa fa dod

  %60
  re2 la'4
  sib sib si
  do2 re4

  %63
  mib mib fad,
  sol2 r4
  la2 r4

  %66
  sib2 r4\mbreak
  mib2 r4
  re sib sol

  %69
  re2.~
  re~
  \once\tieDashed re~

  %72
  re~
  re4 sib sol
  re4. mib'8 re8. do16 sib8. [la16]\mbreak

  %75
  sib4. do8 sib8.[la16] sol8. fad16
  sol4. lab'8 sol8.[fa16] mib8. re16
  mib2~mib8. sol16(fa8. mib16)

  %78
  re4. mib8 re8. do16 sib8.[la16]
  sib4 re' si-. sol-.\mbreak
  do do, do'4. mib8

  %81
  re4 re, re'4.\tuplet 3/2 { re16 do re }
  sib4 sol r mib
  do8. re16 mib8. do16 fa4. fa8

  %84
  sib,4 do re re,
  sol2 r4 sol2 r

}

Ibfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\minor
  \time 4/4
  \tempo 2 = 50
  \repeat volta 2 {s1*15}
  \alternative {{\grace s4 s1}{\time 3/4 \tempo 2. = 75 s2.}}\break
  \set Score.currentBarNumber = #17
  \repeat volta 2 {s2.*57 \break \time 2/2 \tempo 2 = 50 s1*11}
  \alternative {{\time 3/4 s2.}{\time 4/4 s1}}
  \bar"|."

}

IobI = {
  \Iglobal
  \notypeset
  <<\IobIn \forma>>

}

IobII = {
  \Iglobal
  <<\IobIIn \forma>>

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

IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \senza
}

IIobIn = \relative do'' {

  re4 mib
  do2-+ do4 fa
  re2 sib4 re
  sol, sib la8 sib do la

  %4
  do sib la sol re'4 mib
  do2-+ do4 fa
  re2-+ sib4 re

  %7
  sol, sib \grace sib8 la4 sol8 fad
  sol2_\fermata sib8 la sib do
  re do re mib fa mib re do

  %10
  mib(re) do(sib) sol'4 r
  fa r mi r
  \parenthesize r4 fa,8 sol la sib do re

  %13
  mib! re mib fa sol fa mib re
  fa(mib) re(do) mib4 r\mbreak
  re4 r \grace re8 do4 sib8 la

  %16
  sib2 re4 mib
  do2-+ do4 fa
  re2-+ sib4 re

  %19
  sol, sib la8(sib) do(la)
  do(sib) la(sol) re'4 mib
  do2-+ do4 fa

  %22
  re2-+ sib4 re
  sol, sib la sol8(fad)
  sol2 sol'4.(la16 sib)\mbreak

  %25
  la4(sol) r2
  r fa4.(sol16 la)
  sol4(fa) r2

  %28
  r sib8(sol) la4
  r2 mi8(dod) re4
  R1*2

  %32
  r2

}

IIobIIn = \relative do'' {

  re4 mib
  do2-+ do4 fa
  re2 sib4 re
  sol, sib la8 sib do la

  %4
  do sib la sol re'4 mib
  do2-+ do4 fa
  re2-+ sib4 re

  %7
  sol, sib \grace sib8 la4 sol8 fad
  sol2_\fermata sol8 fad sol la
  sib la sib do re do sib la

  %10
  sib (fa) mib(re) r4 re'
  r do r sib
  r la8 sol fa sol la sib!

  %13
  do si do re mib re do si
  do(sol) fa(mib) r4 do'
  r sib mib,8 re mib4

  %16
  re2 re'4 mib
  do2-+ do4 fa
  re2-+ sib4 re

  %19
  sol, sib la8(sib) do(la)
  do(sib) la(sol) re'4 mib
  do2-+ do4 fa

  %22
  re2-+ sib4 re
  sol, sib la sol8(fad)
  sol2 sib4.(do16 re)\mbreak

  %25
  do4 (sib) r2
  r la4.(sib16 do)
  \once\slurDashed sib4 (la) r2

  %28
  r mi'4 fa
  r2 sib,8 mi, fa4
  R1*2

  %31
  r2

}

IIvlIn =  \relative do'' {

  re4 mib
  do2-+ do4 fa
  re2 sib4 re
  sol, sib la8 sib do la

  %4
  do sib la sol re'4 mib
  do2-+ do4 fa
  re2-+ sib4 re

  %7
  sol, sib \grace sib8 la4 sol8 fad
  sol2_\fermata r
  R1*7

  %16
  r2 re'4 mib
  do2-+ do4 fa
  re2-+ sib4 re

  %19
  sol, sib la8(sib) do(la)
  do(sib) la(sol) re'4 mib
  do2-+ do4 fa

  %22
  re2-+ sib4 re
  sol, sib la sol8(fad)
  sol2 r

  %25
  r fa'8(mi) fa(sol)
  mi2 r
  r mi8(re) mi(fa)

  %28
  mi4(re) r2
  sol8(mi) fa4 r2
  do4 la fa' la

  %31
  re, fa mi re8(dod)
  re2

}

IIvlIIn =  \relative do'' {

  sib4 do
  la2-+ fa4 fa
  fa2 fa4 fa
  sol4 sol2 fad4

  %4
  sol2 sib4 do
  la2-+ fa4 fa
  fa2 fa4 fa

  %7
  sol sol mib re\mbreak
  re2\fermata r
  R1*7

  %16
  r2 sib'4 do
  la2-+ fa4 fa
  fa2 fa4 fa

  %19
  sol sol2 fad4
  sol2 sib4 do
  la2-+ fa4 fa

  %22
  fa2 fa4 fa
  sol sol mib re
  re2 r\mbreak

  %25
  r re'4 re
  re(do) r2
  r do4 do

  %28
  do(sib) r2
  re4 re r2
  mi, re'4 re~

  %31
  re re sib la
  la2

}

IIvlan = \relative do' {

  sol'4 sol
  fa fa fa do
  sib sib sib sib
  sib re mib re

  %4
  re sib sol sol'
  fa fa fa do
  sib sib fa' re

  %7
  sib re mib la,\mbreak
  sib2_\fermata r
  R1*7

  %16
  r2 sol'4 sol
  fa fa fa do
  sib sib sib sib

  %19
  sib re mib re
  re sib sol sol'
  fa fa fa do

  %22
  sib sib sib sib
  sib re mib la,
  sib2 r\mbreak

  %25
  r sol'4 sol
  sol2 r
  r fa4 fa

  %28
  fa2 r
  fa4 la r2
  la,4 dod la' la

  %31
  fa la sib mi,8(sol)
  fad2

}

IIbcn = \relative do {

  sol'4 mib
  fa fa, la' fa
  sib sib, re sib

  %3
  mib re do re
  sol,2 sol'4 mib
  fa fa, la' fa

  %6
  sib sib, re sib
  mib re do re\mbreak
  sol,2_\fermopz \set Staff.midiInstrument = #"bassoon" sol'4_\markup\italic"Basson." sol

  %9
  sol2 re4 fa
  sib,2 sib'8 la sib sol
  la sol la fa sol4 do,

  %12
  fa,2 fa'4 mib8 re
  do4 lab' mib sol
  do,2 la'!8 sol la fa\mbreak

  %15
  sib fa re sib fa'4 fa,
  sib4 sib'8 la \set Staff.midiInstrument = #"cello"  sol4\tu mib!
  fa fa, la' fa

  %18
  sib sib, re sib
  mib re do re
  sol,2 sol'4 mib

  %21
  fa fa, la' fa
  sib sib, re sib
  mib re do re

  %24
  sol,2 \set Staff.midiInstrument = #"bassoon" sol'4_\markup\italic"Bas[son]" sol
  sol2\set Staff.midiInstrument = #"cello" si!4\tu sol
  do do, \set Staff.midiInstrument = #"bassoon" fa_\markup\italic"B[asson]" fa

  %27
  fa2 \set Staff.midiInstrument = #"cello" la4\tu fa
  sib2 \set Staff.midiInstrument = #"bassoon" sol4_\markup\italic"B." fa
  \set Staff.midiInstrument = #"cello" sib4\tu la \set Staff.midiInstrument = #"bassoon" sol_\markup\italic"B." sold

  %30
  la2 \set Staff.midiInstrument = #"cello" re,4\tu fa
  sib la sol la
  re,2

}

IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\minor
  \time 2/2
  \tempo 1 = 60
  \partial 2 s2
  \once \override Score.RehearsalMark #'extra-offset = #'(-10 . 0.0)
  \mark \markup\smaller {\musicglyph #"scripts.segno" }
  s1*31
  s2
  \bar"||"
  \mark \markup\smaller {\musicglyph #"scripts.segno" }

}

IIobI = {
  \IIglobal
  \notypeset
  <<\IIobIn \forma>>

}

IIobII = {
  \IIglobal
  <<\IIobIIn \forma>>

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
  \typeset

}

IIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \senza
}

IIIvlIn =  \relative do'' {

  re4^\markup\italic "Avec les deux Hautbois."
  \grace do8 si4. si8
  mi4 fad,4 sol2
  la4. si8 do4

  %4
  si8(la) sol4 re'
  sol4. mi8 fad4
  mi la2

  %7
  \grace sol8 fad4. sol8 mi4-+
  re2 si4
  do4. si8 la4

  %10
  sold la2
  re4. do8 si4
  do8(si) la4 mi'

  %13
  fa4. mi8 fa4
  mi la si,
  do4. re8 si4-+

  %16
  la2 fad!4\mbreak
  sol4. la8 si4
  la re2

  %19
  mi,4. fad8 sol4
  fad8 mi re4 re'
  \grace do8 si4. si8 mi4

  %22
  fad, do'2
  si4. do8 la4-+
  sol2\fermata

}

IIIvlIIn =  \relative do'' {

  la4
  \grace la8 sol4. sol8 sol4
  re4 si sol'~
  sol sol fad

  %4
  sol re la'
  mi'4. mi8 re4
  dod fad2

  %7
  \grace mi8 re4. mi8 dod4
  re2 sold,4
  la4. mi8 mi4

  %10
  mi do la'~
  la sol sold
  la mi si'

  %13
  do4. do8 re4
  do la la
  la4. si8 sold4

  %16
  la2 \parenthesize re,4\mbreak
  re4. fad8 sol4
  fad re sol

  %19
  do, mi2
  re4 la la'
  \grace la8 sol4. sol8 sol4

  %22
  re sol2
  sol4. la8 fad4
  sol2\fermata

}

IIIvlan = \relative do' {

  re4
  re4. re8 do4
  la sol si
  mi re re

  %4
  re8(do) si4 la
  si4. la'8 la4
  la dod2

  %7
  si4. si8 la4
  fad2 mi4
  mi4. re8 do4

  %10
  si la do
  fa re mi
  mi8(re) do4 si

  %13
  la4. la'8 sol4
  sol mi fa
  mi4. fa8 re4

  %16
  do8 si do si la4\mbreak
  si4. do8 re4
  r sol, sol

  %19
  sol la la
  la8(sol) fad4 re'
  re4. re8 do4

  %22
  la sol do
  re4. mi8 do4
  si2_\fermata

}

IIIbcn = \relative do {

  fad4
  sol4. sol8 do,4
  re mi2
  do4 re re,

  %4
  sol sol' fad
  mi4. dod8 re4
  la' fad2

  %7
  si4 sol la
  re,2 mi4
  la,4. sold8 la4

  %10
  mi' fa2
  re4 si mi
  la,2 sold'4

  %13
  la4. do8 si4
  do do, re
  mi re mi

  %16
  la,4. si8 do4\mbreak
  si4. la8 sol4
  re' si2

  %19
  si4 dod la
  re re, fad'
  sol4. sol8 do,4

  %22
  re mi2
  re4 do re
  sol,2\fermopz

}

IIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\major
  \time 3/4
  \tempo 4 = 65
  \partial 4 s4
  s2.*7
  s2 \bar":..:" s4
  s2.*15
  s2
  \bar ":|."

}

IIIvlI = {
  \IIIglobal
  \notypeset
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
  \typeset

}

IVglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \senza
}

IVobIn = \relative do'' {

  re4
  sol4. si8 sol4 sol4. re8 sol4
  \afterGrace sol2. {fad16 [mi]} \afterGrace re2. {do16 [si]}
  la4. do8 mi4 re4. mi8 do4

  %4
  si4. la8 si4 sol2 si4
  mi4. sol8 mi4 mi4. si8 re4\mbreak
  re2.(dod2) mi4

  %7
  la4. sold8 la4 la4. mi8 sol4
  sol2.(fad2) la4
  si4. la8 sol4 sol4. fad8 mi4

  %10
  mi4. re8 dod4 dod4. si8 la4
  la'4. dod,8 re4re4. mi8 dod4
  re2.~re2 re4

  %13
  la'4. si8 la4 la4. sol8 fad4
  \afterGrace sol2. {la16 [si]} \afterGrace mi,2. {fad16 [sol]}
  la,4. si8 la4 la4. sol8 fad4

  %16
  sol4. fad8 sol4 mi2 fad4
  do'4. mi8 do4 do2.-+
  fa4. la8 fa4 fa2.-+

  %19
  mi4. sol8 fa4 mi4. re8 do4
  si4. re8 do4 si4. la8 sol4
  mi'(do2) do4(la2)

  %22
  la4 (fad!2) fad4(re2)
  re'4. fad8 sol4 si,4. do8 la4
  sol2. ~ sol2 sol2.\fermata~sol2 re'4

  %25
  re2.(mib2) do4
  do2.(re2) fa4
  fa2.(sol2) fa4

  %28
  fa re mib mib do re
  re2.(mib2) do4
  do2.(re2) fa4

  %31
  fa2.(sol2) fa4
  fa re mib mib2 sol4
  sol2.(fa2) mi4

  %34
  mi?2.(fa2) la4
  la2.(sol2) fad4
  fad?2.(sol2) re4

  %37
  mib? do re re sib! re
  mib do re re sib do
  sib2. sib2-+ sib2.~sib2

}

IVobIIn = \relative do'' {

  re4
  sol4. si8 sol4 sol4. re8 sol4
  \afterGrace sol2. {fad16 [mi]} \afterGrace re2. {do16 [si]}
  la4. do8 mi4 re4. mi8 do4

  %4
  si4. la8 si4 sol2 si4
  mi4. sol8 mi4 mi4. si8 re4\mbreak
  re2.(dod2) mi4

  %7
  la4. sold8 la4 la4. mi8 sol4
  sol2.(fad2) la4
  si4. la8 sol4 sol4. fad8 mi4

  %10
  mi4. re8 dod4 dod4. si8 la4
  la'4. dod,8 re4re4. mi8 dod4
  re2.~re2 re4

  %13
  la'4. si8 la4 la4. sol8 fad4
  \afterGrace sol2. {la16 [si]} \afterGrace mi,2. {fad16 [sol]}
  la,4. si8 la4 la4. sol8 fad4

  %16
  sol4. fad8 sol4 mi2 fad4
  do'4. mi8 do4 do2.-+
  fa4. la8 fa4 fa2.-+

  %19
  mi4. sol8 fa4 mi4. re8 do4
  si4. re8 do4 si4. la8 sol4
  mi'(do2) do4(la2)

  %22
  la4 (fad!2) fad4(re2)
  re'4. fad8 sol4 si,4. do8 la4
  sol2. ~ sol2 sol2.\fermata~sol2 sib4

  %25
  sib2.(do2) la4
  la2.(sib2) do4
  re2.~re2 re4

  %28
  re sib do do la sib
  sib2.(do2) la4
  la2.(sib2) do4

  %31
  re2.~re2 re4
  re si do do2 sib4
  sib2.(la2) sol4

  %34
  sol2.(la2) do4
  do2.(sib2) la4
  la2.(sib2) sib4\mbreak

  %37
  do la sib sib sol sib
  do la sib sib sol la
  sol2. \parenthesize sol2-\parenthesize -+ sol2.~sol2

}

IVvlIn =  \relative do'' {

  re4
  sol4. si8 sol4 sol4. re8 sol4
  \afterGrace sol2. {fad16 [mi]} \afterGrace re2. {do16 [si]}
  la4. do8 mi4 re4. mi8 do4

  %4
  si4. la8 si4 sol2 si4
  mi4. sol8 mi4 mi4. si8 re4\mbreak
  re2.(dod2) mi4

  %7
  la4. sold8 la4 la4. mi8 sol4
  sol2.(fad2) la4
  si4. la8 sol4 sol4. fad8 mi4

  %10
  mi4. re8 dod4 dod4. si8 la4
  la'4. dod,8 re4re4. mi8 dod4
  re2.~re2 re4

  %13
  la'4. si8 la4 la4. sol8 fad4
  \afterGrace sol2. {la16 [si]} \afterGrace mi,2. {fad16 [sol]}
  la,4. si8 la4 la4. sol8 fad4

  %16
  sol4. fad8 sol4 mi2 fad4
  do'4. mi8 do4 do2.-+
  fa4. la8 fa4 fa2.-+

  %19
  mi4. sol8 fa4 mi4. re8 do4
  si4. re8 do4 si4. la8 sol4
  mi'(do2) do4(la2)

  %22
  la4 (fad!2) fad4(re2)
  re'4. fad8 sol4 si,4. do8 la4
  sol2. ~ sol2 sol2.\fermata~sol2 r4

  %25
  R1.*7
  r2. r2 r4
  R1.*6
  R1.*5/6 R

}

IVvlIIn =  \relative do'' {

  si4
  si4. re8 si4 si4. sol8 si4
  si2 sol4 sol2 sol4
  sol2 sol4 fad4. mi8 fad4

  %4
  sol4. fad8 sol4 si,2 re4
  sol4. si8 sol4 si4. mi,8 si'4\mbreak
  si2.(la2) dod4

  %7
  dod?4. si8 dod4 mi4. la,8 mi'4
  mi2.(re2) re4
  re2 re4 mi2 re4

  %10
  dod4. si8 la4 la2 mi4
  re4. sol8 fad4 fad4. sol8 mi4
  fad2.~fad2 fad4

  %13
  mi2 sol'4 fad4. mi8 fad4
  mi2 si4 si4. la8 si4
  mi,2 sol4 fad4. mi8 fad4

  %16
  mi4. red8 mi4 si2 mi4
  mi4. do'8 la4 mi2 mi4
  re'4. la8 do4 si4.-+ la8 si4\mbreak

  %19
  do4. mi8 re4 do4. si8 la4
  sol4. si8 la4 sol2 sol4
  sol2 la4 sol2 re4

  %22
  re2 re4 re2 la4
  sol4. do'8 si4 re,4. mi8 fad4
  sol2.~sol2 sol2.\fermata~sol2 r4

  %25
  R1.*7
  r2. r2 r4
  R1.*6
  R1.*5/6 R

}

IVvlan = \relative do' {

  sol'4
  re4. sol8 re4 re4. si8 re4
  mi2 mi4 sol2 re4
  mi2 do4 la2 re4

  %4
  re2 re4 si2 re4
  si4. mi8 si4 mi2 mi4\mbreak
  mi4. mi8 mi4 mi2 la4

  %7
  mi2 mi4 la2 la4
  la4. la8 la4 la2 la4
  sol4. la8 si4 si4. la8 sold4

  %10
  la2 mi4 mi4. re8 dod4
  re4. mi8 la,4 la2 la4
  la2.~la2 la4

  %13
  la2 mi'4 si2 si4
  si2 mi4 mi2 mi4
  mi2 mi4 si2 si4

  %16
  si4. la8 si4 sol2 si4
  la2 mi'4 la,4. si8 do4
  la2 sol4 re'2 sol,4

  %19
  sol2 sol'4 sol2 re4
  re2 re4 re2 re4
  do4. re8 mi4 mi2 la,4

  %22
  la2 la4 la2 fad4
  sol r r sol2 re4
  si'2.~si2 si2.\fermata~si2 r4

  %25
  R1.*7
  r2. r2 r4
  R1.*6
  R1.*5/6 R

}

IVbcn = \relative do {

  sol4
  sol'2 sol4 fad2 fad4
  mi4. re8 mi4 si4. la8 si4
  do2 re4 re2 re4

  %4
  sol2 sol,4 sol2 sol'4
  mi2 mi4 sold2 sold4\mbreak
  la4. sold8 la4 la,2 la4

  %7
  la'2 la4 dod2 dod4
  re4. dod8 re4 re,2 fad4
  sol2 sol4 mi2 mi4

  %10
  la2 la4 sol2 sol4
  fad4. mi8 re4 la'2 la,4
  re4. fad,8 la4 re2-+ re4

  %13
  dod2 dod4 red2 red4
  mi4. red8 mi4 sol4. fad8 sol4
  dod,2 dod4 red2 red4

  %16
  mi2 mi,4 mi2 mi'4
  la2 la4 la4. sold8 la4
  re,2 sol4 sol4. fad!8 sol4\mbreak

  %19
  do,2 do4 do2 fad!4
  sol2 fad4 sol2 si4
  do4. si8 la4 la4. sol8 fad4

  %22
  fad4. mi8 re4 re4. mi8 do4
  si4. la8 sol4 re'2 re,4
  sol4. si8 re4 sol,2 sol2.\fermata~sol2 \set Staff.midiInstrument = #"bassoon" sol'4_\markup\italic"[Basson]"

  %25
  sol,2 sol'4 do,2 do'4
  sol,2 sol'4 sol,2 la'4
  si4. do8 re4 la4. la8 si4

  %28
  do,2 do'4 do,2 sol'4
  sol,2 sol'4 do,2 do'4
  sol,2 sol'4 sol,2 la'4\mbreak

  %31
  si4. do8 re4 sol,4. la8 si4
  do,2.~do2 mib4
  mi2 do'4 do,2 do'4

  %34
  fa,,2 fa'4 fa,2 fa'4
  fad2 re'4 re,2 re'4
  sol,,2 sol'4 sol,2 sol'4\mbreak

  %37
  sol2.~sol2 sol,4
  sol2.~sol2 fad'4
  sol, re' sol sol,2 sol2.~sol2_\markup\italic\right-align "La premiere Gigue"

}

IVbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\major
  \time 6/4
  \tempo 1. = 80
  \partial 4 s4
  s1.*11
  s2. s2
  \bar":..:"\break
  \repeat volta 2 {s4 s1.*11}
  \alternative {{\set Score.measureLength = #(ly:make-moment 5 4) s2. s2}{\set Score.measureLength = #(ly:make-moment 6 4) s2. s2}}\break
  \bar".|:"
  \key sol\minor
  s4
  \set Score.currentBarNumber = #25
  s1.*7
  s2. s2\break
  \repeat volta 2{
  s4
  s1.*6}
  \alternative {{\set Score.measureLength = #(ly:make-moment 5 4) s2. s2}{s2. s2}}
  \bar"|."

}

IVobI = {
  \IVglobal
  \notypeset
  <<\IVobIn \forma>>

}

IVobII = {
  \IVglobal
  <<\IVobIIn \forma>>

}

IVvlI = {
  \IVglobal
  <<\IVvlIn \forma>>

}

IVvlII = {
  \IVglobal
  <<\IVvlIIn \forma>>

}

IVvla = {
  \IVglobal
  \clef alto
  <<\IVvlan \forma>>

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
  \senza
}

VobIn = \relative do'' {

  re4\tu sol sib
  la sol8 fad sol4
  sol, sib re

  %4
  \grace do8 sib2-+ la4
  sib(re8) sib fa' re
  do4 (mib8) do sol' mib

  %7
  re do sib4 do
  la8 sol fa4 la\mbreak
  sib2 sib16(do re8)

  %10
  do2 do16(re mib8)
  re do sib4 la
  sib2.

  %13
  fa4 sib re
  sib re fa
  sib4(la8) sib \parenthesize sol la

  %16
  sib la sol fa la4\mbreak
  sib,2 mi16(fa sol8)
  la,2 re16(mi fa8)

  %19
  mi4 re dod
  re2.
  sol,4 do mib!

  %22
  \grace mib8 re4 do8 si do4
  fa, \parenthesize sib re
  sib2 la4

  %25
  sol(sib8) sol re' sib
  la4(do8) la mib' do
  sib la sol4 fad

  %28
  sol2. sol\fermata

}

VobIIn = \relative do'' {

  re4 sol sib
  la sol8 fad sol4
  sol, sib re

  %4
  \grace do8 sib2-+ la4
  sib(re8) sib fa' re
  do4 (mib8) do sol' mib

  %7
  re do sib4 do
  la8 sol fa4 la\mbreak
  sib2 sib16(do re8)

  %10
  do2 do16(re mib8)
  re do sib4 la
  sib2.

  %13
  fa4 sib re
  sib re fa
  sib4(la8) sib \parenthesize sol la

  %16
  sib la sol fa la4\mbreak
  sib,2 mi16(fa sol8)
  la,2 re16(mi fa8)

  %19
  mi4 re dod
  re2.
  sol,4 do mib!

  %22
  \grace mib8 re4 do8 si do4
  fa, \parenthesize sib re
  sib2 la4

  %25
  sol(sib8) sol re' sib
  la4(do8) la mib' do
  sib la sol4 fad

  %28
  sol2. sol\fermata

}

VvlIn =  \relative do'' {

  re4 sol sib
  la sol8 fad sol4
  sol, sib re

  %4
  \grace do8 sib2-+ la4
  sib(re8) sib fa' re
  do4 (mib8) do sol' mib

  %7
  re do sib4 do
  la8 sol fa4 la\mbreak
  sib2 sib16(do re8)

  %10
  do2 do16(re mib8)
  re do sib4 la
  sib2.

  %13
  fa4 sib re
  sib re fa
  sib4(la8) sib \parenthesize sol la

  %16
  sib la sol fa la4\mbreak
  sib,2 mi16(fa sol8)
  la,2 re16(mi fa8)

  %19
  mi4 re dod
  re2.
  sol,4 do mib!

  %22
  \grace mib8 re4 do8 si do4
  fa, \parenthesize sib re
  sib2 la4

  %25
  sol(sib8) sol re' sib
  la4(do8) la mib' do
  sib la sol4 fad

  %28
  sol2. sol\fermata

}

VvlIIn =  \relative do'' {

  re4 sol sib
  la sol8 fad sol4
  sol, sib re

  %4
  \grace do8 sib2-+ la4
  sib(re8) sib fa' re
  do4 (mib8) do sol' mib

  %7
  re do sib4 do
  la8 sol fa4 la\mbreak
  sib2 sib16(do re8)

  %10
  do2 do16(re mib8)
  re do sib4 la
  sib2.

  %13
  fa4 sib re
  sib re fa
  sib4(la8) sib \parenthesize sol la

  %16
  sib la sol fa la4\mbreak
  sib,2 mi16(fa sol8)
  la,2 re16(mi fa8)

  %19
  mi4 re dod
  re2.
  sol,4 do mib!

  %22
  \grace mib8 re4 do8 si do4
  fa, \parenthesize sib re
  sib2 la4

  %25
  sol(sib8) sol re' sib
  la4(do8) la mib' do
  sib la sol4 fad

  %28
  sol2. sol\fermata

}

Vvlan = \relative do' {

  sib'2 re4
  mib re sib
  re,2 la'4

  %4
  re, sol fad
  re sib' sib
  r sib sib

  %7
  sib re, sol
  do,8 sib la4 fa'\mbreak
  fa fa sib~

  %10
  sib sol sib~
  sib re, mib
  re fa re

  %13
  re2 fa4
  re fa fa~
  fa fa mi

  %16
  sol la re,
  re re do
  do do la'

  %19
  sib2 mi,4
  fa la,8 do si4
  do fa, sol'

  %22
  lab sol sol,
  sib re la'?
  do, sol' fad

  %25
  re sol sol
  r sol sol
  la sib, la

  %28
  sib sib8 la sib do sib2.\fermata

}

Vbcn = \relative do {

  sol2 sol'4
  do, re mib
  sib sol fad

  %4
  sol sib re
  sol2 re4
  mib2 mib4

  %7
  fa2 mi4
  fa fa, mib'!\mbreak
  re re re

  %10
  mib mib mib
  fa fa fa
  sib, re8 do sib la

  %13
  sib2 sib'4
  sib, sib' la
  sol do do,

  %16
  fa fa, fad'\mbreak
  sol sol, do
  fa fa, fa'

  %19
  sol2 la4
  re, fa8 mi fa re
  mib!2 do4

  %22
  fa sol mib
  re sib fad
  sol la re

  %25
  sib2 sib4
  do2 do4
  re2 re4

  %28
  sol, sol8 fad sol la sol2.\fermata

}

Vbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\minor
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 55
  s2.*12\break
  \bar":..:"
  \repeat volta 2{s2.*15}
  \alternative {{s2.}{s}}
  \bar "|."

}

VobI = {
  \Vglobal
  \notypeset
  <<\VobIn \forma>>

}

VobII = {
  \Vglobal
  <<\VobIIn \forma>>

}

VvlI = {
  \Vglobal
  <<\VvlIn \forma>>

}

VvlII = {
  \Vglobal
  <<\VvlIIn \forma>>

}

Vvla = {
  \Vglobal
  \clef alto
  <<\Vvlan \forma>>

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
  \con
}

VIobIn = \relative do'' {

  r4 si8\dolce re si re
  r4 la8 do la si
  r4 mi re

  %4
  r do si
  r la8 do la do
  r4 si8 re si re

  %7
  r4 do si
  la2. la
  r4 re8 fa re fa

  %10
  r4 mi8 sol mi sol
  r4 fa8(mi) mi(re)
  fa(mi) re(mi) do4

  %13
  r la'8 sold sold si
  r4 sol!8 fad fad re
  r4 sol8 si la4

  %16
  sol8(fad) mi(fad) re4\mbreak
  r4 la8 do la do
  r4 si8 re si re

  %19
  r8 do si4 la-+
  sol2 r4 sol2 r4

}

VIobIIn = \relative do'' {

  r4 sol8\dolce si sol si
  r4 fad8 la fad la
  r4 sol fad

  %4
  r fad sol
  r4 fad8 la fad la
  r4 sol8 si sol si

  %7
  r4 fad sol
  fad2.-+\mbreak fad
  r4 sol8 re' si re

  %10
  r4 do8 mi do mi
  r4 re8(do) do(si)
  do(sol) fa[(sol)] mi4

  %13
  r4 do'8 si si re
  r4 mi8 re re fad
  r4 si,8 re dod4

  %16
  re8(si) \once\slurDashed sol[(la)] fad4\mbreak
  r fad8 la fad la
  r4 sol8 si sol si

  %19
  r8 la sol4 fad-+
  sol2 r4 sol2 r4

}

VIvlIn =  \relative do'' {

  \tuplet 3/2 { si8\dolce (mi re) } re4 r
  \senza \tuplet 3/2 { la8 (si do) } do4 r
  si8 sol' mi4 re

  %4
  \grace re do2-+ si4
  \tuplet 3/2 { la8(si do) } do4 r
  \tuplet 3/2 { si8(mi re) } re4 r

  %7
  re,8 re' do4 si
  \grace si8 la4.-+ si8 do la la2.-+
  \tuplet 3/2 { re8(mi fa) } fa4 r

  %10
  \tuplet 3/2 { mi8(la sol) } sol4 r
  re8 (fa) fa(mi) mi(re)
  fa(mi) re(mi) do4

  %13
  mi8 la la4 sold
  si,8 sol'! sol4(fad)
  fad8 si si4 (la)

  %16
  sol8(fad) mi(fad) re4\mbreak
  \tuplet 3/2 { la8(si do)} do4 r
  \tuplet 3/2 { si8(mi re)} re4 r

  %19
  mi,8 do' si4 la-+
  sol4.-+ la8 si do sol2.

}

VIvlIIn =  \relative do'' {

  \tuplet 3/2 { sol8\dolce(do si) } si4 r
  \senza \tuplet 3/2 { fad8(sol la) } la4 r
  sol2 sol4~

  %4
  sol fad sol
  \tuplet 3/2 { fad8(sol la) } la4 r
  \tuplet 3/2 { sol8(do si) } si4 r

  %7
  r8 sol fad4 sol
  fad4.-+ sol8 la fad fad2.-+
  sol8 re' re4 r

  %10
  \tuplet 3/2 { do8(fa mi) } mi4 r
  si8 re re do do si
  do(sol) fa(sol) mi4

  %13
  do'8 do do4(si)
  r8 dod dod4(re)
  r8 re re4(dod8) mi

  %16
  re(la) sol(la) fad4\mbreak
  \tuplet 3/2 { fad8(sol la) } la4 r
  \tuplet 3/2 { sol8(do si) } si4 r

  %19
  r8 la sol4 fad-+
  sol4.-\parenthesize -+ fad8 sol la sol2.

}

VIvlan = \relative do' {

  re4\dolce r re
  re r re
  re do re

  %4
  mi re re
  re r re
  re r re

  %7
  re re re
  re2 re4 re2 re4
  re r sol

  %10
  sol r sol
  sol si sol
  sol si, do

  %13
  la' r re,
  mi r si'
  si r mi,8 la

  %16
  la4 dod, re\mbreak
  re4 r re
  re r re

  %19
  do8 mi re4 do
  si2 r4 si2 r4

}

VIbcn = \relative do {

  sol4 r sol
  re' r re
  sol, do si

  %4
  la re sol,
  re' r re
  sol r sol,

  %7
  si la sol
  re' re, re' re re, re'
  si4 r sol

  %10
  do r do
  sol' sol, sol'
  do sol do,

  %13
  la r la
  la r si'
  sol r la

  %16
  re la re,\mbreak
  re, r re'
  sol r sol,

  %19
  do re re,
  sol sol' mi sol,2._\markup\italic\right-align"Premier Menuet"

}

VIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 55
  \repeat volta 2 {s2.*7}
  \alternative {{s2.}{s}}\break
  \set Score.currentBarNumber = #9
  \repeat volta 2{s2.*11}
  \alternative {{s2.}{s}}
  \bar "|."

}

VIobI = {
  \VIglobal
  \notypeset
  <<\VIobIn \forma>>

}

VIobII = {
  \VIglobal
  <<\VIobIIn \forma>>

}

VIvlI = {
  \VIglobal
  <<\VIvlIn \forma>>

}

VIvlII = {
  \VIglobal
  <<\VIvlIIn \forma>>

}

VIvla = {
  \VIglobal
  \clef alto
  <<\VIvlan \forma>>

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
  \senza
}

VIIvlIn =  \relative do'' {

  re8\tu do
  sol'4 re mi si
  do la'2 sol4
  fad mi8 re do4 si8 la

  %4
  si4 sol sol si
  la8 si do re mi4 do
  si8 do si la si4 re

  %7
  dod8 re mi fad sol4 r\mbreak
  fad8 mi re fad mi4 la8 sold
  la4 la,8 la' la4 la,8 la'

  %10
  la4 la,8 la' la4 mi8 sol
  fad4 re8 fad mi4 dod
  re2. re'8 dod

  %13
  re4 la si fad
  sol mi2 re4\mbreak
  dod si8 la sol4 fad8 mi

  %16
  fad4 re re do'!
  si la8 sol la4 sol8 fad
  sol4 mi sol si

  %19
  mi8 red mi fad fad2
  mi r4 sold8 si
  la2 r4 mi8 sol?

  %22
  fad2 r4 la,8 do\mbreak
  si4 la8 sol do4 si8 la
  re4 do8 si mi4 re8 do

  %25
  re4 mi8 fad sol4 do,
  si la la do
  si4 sol8 la la2-+

  %28
  sol8 la si sol do4 r
  si8 la sol si do si sol do\mbreak
  si la sol si la4 re8 dod

  %31
  re4 re,8 re' re4 re,8 re'
  re4 re,8 re' re4 la'
  si,4 sol' la, fad'

  %34
  sol2.

}

VIIvlIIn =  \relative do'' {

  re8 do
  si4 sol sol sold
  la dod re dod
  re la sol la

  %4
  sol re re sol
  sol sol sol fad
  sol8 la sol fad sol4 sold

  %7
  la8 si dod re mi4 r\mbreak
  re8 dod si re dod si la si
  dod si la si dod si la si

  %10
  dod si la si dod4 mi
  re la sol mi8 sol
  fad2. la'8 sol

  %13
  fad4 re re red
  mi si la sold\mbreak
  la mi re mi

  %16
  re la la re
  re mi mi red
  mi si mi mi

  %19
  sol do red,2-+
  mi4 sol8 la si4 si
  r4 do8 re mi4 mi

  %22
  r re re re,\mbreak
  re sol r sol
  r sol r sol

  %25
  sol do si la
  sol fad fad la
  sol sol2 fad4

  %28
  mi8 fad sol  mi la4 r
  sol re8 sol la4 re,8 la'\mbreak
  sol fad mi sol fad4 re8 mi

  %31
  fad mi re mi fad mi re mi
  fad mi re mi fad4 re~
  re re mi do'

  %34
  si2.

}

VIIvlan = \relative do' {

  re4
  re re do si
  la mi' re mi
  la, re sol, re'

  %4
  re si si re
  mi la, la la
  sol re' re re

  %7
  mi r dod'8 re mi dod\mbreak
  la4 r la mi
  mi mi mi mi

  %10
  mi mi mi la
  la la, si la
  la2.la'4

  %13
  la la sol fad
  mi sold mi mi\mbreak
  mi dod re la

  %16
  la fad fad la
  sol si do si
  si sol si mi

  %19
  r mi si la
  sol si mi mi
  r mi la la

  %22
  r la8 sol la4 la,\mbreak
  sol si la do
  sol' re do mi

  %25
  re do re re
  re re re re
  re re mi re

  %28
  si r la'8 sol la fad
  re4 r re r\mbreak
  re r re la

  %31
  la la la la
  la la la la
  sol re' do la

  %34
  sol2.

}

VIIbcn = \relative do {

  si'8 la
  sol4 si do, mi
  la sol fad mi
  re re mi fad

  %4
  sol sol, sol sol'
  do, do do re
  sol sol, sol si'

  %7
  la r la8 si dod la\mbreak
  re4 r la8 si dod si
  la si dod si la si dod si

  %10
  la si dod si la4 dod
  re fad, sol la
  re,2. fad8 mi

  %13
  re4 fad sol si
  mi, re dod si\mbreak
  la la si dod

  %16
  re re, re fad'
  sol mi fad si
  mi, mi, mi sol'

  %19
  do la si si,
  mi mi8 fad sold4 re
  r4 la'8 si dod4 la

  %22
  r re,8 mi fad4 re\mbreak
  sol, sol' la, sol'
  si, sol' do, sol'

  %25
  si, la si fad'
  sol re re fad,
  sol si do re

  %28
  mi r fad8 mi fad re
  sol4 r fad r\mbreak
  sol r re8 mi fad mi

  %31
  re mi fad mi re mi fad mi
  re mi fad mi re4 fad
  sol si, do re

  %34
  sol,2.

}

VIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\major
  \time 4/4
  \tempo 1 = 60
  \partial 4 s4
  s1*11
  s2. \bar":..:" s4
  s1*21
  s2.
  \bar":|."


}

VIIvlI = {
  \VIIglobal
  \notypeset
  <<\VIIvlIn \forma>>

}

VIIvlII = {
  \VIIglobal
  <<\VIIvlIIn \forma>>

}

VIIvla = {
  \VIIglobal
  \clef alto
  <<\VIIvlan \forma>>

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
  \senza
}

VIIIvlIn =  \relative do'' {

  sol'8. sib16 sib4 (la8.) sol16
  fa4-. sib,-. re-.
  mib8. sol16 sol4(fa8.) mib16

  %4
  re4 sol, si
  do8. mib16 mib4(re8.) do16
  sib!8.[la16 sib8. do16 sib8. do16]

  %7
  re4 \grace sib8 la4.-+ \senza \tuplet 3/2 { do16 sib la }
  sib8. sib'16 sib4(la8.) sol16
  fa4-. sib,-. re-.

  %10
  mib8. sol16 sol4(fa8.) mib16
  re4 sol, si
  do8. mib16 mib4(re8.) do16

  %13
  sib!8.[la16 sib8. do16 sib8. do16]
  re4 \grace sib4 la2-+
  sol8 sib re sol sib4\mbreak

  %16
  r8 re,16 do re8 re16 do re8 sib
  r8 sol sib mib sol4
  r8 sib,16 la sib8 sib16 la sib8 sol

  %19
  r8 mib sol do mib4
  sol,8. fad16 sol8 sol16 fad sol8 sol'16 fad
  sol8 re r do sib la\mbreak

  %22
  sib sol sib re r16 mib re do
  re8 sib re fa r16 lab, sol fa
  sol8 mib sol[sib] r16 do sib la!

  %25
  sib la sol la sib la sib do re do re mib
  fa sib, la sib sol' sib, la sib fa mib' re do\mbreak
  re mib re do re mib re do sib do re mi

  %28
  fa sol fa mi fa sol fa mi re fa mi re
  mib!8 mib4 mib re16 do
  re mib re do re mib re do re sib la sib

  %31
  do8 do4 do sib16 la\mbreak
  sib do sib la sib do sib la sib re do sib
  fa'8 sib, sol'[sib,] mib16 do sib la

  %34
  sib sib' la sol fa mib re do sib re do sib
  do re' do sib la sol fa mi re fa mi re
  re8 la'4 sol16 fa la sol fa mi

  %37
  fa8 do do4-+ do-+\mbreak
  fa,8 do' do4-+ do-+
  sol'8 do, lab'[do,] mib16 re do sib!

  %40
  do4 mib, lab
  sol sol'-. re-.
  sib4 la2-+

  %43
  sol4 \once\slurDashed \set Staff.midiInstrument = #"oboe" re'8_\markup\italic"Hautb."(do) mib(re)\mbreak
  r4 re8(do) mib[(re)]
  r fa fa4(mib8.) re16

  %46
  \terzinequarto \con re4(\tuplet 3/2 {do8) sib do \senza re [do sib]
  do re mib mib-+[re mib] sol fa mib}
  r4 re8(do) mib(re)

  %49
  r4 re8(do) mib(re)\mbreak
  r8 fa fa4(mib8.) re16
  \con re4(\tuplet 3/2 { do8) sib do\senza re [do sib]

  %52
  do re mib mib-+[re mib] sol fa mib
  re mib re do[re do] sib do la
  sib sol re'} re4(do8.-+) re16

  %55
  re4 \set Staff.midiInstrument = #"violin" la'\tu sib~\mbreak
  sib la8.-+ sold16 la4
  r re, sol~

  %58
  sol fa8.-+ mi16 fa4
  r sib8. mi,16 mi4~
  mi8 re16(dod)\con \tuplet 3/2 { re8 mi fa \senza mi[fa re] }

  %61
  la8 la'4 sol8 mi4-+
  re \set Staff.midiInstrument = #"oboe" la8_\markup\italic"H[autbois]" (re) re(fa)\mbreak
  \con \tuplet 3/2 { fa8-+ mi fa }\senza fa2~

  %64
  fa8 lab4 sol16 fa mib!8 fa16 re
  \tuplet 3/2 { mib8 do re mib[fa sol] fa re mib }
  re4 sol,8(re') re[(fa)]

  %67
  \tuplet 3/2 { fa-+ mi fa } fa2~
  fa8 lab4 sol16 fa mib!8 fa16 re\mbreak
  \tuplet 3/2 { mib8 do re mib[fa sol] fa re mib

  %70
  re do re mib [re mib] fa mib fa}
  sol2.~
  sol4 fa8. mib16 re8.[fa16]

  %73
  \con \tuplet 3/2 { mib8 re do } \set Staff.midiInstrument = #"violin" sol'4\tu  lab~
  lab sol8.-+ fad16 sol4\mbreak
  r4 do, fa~

  %76
  fa mib!8. re16 mib4
  r lab8. re,16 re4~
  re8 do16 si \tuplet 3/2 { do8 re mib re[mib do] }

  %79
  sol sol'4 fa8 re4-+
  do \tuplet 3/2 { sol8_\markup\italic"Viol." sib sib \senza re[sib sib]
  sib la la do_\markup\italic"H." [mib mib] sol mib mib\mbreak

  %82
  mib do re la_\markup\italic"V." [do sib] sib la sib
  sol fad sol re'_\markup\italic"H." fa? mib mib re mib
  do si do} la16_\markup\italic"V."(sol8.) sib!16(la8.)

  %85
  sol16 fad8.  re'16_\markup\italic"H." do8. mib16(do8.)
  \grace do8 sib8. sib'16\tu sib4 (la8.) sol16\mbreak
  fa4 sib, re

  %88
  mib8. sol16 sol4(fa8.) mib16
  re4 sol, si
  do8. mib16 mib4(re8.) do16

  %91
  sib!8.[la16 sib8. do16 sib8. do16]
  re4 \grace sib8 la4.-+ \senza \tuplet 3/2 { do16 sib la }
  sib8 re16 re re8 sol16 sol sol mib re do

  %94
  re8 fa16 fa fa8 sib16 sib sib do, sib la
  sol8 sib16 sib sib8 mib16 mib mib do sib la
  sib8 re16 re re8 sol16 sol sol fa, mib re\mbreak

  %97
  mib8 sol16 sol sol8 do16 do do lab sol fa
  sol8 sib16 sib sib8 mib16 mib mib8 sol16 sol
  sol re do sib mib do sib la re,8 fad

  %100
  sol16 re re re sib' sol sol sol re' sib sib sib
  fa re re re sib' fa fa fa re' sib sib sib\mbreak
  sol mib mib mib sib' sol sol sol mib' sib sib sib

  %103
  sol re re re sib' sol sol sol re' sib sib sib
  mib do do do sol mib mib mib mib' do do do
  sol' mib mib mib sib' sol sol sol mib sib sib sib\mbreak

  %106
  re sol, sol sol mib' la, la la re,8 fad'
  sol2 r4

}

VIIIvlIIn =  \relative do'' {

  sib8. sol'16 sol4(fa8.) mib16
  re4-. fa,-. sib-.
  sol8. mib'16 mib4(re8.) do16

  %4
  sib4 re, sol
  mib8. do'16 do4(sib8.) la16
  sol8.[fad16 sol8. la16 sol8. la16]

  %7
  sol4 sol fad\mbreak
  sol8. sol'16 sol4(fa8.) mib16
  re4 fa, sib

  %10
  sib8. mib16 mib4(re8.) do16
  sib4 re, sol
  sol8. do16 do4(sib8.) la16

  %13
  sol8.[fad16 sol8. la16 sol8. la16]
  sol4 sol fad
  sol sib re16 mib re do\mbreak

  %16
  re8 sib16 la sib8 sib16 la sib8 fa
  sol8 mib sol4 sib16 do sib la
  sib8 sol16 fa sol8 sol16 fa sol8 re

  %19
  mib do mib4 sol16 lab sol fa
  sol8 mib16 re mib8 mib16 re mib8 sib'16 la
  sib4 la sol8 fad\mbreak

  %22
  sol4 r8 sib sib do
  sib4 r8 sib fa fa
  mib4 r8 sol sol la!

  %25
  sol4 sol sib
  sib sib r8 la\mbreak
  sib8 fa sib[fa] fa sib

  %28
  la4 la8 la la[la]
  sib sib16 la sib la sib la sib do sib la
  sib8 fa fa[fa] fa fa

  %31
  mib sol16 fa sol8 sol16 fa sol8 sol\mbreak
  sol re re [re] sol sib
  sib4 sib r16 mib re do

  %34
  re8 do16 sib la sol fa mib re8 re'
  fa mib16 re dod sib! la sol fa8 mib
  fa4 re' do16 sib la sol

  %37
  la8 la16 sol la8 la16 sol la8 la\mbreak
  do8 fa,16 mi fa8 fa16 mi fa4
  r8 sol fa lab sol16 fa mib? re

  %40
  mib8 sol sol[do,] mib fa
  mib sib' sib[mib,] sol sol
  sol4 sol fad

  %43
  sol \set Staff.midiInstrument = #"oboe" sib8_\markup\italic"H."(la) do(sib)\mbreak
  r4 sib8(la) do(sib)
  r8 sib re4(do8.)\parenthesize sib16

  %46
  \terzinequarto sib4(\con \tuplet 3/2 { la8) sol la \senza sib[la sol]
  la sib do la[sib do] mib re do}
  r4 sib8(la) do(sib)

  %49
  r4 sib8(la) do(sib)\mbreak
  r8 sib re4(do8.) sib16
  sib4(\con \tuplet 3/2 { la8) sol la \senza sib[la sol]

  %52
  la sib do la[sib do] mib re do
  sib do sib la sib la sol la fad}
  sol8. sib16 la4 sol-+

  %55
  fad \set Staff.midiInstrument = #"violin" fa'!8\tu re16 mi fa8 sol\mbreak
  fa4 do do16 la sib do
  re8 re16 do sib8 sib16 do re8 mi

  %58
  re4 la la16 fa sol la
  sib8 sib16 la sol8 sol16 la sib8 do
  sib4 sib sol

  %61
  la mi dod'-+
  re4 r r \mbreak
  r \set Staff.midiInstrument = #"oboe" la8_\markup\italic"[H.]" (do) do(si)

  %64
  si?8 r si do16 re do8 re16 si!
  \tuplet 3/2 { do8 mib, sol do[re mib] re si do }
  si4 r r

  %67
  r la8(do) do(si)
  si?8 r si do16 re do8 re16 si!\mbreak
  \tuplet 3/2 { do8 mib, sol do[re mib] re si do

  %70
  si la si do [si do] re do re}
  mib2.~
  mib4 re8. do16 si8. re16

  %73
  \tuplet 3/2 { \con do8 si do } \set Staff.midiInstrument = #"violin" mib8\tu do16 re mib8 fa
  mib4 sib sib16 sol lab sib\mbreak
  do8 do16 sib lab8 lab16 sib do8 re!

  %76
  do4 sol sol16 mib fa sol
  lab8 lab16 sol fa8 fa16 sol lab8 sib
  la8 mib la mib fa4

  %79
  sol re si'-+
  do \con \tuplet 3/2 { mi,8_\markup\italic"[V.]" sol sol\senza sib[sol sol]
  sol mi fa la_\markup\italic"H."[do do] mib! do do

  %82
  do la sib fa_\markup\italic"V."[mib re] re do re
  mib re mib sib'_\markup\italic"H."[la sol] sol fad sol
  la sol la mib!_\markup\italic"V."[re mib] mib re mib}

  %85
  re4 \tuplet 3/2 { la'8_\markup\italic"H." sol la la [sol fad] }
  sol8. sol'16\tu sol4(fa8.) mib16\mbreak
  re8 sib fa[re] fa sib

  %88
  sib8. mib16 mib4(re8.) do16
  sib8 sol re[sib] re sol
  sol8. do16 do4(sib8.) la16

  %91
  sol8.[fad16 sol8. la16 sol8. la16]
  sol4 sol fad-+\mbreak
  sol8 sib16 sib sib8 sib16 sib sib8 do

  %94
  sib8 re16 re re8 re16 re re8 fa,
  mib8 sol16 sol sol8 sol16 sol sol8 re
  re sib'16 sib sib8 re,16 re re8 re\mbreak

  %97
  do8 mib16 mib mib8 mib16 mib mib8 fa
  mib8 sol16 sol sol8 sib16 sib sib8 mib16 mib
  re8 sol,16 sol sol8 mib16 mib re8 re16 re

  %100
  re re re re re re re re re re re re
  re re re re re re re re re re re re\mbreak
  mib mib mib mib mib mib mib mib mib mib mib mib

  %103
  re re re re re re re re sol sol sol sol
  sol sol sol sol sol sol sol sol do do do do
  sib sib sib sib sib sib sib sib sib sib sib sib\mbreak

  %106
  sol sol sol sol sol sol sol sol fad8 la
  sib2 r4

}

VIIIvlan = \relative do' {

  re4 re r8. sib'16
  sib4-.re,-. fa-.
  mib sib r8. sol'16

  %4
  sol4 sib, re
  do sol r8. mib'16
  mib4 mib mib

  %7
  re  mib re\mbreak
  re re r8. mib16
  sib4 re fa

  %10
  sol sib, r8. do16
  sol4 sib re
  mib sol, r8. fad'16

  %13
  sol4 mib! mib
  re mib re
  re sol8 re re[sol]\mbreak

  %16
  fa4 fa fa
  mib mib8 sib mib mib
  re4 re re

  %19
  do do do8 do
  sib4 sib sib
  re do8 mib re re\mbreak

  %22
  re4 re8 sol sol fa
  fa4 \parenthesize r8 fa re sib
  sib4 sib8 mib mib re

  %25
  re4 re sol
  fa mib do8 fa\mbreak
  fa4 fa fa

  %28
  re re re
  sol sol sol
  fa sib, sib

  %31
  sol' mib mib\mbreak
  re re re
  sib sib8 sol' fa fa

  %34
  fa4 r fa8 fa
  la4 r la8 la
  la4 fa r8 do

  %37
  do fa16 mi fa8 fa16 mi fa8 fa\mbreak
  r8 lab,16 sol lab8 lab16 sol lab8 lab
  do4 do r8. sol'16

  %40
  sol do sib lab sol fa mib re do8 re
  mib re16 do sib lab sol fa mib8 mib'
  re4 mib re

  %43
  sib r r\mbreak
  R2.*11
  r4 re'8 re re re\mbreak

  %56
  do4 do8 fa, fa fa
  fa4 fa8 sib sib sib
  la4 la8 re, re re

  %59
  re4 re8 re sol sol
  fa4 fa r8 mib
  re4 sib' la

  %62
  la r r\mbreak
  R2.*10
  r4 do8 do do do

  %74
  sib4 mib,8 mib mib mib\mbreak
  mib4 mib8 lab lab lab
  sol4 sol8 do, do do

  %77
  do4 do8 fa fa fa
  mib4 mib8 do re4
  do lab' sol

  %80
  sol \parenthesize mi mi!
  do r r\mbreak
  r re fa

  %83
  mib r r
  r do do
  la r r

  %86
  r re' do\mbreak
  r sib sib
  sib sib la

  %89
  r sol sol
  sol sol fa
  r mib mib

  %92
  re  mib re\mbreak
  re4 r8 re16 re re8 mib
  sib4 r8 fa'16 fa fa8[fa]

  %95
  sib,4 r8 sib16 sib sib8 re
  sol,4 r8 sib16 sib sib8 sol\mbreak
  sol4 r8 sol16 sol sol8 sib

  %98
  sib4 r8 sol'16 sol sol8 sib16 sib
  sib8 sib,16 sib la8 la16 la fad8 la
  sib16 sib sib sib sib sib sib sib sib sib sib sib

  %101
  sib sib sib sib sib sib sib sib sib sib sib sib\mbreak
  sib sib sib sib sib sib sib sib sib sib sib sib
  sib sib sib sib sib sib sib sib sib sib sib sib

  %104
  do do do do do do do do sol' sol sol sol
  mib mib mib mib sol sol sol sol sol sol sol sol\mbreak
  re re re re do do do do la8 re

  %107
  re2 r4

}

VIIIbcn = \relative do {

  sol2.
  sib
  mib

  %4
  sol
  do,
  mib

  %7
  sib4 do re\mbreak
  sol sol r8. la16
  sib4 sib, sib'

  %10
  mib, mib r8. fad16
  sol4 sol, fa'
  do do r8. re16

  %13
  mib4 mib, re'
  sib do re
  sol, r8 sol' sol16 fad sol la\mbreak

  %16
  sib4 sib,8 sib' sib, sib'
  mib,4 r8 mib mib16 re mib fa
  sol4 sol,8 sol' sol, sol'8

  %19
  do,4 r8 do do16 si do re
  mib4 mib,8 mib' mib, mib'
  sib sib' do, [do'] re, re'\mbreak

  %22
  sol, fa16 mib re do sib la sol8 la'
  sib8 la16 sol fa mib re do sib8 re
  mib re16 do sib lab sol fa mib8 fad'

  %25
  sol fa!16 mib re do sib la sol8 sol'
  re4 mib fa\mbreak %%%%% fine pagina 15 bar 25
  sib,8 sib'16 la sib8 sib16 la sib8 sib

  %28
  r8 re16 dod re8 re16 dod re8 re
  r8 sol,16 fad sol fad sol fad sol8 sol,
  r sib'16 la sib la sib la sib8 sib,

  %31
  r mib16 re mib8 mib16 re mib8 mib\mbreak
  r8 sol16 fad sol8 sol16 fad sol8 sol
  re16 sib' la sib mib, sib' la sib fa8 fa,

  %34
  sib do16 re mib fa sol la sib4
  re,8 mi16 fa sol la sib do re4
  la,8 fa' sib,[fa'] do do,

  %37
  fa fa'16 mi fa8 fa16 mi fa8 fa\mbreak
  r8 lab16 sol lab sol lab sol lab4
  mib-. fa-. sol-.

  %40
  do8 sib16 lab sol fa mib re do8 re'
  mib re16 do sib lab sol fa mib8 mib'
  sib, sol do la re re,

  %43
  sol2 r4\mbreak
  \set Staff.midiInstrument = #"bassoon" sol'2_\markup\italic"Basson" r4
  re sib mib

  %46
  fa sol sib,
  fa' fa la,
  sib sol r

  %49
  sol'2 r4 %%%%% fine p 16
  re4 sib mib
  fa fa sib,

  %52
  fa' fa fa,
  sib do re
  sol,8. sol'16 fa4 mib

  %55
  re \set Staff.midiInstrument = #"cello"re'8\tu re, re' mi\mbreak
  fa fa, fa4 r16 mib! re do
  sib4 sib'8 sib, sib' dod

  %58
  re re, re4 r16 do sib la
  sol4 sol'8 sol, sol' la
  sib sib, sib4 r8 sib'

  %61
  \con\terzinequarto \tuplet 3/2{ fa mi fa \senza sol[fa sol] la sol la }
  re,2 r4\mbreak
  \set Staff.midiInstrument = #"bassoon" re4_\markup\italic"Bass." re re

  %64
  sol sol sol
  do, do sol'8. fad16
  sol2 r4

  %67
  r re re
  sol sol sol\mbreak
  do, do sol'8. fad16

  %70
  sol2 fa4
  \tuplet 3/2 { mib8 sol do do,[mib sol] mib sol do }
  fa,,2 sol4

  %73
  do, \set Staff.midiInstrument = #"cello" do''8\tu do, do' re
  mib mib, mib4 r16 red? do sib  %%% fine p. 11  verificare questo re?
  lab4 lab'8 lab, lab' si

  %76
  do do, do4 r16 sib lab sol
  fa4 fa'8 fa, fa' sol
  lab lab, lab4 r8 lab'

  %79
  \con \tuplet 3/2 { mib re mib \senza fa[mib fa] sol fa sol }
  do,4 do do
  fa, fa'_\markup\italic"Bass." fa\mbreak

  %82
  sib, sib\tu sib
  mib, mib'_\markup\italic"Bass." mib
  la, la\tu la

  %85
  re, re'_\markup\italic"Basson." re
  sol, sol'\tu r8. la16\mbreak
  sib8 sib, re fa sib[lab]

  %88
  sol4 mib r8. fa16
  sol8 sol, sib re sol[fa]
  mib4 do r8. re16

  %91
  mib8 [mib, sol sib] mib re16 do
  sib8 sib' do,[do'] re, re'\mbreak
  sol,4 r8 sol16 sol sol8 la

  %94
  sib4 r8 sib,16 sib sib8 re
  mib4 r8 mib16 mib mib8 fad
  sol4 r8 sol,16 sol sol8 si\mbreak

  %97
  do4 r8 do16 do do8 re
  mib4 r8 mib16 mib mib8 mib16 mib
  sib8 sib16 sib do8 do16 do re8 re16 re

  %100
  sol, sol' sol sol sol sol sol sol sol sol sol sol
  sib sib sib sib sib sib sib sib sib sib sib sib\mbreak
  mib, mib mib mib mib mib mib mib mib mib mib mib

  %103
  sol sol sol sol sol sol sol sol sol sol sol sol
  do, do do do do do do do do do do do
  mib mib mib mib mib mib mib mib mib mib mib mib\mbreak

  %106
  sib sib sib sib do do do do re re re re
  sol,2 r4

}

VIIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\minor
  \time 3/4
  \tempo 2 = 50
  s2.*107
  \bar"|."


}

VIIIvlI = {
  \VIIIglobal
  %\notypeset
  <<\VIIIvlIn \forma>>

}

VIIIvlII = {
  \VIIIglobal
  <<\VIIIvlIIn \forma>>

}

VIIIvla = {
  \VIIIglobal
  \clef alto
  <<\VIIIvlan \forma>>

}

VIIIbc = {
  \VIIIglobal
  \clef bass
  <<\VIIIbcn \forma \VIIIbfn>>
  \typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #3

  }

  \markup\huge "[1.] Ouverture"


  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.instrumentName =  \markup \center-column{"[Hautbois I]"}
            \set Staff.midiInstrument = #"oboe"
            \IobI
          >>

          \new Staff <<
            \set Staff.instrumentName =  \markup \center-column{"[Hautbois II]"}
            \set Staff.midiInstrument = #"oboe"
            \IobII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violon I]"}
            \IvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violon II]"}
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
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"" / Basson"}
          \Ibc

        >>
      >>

    }

    \layout {

      indent = 2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner
        #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

  \markup\huge "[2.] Gavotte en Rondeau"


  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \IIobI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \IIobII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIvla
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
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
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner
        #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\pageBreak

\bookpart {

  \paper {

    systems-per-page = #4

  }

  \markup\huge "[3.] Loure (canc.)  Gravement - se jouë la 2.me fois alternativement doux et fort"


  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.""Violon"}
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
          >>

          \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.""[Violon]"}
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \IIIbc

        >>
      >>

    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner
        #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

  \paper  {

    systems-per-page = #3

  }

  \markup\huge "[4.] Gigue - Legèrement."


  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \IVobI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \IVobII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IVvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IVvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IVvla
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
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
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner
        #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

  \markup\huge "[5.] Premier Menuet"


  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \VobI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \VobII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \Vvla
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
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
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner
        #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

  \markup\huge "[6.] Second Menuet"


  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \VIobI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \VIobII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \VIvla
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \VIbc

        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner
        #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

  \markup\huge "[7.] [Bourrée]"


  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VIIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VIIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \VIIvla
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \VIIbc

        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner
        #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

  \markup\huge "[8.] Chaconne (canc.) avec les 2 Hautb[ois]"


  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VIIIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \VIIIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \VIIIvla
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \VIIIbc

        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner
        #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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
