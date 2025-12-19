\language "italiano"
%********************************** VARIABILI

\version "2.24.0"

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
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IvlIn = \relative do'' {

    sol'4 r8 lab lab16(fad) sol4 lab8
    lab?16(fad) sol4 fa8 mib mi fa sol
    lab sol fa mib mib re r4

    %4
    sib' mib,8 sol sol fa r4
    do' fa,8 lab lab sol r sol\mbreak
    lab la sib reb do sib lab sol

    %7
    fa4 r fa sib,8 lab'
    lab? sol r sol la sib lab sol
    lab fa do'2 sib4~

    %10
    sib8 la la sol fad sol16 fad sol8 la16 sol
    la8 sib16 la la8\tr sol sol4 mib~
    mib re mib r

    %13
    re r8 sol\mbreak mi do4 fa8
    \grace mib re sib4 mib8 \grace re do re16 mib re8 do
    si do16 si do8 re16 do re8 mib16 re mib8 fa16 mi

    %16
    fa(mi fa8) r fa mib re16 do \grace do si8. do16
    do4 r8 do si do mib,[re]
    do4 sol' r fa

    %19
    sol1\fermata

}

IvlIIn = \relative do'' {
   
   mib4 r8 mib re4 mib
   re si do8 reb do sib?
   lab do si do do si r4
   
   %4
   sol' r8 mib mib re r4
   lab'4 r8 fa fa mi r do\mbreak
   do solb' fa mi fa reb do4
   
   %7
   lab8 lab lab lab fa fa fa fa
   mib mib mib mib fa fa fa mi
   fa fa lab sol fad fad sol sol
   
   %10
   mib mib mib mib re re re re
   fad sol4 fad8 sol4 r
   fa'4.~\tuplet 3/2 { fa16 sol lab } sol8 sol, do4~
   
   %13
   do sib~\mbreak sib lab~
   lab sol2 fa4~
   fa mib si do
   
   %16
   re r8 re' do16 sol fa mib re8. do16
   do4 r8 do re do4 si8
   do4 re r do
   
   %19
   si1\fermata
   
}

Ivlan = \relative do' {
   
   do4 r8 do re4 do
   re sol~sol8 sol do, mi
   fa do re sol sol4 r
   
   %4
   R1
   fa4 r8 do' do4 r8 do\mbreak
   lab do re sol, lab fa4 mi8
   
   %7
   fa fa do' do sib sib sib sib
   sib sib sib sib do sib do do,
   do do fa sol la! re, sib re
   
   %10
   sol do do do la la sol re
   do re re re sib4 r8 sib'
   do4 sib sib r8 sol
   
   %13
   lab fa sol4~\mbreak sol8 do do, lab'
   fa sib sib, re mib lab lab, fa'
   re4 sol sol,2
   
   %16
   lab4 r8 lab sol16 sol' lab do sol8 sol
   fad4 r8 fa fa mib sol, fa
   mib4 re r fa
   
   %19
   re1\fermata

}


Ibcn = \relative do {

    do4 r8 do' si4 do
    si sol do8 sib lab sol
    fa mib re do sol' sol, r4

    %4
    mib' r8 mib sib' sib, r4
    fa' r8 fa do' do, \clef tenor\key sib\major r8 mi'
    fa mib reb sib lab sib do do,

    %7
    \clef bass\key sib\major fa fa mib mib re re re re
    mib mib, \clef tenor\key sib\major mib''4~mib8 reb do do,
    fa fa fa' mib re? re, sol sib

    %10
    do do, do'2 sib4
    la8 sol re' re, sol4\clef bass\key sib\major r8 sol
    lab mib sib' sib, mib4 r8 mib

    %13
    fa re sol sol,\mbreak do mi fa fa,
    sib re mib mib, lab2
    sol sol

    %16
    si4 r8 si do fa sol sol,
    la!4 r8 la sol do sol'[sol,]
    do4 sib r lab

    %19
    sol1\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s4 s8 <6-> <7> <6> <5-> <6>
    s2 s8 <6 4!> <6> <6>
    <_-> <6> <6!>4 <6 4>8 <5 3!> s4
    s1
    <_->2 <6 4>8 <5 3!> s4\mbreak
    s1
    <_->4 <6 4>
    <6> <5->
    <4>8 <5 3> s4 s2
    s1*3
    <6 5>2 s4 s8 <6>
    <6 5 _->4 <_-> <7> <6>
    <7-> s <7> <6>
    <7>2 <4>4 <6>
    s2 s8 <_-> <4> <3!>
    s4 s8 <3-> <7 3!>4 <6 4>8 <5 3!>
    s4 <6> s <6>
    
}

forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 50
    s1*19
    \bar"|."

}



IvlI = {
    \global
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

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {
   
   r8 sol' lab sol lab mib
   fa fa sol fa sol re
   mib2 mib4
   
   %4
   re mi2
   fa4 do re
   mib sib mib~
   
   %7
   mib re2~
   re4 do2~
   do4 sib2\mbreak
   
   %10
   la2.
   sol
   re'
   
   %13
   sol,4 do2
   fa, re4
   do2.
   
   %16
   sib2 sib'4
   la2 lab4
   sol do,2
   
   %19
   lab4 sol2\mbreak
   r8 sol'' do si do re
   si sol sib la sib do
   
   %22
   la fa lab sol lab sib
   sol4 sol la!
   sib fa sol
   
   %25
   lab lab si
   do do,2
   re4 si2
   
   %28
   do4 sol la
   fad sol2
   mib4 re2\mbreak
   
   %31
   R2.*2
   r8 sol' lab sol lab mib
   fa fa sol fa sol re
   
   %35
   mib2 sol4~
   sol fad2
   sol4 re fa!~
   
   %38
   fa mi2
   fa4 do mib!~
   mib re re\mbreak
   
   %41
   do2 sib4
   la re do~
   do8 sib do la sib4~
   
   %44
   sib8 la sib sol la4~
   la re do
   sib la2\tr 
   
   %47
   sol4 si do
   re mib do
   sol' re mi
   
   %50
   fa do re
   mib! sib mib
   r mi fa
   
   %53
   sol lab fa
   do' sol la!
   sib fa sol
   
   %56
   lab mib lab
   lab? sol2
   lab8 do, fa mi fa sol
   
   %59
   mib!4. re8 mib fa
   re2 do4~\mbreak
   do si re~
   re do mib~
   
   %63
   mib re fa~
   fa mib sol~
   sol fa lab~
   
   %66
   lab sol fa
   sol fa2\tr 
   mib8 sib mib re mib fa
   
   %69
   re4 fa sol
   lab8 do, fa mi fa sol\mbreak
   mib!4 sol la!
   
   %72
   sib8 re, mib re mib sib
   do do re do re la
   sib sol sib re sol fa
   
   %75
   mib do fa mib re do 
   re sib re fa sib la
   sol fa mib re do sib
   
   %78
   la re re re re re
   re re re re re re
   sol4 sol, la\mbreak
   
   %81
   sib la do~
   do si re~
   re do mib~
   
   %84
   mib re fa~
   fa mib sol~
   sol fa8 mib re do
   
   %87
   fa4 mib2
   re4 re'2~
   re8 sol, do si do re
   
   %90
   si2.\mbreak
   r8 sol sib! la sib do
   la2.
   
   %93
   r8 fa lab sol lab sib
   sol4 mib2
   re re4~
   
   %96
   re do2~
   do8 re si2
   do2.
   
   %99
   r8 do fa mi fa sol\mbreak
   mi sol lab sol lab sib
   sol lab sol fa sol mib
   
   %102
   fa sol fa mib fa re
   mib fa mib re mib do
   lab4 r r
   
   %105
   sol8 do sib lab sol fa
   mib4 re2\tr 
   do2.
   
}

IIvlIIn = \relative do'' {
   
   R2.*8
   r8 re mib re mib sib\mbreak
   do do re do re la
   
   %11
   sib2 sib4
   la si2
   do4 sol la
   
   %14
   sib! fa sib~
   sib la2~
   la4 sol2~
   
   %17
   sol4 fa2~
   fa4 mib2
   re2.\mbreak
   
   %20
   do4 sol' lab
   sol2.
   do,4 fa2
   
   %23
   sib,4 sib' do
   re re mi
   fa fa,2
   
   %26
   r8 do' sol' fad sol la
   fad re fa mi fa sol
   mi do mib re mib fa
   
   %29
   re4 sol2~
   sol4 fad la~
   la sol sib~
   
   %32
   sib la8 sib do4
   si do2
   re4 re,2~
   
   %35
   re4 do mib
   re2.~
   re
   
   %38
   do~
   do2 la4
   fa2 re4\mbreak
   
   %41
   mi fad sol
   fad sib la~
   la la sol
   
   %44
   sol sol fad~
   fad sol2~
   sol4 fad2
   
   %47
   sol4 sol la
   si do2
   sol2.
   
   %50
   fa\mbreak
   mib2 sib'4
   do sib lab
   
   %53
   sol fa lab'
   sol do,2
   fa4 sib,2
   
   %56
   mib do4
   reb sib2
   lab2.
   
   %59
   r8 sol do si do re
   \grace do4 si2 r4\mbreak
   R2.*8
   
   %69
   r4 re mi
   fa r r\mbreak
   r mib! fad
   
   %72
   sol sol, sol'~
   sol fad la~
   la sol sib~
   
   %75
   sib la do~
   do sib re~
   re do8 sib la sol
   
   %78
   fad4 sol2
   la re,4~
   re do2\mbreak
   
   %81
   re re,4
   mib(re) fa
   mib2 sol4~
   
   %84
   sol fa lab
   sol2 mib4
   do2 fa4
   
   %87
   re do2
   lab4 sol2
   R2.
   
   %90
   r8 re'' fa mi fa sol\mbreak
   mi2.
   r8 do mib! re mib fa
   
   %93
   re2.
   r8 sol lab sol lab mib
   fa fa sol fa sol re
   
   %96
   mib re mib sol mib do
   lab fa'mib4 re
   r8 do fa mi fa sol
   
   %99
   mi sol lab sol lab sib\mbreak
   sol mi fa mi fa4~
   fa mib!2~
   
   %102
   mib4 re2~
   re4 do2
   fa,4 r r
   
   %105
   mib do2~
   do4 si2
   do2.

}

IIvlan = \relative do' {
   
   R2.*2
   r8 sol do si do re
   si sol sib la sib do
   
   %5
   la fa lab sol lab sib
   sol2 sol4
   la! si sol
   
   %8
   do2 mi4
   fad sol2\mbreak
   sol4 fad2
   
   %11
   sol2.
   re
   do
   
   %14
   R2.*4
   r8 sol' lab sol lab mib
   fa fa sol fa sol re\mbreak
   
   %20
   mib2 mib4
   re mi2\tr 
   fa4 do re
   
   %23
   mib2.
   re4 sib2
   do4 do re
   
   %26
   mib2.
   re
   do2 do'4~
   
   %29
   do sib2
   la fad4\mbreak
   re2 sol4~
   
   %32
   sol fad2
   fa!4 mib!2
   lab4 sol sol,
   
   %35
   r8 sol' do si do re
   sib!4 la do~
   do si2
   
   %38
   r8 sol sib! la sib do
   la sol la sib do la
   sib2 fa4\mbreak
   
   %41
   sol la la
   re,2.~
   re~
   
   %44
   re~
   re2 mib!4
   re re2
   
   %47
   re4 r r
   r8 sol, do si do re
   si sol sib la sib do
   
   %50
   la fa lab sol lab sib\mbreak
   sol2 sol'4
   lab sol fa
   
   %53
   mi do2
   sol' do4
   sib2.
   
   %56
   mib,
   fa4 mib2
   do2.
   
   %59
   R
   r8 sol' lab sol lab mib\mbreak
   fa fa sol fa sol re
   
   %62
   mib do mib sol do sib
   lab fa sib lab sol fa
   sol mib sol fa mib sol
   
   %65
   lab sol lab sol fa mib
   re4 mib lab
   sib sib,2
   
   %68
   mib4 sol la!
   sib r r
   r lab si\mbreak
   
   %71
   do4 r r
   R2.*6
   r8 re, sib la sib do
   
   %79
   la re la sol la sib
   sol4 sol'2~\mbreak
   sol4 fad2
   
   %82
   sol2.
   sol
   sib
   
   %85
   sib
   lab
   r8 mib lab sol lab mib
   
   %88
   fa fa sol fa sol re
   mib2.
   re\mbreak
   
   %91
   do~
   do 
   sib~
   
   %94
   sib4 mib2
   lab4 sol2~
   sol sol,4
   
   %97
   lab sol sol'
   lab2.
   sol4 do2\mbreak
   
   %100
   do,2.~
   do~
   do~
   
   %103
   do
   re4 r r
   do2 lab4
   
   %106
   sol2. 
   sol
   
}


IIbcn = \relative do {
   
   R2.*2
   \clef tenor\key sib\major r8 sol' do si do re
   si sol sib la sib do
   
   %5
   la fa lab sol lab sib
   sol2 sol4
   la! si sol
   
   %8
   do2 mi4
   fad sol2\mbreak
   sol4 fad2
   
   %11
   sol8\clef bass\key sib\major sol,, sol' fad sol la
   fad re fa mib! fa sol
   mi do mib re mib fa
   
   %14
   re2 re4
   mi fad2
   sol4 sib, do
   
   %17
   re2.
   si4 do2~
   do4 si2\mbreak
   
   %20
   do4 mib fa
   sol2.
   fa
   
   %23
   mib
   sib
   fa'
   
   %26
   do
   R2.*2
   r8 re mib re mib sib
   
   %30
   do do re do re la\mbreak
   sib2 sol4
   re'2. 
   
   %33
   sol4 do, do'~
   do si2
   do4 do,2
   
   %36
   re2.
   sol,
   do
   
   %39
   fa,
   sib2 sib'4~\mbreak
   sib la sol
   
   %42
   re2 r4
   re2 r4
   re2 r4
   
   %45
   re sib do
   re re,2
   sol4 r r
   
   %48
   \clef tenor \key sib\major r8 sol' do si do re
   si sol sib la sib do
   la fa lab sol lab sib\mbreak
   
   %51
   sol2 r4
   R2.
   \clef bass \key sib\major r8 do, fa mi fa sol
   
   %54
   mi do mib re mib fa
   re sib reb do reb mib
   do2 do4 
   
   %57
   sib mib mib,
   lab2.
   sol
   
   %60
   sol2 r4\mbreak
   R2.*7
   mib'2.
   
   %69
   sib
   fa'\mbreak
   do
   
   %72
   sol'4 r r
   R2.*5
   r8 re sol fad sol la
   
   %79
   fad re fa mi fa sol
   mi do mib re mib fa\mbreak
   re2.
   
   %82
   sol,
   do
   sib
   
   %85
   mib
   fa 
   si,4 do2~
   
   %88
   do4 si2
   do4 mib fa
   sol2.\mbreak
   
   %91
   do,
   fa
   sib,
   
   %94
   mib4 do2~
   do4 si2
   do mib4
   
   %97
   fa sol sol,
   \repeat unfold 5 {do2.~}
   do2.
   
   %104
   si4 r r
   do fa2
   sol4 sol,2
   
   %107
   do2.
   
}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2.*11
    <6>4 <6 4\+> s
    <6>4 <6 4>2
    <6>2.
    <6 5>4 <6 5>2
    <9>4 <6>2
    <6 4>4 <5 3>2
    <6 5>2.
    <6- 4 2>
    s4 <6> <_->
    <_!> <6! _->2
    <_!>4 <_-> <6>
    <5 3> s <6 4+>
    s2 <6 4!>4
    <_->2 <6 4!>4
    s2.*3
    s8 <6 5 _+> s2
    <6 5>4 <_+>2
    <7>4 <6>2
    <6 4>4 <7 3+>2
    <7- _+>2 <6>4
    <4 2> <6>2
    s2.
    <6 4>4 <7 3+>2
    <5 4>4 <7 3!>2
    <4>4 <7- 3!>2
    <_!>2 <7->4
    <4> <3>2
    <4! 2>2.
    <_+>
    <7 _+>
    <6 4>
    <5 _+>4 <6>2
    <6 4>4 <5 _+>2
    s2.*4
    <_->2.
    s
    s8 <_!> s2
    <6> <6 4>4
    <6>2 <6 4>4
    <6->2.
    <_->4 <_->2
    <5>4 <6>2
    s4 <6 4>2
    <_!>2.
    s2.*8
    <5 3>2 <6 4!>4
    <_->2 <6 4!>4
    <_->2 <6 4+>4
    s2.*6
    s8 <_+> s2
    <6>2.
    <7>4 <6>2
    <6 4>4 <5 3+>2
    <6 4>4 <7 5 _!>2
    <9>4 <8>2
    <6 4>4 <5 3> <7->
    <9 3> <8 3>2
    <9 _->4 <8>2
    <6 5>2.
    <6- 2>4 <6>2
    s2.
    <7 _!>
    <_!>4 <7->2
    <5 3>4 <7->2
    <5 3>4 <7->2
    s4 <6->2
    <4- 2>4 <6>2
    s2.
    <_->4 <_!>2
    <6- 4>2.
    <_!>4 <6- 4>2<5 3!>4 <6- 4>2
    <4>4 <3->2
    <4 3->4 <9>2
    <9 3>4 <8>2
    <7- 5>2.
    s4 <_->2
    <6 4>4 <5 3!>2

}

forma = {

    \time 3/4
    \key sib\major
    \tempo 2. = 60
    s2.*107
    \bar"|."

}



IIvlI = {
    \global
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

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

}




global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

   re2 sol2. mib4
   do2. la'4 fad re
   sib la sol1

   %4
   R1.
   r2 fa' sib
   sib\tr la1

   %7
   r2 sol do
   do\tr sib1\mbreak
   r2 re, sib

   %10
   sol1.
   sol2 sol'1
   fad1.

   %13
   la,2 re2. do4
   sib la sol la si2
   do mi fa~

   %16
   fa4 sol mi do sol'2~\mbreak
   sol4 do, fa2. mib4
   re2. mib4 fa2~

   %19
   fa4 sib, mib mib, mib'2~
   mib4 fa, re' re, re'2~
   re4 sol, do do, do'2~

   %22
   do4 re si1
   do2 lab sol~\mbreak
   sol4 lab fa1\tr

   %25
   sol1.\fermata

}

IIIvlIIn = \relative do'' {

   R1.*2
   r2 re sol
   mib2. do'4 la fa

   %5
   re(do) sib1
   r2 do fa
   fa\tr mib1

   %8
   r2 re sol\mbreak
   sol\tr fad1
   r2 sol mib

   %11
   dod1.
   re
   R

   %14
   re2 sol2. fa4
   mib(re) do1
   r2 sol do4(sib)\mbreak

   %17
   lab2. sib4 do2~
   do4 fa, sib2. lab4
   sol2. sol'4 lab sol

   %20
   fa2. fa4 sol fa
   mib2. mib4 fa mib
   re1 re2

   %23
   sol do, si\mbreak
   do do,1
   si1.\fermata

}

IIIvlan = \relative do' {

   R1.*12
   r2 r re
   sol4(fa) mib2 re

   %15
   mib4(fa) sol2 fa
   sib, do1\mbreak
   do2 do'4(sib) lab sol

   %18
   fa1 re2
   sib1.
   sib1 re2
   
   %21
   sol,1 sol'2
   lab sol1
   sol2 fa mib\mbreak
   
   %24
   do1 fa,2
   re1.\fermata

}


IIIbcn = \relative do {

   sol'2 sib sol
   la fad re
   sol sib sol

   %4
   do la fa
   sib re, sib
   fa'1.

   %7
   do'
   sol\mbreak
   re'2 re,1

   %10
   mib!1.
   mi
   re

   %13
   \clef tenor\key sib\major r2 r re'
   sol4 fa mib2 \clef bass\key sib\major sol,
   do2. sib4lab2

   %16
   sol do, mi\mbreak
   fa2. sol4 lab2
   sib sib,4 do re sib

   %19
   mib1 mib2
   sib1 si2
   do mib do

   %22
   fa sol fa
   mi fa sol\mbreak
   lab lab,1

   %25
   sol1.\fermata

}

IIIbfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1.*13
   s1 <_!>2
   s2. <4!>4 <6>2
   <7> <_!> <6 5>
   <_->2 s <6 5>
   <9> <8> s
   <9> <8> s
   <5 4> <3> <6 5>
   <9> <6> s
   <6 5 _-> <_!> s
   <6 3> <_-> <6 _!>
   <7>2 <6>1
   <_!>

}

forma = {

   \time 3/2
   \key sib\major
   \tempo 1 = 50
   s1.*25
   \bar"|."

}



IIIvlI = {
   \global
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

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    sol'4. lab8
    si,4 do~
    do8[fa mib re]

    %4
    sol, si do4~
    do8[fa mib re]
    mib re16 do fa8 mib16 re

    %7
    sol8 lab16 sol fa mib re do
    si8 sol r4\mbreak
    r16 sol' re sol mib do re mib

    %10
    re8 sol, r mib'~
    mib[re re, fa']~
    fa8[mib mib, sol']~

    %13
    sol[fa fa, lab']~
    lab[sol sol, sib']~
    sib[lab lab sol]

    %16
    fa4 r
    r16 sib fa sib sol mib fa sol\mbreak
    fa8 sib, sib'4~

    %19
    sib lab~
    lab sol~
    sol8 lab16 sol fa8 mib

    %22
    re\grace do sib r sib
    do4 sib8 mib,
    do'4 sib8 mib,

    %25
    do'16 re do sib lab sol fa mib
    lab'4~lab16 sol lab fa
    sol re mib fa\mbreak sib,8 re

    %28 OOKK
    mib4 r8 sib
    do4 sib8 mib,
    do'4 sib8 mib,

    %31
    do'16 re do sib lab sol fa mib
    sib4 r16 lab' sol fa
    mib re mib fa sib,8 re

    %34
    mib4 r
    sol'16 sib sol sib fa sib fa sib\mbreak
    sol4 fa

    %37
    lab16 re lab do sol do sol do
    lab4 sol
    do4. reb8

    %40
    mi,4 fa
    do'4. reb8
    mi,4 fa

    %43
    sib4. reb,8
    do sib' lab sol16 fa\mbreak
    sol4 mi

    %46
    fa do~
    do8[si si, re']~
    re[do do, mib'?]~

    %49
    mib[re re, fa']~
    fa8[mib mib, sol']~
    sol[fa fa mib]

    %52
    mib4 re
    sib'4. do8
    re,4 mib\mbreak

    %55
    sib'4. do8
    re,4 mib
    sol4. lab8

    %58
    si,4 do
    sol'4. lab8
    si,4 do

    %61
    sol' do~
    do sib~
    sib8[la? la sol]

    %64
    fad4 sol\mbreak
    r8 do [sib la]
    sib4 la

    %67
    sol8[sib sol fa]
    mi4 fa
    fa8[lab fa mib]

    %70
    re4 mib8 sol
    fa[mib re do]
    lab'[si, do sol']

    %73
    lab[si, do sol']
    lab[si, do sol']\mbreak
    fa[mib re do]

    %76
    si sol r4
    r16 sol' re sol mib do re mib
    re8 sol, sol'4~

    %79
    sol fa~
    fa mib~
    mib8[re re do]

    %82
    si4 do8 fa
    mib4 re\mbreak
    do r8 sol'

    %85
    fa[(mib) re(do)]
    fa(re) mib4
    fa8(re) mib4

    %88
    fa8[re mib sol]
    fa[mib re do]
    sol'4 r

    %91
    r16 sol re sol mib do re mib
    re8 sol, sol'4~
    sol fa~

    %94
    fa mib~\mbreak
    mib8[re re do]
    si4 do8 fa

    %97
    mib4 re
    do8 lab4 sol8
    fa4 fa'~

    %100
    fa8 mib16 re sol8 fa
    mib4 re
    do r

}

IVvlIIn = \relative do'' {

    R2*7
    r16 sol' re sol mib re mib do\mbreak
    re8 sol, r4

    %10
    r16 sol' re sol mib re mib re
    do sib lab sol fa mib re do
    sib4 r8 mib'~

    %13
    mib[re re, fa']~
    fa[mib mib, sol']~
    sol[fa fa mib]

    %16
    re16 sib' fa sib sol mib fa sol
    fa8 sib, r4\mbreak
    r16 sib' fa sib sol fa sol fa

    %19
    mib re mib re do lab' do, lab'
    fa mib re do sib sol' sib, sol'
    do, sib do sib lab sol lab sol

    %22
    fa8[re' mib mib,]
    do lab mib'4
    do8 lab mib'4

    %25
    do8 lab mib' do
    re[mib fa re]
    sib' [lab\mbreak sol fa]

    %28
    mib4 r8 mib
    do8 lab mib'4
    do8 lab mib'4

    %31
    do2
    sib4 r
    sol8[do sib lab]

    %34
    sol4 r
    R2\mbreak
    mib''4 re

    %37 OOKK
    R2
    fa4 mi
    R2*7

    %46
    r4 r8 mib,?
    re[fa mib re]
    mib4 r8 sol

    %49
    fa[lab sol fa]
    sol4 r8 sib
    sib[lab lab sol]

    %52
    sol4 fa
    R2*4
    mib'4 do

    %58
    sol2
    mib'4 do
    sol2

    %61
    R2*7
    sol'4 lab
    R2

    %70
    fa4 sol
    R2*5
    r16 sol re sol mib do re mib

    %77
    re8 sol, r4
    r16 sol' re sol mib re do sib
    lab sol fa mib re do re do

    %80
    si la? si la sol4
    R2
    r8 re'[mib lab]

    %83
    sol4. fa8\mbreak
    mib4 r
    R2*5

    %90
    r16 sol' re sol mib do re mib
    re8 sol, r4
    r16 sol' re sol mib re do sib

    %93
    lab sol fa mib re do re do
    si la? si la sol4\mbreak
    R2

    %96
    r8 re'[mib lab]
    sol4 sol,
    do r

    %99
    r do
    re do~
    do si

    %102
    do r

}

IVvlan = \relative do' {

    R2*7
    r8 sol' [sol do]\mbreak
    si[sol sol do]\mbreak

    %10
    si[sol sol do]
    lab[fa fa sib?]
    sol4 r8 do,

    %13
    sib4 sib
    sib r
    R2

    %16
    r8 sib[sib mib]
    re[sib sib mib]\mbreak
    re[sib sib mib]

    %19
    do[re mib do]
    re[fa sol mib]
    do4 do'

    %22
    sib r8 sib,
    mib,4 sol
    mib sol

    %25
    mib r8 lab
    fa4 sib
    sib8 [do\mbreak sib lab]

    %28
    sol4 r8 sib
    mib,4 sol
    mib sol

    %31
    mib r8 lab
    fa [mib fa re]
    sib'[lab sol fa]

    %34
    mib4 r
    R2\mbreak
    sib'4 sib

    %37
    R2
    do4 do
    R2*7

    %46
    r8 lab[sol sol']
    lab4 sol
    sol r8 sib

    %49
    do4 sib
    sib r8 sib,
    do4 do

    %52
    sib2
    R2*4
    mib8 fa sol fa16 mib

    %58
    re4 sol8 fa
    mib fa sol fa16 mib
    re4 sol8 fa

    %61
    mib re do4
    R2*6
    do'4 do

    %69
    R2
    sib4 sib
    R2*5

    %76
    r8 sol[sol do]
    si[sol sol do]
    si[sol sol do,]

    %79
    do4 fa
    re r16 do' sol do
    lab sol lab sol fa mib fa mib

    %82
    re do si la? sol8 do
    do4 si\mbreak
    do r

    %85
    R2*5
    r8 sol'[sol do]
    si[sol sol do]

    %92
    si[sol sol  do,]
    do4 fa
    re r16 do' sol do\mbreak

    %95
    lab sol lab sol fa mib fa mib
    re do si la? sol8 do
    do4 si

    %98
    do r
    r do'
    si do

    %101
    sol sol,
    sol r

}


IVbcn = \relative do {

    do8[re mib fa]
    sol[fa mib do]
    fa[re sol fa]

    %4
    mib[re mib do]
    fa[re sol sol,]
    do4 re

    %7
    mib fa
    sol8[si do do,]\mbreak
    sol'[si do do,]

    %10
    sol'[si do do,]
    fa[lab sib sib,]
    mib4 r8 mib

    %13
    sib4 sib
    mib, r8 mib'
    lab[sib do lab]

    %16
    sib,[re mib mib,]
    sib'[re mib mib,]\mbreak
    sib'[re mib sol]

    %19
    lab[sib do lab]
    sib[sib, mib sol,]
    lab[sib do lab]

    %22
    sib4 sol
    lab8[mib' sol, mib']
    lab,[mib' sol, mib']

    %25
    lab,[sib do lab]
    sib[do re sib]
    mib [lab\mbreak sib sib,]

    %28
    mib[fa sol sol,]
    lab8[mib' sol, mib']
    lab,[mib' sol, mib']

    %31
    lab,[sib do lab]
    sib[do re sib]
    mib[lab, sib sib]

    %34
    mib,4 r
    \clef tenor \key sib\major mib''4 re\mbreak
    \clef bass \key sib\major  mib,4 sib

    %37
    \clef tenor \key sib\major fa'' mi
    \clef bass \key sib\major fa, do
    fa8[sol lab sib]

    %40
    do[sib lab sol]
    fa[sol lab sib]
    do[sib lab fa]

    %43
    sol[lab sol fa]
    mi[do fa lab]\mbreak
    sib[sol do do,]

    %46
    fa[fa mib do]
    fa[re sol sol,]
    do4 r8 sol'

    %49
    lab[fa sib sib,]
    mib[fa sol mib]
    lab,[sib do lab]

    %52
    sib4 sib'8 lab
    sol[fa sol lab]
    sib[lab sol fa]\mbreak

    %55
    mib[fa sol lab]
    sib4 mib,
    do8[re mib fa]

    %58
    sol[fa mib re]
    do[re mib fa]
    sol[fa mib re]

    %61
    do[re mib do]
    re[fad sol sib,]
    do[re mib do]

    %64
    re[re' sib sol]\mbreak
    do,[mib' re do]
    re[do re re,]

    %67
    sol4 r
    do fa,
    R2

    %70
    sib4 mib,!
    r r8 mib
    fa[sol lab mib]

    %73
    fa[sol lab mib]
    fa[sol lab mib]\mbreak
    fa4 lab

    %76
    sol8[si do do,]
    sol'[si do do,]
    sol'[si do do,]

    %79
    fa[sol lab fa]
    sol[sol, do mib]
    fa[sol lab fa]

    %82
    sol[fa mib fa]
    sol[fa sol sol,]\mbreak
    do[re mib do]

    %85
    fa4 lab
    si,8[lab' do, sol']
    si,8[lab' do, sol']

    %88
    si,8[lab' do, mib]
    fa4 lab
    sol8[si do do,]

    %91
    sol'[si do do,]
    sol'[si do mib,]
    fa[sol lab fa]

    %94
    sol[sol, do mib]\mbreak
    fa[sol lab fa]
    sol[fa mib fa]

    %97
    sol[fa sol sol,]
    lab4 r
    r lab'

    %100
    sol mib8 fa
    sol4 sol,
    do r

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*10
    <7 _->2
    s
    <6 4>8 <5 3> <5> <7->
    <9> <8 3> s4
    s2*4
    <9>4 <6>
    <7>2
    <7>4 <6- 4>8 <5 3>
    s2*4
    <7>2
    s2*6
    s4 <6 4>8 <5 3>
    s2*4
    <_->4 <_!>
    s2
    <_!>
    s
    <_!>
    s4 s8 <6->
    s2
    s4 <_!>
    s <6>
    <6 5> <_!>
    s s8 <6>
    <6 5>2
    <9>4 <6>
    <9 7>8 <7 5> <6- 4> <7 5>
    <6 4>4 <5 3>
    s2*4
    s4 s8 <_->
    <_!>2
    s4 s8 <_->
    <_!>2
    s2*11
    <_->2
    <_->
    <_->s
    <_!>
    <_!>
    <_!>
    <9 _->
    <7 _!>
    <7 _->8 <7 5> <6 4> <7 5>
    <9>4 <6>8 <_->
    <6 4>4 <5 _!>
    s2*6
    <_!>2
    <_!>
    <_!>
    <9 _->4 <6>
    <_!>2
    <7 _->8 <7 5> <6- 4> <7 5>
    <_!>4 <6>8 <_->
    <6 4>4 <5 _!>
    s2
    s4 <6>
    <7 _!> <6>8 <_->
    <6 4>4 <5 _!>

}

forma = {

    \time 2/4
    \key sib\major
    \tempo 2 = 67
    s2*34
    \bar ":..:"\break
    s2*68
    \bar"|."

}



IVvlI = {
    \global
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

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Concerto a 4 da Op. 2/2}
    composer = \markup \center-column{"F. Geminiani (1687 - 1762)"}

}

\markup\huge {[1.] Adagio}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino"\vspace #-0.3"Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino"\vspace #-0.3"Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"\vspace #-0.3"Basso"\vspace #-0.3"Fagotto"}
            \set Staff.shortInstrumentName = "bc"
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.7
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

%\pageBreak

\markup\huge {[2.] Allegro}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino"\vspace #-0.3"Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino"\vspace #-0.3"Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"\vspace #-0.3"Basso"\vspace #-0.3"Fagotto"}
            \set Staff.shortInstrumentName = "bc"
            \IIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.7
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

\markup\huge {[3.] Adagio}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino"\vspace #-0.3"Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino"\vspace #-0.3"Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IIIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"\vspace #-0.3"Basso"\vspace #-0.3"Fagotto"}
            \set Staff.shortInstrumentName = "bc"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.7
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

\markup\huge {[4.] Allegro}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino"\vspace #-0.3"Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IVvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino"\vspace #-0.3"Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IVvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IVvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"\vspace #-0.3"Basso"\vspace #-0.3"Fagotto"}
            \set Staff.shortInstrumentName = "bc"
            \IVbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.7
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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