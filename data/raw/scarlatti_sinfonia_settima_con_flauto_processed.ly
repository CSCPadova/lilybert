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

    sol'2 la4
    sol8. la16 sib4 r
    sib8. la16 sol4 sol

    %4
    fa8. mi16 fa4 do'
    fa,~fa8. sol16 fa8. fa16
    sol4~sol8. sib16 re4

    %7
    sol, r r
    do r re\mbreak
    sol, re' do

    %10
    sib8. la16 sib4 r
    do r fa,
    do8. re16 do4 r

    %13
    r r sol'
    sib8. do16 re4 r
    sib8. do16 re4 r\mbreak

    %16
    R2.*2
    r4 r8 r16 la la8. dod16
    re4 r re

    %20
    re8.[dod16 re8. la16 sib8. fad16]
    sol2 sol4
    re re'~re8. dod16

    %23
    re4 la re,
    re2.

}


IvlIn = \relative do'' {

    re4 sol fad
    sol re sol8. la16
    sib8. do16 do4~do8. sib16

    %4
    sib4 la fa8. sol16
    la8. fa16 sib4~sib8. la16
    sol8. fa16 mib4 sib'

    %7
    sib8.[la16 sol8. fa16 mib8. re16]
    do4 r8 r16 la' sib8. fa16\mbreak
    sol8. sib,16 sib4 la

    %10
    sib r8 r16 re re8. mi!16
    fa4 fa fa
    fa mi!8.[mi16 mi8. fad16]

    %13
    sol4 sol sol
    sol fad8.[la16 re8. la16]
    sib4 la8. la,16\p re8. la16\mbreak

    %16
    sib8.[la16 sib8. do16 re8. do16]
    re8. mib16 do4~do8. re16
    re8. mi!16 fad4\f~fad8. sol16

    %19
    la4 la,8. la16 sib4
    sib la r8 r16 la'
    sib8. fad16 sol4~sol8. sib,16\p

    %22
    sib4 la8.[sol16 la8. sib16]
    la4 re sib
    la2.

}

IvlIIn = \relative do'' {

    sib4. do8 la4
    sib~sib8. [la16 sib8. do16]
    re4 sol~sol8. sol16

    %4
    do,4~do8.[sib16 la8. sib16]
    do4 fa fa
    sib, r8 r16 sol' fa8. fa16

    %7
    sol8.[fa16 mib8. re16 do8. sib16]
    la4 r re\mbreak
    sib8. sol16 fa4 do'

    %10
    re re, r
    do' r8 r16 do do8. re16
    do4 sol r

    %13
    r r8 r16 re' re8. mib16
    sib4 sib r
    sol' fad r\mbreak

    %16
    re,8.\p[do16 re8. mi?16 fa8. mi16]
    fa8. sol16 sol2
    la4 re8.\f[la16 re8. mi16]

    %19
    fad4 r8 r16 fad, sol4
    sol fad r
    sol'8. la16  sib8. sib,16 sib8. sol16\p

    %22
    sol4 fad8.[mi16 fad8. sol16]
    fad4 la sol
    fad2.

}

Ivlan = \relative do' {

    re2 re4
    re8. do16 sib4 r
    sol'~sol8. sol16 do,4

    %4
    r8 r16 do fa4 r
    fa8. la16 fa4~fa8. fa16
    mib4 r fa

    %7
    mib r r
    fa  r fa\mbreak
    mib re fa
    fa r r

    %11
    fa r8 r16 do la'8. sol16
    sol8. fa16 sol4 r
    r r8 r16 sol sol8. sol16

    %14
    re4 re r
    re re r\mbreak
    re r la~\p

    %17
    la do2
    fad8. sol16 la4 r
    re,\f r8 r16 re re4

    %20
    re re r
    mi mi mi\p
    re re r

    %23
    re re re
    re2.

}

Ivcn = \relative do {

    sol'2 re'4
    sol sol, r
    sol'8. fa16 mib4 mi

    %4
    fa4 fa, r
    fa' re re
    mib r re

    %7
    mib r r
    mib r re\mbreak
    mib fa fa,

    %10
    sib sib, r
    la' r8 r16 la la8. si16
    do4 do, r

    %13
    r r8 r16 sib' sib8. do16
    re4 re, r
    sol re r\mbreak

    %16
    sol r fa\p~
    fa mib2
    re4 re' r

    %19
    re\f r8 r16 re sol,4
    re' re, r
    dod' dod dod,\p

    %22
    re re r
    re fad sol
    re2.

}

Ibcn = \relative do {

    sol'2 re4
    sol, r r
    sol' mib mi

    %4
    fa4 fa, r
    fa' re re,
    mib' r re

    %7
    mib r r
    mib r re\mbreak
    mib fa fa,

    %10
    sib r r
    la r8 r16 la' la8. si16
    do4 do, r

    %13
    r r8 r16 sib' sib8. do16
    re4 re, r
    sol re r\mbreak

    %16
    sol r fa\p~
    fa mib2
    re4 re, r

    %19
    re'\f r8 r16 re sol,4
    re' re, r
    dod' dod dod\p

    %22
    re re, r
    re' fad sol
    re2.

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <_+>4
    s2.
    s4 <6> <6 5>
    <4> <3> s
    s <6> s
    s2 <6>4
    s2.
    <4! 2>4 s <6>
    s <6 4> <3>
    s2.
    <6>4 s8 s16 <6> s4
    <4> <3!> s
    s4 s8 s16 <6> s8. <_->16
    <6 4>4 <3+> s
    s <_+> s
    s2 <6>4
    s <6>2
    s4 <_+> s
    <_+>2.
    <6 4>4 <5 3+> s
    <7 5>2.
    <6 4>4 <5 3+>2
    <_+>2.
    <_+>

}


forma = {

    \time 3/4
    \key re\minor
    \tempo 2 = 45
    s2.*24
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
    \clef bass
    \clef tenor
    <<\Ivcn \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}




IIfln = \relative do'' {

    R1*27
    r4 sol' re sol
    fad re8 mi fa4 fa

    %30
    mi do8 re mib4 mib
    re mi!8 fad sol4 sol
    sol2 fad

    %33
    sol r
    R1*5
    r4 re8 mi fa4 fa

    %40
    mi do8 re mib4 mib
    re sib' fa sib
    la la8 sib do4 do

    %43
    do sib8 la sib4 sib
    sib2 la
    sib r

    %46
    R1*3
    r4 do sol do
    si sol8 la sib4 sib

    %51
    la fa8 sol lab4 lab
    sol2 r
    R1*4

    %57
    r4 re' la re
    dod la8 si do4 do
    si sol8 la sib4 sib\mbreak

    %60
    la si8 dod re4 re
    re2 dod
    re r

    %63
    R1*14
    r4 sol, re re'
    dod la8 si do4 do

    %79
    si sol8 la sib4 sib
    la sib8 do re4 re
    sol, la8 sib do4 do\mbreak

    %82
    fa, sol8 la sib4 sib
    sib2 la
    sib r

    %85
    r4 la8 sib do2
    R1*3
    r4 do sol do

    %90
    r4 re,8 mi fad4 fad8 sol
    la4 re la re\mbreak
    re si8 do re2

    %93
    re1~
    re
    re2 sol,

    %96
    r4 re' la re
    r sib8 do re4 sol,
    sol2 r4 sol

    %99
    la2 r4 sol
    la2 re,
    re r\fermata

}


IIvlIn = \relative do'' {

    r4 sol' re sol
    fad re8 mi fa4 fa
    mi do8 re mib4 mib

    %4
    re mi!8 fad sol4 sol
    sol2 fad
    sol sib,

    %7
    la r4 mi'8 fad
    sol2 r4 re8 mi
    fa?2. mi8 re

    %10
    mi4 la, mi sol
    fa8 re re'[mi] fa4 fa
    mi do8 re mib4 mib

    %13
    re sib la sib\mbreak
    la2 r4 la8 sib
    do2 r4 do'

    %16
    fad, sol8 la re,4 mib
    do re8 mib re4 do
    sib sib'8 do re2

    %19
    r4 re,8 mi? fa?4 la,
    re, la' sib fa8 sol
    la2 r

    %22
    r4 sol' re sol
    sol2 fa
    mi2. mi4\mbreak

    %25
    la, re8 mi fa4 fa,
    r la'8 sib do4 do,
    r mib8 fa sol4 mib

    %28
    re2 r
    r4 sib,\p la2
    r4 la sol2

    %31
    r4 sib' sol do
    sib2 la
    sol r

    %34
    r4 re''\f la re
    dod la8 si do4 do\mbreak
    si sol8 la sib4 sib

    %37
    la si8 dod re4 re
    re2 dod
    re r

    %40
    r r4 mib,,8\p fa
    sol4 sol, r re''
    do do8 re mib4 sol,

    %43
    fa re'8 do re4 sib
    re2 do
    r4 sib'\f fa sib

    %46
    la fa8 sol lab4 lab
    sol do sol do\mbreak
    do2 si

    %49
    do r
    R1*3
    r4 sib fa sib

    %54
    lab fa8 sol lab4 lab
    sol do sol do
    si sol8 la sib4 sib

    %57
    la2 r
    r4 la, mi sol
    r sol re fa\mbreak

    %60
    r re sib sol'
    fa2 mi
    r4 la' re, sol

    %63
    fad re8 mi fa4 fa
    mi! do8 re mib4 mib
    re do8 sib mib4 sol

    %66
    re si8 do re4 fa8 sol
    do,4 la8 sib? do re  mib fa
    sib,4 sib' mib, lab

    %69
    sol lab8 sol fa mi! fa sol
    mi!4 do' fa, sib\mbreak
    lab sib8 do sol fad sol la?

    %72
    fad2 r4 sol
    re la' r re
    sol, do r do

    %75
    do2 sib
    la la
    sol r4 sib,\p

    %78
    la2 r4 fad
    sol2 r4 mi
    fa!2 r4 la

    %81
    sib2 r4 sol\mbreak
    fa2 r4 mi
    do'2 r

    %84
    r4 fa sib, sib'
    la fa8 sol lab4 lab
    sol2 r

    %87
    r4 sol re sol
    fad re8 mi fa4 fa
    mi do8 re mib4 mib

    %90
    re re' la re
    dod la8 si do4 do\mbreak
    si sol8 la sib4 sib

    %93
    la fad8 sol la4 la
    re, sol8 fad sol4 sol
    fad sol8 fad sol2

    %96
    sol fad
    sol r4 si
    do2 r4 do,

    %99
    mib2 r4 sib
    la2 la
    sib r\fermata

}

IIvlIIn = \relative do'' {

    R1*5
    r4 re' sol, re'
    dod la8 si do4 do

    %8
    si sol8 la sib4 sib
    la si8 dod re4 re
    re2 dod

    %11
    re r4 la8 si
    do2 r4 sol8 la
    sib!4 re,8 mi fad4 re\mbreak  %% fine primo sistema

    %14
    r4 fad8 sol la4 la,
    r mi'!8 fad sol4 sol,
    la2 sib

    %17
    la2. la'4
    re, sol8 la sib4 sib,8 do
    re4 sib' la fa?8 sol

    %20
    la4 fa re2
    r4 la' mi la
    re,2 r4 re

    %23
    dod re8 mi la,4 la'
    sol la8 sib la sib sol la\mbreak
    fa4 la, r fa'8 sol

    %26
    la4 do, r do8 re
    mib4 do sol do
    si sol8\p la si4 mib,

    %29
    re2 r4 la'8 si
    do4 do, r sol'8 la
    sib?2 mib,

    %32
    re1
    r4 sol'\f re sol
    fad re8 mi fa4 fa

    %35
    mi2 la4 fad\mbreak
    re si8 dod re4 re8 dod
    re fa sol la sol4 re

    %38
    fa2 mi
    fa r4 la,8\p si
    do4 do, r sol'8 la

    %41
    sib4 sol r re8 mi
    fa2 mib
    re4 sol re sol

    %44
    fa2 fa
    sib, r
    r4 fa''\f do fa

    %47
    mi! do8 re mib4 mib\mbreak
    mib2 re
    mib r

    %50
    R1*2
    r4 mib sib mib
    re sib8 do reb4 reb

    %54
    do fa do fa
    mi! do8 re? mib4 mib
    re sol re sol

    %57
    fa2 r4 fa,8 sol
    la4 la, r mi'?8 fad
    sol4 sol, r re'8 mi\mbreak

    %60
    fa4 sol8 la sol4 sib,
    la2 la
    re r

    %63
    R1*2
    r4 re'' sol, do
    si sol8 la sib4 sib

    %67
    la fa8 sol lab4 lab
    sol2 do,4 mib
    mib?2 reb

    %70
    do sib4 fa'\mbreak
    fa2 mib
    re4 la sib8 la sib do

    %73
    la4 fad'8 sol la4 la,8 sib
    do4 mi?8 fad sol4 sol,
    la8 sib sol la re,4 re'

    %76
    do2 do
    sib r4 sib\p
    la2 r4 fad

    %79
    sol2 r4 mi
    fa!2 r4 la
    sib2 r4 sol\mbreak

    %82
    fa2 r4 fa
    mib do'2 re8 do
    re2 re,4 re'

    %85
    do2 r
    r4 do' sol do
    si sol8 la sib4 sib

    %88
    la2 do,~
    do4 sol do8 sib do sib
    la2 re4 la

    %91
    la' fad8 sol la4 la\mbreak
    sol re sol2
    r4 re la do

    %94
    si sol8 la sib4 sib
    la sib8 la sib4 sib'
    sib2 la

    %97
    sib4 sol re fa
    mi! do8 re mib4 mib
    la,2 r4 sol

    %100
    sol2 fad
    sol r\fermata

}

IIvlan = \relative do' {

    R1*12
    r4 sol' re sol\mbreak
    fad4 re8 mi fa4 fa

    %15
    mi do8 re mib4 mib
    re mi!8 fad sol4 sol
    sol2 fad

    %18
    sol r4 sol8 la
    sib4 sib,8 do re4 re8 mi
    fa4 fa sol la

    %21
    mi fa8 sol la4 mi8 fa
    sol4 sol4. fa8 mi re
    mi2 re4 fa

    %24
    sib2 mi,!\mbreak
    re4 fa8 sol la2
    r4 fa do fa

    %27
    r mib do sol'
    sol2 r
    R1*4

    %33
    r4 sib,8 do re4 sib'
    la2 r4 la
    la2 r4 la\mbreak

    %36
    sol re r fa8 sol
    la4 fa r sol
    la2 la

    %39
    la r
    r4 la,8 si do4 do,
    r sol'' re fa

    %42
    r fa mib2
    re4 sol re sol
    fa2 fa

    %45
    r4 re sib' fa8 sol
    la4 do, r fa
    do' do, r sol'\mbreak

    %48
    sol2 sol
    sol r
    R1*3

    %53
    r2 r4 reb8 mib
    fa2 r
    r r4 mib8 fa

    %56
    sol2 r4 re
    re2 r
    R1*3

    %61
    r4 la' mi sol
    fad re8 mi fa4 mib
    re fad8 sol la4 sol

    %64
    do, mi8 fa? sol4 fa
    fa2  r4 sol
    sol re re2

    %67
    r4 do do2
    r4 mib mib do'
    sib2 sib

    %70
    sol fa4 reb'\mbreak
    do2 r
    r4 fad, re2

    %73
    r4 la' re, fa
    r sol do, sol'
    fad re r sol

    %76
    mib2 mib
    re r
    r4 la\p mi? la

    %79
    r sol re sol
    fa2 fa'
    fa mib\mbreak

    %82
    mib? re4 re
    do re8 mib fa4 fa,
    sib re8 mi! fa2

    %85
    r4 fa do fa
    mib mib8 fa sol4 mib
    re do r sib8 do

    %88
    re4 re la' la
    sol mi8 fad sol4 la8 sol
    fad2 fad

    %91
    fad fad\mbreak
    sol sol
    fad fad

    %94
    sol4 si, re2
    la' mi
    re re

    %07
    re r4 re
    do mi8 fad sol4 do,
    do'2 r4 sol

    %100
    mib2 re
    re r\fermata

}

IIvcn = \relative do' {

    R1*19
    r4 re sol, re'
    dod la8 si do4 do

    %22
    si sol8 la sib4 sib
    la si8 dod re4 re
    re2 dod\mbreak

    %25
    re r4 re,8 mi
    fa4 fa8 sol la4 la8 si
    do4 do,8 re mib4 mib8 fa

    %28
    sol2 r
    R1*4
    r4 sol8 la sib?4 sib8 do

    %34
    re4 re, r re
    la'2 fad4 re\mbreak
    sol2 r4 re'8 mi

    %37
    fa4 re sib2
    la la,
    re r

    %40
    R1*5
    r4 sib'8 do re4 sib
    fa' la,8 sol fa2

    %47
    r r4 mib'8 fa\mbreak
    sol2 sol,
    do,4 do'8 re mib4 mib8 fa

    %50
    sol4 sol, re re'8 mi!
    fa4 fa, do do'8 re
    mib4 mib,8 fa sol4 sol8 la
    sib4 sib, r2

    %54
    r r4 lab'8 sib
    do4 do, r2
    r r4 sib'8 do

    %57
    re4 re, r2
    R1*5
    r4 re' la si

    %64
    r do sol la
    sib?2 r4 mib8 fa
    sol4 sol, r re'8 mi!

    %67
    fa4 fa, r do'8 re
    mib4 sol, lab2
    sib sib

    %70
    do4 reb8 do reb4 sib\mbreak
    do2 do,
    r4 re' sol, sol'

    %73
    fad re8 mi fa4 fa
    mi! do8 re mib4 mib
    re8 re, mi!8 fad sol4 sol

    %76
    sol2 fad
    sol r
    r4 la\p mi la

    %79
    r sol re sol
    fa2 fa'
    fa mib\mbreak

    %82
    mib? re4 re
    do re8 mib fa4 fa,

    %84
    sib4 sib8 do re4 re8 mi!
    fa4 fa, r fa'
    do do8 re mib4 do

    %87
    sol mib'8 fa sol4 sol,
    r2 r4 la8 si
    do4 do, r4 do'

    %90
    re2 re
    re re\mbreak
    re re

    %93
    re re
    re re
    re dod

    %96
    re1
    sol,2 r4 sol
    do2 r4 do

    %99
    fad,2 r4 sol
    do,2 re
    sol r\fermata

}

IIbcn = \relative do {

    R1*19
    r4 re' sol, re'
    dod la8 si do4 do

    %22
    si sol8 la sib4 sib
    la si8 dod re4 re
    re2 dod\mbreak

    %25
    re r4 re,8 mi
    fa4 fa8 sol la4 la8 si
    do4 do,8 re mib4 mib8 fa

    %28
    sol2 r
    R1*4
    r4 sol8 la sib?4 sib8 do

    %34
    re4 re, r re
    la'2 fad4 re\mbreak
    sol sol, r re'8 mi

    %37
    fa4 re sib2
    la la
    re, r

    %40
    R1*5
    r4 sib'8 do re4 sib
    fa' la8 sol fa2

    %47
    r r4 mib8 fa\mbreak
    sol2 sol,
    do r

    %50
    R1*2
    r4 mib8 fa sol4 sol8 la
    sib4 sib, r2

    %54
    r r4 lab'8 sib
    do4 do, r2
    r r4 sib'8 do

    %57
    re4 re, r2
    R1*5
    r4 re' la si

    %64
    r do sol la
    sib?2 r4 mib,8 fa
    sol4 sol, r re'8 mi!

    %67
    fa4 fa, r do''8 re
    mib4 sol, lab2
    sib sib,

    %70
    do reb4 sib\mbreak
    do2 do,
    r4 re' sol, sol'

    %73
    fad re8 mi fa4 fa
    mi! do8 re mib4 mib
    re mi!8 fad sol4 sol

    %76
    sol2 fad
    sol r
    R1*6

    %84
    r4 sib,8 do re4 re8 mi!
    fa4 fa, r fa'
    do do8 re mib4 do

    %87
    sol' mib8 fa sol4 sol,
    r2 r4 la'8 si
    do2 r4 do,

    %90
    re2 re
    re re\mbreak
    re re

    %93
    re re
    re re
    re dod

    %96
    re1
    sol,2 r4 sol
    do2 r4 do

    %99
    fad,2 r4 sol
    do2 re
    sol, r\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*19
    <_->1
    s4 <6> <6> s
    s2 <6>
    <_+ 7>1
    <6 4 2>
    s2 s4 <6>
    s2 s4 <6>
    <_->2 <6>
    <_!>1
    s1*4
    s2 <6>
    <_+> s4 <_->
    <_+>2 <5->4 <_+ 7>
    <_!>2 s4 <6->8 <6+>
    <6>2 <6>
    <6 4> <3>
    s1*6
    s2 <6>
    s4 <6> s2
    s s4 <6>
    <6- 4>2 <3>
    <_->1
    s1*2
    s2 <6->
    s1
    s2 s4 <6>
    <_->1
    s2 s4 <6>
    <_->1
    s1*5
    s4 <_+> <6->2
    s4 <_!> <6->2
    <5>2 s4 <6>
    <_!>2 s4 <6->
    <_!>2 s4 <6->
    s <6-> s2
    <6 4> <_->
    <_!> <6>
    <6- 4> <_->
    s4 <_+> s2
    s <6>
    s <6>
    <_+ 7> <_->
    <2 6- 4> <7- 5>
    s1*8
    <_!>2 s4 <_->
    <_->2 <6>
    <_!>4 <6> <_->2
    s s4 <6->
    <_!>2 s4 <_- 6>
    <_+>1
    <_+ 7+>2 <_+ 7->
    <6! 4> <6- 4>
    <_+> s
    <6! 4> <6- 4>
    <_+> <7- 5>
    <6 4>2 <3>
    <_-> s4 <_!>
    <_!>2 s4 <_->
    <7- 5>1
     <_- 6 5>2 <_+>

}


forma = {

    \time 2/2
    \key re\minor
    \tempo 2 = 63
    s1*101
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

    R1*6
    r8 sol' sol sol\mbreak do fa, fa fa
    fa mi!16 re mi8 do sib' sib sib sib

    %9
    sib lab16 sol lab8 fa si do16 si do4~
    do si do r
    R1*4

    %15
    r2 r8 la la la
    re[do do sib16 la] sib8 sib sib sib
    sib do16 re do8 sib sib la16 sol la8 la

    %18
    sib sib16 la sib8 la sol mi16 fa sol8 sib
    sib la16 sol la8 sol fad sol la4
    r8 re16 dod re4\mbreak r8 re16 dod re4

    %21
    r8 re16 dod re8 re sol, sol sol sol
    re' re re dod re2

}


IIIvlIn = \relative do'' {

    sib4 mib4. re8 re do
    sib4 fa'4. mib8 mib re
    mib4 mib4. re8 mib do

    %4
    re4. mib8 fa fa, sol4~
    sol8 fa lab2 sol8 fa
    mib4 mib2 re8 do

    %7
    re4 r\mbreak r2
    R1*2
    r2 r8 mib' mib mib

    %11
    mib mib, mib mib sib' sib reb[reb]
    reb reb do sib lab lab lab lab
    la! la la la\mbreak sib sib sib sib

    %14
    si si re[re] re do do do
    dod dod dod dod re4 r
    R1*3

    %19
    r2 r4 r8 re'\f
    re,4 r8 re\mbreak re'4 r8 re
    re,4 re re dod

    %22
    re re8 mi fad2

}

IIIvlIIn = \relative do'' {

    sol2 lab~
    lab8 sol lab fa sol4. sib8
    sib la! la sol fa2

    %4
    fa4 fa2 do'8 sib
    lab4 do si8 do re4
    sol, la! sol4. fad8

    %7
    sol4 r8 si,\p\mbreak do do' re[re]
    sol,4 r8 mi! fa fa' sol sol
    do,4. lab8 sol4. lab8

    %10
    fa2 mib8 sol sol sol
    solb solb solb solb reb reb sib'[sib]
    sib sib sol?[sol] sol fa do' do

    %13
    do do do do\mbreak fa, fa fa fa
    fa fa lab[lab] sol sol sol sol
    sol sol sib sib la?4 r

    %16
    r8 la\p la la la sol16 la sib8 re
    sol, sol sol sol sol fa16 mi fa8 do'
    fa, fa fa fa' dod dod16 re mi8 sol,

    %19
    sol mi mi mi' la,4 r8 la'\f
    sib sib, r sib'\mbreak la4 r8 la
    sib sib, r la sol4 sol

    %22
    la la8 sol la2

}

IIIvlan = \relative do' {

    sib'2 fa
    sib sib,
    do do4 do'~

    %4
    do8 sib sib4. lab8 sol4
    do,2 fa8. mib16 re4
    do do2 si8 la

    %7
    si4 r8 sol\p \mbreak la la si4
    do8 do, r do' re re mi!4
    fa4. fa8 fa[mib mib re16 do]

    %10
    re2 do8 do do do
    do do do do do sib fa'[fa]
    sol sol do,[do] do do do[do]

    %13
    fa fa fa fa\mbreak fa fa sib,[sib]
    fa' fa fa fa mib mib do[do]
    sol' sol sol sol re4 r

    %16
    r8 fad,\p fad fad sol sol sol'[fa?]
    mi!  mi mi mi fa fa fa mi
    re re re re mi mi mi re

    %19
    dod dod dod dod re4 r8 la'\f
    sol4 r8 sol\mbreak la4 r8 la
    sol4 r8 fad sol4 sol

    %22
    sol fad8 mi re2

}

IIIvcn = \relative do' {

    mib2 fa4. mib8
    re4 re, mib2
    do'4. sib8 la!2

    %4
    sib4. do8 re re, mi!4
    fa4 fa'8 mib re do si4
    do fad, sol2

    %7
    sol4 r8 sol\p\mbreak la la si4
    do8 do, r do' re re mi!4
    fa4. fa8 fa [mib mib re16 do]

    %10
    re2 do8 do, do' do
    la! la la la sib sib sib sib
    mi,! mi mi mi fa fa' fa fa

    %13
    mib mib mib mib\mbreak reb reb, reb reb
    re! re re re mib mib mib mib
    mi! mi mi mi fad4 r

    %16
    r8 fad\p fad fad sol sol sol'[fa?]
    mi! mi mi mi fa fa fa mi
    re re re re mi mi mi re

    %19
    dod dod dod dod re4 r8 fad,\f
    sol4 r8 sol\mbreak fad4 r8 fad
    sol4 r8 re mib4 mi

    %22
    re re re2

}

IIIbcn = \relative do {

    mib2 fa4. mib8
    re2 mib
    do4. sib8 la!2

    %4
    sib4. do8 re4 mi!
    fa4. mib8 re do si4
    do fad, sol2

    %7
    sol4 r\mbreak r2
    R1*2
    r2 r8 do do do

    %11
    la! la la la sib sib sib sib
    mi! mi mi mi fa fa fa fa
    mib mib mib mib\mbreak reb reb reb reb

    %14
    re! re re re mib mib mib mib
    mi! mi mi mi fad4 r
    R1*3

    %19
    r2 r4 r8 fad\f
    sol4 r8 sol\mbreak fad4 r8 fad
    sol4 r8 re mib4 mi

    %22
    re re re2

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <_- 7>8 <6> s <6 4->
    <6 5->2 <9>8 <8> s4
    <7>8 <6!> s <6 4-> <6 5->2
    <9>8 <8> s <_-> <6>2
    <_- 9>8 <8> s <6 4-> <6! 5-> <6 4-> s4
    <_-> <7- 5> <6- 4> <5 3!>
    <_!>2 s
    s1*2
    s2 s8 <_-> s4
    <7- 5->2<_- 9>8 <8> s4
    <7- 5>4 <6> <_- 9>8 <8> s4
    <6 4!>2 <6>
    <6!> <7>8 <6> s4
    <6+>1
    s1*5
    s4 s8 <_+> <7>4 <6+>
    <4> <3+> <_+>2

}


forma = {

    \time 4/4
    \key re\minor
    \tempo 4 = 43
    s1*22
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

    R4.*5
    re8\noBeam re16 re re re
    sib'8 sol sib

    %8
    sib r r\mbreak
    do\noBeam do16 do do do
    re8 r re,

    %11
    fad r la
    re\noBeam re16 re re re
    do8 r r

    %14
    re\noBeam re16 re re re
    re8 re re
    re4.

    %17
    R
    sol,8\noBeam sol16 sol sol sol
    do8 r r

    %20
    fa,\noBeam fa16 fa fa fa\mbreak
    do' re sib do la sib
    sol8 fa sib

    %23
    la sol4
    fa8 r r
    sol r r

    %26
    sol r r
    sol r r
    la r r

    %29
    R4.*2
    re4.\tr~
    re\mbreak

    %33
    re\tr~
    re
    R

    %36
    la8\noBeam la16 la la la
    sol8 r r
    re'16 do re8[la]

    %39
    sib r r
    re,\noBeam re16 re re re
    re8 sol re

    %42
    re8. mi16 fad8
    sol r r

}


IVvlIn = \relative do'' {

    re8\noBeam re16 re re re
    sol8 re sol
    la re la

    %4
    sib la sol
    sol fad8. fad16
    sol8 sib, la

    %7
    sib \noBeam re16 re re re
    mib8 sib' sib,\mbreak
    do fa fa

    %10
    fa\noBeam fa16 fa fa fa
    fad8\noBeam fad16 fad fad fad
    sol8 sib la

    %13
    do8\noBeam do16 do do do
    fad,8 \noBeam fad16 fad fad fad
    fad8 sol sib

    %16
    la4.
    re,8\noBeam re16 re re re
    sib'8 r r

    %19
    do,8\noBeam do16 do do do
    la'8 r r\mbreak
    R4.*3

    %24
    fa8\noBeam fa16 fa fa fa
    si8\noBeam si16 si si si
    do8\noBeam sol16 sol sol sol

    %27
    dod8\noBeam dod16 dod dod dod
    re8 la16 la sib[sib]
    fa fa sol[sol] mi mi

    %30
    re8\noBeam re16 re re re
    fad re re re re re
    la' re, re re re re\mbreak

    %33
    do' re, re re sib'8\noBeam
    la16 re, re re re re
    mib mib mib mib mi[mi]

    %36
    fa fa fa fa fad[fad]
    sol8 r16 re' do re
    sib[do] la sol la sib

    %39
    sol8 r16 re do re
    sib do la[sol la sib]
    sol8 sib16[sib] re re

    %42
    sol8 sol, re
    sol,8 r r

}

IVvlIIn = \relative do'' {

    R4.*2
    fad8\noBeam fad16 fad fad fad
    re8 fad re

    %5
    do la do
    re16[re,] sol8 fad
    sol\noBeam sib16 sib sib sib

    %8
    sib8 sol' mib\mbreak
    fa la, la'
    re,\noBeam re16 re re re

    %11
    do8\noBeam do16 do do do
    sib8 re re
    sol\noBeam sol16 sol sol sol

    %14
    la8\noBeam la,16 la la la
    la'8 re, sol
    fad4.

    %17
    R
    re8 r r
    sol r r

    %20
    do, r r\mbreak
    fa, sol la
    mi re re

    %23
    fa mi8.[mi16]
    do'8 r r
    re r r

    %26
    sol r r
    sib r r
    la8. fa16 sol sol

    %29
    re8 mi dod
    la4 sib8
    la r r

    %32
    la r r\mbreak
    fad'8. fad16 sol8
    fad4 fad,8

    %35
    sol sol16 sol sol sol
    la8 la16 la la la
    re8 r fad

    %38
    sol8. sol16 fad8
    sol r fad,
    sol8. sol16 fad8

    %41
    sol sol16[sol] sib sib
    re8 sol, re
    sol, r r

}

IVvlan = \relative do' {

    R4.*2
    la'8\noBeam la16 la la la
    sol8 la sib

    %5
    la la8. la16
    sol8 re re
    re\noBeam sol16 sol sol sol

    %8
    sol8 mib sol\mbreak
    do, do do'
    sib\noBeam sib16 sib sib sib

    %11
    do8\noBeam do,16 do do do
    re8 sol la
    sol\noBeam sol16 sol sol sol

    %14
    re'8\noBeam la16 la la la
    re,8 sol re
    re4.

    %17
    R
    sol8 r r
    sol r r

    %20
    fa r r\mbreak
    la, sol fa
    do' re sib

    %23
    do\noBeam do16 do do do
    la'8 r r
    sol r r

    %26
    sol r r
    sol r r
    re fa mi

    %29
    la,16[la'] sib8 la
    la4 sol8
    fad r r

    %32
    fad r r\mbreak
    la4 sol8
    la4 la8

    %35
    sol do do,
    do re mib
    re r do

    %38
    re re re
    re r do
    re re re

    %41
    re re16[re] sol sol
    sib8 sol re
    sol, r r

}

IVvcn = \relative do' {

    R4.*2
    re8\noBeam re16 re re re
    sol,8 re' sol,

    %5
    la re la
    sib sol re'
    sol, \noBeam sol16 sol sol sol

    %8
    sol8 sol' sol,\mbreak
    la fa la
    sib \noBeam sib16 sib sib sib

    %11
    la8\noBeam la16 la la la
    sol8 sol' fa
    mib\noBeam mib16 mib mib mib

    %14
    re8\noBeam re16 re re re
    re8 sib sol
    re'4.

    %17
    R
    sol8 r r
    mi! r r

    %20
    fa r r\mbreak
    la, sol fa

    %22
    do' re sib
    do\noBeam do16 do do do
    fa8 r r

    %25
    fa r r
    mib r r
    mi! r r

    %28
    fa8. fa16 dod8
    re sol, la
    fad4 sol8

    %31
    re' r r
    re r r\mbreak
    re4 sol,8

    %34
    re4 re'8
    re do sib
    la re do

    %37
    sib r la
    sol re' re,
    sol r la

    %40
    sol re' re,
    sol\noBeam sol'16 sol sol sol
    sol8 sol, re

    %43
    sol, r r

}

IVbcn = \relative do {

    R4.*2
    re8\noBeam re16 re re re
    sol8 re sol

    %5
    la re la
    sib sol re
    sol \noBeam sol16 sol sol sol

    %8
    sol8 sol, sol'\mbreak
    la fa la
    sib \noBeam sib16 sib sib sib

    %11
    la8\noBeam la16 la la la
    sol8 sol fa
    mib\noBeam mib16 mib mib mib

    %14
    re8\noBeam re16 re re re
    re8 sib sol
    re'4.

    %17
    R
    sol8 r r
    mi! r r

    %20
    fa r r\mbreak
    R4.*3
    fa8 r r

    %25
    fa r r
    mib r r
    mi! r r

    %28
    fa8. fa16 dod8
    re sol la
    fad4 sol8

    %31
    re r r
    re r r\mbreak
    re4 sol,8

    %34
    re'4 re'8
    re do sib
    la re do

    %37
    sib r la
    sol re' re,
    sol r la

    %40
    sol re re,
    sol\noBeam sol16 sol sol sol
    sol8 sol' re

    %43
    sol, r r

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*2
    s8 <_+>4
    s8 <_+>4
    <7>8 <_+> <6+>
    <6> s <_+>
    s4.
    <6->
    <6->
    s8 <5>4
    <6+>4.
    s4 <6>8
    <6>4.
    <_+>4.
    <_+>8 <6>4
    <_+>4.
    s4.*8
    <6 4! 2>4.
    <6>
    <6+>
    <6>4 <7 5>8
    s <6 5> <_+>
    s4.
    <_+>
    <_+>
    <_+ 7>
    <_+>
    <2->8 <_-> <6 4!>
    <6> <_-> <6 4+>
    <6> s <6+>
    s <4> <3+>
    s4 <6+>8
    s8 <4> <3>
    s4.
    s4 <_+>

}


forma = {

    \time 3/8
    \key re\minor
    \tempo 4. = 65
    s4.*16
    \bar ":..:"\break
    s4.*27
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
    subtitle = \markup \larger "Sinfonia Settima [autografo 1715]"
    composer = \markup {"A. Scarlatti (1660-1725)"}
}

\markup \huge {[1.] Moderato}

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

\markup \huge {[2.] Moderato}

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

\markup \huge {[3.] Grave}

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

\markup \huge {[4.] All[egr]o}

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

