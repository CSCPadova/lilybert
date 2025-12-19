\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

MyCadenza = \relative do'' {

\cadenzaOn

    s4.^\markup\column\italic\center-align{"Cadenza"}
    \bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

dolce = _\markup \italic { dolce }

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

notypeset = \set Score.skipTypesetting = ##t

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    re8
    sol4. la16 sol la4. re8
    \grace do8 si4 do~do8 sib16 la sib8 sol
    la sib do sib16 la sib8 la16 sol sol4~

    %4
    sol fad4-+ sol8 re re'4~\mbreak
    re dod re r8 re,
    mi8 fa sol fa16 mi fa8. -+ mi32 (re) mi8 fad8-+

    %7
    sol8 re r sib'16 (la) la4. lab16 (sol)
    sol4. sol16(fa) fa8 la?-+ sib4~\mbreak
    sib la-+ sib r8 sib,

    %10
    do re mib re16 do re8 mi-+ fa4~
    fa mi-+ fa8 do r fa
    sol la sib la16 sol la8 sib-+ do4~

    %13
    do8 sib16 la sib8 sol\mbreak la4. si8-+
    do4. lab8 \grace sol8 fad4 sol~
    sol la?8 sol fad sol la4~

    %16
    la8 sib do sib16 la sib4. do16 sib
    la4. sib16 la sol4. la16 sol
    fad4 sol2 fa4~\mbreak

    %19
    fa mib!8. re16 re2
    dod4 re2 do8 si
    do1\fermata

    %22
    r8 mib\p(re do) sib2~
    sib4 la8(sol) la2~
    la-+ sol\fermata

}

IvlIIn = \relative do'' {

    r8
    r re sol4. fa16 mib fa4~
    fa8 mib16 re mib8 lab \grace sol fad4 sol~
    sol fad-+ sol r8 re

    %4
    la' sib do sib16 la sib8 la16.-+ sol32 sol8 fa
    mi2 la,8 la' sib la
    sol fa mi la, la'2\mbreak

    %7
    re,8 fad sol4. fa16 mi fa4~
    fa8 mib!16 re mib4. re16(do) re4
    do2 fa,8 fa' sib4~

    %10
    sib la-+ sib r8 fa,
    sol la sib la16 sol la8 fa fa'4~
    fa mi-+ fa mib8. re16

    %13
    re4. mib16 re do4 re
    sol, mib'8. re16 re2~
    re4 dod-+ re4. mi8

    %16
    fad sol la4~la8 sol16 fad sol4~\mbreak
    sol8 fad16 mi fad8 re mib2
    re4. mib16 re do4. re16 do

    %19
    si4 do2 sib4
    la2 sold
    <<{la2~la\fermata}\\{la4 sol? fad2}>>

    %22
    r8 fad\p(sol la) sol2~
    sol~sol4 fad8 (mi)
    fad2_+ sol\fermata

}


Ibcn = \relative do {

    r8
    sol'4 sib do re
    sol, do, re sol,
    do re sol, sib

    %4
    do re sol,4. re'8
    mi fa sol fa16 mi fa8 re re'4~
    re dod\mbreak re do!

    %7
    sib4 mib8 re dod4 re8 do
    si4 do8 sib la fa r sib
    do re mib re16 do re8 sib sol4

    %10
    mib fa sib la
    sib do fa, re'
    sib do fa,2\mbreak

    %13
    fad4 sol4. fa?16 mib fa8 re
    mib do do'4. sib16 la sib8 sol
    mib2 re~

    %16
    re1~
    re4 re'2 do4~
    do sib lab2

    %19
    sol4 do fad, sol~
    sol fa?\mbreak mi2
    mib! re\fermata

    %22
    r r8 mib\p (re dod)
    re1~
    re2 sol,\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4 <6> <6 5> <_!>
    <7!> <5>8 <6-> <7 _+>2
    <6 5>4  <7 _+> s <6>
    <6 5> <7 _+> s s8 <_!>
    <7>4 <6 4+> <6> <6>8 <5>
    <4 2!>4 <6 5-> s <6 3!>8 <4+>
    <6>4 <5> <6 5> <_!>8 <6->
    <6 5>4 <_-> <6 5> s
    <7> <6 4> <6> <5>
    <6 5> <7> <5 3>8 <6 4!> <6>4
    <6 5> <7 _!> s <5>
    <6 5> <7 _!> <8> <7->
    <6 5> s <4+ 2> <6>8 <6!>
    <6>4 <6-> <4+ 2>8 <6 5> <6>4
    <7> <6+> <_+>2
    <7> <6 5>4 <4>
    <5 4> <3+> <4 2-> s
    <4+ 2> <6> <7> <6>
    <7 3!> <_-> <6 5> s
    <4+ 2> <6> <7 3+>2
    <6 4>4 <3> <7 3+> s
    s2 s8 <5> s4
    <6 4>2 <5>
    <5 3+>

}

forma = {

    \time 4/4
    \key sol\minor
    \tempo 4 = 50
    \partial 8 s8
    s1*24
    \bar"|."

}


IvlI = {
    \global
    <<\IvlIn \forma>>

}

IvlII = {
    \global
    <<\IvlIIn \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    r32 re mi fad
    sol8-! sol-! sol-! re mib?4. sib8
    do16 la do mib re do sib la sib re sol, sib la do sib la
    sib re sol, sib la do sib la \once\stemDown sib8 sol, r8 r32 sol'(la sib)

    %4
    do8 do do sol\mbreak la sol fad re
    sol sib fad re sol sib fad re
    sol16 sol' sib, re do mib re do re sib' sib, re do mib re do

    %7
    re8 fa la, fa sib re la fa
    sib sib, re sib mi do fad re
    \once\stemDown sib' sol, sib sol\mbreak do sol re' \once\stemDown la''

    %10
    sib16 re re, re' re, re' re, re' mib, do' mib, do' mib, do' mib, do'
    mib, do' mib, do' mib, do' mib, do' re, sib' re, sib' re, sib' re, sib'
    re, sib' re, sib' re, sib' re, sib' do, la' do, la' do, la' do, la'

    %13
    do, la' do, la' do, la' do, la'\mbreak sib,8 sib, r r32 re' (mi fad)
    sol8-! sol-! sol-! la-+ sib4. fa?8
    sol16 mi sol sib la sol fa mi fa la re, fa mi sol fa mi

    %16
    fa la re, fa mi sol fa mi fa re fa la sol fa mib re
    mib sol do, mib re fa mib re\mbreak mib sol do, mib re fa mib re
    mib do mib sol fa mib re do re sib re fa mib re do sib

    %19
    do la do mib re do sib la sib sib' re, sib' re, sib' re, sib'
    do, sib' do, sib' do, la' do, la' sib, la' sib, la' sib, sol' sib, sol'\mbreak
    la, sol' la, sol' la, fad' la, fad' <sol sib, re, sol,>4 r

    %22
    R1
    r8 re re4-+ r8 re re4-+
    r16 re sol, sib la do sib la sib re sol, sib la do sib la

    %25
    sib8 fa' fa4-+ r8 fa fa4-+\mbreak
    r16 fa sib, re do mib re do re sib' sib, re do mib re do
    re8 sib sib'4. la16 sol la8 fa

    %28
    sol,8 sol' do4~do8 sib16 la sib8 sol
    la, la' re 4. dod16 si dod8 la
    sib!4. do?16 sib la4. sib16 la\mbreak

    %31
    sol4. la16 sol fa la re, fa mi sol fa mi
    fa la re, fa mi sol fa mi \once\stemDown fa8 re, dod la
    re fa dod la r fa' fa'4~

    %34
    fa mi8 re mi mi, mi'4~
    mi re8 dod re re, re'4~
    re dod8 si\mbreak dod dod, r r32 la''(si dod)

    %37
    re8 re re la sib16 sol sib sol sib sol sib sol
    do sol do sol do sol do sol la fa la fa la fa la fa
    sib fa sib fa sib fa sib fa sol mi sol mi sol mi sol mi\mbreak

    %40
    la mi la mi la mi la mi<fa la, re,>2
    <si re, sol,> <do mib,! sol,>
    <la do, fa,> <sib re, fa,>

    %43
    <sol sib, mib,>8 sol4-+ fa16(sol) la,8-! la'4-+ sol16 la
    sib,8 sib'4-+ la16 sib do,8 do'4-+ sib16 do
    re,8 fa fa,4-+ r8 sib' sib,4-+

    %46
    r8 sib' sib,4-+ r r8 r32 fa'(sol la)\mbreak
    sib8 sib sib fa sol4.-+ re8
    mib16 do mib sol fa mib re do re fa sib, re do mib re do

    %49
    re fa sib, re do mib re do re sib mib sib fa' lab sol fa
    sol sib mib, sol fa lab sol fa sol sib mib, sol fa lab sol fa\mbreak
    sol fa mib re do sib' la! sol la do, fa la sol sib la sol

    %52
    la do, fa la sol sib la sol la do sol do fa, do' mib, do'
    re, do' re, do' re, do' re, do' re, sib' re, sib' re, sib' re, sib'
    do, sib' do, sib' do, sib' do, sib' do, la' do, la' do, la' do, la'\mbreak

    %55
    sib, sol' sib, sol'  sib, sol' sib, sol'  sib, sol' sib, sol'  sib, sol' sib, sol'
    la, sol' la, sol' la, sol' la, sol' la, fa' la, fa' la, fa' la, fa'
    sol, fa' sol, fa' sol, fa' sol, fa' sol, mib' sol, mib' sol, mib' sol, mib'

    %58
    fa, mib' fa, mib' fa, re' fa, re' mib, re' mib, re' mib, do' mib, do'\mbreak
    re, do' re, do' re, sib' re, sib' mib, sib' mib, sib' fa sib fa sib
    sol sib sol sib <sib re,> sib' <sib, re,> sib' <sib, mib,> sib' <sib, mib,> sib' <sib, fa> sib' <sib, fa> sib'

    %61
    <sib, sol> sib' <sib, sol> sib'<sib, re,> sib' <sib, re,> sib' <sib, mib,> sib' <sib, mib,> sib' <do, fa,> la' <do, fa,> la'
    <sib sib, re,> sib, re, sib' re, sib' re, sib'\mbreak mib, sib' mib, sib' fa la fa la
    sib,4 sib''4. la16 sol la8 fa

    %64
    sol, sol' do4. sib16 la sib8 sol
    la,la' re,16 re' re, re' mib, re' mib, re' mib, do' mib, do'
    re, do' re, do' re, sib ' re, sib' do, sib' do, sib' do, la' do, la'\mbreak

    %67
    sib, la' sib, la' sib, sol' sib, sol' la, sol' la, sol' la, fad' la, fad'
    sol4 r8 r32 sol(la sib) do8 do do do,
    do,4 r8 r32 fa'(sol la) sib8 sib sib sib,

    %70
    sib,4 r8 r32 mib'(fa sol) la8 la la la,\mbreak
    la,4 r re'16 re' re, re' re, re' re, re'
    mib, do' mib, do' mib, do' mib, do' mib, do' mib, do' mib, do' mib, do'

    %73
    re, sib' re, sib' re, sib' re, sib' re, sib' re, sib' re, sib' re, sib'
    do, la' do, la' do, la' do, la' do, la' do, la' do, la' do, la'\mbreak
    sib, re sol sib la do sib la sib re, sol sib la do sib la

    %76
    sib8 re, re4-+ r8 re re4-+
    r16 sol sib, sol' sib, sol' sib , sol' la, sol' la, sol' la, fad' la, fad'
    sol\p sib, sol sib sol sib sol sib sol la sol la fad la fad la

    %79
    sol4-! r r2\fermata

}

IIvlIIn = \relative do'' {

    r8
    R1*2
    r4 r8 r32 re(mi fad) sol8 sol sol re
    mib?4. sib8 do16 la do mib re do sib la

    %5
    sib re sol, sib la do sib la sib re sol, sib la do sib la
    sib8 re la fa sib re la fa
    \once\stemUp sib,16 fa'' sib, re do mib re do\mbreak re sib' sib, re do mib re do

    %8
    re sib' re, sib' re, sib' re, sib' do, sib' do, sib' do, la' do, la'
    sib, la' sib, la' sib, sol' sib, sol' la, sol' la, sol' la, fad' la, fad'
    <sol sib, re, sol,>4-! sib2 la8 sol

    %11
    la la, la'2 sol8 fad
    sol sol, sol'2 fad8 mi
    fad fad, r r32 re'(mi fad)\mbreak sol 8sol sol re

    %14
    mib?4. re16 do sib8 re re4-+
    dod8 re mi dod r la' la4-+
    r8 la la4-+ r8 fa re si

    %17
    \once\stemUp do, sol'' sol4-+ r8 sol sol4-+
    r8 sol do, la fa fa' sib,[sol]
    \once\stemUp do, mib' la,[fad] r sol sib sol

    %20
    mi do fad re sol sol, sib sol\mbreak
    do la re r32 re'(mi fad) sol8 sol sol re
    mib?4. sib8 do16 la do mib re do sib la

    %23
    sib re sol, sib la do sib la sib re sol, sib la do sib la
    sib8 sol fad re sol sib fad re
    sol16 sib' sib, re do mib re do re fa sib, re do mib re do\mbreak

    %26
    re8 sib la fa sib re la fa
    r fa' re sib do fa, fa'4~
    fa8 mib16 re mib8 do re sol, sol'4~

    %29
    sol8 fa16 mi fa8 re mi la, la'4~
    la8 sol16 fa sol4. fa16 mi fa4~
    fa8 mi16 re mi8 dod re la' la4-+

    %32
    r8 la la4-+ r16 la re, fa mi sol fa mi\mbreak
    fa la re, fa mi sol fa mi fa la la, la' la, la' la, la'
    sib, sol' sib, sol' sib, sol' sib, sol' sib, sol' sib, sol' sib, sol' sib, sol'

    %35
    la, fa' la, fa' la, fa' la, fa' la, fa' la, fa' la, fa' la, fa'
    sol, mi' sol, mi' sol, mi' sol, mi' sol, mi' sol, mi' sol, mi' sol, mi'
    <fa la, re,>4-! r8 r32 re(mi fa)\mbreak sol8 sol sol sol,

    %38
    <<mi'4\\<do sol>-!>> r8 r32 do(re mi) fa8 fa fa fa,
    << <fa' sib,>4\\re,-!>> r8 r32 sib'(do re) mi8 mi mi mi,
    <<<mi' dod>4\\la,-!>> <<<mi' dod>4\\la,-!>> r8 la fa'4~

    %41
    fa mib!8 re mib mib, mib'4~
    mib re8 do re re, re'4~
    re8 r32 sol,(la sib) do8 do, r r32 la'(sib do) re8 re,\mbreak

    %44
    r8 r32 sib' do re mib8 mib, r r32 do'(re mib) fa8 fa,
    r4 r8 r32 fa'(sol la) sib8 sib sib fa
    sol4.-+ re8 mib16 do mib sol fa mib re do

    %47
    re8 re, r r32 sib'(do re) mib8 mib mib sib
    do, do' la fa sib re la fa
    sib re la fa sib, do re sib\mbreak

    %50
    mib sol re sib mib sol re sib
    mib sol mi do fa la mi do
    fa la mi do fa sol la fa

    %53
    sib sib, r r32 re(mib? fa) sol8 sol sol re
    mib4.-+ r32 do(re mib) fa8 fa fa do
    re4.-+ r32 sib(do re) mib8 mib mib sib\mbreak

    %56
    do4.-+ r32 la(sib do) re8 re re la
    sib4.-+ r32 sol(la sib) do8 do do sol
    la la' sib, re sol, sol' la, la'

    %59
    sib,4 r r2
    r4 re-! mib-! fa-!
    sol re mib fa

    %62
    sib, r r2
    r8 fa''\f re sib do fa, fa'4~
    fa8 mib16 re mib8 do re sol, sol'4~

    %65
    sol8 fa16 mib fa8 fa, sib sol' do, la'
    fa re sib fa' sol, sol' la, fad'
    re sib sol re' mib do r la'

    %68
    sib16 re, sol re sol re sol re mib do mib do mib do mib do
    fa do fa do fa do fa do re sib re sib re sib re sib
    mib sib mib sib mib sib mib sib\mbreak do la do la do la do la

    %71
    re la re la re la re la sib8 sol sib'4~
    sib la8 sol la la, la'4~
    la sol8 fad sol sol, sol'4~

    %74
    sol fad8 mi fad fad, fad'4-+
    sol8 re re4-+ r8 re re4-+
    r16 re sol sib la do sib la sib re, sol sib la do sib la\mbreak

    %77
    sib8 sib, sol[sol'] mib do la re
    sib16\p sol' sib, sol' sib, sol' sib, sol' la, sol' la, sol' la, fad' la, fad'
    sol4-! r r2\fermata

}


IIbcn = \relative do {

    r8
    r4 r8 r32 sol'(la sib) do8 do do sol
    la sol fad re sol sib fad re
    sol sib fad re sol,4-! r

    %4
    R1*5
    r2 r4 r8 r32 re'(mi fad)
    sol8 sol sol sol, do4 r8 r32 do(re mib?)

    %11
    fa?8 fa fa fa, sib4 r8 r32 sib'(do re)
    mib8 mib mib mib, la4 r8 r32 la(sib do)
    re8 re re re, sol4 r

    %14
    r r8 r32 \clef tenor \key sol\minor re'32(mi fad) sol8 sol sol re
    mi re dod la re fa dod la\mbreak
    re fa dod la re do? si sol

    %17
    do mib! si sol do mib si sol
    \clef bass \key sol\minor do sib? la fa sib la sol mib
    la sol fad re sol,4 r

    %20
    R1
    r2 r4 r8 r32 sol'(la sib)
    do8 do do sol la sol fad re\mbreak

    %23
    sol sib fad re sol sib fad re
    sol4 r r2
    r8 sib la fa? sib re la fa

    %26
    sib4 r r r8 r32 fa(sol la)
    sib8 sib sib sib, fa'4 r8 fa32(sol la si)
    do8 do do do, sol'4 r8 sol32(la sib? do)\mbreak

    %29
    re8 re re re, la'4 \clef tenor \key sol\minor r8 r32 la(si dod)
    re8 sib? mi do fa\clef bass \key sol\minor fa, la fa
    si sol dod la \clef tenor \key sol\minor  re fa dod la

    %32
    re fa dod la \clef bass \key sol\minor re,4 r
    r r8 r32 la'(si dod)\mbreak re8 re re re,
    sol4 r8 r32 sol(la si) do?8 do do do,

    %35
    fa4 r8 r32 fa(sol la) sib8 sib sib sib,
    mi4 r8 r32 mi(fa sol) la8 la la la,
    re4\clef tenor \key sol\minor fa'2 mi8 re

    %38
    mi mi, mi'2 re8 dod\mbreak
    re re, re'4~re dod8 si
    dod dod, \clef bass \key sol\minor r8 r32 la'(si dod) re8 re re re,

    %41
    sol4 r8 r32 sol(la si) do?8 do do do,
    fa4 r8 r32 fa(sol la) sib8 sib sib sib,
    mib mib,-! r r32 do'(re mib)\mbreak fa8 fa, r r32 re'(mib fa)

    %44
    sol8 sol, r r32 mib'(fa sol) la8 la, r r32 fa'(sol la)
    sib8 sib sib fa sol sol sol re
    mib mib mib sib do do' la fa

    %47
    sib sib, re sib r2
    R1*14
    r2\mbreak r4 r8 r32 fa'(sol la)

    %63
    sib8 sib sib sib, fa'4 r8 fa32(sol la si)
    do8 do do do, sol'4 r8 sol32(la sib? do)
    re8 re re re, sol mib la fa

    %66
    sib sib, re sib mi do fad re
    sol sol, sib sol\mbreak do la re re,
    sol4 sib'2 la8 sol

    %69
    la la, la'2 sol8 fad
    sol sol, sol'2 fad8 mi
    fad fad, r8 r32 re'(mi fad) sol8 sol sol sol,

    %72
    do4 r8 r32(do re mib?) fa?8 fa fa fa,\mbreak
    sib4 r8 r32 sib'(do re) mib8 mib mib mib,
    la4 r8 r32 la(sib do) re8 re re re,

    %75
    sol sib fad re sol sib fad re
    sol sib fad re sol sib fad re
    sol sib mib, sol do, la re re,

    %78
    sol'\p sib mib, sol do, la re re,
    sol4-! r r2\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1
    <6+>4 s s <6>
    s <6> s2
    s1*5
    s2s4 s8 s32 <_+> s16
    s2 <7>
    <7> <7>
    <7> <7>
    <7 _+> s
    s4 s8 s32 <_+> s16 s4 s8 <3->
    <6+>2 s4 <6>
    s <6> s <6>
    s <6> s2
    s4 <6> s <6>
    s <6> s2
    s1*2
    s2 <6+>4 <6>
    s <6> s <6>
    s1
    s8 <5> <6>4 s <6>
    s1
    s2 <5 4>8 <3> s4
    <4>8 <3-> s4 <5 4>8 <3> s4
    <4>8 <3> s s <5 4> <3+> s4
    <6 5>2 <9>8 <8> <6>4
    <6 5>2 s4 <6>
    s1
    s4 s8 s32 <3+> s16 s2
    <7>2 <7 _!>
    <7> <7>
    <7> <7 _+>
    s4 <6> <4 2> s
    <6> s <4 2> s
    <6> s <4 2> s
    s1
    <7 3!>2 <_->
    <7>1
    s
    s
    s2 <5>4 s8 <6>
    s2 s4 <6>
    s <6> s2
    s1*15
    s2 <5 4>8 <3> s4
    <4>8 <3-> s4 <4> 8<3> s4
    <4>8 <3> s4 <6 5>2
    <9>4 <6> <6 5> s
    <9> <6>s <_+>
    s <6> <2> s
    <6> s <2> s
    <6> s <2> s
    s1
    s2 <7>
    <7> <7>
    <7> <7 _+>
    s4 <6> s <6>
    s <6> s <6>
    s <5> <6 5> <_+>
    s s <6 5> <_+>

}

forma = {

    \time 4/4
    \key sol\minor
    \partial 8 s8
    \tempo 2 = 57
    s1*79
    \bar"|."

}



IIvlI = {
    \global
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    mib4 mib4. fa16(sol)
    fa4 fa4.-+ sol16(lab)
    sol8.-+ lab?16 sib4 mib,~

    %4
    mib re2-+
    mib4 sol2
    fa2.

    %7
    mib
    re8(do) re(mib) fa(sol)\mbreak
    do,2 fa4~

    %10
    fa mib2~
    mib8(do) re(mib) fa(re)
    sol mib \grace re do2-+

    %13
    sib4 sib4.-+ do16(re)
    do4 do4.-+ re16(mib)
    re8.-+ mib16 fa4 sib,~\mbreak

    %16
    sib la2_+
    sib4 sib'2
    lab2.

    %19
    sol2 do4~
    do sib2
    lab2.

    %22
    sol
    fa2 sib4~
    sib lab2~

    %25
    lab4 sol2~\mbreak
    sol4 lab2
    sol2.-+

    %28
    fa2 sib4~
    sib lab2~
    lab4 sol2~

    %31
    sol4 fa2~
    fa8(mib) fa (sol) lab(fa)
    sol(fa) sol(lab) sib(sol)\mbreak

    %34
    re(do) re(mib) fa(re)
    mib(fa) sol2
    fa2.

    %37
    mib2 r4\fermata
    fa2.
    sol

    %40
    la!-+
    sib4. sol8(fa mib)\mbreak
    re(mib) re(do) sib(la)

    %43
    sib2.\fermata

}

IIIvlIIn = \relative do'' {

    R2.*2
    mib4 mib4. fa16(sol)
    fa4 fa4.-+ sol16(lab)

    %5
    sol8.-+ lab16 sib4 mib,~
    mib re2~
    re4 do2~

    %8
    do4 sib2~
    sib4 la fa
    sol8(fa) sol(la) sib(sol)

    %11
    la4 fa sib~
    sib la2_+
    sib4 r r

    %14
    R2.\mbreak
    sib4 sib4.-+ do16(re)
    do4 do4.-+ re16(mib)

    %17
    re8(do) re(mib) fa(sol)
    do,2 fa4~
    fa mib2

    %20
    re sol4~
    sol fa2~
    fa4 mib2~

    %23
    mib4 reb2
    mib fa4~
    fa2.

    %26
    mi4 do fa~
    fa mib!2~
    mib4 re?2\mbreak

    %29
    do2.
    sib2 mib4~
    mib2.

    %32
    re8(do) re(mib) fa(re)
    mib(re) mib(fa) sol (mib)
    fa(mib) fa(sol) lab(fa)

    %35
    sol(sib) mib,2~
    mib4 re2-+
    mib r4\fermata

    %38
    sib2.
    mib~
    mib

    %41
    re8(sol) fa(mib) re(do)
    sib(sol) fa(mib) re(do)
    <<re2.\fermata\\sib>>

}


IIIbcn = \relative do {

    mib8(fa) sol(fa) sol(mib)
    lab fa sib lab sib sib,
    mib(fa) sol(fa) sol(mib)

    %4
    lab (fa) sib (lab) sib (sib,)
    \clef tenor \key sib\major mib' fa mib re do sib
    la fa sib la sib fa

    %7
    sol mib la sol la fa\mbreak
    \clef bass \key sib\major sib, la sib do re mib
    fa sol fa mib re sib

    %10
    mib re mib fa sol mib
    fa fa, sib do re sib
    mib do fa4 fa,

    %13
    \clef tenor \key sib\major sib'8(do) re(do) re(sib)
    mib do fa mib fa fa,
    \clef bass \key sib\major sib, do re do re sib

    %16
    mib do fa mib fa fa,
    sib(la) sib(do) re(mi)
    fa(mi) fa(sol) lab(si,)

    %19
    do si do re mib fa
    sol fa sol lab sib sol
    do(lab) re(do) re(sib)

    %22
    mib, re mib fa sol mib\mbreak
    la! fa sib lab sol fa
    mi do fa sol lab fa

    %25
    sib lab sib do reb sib
    do do, fa sol lab fa
    sib sol do sib do sol

    %28
    la! fa sib do re sib
    \clef tenor \key sib\major mib do fa mib fa do
    re sib mib re do sib\mbreak

    %31
    \clef  bass\key sib\major  lab(sol) lab(sib) do(lab)
    sib,2.~
    sib~

    %34
    sib
    mib8 (re) mib(fa) sol(mib)
    lab(fa) sib4 sib,

    %37
    mib2 r4\fermata
    re2.
    do~

    %40
    do
    sib~
    sib

    %43
    sib\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> s
    <6 5>2.
    s4 <6>2
    <6 5>2.
    s
    <6 5>
    <6 5>4 <3->2
    <9>4 <8> 2
    <5 4>4 <3> <6>
    <9> <8> <6>
    <7> s <6>
    <6 5> <_!> s
    s <6> s
    <6> <_!> s
    s <6> s
    <6 5> <_!> s
    s2.
    <5 4>4 <_-> s
    <5 4> <_-> s
    <5 4> s <6>
    <6- 5> <5-> s
    <9> <8> <6>
    <6 5> <_-> s
    <6 5> <_-> <6>
    <7 _-> <6 5> s
    <_!> <_-> <6>
    <6 5 _-> <_-> s
    <6 5> <_!> s
    <6 5> <_-> s
    <6 5->2.
    <7>4 <6 5> s
    s2.
    <6 4>
    <5>
    s2 <6>4
    <6 5>2.
    s
    <6>
    <5>
    <6!>

}

forma = {

    \time 3/4
    \key sib\major
    \tempo 4 = 53
    s2.*43
    \bar"|."

}



IIIvlI = {
    \global
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    re16
    re8 sol fad
    \appoggiatura fad? sol4 re8
    mib \grace re do4-+

    %4
    re8 \grace do sib4-+
    do8 \grace sib8 la4-+
    sib16(do) re4

    %7
    sib16.-+ do32 (re4)
    sib16 re do sib la sol
    fad16._+ sol32 sol8._+ [fad32 sol]

    %10
    la16 re do sib la sol
    fad16. sol32 \mbreak sol8._+ [fad32 (sol)]
    re4 r16 re'\p

    %13
    re8\f sol re
    \once\stemDown mib do, r
    do' fa do

    %16
    \once\stemDown re sib, r
    fa'' sib-! fa
    sol-!\noBeam sib,8._+ la32 (sib)

    %19
    fa'8-!\noBeam sib,8._+ la32 (sib)
    sol'8\noBeam sib,8._+ la32 (sib)
    fa'16 re sol mib la fa\mbreak

    %22
    sib8-!\noBeam sib,8._+ la32 (sib)
    fa'16 re sol mib la fa
    sib8 sib, mib8\noBeam

    %25
    re16. do32 do8.-+[sib16]
    sib8-! r r
    sol re' fa

    %28
    \grace fa mi4.
    la,8 mi' sol
    \grace  sol fad4-+ sol8

    %31
    mib?-!\noBeam sib'8.-+ la32(sib)
    la8 dod, re
    mib,!-!\noBeam sol'8.-+ fa32(sol)\mbreak

    %34
    fa8 la, sib
    do,-!\noBeam mib'8.-+ re32(mib)
    re8 fad, sol

    %37
    mib'8\noBeam sol,8._+  fad32(sol)
    re'8-!\noBeam sol,8._+  fad32(sol)
    mib'8-!\noBeam sol,8._+  fad32(sol)

    %40
    re'16 sib mi do fad re
    sol8\noBeam sol,8._+  fad32(sol)
    re'16 sib mi do fad re

    %43
    sol8 sol, do\noBeam\mbreak
    sib la4_+
    sib16 re re, do' sib la

    %46
    sib re re, do' sib la
    sib16. sol'32 la,8._+[sol16]
    sol4 r16 re' sol,4\fermata r8

    %49
    sol16(sib) re(sol) la,(fad')
    sol sib re, sol sib, re
    mib sol do, mib re do

    %52
    re sib' sib, re do sib
    do la' la, do sib la
    sib re re, do' sib la

    %55
    sib re re, do' sib la
    sib re do sib la sol
    fad16. sol32 sol8._+ [fad32(sol)]\mbreak

    %58
    la16 re do sib la sol
    fad16. sol32 sol8._+ [fad32(sol)]
    re4 r16 sol

    %61
    sol (sib) re (sol) la, (fad')
    sol sib re, sol sib, re
    mib sol do, mib re do

    %64
    re sib' sib, re do sib
    do la' la, do sib la
    sib re re, do' sib la

    %67
    sib re re, do' sib la\mbreak
    sib re do sib la sol
    fad16. sol32 sol8._+ [fad32(sol)]

    %70
    la16 re do sib la sol
    fad16. sol32 sol8._+ [fad32(sol)]
    re4 r16 re'

    %73
    re sol, si re sol re
    mib8-!\noBeam mib8.-+re32 mib
    do16 fa, la do fa do

    %76
    re8 re, r\mbreak
    fa'16 sib re, fa sib, fa'
    sol sib, la sib la sib

    %79
    fa' sib, la sib la sib
    sol' sib, la sib la sib
    fa'8-+ sol-+ la-+

    %82
    sib\noBeam sib,8.-+ la32(sib)
    fa'16 re sol mib la fa
    sib8 sib, mib\noBeam

    %85
    re16. do32 do8.-+[sib16]
    sib8 r r\mbreak
    sol16 si re sol sol, fa'

    %88
    \grace fa8 mi4.
    la,16 dod mi la la, sol'
    \grace sol8 fad4-+ sol8

    %91
    mib16(sol) sol(sib) sib(la)
    la(re,) dod(re) dod(re)
    mib,[(sol)] sib(sol') sol(fa)

    %94
    fa(sib,) la(sib) la(sib)
    do,[(mib)] sol(mib') mib(re)\mbreak
    re(sol,) fad(sol) fad(sol)

    %97
    mib'(sol,) fad(sol) fad(sol)
    re'(sol,) fad(sol) fad(sol)
    mib'(sol,) fad(sol) fad(sol)

    %100
    re'(sib) mi(do) fad(re)
    sol8\noBeam sol,8.-+ fad32(sol)
    re'(do re16) mi32[(re mi16)] fad32(mi fad16)\mbreak

    %103
    sol8 sol, do
    sib la4_+
    sib16 re re, do' sib la

    %106
    sib re re, do' sib la
    sib16. sol'32 la,8._+[sol16]
    sol4 r16 re' sol,4\fermata r8

}

IVvlIIn = \relative do'' {

    re16
    re8 sol fad
    \appoggiatura fad? sol4 re8
    mib \grace re do4-+

    %4
    re8 \grace do sib4-+
    do8 \grace sib8 la4-+
    sib16(do) re4

    %7
    sib16.-+ do32 (re4)
    sib16 re do sib la sol
    fad16._+ sol32 sol8._+ [fad32 sol]

    %10
    la16 re do sib la sol
    fad16. sol32 \mbreak sol8._+ [fad32 (sol)]
    re4 r16 re'\p

    %13
    re8\f sol re
    \once\stemDown mib do, r
    do' fa do

    %16
    \once\stemDown re sib, r
    fa'' sib-! fa
    sol-!\noBeam sib,8._+ la32 (sib)

    %19
    fa'8-!\noBeam sib,8._+ la32 (sib)
    sol'8\noBeam sib,8._+ la32 (sib)
    fa'16 re sol mib la fa\mbreak

    %22
    sib8-!\noBeam sib,8._+ la32 (sib)
    fa'16 re sol mib la fa
    sib8 sib, mib8\noBeam

    %25
    re16. do32 do8.-+[sib16]
    sib8-! r r
    sol re' fa

    %28
    \grace fa mi4.
    la,8 mi' sol
    \grace  sol fad4-+ sol8

    %31
    mib?-!\noBeam sib'8.-+ la32(sib)
    la8 dod, re
    mib,!-!\noBeam sol'8.-+ fa32(sol)\mbreak

    %34
    fa8 la, sib
    do,-!\noBeam mib'8.-+ re32(mib)
    re8 fad, sol

    %37
    mib'8\noBeam sol,8._+  fad32(sol)
    re'8-!\noBeam sol,8._+  fad32(sol)
    mib'8-!\noBeam sol,8._+  fad32(sol)

    %40
    re'16 sib mi do fad re
    sol8\noBeam sol,8._+  fad32(sol)
    re'16 sib mi do fad re

    %43
    sol8 sol, do\noBeam\mbreak
    sib la4_+
    sib16 re re, do' sib la

    %46
    sib re re, do' sib la
    sib16. sol'32 la,8._+[sol16]
    sol4 r16 re' sol,4\fermata r8

    %49
    sol,-! sib-! re-!
    sol sib sol
    do la fa

    %52
    sib sol mib
    la fad re
    sol fad re

    %55
    sol fad re
    sol mib do
    re sib sol

    %58
    re' mib do
    re sib sol
    re'4 r16 sol

    %61
    sol16(sib) re(sol) la,(fad')
    sol sib re, sol sib, re
    mib sol do, mib re do

    %64
    re sib' sib, re do sib
    do la' la, do sib la
    sib re re, do' sib la

    %67
    sib re re, do' sib la
    sib re do sib la sol
    fad16. sol32 sol8._+ [fad32(sol)]\mbreak

    %70
    la16 re do sib la sol
    fad16. sol32 sol8._+ [fad32(sol)]
    re8. mib16 re do

    %73
    si8 sol si
    do16 mib sol do sib, sib'
    la8 fa la

    %76
    sib,16 re fa sib do, do'
    re,8 sib re
    mib sol sib

    %79
    re, fa sib
    mib, sol sib
    re,16 sib' mib, sib' fa sib

    %82
    sol sib fa sib mib, sib'
    re, sib' mib, sib' fa sib
    sol8 sol, la'

    %85
    sol8 mib fa
    sib, r r
    sol'16 si re sol sol, fa'

    %88
    \grace fa8 mi4.
    la,16 dod mi la la, sol'
    \grace sol8 fad4 sol8

    %91
    mib16(sol) sol(sib) sib(la)
    la(re,) dod(re) dod(re)
    mib,[(sol)] sib(sol') sol(fa)

    %94
    fa(sib,) la(sib) la(sib)
    do,[(mib)] sol(mib') mib(re)\mbreak
    re(sol,) fad(sol) fad(sol)

    %97
    mib'(sol,) fad(sol) fad(sol)
    re'(sol,) fad(sol) fad(sol)
    mib'(sol,) fad(sol) fad(sol)

    %100
    re'(sib) mi(do) fad(re)
    sol8\noBeam sol,8.-+ fad32(sol)
    re'(do re16) mi32[(re mi16)] fad32(mi fad16)\mbreak

    %103
    sol8 sol, do
    sib la4_+
    sib16 re re, do' sib la

    %106
    sib re re, do' sib la
    sib16. sol'32 la,8._+[sol16]
    sol8. mib16 re do sol'4\fermopz r8

}


IVbcn = \relative do {

    r16
    sol'8 sib re
    sol, sol, sib'
    do la fa

    %4
    sib sol mib
    la fad re
    sol fad re

    %7
    sol fad re
    sol mib do
    re sib sol-!

    %10
    re' mib do
    re mib mib,
    re'16 mib' re do sib\p la

    %13
    sol8\f si sol
    r do sib
    la fa la

    %16
    sib sib, do
    re sib re
    mib sol sib

    %19
    re, fa sib
    mib, sol sib
    re, mib fa

    %22
    sol16-! sib fa sib mib, sib'
    re,8 mib fa
    sol sol, la'\mbreak

    %25
    sib fa fa,
    sib re' do
    si sol sol,

    %28
    do mi' re
    dod la la,
    re16 mib? re do sib la

    %31
    sol8 sol' sol
    fa mi re
    r mib! mib

    %34
    re do sib
    r do' do
    sib la sol

    %37
    do, mib sol\mbreak
    sib, re sol
    do, mib sol

    %40
    sib, do re
    mib!16 sol re sol do, sol'
    sib,8 do re

    %43
    mib sib' la
    sol re' re,
    sol fad re

    %46
    sol fad re
    sol re' re,
    sol16 mib' re do sib la sol mib' re do sib la

    %49
    sol8 r r
    R4.*10
    re'16 mib re do sib la

    %61
    sol8 sib re
    sol, sib sol
    do la fa

    %64
    sib sol mib
    la fad re
    sol fad re

    %67
    sol fad re
    sol mib do
    re sib sol

    %70
    re' mib do
    re mib4
    re r8\mbreak

    %73
    R4.*13
    sib'16 do re8 do
    si sol si

    %88
    do16 re mi8 re
    dod la dod
    re16 mib? re do? sib? la

    %91
    sol8 \clef tenor \key sol\minor sol' sol
    fa mi re
    \clef bass \key sol\minor r8 mib! mib

    %94
    re do sib
    r do do
    sib la sol\mbreak

    %97
    do, mib sol
    sib, re sol
    do, mib sol

    %100
    sib, do re
    mib16 sol re sol do, sol'
    sib,8 do re

    %103
    mib sib' la
    sol re' re,
    sol fad re

    %106
    sol fad re
    sol re' re,
    sol,4 r8 sol4\fermopz r8

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s16
    s8 <6> <_+>
    s s <6>
    s <6> s
    s4.
    s8 <6>4
    s8 <6>4
    s8 <6>4
    s8 <6> <6>
    <_+> <6> s
    <_+> <6> s
    <_+> <7> <6+>
    <_+>4.
    s4.*2
    <6>4.
    s
    <6>
    s
    <6>
    s <6>
    s
    s
    s4 <5->8
    s4.
    s
    <6>8 s <7>
    <_!>4.
    <6>8 s <7>
    <_+>4 <6>8
    <6>4.
    <6>8 <6+> s
    s <5> s
    <6> <6> s
    s <5> s
    <6> <6+> s
    s4.
    <6>
    s
    s8 <_!> <_+>
    s4.
    <6>8 <_!> <_+>
    s <6> <6+>
    s <_+> s
    s <6> s
    s <6> s
    s <_+> s
    s4.
    s
    s4.*11
    <_+>4.
    s4 <_+>8
    s4.
    s8 <6> s
    s4.
    <6+>8 <6> s
    s <6> s
    s <6> s
    s <6> s
    <_+> <6> s
    <_+> <6> s
    s <7> <6+>
    <_+>4.
    s4.*14
    <6>4.
    <_!>
    <6>
    <_+>4 <6>8
    <6>4 <5>8
    <6> <6+> s
    s4.
    <6>8 <6> s
    s4.
    <6>8 <_+> <6>
    s4.
    <6>
    s
    <6>8 <_!> <_+>
    s4.
    <6>8 <_!> <_+>
    <5> <6> <6+>
    s <_+> s
    s <6> s
    s <6> s
    s <_+> s

}

forma = {

    \time 3/8
    \key sol\minor
    \tempo 4. = 57
    \partial 16 s16
    \repeat volta 2 {s4.*12}
    \repeat volta 2 {s4.*35}
    \alternative {{s4.}{s}}\break
    \bar ".|"%\pageBreak
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +2)
    \mark \markup {"Aria" II.\super a}
    \set Score.currentBarNumber = #49
    s4.*24
    \repeat volta 2{ s4.*35}
    \alternative {{s4.}{s}}
    \bar"|."

}



IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VvlIn = \relative do'' {

    fa4
    sib,8(la) sib(do) re(sib)
    do4 fa, fa'~
    fa mib8(re) mib(do)

    %4
    re4 fa sib~
    sib la8(sol) la(fa)
    sol4 do, do'~

    %7
    do8 la sib2~\mbreak
    sib8 sol la2-+
    sib4 re,8(mib) fa(re)

    %10
    mib4 do4.-+ re8
    sib4 sol'2
    fa4. mi8 fa(re)

    %13
    mi(sol) fa(la) sol(sib)
    la(do) mi,(sol) fa(la)
    sol(sib) la(do) fa,4~

    %16
    fa mi2-+\mbreak
    fa8 mi fa(sol) la(fa)
    sol4 do, do'~

    %19
    do sib8(la) sib(sol)
    la4 do, fa~
    fa mi8(re) mi(do)

    %22
    re4 sol, sol'~
    sol8 mi fa2~
    fa8 re mib! (re) mib4~

    %25
    mib re8(do) re(sib)\mbreak
    do4 do'2
    sib4. lab8 sib(sol)

    %28
    lab(sib) lab(sol) fa(lab)
    sol(lab) sol(fa) mib(sol)
    fa(sol) fa(mib) re(fa)

    %31
    mib4 sol do
    lab8(fa) \grace mib re2-+
    do4 r do'~\mbreak

    %34
    do sib8(lab) sib(sol)
    lab4 sib, lab'~
    lab! sol8(fa) sol(mib)

    %37
    fa4. mib8 fa(re)
    mib4. re8 mib(do)
    re(fa) sib,4 sib'~

    %40
    sib la8(sol) la(fa)
    sol4 do, do'~
    do8 la sib2~\mbreak

    %43
    sib8 sol la2-+
    sib4 r r
    r r fa

    %46
    sib,8(la) sib(do) re(sib)
    do4 fa, fa'~
    fa mib8(re) mib(do)

    %49
    \grace sol' fad8.(sol32 la?) sol8[(la) sib(sol)]
    \grace fa mi8.(fa32 sol) fa8[(sol) lab(fa)]
    \grace mib re8.(mib32 fa) mib8[(fa) sol(mib)]

    %52
    \grace re8 dod8.(re32 mi) re8[(la'?) fa(re)]
    \grace do si8.(do32 re) do8[(sol') mib?(do)]
    la(do) sib(re) do( mib)

    %55
    re(fa) la,(do) sib(re)
    do(mib) re(fa) mib(la)\mbreak
    sib2~sib8 fa

    %58
    sol(mib) do2-+
    sib8 sib' \grace fa mi2
    fa4. sib,8\p la[(do)]

    %61
    sib(re) do(mib) re(fa)
    la,(do) sib(re) do( mib)
    re2 fa8.-+(mib32 fa)

    %64
    sol8(mib) \grace re do2-+
    sib r4\fermata

}

VvlIIn = \relative do'' {

    r4
    r r sib
    fa8(mi) fa(sol) la(fa)
    sol4 do, do'~

    %4
    do sib8(la) sib(re)
    mib4 do4. re8
    sib4 sol'2

    %7
    fa4. mib8 fa(re)
    mib4 do8(re) mib(do)
    re4 fa sib~

    %10
    sib la8(sol) la(fa)\mbreak
    sol4 do, do'~
    do8 la sib2~

    %13
    sib4 la8(fa)mi(sol)
    fa(la) sol(sib) la(do)
    mi,(sol) fa4. la8

    %16
    re,(sib) \grace la sol2_+
    <<la4\\fa>> r fa'
    do8(si) do(re) mi(do)

    %19
    re4 sol, sol'~
    sol fa8(mi) fa(la,)\mbreak
    sib4 sol4. la8

    %22
    fa4 re'8(do) re(sib)
    do4. sib8 do(la)
    sib2 do8(la)

    %25
    fa4 fa'4. sol8
    mib4 fa8(mib) fa(do)
    re4 mib2~

    %28
    mib8 re16(do) re2~
    re8 do16(si) do2~
    do8 si16(la) si2-+\mbreak

    %31
    do4 mib2
    re8(do) \grace do si2-+
    do8(si) do(re) mib(do)

    %34
    re4 sol, sol'~
    sol fa8(mib) fa(re)
    mib4 sol, mib'~

    %37
    mib re8(do) re4~
    re8 sib do(sib) do(la)
    sib(do) re(mib) fa(re)\mbreak

    %40
    mib4 do4. re8
    sib4 sol'2
    fa4. mib8 fa (re)

    %43
    mib4 do fa
    sib,8(la) sib(do) re(sib)
    do4 fa,4. la8

    %46
    sib4 sib'2~
    sib4 lab2
    sol la!4

    %49
    re, re'2
    do2.
    sib

    %52
    la4. dod,8 re(la')\mbreak
    sol4. si,8 do(sol')
    fa2.~

    %55
    fa
    la,8(do) sib(re) do(mib)
    re(fa) sib,(re) fa,(re')

    %58
    mib do \grace sib la2_+
    sib8(re) sol,(la) sib(sol)
    la\p(do) sib(re) do(mib)

    %61
    re(fa) la,(do) sib(re)\mbreak
    do(mib) re(fa) mib(la)
    sib4 sib,2~

    %64
    sib8 do \grace sib la2_+
    sib r4\fermata

}


Vbcn = \relative do {

    r4
    R2.*2
    r4 r \clef tenor \key sib\major fa'
    sib,8(la) sib(do) re(sib)

    %5
    do4 fa, fa'~
    fa mib8(re) mib(do)
    re4. do8 re(sib)

    %8
    do4 \clef bass \key sib\major fa,2
    sib,8(la) sib(do) re(sib)
    do4 fa, fa'~\mbreak

    %11
    fa mib8(re) mib(do)
    re4. do8 re sib
    do2.~

    %14
    do~
    do8(do') fa,(la) re,(fa)
    sib, re do4 do,

    %17
    fa r r
    R2.
    r4 r do''

    %20
    fa,8(mi) fa(sol) la(fa)
    sol4 do, do'~\mbreak
    do sib8(la) sib(sol)

    %23
    la4. sol8 la fa
    sol(fa) sol(sib) la(do)
    sib4 sib, sib'~

    %26
    sib lab8 sol lab4~
    lab sol8(fa) sol(mib)
    fa(mib) fa(sol) lab(fa)

    %29
    mib(re) mib(fa) sol(mib)\mbreak
    re(do) re(mib) fa(sol)
    do,(si) do(re) mib(do)

    %32
    fa lab sol4 sol,
    do r r
    R2.*4

    %38
    \clef tenor \key sib\major r4 fa'2
    sib,8(la) sib(do) re(sib)
    do4 fa, fa'~

    %41
    fa mib8(re) mib(do)
    re4. do8 re(sib)
    do4 fa, r

    %44
    \clef bass \key sib\major r4 r sib
    fa8(mi) fa(sol) la(fa)
    sol(fa) sol(la) sib(sol)

    %47
    mi4 fa8(mib) re(do)
    si4 do do'~
    do sib2~

    %50
    sib4 lab2~\mbreak
    lab4 sol2~
    sol4 fa2~

    %53
    fa4 mib2~
    mib4 re8(sib') la(do)
    sib(re) do(mib) re(sib)

    %56
    fa2.
    sib8(re) sol,(sib) re,(sib')
    mib,4 fa fa,

    %59
    sol' do do,
    fa2.\p~
    fa~\mbreak

    %62
    fa
    sib8(re) sol,(sib) re,(sib')
    mib,4 fa fa,

    %65
    sib2 r4\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2.*3
    <9>4 <8> s
    <7>2.
    <4 2>4 <6>2
    <7>4 <6> s
    <7>2.
    s2 <6>4
    <_- 7>2.
    <4 2>4 <6> s
    <7> <6>8 <_!> s4
    <7 3!> <6 4> <5 3!>
    <6 4> <5 3> <6 4>
    <_!> s <5>
    <6 5> <_!> s
    s2.
    s
    s4 s <_!>
    <9> <8> s
    <7> <_!> s
    <4 2> <6> s
    <7> <6> s
    <7> <6-> <5->
    <5 4> <3> s
    <4 2> <6> s
    <4 2> <6> s
    <_- 7> <6> s
    <7> <6> s
    <7> <6!> s
    s2.
    <_- 6 5>4 <_!> s
    s2.*5
    s4 <7>2
    s2.
    <7>
    <2>4 <6> s
    <7> <6> s
    <7>2.
    s
    <5 4>4 <3> s
    <5> s s
    <6 5> <_-> s
    <6 5> s <[6!]>
    <4+ 2> <6> s
    <4! 2> <6> s
    <2>4 <6> s
    <4+ 2> <6> s
    <4! 2> <6> s
    <4 2> <6> <6>
    s <6> <6>
    <5 3> <6 4> <7 3>
    s <5> <6>
    <6 5>2.
    <7>4 <_!> <7>
    <5 3> <6 4> <7 3>
    <6 4> <5 3> <6 4>
    <5 3> <6 4> <7 3>
    s <5> <6>
    <6 5>

}

forma = {

    \time 3/4
    \key sib\major
    \tempo 2 = 43
    \partial 4 s4
    s2.*65
    \bar"|."

}



VvlI = {
    \global
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIvlIn = \relative do'' {

    sib4-! sib-! sib-! sib-!
    fa'2.-+ mib8 fa
    sol4 fa sol re

    %4
    mib2.-+ re8 mib
    fa4 mib fa do
    re8 fa mib re sol fa mib re

    %7
    do mib re do fa mib re do
    sib re do sib mib re do sib
    la do sib la re do sib la

    %10
    sol sib la sol do sib la sol
    la4 do mi, do'
    fa, do' sol do

    %13
    la2-! do,
    re mi
    fa4 fa' la, fa'\mbreak

    %16
    sib, fa' do fa
    re2-! fa,
    sol la

    %19
    sib-! r
    fa'4 fa fa fa
    sib2.-+ la8 sib

    %22
    do4 sib do sol
    la2.-+ sol8 la
    sib4 sib, sib'2~

    %25
    sib la~
    la sol~
    sol fa~\mbreak

    %28
    fa mi
    fa r
    R1

    %31
    r4 do mi, do'
    fa, do' sol do
    la2-! r

    %34
    R1
    r4 fa' la, fa'
    sib, fa' do fa

    %37
    re2 sib'~
    sib la
    re,4 re re re

    %40
    sol,1\mbreak
    do4 do do do
    fa,2 r

    %43
    R1*5
    do'4 do do do
    fa2.-+ mi8 fa

    %50
    sol4 fa sol re
    mi2.-+ re8 mi
    fa4 do' la re

    %53
    sib re sol, do
    la do fa, sib
    sol sib mi, la

    %56
    fa la re, sol\mbreak
    mi2 r
    R1

    %59
    r8 do(re do) mi, do' re do
    fa, do' re do sol do re do
    la2 r

    %62
    R1
    r8 fa' sol fa la, fa' sol fa
    sib, fa' sol fa do fa sol fa

    %65
    re2-! r
    re8 sib' re, sib' re, sib' re, sib'\mbreak
    re, sib' re, sib' re, sib' re, sib'

    %68
    do, sib' do, sib' do, sib' do, sib'
    do, la' do, la' do, la' do, la'
    sib, la' sib, la' sib, la' sib, la'

    %71
    sib, sol' sib, sol' sib, sol' sib, sol'
    la, sol' la, sol' la, sol' la, sol'
    la, fa' la, fa' la, fa' la, fa'

    %74
    sol, fa' sol, fa' \mbreak sol, fa' sol, fa'
    sol, mi'  sol, mi'  sol, mi'  sol, mi'
    fa4 fa fa fa

    %77
    do'2.-+ sib8 do
    re4 do re la
    sib2.-+ la8 sib

    %80
    do4 sib do sol
    la8 do sib la re do sib la
    sol sib la sol do sib la sol\mbreak

    %83
    fa la sol fa sib la sol fa
    mi sol fa mi la sol fa mi
    re fa mi re sol fa mi re

    %86
    do mi re do fa mi re do
    sib4 sib, sib''2~
    sib4 la8 sol la4 fa

    %89
    sol do, do'2~\mbreak
    do4 sib8 la sib4 sol
    la re, re'2~

    %92
    re4 la8 sol la4 fa
    sib2.-+ la8 sib
    do4 sib do sol

    %95
    la2.-+ sol8 la
    sib4 la sib fa
    sol2.-+ fa8 sol

    %98
    la4 sol la mi
    fa2.-+ mi8 fa\mbreak
    sol4 fa sol re

    %101
    mi8 sol fa mi la sol fa mi
    re fa mi re sol fa mi re
    do mi re do fa mi re do

    %104
    sib re do sib mi re do sib
    la do sib la\mbreak re do sib la
    sol sib la sol do sib la sol

    %107
    la4 <<mi'\\do>> fa2~
    fa mi
    fa4 fa fa fa

    %110
    sib2.-+ la8 sib
    do4 sib do sol
    la2.-+ sol8 la\mbreak

    %113 OOKK
    sib2 r
    R1*4
    sib,4 sib sib sib

    %119
    fa'2.-+ mib8 fa
    sol4 fa sol re
    mib2.-+ re8 mib

    %122
    fa4 mib fa do
    re8 fa mib re sol fa mib re
    do mib re do\mbreak fa mib re do

    %125
    sib re do sib mib re do sib
    la do sib la re do sib la
    sib4 sol sib'2~

    %128
    sib la~
    la sol~
    sol fad

    %131
    r8 sol re sol re sol re sol
    mib sol mib sol\mbreak mib sol mib sol
    mib do' mib, do' mib, do' mib, do'

    %134
    re, sib' re, sib' re, sib' re, sib'
    re, sib' re, sib' re, sib' re, sib'
    do, la' do, la' do, la' do, la'

    %137
    do, la' do, la' do, la' do, la'
    sib, sol' sib, sol' sib, sol' sib, sol'\mbreak
    la, sol'  la, sol' la, fad' la, fad'

    %140
    sol2 r
    R1*2
    sol,4 sol sol sol

    %144
    re'2.-+ do8 re
    mib4 re mib sib
    do2.-+ sib8 do

    %147
    re4 do re la
    sib8 re mib re fad, re' mib re
    sol, re' mib re\mbreak la re mib re

    %150
    sib2-! re,
    mi fad
    sol8 sol' lab sol si, sol' lab sol

    %153
    do, sol' lab sol re sol lab sol
    mib2-! sol,
    la si

    %156
    do8-! fa sol fa la, fa' sol fa
    sib, fa' sol fa\mbreak do fa sol fa
    re2 fa,

    %159
    sol la
    sib4 fa sib2~
    sib la

    %162
    sib2.-+ la8 sib
    do4 sib do sol
    la2.-+ sol8 la

    %165
    sib4-! sib-! sib-! sib-!
    fa'2.-+ mib8 fa
    sol4 fa sol re\mbreak

    %168
    mib2.-+ re8 mib
    fa4 mib fa do
    re8 fa mib re sol fa mib re

    %171
    do mib re do fa mib re do
    sib re do sib sib'2~
    sib la~

    %174
    la sol~
    sol fa~
    fa mib~

    %177
    mib4 re8 do re4 fa\mbreak
    sol,8 sib la sol mib' re do sib
    la do sib la fa' mib re do

    %180
    sib re do sib sol' fa mib re
    do mib re do la' sol fa mib
    re fa(sol fa) la, fa'(sol fa)

    %183
    sib, fa' sol fa do fa sol fa\mbreak
    re2 r
    R1

    %186
    r8 sib'(do sib) re, sib'(do sib)
    mib, sib'(do sib) fa sib do sib
    sol2 r

    %189
    R1
    r8 do re do mi, do' re do
    fa, do' re do sol do re do

    %192
    la2 r
    R1\mbreak
    r2 fa~

    %195
    fa sib~
    sib la
    re,4 re re re

    %198
    sol,1
    fa4 fa fa fa
    sib2.-+ la16(sib do8)

    %201
    re4 do re la
    sib2.-+ la8 sib
    do4 sib do sol\mbreak

    %204
    la2.-+ sol8 la
    sib4 fa' re sol
    mib sol do, fa

    %207
    re fa sib, mib
    do mib la, re
    sib re sol, do

    %210
    la2 sib
    sib'1
    la

    %213
    sol
    fa
    mib

    %216
    re4 sib'2 sib,4~
    sib sib'2 sib,4~
    sib sib'2 sib,4~

    %219
    sib sib'2 sib,4~
    sib8 sib' re, sib' re, sib' re, sib'
    do, sib' do, sib' do, la' do, la'

    %222
    sib,4 sib'2 fa4
    sol mib do fa
    re2-! r\fermata

}

VIvlIIn = \relative do'' {

    R1
    fa,4-! fa-! fa-! fa-!
    sib2.-+ la8 sib

    %4
    do4 sib do sol
    la2._+ sol8 la
    sib2 sib'~

    %7
    sib la~
    la sol~
    sol fa~

    %10
    fa mi
    fa-! do,
    re mi

    %13
    fa4 do' mi, do'
    fa, do'\mbreak sol do
    la2-! fa

    %16
    sol la
    sib4 fa' la, fa'
    sib, fa' do fa

    %19
    re fa sib2~
    sib la
    re,4 re re re

    %22
    sol1
    do,4 do do do
    fa, fa' re sol

    %25
    mib sol do, fa
    re fa sib, mib
    do mib la, re\mbreak

    %28
    sib re sol, do
    la2-! do,
    re mi

    %31
    fa r
    R1
    r2 fa

    %34
    sol la
    sib r
    R1

    %37
    sib4 sib sib sib
    fa'2.-+ mib8 fa
    sol4 fa sol re

    %40
    mib2.-+ re8 mib
    fa4 mib fa do
    re8 fa mib re\mbreak sol fa mib re

    %43
    do mib re do fa mib re do
    sib re do sib mib re do sib
    la do sib la re do sib la

    %46
    sol sib la sol do sib la sol
    la4 do fa2~
    fa mi

    %49
    la,4 la la la
    re1\mbreak
    sol,4 sol sol sol

    %52
    do, mi' fa2~
    fa mi~
    mi re~

    %55
    re do~
    do si
    r8 do(re do) mi, do' re do

    %58
    fa, do' re do sol do re do
    la2-! do,-!
    re-! mi-!

    %61
    fa8 fa' sol fa la, fa' sol fa\mbreak
    sib, fa' sol fa do fa sol fa
    re2-! fa,-!

    %64
    sol-! la-!
    sib4 sib sib sib
    fa'2.-+ mib8 fa

    %67
    sol4 fa sol re
    mib2.-+ re8 mib
    fa4 mib fa do

    %70
    re2.-+ do8 re
    mib4 re mib sib
    do2.-+ sib8 do

    %73
    re4 do\mbreak re la
    sib2.-+ la8 sib
    do4 sib do sol

    %76
    la2-! r
    do4 do do do
    fa2.-+ mi8 fa

    %79
    sol4 fa sol re
    mi2.-+ re8 mi
    fa2 r

    %82
    R1
    r8 do' sib la re do sib la
    sol sib la sol do sib la sol\mbreak

    %85
    fa la sol fa sib la sol fa
    mi sol fa mi la sol fa mi
    re fa mi re sol fa mi re

    %88
    mi4 do fa2~
    fa4 mi8 re mi4 do
    re sol, sol'2~

    %91
    sol4 fa8 mi fa4 re
    mi la, la'2~
    la sol4 fa\mbreak

    %94
    sol1~
    sol2 fa4 mi
    fa1~

    %97
    fa2 mi4 re
    mi1~
    mi2 re4 do

    %100
    re1-+
    do2 do'~
    do sib~

    %103
    sib la~
    la sol~
    sol fa~

    %106
    fa mi
    fa4 do' la fa
    sol1-+

    %109
    fa2 r
    R1*3
    sib,4-! sib-!\mbreak sib-! sib-!

    %114
    fa'2. mib8 fa
    sol4 fa sol re
    mib2. re8 mib

    %117
    fa4 mib fa do
    re fa sib2~
    sib la

    %120
    sib2.-+ la8 sib
    do4 sib do sol
    la2.-+ sol8 la

    %123
    sib2 r
    R1*3
    r4 re, sol8 fa mib re\mbreak

    %128
    do mib re do fa mib re do
    sib re do sib mib re do sib
    la do sib la re do sib la

    %131
    sib2 sib'~
    sib la4 sol
    la1~

    %134
    la2 sol4 fad
    sol1~
    sol2 fad4 mi

    %137
    fad1-+
    sol2 r
    re4 re\mbreak re re

    %140
    sol2.-+ fad8 sol
    la4 sol la mi
    fad2.-+ mi8 fad

    %143
    sol2 r
    R1*6
    r8 re mib re fad, re' mib re

    %151
    sol, re' mib re la re mib re-!
    sib2-! r
    R1

    %154
    r8 sol' lab sol si, sol' lab sol
    do, sol' lab sol \mbreak re sol lab sol
    mib2 r

    %157
    R1
    r8 fa sol fa la, fa' sol fa
    sib, fa' sol fa do fa sol fa

    %160
    re2 r
    R1*5
    fa,4 fa fa fa

    %167
    sib2.-+ la8 sib
    do4 sib do sol
    la2._+ sol8 la

    %170
    sib2\mbreak sib'~
    sib la
    re,8 fa mib re sol fa mib re

    %173
    do mib re do fa mib re do
    sib re do sib mib re do sib
    la do sib la re do sib la

    %176
    sol sib la sol do sib la sol
    fa4 la sib2~\mbreak
    sib do~

    %179
    do re~
    re mib~
    mib fa~

    %182
    fa fa,-!
    sol-! la-!
    \once\stemUp sib,8 fa''(sol fa) la, fa' sol fa

    %185
    sib, fa' sol fa do fa sol fa
    re2 sib,
    do re

    %188
    \once\stemUp mib8 sib''(do sib) re, sib' do sib\mbreak
    mib, sib' do sib fa sib do sib
    sol2 do,,

    %191
    re mi
    \once\stemUp  fa8 do'' re do mi, do' re do
    fa, do' re do sol do re do

    %194
    la2-! r
    sib,4-! sib-! sib-! sib-!
    fa'2.-+mib8 fa

    %197
    sol4 fa sol re
    mib2.-+ re8 mib\mbreak
    fa4 mib fa do

    %200
    re2 sib'~
    sib la
    re,1

    %203
    sol
    do,
    fa,2 sib'~

    %206
    sib la~
    la sol~
    sol fa~

    %209
    fa mib~
    mib re4 fa
    sol8 fa mib re do mib re do

    %212
    fa mib re do sib re do sib\mbreak
    mib re do sib la do sib la
    re do sib la sol sib la sol

    %215
    do sib la sol fa la sol fa
    sib4 re fa, re'
    sol, sol' la, fa'

    %218
    sib, re fa, re'
    sol, sol' la, fa'
    sib, sib'2 fa4\mbreak

    %221
    sol mib do fa
    re8 sib' re, sib' re, sib' re, sib'
    do, sib' do, sib' do, la' do, la'

    %224
    sib2-! r\fermata

}


VIbcn = \relative do {

    R1*18
    \clef tenor\key sib\major sib'4-! sib-! sib-! sib-!
    fa'2.-+ mib8 fa

    %21
    sol4 fa sol re
    mib2.-+ re8 mib
    fa4 mib fa do

    %24
    re8 fa mib re sol fa mib re
    do mib re do fa mib re do\mbreak
    sib re do sib mib re do sib

    %27
    la do sib la re do sib la
    sol sib la sol do sib la sol
    la4 do mi, do'

    %30
    fa, do' sol do
    la2\clef bass \key sib\major do,
    re mi

    %33
    fa4 \clef tenor\key sib\major fa'\mbreak la, fa'
    sib, fa' do fa
    re2\clef bass\key sib\major fa,

    %36
    sol la
    sib-! r
    fa4 fa fa fa

    %39
    sib2. la8 sib
    do4 sib do sol
    la2.-+ sol8 la

    %42
    sib4 sib, sib'2~
    sib la~
    la sol~\mbreak

    %45
    sol fa~
    fa mi
    fa4 fa fa fa

    %48
    do'2.-+ sib8 do
    re4 do re la
    sib2. la8 sib

    %51
    do4 sib do sol
    la8 do sib la re do sib la
    sol sib la sol do sib  la sol\mbreak

    %54
    fa la sol fa sib la sol fa
    mi sol fa mi la sol fa mi
    re fa mi re sol fa mi re

    %57
    do2 \clef tenor\key sib\major do'
    re mi
    fa r

    %60
    R1
    r2 \clef bass\key sib\major fa,
    sol la\mbreak

    %63
    sib r
    R1
    r2 sib~

    %66
    sib4 sib sib sib
    sol1
    do4 do do do

    %69
    fa,1
    sib4 sib sib sib
    mib,1

    %72
    la4 la la la
    re,1
    sol4 sol sol sol

    %75
    do,1
    fa4 re' do sib
    la sol fa mi\mbreak

    %78
    re re re re
    sol1
    do,4 do do do

    %81
    fa2 fa'~
    fa mib~
    mib re~

    %84
    re do~
    do sib~
    sib la~

    %87
    la sol
    do,1
    do4 do do do

    %90
    sol'1
    re4 re\mbreak re re
    la'2. sol8 fa

    %93
    sol sib sol sib sol sib sol sib
    mi, do' mi, do' mi, do' mi, do'
    fa, la fa la fa la fa la

    %96
    re, sib' re, sib' re, sib' re, sib'
    mi, sol mi sol mi sol mi sol\mbreak
    do, la' do, la' do, la' do, la'

    %99
    re, fa re fa re fa re fa
    si, sol' si, sol' si, sol' si, sol'
    do,1~

    %102
    do~
    do~
    do~

    %105
    do~
    do~
    do

    %108
    \clef tenor\key sib\major do'4 do\mbreak do do
    fa2.-+ mi8 fa
    sol4 fa sol re

    %111
    mib!2.-+ re8 mib
    fa4 mib fa do
    re sib r2

    %114
    \clef bass\key sib\major fa4 fa fa fa
    sib2.-+ la8 sib
    do4 sib do sol

    %117
    la2.-+ sol8 la
    sib2 r\mbreak
    R1*3

    %122
    fa4 fa fa fa
    sib sib, sib'2~
    sib la~

    %125
    la sol~
    sol fad
    sol r

    %128
    R1*3
    sol4 sol sol sol
    do1

    %133
    fa,4 fa fa fa
    sib1
    mib,4 mib mib mib

    %136
    la1
    re,4 re re re\mbreak
    sol sol sol sol

    %139
    re'2.-+ do8 re
    mib4 re mib sib
    do2.-+ sib8 do

    %142
    re4 do re la
    sib sol sib2~
    sib4 la sib fad

    %145
    sol2.-+ fad8 sol
    lab4 sol lab mi
    fad2.-+ mi8 fad\mbreak

    %148
    sol2 re
    mi fad
    sol r

    %151
    R1
    r2 sol
    la si

    %154
    do r
    R1
    r2 fa,

    %157
    sol la
    sib r
    R1

    %160
    \clef tenor\key sib\major sib4-! sib-! sib-! sib-!
    fa'2.-+ mib8 fa
    sol4 fa sol re\mbreak

    %163
    mib2.-+ re8 mib
    fa4 mib fa do
    re2 \clef bass\key sib\major sib2~

    %166
    sib la
    sol1
    do,

    %169
    fa
    sib,2 mib
    fa1

    %172
    sol
    mib'
    re

    %175
    do
    sib
    la4 fa sib re,

    %178
    mib1\mbreak
    fa
    sol

    %181
    la
    sib2 r
    R1

    %184
    r2 fa
    sol la
    sib r

    %187
    R1
    r2 sib,
    do re

    %190
    mib r
    R1
    r2 do

    %193
    re mi
    fa4 fa fa fa
    sib2.-+ la16(sib do8)

    %196
    re4 do\mbreak re la
    sib2.-+ la8 sib
    do4 sib do sol

    %199
    la2 r
    \clef tenor\key sib\major sib4 sib sib sib
    fa'2. mib8 fa

    %202
    sol4 fa sol re
    mib2.-+ re8 mib
    fa4 mib fa do

    %205
    re8 fa mib re sol fa mib re\mbreak
    do mib re do fa mib re do
    sib re do sib mib re do sib

    %208
    \clef bass\key sib\major la do sib la re do sib la
    sol sib la sol do sib la sol
    fa la sol fa sib4 sib,

    %211
    mib2 mib'~
    mib re~\mbreak
    re do~

    %214
    do sib~
    sib la
    r4 sib re,8 sib' re, sib'

    %217
    mib, sib' mib, sib' fa sib fa sib
    sol sib sol sib re, sib' re, sib'
    mib, sib' mib, sib' fa sib fa sib

    %220
    sol4 sol, re' sib'
    mib, do\mbreak fa fa,
    sib sol' re sib'

    %223
    mib, do fa fa,
    sib2-! r\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*19
    <5 4>2 <3>
    <5> s4 <6>
    <6>1
    s2. <6>4
    <6>1
    <7>2 <7>
    <7> <7>
    <7> <7>
    <7> <_!>
    <6> <6>
    s <6!>
    <6> <_!>
    s <6>
    s <6>
    s <6>
    <6>1
    s2 <6>
    s1
    <5 4>2 <3>
    <6>1
    <5>
    <6>
    s2 <6>
    <4 2> <6>
    <4 2> <6>
    <4 2> <6>
    <4 2> s
    s1
    <5 4>2 <3!>
    <5>2 s4 <6>
    <6>1
    <_!>
    <6>
    <7>2 <7>
    <7>2 <7>
    <7>2 <7>
    <7> <_!>
    <_!>1
    s2 <6>
    s1*3
    s2 <6>
    s1*4
    <5>1
    <7>
    s
    <7>
    s
    <7>
    s
    <7 _->
    <_!>
    s
    <6>
    <5>
    <_->
    <_!>
    s2 <6>
    <4 2> <6>
    <4 2> <6>
    <4 2> <6>
    <4 2> <6>
    <4! 2> <6>
    <2> <5>
    <7 3!> <6 4>
    <5 4> <3!>
    <5 4> <3->
    <5 4> <3>
    <5 3> <3->
    <9>1
    <6>
    <9>
    <6>
    <9>
    <6>
    <9>
    <6>
    <_!>2 <8>
    \bassFigureExtendersOn <9 8>  <9 7>
    <8 7> <8 6>
    <7 6> <7 5>
    <6 5> <6 4>
    <5 4> <5 3!>\bassFigureExtendersOff
    <6 4>1
    <5 4>2 <3!>
    s1
    <5>2 s4 <6>
    <6>1
    s2 s4 <6>
    <6>1
    <5 4>2 <3>
    <6>1
    <5 _->
    <6>
    s1*5
    s2 <6>
    <2> <6>
    <2> <6>
    <2> <6>
    s1*5
    <7>1
    <7>
    <7>
    <7>
    <7>
    <7 _+>
    s
    <4>4 <3> <_+>2
    <5>1
    <6 3!>
    <_+>2 s4 <6+>
    <6>2 <6>
    s1
    <6>
    <_->
    <6>
    s2 <_+>
    s <6>
    s1
    s
    s2 <_!>
    s1*8
    <5 4>2 <3>
    <5>2 s4 <6>
    <6>1
    s2 s4 <6>
    <6>1
    <5 2>2 <6>
    <5>1
    <5>
    s
    s
    <5 4>2 <3>
    <5>1
    <6 5>2 <4 2>
    <6 5>2 <4 2>
    <6 5>2 <4 2>
    <6 5>2 <4 2>
    <6 5>1
    <5>2 <6>
    <5> <6>
    <5> <6>
    <5> <6>
    s1*10
    s2 <_!>
    s1*3
    <6>2 <5>
    <6>1
    <_->
    <6>
    s
    <6 4>2 <3>
    <5>2 s4 <6>
    <6>1
    <5>2 s4 <6>
    <6>1
    <7>2 <7>
    <7>2 <7>
    <7>2 <7>
    <7>2 <7>
    <7> s4 <6>
    s2 <6 5>
    <4 2> <6 5>
    <4 2> <6 5>
    <4 2> <6 5>
    <4 2> <6 5>
    s2 <6>
    s1
    s2 <6>
    s1
    s2 <6>
    <6 5>1
    s2 <6>
    <6 5>

}

forma = {

    \time 2/2
    \key sib\major
    \tempo 1 = 65
    s1*224
    \bar"|."

}



VIvlI = {
    \global
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIvlIn = \relative do'' {

    re8
    sol(la) sib\noBeam~
    sib la sol
    fad4 sol8

    %4
    lab(sol) fa
    mib16.(re32) do4~
    do16 mib re(do') sib(la)

    %7
    sib4.~
    sib16(re) do(sib) la(sol)
    la4.~

    %10
    la16 (do) sib(la) sol(fad)\mbreak
    sol4.~
    sol16(sib) la(sol) fad(mi)

    %13
    fad8 sol-+ la~
    la8 sol16(fad) sol8~
    sol fa?(mi)

    %16
    fa(sol) la
    sib4.
    la8 la, la'~

    %19
    la sol16(fa?) mi(re)
    dod8 la re~
    re dod la'\noBeam~

    %22
    la\noBeam sol sib\mbreak
    dod, re fa
    mi4.-+

    %25
    re4 la8
    re mi fa~
    fa mib! re

    %28
    mib si(do)
    fad4.
    sol

    %31
    do~
    do8 sib la~
    la sol16(fad) sol re

    %34
    mib4.~
    mib16 sol fa(mib) re(dod)\mbreak
    re4.~

    %37
    re16 fa mib(re) do?(si)
    do4.~
    do16 mib re(do) sib?(la)

    %40
    sib8 sib'4~
    sib8 lab sol
    lab4 sol8

    %43
    \grace sol fad4.\fermata
    sol2. fa4
    mib re2 dod4-+

    %46
    re2 r\fermata

}

VIIvlIIn = \relative do'' {

    r8
    r r sol
    do(re) mib~
    mib re do

    %4
    \appoggiatura do si4.
    do8(lab') sol
    \appoggiatura sol fad4.-+

    %7
    sol16(la) sib?(do) re(re,)
    mib4.~
    mib16(sol) fa(mib) re(dod)

    %10
    re4.~
    re16(fa) mib(re) do?(si)\mbreak
    do4.~

    %13
    do16(mib) re(do) sib?(la)
    sib4.-+
    la8 la'4~

    %16
    la8 sol fa~
    fa mib(re)
    dod re4~

    %19
    re sol8~
    sol fa16(mi) fa(re)
    mi4 <<mi8\\dod>>

    %22
    re mi4
    la, re8~
    re dod4-+\mbreak

    %25
    re r8
    r r re,
    sol(la) si

    %28
    do re mib~
    mib re16 do sib? la
    sib8(do) re

    %31
    mib4.~
    mib8 re(do)
    sib sib'4~
    sib16 (re) do(sib) la(sol)

    %35
    la4.~
    la16(do) sib(la) sol(fad)\mbreak
    sol4.~

    %38
    sol16(sib) la(sol) fad(mi)
    fad4.-+
    sol8 re4

    %41
    mib?4.~
    mib
    re\fermata

    %44
    re1
    sol,4 fad sol2_+
    <<la2\\fad>> r\fermata

}


VIIbcn = \relative do {

    r8
    R4.*5
    r8 r re
    sol(la) sib

    %8
    do(re) mib
    fa,(sol) la
    sib(do) re

    %11
    mib, fa sol
    la sib do
    re,(mi) fad

    %14
    sol(la) sib
    dod,4.
    re8(mi) fa?

    %17
    sol8 \clef tenor \key sib\major sol'4~\mbreak
    sol8 fa16(mi) re (do)
    sib4.

    %2o
    la8 \clef bass \key sib\major re, fa
    sol la la,
    sib4 sol'8~

    %23
    sol fa16(mi) fa(re)
    sol8 la la,
    re4 r8

    %26
    R4.*3
    r8 r re
    sol(la) sib~

    %31
    sib la sol
    fad4.\mbreak
    sol8 (la) sib

    %34
    do(re) mib
    fa,?(sol) la
    sib(do) re

    %37
    mib,(fa) sol
    la(sib) do
    re,4.

    %40
    sol16(la) sol(fa) mib(re)
    do4.~
    do~

    %43
    do
    sib2(si)
    do4 re mib2

    %46
    re2 r\fermata

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s8
    s4.*5
    s8 s <_+>
    s4.
    <7>
    <7>
    <7>
    <7>
    <7>
    <7 _+>
    s
    <6 5>
    s8 <6+>4
    <7>8 <6-> <5>
    <4+ 2> <6> s
    <7>4 <6>8
    <7 _+>4 <6>8
    <6! 5> <_+> s
    <7> <6> <6!>
    <4+ 2> <6> s
    <6! 5> <_+> s
    s4.*4
    s8 s <_+>
    s4 <6>8
    <2>4.
    <7>8 <6> <5>
    s4.
    <7>
    <7>
    <7>
    <7>
    <7>
    <7 _+>
    s
    <7>8 <6-> <5>
    <6-> s <5>
    <4+ 2>4.
    <6>2 <5->
    s4 <_+> <7> <6+>
    <_+>

}

forma = {

    \time 3/8
    \key sib\major
    \tempo 4 = 45
    \partial 8 s8
    s4.*43
    \time 4/4
    \key sib\major
    \tempo 4 = 60
    \once \override Score.RehearsalMark.extra-offset = #'(+5 . -1) \mark\markup\italic "Adagio"
    s1*3
    \bar"|."

}



VIIvlI = {
    \global
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    \global
    <<\VIIvlIIn \forma>>

}

VIIbc = {
    \global
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIIvlIn = \relative do'' {

    fa4 sol
    fa-+mib8 re
    fa[sib, sol' sib,]

    %4
    fa'4-+ mib8 re
    do4 re8 mib
    \appoggiatura sib la4._+ sib8

    %7
    do[do re mib]
    \appoggiatura mib re4 do8 sib
    do[do re mib]

    %10
    re4-+ do8 mib
    re4-+ do8 mib\mbreak
    re[sib mib do]

    %13
    fa4 sol
    fa mib8 re
    fa[sib, sol' sib,]

    %16
    fa'4 mib8 re
    do4 re8 mib
    \grace sib la4. sib8

    %19
    do[do re mib]
    \appoggiatura mib re4 do8 sib
    do[do re mib]

    %22
    re4-+ do8 mib
    re4-+ do8 mib\mbreak
    re[sib mi do]

    %25
    fa[do sol' do,]
    la'4 sol8 fa
    sol[sol la sib]

    %28
    la4 sol8 fa
    sol[sol la sib]
    la4-+ sol8 sib

    %31
    la4 sol8 sib
    la[fa sib sol]
    do4 sib8 la

    %34
    sol[sol la sib]
    \grace fa mi4. fa8
    sol[sol la sib]\mbreak

    %37
    do4 sib8 la
    \grace do sib4 la8 sol
    \appoggiatura {la16[sib]} do4 sib8 la

    %40
    \grace do sib4 la8 sol
    la[do fa, sol]
    sol2-+

    %43
    fa4 mi8 re
    do[sol' sib, sol']
    la,[fa' fa, sol]

    %46
    sol4._+ fa8
    fa2 fa
    fa'4 lab

    %49
    sol fa8 mib\mbreak
    re4 mib8 fa
    \grace do si4. do8

    %52
    re[re mib fa]
    mib4 re8 do
    \appoggiatura {re16[mib]} fa4 mib8 re

    %55
    mib4 re8 do
    \appoggiatura {re16[mib]} fa4 mib8 re
    mib[do mib sol]

    %58
    fa[fa, mib' fa,]
    re'4 do8 sib
    \appoggiatura {do16(re)} mib4 re8 do\mbreak

    %61
    \grace mib re4 do8 sib
    \appoggiatura {do16(re)} mib4 re8 do
    re[sib mib do]

    %64
    fa4 sol
    fa-+ mib8 re
    fa[sib, sol' sib,]

    %67
    fa'4-+ mib8 re
    do[do re mib]
    \grace sib la4._+ sib8

    %70
    do[fa, mib' fa,]
    re'[fa, do' fa,]
    fa'[fa, mib' fa,]\mbreak

    %73
    re'[fa, do' fa,]
    fa'[fa, mib' fa,]
    re'4-+ do8 mib

    %76
    re4-+ do8 mib
    re[sib mib sib]
    fa'[sib, sol' sib,]

    %79
    re[sib mib sib]
    fa'[sib, sol' sib,]
    fa' [sib sib,8. do16]

    %82
    do4.-+ sib16(do)
    re8[fa sib, do]\mbreak
    do4.-+ sib16(do)

    %85
    sib'4 la8 sol
    fa[fa, mib' fa,]
    re' [sib' sib,  do]

    %88
    do4.-+ sib8
    sib4 r sib4\parenthesize -! r\fermata

}

VIIIvlIIn = \relative do'' {

    fa4 sol
    fa-+mib8 re
    fa[sib, sol' sib,]

    %4
    fa'4-+ mib8 re
    do4 re8 mib
    \appoggiatura sib la4._+ sib8

    %7
    do[do re mib]
    \appoggiatura mib re4 do8 sib
    do[do re mib]

    %10
    re4-+ do8 mib
    re4-+ do8 mib\mbreak
    re[sib mib do]

    %13
    fa4 sol
    fa mib8 re
    fa[sib, sol' sib,]

    %16
    fa'4 mib8 re
    do4 re8 mib
    \grace sib la4. sib8

    %19
    do[do re mib]
    \appoggiatura mib re4 do8 sib
    do[do re mib]

    %22
    re4-+ do8 mib
    re4-+ do8 mib\mbreak
    re[sib mi do]

    %25
    fa[do sol' do,]
    la'4 sol8 fa
    sol[sol la sib]

    %28
    la4 sol8 fa
    sol[sol la sib]
    la4-+ sol8 sib

    %31
    la4 sol8 sib
    la[fa sib sol]
    do4 sib8 la

    %34
    sol[sol la sib]
    \grace fa mi4. fa8
    sol[sol la sib]\mbreak

    %37
    do4 sib8 la
    \grace do sib4 la8 sol
    \appoggiatura {la16[sib]} do4 sib8 la

    %40
    \grace do sib4 la8 sol
    la[do fa, sol]
    sol2-+

    %43
    fa4 mi8 re
    do[sol' sib, sol']
    la,[fa' fa, sol]

    %46
    sol4._+ fa8
    fa2 fa
    fa'4 lab

    %49
    sol fa8 mib\mbreak
    re4 mib8 fa
    \grace do si4. do8

    %52
    re[re mib fa]
    mib4 re8 do
    \appoggiatura {re16[mib]} fa4 mib8 re

    %55
    mib4 re8 do
    \appoggiatura {re16[mib]} fa4 mib8 re
    mib[do mib sol]

    %58
    fa[fa, mib' fa,]
    re'4 do8 sib
    \appoggiatura {do16(re)} mib4 re8 do\mbreak

    %61
    \grace mib re4 do8 sib
    \appoggiatura {do16(re)} mib4 re8 do
    re[sib mib do]

    %64
    fa4 sol
    fa-+ mib8 re
    fa[sib, sol' sib,]

    %67
    fa'4-+ mib8 re
    do[do re mib]
    \grace sib la4._+ sib8

    %70
    do[fa, mib' fa,]
    re'[fa, do' fa,]
    fa'[fa, mib' fa,]\mbreak

    %73
    re'[fa, do' fa,]
    fa'[fa, mib' fa,]
    re'4-+ do8 mib

    %76
    re4-+ do8 mib
    re[sib mib sib]
    fa'[sib, sol' sib,]

    %79
    re[sib mib sib]
    fa'[sib, sol' sib,]
    fa' [sib sib,8. do16]

    %82
    do4.-+ sib16(do)
    re8[fa sib, do]\mbreak
    do4.-+ sib16(do)

    %85
    sib'4 la8 sol
    fa[fa, mib' fa,]
    re' [sib' sib,  do]

    %88
    do4.-+ sib8
    sib4 r sib4\parenthesize -! r\fermata

}


VIIIbcn = \relative do {

    \clef tenor \key sib\major sib'4 mib
    re do8 sib
    re4 mib

    %4
    re do8 sib
    fa4 sib
    fa' mib8 re

    %7
    do4 sib8 la
    sib4\clef bass\key sib\major  fa8 sol
    la4 fa

    %10
    sib8[fa la fa]
    sib[fa la fa]
    sib4 do

    %13
    re8[sib mib do]\mbreak
    re4 do8 sib\clef tenor \key sib\major
    re4 mib

    %16
    re do8 sib
    fa4 sib
    fa' mib8 re

    %19
    do4 fa,
    \clef bass \key sib\major sib4 fa8 sol
    la4 fa

    %22
    sib8[fa la fa]
    sib8[fa la fa]
    sib,4 do

    %25
    re mi
    fa do8 re
    mi4 do\mbreak

    %28
    fa do8 re
    mi4 do
    fa8[do mi do]

    %31
    fa[do mi do]
    fa4 sol
    la sol8 fa

    %34
    sib4 do8 re
    do4 sib8 la
    sol4 fa8 mi

    %37
    la4 re
    sol, do
    la re

    %40
    sol, do\mbreak
    fa,8[mi re do]
    sib[sol' do sib]

    %43
    la4 sol8 fa
    mi8[do re mi]
    fa[re' la sib]

    %46
    do4 do,
    fa8[mib! re do] fa[sol fa mib]
    re4 do

    %49
    si do
    fa sol8 lab\mbreak
    sol4 fa8 mib

    %52
    re4 do8 si
    do4 lab'
    re, sol

    %55
    do, lab'
    re, sol
    do8[do, do' sib]

    %58
    la[fa sol la]
    sib[fa la sib]
    do[fa, sol la]

    %61
    sib[fa la sib]
    do[fa, sol la]\mbreak
    \clef tenor \key sib\major sib4 do

    %64 OOKK
    re8[sib mib do]
    re4 do8 sib
    re4 mib

    %67
    re do8 sib\clef bass \key sib\major
    mib,4 fa8 sol
    fa4 mib8 re

    %70
    do4 la'
    sib la
    re do

    %73
    sib la
    re do
    sib8[fa la fa]\mbreak

    %76
    sib[fa la fa]
    sib,4 do
    re mib

    %79
    sib do
    re mib
    sib'8[la sol fa]

    %82
    mib[do fa fa,]
    sib'[la sol fa]
    mib[do fa fa,]

    %85
    sib[re' do sib]
    la[fa sol la]
    sib[sib, re mib]\mbreak

    %88
    fa4 fa,
    sib8[la sib do] sib4-! r\fermopz

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <6>
    <6>
    <6>
    s
    s4 s8 <6>
    <6>2
    s
    <6>
    s4 <6>
    s4 <6>
    s4 <6>
    <6>2
    <6>
    <6>
    <6>
    s
    s4 s8 <6>
    <7>2
    s
    <6>
    s
    s
    s4 <_!>
    s <6>
    s <_!>
    <6>2
    s4 <_!>
    <6>2
    s4 <6>
    s2
    s4 <6!>
    <6>2
    <6>
    <_!>4 s8 <6>
    <6!>2
    <7>4 <7>
    <7> <_!>
    <7>4 <7>
    <7> <_!>
    s2
    <6 5>4 <_!>
    <6> <6!>
    <6> <6>
    s <6>
    <_!>2
    s
    s
    <6>4 <6->
    <6>2
    <6 _->
    <_!>4 s8 <6>
    <6!>2
    s
    <7>4 <_!>
    s2
    <7>4 <_!>
    s4 s8 <6>
    <6>4 <6>
    s <6>
    <6>2
    s
    <6>s4 <6>
    <6>2
    <6>
    <6>
    <6>
    <6>
    s4 <6 4>8 <6>
    <6>4 <6>
    s <6>
    <6> <6>
    s <6>
    <6> <6>
    s <6>
    s2
    s4 <6>
    <6>2
    s4 <6>
    <6>2
    s
    <6 5>
    s
    <6 5>
    s8 <6> <6> <6>
    <6>4 <6>
    s <6>
    <4> <3>

}

forma = {

    \time 2/4
    \key sib\major
    \tempo 2 = 75
    \repeat volta 2 {s2*46}
    \alternative {{s2}{s}}\break
    \set Score.currentBarNumber = #48
    \repeat volta 2{s2*41}
    \alternative {{s2}{s}}
    \bar"|."

}



VIIIvlI = {
    \global
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    \global
    <<\VIIIvlIIn \forma>>

}

VIIIbc = {
    \global
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \header {
        subtitle = \markup \larger\center-column{"Concerto terzo in trio Op II"}
        composer = \markup \center-column{"N. Porpora (1686-1768)"}
    }

    \markup \huge {[I.1] Adagio sostenuto }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso continuo"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[I.2] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso continuo"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[I.3] Adagio }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso continuo"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {"[I.4] Aria" I\super a }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso continuo"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \header {
        subtitle = \markup \larger\center-column{"Concerto sesto in trio Op II"}
        composer = \markup \center-column{"N. Porpora (1686-1768)"}
    }

    \markup \huge {[II.1] Adagio }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso continuo"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[II.2] Allegro - a Cap[p]ella}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso continuo"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[II.3] Affettuoso}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso continuo"}
                \set Staff.shortInstrumentName = "bc"
                \VIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

    \markup \huge {[II.4] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso continuo"}
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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