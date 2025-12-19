\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

"|" = \bar "||"

tr = \trill

sta = _\markup \italic "staccato"

sciolti = _\markup \italic "sciolti"

sciolto = _\markup \italic "sciolto"

presto = ^\markup \italic \large "Presto."

espresso = _\markup \italic "espresso"

aa = _\markup \italic \bold "a"

fp = _\markup \italic "f p"

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

rinf = _\markup \italic "rinf"

prinf = _\markup \italic "p rinf"

tastos = _\markup \italic "tasto solo"

ts = _\markup \italic "t. s."

passai = _\markup \italic "p assai"

forte = _\markup \italic "forte"

adagio = _\markup \italic \bold "adagio."

dolce = _\markup \italic "dolce"

fassai = _\markup \italic "f assai"

fss = _\markup \italic {fortiss\super mo}

sf = _\markup \italic \bold "sf"

rr = _\markup \italic \bold "r"

pp = _\markup \italic "pp"

ff = _\markup \italic \bold "ff"

ilf = _\markup \italic \bold "il f"

il = _\markup \italic \bold "il"

fo = _\markup \italic "f"

mf = _\markup \italic \bold "mf"

mezo = _\markup \italic \bold "mezo"

mezza = _\markup \italic "a mezzavoce"

pf = _\markup \italic "p f"

pof = _\markup \italic "poco f."

pofo = _\markup \italic "p.f."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "T."

adue = _\markup \italic \bold "a Due"

pip = _\markup \italic "più p."

fi = _\markup \italic \bold "FINE"

fin = ^\markup "Fin"

pad = \once \override TextScript.padding = #2

padall = \override TextScript.padding = #1.5 

puntopz = -\parenthesize -!

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

dc = _\markup \italic \bold {"DC"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber.transparent = ##f

terzinecon = \override TupletNumber.transparent = ##f

volti = _\markup \italic \bold \column {"Volti"}

trillo = ^\markup \italic \bold "t."

seguesu = _\markup \italic \bold \column {"Segue""subito"}
mbreak = { }


Iglobal = 	{
		\override Score.MetronomeMark.transparent = ##t   		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\override TupletNumber.transparent = ##f
		\sestine
			}


IvlIn = \relative do'' {
	
mi4\p mi, r
fa' fa, r
sold' sold, r

%4
la' la, r
sol'! sol, r
fa' fa, r

%7
sold sold, r
la' la, r
do' do, r

%10
do' do, r\mbreak
do' do, r
si'2 r4

%13
r8 la'\f si(la) sold(la)
sold4 r r
r8 sol! la sol fad sol

%16
fad4 r r
r8 fa! sol(fa) mi(fa)
mi4 sold\p la~

%19
la2.~\mbreak
la4 fad(sol!)
sol2.~

%22
sol4 mi(fa!)
fa2.~
fa4 re(mi)

%25
mi sol\f sol,
r la' la,
r si si,

%28
r do' do,
r sol' sol,
r la la'\mbreak

%31
sol8 fa mi4 re
do2 r4
sol'\p sol, r

%34
la' la, r
sol'8 fa mi4 re
do2 r4

%37
sol''4\f sol, r
la' la, r
mi' mi, r

%40
fa' fa, r\mbreak
r la'\p(sib)
sib?2.~

%43
sib4 sold(la)
la2.~
la4 fad(sol!)

%46
sol2.~
sol4 mi(fa!)
fa fa, r

%49
fad'\f fad, r
sol' sol, r
sold' sold, r\mbreak

%52
la' la, r
si' si, r
do'2 si8 la

%55
sol fad mi4 red
mi2 r4
r8 sol\p la(sol) fad(sol) 

%58
fad4 r r
r8 fa! sol(fa) mi(fa)
mi4 r r\mbreak

%61
r8 mi fa(mi) red(mi)
red4 r r
r8 re! mi(re) do(re)

%64
do4 la'\f la,
r la' la,
r la la,

%67
\tuplet3/2{fa'8(mi re)} do4 si
la la''\p la,
r la' la,\mbreak

%70
r la la,
\tuplet3/2{fa'8(mi re)} do4 si
la2 r4

}

IvlIIn = \relative do'' {
	
do4 do, r
re' re, r
si' si, r

%4
do' do, r
dod' dod r
re re, r

%7
si' si, r
do' do, r
la' la, r

%10
la' la, r\mbreak
la' la, r
sold'8\f(mi') fa(mi) red(mi)

%13
red4 r r
r8 re! mi(re) dod(re)
dod4 r r

%16
r8 do! re(do) si(do)
si4 r r
R2.

%19
r4 dod\p(re)\mbreak
re2.~
re4 si(do)

%22
do2.~
do4 la(si)
si2 sol8 si

%25
do4\f mi mi,
r do' fa,
r re sol

%28
r mi mi
r do mi
r do fa\mbreak

%31
mi8 re do4 si
do2 r4
mi4\p do r

%34
do fa r
mi8 re do4 si 
do2 r4

%37
mi'\f mi, r
fa' do r
dod dod, r

%40
re' la r\mbreak
fa'2.\p~
fa4 re(mi)

%43
mi2.~
mi4 dod(re)
re2.~

%46
re4 si(dod)
dod?2 la8(dod)
re4 re, r

%49
re'\f re, r
sib' re, r
si'! re, r\mbreak

%52
do' do, r
sold' mi' r
la, mi' re8 do

%55
si la sol!4 fad
mi2 r4
la2\p r4

%58
r8 do re(do) si(do)
si4 r r
r8 si do(si) la(si)

%61
la4 r r\mbreak
r8 la si(la) sold(la)
sold4 r r

%64
r do\f do, 
r do' do,
r do2

%67
\tuplet3/2{re8(do si)} la4 sold
la do'\p do,
r do' do,

%70
r do2\mbreak
\tuplet3/2{re8(do si)} la4 sold
la2 r4

}

Ibcn = \relative do {

r4 la'\p la,
r la' la,
r la' la,

%4
r la' la,
r la' la,
r la' la,

%7
r la' la,
r la' la,
r fa' fa,

%10
r do' do,\mbreak
r red' red,
mi2 r4

%13
si'2\f r4
mi2 r4
la2 r4

%16
re,2 r4
sol2 r4
do,2 r4

%19
fa2\p r4
si,2 r4
mi2 r4

%22
la,2 r4
re2 r4
sol,2 r4\mbreak

%25
do'4\f do, r
fa fa, r
sol' sol, r

%28
la' la, r
mi' mi, r
fa' fa, r

%31
sol' sol, r
do do'8 sol do,4
r mi\p mi,

%34
r fa' fa,\mbreak
r sol' sol,
do sol do,

%37
r do''\f do,
r fa fa,
r la' la,

%40
r re re,
re'2\p r4
sol2 r4

%43
do,2 r4
fa2 r4\mbreak
sib,2 r4

%46
mi2 r4
la,2 r4
re\f re' re,

%49
r do' do,
r sib' sib,
r si'! si,

%52
r la' la,
r sold' sold,\mbreak
r la' la,

%55
r si' si,
mi si mi,
dod'2\p r4

%58
re2 r4
sol,2 r4
do!2 r4

%61
fa,2 r4
si2 r4
mi,2 r4\mbreak

%64
la'4\f la, r
fa' fa, r
do' do, r

%67
re' mi mi,
la'\p la, r
fa' fa, r

%70
do' do, r
re' mi mi,\mbreak
<<{la mi' la}\\{la,2_\fermata r4}>>

}

Ibfn = \figuremode {

	\bassFigureExtendersOn
	\bassFigureStaffAlignmentUp

s2.
s4 <6 4> s
s <7+ 2> s
s <8 3> s
s <7! _+> s
s <6 4> s
s <7+ 2> s
s <3!> s
s <5 3> s
s <8 6> <8 6>\mbreak
s <7 5> s
<_+>2 s4
<7 _+>2 s4
<7! _+>2 s4
<7 _+>2 s4
<7! _+>2 s4
<7! 3>2 s4
<3>2 s4
s2.
<7 _!>2 s4
<7 3!>2 s4
<7 3!>2 s4
<7 3!>2 s4
<7 3>2 s4\mbreak
<3>2.
s2.*5
<6 4>4 <6 4> <5 3>
s2.
s4 <6> s
s2.\mbreak
s4 <6 4> <5 3>
s2.*3
s4 <_+> s
s <3!> s
s2.
<3- 7>
<7- 3>2 s4
<3 7>2 s4\mbreak
<7 3>2 s4
<3 7> 2 s4
<7 _+>2 s4
s2.
s4 <4\+ 2> s
s <6> s
s <6\\> s
s <3!> s
s <6> s\mbreak
s <3!> s
s <6 4> <5+ 3+>
s2.
<6 5>
<7- _+>
<3 7!>2 s4
<9 3>2 s4
<2 7>2 s4
<7 _+>2 s4
<_+ 7!>2 s4\mbreak
<3!>2 s4
s2.
<6>4 <6> s
<6 5\\>8 s <4 6>4 <_+ 5>
<_!> s s
s s s
<6> s s
<5 6>8 s <4 6>4 <_+ 5>

}

forma = {

\time 3/4
\key la\minor
\tempo 2 = 110
s2.*36
\bar":..:"\break
s2.*36
\bar":..:"

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


Ibc = {
	\Iglobal
	\clef bass
	<<\Ibcn \Ibfn \forma>>
	\typeset
}


IIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t   		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\override TupletNumber.transparent = ##f
		\sestine
			}


IIvlIn = \relative do'' {
	
\pad mi2.^\markup\italic"Il Giorno di 10 hore"
do'4 fa,(mi)
si' mi,(red)

%4
\grace red8 mi2 r4
la,8 sib' la4 sol
\grace sol8 fa2 r4

%7
sol,,8 la' sol4 fa
mi do'2
la'8(la,) \grace do si2\tr

%10
do2 r4\mbreak
\pad mi^\markup\italic"La Notte di 14 hore"(fad) sol~
sol fad mi~

%13
mi red do!~
do si la
sol mi2 

%16
si'4 mi,2
do'8(mi,) \grace sol fad2\tr
mi r4

%19
fa'!(mi) red
si' mi,, r\mbreak
sib'(la) sold

%22
mi' re8 do si! la
la'(la,) \grace do si2\tr
la2 r4

}

IIvlIIn = \relative do'' {
	
mi2.
do'4 fa,(mi)
si' mi,(red)

%4
\grace red8 mi2 r4
la,8 sib' la4 sol
\grace sol8 fa2 r4

%7
sol,,8 la' sol4 fa
mi do'2
la'8(la,) \grace do si2\tr

%10
do2 r4\mbreak
mi(fad) sol~
sol fad mi~

%13
mi red do!~
do si la
sol mi2 

%16
si'4 mi,2
do'8(mi,) \grace sol fad2\tr
mi r4

%19
fa'!(mi) red
si' mi,, r\mbreak
sib'(la) sold

%22
mi' re8 do si! la
la'(la,) \grace do si2\tr
la2 r4

}

IIbcn = \relative do {

la'8 si do4 si
r la(sold)
r sol!(fa)

%4
r mi re
dod2 r4
re8 la' re4 do

%7
si2 r4
do la mi
fa sol sol,\mbreak

%10
do <<{mi'8-1 re do si}\\{sol-2 fa  mi re}>>
do4 do' si
la2 sol4

%13
fad2 mi4
red2 r4
mi sol8 fad sol4

%16
mi do'8 si do4
la si si,\mbreak
mi mi'8 re do si

%19
la2 si4
sold fad8 sold mi4
re2 mi4

%22
do2 r4
re mi mi,
<<{la8 la'-1(sol fa mi re)}\\{la2_\fermata r4}>>

}

IIbfn = \figuremode {

	\bassFigureExtendersOn
	\bassFigureStaffAlignmentUp

s4 <6> <6>
s <6>8 s <6>4
s <6> <6\\>
s <_+> s
<6>2 <5>4
<_!> s s
<6>2.
s4 s <6>8 s
<6 5>4 <3> s\mbreak
s2.
<3>4 <4\+> <6>8 <6>
<7>4 <6\\> <6>8 <6>
<7>4 <6\\> <6->8 <6->
<7>4 <6> <5>
<_!> <6> s
s2.
<6\\ 5>4 <_+>2\mbreak
s2. 
<6->4 <5> <_+>
<6> s s
<6-> <5> <_+>
<6> s s
<6 5> <3+>

}

forma = {

\time 3/4
\key la\minor
\tempo 2 = 85
s2.*10
\bar":..:"\break
s2.*14
\bar":..:"

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


IIbc = {
	\IIglobal
	\clef bass
	<<\IIbcn \IIbfn \forma>>
	\typeset
}


IIIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t   		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\override TupletNumber.transparent = ##f
		\sestine
			}


IIIvlIn = \relative do'' {
	
la'8 la,16 la la8 la la4 la la16 si do si la [si do re]
mi8 mi,16 mi mi8 mi mi4 mi mi16 fad sold fad mi [fad sold mi]
la8 la,16 la la8 la la4 la\mbreak la16 si do si la [si do re]

%4
mi8 mi'16 mi mi8 mi, mi16 mi mi mi mi [mi mi mi] mi4 r
do''16(si) la(sol) la[(sol) fa(mi)] fa(mi) re(do) re[(do) si(la)]\mbreak si(la) sol(fa) sol[(fa) mi(re)]
si''(la) sol(fa) sol[(fa) mi(re)] mi(re) do(si) do[(si) la(sol)] la(sol) fa(mi) fa[(mi) re(do)]

%7
la''(sol) fa(mi) fa[(mi) re(do)]\mbreak re(do) si(la) si[(la) sol(fa)] sol(fa) mi(re) sol[(fa) mi(re)]
mi8 fa16 sol la si do re mi8 re16 do si la sol fa mi8 fa16 sol la si do re 
mi\p do' do do do[do do do]\mbreak do do do do do[do do do] do do do do do[do do do]

%10
si si si si si[si si si] si si si si si[si si si] si si si si si[si si si]
la la la la la[la la la] la la la la la[la la la] la la la la la[la la la]
sol\f(fad) mi(red) mi[(re!) do(si)] do(si)la(sol) la[(sol) fad(mi)] si'4 si,\mbreak

%13
mi8 fad16 sol la si dod red mi8 re16 dod si la sol fad mi4 r
mi'16\p(fa8.) fa16(sol8.) sol16(fa8.) fa16(mi8.) mi4 la
fa8\f mi16 re dod si la sol\mbreak fa8 sol16 la si dod re mi fa4 r

%16
re16\p(mi8.) mi16(fa8.) fa16(mi8.) mi16(re8.) re4 sol
mi8\f re16 do si la sol fa mi8 fa16 sol la si do re mi4 r\mbreak
la16\p(sol8.) sol16(la8.) la16(sol8.) la16[(sol) fad(sol)] fad4 r

%19
sol16(fa!8.) fa16(sol8.) sol16(fa8.) sol16[(fa) mi(fa)] mi4 r
fa16(mi8.) mi16(fa8.) fa16(mi8.) fa16[(mi) red(mi)] red4 r\mbreak
mi16(re!8.) re16(mi8.) mi16[(re8.)] mi16(re) do(re) do4 r

%22
la16(si8.) si16(do8.) do16(dod8.) dod16(re8.) re16(red8.) red16(mi8.)
mi8\f re!16 do si la sold fad mi8 fad16 sold la si do re mi4 r
do'16(si) la(sol) la[(sol) fa(mi)] fa(mi) re(do) re[(do) si(la)] si(la) sol(fa) sol[(fa) mi(re)]

%25
si''(la) sol(fa) sol[(fa) mi(re)]\mbreak mi(re) do(si) do[(si) la(sol)] la(sol) fa(mi) fa[(mi) re(do)]
la''(sol) fa(mi) fa[(mi) re(do)] re(do) si(la) si[(la) sold(fad)] sold[(fad) mi(re)] mi(re) do(si)\mbreak
la8 si16 do re mi fad sold la8 sold16 fad mi re do si la8 si16 do re mi fad sold

%28
la16(la'8.) sol16(fa8.) mi16(fa8.) mi16(re8.) do16(si8.) la16(sold8.)\mbreak
la8 si16 do re mi fad sold la8 sold16 fad mi re do si la4 r

}

IIIvlIIn = \relative do'' {
	
la'8 la,16 la la8 la la4 la la16 si do si la [si do re]
mi8 mi,16 mi mi8 mi mi4 mi mi16 fad sold fad mi [fad sold mi]
la8 la,16 la la8 la la4 la\mbreak la16 si do si la [si do re]

%4
mi8 mi'16 mi mi8 mi, mi16 mi mi mi mi [mi mi mi] mi4 r
r8 do'4 mi8 la, fa4 la8 re,[re] re4
r8 si'4 re8 sol, mi4 sol8\mbreak do,[do] do4

%7
r8 la'4 do8 fa, re4 fa8 si,[si] si4
do8 re16 mi fa sol la si do8 si16 la sol fa mi re do8 re16 mi fa sol la si
do\p[mi mi mi] mi mi mi mi\mbreak mi[mi mi mi] mi mi mi mi re re re re re[re re re]

%10
re re re re re[re re re] re re re re re[re re re] do do do do do[do do do]\mbreak
do do do do do[do do do] do do do do do[do do do] si si si si si[si si si]
si8\f sol4 si8 mi, la4 do8 si4 si,

%13
mi8 fad16 sol la si dod red mi8 re16 dod si la sol fad mi4 r
dod'16\p(re8.) re16(mi8.) mi16(re8.) re16(dod8.) dod16(la8.) dod16(mi8.)
re8\f dod16 si la sol fa mi\mbreak re8 mi16 fa sol la si dod re4 r

%16
si16\p(do!8.) do16(re8.) re16(do8.) do16(si8.) si16(sol8.) si16(re8.)
do8\f si16 la sol fa mi re\mbreak do8 re16 mi fa sol la si do4 r
do\p r r dod re16(do8.) re16[(do) si(do)]

%19
si4 r  r si do16(sib8.) do16[(sib) la(sib)]
la4 r r la\mbreak si!16(la8.) si16[(la) sold(la)] 
sold4 r r sold la16(sol8.) la16[(sol) fa(sol)]

%22
fa2 r4 fa fa fa
mi8\f fad16 sold la si do re\mbreak mi8 re16 do si la sold fad mi4 r
r8 do'4 mi8 la, fa4 la8 re,[re] re4

%25
r8 si'4 re8 sol, mi4 sol8 do,[do] do4
r8 la'4 do8 fa, re4 fa8\mbreak si,[si] si4
la8 si16 do re mi fad sold la8 sold16 fad mi re do si la8 si16 do re mi fad sold 

%28
la16(la'8.) sol16(fa8.) mi16(fa8.) mi16(re8.) do16(si8.) la16(sold8.)\mbreak
la8 si16 do re mi fad sold la8 sold16 fad mi re do si la4 r


}

IIIbcn = \relative do {

	
la'8 la,16 la la8 la la4 la la16 si do si la [si do re]
mi8 mi,16 mi mi8 mi mi4 mi' mi16 fad sold fad mi [fad sold mi]
la8 la,16 la la8 la la4 la\mbreak la16 si do si la [si do re]

%4
mi8 mi'16 mi mi8 mi, mi16 mi mi mi mi [mi mi mi] mi fad sold fad mi[fad sold mi]
la,4 do re fa! sol! si\mbreak
sol, si do mi fa la

%7
fa, la si re si sol
do r do8 re16 mi fa sol la si do8 si16 la sol fa mi re
do4 r r la'\p fad re\mbreak

%10
sol sol, r sol' mi do
fad fad, r fad' red si
mi\f sol la do si si,

%13
mi8 re16 do si la sol fad\mbreak mi8 fad16 sol la si do red mi4 r
la8\p la,16 la la8 la la4 la la16 si dod si la [si dod la]
re8\f mi16 fa sol la si dod\mbreak re8 dod16 si la sol fa mi re4 r

%16
sol8\p sol,16 sol sol8 sol sol4 sol sol16 la si la sol [la si sol]
do8\f re16 mi fa sol la si do8 si16 la sol fa mi re\mbreak do4 r
R1.*5

%23
mi8\f fad16 sold la si do re mi8 re16 do si la sold fad mi fad sold fad mi[fad sold mi]
la,4 do re fa! sol! si
sol, si do mi fa la\mbreak

%26
fa, la si re mi sold
la8 sold16 fad mi re do si la8 si16 do re mi fad sold la8 sold16 fad mi re do si
la4 re do re mi mi\mbreak
la8 sold16 fad mi re do si la8 si16 do re mi fad sold la4 r

}

IIIbfn = \figuremode {

	\bassFigureExtendersOn
	\bassFigureStaffAlignmentUp

s1.*4
s4 <6> <_!> <6> s <6>
s <6> s <6> s <6>
s <6> s <6>8 s <6>4 s
s1.
s1 <6 5>4 <6 _+>
s1 <6 5>4 <6 5>
<5! 3>1 <6 5>4 <7 _+>
s <6> s <6> <_+> s
<3!>1.
<5 _+>4 <6! 4> <7 5> <6 4> <5 _+>2
<3->1.
<5 3>4 <6 4> <7 5> <6 4> <5 3>2
s1.*7
s4 <6> s <6> s <6>
s <6> s <6> s <6>
s <6> s <6> <_+> <6>
<_!>1.
s4 s <6> s <6 4> <5 _+>

}

forma = {

\time 3/2
\key la\minor
\tempo 2 = 65
s1.*13
\bar":..:"\break
s1.*16
\bar":..:"

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


IIIbc = {
	\IIIglobal
	\clef bass
	<<\IIIbcn \IIIbfn \forma>>
	\typeset
}


IVglobal = 	{
		\override Score.MetronomeMark.transparent = ##t   		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\override TupletNumber.transparent = ##f
		\terzinequarto
			}


IVvlIn = \relative do'' {
	
\pad mi2.^\markup\italic"Il Giorno di 9 hore"~
mi8 do la4 la'
\grace la8 sold2 r4

%4
mi,8 la mi'4 re
\grace re8 do2 r4
la4 si8(dod) dod8.\tr si32 (dod)

%7
re4 mi8(fa) fa8.\tr mi32(fa)
sol8(re) mi(do) re(si)
do2 r4

%10
\pad sol'2.^\markup\italic"La Notte di 15 hore"
sol8 mi la sol fa mi
fa2 r4

%13
re,8 la' re4 do
\grace do8 sib2 la4
sol8 re' sol4 fa

%16
\grace fa8 mi2 re4
do8(sol) la(fa) sol(mi)
fa2 r4

%19
la8(si) dod(re) \tuplet3/2{mi[(fa sol)]
fa(mi re)} fa2
mi,8(fad) sold(la) \tuplet3/2{si[(do re)]

%22
do(si la)} la'4~la8 (la,)
fa'(la,) \grace do si2\tr
la r4

}

IVvlIIn = \relative do'' {
	
\pad mi2.~
mi8 do la4 la'
\grace la8 sold2 r4

%4
mi,8 la mi'4 re
\grace re8 do2 r4
la4 si8(dod) dod8.\tr si32 (dod)

%7
re4 mi8(fa) fa8.\tr mi32(fa)
sol8(re) mi(do) re(si)
do2 r4

%10
\pad sol'2.
sol8 mi la sol fa mi
fa2 r4

%13
re,8 la' re4 do
\grace do8 sib2 la4
sol8 re' sol4 fa

%16
\grace fa8 mi2 re4
do8(sol) la(fa) sol(mi)
fa2 r4

%19
la8(si) dod(re) \tuplet3/2{mi[(fa sol)]
fa(mi re)} fa2
mi,8(fad) sold(la) \tuplet3/2{si[(do re)]

%22
do(si la)} la'4~la8 (la,)
fa'(la,) \grace do si2\tr
la r4

}

IVbcn = \relative do {

la'8 si do4 si
la sol fa
mi8 si' mi4 re

%4
do do, si
la8 mi' la4 sol
r fa mi

%7
r re do
si do sol'\mbreak
do, <<{mi'8-1 re do si}\\{sol-2 fa mi re}>>

%10
do re mi4 re
dod la dod
re8 fa la4 sol

%13
fa2 mi4
re re' do
sib2 la4

%16
sol sol, fa'\mbreak
mi fa do
fa, fa' mi8 re

%19
dod4 la dod
re re'8 do si la
sold4 mi sold

%22
la fa do
re mi mi,
<<{la8 la'-1(sol fa mi re)}\\la2_\fermata>>

}

IVbfn = \figuremode {

	\bassFigureExtendersOn
	\bassFigureStaffAlignmentUp

s2.
s4 <2> <6 2>
<_+>8 s <_+>4 <_+>

%4
<6> <3>8 s <3>4
s2.
s4 <4> <6\\>

%7
s s <4>
<6> s <3>
s2.*2

%11
<5>4 <8 _+> <5>
<_!> s s
<6>4 s <6>8 s

%14
<6->4 s <6>8 s
<6>4 s <6>8 s
<6>4 <6>8 s <6> s
<6>4 s <3>
s2.
<6>4 <_+> <5>
<3!> s s
<6> <_+> <5!>
<_!> s <6>8 s
<6 5>4 <3+>

}

forma = {

\time 3/4
\key la\minor
\tempo 2 = 85
s2.*9
\bar":..:"\break
s2.*15
\bar":..:"

}


IVvlI = {
	\IVglobal
	\notypeset
	<<\IVvlIn \forma>>
}

IVvlII = {
	\IVglobal
	<<\IVvlIIn \forma>>
}


IVbc = {
	\IVglobal
	\clef bass
	<<\IVbcn \IVbfn \forma>>
	\typeset
}


Vglobal = 	{
		\override Score.MetronomeMark.transparent = ##t   		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\override TupletNumber.transparent = ##f
		\terzine
			}


VvlIn = \relative do'' {
	
r4 r8 fa~
fa16 mi mi,8 r mi'~
mi16 re re,8 r re'~

%4
re16 do mi,8 r4
R2
\tuplet3/2{sol'16 sol sol sol[sol sol] sol sol sol sol[sol sol]

%7
fad fad fad fad[fad fad]\mbreak fad fad fad fad[fad fad]
mi mi mi mi[mi mi] mi mi mi mi[mi mi]
red mi fad si,[dod red] mi fad sol sol[la si]

%10
do si la sol[fad mi]} sol,8 fad\mbreak
\tuplet3/2{mi16 mi' mi mi[mi mi] fa! fa fa sold[sold sold]}
la16. la,32 la'8 si16. si,32 si'8

%13
la16. la,32 la'8 \tuplet3/2{sol!16 la sib la[sib sol]
fa sol la sol[la fa]\mbreak mi fa sol fa[sol mi]
re mi fa mi[fa re] do re mi re[mi do]

%16
si sol la si[do re] mi do re mi[fa sol]
la sol fa mi[re do]} mi8 re\tr
do4 r\mbreak

%19
\tuplet3/2{sol'16 sol sol sol[sol sol] sol sol sol sol[sol sol]}
do8 mi,4 fad8
sol re si sol

%22
la la~\tuplet3/2{la16 si do re[mi fa]}
sol,8 sol~\tuplet3/2{sol16 la si do[re mi]}
fa,8 fa~\tuplet3/2{fa16 sol la si[do re]}\mbreak

%25
mi,8 mi~\tuplet3/2{mi16 fad sold la[si do]
re mi fa fa[mi re] si' la sold fa![mi re]}
do4 dod8~[\tuplet3/2{dod16 re mi]}

%28
re4 do!8~[\tuplet3/2{do16 si la]}
sold8 mi' red re\mbreak
dod do si la

%31
sold[\tuplet3/2{sold16\p sold sold]} la8 si~
si la sold red
\tuplet3/2{mi16\f mi mi mi[mi mi] fa fa fa fad[fad fad]

%34
sold sold sold la[la la] si si si do[do do]}\mbreak
re8 re~\tuplet3/2{re16[mi fa] fa mi re
do [si la]} la' la, si8[sold]

%37
\tuplet3/2{la16 la la la'[la la] mi mi mi do[do do]
la la, la la[la la]} la4

}

VvlIIn = \relative do'' {

\tuplet3/2{do16 do do do[do do] do do do do[do do] 
si si si si[si si] si si si si[si si]
la la la la[la la] la la la la[la la]\mbreak

%4
sold si la sold[fad mi] la si do si[do re]
do re mi mi[fa sol] la sol fa} mi[red]
mi8 mi, r do'~

%7
do16 si si,8 r si'~
si16 la la,8 r la'~\mbreak
la sol16. la32 si16. mi,32 mi'8~

%10
mi mi,4 red8
mi mi'4 re8~
\tuplet3/2{re16 do do do[do do] red red red mi[mi mi]

%13
dod dod dod re![re re]} re8 do~\mbreak
do8 si4 la8~
la sol4 fa8~

%16
fa sol16. fa32 mi16.[sol32] do16. mi32
la,16. re32 do4 si8\tr
do sol mi mi'

%19
re si sol re'
\tuplet3/2{do16 do do do[do do]\mbreak do do do do[do do]
si si si si[si si] si si si si[si si]}

%22
do8.\tr si32 do re16 la la8
si8.\tr la32(si) do16 sol sol8
la8.\tr sol32 la si16.[fa32 re16. si'32]\mbreak

%25
sold8.\tr fad32 sold la16.[mi32 do16. la'32]
fa!8. fa16 mi8 si'~
\tuplet3/2{si16 si si la[la la] sib sib sib sib[sib sib]

%28
la la la la[la la] red red red red[red red]}\mbreak
mi8 sold, la si~
si la sold red

%31
mi mi'\p red re
dod do si la
sold8.\f sold16 la8 si

%34
mi,8. fad16 \tuplet3/2{sold16 sold sold la[la la]
si si si la[la la]} sold8 si~
si16 do la8 si sold
	
%37
\tuplet3/2{la16 la la la'[la la] mi mi mi do[do do]
la la, la la[la la]} la4

}

Vbcn = \relative do {

la'8 do fa la,
sold si mi sol,
fad la re fa,

%4
mi re do sold
la la'16. sol32 fa8 fad
mi sol do mi,\mbreak

%7
red fad si re,
dod mi la do,
si mi16. fad32 sol8 mi

%10
la do si si,
mi4 r 
r8 la4 sol8~

%13
sol fa mi4\mbreak
re do
si la

%16
sol do8 do'
fa, la sol sol,
\tuplet3/2{do'16 do do do[do do] do do do do[do do]

%19
si si si si[si si] si si si si[si si]\mbreak
la la la la[la la] la la la la[la la]}
sol8 sol,4 sol'8

%22
\tuplet3/2{sol16 sol sol sol[sol sol] fa fa fa fa[fa fa]
fa fa fa fa[fa fa] mi mi mi mi[mi mi]
mi mi mi mi[mi mi] re re re re[re re]

%25
re re re re[re re] do do do do[do do]
si si si la[la la] sold sold sold sold[sold sold]
la la la la'[la la] sol sol sol sol[sol sol]

%28
fa fa fa fa[fa fa] fad fad fad fad[fad fad]
mi_\markup\italic"Tasto S[olo]" mi mi mi[mi mi] mi mi mi mi[mi mi]\mbreak
mi mi mi mi[mi mi] mi mi mi mi[mi mi]

%31
mi\p mi mi mi[mi mi] mi mi mi mi[mi mi]
mi mi mi mi[mi mi] mi mi mi mi[mi mi]}\mbreak
mi8\f mi'~mi re~

%34
re do si la
sold fad mi sold
la fa! re mi

%37
\tuplet3/2{la,16 la la la'[la la] mi mi mi do[do do]
la la la la[la la]} la4

}

Vbfn = \figuremode {

	\bassFigureExtendersOn
	\bassFigureStaffAlignmentUp

s4 s8 <6>16 <6>
<7>16 <6> s8 s <6>
<7>16 <6> <6>8 s <6>

%4
<76 _+>8 <_+> <6>4
s <7>16 s <7> <6\\>
<_!>4 s8 <6>

%7
<7>16 <6> <6>8 s <6>
<7>16 <6> <6>8 s <6>
<7 _+> <3!> <6>4

%10
s8 <5>16 <6>32 s <6 4>8 <5+ 3+> 
s2
s8 <3!> <4\+ 2> <6 3>

%13
<4\+ 2> <6> <7> <6!>
<7>8 <6> <7> <6>
<7> <6> <7> <6>

%16
<7>4 <3>
<6>8 <3> <6 4> <5 3>
s2

%19
<6>
\tuplet 3/2{<3 5>16 <5> <5> s s s <5> s s <6\\> s s}
s2

%22
<4 2>4 <6 3>
<4 2> <6 3>
<4 2> <6 3>

%25
<4\+ 2>8 s <6 3> s
<4- 2> s <6 3>16 <3> <5>8
<10 9> <8> <4\+ 3-> s

%28
<6 3> s <6\\ 5!> s
<_+>2
s2*3

%33
<_+>8 s <4 2->8 <6 3+>
<4\+ 2> <6> <6\\> <3!>
<5! 3> <5! 3>

%36
<7 _+> <6>16 <5>
<3! 9>16 <8> s8 <6> <_+>
<3!>


}

forma = {

\time 2/4
\key la\minor
\tempo 4 = 65
s2*38
\bar":..:"

}


VvlI = {
	\Vglobal
	%\notypeset
	<<\VvlIn \forma>>
}

VvlII = {
	\Vglobal
	<<\VvlIIn \forma>>
}


Vbc = {
	\Vglobal
	\clef bass
	<<\Vbcn \Vbfn \forma>>
	\typeset
}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

	systems-per-page = #5
   	print-first-page-number = ##t
	first-page-number = #2

		}

\markup \huge {"[1.] Il Studioso melanchonico - Allegro assai"}

	\score { 
		{ <<

			\new ChoirStaff <<

				\new Staff << 
					\set Staff.instrumentName = \markup\center-column {"Violino I"}
					\set Staff.midiInstrument = #"violin"
					\IvlI 
							>>

					\new Staff << 
					\set Staff.instrumentName = \markup\center-column {"Violino II"}
					\set Staff.midiInstrument = #"violin"
					\IvlII 
								>>

				\new Staff \with {fontSize = #+1
    				\override StaffSymbol.staff-space = #(magstep +1)}<< 
					\set Staff.instrumentName = \markup\center-column{"Basso ò""Cembalo"}
					\set Staff.midiInstrument = #"cello"
					\Ibc
							>> >>
			
		>> }
	
\layout {	  
	
	indent = 1.5\cm 
	
	\context	{ 
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #2
    	\override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
			} }	
}

\pageBreak

\markup \huge {"[2.] Menuet"}

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

				\new Staff \with {fontSize = #+1
    				\override StaffSymbol.staff-space = #(magstep +1)}<< 
					\set Staff.midiInstrument = #"cello"
					\IIbc
							>> >>
			
		>> }
	
\layout {	  
	
	indent = 0.5\cm 
	
	\context	{ 
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #2
    	\override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
			} }	
}

%\pageBreak

\markup \huge {"[3.] La Tempesta di Mare - Tempo di bon gusto"}

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

				\new Staff \with {fontSize = #+1
    				\override StaffSymbol.staff-space = #(magstep +1)}<< 
					\set Staff.midiInstrument = #"cello"
					\IIIbc
							>> >>
			
		>> }
	
\layout {	  
	
	indent = 0.5\cm 
	
	\context	{ 
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #2
    	\override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
			} }	
}

\pageBreak

\markup \huge {"[4.] Menuet"}

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

				\new Staff \with {fontSize = #+1
    				\override StaffSymbol.staff-space = #(magstep +1)}<< 
					\set Staff.midiInstrument = #"cello"
					\IVbc
							>> >>
			
		>> }
	
\layout {	  
	
	indent = 0.5\cm 
	
	\context	{ 
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #2
    	\override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine.hair-thickness = #1.2
		\override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)  %aumenta lo spazio orizzontale
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

\markup \huge {"[5.] Il Molino - Tempo passato"}

	\score { 
		{ <<

			\new ChoirStaff <<

				\new Staff << 
					\set Staff.midiInstrument = #"violin"
					\VvlI 
							>>

					\new Staff <<
					\set Staff.midiInstrument = #"violin"
					\VvlII 
								>>

				\new Staff \with {fontSize = #+1
    				\override StaffSymbol.staff-space = #(magstep +1)}<< 
					\set Staff.midiInstrument = #"cello"
					\Vbc
							>> >>
			
		>> }
	
\layout {	  
	
	indent = 0.5\cm 
	
	\context	{ 
		\Score
		\override StaffGrouper.staff-staff-spacing.padding = #2
    	\override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
			} }	
}




