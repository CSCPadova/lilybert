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



Ifln = \relative do'' {

    R2.*7
    re'4 re re
    re2 dod4

    %10
    re2.~
    re
    re4 re,8 mi fad sol\mbreak

    %13
    la sol la si la sol
    fad mi re mi fad sol
    la sol la si la sol

    %16
    fad4 r r
    r4 sol8 la si do
    si la si do si la

    %19
    si la sol la si do
    re do re mi re do
    si4 r r

    %22
    R2.*5
    r8 mi, la mi la si
    do4 r r

    %29
    r8 la re la re do
    si4 r r
    r8 sol do sol do si

    %32
    la4 r r
    r8 fad si fad si la\mbreak
    sol sol sol sol sol sol

    %35
    sol4 sol sol
    sol r r
    r8 sol\noBeam si8 do re do

    %38
    si sol sol sol sol sol
    sol sol sol sol sol sol
    sol sol sol sol sol sol

    %41
    sol sol sol sol sol sol
    la la la la la la\mbreak
    la4 la la

    %44
    la4 r r
    s2.
    r2 r8 fad16. sol32 la8[la]

    %47
    la16. si32 do16. si32 la16. sol32 la16. si32 sol4 r
    r8 mi16. fad32 sol8[sol] sol16. fad32 mi16. fad32 sol16. fad32 sol16. la32
    fad8 re16. mi32 fa8[fa] fa16. sol32 la16. sol32 fa16. mi32 fa16. sol32\mbreak

    %50
    mi16. mi32 fad16. sol32 la16. la32 si16. do32 si4\tr ~si16. la32 sol16. fad32
    sol16. fad32 sol16. la32 fad4 mi r
    r2 la8 la la la

    %53
    re8 re re4 r2
    mi,8 mi mi mi la la la re
    re4 re, mi8 mi mi mi

    %56
    la4 la la2\tr

}


IvlIn = \relative do'' {

    sol4 si re
    sol8 re sol si la do
    si4 r8 sol fad la

    %4
    sol4 si, re
    sol,8 fad sol re fad re
    si' la si do la4

    %7
    sol re' fad
    sol8 si, si si si si
    re re re re sol[sol]

    %10
    fad fad fad fad fad fad
    sol4 sol sol
    fad r r\mbreak

    %13
    fad, mi r
    re8 mi fad sol la si
    fad4 mi r

    %16
    r8 la la la la la
    re,4 r r
    re la' r

    %19
    sol8 la si do re mi
    la,4 r r
    r8 si' si si si si

    %22
    do do do do si[si]\mbreak
    do sol16 fa? sol8[mi sol mi]
    la fa16 mi fa8[la] re la

    %25
    do si la sol fa mi
    re mi16 fa do8[la'] si, sold'
    la4 r r

    %28
    r8 mi16 re mi8[do mi mi]
    la4 r r
    r8 re,16 do re8[si] re re

    %31
    sol4 r r
    r8 re'16 do re8[la] do do
    si4 r r\mbreak

    %34
    r8 sol si sol re'[re]
    re4 do do
    do si8 la sol si

    %37
    mi, do' si4 la
    sol8 si16 la si8 re16 do re8 si
    do mi,16 re mi8 sol16 fa sol8 do

    %40
    si re,16 do re8 sol16 fad sol8 si
    mi, mi sol[sol] si si
    fad re16 dod re8 fad16 mi fad8 la16 sol\mbreak

    %43
    la8 re la fad re la
    fad4 r r
    s2.

    %46
    la8 [la] la la la4 r
    r2 sol8 sol sol sol
    sol4 r r2

    %49
    r8 re\p la' la re, do re[re]\mbreak
    do do do'[la] red, mi16 red mi4
    mi red si'8 si si si

    %52
    sib sib sib sib la4 r8 la
    sol4 r8 fa fa fa fa fa
    mi4 r8 mi re4 r8 re\p

    %55
    re re re re re4 dod
    re re re2

}

IvlIIn = \relative do'' {

    R2.
    sol4 si re
    sol8 re sol si la do

    %4
    si4 r8 sol fad la
    sol4 si, re
    sol,8 fad sol re fad re

    %7
    si' la si do la4
    si8 re re re re re
    la la la la dod[dod]

    %10
    re re re re re re
    re4 re re
    re r r\mbreak

    %13
    re, dod r
    re r r
    re dod r

    %16
    r8 fad fad fad fad fad
    sol4 r r
    si, fad' r

    %19
    sol r r
    fad r r
    r8 re' re re re re

    %22
    sol sol sol sol fa?[fa]\mbreak
    mi mi16 re mi8[sol mi do]
    do la16 sol la8[do] fa fa

    %25
    mi mi, la4. la'8
    la la, la[mi'] sold, si
    do4 r r

    %28
    r8 do'16 si do8[mi,] si' si,
    re4 r r
    r8 si'16 la si8[re,] la' la,

    %31
    do4 r r
    r8 la' la fad sol[sol]
    fad4 r r\mbreak

    %34
    r8 mi sol mi sol[sol]
    mi4 mi mi
    re re8 do re sol

    %37
    sol4 sol fad
    sol8 re16 do re8 re'16 do re8[re,]
    mi do16 si do8 mi16 re do8 mi

    %40
    re si'16 la si8 si,16 sol si8 sol'
    sol sol re[re] re' re
    re fad,16 mi fad8 re16 dod re8 fad16 mi\mbreak

    %43
    fad8 la fad re la[fad]
    re4 r r
    s2.

    %46 OOKK
    fad8 fad fad fad fad4 r
    r2 mi8 mi mi mi
    mi4 r r2

    %49
    re8\p re do[do] si la si[si]\mbreak
    do do la[la] la la sol[la]
    si4 si sol'8 sol sol sol

    %52
    sol sol sol sol fad4 r8 fad
    re4 r8 re re re re re
    dod4 r8 dod la'4 r8 la,\p

    %55
    si si si si sol4 sol
    la fad' fad2

}

Ivlan = \relative do' {

    R2.*7
    r8 sol' sol sol sol sol
    la la la la sol[sol]

    %10
    la la la la la la
    si4 si si
    la r r\mbreak

    %13
    re, dod r
    re r r
    re dod r

    %16
    r8 re re re re re
    re4 r r
    si fad' r

    %19
    sol r r
    fad r r
    r8 sol sol sol sol sol

    %22
    sol do do mi, fa?[fa]\mbreak
    sol do do[do,] sol' sol
    fa4. fa8 la4

    %25
    la r8 do, re mi
    fa sol16 la mi8 do mi4
    mi r r

    %28
    r8 la\noBeam mi la la la
    la4 r r
    r8 sol mi sol la[la]

    %31
    sol4 r r
    r8 la la la mi[mi]
    fad4 r r\mbreak

    %34
    r8 sol sol si si[si]
    sol4 sol sol
    sol sol re

    %37
    mi re re
    re8[re] sol sol sol sol
    sol sol sol sol sol sol

    %40
    sol sol sol re re re
    do do re[re] si' si
    la la la la la[la]\mbreak

    %43
    la [fad] re' la fad re
    la4 r r
    s2.

    %46
    re8 re re re red4 r
    r2 si8 si si si
    la4 r r2

    %49
    re8\p re do[do] si la si[si]\mbreak
    do do la[la] la la sol la
    si4 si mi8 mi mi mi

    %52
    mi mi sol sol re4 r8 re
    re4 r8 fa? si,! si si si
    la'4 r8 la la4 r8 re,\p

    %55
    re re sol[sol] sol4 sol
    fad la la2

}

Ivcn = \relative do' {

    R2.*7
    r8 sol' sol sol sol sol
    fad fad fad fad mi[mi]

    %10
    re re re re do[do]
    si la sol la si do
    re4 r r\mbreak

    %13
    R2.*3
    r8 re re re do[do]
    si4 r r

    %18
    R2.*3
    r8 sol' sol sol fa? [fa]
    mi mi mi mi re[re]\mbreak

    %23
    do do do do do do
    fa fa fa fa re[re]
    la sol fa mi re do

    %26
    re8 re' mi4 mi,
    la r r
    r8 la la la sol[sol]

    %29
    fad4 r r
    r8 sol sol sol fad[fad]
    mi4 r r

    %32
    r8 fad' fad fad mi[mi]
    re4 r r\mbreak
    r8 mi mi mi si[si]

    %35
    do si do re, mi fad
    sol fad sol la si sol
    do do, re'4 re,

    %38
    sol8 sol sol sol si [sol]
    do do, do do' mi do
    sol' sol, sol sol si sol

    %41
    do, do' si[si] sol sol
    re re' re re re re\mbreak
    re4 re, re

    %44
    re r r
    s2.
    re'8 re do[do] si4 r

    %47
    r2 mi8 mi, re re
    dod4 r r2
    R1*2

    %51
    r2 mi'8 mi re[re]
    dod dod dod dod do4 r8 do
    sib4 r8 la sold sold sold sold

    %54
    sol!4 r8 sol fa4 r8 fad\p
    sol sol sol sol mi4 mi
    re re re2

}

Ibcn = \relative do {

    R2.*7
    r8 sol' sol sol sol sol
    fad fad fad fad mi[mi]

    %10
    re re re re do[do]
    si la sol la si do
    re4 r r\mbreak

    %13
    R2.*3
    r8 re re re do[do]
    si4 r r

    %18
    R2.*3
    r8 sol' sol sol fa? [fa]
    mi mi mi mi re[re]\mbreak

    %23
    do do do do do do
    fa fa fa fa re[re]
    la' sol fa mi re do

    %26
    re4 mi mi,
    la r r
    r8 la' la la sol[sol]

    %29
    fad4 r r
    r8 sol sol sol fad[fad]
    mi4 r r

    %32
    r8 fad fad fad mi[mi]
    re4 r r\mbreak
    r8 mi mi mi si[si]

    %35
    do si do re mi fad
    sol fad sol la si sol
    do do, re4 re,

    %38
    sol8 sol' sol sol si sol
    do do, do do mi do
    sol' sol, sol sol si sol

    %41
    do do si[si] sol sol
    re' re re re re re\mbreak
    re4 re re

    %44
    re r r
    s2.
    re8 re do[do] si4 r

    %47
    r2 mi8 mi re[re]
    dod4 r r2
    R1*2

    %51
    r2 mi8 mi re[re]
    dod dod dod dod do4 r8 do
    sib4 r8 la sold sold sold sold

    %54
    sol!4 r8 sol' fa4 r8 fad\p
    sol sol, sol sol mi'4 mi
    re re re2

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s2.*8
    s2 <6+>4
    <_+>2 <6 4+>4
    <6>2.
    <_+>
    s2.*3
    s8 <_+> s4 <6 4+>
    <6>2.
    s2.*3
    s2 <6 4>4
    <6>2 <6>4
    s2.
    <5>2 <5>4
    <_->2.
    s4 <6 4> <3>
    s2.
    s2 <6>4
    <6>2.
    s2 <6>4
    <6>2.
    s8 <6> s4 <6>
    <_+ 6>2.
    s8 <5> s4 <6>
    <9>4 <8>2
    <4>4 <3> s
    s <6 4> <3>
    s2.*3
    s4 <6> s
    <_+>2.
    s4 <_+> s
    <_+>

}


forma = {

    \time 3/4
    \key do\major
    \tempo 2. = 53
    s2.*44
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}\break
    \mark\markup "Adagio"
    \time 4/4
    \tempo 4 = 40
    s1*11
    \bar "||"

}

Ifl = {
    %\notypeset
    <<\Ifln \forma>>

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}


Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}
Ivc = {
    \clef tenor
    <<\Ivcn \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIfln = \relative do'' {

    R1*2
    re8 re re re sol sol sol sol
    re'4 r8 do si16 la si do si8 la

    %5
    sol16 fad sol la si8 sol la4 r
    R1*2\mbreak
    sol8 sol sol sol do4 r

    %9
    si8 si si si si4 r
    R1*4
    la8 la la la re4 r8 do

    %15
    si16 la si do si8 la sold16 fad sold la sold8 la
    si16 la si do si8 do re do16 si do8 si16 la
    si2 la4 r

    %18
    R1*7
    la8 la la la re4 r8 re\mbreak
    re8 do16 si do8 si16 la re8 do16 si do8 si16 la

    %27
    la4 sold la r
    R1*5
    r2 fad8 fad fad fad

    %34
    si4 r8 la sold16 la sold la si8 sold
    la4 r8 sol! fad16 sol fad sol la8 fad
    sol4 r sol8 sol sol sol

    %37
    re'4 r8 do si16 la si la sol8 do\mbreak
    si16 la si la sol8 re mi16 re mi fad sol8 mi
    fad16 mi fad sol la8 fad sol16 la si do re8 sol,

    %40
    si4 la sol r
    r8 sol do16 si do si la4 r
    la8 la la la re4 r

    %43
    la8 la la la re4 r
    r8 re re4 do2
    si4 r8 sol si4 re

    %46
    re

}


IIvlIn = \relative do'' {

    re8 re re re sol4 r8 sol
    fad16 mi fad sol fad8 mi re16 do re mi re mi do re
    si[la si do si do la si] sol8 si mi[si]

    %4
    sol' re re,[fad] sol4 re'~
    re16[do re do si do re mi] fad sol fad sol la8 fad
    sol re re re, la' re re dod

    %7
    fad16 mi fad sol fad8 la re, si16 la si8 re\mbreak
    sol, mi'16 re mi fa? re mi do re do re mi8 la
    sol16 la sol la si8 mi, mi re16 do re8 re'

    %10
    re do16 si do8 do do si16 la si la si do
    la sol la sol fad8 la re,8. mi16 re mi do re
    si4 r sol'8 sol sol sol

    %13
    re'4 r8 re\mbreak re4 dod
    re r r2
    sol,,8\p sol sol fa! mi4 mi

    %16
    mi mi mi mi
    mi2 r16 mi'\f[ fad re mi dod re si]
    dod8 re16 mi fad re mi dod re8 dod16 si la8 re,

    %19
    R1\mbreak
    fad'8 fad fad fad si4 r8 la
    sol16[fad sol la sol fad sol la] fad mi fad sol fad8 fad

    %22
    sol4 r si,8 si si si
    si'4 r8 la sol16 fad sol la sol la fad sol
    mi sol fad mi fad mi fad sol mi fad sol fad mi8. mi16

    %25
    fad4 r r2\mbreak
    R1
    r2 mi8 mi mi mi

    %28
    do'4 r r16 re,[mi do re si do la]
    si4 r r16 sol'[la fad sol mi fa re]
    mi8 mi, re4 r2

    %31
    re'8 re re re sol4 r8 sol\mbreak
    fad sol16 mi fad re mi dod re fad sol mi fad re mi dod
    re8 re' dod4 re r

    %34
    R1*2
    sol,8 sol sol sol re'4 r
    fad,,8 fad fad fad sol4 r8 la\mbreak

    %38
    sol4 r8 sol8 do,4 r8 la'
    la4 r8 la re,4 r8 sol
    sol4 fad r16 sol'[la fad? sol mi fad re]

    %41
    mi4 r r16 la[si sol la fad sol mi]
    fad4 r r16 fad[sol mi fad re mi dod]
    re4 r la'8 la la la

    %44
    si4 r8 si la4 la
    si r8 do si si, la fad'
    sol4

}

IIvlIIn = \relative do'' {

    r2 sol8 sol sol sol
    re'4 r8 do si16 la si do si8 la
    sol16[fad sol la sol la fad sol] mi8 sol do, mi

    %4
    si si' si,[la] sol sol' r fad
    si16 la si do re8 si' la16 si la si do8 la
    si sol16 fad sol la si do re8 re, r4

    %7
    re8 re re re sol16[fa! sol la sol la fa sol]\mbreak
    mi8 do16 si do8 sol mi'16 fa mi re do8 mi
    mi16 fad mi fad sol la si sol fad mi fad mi fad8 si

    %10
    mi, fad sol la re,4 r
    re8 re re re sol4 r8 fad
    sol re si'16 do la si sol8 si mi,[mi]

    %13
    sol fad si16 la sol la\mbreak fad mi fad sol mi fad sol mi
    fad4 r8 fad,\p sol16 fad sol la sol8 la
    re, si' r4 r mi,8 fad

    %16
    sold16 fad sold la sold8 la si la16 sold la4~
    la sold la r
    r16 la'\f[si sol la fad sol mi] fad4 fad,

    %19
    sol8 sol sol sol re'4 r8 sol\mbreak
    fad16 re mi dod re8 la' red,16 mi red mi fad8 fad
    mi16 red mi red mi2 red8 red

    %22
    mi mi mi mi si'4 red,
    mi16 fad mi fad si,8 red mi si si si
    mi la, r re re4 dod

    %25
    la r8 la\p sold4 re'8 fa,!\mbreak
    mi mi mi mi si'4 mi,8 la
    fa re'16 do si la si do la4 si

    %28
    r16 la'[si sol la fad sol mi] fad4 r
    re8 re re re sol8 si, re16 do re si
    sol8 sol' sol sol do4 r8 do

    %31
    si16 la si do si8 la sol16 la fad sol mi8 dod\mbreak
    r16 la'[si sol la fad sol mi] fad re mi dod re fad sol mi
    fad8 la sol mi fad4 r

    %34
    si,,8 si si si mi4 r8 re
    dod16 si la si dod8 dod re4 r8 do
    si si' mi[mi] sol4 r

    %37
    re,8 re re re sol4 r8 fad\mbreak
    sol4 r8 si, do4 r8 do
    re4 r8 do si4 r8 mi

    %40
    re re re re sol16 si do la si do re si
    do4 r r16 fad[sol mi fad re mi dod]
    re4 r r16 la[si sol la fad sol mi]

    %43
    fad4 r fad'8 fad fad fad
    re4 r8 sol sol4 fad
    sol r8 sol sol sol, fad la

    %46
    si4

}

IIvlan = \relative do' {

    R1*4
    sol'8 sol sol sol re'4 r8 do
    si16 la si do si8 si, la'16 sol la si la8 sol

    %7
    la8. sol16 la8 fad si sol r re\mbreak
    do4 r8 re mi la la la
    si4 mi, fad re

    %10
    sol,4. re'8 sol,4 re'
    fad4 r8 fad sol sol sol la
    re, si sol'[la] si4 do8 do

    %13
    re la sol[re]\mbreak la'4 la
    la r re,8 re re fad
    sol sol sol fa! mi4 mi,

    %16
    mi'1
    mi,8 mi mi mi la4 r
    r2 r16 re[mi do re si do la]

    %19
    si8 si si si' la16 sol la si la8 dod,\mbreak
    la'4 r8 fad fad4 red
    si'8 si, si si si' fad si4

    %22
    si8 si, la'4 red,16 mi red mi fad4
    mi r8 fad si,4 mi~
    mi8 mi la,[la'] si4 mi,

    %25
    re r8 do si4 r8 la\mbreak
    sold16 si la sold la8 do sold16 si la sold la8 do
    re4 mi8 re do4 sold

    %28
    mi'8 mi do'[la] la16[fad sol mi fad re mi fad]
    sol8 si la4 si si8 sol
    sol16 la sol la si8 re, sol do16 si la8 la

    %31
    sol si16 la sol8 re' re,4 mi\mbreak
    re r la' r
    r8 re, sol la la4 r

    %34
    si,8 si si si mi4 r8 re
    dod16 si la si dod8 dod re4 r8 do
    si re do[do] re4 r

    %37
    re8 re re re sol4 r8 fad\mbreak
    sol4 r8 si, do4 r8 do
    re4 r8 do si4 r8 mi

    %40
    re re re re re4 r8 si'
    sol4 r re r8 la'
    la4 r re, r8 la'

    %43
    la4 r la8 la la la
    sol4 r8 re mi4 re
    re r8 mi re4 re

    %46
    re

}

IIvcn = \relative do' {

    R1*4
    r2 re,8 re re re
    sol4 r8 sol' fad16 mi fad sol fad8 mi

    %7
    re16 do re mi re mi do re si4 r8 si\mbreak
    do4 r8 si la la la16 si do la
    mi'8 mi, mi16 fad sol mi si'8 si, si'16 do re si

    %10
    do8 re16 re, mi8[fad] sol sol sol sol
    re'4 r8 do si16 la si do si do la si
    sol16 [fad sol la sol la fad sol] mi8 sol do[mi]

    %13
    si re sol,[si]\mbreak la8 la la la
    re8 re, re'16 mi do re si[la si do si do la si]
    sol4 r r2
    R1*2

    %18
    r2 re8 re re re
    sol4 r8 sol' fad16 mi fad sol fad8 mi\mbreak
    re4 r8 do si4 r

    %21
    si r si8 si si si
    mi16 fad re mi do8 do si16 do si do si do la si
    sol[fad sol la sol la fad sol] mi8 mi' mi16 fad re mi

    %24
    dod mi re dod re8 re, sol4 la
    re16 do re mi re  mi do re si la si do si do la si\mbreak
    sold4 la8 do sold4 la8 do

    %27
    re re, mi'[re] do4 sold
    la8 la la  la re4 r
    sol8 sol, fad[fad'] mi mi, si'[si,]

    %30
    do do' si[si,] mi mi' fad[fad,]
    sol sol' sol fad si,16 dod re si dod8 la\mbreak
    re4 r re r

    %33
    r8 fad, mi la re,4 r
    R1*2
    r8 sol mi' do si4 r
    R1*3

    %40
    r2 sol8 sol sol sol
    do4 r re8 re re re
    re4 r re8 re re re

    %43
    re4 r re8 re re re
    sol4 r8 si, do4 re
    sol, r8 do re4 re,

    %46
    sol

}

IIbcn = \relative do {

    R1*4
    r2 re8 re re re
    sol4 r8 sol fad16 mi fad sol fad8 mi

    %7
    re16 do re mi re mi do re si4 r8 si\mbreak
    do4 r8 si la la' la16 si do la
    mi'8 mi, mi16 fad sol mi si'8 si, si16 do re si

    %10
    do8 re mi[fad] sol sol sol sol
    re'4 r8 do si16 la si do si8 la
    sol16 fad sol la sol la fad sol mi8 sol do,[mi]

    %13
    si re sol,[si]\mbreak la4 la
    re r r2
    R1*3

    %18
    r2 re8 re re re
    sol4 r8 sol fad16 mi fad sol fad8 mi\mbreak
    re4 r8 do si4 r

    %21
    si r si8 si si si
    mi4 do' si r8 la
    sol4 r8 fad mi4 r8 re

    %24
    dod4 re8 re sol,4 la
    re r r2\mbreak
    R1*2

    %28
    la8 la la la re4 r
    sol fad mi si
    do si mi fad

    %31
    sol r8 fad si si, dod la\mbreak
    re4 r re r
    r8 fad mi la re,4 r

    %34
    R1*2
    r8 sol mi do si4 r
    R1*3

    %40
    r2 sol'8 sol sol sol
    do4 r re,8 re re re
    re4 r re8 re re re

    %43
    re4 r re8 re re re
    sol4 r8 si, do4 re
    sol, r8 do re4 re,

    %46
    sol

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    s2 <_+>4 s8 <7>
    s2 s4 s8 <6+>
    <_+>2 <6>4 s8 <5->
    s4 s8 <6> <_- 5>2
    <_!> <4>4 <3!>
    <9>4 <6> <4> <3>
    <_+> s8 <6 4+> <6>4 <6>8 <6+>
    s2 s4 s8 <6>
    <6>8 <_+> s <6> <6+ 4>4 <_+>
    <_+>1
    s1*3
    s2 <_+>
    s2 s4 s8 <6+>
    s4 s8 <6 4+> <_+>2
    <6 4>2 <4>4 <3+>
    s <6> <_+> s8 <6+ 4+>
    s4 s8 <6+> s4 s8 <6 4>
    s4 <_+> <6 5> <_+>
    <_+>1
    s1*2
    <_->2 <_+ 7>
    s4 <6> <5> <6>
    s2 <6>4 <6 5>
    s2 <6>4 s8 <7>
    <_+>2 <_+>
    s4 <6+>8 <_+> <_+>2
    s1*2
    s4 <6> <6>2
    s1*4
    s2 <_+>
    <_+> <_+>
    <_+> <_+>
    s <6 5>4 <_+>
    s2 <6 4>4 <3>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*45
    \set Score.measureLength = #(ly:make-moment 1 4) s4
    \bar "||"

}

IIfl = {
    %\notypeset
    <<\IIfln \forma>>

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}


IIvla = {
    \clef alto
    <<\IIvlan \forma>>

}
IIvc = {
    \clef tenor
    <<\IIvcn \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIIfln = \relative do'' {

    si'8. si16 do4 r
    la8. la16 si4 r
    sold8. sold16 la4 la

    %4
    la8. [sol?16 la8. do16 si8. la16]
    sold8.[fad16 sold8. la16 si8. sold16]
    la8.[mi16 la8. si16 la8. sol?16]

    %7
    fad8.[mi16 fad8. sol16 la8. fad16]
    sol8.[la16 si8. do16 re8. sol,16]
    do8. si16 do2

    %10
    si re4~
    re dod2
    re4 r r

    %13
    R2.*2

}


IIIvlIn = \relative do'' {

    sol4 r sol
    fad r fad
    mi r dod

    %4
    fad r r
    si r sold8. si16
    mi,4 r r8 mi

    %7
    la8. mi16 do4 r
    r r sol'~
    sol fad2

    %10
    sol la4~
    la mi2
    fad4. la8 re4~

    %13
    re dod2
    re2.

}

IIIvlIIn = \relative do'' {

    mi,4 r mi
    mi re8. fad16 si4
    r r8 dod, mi4

    %4
    r fad8. sol16 fad4
    sold8. la16 si4 r
    r dod,8. re16 mi4

    %7
    r r fad8. la16
    re,4 r re
    la'2.

    %10
    si2 fad4~
    fad sol2
    la4 la fad

    %13
    sol2.
    fad

}

IIIvlan = \relative do' {

    mi4 r mi
    mi r re
    re r dod

    %4
    red r red
    mi r re!
    dod r do

    %7
    do r do
    si r si
    la2 re4

    %10
    sol2 fad4~
    fad mi2
    re4 fad la

    %13
    mi8. fad16 sol2
    la2.

}

IIIvcn = \relative do' {

    mi4 mi, r
    mi' re r
    re dod r

    %4
    red8. mi16 fad8. mi16 red4
    mi r re!
    dod r do

    %7
    do8. do16 la8. si16 do4
    si8.[la16 sol8. la16] si4
    la2 re4

    %10
    sol2 fad4~
    fad mi2
    re4 re, re

    %13
    mi2.
    re

}

IIIbcn = \relative do {

    mi4 r r
    mi r re
    re r r

    %4
    red r r
    mi r r
    do r r

    %7
    do r r
    si r r
    la2 re4

    %10
    sol, r r
    R2.
    r4 re' re

    %13
    mi2.
    re

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <5>2.
    <2+>
    <4+ 2>
    <7 5>
    <_+>
    <6>
    <4+ 2>
    <6>
    <7>4 <6+> <_+ 7>
    s2.
    s
    s4 <_+>2
    <7>4 <6+>2
    <_+>

}


forma = {

    \time 3/4
    \key do\major
    \tempo 4 = 50
    s2.*14
    \bar "||"

}

IIIfl = {
    %\notypeset
    <<\IIIfln \forma>>

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}


IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}
IIIvc = {
    \clef tenor
    <<\IIIvcn \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IVfln = \relative do'' {

    R1*3
    sol'4. la8 si4. do8
    re4. sol,8 la4. si8

    %6
    la2~la4. la8
    sol4. si8 la4. sol8
    fad4. mi8 re2

    %9
    R1*2
    re'2 dod
    re1\tr~

    %13
    re~
    re
    R

    %16
    r4 r8 re re4. re8
    re2 dod
    re la

    %19
    la1
    R1*3
    la4. la8 si4. si8

    %24
    do1
    si4. la8 sol4. fad8
    sol2 fad

    %27
    mi r
    sol4. si8 la4. sol8
    fad2 r

    %30
    R1
    r4 r8 re' la4. si8
    do4. la8 si4. sol8

    %33
    la2 r
    R1*3
    r4 r8  re, sol4. sol8

    %38
    sol2 la
    re, sol
    mi fad

    %41
    re1

}


IVvlIn = \relative do'' {

    sol'2 re4. re8
    si4. si8 sol4. re'8
    sol4. sol8 la4. la8

    %4
    si4. la8 sol2
    R1
    r4 r8 la re2

    %7
    R1
    r2 r4 r8 re,
    la'4. re,8 si'4. re,8

    %10
    la'4. re,8 si'4. re,8
    la'4. si8 sol4. la8
    fad4. re8 la'4. re,8

    %13
    si'4. re,8 la'4. re,8
    si'4. sol8 la4. si8
    fad2 mi

    %16
    re r
    R1
    la'2 la,4. la8

    %19
    la1
    la'4. la8 si4. si8
    do4. mi,8 re4. do8

    %22
    do2 si
    do r
    mi4. mi8 fad4. fad8

    %25
    sol2 r
    R1
    mi4. mi8 fad4. fad8

    %28
    sol2 r
    r4 r8 re' la4. si8
    do4. la8 si4. sol8

    %31
    la2 r
    R1
    r4 r8 re, sol4. sol8

    %34
    sol4. mi8 do'4. do8
    do4. la8 si4. sol8
    la2 fad

    %37
    sol r
    r4 r8 mi, do'4. do8
    do4. la8 si4. sol8

    %40
    la2 fad
    sol1

}

IVvlIIn = \relative do'' {

    si2 la
    re, r
    si' fad'

    %4
    sol r
    R1
    la2 r

    %7
    re,, mi
    re4. mi8 fad4. sol8
    la2 re,4. si'8

    %10
    la2 re,4. si'8
    fad'2 mi
    re fad,

    %13
    sol fad
    sol4. si8 dod4. re8
    re2 dod

    %16
    fad r
    la, sol
    fad'2 fad,4. fad8

    %19
    fad1\mbreak
    fad'4. fad8 sold4. sold8
    la4. do,8 si4. la8

    %22
    la2 sold
    la r
    do la

    %25
    mi r4 r8 la
    si2 red
    si r

    %28
    re? mi
    la, fad'4. sol8
    la4. fad8 sol4. si8

    %31
    fad2 r
    fad, sol
    fad re'

    %34
    mi4. do8 mi4. mi8
    re2 re4. si8
    do2 la

    %37
    si r
    r4 r8 do mi4. mi,8
    la2 re,4. si'8

    %40
    do2 la
    si1

}

IVvlan = \relative do' {

    re2 la'
    sol r
    R1*2

    %5
    sol,4. si8 la4. sol8
    re'2 r
    si dod

    %8
    re r
    re re
    re sol4. re8

    %11
    re2 la
    la' fad
    sol fad

    %14
    sol r4 r8 sol
    fad4. sol8 la2
    la r

    %17
    fad mi
    re re4. re8
    re1\mbreak

    %20
    re2 re
    mi fa!
    mi mi

    %23
    mi r
    la fad
    si, r4 r8 la

    %26
    si2 si
    sol' r
    si,4. si8 dod4. dod8

    %29
    re2 re
    re re
    re r

    %32
    re re
    la' sol
    sol la

    %35
    la re,
    mi re
    re r

    %38
    do do
    re re
    mi re

    %41
    re1

}

IVvcn = \relative do' {

    sol2 fad
    sol4. sol8 si4. si8
    sol2 re'

    %4
    sol r
    sol,4. si8 la4. sol8
    fad2 r

    %7
    si dod
    re r
    fad, sol

    %10
    fad sol
    la la
    re, r

    %13
    R1
    r2 r4 r8 sol
    la2 la,

    %16
    re r
    R1
    re'2 re4 re

    %19
    re,1\mbreak
    re'4. re8 si4. si8
    la2 re

    %22
    mi mi,
    la r
    la red,

    %25
    mi r
    R1
    mi'2 r

    %28
    si4. si8 dod4. dod8
    re2 re,
    re' sol,

    %31
    re' r
    re re
    re si

    %34
    do la
    fad sol
    do, re

    %37
    sol r
    do la
    fad sol

    %40
    do, re
    sol1

}

IVbcn = \relative do {

    sol'2 fad
    sol2 r
    sol re

    %4
    sol, r
    R1
    fad'2 r

    %7
    R1*2
    fad2 sol
    fad sol

    %11
    la la,
    re r
    R1

    %14
    r2 r4 r8 sol
    la2 la,
    re r

    %17
    R1
    re2 re4. re8
    \parenthesize re,1

    %20
    re'2 si
    la re
    mi mi,

    %23
    la r
    la' red,
    mi r

    %26
    R1
    mi2 r
    si r

    %29
    r re
    re sol,
    re' r

    %32
    R1
    re2 si
    do la

    %35
    fad' sol
    do, re
    sol, r

    %38
    do la
    fad sol
    do re

    %41
    sol,1

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s2 <_+>
    s1*2
    <6>1
    s1*4
    <6+ 4>2  <3>
    <_+>1
    s
    s
    <6+ 4>2 <3>
    <_+>1
    s
    <_+>
    s
    <_+>2 <6+>
    s <_- 6>4. <5>8
    <6 4>2 <3>
    s1
    s2 <7 5>
    s1*3
    <6>1
    s2 <_+>
    <7>1
    <_+>
    s
    <_+>2 <6>
    <5> <5>
    s1
    <6>2 <_+>
    s1
    <5>2 <5>
    <6 5>1
    <6>2 <_+>

}


forma = {

    \time 2/2
    \key do\major
    \tempo 1 = 60
    s1*19
    \bar":..:"\break
    s1*22
    \bar ":|."

}

IVfl = {
    %\notypeset
    <<\IVfln \forma>>

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}


IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}
IVvc = {
    \clef tenor
    <<\IVvcn \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.7
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con

}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup \larger "Sinfonia Ottava [autografo 1715]"
    composer = \markup {"A. Scarlatti (1660-1725)"}
}

\markup \huge {[1.] Allegriss[im]o}

\score {

    <<
        \new Staff  <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup {Flauto}
            \Ifl \global
        >>

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Primo]"}
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Secondo]"}
                    \IvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \Ivc\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \Ibc\global
            >>
        >>

    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

%\pageBreak

\markup \huge {[2.] All[egr]o}

\score {

    <<
        \new Staff  <<
            \set Staff.midiInstrument = #"recorder"
            \IIfl \global
        >>

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIvc\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIbc\global
            >>
        >>

    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

%\pageBreak

\markup \huge {[3.] Adagio}

\score {

    <<
        \new Staff  <<
            \set Staff.midiInstrument = #"recorder"
            \IIIfl \global
        >>

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIvc\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIIbc\global
            >>
        >>

    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

%\pageBreak

\markup \huge {[4.] Vivace}

\score {

    <<
        \new Staff  <<
            \set Staff.midiInstrument = #"recorder"
            \IVfl \global
        >>

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IVvc\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IVbc\global
            >>
        >>

    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

