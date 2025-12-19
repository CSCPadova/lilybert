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

    sib32( do re mib fa16) [sib, fa' sib,]
    fa32(sol la sib do16)[fa, do' fa,]
    sib32( do re mib fa16) [sib, fa' sib,]

    %4
    fa32(sol la sib do16)[fa, do' fa,]
    sib32( do re mib fa16) [sib, fa' sib,]\mbreak
    \grace sib8 la16 \tr sol fa8 r

    %7
    sib32( do re mib fa16) [sib, fa' sib,]
    mib,32(fa sol lab sib16)[mib, sib' mib,]
    do'32(re mib fa sol16)[do, sol' do,]

    %10
    fa,32(sol la sib do16)[fa, do' fa,]
    re'32(mi fa sol la16)[re, la' re,]
    sol,32(la sib do re16)[sol, re' sol,]\mbreak

    %13
    mib'32(fa sol la sib16)[sib, sib' sib,]
    la\p fa do'8. la16
    sib16 fa re'8. sib16

    %16
    do fa, mib'8. do16
    re fa, fa'8. re16
    do fa, mib'8. do16

    %19
    re\f fa sib re, do la'
    sib4 r8
    sib,32( do re mib fa16) [sib, fa' sib,]

    %22
    fa32(sol la sib do16)[fa, do' fa,]\mbreak
    sib32( do re mib fa16) [sib, fa' sib,]
    la16 \tr sol fa8 r

    %25
    do'32(re mib fa sol16) [do, sol' do,]
    sol32(la si do re16)[sol, re' sol,]
    do32(re mib fa sol16)[do, sol' do,]

    %28
    si\tr la sol8 r
    re'32(mi fa sol la16)[re, la' re,]
    la32\parentSlur (si dod re mi16)[la, mi' la,]  %%% fine 4to sistema

    %31
    re32(mi fa sol la16)[re, la' re,]
    dod\tr si la8 r
    re32(mi fa sol la16)[re, la' re,]

    %34
    sib'8(sol mi)
    do32(re mi fa sol16)[do, sol' do,]
    la'8(fa re)

    %37
    sib32( do re mi fa16) [sib, fa' sib,]
    sol'8(mi re)\mbreak
    dod16 \p la mi'8. dod16

    %40
    re la fa'8. re16
    mi la, sol'8. mi16
    fa la, la'8. fa16

    %43
    mi\f(dod re) fa, mi[dod']
    re32(mi fa sol la16)[re, la' re,]
    re32(mi fad sol la16) [do,? la' do,]\mbreak

    %46
    sol32(la sib do re16)[sol, re' sol,]
    sol32(la si do re16)[fa, re' fa,]
    do'32(re mib? fa sol16)[do, sol' do,]

    %49
    do32(re mi fa sol16)[sib,? sol' sib,]
    fa32(sol la sib do16)[fa, do' fa,]
    fa32(sol la sib do16)[mib,! do' mib,]\mbreak

    %52
    sib'32(do re mib fa16)[sib, fa' sib,]
    si32(do re mib fa16)[re fa re]
    do32(re mib fa sol16)[do, sol' do,]

    %55
    lab' sol fa mib re do
    si sol re'8.\p si16
    do sol mib'8. do16

    %58
    re sol, fa'8. re16
    mib\f do mib,[do' re, si']\mbreak
    do32(re mib fa sol16)[do, sol' do,]

    %61
    lab'8(fa re)
    sib32(do re mib fa16)[sib, fa' sib,]
    sol'8(mib do)

    %64
    la!32(sib do re mib16)[la, mib' la,]
    fad'8(re do)
    sib16 re do sib la sol

    %67
    re32(mi fad sol la16) [re, la' re,]\mbreak
    sol32(la sib do re16) [sol, re' sol,]
    re32(mi? fad sol la16) [re, la' re,]

    %70
    sol32(la sib do re16) [sol, re' sol,]
    re'32(mi fad sol la16)[do, la' do,]
    sib re sol sib, la fad'

    %73
    sol4 r8\mbreak
    sib,32(do re mib fa16)[sib, fa' sib,]
    fa32(sol la sib do16) [fa, do' fa,]

    %76
    sib32(do re mib fa16) [sib, fa' sib,]
    la\tr sol fa8 r
    sib32(do re mib) fa16 [sol lab8]

    %79
    sol16 mib sib[sol mib8]\mbreak
    do'32(re mi fa) sol16 [la sib8]
    la16 fa do la fa r

    %82
    re'32(mi fad sol) la16[sib do8]
    sib16 sol re sib sol r
    fa?32(sol la sib do16) [fa, do' fa,]

    %85
    fa'8\p(mib re)\mbreak
    fa,32\f(sol la sib do16) [fa, do' fa,]
    mib'8\p(re do)

    %88
    fa,32\f(sol la sib do16) [fa, do' fa,]
    re'8\p( do sib)
    sib'16\f re, do sib' do, la'

    %91
    sib,32(do re mib fa16) [sib, fa' sib,]
    fa32(sol la sib do16) [fa, do' fa,]\mbreak
    sib32(do re mib fa16) [sib, fa' sib,]

    %94
    sib' re, do sib' do, la'
    sib4 r8

}

IvlIIn = \relative do'' {

    sib32( do re mib fa16) [sib, fa' sib,]
    fa32(sol la sib do16)[fa, do' fa,]
    sib32( do re mib fa16) [sib, fa' sib,]

    %4
    fa32(sol la sib do16)[fa, do' fa,]
    sib32( do re mib fa16) [sib, fa' sib,]\mbreak
    \grace sib8 la16 \tr sol fa8 r

    %7
    sib32( do re mib fa16) [sib, fa' sib,]
    mib,32(fa sol lab sib16)[mib, sib' mib,]
    do'32(re mib fa sol16)[do, sol' do,]

    %10
    fa,32(sol la sib do16)[fa, do' fa,]
    re'32(mi fa sol la16)[re, la' re,]
    sol,32(la sib do re16)[sol, re' sol,]\mbreak

    %13
    mib'32(fa sol la sib16)[sib, sib' sib,]
    la\p fa la8. fa16
    fa re sib'8. fa16

    %16
    la fa do'8. la16
    sib fa re'8. sib16
    la fa do'8. la16

    %19
    re\f fa sib re, do la'
    sib4 r8
    sib,32( do re mib fa16) [sib, fa' sib,]

    %22
    fa32(sol la sib do16)[fa, do' fa,]\mbreak
    sib32( do re mib fa16) [sib, fa' sib,]
    la16 \tr sol fa8 r

    %25
    do'32(re mib fa sol16) [do, sol' do,]
    sol32(la si do re16)[sol, re' sol,]
    do32(re mib fa sol16)[do, sol' do,]

    %28
    si\tr la sol8 r
    re'32(mi fa sol la16)[re, la' re,]
    la32\parentSlur (si dod re mi16)[la, mi' la,]  %%% fine 4to sistema

    %31
    re32(mi fa sol la16)[re, la' re,]
    dod\tr si la8 r
    re32(mi fa sol la16)[re, la' re,]

    %34
    sol,32(la sib do re16)[sol, re' sol,]
    sol'8(mi do)
    fa,32(sol la sib do16)[fa, do' fa,]

    %37
    fa'8(re sib)
    mi,32(fa sol la sib16)[mi, sib' mi,]\mbreak
    mi'\p la, dod8. la16

    %40
    la fa re'8. la16
    dod la mi'8. dod16
    re la fa'8. re16

    %43
    dod\f la re fa, mi[dod']
    re32(mi fa sol la16)[re, la' re,]
    re32(mi fad sol la16) [do,? la' do,]\mbreak

    %46
    sol32(la sib do re16)[sol, re' sol,]
    sol32(la si do re16)[fa, re' fa,]
    do'32(re mib? fa sol16)[do, sol' do,]

    %49
    do32(re mi fa sol16)[sib,? sol' sib,]
    fa32(sol la sib do16)[fa, do' fa,]
    fa32(sol la sib do16)[mib,! do' mib,]\mbreak

    %52
    sib'32(do re mib fa16)[sib, fa' sib,]
    si32(do re mib fa16)[si, fa' si,]
    do32(re mib fa sol16)[do, sol' do,]

    %55
    lab' sol fa mib re do
    si sol si8.\p sol16
    sol mib do'8. sol16

    %58
    si sol re'8. si16
    do\f do mib, do' re, si'
    do32(re mib fa sol16)[do, sol' do,]

    %61
    lab'8(fa re)
    sib32(do re mib fa16)[sib, fa' sib,]
    sol'8(mib do)

    %64
    la!32(sib do re mib16)[la, mib' la,]
    fad'8(re do)
    sib16 re do sib la sol

    %67
    re32(mi fad sol la16) [re, la' re,]\mbreak
    sol32(la sib do re16) [sol, re' sol,]
    re32(mi? fad sol la16) [re, la' re,]

    %70
    sol32(la sib do re16) [sol, re' sol,]
    re'32(mi fad sol la16)[do, la' do,]
    sib re sol sib, la fad'

    %73
    sol4 r8\mbreak
    sib,32(do re mib fa16)[sib, fa' sib,]
    fa32(sol la sib do16) [fa, do' fa,]

    %76
    sib32(do re mib fa16) [sib, fa' sib,]
    la\tr sol fa8 r
    sib32(do re mib) fa16 [sol lab8]

    %79
    sol16 mib sib[sol mib8]\mbreak
    do'32(re mi fa) sol16 [la sib8]
    la16 fa do la fa r

    %82
    re'32(mi fad sol) la16[sib do8]
    sib16 sol re sib sol r
    fa?32(sol la sib do16) [fa, do' fa,]

    %85
    re'8\p(do sib)
    fa32\f(sol la sib do16) [fa, do' fa,]
    do'8\p(sib la)

    %88
    fa32\f(sol la sib do16) [fa, do' fa,]
    fa'8\p(mib re)
    sib'16\f re, do sib' do, la'

    %91
    sib,32(do re mib fa16) [sib, fa' sib,]
    fa32(sol la sib do16) [fa, do' fa,]\mbreak
    sib32(do re mib fa16) [sib, fa' sib,]

    %94
    sib' re, do sib' do, la'
    sib4 r8

}

Ivlan = \relative do' {

    re8 re re
    do do do
    re re re

    %4
    do do do
    re re re
    do do do

    %7
    fa, fa fa\mbreak
    sol sol sol
    sol sol sol

    %10
    la la la
    la la la
    sib sib sib

    %13
    sib sib sib
    do\p fa fa
    fa fa fa

    %16
    fa fa fa
    fa fa fa\mbreak
    fa fa fa

    %19
    fa\f fa fa
    re4 r8
    re8 re re

    %22
    do do do
    re re re
    do do do

    %25
    sol' sol sol
    re re re
    mib mib mib\mbreak

    %28
    re re re
    la' la la
    mi mi mi

    %31
    fa fa fa
    mi mi mi
    fa fa fa

    %34
    re sib sib
    do do mi
    do do do

    %37
    re re re\mbreak
    sol, sol sib
    la\p la la

    %40
    la la la
    la la la
    la la la

    %43
    la\f la la
    fa' fa fa
    la la la

    %46
    re, re re
    si si si\mbreak
    sol sol sol

    %49
    sol' sol mi
    do do la
    la la la

    %52
    re re re
    re re si
    sol sol mib'

    %55
    do do lab'
    re, sol,\p sol
    sol sol sol\mbreak

    %58
    sol sol sol
    sol\f sol sol
    mib' mib mib

    %61
    do do fa
    re re re
    sib sib mib

    %64
    do do do
    la la' la
    re, re mi

    %67
    la, fad' fad\mbreak
    sol sib, sib
    la fad' fad

    %70
    sol sib, sib
    la fad' fad
    sol re re

    %73
    sib4 r8
    re re re
    do do do

    %76
    re re re
    do do do\mbreak
    fa fa fa

    %79
    sib, sib sib
    sol' sol sol
    do, do do

    %82
    la' la la
    re, re re
    do fa fa

    %85
    fa\p fa fa
    fa\f fa fa
    fa\p fa fa\mbreak

    %88
    fa\f fa fa
    fa\p fa fa
    fa\f fa fa

    %91
    re re re
    do do do
    re re re

    %94
    re fa fa
    re4.

}


Ibcn = \relative do {

    sib8 sib sib
    la la la
    sib sib sib

    %4
    la la la
    sib sib sib
    fa' fa mib

    %7
    re re re
    mib mib mib\mbreak
    mib mib mib

    %10
    fa fa fa
    fa fa fa
    sol sol sol

    %13
    sol sol sol
    fa\p fa fa
    fa fa fa

    %16
    fa fa fa
    fa fa fa
    fa fa fa\mbreak

    %19
    sib,\f fa' fa,
    sib4 r8
    sib8 sib sib

    %22
    la la la
    sib sib sib
    fa' fa fa

    %25
    mib mib mib
    si si si
    do do do\mbreak

    %28
    sol' sol sol
    fa fa fa
    dod dod dod

    %31
    re re re
    la' la la
    fa fa fa

    %34
    sol sol sol
    mi mi mi
    fa fa fa\mbreak

    %37
    re re re
    mi sol, sol
    la\p la la

    %40
    la la la
    la la la
    la la la

    %43
    la\f la' la,
    re re re
    fad fad fad\mbreak

    %46
    sol sol sol
    sol sol sol
    do, do do

    %49
    do do do
    fa fa fa
    fa fa fa

    %52
    sib, sib sib
    sol sol sol
    mib' mib mib

    %55
    fa fa fa\mbreak
    sol,\p sol sol
    sol sol sol

    %58
    sol sol sol
    do\f sol' sol,
    do do do

    %61
    fa fa fa
    re re re
    mib mib mib

    %64
    do do do
    re fad fad\mbreak
    sol sol dod,

    %67
    re re re
    re re re
    re re re

    %70
    re re re
    re re re
    re re re

    %73
    sol,4 r8
    sib sib sib
    la la la\mbreak

    %76
    sib sib sib
    fa' fa fa
    re re re

    %79
    mib mib mib
    mi mi mi
    fa fa fa

    %82
    fad fad fad
    sol sol sol
    la, fa'? fa

    %85
    fa\p fa fa\mbreak
    fa\f fa fa
    fa\p fa fa

    %88
    fa\f fa fa
    sib,\p sib sib
    sib\f fa' fa,

    %91
    sib sib sib
    la la la
    sib sib sib

    %94
    sib fa' fa,
    sib4.

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \key sib\major
    \tempo 4. = 50
    s4.*95
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

    fa8\f si,16.\p do32 re8 si mib\f mib,16.\p fa32 sol8 mib
    mib'\f la,16.\p sib32 do8 la re\f re,16.\p mib32 fa8 re
    mi'\f mi,16.\p fa32 sol8 mi\mbreak fa'\f fa,16.\p sol32 la8 fa
    fa'\f sold,16.\p la32 si8 sold mi'\f do,16.\p re32 mi8 do
    mib'!\f fad,16.\p sol32 la8 fad re'\f sib,16.\p do32 re8 sib
    fa''\f fa fa fa mib mib,16.\p fa32 sol8 mib16. fa32\mbreak
    sol4 mib'\f mib2\tr
    re1\fermata

}

IIvlIIn = \relative do'' {

    re8\f sol,16.\p la32 si8 sol do\f do,16.\p re32 mib8 do
    do'\f  fa,16.\p sol32 la8 fa sib\f sib,16.\p do32 re8 sib
    dod'\f dod,16.\p re32 mi8 dod\mbreak re'8\f re,16.\p mi32 fa8 re
    re'\f mi,16.\p fa32 sold8 mi do'\f la,16.\p si32 do8 la
    do'\f re,16.\p mi32 fad8 re sib'\f sol,16.\p la32 sib8 sol
    re''\f re re re\mbreak do do,16.\p re32 mib8 do16. re32
    mib4 do'\f do2\tr
    si1\fermopz

}

IIvlan = \relative do' {

    si'4 \f r sol r
    la r fa r
    la r la r
    si r mi, r
    la r re, r\mbreak
    si'8 si si si sol4 r
    do, sol' la2
    re,1\fermata

}


IIbcn = \relative do {

    sol4\f r do r
    fa, r sib r
    la r re r
    sold, r la r
    fad r sol? r\mbreak
    sol8 sol sol sol do4 r
    do do fad,2
    sol1

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 40
    s1*8
    \bar"||"

}



IIvlI = {
    \global
    %\notypeset
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

    re8 sib re mib re do re sib re mib re do
    re sib re fa re fa sib fa sib fa mib re
    do4.\tr r do8 la do re do sib

    %4
    do la do re do sib\mbreak do do sib la sol fa
    re' si re mib re do re si re mib re do
    re re do si la sol mi' dod mi fa mi re

    %7
    mi dod mi fa mi re mi mi re dod si la\mbreak
    fa' re fa sib fa sib sib sol fa mi re do
    mi do mi la mi la la fa mi re do sib

    %10
    re sib re sol re sol sol mi re dod si la
    fa' re fa mi dod mi fa re fa mi dod mi\mbreak
    re4. r fa8 re fa sol fa mi

    %13
    fa re fa sol fa mi fa re fa la fa la
    re la re la sol fa mi4.\tr r8 r mi
    la mi la mi dod mi fa re fa la fa la\mbreak

    %16
    sol re sol re si re mib! do mib sol mib sol
    fa do fa do la do re sib re fa re fa
    sol re sol re si re mib re do re do si

    %19
    do4. r sol'8 mi sol lab sol fa\mbreak
    sol mib sol lab sol fa sol mib sol mib do mib
    re sib! re sol re sol fad re fad la fad la

    %22
    sib, sol sib do sib la sib sol sib do sib la\mbreak
    sib re sol la, re fad sol4. r
    re8 sib re mib re do re sib re mib re do

    %25
    re sib re fa re fa sib fa sib fa mib re
    do4.\tr r8 r fa,\mbreak sib fa sib re sib re
    sol, sib lab sol fa mib do' sol do mib do mib

    %28
    la,! do sib la sol fa re' la re fad re fad
    sib, re do sib la sol\mbreak mib' sib mib sol mib sol
    la, do sib la sol fa re' fa, mib re do sib

    %31
    la' do sib la sol fa re' fa, mib re do sib
    re' fa sib re, fa sib\mbreak do, fa sib do, fa la
    re, sib re mib re do re sib re mib re do

    %34
    re fa sib do, fa la sib2\fermopz r4

}

IIIvlIIn = \relative do'' {

    sib8 fa sib do sib la sib fa sib do sib la
    sib fa sib re sib re fa re fa re do sib
    do4.\tr r\mbreak la8 fa la sib la sol

    %4
    la fa la sib la sol la do sib la sol fa
    si sol si do si la si sol si do si la
    si re do si la sol\mbreak dod la dod re dod si

    %7
    dod la dod re dod si? dod mi re dod si! la
    fa' re fa sib fa sib sib sol fa mi re do
    mi do mi la mi la\mbreak la fa mi re do sib

    %10
    re sib re sol re sol sol mi re dod si la
    re la re dod la dod re la re dod la dod
    re4. r re8 la re mi re dod\mbreak

    %13
    re la re mi re dod re la re fa re fa
    la fa la fa mi re dod4.\tr r8 r dod
    mi dod mi dod la dod re la re fa re fa

    %16
    re si re si sol si\mbreak do sol do mib! do mib
    do la do la fa la sib fa sib re sib re
    re si re si sol si do re mib si do re

    %19
    mib4. r mib8 do mib fa mib re\mbreak
    mib do mib fa mib re  mib do mib do sol do
    sib! sol sib re sib re re la re fad re fad

    %22
    sol, re sol la sol fad sol re sol la sol fad
    sol sib re fad, la re\mbreak sib4. r
    sib8 fa sib do sib la sib fa sib do sib la

    %25
    sib fa sib re sib re fa re fa re do sib
    la4.\tr r8 r fa fa re fa sib fa sib\mbreak
    mib,! sib' lab sol fa mib sol mib sol do sol do

    %28
    fa, do' sib la! sol fa la fad la re la re
    sol, re' do sib la sol sib sol sib mib sib mib
    fa, do' sib la sol fa\mbreak re' fa, mib re do sib

    %31
    fa' do' sib la sol fa re' fa, mib re do sib
    sib' re fa sib, re fa sib, do fa la, do fa
    fa fa, sib do sib la sib fa sib do sib la\mbreak

    %34
    sib re fa la, do fa re2\fermata r4

}

IIIvlan = \relative do' {

    fa4 fa8 sol4 la8 fa4 fa8 sol4 la8
    fa4. fa fa fa4 sol8
    do,4. r fa fa4 sol8

    %4
    fa4. fa4 sol8\mbreak fa do' sib la sol fa
    sol4. sol4 la8 sol4. sol4 la8
    sol re' do si la sol la4. la4 si8

    %7
    la4. la4 si8 la mi' re dod si la\mbreak
    sib?4. fa mi mi
    la mi re re

    %10
    sol re dod dod
    la la' la la
    la r\mbreak la sib4 dod,8

    %13
    la4. sib'4 dod,8 la4. re
    fa la la r8 r la
    dod4. la la la

    %16
    si si\mbreak sol sol
    la la fa fa
    re sol sol sol

    %19
    sol r sol fa4 do'!8
    sol4. fa4 lab8 sol4. sol\mbreak
    sol sol la fad

    %22
    re re4 fad8 re4. mib!4 fad8
    re4. re re r
    fa sol4 la8 fa4. sol4 la8\mbreak

    %25
    fa4. fa fa fa
    fa r re re
    mib8 sib' lab sol fa mib mib4. mib

    %28
    fa8 do' sib la? sol fa fad4. fad
    sol8 re' do sib la sol sol4. sol\mbreak
    fa8 do' sib la sol fa sib fa mib re do sib

    %31
    fa' do' sib la sol fa sib fa mib re do sib
    fa'4. fa fa fa
    fa sol4 la8 fa4. sol4 la8

    %34
    fa4. fa fa2\fermata r4

}


IIIbcn = \relative do {

    sib4 sib'8 mib,4 fa8 sib,4 sib'8 mib,4 fa8
    sib,4 sib'8 sib,4 sib'8 sib,4 sib'8 sib,4 mi8
    fa do' sib la sol fa\mbreak fa4 fa8 sib4 sib,8

    %4
    fa4 fa'8 sib4 sib,8 fa' do' sib la sol fa
    sol,4 sol'8 do4 do,8 sol4 sol'8 do4 do,8
    \once\stemUp sol re'' do si la sol la,4 la'8 re4 re,8\mbreak

    %7
    la4 la'8 re4 re,8 \once\stemUp la mi'' re dod si? la
    re,4. re do do
    do do sib sib

    %10
    sib sib la la\mbreak
    re4 re'8 la4 la,8 re4 re'8 la4 la,8
    re sol fa mi re dod re4 re'8 sol,4 la8

    %13
    re,4 re'8 sol,4 la8 re,4. re
    re re\mbreak la8 mi' re dod sib la
    la4. la re re

    %16
    si sol do do
    la fa sib sib
    si sol\mbreak do sol

    %19
    do8 sol' fa mib re do do4 do'8 fa,4 sol8
    do,4 do'8 fa,4 sol8 do,4. do
    sol' sol re re

    %22
    sol,4 sol'8 do,4 re8\mbreak sol,4 sol'8 do,4 re8
    sol,4. re' sol, r
    sib4 sib'8 mib,4 fa8 sib,4 sib'8 mib,4 fa8

    %25
    sib,4. sib sib sib
    fa'8 do' sib la sol fa\mbreak re4. re
    mib8 sib' lab sol fa mib mib4. mib

    %28
    fa8 do' sib la? sol fa fad4. fad
    sol8 re' do sib la sol sol4. sol\mbreak
    fa8 do' sib la sol fa sib fa mib re do sib

    %31
    fa' do' sib la sol fa sib fa mib re do sib
    sib4. sib fa' fa,
    sib4 sib'8 mib,4 fa8\mbreak sib,4 sib'8 mib,4 fa8

    %34
    sib,4. fa' sib,2\fermopz r4

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 12/8
    \key sib\major
    \tempo 2. = 68
    s1.*34
    \bar"|."

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

    do16 do mi mi sol sol mi mi do  do mi mi sol sol mi mi
    sol, sol si si re re si si sol sol si si re re si si
    do, do mi mi sol sol mi mi do do mi mi sol sol mi mi\mbreak

    %4
    sol, sol' re si sol sol' re si sol4 r
    do'16 do mi mi sol sol mi mi do  do mi mi sol sol mi mi
    sib sib mi mi sol sol mi mi sib sib mi mi sol sol mi mi

    %7
    fa do la do fa do la do fa do la do fa do la do\mbreak
    re re fad fad la la fad fad re re fad fad la la fad fad
    do do fad fad la la fad fad do do fad fad la la fad fad

    %10
    sol re si re sol re si re sol re si re sol re si re
    do sol mi sol do sol mi sol do sol mi sol do sol mi sol\mbreak
    re' si sol si re si sol si re si sol si re si sol si

    %13
    mi do sol do mi do sol do mi do sol do mi do sol do
    fa fa re re si si sol sol fa' fa re re si si sol sol
    sol, sol sol' sol re re si si sol4 r16 fa'' mi re\mbreak

    %16
    mi8 do re si do8 do, r4
    la'16 la do do mi mi do do la la do do mi mi do do
    mi, mi sold sold si si sold sold mi mi sold sold si si sold sold

    %19
    la, la do do mi mi do do la la do do mi mi do do\mbreak
    mi mi' si sold mi mi' si sold mi4 r
    mi'8\p dod(si la) fa' fa,(mi re)

    %22
    re' si(la sol) mi' mi,(re do)
    do' la(sol fa)  \once\stemDown re' si,(la sold)
    re''16(mi fa4) mi16(re) re(mi fa4) mi16(re)\mbreak

    %25
    dod16\f la dod la re la re la mi' la, mi' la, fa' la, fa' la,
    sol'8 fa16 mi fa8 re fa4 mi\tr
    fa16(sol la sol) fa \parentSlur (mi re do) re(mi fa mi) re \parentSlur (do si la)

    %28
    si sol si sol do sol do sol re' sol, re' sol, mi' sol, mi' sol,
    fa'8 mi16 re mi8 re mi4 re\tr \mbreak
    do16 do mi mi sol sol mi mi do  do mi mi sol sol mi mi

    %31
    sol, sol si si re re si si sol sol si si re re si si
    do, do mi mi sol sol mi mi do do mi mi sol sol mi mi\mbreak
    sol, sol' re si sol sol' re si sol4 r

    %34
    do'16 do mi mi sol sol mi mi do  do mi mi sol sol mi mi
    sib sib mi mi sol sol mi mi sib sib mi mi sol sol mi mi
    fa do la do fa do la do fa do la do fa do la do\mbreak

    %37
    re re fad fad la la fad fad re re fad fad la la fad fad
    do do fad fad la la fad fad do do fad fad la la fad fad
    sol re si re sol re si re sol re si re sol re si re

    %40
    \once\stemUp sol,,8 sol'' sol do, lab'8. sol16 fa mib re do
    re8 fa fa sib, sol' fa mib16 re do sib
    do8 mib mib lab, fa' mib re16 do si! la\mbreak

    %43
    sol,(re' si' re) sol,,(re' si' re) sol,,(mi' do' mi) sol,,(mi' do' mi)
    sol,,(re' si' re) sol,,(re' si' re) sol,,(mi' do' mi) sol,,(mi' do' mi)
    sol,,4 r8 mib''16 \parentSlur (fa) sol8-.(sol-. sol-. sol-.)

    %46
    fa-.(fa-.fa-. fa-. ) mib-.(mib-. mib-. mib-.)
    reb-.(reb-. reb-. reb-.) do-.(do-. do-. do-.)\mbreak
    si!16 sol fa mi! re do si la sol sol' fa mi re do si la

    %49
    sol4 r8 mib''16\p \parentSlur (fa) sol8-.(sol-. sol-. sol-.)
    fa-.(fa-.fa-. fa-. ) mib-.(mib-. mib-. mib-.)
    reb-.(reb-. reb-. reb-.) do-.(do-. do-. do-.)\mbreak

    %52
    si!16 sol fa mi! re do si la sol sol' fa mi re do si la
    sol4 r16 fa''\f mi re mi8 do re si
    do16 do si la sol fa mi re do do' si la sol fa mi re

    %55
    do do' si la sol fa mi re do4 r8 r16 mi\mbreak
    fa4 sol do,8 do' sol[mi]
    do1\fermopz

}

IVvlIIn = \relative do'' {

    do16 do mi mi sol sol mi mi do  do mi mi sol sol mi mi
    sol, sol si si re re si si sol sol si si re re si si
    do, do mi mi sol sol mi mi do do mi mi sol sol mi mi\mbreak

    %4
    sol, sol' re si sol sol' re si sol4 r
    mi''16 mi do do mi mi sol sol mi mi do do mi mi sol sol
    mi mi sib sib mi mi sol sol mi mi sib sib mi mi sol sol

    %7
    la fa do fa la fa do fa\mbreak la fa do fa la fa do fa
    fad fad re re fad fad la la fad fad re re fad fad la la
    fad fad do do fad fad la la fad fad do do fad fad la la

    %10
    si sol re sol si sol re sol si sol re sol si sol re sol\mbreak
    mi do sol mi' mi do sol do mi do sol do mi do sol do
    si sol re sol si sol re sol si sol re sol si sol re sol

    %13
    do sol mi sol do sol mi sol  do sol mi sol do sol mi sol
    re' re fa fa re re si si re re fa fa re re si si
    sol, sol sol' sol re re si si sol4 r16 re'' do si

    %16
    do8 mi fa re \once\stemDown mi do, r4
    la'16 la do do mi mi do do la la do do mi mi do do
    mi, mi sold sold si si sold sold mi mi sold sold si si sold sold

    %19
    la, la do do mi mi do do la la do do mi mi do do
    mi mi' si sold mi mi' si sold mi4 r
    mi'8\p dod(si la) fa' fa,(mi re)

    %22
    re' si(la sol) mi' mi,(re do)\mbreak
    do' la(sol fa) \once\stemDown re' si,(la sold)
    si'16(do re4) do16(si) si(do re4) do16\parentSlur(si)

    %25
    la4. la8\f dod16 la dod la re la re la
    mi'8 re16 dod re8 re re4 dod\tr
    re16(mi fa mi) re(do si la) si(do re do) si(la sol fa)\mbreak

    %28
    sol4. sol8 si16 sol si sol do sol do sol
    re'8 do16 si do8 do do4 si\tr
    do16 do mi mi sol sol mi mi do  do mi mi sol sol mi mi

    %31
    sol, sol si si re re si si sol sol si si re re si si
    do, do mi mi sol sol mi mi do do mi mi sol sol mi mi\mbreak
    sol, sol' re si sol sol' re si sol4 r

    %34
    mi''16 mi do do mi mi sol sol mi mi do do mi mi sol sol
    mi mi sib sib mi mi sol sol mi mi sib sib mi mi sol sol
    la fa do fa la fa do fa la fa do fa la fa do fa

    %37
    fad fad re re fad fad la la fad fad re re fad fad la la
    fad fad do do fad fad la la fad fad do do fad fad la la
    si sol re sol si sol re sol si sol re sol si sol re sol\mbreak

    %40
    sol,,4 r r8 do' do fa,
    re'8. do16 sib lab sol fa sol8 sib sib mib,
    do' sib lab16 sol fa mib fa8 lab lab fa

    %43
    sol,16(re' si' re) sol,,(re' si' re) sol,,(mi' do' mi) sol,,(mi' do' mi)
    sol,,(re' si' re) sol,,(re' si' re) sol,,(mi' do' mi) sol,,(mi' do' mi)
    sol,,4 r8 do'16 \parentSlur (re) mib2

    %46
    mib?4 re2 do4~
    do sib2 lab4
    sol16 sol fa mi! re do si la\mbreak sol sol' fa mi re do si la

    %49
    sol4 r8 do'16 (re) mib2
    mib?4 re2 do4~
    do sib2 lab4

    %52
    sol16 sol fa mi! re do si la\mbreak sol sol' fa mi re do si la
    sol4 r16 re''16\f do si do8 mi fa re\mbreak
    do16 do si la sol fa mi re do do' si la sol fa mi re

    %55
    do do' si la sol fa mi re do4 r8 r16 mi\mbreak
    fa4 sol do,8 do' sol[mi]
    do1\fermata

}

IVvlan = \relative do' {

    do8 mi sol mi do mi sol mi
    sol, si re si sol si re si
    do mi sol mi do mi sol mi

    %4
    sol, sol sol sol sol4 r
    sol'8 sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %7
    fa do do do do do do do
    re la' la la la la la la\mbreak
    la la la la la la la la

    %10
    sol re re re re re re re
    mi sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %13
    mi mi mi mi mi mi mi mi
    si si si si si si si si
    si si si si si4 r8 sol'

    %16
    sol sol sol fa mi4 r
    la,8 do mi do la do mi do\mbreak
    mi sold si sold mi sold si sold

    %19
    la, do mi do la do mi do
    mi mi mi mi mi4 r
    dod2 re

    %22
    si do?
    la si\mbreak
    si8 si si si si si si si

    %25
    mi la, la la la la la la
    la la la la la' sib la sol
    fa4 r fa r

    %28
    sol,8 sol sol sol\mbreak sol sol sol sol
    sol sol sol sol sol' la sol fa
    mi mi sol mi do mi sol mi

    %31
    sol, si re si sol si re si
    do mi sol mi do mi sol mi
    sol, sol sol sol\mbreak sol4 r

    %34
    sol'8 sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    fa do do do do do do do

    %37
    re la' la la la la la la
    la la la la la la la la
    sol re re re re re re re

    %40
    re4 mib2 lab,4~
    lab re2 sol,4~
    sol do2 fa,4\mbreak

    %43
    sol2~sol
    sol~sol
    sol4 r do'\upl sib\upl

    %46
    lab\upl sib\upl sol\upl lab\upl
    fa\upl sol\upl mib\upl fa\upl
    sol16 sol fa mi! re do si la sol sol' fa mi re do si la

    %49
    sol4 r do'\p\upl sib\upl
    lab\upl sib?\upl sol\upl lab\upl
    fa\upl sol\upl mib\upl fa\upl

    %52
    sol16 sol fa mi! re do si la sol sol' fa mi re do si la
    sol4 r8 sol'\f sol sol sol fa
    mi16do' si la sol fa mi re do do' si la sol fa mi re

    %55
    do do' si la sol fa mi re do4 r8 r16 mi\mbreak
    fa4 sol do,8 do' sol mi
    do1\fermata

}


IVbcn = \relative do {

    do8 mi sol mi do mi sol mi
    sol, si re si sol si re si
    do mi sol mi do mi sol mi

    %4
    sol, sol sol sol\mbreak sol4 r
    do'8 do, do do do' do, do do
    do' do, do do do' do, do do

    %7
    fa fa, fa fa fa' fa, fa fa
    re'' re, re re\mbreak re' re, re re
    re' re, re re re' re, re re

    %10
    sol sol, sol sol sol' sol, sol sol
    do' do, do do do' do, do do
    sol' sol, sol sol\mbreak sol' sol, sol sol

    %13
    do' do, do do do' do, do do
    sol' sol, sol sol sol' sol, sol sol
    sol' sol, sol sol sol4 r8 sol

    %16
    do do sol'[sol,] do4 r\mbreak
    la'8 do mi do la do mi do
    mi, sold si sold mi sold si sold

    %19
    la, do mi do la do mi do
    mi mi mi mi mi4 r
    la,2 re\mbreak

    %22
    sol, do
    fa, si
    sold8 sold sold sold sold sold sold sold

    %25
    la la la la la la la la
    la la re re la' sol la la,
    re4 r\mbreak re r

    %28
    sol,8 sol sol sol sol sol sol sol
    sol sol do do sol' fa sol sol,
    do mi sol mi do mi sol mi

    %31
    sol, si re si sol si re si\mbreak
    do mi sol mi do mi sol mi
    sol, sol sol sol sol4 r

    %34
    do'8 do, do do do' do, do do
    do' do, do do do' do, do do
    fa fa, fa fa fa' fa, fa fa\mbreak

    %37
    re'' re, re re re' re, re re
    re' re, re re re' re, re re
    sol sol, sol sol sol' sol, sol sol

    %40
    sol'4 mib fa8 fa fa fa
    sib, sib sib sib\mbreak mib mib mib mib
    lab, lab lab lab re re re re

    %43
    sol,2~sol~
    sol~sol~
    sol4 r r2

    %46
    R1*2
    r16 sol' fa mi re do si la sol sol' fa mi re do si la
    sol4 r r2

    %50
    R1*2
    r16 sol'\p fa mi re do si la sol sol' fa mi re do si la
    sol4 r8 sol\f do do sol'[sol,]\mbreak

    %54
    do16 do' si la sol fa mi re do do' si la sol fa mi re
    do do' si la sol fa mi re do4 r8 r16 mi
    fa4 sol do,8 do' sol mi\mbreak

    %57
    do1\fermopz

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 57
    s1*4
    \bar":|."
    s1*53
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

    sol8_\markup\italic"Sempre piano"
    do8-.[(do-. do-. do-.)]
    do16(re mib4) re16 (do)
    re16(mib fa4) mib16 (re)

    %4
    mib(do) re(si) do8 sol
    do8-.[(do-. do-. do-.)]
    do16(re mib4) re16 (do)

    %7
    fad16(sol la4) sol16 fad
    sol8 fa!16 mib re8 do
    sib la16 sol la8 fad

    %10
    sol4 r8 sol'
    sib8-.[(sib-. sib-. sib-.)]
    sib16(lab sol fa mi reb do sib)\mbreak

    %13
    lab(sol fa mi) fa8 fa'
    lab-.[(lab-. lab-. lab-.)]
    lab?16(sol fa mib? re? do sib lab)

    %16
    sol (fa mib re) \once\stemUp mib8 sol'
    lab16 sol (fad sol) sol fa (mi fa)
    fa mib! (re mib)\mbreak mib reb (do reb)

    %19
    reb? do (si do) do si (la! si)
    si lab'(sol fa sol8) fa
    mib[do re si]

    %22
    do4 r8 sol'\p
    lab16 sol(fad sol) sol(fa mi fa)\mbreak
    fa mib!(re mib) mib reb(do reb)

    %25
    reb do(si do) do si(la! si)
    si lab'(sol fa sol8) fa
    mib[(do re si)]

    %28
    do8\fermata do, r4

}

VvlIIn = \relative do'' {

    sol8
    do8-.[(do-. do-. do-.)]
    do16(re mib4) re16 (do)
    re16(mib fa4) mib16 (re)

    %4
    mib(do) re(si) do8 sol
    do8-.[(do-. do-. do-.)]
    do16(re mib4) re16 (do)

    %7
    fad16(sol la4) sol16 fad
    sol8 fa!16 mib re8 do
    sib la16 sol la8 fad

    %10
    sol4 r8 sol'
    sib8-.[(sib-. sib-. sib-.)]
    sib16(lab sol fa mi reb do sib)\mbreak

    %13
    lab(sol fa mi) fa8 fa'
    lab-.[(lab-. lab-. lab-.)]
    lab?16(sol fa mib? re? do sib lab)

    %16
    sol (fa mib re) \once\stemUp mib8 sol'
    lab16 sol (fad sol) sol fa (mi fa)
    fa mib! (re mib)\mbreak mib reb (do reb)

    %19
    reb? do (si do) do si (la! si)
    si lab'(sol fa sol8) fa
    mib[do re si]

    %22
    do4 r8 sol'\p
    lab16 sol(fad sol) sol(fa mi fa)\mbreak
    fa mib!(re mib) mib reb(do reb)

    %25
    reb do(si do) do si(la! si)
    si lab'(sol fa sol8) fa
    mib[(do re si)]

    %28
    do8\fermata do, r4

}

Vvlan = \relative do' {

    r8
    mib4. fa8
    sol[sol sol sol]
    re4 si'

    %4
    sol8.[fa16 mib8. fa16]
    mib4. fa8
    sol4 mib

    %7
    la,! la\mbreak
    re re
    re8[re mib re]

    %10
    re4\con \tuplet 3/2 { do8\parentSlur (sib la)  }
    sol4. fa'8
    mi4. do8

    %13
    do[sib lab sol]
    fa4. mib'8
    re4. sib8\mbreak

    %16
    sib[sib do re]
    mib_\upl [la,!_\upl re_\upl sol,_\upl]
    do\upl [fa\upl sib,\upl mib\upl]

    %19
    la,!_\upl [re_\upl sol,_\upl do_\upl]
    sol'4. re8
    mib[sol lab sol]

    %22
    sol8.[fa16 mib8 re]\mbreak
    mib\upl [la!\upl re,\upl sol\upl]
    do,\upl [fa\upl sib,\upl mib\upl]

    %25
    la,!_\upl [re_\upl sol,_\upl do_\upl]
    sol'4. re8
    mib[sol lab sol]

    %28
    sol2\fermata

}


Vbcn = \relative do {

    r8
    do4. re8
    mib4 do
    si sol

    %4
    do8.[re16 mib8. re16]
    do4. re8\mbreak
    mib4 do

    %7
    re do
    sib fad'
    sol8[sib, do re]

    %10
    sol4\con \tuplet 3/2 { lab8(sol fa) }
    mi4. re8
    do4. mi8

    %13
    fa8. sol16\mbreak fa8. mib!16
    re4. do8
    sib4. re8

    %16
    mib[fa sol sol,]
    do[re si do]
    la![sib? sol lab]

    %19
    fa[sol mib fa]
    sol4 si\mbreak
    do8[mib fa sol]

    %22
    do,[re mib si]
    do\p[re si do]
    la![sib? sol lab]

    %25
    fa[sol mib fa]
    sol4 si\mbreak
    do8 mib fa sol

    %28
    do,2\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/4
    \key sol\minor
    \tempo 4 = 43
    \partial 8 s8
    s2*9
    s4 \bar":..:" s
    s2*18
    \bar":|."

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
    \con \terzine
}

VIvlIn = \relative do'' {

    do16(mi sol8) do,
    la' sol4
    do,16(mi sol8) do,

    %4
    re do4
    \tuplet 3/2 { mi16(re do) } sol'8 [do,]
    \tuplet 3/2 { re16(do si)} sol'8[si,]

    %7
    \tuplet 3/2 { do16(si la) } fad'8[la]\mbreak
    si16 re, si' re, si' re,
    la' re, la' re, la' re,

    %10
    si' re, si' re, si' re,
    la' re, la' re, la' re,
    si'\p \parentSlur (do re8) do

    %13
    si16 \parentSlur (do re8) do
    si do la
    sol16\f sol fad mi re do\mbreak

    %16
    si mi re do si la
    sol8 re' re,
    sol,4 r8

    %19
    do'16(mi sol8) do,
    sib16(mi sol8) sib
    \tuplet 3/2 { sib?16( la sol) } la4

    %22
    re,16 (fad la8) re,
    do16(fad la8) do\mbreak
    \tuplet 3/2 { do16(si la) } si4

    %25
    mi,16 sol, mi' sol, mi' sol,
    re' sol, re' sol, re' sol,
    mi' sol, mi' sol, mi' sol,

    %28
    re' sol, re' sol, re' sol,
    mi'16\p \parentSlur (fa sol8) fa
    mi16 \parentSlur (fa sol8) fa

    %31
    mi fa re
    do16\f do si la sol fa
    mi la sol fa mi re

    %34
    do8 sol' sol,
    do16 mi fa sol la si
    do8 do, r

    %37
    mi' fa re
    do4 r8

}

VIvlIIn = \relative do'' {

    sol16(do mi8) fa
    fa mi4
    sol,16(do mi8) mi,

    %4
    fa mi4
    do'8 r \tuplet 3/2 { mi16(re do)}
    si8 r \tuplet 3/2 { re16 (do si) }\mbreak

    %7
    la8 r \tuplet 3/2 { do16(si la) }
    sol8 si sol
    la re la'

    %10
    sol si, sol
    la re la'
    sol16\p(la si8) la

    %13
    sol16(la si8) la
    sol la fad
    sol16\f sol fad? mi re do

    %16
    si mi re do si la
    sol8 re' re,
    sol,4 r8

    %19
    sol'16(do mi8) mi
    sol,16(sib mi8) fa
    \tuplet 3/2 { sol16(fa mi)} fa4

    %22
    la,16(re fad8) sol
    la,16(do fad8) sol\mbreak
    \tuplet 3/2 { la16( sol fad) } sol4

    %25
    mi,8 sol mi
    re sol si
    do mi, do

    %28
    re sol re'
    do16\p(re mi8) re
    do16(re mi8) re8

    %31
    do re si
    do16\f do si la sol fa\mbreak
    mi la sol fa mi re

    %34
    do8 sol' sol,
    do16 mi fa sol la si
    do8 do, r

    %37
    do' re si
    do4 r8

}

VIvlan = \relative do' {

    mi8 do do
    do mi do
    mi do do

    %4
    si do sol'
    sol sol sol
    sol sol sol

    %7
    fad fad fad\mbreak
    re re re
    re re re

    %10
    re re re
    re re re
    re sol\p fad

    %13
    sol sol fad
    sol re re
    re16\f sol fad mi re do\mbreak

    %16
    si mi re do si la
    sol8 re' re,
    sol4.

    %19
    mi'8 mi mi
    mi mi mi
    fa fa fa

    %22
    fad fad fad
    fad? fad fad
    sol sol sol

    %25
    sol sol sol\mbreak
    sol re sol
    sol sol sol

    %28
    sol sol sol
    sol\p sol si,
    do sol' si,

    %31
    do si sol'
    sol16\f do si la sol fa
    mi la sol fa mi re

    %34
    do8 sol' sol,\mbreak
    do16 mi fa sol la si
    do8 do, r

    %37
    sol' sol fa
    mi4 r8

}


VIbcn = \relative do {

    do8 do' do,
    fa do do
    do do' do,

    %4
    sol do do
    do' do, do'
    sol sol, sol'\mbreak

    %7
    la la, re
    sol sol, sol'
    fad re fad

    %10
    sol sol, sol'
    fad re fad
    sol sol,\p re'

    %13
    sol sol, re'
    sol re re,
    sol16 sol'\f fad mi re do\mbreak

    %16
    si mi re do si la
    sol8 re' re,
    sol4 r8

    %19
    do do' do,
    do do' do,
    fa, fa' fa,

    %22
    re' re' re,
    re re' re,\mbreak
    sol, sol' sol,

    %25
    do do, do'
    si sol si
    do do, do'

    %28
    si sol si
    do\p do' sol
    do, do' sol

    %31
    do, sol' sol,
    do16\f do' si la sol fa
    mi la sol fa mi re

    %34
    do8 sol' sol,
    do16 mi fa sol la si
    do8 do, r

    %37
    do sol' sol,
    do4 r8

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \key do\major
    \tempo 4. = 60
    s4.*18
    \bar":..:"\break
    s4.*20
    \bar":|."

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
        title = \markup\smaller{Sinfonia per archi RV 162}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""Primo"}
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""Secondo"}
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Cembalo""[Violoncello]"}
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
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

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
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

    \markup \huge {[3.] Allegro assai }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
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
        title = \markup\smaller{Sinfonia per archi RV Anh. 93}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""Primo"}
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""Secondo"}
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Cembalo""[Violoncello]"}
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
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

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \Vbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
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

    \markup \huge {[3.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \VIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
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