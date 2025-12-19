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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IvlIn = \relative do'' {

    sol'8. la16 fad8 sol re mib~
    mib re16 do sib la sib8 sol sib'~
    sib la16 sol fad mi? fad8 re mib!~

    %4
    mib re16 do sib la sib8 sol sib'
    la sol4\tr fad r8
    sib8. do16 re8 re mib,4

    %7
    la8. sib16 do8 do re,4\mbreak
    sol8. la16 sib8 dod, re sol
    fa? mi?4 re r8

    %10
    fa8. sol16 lab8 lab si, fa'~
    fa sol16 fa mib re mib8 do lab'~
    lab re,16 mib fa re sol,8 sol'4~

    %13
    sol8 do,16 re mib do fa,8 fa'4~
    fa8 si,16 do re si mib8. fa16 mib8
    re8. mib16 re8 mib8. fa16 mib8

    %16
    re8. mib16 re8 \mbreak mib do16 re mib fa
    sol4.~sol8 fa16 mib fa8~
    fa mib16 re mib8~mib re16 do re mi

    %19
    fa8 sol lab sib lab sol
    lab4.~lab8 sol4~
    sol8 fa4~fa8 mib4~

    %22
    mib8re4 mib8. fa16 re8
    mib sib do do sib16 lab sol fa
    sol8(mib?) sol'~sol fa16 mib re do\mbreak

    %25
    re8 sib sib'~sib lab16 sol fa mib
    re4 r8 mi!8. fa16 mi8
    fa8. sol16 fa8 sol8. lab16 sol8

    %28
    lab8. sib16 lab8 la8. sib16 la8
    sib fa sib~sib la sol
    fad sol la~la sol fa?

    %31
    mi! fa sol~sol fa mi
    re mi fa~fa mi re
    dod re mi fa8. sol16 la8\mbreak

    %34
    la sib,4 mi8. fa16 sol8
    sol la,4 re8. mi16 fa8
    fa sol,4 mi'8. fa16 sol8

    %37
    fad re do'~do sib la
    sib mib,4~mib8 re do
    re fa sib re, do4\tr

    %40
    re8 sib16 do re mib fa4.~
    fa8 do16 re mib fa sol4.~
    sol8 re16 mi? fad sol la4.~

    %43
    la8 sib do sib4 r8\mbreak
    sol8. la16 fad8 sol re mib~
    mib re16 do sib la sib8 sol sib'~

    %46
    sib la16 sol fad mi? fad8 re mib~
    mib re16 do sib la sib8 sol sib'
    la sol4 fad r8

    %49
    sib8. do16 re8 re mib,4
    la8. sib16 do8 do re,4
    sol8. la16 sib8 sib do,4

    %52
    fad8. sol16 la8 sib, sol16 la sib do
    re4.~re8 do16 sib do8~
    do sib16 la sib8\mbreak la8. sib16 la8

    %55
    sib8. do16 sib8 la8. sib16 la8
    sib8. do16 sib8 la re16 mi fad sol
    la8 do, la sib sol sol'

    %58
    sib, la4\tr sol8 sol16 la sib do
    re8 mi fad sol sol, do
    sib la4 sol4.\fermata

}

IvlIIn = \relative do'' {

    sib8. do16 la8 sib4.
    do8 la fad re sol'4~
    sol8 mi dod la4 sib8

    %4
    do la fad re4 sol'8
    mib mi4 re r8
    r4. mib8. fa?16 sol8

    %7
    sol la,4 re8. mib16 fa8\mbreak
    fa sol, re' mi ?la16 sol fa mi
    re8 dod4 re r8

    %10
    re4 mib8 fa4 re8
    si do re sol, mib'4
    re4.~re

    %13
    do~do
    si8 sol16 la si sol do8. re16 do8
    si8. do16 si8 do8. re16 do8

    %16
    si8. do16 si8\mbreak do4 r8
    R2.*3
    fa4.~fa8 mib4~

    %21
    mib8 re4~re8 sib4
    fa4. sol8. lab16fa8
    sol4. lab8 fa re

    %24
    sib mib'4~mib8 do la?\mbreak
    fa fa'4 sol8 mib do
    sib4 r8 do4.~

    %27
    do~do~
    do~do
    re sol8 fa mib

    %30
    la4. re,
    sol do,
    fa sib,

    %33
    mi la,\mbreak
    sib8. do16 re8 re mi,4
    la8. sib16 do8 do re,4

    %36
    sol8. la16 sib8 sib dod,4
    la'8 fad' la~la sol fad
    re sib4 do8 sib la

    %39
    fa'? re sib sib4 la8
    sib4 r8 r4.
    R2.*3

    %44
    sib8. do16 la8 sib4.
    do8 la fad re sol'4~
    sol8 mi dod la4 sib8

    %47
    do la fad re4 sol'8
    mib mi4 re r8
    r4. mib8. fa?16 sol8

    %50
    sol la,4 re8. mib?16 fa8
    fa sol,4 do8. re16 mib8
    mib? fad,[re'] re4 r8

    %53
    R2.
    r4. fad,8. sol16 fad8
    sol8. la16 sol8 fad8. sol16 fad8

    %56
    sol8. la16 sol8 fad fad16 sol la sib
    do8 la fad sol sib sol
    sol4 fad8 sol4 sol8

    %59
    la4. sib4 sol8
    sol4 fad8 sol4.\fermata

}

Ivlan = \relative do' {

    re4 re8 re4.
    la'8 fad re sib4 re'8
    mi? dod la fad4 sib8

    %4
    la fad re sib4 re8
    mib la,4 la8 fad'16 sol la fad
    re4 sib'8 sol4 mib8

    %7
    do4 la'8 fa?4 re8\mbreak
    sib4 sol'8 sol la sib
    la la4 fa r8

    %10
    re4 do8 si4.
    re8 do si mib4.
    fa sol

    %13
    mib fa
    re sol,
    sol sol

    %16
    sol\mbreak sol4 r8
    R2.*3
    do8 lab'16 sib do lab re,8 sol16 lab sib sol

    %21
    do,8 fa16 sol lab fa sib,8 sib'16 do re sib
    do,8 sib4 sib8 sib4
    sib4 sol'8 fa re sib

    %24
    sol4 sib'8 do la fa\mbreak
    re4 re'8 mib? do lab
    fa4 r8 sol8. lab16 sol8

    %27
    lab8. sib16 lab8 sol4 mi!8
    do8. reb16 do8 fa8. sol16 fa8
    fa4. r8 r sol

    %30
    do4. fa,
    sib mi,!
    la re,

    %33
    sol re\mbreak
    re4 sib'8 sol4 mi8
    do4 la'8 fa4 re8

    %36
    sib4 sol'8 mi4.
    fad re
    re8 sol4 la \parenthesize r8

    %39
    sib4 fa8 sol do, fa
    re4 r8 r4.
    R2.*3\mbreak

    %44
    re4 re8 re4.
    la'8 fad re sib4 re'8
    mi? dod la fad4 sib8

    %47
    la fad re sib4 re8
    mib la,4 la8 fad'16 sol la fad
    re4 sib'8 sol4 mib8

    %50
    do4 la'8 fa4 re8\mbreak
    sib4 sol'8 mib4 do8
    la4 fad'8 sol4 r8

    %53
    R2.
    r4.\mbreak re4.
    re re

    %56
    re re
    fad re4 re8
    mib la, re re4 r8

    %59
    re4 re8 re4 sol8
    re re4 sib4.\fermata

}

Ibcn = \relative do {

    sol'8 re' re, sol sol, sol'
    fad4. sol8 sol, sol'
    dod4. re8 re, sol

    %4
    fad4. sol8 sol, sol'
    do, dod4 re16 dod re mi fad re
    sol fad sol la sib sol do,? sib do re mib do

    %7
    fa? mib fa sol la fa sib, la sib do re sib\mbreak
    sib' la sib do re sib la sol fa mi re dod
    re sol la8 la, re fa16 mib re do

    %10
    si4 do8 re16 do re mib? fa re
    sol,8 la si do do'4
    si4. sib

    %13
    la lab
    sol sol,
    sol sol

    %16
    sol\mbreak do4 r8
    r sol16 la si do re4.
    do sib

    %19
    lab8 sol fa mi!4.
    fa8 fa'16 sol lab fa sib,8 mib16 fa sol mib
    lab,8 re16 mib fa re sol,8 sol'16 lab sib sol

    %22
    lab8 sib sib, mib? sib' sib,
    mib mib, mib' re4.
    mib8 mib, mib' la?4.\mbreak

    %25
    sib8 sib, re sol4 lab?8
    sib fa16 mib re do sib4.
    lab8 fa'4~fa8 mi!4

    %28
    fa4. mib
    re mib'~
    mib8 re do si do re~

    %31
    re do sib! la sib do~
    do sib la sol la sib~
    sib la sol fa16 mi re mi fa re\mbreak

    %34
    sol fa sol la sib sol do, sib do re mi do
    fa mi fa sol la fa sib, la sib do re sib
    mi re mi fa sol mi dod si? dod re mi dod

    %37
    re4. fad
    sol fa!
    sib,16 la sib do re sib mib8 fa fa,

    %40
    sib4 r8 r fa'16 sol la sib
    do4.~do8 sol16 la sib do
    re4.~re8 do16 sib la sol

    %43
    fad8 mi re sol re16 do sib la\mbreak
    sol'8 re' re, sol sol, sol'
    fad4. sol8 sol, sol'

    %46
    dod4. re8 re, sol
    fad4. sol8 sol, sol'
    do, dod4 re16 dod re mi fad re

    %49
    sol fad sol la sib sol do,? sib do re mib do
    fa? mib fa sol la fa sib, la sib do re sib
    mib re mib fa sol mib la, sol la sib do la

    %52
    re do re mi? fad re sol4 r8
    r re16 mi fad sol la4.
    sol\mbreak re

    %55
    re re
    re re4 r8
    r re16 mi fad re sol8 sol,16 la sib sol

    %58
    do8 re re, sol4 sol'8
    fad16 mi re do sib la sol8 sol' mib
    re re,4 sol4.\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4. s4 <6->8
    <7->2.
    <7>4. <_+>4 <6->8
    <7->2.
    s8 <6 5>4 s4.
    s <9 _->
    <9> <9>
    <6 4> <_+>
    s s
    <6 5>4 <6>8 <6! 5->4.
    <7> s4 <6->8
    <7->4. <6>
    <7> <6>
    <7 _!> <6- 4>
    <5 3!> <6- 4>
    <5 3!> s
    s <4>8 <3>4
    <4>8 <[3-]>4 <4>8 <3> <4!>
    <6>4. <6 5>
    <_-> <7->
    <7> <7>
    <6 5-> s
    s <7 5->
    s <7 5->
    s s4 <6 5->8
    s4. <6 4!>
    s <6 2>
    <_-> <6 4!>
    s s
    <6 4 2+> <7>4 <3!>8
    <6 4 2!>4 <6>8 <7>4.
    <6 4 2> <7>
    <6 4 2+> s
    <9> <9>
    <9> <9>
    <9> <7>
    <_+> <6 5>
    <5>8 <6->4 <7->4.
    s2.*2
    <4>4. < 3>
    <4> < 3>
    s s
    s s4 <6->8
    <7->2.
    <7>4. <3+>4 <6->8
    <7->4. s
    s8 <6 5>4 s4.
    s <9 3->
    <9> <9>
    <9> <9>
    <9 3+> s
    s4. <4>8 <3>4
    <4>8 <3>4 <_+>4.
    <6 4> <5 3+>
    <6 4> <5 3+>
    s s
    <7 5> s
    s s
    <6 4>8 <5 3+>4

}

forma = {

    \time 6/8
    \key fa\major
    \tempo 2 = 57
    s2.*60
    \bar"|."

}


IvlI = {
    \global
    \notypeset
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
    \terzine \con

}

IIvlIn = \relative do'' {

    mib4 sol fa sol
    mi fa sib lab8 sol\mbreak
    lab4 reb,2 do8 sib

    %4
    do4 fa~fa mib?8 re?
    mib4 re8 do sib4 sib'~
    sib la?8 sol fad4 sol8 la

    %7
    red,4 mi8 fad sol4 si~
    si la2 sol4~
    sol fa?8 mi fa4 mi8 re

    %10
    dod4 re8 mi fa4 la
    mib! re8 do si4 mib
    fa mib re mib

    %13
    fa mib\mbreak re mib
    re2 do\fermata

}

IIvlIIn = \relative do'' {

    do4 mib re2
    do2 sol'4 fa8 mi\mbreak
    fa4 lab sib, lab8 sol

    %4
    la!2 re4 do8 si
    do4 sib!8 la sol4 sol'~
    sol fa8 mi re2

    %7
    fad4 sol8 la mi2~
    mi re
    mi?4 re8 dod re4 dod8 si

    %10
    la4 si8 dod re2
    do?4 si8 la re4 do
    re do si do

    %13
    re do\mbreak si do~
    do si do2\fermata

}

IIvlan = \relative do' {

    sol'4 do lab sol~
    sol lab mi2\mbreak
    do4 fa sol2

    %4
    fa sol4. si8
    la?2 re,
    mi la~

    %7
    la si
    sol4 la fa sol
    dod,4. mi8 \parenthesize si2

    %10
    mi la~
    la sol~
    sol1~

    %13
    sol2~\mbreak sol~
    sol mib?\fermata

}

IIbcn = \relative do {

    do2~do4 sib~
    sib lab sol do\mbreak
    fa2 mi

    %4
    mib!4 reb8 do si2
    fad' sol
    dod, do~

    %7
    do4 si8 la sol2
    do sib!
    la sold

    %10
    sol! fa
    fad \tieUp sol~
    sol~sol~

    %13
    sol~\mbreak sol~
    sol do,\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6- 4 2>
    <6 4! 2> <6!>4 <7>
    <_-> <6-> <7->2
    <6 4> <6 5>
    <7-> s
    <7> <6 4 2>
    <6 4+ 2+> <6! 3!>
    <7- 3!>4 <6> <7 5> <6>
    <7 3+>2 <7->
    <6 4+> s
    <7-> <3!>4 <6- 4>
    <7 5> <6- 4> <5 3!> <6- 4>
    <7 5> <6- 4> <5 3!> <6- 4>
    <5 4> <3!>

}

forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 60
    s1*14
    \bar"|."

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
    \terzine \con

}

IIIvlIn = \relative do'' {

    sol'8
    sib,16(re sol) sib sib8(la16) sol fad8 mi re mib!
    fad,16(la do) mib mib8(re16) do sib8 la sol sib'
    sib,16(re fa?) sib sib8(la16) sol fa8 mib re mib

    %4
    fa,16(la do) mib mib8(re16) do\mbreak re8[do sib sib16 do]
    re16[do sib la sib do re mib] fa8 do fa, do'16 re
    mib[re do si do re mib fa] sol8 re sol, re'16 mi

    %7
    fa[mi re dod re mi fa sol] la8 mi la, la'
    la,16(re fa) la la8(sol16) fa la, (dod mi) sol sol8(fa16) mi
    la,(re fa) la la8(sol16) fa la,(dod mi) sol sol8(fa16) mi

    %10
    fa8 la \once\stemUp re,, la''\mbreak \once\stemUp mi, sol' \once\stemUp dod,, sol''
    \once\stemUp re, \once\stemDown fa' \once\stemUp sib,, \once\stemDown fa'' \once\stemUp do,? \once\stemDown mi' \once\stemUp la,, \once\stemDown mi''
    \once\stemUp sib, \once\stemDown re' \once\stemUp sol,, \once\stemDown re'' dod16(re mi) fa fa8 \parentSlur (mi16) re

    %13
    dod(re mi) fa fa8(mi16) re dod(re mi) fa fa8(sol16) la
    fa8 mi16 re mi8 re16 dod re8[do16 sib! la8 sol]
    fa8 mi16 re mi8 re16 dod re4. re'8

    %16
    re,16(fa la) re re8(dod16) si dod8 si la mi'
    la,16(dod mi) sol sol8(fa16) mi fa8 mi re fa
    sol,16(si re) fa fa8(mib!16) re mib8 re do sol'

    %19
    lab do, re fa sol si, do mib
    fa la, si re mib[do16 si do re mib fa]
    sol4. sol8\mbreak lab16 (sol) fa(mib) fa(mib) re(do)

    %22
    re(do) si(la?) si(la) sol(fa) mib8 do' sol, si'
    do4 r8 sol' sib,16(re sol) sib sib8(la16) sol
    fad8 mi? re mib fad,16 \parentSlur (la do) mib mib8(re16) do

    %25
    sib8 la sol sib' la[re,16 do re mib fa re]
    sol8[do,16 sib do re mib do] fa8[sib,16 la sib do re sib]\mbreak
    mib8[la,16 sol la sib do la] re8[sol,16 fad sol la sib do]

    %28
    re4. re8 re,16(sol sib) re re8(do16) sib
    re,16(fad la) do do8(sib16) la re,(sol sib) re re8(do16) sib
    re,16(fad la) do do8(sib16) la sib8[sol16 fad sol la sib do]

    %31
    re8[re16 do re mib? fad sol] la8 do,4 sib16 la\mbreak
    sib8 sol' la fad sol4. sib,8 sol' la fad sol2

}

IIIvlIIn = \relative do'' {

    sol'8
    sib,16(re sol) sib sib8(la16) sol fad8 mi re mib!
    fad,16(la do) mib mib8(re16) do sib8 la sol sib'
    sib,16(re fa?) sib sib8(la16) sol fa8 mib re mib

    %4
    fa,16(la do) mib mib8(re16) do\mbreak re8 do sib4
    r r8 fa16 sol la[sol fa mi? fa sol la sib]
    do8[sol do, sol'16 la] sib[la sol fa sol la sib do]

    %7
    re8[la re, la'16 si?] dod[si la si dod re mi dod]
    la(re fa) la la8(sol16) fa la, (dod mi) sol sol8(fa16) mi
    la,(re fa) la la8(sol16) fa la,(dod mi) sol sol8(fa16) mi

    %10
    fa8 la \once\stemUp re,, la''\mbreak \once\stemUp mi, sol' \once\stemUp dod,, sol''
    \once\stemUp re, \once\stemDown fa' \once\stemUp sib,, \once\stemDown fa'' \once\stemUp do,? \once\stemDown mi' \once\stemUp la,, \once\stemDown mi''
    \once\stemUp sib, \once\stemDown re' \once\stemUp sol,, \once\stemDown re'' dod16(re mi) fa fa8 \parentSlur (mi16) re

    %13
    dod(re mi) fa fa8(mi16) re dod(re mi) fa fa8(sol16) la
    fa8 mi16 re mi8 re16 dod re8[do16 sib! la8 sol]
    fa8 mi16 re mi8 re16 dod re4. re'8

    %16
    re,16(fa la) re re8(dod16) si dod8 si la mi'
    la,16(dod mi) sol sol8(fa16) mi fa8 mi re fa
    sol,16(si re) fa fa8(mib!16) re mib8 re do sol'

    %19
    lab do, re fa sol si, do mib
    fa la, si re mib[do16 si do re mib fa]
    sol4. sol8\mbreak lab16 (sol) fa(mib) fa(mib) re(do)

    %22
    re(do) si(la?) si(la) sol(fa) mib8 do' sol, si'
    do4 r8 sol' sib,16(re sol) sib sib8(la16) sol
    fad8 mi? re mib fad,16 \parentSlur (la do) mib mib8(re16) do

    %25
    sib8 la sol sib' la[re,16 do re mib fa re]
    sol8[do,16 sib do re mib do] fa8[sib,16 la sib do re sib]\mbreak
    mib8[la,16 sol la sib do la] re8[sol,16 fad sol la sib do]

    %28
    re4. re8 re,16(sol sib) re re8(do16) sib
    re,16(fad la) do do8(sib16) la re,(sol sib) re re8(do16) sib
    re,16(fad la) do do8(sib16) la sib8[sol16 fad sol la sib do]

    %31
    re8[re16 do re mib? fad sol] la8 do,4 sib16 la\mbreak
    sib8 sol' la fad sol4. sib,8 sol' la fad sol2

}

IIIvlan = \relative do' {

    r8
    re4 re re re
    re la' re, re
    re re re re

    %4
    do do\mbreak fa fa
    fa re do la
    sol' mib re sib

    %7
    la' fa mi? dod
    fa fa mi mi
    fa fa mi dod

    %10
    la re\mbreak mi dod
    re sib do? la
    sib sol mi' re

    %13
    mi re mi re
    re8 la' sib mi, fa4 mi
    fa8 la, sib mi, fa4. r8\mbreak

    %16
    fa'4 fa mi mi
    mi dod la la
    si si sol sol

    %19
    do8 do fa fa sib, si mib mib
    la, la re re sol,4 r
    sol'8[mib16 re mib fa sol mib]\mbreak do4 do'

    %22
    lab fa sol, sol
    sol r8 re' re4 re
    re re re re

    %25
    re re re8 la'4 re,8
    do sol'4 do,8 sib fa'4 sib,8\mbreak
    la fa'4 la,8 sol4 r

    %28
    r8 fad'16[mi fad sol la fad] sib4 sib
    la la sib sib
    la la re, re

    %31
    la' sol fad8[fad16 mib? fad sol la fad]\mbreak
    re8 sib' do la sib4. re,8 sib' do la sib2

}

IIIbcn = \relative do {

    r8
    sol'4 sol, re' re,
    re' fad sol sol,
    sib' sib, sib' sib,

    %4
    la' la,\mbreak sib' sib,
    sib' sib, fa' fa,
    do'' do, sol' sol,

    %7
    re'' re, la' la,
    la' la, la' la,
    la' la, la' la,

    %10
    re re'\mbreak mi dod
    re sib do? la
    sib sol la la,

    %13
    la' la, la' la,
    re8 fa sol la re,4 dod
    re8 fa, sol la re,4. r8

    %16
    re'4 re, la'' la,
    la' la, re re,
    sol' sol, do do,

    %19
    fa'8 lab sib, re mib sol lab, do\mbreak
    re fa sol, si do4 r
    mib8[do16 si do re mib do]\mbreak fa4 lab

    %22
    fa re do16 re mib fa sol8 sol,
    do4 r8 sol' sol4 sol,
    re' re, re' re,

    %25
    sol' sol, fa'? sib,
    mib la, re sol,\mbreak
    do fa, sib r

    %28
    r8 re16[do re mi? fad re] sol4 sol,
    fad' fad,? sol' sol,
    fad' fad, sol' sol

    %31
    fa? mib re8[re16 do re mib? fad! re]\mbreak
    sol8 sol, do re sol,4. sol'8 sol, do re sol,2

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2 <_+>
    s1*2
    <6 5->1
    s
    <_->
    s2 <_+>
    <6 4> <7 5 3+>
    <6 4> <7 5>
    s1*2
    s2 <_+>4 <6 4>
    <5 3+> <6 5> <5 3+> s
    s1*2
    s2 <_+>
    s4 <7> s2
    <_!>4 <7> s2
    <_->2 s8 <3!> s4
    s <_!> <_->2
    s2 <_->2
    s4 <6!> <_->2
    s1
    <_+>
    s2 s4 <7>
    s <7> s <7>
    s <7> s2

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 60
    \partial 8 s8
    s1*14
    s2 s4 s8
    \bar":..:"\break
    \repeat volta 2{s8
    s1*16}
    \alternative {{\set Score.measureLength = #(ly:make-moment 7 8) s2 s4 s8}{s2 s\fermata}}
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
#(set-global-staff-size 17.5)


\pointAndClickOff

\header {
    subtitle = \markup"Concerto in Sol minore [RV 154]"
    composer = \markup {"A. Vivaldi (1678-1741)"}
}

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

  \markup \huge {[1.] All[egr]o}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
          \IvlI
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
          \IvlII
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
          \Ivla
        >>

        \new Staff
        <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
          \Ibc

        >>
      >>

    \layout {

      indent = 1.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
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

     \pageBreak

  \markup \huge {[2.] Ad[agi]o}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
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

  \markup \huge {[3.] All[egr]o}

  \score {

      \new ChoirStaff <<

        \new Staff
        <<
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
