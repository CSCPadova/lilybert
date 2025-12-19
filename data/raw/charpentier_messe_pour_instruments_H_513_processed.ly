\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "tous"

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

terzinesenza = \override TupletNumber.transparent = ##t

terzinecon = \override TupletNumber.transparent = ##f

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


Iglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}


IdsIn =  \relative do'' {

la'2 mi4 fad
sol fa mi re
do2 re

%4
mi fa4. sol8
mi2 la~
la4 si sold2

%7
la2. la4
si la sold4. fa8
mi2 fa

%10
mi1\mbreak
mi4. re8 mi4 fad
sol fa sol mi

%13
la4. sib8 la4 sol
fa mi re2~
re4 re mi4. re8

%16
do2 re4. do8
si4 dod re2~
re4 mi8 re dod2

%19
re4 la' la fa\mbreak
sol fa mi2\prall
re sol4 mi

%22
fa2. mi8 fa
sol2. la8 sol
fa4 sol la fa

%25
sol la sol4. fa8
mi2 la~
la4 sol fad2

%28
sol4. fad?8 sol4. la8\mbreak
fad2. sol8 fad
mi2. fad8 sol

%31
fad\breve\prallprall

}

Ihcn = \relative do'' {

do4 si la2
si4 la sol4. fad8
mi4 fad sold2

%4
la2. la4
sol2 do4 la
si dod re si

%7
dod2. dod4
re4. dod8 re4. mi8
dod2 re

%10
dod1\mbreak
do!4. si8 la2
sib4 la sib sol

%13
do2. si8 dod
re4 do si la
sold fa sold mi

%16
la sol fa mi
re mi fa2
mi la~

%19
la4 la re2\mbreak
do4. si8 do4. re8
si2 sib4. do8

%22
la2. la4
si2 mi
la, re4 do

%25
si2. la8 si
do2. do4
do2. re8 do

%28
sib2 sib4. do8\mbreak
la2. fad4
sol la sib2

%31
la\breve

}

Itln = \relative do' {

mi4 re do2
re si
la si

%4
do re
mi2. mi4
re dod si2

%7
mi1~
mi2 si'
la4 sol fa sol

%10
la1\mbreak
mi4 re do2
re mi

%13
fa2. sol4
la2 fa
mi2. mi4

%16
mi mi si4. la8
si4 sol2 sol'4
sol fa mi sol

%19
fa2. fa4\mbreak
mi fa sol2
re mi~

%22
mi4 fa8 mi re2~
re4 mi8 re dod2
re4 mi fa2

%25
mi2. fa4
sol fa mi2
fa4 sol la2

%28
re,2. re4\mbreak
re2. mi8 re
dod1

%31
re\breve

}

Ibcn = \relative do {

la'1
sol
la

%4
la
do
si

%7
la
sold
la~

%10
la
la
sol

%13
fa
re
mi

%16
mi
sol
la

%19
re,
mi
sol

%22
fa
mi
re

%25
mi
do
re

%28
re
re
re

%31
re,\breve

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\time 2/2
\override Staff.TimeSignature.style = #'single-digit
\tempo 2 = 53
s1*30
s\breve
\bar"|."


}

IdsI = {
	\Iglobal
	\clef french
	\notypeset
	<<\IdsIn \forma>>

}

Ihc = {
	\Iglobal
	\clef soprano
	<<\Ihcn \forma>>

}

Itl = {
	\Iglobal
	\clef mezzosoprano
	<<\Itln \forma>>

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


IIdsIn =  \relative do'' {

re4 mi fa2
mi4 la2 sol4\prall
fa4. sol16 fa mi4 fad
sol8 fa sol mi fa4 sol
dod, re2 dod4
re4. mi16 re do8 [si do8. re16]
si4 do4. si8 [si8.\prall la16]\mbreak
la4 mi' fa dod
re mi r la
sib fad sol8[fad fad8. sol16]
mi4 fa4. fa8[mi8.\prall mi16]
mi4 re8. re16 mi8 fa sol mi
fa4 mi8. mi16 fad8 sol la fad\mbreak
sol4. sol8 sol4 la8. mi16
fa2 r8 mi [mi8.\prall re16]
re\breve

}

IIdsIIn = \relative do'' {

r2
la4 si
do2 si4 mi~
mi re do4. re16 do
si4 dod re8 [do? sib8. do16]
la4 si8. la16 sold4 la
si4. si8 si4 la
sold4 la2 sold4\mbreak
la2 r4 mi'
fa dod re8[dod dod8. re16]
sib4 la8 sib do4 re~
re8[re do8.\prall sib16] la8[sol la8. sib16]
la4 si8. si16 dod8 re mi dod
re4 sol,8. sol16 la8 sib do la\mbreak
sib4 si8. si16 do4 dod8. dod16
re2 r8 re [re8. dod16]
re\breve

}

IIbcn = \relative do {

R1*3
r2 re4 mi
fa2 mi4 la~
la sold la re,
mi re mi mi,\mbreak
la8 si dod la re4 la'
re, la' sib fad
sol re mib si!
do la sib do
fa, fa' mi la
re, sib la re\mbreak
sol,8[sol'16 fa mi8. mi16] la,8[la'16 sol fa8 mi]
re4 sol la la,
re\breve

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
%\override Staff.TimeSignature.style = #'single-digit
\time 4/4
\tempo 2 = 45
s1*15
s\breve
\bar"|."


}

IIdsI = {
	\IIglobal
	\clef french
	\notypeset
	<<\IIdsIn \forma>>

}

IIdsII = {
	\IIglobal
	\clef french
	<<\IIdsIIn \forma>>

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


IIIdsIn =  \relative do'' {

fa4. fa8 fa4 mi8. mi16
mi4 re8. re16 mi8[fa16 mi mi8.\prall re16]
re8 mi fa sol la[sol16 fa mi8 fa]
sol8[fa16 mi re8 mi] fa8.[mi16 fa mi re do]
si4 do4. si8[si8.\prall la16]\mbreak
sib4 la sol8[do do8. sib16]
la4 fa' mi8[sol sol8. fad16]
sol8[la sol8. fa16] mi8[la la8. sol16]
la4 mi8 fa sol4. sol8
sol8 la16 sol fa4. mi8[mi8.\prall re16]
re\breve

}

IIIdsIIn = \relative do'' {

la4. re16 do si8[sol do sib16 do]
la4 si8. si16 dod8[re re8. dod16]
re4 r la8 si do re
mi[re16 do si8 dod] re8.[do?16 re do si la]
sold4 la4. la8[sold8. fad16]\mbreak
sol4 fa mi8[fa fa8. mi16]
fa8 sol la si do8[re8 do sib16 la]
sib4 si8. si16 dod8[dod re8. mi16]
dod4. re8 mi[si mi8. re16]
dod4 re4. re8[re8.\prall dod16]
re\breve

}

IIIbcn = \relative do {

 re2 sol4 do,
 fa sol8. fa16 mi8 re la' la,
 re,4 re'8 mi fa[sol la sol16 fa]
 mi8[fa sol fa16 mi] re2
 mi4 re mi2\mbreak
 fa do
 fa,8[fa'16 mi re8 fa] do[do'16 sib la8 re]
 sol,4 sol, la sib
 la la'8 sol16 fa mi4. mi8
 fa4. sol8 la4 la,
 re\breve

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
%\override Staff.TimeSignature.style = #'single-digit
\time 4/4
\tempo 2 = 40
s1*10
s\breve
\bar"|."


}

IIIdsI = {
	\IIIglobal
	\clef french
	\notypeset
	<<\IIIdsIn \forma>>

}

IIIdsII = {
	\IIIglobal
	\clef french
	<<\IIIdsIIn \forma>>

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


IVdsIn =  \relative do'' {

do4 re mi fa
sol re sol4. fa8
mi2 la4 sol

%4
fa2. sol8 fa
mi4. re8 mi4 do
re mi re4. do8

%7
si2 sol'
fad sold\mbreak
la2. sol8 fa

%10
mi2 la
fad sold
la4 sol fa4. sol8

%13
mi1
do2. re4
mi2. mi4

%16
mi2 fa~
fa4 sol8 fa mi2~
mi4 fa8 mi re2~\mbreak

%19
re4 mi8 re dod2
re4. mi8 re4. do8
si2 r8 re mi fa

%22
sol2. sol4
sol2. la8 sol
fa4.\prall mi8 fa4. sol8

%25
mi\breve\prallprall

}

IVhcn = \relative do'' {

la4 si do4. re8
si4. do8 re4 mi
do si la si

%4
do2. si8 la
sol2 la
si fad

%7
sol4. la8 si4. do8
re4. do8 re4 si\mbreak
do2. si8 la

%10
sol2 do
re2. mi8 re
dod2 re

%13
dod1
la4 si do la
sol2. la8 si

%16
do2. re8 do
sib2. do8 sib
la2. sib8 la\mbreak

%19
sol2. la8 sol
fad4 sol sol4. fad8
sol fad sol la si2~

%22
si4 si si4. si8
si2. dod8 si
la2. la4

%25
la\breve

}

IVtln = \relative do' {

mi4 re do2
re4. do8 si2
do4. re8 do4 si

%4
la si do re
mi2. fa8 mi
re4 do si do

%7
re2. re4 
re1\mbreak
mi2. mi4

%10
mi2 r8 mi fad sold
la2 si
mi, la4. la8

%13
la2. mi4
fa2. sol8 fa
mi4 re do sol'

%16
la sol fa2
sol2. sol4
dod,2 re\mbreak

%19
mi2. mi4
la,8 la si dod re4. re8
re2 r8 si do re

%22
mi4. fa8 mi4. re8
dod4. si8 dod4 la
re4. dod?8 re4. mi8

%25
dod\breve

}

IVbcn = \relative do {

la'1
sol
la

%4
la
do
si

%7
sol 
si\mbreak
la 

%10
do
do
la~

%13
la
la
do

%16
la
sol
fa\mbreak

%19
mi
re
sol

%22
sol
la~
la

%25
la,\breve

}

IVbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 45
s1*24
s\breve
\bar"|."


}

IVdsI = {
	\IVglobal
	\clef french
	\notypeset
	<<\IVdsIn \forma>>

}

IVhc = {
	\IVglobal
	\clef soprano
	<<\IVhcn \forma>>

}

IVtl = {
	\IVglobal
        \clef mezzosoprano
	<<\IVtln \forma>>

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


VdsIn =  \relative do'' {

do4 re mi fa
sol re sol4. fa8
mi2 la4 sol

%4
fa2. sol8 fa
mi4. re8 mi4 do
re mi re4.\prall do8

%7
si2 sol'
fad sold\mbreak
la2. sol8 fa

%10
mi2 la
fad sold
la4 sol fa4. sol8

%13
mi1
fa4. mi8 fa4 re
mi fa mi4. re8

%16
dod2 do4. re8
si2 mi~\mbreak
mi4 mi do re

%19
mi2 fad
sol fad
sol4 re sol4. la8

%22
fad2 sold
la2. sol8 fa
mi2. fa8 mi

%25
re4. dod8 re4. mi8
dod2 re\mbreak
dod1

%28
do!4. si8 do4. re8
mi2. mi4
mi4.\prall re8 mi4 fad

%31
sol2 mi~
mi4 fa8 mi re2~
re4 mi8 re do4 re8 do

%34
si2 do
si mi4 re\mbreak
dod2 la'~

%37
la4 la sold4. fad8
sol!2. la8 sol
fa2 mi

%40
re4 mi fa4. sol8
mi\breve\prallprall

}

Vhcn = \relative do'' {

la4 si do4. re8
si4. do8 re4 mi
do si la si

%4
do2. si8 la
sol2 la
si fad

%7
sol4. la8 si4. do8
re4. do8 re4 si\mbreak
do2. si8 la

%10
sol2 do
re2. mi8 re
dod2 re

%13
dod1
re4. dod?8 re4 si
dod4 re dod4. si8

%16
la2. la4
la2 sol4 si\mbreak
la2. la4

%19
sol2 la
si2. si4
si2. do4

%22
re4. do8 re4 si
do2. si8 la
sol2. sol4

%25
la2 si
mi, la4. la8\mbreak
la1

%28
la4. sol8 la4. si8
sol2 r8 sol la si
do2. re8 do

%31
si2. do8 si
la2. si8 la
sold2 la

%34
sold sol~
sol4 la si2\mbreak
la4. si8 dod2

%37
re4. dod8 re4. mi8
dod2. si8 dod
re2 dod

%40
si2. dod8 re
dod\breve\prallprall

}

Vtln = \relative do' {

mi4 re do2
re4. do8 si2
do4. re8 do4 si

%4
la si do re
mi2. fa8 mi
re4 do si do

%7
re1
re2. re4
mi2. mi4

%10
mi2 r8 mi fad sold
la2 si
mi, la4. la8

%13
la1
la
la2. sol8 fa

%16
mi2 fad
sol4 fa mi re\mbreak
do re mi2~

%19
mi4 mi re2
re4 do si do
re2. re4

%22
re do si2
mi4 re do re
mi fa sol mi

%25
fad2 sold
la4 sol fa4. sol8\mbreak
mi1

%28
mi2 fa
mi2 r8 mi fa sol
la2. la4

%31
re,8 re mi fa sol4 mi
fa do re8 si do re
mi2. mi4

%34
mi1
re2 sol4 fa\mbreak
mi2. fa8 mi

%37
re2 si
mi8 mi fad sold la2~
la4 la la4. si8

%40
sold1
la\breve

}

Vbcn = \relative do {

la'1
sol
la

%4
la
do
si

%7
sol
si\mbreak
la

%10
do~
do
la~

%13
la
re,
la'

%16
la
sol\mbreak
la

%19
do
si
sol

%22
si
la
do~

%25
do
la~\mbreak
la

%28
la
do
la

%31
sol
fa
mi

%34
mi
sol\mbreak
la

%37
si
la 
la

%40
la
la,\breve

}

Vbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 45
s1*40
s\breve
\bar"|."


}

VdsI = {
	\Vglobal
	\clef french
	\notypeset
	<<\VdsIn \forma>>

}

Vhc = {
	\Vglobal
	\clef soprano
	<<\Vhcn \forma>>

}

Vtl = {
	\Vglobal
	\clef mezzosoprano
	<<\Vtln \forma>>

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
}


VIdsIn =  \relative do'' {

fad4 sol la fad
sol4. la8 sol4.\prall fa8
mi2 re4. mi8

%4
do4. si8 la4 si
do re mi fa
sol re sol4. fa8

%7
mi2. fa8 mi
re2.\prall do8 re\mbreak
mi2 la

%10
fad sold4 la
si4. la8 sold4. fad8
mi2 fa

%13
mi1
r4 mi mi mi
fa sol la2~

%16
la4 la sol2~\mbreak
sol4 la8 sol fa2~
fa4 sol8 fa mi2~

%19
mi4 fa8 mi re4. re8
mi4. fa8 mi4. re8
do4 si do re

%22
mi fa sol mi
fa4. mi8 fa4 re
mi2. mi4\mbreak

%25
mi2 re4. re8
re2. mi8 re
do4. si8 do4. re8

%28
si\breve

}

VIhcn = \relative do'' {

re4. mi8 re4. do8
si4 do re sol,8 la
si2. si4

%4
la2 mi
la4 si do4. re8
si4. do8 re2

%7
do4 si la2~
la4 si8 la sold2\mbreak
la4 si dod2

%10
re4. mi8 re4. do8
si2. si4
dod2 re

%13
dod1
r4 dod dod dod
re2 do

%16
si2. si4\mbreak
do2. re8 do
si2. do8 si

%19
la2. si8 la
sold2. sold4
la sol la si

%22
do2. do4
do2 si
do2. do4\mbreak

%25
do2 si4. la8
sol4 mi fad sold
la4. sold8 la4. si8

%28
sold\breve

}

VItln = \relative do' {

la'4 sol fad4. mi8
re4 do si si'8 la
sol2 fa4. sol8

%4
mi4. re8 do4 re
mi2 la
re,4 do si si'8 la

%7
sol4 sol8 fa mi2
fad4 mi re4. mi8\mbreak
dod4 re mi2

%10
re4. do8 re4 si
mi2 mi
mi la4. la8

%13
la1
r4 la la la
la sol fa2~

%16
fa4 fa mi2~\mbreak
mi4 mi la2
re, sol

%19
do, re
mi2. mi4~
mi mi mi do

%22
fa mi re do
re2. re4
sol2. sol4\mbreak

%25
fa2. fa4
mi1
mi

%28
mi\breve

}

VIbcn = \relative do {

re1
sol
sol

%4
la
la
si

%7
do
si\mbreak
la 

%10
si
sold
la~

%13
la
sol
fa

%16
sol\mbreak
la
sol

%19
fa
mi
fa

%22
mi
re
do\mbreak

%25
re
mi
mi

%28
mi,\breve

}

VIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 45
s1*27
s\breve
\bar"|."


}

VIdsI = {
	\VIglobal
	\clef french
	\notypeset
	<<\VIdsIn \forma>>

}

VIhc = {
	\VIglobal
	\clef soprano
	<<\VIhcn \forma>>

}

VItl = {
	\VIglobal
	\clef mezzosoprano
	<<\VItln \forma>>

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
}


VIIdsIn =  \relative do'' {

fa8[mi fa sol fa sol fa sol]
mi[re mi fa sol la sol la]
fa[mi re mi fa mi fa sol]
fad[mi fad sol fad fad sol la]
si[si la sol fad si la si]\mbreak
sold[fad sold la sold la sold si]
la[sold la si la si la si]
sold2. fad4
sold\breve

}

VIIdsIIn = \relative do'' {

la8[sol la si la si la si]
do[si do re mi re do si]
la[la si dod re dod re mi]
re[re do si la la si dod]
re[re do si la re do re]
si[la si do si do si re]
do[si do re do re do re]
si2. la4
si\breve

}

VIIbcn = \relative do {

re1
do
re
re
re
mi
mi
mi
mi,\breve

}

VIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 70
s1*8
s\breve
\bar"|."


}

VIIdsI = {
	\VIIglobal
	\clef french
	\notypeset
	<<\VIIdsIn \forma>>

}

VIIdsII = {
	\VIIglobal
	\clef french
	<<\VIIdsIIn \forma>>

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
}


VIIIdsIn =  \relative do'' {

R2.
sol'4 sol4. la8
fa4.\prall mi8 fa4
mi la4. sol8
fad4. mi8 fad4
sol4. re8 mi fa
mi4. re8 mi4\mbreak
fa4. sol8 la sol
fa mi re4.\prall do8
do4 do re
mi mi fa
sol la8 sol la mi
fa4 fad4. fad8
sol4 sold4. sold8\mbreak
la4. sold?8 la si
sold2 sold4
sold\breve

}

VIIIdsIIn = \relative do'' {

la4. la8 re4
dod4. si8 dod4
re2 re4
re4. mi8 dod4
re2.
re8 mi re do si la
sol4. sol8 la sib\mbreak
la4 re8 mi fa mi
re do si4. do8
do2 r4
r do re
mi2 mi4
mi8 re mi dod re4
re8 do re la si4
do4. si8 do re
si2 si4
si\breve

}

VIIIbcn = \relative do {

fa2.
mi
re2 sol,4
la2.
re4 re' do
si2.
do8 re do sib la sol\mbreak
fa2.
fa,4 sol2
do2.
do
dod
re
mi\mbreak
la, 
mi' 
mi,\breve

}

VIIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 3/4
\tempo 2 = 50
s2.*16
s\breve
\bar"|."


}

VIIIdsI = {
	\VIIIglobal
	\clef french
	\notypeset
	<<\VIIIdsIn \forma>>

}

VIIIdsII = {
	\VIIIglobal
	\clef french
	<<\VIIIdsIIn \forma>>

}

VIIIbc = {
	\VIIIglobal
	\clef bass
	<<\VIIIbcn \forma \VIIIbfn>>
	\typeset

}

IXglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}


IXdsIn =  \relative do'' {

R1
re4 mi fa2~
fa4 sol8 fa mi2

%4
fa4. sol8 la2
sol4. fa8 sol4. la8
fad2 sol~

%7
sol4 la fad4. mi16 fad\mbreak
sol2 r8 re mi fa
sol4 fa8\prall mi re4 sol8 fa

%10
mi4. fa8 sol4 mi
fa8 mi re do si4. mi8
dod4 re mi4. mi8\mbreak

%13
re4 mi fa mi
re mi re4. do8
si2. si4

%16
si\breve

}

IXdsIIn = \relative do'' {

la4 si do2~
do4 re8 do si2
do2. si4

%4
la2 re~
re4 mi dod4. si16 dod
re4 do sib2

%7
la4 re do4. re8\mbreak
si2 r8 si do re
mi4 re8 do si4. si8

%10
si2. do8 si
la4 si8 la sold4. sold8
la4 si dod4. dod8\mbreak

%13
si4 dod re do?
si do si4. la8
sold2. sold4

%16
sold\breve

}

IXbcn = \relative do {

fa1
re
do

%4
fa
mi
re2 sol4 do,

%7
re1
sol,2 sol'4 fa
mi fa sol sol,

%10
do2. do4
re2 mi
la, la'4 sol

%13
fa mi re2
re1
mi 

%16
mi,\breve


}

IXbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 45
s1*15
s\breve
\bar"|."


}

IXdsI = {
	\IXglobal
	\clef french
	\notypeset
	<<\IXdsIn \forma>>

}

IXdsII = {
	\IXglobal
	\clef french
	<<\IXdsIIn \forma>>

}

IXbc = {
	\IXglobal
	\clef bass
	<<\IXbcn \forma \IXbfn>>
	\typeset

}

Xglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}


XdsIn =  \relative do'' {

la'2 la4. sol8
fa4. mi8 fa4. sol8
mi2. sol8 la
fa4\prall mi re4.\prall do8
si2 sol'~
sol4 sol fa4.\prall mi8
re2 sol4. la8\mbreak
fad4 sold la2~
la4 la8 si sold4. fad16 sold
la2. mi4
fa2 sol
do, re4. mi8
fa2 fad4. fad8
sold4 sold la4. si8\mbreak
sold2. sold4
sold\breve

}

Xhcn = \relative do'' {

do2 re4. dod8
re2 la4 si
do4. re8 do4. si8
la4 do si4. la8
sol2 do~
do4 la re4. do8
si2 dod\mbreak
re4 si mi2
re4. dod8 re4. mi8
dod2 do4 sib
la2 sib
la si4. dod8
re2 do
si4 si do4. re8\mbreak
si2. si4
si\breve

}

Xtln = \relative do' {

fa2 fa4. sol8
la2 re,
sol mi4. fa8
re4 mi fa2
mi2 r8 mi fa sol
la2. la4
sol2. sol4\mbreak
la re, mi2
fad si
mi, fa4 sol
do, re mi sol
fa la sol2
la2. la4
mi2. mi4\mbreak
mi1
mi\breve

}

Xbcn = \relative do {

fa2. r8 mi
re1
do
re
mi2. mi4
fa2. re4
sol2 mi\mbreak
re do
si1
la2 la'4 sol
fa2 mi
fa4. sol8 fa4. mi8
re2. re4
mi2 la,\mbreak
mi'1
mi,\breve

}

Xbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 65
s1*15
s\breve
\bar"|."

}

XdsI = {
	\Xglobal
	\clef french
	\notypeset
	<<\XdsIn \forma>>

}

Xhc = {
	\Xglobal
	\clef soprano
	<<\Xhcn \forma>>

}

Xtl = {
	\Xglobal
	\clef mezzosoprano
	<<\Xtln \forma>>

}

Xbc = {
	\Xglobal
	\clef bass
	<<\Xbcn \forma \Xbfn>>
	\typeset

}

XIglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}


XIdsIn =  \relative do'' {

la4 si do re
mi fa sol mi
fa2 fad4. fad8

%4
sold4 sold la4. si8
sold4. fad8 mi2~
mi4 fa8 mi re2

%7
sol do,~\mbreak
do4 re8 do si2
mi la,~

%10
la4 si si4. si8
si2 do4. re8
si2 r8 si do re

%13
mi4 fa sol mi
fa4. mi8 fa4. sol8
la2 la,4 sib\mbreak

%16
do2. do4
do si! sib4. do8
la2 fa'~

%19
fa4 sol8 fa mi2
fa4. sol8 la2~
la4 la8 sib sol4. fa8

%22
mi2 fa~
fa4 sol8 fa mi2~\mbreak
mi4 fa8 mi re2~

%25
re4 re re4.dod8
re2. re4
re2 do4. si8

%28
do4 re8 mi mi4 re8. do16
si\breve\prallprall

}

XIhcn = \relative do'' {

r2 la4 si
do re mi do
do2 si~

%4
si4 si do4. re8
si2. do8 si
la2. si8 la

%7
sol2. la8 sol\mbreak
fa2. sol8 fa
mi2. mi4

%10
fa2 fad4. fad8
sol2 la4. si8
sold2 r8 sol la si

%13
do2. do4
sib2. do8 sib
la2 fa4 sol\mbreak

%16
la2. la4
sol1
fa4 sol la fa

%19
sib2. do8 sib
la4 si do re
si2. si4

%22
la2. la4
sib la sib sol\mbreak
la sol la fa

%25
sol4. fad8 sol4. la8
fad2 si4 la
sold2. sold4

%28
la4. si8 do4 si8.\prall la16
sold\breve\prallprall

}

XItln = \relative do' {

do4 re8 mi fa4 re
sol2. sol4
la2 re,~

%4
re4 re do4. re8
mi2. re4
do2 re

%7
mi2. mi4\mbreak
la,2 re
sol, do

%10
la4 re re4. re8
re2 do4. si8
mi2. fa4

%13
sol fa mi2
re2. re4
do2. do4\mbreak

%16
fa2 la,4 sib
do2. do4
do4. fa8 re2~

%19
re4 re sol2
do, fa~
fa4 fa8 sol mi4. re8

%22
do2. do4
re2 mi\mbreak
fa4 do re la

%25
mi'2. mi4
la,2 re4 do
si2 mi4. mi8

%28
mi2 la, 
mi'\breve

}

XIbcn = \relative do {

fa1
mi
re

%4
mi
mi
fa

%7
mi\mbreak
re
do

%10
re
mi
mi

%13
do
re2. re4
fa1\mbreak

%16
fa
mi
fa

%19
sol
fa
sol

%22
la
sol\mbreak
fa

%25
mi
re
mi

%28
mi
mi,\breve

}

XIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 45
s1*28
s\breve
\bar"|."


}

XIdsI = {
	\XIglobal
	\clef french
	\notypeset
	<<\XIdsIn \forma>>

}

XIhc = {
	\XIglobal
	\clef soprano
	<<\XIhcn \forma>>

}

XItl = {
	\XIglobal
	\clef mezzosoprano
	<<\XItln \forma>>

}

XIbc = {
	\XIglobal
	\clef bass
	<<\XIbcn \forma \XIbfn>>
	\typeset

}

XIIglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}


XIIdsIn =  \relative do'' {

R1*2
r4 mi8 fad sol4 mi
la4 sol8 fa mi4 sol

%5
fa2 fad4. fad8
sold4 sold la4. si8
sold4. la8 si2~\mbreak

%8
si4 si la4. la8
la1
sol

%11
mi4. fa8 sol2
fa mi\mbreak
re2. mi4

%14
fad1
mi
mi

%17
re\mbreak
mi
mi~

%20
mi4 fad sol4. fad8
mi2 fad
sol fad

%23
mi2. fad8 mi\mbreak
red2 mi
fad1

%26
sold2 mi~
mi4 mi la4. sol8
fad4. sol8 la2~\mbreak

%29
la4 la sol4. fa8
mi2 la
fad4. sold8 la4. si8

%32
sold2. r8 sold
sold\breve

}

XIIdsIIn = \relative do'' {

r4 la8 si do4 la
mi' re8 do si4 re
do2 dod4. dod8

%4
re2 la4. la8
la2 re~
re4 do8 si do4. re8

%7
si2 mi4. re8\mbreak
dod1
re

%10
si4. do8 re2
do2. si4
la1\mbreak

%13
la
si
si

%16
la
si\mbreak
do4. si8 la2

%19
si1
do2 re
do4. si8 la4 re8 do

%22
si4 sol re'2
sol, la\mbreak
si1

%25
si
si
dod4. re8 mi2~

%28
mi4 mi re4. do8\mbreak
si4. do8 re2
do2. si4

%31
la2 re
si2. r8 si
si\breve

}

XIIcbn = \relative do {

R1*6
r4 mi8 fad sol4 mi\mbreak
la4 sol8 fa mi4 sol

%9
fa re8 mi fad mi fad re
sol[fad sol la si la si sol]
do4 do,8 re mi re mi do

%12
fa la fa la dod, mi la sol\mbreak
fad4 fad8 sold la sold la fad
si4 la8 sol fad4 la

%15
sold8 si sold si mi, mi re mi
do mi fad sold la do, re do
si [la' la la re, si sold' sold]\mbreak

%18
la4 la,8 si do4 la
mi' re8 do si4 re
do la' si, sol'

%21
do, do' re, si'
mi,8 si' si si re, si' si si
do, si' si si la do, do do\mbreak

%24
si la' si fad sol fad sol mi
si'4 si,8 dod red dod red si
mi[red mi fad? sold fad! sold mi]

%27
la4 la,8 si dod si dod la
re[dod re mi fad mi fad re]\mbreak
sol4 sol,8 la si la si sol

%30
do[si do re mi re mi do]
re[do re mi fa mi fa re]
mi4 re8[do si la sold fad]

%33
mi\breve

}

XIIbcn = \relative do {

R1
r4 mi8 fad sol4 mi
la sol8 fa mi4 sol

%4
fa mi8 re dod2
re2. re'8 do
si2 la

%7
mi1\mbreak
la,
re

%10
sol
do,
re2 dod\mbreak

%13
re1
red
mi2. re4

%16
mi1
si\mbreak
la

%19
sold
la2 si
do re

%22
mi re
do1\mbreak
si2 mi

%25
red1
mi
la,

%28
re\mbreak
sol,
do

%31
re
mi
mi\breve

}

XIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
%\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 50
s1*32
s\breve
\bar"|."


}

XIIdsI = {
	\XIIglobal
	\clef french
	\notypeset
	<<\XIIdsIn \forma>>

}

XIIdsII = {
	\XIIglobal
	\clef french
	<<\XIIdsIIn \forma>>

}

XIIcb = {
	\XIIglobal
	\clef bass
	<<\XIIcbn \forma>>

}

XIIbc = {
	\XIIglobal
	\clef bass
	<<\XIIbcn \forma \XIIbfn>>
	\typeset

}

XIIIglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}


XIIIdsIn =  \relative do'' {

mi4 si do
\once \override Stem #'transparent = ##t sold2 la4
si8. do16 re8[mi16 re mi re do si]

%4
\once \override Stem #'transparent = ##t do2 re4
mi8 la mi4 fa\mbreak
dod4. dod8[dod8. dod16]

%7
re[re mi fa sol8 la16 sol la sol fa mi]
fa4 la,16[sol la si do si do re]\mbreak
mi re mi fa sol4 si,16 la si dod

%10
re[dod re mi fad mi fad sold la8 sol?16 fad]
mi8[la16 sol fad8 mi mi8. re16]\mbreak
re4 fad4. fad8

%13
sold4. sold8[sold8. sold16]
la8[si16 la sold8 la la sold16 la]
si4 fad sol

%16
\once \override Stem #'transparent = ##t red2 mi4\mbreak
fad8.[sol16 la8 si16 la si la sol fad]
sol4 re mi

%19
si8 mi si4 do
sold8.[la16 si8 do re mi16 si]\mbreak
do4 do8. do16 re4

%22
mi8 la mi4 fa
dod8[mi16 fa sol8 la16 sol la sol fa mi]
fa[mi fa sol la sib la sol fa sol la sol]\mbreak

%25
fa[sol fa mi re mi fa mi re mi re do]
si8 mi si4 do
sold4. la8[la sold16 la]

%28
si4 r16 do[si do do8\prall si16 do]
si\breve\prallprall

}

XIIIcbn = \relative do {

R2.
mi4 si do
\once \override Stem #'transparent = ##t sold2.

%4
la8 la' mi4 fa
\once \override Stem #'transparent = ##t dod2 re4\mbreak
mi8.[fa16 sol8 la16 sol la sol fa mi]

%7
fa4 \once \override Stem #'transparent = ##t dod2
re16[dod re mi fa mi fa sol la sol la si]
do4 mi,16[re mi fad sol fad sol la]

%10
si la si do re4 fad,16 mi fad sol
la8[fad si sol la la,]\mbreak
\once \override Stem #'transparent = ##t  re2.~

%13
re4. mi16[re mi re do si]
do4 si la
sol si mi

%16
si' fad sol\mbreak
\once \override Stem #'transparent = ##t red2.
mi4 si do

%19
\once \override Stem #'transparent = ##t sold2 la4
si8.[do16 re8 mi16 re mi re do si]\mbreak
la8 la' mi4 fa

%22
\once \override Stem #'transparent = ##t dod2 re4
\once \override Stem #'transparent = ##t mi2.
re16[do re mi fa sol fa mi re mi fa mi]\mbreak

%25
re[mi re do si do re do si do si la]
\once \override Stem #'transparent = ##t sold2 la4
mi' si do

%28
\once \override Stem #'transparent = ##t sold2 la4
mi\breve

}

forma = {

\key la\minor
\time 3/2
\override NoteHead #'duration-log = 1
\set Score.measureLength = #(ly:make-moment 3 4)
\tempo 2 = 45
s2.
\time 3/4
\set Staff.explicitTimeSignatureVisibility = #all-invisible
\override Staff.TimeSignature.break-visibility = #all-invisible
s2.*27
\set Score.measureLength = #(ly:make-moment 8 4)
\revert NoteHead #'duration-log
s\breve
\bar"|."

}

XIIIdsI = {
	\XIIIglobal
	\clef french
	\notypeset
	<<\XIIIdsIn \forma>>

}

XIIIcb = {
	\XIIIglobal
	\clef bass
	<<\XIIIcbn \forma >>
	\typeset

}

XIVglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}


XIVdsIn =  \relative do'' {

do8[si do re mi re mi fa]
sol[fa sol la sol la sol la]
sib2 r8 la sib sol

%4
la2 la,8 sol la sib
do[do re mi fa mi fa sol]
la[la, la si do si do re]\mbreak

%7
si2 r8 re mi fa
sol[fa sol la sol la sol la]
fa[mi fa sol fa sol fa sol]

%10
mi[mi fad sold la la sol? la]
fad[fad sol la si la si fad]
sol2 r8 la sol la

%13
fad[mi fad sol fad sol fad la]
sol[sol, sib do re do re mi]
fa[sol la sol fa mi re do]

%16
si[re mi fa sol la sol fa]\mbreak
mi do re mi fa2
r8 si, do re mi2

%19
r8 la, si do re2
r8 re[mi fa sol fa sol mi]
fa[mi fa sol fa sol fa sol]

%22
la[sol la sib la sib la sol]\mbreak
fa sol fa mi re4.\prall re8
re4 mi8 re do4. re8

%25
si4 la8 si la4. si8
sold4. la8 la4. sold16 la
si\breve

}

XIVhcn = \relative do'' {

sol2 do~
do4 re mi2
re8[do re  mi re mi re mi]

%4
do2 fa,8 mi fa  sol
la la la sib do2
fa,8 [mi fa sol la sol la si]\mbreak

%7
sol[la sol la sol la sol la16 si]
do2. do4
re2. re4

%10
sol,8[sol la si do re mi mi]
la, la si do re2\mbreak
r8 mi re mi dod2

%13
re8[do re mi re mi re do]
si[la sol la sib la sib do]
la2. la4

%16
sol8[si do re mi re mi si]\mbreak
do[si do re do re do re]
si!2 sib8 la sib do

%19
la2 la8 sol la sib
sol4. la8 si4 dod
re8[do re mi re mi re mi]

%22
do[si do re do re do sib]\mbreak
la4 re8 do si do si la
sold[fad sold mi la sold la si]

%25
sold4 la8 sold fad2
mi4. fad8 fad4. mi16 fad
sold\breve

}

XIVtln = \relative do' {

mi8[re mi fa sol la sol fa]
mi[re mi fa mi fa mi sol]
fa mi fa sol fa4 sol

%4
fa8 fa mi re do2
fa la,8 sol la sib
do2 fa4 do\mbreak

%7
re2 r8 si do re
mi[do mi fa mi re mi mi]
la,[sol la si la si la si]

%10
do2 mi
re fad\mbreak
mi8[re mi fad mi fad mi mi]

%13
la2 r8 sol la fad
sol4 re sol2
do,4 fa8[sol la sol fa mi]

%16
re4. do8 si4 si'\mbreak
la2. la4
re,8 re mi fa sol2

%19
r8 do, re mi fa2
r8 si, do re mi2
la, la'

%22
fa2. fa4\mbreak
do8 do re mi fa4 re
mi2. mi4

%25
mi2 red
re! do4. re8
mi\breve

}

XIVbcn = \relative do {

do1
do
re2. mi4

%4
fa1
fa
fa

%7
fa
mi
re

%10
do
re
mi

%13
re
sol
fa

%16
sol
la 
sol 

%19
fa
mi
re 

%22
fa
fa
mi

%25
mi
mi
mi,\breve

}

XIVbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 65
s1*26
s\breve
\bar"|."


}

XIVdsI = {
	\XIVglobal
	\clef french
	\notypeset
	<<\XIVdsIn \forma>>

}

XIVhc = {
	\XIVglobal
	\clef soprano
	<<\XIVhcn \forma>>

}

XIVtl = {
	\XIVglobal
	\clef mezzosoprano
	<<\XIVtln \forma>>

}

XIVbc = {
	\XIVglobal
	\clef bass
	<<\XIVbcn \forma \XIVbfn>>
	\typeset

}

XVglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}





XVrecn =  \relative do'' {

la2. r8 la
la4 la re re8 mi
fad4 fad fad fad8 mi

%4
re4 re8 mi fad4 fad8 sol
la4 la la la8 sol
fad4 fad8 mi re4 re8 mi\mbreak

%7
fad4 fad fad fad8 sol
la sol la si la4 sol8 la
si4 si si si8 la

%10
sol4 mi sol sol8 la
si4 si si si8 la
sol4 sol8 la si4 la8 sol\mbreak

%13
la[sol la si la si la sol]
fad[mi fad sol fad mi re mi]
dod4 dod dod4. dod8

%16
dod[si dod re dod re dod re]
mi4 mi mi la8 sol\mbreak
fad mi fad sol mi4.\prall re8

%19
re mi fad sol la4 la8 sol
fad mi fad sol mi4.\prall re8
re4 la'8 la la4 la

%22
fad2 r
r4 la8 sol fad mi fad re\mbreak
mi2 r

%25
r4 mi8 mi mi4 mi
dod2 r
r4 mi8 re dod si dod la

%28
si2 r
r4 mi8 re dod4 mi\mbreak
la,4 la8 si si4. la8

%31
la2 r
r4 mi'8 mi mi4 mi
dod2. re4

%34
mi la8 la la4 la
fad2. fad4\mbreak
sol sol8 sol sol4 sol

%37
mi2 la4. la8
la4 sol fad4.\prall mi8
mi2 r4 fad8 sol

%40
la4 sol8 la fad2
r4 re sol2\mbreak
r4 mi la2

%43
r4 fad si si8 la
sol[la si la sol la sol fad]
mi4. mi8 mi2

%46
R1
r4 la8 la la4 la
fad8 mi fad sol mi4.\prall re8\mbreak

%49
re\breve

%%% parte in 3/4

fad8 mi fad sol la4
mi la la,

%52
re8 dod re fad mi re
dod4. si8 la4
la' mi8 fad sol la

%55
fad4. fad8 sold4
la la4.\prall sold8\mbreak
la2.

%58
r4 la8 sol la mi
fad4 fad4.\prall mi16 fad
sol4. sol8 sol4

%61
sol4. la8 fad4
fad si mi,
mi la re,

%64
re4. mi8 dod4\mbreak
re8 mi fad sol la4
si mi,4.\prall re8

%67
re2.
R2.*7
mi8 re mi fad mi fad

%76
mi2 mi4
fad4. mi8 fad4
sol4. la8 fad4

%79
sol sol8 fad sol la
fad2 r4\mbreak
r4 mi8 re mi fad

%82
sol2 r4
r sol8 si la sol
fad4. sol8 la4

%85
re,4. mi8 fad sol
mi4. mi8 la4
sol8\prall fad mi4. re8

%88
re2.\mbreak
\set Staff.midiInstrument = #"oboe" <<{fad4^\markup\italic"hautb[ois] seuls" fad fad
mi mi fad

%91
re re4. mi8
dod2 dod4}\\{re4 re re 
             dod dod re
             si si4. dod8
             la2 la4}>>
R2.*4

%97
\set Staff.midiInstrument = #"recorder"<<{si'4^\markup\italic"flutes seules" si si
la la si\mbreak
sol sol4. la8

%100
fad2 fad4}\\{sol4 sol sol
             fad fad sol
             mi mi4. fad8
             red2 red4}>>
R2.*4
mi4^\tu mi mi

%106
fad2 fad4\mbreak
sold la4. si8
sold2 sold4

%109
R2.*3
r4 mi mi
fad sol8 fad mi re

%114
dod2 re4\mbreak
R2.
r4 la' la

%117
si la4. sol8
sol4 <<{sol8^\markup\italic"fl. seules" fad sol la
        \set Staff.midiInstrument = #"oboe" si4 fad8^\markup\italic"hautb. seuls" mi fad sol
        
        %120
        la4}\\{mi8 re mi fad
               sol4 re8 dod re mi
               fad4}>> r r
R2.
\set Staff.midiInstrument = #"recorder" r4 fad8^\markup\italic"tous les instr. a vent" re mi fad

%123
sol la sol fad mi re\mbreak
dod4 dod2
R2.*2

%%%% tempo di 2/2

%127
fad4. mi8 fad4. sol8
la2. r8 la
si2 r8 si la sol

%130
fad4. mi8 fad4. sol8
la2 r8 la sol fad
mi2. r8 mi\mbreak

%133
mi1
la4. sol8 fad sol fad mi
re4. mi8 fad  mi re do

%136
si2 si'4. la8
sol4. la8 si la sol fad
mi4. fad8 [sol fad mi re]\mbreak

%139
dod2 r
R1
r2 la'8 fad sol la

%142
si la sol fad mi4. re8
re\breve
 
}

XVfln = \relative do'' {

fad,2. r8 fad
fad4 fad8 sol la4 la8 sol
fad4 fad fad4. fad8

%4
fad4 fad8 sol la4 la
re re re la
la la la4. la8\mbreak

%7
re[dod re mi re dod re mi]
re4 re re re
re re8 do si4 si8 do

%10
re4 sol, sol8 la si do
re4 sol, sol8 la si do
re4 re8 do si4 si8 dod\mbreak

%13
re4 re re4. re8
re4 re la4. la8
la[sold la si la sold la si]

%16
la4 la la4. la8
la4 mi la4. la8\mbreak
la4 la la4. la8

%19
la4 la la8 sol la si
la4 si la4. la8
la4 la8 si dod4 dod

%22
la2 r
r4 si8 dod re dod re si\mbreak
dod2 r

%25
r4 dod8 dod si4 si
la2 r
r4 fad8 sold la sold la fad

%28
sold2 r
r4 sold mi mi\mbreak
fad mi mi4. mi8

%31
mi2 r
r4 la8 la sold4 sold
la2. si4

%34
dod dod8 dod dod4 dod
la2. la4\mbreak
si re8 re re4 re

%37
do2. do4
si4 si si4. si8
si2 r4 la8 si

%40
dod4 si8 dod la2
r4 sol si2\mbreak
r4 la dod2

%43
r4 re re si
si2. si4
la4. la8 la2

%46
R1
r4 dod8 dod dod4 dod
la si la4. la8\mbreak

%49
la\breve

%%%%%%% seconda parte

la8 sold la si la si
dod re dod si la4

%52
la4. si8 sold4
la2 mi4
la la4. la8

%55
la4. la8 si4
dod8 re si4.\prall la8\mbreak
la2.

%58
R
r4 re8 do re la
si4. si8 si4

%61
mi,2 la4
re,2 sol4
la la8 sol la fad

%64
sol4 sol8 fad sol mi\mbreak
fad sol la si la4
sol sol4. fad8

%67
fad2.
R2.*8
do'2 do4

%77
re2 re4
re do8 si do re
si4 si8 la si dod

%80
re2 r4\mbreak
r dod8 si dod re
si2 r4

%83
r re4. re8
re2 re4
si4. dod8 re4

%86
dod4. dod8 re4
re dod4. re8
re2.\mbreak

%89
R2.*16
do4 do sol
la2 la4\mbreak

%107
si do4. re8
si2 si4
R2.*3

%112
r4 dod dod
re mi8 re dod si
la2 la4\mbreak

%115
R2.
r4 la re
re re4. re8

%118
re4 r r
R2.*3
r4 re re

%123
re si4. si8\mbreak
la4 la2
R2.*2

%127
la2. r8 la
re2. r8 re
re mi re dod si4. dod8

%130
re2 r8 re dod si
la4. sold8 la4. si8
la2 si4 sold\mbreak

%133
mi4 mi'8 re dod re dod si
la2. r8 la
la1

%136
r8 la si do re4. do8
si2 r8 do si la
sol4. la8 si2\mbreak

%139
mi, r
R1
r2 re'4. re8

%142
re4 si dod4. si8
la\breve

}

XVobn = \relative do' {

re2. r8 re
re4 re8 mi fad4 fad8 mi
re4 re re4. re8

%4
re4 re re la'
la la8 sol fad4 fad
fad fad fad4. fad8\mbreak

%7
fad4 fad8 sol la4 la
la la la la
sol re sol sol

%10
re re re re8 do
si4 si8 do re4 re8 do
si4 re sol sol\mbreak

%13
fad fad fad4. mi8
re4 re8 mi fad dod re4
mi mi dod4. la8

%16
mi'4 mi dod4. la8
mi'[re mi fad mi fad mi fad]\mbreak
re4 re mi4.\prall fad8

%19
fad sol fad sol mi4 fad8 mi
re la' sol mi mi4. fad8
fad4 fad8 fad mi4 mi

%22
re2 r
r4 la' la la\mbreak
la2 r

%25
r4 mi8 fad sold4 sold
mi2 r
r4 mi mi mi

%28
mi2 r
r4 mi mi dod\mbreak
re dod si4. dod8

%31
dod2 r
r4 dod8 re mi4 mi
mi2. mi4

%34
la la8 la mi4 mi
fad2. fad4\mbreak
re si si' si

%37
sol2 la4. sol8
fad4 mi fad4. fad8
sold2 r4 mi8 mi

%40
mi4 re8 mi re2
r4 re mi2\mbreak
r4 mi fad2

%43
r4 fad sol sol8 fad
mi[fad sol fad mi fad mi re]
dod4. dod8 dod2

%46
R1
r4 mi8 mi mi4 mi
fad re8 mi mi4. fad8\mbreak

%49
fad\breve

%%%%% seconda parte

re4 re8 mi fad4
mi2 mi4

%52
fad2 re4
mi4. re8 dod4
mi mi4. mi8

%55
re4. re8 re4
mi mi4. mi8\mbreak
mi2.

%58
R2.*2
r4 mi8 re mi si
dod4 re8 do re la

%62
si2 si4
fad'2 fad4
si, mi4. mi8\mbreak

%65
la,4 re re
re4. mi8 dod4
re2.

%68
R2.*8
sol2 sol4
la4. sol8 la4

%78
sol la la
sol sol sol
la2 r4\mbreak

%81
r4 la mi
mi2 r4
r sol fad8 mi

%84
re mi fad mi re4
re sol la
la2 la4

%87
si la4. sol8
fad2.\mbreak
R2.*16

%105
sol4 sol8 fad mi4
re2 re4\mbreak
re mi4. mi8

%108
mi2 mi4
R2.*3
r4 la la 

%113
fad si2
mi,2 fad4\mbreak
R2.

%116
r4 fad fad
si8 sol la4. si8
si4 r r

%119
R2.*3
r4 la8 fad sol la
si do si la sol fad\mbreak

%124
mi4 mi2
R2.*2
re2. r8 re

%128
re4. mi8 fad4. fad8
sol2 r8 sol fad mi
re4. dod8 re4. mi8

%131
fad2 re4 mi
mi2 r8 fad mi re\mbreak
dod re dod si la4. si8

%134
dod2 re~
re4 re re4. re8
re2 r8 si dod re

%137
mi4. fad8 sol2
r4 si, si4. si8\mbreak
dod2 r

%140
R1
r2 fad4 re
sol sol sol4. la8

%143
fad\breve

}

XVfgn = \relative do {

re1
re
re

%4
re
re
re\mbreak

%7
re
re
re

%10
re
re
re\mbreak

%13
re
re
la'

%16
la,
la'\mbreak
re,2 la

%19
re la'
re,4 sol, la2
re4 re dod2

%22
re r
r4 la re re,\mbreak
la'2 r

%25
r4 la' sold2
la r
r4 mi la la,

%28
mi'2 r
r4 mi la sol\mbreak  %%fine pagina 13
fad la mi mi,

%31
la2 r
r4 la mi'2
la,1

%34
r4 la' la la
re,2. re4\mbreak
sol sol sol sol

%37
do,2 la4. la8
si4 mi si2
mi2. la4

%40
la la re,2
r4 sol mi2\mbreak
r4 la fad2  %%% inizio pag 15

%43
r4 si8 la sol4 sol
sol2. sol4
la4. la8 la2

%46
R1
r4 la la la
re, re la' la,\mbreak

%49
re\breve

%%%%5 seconda parte

re2.
dod

%52
si
la
dod

%55
re4. dod8 si4
la mi' mi,\mbreak
la4 la'8 sol la mi

%58
fad4 dod2
re2.
sol,

%61
la
sol
fad 

%64
mi\mbreak
re4. mi8 fad4
sol la2 

%67
re,2.
R2.*8
\tieDashed do'2.~

%77
do\tieSolid 
si4 la re
sol, sol' sol

%80
re2 r4\mbreak
r la' la
mi2 r4

%83
r si8 la si dod
re4. mi8 fad4
sol2 re4

%86
la'4. sol8 fad4
sol la la,
re,2.\mbreak

%89
re'4 re re
la' la fad
sol sol mi

%92
fad2 fad4
R2.*4
sol4 sol sol

%98
re' re si\mbreak
do do la
si2 si4

%101
R2.*4
do,2 do4
do2.\mbreak

%107
si4 la2
mi' mi4
R2.*3

%112
r4 la la
re, sol2
la la4\mbreak

%115
R2.
r4 re, re
sol re re,

%118
sol do do
sol'8 fad sol la si4
fad r r

%121
R2.
r4 re8 do si la
sol2.\mbreak

%124
la4 la2
R2.*2
re4. dod8 re4. mi8

%128
fad2. re4
sol4. fad8 sol4. la8
si2 r8 si la sol

%131
fad4. mi8 fad4. sol8
la2 sold\mbreak
la2 la4. sol8

%134
fad sol fad mi re4. mi8
fad1
sol

%137
sol
sol2. r8 sol\mbreak
la2 r

%140
R1
r2 re,8 do si la
sol2 la

%143
re,\breve

}


XVdsIn =  \relative do'' {

R1*2
la2. r8 la
la4 la re re8 mi

%5
fad4 fad fad fad8 mi
re4 re8 mi fad4 fad8 sol
la4 la la la8 sol

%8
fad mi fad sol fad4 mi8 fad
sol4 sol sol sol8 la
si4 si si si8 la

%11
sol4 re sol sol8 la
si4 si8 la sol4 fad8 mi\mbreak
fad[mi fad sol fad sol fad sol]

%14
la[sol la si la sol fad sol]
mi4\prall mi mi4. mi8
mi[re mi fad mi fad mi re]

%17
dod4 dod dod4. dod8\mbreak
re8 dod re mi dod4. re8
re4. mi8 dod4. dod8

%20
re dod re mi dod4. re8
re2 r
r4 la'8 la la4 la

%23
fad2 r\mbreak
r4 la8[sol fad mi fad re]
mi2 r

%26
r4 mi8 mi mi4 mi
dod2 r
r4 mi8 re dod si dod la

%29
si2 r\mbreak
R1
r4 mi8 re dod4 mi

%32
la, la8 si si4. la8
la4 mi'8 mi mi4 mi
dod2. dod4

%35
re re8 re re4 re\mbreak
si2. si4
do mi8 mi mi4 mi

%38
red mi mi4. red8
mi4 dod8 re mi4 re8 mi
dod2 r4 re

%41
si2 r4 mi\mbreak
dod2 r4 fad
re2 r

%44
R1
r4 la'8 la la4 la
fad8 mi fad sol mi4.\prall re8

%47
re4 mi8 mi mi4 mi
re8 dod re mi dod4. re8\mbreak
re\breve

%%% seconda parte

%50
R2.*6
r4 mi8 re mi si\mbreak
dod4 dod4.\prallprall si16 dod

%58
re4 la'8 sol la mi
fad4 fad4.\prallprall mi16 fad
sol4. sol8 sol4

%61
sol4. la8 fad4
fad si mi,
mi la re,

%64
re4. mi8 dod4\mbreak
re8 mi fad sol la4
si mi,4.\prall re8

%67
re2.
mi4 mi8 re mi fad
re4.\prall dod8 re4

%70
si mi4. re8
dod4. si8 la4
la'8 si la sol fad mi\mbreak

%73
re4. re8 mi4
fad4. fad8 sold4
la2.

%76
sol8 fad sol la sol la
fad4. mi8 fad4
sol4. la8 fad4

%79
sol2 r4
r re8 dod re mi\mbreak
dod2 r4

%82
r si8 la si dod
re4 re8 dod re mi
fad4. sol8 la4

%85
re,4. mi8 fad sol
mi4. mi8 la4
sol8 fad mi4. re8

%88
re2.\mbreak
R2.*4
<<{fad4^\markup\italic"seuls" fad fad

%94
mi mi fad8 mi
re dod dod4. si8
si2.}\\{re4 re re
        dod dod re8 dod
        si4 si4. lad8
        si2.}>>

%97
R2.*4
<<{si'4 si si
la la si8 la

%103
sol fad fad4. mi8
mi2.}\\{sol4 sol sol
        fad fad sol8 fad
        mi4 mi4. re8
        mi2.}>>
R2.*4

%109
mi4^\markup\italic"tous les viollons" mi mi
mi re do
si4. dod8 re4

%112
dod2.
R
r4 la' la\mbreak

%115
si do8 si la sol
fad4. mi8 fad4
sol fad4. sol8

%118
sol2 r4
R2.
r4 <<{mi8^\markup\italic"viol. seuls" re mi fad
      
      %121
      sol4 re8 dod re mi
      fad4}\\{dod8 si dod re
              mi4 si8 la si dod
              re4}>> r r
R2.\mbreak

%124
r4 mi8 dod re mi
fad mi mi4. re8
re2.

%127
la'2. r8 sol
fad4. sol8 fad4. mi8
re2. r8  re

%130
re mi re dod si4. si8
fad'2 r8 fad mi re
dod2 si\mbreak

%133
dod1
r2 la'4. sol8
fad4. sol8 la sol fad mi

%136
re mi re do si2
si'4. la8 sol fad mi fad
sol[la sol fad mi re dod si]\mbreak

%139
la2 la'8 fad sol la
si la sol fad mi4. re8
re2 fad8 re mi fad

%142
sol fad mi re dod4. re8
re\breve

}

XVhcn = \relative do' {

R1*2
re2. r8 re
re4 la'8 sol fad4 la

%5
la la re fad,8 sol
la4 la la re\mbreak
re la re la

%8
re re re re8 do
si4 si8 do re4 re8 do
si4 si8 do re4 re8 do

%11
si4 si8 do re4 re8 do
si4 si8 do re4 re\mbreak
la la la4. la8

%14
la4 la re,8 mi fad sol
la4 la mi4. mi8
la4 la mi4. mi8

%17
la4 la la mi\mbreak
la la8 si dod4 dod8 si
la4 fad mi4. mi8

%20
fad4 sol sol8 fad sol la
fad2 r
r4 la8 si dod4 dod

%23
la2 r\mbreak
r4 si8 dod re dod re si
dod2 r

%26
r4 dod8 dod si4 si
la2 r
r4 fad8 sold la sold la fad

%29
sold2 r\mbreak
R1
r4 sold mi mi

%32
fad mi mi4. mi8
mi4 dod'8 dod dod4 dod
la2. la4

%35
la la8 la la4 la\mbreak
sol2. sol4
sol do8 do do4 mi

%38
si si si4. la8
sold4 la la sold8 fad
mi2 r4 fad

%41
sol2 r4 sol\mbreak
la2 r4 la
si2 r

%44
R1
r4 dod8 dod dod4 dod
la si la4. la8

%47
la4 la8 la la4 la
la sol sol4. la8\mbreak
fad\breve

%%%%%%% seconda parte

%50
R2.*9
r4 re'8 do re la
si4. si8 si4

%61
mi,2 la4
re,2 sol4
la la8 sol la fad

%64
sol4 sol8 fad sol mi\mbreak
fad sol la si la4
sol sol4. fad8

%67
fad2.
dod'4 dod8 si dod re
si4. la8 si4

%70
si si4. si8
la2 la4
re4. mi8 re dod\mbreak

%73
si4. si8 dod4
re la re
dod!2.

%76
do2 do4
la2 la4
si do la

%79
si2 r4
r la la\mbreak
la2 r4

%82
r sol8 fad sol la
si4 si4. si8
la2 la4

%85
sol8 la si4 la
la4. la8 la fad
si4 mi, la

%88
la2.\mbreak
R2.*20
do4 do do

%110
do si la
la4. si8 sol4
la2.

%113
R
r4 mi' re\mbreak
re mi8 re do si

%116
la4 re re
re re4. re8
si2 r4

%119
R2.*5
r4 dod8 la si dod
re4 dod4. re8

%126
re2.
re2. r8 re
la2 r8 mi' re do

%129
si2. r8 si
si sol fad mi re4. re8
la' si la sol fad4 mi

%132
mi2 sold4 si\mbreak
la1
r8 la si dod re2

%135
la4. sol8 fad4 la
sol2 r8 re mi fad
sol2 r8 fad sol la

%138
si dod si la sol4. sol8\mbreak
sol2 fad8 re mi fad
sol4 si la4. la8

%141
la2 la4 re8 dod
si4 si la4. la8
la\breve

}

XVtln = \relative do' {

R1*2
fad,2. r8 fad
fad4 re' la la'

%5
re, re8 mi fad4 re8 mi
fad4 re re la'8 sol\mbreak
fad4 fad fad fad

%8
fad re la' la
re, sol si, re
sol sol sol sol

%11
re re8 do si4 sol'
re sol si, re\mbreak
re4 re re4. mi8

%14
fad4 re la' la,8 si
dod[si dod re dod si dod re]
dod4 dod la mi'

%17
mi mi mi dod\mbreak
la la8 si dod4 dod8 si
la4 la8 si dod4 la

%20
la re8 si dod4. si8
la2 r
r4 fad'8 fad mi4 mi

%23
re2 r\mbreak
r4 la' la la
la2 r

%26
r4 mi8 fad sold4 sold
mi2 r
r4 mi mi mi

%29
mi2 r\mbreak
R1
r4 mi mi dod

%32
re dod si4. dod8
dod4 dod8 re mi4 mi
mi2. mi4

%35
re re8 re re4 re\mbreak
re2. re4
mi mi8 mi mi4 dod

%38
red si si4. si8
si4 la8 si dod4 si8 dod
la2 r4 la

%41
si2 r4 si\mbreak
dod2 r4 dod
re2 r

%44
R1
r4 mi8 mi mi4 mi
re8 dod re mi dod4 re8 mi

%47
fad4 mi8 mi mi4 dod
re si dod4. si8\mbreak
la\breve

%%%%% seconda parte

%50
R2.*10
r4 mi'8 re mi si
dod4 re8 do re la

%62
si2 si4
fad'2 fad4
si, mi4. mi8\mbreak

%65
la,4 re re8 dod
si4 la4. la8
la2.

%68
la'2 mi4
fad2 fad4
mi2 mi4

%71
mi4. re8 dod4
fad4. sol8 la4\mbreak
sol2 sol4

%74
la2 si4
mi,2.
mi8 re mi fad mi fad

%77
re2 re4
re mi re
re2 r4

%80
r fad8 mi fad sol\mbreak
mi2 r4
r mi mi

%83
fad re4. re8
re4 la'8 sol fad4
re si fad'8 re

%86
mi4. mi8 fad4
mi mi4. fad8
fad2.\mbreak

%89
R2.*20
la4 la sol
fa2 fa4

%111
mi4. mi8 mi4
mi2.
R

%114
r4 dod la'\mbreak
sol4. fad8 mi4
re4. mi8 re do

%117
si4 re4. re8
re2 r4
R2.*5

%124
r4 la' la
la8 si la4. sol8
fad2.

%127
fad4. sol8 fad4. mi8
re2 la'4. la8
sol sol fad mi re4. re8

%130
re2 si4. dod8
re re dod si la4. si8
dod4. re8 mi4. mi8\mbreak

%133
mi2 r8 dod re mi
fad2. r8 fad
fad sol fad mi re4 la

%136
si8 do si la sol2
sol'4. fad8 mi2~
mi4 mi mi4. mi8\mbreak

%139
mi4. dod8 re4. re8
re4 mi mi4. fad8
fad2 fad4. fad8

%142
si,4 mi mi4. fad8
fad\breve

}

XVbcn = \relative do {

R1*2
re1
re

%5
re
re\mbreak
re

%8
re
re
re

%11
re
re\mbreak
re

%14
re
la
la'

%17
la,\mbreak
re2 la'
re, la

%20
re4 sol, la2
re, r
r4 re' dod2

%23
re r\mbreak
r4 la re re,
la'2 r

%26
r4 la' sold2
la r
r4 mi la la,

%29
mi'2 r\mbreak
R1
r4 mi la sol 

%32
fad la mi mi,
la la' la la
la,1

%35
r4 re re re\mbreak
sol,2. sol4
do la8 la la4 la

%38
si mi, si'2
mi,4 mi'8 re dod4 mi
la,2 r4 re

%41
sol,2 r4 mi'\mbreak
la,2 r4 fad'
si,2 r

%44
R1
r4 la8 si dod4 la
re sol, la2

%47
re,4 la'8 si dod4 la
re sol, la2\mbreak
re,\breve

%%% seconda parte

%50
R2.*7\mbreak
r4 la''8 sol la mi
fad4 dod2

%59
re2.
sol,
la

%62
sol
fad
mi\mbreak

%65
re4. mi8 fad4
sol la2
re,2.

%68
la''
la
sold

%71
la4. si8 la sol
fad4. mi8 fad4\mbreak
sol4. fad8 mi4

%74
re4. dod8 si4
la la si
do2.~

%77
do
si4 la re
sol,2 r4

%80
r re' re\mbreak
la2 r4
r mi' mi

%83
si si8 la si dod
re4. mi8 fad4
sol2 re4

%86
la'4. sol8 fad4
sol la la,
re,2.\mbreak

%89
R2.*4
re'4 re re
la' la fad

%95
sol8 mi fad4 fad,
si2.
R2.*4

%101
sol'4 sol sol
re' re si
do8 la si4 si,

%104
mi2.
R2.*4
do2 do4

%110
re2 re4
mi mi,2
la2.

%113
R
r4 la' fad\mbreak
sol do,2

%116
re8 mi re do si la
sol4 re'2
sol, r4

%119
R2.
r4 la' la
mi8 re mi fad sol4

%122
re r r
R2.
r4 la'8 sol fad mi

%125
re sol, la2
re,2.
re'1

%128
re
sol,2 sol'4. la8
si2 r8 si la sol

%131
fad4. mi8 fad4. sol8
la2 mi\mbreak
la, la'4. sol8

%134
fad sol fad mi re4. re8
re1
sol

%137
sol
sol2. r8 sol\mbreak
la8[sol fad mi re do si la]

%140
sol2 la
re, re'8 do si la
sol2 la

%143
re,\breve

}

forma = {

\key re\major
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 1 = 53
s1*48
\set Score.measureLength = #(ly:make-moment 8 4)
s\breve
\bar"||"\break
\time 3/4
\tempo 2. = 60
s2.*77\break
\time 2/2
\tempo 2 = 80
s1*16
s\breve
\bar"|."

}

XVrec = {
	\XVglobal
	\clef french
	\notypeset
	<<\XVrecn \forma>>

}

XVfl = {
	\XVglobal
	\clef soprano
	<<\XVfln \forma>>

}

XVob = {
	\XVglobal
	\clef mezzosoprano
	<<\XVobn \forma>>

}

XVfg = {
	\XVglobal
	\clef bass
	<<\XVfgn \forma >>
	\typeset

}

XVdsI = {
	\XVglobal
	\clef french
	<<\XVdsIn \forma>>

}

XVhc = {
	\XVglobal
	\clef soprano
	<<\XVhcn \forma>>

}

XVtl = {
	\XVglobal
	\clef mezzosoprano
	<<\XVtln \forma>>

}

XVbc = {
	\XVglobal
	\clef bass
	<<\XVbcn \forma >>
	\typeset

}

XVIglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}


XVIdsIn =  \relative do'' {

re2 sol4. fad8
mi4 fad sol2~
sol4 la8 sol fad4.\prallprall mi16 fad

%4
sol2 r8 re mi fa
sol4. fa8 mi4. re8
do2 re~

%7
re4 re mi2~\mbreak
mi4 mi fa2~
fa4 mi re4. do8

%10
si4. do8 re4 si
do4. si8 do4. re8
si2 sol'~

%13
sol4 fa8 mi fa4. sol8
mi2 mi4.\prall re8
re\breve

%16
sib8. do16 re8. re16 re2
r8 sib' sib8. sib16 lab8. sol16 lab8. sib16
sol2 sol4. sol8

%19
lab2 lab~\mbreak
lab4 sol sol4.\prall fa8
fa1

%22
R
r8 fa [fa8. fa16 mib8. re16 mib8. fa16]
re4 re re4.\prallprall do16 re\mbreak

%25
mib8.[fa16 sol8. fa16 mib8. fa16 mib8. re16]
do4 re8. mib16 do4. sib8
sib\breve

}

XVIhcn = \relative do'' {

si4. do8 re2
do2. re4
do4. si8 do4. re8

%4
si[la si do re si do re]
mi4. re8 do4. si8
la2. la4

%7
si2. si4\mbreak
do2. do4
re do si4. la8

%10
sol4. la8 si4 sol
la2. r8 la
sol4 la si4. do8

%13
re2. do8 si
do2 si4 la
si\breve

%16
fa8.[sib16 sib8. sib16 lab8. sol16 lab8. sib16]
sol8.[sol16 sol8. sol16 fa8. fa16 fa8. sol16]
mib?2 r8 sib' sib8. sib16

%19
do2 do4. do8\mbreak
re2 do4. sib8
la8.[do16 do8. do16 sib8. la16 sib8. do16]

%22
la2 r8 la la8. la16
sib4 sib do4. do8
fa,2 r8 sib sib8. sib16\mbreak

%25
sib2 do8. re16 do8. sib16
la4 sib la4. sib8
sib\breve

}

XVItln = \relative do' {

sol'4. la8 si4. la8
sol4 fad mi2~
mi4 mi la4. la8

%4
re,2 sol
do,8 re mi fa sol2
fa fa4 mi

%7
re re sol2\mbreak
mi4 mi la2
si4 sol sol4. sol8

%10
re2 sol4. fa8
mi2 re4. re8
re2. sol8 la

%13
si4. do8 si4. la8
sol2. fad4
sol\breve

%16
re8. mib16 fa8. fa16 fa2
mi re4. do8
sib4 mib2 mib4~

%19
mib8 mib mib8. mib16 fa2~\mbreak
fa4 sol8 fa mi4. fa8
fa8.[mib16 mib8. mib16 re8. do16 re8. mib16]

%22
do2 do4.\prallprall sib16 do
re4 sib sib4. la8
sib8.[sib'16 sib8. sib16 lab8. sol16 lab8. sib16]\mbreak

%25
sol2 la8. sib16 la8. sol16
fa4 sol fa4. sol8
sol\breve

}

XVIbcn = \relative do {

sol'1
do2. si4
la1

%4
sol
mi
fa

%7
sol\mbreak
la
sol

%10
sol
sol2 fad
sol1

%13
sol
sol
sol,\breve

%16
sib1
sib
mib,8. mib'16 mib8. mib16 reb8. do16 reb8. mib16

%19
do2 lab4. lab8\mbreak
sib2 do
fa fa,

%22
r8 fa'[fa8. fa16 mib8. re16 mib8. fa16]
re8.[re16 re8. re16 do8. do16 do8. re16]
sib2 r8 sib do8. re16\mbreak

%25
mib,1
fa
sib,\breve

}

XVIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp




}

forma = {

\key la\minor
\override Staff.TimeSignature.style = #'single-digit
\time 2/2
\tempo 2 = 60
s1*14
\set Score.measureLength = #(ly:make-moment 8 4)
s\breve \bar"||"\break
\key fa\major
\tempo 2 = 73
\set Score.measureLength = #(ly:make-moment 2 2)
s1*11
s\breve
\bar"|."

}

XVIdsI = {
	\XVIglobal
	\clef french
	\notypeset
	<<\XVIdsIn \forma>>

}

XVIhc = {
	\XVIglobal
	\clef soprano
	<<\XVIhcn \forma>>

}

XVItl = {
	\XVIglobal
	\clef mezzosoprano
	<<\XVItln \forma>>

}

XVIbc = {
	\XVIglobal
	\clef bass
	<<\XVIbcn \forma \XVIbfn>>
	\typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper {

    systems-per-page = #4

  }

  \markup\huge "[1.] Premier Kyrie - tous les instruments"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[Dessus]"}
            \IdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[Haute-""contre]"}
            \Ihc
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[Taille]"}
            \Itl
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \Ibc

          >>
        >>

      >>
    }

    \layout {

      indent = 1\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

  \paper {

    systems-per-page = #5

  }

  \markup \huge "Le second Kyrie pour les prestres"

  \markup\huge "[2.] 3.eme Kyrie pour les hautbois"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[I.er""Hautbois]"}
            \IIdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[2.nd""Hautbois]"}
            \IIdsII
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basson]"}
            \IIbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge "Le 4.eme Kyrie pour les prestres"

  \markup\huge "[3.] 5.eme Kyrie pour les viollons du petit choeur"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[I.er""Violon]"}
            \IIIdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[2.nd""Violon]"}
            \IIIdsII
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \IIIbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

  \paper {

    systems-per-page = #4

  }

  \markup \huge "Le 6.eme Kyrie pour les prestres"

  \markup\huge "[4.] 7.eme Kyrie a flute douces et une d'allem[and]"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"flutes""douces"}
            \IVdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[I] flute""d'allem[and]"}
            \IVhc
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[II] flute""d'allem[and]"}
            \IVtl
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"quatre basses""de flu[tes]"}
            \IVbc

          >>
        >>

      >>
    }

    \layout {

      indent = 2.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge "8.eme Kyrie pour les prestres"

  \markup\huge "[5.] 9.eme Kyrie pour tous les instruments"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[Dessus]"}
            \VdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[Haute-""contre]"}
            \Vhc
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[Taille]"}
            \Vtl
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \Vbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge "le celebrant entonne gloria in excelsis deo. Suivez immediatement apres"

  \markup\huge "[6.] et in terra pour tous les instruments"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[Dessus]"}
            \VIdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[Haute-""contre]"}
            \VIhc
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[Taille]"}
            \VItl
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \VIbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

  \paper {

    systems-per-page = #5

  }

  \markup \huge "laudamus te pour les prestres"

  \markup\huge "[7.] benedicimus te pour les hautbois"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[I.er""Hautbois]"}
            \VIIdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[2.nd""Hautbois]"}
            \VIIdsII
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basson]"}
            \VIIbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge "adoramus te pour les prestres"

  \markup\huge "[8.] glorificamus te pour les viollons"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[I.er""Violon]"}
            \VIIIdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[2.nd""Violon]"}
            \VIIIdsII
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \VIIIbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge "gratias pour les prestres"

  \markup\huge "[9.] d[omi]ne deus pour les flutes douces"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[I.ere""Flute]"}
            \IXdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[2.nde""Flute]"}
            \IXdsII
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \IXbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

  \paper {

    systems-per-page = #4

  }

  \markup \huge "domine filii pour les prestres"

  \markup\huge "[10.] d[omi]ne deus agnus dei p]ou]r tous les instruments a vent"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[Flute""douce]"}
            \XdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[Flute""allemand]"}
            \Xhc
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[Hautbois]"}
            \Xtl
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basson""Cromhorne]"}
            \Xbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.9\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge "qui tollis pour les prestres"

  \markup\huge "[11.] qui tollis pour tous les instr[uments] viollons, hautb[ois] et flutes"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Dessus]"}
            \XIdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[Haute-""contre]"}
            \XIhc
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[Taille]"}
            \XItl
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \XIbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

  \markup \huge "qui sedes pour les prestres"

  \markup\huge "[12.] quoniam pour le crom[h]orne"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"une octave"\vspace #-0.2"et deux flutes"\vspace #-0.2"douces en"\vspace #-0.2"taille"}
            \XIIdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"une octave"\vspace #-0.2"et une flute"\vspace #-0.2"douce en"\vspace #-0.2"taille"}
            \XIIdsII
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"english horn"
            \set Staff.instrumentName = \markup \center-column{"crom[h]orne"}
            \XIIcb
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"basses""de flute"}
            \XIIbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.8\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #10.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

  \paper {

    systems-per-page = #5

  }

  \markup \huge "tu solus d[omi]nus pour les prestres"

  \markup\huge "[13.] tu solus altissimus pour un dessus de hautbois et un cromhorne"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff \with {
            fontSize = #+2
            \override StaffSymbol #'staff-space = #(magstep +2)
          }<<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"dessus de""hautbois"}
            \XIIIdsI
          >>

          \new Staff \with {
            fontSize = #+3
            \override StaffSymbol #'staff-space = #(magstep +3)
          }<<
            \set Staff.midiInstrument = #"english horn"
            \set Staff.instrumentName = \markup \center-column{"cromhorne"}
            \XIIIcb

          >>
        >>

      >>
    }

    \layout {

      indent = 2.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #3
        \override StaffGrouper.staff-staff-spacing.basic-distance = #12
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

  \paper {

    systems-per-page = #4

  }

  \markup \huge "com sancto spiritu pour les prestres"

  \markup\huge "[14.] in gloria pour tous les instruments"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[Dessus]"}
            \XIVdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[Haute-""contre]"}
            \XIVhc
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[Taille]"}
            \XIVtl
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \XIVbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

  \paper  {

    systems-per-page = #2

  }

  \markup \huge {[15.] offerte a deux choeurs}

  \score {
    {
      <<

        \new ChoirStaff \with {
          \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #10
        }<<

          \new PianoStaff\with {instrumentName = \markup\huge\center-column{"choeur des"\vspace #-0.2"instruments"\vspace #-0.2"a vent"}} <<

            \new Staff \with {
              fontSize = #+1
              \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
              \set Staff.midiInstrument = #"recorder"
              \set Staff.instrumentName = \markup \center-column{"[Flute douce]"}
              \XVrec
            >>

            \new Staff \with {
              fontSize = #+1
              \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
              \set Staff.midiInstrument = #"flute"
              \set Staff.instrumentName = \markup \center-column{"[Flute allemand]"}
              \XVfl
            >>

            \new Staff \with {
              fontSize = #+1
              \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
              \set Staff.midiInstrument = #"oboe"
              \set Staff.instrumentName = \markup \center-column{"[Hautbois]"}
              \XVob
            >>

            \new Staff \with {
              fontSize = #+1
              \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
              \set Staff.midiInstrument = #"bassoon"
              \set Staff.instrumentName = \markup \center-column{"[Basson"\vspace #-0.2"Cromhorne"\vspace #-0.2"Basse de flute]"}
              \XVfg
            >>
          >>

          \new PianoStaff\with {instrumentName = \markup\huge\center-column{"choeur des"\vspace #-0.2"viollons"}} <<

            \new Staff \with {
              fontSize = #+1
              \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
              \set Staff.midiInstrument = #"violin"
              \set Staff.instrumentName = \markup \center-column{"[Violon]"}
              \XVdsI
            >>

            \new Staff \with {
              fontSize = #+1
              \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
              \set Staff.midiInstrument = #"violin"
              \set Staff.instrumentName = \markup \center-column{"[Haute-contre]"}
              \XVhc
            >>

            \new Staff \with {
              fontSize = #+1
              \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
              \set Staff.midiInstrument = #"viola"
              \set Staff.instrumentName = \markup \center-column{"[Taille]"}
              \XVtl
            >>

            \new Staff \with {
              fontSize = #+1
              \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
              \set Staff.midiInstrument = #"cello"
              \set Staff.instrumentName = \markup \center-column{"[Basse]"}
              \XVbc
            >>
          >>
        >>

      >>
    }

    \layout {

      indent = 3\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

  \paper {

    systems-per-page = #4

  }

  \markup\huge "[16.] Sanctus pour tous les instruments"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"[Dessus]"}
            \XVIdsI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"[Haute-""contre]"}
            \XVIhc
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"[Taille]"}
            \XVItl
          >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basse]"}
            \XVIbc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #9.5
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}





%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
