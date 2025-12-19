\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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

Ifln = \relative do'' {

   R2.*2
   r4 do' sib
   lab4.-+ sol8 fa4~

   %5
   fa sol lab8.(sol16)
   fa8(sol16 lab) sol4.-+ fa8
   mi2 r4

   %8
   R2.
   r4 do'2~\mbreak
   do4 sib lab

   %11
   sol mib?\p mib
   re reb reb
   do2 do4

   %14
   sib sib2-+
   lab r4
   R2.

   %17
   r4 lab'8._\markup {[\musicglyph #"f"]}[(sib16) lab8.(sol16)]
   fa8.[(sol16) fa8.(mib16) re8.(do16)]
   si4 sol8.[(la16)si8.(do16)]\mbreak

   %20
   re8.[(do16) re8.(mib16) fa8.(re16)]
   sol4 la si-+
   do8. mib,16 re4.-+ do8

   %23
   do4 r r
   fa8.\p[(sol16) la8.(sib16)] do4~
   do fa, sib~

   %26
   sib8.[ lab16 solb8. fa16 mib8.(reb16)]
   do2.-+
   r4 fa\f fa

   %29
   fa2.\mbreak
   mib8.-+(reb16) do4. sib8
   sib4 r r

   %32
   R2.
   r4 do'\p do
   si sib sib

   %35
   la lab lab
   lab sol sol
   sol2.\fermata

   %38
   lab4\f do, fa~
   fa mi2
   fa4 lab8.[(sol16) fa8.(lab16)]

   %41
   sol8.-+(fa16) mi4.-+ fa8
   fa2.

}

Ivln =  \relative do'' {

   R2.*2
   do8.[(re16) mi8.(fa16)] sol4~
   sol fa8.[(mib?16) reb8.-+(do16)]

   %5
   reb2 do4~
   do8. reb16 sib4.-+(lab16 sib)
   do2 r4\mbreak

   %8
   r4 sol'2~
   sol4 fa8.[(mib16) reb8.-+(do16)]
   reb4 reb do

   %11
   sib sol\p sol
   lab sib sib
   sib mib, lab~

   %14
   lab sol2
   lab r4
   R2.

   %17
   r4 do\f do
   lab'8.[(sib16) lab8.(sol16) fa8.(mib16)]\mbreak
   re2 sol,8.(la16)

   %20
   si8.[(la?16) si8.(do16) re8. (si16)]
   do2 re4
   mib8.(do16) si4.-+ do8

   %23
   do4 r r
   r fa\p mib
   reb8.[(do16) reb8.(mib16) fa8.(reb16)]

   %26
   solb8.[(fa16) mib8.(reb16) do8.(sib16)]\mbreak
   la4 fa8.\f[(sol16) la8.(sib16)]
   do8.[(reb16) do8.(sib16) do8.(la16)]

   %29
   sib8.[(do16) reb8.(mib16) fa8.(sol16)]
   la8. sib16 la4.-+ sib8
   sib4 r r

   %32
   R2.
   do,8.\p[(re16) mi8.(fa16)] sol4
   fa sol sol\mbreak

   %35
   sol fa fa
   fa fa fa
   mi2.\fermata

   %38
   fa8.\f[(mi16) fa8. (sol16) lab8.(fa16)]
   sol8.[(fa16) sol8. (lab16) sib8.(sol16)]
   lab8.[(sol16) fa8.(mib16) reb8.(do16)]

   %41
   sib8.(lab16) sol4.-+ fa8
   fa2.

}

Ivlan =  \relative do' {

   r4 fa mib
   reb4.-+ do8 [sib8.(lab16)]
   sol2 do4

   %4
   do2.~
   do4 sib lab~
   lab sib8.(do16) reb4

   %7
   sol, do2~
   do4 sib8.[(lab16) sol8.(sib16)]
   lab2 fa'4 \mbreak

   %10
   fa mib2~
   mib4 mib\p mib
   fa sol mib

   %13
   mib8.[reb16 do8. sib16] lab4
   fa' mib8.[reb16 do8.-+ sib16]
   do4 do\f do

   %16
   re8.(mi16) mi4.-+(re16 mi)
   fa2 r4
   r fa,8.[sol16 lab8. fa16]

   %19
   sol8.[la16 si8. do16] re4
   r sol fa\mbreak
   mib fa8. mib16 fa4-+

   %22
   sol sol8.[fa16 mib8. re16]
   mib4 do4. mib8
   la,2 fa4\p

   %25
   sib8.[la16 sib8. do16 reb8. sib16]
   mib4 mib,8.[fa16 solb8. mib16]
   fa8.[sol?16 la8.\f sib16 do8. reb16]

   %28
   mib8.[fa16 mib8. reb16 mib8. do16]
   reb8. do16 sib4 r
   r fa'8.[mib16 reb8.-+ do16]\mbreak

   %31
   reb4 reb do
   sib4.-+ lab8[sol8. fa16]
   mi4 do' \p do

   %34
   re mi do
   fa2 do4
   re re re

   %37
   reb2.\fermata
   do2\f do4
   sib sol do~

   %40
   do8. sib16 lab4 sib~
   sib8. reb16 do4. sol8
   lab2.

}

Ibcn = \relative do {

   fa8.[sol16 lab8. sib16] do4~
   do sib8.[lab16 sol8. fa16]
   mi2 do4

   %4
   fa, fa'8.[sol16 lab8. fa16]
   sib,2 fa'8. mib16
   reb4 reb2-+

   %7
   do do4
   re? mi do
   fa2 fa4\mbreak

   %10
   sib sol lab
   mib!2.\p~
   mib2 mib4

   %13
   lab, lab' lab,
   reb mib mib,
   lab2\f fa'4

   %16
   sib8. lab16 sol4 do8. sib16
   lab8.-+ sol16 fa2
   R2.

   %19
   r4 sol sol
   fa-+ fa8. mib16 re4\mbreak
   mib2 re4

   %22
   do sol' sol,
   do, r r
   R2.*3

   %27
   r4 fa'\f fa
   la, la fa
   sib2 reb4

   %30
   do8. sib16 fa'4 fa,\mbreak
   sib sib do
   reb8.[mib16 reb8. do16 sib8. reb16]

   %33
   do2.\p~
   do~
   do4 do do

   %36
   si si si
   sib!2.\fermata
   lab?4\f lab lab

   %39
   sol do do,
   fa2 sib8. do16
   reb8. sib16 do4 do,

   %42
   fa2.

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2.
   <2->4 <6> <6\\>
   <5/>2.
   <9>
   <7 9>4 <6-> s
   <7>4 <6>2
   <_+>2.
   <7>4 <5/>2
   <9>2.
   <9 _->4 <5/>2
   s2.
   <7>4 <7-> s
   <9>2.
   <6 5>4 <4> <7->
   s2.
   <9>4 <6\\> <_+>
   <6>2.
   s
   s4 <_+>2
   <_+>2.
   <6>4 <4+> <6\\>
   s <4> <7 _+>
   s2.*4
   s4<_+>2
   <5/>2.
   <_->4 <6> <4+>
   <6\\>8. <_->16 <4>4 <7 _+>
   <_->2 <6\\>4
   <6>2 <6 _->4
   <_+>2.
   <7+ _+>4 <7- _+>2
   <5 4>4 <6- 4>2
   <7->4 <6>2
   <4+ _->2.
   <6>
   <7>4 <7 _+>2
   s <_->4
   <6> <4 > <7 _+>

}

forma = {

   \key mib\major
   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 4 = 60
   s2.*42
   \bar":|."

}

Ifl = {
   \Iglobal
   \notypeset
   <<\Ifln \forma>>

}

Ivl = {
   \Iglobal
   <<\Ivln \forma>>

}

Ivla = {
   \Iglobal
   <<\Ivlan \forma>>

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

}

IIfln = \relative do'' {

  do2 fa,4 fa'~
  fa8 mi16 re mi8 fa16 mi re8 mi16 fa sol8 sol
  do, re16 mi fa8 fa fa4 mi

  %4
  fa8 la sol fa mi sol fa mi
  re4 sol2 fa4~
  fa mi8 fa16 mi re8 mi16 fa sol8 fa

  %7
  mi4. mi8 fa sol la fa
  sib[la sol la16 sol] fa8[mi re sol16 fa]\mbreak
  mi8 fa16 sol do,8 fa sib la sol4-+

  %10
  fa8 la sol fa mi re do mi
  la, re si sol do4. si16 la
  re4 mi fa4. mi16 re

  %13
  mi8 fa sol mi fa sol la fa
  sol4 do, la' re,
  sol r r2

  %16
  fa do4 do'~
  do8 si16 la si8 do16 si la8 si16 do re8 re\mbreak
  sol, la16 si do8 do do4 si

  %19
  do8[sol16 fa mi fa sol mi] la8[la16 sol fa mi re do]
  si8 re sol,16 la si do re8[re re do16 si]
  do4 do~do8 re16 mi fa8 fa

  %22
  si, do16 re mi8 mi la, si16 do re8 re
  sol, la16 si do8 re16 do\mbreak si8 do si4-+
  do sol'~sol8 fa mi re

  %25
  do4 do'~do8 sib? la sol
  fa la sol fa sib16 la sol sib la sol fa la
  sol fa mi sol fa sol la fa sib la sol fa sol fa mi re

  %28
  dod4. dod8 re4 r
  r la'2 sol4~
  sol fa8 sol16 fa\mbreak mi8 mi mi4-+

  %31
  fa re la r
  r2 re'4. do8
  sib la sol2 do4~

  %34
  do8 sib la sol fa4 sib~
  sib8 la sol fa mi4 la~
  la re2 sol,4~

  %37
  sol8 fa16 mi fa8 sol16 fa mi8 fa mi4-+
  re r r2
  R1*3

  %42
  r4 re'2 do4~
  do sib8 do16 sib\mbreak la8 sib16 do re8 do
  sib4 sol~sol fa8 mib

  %45
  re4 sib'~sib la8 sol
  fad4 sol2 fad4
  sol r r2

  %48
  R1*2
  r8 fa fa mi re do sib la
  sol4 do~do8 re16 mi fa8 sol16 la

  %52
  sol8[sol sol la16 sol] fa8 [fa fa sol16 fa]\mbreak
  mi8 fa16 sol do,8 re16 do sib8 la sol4-+
  fa'2 do4 do'~

  %55
  do8 si16 la si8 do16 si la8 si16 do re8 re
  sol, la16 si do8 do do4 si
  do8[sol16 la sib? la sol fa] mi re mi fa sol la sib sol\mbreak

  %58
  la4 la2 sol4~
  sol fa2 mi4
  fa8[la16 sol fa mi re do] re[mib re do sib la sol fa]

  %61
  mi4 do'\p~do8 sib la sol
  fa4 re'~re8 do sib la
  sol4 mi'~mi8 re do sib

  %64
  la4 fa'~fa8 mi re do\mbreak
  sib4 sol'~sol8 fa mi re
  do4 la'~la8 sol fa4~

  %67
  fa8 re sol4~sol8 fa mi4~
  mi8 do fa4~fa8 re sol4~
  sol8 mi la4~la8 fa sib4~

  %70
  sib la sol sol-+
  fa1

}

IIvln =  \relative do'' {

  R1*3
  fa,2 do4 do'~
  do8 si16 la si8 do16 si la8 si16 do re8 re

  %6
  sol, la16 si do8 do do4 si
  do8 sol' do sib la sol fa la
  sol4 do2 sib4~

  %9
  sib la8 sib16 la sol8 la16 sib do8 sib
  la do sib la\mbreak sol fa mi sol
  fa4 re-+ mi16 re do si la8 re16 do

  %12
  si8 do16 re sol,8 do la'16 sol fa mi re4-+
  do2 fa,4 fa'~
  fa8 mi16 re mi8 fa16 mi re8 mi16 fa sol8 sol

  %15
  do, re16 mi fa8 fa fa4 mi
  r8 fa fa fa mi mi mi mi
  re4 sol2 fa4~\mbreak

  %18
  fa mi8 fa16 mi re4 re-+
  mi8 sol do, do do do, r la''
  sol4 r r2

  %21
  r8 do,16[re mi fa sol mi] la8 [la la sol16 fa]
  sol8[sol sol fa16mi] fa8[fa fa mi16 re]
  mi8[mi mi fa16 mi] re8 mi re4-+

  %24
  do r do~do8 sib\mbreak
  la sol fa4 fa'~fa8 mi
  re do sib la sol do fa, sib

  %27
  mi, la re, re' sol, la sib sol
  la mi' la sol fa mi re fa
  mi[mi mi fa16 mi] re8 [re re mi16 re]

  %30
  dod8 re16 mi la,8 la la2
  r la'4. sol8\mbreak
  fa mi fa re fad mi fad la

  %33
  sol4 r do4. sib8
  la sol fa4 sib4. la8
  sol fa mi4 la4. sol8

  %36
  fa mi re la' sib4. re,8
  dod4 re2 dod4
  re r r2

  %39
  R1*2
  re2 sol,4 sol'~
  sol8 fa16 mi fa8 sol16 fa\mbreak mi8 fad16 sol la8 la

  %43
  re,8 mi16 fad sol8 sol sol4 fad
  sol r r la~
  la sol8 fa? mi4 do'~

  %46
  do8 sib16 la sib8 do16 sib la4 la-+
  sol r r2
  R1

  %49
  r8 do, do sib la sol fa mi
  re4 sib'~sib8 la sol fa\mbreak
  mi fa sol mi fa4 r

  %52
  r do''2 sib4~
  sib la8 sib16 la sol8 la16 sib do8 sib
  la sol fa la sol [fa mi fa16 mi]

  %55
  re8 mi16 fa sol8 sol do, re16 mi fa8 fa
  si, do16 re mi8 do fa[fa fa mi16 re]\mbreak
  mi2 r8 do16[re  mi fa sol mi]

  %58
  fa4 fa, r8 fa' sib sib
  mi, mi la la re, re sol sol
  do, do fa fa fa[fa16 mi re do sib la]

  %61
  sol4 r fa\p~fa8 mi
  re do sib4 sol'~sol8 fa
  mi re do4 la'~la8 sol

  %64
  fa mi re4\mbreak sib'4~sib8 la
  sol fa mi4 do'~do8 sib
  la sol fa4 r2

  %67
  re'4~re8 sib mi4~mi8 re
  do4~do8 la re4~re8 sib
  mi4~mi8 do fa4~fa8 re

  %70
  sol do, fa fa fa4 mi
  fa1

}

IIvlan =  \relative do' {

  R1*6
  do2 fa,4 fa'~
  fa8 mi16 re mi8 fa16 mi re8 mi16 fa sol8 sol

  %9
  do, re16 mi fa8 fa fa4 mi
  fa r r2
  re4 sol2 fa4~

  %12
  fa mi8 fa16 mi re8 mi16 fa sol4~
  sol do,8 sib la sol fa la\mbreak
  sol sol' sol sol fa fa fa fa

  %15
  mi fa16 sol do,8 re16 do sib8[sib sib la16 sol]
  la8 do fa, la sol4 r
  r8 re' re re re2~

  %18
  re8 sol sol sol fa fa fa fa
  mi4 mi~mi8 fa16 mi re4~
  re8[sol,16 la si do re mi] fa8[fa fa mi16 re]\mbreak

  %21
  mi4 mi8 mi mi re16 do re8 re
  re sol, do do do re16 do si4
  do r r8 sol' sol fa

  %24
  mi re do4 r2
  R1*3
  la2 re,4 re'~

  %29
  re8 do16 si do8 re16 do si8 dod16 re mi8 mi
  la, si16 dod re8 re re4 dod\mbreak
  re8 dod re fa mi re mi dod

  %32
  la4 la'2 re,4~
  re8 do? sib? la sol4 mi'-+
  fa fa, r re'-+

  %35
  mi mi, r dod'-+
  re8 mi fa2 mi4~
  mi8 la, la'4 la4. sol8

  %38
  fa  mi re mi fad sol la fad\mbreak
  sol4 re~re8 mib fa re
  mib fa mib re do sib la sol

  %41
  fad la re4~re8 do re sib
  la4. re8 sol, la16 sib do8 do
  la re re re re2~

  %44
  re8 sib mib mib mib do fa4~
  fa8 re sol sol sol8 mi la4~
  la8 re, re re do [do do sib16 la]

  %47
  sib4 r r2
  r8 sol' sol fa  mi re do sib
  la4 fa'~fa8 mi re do

  %50
  sib2 sib8 do re sib
  do re do sib la sol la fa
  sib[re sol, fa16 sol] la8 la sib sib

  %53
  sol4 la\mbreak re do
  r2 do
  sol4 re'8 do16 re mi8 mi la, si16 do

  %56
  re8 re do do la'16 sol fa mi re8 sol
  sol[mi16 fa sol fa mi re] do2
  r8 la16[sib do re mib do] re8 re re re

  %59
  do do do do sib sib sib sib
  la la la la sib sib re re\mbreak
  do4 r la8\p la la la

  %62
  sib sib sib sib sib sib sib sib
  do do do do do do do do
  re re re re re re re re

  %65
  mi mi mi mi mi mi mi mi
  fa4 r re~re8 do
  sib4~sib8 sol do4~do8 sib

  %68
  la4~la8 fa sib4~sib8 sol
  do4~do8 la re4~re8 sib
  mi4 fa do8 do sib sib

  %71
  la1

}

IIbcn = \relative do {

  R1*9
  fa2 do4 do'~
  do8 si16 la si8 do16 si la8 si16 do re8 re

  %12
  sol, la16 si do8 do do4 si
  do r r2\mbreak
  do,4 do'2 sib?4~

  %15
  sib la8 sib16 la sol8 la16 sib do8 do,
  fa,4 r r8 do' do do
  sol' sol sol sol re re re re

  %18
  si sol do do sol' sol sol, sol
  do do do' do fa, fa fa fa
  sol sol sol sol sol, sol sol sol\mbreak

  %21
  do do do' do fa,[fa fa mi16 re]
  mi8[mi mi re16 do] re4 re-+
  do8 do' do fa, sol do, sol' sol,

  %24
  do,4 r r2
  R1*5
  r2 la''4. sol8\mbreak

  %31
  fa mi fa re dod si dod la
  re4 r r re
  sol4. fa8 mi[re] do4

  %34
  fa4. mi8 re do sib4
  mi4. re8 dod si la4
  re4. re8 sol la sib sol

  %37
  la la re, re la la la la
  re,2 re''4. do8\mbreak
  sib la sol la si do re si

  %40
  do sol do, re mib re do  mib
  re do sib la sib la sib sol
  re'4. si8 do4. la'8

  %43
  fad re sol sol, re' re re, re
  sol4. sol'8 la la la fa
  sib4. sol8 do do do la\mbreak

  %46
  re re sol, sol re re re, re
  sol sib' sib la sol fa mi re
  do4 do'~do8 sib la sol

  %49
  fa4 r r2
  R1
  do2 fa,4 fa'~

  %52
  fa8 mi16 re mi8 fa16 mi re8 mi16 fa sol8 sol
  do, re16 mi fa8 fa\mbreak fa4 mi
  fa r r2

  %55
  r4 sol2 fa4~
  fa mi8 fa16 mi re8 mi16 fa sol8 sol
  do,2 r8 do do do

  %58
  fa,[fa'16 sol la sib do la] sib8 sib sib sib
  la la la la sol sol sol sol
  fa fa fa fa sib, sib sib sib\mbreak

  %61
  do1
  do
  do

  %64
  do
  do
  do

  %67
  do
  do
  do

  %70
  do
  fa,

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1*10
  <2>4 <6> <7> <7>
  <7 _+> s <2> <5/>
  s1
  <4>4 s <2> <6>
  <4+> <6> <7> s
  s1
  <4>2 <4>
  <5/> <4>4 <7 _+>
  s2 <7>4 <6>
  <_+>2 <7 _+>
  s <7>4 <6>
  <7> <6> <7> <6\\>
  s2 <_+>4 s8 <7 _+>
  s1*6
  s2 <4>4 <_+>
  <6>2 <5/>
  s s4 <7 _+>
  s2 <5/>
  s <6 5>
  s <5/>
  s <7>4 <6>
  <_+> s <4> <7 _+>
  s2 <_+>
  <6> <5/>
  <_-> <6>4 <6>
  <_+>2 <6>
  <4>4 <6>8 <5/>8 <9>2
  <5/>2 <4>4 <7 _+>
  s4. <6->8 <7>4 <6>
  <7> <6> <7> <6>
  <7 _+> s <4> <7 _+>
  s1*5
  <2>4 <6> <7> <7>
  <7>2 <2>4 <5/>
  s1
  s2 <2>4 <6>
  <4+> <6> <7> <7 _+>
  s2 s8 <7> s4
  s <5/> <7> <6>
  <7> <6> <7> <6>
  s s <7> <6>

}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 60
  s1*71
  \bar":|."

}

IIfl = {
  \IIglobal
  \notypeset
  <<\IIfln \forma>>

}

IIvl = {
  \IIglobal
  <<\IIvln \forma>>

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
}

IIIfln = \relative do'' {

  do4 fa8(sol)
  mi4. fa8 sol[la sib la16(sol)]
  la4 \appoggiatura sol8 fa4 r2
  R1

  %4
  r2 do4 fa8(sol)
  mi4. fa8 sol[la sib la16(sol)]
  la4 \appoggiatura sol8 fa4 fa8(mi) re(do)

  %7
  si4 do8(re) re4. do8
  do2 r\mbreak
  r4 la'8(sol) sib(la) sol(fa)

  %10
  mi4 la, la'4. la8
  la4 sol8-+(fa) mi4.-+ re8
  re2 r

  %13
  R1
  r4 do'8(sib) la(sol) fa(mi)
  re(do) sib(la) sol4.-+ fa8

  %16
  fa2

}

IIIvln =  \relative do'' {

  fa,8(sol) la(sib)
  do(sib) do(re) mi4 do
  fa fa, r2
  R1

  %4
  r2 fa8(sol) la(sib)
  do(sib) do(re) mi4 do
  fa,2 la'8(sol) fa(mi)

  %7
  re4 mi8 do si4.-+ do8
  do2 r\mbreak
  r4 fa8(mi) re(fa) mi(re)

  %10
  dod4 dod8(re) mi(fa) sol(mi)
  fa4 mi8(re) dod4. re8
  re2 r

  %13
  R1
  r4 mi-+ fa la,-+
  sib8(la) sol(fa) mi4.-+ fa8

  %16
  fa2

}

IIIvlan =  \relative do' {

  r2
  R1
  r2 la8(sib) do(re)
  sol,4 do re8(mi) fa(sol)

  %4
  mi4.-+ re8 do4 r
  R1
  r2 r4 fa~

  %7
  fa mi8(fa) sol(fa) mi(re)
  mi-+ re do4 sol8(la) sib(do)
  la4 do sib2

  %10
  r4 la8(si) dod(re) mi(dod)\mbreak
  re4 sib? la8(sol) fa(mi)
  fa(mi) re4 fa'8(mi) fa(do)

  %13
  re(fa) mi(fa) sol4~sol16 fa(mi re)
  mi8-+(re) do4 do fa~
  fa sib, sib8(la) sol(sib)

  %16
  la(sol) fa4

}

IIIbcn = \relative do {

  r2
  R1
  r2 fa
  mi8 re mi do si4 sol

  %4
  do do, r2
  R1
  r2 fa'8 sol la fa

  %7
  sol4 do, sol' sol,
  do4 do, mi' do
  fa, fa' sol8 la sib sol

  %10
  la4 la la, la'\mbreak
  re, sol, la la
  re,2 re''4 la

  %13
  sib2 si4 sol
  do do, fa fa,
  sib8 do re sib do4 do,

  %16
  fa2

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2
  s1*2
  <6>2 <5/>
  s1
  s
  s
  <7 _+>2 <7 _+>
  s <5/>
  s <6>
  <_+> <7>
  s4 <6> <4> <7 _+>
  s2 s4 <6>
  s2 s4 <5/>
  s <7> s2
  s <4>4 <7>




}

forma = {

  \key fa\major
  \time 2/2
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \partial 2 s2
  s1*7
  s2
  \bar":..:"
  s
  s1*7
  s2
  \bar":|."

}

IIIfl = {
  \IIIglobal
  \notypeset
  <<\IIIfln \forma>>

}

IIIvl = {
  \IIIglobal
  <<\IIIvln \forma>>

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
}

IVfln = \relative do'' {

  lab8(sib) sib4-+
  do lab'8(sol) fa4.-+ sol8
  mi4 \appoggiatura reb?8 do4 r2
  R1

  %4
  r2 sib8(do) do4-+
  do lab'8(sol) fa4.-+ sol8
  mi4 do fa sol-+

  %7
  lab8 sol fa mib re4.-+ do8
  do2 r
  R1

  %10
  r4 mib8(fa) sol(lab) sib(sol)\mbreak
  lab4 sib8(do) sib4.-+ lab8
  lab2 do,4 fa

  %13
  mi lab sol-+ fa
  sib lab sol sib
  lab sib8(do) sib4.-+ lab8

  %16
  sol2 do,4\p(fa)
  mi(lab) sol-+(fa)
  sib(lab) sol(sib)

  %19
  lab4.-+ sol8 sol4.-+ fa8
  fa2

}

IVvln =  \relative do'' {

  fa,8(sol) sol4-+
  lab fa reb' sib-+
  do do, r2
  R1

  %4
  r2 fa8(sol) sol4-+
  lab fa reb' sib
  do do, do'8(re?) mi4-+

  %7
  fa8(mi?) re(do) si4. do8
  do2 r
  R1

  %10
  mib,8(fa) sol(lab)\mbreak sib(do) reb(sib)
  mib(fa) sol(lab) sol4.-+ lab8
  lab2 r

  %13
  do,4 fa mi lab
  sol fa mi sol
  fa sol8(lab) sol4.-+ fa8

  %16
  mi2 r
  do4\p (fa) mi(lab)
  sol(fa) mi(sol)

  %19
  fa4.-+ mi8 mi4.-+ fa8
  fa2

}

IVvlan =  \relative do' {

  r2
  R1
  r2 fa8(mi) fa(do)
  reb4 do sib4.-+ lab8

  %4
  sol2 r
  R1
  r2 do4 do\mbreak

  %7
  do fa fa mib8(re)
  mib(re) do4 mib sib8(reb)
  do4 fa8(mib) reb4.-+ do8

  %10
  sib2. sib4
  do reb8(mib) mib(reb) do(sib)
  do(reb?) do(sib) lab4 r

  %13
  r2 do4 fa
  mi fa do do
  do2. do4

  %16
  do2 r
  r do4\p(fa)
  mi(fa) do do

  %19
  do reb\mbreak do8(sib) lab(sol)
  lab(sol) fa4

}

IVbcn = \relative do {

  r2
  R1
  r2 lab'4 fa
  sib lab sol4.-+ fa8

  %4
  do2 r
  R1
  r2 lab'4 sol\mbreak

  %7
  fa8 sol lab fa sol4 sol,
  do do, lab'' sol
  lab reb,8 mib fa4 reb

  %10
  mib2 reb
  do4 sib8 lab mib'4 mib,
  lab2 r

  %13
  R1
  do2. do4
  fa, fa' mi fa

  %16
  do2 r
  R1
  do2.\p do4

  %19
  fa sib,\mbreak do do,
  fa2

}

IVbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2
  s1
  s2 <6>
  <_->4 <6> <6\\> s
  s1*2
  s2 <6>4 <6\\>
  s2 <4>4 <7 _+>
  s2 s4 <5/>
  s2 s4 <6>
  s1
  <6>4 <6\\> <4> <7->
  s1*2
  <6 4+>2 <_+>4 <7>
  s2 <5/>
  <_+>1
  s
  <6 4+>2 <_+>4 <7>
  s <6 _-> <4> <7 _+>

}

forma = {

  \key mib\major
  \time 2/2
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  \partial 2 s2
  s1*7
  s2
  \bar":..:"
  s
  s1*11
  s2
  \bar":|."

}

IVfl = {
  \IVglobal
  \notypeset
  <<\IVfln \forma>>

}

IVvl = {
  \IVglobal
  <<\IVvln \forma>>

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
}

Vfln = \relative do'' {

  fa4 mi
  fa r
  R2*3

  %6
  r4 r8 do
  re16 do sib do re fa sib re,
  do sib la sib do fa la do,

  %9
  sib la sol la sib mi sol sib,
  la8.-+ sol16 fa4
  R2*2

  %13
  sol'2(
  sol-+
  sol)

  %16
  sol16 fa mi re do si la sol\mbreak
  la' sol fa mi re do si la
  si' sol la si do si do sol

  %19
  la sol fa mi re8. do16
  do8[sol mi do]
  do''4 si

  %22
  do r
  R2*5
  r4 r16 re, mi fa

  %29
  sol la sib la sol fa mi re
  dod la dod mi la4\mbreak
  r16 sol, sib re sol4

  %32
  r16 fa, la do fa4
  r16 mi, sol sib mi4
  r16 re, fa la re8 la-+

  %35
  sib16 la sib do sib la sib sol
  la4 r
  R2

  %38
  r16 re, fa la re8 la
  si16 la si do si dod re mi
  dod la si dod\mbreak re  mi fa sol

  %41
  la2~
  la16 re, mi fa sol la si dod
  re2~

  %44
  re8[re16 do? sib? la sol fa]
  mi8[fa mi8.-+ re16]
  re4 r

  %47
  R2*3
  r16 la' sib do re do re la
  fad4 r

  %52
  r16 re mi fad\mbreak sol fad sol re
  si4 r
  r8 sol' do4~

  %55
  do8 do, fa4~
  fa8 fa sib4~
  sib8 sib, mib4~

  %58
  mib8 mib la4~
  la8 la, re4~
  re16 do re mi re mi fa sol

  %61
  mi re mi fa mi fad sol la
  fad re mi fad\mbreak sol fad sol re
  mib re do sib la8. sol16

  %64
  sol4 r8 sib'\p
  sib16 la sol la sib la sol fa
  mi8.-+ re16 do re mi fa

  %67
  sol fa sol la sol la sib sol
  la do la do la do la do
  fa, la fa la fa la fa la\mbreak

  %70
  re, fa re fa re fa re fa
  sib, re sib re sib re sib re
  sol,2-+~

  %73
  sol16 fa sol la sol la sib sol
  la sol la sib la sib do la
  sib la sib do sib do re sib

  %76
  do sib do re do re mib do\mbreak
  re do re mi re mi fa sol
  mi re do re mi fa sol la

  %79
  sib8[la16 sol la8. sib16]
  sol2-+\fermata
  fa4\f mi

  %82
  fa r
  R2*3
  r4 r8 do

  %87
  re16 do sib do re fa sib re,
  do sib la sib do fa la do,\mbreak
  sib la sol la sib mi sol sib,

  %90
  la8.-+ sol16 fa sol la sib
  do sib la sib do re do re
  mib mib mib mib mib mib mib mib

  %93
  do' sib la sol fa mib re do
  re8-+ do16 re sib8 sib16 do
  re do sib do\mbreak re mi re mi

  %96
  fa fa fa fa fa fa fa fa
  re' do si la sol fa mi re
  mi8-+ re16 mi do8 do16 re

  %99
  mi fa mi fa sol la sol la
  sib sib sib sib sib sib sib sib
  do, re mi fa sol la sib sol\mbreak

  %102
  la8-+ sol16 la fa8 do
  re16 re re re re re re re
  do do do do do do do do

  %105
  sib sib sib sib sib sib sib sib
  la la la la la la la la
  re do sib la sol8._+ fa16

  %108
  fa2

}

Vvln =  \relative do'' {

  la4 sol-+
  la r
  R2*3

  %6
  r4 r8 do
  sib16 la sol la sib8 sol_+
  la16 sol fa sol la8 fa_+

  %9
  sol16 fa mi fa sol8 mi_+
  fa4 r
  R2

  %12
  r4 r8 si16 do
  re do re mi re mi fa re
  mi re mi fa mi fa sol mi\mbreak

  %15
  re do re mi re mi fa re
  mi4. mi8-+
  fa4. fa8-+

  %18
  sol4. do,8
  do16 mi re do si8. do16
  do4 r

  %21
  mi re-+
  mi r
  R2*3

  %26
  r4 r16 do re mi
  fa sol la sol fa mi re do
  re do sib la sib4\mbreak %%%%% fine seconda riga

  %29
  r8 re16[do sib la sol fa]
  mi4 r16 fa' re la
  sib4 r16 mi do sol

  %32
  la4 r16 re sib fa
  sol4 r16 dod la mi
  fa4 r16 la fa re

  %35
  sol fa sol la sol fa sol mi
  fa4 r
  R2

  %38
  r4 r8 re'\mbreak
  re[si mi mi]
  mi4 r

  %41
  mi16 re mi fa mi fa sol mi
  fa4 r
  la16 sol la sib la sib do la

  %44
  sib8[sib16 la sol fa mi re]
  dod8[re dod8.-+ re16]
  re4 r

  %47
  R2*4
  r16 la' sib do re do re la\mbreak
  sib4 r

  %53
  r16 re, mib fa sol fa sol re
  mib re mib fa mib re do sib
  la sol la sib do re mib fa

  %56
  re do re mib re do sib la
  sol fa sol la sib do re mib
  do sib do re do sib la sol

  %59
  fad mi? fad sol la sib do re
  sib8 re sol,4~
  sol8 mi la4~

  %62
  la8 re sol, sol
  sol16 sib la sol fad8. sol16
  sol4 r8 sol'\p

  %65
  sol16 fa mi fa sol fa mi re
  do8 sol do, do'16 re
  mi re mi fa mi fa sol mi\mbreak

  %68
  fa la fa la fa la fa la
  re, fa re fa re fa re fa
  sib, re sib re sib re sib re

  %71
  sol, sib sol sib sol sib sol sib
  mi,2-+~
  mi16 re mi fa mi fa sol mi

  %74
  fa mi fa sol fa sol la fa\mbreak
  sol fa sol la sol la sib sol
  la sol la sib la sib do la

  %77
  sib8[fa sib sib]
  sol4 do16 re mi fa
  sol8 fa16-+ mi fa8. sol16

  %80
  mi2-+\fermata
  la,4\f sol
  la r

  %83
  R2*3
  r4 r8 la
  sib16 la sol la sib8 sol_+\mbreak

  %88
  la16 sol fa sol la8 fa_+
  sol16 fa mi fa sol8 mi_+
  fa4 r

  %91
  la16 sol fa sol la sib la sib
  do do do do do do do do
  la la la la la la la la

  %94
  sib8 fa sib,4
  r8 sib'16[la sib do sib do]\mbreak
  re re re re re re re re

  %97
  si si si si si si si si
  do8 sol do,4
  r8 do'16[re  mi fa mi fa]

  %100
  sol sol sol sol sol sol sol sol
  mi mi mi mi mi mi mi mi
  fa8[do la fa]\mbreak

  %103
  fa16 fa fa fa sib sib sib sib
  mi, mi mi mi la la la la
  re, re re re sol sol sol sol

  %106
  do, do do do fa fa fa fa
  fa la sol fa mi8. fa16
  fa2

}

Vvlan =  \relative do' {

  do4 do
  do r8 do16 sib
  la8._+ sol16 fa sol la sib

  %4
  do si do re do re mi do
  fa mi fa sol fa la sol fa
  mi8.-+ re16 do4

  %7
  R2*3
  r4 r8 fa16 sol
  la sol fa mi fa mi re do

  %12
  si8. la16 sol8 sol16 la\mbreak
  si la si do si do re si
  do si do re do re mi do

  %15
  si la si do si do re si
  do8[sol do do]
  do[la re re]

  %18
  re[re sol mi]
  fa[fa fa sol16 fa]
  mi4 r

  %21
  sol sol
  sol r8 sol16 fa
  mi8.-+ re16 do re mi fa

  %24
  sol fa mi fa\mbreak sol fa sol mi
  sib mi sol fa mi re do sib
  la sol fa mi fa4

  %27
  r8 do' fa4~
  fa16 mi re do re do sib la
  sib4 r

  %30
  r8 la' fa4
  r8 sol mi4
  r8 fa re4

  %33
  r8 mi dod4
  re r
  R2

  %36
  r16 re, fa la re8 la
  sib16 la sib do sib la sib sol\mbreak
  la4 r8 re

  %39
  sol4 r8 mi
  la4 r
  dod,16 si dod re dod re mi dod

  %42
  re4 r
  fad16 mi fad sol fad sol la fad
  sol4 r

  %45
  r8 la sol fa?16 mi
  fa8-+ mi16 fa re8 re16 mi
  fad mi fad sol fad sol la fad

  %48
  sol8 re16 do\mbreak sib re sol re
  mib fa mib re do sib la sol
  fad4 r

  %51
  r8 fad'[fad fad]
  sol4 r
  r8 si,[si si]

  %54
  do[sol'16 fa? sol fa mib re]
  do8[fa,16 sol la sib do la]
  sib8[fa'16 mib fa mib re do]

  %57
  sib8[mib,16 fa sol la sib sol]\mbreak
  la8[mib'16 re mib re do sib]
  la8[re,16 mi? fad sol la fad]

  %60
  sol4 re'~
  re8 sol, do4~
  do8[la sib si]

  %63
  do[do do sib16 la]
  sib8 re sol,4
  R2*7

  %72
  r8 do\p[do do]
  sib[sib sib sib]
  la[la la la]

  %75
  sol[sol sol sol]
  fa[fa fa fa]\mbreak
  sib[sib sol sol]

  %78
  do[do do do]
  mi,[do' fa, fa]
  do'4\fermata r

  %81
  do\f do
  do r8 do16 sib
  la8._+ sol16 fa sol la sib

  %84
  do si do re do re mi do
  fa mi fa sol fa la sol fa
  mi8.-+ re16 do4

  %87
  R2*5
  la'16 la la la la la la la\mbreak
  fa fa fa fa fa fa fa fa

  %94
  fa4 r
  R2
  si16 si si si si si si si

  %97
  sol sol sol sol sol sol sol sol
  sol4 r
  R2

  %100
  mi16 mi mi mi mi mi mi mi
  sol sol sol sol do, do do do
  do4 r8 la'\mbreak

  %103
  la16 la la la sol sol sol sol
  sol sol sol sol fa fa fa fa
  fa fa fa fa mi mi mi mi

  %106
  fa fa fa fa do do do do
  sib sib sib sib sib sib sib sib
  la2

}

Vbcn = \relative do {

  fa4 do-+
  fa r
  r8 fa[fa fa]

  %4
  mi[mi mi mi]
  re[re sol sol,]
  do4 do,

  %7
  R2*4
  fa'8[sol la fa]
  sol4 sol,\mbreak

  %13
  r8 sol'[sol, sol']
  r do,[do, do']
  r sol' [sol, sol']

  %16
  do,4 r8 do
  fa[fa fa re]
  sol[fa mi do]

  %19
  fa[re sol sol,]
  do,4 r
  do'' sol

  %22
  do r
  r8 do[do do]
  do,[do do do]

  %25
  mi[mi mi mi]
  fa do fa,4
  r r8 fa'

  %28
  sib4 sib,
  r8 sol'[sol, sol']
  la4 r8 re

  %31
  sol,4 r8 do
  fa,4 r8 sib
  mi,4 r8 la

  %34
  re,4 r
  R2
  r4 r16 la' fa re

  %37
  sol fa sol la sol fa sol mi\mbreak
  fa8[re re, re']
  r sol[sol, sol']

  %40
  r la la,4
  la'8[la la la]
  re,4 r

  %43
  re'8[re re re]
  sol,[sol sol sol]
  la[re, la' la,]

  %46
  re4 re,
  r8 re''[re do]
  sib sib sol sol

  %49
  do,[re mib do]
  re4 r
  r8 re'[re re]

  %52
  sol,4 r
  r8 sol[sol sol]
  do,4 r8 do

  %55
  fa4 r8 fa,
  sib4 r8 sib
  mib4 r8 mib,\mbreak

  %58
  la4 r8 la
  re4 r8 re,
  sol4 r8 sol'

  %61
  do,4 r8 la
  re[re sol sol,]
  do[la re re,]

  %64
  sol4 r
  R2*16
  fa'4\f do

  %82
  fa r
  r8 fa[fa fa]
  mi[mi mi mi]

  %85
  re[re sol sol,]
  do4 do,
  R2*6\mbreak

  %93
  fa'16 fa fa fa fa fa fa fa
  sib,4 r
  R2*2

  %97
  sol'16 sol sol sol sol sol sol sol
  do,4 r
  R2*2

  %101
  do16 do do do do do do do
  fa, fa fa fa fa' fa fa fa\mbreak
  sib sib sib sib sib sib sib sib

  %104
  la la la la la la la la
  sol sol sol sol sol sol sol sol
  fa fa fa fa fa fa fa fa

  %107
  sib, sib sib sib do8 do,
  fa2

}

Vbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2*3
  <6>2
  <7>4 <7 _+>
  s2*5
  s8 <6> <6> <6>
  <_+>2
  s8 <7 _+> s4
  s2
  s8 <7 _+> s4
  s2
  <7>4 <6>
  <_+> <6>
  <6 5> <4>8 <7 _+>
  s2
  s4
  <7 _+>
  s2*3
  <5/>2
  s2*3
  s4 <6>
  <_+>2
  s
  s
  s4 s8 <7 _+>
  s2
  s
  s4 s8 <6>
  s2
  <6>
  s4 <6>
  s8 <_+> s4
  <7 _+>2
  s2
  <7 _+>2
  s4 <6>
  <_+> <7 _+>
  s2
  s8 <_+> s4
  <6>2
  <_->4 s8 <6>
  <_+>2
  s8 <7 _+> s4
  s2
  s8 <7 _+> s4
  <_->2
  <7->
  <7>
  <7>
  <7>
  <7 _+>
  s
  <9 7>4 <6>
  <7 _+> s8 <7 _+>
  <_->4 <4>8 <7 _+>
  s2*20
  <6>2
  <7>4 <7 _+>
  s2*7
  <7->2
  s2*3
  <7 _+>2
  s2*3
  <7>2
  s
  <7>4 <6>
  <7> <6>
  <7> <6>
  s2
  <6>4 <4>8 <7>

}

forma = {

  \key fa\major
  \time 2/4
  \tempo 2 = 57
  s2*108
  \bar":|."

}

Vfl = {
  \Vglobal
  %\notypeset
  <<\Vfln \forma>>

}

Vvl = {
  \Vglobal
  <<\Vvln \forma>>

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
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] Largo "

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \set Staff.instrumentName = \markup \center-column{"Flȗte""Seule"}
        \Ifl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violon""Seul"}
          \Ivl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.instrumentName = \markup \center-column{"Viole""Seule"}
        \Ivla
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"cello"
        \set Staff.instrumentName = \markup \center-column{"Basso"}
        \Ibc

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

\pageBreak

\markup\huge "[2.] Allegro "

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \IIfl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIvla
      >>

      \new Staff <<
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

\pageBreak

\markup\huge {"[3.] I"\super er "Gavotta"\smaller Tendrement}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \IIIfl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIIvla
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"cello"
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

%\pageBreak

\markup\huge {"[4.] 2"\super e "Gavotta"}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \IVfl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IVvl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IVvla
      >>

      \new Staff <<
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

\pageBreak\markup\huge {"[5.] Allegro"}

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \Vfl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \Vvl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \Vvla
      >>

      \new Staff <<
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




