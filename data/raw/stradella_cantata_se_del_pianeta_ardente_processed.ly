\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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


upl =
#(let ((m (make-articulation 'stopped)))
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
}

IvlIn = \relative do'' {

    la1
    r4 re2 dod4
    fa8 fa la[la] do do\mbreak

    %4
    la4 fa do
    fa8 fa do[do] sol sol
    la la do[do do do]

    %7
    fa fa la[la] do do
    la4 r r\mbreak
    sib,2 la4 re~

    %10
    re do re2
    fad8 fad sol[sol] la la
    sib2 la4

    %13
    sol4. la8 sib4
    la r r\mbreak  %% fine p. 8
    dod,8 dod re[re] mi mi

    %16
    fa2 mi4
    re4. mi8 re4
    dod2.

    %19
    r4 r8 la re4 mi
    fa8.[mi16 re8 fa] mi4 fa\mbreak
    re4. fa8 mi8.[fa16 mi8. re16]

    %22
    re4 dod8. dod16 re8.[mi16 re8. do?16]
    do4 si8. si16 do4 re
    mi r8 la si8. do16 si8. la16\mbreak

    %25
    sold8 mi la[la] la8. si16 sold8. la16
    la4. r8 la4. si8
    do4 fa, sib la8. la16\mbreak

    %28
    sol2 la8. sol16 fa8. mi16
    re8. mi16 fa8. fa16 fa8. sol16 mi8. mi16
    fad2 sol4. sol8

    %31
    sol2 fa4. fa8\mbreak
    sold4 la la4. sol?8
    la8. [sol16 fa8. mi16] re8. [fa16 mi8. re16]

    %34
    dod8 la re8. re16 re8. mi16 dod8. re16
    re2

}

IvlaIn = \relative do' {

    fa2 mi4 la~
    la sol la2
    R2.\mbreak

    %4
    fa8 fa la[la] do do
    la la fa[fa] mi mi
    fa fa fa fa sol[sol]

    %7
    la la la fa sol[sol]
    fa4 r r\mbreak
    sol2. fad4

    %10
    sol2 la
    la8 la sib[sib] la la
    sol2 fa4

    %13
    fa2 mi4
    fa r r\mbreak
    la8 la la[la] la la

    %16
    la2 la4
    la fa sol
    la2.

    %19
    R1
    r4 r8 la sib4 la\mbreak
    fa4. la8 sib4. la8

    %22
    la2 la
    sol4. sol8 sol4 si?
    do la fa re'~\mbreak

    %25
    re do8. do16 si4. si8
    dod4. r8 do?4. sib8
    la4 r8 fa sol4 la\mbreak

    %28
    do2 do4. do8
    sib4 la sol2
    la sol8. fa16 mi8. re16

    %31
    do2 re4 fa\mbreak
    mi la, fa' sol
    fa2 sib

    %34
    la la4. la8
    fad2

}

IvlaIIn = \relative do' {

    re2 re4 dod
    re2 mi
    R2.*2

    %5
    fa,8 fa la[la] do do
    do4. do8 mi mi
    do do do fa mi[mi]

    %8
    do4 r r\mbreak
    re1
    r4 sol2 fad4

    %11
    re8 re re[re] re re
    re2 do4
    re2 do4

    %14
    do r r\mbreak
    mi8 mi fa[fa] mi mi
    re2 dod4

    %17
    re2.
    mi
    R1

    %20
    r4 r8 re re4 dod\mbreak
    re4. re8 sol4. fa8
    mi2 fad

    %23
    re4 r8 re mi4 fa?
    sol mi re fa\mbreak
    mi2 mi4. mi8

    %26
    mi4. r8 fa2
    fa4 re mi fa\mbreak
    fa mi fa2

    %29
    fa8 sib, do4 do4. mi8
    re2 re
    mi re\mbreak

    %32
    mi re
    do4 re re sol8. fa16
    mi4 fa mi4. mi8

    %35
    re2

}

Ibcn = \relative do {

    re2 la
    sib la
    R2.*3

    %6
    fa8 fa la[la] do do
    la la fa[fa] do do
    fa4 r r\mbreak

    %9
    sol'2 re
    mib re
    re8 re sib[sib] fad fad

    %12
    sol2 la4
    sib2 do4
    fa, r r\mbreak

    %15
    la'8 la fa[fa] dod dod
    re2 la4
    sib2.

    %18
    la
    R1
    r4 r8 re sol4 la\mbreak

    %21
    sib4. re,8 sol4. re8
    la'4 la, re re,
    sol r8 sol mi4 re

    %24
    do2 fa\mbreak
    mi mi
    la4. r8 fa'4. sol8

    %27
    la4 sib sol fa\mbreak
    do2 la
    sib4 fa do do'

    %30
    do2 sib
    la re~\mbreak
    re4 do sib2

    %33
    fa sol
    la4 re, la'2
    re,

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*2
    \time 3/4
    \tempo 2. = 50
    s2.*6
    \time 4/4
    \tempo 2 = 50
    s1*2
    \time 3/4
    \tempo 2. = 50
    s2.*8
    \bar"||"%\break
    \time 4/4
    \tempo 2 = 55
    s1*7
    s2 \bar ".|:" s
    s1*8
    s2 \bar ":|."

}



IvlI = {
    \global
    \notypeset
    <<\IvlIn \forma>>

}

IvlaI = {
    \global
    \clef alto
    <<\IvlaIn \forma>>

}

IvlaII = {
    \global
    \clef tenor
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
}


IIsopranon = \relative do'' {

    \autoBeamOff

    r4 la2 la8 la
    re4 re8 re fa4 fa\mbreak
    fa8 fa16 fa mi8. re16 dod4 dod

    %4
    dod?8 dod16 dod re8 mi la,4 la\mbreak
    r la8 sib sol4 sol8 la
    fa4 sol2 sol8 la

    %7
    la2 la
    r4 fa'2 fa4\mbreak
    do4 do8 re sib4 sib

    %10
    re8 sib16 sib sib8 sib sol sol la sib
    do do do re\mbreak sib4 sib8 la
    la4 la r8 re re do

    %13
    do4 do8 re sib4 sib\mbreak
    r re8. sol16 mib4 re8 do
    re4 sib8 re sol,[la16 sib] do[re do re]

    %16
    sib8[do16 re] mib[fa mib fa]\mbreak re8[mib16 fa] sol4~
    sol8. fa16[mib re do sib] sib4(la)
    sol la8. re16 sib4la8 sol

    %19
    la4 re,8 la' re,[mi16 fa] sol[la sol la]
    fa8[sol16 la] sib[do sib do] la8[sib16 do] re[mi re mi]
    dod4 la\mbreak r8 re mi fa

    %22
    re4. dod8(re2)

}

IItesto = \lyricmode {

    Se del pia -- neta _ ar -- den -- te i lu -- mino - si rag -- gi da gl'in -- sen -- sati _ mar -- mi

    eb -- ber for -- za di trar fo -- ra vo -- ca -- li hor da rag -- gi vi -- ta -- li

    del -- l'a -- do -- rato _ sol che qui ri -- splen -- de_al --

    l'im -- prov -- vi -- so_a -- ni -- ma -- to

    con bas -- si_ac -- centi _ an -- ch'i -- o

    or -- narò _ de su -- oi fre -- gi_il Can - - - - - to mi -- o

    or -- narò _ de su -- oi fre -- gi_il Can - - - - - - to il Can -- to mi -- o.

    il Canto mio.





}


IIbcn = \relative do {

    re1~
    re~
    re~

    %4
    re2 dod\mbreak
    dod~dod
    re4 sib2 sib4

    %7
    la1
    fa~\mbreak
    fa~

    %10
    fa
    mi2~\mbreak mi
    fa fad~

    %13
    fad sol\mbreak
    sol do4 fa,
    sib2 mib4 do

    %16
    sol' mib\mbreak sib2
    do re
    sol,4 re' sol, do\mbreak

    %19
    fa,2 sib4 sol
    re' sib fa' sib
    la4. sol8\mbreak fa4 sol

    %22
    la2 re,

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*6
    <_+>1
    s1*6
    <_->2 <_- 7>
    s1*3
    s4 <_-> <7 _->

}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 80
    s1*22
    \bar"|."

}


IIsoprano = {
    \new Voice = "pianeta"
    \global
    <<\IIsopranon \forma>>

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
}

IIIvlIn = \relative do'' {

    r2 r la
    re dod2. re4
    mi2 la, la'

    %4
    fa sol2. la4
    la1 la2
    fa sol2. sol4

    %7
    la1 mi2
    fa do2. do4\mbreak
    re2. fa4 sol la

    %10
    sib2 la2. la4
    sol1 la2
    re, sol2. sol4

    %13
    do,1 re4 mi
    fa2 fa2. mi4
    fa1  mib2~

    %16
    mib re1\mbreak
    dod2 la la'4 sol
    fa2 mi2. mi4

    %19
    re1 mib2~
    mib re1
    dod2 la la'4 sol

    %22
    fa2 mi2. mi4
    re1.
    R1.*3

    %27
    r2 r la
    re dod2. re4
    mi2 la, la'

    %30
    fa sol2. sol4
    la1.\mbreak
    R1.*5

    %37
    r2 r mi\mbreak
    fa sol la
    re,1.

    %40
    R1.*3
    r2 r la'
    sol fa2. sol4\mbreak

    %45
    la1 mi2
    fa sol la
    re,1 sol2

    %48
    fa mi2. mi4
    re1.
    R1.*7

    %57
    r2 r la'\mbreak
    sib sib2. la4
    sol2. la4 sib2

    %60
    sib? la2. sol4
    fad1.
    R1.*3

    %65
    r2 r sol
    sib la2. sol4
    fad2 re sol

    %68
    sol sol2. fad4
    sol4.
    R4.*7

    %77
    r8 r sold
    la si la
    sold4.

    %80
    R4.*7
    r8 r mi
    la la la\mbreak

    %89
    la sol fad
    si si si
    si la sold

    %92
    do do si
    la4 fa?8
    do si do

    %95
    la4.
    R
    r8 r dod

    %98
    re mi fa
    mi la, r
    R4.*7

    %107
    r8 r la
    re mi re\mbreak
    dod4 r8

    %110
    R4.*8
    fa,8 sol la
    si4 r8

    %120
    sold la si\mbreak
    dod4 r8
    la si dod

    %123
    re4.
    R4.
    r8 r la

    %126
    re re re
    re do si
    mi mi mi\mbreak

    %129
    mi re dod
    fa fa fa
    fa mi re

    %132
    sol fa sol
    la4 r8
    R4.
    r8 r sib

    %135
    fa mi fa
    re4 r8\fermata

}

IIIvdgn = \relative do {

    r2 r re
    re, la'2. sib4
    la1 dod2

    %4
    re sib1
    la la2
    re sib2. sib4

    %7
    la1 la'2
    re la2. la4\mbreak
    sib1 la2

    %10
    sol fa1
    do fa,2
    sib sol2. sol4

    %13
    la1 sib2
    fa do'1
    fa, sol2~

    %16
    sol sib1\mbreak
    la  fa2
    sol la1

    %19
    re sol,2~
    sol sib1
    la fa2

    %22
    sol la1
    re1.
    re2 la sib\mbreak

    %25
    la1 la'2
    re, mi1

    %27
    la, re2
    fa,  la2. sib4
    la1 dod2

    %30
    re sib1
    la1 la2
    re1 do2

    %33
    sib2. la4 sol2
    la1.
    re1  do2

    %36
    sib1.
    la1 la2
    re mi fa

    %39
    sib,1 sib2
    sol1.
    la2 fa sol

    %42
    la1.
    re1 re2
    sib1.\mbreak

    %45
    la1 la2
    re mi fa
    sib, la sol

    %48
    la1.
    re1.
    do

    %51
    fa,2 sol la\mbreak
    sib1.
    do1.

    %54
    la1 fa2
    sib1 fa2
    do'1.

    %57
    fa,1 fa'2
    sib,2. do4 re2
    mib1 sib?2

    %60
    sib? do1
    re1 re2
    sib1.

    %63
    do2 re mib
    re1.\mbreak
    sol,

    %66
    sol2 do1
    re sol,2

    %68
    re' re,1
    sol4.
    sol'8  la sib

    %71
    fa mi re\mbreak
    sol  la la,
    re [re, re']

    %74
    do re mi\noBeam
    la, si do
    fa,4.\mbreak

    %77
    mi4 mi'8
    fa4 re8

    %79
    mi4 mi8
    do si la
    re4 fad8

    %82
    si, dod red\mbreak
    mi4 mi8
    do re mi

    %85
    fa mi re
    mi4 mi,8
    la4 mi'8

    %88
    la,8 si dod\mbreak
    re4 re8
    si dod red
    mi4 mi8

    %92
    do re mi
    fa mi re
    mi4 mi,8

    %95
    la4 la'8
    fa mi re\mbreak
    la'4 la8

    %98
    fa8 mi re
    la'4 la8
    fa sol la

    %101
    sib4 la8
    sol la sib\mbreak
    la4 sol8

    %104
    fa mi re
    sol4 la8
    sib4.

    %107
    la4 re,8
    sib4.\mbreak
    la4 la'8

    %110
    re,[mi] fad
    sol4 si8
    mi, fad sold

    %113
    la4 la8
    fa sol? la\mbreak
    sib[la sol]

    %116
    la4 la,8
    re4 r8
    re mi fad

    %119
    sol4 r8
    mi fad sold\mbreak
    la4 r8

    %122
    fa? sol? la
    sib[do re]
    sib4 sib8

    %125
    la4 la8
    re, mi fad
    sol4 sol8

    %128
    mi fad sold\mbreak
    la4 la8

    %130
    fa? sol? la
    sib4 re8
    sib4 sib,8

    %133
    la4 fa8
    sol4 la8
    sib4 sol8

    %136
    la4 la8
    re,4 r8\fermata

}

IIIvlaIn = \relative do' {

    r2 r fa
    la la2. re,4
    la'1 la2

    %4
    la re1
    dod dod2
    la re1

    %7
    dod la2 la
    la2. do?4\mbreak
    sib1 fa2
    re fa2. fa4

    %11
    mi1 fa2
    fa mi2. mi4
    fa1 fa4 sol

    %14
    la2 sol2. sol4
    la1 sib2~
    sib sol1\mbreak

    %17
    la la2~
    la la2. la4
    fa1 sib2~

    %20
    sib sol1
    la la2~
    la la2. la4

    %23
    fa1.
    R1.*3
    r2 r fa

    %28
    la la2. re,4
    la'1 la2
    la re1

    %31
    dod1.\mbreak
    R1.*5
    r2 r la\mbreak

    %38
    la1.
    sib
    R1.*3

    %43
    r2 r la
    re1.\mbreak
    dod1 la2

    %46
    la1.
    sib1 sib2
    la la2. la4

    %49
    fa1.
    R1.*7
    r2 r do'\mbreak

    %58
    re re2. do4
    sib2. do4 re2
    re do2. sib4

    %61
    la1.
    R1.*3\mbreak
    r2 r sib

    %66
    re do1
    do sib2
    sib? la2. la4

    %69
    sib4.
    R4.*7
    r8 r si?

    %78
    la4 re8
    si4.
    R4.*7

    %87
    r8 r si
    dod4 dod8\mbreak
    la4 la8

    %90
    re4 si8
    si4 si,8
    mi fad sold

    %93
    la4 la8
    la4 sold8
    la4.

    %96
    R4.\mbreak
    r8 r la
    la4 la8

    %99
    la4 r8
    R4.*7
    r8 r fa

    %108
    sol4 sol8\mbreak
    la4 r8
    R4.*8

    %118
    la4 la8
    sol4 r8
    si4 si8\mbreak

    %121
    la4 r8
    la4 sol8
    fa4.

    %124
    R
    r8 r la
    fad sol la

    %127
    si4 si8
    sold la si\mbreak
    dod4 dod8

    %130
    la si dod
    re4 la8
    re4 re8

    %133
    dod4 r8
    R4.
    r8 r re

    %136
    re re dod
    re4 r8\fermata

}

IIIvlaIIn = \relative do' {

    r2 r re
    fa mi2. re4
    dod1 mi2

    %4
    re re1
    mi mi2
    re re1

    %7
    mi dod2
    re fa2. fa4\mbreak
    fa1 fa2

    %10
    sib, do?2. do4
    do1 do2
    sib sib2. sib4

    %13
    do1 sib2
    do do2. do4
    do1 sol'2~

    %16
    sol re1\mbreak
    mi la,2
    re re2. dod4

    %19
    re1 sol2~
    sol re1
    mi la,2

    %22
    re re2. dod4
    re1.
    R1.*3

    %27
    r2 r re
    fa mi2. re4
    dod1 mi2

    %30
    re re1
    mi1.\mbreak
    R1.*5

    %37
    r2 r dod\mbreak
    re1.
    re

    %40
    R1.*3
    r2 r fa
    re1.\mbreak

    %45
    mi1 mi2
    re1.
    re

    %48
    re2 re2. dod4
    re1.
    R1.*7

    %57
    r2 r fa\mbreak
    fa sib,1
    sib?2 mib re

    %60
    re sol,1
    re'1.
    R1.*3

    %65
    r2 r sol
    sol mib1
    re re2~

    %68
    re re2. re4
    re4.
    R4.*7\mbreak

    %77
    r8 r mi
    mi re fa
    mi4.

    %80
    R4.*7
    r8 r sold
    mi re mi\mbreak

    %89
    fad4 fad8
    fad? mi fad
    sold4 mi8

    %92
    mi4 re8
    do4 fa?8
    mi4 mi8

    %95
    dod4.
    R\mbreak
    r8 r mi

    %98
    fa4 fa8
    dod4.
    R4.*7

    %107
    r8 r fa
    re4 re8\mbreak
    mi4 r8

    %110
    R4.*8
    re4 re8
    re4 r8

    %120
    mi4 mi8\mbreak
    mi4 r8
    fa4 mi8

    %123
    re4.
    R
    r8 r dod

    %126
    la4 re8
    re4 sol,8
    si4 mi8\mbreak

    %129
    mi4 mi8
    la4 fa8
    fa4.

    %132
    re4 re8
    mi4 r8
    R4.

    %135
    r8 r re
    la' la la
    fad4 r8\fermata

}

IIIsopranon = \relative do'' {

    \autoBeamOff

    R1.*22
    r2 r la
    re dod2. re4\mbreak

    %25
    mi2 la, dod
    dod?4(si) si(dod) re2
    dod la r

    %28
    R1.*3
    r2 r mi'\mbreak
    fa sol la

    %33
    re, re sol
    fa2. mi4 re2
    re1 la2

    %36
    sol fa2. sol4
    la1.\mbreak
    R

    %39
    r2 r re
    mi fa sol
    dod, la re

    %42
    fa mi2. fa4
    re1.
    R1.*5

    %49
    r2 r la
    do do do
    do2. sib4 la2\mbreak

    %52
    re sib la
    sol do, do'
    fa fa do

    %55
    re2. mi4 fa2
    fa2. fa4 mi2
    fa1.\mbreak

    %58
    R1.*3
    r2 r fad
    sol re sol

    %63
    mib2. re4 do2
    sib la2. sib4\mbreak
    sol1.

    %66
    R1.*3
    r8 r sol
    sib la sol

    %71
    re' re re\mbreak
    mi re mi
    fa re fa

    %74
    mi mi re
    do re mi
    re do re\mbreak

    %77
    mi4.
    R
    r8 r mi,

    %80
    la la la
    la sol fad
    si si si\mbreak

    %83
    si la sold
    do do si
    la4 fa'8

    %86
    do si do
    la4 r8
    R4.*7

    %95
    r8 r dod
    re mi fa\mbreak
    mi la, r

    %98
    R4.
    r8 r mi'
    fa fa mi

    %101
    re mi fa
    mi re mi\mbreak
    dod si la

    %104
    re re do?
    sib la sol
    fa mi re

    %107
    la'4 r8
    R4.\mbreak
    r8 r la

    %110
    re re re
    re do si
    mi mi mi

    %113
    mi re dod
    fa fa mi\mbreak
    re4 sol8

    %116
    fa mi fa
    re4 la8
    re4.~

    %119
    re8.[si16 do re]
    mi4.~\mbreak
    mi8.[dod16 re mi]

    %122
    fa4.
    r8 r fa
    sol fa sol

    %125
    la4 r8
    R4.*7
    r8 r la

    %134
    fa mi fa
    re4.
    R

    %137
    R\fermata

}

IIItesto = \lyricmode {

    So -- vra -- na Re -- a -- le A -- stre -- a re  -- gnan -- te ec -- cel -- so na -- ta -- le

    Re -- gi -- na mi fé Re -- gi -- na mi fé, ec -- cel -- so na -- ta -- le Re -- gi -- na mi fé.

    Au -- gu -- sto sem -- bian -- te m'e -- les -- se

    agl'Im -- pe -- ri su -- bli -- mi pen -- sie -- ri la stir -- pe mi dié,

    su -- bli -- mi pen -- sie -- ri la stir -- pe mi dié.

    Da tan -- ti ful -- go -- ri ra -- pi -- ta_et ac -- ce -- sa dal

    Cie -- lo di -- sce -- sa si ve -- de qua giù nel vo -- stro Go  -- ver -- no

    nel vo -- stro Go  -- ver -- no re -- gnar la vir -- tù, re -- gnar la vir -- tù.

    Da tan -- ti ful -- go -- ri, da tan -- ti ful -- go -- ri ra -- pi -- ta_et ac -- ce -- sa dal

    Cie -- lo di -- sce -- sa si ve -- de qua giù nel vo -- stro Go  -- ver -- no

    nel vo -- stro Go  -- ver -- no re -- gnar la vir -- tù, re -- gnar la vir -- tù,

    re -- gnar - - re -- gnar la vir -- tù, re -- gnar la vir -- tù.

}

IIItestoI = \lyricmode {

    L'au -- ro -- ra di fio -- ri lei spar -- se_il bel vi -- so

    nell' al -- ma i can -- do -- ri_il Ciel in -- spi -- rò, il Ciel in -- spi -- rò,

    nell' al -- ma i can -- do -- ri_il Ciel in -- spi -- rò, negl' oc -- chi di vi -- so il so -- le

    ri -- lu -- ce di can -- di --  da lu -- ce la glo -- ria v'or -- nò,

    di can -- di --  da lu -- ce il Cie -- lo v'or -- nò, de co -- ri,_e de vo -- ti la me -- ta

    Voi sie -- te re -- gnate _ reg -- gete _ ch'il Cie -- lo co -- sì il pub -- bli -- co be -- ne

    il pub -- bli -- co be -- ne in Voi sta -- bi -- lì, in Voi sta -- bi -- lì.

    De co -- ri,_e de vo -- ti, de co -- ri,_e de vo -- ti la me -- ta

    Voi sie -- te re -- gnate _ reg -- gete _ ch'il Cie -- lo co -- sì il pub -- bli -- co be -- ne

    il pub -- bli -- co be -- ne in Voi sta -- bi -- lì, in Voi sta -- bi -- lì, in Voi - -

    in Voi sta -- bi -- lì, in Voi sta -- bi -- lì.

}


IIIbcn = \relative do {

    r2 r re
    re, la'2. sib4
    la1 dod2

    %4
    re sib1
    la la2
    re sib2. sib4

    %7
    la1 la'2
    re la2. la4\mbreak
    sib1 la2

    %10
    sol fa1
    do fa,2
    sib sol2. sol4

    %13
    la1 sib2
    fa do'1
    fa, sol2~

    %16
    sol sib1\mbreak
    la  fa2
    sol la1

    %19
    re sol,2~
    sol sib1
    la fa2

    %22
    sol la1
    re,1.\mbreak
    R1.*3

    %27
    r2 r re'
    re, la'2. sib4
    la1 dod2

    %30
    re sib1
    la1.\mbreak
    R1.*5

    %37
    r2 r la
    re mi fa
    sib,1.

    %40
    R1.*3
    r2 r re
    sib1.\mbreak

    %45
    la1 la2
    re mi fa
    sib, la sol

    %48
    la1.
    re,
    R1.*7

    %57
    r2 r fa'
    sib,2. do4 re2
    mib1 sib2

    %60
    sib? do1
    re1.
    R1.*3

    %65
    r2 r sol
    sol, do1
    re sol,2

    %68
    re' re,2. re4
    sol4.  %68  comincia 3/8
    R4.*7

    %77
    r8 r mi'
    fa4 re8
    mi4.

    %80
    R4.*7
    r8 r mi
    la,8 si dod\mbreak

    %89
    re4 re8
    si dod red
    mi4 mi8

    %92
    do re mi
    fa mi re
    mi4 mi,8

    %95
    la4.
    R\mbreak
    r8 r la'

    %98
    fa mi re
    la' la, r
    R4.*7

    %107
    r8 r re
    sib4 sib8\mbreak
    la4 r8

    %110
    R4.*8
    re8 mi fad
    sol4 r8

    %120
    mi fad sol\mbreak
    la4 r8
    fa sol la

    %123
    sib4.
    R
    r8 r la

    %126
    re, mi fad
    sol4 sol8
    mi fad sold\mbreak
    la4 la8

    %130
    fa sol la
    sib4 re8
    sib4 sib,8

    %133
    la4 r8
    R4.
    r8 r sol

    %136
    la4 la8
    re,4 r8\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*47
    <4>1 <_+>2
    s1.*20
    <_->4.

}

forma = {

    \time 3/2
    \key do\major
    \tempo 1 = 60
    s1.*68\break
    \time 3/8
    \tempo 4. = 55
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
  \mark \markup "2.a"
    s4.*69
    \bar"|."
    \mark \markup\center-column {"[Da""Capo]"}

}



IIIvlI = {
    \global
    %\notypeset
    <<\IIIvlIn \forma>>

}

IIIvlaI = {
    \global
    \clef alto
    <<\IIIvlaIn \forma>>

}

IIIvlaII = {
    \global
    \clef tenor
    <<\IIIvlaIIn \forma>>

}

IIIvdg = {
    \global
    \clef bass
    <<\IIIvdgn \forma\IIIbfn>>

}


IIIsoprano = {
    %\new Voice = "aria"
    \global
    <<\IIIsopranon \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma>>
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
}

IVvlIn = \relative do'' {

    R1*7
    r2 r8 fad, la fad
    si4 r8 si do4 r8 la'\mbreak

    %10
    fa8. mi16 re8 mi fa4 r
    r8 dod mi dod fa4 r
    r8 dod mi dod fa4 r8 fad

    %13
    sol4 r8 sold la4 r8 la\mbreak
    sib4 r8 sib, la2
    sol'8. fa16 mi8 re dod re re8. dod16

    %16
    re4 r r2\fermata

}

IVvdgn = \relative do {

    fa2 re
    do do
    <<{r4 fad}\\do2>>\mbreak sol

    %4
    sol sib4 mib8 do
    re2 sol,\mbreak
    sol' dod,

    %7
    re4 sib la2
    la' r8 re, fad re
    sol4 r8 mi la4 r8 fa\mbreak

    %10
    re8. la16 re8 la re,4 mi
    la8 \noBeam la dod la re2
    r8 la dod la re4 r8 re

    %13
    sol4 r8 mi la4 r8 fa\mbreak
    sib4 r8 sol re'4 re,
    sol,8. la16 sib8 sol la re, la'4

    %16
    re, r r2\fermata

}

IVvlaIn = \relative do' {

    R1*7
    r2 r8 la' fad la
    sol4 r8 sold la4 r8 la\mbreak

    %10
    la8. la16 la8 la la4 r
    r8 la mi la la4 r
    r8 la mi la la4 r8 la

    %13
    si4 r8 si dod4 r8 do\mbreak
    re4 r8 re, re2
    sib'4. sib8 la la la8. la16

    %16
    la4 r r2\fermata

}

IVvlaIIn = \relative do' {

    R1*7
    r2 r8 re la re
    re4 r8 mi mi4 r8 la,\mbreak

    %10
    re8. dod16 re8 dod re4 r
    r8 mi dod mi re4 r
    r8 mi dod mi re4 r8 re

    %13
    re4 r8 mi mi4 r8 fa\mbreak
    sol4 r8 sol, la4 r
    re4. sol8 mi re r la

    %16
    la4 r r2\fermata

}

IVsopranon = \relative do'' {

    \autoBeamOff

    la4 r8 do fa,4 fa8 mi
    sol4 sol r r8 do
    mib4 re8 re16 do\mbreak sib4 sib

    %4
    re8 re sol4~sol16[fa mib re] do8 do16 re
    sib4. la8(sol2)\mbreak
    sib4 sib8 la la4  la8 mi

    %7
    fa mi fa re la'4 la
    r8 la dod la re4 re
    r8 si mi4 r8 do la4~\mbreak

    %10
    la la r8 fa' do8. si16\parentSlur (
    la2) r8 re, fa re
    la'4 la r8 la re4

    %13
    r8 si mi4 dod8 mi fa4\mbreak
    r8 re sol2 fa4
    r2 r8 la fa8. mi16(

    %16
    re4) r r2\fermata

}

IVtesto = \lyricmode {

    Ma che di -- co che ten -- to? Non può l'hu -- mil mio can -- to

    sol -- le -- var - si tant' al -- to on -- de ta -- cendo _ al Vo -- stro_ec -- celso _ scet -- tro

    con -- se -- gno_i car -- mi

    il cor, la vo -- ce e'l plet -- tro, con -- se -- gno_i car -- mi

    il cor, la vo -- ce, il cor, la vo -- ce, e'l plet -- tro.

}


IVbcn = \relative do {

    R1*7
    r2 r8 re fad re
    sol4 r8 mi la4 r8 fa\mbreak

    %10
    re8. la16 re8 la re,4 r
    r8 \noBeam la' dod la re4 r
    r8 la dod la re4 r8 re

    %13
    sol4 r8 mi la,4 r8 fa'\mbreak
    sib,4 r8 sol re'4 re,
    sol8. la16 sib8 sol la re, la'4

    %16
    re, r r2\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <_->
    s <_->
    s1*2
    <_->1
    s2 <_+>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*16
    \bar"|."

}

IVvlI = {
    \global
    %\notypeset
    <<\IVvlIn \forma>>

}

IVvlaI = {
    \global
    \clef alto
    <<\IVvlaIn \forma>>

}

IVvlaII = {
    \global
    \clef tenor
    <<\IVvlaIIn \forma>>

}

IVvdg = {
    \global
    \clef bass
    <<\IVvdgn \forma\IVbfn>>

}


IVsoprano = {
    \new Voice = "tento"
    \global
    <<\IVsopranon \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller {Cantata ”Se del pianeta ardente”}
        composer = \markup \center-column{"A. Stradella (1643-1682)"}

    }

    \markup \huge {[1.] Sinfonia avanti}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino]"}
                \set Staff.shortInstrumentName = "vl"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"[Viola""prima]"}
                \set Staff.shortInstrumentName = "vla1"
                \IvlaI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"[Viola""seconda]"}
                \set Staff.shortInstrumentName = "vla2"
                \IvlaII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

        systems-per-page = #7

    }

    \markup \huge {[2. Recitativo]}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 4/4  r4^\markup \center-align"[Soprano]"la'2}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIsoprano
                \set Staff.shortInstrumentName = "sop"
                \new Lyrics \lyricsto "pianeta" \IItesto
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 19)
            indent = 1.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

        systems-per-page = #3

    }

    \markup \huge {[3.] Aria concertata con le Viole}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Voice = "aria" <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major\time 3/2\override MensuralStaff.TimeSignature.style = #'numbered, r2.^\markup \center-align"[Soprano]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIIsoprano
                    \set Staff.shortInstrumentName = "sop"
                    \new Lyrics \lyricsto "aria" \IIItesto
                    \new Lyrics \lyricsto "aria" \IIItestoI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup  \center-column{"[Viola""da Gamba]"}
                    \IIIvdg
                    \set Staff.shortInstrumentName = "vdg"
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup  \center-column{"[Violino]"}
                    \IIIvlI
                    \set Staff.shortInstrumentName = "vl"
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup  \center-column{"[Viola""prima]"}
                    \IIIvlaI
                    \set Staff.shortInstrumentName = "vla1"
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup  \center-column{"[Viola""seconda]"}
                    \IIIvlaII
                    \set Staff.shortInstrumentName = "vla2"
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                    \set Staff.shortInstrumentName = "bc"
                    \IIIbc
                >>
            >>
        >>

            \layout {
               #(layout-set-staff-size 17.5)
                indent = 1.5\cm
                incipit-width = 2\cm

                \context	{
                    \Score
                    \override StaffGrouper.staff-staff-spacing.padding = #1
                    \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                    \override BarLine.hair-thickness = #1.2
                    \override SpacingSpanner.uniform-stretching = ##t
                    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[4.] Ma che dico che tento?}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major\time 4/4 la'4^\markup \center-align"[Soprano]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVsoprano
                    \set Staff.shortInstrumentName = "sop"
                    \new Lyrics \lyricsto "tento" \IVtesto
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup  \center-column{"[Viola""da Gamba]"}
                    \IVvdg
                    \set Staff.shortInstrumentName = "vdg"
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup  \center-column{"[Violino]"}
                    \IVvlI
                    \set Staff.shortInstrumentName = "vl"
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup  \center-column{"[Viola""prima]"}
                    \IVvlaI
                    \set Staff.shortInstrumentName = "vla1"
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup  \center-column{"[Viola""seconda]"}
                    \IVvlaII
                    \set Staff.shortInstrumentName = "vla2"
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                    \set Staff.shortInstrumentName = "bc"
                    \IVbc
                >>
            >>
        >>

            \layout {
               #(layout-set-staff-size 17.5)
                indent = 1.5\cm
                incipit-width = 2\cm

                \context	{
                    \Score
                    \override StaffGrouper.staff-staff-spacing.padding = #1
                    \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                    \override BarLine.hair-thickness = #1.2
                    \override SpacingSpanner.uniform-stretching = ##t
                    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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