\language "italiano"


acc = \once \override Stem #'stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript #'padding = #3

padall = \override TextScript #'padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber #'transparent = ##t

con = \override TupletNumber #'transparent = ##f

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
\version "2.20.0"


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
}


IcrIn = %\transpose do sib, {
   \relative do'' {

      do4 r8 do16 mi sol8-. sol-. sol-. sol-.
      sol4 sol8 fa mi4 mi8 re
      do4 r8 do16-. mi-. sol8-. sol-. sol-. sol-.

      sol4 sol8 fa mi4 mi8 re
      do4 r8 sol do4 sol8 sol
      mi4 r8 sol do4 sol8 sol

      %7
      mi4 sol mi do
      sol' sol sol r
      R1*12

      %21
      do1\ff~
      do~
      do~

      %24
      do4 do mi re
      do r8 do do4 do
      do r8 do do4 do

      %27
      do4 r8 do do4 do
      re1~
      re\mbreak

      %30
      sol~
      sol
      mi4 r mi mi

      %33
      re r re re
      re r re re
      re re re re

      %36
      re re re r\mbreak
      R1
      re2.\soli\mf re4

      %39
      re r r2
      re2. re4
      re r r2

      %42
      R1*3
      sol,1\f~
      sol~

      %47
      sol~
      sol4 mi' re re
      re r8 re re re re re

      %50
      re4 r r2\mbreak
      re4 r8 re re re re re
      re4 r r2

      %53
      re4 re re re
      re re re re
      re r r2

      %56
      R1
      r2 r4 mi\mbreak
      re4 re mi mi

      %59
      re r r2
      R1
      r2 r4  mi

      %62
      re re mi mi
      re r r2
      R1*3

      %67
      do4\ff r8 do16 mi sol8-. sol-. sol-. sol-.
      sol4 sol8 fa mi4 mi8 re
      do4 r8 do16 mi sol8-. sol-. sol-. sol-.

      %70
      sol4 sol8 fa mi4 mi8 re
      do4 r8 sol do4 sol8 sol
      mi4 r8 sol do4 sol8 sol

      %73
      mi4 sol mi do
      sol' sol sol r
      R1*12

      %87
      do1\f~
      do~
      do~

      %90
      do4 do mi re
      do r8 do do4 do
      do1

      %93
      R1*2
      mi1~
      mi\mbreak

      %97
      re2 re4 re
      re r re mi
      re r re mi

      %100
      re re mi mi
      re re re r
      R1

      %103
      mi2.\soli \mf mi4
      re r r2
      re2. re4\mbreak

      %106
      mi r r2
      R1*3
      do1\f~

      %111
      do~
      do~
      do4 do mi re

      %114
      do r8 mi mi mi mi mi\mbreak
      mi4 r r2
      do4 r8 mi mi mi mi mi

      %117
      mi4 r r2
      mi4 sol sol sol
      mi sol sol sol

      %120
      mi do do do
      do r r2\fermata

  % }

}


IcrIIn = %\transpose do sib, {
\relative do'' {



      do4 r8 do16 mi sol8-. sol-. sol-. sol-.
      sol4 sol8 fa mi4 mi8 re
      do4 r8 do16-. mi-. sol8-. sol-. sol-. sol-.

      sol4 sol8 fa mi4 mi8 re
      do4 r8 sol do4 sol8 sol
      mi4 r8 sol do4 sol8 sol

      %7
      mi4 sol mi do
      sol' sol sol r
      R1*12

      %21
      do1\ff~
      do~
      do~

      %24
      do4 do do sol
      mi r8 do' do4 do
      do r8 do do4 do

      %27
      do r8 do do4 do
      re1~
      re\mbreak

      %30
      sol,~
      sol
      do4 r mi mi

      %33
      re r re re
      re r re re
      re re re re

      %36
      re re re r\mbreak
      R1
      sol,2.\mf\soli sol4

      %39
      re' r r2
      re2. re4
      sol, r r2

      %42
      R1*3
      sol1\f~
      sol~

      %47
      sol~
      sol4 do re re
      sol, r8 sol sol sol sol sol

      %50
      sol4 r r2\mbreak
      sol4 r8 sol sol sol sol sol
      sol4 r r2

      %53
      sol4 sol sol sol
      sol sol sol sol
      sol r r2

      %56
      R1
      r2 r4 do\mbreak
      sol sol do do

      %59
      sol r r2
      R1
      r2 r4 do

      %62
      sol sol do do
      sol r r2
      R1*3

      %67
      do4\ff r8 do16 mi sol8-. sol-. sol-. sol-.
      sol4 sol8 fa mi4 mi8 re
      do4 r8 do16 mi sol8-. sol-. sol-. sol-.

      %70
      sol4 sol8 fa mi4 mi8 re
      do4 r8 sol do4 sol8 sol
      mi4 r8 sol do4 sol8 sol

      %73
      mi4 sol mi do
      sol' sol sol r
      R1*12

      %87
      do1\f~
      do~
      do~

      %90
      do4 do do sol
      mi r8 do do4 do
      do1

      %93
      R1*2
      do'1~
      do\mbreak

      %97
      re2 re4 re
      sol, r sol do
      sol r sol do

      %100
      sol sol do do
      sol sol sol r
      R1

      %103
      do2.\soli\mf do4
      sol r r2
      sol2. sol4\mbreak

      %106
      do4 r r2
      R1*3
      do1\f~

      %111
      do~
      do~
      do4 do do sol

      %114
      mi r8 do' do do do do\mbreak
      do4 r r2
      mi,4 r8 do' do do do do

      %117
      do4 r r2
      do4 mi mi mi
      do mi mi mi

      %120
      do mi, mi mi
      mi r r2\fermata

   %}

}

IobIn = \relative do'' {

   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.

   %4
   fa4 fa8 mib re4 re8 do
   sib4 r8 fa' sib4 fa8 fa
   re4 r8 fa sib4 fa8 fa

   %7
   re4 fa re sib
   fa' fa fa r
   do2.\soli \grace mib16 re8 (do16 re)\mbreak

   %10
   do2. \grace mib16 re8 (do16 re)
   mib4-. mib-. mib-. mib-.
   mib2(do4.) dod8

   %13
   re2. \grace fa16 mib8(re16 mib)
   re2. \grace fa16 mib8(re16 mib)
   fa4-. fa-. fa-. fa-.

   %16
   fa2(re4) r
   do2.\grace mib16 re8 (do16 re)\mbreak
   do2. \grace mib16 re8 (do16 re)

   %19
   mib4-. mib-. mib-. mib-.\mbreak
   mib2(do4) r
   re r re mib

   %22
   fa r fa mib
   re r re mib
   fa sol fa la

   %25
   sib r8 fa fa4 fa
   sol r8 sol sol4 sol
   fa r8 fa fa4 fa

   %28
   mi1
   fa2 sol\mbreak
   la1~

   %31
   la
   sol4 sol sol sol
   sol r sol la

   %34
   sol r sol la
   sol sol la la
   sol sol sol r\mbreak

   %37
   R1
   do2.\soli \grace sib16 la8(sol16 la)
   sol4 r  r2

   %40
   sib2. \grace la16 sol8(fa16 sol)
   la4 r r2
   R1*3

   %45
   r2 fa4\ff fa
   fa r fa fa
   fa r fa fa

   %48
   fa fa la fa
   fa r8 fa16 la do8 do do do
   do4 r r2\mbreak

   %51
   fa,4 r8 fa16 la do8-. do-. do-. do-.
   do4 r r2
   fa,4 la do la

   %54
   fa la do la
   fa r r2
   mib4.\soli(re8) do4 r

   %57
   fa4.(mib8) re4 r\mbreak
   R1*2
   mib4.\soli(re8) do4 r

   %61
   fa4.(mib8) re4 r
   do do re re
   do r r2

   %64
   R1*3
   sib4\ff r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do

   %69
   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   sib4 r8 fa' sib4 fa8 fa

   %72
   re4 r8 fa sib4 fa8 fa
   re4 fa re sib\mbreak
   fa' fa fa r

   %75
   do2.\soli \grace mib16 re8 (do16 re)\mbreak
   do2. \grace mib16 re8 (do16 re)
   mib4-. mib-. mib-. mib-.

   %78
   mib2(do4.) dod8
   re2. \grace fa16 mib8(re16 mib)
   re2. \grace fa16 mib8(re16 mib)

   %81
   fa4-. fa-. fa-. fa-.
   fa2(re4) r
   do2.\grace mib16 re8 (do16 re)\mbreak

   %84
   do2. \grace mib16 re8 (do16 re)
   mib4-. mib-. mib-. mib-.\mbreak
   mib2(do4) r

   %87
   re r re mib
   fa r fa mib
   re r re mib

   %90
   fa sol fa la
   sib r8 fa fa4 fa
   fa1

   %93
   R1*2
   sib1~
   sib~\mbreak

   %97
   sib4 sib sib sib
   la r fa fa
   fa r fa fa

   %100
   fa fa fa fa
   fa fa fa r
   R1

   %103
   fa2.\soli \grace fa16 re8 (do16 re)
   mib4 r r2
   mib2. \grace mib16 do8(sib16 do)\mbreak

   %106
   re4 r r2
   R1*3
   re4 r re mib

   %111
   fa r fa mib
   re r re mib
   fa sol fa la

   %114
   sib r8 sib,16 re fa8-. fa-. fa-. fa-.\mbreak
   fa4 r r2
   sib,4 r8 sib16 re fa8-. fa-. fa-. fa-.

   %117
   fa4 r r2
   re4 fa sib fa
   re fa sib fa

   %120
   re fa fa fa
   fa r r2\fermata

}

IobIIn = \relative do'' {

   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.

   %4
   fa4 fa8 mib re4 re8 do
   sib4 r8 fa' sib4 fa8 fa
   re4 r8 fa sib4 fa8 fa

   %7
   re4 fa re sib
   fa' fa fa r
   la,2.\soli \grace do16 sib8(la16 sib)\mbreak

   %10
   la2.\grace do16 sib8(la16 sib)
   do4-. do-. do-. do-.
   do2(la4.) la8

   %13
   sib2. \grace re16 do8(sib16 do)
   sib2. \grace re16 do8(sib16 do)
   re4-. re-. re-. re-.

   %16
   re2(sib4) r
   la2. \grace do16 sib8(la16 sib)\mbreak
   la2.\grace do16 sib8(la16 sib)

   %19
   do4-. do-. do-. do-.
   do2(la4) r
   sib r sib sib

   %22
   sib r sib sib
   sib r sib sib
   sib mib re do

   %25
   sib r8 re re4 re
   mib r8 mib mib4 mib
   re r8 re re4 re

   %28
   do1~
   do\mbreak
   fa~

   %31
   fa~
   fa4 fa fa fa
   mi r mi fa

   %34
   mi r mi fa
   mi mi fa fa
   mi mi mi r\mbreak

   %37
   R1
   la2.\soli \grace sol16 fa8(mi16 fa)
   mi4 r r2

   %40
   sol2. \grace sol16 mi8 (re16 mi)
   fa4 r r2
   R1*3

   %45
   r2 la,4\ff sib
   do r do sib
   la r la sib

   %48
   do re do mi
   fa r8 do16 fa la8 la la la
   la4 r r2\mbreak

   %51
   la,4 r8 do16 fa la8-. la-. la-. la-.
   la4 r r2
   fa4 la do la

   %54
   fa la do la
   fa r r2
   do4.\soli(sib8) la4 r

   %57
   re4.(do8) sib4 r\mbreak
   R1*2
   do4.\soli(sib8) la4 r

   %61
   re4.(do8) sib4 r
   la la sib sib
   la r r2

   %64
   R1*3
   sib4\ff r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do

   %69
   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   sib4 r8 fa' sib4 fa8 fa

   %72
   re4 r8 fa sib4 fa8 fa
   re4 fa re sib\mbreak
   fa' fa fa r

   %75
   la,2.\soli \grace do16 sib8(la16 sib)\mbreak
   la2.\grace do16 sib8(la16 sib)
   do4-. do-. do-. do-.

   %78
   do2(la4.) la8
   sib2. \grace re16 do8(sib16 do)
   sib2. \grace re16 do8(sib16 do)

   %81
   re4-. re-. re-. re-.
   re2(sib4) r
   la2. \grace do16 sib8(la16 sib)\mbreak

   %84
   la2.\grace do16 sib8(la16 sib)
   do4-. do-. do-. do-.
   do2(la4) r

   %87
   sib r sib sib
   sib r sib sib
   sib r sib sib

   %90
   sib mib re do
   re r8 re re4 re
   re1

   %93
   R1*2
   re1~
   re\mbreak

   %97
   do4 do do do
   do r do re
   do r do re

   %100
   do do re re
   do la la r
   R1

   %103
   re2. \soli\grace fa16 sib,8(la16 sib)
   do4 r r2
   do2. \grace do16 la8(sol16 la)\mbreak

   %106
   sib4 r r2
   R1*3
   sib4 r sib sib

   %111
   sib r sib sib
   sib r sib sib
   sib mib re  do

   %114
   sib r8 fa16 sib re8 re re re\mbreak
   re4 r r2
   sib4 r8 fa16 sib re8-. re-. re-. re-.

   %117
   re4 r r2
   sib4 re re re
   sib re re re

   %120
   sib re re re
   re r r2\fermata

}

IvlIn = \relative do'' {

   <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.

   %4
   fa4 fa8 mib re4 re8 do
   <sib re,>4 r8 fa' sib4 fa8 fa
   re4 r8 fa sib4 fa8 fa

   %7
   re re fa fa re re sib sib
   \stemUp <fa' do fa,>4 <fa do fa,> <fa do fa,> r\stemNeutral
   la,,8-.\p fa'-. la,-. fa'-. la,-. fa'-. sib,-. fa'-.\mbreak

   %10
   la, fa' la, fa' la, fa' sib, fa'
   do fa do fa do fa do fa
   do fa do fa la, fa' la, fa'

   %13
   sib, fa' sib, fa' sib, fa' do fa
   sib, fa' sib, fa' sib, fa' do fa
   re fa re fa re fa re fa

   %16
   re fa re fa sib, fa' sib, fa'
   la, fa' la, fa' la, fa' sib, fa'
   la, fa' la, fa' la, fa' sib, fa'

   %19
   do fa do fa do fa do fa\mbreak
   do fa do fa do fa do fa
   sib,16\noBeam \stemUp <sib'' sib,>\ff <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>

   %22
   <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>
   <sib sib,> <sib sib,> <sib sib,> <sib sib,>
   <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>
   <sib sib,>4 <sol sib, mib,> <fa sib, re,> <la do, fa,>

   %25
   <sib re, fa,> r8\once\stemDown  fa <sib sib, re,>4 <sib sib, re,>
   <sol sib, re,> r8 \once\stemDown sol <sib sib, mib,>4 <sib sib, mib,>
   <fa sib, re,>4 r8 fa <sib sib, re,>4 <sib sib, re,>

   %28
   \stemNeutral mi,4 r8 mi sol32(fa mi8.) mi8 mi
   la32(sol fa8.) fa8 fa sib32(la sol8.) sol8 sol\mbreak
   \stemUp <la la,>16 <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,>

   %31
   <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,> <la la,>\stemNeutral
   \repeat unfold 16 {sol}
   sol4 r \stemUp <sol do, mi,>4 <la do, fa,>

   %34
   <sol do, mi,> r <sol do, mi,> <la do, fa,>
   <sol do, mi,> <sol do, mi,> <la do, fa,> <la do, fa,>
   <sol do, mi,> <mi do sol> <mi do sol> \stemNeutral r\mbreak

   %37
   fa,8\p( la do la) fa(la do la)
   fa4-. fa-. fa-. fa-.
   do8(mi sol mi) do(mi sol mi)

   %40
   do4-. do-. do-. do-.
   fa r r8 do'-. do-. do-.
   mi\mf(re) re4 r8 mi-.\p mi-. mi-.

   %43
   sol\mf(fa) fa4 r8 do\p-. do-. do-.\mbreak
   mi(re) r re fa(mi) r mi
   fa16 \ff\repeat unfold 47 {fa16}

   %48
   fa4 \stemUp <sib re, fa,> <la do, fa,> <sol do, mi,>\stemNeutral
   fa4 r8 fa16 la do8 do do do
   do4 do8 sib la4 la8 sol\mbreak

   %51
   fa4 r8 fa16 la do8-. do-. do-. do-.
   do4 do8 sib la4 la8 sol
   fa4 \stemUp <la do, fa,> \once\stemDown do4 <la do, fa,>

   %54
   <fa do fa,> <la do, fa,> \once\stemDown do4 <la do, fa,>
   <fa do fa,> r r2
   R1

   %57
   r2 r4 <sib re, fa,>\f\mbreak
   <la do, fa,> <la do, fa,> <sib re, fa,> <sib re, fa,>
   <la do, fa,> r r2

   %60
   R1
   r2 r4 <sib re, fa,>\f
   <la do, fa,> <la do, fa,> <sib re, fa,> <sib re, fa,>

   %63
   \stemNeutral fa16\noBeam fa\p fa fa fa fa fa fa fa fa fa fa sol-.\f sol-. sol-. sol-.
   mib\p mib mib mib mib mib mib mib mib mib mib mib fa\f-. fa-. fa-. fa-.
   re\p re re re re re re re re re re re mib\f-. mib-. mib-. mib-.\mbreak

   %66
   fa fa fa fa mib mib mib mib re re re re do do do do
   \once\stemUp <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do

   %69
   \once\stemUp <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   \once\stemUp <sib re,>4 r8 fa' sib4 fa8 fa

   %72
   re4 r8 fa sib4 fa8-. fa-.
   re re fa fa re re sib sib\mbreak
   \stemUp <fa' do fa,>4 <fa do fa,> <fa do fa,> r\stemNeutral

   %75
   la,,8-.\p fa'-. la,-. fa'-. la,-. fa'-. sib,-. fa'-.\mbreak
   la, fa' la, fa' la, fa' sib, fa'
   do fa do fa do fa do fa

   %78
   do fa do fa la, fa' la, fa'
   sib, fa' sib, fa' sib, fa' do fa
   sib, fa' sib, fa' sib, fa' do fa

   %81
   re fa re fa re fa re fa
   re fa re fa sib, fa' sib, fa'
   la, fa' la, fa' la, fa' sib, fa'

   %84
   la, fa' la, fa' la, fa' sib, fa'
   do fa do fa do fa do fa\mbreak
   do fa do fa do fa do fa

   %87
   sib,16\noBeam \stemUp <sib'' sib,>\ff <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>
   <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>
   <sib sib,> <sib sib,> <sib sib,> <sib sib,>
   <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>

   %90
   <sib sib,>4 <sol sib, mib,> <fa sib, re,> <la do, fa,>
   <sib re, fa,> r8\once\stemDown  fa <sib sib, re,>4 <sib sib, re,>
   <lab sib, re,>\stemNeutral r8 lab fa32(sol lab8.) lab8 lab

   %93
   sol4 r8 sol re32(mib fa8.) fa8 fa
   mib4 r8 mib do32(re mib8.) mib8 mib
   re16\noBeam <<{sib'\repeat unfold 46{sib}}\\{re,\repeat unfold 46{re}}>>

   %98
   \stemUp <la' do,>4 r <la do, fa,> <sib re, fa,>
   <la do, fa,> r <la do, fa,> <sib re, fa,>
   <la do, fa,> <la do, fa,> <sib re, fa,> <sib re, fa,>

   %101
   <la do, fa,> <fa do fa,> <fa do fa,> \stemNeutral r
   sib,,8 [(re fa re)] sib[(re fa re)]
   sib4-. sib-. sib-. sib-.

   %104
   fa'8[(la do la)] fa[(la do la)]
   fa4-. fa-. fa-. fa-.\mbreak
   sib, r r8 fa''-. [fa-. fa-.]

   %107
   la8\mf(sol) sol4 r8 la-.\p la-. la-.
   do\mf(sib) sib4 r8 fa\p-. fa-. fa-.
   la(sol) r sol sib(la) r la

   %110
   \stemUp <sib sib,>16\ff <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>
   <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>
   <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,> <sib sib,>

   %113
   <sib sib,>4 <sol sib, mib,> <fa sib, re,> <la do, fa,>
   <sib re, fa,> \stemNeutral r8 sib,16 re fa8-. fa-. fa-. fa-.\mbreak
   fa4 fa8 mib re4 re8 do

   %116
   <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   \stemUp <sib re,>4 <fa' sib, re,> <sib re, fa,> <fa sib, re,>

   %119
   \once\stemDown re4 <fa sib, re,> <sib re, fa,> <fa sib, re,>
   \once\stemDown re4 <sib' re, fa,> <sib re, fa,> <sib re, fa,>
   <sib re, fa,> r r2\fermata

}

IvlIIn = \relative do'' {

   <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.

   %4
   fa4 fa8 mib re4 re8 do
   <sib re,>4 r8 fa' sib4 fa8 fa
   re4 r8 fa sib4 fa8 fa

   %7
   re re fa fa re re sib sib
   \stemUp <fa' do fa,>4 <fa do fa,> <fa do fa,> r\stemNeutral
   la,,8-.\p fa'-. la,-. fa'-. la,-. fa'-. sib,-. fa'-.\mbreak

   %10
   la, fa' la, fa' la, fa' sib, fa'
   do fa do fa do fa do fa
   do fa do fa la, fa' la, fa'

   %13
   sib, fa' sib, fa' sib, fa' do fa
   sib, fa' sib, fa' sib, fa' do fa
   re fa re fa re fa re fa

   %16
   re fa re fa sib, fa' sib, fa'
   la, fa' la, fa' la, fa' sib, fa'
   la, fa' la, fa' la, fa' sib, fa'

   %19
   do fa do fa do fa do fa\mbreak
   do fa do fa do fa do fa
   sib,4\ff r re'8 re mib mib

   %22
   fa4 r fa8 fa mib mib
   re4 r re8 re mib mib
   fa4 \stemUp <sol sib, mib,> <fa sib, re,> <la do, fa,>\stemNeutral

   %25
   sib16\noBeam <<
      {
         \repeat unfold 15 {fa}
         \repeat unfold 16{sol}
         \repeat unfold 16 {fa}
      }\\{
         \repeat unfold 15 {re}
         \repeat unfold 16{mib}
         \repeat unfold 16 {re}
      }
   >>

   %28
   mi do do do\repeat unfold 28 {do}\mbreak % 2 bars
   \stemUp\repeat unfold 32 {<fa la,>} \stemNeutral% 2 bars
   <<
      {
         \repeat unfold 16 {fa}

         %33
         mi4
      }\\{
         \repeat unfold 16 {re16}
         do4
      }
   >> r \stemUp <sol' do, mi,>4 <la do, fa,>
   <sol do, mi,> r <sol do, mi,> <la do, fa,>
   <sol do, mi,> <sol do, mi,> <la do, fa,> <la do, fa,>

   %36
   <sol do, mi,> <mi do sol> <mi do sol> \stemNeutral r\mbreak
   fa,8\p( la do la) fa(la do la)
   fa4-. fa-. fa-. fa-.

   %39
   do8(mi sol mi) do(mi sol mi)
   do4-. do-. do-. do-.
   fa r\mf la,2(

   %42
   sib do\p)
   re(\mf la\p\mbreak
   sib do)

   %45
   fa4\ff r la8 la sib sib
   do4 r do8 do sib sib
   la4 r la8 la sib sib

   %48
   do4 \stemUp <re fa,> <fa do fa,> <mi do sol>
   \repeat unfold 16{<fa la,>16}
   <fa la,>4 \stemNeutral do'8 sib la4 la8 sol\mbreak

   %51
   \stemUp \repeat unfold 16{<fa la,>16}
   <fa la,>4 \stemNeutral do'8 sib la4 la8 sol
   fa4 \stemUp <la do, fa,> \once\stemDown do4 <la do, fa,>

   %54
   <fa do fa,> <la do, fa,> \once\stemDown do4 <la do, fa,>
   <fa do fa,> r r2
   R1

   %57
   r2 r4 <sib re, fa,>\f\mbreak
   <la do, fa,> <la do, fa,> <sib re, fa,> <sib re, fa,>
   <la do, fa,> r r2

   %60
   R1
   r2 r4 <sib re, fa,>\f
   <la do, fa,> <la do, fa,> <sib re, fa,> <sib re, fa,>

   %63
   \stemNeutral fa16\noBeam fa\p fa fa fa fa fa fa fa fa fa fa sol-.\f sol-. sol-. sol-.
   mib\p mib mib mib mib mib mib mib mib mib mib mib fa\f-. fa-. fa-. fa-.
   re\p re re re re re re re re re re re mib\f-. mib-. mib-. mib-.\mbreak

   %66
   fa fa fa fa mib mib mib mib re re re re do do do do
   \once\stemUp <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do

   %69
   \once\stemUp <sib re,>4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   \once\stemUp <sib re,>4 r8 fa' sib4 fa8 fa

   %72
   re4 r8 fa sib4 fa8-. fa-.
   re re fa fa re re sib sib\mbreak
   \stemUp <fa' do fa,>4 <fa do fa,> <fa do fa,> r\stemNeutral

   %75
   la,,8-.\p fa'-. la,-. fa'-. la,-. fa'-. sib,-. fa'-.\mbreak
   la, fa' la, fa' la, fa' sib, fa'
   do fa do fa do fa do fa

   %78
   do fa do fa la, fa' la, fa'
   sib, fa' sib, fa' sib, fa' do fa
   sib, fa' sib, fa' sib, fa' do fa

   %81
   re fa re fa re fa re fa
   re fa re fa sib, fa' sib, fa'
   la, fa' la, fa' la, fa' sib, fa'

   %84
   la, fa' la, fa' la, fa' sib, fa'
   do fa do fa do fa do fa\mbreak
   do fa do fa do fa do fa

   %87
   sib,4\ff r re'8 re mib mib
   fa4 r fa8 fa mib mib
   re4 r re8 re mib mib\mbreak

   %90
   fa4\stemUp <sol sib, mib,> <fa sib, re,> <la do, fa,>\stemNeutral
   sib16\noBeam <<{\repeat unfold 31{fa}}\\{\repeat unfold 31{re}}>> % 2bars
   \repeat unfold 16{re}

   %94
   sol, sol sol sol sol sol sol sol do do do do do do do do
   sib\noBeam <<{sib'\repeat unfold 46{sib}}\\{re,\repeat unfold 46{re}}>>

   %98
   \stemUp <la' do,>4 r <la do, fa,> <sib re, fa,>
   <la do, fa,> r <la do, fa,> <sib re, fa,>
   <la do, fa,> <la do, fa,> <sib re, fa,> <sib re, fa,>

   %101
   <la do, fa,> <fa do fa,> <fa do fa,> \stemNeutral r
   sib,,8 [(re fa re)] sib[(re fa re)]
   sib4-. sib-. sib-. sib-.

   %104
   fa'8[(la do la)] fa[(la do la)]
   fa4-. fa-. fa-. fa-.\mbreak
   sib, r re2\mf(

   %107
   mib fa)\p
   sol\mf(re
   mib\p fa)

   %110
   sib,4\ff r re'8 [re mib mib]
   fa4 r fa8 [fa mib mib]
   re4 r re8 [re mib mib]

   %113
   fa4 \stemUp <sol sib, mib,> <fa sib, re,> <la do, fa,>\stemNeutral
   <sib, re,>16 \repeat unfold 7 {<sib re,>} <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <re fa,>\mbreak
   <re fa,>4 fa8 mib re4 re8 do

   %116
   <sib re,>16 \repeat unfold 7 {<sib re,>} <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <re fa,>\mbreak
   <re fa,>4 fa8 mib re4 re8 do
   \stemUp <sib re,>4 <fa' sib, re,> <sib re, fa,> <fa sib, re,>

   %119
   \once\stemDown re4 <fa sib, re,> <sib re, fa,> <fa sib, re,>
   \once\stemDown re4 <sib' re, fa,> <sib re, fa,> <sib re, fa,>
   <sib re, fa,> r r2\fermata

}

Ivlan = \relative do' {

   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.

   %4
   fa4 fa8 mib re4 re8 do
   sib4 r8 fa' sib4 fa8 fa
   re4 r8 fa sib4 fa8 fa

   %7
   re re fa fa re re sib sib
   fa'4 fa fa r
   R1*12

   %21
   sib,4\ff r sib8 sib do do
   re4 r re8 re do do
   sib4 r sib8 sib do do

   %24
   re re mib mib fa fa fa, fa
   sib sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib

   %27
   sib sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib
   la la la la mi' mi mi mi\mbreak %% fine p. 6

   %30
   fa4 r8 la fa4 dod
   re r8 fa re4 la
   sib8 sib sib sib si si si si

   %33
   do do mi do mi do fa do
   mi do mi do mi do fa do
   mi do mi do fa do fa do

   %36
   mi4 do do  r\mbreak
   R1*4
   r2 la(

   %42
   sib do)
   re la\mbreak
   sib do
   fa4\ff r fa8 fa sol sol

   %46
   la4 r la8 la sol sol
   fa4 r fa8 fa sol sol
   la la sib sib do do do, do

   %49
   fa fa fa fa fa fa fa fa
   fa4 do'8 sib la4 la8 sol\mbreak
   fa fa fa fa fa fa fa fa

   %52
   fa4 do'8 sib la4 la8 sol
   fa4 fa fa fa
   fa fa fa fa

   %55
   fa8\soli\noBeam fa-. fa-. fa-. fa-. fa-. fa-. fa-.
   fa-. fa-. fa-. fa-. fa-. fa-. fa-. fa-.
   fa-. fa-. fa-. fa-. fa-. fa-. fa-. fa-.\mbreak

   %58
   fa4 fa sib sib,
   fa'8\soli\noBeam fa-. fa-. fa-. fa-. fa-. fa-. fa-.
   fa-. fa-. fa-. fa-. fa-. fa-. fa-. fa-.

   %61
   fa-. fa-. fa-. fa-. fa-. fa-. fa-. fa-.\mbreak
   fa4 fa sib sib,
   fa'16\noBeam fa\p fa fa  fa fa fa fa fa fa fa fa sol-.\f sol-. sol-. sol-.

   %64
   mib\p mib mib mib mib mib mib mib mib mib mib mib fa\f-. fa-. fa-. fa-.
   re\p re re re re re re re re re re re mib\f-. mib-. mib-. mib-.\mbreak
   fa fa fa fa mib mib mib mib re re re re do do do do

   %67
   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   sib4 r8 sib16 re fa8-. fa-. fa-.fa-.

   %70
   fa4 fa8 mib re4 re8 do
   sib4 r8 fa' sib4 fa8 fa
   re4 r8 fa sib4 fa8 fa

   %73
   re re fa fa re re sib sib\mbreak
   fa'4 fa fa r
   R1*12

   %87
   sib,4\ff r sib8 sib do do
   re4 r re8 re do do
   sib4 r sib8 sib do do

   %90
   re re mib mib fa fa fa, fa
   sib sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib

   %93
   si si si si si si si si
   do do do do la la la la
   sib4 r8 re' sib4 fad

   %96
   sol r8 sib sol4 re\mbreak
   mib8 mib mib mib mi mi mi mi
   fa fa la fa la fa sib fa

   %99
   la fa la fa la fa sib fa
   la fa la fa sib fa sib fa
   la4 fa fa r

   %102
   R1*4
   r2 re(
   mib fa)

   %108
   sol re
   mib fa
   sib,4\ff r sib8 sib do do
   re4 r re8 re do do

   %112
   sib4 r sib8 sib do do
   re re mib mib fa fa fa, fa
   sib sib sib sib sib sib sib sib\mbreak

   %115
   sib4 fa'8 mib re4 re8 do
   sib sib sib sib sib sib sib sib
   sib4 fa'8 mib re4 re8 do

   %118
   sib sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib
   sib4 sib sib sib

   %121
   sib r r2\fermata

}

Ibcn = \relative do {

   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.

   %4
   fa4 fa8 mib re4 re8 do
   sib4 r8 fa' sib4 fa8 fa
   re4 r8 fa sib4 fa8 fa

   %7
   re re fa fa re re sib sib
   fa'4 fa fa r
   R1*12

   %21
   sib,4\ff r sib8 sib do do
   re4 r re8 re do do
   sib4 r sib8 sib do do

   %24
   re re mib mib fa fa fa, fa
   sib sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib

   %27
   sib sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib
   la la la la mi' mi mi mi\mbreak %% fine p. 6

   %30
   fa4 r8 la fa4 dod
   re r8 fa re4 la
   sib8 sib sib sib si si si si

   %33
   do do mi do mi do fa do
   mi do mi do mi do fa do
   mi do mi do fa do fa do

   %36
   mi4 do do  r\mbreak
   R1*8
   fa4\ff r fa8 fa sol sol

   %46
   la4 r la8 la sol sol
   fa4 r fa8 fa sol sol
   la la sib sib do do do, do

   %49
   fa fa fa fa fa fa fa fa
   fa4 do'8 sib la4 la8 sol\mbreak
   fa fa fa fa fa fa fa fa

   %52
   fa4 do'8 sib la4 la8 sol
   fa4 fa fa fa
   fa fa fa fa

   %55
   fa r r2
   R1
   r2 r4 sib\f \mbreak

   %58
   fa fa sib sib
   fa4 r r2
   R1

   %61
   r2 r4 sib\f
   fa fa sib sib
   fa2.\p sol4-.\f

   %64
   mib2.\p fa4-.\f
   re2.\p mib4-.\f \mbreak
   fa8 fa mib mib re re do do

   %67
   sib4 r8 sib16 re fa8-. fa-. fa-. fa-.
   fa4 fa8 mib re4 re8 do
   sib4 r8 sib16 re fa8-. fa-. fa-.fa-.

   %70
   fa4 fa8 mib re4 re8 do
   sib4 r8 fa' sib4 fa8 fa
   re4 r8 fa sib4 fa8 fa

   %73
   re re fa fa re re sib sib\mbreak
   fa'4 fa fa r
   R1*12

   %87
   sib,4\ff r sib8 sib do do
   re4 r re8 re do do
   sib4 r sib8 sib do do

   %90
   re re mib mib fa fa fa, fa
   sib sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib

   %93
   si si si si si si si si
   do do do do la la la la
   sib4 r8 re' sib4 fad

   %96
   sol r8 sib sol4 re\mbreak
   mib8 mib mib mib mi mi mi mi
   fa fa la fa la fa sib fa

   %99
   la fa la fa la fa sib fa
   la fa la fa sib fa sib fa
   la4 fa fa r

   %102
   R1*8
   sib,4\ff r sib8 sib do do
   re4 r re8 re do do

   %112
   sib4 r sib8 sib do do
   re re mib mib fa fa fa, fa
   sib sib sib sib sib sib sib sib\mbreak

   %115
   sib4 fa'8 mib re4 re8 do
   sib sib sib sib sib sib sib sib
   sib4 fa'8 mib re4 re8 do

   %118
   sib sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib
   sib4 sib sib sib

   %121
   sib r r2\fermata

}

Ibfn = \figuremode {
   \bassFigureExtendersOff
   \bassFigureStaffAlignmentUp



}

forma = {

   \time 4/4
   \tempo 2 = 65
   s1*121
   \bar "|."

}


IcrI = {
   \Iglobal
   \notypeset
   <<\IcrIn \forma>>

}


IcrII = {
   \Iglobal
   <<\IcrIIn \forma>>

}


IobI = {
   \Iglobal
   <<\IobIn \forma>>

}


IobII = {
   \Iglobal
   <<\IobIIn \forma>>

}

IvlI = {
   \Iglobal
   <<\IvlIn \forma>>

}

IvlII = {
   \Iglobal
   <<\IvlIIn \forma>>

}


Ivla = {
   \Iglobal
   \clef alto
   <<\Ivlan \forma>>

}



Ibc = {
   \Iglobal
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


IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
}


IIcrIn = %\transpose do mib, {
\relative do'' {

   r8
   R4.*8
   re8-.\soli re-. re-.\mbreak
   re4 r8

   %11
   R4.*2
   re8-.\soli re-. re-.
   re4 r8

   %15
   R4.*22
   do4.~\mbreak
   do~

   %39
   do~
   do4 r8
   R4.*4

   %45
   do4.\mf~
   do~
   do~

   %48
   do4 r8
   R4.*8\mbreak
   sol'8\soli -. sol-. sol-.

   %58
   mi4 r8
   R4.*2
   sol8 -. sol-. sol-.

   %62
   mi4 r8
   R4.*13
   R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

  % }

}


IIcrIIn = %\transpose do mib, {
\relative do'' {

   r8
   R4.*8
   sol8-.\soli sol-. sol-.\mbreak
   sol4 r8

   %11
   R4.*2
   sol8-.\soli sol-. sol-.\mbreak
   sol4 r8

   %15
   R4.*22
   do,4.~\mbreak
   do~

   %39
   do~
   do4 r8
   R4.*4

   %45
   do4.\mf~
   do~
   do~

   %48
   do4 r8
   R4.*8\mbreak
   mi'8\soli-. mi-. mi-.

   %58
   do4 r8
   R4.*2
   mi8-. mi-. mi-.

   %58
   do4 r8
   R4.*13
   R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

%}

}

IIobIn = \relative do'' {

   r8
   R4.*8
   fa8-.\soli fa-. fa-.\mbreak
   re4 r8

   %11
   R4.*2
   fa8-.\soli fa-. fa-.
   re4 r8

   %15
   R4.*22
   sib'4 do8\mbreak
   do16.(fa,32) fa8[sol]

   %39
   lab-. lab-. sib-.
   sol4 r8
   R4.*4

   %45
   sib4 do8
   do16.(fa,32) fa8[sol]
   lab-. lab-. sib-.

   %48
   sol4 r8
   R4.*8
   sib8-.\soli sib-. sib-.

   %58
   sol4 r8
   R4.*2
   sib8-. sib-. sib-.

   %62
   sol4 r8
   R4.*13
   R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIobIIn = \relative do'' {

   r8
   R4.*8
   re8-.\soli re-. re-.\mbreak
   sib4 r8

   %11
   R4.*2
   re8-.\soli re-. re-.
   sib4 r8

   %15
   R4.*22
   sol'4 lab8\mbreak
   lab16.(re,32) re8[mib]

   %39
   fa-. fa-. sol-.
   mib4 r8
   R4.*4

   %45
   sol4 lab8
   lab16.(re,32) re8[mib]
   fa-. fa-. sol-.

   %48
   mib4 r8
   R4.*8
   sol8-.\soli sol-. sol-.

   %58
   mib4 r8
   R4.*2
   sol8-. sol-. sol-.

   %62
   mib4 r8
   R4.*13
   R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlIn = \relative do'' {

   sib8_\markup\italic"a mezza voce"
   mib-. mib-. re16\tr [do32(re)]
   mib8-. mib-. fa16\tr [mib32(fa)]
   sol8\noBeam lab16(sol fa mib)

   %4
   mib8 re sol16.[(sib32)]
   mib,8-. mib-. re16\tr [do32(re)]
   mib8-. mib-. fa16\tr [mib32(fa)]

   %7
   sol8\noBeam lab16(fa mib re)
   mib4 r8
   R4.\mbreak

   %10
   r8 r16. sib32\f re16. sib32
   mib8-.\p mib-. fa16.[(mib32)]
   mib4(re8)

   %13
   R4.
   r8 r16. sib32\f re16. sib32
   mib8-.\p mib-. fa16.[(mib32)]

   %16
   mib4(re8)
   \grace lab'16 sib32(la sib16) r16 sib-. sib-. sib-.
   \grace lab16 sol32(fad sol16) r16 sol-. sol-. sol-.

   %19
   \grace sol16 fa32(mi fa16) r16 fa-. fa-. mib-.\mbreak
   dod8(re) r
   \grace lab'16 sib32\f(la sib16) r16 sib-. sib-. sib-.

   %22
   \grace lab16 sol32(fad sol16) r16 sol-. sol-. sol-.
   \grace sol16 fa32(mi fa16) r16 la-. do-. la-.
   sib4 sib8_\markup\italic"a mezza voce"

   %25
   mib,8-. mib-. re16\tr [do32(re)]
   mib8-.[mib-.] fa16\tr mib32(fa)
   sol8\noBeam  lab16(sol fa mib)

   %28
   mib8 re sol16.[(sib32)]
   mib,8-. mib-. re16\tr [do32(re)]
   mib8-. mib-. fa16\tr [mib32(fa)]

   %31
   sol8\noBeam  lab16(fa mib re)
   mib4 r8
   sol4 do,8

   %34
   si16(do32 re) do8\noBeam r
   re4 mib8
   re4 r8

   %37
   sib!4 do8\mbreak
   do16.[(fa,32)] fa8 sol
   lab-. lab-. sib-.

   %40
   sol4 r8
   sol'4 do,8
   si16(do32 re) do8\noBeam r

   %43
   re4 mib8
   re4 r8
   sib!4 do8

   %46
   do16.[(fa,32)] fa8 sol\mbreak
   lab-. lab-. sib-.
   sol4 sib'8_\markup \italic"a mezza voce"

   %49
   mib,-. mib-. re16\tr[do32 re]
   mib8-. mib-. fa16\tr [mib32(fa)]
   sol8\noBeam lab16(sol fa mib)

   %52
   mib8 re sol16.[(sib32)]
   mib,8-. mib-. re16\tr [do32(re)]
   mib8-. mib-. fa16\tr [mib32(fa)]

   %55
   sol8\noBeam lab16(fa mib re)
   mib4 r8
   R4.

   %58
   r8 r16. mib32\f  sol16. mib32
   lab8-.\p lab-. sib16.[(lab32)]
   lab4(sol8)

   %61
   R4.
   r8 r16. mib32\f  sol16. mib32
   lab8-.\p lab-. sib16.[(lab32)]

   %64
   lab4(sol8)
   \grace fa16 mib(re32 mib) r16 mib-. mib-. mib-.
   \grace si'?16 do32(si! do16) r16 do-. do-. do-.\mbreak

   %67
   \grace do16 sib32(la sib16) r16 sib-. sib-. lab!-.
   fad8(sol) r
   \grace fa16 mib\f(re32 mib) r16 mib-. mib-. mib-.

   %70
   \grace si'?16 do32(si! do16) r16 do-. do-. do-.\mbreak
   \grace do16 sib32(la sib16) r16 re, fa re
   mib8-. mib-. re16\tr\p [do32(re)]

   %73
   mib8-. mib-.re16\tr[do32(re)]
   mib8-. mib-.re16\tr[do32(re)]
   mib8\noBeam <mib, sol,>\f <mib sol,>

   %76
   <mib sol,>4 r8\fermata

}

IIvlIIn = \relative do'' {

   r8
   sol16_\markup \italic"a mezza voce"-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.
   mib8 do'16[(sib lab sol)]

   %4
   sol8 fa r
   sol16-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.

   %7
   mib8\noBeam fa16(lab sol fa)
   mib4 r8
   R4.\mbreak

   %10
   r8 r16. sib'32\f re16. sib32
   sib4\p (do8)
   fa,4.

   %13
   R
   r8 r16. sib32\f re16. sib32
   sib4\p (do8)

   %16
   fa,4.
   r16 fa-. sib-. fa-. sib-. fa-.
   r sol-. sib-. sol-. sib-. sol-.

   %19
   r la-. do-. la-. do-. la-.\mbreak
   r sib fa sib re, fa
   r fa\f sib fa sib fa

   %22
   r sol sib sol sib sol
   r do la do la do
   sib4 r8

   %25
   sol16_\markup \italic"a mezza voce"-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.
   mib8 do'16[(sib lab sol)]

   %28
   sol8 fa r
   sol16-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.

   %31
   mib8\noBeam fa16(lab sol fa)
   mib-. sol-. mib-.sol-. mib-. sol-.
   mib-. sol-. mib-.sol-. mib-. sol-.

   %34
   fa sol mib sol mib sol
   si, sol si sol do sol
   si4 r8

   %37
   sol'4 lab8\mbreak
   lab16.[(re,32)] re8 mib
   fa-. fa-. sol-.

   %40
   mib16-. sol-. mib-.sol-. mib-. sol-.
   mib-. sol-. mib-.sol-. mib-. sol-.
   fa sol mib sol mib sol

   %43
   si, sol si sol do sol
   si4 r8
   sol'4 lab8

   %46
   lab16.[(re,32)] re8 mib
   fa-. fa-. sol-.
   mib4 sib'8_\markup \italic"a mezza voce"

   %49
   sol16-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.
   mib8 do'16[(sib lab sol)]

   %52
   sol8 fa r
   sol16-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.

   %55
   mib8\noBeam fa16(lab sol fa)
   mib4 r8\mbreak
   R4.

   %58
   r8 r16. mib'32\f sol16. mib32
   mib,4\p(fa8)
   sib,4.

   %61
   R
   r8 r16. mib'32\f sol16. mib32
   mib,4\p(fa8)

   %64
   sib,4.
   r16 sib-. mib-. sib-. mib-. sib-.
   r do-. mib-. do-. mib-. do-.\mbreak

   %67
   r re-. fa-. re-. fa-. re-.
   r mib sib mib sol, sib
   r sib\f mib sib mib sib

   %70
   r do mib do mib do
   r fa re fa re fa
   sol-.\p sib,-. sol'-. sib,-. lab'-. sib,-.

   %73
   sol'-. sib,-. sol'-. sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. lab'-. sib,-.
   sol' 8\noBeam <mib sol,>\f <mib sol,>

   %76
   <mib sol,>4 r8\fermata

}

IIvlan = \relative do' {

   r8
   sol'16_\markup \italic"a mezza voce"-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.
   mib8 do'16[(sib lab sol)]

   %4
   sol8 fa r
   sol16-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.

   %7
   mib8\noBeam fa16(lab sol fa)
   mib4 r8
   R4.\mbreak

   %10
   r8 r16. sib32\f re16. sib32
   sol4\p(la8)
   sib4.

   %13
   R
   r8 r16. sib32\f re16. sib32
   sol4\p(la8)

   %16
   sib4.
   r16 fa'-. sib-. fa-. sib-. fa-.
   r sol-. sib-. sol-. sib-. sol-.

   %19
   r la-. do-. la-. do-. la-.\mbreak
   r sib fa sib re, fa
   r fa\f sib fa sib fa

   %22
   r sol sib sol sib sol
   r do la do la do
   sib4 r8

   %25
   sol16_\markup \italic"a mezza voce"-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.
   mib8 do'16[(sib lab sol)]

   %28
   sol8 fa r
   sol16-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.

   %31
   mib8\noBeam fa16(lab sol fa)
   mib4 r8
   R4.*4

   %37
   mib,16\mf-. mib-. mib-. mib-. mib-. mib-.\mbreak
   mib-. mib-. mib-. mib-. mib-. mib-.
   mib-. mib-. mib-. mib-. mib-. mib-.

   %40
   mib4 r8
   R4.*4
   mib16-.\mf mib-. mib-. mib-. mib-. mib-.

   %46
   mib-. mib-. mib-. mib-. mib-. mib-.
   mib-. mib-. mib-. mib-. mib-. mib-.
   mib-. mib-. mib-. mib-. mib-. mib-.

   %49
   sol'-. _\markup\italic "a mezza voce" sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.
   mib8 do'16[(sib lab sol)]

   %52
   sol8 fa r
   sol16-. sib,-. sol'-.  sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. re-. sib-.

   %55
   mib8\noBeam fa16(lab sol fa)
   mib4 r8\mbreak
   R4.

   %58
   r8 r16. mib32\f sol16. mib32
   do4\p(re8)
   mib4.

   %61
   R
   r8 r16. mib32\f sol16. mib32
   do4\p(re8)

   %64
   mib4.
   r16 sib-. mib-. sib-. mib-. sib-.
   r do-. mib-. do-. mib-. do-.\mbreak

   %67
   r re-. fa-. re-. fa-. re-.
   r mib sib mib sol, sib
   r sib\f mib sib mib sib

   %70
   r do mib do mib do
   r fa re fa re fa
   sol-.\p sib,-. sol'-. sib,-. lab'-. sib,-.

   %73
   sol'-. sib,-. sol'-. sib,-. lab'-. sib,-.
   sol'-. sib,-. sol'-. sib,-. lab'-. sib,-.
   sol'8 mib\f mib

   %76
   mib4 r8\fermata

}

IIbcn = \relative do {

   r8
   mib4.~_\markup\italic"a mezza voce"
   mib~
   mib8 lab (la)

   %4
   sib sib, r
   mib4.~
   mib~

   %7
   mib8 lab, sib
   mib4 r8
   R4.\mbreak

   %10
   r8 r16. sib'32\f re16. sib32
   sol4\p(la8)
   sib4.

   %13
   R
   r8 r16. sib32\f re16. sib32
   sol4\p(la8)

   %16
   sib4.
   re,8 r r
   mib r r

   %19
   fa r r\mbreak
   sib r r
   re,16\f re re re re re

   %22
   mib mib mib mib mib mib
   fa fa fa fa fa fa
   sib,4 r8

   %25
   mib4.~_\markup\italic"a mezza voce"
   mib~
   mib8 lab (la)

   %28
   sib sib, r
   mib4.~
   mib~

   %31
   mib8 lab, sib
   mib4 r8
   r r do

   %34
   sol' do, r
   sol' sol sol
   sol4 r8

   %37
   R4.*4
   r8 r do,
   sol' do, r

   %43
   sol' sol sol
   sol4 r8
   R4.*4

   %49
   mib4.~_\markup\italic"a mezza voce"
   mib~
   mib8 lab (la)

   %52
   sib sib, r
   mib4.~
   mib~

   %55
   mib8 lab, sib
   mib4 r8 \mbreak
   R4.

   %58
   r8 r16. mib32\f sol16. mib32
   do4\p(re8)
   mib4.

   %61
   R
   r8 r16. mib32\f sol16. mib32
   do4\p(re8)

   %64
   mib4.
   sol,8 r r
   lab r r\mbreak

   %67
   sib r r
   mib r r
   sol,16\f sol sol sol sol sol

   %70
   lab lab lab lab lab lab
   sib sib sib sib sib sib
   mib4.\p~

   %73
   mib~
   mib~
   mib8 mib\f mib

   %76
   mib4 r8\fermata

}

IIbfn = \figuremode {
   \bassFigureExtendersOff
   \bassFigureStaffAlignmentUp



}

forma = {

   \time 3/8
   \tempo 4. = 40
   \partial 8 s8
   s4.*76
   \bar "|."

}


IIcrI = {
   \IIglobal
   \notypeset
   <<\IIcrIn \forma>>

}


IIcrII = {
   \IIglobal
   <<\IIcrIIn \forma>>

}


IIobI = {
   \IIglobal
   <<\IIobIn \forma>>

}


IIobII = {
   \IIglobal
   <<\IIobIIn \forma>>

}

IIvlI = {
   \IIglobal
   <<\IIvlIn \forma>>

}

IIvlII = {
   \IIglobal
   <<\IIvlIIn \forma>>

}


IIvla = {
   \IIglobal
   \clef alto
   <<\IIvlan \forma>>

}



IIbc = {
   \IIglobal
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


IIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
}


IIIcrIn = %\transpose do sib, {
\relative do'' {

   do4. mi8
   sol4 r
   r r8 re

   %4
   mi[mi mi] r
   do4. mi8
   sol4 r

   %7
   r r8 mi
   re4 r
   re4. re8\mbreak

   %10
   re2~
   re4 r
   R2

   %13
   re4. re8
   re2~
   re4 r

   %16
   R2
   re4 r\mbreak
   mi r

   %19
   re re8 re
   re4 r
   re r

   %22
   mi r
   re re8 re
   sol,4 r

   %25
   R2\mbreak
   r8 re'-.\soli re4-.
   R2

   %28
   r8 mi-. mi4-.
   R2*2
   mi8-.[mi-. mi-.] fa\staccatissimo

   %32
   re re re4
   R2
   r8 re-. re4-.

   %35
   R2
   r8 mi-. mi4-.
   R2*2

   %39
   mi8-.[mi-. mi-.] fa\staccatissimo
   re4 r
   do4.\ff mi8

   %42
   sol4 r
   r r8 re
   mi[mi mi] r

   %45
   do4. mi8
   sol4 r
   r r8 mi

   %48
   re4 r
   mi4. mi8
   re2

   %51
   mi4 r
   R2
   mi4. mi8

   %54
   re2\mbreak
   mi4 r
   R2

   %57
   do4 r
   do r
   mi8[mi re re]

   %60
   mi4 r
   do4 r
   do r

   %63
   mi8[mi re re]
   do4 r
   r re\mbreak

   %66
   mi r
   r re
   mi r8 re

   %69
   mi[re mi re]
   mi4 r8 re
   mi[re mi re]

   %72
   mi[do do do]
   do4 do
   do r\fermata

%}

}


IIIcrIIn = %\transpose do sib, {
\relative do'' {

   do,4. mi8
   sol4 r
   r r8 sol

   %4
   do[do do] r
   do,4. mi8
   sol4 r

   %7
   r r8 do
   sol4 r
   sol4. sol8\mbreak

   %10
   re'2~
   re4 r
   R2

   %13
   sol,4. sol8
   re'2~
   re4 r

   %16
   R2
   sol,4 r\mbreak
   do r

   %19
   re re8 re
   sol,4 r
   sol r

   %22
   do r
   re re8 re
   sol,4 r

   %25
   R2\mbreak
   r8 sol-.\soli sol4-.
   R2

   %28
   r8 do-. do4-.
   R2*2
   do8-.[do-- do-.] re\staccatissimo

   %32
   sol, sol sol4
   R2
   r8 sol-. sol4-.

   %35
   R2\mbreak
   r8 do-. do4-.
   R2*2

   %39
   do8-.[do-. do-.] re\staccatissimo
   sol,4 r
   do,4.\ff mi8

   %42
   sol4 r
   r r8 sol
   do[do do] r

   %45
   do,4. mi8\mbreak
   sol4 r
   r r8 do

   %48
   sol4 r
   do4. do8
   sol2

   %51
   do4 r
   R2
   do4. do8

   %54
   sol2\mbreak
   do4 r
   R2

   %57
   do4 r
   do r
   do8[do sol sol]

   %60
   do4 r
   do r
   do r

   %63
   do8[do sol sol]
   mi4 r
   r sol\mbreak

   %66
   do r
   r sol
   do r8 sol

   %69
   do[sol do sol]
   do4 r8 sol
   do[sol do sol]

   %72
   do[mi, mi mi]
   mi4 mi
   mi r \fermata

%}

}

IIIobIn = \relative do'' {

   sib4. \f re8
   fa4 r
   r r8 la

   %4
   sib[sib sib] r
   sib,4. re8
   fa4 r

   %7
   r r8 sib
   la4 r
   la4. fa8\mbreak

   %10
   fa(mi) mi r
   fa4 r
   R2

   %13
   la4. fa8
   fa(mi) mi r
   fa4 r

   %16
   R2
   fa4 r\mbreak
   fa r

   %19
   fa8[la sol sol]
   la4 r
   fa r

   %22
   fa r
   fa8 la sol sol
   fa4 r

   %25
   R2\mbreak
   r8 mib-.\soli mib4-.
   R2

   %28
   r8 re-. re4-.
   R2*2
   re8-.[re-. re-.] mib\staccatissimo

   %32
   do do do4
   R2
   r8 mib-. mib4-.

   %35
   R2\mbreak
   r8 re-. re4-.
   R2*2

   %39
   re8-.[re-. re-.] mib\staccatissimo
   do4 r
   sib4.\ff re8

   %42
   fa4 r
   r r8 la
   sib[sib sib] r

   %45
   sib,4. re8\mbreak
   fa4 r
   r r8 sib

   %48
   la4 r
   fa4. fa8
   fa2~

   %51
   fa4 r
   R2
   fa4. fa8

   %54
   fa2~\mbreak
   fa4 r
   R2

   %57
   fa4 r
   sol r
   re8[re do do]

   %60
   re4 r
   fa r
   sol r

   %63
   re8[re do do]
   sib4 fa'16\soli(sol) fa (sol)
   fa4 la\mbreak

   %66
   sib4 fa16(sol) fa (sol)
   fa4 la
   sib r8 la

   %69
   sib8[la sib la]
   sib4 r8 la
   sib[la sib la]

   %72
   sib[fa fa fa]
   fa4 fa
   fa r\fermata

}

IIIobIIn = \relative do'' {

   sib4.\f re8
   fa4 r
   r r8 mib

   %4
   re[re re] r
   sib4. re8
   fa4 r

   %7
   r r8 re
   do4 r
   do4. do8\mbreak

   %10
   sib2
   la4 r
   R2

   %13
   do4. do8
   sib2
   la4 r

   %16
   R2
   do4 r\mbreak
   re r

   %19
   la8[fa' mi mi]
   fa4 r
   do r

   %22
   re r
   la8[fa' mi mi]
   fa4 r

   %25
   R2\mbreak
   r8 do-.\soli do4-.
   R2

   %28
   r8 sib-. sib4-.
   R2*2
   sib8-.[sib-. sib-.] do\staccatissimo

   %32
   la8 la la4
   R2
   r8 do-. do4-.

   %35
   R2\mbreak
   r8 sib -.sib4-.
   R2*2

   %39
   sib8-.[sib-. sib-.] do\staccatissimo
   la4 r
   sib4.\ff re8

   %42
   fa4 r
   r r8 mib
   re8[re re] r

   %45
   sib4. re8\mbreak
   fa4 r
   r r8 re

   %48
   do4 r
   re4. re8
   mib2

   %51
   re4 r
   R2
   re4. re8

   %54
   mib2\mbreak
   re4 r
   R2

   %57
   sib4 r
   sib r
   sib8[sib la la]

   %60
   sib4 r
   sib r
   sib r

   %63
   sib8[sib la la]
   sib4 re16\soli(mib) re (mib)
   re4 do\mbreak

   %66
   re4 re16(mib) re (mib)
   re4 do
   re r8 mib

   %69
   re[mib re mib]
   re4 r8 mib
   re[mib re mib]

   %72
   re[re re re]
   re4 re
   re r\fermata

}

IIIvlIn = \relative do'' {


   <sib re,>4. re8
   fa4 r
   sib8-.[sib-. sib-. la\staccatissimo]

   %4
   sib[sib sib] r
   <sib, re,>4. re8
   fa4 r

   %7
   fa8-.[fa-. fa-.] \stemUp <sib re,>
   <la do,>4 r
   <la la,>4. \stemNeutral fa8\mbreak

   %10
   fa8\sf(mi) mi r
   fa4.\p la16 fa
   sol4 r

   %13
   \once\stemUp <la la,>4.\f fa8
   fa\sf(mi) mi r
   fa4.\p la16 fa

   %16
   sol4 r
   fa\f do'16 la do la\mbreak
   fa4 re'16 sib re sib

   %19
   la8 do sib16 sol sib sol
   la4 r
   fa do'16 la do la

   %22
   fa4 re'16 sib re sib
   la8 do sib16 sol sib sol
   fa4 r

   %25
   fa8-.\p[fa-. fa-.] sol\staccatissimo\mbreak %fine p. 29
   mib4 r
   mib8-.[mib-. mib-.] fa\staccatissimo

   %28
   re4 r
   fa8-.[fa-. fa-.] sol\staccatissimo
   mib-.[mib-. mib-.] fa\staccatissimo

   %31
   re-.[re-. re-.] mib\staccatissimo
   do4 r
   fa8-.[fa-. fa-.] sol\staccatissimo

   %34
   mib4 r
   mib8-.[mib-. mib-.] fa\staccatissimo\mbreak
   re4 r

   %37
   fa8-.[fa-. fa-.] sol\staccatissimo
   mib-.[mib-. mib-.] fa\staccatissimo
   re-.[re-. re-.] mib\staccatissimo

   %40
   do4 r
   <sib re,>4.\ff re8
   fa4 r

   %43
   sib8-.[sib-. sib-. la\staccatissimo]
   sib[sib sib] r
   <sib, re,>4. re8\mbreak

   %46
   fa4 r
   fa8-.[fa-. fa-.] <<sib\\re,>>
   \once\stemUp <la' do,>4 r

   %49
   re4. sib8
   sib\sf(la) la r
   sib4.\p re16 sib

   %52
   do4 r
   re4.\f sib8
   sib\sf(la) la r\mbreak

   %55
   sib4.\p re16 sib
   do4 r
   \once\stemUp <sib sib,>4\f fa16 re fa re

   %58
   \once\stemUp <sib' sib,>4 sol16 mib sol mib
   re8 fa mib16 do mib do
   re4 r

   %61
   \once\stemUp <sib' sib,>4 fa16 re fa re
   \once\stemUp  <sib' sib,>4 sol16 mib sol mib
   re8 fa mib16 do mib do

   %64
   sib4 r
   r \stemUp <la' do, fa,>\mbreak
   <sib re, fa,> r

   %67
   r <la do, fa,>
   <sib re, fa,> r8 \stemNeutral la16(sol32 la)
   sib8\noBeam la16 (sol32 la) sib8\noBeam  la16 (sol32 la)

   %70
   sib4 r8 la16(sol32 la)
   sib8\noBeam  la16 (sol32 la) sib8\noBeam la16 (sol32 la)
   sib8 <sib, re,>[<sib re,> <sib re,>]

   %73
   <sib re,>4 \once\stemUp <sib' sib, re,>
   <sib, re,> r\fermata

}

IIIvlIIn = \relative do'' {

   <sib re,>4. re8
   fa4 r
   re8-.[re-. re-. mib\staccatissimo]

   %4
   re[re re] r
   <sib re,>4. re8
   \parenthesize fa4 r

   %7
   re8-.[re-. re-.] <<sib'\\re,>>
   la'16 do, do do do do do do
   la do la do la do la do\mbreak

   %10
   sib\sf do sib do sib do sib do
   la\p do la do fa, la fa la
   mi \noBeam do'\f do do do do do do

   %13
   la do la do la do la do
   sib\sf do sib do sib do sib do
   la\p do la do fa, la fa la

   %16
   mi4 r
   fa'16\f fa fa fa fa fa fa fa\mbreak
   fa fa fa fa fa fa fa fa

   %19
   fa8 la sol16 mi sol mi
   fa4 r
   fa16 fa fa fa fa fa fa fa

   %22
   fa fa fa fa fa fa fa fa
   fa8 la sol16 mi sol mi
   fa4 r

   %25
   re,8-.\p [re-. re-.] mib\staccatissimo\mbreak
   do4 r
   do8-.[do-. do-.] re\staccatissimo

   %28
   sib4 r
   re8-. [re-. re-.] mib\staccatissimo
   do8-.[do-. do-.] re\staccatissimo

   %31
   sib-.[sib-. sib-.] do\staccatissimo
   la4 r
   re8-. [re-. re-.] mib\staccatissimo\mbreak

   %34
   do4 r
   do8-.[do-. do-.] re\staccatissimo
   sib4 r

   %37
   re8-. [re-. re-.] mib\staccatissimo
   do8-.[do-. do-.] re\staccatissimo
   sib-.[sib-. sib-.] do\staccatissimo

   %40
   la4 r
   <sib' re,>4.\ff re8
   fa4 r

   %43
   re8-.[re-. re-. mib\staccatissimo]
   re[re re] r
   <sib re,>4. re8

   %46
   fa4 r
   re8-.[re-. re-.] <<sib'\\re,>>
   la'16 fa fa fa fa fa fa fa

   %49
   re fa re fa re fa re fa
   mib\sf fa mib fa mib fa mib fa
   re\p fa re fa sib, re sib re

   %52
   la fa'\f[fa fa] fa fa fa fa
   re fa re fa re fa re fa
   mib\sf fa mib fa mib fa mib fa\mbreak

   %55
   re\p fa re fa sib, re sib re
   la4 r
   sib16\f sib sib sib  sib sib sib sib

   %58
   sib sib sib sib sib sib sib sib
   sib8 re do16 la do la
   sib4 r

   %61
   sib16 sib sib sib sib sib sib sib
   sib sib sib sib sib sib sib sib
   sib8 re do16 la do la

   %64
   sib4 r
   r \stemUp <la' do, fa,>\mbreak
   <sib re, fa,> r

   %67
   r <do, fa,>
   <re fa,>16 <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <mib fa,> <mib fa,>
   <re fa,> <re fa,> <mib fa,> <mib fa,> <re fa,> <re fa,> <mib fa,> <mib fa,>

   %70
   <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <re fa,> <mib fa,> <mib fa,>
   <re fa,> <re fa,> <mib fa,> <mib fa,> <re fa,> <re fa,> <mib fa,> <mib fa,>
   <re fa,>8 <sib re,>[<sib re,> <sib re,>]

   %73
   <sib re,>4 \once\stemUp <sib' sib, re,>
   <sib, re,> r\fermata

}

IIIvlan = \relative do' {

   sib4. re8
   fa4 r
   sib8-.[sib-. sib-. do\staccatissimo]
   sib[sib sib] r
   sib,4. re8
   fa4 r
   sib8-.[sib-. sib-. sib,-.]
   fa'16 do' do do do do do do
   la do la do la do la do\mbreak
   sib\sf do sib do sib do sib do
   la\p do la do fa, la fa la
   mi \noBeam do'\f do do do do do do

   %13
   la do la do la do la do
   sib\sf do sib do sib do sib do
   la\p do la do fa, la fa la

   %16
   mi8 do'\f[do sib]
   la8 [la la la]\mbreak
   sib[sib sib sib]

   %19
   do[do do, do]
   fa[la do sib]
   la[la la la]

   %22
   sib[sib sib sib]
   do[do do, do]
   fa4 r

   %25
   re8-.\p [re-. re-.] mib\staccatissimo\mbreak
   do4 r
   do8-.[do-. do-.] re\staccatissimo

   %28
   sib4 r
   re8-. [re-. re-.] mib\staccatissimo
   do8-.[do-. do-.] re\staccatissimo

   %31
   sib-.[sib-. sib-.] do\staccatissimo
   la4 r
   re8-. [re-. re-.] mib\staccatissimo\mbreak

   %34
   do4 r
   do8-.[do-. do-.] re\staccatissimo
   sib4 r

   %37
   re8-. [re-. re-.] mib\staccatissimo
   do8-.[do-. do-.] re\staccatissimo
   sib-.[sib-. sib-.] do\staccatissimo

   %40
   la4 r
   sib4.\ff re8
   fa4 r

   %43
   sib8-.[sib-. sib-. do\staccatissimo]
   sib[sib sib] r
   sib,4. re8

   %46
   fa4 r
   sib8-.[sib-. sib-. sib,-.]
   fa'16 fa fa fa fa fa fa fa

   %49
   re fa re fa re fa re fa
   mib\sf fa mib fa mib fa mib fa
   re\p fa re fa sib, re sib re

   %52
   la fa'\f[fa fa] fa fa fa fa
   re fa re fa re fa re fa
   mib\sf fa mib fa mib fa mib fa\mbreak

   %55
   re\p fa re fa sib, re sib re
   la8\f fa'[fa mib]
   re[re re re]

   %58
   mib[mib mib mib]
   fa [fa fa, fa]
   sib[re fa mib]

   %61
   re[re re re]
   mib[mib mib mib]
   fa [fa fa, fa]

   %64
   sib4 <<
      {
         fa'16 sol fa sol
         fa4 la\mbreak
         sib fa16 sol fa sol

         %67
         fa4 la
         sib
      }\\{
         re,16 mib re mib
         re4 do\mbreak
         re re16 mib re mib
         re4 do
         re
      }
   >> r8 fa
   sib[mib, sib' mib,]

   %70
   sib'4 r8 fa
   sib8[fa sib fa]
   sib[sib, sib sib]

   %73
   sib4 sib'
   sib, r\fermata


}

IIIbcn = \relative do {

   sib4.\f re8
   fa4 r
   r r8 fa

   %4
   sib[sib sib] r
   sib,4. re8
   fa4 r

   %7
   r r8 sib
   fa4 r
   fa4. la8\mbreak

   %10
   sol\sf[do, sol' do,]
   fa4\p fa,
   do' r

   %13
   fa4.\f la8
   sol\sf[do, sol' do,]
   fa4\p fa,

   %16
   do'8[do'\f do sib]
   la[la la la]\mbreak
   sib[sib sib sib]

   %19
   do[do do, do]
   fa[la do sib]
   la[la la la]

   %22
   sib[sib sib sib]
   do[do do, do]
   fa4 r

   %25
   R2\mbreak
   fa4\p r
   R2

   %28
   fa4 r
   fa r
   fa r

   %31
   fa r
   fa r
   fa r

   %34
   R2
   fa4 r\mbreak
   fa r

   %37
   fa r
   fa r
   fa r

   %40
   fa r
   sib,4.\ff re8
   fa4 r

   %43
   r r8 fa
   sib[sib sib] r
   sib,4. re8

   %46
   fa4 r
   r r8 sib
   fa4 r

   %49
   sib4.\f re8
   do\sf[fa, do' fa,]
   sib4\p sib,

   %52
   fa' r
   sib4.\f re8
   do\sf[fa, do' fa,]

   %55
   sib4\p sib,
   fa'8\noBeam  fa\f[fa mib]
   re[re re re]

   %58
   mib[mib mib mib]
   fa [fa fa, fa]
   sib[re fa mib]

   %61
   re[re re re]
   mib[mib mib mib]
   fa [fa fa, fa]

   %64
   sib4 r
   r fa'\mbreak
   sib r

   %67
   r fa
   sib r8 fa
   sib8[fa sib fa]

   %70
   sib4 r8 fa
   sib8[fa sib fa]
   sib[sib, sib sib]

   %73
   sib4 sib'
   sib, r\fermata

}

IIIbfn = \figuremode {
   \bassFigureExtendersOff
   \bassFigureStaffAlignmentUp



}

forma = {

   \time 2/4
   \tempo 2 = 65
   s2*74
   \bar "|."

}


IIIcrI = {
   \IIIglobal
   %\notypeset
   <<\IIIcrIn \forma>>

}


IIIcrII = {
   \IIIglobal
   <<\IIIcrIIn \forma>>

}


IIIobI = {
   \IIIglobal
   <<\IIIobIn \forma>>

}


IIIobII = {
   \IIIglobal
   <<\IIIobIIn \forma>>

}

IIIvlI = {
   \IIIglobal
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   \IIIglobal
   <<\IIIvlIIn \forma>>

}


IIIvla = {
   \IIIglobal
   \clef alto
   <<\IIIvlan \forma>>

}



IIIbc = {
   \IIIglobal
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
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

    \markup\huge "[1.] Allegro con spirito"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"french horn"
                    %\key sib\major
                    \IcrI
                >>

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni in B"}
                    \set Staff.midiInstrument = #"french horn"
                    %\key sib\major
                    \IcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Oboè"}
                    \set Staff.midiInstrument = #"oboe"
                    \key sib\major
                    \IobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \key sib\major
                    \IobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \key sib\major
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                    \key sib\major
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
                \key sib\major
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Violone""Fagotto"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
                 \key sib\major
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge "[2.] Andante moderato"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff
            <<
                \new Staff
                <<
                    %\key mib\major
                    \IIcrI
                >>

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni""in Elafà"}
                    \set Staff.midiInstrument = #"french horn"
                    %\key mib\major
                    \IIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Oboè"}
                    \set Staff.midiInstrument = #"oboe"
                    \key mib\major
                    \IIobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \key mib\major
                    \IIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \key mib\major
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                    \key mib\major
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \IIvla
                \key mib\major
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Violone""Fagotto"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
                 \key mib\major
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge "[3.] Allegro moderato"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"french horn"
                    %\key sib\major
                    \IIIcrI
                >>

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni in B"}
                    \set Staff.midiInstrument = #"french horn"
                    %\key sib\major
                    \IIIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Oboè"}
                    \set Staff.midiInstrument = #"oboe"
                    \key sib\major
                    \IIIobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \key sib\major
                    \IIIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \key sib\major
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                    \key sib\major
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
                \key sib\major
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Violone""Fagotto"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
                 \key sib\major
            >>
        >>

        \layout {

            indent = 1.7\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }
