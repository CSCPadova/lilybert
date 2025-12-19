\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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

Iglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto\con
}

Ivln = \relative do'' {

    do8
    fa fa, la sib do r fa r
    mi r re r do4 r8 fa
    do fa sib, fa' la,4 r8 do

    %4
    fa fa, la sib do r fa r
    mi r re r sol8(si,4) do8
    sol'8 (si,4) do8 sol fa4 mi16 re

    %7
    mi8 sol do mi sol  (si,4) do8
    sol'(si,4) do8 mi,4 re
    do r8 do' fa8 fa, la sib?

    %10
    do r mib r re r do r
    re4 r8 re sol sol, si do
    re r fa r mi ?r re r\mbreak

    %13
    mi4 r8 sol do, sol' sib, sol'
    la,4 r8 fa' lab (sol4) fa8
    lab (sol4) fa8 reb (do4) si8

    %16
    do sib!16 lab sib8 sol lab sol16 fa sol8 mi?
    do' sib16 lab sib8 sol lab sol16 fa sol8 mi!
    fa4 r8 do'\solo fa16 do la do fa do la do

    %19
    fa do la do fa sol mi fa sol mi do mi sol mi do mi
    sol mi do mi sol la fa sol la fa do fa la fa do fa
    la fa do fa la fa sol la sol mi do mi sol mi do mi

    %22
    sol mi do mi sol la fa sol la fa do fa la fa do fa
    la fa do fa la fa sol la sol8 do, r do\mbreak
    fa16 do la do fa do la do fa do la do fa do re mib

    %25
    re sib  fa sib re sib fa sib re sib fa sib re fa mi? re
    sol re si re sol re si re sol re si re sol re mi fa
    mi do sol do mi do sol do mi do sol do mi sol fa mi

    %28
    la mi dod mi la mi dod mi la mi dod mi la mi fa sol
    fa re la re fa re la re fa re la re fa la sol fa
    sib fa re fa sib fa re fa sib fa re fa sib fa re fa

    %31
    mi8 do r sol' lab(sol4) fa8
    lab (sol4) fa8 reb(do4) si8
    do do16(re mi8) mi16 (fa\mbreak sol8) fa16 (sol la8) do,

    %34
    si16 (la' sol fa) mi8 re do re, sol, si'
    do4 r8 do\tu fa fa, la sib
    do r mib r re r do r

    %37
    re4 r8 re sol sol,  si do
    re r fa r mi r re r
    mi4 r8 sol do, sol' sib, ?sol'

    %40
    la,16 sib do sib la8 la' re, la' do, la'
    si,16 do re do si8 si' mi, si' re, si'
    do,16 re mi re do8 la' fa, la' mi, sold'

    %43
    la,16\solo do mi do la do mi do sold si mi si sold si mi si
    la do mi do la do mi do sold si mi si sold si mi si\mbreak
    do8 la r4 do16 mi sol mi do mi sol mi

    %46
    si re sol re si re sol re do mi sol mi do mi sol mi
    si re sol re si re sol re mi8 do r4
    re16 fa la fa re fa la fa dod mi la mi dod mi la mi

    %49
    re fa la fa re fa la fa dod mi la mi dod mi la mi
    fa8 re r4 re16 fa sib fa re fa sib fa
    mi(sol la sib la8) sold la(mi) fa(dod)

    %52
    re16(fa sol la sol8) fad sol(re) mi (si)
    dod16( mi fa sol fa8) mi fa16(re dod re) fa(re dod re)
    la'(re, dod re) la'(re, dod re)\mbreak sib'(sol) la(fa) sol(mi) fa(re)

    %55
    mi(dod) re(si) dod(la) si(sol) fa(la si dod) re8 fad,
    sol16si dod re mi8 sold, la16 mi'(fa sol la8) dod,!
    re8 fa, la, dod' re\tu la' fa re

    %58
    sib' r la r sol r fa r
    mi4 r8 la mi la re, la'
    dod,4 r8 mi la (dod,4) re8

    %61
    la' (dod,4) re8 la (sol4) fa16 mi
    fa8 la re fa la (dod,4) re8
    la' (dod,4) re8 fa,4 mi\mbreak

    %64
    re16 fa mi re la' dod si la re fa mi re la' dod si la
    re8 re, r la' re, re16(mi fad8) fad16 (sol
    la8) si16(do re) do(si la) si8 sol,16(la si8) si16(do

    %67
    re8) mi16(fa) sol(fa) mi(re) mi8 do16(re mi8) mi16(fa
    sol8) la16(sib) do(sib) la(sol) la8 fa,16(sol la8) la16(sib
    do8) re16(mib) fa(mib) re(do) re8 sib16(do re8) re16(mib

    %70
    fa8) sol16 lab sib(lab) sol(fa) sol mib sib mib sol mib sib mib
    fa re sib re fa re sib re\mbreak sol mib sib mib sol mib sib mib
    fa re sib re fa re sib re mib sib sol sib mib sib sol sib

    %73
    mib la, fa la mib' la, fa la re sib fa sib re sib fa sib
    do la fa la do la fa la re sib fa sib re sib fa sib
    mib do fa, do' mib do fa, do' re sib fa sib re sib fa sib

    %76
    do8 fa, r do' fa fa, la sib
    do16 fa,(mib) fa mib' fa,(mib) fa re' fa,(mib) fa do' fa,(mib) fa
    re' sib (la sib) re sib (la sib) sol'8 sol, si do

    %79
    re16 sol,(fa) sol re' sol,(fa) sol mi' ! sol,(fa) sol re' sol, (fa) sol\mbreak
    mi' do sib do mi do sib do sol' do, sib do sol' do, sib do
    la do sib do fa do sib do sol' do, sib do sol' do, sib do

    %82
    la do sib do fa do sib do sol' do, sib do sol' do, sib do
    la4 r8 do \solo\tuplet 3/2 { re(sib la sib[do re)]
    mi(do sib do[re mi)] fa (re do re[mi fa)]

    %85
    sol(mi re mi[fa sol)] la(fa mi fa[sol la)]}
    sib16 (sol mi sol) sib(sol mi sol) la( fa mi fa) la(fa mi fa)
    sib( sol fa sol) sib(sol fa sol) lab(fa mi fa) lab(fa mi fa)\mbreak

    %88
    do(fa mi fa) lab fa (mi fa) sib, fa'(mi fa) lab fa(mi fa)
    do(fa mi fa) lab fa(mi fa) sib,8(reb do sib)
    mi(sol fa mi) sol(sib lab sol)

    %91
    lab16 fa(mi fa) lab(fa mi fa) do fa(mi fa) lab fa(mi fa)
    lab, fa' mi fa lab fa mi fa do fa mi fa lab fa mi fa
    lab, fa'  mi fa lab fa mi fa reb'(sib do reb do8 sib)

    %94
    do16(lab sib do sib8 lab)\tuplet 3/2 { sib(lab sol) lab[(sol fa)]\mbreak
    sol(fa mi)} fa8. re16 mi4.\tr fa8
    fa fa,\tu la sib do r fa r

    %97
    mi r re r do4 r8 sol'
    do, sol' sib, sol' la,4 r8 fa'
    lab (sol4) fa8 lab (sol4) fa8

    %100
    reb (do4) si8 do sib16 lab sib8 sol
    lab sol16 fa sol8 mi do' sib16 lab sib8 sol
    lab sol16 fa sol8 mi fa fa' sol, mi'

    %103
    fa4\fermata r r2

}

IvlIn =  \relative do'' {

    do8
    fa fa, la sib do r fa r
    mi r re r do4 r8 fa
    do fa sib, fa' la,4 r8 do

    %4
    fa fa, la sib do r fa r
    mi r re r sol8(si,4) do8
    sol'8 (si,4) do8 sol fa4 mi16 re

    %7
    mi8 sol do mi sol  (si,4) do8
    sol'(si,4) do8 mi,4 re
    do r8 do' fa8 fa, la sib?

    %10
    do r mib r re r do r
    re4 r8 re sol sol, si do
    re r fa r mi? r re r\mbreak

    %13
    mi4 r8 sol do, sol' sib, sol'
    la,4 r8 fa' lab (sol4) fa8
    lab (sol4) fa8 reb (do4) si8

    %16
    do sib!16 lab sib8 sol lab sol16 fa sol8 mi?
    do' sib16 lab sib8 sol lab sol16 fa sol8 mi!
    fa4 r fa'\staccatissimo r

    %19
    r2 sol4 r
    r2 la4 r
    r2 sol4 r

    %22
    r2 la4 r
    r2 sol4 r\mbreak
    r8 fa\solo do fa r fa do fa

    %25
    r re sib re r re sib re
    r sol re sol r sol re sol
    r mi do mi r mi do mi

    %28
    r la mi la r la mi la
    r fa re fa r fa do fa
    r sib fa sib r sib fa sib

    %31
    r sol mi do r2
    R1*3
    r4 r8 do fa fa, la sib
    do r mib r re r do r

    %37
    re4 r8 re sol sol,  si do
    re r fa r mi r re r
    mi4 r8 sol do, sol' sib,? sol'

    %40
    la,16 sib do sib la8 la' re, la' do, la'
    si,16 do re do si8 si' mi, si' re, si'
    do,16 re mi re do8 la' fa, la' mi, sold'

    %43
    la,4 r r2
    R1*13
    r2 re8 la' fa re

    %58
    sib' r la r sol r fa r
    mi4 r8 la mi la re, la'
    dod,4 r8 mi la (dod,4) re8

    %61
    la' (dod,4) re8 la (sol4) fa16 mi
    fa8 la re fa la (dod,4) re8
    la' (dod,4) re8 fa,4 mi\mbreak

    %64
    re4 r r2
    R1*5
    r2 r8 sol' sib, sol'

    %71
    r fa sib, fa'\mbreak r sol sib, sol'
    r fa sib, fa' r mib sol, mib'
    r mib fa, mib' r re fa, re'

    %74
    r do fa, do' r re fa, re'
    r mib fa, mib' r re fa, re'
    do4 r8 do fa fa, la sib

    %77
    do r mib r re r do r
    re4 r8 re sol sol, si do
    re8 r fa r mi! r re r\mbreak

    %80
    mi4 r8 sol do, sol' sib, sol'
    la,4 r8 sol' do, sol' sib, sol'
    la,4 r8 sol' do, sol' sib, sol'

    %83
    la,4 r r2
    R1*12
    fa'8 fa,  la sib do r fa r

    %97
    mi r re r do4 r8 sol'
    do, sol' sib, sol' la,4 r8 fa'
    lab (sol4) fa8 lab (sol4) fa8

    %100
    reb (do4) si8 do sib16 lab sib8 sol
    lab sol16 fa sol8 mi do' sib16 lab sib8 sol
    lab sol16 fa sol8 mi fa fa' sol, mi'

    %103
    fa4\fermata r r2

}

IvlIIn = \relative do'' {

    do8
    fa fa, la sib do r re r
    do r sib r la r do r
    la la sol sol fa4 r8 do'

    %4
    fa fa, la sib do r re r
    do r si r do (re4) sol,8
    do (re4) sol,8 mi re4 do16 si

    %7
    do4 r8 sol' do (re4) sol,8
    do (re4) sol,8 do,4 si
    do r8 do' fa fa, la sib?

    %10
    la r do r sib r la r
    sib4 r8 re sol sol, si do
    si r re r do r si r\mbreak

    %13
    do4 r8 sol' do, sol' sib, sol'
    la,4 r8 fa' lab (sol4) fa8
    lab (sol4) fa8 reb (do4) si8

    %16
    do sib!16 lab sib8 sol lab sol16 fa sol8 mi?
    do' sib16 lab sib8 sol lab sol16 fa sol8 mi!
    fa4 r do'\staccatissimo r

    %19
    r2 mi4 r
    r2 do4 r
    r2 mi4 r

    %22
    r2 do4 r
    r2 mi4 r\mbreak
    R1*11

    %35
    r4 r8 do fa fa, la sib
    la r do r sib r la r
    sib4 r8 re sol sol, si do

    %38
    si r re r do r si r
    do4 r8 sol' do, sol' sib,? sol'

    %40
    la,16 sib do sib la8 la' re, la' do, la'
    si,16 do re do si8 si' mi, si' re, si'
    do,16 re mi re do8 la' fa, la' mi, sold'

    %43
    la,4 r r2
    R1*13
    r2 re8 la' fa re

    %58
    sol r fa r mi r re r
    dod4 r8 la' mi la re, la'
    dod,4 r8 mi la (dod,4) re8

    %61
    la' (dod,4) re8 la (sol4) fa16 mi
    fa8 la re fa la (dod,4) re8
    la' (dod,4) re8 fa,4 mi\mbreak

    %64
    re4 r r2
    R1*11
    r8  fa la do fa fa, la sib

    %77
    la r do r sib r la r
    sib4 r8 re sol sol, si do
    si r re r do r  si r\mbreak

    %80
    do4 r8 sol' do, sol' sib, sol'
    la,4 r8 sol' do, sol' sib, sol'
    la,4 r8 sol' do, sol' sib, sol'

    %83
    la,4 r r2
    R1*12
    fa'8 fa,  la sib la r re r

    %97
    do r sib r la4 r8 sol'
    do, sol' sib, sol' la,4 r8 fa'
    lab (sol4) fa8 lab (sol4) fa8

    %100
    reb (do4) si8 do sib16 lab sib8 sol
    lab sol16 fa sol8 mi do' sib16 lab sib8 sol
    lab sol16 fa sol8 mi fa fa' sol, mi'

    %103
    fa4\fermata r r2

}

Ivlan =  \relative do' {

    r8
    la r do r la r fa' r
    la r fa r fa r fa r
    fa r sol r do, r la' r

    %4
    la r do, r\mbreak la r fa' r
    fa r sol r sol r fa r
    sol r fa mi16 re do8 re sol,4

    %7
    sol8 r sol' r sol r fa r
    sol r fa mi16 re  sol,4 sol
    sol8 r do r do r do r\mbreak

    %10
    do r la r sib r fa' r
    fa r fa r re r re r
    re r si r do r sol' r

    %13
    sol r mi r mi r mi r
    do r do r do r do r
    do r do r\mbreak lab' r re, r

    %16
    mi! r sol r fa r mi r
    fa r sol r fa r mi r
    fa4 r la r

    %19
    r2 do4 r
    r2 do4 r
    r2 do4 r

    %22
    r2 do4 r
    r2 do4 r
    R1*11

    %35
    sol8 r mi r do r do r
    do r la r sib r fa' r
    fa r fa r re r re r

    %38
    re r si r do r sol' r
    sol r mi r sol r do, r
    do r do r la' r re, r

    %41
    re r re r si' r mi, r
    mi r do r si r si r
    do4 r r2

    %44
    R1*13
    r2 fa8 r la r
    re, r fa r sol r la r

    %59
    la r mi r dod r fa r
    mi r dod r dod r mi r
    dod r mi r fa mi4 re16 dod

    %62
    re4 r dod8 r mi r
    dod r mi r re4 dod4\mbreak
    re r r2

    %65
    R1*11
    do8 r do r do r do r
    do r la r sib r fa' r

    %78
    fa r fa r re r re r
    re r si r do r fa r\mbreak
    sol r sol r sol r mi r

    %81
    do r do r mi r mi r
    do r do r mi r mi r
    do4 r r2

    %84
    R1*12
    do8 r do r la' r la r
    la r fa r fa r do r

    %98
    sol' r mi r do r do r
    do r do r do r do r
    lab' r re, r mi! r sol r

    %101
    fa r mi r fa r sol r
    fa r mi r fa do re sol
    la4\fermata r r2

}

Ibcn = \relative do {

    r8
    fa r fa r fa r fa r
    fa r fa r fa r fa r
    fa r fa r fa r fa r

    %4
    fa r fa r fa r fa r
    fa r fa r mi r re r
    mi r re r mi fa sol sol,

    %7
    do r mi r  mi r re r
    mi r re r mi fa sol sol,
    do r sib r la r fa' r

    %10
    fa r fa r fa r fa r
    sib, r sib r si r sol' r
    sol r sol r sol r sol r\mbreak

    %13
    do, r do r do r do r
    fa r fa r fa r fa r
    fa r fa r fa r sol r

    %16
    do, r do r do r do r
    do r do r do r do r
    fa,4 r fa'\staccatissimo r

    %19
    r2 do4 r
    r2 fa4 r
    r2 do4 r

    %22
    r2 fa4 r
    r2 do8 do do sib\mbreak
    la4 la la la

    %25
    sib sib sib sib
    si si si si
    do do do do

    %28
    dod dod dod dod
    re re re re
    re re re re

    %31
    do do fa fa
    fa fa fa sol
    mi mi\mbreak mi fa

    %34
    sol r do,8 fa sol sol,
    do r sib r la r fa' r
    fa r fa r fa r fa r

    %37
    sib, r sib r si r sol' r
    sol r sol r sol r sol r
    do, r do r mi r mi r

    %40
    fa r fa r fad r fad r
    sol r sol r sold r sold r
    la r la, r re r mi r

    %43
    la,4 r mi' r
    la, r mi' r\mbreak
    la8 sol16 fa mi8 re do4 r

    %46
    sol' r do, r
    sol' r do8 do16 sib! la8 sol
    fa4 r la r

    %49
    re, r la' r
    re8 la16 sol fa8 mi re4  r
    dod' r do r

    %52
    si r sib r
    la r re, r
    re r\mbreak sol r

    %55
    dod, r re r8 re
    si4 r8 mi dod4 r8 la
    re sol la la, re r re r

    %58
    re r re r re r re r
    la r la r la r la r
    la r la r la r la r

    %61
    la r la r la r la r
    re4 r la8 r la r
    la r la r re4 la\mbreak

    %64
    re r re r
    re8 mi fa re fad4 fad
    fad? fad sol sol,

    %67
    si si do do
    mi mi fa fa,
    la la sib sib

    %70
    sib sib mib mib
    sib sib\mbreak mib mib
    sib sib sol' sol

    %73
    fa fa fa fa
    fa fa fa fa
    fa fa fa fa

    %76
    fa8 r fa r fa r fa r
    fa r fa r fa r fa r
    sib, r sib r si r sol' r

    %79
    sol r sol r sol r sol r\mbreak
    do, r do r do r do r
    fa r fa r mi r do r

    %82
    fa r fa r mi r do r
    fa4 fa sib, sib
    do do re re

    %85
    mi mi fa fa
    do1_\markup\italic"tasto solo"~
    do~\mbreak

    %88
    do~
    do~
    do~

    %91
    do~
    do~
    do~

    %94
    do~\mbreak
    do
    fa8 r fa r fa r fa r

    %97
    fa r fa r fa r mi  r
    mi r do r fa r fa r
    fa r fa r fa r fa r

    %100
    fa r sol r do, r do r
    do r do r do r do r
    do r do r fa la, sib do

    %103
    fa,4\fermata r r2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2 s4 <8 6>
    <7 5> <6 > <5> s
    s <4 2> <3> s
    s2 s4 <8 6>
    <7 5> <4! 2> <6> <6!>
    <6> <6!> <6> <7 5>8 <_!>
    s4 <6> <6> <6!>
    <6> <6!> <6> <5 3>8 <_!>
    s2 <6>
    s4 <7/ 5> <6 4> <5 3>
    s2 <6>4 <_!>
    <_!> <7 5> <6 4> <5 _!>
    s2 s4 <7>
    s2 <_->
    <_-> <6->4 <5 4>8 <_!>
   <8 6->4  <7 5>4 <6- 4> <5 3>
    <8 6-> <7 5> <6- 4> <5 3>
    s1*6
    <6>2 s4 <6 5->
    s1
    <6>2 s4 <6 5>
    s1
    <6 5>2 <6 5>
    s1
    <6>
    s2 <__->
    s <6->4  <5 4>8 <3!>
    <6>2 s4 <6 5>
    <_!>2 s4 <5 4>8 <3!>
    s4 <4 2> <6> s
    s4 <7- 5> <6 4> <5 3>
    s2 <6>4 <_!>
    s <7 5> <6 4> <5 3!>
    s2 <6>
    s s4 <6 5>
    s2 s4 <6 5>
    s2 <6 5>4 <_+>
    s2 <_+>
    s <_+>
    s4 <6> s2
    <_!> s
    <_!> s
    <6> <_+>
    s <_+>
    s  <6>
    <7> <6>
    <7> <6>
    <7 _+> s
    s1
    <6 5>2 s4 s8 <_+>
    <6>4 <_+> <6> s8 <_+>
    s4 <5 4>8 <3+> s2
    <6 4>4 <5 3> <9 4> <5 3>
    <3+>2 s4 <6 4>
    <_+>2 s
    <_+> s4 <7>
    s2 <_+>
    <_+> s4 <_+>
    s1
    s4 <6> <6> s
    <6> s <4> <_!>
    <6>1
    <6>
    <6 5->
    s
    s
    s2 <6->
    <7/ 5> <6 4>
    <5 7> <6 4>
    <7/ 5> <6 4>
    <5 3>1
    s4 <7/ 5> <6 4> <5 3>
    s2 <6>4<_!>
    s <7 5> <6 4> <5 3!>
    s1
    s2 <6>4 <7>
    s2 <6>
    s1*13
    s2 s4 <8 6>
    <7 5>4 <6 4> <5 3> <6>
    <6> <7> s2
    <_->1
    <6->4 <5 4>8 <3!> <8 6->4 <7 5>
    <6- 4> <5 3> <8 6-> <7 5>
    <6- 4> <5 3> s8 <6> <6 5>

}

forma = {

    \key fa\major
    \time 4/4
    \tempo 2 = 60
    \partial 8 s8
    s1*103
    \bar"|."

}

Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>

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

IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIvln = \relative do'' {

    r4 r8 la'16 sol fa8. mi32 re sib'8 re,
    dod8 re r re16 fad sol8 dod,16(mi) sib'8 la16 sol
    sol8\tr(fa) r fa mi16( re mi) la la(mi) mi(la)

    %4
    re,(do re) sol  sol(re) re(sol) do,(si do) fa fa(do) do(fa)
    sib,? (la sib) mi mi (sol) sol (sib,) sib8\tr(la) r do
    re16(sib la sib) mi(do sib do) fa (mi32 re do16) fa, sol8.\tr fa16\mbreak

    %7
    fa4 r16 la la(re) re32(dod re) fa fa(mi fa) la la(sol la) re, dod(sib dod) re
    sib16 la sol8 r16 re' re (sol) sol32(fad sol) sib sib(la sib) sol fad(mi fad) mi re(dod re) mi
    dod16 si la8 r mi' fa mi fa mi

    %10
    fa\tr mi r fad sol16 fad mi re sold4
    la32(mi) fa(re) sib'(sold) la(re,) dod8.\tr re16 sol,4~sol16 sib la sol
    fa'8 mi16 re dod8.\tr re16 re2\fermata

}

IIvlIn =  \relative do'' {

    re,8 mi fa dod re fa sol sold
    la re, dod?4 sib8 la sol dod16 dod
    re8 re re'2 do4~

    %4
    do sib2 la4
    sol do, fa8 sol la fa
    sib2 la8 fa do' do,\mbreak

    %7
    fa8 sol la sol fa4. fad8
    sol la sib la sol4. sold8
    la si dod la re la re la

    %10
    re la r do sib4 mi,8 re
    dod re la' la, la si dod la
    re sol la la, re2\fermata

}

IIvlIIn = \relative do'' {

    re,8 mi fa dod re fa sol sold
    la re, dod?4 sib8 la sol dod16 dod
    re8 re re'2 do4~

    %4
    do sib2 la4
    sol do, fa8 sol la fa
    sib2 la8 fa do' do,\mbreak

    %7
    fa8 sol la sol fa4. fad8
    sol la sib la sol4. sold8
    la si dod la re la re la

    %10
    re la r do sib4 mi,8 re
    dod re la' la, la si dod la
    re sol la la, re2\fermata

}

IIvlan =  \relative do' {

    re8 mi fa dod re fa sol sold
    la re, dod?4 sib8 la sol dod16 dod
    re8 re, re''2 do4~

    %4
    do sib2 la4
    sol do, fa8 sol la fa
    sib2 la8 fa do' do,\mbreak

    %7
    fa8 sol la sol fa4. fad8
    sol la sib la sol4. sold8
    la si dod la re la re la

    %10
    re la r do sib4 mi,8 re
    dod re la' la, la si dod la
    re sol la la, re2\fermata

}

IIbcn = \relative do {

    re8 mi fa dod re fa sol sold
    la re, dod?4 sib8 la sol dod16 dod
    re8 re, re''2 do4~

    %4
    do sib2 la4
    sol do, fa8 sol la fa
    sib2 la8 fa do' do,\mbreak

    %7
    fa8 sol la sol fa4. fad8
    sol la sib la sol4. sold8
    la si dod la re la re la

    %10
    re la r do sib4 mi,8 re
    dod re la' la, la si dod la
    re sol la la, re2\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4 <6>8 <6> s <6> <6 5> s
  <_+>4 s <6> s8 <6 5>
  <4> <3> <5>4 <4 2> <6>4
  <4 2> <6>4 <4 2> <6>4 <6>
  s s4 <6>
  s2 <6>
  s4 <6> <6>2
  s4 <6> s4. <6 5>8
  <_+>4 <6> s2
  s4 s8 <4\+ 2> <6>4 <_+>8 <4\+ 2>
  <6>4 s <7 _+> <6 5>
  s8 <7 5> <6 4> <5 _+>

}

forma = {

  \key fa\major
  \time 4/4
  \tempo 4 = 40
  s1*12
  \bar"|."

}

IIvl = {
  \IIglobal
  \notypeset
  <<\IIvln \forma>>

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

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IIIvln = \relative do'' {

    fa,8 la do
    fa,4 fa'8
    mi16 re do sib la sol

    %4
    fa8 la do
    fa,4 do'8
    si16 la sol fa mi re

    %7
    do8 mi sol
    do,4 fa'8
    mi16 re do sib la sol

    %10
    fa8 la do
    sib,4 sol''8
    fa16 mi re do si la

    %13
    sol8 si re
    do, do do
    sol''16 la sib8 la

    %16
    do,,8 do do
    fa'16 sol la8 sol
    do,,8 do do\mbreak

    %19
    mi'16 fa sol8 fa
    do, do do
    mi'16 fa sol8 mi

    %22
    fa mi16 re do sib
    la8 sib sol
    fa\solo la16(sib) do(sib)

    %25
    la8 la16(sib) do(sib)
    la8 fa'16(sol) la(sol)
    fa8 fa16(sol) la(sol)

    %28
    fa8 la16(sib) do(sib)
    la8 sol fa
    fa4\tr mi8

    %31
    r16 sol fa sol mi sol
    do,8 (mi) sol
    sib,16 sol' fa sol mi sol

    %34
    sib,8(mi) sol
    la,16 la' sol la fa la
    re,8(fad) la

    %37
    do,16 la' sol la fad la
    do,8(fad) la
    si,16 si' la si sol si

    %40
    mi,8(sold) si
    re,16 si' la si sold si
    re,8(sold) si

    %43
    do,(mi) la
    si, (mi) sold
    la,\tu do mi

    %46
    la,4 la'8
    sol16 fa mi re do si
    la8 do mi

    %49
    la,4 mi'8
    re16 do si la sold fad
    mi8 sold si

    %52
    mi, sold si
    la do mi
    la, do mi\mbreak

    %55
    re, fa la
    re, fa la
    sol si re

    %58
    sol, si re
    do, mi sol
    do, mi sol

    %61
    sol, sol sol
    re''16 mi fa8 mi
    sol,, sol sol

    %64
    do'16 re mi8 re
    sol,, sol sol
    si'16 do re8 do

    %67
    sol, sol sol
    si'16 do re8 si
    do re16 mi fa sol

    %70
    mi8 fa re
    do16\solo (re) re8.\tr [(do32 re)]
    mi16 sol mi sol re sol

    %73
    do,16 (re) re8.\tr [(do32 re)]
    mi16 sol mi sol re sol
    do, mi sol mi re do

    %76
    si8.\tr la16 sol8\mbreak %%%% Fine p. 14 OK
    re'16(mi) mi8.\tr [(re32 mi)]
    fa16 la fa la mi la

    %79
    re,16(mi) mi8.\tr [(re32 mi)]
    fa16 la fa la mi la
    re, fa la fa mi re

    %82
    dod8. si16 la8
    r16 la' la8.\tr[(sol32 la)]
    sib16 sol mi sol re sol

    %85
    do,(sol') sol8.\tr[(fa32 sol)]
    la16 fa re fa do fa
    sib,(fa') fa8.\tr [((mi32 fa)]

    %88
    sol16 mi dod mi sib mi
    la,(mi') mi8.\tr [(re32 mi)]
    fa16(re) dod (re) fa(re)

    %91
    la(re) dod (re) fa(re)
    sib (re) dod( re) fa(re)
    la(re) dod (re) fa(re)

    %94
    sib'8 la16(sol) fa(mi)
    la8 sol16(fa) mi(re)
    mi8 dod4\tr

    %97
    <<re4\\{\stemUp\shiftOn re,8\tu fa la}>>
    re16 mi fa sol la8
    sib16 la sol fa mi re

    %100
    dod8. si16 la8
    fa'16 sol la sol la fa
    sib(la) sib(la) sib8~

    %103
    sib16 sold fa mi fa sold
    la(sol) la(sol) la8~
    la16 fa mi re mi fa

    %106
    sol(fa) sol(fa) sol8~
    sol16 mi re dod re mi
    fa8 mi re\mbreak

    %109
    la,8 la la
    mi''16 fa sol8 sol
    la,,8 la la

    %112
    re'16 mi fa8 mi
    la,,8 la la
    dod'16 re mi8 re

    %115
    la,8 la la
    dod'16 re mi8 dod
    re16 mi fa sol la8

    %118
    re, mi dod
    <<
        {
            fa\solo fa fa
            mi mi mi

            %121
            fa fa fa
            mi mi mi
            fa fa fa

            %124
            mi4
        }\\{
            re16 la re la re la
            dod la dod la dod la
            re la re la re la
            dod la dod la dod la
            re la re la re la
            dod8 [la]
        }
    >> r8
    la'16 la la la la la
    re la re, la' re la\mbreak %% fine prima riga p 16

    %127
    re la re, la' re la
    sib re, re re re re
    sol re sol, re' sol re

    %130
    sol re sol, re' sol re
    mi sol sol sol sol sol
    do sol do, sol' do sol

    %133
    do sol do, sol' do sol
    la do, do do do do
    fa do fa, do' fa do

    %136
    fa do fa, do' fa do
    re fa fa fa fa fa
    sib fa sib, fa' sib fa

    %139
    sib fa sib, fa' sib fa
    sol sib, sib sib sib sib
    mib sib sol sib mib sib

    %142
    mib sib sol sib mib si
    fad8(la) do
    fad(la) do,

    %145
    sib(re) sol\mbreak
    sib(sol) re
    mib16 do mib sol mib do

    %148
    la(do mib) do la do
    fa,(la do) mib re do
    re(sib la sib) re(sib)

    %151
    mib(sib la sib) \once\slurDashed mib(sol,)
    fa'(sib,  la sib) fa'(sib,)
    sol'(sib, la sib) sol'(sib,)

    %154
    la'(sib, la sib) la'(sib,)
    sib'8 la16 sol fa mib
    re8 mib do

    %157
    <sib fa sib,>\tu re, fa
    sib,4 sib''8
    la16 sol fa mib re do

    %160
    sib8 fa re
    mib sol sib
    re, fa sib

    %163
    mib, sol sib
    re, fa sib\mbreak
    mib, sol sib

    %166
    mi,! sol do
    fa, la do
    mi, sol do

    %169
    fa, la do
    mi, sol do
    fa, la do

    %172
    fa mi16 re do sib
    la8. sol16 fa8
    do'' sib16 la sol fa

    %175
    mi8. re16 do8
    do16 fa do fa do fa
    re fa re fa re fa

    %178
    do fa do fa do fa
    re fa re fa re fa
    do fa do fa do fa

    %181
    re4 r8
    re16 sol re sol re sol
    mi sol mi sol mi sol

    %184
    re sol re sol re sol
    mi sol mi sol mi sol
    re sol re sol re sol \mbreak

    %187
    mi4 r8
    mi16 la mi la mi la
    fa la fa la fa la

    %190
    mi la mi la mi la
    fa la fa la fa la
    mi la mi la mi la

    %193
    fa4 r8
    fa sol16(la) sib(la)
    sol8 fa16(mi) re(do)

    %196
    do4\tr r8
    sol'16(la) sib8 la
    sol fa16(mi) re(do)

    %199
    do4\tr r8
    mi16(fa32 sol) fa8 mi
    fa16(sol32 la) sol8 fa

    %202
    sol16(la32 sib) la8 sol
    la16(sib32 do) sib8 la
    sib16(do32 re) do8 sib

    %205
    fa' mi16 re do sib
    la8 sib sol
    fa' mi16 re do sib

    %208
    la8 sib  sol
    fa4 do8
    fa,4 fa'8\mbreak

    %211
    mi16 re do sib la sol
    fa8 la do
    fa, la do

    %214
    fa, la do
    do, do do
    do'16(mi) sib'(mi,) sib' (mi,)

    %217
    do mi sib' mi, sib' mi,
    do (fa) la (fa) la (fa)
    do fa la fa la fa

    %220
    do (fa) lab (fa) lab (fa)
    do fa lab fa lab fa
    do (fa) sol (fa) sol (fa)

    %223
    do fa sol fa sol fa
    do (mi) sol (mi) sol (mi)
    do mi sol mi sol mi

    %226
    fa4 r8
    do,8 do do
    sol''16 la sib8 la

    %229
    do,,8 do do
    fa'16 sol la8 sol
    do,, do do

    %232
    mi'16 fa sol8 fa
    do, do do
    mi'16 fa sol8 mi

    %235
    fa mi16 re do sib
    la8 sib sol
    fa4 r8

    %238
    fa' sol mi
    fa4\fermata r8

}

IIIvlIn =  \relative do'' {

    fa,8 la do
    fa,4 fa'8
    mi16 re do sib la sol

    %4
    fa8 la do
    fa,4 do'8
    si16 la sol fa mi re

    %7
    do8 mi sol
    do,4 fa'8
    mi16 re do sib la sol

    %10
    fa8 la do
    sib,4 sol''8
    fa16 mi re do si la

    %13
    sol8 si re
    do, do do
    sol''16 la sib8 la

    %16
    do,,8 do do
    fa'16 sol la8 sol
    do,,8 do do\mbreak

    %19
    mi'16 fa sol8 fa
    do, do do
    mi'16 fa sol8 mi

    %22
    fa mi16 re do sib
    la8 sib sol
    fa4 r8

    %25
    R4.*20
    la8 do mi

    %46
    la,4 la'8
    sol16 fa mi re do si
    la8 do mi

    %49
    la,4 mi'8
    re16 do si la sold fad
    mi8 sold si

    %52
    mi, sold si
    la do mi
    la, do mi\mbreak

    %55
    re, fa la
    re, fa la
    sol si re

    %58
    sol, si re
    do, mi sol
    do, mi sol

    %61
    sol, sol sol
    re''16 mi fa8 mi
    sol,, sol sol

    %64
    do'16 re mi8 re
    sol,, sol sol
    si'16 do re8 do

    %67
    sol, sol sol
    si'16 do re8 si
    do re16 mi fa sol

    %70
    mi8 fa re
    do4 r8
    R4.*25

    %97
    re,8 fa la
    re16 mi fa sol la8
    sib16 la sol fa mi re

    %100
    dod8. si16 la8
    fa'16 sol la sol la fa
    sib(la) sib(la) sib8~

    %103
    sib16 sold fa mi fa sold
    la(sol) la(sol) la8~
    la16 fa mi re mi fa

    %106
    sol(fa) sol(fa) sol8~
    sol16 mi re dod re mi
    fa8 mi re\mbreak

    %109
    la,8 la la
    mi''16 fa sol8 sol
    la,,8 la la

    %112
    re'16 mi fa8 mi
    la,,8 la la
    dod'16 re mi8 re

    %115
    la,8 la la
    dod'16 re mi8 dod
    re16 mi fa sol la8

    %118
    re, mi dod
    re4 r8
    R4.*5

    %125
    fad,8 fad fad
    fad4 r8\mbreak
    R4.

    %128
    sol8 sib, sib
    si4 r8
    R4.

    %131
    sol'8 mi mi
    mi4 r8
    R4.

    %134
    do8 la la
    la4 r8
    R4.

    %137
    fa'8 re re
    re4 r8
    R4.

    %140
    sib8 sol sol
    sol4 r8
    R4.*15

    %157
    sib8 re fa
    sib,4 sib''8
    la16 sol fa mib re do

    %160
    sib8 fa re
    mib sol sib
    re, fa sib

    %163
    mib, sol sib
    re, fa sib\mbreak
    mib, sol sib

    %166
    mi,! sol do
    fa, la do
    mi, sol do

    %169
    fa, la do
    mi, sol do
    fa,4 r8

    %172
    R4.*4
    la8 la la
    sib sib sib

    %178
    la la la
    sib sib sib
    la la la

    %181
    sib, re fa
    si, si' si
    do do do

    %184
    si si si
    do do do
    si si si\mbreak

    %187
    do, mi sol
    dod, dod' dod
    re re re

    %190
    dod dod dod
    re re re
    dod dod dod

    %193
    re, fa la
    re,4 r8
    R4.

    %196
    do8 do do
    R4.*2
    do8 do do

    %200
    R4.*9
    fa8 la do
    fa,4 fa'8\mbreak

    %211
    mi16 re do sib la sol
    fa8 la do
    fa, la do

    %214
    fa, la do
    do, do do
    R4.

    %217
    do8 do do
    R4.
    do8 do do

    %220
    R4.
    do8 do do
    R4.

    %223
    do8 do do
    R4.
    do8 do do

    %226
    fa la do
    do, do do
    sol''16 la sib8 la

    %229
    do,,8 do do
    fa'16 sol la8 sol
    do,, do do

    %232
    mi'16 fa sol8 fa
    do, do do
    mi'16 fa sol8 mi

    %235
    fa mi16 re do sib
    la8 sib sol
    fa4 r8

    %238
    fa' sol mi
    fa4\fermata r8

}

IIIvlIIn = \relative do'' {

    fa,8 la do
    fa,4 fa'8
    mi16 re do sib la sol

    %4
    fa8 la do
    fa,4 do'8
    si16 la sol fa mi re

    %7
    do8 mi sol
    do,4 fa'8
    mi16 re do sib la sol

    %10
    fa8 la do
    sib,4 sol''8
    fa16 mi re do si la

    %13
    sol8 si re
    do, do do
    sol''16 la sib8 la

    %16
    do,,8 do do
    fa'16 sol la8 sol
    do,,8 do do\mbreak

    %19
    mi'16 fa sol8 fa
    do, do do
    mi'16 fa sol8 mi

    %22
    fa mi16 re do sib
    la8 sib sol
    fa4 r8

    %25
    R4.*20
    la8 do mi

    %46
    la,4 la'8
    sol16 fa mi re do si
    la8 do mi

    %49
    la,4 mi'8
    re16 do si la sold fad
    mi8 sold si

    %52
    mi, sold si
    la do mi
    la, do mi\mbreak

    %55
    re, fa la
    re, fa la
    sol si re

    %58
    sol, si re
    do, mi sol
    do, mi sol

    %61
    sol, sol sol
    re''16 mi fa8 mi
    sol,, sol sol

    %64
    do'16 re mi8 re
    sol,, sol sol
    si'16 do re8 do

    %67
    sol, sol sol
    si'16 do re8 si
    do re16 mi fa sol

    %70
    mi8 fa re
    do4 r8
    R4.*25

    %97
    re,8 fa la
    re16 mi fa sol la8
    sib16 la sol fa mi re

    %100
    dod8. si16 la8
    fa'16 sol la sol la fa
    sib(la) sib(la) sib8~

    %103
    sib16 sold fa mi fa sold
    la(sol) la(sol) la8~
    la16 fa mi re mi fa

    %106
    sol(fa) sol(fa) sol8~
    sol16 mi re dod re mi
    fa8 mi re\mbreak

    %109
    la,8 la la
    mi''16 fa sol8 sol
    la,,8 la la

    %112
    re'16 mi fa8 mi
    la,,8 la la
    dod'16 re mi8 re

    %115
    la,8 la la
    dod'16 re mi8 dod
    re16 mi fa sol la8

    %118
    re, mi dod
    re4 r8
    R4.*5

    %125
    fad,8 fad fad
    fad4 r8\mbreak
    R4.

    %128
    sol8 sib, sib
    si4 r8
    R4.

    %131
    sol'8 mi mi
    mi4 r8
    R4.

    %134
    do8 la la
    la4 r8
    R4.

    %137
    fa'8 re re
    re4 r8
    R4.

    %140
    sib8 sol sol
    sol4 r8
    R4.*15

    %157
    sib8 re fa
    sib,4 sib''8
    la16 sol fa mib re do

    %160
    sib8 fa re
    mib sol sib
    re, fa sib

    %163
    mib, sol sib
    re, fa sib\mbreak
    mib, sol sib

    %166
    mi,! sol do
    fa, la do
    mi, sol do

    %169
    fa, la do
    mi, sol do
    fa,4 r8

    %172
    R4.*4
    la8 la la
    sib sib sib

    %178
    la la la
    sib sib sib
    la la la

    %181
    sib, re fa
    si, si' si
    do do do

    %184
    si si si
    do do do
    si si si\mbreak

    %187
    do, mi sol
    dod, dod' dod
    re re re

    %190
    dod dod dod
    re re re
    dod dod dod

    %193
    re, fa la
    re,4 r8
    R4.

    %196
    do8 do do
    R4.*2
    do8 do do

    %200
    R4.*9
    fa8 la do
    fa,4 fa'8\mbreak

    %211
    mi16 re do sib la sol
    fa8 la do
    fa, la do

    %214
    fa, la do
    do, do do
    R4.

    %217
    do8 do do
    R4.
    do8 do do

    %220
    R4.
    do8 do do
    R4.

    %223
    do8 do do
    R4.
    do8 do do

    %226
    fa la do
    do, do do
    sol''16 la sib8 la

    %229
    do,,8 do do
    fa'16 sol la8 sol
    do,, do do

    %232
    mi'16 fa sol8 fa
    do, do do
    mi'16 fa sol8 mi

    %235
    fa mi16 re do sib
    la8 sib sol
    fa4 r8

    %238
    fa' sol mi
    fa4\fermata r8

}

IIIvlan =  \relative do' {

    fa8 la do
    fa,4 r8
    R4.

    %4
    fa8 la do
    fa,4 r8
    R4.

    %7
    do8 mi sol
    do,4 r8
    R4.

    %10
    fa8 la do
    sib,4 r8
    R4.

    %13
    sol'8 si re
    do, do do
    R4.

    %16
    do8 do do
    R4.
    do8 do do\mbreak

    %19
    R4.
    do8 do do
    R4.

    %22
    la'4 r8
    do, re mi
    fa4 r8

    %25
    R4.*20
    la8 do mi

    %46
    la,4 r8
    R4.
    la8 do mi

    %49
    la,4 r8
    R4.
    mi8 sold si

    %52
    mi, sold si
    la do mi
    la, do mi\mbreak

    %55
    re, fa la
    re, fa la
    sol si re

    %58
    sol, si re
    do, mi sol
    do, mi sol

    %61
    sol, sol sol
    R4.
    sol8 sol sol

    %64
    R4.
    sol8 sol sol
    R4.

    %67
    sol8 sol sol
    R4.
    sol'4 r8

    %70
    sol la si
    do4 r8
    R4.*25

    %97
    re,8 fa la
    re,4 r8
    re4 sib'8

    %100
    mi,4 la8
    la fa4
    re4.

    %103
    mi8 sol mi
    do fa la
    re, fa re

    %106
    si mi sol
    dod, mi dod
    la4 la8\mbreak

    %109
    la8 la la
    R4.
    la8 la la

    %112
    R4.
    la8 la la
    R4.

    %115
    la8 la la
    R4.
    la'4 r8

    %118
    la sib mi,
    fa4 r8
    R4.*6

    %126
    fad8 fad fad\mbreak
    fad?4 r8
    R4.

    %129
    si,8 si si
    si?4 r8
    R4.

    %132
    mi8 mi mi
    mi4 r8
    R4.

    %135
    la,8 la la
    la4 r8
    R4.

    %138
    re8 re re
    re4 r8
    R4.

    %141
    sol,8 sol sol
    sol4 r8
    R4.*14

    %157
    sib8 re fa
    sib,4 r8
    R4.

    %160
    sib8 re sib
    mib sol sib
    re, fa sib

    %163
    mib, sol sib
    re, fa sib\mbreak
    mib, sol do

    %166
    mi,! sol do
    fa, la do
    mi, sol do

    %169
    fa, la do
    mi, sol do
    fa,4 r8

    %172
    R4.*9
    sib,!8 re fa

    %182
    si,4 r8
    R4.*4\mbreak
    do8 mi sol

    %188
    dod,4 r8
    R4.*4
    re8 fa la

    %194
    re,4 r8
    R4.
    do8 do do

    %197
    R4.*2
    do8 do do
    R4.*9

    %209
    fa8 la do
    fa,4 r8
    R4.
    fa8 la do

    %213
    fa, la do
    fa, la do
    do, do do

    %216
    R4.
    do8 do do
    R4.

    %219
    do8 do do
    R4.
    do8 do do

    %222
    R4.
    do8 do do
    R4.

    %225
    do8 do do
    fa la do
    do, do do

    %228
    R4.
    do8 do do
    R4.

    %231
    do8 do do
    R4.
    do8 do do

    %234
    R4.
    la'4 r8
    fa sol mi

    %237
    fa4 r8
    do re do
    do4\fermata r8

}

IIIbcn = \relative do {

    fa8 la do
    fa,4 r8
    R4.

    %4
    fa8 la do
    fa,4 r8
    R4.

    %7
    do8 mi sol
    do,4 r8
    R4.

    %10
    fa8 la do
    sib,4 r8
    R4.

    %13
    sol'8 si re
    do, do do
    R4.

    %16
    do8 do do
    R4.
    do8 do do\mbreak

    %19
    R4.
    do8 do do
    R4.

    %22
    fa4 r8
    fa sib, do
    fa4 r8

    %25
    fa4 r8
    fa4 r8
    fa4 r8

    %28
    fa4 r8
    fa8. sol16 la sib
    do4 do,8

    %31
    do4 r8
    mi4 r8
    do4 r8

    %34
    do do do
    fa4 r8
    fad4 r8

    %37
    re4 r8\mbreak
    fad8 fad fad
    sol4 r8

    %40
    sold4 r8
    mi4 r8
    sold sold sold

    %43
    la4 do,8
    re mi mi,
    la'  do mi

    %46
    la,4 r8
    R4.
    la8 do mi

    %49
    la,4 r8
    R4.
    mi8 sold si

    %52
    mi, sold si
    la do mi
    la, do mi\mbreak

    %55
    re, fa la
    re, fa la
    sol si re

    %58
    sol, si re
    do, mi sol
    do, mi sol

    %61
    sol, sol sol
    R4.
    sol8 sol sol

    %64
    R4.
    sol8 sol sol
    R4.

    %67
    sol8 sol sol
    R4.
    do4 r8

    %70
    do fa, sol
    do8 si4
    do4 r8

    %73
    do si4
    do4 r8
    do4 fa8

    %76
    sol4 r8 %%% fine p. 14
    fa8 dod4
    re r8

    %79
    re dod4
    re r8
    re4 sol8

    %82
    la4 sol8
    fa re fa
    sol4 r8

    %85
    mi do mi
    fa4 r8
    re sib re

    %88
    mi4 r8
    dod la dod
    re4 r8

    %91
    fa4 r8\mbreak
    sol4 r8
    fa4 r8

    %94
    sol4 r8
    fa4 fa8
    sol la la,

    %97
    re fa la
    re,4 r8
    sol4 r8

    %100
    la8. sol16 fa mi
    re8 fa re
    sol sib sol

    %103
    do, mi do
    fa la fa
    sib re sib

    %106
    mi, sol mi
    la, dod la
    re la' re,\mbreak

    %109
    la8 la la
    R4.
    la8 la la

    %112
    R4.
    la8 la la
    R4.

    %115
    la8 la la
    R4.
    re4 r8

    %118
    re sol, la
    re4 r8
    la' la sol

    %121
    fa4 r8
    la8 la sol
    fa4 r8

    %124
    la la sol
    fad4 r8
    R4.\mbreak

    %127
    fad8 fad fad
    sol4 r8
    R4.

    %130
    si,8 si si
    do4 r8
    R4.

    %133
    mi8 mi mi
    fa4 r8
    R4.

    %136
    la,8 la la
    sib4 r8
    R4.

    %139
    re8 re re
    mib4 r8
    R4.

    %142
    do8 do do
    re4 r8
    re4 r8

    %145
    sol4 r8\mbreak
    sol,4 r8
    do4 r8

    %148
    fa4 r8
    la,4 r8
    sib4 r8

    %151
    do4 r8
    re4 r8
    mib4 r8

    %154
    fa4 r8
    re4 la8
    sib mib fa

    %157
    sib, re fa
    sib,4 r8
    R4.

    %160
    sib8 re sib
    mib sol sib
    re, fa sib

    %163
    mib, sol sib
    re, fa sib\mbreak
    mib, sol do

    %166
    mi,! sol do
    fa, la do
    mi, sol do

    %169
    fa, la do
    mi, sol do
    fa,4 r8

    %172
    fa4 r8
    fa4 r8
    fa8. sol16 la sib

    %175
    do4 do,8
    R4.*5
    sib!8 re fa

    %182
    si,4 r8
    R4.*4\mbreak
    do8 mi sol

    %188
    dod,4 r8
    R4.*4
    re8 fa la

    %194
    re,4 r8
    R4.
    do8 do do

    %197
    R4.*2
    do8 do do
    do4 r8

    %201
    fa4 r8
    mi4 r8
    fa4 r8

    %204
    sol4 r8
    la4 r8
    fa sib, do

    %207
    fa,4 r8
    fa'8 sib, do
    fa la do

    %210
    fa,4 r8\mbreak
    R4.
    fa8 la do

    %213
    fa, la do
    fa, la do
    do, do do

    %216
    R4.
    do8 do do
    R4.

    %219
    do8 do do
    R4.
    do8 do do

    %222
    R4.
    do8 do do
    R4.

    %225
    do8 do do
    fa la do
    do, do do

    %228
    R4.
    do8 do do
    R4.

    %231
    do8 do do
    R4.
    do8 do do

    %234
    R4.
    fa4 r8
    fa sib, do

    %237
    fa,4 r8
    fa' sib, do
    fa,4\fermata r8

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8 <6> s
    s4.
    s
    s8 <6> s
    s4.*18
    s8 <6 5> s
    s4.*6
    <4>4 <3>8
    s4.
    <6>
    <7>
    <7>
    s
    <6>
    <7 _+>
    <6 5>
    <_!>
    <6 5>
    s
    <6 5>
    s4 <6>8
    s <4> <_+>
    s4.*6
    <_+>4.
    <_+>
    s4.*4
    <_!>4.
    <_!>
    s
    s
    <_!>
    s
    <_!>
    s
    <_!>
    s
    <_!>
    s
    s
    s8 <6 5> <_!>
    s <6 5>4
    s4.
    s8 <6 5>4
    s4.
    s4 <6 5>8
    <_!>4.
    <6>8 <6 5>4
    s4.
    s8 <6>4
    s4.*2
    <_+>4.
    <6>
    s
    <6>
    s
    <6>
    <6\\>
    <6 5>
    s
    <6>
    s <6>
    s <6>
    s8 <4> <_+>
    s4.
    s
    <6 5>
    <_+>
    s8 <6> s
    s4.
    <7>
    s8 <6> s
    <7>4.
    s
    <_+>8 <6>4
    s8 <_+>4
    <_+>4.
    s
    <_+>
    s
    <_+>
    s
    <_+>
    s
    s
    s8 <6 5> <_+>
    s4.
    <_+>
    <6>
    <_+>
    <6>
    <_+>
    <6>
    s
    <6>
    <_->
    s
    <6>
    s
    s
    <6>
    s
    s
    <6>
    s
    s
    <6>
    s
    s
    <_->
    <7 _+>
    <7 _+>
    s
    s
    <_->
    <7->
    <6 5->
    s
    <_->
    <6>
    <6 5>
    s
    <6>
    s8 <6 5> s
    s4.*3
    s8 <6> s
    s4.
    <6>
    s <6>
    s <6>
    s <6>
    s <6>
    s4.*11
    <6>4.
    s4.*5
    <6 5>4.
    s4.*13
    <6 5>4.
    s4.*3
    s8 <6 5> s
    s4.
    s8 <6 5>4
    s4.*10
    <6 4>4.
    s
    <6- 4>
    s
    <5 4>
    s
    <5 3>
    s4.*10
    s8 <6 5> s
    s4.
    s8 <6 5>

}

forma = {

    \key fa\major
    \time 3/8
    \tempo 2 = 60
    s4.*239
    \bar"|."


}

IIIvl = {
    \IIIglobal
    %\notypeset
    <<\IIIvln \forma>>

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
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] Allegro"

\score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""principale]"}
                \Ivl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
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
            \override SpacingSpanner.uniform-stretching = ##t
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

\pageBreak

\markup\huge "[2.] Adagio [Grave (Pisendel)]"

\score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \IIvl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

\pageBreak

\markup\huge "[3.] Allegro"

\score {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \IIIvl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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




