\language "italiano"
	%********************************** VARIABILI

acc = \once \override Stem #'stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

pipeSymbol = \bar "||"

tasto = ^\markup\italic"tasto solo"

tr = \trill

unis = _\markup\italic"unis."

ten = ^\markup \italic "ten"

pia = _\markup \italic "pia."

forte = _\markup \italic "forte"

piano = _\markup \italic "piano"

arco = _\markup \italic "Con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "Pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript #'padding = #2.5

padall = \override TextScript #'padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

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



mbreak = { }

IvlIn = \relative do'' {

mi8
si'(sold mi si) sold(si4 mi8)
si'(sold mi si) sold(si4 mi8)
si' sold(mi sold) la4 sold\tr

%4
fad r8 mi mi' mi mi red
red4(dod8) dod dod dod dod si
si4(la8) la\mbreak la la la sold

%7
fad si, fad' fad sol sol sold sold
la la lad lad si2~
si~si4 la

%10
sold8 red mi la sold4 fad\tr
mi fad8 fad sol sol sold sold\mbreak
la la lad lad si2~

%13
si~si4 la
sold8 red mi la sold4 fad
mi r16 sold(si mi dod si la sold fad sold la si)

%16
sold(fad mi mi' si sold la fad) sold(fad mi mi' si sold la fad)
sold(fad mi sold si red mi sold,)\mbreak fad(mi fad8) r16 sold(si mi
dod si la sold fad sold la si) sold(fad mi mi' si sold la fad)

%19
sold(fad mi mi' si sold la fad) sold(fad mi sold si red mi sold,)
fad8 si, r si' la16(sold) la8 sold16(fad) sold8
fad16(mi) fad4 si8 la16(sold) la8 sold16(fad) sold8\mbreak

%22
fad16(si, red si) fad'(si, red si) la'(si, red si) la'(si, red si)
sold'(si, mi si) sold'(si, mi si) la'(si, red si) la'(si, red si)
sold'(si, mi si) sold'(si, mi si) lad'(dod, mi dod) lad'(dod, mi dod)

%25
si'(la la sold sold fad fad mi) mi(red red dod dod si si si')
\tuplet3/2{lad(sold fad} si[si,)] dod8.\tr(si16)\mbreak \tuplet3/2{lad'(sold fad} si)[si,] dod8.\tr(si16)
si'8\tu(fad red si) \slurDashed fad (si4 fad'8) \slurSolid

%28
si(fad red si) fad(si4 fad'8)
lad(fad dod lad) fad(lad4 dod8)
lad'(fad dod lad) fad(lad4 dod8)

%31
red\upl si'\upl fad\upl red\upl mi mi mi mi
mi4(red8) si'\mbreak mi, mi mi mi
mi4(red16) si(red fad si4)~si16 si,(red fad

%34
si4)~si16 si,(red fad si8) red, dod8.\tr si16
\tuplet3/2{si(red fad} si4.) \tuplet3/2{si,16(red fad} la4.)
\tuplet3/2{si,16(mi fad} sold4.) fad16( si, red si) fad'(si, si' si,)

%37
\tuplet3/2{si(red fad} si4.) \tuplet3/2{si,16(red fad} la4.)
\tuplet3/2{si,16(mi fad} sold4.)\mbreak sold4\tr(fad)
sold,16(sid red fad) sold(fad mi red) mi(sold dod8~dod16 si la sold)

%40
la(sold dod8~dod16 si la sold) la(sold red'8~red16 dod si lad)
si(lad mi'8~mi16 red dod sid) dod(sid fad'8~fad16 mi red dod)
red(dod sold'8~sold16 fad mi red)\mbreak \tuplet3/2{mi(sold fad mi[fad sold)]} dod,(mi sold mi)

%43
\tuplet3/2{red(fad mi red[mi fad)]} si,(red fad red)\tuplet3/2{dod(mi red dod[red mi)]} la,(dod mi dod)
\tuplet3/2{si(red dod si[dod red)]} sold,(si red si)\tuplet3/2{la(dod si la[si dod)]} fad,(la dod la)
\tuplet3/2{sold(si la sold[la si)]} mi,(sold si sold)\tuplet3/2{fad(la sold fad[sold la)]} sid,(fad' la fad)\mbreak

%46
\tuplet3/2{mi(dod red mi[red dod)] dod'(dod, red mi[red dod)] dod'(dod, red mi[red dod)]} dod'(sold mi dod)
sold(dod mi sold) dod(sold mi dod) sold(dod fad red) red8.\tr dod16
dod8(sold' mi dod) sold(dod4 mi8)

%49
dod'(sold mi dod) sold(dod4 mi8)
si'(fad red si) fad(si4 red8)\mbreak
si'(fad red si) fad(si4 red8)

%52
si'(sold mi si) sold(si4 mi8)
si' sold (mi sold) sold4\tr fad
mi16(sold si mi si la sold fad) mi(sold si mi si la sold fad)

%55
mi(sold si re mi re dod si) dod(si la sold la4)\mbreak
fad16(lad dod fad dod si lad sold) fad(lad dod fad dod si lad sold)
fad(lad dod mi fad mi red dod) red(dod si lad si4)

%58
sold16(sid red sold red dod sid lad) sold(sid red sold red dod sid lad)
sold(sid red fad sold fad mi red) mi(red dod sid dod4)
si,16(mi sold la si sold fad mi)\mbreak si(red fad sold la fad mi red)

%61
si(mi sold la si sold fad mi) si(red fad sold la fad mi red)
si(mi sold la si8) sold sold4\tr fad
\terzinesenza \tuplet3/2{sold16(si la sold[la si)]} si,(dod red mi)\tuplet3/2{dod(la' sold fad[sold la)]} la,(si dod red)

%64
\tuplet3/2{si(sold' fad mi[fad sold)]} sold,(la si dod)\mbreak \tuplet3/2{la(fad' mi red[mi fad)]} fad,(sold la si)
\tuplet3/2{sold(mi fad sold[fad mi)] si' si(dod red[dod si)] mi mi(fad sold[fad mi)] si' si(dod red[dod si)]}
mi8 mi, r8 fad \tuplet3/2{sol16(fad sol) sol[(fad sol)] sold(fad sold) sold[(fad sold)]

%67
la(sold la) la[(sold la)] lad(sold lad) lad[(sold lad)]} si(fad red dod) si(red fad si)\mbreak
\tuplet3/2{do, si do do[si do] dod si dod dod[si dod] re dod re re[dod re] red dod red red[dod red]}
mi16 mi32(fad sold16) sold32(la si16) la32(sold fad16) mi mi'[red32(dod si16) mi,] fad4\tr

%70
mi r8 mi
si'(sold mi si) sold(si4 mi8)
si'(sold mi si) sold(si4 mi8)
si' sold(mi sold) la4 sold\tr

%74
fad r8 mi mi' mi mi red
red4(dod8) dod dod dod dod si
si4(la8) la\mbreak la la la sold

%77
fad si, fad' fad sol sol sold sold
la la lad lad si2~
si~si4 la

%80
sold8 red mi la sold4 fad\tr
mi fad8 fad sol sol sold sold\mbreak
la la lad lad si2~

%83
si~si4 la
sold8 red mi la sold4 fad
mi4\fermata r r2

}

IvlIIn = \relative do'' {

mi8
si'(sold mi si) sold(si4 mi8)
si'(sold mi si) sold(si4 mi8)
si' sold(mi sold) la4 sold\tr

%4
fad r8 mi mi' mi mi red
red4(dod8) dod dod dod dod si
si4(la8) la\mbreak la la la sold

%7
fad si, fad' fad sol sol sold sold
la la lad lad si2~
si~si4 la

%10
sold8 red mi la sold4 fad\tr
mi fad8 fad sol sol sold sold\mbreak
la la lad lad si2~

%13
si~si4 la
sold8 red mi la sold4 fad
mi mi8 mi mi mi fad fad

%16
sold sold sold la sold sold sold la
sold sold sold sold\mbreak fad fad sold sold
la la si si sold sold sold la

%19
sold sold sold la sold sold sold sold
fad fad fad si la la sold sold
fad fad fad si la la sold sold\mbreak

%22
fad fad fad fad la la la la
sold sold sold sold la la la la
sold sold sold sold lad lad lad lad

%25
si la sold fad mi red dod si
lad fad' lad, lad\mbreak lad fad' lad, lad
si' fad red si \slurDashed fad (si4 fad'8) \slurSolid

%28
si(fad red si) fad(si4 fad'8)
lad(fad dod lad) fad(lad4 dod8)
lad'(fad dod lad) fad(lad4 dod8)

%31
red\upl si'\upl fad\upl red\upl mi mi mi mi
mi4(red8) si'\mbreak mi, mi mi mi
mi4(red16) si(red fad si4)~si16 si,(red fad

%34
si4)~si16 si,(red fad si8) red, dod8.\tr si16
si8 fad' fad fad fad fad fad fad
mi mi mi mi red fad red fad

%37
red fad fad fad fad fad fad fad
mi mi mi mi\mbreak mi mi red red
sold sold sid sid sold sold sold sold

%40
dod,8 dod dod dod dod fad fad fad
fad sold sold sold sold la la la
la si si si\mbreak dod dod dod dod

%43
si si si si la la la la
sold sold sold sold fad fad fad fad
mi mi mi mi red red sold, sold\mbreak

%46
dod dod dod dod dod dod dod dod
dod dod dod dod dod [la16 fad sold8 sold]
dod'8(sold mi dod) sold(dod4 mi8)

%49
dod'(sold mi dod) sold(dod4 mi8)
si'(fad red si) fad(si4 red8)\mbreak
si'(fad red si) fad(si4 red8)

%52
si'(sold mi si) sold(si4 mi8)
si' sold (mi sold) sold4\tr fad
r8 si, si si r si si si

%55
r si si si r  dod dod dod\mbreak
r dod dod dod r dod dod dod
r dod dod dod r red red red

%58
r red red red r red red red
r red red red r mi mi mi
r si si si\mbreak r si si si

%61
r si si si r si si si
r si si mi mi4\tr red
mi8 mi, sold sold la la fad fad

%64
sold sold mi mi\mbreak fad fad red red
mi mi mi mi mi mi mi mi'
mi si' mi, si si2~~

%67
si1~
si
mi8 fad sold la sold mi si' si,

%70
mi4 r8 mi
si'(sold mi si) sold(si4 mi8)
si'(sold mi si) sold(si4 mi8)
si' sold(mi sold) la4 sold\tr

%74
fad r8 mi mi' mi mi red
red4(dod8) dod dod dod dod si
si4(la8) la\mbreak la la la sold

%77
fad si, fad' fad sol sol sold sold
la la lad lad si2~
si~si4 la

%80
sold8 red mi la sold4 fad\tr
mi fad8 fad sol sol sold sold\mbreak
la la lad lad si2~

%83
si~si4 la
sold8 red mi la sold4 fad
mi\fermata r r2

}

IvlIIIn = \relative do'' {

r8
r4 r8 mi si'(sold mi si)
sold(si4 mi8) \slurDashed si' (sold mi si) \slurSolid
sold(si4 mi8) fad4 mi\tr

%4
red r8 sold dod dod dod si
si4(la8) la la la la sold
sold4(fad8) fad\mbreak fad fad fad mi

%7
red4 r r2
r r4 si8 si
do do dod dod re re red red

%10
mi fad sold fad mi4 red\tr
mi4 r r2\mbreak
r2 r4 si8 si

%13
do do dod dod re re red red
mi fad sold fad mi4 red\tr
mi4 sold,8 sold dod dod red si

%16
si mi mi fad mi mi mi fad
mi mi mi mi\mbreak red red mi mi
mi mi fad fad mi mi mi fad

%19
mi mi mi fad mi mi mi mi
red red red fad fad fad mi mi
red red red fad fad fad mi mi\mbreak

%22
red red red red fad fad fad fad
mi mi mi mi fad fad fad fad
mi mi mi mi dod dod dod dod

%25
red red mi red dod si lad red
mi red dod dod\mbreak dod red dod dod
si4 r si'8(fad red si)

%28
fad(si4 fad'8) si(fad red si)
fad(lad4 dod8) lad'(fad dod lad)
fad(lad4 dod8) lad'(fad dod lad)

%31
si\upl fad'\upl red\upl si\upl sold' sold sold sold
sold4(fad8) si,\mbreak sold' sold sold sold
sold4(fad16) fad, si red fad4~fad16 fad, si red

%34
fad4~fad16 fad, si red fad8 si,4 lad8
si si si si si si si si
si si si si si si si si

%37
si si si si si si si si
si si si si si si si si
sid sid sid sid dod dod dod dod

%40
dod dod dod dod dod fad fad fad
fad sold sold sold sold la la la
la si si si\mbreak dod dod dod dod

%43
si si si si la la la la
sold sold sold sold fad fad fad fad
mi mi mi mi red red sold, sold\mbreak

%46
dod dod dod dod dod dod dod dod
dod dod dod dod dod [la16 fad sold8 sold]
r2 dod'8(sold mi dod)

%49
sold(dod4 mi8) dod'(sold mi dod)
si(red4 fad8) \slurDashed si(fad red si) \slurSolid\mbreak
fad(si4 red8) si'(fad red si)

%52
sold(si4 mi8) si'(sold mi si)
sold(si4 mi8) mi4\tr red
r8 sold, sold sold r sold sold sold

%55
r sold sold sold r mi mi mi\mbreak
r lad lad lad r lad lad lad
r lad? lad lad r fad fad fad

%58
r sid sid sid r sid sid sid
r sid? sid sid r sold sold sold
r sold sold sold\mbreak r fad fad fad

%61
r sold sold sold r fad fad fad
r sold sold si si4 si
mi8 mi, sold sold la la fad fad

%64
sold sold mi mi\mbreak fad fad red red
mi mi mi mi mi mi mi mi'
mi si' mi, si si2~~

%67
si1~
si
mi8 fad sold la sold mi si' si,

%70
mi4 r8 mi
r4 r8 mi si'(sold mi si)
sold(si4 mi8) \slurDashed si' (sold mi si) \slurSolid
sold(si4 mi8) fad4 mi\tr

%74
red r8 sold dod dod dod si
si4(la8) la la la la sold
sold4(fad8) fad\mbreak fad fad fad mi

%77
red4 r r2
r r4 si8 si
do do dod dod re re red red

%80
mi fad sold fad mi4 red\tr
mi4 r r2\mbreak
r2 r4 si8 si

%83
do do dod dod re re red red
mi fad sold fad mi4 red\tr
mi4\fermata r r2

}

Ivlan = \relative do' {

r8
r sold'16[la si8 sold] r sold16[la si8 sold]
r sold16[la si8 sold] r sold16[la si8 sold]
r sold16[la si8 sold]  dod dod dod dod

%4
fad, fad si sold mi dod' dod,4
r8 dod' dod,4 r8 dod' sold4
r8 red' red,4\mbreak r8 red' red, si

%7
si1~
si~
si

%10
mi8 si' mi, red mi la si si,
mi4 si~si2~\mbreak
si1~

%13
si
mi8 si' mi, red mi la si si,
mi4 mi8 mi la la red, red

%16
mi mi mi si mi mi mi si
mi mi mi mi\mbreak si' la sold mi
la la red, red mi mi mi si

%19
mi mi mi si mi mi mi mi
si si si si si si si si
si si si si si si si si\mbreak

%22
si si si si si si si si
si si si si si si si si
mi mi mi mi fad fad fad fad

%25
fad fad fad fad fad fad fad fad
fad fad fad fad\mbreak fad fad fad fad
si,[red16 mi fad8 red] r red16[mi fad8 red]

%28
r red16[mi fad8 red] r red16[mi fad8 red]
r dod fad dod r dod fad dod
r dod fad dod r dod fad fad

%31
fad red' si fad r sold16[la si8 sold]
r red fad red\mbreak r sold16[la si8 sold]
r red fad red r red fad red

%34
r red fad red r fad fad fad
red8 si8 si si si si si si
si si si si si si si si

%37
si si si si si si si si
si si si si si si si si
sid sid sid sid dod dod dod dod

%40
dod dod dod dod dod fad fad fad
fad sold sold sold sold la la la
la si si si\mbreak dod dod dod dod

%43
si si si si la la la la
sold sold sold sold fad fad fad fad
mi mi mi mi red red sold, sold\mbreak

%46
dod dod dod dod dod dod dod dod
dod dod dod dod dod [la'16 fad sold8 sold,]
\parenthesize dod mi sold mi r mi sold mi

%49
r mi sold mi r mi sold mi
r red fad red r red fad red\mbreak
r red fad red r red fad red

%52
r mi sold mi r mi sold mi
r mi sold mi r red fad red
r8 mi mi mi r mi mi mi

%55
r mi mi mi r la, la la\mbreak
r fad' fad fad r fad fad fad
r fad fad fad r si, si si

%58
r sold' sold sold r sold sold sold
r sold sold sold r dod, dod dod
r mi mi mi\mbreak r red red red

%61
r mi mi mi r red red red
r  mi mi mi si' si, red si
mi mi sold sold la la fad fad

%64
sold sold mi mi\mbreak fad fad red red
mi mi mi mi mi mi mi mi
mi si' mi, si si2~

%67
si1~\mbreak
si
mi8 fad sold la sold mi si' si,

%70
mi4 r8 mi
r sold16[la si8 sold] r sold16[la si8 sold]
r sold16[la si8 sold] r sold16[la si8 sold]

%73
r sold16[la si8 sold]  dod dod dod dod
fad, fad si sold mi dod' dod,4
r8 dod' dod,4 r8 dod' sold4

%76
r8 red' red,4\mbreak r8 red' red, si
si1~
si~

%79
si
mi8 si' mi, red mi la si si,
mi4 si~si2~\mbreak

%82
si1~
si
mi8 si' mi, red mi la si si,

%85
mi4\fermata r r2

}

Ibcn = \relative do {

r8
r mi16[fad sold8 mi] r mi16[fad sold8 mi]
r mi16[fad sold8 mi] r mi16[fad sold8 mi]
r mi16[fad sold8 mi] la, la lad lad

%4
si[si'16 la sold8 mi] la, la' la,4
r8 la' la,4 r8 la' mi4
r8 si' si,4\mbreak r8 si' si, mi

%7
si1~
si~
si

%10
mi8 si' mi, red mi la si si,
mi4 si~si2~
si1~

%13
si
mi8 si' mi, red mi la si si,
mi4 r r2

%16
R1*11
r8 si16[dod red8 si] r si si' si,
r si si' si, r si si' si,

%29
r fad fad' fad, r fad fad' fad,
r fad fad' fad, r fad fad' fad,
r si si' si, r mi16[fad sold8 mi]

%23
r si si' si,\mbreak r mi16[fad sold8 mi]
r si si' si, r si si' si,
r si si' si, r si fad' fad,

%35
si4 r r2
R1*12
r8 dod dod' dod, r dod dod' dod,

%49
r dod dod' dod, r dod dod' dod,
r red red' red, r red red' red,\mbreak
r si si' si, r si si' si,

%52
r mi, mi' mi, r mi mi' mi,
r mi mi' mi, r si' si' si,
R1*16

%70
R2
r8 mi16[fad sold8 mi] r mi16[fad sold8 mi]
r mi16[fad sold8 mi] r mi16[fad sold8 mi]

%73
r mi16[fad sold8 mi] la, la lad lad
si[si'16 la sold8 mi] la, la' la,4
r8 la' la,4 r8 la' mi4

%76
r8 si' si,4\mbreak r8 si' si, mi
si1~
si~

%79
si
mi8 si' mi, red mi la si si,
mi4 si~si2~

%82
si1~
si
mi8 si' mi, red mi la si si,

%85
mi4\fermata r r2

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



}


forma = {

\key mi\major
\time 4/4
\tempo 4 = 80
\partial 8 s8
s1*69
\set Score.measureLength = #(ly:make-moment 2 4)
s2
\set Score.measureLength = #(ly:make-moment 4 4)
s1*15
\bar"|."

}

IvlI = {
	\notypeset
	<<\IvlIn \forma>>

}

IvlII = {
	<<\IvlIIn \forma>>

}

IvlIII = {
	<<\IvlIIIn \forma>>

}


Ivla = {
	\clef alto
	<<\Ivlan \forma>>

}


Ibc = {
	\clef bass
	<< \Ibcn \forma \Ibfn >>
	\typeset

}
	
IIvlIn = \relative do'' {

lad'1
si\fermata
sid
dod\fermata
si~
si2 la~
la sold4 fad
mi1
red

}
	
IIvlIIn = \relative do'' {

lad'1
si\fermata
sid
dod\fermata
si~
si2 la~
la sold4 fad
mi1
red

}
	
IIvlIIIn = \relative do'' {

fad1
fad\fermata
fad 
mi\fermata
mid
dod2 fad~
fad mi4 red
dod1
sid

}
	
IIvlan = \relative do' {

dod'1
red\fermata
sid
sold\fermata
sold
fad2. dod4
red2. sid4
sold2 lad
sid1

}

IIbcn = \relative do {

mi1
red\fermata
red
dod\fermata
dod
fad
sid, 
dod2 fadd,
sold1

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



} 
				

forma = {

\key mi\major
\time 4/4
\tempo 2 = 40
s1*8
s1\fermata
\bar"|."

}

IIvlI = {
	\notypeset
	<<\IIvlIn \forma>>

}

IIvlII = {
	<<\IIvlIIn \forma>>

}

IIvlIII = {
	<<\IIvlIIIn \forma>>

}


IIvla = {
	\clef alto
	<<\IIvlan \forma>>

}


IIbc = {
	\clef bass
	<< \IIbcn \forma \IIbfn >>
	\typeset
	
}

IIIvlIn = \relative do'' {

R4.
si'32(la) si16 r8 si,32(la) si16
si'32(la) si16 r8 si,32(la) si16

%4
si'32(la) si16 r8 si,32(la) si16
si'(si,) mi(si) mi(si)
fad'(si,) fad'(si,) fad'(si,)

%7
sold'(si,) sold'(si,) sold'(si,)
fad'(si,) fad'(si,) fad'(si,)\mbreak
si'(la sold fad mi re)

%10
dod8(mi la)
dod16(si la sold fad mi)
red(si) fad'(si,) si'(si,)

%13
si'32(la) si16 r8 si,32(la) si16
red(si) fad'(si,) si'(si,)
si'32(la) si16 r8 si,32(la) si16

%16
sold'8(fad mi)
si'(la sold)\mbreak
sold(fad mi)

%19
si'(la sold)
la(sold fad)
mi(sold si)

%22
sold(fad mi)
si'(la sold)
la(sold fad)

%25
mi16\solo(si' mi si la sold)
mi(si' mi si la sold)
mi(si' mi si la sold)

%28
sold4\tr fad8
si,16(fad' si fad mi red!)\mbreak
si(fad' si fad mi red)

%31
si(fad' si fad mi red)
mi,(si' mi si la sold)
mi(si' mi si la sold)

%34
mi(si' mi si la sold)
la(mi' la mi red dod)
la(mi' la mi red dod)

%37
la(mi' la mi red dod)
si(fad' si fad mi red)
si(fad' si fad mi red)\mbreak %%%fine p. 10

%40
red(fad si fad mi red)
sold(mi si' mi, mi' mi,)
sold(mi si' mi, mi' mi,)

%43
sold(mi si' mi, mi' mi,)
lad(si dod lad sold fad)
lad(si dod lad sold fad)

%46
lad(si dod lad fad mi)
red si' red,8(dod\tr)
si16(fad) si(fad) si(fad)\mbreak

%49
dod'(fad,) dod'(fad,) dod'(fad,)
red'(fad,) red'(fad,) red'(fad,)
dod'(fad,) dod'(fad,) dod'(fad,)

%52
R4.
fad'32(mi) fad16 r8 fad,32(mi) fad16
fad'32(mi) fad16 r8 fad,32(mi) fad16

%55
fad'32(mi) fad16 r8 fad,32(mi) fad16
lad'(sold fad mi red dod)
lad'(sold fad mi red dod)\mbreak

%58
red si' red,8 dod
si32 red dod si fad' [lad sold fad] si16 fad
red si red fad si fad

%61
si,32 red dod si fad' [lad sold fad] si16 fad
red si red fad si fad
dod8 fad, r

%64
si32 red dod si fad' [la sold fad] si16 la
mi,32 sold fad mi si' [re dod si] mi16 re\mbreak
dod32 mid red dod sold' [si la sold] dod16 si

%67
fad,32 lad sold fad dod' [mi red dod] fad16 mi
si32 red dod si red [fad mi red] la'16 fad
sid,32 red dod sid red [fad mi red] sold16 fad

%70
dod32 mi red dod sold' [sid lad sold] dod16 sold\mbreak
dod,32 mi red dod sold' [sid lad sold] dod16 sold
dod(si la sold fad mi)

%73
la(sold fad  mi red dod)
fad red red4\tr
dod16 sold dod sold dod sold

%76
red' sold, red' sold, red' sold,
mi' sold, mi' sold, mi' sold,
red' sold, red' sold, red' sold,

%79
dod4 r8\mbreak
si'32(la) si16 r8 si,32(la) si16
si'32(la) si16 r8 si,32(la) si16

%82
si'32(la) si16 r8 si,32(la) si16
si'(la sold fad mi re)
dod8(mi la)

%85
dod16(si la sold fad mi)
red32(si la si) red[(si la si)] red(si la si)
fad' si, la si fad' [si, la si] fad' si, la si

%88
la' si, la si la' [si, la si] la' si, la si \mbreak
red(si la si) red[(si la si)] red(si la si)
fad' si, la si fad' [si, la si] fad' si, la si

%91
la' si, la si la' [si, la si] la' si, la si
mi(sold si sold) mi[(sold si sold)] mi(sold si sold)
mi(si' mi si) mi,[(si' mi si)] mi,(si' mi si)

%94
mi, sold si sold mi [sold si sold] mi sold si sold \mbreak
mi si' mi si mi, [si' mi si] mi, si' mi si
mi,16(mi' red dod si la)

%97
sold(si la sold fad mi)
si'(mi red dod si la)
sold(si la sold fad mi)

%100
mi' mi, fad4\tr
mi16(sold) si(sold) si(sold)
si32(la) si16 r8 si,32(la) si16\mbreak

%103
red si fad' si, si' si,
si'32(la) si16 r8 si,32(la) si16
sold'8(fad mi)

%106
si'(la sold)
sold(fad mi)
si'(la sold)

%109
la(sold fad)
mi(sold si)
sold(fad mi)

%112
si'(la sold)
la(sold fad)\mbreak
mi4.\fermata

}

IIIvlIIn = \relative do'' {

R4.
si'32(la) si16 r8 si,32(la) si16
si'32(la) si16 r8 si,32(la) si16

%4
si'32(la) si16 r8 si,32(la) si16
si'(si,) mi(si) mi(si)
fad'(si,) fad'(si,) fad'(si,)

%7
sold'(si,) sold'(si,) sold'(si,)
fad'(si,) fad'(si,) fad'(si,)\mbreak
si'(la sold fad mi re)

%10
dod8(mi la)
dod16(si la sold fad mi)
red(si) fad'(si,) si'(si,)

%13
si'32(la) si16 r8 si,32(la) si16
red(si) fad'(si,) si'(si,)
si'32(la) si16 r8 si,32(la) si16

%16
sold'8(fad mi)
si'(la sold)\mbreak
sold(fad mi)

%19
si'(la sold)
la(sold fad)
mi(sold si)

%22
sold(fad mi)
si'(la sold)
la(sold fad)

%25
sold4.~
sold~
sold~

%28
sold4 fad8
fad4.~\mbreak
fad~

%31
fad
sold~
sold~

%34
sold
la~
la~

%37
la~
la~
la~\mbreak

%40
la
sold~
sold~

%43
sold
lad~
lad~

%46
lad
si4 lad8
si,16(fad) si(fad) si(fad)\mbreak

%49
dod'(fad,) dod'(fad,) dod'(fad,)
red'(fad,) red'(fad,) red'(fad,)
dod'(fad,) dod'(fad,) dod'(fad,)

%52
R4.
fad'32(mi) fad16 r8 fad,32(mi) fad16
fad'32(mi) fad16 r8 fad,32(mi) fad16

%55
fad'32(mi) fad16 r8 fad,32(mi) fad16
lad'(sold fad mi red dod)
lad'(sold fad mi red dod)\mbreak

%58
red si' red,8 dod
si4 r8
R4.*15

%75
dod16 sold dod sold dod sold
red' sold, red' sold, red' sold,
mi' sold, mi' sold, mi' sold,

%78
red' sold, red' sold, red' sold,
dod4 r8\mbreak
si'32(la) si16 r8 si,32(la) si16

%81
si'32(la) si16 r8 si,32(la) si16
si'32(la) si16 r8 si,32(la) si16
si'(la sold fad mi re)

%84
dod8(mi la)
dod16(si la sold fad mi)
red4.~

%87
red~
red~\mbreak
red~

%90
red~
red
mi~

%93
mi~
mi~\mbreak
mi~

%96
mi~
mi~
mi~

%99
mi~
mi8 red4\tr
mi16(sold) si(sold) si(sold)

%102
si32(la) si16 r8 si,32(la) si16\mbreak
red si fad' si, si' si,
si'32(la) si16 r8 si,32(la) si16

%105
sold'8(fad mi)
si'(la sold)
sold(fad mi)

%108
si'(la sold)
la(sold fad)
mi(sold si)

%111
sold(fad mi)
si'(la sold)
la(sold fad)\mbreak

%114
mi4.\fermata

}

IIIvlIIIn = \relative do'' {

mi16(si) mi(si) mi(si)
fad'(si,) fad'(si,) fad'(si,)
sold'(si,) sold'(si,) sold'(si,)

%4
fad'(si,) fad'(si,) fad'(si,)
R4.
si'32(la) si16 r8 si,32(la) si16

%7
si'32(la) si16 r8 si,32(la) si16
si'32(la) si16 r8 si,32(la) si16\mbreak
sold'(fad mi re dod si)

%10
la8(dod mi)
la16(sold fad mi red dod)
si'32(la) si16 r8 si,32(la) si16

%13
red(si) fad'(si,) si'(si,)
si'32(la) si16 r8 si,32(la) si16
red(si) fad'(si,) si'(si,)

%16
si'8(la sold)
sold(fad mi)\mbreak
si'(la sold)

%19
sold(fad mi)
fad(mi red!)
si(mi sold)

%22
si(la sold)
sold(fad mi)
fad(mi red)

%25
mi4.~
mi~
mi~

%28
mi4 red8
red4.~\mbreak
\tieDashed red~

%31
red \tieSolid
si~
si~

%34
si
dod~
dod~

%37
dod
red~
red~\mbreak

%40
red
si~
si

%43
mi
dod~
dod~

%46
dod
red4 dod8
si4 r8\mbreak

%49
fad'32(mi) fad16 r8 fad,32(mi) fad16
fad'32(mi) fad16 r8 fad,32(mi) fad16
fad'32(mi) fad16 r8 fad,32(mi) fad16

%52
si(fad) si(fad) si(fad)
dod'(fad,) dod'(fad,) dod'(fad,)
red'(fad,) red'(fad,) red'(fad,)

%55
dod'(fad,) dod'(fad,) dod'(fad,)
fad'8(dod lad)
fad'(dod lad)\mbreak

%58
si16 fad' si,8 lad
si4 r8
R4.*16

%76
sold'32(fad) sold16 r8 sold,32(fad) sold16
sold'32(fad) sold16 r8 sold,32(fad) sold16
sold'32(fad) sold16 r8 sold,32(fad) sold16

%79
mi'(dod) mi(dod) mi(dod)\mbreak
fad(si,) fad'(si,) fad'(si,)
sold'(si,) sold'(si,) sold'(si,)

%82
fad'(si,) fad'(si,) fad'(si,)
sold'(fad mi re dod si)
la8(dod mi)

%85
la16(sold fad mi red dod)
si4.
fad'~

%88
fad~\mbreak
fad~
fad~

%91
fad
sold~
sold~

%94
sold~
sold~
sold~

%97
sold~
sold~
sold~

%100
sold8 fad4\tr
mi16 mi sold(mi) sold(mi)
red(si) fad'(si,) si'(si,)\mbreak

%103
si'32(la) si16 r8 si,32(la) si16
red(si) fad'(si,) si'(si,)
si'8(la sold)

%106
sold(fad mi)\mbreak
si'(la sold)
sold(fad mi)

%109
fad(mi red)
si(mi sold)
si(la sold)

%112
sold(fad mi)
fad(mi red)
mi4.

}

IIIvlan = \relative do' {

si'4.~
si~
si~

%4
si~
si~
si~

%7
si~
si~\mbreak
si4 sold8

%10
mi4.~
mi4 la8
fad4.~

%13
fad~
fad~
fad

%16
si,~
si~\mbreak
si~

%19
si~
si~
si~

%22
si~
si~
si

%25
mi~
mi~
mi

%28
si~
si~\mbreak
si~

%31
si
mi~
mi~

%34
mi
la,~
la~

%37
la
si~
si~\mbreak

%40
si
mi~
mi~

%43
mi
fad~
fad~

%46
fad
si,4 fad'8
fad4.~

%49
fad~
fad~
fad~

%52
fad~
fad~
fad~

%55
fad~
fad~
fad~\mbreak

%58
fad4 r8
fad4 r8
R4.*15

%75
sold4.~
sold~
sold~

%78
sold~
sold\mbreak
fad

%81
si~
si~
si4 sold8

%84
mi4.~
mi4 la8
si4.~

%87
si~
si~\mbreak
si~

%90
si~
si~
si~

%93
si~
si~
si~

%96
si~
si~
si~

%99
si~
si~
si~

%102
si~
si~
si~

%105
si~
si~
si~

%108
si~
si~
si~

%111
si~
si~
si~

%114
si_\fermata

}

IIIbcn = \relative do {

mi8 mi mi
red red red
mi mi mi

%4
red red red
mi mi mi
red red red

%7
mi mi mi
red red red\mbreak
mi mi mi

%10
la, la la
la la la
si si si

%13
si si si
si si si
si si si

%16
si si si\mbreak
si si si
si si si

%19
si si si
si si si
si si si

%22
si si si
si si si
si si si

%25
mi,4 r8
R4.*22
si'8 si si\mbreak

%49
lad lad lad
si si si
lad lad lad

%52
si si si
lad lad lad
si si si

%55
lad lad lad
fad' fad fad
fad fad fad\mbreak

%58
fad fad fad
si,4 r8
si4 r8

%61
si4 r8
si4 r8
fad' lad fad

%64
red4 r8
mi4 r8\mbreak
mid4 r8

%67
fad4 r8
red4 r8
sold4 r8

%70
dod,4 r8\mbreak
dod4 r8
dod4 r8

%73
fad4 r8
\parenthesize r sold sold,
dod dod dod

%76
sid sid sid
dod dod dod
sid sid sid

%79
dod dod dod\mbreak
red red red
mi mi mi

%82
red red red
mi mi mi
la, la la

%85
la la la
si4.~
si~

%88
si~\mbreak
si~
si~

%91
si~
si~
si~

%94
si~
si~
si~

%97
si~
si~
si~

%100
si
mi
si~\mbreak

%103
si~
si~
si~

%106
si~
si~
si~

%109
si~
si~
si~

%112
si~
si
mi,4.\fermata

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



}


forma = {

\key mi\major
\time 3/8
\tempo 4. = 50
s4.*114
\bar"|."

}

IIIvlI = {
	\notypeset
	<<\IIIvlIn \forma>>

}

IIIvlII = {
	<<\IIIvlIIn \forma>>

}

IIIvlIII = {
	<<\IIIvlIIIn \forma>>

}


IIIvla = {
	\clef alto
	<<\IIIvlan \forma>>

}


IIIbc = {
	\clef bass
	<< \IIIbcn \forma \IIIbfn >>
	\typeset

}
#(set-global-staff-size 16.5)

\version "2.20.0"

\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \terzinecon
}

\markup \huge {[1.] All[egr]o / Con[cer]to: con tutti gli Istrom[en]ti sempre sordini / Senza  Cembali sempre}

\score {

            \new ChoirStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino""principale]"}
                    \IvlI  \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \IvlII \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \IvlIII \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \Ivla  \global
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                }
                <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \Ibc \global
                >>
            >>

    \layout {

        indent = 1.3\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
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
        }
    }
}

%\pageBreak

\markup \huge {[2.] Ad[agi]o}

\score {

            \new ChoirStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI  \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlIII \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvla  \global
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                }
                <<
                    \set Staff.midiInstrument = #"cello"
                    \IIbc \global
                >>
            >>

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/32)  %aumenta lo spazio orizzontale
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

\markup \huge {[3.] All[egr]o / Sempre sordini}

\score {

            \new ChoirStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI  \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlIII \global
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla  \global
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                }
                <<
                    \set Staff.midiInstrument = #"cello"
                    \IIIbc \global
                >>
            >>

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
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
        }
    }
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
