\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = ^\markup\italic"tasto solo"

tr = \trill

ten = ^\markup \italic "ten"

dolce = _\markup\italic "dolce"

arco = _\markup \italic "Con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "Pizzicato"

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
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  %\set Score.skipTypesetting = ##t

}

IvlIn = \relative do'' {

   sol'8 sol sol sol sol sol
   sol sol sol  sol sol sol
   fa mib re do sib la

   %4
   sib[sol] sol' re dod re
   dod re sol sol, sib do?
   re4 re, r

   %7
   re'8 mi? fa sol la sib
   mi,4 fa8 sol la sib
   la re, r re mib re

   %10
   mib re r la fad re\mbreak
   sol la sib do re mib
   re4 sol, r

   %13
   R2.
   r4 r8 la' sib la
   sib la r sib la sol

   %16
   fa dod re mi? fa sol
   fa dod re mi fa sol
   la2 r4

   %19
   r8 la fad sol do,? sib
   la sol' fad sol do, sib
   la sib sol' sib, la fad'\mbreak

   %22
   sol4 r r
   R2.*3
   r4 r8 re\p mib re

   %27
   mib re r re mib re
   mib re r re mib re
   mib la la(fad) fad(do)\mbreak

   %30
   do(la') la(do,) do(sib)
   sib2 r4
   R2.

   %33
   fa'8\p fa fa fa fa fa
   do4 la r
   R2.

   %36
   sib'8 \p sib sib sib sib sib
   sib la sol fa mib re
   do4 r r

   %39
   R2.*3
   sib8\p sib sib sib sib sib
   sib,4 r r

   %44
   sib''8\f sib sib sib sib sib
   sib sib sib sib sib sib
   la sol fa mib re do

   %47
   re do sib4 r
   sib\p do2~
   do4 re2~\mbreak

   %50
   re4 mi?2
   mi4 r r
   r r8 fa\p mi fa

   %53
   sol fa r fa mi fa
   sol fa r4 r
   la8\f la la la la la

   %56
   la4 re,r
   R2.*2
   re'8 re re re re re\mbreak

   %60
   re re re re re re
   re4 re, r
   la'8 la la la la la

   %63
   sib4 r8 sol\p lab sib
   lab(sol fad sol mib re)
   do sib' lab sol fad sol

   %66
   do, sib' lab sol fad sol
   la?4 re, r
   r r8 re mib re

   %69
   mib re r re mib re\mbreak
   mib re r la' sib la
   sib la r la sib la

   %72
   sib la r  si do si
   do sib! la sib do sib
   do sib la sib la sol

   %75
   fad re re re re re
   re re re re re re
   do do do do do do

   %78
   do do do do sib sib
   sib sib la la la la\mbreak
   sib re re re re re

   %81
   re re re re re re
   do do do do do do
   do do do do sib sib

   %84
   sib sib la la la la
   sib4 r r
   la8\f la la la la la

   %87
   sib sib sib sib sib sib
   la la la la la la
   sib2.\fermata

}

IvlIIn = \relative do'' {

   R2.*5
   re8 re re re re re
   re re re re re re

   %8
   do sib la sol fa mi
   fa re re'[sol, fad sol]
   fad sol re'[fad, re' do]\mbreak

   %11
   sib4 sol r
   sol8 la sib do re mib
   la,4 sib8 do re mib

   %14
   re sol, r fad' sol fad
   sol fad r sol mib mi
   re8 mi fa sol la sib

   %17
   la4 re, r
   R2.
   r4 r8 re mib re

   %20
   mib re r re mib re
   mib re r mib la, re\mbreak
   sib4 r r

   %23
   R2.
   re8 re re re re re
   sol,2 r4

   %26
   r r8 sib\p la sib
   do sib r sib la sib
   do sib r sib do sib

   %29
   do4 mib2~
   mib2.
   re8(sol,) sol(re') re(mib)

   %32
   mib(sol) sol(mib) mib(re)
   do4 r r
   R2.

   %35
   fa8\p fa fa fa fa fa
   re4 sib r
   R2.*3\mbreak

   %40
   sib8 sib sib sib sib sib
   sib,4 r r
   R2.

   %43
   fa''8\f fa fa fa fa fa
   re la sib do re mib
   re la sib do re mib

   %46
   fa mib re do sib la
   sib la sib4 r
   sol2.\p

   %49
   la\mbreak
   sib
   la4 r r

   %52
   r r8 re dod re
   mi re r re dod re
   sib' la r4 r

   %55
   R2.*2
   mi8\f mi mi mi mi mi
   mi4 fad8 sol la sib

   %59
   la re, r sib' la sib\mbreak
   do sib r sib la sib
   la4 r r

   %62
   fad8 fad fad fad fad fad
   sol4 r8 sol lab sib
   lab(sol fad sol mib re)

   %65
   do sib' lab sol fad sol
   do, sib' lab sol fad sol
   la?4 re, r

   %68
   r r8 sib do sib
   do sib r sib do sib\mbreak
   do sib r fad' sol fad

   %71
   sol fad r fad sol fad
   sol fad r sol fad sol
   la(sol fad sol la sol)

   %74
   la(sol fad sol fa mib)
   re4 r r
   R2.

   %77
   sol,8 sol sol sol la la
   la la la fad re re
   mib mib fad fad fad fad\mbreak

   %80
   re4 r r
   R2.
   sol8 sol sol sol la la

   %83
   la la la fad re re
   mib mib fad fad fad fad
   sol\f sol sol sol sol sol

   %86
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   sol sol fad fad fad fad

   %89
   sol2.\fermata

}

IvlaIn = \relative do' {

   R2.*10
   sol'8 sol sol sol sol sol
   sol sol sol sol sol sol

   %13
   fa mib re do sib la
   sib sol sol' re dod re
   dod re sol sol, dod dod

   %16
   re2 r4
   re8 mi fa sol la sib
   mi,4 fa8 sol la sib

   %19
   la re, r sib la sib
   do sib r sib la sib
   do sib sib[sol' fad la,]\mbreak

   %22
   sol4 r r
   R2.*2
   sol'8 sol sol sol sol sol

   %26
   re4 r8 sol\p fad sol
   fad sol re sol fad sol
   fad sol re sol fad sol

   %29
   do,4 do'2\mbreak
   la2.
   sib4 re, sol

   %32
   sol8 sol sol sol sol sol
   do,4 r r
   R2.

   %35
   re'8\p re re re re re
   sib4 fa r
   R2.*4

   %41
   sib8 sib sib sib sib sib
   sib,4 r r
   R2.

   %44
   sib8 [do] re mib fa sol
   fa4 sib, r
   fa'8 fa fa fa fa fa

   %47
   fa fa fa fa fa sib,
   R2.*8
   re'8\f re re re re re

   %57
   re re re re re re
   do sib la sol fad mi
   fad re re' sol, fad sol\mbreak

   %60
   fad sol re' sol, fad sol
   fad4 r r
   re8 re re re re re

   %63
   re8 re re r r4
   mib4\p r r
   fad r r

   %66
   fad? r r
   fa?8 fa fa fa fa fa
   re8 sol, sol sol sol sol

   %69
   sol sol sol sol sol sol\mbreak
   sol re' re re re re
   re re re re re re

   %72
   re re re re re re
   re re re re re re
   re re re re re re

   %75
   re4 r r
   R2.*2
   re8 re re re sol, sol

   %79
   do do re re re, re\mbreak
   sol4 r r
   R2.*2

   %83
   re'8 re re re sol, sol
   do do re re re, re
   sol4 r r

   %86
   R2.
   mi'8\f mi mi mi mi mi
   la, la la re re re

   %89
   re2.\fermata

}

Ivocen = \relative do' {

  \autoBeamOff
  R2.*21
  sol'4 sol8 la sib la
  sol[fad] sol2

  %24
  fad8[mi] re do' sib la
  sib8. la16 sol2
  r8 la fad[sol] do[sib]

  %27
  la[sol fad sol] do[sib]
  la[sol fad sol] do sib
  la2 r4

  %30
  do re, la'
  sib2.~
  sib8[sol16 la sib8 sol sol fa]

  %33
  mib4. do8[mib sol]
  la[fa16 sol la8 fa fa mib]
  re4. re16[mib fa8 sol16 la]

  %36
  sib4 fa r
  r r8 la la sib
  do[la] fa la la sib

  %39
  do[la fa mib?] re mib!\mbreak  %% fine p. 5
  mib?4\tr(re) r8 sib'
  sol4\tr fa r8 sib

  %42
  sol4\tr fa r8 sib
  re, sib' do,2\tr
  sib r4

  %45
  R2.*2
  r4 r8 fa' mib re
  sol[fa] sol sol fa mib

  %49
  la[sol] la la sol fa\mbreak
  sib8[la sol fa mi? re]
  dod[re mi sol fa mi]

  %52
  fa[re la' re, dod re]
  mi[re la' re, dod re]
  sib'4 la r8 sol

  %55
  fa re mi2\tr
  re r4
  R2.*4

  %61
  fad4 fad8. sol16 la8. sib16
  la8[fad] re2
  r4 r8 sol lab sib

  %64
  lab[(sol fad sol mib re)]
  do[sib' lab sol fad sol]
  do,[sib' lab sol fad sol]

  %67
  la?4 re, r
  r r8 re mib re
  mib re r re mib re\mbreak

  %70
  mib re r la' sib la
  sib la r la sib la
  sib la r si do si

  %73
  do[sib! la sib do sib]
  do[sib la sib la sol]
  fad[mi?] re4 r

  %76
  mi! mi mi
  mi4. fad?16 [mi] la8 [sol]
  fad4 mi8 re sib'4~

  %79
  sib8 sol fad2\tr\mbreak
  sol r4
  mi mi mi

  %82
  mi4. fad?16[mi] la8[sol]
  fad4 mi8 re sib'4~
  sib8 sol fad2

  %85
  sol4 r r
  R2.*4

}

Itesto = \lyricmode {

   Salve _ Regina _ _ Ma ter _ Mater misericordiae, _ _ _ _ _ vita _

   dulce - - - do et spes spes nostra _ sal - - -  - - - ve

   Regina _ _ Mater _ vita _ dulce - do et spes Regina _ _ spes nostra _ spes

   nostra _ salve _

   Salve _ Regina _ _ Regina _ _ Mater _ vita _ dul  -- ce - - - - do spes nostra _

   salve _

   Salve _ Regina _ _ Mater _ vita _ dulce - - - - do

   Regina _ _ Mater _ vita _ dul -- cedo _ vita _ dul -- cedo _ spes nostra _

   salve _ spes nostra _ sal - - ve Spes nostra _ sal - - - ve spes no -- stra sal -- ve

   Spes nostra _ sal - - - ve spes nostra _ sal -- ve.

}

IbcIn = \relative do {

   R2.*15
   re'8 re re re re re
   re re re re re re

   %18
   do sib la sol fa mi
   fa re re' sol, fad sol
   fad sol re' sol, fad sol

   %21
   fad sol sib, do re re,\mbreak
   sol4 r r
   sol'8 sol sol sol sol sol

   %24
   re2 r4
   R2.*4
   fad8 fad fad fad fad fad\mbreak

   %30
   fad? fad fad fad fad fad
   sol2.~
   sol

   %33
   la
   fa?8 fa fa fa fa fa
   sib,2.~

   %36
   sib
   r8 fa' fa fa fa fa
   fa fa fa fa fa fa

   %39
   fa mib re do sib la\mbreak
   sib2.~
   sib~

   %42
   sib~
   sib4 fa' fa,
   sib r r

   %45
   sib8 do re mib fa sol
   fa4 fa4. fa8
   sib4 sib, r

   %48
   mib mib, r
   fa' fa, r\mbreak
   sol' sol, r

   %51
   la'8 la la la la la
   re,4 r8 re la re
   dod re r re la re

   %54
   dod dod re re la la
   re4 la'la,
   re r r

   %57
   R2.*2
   r8 re' fad, sol re sol,\mbreak
   re' sol fad sol re sol,

   %61
   re'2 r4
   re8 re re re re re
   sol, sol sol sib la sol

   %64
   do4 r r
   re r r
   re r r

   %67
   re8 re re re re re
   sol sol sol sol sol sol
   sol sol sol sol sol sol\mbreak

   %70
   sol sol, r4 r
   R2.*8
   do8 do re re re, re\mbreak

   %81
   sol4 r  r
   R2.*3
   do8 do re re re, re

   %86
   sol4 r r
   R2.
   dod8 dod dod dod dod dod

   %88
   re re re re re, re
   sol2.\fermata

}

IbfIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2.*15
  <_->2.
  s2.*2
  s4 <_+> <7>
  <7> s <7>
  <7> s8 <_-> <_+> s
  s2.*2
  <_+>2.
  s2.*4
  <7 5>2.
  s
  s
  <6->
  <6 5->
  s2.*6
  <6 4->4 <4 3>2
  <6 4->4 <5 3> s
  <6 4-> <5 3> s
  s2.*5
  s4 <6> s
  s <6> s
  s <6> s
  <_+>2.
  s2 <_+>4
  s2 <_+>4
  <7>2.
  s2.*9
  <6->2.
  <7 _+>2.
  s2.
  s
  s2 <6 4->8 <5 3>
  <6 4-> <5 3> s s <6 4-> <5 3>
  <6 4-> <5 3> s2
  s2.*8
  <7>4 <_+> s
  s2.*4
  <7 _->4 <_+> s
  s2.
  s
  <7>
  <5 4>4 <3+> s

}

IvlIIIn = \relative do'' {

   sol'8 sol sol sol sol sol
   sol sol sol  sol sol sol
   fa mib re do sib la

   %4
   sib[sol] sol' re dod re
   dod re sol sol, sib do?
   re4 re, r

   %7
   re'8 mi? fa sol la sib
   mi,4 fa8 sol la sib
   la re, r re mib re

   %10
   mib re r la fad re\mbreak
   sol la sib do re mib
   re4 sol, r

   %13
   R2.
   r4 r8 la' sib la
   sib la r sib la sol

   %16
   fa dod re mi? fa sol
   fa dod re mi fa sol
   la2 r4

   %19
   r8 la fad sol do,? sib
   la sol' fad sol do, sib
   la sib sol' sib, la fad'\mbreak

   %22
   sol4 r r
   R2.*21
   sib8\f sib sib sib sib sib

   %45
   sib sib sib sib sib sib
   la sol fa mib re do
   re do sib4 r

   %48
   R2.*7
   la'8\f la la la la la

   %56
   la4 re,r
   R2.*2
   re'8 re re re re re\mbreak

   %60
   re re re re re re
   re4 re, r
   la'8 la la la la la

   %63
   sib4 r r
   R2.*22
   la,8\f la la la la la

   %87
   sib sib sib sib sib sib
   la la la la la la
   sib2.\fermata

}

IvlIVn = \relative do'' {

   R2.*5
   re8 re re re re re
   re re re re re re

   %8
   do sib la sol fa mi
   fa re re'[sol, fad sol]
   fad sol re'[fad, re' do]\mbreak

   %11
   sib4 sol r
   sol8 la sib do re mib
   la,4 sib8 do re mib

   %14
   re sol, r fad' sol fad
   sol fad r sol mib mi
   re8 mi fa sol la sib

   %17
   la4 re, r
   R2.
   r4 r8 re mib re

   %20
   mib re r re mib re
   mib re r mib la, re\mbreak
   sib4 r r

   %23
   R2.
   re8 re re re re re
   sol,2 r4

   %26
   R2.*17
   fa'8\f fa fa fa fa fa
   re la sib do re mib

   %45
   re la sib do re mib
   fa mib re do sib la
   sib la sib4 r

   %48
   R2.*9
   mi8\f mi mi mi mi mi
   mi4 fad8 sol la sib

   %59
   la re, r sib' la sib\mbreak
   do sib r sib la sib
   la4 r r

   %62
   fad8 fad fad fad fad fad
   sol4 r r
   R2.*21

   %85
   sol,8\f sol sol sol sol sol
   sol sol sol sol sol sol
   sol sol sol sol sol sol

   %88
   sol sol fad fad fad fad
   sol2.\fermata

}

IvlaIIn = \relative do' {

   R2.*10
   sol'8 sol sol sol sol sol
   sol sol sol sol sol sol

   %13
   fa mib re do sib la
   sib sol sol' re dod re
   dod re sol sol, dod dod

   %16
   re2 r4
   re8 mi fa sol la sib
   mi,4 fa8 sol la sib

   %19
   la re, r sib la sib
   do sib r sib la sib
   do sib sib[sol' fad la,]\mbreak

   %22
   sol4 r r
   R2.*2
   sol'8 sol sol sol sol sol

   %26
   re4 r r
   R2.*17
   sib8 [do] re mib fa sol

  %45
   fa4 sib, r
   fa'8 fa fa fa fa fa
   fa fa fa fa fa sib,

   %48
   R2.*8
   re'8\f re re re re re

   %57
   re re re re re re
   do sib la sol fad mi
   fad re re' sol, fad sol\mbreak

   %60
   fad sol re' sol, fad sol
   fad4 r r
   re8 re re re re re

   %63
   re4 r r
   R2.*23
   mi8\f mi mi mi mi mi

   %88
   la, la la re re re
   re2.\fermata

}

IbcIIn = \relative do {

   R2.*15
   re'8 re re re re re
   re re re re re re

   %18
   do sib la sol fa mi
   fa re re' sol, fad sol
   fad sol re' sol, fad sol

   %21
   fad sol sib, do re re,\mbreak
   sol4 r r
   sol'8 sol sol sol sol sol

   %24
   re2 r4
   R2.*19
   sib4 r r

   %45
   sib8 do re mib fa sol
   fa4 fa4. fa8
   sib4 sib, r

   %48
   R2.*11
   r8 re' fad, sol re sol,\mbreak
   re' sol fad sol re sol,

   %61
   re'2 r4
   re8 re re re re re
   sol,4 r r

   %64
   R2.*23
   dod8 dod dod dod dod dod

   %88
   re re re re re, re
   sol2.\fermata

}

IbfIIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2.*15
  <_->2.
  s2.*2
  s4 <_+> <7>
  <7> s <7>
  <7> s8 <_-> <_+> s
  s2.*2
  <_+>2.
  s2.*62
  <7>2.
  <5 4>4 <3+> s

}

forma = {

  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \key fa\major
  \tempo 2 = 35
  s2.*89
  \bar "|."

}

IvlI = {
  \Iglobal
  <<\IvlIn\forma>>
}

IvlII = {
  \Iglobal
  <<\IvlIIn\forma>>
}

IvlaI = {
  \Iglobal
  \clef alto
  <<\IvlaIn\forma>>
}

Ivoce = {
  \new Voice = "salve"
  \Iglobal
  \clef alto
  <<\Ivocen\forma>>
}

IbcI = {
  \Iglobal
  \clef bass
  <<\IbcIn\forma\IbfIn>>
}

IvlIII = {
  \Iglobal
  <<\IvlIIIn\forma>>
}

IvlIV = {
  \Iglobal
  <<\IvlIVn\forma>>
}

IvlaII = {
  \Iglobal
  \clef alto
  <<\IvlaIIn\forma>>
}

IbcII = {
  \Iglobal
  \clef bass
  <<\IbcIIn\forma\IbfIIn>>
  \set Score.skipTypesetting = ##f

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
   \override TupletNumber #'transparent = ##t
   \override TupletBracket #'bracket-visibility = ##f
   \senza
   %\set Score.skipTypesetting = ##t

}

IIvlIn = \relative do'' {

   re8
   la'(sib) re,-.\noBeam
   dod-. re-. r
   R4.*2

   %5
   re16 re re re do do
   sib sib sib sib la la
   sol sol sol sol fa fa

   %8
   mi mi fa fa re re
   la'8 la, r
   \tuplet 3/2 { mi''16 fad sol mi[fad sol] mi fad sol }

   %11
   fad4 r8
   \tuplet 3/2 { sol16 la sib sol[la sib] sol la sib }\mbreak
   mi,4 r8

   %14
   \con\terzine\tuplet 3/2 { la16 (sol fa~) } fa8\noBeam  \tuplet 3/2 { sol16(fa mi) }
   fa4 r8
   \senza \tuplet 3/2 { la,16(sol fa)~} fa8\noBeam \tuplet 3/2 { sol16(fa mi)}
   fa4 r8

   %18
   r r re'\p
   la'(sib) re,\noBeam
   dod re r

   %21
   re16\f re re re do do
   sib sib sib sib la la\mbreak
   sol sol sol sol fa fa

   %24
   mi mi fa fa re re
   la'8 la, r
   \tuplet 3/2 { fad''16\p(sol la) fad[(sol la)] \once\slurDashed fad (sol la)}

   %27
   sib4 r8
   \tuplet 3/2 { mi,16 fa? sol mi[fa sol] mi fa sol }
   la4 r8

   %30
   \tuplet 3/2 { re,16 mib fa re[mib fa] re mib fa }\mbreak
   sol4 r8
   R4.*2

   %34
   sib,16\f sib sib sib la la
   sol sol sol sol fa fa
   mib mib mib mib re re

   %37
   do do re re sib sib
   fa'8 fa r
   R4.*3

   %42
   sib16 sib sib sib la la
   sol sol sol sol fa fa
   mib mib re re sib' sib

   %45
   mib, mib do do fa fa
   sib,4 r8
   sib''4 r8

   %48
   sib4 r8
   sib16 sib fa fa re re\mbreak
   \tuplet 3/2 {
      re16\p mib fa re[mib fa] re mib fa

      %51
      re mib fa re[mib fa] re mib fa
   }
   mib4 r8
   \tuplet 3/2 {
      do16 re mib do[re mib] do re mib
      do re mib? do[re mib] do re mib
   }

   %55
   re4 r8
   R4.
   mib8 sol r

   %58
   mib8 la r\mbreak
   fa8 sib r
   fa sib r
   do, la' r

   %62
   do, la' r
   re, sol r
   re sol r

   %65
   mi la r
   re,16\f re re re do do
   sib sib sib sib la la

   %68
   sol sol sol sol fa fa\mbreak
   mi mi fa fa re re
   la'8 la, r

   %71
   \con \tuplet 3/2 { la''16\p(sol fa)~}  fa8\noBeam \tuplet 3/2 { sol16(fa mi) }
   fa4 r8
   R4.*2

   %75
   re,16 re fa fa la la
   re\f re re re do do
   sib sib sib sib la la

   %78
   sol sol sol sol fa fa\mbreak
   mi mi fa fa re re
   la'8 si16 dod re8

   %81
   sol, la4\tr
   re,16 re' fa[la fa re]
   mi dod mi la mi dod

   %84
   \senza \tuplet 3/2 { la'(sol fa~) } fa8\noBeam \tuplet 3/2 {
      sol16 (fa mi)
      fa(mi re)~
   }re8\noBeam \tuplet 3/2 { mi16 (re dod) }
   re8 fa, mi

   %87
   re4.\fermata

}

IIvlIIn = \relative do'' {

   re8
   fa(sol) fa,-.
   mi-. fa-. r
   R4.*2

   %5
   re'16 re re re do do
   sib sib sib sib la la
   sol sol sol sol fa fa

   %8
   mi mi fa fa re re
   la'8 la, r
   \senza \tuplet 3/2 { dod'16 re mi dod[re mi] dod re mi }

   %11
   re4 r8
   \tuplet 3/2 { sib16 do? re mi[fa sol] mi fa sol }\mbreak
   dod,4 r8

   %14
   \con \tuplet 3/2 { fa16(mi re)~ } re8\noBeam \tuplet 3/2 { mi16(re dod) }
   re4 r8
   \senza \tuplet 3/2 { fa,16(mi re)~ } re8\noBeam \tuplet 3/2 { mi16(re dod) }

   %17
   re4 r8
   r r fa'\p
   fa(sol) fa,

   %20
   mi fa r
   re'16\f re re re do do
   sib sib sib sib la la\mbreak

   %23
   sol sol sol sol fa fa
   mi mi fa fa re re
   la'8 la, r

   %26
   \tuplet 3/2 { re'16\p(mi fa) re[(mi fa)] re (mi fa) }
   re4 r8
   \tuplet 3/2 { do16 re mi do[re mi] do re mi }

   %29
   do4 r8
   \tuplet 3/2 { sib16 do re sib[do re] sib do re }\mbreak
   sib4 r8

   %32
   R4.*2
   sib16\f sib sib sib la la
   sol sol sol sol fa fa
   mib mib mib mib re re

   %37
   do do re re sib sib
   fa'8 fa r
   R4.*3

   %42
   sib16 sib sib sib la la
   sol sol sol sol fa fa
   mib mib re re sib' sib

   %45
   mib, mib do do fa fa
   sib,4 r8
   fa''4 r8

   %48
   fa4 r8
   fa16 fa re re sib sib\mbreak
   \tuplet 3/2 { si16 \p do re si[do re] si do re

   %51
   si? do re si[do re] si do re}
   do4 r8
   \tuplet 3/2 { la16 sib? do la[sib do] la sib do

   %54
   la sib do la[sib do] la sib do}
   sib4 r8
   R4.

   %57
   sib8 mib r
   do mib r\mbreak
   re fa r

   %60
   re fa r
   la, fa' r
   la, fa' r

   %63
   sol, re' r
   sib mi r
   dod mi r

   %66
   re16\f re re re do do
   sib sib sib sib la la

   %68
   sol sol sol sol fa fa\mbreak
   mi mi fa fa re re
   la'8 la, r

   %71
   \tuplet 3/2 { fa''16\p(mi re)~ } re8\noBeam \tuplet 3/2 { mi16 (re dod) }
   re4 r8
   R4.*2

   %75
   re,16 re fa fa la la
   re\f re re re do do
   sib sib sib sib la la

   %78
   sol sol sol sol fa fa\mbreak
   mi mi fa fa re re
   la'8 si16 dod re8

   %81
   sol, la4\tr
   re,16 la' re fa re la
   dod la dod mi dod la

   %84
   \tuplet 3/2 { fa'(mi re)~ } re8\noBeam \tuplet 3/2 { mi16(re dod) }
   re8 fa, \tuplet 3/2 { sol16[(fa mi)] }
   fa8 re dod

   %87
   re4.\fermata

}

IIvlaIn = \relative do' {

   r8
   re re r
   dod la r
   R4.*2

   %5
   re'16 re re re do do
   sib sib sib sib la la
   sol sol sol sol fa fa

   %8
   mi mi fa fa re re
   la'8 la, r
   la' la la

   %11
   la4 r8
   sib sib sib\mbreak
   la4 r8

   %14
   la la dod
   la4 r8
   la, la dod

   %17
   la4 r8
   R4.
   re8\p re r

   %20
   dod la r
   re'16\f re re re do do
   sib sib sib sib la la\mbreak

   %23
   sol sol sol sol fa fa
   mi mi fa fa re re
   la'8 la, r

   %26
   la'8\p la la
   sol4 r8
   sol sol sol

   %29
   fa4 r8
   fa fa fa\mbreak
   mib4 r8

   %32
   R4.*2
   sib'16\f sib sib sib la la
   sol sol sol sol fa fa
   mib mib mib mib re re

   %37
   do do re re sib sib
   fa'8 fa, r
   R4.*3

   %42
   sib'16 sib sib sib la la
   sol sol sol sol fa fa
   mib mib re re sib' sib

   %45
   mib, mib do do fa fa
   sib,4 r8
   re'4 r8

   %48
   re4 r8
   re16 re sib sib fa fa\mbreak
   sol8\p sol sol

   %51
   sol sol sol
   sol4 r8
   fa fa fa

   %54
   fa fa fa
   fa4 r8
   R4.

   %57
   sol8 sib r
   la do r\mbreak
   sib re r

   %60
   sib re r
   fa, do' r
   fa, do' r

   %63
   sib, sib' r
   sol sib r
   la dod r

   %66
   re16\f re re re do do
   sib sib sib sib la la

   %68
   sol sol sol sol fa fa\mbreak
   mi mi fa fa re re
   la'8 la, r

   %71
   la'\p la dod
   la4 r8
   R4.*2

   %75
   re,16 re fa fa la la
   re\f re re re do do
   sib sib sib sib la la

   %78
   sol sol sol sol fa fa\mbreak
   mi mi fa fa re re
   la'8 si16 dod re8

   %81
   sol, la4\tr
   re,8 la' la
   la la la

   %84
   la la dod
   la la, la
   la la la

   %87
   fa4.\fermata

}

IIvocen = \relative do' {

   \autoBeamOff
   r8
   R4.*17
   r8 r re
   la'[sib] re,

   %20
   dod re r
   re'8.  re16 do8
   sib8. sib16 la8\mbreak

   %23
   sol8. sol16 fa8
   mi fa re
   la' la, r

   %26
   re fad la
   sib~\senza \tuplet 3/2 { sib16[la sol] sol[fa mi]}
   mi8.[do16 mi sol]

   %29
   la8~\tuplet 3/2 { la16[sol fa] fa[mi re] }
   re8.[sib16 re fa]\mbreak
   sol8~\tuplet 3/2 { sol16 [mib fa] sol[fa mib] }

   %32
   la8~\tuplet 3/2 { la16[fa sol] la[sol fa] }
   sib8 sib, r
   sib'8. sib16 la8

   %35
   sol8. sol16 fa8
   mib8. mib16 re8
   do re sib

   %38
   fa' fa r
   fa16[sib] la[sol] fa[mib]\mbreak
   re8[fa sib]

   %41
   sib,16 do do4\tr
   sib r8
   R4.*3

   %46
   fa'8 sib fa
   re16[sib re fa sib fa]
   re[sib re fa sib fa]

   %49
   re[do] sib8 r\mbreak
   sol'8. lab16 sol8
   fa fa fa

   %52
   mib16[re] mib8 r
   fa8. sol16 fa8
   mib mib mib

   %55
   re16[do] re8 r
   re fa sib
   sol16[mib sol sib sol mib]

   %58
   do'[sib la sol fa mib]\mbreak
   fa[re fa sib fa re]
   sib'[la sol fa mib re]

   %61
   mib[do mib la mib do]
   la'[sol fa mib re do]
   re[sib re sol re sib]

   %64
   sib'[la sol fa mi? re]
   dod8.\tr[si16] la8
   R4.

   %67
   sib'8. sib16 la8
   sol8. sol16 fa8\mbreak
   mi fa re

   %70
   la' la, r
   la'8. la16 la8
   la8. la16 la8

   %73
   re do16[sib] la[sol]
   \tuplet 3/2 { fa[mi re] } mi4\tr
   re r8

   %76
   re'8. re16 do8
   sib8. sib16 la8
   sol8. sol16 fa8\mbreak

   %79
   mi8. mi16 re8
   la' si16[dod] re8
   sol, la4\tr

   %82
   re, r8
   R4.*5

}

IItesto = \lyricmode {

   Ad te cla -- mamus _ exules _ _ exules _ _ filii _ _ filii _ _ Hevae _

   ad te clama - - - - - - - - - - - mus exules _ _ exules _ _ filii _ _ filii _ _ Hevae _

   exules _ _ fi -- lii _ He -- vae.

   Ad te clama - - - mus exules _ _ filii _ _ Hevae  _   exules _ _ filii _ _ Hevae  _

   ad te clama - - - - - - - - - mus exules _ _  exules _ _ filii _ _ Hevae  _

   exules _ _ filii _ _ filii _ _ He - vae  exules _ _ exules _ _ filii _ _ filii _ _ Hevae _

   filii _  He -- vae.




}

IIbcIn = \relative do {

   r8
   re8 sol r
   la re, r
   R4.*2

   %5
   re'4\f  do8
   sib4 la8
   sol4 fa8

   %8
   mi fa re
   la' la, r
   la'\p la la

   %11
   re,4 r8
   sol,8 sol sol\mbreak
   la4 r8

   %14
   re8 la' la,
   re4 r8
   re8 la' la,

   %17
   re4 r8
   R4.
   re8 sol r

   %20
   la, re r
   re'4\f do8
   sib4 la8\mbreak

   %23
   sol4 fa8
   mi fa re
   la' la, r

   %26
   re8\p re re
   sol4 r8
   do,8 do do

   %29
   fa4  r8
   sib,8 sib sib\mbreak
   mib4 r8

   %32
   R4.*2
   sib'4\f la8
   sol4 fa8

   %36
   mib4 re8
   do re sib
   fa' fa, r

   %39
   sib\p fa' la,\mbreak
   sib4 r8
   mib fa fa,

   %42
   sib'4 la8
   sol4 fa8
   mib re sib'

   %45
   mib, do fa
   sib,4 r8
   sib4 r8

   %48
   sib4 r8
   sib8 sib sib\mbreak
   sol'\p sol sol

   %51
   sol, sol sol
   do4 r8
   fa8 fa fa

   %54
   fa, fa fa
   sib4 r8
   sib re sib

   %57
   r mib mib,
   r fa' fa,\mbreak
   r sib' sib,

   %60
   r sib' sib,
   r la' la,
   r la' la,

   %63
   r sib' sib,
   r sol' sol,
   r la' la,

   %66
   re'4\f do8
   sib4 la8
   sol4 fa8\mbreak

   %69
   mi fa re
   la' la, r
   re\p la' la,

   %72
   re4 r8
   re4 dod8
   re8 la' la,

   %75
   re fa la
   re4\f do8
   sib4 la8

   %78
   sol4 fa8\mbreak
   mi4 re8
   la' si16 dod re8

   %81
   sol, la la,
   re re re
   la' la, la

   %84
   re la' la,
   re la' la,
   re la' la,

   %87
   re4.\fermata

}

IIbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s8
   s4.
   <_+>
   s4.*7
   <_+>4.
   <_+>
   <5>8 <6>4
   s4.
   s8 <6 4> <5 3+>
   s4.
   s8 <6 4> <5 3+>
   s4.*3
   <_+>4.
   s4.*5
   <_+>4.
   s4.*25
   <_->4.
   s
   <7->
   s4.*3
   s8 <7 >4
   s4.
   s
   s8 <6 5->4
   s4.
   s
   s8 <6>4
   s8 <_+>4
   s4.*5
   s8 <6 4> <5 3+>
   s4.*11
   <_+>4.
   s8 <6 4> <5 3+>
   s <6 4> <5 3+>
   s8 <6 4> <5 3+>

}

IIvlIIIn = \relative do'' {

   r8
   R4.
   r8 r re
   la'(sib) re,-.\noBeam

   %4
   dod-. re-. r
   re16 re re re do do
   sib sib sib sib la la

   %7
   sol sol sol sol fa fa
   mi mi fa fa re re
   la'8 la, r

   %10
   R4.
   \tuplet 3/2 { la'16 sib do la[sib do] la sib do}
   sib4 r8\mbreak

   %13
   \tuplet 3/2 { dod16 re mi dod[re mi] dod re mi }
   re4 r8
   \tuplet 3/2 { la'16(sol fa)~ } fa8\noBeam \tuplet 3/2 { sol16(fa mi) }

   %16
   fa4 r8
   \tuplet 3/2 { la,16(sol fa)~ } fa8\noBeam \tuplet 3/2 { sol16(fa mi) }
   fa4 r8

   %19
   R4.*2
   re'16\f re re re do do
   sib sib sib sib la la\mbreak

   %23
   sol sol sol sol fa fa
   mi mi fa fa re re
   la'8 la, r

   %26
   R4.
   \tuplet 3/2 { sib'16\p(do re) sib[(do re)] sib(do re) }
   mi!4 r8

   %29
   \tuplet 3/2 { la,16 sib do la[sib do] la sib do }
   re4 r8\mbreak
   \tuplet 3/2 { mib16 fa sol mib[fa sol] mib fa sol

   %32
   do, re mib do[re mib] do re mib}
   fa8 sib, r
   sib16\f sib sib sib la la

   %35
   sol sol sol sol fa fa
   mib mib mib mib re re

   %37
   do do re re sib sib
   fa'8 fa r
   R4.*3

   %42
   sib16 sib sib sib la la
   sol sol sol sol fa fa
   mib mib re re sib' sib

   %45
   mib, mib do do fa fa
   sib,4 r8
   sib''4 r8

   %48
   sib4 r8
   sib16 sib fa fa re re\mbreak
   R4.*2

   %52
   \tuplet 3/2 { mib16\p fa sol mib[fa sol] mib fa sol }
   mib4 r8
   R4.

   %55
   \tuplet 3/2 { re16 mib fa re[mib fa] re mib fa }
   re4 r8
   R4.*9

   %66
   re16\f re re re do do
   sib sib sib sib la la

   %68
   sol sol sol sol fa fa\mbreak
   mi mi fa fa re re
   la'8 la, r

   %71
   R4.
   \tuplet 3/2 { la''16\p(sol fa)~ } fa8\noBeam \tuplet 3/2 { sol16(fa mi)}
   fa4 r8
   R4.

   %75
   re,8 fa la
   re4\f do8
   sib4 la8

   %78
   sol4 fa8\mbreak
   mi4 re8
   la' si16 dod re8

   %81
   sol, la la,
   re16 re' fa[la fa re]
   mi dod mi la mi dod

   %84
   \senza \tuplet 3/2 { la'(sol fa~) } fa8\noBeam \tuplet 3/2 {
      sol16 (fa mi)
      fa(mi re)~
   }re8\noBeam \tuplet 3/2 { mi16 (re dod) }
   re8 fa, mi

   %87
   re4.\fermata

}

IIvlIVn = \relative do'' {

   r8
   R4.
   r8 r re
   fa(sol) fa,-.

   %4
   mi-. fa-. r
   re'16 re re re do do
   sib sib sib sib la la

   %7
   sol sol sol sol fa fa
   mi mi fa fa re re
   la'8 la, r

   %10
   R4.
   \tuplet 3/2 { fad'16 sol la fad[sol la] fad sol la }
   sol4 r8\mbreak

   %13
   \tuplet 3/2 { la16 si dod la[si dod] la si dod }
   la4 r8
   \tuplet 3/2 { fa'16(mi re)~ } re8\noBeam \tuplet 3/2 { mi16 (re dod) }

   %16
   re4 r8
   \tuplet 3/2 { fa,16(mi re)~ }re8\noBeam \tuplet 3/2 { mi16(re dod) }
   re4 r8

   %19
   R4.*2
   re'16\f re re re do do
   sib sib sib sib la la\mbreak

   %23
   sol sol sol sol fa fa
   mi mi fa fa re re
   la'8 la, r

   %26
   R4.
   \tuplet 3/2 {sol'16\p la sib sol[la sib] sol la sib}
   sol4 r8

   %29
   \tuplet 3/2 { fa16 sol la fa[sol la] fa sol la }
   fa4 r8\mbreak
   \tuplet 3/2 { sol16 la sib sol[la sib] sol la sib

   %32
   la sib do la[sib do] la sib do}
   sib8 fa r
   sib16\f sib sib sib la la

   %35
   sol sol sol sol fa fa
   mib mib mib mib re re

   %37
   do do re re sib sib
   fa'8 fa r
   R4.*3

   %42
   sib16 sib sib sib la la
   sol sol sol sol fa fa
   mib mib re re sib' sib

   %45
   mib, mib do do fa fa
   sib,4 r8
   fa''4 r8

   %48
   fa4 r8
   fa16 fa re re sib sib\mbreak
   R4.*2

   %52
   \tuplet 3/2 { do16\p re mib do[re mib] do re mib }
   do4 r8
   R4.

   %55
   \tuplet 3/2 { sib16 do re sib[do re] sib do re }
   sib4 r8
   R4.*9

   %66
   re16\f re re re do do
   sib sib sib sib la la
   sol sol sol sol fa fa\mbreak

   %69
   mi mi fa fa re re
   la'8 la, r
   R4.

   %72
   \tuplet 3/2 { fa''16\p(mi re)~ } re8\noBeam\tuplet 3/2 { mi16 (re dod) }
   re4 r8
   R4.

  %75
  re,8 fa la
   re4\f do8
   sib4 la8

   %78
   sol4 fa8\mbreak
   mi4 re8
   la' si16 dod re8

   %81
   sol, la la,
   re16 la' re fa re la
   dod la dod mi dod la

   %84
   \tuplet 3/2 { fa'(mi re)~ } re8\noBeam \tuplet 3/2 { mi16(re dod) }
   re8 fa, \tuplet 3/2 { sol16[(fa mi)] }
   fa8 re dod

   %87
   re4.\fermata

}

IIvlaIIn = \relative do' {

   r8
   R4.*2
   re8 re r
   dod la r

   %5
   re'16 re re re do do
   sib sib sib sib la la
   sol sol sol sol fa fa

   %8
   mi mi fa fa re re
   la'8 la, r
   R4.

   %11
   re8 re re
   re4 r8\mbreak
   la' sol sol

   %14
   fa4 r8
   la la dod
   la4 r8

   %17
   la, la dod
   la4 r8
   R4.*2

   %21
   re'16\f re re re do do
   sib sib sib sib la la\mbreak
   sol sol sol sol fa fa

   %24
   mi mi fa fa re re
   la'8 la, r
   R4.

   %27
   re8\p re re
   do4 r8
   do do do

   %30
   sib4 r8\mbreak
   sib sib sib
   fa' fa fa

   %33
   fa re r
   sib'16\f sib sib sib la la
   sol sol sol sol fa fa

   %36
   mib mib mib mib re re
   do do re re sib sib
   fa'8 fa, r
   R4.*3

   %42
   sib'16 sib sib sib la la
   sol sol sol sol fa fa
   mib mib re re sib' sib

   %45
   mib, mib do do fa fa
   sib,4 r8
   re'4 r8

   %48
   re4 r8
   re16 re sib sib fa fa\mbreak
   R4.*2

   %52
   sol8\p sol sol
   la4 r8
   R4.

   %55
   fa8 fa fa
   fa4 r8
   R4.*9

   %66
   re'16\f re re re do do
   sib sib sib sib la la
   sol sol sol sol fa fa\mbreak

   %69
   mi mi fa fa re re
   la'8 la, r
   R4.

   %72
   la'8\p la dod
   la4 r8
   R4.

   %75
   re,16 re fa fa la la
   re\f re re re do do
   sib sib sib sib la la

   %78
   sol sol sol sol fa fa\mbreak
   mi mi fa fa re re
   la'8 si16 dod re8

   %81
   sol, la4\tr
   re,8 la' la
   la la la

   %84
   la la dod
   la la, la
   la la la

   %87
   fa4.\fermata

}

IIbcIIn = \relative do {

   r8
   R4.*2
   re8 sol r
   la re, r

   re'4\f  do8
   sib4 la8
   sol4 fa8

   %8
   mi fa re
   la' la, r
   R4.

   %11
   re8 re re
   sol,4 r8\mbreak
   la la la

   %14
   re4 r8
   re la' la,
   re4 r8

   %17
   re la' la,
   re4 r8
   R4.*2

   %21
   re'4\f do8
   sib4 la8\mbreak
   sol4 fa8

   %24
   mi fa re
   la' la, r
   R4.

   %27
   sol'8\p sol sol
   do,4 r8
   fa fa fa

   %30
   sib,4 r8\mbreak
   mib mib mib
   fa fa mib

   %33
   re sib r
   sib'4\f la8
   sol4 fa8

   %36
   mib4 re8
   do re sib
   fa' fa, r

   %39
   R4.*3
   sib'4 la8
   sol4 fa8
   mib re sib'

   %45
   mib, do fa
   sib,4 r8
   sib4 r8

   %48
   sib4 r8
   sib8 sib sib\mbreak
   R4.*2

   %52
   do8\p do do
   fa4 r8
   R4.

   %55
   sib,8 sib sib
   sib4 r8
   R4.*9

   %66
   re'4\f do8
   sib4 la8
   sol4 fa8\mbreak

   %69
   mi fa re
   la' la, r
   R4.

   %72
   re8 la' la,
   re4 r8
   R4.

   %75
   re8 fa la
   re4\f do8
   sib4 la8

   %78
   sol4 fa8\mbreak
   mi4 re8
   la' si16 dod re8

   %81
   sol, la la,
   re re re
   la' la, la

   %84
   re la' la,
   re la' la,
   re la' la,

   %87
   re4.\fermata

}

IIbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s8
   s4.*3
   <_+>4.
   s4.*6
   <_+>4.
   s
   <_+>8 <7>4
   s4.
   s8 <6 4> <5 3+>
   s4.
   s8 <6 4>  <5 3+>
   s4.*10
   <_!>4.
   s4.*3
   s4 <6 4>8
   s4.*39
   s8 <6 4> <5 3+>
   s4.*10
   <_+>4.
   s8 <6 4> <5 3+>
   s <6 4> <5 3+>
   s8 <6 4> <5 3+>


}

forma = {

   \time 3/8
   \override Staff.TimeSignature.style = #'single-digit
   \key fa\major
   \tempo 4. = 60
   \partial 8 s8
   s4.*87
   \bar "|."

}

IIvlI = {
   \IIglobal
   <<\IIvlIn\forma>>
}

IIvlII = {
   \IIglobal
   <<\IIvlIIn\forma>>
}

IIvlaI = {
   \IIglobal
   \clef alto
   <<\IIvlaIn\forma>>
}

IIvoce = {
   \new Voice = "ad te"
   \IIglobal
   \clef alto
   <<\IIvocen\forma>>
}

IIbcI = {
   \IIglobal
   \clef bass
   <<\IIbcIn\forma\IIbfIn>>

}

IIvlIII = {
   \IIglobal
   <<\IIvlIIIn\forma>>
}

IIvlIV = {
   \IIglobal
   <<\IIvlIVn\forma>>
}

IIvlaII = {
   \IIglobal
   \clef alto
   <<\IIvlaIIn\forma>>
}

IIbcII = {
   \IIglobal
   \clef bass
   <<\IIbcIIn\forma\IIbfIIn>>
   \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  %\set Score.skipTypesetting = ##t

}

IIIvlIn = \relative do'' {

   do8
   fa la r fa r sol r sib
   r sol r la r do r la
   sol[sib,16. la32 sib8 sib'] r la,16. [sol32 la8 la']

  %4
   r sol,16.[fa32 sol8 sol'] la,16\p(fa) la(fa) la(fa) la(fa)
   sol(mi)  sol(mi)  sol(mi)  sol(mi) fa(do) fa(do)  fa(do) fa(do)\mbreak
   la''2\f~la8[sol16 fa mi8 sol]

   %7
   fa4 lab,~lab8[sol16 fa mi8 sol]
   fa4 r8 do'\p fa[la] r fa
   r sol r sol lab2~

   %10
   lab8[sol16 fa mi8 sib'] lab fa r4
   la,16(fa) la(fa) la(fa) la(fa)\mbreak mi do mi do mi do mi do
   fa do fa do fa do fa do sol' mi sol mi r4

   %13
   R1*3
   r2 la16\p(fa) la(fa) la(fa) la(fa)
   mi dod mi dod mi dod mi dod sol' mi sol mi sol mi sol mi

   %18
   fa'2\f~fa8[mi16 re dod8 mi]
   re4 r r2
   sib'2~sib8 \appoggiatura la sol \appoggiatura fa mi re \mbreak

   %21
   re dod r4 la16\p fad la fad la fad la fad
   sol re sol re sol re sol re sol mi sol mi sol mi sol mi  %% inizio p. 22
   fa do fa do fa do fa do fa re fa re fa re fa re

   %24
   sol mi sol mi sol mi sol mi fa'8 la r fa
   r sol r sib r sol r la\mbreak
   r do r la sol sib,16 la sib8 sib'

   %27
   r la,16[sol la8 la'] r sol,16 [fa sol8 sol']
   la,16[fa la fa la fa la fa] sol[mi sol mi sol mi sol mi]
   fa[do fa do fa do fa do] lab''2~

   %30
   lab8 sol16 fa mi8 sol fa do lab'4~
   lab8 sol16 fa mi8 sol\mbreak fa do reb4
   do4 r r2

   %33
   r\fermata do16\f[la do la do la do la]
   sib[sol sib sol sib sol sib sol] la[fa la fa la fa la fa]
   la'8 fa sol mi fa2\fermata

}

IIIvlIIn = \relative do'' {

   la8
   do fa r do r mi r sol
   r mi r fa r la r fa
   mi[sol,16. fa32 sol8 sol'] r fa,16.[mi32 fa8 fa']

   %4
   r mi,16.[re32 mi8 mi'] fa,16\p[(do) fa(do) fa(do) fa(do)]
   mi[(do) mi(do) mi(do) mi(do)] do[(la) do(la) do(la) do(la)]\mbreak
   fa''2\f~fa8[mi16 re do8 mi]

   %7
   fa4 fa,~fa8[mi16 re do8 mi]
   fa4 r8 la\p do fa r do
   r mi r mi fa2~

   %10
   fa8[mi16 re do8 sol'] fa do r4
   fa,16 do fa do fa do fa do\mbreak sol' mi sol mi sol mi sol mi
   la fa la fa la fa la fa mi do mi do r4

   %13
   R1*3
   r2 fa16\p (re) fa(re) fa(re) fa(re)
   dod la dod la dod la dod la mi' dod mi dod mi dod mi dod

   %18
   re'2\f~re8[dod16 si la8 dod]
   re4 r r2
   sol\p~sol8 re si4\mbreak

   %21
   la r fad16\p re fad re fad re fad re
   re sib re sib re sib re sib mi [do mi do mi do mi do]
   do [la do la do la do la] re[sib re sib re sib re sib]

   %24
   mi do mi do mi do mi do do'8 fa r do
   r mi r sol r mi r fa\mbreak
   r la r fa mi[sol,16 fa sol8 sol']

   %27
   r fa,16[mi fa8 fa'] r mi,16[re mi8 mi']
   fa,16 do fa do fa do fa do mi do mi do mi do mi do
   do la do la do la do la fa''2~

   %30
   fa8[mi16 re do8 mi] fa4 fa~
   fa8 [mi16 re do8 mi]\mbreak  fa lab, sib4
   lab r r2

   %33
   r\fermata la?16\f[fa la fa la fa la fa]
   sol[mi sol mi sol mi sol mi] fa [do fa do fa do fa do]
   fa'8 la, sib sol la2\fermata

}

IIIvlaIn = \relative do' {

   r8
   la' do r la r sol r mi
   r mi r do r do r do
   do do do do do do do do

   %4
   do do do do do do do do
   do do do do do do do do\mbreak
   fa fa fa fa si, si do do

   %7
   fa fa fa fa si, si do do
   do4 r la'8\p do r la
   r sol r mi do do do do

   %10
   re re sol, mi' do do r4
   do8 do do do\mbreak do do do do
   do do do do do do do mib

   %13
   R1*3\mbreak
   r2 la,8\p la la la
   la la la la la la la la

   %18
   la\f la la la si si mi [la,]
   la4 r r2
   re8\p re re re re re mi mi\mbreak

   %21
   mi4 r sib8 \p la la la
   re re re re do do do do
   do do do do sib sib sib sib

   %24
   sol sol sol sol la' do r la
   r sol r mi r mi r do\mbreak
   r do r do do do do do

   %27
   do do do do do do do do
   do do do do do do do do
   fa fa fa fa do do do do

   %30
   re re sol, do do do do do
   re re sol, do\mbreak do fa fa fa
   fa4 r r2

   %33
   r\fermata do8\f do do do
   mi mi mi mi do do do do
   do do re do do2\fermata

}

IIIvocen = \relative do' {

  \autoBeamOff
  r8
  R1*7
  r4 r8 do fa la r fa
  sol sib r sol lab2~

  %10
  lab8[sol16 fa] mi8 sib' lab fa r do'
  la?4 la16[ sol la]  sib\mbreak sol4 sol16\tr[fa sol la]
  fa4  fa16[mi fa]  sol mi[re] do8 r do'

  %13
  fad,[la] re, la' sib[la sol fa?]
  mib[do']~\tuplet 3/2 { do16[sib la] sol[fa mib] } re8[sib']~\tuplet 3/2 { sib16[la sol] fa[mib re] }
  do8[la']~la16[fad sol la] sib4 dod\mbreak

  %16
  re16[do?32 sib la16] re, fa8[(mi\tr)] re4 r
  R1
  r2 r4 r8 la'

  %19
  fa la r dod, re16[mi] fa8 r re
  sib'2~sib8[\appoggiatura la sol] \appoggiatura fa mi re\mbreak
  re dod r la' fad4 fad8 fad

  %22
  sol16[fad] sol8 r sib16[sol] mi4 mi8 mi
  fa4 mib re8 fa4 sib8
  mi,16[re] do8 r sol' fa la4 fa8

  %25
  sol [do,] sib'4~sib8[la16 sol] la8[sol16 fa]\mbreak
  do'8[sib16 la sol8 fa] mi16[re] do8 r sib'
  la4 la16\tr [sol la] sib sol4 sol16\tr[fa sol la]

  %28
  fa4 fa16\tr[mi fa sol] mi[do mi sol sib8] la16[sol]
  la[sol] fa8 r do lab'2~
  lab8[sol16 fa] mi8 sol fa do lab'4~

  %31
  lab8 sol16[fa] mi8 sol\mbreak fa8 do reb4
  do sol'8 do, la' sol fa4~
  fa8 sib mi,4\tr\fermata fa r

  %34
  R1*2

}

IIItesto = \lyricmode {

   Ad te suspiramus _ _ _  gemen - tes et flentes _ in hac

   lacry - ma - - - rum valle _ in  hac lacrima - - - - - - - - - - rum valle _

   Ad te suspiramus _ _ _  gemen - tes et flentes _ in hac

   lacry - marum _ in hac lacryma - - - - -  rum valle _

   ad te suspira - - - - - - mus ge -- mentes _ et flen - - - - - - tes gemen - tes et

   flentes _ in hac lacry - marum _ valle _ in hac lacrymarum _ _ _ valle. _

}

IIIbcIn = \relative do {

   r8
   fa r fa r do' r do, r
   do' r fa, r fa, r fa' r
   do' do, do do do do do do

   %4
   do do do do do do do do
   do do do do do do do do\mbreak
   fa fa fa fa si, si do do

   %7
   fa fa fa fa si, si do do
   fa,4 r fa'8 r fa r
   do' r do, r fa fa fa fa

   %10
   si, si do do fa fa mi do
   do do do do\mbreak do do do do
   do do do do do do do mib

   %13
   re mi? fad re sol4 sol,
   do8 mib mib do r re re sib
   r do re fad sol sol sol sol\mbreak

   %16
   fa re la' la, re, re re re
   la' la la la la la la la
   re re re re sold, sold la la

   %19
   re r la r re r re, r
   sol sol sol sol sol sol sold sold\mbreak
   la la la la re re do do

   %22
   sib sib sib sib sib sib sib sib
   la la la la sib sib sib sib
   do do do do fa r fa r

   %25
   do' r do, r do' r fa, r\mbreak
   fa, r fa' r do do do do
   do do do do do do do do

   %28
   do do do do do do do do
   fa fa fa fa fa fa fa fa
   si, si do do fa fa fa fa

   %31
   si, si do do\mbreak fa fa fa fa
   fa fa mi mi fa4 r8 re
   sib4 do_\fermata fa8 fa fa fa

   %34
   do do do do fa fa fa fa
   fa fa sib, do fa,2\fermata

}

IIIbfIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s2 s4 <7>
  s1
  s8 <7 5> s4 <6 4> s
  <5 3>2 <6 4>
  <5 3> <6 4>
  <_-> <7->
  <_-> <7->
  s <_!>
  s <_->
  <7> <_->
  <6 4> <5 3>
  <6 4> <5 3>
  <_+> s
  <_-> s
  s1
  s
 <_+>2 <7>
  s <7>4 <3+>
  s <_+> s2
  s1
  <5 4>4 <3+> <_+>2
  s2 <6 4>
  s4 <6 5-> s2
  s1
  s4 <7> s2
  s2 s4 <7>
  <6 4>2 <5 3>
  <6 4> <5 3>
  s <_->
  <7-> <_->
  <7-> s4 <6- 4>
  <5 3>1
  s
  <7>

}

forma = {

  \time 4/4
  \key fa\major
  \tempo 4  = 45
  \partial 8 s8
  s1*35
  \bar "|."

}

IIIvlI = {
  \IIIglobal
  <<\IIIvlIn\forma>>
}

IIIvlII = {
  \IIIglobal
  <<\IIIvlIIn\forma>>
}

IIIvlaI = {
  \IIIglobal
  \clef alto
  <<\IIIvlaIn\forma>>
}

IIIvoce = {
  \new Voice = "suspiramus"
  \IIIglobal
  \clef alto
  <<\IIIvocen\forma>>
}

IIIbcI = {
  \IIIglobal
  \clef bass
  <<\IIIbcIn\forma\IIIbfIn>>
  \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IVglobal = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletNumber #'transparent = ##t
   \override TupletBracket #'bracket-visibility = ##f
   %\set Score.skipTypesetting = ##t

}

IVobIn = \relative do'' {

   R2*2
   la'16[sol la sib la8 sol]
   fa16[mi fa sol la8 la]

   %5
   sol16[fa sol la sol8 mi]
   mi4 r
   fa16[mi fa sol] mi8 la,

   %8
   R2
   fa'16[mi fa sol] mi8 la,
   R2*9

   %19
   mi'16 re mi fa mi fa sol mi
   fa mi fa sol la8 fa\mbreak
   R2*5

   %26
   r4 r8 do\f
   re [mi fad sold]
   la [si do sold]

   %29
   la[mi fa re]\mbreak
   mi[do re si]
   do la red4

   %32
   mi r8 la
   re,[fa mi mi,]
   do'16 si do re do8 re

   %35
   mi16 re mi fa mi8 la
   sold8 [mi fa re]% Col Basso
   mi[do re si]

   %38
   do [la mi' mi,]
   la4 r
   si16 la si do re8 mi\mbreak

   %41
   re[si la sold]
   re'[si la sold]
   mi' re do4

   %44
   R2*4
   sib16 la sib do re8 sib
   R2*8

   %57
   fa'16 mi fa sol la8 fa\mbreak
   sib, sol la4
   fa'16 mi fa sol la8 fa

   %60
   mi16 re mi fa sol8 mi
   R2
   fa16 mi fa sol mi8 la,

   %63
   R2
   fa'16 mi fa sol mi8 la,
   R2*5

   %70
   r4 r8 fa\f
   sol [la si dod]
   re[la sib? sol]

   %73
   la[fa sol mi]
   fa re sold4
   la r8 re\mbreak

   %76
   sol,[sib la la]
   re,[re' fa dod]
   re[la sib sol]

   %79
   la[fa sol mi]
   fa re la'4
   re,2\fermata

}

IVobIIn = \relative do'' {

   R2*2
   fa16[mi fa sol fa8 mi]
   re16[dod re mi re8 fa]

   %5
   mi16 [re mi fa mi8 re]
   dod4 r
   re16 dod re mi dod8 la

   %8
   R2
   re16 dod re mi dod8 la
   R2*9

   %19
   dod16 si dod re dod re mi dod
   re dod re mi fa8 re\mbreak
   R2*5

   %26
   r4 r8 do\f
   re [mi fad sold]
   la [si do sold]

   %29
   la[mi fa re]\mbreak
   mi[do re si]
   do la red4

   %32
   mi r8 la
   re,[fa mi mi,]
   la16 sold la si la8 si

   %35
   do16 si do re do8 do
   si8 [mi fa re]% Col Basso
   mi[do re si]

   %38
   do [la mi' mi,]
   la4 r
   sold16 fad sold la si8 do\mbreak

   %41
   si8[sold fad mi]
   si'[sold fad mi]
   do'8 si la4

   %44
   R2*4
   sol16 fad sol  la sib8 sol
   R2*8

   %57
   re'16 dod re mi fa8 re\mbreak
   sib sol la4
   re16 dod re mi fa8 re

   %60
   dod16 si dod re mi8 dod
   R2
   re16 dod re mi dod8 la

   %63
   R2
   re16 dod re mi dod8 la
   R2*5

   %70
   r4 r8 fa\f
   sol [la si dod]
   re[la sib? sol]

   %73
   la[fa sol mi]
   fa re sold4
   la r8 re\mbreak

   %76
   sol,[sib la la]
   re,[re' fa dod]
   re[la sib sol]

   %79
   la[fa sol mi]
   fa re la'4
   re,2\fermata

}

IVvlIn = \relative do'' {

   R2*4
   r4 r8 la'
   la[mi mi fa]

   %7
   fa4 mi
   R2*4
   re8\p[re re mi]\mbreak

   %13
   fa[fa fa sol]
   la[la la sib]
   dod, re r fa\p

   %16
   mi fa r4
   r r8 fa
   mi fa r4

   %19
   R2
   r4 r8 la\p\mbreak
   sib2~

   %22
   sib8 la la4~
   la8 sol sol4~
   sol8[fa fa fa]

   %25
   fa[mi mi re]
   re do r do
   re [mi fad sold]

   %28
   la [si do sold]
   la[mi fa re]\mbreak
   mi[do re si]

   %31
   do la red4
   mi r8 la
   re,[fa mi mi,]

   %34
   la4 r
   R2
   mi8[mi' fa re]

   %37
   mi[do re si]
   do [la mi' mi,]
   la4 r

   %40
   R2*4
   re8\p[re re mi]
   fad[fad fad sol]

   %46
   la[la la sib]
   do[do sib la]
   sib4 r8 sol\p

   %49
   la fad sol4\mbreak
   r r8 sib
   do (la) sib4

   %52
   r r8 sol
   dod,[dod dod re]
   mi[mi mi fa]

   %55
   sol[sol sol la]
   sib[sib la sol]
   fa4 r8 re\f \mbreak

   %58
   sib'8 sol la la,
   re4 r
   R2

   %61
   la'8\p[mi mi fa]
   fa4 mi
   R2*2

   %65
   sib'2\p~\mbreak %%%%%% fine p. 30
   sib8 la la4~
   la8 sol sol4~

   %68
   sol8 fa fa4~
   fa8[mi mi re]
   re dod r8  fa,\f

   %71
   sol [la si dod]
   re[la sib? sol]

   %73
   la[fa sol mi]
   fa re sold4
   la r8 re\mbreak

   %76
   sol,[sib la la]
   re,[re' fa dod]
   re[la sib sol]

   %79
   la[fa sol mi]
   fa re la'4
   re,2\fermata

}

IVvlIIn = \relative do'' {

   R2*4
   r4 r8 fa
   mi[dod dod re]

   %7
   re4 dod
   R2*4
   re8\p[re re mi]\mbreak

   %13
   fa[fa fa sol]
   la[la la sib]
   dod, re r re\p

   %16
   dod re r4
   r r8 re
   dod re r4

   %19
   R2
   r4 r8 fa\p\mbreak
   fa2

   %22
   mi
   re
   dod4 re~

   %25
   re8[si si si]
   la la r do
   re [mi fad sold]

   %28
   la [si do sold]
   la[mi fa re]\mbreak
   mi[do re si]

   %31
   do la red4
   mi r8 la
   re,[fa mi mi,]

   %34
   la4 r
   R2
   mi8[mi' fa re]

   %37
   mi[do re si]
   do [la mi' mi,]
   la4 r

   %40
   R2*4
   re8\p[re re mi]
   fad[fad fad sol]

   %46
   la[la la sib]
   do[do sib la]
   sib4 r8 sib,\p

   %49
   do la sib4\mbreak
   r r8 sol'
   la(fad) sol4

   %52
   r r8 sol
   dod,[dod dod re]
   mi[mi mi fa]

   %55
   sol[sol sol la]
   sib[sib la sol]
   fa4 r8 re\f \mbreak

   %58
   sib'8 sol la la,
   re4 r
   R2

   %61
   mi8\p[dod dod re]
   re4 dod
   R2*2

   %65
   fa2\p\mbreak %%%%%% fine p. 30
   mi
   re

   %68
   dod4 re
   si2
   la8 lad r8 fa\f

   %71
   sol [la si dod]
   re[la sib? sol]

   %73
   la[fa sol mi]
   fa re sold4
   la r8 re\mbreak

   %76
   sol,[sib la la]
   re,[re' fa dod]
   re[la sib sol]

   %79
   la[fa sol mi]
   fa re la'4
   re,2\fermata

}

IVvlaIn = \relative do' {

   R2*4
   r4 r8 la'\p
   dod4 la

   %7
   la la
   R2*7
   r4 r8 la\p

   %16
   la8 la r4
   r r8 la
   la8 la r4

   %19
   R2
   r4 r8 re\p
   re4 fa,

   %22
   sol mi
   fa re
   mi8 la la4

   %25
   si4. sold8
   mi mi r do
   re [mi fad sold]

   %28
   la [si do sold]
   la[mi fa re]\mbreak
   mi[do re si]

   %31
   do la red4
   mi r8 la
   re,[fa mi mi,]

   %34
   la4 r
   R2
   mi8[mi' fa re]

   %37
   mi[do re si]
   do [la mi' mi,]
   la4 r

   %40
   R2*8
   r4 r8 re\p
   mib re re4\mbreak

   %50
   r4 r8 re
   mib re re4
   R2*5

   %57
   r4 r8 re\f
   sib' sol la la,
   re4  r

   %60
   R2
   dod'8\p[la la la]
   la4 la

   %63
   R2*2
   re4\p fa,\mbreak
   sol mi

   %67
   fa re
   mi8 dod la re
   re4. sold8

   %70
   mi mi r8 fa,\f
   sol [la si dod]
   re[la sib? sol]

   %73
   la[fa sol mi]
   fa re sold4
   la r8 re\mbreak

   %76
   sol,[sib la la]
   re,[re' fa dod]
   re[la sib sol]

   %79
   la[fa sol mi]
   fa re la'4
   re,2\fermata

}

IVvocen = \relative do' {

   \autoBeamOff
   re4 fa
   la re,
   R2*7

   %10
   re4 fa
   la re,
   re8 re re mi\mbreak

   %13
   fa fa fa sol
   la4 la8 sib
   dod, re mi fa

   %16
   mi fa sol fa
   mi[re] dod[re]
   mi[fa] sol fa

   %19
   mi4 la,
   r r8 la'\mbreak
   sib sib sib sib

   %22
   sib la16[sol] la8 la
   re sol, sol sol
   sol fa16[mi] fa8 fa

   %25
   fa[mi] mi[re]
   re do r do
   re[mi fad sold]

   %28
   la[si do sold]
   la[mi fa re]\mbreak
   mi[do re si]

   %31
   do[la] red4
   mi r8 la
   re, fa mi4

   %34
   la, r
   R2*4
   la'4 do

   %40
   si mi,\mbreak
   si'8[sold] fad[mi]
   si'[sold] fad[mi]

   %43
   do'[si] la4
   re,4. mi8
   fad4 fad8 sol

   %46
   la la la sib
   do do sib la
   sib4 r8 sol

   %49
   la[fad] sol4\mbreak
   r r8 sib
   do[la] sib4

   %52
   r r8 sol
   dod, dod dod re
   mi mi mi fa

   %55
   sol sol sol la
   sib sib la sol
   fa4 r8 re\mbreak

   %58
   sib' sol la4\tr
   re, r
   R2

   %61
   la'8 mi mi fa
   fa4 mi
   la8 dod, dod re

   %64
   re4 dod8 la'
   sib sib sib sib\mbreak
   sib la16[sol] la8 la

   %67
   re sol, sol sol
   sol fa16[mi] fa8 fa
   fa[mi] mi[re]

   %70
   re dod r fa
   sol[la] si[dod]
   re[la sib? sol]

   %73
   la[fa sol mi]
   fa[re] sold4
   la r8 re\mbreak

   %76
   sol, sib la4
   re, r
   R2*4

}

IVtesto = \lyricmode {

  Eia _ ergo _  Eia _ ergo _ advocata _ _ _ nostra _ illos _ tuos _ mise - ricordes _ _ oculos _ _

  ad nos con -- verte _ con -- verte _ mi -- sericordes _ _ _ oculos _ _

  miseri - - cordes _ ocu - los ad nos con -- verte _ conver - - - - - - te

  ad nos converte _ _

  Eia _ ergo _ advo - cata _ nostra _ illos _ tuos _ mise - ricordes _ _ oculos _ _

  ad nos con -- verte _ con -- verte _ mise - ricordes _ _ oculos _ _

  mise - ricordes _ _ oculos _ _ ad nos ad nos con -- ver -- te

  advocata _ _ _ nostra _ advocata _ _ _ nostra _ mise - ricordes _ _ oculos _ _

  mise - ricordes _ _ oculos _ _ ad nos con -- verte _ ad nos conver - - - - te

  ad nos conver - te.

}

IVbcIn = \relative do {

   re4 r
   re r
   re la'8 la,

   %4
   re4 r8 re
   la'4 la,8 re
   la4 la

   %7
   la la
   R2*2
   re4 r

   %11
   re r
   re r\mbreak
   re r

   %14
   re r
   la'8 re,  r re
   la' re, r4

   %17
   r r8 re
   la' re, r4
   la' la,

   %20
   re' re,\mbreak
   re re'
   dod do

   %23
   si sib
   la re,
   sold4. sold8

   %26
   la la, r do
   re [mi fad sold]
   la [si do sold]

   %29
   la[mi fa re]\mbreak
   mi[do re si]
   do la red4

   %32
   mi r8 la
   re,[fa mi mi,]
   la[la' la mi]

   %35
   la,[ la' la la,]
   mi'[mi' fa re]
   mi[do re si]

   %38
   do [la mi' mi,]
   la,[do sib la]
   mi'4 r\mbreak

   %41
   mi r
   mi r
   la,8[si do la]

   %44
   re4 r
   re r
   re r

   %47
   re r
   sol, r8 sol'
   do, re sol,4\mbreak

   %50
   r4 r8 sol
   do re sol,4
   r r8 sol

   %53
   la4 r
   la r
   la r

   %56
   la r
   re re,8 re'\f \mbreak
   sib'8 sol la la,

   %59
   re [re' re re,]
   la[la' la la,]
   la4 la

   %62
   la la
   R2*2
   re4 re'\mbreak

   %66
   dod do
   si sib
   la re,

   %69
   sold, sold'
   la8 la, r fa'\f
   sol [la si dod]

   %72
   re[la sib? sol]
   la[fa sol mi]
   fa re sold4
   la r8 re\mbreak

   %76
   sol,[sib la la,]
   re[re' fa dod]
   re[la sib sol]

   %79
   la[fa sol mi]
   fa re la'4
   re,2\fermata

}

IVbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2*14
   <_+>2
   s2*5
   <6>2
   <7>8 <6> s4
   <7>8 <6> s4
   <7 _+>8 <6> s s
   <7-> <6> s <6 5>
   <5 4> <3-> s4
   s2*14
   <7 _+>2
   s
   s
   <_+>
   s2*16
   s4 s8 <6 4>
   s4 <5 3+>
   s2*2
   <6>2
   <7>8 <6> s s
   <7> <6> s s
   <7 _+> <6> s s
   <7 _+> <6> s <6 5>
   <5 4> <3> s s

}

IVvlIIIn = \relative do'' {

   R2*6
   r4 r8 la'\p
   la[mi mi fa]

   %9
   fa4 mi
   R2*3
   re8[re re mi]

   %14
   fa[fa fa sol]
   mi fa r4
   r r8 fa\p

   %17
   mi fa r4
   r r8 fa
   mi4 r

   %20
   R2*6
   r4 r8 do
   re [mi fad sold]

   %28
   la [si do sold]
   la[mi fa re]\mbreak
   mi[do re si]

   %31
   do la red4
   mi r8 la
   re,[fa mi mi,]

   %34
   la4 r
   R2
   mi8[mi' fa re]

   %37
   mi[do re si]
   do [la mi' mi,]
   la4  r

   %40
   R2*5
   re8\p[re re mi]
   fad[fad fad sol]

   %47
   la[la sol fad]
   sol4 r
   r r8 sol\p\mbreak

   %50
   la(fad) sol4
   r r8 sib
   do(la) sib4

   %53
   r r8 sol
   dod,[dod dod re]
   fa[fa fa sol]

   %56
   sol[sol fa mi]
   re4 r8 re\f
   sib' sol la la,

   %59
   re[re' re re,]
   R2*3
   la'8\p[mi mi fa]

   %64
   fa4 mi
   R2*5
   r4 r8 fa,\f

   %71
   sol[la si dod]
   re[la sib? sol]
   la[fa sol mi]

   %74
   fa re sold4
   la r8 re\mbreak
   sol,[sib la la]

   %77
   re,[re' fa dod]
   re[la sib sol]
   la[fa sol mi]

   %80
   fa re la'4
   re,2\fermata

}

IVvlIVn = \relative do'' {

   R2*6
   r4 r8 mi\p
   mi[dod dod re]]

   %9
   re4 dod
   R2*3
   re8[re re mi]

   %14
   fa[fa fa sol]
   mi fa r4
   r r8 re\p

   %17
   dod re r4
   r r8 re
   dod4 r

   %20
   R2*6
   r4 r8 do
   re [mi fad sold]

   %28
   la [si do sold]
   la[mi fa re]\mbreak
   mi[do re si]

   %31
   do la red4
   mi r8 la
   re,[fa mi mi,]

   %34
   la4 r
   R2
   mi8[mi' fa re]

   %37
   mi[do re si]
   do [la mi' mi,]
   la4  r

   %40
   R2*5
   re8\p[re re mi]
   fad[fad fad sol]

   %47
   la[la sol fad]
   sol4 r
   r r8 sib,\p\mbreak

   %50
   do la sib4
   r r8 sol'
   la(fad) sol4

   %53
   r r8 sol
   dod,[dod dod re]
   fa[fa fa sol]

   %56
   sol[sol fa mi]
   re4 r8 re\f
   sib' sol la la,

   %59
   re[re' re re,]
   R2*3
   mi8\p[dod dod re]

   %64
   re4 dod
   R2*5
   r4 r8 fa,\f

   %71
   sol[la si dod]
   re[la sib? sol]
   la[fa sol mi]

   %74
   fa re sold4
   la r8 re\mbreak
   sol,[sib la la]

   %77
   re,[re' fa dod]
   re[la sib sol]
   la[fa sol mi]

   %80
   fa re la'4
   re,2\fermata

}

IVvlaIIn = \relative do' {

   R2*6
   r4 r8 dod'\p
   dod?4 la

   %9
   la la
   R2*6
   r4 r8  la\p

   %17
   la la r4
   r4 r8 la
   la4 r

   %20
   R2*6
   r4 r8 do,
   re [mi fad sold]

   %28
   la [si do sold]
   la[mi fa re]\mbreak
   mi[do re si]

   %31
   do la red4
   mi r8 la
   re,[fa mi mi,]

   %34
   la4 r
   R2
   mi8[mi' fa re]

   %37
   mi[do re si]
   do [la mi' mi,]
   la4 r

   %40
   R2*9
   r4 r8 re\p \mbreak
   mib re re4

   %51
   r r8 re
   mib re re4
   R2*4

   %57
   r4 r8 re\f\mbreak
   sib' sol la la,
   re[re' re re,]

   %60
   R2*3
   dod'8[la la la]
   la4 la

   %65
   R2*5
   r4 r8 fa,\f
   sol [la si dod]

   %72
   re[la sib? sol]
   la[fa sol mi]
   fa re sold4
   la r8 re\mbreak

   %76
   sol,[sib la la]
   re,[re' fa dod]
   re[la sib sol]

   %79
   la[fa sol mi]
   fa re la'4
   re,2\fermata

}

IVbcIIn = \relative do {

   R2*7
   la4\p la
   la  la

   %10
   R2*3\mbreak
   re4 r
   re r

   %15
   la'8 re, r4
   r r8 re
   la'8 re, r4

   %18
   r r8 re
   la'4 r
   R2*6

   %26
   r4 r8 do,\f
   re [mi fad sold]
   la [si do sold]

   %29
   la[mi fa re]\mbreak
   mi[do re si]
   do la red4

   %32
   mi r8 la
   re,[fa mi mi,]
   la4 r

   %35
   R2
   mi'8 mi' fa re]
   mi[do re si]

   %38
   do [la mi' mi,]
   la,4 r
   R2*5

   %45
   re4 r
   re r
   re r

   %48
   sol, r
   r r8 sol'\mbreak
   do, re sol,4

   %51
   r r8 sol'
   do, re sol,4
   R2

   %54
   la4 r
   la r
   la r

   %57
   re r8 re\f\mbreak
   sib'8[sol la la,]
   re4 r

   %60
   R2*3
   la4 la
   la la

   %65
   R2*5
   r4 r8 fa'\f
   sol [la si dod]

   %72
   re[la sib? sol]
   la[fa sol mi]
   fa re sold4
   la r8 re\mbreak

   %76
   sol,[sib la la,]
   re[re' fa dod]
   re[la sib sol]

   %79
   la[fa sol mi]
   fa re la'4
   re,2\fermata

}

IVbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2*14
   <_+>2
   s2*47
   s4 s8 <6 4>
   s4 <5 3+>

}

forma = {

   \time 2/4
   % \override Staff.TimeSignature.style = #'single-digit
   \key fa\major
   \tempo 2 = 60
   s2*81
   \bar "|."

}

IVobI = {
   \IVglobal
   <<\IVobIn\forma>>
}

IVobII = {
   \IVglobal
   <<\IVobIIn\forma>>
}

IVvlI = {
   \IVglobal
   <<\IVvlIn\forma>>
}

IVvlII = {
   \IVglobal
   <<\IVvlIIn\forma>>
}

IVvlaI = {
   \IVglobal
   \clef alto
   <<\IVvlaIn\forma>>
}

IVvoce = {
   \new Voice = "eia"
   \IVglobal
   \clef alto
   <<\IVvocen\forma>>
}

IVbcI = {
   \IVglobal
   \clef bass
   <<\IVbcIn\forma\IVbfIn>>

}

IVvlIII = {
   \IVglobal
   <<\IVvlIIIn\forma>>
}

IVvlIV = {
   \IVglobal
   <<\IVvlIVn\forma>>
}

IVvlaII = {
   \IVglobal
   \clef alto
   <<\IVvlaIIn\forma>>
}

IVbcII = {
   \IVglobal
   \clef bass
   <<\IVbcIIn\forma\IVbfIIn>>
   \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


Vglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  %\set Score.skipTypesetting = ##t

}

VvlIn = \relative do'' {

  sib8
  la(re fad,)
  sol(re' sol,)
  fad4 r8

  %4
  r4 sib8
  do(fad la)
  do,(sib la)

  %7
  sib4 r8
  R4.
  la'8(fad) sol

  %10
  R4.
  do,8(la) sib
  R4.

  %13
  sol'8(la) fad
  sol4 sib,8\p\mbreak
  la re fad,

  %16
  sol re' sol,
  fad mi re
  la' sib do

  %19
  sib do la
  sib4 r8
  R4.*2

  %23
  sib8\p re, mib
  fa sib sol
  sol fa16 mib fa8

  %26
  R4.*3  %%%% inizio p. 35
  re'8 do sib
  la do mib,

  %31
  re fa sib
  la do mib,
  re fa sib

  %34
  mib re(do\tr)
  sib\f re sib
  la re fad,

  %37
  sol re' sol,
  fad re sib'\p
  la re fad,

  %40
  sol re' sol,\mbreak
  fad mi re
  R4.*4

  %46
  sib'8\p re sol,
  fa sol re
  mib re do

  %49
  R4.*3
  sib'8 re sib\mbreak
  la re sol,

  %54
  fad la re,
  R4.*2
  do'8 sib la

  %58
  sib fad sol
  do sib(la\tr)
  sol sib re

  %61
  la re sib
  la re sol,
  fad la re,

  %64
  do' sib la
  sib fad sol
  do sib(la\tr)\mbreak

  %67
  sol\f re' sol,
  fad la re
  do sib la

  %70
  sib sol' sib,
  la sol' fad
  sol4.\fermata

}

VvlIIn = \relative do'' {

  sol8
  fad(la fad)
  re(sol sib)
  la4 r8

  %4
  r4 sol8
  la(do fad)
  la,(sol fad)

  %7
  sol4 r8
  R4.
  do8(la) sib

  %10
  R4.
  la8(fad) sol
  R4.

  %13
  sib8(do) la
  sol4 sol8\p \mbreak
  fad la fad

  %16
  re sol sib
  la sol fad
  fad? sol la

  %19
  sol fad la
  sol4 r8
  R4.*2

  %23
  fa8\p sib sol
  fa mib4
  sib8 do re

  %26
  R4.*3
  sib'8 la fa
  fa' do la

  %31
  fa sib re
  fa do la
  fa sib re

  %34
  sib sib(la\tr)
  sib\f fa sol
  fad la fad

  %37
  re sol sib
  la fad sol\p
  fad la fad

  %40
  re sol sib\mbreak
  la sol fad
  R4.*4

  %46
  re8\p sib' re
  re si sol
  sol fa mib

  %49
  R4.*3
  re'8 sib re\mbreak
  fad, la sib

  %54
  do la fad
  R4.*2
  fad8 sol la

  %58
  re, la' sib
  la sol(fad\tr)
  sol re' sib

  %61
  do la sol
  fad la sib
  do la fad

  %64
  fad? sol la
  re, la' sib
  la sol(fad\tr)\mbreak

  %67
  sol\f sol(sib)
  la re la
  la sol fad

  %70
  sol sib sol
  re' sib la
  sib4.\fermata

}

VvlaIn = \relative do' {

  re8
  re la re
  sib sib re
  re4 r8

  %4
  r4 re8
  fad(la fad)
  fad?4 fad8

  %7
  re4 r8
  R4.
  fad4 re8

  %10
  R4.
  fad4 re8
  R4.

  %13
  re8 mib re
  sib4 re8\p\mbreak
  re la re

  %16
  sib re sib
  re4 re8
  re4 re8

  %19
  re4 re8
  re4 r8
  R4.*2

  %23
  re8 sib mib
  sib sib sib
  sib sib sib

  %26
  R4.*3
  fa'4 fa8
  fa4 fa8

  %31
  fa4 fa8
  fa4 fa8
  fa4 fa8

  %34
  mib fa4
  fa\f re8
  re la re

  %37
  sib sib re
  re4 re8\p
  re la re

  %40
  sib re sib\mbreak
  re4 re8
  R4.*4

  %46
  re4\p re8
  re4 sol,8
  sol4 sol8

  %49
  R4.*3
  re'4 re8\mbreak
  re4 re8

  %54
  do re re
  R4.*2
  fad8 re re

  %58
  re4 re8
  mib re re\tr
  re4 re8

  %61
  re4 re8
  re4 re8
  do4 re8

  %64
  re4 re8
  re4 re8
  mib re4\mbreak

  %67
  re4\f re8
  re4 re8
  fad4 fad8

  %70
  re4 re8
  re4 re8
  re4.\fermata

}

Vvocen = \relative do' {

  \autoBeamOff
  r8
  R4.*13
  r8 r sib'\mbreak
  la[re] fad,

  %16
  sol[sib] sol
  fad[mi] re
  la'[sib] do

  %19
  sib[do] la
  sib16[la] sol8 r
  R4.*2

  %23
  sib8 re, mib
  fa sol4
  sol8 fa16[mib] fa8

  %26
  sib re, mib
  fa sol4\mbreak
  sol8 fa16[mib] fa8

  %29
  r r sib
  la [do mib,]
  re [fa sib]

  %32
  la [do mib,]
  re[fa] sib
  mib, re[(do\tr)]

  %35
  sib4 r8
  R4.*2
  r8 r sib'

  %39
  la[re] fad,
  sol[sib] sol\mbreak
  fad[mi] re

  %42
  la'[sib] do
  sib[do] la
  sib16[la] sol8 r

  %45
  R4.
  sol8 re sol
  fa[sol] re

  %48
  mib8. re16 do8
  do mib do'
  la[sib] sol

  %51
  fad8. mi?16 re8
  r r sib'\mbreak
  la[re sol,]

  %54
  fad[la re,]
  sib'[re sol,]
  fad[la re,]

  %57
  do'[sib la]
  sib[fad] sol
  do sib[la]

  %60
  sol4 r8
  r r sib
  la[re] sol,

  %63
  fad[la re,]
  do'[sib la]
  sib[fad] sol

  %66
  la sol[(fad\tr)]\mbreak
  sol4 r8
  R4.*5

}

Vtesto = \lyricmode {

  Et Iesum _ bene - díctum _ fructum _ ventris _  tui _

  nobis _ post hoc exí - lium _ nobis _ post hoc exí - lium _ ostén - - - - de ostende. _ _

  Et Iesum _ bene - díctum _ fructum _ ventris _  tui _

  nobis _ post hoc exí - lium _ nobis _ post hoc exí - lium _ os -- ten - - - - - de ostende _ _

  osten - - - - - de osten - de.




}

VbcIn = \relative do {

  sol'8
  re(fad re)
  sol(sib, sol)
  re'4 r8

  %4
  r4 sol,8
  re' re, re'
  re re, re'

  %7
  sol,4 r8
  R4.
  re''8 re, sol,

  %10
  R4.
  re''8 re, sol,
  R4.

  %13
  sol'8 do, re
  sol,4 sol'8\p\mbreak
  re fad re

  %16
  sol sol, sol'
  re mi fad
  re sol fad

  %19
  sol la re,
  sol4 r8
  R4.*2

  %23
  re8 sib do
  re mib[mib,]
  re' do sib

  %26
  R4.*3
  sib8 fa' sib,
  fa' la fa

  %31
  sib, re sib
  fa' la fa
  sib, re sib

  %34
  sol' fa fa,
  sib4 sol'8\f
  re fad re

  %37
  sol sib, sol
  re' fad sol\p
  re fad re

  %40
  sol sol, sol'\mbreak
  re mi fad
  R4.*4

  %46
  sol8 sib, sol
  si sol si
  do re mib

  %49
  R4.*3
  sol8 sib, sol\mbreak
  re' do sib

  %54
  la fad' re
  R4.*2
  la'8 sol fad

  %58
  sol re sib
  do re re,
  sol sol' sol,

  %61
  fad fad' sol
  re do sib
  la fad' re

  %64
  la' sol fad
  sol re sib
  do re re,\mbreak

  %67
  sol\f sib sol
  re' re' re,
  re re' re,

  %70
  re re' re,
  re re' re,
  sol,4.\fermata

}

VbfIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  <_+>4.
  s
  <_+>
  s
  s
  <7>
  s
  s
  <7>
  s
  <7>
  s4.*6
  s4 <6 5>8
  s <6+> <7>
  s4.*10
  s4 <7->8
  s4.
  s4 <7->8
  s4.
  <6->8 <6 4> <5 3>
  s4.*12
  <6 5>4.
  <_->
  s4.*4
  <_+>4.
  s4.*5
  <6 _+>8 <6 4> <5 3+>
  s4.*6
  <_->8 <6 4> <5 3+>s4.
  <_+>
  <7>
  <6 4>
  <5 3+>8 <6 4> <5 3+>

}

VvlIIIn = \relative do'' {

  r8
  R4.
  r4 sib8
  la(re fad,)

  %4
  sol(re' sol,)
  fad4 r8
  R4.

  %7
  sib8(re sol)
  sib(la sol)
  fad4 r8

  %10
  la\p(fad) sol
  R4.
  do,8\p(la) sib

  %13
  sol'\f(la) fad
  sol4 r8\mbreak
  R4.*5

  %20
  sib,8\p sol sib
  do la fa
  mib' re do

  %23
  re4 r8
  R4.*2
  sib8 re, mib

  %27
  fa sib sol\mbreak
  sol fa16 mib fa8
  R4.*6

  %35
  sib8\f re sib
  la re fad,
  sol re' sol,

  %38
  fad re r
  R4.*3
  la'8\p sib do

  %43
  sib do la
  sib sol re'
  mib re do

  %46
  sib4 r8
  R4.*2
  do8\p mib do

  %50
  la sib sol
  fad mi re
  sib'4 r8\mbreak

  %53
  R4.*2
  sib8 re sol,
  fad la re,

  %57
  R4.*10\mbreak
  sol8\f re' sol,
  fad la re

  %69
  do sib la
  sib sol' sib,
  la sol' fad

  %72
  sol4.\fermata

}

VvlIVn = \relative do'' {

  r8
  R4.
  r4 sol8
  \once\slurDashed fad (la fad)

  %4
  re(sol sib)
  la4 r8
  R4.

  %7
  sol8(sib re)
  re(do sib)
  la4 r8

  %10
  do\p(la) sib
  R4.
  la8\p(fad) sol

  %13
  \once\slurDashed sib\f(do) la
  sol4 r8\mbreak
  R4.*5

  %20
  sol8\p re sol
  la do la
  do sib la

  %23
  sib4 r8
  R4.*2
  fa8 sib sol

  %27
  fa mib4\mbreak
  sib8 do re
  R4.*6

  %35
  sib'8\f fa sol
  fad la fad
  re sol sib

  %38
  la fad r
  R4.*3
  fad8\p sol la

  %43
  sol fad la
  sol re sib'
  do la fad

  %46
  sol4 r8
  R4.*2
  sol8\p do sol

  %50
  mib mi la
  la sol fad
  re'4 r8\mbreak

  %53
  R4.*2
  re,8 sol sib
  la re la

  %57
  R4.*10
  sol8\f sol(sib)
  la re la

  %69
  la sol fad
  sol sib sol
  re' sib la

  %72
  sib4.\fermata

}

VvlaIIn = \relative do' {

  r8
  R4.
  r4 re8
  re la re

  %4
  sib sib re
  re4 r8
  R4.

  %7
  re8 sol sib
  sol4 re8
  re4 r8

  %10
  fad4\p re8
  R4.
  fad4\p re8

  %13
  re\f mib re
  re4 r8\mbreak
  R4.*5

  %20
  re4\p sib8
  la4 do8
  la4 fa'8

  %23
  fa4 r8
  R4.*2
  re8 sib mib

  %27
  sib sib sib\mbreak
  sib sib sib
  R4.*6

  %35
  fa'4\f re8
  re la re
  sib sib re

  %38
  re4 r8
  R4.*3
  re4\p re8

  %43
  re4 re8
  re4 sol8
  sol la re,

  %46
  re4 r8
  R4.*2
  mib8\p sol mib

  %50
  mib? dod mi
  re4 re8
  re4 r8\mbreak

  %53
  R4.*2
  re4 re8
  re4 re8

  %57
  R4.*10\mbreak
  re4\f re8
  re4 re8

  %69
  fad4 fad8
  re4 re8
  re4 re8

  %72
  re4.\fermata

}

VbcIIn = \relative do {

  r8
  R4.
  r4 sol'8
  re(fad re)

  %4
  sol sib, sol
  re'4 r8
  R4.

  %7
  sol8 sol, sol'
  sol sol, sol'
  re4 r8

  %10
  re'\p re, sol,
  R4.
  re''8\p re, sol,
  sol'\f do, re

  %16
  sol,4 r8\mbreak
  R4.*5
  sol'8\p sib, sol

  %21
  fa fa' fa,
  fa fa' fa,
  sib4 r8

  %24
  R4.*2
  re8 sib do
  re mib[mib,]\mbreak

  %28
  re' do sib
  R4.*6
  sib4\f sol'8

  %36
  re fad re
  sol sib, sol
  re' re, r

  %39
  R4.*3
  re'8\p sol fad
  sol la re,

  %44
  sol sib, sol
  do fad re
  sol,4 r8

  %47
  R4.*2
  mib'8 do mib
  do dod dod

  %51
  re mi fad
  sol4 r8\mbreak
  R4.*2

  %55
  sol8 sib, sol
  re' fad re
  R4.*10\mbreak

  %67
  sol,8\f sib sol
  re' re' re,
  re re' re,

  %70
  re re' re,
  re re' re,
  sol,4.\fermata

}

VbfIIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s4.*2
  <_+>4.
  s4.*6
  <7>4.
  s <7>
  s4.*9
  <7->4.
  s4.*20
  s8 <_+> <7>
  s4. <_->8 s <7>
  s4.*4
  <6 5>4.
  <_+>

}

forma = {

  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \key fa\major
  \tempo 4. = 40
  \partial 8 s8
  s4.*72
  \bar "|."

}

VvlI = {
  \Vglobal
  <<\VvlIn\forma>>
}

VvlII = {
  \Vglobal
  <<\VvlIIn\forma>>
}

VvlaI = {
  \Vglobal
  \clef alto
  <<\VvlaIn\forma>>
}

Vvoce = {
  \new Voice = "et"
  \Vglobal
  \clef alto
  <<\Vvocen\forma>>
}

VbcI = {
  \Vglobal
  \clef bass
  <<\VbcIn\forma\VbfIn>>

}

VvlIII = {
  \Vglobal
  <<\VvlIIIn\forma>>
}

VvlIV = {
  \Vglobal
  <<\VvlIVn\forma>>
}

VvlaII = {
  \Vglobal
  \clef alto
  <<\VvlaIIn\forma>>
}

VbcII = {
  \Vglobal
  \clef bass
  <<\VbcIIn\forma\VbfIIn>>
  \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  %\set Score.skipTypesetting = ##t

}

VIvlIn = \relative do'' {

  r8
  r la\p la la r2
  r8 do do do r2
  r8 sib do do\mbreak re4 r

  %4
  r8 sib do do re4 r
  re8 mib re do re16. fa32 mib16. fa32 sol8 r
  r16. re32 do16. re32 mib8 r r16 fa sol fa sib8\noBeam \parenthesize r

  %7
  r8 re,16. mib32 do4\tr sib8 sib re,4
  r8 fa'\p fa sol\mbreak sol8 fa r4
  r8 fa fa sol sol fa r16. re32 mib16. re32

  %10
  lab'8 r r16 re, mib re sol8 r r16 mib fa mib
  sib'8 r r16 mi,? fa mi la4 r8 la
  sib la sib la sib la re,, r\mbreak

  %13
  r2 sib'8\p sib la4\tr
  sib r8 re mib re r re
  mib re r re mib re r sol

  %16
  lab lab lab lab la sib r4
  R1
  dod,,4 re\fermata sol,8 [re'' do16 sib la sol]

  %19
  fad8 sol do, re sol,2

}

VIvlIIn = \relative do'' {

  r8
  r fad,\p fad fad r2
  r8 sol la la r2
  r8 sol la la\mbreak sib4 r

  %4
  r8 sol la la sib4 r
  sib8 do sib la sib16. re32 do16. re32 mib8 r
  r16. sib32 la16. sib32 do8 r r16 re mib re fa8 r

  %7
  r sib,16. do32 la4 sib8 sib sib,4
  r8 re'\p re mib\mbreak mib re r4
  r8 re re mib mib re r16. sib32 do16. sib32

  %10
  fa'8 r r16. si,32 do16. si32 mib8 r r16 do re do
  sol'8 r r16 dod, re dod fad4 r8 fad
  sol fad sol fad sol fad re, r\mbreak

  %13
  r2 sol8\p sol fad4\tr
  sol r8 sib do sib r sib
  do sib r sib do sib r re

  %16
  mib mib mib mib fad sol r4
  R1
  dod,,4 re\fermata sol,8 [re'' do16 sib la sol]

  %19
  fad8 sol do, re sol,2

}

VIvlaIn = \relative do' {

  r8
  r re re re r2
  r8 mib mib mib r2
  r8 sol fa fa\mbreak fa4 r

  %4
  r8 sol fa fa fa4 r
  fa8 sol fa fa fa sib sib r
  r fa fa4 r8 fa re4

  %7
  r8 fa16.[sol32 do,8 fa] re sib' sib,4
  r8 sib'\p sib sib\mbreak sib sib r4
  r8 sib sib sib sib sib r re,

  %10
  re re re re mib mib mib mib
  mi! mi mi mi fad4 r8 re'
  re re re re re re re, r\mbreak

  %13
  r2 re8\p mi la,[re]
  re4 r8 sib' la sib r sib
  la sib r sib la sib r sib

  %16
  lab do do do re re r4
  R1
  dod,4 re\fermata sol,8 [re'' do16 sib la sol]

  %19
  fad8 sol do, re sol,2

}

VIvocen = \relative do' {

  \autoBeamOff

  sol'8
  la16[fad] \appoggiatura mi8 re4 la'8 sib16[la] sol8 r re
  mib do do' mib, mib re r fa
  sol sol la la\mbreak sib8.[la32 sol] fa8 fa

  %4
  sol sol la la sib8.[la32 sol] fa8 sib
  re, mib re[(do\tr)] sib4 r
  R1

  %7
  r2 r4 r8 fa'
  sib re,4 mib8\mbreak mib re4 fa8
  sib re, re mib mib re r fa

  %10
  lab4(sol8) fa mib16[re] do8 r do
  sib'4(la8) sol fad16[mi?] re8 r la'
  sib(la) sib la sib la r re,\mbreak

  %13
  mib re mib re sib' la16 sol fad4
  sol r8 re mib re r sol
  mib re r sol mib re r sol

  %16
  lab4 lab8 do fad, sol r sol
  lab lab lab do\mbreak fad, sol sib4~
  sib8 la16 sol fad4\fermata sol r

  %19
  R1

}

VItesto = \lyricmode {

  O clemens _ o pia _ o dulcis _ dulcis _ Virgo _ o dulcis _ dulcis _  Virgo _ o dulcis _ dulcis _

  Virgo _  Virgo _ Maria! _ _

  O clemens _ o pia _ o dulcis _ dulcis _ Virgo _ o dulcis _ Virgo _ o dulcis _ Virgo _

  O clemens _ o pia _ o dulcis _ dulcis _  Virgo _  Maria _ _

  Regina _ _ spes nostra _ dulcedo _ _

  O clemens _ o pia _ o dulcis _ dulcis _ Virgo _  Virgo _ Maria! _ _






}

VIbcIn = \relative do {

  r8
  r re re re r2
  r8 do fa fa r2
  r8 mib mib mib \mbreak re4 r

  %4
  r8 mib mib mib re4 r
  sib8 mib fa fa, sib sib' mib, r
  r sib' la4 r8 sib sib,4

  %7
  r8 sib'16.[mib,32 fa8 fa,] sib sib' sib,4
  r8 sib sib sib\mbreak r2
  r8 sib sib sib r4 r8 sib

  %10
  si si si si do do do do
  dod dod dod dod re re re re
  sol re sol re sol re re r\mbreak

  %13
  r2 sol,8 dod re[re,]
  sol4 r8 sol' fad sol r sol
  fad sol r sol fad sol r sol

  %16
  do do do do do sol r4
  R1
  dod,4 re\fermata sol,8[re'' do16 sib la sol ]

  %19
  fad8 sol do, re sol,2

}

VIbfIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s <_+> s4 s2
  s4 <7-> s2
  s8 <5> <6 4>4 s2
  s8 <5> <6 4 2>4 s2
  s4 <6 4>8 <5 3> s2
  s4 <6 5-> s2
  s1
  s4 s8 <6 4-> s2
  s4 s8 <6 4-> s2
  <7->2 <_->
  <7> <_+>
  s1
  s
  s2 <7->
  <7-> <7->
  <6-> <6 4+ 2>
  s1
  <7>

}

VIvlIIIn = \relative do'' {
  r8
  r2 r8 sib\p sib sib
  r2 r8 sib sib sib
  r2\mbreak r8 sib sib sib

  %4
  r2 r8 sib sib sib
  r2 r4 r16. mib32 re16. mib32
  fa8 r r16. do32 sib16. do32 re4 r16 fa sol fa

  %7
  sib8 re,16. mib32 do4\tr sib8 sib sib,4
  r2\mbreak r16 re'\p mib re sib'8 r
  r2 r16 re,\p mib re sib'8 r

  %10
  r16 re, mib re lab'8 r r16 mib fa mib solb8 r
  r16 mi! fa mi sib'8 r r16 fad sol fad la8 r
  r2 r4 r8 re,\mbreak

  %13
  mib re mib re sol,,4 r
  r16. re''32\p mib16. re32 sib'8 r r16. re,32 mib16. re32 sib'8 r
  r16. re,32 mib16. re32 sib'8 r r16. re,32 mib16. re32 sib'8 r

  %16
  r2 r4 r8 sol\p
  lab lab lab lab\mbreak la sib r4
  dod,,4 re\fermata sol,8 [re'' do16 sib la sol]

  %19
  fad8 sol do, re sol,2

}

VIvlIVn = \relative do'' {

  r8
  r2 r8 sol\p sol sol
  r2 r8 fa fa fa
  r2 r8 fa fa fa

  %4
  r2 r8 fa fa fa
  r2 r4 r16. do'32 sib16. do32
  re8 r r16. la32 sol16. la32 sib4 r16 re mib re

  %7
  fa8 sib,16. do32 la4\tr sib8 sib sib,4
  r2\mbreak r16 sib'\p do sib fa'8 r
  r2 r16 sib,\p do sib fa'8 r

  %10
  r16 si, do si fa'8 r r16 do re do mib8 r
  r16 dod re dod sol'8 r r16 re mi re fad8 r
  r2 r4 r8 sib,\mbreak

  %13
  do sib do sib sol,4 r
  r16. sib'32\p do16. sib32 sol'8 r r16. sib,32 do16. sib32 sol'8 r
  r16. sib,32 do16. sib32 sol'8 r r16. sib,32 do16. sib32 sol'8 r

  %16
  r2 r4 r8 re\p
  mib mib mib mib\mbreak fad sol r4
  dod,,4 re\fermata sol,8 [re'' do16 sib la sol]

  %19
  fad8 sol do, re sol,2

}

VIvlaIIn = \relative do' {

  r8
  r2 r8 re\p re re
  r2 r8 re re re
  r2\mbreak r8 re re re

  %4
  r2 r8 re re re
  r2 r4 r8 la'
  fa4 r8 fa fa4 r8 fa

  %7
  re fa16. sol32 do,8 fa re sib' sib,4
  r2 \mbreak r8 fa'\p re re
  r2 r8 fa\p re re

  %10
  lab' lab lab lab sol sol sol sol
  sib sib sib sib la? la la la
  r2 r4 r8 sol\mbreak

  %13
  sol sol sol sol sol,4 r
  r8 re' re4 r8 re re4
  r8 re re4 r8 re re4

  %16
  r2 r4 r8 sib'
  lab do do do\mbreak re re r4
  dod,4 re\fermata sol,8 [re'' do16 sib la sol]

  %19
  fad8 sol do, re sol,2

}

VIbcIIn = \relative do {

  r8
  r2 r8 sol' sol sol
  r2 r8 sib, sib sib
  r2\mbreak r8 sib sib sib

  %4
  r2 r8 sib sib sib
  r2 r4 r8 fa'
  sib4 r8 fa sib4 r8 sib

  %7
  sib, sib'16. mib,32 fa8 fa, sib sib' sib,4
  r2 r8 sib sib sib
  r2 r8 sib sib sib

  %10
  si si si si do do do do
  dod dod dod dod re re re re
  r2 r4 r8 sol,\mbreak

  %13
  do sol do sol sol4 r
  r8 sol' sol,4 r8 sol' sol,4
  r8 sol' sol,4 r8 sol' sol,4

  %16
  r2 r4 r8 sol'
  do do do do\mbreak do sib r4
  dod,4 re\fermata sol,8[re'' do16 sib la sol ]

  %19
  fad8 sol do, re sol,2

}

VIbfIIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s1*4
  s2 s4 s8 <7->
  s4 s8 <7-> s2
  s1*3
  <7->2 <_->
  <7> <_+>
  s1
  <_->
  s1*3
  <6->2 <6 4+ 2>
  <7>1

}

forma = {

  \time 4/4
  \key fa\major
  \tempo 4 = 50
  \partial 8 s8
  s1*19
  \bar "|."

}

VIvlI = {
  \VIglobal
  <<\VIvlIn\forma>>
}

VIvlII = {
  \VIglobal
  <<\VIvlIIn\forma>>
}

VIvlaI = {
  \VIglobal
  \clef alto
  <<\VIvlaIn\forma>>
}

VIvoce = {
  \new Voice = "o"
  \VIglobal
  \clef alto
  <<\VIvocen\forma>>
}

VIbcI = {
  \VIglobal
  \clef bass
  <<\VIbcIn\forma\VIbfIn>>

}

VIvlIII = {
  \VIglobal
  <<\VIvlIIIn\forma>>
}

VIvlIV = {
  \VIglobal
  <<\VIvlIVn\forma>>
}

VIvlaII = {
  \VIglobal
  \clef alto
  <<\VIvlaIIn\forma>>
}

VIbcII = {
  \VIglobal
  \clef bass
  <<\VIbcIIn\forma\VIbfIIn>>
  \set Score.skipTypesetting = ##f
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 17)


\pointAndClickOff


\paper  {

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

   \paper  {

      systems-per-page = #2

   }

   \markup \huge {[1.] And[ant]e molto}

   \score {
      {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
         } <<

            \new PianoStaff\with {instrumentName = \markup\huge\center-column{"[Primo"\vspace #-0.2"Coro]"}} <<

               \new Staff = "main" <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlI
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \IvlaI
               >>
               \new Staff <<
                  \set Staff.midiInstrument = #"synth voice"
                  \Ivoce
                  \new Lyrics \lyricsto "salve" \Itesto
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"cello"
                  \IbcI
               >>
            >>

            \new PianoStaff\with {instrumentName = \markup\huge\center-column{"[2.o"\vspace #-0.2"Coro]"}} <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlIII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlIV
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \IvlaII
               >>
               \new Staff <<
                  \set Staff.midiInstrument = #"contrabass"
                  \IbcII
               >>
            >>
         >>

      }

      \layout {

         indent = 1.5\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

   \markup \huge {[2.] All[egr]o}

   \score {
      {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
         } <<

            \new PianoStaff <<

               \new Staff = "main" <<
                  \set Staff.midiInstrument = #"violin"
                  \IIvlI
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IIvlII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \IIvlaI
               >>
               \new Staff <<
                  \set Staff.midiInstrument = #"synth voice"
                  \IIvoce
                  \new Lyrics \lyricsto "ad te" \IItesto
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"cello"
                  \IIbcI
               >>
            >>

            \new PianoStaff <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IIvlIII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IIvlIV
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \IIvlaII
               >>
               \new Staff <<
                  \set Staff.midiInstrument = #"contrabass"
                  \IIbcII
               >>
            >>
         >>

      }

      \layout {

         indent = 0.5\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

}

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup \huge {[3.] Larghetto}

   \score {
      {

         \new PianoStaff\with {instrumentName = \markup\huge\center-column{"[Primo"\vspace #-0.2"Coro]"}} <<

            \new Staff = "main" <<
               \set Staff.midiInstrument = #"violin"
               \IIIvlI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \IIIvlII
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"viola"
               \IIIvlaI
            >>
            \new Staff <<
               \set Staff.midiInstrument = #"synth voice"
               \IIIvoce
               \new Lyrics \lyricsto "suspiramus" \IIItesto
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"cello"
               \IIIbcI
            >>
         >>

      }

      \layout {

         indent = 1.5\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

}

\bookpart {

   \paper  {

      systems-per-page = #2

   }

   \markup \huge {[4.] All[egr]o}

   \score {
      {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         } <<

            \new PianoStaff <<

               \new Staff  \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.instrumentName =  \markup \center-column{"Hautbois""[I]"}
                  \set Staff.midiInstrument = #"oboe"
                  \IVobI
               >>

               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.instrumentName =  \markup \center-column{"Hautbois""[II]"}
                  \set Staff.midiInstrument = #"oboe"
                  \IVobII
               >>

               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"violin"
                  \IVvlI
               >>

               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"violin"
                  \IVvlII
               >>

               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"viola"
                  \IVvlaI
               >>
               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"synth voice"
                  \IVvoce
                  \new Lyrics \lyricsto "eia" \IVtesto
               >>

               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"cello"
                  \IVbcI
               >>
            >>

            \new PianoStaff <<

               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"violin"
                  \IVvlIII
               >>

               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"violin"
                  \IVvlIV
               >>

               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"viola"
                  \IVvlaII
               >>
               \new Staff \with {
          fontSize = #-1
          \override StaffSymbol #'staff-space = #(magstep -1)
        } <<
                  \set Staff.midiInstrument = #"contrabass"
                  \IVbcII
               >>
            >>
         >>

      }

      \layout {

         indent = 1.5\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

   \markup \huge {[5.] And[ant]e}

   \score {
      {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
         } <<

            \new PianoStaff <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \VvlI
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \VvlII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \VvlaI
               >>
               \new Staff <<
                  \set Staff.midiInstrument = #"synth voice"
                  \Vvoce
                  \new Lyrics \lyricsto "et" \Vtesto
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"cello"
                  \VbcI
               >>
            >>

            \new PianoStaff <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \VvlIII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \VvlIV
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \VvlaII
               >>
               \new Staff <<
                  \set Staff.midiInstrument = #"contrabass"
                  \VbcII
               >>
            >>
         >>

      }

      \layout {

         indent = 0.5\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

   \markup \huge {[6.] Larghetto}

   \score {
      {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
         } <<

            \new PianoStaff <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \VIvlI
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \VIvlII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \VIvlaI
               >>
               \new Staff <<
                  \set Staff.midiInstrument = #"synth voice"
                  \VIvoce
                  \new Lyrics \lyricsto "o" \VItesto
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"cello"
                  \VIbcI
               >>
            >>

            \new PianoStaff <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \VIvlIII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \VIvlIV
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \VIvlaII
               >>
               \new Staff <<
                  \set Staff.midiInstrument = #"contrabass"
                  \VIbcII
               >>
            >>
         >>

      }

      \layout {

         indent = 0.5\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

}

