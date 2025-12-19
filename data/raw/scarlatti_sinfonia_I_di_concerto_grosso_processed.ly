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



IflIn = \relative do'' {

    r4
    r2 r8 fa16 sol la4
    R1*2
    r2 r8 mi16 fa sol fa sol la\mbreak

    %5
    sol fa mi fa sol fa sol la sol fa mi fa sol fa sol la
    sib8 sib sib sib la16 sol la sib do4
    R1*2

    %9
    r2 r8 do16 si? do si do si
    la4 r\mbreak r8 sib16 la sib la sib la
    sol4 r r8 la16 sol la4

    %12
    r8 re16 do re8 re, r do'16 sib do8 do,
    r sib'16 la sib8 sib, r la'16 sol la8 la,
    r sol'16 fa sol8 sol, r fa'16 mi re8 re

    %15
    mi4 r fa r
    sol r \mbreak r8 la16 sib do sib do re
    do sib la sib do sib do re do sib la sol la sol la sol

    %18
    fa8 fa fa fa la la la la
    mi mi fa [fa] sol sol si! [si]
    do8 do sol do do4 do\mbreak

    %21
    do8 do do do do4 do
    do r do r
    mi mi re r

    %24
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IflIIn = \relative do'' {

    r4
    r2 r8 re16 mi fa4
    R1*2
    r2 r8 do16 re mi re mi fa\mbreak

    %5
    mi re do re mi re  mi fa mi re do re mi re mi fa
    sol8 sol sol sol fa16 mi fa sol la4
    R1*2

    %9
    r2 r8 la16 sol la sol la sol
    fad4 r\mbreak r8 sol16 fa? sol fa sol fa
    mi4 r r8 fa16 mi fa4

    %12
    r r8 re la'4  r8 do,
    sol'4 r8 sib, fa'4  r8 la,
    mi'4 r8 mi fa4 r8 si,!

    %15
    sol'4 r re' r
    do r\mbreak r8 fa,16 sol la sol la sib
    la sol fa sol la sol la sib la sol fa  mi fa mi fa mi

    %18
    re8 re re re do do do do
    sib sib do[do] mi mi fa[fa]
    mi mi mi mi mi4 mi\mbreak

    %21
    mi8 mi mi mi mi4 mi
    mi r mi r
    sol sol sol r

    %24
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}


IvlIn = \relative do'' {

    r8 r16 fa
    fa do do do fa do do do fa4 r16 fa fa sol
    la fa fa fa do' do, do do sib' sib, sib sib sol' do, do do
    la' la, la la fa' la, la la sol' sol, sol sol mi' sol, sol sol

    %4
    fa' re re re re' re, re re mi4 r\mbreak
    R1
    r2 r4 r8 r16 fa

    %7
    fa do do do fa do do do fa4 r
    r16 re re re la' re, re re la'4 r
    r16 mi mi mi si'? mi, mi mi do'4 r

    %10
    r16 re, re re la' re, re re\mbreak sib'4 r
    r16 do, do do sol' do, do do la'8 la, la'4~
    la sol2 fa4~

    %13
    fa mi2 re4~
    re do2 si4
    r16 sol' sol sol do sol sol sol sib4 r

    %16
    r16 do, do do sol' do, do do\mbreak la'4 r
    R1
    r16 fa fa fa sib fa fa fa do' do, do do fa do do do

    %19
    sol' mi mi mi la do, do do do' do, do do fa re re re
    sol sol, sol sol do sol sol sol mi' do do do sol' mi mi mi\mbreak
    do' sol sol sol do mi, mi mi sol do, do do mi sol, sol sol

    %22
    do mi, mi mi sol do, do do mi sol, sol sol sol' mi mi mi
    do' sol sol sol mi' do do do sol'4 r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IvlIIn = \relative do'' {

    r4
    la' la, la' r16 la la sib
    do4 r8 r16 fa, fa4 mi
    mi re re do

    %4
    do si do r\mbreak
    R1*2
    la'4 la, la'16 re, re re la' re, re re

    %8
    re'4 r r16 mi, mi mi la mi mi mi
    si'4 r mi, r
    fad fad\mbreak re r

    %11
    mi mi, r16 do' do do fa do do do
    re sib sib sib sib' re, re re do' do, do do la' do, do do
    sib' sib, sib sib sol' sib, sib sib la' la, la la fa' la, la la

    %14
    sol' sol, sol sol mi' sol, sol sol fa' fa, fa fa re' fa, fa fa
    mi'4 r fa16 re re re fa re re re
    sol4 r\mbreak do, r

    %17
    R1
    r8 re re'[re,] la'16 la, la la la' la, la la
    sib sib sib sib fa'8 fa do8. do16 si si si si

    %20
    mi mi, mi mi mi' mi, mi mi do' mi, mi mi mi' do do do\mbreak
    sol' mi mi mi sol sol, sol sol mi' mi, mi mi do' mi, mi mi
    sol do, do do mi4 mi r

    %23
    r16 mi mi mi do' sol sol sol re'4 r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivlan = \relative do' {

    r4
    do' do, re r
    fa r8 r16 fa sol4 sib
    la la,8. re16 mi4 sol8 do

    %4
    re, fa si,!4 sol' r\mbreak
    do,\solo do do do
    do do fa fa16 fa fa fa

    %7
    la\tu la la la do8 do, re4 r
    fa r mi r
    mi r la r

    %10
    la la\mbreak sol r
    sol sol fa do
    sib8 re sol,[sol'] la do do,[fa]

    %13
    sol sib mi,! [sol] la4 la,8 re
    mi4 sol8 sol, re'4 fa
    sol r fa r

    %16
    do' r\mbreak fa, r
    fa\solo fa fa la
    sib8 sib\tu  fa[sib] fa fa fa fa

    %19
    sib sib la[la] sol sol re'[re,]
    mi mi sol[sol] sol4 sol\mbreak
    mi8 mi mi mi mi4 mi

    %22
    mi r sol r
    sol sol sol r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivcn = \relative do {

    r4
    fa8 la fa[la] re re, r4
    la'8 la, r r16 la' sol4 do
    r16 fa, fa fa la fa fa fa sol mi mi mi sol mi mi mi

    %4
    re4 sol do, r\mbreak
    R1*2
    fa4 fa re r

    %8
    re' r do r
    sold r la r
    re re,\mbreak sol r

    %11
    do do, fa fa
    sib sib, la'8 la, la la'
    sol sol, sol sol' fa fa, fa fa'

    %14
    mi mi, mi mi' re re' re re,
    do4 r re r
    mi r\mbreak fa r

    %17
    R1
    r8 sib sib sib la la la la
    sol sol fa[fa] mi mi re[re]

    %20
    do do' do do do4 do,\mbreak
    do8 do' do do do4 do,
    do' r do r

    %23
    do do, si r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibcn = \relative do {

    r4
    fa fa re r
    la' r8 r16 la sol4 do,
    fa fa, mi' mi,

    %4
    re' sol, do r\mbreak
    R1*2
    fa4 fa re r

    %8
    re r do' r
    sold r la r
    re, re\mbreak sol r

    %11
    do, do fa fa
    sib sib, la' la,
    sol' sol, fa' fa,

    %14
    mi' mi, re' re,
    do' r re r
    mi r\mbreak fa r

    %17
    R1
    r8 sib sib sib la la la la
    sol sol fa[fa] mi mi re[re]

    %20
    do do' do do do4 do,\mbreak
    do8 do' do do do4 do,
    do r do r

    %23
    do' do, si r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    <5>2 <5>
    <6>4 s8 s16 <6> <_- 7>4 <_!>
    <7> <6> <7> <6>
    <7> <_! 7> s2
    s1*2
    <5>2 <5>
    s <6>
    s1
    <_+>2 <_->
    s1
    <7>4 <6> <7> <6>
    <_- 7> <6> <7 > <6>
    <7> <6> <7> s
    s2 <6->
    <6>1
    s
    s2 <6>
    <6> <6>4 <6!>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 52
    \partial 4 s4
    s1*24
    \bar "|"

}

IflI = {
    %\notypeset
    <<\IflIn \forma>>

}

IflII = {
    <<\IflIIn \forma>>

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
    \clef bass
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



IIflIn = \relative do'' {

    R2.*3\mbreak
    r8 sib' sib sol16 la sib8 sib
    sib sol16 fa sol8 mi16 fa sol8 sol

    %6
    sol sib sib sol16 la sib8 sib
    sib2.~
    sib4 sol mi

    %9
    re fad fad
    re re re
    re sol8 la sib4\mbreak

    %12
    dod,8 [re mi fa] sol fa16 mi
    fa8 mi fa mi fa4
    mi8 fa sol[fa] mi la

    %15
    mi4 r r
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R1*24

    %41
    r4 do' fa, sib
    la2 sol
    fa8 mi fa sol la sol la sib

    %44
    sol la sib sol la sol la sib
    sol la sib la sol fa sol la
    fa mi fa sol la4 sib

    %47
    fa2 mi
    re r
    R1*19

    %68
    r4 la' mi do'\mbreak
    si2 la4 re~
    re do2 si4~

    %71
    si la2 sold4
    la do8 si la sol? fa mi
    fa sol fa mi re2

    %74
    r4 sol do, la'
    sol2 fa
    mi8 fa sol la sib la sol sib

    %77
    la sib do sib la sol la sib
    sol la sib sol la sol la sib\mbreak
    sol2 r

    %80
    sol r
    sol r
    sol r

    %83
    sol r
    R1
    do2 r

    %86
    re r
    sol, r\mbreak
    fa r

    %89
    do' r
    do r
    re r

    %92
    sol, r
    sol r
    sol r

    %95
    sol8 la sol la sib la sib la
    sol la sol la sib la sib la\mbreak
    sol2 r

    %98
    sol r
    sol r
    la r4 fa

    %101
    sol2 do
    do r
    do r

    %104
    sol do
    do do
    do r\fermata

}

IIflIIn = \relative do'' {

    R2.*3\mbreak
    r8 sol' sol mi16 fa sol8 sol
    sol mi16 re mi8 dod16 re mi8 mi

    %6
    mi sol sol mi16 fa sol8 sol
    sol2.~
    sol4 sib sol

    %9
    la la la
    sold sold si?
    re re re,\mbreak

    %12
    la' dod,8 re mi re16 dod
    re8 dod re dod re4
    dod8 re mi re dod4

    %15
    dod? r r
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R1*23
    
    %40
    r4 sol' do, fa
    mi2 re
    do4 fa2 mi4~
    
    %43
    mi re8 mi fa mi fa sol
    mi fa sol mi fa mi fa sol 
    mi fa sol fa mi2~
    
    %46
    mi re~
    re dod
    re r
    
    %49
    R1*20
    r4 mi la, la'
    sol2 fa
    
    %71
    mi8 re mi fa re do re mi
    do4 mi8 re do4 la'
    r4 re,8 do si4 sol'8 fa
    
    %74
    mi fa mi fa sol4 do,
    do'2 si
    do4 mi,8 fa sol fa mi sol
    
    %77
    fa sol la sol fa mi fa sol
    mi fa sol mi fa mi fa sol\mbreak
    mi2 r
    
    %80
    mi r
    mi r
    mi r
    
    %83
    mi r
    R1
    la2 r
    
    %86
    fa r
    mi r\mbreak
    la r
    
    %89
    sol r
    la r
    sol r
    
    %92
    mi r
    mi r
    mi r
    
    %95
    mi8 fa mi fa sol fa sol fa
    mi8 fa mi fa sol fa sol fa\mbreak
    mi2 r
    
    %98
    mi r
    mi r
    fa r4 do
    
    %101
    re2 mi
    la r
    la r
    
    %104
    re, mi
    la sib
    la r\fermata
    
}


IIvlIn = \relative do'' {

    fa4 fa, r8 fa'
    fa4 fa, r8 fa'
    mi mi, mi mi mi mi\mbreak

    %4
    sib'4 sib sol
    dod r r
    mi, r r

    %7
    r8 dod' dod re dod re
    sib sib' sib sib, sib sib
    la la' la la, la la

    %10
    re, re re re re re
    re'4 re re
    dod r r

    %13
    re r r
    la r r
    mi r r
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

    %17
    r4 fa' do fa  %% allegro
    mi2 re
    do4 sol'8 fa mi re do sib

    %20
    la2 sib4 sol
    fa8 sol la sib do4 sib
    la2 fa4 la\mbreak

    %23
    sib2 la4 sib
    do8 sib la sib sol4 do
    la2 r4 fa'

    %26
    do2 fa
    mi4 re do mi
    fa fa,2 sol4

    %29
    do, do'8 re mi fa sol mi
    do4 la8 sib do4 fa
    fa,2 r\mbreak  %% fine pagina 9

    %32
    r4 do'' fa, sib~
    sib la8 sol la4 fa
    mi8 re do mi re do sib re

    %35
    do4 re8 do re4 sol~
    sol8 mi sol fa mi re do si?
    la fa' la sol fa mi re do

    %38
    re si' la si do2~
    do si
    do r\mbreak

    %41
    R1*8
    r4 la\solo re, sol
    fa8 re fa mi re do sib la\mbreak

    %51
    do2 r4 mi
    la,8 fa' la sol fa mi re do
    re4 sib' la sib

    %54
    la re,2 dod4
    re8 la fa' mi re fa sib la
    sol la fa sol mi2

    %57
    fa r4 la\tu
    mi la re, re,
    fa do'8 sib la sol fa mi

    %60
    re4 re'8 do si! la sol fa\mbreak
    mi4 mi'8 re do si la si
    sol fa mi fa sol4 si

    %63
    r mi la, sol'
    fa8 la, la' sol fa mi re do
    si re do si do4 la

    %66
    r la' la, re
    do2 si
    do r\mbreak

    %69
    R1*10
    r4 sol'\solo do, fa
    mi8 re mi re mi4 la

    %81
    r sol do, fa
    mi8 re mi re mi4 la
    sol r8 sol \tu la4 sol~

    %84
    sol fa2 mi4
    fa2 r8 do fa mi
    re2 r8 re sol fa

    %87
    mi2 r8 mi la sol\mbreak
    fa2 r
    r4 sol do, sib'

    %90
    la la, r2
    r8 sol' re' do si! la sol fa
    mi re do si do2

    %93
    r4 sol' mi la
    sol8 fa mi re do si do re
    mi2 r

    %96
    sol, r
    r8 sol' la sib la4 sol
    r8 sol la sib la4 sol

    %99
    r8 sol la sib la4 sol
    r do do, fa
    fa2 mi

    %102
    fa8 do do do mi do do do
    la'2 r4 do
    sol2 sol

    %104
    la8 la, la la mi' sol, sol sol
    la2 r\fermata

}

IIvlIIn = \relative do'' {

    re4 re, r8 re'
    re4 re, r8 re'
    dod dod, dod dod dod dod\mbreak

    %4
    sol'4 sol mi
    sib' r r
    dod, r r

    %7
    r8 sol' sib sib sib sib
    mi! sol sol sol, sol sol
    fad fad' fad fad, fad fad

    %10
    sold sold sold sold sold sold
    sol!4 sol sol\mbreak
    sol' r r

    %13
    fa r r
    dod r r
    dod, r r

    %16
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R1*3
    r4 do''?4 fa, sib
    
    %21
    la2 sol
    fa4 do'8 sib la sol fa mi\mbreak
    re do re mi fa la sol fa
    
    %24
    mi4 fa2 mi4
    fa do8 re mi4 la,
    sol do2 si4
    
    %27
    do8 sol sib la sol fa mi re
    do4 la' re, mi
    fa2 r
    
    %30
    R1
    r4 fa' do fa\mbreak
    mi2 re
    
    %33
    do4 do' fa, sib~
    sib la2 sol4~
    sol fa2 mi8 re
    
    %36
    mi4 do do'2~
    do4 do, re fa~
    fa8 re do re mi re do re 
    
    %39
    mi re mi fa re2
    mi r\mbreak
    R1*7
    
    %48
    r4 re\solo la re
    do2 sib
    la r4 re\mbreak
    
    %51
    sol,8 mi' sol fa mi re do sib
    do2 r4 la'
    sib re, fa re~
    
    %54
    re8 do sib la sol sib la sol
    fa4 la re re'
    dod re2 dod4
    
    %57
    re2 r
    r r4 sol,\tu
    do, fa r la,
    
    %60
    re8 do si? la sol fa mi re\mbreak
    do2 r
    r4 sol'' do, fa
    
    %63
    mi2 r4 mi
    la,2 r
    r4 mi' la, fa'
    
    %66
    mi do re8 do si la
    mi'2 sold
    la r\mbreak
    
    %69
    R1*11
    r4 sol\solo do, fa
    mi8 re mi re mi4 la
    
    %82
    r sol do, fa
    mi4 r8 mi\tu fa4 re
    do2 sol'
    
    %85
    la8 la, do sib la2
    r8 fa' re' do sib2
    r8 sol, mi' re do2\mbreak
    
    %88
    r8 la fa' mi re do sib la
    sol fa mi fa sol4 sol'
    do, do'8 sib la sol fa mi
    
    %91
    re mi fa mi re do si! la
    sol4 sol' mi la
    sol8 fa mi re do si do re
    
    %94
    mi4 sol mi la
    sol2 r
    mi, r\mbreak
    
    %97
    r8 mi' fa sol fa4 re
    r8 mi fa sol fa4 re
    r8 mi fa sol fa4 re
    
    %100
    fa2 r4 do'
    sol2 sol
    la8 la, la la do mi mi mi
    
    %103
    do4 do' do, fa
    fa2 mi
    fa8 fa, fa fa sol mi mi mi
    
    %106
    fa2 r\fermata
    
}

IIvlan = \relative do' {

    la'4 fa r8 re
    si4 si r8 re
    la la la la la la\mbreak

    %4
    dod4 dod dod
    sol' r r
    sib r r

    %7
    r8 mi, sol[sol sol sol]
    sol sol mi[mi mi mi]
    la la re,[re re re]

    %10
    re fa fa re re re
    sol4 sib sol\mbreak
    mi r r

    %13
    si'! r r
    mi, r r
    la, r r

    %16
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R1*11
    r4 do' fa, sib
    
    %29
    la2 sol
    fa4 do'8 sib la sol fa mi 
    re do re mi fa4 la\mbreak
    
    %32
    sol8 fa mi sol fa4. fa8
    sol mi fa sol do,4 re
    mi la sib re,
    
    %35
    r la' re, re'
    sol,2 sol
    la2. la4
    
    %38
    si?2 sol4 la
    sol2 sol
    sol r\mbreak
    
    %41
    r4 do,\solo re sol,
    la2 sib4 do
    re2 la
    
    %44
    do fa,
    do' dod
    re4. mi8 fa4 sol
    
    %47
    la2 la,
    re r
    R1*10
    
    %59
    r4 do'\tu fa, do'
    sol2 sol\mbreak
    sol8 la sol fa mi4 do
    
    %62
    do'2 mi,4 fa
    sol8 la sol fa mi sol fa mi
    re2. re4
    
    %65
    mi2 mi4 re
    la'2 la~
    la4 sol8 fa mi2
    
    %68
    mi r4 la\solo\mbreak
    sol2 fa
    mi re
    
    %71
    do si
    la r4 do
    re fa sol si,
    
    %74
    do2 mi4 fa
    mi2 re
    do do
    
    %77
    fa fa,
    do' fa,\mbreak
    do' r
    
    %80
    r4 do do la8 si
    do4 do, r2
    r4 do' do la8 si
    
    %83
    do4 r r re
    la'2 sib
    do r
    
    %86
    re, r
    sol r\mbreak
    re r
    
    %89
    do8 re do re mi4 mi,
    r8 fa' la sol fa mi re do
    sol'2 r
    
    %92
    do4 do, r2
    do'4 do, r2
    do'4 do, r2
    
    %95
    do' r
    do, r
    r4 do do re
    
    %98
    r do do re
    r do do re
    do2 r4 la'
    
    %101
    re,2 do
    do4 la' sol8 sol sol sol
    fa2 r4 do
    
    %104
    re2 do
    do'8 do, do do do' do, do do
    do2 r\fermata
    
}

IIvcn = \relative do {

    la'4 la, r8 la'
    sold4 sold sold
    sol!8 sol sol sol sol sol\mbreak

    %4
    sol4 sol sol
    sol r r
    sol r r

    %7
    r8 sol sol fa mi re
    dod dod dod dod dod dod
    do! do do do do do

    %10
    si! si si si si si
    sib4 sib sib\mbreak
    la r r

    %13
    sold r r
    la r r
    la r r

    %16
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R1*8
    r4 fa' do fa

    %26
    mi2 re
    do4 sol'8 fa mi re do sib
    la2 sib4 sol

    %29
    fa8 sol la sib do4 sib
    la fa'8 sol la4 la,
    sib sib' la fa\mbreak

    %32
    do'4 do, re8 mi fa re
    mi2 fa4 re'
    do do, sib sib'

    %35
    la la, si! si'
    do8 do, mi8 re do si la sol
    fa4 fa'8 mi re do si la

    %38
    sol4 sol' do, fa
    sol2 sol,
    do r\mbreak

    %41
    R1*9
    \clef tenor r4 re'8 do sib la sol fa\mbreak
    mi4 mi'8 re do sib la sol

    %52
    fa4 fa'8 mi re do sib la
    sol4 sol' re sol
    fa2 mi

    %55
    re8 re, re' do sib la sol fa
    mi4 re sol la
    re4 \clef bass re,\tu la re
    do2 sib

    %59
    la la
    si! si\mbreak
    r4 do' do, fa

    %62
    mi2. re4
    do2 dod
    re4 fa8 mi re do si la

    %65
    sold2 la4 re
    do2 fa
    mi mi,

    %68
    la r\mbreak
    R1*10
    r4 do'\solo la fa

    %80
    do' do, r2
    r4 do' do la8 si
    do4 do, r2
    r4 do'\tu fa, sib

    %84
    la2 sol
    fa4 la8 sol fa mi re do
    sib4 sib'8 la sol fa mi re

    %87
    do4 do'8 sib la sol fa mi\mbreak
    re4 re'8 do sib la sol fa
    mi2 mi

    %90
    fa r
    si,! r
    do r

    %93
    do r
    do r
    do r

    %96
    do r\mbreak
    do4 do' fa, sib
    r do fa, sib

    %99
    r do fa, sib
    la2 r4 la,
    sib2 do

    %102
    fa,8 fa'  fa fa do4 do'
    fa,2 r4 la,
    sib2 do

    %105
    fa8 fa fa fa do do do do
    fa,2 r\fermata

}

IIbcn = \relative do {

    la'4 la, r8 la'
    sold4 sold sold
    sol!8 sol sol sol sol sol\mbreak

    %4
    sol4 sol sol
    sol r r
    sol r r

    %7
    r8 sol sol fa mi re
    dod dod dod dod dod dod
    do! do do do do do

    %10
    si! si si si si si
    sib4 sib sib\mbreak
    la r r

    %13
    sold r r
    la r r
    la r r

    %16
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R1*8
    r4 fa' do fa

    %26
    mi2 re
    do4 sol'8 fa mi re do sib
    la2 sib4 sol

    %29
    fa8 sol la sib do4 sib
    la2 fa4 la
    sib2 la4 fa\mbreak

    %32
    do'2 re
    mi fa4 re
    do2 sib

    %35
    la si!
    do4 mi8 re do si la sol
    fa4 fa'8 mi re do si la

    %38
    sol4 sol' do fa,
    sol2 sol,
    do r\mbreak

    %41
    R1*16
    r4 \clef bass re\tu la re
    do2 sib

    %59
    la la
    si! si\mbreak
    r4 do' do, fa

    %62
    mi2. re4
    do2 dod
    re4 fa8 mi re do si la

    %64
    sold2 la4 re
    do2 fa
    mi mi,

    %68
    la r\mbreak
    R1*14
    r4 do'\tu fa, sib

    %84
    la2 sol
    fa4 la8 sol fa mi re do
    sib4 sib'8 la sol fa mi re

    %87
    do4 do'8 sib la sol fa mi\mbreak
    re4 re'8 do sib la sol fa
    mi2 mi

    %90
    fa r
    si,! r
    do r

    %93
    do r
    do r
    do r

    %96
    do r\mbreak
    do4 do' fa, sib
    r do fa, sib

    %99
    r do fa, sib
    la2 r4 la,
    sib2 do

    %102
    fa,4 fa' do do'
    fa,2 r4 la,
    sib2 do

    %105
    fa8 fa fa fa do do do do
    fa,2 r\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    <6 4>2.
    <7 5>
    <6 4+>
    <_- 6 4+>
    <_- 6 4+>
    <_- 6 4+>
    s8 <_- 6 4+> s <6> <5- 6 +> <6- 4>
    <7- 4>2.
    <6 4+>
    <6+>
    <6!>
    <_+ 7>
    <7 5>
    <_+>
    <_+>s  %%% fine adagio OOKK
    s1*9
    <6>2 <7>4 <6>
    s <_-> <6>2
    <6> s4 <6>
    s2 s4 <6 4>
    <6>1
    s2 <6>
    s <6->
    <6 5-> s4 <6->
    <7> <6> <7> <6>
    <7> <6> <6 5>2
    s4 <6> s2
    s1
    <7>
    <6 4>2 <3>
    s1*18
    <6>2 <6>
    <6> <6>
    s1
    s
    <6>2 s4 <6>
    s1
    s4 <6> s2
    s1
    <6>2 <6>
    <6 4> <3>
    s1*15
    s2 s4 <6>
    <7> <6> <7> <6>
    s1*12
    s2 s4 <6>
    s2 s4 <6>
    s2 s4 <6>
    <6>2 s4 <6>
    <6 4>1
    s
    s2 s4 <6>
    <6 5>1

}

forma = {

    \time 3/4
    \key do\major
    \tempo 4 = 50
    s2.*16
    \bar "|"\break\once \override Score.RehearsalMark.extra-offset = #'(+9 . -0)
    \mark\markup \huge{[3.] All[egr]o}
    \time 2/2
    \tempo 1 = 55
    s1*90
    \bar "||"

}

IIflI = {
    \notypeset
    <<\IIflIn \forma>>

}

IIflII = {
    <<\IIflIIn \forma>>

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
    \clef bass
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



IIIflIn = \relative do'' {
   
   la'8 sib la sib la4 r8 la
   sol sib16. la32 sol8 fa fa mi r mi
   la[sib do sib16 la] sib8 sib sib la
   
   %4
   sold[la si! la16 sold] la4 r8 la
   sol16 fa sol8 r sol fa16 mi fa8 r fa
   sol8 la sib la sol16. la32 sol16. la32 sib8 la\mbreak
   
   %7
   sol16. la32 sol16. la32 sib8 sib la la la la
   sol4 r8 sol la4 la
   sol2 r\fermata
   
   %10 OOKK
   R2*6
   \con \tuplet 3/2 { sol8 la sol } do8. sol16
   la4 sol\mbreak
   
   %18
   R2*2
   \tuplet 3/2 { la8 si la } re8. la16
   \tuplet 3/2 { si8 la sol }do8. do16
   
   %22
   do4 si
   do r
   \tuplet 3/2 { mi,8 fa mi } sol8. sol16
   
   %25
   do4 r
   R2
   r4 mi,8. mi16
   
   %28
   \tuplet 3/2 { mi8 fa mi } sol8. sol16
   sol2  %%%%%%% OOKK
   R2*3
   
   %33
   r4 r8 r16 la
   \tuplet 3/2 { la8 sib la } sib8. sib16
   la8. sol16 fa8. la16
   
   %36
   \tuplet 3/2 { la8 sib la } re8. la16
   \tuplet 3/2 { sib8 la sol } dod8. re16
   la4 dod
   
   %39
   re r
   R2
   r4 la8. la16\mbreak
   
   %42
   \tuplet 3/2 { do8 si la } sol8. fa16
   mi8. fa16 sol4
   R2
   
   %45
   r4 do8. do16
   \tuplet 3/2 { do8 sib la }sib4
   R2*2
   
   %49
   r4 do8. do16
   \tuplet 3/2 { do8 sib la } sib4
   R2*2
   
   %53
   do4 do
   do r
   
}

IIIflIIn = \relative do'' {
   
   fa8 sol fa sol fa4 r8 fa
   mi sol16. fa32 mi8 re re dod r dod
   re re do? re re4 re
   
   %4
   re4. do16 si mi8 dod16. re32 mi8 fa
   fa mi r mi mi re r re
   mi fa sol fa mi16. fa32 mi16. fa32 sol8 fa\mbreak
   
   %7
   mi16. fa32 mi16. fa32 sol8 sol sol fa fa fa
   fa mi r mi fa4 fa
   mi2 r\fermata
   
   %10
   R2*6
   mi4 mi8. mi16
   do4 mi\mbreak
   
   %18
   R2*2
   do4 fa
  \con \tuplet 3/2 { re8 do si } sol'8. la16
  
  %22
  mi4 re
  do r
  \tuplet 3/2 { do8 re do } mi8. mi16
  
  %25
  la4 r
  R2
  r4 do,8. do16
  
  %28
  \tuplet 3/2 { do8 re do } mi8. mi16
  mi2\mbreak
  R2*4
  
  %34
  \tuplet 3/2 { fa8 sol fa } sol8. sol16
  fa8. mi16 re8. fa16
  \tuplet 3/2 { fa8 sol fa } la8. fa16
  
  %37
  re4 mi8. fa16
  fa4 mi
  re r
  
  %40
  R2
  r4 do8. do16\mbreak
  \tuplet 3/2 { mi8 re do } re8. re16
  
  %43
  do8. re16 mi4
  R2
  r4 fa8. do16
  
  %46
  re8. do16 re4
  R2*2
  r4 fa8. do16
  
  %50
  re8. do16 re4
  R2*2
  la'4 la
  
  %54
  la r 
 
}


IIIvlIn = \relative do'' {
   
   R1*9
   fa4 do8. do16
   la8. la16 fa8. fa'16
   
   %12
   \con \tuplet 3/2 { la8 sib la } sol8. sol16
   do,8. do16 la8. la'16
   \tuplet 3/2 { do8 re do } sib8. la16
   
   %15
   la4 sol
   R2*2\mbreak
   \tuplet 3/2 { sol8 la sol } do8. sol16 
   
   %19
   la4 do,
   R2*3
   \tuplet 3/2 { do8 re do } mi8. mi16
   
   %24
   sol4 r
   r8 r16 fa sol8. la16
   \tuplet 3/2 { mi8 fa mi } re8. mi16 
   
   %27
   do4 sol8. sol16
   sol4 mi8. mi16
   mi2
   
   %30
   do''4 sol8. sol16
   mi8. mi16 do8. do16
   \tuplet 3/2 { sol'8 la sib } la8. sol16
   
   %33
   \tuplet 3/2 { sol8 fa mi } fa4 
   R2*5
   r8 r16 fa fa8. la16
   
   %40
   \tuplet 3/2 { la8 sol fa } mi8. re16
   do8. si16 la4\mbreak
   R2
   
   %43
   r4 do'8. do,16
   \tuplet 3/2 { fa8 sol fa } do'8. do,16 
   \tuplet 3/2 { la'8 sib la } r4
   
   %46
   r sib8. sib16
   \tuplet 3/2 { sib8 la sol } la8. sib16
   \tuplet 3/2 { la8 fa la } sol8. la16
   
   %49
   fa4 r
   r sib,8. sib16
   \tuplet 3/2 { sib8 la sol } la8. sib16 
   
   %52
   \tuplet 3/2 { la8 fa la } sol8. la16 
   fa8. la16 la8. do16
   fa4 r
  
}

IIIvlIIn = \relative do'' {
   
   R1*9
   R2*2
   fa4 do8. do16
   
   %13
   la8. la16 fa8. fa'16
   \con \tuplet 3/2 { la8 sib la } sol8. fa16
   fa4 mi
   
   %16
   R2*2\mbreak
   mi4 mi8. mi16
   do4 la
   
   %20
   R2*3
   sol4 do8. do16
   mi4 r
   
   %25
   r8 r16 do si8. do16
   do4 si
   mi mi,8. mi16
   
   %28
   mi4 do8. do16
   mi2\mbreak
   mi'4 re
   
   %31
   do r
   dod mi
   la, re
   
   %34
   R2*5
   r8 r16 re re8. fa16
   \tuplet 3/2 { fa8 mi re } si'!8. si,16
   
   %41
   la8. si16 do4\mbreak
   R2
   r4 mi8. mi16
   
   %44
   do4 sol'
   do, r
   r fa8. re16
   
   %47
   do4 fa8. sol16
   do,4 mi
   la, r
   
   %50
   r fa8. re16
   do'4 fa,~
   fa mi
   
   %53
   fa8. fa16 fa8. la16
   do4 r

}

IIIvlan = \relative do' {
   
   R1*9
   la'4 sol
   do, r
   
   %12
   do sol'
   fa r
   fa re8. fa16
   
   %15
   la4 do
   do\solo do,
   fa do\mbreak
   
   %18
   do\tu do
   do fa
   fa,\solo fa'
   
   %21
   fa mi8. fa16
   sol4 sol,
   mi'\tu sol
   
   %24
   do r
   r8 r16 fa, re8. re16
   sol4 sol
   
   %27
   sol do8. do,16
   do4 sol8. sol16 
   sol2
   
   %30
   sol'4 sol
   sol r
   sol mi
   
   %33
   re la'
   re,\solo sol,
   re' re,
   
   %36
   re' fa
   sol r
   la la,
   
   %39
   re r
   re\tu mi
   mi8. sold16 la4\mbreak
   
   %42
   la,\solo si
   do sol'\tu 
   la sol
   
   %45
   fa la8.\solo la,16
   sib4 re\tu 
   sol do,8. re16
   
   %48
   do4 do
   do la'8.\solo la,16
   sib4 re\tu 
   
   %51
   sol do,8. re16
   do4 do
   la8. do16 do8. fa16
   
   %54
   la4 r
   
   

}

IIIvcn = \relative do {
   
   re'4 r8 dod re re,16. mi32 fa8 re
   sol sol, r sold' la la, la' sol?
   fad sol la fad sol sol, sol' fa
   
   %4
   mi4 re8 mi dod la16. si32 dod8 re
   mi mi'16. re32 dod8 la re, re'16. do?32 sib8 sib16. la32
   sol8 fa mi fa do4 r8 fa\mbreak
   
   %7
   do'4 r8 do, fa[fa] si,! si
   do do16. re32 mi8 do la4 fa
   do'2 r\fermata
   
   %10 OOKK 
   fa4 mi
   fa r
   
   %12
   fa mi
   fa r
   fa sib
   
   %15
   do do,
   R2*2\mbreak
   do'4 do,
   
   %19
   fa fa,
   R2*3
   do''4 do,
   
   %24
   do r
   la' fa
   sol sol,
   
   %27
   do do'8. do16
   do4 do,8. do16
   do2\mbreak
   
   %30
   do4 si
   do r
   mi dod
   
   %33
   re re,
   R2*6
   re''4 sold,8. sold16
   
   %41
   la8. mi16 la,4\mbreak
   R2
   r4 do'
   
   %44
   la mi
   fa r
   r re8. re16
   
   %47
   \con \tuplet 3/2 { mi8 fa mi}  fa8. sib16
   do4 do,
   fa r
   
   %50
   r re'8. re,16
   \tuplet 3/2 { mi8 fa mi } fa8. sib16
   do4 do,
   
   %53
   fa8. fa,16 fa'8. fa16
   fa4 r
   
}

IIIbcn = \relative do {
   
   R1*9
   fa4 mi
   fa r
   
   %12
   fa mi
   fa r
   fa sib
   
   %15
   do do,
   R2*2\mbreak
   do'4 do,
   
   %19
   fa fa,
   R2*3
   do''4 do,
   
   %24
   do r
   la' fa
   sol sol,
   
   %27
   do do8. do16
   do4 do8. do16
   do2\mbreak
   
   %30
   do4 si
   do r
   mi dod
   
   %33
   re re,
   R2*6
   re'4 sold,
   
   %41
   la r\mbreak
   R2
   r4 do'
   
   %44
   la mi
   fa r
   r re
   
   %47
   mi fa8. sib16
   do4 do,
   fa r
   
   %50
   r re
   mi fa8. sib16
   do4 do,
   
   %53
   fa8. fa,16 fa'8. fa16
   fa4 r

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*9
    s4 <6>
    s2
    s4 <6>
    s2
    s4 <6>
    <6 4> <5 3>
    s2*9
    <6>4 <6>
    <6 4> <3>
    s2*5
    <6+>4 <6 5>
    <4> <3->
    s2*10
    <6>4 <6>
    s2 s4 <6->
    <6 5> s8. <6>16
    <6 4>4 <3>
  
}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 35
    s1*9
    \bar "||"\break\once \override Score.RehearsalMark.extra-offset = #'(+9 . -0)
    \mark\markup \huge {[5.] All[egr]o}
    \time 2/4
    \tempo 2 = 65
   \repeat volta 2 {s2*20}\break
   \repeat volta 2 {s2*25}
    \bar ":|."

}

IIIflI = {
    %\notypeset
    <<\IIIflIn \forma>>

}

IIIflII = {
    <<\IIIflIIn \forma>>

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
    \clef bass
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
#(set-global-staff-size 16)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup "Sinfonia Prima di Concerto grosso con due Flauti [autografo 1715] "
    composer = \markup {"A. Scarlatti (1660-1725)"}
}

\markup \huge {[1.] All[egr]o}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \set Staff.instrumentName = \markup \center-column{"Fl[auto"\vspace #-0.3"Primo]"}
                \IflI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"recorder"
                \set Staff.instrumentName = \markup \center-column{"Fl[auto"\vspace #-0.3"Secondo]"}
                \IflII \global
            >>
        >>

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
                \set Staff.midiInstrument = #"contrabass"
                \Ibc\global
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

\pageBreak

\markup \huge {[2.] Adagio}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \IIflI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"recorder"
                \IIflII \global
            >>
        >>

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
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
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

\markup \huge {[4.] Adagio}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \IIIflI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"recorder"
                \IIIflII \global
            >>
        >>

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
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc\global
            >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
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

