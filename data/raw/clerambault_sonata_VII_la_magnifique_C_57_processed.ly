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
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IdsIn = \relative do'' {

    mi2 \appoggiatura {mi16[fad]} sol2. fad8 mi
    red2\prall fad2. fad4
    sol2 sold2. sold4

    %4
    la4. si8 la4. sol?8 fad4. mi8\mbreak\mbreak
    red2 si' si
    si1.

    %7
    si2 la4.\prall sol8 fad4.\prall mi8
    \appoggiatura {mi16[fad]} sol2 fad2.\prall mi4\mbreak
    mi1.

    %10
    R1.*2
    r2 si'2. la4
    sol4. la8 sol4. fad8 mi4. re8\mbreak

    %14
    dod2 lad2. lad4
    si4. dod?8 lad2. si4
    si2 si'2. la?4

    %17
    sold2 la si
    do do2. si4\mbreak
    la4. sol8 la4. si8 do4. la8

    %20
    si2 la2.\prall sol4
    sol2 si2. si4
    \appoggiatura si8 la2 la4.(sol16 la) si4. fad8

    %23
    sol4. la8 si4. do8 si4. la8
    sol4. la8 sol4. fad8 mi4. fad8
    red2 red2. red4

    %26
    mi4.(fad16 sol) fad2.\prall mi4\mbreak
    mi2 si'4. do8 si4. la8
    sol4. la8 sol4. fad8 mi4. fad8

    %29
    red2 red2. red4
    mi4.(fad16 sol) fad2. mi4
    mi1\fermopz

}


IdsIIn = \relative do'' {

    sol'2 mi2. sol4
    fad2 red si~
    si4 si si2. re4

    %4
    do4. re8 do4. si8 la4. sol8\mbreak
    fad2\prall mi' mi
    fad4. mi8 fad4. red8 sol4. fad8

    %7
    mi4. fad8 mi4. re?8 dod2
    \appoggiatura {do16[re]} mi2 red?2.\prall mi4
    mi2 sol2. fad4

    %10
    mi4. fad8 mi4. re8 dod4. si8
    lad2 si dod
    re red2. red4

    %13
    mi4. fad8 mi4. re8 dod?4. si8\mbreak % fine prima pagina
    lad2 fad'2.  mi4
    re4. mi8 dod2.\prall  si4

    %16
    si2 red2. red4
    mi2 fad sold
    la mi la\mbreak

    %19
    fad4. mi8 fad4. sol8 la4. fad8
    sol2 fad2.\prall  sol4
    sol2 re sol

    %22
    sol fad2.\prall fad4\mbreak
    si,2 sol'4. la8 sol4. fad8
    mi2 si'4. la8 sol4. la8

    %25
    fad2\prall fad2. fad4
    sol4.(fad16 mi) red2. mi4\mbreak
    mi2 sol4. la8 sol4. fad8

    %28
    mi2 si'4. la8 sol4. la8
    fad2\prall fad2. fad4
    sol4. \parentSlur (fad16 mi) red2.\prall mi4

    %31
    mi1\fermopz

}

Ivcn = \relative do {

    mi4. red?8 mi4. fad8 sol4. la8
    si4. la8 si4. dod?8 red?4. si8
    mi4. fad8 mi4. re8 do4. si8

    %4
    la4. sol8 la4. si8 do4. la8\mbreak
    si4. la8 sol4. fad8 sol4. mi8
    red4. dod8 red4. si8 mi4. re?8

    %7
    do4. re8 do4. si8 la2
    lad si si,\mbreak
    mi2 mi'4. red8 mi4. fad8

    %10
    sol2. fad4 sol4. mi8
    fad4. mi8 re2 dod
    si si' si,

    %13
    mi4. red8 mi4. fad8 sol4. mi8\mbreak
    fad2 fad fad,
    sol4. mi8 fad2. fad4

    %16
    si1 si'2
    do do si
    la la2. la4\mbreak

    %19
    re2 re2. re4
    sol,2 re' re,
    sol sol,4. la8 si4. do8

    %22
    re2 red2. red4\mbreak
    mi2 \clef alto \key mi\minor mi'2 red
    mi mi2. mi4

    %25
    si'4. la8 si4. do8 si4. la8
    sol4. la8 si2 si,\mbreak
    mi2 \clef bass\key mi\minor mi, red

    %28
    mi mi2. mi4
    si'4. la8 si4. do8 si4. la8
    sol4. la8 si2 si,

    %31
    mi,1\fermata

}

Ibcn = \relative do {

    mi4. red?8 mi4. fad8 sol4. la8
    si4. la8 si4. dod?8 red?4. si8
    mi4. fad8 mi4. re8 do4. si8

    %4
    la4. sol8 la4. si8 do4. la8\mbreak
    si4. la8 sol4. fad8 sol4. mi8
    red4. dod8 red4. si8 mi4. re?8

    %7
    do4. re8 do4. si8 la2
    lad si si,\mbreak
    mi2 mi'4. red8 mi4. fad8

    %10
    sol2. fad4 sol4. mi8
    fad4. mi8 re2 dod
    si si' si,

    %13
    mi4. red8 mi4. fad8 sol4. mi8\mbreak
    fad2 fad fad,
    sol4. mi8 fad2. fad4

    %16
    si1 si'2
    do do si
    la la2. la4\mbreak

    %19
    re2 re2. re4
    sol,2 re' re,
    sol sol,4. la8 si4. do8

    %22
    re2 red2. red4\mbreak
    mi2 \clef alto \key mi\minor mi'2 red
    mi mi2. mi4

    %25
    si'4. la8 si4. do8 si4. la8
    sol4. la8 si2 si,\mbreak
    mi2 \clef bass\key mi\minor mi, red

    %28
    mi mi2. mi4
    si'4. la8 si4. do8 si4. la8
    sol4. la8 si2 si,

    %31
    mi,1\fermata

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1 <6>2
   s1 <6>2
   <_-> <_+> s
   s1.
   <_+>2 <6> s
   <6 _+>1.
   <7>4. <6>8 <6>4. <6>8 s2
   <7- 5> <4> <_+>
   s1.
   <6>
   s2 <6> <6+>
   <_-> <_+> s
   s1.
   <_+>1.
   s2 <4>2. <_+>4
   <_+>1.
   <5+>2 <6> <6+>
   <3->1.
   s
   s2 <4> <_+>
   s1 <6>2
   <5 4>2 <6 5->1
   s2 s <6>
   s1.*2
   <6>2 <4> <_+>
   s s <6>
   s1.
   <_+>
   <6>2 <4> <_+>

}

forma = {

   \key mi\minor
   \time 3/2
   \tempo 2 = 55
   s1.*30
   s1
   \bar"||"

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

Ivc = {
   \Iglobal
   \clef bass
   <<\Ivcn \forma>>

}

Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \forma \Ibfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


IIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IIdsIn = \relative do'' {

    mi2. fad\prall
    sol4 sol8 la si4 sol la si
    mi, fad8 sol la4 fad sol la

    %4
    red, si si si lad8 si dod? lad\mbreak
    si2. fad'
    sold, lad?4 si dod

    %7
    fad, fad'8 sol fad4 red mi fad
    sol mi mi mi red8 mi fad red\mbreak
    mi2. si'

    %10
    dod, red4 mi fad
    si,2. la4 si2
    si sol'8 fad mi4 red2\prall \mbreak

    %13
    sol4 sol8 la si4 la sol fad
    fad la fad sol sol mi
    fad sol la si2.

    %16
    sol4 la2 fad4 sol2
    fad4 fad8 sol fad4 fad2\prall mi4\mbreak
    mi4 sol la si8 la sol fad mi re

    %19
    dod2. dod
    re4 re8 mi fad4 re mi fad
    si, dod8 re mi4 dod re mi\mbreak

    %22
    lad, lad lad si re re
    mi fad2 fad si4
    si2 re,4 re mi8 re dod4

    %25
    fad2 sold,4  dod re mi\mbreak
    re dod re si dod lad
    si2. r2 r4

    %28
    R1.*3\mbreak
    si2. dod
    re4 re8 mi fad4 re mi fad

    %33
    si, si'8 la si4 sol la si
    mi,2. la4 sol2\prall\mbreak
    fad2.\prall fad

    %36
    sol4 re8 mi re4 do la8 si do4
    si si8 do si4 la fad8 sol la4
    sol sol8 la si4 do do8 re mi4\mbreak

    %39
    fad re8 mi fad4 sol si8 la sol4
    fad re8 mi fad4 mi dod8 re mi4
    re la re do la8 si do4

    %42
    si sol sol sol fad8 sol la fad\mbreak
    sol2. re'
    mi, fad4.\prall sol8 la4

    %45
    re,2 r4 la'2.
    si4 si8 do re4 si do re
    sol, la8 si do4 la si do\mbreak

    %48
    fad,4 la8 si dod4 re2.
    re4 re8 do si4 sol la si
    do do8 re mi4 re2\prall re4

    %51
    re fad,8 sol la4 re, re' do\mbreak
    si si' la sol r r
    r la mi fad r r

    %54
    r sol fad mi fad sol
    red\prall red mi fad mi red\mbreak
    mi dod red? mi red! dod

    %57
    red8 dod? red mi fad red mi red mi fad sol mi
    fad4 fad8 sol la4 fad sol la
    red, red8 mi fad4 red mi fad\mbreak

    %60
    si, sol sol la si2
    si sol'8 fad mi4 red2\prall
    sol4 sol8 la si4 la sol fad

    %63
    fad red si mi si' do
    do2 si4 si2 la4\mbreak
    si fad sol red2 red4

    %66
    fad2 si,4 la2 sol4
    sol4. la8 fad4 mi sol' la
    fad fad8 mi fad4 mi mi8 red mi4\mbreak

    %69
    red2 r4 r2 r4
    si' fad sol red2 mi4
    red2 mi4 mi4. fad8 red4

    %72
    mi1

}


IIdsIIn = \relative do'' {

    r4 mi mi mi red8 mi fad red
    mi2. si'
    dod, red4 mi fad

    %4
    si,2. dod\mbreak
    re4 re8 mi fad4 re mi fad
    si, dod8 re mi4 dod re mi

    %7
    lad,2. si
    si4 sol sol la2.\mbreak
    si4 si8 la sol4 mi'2.

    %10
    sol2 fad4 la sol dod,
    fad sol sol fad2.
    sol4 sol8 la si4 sol la si

    %13
    mi,4 mi8 fad sol4 fad sol la
    red, fad red mi mi dod
    red mi fad sol2.

    %16
    mi4 fad2 red4 mi2
    mi mi4 mi2 red4\mbreak
    mi mi fad sol8 fad mi re dod si

    %19
    lad2. fad'
    fad4 fad8 mi re4 fad mi re
    mi2 mi,4 fad2.~\mbreak

    %22
    fad4 fad' mi re si si
    si lad8 si dod lad si2.
    fad' sold,

    %25
    lad4 si dod fad,2.\mbreak
    fad re'4 mi dod
    si2. dod

    %28
    re4 re8 mi fad4 re mi fad
    si, dod8 re mi4 dod re mi
    lad,4 fad'8 sold lad4 sold lad fad\mbreak

    %31
    si2. lad
    si4 fad8 mi re4 fad2 dod4
    re re8 mi re4 si dod re

    %34
    dod?2. re2 dod!4
    re4 la2 la2.
    sol fad

    %37
    sol4 re'8 mi re4 do la8 si do4
    si si8 do re4 mi mi8 fad sol4\mbreak
    la fad8 sol la4 si sol8 la si4

    %40
    la fad8 sol la4 sol mi8 fad sol4
    fad fad sol sol4. la8 fad4\prall
    sol si,2 do4 re2\mbreak

    %43
    re4 do8 re mi fad sol2 fad4
    sol do,8 si la4 do re8 do si4
    la la8 sol fad mi re2.~

    %46
    re4 re' sol sol2\prall  fad4
    sol fad mi mi re8 mi fad sol\mbreak
    la4 fad, sol la2.

    %49
    si4 si8 do re4 si do re
    sol, la8 si do4 la si do
    fad, re8 mi fad4 sol sol fad\mbreak

    %52
    sol re' do si sol' re
    mi r r r re la
    si si la sol2 la4

    %55
    fad fad sol la sol fad\mbreak
    sol mi fad sol fad mi
    fad2. r2 r4

    %58
    R1.*2\mbreak
    mi'2. fad
    sol4 sol8 la si4 sol la si

    %62
    mi, mi8 fad sol4 fad sol la
    red, fad red si sol' la
    fad fad8 mi fad4 mi mi8 red mi4\mbreak

    %65
    red2. r2 r4
    si'4 fad sol red2 mi4
    mi4. fad8 red4 mi si' do

    %68
    do2 si4 si2 la4\mbreak
    si fad sol red2 mi4
    fad2 si,4 la2 sol4

    %71
    fad2 sol4 sol4. la8 fad4
    mi1

}

IIvcn = \relative do {

    R1.*7
    mi2. fad\prall\mbreak
    sol4 sol8 la si4 sol la si

    %10
    mi, fad8 sol la4 fad sol la
    red, mi mi mi red8 mi fad red
    mi2. si'\mbreak

    %13
    dod ,red4 mi fad
    si,2. si
    la sol4 sol8 la si4

    %16
    do fad,8 sol la4 si mi,8 fad sol4
    la la8 sol la4 si si8 la si4\mbreak
    mi,2.~ mi

    %19
    fad4 fad' sold lad8 sold lad si dod lad
    si2.  si,2 si'4
    sold2. lad4 si dod

    %22
    fad,2. si,
    dod re4 re8 mi fad4
    re mi fad si, dod8 re mi4

    %25
    dod re mi lad,2.
    si sol4 mi fad
    si si si si lad8 si dod lad

    %28
    si2. fad'
    sold, lad4 si dod
    fad,2 fad'4 mi2.\mbreak

    %31
    re4 re8 mi fad4 mi dod8 re mi4
    si2. si'2 la4
    sol2. sol

    %34
    la4 la8 si la4 fad sol la\mbreak
    re,4 re'8 mi re4 do la8 si do4
    si si8 do si4 la fad8 sol la4

    %37
    sol2. fad2 re4
    mi8 fad sol4 sol do,2 do4\mbreak
    do2. si2 do4

    %40
    re2 re'4 dod2.
    do!2 si4 la re re,
    sol2. la\mbreak

    %43
    si4 la8 si do4 si do re
    sol, la8 si do4 la si do
    fad, fad8 sol la4 fad mi re

    %46
    sol sol8 la si4 sol la si
    mi, fad8 sol la4 fad sol la\mbreak
    re, re mi fad8 mi fad sol la fad

    %49
    sol2. sol,2 sol'4
    mi2. fad4 sol la
    re,2 do4 si si la\mbreak

    %52
    sol2. sol'4 sol,8 la si sol
    do4 dod2 re4 fad2
    sol2. do4 la2

    %55
    si2. si,~\mbreak
    si1.~
    si4 si'2 dod2.

    %58
    re4 red?8 mi fad4 red mi fad
    si,2. la\mbreak
    sol4 mi mi mi red8 mi fad red

    %61
    mi2. si'
    dod, red4 mi fad
    si,2 la4 sol mi mi'

    %64
    re re8 do re4 do do8 si do4\mbreak
    si2. si'4 fad sol
    red2 mi4 fad2 mi4

    %67
    la,2 si4 mi,2 mi'4
    re re8 do re4 do do8 si do4\mbreak
    si2. si'4 fad sol

    %70
    red2 mi4 fad2 mi4
    si'2 mi,4 la,2 si4
    mi,1

}

IIbcn = \relative do {

    R1.*7
    mi2. fad\prall\mbreak
    sol4 sol8 la si4 sol la si

    %10
    mi, fad8 sol la4 fad sol la
    red, mi mi mi red8 mi fad red
    mi2. si'\mbreak

    %13
    dod ,red4 mi fad
    si,2. si
    la sol4 sol8 la si4

    %16
    do fad,8 sol la4 si mi,8 fad sol4
    la la8 sol la4 si si8 la si4\mbreak
    mi,2. mi

    %19
    fad4 fad' sold lad8 sold lad si dod lad
    si2.  si,2 si'4
    sold2. lad4 si dod

    %22
    fad,2. si,
    dod re4 re8 mi fad4
    re mi fad si, dod8 re mi4

    %25
    dod re mi lad,2.
    si sol4 mi fad
    si si si si lad8 si dod lad

    %28
    si2. fad'
    sold, lad4 si dod
    fad,2 fad'4 mi2.\mbreak

    %31
    re4 re8 mi fad4 mi dod8 re mi4
    si2. si'2 la4
    sol2. sol

    %34
    la4 la8 si la4 fad sol la\mbreak
    re,4 re'8 mi re4 do la8 si do4
    si si8 do si4 la fad8 sol la4

    %37
    sol2. fad2 re4
    mi8 fad sol4 sol do,2 do4\mbreak
    do2. si2 do4

    %40
    re2 re'4 dod2.
    do!2 si4 la re re,
    sol2. la\mbreak

    %43
    si4 la8 si do4 si do re
    sol, la8 si do4 la si do
    fad, fad8 sol la4 fad mi re

    %46
    sol sol8 la si4 sol la si
    mi, fad8 sol la4 fad sol la\mbreak
    re, re mi fad8 mi fad sol la fad

    %49
    sol2. sol,2 sol'4
    mi2. fad4 sol la
    re,2 do4 si si la\mbreak

    %52
    sol2. sol'4 sol,8 la si sol
    do4 dod2 re4 fad2
    sol2. do4 la2

    %55
    si2. si,\mbreak
    si1.~
    si4 si'2 dod2.

    %58
    re4 red?8 mi fad4 red mi fad
    si,2. la\mbreak
    sol4 mi mi mi red8 mi fad red

    %61
    mi2. si'
    dod, red4 mi fad
    si,2 la4 sol mi mi'

    %64
    re re8 do re4 do do8 si do4\mbreak
    si2. si'4 fad sol
    red2 mi4 fad2 mi4

    %67
    la,2 si4 mi,2 mi'4
    re re8 do re4 do do8 si do4\mbreak
    si2. si'4 fad sol

    %70
    red2 mi4 fad2 mi4
    si'2 mi,4 la,2 si4
    mi,1

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1.*8
   <6>2. <6>
   <6+>2 <6>4 <6> <6> <6>
   <6>2. <2 4>4 <3- 6> s8 <5>
   s1.
   <5->4 <6> <7 5-> <6 5->2.
   <_+> <4>
   s1.*2
   <6 5>2. <4>2 <_+>4
   s1.
   <_+>4 s <6> <6>2.
   s1.
   <6>2. <6>
   s1.
   <7>4 <6+>2 s2.
   s s2 <6+>4
   <6> <6> <6> s2.
   s <6>4 <6+> <_+>
   s2. <4 2+>
   s <6>
   <6> s4 <6+>2
   <_+>2. <4+ 2>
   <6> <6+>
   s1.
   <5>
   <_+>2 <3>4 <6> <8> <7 _+>
   s2. <4+>4 <6>2
   <6>2. <6>
   s <5->2 <7>4
   <5>1.
   <6 4>2. <6>2 <7>4
   s2. <5->
   <2 4+>2 <6>4 <7> <4> <_+>
   s2. <3 7>4 <6 4>2
   <6>2 <5>4 s <6>2
   <6>2 <6>4 <6> <6> <6>
   <6>2. <6>
   s2 <6>4 s2.
   s2. s4 <7>2
   s2 <6+>4 <6>2.
   s1.
   <6>2. <6>
   s2 <4+>4 <6> s <6+>
   s1.
   s4 <6>2 s4 <6>2
   s2. s4 <7>2
   s2. <7>4 <6> <5>
   <6> <2 4+> <5 _+> <6 4> <5 _+> <2>
   s2. <6>2 <5->4
   <6>2. <6>
   <_+> <4+>
   <6>1.
   s2. <6>4 <7 4> <8 _+>
   <5-> <6> <7> <5->2.
   <_+>2 <4+>4 <6> 2 <6 4>4
   <7 3> s <6> <7 3> s <6>
   <_+>2. s2 <6>4
   <6>2. <6+>
   <7>2 <_+>4 s2 <6 4>4
   <7 3> s <6> <7 3> s <6>
   s1.
   <6>2. <6+>
   <_+> <7>2 <_+>4






}

forma = {

   \key sol\major
   \time 6/4
   \tempo 2. = 75
   s1.*71
   s1
   \bar"||"

}

IIdsI = {
   \IIglobal
   %\notypeset
   %\clef french
   <<\IIdsIn \forma>>

}

IIdsII = {
   \IIglobal
   %\clef french
   <<\IIdsIIn \forma>>

}

IIvc = {
   \IIglobal
   \clef bass
   <<\IIvcn \forma>>

}

IIbc = {
   \IIglobal
   \clef bass
   <<\IIbcn \forma \IIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


IIIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza
}

IIIdsIn = \relative do'' {

    R1*7
    si'2. la4
    sol fad mi re

    %10
    dod si lad2
    fad'4 sol fad mi
    red2. red4\mbreak

    %13
    mi2. re?4
    dod re dod red8. mi16
    red1\prall

    %16
    r4 si' si la
    sold la si sold\mbreak
    la mi mi re

    %19
    do mi re do
    si sold la si
    do mi la sol

    %22
    fa mi re do\mbreak
    si do si4.\prall la8
    la2 r

    %25
    R1
    sol'4 la sol fa
    mi fad! sol mi

    %28
    fad\prall re do si\mbreak
    la si la sol
    fad sol la fad

    %31
    sol re' sol2~
    sol4. \tuplet 3/2 { fad16(mi fad } fad4.\prall) sol8
    sol4 sol la si

    %34
    mi,1\mbreak
    r4 mi fad sol
    red1\prall

    %37
    r4 mi si re?
    do4.\prall si8 la4.\prall sol8 \mbreak
    fad4 fad sol la

    %40
    si la8 sol fad4. mi8
    mi1
    r4 la' fad la

    %43
    red,\prall si mi fad\mbreak
    sol fad8 mi red4.-\parenthesize \prall mi8
    mi1\fermata

}


IIIdsIIn = \relative do'' {

    R1
    r2 mi~
    mi4 re do si

    %4
    la sol fad mi
    red2 si'~
    si4. dod16 re dod2\mbreak

    %7
    dod4. red16 mi red4 si
    mi2. red4
    mi re? dod si

    %10
    lad mid fad2
    R1
    si'4 do si la\mbreak

    %13
    sold lad si2~
    si lad4. si8
    si1

    %16
    R
    r4 mi, mi re\mbreak
    dod do do si

    %19
    la do si la
    sold mi fad sold
    la si do dod

    %22
    re do? si la\mbreak
    sold la sold4. la8
    la2 r

    %25
    re4 mi re do
    si2.\prall si4
    do2 si4 do

    %28
    la si la sol\mbreak
    fad re' do si
    la si do re

    %31
    si\prall do re si
    la4.\prall la8 la4.\prall sol8
    sol4 si do re

    %34
    sol,1\mbreak
    r4 do do do
    fad,1

    %37
    R
    r4 la' fad la\mbreak
    red, si mi fad

    %40
    sol fad8 mi red4. mi8
    mi4 mi si re
    do4.\prall si8 la4.\prall sol8

    %43
    fad4\prall fad sol la\mbreak
    si la8 sol fad4.\prall mi8
    mi1\fermata

}

IIIvcn = \relative do {

    \clef alto mi'4 sol red si
    mi re? dod\prall si
    do! si la sol

    %4
    \clef bass\key mi\minor fad4 mi red mi
    si la sold fad
    sol! mi la sol\mbreak

    %7
    la fad si la
    sol la sol fad
    mi fad sol mi

    %10
    fad sol fad fad'8 mi
    re4 mi re dod
    si la sol fad\mbreak

    %13
    mi fad sol mi
    fad mi fad fad'
    si, si' si la

    %16
    sold \prall fad sol fad
    mi fad sold mi\mbreak
    la \clef alto \key mi\minor la' la sold

    %19
    la do, re re
    mi re do si
    la la la la

    %22
    re mi fa re\mbreak
    mi re mi mi,
    \clef bass \key mi\minor la si la sol

    %25
    fad mi fad re
    sol2. sol4
    do, re mi do

    %28
    re1~\mbreak
    re(
    re,)

    %31
    sol4 la si sol
    re' do re re,
    sol1

    %34
    r4 do' re mi\mbreak
    la,1
    r4 si si si

    %37
    mi, fad sold mi
    la4. si8 do4 la\mbreak
    si la sol fad

    %40
    mi la si si,
    mi mi,8 fad sold4 mi
    la4. si8 do4 la

    %43
    si la sol fad\mbreak
    mi la si si,
    mi1\fermata

}

IIIbcn = \relative do {

    \clef alto mi'4 sol red si
    mi re? dod\prall si
    do! si la sol

    %4
    \clef bass\key mi\minor fad4 mi red mi
    si la sold fad
    sol! mi la sol\mbreak

    %7
    la fad si la
    sol la sol fad
    mi fad sol mi

    %10
    fad sol fad fad'8 mi
    re4 mi re dod
    si la sol fad\mbreak

    %13
    mi fad sol mi
    fad mi fad fad'
    si, si' si la

    %16
    sold \prall fad sol fad
    mi fad sold mi\mbreak
    la \clef alto \key mi\minor la' la sold

    %19
    la do, re re
    mi re do si
    la la la la

    %22
    re mi fa re\mbreak
    mi re mi mi,
    \clef bass \key mi\minor la si la sol

    %25
    fad mi fad re
    sol2. sol4
    do, re mi do

    %28
    re1\mbreak
    re
    re,

    %31
    sol4 la si sol
    re' do re re,
    sol1

    %34
    r4 do' re mi\mbreak
    la,1
    r4 si si si

    %37
    mi, fad sold mi
    la4. si8 do4 la\mbreak
    si la sol fad

    %40
    mi la si si,
    mi mi,8 fad sold4 mi
    la4. si8 do4 la

    %43
    si la sol fad\mbreak
    mi la si si,
    mi1\fermata

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   s2 <6>
   s1*2
   <6>2 <6><_+>4 <4+> <6>2
   <6>1
   <_+>2 <_+>
   <6> s4 <6+>
   s4 s <6> <7>
   <_+> <6+> <_+> s
   <6>2 s4 <6+>
   <_+> s <5+> <6+>
   <_+> <_+> <6> s
   <5> <7> <4> <_+>
   s1
   <6>
   s2 <6>4 <7>
   <_+> <_-> s <6>
   <_-> s <6> <7>
   <_+> <4+> <6 4> <6+>
   <3-> s s <3+>
   <_->2 <6>4 <7>
   <_+> <7> <4> <_+>
   s1
   <6>2 <7>
   s2. <7->4
   s1
   <3>4 <5 8> <6 5> <7 4>
   <5 3> <8 4> <7> <6>
   <5 3> <6 4> <7 5>  <3>
   s1
   <4>2 s4 <3>
   s1*3
   s4 <_+> s2
   s <6 _+>4 <7>
   s2 <6>4 <7>
   <_+> s <6> <6+>
   s <_-> <4> <_+>
   s2 <6>
   s <6>4 <7>
   <_+> <6> <6+> <_+>

}

forma = {

   \key sol\major
   \time 2/2
   \tempo 4 = 50
   s1*45
   \bar"||"

}

IIIdsI = {
   \IIIglobal
   %\notypeset
   %\clef french
   <<\IIIdsIn \forma>>

}

IIIdsII = {
   \IIIglobal
   %\clef french
   <<\IIIdsIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


IVglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza
}

IVdsIn = \relative do'' {

    si4_\markup\italic {"1"\super "r""Dessus"} mi fad\prall
    sol4. fad8 sol4
    mi8 fad fad4.\prall mi8

    %4
    red2.
    si4 mi fad\prall
    sol4. fad8 sol[(la)]\mbreak

    %7
    sol(la) la4.\prall si8
    si2. si
    si,4 \appoggiatura {si16[do]} re4(dod?8.) re16

    %10
    dod4.\prall dod8 red4\prall
    si mi(fad8.) sol16
    fad2\prall si,4\mbreak

    %13
    fad'8(sol) la[(fad)] sol(mi)
    \appoggiatura sol8 fad4 red mi~
    mi8 fad fad4.\prall mi8

    %16
    mi2. mi

}

IVvcn = \relative do {

    mi2 si'4
    mi4. red8 mi4
    do la4.\prall la8

    %4
    si la si do si la
    sol fad mi4 red
    mi4. red8 mi4~\mbreak

    %7
    mi8 re? do4. si8
    si la si dod red si si4 si'8 fad sol la
    sol4 sold4.\prall sold8

    %10
    la4. sol8 fad4sol8 fad mi4 mi,
    si' si'8 la sol [fad16 mi]\mbreak
    red2 mi4

    %13
    si si'8 la sol[fad]
    mi la, si4 si,
    mi si''8 fad sol la mi,2.

}

IVbcn = \relative do {

    mi2 si'4
    mi4. red8 mi4
    do la4.\prall la8

    %4
    si la si do si la
    sol fad mi4 red
    mi4. red8 mi4~\mbreak

    %7
    mi8 re? do4. si8
    si la si dod red si si4 si'8 fad sol la
    sol4 sold4.\prall sold8

    %10
    la4. sol8 fad4sol8 fad mi4 mi,
    si' si'8 la sol [fad16 mi]\mbreak
    red2 mi4

    %13
    si si'8 la sol[fad]
    mi la, si4 si,
    mi si''8 fad sol la mi,2.

}

IVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2 <_+>4
   s4. <6>8 s4
   s4 <6>4. <5>8
   <_+>2.
   <6>2 <6>4
   s4. <6>8 s4
   s <6>2
   s2.*2
   <6>4 <5->2
   s <6+>4
   s2.
   <_+>2 <6>4
   <6->4 <5>2
   <_+>2 <6>4
   <6> <4> <_+>

}

forma = {

   \key mi\minor
   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 4 = 65
   \repeat volta 2 {s2.*7}
   \alternative {{s2.}{s}}\break
   \set Score.currentBarNumber = #9
   \repeat volta 2 {s2.*7}
   \alternative {{s2.}{s}}
   \bar"||"

}

IVdsI = {
   \IVglobal
   %\clef french
   %\notypeset
   <<\IVdsIn \forma>>

}

IVvc = {
   \IVglobal
   \clef bass
   <<\IVvcn \forma>>

}

IVbc = {
   \IVglobal
   \clef bass
   <<\IVbcn \forma \IVbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


Vglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza
}

VdsIn = \relative do'' {

    si8_\markup\italic {"2"\super "d""Dessus"} la4
    sol4. la8 si4 fad4. sol8 la4
    sol4.\prall fad8 mi4 mi4. si'8 do4

    %4
    do2 si4 mi4. fad8 mi4\mbreak
    red2 fad4 fad4.\prall mi8 fad4
    sol4. fad8 mi4 fad4. mi8 re4

    %7
    dod2 dod4 re4. dod8 si4
    lad2 fad'4 mi4.\prall re8 dod4\mbreak
    re4. mi8 fad4 re4.\prall dod8 si4

    %10
    si2. si4. si8 la4 si2. si4. si8 la4  sold2 mi'4 re4.\prall do8 si4
    do2 mi4 re4.\prall do8 si4\mbreak  %%% fine secondo sistema p. 55

    %12
    do4. re8 mi4 la, si sold
    la do8 re mi4 la, si sold
    la2 la4  re4. do8 re4

    %15
    si4.\prall do8 re4 la si sol\mbreak
    fad si8 do re4 la si sol
    fad2\prall fad'4 fad4.\prall mi8 fad4

    %18
    sol4. la8 si4 mi, fad2\prall
    sol4. la8 si4 mi, fad2\prall\mbreak
    sol4. sol,8 la4 si4.\prall la8 sol4

    %21
    re'2. re4. do8 re4
    si4.\prall si8 mi4 dod4. dod8 fad4
    red2 si4 si4. dod8 red4\mbreak

    %24
    mi2 mi4 mi4. red8 dod4
    red4. dod8 red4 mi4. red8 dod4
    red2\prall si'4 fad4.\prall mi8 fad4

    %27
    sol fad sol mi fad red\mbreak
    mi fad sol mi fad red
    mi2. \parenthesize si4. si8 la4 mi'2.~ mi

}

Vvcn = \relative do {

    mi8 red4
    mi4. fad8 sol la si2 si,4
    mi2. mi,2 mi'4

    %3
    re2 re4 do4. si8 do4\mbreak
    si2 si'4 si2 si,4
    mi2 la4 re,2 mi4

    %6
    fad2 fad4 si,2 si4
    fad2 sold4 lad4. sold8 lad4\mbreak
    si4. dod8 re mi fad2 fad,4

    %9
    si2. si4. mi8 red4 si2. red
    mi4. re?8 do4 si2 mi4
    la,2 do4 si2 mi4\mbreak

    %12
    la,4. si8 do4 re si mi
    do4. si8 la sol fa4 re mi
    la4. la'8 sol4 fad2.

    %15
    sol4. la8 si4 fad sol mi\mbreak
    re4 sol8 la si4 fad sol mi
    re2 re'4 do4. re8 do4

    %18
    si4. la8 sol4 do la2
    mi' si4 do re2\mbreak
    sol,2.~sol

    %21
    fad4. re8 mi4 fad4. mi8 re4
    sol4. fad8 mi4 la4. sol8 fad4
    si2 la4 sol2 fad4\mbreak

    %24
    mi2. mi,
    si' mi,
    si'2 dod4 red4. dod8 red4

    %27
    mi re? mi do la si
    sol fad mi do' la si
    mi4. si8 dod4 red2. \parenthesize mi, \parentSlur (\parenthesize mi)

}

Vbcn = \relative do {

    mi8 red4
    mi4. fad8 sol la si2 si,4
    mi2. mi,2 mi'4

    %3
    re2 re4 do4. si8 do4\mbreak
    si2 si'4 si2 si,4
    mi2 la4 re,2 mi4

    %6
    fad2 fad4 si,2 si4
    fad2 sold4 lad4. sold8 lad4\mbreak
    si4. dod8 re mi fad2 fad,4

    %9
    si2. si4. mi8 red4 si2. red
    mi4. re?8 do4 si2 mi4
    la,2 do4 si2 mi4\mbreak

    %12
    la,4. si8 do4 re si mi
    do4. si8 la sol fa4 re mi
    la4. la'8 sol4 fad2.

    %15
    sol4. la8 si4 fad sol mi\mbreak
    re4 sol8 la si4 fad sol mi
    re2 re'4 do4. re8 do4

    %18
    si4. la8 sol4 do la2
    mi' si4 do re2\mbreak
    sol,2.~sol

    %21
    fad4. re8 mi4 fad4. mi8 re4
    sol4. fad8 mi4 la4. sol8 fad4
    si2 la4 sol2 fad4\mbreak

    %24
    mi2. mi,
    si' mi,
    si'2 dod4 red4. dod8 red4

    %27
    mi re? mi do la si
    sol fad mi do' la si
    mi4. si8 dod4 red2. mi, \parentSlur (mi)

}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s8 <6- 5>4
   s2. <4>2 <_+>4
   s2. s2 <6>4
   <7>2 <6>4 <7>4. <6>8 s4
   <_+>1.
   s2. s2 <7>4
   <_+>1.
   <_+>2. <6>
   s2. <4>2 <_+>4
   s1. s2. <_+>
   <_+>2 <6>4 <5>2 <_+>4
   <_->2 <6>4 <5>2 <_+>4
   <_->2 <6>4 <_+>2 <_+>4
   s2. <6>2 <_+>4
   <_+>2. <6>
   s2 <6>4 <6>2 <6+>4
   s2 <6>4 <6> <6\\> <6>
   s2. <4+>
   <6> s4 <6>2
   s2. s4 <_+>2
   s1.
   <6>
   s2. <_+>
   <_+> <6>2 <6+>4
   s1.
   <_+>
   <_+>2. <6>4. <_+>8 <_+>4
   s2. <6>2 <_+>4
   <6> <6+> s <6>

}

forma = {

   \key mi\minor
   \time 6/4
   \tempo 2. = 70
   \partial 4. s4.
   \repeat volta 2 {s1.*8}
   \alternative {{s1.}{s}}\break
   \set Score.currentBarNumber = #10
   \repeat volta 2 {s1.*19}
   \alternative {{s1.}{s}}
   \bar"||"

}

VdsI = {
   \Vglobal
   %\notypeset
   %\clef french
   <<\VdsIn \forma>>

}

Vvc = {
   \Vglobal
   \clef bass
   <<\Vvcn \forma>>

}

Vbc = {
   \Vglobal
   \clef bass
   <<\Vbcn \forma \Vbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


VIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza
}

VIdsIn = \relative do'' {

    R1*4
    mi2 si
    mi2. mi8 fad

    %7
    sol4 fad sol mi
    si'2 la4 sol\mbreak
    fad mi fad red

    %10
    mi2 fad\prall
    sol2. sol8 la
    si4 la si sol

    %13
    fad\prall fad sol mi
    fad2 sol\mbreak
    fad\prall si,

    %16
    si la
    sold\prall mi'4 re
    do si la sol

    %19
    fad red mi fad
    sol2 fad\prall
    mi4 fad sol la\mbreak

    %22
    si2 mi
    red\prall mi
    do4 re? mi re

    %25
    do si la re
    si8 la si do re4 mi
    la,2 la\prall

    %28
    sol r
    R1*7
    sol'2 re

    %37
    sol2. sol,8 la
    si4 la si sol\mbreak
    re' re mi fad

    %40
    sol si, do re
    mi4. fad8 fad4.\prall mi8
    red2\prall mi

    %43
    red2.\prall red8 mi
    fad4 mi fad red
    mi2 si4 do

    %46
    fad,2\prall fad4 sol\mbreak
    mi mi' mi re
    dod red mi fad

    %49
    red\prall si mi fad
    sol2 fad\prall
    mi4 mi mi re

    %52
    dod red mi fad
    red\prall si mi fad\mbreak
    sol2 fad\prall

    %55
    mi2. re4
    re2. do8 si
    do2 la4.\prall la8

    %58
    la2. sol8 fad
    sol1~
    sol4. fad8\mbreak fad4.\prall mi8

    %61
    mi1

}


VIdsIIn = \relative do'' {

    si2 mi,
    si'2. si8 dod
    red4 dod? red si

    %4
    mi red mi fad
    sol2 fad\prall
    sol2. sol8 fad

    %7
    mi4 red mi dod?
    red mi fad sol\mbreak
    la sol la fad

    %10
    sol2 red\prall
    mi4 si2 si4
    mi2. mi4

    %13
    mi red mi dod
    red2 mi\mbreak
    red2. red8 mi

    %16
    fad4 mi fad red
    mi2 la,4 sold
    la mi' red mi

    %19
    red si dod red
    mi2 red
    mi1\mbreak

    %22
    mi4 red si sol
    fad2 si4 sold
    la2 sol?

    %25
    fad4 sol re fad
    sol re'8 do si4 la
    sol2 fad\prall

    %28
    sol2 r
    R1*3
    re'2 la

    %33
    re2. re8 mi
    fad4 mi fad re
    sol fad sol la

    %36
    si2 la\prall
    si4 si,8 do re4 mi
    re2. mi4\mbreak

    %39
    fad\prall fad sol la
    si re, do si8 la
    sol2 do

    %42
    fad, fad
    fad si
    si la

    %45
    sol mi'4 fad
    mi2 red\mbreak
    mi4 la, la sold

    %48
    la2. do4
    fad, fad sol la
    si mi mi4.\prall red8

    %51
    mi4 la, la sold
    la2. do4
    fad,\prall fad sol la\mbreak

    %54
    si mi mi4.\prall red8
    mi4 la, si sold
    la do si sold

    %57
    la sol? fad mi
    red mi fad red
    mi1~

    %60
    mi4. red8\mbreak red4.\prall mi8
    mi1

}

VIvcn = \relative do {

    R1*9
    \clef alto \key mi\minor mi'2 si
    mi2. mi8 fad

    %12
    sol4 fad sol mi
    si'1
    \clef bass \key mi\minor si,2 mi,\mbreak

    %15
    si'2. si8 dod
    red4 dod red si
    mi re do? si

    %18
    la sol fad mi
    si' la sol fad
    mi2 si

    %21
    mi2. mi8 fad\mbreak
    sol4 fad sol mi
    si' la sold mi

    %24
    la si do si
    la sol fad re
    sol sol,8 la si4 do

    %27
    re do re re,
    sol2 re
    sol2. sol8 la\mbreak

    %30
    si4 la si sol
    re' dod re mi
    fad2. re8 mi

    %33
    fad4 sol fad mi
    re2 do
    si4 do si la

    %36
    sol2 fad
    mi4 mi' si do
    sol fad sol mi\mbreak

    %39
    re re' re do
    si sol la si
    do2 la

    %42
    si mi,
    si'2. si8 dod
    red4 dod red si

    %45
    mi fad sol la
    si la si si,\mbreak
    do do' do si

    %48
    la si do la
    si la sol fad
    mi2 si

    %51
    do4 do do si
    la si do la
    si la sol fad

    %54
    mi2 si
    mi4 fad sol mi
    fad la sold mi

    %57
    la si do la
    si dod red si
    mi2 la,

    %60
    lad\mbreak si4 si,
    mi1

}

VIbcn = \relative do {

    R1*9
    \clef alto \key mi\minor mi'2 si
    mi2. mi8 fad

    %12
    sol4 fad sol mi
    si'1
    \clef bass \key mi\minor si,2 mi,\mbreak

    %15
    si'2. si8 dod
    red4 dod red si
    mi re do? si

    %18
    la sol fad mi
    si' la sol fad
    mi2 si

    %21
    mi2. mi8 fad\mbreak
    sol4 fad sol mi
    si' la sold mi

    %24
    la si do si
    la sol fad re
    sol sol,8 la si4 do

    %27
    re do re re,
    sol2 re
    sol2. sol8 la\mbreak

    %30
    si4 la si sol
    re' dod re mi
    fad2. re8 mi

    %33
    fad4 sol fad mi
    re2 do
    si4 do si la

    %36
    sol2 fad
    mi4 mi' si do
    sol fad sol mi\mbreak

    %39
    re re' re do
    si sol la si
    do2 la

    %42
    si mi,
    si'2. si8 dod
    red4 dod red si

    %45
    mi fad sol la
    si la si si,\mbreak
    do do' do si

    %48
    la si do la
    si la sol fad
    mi2 si

    %51
    do4 do do si
    la si do la
    si la sol fad

    %54
    mi2 si
    mi4 fad sol mi
    fad la sold mi

    %57
    la si do la
    si dod red si
    mi2 la,

    %60
    lad\mbreak si4 si,
    mi1

}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*11
   <6>1
   <_+>
   <_+>2 <_->
   s2 s4 s8 <_+>
   <6>1
   s2 <6>4 <6+>
   s <6> <6+> s
   s s <6> <6+>
   s2 <4+>
   s1
   <6>4 <6+> <6> s
   <_+>2 <6>
   s <5>4 <6>
   <6>2 <6>
   s1
   s2 <4>4 <_+>
   s1*4
   <6>1
   <6>
   s
   <6>2 <6>4 <6+>
   s2 <6>
   s <6>
   s4 <6> s <6+>
   s1
   <6>
   s2 <6>4. <5>8
   <_+>1
   s2 s4 s8 <_+>
   <6 _+>1
   s
   s2 <4>4 <_+>
   s2 <6>4 <6+>
   <_+> <_+> <6> <3->
   <_+> s <6> <6+>
   s2 <4>4. <_+>8
   s4 <6> s <6+>
   <_+> <_+> <6> <3->
   <_+> s <6> <6+>
   s1*2
   <6>4 s <6> <_+>
   s1
   <_+>2 <6>
   s2 <7 5>
   <7- 5>2 <4>4 <_+>

}

forma = {

   \key sol\major
   \time 2/2
   \once\override Staff.TimeSignature.style = #'single-digit
   \tempo 1 = 60
   s1*54\break
   \mark\markup\italic "[adagio]"
   \time 4/4
   \tempo 2 = 30
   s1*7
   \bar"|."

}

VIdsI = {
   \VIglobal
   %\notypeset
   %\clef french
   <<\VIdsIn \forma>>

}

VIdsII = {
   \VIglobal
   %\clef french
   <<\VIdsIIn \forma>>

}

VIvc = {
   \VIglobal
   \clef bass
   <<\VIvcn \forma>>

}

VIbc = {
   \VIglobal
   \clef bass
   <<\VIbcn \forma \VIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \header {
        subtitle = \markup {Sonata VII "La magnifique"}
        composer = \markup\smaller \center-column{"N. Clérambault (1686-1768)"}
    }

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[1.] [Lentement]"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key mi\minor\time 3/2\numericTimeSignature  mi''2^\markup \center-align"[1r Dessus]"}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IdsI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key mi\minor\time 3/2\numericTimeSignature  sol''2^\markup \center-align"[2d Dessus]"}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IdsII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basse""de violon]"}
                \Ivc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.instrumentName = \markup \center-column{"[Basse""continue]"}
                \Ibc
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2.5\cm

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

    \markup\huge "[2.] Allegro"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIdsI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIdsII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIvc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"harpsichord"
                \IIbc
            >>
        >>

        \layout {

            indent = 0\cm

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

    \markup\huge "[3.] Suite - Adagio"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIdsI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIdsII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIvc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"harpsichord"
                \IIIbc
            >>
        >>

        \layout {

            indent = 0\cm

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

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup\huge "[4.] Suite - Sarabande"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVdsI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IVvc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"harpsichord"
                \IVbc
            >>
        >>

        \layout {

            indent = 0\cm

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

    \markup\huge "[5.] Suite - Gigue"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VdsI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \Vvc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"harpsichord"
                \Vbc
            >>
        >>

        \layout {

            indent = 0\cm

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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[6.] Suite - Allegro"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIdsI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIdsII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \VIvc
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"harpsichord"
                \VIbc
            >>
        >>

        \layout {

            indent = 0\cm

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

}


