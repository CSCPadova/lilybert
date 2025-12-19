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
}

IvlIn = \relative do'' {

    fa8 do r
    la' fa r
    do fa do

    %4
    la8. sol16 fa8
    mi' do r
    sol' mi r

    %7
    sol do sol
    la8. sol16 fa8
    fa la r

    %10
    re, fa r
    si, sol' fa
    fa4\tr mi8

    %13
    sol16 sol sol sol sol sol
    la, la la la la la
    la' la la la la la

    %16
    si, si si si si si\mbreak
    si' si si si si si
    do8 do, do'

    %19
    mi, re4\tr
    do8 mi la
    re, sol r

    %22
    do, fa do
    si mi r
    la, re la

    %25
    si16 sol si re sol r
    do, sol do mi sol r
    si, sol si re sol r

    %28
    mi8 fa re
    mi do r
    sol' mi r\mbreak

    %31
    sol do sol
    mi8. re16 do8
    re si r

    %34
    sol' re r
    si' re si
    do8. do,16 do8

    %37
    mi sol r
    dod, mi r
    la, sol' mi

    %40
    fa8. mi16 re8
    la'16 la la la la la
    sib,! sib sib sib sib sib

    %43
    sib'! sib sib sib sib sib
    dod, dod dod dod dod dod
    dod' dod dod dod dod dod\mbreak

    %46
    re8 re, re'
    fa, mi4\tr
    re8 fa sib

    %49
    mi, la r
    re, sol re
    do fa r

    %52
    sib, mi sib
    la re r
    dod16 la dod mi la r

    %55
    re, la re fa la r
    sold si,? mi sold si r
    la do, mi la do r\mbreak

    %58
    la8 si sold
    la sol?4~
    sol8 la fad

    %61
    sol re r
    sib'? sol r
    re sol re

    %64
    sib8. la16 sol8
    fad'8 re r
    la' fad r

    %67
    la re la
    sib8. la16 sol8
    sol16 sib, re sol sib r

    %70
    la la, re fad la r\mbreak
    sib sib, re sol sib r
    fa la, do fa la r

    %73
    re, sib re fa sib r
    re,8 mib do
    sib fa r

    %76
    re' sib r
    fa' sib fa
    re8. do16 sib8

    %79
    la fa r
    do' la r
    mib' la mib

    %82
    re8. do16 sib8
    sib re sol
    do, fa r

    %85
    sib, mib sib
    la re r\mbreak
    sol, do sol

    %88
    fa sib r
    mib do4
    sib16 fa' fa fa fa fa

    %91
    sol, sol sol sol sol sol
    sol' sol sol sol sol sol
    la, la la la la la

    %94
    la' la la la la la
    sib8 sib, sib'
    re, do4\tr

    %97
    sib4 r8
    fa'8 do r
    la' fa r

    %100
    do fa do
    la8. sol16 fa8
    mi' do r\mbreak

    %103
    sol' mi r
    sol do sol
    la8. sol16 fa8

    %106
    fa la re
    sol, do r
    fa, sib fa

    %109
    mi la r
    re, sol re
    do16 la do fa la r

    %112
    fa8 sol mi
    fa16 do' do do do do
    re, re re re re re

    %115
    re' re re re re re
    mi, mi mi mi mi mi
    sib' sib sib sib sib sib

    %118
    la8 sib sol
    fa4.\fermata

}

IvlIIn = \relative do'' {

    do8 la r
    fa' do r
    la do la

    %4
    fa4 fa8
    sol mi r
    mi' do r

    %7
    mi sol mi
    fa4 fa8
    do fa r

    %10
    la, re r
    re4 re8
    do4 do8

    %13
    do16 do do do do do
    fa, fa fa fa fa fa
    re' re re re re re

    %16
    sol, sol sol sol sol sol\mbreak
    sol' sol sol sol sol sol
    sol8 mi sol

    %19
    do, si4\tr
    do r8
    r re sol

    %22
    mi la r
    r si, mi
    do fa r

    %25
    re16 re, sol si re r
    mi mi, sol do mi r
    re re, sol si re r

    %28
    do8 re si
    do sol r
    mi' do r\mbreak

    %31
    mi sol mi
    sol4 sol,8
    si sol r

    %34
    re' si r
    sol' si sol
    sol4 sol8

    %37
    sib,! mi r
    la, dod r
    dod mi dod

    %40
    re4 la8
    fa'16 fa fa fa fa fa
    sol, sol sol sol sol sol

    %43
    sol' sol sol sol sol sol
    mi mi mi mi mi mi
    mi mi mi mi mi mi\mbreak

    %46
    fa8 la, fa'
    re dod4
    re r8

    %49
    r mi la
    fa sib r
    r do, fa

    %52
    re sol r
    r la, re
    mi16 mi, la dod mi r

    %55
    fa fa, la re fa r
    mi sold, si mi sold r
    mi la, do mi la r\mbreak %% fine p.2

    %58
    do,8 re si
    la re mi
    la,4 la8

    %61
    sib? sib r
    re sib r
    sib re sib

    %64
    sol4 re'8
    re la r
    fad' re r

    %67
    fad la fad
    sol4 re8
    re16 sol, sib re sol r

    %70
    fad fad, la re fad r
    sol sol, sib re sol r
    do, fa, la do fa r

    %73
    sib, fa sib re fa r
    sib,8 do la
    fa re r

    %76
    sib' fa r
    re' fa re
    sib4 fa8

    %79
    fa do r
    la' fa r
    do' mib do

    %82
    sib4 fa8
    R4.
    r8 do' fa

    %85
    re sol r
    r la, re\mbreak
    sib mib r

    %88
    r fa, sib
    sib la4
    re16 re re re re re

    %91
    sib sib sib sib sib sib
    \once\set suggestAccidentals = ##t mib? mib mib mib mib mib
    do do do do do do

    %94
    fa fa fa fa fa fa
    re re re re re re
    sib8 la4

    %97
    sib r8
    do la r
    fa' do r

    %100
    la do la
    fa4 do'8
    do sol r\mbreak

    %103
    mi' do r
    mi sol mi
    fa4 do8

    %106
    R4.
    r8 sol' do
    la re r

    %109
    r mi, la
    fa sib r
    la,16 fa la do fa r

    %112
    la,8 sib sol
    la16 la' la la la la
    fa fa fa fa fa fa

    %115
    sib sib sib sib sib sib
    sol sol sol sol sol sol
    sol sol sol sol sol sol

    %118
    fa8 sol mi
    fa4.\fermata

}

Ivlan = \relative do' {

    la'8 fa r
    do' la r
    fa la fa

    %4
    do4 do8
    do sol r
    do' sol r

    %7
    do mi do
    do4 do8
    la do r

    %10
    fa, la r
    si4 si8
    sol4 sol8

    %13
    mi16 mi mi mi  mi mi
    re re re re re re
    fa fa fa fa fa fa

    %16
    re re re re re re\mbreak
    re re re re re re
    mi8 mi16 fa sol mi

    %19
    sol8 sol sol
    mi sol do
    la re, si'

    %22
    sol do, la'
    fa si, sol'
    mi la, fa'

    %25
    si,4 sol'8
    sol4 sol8
    sol4 sol8

    %28
    sol la sol
    sol mi r
    do' sol r\mbreak

    %31
    mi4 mi8
    do4 mi8
    re re r

    %34
    si' sol r
    re sol re
    mi4 mi8

    %37
    mi sib'! r
    mi, la r
    mi dod' dod

    %40
    la4 la8
    re,16 re re re re re
    re re re re re re

    %43
    re re re re sol sol
    mi mi mi mi mi mi
    mi mi mi mi la la\mbreak

    %46
    la8 fa la
    la la4
    fa8 re' fa,

    %49
    sol do r
    fa, sib sol
    mi la r

    %52
    re, sol mi
    dod fa r
    mi4 mi8

    %55
    la4 la8
    si4 si8
    do4 do8\mbreak

    %58
    mi, fa mi
    do sol' la
    la re,4

    %61
    re8 sol, r
    sol' re r
    sol sib sol

    %64
    re4 sib'8
    la fad r
    re' la r

    %67
    re, fad re
    re4 sib8
    re4 re8

    %70
    re4 re8\mbreak
    re4 re8
    fa4 fa8

    %73
    fa4 fa8
    fa sol fa
    re sib r

    %76
    fa' re r
    sib' re sib
    fa4 re8

    %79
    do la r
    fa' do r
    la' do la

    %82
    fa4 re8
    re sol sib
    \once\set suggestAccidentals = ##t mib,? la r

    %85
    fa sib sol
    \once\set suggestAccidentals = ##t mib? la r\mbreak
    mib sol mib

    %88
    do fa r
    sol do, fa
    fa16 fa fa fa fa fa

    %91
    mib mib mib mib mib mib
    do' do do do do do
    fa, fa fa fa fa fa

    %94
    re' re re re re re
    fa, fa fa fa fa fa
    fa8 fa4

    %97
    re r8
    la' fa r
    do' la r

    %100
    fa la fa
    do4 la'8
    sol mi r\mbreak

    %103
    do' sol r
    do mi do
    do4 la8

    %106
    la re fa,
    re sol r
    do, fa re

    %109
    sib mi r
    la, re sib
    do fa fa

    %112
    do re do
    do16 do do do do do
    sib sib sib sib sib sib

    %115
    sol' sol sol sol sol sol
    do, do do do do do
    mi mi mi mi mi mi

    %118
    do8 re do
    la4. \fermata

}


Ibcn = \relative do {

    fa8 fa16 sol la sol
    fa8 fa16 sol la sol
    fa8 fa16 sol la sol

    %4
    fa8 fa16 sol la fa
    do8 do16 re mi re
    do8 do16 re mi re

    %7
    do8 do16 re mi do
    fa8 fa16 sol la sol
    fa8 fa16 sol la sol

    %10
    fa8 fa16 sol la fa
    sol8 sol16 la si sol
    do,8 do16 re mi re

    %13
    mi mi mi mi mi mi
    fa fa fa fa fa fa
    fa fa fa fa fa fa

    %16
    sol sol sol sol sol sol\mbreak
    sol sol sol sol sol sol
    mi8 do16 re mi re

    %19
    do8 sol' sol,
    do do'4~
    do8 si16 la si8~

    %22
    si la16 sol la8~
    la sol16 fa sol8~
    sol fa16 mi fa8

    %25
    sol sol, sol'
    sol sol, sol'
    sol sol, sol'

    %28
    do, fa sol
    do, do16 re mi re
    do8 do16 re mi re\mbreak

    %31
    do8 do16 re mi re
    do8 do16 re mi do
    sol'8 sol,16 la si la

    %34
    sol8 sol16 la si la
    sol8 sol16 la si la
    do8 do16 re mi do

    %37
    sol'8 sol16 la sib! sol
    la,8 la16 sib dod sib
    la8 la16 sib dod la

    %40
    re8 re16 mi fa mi
    re re re re re re
    sol, sol sol sol sol sol

    %43
    sol sol sol sol sol sol
    la la la la la la
    la la la la la la\mbreak

    %46
    re re re re re re
    re8 la' la,
    re re'4~

    %49
    re8 do4~
    do8 sib4~
    sib8 la4~

    %52
    la8 sol4~
    sol8 fa4
    la,8 la' la,

    %55
    la la' la,
    mi' mi' mi,
    do do' do,\mbreak

    %58
    la' re, mi
    la, sib'? dod,
    re4 re,8

    %61
    sol sol'16 la sib la
    sol8 sol16 la sib la
    sol8 sol16 la sib la

    %64
    sol8 sol16 la sib sol
    re8 re16 mi fad mi
    re8 re16 mi fad mi

    %67
    re8 re16 mi fad re
    sol8 sol16 la sib la
    sol8 sol, sol'

    %70
    re' re, re'\mbreak
    sol, sol, sol'
    la la, la'

    %73
    sib sib, sib'
    sib, mib fa
    sib, sib16 do re do

    %76
    sib8 sib16 do re do
    sib8 sib16 do re do
    sib8 sib16 do re sib

    %79
    fa'8 fa16 sol la sol
    fa8 fa16 sol la sol
    fa8 fa16 sol la fa

    %82
    sib,8 sib16 do re do
    sib8 sib'4~
    sib8 la4~

    %85
    la8 sol4~
    sol8 fa4~\mbreak
    fa8 mib4~

    %88
    mib8 re sib
    sol' fa fa,
    sib16 sib sib sib sib sib

    %91
    mib mib mib mib mib mib
    \once\set suggestAccidentals = ##t mib? mib mib mib mib mib
    fa fa fa fa fa fa

    %94
    fa fa fa fa fa fa
    sib, sib sib sib sib sib
    sib8 fa' fa,

    %97
    sib4 r8
    fa8 fa'16 sol la sol
    fa8 fa16 sol la sol

    %100
    fa8 fa16 sol la sol
    fa8 fa16 sol la fa
    do8 do16 re mi re\mbreak

    %103
    do8 do16 re mi re
    do8 do16 re mi do
    fa8 fa16 sol la sol

    %106
    fa8 fa'4~
    fa8 mi4~
    mi8 re4~

    %109
    re8 do4~
    do8 sib4
    fa8 fa fa

    %112
    fa sib, do
    fa16 fa fa fa fa fa
    sib, sib sib sib sib sib

    %115
    sib sib sib sib sib sib
    do do do do do do
    do do do do do do

    %118
    fa8 sib, do
    fa,4.\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*14
    <6>4.
    <_!>
    s4.*3
    s8 <6>4
    <6 2>8 <6>4
    <6 2>8 <6>4
    <6 2>8 <6>4
    <6 2>8 <6>4
    <_!>4.
    <6 4>
    <3!>
    s4.*5
    <_!>4.
    s4.*3
    <_->4.
    <_+>
    s4.*5
    <_+>4.
    s4.*3
    s8 <6->4
    <6 4 2>8 <6>4
    <6 4>8 <6>4
    <6 4>8 <6>4
    <6 4>8 <6>4
    <6 4+>8 <6>4
    <_+>4.
    <6 4>
    <_+>
    s
    s4 <_+>8 s <6> <6 5>
    <5 4>4 <3+>8
    s4.*4
    <_+>4.
    s4.*4
    <_+>4.
    s
    <6>
    <5>
    s4.*7
    <7->4.
    s
    s8 <6>4
    <6 4>8 <3>4
    <6 4>8 <[6-]>4
    <[6-] 4>8 <6>4
    <6 4>8 <6>4
    <6 4>4.
    s
    s
    <5>
    <6>
    <5>
    <6>
    s4.*11
    s8 <6>4
    <6 4>8 <6>4
    s4.*7
    <6>4.
    <5>

}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4. = 60
    s4.*119
    \bar"||"

}



IvlI = {
    \global
    %\notypeset
    <<\IvlIn \forma>>

}

IvlII = {
    \global
    <<\IvlIIn \forma>>

}


Ivla = {
    \global
    \clef alto
    <<\Ivlan \forma>>

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

IIvlIn = \relative do'' {

    fa8[la16 sib do8 do,] fa4 r8 fa
    sol, sol' mi, sib'' la fa, r sol'
    fa la \once\stemUp re,, fa' mi8 do, r sol''
    do do, r do' \once\stemUp la, do' \once\stemUp sol, si'
    do4 r8 sol do do, r do'
    \once\stemUp la, do' \once\stemUp sol, si' do,[mi16 fa sol8 sol,]
    do4 r8 do re, re' si, fa''
    mi do, r mi'\mbreak dod mi \once\stemUp la,, sol''
    fa re, r la'' re re, r re'
    \once\stemUp sib, re' \once\stemUp la, dod' re,[fa16 sol la8 la,]
    re4 r8 re mi, mi' dod, sol''
    fa re, r fa' sold, si mi, si''do la, r mi' la la, r la'
    \once\stemUp fa, la' \once\stemUp mi, sold' la,[do16 re mi8 mi,]
    la4 r8 la' si, si' sold, re''\mbreak
    do la, r la' re, fa \once\stemUp si,, sol''
    mi do, r sol'' mi sol \once\stemUp mi, sib''?
    la fa r4 fa8[la16 sib do8 do,]
    fa4 r8 fa sol, sol' mi, sib''
    la fa,r do' fa fa, r fa'
    re, fa' do, mi' fa4 r8 do
    fa fa,r fa' re, fa' do, mi'
    fa1\fermata

}

IIvlan = \relative do' {

    la'4 sol fa do
    re mi do do
    re re sol re

    %4
    do sol' la sol
    sol re do sol'
    la sol mi re

    %7
    do sol la si
    sol sib'!\mbreak mi, mi
    la la sol la

    %10
    sib mi, fa mi
    re la sib la
    la' fa si, si

    %13
    mi si la mi'
    fa si, do si
    la mi' fa si,\mbreak

    %16
    mi mi re re
    sol, re' sol do,
    do la la' sol

    %19
    fa do re do
    do do re do
    re mi do do

    %22
    re do re mi
    do1\fermata

}


IIbcn = \relative do {

    fa4 mi re la
    sib do fa mi
    re si' do si

    %4
    la mi fa sol
    do si la mi
    fa sol do si

    %7
    la mi fa sol
    do, sol'\mbreak la dod
    re do? sib! fa

    %10
    sol la re do
    sib fa sol la
    re re,  mi sold

    %13
    la sol! fa do
    re mi la sol
    fa do re mi\mbreak

    %16
    la do, si sol
    do si' do do,
    fa fa, fa' mi

    %19
    re la sib do
    fa mi re la
    sib do fa mi

    %22
    re la sib do
    fa,1\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6 5>4 <7 3> s2
    s4 <6 5> s2
    s <6 5>
    s1
    <6 5>
    s2 s4 <7 _!>
    s <_-> s2
    s1
    <6 5 _->4 <_+> s2
    s <6 5>4 <_+>
    s2 <_+>
    s1
    <6! 5>4 <_+> s2
    s <6! 5>4 <_+>
    s2 s4 <7>
    s2 s4 <7>
    s1
    s2 <6 5>4 <7 3>
    s1
    <6 5>
    s2 <6 5>

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 30
    s1*23
    \bar"||"

}



IIvlI = {
    \global
    %\notypeset
    <<\IIvlIn \forma>>

}

IIvla = {
    \global
    \clef alto
    <<\IIvlan \forma>>

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

    fa8 sol4
    la8 sol fa
    do'16 sib la8 sol

    %4
    fa4 r8
    fa,\p sol4
    la8 sol fa

    %7
    sol'16 la sib8 la
    sol4 r8
    sol,\f sol4

    %10
    do8 si16 la sol8
    sol sol4
    do8 si16 la sol8

    %13
    mi' fa re
    mi16 fa sol8 do,
    mi fa re

    %16
    do4.\mbreak
    do8 re4
    mi8 re do

    %19
    mi16 fa sol8 mi
    fa4 r8
    la, la4

    %22
    re8 do16 sib la8
    la la4
    re8 do16 sib la8

    %25
    fa' sol mi
    fa, sol mi
    fa' sol mi

    %28
    re4 r8
    fa sol4
    la8 sol fa

    %31
    do'16 sib la8 sol\mbreak
    fa do fa,
    fa' fa,4

    %34
    fa16 sol la8 la
    fa' fa,4
    fa16 sol la8 la

    %37
    la' sib sol
    fa do la
    la' sib sol

    %40
    fa4.\fermata

}

IIIvlIIn = \relative do'' {

    fa8 mi4
    fa4 do8
    la'16 sol fa8 mi

    %4
    fa4 r8
    fa,\p mi4
    fa do8

    %7
    mi'16 fa sol8 fa
    mi4 r8
    mi,\f mi4

    %10
    sol8. fa16 mi8
    mi mi4
    sol8. fa16 mi8

    %13
    do' re si
    do16 re mi8 sol,
    do8 re si

    %16
    do4.\mbreak
    do8 si4
    do sol8

    %19
    dod16 re mi8 dod
    re4 r8
    fa, fa4

    %22
    la8. sol16 fa8
    fa fa4
    la8. sol16 fa8

    %25
    re' mi dod
    re, mi dod
    re' mi dod

    %28
    re4 r8
    fa mi4
    fa do8

    %31
    la'16 sol fa8 mi\mbreak
    fa8 la,4
    la8 do,4

    %34
    do8 fa fa
    la do,4
    do8 fa fa

    %37
    fa'sol mi
    do la fa
    fa' sol mi

    %40
    fa4.\fermata

}

IIIvlan = \relative do' {

    la'8 sol mi
    do4 la'8
    la do4

    %4
    la r8
    la,\p sol mi
    do4 la'8

    %7
    do4 do8
    do4 r8
    do\f do4

    %10
    mi mi8
    do do4
    mi mi8

    %13
    sol la sol
    sol4.
    sol8 la sol

    %16
    mi4.\mbreak
    mi8 re si
    sol4 mi'8

    %19
    mi4 la8
    la4 r8
    re, re4

    %22
    fa fa8
    re re4
    fa fa8

    %25
    la sib la
    la, sib la
    la' sib la

    %28
    la4 r8
    la sol mi
    do4 la'8

    %31
    la do4\mbreak
    do8 do,4
    do8 la4

    %34
    la do8
    do la4
    la do8

    %37
    do re do
    la4 do8
    do re do

    %40
    la4.\fermata

}


IIIbcn = \relative do {

    fa8 do4
    fa4.
    fa8 do' do,

    %4
    fa4 r8
    fa do4
    fa4.

    %7
    do4 fa8
    do do16 re mi re
    do8\f do16 re mi re

    %10
    do8 do16 re mi re
    do8 do16 re mi re
    do8 do16 re mi re

    %13
    do8 fa sol
    do,4.
    do8 fa sol

    %16
    do,4.\mbreak
    do8 sol4
    do4.

    %19
    la'8 la,4
    re8 re16 mi fa mi
    re8 re16 mi fa mi

    %22
    re8 re16 mi fa mi
    re8 re16 mi fa mi
    re8 re16 mi fa mi

    %25
    re8 sol, la
    re sol, la
    re sol, la
    re,4 r8

    %29
    fa' do4
    fa r8
    fa do' do,\mbreak

    %32
    fa8 fa16 sol la sol
    fa8 fa16 sol la sol
    fa8 fa16 sol la sol

    %35
    fa8 fa16 sol la sol
    fa8 fa16 sol la sol
    fa8 sib, do

    %38
    fa fa16 sol la sol
    fa8 sib, do
    fa,4.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*2
    s8 <6 4> <5 3>
    s4.*13
    s8 <_!>4
    s4.
    <_+>8 <7>4
    s4.*11
    s8 <6 4> <5 3>

}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4. = 60
    s4.*16
    \bar":..:"\break
    s4.*24
    \bar":|."

}



IIIvlI = {
    \global
    %\notypeset
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}


IIIvla = {
    \global
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
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

    mi8
    dod mi si mi la, la' r mi
    fad16 sold mi fad re  mi dod re si8 la sold mi'
    mi4 mi mi16 la, dod mi la8 dod,

    %4
    re16 mi dod re si dod la si sold8 fad mi mi'
    fad la r fad\mbreak mi la r mi
    re la' r re, dod16 la dod mi la4

    %7
    r16 la, re fad la4 r16 la, dod mi la4
    r16 la, re fad la4 r8 la mi[re16 dod]
    si8 mi r mi\mbreak r mi r mi

    %10
    r16 mi re dod si re dod si dod mi re dod si re dod si
    dod la' la mi mi la la mi re sold sold re re sold sold re
    dod la' la dod, dod la' la dod, si4 r\mbreak

    %13
    fad'2 sold4 la~
    la sold lad si~
    si la? sold dod~

    %16
    dod si2 la4~
    la sold la r8 mi\mbreak
    dod mi si mi la, la' r mi

    %19
    mi4 mi mi16 la, dod mi la8 fad
    re fad dod fad si, si' r fad
    fad4 fad fad16 si, re fad si8 sold

    %22
    mi sold red sold dod, dod' r sold\mbreak
    sold4 sold sold16 dod, mi sold dod8 sold
    la dod r la sold dod r sold

    %25
    fad dod' r fad, mi sold r sold
    r sold r sold r16 sold fad mi red fad mi red\mbreak  % OOKK fine p. 3
    mi sold fad mi red fad mi red mi4 sold~

    %28
    sold fad2 mi4
    red2 dod4 r8 sold'
    mi8 sold red sold dod, dod' r sold

    %31
    sold4 sold sold16 dod, mi sold dod8 dod,\mbreak
    la dod sold dod la16 fad la dod fad8 dod'
    dod4 dod dod r

    %34
    re,2mid4 fad~\mbreak
    fad mi?2 re4
    dod2 si4 r8 fad'

    %37
    re fad dod fad si, si' r fad
    fad4 fad fad16 si, re fad si8 mi,
    dod mi si mi la, la' r mi

    %40
    mi4 mi\mbreak mi16 la, dod mi la8 mi
    fad16 sold mi fad re mi dod re si8 la sold mi'
    dod la r4 fad'2

    %43
    sold4 la2 sold4
    lad si2 la?4
    sold! dod2 si4~

    %46
    si la2 sold4
    la16 la la mi mi la la mi re sold sold re re sold sold re
    dod la' la dod, dod la' la dod, si4 r

    %49
    fad'2 sold4 la~\mbreak
    la sold la2\fermata

}

IVvlIIn = \relative do'' {

    mi8
    mi4 mi mi16 la, dod mi la8 dod,
    re16 mi dod re si dod la si sold8 fad mi mi'
    dod mi si mi la, la' r8 mi

    %4
    fad16 sold mi fad re mi dod re si8 la sold4
    r16 la re fad la4\mbreak r16 la, dod mi la4
    r16 la, re fad la4 r r8 mi

    %7
    fad la r fad mi la r mi
    re la' r re, dod [mi dod si16 la]
    sold mi' re dod si re dod si\mbreak dod16 mi re dod si re dod si

    %10
    dod8 mi r mi r mi r mi
    r16 mi mi dod dod mi mi dod si re re si si re re si
    la dod dod la la dod dod la sold4 mi'~\mbreak

    %13
    mi re2 dod4
    red mi2 red4
    mid fad2 mi?4

    %16
    re?2 dod
    si dod4 r8 mi\mbreak
    mi4 mi mi16 la, dod mi la8 mi

    %19
    dod mi si mi la, la' r fad
    fad4 fad fad16 si, re fad si8 fad
    re fad dod fad si, si' r sold

    %22
    sold4 sold sold16 dod, mi sold dod8 sold
    mi sold red sold dod, dod' r4
    r16 dod, fad la dod4 r16 dod, mi sold dod4

    %25
    r16 dod, fad la dod4 r16  sold fad mi red fad mi red
    mi sold fad mi red fad mi red mi8 sold r sold\mbreak
    r sold r sold r sold r4

    %28
    la2 sid,4 dod~
    dod sid dod r8 sold'
    sold4 sold sold16 dod, mi sold dod8 sold

    %31
    mi sold red sold dod, dod' r dod\mbreak
    dod4 dod dod r8 dod,
    la dod sold dod la4 dod~

    %34
    dod si2 la4\mbreak
    sold2 lad4 si~
    si lad si r8 fad'

    %37
    fad4 fad fad16 si, re fad si8 fad
    re fad dod fad si, si' r mi,
    mi4 mi mi16 la, dod mi la8 mi

    %40
    dod mi si mi\mbreak la, la' r dod,
    re16 mi dod re si dod la si sold8 fad mi[si']
    la mi mi'2 re4~

    %43
    re dod red mi~
    mi red mid fad~
    fad mi?\mbreak re?2

    %46
    dod si
    dod16 mi mi dod dod mi mi dod si re re si si re re si
    la dod dod la la dod dod la sold4 mi'~

    %49
    mi re2 dod4\mbreak
    si2 dod\fermata

}

IVvlan = \relative do' {

    dod'8
    la dod sold si dod, re mi la
    la dod fad, fad si,4. si'8
    la dod sold si dod, re mi la

    %4
    la dod fad, fad si,4 si8 dod
    la fad' fad re\mbreak la' mi mi dod
    re fad fad re mi la mi dod

    %7
    la fad' fad re la' mi mi dod
    re fad fad re mi dod' mi, fad
    sold16 dod si la sold si la sold\mbreak la dod si la sold si la sold

    %10
    la dod si la sold si la sold la dod si la sold si la sold
    la8 sold la dod sold fad sold mi
    mi4. mi8 mi sold la dod\mbreak

    %13
    la sold la fad si, sold' mi dod'
    fad, si si sold dod, lad' fad si
    sold mid dod la'? si sold la dod

    %16
    la fad si sold mi4. mi8
    mi4. mi8 dod re mi \parenthesize si\mbreak
    la' dod sold si dod dod, mi dod

    %19
    la' dod sold si dod dod, mi dod'
    si re lad dod re, mi fad dod
    si re' lad dod re, mi fad red

    %22
    dod mi sid red mi fad sold sid,\mbreak
    dod dod' sid \once\set suggestAccidentals = ##t red mi, fad sold mi
    dod la' la dod, dod sold' sold dod,

    %25
    dod fad fad sid, sold r sold' r
    sold r sold r sold r sold r\mbreak
    sold r sold r sold fad sold mi

    %28
    dod sid dod la' red,4  mi
    la sold sold8 fad sold red
    dod mi sid red mi fad sold red

    %31
    dod mi sid red mi fad sold mi\mbreak
    fad la mid sold la si dod sold
    fad la mid sold fad4. la8

    %34
    fad mid fad si sold mid dod la'\mbreak
    si,4. mi8 dod4 re
    sold fad fad8 mi fad dod

    %37
    si re lad dod re mi fad dod
    si re lad dod re mi fad si
    la? dod sold si dod re mi si

    %40
    la dod sold si\mbreak dod, re mi la
    la dod fad, fad si,4 si8 sold'
    mi mi la dod la sold la fad

    %43
    si, sold' mi dod' fad, si si sold
    dod, lad' fad si sold mid dod la'
    si sold! la dod\mbreak la fad si sold

    %46
    mi4. mi8 mi4. mi8
    mi re mi dod sold' fad sold mi
    mi4. mi8 mi sold la dod

    %49
    la sold la fad si, sold' mi mi\mbreak
    mi fad mi mi mi2\fermata

}


IVbcn = \relative do {

    la'8
    la, la' sold sold, la si dod la
    re la' re, red mi fad sold mi
    la, la' sold sold, la si dod la

    %4
    re la' re, red mi fad sold la
    re, re' re re,\mbreak dod dod' dod dod,
    si si' si si, la la' dod la

    %7
    re, re' re re, dod dod' dod dod,
    si si' si si, la la' la, re
    mi la, mi' [mi,]\mbreak la' la, mi' [mi,]

    %10
    la' la, mi' [mi,] la' la, mi' [mi,]
    la' si dod la si la si sold
    la sold la la, mi' re dod la\mbreak

    %13
    re mi fad re mi mi' la, la,
    si si' mi mi, fad fad, si' si,
    dod dod' fad, fad, mi' mi' la, la,

    %16
    fad' re sold mi la sold la la,
    mi' re mi mi, la' si dod sold\mbreak
    la, la' sold sold, la la' dod la

    %19
    la, la' sold sold, la si dod lad
    si si' lad lad, si dod re lad
    si si' lad lad,? si dod re sid

    %22
    dod dod' sid sid, dod red mi red\mbreak
    dod dod' sid sid, dod red mi dod
    fad, fad' fad fad, mi mi' mi mi,

    %25
    red red' red red,   dod dod' sold'[sid,]
    dod dod' sid [sid,] dod dod' sid[sid,]\mbreak
    dod dod' sid[sid,] dod red mi dod

    %28
    fad sold la fad sold sold, dod dod'
    fad, fad, sold' sold, dod red mi sid
    dod dod' sid sid, dod red mi sid

    %31
    dod dod' sid sid, dod red mi dod\mbreak
    fad, fad' mid mid, fad sold la mid
    fad fad' mid mid, fad' sold la fad

    %34
    si dod re si dod dod, fad[fad,]\mbreak
    mi'? re mi mi, fad' fad, si' si,
    mi mi, fad' fad, si dod re lad

    %37
    si si' lad lad, si dod re lad
    si si' lad lad, si dod re sold,
    la? la' sold sold, la si dod sold

    %40
    la la' sold sold,\mbreak  la si dod la
    re la' re, red mi fad sold mi
    la, la dod la re mi fad re

    %43
    mi mi' la, la, si si' mi mi,
    fad fad, si' si, dod dod' fad, fad,
    mi' mi' la, la,\mbreak fad' re sold mi

    %46
    la sold la la, mi' re mi mi,
    la' si dod la si la si sold
    la sold la la, mi' re dod la

    %49
    re mi fad re mi mi, la' [la,]\mbreak
    mi' re mi mi, la2\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1
    s4 s8 <7 5> s2
    s1
    s4 s8 <7 5> s2
    s1*8
    <9>4 s8 <8> <7>2
    <7 3+> <7 3+>4 <3+>
    <7 3+>2 <9>
    <6 5>4 <6 5> <9> <8>
    <5 4> <3> s2
    s1*10
    <9>4 s8 <8> <7 3+>2
    <6+ 5>1
    s1*4
    <9>4 s8 <8> <7 3+>2
    <9>4 <8> <7 3+>2
    <6 5>4 <3+> s2
    s1*4
    s4 s8 <7 5> s2
    s <9>4 s8 <8>
    <7>2 <7 3+>
    <7 3+>4 <3+> <7 3+>2
    <9>4 <3> <6 5>8 <7> <6 5>4
    <9> <8> <5 4> <3>
    s1*2
    <9>4 <9> <7> s
    <5 4> <3>

}

forma = {

    \time 4/4
    \key la\major
    \tempo 2 = 60
    \partial 8 s8
    s1*50
    \bar"||"

}



IVvlI = {
    \global
    %\notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}


IVvla = {
    \global
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>
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

VvlIn = \relative do'' {

    R1
    dod8. [dod16 dod8. dod16] dod8. [dod16 dod8. dod16]
    si'1

    %4
    la
    la8.[la16 la8. la16] sold8.[sold16 fad8. fad16]
    mi8.[mi16 mi8. mi16]\mbreak mi8.[mi16 mi8. mi16]

    %7
    fad,8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    mi'1
    red

    %10
    mi8.[mi16 mi8. mi16] mi8.[mi16 mi8. mi16]
    mid8.[mid16 mid8. mid16] mid8.[mid16 mid8. mid16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]

    %13
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    mi?8.[dod16 dod8. dod16] dod8. [dod16 dod8. dod16]
    si'1

    %16
    la8.[fad,16 fad8. fad16] fad8.[fad16 fad8. fad16]
    sol'2~sol4 fad
    mid8.[mid16 mid8. mid16] fad8.[fad16 fad8. fad16]

    %19
    fad8.[fad16 fad8. fad16] mid8.[mid16 mid8. mid16]
    \footnote #' (-1 . 3) \markup\column\smaller {"Nota di G. F. Malipiero: «... battuta mancante nel manoscritto... erroneamente tagliata dal rilegatore»""  "}  \parenthesize fad1\fermata

}

VvlIIn = \relative do'' {

    fad,8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    mid'1~
    mid

    %4
    dod2~dod4 fad
    red8.[red16 red8. red16] red8.[red16 red8. red16]
    dod8. [dod16 dod8. dod16]\mbreak dod8. [dod16 dod8. dod16]

    %7
    dod1
    dod8. [dod16 dod8. dod16] dod8. [dod16 dod8. dod16]
    si8.[si16 si8. si16] si8.[si16 si8. si16]

    %10
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    lad8.[lad16 lad8. lad16]\mbreak lad8.[lad16 lad8. lad16]

    %13
    sold8.[sold16 sold8. sold16] sold8.[sold16 sold8. sold16]
    sold4 r r2
    mid'8.[mid16 mid8. mid16] mid8.[mid16 mid8. mid16]

    %16
    dod4 r r2
    re?8.[re16 re8. re16] re8.[re16 re8. re16]
    dod8. [dod16 dod8. dod16] dod8. [dod16 dod8. dod16]

    %19
    re8.[re16 re8. re16] dod8. [dod16 dod8. dod16]
    \parenthesize dod1\fermata

}

Vvlan = \relative do' {

    R1*3
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    sid1

    %6
    sold8.[sold16 sold8. sold16] sold8.[sold16 sold8. sold16]
    fad1
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]

    %9
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]
    sol?8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]

    %12
    dod,8. [dod16 dod8. dod16] dod8. [dod16 dod8. dod16]
    red8.[red16 red8. red16] red8.[red16 red8. red16]
    dod4 r r2

    %15
    sold'8.[sold16 sold8. sold16] sold8.[sold16 sold8. sold16]
    fad4 r r2
    si8.[si16 si8. si16] si8.[si16 si8. si16]

    %18
    sold8.[sold16 sold8. sold16] la8.[la16 la8. la16]
    sold8.[sold16 sold8. sold16] sold8.[sold16 sold8. sold16]
    la1\fermata

}


Vbcn = \relative do {

    R1*2
    dod8. [dod16 dod8. dod16] dod8. [dod16 dod8. dod16]
    fad1

    %5
    sold8.[sold16 sold8. sold16] sold8.[sold16 sold8. sold16]
    dod,8. [dod16 dod8. dod16]\mbreak dod8. [dod16 dod8. dod16]
    lad1

    %8
    lad?8.[lad16 lad8. lad16]\mbreak lad8.[lad16 lad8. lad16]
    la!8.[la16 la8. la16] la8.[la16 la8. la16]
    sol8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]

    %11
    sol?8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16] \mbreak fad'8.[fad16 fad8. fad16]
    sid,8.[sid16 sid8. sid16] sid8.[sid16 sid8. sid16]

    %14
    dod4 r r2
    dod8. [dod16 dod8. dod16] dod8. [dod16 dod8. dod16]
    fad4 r r2

    %17
    si,8.[si16 si8. si16] si8.[si16 si8. si16]
    si8.[si16 si8. si16] la8.[la16 la8. la16]
    si8.[si16 si8. si16] dod8. [dod16 dod8. dod16]

    %20
    \parenthesize fad,1\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    <7 3+>1
    s
    <9 5+ 3+>2 <8>4 <7>
    s1
    <6>
    <6 5>
    <6 4+>
    s
    <6+>
    <_+>
    <6 5>
    s
    <7 3+>
    s
    <6! 3>
    <6 4+ 2>2 <6>
    <6 5> <3+>

}

forma = {

    \time 4/4
    \key la\major
    \tempo 2 = 45
    s1*20
    \bar"||"

}



VvlI = {
    \global
    %\notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}


Vvla = {
    \global
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>
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

VIvlIn = \relative do'' {

    r8
    R2*3
    r4 r8 mi
    si' mi,4 sold8

    %6
    fad si,4 fad'8
    sold si4 la16 sold
    fad8 red si si'\mbreak

    %9
    si[si si si]
    si[la16 sold la8 la]
    red, [la' si, la']

    %12
    la sold16 fad sold8 sold
    si sold4 si8
    la fad4 la8\mbreak

    %15
    si sold4 si8
    la la4 mi8
    la[la la la]

    %18
    la [sol16 fad sol8 sol]
    dod,[sol' la, sol']
    sol? fad16 mi fad8 fad

    %21
    mi fad4 fad8
    mi fad4 mi8
    fad[mi re dod]

    %24
    si mi4 mi8\mbreak
    mi mi4 mi8
    mi16 si dod re mi re dod si

    %27
    dod la dod re mi dod si la
    sold8[mi' mi re16 dod]
    re8[re re dod16 si]

    %30
    dod8[dod dod si16 la]
    si8[si si la16 sold]
    la8 la'4 sold8

    %33
    la dod,4 si8
    la4 r
    R2*3\mbreak

    %38
    r4 r8 mi'
    si' mi,4 sold8
    fad si,4 fad'8

    %41
    sold si4 la16 sold
    fad8[red si fad']
    si[si si si]

    %44
    si[la16 sold la8 la]
    red,[la' si, la']
    la[sold16 fad sold8 sold]

    %47
    fad[mi red dod]\mbreak
    sid16 red mi fad sold fad mi red
    mi dod mi fad sold mi red dod

    %50
    sid8 sold'4 sold8
    sold sold4 sold8\mbreak
    sold[sold sold fad16 mi]

    %53
    fad8[fad fad mi16 red]
    mi8[mi mi red16 dod]
    red8[red red dod16 sid]

    %56
    dod8 dod'4 sid8
    dod mi,4 red8
    dod4 r

    %59
    R2*3
    r4 r8 mi
    si' mi,4 sold8

    %64
    fad si,4 fad'8
    sold si4 la16 sold
    fad8[red si si']

    %67
    si si,4 si'8
    la si,4 la'8
    sold si,4 sold'8

    %70
    fad si,4 fad'8
    si[si si si]
    si[la16 sold la8 la]

    %73
    red,[la' si, la']
    la[sold16 fad sold8 sold]
    si sold4 si8

    %76
    la fad4 la8
    si sold4 si8
    la la4 mi8

    %79
    mi mi4 mi8
    mi mi4 mi8
    mi16 la, dod re mi dod si la

    %82
    sold si dod re mi re dod si\mbreak
    dod8[mi mi re16 dod]
    re8[re re dod16 si]

    %85
    dod8[dod dod si16 la]
    si8[si si la16 sold]
    la8 la'4 sold8

    %88
    la dod,4 si8
    la[mi'\p mi re16 dod]
    re8[re re dod16 si]

    %91
    dod8[dod dod si16 la]
    si8[si si la16 sold]
    la8 la'4 sold8

    %94
    la dod,4 si8
    la\f la'4 sold8
    la dod,4 dod8

    %97
    la2\fermata

}

VIvlIIn = \relative do'' {
   
   la8
   mi' la,4 dod8
   si mi,4 si'8
   dod mi4 re16 dod
   
   %4
   si8 sold mi si'
   sold' si,4 mi8
   red si4 red8
   
   %7
   mi sold4 fad16 mi
   red8 si fad fad'\mbreak
   fad red4 fad8
   
   %10
   mi dod4 mi8
   fad red4 fad8
   mi mi4 si8
   
   %13
   mi[mi mi mi]
   mi[re?16 dod re8 re]\mbreak
   sold, [re' mi, re']
   
   %16
   re dod16 si dod8 dod
   mi dod4 mi8
   re si4 re8
   
   %19
   mi dod4 mi8
   re re4 re8
   dod re4 re8
   
   %22
   dod re4 dod8
   re[dod si la]
   sold16 si dod re mi re dod si\mbreak
   
   %25
   dod la dod re mi dod si la
   sold8 mi'4 mi8
   mi mi4 mi8
   
   %28
   mi4 r
   R2
   r8 mi[mi re16 dod]
   
   %31
   re8[re re dod16 si]
   dod8 dod4 si8
   dod la4 sold8
   
   %34
   la4 r8 la
   mi' la,4 dod8
   si mi,4 si'8
   
   %37
   dod mi4 re16 dod\mbreak
   si8[sold mi si']
   sold'8 si,4 mi8
   
   %40
   red si4 red8
   mi sold4 fad16 mi
   red8[si fad red']
   
   %43
   fad red4 fad8
   mi dod4 mi8
   fad red4 fad8
   
   %46
   mi mi4 mi8
   red[dod sid lad]\mbreak
   sold sold'4 sold8
   
   %49
   sold sold4 sold8
   sold16 red mi fad sold fad mi red
   mi dod mi fad sold mi red dod
   
   %52
   sid4 r
   R2
   r8 sold'[sold fad16 mi]
   
   %55
   fad8[fad fad mi16 red]
   mi8 mi4 red8
   mi dod4 sid8
   
   %58
   dod4 r8 la
   mi' la,4 dod8
   si mi,4 si'8
   
   %61
   dod mi4 re16 dod\mbreak
   si8[sold mi si']
   sold' si,4 mi8
   
   %64
   red si4 red8
   mi sold4 fad16 mi
   red8[si fad fad']
   
   %67
   sold si,4 sold'8
   fad si,4 fad'8
   mi si4 mi8
   
   %70
   red si4 red8
   fad red4 fad8
   mi dod4 mi8\mbreak
   
   %73
   fad red4 fad8
   mi mi4 si8
   mi[mi mi mi]
   
   %76
   mi[re?16 dod re8 re]
   sold,[re' mi, re']
   re dod16 si dod4
   
   %79
   dod16 la dod re mi dod si la
   sold si dod re mi re dod si
   dod8 mi4 mi8
   
   %82
   mi mi4 mi8\mbreak
   mi4 r
   R2
   
   %85
   r8 mi[mi re16 dod] 
   re8[re re dod16 si]
   dod8 dod4 si8
   
   %88
   dod la4 sold8
   la4 r
   R2
   
   %91
   r8 mi'\p[mi re16 dod]
   re8[re re dod16 si]
   dod8 dod4 si8
   
   %94
   dod la4 sold8
   la\f dod4 si8
   dod la4 sold8
   
   %97
   la2\fermata

}

VIvlan = \relative do' {
   
   dod8
   dod[dod dod mi]
   sold[sold sold sold]
   mi[mi mi mi]
   
   %4
   sold[sold sold sold]
   mi[mi mi mi]
   fad[red red si']
   
   %7
   si[si si si]
   si[fad red red]\mbreak
   red red4 red8
   
   %10
   mi mi4 la8
   la red,4 red8
   si8 si4 sold'8
   
   %13
   sold sold4 sold8
   la la4 re,?8\mbreak
   re si4 sold'8
   
   %16
   mi mi4 mi8
   dod dod4 dod8
   re re4 sol8
   
   %19
   sol? mi4 dod8
   la la4 la'8
   la la4 la8
   
   %22
   la la4 la8
   la la4 la,8
   si4 sold'\mbreak
   
   %25
   la dod,8 re
   mi4 sold
   la dod,8 re
   
   %28
   mi si'4 si8
   si[si si sold]
   mi mi4 mi8
   
   %31
   fad4 sold
   mi8 mi4 mi8
   mi mi4 mi8
   
   %34
   dod4 r8 mi
   dod[dod dod mi]
   sold [sold, sold sold']
   
   %37
   mi[mi mi mi]\mbreak
   mi[mi mi sold]
   sold[sold sold si]
   
   %40
   si[red, red si']
   si[si si si]
   si[fad red si']
   
   %43
   red si4 red8
   mi mi,4 la8
   la fad4 red8
   
   %46
   si si4 si'8
   la la4 lad?8\mbreak
   sid,4 sid'
   
   %49
   dod mi,8 fad
   sold4 sid
   dod mi,8 fad
   
   %52
   sold[sid sid sid]
   red[red red dod16 sid]
   dod8 dod4 dod8
   
   %55
   la4 sid,
   sold8 sold'4 sold8
   sold sold4 sold8
   
   %58
   mi4 r8 dod
   dod[dod dod la']
   sold[sold sold sold]
   
   %61
   mi[mi mi mi]\mbreak
   sold [mi si sold']
   sold[sold sold si]
   
   %64
   si [red, red si']
   si[si si si]
   si[fad red red]
   
   %67
   mi[sold sold mi]
   fad[red red si]
   mi[sold sold mi]
   
   %70
   fad[red red si]
   red fad4 red8
   mi mi4 la8\mbreak
   
   %73
   la fad4 red8
   si si4 mi8
   sold si4 sold8
   
   %76
   la la4 re,8
   re si4 sold'8
   mi mi4 la8
   
   %79
   la4 dod,8 re
   mi4 sold
   la dod,8 re
   
   %82
   mi4 sold\mbreak
   la8[dod dod dod]
   si[si si sold]
   
   %85
   mi[mi mi mi]
   fad[fad sold sold]
   mi4 mi
   
   %88
   mi mi
   mi8[dod'\p dod dod]
   si[si si sold]
   
   %91
   mi[mi mi mi]
   fad[fad sold sold]
   mi4 mi
   
   %94
   mi mi 
   mi\f mi
   mi mi
   
   %97
   dod2\fermata
   
}


VIbcn = \relative do {
   
   r8
   la'4 la,
   mi' mi,
   la' la,
   
   %4
   mi' mi,
   mi'' mi,
   si' si,
   
   %7
   mi' mi,
   si' si,\mbreak
   si' si,
   
   %10
   dod' dod,
   si' si,
   mi mi,
   
   %13
   mi' mi,
   fad' fad,\mbreak
   mi' mi,
   
   %16
   la' la,
   la' la,
   si' si,
   
   %19
   la' la,
   re re,
   la'' la,
   
   %22
   la' la,
   re re,
   mi' mi,\mbreak
   
   %25
   la' la,
   mi' mi,
   la' la,
   
   %28
   mi' mi,
   mi' mi,
   la' la,
   
   %31
   re mi
   la, mi'
   la, mi'
   
   %34
   la,8[si dod la]
   la'4 la,
   mi' mi,
   
   %37
   la' la,\mbreak
   mi' mi,
   mi'' mi,
   
   %40
   si' si,
   mi' mi,
   si' si,
   
   %43
   si' si,
   dod' dod,
   si' si,
   
   %46
   mi mi,
   fad' fad,\mbreak
   sold' sold,
   
   %49
   dod' dod,\mbreak
   sold' sold,
   dod' dod,
   
   %52
   sold' sold,
   sold' sold,
   dod' dod,  
   
   %55
   fad sold
   dod, sold'
   dod, sold'
   
   %58
   dod, r8 la'
   la4 la,
   mi' mi,
   
   %61
   la' la,\mbreak
   mi' mi,
   mi'' mi,
   
   %64
   si' si,
   mi' mi,
   si' si,
   
   %67
   si' si,
   si' si,
   si' si,
   
   %70
   si' si,
   si' si,
   dod' dod,\mbreak
   
   %73
   si' si, 
   mi mi,
   mi' mi,
   
   %76
   fad' fad,
   mi' mi,
   la' la,
   
   %79
   la' la,
   mi' mi,
   la' la,
   
   %82
   mi' mi,\mbreak
   la la'
   si sold
   
   %85
   la la,
   re mi
   la, mi'
   
   %88
   la, mi'
   la,\p la'
   si sold
   
   %91
   la la,
   re mi
   la, mi'
   
   %94
   la, mi'
   la,\f mi'
   la, mi'
   
   %97
   la,2_\fermata
   
}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s8 
    s2*5
    <_+>2
    s
    <_+>
    s
    <7>4 <6>
    <7 3+> s
    <5 4> <3>
    s2 <7>4 <6>
    <7>2
    <5 4>4 <3>
    s2 <7>4 <6!>
    <7!> s
    <5 4!> <3+>
    s <6 4>
    <5 3> <6 4>8 <5 3>
    s2*6
    <7>2
    s
    s4 <7>
    s <6 4>8 <5 3>
    s4 <6 4>8 <5 3>
    s2*6
    <_+>2
    s <_+>
    s
    <7>4 <6>
    <7 3+>2
    <5 4>4 <3>
    <6+>2
    <_+>
    s
    <_+>
    s
    
    <_+>
    <7>
    s 
    s4 <7 3+>
    s <6 4>8 <5 3+>
    s4 <6 4>8 <5 3+>
    s2*6
    <_+>2
    s
    <_+>
    <6 4>
    <7 5>
    <6 4>
    <5 3+>
    s
    <7>4 <6>
    <7 3+>2
    <5 4>4 <3>
    s2
    <7>4 <6>
    <7>2
    <5 4>4 <3>
    s2*5
    s4 <6 5>
    s2
    s4 <7>
    s4 <6 4>8 <5 3>
    s4 <6 4>8 <5 3>
    s2
    s4 <6 5>
    s2 
    s4 <7>
    s4 <6 4>8 <5 3>
    s4 <6 4>8 <5 3>
    s4 <6 4>8 <5 3>
    s4 <6 4>8 <5 3>

}

forma = {

    \time 2/4
    \key la\major
    \tempo 2 = 60
    \partial 8 s8
    s2*97
    \bar"|."

}



VIvlI = {
    \global
    %\notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}


VIvla = {
    \global
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>
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

VIIvlIn = \relative do'' {
   
   sib16 sib do sib fa' sib, do sib fa' sib, do sib fa' sib, do sib
   sib'8[la16 sol fa mib re do] sib sib do sib fa' sib, do sib
   fa' sib, do sib fa' sib, do sib fa'8[mib16 re do sib la sol]
   
   %4
   fa fa sol fa do' fa, sol fa do' fa, sol fa do' fa, sol fa
   fa'8[mib16 re do sib la sol] fa fa sol fa do' fa, sol fa 
   do' fa, sol fa do' fa, sol fa\mbreak mib'8[re16 do sib la sol fa]
   
   %7
   re' sib do sib fa' sib, do sib lab' sib, do sib fa' sib, do sib
   lab' sib, do sib fa' sib, do sib sol'8 mib, sol sib
   r16 do re do sol' do, re do sib' do, re do sol' do, re do
   
   %10
   sib' do, re do sol' do, re do la'8 fa, la do
   mib r re r do r re r
   mib r re r\mbreak do16 mib mib8~mib16 sol fa mib  %% inizio p 2
   
   %13
   re fa fa8~fa16 lab sol fa sol sol sol8~sol16 sib \once\set suggestAccidentals = ##t la? sol
   la[sib do sib la sol fa mib] re8 sib'4 la8~
   la sol4 fa8~fa sol do, mi
   
   %16
   fa16 fa, sol fa do' fa, sol fa do' fa, sol fa do' fa, sol fa\mbreak
   fa'8[mib!16 re do sib la sol] fa fa sol fa do' fa, sol fa
   do' fa, sol fa do' fa, sol fa mib'8[re16 do sib la sol fad]
   
   %19
   sib sol la sol sib sol la sol sib sol la sol sib sol la sol
   si fa sol fa si fa sol fa si fa sol fa si fa sol fa 
   do' sol lab sol do sol lab sol do sol lab sol do sol lab sol
   
   %22
   sol' do, re do sol' do, re do\mbreak sol' do, re do sol' do, re do 
   lab' do, re do lab' do, re do lab' do, re do lab' do, re do
   si8 sol si re fa r mib r
   
   %25
   re r mib r fa r mib r
   re16 fa fa8~fa16 lab sol fa mib do re do sol' do, re do\mbreak
   do'8[sib16 lab sol fa mib re] do do re do sol' do, re do
   
   %28
   sol'8[fa16 mib re do si la] sol sol fa sol re' sol, fa sol
   do8[sib16 lab sol fa mib re]\mbreak do do' si do sol' do, si do
   sol' do, si do sol' do, si do lab'8 do, fa lab
   
   %31
   fa16 sib, \once\set suggestAccidentals = ##t la? sib fa' sib, la sib fa' sib, la sib fa' sib, la sib
   sol'8 sib, mib sol fad16[sol la sol fad mi re do]
   sib8 sol' re, fad' sol16 re mib? re sol re mib re
   
   %34
   sol re mib re sol re mib re sol8[\once\set suggestAccidentals = ##t fa?16 mib re do sib la]\mbreak
   sol sol fad sol re' sol, fad sol re' sol, fad sol re' sol, fad sol
   re'8[do16 sib la sol fad mi] re re mi re la' re, mi re
   
   %37
   sib'8 re sol sib do r sib r
   la r sib r\mbreak do r sib r
   la sol la fad sol4 r
   
   %40
   sib8[la16 sol \once\set suggestAccidentals = ##t fa? mib re do] sib sib do sib fa' sib, do sib
   fa'8 [mib16 re do sib la sol] fa fa sol fa do' fa, sol fa\mbreak
   re' sib do sib fa' sib, do sib  lab' sib, do sib fa' sib, do sib
   
   %43
   sol'8 mib, sol sib r16 do re do sol' do, re do
   sib' do, re do sol' do, re do la'?8 fa, la do
   mib? r re r\mbreak do r re r
   
   %46
   mib r re r do16 fa, sol fa mib' fa, sol fa
   re'8 sib' do, la' sib16 fa fa8~fa16 sol fa mib
   re fa fa8~fa16 sol fa mib re fa, fa8~fa16 sol fa mib
   
   %49
   re fa fa8~fa16 sol fa mib re8  sib'' do, la'\mbreak
   sib16\p fa fa8~fa16 sol fa mib re fa fa8~fa16 sol fa mib
   re fa, fa8~fa16 sol fa mib re fa fa8~fa16 sol fa mib
   
   %52
   re8\f sib'' do, la' sib2\fermata

}

VIIvlIIn = \relative do'' {
   
   sib16 sib do sib fa' sib, do sib fa' sib, do sib fa' sib, do sib
   sib'8[la16 sol fa mib re do] sib sib do sib fa' sib, do sib
   fa' sib, do sib fa' sib, do sib fa'8[mib16 re do sib la sol]
   
   %4
   fa fa sol fa do' fa, sol fa do' fa, sol fa do' fa, sol fa
   fa'8[mib16 re do sib la sol] fa fa sol fa do' fa, sol fa 
   do' fa, sol fa do' fa, sol fa\mbreak mib'8[re16 do sib la sol fa]
   
   %7
   re' sib do sib fa' sib, do sib lab' sib, do sib fa' sib, do sib
   lab' sib, do sib fa' sib, do sib sol'8 mib, sol sib
   r16 do re do sol' do, re do sib' do, re do sol' do, re do
   
   %10
   sib' do, re do sol' do, re do la'8 fa, la do
   do8 r sib r la r sib r
   do r sib r\mbreak la16 do do8~do16 mib re do
   
   %13
   sib8 re~re16 fa mib re mib mib mib8~mib16 sol fa mib
   fa[sol la sol fa mib re do] sib8 fa' sol[fa]~
   fa mib4 re8~re sib sol do
   
   %16
   la16 fa sol fa do' fa, sol fa do' fa, sol fa do' fa, sol fa\mbreak
   fa'8[mib!16 re do sib la sol] fa fa sol fa do' fa, sol fa
   do' fa, sol fa do' fa, sol fa mib'8[re16 do sib la sol fad]
   
   %19
   sib sol la sol sib sol la sol sib sol la sol sib sol la sol
   si fa sol fa si fa sol fa si fa sol fa si fa sol fa 
   do' sol lab sol do sol lab sol do sol lab sol do sol lab sol
   
   %22
   sol' do, re do sol' do, re do\mbreak sol' do, re do sol' do, re do 
   lab' do, re do lab' do, re do lab' do, re do lab' do, re do
   si8 sol si re re r do r
   
   %25
   si r do r re r do r
   si16 re re8~re16 fa mib re do do re do sol' do, re do\mbreak
   do'8[sib16 lab sol fa mib re] do do re do sol' do, re do
   
   %28
   sol'8[fa16 mib re do si la] sol sol fa sol re' sol, fa sol
   do8[sib16 lab sol fa mib re]\mbreak do do' si do sol' do, si do
   sol' do, si do sol' do, si do lab'8 do, fa lab
   
   %31
   fa16 sib, \once\set suggestAccidentals = ##t la? sib fa' sib, la sib fa' sib, la sib fa' sib, la sib
   sol'8 sib, mib sol fad16[sol la sol fad mi re do]
   sib8 sol' re, fad' sol16 re mib? re sol re mib re
   
   %34
   sol re mib re sol re mib re sol8[\once\set suggestAccidentals = ##t fa?16 mib re do sib la]\mbreak
   sol sol fad sol re' sol, fad sol re' sol, fad sol re' sol, fad sol
   re'8[do16 sib la sol fad mi] re re mi re la' re, mi re
   
   %37
   sib'8 sib re sol la r sol r
   fad r sol r\mbreak la r sol r
   fad sib, do la sib4 r
   
   %40
   sib'8[la16 sol \once\set suggestAccidentals = ##t fa? mib re do] sib sib do sib fa' sib, do sib
   fa'8 [mib16 re do sib la sol] fa fa sol fa do' fa, sol fa\mbreak
   re' sib do sib fa' sib, do sib  lab' sib, do sib fa' sib, do sib
   
   %43
   sol'8 mib, sol sib r16 do re do sol' do, re do
   sib' do, re do sol' do, re do la'?8 fa, la do
   do r sib r\mbreak la r sib r
   
   %46
   do r sib r la16 fa sol fa do' fa, sol fa
   re'8 sib' do, la' sib16 re, re8~re16 mib re do
   sib re re8~re16 mib re do sib re,re8~re16 mib re do
   
   %49
   sib re re8~re16 mib re do sib8 sib'' do, la'\mbreak
   sib16\p re, re8~re16 mib re do sib re re8~re16 mib re do
   sib re, re8~re16 mib re do sib re re8~re16 mib re do
   
   %52
   sib8\f sib'' do, la' sib2\fermata
   
}

VIIvlan = \relative do' {
   
   re8 re re re re re re re
   re re re re re re re re
   re re re re re re re re
   
   %4
   la la la la la la la la
   la la la la la la la la
   la la la la la la la la
   
   %7
   fa re' re re re re re re
   re re re re sib sib sib sib
   mi mi mi mi mi mi mi mi
   
   %10
   mi? mi mi mi do do do do
   la'8 r fa r la r fa r
   la r fa r\mbreak fa8.[fa16 fa8. fa16] 
   
   %13
   fa8.[fa16 fa8. sib16] sib8.[sib16 sib8. sib16]
   do8.[do16 do8. la16] fa8 re mib do
   re sib do la sib re mi sol
   
   %16
   fa la, la la la la la la\mbreak
   la la la la la la la la
   la la la la la la la la
   
   %19
   re re re re re re re re
   re re re re re re re re
   sol sol sol sol sol sol sol sol
   
   %22
   do, do do do\mbreak do do do do
   do do do do fa fa fa fa
   re re re re si'? r sol r
   
   %25
   si r sol r si r sol r
   sol8.[sol16 si8. si16] sol8 mib mib mib\mbreak
   mib mib mib mib mib mib mib mib
   
   %28
   mib mib mib mib re si si si
   sol sol sol sol\mbreak sol sol sol sol
   sol sol sol sol do do do do
   
   %31
   fa fa fa fa fa fa fa fa
   sib, sib sib sol la la la re
   re re16 mib re8 re sib sib sib sib
   
   %34
   sib sib sib sib sib sib sib sib\mbreak
   sib sib sib sib sib sib sib sib
   la la la la la la la la
   
   %37
   re re re re fad r re r
   fad r re r\mbreak fad r re r
   re re mib re re4 r
   
   %40
   re8 re re re re re re re
   re re re re la la la la\mbreak
   fa re' re re re re re re
   
   %43
   sib sib sib sib mi mi mi mi
   mi? mi mi mi do do do do 
   la' r fa r\mbreak la r fa r
   
   %46
   la r fa r la la la la
   fa8. sol16 fa8 fa re8.[re16 re8. re16]
   re8.[re16 re8. re16] re8.[re16 re8. re16]
   
   %49
   re8.[re16 re8. re16] re mib fa sol fa8 fa\mbreak 
   re8.\p[re16 re8. re16] re8.[re16 re8. re16]
   re8.[re16 re8. re16] re8.[re16 re8. re16]
   
   %52
   re\f mib fa sol fa8 fa re2\fermata
   
}


VIIbcn = \relative do {
   
   sib8 sib  sib  sib  sib sib sib sib
   sib8 sib  sib  sib  sib sib sib sib
   sib8 sib  sib  sib  sib sib sib sib
   
   %4
   fa' fa fa fa fa fa fa fa
   fa fa fa fa fa fa fa fa
   fa fa fa fa fa fa fa fa
   
   %7
   sib,8 sib  sib  sib  sib sib sib sib
   sib8 sib  sib  sib  mib mib mib mib
   do do do do do do do do
   
   %10
   do do do do fa fa fa fa
   fa,16 fa' sol fa fa, fa' sol fa fa, fa' sol fa fa, fa' sol fa
   fa, fa' sol fa fa, fa' sol fa\mbreak fa,8.[fa16 fa8. fa16]
   
   %13
   sib8.[sib16 sib8. sib16] mib8.[mib16 mib8. mib16]
   mib8.[mib16 fa8. fa16] sib,8 sib' do, fa
   sib, mib la, re sol, sib do do,
   
   %16
   fa fa fa fa fa fa fa fa\mbreak
   fa fa fa fa fa fa fa fa
   fa fa fa fa fad fad fad fad
   
   %19
   sol sol sol sol sol' sol sol sol
   fa fa fa fa fa fa fa fa
   mib mib mib mib mib mib mib mib
   
   %22
   mib mib mib mib \mbreak  mib mib mib mib 
   fa fa fa fa fa fa fa fa
   sol,16 sol' fa sol sol, sol' fa sol sol, sol' fa sol sol, sol' fa sol
   
   %25
   sol, sol' fa sol sol, sol' fa sol sol, sol' fa sol sol, sol' fa sol
   sol,8.[sol16 sol8. sol16] do8 do do do\mbreak
   do do do do do do do do
   
   %28
   do do do do si sol sol sol
   mib' mib mib mib mib mib mib mib
   mib mib mib mib fa fa fa fa
   
   %31
   re re re re re re re re
   mib mib mib mib re re re re
   sol,16 la sib do re8 re, sol' sol sol sol
   
   %34
   sol sol sol sol sol sol sol sol\mbreak
   sol sol sol sol sol sol sol sol
   fad fad fad fad fad fad fad fad
   
   %37
   sol,16 sol' fad sol sol, sol' fad sol re, re' do re re, re' do re
   re, re' do re re, re' do re\mbreak re, re' do re re, re' do re
   re,8 sol do re sol,4 r
   
   %40
   sib8 sib sib sib sib sib sib sib
   sib sib sib sib fa' fa fa fa\mbreak
   sib, sib  sib  sib  sib sib sib sib
   
   %43
   mib mib mib mib do do do do
   do do do do fa fa fa fa
   fa,16 fa' mib fa fa, fa' mib fa\mbreak fa, fa' mib fa fa, fa' mib fa
   
   %46
   fa, fa' mib fa fa, fa' mib fa fa,8 fa fa fa
   sib16 do re mib fa8 fa, sib8.[sib16 sib8. sib16]
   sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]
   
   %49
   sib8.[sib16 sib8. sib16] sib16 do re mib fa8 fa,\mbreak
   sib8.\p[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]
   sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]
   
   %52
   sib\f do re mib fa8 fa, sib2\fermata
   
}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*6
    s2 <7->
    s1
    <_!>2 <7>
    s1
    <7 5>4 <6 4> <5 3> <6 4>
    <7 5> <6 4> s <7>
    s <7-> s2
    <6 4> <7>
    <7>4 <7> <7> <3!>
    s1
    s
    s2 <7>
    s1
    <6 4!>
    <6>
    s
    <_->
    <_!>2<7 5>4 <6 4>
    <5 3!> <6 4> <7 5> <6 4>
    <5 3!>1
    s1*3
    s2 <_->
    s1
    s2 <_+>
    s4 <_+> s2
    s1*3
    s2 <7 5>4 <6 4>
    <5 3+> <6 4> <7 5> <6 4>
    <5 3+>1
    s
    s
    s2 <7 ->
    s <_!>
    <7>1
    <7 5>4 <6 4> <5 3> <6 4>
    <7 5> <6 4> <5 3>2
    
}

forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 60
    s1*52
    \bar"||"

}



VIIvlI = {
    \global
    %\notypeset
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    \global
    <<\VIIvlIIn \forma>>

}


VIIvla = {
    \global
    \clef alto
    <<\VIIvlan \forma>>

}

VIIbc = {
    \global
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
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

VIIIvlIn = \relative do'' {
   
   sib'1
   la\fermata
   mib\p
   re\fermata
   lab'\f 
   sol\fermata 
   lab\p 
   sol2 mib~
   mib re
   mib1\fermata
  
}

VIIIvlIIn = \relative do'' {
   
   sol'1
   fa\fermata
   do\p
   sib\fermata
   fa'\f 
   mib\fermata
   fa\p 
   mib2 sol,
   fa1
   sol\fermata

}

VIIIvlan = \relative do' {
   
   mi1
   do\fermata
   la'\p 
   \parenthesize sol\fermata
   re\f 
   do\fermata
   re\p 
   sib 
   do2 sib
   sib1\fermata

}


VIIIbcn = \relative do {
   
   do1
   fa\fermata
   fad\p
   sol\fermata 
   si,\f 
   do\fermata 
   sib?\p 
   mib2 sol,
   lab sib
   mib,1\fermata
   
}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    <7 3!>1
    s
    <7>
    s
    <7->
    s
    <7->
    s
    <6 5>



}

forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 50
    s1*10
    \bar"||"

}



VIIIvlI = {
    \global
    %\notypeset
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    \global
    <<\VIIIvlIIn \forma>>

}


VIIIvla = {
    \global
    \clef alto
    <<\VIIIvlan \forma>>

}

VIIIbc = {
    \global
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
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

IXvlIn = \relative do'' {
   
   re4.
   do
   mib
   re
   sib'~
   sib
   la
   sib16 re, fa mib fa re
   mib re mib fa sol mib
   re do re mib fa re
   do sib do re mib do
   re do re mib fa re
   mi re mi fa sol mi\mbreak
   fa mi fa sol la fa
   sol fa sol la sib sol
   la4.
   sol
   sib
   la 
   fa~
   fa
   mi
   fa8 la,16 sib do la\mbreak
   sol fa sol la sib sol
   sib la sib do re sib
   la sol la sib do la
   sol' \once\set suggestAccidentals = ##t fad? sol la sib sol
   fad mi fad sol la fad
   sol4.~
   sol
   fad
   fa!
   mib
   do'~
   do
   si
   do8 mib,16 fa sol mib
   re do re mib fa re
   mib re mib fa sol fa
   mi re mi fa sol mi
   fa mi fa sol la fa
   mi re mi fa sol mi
   fa4.
   mi~
   mi
   fa
   re'~
   re
   dod
   do!\mbreak
   sib~
   sib
   lab~
   lab
   sol
   fa~
   fa
   sol16 fa sol lab sib sol
   fa mib fa sol lab fa
   sol fa sol \once\set suggestAccidentals = ##t lab? sib sol
   la? sol la sib do la
   sib4.~
   sib
   lab
   sol
   do
   la
   sib16 la sib do re sib
   la sol la sib do la
   sib4.
   la
   sib16 la sib do re sib
   la sol la sib do la
   sib4.~
   sib
   la
   sib
   re,\mbreak
   do~
   do
   re\fermata

}

IXvlIIn = \relative do'' {
   
   sib4.~
   sib
   la
   
   %4
   sib
   re
   do~
   
   %7
   do
   re16 sib re do re sib
   do sib do re mib do
   
   %10
   sib la sib do re sib
   la sol la sib do la
   sib la sib do re sib 
   
   %13
   sol fa sol la sib sol\mbreak
   la sol la sib do la
   mi' re mi fa sol mi
   
   %16
   fa4.~
   fa
   sol
   
   %19
   fa
   la,
   sol~
   
   %22
   sol
   la8 fa16 sol la fa\mbreak
   mi re mi fa sol mi
   
   %25
   sol fad sol la sib sol
   fad mi fad sol la fad
   sib la sib do re sib
   
   %28
   la sol la sib do la
   sib4.
   la~
   
   %31
   la
   si
   do
   
   %34
   mib
   re~
   re
   
   %37
   mib8 do16 re mib do
   si la si do re si\mbreak
   do \once\set suggestAccidentals = ##t si? do re mib re
   
   %40
   dod si dod re mi dod
   re dod re mi fa re
   dod si dod re mi dod
   
   %43
   re4.~
   re
   dod
   
   %46
   re
   fa
   mi~
   
   %49
   mi
   fad\mbreak
   sol 
   
   %52
   mi
   fa
   re
   
   %55
   mib?~
   mib
   re
   
   %58
   mib16 re mib fa sol mib
   re do re mib fa re
   mib re mib fa sol mib\mbreak
   
   %61
   do sib do re mib do
   re4.
   do
   
   %64
   re
   mib
   mi
   
   %67
   fa\mbreak
   re16 do re mib fa re
   do sib do re mib do
   
   %70
   re4.
   do
   re16 do re mib fa re
   
   %73
   do sib do re mib do
   re4.
   do~
   
   %76
   do
   re
   sib~\mbreak
   
   %79
   sib
   la
   sib\fermata
  
}

IXvlan = \relative do' {
   
   fa4.~
   fa~
   fa8 la4
   
   %4
   fa4.~
   fa
   sol
   
   %7
   fa
   fa
   la
   
   %10
   fa
   la
   fa4 sib8
   
   %13
   mi,4.\mbreak
   do~
   do~
   
   %16
   do
   \parenthesize do~
   \parenthesize do
   
   %19
   do~
   do
   re
   
   %22
   do
   do~\mbreak
   do
   
   %25
   re~
   re~
   re~
   
   %28
   re~
   re
   mib
   
   %31
   re 
   re4 sol8
   sol4.~
   
   %34
   sol
   lab
   sol~
   
   %37
   sol~
   sol~
   sol
   
   %40
   la~
   la~
   la~
   
   %43
   la
   sib
   la~
   
   %46
   la~
   la
   sib
   
   %49
   la~
   la4 fad8\mbreak
   re4 sib'8
   
   %52 
   sol4 mi8
   do4 lab'8
   fa4 re8
   
   %55
   sib4.
   do
   sib
   
   %58
   sib~
   sib~
   sib
   
   %61
   fa'~
   fa~
   fa~
   
   %64
   fa4 re8
   sib4.
   sol'4 mi8
   
   %67
   do4 la'8\mbreak
   fa4.~
   fa~
   
   %70
   fa~
   fa~
   fa~
   
   %73
   fa~
   fa
   sol
   
   %76
   fa
   fa~
   fa\mbreak
   
   %79
   sol
   fa
   fa\fermata

}


IXbcn = \relative do {
   
   sib16 la sib do re sib
   fa' mib fa sol la sol
   fa mib fa sol la fa
   
   %4
   sib la sib do re sib
   sib, la sib do re sib
   mib re mib fa sol fa
   
   %7
   fa mib fa sol la fa
   sib,4.
   fa'
   
   %10
   sib,
   fa'
   sib,
   
   %13
   do\mbreak
   fa
   do
   
   %16
   fa16 mi fa sol la fa
   do sib do re mi re
   do sib do re mi do
   
   %19
   fa mi fa sol la sol
   fa mi fa sol la fa
   sib, la sib do re sib
   
   %22
   do sib do re mi do
   fa4.\mbreak
   do
   
   %25
   sol'
   re
   sol
   
   %28
   re
   sol16 fad sol la sib sol
   do, sib do re mib do
   
   %31
   re do re mi fad re
   sol fa? sol la si sol
   do, si do re mib? re
   
   %34
   do si do re mib do
   fa mib fa sol lab fa
   sol fa sol la? si sol
   
   %37
   do,4.
   sol'
   do, 
   
   %40
   la'
   re,
   la'
   
   %43
   re,16 dod re mi fa re
   sol, fa sol la sib sol
   la sol la si dod la
   
   %46
   re dod re mi fa mi
   re dod re mi fa re
   sol fa sol la sib sol
   
   %49
   la sol la si dod la
   re, do? re mi fad re\mbreak
   sol fad sol la sib sol
   
   %52
   do, sib do re mi do
   fa mi fa sol lab fa
   sib, \once\set suggestAccidentals = ##t lab? sib do re sib
   
   %55
   mib re mib fa sol mib
   lab, sol lab sib do lab
   sib lab sib do re sib
   
   %58
   mib4.
   sib'
   mib,
   
   %61
   fa
   sib,16 la sib do re sib
   fa' mib fa sol la \parenthesize fa
   
   %64
   sib, lab sib do re sib
   mib re mib fa sol mib
   do sib do re mi do
   
   %67
   fa mib? fa sol la fa
   sib,4.
   fa'
   
   %70
   sib,16 la sib do re sib
   fa' mib fa sol la fa
   sib,4.
   
   %73
   fa'
   sib,16 la sib do re sib
   mib re mib fa sol mib
   
   %76
   fa mib fa sol la fa
   sib la sib do re sib
   sib, la sib do re sib\mbreak
   
   %79
   mib re mib fa sol mib
   fa mib fa sol la fa
   sib,4.\fermata
 
}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s4.
    <5 4>
    <3>
    s
    s
    <6 5>
    s4.*6
    <_!>4.
    s 
    <_!>
    s
    <5 4>
    <3!>
    s
    s
    <6 5>
    <_!>
    s
    <_!>
    s
    <_+>
    s
    <_+>
    s
    <6 5>
    <3+>
    <7 3!>
    s
    s
    <_->
    <_!>
    s
    <_!>
    s 
    <_+>
    s
    <_+>
    s
    <[6!] [5]>
    <_+>
    s
    s
    <6! 5>
    <_+>
    <7 _+>
    s
    <7 3!>
    <_->
    <[7-]>
    s
    <6 5>
    s4.*6
    <5 4>4.
    <7->
    s
    <_!>
    s4.*8
    <6 5>4.
    s4.*3
    <6 5>4.
    
}

forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key sib\major
    \tempo 4. = 60
    s4.*81
    \bar"|."

}



IXvlI = {
    \global
    %\notypeset
    <<\IXvlIn \forma>>

}

IXvlII = {
    \global
    <<\IXvlIIn \forma>>

}


IXvla = {
    \global
    \clef alto
    <<\IXvlan \forma>>

}

IXbc = {
    \global
    \clef bass
    <<\IXbcn \forma \IXbfn>>
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

XvlIn = \relative do'' {
   
   re4
   sol sol la re,
   si' sol2 fad4
   sol si, do si8 la
   
   %4
   si4 sol sol, re''
   sol sol la re,
   si' sol2 fad4
   
   %7
   sol sol, re' do8 si
   la2 re4 re,
   do' re, si' la8 sol\mbreak
   
   %10
   la4 re, re' re,
   do' re, si' la8 sol
   la4 fad la' la,
   
   %13
   sol' la, fad' mi8 re
   mi4 la, la' la,
   sol' la, fad' mi8 re
   
   %16
   mi4 la, si8 la si dod
   re4 dod re8 dod re mi
   fad4 mi fad8 mi fad sol\mbreak
   
   %19
   la4 la, sol' fad8 mi
   fad4 re mi re8 dod
   re4 la sol' fad8 mi
   
   %22
   fad4 re mi re8 dod
   re4 fad, sol mi
   re r r la'
   
   %25
   re re mi la,
   fad'4 re2 dod4
   re fad, sol fad8 mi\mbreak
   
   %28
   fad4 re fad la
   re re mi la,
   fad' re2 dod4
   
   %31
   re mi8 fad sol4 fad
   mi la, la' la,
   sol' la, fad' mi8 re
   
   %34
   mi4 la, la' la,
   sol' la, fad' mi8 re
   mi4 la, re' re,
   
   %37
   do'? re, si' la8 sol\mbreak
   la4 re, re' re,
   do' re, si' la8 sol
   
   %40
   la4 re, si' fad
   sol mi2 si'4
   lad fad2 lad4
   
   %43
   si si, si' si,
   la'? si, sol' fad8 mi
   fad4 si, si' si,
   
   %46
   la' si, sol' fad8 mi\mbreak
   fad4 si, si' la8 sol
   fad4 red la' sol8 fad
   
   %49
   sol4 mi fad red
   mi mi fad si,
   sol' mi2 red4
   
   %52
   mi sol, la sol8 fad
   sol4 mi sol si
   mi mi fad si,
   
   %55
   sol' mi2 red4
   mi mi, si' la8 sol\mbreak
   fad4 si dod8 si dod red
   
   %58
   mi4 red mi8 red mi fad
   sol4 fad sol8 fad sol la
   si4 sol la fad
   
   %61
   mi2 r4 re?
   sol sol la re,
   si' sol2 fad4
   
   %64
   sol si, do si8 la
   si4 sol re' do8 si
   la2 re4 re,
   
   %67
   do' re, si' la8 sol\mbreak
   la4 re, re' re,
   do' re, si' la8 sol
   
   %70
   la4 re, do' si8 la
   si4 sol' la fad
   sol si la sol8 fad
   
   %73
   sol4 si, do la
   sol1\fermata
   
}

XvlIIn = \relative do'' {
   
   r4
   r sol'2 fad4
   sol sol la re,
   si' sol, la sol8 fad
   
   %4
   sol2 r
   r4 sol'2 fad4
   sol sol la re,
   
   %7
   si' si,2 la8 sol 
   fad2 r
   r re'4 re,\mbreak
   do' re, si' la8 sol
   
   %11
   la4 re, re're,
   do' re, fad' mi8 re
   mi4 la, la' la,
   
   %14
   sol' la, fad' mi8 re
   mi4 la, la' la,
   sol' la, r2
   
   %17
   r4 la si8 la si dod
   re4 dod re8 dod re mi\mbreak
   mi2 r
   
   %20
   r sol4 fad8 mi
   fad4 re mi re8 dod
   re4 la sol' fad8 mi
   
   %23
   fad4 re, mi dod
   re r r2
   r4 re'2 dod4
   
   %26
   re re mi la,
   fad' re, mi re8 dod\mbreak
   re4 la re fad
   
   %29
   la re2 dod4
   re re mi la,
   fad' mi8 re mi4 re
   
   %32
   dod2 r
   r la'4 la,
   sol' la, fad' mi8 re
   
   %35
   mi4 la, la' la,
   sol' la, fad' mi8 re
   la'4 la, re' re,\mbreak
   
   %38
   do' re, si' la8 sol
   la4 re, re' re,
   do' re, fad red
   
   %41
   mi si2 sol'4
   fad dod2 fad4
   \once\set suggestAccidentals = ##t red?2 r
   
   %44
   r si'4 si,
   la' si, sol' fad8 mi
   fad4 si, si' si,\mbreak
   
   %47
   la' si, sol' fad8 mi
   red4 si fad' mi8 red
   mi4 sol la fad
   
   %50
   sol mi2 red4
   mi mi fad si,
   sol' mi, fad red
   
   %53
   mi si mi sol
   si mi2 red4
   mi mi fad si,
   
   %56
   sol' sol,2 fad8 mi\mbreak
   red4 r r2
   r4 si' dod8 si dod red
   
   %59
   mi4 red mi8 red mi fad
   sol4 mi fad red
   mi2 r
   
   %62
   r4 sol2 fad4
   sol sol la re,
   si' sol, la sol8 fad
   
   %65
   sol4 re si' la8 sol
   fad2 r
   r re'4 re,\mbreak
   
   %68
   do' re, si' la8 sol
   la4 re, re' re,
   do' re, la'' sol8 fad
   
   %71
   sol4 si, do la
   si sol' fad mi8 re
   si'4 sol, la fad
   
   %74
   sol1\fermata

}

Xvlan = \relative do' {
   
   r4
   r si' mi, re
   re si' mi, re
   re re mi fad
   
   %4
   re2 r
   r4 si' mi, re
   re si' mi, re
   
   %7
   re re re mi
   la, la' fad fad
   fad fad re re\mbreak
   
   %10
   fad fad re re
   fad fad re re
   fad fad re fad
   
   %13
   dod dod re fad
   dod dod re fad
   dod dod re fad
   
   %16
   dod r r2
   fad4 r si r
   la r la r\mbreak
   
   %19
   mi dod dod dod
   la fad' si dod
   la la si dod
   
   %22
   la la si dod
   la la, si la
   fad r r2
   
   %25
   r4 fad' si, dod
   la fad' si, dod
   la la si la\mbreak
   
   %28
   la fad la re
   fad fad si, dod
   la la' si, dod
   
   %31
   la la' si si
   mi, mi dod dod
   dod? dod re fad
   
   %34
   dod dod re fad
   dod dod re fad
   dod dod re fad
   
   %37
   fad fad sol si\mbreak
   fad fad sol si
   fad fad sol si
   
   %40
   fad fad fad fad
   si, sol' sol mi
   dod lad' lad fad
   
   %43
   fad fad red red
   red? red mi sol
   red red mi sol
   
   %46
   red red mi sol\mbreak
   red red mi sol
   si fad! red red
   
   %49
   si si' do si
   si si do si
   si si do si
   
   %52
   si si, do si
   si r r2
   r4 si' do si
   
   %55
   si si do si
   si si, si4. do8\mbreak
   fad,4 fad' mi4. fad8
   
   %58
   si,4 fad' la fad
   si si si si
   si si do si
   
   %61
   sol2 r
   r4 si mi, re
   re si' mi, re
   
   %64
   re re mi re
   re re re mi
   la, la fad' fad
   
   %67
   fad fad sol sol\mbreak
   re fad sol sol
   re fad sol sol
   
   %70
   re re fad fad
   re re mi re
   re re re re
   
   %73
   re re mi re
   si1\fermata
   
}


Xbcn = \relative do {
   
   r4
   r sol' do, re
   sol, sol' do, re
   sol, sol' do, re
   
   %4
   sol,2 r
   r4 sol' do, re
   sol, sol' do, re
   
   %7
   sol, sol' sol, do
   re re re re
   re re re re\mbreak
   
   %10
   re re re re
   re re re re
   re re la la
   
   %13
   la la la la
   la la la la
   la la la la
   
   %16
   la fad' sol sol,
   re' la' sol sol,
   re' la' re re,\mbreak
   
   %19
   dod la mi' la,
   re re, sol' la
   re, fad sol la
   
   %22
   re, fad sol la
   re, re, sol la
   re r r2
   
   %25
   r4 re sol, la
   re, re' sol, la
   re, re' sol, la\mbreak
   
   %28
   re,2 r
   r4 re' sol, la
   re, re' sol, la
   
   %31
   re, re' sol, sold
   la la la la
   la la la la
   
   %34
   la la la la
   la la la la
   la dod re re
   
   %37
   re re re re\mbreak
   re re re re
   re re re re
   
   %40
   re re red red
   mi mi mi mi
   fad fad fad fad
   
   %43
   si, si si si
   si si si si
   si si si si
   
   %46
   si si si si\mbreak
   si si si si
   si si si si
   
   %49
   mi mi la, si
   mi, mi' la, si
   mi, mi' la, si
   
   %52
   mi, mi' la, si
   mi, r r2
   r4 mi' la, si
   
   %55
   mi, mi' la, si 
   mi, mi' mi,8 sol la4\mbreak
   si si' la la
   
   %58
   sol si la la
   sol si mi, si
   mi, mi' la, si
   
   %61
   mi,2 r
   r4 sol' do, re
   sol, sol' do, re
   
   %64
   sol, sol' do, re
   sol, sol' sol, do
   re re re re
   
   %67
   re re re re\mbreak
   re re re re
   re re re re
   
   %70
   re re re re
   sol, sol' do, re
   sol, sol' re' re,
   
   %73
   sol, sol' do, re
   sol,1\fermata
   
}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s4
    s2 <6 5>
    s <6 5>
    s1
    s
    s2 <6 5>
    s <6 5>
    s1
    s
    <7>2 <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> s
    s4 <3+> <3>2
    s4 <_+> s2
    s1
    s2 s4 <_+>
    s1*4
    s2 <6 5>4 <3+>
    s2 <6 5>4 <3+>
    s1
    s
    s2 <6 5>
    s <6 5>
    s s4 <7 5>
    s1
    <7 5>2 <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> s
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> <6>
    s1
    s
    <_+>
    <7>2 <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <_+> <7>
    s1
    s2 <6 5>
    s <6 5>
    s1
    s
    s2 <6 5>
    s <6 5>
    s1
    <_+>2 <3+>4 <6 4+>
    <6>2 <3+>4 <6 4+>
    <6>2 s4 <7>
    s1
    s
    s2 <6 5>
    s <6 5>
    s1*3
    <7 5>2 <6 4>
    <7 5> <6 4>
    <7 5> <6 4>
    <7 5> s
  
}

forma = {

    \time 2/2
    \key sol\major
    \tempo 1 = 60
    \partial 4 s4
    s1*74
    \bar"||"

}



XvlI = {
    \global
    %\notypeset
    <<\XvlIn \forma>>

}

XvlII = {
    \global
    <<\XvlIIn \forma>>

}


Xvla = {
    \global
    \clef alto
    <<\Xvlan \forma>>

}

Xbc = {
    \global
    \clef bass
    <<\Xbcn \forma \Xbfn>>
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

XIvlIn = \relative do'' {
   
   si'4 la r
   si,\p la r
   do'\f si r
   
   %4
   do,\p si r
   re\f(do) si
   la2.\fermata
   
   %7
   re4\p(do) si
   la2.\fermata 
   re4\f  fa, r
   
   %10
   fa?\p mi r
   mi'\f sol, r
   sol\p fad? r
   
   %13
   la'\f do, r\mbreak
   do\p si r
   sol'\f la fad
   
   %16
   sol2 r4
   la\f do, r
   do\p si r
   
   %19
   sol'\f la fad
   sol2.\fermata
   
}

XIvlIIn = \relative do'' {
   
   sol'4 fad r
   sol,\p fad r
   la'\f sol r
   
   %4
   la,\p sol r
   si\f(la) sol
   fad2.\fermata
   
   %7
   si4\p(la) sol
   fad2.\fermata 
   si4\f re, r
   
   %10
   re\p do r
   dod'\f mi, r
   mi\p re r
   
   %13
   fad'\f la, r\mbreak
   la\p sol r
   si\f do la
   
   %16
   sol2 r4
   fad'\parenthesize \f  la, r
   la\p sol r
   
   %19
   si\f do la
   sol2.\fermata
   
}

XIvlan = \relative do' {
   
   re4 re r
   re\p re r
   fad\f re r
   
   %4
   fad\p re r
   re\f mi2
   la,2.\fermata
   
   %7
   re4\p mi2
   la,2.\fermata
   si4\f si r
   
   %10
   sol4\p sol r
   dod dod r
   la la r
   
   %13
   la' fad r\mbreak
   re re r
   re mi re
   
   %16
   si2 r4
   re re r
   re re r
   
   %19
   re mi re
   si2.\fermata

}


XIbcn = \relative do {
   
   sol'4 re r
   sol\p re r
   re\f sol, r
   
   %4
   re'\p sol, r
   sol\f do dod
   re2.\fermata
   
   %7
   sol,4\p do dod
   re2.\fermata
   sol,4 sol r
   
   %10
   do do r
   la la r
   re re r
   
   %13
   re' re, r\mbreak
   sol sol, r
   sol' do, re
   
   %16
   sol,2 r4
   re'' re, r
   sol sol, r
   
   %19
   sol' do, re 
   sol,2.\fermata

}

XIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2.
    s
    <7>
    <7>
    s2.*4
    <7->2.
    <6 4>4 <5 3>2
    <7 5>2.
    <6 4>4 <5 3>2
    <7>2.
    <9 4>4 <8 3>2
    s2.
    s
    <7>
    <9 4>4 <8 3>2
  
}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key sol\major
    \tempo 2 = 40
    s2.*20
    \bar"||"

}



XIvlI = {
    \global
    %\notypeset
    <<\XIvlIn \forma>>

}

XIvlII = {
    \global
    <<\XIvlIIn \forma>>

}


XIvla = {
    \global
    \clef alto
    <<\XIvlan \forma>>

}

XIbc = {
    \global
    \clef bass
    <<\XIbcn \forma \XIbfn>>
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

XIIvlIn = \relative do'' {
   
   sol'16 fad sol la sol fad sol la sol fad sol la
   sol8 re si sol si re
   sol16 fad sol la sol fad sol la sol fad sol la
   
   %4
   sol8 re si sol si re
   la'16 sol la si la sol la si la sol la si
   la8 fad re la re fad
   
   %7
   la16 sol la si la sol la si la sol la si
   la8 fad re la fad' la\mbreak
   si16 la si do si la si do si la si do
   
   %10
   la sol la si la sol la si la sol la do
   si la si do si la si do si la si do
   la8[re, re re, re' do16 si]
   
   %13
   do8[do do re, do' si16 la]
   si8[si si re, si' la16 sol]
   la8[la la re, la' sol16 fad]
   
   %16
   sol8 sol' mi sol re sol\mbreak
   do, sol' si, sol' la, sol'
   sol, sol' fad, sol' mi, sol'
   
   %19
   re, sol' la, sol' re, fad'
   sol16 fad sol la sol fad sol la sol fad sol la
   sol8 re si sol si re
   
   %22
   sol16 fad sol la sol fad sol la sol fad sol la
   sol8 mi dod la mi' sol
   fad16 mi fad sol fad mi fad sol fad mi fad sol\mbreak
   
   %25
   la8 fad red si fad' la
   sol16 fad sol la sol fad sol la sol fad sol la
   fad mi fad sol fad mi fad sol fad mi fad la
   
   %28
   sol8[mi mi mi, mi' re?16 do?]
   re8[re re mi, re' do16 si]
   do8[do do mi, do' si16 la]
   
   %31
   si8 mi do mi si mi
   la, mi' sol, mi' fad, mi'\mbreak
   mi, mi' re, mi' do, mi'
   
   %34
   si, fad'' red fad si, red
   mi16 red mi fad mi red mi fad mi red mi fad
   mi8 si sol mi sol si
   
   %37
   fad'16 mi fad sol fad mi fad sol fad mi fad sol
   fad8 red si  fad si red\mbreak
   mi sol sol16 fad sol la sol fad sol la
   
   %40
   sold fad sold la sold fad sold la sold fad sold si
   la8 mi do la mi' la
   fad?16 mi fad sol fad mi fad sol fad mi fad la
   
   %43
   sol8 re si sol re' sol
   sol16 fa sol la sol fa sol la sol fa sol la\mbreak
   fa mi fa sol fa mi fa sol fa mi fa sol
   
   %46
   mi8 do' mi, do' re, si'
   do4 r r
   sol16 fad? sol la sol fad sol la sol fad sol la
   
   %49
   sol8 re si sol si re
   la'16 sol la si la sol la si la sol la si
   la8 fad re la fad' la\mbreak
   
   %52
   si16 la si do si la si do si la si do
   la sol la si la sol la si la sol la do
   si la si do si la si do si la si do
   
   %55
   la8[re, re re, re' do16 si]
   do8[do do re, do' si16 la]
   si8[si si re, si' la16 sol]
   
   %58
   la8[la la re, la' sol16 fad]
   sol8 sol' mi sol re sol\mbreak
   do, sol' si, sol' la, sol'
   
   %61
   \once\stemUp sol, si' si16 la si do si la si do
   la sol la si la sol la si la sol la si
   sol8 sol mi sol re sol
   
   %64
   do, sol' si, sol' la, sol'
   \once\stemUp sol, si' si16 la si do si la si do
   la sol la si la sol la si la sol la si
   
   %67
   sol2.\fermata
  
}

XIIvlIIn = \relative do'' {
   
   R2.
   sol'16 fad sol la sol fad sol la sol fad sol la
   sol8 re si sol si re
   
   %4
   sol16 fad sol la sol fad sol la sol fad sol la
   la8 fad re la re fad
   la16 sol la si la sol la si la sol la si
   
   %7
   la8 fad re la re fad
   la16 sol la si la sol la si la sol la si\mbreak
   sol16 fad sol la sol fad sol la sol fad sol la
   
   %10
   fad mi fad sol fad mi fad sol fad mi fad la
   sol fad sol la sol fad sol la sol fad sol la
   fad8 [re re re, re' do16 si]
   
   %13
   do8[do do re, do' si16 la]
   si8[si si re, si' la16 sol]
   la8[la la re, la' sol16 fad]
   
   %16
   sol8 sol' mi sol re sol\mbreak
   do, sol' si, sol' la, sol'
   sol, sol' fad, sol' mi, sol'
   
   %19
   re, sol' la, sol' re, fad'
   sol4 r r
   sol16 fad sol la sol fad sol la sol fad sol la
   
   %22
   sol8 mi dod la dod mi
   sol16 fad sol la sol fad sol la sol fad sol la
   la8 fad re la re fad\mbreak
   
   %25
   fad16 mi fad sol fad mi fad sol fad mi fad sol 
   mi red mi fad mi red mi fad mi red mi fad
   red dod red mi red dod red mi red dod red fad
   
   %28
   mi8[mi mi mi, mi' re?16 do?]
   re8[re re mi, re' do16 si]
   do8[do do mi, do' si16 la]
   
   %31
   si8 mi do mi si mi
   la, mi' sol, mi' fad, mi'\mbreak
   mi, mi' re, mi' do, mi'
   
   %34
   si, fad'' red fad si, red
   mi4 r r
   mi16 red mi fad mi red mi fad mi red mi sol
   
   %37
   fad8 red si fad si red
   fad16 mi fad la fad mi fad la fad mi fad la\mbreak
   sol8 mi mi16 red mi fad mi red mi fad
   
   %40
   mi re! mi fa mi re mi fa mi re mi fa
   mi8 do la mi do' mi
   re16 do re mi re do re mi re do re mi
   
   %43
   re8 si sol re si' re
   mi16 re mi fa mi re mi fa mi re mi fa\mbreak
   re do re mi re do re mi re do re mi 
   
   %46
   do8 sol' mi sol re sol
   mi4 r r
   R2.
   
   %49
   sol16 fad sol la sol fad sol la sol fad sol la
   fad8 re la fad la re
   la'16 sol la si la sol la si la sol la si\mbreak
   
   %52
   sol fad sol la sol fad sol la sol fad sol la
   fad mi fad sol fad mi fad sol fad mi fad la
   sol fad sol la sol fad sol la sol fad sol la
   
   %55
   fad8[re re re, re' do16 si]
   do8[do do re, do' si16 la]
   si8[si si re, si' la16 sol]
   
   %58
   la8[la la re, la' sol16 fad]
   sol8 sol' mi sol re sol\mbreak
   do, sol' si, sol' la, sol'
   
   %61
   sol,8 sol' sol16 fad sol la sol fad sol la
   fad mi fad sol fad mi fad sol fad mi fad re
   si8 sol' mi sol re sol
   
   %64
   do, sol' si, sol' la, sol'
   sol, sol' sol16 fad sol la sol fad sol la
   fad mi fad sol fad mi fad sol fad mi fad re
   
   %67
   si2.\fermata

}

XIIvlan = \relative do' {
   
   si4 si si
   si si si
   si si si
   
   %4
   si si si
   re re re
   re re re
   
   %7
   re re re
   re re re\mbreak
   re sol sol,
   
   %10
   re' re' re,
   sol, sol' sol,
   re'8[re' re re, re' do16 si]
   
   %13
   do8[do do re, do' si16 la]
   si8[si si re, si' la16 sol]
   la8[la la re, la' sol16 fad]
   
   %16
   sol4 mi' re\mbreak
   do si la
   sol fad mi
   
   %19
   re re re
   si si si
   si si si
   
   %22
   dod dod dod
   \once\set suggestAccidentals = ##t dod? dod dod
   re re re\mbreak
   
   %25
   red red red
   si mi mi,
   si' si' si,
   
   %28
   mi8[mi' mi mi, mi' re?16 do?]
   re8[re re mi, re' do16 si]
   do8[do do mi, do' si16 la]
   
   %31
   si4 do si
   la sol fad\mbreak
   mi re do
   
   %34
   si si' si,
   si sol' sol
   sol sol sol
   
   %37
   red red red
   \once\set suggestAccidentals = ##t red red red\mbreak
   si si' si
   
   %40
   si si si
   do do do
   la la la
   
   %43
   si si si
   do do do\mbreak
   re sol, sol
   
   %46
   sol sol sol
   sol r r
   si, si si
   
   %49
   si si si
   re re re
   re re re\mbreak
   
   %52
   sol, sol' sol, 
   re' re' re,
   sol, sol' sol,
   
   %55
   do8[re' re re, re' do16 si]
   do8[do do re, do' si16 la]
   si8[si si re, si' la16 sol]
   
   %58
   la8[la la re, la' sol16 fad]
   sol4 mi' re\mbreak
   do si la
   
   %61
   sol re re
   re re re
   re mi' re
   
   %64
   do  si la
   sol re re
   re re re
   
   %67
   re2.\fermata
   
}


XIIbcn = \relative do {
   
   sol4 sol' sol,
   sol sol' sol,
   sol sol' sol,
   
   %4
   sol sol' sol,
   fad re' re,
   re re' re,
   
   %7
   re re' re,
   re re' re,
   sol r r
   
   %10
   R2.*2
   r8 re'' [re re, re' do16 si]
   
   %13
   do8[do do re, do' si16 la]
   si8[si si re, si' la16 sol]
   la8[la la re, la' sol16 fad]
   
   %16
   sol4 mi' re\mbreak
   do si la
   sol fad mi
   
   %19
   re re' re,
   sol, sol' sol,
   sol sol' sol,
   
   %22
   la la' la,
   la la' la,
   re, re' re,\mbreak
   
   %25
   si' si' si,
   mi, r r
   R2.
   
   %28
   r8 mi'' [mi mi, mi' re16 do]
   re8[re re mi, re' do16 si]
   do8[do do mi, do' si16 la]
   
   %31
   si4 do si
   la sol fad\mbreak
   mi re do
   
   %34
   si si' si,
   mi, mi' mi,
   mi mi' mi,
   
   %37
   si' si' si,
   si si' si,\mbreak
   mi mi' mi,
   
   %40
   mi mi' mi,
   la, la' la,
   re re' re,
   
   %43
   sol, sol' sol,
   do do' do,\mbreak
   re si sol
   
   %46
   do sol' sol,
   do16 sol' fad! mi re mi re do si do si la
   sol4 sol' sol,
   
   %49
   sol sol' sol,
   re re' re,
   re re' re,\mbreak
   
   %52
   sol r r
   R2.*2
   r8 re'' [re re, re' do16 si]
   
   %56
   do8[do do re, do' si16 la]
   si8[si si re, si' la16 sol]
   
   %58
   la8[la la re, la' sol16 fad]
   sol4 mi' re\mbreak
   do si la
   
   %61
   sol sol, sol'
   re' re, re'
   sol, mi' re
   
   %64
   do si la
   sol sol, sol'
   re' re, re,
   
   %67
   sol2.\fermata
   
}

XIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2.*21
    <7 _+>2.
    s
    s
    <7 _+>
    s2.*11
    <_+>2.
    s2.*7
    <_!>2 <7!>4
    s <5 4> <3>
}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key sol\major
    \tempo 2 = 60
    s2.*67
    \bar"|."

}



XIIvlI = {
    \global
    %\notypeset
    <<\XIIvlIn \forma>>

}

XIIvlII = {
    \global
    <<\XIIvlIIn \forma>>

}


XIIvla = {
    \global
    \clef alto
    <<\XIIvlan \forma>>

}

XIIbc = {
    \global
    \clef bass
    <<\XIIbcn \forma \XIIbfn>>
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
        title = \markup\smaller{Concerto di Parigi n. 4 in Fa maggiore [RV 136]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

%\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[2.] And[ant]e }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\column  {"[Violino I]""[Violino 2]"}
                \set Staff.shortInstrumentName = "vl"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

%\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[3.] All[egr]o  - Minuet}

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \header {
        title = \markup\smaller{Concerto di Parigi n. 7 in La maggiore [RV 160]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[2.] And[ant]e }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

%\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Concerto di Parigi n. 9 in Sib maggiore [RV 164]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \VIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \VIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \VIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \VIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[2.] Ad[agi]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \VIIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \VIIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \VIIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \IXvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \IXvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IXvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IXbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \header {
        title = \markup\smaller{Concerto di Parigi n. 11 in Sol maggiore [RV 150]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \XvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \XvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Xvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Xbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[2.] Largo }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \XIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \XIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \XIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \XIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \set Staff.shortInstrumentName = "vl1"
                \XIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \XIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \XIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \XIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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