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
  \terzinequarto\con
}


IvlIn =  \relative do'' {

  R2.*11
  sol'8 sol sol sol si sol
  fad fad fad fad si fad

  %14
  \parenthesize fad fad fad fad si fad
  mi mi mi mi la mi
  mi mi mi mi la mi

  %17
  red fad fad fad la fad
  sol mi mi mi si' sol
  fad red red red la' fad

  %20
  sol mi mi mi si' sol
  fad red red red la' fad
  sol mi mi mi fad red

  %23
  mi mi mi mi fad red
  mi4 r r\mbreak
  R2.*13

  %38
  re8 re re re fad re
  dod dod dod dod fad dod
  dod? dod dod dod fad dod

  %41
  si si si si mi si
  si si si si mi si
  lad dod dod dod mi dod

  %44
  re si si si fad' re\mbreak
  dod lad lad lad mi ' dod
  re si si si fad' re

  %47
  dod lad lad lad mi' dod
  re si' si si dod lad
  si si si si dod lad

  %50
  si4 r r
  R2.*14
  do,8 do do do mi do\mbreak

  %66
  si si si si mi si
  si si si si mi si
  la la la la re la

  %69
  la la la la re la
  sold si si si re si
  do la la la mi' do

  %72
  si sold sold sold re' si
  do la' la la si sold
  la la la la si sold

  %75
  la4 r r
  R2.*4
  sol8 sol sol sol si sol

  %81
  fad fad fad fad si fad
  sol sol sol sol si sol
  fad red red si si4

  %84
  R2.*7
  sol'8 sol sol sol si sol
  fad fad fad fad si fad

  %93
  sol sol sol sol si sol
  fad red red si si4
  R2.*3

  %98
  sol'8 sol sol sol si sol
  fad fad fad fad si fad
  fad fad fad fad si fad

  %101
  mi mi mi mi la mi\mbreak
  mi mi mi mi la mi
  red fad fad fad la fad

  %104
  sol mi mi mi si' sol
  fad red red red la' fad
  sol mi mi  mi si' sol

  %107
  fad red red red la' fad
  sol mi mi mi fad red
  mi mi mi mi fad red

  %110
  mi2.

}

IvlIIn = \relative do'' {

  R2.*11
  mi8 mi mi mi sol mi
  red red red red fad red

  %14
  re! re re re fad re
  dod dod dod dod mi dod
  do! do do do mi do

  %17
  si red red red fad red
  mi si si si sol' mi
  red si si si fad' red

  %20
  mi si si si sol' mi
  red si si si fad' red
  mi sol sol sol la fad

  %23
  mi sol, sol sol la fad
  mi4 r r\mbreak
  R2.*13

  %38
  si'8 si si si re si
  lad lad lad lad dod lad
  la! la la la dod la

  %41
  sold sold sold sold si sold
  sol! sol sol sol si sol
  fad lad lad lad dod lad

  %44
  si fad fad fad re' si\mbreak
  lad fad fad fad dod' lad
  si fad fad fad re' si

  %47
  lad fad fad fad dod' lad
  si re re re mi dod
  re re re re mi dod

  %50
  re4 r r
  R2.*14
  la8 la la la do la\mbreak

  %66
  sold sold sold sold si sold
  sol! sol sol sol si sol
  fad fad fad fad la fad

  %69
  fa! fa fa fa la fa
  mi sold sold sold si sold
  la mi mi mi do' la

  %72
  sold mi mi mi si' sold
  la do do do re si
  do do do do re si

  %75
  do4 r r
  R2.*4
  mi8 mi mi mi sol mi

  %81
  red red red red fad red
  mi mi mi mi sol mi
  red si si fad fad4

  %84
  R2.*7
  mi'8 mi mi mi sol mi
  red red red red fad red

  %93
  mi mi mi mi sol mi
  red si si fad fad4
  R2.*3

  %98
  mi'8 mi mi mi sol mi
  red red red red fad red
  re! re re re fad re

  %101
  dod dod dod dod mi dod\mbreak
  do! do do do mi do
  si red red red fad red

  %104
  mi si si si sol' mi
  red si si si fad' red
  mi si si si sol' mi

  %107
  red si si si fad' red
  mi sol sol sol la fad
  sol sol sol sol la fad

  %110
  sol2.

}

Ivlan = \relative do'{

  R2.*11
  si'8 si si si si si
  si si si si si si

  %14
  si si si si fad  fad
  la la la la la la
  la la la la la la

  %17
  fad fad fad si, si si
  si si si si si si
  si si si si si si

  %20
  si si si si si si
  si si si si si si
  si si' si si do si

  %23
  sol si, si si do si
  sol4 r r\mbreak
  R2.*13

  %38
  fad'8 fad fad fad fad fad
  fad fad fad fad fad fad
  fad fad fad fad dod dod

  %41
  mi mi mi mi mi mi
  mi mi mi mi mi mi
  dod dod dod dod dod dod

  %44
  fad fad fad fad fad fad\mbreak
  fad fad fad fad fad fad
  fad fad fad fad fad fad

  %47
  fad fad fad fad fad fad
  fad fad fad fad sol fad
  fad fad fad fad sol fad

  %50
  fad4 r r
  R2.*14
  mi8 mi mi mi mi mi\mbreak

  %66
  mi mi mi mi mi mi
  mi mi mi mi si si
  re re re re re re

  %69
  fa fa fa fa fa fa
  si, si si si si si
  mi mi mi mi mi mi

  %72
  mi mi mi mi mi mi
  mi mi mi mi fa mi
  mi mi mi mi fa mi

  %75
  mi4 r r
  R2.*4
  si'8 si si si si si

  %81
  si si si si si si
  si si si si si si
  si fad! fad red red4

  %84
  R2.*7
  si'8 si si si si si
  si si si si si si

  %93
  si si si si si si
  si fad fad red red4
  R2.*3

  %98
  si'8 si si si si si
  si si si si si si
  si si si si fad fad

  %101
  la la la la la la\mbreak
  do! do do do do do
  fad, fad fad fad fad fad

  %104
  si, si si si si si
  si si si si si si
  si si si si si si

  %107
  si si si si si si
  si si' si si do si
  si si si si do si

  %110
  si2.

}

Ivcn = \relative do{

  mi'4 \appoggiatura mi8 fad4. sol8
  \appoggiatura sol fad4. sold8 la4
  red,(mi) do

  %4
  \appoggiatura red?8 do2\tr si4
  mi sol \appoggiatura fad8 mi4
  \appoggiatura re8 do4.(re16 si) do4

  %7
  re fad \appoggiatura mi8 re4
  \appoggiatura do8 si4.(do16 la) si4
  mi~\tuplet 3/2 { mi8 re (do si la fad')}

  %10
  \appoggiatura mi8 red4. si8 mi (re?16 do
  si8) sol' \appoggiatura mi red4.\tr mi8\mbreak
  mi \clef bass mi, mi mi mi mi

  %13
  si' si si si si si
  si, si si si si si
  dod dod dod dod dod dod

  %16
  la la la la la la
  si si si si si si
  si si si si si si

  %19
  si si si si si si
  si si si si si si
  si si si si si si

  %22
  mi mi mi mi la, si
  mi mi mi mi la, si
  mi,4 r r\mbreak

  %25
  \clef tenor mi''(fad) sol
  \appoggiatura si, lad2\tr si4
  mi(re) dod

  %28
  re16(si8.) dod16(lad8.) si4
  re16(mi fad re) si(do? re si) fad sol la fad
  \grace fad8 sol4. fad8 mi4

  %31
  mi'16 fad sol mi dod re mi dod lad si dod lad
  fad4. mid16[(fad sold fad mid fad)]
  dod'?4. mid,16[(fad sold fad  mid fad)]\mbreak

  %34
  re'4. mid,16[(fad sold fad mid fad)]
  mi'?8.(re16) re8.(dod?16) dod8.(re16)
  re8 \clef bass dod?16-.[(si-. lad-. sold-. fad-. mi-. re-. dod?-. si-. lad-.)]

  %37
  si8 mi' dod4.\tr si8
  fad\clef bass si, si si si si
  fad' fad fad fad fad fad

  %40
  fad fad fad fad fad fad
  sold sold sold sold sold sold
  mi mi mi mi mi mi

  %43
  fad fad fad fad fad fad
  fad fad fad fad fad fad\mbreak
  fad fad fad fad fad fad

  %46
  fad fad fad fad fad fad
  fad fad fad fad fad fad
  si, si si si mi fad

  %49
  si, si si si mi fad
  si,4 r r
  \clef tenor si'(dod) re

  %52
  \appoggiatura fad,8 mid2 fad4
  si16 si(dod re dod8) si(la sold
  la16) sold(fad) mid(\appoggiatura mid8 fad2)

  %55
  fad'4 sold la
  \appoggiatura dod,8 sid2 dod4\mbreak
  fad16 fad(sold la sold8) fad(mi red

  %58
  mi16) red(dod? sid) \appoggiatura sid8 dod2
  dod?16 dod(re? mi re8 dod! si la)
  sold (fad16 mi) si'8 la16 sold re'8 do!16 si

  %61
  do4. mi16[(re do la si do)]
  fa,4. fa'16[(mi re si do re)]
  sold,4. si16[(do re si mi si)]

  %64
  do(la mi' la,) si4.\tr la8
  la \clef bass la, la la la la
  mi' mi mi mi mi mi

  %67
  mi mi mi mi mi mi
  fad fad fad fad fad fad
  re re re re re re

  %70
  mi mi mi mi mi mi
  mi mi mi mi mi mi
  mi mi mi mi mi mi

  %73
  la, la la la re mi
  la, la la la re mi
  la,4 r r

  %76
  \clef tenor mi''4 \appoggiatura mi8 fad!4. sol8
  \appoggiatura sol fad4. sold8 la4\mbreak
  red, mi do

  %79
  do2\tr si4
  \clef bass mi,8 mi  mi mi mi mi
  si si si si si si

  %82
  mi mi mi mi mi mi
  si si si si si si
  \clef tenor mi'4(sol) \appoggiatura fad8 mi4

  %85
  \appoggiatura re?8 do4.(re16 si) \appoggiatura si8 do4
  re(fad) \appoggiatura mi8 re4
  \appoggiatura do8 si4.(do16 la) \appoggiatura la8 si4

  %88
  mi~\tuplet 3/2 { mi8 re (do si[la mi')] }
  red4. si8[mi(re?16 do]
  si8) sol' \appoggiatura mi red4. mi8

  %91
  mi\clef bass mi, mi mi mi mi
  si si si si si si
  mi mi mi mi mi mi

  %94
  si si si si si si
  \clef tenor si'4 red fad
  sol4. la8 si4

  %97
  mi,red4.\tr mi8
  mi \clef bass mi, mi mi mi mi
  si si si si si si

  %100
  si si si si si si
  dod dod dod dod dod dod\mbreak
  la la la la la la

  %103
  si si si si si si
  si si si si si si
  si si si si si si

  %106
  si si si si si si
  si si si si si si
  mi mi mi mi la, si

  %109
  mi mi mi mi la, si
  mi,2.

}

Ibcn = \relative do {

  mi2._\markup\italic"Fagotto Solo"
  la
  si4 sol red

  %4
  mi8 red mi fad sol mi
  sol2.
  la4. si8 la sol

  %7
  fad2.
  sol4. la8 sol fad
  mi4 sol la

  %10
  si8 do si la sol4~
  sol8 mi si'4 si,\mbreak
  mi8\tu mi mi mi mi mi

  %13
  si' si si si si si
  si, si si si si si
  dod dod dod dod dod dod

  %16
  la la la la la la
  si si si si si si
  si si si si si si

  %19
  si si si si si si
  si si si si si si
  si si si si si si

  %22
  mi mi mi mi la, si
  mi mi mi mi la, si
  mi,4 r r\mbreak

  %25
  mi'2._\markup\italic"Fagotto Solo"
  fad4 mi8 re dod si
  lad2.

  %28
  si4 fad'8 mi re dod
  si2.
  mi4 mi8 fad sol mi

  %31
  dod2.
  fad2 r4
  fad2 r4\mbreak

  %34
  fad2 r4
  fad2.
  si,4 r r

  %37
  si8 mi fad4 fad,
  si8\tu si si si si si
  fad' fad fad fad fad fad

  %40
  fad fad fad fad fad fad
  sold sold sold sold sold sold
  mi mi mi mi mi mi

  %43
  fad fad fad fad fad fad
  fad fad fad fad fad fad\mbreak
  fad fad fad fad fad fad

  %46
  fad fad fad fad fad fad
  fad fad fad fad fad fad
  si, si si si mi fad

  %49
  si, si si si mi fad
  si,4 r r
  si2._\markup\italic"Fagotto Solo"

  %52
  dod4 si8 la sold fad
  mid2.
  fad

  %55
  la'
  sold4 fad8 mi red dod?
  sid2.

  %58
  dod
  la'4 fad2
  mi2.

  %61
  la,8 si do! si do la
  re mi fa  mi fa re
  mi fad? sold fad sold mi

  %64
  la la, mi'4 mi,
  la8\tu la la la la la\mbreak
  mi' mi mi mi mi mi

  %67
  mi mi mi mi mi mi
  fad fad fad fad fad fad
  re re re re re re

  %70
  mi mi mi mi mi mi
  mi mi mi mi mi mi
  mi mi mi mi mi mi

  %73
  la, la la la re mi
  la, la la la re mi
  la,4 r r

  %76
  mi'2._\markup\italic"Fagotto Solo"
  la
  si4 sol la

  %79
  red,2 mi4
  mi8\tu mi mi mi mi mi
  si si si si si si

  %82
  mi mi mi mi mi mi
  si si si si si si
  sol'2._\markup\italic"Fagotto Solo"

  %85
  la4. si8 la sol
  fad2.
  sol4. la8 sol fad

  %88
  mi4 la,2
  si'8 do si la sol4~
  sol8 mi si'4 si,

  %91
  mi8\tu mi mi mi mi mi
  si si si si si si
  mi mi mi mi mi mi

  %94
  si si si si si si
  si2._\markup\italic"Fagotto Solo"
  mi4. fad8 sol4

  %97
  la si si,
  mi8\tu mi mi mi mi mi
  si si si si si si

  %100
  si si si si si si
  dod dod dod dod dod dod\mbreak
  la la la la la la

  %103
  si si si si si si
  si si si si si si
  si si si si si si

  %106
  si si si si si si
  si si si si si si
  mi mi mi mi la, si

  %109
  mi mi mi mi la, si
  mi,2.

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key mi\minor
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 50
  s2.*10
  s2.
  \mark\markup"                    All[egr]o molto"
  \tempo 2. = 60
  s2.*12
  s2.
  \mark\markup"                    Ad[agi]o"
  \tempo 4 = 50
  s2.*12
  s2.
  \mark\markup"                    All[egr]o"
  \tempo 2. = 60
  s2.*12
  s2.
  \mark\markup"                    Ad[agi]o"
  \tempo 4 = 50
  s2.*13
  s2.
  \mark\markup"                    All[egr]o"
  \tempo 2. = 60
  s2.*10
  s2.
  \mark\markup"                    Ad[agi]o"
  \tempo 4 = 50
  s2.*3
  s2.
  \mark\markup"                    All[egr]o"
  \tempo 2. = 60
  s2.*3
  s2.
  \mark\markup\huge"                    Ad[agi]o"
  \tempo 4 = 50
  s2.*6
  s2.
  \mark\markup\huge"                    All[egr]o"
  \tempo 2. = 60
  s2.*3
  s2.
  \mark\markup\huge"                    Ad[agi]o"
  \tempo 4 = 50
  s2.*2
  s2.
  \mark\markup\huge"                    All[egr]o"
  \tempo 2. = 60
  s2.*12
  s2.\fermata
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

Ivc = {
  \Iglobal
  \clef tenor
  <<\Ivcn \forma>>

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


IIvlIn =  \relative do'' {

   R1*5
   r2 r8^\markup\column\larger{"Ad[agi]o""  "} sol' sol sol
   fad fad fad fad mi4^\markup\column\larger{"All[egr]o""  "} r

   %8
   R1*5
   r2 r8^\markup\column\larger{"Ad[agi]o""  "} la la la
   la la sold sold la4^\markup\column\larger{"All[egr]o""  "} r

   %15
   R1*9
   r8^\markup\column\larger{"Ad[agi]o""  "} sol sol sol fad fad sold sold\mbreak

   %25
   la la la la sol sol fad fad
   mi sol, sol sol fad fad fad fad
   mi1

}

IIvlIIn = \relative do'' {

   R1*5
   r2 r8 mi mi mi
   mi mi red red mi4 r

   %8
   R1*5
   r2 r8 do do do
   si si si si do4 r

   %15
   R1*8
   <<R1\\{s2 s}>>
   r8 mi mi mi mi mi re? re \mbreak

   %25
   dod dod red red mi mi mi red
   mi mi, mi mi mi mi red red
   mi1

}

IIvlan = \relative do'{

   R1*5
   r2 r8 si' si si
   do do si si sol4 r

   %8
   R1*5
   r2 r8  mi mi mi
   fa fa mi mi mi4 r

   %15
   R1*8
   <<R1\\{s2 s}>>
   r8 si' si si si si si sold\mbreak

   %25
   mi mi red si' si si si si
   si si, si si do do si si
   sol1

}

IIvcn = \relative do {

    mi16 fad sol fad mi fad sol la si la si do si do re si
    mi red mi fad mi fad sol mi red mi dod red si4
    mi16 re? mi fa mi re do? si do si do re do la si do

    %4
    re do re mi re do si la si [do si la sol si la si]
    do[si do re do si la sol] la[si la sol fad! la sol la]\mbreak
    si [la si do si la sol fad!] sol8\clef bass mi mi mi

    %7
    la, la si si mi16 si' la si sol si la si
    mi, si' la si sol si la sol fad re' do re fad, la sol la
    re, do' si do re, do' si la si sol fad sol si, re do re

    %10
    sol, re' do re sol, si' la sol fad la sol la re, do' si la
    si sold fad sold mi re' do si\mbreak do la sold la mi do' si la
    sold si la si mi, re' do si \clef tenor do si do la re do re si

    %13
    mi re mi do fad mi fad re sold8\clef bass la,, la la
    re re mi mi do'16 mi, do mi la mi do la'
    si sold mi sold si sold mi si' do la mi la do la mi la\mbreak

    %16
    do fad,! re la' do la re, do' si sol re sol si sol re sol
    la fad red fad la fad red fad si do la si sol la fad sol
    mi fad re? mi do do' si do la si sol la fad sol mi fad

    %19
    red mi dod red si si' la si sol mi sol si la fad  la do
    \clef tenor si sol si re do la do mi\mbreak red dod si dod red si dod red
    mi fad mi fad mi fad mi fad sol fad mi fad mi fad mi fad

    %22
    sol fad mi fad mi fad mi fad sol8 mi fad red
    mi[re?16 do si do si la] sol8 mi' \clef bass si, red'
    mi, mi mi mi si' si mi, mi\mbreak

    %25
    la la si si mi, mi si' si,
    mi mi mi mi la, la si si
    mi,1

}

IIbcn = \relative do {

   mi8 mi mi mi re re  re re
   do do do do si si si si
   sold' sold sold sold la la la la
   fad fad fad fad sol sol sol sol
   mi mi mi mi fad fad fad fad\mbreak
   red red red red mi mi mi mi
   la, la si si mi mi mi mi
   mi mi mi mi re? re re re
   re re re re sol, sol sol sol
   sol sol sol sol re' re re re
   mi mi mi mi\mbreak la, la la la
   mi' mi mi mi la, la si si
   do do re re mi la, la la
   re re mi mi la, la la la
   sold sold sold sold la la la la\mbreak
   re re re re sol, sol sol sol
   si si si red mi4 r
   mi r fad r
   si, r mi8 mi fad fad
   sol sol la la\mbreak si si la la
   sol4 r mi r
   mi r mi8 sol, la si
   mi mi red red mi4 si
   mi8 mi mi mi si' si mi, mi\mbreak
   la la si si mi, mi si' si,mi mi mi mi la, la si si
    mi,1

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key mi\minor
  \time 4/4
  \tempo 2 = 60
  s1*5
  s2 \tempo 4 = 40 s
  s2 \tempo 2 = 60 s
  s1*5
  s2 \tempo 4 = 40 s
  s2 \tempo 2 = 60 s
  s1*9
  \tempo 4 = 40
  s1*3
  s1\fermata
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

IIvla = {
  \IIglobal
  \clef alto
  <<\IIvlan \forma>>

}

IIvc = {
  \IIglobal
  \clef tenor
  <<\IIvcn \forma>>

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

   mi8 sol4 si sol8
   fad si,4 fad' la8
   sol si,4 sol' si8

   %4
   fad red si fad si, r
   mi'8[mi16 mi mi8 re do si]
   la[la16 la la8 sol fad mi]

   %7
   red mi si'4 si,
   mi r8 mi' sol si
   r4 r8 mi, sol si

   %10
   R2.\mbreak
   r4 r8 mi, sol si
   r4 r8 mi, sol si

   %13
   r4 r8 la, do mi
   r4 r8 re fad la
   r4 r8 sol, si re

   %16
   r4 r8 do mi la
   fad4 r r
   R2.*6

   %24
   si8 re4 si sol8
   la re4 la fad8
   sol re'4 si sol8

   %27
   fad re' la fad re r
   sol,[sol16 sol sol8 fad mi re]\mbreak
   do[do16 do do8 si la sol]

   %30
   re' sol re'4 re,
   sol, r r
   R2.*12

   %44
   r8 re'' re(fa?) fa(si)
   si(re,) re(fa?) fa(re)
   do4 r r\mbreak

   %47
   R2.*2
   mi8 sol4 mi do8
   re sol,4 si re8

   %51
   mi sol,4 do mi8
   re sol re si sol r
   do,2.

   %54
   sol'
   sol
   la\mbreak

   %57
   la
   si
   si

   %60
   do
   la
   mi
   la

   %64
   re,
   re\mbreak
   mi

   %67
   la,4 mi' mi
   do'8 mi4 do la8
   si mi4 si sold8

   %70
   la mi'4 do la8
   la' do, si la' si, sold'
   la4 r r

   %73
   R2.*20
   mi8 sol4 si sol8
   fad si,4 fad' la8

   %95
   sol si,4 sol' si8
   fad red si fad si, r
   mi'8[mi16 mi mi8 re do si]

   %98
   la[la16 la la8 sol fad mi]
   red mi si'4 si,
   mi4\fermata r r

}

IIIvlIIn = \relative do'' {

   si8 mi4 sol mi8
   red fad,4 red' fad8
   mi sol,4 mi' sol8

   %4
   red si fad red si r
   mi'8[mi16 mi mi8 re do si]
   la[la16 la la8 sol fad mi]

   %7
   red mi si'4 si,
   mi r r
   R2.*15

   %24
   sol'8 si4 sol re8
   fad la4 fad re8
   si si'4 sol re8

   %27
   re la' fad re la r
   sol[sol16 sol sol8 fad mi re]\mbreak
   do[do16 do do8 si la sol]

   %30
   re' sol re'4 re,
   sol, r r
   R2.*17

   %49
   sol'8 mi'4 do sol8
   si re,4 sol si8
   do mi,4 sol do8

   %52
   si re si sol re r
   do2.
   sol'

   %55
   sol
   la\mbreak
   la

   %58
   si
   si
   do

   %61
   la
   mi
   la

   %64
   re,
   re\mbreak
   mi

   %67
   la,4 mi' mi
   la8 do4 la mi8
   sold si4 sold mi8

   %70
   do' la'4 mi do8
   mi do si la' si, sold'
   la4 r r

   %73
   R2.*20
   si,8 mi4 sol mi8
   red fad,4 red' fad8

   %95
   mi sol,4 mi' sol8
   red si fad red si r
   mi'8[mi16 mi mi8 re do si]

   %98
   la[la16 la la8 sol fad mi]
   red mi si'4 si,
   mi\fermata r r

}

IIIvlan = \relative do'{

   si4 si si
   si si si
   si si si

   %4
   si si si
   mi'8[mi16 mi mi8 re do si]
   la[la16 la la8 sol fad mi]

   %7
   red mi si'4 si,
   mi r r
   R2.*15

   %24
   mi4 mi mi
   mi mi mi
   mi mi mi

   %27
   mi mi mi
   sol8[sol16 sol sol8 fad mi re]\mbreak
   do[do16 do do8 si la sol]

   %30
   re' sol re'4 re,
   sol, r r
   R2.*17

   %49
   sol'4 sol sol
   sol sol sol
   sol sol sol

   %52
   sol sol sol
   do,2.
   sol'

   %55
   sol
   la\mbreak
   la

   %58
   si
   si
   do

   %61
   la
   mi
   la

   %64
   re,
   re\mbreak
   mi

   %67
   la,4 mi' mi,
   mi'4 mi mi
   mi mi mi

   %70
   mi mi mi
   mi mi mi
   do4 r r

   %73
   R2.*20
   si4 si si
   si si si

   %95
   si si si
   si si si
   mi'8[mi16 mi mi8 re do si]

   %98
   la[la16 la la8 sol fad mi]
   red mi si'4 si,
   mi\fermata r r

}

IIIvcn = \relative do {

   mi4 mi mi
   si si si
   mi mi mi

   %4
   si si si
   mi'8[mi16 mi mi8 re do si]
   la[la16 la la8 sol fad mi]

   %7
   red mi si'4 si,
   \clef tenor si'16(la si do si4.) si8
   mi16(red mi fad mi4.) mi8

   %10
   red fad la, do fad, la\mbreak
   \clef bass sol mi si sol mi r
   \clef tenor mi''16(red mi fad mi8) sol(mi re?)

   %13
   do16(si do re do8) mi(re do)
   re16(do re mi re8) fad(re do)
   si16(la si do si8) re(do si)

   %16
   do16 re mi do la si do la fad sol la fad
   re la' si do re, la' si do re, la' si do
   re, si' do re re, si' do re re, si' do re

   %19
   re, do' re mi re, do' re mi re, do' re mi\mbreak
   re, re' mi fad re, re' mi fad re, re' mi fad
   re, mi' fad sol re, mi' fad sol re, mi' fad sol

   %22
   re, fad' sol la re,, fad' sol la re,, fad' sol la
   sol8 re, sol' la, fad' la,
   \clef bass sol,4 sol sol

   %25
   re' re re
   sol, sol sol
   re' re re

   %28
   sol8[sol16 sol sol8 fad mi re]\mbreak
   do[do16 do do8 si la sol]
   re' sol re'4 re,

   %31
   sol8 re'4 si sol8
   la re4 la fad8
   sol re'4si sol8

   %34
   re re'4 do la8
   si sol4 fa re8
   mi do'4 sib sol8

   %37
   la fa4 re do8
   si?[si'16 do re do si la] sol la sol fa\mbreak
   mi16 do' si do mi, do' si do mi, do' si do

   %40
   re, si' la si re, si' la si re, si' la si
   do, la' sol la do, la' sol la do, la' sol la
   si, sol' fad sol  si, sol' fad sol  si, sol' fad sol

   %43
   la, fad' mi fad la, fa' mi fa la, fa' mi fa
   sol,8(\clef tenor si') si(re) re(fa)
   fa?(sol) sol(re) re(mi)

   %46
   mi si do mi, re si'\mbreak
   do4. re16 mi fa?8 mi16 re
   sol8 do, re4. do8

   %49
   do4\clef bass do, do
   sol sol sol
   do do do

   %52
   sol sol sol
   \clef tenor \appoggiatura re''8 do16(si do8) \appoggiatura re do16(si do8) \appoggiatura re do16(si do8)
   \appoggiatura do8 si4. la8 sol4

   %55
   \appoggiatura mi'8 re16 do re8  \appoggiatura mi8 re16 do re8  \appoggiatura mi8 re16 do re8
   \appoggiatura re do4. si8 la4\mbreak
   \appoggiatura fad'8 mi16 re mi8 \appoggiatura fad8 mi16 re mi8 \appoggiatura fad8 mi16 re mi8

   %58
   \appoggiatura mi8 re4. do8 si4
   \appoggiatura sol'8 fad16 mi fad8 \appoggiatura sol8 fad16 mi fad8 \appoggiatura sol8 fad16 mi fad8
   \appoggiatura fad8 mi4. re8 do4

   %61
   \terzinequarto \con \tuplet 3/2 { do8(mi re) } do4~\tuplet 3/2 {
      do8(si la)
      \senza sold(si la)
   } sold4~\tuplet 3/2 {
      sold8 (fad mi)
      do'(mi re)
   } do4~\tuplet 3/2 { do8 si la }

   %64
   fad'4~\tuplet 3/2 { fad8 la sol fad[la sol] }
   fad4~\tuplet 3/2 { fad8(la sol fad[mi re)] }
   sold,4~\tuplet 3/2 {
      sold8 fad' mi re[do si]

      %67
      do si la
   } si4. la8
   la4 \clef bass la, la
   mi' mi mi

   %70
   la, la la
   la mi' mi,
   la'16 mi la do la mi la do la mi la do

   %73
   si sold si re  si sold si re  si sold si re
   \clef tenor do la do mi do la do mi do la do mi\mbreak
   red la red fad  red la red fad  red la red fad

   %76
   sol[fad fad mi mi re re do do si si do]
   do4(mi) sol
   fad16[mi mi re re do do si si la la si]

   %79
   si4(re) fad
   mi16[re re do do si si la la sol sol la]
   la4 red fad

   %82
   sol16(fad mi8) sol16(fad mi8) sol16(fad mi8)
   red4(dod si)\mbreak
   sol'16(fad mi8) sol16(fad mi8) sol16(fad mi8)

   %85
   red4(do? si)
   mi16 fad sol8~sol16 fad mi8~mi16 red dod si
   mi16 fad sol8~sol16 fad mi8~mi16 red do? si

   %88
   mi4 fa sold
   la4. sol?16[(fad? mi red mi fad)]
   sol4. fad16[(mi red8 dod)]\mbreak

   %91
   si4(red) fad
   sol8 fad16 mi red4. mi8
   mi4 \clef bass mi, mi

   %94
   si si si
   mi mi mi
   si si si

   %97
   mi'8[mi16 mi mi8 re do si]
   la[la16 la la8 sol fad mi]
   red mi si'4 si,

   %100
   mi4\fermata r r

}

IIIbcn = \relative do {

   mi4 mi mi
   si si si
   mi mi mi

   %4
   si si si
   mi'8[mi16 mi mi8 re do si]
   la[la16 la la8 sol fad mi]

   %7
   red mi si'4 si,
   mi4. fad8 sol fad %%%%% ripresa
   mi4. fad8 sol mi

   %10
   si2 r4\mbreak
   mi,2.
   sol'

   %13
   la
   fad
   sol

   %16
   la
   re,4 re re
   re re re

   %19
   re re re\mbreak
   re re re
   re re re

   %22
   re re re
   sol, re' re,
   sol sol sol

   %25
   re' re re
   sol, sol sol
   re' re re

   %28
   sol8[sol16 sol sol8 fad mi re]\mbreak
   do[do16 do do8 si la sol]
   re' sol re'4 re,

   %31
   sol4 sol sol
   re re re
   sol, sol sol

   %34
   re' re re
   sol, sol sol
   do do do

   %37
   la la la
   sol sol sol\mbreak
   do do do

   %40
   re re re
   do do do
   si si si

   %43
   la la la
   sol sol sol
   sol sol sol

   %46
   do8 sol' mi do sol4\mbreak
   do r r
   do sol' sol,

   %49
   do do do
   sol sol sol
   do do do

   %52
   sol sol sol
   do2.
   sol'

   %55
   sol
   la\mbreak
   la

   %58
   si
   si
   do

   %61
   la
   mi
   la

   %64
   re,
   re\mbreak
   mi

   %67
   la,4 mi' mi,
   la la la
   mi' mi mi

   %70
   la, la la
   la mi' mi,
   la la la

   %73
   mi' mi mi
   la, la la\mbreak
   si si si

   %76
   mi r r
   la, la la
   re4 r r

   %79
   sol, sol sol
   do r r
   red, red red

   %82
   mi mi' mi
   si2.\mbreak
   mi4 mi mi

   %85
   si2.
   mi4 mi mi
   mi mi mi

   %88
   sol la si
   red,2.
   mi\mbreak

   %91
   red
   mi8 la si4 si,
   mi mi mi

   %94
   si si si
   mi mi mi
   si si si

   %97
   mi'8[mi16 mi mi8 re do si]
   la[la16 la la8 sol fad mi]
   red mi si'4 si,

   %100
   mi4\fermata r r

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentUp




}

forma = {

   \key mi\minor
   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 2. = 43
   s2.*100
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

IIIvc = {
   \IIIglobal
   \clef bass
   <<\IIIvcn \forma>>

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

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] Ad[agi]o"

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
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
          \Ivc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"bassoon"
          \set Staff.instrumentName = \markup \center-column{"Fagotto""[Basso]"}
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


\pageBreak

\markup\huge "[2.] All[egr]o"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIvla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IIvc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"bassoon"
          \IIbc

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

\pageBreak

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
          \set Staff.midiInstrument = #"cello"
          \IIIvc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"bassoon"
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



