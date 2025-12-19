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


IvlIn =  \relative do'' {

   sol'4\staccatissimo re\staccatissimo mib\staccatissimo do\staccatissimo
   re la sib sol
   sol're mib do

   %4
   sol' la fad r
   sol\staccatissimo sol,\staccatissimo mib'\staccatissimo do,\staccatissimo
   fa'? fa, re' sib,

   %7
   lab''\p(fad) sol(re)
   lab'(fad) sol(re)
   sib\staccatissimo la\staccatissimo sol\staccatissimo r\mbreak

   %10
   mib'(dod) re(sol)
   mib(dod) re(sol)
   sib,\staccatissimo la\staccatissimo sol\staccatissimo r

   %13
   R1*13
   re'4 la sib sol
   la mi fa re

   %28
   re' la sib sol
   sol' mi dod r
   mi8 fa sol mi\mbreak fa sol la fa

   %31
   mi fa sol mi fa4 re
   mi dod re r
   mi,8 fa sol mi fa sol la fa

   %34
   mi fa sol mi fa4 re
   mi dod re la''
   la la la la

   %37
   la la\mbreak la8 la la la
   la4 la sib sib
   sol sol la la

   %40
   fa fa sol sol
   fa fa fa r\mbreak
   R1*3

   %45
   sib4 fa sol mib
   fa do re sib
   sib' fa sol mib

   %48
   do mib la, r\mbreak
   R1*3
   r2 la'8 la la la

   %53
   si4 r\mbreak r2
   R1*2
   do4 sol lab fa

   %57
   sol re mib do
   mib8 fa sol mib re mib fa re
   mib fa sol mib re4 r\mbreak

   %60
   sib'8 do re sib la sib do la
   sib do re sib la4 r
   R1

   %63
   sib,8 do sib la sol la sol fa
   mib fa mib re do re do si
   do re mib do do' re do sib\mbreak

   %66
   la sib la sol fad sol fad mi?
   re mi re dod re mi fad mi
   re do? sib do sib la sol sol'

   %69
   mib do sib la sol sol' mib do
   re mi? fad mi re4 fad
   sol'\staccatissimo re\staccatissimo mib\staccatissimo do\staccatissimo

   %72
   re la\mbreak sib sol
   sol' re mib do
   sol' la fad r

   %75
   R1*7
   sol4\staccatissimo re\staccatissimo mib\staccatissimo do\staccatissimo
   re la sib sol

   %84
   sol're mib do
   sol' la fad r
   sol\staccatissimo sol,\staccatissimo mib'\staccatissimo do,\staccatissimo

   %87
   fa' fa, re' sib,
   lab''\p(fad) sol(re)
   lab'(fad) sol(re)

   %90
   sib\staccatissimo la\staccatissimo sol\staccatissimo r\mbreak
   mib'(dod) re(sol)
   mib(dod) re(sol)

   %93
   sib,\staccatissimo la\staccatissimo sol\fermopz r

}

IvlIIn = \relative do'' {

   re4\staccatissimo sib\staccatissimo sol\staccatissimo mib'\staccatissimo
   la, re re sol,
   re' sib sol mib'

   %4
   mib? mi re r
   re\staccatissimo re,\staccatissimo do'\staccatissimo do,\staccatissimo
   do' do, sib' sib,

   %7
   mib'?_\markup {[\musicglyph #"p"]}(re) re(sib)
   mib?(re) re(sib8 la)
   sol4\staccatissimo fad\staccatissimo  sol\staccatissimo r\mbreak

   %10
   sib(la) la(sol)
   sib(la) la(sol)
   sol\staccatissimo fad\staccatissimo sol\staccatissimo r %%ripresa

   %13
   R1*13
   la4 fa re re'
   dod la la fa

   %28
   la fa re re'
   re sib8 si la4 r
   dod8 re mi! dod\mbreak re mi fa re

   %31
   dod re mi dod re4 la
   sib la fa r
   dod8 re mi dod re mi fa re

   %34
   dod re mi dod re4 la'
   sib la fa fa'
   fa fa mi mi

   %37
   mi mi\mbreak fa8 fa fa fa
   re4 re re re
   do do do do

   %40
   sib sib sib sib
   do do re r
   R1*3

   %45
   re4 sib sol sib
   do la fa fa'
   fa re sib sol'

   %48
   sol do, do r\mbreak
   R1*3
   r2 re8 re re re

   %53
   re4 r\mbreak r2
   R1*2
   sol4 mib do do

   %57
   re si sol sol
   do8 re mib do si do re si
   do re mib do sib!4 r\mbreak

   %60
   sol'8 la sib sol fad sol la fad
   sol la sib sol fad4 r
   R1

   %63
   sib,8 do sib la sol la sol fa
   mib fa mib re do re do si
   do re mib do do' re do sib\mbreak

   %66
   la sib la sol fad sol fad mi?
   re mi re dod re mi fad mi
   re do? sib do sib la sol sol'

   %69
   mib do sib la sol sol' mib do
   re mi? fad mi re4 fad
   re' sib sol mib'

   %72
   la, re\mbreak re sol,
   re' sib sol mib'
   mib? mi re r

   %75
   R1*7
   re4\staccatissimo sib\staccatissimo sol\staccatissimo mib'\staccatissimo
   la, re re sol,

   %84
   re' sib sol mib'
   mib? mi re r
   re\staccatissimo re,\staccatissimo do'\staccatissimo do,\staccatissimo

   %87
   do' do, sib' sib,
   mib'?_\markup {[\musicglyph #"p"]}(re) re(sib)
   mib?(re) re(sib8 la)

   %90
   sol4\staccatissimo fad\staccatissimo  sol\staccatissimo r\mbreak
   sib(la) la(sol)
   sib(la) la(sol)

   %93
   sol\staccatissimo fad\staccatissimo sol\fermopz r

}

Ivlan = \relative do'{

   sib'4\staccatissimo sol\staccatissimo mib\staccatissimo  sol\staccatissimo
   fad la sol sib,
   sib' sol mib sol

   %4
   do la la r
   si\staccatissimo si,\staccatissimo sol'\staccatissimo sol,\staccatissimo
   la' la, fa' fa,

   %7
   do''(la?) sib(re,)
   do'(la) sib(re,)
   re\staccatissimo re\staccatissimo sib\staccatissimo r\mbreak

   %10
   sol'(mi!) la(re,)
   sol(mi!) la(re,)
   re\staccatissimo re\staccatissimo sib\staccatissimo r

   %13
   R1*13
   fa'4 re sib sib'
   mi, dod la la

   %28
   fa' re sib sib'
   sib sol8 mi la4 r
   la la\mbreak la la

   %31
   la la la fa
   mi mi fa r
   la, la la la

   %34
   la la la fa
   mi mi re re'
   re re mi mi

   %37
   mi mi\mbreak re8 re re re
   re4 la' sol sib
   sib sib la la

   %40
   la la sol sol
   la la fa r
   R1*3

   %45
   fa4 re sib sib'
   la fa re re'
   re sib mib, sib

   %48
   sib sol' la r\mbreak
   R1*3
   r2 la8 la la la

   %53
   sol4 r r2
   R1*2
   mib4 do lab lab'

   %57
   sol sol8 re mib4 mib
   sol sol sol sol
   sol sol8 la re,4 r\mbreak

   %60
   re re re re
   re re re r
   R1*9

   %71
   sib'4 sol mib sol
   fad la\mbreak sol sib,
   sib' sol mib sol

   %74
   do la la r
   R1*7
   sib4\staccatissimo sol\staccatissimo mib\staccatissimo  sol\staccatissimo

   %83
   fad la sol sib,
   sib' sol mib sol
   do la la r

   %86
   si\staccatissimo si,\staccatissimo sol'\staccatissimo sol,\staccatissimo
   la' la, fa' fa,
   do''(la?) sib(re,)

   %89
   do'(la?) sib(re,)
   re\staccatissimo re\staccatissimo sib\staccatissimo r\mbreak
   sol'(mi!) la(re,)

   %92
   sol(mi) la(re,)
   re\staccatissimo re\staccatissimo sib\fermopz r

}

Ifgn = \relative do{

   R1*12
   sol'8\staccatissimo sol,\staccatissimo re'\staccatissimo sol,\staccatissimo mib' do do' do,
   re' fad, la re, sol re sib sol

   %15
   sol' sol, re' sol, mib' do do' do,
   sol' sol, mib''(dod) dod4(re8) r
   sol,16[fa mib re do si la sol]\mbreak do'8 do, mib do

   %18
   fa16[mib re do sib? la sol fa] sib'8 sib, re sib
   mib16[re do sib la sol fa mib] la'8 re,,  r4
   la'8 fa16 la re8 la16 re fa8 re16 fa la8 fa16 la

   %21
   sib,8 sol16 sib re8 sib16 re sol8 re16 sol sib8 sol16 sib
   dod,8 la16 dod mi8 dod16 mi la8 mi16 la dod8 la16 dod
   re4 r16 do? sib  la\mbreak sib la sol fa sol fa mi re

   %24
   mi re dod si dod si la sol fa re' mi re mi re mi re
   la'[re, mi re mi re mi re] re'8 re, sol, la
   \parenthesize re4 r r2

   %27
   R1*8
   r2 re16 la' fa la re, la' fa la
   re, la' fa la re, la' fa la dod, la' mi la dod, la' mi la

   %37
   dod, la' mi la dod, la' mi la\mbreak fa8 re r4
   la'16 re do? re fad, re' do re sib re do re sol, re' do re
   sol, do sib do mi, do' sib do la do sib do fa, do' sib do

   %40
   fa, sib la sib re, sib' la sib sol sib la sib mib, sib' la sib
   la, fa' mib fa do fa mib fa re4 r16 mib re do\mbreak
   sib16 sib' la sib re, sib' la sib mib, sib' la sib fa sib la sib

   %43
   sol sib la sib re, sib' la sib mib, sib' la sib fa sib la sib
   sol sib la sib re, sib' la sib mib, sib' la sib fa la sol fa
   sib,8 do re sib mib fa sol mib

   %46
   la sol la fa sib la sib sib,
   sib' do re sib mib, fa sol mib
   mib? re mib mib,? fa sol la fa\mbreak

   %49
   re'16 sib' mib, sib' fa sib re, sib' mib, sib' fa sib sol sib mib, sib'
   mi,! do' fa, do' sol do mi, do' fa, do' sol do la do fa, do'
   fad, re' sol, re' la re fad, re' sol, re' la re sib re sol, re'

   %52
   dod mi sib! mi la, mi' sol, mi' fa,4 r
   sol,16 re' la re si re sol, re'\mbreak do sol' re sol mib sol do, sol'
   fa do' sol do lab do fa, do' sol, fa' la, fa' si, fa' sol, fa'

   %55
   do[re mi fa sol la si sol] do fad, sol mi fa? re sol sol,
   \parenthesize do4 r r2
   R1*4

   %61
   r2 re16 fad la re, re'8. do16  %% solo fine p. 6
   re,16 fad la re, do'8. sib16 re, fad la re, sib'8. la16
   re2~re4~re16 do sib la

   %64
   sol2~sol8[fa fa8.\tr mib32 re]
   mib?2 mib'!~\mbreak
   mib4~mib16 re do sib la2~

   %67
   la8[sol sol8.\tr fad32 mi] fad2
   r8 fad(sol4)~sol8 la(sib4)~
   sib8 do (re4)~re8 mib(do la)

   %70
   fad la do4~do8[mib re16 do sib la]
   sol8 la sib sol do, re mib do
   fad mi? fad re\mbreak sol fad sol sol,

   %73
   sol' la sib sol do, re mib re
   do4 dod la'16 fad sol mi? fad re mib? do
   sib' sol la fa? sol mib fa re do' la sib sol la fad sol mi?

   %76
   re' sib do la sib sol la fa? sol mib fa re mib do re sib
   do la sib sol la fad sol mib? re4 r8 re'\mbreak
   mib'8(re do si) do16\staccatissimo la\staccatissimo sib?\staccatissimo sol\staccatissimo la fad sol mib?

   %79
   re'8(do sib la) sib16[sol la fa? sol mib fa re]
   do'8(sib la sol) fad!16[re mi? fad sol la sib do]
   re[sol,, la sib do re mi fad] sol8[fa?16 mib re do sib la]

   %82
   sol4 r r2
   R1*10
   R1^\markup\center-align {(\musicglyph #"scripts.ufermata")}

}

Ibcn = \relative do {

   sol'8 la sib sol do, re mib do
   fad mi? fad re sol fad sol sol,
   sol' la sib sol do, re mib re

   %4
   do4 dod re r
   si'8 la si sol do si do do,
   la' sol la fa sib? la sib sib,

   %7
   do do' re do sib la sib sol
   do, do' re do sib la sib fad
   sol4 re sol, r\mbreak

   %10
   sol8 sol' la sol fad re sib la
   sol sol' la sol fad re sib la
   sol4 re sol r

   %13
   sol sol do do
   fad re sol sol,
   sol sol do do

   %16
   sol sol'8 la fad8 mi fad re
   sol,4 r\mbreak r8 do mib do
   fa4 r r8 sib, re sib

   %19
   mib4 r re8 mi? fa re
   fa,4 fa fa fa
   sol sol sol sol

   %22
   la la la la
   re r\mbreak sol, r
   sol la re, r

   %25
   re' r r8 re sol, la
   re mi fa re sol la sib sol
   dod, si dod la re dod re re,

   %28
   re' mi fa re sol fad sol sol,
   sol' fa? sol sold la si dod la
   la4 la,\mbreak re' re,

   %31
   la' la, re' fa,
   sol la re,8 mi fa re
   la'4 la, re re,

   %34
   la'' la, re fa,
   sol la re re
   re re dod dod

   %37
   dod? dod\mbreak re8 re re re
   fad4 fad sol sol
   mi mi fa? fa

   %40
   re re mib mib
   la, la sib8 re do la\mbreak
   sib4 sib do re

   %43
   mib sib do re
   mib sib do fa
   sib,8 do re sib mib fa sol mib

   %46
   la sol la fa sib la sib sib,
   sib' do re sib mib, fa sol mib
   mib? re mib mib,? fa sol la fa\mbreak

   %49
   re' mib fa re mib fa sol mib
   mi! fa sol mi fa sol la fa
   fad sol la fad sol la sib sol

   %52
   dod sib la sol fa? fa fa fa
   sol, la si la\mbreak do re mib do
   fa sol lab fa sol, la si sol

   %55
   do4 r do8. mib?16 fa re sol sol,
   do8 re mib do fa sol lab fa
   si, la si sol do re mib do

   %58
   do'4 do, sol' sol,
   do' do,8 fad sol la sib la\mbreak
   sol4 sol, re'' re,

   %61
   sol sol, re' re16 fad la re,
   re4 re16 fad la re, re4 re16 sol sib re,
   sib4 r r2

   %64
   R1*7
   sol'8 la sib sol do, re mib do
   fad mi? fad re\mbreak sol fad sol sol,

   %73
   sol' la sib sol do, re mib re
   do4 dod re r
   sol r la r

   %76
   sib r mib, r
   la, r re8 mi? fad re\mbreak
   sol4. fa?8 mib4 r

   %79
   fa4. mib8 re4 r
   mib do re do
   sib la sol'8[fa16 mib re do sib la]

   %82
   sol8 la' sib sol do, re mib do
   fad mi? fad re sol fad sol sol,
   sol' la sib sol do, re mib re

   %85
   do4 dod re r
   si'8 la si sol do si do do,
   la' sol la fa sib? la sib sib,

   %88
   do do' re do sib la sib sol
   do, do' re do sib la sib fad
   sol4 re sol, r\mbreak

   %91
   sol8 sol' la sol fad re sib la
   sol sol' la sol fad re sib la
   sol4 re sol\fermopz  r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 55
  s1*93
  \bar"|."


}

IvlI = {
  \Iglobal
  \notypeset
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

Ifg = {
  \Iglobal
  \clef bass
  <<\Ifgn \forma>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIfgn = \relative do {

   re'8. do16 sib8
   la32 sib sol la fad [sol mi? fad] re8
   do8. sib16 la8

   %4
   sib32 re do re sib do la sib sol8\noBeam
   sib'8. la16 sol8
   re'8. do16 sib8

   %7
   la32 do sib do la sib sol la fa8\noBeam
   mib'8. re16 do8
   re32 mib fa mib re[mib do re]sib8

   %10
   sib8. do16 re8
   mib,32 sol fa sol mib[fa re mib] do8
   do'8. re16 mib8\mbreak

   %13
   fa,32 la sol la fa[sol mib fa] re8
   sib'8. la16 sol8
   fa8. mib16 re8

   %16
   sol8. fa16 mib8
   re16 mib32 fa sol la sib do re8\noBeam
   sib8. do16 la8

   %19
   sib4.
   si8. do16 re8
   fa,32 lab sol lab fa [sol mib fa] re8

   %22
   si'8. do16 re8
   re,8. mib16 fa8
   mib32 sol fa sol mib[fa re mib] do8\mbreak

   %25
   dod'8. re16 mi?8
   sol,32 sib la sib sol[la fa sol] mi?8
   dod'8. re16 mi?8

   %28
   mi,?8. fa16 sol8
   fa32 la sol la fa[sol mi ? fa] re8
   re'8. mib!16 re8

   %31
   mib8.(fad,16) sol8
   do8. re16 do8
   re(mi,?) fa?

   %34
   sib8. do16 sib8
   do(re,) mib!
   la8. sib16 sol8

   %37
   fad32 la sol la fad[sol mi? fad] re8
   la'32 do sib do la[sib sol la] fad8\mbreak
   sib8. la16 sol8

   %40
   sol8. la16 \afterGrace fad8 fad(
   sol4.)

}

IIbcn = \relative do {

   sol'4 sol,8
   re'4 re8
   la4 la8

   %4
   sol4 sol8
   sol'4 sol8
   sib4 sib8

   %7
   fa4 fa8
   fa4 fa8
   sib,4 sib8

   %10
   sib4 sib8
   do4 do8
   do4 do8\mbreak

   %13
   re4 re8
   sib4 sib8
   sib4 sib8

   %16
   mib4 mib8
   sib4 sib8
   fa'4 fa,8

   %19
   sib4.
   sol4 sol8
   sol4 sol8

   %22
   sol4 sol8
   sol4 sol8
   do4 do8\mbreak

   %25
   la4 la8
   la4 la8
   la4 la8

   %28
   la4 la8
   re4 re8
   sib'4 sib8

   %31
   do4 r8
   la4 la8
   sib4 r8

   %34
   sol4 sol8
   mib4 r8
   dod4 dod8

   %37
   re4 r8
   re4 r8\mbreak
   sol4 sol,8

   %40
   re'4 re,8
   sol4.

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key sol\minor
  \time 3/8
  \tempo 4 = 50
  s4.*19
  \bar":..:"\break
  s4.*22
  \bar":|."

}

IIfg = {
  \IIglobal
  \notypeset
  \clef bass
  <<\IIfgn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn =  \relative do'' {

   sib16 sol re' sib sol' re
   sib'8 sol re
   sib16 sol re' sib sol' re

   %4
   sib'8 sol re
   do16 la fad' do la' fad
   do'8 la fad

   %7
   do16 la fad' do la' fad
   do'8 la do,
   sib16 sib' sib sib, do sib

   %10
   la la' la la, sib la
   sol sol' sol sol, la sol\mbreak
   fad4 r8

   %13
   re'16 la fad' re la' fad
   do'4.~
   do8 sib la

   %16
   sib mib,4
   la8 re,4
   sol8 do,4

   %19
   do16 mib re do sib la
   sib8 re sol
   r re, fad'

   %22
   sol4 r8
   R4.*3
   sib,16 sol re' sib sol' re

   %27
   sib'4 r8
   R4.*13
   re,16 la fa' re la' fa

   %42
   re'8 la fa
   re16 la fa' re la' fa
   re'8 la fa\mbreak

   %45
   mi16 dod la' mi dod' la
   mi'8 dod la
   mi16 dod la' mi dod' la

   %48
   mi'8 dod la
   fa4 r8
   R4.*3

   %53
   la,16 mi dod' la mi' dod
   sol'4.~
   sol8 fa mi\mbreak

   %56
   fa sib4
   mi,8 la4
   re,8 sol4

   %59
   sol16 sib la sol fa mi
   fa8 la re
   r la, dod'

   %62
   re4 r8
   R4.*22
   sib,16 fa re' sib fa' re

   %86
   sib'8 fa re
   sib16 fa re' sib fa' re
   sib'8 fa re

   %89
   do16 do' do do, re do
   sib16 sib' sib sib, do sib\mbreak
   la la' la la, sib la

   %92
   sol sol' sol sol, la sol
   fa4 r8
   sib16 fa re' sib fa' re

   %95
   sib'8 re, do
   sib4 r8
   R4.*16

   %113
   sib16 sol re' sib sol' re\mbreak
   sib'8 sol re
   sib16 sol re' sib sol' re

   %116
   sib'8 sol re
   sib4 r8
   R4.*13

   %131
   sib16 sol re' sib sol' re
   sib'8 sol re
   sib4 r8

   %134
   R4.*20
   sib16 sol re' sib sol' re
   sib'8 sol re

   %156
   sib16 sol re' sib sol' re
   sib'8 sol re
   do16 la fad' do la' fad

   %159
   do'8 la fad
   do16 la fad' do la' fad
   do'8 la do,

   %162
   sib16 sib' sib sib, do sib
   la la' la la, sib la
   sol sol' sol sol, la sol\mbreak

   %165
   fad4 r8
   re'16 la fad' re la' fad
   do'4.~

   %168
   do8 sib la
   sib mib,4
   la8 re,4

   %171
   sol8 do,4
   do16 mib re do sib la
   sib8 re sol

   %174
   r re, fad'
   sol4\fermopz r8

}

IIIvlIIn = \relative do'' {

   R4.
   sib16 sol re' sib sol' re
   sib'8 sol re

   %4
   sib16 sol re' sib sol' re
   fad8 do la
   do16 la fad' do la' fad

   %7
   do'8 la fad
   do16 la fad' do la' fad
   sol sol sol sol, la sol

   %10
   fa? fa' fa fa, sol fa
   mib mib' mib mib, fa mib\mbreak
   re4 r8

   %13
   la'16 fad re' la fad' re
   la'4.~
   la8 sol fad

   %16
   sol16 sib sib sol sol mib
   mib? la la fa fa re
   re sol sol mib mib la,

   %19
   la do sib la sol fad
   sol8 sib re
   r la re

   %22
   sib4 r8
   R4.*3
   sol16 re sib' sol re' sib

   %27
   sol'4 r8
   R4.*14
   re16 la fa' re la' fa

   %43
   re'8 la fa
   re16 la fa' re la' fa\mbreak
   la8 mi dod

   %46
   mi16 dod la' mi dod' la
   mi'8 dod la
   mi16 dod la' mi dod' la

   %49
   la4 r8
   R4.*3
   mi,16 dod la' mi dod' la

   %54
   mi'4.~
   mi8 re dod\mbreak
   re16 fa fa re re sib

   %57
   sib mi mi do do la
   la re re sib sib sol
   mi sol' fa mi re dod

   %60
   re8 fa la
   r dod, la'
   fa4 r8

   %63
   R4.*23
   sib,16 fa re' sib fa' re
   sib'8 fa re

   %88
   sib16 fa re' sib fa' re
   la la' la la, sib la
   sol sol' sol sol, la sol\mbreak

   %91
   fa fa' fa fa, sol fa
   mib mib' mib mib, fa mib
   re4 r8

   %94
   fa16 re sib' fa re' sib
   fa'8 sib, la
   sib4 r8

   %97
   R4.*17
   sib16 sol re' sib sol' re
   sib'8 sol re

   %116
   sib16 sol re' sib sol' re
   sol4 r8
   R4.*14

   %132
   sib,16 sol re' sib sol' re
   sib'4 r8
   R4.*20

   %154
   R4.
   sib,16 sol re' sib sol' re
   sib'8 sol re

   %157
   sib16 sol re' sib sol' re
   fad8 do la
   do16 la fad' do la' fad

   %160
   do'8 la fad
   do16 la fad' do la' fad
   sol sol sol sol, la sol

   %163
   fa? fa' fa fa, sol fa
   mib mib' mib mib, fa mib\mbreak
   re4 r8

   %166
   la'16 fad re' la fad' re
   la'4.~
   la8 sol fad

   %169
   sol16 sib sib sol sol mib
   mib? la la fa fa re
   re sol sol mib mib la,

   %172
   la do sib la sol fad
   sol8 sib re
   r la re

   %175
   sib4\fermopz r8

}

IIIvlan = \relative do'{

   re8 r16 re re re
   re8 r16 re re re
   re8 r16 re re re

   %4
   re8 r16 re re re
   re8 r16 fad fad fad
   la8 r16 fad fad fad

   %7
   la8 r16 fad fad fad
   la8 r16 fad fad fad
   re4 r8

   %10
   R4.*2
   fad8 la fad
   fad?4.

   %14
   fad?8 la fad!
   fad?4.
   re16 sol sol mib mib do

   %17
   do fa fa re re sib
   sib mib mib do do fad
   fad?4 fad8

   %20
   re sol sib
   mib, re re
   re4 r8

   %23
   R4.*18
   la'8 r16 la la la
   la8 r16 la la la

   %43
   la8 r16 la la la
   la8 r16 la la la\mbreak
   dod8 r16 dod dod dod

   %46
   dod?8 r16 dod dod dod
   dod?8 r16 dod dod dod
   dod?8 r16 dod dod dod

   %49
   la4 r8
   R4.*2
   dod,8 mi sol

   %53
   dod, dod dod
   dod? mi sol
   dod, dod dod\mbreak

   %56
   la16 re re sib sib sol
   sol do do la la fa
   fa sib sib sol sol sol

   %59
   dod4 dod8
   la re fa
   sib la mi

   %62
   fa4 r8
   R4.*22
   re8 r16 re re re

   %86
   re8 r16 re re re
   re8 r16 re re re
   re8 r16 re re re

   %89
   fa4 r8
   R4.*3
   re8 fa fa

   %94
   re re re
   re fa fa
   re4 r8

   %97
   R4.*16
   re8 r16 re re re\mbreak
   re8 r16 re re re

   %115
   re8 r16 re re re
   re8 r16 re re re
   re4 r8

   %118
   R4.*13
   re8 r16 re re re
   re8 r16 re re re

   %133
   re4 r8
   R4.*20
   re8 r16 re re re

   %155
   re8 r16 re re re
   re8 r16 re re re
   re8 r16 re re re

   %158
   re8 r16 fad fad fad
   la8 r16 fad fad fad
   la8 r16 fad fad fad

   %161
   la8 r16 fad fad fad
   re4 r8
   R4.*2

   %165
   fad8 la fad
   fad?4.
   fad?8 la fad!

   %168
   fad?4.
   re16 sol sol mib mib do
   do fa fa re re sib

   %171
   sib mib mib do do fad
   fad?4 fad8
   re sol sib

   %174
   mib, re re
   re4\fermopz r8

}

IIIfgn = \relative do{

   sol8 r16 sol sib sol
   sol'8 r16 sol, sib sol
   sol'8 r16 sol, sib sol

   %4
   sol'8 r16 sol, sib sol
   la8 r16 re fad re
   re'8 r16 re, fad re

   %7
   re'8 r16 re, fad re
   re'8 r16 re, fad re
   sol4 r8

   %10
   R4.*2\mbreak
   re16 la fad' re la' fad
   re'8 re, re

   %14
   re16 la fad' re la' fad
   re'8 re, re
   sol do do,

   %17
   fa? sib sib,
   mib la la,
   re re' re,

   %20
   sol4 sib,8
   do re re,
   sol16 mi sib' sol re' sib

   %23
   sol' la sib do re8\mbreak
   re,16 la fad' re la' fad
   re' mib re do sib la

   %26
   sib la sol8 r
   sol16 re' sib, re' sol,, re''
   mib,(re' do si do) r

   %29
   fa,? do' la, do' fa,, do''
   re,(do' sib la sib) r
   mi,? sib' sol, sib' mi,, sib''

   %32
   dod,(sib' la sold la) r
   fa(la si dod re) r\mbreak %% fine p. 10
   mi,(la si dod re) r

   %35
   re, la' si dod re r
   do,? la' si dod re r
   sol,, la' si dod re r

   %38
   la, mi dod' la mi' dod
   la'8 sol16 fa  mi re
   mi'8 dod4\tr

   %41
   re8 r16 re, fa re
   re'8 r16 re, fa re
   re'8 r16 re, fa re

   %44
   re'8 r16 re, fa re\mbreak
   la'8 r16 la, dod la
   la'8 r16 la, dod la

   %47
   la'8 r16 la, dod la
   la'8 r16 la, dod la
   re re' re re, mi re

   %50
   do? do' do do, re do
   sib sib' sib sib, do sib
   la mi dod' la mi' dod

   %53
   la'8 la, la
   la16 mi dod' la mi' dod
   la'8 la, la\mbreak  %% fine p. 11

   %56
   re sol sol,
   do? fa fa,
   sib mi mi,

   %59
   la la la
   re4 re8
   sol la la,

   %62
   re16 la' fa la re, la'
   re, la' fa la re, la'
   dod, la' mi la dod, la'

   %65
   la, la' mi la dod, la'
   re, re' la re fa, re'
   re, re' la re fa, re'\mbreak

   %68
   sol, re' sib re sol, re'
   sol, re' sib re sol, re'
   mib, do' sol do mib, do'

   %71
   mib, do' sol do mib, do'
   re, sib' fa sib re, sib'
   re, sib' fa sib re, sib'

   %74
   do, la' mib la do, la'
   do, la' mib la do, la'
   sib,8 r16 sib32[do] re16 re32 mib

   %77
   fa16 sol32 la sib16[sib32 do] re16 re32 mib\mbreak
   fa4 r8
   fa(mib re)

   %80
   reb(do sib)
   la(sol fa)
   solb fa mib?

   %83
   reb16[do sib8 sib']
   do la4\tr
   sib8 r16 sib, re sib

   %86
   sib'8 r16 sib, re sib
   sib'8 r16 sib, re sib
   sib'8 r16 sib, re sib

   %89
   fa'4 r8
   R4.*3
   sib,16 fa re' sib fa' re

   %94
   sib'8 sib, sib
   sib fa' fa,
   sib16 sib re sib fa' sib,

   %97
   sib' sib, re sib fa' sib,
   fa' la, do la fa' la,
   do' la, do la fa' la,

   %100
   sib' sib, re sib fa' sib,
   sib' sib, re sib fa' sib,
   fa'[mib32 re do sib la sol] fa8\mbreak

   %103
   r16 si re si sol' si,
   si' si, re si sol' si,
   do' do, mib do sol' do,

   %106
   do' do, mib do sol' do,
   dod' dod, mi? dod la' mi
   dod' dod, mi dod la' mi

   %109
   re' re, fa re la' fa
   re' re, fa re la' fa
   re' re, fad re la' re,

   %112
   re' re, fad re la' re,
   sib'8 sol r\mbreak
   R4.*3

   %117
   re'16^\markup\italic"Cantabile"(sib) sib(la) la(sol)
   sol8(la) sib
   do,4.

   %120
   mib'16(do) do(sib) sib(la)
   la8(sib) do
   re,4 r8

   %123
   re'16(mib) mib(dod) dod(re)
   re(fad,) fad(la) la(do?)
   do(re) re(si) si(do)\mbreak

   %126
   do mib, mib sol sol sib?
   sib do do la la sib
   sib re re sib sib sol

   %129
   sol dod, dod sib' sib sol
   sol4\tr fad8
   sol, r16 sol re sol

   %132
   sol8 r16 sol re sol
   sib' re sol, re' fa, re'
   mib,(re' do sib la sol)

   %135
   la do fa, do' mib, do'
   re,(do' sib la sol fa)\mbreak
   sol sib mib, sib' re, sib'

   %138
   do,(sib' la sol fad mi?)
   fad la re, la' do, la'
   sib, sol re' sib sol' re

   %141
   re'4 r8
   mib(re dod)
   do!(sib la)

   %144
   lab(sol fad)
   sol re do'
   sib la4\tr

   %147
   sol4 r8
   \once\slurDashed mib' (re dod)\mbreak
   do!(sib la)

   %150
   lab(sol fad)
   sol(re) do'
   sib la4\tr

   %153
   sol4.
   sol,8 r16 sol sib sol
   sol'8 r16 sol, sib sol

   %156
   sol'8 r16 sol, sib sol
   sol'8 r16 sol, sib sol
   la8 r16 re fad re

   %159
   re'8 r16 re, fad re
   re'8 r16 re, fad re
   re'8 r16 re, fad re

   %162
   sol4 r8
   R4.*2\mbreak
   re16 la fad' re la' fad

   %166
   re'8 re, re
   re16 la fad' re la' fad
   re'8 re, re

   %169
   sol do do,
   fa? sib sib,
   mib la la,

   %172
   re re' re,
   sol4 sib,8
   do re re,

   %175
   sol4\fermata r8

}

IIIbcn = \relative do {

   sol8 r16 sol sib sol
   sol'8 r16 sol, sib sol
   sol'8 r16 sol, sib sol

   %4
   sol'8 r16 sol, sib sol
   la8 r16 re fad re
   re'8 r16 re, fad re

   %7
   re'8 r16 re, fad re
   re'8 r16 re, fad re
   sol4 r8

   %10
   R4.*2\mbreak
   re16 la fad' re la' fad
   re'8 re, re

   %14
   re16 la fad' re la' fad
   re'8 re, re
   sol do do,

   %17
   fa? sib sib,
   mib la la,
   re re' re,

   %20
   sol4 sib,8
   do re re,
   sol4 r8

   %23
   sol4 r8\mbreak
   re'4 r8
   re4 r8

   %26
   sol sol, sol
   sol'4 r8
   do,4 r8

   %29
   fa4 r8
   sib,4 r8
   mi?4 r8

   %32
   la,4 r8
   fa'4 r8\mbreak
   mi4 r8

   %35
   re4 r8
   do?4 r8
   sib4 r8

   %38
   la4 r8
   fa'4.
   sol8 la la,

   %41
   re r16 re fa re
   re'8 r16 re, fa re
   re'8 r16 re, fa re

   %44
   re'8 r16 re, fa re\mbreak
   la'8 r16 la, dod la
   la'8 r16 la, dod la

   %47
   la'8 r16 la, dod la
   la'8 r16 la, dod la
   re4 r8

   %50
   do?4 r8
   sib4 r8
   la16 mi dod' la mi' dod

   %53
   la'8 la, la
   la16 mi dod' la mi' dod
   la'8 la, la\mbreak  %% fine p. 11

   %56
   re sol sol,
   do? fa fa,
   sib mi mi,

   %59
   la la la
   re4 re8
   sol la la,

   %62
   re4 r8
   re4 r8
   dod4 r8

   %65
   la4 r8
   re4 r8
   re4 r8\mbreak

   %68
   sol4 r8
   sol4 r8
   mib4 r8

   %71
   mib?4 r8
   re4 r8
   re4 r8

   %74
   do4 r8
   do4 r8
   sib4 r8

   %77
   R4.\mbreak
   fa'16 sol fa mib re do
   sib4.

   %80
   mi!
   fa
   la,

   %83
   sib4 reb8
   mib fa fa,
   sib r16 sib re sib

   %86
   sib'8 r16 sib, re sib
   sib'8 r16 sib, re sib
   sib'8 r16 sib, re sib

   %89
   fa'4 r8
   R4.*3
   sib,16 fa re' sib fa' re

   %94
   sib'8 sib, sib
   sib fa' fa,
   sib4 r8

   %97
   sib4 r8
   fa'4 r8
   fa,4 r8

   %100
   sib4 r8
   sib4 r8
   fa4 r8\mbreak

   %103
   si4 r8
   si?4 r8
   do4 r8

   %106
   do4 r8
   dod4 r8
   dod?4 r8

   %109
   re4 r8
   re4 r8
   re4 r8

   %112
   re4 r8
   sol, r16 sol sib sol\mbreak
   sol'8 r16 sol, sib sol

   %115
   sol'8 r16 sol, sib sol
   sol'8 r16 sol, sib sol
   sol'4 r8

   %118
   sib,4.
   do8 mib re
   do4 r8

   %121
   do4.
   re8 fad mi?
   re sol la

   %124
   fad4 r8
   la sol fa!\mbreak
   mib4 r8

   %127
   sol fa mib
   re4 r8
   dod4 dod8

   %130
   re4 re,8
   sol r16 sol sib sol
   sol8 r16 sol sib sol

   %133
   sol4 r8
   do4 r8
   fa4 r8

   %136
   sib,4 r8\mbreak
   mib4 r8
   la,4 r8

   %139
   re4 r8
   sol,4 r8
   re'16 mi? fad mi fad re

   %142
   sol4.
   fad8 sol la
   do,4 re8

   %145
   sib4 mib8
   re re,4
   sol16 re' fad mi? fad re

   %148
   sol4.\mbreak
   fad8-. sol-. la-.
   do,4 re8

   %151
   sib4 mib8
   re re,4
   sol4.

   %154
   sol8 r16 sol sib sol
   sol'8 r16 sol, sib sol
   sol'8 r16 sol, sib sol

   %157
   sol'8 r16 sol, sib sol
   la8 r16 re fad re
   re'8 r16 re, fad re

   %160
   re'8 r16 re, fad re
   re'8 r16 re, fad re
   sol4 r8

   %163
   R4.*2\mbreak
   re16 la fad' re la' fad
   re'8 re, re

   %167
   re16 la fad' re la' fad
   re'8 re, re
   sol do do,

   %170
   fa? sib sib,
   mib la la,
   re re' re,

   %173
   sol4 sib,8
   do re re,
   sol4\fermopz r8

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key fa\major
  \override Staff.TimeSignature.style = #'single-digit
  \time 3/8
  \tempo 4. = 65
  s4.*175
  \bar"|."

}

IIIvlI = {
  \IIIglobal
  %\notypeset
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

IIIfg = {
  \IIIglobal
  \clef bass
  <<\IIIfgn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup\huge "[1.] All[egr]o"

   \score {
      {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         }<<

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

            \new Staff <<
               \set Staff.midiInstrument = #"bassoon"
               \set Staff.instrumentName = \markup \center-column{"Fagotto"}
               \Ifg
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

         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

}

\bookpart {

   \paper  {

      systems-per-page = #7

   }

   \markup\huge "[2.] Largo"

   \score {
      {

         \new ChoirStaff <<

            \new Staff \with {
               fontSize = #+1
               \override StaffSymbol.staff-space = #(magstep +1)
            } <<
               \set Staff.midiInstrument = #"bassoon"
               \IIfg
            >>

            \new Staff \with {
               fontSize = #+1
               \override StaffSymbol.staff-space = #(magstep +1)
            }<<
               \set Staff.midiInstrument = #"cello"
               \IIbc

            >>
         >>
      }

      \layout {

         indent = 0.5\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

}

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup\huge "[3.] All[egr]o"

   \score {
      {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         }<<

            \new PianoStaff <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IIIvlI
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IIIvlII
               >>
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"viola"
               \IIIvla
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"bassoon"
               \IIIfg
            >>

            \new Staff \with {
               fontSize = #+1
               \override StaffSymbol.staff-space = #(magstep +1)
            }<<
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

}
