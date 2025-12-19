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

    r2 la'4 dod
    R1
    la4 do? r2

    %4
    r sib4 re
    R1*2
    r2 la4 r

    %8
    si! r mi, r
    fa r re' r
    sol, fa sol8 do sib16 do la sib\mbreak

    %11
    sol8 la sol16 la fa sol mi8 do' sib16 do la sib
    sol8 mi la16 sol la sib sol8 mi fa16 mi fa sol
    mi fa mi fa sol la fa sol la sib sol la sib do la sib

    %14
    do8 sol la4 r2
    re4 r sol, r
    do r\mbreak la8[mi] la mi

    %17
    mi la dod4 re r
    fa, r la dod
    r2 fa,4 sol

    %20
    r2 re'4 do
    do re\mbreak sold, si
    la2 la4 re

    %23
    si8 si si si dod4 r
    dod r dod r
    la r mi r

    %26
    dod dod dod r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IflIIn = \relative do'' {

    r2 fa4 la
    R1
    do,4 mi r2

    %4
    r re4 fad
    R1*2
    r2 fad4 r

    %8
    sol r sol r
    la r sib r
    mi, re mi r\mbreak

    %11
    r8 do' sib16 do la sib sol8 la sol16 la fa sol
    mi8 do fa16 mi fa sol mi8 sol la16 sol la sib
    sol8 do,16 re mi fa re mi fa sol mi fa sol la fa sol

    %14
    la8 dod re[la] la4 r
    r sol r sol
    r mi\mbreak r mi

    %17
    r mi r8 la sol[sol,]
    re'4 r re mi
    r2 do4 mi

    %20
    r2 sol4 sol
    la fa\mbreak si, mi
    mi2 fad4. sold16 la

    %23
    si8 re, re re la'4 r
    mi r mi r
    dod r dod r

    %26
    la la la r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}


IvlIn = \relative do'' {

    re16 mi fa sol la la, dod la fa'4 mi
    r16 mi[fa sol la do, re mi] fa sol la sib do do, mi do
    la'4 sol r16 fad sol la sib re, mi fad

    %4
    sol la sib do re re, fad re sib'4 la
    r16 re, mi dod re fad sol mi fad la sib sol la do re sib\mbreak
    do la re sib do la sib sol la fad sol mi fad re sol mi

    %7
    fad re mi dod la' fad sib sol la4 r16 sol la fad
    si!4 r16 do, re si! mi4 r16 fa? sol mi
    la4 r16 sib, do la re  mi fa sol mi sol la sib

    %10
    sol4 si! do r\mbreak
    do,,4 r do r
    do r do r

    %13
    do r do' sib
    la16 la' sol la fa sol mi sol fa sol mi sol fa sol mi sol
    fa sol fa sol mi fa re fa mi fa re fa mi fa re fa

    %16
    mi fa re mi do re si re\mbreak do re si re do re si re
    do re mi fa sol la sib sol la sol la la, dod re si dod
    re mi fa sol la la, dod la fa'4 mi

    %19
    fa16 sol la sib do do, mi do la'4 sol
    sol16 la sib do re re, fad re sib'[sib sib sib sib sib sib sib]
    la[la la la la la la la]\mbreak sold[sold sold sold sold sold sold sold]

    %22
    sol![sol sol sol sol sol sol sol] fad[fad fad fad fad fad fad fad]
    fa![fa fa fa fa fa fa fa] mi sol fa mi fa la sol fa
    mi sol fa mi fa la sol fa mi [la sold la sold la sold la]

    %25
    dod,[mi re mi re mi re mi] mi,[la sold la sold la sold la]
    dod, la' sold la mi la dod,[mi] la,4 r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IvlIIn = \relative do'' {

    r2 re'4 dod
    R1
    fa,4 mi r2

    %4
    r sol4 fad
    r4 r16 re mi dod re fad sol mi fad la sib sol\mbreak
    la fad sib sol la fad sol mi fad re mi dod la' fad sib sol

    %7
    la fad sol mi fad re sol mi fad4 r8 do16 la
    re4 r8 fa,16 re sol4 r8 sib16 sol
    do4 r8 mib,16 do fa8 do' sib16 sol do re

    %10
    mi4 fa mi r\mbreak
    do,4 r do r
    do r do r

    %13
    do r la' sol
    fa8 dod' la[mi'] la, la' la,[la']
    la, re sol,[sol'] sol, sol' sol,[sol']

    %16
    sol, sold la[mi']\mbreak mi, mi' mi,[mi']
    mi, do'16 re mi8[mi,] la re mi8. mi16
    la,4 r re' dod

    %19
    r2 fa,4 mi
    r2 re8 mi16 fa sol8 mi
    fa4. re8\mbreak si4. do16 re

    %22
    mi4. dod8 re4. re8
    re re re re dod16 mi re dod re fa mi re
    dod mi re dod re fa mi re dod re mi fa mi fa mi fa

    %25
    mi4 r dod, r
    mi dod8 la dod4 r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivlan = \relative do' {

    r2 la'4 la
    R1
    do4 do r2

    %4
    r re4 re
    R1*2
    r2 re,4 r8 do

    %8
    sol'4 r8 fa, do'4 r8 sib
    fa'4 r8 mib sib' fa r do'
    mi,4 si'! sol r\mbreak

    %11
    mi r mi r
    mi r mi r
    mi r la sol

    %14
    fa8 sib fa[la] re, mi re mi
    re re mi[si'] mi, sol do,[re]
    do[re] mi si'\mbreak la si la si

    %17
    la mi dod[sol'] re16 mi fa re sol fa sol mi
    fa4 r la la
    r2 do4 do

    %20
    r2 sib8 la sol do
    do, re16 do fa8 fa\mbreak mi8 fa mi4~
    mi8 fa16 sol la8 la la si16 la si4~

    %23
    si8 si si si mi,4 r
    mi r mi r
    dod r dod r

    %26
    la8 do mi[mi] mi4 r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivcn = \relative do {

    r2 re4 la
    R1
    fa'4 do r2

    %4
    r sol'4 re
    R1*2
    r2 re'8 do sib la

    %8
    sol fa mi! re do sib la sol
    fa' mi re do sib la sol fa
    do'4 re do r\mbreak

    %11
    R1*3
    fa8[mi] re dod re dod re dod
    re si! do si do si do si

    %16
    do si la sold\mbreak la sold la sold
    la la' sol[sol,] fa fa' mi[mi,]
    re'4 r re la

    %19
    r2 fa'4 do
    r2 sol'8 fa mi do
    fa mi re [si!]\mbreak mi re mi re

    %22
    dod si dod la re do si la
    sold sold sold sold la4 r
    la r la r

    %25
    la r la r
    la la la r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibcn = \relative do {

    r2 re4 la
    R1
    fa'4 do r2

    %4
    r sol'4 re
    R1*2
    r2 re'8 do sib la

    %8
    sol fa mi![re] do sib la sol
    fa' mi re do sib la sol fa
    do'4 re do r\mbreak

    %11
    R1*3
    fa8[mi] re dod re dod re dod
    re si! do si do si do si

    %16
    do si la sold\mbreak la sold la sold
    la la' sol[sol,] fa fa' mi[mi,]
    re'4 r re la

    %19
    r2 fa'4 do
    r2 sol'8 fa mi do
    fa mi re si!\mbreak mi re mi re

    %22
    dod si dod la re do si la
    sold sold sold sold la4 r
    la r la r

    %25
    la r la r
    la la la r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 s4 <_+>
    s1
    s
    s2 <_->4 <_+>
    s1
    s
    s2 <_+>4 <6>8 <6+>
    <_!> <6 4> <6> <6> s4 <6>8 <6>
    s4 <6->8 <6 _!> s <6> <6> s
    s4 <6!> s2
    s1*3
    s8 <6+> s2 s4
    s1
    s8 <6+> s4 s2
    s4 <6 4+> <6> <6+>
    s2 s4 <_+>
    s1
    s2 <_->4 <6 5->
    s4 <5>8 <7> <_+>2
    <6 5!> <_+>
    <7- 5> <_+>
    <_+> <_+>
    <_+> <_+>
    <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 45
    s1*27
    \bar "||"

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

    la'4 fa mi8. re16
    sib'2 la4~
    la sol8.[fa16 mi8. re16]

    %4
    dod8. re16 mi4 r
    r mi fa
    sol8. fa16 sol4 sol

    %7
    sol8. fa16 mi4 fa
    sol8.[fa16 sol8. mi16 fa8. sol16]
    fa8. mi16 fa4 r8 r16 fa

    %10
    sol8. fa16 sol4 la\mbreak
    sib8. la16 sib4 sib
    sib8. la16 sol4 la

    %13
    sib8.[la16 sib8. sol16 la8. sib16]
    la8. sol16 la4 la
    la8. sol16 la4 la

    %16
    sib8.[la16 sib8. do16 sib8. la16]
    la4 sol r8 r16 sib
    la4 sol r8 r16 sib

    %19
    la8. sol16 la2
    sol4 r r\mbreak
    mi8.[fa16 sol8. la16 sol8. la16]

    %22
    fa8.[sol16 la8. sib16 la8. sib16]
    dod,8.[re16 mi8. fa16 mi8. fa16]
    re8.[mi16 fa8. sol16 fa8. sol16]

    %25
    mi4 r r
    r la8.[sol16 fa8. mi16]
    re4 re'8.[dod16 re8. mi16]

    %28
    dod8.[si16 la8. sold16] la4~
    la sold4. la8
    la2.

    %31
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIflIIn = \relative do'' {

    R2.*4
    r4 dod re
    mi8. re16 mi4 mi

    %7
    mi8. re16 dod4 re
    mi8.[re16 mi8. dod16 re8. mi16]
    re8. dod16 re4 r8 r16 re

    %10
    mi8. re16 mi4 fa\mbreak
    sol8. fa16 sol4 sol
    sol8. fa16 mi4 fa

    %13
    sol8.[fa16 sol8. mi16 fa8. sol16]
    fa8. mi16 fa4 fa
    fa8. mi16 fa4 fa

    %16
    sol8.[fa16 sol8. la16 sol8. fa16]
    fa4 mi r8 r16 sol
    fa4 mi r8 r16 sol

    %19
    fa8. mi16 fa2
    mi4 r r\mbreak
    R2.*2

    %23
    mi8.[fa16 sol8. la16 sol8. la16]
    fa8.[sol16 la8. sib16 la8. sib16]
    dod,4 r r

    %26
    r r la'8. sol16
    fa8. mi16 re4 sol
    la r mi

    %29
    re2.
    dod
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}


IIvlIn = \relative do'' {

    re,2 fa4
    sol mi fa
    sib,2 sib4

    %4
    la mi' mi
    mi8. re16 mi4 r
    mi r r

    %7
    mi r r
    mi r r
    fa r8 r16 la la8. sib16

    %10
    mi,4 r r\mbreak
    sol r r
    sol r r

    %13
    sol r r
    la la sol
    fa la la

    %16
    sol r sol
    la mi r
    do' do mi

    %19
    do la do
    do~do8.[do16 sib8. do16]\mbreak
    la4 r r

    %22
    R2.
    mi4 r r
    fa r r

    %25
    dod'4\p~dod8. dod16 re4
    la' mi fa~
    fa sol8. la16 sib4

    %28
    mi,! r dod
    re sold,2
    mi'2.

    %31
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlIIn = \relative do'' {

    re,2 fa4
    sol mi fa
    sib,2 sib4

    %4
    la dod re
    dod8. si16 dod4 r
    dod r r

    %7
    dod r r
    dod r r
    la' r8 r16 fa fa4

    %10
    sol r r\mbreak
    mi r r
    mi r r

    %13
    mi r r
    do' do, do
    re fa mi

    %16
    re r re
    do sol' r
    la mi sol

    %19
    la do la
    mi sol fa\mbreak
    mi r r

    %22
    R2.
    dod4 r r
    re r r

    %25
    la'\p sol la
    mi la2~
    la4 sol2

    %28
    dod4 r la
    re, si'!2
    dod2.

    %31
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlan = \relative do' {

    fa2 la4
    sol4. sol8 fa4
    re2 re4

    %4
    mi la, sold
    la la r
    la r r

    %7
    la r r
    la r r
    re, r8 r16 re re'4

    %10
    do r r\mbreak
    do r r
    do r r

    %13
    do r r
    fa, fa mi
    re re' do

    %16
    sib r sib
    do do, r
    fa do do

    %19
    fa r fa
    do' mi re\mbreak
    dod r r

    %22
    R2.
    la4 r r
    la r r

    %25
    mi'\p~mi8. mi16 re4
    mi~mi8. mi16 re4~
    re re2

    %28
    mi4 r mi
    sib' re,2
    la'2.

    %31
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvcn = \relative do {

    \clef tenor R2.*3_\markup\italic"Violoncello"
    r4 la' sold
    la la, r

    %6
    la' r r
    la r r
    la r r

    %9
    re, r8 r16 re re'4
    do r r\mbreak
    do r r

    %12
    do r r
    do r r
    fa, fa mi

    %15
    re re' do
    sib r sib
    do do, r

    %18
    fa do do
    fa r fa
    do' mi re\mbreak

    %21
    dod8. re16 mi4 dod
    re fa,8. [sol16 fa8. sol16]
    la4 r r

    %24
    la r r
    la\p mi fa
    dod4~dod8. dod16 re4~

    %27
    re sib'2
    la4 r la
    sib si2

    %30
    la2.
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIbcn = \relative do {

    R2.*22
    la'4 r r

    %24
    la r r
    la\p mi fa
    dod4~dod8. dod16 re4~

    %27
    re sib2
    la4 r la
    sib si2

    %30
    la2.
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*22
    <_+>2.
    <6 4>
    <_+>4 <6+> <6>
    s2.
    s4 <6>2
    <_+>2.
    <7>4 <6+>2
    <_+>

}


forma = {

    \time 3/4
    \key do\major
    \tempo 4 = 55
    s2.*31
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

    R1*6
    r8 re' la16 si do re si si do si la la si la
    sol sol la sol fa fa sol fa mi8 re16 do re8 mi

    %9
    la, dod re4 r2
    R1
    r2 r8 sol do, re

    %12
    r mi la, si r2
    r8 do' do4 r8 sib sib4
    r8 la re,16 mi fa sol mi fa sol la fa sol la sib

    %15
    sol la sib do la8 do\mbreak sol16 la sib sol la sib sol la
    fa4 r r2
    R1
    r8 la re,16 mi fa sol mi2

    %19
    r8 sol do, re si mi re do
    r mi mi4\mbreak r8 re re4
    r8 mi la16 do sib do re4 r8 sol,

    %22
    do8 la r4 r2
    r r16 do re do si si do si
    la la si la sol sol la sol fa fa sol fa mi mi fa mi

    %25
    re8 sol~sol16 mi fa sol\mbreak mi8 fa mi4
    fa r r2
    r4 r8 la sol mi fa[re]

    %28
    mi la re16 do si la sold8 la4 sold8
    la4 sib la8. la16 dod8. dod16
    re8 re4 do!8~do sib do re16 do

    %31
    sib8. do16 re4 r2
    R1
    r2 r16 fa, sol fa sol sol la sol

    %34
    la la sib la sib sib do sib do4. sib16 la\mbreak
    sol sol la sol la la sib la sib2~
    sib la4 sol

    %37
    la r r2
    r16 dod re dod re8. re16 dod dod re dod re4
    r16 si! do? si do4\mbreak r16 do re do re do si la

    %40
    sold4 r r2
    R1*2
    r16 do, re do re re mi re mi mi fad mi fad fad sol fad\mbreak

    %44
    sol sol la sol la la sib la sib4 sib
    la r r16 la sib la sol sol la sol
    la4 r r16 re mi re dod dod re dod

    %47
    re4 r r2
    r4 r8 re dod16 dod re dod si? si dod si
    la4 r\mbreak r16 mi fa mi fa fa sol fa

    %50
    sol4 r r16 mi fa mi fa fa sol fa
    sol4 r dod r
    re re re r8 r16 re,

    %53
    fa4 sol fa8. fa16 sol8. sol16
    fa4 la fa r

}

IIIflIIn = \relative do'' {

    R1*6
    r8 re' la16 si do re si si do si la la si la
    sol sol la sol fa fa sol fa mi8 re16 do re8 mi

    %9
    la, dod re4 r2
    R1
    r2 r8 sol do, re

    %12
    r mi la, si r2
    R1*5
    r8 la' re,16 mi fa sol mi2

    %19
    r8 sol do, re si mi re do
    r mi mi4\mbreak r8 re re4
    r8 mi la16 do sib do re4 r8 sol,

    %22
    do8 la r4 r2
    r r8 la4 sol8~
    sol fa4 mi re do8~

    %25
    do si dod re\mbreak dod re4 dod8
    re4 r r2
    r4 r8 la' sol mi fa[re]

    %28
    mi la re16 do si la sold8 la4 sold8
    la4 sib la8. la16 dod8. dod16
    re8 re4 do!8~do sib do re16 do

    %31
    sib8. do16 re4 r2
    R1
    r2 r16 re, mi re mi mi fa mi

    %34
    fa fa sol fa sol sol la sol la4. sol16 fa\mbreak
    mi mi fad mi fad fad sol fad sol2~
    sol la4 re,

    %37 OOKK
    mi r r2
    r16 dod' re dod re8. re16 dod dod re dod re4
    r16 si! do? si do4\mbreak r16 do re do re do si la

    %40
    sold4 r r2
    R1*2
    r16 la si la si si do si do4 do\mbreak

    %44
    sib16 sib do sib do do re do re4 do
    do r r16 fa, sol fa mi mi fa mi
    fa4 r r16 fa sol fa mi mi fa mi

    %47
    fa4 r r2
    r la4 r
    dod r\mbreak r16 dod re dod re re mi re

    %50
    mi4 r r16 dod, re dod re re mi re
    mi4 r mi r
    fa fa fa r8 r16 fa

    %53
    la4 dod la16 fa sol fa sib8. sib16
    la4 dod la r

}


IIIvlIn = \relative do'' {

    r8 la' re,16 mi fa sol mi mi fa mi re re mi re
    do do re do sib sib do sib la8 sol16 fa sol8 la
    re,4 r8 la'' sol mi fa[re]

    %4
    mi do re16 do si la sold8 la4 sold8
    la16 si do la sib sol la sib sol8 fa r16 fa sol fa\mbreak
    mi do' sib la re sib la sol mi'8 fa mi[mi,]

    %7
    fa16 sol la si? do re mi fa mi4 r8 fa
    si, mi r4 r2
    r r8 do' fa, sol

    %10
    r la re, mi\mbreak r2
    r8 re' la16 si do re si si do si la la si la
    sol sol la sol fa fa sol fa mi8 re16 do re8 mi

    %13
    la,16 mi' la sol fad sol la fad sol8 re r4
    R1*2
    r8 do' fa,16 sol la sib sol sol la sol fa fa sol fa

    %17
    mi mi fa mi re re mi re do8 sib16 la sib8 do
    fa,8. sol16 la sol la si? mi,8 do' r4
    r2 r8 mi la,16 si do re

    %20
    si do re si do re do si\mbreak la sib do la sib do sib la
    sol la sib sol la la' sol la re,4 r16 mi re mi
    do re mi do fa8 re r mi re si?

    %23
    mi16 fa re  mi do8 si do4 r
    R1*2
    r16 fa sol fa mi mi fa mi re re mi re do do re do

    %27
    si do re si do re mi fa re8 sol, r re'
    si do r re mi8. mi16 si8 si
    la8. la16 dod8. dod16 re8. re16 mi8. mi16

    %30
    fa fa sol fa mi mi fa mi\mbreak re re  mib re do8 la'
    re,4 r r2
    r8 re sol, la16 sib la8 re, la'8. la16

    %33
    sib sib do sib do do re do re4 sol,
    fa r r2\mbreak
    r8 do' la4 sol16 sol la sol fa fa sol fa

    %36
    mi mi fa mi re re mi re do do re do sib sib do sib
    la4 r16 re' mi re mi8 la, r16 fa' sol fa
    sol8 mi r16 re mi re mi mi fa mi fa4

    %39
    r16 re mi re mi4\mbreak r16 mi fa mi fa mi re do
    si4 r r8 mi la,16 si do re
    si si do si la la si la sol sol la sol fa fa sol fa

    %42
    mi8 re16 do re8 mi la, la'4 sold8
    la4 r la la\mbreak
    sol, r r16 re'' mi re mi mi fa mi

    %45
    fa fa sol fa mi mi fa mi fa4 do
    r16 la' sib la sol sol la sol fa4 r8 la,
    la la' re,16 mi fa sol mi mi fa mi re re mi re

    %48
    do do re do sib8 re r2
    r16 mi fa mi re re mi re\mbreak dod4 r
    r16 sol' la sol fa fa sol fa mi4 r

    %51
    r16 mi fa mi re re mi re dod dod re dod re mi fa mi
    fa mi fa mi fa mi fa mi re'4 r8 r16 re,
    re4 dod re16 la sib la sib8. sib16

    %54
    fa4 mi fa r

}

IIIvlIIn = \relative do'' {

    R1*2
    r8 re la16 si do re si si do si la la si la
    sol sol la sol fa fa sol fa mi8 re16 do re8 mi

    %5
    la,4 r8 re' do la sib[sol]\mbreak
    la fa sol16 fa mi re dod8 re4 dod8
    re4 r r8 sol' do,[re]

    %8
    r mi la, re16 do si8 mi, si'8. si16
    dod8 mi fa16 sol, la sib sol8 fa r sib'
    mi, fa r sol\mbreak dod,8 re4 dod8

    %11
    la16 sol la si do re mi fa mi4 r8 fa
    si, mi r re16 do si8 mi, si'8. si16
    do4 r r16 re sol fa mi fa sol mi

    %14
    fa8 do r4 r2
    R1
    r2 r8 mi la, sib

    %17
    r do fa, sib16 la sol8 do, sol'8. sol16
    la4 r r8 mi' la,16 si? do re
    si si do si la la si la sold8 la r la'

    %20
    sold16 la si sold la8 la,\mbreak fad'16 sol ?la fad sol8 sol,
    mi'16 fa? sol mi fa8 fa, r16 re'' do re sol,4
    r8 do4 si la sold8

    %23
    la la,4 sold8 la4 mi8. mi16
    fa4 do re8 si do4
    sol'8. sol16 la8 re,\mbreak la' sol16 fa sol8 la

    %26
    re, re'4 do si la8~
    la sold la4 r8 sol' do fa,
    r mi la, si si la fa' mi16 re

    %29
    do8. do16 mi8. mi16 la,8. la'16 sol8. sol16
    la8 la, la'8. la16\mbreak fa4 fad8 re
    r re' sol,16 la sib do la la sib la sol sol la sol

    %32
    fa fa sol fa mib mib fa mib re8 do16 sib do8 re
    re,4 r r2
    r fa8 sol la sib\mbreak

    %35
    do4 r r16 sib do sib la la sib la
    sol sol la sol fa fa sol fa mi mi fa mi re re mi re
    dod4 r r16 mi' fa mi fa8 la,

    %38
    r16 sol' la sol la8 re, la'4 r16 la sol la
    si!4 r16 sol fa sol\mbreak la4 r
    r8 si, do16 re mi fa re8 si mi[mi,]

    %41
    r mi' do [do'] r do, la[la']
    r16 la, fa' mi re8 mi4 re16 mi do re si re
    do4 r r16 do, re do re4\mbreak

    %44
    re r r16 sib do sib do4
    r16 la'' sib la sol sol la sol la4 do,
    fa,16 fa' sol fa mi mi fa mi la,4 r8 la

    %47
    re,16 mi fa sol la sol la sib la8 do r4
    r8 la' re,16 mi fa sol mi mi fa mi re re mi re
    dod dod re dod si si dod si\mbreak la4 r

    %50
    r16 mi' fa mi re re mi re dod4 r
    r16 sol' la sol fa fa sol fa mi mi fa mi fa sol la la,
    re dod re dod re dod re mi fa4 r8 r16 fa

    %53
    fa4 mi fa8. fa,16 re8. re16
    re4 dod re r

}

IIIvlan = \relative do' {

    R1*4
    r8 la' re,16 mi fa sol mi mi fa mi re re mi re\mbreak

    %6
    do do re do sib sib do sib la8 sol16 fa sol8 la
    re,4 r8 la'' sol mi fa[re]
    mi do re16 do si la sold8 la4 sold8

    %9
    la4 r8 re' do la sib[sol]
    la fa sol16 fa mi re\mbreak mi8 fa mi4
    fa r8 la si? sol r fa

    %12
    sol do r4 r2
    r8 la re re, r sol do do,
    R1*2

    %16
    r2 r4 r8 re'
    sol, do r4 r r8 sol
    do, fa r fa si,! la16 si do re mi fa

    %19
    mi8 sol la[fa] si, do fa[mi]
    mi4 r8 do\mbreak re4 r8 sib
    do do' do4 r8 re re[si?]

    %22
    la8. sol16 fa8 sol mi4 fa8 mi
    mi fa mi[mi] mi4 mi8. mi16
    fa4 do re8 si do4

    %25
    sol'8. sol16 la8 re,\mbreak la' sol16 fa sol8 la
    re,4 r r2
    r8 mi mi8. re16 sol8. sol16 la8. la16

    %28
    si8 mi, re8. re16 si'8 do si[si,]
    do8. do16 sol'8. sol16 re8. re16 sol8. sol,16
    re'4 r r2

    %31
    r8 sol, sib16 do re mib fa8. fa16 sib,8 mib
    sib' sol r4 r2
    r16 sol la sol la la sib la sib4 sol

    %34
    fa r fa8 sol la sib\mbreak
    do do, la'4 sol r
    R1

    %37
    r8 la re,4 r8 la' re,4
    r8 sol fa sol dod,4 r16 fa mi fa
    sol4 r16 mi re mi\mbreak fa4 r

    %40
    r8 sold la4. sold8 la[la]~
    la sol!4 fa mi re8
    do4 si la mi'

    %43
    mi r r16 do re do re8 re,\mbreak
    sol4 r r16 sib do sib do8 do,
    fa4 do'8 do, fa4 r

    %46
    fa' sol re r8 la'
    re,16 dod re mi fa8 re mi do? sol'[sib]
    fa la sol[la] la4 r

    %49
    la r\mbreak mi r
    dod la' la r
    dod, la' la r

    %52
    la re, si' r8 r16 si
    la4 la la8. la16 sol8. sol16
    re4 la la r

}

IIIvcn = \relative do {

    R1*8
    r8 la' re,16 mi fa sol mi mi fa mi re re mi re
    do do re do sib sib do sib\mbreak la8 sol16 fa sol8 la

    %11
    re,4 r8 la'' sol mi fa[re]
    mi do re16 do si la sold8 la4 sold8
    la4 r8 re sol sol, r do

    %14
    fa fa, sib[sib'] do sol la fa
    mi do fa16 sol la fa\mbreak sib4 do8 do,
    fa4 r8 fa mi do re[sib]

    %17
    do la sib'16 la sol fa mi8 fa4 mi8~
    mi re fa[re] sold la r la
    sol! mi fa[re] mi do re[la]

    %20
    r mi'' la,4\mbreak r8 re sol,4
    r8 do fa,4 r8 sib mi,!4
    r8 la re, sol do, fa si,![mi]

    %23
    do re mi [mi,] la4 r
    R1*3
    r8 mi'' la,16 si do re si si do si la la si la

    %28
    sol sol la sol fa fa sol fa mi8 re16 do re8 mi
    la,16 la' si la sol sol la sol fa fa  sol fa mi mi fa mi
    re8. re16 la8. la16\mbreak sib8[sib'] la fad

    %31
    sol4 r8 sol fa re mib[do]
    re sib do16 sib la sol fad8 sol4 fad8
    sol4 r r2

    %34
    R1*3
    r16 la si la si si dod si dod dod re dod re re mi re
    mi mi fa mi fa8 sib r la re,4

    %39
    r8 sol do,4\mbreak r8 fa re4
    r8 mi la,16 si do re si8 mi do[la]
    mi'4 fa do re

    %42
    la8 la'4 sol8 fa4 mi
    la, r r2\mbreak
    R1

    %45
    r8 fa' do' do, fa4 r
    r8 fa do' do, re4 r
    r r8 re' do la sib[sol]

    %48
    la fa sol[re] la'4 r
    la r\mbreak la r
    la la la r

    %51
    la la la r
    la la sold r8 r16 sold
    la4 la, re8. re16 sol,8. sol16

    %54
    la4 la re, r

}

IIIbcn = \relative do {

    R1*8
    r8 la' re,16 mi fa sol mi mi fa mi re re mi re
    do do re do sib sib do sib\mbreak la8 sol16 fa sol8 la

    %11
    re,4 r8 la'' sol mi fa[re]
    mi do re16 do si la sold8 la4 sold8
    la4 r8 re sol sol, r do

    %14
    fa fa, r4 r2
    R1
    r4 r8 fa' mi do re[sib]

    %17
    do la sib'16 la sol fa mi8 fa4 mi8~
    mi re fa[re] sold la r la
    sol! mi fa[re] mi do re[la]

    %20
    r mi'' la,4\mbreak r8 re sol,4
    r8 do fa,4 r8 sib mi,!4
    r8 la re, sol do, fa si,![mi]

    %23
    do re mi [mi,] la4 r
    R1*3
    r8 mi'' la,16 si do re si si do si la la si la

    %28
    sol sol la sol fa fa sol fa mi8 re16 do re8 mi
    la,16 la' si la sol sol la sol fa fa  sol fa mi mi fa mi
    re8. re16 la8. la16\mbreak sib8[sib'] la fad

    %31
    sol4 r8 sol fa re mib[do]
    re sib do16 sib la sol fad8 sol4 fad8
    sol4 r r2

    %34
    R1*3
    r16 la si la si si dod si dod dod re dod re re mi re
    mi mi fa mi fa8 sib r la re,4

    %39
    r8 sol do,4\mbreak r8 fa re4
    r8 mi la,16 si do re si8 mi do[la]
    mi'4 fa do re

    %42
    la8 la'4 sol8 fa4 mi
    la, r r2\mbreak
    R1

    %45
    r8 fa' do' do, fa4 r
    r8 fa do' do, re4 r
    r r8 re' do la sib[sol]

    %48
    la fa sol[re] la'4 r
    la r\mbreak la r
    la la la r

    %51
    la la la r
    la la sold r8 r16 sold
    la4 la, re8. re16 sol,8. sol16

    %54
    la4 la re, r

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*8
    s8 <_+> s4 <6> <6->
    <6> <6> <_+> <6 5 _->8 <_+>
    s2 s8 <6> s <6>
    s <6> s8 <6>16 <6> s4 <2>
    s4 s8 <_+> <_->2
    s1*2
    s2 s8 <6> s <6>
    s <6> s <6>16 <6> <6>8 s <2>4
    <2> <6> s2
    <6>8 <6> s <6> <_+> <6> s4
    s8 <_+> s4 s8 <_+> s4
    s2 s4 <7>
    s8 <_-> <7> <_! 7> <7> <7> <7> <_+>
    <6>4 <6 4>8 <3> s2
    s1*3
    s8 <_+> s4 <6> <6->
    <6> <6> <_+> <6 5>8 <_+>
    s4
    <6 4+> <6> <6+>
    s <4>8. <3->16 <9>8 <8> <6+>4
    <_-> s8 <_-> s <6-> s <6>
    <6-> <6> <_-> <6>16 <6-> s8 <_-> <2> s
    s1*4
    s16 <_+> s8 s2 s4
    <6+> <6>8 <6> s <_+> s4
    s8 <_!> s4 s <6>
    s8 <_è> s4 <7>8 <_+> <6>4
    <4>8 <3!> <9> <8> <4> <3> <9> <8>
    s4 <2> <7>8 <6> <6 4> <3+>
    s1*3
    s2 <7>
    s <6>8 <6> s <6>
    <6> <6> <_->4 <_+>2
    <_+> <_+>
    <_+ 7>4 <6 4> <_+> s
    <_+ 7> <6 4> <_+> s
    <6 4>2 <7 5>4 s8 s16 <7 5>
    <6 4>4 <_+> s <_->
    <6 4> <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*54
    \bar "||"

}

IIIflI = {
    \notypeset
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



IVflIn = \relative do'' {

    la'8 sib do mi, fa4 r
    fa8 [sol la sol16 fa] sol8[la sib la16 sol]
    la8[sib do sib16 la] sol8[fa sol fa16 mi]

    %4
    fa mi re mi fa4 mi r8 sol
    la fa16 mi fa8 la si? sol16 fa sol8 si
    do si16 la re8 do16 si\mbreak mi re do si do si la sol

    %7
    la16. si32 do16. re32 do8 si16. do32 do4 r
    R1*2
    r2 r8 la16. si32 do8[do]

    %11
    do la16. sib32 do16. sib32 sib16. la32\mbreak sib8 sol16. la32 sib8 sib
    sib8 sol16. la32 sib16. la32 la16. sol32 la8 fa16. sol32 la8 la
    la sol16. fad32 sol8 sol sol fa16. mi32 fa8 fa

    %14
    sib sib16 la sib la sol fa  mi8 mi16. fa32 sol8 sol
    sol dod16. re32 mi8 mi mi re16. dod32 re8 re
    re dod r mi, fa fa fa16. mi32 fa16. sol32\mbreak

    %17
    re'8^\markup\italic "Oboi 1.mo" dod r dod, re4. re8
    re16 mi fa mi re4 dod2

}

IVflIIn = \relative do'' {

    r2 la'8 sib do mi,
    fa mi fa2 mi4
    fa8[sol la sol16 fa] do'2~

    %4
    do8 si?16 la si4 do r
    R1*2
    r2 r4 r8 mi,

    %8
    fa re16 do re8 fa sol mi16  re mi8 sold
    la si16 do si8 do16 re mi si la sold la4~
    la16. sold32 la16. si32 la8 sold16. la32 la4 r8 la16. sol?32

    %11
    fad8 fad16. sol32 la16. sol32 sol16. fad32\mbreak sol8 sol16. fad32 sol8 sol
    sol mi16. fa?32 sol16. fa32 fa16. mi32 fa4 r8 fa
    sib sib16. la32 sib8 sib la la16. sol32 la8 la

    %14
    la sol16 fa  sol fa mi re dod8 dod16. re32 mi8 mi
    mi mi16. fa32 sol8 sol sol fa16. mi32 fa8 fa
    fa mi r dod' re8 re re[re]\mbreak

    %17
    fa,8^\markup\italic"Oboi 2.do" mi mi la la re, sol4
    sold4. la8 la2

}


IVvlIn = \relative do'' {

    fa,4 do re la8 do
    re4 la sib8 la sol do
    fa4 r8 fa mi re mi do

    %4
    re4 re8 sol, do re mi do
    fa4 r8 fa sol4 r8 sol
    la la, si [sol]\mbreak do sol' mi4

    %7
    fa sol8 sol, do re mi do
    re4 r8 re mi4 r8 re
    do4 sold la8 mi' fa [mi]

    %10
    red4 mi la, r8 la
    re4 re\mbreak sol, r8 sol
    do4 do fa8 la16. sol32  fa8 fa

    %13
    sol4 r8 mi fa4 r8 re
    sol sol, sol sol la la la la
    la la la la la la la la

    %16
    la la r la' fa re re re\mbreak
    la' la, r la sib sib sib sib
    si!2 la

}

IVvlan = \relative do' {

    fa4 do re la8 do
    re4 la sib8 la sol do
    fa,4 r8 fa' mi re mi do

    %4
    re4 re8 sol, do re mi do
    fa4 r8 fa sol4 r8 sol
    la la, si sol\mbreak do sol' mi4

    %7
    fa sol8 sol, do re mi do
    re4 r8 re mi4 r8 re
    do4 sold la8 mi' fa mi

    %10
    red4 mi la, r8 la
    re4 re\mbreak sol, r8 sol
    do4 do fa8 la16. sol32  fa8 fa

    %13
    sol4 r8 mi fa4 r8 re
    sol sol, sol sol la la la la
    la la la la la la la la

    %16
    la la r la' fa re re[re]\mbreak
    la' la, r la sib sib sib sib
    si!2 la

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 45
    s1*18
    \bar "||"

}

IVflI = {
    %\notypeset
    <<\IVflIn \forma>>

}

IVflII = {
    <<\IVflIIn \forma>>

}

IVvlI = {
    <<\IVvlIn \forma>>

}


IVvla = {
    \clef alto
    <<\IVvlan \forma>>
    \typeset

}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



VflIn = \relative do'' {

    fa8. mi16 re mi
    fa8 fa sol
    la sol16 la sib8

    %4
    la la dod
    \parenthesize re r r
    do?16 \parenthesize sib la sol la fa

    %7
    mi4 fa8
    fa re sol
    sol mi sol

    %10
    \parenthesize do fa, la
    \parenthesize  do sol \parenthesize do\mbreak
    do8. sib16 la8

    %13
    sol mi la
    sol mi la
    sol do,16 do do do

    %16
    do do do do do do
    sol'8 r fa
    do' sib16 la sol la

    %19
    fa8 r fa
    do' sib16 la sol sib
    la8. la16 sol8

    %22
    la la la
    la4.\mbreak
    la16 \parenthesize sib do8[\parenthesize do]

    %25
    \parenthesize do sol\parenthesize do
    \parenthesize do4 sol8
    sol mi16 fa sol la

    %28
    re,8 \parenthesize re'16\parenthesize  mi \parenthesize do\parenthesize  re
    \parenthesize do4 \parenthesize do8
    dod16 \parenthesize re \parenthesize mi8[la,]

    %31
    la8. la16 si8
    si \parenthesize re si
    do4 la8

    %34
    dod\parenthesize re \parenthesize mi
    la,16 la la la la la
    fad8 do' la

    %37
    sol\noBeam sib16 sib sib sib
    la fa fa fa fa fa
    sib8 r la

    %40
    la sol mi
    dod' r re
    la sol mi

    %43
    fa4 mi8
    fa8. fa16 sol8
    la fa mi

    %46
    fa8. fa16 mi8
    fa4.

}


VvlIn = \relative do'' {

    la'8 re, re'
    do re16 do sib do
    la8 sib16 la sol la

    %4
    fa mi fa sol mi fa
    re mi fa sol la sib
    do8 do do

    %7
    do4 do,8
    re16 mi fa mi mi re
    mi fa sol fa fa mi

    %10
    fa sol la sol sol fa
    sol la sib la la sol\mbreak
    la8 do fa,

    %13
    mi16 sol do8[fa,]
    mi16 sol do8[fa,]
    do16 do do do do do

    %16
    do do do do do do
    sib'8 r16 sol la8
    fa sol mi

    %19
    sib' r16 sol la8
    fa sol mi
    fa do do

    %22
    do fa,16 fa fa fa
    fa4.
    fa'16 sol la sol la sib

    %25
    sol8 do fa,
    mi16 re mi fa re mi
    do si do re mi fa

    %28
    sol8 sol sol
    sol4 mi8
    mi16 fa sol fa fa mi

    %31
    fa mi fa re fa8\noBeam
    mi16 la si8[sold]
    la16 la, la la la la

    %34
    sol' la, la la la la\mbreak
    fad' la, la la la la
    do' la, la la la la

    %37
    sib' re, re re re re
    re' re, re re re re
    sol8 r16 mi fa8\noBeam

    %40
    re mi dod
    sol' r16 mi fa8\noBeam
    re mi dod

    %43
    re la la
    la re,16 re re re
    re8 la' dod

    %46
    re la' dod
    re4.

}

Vvlan = \relative do' {

    re8. mi16 fa8
    fa la mi
    do r16 fa mi8\noBeam

    %4
    fa la la
    la16 sol fa mi re8\noBeam
    sol sol la

    %7
    sol4 la8
    fa sib r
    sib, r r

    %10
    fa' r r
    do r r\mbreak
    fa16 sol la sib do8\noBeam

    %13
    do r r
    do r r
    mi, mi16 mi mi mi

    %16
    sol8 sol la
    sol r do,
    do re sol

    %19
    re r do
    do re mi16 re
    do8 fa sol

    %22
    fa\noBeam fa16 fa fa fa
    fa4.\mbreak
    do4 fa8

    %25
    sol4 re8
    sol sol16 sol sol sol
    sol8 sol mi

    %28
    si' si mi,
    re4 si'8
    la4 la8

    %31
    re,4 re8
    la' fa mi
    mi4 re8

    %34
    sol fa mi\mbreak
    re fad la
    mib8. mib16 re8

    %37
    re r r
    la' r r
    mi r re

    %40
    la' sib la
    sol r la
    la sib la

    %43
    la la la
    la re,16 re re re
    re8 re la

    %46
    la' re, la
    la'4.

}

Vbcn = \relative do {

    re4 sib'8
    la4 sol8
    fa4 dod8

    re4 la8
    re4 fa8
    mi mi fa

    %7
    do?8. sib16 la8
    sib r r
    sol' r r

    %10
    la r r
    mi r r\mbreak
    fa4 fa8

    %13
    do r r
    do r r
    do do do

    %16
    mi mi fa
    mi r fa
    la, sib do

    %19
    re r16 mi fa8\noBeam
    la, sib do
    fa, fa' mi

    %22
    fa4 fa,8
    fa'4.\mbreak
    fa4 fa8

    %25
    mi4 re8
    do4 si8
    mi mi do

    %28
    si si' do
    sol4 sold8
    la4 dod,8

    %31
    re4 sold,8
    la re mi
    la,4 fa'8

    %34
    mi re dod\mbreak
    re4 fad8
    la8. sol16 fad8

    %37
    sol r r
    fa? r r
    dod r re

    %40
    fa sol la
    mi r re
    fa sol la

    %43
    re,4 dod8
    re4 sib8
    fa' fa la

    %46
    re, fa, la
    re,4.

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <6>4 <_- 6>8
    s4 <7- 5>8
    s4 <_+>8
    s4 <6>8
    <6>4.
    s4 <6>8
    s4.
    <_- 6>
    <6>
    <6>
    s4.*4
    <6>4.
    <5->
    <6>8 <6>4
    <6->4.
    <6>8 <6>4
    s4.*4
    <6>4 <6!>8
    s4 <6>8
    <6>4.
    <6>
    s
    <_+>
    s4 <7 5>8
    s <6> <_+>
    s4 <6>8
    <6+>4.
    <_+>
    <6+>8. <_->16 <7- 5>8
    <_->4.
    <6>
    <7- 5>
    <6>8 <_- 6> <_+>
    <6+>4.
    <6>8 <_- 6> <_+>
    s4.
    s4 <6>8
    <6>4 <_+>8
    s <6> <_+>

}


forma = {

    \time 3/8
    \key do\major
    \tempo 4. = 60
    s4.*23
    \bar ":..:"\break
    s4.*24
    \bar ":|."

}

VflI = {
    %\notypeset
    <<\VflIn \forma>>

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

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #3

    }

    \header {
        subtitle = \markup "Sinfonia Quinta con due Flauti [autografo 1715] "
        composer = \markup {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] Spiritoso e staccato}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Flauto 1."}
                    \IflI \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Flauto 2."}
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

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \Ivla\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violone""e cello"}
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

    \markup \huge {[4.] Adagio - il Basso tace}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Fl[auto] 1."}
                    \IVflI \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Flauto 2."}
                    \IVflII \global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.3"Unis[oni]"}
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \IVvla\global
                >>
            >>

        >>

            \layout {

                indent = 2\cm

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

    \markup \huge {[5.] All[egr]o assai}

    \score {

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"2 Fl[auti]"\vspace #-0.3"Unis[soni]"}
                    \VflI \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.3"Unis[oni]"}
                    \VvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \Vvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup \center-column{"[Bassi]"\vspace #-0.3"Unis[oni]"}
                    \Vbc\global
                >>
        >>

            \layout {

                indent = 2\cm

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



