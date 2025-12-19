\language "italiano"
	%********************************** VARIABILI
	
acc = \once \override Stem #'stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

pipeSymbol = \bar "||"

tasto = _\markup\italic"Tasto"

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

tu = _\markup \italic "Tutti"

pad = \once \override TextScript #'padding = #3

padall = \override TextScript #'padding = #1.2 

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber #'transparent = ##t

terzinecon = \override TupletNumber #'transparent = ##f

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

Iglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##t
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \terzinecon
			}

IdsIn = \relative do'' {

fad2\fermata_\markup\italic"Gravement" r
fad4 r sol2
fad4. fad8 fad8 mi mi[mi]

%4
mi re16 dod re8 fad fad4(mi^x)
fad1_\markup\italic"[Vite]"
r16 si, re fad re [si re si] sol' mi sol si sol [mi sol mi]

%7
la8 la, la' la la si, sol' sol\mbreak
sol la, sol' sol fad fad, fad' fad
mi2^x r16 la, dod mi dod [la dod la]

%10
fad'8 la4 la8 la sol16 fad mi8.^x [re16]
re4_\markup\italic"Gravement" r red fad~
fad8 mi16 red mi [red do si] do8 do do do

%13
si si si si mi,4 mi'
red16_\markup\italic"Vite" si red fad red [si red si] fad'2~\mbreak
fad8 si, mi4 r16 re fad la fad [re fad re]

%16
re'4. re8 do si la8. [sol16]
sol4 r8 sol fad fad, r fad'
mi2 r16 mi sol si sol [mi sol mi]

%19
si'8 si, si'[si] si la16 sol la8 [la]
la2 r16 si, red fad red[si red si]\mbreak
sol'8 si4 si8 fad8.[fad16 fad8.^x mi16]

%22
mi4_\markup\italic"[Gravement]" r sol r
fad r si r
la dod2 si4~

%25
si la sold2
fad_\markup\italic"[Vite]" r16 fad, lad dod lad [fad lad fad] 
re'[si red fad] red si red si fad'8 fad, fad' fad

%28
fad si, mi[dod] fad2~\mbreak
fad r16 fad lad dod lad[fad lad fad] 
si si, re fad re[si re si] sol'8 si mi,4~
mi re dod2^x

%32
si dod
re dod4. si8
dod1\fermata

%35
R2.*8
fad8 mi re dod si4
sol'2 fad4

%45
mi8 re mi sol fad mi
re2^x si4
fad'8 sol fad mi re dod

%48
re mi re dod si la
sold2 la4
si2 dod4

%51
re re, re'
dod2.
r4 dod8 si la sold

%54
fad4 sold la
re sold,2_x
fad2.

%57
lad2 si4\mbreak
dod2 re4
dod dod2

%60
re2.
re'~
re4 dod si

%63
si lad2
si2.
R2.*2

%67
la8 sol fad mi re4
si'2 la4
sol8 fad sol si la sol

%70
fad2^x re4
fad8 mi re dod si4\mbreak
sol'2 fad4

%73
mi8 re mi sol fad mi
red2 si4
r mi mi

%76
mi2.~
mi4 red2
mi2 sol4

%79
fad2 sol4
la2 si4
do do, do'

%82
si2.
R2.*4
si8 la sol fad mi4

%88
do'2 si4
la8 sol la do si la
sold2 mi4

%91
r la la
la2.~
la4 sold2

%94
la dod,4
fad fad, fad'
mid2 fad4~

%97
fad mid2
fad2.\mbreak
dod8 si lad sol fad4

%100
re'2 dod4
si8 lad si re dod si
lad2 fad4

%103
r fad si~
si lad si
dod dod2^x

%106
si2.
R
si'8 la sol fad mi4

%109
dod'2 r4
la8 sol fad mi re4
re'2 r4\mbreak

%112
re,8 dod si la sol4
sol'8 fad mi re dod si
lad sold fad mi re dod

%115
si4 si' la
sol4 sol2_x
fad2.

%118
r4 fad' fad
lad,2 si4~
si lad2

%121
si2.
r4 si'2
lad8 sol fad  mi re dod

%124
si2.~\mbreak
si2 dod8 fad,
fad2 fad4

%127
fad2.\fermata
r2 re' sol
si, do re

%130
mi,1 r2
R1.
r2 si'' re

%133
fad, sol la
si,1 r2
R1.

%136
r2 la'1
si2 la2. \once\override NoteHead #'duration-log = 1 sol8 s
fad2 fad si\mbreak

%139
red, mi fad
sol,1 r2
R1.

%142
r2 fad' si,
sol'1.~
sol2 fad mi

%145
red1.
R
r2 mi la,

%148
fa'1.~
fa?2 mi re
dod1.\mbreak

%151
R
r2 fad si,
sol'1.~

%154
sol2 fad mi
red1 fad2~
fad mi re

%157
dod1.
fad,1 fad' mi
fad1.

}


IdsIIn = \relative do'' {

re2\fermata r
dod4 r mi4. re16 dod
re4. re8 si4. si8

%4
si4. dod8 re4 dod
dod2 r16 fad,[lad dod] lad fad lad fad
re'8 fad fad fad fad mi mi mi

%7
mi16 la, dod la re4~re16 si re si mi4~\mbreak
mi4 r16 dod mi dod re8 re, re' re 
dod16 la dod mi dod[la dod la] mi'2~

%10
mi8 la, re2 dod8.^x re16
re4 r si do
si4. si8 si la la la

%13
la sol16 fad sol8 si si4 la
si2 r16 si red fad red[si red si]\mbreak
sol'4~sol16 sol, si sol la4. la'8

%16
la sol sol sol sol4 fad8. sol16
sol4 r8 re re re, r re'
re do r do si2

%19
r16 si[re fad] re si re si mi8 mi, mi' mi
red16[si red fad] red si red si fad'2~\mbreak
fad8 mi16 red mi8[mi] mi4 red8. mi16

%22
mi4 r lad, r
si r re r
dod4. dod8 fad4. sold8

%25
mid4 fad2 mid4
fad2 r
r r16 si,[red fad] red si red si

%28
sol'4. sol8 dod,[dod] dod dod
re16 [si re fad] re si re si mi8 mi, mi' mi
re re, re' fad si,4 dod8 mi

%31
lad,4 si2 lad4
si2 fad'~
fad mi

%34
fad1\fermata
R2.*4
dod8 si lad sold fad4

%40
re'2 dod4
si8 lad si re dod si\mbreak
lad2 fad4 

%43
si fad' fad
lad,2 si4
si lad2

%46
si2.
re8 mi re dod si lad
si dod si la sold fad

%49
mid2 fad4
sold2 la4
sold sold2

%52
la8 si dod si la sold
fad4 fad' fad
fad(mid) fad

%55
fad mid2
fad2.
dod2 re4\mbreak

%58
mi2 fad4
sol sol, sol'
fad fad, r

%61
fad'8 mi re dod si4
sol'2 fad4
mi8 re mi sol fad mi

%64
re2 si4
R2.
mi8 re dod si la4

%67
la la' la
re,2 re4
re dod2

%70
re2.
R2.*4
si'8 la sol fad mi4

%76
do'2 si4
la8 sol la do si la
sol2 mi4

%79
red2 mi4
fad2 sol4
fad fad2

%82
sol2.
fad8 mi red dod si4
sol'8 fad sol la fad sol

%85
mi red mi sol fad mi\mbreak
red2 si4
mi mi, mi'

%88
red2 mi4
mi red2
mi2.

%91
R2.*4
dod8 si la sol fad4
re'2 dod4

%97
si8 la si re dod si
lad2 fad4 
R2.*4

%103
fad'8 mi re dod si4
sol'2 fad4
mi8 re mi sol fad mi

%106
re2 si4
fad'8 mi re dod si4
sol'2 r4

%109
R2.*2
la,8 sol fad mi re4\mbreak
si'2.

%113
si'8 la sol fad mi sol
fad2.~
fad4 fad fad

%116
fad mi2^x
fad2.
dod2 re4

%119
mi2 fad4
sol sol, sol'
fad2 r4

%122
si8 la sol fad mi re
dod2.
re~\mbreak

%125
re8 re mi fad lad, si
si4(lad4.) si8
si2.\fermata

%128
R1.*2
r2 mi1~
mi2 re do

%132
si1 r2
R1.
r2 re'1~

%135
re2 la sol
fad fad2. \override NoteHead #'duration-log = 1 sol16[s fad] s
mi2 mi2. re8 s \revert NoteHead #'duration-log 

%138
re1 r2\mbreak
R1.
r2 sol1~

%141
sol2 fad mi
red1 fad2~
fad4 mi8 red mi2 si~

%144
si la sol
fad1.
r2 si mi,

%147
do'1.~
do2 si la
sold1.

%150
r2 mi' la,\mbreak
fad1.
r2 fad'1~

%153
fad2 mi re
dod1.
r2 fad si,

%156
sol'1.~
sol2 fad mi
re1 la' si

%159
lad1.

}


IdsIIIn = \relative do'' {

si2\fermata r
lad4 r dod2~
dod8 si16 lad si8[si16 fad] sol8 sol sol sol

%4
fad2 si
lad16[fad lad dod] lad fad lad fad dod'2~
dod8 fad, si4. si8 si[si]

%7 
la4~la16[la do la] si4~ si16 si re si\mbreak
dod8 mi4 mi8 la,4. la8
la la, la' la la2

%10
r16 re,[fad la] fad re fad re si'4 la8. la16
fad4 r fad la8 sol16 fad
sol4. sol8 mi4.  mi8

%13
mi4. fad8 sol4 fad
fad2 r\mbreak
r16 mi[sol si] sol mi sol mi do'8 do do do

%16
si16[sol si re] si sol si sol mi'4 re8. re16
si4 r8 si la4 r8 la
la la, r la' la sol sol sol

%19
fad4. fad8 mi mi mi mi
fad2 r\mbreak
r16 mi[sol si] sol mi sol mi do'4 si8 la

%22
sol mi r4 mi' r
re r sold, r
la2~la8 [la re8. re16]

%25
sold,4 dod2 si4
lad16[fad lad dod] lad fad lad fad dod'2~
dod8 fad, si[si] si2~

%28
si16[mi, sol si] sol mi sol mi lad[fad lad dod] lad fad lad fad\mbreak
si8 si, si' si lad dod4 dod8
fad,4. fad8 fad mi sol8. sol16

%31
dod,4 fad2 mi4
re2 la'
si1

%34
lad\fermata
fad8 mi re dod si4
sol'2 fad4

%37
mi8 re mi sol fad mi
re2_x si4
fad'2 r4

%40
si si, dod
re2 mi4\mbreak
fad2 r4

%43
re2 r4
mi2 re4
dod fad2

%46
si,2.
si'2 r4
si,2 r4

%49
dod4 dod' dod
mid,2 fad4~
fad mid2

%52
fad2.
dod'8 si la sold fad4
re'2 dod4

%55
si8 lad si re dod si
lad2 fad4
r fad'4 fad

%58
lad,2 si4
si lad2
si2.

%61
r4 si2~
si4 lad si
dod dod2

%64
si2.
fad'8 mi re dod si4
sol'2.

%67
fad8 mi re dod re4~
re sol, la
si mi,2

%70
re2.
R2.*4
sol8 fad mi re do si

%76
la4 la' sol
fad si si,
mi2.

%79
r4 si' si
red,2 mi4
mi red2

%82
mi4 mi'2
red8 dod si la sol fad
mi4 si' si

%85
si la la\mbreak
la8 do si la sol fad
sol4 sol, sol'

%88
fad2 sol4
la fad2
mi2.

%91
mi'8 re dod si la4
fad'2 mi4
re8 dod re fad mi re

%94
dod2 la4
r dod dod
sold2 la4

%97
re sold,2
fad2.\mbreak
r4 fad' fad

%100
fad2.~
fad4 mi mi
mi8 sol fad mi re dod

%103
re2.~
re4 dod si
si lad2

%106
si2.
R2.*2
mi8 re dod si la4

%110
fad'2 r4
R2.*3
dod8 si lad sold fad4

%115
re'2 dod4
si8 lad si re dod si
lad2 fad4

%118
lad2 si4
dod2 re4
dod dod2^x

%121
re4. re8 mi fad
sol fad mi re dod si
fad'2.~

%124
fad\mbreak
si8 la sol fad mi re
re4(dod4.) si8

%127
si2.\fermata
R1.
\clef violin \key re\major R1.

%130
r2 sol2 do
fad, sol la
re,1 r2

%133
R1.
r2 re' sol
dod,! re mi

%136
la, re1~
re2 dod2.^x \override NoteHead #'duration-log = 1 re8 s
re1 r2\mbreak

%139
\clef soprano \key re\major R1.
r2 si mi
la, la8[s si] s dod2 \revert NoteHead #'duration-log 

%142
fad,1 r2
r si2. mi,4
do'1.~

%145
do2 si la
sold1.
r2 r mi'~

%148
mi re dod
si1.
R\mbreak

%151
r2 dod fad,
re'1.~
re2 dod si

%154
lad1.
r2 si1~
si2 do si

%157
lad1.
si1 dod dod
dod1.

}

Ibcn = \relative do {

si2\fermata r
fad8 fad' fad fad lad, lad lad lad
si4. si8 mi mi sol sol

%4
si4 si,8 la sol2
fad8 fad' fad fad lad, fad' fad fad
si, si' si si mi, mi' mi mi

%7
fad, fad, fad fad sol sol' sol sol\mbreak
la,16 la' dod mi dod [la dod la] re re, fad la fad[re fad re]
la8 la' la la dod, la' la la

%10
re, re' re[re] sol,4 la8 la,
re4 r si' red,
mi4. mi8 la la do do

%13
mi,4. re8 do2 
si8 si' si si red, si' si si\mbreak
mi, mi' mi mi fad, re' re re

%16
sol, sol sol sol do,4 re
sol,16[sol' si re] si sol si sol re'[re, fad la] fad re fad re
la'[la, do mi] do la do la mi'8 mi mi mi

%19
re re re re do do do do
si si' si si red, si' si si\mbreak
mi, mi mi mi la,4 si

%22
mi r dod r
re r mid, r
fad fad'8 la re,4. si8

%25
dod4 fad, dod2
fad8 fad' fad fad lad, fad' fad fad
si, si' si si red, si' si si

%28
mi, mi mi mi mi, mi' mi mi\mbreak
re re, re' re dod dod dod dod
si si' si si mi16[mi, sol si] sol mi sol mi

%31
fad4 si, fad2
si la
sol1

%34
fad\fermata
R2.*14
dod''8 si la sold fad4

%50
re'2 dod4
si8 la si re dod si
la4. sold8 fad4

%53
la2 r4
si2 la4
sold dod dod,

%56
fad,2.
fad'8 mi re dod si4
sol'2 fad4

%59
mi8 re mi sol fad mi
re4. dod8 si4
si'8 dod si la sol fad

%62
mi2 re4
dod fad fad,
si2.

%65
si'8 lad si dod re si
dod si la si dod la
re4 re,8 mi fad re

%68
sol2 fad4
mi la la,
re2.

%71
re'8 dod si la sol fad\mbreak
mi4 mi' re
dod fad fad,

%74
si2.
R2.*4
si8 la sol fad mi4

%80
do'2 si4
la8 sol la do si la
sol fad mi fad sol la

%83
si2 r4
r mi, re
dod fad fad,\mbreak

%86
si2.~
si8 do si la sol si
la4 la' sol

%89
fad si si,
mi,2 mi''8 re
dod si la sol fad mi

%92
re4 re' dod
si mi mi,
la,2.~

%95
la4 la' la,
si si' la
sold dod dod,

%98
fad,2.\mbreak
R
r4 si' la

%101
sold dod dod,
fad2 fad,4
si si'8 la sol fad

%104
mi2 re4
dod fad fad,
si2.

%107
r4 si'8 la sol fad
mi si' mi re dod si
la si la sol fad mi

%110
re la' re dod si re
fad, la re la fad re\mbreak
sol sol, sol' fad sol fad

%113
mi re mi fad sol mi
fad4 fad, r
R2.*3

%118
fad'8 mi re dod si4
sol'2 fad4
mi8 re mi sol fad mi

%121
re dod si la sol fad
mi4 mi'8 fad sol mi
fad4 lad fad

%124
si8 la sol fad mi re\mbreak
sol fad mi re dod si
fad'4 fad,2

%127
si2.\fermata
sol1.
sol'2 la si

%130
do, do' la
re1 fad,2
sol1 sol,2

%133
re' mi fad
sol1 mi2
la1 dod,2 

%136
re1 fad,2
sol la1
re,2 re' sol\mbreak

%139
fad mi red
mi1.
R

%142
si'1 red,2
mi1.
la,

%145
si
mi
la,

%148
re,
mi
la\mbreak

%151
lad
si
mi,

%154
fad
si1 red,2
mi1.

%157
fad
si1 la sol
fad1.

}

Ibfn = \figuremode {

	\bassFigureExtendersOn
	\bassFigureStaffAlignmentUp

s1
<_+>2 <7->
<9>4 <8> <9>8 <8> <6>4
<4> <3>8 <3> <7>4 <6>
<_+>2 <6+>
<9>8 <8> s4 <9>8 <8> s4
<7>8 <6> s4 <9> <8 6>

<7>8 <7> s2.
s2 <6>
<9>8 <8> s4 <7>8 <6> s4
s2 <_+>4 <7->
<9> <8> <9 _->8 <8> <6>4
<4> <3> <7> <6>
<_+>2 <6>8 <_+> s4 

<9>2 <6 5/>4 <6>
<9>8 <8> s4 <6 5>2
<_>8 <_> <_> s
s2
<4>8 <6> s4 <4>8 <3> s4
<6>2 <7>8 <6> s4
<_+>2 <6>8 <_+> s4

<9>8 <8> s4 <6 5 _->4 <_+>
s2 <6+ 5/>
s <7->
<3> <7>4 <6>
<7 _+>2 <4+>
<_+> <6>
<9 _->8 <8 _+> s4 <6>8 <_+> s4
<9>8 <8> s4 <4>8 <_+> s4

<6>4 s <6+>2
s <9>8 <6> <6> <6>
<7 _+>2 <4+>
s <6>
<7> <6>
<_+>1
s2.*14

<_+>4 <_+> s
<2+>2 <6 4>8 s
<6 5>4 <4+ _->2
<6>4 <6> s
<6>2 s4
<7>4 <6+>8 s <6>4
<7>8 s <7 _+>4 s
<_+>2 s4
<_+>2 s4

<2+>2 <6 4>8 s
<6+ 5>4 <4+ _->2
<6>4 <6> s
s2.
<7>4 <6 4+>8 s <6>4
<7> <_+>2
s2.
<_>4 <_> <_>
<5/> <5/> <5/>
s2.
s2 <6>4 
<7>8 s <7>2
s2.
<_>4 <_> <5>

<4+ _->4 s <6>
<7>8 s <7 _+>4 s
<_+>2.
s2.*4
<_+>4 <_+> s
<2+>2 <6 4>8 s
<6 5>4 <_- 4+>2
<6>4 <6> <6>

<_+>2 s4
s2 <6>4
<7>8 s <_- 7>4 s

<7 _+>2.
<6 4>2 s4
<4+ _->2 <6>4
<7>8 s <7 _+>4 s
<_+>2.
<6>4 <6> <6>
s2 <6>4
<7>8 s <7 _+>2
s2.
<6>2 s4
<4+ _ _->4 <_> <6>
s <7 _+> s
<_+>2.

s
s2 <6>4 
<7>8 s <7>4 <7>8 s
<7 _+>2 s4
<_>4 <_> <_>
<7> <6 4+ _->8 s <6>4
<7>8 s <7 _+>2
s2.
s4 <_>4 <_>
<7>4 <7> s
<7> <7> s
s2.
<6>4 <6> s

s2.
<7>4 <6 5> <5>
<_+>2.
s2.*3
<_+>4 <_+> s
<2+>2 <6 4>8 s
<6 5>4 <4+>4 <4+>
<6>2.
<7>4 <6 5>2
<_+>4 <_+> <_+>
<_>4 <_> <_>8 s

<_>4 <_> <6+>
<4> <_+>2
s2.
s1.
<_>2 <_> <6>
s1.
<9 7>2 <8 6 4> <5/>
s1.
<_>2 <_> <5/>
s1.
<9 _+ 4>2 <8 6> <5/>
<9> <8> <6>4 s
<6 5>2 <_+>1
s1.

<6+>1 <5/>2
s1.*2
<_+>1 <5/>2
<9>2 <8> s
<9 7 _-> <8 6> <7 5>
<9 _+> <8> <7>
<_+>1.
<_->1 s2
<9 7 _->2 <8 6> <7 5>
<9 _+> <8> <7>
<_+>1.

<5/>
<9>2 <8>1
<9 7>2 <8 6> <7 5>
<9 _+> <8 6-> <7>
<_+>1 <5/>2
<9> <8 6-> <7>
<9 _+> <8> <7>
s1 <6>2 s <6>1
<_+>1.


}
					
				

forma = {

%\override Staff.TimeSignature #'style = #'single-digit
\time 4/4
\key re\major
\tempo 4 = 55
s1*4
\time 2/2
\tempo 2 = 50
s1*6
\time 4/4
\tempo 4 = 55
s1*3
\time 2/2
\tempo 2 = 50
s1*8
\time 4/4
\tempo 4 = 55
s1*4
\time 2/2
\tempo 2 = 50
s1*9
\once\override Staff.TimeSignature #'style = #'single-digit
\time 3/4
\tempo 2 = 70
s2.*93
\time 3/2
\tempo 2 = 90
s1.*30
\set Score.measureLength = #(ly:make-moment 3 1)
s1 s s
\set Score.measureLength = #(ly:make-moment 3 2)
s1.
\bar "|."

}


IdsI = {
	\Iglobal
	\notypeset
	<<\IdsIn \forma>>
}


IdsII = {
	\Iglobal
	<<\IdsIIn \forma>>
}


IdsIII = {
	\Iglobal
	\clef soprano 
	<<\IdsIIIn \forma>>
}


Ibc = {
	\Iglobal
	\clef bass
	<<\Ibcn \forma \Ibfn>>
	\typeset
}

IIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##t
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \terzinecon
			}

IIdsIn = \relative do'' {

r2 si'
la sol
fad4 si2 lad4

%4
si8 fad4 sold8 la4 si
dod8 sold4 lad8 si fad4 sold8
la[la] la si16 la sold4 dod8 si16 dod

%7
lad8 lad si dod fad,8 fad16 mi re fad mi re
dod8 mi16 re dod  mi re dod si8 re16 dod si re dod si\mbreak
lad4 si sol' fad~

%10
fad r fad2
mi re
dod4 fad2 mi4

%13
re8 si r4 r2
R1\mbreak
r8 si'16 la sol si la sol fad8 la16 sol fad la sol fad

%16
mi8 sol16 fad mi sol fad mi red4 mi
do si4. mi,16 fad sol8[mi]
si si16 dod re8[si] fad'4. fad8

%19
si,4. si'8 la la, la' la
sol sol, sol' sol fad4~fad-+
mi8 mi'16 re dod mi re dod\mbreak si8 re16 dod si re dod si
lad8 fad'16 mi re fad mi re dod8 dod4 red8
mi si4 dod8 re la4 si8

%24
dod4. dod8 si si, si' si
la fad'16 mi re fad mi re dod8 la mi' fad
si,4 r8 mi re re, re' re\mbreak

%27
dod4 la'2 sold4~
sold fad2 mid4
fad8 dod4 red8 mi si4 dod8

%30
re la4 si8 dod4. dod8
si si, si' si la la, la' la
sold16 fad sol la sol fad mi sol\mbreak fad4. re'8

%33
dod16 si dod re dod re dod si lad8 fad' si re
sol, mi la16 sol la sol fad8 la, re fad
si, mi, mi'16 re mi re dod8 la' si, sol'

%36
la, [fad' mi8. re16] re4 r
R1\mbreak
r2 si'

%39
la sol
fad4 si2 lad4
si8 fad16 sol fad mi re fad mi fad sol fad mi re dod mi

%42
re mi fad sol re fad mi re dod re mi fad dod mi re dod\mbreak
si lad si dod si re dod si lad4 si8 dod16 re
mi4~mi16 sol fad mi re4 mi

%45
fad8 dod4 red8 mi si4 dod8
re re'16 dod si la sol fad sol la si la sol la sol fad
mi fad mi re dod re dod si lad4 r8 fad'~

%48
fad_\markup\italic"Grave." mi4 re8 dod4 dod^x
si1\fermata

}


IIdsIIn = \relative do'' {

R1
r8 dod4 red8 mi si4 dod8
re re re mi16 re dod4 fad8 mi16 fad

%4
re8 si16 dod re8 si fad'2
mi re
dod4 fad2 mid4

%7
fad8 sol16 fad mi8 re16 dod re8 re fad si
mi, dod mi  la re, si re sol\mbreak
dod, fad16 mi re fad mi re dod8 mi16 re dod mi re dod

%10
si8 re16 dod si re dod si
lad4 si~si lad si fad'8 fad
fad4. mi16 re dod8[dod dod8.^x si16]

%13
si8 si'16 la sol si la sol fad8 la16 sol fad la sol fad
mi8 sol16 fad mi sol fad mi red8 red16 mi fad8 mi16 red\mbreak
mi8 sol, si mi la, fad la re

%16
sol, mi sol do fad, si16 la sol si la sol
fad8 la16 sol fad la sol fad mi8 si'4 dod8
re re re mi16 re dod4 fad8 mi16 fad

%19
red4 mi2 red4
mi si2 la4
sol8 mi4 fad8\mbreak sol re4 mi8

%22
fad4 si~si8 la16 sold la8 si16 la
sold8 sold4 lad8 si fad16 mid fad la? sold fad
mid4 fad sold8 sold sold sold

%25
dod, re fad si mi, dod'16 si la dod si la
sold4 la2 sold4\mbreak
la r r2

%28
R1
r8 la dod[fad] si, sold si mi
la, fad la re sold, dod16 si la dod si la

%31
sold8 si16 la sold si la sold fad8 mi4 fad8
si, si'4 la dod si8~
si la sold4 fad8 re'16 mi re dod si re

%34
mi,8 dod'16 re dod si la dod re,8 fad16 sol fad mi re fad
sol8. la16  sol fad mi sol la, sol' fad la sol fad mi sol
fad8 re la' la, re la''16 si la sol fad la

%37
sol la si la sol fad mi sol fad sol la sol fad mi re fad\mbreak
mi fad mi re dod re mi dod fad8 fad, fad'4~
fad8 mi4 fad8 si, sol si mi

%40
la, fad fad' sol16 fad mi fad mi re dod re mi dod
re dod re mi re dod si re dod re mi re dod si lad dod
si8 re fad si mi, dod mi la\mbreak

%43
re, si re[sol] dod,4 fad,
sol fad2 sol4
la8 mi fad4 si,8 mi4 mi8

%46
fad fad'16 mi re dod si8~si4. si'16 la
sol la sol fad mi fad mi re dod4 r8 si
si'2. lad4

%49
si1\fermata

}


IIdsIIIn = \relative do'' {

R1*3
r2 r8 fad,16 mi re fad mi re 
dod8 mi16 re dod mi re dod si8 si16 dod re8 si

%6
fad' fad16 sold la8 fad dod'4 dod,
fad8 fad sold lad si fad4 sold8
la mi4 fad8 sol re4 mi8\mbreak

%9
fad4 fad'8 sol16 fad mi8 mi, mi' fad16 mi
re8 re, re' mi16 re dod4 re
sol, fad8 mi fad2~

%12
fad8 lad si2 lad4
si8 sol si mi la, fad la re
sol, mi si' do fad, fad16 sol la8 sol16 fad\mbreak

%15
sol8 si4 dod8 re la4 si8
do sol4 la8 si2
la sol

%18
fad4 si2 lad4
si8 fad sol la16 si do4 si~
si8 mi, mi'2 red4

%21
mi r\mbreak r2
r fad,
mi re

%2
dod4 fad2 mid4
fad r r2
R1\mbreak

%27
r8 la dod fad si, si, si' mi
la, la, la' re sold, la16 si dod re dod si
la8 fad16 sold la dod si la sold8 si16 la sold si la sold

%30
fad8 la16 sol fad la sol fad mid4 fad
re' dod dod,8 dod'4 si8~
si re4 mi8\mbreak la, la'16 sold fad la sold fad

%33
mid8 fad4 mid8 fad4 r
R1*2
r2 r8 fad16 sol fad mi red fad

%37
mi fad sol fad mi re dod mi re mi fad mi re dod si re\mbreak
dod re dod si lad si dod lad re mi re dod si8 re
dod8 dod4 si re la8~

%40
la4 re, sol fad
fad r r2
r8 fad4 sold8 la mi4 fad8\mbreak

%43
sol re4 mi8 fad fad'16 mi re fad mi re
dod re mi re dod mi re dod si2
la sol

%46
fad4 fad'4. mi16 red mi red mi fad
si,4 sol' fad r8 fad,
sol4 fad2 fad4

%49
fad1\fermata

}

IIbcn = \relative do {

R1*6
r2 si'
la sol

%9
fad4 si2 lad4
si4. si,8 fad' \clef alto \key si\minor fad'16 mi re fad mi re
dod8 mi16 re dod mi re dod si8 re16 dod si re dod si

%12
\clef bass \key si\minor lad8 fad re si fad'4 fad,
si8 si'4 dod8 re la4 si8
do sol4 la8 si2\mbreak

%15
mi re
do si4 mi~
mi red mi2

%18
R1
r8 si16 la sol si la sol fad8 la16 sol fad la sol fad
mi8 mi16 fad sol8 mi si'16 la si do si8 si,

%21
mi4 r\mbreak r2 
R1*2
r8 dod16 si la dod si la sold8 si16 la sold si la sold

%25
fad8 fad'4 sold8 la dod,4 re8
mi mi'16 re dod mi re dod si8 re16 dod si re dod si\mbreak
la4 r r2

%28
R1
fad2 mi
re dod4 fad~

%31
fad mid fad8 dod4 red8
mi si4 dod8\mbreak re la4 si8
dod fad, dod4 fad r

%34
R1*2
r2 r8 re' fad[si]
mi, mi, mi' la re, re, re' sol\mbreak

%38
dod,8 re16 mi fad8 mi16 fad re8 si16 dod re8 si
fad' dod4 red8 mi si4 dod8
re re re mi16 re dod4 fad8 mi16 fad

%41
re8 si re sol dod, dod, dod' fad
si,2 la\mbreak
sol fad4 si~

%44
si lad si8 si'16 la sol si la sol
fad sol la sol fad la sol fad mi8 mi16 fad sol8 mi
si'4. si,8 mi2~

%47
mi2. r8 red
mi4 si fad' fad,
si1\fermata

}

Ibfn = \figuremode {

	\bassFigureExtendersOn
	\bassFigureStaffAlignmentUp

s1*6
s2 <5>4 <6+>
<5> <6> <7> <6>
s4 <2>2 <5/>4

s2 <_+>8 <_+> <6>4
<7> <6+> <6+> <6+>
<6>8 <6+> s4 <4> <_+>
s8 <6>4 <5/>8 s <6 _->8 s <6>
s8 <6> s <6 5 _-> <_+>4 <7>

<5> <6+> <5> <6>
<7> <6> <_+>2
<2>4 <5/> s2
s1
s8 <_+> <6>4 <7> <6+>
<_>8 <_> <_>4 <4> <_+>

s1*3
s8 <_+> <6>4 <7> <6+>
s8 <6> s <6 5/> s <6> s <6 5>
<_+>4 <6> <7> <6>

s1*2
<5>4 <6+> <5 _+> <6>
<7> <6+> <_+> s 
<2> <5/> s8 <6>4 <5/>8
<_+> <6->4 <5/>8

s <6> s <6 5>
<_+>4 <4+> <_+> s
s1*2
s2. <6>8 <7 _+>
s4. <7>8 s4. <7>16 s

<7>4 <_+> s2
<_->8 <6>4 <5/>8 <_-> <6>4.
<5>4 <6> <7> <_+>
<6>4. <7>16 s <7>4 <6+>
<5> <6+> <5> <6>

<7>4 <6> <_+>2
<2>4 <5/> s <6>8 s
<6> <5> <7> <5+> s4 <6>
s2 <9>4 <8>
<6 5>2 <4+>4. <6>8
<9>8 <8> <4> <3> <4>4 <_+>

}
					
				

forma = {

%\override Staff.TimeSignature #'style = #'single-digit
\time 4/4
\key si\minor
\tempo 2 = 50
s1*47
\tempo 4 = 50
s1*2
\bar "|."

}


IIdsI = {
	\IIglobal
	%\notypeset
	<<\IIdsIn \forma>>
}


IIdsII = {
	\IIglobal
	<<\IIdsIIn \forma>>
}


IIdsIII = {
	\IIglobal
	\clef soprano 
	<<\IIdsIIIn \forma>>
}


IIbc = {
	\IIglobal
	\clef bass
	<<\IIbcn \forma \Ibfn>>
	\typeset
}
#(set-global-staff-size 16)

\version "2.16.2"

\pointAndClickOff

\paper  {

   	print-first-page-number = ##t
	first-page-number = #2

		}

\markup \huge "[1.] Gravement - Vite"

	\score { 
		{ <<

			\new ChoirStaff <<
 			
 				\new Staff << 
					\set Staff.instrumentName = \markup \center-column{"Ier""Dessus"}
					\set Staff.midiInstrument = #"flute"
					\IdsI 
							>>
			
				\new Staff << 
					\set Staff.instrumentName = \markup  \center-column{"IId""Dessus"}
					\set Staff.midiInstrument = #"flute" 
					
					\IdsII 
							>> 
							
				\new Staff <<
					\set Staff.instrumentName = \markup  \center-column{"IIIe""Dessus"}
					\set Staff.midiInstrument = #"violin"
					
					\IdsIII 
							>>  
							
				\new Staff \with {fontSize = #+1
    				\override StaffSymbol #'staff-space = #(magstep +1)}<<
					\set Staff.instrumentName = \markup  \center-column{"[Basse]"}
					\set Staff.midiInstrument = #"cello"
					
					\Ibc 
							>> >>		
		>> }
	
\layout {
	indent = 1.2\cm
	\context	{ 
		%\RemoveEmptyStaffContext
				}
	
	\context	{ 
		\Score
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner 
#'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
		skipBars = ##t
				}

		}

\midi { }

}

\pageBreak

\markup \huge "[2. Vite]"

	\score { 
		{ <<

			\new ChoirStaff <<
 			
 				\new Staff << 
					\set Staff.midiInstrument = #"flute"
					\IIdsI 
							>>
			
				\new Staff <<
					\set Staff.midiInstrument = #"flute" 
					
					\IIdsII 
							>> 
							
				\new Staff <<
					\set Staff.midiInstrument = #"violin"
					
					\IIdsIII 
							>>  
							
				\new Staff \with {fontSize = #+1
    				\override StaffSymbol #'staff-space = #(magstep +1)}<<
					
					\set Staff.midiInstrument = #"cello"
					
					\IIbc 
							>> >>		
		>> }
	
\layout {
	indent = 0.8\cm
	\context	{ 
		%\RemoveEmptyStaffContext
				}
	
	\context	{ 
		\Score
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner 
#'base-shortest-duration = #(ly:make-moment 1 20)  %aumenta lo spazio orizzontale
		skipBars = ##t
				}

		}

\midi { }

}

