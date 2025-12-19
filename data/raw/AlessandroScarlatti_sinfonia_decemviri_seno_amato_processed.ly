\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

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

IvlIn = \relative do'' {

    r8 sib16 do re8 re16 mib fa4 r4
    r8 re16 mib fa8 sol16 la sib4 r
    r8 sib16 do re4\mbreak r8 re16 mib fa4

    %4
    re4 r re r
    sib8 re do4 re16 fa, fa fa fa,4
    r16 fa' fa fa fa,4\mbreak r16 do'' do do do,4

    %7
    r16 fa fa fa sol,4 r8 fa16 sol la8 la16 sib
    do4 r r8 la16 sib do8 re16 mi
    fa4 r r8 fa16 sol la4

    %10
    r8 la16 sib do4 la r
    fa r fa8 la sol4
    la16 do do do do,4 r16 do' do do do,4

    %13
    r16 la' la la la,4\mbreak r16 fa' fa fa fa,4
    r16 do' do do do,4 r16 fa' fa fa fa,4
    r16 sib' sib sib sib,4 r16 do' do do fa,4

    %16
    r16 la, sib do re sib do re mib re do re mib do re mib
    fa mib re mib fa mi fa sol la sol la sol la fa sol la
    sib la sib la sib sol la sib\mbreak do[sib la sol fa mi re do]

    %19
    la'4 r sol16[fa mi re do sib la sol]
    sol'16 re' re re re,4 r16 re' re re re,8 sib'

    %21
    la[sol sol8. fad16] sol[fad mib re do sib la sol]
    sol'4 r fa?16[mib re do sib la sol fa]
    fa'4 r16 fa fa fa\mbreak fa,4 r16 fa' fa fa

    %24
    la,8[sib' sib8. la16] sib la sol fa mib re do sib
    re4 r r16 fa,[sol la sib la sib do]
    re do re mib? fa8 sib16 la sib la sib do re do re mib

    %27
    re do re mib re do re mib re do re mib re do re mib
    re4 r r2

}

IvlIIn = \relative do'' {

    r2 r8 sib16 do re8 re16 mib
    fa4 r r8 re16 mib fa8 sol16 la
    sib4 r8 sib16 do\mbreak re4 r8 re16 mib

    %4
    fa4 r re r
    sol,8 sib4 la8 sib4 r16 fa fa fa
    fa,4 r16 fa' fa fa\mbreak fa,4 r16 la' la la

    %7
    mi8 fa4 mi8 fa4 r
    r8 fa,16 sol la8 la16 sib do4 r
    r8 la16 sib do8 re16 mi fa4 r8 fa16 sol\mbreak

    %10
    la4 r8 la16 sib do4 r
    la r re,8 fa4 mi8
    fa4 r16 do' do do do,4 r16 do' do do

    %13
    la,4 r16 la' la la\mbreak fa,4 r16 fa' fa fa
    la,4 r16 fa' fa fa fa,4 r16 sib' sib sib
    sib,4 r16 sol' sol sol do,4 r16 fa fa fa\mbreak

    %16
    sib, fa sol la sib sol la sib do sib la sib do la sib do
    re do sib do re do re mi fa mi fa mi fa re mi fa
    sol fa sol fa sol mi fa sol\mbreak la[sol fa  mi re do sib la]

    %19
    fa'4 r mi16[re do sib la sol fa mi]
    sol'4 r16 re' re re re,4 r16 re' re re\mbreak
    fad,8[sib la8. la16] sib[la sol fad mib re do sib]

    %22
    sib'4 r re,16 do sib la sol fa mib re
    re' fa fa fa fa,4\mbreak  r16 fa' fa fa fa,4
    do''8[re do8. do16] re4 r

    %25
    sib16 la sol fa mib re do sib do4 r16 fa, sol la\mbreak
    sib la sib do re do re mib fa mib fa sol fa mib fa sol
    fa8 sib16 la sib la sib do sib la sib do sib la sib do

    %28
    sib4 r r2

}

Ivlan = \relative do' {

    R1*3

    %4
    sib'4 r sol r
    mib8 fa mib4 fa8 re' do re
    la re do re\mbreak la sib do la

    %7
    fa la do4 do, r
    R1*2

    %10
    r2 fa4 r
    re r sib8 do do4
    do8 la' sol la mi la sol la

    %13
    mi fa mi fa\mbreak do re do re
    do sib do la re mib fa re
    sol la sib sol la sib la sol\mbreak

    %16
    fa4 r la r
    sib r do r
    mi,! r\mbreak fa r

    %19
    r16 do' do do do,4 do' r
    r8 sib la sib fad[sib la sib16 do]\mbreak
    re8 re, re4 re r

    %22
    r16 sib' sib sib sib,4 sib' r
    r8 re do re la8 re do re
    la fa fa4 fa r

    %25
    fa r fa r\mbreak
    fa r re r
    sib r fa' r

    %28
    fa r r2

}

Ibcn = \relative do {

    R1*3

    %4
    sib'8 la sib fa sol fa sol re
    mib sib fa'[fa,] sib sib' la sib
    fa sib la sib\mbreak fa sol la fa

    %7
    sib[fa] do' do, fa4 r
    R1*2

    %10
    r2 fa8 mi fa do
    re  do re la sib[fa] do' do,
    fa fa' mi fa do fa mi fa

    %13
    do[re] sib do\mbreak la sib la sib
    fa sol la fa sib do re sib
    mib fa sol mib fa sol fa mib\mbreak

    %16
    re4 r do r
    sib r la r
    sol r\mbreak  fa r

    %19
    r8 fa' mi fa do4 r
    r8 sol' fad sol re sol fad sol\mbreak
    re sol, re'[re,] sol4 r

    %22
    r8 mib' re mib sib4 r
    r8 sib' la sib\mbreak fa sib la sib
    fa[sib,] fa' fa, sib4 r

    %25
    sib r sib r\mbreak
    sib r sib r
    sib r sib r

    %28
    sib r r2

}

Ibfn =  \figuremode {

    \set Staff.useBassFigureExtenders = ##f
    \override Staff.BassFigureAlignmentPositioning #'direction = #DOWN

    s1*16
    s2 <6>
    <6!>

}



forma = 	{
    \time 4/4
    \key fa\major
    \tempo 2=50
    s1*28 \bar "||"
}


IvlI = {
    %\notypeset
    <<\IvlIn \forma >>

}

IvlII = {
    <<\IvlIIn \forma >>

}

Ivla = {
    \clef alto
    <<\Ivlan \forma >>

}


Ibc = {
    \clef bass
    <<\Ibcn \Ibfn \forma >>
    \typeset

}

forma = 	{
    \time 3/4
    \key fa\major
    \tempo 4=80
    s2.*6
    \set Score.measureLength = #(ly:make-moment 6 4)
    s1.
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.*5 \bar ":|."\break
    \set Score.measureLength = #(ly:make-moment 6 4)
    s1.*4
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.*5 \bar "||"
}

IIvlIn = \relative do'' {

    R2.\p
    re
    do

    %4
    sib
    la
    sol~

    %7
    sol4 fa2. mi2\mbreak
    re4 mi2
    re2.

    %10
    fa4 la do
    mi sol si
    do r r

    %13
    r2. re,~
    re dod4 re2~
    re4 do2. sib2~

    %16
    sib4 la2 sol2.~\mbreak
    sol4 fa2~
    fa mi4

    %$19
    fa la do
    fa la do
    do r r

}

IIvlIIn = \relative do'' {

    do2.\p~
    do4 sib2~
    sib4 la2~

    %4
    la4 sol2~
    sol4 fa2~
    fa mi4

    %7
    la2. sol2 la4\mbreak
    si4 do2~
    do si4

    %10
    do mi, sol
    do mi sol
    sol r r

    %13
    do,2.~do4 sib2
    la2.~la
    sib4 la2. sol2~

    %16
    sol4 fa2. mi2\mbreak
    la2.
    sol

    %19
    la4 fa la
    do fa sol
    la r r

}

IIvlan = \relative do' {

    la'2.\p
    fa~
    fa

    %4
    re~
    re2 do4
    re do2~

    %7
    do re do\mbreak
    sol2.
    la4 sol2

    %10
    la4 do mi
    r do re
    mi r r\mbreak

    %13
    sol2 la4 sol2.~
    sol4 fa2 mi4 fa2
    mi2. re

    %16
    do re4 do2\mbreak
    la4 do2
    re4 do2

    %19
    do4 r fa
    la do mi,
    fa r r

}

IIbcn = \relative do {

    fa4\p la fa
    re' re, sib
    fa' la fa

    %4
    sol sib sol
    re' re, la
    sib do do,

    %7
    fa la si do mi fa
    sol mi do
    fa sol sol,

    %10
    do r r
    r do sol
    do, r r\mbreak

    %13
    do' mi fad sol sib, do
    re fa sol la fa re
    sol la sol fad sol fa

    %16
    mi fa la, sib do do,\mbreak
    re' la' la,
    sib do do,

    %19
    fa r r
    r fa' do
    fa, r r

}

IIbfn =  \figuremode {

    \set Staff.useBassFigureExtenders = ##f
    \override Staff.BassFigureAlignmentPositioning #'direction = #DOWN

    s2.
    <7>4 <6>2
    <4>4 <6> s
    <9> s2
    <4>4 <3> <6>
    s2 <4>8 <3>
    <9>4 s <7> <4 9> <6>2

    <_!>4 <6>2
    s4 <4> <3>
    s2.
    s2 <_!>4
    s2.

    s4 <6> s <4> <6> s
    <_+> <6> s <3+> <6> s
    <6 5> <_-> s2 <_->
    <6 5> <6>4 <6 5>2.

    <4>4 <6> s
    <6 5> <4> <3>

}



IIvlI = {
    %\notypeset
    <<\IIvlIn \forma >>

}

IIvlII = {
    <<\IIvlIIn \forma >>

}

IIvla = {
    \clef alto
    <<\IIvlan \forma >>

}


IIbc = {
    \clef bass
    <<\IIbcn \IIbfn \forma >>
    \typeset

}

forma = 	{
    \time 12/8
    \key fa\major
    \tempo 2=80
    s1.*8 \bar"||"\break
    s1.*12 \bar "|."
}

IIIvlIn = \relative do'' {

    sib'4 sib8 sib4 la8 sol4.(sol4) fa8
    mib fa mib re mib re do4.(do4) do'8
    re4 re8 re4 re8 re do sib do4 do8

    %4
    do4 do8 do4 do8	\mbreak do sib la sib4 sib8
    sib4 lab8 lab4 sol8 sol4 fa8 fa4 mib8
    re mib fa re mib fa re mib fa re mib fa\mbreak

    %7
    la,4 do'8 do4 la,8 la4 do'8 do4 la,8
    la la' sib do la sib do4. r4 r8
    do4 do8 do4 do8 do sib la sib4 do8\mbreak

    %10
    re do sib re do sib re do sib re do sib
    do re sib sib4 la8 sol4. r8 sol(la)
    sib sol la sib4 sib8\mbreak sib4. la8 do, re

    %13
    mib do re mib4 mib8 mib4.(re4) sib'8
    sib,4. r8 r sib'8 sib,4. r8 r sib'8
    sib,4. r8 r sib'\mbreak sib, re mib fa mib fa

    %16
    sol la sib do,4 la'8 sib4. r8 r sib
    sib,4. r8 r sib' sib,4. r8 r sib'\mbreak
    sib,4. r8 r sib' sib,re mib fa mib fa

    %19
    sol la sib do,4 la'8 sib sib, do re4.\mbreak
    r8 sib' do re4. fa, r4 r8\fermata

}

IIIvlIIn = \relative do'' {

    re4. fa sib,(sib4) sib8
    do4. fa, la(la)
    fa'4 fa8 fa4 fa8 fa mib re mib4 mib8

    %4
    mib?4 mib8 mib4 mib8\mbreak mib! re do re4 re8
    re mib fa fa4 mib8 mib4 re8 re4 do8
    sib do re sib do re sib do re sib do re\mbreak

    %7
    do4 la'8 la4 do,8 do4 la'8 la4 do,8
    do fa sol la fa sol la4. r4 r8
    la4 la8 la4 la8 la sol fad sol4 la8\mbreak

    %10
    sib la sol sib la sol sib la sol sib la sol
    la sib sol sol4 fad8 sol4. r8 mi fa?
    sol mi fa sol4 sol8\mbreak sol4. fa8 la, sib

    %13
    sib la sib do4 do8 do4. sib
    r8 r sib' sib,4. r8 r sib' sib,4.
    r8 r sib' sib,4.(\mbreak sib8) sib do re do re

    %16
    sib4. r8 fa' mib re4. r4 r8
    r r sib' sib,4.  r8 r sib' sib,4.\mbreak
    r8 r sib' sib,4.(sib8) sib do re do re

    %19
    sol,4. r8 fa' mib re4. r8 sib do\mbreak
    re4. r8 sib' do re4. r4 r8\fermata

}

IIIvlan = \relative do' {

    fa4. fa mib4 sol8 sol4 sib8
    mib, re do fa sol fa fa4.(fa4) fa8
    sib,4. r8 r sib' sol4. r4 r8

    %4
    r4 r8 r4 la8\mbreak fa4. r4 r8
    fa4. re sib fa'
    fa r4 r8 r2.\mbreak

    %7
    la8 sib do la sib do la sib do la sib do
    la4. r4 r8 fa4. r4 r8
    la4. r4 r8 re,4. r4 r8\mbreak

    %10
    r2. re4. r4 r8
    mib4. re re r4 r8
    r4 r8 r8 r do\mbreak do4. r4 r8

    %13
    r4 r8 r8 r fa fa4. r8 r fa
    sol fa sol la sol la sib la sib fa mib fa
    sol fa sol la sol la\mbreak sib re do sib4.

    %16
    sib4. la4 sol8 fa4. r8 r fa
    sol fa sol la sol la sib la sib fa mib fa\mbreak
    sol fa sol la sol la sib re do sib4.

    %19
    sib la4 sol8 fa4. r4 r8\mbreak
    fa4. r4 r8 sib4. r4 r8\fermata

}

IIIbcn = \relative do {

    sib4. re mib4 mib'?8 mib4 re8
    do4. sib fa8 sol la fa sol la
    sib4. r4 sib,8 do4. r4 r8

    %4
    r4 r8 r4 la'8\mbreak sib4. r4 r8
    sib,4. re mib fa
    sib, r4 r8 r2.\mbreak

    %7
    fa'8 sol la fa sol la fa sol la fa sol la
    fa4. r4 r8 fa4. r4 r8
    fad4. r4 r8 sol4. r4 r8\mbreak

    %10
    r2. sol,4. r4 r8
    do4. re sol, r4 r8
    r4 r8 r r do'\mbreak fa,4. r4 r8

    %13
    r4 r8 r r fa sib,4. r8 r re
    mib4. fa sol re
    mib fa\mbreak

    %16
    sol re
    mib fa sib,
    r8 r re\p

    %19
    mib4. fa sol re\mbreak
    mib fa sol re
    mib fa sib, r4 r8\mbreak

    %22
    sib4. r4 r8 sib4. r4 r8\fermata

}

IIIbfn = \figuremode {

    \set Staff.useBassFigureExtenders = ##f
    \override Staff.BassFigureAlignmentPositioning #'direction = #DOWN


    s4. <6> s s
    s <6> s s
    s s <9>8 <8->4 s4.
    s s4 <6>8

    <9>8 <8>4 s4.
    s <5-> s s
    s1.*3
    <5>4. s <9>8 <8>4 s4.

    s1.
    <6>4 <5>8 <6 4>4 <3>8 s4. s
    s s4 <7>8

    <9>8 <8>4 s4.
    s s4 <7->8 <4 9>4 <7>8 <8>8 s <6>
    s4. <5 4> s <6>
    s4. <5 4> s <6>

    s <4>8 <3>4 s4. s
    s4. <5 4>

}

IIIvlI = {
    %\notypeset
    <<\IIIvlIn \forma >>

}

IIIvlII = {
    <<\IIIvlIIn \forma >>

}

IIIvla = {
    \clef alto
    <<\IIIvlan \forma >>

}


IIIbc = {
    \clef bass
    <<\IIIbcn \IIIbfn \forma >>
    \typeset

}

forma = 	{
    \time 4/4
    \key fa\major
    \tempo 2=50
    s1*26 \bar "||"
}

IVvlIn = \relative do'' {

    fa,2. sib4
    mib,2. re4
    sib'2. la4

    %4
    re2 do4 fa~
    fa sol mib2~
    mib?4 re8 do re2

    %7
    r1\fermata
    do2. fa4
    sib,2. la4\mbreak

    %10
    fa'2. mi4
    la2 sol4 do,~
    do re sib2~

    %13
    sib4 la8 sol la2
    r1\fermata
    r2 fa'16^\markup \italic  "[presto]" re fa mib re do sib la

    %16
    sib4 r sol'16[mib sol fa mib re do sib]
    do4 r la'16[fa la sol fa mib re do]
    re4 r sol r

    %19
    fa16 re fa mib re8 fa sol16 mib sol fa mib do fa mib
    re sol fa mib re4 do r
    la r fa'16 re fa mib re do sib la

    %22
    sib' sol sib la sol fa mib re do la do sib la sol fa mib
    re4 r\mbreak sib''8^\markup \italic "[largo]" fa lab4~
    lab? sol4. fa8 fa4~

    %25
    fa8 mib16 re mib2 re4
    do2 sib

}

IVvlIIn = \relative do'' {

    re,1
    do2 fa~
    fa4 mi! do'2~

    %4
    do4 sib2 la4
    sib2. la8 do
    fa,1

    %7
    r\fermata
    la
    sol2 do~\mbreak

    %10
    do4 si sol'2~
    sol4 fa2 mi4
    fa2. mi8 sol

    %13
    do,1
    r\fermata
    do16^\markup \italic  "presto" la do sib la sol fa mi fa4 r

    %16
    sib'16[sol sib la sol fa mib re] mib4 r
    do'16[la do sib la sol fa mi] fa4 r\mbreak
    sib, r mib r

    %19
    r sib16 fa sib la sol8 sib do[re16 do]
    si8 do do8.[si16] do4 r
    fa,4 r re'16 sib re do sib la sol fa

    %22
    sol' mib sol fa mib re do sib la fa la sol fa mib re do
    sib4 r\mbreak fa''2^\markup \italic  "[largo]"
    sib, la

    %25
    sib4. do8 la4 sib~
    sib la sib2

}

IVbcn = \relative do {

    sib1~
    sib4 la sib2
    sol fa

    %4
    sib fa'\mbreak
    re4 mib do2
    sib1

    %7
    r\fermata
    fa'
    (fa4) mi fa2\mbreak

    %10
    re do
    fa do'
    la4 sib sol2

    %13
    fa1
    r\fermata
    fa4_\markup \italic  "presto" r re r

    %16
    sol r sol, r
    la r la r\mbreak
    sib'16 sol sib la sol fa mib re mib do mib re do sib la sol

    %19
    la4 sib8 re mib[sol] lab fa
    sol do, sol'[sol,] do'16 la do sib la sol fa mi
    fa re fa mib re do sib la sib4 r

    %22
    mib r fa r
    sol r\mbreak re2^\markup \italic  "largo"
    mib fa

    %25
    sol fa4 sib,
    fa2 sib


}

IVbfn = \figuremode {

    \set Staff.useBassFigureExtenders = ##f
    \override Staff.BassFigureAlignmentPositioning #'direction = #DOWN

    s1
    <2>2 <4>4 <3>
    <7> <6> <4> <3>
    <9> <8> <4> <3>

    <6>2 <_- 7>4 <6>
    <4->2 <3>
    s1
    s
    s2  <4>4 <3>

    <7> <6!> <4> <3>
    <9> <8> <4> <3>
    <6>2 <7>4 <6>
    <4>2 <3>
    s1

    s1*2
    <6>1

    s1
    <6>2 s4 s8 <6>
    s4 <4>8 <3> s2

    s1*2 s2

    <6>4 <5->
    <4-> <3> <9> <8>
    <7> <6-> <7> s
    <4> <3> s2


}


IVvlI = {
    %\notypeset
    <<\IVvlIn \forma >>

}

IVvlII = {
    <<\IVvlIIn \forma >>

}


IVbc = {
    \clef bass
    <<\IVbcn \IVbfn \forma >>
    \typeset

}

forma = 	{

    \time 4/4
    \key fa\major
    \tempo 2=50
    \partial 4 s4
    s1*5
    s2. \bar ":..:"\break
    s4
    s1*4
    s2. \bar ":|."
}

VvlIn = \relative do'' {

    r8 fa,
    fa4 r16 sib do sib la8[fa] r16 re' mib fa
    sol4 r16 fa sol fa mib4 r16 mib fa mib
    re8 sib fa'4\mbreak r8 sol, re'[fa,]

    %4
    sib[re] do8. do16 sib do re mib? fa4
    r16 do re do sib8. sib16 la do re mi ?fa4
    r8 la sol8. sol16 fa4 \mbreak r8 do

    %7
    do4 r16 fa mib fa sol la sib sol la sib sol la
    fad8[sol sol8. fad16] sol8.[sol16] fa?8. fa16
    fa8.[fa16] sol8. sol16 do, fa mib fa re8 sib\mbreak

    %10
    r16 fa' sol fa mib4 r16 re mib re do4
    r16 fa mib re do8. do16 sib4

}

VvlIIn = \relative do'' {

    r8 re,
    re4 mi fa16 fa' sol la sib4
    r16 sib, do sib la4 r16 sib la sib do8. do16
    fa,4 r8 fa\mbreak sib4 r8 re,

    %4
    sol16 la sib8 sib8.[la16] sib4 r16 re mib re
    do8 fa fa8.[mi16] fa4 r16 do re mi
    fa8[fa fa8. mi16] fa4\mbreak r8 la,

    %7
    la4 r8 sib sib8.[sib16] do8. do16
    do re sib do la8. la16 sol sib la sib do re mib do
    re8. re16 mi8.[mi16] fa la, sib do fa, re' mib re\mbreak

    %10
    do8 la r16 sib do sib la8 fa r16 sol la sol
    fa8 sib sib8.[la16] sib4

}

Vbcn = \relative do {

    r4
    sib'8 la sol4 fa re
    mib fa sol la
    r16 sib do sib la la sib la\mbreak sol sol la sol fa fa sol fa

    %4
    mib fa re mib fa8 fa, sib4 r16 sib' do sib
    la la sib la sol8. sol16 fa4 r16 mi re do
    sib do la sib do8 do, fa4\mbreak r

    %7
    r16 fa' mib fa re8. re16 mib8[re16 mib] do8 mib
    re sol, re'[re,] sol8. sol16 la8.[la16]
    sib sib' la sib sol do sib do la fa sol la sib8 sol\mbreak

    %10
    la fa sol[mib] fa re mib[do]
    re sib fa'[fa,] sib4

}

Vbfn =  \figuremode {

    \set Staff.useBassFigureExtenders = ##f
    \override Staff.BassFigureAlignmentPositioning #'direction = #DOWN

    s4
    s <6> s2
    s1
    s2

    s4 <6>
    s1
    s4 <7>8. <6>16 s2
    s2.

    s4
    s2. <6>8 <6>
    <7 _+>4 <4>8 <3> s2
    s1

    s
    s4 <4>8 <3>

}




VvlI = {
    %\notypeset
    <<\VvlIn \forma >>

}

VvlII = {
    <<\VvlIIn \forma >>

}


Vbc = {
    \clef bass
    <<\Vbcn \Vbfn \forma >>
    \typeset

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

    global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \override Staff.BreathingSign.text = #(make-musicglyph-markup "scripts.caesura.straight")
    \terzinequarto
}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \bold \huge \fill-line{"I. La caduta dei Decemviri - Sinfonia"}
    \markup\fill-line{"  ""  ""A. Scarlatti (1660 - 1725)"}


    \markup\huge {"[1.] Allegro"}

    \score {

        \new ChoirStaff <<
            \new Staff <<
                \set Staff.instrumentName = \markup\center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \IvlI \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \IvlII \global
            >>

            \new Staff	<<
                \set Staff.instrumentName = \markup\center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \Ivla \global
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.instrumentName =  \markup\center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \Ibc \global
            >>
        >>


        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup\huge {"[2. Adagio]"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII \global
            >>

            \new Staff	<<
                \set Staff.midiInstrument = #"viola"
                \IIvla \global
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc \global
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)  %aumenta lo spazio orizzontale
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

   % \pageBreak

    \markup\huge {"[3. Allegro]"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII \global
            >>

            \new Staff	<<
                \set Staff.midiInstrument = #"viola"
                \IIIvla \global
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc \global
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/20)  %aumenta lo spazio orizzontale
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


    \markup \bold \huge\fill-line {"II. Correa nel seno amato - Sinfonia"}
    \markup\fill-line{"  ""  ""A. Scarlatti (1660 - 1725)"}

    \markup \huge {"[1.] Grave"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \IVvlI \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \IVvlII \global
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.instrumentName = \markup\center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \IVbc \global
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/1)  %aumenta lo spazio orizzontale
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

    \markup\huge {"[2.] Balletto"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlII \global
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \Vbc \global
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/1)  %aumenta lo spazio orizzontale
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
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80, 2.20.0
%}
