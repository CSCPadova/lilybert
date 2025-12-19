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

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

Icrtn = %\transpose re fa,
\relative do'' {
    \key re\major
    la2. fad4
    si la sol fad
    sol la si2~

    %4
    si4 si la sol
    fad la re2~
    re4 si mi2~

    %7
    mi4 dod re si
    fad2 r4 fad'
    si,2 mi4 re

    %10
    dod2 la'~
    la4 fad si la
    sol fad sol2~

    %13
    sol4 mi la sol
    fad2 r
    r mi~

    %16
    mi4 dod fad mi
    re dod re2~
    re4 si mi re

    %19
    dod si la dod\mbreak
    re1
    dod

    %22
    si
    la2. si4
    dod re mi dod

    %25
    re la re2~
    re dod
    re r

    %28
    R1*15
    mi2. dod4
    fad mi re dod

    %45
    re mi8 fad mi4 re
    dod mi la,2~
    la4 fad si2~

    %48
    si4 sold dod si
    la fad si la
    sold la si2~

    %51
    si4 la8 sold la2~
    la4 sol!8 fad sol4 la8 sol
    fad2 re'~

    %54
    re4 si mi2~
    mi4 sold, la re\mbreak
    dod2(si4.) la8

    %57
    la2 r
    R1*16
    r2 fad'~

    %75
    fad4 re sol fad
    mi2. sol4
    fad sol fad mi

    %78
    red2 si~
    si4 sol do sol
    la2. sol4

    %81
    fad2 fad'~
    fad4 si, mi2~
    mi4 dod fad2~

    %84
    fad4 mi re dod
    re dod si2~
    si sol'4 fad

    %87
    mi re dod si\mbreak
    lad fad si dod
    re2(dod4.) si8

    %90
    si2 r
    R1*28
    la2. fad4

    %120
    si1~
    si4 si la sol
    fad la re2~

    %123
    re4 si mi re
    dod si la2
    r la'~

    %126
    la4 fad si la
    sold? fad mi2~
    mi4 dod fad mi

    %129
    re dod re2~
    re4 si mi re
    dod re mi dod

    %132
    la2 r
    R1*2
    r2 do~

    %136
    do4 la re do
    si sol la2~\mbreak
    la4 fad si la

    %139
    sol mi dod' si
    lad2 r
    fad'2. re4

    %142
    sol fad mi re
    mi dod fad mi
    re si mi re

    %145
    dod2. mi4
    la,2 si
    dod4 re mi fad

    %148
    sol mi fad re
    mi dod re si
    dod la re2~

    %151
    re4 dod re si
    dod2.\tr re4
    re\breve\fermata

}

ItrbIn = %\transpose re fa,
\relative do' {
    \key re\major
    R1*6
    la'2. fad4
    si la sol fad

    %9
    sol la si2~
    si4 si la sol
    fad2. re4

    %12
    mi2. re4
    mi2. dod4
    la2 re~

    %15
    re4 si mi re
    dod2. dod4
    si2 si4 la

    %18
    si2. si4
    la2 la'~\mbreak
    la4 fad si la

    %21
    sol mi la sol
    fad re sol fad
    mi re dod re

    %24
    mi re dod mi
    re2 fad
    mi1

    %27
    fad2 r
    R1*15
    r2 la~

    %44
    la4 fad si la
    sold fad sold2
    la2. la4

    %47
    fad2. fad4
    mi2 mi~
    mi re~

    %50
    re4 mi8 fad mi4 re
    dod2. si8 la
    si2. dod4

    %53
    re2. fad4
    sold2. si4
    mi,2 dod4 fad\mbreak

    %56
    mi1
    dod2 r
    R1*16

    %74
    fad2. re4
    sol fad sol2~
    sol sol

    %77
    la4 si la sol
    fad2 red4 fad
    si,2 mi~

    %80
    mi4 dod fad mi
    red2. dod4
    si2 dod4 si

    %83
    lad2 si4 dod
    si2 fad'~
    fad4 mi fad2

    %86
    sol4 la si la
    sol fad mi sol\mbreak
    fad2. sol4

    %89
    fad1
    re2 r
    R1*28

    %119
    fad2. re4
    sol2. fad4
    mi re mi dod

    %122
    re2. fad4
    sold si mi,2~
    mi4 dod fad2

    %125
    mi2. fad4
    fad2 mi4 fad
    sold la si mi,

    %128
    la2 la~
    la4 fad si la
    sold fad sold2

    %131
    r la~
    la4 fad si la
    sol! fad sol2~

    %134
    sol4 mi la sol
    fad2. sol4
    la sol fad mi

    %137
    re2 red4 mi\mbreak
    fad mi red fad
    mi2 sol

    %140
    fad dod
    r fad~
    fad4 re sol fad

    %143
    mi sol fad2~
    fad4 re sol fad
    mi sol fad mi

    %146
    re2. re4
    mi fad  mi re
    mi2 re

    %149
    la' sold
    mi fad
    mi1\parentSlur (

    %152
    mi)
    fad\breve

}

ItrbIIn = %\transpose re fa,
\relative do' {
    \key re\major

    R1
    re2. si4
    mi re dod si

    %4
    dod re mi2~
    mi la,4 re
    sold,2. si4

    %7
    mi,2 fad4 la
    si2 si~
    si4 la sold si

    %10
    dod si dod2
    re si
    dod r

    %13
    r la~
    la4 fad si la
    sold2 si4 sold

    %16
    la2 dod
    re2. fad4
    mi2 mi~

    %19
    mi4 dod re mi\mbreak
    re2 si~
    si la~

    %22
    la sol
    la1~
    la2 la

    %25
    la2. si4
    mi,2 la
    la r

    %28
    R1*17
    r2 mi'2~
    mi4 dod fad mi

    %47
    re dod si re
    mi si  la si
    dod2 si

    %50
    mi, sold4 fad
    mi2 mi'~
    mi mi,

    %53
    la4 fad si2~
    si4 si dod sold
    la si la2~\mbreak

    %56
    la sold
    mi r
    R1*17

    %75
    si'2. sol4
    do2 do~
    do do?4 mi

    %78
    si2 fad
    mi r
    r la~

    %81
    la4 fad si la
    sol fad mi mi'
    dod2 re4 mi

    %84
    re dod si lad
    si dod re red
    mi2. red4

    %87
    mi2. mi4\mbreak
    dod lad si2~
    si lad\tr

    %90
    fad r
    R1*30
    r2 la~

    %122
    la4 fad si2~
    si4 sold dod si
    la2 re~

    %125
    re4 si dod2
    re4 dod si2~
    si4 la sold dod

    %128
    dod2 re4 mi
    fad mi fad re
    si2. dod8 re

    %131
    mi2 r
    re2. si4
    mi re dod si

    %134
    la2 mi'~
    mi4 re la sol
    re'2 la

    %137
    si do\mbreak
    si2. si4
    si sol mi' re

    %140
    dod si lad dod
    si dod re si
    re2 la

    %143
    lad4 si dod2
    si2. re4
    la2 dod

    %146
    re4 dod si la
    sol la2 si4
    dod2 re4 si

    %149
    dod la si sold
    la2 la
    la1~

    %152
    la
    la\breve

}

ItrbIIIn = %\transpose re fa,
\relative do {
    \key re\major

    R1*4
    re2. si4
    mi re dod si

    %7
    dod la re2~
    re4 si dod red
    mi fad sol mi

    %10
    la2 r
    re,2. si4
    mi re dod si

    %13
    dod2. la4
    re2. si4
    mi2 r

    %16
    la2. fad4
    si la sold fad
    sold2. mi4

    %19
    la sol! fad mi\mbreak
    fad re sol fad
    mi dod fad mi

    %22
    re si mi re
    dod si la2~
    la sol

    %25
    fad2. sol4
    la1
    re,2 r

    %28
    R1*18
    la''2. fad4
    si la sold fad

    %48
    sold mi la sold
    fad sold8 la sold4 fad
    mi1~

    %51
    mi~
    mi
    re2. si4

    %54
    mi re dod si
    dod mi fad re\mbreak
    mi re mi mi,

    %57
    la2 r
    R1*17
    r2 si~

    %76
    si4 sol do si
    la sol la2~
    la4 fad si la

    %79
    sol2 r
    R1*2
    mi'2. dod4

    %83
    fad mi re dod
    re2. fad4
    si2. la4

    %86
    sol fad mi2~
    mi4 fad sol mi\mbreak
    fad mi re mi

    %89
    fad mi fad2
    si, r
    R1*28

    %119
    r2 re~
    re4 si mi re
    dod si dod la

    %122
    re2. si4
    mi2 dod
    fad2. re4

    %125
    la'2. fad4
    si la sold fad
    mi2. dod4

    %128
    fad mi re dod
    re2. si4
    mi re dod si

    %131
    la si dod la
    re2 sol
    mi2. re4

    %134
    dod si la2
    re2. mi4
    fad2 re

    %137
    sol fad4 mi\mbreak
    red2 si
    mi, mi'~

    %140
    mi4 dod fad mi
    re dod si2~
    si dod4 re

    %143
    dod si lad2
    si sol'~
    sol4 mi la sol

    %146
    fad re sol fad
    mi re dod si
    la1~

    %149
    la
    la'2 fad4 re
    la'1

    %152
    la,
    re\breve

}

Ivlgn = \relative do' {

    R1
    fa2. re4
    sol fa mi re

    %4
    mi fa sol2~
    sol do,4 fa
    si,2. re4

    %7
    \clef bass\key fa \major mi, do fa2~
    fa4 re mi fad
    sol la sib sol
    do2 r

    %11
    fa,2. re4
    sol fa mi re
    mi2\clef alto\key fa \major  do'2~

    %14
    do4 la fa'2~
    fa4 re sol fa
    do2. la4

    %17
    re do si la
    si2. sol4
    do sib! la sol\mbreak

    %20
    la fa sib la
    \clef bass\key fa \major sol mi la sol
    fa re sol fa

    %23
    mi re do2~
    do4 do' sib la8 sol
    la2. sib4

    %26
    do sib do do,
    fa,2 r
    R1*4

    %32
    \clef alto\key fa \major r4 do''8 si do re mi fa
    sol fa sol la fa mi fa sol
    mi re do mi fa mi re do

    %35
    re do si re mi re do si
    do si la do re do si la
    si4 re sol2~\mbreak

    %38
    sol fad
    sol8 re re re si' re, re re
    la' re, re re do' re, re re

    %41
    si' re, re re do'2~
    do si4. do8
    do2 r

    %44
    R1
    r2 sol~
    sol4 mi la sol

    %47
    fa mi re do
    si sol do si
    la si8 do si4 la

    %50
    sol2 sol'4 fa
    mi2. re8 do
    re2. mi4

    %53
    \clef bass\key fa \major fa,2. re4
    sol fa mi re
    mi sol la fa\mbreak

    %56
    sol fa sol sol,
    do \clef alto\key fa \major do'8 si do re mi fad
    sol4 re sol2~

    %59
    sol fad
    sol r
    \clef bass\key fa \major r4 re,8 dod re mi fa sol

    %62
    la sol la sib sol fa sol la
    fa la sol la sib la sol fa
    sol sib la sib \clef alto\key fa \major do sib la sol

    %65
    la do sib do re do si la
    si re do re mi re dod si
    dod la la la re la la la

    %68
    mi' la, la la fa' la, la la
    dod4 la la'2~
    la4 sol sol2~\mbreak

    %71
    sol4 sol la mi
    fa dod re2~
    re dod4. re8

    %74
    re2 r
    re \clef bass\key fa \major  re,~
    re4 sib mib re

    %77
    do sib do2~
    do4 la re do
    sib2 \clef alto\key fa \major  sol''~

    %80
    sol4 mi do2~
    do4 la re do
    <<sib2.\\sol>> \clef bass\key fa \major mi4

    %83
    la sol fa mi
    fa2. la4
    re2. do4

    %86
    sib la sol2~
    sol4 la sib sol\mbreak
    la sol fa sol

    %89
    la sol la2
    re,4 \clef alto\key fa \major  mi' fa la
    sib,1~

    %92
    sib4 sol la do
    re4.(mib8) do4.(re8)
    sib4.(do8) la4.(do8)

    %95
    sib4.(do8) la4.(sib8)
    sol4.(la8) fa4.(sol8)
    \clef bass\key fa \major mi do do do fa do do do

    %98
    sol' do, do do la' do, do do
    mi do do do fa do do do
    sol' do, do do la' do, do do

    %101
    mi4 do do'2~
    do4 sib sib2~\mbreak
    sib4 sol \clef alto\key fa \major mi'2~

    %104
    mi4 la, fa'2~
    fa4 mi fa re
    fa2 (mi4.\tr) fa8

    %107
    fa2 do4.(re8)
    sib4.(do8) la4.(sib8)
    sol4 sib la fa~

    %110
    fa mi fa la
    sol sib la fa~
    fa mi fa la

    %113
    sol2 \clef bass \key fa \major r4 do,
    re8 do re mi fa sol la sib
    mi, re mi fa sol la sib do

    %116
    fa, mi fa sol la sib do re\mbreak
    do4 sol la sib
    la2(sol4.) fa8

    %119
    fa2 fa~
    fa4 re sol fa
    mi2 \clef alto\key fa \major  do'~

    %122
    do4 la re2~
    re4 si mi re
    do2 r

    %125
    do2. la4
    re do si la
    sol2. \clef bass\key fa \major mi4

    %128
    la sol fa mi
    fa2. re4
    sol fa mi re

    %131
    do re mi do
    \clef alto\key fa \major fa'2. re4
    sol fa mi re

    %134
    do2 mi
    \clef bass\key fa \major fa,2. sol4
    la2 fa

    %137
    sib la4 sol\mbreak
    fad2 re
    sol, sol'~

    %140
    sol4 mi la sol
    fa mi re2~
    re mi4 fa

    %143
    mi re dod2
    re, sib''~
    sib4 sol do sib

    %146
    la fa sib la
    sol fa mi re
    do \clef alto\key fa \major  mi' fa re

    %149
    mi do re si
    do2 la4 fa
    do'1

    %152
    \clef bass\key fa \major do,
    fa,\breve

}


Ifln = \relative do'' {

    R1*26
    r4 fa8 mi fa sol la sib
    do sib do re sib la sib do

    %29
    la sol fa la sib la sol fa
    sol fa mi sol la sol fa mi
    fa mi re fa sol fa mi re

    %32
    mi4 sol do2~
    do si
    do4 mi, la2~

    %35
    la4 re, sol2~
    sol4 mi fad2
    sol8 re re re si' re, re re\mbreak

    %38
    la' re, re re do' re, re re
    si'4 la sol2~
    sol fa~

    %41
    fa mi8 sol fa sol
    la sol fa sol re4. do8
    do2 r

    %44
    R1*14
    r4 sol'8 fad sol la sib do
    re do re mib do sib do re

    %60
    sib4 sol8 fad sol la si dod
    re4 la re2~
    re dod

    %63
    re4 la fa sib
    r sib sol do
    r do la re

    %66
    r re si mi
    r mi fa re~
    re dod re fa

    %69
    mi2 r4 la,
    sib8 la sib do sib la sib sol\mbreak
    mi' re mi fa mi re dod sib

    %72
    la2. sol4
    fa2(mi4.) re8
    re2 r

    %75
    R1*16
    r4 re' mi sol
    do,2. la4

    %93
    sib4.(do8) la4.(sib8)
    sol4. (la8) fa4.(la8)
    re4.(mib8) do4.(re8)

    %96
    sib4.(do8) la4.(sib8)
    sol4 sib la fa~
    fa mi fa la

    %99
    sol sib la fa~
    fa mi fa la
    sol2 r4 do,

    %102
    mi8 do re mi fa sol la sib\mbreak
    mi, re mi fa sol la sib do
    fa, mi fa sol la sib do re

    %105
    do4 sol la sib
    la2(sol4.) fa8
    fa4.(sol8) la4.(sib8)

    %108
    sol4.(la8) fa4.(sol8)
    mi do do do fa do do do
    sol' do, do do la' do, do do

    %111
    mi do do do fa do do do
    sol' do, do do la' do, do do
    mi4 do do'2~

    %114
    do4 sib sib2~
    sib4 sol mi'2~
    mi4 la, fa'2~\mbreak

    %117
    fa4 mi, fa re
    fa2(mi4.) fa8
    fa2 r

    %120
    R1*33
    r\breve

}

Ivln = \relative do'' {

    do2. la4
    re do sib la
    sib do re2~

    %4
    re4 re do sib
    la do fa2~
    fa4 re sol2~

    %7
    sol4 mi fa do
    la2 r4 la'
    re,2 sol4 fa

    %10
    mi2 do'~
    do4 la re do
    sib la sib2~

    %13
    sib4 sol do sib
    la2 r
    r sol~

    %16
    sol4 mi la sol
    fa mi fa2~
    fa4 re sol fa

    %19
    mi re do mi\mbreak
    fa1
    mi

    %22
    re
    do2. re4
    mi fa sol mi

    %25
    fa do fa2~
    fa mi
    fa r

    %28
    R1*15
    sol2. mi4
    la sol fa mi

    %45
    fa sol8 la sol4 fa
    mi sol do,2~
    do4 la re2~

    %48
    re4 si mi re
    do la re do
    si do re2~

    %51
    re4 do8 si do2~
    do4 sib!8 la sib4 do8 sib
    la2 fa'~

    %54
    fa4 re sol2~
    sol4 si, do fa\mbreak
    mi2(re4.) do8

    %57
    do2 r
    R1*16
    r2 la'~

    %75
    la4 fa sib la
    sol2. sib4
    la sib la sol

    %78
    fad2 re~
    re4 sib mib re
    do2. sib4

    %81
    la2 la'~
    la4 re, sol2~
    sol4 mi la2~

    %84
    la4 sol fa mi
    fa mi re2~
    re sib'4 la

    %87
    sol fa mi re\mbreak
    dod4 la re mi
    fa2(mi4.) re8

    %90
    re2 r
    R1*28
    do2. la4

    %120
    re1~
    re4 re do sib
    la do fa2~

    %123
    fa4 re sol fa
    mi re do2
    r do'~

    %126
    do4 la re do
    si la sol2~
    sol4 mi la sol

    %129
    fa mi fa2~
    fa4 re sol fa
    mi fa sol mi

    %132
    do2 r
    R1*2
    r2 mib~

    %136
    mib4 do fa mib
    re sib do2~
    do4 la re do

    %139
    sib sol mi' re
    dod2 r
    la'2. fa4

    %142
    sib la sol fa
    sol mi la sol
    fa re sol fa

    %145
    mi2. sol4
    do,2 re
    mi4 fa sol la

    %148
    sib sol la fa
    sol mi fa re
    mi do fa2~

    %151
    fa4 mi fa re
    mi2. fa4
    fa\breve

}

IvlaIn = \relative do'' {

    R1*6
    do2. la4
    re do sib la

    %9
    sib do re2~
    re4 re do sib
    la2. fa4

    %12
    sol2. fa4
    sol2. mi4
    do2 fa~

    %15
    fa4 re sol fa
    mi2. mi4
    re2 re4 do

    %18
    re2. re4
    do2 do'~\mbreak
    do4 la re do

    %21
    sib sol do sib
    la fa sib la
    sol fa mi fa

    %24
    sol fa mi sol
    fa2 la
    sol1

    %27
    la2 r
    R1*15
    r2 do~

    %44
    do4 la re do
    si la si2
    do2. do4

    %47
    la2. la4
    sol2 sol~
    sol fa~

    %50
    fa4 sol8 la sol4 fa
    mi2. re8 do
    re2. mi4

    %53
    fa2. la4
    si2. re4
    sol,2 mi4 la\mbreak

    %56
    sol1
    mi2 r
    R1*16

    %74
    la2. fa4
    sib la sib2~
    sib sib

    %77
    do4 re do sib
    la2 fad4 la
    re,2 sol~

    %80
    sol4 mi la sol
    fad2. mi4
    re2 mi4 re

    %83
    dod2 re4 mi
    re2 la'~
    la4 sol la2

    %86
    sib4 do re do
    sib la sol sib\mbreak
    la2. sib4

    %89
    la2~la
    fa r
    R1*28

    %119
    la2. fa4
    sib2. la4
    sol fa sol mi

    %122
    fa2. la4
    si re sol,2~
    sol4 mi la2

    %125
    sol2. la4
    la2 sol4 la
    si do re sol,

    %128
    do2 do~
    do4 la re do
    si la si2

    %131
    r do~
    do4 la re do
    sib! la sib2~

    %134
    sib4 sol do sib
    la2. sib4
    do sib la sol

    %137
    fa2 fad4 sol\mbreak
    la sol fad la
    sol2 sib

    %140
    la mi
    r la~
    la4 fa sib la

    %143
    sol sib la2~
    la4 fa sib la
    sol sib la sol

    %146
    fa2. fa4
    sol la sol fa
    sol2 fa

    %149
    do' si
    sol la
    sol1~

    %152
    sol
    la\breve

}

IvlaIIn = \relative do' {

    R1
    fa2. re4
    sol fa mi re

    %4
    mi fa sol2~
    sol do,4 fa
    si,2. re4

    %7
    sol,2 la4 do
    re2 re~
    re4 do sib re

    %10
    mi re mi2
    fa re
    re r

    %13
    r do~
    do4 la re do
    si2. si4

    %16
    do2 mi
    fa2. la4
    sol2 sol~

    %19
    sol4 mi fa sol\mbreak
    fa2 re~
    re do~

    %22
    do sib?
    do1~
    do2 do

    %25
    do2. re4
    sol,2 do
    do r

    %28
    R1*17
    r2 sol'~
    sol4 mi la sol

    %47
    fa mi re fa
    sol re do re
    mi2 re

    %50
    sol, si4 la
    sol2 sol'~
    sol sol,

    %53
    do4 la re2~
    re4 re mi si
    do re do2~

    %56
    do si
    sol r
    R1*17

    %75
    re'2. sib4
    mib2 mib~
    mib mib?4 sol

    %78
    re2 la
    sol r
    r do~

    %81
    do4 la re do
    sib la sol sol'
    mi2 fa4 sol

    %84
    fa mi re dod
    re mi fa fad
    sol2. fad4

    %87
    sol2. sol4\mbreak
    mi dod4 re2~
    re dod

    %90
    la r
    R1*30
    r2 do~

    %122
    do4 la re2~
    re4 si mi re
    do2 fa~

    %125
    fa4 re mi2
    fa4 mi re2~
    re4 do si mi

    %128
    mi2 fa4 sol
    la sol la fa
    re2. mi8 fa

    %131
    sol2 r
    fa2. re4
    sol fa mi re

    %134
    do2 sol'~
    sol4 fa do sib
    fa'2 do

    %137
    re mib\mbreak
    re2. re4
    re sib sol' fa

    %140
    mi re dod mi
    re mi fa re
    fa2 do

    %143
    dod4 re mi2
    re2. fa4
    do?2 mi

    %146
    fa4 mi re do
    sib do2 re4
    mi2 fa4 re

    %149
    mi do re si
    do2 do
    do1~

    %152
    do
    do\breve

}

Ibcn = \relative do {

    R1*4
    fa2. re4
    sol fa mi re

    %7
    mi do fa2~
    fa4 re mi fad
    sol la sib sol

    %10
    do2 r
    fa,2. re4
    sol fa mi re

    %13
    mi2. do4
    fa2. re4
    sol2 r

    %16
    do2. la4
    re do si la
    si2. sol4

    %19
    do sib! la sol\mbreak
    la fa sib la
    sol  mi la sol

    %22
    fa re sol fa
    mi re do2~
    do sib

    %25
    la2. sib4
    do1
    fa,2 r

    %28
    mi'_\markup\italic"Violoncello" r
    fa re~
    re do~

    %31
    do si
    do2. re4
    mi2 re

    %34
    do r4 fa
    si,2 r4 mi
    la,2 r4 re

    %37
    sol2 r\mbreak
    re r
    sol r

    %40
    re r
    sol do,
    fa, sol

    %43
    do r
    R1*2
    do'2._\markup\italic"[Tutti]" la4

    %47
    re do si la
    si sol do si
    la si8 do si4 la

    %50
    sol1~
    sol~
    sol

    %53
    fa2. re4
    sol fa  mi re
    mi sol la fa\mbreak

    %56
    sol fa sol sol,
    do2 r
    sib2._\markup\italic"[Violoncello]" sol4

    %59
    sib2 la
    sol sol'
    fa2. re4

    %62
    fa2 mi
    re2. re4
    mi2. mi4

    %65
    fa2. fa4
    sol2. sol4
    la1~

    %68
    la~
    la~
    la\mbreak

    %71
    dod,2 r4 la
    re mi fa sol
    la sol la la,

    %74
    re2 r
    r re~_\markup\italic"[Tutti]"
    re4 sib mib re

    %77
    do sib do2~
    do4 la re do
    sib2 r

    %80
    R1*2
    sol'2. mi4
    la sol fa mi

    %84
    fa2. la4
    re2. do4
    sib la sol2~

    %87
    sol4 la sib sol\mbreak
    la sol fa sol
    la sol la2

    %90
    re, r
    sol_\markup\italic"[Violoncello]" r4 mi
    fa2 r4 fa

    %93
    sib,2 fa'
    mi fa
    sib, fa'

    %96
    mi fa
    do1~
    do~

    %99
    do~
    do~
    do2 r4 la'

    %102
    sib sib, sib' sol\mbreak
    do2 r4 do
    re re, re' sib

    %105
    la do fa, sib
    do sib do do,
    fa2 r4 fa

    %108
    mi2 fa
    do1~
    do~

    %111
    do~
    do~
    do2 r4 la

    %114
    sib2 sib4 sol
    do2 r4 la
    re2 re4 sib\mbreak

    %117
    la do re sib
    do sib do do,
    fa2 fa'~_\markup\italic"[Tutti]"

    %120
    fa4 re sol fa
    mi re mi do
    fa2. re4

    %123
    sol2 mi
    la2. fa4
    do'2. la4

    %126
    re do si la
    sol2. mi4
    la sol fa mi

    %129
    fa2. re4
    sol fa mi re
    do re mi do

    %132
    fa2 sib
    sol2. fa4
    mi re do2

    %135
    fa2. sol4
    la2 fa
    sib la4 sol\mbreak

    %138
    fad2 re
    sol, sol'~
    sol4 mi la sol

    %141
    fa mi re2~
    re mi4 fa
    mi re dod2

    %144
    re, sib''~
    sib4 sol do sib
    la fa sib la

    %147
    sol fa mi re
    do1~
    do

    %150
    do'2 la4 fa
    do'1(
    do,)

    %153
    fa\breve_\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \tempo 1 = 52
    s1*152
    s\breve
    \bar"|."

}


Icrt = {
    \global
    \notypeset
    <<\Icrtn \forma>>

}

ItrbI = {
    \global
    \clef alto
    <<\ItrbIn \forma>>

}

ItrbII = {
    \global
    \clef tenor
    <<\ItrbIIn \forma>>

}

ItrbIII = {
    \global
    \clef bass
    <<\ItrbIIIn \forma>>

}

Ivlg = {
    \global
    \clef alto
    <<\Ivlgn \forma>>

}

Ifl = {
    \global
    <<\Ifln \forma>>

}

Ivl = {
    \global
    <<\Ivln \forma>>

}

IvlaI = {
    \global
    <<\IvlaIn \forma>>

}

IvlaII = {
    \global
    \clef alto
    <<\IvlaIIn \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIvlgn = \relative do' {

    la8 sol16(fa) do'8 re16(do) la8 sol16(fa) sol8 mi
    fa do r16 fa re mi fa8 do r16 sib' la sol
    la8 sol16(fa) do'8 re16(do) la8 sol16(fa) sol8 mi

    %4
    fa16 do' re mi fa8 fa fa16 re mi fa sol8 sol
    sol16 mi fa sol la sol fa mi re do si la \once\stemUp sol8 si'
    do sol r16 do la si do8 sol r16 fa mi re\mbreak

    %7
    mi8 re16(do) sol'8 la16(sol) mi8 re16(do) sol8 si
    do4 r r2
    r16 do32(sib) la16 do fa, fa' do re mib do32(sib) la16 do fa, sol' fa mib

    %10
    re re32(do) re16 mib fa mib re do sib mib32 (re) mib16 fa sol fa  mib re
    mib fa re mib do8. sib16 sib8 sib'16 la sib4~
    sib8 la16 sol la4~la8 re, sol4~

    %13
    sol8 fa16 mi fa8 sol16 fa\mbreak mi8 do r16 sib la sol
    la8 sol16(fa) do'8 re16(do) la8 sol16(fa) sol8 mi
    fa do r16 fa' re mi fa8 do la sol16 fa

    %16
    fa la fa la fa la32 \parentSlur (sol) fa16 la r re sib re sib  re32 \parentSlur (do) sib16 re
    r sib sol sib sol sib32(la) sol16 sib r mi do mi do mi32(re) do16 mi
    r fa32(mi) fa16 sol la sol fa mi re sol32(fa) sol16 la sib la sol fa

    %19
    mi mi fa sol mi8. fa16 fa4 r
    r16 sol, la si do mi re mi fa4~fa8. mi16
    mi2 r

}


IIfln = \relative do'' {

    R1
    la'8 sol16 \parentSlur (fa) do'8 re16 \parentSlur (do) la8 sol16 \parentSlur (fa) sol8 mi
    fa do r16 fa re mi fa8 do r16 sib' la sol

    %4
    la8 la16 sol fa la re do si8 si16 la sol si mi re
    do8 re16 mi fa mi re do si la sol8 r16 fa mi re
    mi8 re16(do) sol'8 la16(sol) mi8 re16(do) re8 si\mbreak

    %7
    do sol r16 do' la si do8 sol mi\tr re16 do
    do sol'32 (fa) mi16 sol do, do' sol la sib? sol32(fa) mi16 sol do, re' do sib
    la(sol) fa8 r4 r2

    %10
    r16 sib32(la) sib16 do re do sib la sol do32 \parentSlur (sib) do16 re mib re do sib
    la la sib do la8. sib16 sib4 r16 sib sol' sol,
    do do32 (re) do16 do do do fa fa, sib sib32 \parentSlur (do) sib16 sib sib sib do sib

    %13
    la la32 \parentSlur (sib) la16 la  la do sib la\mbreak sol mi32(fa) sol16 mi do8 mi
    fa do r16 fa re mi fa8 do r16 sib' la sol
    la8 sol16 \parentSlur (fa) do'8 re16 \parentSlur (do) la8 sol16 \parentSlur (fa) do8 mi

    %16
    fa16 do' la do la do32 \parentSlur (sib) la16 do r fa,re fa re fa32(mib) re16 fa
    r16 re' sib re sib re32 \parentSlur (do) sib16 re r sol, mi sol mi sol32(fa) mi16 sol
    r16 la32(sol) la16 sib do sib la sol fa sib32(la) sib16 do re do sib la

    %19
    sib sol la sib sol8. fa16 fa do re mi fa sol la si
    do2~do4 si8. do16
    do2 r

}

IIbcn = \relative do {

    fa8 sol la[sib] fa re sib[do]
    fa,4 la8 sib fa la sib[do]
    fa,4 la8 sib fa la sib[do]

    %4
    fa fa16 mi re8 fa sol sol16 fa mi8 sol
    la sol fa[fa,] sol la si[sol]
    do4 mi8 fa do mi fa[sol]\mbreak

    %7
    do,4 mi8 fa do mi sol[sol,]
    do4 r8 do do4 r8 do
    fa4 r8 fa fa4 r8 fa

    %10
    sib sib, sib[sib]  mib do do[do]
    fa sib, fa'[fa,] sib4 sib'8 sol
    mi do fa[la,] re sib mi[do]

    %13
    fa fa, fa'[sib,]\mbreak do do mi[do]
    fa4 la8 sib fa la, sib[do]
    fa,4 la8 sib fa la do[do,]

    %16
    fa4 r sib r
    sol r do r
    la8 fa fa[fa] sib sol sol[sol]

    %19
    do fa, do'[do,] fa2
    mi re
    do r

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \tempo 4 = 50
    s1*21
    \bar"|."

}

IIvlg = {
    \global
    \clef alto
    \notypeset
    <<\IIvlgn \forma>>

}

IIfl = {
    \global
    <<\IIfln \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIIcrtn = %\transpose re fa,
\relative do'' {
    \key re\major

    r4 re2. dod2
    re sol4 fad mi2\tr
    re4 re8 dod si la si4 mi8 re dod si

    %4
    dod4 la8 sol fad mi re4 si'8 la sold fad
    mi4 la2. sold2
    la r4 re re re

    %7
    mi mi mi fad si si
    la la8 sol fad mi fad4 re2~\mbreak
    re4 do2. si2~

    %10
    si4 la2. sol2
    dod!4 si8 la re4 mi dod4. re8
    re2 r4 r2.

    %13
    R1.*4\mbreak
    la4 la la si si si
    dod fad fad mi mi8 re dod si

    %19
    dod4 dod8 si la sol fad4 fad'8 mi re dod
    re4 si2. lad2
    si mi4 re dod2

    %22
    fad8 mi re dod re4. mi8 dod4. si8
    si2 r4 r2.
    R1.*2

    %26
    r4 mi2. red2
    mi la,4 sol fad2
    mi4 mi'8 re dod si dod4 dod8 si la sold

    %29
    la4 fad'2. sold2
    fad si,4 la sold2
    fad r4 r2.

    %32
    R1.
    fad4 fad fad sold sold sold
    la re re dod dod8 si la sold

    %35
    la4 re2. dod2
    re4 re re mi mi mi
    fad re8 dod si la sol4 mi'8 re dod si

    %38
    la4 re2. dod4 r
    R1.
    r4 la'2. sold2

    %41
    la4 sol!8 fad sol mi fad4 r r
    R1.
    r4 re2. dod2

    %44
    re4 do8 si do la si4 r r
    R1.\mbreak
    la4 la la si si si

    %47
    dod dod dod re re re
    mi8 re dod si la sol fad mi fad sol la fad
    sol fad sol la fad sol la sol la si sol la

    %50
    si la si dod re dod re mi dod4. re8
    re4 r r re r r
    la r r la r r\mbreak

    %53
    r re2. dod2
    re4 fad8 mi re dod si4 mi8 re dod si
    la si do si do la si re sol fad mi re

    %56
    dod?4 r8 la re4 mi dod4. re8
    re2.~re

}

IIItrbIn = %\transpose re fa,
\relative do' {
    \key re\major

    re4 re re mi mi mi
    fad si si la la8 sol fad mi
    fad4 fad fad sold sold sold

    %4
    la dod, dod re re re
    mi re re mi2 mi4
    mi8 re mi dod re mi la,4 fad'8 mi re dod

    %7
    si4 mi8 re dod[si] la4 re2~
    re4 dod2 re4 fad sold\mbreak
    la mi la la re, sol

    %10
    sol dod, fad fad si, mi~
    mi sol fad sol mi4. fad8
    fad2 r4 r2.

    %13
    R1.*5
    r4 la2. sold2
    la4 mi mi dod dod fad

    %20
    fad si8 la sol fad mi4 fad8 mi re dod
    si2 si4 fad'2 fad4
    fad fad fad sol fad2

    %23
    re r4 r2.
    R1.*3
    r4 mi2. red2

    %28
    mi4 sol sol sold sold sold
    dod, fad8 mi re dod si2 r4
    r fad'2. mid2

    %31
    fad r4 r2.
    R1.*2
    r4 fad2. mid2

    %35
    fad4 re re mi mi mi
    fad fad8 sol la fad sol4 la8 sol fad mi
    fad4 re2. dod2

    %38
    re4 fad8 mi fad sold la2 r4
    R1.
    mi4 mi mi re re re

    %41
    mi mi mi re4 r r
    R1.
    fad4 fad8 mi re dod si4 mi8 re dod si

    %44
    la4 re re re r r
    R1.\mbreak
    mi4 mi8 re dod mi fad4 si8 la sold fad

    %47
    mi4 la2. sol!2~
    sol4 la8 sol fad mi re4 la8 sol fad la
    sol4 mi'8 re dod si la4 re2~

    %50
    re8 dod re mi fad mi fad sol mi4. fad8
    fad4 r r fad r r
    re r r re r r\mbreak

    %53
    fad r r r2.
    fad4 fad fad sol sol sol
    la la2. sol2~

    %56
    sol4 r8 sol fad4 sol mi4. fad8
    fad2.~fad

}

IIItrbIIn = %\transpose re fa,
\relative do' {
    \key re\major

    R1.*3
    r4 la2. sold2
    la re4 dod si2\tr

    %6
    la4 la8 sol fad mi fad4 la fad
    sol2 sol4 fad2 sol4
    fad mi2 re re'4\mbreak

    %9
    mi2. re
    dod si
    mi,2 si'4 si la2

    %12
    la r4 r2.
    R1.*4\mbreak
    r4 dod8 si la sold fad4 si8 la sold fad

    %18
    mi4 la re si2 mi,4
    mi la la lad lad lad
    si re re dod dod dod

    %21
    fad, si2. lad2
    si4 lad si4. dod8 lad4. fad8
    fad2 r4 r2.

    %24
    R1.*2
    sol4 sol sol la si8 la sol fad
    mi2 mi4  si'2 si4

    %28
    si mi, mi mid mid mid
    fad la la si si si
    dod la si dod2 dod4

    %31
    dod2 r4 r2.
    R1.
    la4 la la si dod8 si la sold

    %34
    fad2 fad4 dod'2 dod4
    dod la8 sol! la si sol fad sol la fad sol
    la4 re2. dod2

    %37
    re4 fad, fad sol sol sol
    la si si mi2 r4
    R1.\mbreak

    %40
    dod4 dod8 si la sold la4 si8 la sold fad
    mi4 la la la r r
    R1.

    %43
    la4 la la sol sol sol
    la la la sol r r
    R1.\mbreak

    %46
    dod4 dod8 re mi dod re4 si mi
    la, dod8 si la sol! fad4 si8 la sol fad
    mi4 r r r re'2~

    %49
    re4 dod2 re4 la la
    sol sol la la la2
    la4 r r la r r

    %52
    la r r fad r r\mbreak
    la r r r2.
    r4 re2. dod2

    %55
    re4 re re re mi mi
    mi r8 mi re4 si la2
    la2.~la

}

IIItrbIIIn = %\transpose re fa,
\relative do {
    \key re\major

    R1.*3
    la4 la la si si si
    dod fad fad mi mi8 re dod si

    %6
    dod4 dod dod re, re'2~
    re4 dod2 re4 si sol
    la2 la4 re si' si\mbreak

    %9
    la la8 sol fad mi fad4 sol8 fad mi re
    mi4 fad8 mi re dod re4 mi8 re dod si
    la2 si4 sol la2

    %12
    re r4 r2.
    R1.*4
    r4 la2. sold2

    %18
    la4 fad' re mi2 mi,4
    la2 r4 r2.
    si4 si si dod dod dod

    %21
    re sol sol fad fad8 mi re dod
    re4 fad si mi, fad fad,
    si2 r4 r2.

    %24
    R1.*2
    mi4 mi mi fad fad fad
    sol do, do si si8 la sol fad

    %28
    sol4 mi r r2.
    fad'4 fad fad sold sold sold
    la re, re dod dod8 si la sold

    %31
    la4 fad r r2.
    R1.
    r4 fad'2. mid2

    %34
    fad4 re si dod2 dod4
    fad2. mi
    re r

    %37
    re4 re re mi mi mi
    fad si si la la, r
    R1.\mbreak

    %40
    la4 la la si si si
    dod dod dod re r r
    R1.

    %43
    re4 re re mi mi mi
    fad fad fad sol r r
    R1.\mbreak

    %46
    r4 la2. sold2
    la,4 la la si si si
    dod dod dod re re re

    %49
    mi mi mi fad fad fad
    sol sol fad mi la la,
    re r r re r r

    %52
    re r r re r r\mbreak
    re r r r2.
    re4 re re mi mi mi

    %55
    fad fad fad sol sol sol
    la r8 la si4 sol la la,
    re2.~re

}

IIIvlgn = \relative do' {

    \clef alto R1.*3
    r4 do2. si2
    do fa4 mi re2

    %6
    do4 do8 sib! la sol la4 fa2~
    fa4 mi2 fa sib4
    la sol2 fa4 re' re\mbreak

    %9
    do do8 sib la sol la4 sib8 la sol fa
    sol4 la8 sol fa mi \clef bass\key fa\major fa4 sol8 fa mi re
    do4\clef alto\key fa\major sib' la sib sol4. fa8

    %12
    fa do' fa do la do fa, la sib re fa la,
    sol sib do mi sol sib, la do re fa si, re
    mi2 r4 r2.

    %15
    r r8 do mi sol re sol
    mi4 do' si do8 do, mi sol re sol\mbreak
    mi4 mi8 re do si la4 re8 do si la

    %18
    sol4 do'2. si2
    do4 do, do dod dod dod
    \clef bass\key fa\major re, re re mi mi mi

    %21
    fa sib sib la la8 sol fa mi
    fa4 \clef alto\key fa\major la re4. mi8 dod4. re8
    re4 la'8(sol) fa(mi) fa(sol) fa(mi) re(dod)

    %24
    re4 r r r re8(do?) sib(la)\mbreak
    sib8 do16 (re) sib8 do16 (re) la8 sib16 (do) sib8 do16 (re) sib8 do16 (re) la8 sib16 (do)
    sib4 sol sol la la la

    %27
    sib sol'2. fad2
    sol4 sol, sol sold sold sold
    la <do la> <do la> <<{re re re}\\{si si si}>>

    %30
    <<{mi la2. sold2}\\{do,4 do re mi2 mi4}>>
    la2 r4 r mi8(re) do(si)
    do re16 (mi) do8 re16 (mi) si8 do16 (re)\mbreak  do8 re16 (mi) do8 re16 (mi) si8 do16 (re)

    %33
    do2 r4 r2.
    r4 la'2. sold2
    la4 fa fa sol sol sol

    %36
    la fa2. mi2
    fa4 fa, fa sol sol sol
    la re re do2 r4

    %39
    r sol8 la16(sol) mi8 sol16(fa) mi8 re mi8 fa16(mi) re8 mi16(re)\mbreak
    do4 do do re re re
    mi mi mi fa r r

    %42
    r do'8 re16(do) sib8 do16(sib) la8 sol la8 sib16(la) sol8 la16(sol)
    fa4 fa fa sol sol sol
    la la la sib r r

    %45
    r re8 mib16(re) do8 re16(do) sib8 la sib do16(sib) la8 sib16(la)\mbreak
    sol4 do2. si2
    do4 do'2. sib!2~

    %48
    sib4 do8 sib la sol la4 fa, fa
    sol sol sol la la la
    sib fa'8 sol la fa la sib sol4. fa8

    %51
    fa do fa do la do fa, do' fa do la do
    fa, fa16 sol la8 la16 sib do8 do16 sib la8 fa16 sol  la8 la16 sib do8 do16 sib\mbreak
    la4 fa fa sol sol sol

    %54
    la fa'2. mi2
    fa4 do'2~do4 sib2~
    sib4 r8 sib la4 sib sol4. fa8

    %57
    fa mi16 re do8 do16 sib la8 la16 sol fa2.

}


IIIfln = \relative do'' {

    R1.*13
    r8 sol' do sol mi sol do, mi fa la do mi,
    re fa sol si re fa, mi4 do' si

    %16
    do8 do, mi sol re sol mi4 do' si\mbreak
    do2 r4 r2.
    R1.*5

    %23
    r2. r4 la8(sol) fa(mi)
    fa(la) re(do) sib(la) sib(do) sib(la) sol(fad)\mbreak
    sol8 la16(sib) sol8 la16(sib) fad8 sol16(la) sol8 la16(sib) sol8 la16(sib) fad8 sol16(la)

    %26
    sol2 r4 r2.
    R1.*4
    r4 mi'8(re) do(si) do(re) do (si) la(sold)

    %32
    la si16\parentSlur (do) la8 si16\parentSlur (do) sold8 la16(si)\mbreak la8 si16\parentSlur (do) la8 si16\parentSlur (do) sold8 la16\parentSlur (si)
    la2 r4 r2.
    R1.*4

    %38
    r2. r4 sol8 la16(sol) fa8 sol16(fa)
    mi8 re mi fa16(mi) re8 mi16(re) do4 sol'8 la16 \parentSlur (sol) fa8 sol16\parentSlur (fa)\mbreak
    mi4 r r r2.

    %41
    r r4 do'8 re16 \parentSlur (do) sib8 do16 \parentSlur (sib)
    la8 sol la sib16(la) sol8 la16(sol) fa4 do'8 re16\parentSlur (do) sib8 do16\parentSlur (sib)
    la4 r r r2.

    %44
    r r4 re8 mib16\parentSlur (re) do8 re16\parentSlur (do)
    sib8 la sib do16\parentSlur (sib) la8 sib16\parentSlur (la) sol8 fa sol la16(sol) fa8 sol16(fa)\mbreak
    mi4 r r r2.

    %47
    R1.*4
    r8 fa16 sol la8 la16 sib do8 do16 sib la8 fa16 sol la8 la16 sib do8 do16 sib
    la8 do fa do la do fa, do' fa do la do\mbreak

    %53
    fa,4 la la sib sib sib
    do8 sib la sol fa mi re sib' sol fa mi re
    do re mib re mib do re fa sib la sol fa

    %56
    mi!4 r8 do fa4 sol mi4. fa8
    fa fa16 sol  la8 la16 sib do8 re16 mi fa2.

}

IIIvln = \relative do'' {

    r4 fa2. mi2
    fa sib4 la sol2
    fa4 fa8 mi re do re4 sol8 fa mi re

    %4
    mi4 do8 sib la sol fa4 re'8 do si la
    sol4 do2. si2
    do r4 fa fa fa

    %7
    sol sol sol la re re
    do do8 sib la sol la4 fa2~\mbreak
    fa4 mib2. re2~

    %10
    re4 do2. sib2
    mi?4 re8 do fa4 sol mi4. fa8
    fa2 r4 r2.

    %13
    R1.*4\mbreak
    do4 do do re re re
    mi la la sol sol8 fa mi re

    %19
    mi4 mi8 re do sib la4 la'8 sol fa mi
    fa4 re2. dod2
    re sol4 fa mi2

    %22
    la8 sol fa mi fa4. sol8 mi4. re8
    re2 r4 r2.
    R1.*2

    %26
    r4 sol2. fad2
    sol do,4 sib la2\tr
    sol4 sol'8 fa mi re mi4 mi8 re do si

    %29
    do4 la'2. sold2
    la re,4 do si2
    la r4 r2.

    %32
    R1.
    la4 la la si si si
    do fa fa mi mi8 re do si

    %35
    do4 fa2. mi2
    fa4 fa fa sol sol sol
    la fa8 mi re do sib4 sol'8 fa mi re

    %38
    do4 fa2. mi4 r
    R1.\mbreak
    r4 do'2. si2

    %41
    do4 sib!8 la sib sol la4 r r
    R1.
    r4 fa2. mi2

    %44
    fa4 mib8 re mib do re4 r r
    R1.\mbreak
    do4 do do re re re

    %47
    mi mi mi fa fa fa
    sol8 fa mi re do sib la sol la sib do la
    sib la sib do la sib do sib do re sib do

    %50
    re do re mi fa mi fa sol mi4. fa8
    fa4 r r fa r r
    do r r do r r\mbreak

    %53
    r4 fa2. mi2
    fa4 la8 sol fa mi re4 sol8 fa mi re
    do re mib re mib do re fa sib la sol fa

    %56
    mi4 r8 do fa4 sol mi4. fa8
    fa2.~fa

}

IIIvlaIn = \relative do'' {

    fa,4 fa fa sol sol sol
    la re re do do8 sib la sol
    la4 la la si si si

    %4
    do mi, mi fa fa fa
    sol fa fa sol2 sol4
    sol8 fa sol mi fa sol do,4 la'8 sol fa mi

    %7
    re4 sol8 fa mi re do4 fa2~
    fa4 mi2 fa4 la si\mbreak
    do sol do  do fa, sib

    %10
    sib mi, la la re, sol~
    sol sib la sib sol4. la8
    la2 r4 r2.

    %13
    R1.*5
    r4 do2. si2
    do4 sol sol mi mi la

    %20
    la re8 do sib la sol4 la8 sol fa mi
    re2 re4 la'2 la4
    la la la sib la2

    %23
    fa r4 r2.
    R1.*3
    r4 sol2. fad2

    %28
    sol4 sib sib si si si
    mi, la8 sol fa? mi re2 r4
    r la'2. sold2

    %31
    la r4 r2.
    R1.*2
    r4 la2. sold2

    %35
    la4 fa fa sol sol sol
    la la8 sib do la sib4 do8 sib la sol
    fa4 fa2. mi2

    %38
    fa4 la8 sol la si do4 r r
    R1.\mbreak
    sol4 sol sol fa fa fa

    %41
    sol sol sol fa r r
    R1.
    la4 la8 sol fa  mi re4 sol8 fa  mi re

    %44
    do4 fa fa fa r r
    R1.\mbreak
    sol4 sol8 fa mi sol la4 re8 do si la

    %47
    sol4 do2. sib!2~
    sib4 do8 sib la sol fa4 do8 sib la do
    sol4 sol'8 fa mi re do4 fa2~

    %50
    fa8 mi fa sol la sol la sib sol4. la8
    la4 r r la r r
    fa r r fa r r\mbreak

    %53
    la r r r2.
    la4 la la sib sib sib
    do do2. sib2~

    %56
    sib4 r8 sib la4 sib sol4. la8
    la2.~la

}

IIIvlaIIn = \relative do' {

    R1.*3
    r4 do2. si2
    do fa4 mi re2\tr

    %6
    do4 do8 sib? la sol la4 do la
    sib2 sib4 la2 sib4
    la sol2\tr fa fa'4\mbreak

    %9
    sol2. fa
    mi re
    fa,2 re'4 re do2

    %12
    do r4 r2.
    R1.*4\mbreak
    r4 mi8 re do si la4 re8 do si la

    %18
    sol4 do fa re2 sol,4
    sol do do dod dod dod
    re fa fa mi mi mi

    %21
    la, re2. dod2
    re4 dod re4. mi8 dod4. la8
    la2 r4 r2.

    %24
    R1.*2
    sib4 sib sib do re8 do sib la
    sol2 sol4 re'2 re4

    %28
    re sol, sol sold sold sold
    la do do re re re
    mi do re mi2 mi4

    %31
    mi2 r4 r2.
    R1.
    do4 do8 re mi do re4 mi8 re do si

    %34
    la2 la4 mi'2 mi4
    mi do8 sib! do re sib la sib do la sib
    do4 fa2. mi2

    %37
    fa4 la, la sib sib sib
    do re re sol2 r4
    R1.

    %40
    mi4 mi8 re do si la4 re8 do si la
    sol4 do do do r r
    R1.

    %43
    do4 do do sib sib sib
    do do do sib r r
    R1.\mbreak

    %46
    mi4 mi8 fa sol mi fa4 re sol
    do, mi8 re do sib la4 re8 do sib la
    sol4 r r r fa'2~

    %49
    fa4 mi2 fa4 do do
    sib sib do do do2
    do4 r r do r r

    %52
    do r r la r r\mbreak
    do r r r2.
    r4 fa2. mi2

    %55
    fa4 fa fa fa sol sol
    sol r8 sol fa4 re do2
    do2.~do

}

IIIbcn = \relative do {

    R1.*3
    do4 do do re re re
    mi la la sol sol8 fa mi re

    %6
    mi4 mi mi fa, fa'2~
    fa4 mi2 fa4 re sib
    do2 do4 fa re' re\mbreak

    %9
    do do8 sib la sol la4 sib8 la sol fa
    sol4 la8 sol fa mi fa4 sol8 fa mi re
    do2 re4 sib do2

    %12
    fa r4 re2 r4
    mi2 r4 fa2 re4
    do2 r4 la2 r4

    %15
    si2 r4 do4 r sol'
    do, r sol' do, r sol'\mbreak
    do,4 do2. si2

    %18
    do4 la' fa sol2 sol,4
    do2 r4 r2.
    re4 re re mi mi mi

    %21
    fa sib sib la la8 sol fa mi
    fa4 la re sol, la la,
    re2.~re~

    %24
    re4 sib re sol2.~\mbreak
    sol4 sol, re' sol sol, re'
    sol sol sol la la la

    %27
    sib mib, mib re re8 do sib la
    sib4 sol r r2.
    la'4 la la si si si

    %30
    do fa, fa mi mi8 re do si
    do4 la r la'2.~
    la4 la, mi'\mbreak la la, mi'

    %33
    la, la'2. sold2
    la4 fa re mi2 mi4
    la2. sol

    %36
    fa  r
    fa4 fa fa sol sol sol
    la re re do do, r

    %39
    R1.\mbreak
    do4 do do re re re
    mi mi mi fa r r

    %42
    R1.
    fa4 fa fa sol sol sol
    la la la sib r r

    %45
    R1.\mbreak
    r4 do2. si2
    do,4 do do re re re

    %48
    mi mi mi fa fa fa
    sol sol sol la la la
    sib sib la fa do' do,

    %51
    fa r r fa r r
    fa r r fa r r\mbreak
    fa r r r2.

    %54
    fa4 fa fa sol sol sol
    la la la sib sib sib
    do r8 do re4 sib do do,

    %57
    fa2.~fa

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 6/4
    \tempo 2. = 55
    s1.*57
    \bar"|."

}


IIIcrt = {
    \global
    %\notypeset
    <<\IIIcrtn \forma>>

}

IIItrbI = {
    \global
    \clef alto
    <<\IIItrbIn \forma>>

}

IIItrbII = {
    \global
    \clef tenor
    <<\IIItrbIIn \forma>>

}

IIItrbIII = {
    \global
    \clef bass
    <<\IIItrbIIIn \forma>>

}

IIIvlg = {
    \global
    \clef bass
    <<\IIIvlgn \forma>>

}

IIIfl = {
    \global
    <<\IIIfln \forma>>

}

IIIvl = {
    \global
    <<\IIIvln \forma>>

}

IIIvlaI = {
    \global
    <<\IIIvlaIn \forma>>

}

IIIvlaII = {
    \global
    \clef alto
    <<\IIIvlaIIn \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \header {
    title = \markup\smaller"Sinfonia [TWV 50:3]"
    composer = \markup \center-column{"G. P. Telemann (1681-1767)"}
		}

    \markup \huge {[1.] Alla breve}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"trumpet"
                \set Staff.instrumentName = \markup  \center-column{"Cornett[o]"}
                \Icrt
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup  \center-column{"Trombona 1."\vspace #-0.2"[Contralto]"}
                \ItrbI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup  \center-column{"Trombona 2."\vspace #-0.2"[Tenore]"}
                \ItrbII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup  \center-column{"Trombona 3."\vspace #-0.2"[Basso]"}
                \ItrbIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola di gamba"}
                \Ivlg
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major\time 4/4  r1^\markup \right-align{"Flauto dolce"}}
                \clef violin
                \set Staff.midiInstrument = #"recorder"
                \Ifl
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup  \center-column{"Violino e Oboe"}
                \Ivl
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major\time 4/4  r1^\markup \right-align\column{"Viola 1."}}
                \set Staff.midiInstrument = #"viola"
                \clef alto
                \IvlaI
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola 2."}
                \IvlaII
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Violoncello"\vspace #-0.2"Cembalo"}
                \Ibc
                \key fa\major
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine #'hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[2.] Andante}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"[Viola""di gamba]"}
                \IIvlg
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major\time 4/4  r1^\markup \right-align{"[Flauto dolce]"}}
                \clef violin
                \set Staff.midiInstrument = #"recorder"
                \IIfl
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Violoncello]"}
                \IIbc
                \key fa\major
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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

        systems-per-page = #2

    }

    \markup \huge {[3.] Vivace}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"trumpet"
                \set Staff.instrumentName = \markup  \center-column{"Cornett[o]"}
                \IIIcrt
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup  \center-column{"Trombona 1."\vspace #-0.2"[Contralto]"}
                \IIItrbI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup  \center-column{"Trombona 2."\vspace #-0.2"[Tenore]"}
                \IIItrbII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup  \center-column{"Trombona 3."\vspace #-0.2"[Basso]"}
                \IIItrbIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola di gamba"}
                \IIIvlg
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major\time 4/4  r1.^\markup \right-align{"Flauto dolce"}}
                \clef violin
                \set Staff.midiInstrument = #"recorder"
                \IIIfl
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup  \center-column{"Violino e Oboe"}
                \IIIvl
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major\time 4/4  fa'4 fa' fa'^\markup \right-align\column{"Viola 1."}}
                \set Staff.midiInstrument = #"viola"
                \clef alto
                \IIIvlaI
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola 2."}
                \IIIvlaII
                \key fa\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Violoncello"\vspace #-0.2"Cembalo"}
                \IIIbc
                \key fa\major
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine #'hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
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






%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
