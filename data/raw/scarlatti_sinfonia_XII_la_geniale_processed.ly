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
   
   sol'4 r8 sol sol4 r8 fa
   sol sib r sib sib4 r8 do
   do4 r r8 sib16. la32 sib4
   
   %4
   r8 sib16. la32 sib4 r8 do16. do32 sib8 sib
   do4 r8 fa, fa sib16. la32 sib8 sib
   mib, sib' sol mib mib do'16. sib32 lab8 fa\mbreak
   
   %7
   R1
   r8 re' re re re do16. si32 do8 do
   do la16. sib32 do8 do do sib16. la32 sib8 sib
   
   %10
   sib lab16 sol lab8 sol fad re' sol,[do]
   sib4 la? sol r
   r2 r4 r8 lab\mbreak
   
   %13
   lab fa re lab' lab sol16 fa sol4
   r8 fa16. mi32 fa4 r8 re'16. do32 re4
   r2 r8 do16. si32 do4
   
   %16
   r8 do16. sib32 do8 do do2
   re8 sol, do4 sol r8 sol16 fa
   mib8 mib sol4 r8 sol16. la32 sib8 sol
   
   %19
   do4 do, sol'2

}


IvlIn = \relative do'' {
   
   sol'8 mib do[sol] mib do r4
   sib''8 sol mib[sib] sol mib r sol'
   lab lab, lab lab re16. mib32 fa8 r fa
   
   %4
   sol sol, sol sol do16. re32 mi8 r sol
   do lab fa do do16. la!32 sib8 r fa'
   sib sol mib[sib] sib16. sol32 lab8 r lab'\mbreak
   
   %7
   solb16. mi32 fa8 fa, lab\p solb16. mi32 fa8 fa fa'
   fa4 r8 lab,\p sol sol r  mib'?
   mib mib mib mib mib re16. do32 re8 re,
   
   %10
   mib mib mib mib re re re do
   re2 r4 r8 sib''\f 
   sib sol mi[sib'] sib lab16. sol32 lab4\mbreak
   
   %13
   fa,8 re sib'[sib] sib4 r8 sol'
   lab4 r8 la sib4 r8 si
   do sol lab sol16. fa32 mib16. re32 do8 r mi
   
   %16
   fa4 r8 sol lab fa fa,[lab]
   sol sol' r lab mib4 re
   do8 sol mib[do] sol' sol' r sol,
   
   %19
   fa4 fad8. sol16 sol2
   
}

IvlIIn = \relative do'' {
   
   mib8 do r re, do mib r4
   sol'8 mib r fa, mib sol r do
   do4 r8 fa, fa sib r sib16. do32
   
   %4
   re8 re, re re mi16.  fa32 sol8 r mi'
   fa4 r8 fa, fa reb r reb'
   mib4 r 8 mib, mib do r do'\mbreak
   
   %7
   reb do r do,\p reb do r do'
   re?4 r8 fa, \p mib mib r sol
   la la la la sol re sol,[sol]
   
   %10
   do do do do do sib16. la32 sib8 mib
   re sol fad4 sol r8 sol'\f 
   sol mi do[reb] do do do[fa,\p]\mbreak
   
   %13
   re fa r fa mib4 r8 do'
   do4 r8 do re4 r8 re
   mib mib fa[re] do4 r8 do
   
   %16
   do4 r8 do do lab r do
   si do r do do4 si
   do r8 mib, re4 r8 re
   
   %19
   do4 do re2

}

Ivlan = \relative do' {
   
   sol'4 r8 sol sol8. mib16 mib8 sib'
   sib4 r8 sib sib8. lab16 sib8 sol
   sol fa r do re re r fa16. mib!32
   
   %4
   re8 re re sib' sol do, reb[reb]
   do4 r8 do reb fa16. mib32 fa8 sib
   sib4 r8 sib, do mib r fa\mbreak
   
   %7
   reb8 fa r do sib do r lab'
   lab?4 r8 si, do do, r do'
   fad, fad' fad fad sol sol, sol[sol]
   
   %10
   do do do do do sib16. la32 sib8 mib
   re4 re, sol r8 re'\f
   mi4 r8 sol do,[do] fa fa\p\mbreak
   
   %13
   sib,4 r8 re mib mib, mib[\once\stemDown sol']
   sol fa r fa fa4 r8 lab
   sol sol re[sol] sol4 r8 sol
   
   %16
   lab4 r8 sol fa lab lab fa
   re do r do mib fa sol sol,
   sol'4 r8 sol sib4 r8 sib,
   
   %19
   do4 do si2

}

Ivcn = \relative do {
   
   \clef tenor do'4 r8 si do8. do,16 do8 re
   mib4 r8 re mib8. fa16 sol8 mi
   fa4 r8 lab sib re, r re'16. do32
   
   %4
   sib8 sib sib sib sib sib, r sib'
   lab4 r8 la sib sib16. do32 reb8 sib16. lab32
   sol4 r8 sol lab lab16. sol32 fa8 fa\mbreak
   
   %7
   sib lab r lab sib lab r lab
   si,4 r r2
   R1*2
      
   %11
   r2 r8 sol'16. la?32 sib8 sol
   do4 r8 mi fa fa, fa4\mbreak
   r8 sib sib[re] mib4 r8 mi
   
   %14
   fa4 r8 mib! re4 r8 fa
   mib mib si[si] do4 r8 do16. sib?32
   lab4 r8 mi fa4 r8 fa
   
   %17
   fa mib? r fa sol2
   do4 r8 do sib4 r8 sib
   lab4 la sol2

}

Ibcn = \relative do {
   
   do4 r8 si do8. do16 do8 re
   mib4 r8 re mib8. fa16 sol8 mi
   fa4 r8 lab, sib re r re16. do32
   
   %4
   sib8 sib' sib sib sib sib, r sib'
   lab4 r8 la sib sib,16. do32 reb8 sib16. lab32
   sol4 r8 sol' lab lab16. sol32 fa8 fa,\mbreak
   
   %7
   sib lab r lab' sib lab r lab
   si,4 r r2
   R1*2
   
   %11
   r2 r4 r8 sol'
   do,4 r8 mi fa fa, fa4\mbreak
   r2 r4 r8 mi'
   
   %14
   fa4 r8 mib! re4 r8 fa
   mib mib si[si] do4 r8 do'16. sib?32
   lab4 r8 mi fa4 r8 fa 
   
   %17
   fa mib? r fa sol4 sol,
   do r8 do sib4 r8 sib
   lab4 la sol2

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2 s4 s8 <6>
    <5>4 s8 <6> s2
    <_- 9>8 <_- 8> s <6> s <6> s <6>
    <6>2 <4! 2>4 s8 <6 4! 3->
    <6>2 <_- 9>8 <_- 8> <6>4
    <6> s8 <6> <9>8 <8> <_->4
    <6- _->8 <6> s <6> <6-> <6> s <6>
    <7- 5>1
    s1*2
    s2 s4 s8 <_->
    <_! 7>4 s8 <7- 5> <4>4 <3->
    s1
    <_- 9>8 <_- 8> s <6 4!> <6>4 s8 <_- 6 4!>
    <6>4 <7- 5>8 <6> s4 s8 <_!>
    <6>2 <_->4 s8 <_->
    <4! 2> <6> s <_-> <6 4>4 <3>
    s2 <6>4 s8 <6>
    <6>4 <6+> <_!>
    
}


forma = {

    \time 4/4
    \key sol\minor
    \tempo 4 = 45
    s1*19
    \bar "||"

}

Ifl = {
    \notypeset
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



IIfln = \relative do'' {

   R1*20
   r4 sol' sol sol
   lab8 sol lab sol lab4 mib

   %23
   fa lab lab lab
   sib8 lab sib lab sib4 fa\mbreak
   sol sib sib re,

   %26
   mib sib' sib re,
   mib fa8 sol lab4 sib8 do
   sol2 fa

   %29
   mib2 r
   R1*9
   r4 fa fa sol

   %40
   lab8 sol lab sol lab4 mib
   fa lab lab lab
   sib8 lab sib lab sib4 fa

   %43
   sol mib mib mib
   fa8 mib fa mib fa4 do
   re fa fa fa

   %46
   sol8 fa sol fa sol4 re
   mib do r2
   R1*5

   %53
   r4 sib' sib sib
   do8 sib do sib do4 sol
   lab fa r2

   %56
   R1*2
   sib1~
   sib~\mbreak

   %60
   sib
   do~
   do~

   %63
   do
   re~
   re~

   %66
   re
   R1*16
   r2 r4 do

   %84
   re2 re
   do fa,4 sib
   sib sol sib2

   %87
   sib sib
   do1
   re2 do4 fa,

   %90
   sol2 r
   si r\mbreak
   si r

   %93
   sol r
   la r
   la r

   %96
   la r
   sol la
   r r4 do

   %99
   sol2 re'
   do4 mib do2~
   do4 si8 do re2

   %102
   do r\fermata

}


IIvlIn = \relative do'' {

   r4 sol' do, do'
   si sol lab fad
   sol mi fa? re

   %4
   mib! si do fa
   mib2 re
   do sib

   %7
   la4 sib sol la
   fad sol mib? fa?
   re2 mib4 mib'

   %10
   re sol2 fad4
   sol si, do lab'
   sol si do2\mbreak

   %13
   r4 do, fa, si
   do re mib re~
   re do2 si4

   %16
   do2 sib!
   r4 re sol, sol'
   fad re mib do

   %19
   sol' la sib la~
   la sol2 fad4
   sol2 r4 re,\p

   %22
   mib2 r4 lab
   lab?2. mib4
   fa2 r4 sib\mbreak

   %25
   sib sol sol lab
   sib2 r4 lab
   sib sol mib2~

   %28
   mib re2
   r4 sib'' mib, do'
   sib sol lab fa

   %31
   sol2 sol,4 sib
   sib sib'2 la4
   sib2 r

   %34
   r4 do, fa, fa'
   mi do reb si
   do la! sib sol\mbreak

   %37
   lab mi fa sib
   lab2 sol
   lab2 r

   %40
   R1*4
   r4 la? la la,
   sib8 la sib la sib2

   %46
   R1
   r4 sol'' do, do'
   si sol sib2\mbreak

   %49
   la4 fad sol sib
   la4 re, sol, re'
   re,2 do4 sol'

   %52
   sol2 fad
   sol r
   R1

   %55
   r4 lab' lab lab
   sib8 lab sib lab sib4 fa
   sol mib sib sol'

   %58
   fa mib sib sol'
   fa mib sib sol'\mbreak
   fa mi fa sol

   %61
   do, lab' sol fa
   do lab' sol fa
   do re mib do

   %64
   sib sol re' sib'
   la sol re sib'
   la sol re sib'

   %67
   la fad sol2
   r r4 sol
   re re' sol, fad

   %70
   sol mib re mib\mbreak
   re re, la' do~
   do si do2

   %73
   r4 sol' do, do'
   si sol lab fad
   sol mi fa? re

   %76
   mib! si do fa
   mib2 reb
   r4 do fa, fa'

   %79
   mi do reb si
   do sol lab2
   sol4 fa r2\mbreak

   %82
   r4 do' fa, fa'~
   fa mib8 re mib4 mib,
   re re' sol, sol'~

   %85
   sol fa8 mib fa2~
   fa4 mib8 re mib4 sol
   fa sib, fa sib~

   %88
   sib lab8 sol lab4 lab'
   r sol do, do'
   si sol lab fad

   %91
   sol si, do re\mbreak
   sol, sol' lab fad
   sol mi fa? re

   %94
   mib! si do re
   mib si do re
   mib fad sol la

   %97
   si2 do
   r4 do do, do'
   do2 si

   %100
   do4 sol lab do,
   sol2 sol
   sol r\fermata

}

IIvlIIn = \relative do'' {

   R1*5
   r4 do sol sol'
   fad re mib! dod

   %8
   re si do? la
   sib fad sol do
   sib2 la

   %11
   sol4 re' mib2
   r4 sol do, do'\mbreak
   si4 sol lab2

   %14
   r4 sol sol, lab
   sol2 fa
   mib sol

   %17
   la! r
   r4 sol' sol, mib'
   re2. mib4

   %20
   re2 do4 la
   sib2 r4 re,4\p
   do2 r4 do

   %23
   re fa fa do
   re2 r4 re\mbreak
   mib2 r4 fa

   %26
   sol2 r4 fa
   sol mib do lab
   sib2 sib

   %29
   mib r
   R1
   r4 mib' sib sol'

   %32
   fa re mib do
   re re, re' mi
   fa2 r4 lab,

   %35
   sol lab fa sol
   mi fa re mi\mbreak
   fa sol lab fa'

   %38
   fa2 mi
   fa r
   R1

   %41
   r4 fa, fa do
   re2 r
   r4 mib mib sol,

   %44
   la2 r4 fa'
   fa re8 do re2
   r4 re re sol

   %47
   sol mib r2
   r4 re' sol, sol'\mbreak
   fad re mib! dod

   %50
   re si do? la
   sib! fad sol do
   sib2 la

   %53
   sib r
   r4 mi, mi mi
   fa2 fa4 mib!

   %56
   re fa fa sib
   mib,2 r4 mib'
   sib sol' fa mib

   %59
   sib sol' fa mib\mbreak
   sib do reb sib
   lab fa do' lab'

   %62
   sol fa do lab'
   sol fad sol la!
   re, sib' la sol

   %65
   re sib' la sol
   re sib' la sol
   fad re mib! dod

   %68
   re fad sol sib
   la re, mib do
   re la' sib la~\mbreak

   %71
   la sol2 fad4
   sol re mib mib,
   re si' do2

   %74
   re mib!4 re
   r sol do, sol'
   sol,2 fa4 do'

   %77
   do2 sib~
   sib4 lab8 sol lab4 sib
   r do fa, fa'

   %80
   mi do reb si
   do la! sib! sol\mbreak
   lab mi fa lab

   %83
   sol do sol do~
   do sib8 la sib4 sib'
   lab2. sol8 fa

   %86
   sol4 sib, mib, mib'~
   mib reb8 do reb2
   r4 do fa, fa'~

   %89
   fa mib8 re mib4 do
   re si do re
   sol, sol' lab fad\mbreak

   %92
   sol si, do la
   si do re si
   do re mib si

   %95
   do re mib si
   do re mib do
   re2 mib

   %98
   r r4 mib
   mib2 re
   mib4 do do lab

   %101
   mib2 re
   mib r\fermata

}

IIvlan = \relative do' {

   R1*10
   r4 sol' do, do'
   si sol lab fad\mbreak

   %13
   sol mi fa? re
   mib! si do fa
   mib2 re

   %16
   do4 mib re sib'
   la fad sol sib
   la re, do fad

   %19
   sol re' sol, la
   sib2 do4 do,
   re2 r4 sib\p

   %22
   do2 r4 do
   re fa fa do
   re2 r4 re\mbreak

   %25
   mib2 r4 fa
   sol2 r4 fa
   sol mib do lab

   %28
   sib2 sib
   mib4 sol sib mib,
   mib mib2 re4

   %31
   mib2 r
   R1
   r4 sib' fa sib

   %34
   lab2 r
   R1*2\mbreak
   r4 do do sib

   %38
   do2 do
   r4 do fa, mi
   fa fa, r2

   %41
   r4 fa' fa do
   re re, re'2
   r4 mib mib sol,

   %44
   la la' la la,
   sib8 la sib la sib2
   r4 si si si

   %47
   do2 sib'!
   sol r\mbreak
   r4 la sib sol

   %50
   la sol sol la
   sol la8 sib do4 mib,!
   re2 re

   %53
   re r
   r4 sol sol sol
   sol fa fa, do'

   %56
   fa sib sib, sib
   sib2 r
   r4 mib re mib

   %59
   r mib re mib\mbreak
   fa sol sib, mi
   r fa mi fa

   %62
   r fa mi fa
   sol la do, fad
   r sol fad sol

   %65
   r sol fad sol
   r sol fad sol
   re la' sib2

   %68
   la4 re sol,2
   r4 sol mib2
   sib4 do sib mib\mbreak

   %71
   sib'2 do4 do,
   sol'2 sol4 lab
   sol2 fa

   %74
   re4 si' do la?
   re, do2 re4
   do re fa lab

   %77
   sol1
   do,2. sib4
   sol'2 r

   %80
   r4 mi fa2
   sol4 do, fa do'\mbreak
   fa, sol fa do

   %83
   do2 mib4 sol
   la!2 re,
   mib sib'

   %86
   sib, sib4 sib'
   sib2 r4 fa
   do2 do

   %89
   sol' sol4 lab
   re,2 r
   re r\mbreak

   %92
   re r
   re r
   la'? r

   %95
   la r
   la r
   re, la'

   %98
   r r4 la
   sol2 sol
   sol4 mib fa do

   %101
   do2 si
   do r\fermata

}

IIvcn = \relative do {

   \clef tenor
   R1*15
   r4 do' sol sol'
   fad re mib! dod

   %18
   re si do! la
   sib! fad sol do
   sib2 la

   %21
   sol r
   R1*7
   r4 mib sol lab

   %30
   sol2 fa4 sib
   mib,2 r4 mib'
   re2 do4 fa,

   %33
   sib2 r4 sol
   fa2 r
   R1*2\mbreak

   %37
   r4 do' fa, reb'
   do2 do,
   fa r

   %40
   r4 fa' fa do
   re re, r2
   r4 re' re re,

   %43
   mib2 r
   R1*2
   r4 si' si si

   %47
   do2 lab
   sol r\mbreak
   r4 re sol, sol'
   fad sol mi fad

   %51
   sol re mib! do
   re re' re,2
   sol re'

   %54
   r4 mi mi mi
   fa2 r4 do
   re4 re, re re
   mib2 r4 mib'

   %58
   re mib r mib
   re mib r mib\mbreak
   reb do sib sol

   %61
   fa2 r4 fa'
   mi fa r fa
   mib! re do la!

   %64
   sol2 r4 sol'
   fad sol r sol
   fad sol r2

   %67
   r4 re sol, sol'
   fad re mib! dod

   %69
   re si do? la
   sib! fad sol do\mbreak
   sib2 la

   %72
   r4 sol do, do'
   si sol lab2
   sol do4 re

   %75
   si do la si
   do sol lab fa
   sol sol' fa fa,

   %78
   mi mi' fa reb
   do2 r
   r4 do fa, fa'

   %81
   mi fa re mi\mbreak
   fa do lab2
   do2 do,4 do'

   %84
   fad,2 sol4 sol
   do do, re re'
   mib mib, sol4 mib

   %87
   sib' sib, sib sib'
   mi,2 fa4 fa
   si2 do4 lab

   %90
   sol2 r
   sol r\mbreak
   sol r

   %93
   sol r
   fad r
   fad r

   %96
   fad' r
   sol fad
   r r4 fad

   %99
   sol2 sol,
   do r4 fa,?
   sol2 sol,

   %102
   do r\fermata

}

IIbcn = \relative do {

   R1*15
   r4 do sol sol'
   fad re mib! dod

   %18
   re si do! la
   sib! fad sol do
   sib2 la

   %21
   sol r
   R1*7
   r4 mib' sol lab

   %30
   sol2 fa4 sib,
   mib2 r4 mib
   re2 do4 fa

   %33
   sib,2 r4 sol'
   fa2 r
   R1*2\mbreak

   %37
   r4 do' fa, reb'
   do2 do,
   fa r

   %40
   R1*9\mbreak
   r4 re sol, sol'
   fad sol mi fad

   %51
   sol re mib! do
   re2 re,
   sol r

   %54
   R1*2
   r4 re' re re
   mib2 r

   %58
   R1*9
   r4 re sol, sol'
   fad re mib! dod

   %69
   re si do? la
   sib! fad sol do\mbreak
   sib2 la

   %72
   r4 sol' do, do'
   si sol lab2
   sol do,4 re

   %75
   si do la si
   do sol' lab fa
   sol2 fa

   %78
   mi fa4 reb
   do2 r
   r4 do fa, fa'

   %81
   mi fa re mi\mbreak
   fa do lab2
   do do'

   %84
   fad, sol
   do, re
   mib sol4 mib

   %87
   sib'2 sib,
   mi fa
   si, do4 lab'

   %90
   sol2 r
   sol r\mbreak
   sol r

   %93
   sol r
   fad r
   fad r

   %96
   fad r
   sol fad
   r r4 fad

   %99
   sol2 sol,
   do r4 fa?
   sol2 sol,

   %102
   do r\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*15
    s2 <_->
    s <6>4 <7 5>
    <_+>2 <_->4 <6+>
    <6>2 s4 <6>
    <7> <6> <7> <6+>
    s1*8
    s2 <6>
    <6> <_- 7>
    s1
    <6>2 <7>
    s s4 <6!>
    <_->1
    s1*2
    s4 <_!> <_-> <6>
    <6- 4>2 <3>
    s1*10
    s4 <_+> <6-> <4+ 3>
    s <_!> <6>2
    <_->4 <_+> <6>2
    <6 4> <3>
    s1*3
    s4 <6> s2
    s1*10
    s4 <_+> <6-> <_- 4+>
    s2  s4 <7 5>
    <_+>2 s4 <6+>
    <6> <7 5> s <6>
    <7>4 <6> <7> <6+>
    s <_!> <5> <6->
    s2 <6>
    <_!>2 <6->4 <_+>
    s <_!> <6>2
    s4 <_!> <6>2
    <6 4>2 <2 6- 4>
    s s4 <6>
    <_!>1
    s4 <_!> <6-> <_- 4!>
    s <_!> <6>2
    <_->4 <_!> <6>2
    <4->4 <3-> s2
    <6 5>1
    <6- 5>2 <6 5->
    <9>4 <8> <6> s
    <4> <3-> <_->2
    <6 5>2 <_->
    <6 5> s4 <6>
    <_!>1
    <_!>
    <_!>
    <_!>
    <7 5>
    <7 5>
    <7 5>
    <_!>2 <7 5>
    s s4 <7 5>
    <6 4>2 <3>
    s2 s4 <_->
    <6 4>2 <3>

}


forma = {

    \time 2/2
    \key sib\major
    \tempo 2 = 75
    s1*102
    \bar "||"

}

IIfl = {
    \notypeset
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



IIIfln = \relative do'' {

    R1*10
    r4 lab'4. sib16 do sib8 lab
    sol8 mib sol4. lab16 sib lab8 sol

    %13
    fa re fa4. sol16 lab sol8 fa
    mib do lab'2 sol4~
    sol fa8 do' si do16 si do4~

    %16
    do8 si do4. si8 do4~
    do8 fad, sol4. fad8 sol4~
    sol8 fad sol la? sib do re[re]

    %19
    re sol, do[do] do4 r
    r8 sib sib sib sib4 r
    r8 lab lab lab lab4 r\mbreak

    %22
    r8 sol sol sol sol fa16 mib fa8. sol16
    sol4 r8 sol do4 r8 do,
    sol'4 fad sol2

}


IIIvlIn = \relative do'' {

    r4 mib2 mib4
    mib8 fa mib re mib2~
    mib4 re2 do4~

    %4
    do sib2 sib4
    lab4. sib8 do2~
    do4 sib2 sib4~

    %7
    sib lab2 la4\mbreak
    sib2 solb'~
    solb4 fa4. mi8 fa4~

    %10
    fa8 mi fa2 mi4
    fa fa,4.\p mib8 fa re
    mib4. fa8 mib re mib do

    %13
    lab' fa fa mib re fa si,4
    do8 sol' fa4. re8 sol[sib]
    do sib do lab sol4 r8 sol

    %16
    lab fa sol mib lab fa sol mib
    la! do, re sib mib do re sib
    mib do re la'4 sol16 fad re'8 sib

    %19
    sol sol sol mib' mib do\f do do
    sib sol sol,[sol'] r sol' sol sol
    lab fa fa,[fa] fa fa' fa fa\mbreak

    %22
    mib4 r r2
    r8 si si si do4 do
    si do si2

}

IIIvlIIn = \relative do'' {

    sib2. lab8 do
    sib4. lab8 sib2~
    sib sol4. lab8

    %4
    sol1~
    sol4 fa2 fa'4
    reb2. reb4

    %7
    do2 do\mbreak
    fa,4 fa'2 mib4~
    mib lab, reb do

    %10
    reb do8 sib lab4 sol
    lab fa8\p mib re do re sib
    mib4. re8 do sib do lab

    %13
    re4. do8 si4 sol
    do8 mib fa[mib]\mbreak re sib mib[sol]
    lab sol lab fa fa4 r8 mib

    %16
    fa re mib do fa re mib do
    re la sib sol do la sib sol
    do la sib fad' sol la sib sol

    %19
    mib mib mib do fad mib'!\f mib mib
    re4 r r8 reb reb reb
    do4 r r8 re! re re\mbreak

    %22
    do mib, mib re do2
    si8 sol' sol sol sol4 fad
    sol la sol2

}

IIIvlan = \relative do' {

    sol'2 do,4. mib8
    sol fa sol lab sol lab sib sol
    fa2 mib~

    %4
    mib4 re do2
    do2. lab'4
    fa2 mib

    %7
    mib fa\mbreak
    fa4. reb8 sib2
    mib4 fa2 lab4

    %10
    fa8 sib, do reb do2
    do4 fa8\p mib re do re sib
    mib4. re8 do sib do lab

    %13
    re4. do8 si4 sol
    do8 mib fa[mib]\mbreak re sib mib[sol]
    lab sol lab fa fa4 r8 mib

    %16
    fa re mib do fa re mib do
    re la sib sol do la sib sol
    do la sib fad sol la sib sol

    %19
    mib'[mib,] mib' do fad la\f la la
    re,4 r r8 sib' sib sib
    fa4 r r8 lab lab lab\mbreak

    %22
    sol do, do sib lab2
    sol8 re' re re do4 do
    re mib re2

}

IIIvcn = \relative do {

    \clef tenor mib8 fa sol mib lab sib do lab
    mib re mib fa sol fa sol mib
    sib' la! sib sib, do re mib fa

    %4
    sol fa sol fa mi re mi do
    fa mi fa sol lab sol lab fa
    sib lab sib lab sol fa sol mib

    %7
    lab sol lab sol fa mib fa mib\mbreak
    reb do reb sib mib re mib reb
    do lab' reb [do] sib sib lab [fa]

    %10
    sib sol lab sib do sib do do,
    fa4 r r2
    R1*7

    %19
    r2 r8 fad fad fad
    sol4 r r8 mi' mi mi
    fa?4 r r8 si, si si\mbreak

    %22
    do8 do, do' sib lab2
    sol8 sol sol sol lab4 la
    sol sol sol2

}

IIIbcn = \relative do {

    mib8 fa sol mib lab, sib do lab
    mib' re mib fa sol fa sol mib
    sib' la! sib sib, do re mib fa

    %4
    sol fa sol fa mi re mi do
    fa mi fa sol lab sol lab fa
    sib lab sib lab sol fa sol mib

    %7
    lab sol lab sol fa mib fa mib\mbreak
    reb do reb sib mib re mib reb
    do lab reb do sib sib' lab fa

    %10
    sib sol lab sib do sib do do,
    fa4 r r2
    R1*7

    %19
    r2 r8 fad fad fad
    sol4 r r8 mi mi mi
    fa?4 r r8 si, si si\mbreak

    %22
    do4 r r2
    r8 sol' sol sol lab4 la
    sol sol sol2

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <9>4 <6->
    s4 s8 <_- 6> <6>2
    <4>4 <3> <9> <6>8 <_->
    <6 4>4 <3-> <6 5> s
    <_- 9>4 <8> <6> s
    <_- 9> <8> <6 5->2
    <9>4 <8> <_-> <_!>
    <6>2 <_- 9>4 <8>
    <6- 5->2 <_->4 <6>
    <_->8 <6!> <6> <_-> <6- 4>4 <3!>
    <_->1
    s1*7
    s2 s8 <7 5> s4
    <_->2 s8 <7- 5> s4
    <_->2 s8 <7- 5> s4
    s1
    s8 <_!> s4 <7> <6+>
    <_!>

}


forma = {

     \time 4/4
    \key sol\minor
    \tempo 4 = 45
    s1*24
    \bar "||"

}

IIIfl = {
    \notypeset
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



IVfln = \relative do'' {

    R4.*7
    re'8 si sol
    do4 si8\mbreak

    %10
    la! sib? do
    sib4 la8
    sol la sib

    %13
    la8. sib16 sol8
    re'4.~
    re~

    %16
    re~
    re
    R4.*6	\mbreak

    %24
    re8 si sol
    do4 sib!8
    lab4 sol8

    %27
    sol fa16 mib fa8
    sol r r
    R4.*2

    %31
    re'8 si sol
    sol4.
    R4.*6

    %39
    r8 sol lab
    sib lab16 sol fa mib
    re8 mib lab

    %42
    sol fa16 sol lab8
    sol fa16 sol lab fa
    sib8 mib, lab

    %45
    sol16[lab] fa4
    mib8 r r
    r sol16 lab sib sol

    %48
    lab8 r r
    r fa16 sol lab fa
    sol8 r r

    %51
    r sol do\mbreak
    si16 la sol8\noBeam r
    r fa do'

    %54
    r sol do
    r re si
    do r r

    %57
    R4.*2
    r8 fa, do'
    r sol do

    %61
    r re si
    do r r
    R4.

    %64
    mib,8 sol do
    sol mib do
    do r r

}


IVvlIn = \relative do'' {

    sol'8 mib do
    lab'4 sol8
    fa sol lab

    %4
    sol4 fa8
    mib fa sol
    do, re mib~

    %7
    mib re16 mib fa re
    si8 r r
    R4.

    %10
    r8 fa4~
    fa8 re fa
    mib4 fa8

    %13
    do' fad, sol
    fad fad' sol
    la sib16[la sib sol]

    %16
    la8 fad sol
    la\noBeam sib16 la sib sol
    la8. la16 re8~

    %19
    re do16 sib la sol
    fad8 re'16 do sib do
    la8. la16 sol8

    %22
    fad sol16 fad sol8
    sol8. sol16 fad8\mbreak
    sol r r

    %25
    R4.*3
    r8 r sol~
    sol fa16 mib fa do

    %30
    fad8. sol16 fad8
    sol re re
    re4.

    %33 OOKK
    sol8 fa16 mib fa sol
    mib8 do re
    mi16 fa sol8.[lab16]

    %36
    fa8 do do'~
    do sib re,\mbreak
    sib\noBeam sol'16 lab fa lab

    %39
    sol8 r r
    R4.
    r8 r do,

    %42
    sib r r
    sib,4.~
    sib8 do do'

    %45
    sib r r
    r sol'16[lab] sib8
    sib r r

    %48
    r fa16[sol] lab8
    lab? r r
    r sol do

    %51
    si16[la] sol8 r\mbreak
    r sol do
    lab16 sol lab8\noBeam r

    %54
    sol16 fa sol8\noBeam r
    fa16 mib fa8\noBeam r
    r16 do' sib lab sol fa

    %57
    mib fa re4
    do8 sol' do
    lab16\p sol lab8 r

    %60
    sol16 fa sol8 r
    fa16 mib fa8 r
    r16 do' sib lab sol fa

    %63
    mib fa re4
    do8\f mib sol
    mib16 re do8[sol]

    %66
    sol r r

}

IVvlIIn = \relative do'' {

    mib8 do sol
    fa4 sol8
    si re fa

    %4
    re si re
    do si sol
    lab4 sol8

    %7
    lab4 lab8
    sol4 sol8
    mi do mi\mbreak

    %10
    fa8. fa16 mib!8
    re sib re
    mib8. mib16 re8

    %13
    do re mib
    re la' r
    re8. re16 sol8

    %16
    fad la, r
    re8. re16 sol8
    fad4 re8

    %19
    mib!8. re16 do8
    la'8. la16 sol8
    fad re'16 do sib do

    %22
    la8 re,8. re'16
    do re sib8[la]\mbreak
    si sol sol,

    %25
    lab mi8. mi16
    fa4 sol8
    do,4.

    %28
    si4 si'8
    do4.
    do8. si16 do re

    %31
    si4 si8
    si4.
    R4.*2

    %35
    do'8 sib16 lab sib do
    lab8 fa sol
    lab8. sol16 lab sib\mbreak

    %38
    sol8 sib, re
    mib r r
    sol, fa r

    %41
    sib mib, mib~
    mib re16 mib fa8
    mib re16 mib fa re

    %44
    mib4 mib8
    mib4 re8
    mib sib' fa'

    %47
    mi r r
    r lab, do
    sib r r

    %50
    r mib fa
    re r r\mbreak
    r re sol

    %53
    do, r r
    do r r
    si' r r

    %56
    sol4 do8
    do4 si8
    do r r

    %59
    do,\p r r
    do r r
    si' r r

    %62
    sol4 do,8
    do4 si8
    sol\f do mib

    %65
    do sol mib
    mib r r

}

IVvlan = \relative do' {

    sol'4 sol8
    do,8. re16 mib8
    fa4 fa8

    %4
    sol re re'
    sol, fa mib
    lab fa mib

    %7
    fa8. sol16 lab fa
    re4 sol8
    mi do mi\mbreak

    %10
    fa8. fa16 mib!8
    re sib re
    mib8. mib16 re8

    %13
    do re mib
    re8. re'16 do sib
    la8 sol r

    %16
    re8. re'16 do sib
    la8 sol r
    r r sol

    %19
    sol4 sol8
    re'4 re8
    re4 re8

    %22
    re8. la16 sol8
    mib re re\mbreak
    re4 sol8

    %25
    lab sol4~
    sol8 fa mib
    lab,4.

    %28
    sol4 re'8
    do4.
    do4 do8

    %31
    re4 re8
    sol4.
    re4 re8

    %34
    sol16 fa sol8[sol]
    sol4 reb'8
    do4 sol8

    %37
    fa8. mib16 fa8~\mbreak
    fa mib re
    sib' r r

    %40
    sol, lab do
    sib do lab
    sib4 sib8

    %43
    sib sib lab
    sol do lab
    sib16 lab sib8[sib]

    %46
    mib sol fa
    sol r r
    r do do

    %49
    fa, r r
    r sib, do
    sol'8. sol16 lab8\mbreak

    %52
    sol si sol
    fa r r
    sol r r

    %55
    re' r r
    do sol lab
    sol lab sol

    %58
    sol r r
    fa\p r r
    sol r r

    %61
    re r r
    do sol' lab
    sol lab sol

    %64
    sol\f mib do
    do do do
    do r r

}

IVvcn = \relative do {

    \clef tenor do'4 mib8
    fa fa mib
    re4 do8

    %4
    si sol si
    do re mib
    fa4 do8

    %7
    fa fa, fa
    sol r r
    R4.*5

    %14
    r8 re mi
    fad\noBeam sol r
    r re' mi

    %17
    fad sol sol,
    re'8 do sib
    do8. re16 mib8
    re fad sol

    %21
    re fad sol
    re16 mib re do sib8\noBeam
    do re re,\mbreak

    %24
    sol r r
    R4.*3
    r8 r sol

    %29
    lab4.
    la!
    sol4 sol8

    %32
    sol4.
    si8. do16 re si
    do re mib8 [si]

    %35
    do16 re mi8.[mi16]
    fa8 lab, mi
    fa re' sib\mbreak

    %38
    mib,?8. mib'16 sib8
    mib,4 fa8
    sol lab do

    %41
    sib do lab
    sib4 sib8
    sib sib lab

    %44
    sol do lab
    sib16[lab] sib8 sib,
    mib mib' reb

    %47
    do r r
    r8 fa mib

    %49
    re? r r
    r mib lab,
    sol8. sol16 lab8\mbreak

    %52
    sol sol' mi
    fa r r
    mib! r r

    %55
    re r r
    mib mib, fa
    sol fa sol

    %58
    do, r r
    fa\p r r
    mib r r

    %61
    re r r
    mib8. mib16 fa8
    sol fa sol

    %64
    do,\f do' do
    do do, do
    do r r

}

IVbcn = \relative do {

    do4 mib8
    fa fa mib
    re4 do8

    %4
    si sol si
    do re mib
    fa4 do8

    %7
    fa fa, fa'
    sol r r
    R4.*5

    %14
    r8 re mi
    fad\noBeam sol r
    r re mi

    %17
    fad sol4
    re8 do sib
    do8. re16 mib8
    re fad sol

    %21
    re fad sol
    re8. do16 sib8
    do re re,\mbreak

    %24
    sol r r
    R4.*3
    r8 r sol'

    %29
    lab4.
    la!
    sol4 sol,8

    %32
    sol4.
    si4 si8
    do mib si

    %35
    do mi4
    fa8 lab mi
    fa re sib\mbreak

    %38
    mib?8. mib16 sib8
    mib r r
    R4.*6

    %46
    r8 mib reb
    do r r
    r8 fa mib

    %49
    re? r r
    r mib lab
    sol r r	\mbreak

    %52
    r sol mi
    fa r r
    mib! r r

    %55
    re r r
    mib4 fa8
    sol fa sol

    %58
    do, r r
    fa\p r r
    mib r r

    %61
    re r r
    mib4 fa8
    sol fa sol

    %64
    do,\f do' do
    do do, do
    do r r

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6>8
    <_->4.
    <6!>4 <6- 4>8
    s4.
    s8 <6!> <6>
    <_->4.
    <_- 7>8 <6>4
    <_!>4.
    s4.*5
    s8 <_+>4
    s4.
    s8 <_+> s
    s4.
    <_+>4 <6>8
    <9>8 <8> <6>
    <_+>4.
    s
    <_+>4 <6>8
    s <6 4> <3>
    <_!>4.
    s4.*3
    s4 <_!>8
    <7>8 <6>4
    <6+>4.
    <_!>
    <_!>
    s
     s8 <6>4
     <_!>8 <7- 5>4
     s4.
     <_->8 <6 5-> <7->
     <9> <8>4
     s4.*7
     s4 <6>8
     <_! 7>4.
     s8 <_->4
     <6 5->4.
     s4 <6>8
     <_!>4.
     s8 <_!>4
     <_->4.
     <6>
     <6!>
     <6>4 <_->8
     <6 4> <_- 6 5> <_!>
     s4.
     <_->
     <6>
     <6!>
     <6>4 <_->8
     s <6 4> <3>

}


forma = {

    \time 3/8
    \key sib\major
    \tempo 4. = 55
    s4.*32
    \bar ":..:"\break
    s4.*34
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
    \clef bass
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
   \override Score.BarNumber.font-size = #0.5
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
   subtitle = \markup "Sinfonia Duodecima ”La Geniale” [autografo 1715]"
   composer = \markup {"A. Scarlatti (1660-1725)"}
}

\markup \huge {[1.] Adagio e staccato}

\score {

   <<

      \new Staff  <<
         \set Staff.midiInstrument = #"recorder"
         \set Staff.instrumentName = \markup {Flau[to]}
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
            \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
            \set Staff.midiInstrument = #"cello"
            \Ivc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
            \set Staff.midiInstrument = #"contrabass"
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

\pageBreak

\markup \huge {[2.] Andante giusto}

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
            \set Staff.midiInstrument = #"contrabass"
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
            \set Staff.midiInstrument = #"contrabass"
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

\pageBreak

\markup \huge {[4.] And[ant]e moderato}

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
            \set Staff.midiInstrument = #"contrabass"
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

