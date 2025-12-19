\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

"|" = \bar "||"

tasto = _\markup\italic"Tasto solo"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

pia = _\markup \italic "pia."

fort = _\markup \italic "fort"

piano = _\markup \italic "piano"

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

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }

Iglobal = {
		\override Score.MetronomeMark #'transparent = ##t   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}

Imdn = \relative do'' {

sol16 sol' sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol
sol, sol' sol sol sol, sol' sol sol sol8 re r4
sol,16\p sol' sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol

%4
sol, sol' sol sol sol, sol' sol sol sol8 re r4
do16\f sol' sol sol do, sol' sol sol do, fa fa fa do fa fa fa\mbreak
re la' la la re, la' la la re, sol sol sol re sol sol sol

%7
mi si' si si mi, si' si si mi, la la la mi la la la
fa do' do do fa, do' do do fa,4 r
sol16 mi fa re mi do re si sol' mi fa re  mi do re si 

%10
sol'8 do re, si'\mbreak do4 r8 do,
sol'16 mi fa re  mi do re si sol' mi fa re mi do re si
la' fa sol mi fa re mi do si' sol la fa sol mi fa re

%13
mi8 do r4 mi16 sol sol sol mi do do do
la fa fa fa la do do do fa la la la fa re re re\mbreak
si sol sol sol si re re re sol si si si sol mi mi mi

%16
do la la la do mi mi mi la do do do la fa fa fa
re4 r8 re mi,16 mi' mi mi  mi, mi' mi mi
fa, fa' fa fa fa, fa' fa fa sol, sol' sol sol sol, sol' sol sol

%19
la, la' la la la, la' la la\mbreak si, si' si si si, si' si si
la re, re re la' re, re re la' do, do do la' do, do do
si sol' sol sol si, sol' sol sol <<{re, sol' sol sol re, sol' sol sol

%22
re, fad' fad fad re, fad' fad fad} 
	\new Staff \with { 
	\remove "Time_signature_engraver" 
	alignAboveContext = #"main" fontSize = #-3 
	\override StaffSymbol #'staff-space = #(magstep -3) 
	\override StaffSymbol #'thickness = #(magstep -3) }
	{la, sol' sol sol la, sol' sol sol
	la, fad' fad fad la, fad' fad fad}>> sol si si si si, si' si si
la, la' la la la, la' la la si, si' si si si, si' si si\mbreak
la8 fad r4 do16 do' do do do, do' do do

%25
si, si' si si si, si' si si do, do' do do do, do' do do
si8 sold r sold la16 mi fa re mi do re si
la' mi fa re mi do re si do8 la' si sold\mbreak

%28
la16[la,32 si do16 la] mi'[la,32 si do16 la] la'[la,32 si do16 la] mi'[la,32 si do16 la]
la'[la,32 si do16 la] la' sol sol fa fa[la,32 si do16 la] re do do si
si[re32 mi fa16 re] sol fa fa mi mi [sol,32 la si16 sol] do sib sib la

%31
la[do32 re mi16 do] fa mi mi red\mbreak red si? si si red[si32 dod red16 si]
mi si si si fad' si, si si sol'[mi32 fad sol16 mi] la[fad32 sol la16 fad]
si4 <<{<<{r16 sol sol sol s sol sol sol s sol sol sol

%34
s fad fad fad s fad fad fad s sol sol sol s sol sol sol\mbreak
fad8 s sol s la s sol s
fad4}\\{r16 mi mi mi mi, mi' mi mi mi, mi' mi mi
	si, red' red red si, red' red red mi, mi' mi mi mi, mi' mi mi
	\stemDown red8 \stemUp si, \stemDown mi' [\stemUp si,] \stemDown fad'' 	\stemUp si,, \stemDown mi' [\stemUp si,] \stemNeutral
	red'16[si dod red mi fad sol la]}>>}
	\new Staff \with { 
	\remove "Time_signature_engraver" 
	alignAboveContext = #"main" fontSize = #-3 
	\override StaffSymbol #'staff-space = #(magstep -3) 
	\override StaffSymbol #'thickness = #(magstep -3) }
	{r16 si si si sol si si si mi, si' si si
	red, fad fad fad si, la' la la sol si si si mi, sol sol sol\mbreak 
	fad red red red sol mi mi mi la fad fad fad sol mi mi mi
	red4}>> si'16 sol fad mi fad8.\tr mi16

%37
mi sol sol sol sol, sol' sol sol fad,  fad' fad fad fad, fad' fad fad
sol, sol' sol sol sol, sol' sol sol la8 sol fad fad
mi4 r8 sol do, do16 re mi8 mi16 fa?\mbreak

%40
sol8 sol, r re' sol,[si16 do re8 mi16 fa]
mi8 do r sol' do,[mi16 fa sol8 la16 sib]
la8 fa r la re,[fad16 sol la8 si?16 do]

%43
si8 sol r sol sol,16 fa'? fa fa sol, mi' mi mi
sol, re' re re sol, do do do\mbreak sol fa' fa fa sol, mi' mi mi
sol, re' re re sol, do do do si[sol la si do re mi fa]

%46
sol8[fa fa\tr mi16 re] mi[do re mi fa sol la si]
do8[sib sib\tr la16 sol] la fa sol mi fa re mi do
re si do la si sol la fa sol mi fa re mi do sol' mi\mbreak

%49
do' mi mi mi sol sib, sib sib la fa' fa fa la do, do do
si? fa' fa fa si re, re re do la' la la do mi, mi mi
re si mi do fa re sol mi re si mi do fa re sol mi

%52
re sol sol sol sol, sol' sol sol\mbreak mi[do32 si do16 do] mi,[do'32 si do16 do]
fa,[do'32 si do16 do] sol[do32 si do16 do] la[do32 si do16 do] mi[do32 si do16 do]
fa[do32 si do16 do] sol'[do,32 si do16 do] la' si, do re re8.\tr do16

%55
do sol' sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol
sol, sol' sol sol sol, sol' sol sol sol8 re r4
sol,16\p sol' sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol

%58
sol, sol' sol sol sol, sol' sol sol sol8 re r4
do16\f sol' sol sol do, sol' sol sol do, fa fa fa do fa fa fa\mbreak
re la' la la re, la' la la re, sol sol sol re sol sol sol

%61
mi si' si si mi, si' si si mi, la la la mi la la la
fa do' do do fa, do' do do fa,4 r
sol16 mi fa re mi do re si sol' mi fa re  mi do re si 

%64
sol'8 do re, si' do4\fermata r

}

IvlIn = \relative do'' {

sol16 sol' sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol
sol, sol' sol sol sol, sol' sol sol sol8 re r4
sol,16\p sol' sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol

%4
sol, sol' sol sol sol, sol' sol sol sol8 re r4
do16\f sol' sol sol do, sol' sol sol do, fa fa fa do fa fa fa\mbreak
re la' la la re, la' la la re, sol sol sol re sol sol sol

%7
mi si' si si mi, si' si si mi, la la la mi la la la
fa do' do do fa, do' do do fa,4 r
sol16 mi fa re mi do re si sol' mi fa re  mi do re si 

%10
sol'8 do re, si'\mbreak do4 r
R1*2

%13
sol,16 sol' sol sol sol, sol' sol sol sol,4 r
R1*8
r2 si16 si' si si si, si' si si 

%23
la, la' la la la, la' la la si, si' si si si, si' si si\mbreak
la8 fad r4 do16 do' do do do, do' do do
si, si' si si si, si' si si do, do' do do do, do' do do

%26
si8 sold r sold la16 mi fa re mi do re si
la' mi fa re mi do re si do8 la' si sold\mbreak
la4 r r2

%29
R1*8
sol,16 sol' sol sol sol, sol' sol sol fad,  fad' fad fad fad, fad' fad fad
sol, sol' sol sol sol, sol' sol sol la8 sol fad fad

%39
mi4 r r2
R1*15
sol,16 sol' sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol

%56
sol, sol' sol sol sol, sol' sol sol sol8 re r4
sol,16\p sol' sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol
sol, sol' sol sol sol, sol' sol sol sol8 re r4

%59
do16\f sol' sol sol do, sol' sol sol do, fa fa fa do fa fa fa\mbreak
re la' la la re, la' la la re, sol sol sol re sol sol sol
mi si' si si mi, si' si si mi, la la la mi la la la

%62
fa do' do do fa, do' do do fa,4 r
sol16 mi fa re mi do re si sol' mi fa re  mi do re si 
sol'8 do re, si' do4\fermata r

} 
	
IvlIIn =  \relative do'' {

mi,16 mi' mi mi mi, mi' mi mi re, re' re re re, re' re re
mi, mi' mi mi mi, mi' mi mi re8 si r4
mi,16\p mi' mi mi mi, mi' mi mi re, re' re re re, re' re re

%4
mi, mi' mi mi mi, mi' mi mi re8 si r4
sol16\f mi' mi mi sol, mi' mi mi la, do do do la do do do\mbreak
la fad' fad fad la, fad' fad fad si, re re re si re re re

%7
si sold' sold sold si, sold' sold sold do, mi mi mi do mi mi mi
do la' la la do, la' la la re,4 r
mi16 do re si do sol si sol mi' do re si do sol si sol

%10
mi'8 mi re re\mbreak mi4 r
R1*2
mi,16 mi' mi mi mi, mi' mi mi mi,4 r

%14
R1*8
r2 sol16 sol' sol sol sol, sol' sol sol
fad, fad' fad fad fad, fad' fad fad sol, sol' sol sol sol, sol' sol sol\mbreak

%24
fad8 re r4 la16 la' la la la, la' la la
sold, sold' sold sold sold, sold' sold sold la, la' la la la, la' la la
sold8 mi r mi mi16 do re si do la si sold

%27
mi' do re si do la si sold la8 do re si\mbreak
la4 r r2
R1*8

%37
mi16 mi' mi  mi mi, mi' mi mi red, red' red red red, red' red red
mi, mi' mi mi mi, mi' mi  mi fad8 mi4 red8
mi4 r r2

%40
R1*15
mi,16 mi' mi mi mi, mi' mi mi re, re' re re re, re' re re
mi, mi' mi mi mi, mi' mi mi re8 si r4

%57
mi,16\p mi' mi mi mi, mi' mi mi re, re' re re re, re' re re
mi, mi' mi mi mi, mi' mi mi re8 si r4
sol16\f mi' mi mi sol, mi' mi mi la, do do do la do do do\mbreak

%60
la fa' fa fa la, fa' fa fa si, re re re si re re re
si sold' sold sold si, sold' sold sold do, mi mi mi do mi mi mi
do la' la la do, la' la la re,4 r

%63
mi16 do re si do sol si sol mi' do re si do sol si sol
mi'8 mi re re\mbreak mi4\fermata r

}

Ivlan = \relative do' {

do8 do' do, do' si, si' si, si'
do, do' do, do' si8 sol r4
do,8\p do' do, do' si, si' si, si'

%4
do, do' do, do' si8 sol r4
mi8\f do' mi, do' fa, la fa la\mbreak
fad re' fad, re' sol, si sol si

%7
sold mi' sold, mi' la, do la do
la fa la fa si4 r
sol r sol r

%10
sol8 sol sol sol\mbreak sol4 r
R1*2
do,8 do' do, do' do,4 r

%14
R1*8
r2 re8 re' re, re'
re, re' re, re' re, re' re, re'\mbreak

%24
re,[mi16 re do8 si] do mi' mi, mi'
mi, mi' mi, mi' mi, mi' mi, mi'
mi, fa mi re do4 r

%27
r r mi8 mi fa mi\mbreak
mi4 r r2
R1*8

%37
si8 si' si, si' si, si' si, si'
si, si' si, si' si, si' si si
sol4 r r2

%40
R1*15
do,8 do' do, do' si, si' si, si'
do, do' do, do' si8 sol r4

%57
do,8\p do' do, do' si, si' si, si'
do, do' do, do' si8 sol r4
mi8\f do' mi, do' fa, la fa la\mbreak

%60
fad re' fad, re' sol, si sol si
sold mi' sold, mi' la, do la do
la fa la fa si4 r

%63
sol r sol r
sol8 sol sol sol sol4\fermata r

}

Ibcn = \relative do {

do8 r do r sol' r sol, r
do r do r \stemDown sol' \stemUp sol, r4\stemNeutral
do8\p r do r sol' r sol, r

%4
do r do r \stemDown sol' \stemUp sol, r4\stemNeutral
mi'8\f r mi r fa r fa r
fad r fad r sol r sol r

%7
sold r sold r la r la r
la r la r sol?4 r
do, r do r

%10
do8 do sol' sol,\mbreak do4 r
do r do r
fa r sol r

%13
do,8 r do r do4 r8 mi_\markup\italic "Viol[oncel]lo Solo"
fa[la16 sol fa8 mi] re4 r8 re\mbreak
sol[si16 la sol8 fa] mi4 r8 mi

%16
la[do16 si la8 sol] fa4 r8 la
si16 sol sol sol si sol sol sol do,8 r do r
re r re r mi r mi r

%19
fa r fa r\mbreak sol r sol r
fad sol la fad re fad mi re
sol r sol, r re' r re r

%22
re r re r sol,\tu r sol r
re' r re r sol, r sol r\mbreak
re'[do16 si la8 sold] la r la r

%25
mi' r mi r la, r la r
mi' re do si la4 r
la r la8 la' re, mi\mbreak

%28
la,4 r la_\markup\italic "Violon[cel]lo Solo" r
la8 la dod la r re fad re
r sol, si sol r do? mi do

%31
r fa la la,\mbreak si4 r
sol' r mi r
mi8 fad sol mi mi4 r

%34
si r mi r\mbreak
si8 r si r si r si r
si4 r mi si

%37
mi8\tu r mi r si r si r
mi r mi r red mi si' si,
mi4 r8 do_\markup\italic "Violon[cel]lo Solo" do4 do\mbreak

%40
si8 la si sol si4 si
do8 re mi do do4 do
fa8 sol la fa fad4 fad

%43
sol8 la si sol sol4 sol
sol sol\mbreak sol sol
sol sol sol r

%46
sol,8 si la sol do4 r
do8 mi re do fa4 r
si, r mi r\mbreak

%49
mi8 re do mi fa mi re fad
sol fa? mi sold la sol? fa la
si do re do si do re do

%52
si la si sol\mbreak do, r do r
re r mi r fa r do r
re r mi r fa16 sol mi fa \stemDown sol8\stemUp sol,\stemNeutral

%55
do r do r sol' r sol, r
do r do r \stemDown sol' \stemUp sol, r4\stemNeutral
do8\p r do r sol' r sol, r

%58
do r do r \stemDown sol' \stemUp sol, r4\stemNeutral
mi'8\f r mi r fa r fa r
fad r fad r sol r sol r

%61
sold r sold r la r la r
la r la r sol4 r
do, r do r

%64
do8 do sol' sol, do4\fermata r

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



} 				

forma = {

\key do\major
\time 4/4 
\tempo 2 = 60
s1*64
\bar"|."


}

Imd = {
	\Iglobal
	\notypeset
	<<\Imdn \forma>>

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
		\override Score.MetronomeMark #'transparent = ##t   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}

IImdn = \relative do'' {

r16. la32 la16. do32 do16. mi32 mi16. la32 la16. mi32 mi16. do32 do16. la32 la16. do32
si16 mi, mi sold sold si si mi mi sold sold si si re, re do
do la la do do mi mi la la mi  mi do do la la mi'

%4
red si si red red fad fad si si fad fad red red si si fad'\mbreak
sol mi mi si si sol sol mi mi sol sol si si mi mi sol
fad si, la' fad fad8.\tr mi16 mi2

%7
r16 mi, mi sol sol si si mi mi sol sol si si sol sol mi
dod la la dod dod mi mi sol sol sib sib sol sol mi mi fa
fa re, re fa fa la la re\mbreak re fa fa la la re, re si?

%10
si sol sol si si re re fa fa la la fa fa re re mi
mi sol sol mi mi do do la la la' la fa fa re re la
sold si' si mi, mi re re do do la do mi la la, do mi

%13
la mi do la si8.\tr la16 la2\fermata

} 

IIvlIn = \relative do'' {

la'4 r la r
sold r sold r
la r la r

%4
la r la r
sol? r sol r
fad fad sol2

%7
mi4 r mi r
mi r mi r
fa r fa r

%10
fa r fa r
mi r fa r
sold r la r

%13
la sold la2\fermata

} 
	
IIvlIIn =  \relative do'' {

do4 r do r
si r si r
do r do r

%4
red r red r\mbreak
mi r mi r
red red mi2

%7
si4 r si r
dod r dod r
re r re r

%10
re r re r
do r re r
mi r do r

%13
do si do2\fermata

}

IIvlan = \relative do' {

mi4 r mi r
mi r mi r
mi r la r

%4
fad r red r\mbreak
si r si' r
si si si2

%7
sol4 r sol r
sol r sol r
fa r la r

%10
si r si r
sol r la r
si r do r

%13
mi, mi mi2\fermata

}

IIbcn = \relative do {

la4 r la r
mi' r mi r
la, r la r

%4
si r si r\mbreak
mi r mi r
si si mi2\fermata

%7
mi4 r mi r
la, r la r
re r\mbreak re r

%10
sol, r sol r
do r fa r
mi r la, r

%13
la mi' la,2\fermopz

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



} 				

forma = {

\key do\major
\time 4/4 
\tempo 4 = 40
s1*6
\bar":..:"\break
s1*7
\bar":..:"


}

IImd = {
	\IIglobal
	\notypeset
	<<\IImdn \forma>>

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
		\override Score.MetronomeMark #'transparent = ##t   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}

IIImdn = \relative do'' {

do8[mi fa sol]
do,[mi fa sol]
si,[re mi fa]

%4
si,[re mi fa]
do[mi fa sol]
do,[mi fa sol]

%7
si,[sol si re]
sol4 r
r8 sol[fa mi]

%10
r sol[fa mi]
r sol[fa mi]
r sol[fa mi]

%13
r sol[sol sol]\mbreak
do[sol sol sol]
do[mi, fa re]

%16
do[mi fa sol] %%% <----------
sol,[mi' fa sol]
sol,[re' mi fa]

%19
sol,[re' mi fa]
sol,[mi' fa sol]
sol,[mi' fa sol]
si,16[sol la si do re mi fa]

%23
sol4 r8 sol
sol16 mi sol mi sol mi sol mi
sol mi sol mi sol mi sol mi\mbreak

%26
fa[do fa do fa do fa do]
fa[do fa do fa do fa do]
re[si re si re si re si]

%29
sol'[re sol re sol re sol re]
mi[do mi do mi do mi do]
la'[mi la mi la mi la mi]

%32
fad[re fad re fad re fad re]
si'[fad si fad si fad si fad]\mbreak
sol[mi sol mi sol mi sol mi]

%35
la[mi la mi la mi la mi]
fad re mi fad sol re sol la
si8[la16 sol la8 sol16 fad]

%38
sol8[sol la si]
re,[sol la si]
re,[fad sol la]

%41
re,[fad sol la]
re,[sol la si]\mbreak
re,[sol la si]

%44
la[re, do si]
r re[do si]
r re[do si]

%47
r re[do si]
fad'[sol la fad]
re16 sol si sol re sol si sol

%50
re fad la fad re fad la fad
re sol si sol re sol si sol\mbreak
fad8 re r4

%53
mi16 si mi sol mi si mi sol
fad si, fad' la fad si, fad' la
sol mi sol si sol mi sol si

%56
red,8 si r4
mi8[sol16 fad mi re? do si]
do8[mi16 re do8 la]

%59
re[fad16 mi re do si la]
si8[re16 do si8 sol]\mbreak 
do8[mi16 re do si la sol]

%62
la8[do16 si la8 fad]
si[red16 dod si la sol fad]
sol8 mi r si'

%65
<<{mi[si mi, mi']
fad si,, r si'
fad'[si, si, fad'']

%68
sol mi, r mi'
si[mi fad red]\mbreak}
	\new Staff \with { 
	\remove "Time_signature_engraver" 
	alignAboveContext = #"main" fontSize = #-3 
	\override StaffSymbol #'staff-space = #(magstep -3) 
	\override StaffSymbol #'thickness = #(magstep -3) }
	{sol16 la si4 mi,8
	red16 mi fad4 si,8
	la' la4 sol16 fad
	sol fad mi4 si'8
	sol[fad16 mi fad8 red]}>>
mi8[sol la si]

%71
mi,[sol la si]
red,[fad sol la]
red,[fad sol la]

%74
sol[mi fad red]
mi4 r
do8[mi fa sol]

%77
do,[mi fa sol]
si,[sol16 la si do re  mi]\mbreak
fa8[si,16 do re mi fa sol]

%80
mi sol sol sol mi do do do
sol mi mi mi sol do do do
la fa fa fa la do do do

%83
fa la la la fa la, la la
si sol sol sol re sol sol sol
si re re re sol re re re\mbreak

%86
mi sol sol sol mi sol sol sol
re sol sol sol re sol sol sol 
mi sol sol sol mi sol sol sol

%89
re sol sol sol re sol sol sol
<<{mi8[sol mi, sol']
re,[fa' do, mi']

%92
re sol,16 la si8 si16 do}\mbreak
	\new Staff \with { 
	\remove "Time_signature_engraver" 
	alignAboveContext = #"main" fontSize = #-3 
	\override StaffSymbol #'staff-space = #(magstep -3) 
	\override StaffSymbol #'thickness = #(magstep -3) }
	{mi sol fa sol mi sol fa sol 
	re sol fa sol do, sol' fa sol
	si,4}>>
re8 re16 mi fa8 sol16 fa
mi8 do16 re mi8 mi16 fa

%95
sol8[sol16 la sib8 sol]
la la16 sol fa8 fa16 mi
re8 re16 do si8 si16 la

%98
sol8[sol16 la si do re mi]
fa8[si,16 do re mi fa sol]\mbreak
mi sol sol sol mi sol sol sol

%101
re sol sol sol re sol sol sol
mi8[do re si]
do2
	
%104
do8[mi fa sol]
do,[mi fa sol]
si,[re mi fa]

%107
si,[re mi fa]
do[mi fa sol]
do,[mi fa sol]

%110
si,[sol si re]
sol4 r
r8 sol[fa mi]

%113
r sol[fa mi]
r sol[fa mi]
r sol[fa mi]

%116
r sol[sol sol]\mbreak
do[sol sol sol]
do[mi, fa re]

%119
do2\fermata

} 


IIIvlIn = \relative do'' {

do8[mi fa sol]
do,[mi fa sol]
si,[re mi fa]

%4
si,[re mi fa]
do[mi fa sol]
do,[mi fa sol]

%7
si,[sol si re]
sol4 r
r8 sol[fa mi]

%10
r sol[fa mi]
r sol[fa mi]
r sol[fa mi]

%13
r sol[sol sol]\mbreak
do[sol sol sol]
do[mi, fa re]

%16
do4 r 
R2*21
r8 sol'[la si]

%39
re,[sol la si]
re,[fad sol la]
re,[fad sol la]

%42
re,[sol la si]\mbreak
re,[sol la si]
la[re, do si]

%45
r re[do si]
r re[do si]
r re[do si]

%48
fad'[sol la fad]
sol4 r
R2*20

%70
r8 sol[la si]
mi,[sol la si]
red,[fad sol la]

%73
red,[fad sol la]
sol[mi fad red]
mi4 r

%76
R2*28
do8[mi fa sol]
do,[mi fa sol]

%106
si,[re mi fa]
si,[re mi fa]
do[mi fa sol]
do,[mi fa sol]

%110
si,[sol si re]
sol4 r
r8 sol[fa mi]

%113
r sol[fa mi]
r sol[fa mi]
r sol[fa mi]

%116
r sol[sol sol]\mbreak
do[sol sol sol]
do[mi, fa re]

%119
do2\fermata

} 
	
IIIvlIIn =  \relative do'' {

sol8[do re mi]
sol,[do re mi]
sol,[si do re]

%4
sol,[si do re]
sol,[do re mi]
sol,[do re mi]

%7
re[sol, si re]
sol4 r
r8 mi[re do]

%10
r8 mi[re do]
r8 mi[re do]
r8 mi[re do]

%13
r mi[mi mi]\mbreak
sol[mi mi mi]
sol[do, re si]

%16
do4 r %%%%%<-----------
R2*21
r8 si[do re]

%39
sol,[si do re]
la[la si do]
la[la si do]

%42
si[si do re]\mbreak
si[si do re]
fad,[si la sol]

%45
r si[la sol]
r si[la sol]
r si[la sol]

%48
la[si do la]
si4 r
R2*20

%%70
si8[mi fad sol]
si,[mi fad sol]
si,[red mi fad]

%73
si,[red mi fad]
mi[sol la fad]
mi4 r

%76
R2*28
sol,8[do re mi]
sol,[do re mi]

%106
sol,[si do re]
sol,[si do re]
sol,[do re mi]

%109
sol,[do re mi]
re[sol, si re]
sol4 r

%112
r8 mi[re do]
r8 mi[re do]
r8 mi[re do]

%115
r8 mi[re do]
r mi[mi mi]\mbreak
sol[mi mi mi]

%118
sol[do, re si]
do2\fermata

}

IIIvlan = \relative do' {

mi4 r 
mi r
re r

%4
re r
mi r
mi r

%7
re r
re r
mi r

%10
re r
do r
si r

%13
mi r\mbreak
mi r
mi8[sol la sol]

%16
mi4 r %%%%%%% <------------
R2*21
re4 r

%39
re r
re r
re r

%42
re r\mbreak
re r
re r

%45
si' r
la r
sol r

%48
fad8[re re re]
re4 r
R2*20

%70
sol4 r
sol r
fad r

%73
fad? r
sol8[si do si]
sol4 r

%76
R2*28
mi4 r 
mi r

%106
re r
re r
mi r

%109
mi r
re r
re r

%112
mi r
re r
do r

%115
si r
mi r\mbreak
mi r

%118
mi8[sol la sol]
mi2\fermata

}

IIIbcn = \relative do {

do4 r
do r
sol' r

%4
sol r
do, r 
do r

%7
sol' r
sol8[si, re sol]
do4 r

%10
si r
la r
sol r

%13
do r\mbreak
do, r
do8[do' fa, sol]

%16
do,4 r %<-------------
mi r
si r

%19
si r
mi r
do r

%22
sol' r
sol,8[sol' si sol]
mi4 r

%25
do sib\mbreak
la r
la r

%28
si? r
si r
do r

%31
dod r
re r
red r\mbreak

%34
mi r
dod r
re8[do? si la]

%37
sol[si do re]
sol,4 r
sol' r

%40
fad r
fad? r
sol r\mbreak 

%43
sol r
re r
sol r

%46
fad r
mi r
re8[sol do, re]

%49
sol,[sol'_\markup\italic"Violon[cel]lo Solo" sol sol]
fad[fad fad re]
sol[sol sol sol]\mbreak

%52
re[re red red]
mi[mi mi mi]
si[si si si]

%55
mi[mi mi mi]
si[si si si]
sol'[sol sol sol]

%58
la[la  la la]
fad[fad fad fad]
sol[sol sol sol]\mbreak

%61
mi[mi mi mi]
fad[fad fad fad]
red[red red red]

%64
mi[mi sol mi]
r mi[sol mi]
r si[red si]

%67
r si[red si]
r mi[sol mi]
r sol[la si]\mbreak

%70
mi,4 r
mi r
si r

%73
si r
mi8[mi la, si]
mi4 r

%76
do r
do r
sol' r\mbreak

%79
sol, r
do do
do mi
fa fa
re fad
sol sol
sol sol\mbreak
do do
si si
do do
si si
do do,
si do
sol' sol,\mbreak
sol sol
do do 
do do
fa r
fa r
sol r
sol r\mbreak
do do
si si
do8[mi, fa sol]
do,2

do4 r
do r
sol' r
sol r
do, r 
do r
sol' r
sol8[si, re sol]
do4 r
si r
la r
sol r
do r\mbreak
do, r
do8[do' fa, sol]
do,2\fermata

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



} 				

forma = {

\key do\major
\time 2/4 
\tempo 2 = 65
s2*119
\bar"|."


}

IIImd = {
	\IIIglobal
	%\notypeset
	<<\IIImdn \forma>>

}

IIIvlI = {
	\IIIglobal
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
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o: Si può anco fare con tutti li Violini pizziccati"

\score {

            \new ChoirStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
            } <<


                \new Staff  = "main" <<
                    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                    \set Staff.instrumentName = \markup \center-column{"Mandolino"}
                    \Imd
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"V[iolino]""P[rimo]"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"V[iolino""2.o"}
                    \IvlII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \Ivla
                >>
                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol #'staff-space = #(magstep +1)
                }<<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup \center-column{"[Basso]""Violoncello"}
                    \Ibc

                >>
            >>

    \layout {

        indent = 1.7\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[2.] Largo"

\score {

            \new ChoirStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
            } <<


                \new Staff  = "main" <<
                    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                    \IImd
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
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
                    \set Staff.midiInstrument = #"cello"
                    \IIbc

                >>
            >>

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.7
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

\markup\huge "[3.] [Allegro]"

\score {

            \new ChoirStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
            } <<


                \new Staff  = "main" <<
                    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                    \IIImd
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
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
                    \set Staff.midiInstrument = #"cello"
                    \IIIbc

                >>
            >>

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.7
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





%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
