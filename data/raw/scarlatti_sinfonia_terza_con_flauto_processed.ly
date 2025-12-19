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

    R1
    r2 fa2\tr~
    fa~fa~

    %4
    fa fa8 sol fa16 mi fa sol
    la8. sol16 la sol fa sol mi4 do\mbreak
    do2\tr~do

    %7
    do4 r8 do re mi16 fad sol fad sol la
    sol fad sol la sol fad sol la sol fad sol la sib la sol fa?
    mi4 r la r

    %10
    si! r r16 mi, [fad sold la re do si]
    la si la sol la si la sol\mbreak do si la sold la sold la si
    do si la sold la4 la2~

    %13
    la1
    la4 r sol r
    la1\tr

    %16
    la4 r re, r
    la' r\mbreak mi r
    mi r mi mi

    %19
    mi r

}


IvlIn = \relative do'' {

    la'4 r16 sib la sol la sib la sol la sib la sol
    la sol fa mi fad re' do sib do4 r16 re do sib
    do re do sib do re do sib do sib la sol la sol fa mi

    %4
    do' sib la sol la sol fa mi fa[do re mi fa sol la sib]
    la[do, re mi fa sol la sib] sol4 r16 la sol fa\mbreak
    sol16 la sol fa sol la sol fa sol fa mi re mi re do si?

    %7
    sol'[fa mi re mi fa sol la] sib4 r16 la sib do
    sib la sib do sib la sib do sib la sol fad sol fa mi re
    la' sib la sol la sol fa mi fa mi re dod re do si! la

    %10
    mi' fa mi re mi re do si do4 r16 fa mi re
    mi fa mi re  mi fa mi re\mbreak mi re do si do si la sold
    mi'[re do si do re mi fa] dod[si dod re mi fa sol la]

    %13
    re,[dod re mi fa sol la sib] la sib la sol la sol fa mi
    fa sol fa mi fa sol fa mi re mi re dod re mi dod re
    mi[la, si dod re mi fa sol]mi[la, si dod re mi fa sol]

    %16
    mi4 r8 r16 mi ,fa4 r8 r16 fa
    mi16[la sold la sold la sold la]\mbreak  mi[la sold la sold la sold la]
    mi[la sold la sold la sold la] mi4 mi

    %19
    mi r

}

IvlIIn = \relative do'' {

    fa4 r16 sol fa mi fa sol fa mi fa sol fa mi
    fa mi fa sol la sib la sol la4 r16 sib la sol
    la sib la sol la sib la sol la sol fa mi do' sib la sol

    %4
    la sol fa mi fa8 do la[sol] la16 sib do re
    do8. do16 do sib do re mi4 r16 fa mi re\mbreak
    mi fa mi re mi fa mi re mi re do si? sol' fa mi re

    %7
    mi re do si do re mi fa re4 r
    r2 re'4 r
    mi,16 re dod sib? la sib! la sol re' mi fa mi fa mi re do?

    %10
    si! la sold fad mi fa mi re la'4 r
    r2\mbreak do4 r
    do r mi r

    %13
    la, r mi' r
    la, r sol' r
    dod,8 re16 mi la,8[re'] dod mi, la,[re']

    %16
    dod4 r8 r16 dod,, re4 r8 r16 re
    dod4 r8 fa\mbreak mi4 r8 fa
    mi4 r8 re dod4 dod

    %19
    dod r

}

Ivlan = \relative do' {

    re4 r r2
    r fa4 r
    r2 fa4 r

    %4
    fa r do8 do do[do]
    fa16 mi fa sol fa8 do' do4 r\mbreak
    do r do r

    %7
    do r sib r
    r2 sib4 r
    mi, r la r

    %10
    mi r mi r
    r2 mi4 r
    mi r dod r

    %13
    re r mi r
    re r re r
    mi8 la la fa la la la la

    %16
    la4 r si? r
    la r8 re,\mbreak dod4 r8 re
    dod4 r8 si la4 la

    %19
    la r

}

Ivcn = \relative do {

    re4 r r2
    r fa4 r
    r2 fa4 r

    %4
    fa r fa8 do la[fa]
    fa' do la[fa] do'4 r\mbreak
    do r do r

    %7
    do r sol' r
    r2 sol4 r
    dod, r re r

    %10
    sold, r la r\mbreak
    r2\mbreak la'4 r
    la r sol r

    %13
    fa r dod r
    re r sib r
    la8 la' fa[re] la la' fa re

    %16
    la4 r sold r
    la r\mbreak la r
    la r la la

    %19
    la r

}

Ibcn = \relative do {

    re4 r r2
    r fa4 r
    r2 fa4 r

    %4
    fa r fa8 do la[fa]
    fa' do la[fa] do'4 r\mbreak
    do r do r

    %7
    do r sol' r
    r2 sol4 r
    dod, r re r

    %10
    sold, r la r\mbreak
    r2\mbreak la'4 r
    la r sol r

    %13
    fa r dod r
    re r sib r
    la8 la' fa[re] la la' fa re

    %16
    la4 r sold r
    la r\mbreak la r
    la r la la

    %19
    la r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <5>
    s1
    s2 s4 <6>
    s <6> s2
    s1
    s2 <_->
    s <_->
    s1
    s2 <_->
    s1
    s2 <6 4+>
    <6>1
    s2 <6>
    <_+>4 <6> <_+> <6>
    <_+>2 <7 5>
    <_+>2 <_+>
    <_+> <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*18
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

    la'4 sib~sib8. la16
    sol8.[fa16 mi8. fa16] sol4
    sib8. la16 la4\tr ~la8. sol16

    %4
    fad8.[mi16 re8. mi16] fad4
    re'8. do16 do4.\tr sib16 la
    sib8.[la16 sol8. fad16] sol4

    %7
    la fad\tr~fad8. sol16\mbreak
    sol4 r r
    R2.*5

    %14
    do8. sib16 sib4. \tr lab16 sol
    lab8.[sol16 fa8. mi!16] fa4
    R2.*2

    %18
    re'8. do16 do4.\tr sib16 la
    sib4 si2\tr
    do8. sib16 sib4. la16 sol

    %21
    la8. sol16 sol4. fa16 mi
    fa4 fad~fad8. fad16
    sol8. la16 la4. sol16 la

    %24
    sib4 r8 r16 sib la4~
    la8 sol16 fa sol4\tr~sol8. la16
    la4 r r

    %27
    fa r r
    mi r r

}


IIvlIn = \relative do'' {

    R2.*7
    re4\p mib~mib8. re16
    do8.[sib16 la8. sib16] do4

    %10
    mib8. re16 re4~re8. do16
    si!8.[la16 sol8. la16] si4
    sol'8. fa16 fa4. mib16 re

    %13
    mib8.[re16 do8. si!16] do4
    R2.*2
    lab'8. sol16 sol4~sol16 fad sol la?

    %17
    fad8.[mi16 re8. dod16] re4\mbreak
    re r r
    sol,8. fa16 fa4. mi16 re

    %20
    mi4 sol r
    fa sol r
    re'8. do16 do4. sib16 la

    %23
    sib4 do r
    sib r mi,
    re re'2

    %26
    dod4 r r8 r16 dod
    re4 r r
    la r r

}

IIvlIIn = \relative do'' {

    R2.*7
    sib4 sib, sib'
    la r r

    %10
    do8. sib16 la4 r
    sol8.[la16 si!8. do16] re4
    do lab r

    %13
    sol8.[fa16 mib8. fa16] sol4
    R2.*4\mbreak
    la4 r r

    %19
    re, re r
    sol do r
    la sib r

    %22
    la la r
    re, mib r
    re r dod

    %25
    re sol2
    mi4 la r
    si re r8 r16 re

    %28
    dod4 r r

}

IIvlan = \relative do' {

    R2.*7
    sol'4 sol, sol'
    sol r r

    %10
    fad fad r
    fa! fa fa8. fa16
    mib4 si! r

    %13
    do~do8. re16 mib4
    R2.*2
    fa4 mib mib,

    %17
    re~re8.[mi!16 fad8. sol16]\mbreak
    fad4 r r
    sol' sol, r

    %20
    do mi r
    fa dod r
    re re, r

    %23
    sol fad r
    sol r la
    sib sib2

    %26
    la4 r r
    sold r r
    la r r

}

IIvcn = \relative do {

    re'4\solo re, r
    mi4 mi'8.[re16 mi8. re16]
    dod4~dod8. si16 dod4

    %4
    re  r8 r16 sib la8. sol16
    fad4~fad8. mi16 fad4
    sol~sol8.[la16 sib8. sib,16]

    %7
    do8.[do'16] re4 re,\mbreak
    sol4\p sol, sol'
    sol r r

    %10
    fad fad r
    fa! fa~fa8. fa16
    mib4 si! r

    %13
    do~do8. re16 mib4
    mi! mi, mi'
    fa~fa8. [sol16 lab8. sol16]

    %16
    fa4 mib~mib8. mib16
    re4~re8.[mi!16 fad8. sol16]\mbreak
    fad4 r r

    %19
    sol sol, r
    do mi r
    fa dod r

    %22
    re re, r
    sol' fad r
    sol r la

    sib sib2
    la4 r r
    sold r r
    la r r\mbreak

}

IIbcn = \relative do {

    R2.*28

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    \key la\minor
    \tempo 4 = 50
    s2.*28
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

    R1
    re4 re8 re re4 re
    sib'2. la8 sol

    %4
    la2~la8 sol fa mi
    fa2 mi
    re r

    %7
    R1*15
    re4 re8 re re4 re
    sib'2 la~

    %24
    la4 sol8 fa sol4 sol\mbreak
    sol fa8 mi fa4 sol
    la2 r

    %27
    R1*4
    re,4 re8 re re4 re
    fa2 r

    %33
    fa4 fa8 fa fa4 fa
    la2 r\mbreak
    R1

    %36
    re2. do8 sib
    do2. sib8 la
    sib1~

    %39
    sib2 la
    sol r
    do,4 do8 do do4 do

    %42
    la'2 sol~
    sol4 fa do'2~
    do do~\mbreak

    %45
    do4 sib la2
    re,4 re8 re re4 re
    sib'2 la~

    %48
    la4 sol re'2~
    re re~
    re4 do si?2

    %51
    mi,4 mi8 mi mi4 mi
    mi2 la
    si1\mbreak

    %54
    la2 r
    re,4 re8 re re4 re
    sib'2. re,4

    %57
    do do8 do do4 do
    la'2 fa
    fa1~

    %60
    fa~
    fa
    fa4 fa8 fa fa4 fa\mbreak

    %63
    do'1
    sib4 sol sib2
    la r

    %66
    R1*6
    re,4 re8 re re4 re\mbreak
    la'2 la

    %74
    la1~
    la~
    la~

    %77
    la~
    la
    la2 r4 la

    %80
    sol1
    fa2 r4 re
    re2 dod

    %83
    re

}


IIIvlIn = \relative do'' {

    re4 re8 re re4 re
    sib'2 la~
    la4 sol8 fa sol4 sol

    %4
    sol fa8 mi fa4 re
    re2 dod
    re4 la' la, sol'

    %7
    fa2. mi8 re
    mi2. re8 do
    si do re do si4 mi

    %10
    do2~do8 re mi fa
    sol4 re sib'2
    la4 fa8 mi fa4 re\mbreak

    %13
    sol re fa la
    re, mi8 re mi2
    dod re8 mi fa sol

    %16
    la2 r
    R1*4
    la,4 la8 la la4 la

    %22
    fa' fa, la fa
    sol2 la
    fa do'

    %25
    do2. re8 mi
    fa mi re mi fa sol la fa
    sol4 mi fa sol8 la

    %28
    sib2. la8 sol
    la2. sol8 fa
    mi4 sol la8 sol fa mi

    %31
    fa4 la, fa' fa,
    la2 r
    la4 la8 la la4 la

    %34
    do la la fa'\mbreak
    sib fa mi la
    re, mi8 fa sol4 re

    %37
    mi fa8 mi fa4 do
    re mi8 re mi4 fa
    sol2 fa~

    %40
    fa4 mi8 re mi4 sol~
    sol fa2 mi4
    do do8 do do4 do

    %43
    la' la8 la sol4 sol
    sol fa mib fa8 mib\mbreak
    re4 re8 re re4 re

    %46
    sib'2 la~
    la4 sol2 fad4
    re re8 re re4 re

    %49
    sib'2 la
    sold4 la2 sold4
    mi la2 sold8 fad

    %52
    sold2 mi4 do'
    si?2 si\mbreak
    do do~

    %55
    do4 la re, la'~
    la sol8 fad sol4 sib~
    sib sol do, sol'~

    %58
    sol fa do la
    fa' fa8 fa fa4 fa
    re'2 do~

    %61
    do4 sib8 la sib4 la~
    la8 sol la sib fa4 sib~\mbreak
    sib la8 sol la sol la sib

    %64
    sol1
    fa2 r4 la~
    la sol2 fad4

    %67
    sol re r si'!~
    si la2 sold4
    la la,8 la la4 la

    %70
    fa' re fa la~
    la sol2 fa4
    sib2. la8 sol\mbreak

    %73
    dod4 re8 dod re2~
    re4 dod8 si dod4 la
    la, la8 la la4 la

    %76
    fa'2 mi~
    mi4 re2 dod4
    mi mi8 mi mi4 mi

    %79
    dod'2 r4 re
    re2 dod
    re r4 sib,

    %82
    la2 dod
    la

}

IIIvlIIn = \relative do'' {

    R1*4
    la4 la8 la la4 la
    fa'2 mi~

    %7
    mi4 re8 do re4 re
    re do8 si do4 la
    la2 sold

    %10
    la4 mi' la, do
    sib2~sib8 do re mi
    fa4 la, la' fa\mbreak

    %13
    re8 mi fa sol la4 fa
    sib2. la8 sol
    la4 la, la'8 sol fa mi

    %16
    fa4 fa, mi mi'
    la,8 sol la si? do re mi do
    fa4 fa, fa' fa,

    %19
    mi mi'2 fa8 mi
    re do re do si re do si
    do re do re mi4 do

    %22
    la2 r
    re4 re8 re re4 re
    sib'2. la8 sol\mbreak

    %25
    la2. dod,4
    re8 la si dod re mi fa la,
    re mi fa sol do, re mi fa

    %28
    re do sib la sol4 mi'
    dod re8 dod re4 la'
    sol8 fa mi re mi4 la,

    %31
    la fa la2
    fa4 fa8 fa fa4 fa
    la2 r

    %34
    la'4 do, fa la,\mbreak
    fa sib do mi,
    fa sol8 la re,4 fa

    %37
    sol la8 sib do4 fa
    re8 do sib la sib4 re
    do1

    %40
    do4 do8 do do4 do
    la'2 sol~
    sol4 fa2 mi4

    %43
    do do8 do do4 do
    la'2 sol\mbreak
    fad4 sol2 fad4

    %46
    re'2 r
    re,4 re8 re re4 re
    sib' sib8 sib la4 la

    %49
    la sol fa! sol8 fa
    mi4 mi8 mi mi4 mi
    do'2. si?8 la

    %52
    si4 do8 si la4 la
    la2 sold\mbreak
    la4 la,8 la la4 la

    %55
    fad2 fad
    sol2. fa!4
    mi2 mi

    %58
    fa la4 do
    la2 do'~
    do4 sib2 la4

    %61
    fa fa8 fa fa4 fa
    sib re,8 re re4 re\mbreak
    sol2 fa~

    %64
    fa4 mi8 re mi4 mi
    fa do do fa
    re2 do

    %67
    r4 si! si sol'
    mi2 re
    dod r

    %70
    la2. la8 la
    re2 do
    re sol\mbreak

    %73
    mi la4 fa
    mi2 mi~
    mi4 re2 dod4

    %76
    la la8 la la4 la
    fa'2 mi
    dod4 dod8 dod dod4 dod

    %79
    mi2 r4 fa
    mi2 mi
    fa r4 sol,

    %82
    fa2 mi
    fa

}

IIIvlan = \relative do' {

    R1*11
    re4 re8 re re4 re\mbreak
    sib'2 la~

    %14
    la4 sol8 fa sol4 sol
    sol fa8 mi fa4 re
    re2 dod

    %17
    re sol
    la4 si8 la si4 la
    sold la8 sold la4 do,

    %20
    si?2. mi4
    mi la,8 si do4 la
    re2 fa4 re

    %23
    sol2 fa
    re mi\mbreak
    fa2. mi4

    %26
    la2 fa4 re
    re8 do re mi la,4 do
    re2 mi4 sol

    %29
    mi2 la
    sib la
    la re,

    %32
    re4 re8 re re4 re
    fa2 r
    do4 fa do do'\mbreak

    %35
    sib re, la'2
    fa sib
    sol fa

    %38
    sib,4 re sol2~
    sol4 la8 sol la4 si!
    do2 sol

    %41
    do, sol'
    la2 do
    do,4 do8 do mi4 mi

    %44
    do2 do4 do'\mbreak
    la sol re la'~
    la sol2 fad4

    %47
    re2 la'
    re,4 re8 re fad4 fad
    re2 re4 re'

    %50
    si! la mi si'~
    si la mi2
    mi4 mi8 mi mi4 mi

    %53
    fa2 mi\mbreak
    mi2 r
    R1*3

    %58
    r2 do4 do8 do
    do4 do la'2
    fa4 fa8 fa fa4 fa

    %61
    re'2. do4
    sib2~sib8 la sol fa\mbreak
    sol2 do,

    %64
    re do
    do4 la'8 la la4 la
    re,2 la'

    %67
    r4 re,8 re re4 re
    mi2 si'!
    mi, r

    %70
    fa4 fa8 fa fa4 fa
    re2 la'
    re,1\mbreak

    %73
    mi2 re4 la'
    la, la8 la la4 la
    fa'2 mi~

    %76
    mi4 re2 dod4
    la'2 la
    la4 la8 la la4 la

    %79
    la2 r4 la
    sib2 la
    la r4 sib,

    %82
    fa'2 la,
    la

}

IIIvcn = \relative do {

    R1*15
    la4 la8 la la4 la
    fa'2 mi~

    %18
    mi4 re8 do re4 re
    re do8 si do4 la
    la2 sold

    %21
    la r
    R1*4
    re4 re8 re re4 re

    %27
    sib'2 la~
    la4 sol8 fa sol4 sol
    sol fa8 mi fa4 re

    %30
    re2 dod
    re r
    R1*2

    %34
    fa4 fa8 fa fa4 fa\mbreak
    re'2 do~
    do4 sib8 la sib2~

    %37
    sib4 la8 sol la2~
    la4 sol8 fa sol4 fa
    mi do fa2

    %40
    do do
    do do
    do do

    %43
    do4 do8 do do4 do
    do' do, do' do,\mbreak
    re2 re

    %46
    re re
    re re
    re4 re8 re re4 re

    %49
    re' re, re' re,
    mi2 mi
    mi mi

    %52
    mi do4 do
    re2 mi\mbreak
    la, r

    %55
    R1*3
    fa'4 fa8 fa fa4 fa
    fa2 fa

    %60
    fa fa
    fa fa
    re4 re8 re re4 re\mbreak

    %63
    mi2 fa4 la,
    sib2 do
    fa4 fa8 fa fa4 fa

    %66
    sib2 la
    r4 sol8 sol sol4 sol
    do2 si!

    %69
    la r
    re,4 re8 re re4 re
    sib'2 la~

    %72
    la4 sol8 fa sol4 sol\mbreak
    sol fa8 mi fa4 re
    la2 la

    %75
    la la
    la la
    la4 la8 la la4 la

    %78
    la' la, la' la,
    la'2 r4 fa
    sol2 la

    %81
    re, r4 sol,
    la2 la
    re,

}

IIIbcn = \relative do {

    R1*15
    la4 la8 la la4 la
    fa'2 mi~

    %18
    mi4 re8 do re4 re
    re do8 si do4 la
    la2 sold

    %21
    la r
    R1*4
    re4 re8 re re4 re

    %27
    sib'2 la~
    la4 sol8 fa sol4 sol
    sol fa8 mi fa4 re

    %30
    re2 dod
    re r
    R1*2

    %34
    fa4 fa8 fa fa4 fa\mbreak
    re'2 do~
    do4 sib8 la sib2~

    %37
    sib4 la8 sol la2~
    la4 sol8 fa sol4 fa
    mi do fa2

    %40
    do do
    do do
    do do

    %43
    do4 do8 do do4 do
    do' do, do' do,\mbreak
    re2 re

    %46
    re re
    re re
    re4 re8 re re4 re

    %49
    re' re, re' re,
    mi2 mi
    mi mi

    %52
    mi do4 do
    re2 mi\mbreak
    la, r

    %55
    R1*3
    fa'4 fa8 fa fa4 fa
    fa2 fa

    %60
    fa fa
    fa fa
    re4 re8 re re4 re\mbreak

    %63
    mi2 fa4 la,
    sib2 do
    fa4 fa8 fa fa4 fa

    %66
    sib2 la
    r4 sol8 sol sol4 sol
    do2 si!

    %69
    la r
    re,4 re8 re re4 re
    sib'2 la~

    %72
    la4 sol8 fa sol4 sol\mbreak
    sol fa8 mi fa4 re
    la2 la

    %75
    la la
    la la
    la4 la8 la la4 la

    %78
    la' la, la' la,
    la'2 r4 fa
    sol2 la

    %81
    re, r4 sol,
    la2 la
    re,

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*15
    <6 4>2 <5 3+>
    <6> <6>
    <2> <6>4 <5>
    <4+ 2>2 <6>
    <2>1
    s1*6
    <6>2 <6>
    <2-> <5>4 <6>
    <4+ 2> s <6> s
    <2>1
    s1*4
    <6->2 <6>
    <2> <6>
    <2> <6>
    <2->1
    <6 5->
    <4>4 <3> s2
    <6 5>4 <4> <4> <3>
    <6 5> <6 4> <4> <3>
    <6 5> <6 4> <3>2
    s <_->
    <7 3+>4 <6- 4> <4> <3+>
    <6- 5> <4> <4> <3+>
    <6- 5> <4> <4> <3+>
    <6- 5> <4> <3+> s
    s2 <_->
    <7 3+>4 <6- 4> <4> <3+>
    <6 5> <4> <4> <3+>
    s2 <6>
    <6 5> <_+>
    s1*4
    <9>4 <8> s2
    s1
    <6 5>4 <4-> <4> <3>
    <6 5>4 <4-> <4> <3>
    <6- 5>2 <6->
    <6 5->2 s4 <6>
    <6 5>1
    s
    <7>4 <6> <7> <6+>
    s4 <_!> s2
    <7>4 <6> <7> <6+>
    <_+>1
    s
    <7>4 <6> <7> <6>
    <2->1
    <4+ 2>2 <6>
    <4>4 <3+> <_+>2
    <6 5>4 <4> <4> <3+>
    <6 5>4 <4> <4> <3+>
    <6 5>4 <4> <4> <3+>
    <_+>1
    s2 s4 <6>
    <_- 6 5>2 <_+>
    s s4 <_->
    <6 4>2 <3>

}

forma = {

    \time 2/2
    \key la\minor
    \tempo 2 = 60
    s1*82
    s2 r\fermata
    \bar "|."

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

    R1
    r2 r8 do' fa, sol
    mi4. re8 do mi sol la
    sib sib sib la sold4 r8 sold
    la la la sol! fad4 r8 fad
    sol4 r r8 do do do
    sib4 r r8 sol sol sol\mbreak
    fa la fad[fad] sol sol re'[re]
    re re16 dod re8 re re re16 dod re8 re
    dod4 la re,2
    la'1
    la2

}


IVvlIn = \relative do'' {

    r2 r8 fa do re
    la la' la,[sib] do4. re8
    mi do' sol la mi do mi[mi]
    fa4. re8 mi4 r
    r8 mi mi mi re4 r
    r8 re re re mib4 r
    r8 re re re mi!4 r\mbreak
    re r8 mib re4 r8 fa
    fa4 r fa r
    mi8 la,16 sold la2 sold8. la16
    la1~
    la2

}

IVvlIIn = \relative do'' {

    r8fa do re la la' la,[sib]
    do4. fa,8 fa' la,4 sol8
    sol mi' mi,[fa] sol sol do[do]
    fa, sib re[re] si!4 r
    r8 la la sib la4 r
    r8 sol sol sol do4 r
    r8 sib sib sib sib4 r\mbreak
    la4. la8 sib4 r8 re
    re4 r si! r
    dod mi, re2~
    re4 dod8 si dod2~
    dod

}

IVvlan = \relative do' {

    fa2 fa~
    fa8 fa do[re] la4. sib8
    do2 do
    re4. fa8 mi4 r
    r8dod dod dod re4 r
    r8 re re re la'4 r
    r8 sol sol sol sol4 r
    fa r8 do sol'4 r8 la
    si!4 r re, r
    la' dod, si2
    mi1~
    mi2

}

IVvcn = \relative do {

    R1*3
    r2 r8 mi'\solo mi16 mi, re'[re,]
    dod'8 dod, r4 r8 re' re16[re,] do'? do,
    sib'8 sib, sib sib fad4 r
    r8 sol' sol sol dod,4 r\mbreak
    re4 r8 do sib4 r8 la
    sold4 r sold r
    la la si!2
    la1~
    la2

}

IVbcn = \relative do {

    R1*5
    r8 sib sib sib fad4 r
    r8 sol' sol sol dod,4 r\mbreak
    re4 r8 do sib4 r8 la
    sold4 r sold r
    la la si!2
    la1~
    la2

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*7
    s4 s8 <6 4+> <6>4 s8 <6- 4>
    <7 5>2 <7 5>
    <_+> <7>4 <6+>
    <4>2 <3+>




}


forma = {

    \time 4/4
    \key la\minor
    \tempo 4 = 42
    s1*11
    s2 r\fermata
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



Vfln = \relative do'' {

    r4
    R1*4
    do'4. sib16 la sol8.[do,16 do8. do16]
    do'4. sib16 la \tuplet 3/2 { sol8 la sol } la8. la16

    %7
    \tuplet 3/2 { sol8 la sol } la8. la16 \tuplet 3/2 { sol8 fa mi } fa8. sib16
    \tuplet 3/2 { la8 sol fa sol[fa mi] } fa4 r
    R1*2

    %11
    r2 r8 r16 mi la8. sol16
    \tuplet 3/2 { fa8 sol la } sol8. la16 la4 r
    r2 r8 r16 la \tuplet 3/2 { dod8 si la }

    %14
    re4 re dod8.[re16 dod8. si16]
    la8.[si16 la8. sold16] la4~la8. sold16
    la8.[sold16 la8. sold16] la4 r

    %17
    R1*2
    r4 re8. re16 \tuplet 3/2 { re8 do sib } do8. do16
    \tuplet 3/2 { do8 sib la sib[la sol] } la4 fad

    %21
    sol r r8 r16 sib \tuplet 3/2 { sib8 do re }
    do4 r r8 r16 la \tuplet 3/2 { la8 sib do }
    sib8. sol16 \tuplet 3/2 { sol8 la sib la[sib la] sol la sol

    %24
    fa mi re} r4 r2
    r4 la'8. la16 \tuplet 3/2 { la8 sol fa } sol8. sol16
    \tuplet 3/2 { sol8 fa mi } fa8. sol16 fa4 mi

    %27
    re r r2
    r8 r16 la' re,8. sol16 fa4 mi
    re r8 r16 re' re4 dod

    %30
    re dod re

}


VvlIn = \relative do'' {

    r8 r16 re
    \tuplet 3/2 { re8 mi re } fa8. la16 re4 r8 r16 fa,
    \tuplet 3/2 { fa8 mi re } mi8. mi16 \tuplet 3/2 { mi8 re do } re8. re16\mbreak
    \tuplet 3/2 { re8 do si do[re mi] fa sol la } sib8. sib16

    %4
    \tuplet 3/2 { sib8 la sol la[fa la] sol la fa } mi8. fa16
    fa4 r r2
    R1*2

    %8
    r2 r8 r16 do do8. fa16
    \tuplet 3/2 { la8 sol fa do'[sib la] } sol8. mi16 mi8. sol16
    \tuplet 3/2 { sib8 la sol sib[la sol]\mbreak} fa8. re16 re8. fa16

    %11
    \tuplet 3/2 { la8 sol fa la[sol fa] } mi4 r
    r2 r8 r16 mi la8. sol16
    \tuplet 3/2 { fa8 sol la } sol8. la16 la4 r

    %14
    R1
    mi4 fa mi8.[fa16 mi8. fa16]
    mi4 mi mi r8 r16 la,

    %17
    \tuplet 3/2 { la8 si la } dod8. mi16\mbreak \tuplet 3/2 { la8 sol fad } sol8. sol16
    \tuplet 3/2 { fad8 mi re } fad8. la16 \tuplet 3/2 { re8 do sib } do8. do16
    \tuplet 3/2 { sib8 la sol } r4 r2

    %20
    R1
    r8 r16 sib, re8. sol16 sib4 r
    r8 r16 do, mi8. sol16 la4 r

    %23
    R1\mbreak
    r8 r16 re, fa8. sol16 \tuplet 3/2 { la8 sol fa mi[fa sol]
    dod, si la} r4 r2

    %26
    r la4 mi
    fa8. re'16 fa8. sol16 \tuplet 3/2 { la8 sol fa mi[fa sol]
    dod, si la} r4 la dod

    %29
    la r8 r16 sib' fa4 mi
    fa la, fa

}

VvlIIn = \relative do'' {

    r4
   la4 r8 r16 re \tuplet 3/2 { re8 mi re} fa8. la16
   sib4 sib,8. sib16 la4 la8. la16\mbreak
   sol4 sol8. do16 do8. fa,16 fa'8. fa16

   %4
   sol4 do, re sol,
   la r r2
   R1*2

   %8
   r2 r4 r8 r16 do
   do8. la16 fa'8. fa16 mi4 r8 r16 mi
   \tuplet 3/2 { sol8 fa mi sol[fa mi] } la,4 r8 r16 re

   %11
   \tuplet 3/2 { fa8 mi re } re'8. re,16 dod4 r
   r2 r4 mi
   re re' dod r

   %14
   R1
   dod,4 re dod8.[re16 dod8. re16]
   dod4 dod dod r

   %17
   r r8 r16 dod\mbreak dod4 mi
   re r la' fad
   re r r2

   %20
   R1
   r4 sib8. re16 re4 r
   r do8. do'16 do4 r

   %23
   R1\mbreak
   r4 la,8. mi'16 re4 sib8. sib16
   la4 r r2

   %26
   r fa4 la
   la la8. mi'16 re4 sib8. sib16
   la4 r fa la

   %29
   fa r8 r16 re' la4 la
   la dod la

}

Vvlan = \relative do' {

    r4
    fa r fa r8 r16 fa
    sol4 sol8. sol16 la4 re,8. re16\mbreak
    mi4 sol8. sol16 fa8. re16 re8. fa16

    %4
    do4 la' re, do
    do r r2
    R1*2

    %8
    r2 r4 r8 r16 la'
    do4 do do r
    mi, mi \mbreak re r8 r16 la'

    %11
    la4 la8. la16 la4 r
    r2 r4 la
    la sib mi, r

    %14
    fa fa mi8.[fa16 mi8. re16]
    mi4 la mi8.[re16 mi8. re16]
    mi4 la la r

    %17
    r r8 r16 la\mbreak la4 sib
    la8. fad16 re8. fad16 la4 la
    sol r r2

    %20
    R1
    r4 sol8. sib16 sol4 r
    r sol8. sol16 fa4 r

    %23
    R1
    r4 re8. dod16 la'4 sol8. sol16
    mi4 r r2

    %26
    r4 r8 r16 re re4 dod
    re re8. dod16 la'4 sol8. sol16
    mi4 r la mi

    %29
    fa r8 r16 sol fa4 la
    fa mi re

}

Vvcn = \relative do {

    r4
    re r re r8 r16 re
    sol4 sol,8. sol'16 fa4 fa,8. fa'16\mbreak
    mi4 mi,8. mi'16 re4 re'8. re,16

    %4
    mi4 fa sib do
    fa,8.[sol16 la8. fa16] mi4 r
    fa8.[sol16 la8. fa16] mi4 fa

    %7
    mi fa do'8. do,16 \tuplet 3/2 { re8 do sib }
    do4 do, re4 r8 r16 fa'
    fa4 la8. fa16 do4 r

    %10
    dod dod\mbreak re r8 r16 re
    re4 fa8. re16 la'4 dod8. la16
    re4 sib la dod,

    %13
    re sib' la r8 r16 la
    sold4 sold la r
    la4 la la la

    %16
    la la la, r
    r r8 r16 la'\mbreak la4 dod,
    re r fad re

    %19
    sol sib8. sol16 mib'4 mib,8. do16
    fad4 sol8. sib,16 do4 re
    sol,4 sol'8. sol16 sol4 sol8. fa16

    %22
    mi4 mi8. mi16 fa4 fad8. fad16
    sol4 mi8. mi16 fa4 mi8. dod16\mbreak
    re4 re8. mi16 fa4 sol8. mi16

    %25
    la4 r8 r16 fa sib4 sib8. sol16
    dod4 re8. sol,16 la4 la,
    re re8. mi16 fa4 sol8. mi16

    %28
    la4 sib8. sol16 la4 la,
    re r8 r16 sol la4 la,
    re la re,

}

Vbcn = \relative do {

    r4
    re r re r8 r16 re
    sol4 sol,8. sol'16 fa4 fa,8. fa'16\mbreak
    mi4 mi,8. mi'16 re4 re'8. re,16

    %4
    mi4 fa sib do
    fa, r r2
    R1*2

    %8
    r2 r4 r8 r16 fa
    fa4 la8. fa16 do4 r
    dod dod\mbreak re r8 r16 re

    %11
    re4 fa8. re16 la'4 r
    r2 r4 dod,
    re sib' la r

    %14
    R1
    la4 la la la
    la la la, r

    %17
    r r8 r16 la'\mbreak la4 dod,
    re r fad re
    sol r r2

    %20
    R1
    r4 sol8. sol16 sol4 r
    r mi8. mi16 fa4 r

    %23
    R1\mbreak
    r4 re8. mi16 fa4 sol8. mi16
    la4 r r2

    %26
    r2 la4 la,
    re re8. mi16 fa4 sol8. mi16
    la4 sib8. sol16 la4 la,

    %29
    re r8 r16 sol la4 la,
    re la re,

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s1
    <_- 7>4 <6> <7> <6>
    <7> <6> <7> <6->
    <6 5->2 <6 4>
    s1*5
    <7- 5>2 s
    s4 <6> <_+>2
    s1
    s4 <6> <_+> s
    s1
    <_+>4 <6 4> <_+> s
    <_+>1
    s4 s8 s16 <_+> <_+>4 <7- 5>
    s1
    <_->
    s
    s4 <_-> s2
    s4 <6> s2
    s1
    s4 s8. <6+>16 <6>4 <_- 6>
    <_+>1

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 2 = 65
    \partial 4 s4
    s1*15
    s2.\bar ":..:" s4
    s1*13
    s2.
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
    \clef bass
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
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con \terzinequarto

}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
        subtitle = \markup "Sinfonia Terza con Flauto [1715] "
        composer = \markup {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] Vivace}

    \score {

        \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Flau[to]"}
                    \Ifl \global
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
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

        \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \IIfl \global
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

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIvc\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[3.] And[ant]e}

    \score {

        \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \IIIfl \global
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

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIIvc\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIIbc\global
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

        \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \IVfl \global
                >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IVvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IVvc\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IVbc\global
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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


    \markup \huge {[5.] All[egr]o}

    \score {

        \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \Vfl \global
                >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \Vvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \Vvc\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \Vbc\global
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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


