\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = "up"

giu = \change Staff = "down"

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
      \musicglyph "scripts.prall"}}
mbreak = { }



Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


Ivlcn = \relative do'' {

    r8 do do4 r8 do do4
    r8 do sib4 r8 sib la4
    r8 la sol4 r8 sol fa4

    %4
    r8 fa sib4 la r
    R1*3
    r8 la' la4 r8 do4  si8

    %9
    do mi, fa8.\tr(mi32 fa) sol4 r\mbreak
    r8 fa\noBeam  fa re4 do si8
    la sol' sol4 r2

    %12
    r8 la la4 r2
    r r8 la la4
    r8 la la4 r8 la sol4

    %15
    r8 sol fa2(mi4\tr)
    fa r sol8 mi do16(sol') fa(mi)
    fa8 re sib!16(re) do(sib) sib'4-! la-!

    %18
    sib,-! la-! sol2
    fa r\fermata

}


Ivcn = \relative do {

    fa4 r8 fa mi4 r8 mi
    re4 r8 re do4 r8 do
    sib4 r8 sib la4 r8 la

    %4
    sol4 r8 sol \clef tenor \key fa\major fa''8 do \once\stemUp fa,16 la'(sol fa)
    sol8 mi do16 sol'(fa mi) fa8 re\mbreak sib16 fa'(sol fa)
    mi8 re la16 mi'(re do) sol'8 mi sib16 sol'(fa mi)

    %7
    fa8 do <<
        {
            r16 do sib la sib8 mi s16 sol fa mi
            fa8 [la,]
        }\\{
            fa16 la sol fa sol4 sol'16 sib, la sol
            la8 [fa]
        }
    >> r16 fa' fa(la) sol(fa) do(mi) fa(re) si(fa')
    mi8 do4 si8 do sol'4 la8\mbreak

    %10
    si,16 do re mi fa la sol fa mi sol fa mi <<{re8. dod16}\\sol4>>
    dod?4 r16 mi mi16\tr(re32 mi) fa16 fa mi re mi8.\tr(red16)
    red(do!) la(fad) red(la') si(la) fa'! re? si sold mi fa' mi re

    %13
    sol mi dod la sol mi' mi\tr(re32 mi) fa4 r
    \clef bass\key fa\major do,4 r8 do sib4 r8 sib
    la4 r8 la sol4 r8 sol

    %16
    \clef tenor\key fa\major fa''8 do \once\stemUp fa,16 la' sol fa sol4 r8 mi
    re4 \clef bass\key fa\major sol,4 do,  fa
    do1

    %19
    fa,2 r\fermata

}


IvlIn = \relative do'' {

    r8 do do4 r8 do do4
    r8 do sib4 r8 sib la4
    r8 la sol4 r8 sol fa4

    %4
    r8 fa sib4 la r
    R1*3
    r8 la' la4 r2

    %9
    R1*2
    r8 sol sol4 r2

    %12
    r8 la la4 r2
    r r8 la la4
    r8 la la4 r8 la sol4

    %15
    r8 sol fa2(mi4\tr)
    fa r sol r
    fa r sib4-! la-!

    %18
    sib, la sol2
    fa r\fermata

}


IvlIIn = \relative do'' {

    la4 r8 la sol4 r8 sol
    fa4 r8 fa mi4 r8 mi
    mi4 r8 mi do4 r8 do'

    %4
    sib4 r8 mi,  fa4 r
    R1*3
    r8 do'' do4 r2

    %9
    R1
    r8 re, re4 r2
    r8 mi mi4 r2\mbreak

    %12
    r8 fad fad4 r2
    r fa!4 r8 fa
    mi4 r8 mi re4 r8 re

    %15
    do4 r8 do sib2\tr
    la4 r r do~
    do sib sol'-! fa-!

    %18
    sol, fa2 mi4
    fa2 r\fermata

}


Ibcn = \relative do {

    fa4 r8 fa mi4 r8 mi
    re4 r8 re do4 r8 do
    sib4 r8 sib la4 r8 la

    %4
    sol4 r8 sol fa4 r8 fa'
    mi4 r8 mi re4 r8 re
    do4 r8 do sib4 r8 sib

    %7
    la4 r8 la\mbreak sol4 r8 sol
    fa4 fa' mi re8 sol,
    do4 re mi fa

    %10
    sol8 sol, si sol do fa sol sol,
    la la' dod la re sol, la la,
    sib4 r8 si' sold4 r8 sold

    %13
    la4 r8 dod re4 r8 re,
    do4 r8 do sib4 r8 sib
    la4 r8 la\mbreak sol4 r8 sol

    %16
    fa4 r8 fa' mi4 r8 mi
    re4 sol do, fa
    do1

    %19
    fa,2 r\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <7>4 s8 <6> <7>4 s8 <6>
    s1*3
    s2 <6 4>
    s1*2
    s4 <7>8 <6!> s2
    s1
    <7 _+>
    <_+>2 <7->
    <7 _+>1
    <6>2 <7>4 s8 <6>
    <7>4 s8 <6> <7>4 s8 <6>
    s2 s4 s8 <6>
    <7>2 <7->
    <7 3>4 <6 4> <5 4> <3>

}


forma = {

    \time 4/4
    \tempo 4 = 40
    \key fa\major
    s1*19
    \bar "|."

}

Ivlc = {
    \Iglobal
    <<\Ivlcn \forma>>

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}

Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma\Ibfn>>

}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


IIvlcn = \relative do'' {

    fa4-! do-! fa, r8 do'
    fa la sol mi fa do fa,[fa']
    re do4 sib8 la fa4 do'8

    %4
    fa la4 fa8 re fa4 re8
    mi do4 si8 sol' do,4 si8
    do mi4 do8 fa do sib?4\prall

    %7
    la  r r2
    R1*8
    r4 r8 sol\mbreak do mi re si

    %17
    do sol'4 do,8 la' do,4 si8
    do sol'4 sol8 sol la,4 sol'8
    fa re4 dod8 re4 r16 la'\solo sol la

    %20
    fa8. mi16 re [fa mi re] dod8. si16 la[ dod si la]
    sol la sib? la do, [sol' la sol] fa mi re8 r16 re' dod re\mbreak
    fa8  sold4 la8 mi4 r16 do(si do)

    %23
    fad do la' do, fad [do la' do,] <<sol'4\\sib,?>> r16 sib(la sib)
    mi sib sol' sib, mi [sib sol' sib,] <<fa'4\\la,>> r16 la(si dod)
    re mi fa8~fa16 [mi re8]~re16 si' do, la' si,8.\tr [la16]

    %26
    la'4-! mi-! la,-! r
    R1\mbreak
    r2 r16 la do mi la4

    %29
    r2 r16 mi si sol mi4
    r2 r16 re' fa la re4
    r2 r4 r8 mi,

    %32
    la do si? sold la mi la, [la']
    fa mi4 re8 do16 si la4 la'8
    fa16 la sol4 fa8 mi16  sol fa4 mi8\mbreak

    %35
    re16 fa mi4 re8 do8.[sold'16 la8. si16]
    sold4. r16 la sol8. sol16 fa8. sol16
    mi4 r8 r16 la fad8. fad16 sol8. la16

    %38
    fad4. r16 sol mi8. mi16 fa?8. sol16
    mi4. r16 fa\f mib8. fa16 re8.[mib16]
    do4.\tr r16 sib? sib'4-! fa-!\mbreak

    %41
    sib, r r2
    R1
    r2 sol'4-! re-!

    %44
    sol,-! r r2
    R1
    r4 r8 re'' r do r do

    %47
    r sib r sib r la r la
    r sol r mi fa4-! do-!
    fa,-! r r8 do'' sib sol

    %50
    la fa4 do'8 sib la4 sol8\mbreak
    fa do4 fa8 fa re4 fa8
    mi sol4 mi8 fa sol,4 mi8

    %53
    fa la'4 sol8 la4-! sol-!
    fa-! r r2\fermata

}


IIvcn = \relative do {

    fa4 mi fa8 do fa,4
    fa' do' fa, la,
    sib do fa r

    %4
    fa la si sol
    do, sol' mi re
    do sib! la sol

    %7
    \clef tenor \key fa\major fa'' do fa, r8 do'
    fa la sol mi fa do fa,[fa']
    re <<do4\\mi,>> sib'8\mbreak la fa4 do'8

    %10
    fa la4 fa8 re fa4 re8
    mi do4 si8 sol' do,4 si8
    do4 r16 do re mi fa mi fa sol fa [sol fa mi ]

    %13
    re sib? la sib re[sib la sib] re,[sib' do sib] mi, sib' do sib
    la fa mi fa\mbreak la[fa mi fa] la[fa' sol fa] la,[fa' sol fa]
    sib,[fa' sol fa]  sib,[fa' sol fa] si,[fa' sol fa] si,[fa' sol fa]

    %16
    mi fa sol mi \clef bass \key fa\major do,,4 do'' sol
    do, mi fa sol
    do, sib la la'

    %19
    re, la r16 re fa la re8[re,]\mbreak
    re4 r la r
    mi' la, r16 re fa la re8[re,]

    %22
    r2 r16 do' la mi la,4
    re r r16 sol re sib sol4
    do r r16 fa la do fa4

    %25
    si,8 la si la sold la mi' mi,
    \clef tenor \key fa\major r2 r4 r16 mi' re mi\mbreak
    do8.\tr [si16] la do si la sold8.[fad16] mi fad sold la

    %28
    si do re4 do16 si do(si) la8 r16 la sold la
    do8 red4 mi8 si4 r16 sol' fa sol
    mi8 re4 dod8 re4 r16 fa mi fa

    %31
    re do si4 la8 sold16[re' do si] si8.\tr la16
    \clef bass \key fa\major <<la4\\\stemUp\shiftOn mi\\\stemUp\shiftOnn la,>> mi' la, do
    re mi la, la'

    %34
    re, si do la
    si sold la re
    mi mi, la re

    %37
    la' la, re sol
    re' re, do fa
    do' do, fa sib?\mbreak

    %40
    fa fa, sib la
    sib\clef tenor \key fa\major r16 fa'' mib fa re8.\tr[do16] sib re do sib
    la8.[sol16] fa sol la sib do(re) mib4 re16(do)

    %43
    re(do) sib8 r4 r2
    r4 r16 re do re sib8.\tr la16 sol[sib la sol]
    fad8. mi16 re[mi fad sol]\mbreak la(sib) do4 sib16(la)

    %46
    sib(la) sol8 sol'[fa] mib16 sol fa4 mib8
    re16 fa mib4 re8 do16 mib re4 do8
    sib16 re do4 sib8 la4 \clef bass \key fa\major mi

    %49
    fa8 do fa,4 fa' do'
    fa, la, sib do
    fa la, sib si

    %52
    do do'\mbreak fa, do
    fa,-! do'-! fa-! do-!
    fa,-! r r2\fermata

}


IIvlIn = \relative do'' {

    fa4-! do-! fa, r8 do'
    fa la sol mi fa do fa,[fa']
    re do4 sib8 la fa4 do'8

    %4
    fa la4 fa8 re fa4 re8
    mi do4 si8 sol' do,4 si8
    do mi4 do8 fa do sib?4\prall

    %7
    la  r r2
    R1*8
    r4 r8 sol\mbreak do mi re si

    %17
    do sol'4 do,8 la' do,4 si8
    do sol'4 sol8 sol la,4 sol'8
    fa re4 dod8 re4 r

    %20
    R1*2
    r2 mi4 r

    %23
    r2 fa4 r
    r2 fa4 r
    R1

    %26
    la4-! mi-! la,-! r
    R1\mbreak
    r2 r16 la do mi la4

    %29
    r2 r16 mi si sol mi4
    r2 r16 re' fa la re4
    r2 r4 r8 mi,

    %32
    la do si? sold la mi la, [la']
    fa mi4 re8 do16 si la4 la'8
    fa4 r mi r

    %35
    fa r do8.[sold'16 la8. si16]
    sold4. r16 la sol8. sol16 fa8. sol16
    mi4 r8 r16 la fad8. fad16 sol8. la16

    %38
    fad4. r16 sol mi8. mi16 fa?8. sol16
    mi4. r16 fa\f mib8. fa16 re8.[mib16]
    do4.\tr r16 sib? sib'4-! fa-!\mbreak

    %41
    sib, r r2
    R1
    r2 sol'4-! re-!

    %44
    sol,-! r r2
    R1
    r4 r8 re'' r do r do

    %47
    r sib r sib r la r la
    r sol r mi fa4-! do-!
    fa,-! r r8 do'' sib sol

    %50
    la fa4 do'8 sib la4 sol8\mbreak
    fa do4 fa8 fa re4 fa8
    mi sol4 mi8 fa sol,4 mi8

    %53
    fa la'4 sol8 la4-! sol-!
    fa-! r r2\fermata

}


IIvlIIn = \relative do'' {

    la4-! sol-! la-! r
    r8 do' sib sol do fa,4 do'8
    sib la4 sol8 fa do fa,4

    %4
    la'8 do4 la8 fa la4 fa8
    sol mi4 re8 do sol' fa4
    mi8 sol4 mi8 do fa4 mi8

    %7
    fa4 r r2
    R1*8
    r2 r8 sol fa re\mbreak

    %17
    mi do4 sol'8 fa mi re4
    do8 mi4 re8 dod mi4 dod8
    re sib' mi,4\tr re r

    %20
    R1
    r2 r16 re' la fa re4
    r2 r16 la do mi la4

    %23
    r2 r16 sol, sib re sol4
    r2 r16 fa do la fa4
    R1\mbreak

    %26
    do'4 si do16 la do mi la4
    R1
    r2 r16 la mi do la4

    %29
    r2 r16 mi sol si mi4
    r2 r16 re' la fa re4
    R1

    %32
    r8 mi re si do la4 mi'8
    re do4 si8 r16 la do mi la4~
    la re,2 do4~

    %35
    do si la8. si16 do8. [re16]
    si4. r16 mi dod8. dod16 re8. mi16
    dod4 r do8. re16 sib!8. [do16]

    %38
    la4. r16 re sol,8.[do16] la8. sib16
    sol4. r16 do la4 sib8.\tr sol'16
    la,4.\tr r16 fa' re4-! do-!

    %41
    re r r2\mbreak
    R1
    r2 sib4-! la-!

    %44
    sib-! r r2
    R1*3
    r2 la4-! sol-!

    %49
    la-! r8 do fa la sol mi
    fa do fa,[fa'] re do4 sib8
    la fa'4 do8 re fa4 re8

    %52
    mi sib'4 sol8 la sib,4 sol8
    la fa'4 mi8 fa4-! sol-!
    la-! r r2\fermata

}

IIbcn = \relative do {

    fa4 mi fa8 do fa,4
    fa' do' fa, la,
    sib do fa r

    %4
    fa la si sol
    do, sol' mi re
    do sib! la sol

    %7
    fa' mi fa8 do fa,4
    fa' do' fa, la,
    sib do fa r

    %10
    fa la si sol
    do sol do, sol'\mbreak
    do, sib la r8 la

    %13
    sib4 r sib do
    fa r fa r
    sib, r sol r

    %16
    do r do' sol
    do, mi fa sol
    do, sib la la'

    %19
    re, la  re r
    re r la r
    mi' la, re r

    %22
    r2 la4 r
    re r sol, r\mbreak
    do r fa, r

    %25
    si'8 la si la sold la mi' mi,
    la4 sold la8 la, r4
    la r mi'4. fad8

    %28
    sold fad sold mi la,4 r
    la' r sol r
    sol8 fa mi4 re r

    %31
    fa re mi8 la mi mi,
    la4 mi' la, do\mbreak
    re mi la, la'

    %34
    re, si do la
    si sold la re
    mi mi, la re

    %37
    la' la, re sol
    re' re, do fa
    do' do, fa sib?\mbreak

    %40
    fa fa, sib la
    sib r sib r
    fa'4. sol8 la sol la fa\mbreak

    %43
    sib,4 r sol' fad
    sol r sol, r
    re'4. mi8 fad mi fad re

    %46
    sol4 sib do la
    sib sol la fa
    sol do, fa mi

    %49
    fa8 do fa,4 fa' do'
    fa, la, sib do
    fa la, sib si

    %52
    do do' fa, do
    fa,-! do'-! fa-! do-!
    fa,-! r r2\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*5
    s4 <6 4> s2
    s1*4
    s2 s4 <4>8 <3!>
    s4 <6 4> s2
    s1*2
    s2 <_!>
    s1*2
    <6>2 <7 _+>
    s1*8
    s2 <_+>
    s1
    s2 <6>
    s4 <7>8 <6+> s2
    s4 <6> <_+>2
    s1*4
    s2 <7 _+>
    s <_+>
    s <7->
    s <7->
    s1*2
    <7->1
    s1*2
    <7 _+>1
    s
    s4 <6-> s2
    <7>4 <7 _!> s2

}


forma = {

    \time 2/2
    \tempo 2 = 60
    \key fa\major
    s1*54
    \bar "|."

}

IIvlc = {
    \IIglobal
    <<\IIvlcn \forma>>

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}

IIvc = {
    \IIglobal
    \clef bass
    <<\IIvcn \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma\IIbfn>>

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


IIIvlcn = \relative do'' {

    la'16(fa) re(fa) la(fa) re(la') sol4 r8 sol
    fad16 (do) la'(do,) fad(do) la' (do,) sib4 r8 sol'
    sol16(la,) sib'(la,) sol'(la,) sib'(la,) sol'8. [la16 fa8. sol16]

    %4
    mi2\tr re4 r
    R1*3
    mi16(do) la(do) mi(do) la(do) re4 r8 re\mbreak

    %9
    dod16(sol) mi'(sol,) dod(sol) mi'(sol,) fa4 r8 re'
    re16(sold) si(sold) re(sold) si(sold) do,4 r
    si r sol'16(dod,) si'(dod,) sol'(dod,) si'(dod,)

    %12
    do!4 r sol'16(sib,) sib'(sib,) sol'(sib,) sib'(sib,)
    sol'4 -! fa -! sol, -! fa8. re'16
    mi,2 re4 r\fermata

}


IIIvlIn = \relative do'' {

    la'16(fa) re(fa) la(fa) re(la') sol4 r8 sol
    fad16 (do) la'(do,) fad(do) la' (do,) sib4 r8 sol'
    sol16(la,) sib'(la,) sol'(la,) sib'(la,) sol'8. [la16 fa8. sol16]

    %4
    mi2\tr re4 r
    R1*3
    mi16(do) la(do) mi(do) la(do) re4 r8 re\mbreak

    %9
    dod16(sol) mi'(sol,) dod(sol) mi'(sol,) fa4 r8 re'
    re16(sold) si(sold) re(sold) si(sold) do,4 r
    si? r sol' r

    %12
    do, r sol' r
    sol-! fa-! sol, -! fa8. re'16
    mi,2 re4 r\fermata

}


IIIvlIIn = \relative do'' {

    fa4 r8 fa mi16(dod) la(dod) mi(dod) la(mi')
    re4 r sol16(re) sib'(re,) sol(re) sib'(re,)
    dod4 r8 mi mi4 re~

    %4
    re dod re r
    R1*3
    do?4 r8 do si16(sold) mi(sold) si(sold) mi(si')\mbreak

    %9
    la4 r8 dod re16(la) fa'(re) la'(re,) fa(re)
    sold,4 r8 sold la4 r
    sold'16(re) si'(re,) sold(re) si'(re,) dod4 r

    %12
    fad16 (do) la'(do,) fad(do) la' (do,) sib4 r8 mi
    mi4-! re-! mi,-! re~
    re dod re r\fermata

}



IIIvcn = \relative do {

    re4 r8 re la'4 r8 la
    re,4 r8 re sol,4 r8 sol
    la4 r  la' re,

    %4
    la' la, \clef tenor\key fa\major la''16(fa) re(fa) la(fa) re(fa)
    sol(mi) dod(la) sol(sib) dod,(la') fad(re) la'(fad) do'?(fad,) la(fad)
    sib(sol) re'(sib) sol'(mi) dod(si)\mbreak dod la mi' la, sol' la, fa' la,

    %7
    fa' re, mi' re, re' re, re' fa, re' mi, do' la <<{si8.[la16]}\\{mi8.[la16]}>>
    la4 \clef bass \key fa\major r8 la,\mbreak mi'4 r8 mi
    la4 r8 la re,4 r8 re

    %10
    mi4 r8 mi \clef tenor\key fa\major mi'16(do) la(do) mi(do) la(do)
    re4  \clef bass\key fa\major r8 mi,\mbreak la,4 r
    re r sol, r8 sol

    %13
    la4-! re-! la'-! re,-!
    la2 re4 r\fermata

}

IIIbcn = \relative do {

    re4 r8 re la'4 r8 la
    re,4 r8 re sol,4 r8 sol
    la4 r  la' re,

    %4
    la' la, re r8 re
    la'4 r8 la re,4 r8 re
    sol,4 r8 sol la4 r8 la

    %7
    re4 r8 re mi la mi mi,
    la4 r8 la\mbreak mi'4 r8 mi
    la4 r8 la re,4 r8 re

    %10
    mi4 r8 mi la,4 r8 la
    mi'4 r8 mi la,4 r
    re r sol, r8 sol

    %13
    la4-! re-! la'-! re,-!
    la2 re4 r\fermata

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <7>
    <_+>2<_+>
    s1
    <_+>2 <_+>
    s <_+>
    s <7 _+>
    s <7 _+>
    <7 _+>1
    <7 _+>
    <_+>2 <7 _+>
    <7! _+>1

}


forma = {

    \time 4/4
    \tempo 4 = 40
    \key fa\major
    s1*14
    \bar "|."

}

IIIvlc = {
    \IIIglobal
    <<\IIIvlcn \forma>>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}

IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma\IIIbfn>>

}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


IVvlcn = \relative do'' {

    r8 do' (sib)
    la (sol fa) re'4 fa,8
    mi4. fa8 do' (la)
    sib (sol re) mi sib'(sol)

    %4
    la fa do fa,4.
    la'8 fa(do) fa, fa'(la)
    sol (mi do) mi, do' sol'

    %7
    la, sol'(fa) si, sol' fa
    mi (do mi) do' do, do'
    la fa la\mbreak re re, re'

    %10
    si sol si do mi, do'
    la si do re, do' si
    do,,4. r4 r8

    %13
    R2.*11
    do'4 do8 do(re mi)
    fa4. r4 r8

    %26
    re4 re8 re(mi fa)
    sol4. r4 r8
    do sol mi do4.

    %29
    la' mi
    fa do~\mbreak
    do si

    %32
    do sol'8 do, sol'
    la do, la' sol do, sol'
    la do, la' sol do, sol'

    %35
    la4 re,8 re4.
    do r8 sol' fa
    mi (re do) la'4 do,8

    %38
    si4. do8 sol' mi
    fa do la si fa' re
    mi do sol do,4.\mbreak

    %41
    sol''8 fa mi sol fa mi
    re do si re do si
    fa' mi re fa mi re

    %44
    do si la la' sol la
    fa mi fa re4.~
    re8 si' re, do la' do,

    %47
    sib!4. ~sib8 sol' sib,
    la4. la'8 sol la
    re, mi fa sol fa sol

    %50
    mi re do\mbreak fa4.~
    fa8 mib re mib4.~
    mib8 re do re sib' re,

    %53
    do4 re8 do4.\tr
    sib r4 r8
    R2.

    %56
    r4 r8 r fa' re
    mib do sol la fa' do
    re4. r4 r8

    %59
    R2.
    r4 r8 r re sib
    do la mi\mbreak fad do' la

    %62
    sib4. r4 r8
    r4 r8 r r do'-!
    r r do-! r r sib-!

    %65
    r r sib-! r r la-!
    r r sol-! r r sol-!
    fa4. r8 do'(si)

    %68
    la (sol fa) re'4 fa,8
    mi4. fa
    R2.

    %71
    r4 r8 la (fa mi)\mbreak
    re(mi fa) sol(la sib)
    mi,(re do) sib'(la sol)

    %74
    la(sol fa) sib,(la sol)
    la(sol fa) sol4.
    fa-! sol-!

    %77
    la

}


IVvlIn = \relative do'' {

    r8 do' (sib)
    la (sol fa) re'4 fa,8
    mi4. fa8 do' (la)
    sib (sol re) mi sib'(sol)

    %4
    la fa do fa,4.
    la'8 fa(do) fa, fa'(la)
    sol (mi do) mi, do' sol'

    %7
    la,4. si\mbreak
    mi do
    la' re,

    %10
    si' mi,
    la re,
    do r4 r8

    %13
    R2.*11
    do4. r4 r8
    fa4. r4 r8

    %26
    re4. r4 r8
    sol4. r4 r8
    do4. do,

    %29
    la' mi
    fa do\parenthesize ~
    do si\mbreak

    %32
    do sol'
    la sol
    la sol

    %35
    la4 re,8 re4.\tr
    do r8 sol' fa
    mi (re do) la'4 do,8

    %38
    si4. do
    fa si,
    mi do,

    %41
    sol'' r4 r8
    re4. r4 r8
    fa4. r4 r8

    %44
    do4. la'\mbreak
    fa re~
    re do

    %47
    sib! r8 r sib
    la4. la'
    re, sol

    %50
    mi fa~
    fa mib~
    mib re

    %53
    do4 re8 do4.\tr
    sib r4 r8
    R2.

    %56
    r4 r8 r fa' re
    mib4. la,
    re r4 r8\mbreak

    %59
    R2.
    r4 r8 r re sib
    do4. fad,

    %62
    sib r4 r8
    R2.*4
    r4 r8 r do'(si)

    %68
    la (sol fa) re'4 fa,8
    mi4. fa
    R2.

    %71
    r4 r8 la (fa mi)\mbreak
    re(mi fa) sol(la sib)
    mi,(re do)  sib'4.

    %74
    la sib,\mbreak
    la sol
    fa-! sol-!

    %77
    do

}


IVvlIIn = \relative do'' {

    r8 la' (sib)
    do(sib la) sib4 la8
    sol4. la8 fa do'
    re4. sol,8 mi sib'

    %4
    la4. r4 r8
    do4. r4 r8
    do2.~

    %7
    do4. si
    do r4 sol8
    do,4. r4 la'8\mbreak

    %10
    re,4. r4 sol8
    do,4 la'8 re,4.
    do r4 r8

    %13
    R2.*11
    sol'4. mi8 fa sol
    la4. r4 r8

    %26
    fa4. fa8 sol la
    re,4. r4 r8
    R2.

    %29
    do4. sib
    la mi'
    fa r4 fa8

    %32
    mi sol mi do4.\mbreak
    la' mi
    fa do~

    %35
    do si
    do r8 mi fa
    sol(fa mi) fa4 mi8

    %38
    re4. mi8 do sol'
    la4. re,8(si fa')
    mi4. sol8(mi sol)

    %41
    do,4. mi
    r4 r8 re4.
    r4 r8 si4.

    %44
    r4 r8 do4.\mbreak
    re r4 la8
    sold4. la4 mi'8

    %47
    fa mi fa sol fa sol
    do,4. r4 r8
    la'4. re,

    %50
    mi do
    sib! sol'8 fa sol
    do,4. fa4 sol8

    %53
    la,4 sib8 sib4 la8
    sib4. r4 r8
    R2.

    %56
    r4 r8 r re sib\mbreak
    sol'4. do,8 sib la
    sib4. r4 r8

    %59
    R2.
    r4 r8 r sib sol
    mi'4. la,8 sol fad

    %62
    sol4. r4 r8
    R2.*4
    r4 r8 r la'(sib)

    %68
    do (sib la) sib4 la8
    sol4. la
    R2.

    %71
    r4 r8 fa4.~
    fa sol~
    sol\mbreak sol8 (fa mi)

    %74
    fa4. sol,8 (fa mi)
    do' (sib la) sol4.
    la-! sol-!

    %77
    fa

}



IVvcn = \relative do {

    r4 r8 fa4. sib
    do fa,
    sib, do

    %4
    fa fa'8 do la
    fa4. r4 r8
    mi4. r4 r8

    %7
    re4. sol,
    do mi
    fa fad

    %10
    sol mi
    fa?4 re8\mbreak sol4 sol,8
    \clef tenor\key fa\major do4. r8 do' sib

    %13
    la sol fa re'4 fa,8
    mi4. fa8 do' la
    sib sol re mi sib' sol

    %16
    la\clef bass\key fa\major fa do fa,4.
    \clef tenor\key fa\major la''8 sol fa do fa la
    sol fa mi do mi sol

    %19
    fa la, fa' fa si, fa'
    mi do mi\mbreak do mi, do'
    la fa la re la re

    %22
    si sol si do mi, do'
    la si do \clef bass\key fa\major \once\stemUp sol, do' si
    <do mi, sol, do,>4. r4 r8

    %25
    \clef tenor\key fa\major fa8 do fa mib la, mib'
    <<re4.\\sib>> r4 r8
    sol'8 si, sol' fa si, fa'

    %28
    mi?4. sol8 do, sol'\mbreak
    la do, la' sol do, sol'
    la do, la' sol do, sol'

    %31
    la4 re,8 re4.\tr
    do r4 r8
    \clef bass\key fa\major fa,4.\p do

    %34
    fa do
    fa sol
    do, r4 r8

    %37
    do4. fa
    sol do,
    fa, sol

    %40
    do r4 r8\mbreak
    do4. r4 r8
    sol'4. r4 r8

    %43
    sold4. r4 r8
    la4. la,
    re fa

    %46
    mi la
    re, mi
    fa la

    %49
    sib si
    do la
    sol do

    %52
    la sib
    fa fa,
    sib\mbreak \clef tenor\key fa\major r8 fa'' mib

    %55
    re do sib sol'4 sib,8
    la4. sib
    mib, fa

    %58
    sib, r8 re' do
    sib la sol mib'4 sol,8
    fad4. sol

    %61
    \clef bass\key fa\major do,4. fad?
    sol8 re sib \clef tenor\key fa\major r8 sol''(fa)
    mib?(do) sol' fa(la,) fa'\mbreak

    %64
    re(sib) re mib(sol,) mib'
    do(la) do re(la) re
    sib(sol) sib do(mi,) do'

    %67
    la\clef bass\key fa\major fa re fa,4.
    fa' sib
    do\clef tenor\key fa\major r8 do(la)

    %70
    sib(sol re) mi(do' sib)
    la\clef bass\key fa\major  fa do fa,4.
    sib sol

    %73
    do do'
    fa, sib,
    fa do'

    %76
    fa-! do-!
    fa,

}

IVbcn = \relative do {

    r4 r8 fa4. sib
    do fa,
    sib, do

    %4
    fa fa'8 do la
    fa4. r4 r8
    mi4. r4 r8

    %7
    re4. sol,
    do mi
    fa fad

    %10
    sol mi
    fa?4 re8 sol4 sol,8
    do4. r4 r8

    %13
    fa4. sib
    do fa,
    sib, do

    %16
    fa fa8 do la
    fa4. r4 r8
    mi'4. r4 r8

    %19
    re4. sol,
    do mi
    fa fad

    %22
    sol mi
    fa4 re8 sol4 sol,8
    do4. sib\mbreak

    %25
    la fa
    sib r4 r8
    si4. sol

    %28
    do mi
    fa do
    fa do

    %31
    fa sol
    do, mi
    fa do

    %34
    fa do
    fa sol
    do, r4 r8

    %37
    do4. fa
    sol do,
    fa, sol

    %40
    do r4 r8\mbreak
    do4. r4 r8
    sol'4. r4 r8

    %43
    sold4. r4 r8
    la4. la,
    re fa

    %46
    mi la
    re, mi
    fa la

    %49
    sib si
    do la
    sol do

    %52
    la sib
    fa fa,
    sib r4 r8

    %55
    sib4. mib
    fa sib,
    mib fa

    %58
    sib, r4 r8
    sol'4. do,
    re sol,

    %61
    do re
    sol8 re sib sol4.
    do4 do'8 la4.

    %64
    sib sol
    la fad\mbreak
    sol mi!

    %67
    fa? r4 r8
    fa4. sib
    do fa,

    %70
    sib, do
    fa fa,
    sib sol

    %73
    do do'
    fa, sib,
    fa do'

    %76
    fa-! do-!
    fa,

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    s <3+>
    s2.*22
    s4. <6  4>
    s2.*13
    <_!>2.
    s4. <_!>
    s2.*2
    <_!>2.
    <7->
    s
    s
    <_+>
    <6- 5>
    s2.*3
    <7>4. <3->
    <5-> s
    s2.*6
    s4. <_->
    s2.
    <_->
    s
    <_->

}


forma = {

    \time 6/8
    \tempo 2. = 60
    \key fa\major
    \partial 4. s4.
    s2.*35
    s4.
    \bar ":..:"\break
    s
    s2.*40
    s4.
    \bar ":|."

}

IVvlc = {
    \IVglobal
    <<\IVvlcn \forma>>

}

IVvlI = {
    \IVglobal
    <<\IVvlIn \forma>>

}

IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>

}

IVvc = {
    \IVglobal
    \clef bass
    <<\IVvcn \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma\IVbfn>>

}
#(set-global-staff-size 16.5)


\pointAndClickOn

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Concerto in Fa maggiore per Violino e Violoncello}
    composer = \markup \center-column{"G. Bononcini (1670 - 1747)"}

}

\markup \huge {[1.] Adagio}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Concert[ato]"}
            \set Staff.shortInstrumentName = "vlc"
            \Ivlc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Violoncello""Concertato"}
            \set Staff.shortInstrumentName = "vc "
            \Ivc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""P.[ri]mo"}
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino 2.do"}
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.shortInstrumentName = "bc "
            \Ibc
        >>
    >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
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

\markup \huge {[2.] Allegro}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Concert[ato]"}
            \set Staff.shortInstrumentName = "vlc"
            \IIvlc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Violoncello""Concertato"}
            \set Staff.shortInstrumentName = "vc "
            \IIvc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""P.[ri]mo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino 2.do"}
            \set Staff.shortInstrumentName = "vl2"
            \IIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.shortInstrumentName = "bc "
            \IIbc
        >>
    >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
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

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Concert[ato]"}
            \set Staff.shortInstrumentName = "vlc"
            \IIIvlc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Violoncello""Concertato"}
            \set Staff.shortInstrumentName = "vc "
            \IIIvc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""P.[ri]mo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIIvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino 2.do"}
            \set Staff.shortInstrumentName = "vl2"
            \IIIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.shortInstrumentName = "bc "
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
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

\markup \huge {[4.] Gigue}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Concert[ato]"}
            \set Staff.shortInstrumentName = "vlc"
            \IVvlc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Violoncello""Concertato"}
            \set Staff.shortInstrumentName = "vc "
            \IVvc
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""P.[ri]mo"}
            \set Staff.shortInstrumentName = "vl1"
            \IVvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino 2.do"}
            \set Staff.shortInstrumentName = "vl2"
            \IVvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.shortInstrumentName = "bc "
            \IVbc
        >>
    >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
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

