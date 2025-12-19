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

    r4
    r2 la'4 si
    la r sol si
    mi, r fa la

    %4
    la r si r
    la r si r\mbreak
    si r si la

    %7
    mi16[fad sol la si do re mi] re4 re
    re r la si
    la16 do si do la4 mi r

    %10
    fa r8 la la2
    la4 r\mbreak la4 r8 do
    do2\tr~do~

    %13
    do sol4 sol
    sol2\tr~sol
    do4 la la r8 mi

    %16
    mi4 r mi2~\mbreak
    mi mi~
    mi mi4 sold

    %19
    si si si2\tr~
    si si4 r
    mi, r mi r

    %22
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}


IvlIn = \relative do'' {

    r8 r16 la
    la si do re mi fad sold mi la4 sold
    la16[do, mi fa? sol? la si sol] do4 si
    do16[mi, mi fa sol la sib sol] fa4 mi

    %4
    fa16[mi re mi fa la sol fa] mi[fad sold la si? re, mi re]
    do la do mi la sol? la sol fad sol la fad si la si la\mbreak
    sol[fad mi red mi fad sol la] sol4 fad

    %7
    sol16[fad mi fad sol la si do] si4 la
    si16[la sol la si do re si] do4 si
    do r16 mi, re mi do8 si16 do la la' sol la

    %10
    fa sol mi sol fa sol mi sol fa sol mi sol fa sol mi sol
    fa mi fa sol la sol la sib\mbreak la sib sol sib la sib sol sib
    la sib sol sib la sib sol sib la[la, la si? do re mi fa]

    %13
    sol[do, re  mi fa sol la si] do4 si
    do16 sol fa sol mi8 re16 mi do sol' fa sol mi8 re16 mi
    do sol' fa sol mi la sol la fa re do re si mi re mi

    %16
    do mi re fa mi sold fad la sold si la si sold8 fad16 sold\mbreak
    mi si' la si sold8 fad16 sold mi fad sold la si do la do
    si do la do si do la do si sold fad sold mi mi red mi

    %19
    si mi red mi sold, mi' red mi mi,8 sold si[mi]
    sold[si,] mi sold si16[la sold fad mi red dod si]
    mi si mi si sold mi' si[sold] mi4 r

    %22
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IvlIIn = \relative do'' {

    r4
    r2 do'4 si
    do r mi, re
    mi r re' dod

    %4
    re r si r
    mi, r si r\mbreak
    si r re re

    %7
    si r sol' fad
    sol r mi sold
    la16 mi re mi do8 si16 do la la' sol la fa8 mi16 fa

    %10
    re mi dod mi re mi dod mi re mi dod mi re mi dod mi
    re dod re mi fa mi fa sol\mbreak fa sol mi sol fa sol mi sol
    fa sol mi sol fa sol mi sol fa[fa, fa sol la si do re]

    %13
    mi[mi, fa sol la si do re] mi4 re
    mi8 re16 mi do sol' fa sol mi8 re16 mi do sol' fa sol
    mi8 re16 mi la,8 mi' la,16 si la si mi,8 si'

    %16
    la16 do si re do si la do si sold' fad sold mi si' la si\mbreak
    sold8 fad16 sold mi si' la si sold la mi fad sold la fad la
    sold la fad la sold la fad la sold mi red mi si4

    %19
    sold mi si8 mi sold si
    mi sold, si mi sold16 [fad mi red dod si la sold]
    si sold si sold mi si' sold mi si4 r

    %22
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivlan = \relative do' {

    r4
    r2 mi4 mi
    mi r sol sol
    sol r la la

    %4
    la r mi r
    do r fad r\mbreak
    mi r re la'

    %7
    sol r re re
    re r mi mi
    mi r mi r

    %10
    la, r8 la' la4 r8 la
    la4 r\mbreak do, r8 do
    do4 r8 do do4 r

    %13
    do' r sol sol
    sol r sol r
    mi r8 mi fa4 r8 mi

    %16
    mi4 r mi r\mbreak
    si' r si r
    si r si sold8 fad16 sold

    %19
    mi4 si sold8 si mi[sold]
    si mi, sold[si] mi,4 r
    sold16 mi sold mi si' sold mi si sold4 r

    %22
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivcn = \relative do' {

    r4
    r2 la4 mi
    la, r do' sol
    do, r re' la

    %4
    re, r sold r
    la r red r\mbreak
    mi r si re

    %7
    mi r sol, re'
    sol, r la mi
    la r la r

    %10
    re r8 la re4 r8 la
    re4 r\mbreak fa, r8 do'
    fa,4 r8 do' fa,4 r

    %13
    mi r mi sol
    do r do r
    do dod re sold,

    %16
    la r mi' r\mbreak
    mi r mi r
    mi r mi mi

    %19
    mi mi mi,8 mi mi mi
    mi mi mi' [mi] mi4 r
    mi, r mi r

    %22
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibcn = \relative do {

    r4
    r2 la'4 mi
    la, r do' sol
    do, r re' la

    %4
    re, r sold, r
    la r red r\mbreak
    mi r si re

    %7
    mi r sol re
    sol, r la' mi
    la, r la r

    %10
    re r8 la re4 r8 la
    re4 r\mbreak fa r8 do
    fa4 r8 do fa4 r

    %13
    mi r mi sol
    do, r do r
    do dod re sold,

    %16
    la r mi' r\mbreak
    mi r mi r
    mi r mi mi

    %19
    mi mi mi8 mi mi mi
    mi mi mi mi mi4 r
    mi r mi r

    %22
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2 s4 <_+>
    s1
    s2 s4 <_+>
    s1*2
    s2 <6>4 <_+>
    <5> s s <_+>
    s2 s4 <_+>
    s1
    s4 s8 <_+> s4 s8 <_+>
    s1*2
    <6>2 <6>
    s1*2
    s2 <_+>
    <_+> <_+>
    <_+> <_+>
    <_+> <_+>
    <_+> <_+>
    <_+> <_+>

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 2 = 50
    \partial 4 s4
    s1*22
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





IIfln = \relative do'' {

    r8 mi la sold r mi do' si
    r la do la re sol, fa16 mi fa sol
    mi8 sol do si r mi, la sib

    %4
    r re dod re r la sib16 la sib8
    r mi, fa16 mi fa8 r si! re16 do si8
    do la16 si do8 do do la16 si do8 si16 la

    %7 OOKK
    sol8 mi16 fad sol8 fa16 mi fa8 mi16 red mi8 do'\mbreak
    sol4 fad mi8 sol do4~
    do16 do si la si4~si16 si la sold la4~

    %10
    la16 la sol! fad sol4~sol16 sol fa mi fa8 fa
    fa16 mi re mi fa4 r8 mi la mi
    fa la re16 do si la sold8 mi mi fad16 sold

    %13
    la8[la] red,8. mi16 mi4 r8 do'
    si4 r8 la sold4 r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}


IIvlIn = \relative do'' {

    r4 r8 si do4 r8 sold
    la4 r8 do, re4 r8 re
    do mi r si' do4 r8 mi

    %4
    re4 r8 re dod re r re
    la4 r8 re re4 r8 re
    do4 r r2

    %7
    R1
    r2 r4 r8 mi,
    fa4 r8 fa mi4 r8 la

    %10
    la4 r8 re, do4 r8 fa
    fa4 r8 si do4 r
    R1

    %13
    r2 r8 si do4
    r8 sold la4 r8 si si4
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlIIn = \relative do'' {

    r4 r8 sold la4 r8 si
    do4 r8 la, si4 r8 si
    do4 r8 re mi4 r8 sol

    %4
    fa4 r8 la sol la r fa
    mi4 r8 la si4 r8 si
    la4 r8 la la fad16 si la8 sol16 fad

    %7
    mi8 sol16 la si8 si, do[do'] si mi,\mbreak
    mi4 red mi r8 do
    re4 r8 si' si4 r8 mi,

    %10
    re4 r8 sol sol4 r8 do,
    si4 r8 re mi4 r
    R1

    %13
    r2 r8 sold la4
    r8 si re4 r8 sold, sold4
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlan = \relative do' {

    r4 r8 mi mi4 r8 mi
    mi4 r8 la, si4 r8 si
    do4 r8 sol' sol4 r8 sib

    %4
    la4 r8 fa sol fa r sib
    la4 r8 fa fa4 r8 fa
    mi4 r8 la, red red red red

    %7
    mi mi, mi sol la la sol la\mbreak
    si la si4 mi, r8 sol'
    fa4 r8 re mi4 r8 do

    %10
    re4 r8 si do4 r8 la
    re4 r8 sol sol4 r
    R1

    %13
    r2 r8 mi mi4
    r8 mi la,4 r8 mi' mi4
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvcn = \relative do' {

    la4 r8 mi' la,4 r8 mi
    la4 r r2
    r4 r8 sol do4 r8 dod

    %4
    re fa mi fa mi re r re
    dod4 r8 re sold,4 r8 sold
    la4 r8 la red red red red

    %7
    mi mi, mi sol? la la sol la\mbreak
    si la si si, mi4 r8 mi
    re4 r8 re' do4 r8 do

    %10
    si4 r8 si la4 r8 la
    sol4 r8 sol do4 r8 dod
    re4 r8 fa mi4 r8 mi,

    %13
    fa4 fad mi8 mi' la,4
    r8 mi fa4 r8 mi mi4
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIbcn = \relative do {

    r4 r8 mi la,4 r8 mi'
    la,4 r r2
    r4 r8 sol' do,4 r8 dod

    %4
    re4 r8 fa mi re r re
    dod4 r8 re sold,4 r8 sold
    la4 r r2

    %7
    R1\mbreak
    r2 r4 r8 mi'
    re4 r8 re do4 r8 do

    %10
    si4 r8 si la4 r8 la
    sol4 r8 sol do4 r
    R1

    %13
    r2 r8 mi la,4
    r8 mi' fa4 r8 mi mi4
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 s8 <_+> s4 s8 <_+>
    s1
    s2 s4 s8 <7- 5>
    s4 s8 <6> <6+>4 s8 <6->
    s2 <7 5>4 s8 <7 5>
    s1*2
    s2 s4 s8 <6>
    <7>4 s8 <6> <7>4 s8 <6>
    <7>4 s8 <6> <7>4 s8 <6->
    <7>4 s8 <7> s2
    s1
    s2 s8 <_+> s4
    s8 <_+> <6>4 s8 <_+>

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 4 = 35
    s1*15
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

    R1*13\mbreak
    r4 la' do8 si do re
    si la si do la sol la si

    %16
    sol fa mi fa sol4 do
    fa,8 mi re mi fa4 do'
    mi,8 fa mi fa sol4 mi

    %19
    la8 si la si do4 la
    si la8 sol do2~
    do si

    %22
    do r
    R1*21
    r4 mi, sol8 fad sol la

    %45
    fad mi fad sol mi re mi fad
    re4 si' re8 do re mi\mbreak
    do si do re si la si do

    %48
    la sol fad sol la4 re
    si8 la sol la si4 re
    si8 la sol la si4 do

    %51
    si2 la
    sol r
    R1*8

    %61
    r4 mi fad fad
    sol2. fa!8 mi
    fa mi re mi fa4 la

    %64
    sib8 la sol la sib4 re
    la8 sol fa sol la4 re
    fa,2 mi

    %67
    re r\mbreak
    R1*8
    do'2 fa,

    %77
    R1
    re'2 la\mbreak
    R1

    %80
    sol2 do,
    R1
    do'2 sol

    %83
    R1*3
    re'2 sol,
    r4 la si si

    %88
    do2 si\mbreak
    la sold
    la r

    %91
    re la
    r4 la si si
    mi,2 si'

    %94
    r4 mi, fad fad
    sold8 la sold la si do si do
    la si la si la4 do

    %97
    si8 do si do si4 la
    sold2 la\mbreak
    R1*2

    %101
    la2 mi
    r4 la si si
    si2 la~

    %104
    la4 sold8 la si4 si
    do2 r4 la
    mi2 si'

    %107
    la r\fermata

}


IIIvlIn = \relative do'' {

    mi2 la,
    r4 la si si
    do2. si8 la

    %4
    si4 si mi2~
    mi4 re8 do re2~
    re4 do8 si do4 la

    %7
    sold2 la4 mi'
    do2 si
    mi, r

    %10
    r mi'
    la,4 la si2~
    si4 si' la la,

    %13
    la2 sold\mbreak
    la2 r
    R1*7

    %22 %% fine p. 9 OOKK
    r4 mi' fad fad
    sol2. fad8 mi
    fad4 fad sold sold\mbreak

    %25
    la2. si8 la
    sold4 la8 sold la4 do,8 si
    la2 re,

    %28
    r la''
    re, sol~
    sol4 fad8 mi fad2~

    %31
    fad4 mi8 red mi4 si
    do1
    r4 si dod dod

    %34
    re2 re
    r4 la' si si\mbreak
    do2. si8 la

    %37
    si2. la8 sol
    la2. sol8 fad
    sol2. fad8 mi

    %40
    fad4 la si si,
    dod mi fad fad
    sol8 la sol fad mi2~

    %43
    mi red
    mi r
    R1*3

    %48
    r4 re,\p fad re
    sol si sol fad
    sol2 sol~

    %51
    sol fad
    r4 sol' si8 la si do
    la sol la si sol fad sol la

    %54
    fad sol fad sol la sol la si
    sol la sol la si la si do
    la si la si do si do re\mbreak

    %57
    si la sol la si4 re
    fa,!8 mi re mi fa4 re'
    mi,8 re mi fa sol4 la

    %60
    mi2 re
    mi r
    r4 sol,\p la la

    %63
    la8 sol fa sol la4 fa
    sol8 la sib la sol4 sib
    la2 r

    %66
    R1
    re'2 la\mbreak
    r4 la, fa'8 mi fa sol

    %69
    mi re mi fa re do re mi
    do si la si do4 fa
    sib,8 la sol la sib4 fa'

    %72
    la,8 sib la sib do4 la
    re8 mi re mi fa4 re
    mi re8 do fa2~

    %75
    fa mi
    fa r
    r4 mi fad fad

    %78
    sol2. fa!8 mi\mbreak
    fa2. mi8 re
    mi fa mi fa sol4 do,

    %81
    fa2 sol,~
    sol8 la sol fa mi4 do'~
    do re mi8 re mi fa

    %84
    mi2 r
    sol do,
    r4 si dod dod

    %87
    re2 si
    r4 la' si si\mbreak
    do2 si

    %90
    la4 mi fad fad
    sol2. fad8 mi
    fad2 re

    %93
    r4 mi fad fad
    sold2 la
    r4 si re8 mi re mi

    %96
    do re do re do4 la
    sold8 la sold la sold4 la
    si si, do8 re do re\mbreak

    %99
    do4 do' si la
    la2 sold
    la r4 do,

    %102
    re2 re
    r4 sold, la do
    do2 si

    %105
    la4 la' do si8 la
    la2 sold
    la r\fermata

}

IIIvlIIn = \relative do'' {

    R1
    la2 mi
    r4 mi fad fad

    %4
    sol2. fad8 mi
    fad4 fad si la
    sold2 la4 do

    %7
    si do8 si do2
    mi, sol?~
    sol4 do re2~

    %10
    re4 re si la8 sol
    la4 si8 la sol4 fa!
    mi2. do'4

    %13
    si2 si\mbreak
    do2 r
    R1*8

    %23
    r4 si dod dod
    re2. do!8 si\mbreak
    mi4 fa8 mi fa mi re do

    %26
    si4 do8 si do2
    R1
    r4 mi fad fad

    %29
    sol2. la8 sol
    la2. sol8 fad
    sol4 la8 si la4 mi~

    %32
    mi mi fad fad
    sol2. fa!8 mi
    fa4 la si si

    %35
    do si2 sold4\mbreak
    la do, re2~
    re4 mi8 fad sol2~

    %38
    sol4 fad8 mi fad4 la,
    si re mi mi
    la, fad' sold sold

    %41
    la2 si
    r4 si, do do
    si1

    %44
    si2 r4 mi,
    re2 do
    si r\mbreak

    %47
    R1*5
    r4 si' sol'8 fad sol la
    fad mi fad re dod2

    %54
    re8 mi re mi fad mi fad re
    re'2 r
    re, r\mbreak

    %57
    re r
    re8 mi fa sol la4 sol
    sol, do8 re mi4 do

    %60
    do2 si
    do2 r4 la,\p
    si si dod2

    %63
    re r4 re
    sol,2 r4 sol'
    fa re fa sib,

    %66
    la2 la
    r2 la''\mbreak
    re, r4 la

    %69
    si2 r4 si
    la do fa, la
    mi'2 r

    %72
    do' fa,
    fa, r4 sib
    do2 do4 re

    %75
    la2 sol
    la4 la' si! si
    do2. si8 la

    %78
    si4 si, dod dod\mbreak
    re2. do!8 si
    do re do re mi4 la

    %81
    re,8 mi re mi fa4 re
    mi8 fa mi fa sol4 mi
    la si do2~

    %84
    do si
    do4 mi, fad fad
    sol1

    %87
    fa
    mi2 sold\mbreak
    mi re

    %90
    mi4 do la2
    r4 re mi mi
    la,2 sold

    %93
    la4 la' si si,
    si2 do
    si sold

    %96
    mi r
    si' r4 fad'
    mi2~mi8 fa! mi fa\mbreak

    %99
    mi2 re4 fa
    do2 si
    do r4 la

    %102
    la2 fa
    r4 mi mi2~
    mi sold

    %105
    mi r4 re'
    do2 si
    do r\fermata

}

IIIvlan = \relative do' {

    R1*6
    mi2 la,
    r4 la si si

    %9
    do2. si8 la
    si4 si mi2~
    mi4 re8 do re2~

    %12
    re4 do8 si do4 mi
    fa2 mi\mbreak
    mi r

    %15
    R1*7
    r4 do re re
    mi2 la,

    %24
    re,4 re' mi mi\mbreak
    do2 re
    mi r4 mi

    %27
    fad4 fad sold sold
    la2 re,~
    re4 re mi2~

    %30
    mi4 mi si' si
    sol4. fad8 mi2
    la2. do4

    %33
    si sol la2~
    la fa
    mi mi\mbreak

    %36
    la,4 mi' fad fad
    sol2 si,
    do re

    %39
    sol4 re la'2
    la mi
    la,4 la' fad2

    %42
    si,4 si'2 la4
    sol2 fad
    sol r

    %45
    R1*5
    r4 mi re do
    re1

    %52
    sol,2 re'~
    re sol
    la la

    %55
    si r
    la r\mbreak
    si r

    %58
    la r4 re,
    do2 r4 la'
    sol2 sol

    %61
    sol r
    R1*3
    la2 re,~

    %66
    re dod
    r4 re mi mi\mbreak
    fa2 re

    %69
    si r4 mi
    mi2 la
    sib r

    %72
    fa8 sol fa sol la4 la,
    sib8 do sib do re2
    sol fa4 re

    %75
    do2 do
    r4 do re re
    mi2 re

    %78
    R1\mbreak
    r4 la' si si
    sol2 mi4 fa

    %81
    sol2 r4 si
    do do,8 re mi4 sol
    fa2 sol

    %84
    r4 mi fa fa
    sol2 la
    si sol

    %87
    la sold
    la r\mbreak
    la re,

    %90
    r la'
    re,4 sol mi2
    re1

    %93
    dod4 la'2 la4
    mi2 red
    mi r

    %96
    la red,
    si' r4 red,
    mi2 mi\mbreak

    %99
    la,4 do fa2
    mi mi
    mi r4 mi

    %102
    re2 si'
    r4 si mi,2~
    mi mi

    %105
    do r4 fa
    do2 mi
    mi r\fermata

}

IIIvcn = \relative do' {

    R1*7
    la2 mi
    r4 mi fad fad

    %10
    sol2. fad8 mi
    fad4 fad si la
    sold2 la4 do

    %13
    re2 mi\mbreak
    la, r4 la
    sol2 fa

    %16
    mi mi'4 mi,
    re8 mi fa sol la4 fa
    do do'8 re mi4 do

    %19
    fa fa,8 sol la4 fa
    sol fa mi fa
    sol2 sol,

    %22
    do r
    R1*3
    mi'2 la,

    %27
    r4 la si si
    do2. si8 la
    si2 mi4 re

    %30
    dod2 red
    mi4 si do sol
    la2 red,

    %33
    mi la
    re sold,
    la r\mbreak

    %36
    R1*3
    r4 si dod dod
    re re, r2

    %41
    r4 dod' red red
    mi sol ,la la
    si2 si,

    %44
    mi r
    R1
    r2 r4 si'\mbreak

    %47
    la2 sol
    re' r
    R1

    %50
    r4 mi re do
    re2 re,
    sol sol

    %53
    re' mi
    re do
    si r

    %56
    fad r\mbreak
    sol r
    re' r4 si

    %59
    do2 r4 fa,
    sol2 sol
    do, r

    %62
    R1*5
    re'2 dod\mbreak
    re2 r4 re

    %69
    sold,2 r4 sold
    la2 r4 la
    sol!2 r

    %72
    fa r
    sib r
    sib la4 sib

    %75
    do2 do,
    fa re'
    do re

    %78
    sol, la\mbreak
    re sol,
    do r

    %81
    si r
    do r4 do
    fa2 do

    %84
    r4 do re re
    mi2 la,
    sol mi'

    %87
    re r
    la mi\mbreak
    r4 la si si

    %90
    do2. si8 la
    si4 si dod dod
    re2 si

    %93
    r4 dod red red
    mi2 red
    mi r

    %96
    mi red
    mi r
    mi la,\mbreak

    %99
    r4 la re, re'
    mi2 mi,
    la r4 la

    %102
    fa'2 re
    r4 mi do la
    mi'2 mi,

    %105
    la r4 re
    mi2 mi,
    la r\fermata

}

IIIbcn = \relative do {

    R1*7
    la'2 mi
    r4 mi fad fad

    %10
    sol2. fad8 mi
    fad4 fad si la
    sold2 la4 do,

    %13
    re2 mi\mbreak
    la, r
    R1*11

    %26
    mi'2 la,
    r4 la si si
    do2. si8 la

    %29
    si2 mi4 re
    dod2 red
    mi4 si' do sol

    %32
    la2 red,
    mi la,
    re sold,

    %35
    la r\mbreak
    R1*3
    r4 si dod dod

    %40
    re2 r
    r4 dod red red
    mi sol la la

    %43
    si2 si,
    mi r
    R1*7

    %52
    r2 sol
    re mi
    re do

    %55
    si r
    fad' r\mbreak
    sol r

    %58
    re r4 si
    do2 r4 fa
    sol2 sol,

    %61
    do r
    R1*5
    re2 dod\mbreak

    %68
    re2 r4 re
    sold,2 r4 sold'
    la2 r4 la

    %71
    sol!2 r
    fa r
    sib, r

    %74
    sib la4 sib
    do2 do,
    fa' re

    %77
    do re
    sol la\mbreak
    re, sol

    %80
    do, r
    si r
    do r4 do

    %83
    fa2 do
    r4 do re re
    mi2 la,

    %86
    sol mi'
    re r
    la' mi\mbreak

    %89
    r4 la si si
    do2. si8 la
    si4 si, dod dod

    %92
    re2 si
    r4 dod red red
    mi2 r

    %95
    mi r
    mi r
    mi r

    %98
    mi' la,\mbreak
    r4 la re,2
    mi mi,

    %101
    la r4 la'
    fa2 re
    r4 mi do la

    %104
    mi'2 mi,
    la r4 re
    mi2 mi,

    %107
    la r\fermata

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*7
    s2 <_!>
    s4 <6> <6 5>2
    <5>2 <6>
    <7> <6 _!>4 <6- 4>
    <6 5>2 s4 <6>
    <6 5>2 <_+>
    s1*12
    <_+>1
    s4 <6+> <6+>2
    <6 4+>1
    <6!>2 <5>
    <6 5> <6 5>
    <9>4 <_+> <6> <6>
    s2 <7 5>
    s <_+ 7>
    s <7 5>
    s1*4
    s4 <6> <6 5>2
    <_+>1
    s4 <6> <6 5>2
    s4 <6> <9> <8>
    <6 4>2 <3>
    s1*9
    <_+>2 <6+>
    <_+> <6 4+>
    <6> s
    <6> s
    s1
    <_->2 s4 <6>
    s1
    <6 4>2 <3>
    s1*9
    s2 s4 <6>
    <_- 6>1
    s
    s
    <4! 2>
    <6 4>2 <3>
    s <6!>
    <_!> <_+ 7>
    s <_+ 7>
    <_-> <_! 7>
    s1
    <6>
    s
    s
    s2 <6>
    <6> <6+>
    s <6+>
    s1
    s2 <_+>
    s <6+>
    <6> s
    <6> <6 5>
    <_+> <6+>
    s4 <6> <6 5>2
    <_+>1
    <_+>
    <6 4>
    <_+>
    <_+>
    s2 <6>4 <5>
    <6 4>2 <3>
    s1
    <6>2 <6>
    s4 <_+> <6>2
    <6 4> <3>
    s1
    <6 4>2 <3>

}


forma = {

    \time 2/2
    \key la\minor
    \tempo 1 = 55
    s1*107
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

    fa8 fa fa fa fa16 mi fa8 r fa
    sol sol sol sol sol16 fa sol8 r sol16 la
    sib8 sib sib sib sib16 sol la8 r la16 sib

    %4
    do8 fa, fa re' do fa, fa re'
    do sib16 la sib la sol sib la8 fa16 sol la si do re
    si8 la16 sol do4. si16 la si8. do16

    %7
    do4 r8 la16 si do4 r8 la16 si\mbreak
    do8 la sol do do4 si
    do8 do do do si si si si

    %10
    mi, mi mi mi' re re re re
    si[si] do do la la la si
    si[si] mi, mi si' si si si

    %13
    la la la la sol sol sol sol
    fa sol la la la la la la
    mi1

}


IVvlIn = \relative do'' {

    la4 fa do8 do' do do,
    re16 mi fa4 re8 mi mi mi mi
    fa4 sol sol8 fa16 mi fa4

    %4
    fa r8 fa16 mi fa4 r8 fa16 mi
    fa8 fa4 mi8 fa4 r8 la
    sol4 sol8 la fa2

    %7
    sol8 sol la4 r8 sol la4\mbreak
    r8 fa do' sol fa fa fa fa
    mi sol sol la si si si si

    %10
    dod dod dod dod re re re re
    re re do[do] do do do si
    sold[sold] la la la la sol[sol]

    %13
    sol sol fa [fa] fa fa mi[mi]
    mi4 re8 re' do do do4
    si si si2

}

IVvlIIn = \relative do'' {

    fa,4 re la8 la' la la,
    sib4 si do8 do do do
    re4 mi fa r8 re

    %4
    la4 r8 sib la4 r8 sib
    la4 sol8 do fa4 r8 fa
    fa4 mi8 fa re2

    %7
    mi8 mi fa4 r8 mi fa4\mbreak
    r8 fa mi mi re re re re
    do  mi mi mi fa fa fa fa

    %10
    mi mi mi mi la la la la
    sold sold la[la] la la la fad
    mi mi mi mi red red mi[mi]

    %13
    dod dod re[re] re re dod[dod]
    la'4 la la la
    la sold8 fad sold2

}

IVvlan = \relative do' {

    fa4 re la8 la' la la,
    sib4 si do8 do do do
    re4 mi fa r8 re

    %4
    la4 r8 sib la4 r8 sib
    la4 sol8 do fa,4 r8 fa'
    fa4 mi8 fa re2

    %7
    mi8 mi fa4 r8 mi fa4\mbreak
    r8 fa mi mi re re sol,[sol]
    do do do do re re re mi

    %10
    la, la la la la la re[re]
    mi mi mi mi fad fad fad fad
    si, si la[la] fad' fad mi[mi]

    %13
    mi mi re[re] si[si] sol' sol
    la4 la, mi' fad
    si, mi8 red mi2

}

IVvcn = \relative do' {

    R1*7\mbreak
    r2 r8 re sol,[sol]
    do do do do sold sold sold sold
    sol! sol sol sol fa fa fa fa
    mi mi la[la] red, red red red
    re! re do[do] si si mi[mi]
    la la re,[re] sol sol do,[do]
    fa4 fa mi red
    mi mi mi2

}

IVbcn = \relative do {

    R1*8
    r8 do do do sold sold' sold sold
    sol! sol sol sol fa fa fa fa

    %11
    mi mi la,[la] red red red red
    re! re do[do] si si mi[mi]
    la, la re[re] sol, sol do[do]

    %14
    fa4 fa, mi 'red
    mi mi mi2

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*8
    s8 <5> s <6> <7 5> s s <6>
    <6 4+>2 <6>
    <_+ 7> <7 5>4 s8 <6>
    <4+ 2>4 <6> <_+ 7> <_!>
    <_+ 7> <_-> <_! 7> s
    <7> <6> <6 4> <7 5>
    <4> <3+> <_+>

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 4 = 35
    s1*15
    \bar "||"

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



Vfln = \relative do'' {

    R2.
    r4 r8 la'16 si do si do re
    si4 r8 sol16 la si la si do

    %4
    la4 r8 fa16 sol la sol la si
    sol4 r r
    r r8 mi16 fad sol fad sol la

    %7
    fad4 r8 fad16 sold la sold la si
    sold8 mi mi4 mi
    mi r r

    %10
    r4 r8 la re16 do si la
    sold4. la8 si4
    mi,2.

    %13
    R2.\mbreak
    r4 r8 la sol16 fa sol la
    fa4 r8 re' do16 sib do re

    %16
    sib4 la r
    r r8 la re16 do re si
    do4 r r

    %19
    r r8 sol do16 si la sol
    fad4 r8 si si4
    si4. si8 si4

    %22
    mi, mi mi
    mi r r
    r8 la mi mi la la

    %25
    la4 r8 mi si'4
    do r8 mi, mi mi
    la4 r r

}


VvlIn = \relative do'' {

    mi16 re do si la8 la' si sold
    la16 mi mi mi do'4 r
    r16 mi, mi mi si'4 r

    %4
    r16 la la la re4 r
    r16 sol, sol sol do do do do si si si si
    do sol sol sol la4 r

    %7
    r16 la la la si4 r
    r16 si, si si do re si re do re si re
    do la la la la' sol fa mi la sol fa mi

    %10
    fa8 mi mi4 re
    mi8 re16 do si la sold fad mi8 red
    mi2.

    %13
    si''16 la sold fad mi8 si' re, si'\mbreak
    dod,16 mi mi mi la4 r
    r16 la la la re4 r

    %16
    r16 re, re re fa sol fa sol mi re mi fa
    re mi fa mi fa4 r
    r16 sol fa sol mi re mi fa re do re mi

    %19
    do re mi re mi4 r
    r16 si' la si sol fad sol la fad mi fad sol
    mi mi, mi mi re'4 r16 mi, mi mi

    %22
    do'4 r16 mi mi mi la sold la si
    mi, re' do si do8 la si sold
    la16 la, la la sol'4 r16 sol fa mi

    %25
    fa re mi fa do si do re si la si do
    la la' sol fa mi re do si la8 mi
    la,4 r r

}

VvlIIn = \relative do'' {

    do4 r8 mi re si
    do4 mi r
    si8 sol mi'4 r

    %4
    la,8 fa la'4 r
    do,8 sol sol'16 sol sol sol fa fa fa fa
    mi mi, mi mi mi'4 r

    %7
    r16 fad, fad fad fad'4 r
    r16 sold, sold sold la si sold si la si sold si
    la do do do mi4 mi,8 la

    %10
    la sold la4 la
    si~si16 do si la sold8 fad
    sold2.

    %13
    mi'4. re16 do si8 re\mbreak
    la16 dod dod dod re4 r
    r16 fa fa fa sol4 r

    %16
    r8 re re4 dod
    la8 re16 dod re4 r
    r8 do do4 si

    %19
    do16 si do si do4 r
    r8 fad mi4 red
    mi r16 sold, sold sold si4

    %22
    r16 la la la do4 do
    si16 si' la sold la8 mi re si
    do4 r16 la la la dod mi re dod

    %25
    re8 la la4 sold
    la r8 sold la mi
    la,4 r r

}

Vvlan = \relative do' {

    mi4 r8 mi fa mi
    mi4 la r
    mi sol r

    %4
    re fa r
    sol8 do mi,16 mi mi mi fa fa fa fa
    sol sol sol sol mi4 r

    %7
    r16 la la la fad4 r
    r16 mi mi mi mi8 mi mi mi
    mi16 mi mi mi mi8 la r mi

    %10
    re si' la4 re,
    sold8 la si4. si,8
    si2.

    %13
    sold'4 si8 mi, fa!4\mbreak
    mi16 la la la la4 r
    r16 re, re re re4 r

    %16
    r8 sib' fa4 la
    la la fa8 re
    mi la sol4 sol

    %19
    sol sol la
    red, si' si
    sol r8 si, sold'4

    %22
    la16 do, do do mi4 mi
    sold mi8 la fa mi
    mi4 r16 dod dod dod mi8 la

    %25
    r fa mi4 mi
    do r8 mi la mi
    la,4 r r

}

Vvcn = \relative do' {

    la4 r8 do re mi
    la, la, la'4 r
    sol' sol, r

    %4
    fa' fa, r
    mi'8 mi, mi'16 mi mi mi re re re re
    do do do do dod4 r

    %7
    r16 re re re red4 r
    r16 mi mi mi la,8 mi' la,[mi']
    la,16 la la la do4 dod

    %10
    re8 mi fa4 fa,
    mi mi mi
    mi2.

    %13
    mi4 sold4. sold8\mbreak
    la4 fa' mi
    re sib la

    %16
    sol8 sol la4 la
    re re, fa8 re
    mi fa sol4 sol

    %19
    do8 do, do'[si] la4
    red mi si
    mi,4 r16 mi mi mi mi'4

    %22
    mi, mi' mi,
    mi la8 do re mi
    la,4 r la

    %25
    re,8 re' mi4 mi,
    la r8 mi la mi
    la,4 r r

}

Vbcn = \relative do {

    la'4 r8 do, re mi
    la,4 la' r
    sol, sol' r

    %4
    fa, fa' r
    mi, mi'8 mi re [re]
    do4 dod r

    %7
    re red r
   r8 mi [la mi] la mi
    la,4 do dod

    %10
    re8 mi fa4 fa,
    mi' mi mi
    mi2.

    %13
    mi4 sold4. sold8\mbreak
    la4 fa r
    re sib r

    %16
    r8 sol' la4 la,
    re re, r
    mi'8 fa sol4 sol,

    %19
    do do, r
    r8 red' mi4 si
    mi r mi

    %22
    mi r mi
    mi la,8 do re mi
    la,4 r la

    %25
    re mi mi,
    la r8 mi' la mi
    la,4 r r

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 s8 <6> <6> <_+>
    s2.
    <6>
    <6>
    <6>2 <6>4
    s2.
    <_+>
    s8 <_+> s <_+> s <_+>
    s4 <6> s
    s8 <_+> <7>4 <6>
    <_+>2.
    <_+>
    <_+>4 <6>4. <7- 5>8
    <_+>4 <6> s
    s <6> s
    s8 <_-> <6 4>4 <3>
    s2.
    <6>4 <6 4> <3>
    s2.
    s2 <_+>4
    s2 <_+ 7>4
    <6 4> s <6 4>
    <_+> s8 <6> <6> <_+>
    s2 <_+ 7>4
    s <6 4> <3>
    s4 s8 <_+>

}


forma = {

    \time 3/4
    \key la\minor
    \tempo 2 = 62
    s2.*12
    \bar ":..:"\break
    s2.*15
    \bar ":|."

}

Vfl = {
    %\notypeset
    <<\Vfln \forma>>

}

VvlI = {
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}


Vvla = {
    \clef alto
    <<\Vvlan \forma>>

}
Vvc = {
    \clef tenor
    <<\Vvcn \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
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
        subtitle = \markup \larger "Sinfonia Decima [autografo 1715]"
        composer = \markup {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] Vivace}

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

    \markup \huge {[2.] Adagio}

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

    \pageBreak

    \markup \huge {[3.] All[egr]o}

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

    \markup \huge {[4.] Adagio}

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

    %\pageBreak

    \markup \huge {[5.] Allegriss[im]o}

    \score {

        <<
            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \Vfl \global
            >>

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \Vvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \Vvc\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"harpsichord"
                    \Vbc\global
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



