\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

"|" = \bar "||"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tous"

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

%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0
%}

mbreak = { }


Iglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletNumber.transparent = ##f
		\override TupletBracket.bracket-visibility = ##f
		\terzine \terzinecon
			}


IvlIn = \relative do'' {

fad4.^\markup\italic"Grave" fad8 sol4. sol8
fad2 r\fermata
fad4. fad8 mi4 re~

%4
re8 dod16 (si) dod4 r2\fermata
mi4. mi8 fad4 la8. la16
si^\markup\italic"Andante"(la sol fad) mi8. mi16 fad8(sol) la4~

%7
la la8 sol fad4 si16(la sold fad)\mbreak
mi2~mi4 re8 mi
fad16(mi re dod) si8.-+ si16 dod4. dod8

%10
si16(la sol fad) mi8. mi16 re4 re'~
re dod~dod8 si lad[dod]~
dod4 si2 si8. lad16

%13
si2~si4 la~\mbreak
la la8. sold16 la4 la'~
la sol8 la si16(la sol fad) mi8. mi16

%16
re4.^\markup\italic"Largo" re8 re4. mi16 re
dod8 la re4~re8 mi16 re dod8. re16
re1\fermata

}


IvlIIn = \relative do'' {

re4. re8 mi4. mi8
re2 r\fermata
la4. la8 si4. si8

%4
la2 r\fermata
dod4. dod8 re4. re8
re4~re8. dod16 re2~

%7
re4 dod re4. re8
dod si la4 la2~
la4 la8. sold16\mbreak la8 mi' re4~

%10
re re8. dod16 re4 la
la4. sol8 fad8. fad'16 mi4
re8 mi fad8. fad16 sol(fad mi re) dod8. dod16

%13
re2 dod8 re mi8. mi16
fad(mi re dod) si8. si16\mbreak la8 si dod8. dod16
si8 dod re2~re8. dod16

%16
re4 la'~la8 sol16(fad) sol4~
sol fad8 sol16 fad mi4. mi8
re1\fermata

}


Icbn = \relative do {

re4. re8 re4 dod
re2 r\fermata
re'8 dod si la sold4. sold8

%4
la2 r\fermata
la4 sol fad4. re8
sol16 fad sol mi la sol la la, re dod re mi fad mi fad re

%7
la' sold la si dod si dod la si dod la si sold fad sold mi\mbreak
la sold la si dod si dod dod, re dod re mi fad mi fad dod
re dod re si mi re mi mi, la' si sol la fad mi fad re

%10
sol fad sol mi la sol la la, re dod re mi fad mi fad re
la' sol la si dod si dod la\mbreak lad sold lad si dod si dod lad
si lad si dod re dod re si mi re mi dod fad mi fad fad,

%13
si dod la si sold fad sold mi la sold la si dod si dod dod,
re dod re si mi re mi mi,\mbreak la' si sol la fad mi fad re
sol fad sol la si la si fad sol fad sol mi la sol la la,

%16
re4. fad8 sol4. sol8
la2 la,
re1\fermata

}


Ibcn = \relative do {

re4. re8 re4 dod
re2 r\fermata
re'2 sold,4. sold8

%4
la2 r\fermata
la4 sol fad4. re8
sol mi la[la,] re mi fad[re]

%7
la' si dod[la] si la sold mi
la si dod dod,\mbreak re mi fad [dod]
re si mi[mi,] la' sol fad re

%10
sol mi la la, re mi fad re
la' si dod la lad si dod lad
si dod re si \clef tenor \key re\major mi dod fad fad,

%13
\clef bass \key re\major si la sold mi la si dod dod,
re si mi mi, la' sol fad re
sol la si fad sol mi la la,

%16
re4. fad8 sol2
la la,
re1\fermata

}

Ibfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

<5>4 s <4 2> <5>
<5>1
<5>2 <6>4 <5>
<4> <3> s2
<5>4 <6 4> <6> s8 <5>
<6 5> <7> <4> <3> <5>4 <6>
<4>4 <6>8 <7> <5> s <5> <7>
<5> s <6> s <9>4 <6>8 <6>
<6 5> <7> <4> <3+> <5> s <6 5> <7>
<6 5> <7> <4> <3> <5> s <6>4
<4> <6>8 <7> <6>4 <6+>8 <5>
<9> <6+> <6> s <6 5> <7> <4> <3+>
<5> s <5> <7> <9>4 <6>
<6 5>8 <7> <4> <3+>
<5> s <6 5> <7>
<9>4 <6>8 <6> <6 5> <7> <4> <3>
<5>4 s8 <6> <9>4 <8>
<7 5> <6 4> <5 4> <3>

}


forma = {

\key re\major
\time 4/4
\tempo 4 = 50
s1*5
\tempo 4 = 55
s1*10
\tempo 4 = 53
s1*3
\bar"||"

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


Icb = {
	\Iglobal
	\clef bass
	<<\Icbn \forma>>
}



Ibc = {
	\Iglobal
	\clef bass
	<<\Ibcn \forma \Ibfn>>
	\typeset

}


IIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletNumber.transparent = ##f
		\override TupletBracket.bracket-visibility = ##f
		\terzine \terzinecon
			}


IIvlIn = \relative do'' {

r8 la' [si si] si la16 sol
la8 re, sol sol sol [fad]~
fad mi16 re dod8 re re[dod]

%4
re [fad sol sol] sol fad16 mi
fad4 si la~
la8 sol16 fad mi8 fad mi8. mi16

%7
re8 [dod re re] re dod16 si\mbreak
dod8 fad si si la4~
la8 sol16 fad mi8 fad mi8. mi16

%10
re(mi fad sol) la(si la) sol fad si la si
sol(la sol) fad mi la sol la fad(sol fad) mi
re(sol fad) sol mi(fad mi) re\mbreak dod fad mi fad

%13
re(mi re) dod si si mi fad mi (re dod si)
dod mi re mi fad(mi) re dod si mi re mi
dod re dod re si4. si8

%16
la [mi' fad fad] fad mi16 re
mi8 la, re[re] re dod~
dod si16 la\mbreak sold8 la la[sold]

%19
la [dod re re] re dod16 si
dod4 fad mi~
mi8 re16 dod si8 dod si8. si16

%22
la8 sold la[la] la sold16 fad
sold8 dod fad fad mi4~
mi8 re16 dod si8 dod si4

%25
la4. la8 sold4\mbreak   %%%%%%%% fine quarte riga
fad4. fad8 mi4
mi' mi4. red8

%28
mi4. re!8 dod[si]
dod4 si4. si8
la[mi' mi mi] fad re16 dod

%31
si8[re re re] mi dod16 si
la8[dod dod dod] re si16 la
sold8[si si si] dod la16 sold

%34
fad8[la la la] si sold16 fad
mi4\upl r r
re'\upl r r

%37
dod\upl r r
si8 dod16 re mi8 mi16 re mi re dod si
dod4~dod8 re16 dod si8.-+ si16

%40
la si dod re mi4 fad~
fad fad8. sol16 la sol fad mi
re4 re4. dod8

%43
re8 [la' si si] si la16 sol
la8 [re, sol sol] sol fad~
fad mi16 re dod8[re] re dod

%46
re[dod re re] re dod16 si
dod8[sol' re re] mi la~
la sol16 fad mi8 fad mi8. mi16

%49
re8[la' la la] si sol16 fad
mi8[sol sol sol] la fad16 mi\mbreak
re8[fad fad fad] sol mi16 re

%52
dod8[mi mi mi] fad re16 dod
si8[re re re] mi dod16 si
la4 r r

%55
sol' r r
fad r r
mi re8 la'16 sol la8 fad

%58
si16(la sol fad) mi8 fad mi8. mi16
re8 fad\mbreak mi4. mi8
re4 fad8 re dod[mi]

%61
re mi16 re dod4.-+ re16 dod
si8 mi re4. re8
dod re mi re16 dod si8. si16

%64
la2 la8. sold16
la (si dod re) mi8 fad16 mi re4~\mbreak
re re4. dod8

%67
re8[la' si si] si la16 sol
la8[re, sol sol] sol fad~
fad mi16 re dod8 re re[dod]

%70
re[dod re re] re dod16 si
dod8 fad si si la4~\mbreak
la8 sol16 fad mi8 fad mi4

%73
fad2.^\markup\italic "Largo"
re4 re4. re8
re mi16 re dod4. dod8

%76
re2.

}


IIvlIIn = \relative do'' {

R2.*3
r8 la'[si si] si la16 sol
la8[re, sol sol] sol fad~

%6
fad mi16 re dod8 re re[dod]
re la'16 sol fad8 fad fad[la]
la4 sol8 re re4~

%9
re la' sol\mbreak
fad8 mi re4 si'~
si la~la

%12
sol8 re la'[sol] fad4~
fad mi4. mi8
mi dod si[la] sol8. sold16

%15
la8 mi la4 la8. sold16
la4 r r
R2.*2\mbreak

%19
r8 mi' fad fad fad[mi16 re]
mi8[la, re re] re dod~
dod si16 la sold8 la la[sold]

%22
la mi'16 re dod8 dod dod[mi]
mi4 re8 la la4~
la mi'\mbreak re

%25
dod8 re mi fad si,4
la4. la8 sold4
sold2 fad4

%28
sold la2~
la4 la4. sold8
la4 r r

%31
R2.
r8 mi'[mi mi] fad re16 dod
si8[re re re]\mbreak mi dod16 si

%34
la8[dod dod dod] re si16 la
sold4\upl r r
fad'\upl r r

%37
sol\upl r r
mi r8 dod16 si dod si la sol
la4~la8 si16 la sold8. sold16

%40
la4. la'8\mbreak la16 sol fad mi
re2 re8 dod
si16 la sol fad mi4. mi8

%43
re[fad' sol sol] sol fad16 mi
fad4 si8 si la4~
la8 sol16 fad mi8 fad mi8. mi16

%46
re8 la'16 sol fad8 fad\mbreak fad[la]
la la, si4 dod8 re~
re si' la4 sol

%49
fad r r
R2.
r8 la[la la] si sol16 fad

%52
mi8[sol sol sol] la fad16 mi
re8[fad fad fad] sol mi16 re\mbreak
dod4 r r

%55
si r r
la r r
la8 la'16 sol fad8 mi re4~

%58
re re4.-+ dod8
re4. re8 dod4
si2.~

%61
si4 si4.-+ lad8
si4 si2
la\mbreak la8. sold16

%64
la8 re mi re16 dod si8. si16
dod4 dod4. si8
si16 la sol fad mi8 fad mi8. mi16

%67
re8[fad' sol sol] sol fad16 mi
fad4 si8 si la4~\mbreak
la8 sol16 fad mi8 fad mi8. mi16

%70
re8 la'16 sol fad8 fad fad[la]
la4 sol8 mi re4~
re la' sol

%73
fad2.
fa4 fa4. fa8
fa? sol16 fa mi4. mi8

%76
re2.

}


IIcbn = \relative do {

R2.*6
r8 la'[si si] si la16 sol
la8[re, sol sol] sol fad~

%9
fad mi16 re dod8 re re[dod]
re4 fad re
mi dod re

%12
si dod la
si sold4. sold8
la4 re mi\mbreak

%15
la, mi' mi,
la r r
R2.*5

%22
r8 mi'[fad fad] fad mi16 re
mi8[la, re re] re dod~
dod si16 la sold8 la la[sold]

%25
la si dod re mi4~
mi red mi\mbreak
mi8 fad sold la si[si,]

%28
mi8 [re dod si] la re
mi4 mi,2
la4 r r

%31
R2.*4
r8 mi''[mi mi] fad re16 dod
si8[re re re] mi dod16 si

%37
la8[dod dod dod]\mbreak re si16 la
sold4 r r
la,8 re mi4 mi,

%40
la8 [si dod la] re re'16 dod
si8 dod re re,16 mi fad8 re
sol [mi la sol] la la,

%43
re4 r r
R2.*2
r8 la'[si si]\mbreak si la16 sol

%47
la8[re, sol sol] sol fad~
fad mi16 re dod8 re re[dod]
re4 r r

%50
R2.*4
r8 la'[la la] si sol16 fad
mi8[sol sol sol] la fad16 mi

%56
re8[fad fad fad]\mbreak sol mi16 re
dod8 [la si dod] re fad
sol[mi la sol] la la,

%59
re[re' dod si] lad fad
si[si, re si] mi dod
fad4 fad,2

%62
si8 [dod si la] sold mi\mbreak
la [si dod re] mi mi,
la[si dod re] mi mi,

%65
la'[si la sol] fad re
sol[mi la sol] la la,
re4 r r

%68
R2.*2
r8 la'[si si] si la16 sol
la8[re, sol sol]\mbreak sol fad~

%72
fad mi16 re dod8 re re[dod]
re4. dod8 [si la]
sold4_\upl sold4._\upl sold8

%75
la2.
re


}


IIbcn = \relative do {

R2.*6
r8 la'[si si] si la16 sol
la8[re, sol sol] sol fad~

%9
fad mi16 re dod8 re re[dod]
re4 fad re
mi dod re

%12
si dod la
si sold4. sold8
la4 re mi\mbreak

%15
la, mi' mi,
la r r
R2.*5

%22
r8 mi'[fad fad] fad mi16 re
mi8[la, re re] re dod~
dod si16 la sold8 la la[sold]

%25
la si dod re mi4~
mi red mi\mbreak
mi8 fad sold la si[si,]

%28
mi8 [re dod si] la re
mi4 mi,2
la4 r r

%31
R2.*4
r8 mi''[mi mi] fad re16 dod
si8[re re re] mi dod16 si

%37
la8[dod dod dod]\mbreak re si16 la
sold4 r r
la,8 re mi4 mi,

%40
la8 [si dod la] re re'16 dod
si8 dod re re,16 mi fad8 re
sol mi la4 la,

%43
re r r
R2.*2
r8 la'[si si]\mbreak si la16 sol

%47
la8[re, sol sol] sol fad~
fad mi16 re dod8 re re[dod]
re4 r r

%50
R2.*4
r8 la'[la la] si sol16 fad
mi8[sol sol sol] la fad16 mi

%56
re8[fad fad fad]\mbreak sol mi16 re
dod8 [la si dod] re fad
sol[mi la sol] la la,

%59
re[re' dod si] lad fad
si[si, re si] mi dod
fad4 fad,2

%62
si8 [dod si la] sold mi\mbreak
la [si dod re] mi mi,
la[si dod re] mi mi,

%65
la'[si la sol] fad re
sol[mi la sol] la la,
re4 r r

%68
R2.*2
r8 la'[si si] si la16 sol
la8[re, sol sol]\mbreak sol fad~

%72
fad mi16 re dod8 re re[dod]
re4. dod8 [si la]
sold4_\upl sold4._\upl sold8

%75
la2.
re

}

IIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

s2.*6
s4 <5>  s
s<5> <5 2>8 <6 3>
s4 <3 6>8 <5> <4 2> <5 3>
<5>4 <6> <6 5>
<5> <6 5-> <5>
<6 5> <6>8 <5-> <6 5>4
<5> <6> s
<5> <5 6> <_+>
<5><4> <3+>
s2.*6
s8 <_+> <5>4 s
<5 _+> <5> <5 2>8 <6>
s4 <6>8 <5> <4 2> <5 3>
<5>4 <6> <_+>
<4 2> <5- 3> <_+>
<5> <6> <4>8 <3+>
<_+>4 <6> <5>8 <6 5>
<6 4>4 <5 4> <3>
s2.*5
s8 <5 _+> s4 <5>
<5>8 <6> s4 <5>
<5>8 <6> s4 <5>
<6>2.
<5>8 <7 5> <6 4>4 <5 3+>
<5> <6> <5>
<5> <5> <6>8 <7>
<6 5> <7> <4>4 <3>
s2.*3
s4 <5> s
<5> <5> <6 4>8 <6>
s4 <6>8 <5> <4 2> <5->
s2.*5
s8 <5> s4 s
<5>8 <6> s4 s
<5>8 <6> s4 s
<6> <5>8 <6> <5> <6>
<6 5> <7> <5 4> <7 5> <4> <3>
<5>4 <6> <5->8 <7 _+>
<5>4 <6> <6 5>8 <7>
<6 4>4 <5 4> <3+>
<5>2 <5->8 <7 5>
<5>4 <6>8 <7 5> <4> <3+>
<5>4 <6>8 <6 5> <4> <3+>
<5>2 <6 5>8 <7>
<6 5> <7> <5 4> <7 5> <4> <3>
<5>2.
s
s
s4 <5> s
s <5> <5 2>8 <6>
s4 <6>8 <5> <4 2> <5->
<5>2.
<7- 5>
<6- 4>4 <5 3>

}


forma = {

\key re\major
\time 3/4
\tempo 2 = 50
s2.*72
\tempo 4 = 60
s2.*4
\bar"||"


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


IIcb = {
	\IIglobal
	\clef bass
	<<\IIcbn \forma>>
}



IIbc = {
	\IIglobal
	\clef bass
	<<\IIbcn \forma \IIbfn>>
	\typeset

}


IIIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletNumber.transparent = ##f
		\override TupletBracket.bracket-visibility = ##f
		\terzine \terzinecon
			}


IIIvlIn = \relative do'' {

re4 mi fad sol la la,
re2 la'4 si dod dod,
fad2 fad2. mi4

%4
fad mi re dod si si
la2 la2. sold4
la si dod re mi mi,

%7
la2 mi'4 la sold sold,
dod2 dod2. si4
dod2 re1~\mbreak

%11
re2 re2. dod4
re la' fad la fad la
re, fad re fad re fad

%14
si, re si re si re
sol, si sol si sol si
mi, sol mi sol mi sol

%17
dod, mi dod mi dod mi
la,2 r r
la'' r r

%20
fad r r\mbreak
re r r
si r r

%23
mi mi re~
re re2. dod4
re mi fad sol la la,

%26
re2 la'4 si dod dod,
fad2 fad2. mi4
fad mi re dod si si

%29
la2 la2. sold4
la si dod re mi mi,
la2 mi'4 fad\mbreak sold sold,

%32
dod2 dod'2. si4
dod mi dod mi dod mi
la, dod la dod la dod

%35
fad, la fad la fad la
re, fad re fad re fad
si, re si re si re

%38
sol, si sol si sol si
mi, sol mi sol mi sol\mbreak
dod,2 r r

%41
mi''2 r r
dod r r
la r r

%44
fad r r
re r r si r r
mi mi re~

%47
re re2. dod4
re mi fad sol la la,
re2 la'4 si dod dod,

%50
fad2 fad2. mi4\mbreak
fad2. fad4 sol2
fad mi2. mi4

%53
re1.\fermata

}


IIIvlIIn = \relative do'' {

R1.
re4 mi fad sol la la,
re2 re2. dod4

%4
re1.
dod4 re mi fad si, si
la2 r r

%7
la4 si dod re mi mi,
la2 la2. sold4
la1 la'2

%10
sol fad2. mi4
re2 r r
fad4 la fad la\mbreak fad la

%13
re, fad re fad re fad
si, re si re si re
sol, si sol si sol si

%16
mi, sol mi sol mi sol
dod,2 r r
fad' r r

%19
re r r
si r r
sol r r

%22
la1.
sol2 fad2. mi4
re2 r r\mbreak

%25
re'4 mi fad sol la la,
re2 re2. dod4
re1.

%28
dod4 re mi fad si, si
la2 r r
la4 si dod re mi mi,

%31
la2 la2. sold4
la2 r r
dod'4 mi dod mi dod mi

%34
la, dod la dod la dod\mbreak
fad, la fad la fad la
re, fad re fad re fad

%37
si, re si re si re
sol, si sol si sol si
mi,2 r r

%40
dod'' r r
la r r
fad r r

%43
re r r
si r r
sol r r

%46
la1.
sol2 fad2. mi4\mbreak
re2 r r

%49
re'4 mi fad sol la la,
re2 re2. dod4
re1.~

%52
re2 re2. dod4
re1.

}


IIIcbn = \relative do {

R1.*2
re4 mi fad sol la la,
re dod si la sold mi

%5
la si dod re mi mi,
la2 r r
R1.

%8
la'4 si dod re mi mi,\mbreak
la sol fad mi re fad
sol mi la sol la la,

%11
re2 r r
re r r
si r r

%14
sol r r
mi r r
dod r r

%17
fad'4 la fad la\mbreak fad la
re, fad re fad re fad
si, re si re si re

%20
sol, si sol si sol si
mi, sol mi sol mi sol
dod, la' si dod re fad\mbreak

%23
sol mi la sol la la,
re2 r r
R1.

%26
re4 mi fad sol la la,
re' dod si la sold mi
la si dod re mi  mi,

%29
la2 r r
R1.\mbreak
la4 si dod re mi mi,

%32
la2 r r
la r r
fad r r

%35
re r r
si r r
sol r r

%38
mi r r
dod''4 mi dod mi dod mi
la, dod la dod la dod\mbreak

%41
fad, la fad la fad la
re, fad re fad re fad
si, re si re si re

%44
sol, si sol si sol si
mi, sol mi sol mi sol
dod, la' si dod re fad

%47
sol mi la sol\mbreak la la,
re2 r r
R1.

%50
re4 mi fad sol la la,
re dod si la sol mi
la1.

%53
re


}


IIIbcn = \relative do {

R1.*2
re4 mi fad sol la la,
re dod si la sold mi

%5
la si dod re mi mi,
la2 r r
R1.

%8
la'4 si dod re mi mi,\mbreak
la sol fad mi re fad
sol mi la sol la la,

%11
re2 r r
re r r
si r r

%14
sol r r
mi r r
dod r r

%17
fad'4 la fad la\mbreak fad la
re, fad re fad re fad
si, re si re si re

%20
sol, si sol si sol si
mi, sol mi sol mi sol
dod, la' si dod re fad\mbreak

%23
sol mi la sol la la,
re2 r r
R1.

%26
re4 mi fad sol la la,
re' dod si la sold mi
la si dod re mi  mi,

%29
la2 r r
R1.\mbreak
la4 si dod re mi mi,

%32
la2 r r
la r r
fad r r

%35
re r r
si r r
sol r r

%38
mi r r
dod''4 mi dod mi dod mi
la, dod la dod la dod\mbreak

%41
fad, la fad la fad la
re, fad re fad re fad
si, re si re si re

%44
sol, si sol si sol si
mi, sol mi sol mi sol
dod, la' si dod re fad

%47
sol mi la sol\mbreak la la,
re2 r r
R1.

%50
re4 mi fad sol la la,
re dod si la sol mi
la1.

%53
re

}

IIIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

s1.*2
<5>4 s <6> <7 5> <4> <3>
<5>1 <5->4 <7>
<5> s <6> <6 5> <4> <3+>
s1.*2
<5>2 <6>4 <7 5> <6 4> <5 3+>
<5>2 <6> <5>4 <6>
<6 5> <7> <6 4> s <5 3>2
<5>1.
<5>
<5>
<5>
<5>
<5->
<5>
<5>
<5>
s
s
<6>2 s4 <6> <5> <6>
<6 5> <7> <6 4> s <5 3>2
<5>1.
s
<5>2 <6>4 <7 5> <6 4> <5 3>
<5>1 <5->4 <7>
<5>2 <6>4 <6 5> <4> <3>
<5>1.
s
<5>2 <5>4 <6 5> <6 4> <5 3>
<5>1.
s
<5>
<5>
<5>
<5>
<5>
s1.*7
<6>1 <5>4 <6>
<6 5> <7> <5 4> s <5 3>2
s1.*2
<5>2 <6>4 <7 5> <6 4> <5 3>
<5>2 <5> <5>4 <7>
<6 4>2 <5> s4 <3>

}


forma = {

\key re\major
\time 3/2
\tempo 2 = 75
s1.*53
\bar"||"


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


IIIcb = {
	\IIIglobal
	\clef bass
	<<\IIIcbn \forma>>
}



IIIbc = {
	\IIIglobal
	\clef bass
	<<\IIIbcn \forma \IIIbfn>>
	\typeset

}


IVglobal = 	{
		\override Score.MetronomeMark.transparent = ##t   		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletNumber.transparent = ##f
		\override TupletBracket.bracket-visibility = ##f
		\terzine \terzinecon
			}


IVvlIn = \relative do'' {

fad8 mi sol
fad mi16 fad re8
re dod mi

%4
re fad16 mi re8
fad mi16 fad mi re
dod8 si16 dod la8

%7
la la8.-+ sold16
la sold la si\p dod re\mbreak
mi re mi fad\f mi re

%10
dod8 si16 dod la8
la la8. sold16
la4.

%13
dod8 si mi
dod si16 dod la8
fad' mi fad

%16
re dod16 re si8
sol'32[(fad mi re) dod8. dod16]
re8 dod re\mbreak

%19
mi16 re  mi fad mi re
dod si dod re dod8
dod16[re32(dod) si8. si16]

%22
la8 si dod
re16\f dod re mi re dod
si8 dod16 re mi8

%25
dod re16 mi fad8
re mi16 fad sol8
mi fad16 sol la8\mbreak

%28
fad16  mi re dod si re
re4-+ dod8
re16 la si dod re mi

%31
re\p dod re mi re dod
si8 dod16 re mi8
dod re16 mi fad8

%34
re mi16 fad sol8
mi fad16 sol la8
fad16 mi re dod si re

%37
re4-+ dod8
re4.

}


IVvlIIn = \relative do'' {

la'4 mi8
la, r r
fad' mi4-+

%4
fad8 r r
la4 la,8
mi' r r
fad32(mi re dod) si8.-+ si16

%8
la8 r r\mbreak
la r r
mi' r r

%11
fad32(mi re dod) si8.-+ si16
la4.
mi'4 si8

%14
mi r r
dod r r
fad r r

%17
si, si8. lad16
si8 mi si
si r r

%20
la16 sold la si la8
la la8. sold16\mbreak
la8 re la

%23
la\f r r
re r r
mi r r

%26
fad r r
la, r r
la si16 la sol fad

%29
mi4 mi8
re r r
la'\p r r

%32
re r r
mi r r
fad r r

%35
la, r r
la si16 la sol fad
mi4 mi8

%38
re4.

}


IVcbn = \relative do {

re8 dod4
re8 r r
re la4

%4
re8 r r\mbreak
re dod4
la8 r r

%7
re mi mi,
la\p r r
dod r r

%10
la r r
re mi mi,
la4.

%13
la'8 sold4
la8 r r
lad r r

%16
si r r\mbreak
mi, fad fad,
si la si

%19
sold r r
la re4
mi8 mi,4

%22
la8 sol la
fad\f r r
sol r r

%25
la r r
si r r
dod r r

%28
re sol4\mbreak
la la,8
re r r

%31
fad\p r r
sol, r r
la r r

%34
si r r
dod r r
re sol4

%37
la8 la,4
re4.


}


IVbcn = \relative do {


re8 dod4
re8 r r
re la4

%4
re8 r r\mbreak
re dod4
la8 r r

%7
re mi mi,
la\p r r
dod r r

%10
la r r
re mi mi,
la4.

%13
la'8 sold4
la8 r r
lad r r

%16
si r r\mbreak
mi, fad fad,
si la si

%19
sold r r
la re4
mi8 mi,4

%22
la8 sol la
fad^\f r r
sol r r

%25
la r r
si r r
dod r r

%28
re sol4\mbreak
la la,8
re r r

%31
fad\p r r
sol, r r
la r r

%34
si r r
dod r r
re sol4

%37
la8 la,4
re4.

}

IVbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

<5>8 <6> <5>
<5>4.
s
s
s8 <6>4
s4.
<6 5>8 <4> <3+>
s4.
<6>
s
<6 5>8 <4> <3+>
s4.
<5>8 <6>4
<5>8 s s
<6> s s
<5> s s
<7 5> <4> <3+>
<5>4.
<6>
<5>8 <7 5>4
<6 5>8 <5 4> <3>
s4.
<6>
<5>
<5>
<5>
<6>
<5>8 <7 5>4
<4> <3>8
<5>4.
<6>
<5>
<5>
<5>
<6>
<5>8 <7 5>4
<4>8 <3>4

}


forma = {

\key re\major
\time 3/8
\tempo 4. = 67
s4.*12
\bar":..:"\break
s4.*26
\bar":|."

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


IVcb = {
	\IVglobal
	\clef bass
	<<\IVcbn \forma>>
}



IVbc = {
	\IVglobal
	\clef bass
	<<\IVbcn \forma \IVbfn>>
	\typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

	systems-per-page = #4
   	print-first-page-number = ##t
	first-page-number = #2

		}

\markup \huge  {"[1.] Grave - Andante - Largo"}

	\score {
		{ <<

			\new ChoirStaff <<

				\new Staff <<
					\set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"primo"}
					\set Staff.midiInstrument = #"violin"
					\IvlI
							>>

 				\new Staff <<
					\set Staff.instrumentName = \markup  \center-column{"Violino"\vspace #-0.2"secondo"}
					\set Staff.midiInstrument = #"violin"
					\IvlII
							>>

 				\new Staff <<
					\set Staff.instrumentName = \markup \center-column{"Violone o"\vspace #-0.2"Arcileuto"}
					\set Staff.midiInstrument = #"contrabass"
					\Icb
							>>

				\new Staff  <<
					\set Staff.instrumentName = \markup  \center-column{"Organo"}
					\set Staff.midiInstrument = #"church organ"

					\Ibc
							>>	>>
		>> }


\layout {

	indent = 1.2\cm

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
			} }

}

%\pageBreak

\markup \huge  {"[2.] Spiritoso"}

	\score {
		{ <<

			\new ChoirStaff <<

				\new Staff <<
					\set Staff.midiInstrument = #"violin"
					\IIvlI
							>>

 				\new Staff <<
					\set Staff.midiInstrument = #"violin"
					\IIvlII
							>>

 				\new Staff <<
					\set Staff.midiInstrument = #"contrabass"
					\IIcb
							>>

				\new Staff  <<
					\set Staff.midiInstrument = #"church organ"

					\IIbc
							>>	>>
		>> }


\layout {

	indent = 0.5\cm

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
			} }

}

\pageBreak

\markup \huge  {"[3.] Andante"}

	\score {
		{ <<

			\new ChoirStaff <<

				\new Staff <<
					\set Staff.midiInstrument = #"violin"
					\IIIvlI
							>>

 				\new Staff <<
					\set Staff.midiInstrument = #"violin"
					\IIIvlII
							>>

 				\new Staff <<
					\set Staff.midiInstrument = #"contrabass"
					\IIIcb
							>>

				\new Staff  <<
					\set Staff.midiInstrument = #"church organ"

					\IIIbc
							>>	>>
		>> }


\layout {

	indent = 0.5\cm

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
			} }

}

\pageBreak

\markup \huge  {"[4.] Allegro"}

	\score {
		{ <<

			\new ChoirStaff <<

				\new Staff <<
					\set Staff.midiInstrument = #"violin"
					\IVvlI
							>>

 				\new Staff <<
					\set Staff.midiInstrument = #"violin"
					\IVvlII
							>>

 				\new Staff <<
					\set Staff.midiInstrument = #"contrabass"
					\IVcb
							>>

				\new Staff  <<
					\set Staff.midiInstrument = #"church organ"

					\IVbc
							>>	>>
		>> }


\layout {

	indent = 0.5\cm

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
			} }

}

\pageBreak





