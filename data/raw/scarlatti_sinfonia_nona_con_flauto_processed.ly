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
    r r8 r16 re' re4 r8 r16 re
    re4 r8 r16 re sib4 r8 r16 fa
    fa4 r8 r16 re' sol,4 r8 r16 sol

    %4
    sol4 r8 r16 sol sol4 r8 r16 do
    re8. re16 re8. re16 do8. do16 do8. do16\mbreak
    sib8 re re4 re re

    %7
    re r8 la sib4 do
    sib do sib r8 sol
    sol4 sol sol sol

    %10
    sol sol r8 fa la4
    la la la r8 re\mbreak
    re4 r8 do do4 r8 sib

    %13
    sib4 r8 la la4 r8 sol
    sol4 r8 fa fa4 r8 sol
    la4 r8 la sol4 r8 la

    %16
    sol4 r re'2\tr~
    re re4 re
    re r s2

}


IvlIn = \relative do'' {

    r8 r16 re
    re4 sol sib r8 r16 sib
    la4 r8 r16 sib sol4 r8 r16 mib
    mib?4 r8 r16 re re4 r8 r16 do

    %4
    do4 r8 r16 sib' mib,4 r8 r16 do'
    do8. do16 sib8. sol16 sol8. sol16 fad8. fad16\mbreak
    sol re re re re'4 r16 re, re re re'4

    %7
    r16 sib, sib sib fa'4 r16 fa, fa fa fa'4
    r16 fa, fa fa fa'4 r16 fa, fa fa fa'8 sol
    r16 sol, sol sol sol'4 r16 sol, sol sol sol'4

    %10
    r16 sol, sol sol sol'4 r16 la, la la la'4
    r16 la, la la la'4 r16 la, la la la'4\mbreak
    r16 sol, sol sol sol'4 r16 fa, fa fa fa'4

    %13
    r16 sol, sol sol mib'4 r16 re re re re'4
    r16 do, do do do'4 r16 sib, sib sib sib'4
    r16 la, la la la'8 fad r16 re re re re'4

    %16
    r16 re, re re do'8 mib, re8. re16 sib'8. sib16
    la re, re re re'4 r16 re, re re re'8 sib
    la4 r s2

}

IvlIIn = \relative do'' {

    r4
    r r8 r16 sib re4 r8 r16 sol
    sol4 r8 r16 fa fa4 r8 r16 fa
    fa4 r8 r16 fa mib4 r8 r16 mib

    %4
    re4 r8 r16 re re4 r8 r16 mib
    re8. re16 re'8. re,16 la'8. la,16 la8. la16\mbreak
    sib4 r16 re re re sib'4 r16 re, re re

    %7
    sib'4 r16 fa, fa fa re'4 r16 fa, fa fa
    re'4 r16 fa, fa fa re'4 r16 fa, fa fa
    mib'4 r16 sol, sol sol mib'4 r16 sol, sol sol

    %10
    mib'4 r16 re re re fa4 r16 la, la la
    fa'4 r16 la, la la fa'4 r16 re re re\mbreak
    sib'4 r16 do, do do la'4 r16 sib, sib sib

    %13
    sol'4 r16 la, la la fad'4 r16 sol, sol sol
    mib'4 r16 fa, fa fa fa'4 r16 sol, sol sol
    mib'4 r16 re re re sib'4 r16 re, re re

    %16
    sib'4 r16 do, do do fad8. fad16 re8. re16
    fad4 r16 re re re re' fad, fad fad sol8 sol
    fad4 r s2

}

Ivlan = \relative do' {

    r4
    r r8 r16 re sol4 r8 r16 re
    re4 r8 r16 sib' sib4 r8 r16 do
    sib4 r8 r16 sib sol4 r8 r16 sol

    %4
    sol4 r8 r16 sol sol4 r8 r16 sol
    la8. fad16 re8. re16 mib8. mib16 re8. re16\mbreak
    re8 sib' la fad re sib' la fad

    %7
    re re' do[la] fa? re' do[la]
    fa re' do[la] fa fa sib[re]
    sol, mib re[si] sol' mib re si

    %10
    sol' [mib] re sib' la fa mi? dod
    la' fa mi dod la' fa re fa\mbreak
    re re do?[mib] do do sib[re]

    %13
    sib[sib'] la do la fad re sib'
    sol mib do la'  re, re sib[sol']
    do,[do'] do4 r8 sib la fad

    %16
    re sib' sol la la8. la16 sol8. sol16
    la8 la sol sib fad re re re
    re4 r s2

}

Ivcn = \relative do' {

    r4
    r4 r8 r16 sol sol8 la sib sol
    re' re, fa re mib fa sol la
    sib sib re sib do re mib do

    %4
    sol la sib sol do sib la sol
    fad re sol[sib] do la re[re,]\mbreak
    sol sol' fad [re] sol, sol' fad re

    %7
    sol sol, la fa? sib, sib' la [fa]
    sib, sib' la [fa] sib, sib' re si
    do do, si' [sol] do, do' si sol

    %10
    do, do' sib! sol re re' dod la
    re, re' dod la re, re' fa re\mbreak
    sol fa mib do fa mib re sib

    %13
    mib re do la re, re' sib sol
    do, [do'] la fa sib,[sib'] sol mib
    la, la' fad[re] sol sol' fad re

    %16
    sol, sol' mib do re8. re16 sol,8. sol16
    re8 re' sib sol re re' sib sol
    re4 r s2

}

Ibcn = \relative do {

    r4
    r4 r8 r16 sol' sol8 la sib sol
    re' re, fa re mib fa sol la
    sib sib, re sib do re mib do

    %4
    sol' la sib sol do sib la sol
    fad re sol[sib,] do la re[re,]\mbreak
    sol sol' fad re sol, sol' fad re

    %7
    sol sol, la [fa?] sib sib' la fa?
    sib, sib' la fa sib, sib' re si
    do do, si sol do do' si sol

    %10
    do, do' sib! [sol] re re' dod la
    re, re' dod la re re, fa re\mbreak
    sol fa mib do fa mib re sib

    %13
    mib re do [la] re re' sib sol
    do, [do'] la fa sib,[sib'] sol mib
    la, la' fad[re] sol, sol' fad re

    %16
    sol, sol' mib do re8. re16 sol,8. sol16
    re'8 re' sib sol re re' sib sol
    re4 r s2

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s1
    <4>4 s8 <6> <9>4 s8 <6 5->
    <4->4 <6> <9> <6>
    <4> <6> <9 _-> s8 <6- 4>
    <6 5>4 s8 <6> <_- 6 5>4 <_+>8 <7>\mbreak
    s1
    s4 <6 5-> s2
    s s4 <6>
    <_->2 <_->
    <_->4 <6> <_->2
    s2 s4 <6>\mbreak
    s <6> s <6>
    s <6> <_+> <6>
    <_-> <6> s <6->
    <5->1
    s4 <6>8 <6> <_+>2
    <_+>4 <6> <_+> <6>
    <_+>

}


forma = {

    \time 4/4
    \key re\minor
    \tempo 2 = 45
    \partial 4 s4
    s1*17
    s2 r\fermata
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

    sib'4 fa~fa8. sib16
    sib4 la r
    do fa,4~fa8. do'16

    %4
    do4 sib r
    fa sib8.[do16 re8. sib16]
    sol8. fa16 sol4 r

    %7
    sol do8.[re16 mib8. do16]
    do4~do8. fa,16 sib8. re16
    do4 sib8. la16 sib4~\mbreak

    %10
    sib8. do16 la4~la8. sib16
    sib4 r r
    R2.*4

    %16
    r8 r16 re sib8.[do16 re8. mi16]
    do4 do r8 r16 do
    sib4 sib r8 r16 sib\mbreak

    %19
    do8. sib16 la4 sib R2.*2
    sol4~sol8.[fad16 sol8. sol16]
    sib4 la mi

    %22
    re8. re16 re8. fad16 la8. la16
    la2.
    s

}


IIvlIn = \relative do'' {

    re,4\p~re8. mib16 fa8. re16
    re'4 do r
    do~do8. sib16 do4

    %4
    fa,~fa8. [sol16 fa8. mib16]
    fa4 fa r8 r16 re
    sib'4~sib8.[la16 sib8. la16]

    %7
    sol4 sol r
    la8. sol16 la4 re,8. fa16
    sol4~sol8. fa16 fa8. fa16\mbreak

    %10
    sol4 fa2
    fa'4 fa r8r16 sib
    sib4 la r8 r16 la

    %13
    sol4 sol r8 r16 do
    do4 sib r8 r16 sib
    la4 la r8 r16 la

    %16
    la4 sol r8r16 sib
    sib4 lab r8 r16 lab
    lab?4 sol r8 r16 sol\mbreak

    %19
    sol4~sol8. sol,16 sol4
    sol fad re'
    re do do

    %22
    dod dod~dod8. re16
    re4 la sib
    sib8.[sib16] la8.[la16 la8. la16]

    %25
    la2.
    s

}

IIvlIIn = \relative do'' {

    sib,4\p~sib8.[do16 re8. sib16]
    fa'4~fa8.[mi16 fa8. sol16]
    la4~la8. sol16 la4

    %4
    re,4~re8.[mib16 re8. do16]
    re4 re r8 r16 re
    mib4~mib8.[fa16 sol8. fa16]

    %7
    mib4 mib r
    mib r re
    mib4~mib8. [fa16 re8. re16]\mbreak

    %10
    mib4 fa2
    re'4 re r8 r16 re'
    do4 do r8 r16 fa,

    %13
    fa4 mib r8 r16 mib
    re4 re r8 r16 sol
    sol4 fad r8 r16 fad

    %16
    re4 re r8 r16 sol
    do,4 do r8 r16 fa
    sib,8. sib16 mib8.[fa16 sol8. mib16]\mbreak

    %19
    mib4 mib, sib'
    sib la fad
    sol sol sol

    %22
    sol8. [la16 sib8. la16] sol4
    sol fad sol
    sol8. sol16 fad8.[fad16 fad8. fad16]

    %25
    fad2.
    s

}

IIvlan = \relative do' {

    sib4~sib8.[do16 re8. sib16]
    fa'4~fa8.[mi16 fa8. sol16]
    la4~la8. sol16 la4

    %4
    re,~re8.[mib16 re8. do16]
    re4 re, r8 r16 re'
    mib4~mib8.[fa16 sol8. fa16]

    %7
    mib4 mib r
    mib r re
    mib~mib8.[fa16 re8. re16]\mbreak

    %10
    mib4 fa fa,
    sib' fa r
    fa do r

    %13
    do' sol r
    sol re r
    re la' r

    %16
    sib sib r8 r16 sol
    sol4 lab8. lab,16 lab'8. lab16
    fa4 sib, r8 r16 sib'\mbreak

    %19
    la?4 la mi!
    re la' la
    sol mib do

    %22
    sib sol8. la16 sib4
    sib8. do16 re4 mi!
    sol8. sol16 re8. re16 re8. re16

    %25
    re2.
    s

}

IIvcn = \relative do' {

    R2.*10
    sib4 sib8.[do16 re8. sib16]
    fa'4 fa,8.[sol16 la8. fa16]

    %13
    do'4 do8.[re16 mib8. do16]
    sol4 sol8.[la16 sib8. sol16]
    re'4 re8.[mi16 fad8. re16]

    %16
    sol4 sol, r8 r16 sol'
    mi!8. mi16 fa8. fa,16 fa'8. fa16
    re4 mib r8 r16 mib\mbreak

    %19
    do4 do dod
    re re, re
    mib mib mib

    %22
    mi! mi2
    re4 re' dod
    re8.[re,16 re8. re16 re8. re16]

    %25
    re2.
    s

}

IIbcn = \relative do {

    R2.*10
    sib'4 sib,8.[do16 re8. sib16]
    fa'4 fa,8.[sol16 la8. fa16]

    %13
    do'4 do8.[re16 mib8. do16]
    sol4 sol'8.[la16 sib8. sol16]
    re'4 re,8.[mi16 fad8. re16]

    %16
    sol4 sol, r8 r16 sol'
    mi!4 fa r8 r16 fa
    re4 mib r8 r16 mib\mbreak

    %19
    do4 do dod
    re re re
    mib mib mib

    %22
    mi! mi2
    re4 re dod
    re8.[re16 re8. re16 re8. re16]

    %25
    re2.
    s

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*11
    <4>4 <3>2
    <4>4 <3->2
    <4>4 <3->2
    <4>4 <3+>2
    <9>4 <8>2
    <6 5>4 <_-> s8 s16 <_->
    <6 5->2.
    <_- 6 5>4 s <7 5>
    <6 4> <_+> s
    <7> <6> s
    <6+>2.
    <6 4>4 <3+> <7 5>
    <6 4> <5 3+>2
    <_+>

}


forma = {

    \time 3/4
    \key re\minor
    \tempo 4 = 50
    s2.*25
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}
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

    R1*4
    sol'1
    sib

    %7
    la2. sol8 fa
    mi4 fa sol la
    fa la8 sol fa4 mi8 re

    %10
    sol1
    re'
    R1*13

    %25
    re1
    mib
    re2. do8 sib

    %28
    la4 sib do re
    sib re8 do sib4 sol
    re' re8 do sib la sol fa

    %31
    mi2 re4 fa\mbreak
    sib2 do
    re2. re,4

    %34
    mi fa8 sol la4 sib8 la
    sib1
    la2. sol8 fa

    %37
    sol2. la8 sol
    la2. sol8 fa
    mi2 la

    %40
    la1
    R1*14
    fa1

    %56
    sol
    fa2 do'~
    do4 sib8 la sib2~

    %59
    sib4 lab8 sol lab4 fa
    sol1
    R1*10

    %71
    sib1\mbreak
    do
    sib2. lab8 sol

    %74
    fa4 sol lab sib
    sol mib do'2~
    do4 sib8 la! sib2~

    %77
    sib la
    sib4 la sol2
    la sib

    %80
    fa1
    R1*3
    la1

    %85
    sib
    la2. sol8 fa
    mi4 fa sol la

    %88
    fa sol8 la sib2
    sol la~
    la re,

    %91
    R1*3
    r2 re'~
    re4 do sib do

    %96
    re2. re4
    sib sib8 do re2
    re1~

    %99
    re
    r4 re, sol2
    re' re~

    %102
    re4 do8 sib do4 sol
    sib do re2
    re s

}


IIIvlIn = \relative do'' {

    re1
    mib
    re2. do8 sib

    %4
    la4 sib do re
    sib re8 do sib4 la
    sol la sol fa

    %7
    mi2 re4 la'
    la,1
    la'2 re~

    %10
    re4 do8 sib do2
    re4 re, la' sib
    do sib la2\mbreak

    %13
    re4 sib r sol'
    sib1
    la2. sol8 fa

    %16
    mi4 fa sol la
    fa la8 sol fa4 sib
    r sol la do

    %19
    r fa, sol sib
    r mib, fa la
    re, mib fa2~ \mbreak

    %22
    fa mib~
    mib re4 sib'
    sib2 la

    %25
    sib r
    R1*3
    sol1\p

    %30
    sib
    la2. sol8 fa\mbreak
    mi4 fa8 sol la4 do

    %33
    r fa, sol sib
    r mi, fa2~
    fa mi

    %36
    do2. si8 la
    si4 do8 si do2~
    do4 sib!8 la sib4 sib'

    %39
    la2. sol8 fa
    mi2 la~
    la4 sol8 fa sol4 re\mbreak  %% fine p. 11

    %42 OOKK
    fa2 mi~
    mi4 re2 dod4
    re2 sib4 fa

    %45
    sol la8 sol la4 sol
    fad2 sol
    R1

    %48
    sol'
    lab
    sol2. fa8 mib

    %51
    re4 mib fa sol
    mib2. fa8 mib
    fa2. mib8 re

    %54
    do4 re mib fa
    re sib re,2
    mib2. sib'4

    %57
    do2 r4 do
    reb1
    do2. sib8 lab

    %60
    sol2 r4 do'~
    do sib8 la! sib4 fa\mbreak
    sol2. do,4

    %63
    mi! fa sol2
    fa fa~
    fa mib

    %66
    re r4 sol
    lab1
    sol2. fa8 mib

    %69
    re4 mib fa sol
    mib2 do
    fa sib,4 sib'\p~\mbreak

    %72
    sib lab8 sol lab2~
    lab4 sol8 fa sol4 fa8 mib
    re4 mib fa re

    %75
    mib sol2 fa8 mib
    fa2. mib8 re
    mib4 re do fa

    %78
    sol1
    fa2. mib8 re
    do4 re  mib fa

    %81
    re2 r4 sib'~\mbreak
    sib la8 sol la4 la,
    sol sol'2 fa8 mi

    %84
    fa2 r4 fa,
    sol fa mi re
    dod2 re4 sol,

    %87
    la2 r
    re'1
    mib

    %90
    re2. do8 sib
    la4 sib do re
    sib do re2~\mbreak

    %93
    re4 do8 sib do sib la sol
    fad4 re r la''
    sib1

    %96
    la4 la, la'2~
    la sol~
    sol4 fad8 mi fad4 mi

    %99
    re2. mi4
    fad2 sol~
    sol fad

    %102
    sol2. do,4
    sib2 la
    sib s

}

IIIvlIIn = \relative do'' {

    r2 re~
    re do~
    do4 sib8 la sib4 sol

    %4
    fad sol la fad
    sol sib8 la sol4 fa?
    mi fa mi re

    %7
    dod2 re
    mi4 re dod mi
    fa2 sib

    %10
    r sol'~
    sol4 fad8 mi fad4 sol
    la sol2 fad4\mbreak

    %13
    sol2 sib4 sib,
    re mi8 fa mi4 re
    dod2 re4 la'~

    %16
    la la, dod mi
    la,2 r4 re
    mib1

    %19
    re
    do2 do'~
    do4 sib8 la sib4 fa\mbreak

    %22
    sol1
    fa2. mib8 re
    do1

    %25
    re4 re, re'2\p~
    re do~
    do4 sib8 la sib4 sol

    %28
    fad sol la fad
    sol sib8 la sol4 sol,
    r sol' sol'8 fa mi re

    %31
    dod2 re4 la'\mbreak
    sol la8 sib mi,!4 la
    re, do re sol

    %34
    do, sib do2
    sol' sol,
    fa4 la2 re4

    %37
    re sol2 mib4
    re2. mi8 re
    dod4 re8 dod re4 re'~

    %40
    re dod8 si dod2
    re1\mbreak
    R1*2

    %44
    re,1
    mib
    re2. do8 sib

    %47
    la4 sib do re
    si la8 sol sol'2~
    sol fa~

    %50
    fa4 mib8 re mib4 do
    fa sol8 lab re,2\mbreak
    sol,2. sib4

    %53
    do2 re4 do8 sib
    mib4 fa8 sol do,2
    sib fa'\p ~

    %56
    fa mib~
    mib4 re8 mib do2
    fa,2. sol8 fa

    %59
    sol2 do,4 do'
    re mi!8 re mi4 fa8 mi
    fa4 fa, fa'2~\mbreak

    %62
    fa4 mi8 re mi4 fa
    sib, do reb do8 sib
    do4 reb8 do reb4 sib'

    %65
    lab sib8 lab sol4 lab
    fa4 sol8 fa sol2~
    sol fa~

    %68
    fa4 mib8 re mib4 re8 do
    si4 do re si
    do do, fa mib

    %71
    re mib8 re mib4 sol,\mbreak
    lab sib do mib
    fa2 mib4 lab,

    %74
    sib1
    mib2. re8 do
    re2. do8 sib

    %77
    do2 fa
    sib,4 do8 re mib4 fa8 sol
    do,4 do' sib fa'~

    %80
    fa sib, la do~
    do sib8 la sib4 sol'\mbreak
    do,2. fa4~

    %83
    fa mi8 re mi2
    la, la'\p~
    la sol~

    %86
    sol4 fa8 mi fa4 mi8 re
    dod4 re mi dod
    re2 re'~

    %89
    re do~
    do4 sib8 la sib4 la8 sol
    fad4 sol la fad

    %92
    sol fad sol re\mbreak
    mib4. re8 mib re do sib
    la2 la'~

    %95
    la sol~
    sol4 fad8 mi fad4 sol8 la
    sib2. la8 sol

    %98
    la4 la, re do~
    do sib8 la sib4 do8 sib
    la4 la' sib2

    %101
    la1
    sol4 re mib sol,
    sol2 fad

    %104
    sol s

}

IIIvlan = \relative do' {

    R1*4
    r2 sol'~
    sol sol~

    %7
    sol4 fa8 mi fa4 re
    dod re mi dod
    re fa8 mi re2~

    %10
    re4 sol, mib' do?
    la'2. re,4
    fad sol mib re\mbreak

    %13
    re2. re4
    sol4. la8 sol4 fa
    mi2 la

    %16
    R1
    fa
    sol2 mib4 fa8 mib

    %19
    fa2 re4 mib8 re
    mib4 sol fa2
    fa2. sib4\mbreak

    %22
    sib2 do~
    do sib
    sol fa

    %25
    fa r
    R1*3
    r2 sol~

    %30
    sol sol~
    sol4 fa8 mi fa4 re\mbreak
    re2 do

    %33
    do sib
    sib la
    sol do

    %36
    fa, fa'~
    fa4 mib8 re mib4 do
    fad2 sol~

    %39
    sol4 fa8 mi! fa4 re
    la'2 mi
    r re'~\mbreak

    %42
    re dod~
    dod4 la4 mi2
    la4 fad re sib'

    %45
    sol fa mib re8 do
    la'2 re,
    do4 re8 mib la,4 la'

    %48
    re,2 do~
    do do
    sol'1

    %51
    R\mbreak
    r4 do, mib2~
    mib re4 fa

    %54
    sol2 la
    fa r
    r sol,

    %57
    la1
    sib
    mi,!2 fa

    %60
    si do
    fa2. sib4\mbreak
    sol do, sol' lab

    %63
    sib2. mi,!4
    do'2 fa,4 reb
    do2. mib4

    %66
    fa2 re!
    mib4 fa8 mib fa4 sol8 lab
    re,2 do

    %69
    r r4 sol'~
    sol sol lab2~
    lab sol4 sol,\mbreak

    %72
    lab sib do lab
    re2 mib4 lab,
    sib1

    %75
    mib2. re8 do
    re2. do8 sib
    do2 fa

    %78
    sib, do
    fa1
    r2 do

    %81
    re1\mbreak
    do2. do4
    re2 la'

    %84
    la2. fa4
    sol fa mi re
    dod2 re4 sol,

    %87
    la1
    re4 do sib2
    R1*2

    %91
    r2 la'
    sib4 la sol2\mbreak
    sol sol

    %94
    re'4 fad, fad2
    re2. re4
    la'2. fad4

    %97
    re2 re4 sib
    re2 la'
    fad sol

    %100
    la4 fad mi2
    la2. sib8 la
    sib4 sib sol sol

    %103
    re2 re
    re s

}

IIIvcn = \relative do' {

    R1*8
    re1
    mib

    %11
    re2. do8 sib
    la4 sib do re\mbreak
    sib4 sol sol2~

    %14
    sol sol'~
    sol4 fa8 mi fa4 re
    dod re mi dod

    %17
    re re, re'2~
    re4 do8 sib do2~
    do4 sib8 la sib2~

    %20
    sib4 la8 sol la2
    sib4 do re re,\mbreak
    mib' re do sib

    %23
    la sib8 la sib4 re
    mib mib, fa2
    sib r

    %26
    R1*14
    r2 la
    sib1\mbreak

    %42
    la2. sol8 fa
    mi4 fa sol la
    fad re re'2~

    %45
    re do~
    do4 sib8 la sib4 sol
    sol2 fa4 fa'

    %48
    fa2 mib
    fa fa,
    si do~

    %51
    do si\mbreak
    do r4 sol
    la sib8 la sib2~

    %54
    sib la
    sib r
    R1

    %57
    r2 la
    sib1
    mi,!2 fa

    %60
    si do
    reb1\mbreak
    do2. sib8 lab

    %63
    sol4 lab sib sol
    lab sib8 lab sib4 sib,
    do2 do'~

    %66
    do4 sib8 lab sib4 sib
    do2 re
    si do4 fa,

    %69
    sol2 sol,
    do r
    R1*6

    %77
    r2 fa'~
    fa mib~
    mib4 re8 do re4 do8 sib

    %80
    la4 sib do la
    sib do re, mi!\mbreak
    fa mi fa la

    %83
    si dod8 si dod4 re8 dod
    re4 re, r2
    R1*3

    %88
    r2 r4 sib'
    do sib la sol
    fad4 sol8 fad sol4 do

    %91
    re2 re,
    sol4 la sib si\mbreak
    do2 do,4 do'

    %94
    re2 re,4 re'
    re2 re,4 re'
    re2 re,4 re'

    %97
    re re, re re'
    re2 re,4 re'
    re re, re re'

    %100
    re2 dod
    re2. re4
    sol sol, do mib

    %103
    re2 re,
    sol s

}

IIIbcn = \relative do {

    R1*8
    re1
    mib

    %11
    re2. do8 sib
    la4 sib do re\mbreak
    sib4 sol sol'2~

    %14
    sol sol~
    sol4 fa8 mi fa4 re
    dod re mi dod

    %17
    re2 re'~
    re4 do8 sib do2~
    do4 sib8 la sib2~

    %20
    sib4 la8 sol la2
    sib4 do re re,\mbreak
    mib re do sib

    %23
    la la' sib re,
    mib2 fa
    sib, r

    %26
    R1*14
    r2 la'
    sib1\mbreak

    %42
    la2. sol8 fa
    mi4 fa sol la
    fad re re'2~

    %45
    re do~
    do4 sib8 la sib4 sol
    sol2 fa

    %48
    fa mib
    fa fa,
    si do~

    %51
    do si\mbreak
    do r4 sol'
    la2 sib~

    %54
    sib la
    sib r
    R1*4

    %60
    r2 do
    reb1\mbreak
    do2. sib8 lab

    %63
    sol4 lab sib sol
    lab sib8 lab sib4 sib,
    do2 do'~

    %66
    do4 sib8 lab sib4 sib,
    do2 re
    si do4 fa

    %69
    sol2 sol,
    do r
    R1*6

    %77
    r2 fa~
    fa mib~
    mib4 re8 do re4 do8 sib

    %80
    la4 sib do la
    sib do re mi!\mbreak
    fa mi fa la,

    %83
    si2 dod
    re r
    R1*3

    %88
    r2 r4 sib'
    do sib la sol
    fad2 sol4 do,

    %91
    re2 re,
    sol4 la sib si\mbreak
    do2 do

    %94
    re1
    re
    re

    %97
    re
    re
    re

    %100
    re2 dod
    re1
    sol,2 do4 mib

    %103
    re2 re,
    sol s

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*8
    <_- 5>2 <6>
    <7> <6>
    <4> <3+>
    <6+>4 <6> <_- 6 5> <_+>
    <6>2 <5>
    s <6>
    <4+ 2> <6>
    s <6+>
    s <6>
    <2-> <6 _->
    <2> <6>
    <4- 2> <6>
    <9> <6>
    <9> <5>
    <6 5-> s4 <6>
    <6 5>1
    s1*15
    s2 <_+>
    <5> <6>
    <6 4> <5 3+>
    <6+>4 <6> <6 5> <_+>
    s2 <6>
    <2-> s
    <4+ 2> <6>
    <2> <5>4 <6>
    <4! 2>2 <6>
    <_- 9> <8>
    <6 5> <_->
    <2> s
    <_-> s4 <6->
    <6 5->1
    <6 4- 2>2 <5->4 <6>
    s1*5
    s2 <_!>
    <7>2 <6>
    <4>4 <3!> s2
    <6!>4 <6> <6> <6!>
    <6> <_-> <_-> s
    <6- 4>2 <_->
    <2> <6>
    <6- 5> <6 5->
    <6 5> <_->4 <_- 6>
    <_!>1
    <_->
    s1*7
    <4- 2>2 <6>
    <4! 2> <6>
    <6> <_- 6>4 <6>
    <9> <6> <6> s
    <9>2 <8>4 <6>
    <6 5>2 <6 5>
    s1*4
    s2 s4 <6>
    <_- 9>1
    <6 5>2 s4 <_- 6>
    <_+>1
    s4 <6+> <6>2
    < _- 9>4 <8> <6>2
    <_+>1
    <6 5>2 <6 4>
    <4> <3+>
    <6 5> <6 4>
    <4>4 <3+> <8> <7>
    <7>2 <6 4>
    <_+> <7 5>
    <4> <3+>
    s <_->4 <6>
    <6 4>2 <3>

}


forma = {

    \time 2/2
    \key re\minor
    \tempo 1 = 40
    s1*103
    s2 r\fermata
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

    fa4 sib2 la4
    sib r8 fa sol fa sol fa
    sol16 la sib8 r sol la sol la sol

    %4
    la16 sib do8 r do sol do sol do
    sol[la sib do16 re] la4 sol
    fa r8 la sib la sib la

    %7
    sib16 do re8 r la sib la sib la
    sold16 la si8 r sold\mbreak la sold la sol
    sol fa16 mi fa8 sib sib la r sib

    %10
    sib la r la re sol, sol la16 sib
    la sol fa mi re8 sol fa mi fa4~
    fa8 mi mi4\tr re r8 fad

    %13
    sol4 r8 sol la4 r8 la
    sib8 do re2 do4
    re r r2

    %16
    R1

}


IVvlIn = \relative do'' {

    R1*11
    r2 r8 la sib4
    r8 sib do4 r8 do re4
    R1
    r8 re re2 do4
    re r r2\fermata

}

IVvlIIn = \relative do'' {

    R1*11
    r2 r8 fad, fad4
    r8 sol sol4 r8 la la4
    R1
    r8 la sib fad sol2
    fad4 r r2\fermata

}

IVvlan = \relative do' {

    R1*11
    r2 r8 re sib4
    r8 mib do4 r8 fa re4
    R1
    r8 fad re la' sol2
    la4 r r2\fermata

}

IVvcn = \relative do' {

    sib8\solo do re sib fa' mib fa mib
    re sib16 do re8 sib mib re mib re
    mib re mi[mi] fa mi fa mi

    %4
    fa mi fa la, sib la sib la
    sib do re sib do sib do sib
    la fa16 sol la8 fad sol fad sol fad

    %7
    sol sib16 do re8 fad sol fad sol fa
    mi re mi re\mbreak dod si dod[la]
    re re, r re' dod re16 dod re8 re

    %10
    dod re16 dod re8 fa sib, sib sib la16 sol
    fa8 re sib'[ sol] re' dod re[sold,]
    la4 la, re8 re' re[re,]

    %13
    mib mib' mi[mi,] fa fa' fad[fad,]
    sol la sib sol mib'4 mib,
    re8 re' re re, mib2

    %16
    re4 r r2\fermata

}

IVbcn = \relative do {

    R1*11
    r2 r8 re re4
    r8 mib mi4 r8 fa fad4
    R1
    r8 re re4 mib2
    re4 r r2\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*11
    s2 s8 <_+> <_+ 6->4
    s8 <5> <6>4 s2
    s1
    s8 <_+> <_+ 6->4 <7> <6>
    <_+>

}


forma = {

    \time 4/4
    \key re\minor
    \tempo 4 = 37
    s1*16
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

    \tupletSpan 4 r8 r16 re
    sol8. la16 \tuplet 3/2 { sib8 la sol } re'4 r8 r16 la
    \tuplet 3/2 { sib8 la sib } do8. sib16 \tuplet 3/2 { la8 sol fa } sib4
    sol do la sib

    %4
    do la sib r
    fa fad \tuplet 3/2 { sol8 la sib } sol4
    \tuplet 3/2 { la8 sib do } la4 sib8. la16 \tuplet 3/2 { sol8 la sol } \mbreak

    %7
    dod2] re4 re~
    re dod re\upl^\markup\italic"staccato"  sib\upl
    \tuplet 3/2 { la8 sol fa sol[fa mi] } re4 r8 r16 fa

    %10
    sib8. fa16 \tuplet 3/2 { fa8 sol fa } sib8. fa16 \tuplet 3/2 { fa8 sol fa }
    sib4 do8. la16  sib4 r8 r16 sol
    do8. sol16 \tuplet 3/2 { sol8 lab sol } do8. sol16 \tuplet 3/2 { sol8 lab sol }\mbreak

    %13
    \tuplet 3/2 { lab sol fa } sol8. fa16 \tuplet 3/2 { mib8 re do } sol'8. la16
    \tuplet 3/2 { sib8 la sol } la8. sol16 \tuplet 3/2 { fad8 mi re } r8 r16 sol
    sol4 r8 r16 fa fa4 r8 r16 sol

    %16
    lab4 sol fad fad8. fad16
    re'4~\tuplet 3/2 { re8 do sib} la4 fad
    sol2\mbreak sol4 re'8. sol,16

    %19
    \tuplet 3/2 { sib8 la sol } la8. fad16 sol4

}


VvlIn = \relative do'' {

    \tupletSpan 4 r8 r16 re^\markup\italic "unis[oni]"
    sol8. la16 \tuplet 3/2 { sib8 la sol } re'8. re,16 re8. la'16
    \tuplet 3/2 { sib8 la sib } do8. sib16 \tuplet 3/2 { la8 sol fa } sib8. fa16
    \tuplet 3/2 { sol8 fa mib } do'8. sol16 \tuplet 3/2 { la8 sol fa } sib8. re16

    %4
    \tuplet 3/2 { do8 sib do } fa,8. la16 sib8. fa16 \tuplet 3/2 { sib,8 re mi }
    \tuplet 3/2 { fa sol la } fad8. fad16 \tuplet 3/2 { sol8 la sib } sol8. re16
    \tuplet 3/2 { la'8 sib do } la8. re,16 sib'8. la16 \tuplet 3/2 { sol8 la sol } \mbreak

    %7
    dod8.[dod16 dod8. dod16] \tuplet 3/2 { re8 do sib } la8. sib16
    \tuplet 3/2 { fa8 mi fa mi[re mi] } re4\upl  sib'\upl
    \tuplet 3/2 { la8 sol fa sol[fa mi] } re4 r8 r16 fa

    %10
    sib8. fa16 \tuplet 3/2 { fa8 sol fa } sib8. fa16 \tuplet 3/2 { fa8 sol fa }
    \tuplet 3/2 { sib do re do[sib la] } sib8. fa16 re8. sol16
    do8. sol16 \tuplet 3/2 { sol8 lab sol } do8. sol16 \tuplet 3/2 { sol8 lab sol }\mbreak

    %13
    \tuplet 3/2 { lab sol fa } sol8. fa16 \tuplet 3/2 { mib8 re do } sol'8. la16
    \tuplet 3/2 { sib8 la sol } la8. sol16 \tuplet 3/2 { fad8 mi re } re'4\upl
    \tuplet 3/2 { mib,8 re do } do'4\upl \tuplet 3/2 { re,8 do sib } sib'8. sol16

    %16
    lab8. [do,16 do8. do16] \tuplet 3/2 { fad8 sol fad } fad8. fad16
    re'4~\tuplet 3/2 { re8 do sib la[sol la] } re,8. fad16
    sol4~\tuplet 3/2 { sol8 fa! mib }\mbreak \tuplet 3/2 { re re' do } re8. sol,16

    %19
    \tuplet 3/2 { sib8 la sol la[sol fad] } sol4

}

Vvlan = \relative do' {

    r4
    sib re la' r8 r16 re,
    re4 sol do, fa
    sib, sol' do, fa8. re16

    %4
    sol4 la8. do,16 re4 r
    do la' re, r
    re r re r\mbreak

    %7
    mi mi la8. sol16 \tuplet 3/2 { fa8 mi re }
    fa4 la fa\upl re\upl
    \tuplet 3/2 { fa8 mi re } mi8. dod16 re4 r

    %10
    re do re do
    fa sol8. do,16 re4 r
    mib re mib do'\mbreak

    %13
    do, re4 do r
    re mib re r8 r16 re
    do4 r8 r16 do' fa,8. re16 re8. re16

    %16
    mib4 sol la la8. la16
    sol4 re8. sol16 mib4 re8. re'16
    do4 mib,8. sol16\mbreak sib4 sib8. mib,16

    %19
    sol4 fad8. la16 sol4

}

Vbcn = \relative do {

    r4
    sol' sol,8. sol'16 fad4 r8 r16 fad
    sol4 mib fa? re
    mib mi fa re8. sib16

    %4
    mib4 fa sib, r
    la re8. do16 sib4 r
    fad' r sol r\mbreak

    %7
    sol sol fad fad8. sol16
    la4 la, re\upl sol\upl
    la la, re r

    %10
    sib la sib la
    re mib8. fa16 sib,4 r
    do si do mib\mbreak

    %13
    fa si, do r
    sol' do, re r8 r16 sib'
    do4 r8 r16 la sib4 r8 r16 sib,

    %16
    do4 mib re do
    sib8.[la16 sib8. sol16] do4 re
    mib do\mbreak sib sib8. do16

    %19
    re4 re, sol

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s1
    s4 <6> s <6>
    s2 s4 <6>
    <6 5>1
    <6>4 <_+> <6> s
    s1
    <4+ 6>2 <6>
    <6 4>1
    <6>
    s4 <6> s <6>
    <6> <6> s s
    <_-> s <_-> <6>
    <_-> s <_-> s
    s <_- 6> <_+> s8 s16 <6>
    <_->4 s8 s16 <6> s4 s8 s16 <6>
    <_- 6>4 <6> <_+> <6 4+>
    <6>2 <_- 6 5>4 <_+>
    <6>2 <6>4 s8. <_->16
    <6 4>4 <3>

}


forma = {

    \time 4/4
    \key re\minor
    \tempo 2 = 70
    \partial 4 s4
    s1*8
    s2 s4 \bar":..:" s4
    s1*9
    s2 s4
    \bar ":|."

}

Vfl = {
    %\notypeset
    <<\Vfln \forma>>

}

VvlI = {
    <<\VvlIn \forma>>

}


Vvla = {
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \clef bass
    <<\Vbcn \forma>>
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



VIfln = \relative do'' {

    sol'8. la16 fad8
    sol re sol
    re'\noBeam do16 sib la sol

    %4
    fad mi re mi fad re
    sol8. la16 fad8
    sol re sib'

    %7
    la sol16 fad sol la
    re, mi fad sol la8\noBeam
    re\noBeam do16 sib la sol

    %10
    fad4.
    re'8. re16 do8
    si16 la sol la si8\noBeam

    %13
    do sol fa
    mib16 fa mib re do8\noBeam
    do'8. do16 sib?8

    %16
    la16 sol fa sol la8\noBeam
    sib fa mib
    re16 mib re do sib8\noBeam

    %19
    sib' do16 sib la sol
    fad8. fad16 sol8
    la re, fad

    %22
    sol4 sol8
    sol la16 sol fad8
    sol4.

}


VIvlIn = \relative do'' {

    sol'8. la16 fad8
    sol re sol
    re'\noBeam do16 sib la sol

    %4
    fad mi re mi fad re
    sol8. la16 fad8
    sol re sib'

    %7
    la sol16 fad sol la
    re, mi fad sol la8\noBeam
    re,\noBeam do16 sib la sol

    %10
    re'4.
    re'8. re16 do8
    si16 la sol la si8\noBeam

    %13
    do sol fa
    mib16 fa mib re do8\noBeam
    do'8. do16 sib?8

    %16
    la16 sol fa sol la8\noBeam
    sib fa mib
    re16 mib re do sib8\noBeam

    %19
    sib' do16 sib la sol
    fad8. fad16 sol8
    la re, fad

    %22
    sol fa!16 mib re do
    sib8\noBeam do16 sib la sib
    sol4.

}

VIvlan = \relative do' {

    sib'8. do16 la8
    re, r r
    re8. re16 mib8

    %4
    re fad la
    re, mib re
    re sol re

    %7
    mib8. re16 do8
    fad la mi!
    fad4 sol8

    %10
    la4.\mbreak
    fa4 fa8
    sol4 lab8

    %13
    sol8. sol16 lab8
    sol r r
    do,4 mi!8

    %16
    fa4 do8
    fa4 do'8
    fa, r r

    %19
    fa8. re16 sol8
    la4 re,8
    mib re la'

    %22
    re,4 mib8
    re8. sol16 fad8
    sol4.

}

VIbcn = \relative do {

    sol'4 re8
    sib r r
    sib4 do8

    %4
    re4 do8
    sib do re
    sol sib sol

    %7
    do,4 mib8
    re4 dod8
    re4 mib8

    %10
    re4.
    sib'4 lab8
    sol4 fa8

    %13
    mib4 si8
    do r r
    la'4 sol8

    %16
    fa4 mib8
    re4 la8
    sib r r

    %19
    sib4 mib8
    re do sib
    do re do

    %22
    sib4 do8
    re4 re,8
    sol4.

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <_+>8
    <6> s s
    <6>4 <_- 6>8
    <_+>4 <6 4+>8
    <6> <_-> <_+>
    s <6> s
    <_- 6>4 <6>8
    <_+>4.
    <_+>4 <6>8
    <_+>4.
    <5>4 <6>8
    <_!>4 <6 4!>8
    <6>4 <7- 5>8
    <_-> s s
    <6>4 <6!>8
    s4 <6 4>8
    <6>4 <5->8
    s4.
    s4 <6>8
    <_+> s <6>
    <_- 6 5> <_+> <6 4+>
    <6>4 <_->8
    <6 4>4 <3>8

}


forma = {

    \time 3/8
    \key re\minor
    \tempo 4. = 62
    s4.*10
    \bar":..:"
    s4.*14
    \bar ":|."

}

VIfl = {
    %\notypeset
    <<\VIfln \forma>>

}

VIvlI = {
    <<\VIvlIn \forma>>

}


VIvla = {
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
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

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

\paper {

    systems-per-page = #3

}

    \header {
        subtitle = \markup \larger "Sinfonia Nona [autografo 1715]"
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

    %\pageBreak

    \markup \huge {[3.] Moderato}

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

}

\bookpart {

\paper {

    systems-per-page = #4

}

    \markup \huge {[5.] Allegriss[im]o}

    \score {

        <<
            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \Vfl \global
            >>

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlI\global
                    >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \Vvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
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
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

    \markup \huge {[6.] Menuet}

    \score {

        <<
            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \VIfl \global
            >>

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIvlI\global
                    >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \VIvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \VIbc\global
                >>
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

}



