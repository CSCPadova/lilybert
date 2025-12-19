\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

dolce = _\markup \italic \center-align"doux"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "tutti"

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

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

Iglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \terzinesenza
			}

IvlIn = \relative do'' {

r4 do' fa, sol
lab sol2 fa4~
fa mi fa mib8 reb

%4
do4 fa sib, mib~
mib reb2 do4
sib2 lab

%7
sol la4 sib~
sib la reb do~
do sib do sol'

%10
lab mi fa lab\mbreak
sib fa sol sib
do sol lab do

%13
reb do fa, sol
lab sol2 fa4~
fa mi fa sib,~

%16
sib lab reb2~
reb4 do fa, sol
lab2 sol

%19
fa1\fermopz

}

IvlIIn = \relative do'' {

r2 r4 do
fa, sol lab2
sol fa4 sib

%4
mib, fa sol2
lab sol4 lab~
lab sol2 fa4~

%7
fa mib2 reb4
do fa2 mi4
fa2 mi

%10
r4 do' lab2\mbreak
r4 re sib2
r4 mi do la'

%13
sib mi, fa2~
fa4 mi8 re do2
sib lab4 r

%16
do2. sib4
mi,2 fa~
fa mi

%19
fa1\fermopz

}


IvlaIn = \relative do' {

R1*2
r2 r4 sol'
do, re mib2

%5
do4 reb sib do
re! do do do
reb do do sib

%8
do2 sib4 sol'
fa2 do
r4 sol' fa2\mbreak

%11
r4 sib sol2
r4 do lab r
R1*2

%15
r4 sol lab sol8 fa
mib2 reb
sol,4 do2 sib4

%18
do1~
do\fermopz

}

IvlaIIn = \relative do' {

R1*4
r2 r4 do
fa, sol lab2

%7
reb4 sol, fa sib
fa2 fa4 do'
lab sib sol2

%10
r4 do fa,2
r4 fa' sib,2
r4 sol' do, fa

%13
sib, do reb2\mbreak
do4. sib8 lab2
sol fa8 fa' mib reb

%16
do2 fa,4 sib
sol2 fa
do 'sol

%19
lab1\fermata

}

Ivcn = \relative do {

R1*2
r4 do' fa, sol
lab2 sol

%5
fa4 sib mib, lab
re, mi fa lab,
sib do fa,2

%8
fa4 fa' sib, do
reb2 do
r4 do reb2\mbreak

%11
r4 re! mib2
r4 mi fa r
R1*2

%15
r4 do fa, sol
lab2 sib
do reb

%18
do1
fa,\fermata

}

Ibcn = \relative do {

R1*2
r4 do' fa, sol
lab2 sol

%5
fa4 sib mib, lab
re, mi fa lab,
sib do fa,2

%8
fa4 fa' sib, do
reb2 do
r4 do reb2\mbreak

%11
r4 re! mib2
r4 mi fa r
R1*2

%15
r4 do fa, sol
lab2 sib
do reb

%18
do1
fa,\fermata

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



}


forma = {

\key do\minor
\time 4/4
\tempo 2 = 50
s1*19
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

IvlaI = {
	\Iglobal
	\clef alto
	<<\IvlaIn \forma>>

}

IvlaII = {
	\Iglobal
	\clef tenor
	<<\IvlaIIn \forma>>

}


Ivc = {
	\Iglobal
	\clef bass
	<<\Ivcn \forma>>

}


Ibc = {
	\Iglobal
	\clef bass
	<< \Ibcn \forma \Ibfn >>
	\typeset

}

IIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \terzinesenza
			}

IIvlIn = \relative do'' {

r2 r8 sib'16 lab sol fa sol mib
lab8 mib lab lab, r sol'16 fa mi re mi do
fa8 do fa  fa, r sib sol, mi'

%4
fa lab' sib, lab' mib, sol' lab, sol'
re, fa' sol, fa' do, mib sol do\mbreak
re, fa si re mib, sol do mib

%7
fa,16 sol fa mib re4 do r
r8 reb'16 do sib lab sib sol do8 do16 sib lab sol lab fa
sib8 sib16 lab sol fa sol mid lab sol lab sol fa4~

%10
fa mi fa8 lab do fa
sol, sib mi sol\mbreak lab, lab'16 sol fa mib? re do
sib8 sol r4 r8 do'16 sib lab sol fa mib

%13
re8 si sol'2 fa4~
fa mib re2
do r

%16
do reb
do sib
lab sol

%19
fa8 fa'16 do mib la, do fa, re'4 r\mbreak
r8 mib16 sib reb sol, sib mib, do'8 mib4 lab,8~
lab reb4 sol, do lab'16 sol

%22
fa mib reb do sib4 lab lab'~
lab8 sol16 fa sol fa mib re mib fa mib fa sol4~
sol8 lab16 sol fa mib fa re sol8 sol16 fa mib re mib do

%25
fa8 fa16 mib re do re si\mbreak mib re mib re do4~
do si do do'~
do sib lab2~

%28
lab4 sol2 fa4~
fa mi fa8 lab sib, lab'
mib, sol' lab, sol' re, fa' sol, fa'

%31
<mi do sol do,>8 do16. mi32 fa8 do16. fa32 sol8 do,16.sol'32 lab8 do,16. lab'32
sol4 lab\mbreak mi fa
mi8 do16. mi32 fa8 do16. fa32 sol8 do,16. sol'32 lab8 do,16. lab'32

%34
sol16 lab sol lab sib lab sib lab sol lab sol lab sib lab sib lab
sol8 lab sol4 fa4 r
R1

%37
r2 sol
lab sol
fa mib

%40
re do4 do'~
do sib2 la4
sib r do,2

%43
sib lab4 lab'~
lab sol2 fa4
mi8 do16. mi32 fa8 do16. fa32 sol8 do,16. sol'32 lab8 do,16. lab'32

%46
sol4 lab mi fa
mi8 do16. mi32 fa8 do16. fa32 sol8 do,16. sol'32 lab8 do,16. lab'32
sol16 lab sol lab sib lab sib lab sol lab sol lab sib lab sib lab

%49
sol8 lab sol4 fa8 sol,16 lab sib lab sib lab
sol lab sol lab sib lab sib lab sol8 lab sol4
fa r r2

}

IIvlIIn = \relative do'' {

do2 reb
do sib
lab sol

%4
fa8 fa'16 mib re do re sib mib8 sib mib mib,
r re'16 do si lab si sol do8 sol do do,
r fa' re, si' do, mib lab do

%7
re, fa si re mib, mib' fa, mib'\mbreak
sib, reb' mib, reb' lab, do' re, do'
sol, sib' do, sib' fa lab do fa

%10
sol, do mi sol lab, do fa lab
sib,16 do sib lab sol4 fa r
r8 sol'16 fa mib re do si do4 fa~

%13
fa r8 mib16 re do4 r8 re16 do
si8 sol do2 si4\mbreak
do8 do16 sib lab sol fa mi fa8 reb'16 do sib lab sol fa

%16
mi4 r r8 sib''16 lab sol fa sol mib
lab8 mib lab lab, r sol'16 fa mi re mi do
fa8 do fa fa, r sib sol, mi'

%19
fa4 r r8 sib'16 fa lab re, fa sib,
sol'4 r r8 do, mib4\mbreak
lab, reb sol, do

%22
reb16 do sib lab sol8 sol'~sol fa16 mi fa mib re? do
si do si do re4. do16 si do sib lab! sol
fa8 lab' sib, lab' mib, sol' lab, sol'

%25
re, fa' sol, fa' do, mib sol do
re, fa si re mib,4 do'
reb2 do\mbreak

%28
sib lab
sol fa8 fa'4 sib,8~
sib mib4 lab, reb sol,8

%31
sol4 r r2
mi'8 do16. mi32 fa8 do16. fa32 sol8 do,16. sol'32 lab8 do,16. lab'32
sol4 lab mi fa

%34
mi16 fa mi fa sol fa sol fa\mbreak mi fa mi fa sol fa sol fa
mi8 fa mi4 fa8 reb16 do sib lab sib sol
do8 do16 sib lab sol lab fa sib8 sib16 lab sol fa sol mi

%37
lab sol lab sol fa2 mi4
r8 fa'16 mib re do re sib mib8 sib mib mib,
r re'16 do si lab si sol do8 sol do do,

%40
r fa' sol,, mi' do'4 r
reb2\mbreak do
sib4 sib'2 lab4~

%43
lab sol lab r
sib,2 lab
sol4 lab do r

%46
mi8 do16. mi32  fa8 do16. fa32 sol8 do,16. sol'32 lab8 do,16. lab'32
sol4 lab mi fa
mi16 fa mi fa sol fa sol fa mi fa mi fa sol fa sol fa

%49
mi8 fa mi4 fa8 mi,16 fa sol fa sol fa
mi fa mi fa sol fa sol fa mi8 fa mi4
fa4 r r2

}


IIvlaIn = \relative do' {

R1*3
r8 lab'16 sol fa mib  fa re sol8 sol16 fa mib re mib do
fa8 fa16 mib re do re si mib re mib re do4~

%6
do si sol8 do mib[sol]
lab, do sol4 sol8 mib'16 reb do sib do la\mbreak
sib8 sib'16 lab sol fa sol mib lab8 mib lab lab,

%9
r sol'16 fa mi re mi do fa8 do fa fa,
r sib' do, mi fa, fa' do[lab]
reb sol, do[mi,] do' do'16 sib lab sol fa mib

%12
re8 si'16 lab sol fa mib re\mbreak do8 do re mib
r8 si do mib r la, si re
r re do sol' lab fa re sol

%15
sol4 do, fa sib,
do8 do'16 sib la sol la fa sib8 sib, mib[mib,]
r lab'16 sol fa mib fa re\mbreak sol8 sol, do[do,]

%18
r fa'16 sol lab sol lab fa sib8 sol do do,
do4 r8 fa re sib r sib'
sol mib r mib mib mib mib mib

%21
mib reb reb reb reb do do do
sib sib sib sib do4 re
re r\mbreak sol2

%24
lab! sol
fa mib
re do8 mib16 reb do sib do la

%27
sib4 r r8 do16 sib lab sol lab fa
sib4 r8 sib do16 sib do sib lab8 do
reb reb do do do4 fa~\mbreak

%30
fa8 sol mib4. reb8 reb4
do r r2
R1*3

%35
r2 r8 sib'16 lab sol fa sol mib
lab8 mib lab lab, r sol'16 fa mi re mi do
fa8 do fa fa, r sib' sol, mi'

%38
fa lab16 sol fa mib fa re sol8 sol16 fa mib re mib do
fa8 fa16 mib re do re si mib re mib re do4~
do si sol8 sol' fa fa

%41
fa fa fa fa\mbreak sol sol fa fa
fa fa mib mib mib mib mib mib
fa fa mib mib mib mib mib mib

%44
mib mib mi mi do do do do
do4 do do r
do do do r

%47
do do\mbreak do do
do r r2
do8 do do4 do r

%50
r2 do8 do do4
do r r2

}

IIvlaIIn = \relative do' {

R1*6
r2 do
reb do

%9
sib lab
sol fa8 do' lab fa
sib2 lab8 do re fa

%12
r re mib sol mib mib re la
si re mib, sol la do re, fa
sol si do mib lab, do sol re'\mbreak

%15
mi4 do lab! sib
sol8 do fa fa, r reb'16 do sib lab sib sol
do8 do16 sib lab sol lab fa sib8 sib16 lab sol fa sol mi

%18
lab sol lab sol fa4~fa mi
lab8 do la fa r fa' re sib\mbreak
r8 sib sol mib lab lab lab lab

%21
lab lab sib sib sib sol lab lab
lab lab mib mib mib4 lab
sol re' sol, do

%24
do8 fa4 sib, mib lab,8~
lab re4 sol, do8~do16 sib do sib
lab8 fa re sol sol4 r

%27
r8 reb'16 do sib lab sib sol do4 r\mbreak
r8 sib16 lab sol fa sol mi lab sol lab sib do8 lab
reb sib sol do lab4 r8 sib16 lab

%30
sol fa sol mib lab8 lab16 sol fa mib fa reb sol4
sol r r2
R1*3

%35
r4 r8 do fa, reb' mib, reb'
lab do re, do' sol sib do, sib'
fa lab do fa sol, sib mi sol

%38
lab,4 r r8mib'16 re do sib do lab
re8 re, sol' sol, r do16 re mib re mib re
fa8 re sol sol, sol do do do

%41
sib sib sib sib\mbreak do do do do
reb reb sib sib lab lab lab lab
sib sib sib sib do do do do

%44
sib sib sib sib do do do do
do4 lab do r
do lab do r

%47
do lab\mbreak do lab
do r r2
do8 lab do sol lab4 r

%50
r2 do8 lab do sol
lab4 r r2

}

IIvcn = \relative do {

R1*2
r2 sol'
lab sol

%5
fa mib
re do~
do4 si do8 do'16 sib la sol la fa

%8
sib8 sib, mib[mib,] r lab'16 sol fa mib fa re\mbreak
sol8 sol, do  [do,] r fa'16 sol lab sol lab fa
sib8 sol do do, fa4 fa,~

%11
fa mi fa8 fa' fa, fa'
sol, sol' sol, sol' lab, lab'16 sol fa mib re do
si8 sol'16 fa  mib re do sib la8 fa'16 mib re do si la

%14
sol8 sol' lab! mib fa re sol sol,
do2 reb
do4 r r8 reb' mib, reb'

%17
lab, do' reb, do' sol, sib' do, sib'
fa, lab do fa sol, sib mi sol
lab, fa' fa, la'\mbreak sib, sib' sib, re'

%20
mib,, mib' mib, sol' lab,8 lab'16 mib solb do, mib lab,
fa'8 lab16 do, fa sib, reb sib mib8 sol16 do, mib lab, do lab
sib8 reb' mib mib, lab4 fa

%23
sol si do mib,
fa8 fa16 mib re do re sib mib8 mib16 re do sib do lab
re8 re16 do si lab si sol\mbreak do8 do16 re mib re mib do

%26
fa8 re sol sol, do do' la, do'
sib, sib' sol, sib' lab, lab' fa, lab'
sol, sol' mi, sol' fa, fa' lab, fa'

%29
sib,4 do fa,8 fa'16 mib re do re sib\mbreak
mib8 mib16 reb do sib do lab! reb8 reb16 do sib lab sib sol
do4 r r2

%32
R1*3
do'2 reb
do sib
lab sol

%38
fa8 fa sib, lab' mib, sol' lab, sol'\mbreak
re, fa' sol, fa' do, mib sol do
re, fa si re  mib, do''16 sib la sol la fa

%41
sib8 sib,16 do reb do reb sib mib8 do fa fa,
sib sib'16 lab sol fa sol mib lab8 lab,16 sib do sib do lab\mbreak
reb8 sib mib mib, lab lab16 sib do sib do lab

%44
mib'8 mib16 fa sol fa sol mi fa8 fa16 sol lab sol lab fa
do'4 fa, do r
do' fa, do r

%47
do' fa, do fa,
do' r r2
do'8 fa, do4 fa, r

%50
r2 do''8 fa, do4
fa, r r2

}

IIbcn = \relative do {

R1*2
r2 sol'
lab sol

%5
fa mib
re do~
do4 si do8 do'16 sib la sol la fa

%8
sib8 sib, mib[mib,] r lab'16 sol fa mib fa re\mbreak
sol8 sol, do  [do,] r fa'16 sol lab sol lab fa
sib8 sol do do, fa4 fa,~

%11
fa mi fa8 fa' fa, fa'
sol, sol' sol, sol' lab, lab' fa re
si sol' mib do la fa' re si\mbreak

%14
sol sol' lab! mib fa re sol sol,
do2 reb
do4 r r8 reb' mib, reb'

%17
lab, do' reb, do' sol, sib' do, sib'
fa, lab do fa sol, sib mi sol
lab, fa' fa, la'\mbreak sib, sib' sib, re'

%20
mib,, mib' mib, sol' lab,4 do
fa sib, mib lab,
reb mib lab fa

%23
sol si do mib,
fa8 fa16 mib re do re sib mib8 mib16 re do sib do lab
re8 re16 do si lab si sol\mbreak do8 do16 re mib re mib do

%26
fa8 re sol sol, do do' la, do'
sib, sib' sol, sib' lab, lab' fa, lab'
sol, sol' mi, sol' fa, fa' lab, fa'

%29
sib,4 do fa,8 fa'16 mib re do re sib\mbreak
mib8 mib16 reb do sib do lab! reb8 reb16 do sib lab sib sol
do1~

%32
do~
do~
do

%35
do'2\tu reb
do sib
lab sol

%38
fa8 fa sib, lab' mib, sol' lab, sol'\mbreak
re, fa' sol, fa' do, mib sol do
re, fa si re  mib, do''16 sib la sol la fa

%41
sib8 sib,16 do reb do reb sib mib8 do fa fa,
sib sib'16 lab sol fa sol mib lab8 lab,16 sib do sib do lab\mbreak
reb8 sib mib mib, lab lab16 sib do sib do lab

%44
mib'8 mib16 fa sol fa sol mi fa8 fa16 sol lab sol lab fa
do'4 fa, do r
do' fa, do r

%47
do' fa, do fa,
do' r r2
do'8 fa, do4 fa, r

%50
r2 do''8 fa, do4
fa, r r2

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



}


forma = {

\key do\minor
\time 4/4
\tempo 2 = 60
s1*51
\bar"|."

}

IIvlI = {
	\IIglobal
	\notypeset
	<<\IIvlIn \forma>>

}

IIvlII = {
	\IIglobal
	<<\IIvlIIn \forma>>

}

IIvlaI = {
	\IIglobal
	\clef alto
	<<\IIvlaIn \forma>>

}

IIvlaII = {
	\IIglobal
	\clef tenor
	<<\IIvlaIIn \forma>>

}


IIvc = {
	\IIglobal
	\clef bass
	<<\IIvcn \forma>>

}


IIbc = {
	\IIglobal
	\clef bass
	<< \IIbcn \forma \IIbfn >>
	\typeset

}

IIIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \terzinesenza
			}

IIIvlIn = \relative do'' {

do2 sol'2. lab4
si,1 do2~
do si4 do re2~

%4
re do4 re mib2~
mib re4 do re sib
sol'1.~

%7
sol2 fa2. mib4
re2 sib'1~
sib2 lab4 sol lab2~

%10
lab4 sol lab sol lab2~
lab4 sol lab sol lab2~
lab4 sol sol2. fad4

%13
fad2 sol4 fad sol2~
sol4 fad sol fad sol2~\mbreak
sol4 lab fad2 fa~

%16
fa mib4 re mib2~
mib4 re mib re mib2~
mib4 fa re2. mib4

%19
mib1.
re1 do4 re
mib1 re4 mib

%22
fa1 mib4 fa
sol2 do, sib4 do
la2 re do4 re

%25
si2. si4 do2~
do4 si do si do2~
do4 re mib re mib2~

%28
mib4 fa re2. do4
do re, mib re mib re
mib fa sol(fa) sol(fa)

%31
sol lab re,2. do4
do1.\fermopz

}

IIIvlIIn = \relative do'' {

do1 lab2
sol1sol2
re'1 do4 re
mib1 re4 mib

%5
fa1.~
fa2 mib4 re mib do
lab'1.~

%8
lab2 sol2. fa4
mi2. mi4 fa2~
fa4 mi fa mi fa2~

%11
fa4 mi fa mi fa2~
fa4 sol mi2 mib
re4 la sib la sib2~

%14
sib4 la sib la sib2~\mbreak
sib4 lab lab2. sol4
sol2. fa4 sol2~

%17
sol4 fa sol fa sol2~
sol4 lab fa2. mib4
mib2 do'1~

%20
do2 si4 do re2~
re do4 re mib2~
mib4 re mib re fa2~

%23
fa mib4 fa sol2~
sol fa1~
fa2 mib4 re mib2~

%26
mib4 re mib re mib2
do4 si do si do2
r4 re si2. do4

%29
do si, do si do si
do re mib(re) mib(re)
mib do si2. do4

%32
do1.\fermopz

}


IIIvlaIn = \relative do' {

sol'1 fa2
re1 mib2
lab sol sol

%4
sol1 sol2\mbreak
fa1 sib2
sib1 sol2

%7
lab do lab
fa sib2. lab4
sol1 fa2

%10
fa r fa
fa r fa
do1 do2

%13
la r sol
do r mi
re1 re2

%16
re sib1
do2 r do\mbreak
sib1 r2

%19
sib sol' mib
lab! sol1
sol sol2

%22
fa1 fa2
mib1 do2
do re1

%25
re do2
do r do
do r do

%28
sol'1 sol2
sol r r
R1.

%31
do,4 lab sol2 sol
sol1._\fermata

}

IIIvlaIIn = \relative do' {

mib1 re2
re1 do2
re sol, sol'

%4
mib1 sib2
do sib fa'
sol1 do,2

%7
fa1 do2
re1 reb2
sol, do lab

%10
lab r lab
lab r re
do sol1

%13
re'2 r re
do r sol\mbreak
sol la1

%16
sib sib2
lab! r mib
mib fa1

%19
sol do2
re1 sol,2
sol sol1

%22
do2 sib sib
sib sol1
la la2

%25
si1 sol2
lab! r sol
lab r la

%28
sol1 sol2
mib' r r
R1.

%31
mib4 re re2 sol,
mi1.\fermopz

}

IIIvcn = \relative do {

do'2 mib, fa
sol fa mib
fa sol sol,

%4
do do' sol
lab sib sib,
mib mib, mib'fa fa, fa'

%7
sib sib, sib'
do do, fa\mbreak
reb r reb

%10
sib r si
do1 do2
do r sib!

%13
do r dod
re1 re,2
sol1 sol2

%16
lab1 la2
sib1.
mib,2 mib' do

%19
fa sol sol,\mbreak
do do' sol
lab sib sib,

%22
mib1 mi2
fa1 re2
sol sol, do

%25
lab! r mib
fa r fad
sol1.

%28
do2 r r
R1.
do'4 fa, sol2 sol,

%31
do,1.\fermata

}

IIIbcn = \relative do {

do'2 mib, fa
sol fa mib
fa sol sol,

%4
do do' sol
lab sib sib,
mib mib, mib'fa fa, fa'

%7
sib sib, sib'
do do, fa\mbreak
reb r reb

%10
sib r si
do1 do2
do r sib!

%13
do r dod
re1 re,2
sol1 sol2

%16
lab1 la2
sib1.
mib,2 mib' do

%19
fa sol sol,\mbreak
do do' sol
lab sib sib,

%22
mib1 mi2
fa1 re2
sol sol, do

%25
lab! r mib
fa r fad
sol1.

%28
do2 r r
R1.
do'4 fa, sol2 sol,

%31
do,1.\fermata

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



}


forma = {

\key do\minor
\time 3/2
\tempo 2 = 50
s1.*32
\bar"|."

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

IIIvlaI = {
	\IIIglobal
	\clef alto
	<<\IIIvlaIn \forma>>

}

IIIvlaII = {
	\IIIglobal
	\clef tenor
	<<\IIIvlaIIn \forma>>

}


IIIvc = {
	\IIIglobal
	\clef bass
	<<\IIIvcn \forma>>

}


IIIbc = {
	\IIIglobal
	\clef bass
	<< \IIIbcn \forma \IIIbfn >>
	\typeset

}

IVglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \terzinesenza
			}

IVvlIn = \relative do'' {

fa8 do fa do fa do
sol' do, sol' do, sol' do,
lab'2.

%4
sol~
sol8 do, fa mi fa4~
fa8 sib, mi re mi4

%7
fa8 sol lab sol fa mib
re mib fa mib re do
si re sol fa mib re\mbreak

%10
do4 mib sol
si, re sol
sol,2.

%13
fa
mib4 mib'8 re mib4
fa sol8 fa sol4

%16
do,8 fa mi4. fa8
fa2.
R2.

%19
fa8 do fa do fa do
sol' do, sol' do, sol' do,\mbreak
lab' fa lab fa lab fa

%22
re fa re fa re fa
mib sol mib sol mib sol
do, mib do mib do mib

%25
fa re fa re fa re
si re si re si re
mib do mib do mib do\mbreak

%28
si re si re si re
sol2.~
sol4 fa2~

%31
fa4 mib re
mib8 fa re4. do8
do do' sol sib lab sol

%34
lab4 la2
r8 sib fa lab! sol fa
sol sol re fa mib re\mbreak

%37
mib sib' lab sol fa mib
fa4 sib, mib~
mib8 mib do mib fa4~

%40
fa8 fa re fa sol4~
sol8 sol mib sol lab4~
lab8 lab sol fa sol lab

%43
sol fa fa4. mib8
mib sib mib sib mib sib
fa' sib, fa' sib, fa' sib,

%46
sol'2.
fa~
fa8 sib, mib re mib4~

%49
mib8 lab, reb do reb4~
reb8 reb mib reb do sib
do2.

%52
sib
lab8 mib lab mib lab mib
sib' mib, sib' mib, sib' mib,\mbreak

%55
do'2.
sib
lab

%58
sol
fa'8 do fa do fa do
sol' do, sol' do, sol' do,

%61
lab'2.
sol~
sol8 do, fa mi fa4~

%64
fa8 sib, mib! re mib4~\mbreak
mib8 lab, reb do reb4~
reb8 mib sib reb do sib

%67
do do sol sib lab sol
lab mib' reb do sib lab
sib4 mib, lab~

%70
lab8 lab fa lab sib4~
sib8 sib sol sib do4~
do8 do lab do reb4~

%73
reb8 reb do sib do reb
do sib sib4. lab8
lab4 la2

%76
r8 fa' do mib reb do
reb sib' fa lab! solb fa
solb fa mib reb do mib

%79
reb do do4. sib8
sib reb fa reb sib reb\mbreak
la4 r r

%82
r8 reb fa reb sib fa'
la,2 r4
r8 sib' fa lab! solb fa

%85
solb fa mib reb do reb
mib reb do sib la do
sib do la4. sib8

%88
sib2 r4
R2.*3\mbreak
sib8 fa sib fa sib fa

%93
do' fa, do' fa, do' fa,
reb' sib reb sib reb sib
sol sib sol sib sol sib

%96
do lab do lab do lab
fa lab fa lab  fa lab
sib sol sib sol sib sol\mbreak

%99
mi sol mi sol mi sol
lab fa lab fa lab fa
mi sol mi sol mi sol

%102
do2.~
do4 sib2~
sib4 lab sol

%105
lab8 sib sol4. fa8
fa2 r4\mbreak
r8 do' sol sib lab sol

%108
lab2 r4
r8 do sol sib lab sol
lab fa' do mib reb do

%111
reb sol re fa mib re
mi sol mi sol mi sol
lab fa lab fa lab fa\mbreak

%114
mi sol mi sol mi sol
lab fa lab fa lab fa
mi4 do'2~

%117
do4 sib2~
sib4 lab sol
lab8 sib sol4. fa8

%120
fa4 r r
mi r r
fa r r

%123
sib, r r	\mbreak
lab4 sol2
fa2._\fermata

}

IVvlIIn = \relative do'' {

R2.*11
do8 sol do sol do sol
re' sol, re' sol, re' sol,

%14
mib'2.
re
do

%17
fa4 lab do
mi, sol do
do,2.

%20
sib
lab4 do do,
sib'8 re sib re sib re\mbreak

%23
sol,4 sib sib,
lab'8 do lab do lab do
fa,4 la la,

%26
sol'8 si sol si sol si
do mib do mib do mib
sol, si sol si sol si

%29
mib2.~
mib4 re do
si2 re4

%32
do8 re si4. do8
do2 r4\mbreak
r8 fa do mib re do

%35
re4 re2
r8 sib' fa lab! sol fa
sol sol fa mib re do

%38
re4. sib8 sol sib
do4. do8 lab do
re4. re8 sib re

%41
mib4. mib8 do mib
fa fa mib re mib fa
mib re re4. mib8

%44
mib2 r4\mbreak
R2.
mib8 sib mib sib mib sib

%47
fa' sib, fa' sib, fa' sib,
sol'2.
fa

%50
mib8 lab sol4. lab8
lab4 do, mib
sol, sib reb

%53
mib,2.
reb
do4 mib sol\mbreak

%56
fa re sol
lab, do fa
sib sol do

%59
lab2.
sol
fa4 fa8 sol lab4

%62
sib sib8 lab sol4
do4. do8 sib lab
sib4. sib8 lab sol

%65
lab4. lab8 sol fa
sol2 r4\mbreak
r8 mib' sib reb do sib

%68
do do sib lab sol fa
sol4. sol8 mib do
fa4. fa8 reb fa

%71
sol4. sol8 mib sol
lab4. lab8 fa lab
sib sib lab sol lab sib

%74
lab sol sol4. lab8
lab4 r r
R2.

%77
r8 sib reb fa mib reb\mbreak
mib reb do sib la do
sib do la4. sib8

%80
sib4 r r
r8 fa' do mib reb do
reb2 r4

%83
r8 fa do mib reb do
reb4 re2
mib8 reb do sib la fa'

%86
solb fa mib reb do mib
reb do do4. sib8
sib fa sib fa sib fa\mbreak

%89
do' fa, do' fa, do' fa,
reb'2.
do

%92
sib4 reb fa
la,do fa
fa, fa' fa,

%95
mib'8 sol mib sol mib sol
do,4 mib mib,
reb'8 fa reb fa reb fa

%98
sib,4 re! re,\mbreak
do'8 mi do mi do mi
fa lab fa lab fa lab

%101
do, mi do mi do mi
lab2.~
lab4 sol fa

%104
mi2 sol4
fa8 sol mi4. fa8
fa, lab do lab fa lab

%1'7
mi2 r4
r8 lab do lab fa lab
mi2.\mbreak

%110
r8 do' la do sib la
sib4 r r
do8 mi do mi do mi

%113
fa4 fa, fa'
do8 mi do mi do mi
fa4 fa, fa'

%116
sol lab!2~
lab4 sol fa
mi2 sol4

%119
fa8 sol mi4. fa8
fa4 r r\mbreak
do r r

%122
do r r
mi, r r
fa4 mi2

%125
fa2._\fermata

}


IVvlaIn = \relative do' {

R2.*2
fa8 do fa do fa do
sol' do, sol' do, sol' do,

%5
lab'2.
sol
fa4. sol8 lab sol

%8
fa mib re mib fa mib
re do si re sol fa
mib2.\mbreak

%11
re
do4 mib sol
si, re fa

%14
sol2.
fa
sol

%17
lab
sol
fa4 fa8 sol lab4

%20
sib sib8 lab sol4
do fa, fa
fa fa fa

%23
mib mib mib\mbreak
mib mib mib
re re re

%26
re2.
do
re

%29
mib4 mib mib
lab lab lab
re, sol sol

%32
sol8 lab re,4 sol
sol sol mi
fa fa fa

%35
fa fa fa
mib re re\mbreak
sib2.

%38
sib4. re8 mib mib
mib4. do8 fa fa
fa4. re8 sol sol

%41
sol4. mib8 lab lab
fa4 sib sib
do fa, sib

%44
sol sol sib\mbreak
re,4 fa sib
mib, sol sib

%47
re, fa sib
mib,2 mib4
fa2 reb4

%50
mib2 mib,4
mib'2.
reb

%53
do4 lab8 sib do4
reb reb8 do sib4
mib2.\mbreak

%56
re
do
sib2 do4

%59
do2.
R
fa4 lab do

%62
mi, sol sib
do, do fa
re sib mib

%65
do lab reb
sib mib mib\mbreak
mib mib mib

%68
mib2.
mib4. mib8 mib  mib
reb4. reb8 fa fa

%71
mib4. mib8 sol sol
fa4. fa8 lab lab
mib4 mib sib

%74
fa' sol mib
mib mib2
fa4 fa fa

%77
fa fa2\mbreak
mib4 solb do,
reb fa do

%80
reb r r
do r r
reb r r

%83
do r r
sib sib'2
solb4 do, fa

%86
sib, do fa
fa fa fa
reb2.\mbreak

%89
do
sib4 reb fa
la, do fa

%92
reb sib8 do reb4
mib mib8 reb do4
fa fa fa

%95
sol sol sol
mib mib mib
fa fa fa

%98
re re re\mbreak
mi2.
do

%101
mi
fa4 fa fa
fa fa fa

%104
do do mi
do8 reb do4 do
do r r

%107
do r r
do r r
do r r\mbreak

%110
do r r
reb r r
do do do

%113
do do do
do do do
do do do

%116
do fa fa
fa fa fa
do do mi

%119
do8 reb do4 do
do r r\mbreak
sol' r r

%122
fa r r
sol r r
do, do2

%125
do2._\fermata

}

IVvlaIIn = \relative do' {

R2.*9
do8 sol do sol do sol
re' sol, re' sol, re' sol,

%12
mib'2.
re~
re8 sol, do si do4~

%15
do8 fa, sib! lab! sib4~
sib8 sib do sib lab sol
fa4 fa8 sol lab4\mbreak

%18
sib sib8 lab sol4
do lab do
mi, sol sib

%21
do do do
re re re
sib sib sib

%24
do do do
la la la
si2.

%27
sol
si
do4 do do\mbreak

%30
do do do
sol sol si
mib8 re sol4 sol,

%33
sol do do
do do do
sib sib sib

%36
sib sib sib
sol2.
sib4. sib8 sib sib

%39
lab4. lab8 do do
sib4. sib8 re re\mbreak
do4. do8 mib mib

%42
sib4 sib sol
do re sib
sib2 r4

%45
R2.*6
lab4 lab8 sib do4
reb reb8 do sib4

%53
mib do fa
sol, sib reb
mib, do'8 sib do4

%56
re sib8 lab! sib4
do lab8 sol lab4
sib do8 sib lab sol

%59
lab4 lab do
mi, sol do
do2.

%62
sib
lab4 lab8 sol fa4
sol sol8 fa mib4

%65
fa fa8 mib reb4
mib sol sol\mbreak
lab sib sib

%68
lab2.
sol4. sol8 lab lab
lab4. fa8 sib sib

%71
sib4. sol8 do do
do4. lab8 reb reb
sib4 mib mib

%74
fa4 sib, mib
do do2
sib4 do do

%77
sib sib2\mbreak
do4 do fa,
fa fa fa

%80
fa r r
fa r r
fa r r

%83
fa r r
fa fa2
mib4 mib' la,

%86
sib mib la,
fa fa fa
fa reb' fa\mbreak

%89
la, do fa
sib, sib8 do reb4
mib mib8 reb do4

%92
fa2.
mib
reb4 reb reb

%95
sib sib sib
lab lab lab
lab lab lab

%98
sol sol sol\mbreak
sol2.
fa

%101
sol
lab4 lab lab
reb reb reb

%104
sol, do do
do8 sol sol4 sol
lab4 r r

%107
sol r r
fa r r
sol r r\mbreak

%110
fa r r
fa r r
do' sol sol

%113
fa fa fa
sol sol sol
fa fa fa

%116
do' do lab
reb reb reb
sol, do do

%119
do8 sol sol4 sol
lab4 r r\mbreak
sib r r

%122
lab r r
do r r
do do2

%125
lab2._\fermata

}

IVvcn = \relative do {

R2.*16
fa8 do fa do fa do
sol' do, sol' do, sol' do,

%19
lab'2.
sol
fa4 lab fa

%22
sib sib, sib'
mib, sol mib
lab lab, lab'

%25
re, fa re
sol2.
do,\mbreak

%28
sol'
mib4 sol mib
fa lab fa

%31
sol si sol
do8 fa, sol4 sol,
do mi do

%34
fa fa, fa'
sib, re sib
mib sib' sib,

%37
mib2.
sib'4. sib,8 sol mib
lab4. lab8 fa lab\mbreak

%40
sib4. sib8 sol sib
do4. do8 lab do
re4 sib mib

%43
lab sib sib,
mib2.
R2.*6

%51
lab8 mib lab mib lab mib
sib' mib, sib' mib,sib' mib,
do'2.

%54
sib~
sib8 mib, lab sol lab4~\mbreak
lab8 re, sol fa sol4~

%57
sol8 do, fa mi fa4~
fa8 sib, mi re mi4
fa2 r4

%60
R2.
fa8 do fa do fa do
sol' do, sol' do, sol' do,

%63
lab'2.
sol\mbreak
fa

%66
mib
lab,4 mib' mib,
lab2.

%69
mib'4. mib8 do lab
reb4. reb8 sib reb
mib4. mib8 do mib

%72
fa4. fa8 reb fa
sol4 mib lab!
reb, mib mib,\mbreak

%75
lab8 fa' do mib reb do
reb reb la do sib la
sib4 sib'2

%78
mib, fa4
sib, fa' fa,
sib reb8 fa reb sib

%81
fa'4 la8 do la fa
sib4 reb,8 fa reb sib
fa'4 la8 do la fa

%84
sib4 sib,2
mib fa4\mbreak
mib2 fa4

%87
sib, fa' fa,
sib2 r4
R2.

%90
sib8 fa sib fa sib fa
do' fa, do' fa, do' fa,
reb'2.

%93
do
sib8 reb sib reb sib reb
mib4 mib, mib'\mbreak

%96
lab,8 do lab do lab do
reb4 reb, reb'
sol,8 sib sol sib sol sib

%99
do4 do, do'
r fa, fa'
r do, do'

%102
lab8 do lab do lab do
sib reb sib reb sib reb
do mi do mi do mi

%105
fa8 sib, do4 do,\mbreak
fa lab8 do lab fa
do'4 mi8 sol mi do

%108
fa4 lab,8 do lab fa
do'4 mi8 sol mi do\mbreak
fa4 r r

%111
sib, sib'8 lab sol fa
do'4 do, do'
fa,8 lab fa lab fa lab

%114
do4 do, do'
fa,8 lab fa lab fa lab
do4 lab,8 do lab do\mbreak

%117
sib reb sib reb sib reb
do mi do mi do mi
fa8 sib, do4 do,

%120
fa'8 do fa do fa do
sol'do, sol' do, sol' do,
lab' do, lab' lab, lab' do,

%123
sol' do, sol' do, sol' do,\mbreak
fa4 do do,
fa2.\fermata

}

IVbcn = \relative do {

R2.*16
fa8 do fa do fa do
sol' do, sol' do, sol' do,

%19
lab'2.
sol
fa4 lab fa

%22
sib sib, sib'
mib, sol mib
lab lab, lab'

%25
re, fa re
sol2.
do,\mbreak

%28
sol'
mib4 sol mib
fa lab fa

%31
sol si sol
do8 fa, sol4 sol,
do mi do

%34
fa fa, fa'
sib, re sib
mib sib' sib,

%37
mib2.
sib'4. sib,8 sol mib
lab4. lab8 fa lab\mbreak

%40
sib4. sib8 sol sib
do4. do8 lab do
re4 sib mib

%43
lab sib sib,
mib2.
R2.*6

%51
lab8 mib lab mib lab mib
sib' mib, sib' mib,sib' mib,
do'2.

%54
sib~
sib8 mib, lab sol lab4~\mbreak
lab8 re, sol fa sol4~

%57
sol8 do, fa mi fa4~
fa8 sib, mi re mi4
fa2 r4

%60
R2.
fa8 do fa do fa do
sol' do, sol' do, sol' do,

%63
lab'2.
sol\mbreak
fa

%66
mib
lab,4 mib' mib,
lab2.

%69
mib'4. mib8 do lab
reb4. reb8 sib reb
mib4. mib8 do mib

%72
fa4. fa8 reb fa
sol4 mib lab!
reb, mib mib,\mbreak

%75
lab8 fa' do mib reb do
reb reb la do sib la
sib4 sib'2

%78
mib, fa4
sib, fa' fa,
sib r r

%81
fa' r r
sib, r r
fa' r r

%84
sib, sib'2
mib, fa4\mbreak
mib2 fa4

%87
sib, fa' fa,
sib2 r4
R2.

%90
sib8 fa sib fa sib fa
do' fa, do' fa, do' fa,
reb'2.

%93
do
sib4 reb sib
mib mib, mib'\mbreak

%96
lab, do lab
reb reb, reb'
sol, sib sol

%99
do2.
do,
do'

%102
lab4 do lab
sib reb sib
do mi do

%105
fa8 sib, do4 do,\mbreak
fa r r
do r r

%108
fa r r
do' r r
fa r r

%111
sib, r r
do do, do'
lab fa lab

%114
do do, do'
lab fa lab
do lab do\mbreak

%117
sib reb sib
do mi do
fa8 sib, do4 do,

%120
fa'8 do fa do fa do
sol'do, sol' do, sol' do,
lab' do, lab' lab, lab' do,

%123
sol' do, sol' do, sol' do,\mbreak
fa sib, do4 do,
fa2.\fermata

}

IVbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



}


forma = {

\key do\minor
\time 3/4
\tempo 2 = 80
s2.*125
\bar"|."

}

IVvlI = {
	\IVglobal
	%\notypeset
	<<\IVvlIn \forma>>

}

IVvlII = {
	\IVglobal
	<<\IVvlIIn \forma>>

}

IVvlaI = {
	\IVglobal
	\clef alto
	<<\IVvlaIn \forma>>

}

IVvlaII = {
	\IVglobal
	\clef tenor
	<<\IVvlaIIn \forma>>

}


IVvc = {
	\IVglobal
	\clef bass
	<<\IVvcn \forma>>

}


IVbc = {
	\IVglobal
	\clef bass
	<< \IVbcn \forma \IVbfn >>
	\typeset

}
#(set-global-staff-size 15.3)


\pointAndClickOff

\paper  {

	systems-per-page = #4
   	print-first-page-number = ##t
	first-page-number = #2

		}

\markup \huge {[1.] Adagio}

	\score {
		{ <<

				\new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
  } <<

				\new PianoStaff <<

					\new Staff 																				<<
					\set Staff.midiInstrument = #"violin"
					\set Staff.instrumentName = \markup \center-column{"Violino 1."}
					\IvlI
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"violin"
					\set Staff.instrumentName = \markup \center-column{"Violino 2."}
					\IvlII
							>> >>

				\new PianoStaff <<

					\new Staff 																				<<
					\set Staff.midiInstrument = #"viola"
					\set Staff.instrumentName = \markup \center-column{"Alto"\vspace #-0.2"Viola"}
					\IvlaI
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"viola"
					\set Staff.instrumentName = \markup \center-column{"Tenore di"\vspace #-0.2"Viola"}
					\IvlaII
							>> >>

					\new Staff
							<<
					\set Staff.midiInstrument = #"cello"
					\set Staff.instrumentName = \markup \center-column{"Violoncello"}
					\Ivc
							>>

					\new Staff <<
					\set Staff.midiInstrument = #"harpsichord"
					\set Staff.instrumentName = \markup \center-column{"Cembalo"}
					\Ibc
							>> >>

		>> }

\layout {

	indent = 1.3\cm

	\context	{
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #1
		\override StaffGrouper.staff-staff-spacing.basic-distance = #4
                 \override BarLine.hair-thickness = #1.2
		\override SpacingSpanner.uniform-stretching = ##t
                 \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
		skipBars = ##t
				}

		}

\midi {	\context {
   		\Voice
   		\remove Dynamic_performer
 			 } }

}

\pageBreak

\markup \huge {[2.] Allegro}

	\score {
		{ <<

				\new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
  } <<

				\new PianoStaff <<

					\new Staff 																				<<
					\set Staff.midiInstrument = #"violin"
					\IIvlI
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"violin"
					\IIvlII
							>> >>

				\new PianoStaff <<

					\new Staff 																				<<
					\set Staff.midiInstrument = #"viola"
					\IIvlaI
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"viola"
					\IIvlaII
							>> >>

					\new Staff
							<<
					\set Staff.midiInstrument = #"cello"
					\IIvc
							>>

					\new Staff <<
					\set Staff.midiInstrument = #"harpsichord"
					\IIbc
							>> >>

		>> }

\layout {

	indent = 0.5\cm

	\context	{
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #1
		\override StaffGrouper.staff-staff-spacing.basic-distance = #4
                 \override BarLine.hair-thickness = #1.2
		\override SpacingSpanner.uniform-stretching = ##t
                 \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
		skipBars = ##t
				}

		}

\midi {	\context {
   		\Voice
   		\remove Dynamic_performer
 			 } }

}

\pageBreak

\markup \huge {[3.] Largo}

	\score {
		{ <<

				\new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
  } <<

				\new PianoStaff <<

					\new Staff 																				<<
					\set Staff.midiInstrument = #"violin"
					\IIIvlI
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"violin"
					\IIIvlII
							>> >>

				\new PianoStaff <<

					\new Staff 																				<<
					\set Staff.midiInstrument = #"viola"
					\IIIvlaI
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"viola"
					\IIIvlaII
							>> >>

					\new Staff
							<<
					\set Staff.midiInstrument = #"cello"
					\IIIvc
							>>

					\new Staff <<
					\set Staff.midiInstrument = #"harpsichord"
					\IIIbc
							>> >>

		>> }

\layout {

	indent = 0.5\cm

	\context	{
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #1
		\override StaffGrouper.staff-staff-spacing.basic-distance = #4
                 \override BarLine.hair-thickness = #1.2
		\override SpacingSpanner.uniform-stretching = ##t
                 \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
		skipBars = ##t
				}

		}

\midi {	\context {
   		\Voice
   		\remove Dynamic_performer
 			 } }

}

\pageBreak

\markup \huge {[4.] Presto}

	\score {
		{ <<

				\new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
  } <<

				\new PianoStaff <<

					\new Staff 																				<<
					\set Staff.midiInstrument = #"violin"
					\IVvlI
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"violin"
					\IVvlII
							>> >>

				\new PianoStaff <<

					\new Staff 																				<<
					\set Staff.midiInstrument = #"viola"
					\IVvlaI
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"viola"
					\IVvlaII
							>> >>

					\new Staff
							<<
					\set Staff.midiInstrument = #"cello"
					\IVvc
							>>

					\new Staff <<
					\set Staff.midiInstrument = #"harpsichord"
					\IVbc
							>> >>

		>> }

\layout {

	indent = 0.5\cm

	\context	{
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #1
		\override StaffGrouper.staff-staff-spacing.basic-distance = #4
                 \override BarLine.hair-thickness = #1.2
		\override SpacingSpanner.uniform-stretching = ##t
                 \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
		skipBars = ##t
				}

		}

\midi {	\context {
   		\Voice
   		\remove Dynamic_performer
 			 } }

}

