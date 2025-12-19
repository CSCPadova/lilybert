\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

pralld = ^\markup {\musicglyph #"scripts.pralldown" }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

quarto = \tupletSpan 4

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
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0
%}

mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \override Glissando.style = #'zigzag
    \quarto \senza
}

IdsIn = \relative do'' {

    sol'2 re2. sib'4
    la2 re,2. re4
    re4.(mib8) do2.\prall~do8\pralld  sib16 [do]

    %4
    re2 la2.\prall la4\mbreak
    sib2 sol'2. re4
    mib(fa) sol(fa) mib(re)

    %7
    do2\prall fa2. fa4
    sib(la) sol(fa) mib(re)\mbreak
    sol(fa) mib(re) do(sib)

    %10
    mib4. re8 do2.\prall sib4
    sib2 re2. do8 sib\mbreak
    do2 re4. do8 sib4.\prall la8\mbreak

    %13
    sib2 sib'2. la4
    sol(la) sol(fa) mi(re)
    dod2 la'1~

    %16
    la2 sol1\prall~
    sol2 fa1\prall~\mbreak
    fa2 mi(fa4.) sol8

    %19
    fad4.\prall mi8 fad4. sol8 la4. fad8
    sol2 r r\mbreak
    r sol4. lab8 sol4. fa8

    %22
    mib4. sol8 fa4. mib8 re4. do8
    si2\prall sol'1
    fa2\prall \appoggiatura {fa16[sol]} lab2. lab4\mbreak

    %25
    re,2\prall mib2. mib4
    mib?2 re2.\prall mib!4
    do2 r r

    %28
    R1.*7
    r2 sol'2. sol4
    fa2\prall sol4. fa8 mib4.\prall re8

    %37
    mib2 mib2. mib4
    mi!2 mi2. mi4
    fa2 r r\mbreak

    %40
    R1.*5
    r2 sib2. sib4
    lab2\prall sib4. lab8 sol4. fa8\mbreak

    %47
    sol2 lab4. sol8 fa4. mib8
    re2\prall sib' mib,
    lab4. sol8 fa2.\prall~fa8\pralld mib\noBeam

    %50
    mib?2 sol2. sol4
    fa2\prall sol4. fa8 mib4. re8
    mib2 mib2. mib4\mbreak

    %53
    re2\prall re2. mib4
    do2\prall fa4. mib8 re4. do8
    si2 \prall re2. re4

    %56
    mib2 la,2.\prall sib4
    fad2\prall la2. la4
    sib2  sib'2. sib4

    %59
    la2\prall la4(sol) la(sib)
    sol2\prall sol4(fad) sol4. la8
    sib2 la2.\prall sol4

    %62
    fad2\prall fad2. fad4
    sol2 re4. mi8 fa?4. sol8
    mi2\prall do'4. sib8 la4. sol8

    %65
    fad2 re4. do8 re4. sib8
    mib4. re8 do4. sib8 la4. sol8
    fad2\prall re'2. re4\mbreak

    %68
    mib2 mi2.\prall mi4
    fa2 fad2.\prall  fad4
    sol4. la8 la2.\prall~la8\pralld sol8\noBeam

    %71
    sol2 re4. mi8 fa4. sol8
    mi2\prall do'4. sib8 la4. sol8
    fad2\prall re4. do8 re4. sib8

    %74
    mib4. re8 do4. sib8 la4. sol8\mbreak
    fad2\prall re'2. re4
    mib2 mi2.\prall mi4

    %77
    fa2 fad2.\prall fad4
    sol4. la8 la2.\prall sol4
    sol1.

}


IdsIIn = \relative do'' {

    sol'2 re2. sib'4
    la2 re,2. re4
    re4.(mib8) do2.\prall~do8\pralld  sib16 [do]

    %4
    re2 fad,2.\prall fad4\mbreak
    sol2 si2. si4
    do(re) mib(re) do(sib)

    %7
    la(sol) la(sib) la(sol)
    fa2 sib'4(la) sol(fa)\mbreak
    mib(re) sol(fa) mib(re)

    %10
    do4. sib8 la2.\prall sib4
    sib2 re2. do8 sib
    do2 re4. do8 sib4.\prall la8\mbreak

    %13
    sib2 sib'2. la4
    sol(la) sol(fa) mi(re)
    dod2 la'1~

    %16
    la2 sol1\prall~
    sol2 fa1\prall~\mbreak
    fa2 mi(fa4.) sol8

    %19
    fad4. mi8 fad4. sol8 la4. fad8
    sol2 re4. mib8 re4. do8\mbreak
    si2 si2. si4

    %22
    do4. mib8 re4. do8 si?4. lab8
    sol2\prall do1~
    do2 do2. fa4\mbreak

    %25
    si,2\prall do2. do4
    do2 si2.\prall do4
    do2 r r

    %28
    R1.*5
    r2 sol'2. sol4
    fa2\prall sol4. fa8 mib4. re8\mbreak

    %35
    mib2 mib2. mib4
    re2\prall mib4. re8 do4.\prall si8
    do2 do2. do4

    %38
    do2 do2. do4
    do2 r r\mbreak

    %40
    R1.*5
    r2 sib'2. sib4
    lab2\prall sib4. lab8 sol4. fa8\mbreak

    %47
    sol2 lab4. sol8 fa4. mib8
    re2\prall sib' mib,
    lab4. sol8 fa2.\prall~fa8\pralld mib\noBeam

    %50
    mib?2 sol2. sol4
    fa2\prall sol4. fa8 mib4. re8
    mib2 mib2. mib4\mbreak

    %53
    re2\prall re2. mib4
    do2\prall fa4. mib8 re4. do8
    si2\prall re2. re4

    %56
    mib2 la,2.\prall sib4
    fad2\prall la2. la4
    sib2 re2. re4

    %59
    re2\prall re2. re4
    re2 do2.\prall do4\mbreak
    re2 mib2. mib4

    %62
    la,2 fad'2. fad4
    sol2 si,4. do8 re4. si8
    do2\prall do'4. sib?8 la4. sol8

    %65
    fad2 sib,4. la8 sib4. sol8
    sol2 mib'4. re8 do4. sib8
    la2\prall sol2. sol4\mbreak

    %68
    sol2. sol4 do2
    la\prall la2. re4
    sib4. sol8 fad2.\prall~fad8\pralld sol\noBeam

    %71
    sol2 re'4. mi8 fa4. sol8
    mi2\prall do'4. sib8 la4. sol8
    fad2\prall re4. do8 re4. sib8

    %74
    mib4. re8 do4. sib8 la4. sol8\mbreak
    fad2\prall re'2. re4
    mib2 mi2.\prall mi4

    %77
    fa2 fad2.\prall fad4
    sol4. la8 la2.\prall sol4
    sol1.

}

Ihcn =  \relative do'' {

    sib2 sib2. re4
    re2 la2. sib4
    sol2 sol(fad4.) sol8

    %4
    fad2 r r\mbreak
    R1.*6
    r2 sib2. fa4

    %12
    fa2 la2. la4\mbreak
    sol2 re'2. do4
    sib(do) sib(la) sol(fa)

    %15
    mi2\prall r re'
    si1\prall mi2
    dod\prall la re\mbreak

    %18
    si dod2. si8 dod
    re2  r r
    R1.*19

    %39
    r2 do2. do4\mbreak
    sib2\prall do4. sib8 lab4. sol8
    lab2 lab2. lab4

    %42
    la!2\prall  la2. la4
    sib2 fa2. fa4
    fa2 fa2. fa4

    %45
    mib2 mib2. mib4
    fa2 fa2. fa4\mbreak
    mib2 mib2. sol4

    %48
    fa2 sol sol
    fa sib lab
    sol\prall do2. do4

    %51
    re2 re2. re4
    do2 do2. do4\mbreak
    sol2 sol sib

    %54
    lab lab2. lab4
    sol2 si2.\prall si4
    do2 mib2. mib4

    %57
    la,2\prall fad2.\prall fad4
    sol2 r r
    R1.*3

    %62
    r2 la2. la4
    sib2 r r
    r mib4. re8 do4. sib8

    %65
    la2 r r
    R1.*5
    r2 si4. do8 re4. si8

    %72
    do2 mib4. re8 do4. sib8
    la2\prall sib4. la8 sib4. \parenthesize sol8
    sol2. r8 fa mib2\mbreak

    %75
    re2. re4 sol2
    sol2. sol4 do2
    la\prall  la2. re4

    %78
    sib4.\prall sol8 fad2.\prall  ~ fad8\pralld sol8\noBeam
    sol1.

}

Ivlan = \relative do' {

    re2 re2. re4
    re2 re2.  re4
    mi2 sol,2. sol4

    %4
    la2 re2. re4\mbreak
    sol,2 sol'2. sol4
    do,2 do2. do4

    %7
    fa(mib) fa(sol) fa(mib)
    re2 mib1~\mbreak
    mib1.~

    %10
    mib2 fa2. fa4
    sib,2 fa'2. re4
    do2 la re\mbreak

    %13
    re2 re2. re4
    re2 re4 do sib sol
    la2 re1~

    %16
    re2 mi1~
    mi2 re1~\mbreak
    re2 la'2. la4

    %19
    la2 re4. mib8 re4. do8
    sib2 fad2.\prall fad4\mbreak
    sol2 sol2. sol4

    %22
    lab4. mib8 fa1~
    fa4. fa8 mib4. re8 mib4. do8
    lab'4. sol8 fa4. mib8 fa4. re8\mbreak

    %25
    sol2 do,4. sib8 lab4. sol8
    fa2 sol2. sol4
    do2 r r

    %28
    r fa4. solb8 fa4. mib8
    re2\prall re2. re4\mbreak
    do2 re4. do8 sib4.\prall la8

    %31
    sib2 sib2. sib4
    si2 si2.  si4
    do2 do2. do4

    %34
    re2 re2. sol4\mbreak
    sol2 sol2. sol4
    lab2 sol2.\prall sol4

    %37
    sol2 sol2. sol4
    sol2 sol2. sol4
    fa2 fa2. fa4\mbreak

    %40
    fa2 mi2.\prall mi4
    fa2 fa2. fa4
    mib2\prall fa4. mib8 re4. do8

    %43
    re2 re2. re4
    re2 re2. re4
    sib2\prall sib2. sib4

    %46
    sib2 sib2. sib4\mbreak
    sib2 do2. do4
    sib2 re do

    %49
    do4. mib8 re2.\prall mib4
    mib2 mib2. sol4
    sol2 sol2. sol4

    %52
    sol2 sol2. sol4\mbreak
    sol2 re sib
    mib4. sib8 do2. mib4

    %55
    re2 re sol
    sol do,2. mib4
    re2\prall re2. re4

    %58
    re2 sol2. sol4
    fad2\prall fa2. fa4
    mi2\prall mib2. mib4\mbreak

    %61
    sib2 do2. do4
    re2 re2. re4
    re2 sol2. sol4

    %64
    do,2 sol'2. sol4
    re2 sol2. sol4
    do,2 do2. do4

    %67
    re2 sib sol\mbreak
    do2 do la
    re re2. re4

    %70
    mib2 re2. re4
    sol2 re2. re4
    do2 sol'2. sol4

    %73
    re2 re sib
    do mib do4. sib8\mbreak
    la2 sib2. sib4

    %76
    sib2 sol la~
    la re2. la4
    sol2 re'2. do4

    %79
    si1.\prall

}

Ibcn = \relative do {

    sol'2 sol2. sol4
    fad2 fa2. fa4
    mi2 mib2. mib4

    %4
    re2 r r
    R1.*6
    r2 sib'2. sib4

    %12
    la2 fad2. fad4\mbreak
    sol2 sol,1
    sol'2 sol2. sol4

    %15
    sol2 fa re
    sol1 mi2
    fa1 fa2\mbreak

    %18
    sol la2. la4
    re2 r r
    R1.*7

    %27
    r2 do4. re8 do4. sib8
    <la fa>2 <la fa>2. la4
    sib2 sib2. sib4\mbreak

    %30
    la2 fad2. fad4
    sol2 sol2. sol4
    fad2\prall sol4. fad8 mib4. re8

    %33
    mib2 mib2. mib4
    si2\prall si2. si4\mbreak
    do2 do'2. do4

    %36
    do2 si sol
    do do2. do4
    sib2 do4.  sib8 lab4. sol8

    %39
    lab2 lab2. lab4\mbreak
    sol2 sol2. sol4
    fa2 fa1~

    %42
    fa1.
    sib,2 sib2. sib4
    lab2 sib4. lab8 sol4. fa8

    %45
    sol2 sol'2. sol4
    re2 re2. re4\mbreak
    mib2 lab,2. lab4

    %48
    sib2 sol do
    lab sib2. sib4
    mib,2  mib'2. mib4

    %51
    si2 si2. si4
    do2 do'2. do4\mbreak
    si2 sib2 sol

    %54
    lab4. sol8 fa4. sol8 lab4. fa8
    sol4(lab) sol(fa) mib(re)
    do(sib) do(re) mib(do)

    %57
    re(mib) re(do) sib(la)
    sol2 r r
    R1.*3

    %62
    r2 re''4. do8 sib4. la8
    sol2 r r
    r2 do,4. re8 mib4. do8

    %65
    re2 r r
    R1.*5
    r2 sol2. sol4

    %72
    do,2 do4. re8 mib4. do8
    re2 sol2. sol4
    do,2 do2. do4

    %75
    do2\glissando sib sol
    do do la
    re re2. re4

    %78
    mib2 re re,
    sol1.

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown






}

forma = {

    \key fa\major
    \time 3/2
    \tempo 1 = 65
    s1.*79
    \bar"|."

}

IdsI = {
    \Iglobal
    \notypeset
    %\clef french
    <<\IdsIn \forma>>

}

IdsII = {
    \Iglobal
    %\clef french
    <<\IdsIIn \forma>>

}

Ihc = {
    \Iglobal
    %\clef soprano
    <<\Ihcn \forma>>

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
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

   systems-per-page = #3
   print-first-page-number = ##t
   first-page-number = #2

}

\markup\huge "Ritournelle"

\score {
   {
      <<

         \new ChoirStaff <<

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"[I Dessus]"}
               \IdsI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"[II Dessus]"}
               \IdsII
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"[Haute-""Contre]"}
               \Ihc
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"[Taille]"}
               \Ivla
            >>
            \new Staff \with {
               fontSize = #+1
               \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
               \set Staff.midiInstrument = #"cello"
               \set Staff.instrumentName = \markup \center-column{"[Basse]"}
               \Ibc

            >>
         >>

      >>
   }

   \layout {

      indent = 1.5\cm

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



