\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

pf = #(make-dynamic-script "pf")

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

dolce = _\markup\italic "dol."

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic \center-align"Tutti"

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


Iglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IvlIn =  \relative do'' {

    r8 fa sib4~sib8 do la do
    re4 r8 la sol2\tr
    fa4 r8 fad sol sib la do

    %4
    sib re, sol4~sol8 la fa sol
    mi2\tr re
    r8 sol16(fa) mib8 re\tr mib sol, r4

    %7
    r8 fa'16 mib re8 do\tr re fa, r re'
    do2\tr r8 sib fa'4~
    fa8 sol mi sol la fa\solo sib re,

    %10
    do sib' la4\tr sib,8 re sol sib
    mi, do fa4~fa8 re sol mi\mbreak
    la fa sib sol do mi, fa sib

    %13
    la4 sol fa r
    R1*3
    r2 r8 sol16(fa) mi8 re\tr

    %18
    mi mi, r4 r8 fa'16(mib) re8 do\tr
    re sib, r4 r8 sib' mib\solo sol,
    fa re' sol do,\mbreak fa sib, mib la,

    %21
    re4 r r2
    r r8 do fa4~
    fa8 sol mi sol la la, fa' re

    %24
    do2\tr sib8 fa'16 mib re8\solo do
    <<{s8 sib' sib la sib4}\\{re,8 re do do re [sib]}>> r8 re'
    do la, do fa\mbreak sib re, mi sib'

    %27
    la fa, r la' sol16(fad sol la) fa(mi fa sol)
    mi(do si do) mi sol fa mi la sib? la sol fa mi re do
    si fa (sol, fa' si) re do si \mbreak mi do(sol do mi) sol fa mi

    %30
    la fa sol la sol mi fa sol fa re mi fa mi do re mi
    re do si la sol si do re si do re si sol si do re\mbreak
    mi fa mi re do mi fa sol mi fa sol mi do mi fa sol

    %33
    la si? la sol fa la, sib! do la sib do la fa la sib do
    re mib re do sib re, mib fa\mbreak re mib fa re sib re mib fa
    sol8 mib r4 r2

    %36
    R1*7
    r2 r8 fa' sib4~
    sib8 do la do re4 r8 sib

    %45
    la2\tr sol8 sol, mib'4~
    mib re~re8 sol, do4~\mbreak
    do sib4. mib,8 lab4~

    %48
    lab sol fa\tr r8 sib
    sol sib' sol mib\solo fa16(mib re do) sib8 sib'
    sol4 r8 sol lab4 fa\tr

    %51
    r8 mib sol la sib fa sib4~
    sib la sib r8 re\mbreak
    re do16 si do8 mi,? fad do' re, do'

    %54
    do re16 do re do sib la sib8 re, sol,4
    R1
    r2 r4 r8 sol'

    %57
    fa16 re sib re fa re sib re fa re sib re fa re sib re\mbreak
    mib do la do mib do la do mib do la do mib do la do
    re sib fa sib re sib fa8 r2

    %60
    R1
    r4 r8 do'' do16 sib la sib do sib do la
    sib4 sib,8 sol'\mbreak sib16 la sol la sib la sib sol

    %63
    do4 mi,8 do' do16 sib la sib do sib do la
    re do sib do re do re sib mib re do re mib re mib do
    fa8 fa, sib4~sib8 do la do\mbreak

    %66
    re4 r8 la sol2\tr
    fa4 r8 fad sol sib la do
    sib re, sol4. la8 fa sol

    %69
    mi2\tr re
    r8 sol16 fa mib8 re\tr mib sol, r4
    r8 fa'16 mib re8 do\tr re fa, r re'\mbreak

    %72
    do2\tr r8 sib fa'4~
    fa8 sol mi sol la fa sib4~
    sib la4. re,8 sol4~

    %75
    sol fa4. sib,8 mib4~
    mib re do2\tr
    sib4 r r2

}

IvlIIn = \relative do'' {

    R1
    r8 sib fa'4~fa8 sol mi sol
    la la, la la sib re re fad

    %4
    re la sol sib la dod re4~
    re8 mi do!4~do8 re16 do sib8 la\mbreak
    sib re,r4 r8 do'16 sib la8 sol

    %7
    la do, r4 r8 fa' sib4~
    sib8 do la do re4 r8 la
    sol2\tr fa4 r

    %10
    R1*3
    r2 r8 do fa\solo la,
    sol fa' mi4\tr fa,8 la re fa\mbreak

    %15
    si, sol do4~do8 la re si
    mi do fa re sol si, do fa
    mi4 re\tr do r

    %18
    r8 do16\tu sib la8 sol la do, r4
    r8 sib'16 lab sol8 fa\mbreak sol sib, r4
    R1

    %21
    r8 fa'' sib re, do la' re sol,
    do fa, sib mi, la4 r
    r2 r8 fa sib4\parentSlur (

    %24
    sib8) do la do re re, r4
    R1*10\mbreak
    r8 sib16\solo lab sol8 fa <<{r8 mib' mib re

                          %36
                          mib4}\\{sol,8 sol fa fa
                                  sol [mib]}>> r8 sol' fa re, fa sib
    mib sol, la mib' re sib, r8 re'
    do16 si do re sib la sib do la fa mi fa la do sib la\mbreak

    %39
    re mib re do sib la sol fa mi! do' sol do mi, sol fa mi
    la fa do(fa la) do sib la re sib do re do la sib do
    sib sol la sib la fa sol la\mbreak sol fa mi re do mi fa sol

    %42
    mi fa sol mi do mi fa sol la sib la sol fa la sib do
    la sib do la fa la sib do re4 r8 re\tu
    do2\tr  sib8 re sol4~\mbreak

    %45
    sol8 la fad la sib4 r8 sib,
    do lab fa sib sol4 r8 sol
    lab fa re sol mib4 r8 mib

    %48
    fa re mib2 re4
    mib r8 sol'\soli lab4 fa\tr
    r8 sib sol mib fa16 mib re do sib8 sib'\mbreak

    %51
    sol4 r r8 sib, do re
    mib16 fa re mib do re mib fa re8(do) sib4
    R1

    %54
    r2 r4 r8 sib'
    sib lab16 sol lab8 do, re(lab') sib, lab'
    lab sib16(lab) sib(lab) sol(fa) sol8 sib, mib,4\mbreak

    %57
    R1*2
    r4 r8 sib'' la16 fa do fa la fa do fa
    la fa do fa la fa do fa sol mi do mi sol mi do mi

    %61
    sol mi do mi sol mi do mi la4 fa,8 fa'\mbreak
    fa16 mib re mib fa mib fa re sol4 \once\stemUp mib,8 sol'
    sol16 fa mi! fa sol fa sol mi la sol fa sol la sol la fa

    %64
    sib la sol la sib la sib sol do sib la sib do sib do la\mbreak
    re4 r r2
    r8 sib,\tu fa'4~ fa8 sol mi sol

    %67
    la la, la la sib re re fad
    re la sol sib la dod re4~
    re8 mi  do!4~do8 re16 do sib8 la

    %70
    sib re, r4 r8 do'16 sib la8 sol\mbreak
    la do, r4 r8 fa' sib4~
    sib8 do la do re4 r8 la

    %73
    sol2\tr fa4 r8 fa
    sol mib do fa re4 r8 re
    mib do la re sib4 r8 sib

    %76
    do la sib2 la4
    sib r r2

}


IvlIrn =  \relative do'' {

    r8 fa sib4~sib8 do la do
    re4 r8 la sol2\tr
    fa4 r8 fad sol sib la do

    %4
    sib re, sol4~sol8 la fa sol
    mi2\tr re
    r8 sol16(fa) mib8 re\tr mib sol, r4

    %7
    r8 fa'16 mib re8 do\tr re fa, r re'
    do2\tr r8 sib fa'4~
    fa8 sol mi sol la4 r

    %10
    R1*7
    r2 r8 sol16 (fa) mi8 re\tr

    %18
    mi mi, r4 r8 fa'16(mib) re8 do\tr
    re sib, r4 r2
    R1*2

    %22
    r2 r8 do' fa4~
    fa8 sol mi sol la la, fa' re
    do2\tr sib4 r

    %25
    R1*18
    r2 r8 fa' sib4~
    sib8 do la do re4 r8 sib

    %45
    la2\tr sol8 sol, mib'4~
    mib re~re8 sol, do4~\mbreak
    do sib4. mib,8 lab4~

    %48
    lab sol fa\tr r8 sib
    sol4 r r2
    R1*15

    %65
    r8 fa' sib4~sib8 do la do\mbreak
    re4 r8 la sol2\tr
    fa4 r8 fad sol sib la do
    sib re, sol4. la8 fa sol

    %69
    mi2\tr re
    r8 sol16 fa mib8 re\tr mib sol, r4
    r8 fa'16 mib re8 do\tr re fa, r re'\mbreak

    %72
    do2\tr r8 sib fa'4~
    fa8 sol mi sol la fa sib4~
    sib la4. re,8 sol4~

    %75
    sol fa4. sib,8 mib4~
    mib re do2\tr
    sib4 r r2

}

IvlIIrn = \relative do'' {

    R1
    r8 sib fa'4~fa8 sol mi sol
    la la, la la sib re re fad

    %4
    re la sol sib la dod re4~
    re8 mi do!4~do8 re16 do sib8 la\mbreak
    sib re,r4 r8 do'16 sib la8 sol

    %7
    la do, r4 r8 fa' sib4~
    sib8 do la do re4 r8 la
    sol2\tr fa4 r

    %10
    R1*8
    r8 do16 sib la8 sol la do, r4
    r8 sib'16 lab sol8 fa\mbreak sol sib, r4

    %20
    R1*3
    r2 r8 fa'' sib4~
    sib8 do la do re re, r4

    %25
    R1*18
    r2 r4 r8 re
    do2\tr  sib8 re sol4~\mbreak

    %45
    sol8 la fad la sib4 r8 sib,
    do lab fa sib sol4 r8 sol
    lab fa re sol mib4 r8 mib

    %48
    fa re mib2 re4
    mib r r2
    R1*16
    r8 sib' fa'4~ fa8 sol mi sol

    %67
    la la, la la sib re re fad
    re la sol sib la dod re4~
    re8 mi  do!4~do8 re16 do sib8 la

    %70
    sib re, r4 r8 do'16 sib la8 sol\mbreak
    la do, r4 r8 fa' sib4~
    sib8 do la do re4 r8 la

    %73
    sol2\tr fa4 r8 fa
    sol mib do fa re4 r8 re
    mib do la re sib4 r8 sib

    %76
    do la sib2 la4
    sib r r2

}

Ivlan = \relative do'{

    R1*2
    r4 r8 do re4 la
    sol r8 sib' mi,!4 la8 sib

    %5
    la4 r8 la la4 re,
    r8 re sol sol, r sol' do do,
    r do fa fa, r4 r8 fa'

    %8
    sol mib do fa fa4 r8 do'\mbreak
    re sib sol do do4 r
    R1*7

    %17
    r2 r8 sol do si
    r8 sol do do, r do fa fa,
    r fa' sib sib, r2

    %20
    R1*2
    r2 r4 r8 la'
    sol2\tr fa4 r8 fa

    %24
    sol mib do fa fa4 r\mbreak
    R1*18
    r2 r4 r8 fa

    %44
    sol mib do fa fa4 r8 re
    mib do la re re4 r8 sol
    fa4 fa mib r8 mib

    %47
    re4 re do r8 do'
    sib4 sib8 do fa,4 sib,
    sib r r2

    %50
    R1*15\mbreak
    r4 r8 fa' sol  mib do fa
    re4 r8 do re sib sol do

    %67
    do4 r8 do re4 la
    sol r8 sib' mi,!4 la8 sib
    la4 r8 la la4 re,

    %70
    r8 re sol sol, r sol' do do,
    r do fa fa, r4 r8 fa'\mbreak
    sol mib do fa fa4 r8 do'

    %73
    re sib sol do do4 r8 re
    do4 do sib r8 sib
    la4 la sol r8 sol

    %76
    fa4 fa8 sol do,4 fa
    fa r r2

}

Icbn = \relative do {



    sib4 r8 re mib do fa fa,
    sib4 r8 la' sib sol do do,
    fa la re do sib sol fad re

    %4
    sol fa mi re dod la re sol,
    la4 r8 la' fad re r fad\mbreak
    sol sol, r sol' do do, r do

    %7
    fa fa, r fa' sib sib, r re
    mib do fa fa, sib4 r8 la'
    sib sol do do, fa4 re8 mib

    %10
    fa4 fa,8 fa' re sib sib'4~
    sib la\mbreak sib mi,!
    fa sol la r8 sib

    %13
    do4 do, fa la,8 sib
    do4 r8 do' la fa r fa
    fa4 mi fa si,

    %16
    do re mi r8 fa
    sol4 sol, do r8 sol'
    do do, r do\mbreak fa fa, r fa'

    %19
    sib sib, r sib mib4 r8 mib
    sib'4 mib, re la
    sib r8 sib fa'4 sib

    %22
    la sol fa r8 la
    sib sol do do, r fa re sib
    mib do fa fa, sib4 r8 fa'\mbreak

    %25
    sib re, mib fa sib sib,16 la sib8 sib'
    la4 r8 la sol4 do,
    fa8 fa16 sol la8 fa mi4 re

    %28
    do r8 do fa4 r8 fa
    sol4 sol, do r8 do
    fa4 mi re do

    %31
    sol' r sol, r
    do4 r\mbreak do' r
    fa, r fa r

    %34
    sib r sib, r
    mib r8 sib mib sol lab sib
    mib, mib'16 re mib8 mib, re4 r8 re

    %37
    do4 fa sib,8 sib'16 do re8 sib
    la4 sol fa r8 fa
    sib4 r8 sib, do4 do\mbreak

    %40
    fa r8 fa sib4 la
    sol fa do r
    do r fa r

    %43
    fa r sib, r8 re
    mib do fa fa, sib4 r8 sib
    do la re re, sol4 r8 sol'

    %46
    lab fa sib sib, mib4 r8 mib
    fa re sol sol,\mbreak do4 r8 do
    re sib mib lab, sib4 sib

    %49
    mib mib2 re4
    mib mib2 re4
    mib?4 r8 mib re4 r8 re

    %52
    do4 fa sib,8 do re sib
    mib4 r8 do re4 r8 mi?
    fad4 re sol8 la sib sol\mbreak

    %55
    do4. lab8 sib4 r8 do
    re4 sib mib, r8 mib
    re4 sib sib' re,

    %58
    do do' la fa
    sib sib, fa' r
    fa r8 fa mi4 do

    %61
    r8 do' do do, fa4 r
    sib, r mib r
    mi! r\mbreak fa4 r

    %64
    R1
    r4 r8 re mib do fa fa,
    sib4 r8 la' sib sol do do,

    %67
    fa la re do sib sol fad re
    sol fa! mi re dod la re sol,
    la4 r8 la' fad re r fad?\mbreak

    %70
    sol sol, r sol' do do, r do
    fa fa,r fa' sib sib, r re
    mib do fa fa, sib4 r8 la'

    %73
    sib sol do do, fa4 r8 re
    mib do fa fa, sib4 r8 sib'
    do la re re,\mbreak sol4 r8 sol

    %76
    la fa sib mib, fa4 fa,
    sib4 r r2

}



IbfIn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <6 5>
  s4 s8 <6> <6>2
  <6>4 s8 <4+> <6>2
  s4 s8 <6> <6>2
  <5 4>8 <3> s4 <6 5>2
  s2 <_->
  s2 s4 s8 <5>
  <5>1
  <5>2 s4 <6> s2 <6>
  <2>4 <6> s2
  s1
  s2 s4 <6>
  s2 <6>
  <4! 2>1
  s
  <4>4 <3> s2
  s1  %%% inizio 4to sistema
  s
  s2 s4 <_->
  s1*2
  <6 5>2 s4 <6>
  <6 5>1
  s4 <6 5> s2
  <6>1
  s1*2
  <_!>1
  s
  <_!>2 <_!>
  s1*3
  s2 s8 <6-> s4
  s1
  <_->
  s1*6
  <5 6>1
  <6 5>4 <_+> s2
  <6 5>1
  <6 5>2 <_->
  <6 5->2 <4>4 <3>
  s <4 2> s2
  s4 s <2> s
  s2<6>
  <7 _->1
  <7>8 <6> s <_!> <_+>2
  <5->1
  <7>4 <6-> s s8 <6->
  <5->4 s4 s2
  s1
  <_->2 <5->4 <7->
  s1*6
  s4 s8 <6> <5>2
  s4 s8 <6> <6 5>2
  s8 <6> s <4+> s8 <3> s4
  s4 s8 <6> <6 5>2
  <4>8 <3> s4 <6 5->2
  s <_->
  s1
  <6 5>2 s4 s8 <6>
  <6 5>1
  <6 5>2 <7>4 s8 <6>
  <6 5 _->4 <_-> <7> s8 <6->
  <6 5->2 <4>4 <3>

}

Ibcn = \relative do {

    sib4 r8 re mib do fa fa,
    sib4 r8 la' sib sol do do,
    fa la re do sib sol fad re

    %4
    sol fa mi re dod la re sol,
    la4 r8 la' fad re r fad\mbreak
    sol sol, r sol' do do, r do

    %7
    fa fa, r fa' sib sib, r re
    mib do fa fa, sib4 r8 la'
    sib sol do do, fa4 re8 mib

    %10
    fa4 fa,8 fa' re sib sib'4~
    sib la\mbreak sib mi,!
    fa sol la r8 sib

    %13
    do4 do, fa la,8 sib
    do4 r8 do' la fa r fa
    fa4 mi fa si,

    %16
    do re mi r8 fa
    sol4 sol, do r8 sol'
    do do, r do\mbreak fa fa, r fa'

    %19
    sib sib, r sib mib4 r8 mib
    sib'4 mib, re la
    sib r8 sib fa'4 sib

    %22
    la sol fa r8 la
    sib sol do do, r fa re sib
    mib do fa fa, sib4 r8 fa'\mbreak

    %25
    sib re, mib fa sib sib,16 la sib8 sib'
    la4 r8 la sol4 do,
    fa8 fa16 sol la8 fa mi4 re

    %28
    do r8 do fa4 r8 fa
    sol4 sol, do r8 do
    fa4 mi re do

    %31
    sol' r sol, r
    do4 r\mbreak do' r
    fa, r fa r

    %34
    sib r sib, r
    mib r8 sib mib sol lab sib
    mib, mib'16 re mib8 mib, re4 r8 re

    %37
    do4 fa sib,8 sib'16 do re8 sib
    la4 sol fa r8 fa
    sib4 r8 sib, do4 do\mbreak

    %40
    fa r8 fa sib4 la
    sol fa do r
    do r fa r

    %43
    fa r sib, r8 re
    mib do fa fa, sib4 r8 sib
    do la re re, sol4 r8 sol'

    %46
    lab fa sib sib, mib4 r8 mib
    fa re sol sol,\mbreak do4 r8 do
    re sib mib lab, sib4 sib

    %49
    mib mib2 re4
    mib mib2 re4
    mib?4 r8 mib re4 r8 re

    %52
    do4 fa sib,8 do re sib
    mib4 r8 do re4 r8 mi?
    fad4 re sol8 la sib sol\mbreak

    %55
    do4. lab8 sib4 r8 do
    re4 sib mib, r8 mib
    re4 sib sib' re,

    %58
    do do' la fa
    sib sib, fa' r
    fa r8 fa mi4 do

    %61
    r8 do' do do, fa4 r
    sib, r mib r
    mi! r\mbreak fa4 r

    %64
    R1
    r4 r8 re mib do fa fa,
    sib4 r8 la' sib sol do do,

    %67
    fa la re do sib sol fad re
    sol fa! mi re dod la re sol,
    la4 r8 la' fad re r fad?\mbreak

    %70
    sol sol, r sol' do do, r do
    fa fa,r fa' sib sib, r re
    mib do fa fa, sib4 r8 la'

    %73
    sib sol do do, fa4 r8 re
    mib do fa fa, sib4 r8 sib'
    do la re re,\mbreak sol4 r8 sol

    %76
    la fa sib mib, fa4 fa,
    sib4 r r2

}

IbfIIn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <6 5>
  s4 s8 <6> <6>2
  <6>4 s8 <4+> <6>2
  s4 s8 <6> <6>2
  <5 4>8 <3> s4 <6 5>2
  s2 <_->
  s2 s4 s8 <5>
  <5>1
  <5>2 s4 <6> s2 <6>
  <2>4 <6> s2
  s1
  s2 s4 <6>
  s2 <6>
  <4! 2>1
  s
  <4>4 <3> s2
  s1  %%% inizio 4to sistema

  s
  s2 s4 <_->
  s1*2
  <6 5>2 s4 <6>
  <6 5>1
  s4 <6 5> s2
  <6>1
  s1*2
  <_!>1
  s
  <_!>2 <_!>
  s1*3
  s2 s8 <6-> s4
  s1
  <_->
  s1*6
  <5 6>1
  <6 5>4 <_+> s2
  <6 5>1
  <6 5>2 <_->
  <6 5->2 <4>4 <3>
  s <4 2> s2
  s4 s <2> s
  s2<6>
  <7 _->1
  <7>8 <6> s <_!> <_+>2
  <5->1
  <7>4 <6-> s s8 <6->
  <5->4 s4 s2
  s1
  <_->2 <5->4 <7->
  s1*6
  s4 s8 <6> <5>2
  s4 s8 <6> <6 5>2
  s8 <6> s <4+> s8 <3> s4
  s4 s8 <6> <6 5>2
  <4>8 <3> s4 <6 5->2
  s <_->
  s1
  <6 5>2 s4 s8 <6>
  <6 5>1
  <6 5>2 <7>4 s8 <6>
  <6 5 _->4 <_-> <7> s8 <6->
  <6 5->2 <4>4 <3>

}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 60
  s1*77
  \bar"|."

}

IvlI = {
  \Iglobal
  \notypeset
  <<\IvlIn \forma>>

}

IvlII = {
  \Iglobal
  <<\IvlIIn \forma>>

}

IvlIr = {
  \Iglobal
  <<\IvlIrn \forma>>

}

IvlIIr = {
  \Iglobal
  <<\IvlIIrn \forma>>

}

Ivla = {
  \Iglobal
  \clef alto
  <<\Ivlan \forma>>

}

Icb = {
  \Iglobal
  \clef bass
  <<\Icbn \forma\IbfIn>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \IbfIIn>>
  \typeset

}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \con\terzinequarto
}


IIvlIn =  \relative do'' {

    \tuplet 3/2 { fa8.(sol16 fa8) \senza la8.[(sib16 la8)] } do8. fa,16
    mi4.\tr re8 do4
    \tuplet 3/2 { fa8.(sol16 fa8) la8.[(sib16 la8)] } do8. la16

    %4
    sol2.\tr
    R2.*4
    \tuplet 3/2 { sol8.(la16 sol8) si,8.[(do16 si8)]  fa'8.[(sol16 fa8)]}

    %10
    fa2\tr mi4
    R2.*2
    \tuplet 3/2 { mi8.(fa16 mi8) sib'8.[(la16 sib8)] dod,8(mi8. sol16) }

    %14
    sol2\tr fa4
    R2.*2
    \tuplet 3/2 { mib8.(re16 mib8) sol8.[(fa16 sol8)] sib8.(la16 sib8) }

    %18
    sib4 \tuplet 3/2 { mib,8.(re16 mib8) sol8.[(fa16 sol8)] }
    sol2.\fermata
    r16 mi re mi dod re mi dod la sib dod la

    %21
    mi'8 mi, la mi dod' la
    r16 la' mi la dod, mi la, dod mi, sol fa mi
    fa8 re la' fa fa' la,\mbreak

    %24
    r16 la sol la fa sol la fa re mi fa re
    la'4 r r
    r16 re do re sib! do re sib sol la sib sol

    %27
    re4 r r
    r16 sol' re sol sib, re sol, sib re, sol fa mi\mbreak
    fa4 r r

    %30
    r8 mi' la la do do
    mi16 la,, la mi'' mi la,, la mi'' mi la,, la mi''
    do la, la do' do la, la do' do la, la do'

    %33
    la la, la la' la la, la la'\mbreak la la, la la'
    mi_\markup\italic"Arpeggio battuto" do la do mi do la do mi do la do
    sold' sib, mi, sib' sold' sib, mi, sib'  sold' sib, mi, sib'

    %36
    sold' re mi, re' sold re mi, re' sold re mi, re'
    la' do, mi,8 r4 r
    R2.*6

    %44
    r8 mi' la la, si16(la' sol fa)
    sol8 si, dod sol' la,16(sol' fa mi)
    fa4 r r

    %47
    R2.
    r8 re sol sol, la16(sol' fa mi)
    fa8 la, si fa' sol,16(fa' mi re)

    %50
    mi4 r r\mbreak
    r16 la sol la fa sol mi fa re  mi do re
    si sol' re sol si, sol' re sol si, sol' re sol

    %53
    mi4 r r
    r16 fa do fa la, fa' do fa la, fa' do fa
    re do sib do re do sib do re mi fa sol

    %56
    mi re do re mi re do re mi fa sol la
    fa mi re mi fa mi re mi fa sol la sib
    sol fa mi fa sol fa mi fa\mbreak sol la sib do

    %59
    la sib do sib la sib sol la fa sol mi fa
    re mi fa mi re mi do re sib! do la sib
    sol4. sol8 la4~

    %62
    la8. sib16 sol4. fa8
    fa4\fermopz r r
    R2.*2

    %66
    \tuplet 3/2 { fa'8.(sol16 fa8) la8.[\parentSlur (sib16 la8)] la\parentSlur (do8. fa,16) }
    mi4.\tr re8 do4
    R2.*2

    %70
    \tuplet 3/2 { fa8.(sol16 fa8) la,8.[(sib16 la8)] mib'8.(fa16 mib8) }
    mib?2\tr re4
    R2.*2\mbreak

    %74
    \tuplet 3/2 { do8.(re16 do8) do8.[(re16 do8)]} sol'8 fa32(mi re do)
    <<la'2.\\do,>>
    \tuplet 3/2 { sib'8.(do16 sib8) sib8.[(do16 sib8)] } re16. (do32) sib16. (la32)

    %77
    sol4. la8 sib4~
    sib8. do16 la4.\tr sib8
    sib2.

}

IIvlIIn = \relative do'' {

    R2.*4\senza
    \tuplet 3/2 { do8.(re16 do8) mi8.[(fa16 mi8)] } sol8. do,16
    si4. la8 sol4

    %7
    \tuplet 3/2 { do8.(re16 do8) mi8.[(fa16 mi8)] } sol8. mi16
    re2.\fermata
    R2.*2

    %11
    \tuplet 3/2 { do'8.(re16 do8) mi,8.[(fa16 mi8)] sib'8.(do16 sib8) }
    sib4 la2
    R2.*2

    %15
    \tuplet 3/2 { la,8.(sib16 la8) mib'8.[(re16 mib8)] fad,8(la8. do!16)] }
    do2\tr sib4
    R2.

    %18
    \tuplet 3/2 { mib8.(re16 mib8) sol8. [\parentSlur (fa16 sol8)] sib8.\parentSlur ( la16 sib8) }
    sib2.\fermata
    R

    %21
    r16 mi, re mi dod re mi dod la sib dod la\mbreak
    mi'8 dod mi dod la' la,~
    la16 la sol la fa sol la fa re mi fa re

    %24
    la'8 fa la re, fa' la,
    r16 re la re fa, la re, fa la, do sib la
    sib4 r r

    %27
    r16 re' do re sib do re sib sol la sib sol\mbreak
    re4 r r
    r16 la'' fa la re, fa la, re fa, re' do si

    %30
    do4 r r
    R2.*6
    r8 mi la la do do

    %38
    mi16 la,, la mi'' mi la,, la mi'' mi la,, la mi''
    do la, la do' do la, la do' do la, la do'
    la la, la la' la la, la la'\mbreak la la, la la'

    %41
    mi do la do mi do la do mi do la do
    sold' sib, mi, sib' sold' sib, mi, sib'  sold' sib, mi, sib'
    sold' re mi, re' sold re mi, re' sold re mi, re'

    %44
    la' do, mi,8 r4 r
    R2.
    r8 la re re, mi16(re' do sib)

    %47
    do8 mi, fad do' re,16(do' sib! la)
    sib4 r r
    R2.

    %50
    r16 sol' fa sol mi fa re mi do re sib do\mbreak
    la do sib do la sib sol la fa sol mi fa
    re4 r r

    %53
    r16 do' sol do mi, do' sol do mi, do' sol do
    la4 r r
    R2.

    %56
    sol16 fa mi fa sol fa mi fa sol la sib do\mbreak
    la sol fa sol la sol fa sol la sib do re
    mi re do re mi re do re mi fa sol la

    %59
    fa sol la sol fa sol mi fa re mi do re
    sib do re do sib do la sib sol la fa sol\mbreak
    mi4. mi8 fa4~

    %62
    fa8. sol16 mi4. fa8
    fa4\fermata r r
    \tuplet 3/2 { sib8.(do16 sib8) re8.[(mib16  re8)] } fa8. sib,16

    %65
    la4.\tr sol8 fa4
    R2.*2
    \tuplet 3/2 { do''8(re do) mi,![(fa mi)] sib'(do sib) }

    %69
    sib2\tr la4\mbreak
    R2.*2
    \tuplet 3/2 { sib,8(do sib) sib[(do sib)] } fa' mib32(re) do(sib)

    %73
    <<sol'2.\\sib,>>
    sib4 sib sib
    la2.

    %76
    fa'4 fa sib,
    sib4. do8 re4~
    re8. mib16 do4. sib8

    %79
    sib2.

}

IIbcn = \relative do {

    fa4 r8 fa la8. sib16
    do4 r8 sib la8. sol16
    fa4 r8 fa la8. sib16

    %4
    do2.
    do,4 r8 do mi8. fa16
    sol4. fa8 mi8. re16\mbreak

    %7
    do4 r8 do mi8. fa16
    sol2.\fermata
    si,4 sol si

    %10
    do2.
    mi4 do mi
    fa4. fa8 mi8. re16

    %13
    dod2.
    re
    fad

    %16
    sol
    sol
    sol

    %19
    dod,\fermopz
    dod~
    dod~

    %22
    dod
    re~
    re~

    %25
    re2 fa4
    sol2.
    sol,~

    %28
    sol
    re'
    la4 r r

    %31
    la r r
    la r r
    la r r

    %34
    la do la
    mi' r r
    mi sold mi

    %37
    la r r
    la, r r\mbreak
    la r r

    %40
    la r r
    la do la
    mi' r r

    %43
    mi sold mi
    la4 r8 fa sol re
    mi4 la,2

    %46
    re4 r8 sib! do sol
    la4 re2
    sol4 r8 mi fa do

    %49
    re4 sol2
    do, mi4
    fa fa,2\mbreak

    %52
    sol4 r r
    do r r
    fa r r

    %55
    sib, r r
    do r r
    fa r r

    %58
    do r r
    fa r r
    sib sib, sib'

    %61
    sib4. sib8 la4
    sib do do,
    fa\fermopz r r

    %64
    sib,4. sib8 re8. mib16
    fa4 fa,2\mbreak
    fa'4. fa8 la8. sib16

    %67
    do4 do,2
    mi4 do mi
    fa2.

    %70
    la4 fa la
    sib2.
    re,4 re re

    %73
    mib sib'8 lab sol fa
    mi!4 mi mi
    fa4. sol8 fa mib

    %76
    re2 re4
    mib4. mib8 re4
    mib fa fa,

    %79
    sib2.

}

IIbfIIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2.*5
  <_!>2.
  s
  <_!>
  <6>2 <5->4
  <4>2 <3>4
  <6>2 <5->4
  <4> <3> s
  <3>4 <7->2
  <4>2 <3->4
  <3>4 <7->2
  <4>2 <3>4
  <6->2.
  <6->
  <7 5->

  %allegro
  <6>
  s
  s
  <_->
  s
  s2 <_+>4
  <_->2.
  s
  s
  s
  <_->
  s2.*4
  <_+>2.
  s2.*6
  <_+>2.
  s
  s2 <_!>4
  s <_+>2
  s2.
  s4 <_+>2
  s2.
  s4 <_!>2
  s2 <6>8 <5->
  s2.
  <_!>
  s2.*8
  <4 2>2 <6>4
  s2.*2

  % largo
  s2.*4
  <6>2 <5->4
  <4>2 <3>4
  <6>2 <5->4
  <4>2 <3>4
  <6>2.
  s
  <6 5->
  s
  <6>

}

forma = {

  \key fa\major
  \time 3/4
  \tempo 4 = 55
  s2.*19
  \bar"||"\break
  \once \override Score.RehearsalMark.extra-offset = #'(+6 . +1.0) \mark\markup\huge "[3.] Allegro"
  \tempo 2 = 60
  s2.*44
  \bar"||"\break
  \once \override Score.RehearsalMark.extra-offset = #'(+6 . +1.0) \mark\markup\huge "[4.] Largo"
  \tempo 4 = 55
  s2.*16
  \bar"|."


}

IIvlI = {
  \IIglobal
  \notypeset
  <<\IIvlIn \forma>>

}

IIvlII = {
  \IIglobal
  <<\IIvlIIn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfIIn>>
  \typeset

}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn =  \relative do'' {

    sib'8
    do4 re la r8 la
    sib4 sol fa r8 fa
    sol fa16 mib re8 mib fa sib, mib sol
    
    %4
    re4 do\tr sib8 fa re4
    r2 r8 do'' sol4
    r2 r8 fa la,4
    
    %7
    r4 r8 mi'\mbreak fa4 fa,~
    fa mi\tr \once\stemUp fa8 do''16 sib do re do sib
    la8 la16 sol la sib la sol fa8 do16\p sib do re do sib
    
    %10
    la8 la16 sol la sib la sol fa4 r8 re'
    mi4-. fa-. dod4 r8 dod\mbreak
    re4 sib la r8 la'
    
    %13
    sib la16 sol fa8 sol la re, sol sib
    fa4 mi\tr re8 la'16 sol la sib la sol
    fa8 fa16 mi fa sol fa mi re8 la16\p sol la sib la sol
    
    %16
    fa8 fa16 mi fa sol fa mi\mbreak re4 r8 sib'\solo
    fa' sib, sol' sib, la16 do re mi fa4
    r2 r4 r8 do
    
    %19
    mi do sol' do, sib!16 re mi fad sol4
    r2 r4 r8 re
    sol do, fa sib, <<<mib sol,>4\\do,>> r16 re' do sib
    
    %22
    do la(fa la fa') mib re do\mbreak re sib fa do (re fa sib re)
    sib fa( re fa sib) re do sib la fa(do fa la4)
    R1*2
    
    %26
    r2 r4 r16 sol' mi sol
    do, sol' mi sol do, sol' mi sol la sib la sol fa4\mbreak  %% fine pagina
    r2 r4 r16 fa, re fa
    
    %29
    sol8 mib16 sol la8 fa16 la sib8 fa16 sib do8 la16 do
    re8 sib16 re mib8 do16 mib fa8 re16 fa sol8 mi16 sol
    la8 fa r16 fa mib fa re fa sol re do8.\tr sib16\mbreak
    
    %32
    sib8 fa'16 mib fa sol fa mib re8 re16 do re mib re do
    sib8 fa16\p mib fa sol fa mib re8 re16 do re mib re do
    sib4 r8 sol'' la4 sib
    
    %35
    fad r8 fad sol4 mib\mbreak
    re r8 re mib re16 do sib8 do
    re sol, do mib sib4 la\tr 
    
    %38
    sol16 sol' fad sol re sol do, sol' sib, la sol sib la sol fad la
    sib4 r r2
    r16 sol' sib la sol re sol fa\mbreak mib fa sol mib do la fa' do
    
    %41
    re4 r r2
    r16 fa mi fa do fa la, fa' do fa la, fa' do fa la, fa'
    re4 r r2
    
    %44
    r16 do si do sol do mi, do' sol do mi, do' sol do mi, do'\mbreak 
    la4 r r2
    r16 re re, re' mi, re' fad, re' sol,8 sib sol la
    
    %47
    sib8 sol'16 sib la sol la fa sol mib sol fa mib fa re mib
    do re mib re do re sib do la sib  do sib la sib sol la\mbreak
    fad8 re re'2 do4~
    
    %50
    do sib2 la4~
    la8 re, sol fa  mib4 r8 mib'
    re fad, sol2 fad4\tr 
    
    %53
    sol r8 sib' do4 re
    la r8 la sib4 sol
    fa r8 fa sol fa16 mib re8 mib
    
    %56
    fa sib, mib sol\mbreak re4 do\tr 
    sib8 fa re4 r2
    r8 sib'' sol4 r2
    
    %59
    r8 fa la,4 r r8 mi'
    fa4 fa,2 mi4
    fa r16 do' sib do la do sib do sol do sib do
    
    %62
    la sib la sol fa do' sib do la do sib do sol do sib do\mbreak
    la sib la sol fa8 fa sib4 la
    sib r8 fa sib,4 la
    
    %65
    sib r16 sib' la sib fa sib la sib re, sib' la sib
    sol lab sol fa mib8 do mi4 do
    fa r16 re' do re\mbreak la re do re fad, re' do re
    
    %68
    sib do sib la sol8 mib sol4 mib
    la! r16 fa' mib fa do fa mib fa la, fa' mib fa
    re mib? re do sib4 r2
    
    %71
    r4 r16 sol' fa sol\mbreak mib fa re mib do re sib do
    la sol la fa sib la sib sol do sib do la re do re sib
    mib8 do re4. mib8 do4\tr 
    
    %74
    sib8 fa'16 mib fa sol fa mib re8 re16 do re mib re do\mbreak
    sib8 fa16 \p mib fa sol fa mib re8 re16 do re mib re do
    sib4 r8 fa'' sol fa16 mib re8 mib
    
    %77
    fa sib, mib sol re4 do\tr 
    sib r r2
    
}

IIIvlIIn = \relative do'' {
   
   r8
   R1*3
   r2 r4 r8 fa
   sol4 la mi r8 mi
   
   %6
   fa4 re do r8 do
   re8 do16 sib la8 sib do fa, sib re
   la4 sol\tr \once\stemUp fa8 la'16 sol la sib la sol
   
   %9
   fa8 do'16 sib do re do sib\mbreak la8 la,16\p sol la sib la sol
   fa8 do'16 sib do re do sib la8 fa r4
   r2 r8 la' mi4
   
   %12
   r2 r8 re fa,4
   r r8 dod'' re4 re,~
   re dod re8 fa16 mi fa sol fa mi
   
   %15
   re8 la'16 sol la sib la sol\mbreak fa8 fa,16 \p mi fa sol fa mi
   re8 la'16 sol la sib la sol fa8 re r4
   r2 r4 r8 fa\solo
   
   %18
   la fa do' fa, mi16 sol la si do4
   r2 r4 r8 sol
   sib sol re' sol, fa16 la sib dod re4
   
   %21
   R1*2\mbreak
   r2 r4 r8 <<{do
               re4 do}\\{la8 la sol sol fa}>> <sib re, sol,>4 r16 la' sol fa
   
   %25
   sol mi do mi sol sib la sol la fa do sol la(do mi) la
   fa do la(do mi) la sol fa\mbreak mi do sol(do mi4)
   r2 r4 r16 do la do
   
   %28
   fa, do' la do fa, do' la do re mib re do sib4
   r4 r16 do la do re8 sib16 re mib8 do16 mib
   fa4 do8 mib16 do\mbreak re8 sib16 re mi!8 do16 mi
   
   %31
   fa do sib do la8 fa r sib la8.\tr sib16
   sib8 re16 do re mib re do sib8 fa'16 mib fa sol fa mib
   re8 re,16\p do re mib re do\mbreak sib8 fa'16 mib fa  sol fa mib
   
   %34
   re8 sib r4 r2
   r8 re'' la4 r2
   r8 sol sib,4 r r8 fad'
   
   %37
   sol4 sol,2 fad4
   sol r r2
   r16 sol' fad sol re sol do, sol'\mbreak sib, la sol sib la sol fad la
   
   %40
   sib4  r r2
   r16 re fa mib re sib re do sib do re sib sol mi! do' sol
   la4 r r2
   
   %43
   r16 sib la sib fa sib re, sib'\mbreak fa sib re, sib' fa sib re, sib'
   sol4 r r2
   r16 re' do re la re fad, re' la re fad, re' la re fad, re'
   
   %46
   sib8 sib sol la sib16 re re, re' mi, re' fad, re'
   sol,4 r\mbreak r16 sol' sib la sol la fa sol
   mib fa sol fa mib fa re mib do re mib re do re sib do
   
   %49
   la4 r mib'2\tu 
   re do
   sib4 r8 si mib re do4~
   
   %52
   do8 re sib? do la2\tr \mbreak
   sol4 r r2
   r8 fa' do4 r2
   
   %55
   r8 sib' re,4 r r8 la'
   sib4 sib,2 la4
   sib\tr r8 fa' sol4 la
   
   %58
   mi r8 mi fa4 re
   do r8 do re do16 sib la8 sib
   do fa, sib re la4 sol\tr 
   
   %61
   fa8 do la\soli do'\mbreak fa4 mi\tr 
   fa r8 do, fa4 mi
   fa r16 fa mib fa re fa mib fa do fa mib fa
   
   %64
   re mib re do sib fa' mib fa re  fa mib fa do fa mib fa
   re mib re do sib8 sib re4 sib\mbreak
   mib r16 do' si do sol do si do mib, do' si do
   
   %67
   la sib! la sol fa8 re fad4 re
   sol r16 mib' re mib sib mib re mib sol, mib' re mib
   do re do sib la8 fa la4 fa
   
   %70
   sib r16 sib' la sib\mbreak sol la fa sol mib fa re mib
   do re sib do la mib' re mib do re sib la la sib sol la
   fa4 r la16 sol la fa sib la sib sol
   
   %73
   la8 la sib mib, fa2
   sib,8 re'16 do re mib re do\mbreak sib8 fa'16 mib fa sol fa mib
   re8 re,16\p do re mib re do sib8 fa'16 mib fa sol fa mib
   
   %76
   re8 sib re4 r r8 la''
   sib4 sib,2 la4\tr 
   sib r r2

}


IIIvlIrn =  \relative do'' {

    sib'8
    do4 re la r8 la
    sib4 sol fa r8 fa
    sol fa16 mib re8 mib fa sib, mib sol
    
    %4
    re4 do\tr sib8 fa re4
    r2 r8 do'' sol4
    r2 r8 fa la,4
    
    %7
    r4 r8 mi'\mbreak fa4 fa,~
    fa mi\tr \once\stemUp fa8 do''16 sib do re do sib
    la8 la16 sol la sib la sol fa8 do16\p sib do re do sib
    
    %10
    la8 la16 sol la sib la sol fa4 r8 re'
    mi4-. fa-. dod4 r8 dod\mbreak
    re4 sib la r8 la'
    
    %13
    sib la16 sol fa8 sol la re, sol sib
    fa4 mi\tr re8 la'16 sol la sib la sol
    fa8 fa16 mi fa sol fa mi re8 la16\p sol la sib la sol
    
    %16
    fa8 fa16 mi fa sol fa mi\mbreak re4 r
    R1*15
    
    %32
    r8 fa'16 mib fa sol fa mib re8 re16 do re mib re do
    sib8 fa16\p mib fa sol fa mib re8 re16 do re mib re do
    sib4 r8 sol'' la4 sib
    
    %35
    fad r8 fad sol4 mib\mbreak
    re r8 re mib re16 do sib8 do
    re sol, do mib sib4 la\tr 
    
    %38
    sol r r2
    R1*10
    r8 re re'2 do4~
    
    %50
    do sib2 la4~
    la8 re, sol fa  mib4 r8 mib'
    re fad, sol2 fad4\tr 
    
    %53
    sol r8 sib' do4 re
    la r8 la sib4 sol
    fa r8 fa sol fa16 mib re8 mib
    
    %56
    fa sib, mib sol\mbreak re4 do\tr 
    sib8 fa re4 r2
    r8 sib'' sol4 r2
    
    %59
    r8 fa la,4 r r8 mi'
    fa4 fa,2 mi4
    fa r r2 
    
    %62
    R1*12
    r8 fa'16 mib fa sol fa mib re8 re16 do re mib re do\mbreak
    sib8 fa16 \p mib fa sol fa mib re8 re16 do re mib re do
    sib4 r8 fa'' sol fa16 mib re8 mib
    
    %77
    fa sib, mib sol re4 do\tr 
    sib r r2

}

IIIvlIIrn = \relative do'' {
   
   r8
   R1*3
   r2 r4 r8 fa
   sol4 la mi r8 mi
   
   %6
   fa4 re do r8 do
   re8 do16 sib la8 sib do fa, sib re
   la4 sol\tr \once\stemUp fa8 la'16 sol la sib la sol
   
   %9
   fa8 do'16 sib do re do sib\mbreak la8 la,16\p sol la sib la sol
   fa8 do'16 sib do re do sib la8 fa r4
   r2 r8 la' mi4
   
   %12
   r2 r8 re fa,4
   r r8 dod'' re4 re,~
   re dod re8 fa16 mi fa sol fa mi
   
   %15
   re8 la'16 sol la sib la sol\mbreak fa8 fa,16 \p mi fa sol fa mi
   re8 la'16 sol la sib la sol fa8 re r4
   R1*15
   
   %32
   r8 re'16 do re mib re do sib8 fa'16 mib fa sol fa mib
   re8 re,16\p do re mib re do\mbreak sib8 fa'16 mib fa  sol fa mib
   
   %34
   re8 sib r4 r2
   r8 re'' la4 r2
   r8 sol sib,4 r r8 fad'
   
   %37
   sol4 sol,2 fad4
   sol r r2
   R1*10
   
   %49
   r2 mib'2
   re do
   sib4 r8 si mib re do4~
   
   %52
   do8 re sib? do la2\tr \mbreak
   sol4 r r2
   r8 fa' do4 r2
   
   %55
   r8 sib' re,4 r r8 la'
   sib4 sib,2 la4
   sib\tr r8 fa' sol4 la
   
   %58
   mi r8 mi fa4 re
   do r8 do re do16 sib la8 sib
   do fa, sib re la4 sol\tr 
   
   %61
   fa8 do la4 r2
   R1*12
   r8 re'16 do re mib re do\mbreak sib8 fa'16 mib fa sol fa mib
   re8 re,16\p do re mib re do sib8 fa'16 mib fa sol fa mib
   
   %76
   re8 sib re4 r r8 la''
   sib4 sib,2 la4\tr 
   sib r r2
   
}

IIIvlan = \relative do'{
   
   r8
   R1*7
   r2 r8 la' la la
   la la la la la do,\p do do
   
   %10
   do do do do do4 r
   R1*3
   r2 r8 la' la la
   
   %15
   la la, la la la la'\p la  la
   la la, la la\mbreak la4 r
   R1*15
   
   %32
   r8 fa' fa fa fa fa, fa fa
   fa fa' \p fa fa fa fa, fa fa
   fa4 r8 re' re4 re
   
   %35
   re r8 re sib4 la
   sib r8 sib sol do re do
   sib4 sol'8 sol re4 re
   
   %38
   re r r2\mbreak
   R1*10
   r4 r8 la' sib la sib do
   
   %50
   fa,4 r8 re sol fad sol la
   re,4 r8 sol sol4 la8 sib
   la4 sol8 mib la,4 re
   
   %53
   re r8 re fa4 fa
   fa r8 fa re4 do
   re r8 re\mbreak sib mib fa mib
   
   %56
   re4 sib'8 sib fa4 fa
   fa r8 re do4 do
   do r8 do' la4 sol
   
   %59
   la r8 la fa sib,! do sib
   la4 fa'8 fa do4 do
   do r r2
   
   %62
   R1*12
   r8 fa fa fa\mbreak fa fa, fa fa
   fa fa'\p fa fa fa fa, fa fa
   
   %76
   fa4 r8 sib sib mib fa mib
   re4 sib'8 sib fa4 fa
   fa r r2
    
}

IIIcbn = \relative do {
   
   sib8
   la4 sib fa8 fa'16 mib fa8 fa
   sol4 mib re8 sib'16 la sib 8 re,
   mib4 sib8 do re4\p sol8 mib
   
   %4
   fa4 fa, sib'8 sib,16 la sib8 sib'
   mi,!4 fa do8 do'16 sib do8 do,
   re4 sib\mbreak la8 fa'16 mi fa8 la
   
   %7
   sib4 fa8 sol la4 re,8 sib
   do4 do, fa8 fa' fa fa
   fa fa fa fa fa fa,\p fa fa
   
   %10
   fa fa fa fa fa4 r8 fa'
   dod4 re la8 la'16 sol la8 la,
   sib4 sol fa8 re'16 dod re8 fa\mbreak
   
   %13
   sol4 re8 mi fa4 sib8 sol
   la4 la, re8 re re re
   re re, re re re re'\p re re
   
   %16
   re re, re re re4 r
   re' mib fa r
   fa fa, do' r
   
   %19
   do' do, sol' r
   sol sol, re' r8 re\mbreak
   mib4 re do8 do'16 sib do8 sol
   
   %22
   la4 r8 la sib4 sib,
   re mi! fa r8 la
   sib4 la sol8 sol16 fa sol8 re
   
   %25
   mi4 r8 mi fa4 fa,
   la si do r8 do
   mi4 do fa r8 fa
   
   %28
   la4 fa sib r8 sib\mbreak
   mib,4 fa re do
   sib mib re do
   
   %31
   fa r8 la sib mib, fa fa,
   sib sib' sib sib sib sib, sib sib
   sib sib'\p sib sib sib  sib, sib sib
   
   %34
   sib4 r8 sol' fad4 sol
   re8 re'16 do re8 re, mib4 do\mbreak
   sib8 sol'16 fad sol8 sib, do4 sol8 la
   
   %37
   sib4 mib8 do re4 re, 
   sol8 sol' sib la sol4 re
   sol,8 sol' sib la sol4 re
   
   %40
   sol r sol la
   sib r re, mi! 
   fa r la, r
   
   %43
   sib r re r\mbreak
   mib r mi r
   fa r fad r
   
   %46
   sol r r2
   R1*2
   r4 r8 re sol fa sol la
   
   %50
   sib sib, r sib' mi,! re mi fad
   sol sol, r sol' do sib la sol
   fad re sol do, re4 re,\mbreak
   
   %53
   sol r8 sib la4 sib
   fa8 fa'16 mib fa8 fa sol4 mib
   re8 sib'16 la sib8 re, mib4 sib8 do
   
   %56
   re4 sol8 mib fa4 fa,
   sib'8 sib,16 la sib8 sib' mi,!4 fa
   do8 do'16 si do8 do, re4 sib!
   
   %59
   la8 fa'16 mi fa8 la sib4 fa8 sol
   la4 re,8 sib do4 do,
   fa r r2
   
   %62
   R1*12
   r8 sib' sib sib sib sib, sib sib
   sib sib'\p sib sib sib sib, sib sib
   
   %76
   sib4 r8 re\mbreak mib4 sib8 do
   re4 sol8 mib fa4 fa,
   sib r r2

}

IIIbcn = \relative do {
   
   sib8
   la4 sib fa8 fa'16 mib fa8 fa
   sol4 mib re8 sib'16 la sib 8 re,
   mib4 sib8 do re4^\p sol8 mib
   
   %4
   fa4 fa, sib'8 sib,16 la sib8 sib'
   mi,!4 fa do8 do'16 sib do8 do,
   re4 sib\mbreak la8 fa'16 mi fa8 la
   
   %7
   sib4 fa8 sol la4 re,8 sib
   do4 do, fa8 fa' fa fa
   fa fa fa fa fa fa,\p fa fa
   
   %10
   fa fa fa fa fa4 r8 fa'
   dod4 re la8 la'16 sol la8 la,
   sib4 sol fa8 re'16 dod re8 fa\mbreak
   
   %13
   sol4 re8 mi fa4 sib8 sol
   la4 la, re8 re re re
   re re, re re re re'\p re re
   
   %16
   re re, re re re4 r
   re' mib fa r
   fa fa, do' r
   
   %19
   do' do, sol' r
   sol sol, re' r8 re\mbreak
   mib4 re do8 do'16 sib do8 sol
   
   %22
   la4 r8 la sib4 sib,
   re mi! fa r8 la
   sib4 la sol8 sol16 fa sol8 re
   
   %25
   mi4 r8 mi fa4 fa,
   la si do r8 do
   mi4 do fa r8 fa
   
   %28
   la4 fa sib r8 sib\mbreak
   mib,4 fa re do
   sib mib re do
   
   %31
   fa r8 la sib mib, fa fa,
   sib sib' sib sib sib sib, sib sib
   sib sib'\p sib sib sib  sib, sib sib
   
   %34
   sib4 r8 sol' fad4 sol
   re8 re'16 do re8 re, mib4 do\mbreak
   sib8 sol'16 fad sol8 sib, do4 sol8 la
   
   %37
   sib4 mib8 do re4 re, 
   sol8 sol' sib la sol4 re
   sol,8 sol' sib la sol4 re
   
   %40
   sol r sol la
   sib r re, mi! 
   fa r la, r
   
   %43
   sib r re r\mbreak
   mib r mi r
   fa r fad r
   
   %46
   sol r r2
   R1*2
   r4 r8 re sol fa sol la
   
   %50
   sib sib, r sib' mi,! re mi fad
   sol sol, r sol' do sib la sol
   fad re sol do, re4 re,\mbreak
   
   %53
   sol r8 sib la4 sib
   fa8 fa'16 mib fa8 fa sol4 mib
   re8 sib'16 la sib8 re, mib4 sib8 do
   
   %56
   re4 sol8 mib fa4 fa,
   sib'8 sib,16 la sib8 sib' mi,!4 fa
   do8 do'16 si do8 do, re4 sib!
   
   %59
   la8 fa'16 mi fa8 la sib4 fa8 sol
   la4 re,8 sib do4 do,
   fa r r2
   
   %62
   R1*12
   r8 sib' sib sib sib sib, sib sib
   sib sib'\p sib sib sib sib, sib sib
   
   %76
   sib4 r8 re\mbreak mib4 sib8 do
   re4 sol8 mib fa4 fa,
   sib r r2
   
}

IIIbfIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s8
  s1*2
  s2 <6>4 <6-><6 4>4 <5 3> s2
  s1*2
  s2 <6>
  s1*2
  s2 s4 s8 <6>
  s2 <_+>
  s1
  s4 s8 <6+> <6>4 <6>
  <6 4>4 <5 3+> s2
  s1*2
  <6>1
  s2 <_!>
  s <_->
  s1
  <7>8 <6> <7> <6> s2
  <6>1
  <6>4 <5-> s2
  s1
  <6>
  <6>4 <5-> s2
  <6>1
  <6>
  s1*2
  s4 s8 <6> s2
  s1*3
  s2 s4 <6 [3-]>
  <6>2 <_->4 s8 <6+>
  <6>4 <6> <6 4> <5 3+>
  s2 s4 <_+>
  s2 s4 <_+>
  s2 <6->4 <5->
  s2 <6>
  s <6>
  s <6>
  s1*5
  s2 <5>
  <9> <6 5->
  <9> 4 s8 <7 _!> <_->4 s8 <6->
  s2 <4>4 <3+>
  s1
  s2 s4 <6>
  s2 s4 <6 _->
  <6>4 <6-> <6 4> <5 3>
  s1*2
  s2 s4 s8 <6>
  <6>4 s <6 4> <5 3>
  s1*15
  s2 s4 s8 <6>
  <6>4 <6-> <6 4> <5 3>
  
}

IIIbfIIn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s8
  s1*2
  s2 <6>4 <6-><6 4>4 <5 3> s2
  s1*2
  s2 <6>
  s1*2
  s2 s4 s8 <6>
  s2 <_+>
  s1
  s4 s8 <6+> <6>4 <6>
  <6 4>4 <5 3+> s2
  s1*2
  <6>1
  s2 <_!>
  s <_->
  s1
  <7>8 <6> <7> <6> s2
  <6>1
  <6>4 <5-> s2
  s1
  <6>
  <6>4 <5-> s2
  <6>1
  <6>
  s1*2
  s4 s8 <6> s2
  s1*3
  s2 s4 <6 [3-]>
  <6>2 <_->4 s8 <6+>
  <6>4 <6> <6 4> <5 3+>
  s2 s4 <_+>
  s2 s4 <_+>
  s2 <6->4 <5->
  s2 <6>
  s <6>
  s <6>
  s1*5
  s2 <5>
  <9> <6 5->
  <9> 4 s8 <7 _!> <_->4 s8 <6->
  s2 <4>4 <3+>
  s1
  s2 s4 <6>
  s2 s4 <6 _->
  <6>4 <6-> <6 4> <5 3>
  s1*2
  s2 s4 s8 <6>
  <6>4 s <6 4> <5 3>
  s1*15
  s2 s4 s8 <6>
  <6>4 <6-> <6 4> <5 3>
  
}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 60
  \partial 8 s8
  s1*78
  \bar"|."

}

IIIvlI = {
  \IIIglobal
  %\notypeset
  <<\IIIvlIn \forma>>

}

IIIvlII = {
  \IIIglobal
  <<\IIIvlIIn \forma>>

}

IIIvlIr = {
  \IIIglobal
  <<\IIIvlIrn \forma>>

}

IIIvlIIr = {
  \IIIglobal
  <<\IIIvlIIrn \forma>>

}

IIIvla = {
  \IIIglobal
  \clef alto
  <<\IIIvlan \forma>>

}

IIIcb = {
  \IIIglobal
  \clef bass
  <<\IIIcbn \forma\IIIbfIn>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfIIn>>
  \typeset

}
#(set-global-staff-size 15.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \header {
        title = \markup\smaller\column {"Concerto grosso Op. VIII n. 4""  "}
        composer = \markup \center-column{"G. Torelli (1658 - 1709)"}
    }

    \paper  {

        systems-per-page = #3

    }

    \markup\huge"[1.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Primo del"\vspace #-0.2"Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Secondo del"\vspace #-0.2"Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\small{"Violone ò"\vspace #-0.2"Arcileuto"}
                    \set Staff.midiInstrument = #"cello"
                    \Icb
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Primo di"\vspace #-0.2"rinforzo"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlIr
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Secondo di"\vspace #-0.2"rinforzo"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlIIr
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\small{"Alto Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \Ivla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\small{"Organo"}
                    \set Staff.midiInstrument = #"church organ"
                    \Ibc
                >>
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup\huge"[2.] Largo, e con affetto"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        }<<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>

            \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\small{"Violone ò"\vspace #-0.2"Arcileuto"\vspace #-0.2"e Organo"}
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 2.2\cm

            \context	{
                \Score
               \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge"[5.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Primo del"\vspace #-0.2"Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Secondo del"\vspace #-0.2"Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\small{"Violone ò"\vspace #-0.2"Arcileuto"}
                    \set Staff.midiInstrument = #"cello"
                    \IIIcb
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Primo di"\vspace #-0.2"rinforzo"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlIr
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Secondo di"\vspace #-0.2"rinforzo"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlIIr
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\small{"Alto Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\small{"Organo"}
                    \set Staff.midiInstrument = #"church organ"
                    \IIIbc
                >>
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}




%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
