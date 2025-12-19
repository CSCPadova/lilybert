\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

parentSlur =
 -\tweak stencil
 #(lambda (grob)
   (let* ((cp (ly:grob-property grob 'control-points))
          (lp (grob-interpret-markup grob (markup #:teeny "(")))
          (rp (grob-interpret-markup grob (markup #:teeny ")"))))
     (set! lp (ly:stencil-aligned-to lp Y CENTER))
     (set! lp (ly:stencil-aligned-to lp X 0.2))
     (set! lp (ly:stencil-translate lp (first cp)))
     (set! rp (ly:stencil-aligned-to rp Y CENTER))
     (set! rp (ly:stencil-aligned-to rp X -0.2))
     (set! rp (ly:stencil-translate rp (last cp)))
     (list-set! cp 0
       (cons (cdr (ly:stencil-extent lp X))
             (cdr (first cp))))
     (list-set! cp (1- (length cp))
       (cons (car (ly:stencil-extent rp X))
             (cdr (last cp))))
     (ly:grob-set-property! grob 'control-points cp)
     (apply ly:stencil-add (list lp rp
       (ly:slur::print grob)))))
 \etc

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

solo = ^\markup \italic { seul }

tu = ^\markup \italic "tous"

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

Iglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##f
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \con
			}

Idsn = \relative do'' {

re4. la16 la re dod re mi fad mi fad sol
la8[la la8. la16] la sol la si la fad sol la
si8[si si la16 si] sol8 sol sol16 si la sol

%4
fad8[fad fad8. fad16] fad mi fad sol fad la sol fad\mbreak
mi8[mi mi la16 sol] fad8[la mi8. re16]
re8[la re re16 re] re8[re re fad16 re]

%7
la'8[mi la sol16 la] fad8[la la8. sold16]
la2 r8 la, si dod
la'2. la,4 la8 si dod re\mbreak

%9
mi4. fad8 mi4 si dod re
dod2 re dod
re2. mi8 re mi sol fad la

%12
sol2 sol4 sol4. la8 fad4
sol2 sol4 sol fad4. mi8\mbreak
red2 mi4 fad4. sol8 la4

%15
la4. si8 sol4 fad fad4. mi8
mi2. si4 mi4. re8
dod2 re4 mi mi8 mi fad sol

%18
la4. si8 la4 mi fad sol\mbreak
fad2. fad4 fad8 fad mi fad
re4 re8 re mi fad sol4 sol8 sol fad sol

%21
mi4 mi8 mi fad sol la4 la8 la sol la
fad4 fad8 fad sol la\mbreak si4. lad8 si4
lad2 si lad

%24
si4 si8 si la si sold4. fad8 sold4
la4 la8 la sol la fad4. mi8 fad4\mbreak
sol4. la8 sol4 sol la fad

%27
sol2. sol4 sol8 sol fad sol
mi4 mi8 mi fad sol la4. sol8 la fad
sol4. la8 si4 do2 sol4\mbreak

%30
la4. sold8 la4 si sold4.\prall fad16 sold
la2. mi4. re8 mi fad
sol4 sol8 sol fad mi re4. dod8 re mi

%33
fad4. sol8 la fad sol[la si la sol fad]\mbreak
mi4 mi fad re8 dod re si mi re
dod2. do

%36
si mi4 fad sol
dod,2. la'
fad si\mbreak

%39
sol4 sol8 sol fad sol mi4 mi8 mi re mi
dod2. do
si mi4 fad sol

%42
dod,2. la'
fad si\mbreak
sol4 sol8 sol fad sol mi4 mi8 mi re mi

%45
dod2. re4 re8 mi fad sol
la4. si8 la4 mi fad sol
fad4. sol8 la4 sol8 fad mi4. re8

%48
re2. la4 la8 si dod re
re\breve

}


Ihcn = \relative do'' {

la2 r8 la16 la re dod re mi
re8. re16 re dod re mi re8[re re8. re16]
re dod re mi re8 re re16 dod re mi re8. re16

%4
re8[re re8. re16] re dod re mi re fad mi re\mbreak
dod8[dod dod si16 dod] re8[re re8. dod16]
re4 la8 la16 la la8[la si\prall la16 si]

%7
dod8[dod16 re mi8 dod] re[dod16 re si8 mi16 re]
dod2 r8 mi, fad sol
dod2. r\mbreak

%9
R1.*2
r2. la4 la8 la si dod
re4. mi8 re4 la si do

%13
si2 re4 do2 do4
si2. si2 si4
si2 do si4. la8

%16
sold2. sol4 sol4. fad8
mi2 fad4 sol la si
la2. si4 la4. la8\mbreak

%19
la2. re4 re8 re dod re
si4 si8 si dod re mi4 mi8 mi re mi
dod2 dod4 dod dod dod

%22
si2 si8 dod\mbreak re4. re8 mi4
dod4. dod8 re4 dod dod4. si8
si2. si4 si8 si dod re

%25
mi4. re8 dod si la4. la8 re4
re4. do8 re4 do4. si8 la4
si2. si4 si8 si la si

%28
sol4 sol8 sol la si do4. si8 do la
si4. do8 re4 mi mi8 mi re mi\mbreak
do2 do4 re si4. si8

%31
dod2. dod4. si8 dod re
mi4 mi8 mi re dod si4. la8 si dod
re dod re mi re dod si2 si4\mbreak

%34
la2 la4 la si sold
la2. la
sol si

%37
la dod
re re
mi si

%40
la la
sol si
la dod

%43
re re\mbreak
mi si
la4 la8 la sol la fad4 si4. dod8

%46
re2. re4 dod4. si16 dod
re2 re4 re re4. dod8
re2. r
re\breve

}


Itln = \relative do' {

fad4. fad16 fad fad mi fad sol la si la sol
fad8[fad fad8. fad16] fad mi fad sol fad re mi fad
sol8 sol sol16 fad sol la si8[si si\prall la16 si]

%4
la sol la si la8 la la[la la8. la16]\mbreak
la sol la si la8 la la la16 la la si la sol
fad8 fad16 fad fad8 fad fad fad16 fad fad8. sol16

%7
mi8[mi mi re16 mi] fad8[fad mi mi16 mi]
mi2 r8 dod re mi
mi2. r\mbreak

%9
r mi4 mi8 mi fad sol
la4. si8 la4 mi fad sol
fad4. mi8 fad4 mi2.

%12
si'4. la8 si4 la la4.\prall sol8
sol2 si4 si la4. sol8\mbreak
fad2 mi4 red4. mi8 fad4

%15
fad4. sol8 mi4 mi mi4. red8
mi2. mi2 si4
dod2 la'4 sol fad mi

%18
fad2. mi4 mi4. re8\mbreak
re2. la'4 la la
sol2 sol4 si si si

%21
la4. dod,8 re mi fad4 fad8 fad mi fad
re4 re8 re mi fad\mbreak sol4. la8 sol4
fad4. sol8 fad4 dod red mi

%24
red red8 red dod red si4 mi si
dod4. re8 mi dod re4 fad8 sol la fad\mbreak
si4. do8 si4 mi, re4. re8

%27
re2. re2 re4
do2 re4 mi2 mi4
mi2 sol4 sol2 sol4\mbreak

%30
fa4. sol8 fa4 fa mi4. mi8
mi4 mi8 mi fad sol la2 la4
si2 si4 sol2 sol4

%33
la2 re,4 mi8 fad sol fad mi re
dod2. re4. dod8 si4
mi2. fad

%36
re sol
mi fad
fad sol\mbreak

%39
si4 si8 si la si sol4 sol8 sol fad sol
mi2. fad
re sol

%42
mi fad
fad sol\mbreak
si4 si8 si la si sol4 sol8 sol fad sol

%45
mi2. re2 mi4
fad4. sol8 la4 si la4. la8
la4. sol8 fad4 si la4. sol8

%48
fad2. r
fad\breve

}


Ibcn = \relative do {

re,1
re
re

%4
re\mbreak
la'8 si dod la re fad,16 sol la4
re,2 re'

%7
dod4 la re mi8 mi,
la2 r8 sol fad mi
la2. r\mbreak

%9
R1.
r2. la4 la8 la si dod
re4. mi8 re4 la si do

%12
si4. la8 si4 do re re,
sol2. la\mbreak
si2 dod4 red2.

%15
sol,2 la si
mi,2. mi'4 mi8 mi fad sol
la4. si8 la4 mi fad sol

%18
fad2. sol4 la la,\mbreak
re,2. re'4 re8 re mi fad
sol4 sol8 sol fad sol mi4 mi8 mi fad sol

%21
la4 la8 la sol la fad4 fad8 fad sol la
si4 si8 si la si\mbreak sol4. fad8 mi4
fad4. mi8 re4 mi fad fad,

%24
si si8 si dod re mi4 mi8 mi re mi
dod4 la8 si dod la re4 re8 re do re\mbreak
si4. la8 si4 do re re,

%27
sol2. sol4 sol8 sol la si
do4 do8 do si do la4 la8 si do re
mi4 mi8 mi re mi do4 do8 do re mi\mbreak

%30
fa4 fa8 fa mi fa re4 mi mi,
la2. la'4 la8 la sol fad
mi4. re8 mi fad sol4 sol8 sol fad mi

%33
re mi re do si la sol2.\mbreak
la2. si
la4 la' sol fad mi re

%36
sol, sol' fad mi mi8 mi fad sol
la4 la8 la sol la fad4 fad8 fad sol la
si4 si8 si la si sol4 sol8 sol fad sol\mbreak

%39
mi2. mi,4 mi8 mi fad sol
la4 la' sol fad mi re
sol, sol' fad mi mi8 mi fad sol

%42
la4 la8 la sol la fad4 fad8 fad sol la
si4 si8 si la si sol4 sol8 sol fad sol\mbreak
mi2. mi,4 mi8 mi fad sol

%45
la2. si4. si8 la sol
fad2. sol4 la2
re,4. mi8 fad4 sol la2

%48
re,2. r
re\breve

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s1*2
	<6 4>1
	<5>

}


forma = {

\time 4/4
\key re\major
\tempo 2 = 50
\repeat volta 2 {
s1*7}
\alternative {{s1}{\time 6/4 \tempo 2. = 75 s1.}}\break
\bar".|:"
\set Score.currentBarNumber = #9
\repeat volta 2{
s1.*39 }
\alternative {{s1.}{s\breve}}
\bar "|."

}


Ids = {
	\Iglobal
	\notypeset
	<<\Idsn \forma>>
}


Ihc = {
	\Iglobal
	<<\Ihcn \forma>>
}


Itl = {
	\Iglobal
	<<\Itln \forma>>
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
    \override TupletNumber #'transparent = ##f
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \con
}

IIdsn = \relative do'' {

    sol'8
    sol2 r8 fa mi re
    do4. si8 do4. re8
    si4 sol re'4. re8

    %4
    mi4 re do4. si8
    la2 fa'~
    fa4 re sol2~

    %7
    sol4 mi fa4. fa8
    fa4 mi8 fa re4. do8
    do2 mi4. mi8\mbreak

    %10
    mi4 fad sol4. la8
    fad4 re sib'2~
    sib4 la8 sol sol4. fad8

    %13
    sol2. r8 sol
    sol1
    R1.*2

    %16
    r2. r4 do, re
    mi4 fa8 mi re do sol'4 la8 sol fa mi
    fa4 re sol mi4. re8 mi4

    %19
    fa2.mi8 re mi fa mi fa
    sol2 sol4 sol8 fa sol mi fa sol\mbreak
    la4. sold8 la4 sold2 la4

    %22
    la4. si8 sold4 la sold la
    fad2 sol4 sol4. la8 fad4
    sol sol, la si do8 si la sol

    %25
    re'4 mi8 re do si do4 la re\mbreak
    si8 la si la si do re4. do8 re4
    mi4 mi fa sol8 la sol fa mi re

    %28
    do4 do re mi fa8 mi re do
    sol'4 la8 sol fa mi fa4 re sol
    mi4. mi8 la4 re, re4. do8\mbreak

    %31
    do4 mi fa sol4. la8 sib4
    la2. sol4 fa mi
    re2. r4 do re

    %34
    mi4. mi8 la4 re, re4. do8
    do2 sol'~
    sol4 sol do4. sol8\mbreak

    %37
    la2. sol4
    la sol fa4. mi8
    re2 sol~

    %40
    sol4 sol fa4. fa8
    fa2 mi4. mi8
    mi4 re re4.\prall do8

    %43
    do1

}


IIhcn = \relative do'' {

    do8
    do2 sol4. sol8
    la2. la4
    sol si2 si4

    %4
    do si8 la sol4 fa8 mi
    fa4. sol8 la4 la
    si2. sol4

    %7
    do2. la4
    si sol sol4. sol8
    sol2 do4. do8\mbreak

    %10
    do2 dod4.\prall si16 dod
    re2. re8 do
    sib4 mib re4. do8

    %13
    sib4 sol la si?
    si1
    r4 sol la si do8 si la sol

    %15
    re'4 mi8 re do si do4 la re\mbreak
    si4. la8 si do re mi re do si la
    sol4 sol4. do8 sib4 do8 sib la sol

    %18
    la4 fa sib sol4. fa8 sol4
    la la si do2 do4
    do re do si si4. do8\mbreak

    %21
    la2 re4 si4. si8 do4
    la la si dod re8 dod si la
    re4 mi8 re do si do4 la re

    %24
    si2. r4 sol la
    si2. la\mbreak
    sol4 sol la si do8 si la sol

    %27
    do4 re8 do sib la sib4 sol do
    la la4. fa8 sol4 sol la
    si do8 si la sol do4 si4. la8

    %30
    sol4 do2 do4\prall do4. si8\mbreak
    do2. r4 do do
    do do re mi la,8 si do4

    %33
    si4. do8 si la sol4 sol4. la8
    si4 do4. si8 la4 sol4. sol8
    sol2. do8 re

    %36
    mi2. do4\mbreak
    do2. do8 si
    la2. la4

    %39
    la2 sol4. fa8
    mi2 fa
    sol2. sol4~

    %42
    sol8 la la sol sol4. fa8
    mi1

}


IItln = \relative do' {

    mi8
    mi2 re4. re8
    mi2 fa4. fa8
    fa4. mi8 fa4. sol8

    %4
    mi4 fa mi4. re8
    do2 re~
    re4 si mi2~

    %7
    mi4 do re4. re8
    re4 do re4.\prall do16 re
    mi4. fa8 sol4. sol8\mbreak

    %10
    la2. la4
    la fad2 fad4
    sol la la4. sol8

    %13
    sol4 si, do re
    sol1
    R1.

    %15
    r4 re mi fad sol8 fad mi re\mbreak
    sol4 la8 sol fa! mi fa4 re sol
    mi mi4. fa8 re4 re4. mi8

    %18
    do4 re2 mi4 do do
    do do re  mi fa8 mi re do
    sol'4 la8 sol fa mi re4 re4. mi8\mbreak

    %21
    do4. do8 fa4 mi2 mi4
    fa mi4. mi8 mi2 mi4
    re2 re4 mi re4. re8

    %24
    re2. re2 re4
    re2. re\mbreak
    re sol

    %27
    do,4 do re mi fa8 mi re do
    fa4 sol8 fa mi re do2.
    si la4 si2

    %30
    do fa, sol\mbreak
    do4 sol' fa mi4. fa8 sol4
    fa2. do

    %33
    re4 do re mi fa8 mi re do
    sol'4 la8 sol fa mi fa4 re sol
    mi2. mi8 fa

    %36
    sol2. sol4\mbreak
    sol2 fa4 sol
    fa mi re4. do8

    %39
    si2. si4
    do mi re4. do8
    do2 do~

    %42
    do4 do do4. si8
    do1

}


IIbcn = \relative do {

    r8
    do2 si
    la re
    sol,2. sol'4

    %4
    do, re mi do
    fa2. re4
    sol2. mi4

    %7
    la2. fa4
    sol do, sol2
    do do'4. si8\mbreak

    %10
    la2 r8 sol fa mi
    re2. sib4
    mib do re re,

    %13
    sol4 sol'8 fa mi4 re
    sol,1
    R1.*2\mbreak

    %16
    r4 sol' la si do8 si la sol
    do4 re8 do sib la sib4 sol do
    la sib sol do do,2

    %19
    fa2. r4 do re
    mi fa8 mi re do sol'4 la8 sol fa mi\mbreak
    fa4. mi8 re4 mi4. re8 do4

    %22
    re mi mi, la2 la4
    si2. la4 re re,
    sol2. sol'

    %25
    sol fad\mbreak
    sol fa?
    mi r

    %28
    R1.*3\mbreak
    r4 do re mi fa8 mi re do
    fa4 sol8 fa mi re mi4 re do

    %33
    sol' la si do2.
    mi,2 fa sol
    do,1
    do'2. do4\mbreak

    %37
    fa,2. mi4
    fa1
    sol

    %40
    la
    sol2 do,
    fa, sol

    %43
    do,1

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown






}


forma = {

    \time 2/2
    \key do\major
    \tempo 2 = 60
    \partial 8 s8
    \repeat volta 2 {
        s1*12
    }
    \alternative {{s1}{s}}\break
    \bar ".|:"
    \time 6/4
    \tempo 2. = 75
    \set Score.currentBarNumber = #14
    s1.*21\break
    \time 2/2
    \tempo 2 = 60
    s1*9
    \bar ":|."

}


IIds = {
    \IIglobal
    \notypeset
    <<\IIdsn \forma>>
}


IIhc = {
    \IIglobal
    <<\IIhcn \forma>>
}


IItl = {
    \IIglobal
    <<\IItln \forma>>
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

IIIdsn =  \relative do'' {

    re4 si re
    do4. si8 la4
    do re8 do si la

    %4
    si4. la8 sol4
    sol' mi sol
    fa4. mi8 re4

    %7
    fa sol8 fa mi re
    mi4. re8 do4
    si la sol

    %10
    re'4. mi8 fad4
    sol sol4. la8
    fad2.

    %13
    re4 mi fad
    sol4. sol8 re4
    mi fa?8 mi re do

    %16
    si4. la8 si do
    re4 mi8 re do si
    la4 la re

    %19
    sol,4. la8 fad sol
    la4 la si
    do do re

    %22
    mi4. mi8 re do
    si4. do8 re4
    mi la,4. sol8\mbreak

    %25
    sol4 sol'4. sol8
    fa mi re mi fa sol
    mi4. fad8 sol la

    %28
    fad4 re sol4~
    sol8 la fad4. sol8
    sol2.

}

IIIhcn = \relative do'' {

    si4 sol si
    la4. sol8 fad4
    sol la2

    %4
    sol4. la8 si4
    do2 do4
    do4. re8 si4

    %7
    do re2
    do4 sol fad
    sol re mi

    %10
    fad4. sol8 la4
    si4. si8 dod4
    re2.\mbreak

    %13
    fad,4 sol la
    si la sol
    sol fa?4. fa8

    %16
    mi4. fad8 sol la
    si4 la8 si la sol
    fad4 fad fad

    %19
    sol4. fad8 mi4
    fad fad sold
    la2.

    %22
    la
    sol?4. la8 si4
    la8 sol fad4. sol8

    %25
    sol4 re'4. re8
    re do si4. la8
    sol4. la8 si do

    %28
    la2 sol8 la
    si do la4. re8
    si2.

}

IIItln =  \relative do' {

    sol'4 re sol
    mi2 re4
    do la re

    %4
    re2.
    mi4 sol mi
    la2 sol4

    %7
    fa? re sol~
    sol2 la4
    re,2 mi4

    %10
    la2 re,4
    re mi2
    la2.\mbreak

    %13
    la4 sol fad
    re2 re4
    do8 do' si do si la

    %16
    sol4. sol8 fad mi
    re4 do mi
    re2 re4

    %19
    re dod2
    re2 re4
    mi2.

    %22
    r4 mi fad
    sol fad8 mi re4
    mi re4. do8

    %25
    si4 si si
    do re2
    do4 mi re

    %28
    re2.
    re8 mi re4. re8
    re2.

}

IIIbcn = \relative do {

    sol'2 sol4
    do,2 re4
    mi fad2

    %4
    sol2.
    mi
    re2 sol4

    %7
    la si2
    do4. si8 la4
    sol fad mi

    %10
    re re'8 do si la
    sol fa? mi4. re8
    re2.\mbreak

    %13
    re'
    sol,4 la si
    do re re,

    %16
    mi fa8 mi re do
    si4 do do
    re2 re4

    %19
    mi2.
    re4 do si
    la la si

    %22
    do do re
    mi re8 do si4
    do re2\mbreak

    %25
    sol, sol'4
    la si2
    do2 sol4

    %28
    re'4. do8 si [la]
    sol do, re2
    sol,2.

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 80
  s2.*12
  \bar":..:"\break
  s2.*18
  \bar":|."

}

IIIds = {
  \IIIglobal
  \notypeset
  <<\IIIdsn \forma>>

}

IIIhc = {
  \IIIglobal
  <<\IIIhcn \forma>>

}

IIItl = {
  \IIIglobal
  <<\IIItln \forma>>

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

IVdsn =  \relative do'' {

    la'8
    la2. sol8 fa
    sol4 sol sol fa8 mi
    fa2 la4. la8

    %4
    re,2 sol4. sol8
    dod,4 la fa'4. fa8\mbreak
    fa2 mi4. re8

    %7
    dod4 re re4. dod8
    re2 la'4. sib8
    fad4 re sol4. la8

    %10
    mi4 do2 do'4\mbreak
    sib la sol4.\prall fa8
    fa2 sol4.\prall fa16 sol

    %13
    la4 sib8 la sol4. fa8
    mi2. r4 mi1
    la4 la8 sib la sol

    %16
    fa4. mi8 fa sol
    la4. sol8 fa4
    sol2 sol4

    %19
    sib sib sib
    sib4. sib8 la4~\mbreak
    la8 sol sol4. fa8

    %22
    fa2.
    sol4. la8 sol fa
    mi4. fa8 sol4

    %25
    do, re si
    do2.
    mi4 la mi\mbreak

    %28
    fa sol la
    re, mi fa
    dod2.

    %31
    r4 la'\solo la la
    sol sol sol la8 sol
    fa2 r8 la sol fa\mbreak

    %34
    mi2 fa~
    fa mi4. mi8
    mi sol fa mi re2

    %37
    r8 fa mi re dod4. si16 dod
    re2. fa4\tu \mbreak
    mi2 la

    %40
    r8 do sib la sol2
    r8 sib la sol fad4. mi16 fad
    sol2 mi4. mi8

    %43
    fa2. fa4\mbreak
    sol2 la8 sol fad mi
    re4 re re re

    %46
    do do do re8 do
    sib2 r8 re do sib
    la4 fa'\solo fa fa\mbreak

    %49
    mi mi mi fa8 mi
    re2 r8 fa mi re
    dod4 re re4. dod8

    %52
    re2. la'4\tu
    la la sol sol
    sol la8 sol fa2

    %55
    r8 la sol fa mi4 fa
    sol2. sol4
    do,2 fa4 re

    %58
    mi2. mi4\mbreak
    re8 mi re do si4 mi8 re
    dod4 re re4. dod8

    %61
    re1

}

IVhcn = \relative do'' {

    re8
    re2. do4
    si si dod4. si8
    la4. si8 do4 la

    %4
    sib2. sib4
    la2 la4. la8\mbreak
    sol2. sol4

    %7
    fa re mi4. re16 mi
    fa2 mi4 mi'
    re2. re4

    %10
    do sol la4. la8\mbreak
    re4 do2 sib4
    la2 do4. do8

    %13
    do4 do sib4. sib8
    la2 r8 la si dod la1\mbreak
    do4 do do

    %16
    sib sib sib
    do do do
    do2 do4

    %19
    re re re
    do4. sib8 do4\mbreak
    re do4. sib8

    %22
    la2.
    do2 re4
    do4. re8 do sib

    %25
    la4 la sol
    sol2.
    do4 do dod\mbreak

    %28
    re sib la
    sib2 sib4
    la2.

    %31
    R1*2
    r4 re\solo re re\mbreak
    do do do re8 do

    %35
    sib2 r8 re do sib
    la2 r8 do sib la
    sol2 r8 sib la sol

    %38
    fa4 la\tu la si\mbreak
    do2. do4
    re re re re

    %41
    do do do re8 do
    sib2 r8 re do sib
    la2 si?\mbreak

    %44
    do2 r4 la
    la la sol sol
    sol la8 sol fa2

    %47
    r8 la sol fa mi2
    fa4 la\solo la la\mbreak
    sol sol sol la8 sol

    %50
    fa2 r8 la sol fa
    mi4 fa mi4. re8
    re4 la'\tu la si

    %53
    do2. sol8 la\mbreak
    sib2. fa8 sol
    la2. la4

    %56
    sib2 r8 re do sib
    la4 la la la
    sol sol sol la8 sol\mbreak

    %59
    fa2 r8 la sol fa
    mi4 fa mi la8 sol
    fad1

}

IVtln =  \relative do' {

    fa8
    fa2. mi8 re
    mi4 mi mi4. mi8
    re2 mi

    %4
    fa4 re2 mi4
    mi dod re4. re8\mbreak
    re2 dod4. si8

    %7
    la4 la sol4. la8
    la2 dod4. si8
    la2 si4. la8

    %10
    sol4 mi fa fa'\mbreak
    fa fa mi4. fa8
    fa4 re mi4. re8

    %13
    do4 fa mi4. re8
    dod2 r8 dod re mi dod1\mbreak
    fa4 fa8 sol fa mi

    %16
    re4. do8 re mi
    fa4. mi8 re4
    mi2 mi4

    %19
    sol sol sol
    sol4. sol8 fa4~\mbreak
    fa fa4. mi8

    %22
    fa2.
    mi2 sol4
    sol2 sol4

    %25
    fa fa re
    mi2.
    la4 la la\mbreak

    %28
    la sol8 fa mi4
    fa2 fa4
    mi2.

    %31
    R1*3\mbreak
    r4 la\solo la la
    sol sol sol la8 sol

    %36
    fa2 r8 la sol fa
    mi2 r8 sol fa mi
    re4 fa\tu fa re\mbreak

    %39
    sol2 mi
    fa sol
    la2. la4

    %42
    re,2 sol4. sol8
    do,4 re re re\mbreak
    do do do re8 do

    %45
    sib2 r8 re do sib
    la2 r8 la sib do
    re2 do4. do8

    %48
    do2 fa\solo\mbreak
    do2. la4
    sib8 do sib la sol2

    %51
    la4 sol la2
    re4 fa\tu fa fa
    mi mi mi fa8 mi\mbreak

    %54
    re2 r8 fa  mi re
    do2. do4
    re2 r4 mi

    %57
    mi mi re re
    re mi8 re dod4. si16 dod
    la4 re2 si?4

    %60
    la sib la4. la8
    la1

}

IVbcn = \relative do {

    re8
    re2 re'~
    re dod
    re do?

    %4
    sib sol
    la re,\mbreak
    mi2. mi4

    %7
    fa2 mi
    re dod
    do! si

    %10
    sib la\mbreak
    sib do
    fa, mi

    %13
    fa sol
    la la'8 sol fa mi la,1
    fa'4 fa fa

    %16
    sib4. sib8 la sol
    fa4 fa fa
    do'2 do4

    %19
    sol sol sol
    la4. sol8 la4\mbreak
    sib do do,

    %22
    fa2.
    do2 si4
    do4. re8 mi4

    %25
    fa re sol
    do,2.
    la4 la la\mbreak

    %28
    re, re' do
    sib la sol
    la2.

    %31
    R1*7
    r4 re'\tu re re
    do do do re8 do

    %40
    sib2 r8 re do sib
    la4 la la la
    sol sol sol  la8 sol

    %43
    fa2 r8 la sol fa\mbreak
    mi2 fad
    sol8 la sol fa? mi2

    %46
    fa r8 fa, sol la
    sib2 do
    fa, r

    %49
    R1*3
    r4 re'\tu re re
    do do do re8 do\mbreak

    %54
    sib2 r8 re do sib
    la4 la la la
    sol sol sol  la8 sol

    %57
    fa2 r8 la sol fa
    mi2 la\mbreak
    re, sol

    %60
    la4 sol la2
    re,1

}

IVbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/2
  \tempo 2 = 60
  \partial 8 s8
  \repeat volta 2 {s1*13}
  \alternative {{s1}{s}}\break
  \bar ".|"
  \set Score.currentBarNumber = #15
  \time 3/4
  \once\override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 60
  s2.*16
  \bar"||"\break
  \time 2/2
  \tempo 2 = 60
  s1*31
  \bar "|."

}

IVds = {
  \IVglobal
  \notypeset
  <<\IVdsn \forma>>

}

IVhc = {
  \IVglobal
  <<\IVhcn \forma>>

}

IVtl = {
  \IVglobal
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

Vdsn =  \relative do'' {

    r4  fa sol
    la mi la
    re, sol8 fa mi re

    %4
    dod4 la re
    mi fa sol
    si, dod re

    %7
    re mi dod
    re la' sib\mbreak
    fad mi fad

    %10
    sol sib8 la sol fa?
    mi4 do fa
    re mi fa

    %13
    mi la fa
    fa sol mi
    fa2. r4 fa sol fa2.\mbreak

    %16
    r4 do re
    mi re do
    sol' la8 sol fa mi

    %19
    fa4 re sol
    mi sol do,
    do re si

    %22
    do mi fad
    sol la sib\mbreak
    fad re sol

    %25
    sol fa? sol
    mi fad sol
    sol la8 sol la fad

    %28
    sol2.
    r4 re mi
    fa? sol la

    %31
    la sib sol\mbreak
    la2.
    r4 la sol  %%% ripresa

    %34
    fa sol la
    re, mi fa
    fa sol8 fa mi re

    %37
    dod2.
    r4 la' sol
    fa sol la

    %40
    mi fa re\mbreak
    re mi dod
    re2.

    %43
    r4 la' sol  %%% ripresa
    fa sol la
    re, mi fa

    %46
    fa sol8 fa mi re
    dod2.
    r4 la' sol

    %49
    fa sol la
    mi fa re\mbreak
    re mi dod

    %52
    re2.

}

Vhcn = \relative do'' {

    r4 la si
    do do la
    la sib sol

    %4
    la2 la4
    si?2 si4
    sol2 la4

    %7
    si2 la4
    la re mi\mbreak
    la,2 la4

    %10
    re4 re8 do sib la
    sol4 sol la
    fa mi re

    %13
    sol do la
    re sib do
    la2. r4 la si la2.\mbreak

    %16
    r4 la si
    do re mi
    do2 do4

    %19
    la2 re4
    do2 sol4
    la2 sol4

    %22
    sol sol la
    sib do re\mbreak
    re2 do4

    %25
    re re re
    do2 sib4
    re do8 sib do la

    %28
    sib2.
    r4 la sib
    la si? do

    %31
    re dod re\mbreak
    dod dod re
    mi2. %%% ripresa

    %34
    re2 la4
    sib2 la4
    sib2.

    %37
    la
    r4 re dod
    re2 do?4

    %40
    sib la sol\mbreak
    la sib la
    la2.

    %43
    mi'2. %%% ripresa
    re2 la4
    sib2 la4

    %46
    sib2.
    la
    r4 re dod

    %49
    re2 do?4
    sib la sol\mbreak
    la sib la

    %52
    la2.

}

Vtln =  \relative do' {

    r4 re fa
    mi do mi
    fa re4. do16 re

    %4
    mi2 fa4
    sol fa mi
    mi2 fa4

    %7
    sol sol mi
    fa2 mi4\mbreak
    re2 la4

    %10
    sib re re
    do2 do4
    sib la si

    %13
    do mi re
    re sol sol
    fa2. r4 re fa fa2.

    %16
    r4 fa fa
    mi fa sol
    mi fa8 mi re do

    %19
    re4 fa sol
    sol2 sol4
    fa fa re

    %22
    mi2.
    mi4 fad sol\mbreak
    la2 sol4

    %25
    si la si
    sol fad? mib
    re mib re

    %28
    re sib do
    re fa sol
    fa2 mi4

    %31
    fa mi re\mbreak
    mi2.
    r4 dod si? %%% ripresa

    %34
    la sib do
    re2 re4
    re mi mi

    %37
    mi mi mi
    fa sib la
    la2 fa4

    %40
    sol2 sol4\mbreak
    fa mi mi
    fad2.

    %43
    r4 dod si? %%% ripresa
    la sib do
    re2 re4

    %46
    re mi mi
    mi mi mi
    fa sib la

    %49
    la2 fa4
    sol2 sol4\mbreak
    fa mi mi

    %52
    fad2.

}

Vbcn = \relative do {

    re,4 re'2
    do2.
    sib

    %4
    la4 sol fa
    mi2.
    mi'2 re4

    %7
    sol mi la,
    re2 dod4\mbreak
    re2 do4

    %10
    sib sol2
    do4 sib la
    sib do re

    %13
    do la re
    sib sol do
    fa, fa' mi re re2 fa,2.

    %16
    fa'
    do
    do

    %19
    do2 si4
    do re  mi
    fa re sol

    %22
    do,2.
    sib4 la sol\mbreak
    re'2 mib4

    %25
    si!2.
    do4 re mib
    sib do re

    %28
    sol, sol la
    sib la sol
    re'2 do4

    %31
    sib2.\mbreak
    la4 la si?
    dod2. %%% ripresa

    %34
    re4 re' do
    sib do re
    sol,2.

    %37
    la4 la sol
    fa sol la
    re, mi fa

    %40
    sol la sib\mbreak
    fa sol la
    re,2.

    %43
    dod2. %%% ripresa
    re4 re' do
    sib do re

    %46
    sol,2.
    la4 la sol
    fa sol la

    %49
    re, mi fa
    sol la sib\mbreak
    fa sol la

    %52
    re,2.

}

Vbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  s2.
  \repeat volta 2 {s2.*13}
  \alternative {{s2.*2}{s2.}}\break
  \bar ".|"
  \set Score.currentBarNumber = #16
  s2.*37
  \bar"|."

}

Vds = {
  \Vglobal
  \notypeset
  <<\Vdsn \forma>>

}

Vhc = {
  \Vglobal
  <<\Vhcn \forma>>

}

Vtl = {
  \Vglobal
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

VIdsn =  \relative do'' {

    fa4. sol8 la4
    mi4. re8 dod4
    re4. mi8 fa4

    %4
    mi2\prall re4
    fa4.\prall sol8 la4
    mi4. re8 dod4

    %7
    re4. dod?8 si4
    dod2.
    do?4. sib8 la4

    %10
    sib4. do?8 re4
    sib4. do8 la4
    sol2 sol4

    %13
    sol'4. fa8 mi4
    fa4. sol8 mi4
    re4. do8 si4

    %16
    do2.\mbreak
    mi4. mi8 la4 %% ripresa
    fa4. mi8 fa4

    %19
    re4. mi8 fa4
    dod4. re8 mi4
    la,4. re8 do4

    %22
    si4. mi8 re4
    dod4. re8 mi4
    re2.

    %25
    mi4. mi8 la4 %% ripresa
    fa4. mi8 fa4
    re4. mi8 fa4

    %28
    dod4. re8 mi4
    la,4. re8 do?4
    si4. mi8 re4

    %31
    dod4. re8 mi4
    re2.

}

VIhcn = \relative do'' {

    la2 la8 si
    do4. sol8 la fa
    sib4. do8 re4

    %4
    re4. dod8 re4
    re4. re8 la si?
    do?4. sol8 la4

    %7
    la4. si8 sold4
    la2.\mbreak
    la4. sol?8 fa4

    %10
    fa4. mi8 fa4
    sol4. la8 fa4
    mi2 mi4

    %13
    si'4. la8 sol4
    do4. re8 do4
    la sol4. sol8

    %16
    sol2.\mbreak
    la2 la4
    la2 la4

    %19
    sol4. la8 sib4
    la2 mi4
    fad?4. sol8 la4

    %22
    sol4. fa8 sol4
    la2 la4
    la2.

    %25
    la2 la4
    la2 la4
    sol4. la8 sib4

    %28
    la2 mi4
    fad?4. sol8 la4
    sol4. fa8 sol4

    %31
    la2 la4
    la2.

}

VItln =  \relative do' {

    re4. mi8 fa4
    sol2 fa4
    fa4. fa8 sib4

    %4
    la4. sol8 fa4
    la4. sol8 fa4
    sol4. re8 mi4

    %7
    fa2 mi4
    mi2.\mbreak
    fa2 do4

    %10
    re2.
    re4. mi8 re4
    do2 do4

    %13
    re2 mi4
    la2 sol4
    fa4. mi8 re4

    %16
    mi2.\mbreak
    dod4. re8 mi4
    re2 la4

    %19
    re2 sol4
    mi2 mi4
    re2 re4

    %22
    re2.
    mi4. fad8 sol4
    fad2.

    %25
    dod4. re8 mi4
    re2 la4
    re2 sol4

    %28
    mi2 mi4
    re2 re4
    re2.

    %31
    mi4. fad8 sol4
    fad2.

}

VIbcn = \relative do {

    re2.
    do4. sib8 la4
    sib4. la8 sol4

    %4
    la2 re,4
    re'2.
    do4. sib8 la4

    %7
    re2 mi4
    la,2.\mbreak
    fa

    %10
    sib
    sol4. la8 sib4
    do2 do4

    %13
    si?2 do4
    la4. si8 do4
    fa, sol2

    %16
    do2.\mbreak
    la4. si8 dod4 %%% ripresa
    re4. do8 re4

    %19
    sib4. la8 sol4
    la2 sol4
    fad4. mi8 fad4

    %22
    sol4. la8 sib4
    la2.
    re,

    %25
    la'4. si8 dod4 %%% ripresa
    re4. do8 re4
    sib4. la8 sol4

    %28
    la2 sol4
    fad4. mi8 fad4
    sol4. la8 sib4

    %31
    la2.
    re,

}

VIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 70
  s2.*8
  \bar ":|."\break
  s2.*24
  \bar"|."

}

VIds = {
  \VIglobal
  \notypeset
  <<\VIdsn \forma>>

}

VIhc = {
  \VIglobal
  <<\VIhcn \forma>>

}

VItl = {
  \VIglobal
  <<\VItln \forma>>

}

VIbc = {
  \VIglobal
  \clef bass
  <<\VIbcn \forma \VIbfn>>
  \typeset

}

VIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##f
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \con
}

VIIdsn = \relative do'' {

    do2 do4. do8
    fa2. fa4
    fa2 sol4.\prall fa16 sol

    %4
    la4 fa sib4. sib8
    sib2 la4. la8
    la2 sol4. sol8\mbreak

    %7
    sol4 la8 sib sol4. fa8
    fa4 do fa4. sol8
    la4 sol8 fa mi4. fa8

    %10
    sol4 re mib4. mib8
    mib4 re re4. do8\mbreak
    do1
    do4. r8 sol' fad

    %13
    sol [fa mi fa mi re]
    mi4 fa8 re4 mi8
    do4 re8 sib4 do8\mbreak

    %16
    la [re sib mib re do]
    re [mi fa sol la sib]
    mi,4 fa8 fa sol mi

    %19
    fa8 [mib re mib re do]\mbreak
    re4 re8 do sib la
    sib4 sib'8 la sol fa

    %22
    sol4 la8 fa4 sol8
    do,4 fa8 mib4 fa8\mbreak
    re re mi fad sol la

    %25
    re,4 sol8 sol la fad
    sol [fa mi fa mi re]
    mi4 la8 re,4 sol8\mbreak

    %28
    mi4 fa8 sol fa sol
    do, [do' sib la sol fa]
    sib [sib la sol fa mi]

    %31
    la [sol fa sol fa mi]\mbreak
    fa [sol la re, mi dod]
    re [do si do si la]

    %34
    si4 do8 do re si
    do4. re8 mi fa\mbreak
    sol4 fa8 re4 mi8

    %37
    fa4 mi8 fa mi fa
    re [mi fa sol fa sol]
    mi4 fa8 fa sol mi\mbreak

    %40
    fa4.~fa8 sol [fad]
    fa1

}


VIIhcn = \relative do'' {

    la2 sol
    la4 sib do2
    sib2. sib4

    %4
    do la sol4. sol8
    sol2 fa4. fa8
    fa2 sol4. fa8\mbreak

    %7
    mi4 fa fa4. mi8
    fa sol la sib do4. sib8
    la4. sib8 do4. do8

    %10
    do4 si do4. do8
    do2 si4. la8\mbreak
    sol2 r8 mi fa sol
    sol4. r

    %13
    r4. r8 do si
    do [sib la sib la sol]
    la4 sib8 sol4 la8\mbreak

    %16
    fa[sib sol do sib la]
    sib[sol la sib do re]
    do4 do8 re8 do sib

    %19
    do4 sib8 do4 do8\mbreak
    sib4 sib8 sol4 fa8
    fa4 sib8 do do si

    %22
    do [sib la sib la sol]
    la4 sib8 sol4 la8\mbreak
    fad fad sol la4 la8

    %25
    sib[do re do do la]
    si4 do8 re do re
    do4 do8 sib4 si?8\mbreak

    %28
    la4. re8 do sib
    la[la sib do sib la]
    re re do sib4 sib8

    %31
    do4. dod8 re mi\mbreak
    la,4. sol8 sol mi
    fad mi re mi4 fad8

    %34
    re4 sol8 la mi fad?
    mi[fa sol la do si]\mbreak
    do[sib la sib la sol]

    %37
    la[re do do sib la]
    fa[sol la sib la sib]
    sol[do la sib sib sol]\mbreak

    %40
    la4.~la8 r r
    la1

}


VIItln = \relative do' {

    fa4 do8 re mi4 do
    re8 mi fa sol la2
    re, mi4. re16 mi

    %4
    fa2 mi4. re8
    do2 re4 mib
    re2. re4\mbreak

    %7
    do re do4. sib8
    la4 fa'8 sol la4 fa
    do do'8 sib la4 sib8 la

    %10
    sol4 sol sol4. fa16 sol
    la2 sol4. fa8\mbreak
    mi2 r8 do re mi
    mi4. r

    %13
    R2.
    r4. r8 fa mi
    fa [mib re mib re do]\mbreak

    %16
    re4 mib8 do4 re8
    sib sib' la sol4 sol8
    sol4 la8 fa4 sol8

    %19
    fa4 fa8 sol4 fa8\mbreak
    fa [mib re mib re do]
    re mi fa fa4 fa8

    %22
    mi re mi fa4 do8
    do4 re8 sib4 do8\mbreak
    la4. re8 mi fad

    %25
    sol[la sib mi, mi re]
    re4 do8 la la' sol
    sol4 do,8 re do si\mbreak

    %28
    do [sib la sib la sol]
    la la' sol fa4 fa8
    sol4 sol8 re re mi

    %31
    fa[mi re mi re dod]\mbreak
    re4 do8 si4 dod8
    la4 si8 la4 la8

    %34
    sol4. r8 sol' fad
    sol[fa mi fa mi re]\mbreak
    mi4 fa8 fa sol16 fa mi re

    %37
    do8 sib sol la sib do
    sib4. re4 re8
    do[sol' fa re re do]\mbreak

    %40
    do4.~do8 r r
    do1

}


VIIbcn = \relative do {

    fa2 mi
    re la
    sib sol

    %4
    fa sol
    la2. la4
    sib2 si\mbreak

    %7
    do4 sib do2
    fa,1
    fa'4. sol8 la4 sol8 fa

    %10
    mi4 sol do,2
    fa, sol\mbreak
    do r8 sib do re
    do4. r

    %13
    R2.*4
    r4. r8 do' si
    do [sib la sib la sol]

    %19
    la4 sib8 sib do la\mbreak
    sib4 mib, mib
    sib4 sib8 fa' mi re

    %22
    do4. r8 fa mi
    fa [mib re mib re do]\mbreak
    re4. r8 re do

    %25
    sib [la sol do la re]
    sol,4 do8 do do si
    do [sib la sib la sol]

    %28
    la4. sol
    fa fa'8 sol la
    sol [sol la sib la sol]

    %31
    fa4. mi\mbreak
    re8[mi fa sol mi la]
    re,4 sol8 sol la fad

    %34
    sol fa mi fa mi re
    mi4. re\mbreak
    do4 re8 sib4 do8

    %37
    la[sib do fa, sol la]
    sib4. sol8 la sib
    do4 re8 sib sol do\mbreak

    %40
    fa,4.~fa8 r r
    fa1

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp






}


forma = {

    \time 2/2
    \key fa\major
    \tempo 2 = 75
    \repeat volta 2 {
        s1*11
    }
    \alternative {{s1}{\time 6/8 \tempo 2. = 50 s2.}}\break
    \set Score.currentBarNumber = #13
    \bar".|:"
    \repeat volta 2{
        s2.*27
    }
    \alternative {{s2.}{\time 2/2 s1}}
    \bar "|."

}


VIIds = {
    \VIIglobal
    \notypeset
    <<\VIIdsn \forma>>
}


VIIhc = {
    \VIIglobal
    <<\VIIhcn \forma>>
}


VIItl = {
    \VIIglobal
    <<\VIItln \forma>>
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

VIIIdsn =  \relative do'' {

    do4
    fa4. mi8 fa4 sol fa sol
    la4. sol8 la4 fa la2
    re,4. mi8 fa4 do re2

    %4
    la fa'4 re mi fa\mbreak
    mi do fa sol la sib
    la4. sol8 la4 mi fad2

    %7
    sol4. re8 mi4 do re si
    do2.~do2 do4
    sol'4. fa8 mi4 fa re sol

    %10
    mi4. re8 do4 fa sol2
    la4. mi8 fa4 re mi2
    dod4. dod8 re4 re mi dod\mbreak

    %13
    re4. mi8 fa4 mi fad sol
    fad4. fad8 sol4 la fad2
    sol4. fa?8 mi4 fa sol2

    %16
    do,4. re8 mib4 re mi? fa\mbreak
    mi4. mi8 fa4 fa sol mi
    fa2.~fa2

}

VIIIhcn = \relative do'' {

    la4
    do4. do8 re4 mi re do
    do2 do4 re do2
    sib do4 fa, fa mi

    %4
    fa2 fa4 fa sib la\mbreak
    sol2 la4 sib2 do4
    do2 do4 si la2

    %7
    si4. si8 do4 la la sol
    sol2.~sol2 sol4
    sol2 do4 la2 si4

    %10
    sol2 la sib
    do do4 sib sib2
    la la4 sol2 la4\mbreak

    %13
    la2 si4 do sib? sol
    re'2 re4 mib re2
    si4 la sol la sib? sol

    %16
    la4. sib8 do4 sib4. do8 re4\mbreak
    do2 do4 re re do
    do2.~do2

}

VIIItln =  \relative do' {

    fa4
    la4. sol8 fa4 mi la sol
    fa4. sol8 fa4 re fa2
    fa4. sol8 la4 la, sib2

    %4
    do2 do4 sib2 re4\mbreak
    do2 do4 re2 sol4
    fa4. sol8 fa4 mi do2

    %7
    re4 sol sol fa fa re
    mi2.~mi2 mi4
    mi4. re8 do4 re2 re4

    %10
    do4. re8 mi4 do re mi
    fa2 do4 re sol2
    mi4. mi8 fa4 re sol mi\mbreak

    %13
    fa2 re4 sol re sol
    la4. la8 sib4 la la2
    sol4  si, do re mi2

    %16
    fa fa4 fa sib la\mbreak
    sol4. sol8 la4 la sib sol
    la2.~la2

}

VIIIbcn = \relative do {

    fa4
    fa4. mi8 re4 do re  mi
    fa4. mi8 fa4 sib, la2
    sib la sol

    %4
    fa4 sol la sib2 si4\mbreak
    do sib la sol fa mi
    fa4. mi8 fa4 sol la2

    %7
    sol do4 fa, re sol
    do,2.~do2  do'4
    do2. do2 si4

    %10
    do2 la sol
    fa4. sol8  la4 sib sol2
    la4. sol8 fa4 sol mi la\mbreak

    %13
    re,2 re'4 do re mib
    re4. do8 sib4 do re2
    sol, do sib

    %16
    la la4 sib2 si4\mbreak
    do4. sib8 la4 sib sol do
    fa,2.~fa2

}

VIIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 6/4
  \tempo 1. = 55
  \partial 4 s4
  s1.*7
  s2. s2
  \bar":..:"\break
  s4
  s1.*9
  s2. s2
  \bar":|."

}

VIIIds = {
  \VIIIglobal
  \notypeset
  <<\VIIIdsn \forma>>

}

VIIIhc = {
  \VIIIglobal
  <<\VIIIhcn \forma>>

}

VIIItl = {
  \VIIIglobal
  <<\VIIItln \forma>>

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

IXdsn =  \relative do'' {

    fa2 do4. sib16 do
    re2 re4. re8
    do4. sib8 la4 sib8 do

    %4
    sib2 sib4. do8
    la4. sib8 do4 sib8 la\mbreak
    sol2 sol'4. sol8

    %7
    sol4 fa8 mi fa4. sol8
    la2 re,4. mi8
    fa4 mi8 fa re4. do8

    %10
    do1\mbreak
    sol'2 mi4. do8
    sol'2 sol4. sol8

    %13
    la4 sib8 la sol4. fa8
    mi2 la4. re,8
    dod4. re8 re4. dod8\mbreak

    %16
    re2 re4. mi8
    fa4 mi8 re do4. sib8
    la2 la'4. sol8 %% ripresa

    %19
    fa4 mi8 re sol4. sol8
    sol4 do, fa4. sol8
    mi4. sol8 sol4. fa8

    %22
    fa1 fa2 la4. sol8 %% ripresa
    fa4 mi8 re sol4. sol8
    sol4 do, fa4. sol8

    %25
    mi4. sol8 sol4. fa8
    fa1

}

IXhcn = \relative do'' {

    do2 la4. sol8
    fa2. sol4
    sol2 fad4. mi16 fad

    %4
    sol2 mi4. mi8
    fa?4 do fa sol8 fa\mbreak
    mi4 mi' re4. re8

    %7
    mi4 re8 do fa,4 sib
    do2 sib4. sib8
    do4 do do4. si8

    %10
    do1\mbreak
    do2 do4. do8
    re2 mi4. re8

    %13
    do4 re2 mi4
    dod2 la4. sib!8
    la4. la8 la4. sol8\mbreak

    %16
    fad2 fa4. sol8
    la2 sol
    fa4. do'8 re2

    %19
    la re
    do2. re4
    do4. re8 do4. sib8

    %22
    la1 la2 re2
    la re
    do2. re4

    %25
    do4. re8 do4. sib8
    la1

}

IXtln =  \relative do' {

    la'2 fa4. mi8
    re2 sib4. sib8
    do2. do4

    %4
    re2 do4. do8
    do2. re4\mbreak
    do2 re4. re8

    %7
    do2 re4. mi8
    fa2 fa4. sol8
    la4 sol sol4. fa8

    %10
    mi1\mbreak
    mi2 sol
    si4. la8 sol4 mi

    %13
    fa2 sib?
    la4 mi fa2
    mi4. fa8 mi4. re8\mbreak

    %16
    re4 la sib2
    do4. re8 mi4. re8
    do2 fa4. mi8

    %19
    re2. re4
    mi2 la
    sol4 mi8 fa fa4. mi8

    %22
    fa1 fa2 fa4. mi8
    re2. re4
    mi2 la

    %25
    sol4 mi8 fa fa4. mi8
    fa1

}

IXbcn = \relative do {

    fa,2 la
    sib sib4. sib8
    la2.  la4

    %4
    sol2 do
    fa,4. sol8 la4 sib\mbreak
    do2 si

    %7
    sib! la4. sol8
    fa2 sib
    la4 do sol2

    %10
    do,1\mbreak
    do'2 do'
    si4. sol8 do2

    %13
    fa, sol
    la fa4. sol8
    la4. re,8 la2\mbreak

    %16
    re4. do8 sib2
    fa mi
    fa4. mi8 re2 %%% ripresa

    %19
    re'4. do8 si2
    do4. sib8 la4 sib
    do4. sib8 do4 do,

    %22
    fa1 fa4. mi8 re2 %%% ripresa
    re'4. do8 si2
    do4. sib8 la4 sib

    %25
    do4. sib8 do4 do,
    fa1

}

IXbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/2
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 50
  s1*10
  \bar ":..:"\break
  \repeat volta 2 {s1*11}
  \alternative {{s1}{s}}%\break
  \mark\markup\italic"[Reprise]"
  \set Score.currentBarNumber = #23
  s1*4
  \bar"|."

}

IXds = {
  \IXglobal
  \notypeset
  <<\IXdsn \forma>>

}

IXhc = {
  \IXglobal
  <<\IXhcn \forma>>

}

IXtl = {
  \IXglobal
  <<\IXtln \forma>>

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

Xdsn =  \relative do'' {

    la'8 sol la sib la4
    sol\prall la8 sol fa4
    fa8 mi fa sol la4

    %4
    sol4.\prall fa16[sol la8 fa]\mbreak
    la8 sol la sib la4
    sol\prall la8 sol fa4

    %7
    fa8 mi fa sol la4
    sol4. -\parenthesize \prall  fa8 fa4
    la8 sib la sol fa4 mi\prall re8 mi fa4  %%% 2 rit.

    %10
    do8 si do re mi4
    fa sol8 fa mi4
    sol8 fa sol la sib4

    %13
    sol\prall fa8 sol la4\mbreak
    re,8 do re mi fa4
    fa4. mi8 fa4

}

Xhcn = \relative do'' {

    fa8 mi fa sol fa4
    mi\prall fa8 mi re4
    re8 do re mi fa4

    %4
    fa4.\prall mi8 fa do\mbreak
    fa8 mi fa sol fa4
    mi\prall fa8 mi re4

    %7
    re8 do re mi fa4
    fa4.\prall mi8 fa4
    fa8 sol fa mi re4

    %10
    do8 re do sib la4
    la8 sol la si do4
    si\prall la8 si do4

    %13
    sib?8 la sib do re4
    do8 sib do re do4\mbreak
    sib do8 sib la4

    %16
    sol2\prall la4

}

Xtln =  \relative do' {

    R2.*16

}

Xbcn = \relative do {

    fa2.
    do2 re4
    sib2 la4

    %4
    do2 fa,4\mbreak
    fa'2.
    do2 re4

    %7
    sib2 la4
    do2 fa,4
    fa'2 sib,4

    %10
    do2 fa,4
    fa'2 mi4
    re2 do4

    %13
    mib2 re4
    mi?2 fa4\mbreak
    sol2 fa4

    %16
    do2 fa,4

}

Xbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 70
  s2.*8
  \bar"||"\break
  \mark \markup \huge  {"                      [11]  2.de ritor[nelle]"}
  s2.*8
  \bar"||"

}

Xds = {
  \Xglobal
  %\notypeset
  <<\Xdsn \forma>>

}

Xhc = {
  \Xglobal
  <<\Xhcn \forma>>

}

Xtl = {
  \Xglobal
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

XIdsn =  \relative do'' {

    fa8 mi fa sol  la4 %%% 3 rit.
    la sib8 la sol4
    sol la8 sol fa4

    %4
    fa4. mi8 fa4
    mi8 re mi fa sol4
    sol la8 sol fad4\mbreak

    %7
    sol8 fa mi4 fa8 mi
    re4 do8 si do4
    fa8 mi fa sol la4

    %10
    la sib8 la sol4
    sol la8 sol fa4
    fa4. mi8 fa4

    %13
    fa8 mi fa sol la4
    la sib8 la sol4
    sol la8 sol fa4

    %16
    fa4. mi8 fa4

}

XIhcn = \relative do'' {

    la8 sol la sib do4
    re2 do4
    do2 re4

    %4
    do4. sib8 la4
    do2 re4
    do do re8 do\mbreak

    %7
    si4 do la
    sol sol8 fa mi4
    la8 sol la sib do4

    %10
    re2 do4
    do2 re4
    do4. sib8 la4

    %13
    la8 sol la sib do4
    re2 do4
    do2 re4

    %16
    do4. sib8 la4

}

XItln =  \relative do' {

    fa2 fa4
    fa sol8 fa mi4
    la2 la4

    %4
    sol2 fa4
    sol8 fa sol la sib sol
    la2.\mbreak

    %7
    re,4 mi do
    si do8 re do4
    do2 fa4

    %10
    fa sol8 fa mi4
    la2 la4
    sol2 fa4

    %13
    do2 fa4
    fa sol8 fa mi4
    la2 la4

    %16
    sol2 fa4

}

XIbcn = \relative do {

    fa2 fa,4
    sib2 do4
    la2 sib4

    %4
    do2 fa,4
    do'2 sib4
    la2.\mbreak

    %7
    sol4 do fa,
    sol2 do4
    la2. %% rip.

    %10
    sib2 do4
    la2 sib4
    do2 fa,4

    %13
    la2. %% rip.
    sib2 do4
    la2 sib4

    %16
    do2 fa,4

}

XIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 70
  s2.*16
  \bar"|."

}

XIds = {
  \XIglobal
  %\notypeset
  <<\XIdsn \forma>>

}

XIhc = {
  \XIglobal
  <<\XIhcn \forma>>

}

XItl = {
  \XIglobal
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

XIIdsn =  \relative do'' {

    fa2 fa4. mi8
    fa2. sol4
    la4. re,8 sol4. sol8

    %4
    sol2 do,
    fa mib4. fa8
    re2. sol8 fa\mbreak

    %7
    mi4 fa8 sol re4. do8
    do1
    sol'2 re4. sol8

    %10
    mi2 do4. do8
    fa4 mi8 re do4. sib8
    la2 la'4. la8\mbreak

    %13
    la2 sol4. sol8
    sol2. fa8 mi
    fa4. sol8 sol4. fa8

    %16
    fa1

}

XIIhcn = \relative do'' {

    do2 do4. sib8
    la2. sib4
    do sib re4. re8

    %4
    mi2. re4
    do2. do4
    sib2. sib4\mbreak

    %7
    la la sol4. sol8
    mi1
    mi2 sol4. sol8

    %10
    sol2 la4. sib8
    do2 sol4. la8
    fa2 r8 la sib do\mbreak

    %13
    re2 r8 sol, la sib
    do2. sib4
    la re do4. sib8

    %16
    la1

}

XIItln =  \relative do' {

    la'2 sol
    fa2. mi4
    fa fa sib4. sib8

    %4
    sib2 sol
    la sol4. la8
    fa2. sol4\mbreak

    %7
    do, re si4. do8
    do1
    do2 re4. re8

    %10
    do2 mi4. mi8
    la,2 do4. do8
    do do re mi fa4. fa8\mbreak

    %13
    fa2 re4 sol
    mi8 mi fa sol la4. sol8
    fa4 fa fa4. mi8

    %16
    fa1

}

XIIbcn = \relative do {

    fa2 do
    re do4. sib8
    la4 sib sol2

    %4
    do2. sib4
    la2. fa4
    sib2. sol4\mbreak

    %7
    la fa sol2
    do,1
    do'2 si

    %10
    do4. sib?8 la4. sol8
    fa2 mi
    fa r8 fa sol la\mbreak

    %13
    sib2. sol4
    la2 r8 la sib do
    re4 sib do do,

    %16
    fa1

}

XIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/2
  \tempo 2 = 50
  s1*8
  \bar ":..:"
  s1*8
  \bar":|."

}

XIIds = {
  \XIIglobal
  %\notypeset
  <<\XIIdsn \forma>>

}

XIIhc = {
  \XIIglobal
  <<\XIIhcn \forma>>

}

XIItl = {
  \XIIglobal
  <<\XIItln \forma>>

}

XIIbc = {
  \XIIglobal
  \clef bass
  <<\XIIbcn \forma \XIIbfn>>
  \typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper {
    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2
}

\header {
    title = \markup\smaller "Le Malade imaginaire - Suite"
    %subtitle = \markup\tiny "  "
    composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
}

\markup \huge  {"[1.] Ouverture du Prologue du malade imaginaire dans sa splendeur"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \key re\major\time 4/4  re''4.^\markup \center-align\smaller"[Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \Ids
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 4/4  la'2^\markup \center-align\column\smaller{"[Haute"\vspace #-0.4"-contre]"}}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Ihc
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key re\major\time 4/4 fad'4.^\markup \center-align\smaller"[Taille]"}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \Itl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
            \set Staff.midiInstrument = #"cello"
            \Ibc
        >>
    >>


    \layout {

        indent = 2\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\pageBreak

\markup \huge  {"[2.] Le Malade imaginaire avec les défenses - Ouverture"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \IIds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \IItl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>


    \layout {

        indent = 0\cm
        %incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\pageBreak

\markup \huge  {"[3.] Air des Archers"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \IIIds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIIhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \IIItl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>


    \layout {

        indent = 0\cm
        %incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\pageBreak

\markup \huge  {"[4.] Entrée des Mores"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \IVds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IVhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \IVtl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \IVbc
        >>
    >>


    \layout {

        indent = 0\cm
        %incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\markup \huge  {"[5.] Air des Mores"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \Vds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \Vhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \Vtl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \Vbc
        >>
    >>


    \layout {

        indent = 0\cm
        %incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\pageBreak

\markup \huge  {"[6.] Canaries"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \VIds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \VItl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \VIbc
        >>
    >>


    \layout {

        indent = 0\cm
        %incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\markup \huge  {"[7.] Cérémonie des Médecins - Ouverture"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \VIIds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIIhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \VIItl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \VIIbc
        >>
    >>


    \layout {

        indent = 0\cm
        %incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\markup \huge  {"[8.] Les Tapissiers"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \VIIIds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \VIIIhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \VIIItl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \VIIIbc
        >>
    >>


    \layout {

        indent = 0\cm
        %incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\markup \huge  {"[9.] La marche"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \IXds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IXhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \IXtl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \IXbc
        >>
    >>


    \layout {

        indent = 0\cm
        %incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\markup \huge  {"[10.] [1.re] ritornelle"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef french
            \set Staff.midiInstrument = #"recorder"
            \Xds
        >>

        \new Staff <<
            \clef french
            \set Staff.midiInstrument = #"violin"
            \Xhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \Xtl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \Xbc
        >>
    >>


    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\markup \huge  {"[12.] 3.me ritornelle"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"recorder"
            \XIds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \XItl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \XIbc
        >>
    >>


    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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

\markup \huge  {"[13.] Le remerciement"}

\score {

    \new ChoirStaff <<

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIIds
        >>

        \new Staff <<
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \XIIhc
        >>

        \new Staff <<
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \XIItl
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \XIIbc
        >>
    >>


    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
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
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
