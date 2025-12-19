\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

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
  \con\terzine
}

IvlIn = \relative do'' {

  r16 sib re fa fa(re sib) fa fa sib re fa fa(re sib) fa
  fa re' fa sib sib(fa re) sib sib re fa sib sib(fa re) sib
  sib fa' sib re re(sib fa) re re fa sib re  re(sib fa) re

  %4
  re sib' re fa fa(re sib) fa fa sib re fa fa(re sib) fa
  fa(sib re) fa fa,(sib re) fa\mbreak fa,(sib re) fa fa,(sib re) fa
  fa,1\tr~

  %7
  fa~
  fa\fermata\mbreak
  sib,16 [sib, sib sib sib sib sib sib] lab4 r

  %10
  lab'16[lab, lab lab lab lab lab lab] sol4 r
  mib''16[mib, mib mib mib mib mib mib] re4 r
  re'16[re,re re re re re re] do4 r

  %13
  do'16[do, do do do do do do] sib4 r
  \tuplet 3/2 { fa''16(sol lab) fa[(sol lab)] fa(sol lab) fa[(sol lab)]} sol4 r\senza \mbreak
  \tuplet 3/2 { sol16 la sib sol[la sib] sol la sib sol[la sib]} la4 r

  %16
  \tuplet 3/2 { la16 sib do la[sib do] la sib do la[sib do]} sib4 r
  R1
  r16 fa fa la la re re la sol mib mib sol sol do do sol\mbreak

  %19
  fa re re fa fa sib sib fa mib do do mib mib la la mib
  re sib sib re re sol sol re do la la do do fa fa mib
  re sib sib re re fa fa sib sib4 r

  %22
  r16 sib, sib re re fa fa sib sib4 r
  sib16 fa mib re do8.\tr sib16\mbreak sib' fa mib re do8.\tr sib16
  sib' fa mib re do8.\tr sib16 sib4 r8 fa'

  %25
  sib[la16(sol) fa(mib) re(do)] re(sib) do(la) sib4
  r2 r4 r8 sib'
  re16(do) re(sib) fa'(mib) fa(re) re4\tr do

  %28
  r2\mbreak r4 r8 fa,
  sib,16(re fa sib) lab(sol fa lab) sol(fa mib re) mib8 sol
  do,16(mi sol do) sib(la sol sib) la(sol fa mi) fa4

  %31
  r16 sib, re fa fa8 sib, r2
  r16 do mi sol sol8 do, r4 r8 fa
  sol16 mi do sol' la fa do la'\mbreak sib sol do, sib' la fa do la'

  %34
  sol mi do sol' la fa do la' sib sol do, sib' la fa do la'
  sol8 do, r do' \appoggiatura sib la sol16 fa sol4\tr
  fa do' \appoggiatura sib8 la sol16 fa sol4\tr

  %37
  fa16 fa, la do fa4 r8 r16 mi fa do la fa'
  sol8 r16 sol fa do la fa'\mbreak mi!8 r16 mi fa do la fa'
  sol8 r16 sol fa do la fa' mi4 r

  %40
  R1
  r2 r16 do do fa fa la la sol
  sol do, do mi mi la la mi re sib sib re re sol sol re\mbreak  %%fine p.9

  %43
  do la la do do fa fa do sib sol sol sib sib mi mi sib
  la fa' fa la la do do fa fa4 r
  r16 fa, fa la la do do fa fa4 r

  %46
  r16 do sib la sol8.\tr fa16 fa4 r
  R1*5
  r2 r16 do do fa fa la la do

  %53
  do4 r r2
  R1*7
  re,32 la(si dod re mi fa sol la16) fa mi re mi8 la mi dod\mbreak

  %62
  la la' fa re r2
  r32 do? re mi fa sol la sib do16 sib la sol la8 do la fa
  re fa re sib r2\mbreak

  %65
  r32 fa(sol la sib do re mib? fa16) mib re do re16[sib, sib sib sib sib sib sib]
  lab4 r lab'16[lab, lab lab lab lab lab lab]
  sol4 r mib''16[mib, mib mib mib mib mib mib]

  %68
  re4 r re'16 [re, re re re re re re]
  do4 r do'16[do, do do do do do do]
  fa'16 sib, re, sib' fa' sib, re, sib' sol' sib, mib, sib' sol' sib, mib, sib'\mbreak

  %71
  fa' sib, re, sib' fa' sib, re, sib' sol' sib, mib, sib' sol' sib, mib, sib'
  sol' do, mi, do' sol' do, mi, do' la' do, fa, do' la' do, fa, do'
  sol' do, mi, do' sol' do, mi, do' la' do, fa, do' la' do, fa, do'

  %74
  la' re, fad, re' la' re, fad, re' sib' re, sol, re' sib' re, sol, re'
  la' re, fad, re' la' re, fad, re' sib' re, sol, re' sib' re, sol, re'
  sib' re, sol, re' sib' re, sol, re' sib' do, mib, do' sib' do, mib, do'

  %77
  la' do, fa, do' la' do, fa, do' la' sib, re, sib' la' sib, re, sib'\mbreak
  sol' sib, mib, sib' sol' sib, mib, sib' la' do, mib, do' la' do, mib, do'
  sib' re, fa, re' sib' re, fa, re' sib' do, fa, do' sib' do, fa, do'

  %80
  la' do, fa, do' la' do, fa, do' <<sib'4\\\stemUp \override Stem #'transparent = ##t re,\\{\stemDown fa,16 fa' fa sib}>> sib re re sib
  sol mib mib sol sol do do sol fa re re fa fa sib sib fa
  mib do do mib mib la la mib re sib sib re re sol sol re

  %83
  do la la do do fa fa mib\mbreak re sib sib re re fa fa sib
  sib4 r r16 sib, sib re re fa fa sib
  sib4 r sib16 fa mib re do8.\tr sib16

  %86
  sib'16 fa mib re do8.\tr sib16 sib'8 re, do la'
  sib1\fermata

}

IvlIIn = \relative do'' {

  R1
  r16 sib re fa fa(re sib) fa fa sib re fa fa(re sib) fa
  fa re' fa sib sib(fa re) sib sib re fa sib sib(fa re) sib

  %4
  sib fa' sib re re(sib fa) re re fa sib re  re(sib fa) re
  re(fa sib) re re,(fa sib) re\mbreak re,(fa sib) re re,(fa sib) re
  re,1\tr~

  %7
  re~
  \parenthesize re\fermata
  sib16 [sib, sib sib sib sib sib sib] lab4 r

  %10
  lab'16[lab, lab lab lab lab lab lab] sol4 r
  mib''16[mib, mib mib mib mib mib mib] re4 r
  re'16[re,re re re re re re] do4 r

  %13
  do'16[do, do do do do do do] sib4 r
  \tuplet 3/2 { re'16(mib fa) re[(mib fa)] re(mib fa) re[(mib fa)] } sib,4 r\mbreak
  \senza \tuplet 3/2 { mi16 fa sol mi[fa sol] mi fa sol mi[fa sol]} do,4 r

  %16
  \tuplet 3/2 { fad16 sol la fad[sol la] fad sol la fad[sol la] } re,4 r
  R1
  r16 do do fa fa la la re sib sib, sib mib mib sol sol do\mbreak

  %19
  la la, la re re fa fa sib sol sol, sol do do mib mib la
  fa fa, fa sib sib re re sol mib mib, mib la la do do do
  sib fa fa sib sib re re fa fa4 r

  %22
  r16 fa, fa sib sib re re fa fa4 r
  fa16 re do sib la8.\tr sib16\mbreak fa' re do sib la8.\tr sib16
  fa' re do sib la8.\tr sib16 sib4 r

  %25
  R1*16
  r2 r16 la la do do fa fa mi
  mi? sol, sol do do mi! mi la fa fa, fa sib sib re re sol\mbreak

  %43
  mib mib, mib la la do do fa re re, re sol sol sib sib do
  do do do fa fa la la do do4 r
  r16 do, do fa fa la la do do4 r

  %46
  r16 la sol fa mi8.\tr fa16 fa[(la32 sol fa16) la] do,[(la'32 sol fa16) la]
  do,[(la'32 sol fa16) la] do,[(la'32 sol fa16) la]\mbreak do,[(sib'32 la sol16) sib] do,[(sib'32 la sol16) sib]
  do,[(sib'32 la sol16) sib] do,[(sib'32 la sol16) sib] la8 fa r4

  %49
  R1
  r2 \con \tuplet 3/2 { do'16(la sib) do[(sib la)] fa(la sib) do[(sib la)]\senza
  re sol,  la sib[la sol] mi sol la sib[la sol] do fa, sol la[sol fa] re fa sol la[sol fa]

  %52
  sib mi, fa sol[fa mi] do mi fa sol[fa mi]} la do, do fa fa la la do
  do4 r16 sib(la sol) fad(sol la fad) do(mib! re do)
  si(la si do)si(la' sol fa)\mbreak mi(fa sol mi) sib?(re do sib)

  %55
  la(sol la sib) la(sol' fa mi) re(dod re mi) re(la' sol fa)
  \senza \tuplet 3/2 { sib la sol la[sol fa] sol fa mi fa[mi re] dod si la } la' [re] mi,4\tr
  re r r2

  %58
  R1*3
  r2 r32 la(si dod re mi fa sol la16) sol fa mi\mbreak
  fa8 re' la fa re re sib sol

  %63
  r2 r32 fa sol la sib do re mi fa16 mib re do
  re8 sib' fa re sib mib sib sol\mbreak
  r2 re'16[sib, sib sib sib sib sib sib]

  %66
  lab4 r lab'16[lab, lab lab lab lab lab lab]
  sol4 r mib''16[mib, mib mib mib mib mib mib]
  re4 r re'16 [re, re re re re re re]

  %69
  do4 r do'16[do, do do do do do do]
  fa16 re' fa, re' fa, re' fa, re' sol, mib' sol, mib' sol, mib' sol, mib'\mbreak
  fa, re' fa, re' fa, re' fa, re' sol, mib' sol, mib' sol, mib' sol, mib'

  %72
  sol, mi' sol, mi' sol, mi' sol, mi' la, fa' la, fa' la, fa' la, fa'
  sol, mi' sol, mi' sol, mi' sol, mi' la, fa' la, fa' la, fa' la, fa'
  la, fad' la, fad' la, fad' la, fad' sib, sol' sib, sol' sib, sol' sib, sol'

  %75
  la, fad' la, fad' la, fad' la, fad' sib, sol' sib, sol' sib, sol' sib, sol'
  sib, sol' sib, sol' sib, sol' sib, sol' do, mib do mib do mib do mib
  do fa do fa do fa do fa sib, fa' sib, fa' sib, fa' sib, fa'\mbreak

  %78
  sib, sol' sib, sol' sib, sol' sib, sol' do, la' do, la' do, la' do, la'
  re, sib' re, sib' re, sib' re, sib' do, sib' do, sib' do, sib' do, sib'
  do, la' do, la' do, la' do, la' <<sib4\\{re,16 re re fa}>> fa sib sib re

  %81
  sib sib, sib mib mib sol sol do la la, la re re fa fa sib
  sol sol, sol do do mib mib fa fa fa, fa sib sib re re sol
  mib mib, mib la la do do do\mbreak sib fa fa sib sib re re fa

  %84
  fa4 r r16 fa, fa sib sib re re fa
  fa4 r fa16 re do sib la8.\tr sib16
  fa' re do sib la8.\tr sib16 fa'8 sib, la fa'

  %87
  re1\fermata

}

IvlIIIn =  \relative do'' {

  R1*5
  \tuplet 3/2 { sib16(do re) sib[(do re)] sib(do re) sib[(do re)] \senza re mib fa re[mib fa] re mib fa re[mib fa]
  sib do re sib[do re] sib do re sib[do re] re mib fa re[mib fa] re mib fa re[mib fa]}

  %8
  sib,1\tr\fermata\mbreak
  sib,16 [sib, sib sib sib sib sib sib] lab4 r

  %10
  lab'16[lab, lab lab lab lab lab lab] sol4 r
  mib''16[mib, mib mib mib mib mib mib] re4 r
  re'16[re,re re re re re re] do4 r

  %13
  do'16[do, do do do do do do] sib4 r
  r2 mib'16[mib, mib mib mib mib mib mib]\mbreak
  mi4 r fa'16[fa, fa fa fa fa fa fa]

  %16
  fad4 r sol16[sol, sol sol sol sol sol sol]
  \tuplet 3/2 { sib''16 la sol la[sol fa] sol fa mib fa[mib re] mib re do re[do sib] do sib la sib[la sol] }
  fa4 re'2 do4~\mbreak

  %19
  do sib2 la4~
  la sol2 fa4~
  fa r r16 sib sib re re fa fa sib

  %22
  sib4 r r16 sib, sib re re fa fa sib
  sib fa mib re do8.\tr sib16\mbreak sib' fa mib re do8.\tr sib16

  %24
  sib' fa mib re do8.\tr sib16 sib4 r
  r2 r4 r8 fa'
  sib[la16(sol) fa(mib) re(do)] re(sib) do(la) sib4

  %27
  r2 r4 r8 do'
  re16(do) re(sib) fa'(mib) fa(re)\mbreak re4\tr do
  r16 sib, re fa fa8 sib, r2

  %30
  r16 do mi sol sol8 do, r4 r8 fa
  sib,16(re fa sib) lab(sol fa lab) sol(fa mib re) mib8 sol
  do,16(mi sol do) sib(la sol sib) la(sol fa mi) fa4

  %33
  r8 r16 mi fa do la fa'\mbreak sol8 r16 sol fa do la fa'
  mi8 r16 mi fa do la fa' sol8 r16 sol fa do la fa'
  mi4 r r2

  %36
  R1
  r4 r8 fa sol16 mi do sol' la fa do la'
  sib sol do, sib' la fa do la'\mbreak sol mi do sol' la fa do la'

  %39
  sib sol do, sib' la fa do la' sol8 do, r do'
  la sol16 fa sol4\tr fa r8 do'
  la sol16 fa sol4\tr fa r

  %42
  r la2 sol4~\mbreak
  sol fa2 mi4
  fa r r16 fa fa la la do do fa

  %45
  fa4 r r16 fa, fa la la do do fa
  fa do sib la sol8.\tr fa16 fa4 r
  R1*5

  %52
  r2 r16 la, la do do fa fa la
  la4 r r2
  R1*8

  %62
  r32 re, mi fa sol la sib do re16 do sib la sib8 sol re sib
  sol sol' mi do r2
  r32 sib do re mib? fa sol la sib16 lab sol fa sol8 sib sol mib\mbreak

  %65
  do do la fa sib16[sib, sib sib sib sib sib sib]
  lab4 r lab'16[lab, lab lab lab lab lab lab]
  sol4 r mib''16[mib, mib mib mib mib mib mib]

  %68
  re4 r re'16 [re, re re re re re re]
  do4 r do'16[do, do do do do do do]
  r16 fa' re fa sib4 r16 sol mib sol sib4\mbreak

  %71
  r16 fa re fa sib4 r16 sol mib sol sib4
  r16 sol mi sol do4 r16 la fa la do4
  r16 sol mi sol do4 r16 la fa la do4

  %74
  r16 la fad la re4 r16 sib sol sib re4
  r16 la fad la re4 r16 sib sol sib re4
  r16 sib sol sib re4 r16 sol, mib sol sib4

  %77
  r16 la fa la do4 r16 fa, re fa la4\mbreak
  r16 mib sib mib sol4 r16 mib do mib la4
  r16 fa re fa sib4 r16 fa do fa sib4

  %80
  r16 fa do fa la4 sib re,~
  re do2 sib4~
  sib la2 sol4~
  sol fa2 r4

  %83
  r16 sib sib re re fa fa  sib sib4 r
  r16 sib, sib re re fa fa sib
  sib16 fa mib re do8.\tr sib16

  %86
  sib'16 fa mib re do8.\tr sib16 sib'8 re, do la'
  sib1\fermata

}

IvlIVn =  \relative do'' {

  R1*5
  r2 \tuplet 3/2 { sib16(do re) sib[(do re)] sib(do re) sib[(do re)]
                   \senza re mib fa re[mib fa] re mib fa re[mib fa] sib do re sib[do re] sib do re sib[do re]
                   re mib fa re[mib fa] re mib fa re[mib fa]} re2\fermata\mbreak
  sib,16 [sib, sib sib sib sib sib sib] lab4 r

  %10
  lab'16[lab, lab lab lab lab lab lab] sol4 r
  mib''16[mib, mib mib mib mib mib mib] re4 r
  re'16[re,re re re re re re] do4 r

  %13
  do'16[do, do do do do do do] sib4 r
  r2 mib'16[mib, mib mib mib mib mib mib]\mbreak
  mi4 r fa'16[fa, fa fa fa fa fa fa]

  %16
  fad4 r sol16[sol, sol sol sol sol sol sol]
  sol4 \tuplet 3/2 { sib''16 la sol la[sol fa] sol fa mib fa[mib re] mib re do re[do sib] }
  la4 re'2 do4~\mbreak

  %19
  do sib2 la4~
  la sol2 fa4~
  fa r r16 fa fa sib sib re re fa
  fa4 r r16 fa, fa sib sib re re fa

  %23
  fa re do sib la8.\tr sib16 fa' re do sib la8.\tr sib16
  fa' re do sib la8.\tr sib16 sib4 r
  R1*17

  %42
  r4 la2 sol4~\mbreak
  sol fa2 mi4
  fa r r16 do do fa fa la la do

  %45
  do4 r r16 do, do fa fa la la do
  do la sol fa mi8.\tr fa16 fa4 r
  R1

  %48
  r2 fa16[(la32 sol fa16) la] do,[(la'32 sol fa16) la]
  do,[(la'32 sol fa16) la] do,[(la'32 sol fa16) la] do,[(sib'32 la sol16) sib] do,[(sib'32 la sol16) sib]
  do,[(sib'32 la sol16) sib] do,[(sib'32 la sol16) sib] \tuplet 3/2 { la(fa sol) la[(sol fa)] do fa sol la[sol fa]

  %51
  sib mi, fa sol[fa mi] do mi fa sol[fa mi] la re, mi fa[mi re] sib re mi fa[mi re]
  sol do, re mi[re do] sol do re mi[re do]} fa la, la do do fa fa la
  la4 r r2

  %54
  R1*3
  r4 r16 sib(la sol) fad(sol la fad) do(mib! re do)
  si(la si do) si(la' sol fa)\mbreak mi(fa sol mi) sib?(re do sib)

  %59
  la(sol la sib) la(sol' fa mi) re(dod re mi) re(la' sol fa)
  \senza \tuplet 3/2 { sib (la sol) la[(sol fa)] sol (fa mi) fa[(mi re)] dod (si la) } la' [re] mi,4\tr
  re r r2\mbreak

  %62  OK
  r r32 sol, la sib do re mi fa sol16 fa mi re
  mi8 do' sol mi do fa do la
  r2 r32 mib fa sol la sib do re mib16 re do sib\mbreak

  %65
  la8 fa' do la fa16 [sib, sib sib sib sib sib sib]
  lab4 r lab'16[lab, lab lab lab lab lab lab]
  sol4 r mib''16[mib, mib mib mib mib mib mib]

  %68
  re4 r re'16 [re, re re re re re re]
  do4 r do'16[do, do do do do do do]
  r4 r16 fa' re fa sib4 r16 sol mib sol\mbreak

  %71
  sib4 r16 fa re fa sib4 r16 sol mib sol
  do4 r16 sol mi sol do4 r16 la fa la
  do4 r16 sol mi sol do4 r16 la fa la

  %74
  re4 r16 la fad la re4 r16 sib sol sib
  re4 r16 la fad? la re4 r16 sib sol sib
  re4 r16 sib sol sib sib4 r16 sol mib sol

  %77
  la4 r16 la fa la la4 r16 fa re fa\mbreak
  sol4 r16 mib sib mib la4 r16 mib do mib
  sib'4 r16 fa re fa sib4 r16 fa do fa

  %80
  la4 r16 fa do fa re4 re~
  re do2 sib4~
  sib la2 sol4~

  %83
  sol fa2 r4
  r16 fa fa sib sib re re fa fa4 r
  r16 fa, fa sib sib re re fa fa8 mib fa[fa,]

  %86
  sib mib fa[fa,] sib sib fa'[fa,]
  sib1\fermata

}

Ivlan = \relative do' {

  re1~
  re~
  re~

  %4
  re~
  re~
  re~

  %7
  re~
  re\fermata
  sib'16 [sib, sib sib sib sib sib sib] lab4 r

  %10
  lab'16[lab, lab lab lab lab lab lab] sol4 r
  mib''16[mib, mib mib mib mib mib mib] re4 r
  re'16[re,re re re re re re] do4 r

  %13
  do'16[do, do do do do do do] sib4 r
  r2 mib'16[mib, mib mib mib mib mib mib]\mbreak
  mi4 r fa'16[fa, fa fa fa fa fa fa]

  %16
  fad4 r sol16[sol, sol sol sol sol sol sol]
  sol4 r r2
  la'8 la fa fa sol sol mib mib\mbreak

  %19
  fa fa re re mib mib do do
  re re sib sib do do la[la]
  fa re' re re re re re re

  %22
  re re re re re re re re
  re sol do, fa\mbreak re sol do, fa
  re sol do, fa re4 r

  %25
  R1*16
  r2 la'8 la la la
  mi mi do do re re sib sib\mbreak

  %43
  do do la la sib sib sol sol
  la la la la la la la la
  la la la la la la la la

  %46
  la re sol, do la4 r
  R1*5
  r2 do4. do8

  %53
  do4 r r2
  R1*7
  la8 la la la la la la la\mbreak

  %62
  la la la re re re re sol,
  sol sol sol do do do do fa
  fa fa fa sib, sib sib sib sib\mbreak

  %65
  do do do fa fa16 [sib, sib sib sib sib sib sib]
  lab4 r lab'16[lab, lab lab  lab lab lab lab]

  %67
  sol4 r mib''16[mib, mib mib mib mib mib mib]
  re4 r re'16[re, re re re re re re]
  do4 r do'16[do, do do do do do do]

  %70
  sib8 sib sib sib mib, mib' mib mib,\mbreak
  sib' sib sib sib mib, mib' mib mib,
  do' do do do fa, fa' fa fa,

  %73
  do' do do do fa, fa' fa fa,
  re' re re re sol, sol' sol sol,
  re' re re re sol, sol' sol sol,

  %76
  sol sol sol sol do do' do do,
  fa, fa fa fa sib sib' sib sib,\mbreak
  mib mib mib mib mib mib mib mib

  %79
  re re sib sib fa fa' fa fa,
  fa fa' fa fa, sib sib' sib sib
  mib, mib mib mib re re re re

  %82
  do do do do sib sib sib sib
  la la la la\mbreak fa re' re re
  re re re re re re re re

  %85
  re re re re re sol do, fa
  re sol do, fa re re fa fa
  fa1\fermata

}

Ibcn = \relative do {

  sib1~
  sib~
  sib~

  %4
  sib~
  sib~
  sib~

  %7
  sib~
  sib\fermata
  sib'16 [sib, sib sib sib sib sib sib] lab4 r

  %10
  lab'16[lab, lab lab lab lab lab lab] sol4 r
  mib''16[mib, mib mib mib mib mib mib] re4 r
  re'16[re,re re re re re re] do4 r

  %13
  do'16[do, do do do do do do] sib4 r
  r2 mib'16[mib, mib mib mib mib mib mib]\mbreak
  mi4 r fa'16[fa, fa fa fa fa fa fa]

  %16
  fad4 r sol16[sol, sol sol sol sol sol sol]
  sol4 r r2
  fa'8 fa fa fa mib mib mib mib\mbreak

  %19
  re re re re do do do do
  sib sib sib sib la la la la
  sib sib sib sib sib sib sib sib

  %22
  sib sib sib sib sib sib sib sib
  sib mib fa [fa,] sib mib fa[fa,]
  sib mib fa[fa,] sib do re do

  %25
  sib do re la sib fa' re do
  sib do re la sib fa' re do
  sib do re sib fa' sol la fa

  %28
  sib, do re sib\mbreak fa' sol la fa
  re do re sib' mib, fa sol fa
  mi re mi do' fa, sol la fa

  %31
  re do re sib' mib, fa sol fa
  mi re mi do' fa, sol la fa
  do do do do\mbreak do do do do

  %34
  do do do do do do do do
  do re mi do fa fa, do''[do,]
  fa, fa' mi do fa fa, do''[do,]

  %37
  fa,4 r8 fa' do do do do
  do do do do\mbreak do do do do
  do do do do do re mi do

  %40
  fa fa, do''[do,] fa, fa' mi do
  fa fa, do''[do,] fa fa fa fa
  do do do do sib sib sib sib\mbreak %%% fine p.9

  %43  OOOOOKKK
  la la la la sol sol sol sol
  fa fa fa fa fa fa fa fa
  fa fa fa fa fa fa fa fa

  %46
  fa sib do do, fa fa' fa,4
  r8 fa' fa,4\mbreak r8 mi' mi,4
  r8 mi' mi,4 r8 fa' fa,4

  %49
  r8 fa' fa,4 r8 mi' mi,4
  r8 mi' mi,4 fa r\mbreak
  R1

  %52
  r2 fa'8 sol la sol
  fa la sol dod, re fad la fad
  sol re sol, si\mbreak do mi sol mi

  %55
  fa sol la dod, re mi fa re
  sol fa mi re la'8 fa16 re la'8 la,
  re fa sol dod, re fad la fad

  %58
  sol re sol, si\mbreak do mi sol mi
  fa re dod[la] re mi fa re
  sol fa mi re la' fa16 re la'8 la,

  %61
  re re re re dod dod dod dod\mbreak
  re re re re sol, sol sol sol
  do do do do fa fa fa fa

  %64
  sib, sib sib sib mib mib mib mib\mbreak
  la, la' la la sib16[sib, sib sib sib sib sib sib]
  lab4 r lab'16[lab, lab lab  lab lab lab lab]

  %67
  sol4 r mib''16[mib, mib mib mib mib mib mib]
  re4 r re'16[re, re re re re re re]
  do4 r do'16[do, do do do do do do]

  %70
  sib8 sib sib sib mib, mib' mib mib,\mbreak
  sib' sib sib sib mib, mib' mib mib,
  do' do do do fa, fa' fa fa,

  %73
  do' do do do fa, fa' fa fa,
  re' re re re sol, sol' sol sol,
  re' re re re sol, sol' sol sol,

  %76
  sol sol sol sol do do' do do,
  fa, fa fa fa sib sib' sib sib,\mbreak
  mib mib mib mib mib mib mib mib

  %79
  re re sib sib fa fa' fa fa,
  fa fa' fa fa, sib sib' sib sib
  mib, mib mib mib re re re re

  %82
  do do do do sib sib sib sib
  la la la la\mbreak sib sib sib sib
  sib sib sib sib sib sib sib sib

  %85
  sib sib sib sib sib mib fa [fa,]
  sib mib fa [fa,] sib sib fa' [fa,]
  sib1\fermata

}

Ibfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sib\major
  \time 4/4
  \tempo 2 = 52
  s1*87
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

IvlIII = {
  \Iglobal
  <<\IvlIIIn \forma>>

}

IvlIV = {
  \Iglobal
  <<\IvlIVn \forma>>

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
  \senza
}

IIvlIn = \relative do'' {

  la'8
  la sol16 fa la8 sol16 fa fa8\tr[mi mi] r
  r2 r4 r8 la
  re do16 re la8 sib16 do sib4. sib8

  %4
  do8 sib16 do sol8 la16 sib la4. la8
  sib la16 sib fa8 sol16 la sol4. sol8\mbreak
  la8 sol16 la mi8 fa16 sol fa sol la sib dod,8.\tr re16

  %7
  re4 r r2
  R1*3
  r4 r16 la' sib do fad, fad sol la do, fad sol la

  %12
  sib8 sol r4 r16 sol la sib mi,4
  r16 fa sol la do,4 r2
  r4 r16 la dod mi\mbreak  sib'4~sib16 sib la sol

  %15
  fa la sol fa mi8.\tr re16 re4 r16 la re fa
  sib4. la16 sol la4. sol16 fa
  sol4. fa16 mi fa4~fa16 la sol fa

  %18
  fa8\tr mi r la la sol16 fa mi8.\tr re16\mbreak
  re4 r la'16 sib sib la la sol sol fa
  fa la sol fa mi8. re16 re4 r

  %21
  r16 la' sol fa mi8.\tr re16 re2\fermata

}

IIvlIIn = \relative do'' {

  fa8
  fa mi16 re fa8 mi16 re re8\tr[dod dod] r
  R1
  r4 r8 re sol fa16 sol re8 mi16 fa

  %4
  mi4. mi8 fa mi16 fa do8 re16 mib
  re4. re8 mi?8 re16 mi si8 dod16 re\mbreak
  dod4. dod8 re16 mi fa sol mi8.\tr re16

  %7
  re4 r r2
  R1*3
  r2 r16 la' sib do fad,4

  %12
  r2 r4 r16 do re mi
  fa?4 r16 fa sol la re,4 r
  r16 la dod mi sol4~\mbreak sol~sol16 sol fa mi

  %15
  re fa mi re dod8.\tr re16 re la re fa la4~
  la8 sol16 fa sol4~sol8 fa16 mi fa4~
  fa8 mi16 re mi4~mi8 re16 dod re fa mi re

  %18
  re8\tr dod r mi fa mi16 re dod8.\tr re16\mbreak
  re4 r fa16 sol sol fa fa mi mi re
  re fa mi re dod8. re16 re4 r

  %21
  r16 fa mi re dod8.\tr re16 re2\fermata

}

IIvlIIIn =  \relative do'' {

  r8
  r2 r4 r8 la'
  la sol16 fa la8 sol16 fa fa8\tr mi mi r
  R1*3

  %6
  r2 r4 r8 la
  fa mi16 re sib'8 la sold4. sold8
  la16 sold la4 do8 si16 la si4 re,8

  %9
  mi16 re mi4 do'8 si16 la si4 re,8
  mi16 re mi4 do'8\mbreak do si16 la sold8.\tr la16
  la la si do mi,4 r2

  %12
  r4 r16 sol la sib mi, mi fa sol sib, mi fa sol
  la8 fa r4 r16 sol la sib re,4
  R1*5

  %19
  la'16 sib sib la la sol sol fa fa4 r
  r2 r16 la sol fa mi8. re16
  re la' sol fa mi8.\tr re16 re2\fermata

}

IIvlIVn =  \relative do'' {

  r8
  r2 r4 r8 mi
  fa mi16 re fa8 mi16 re re8\tr dod dod r
  R1*4

  %7
  r4 r8 re si la16 sold mi'8 re
  do16 si do4 la'8 sold16 fad sold4 si,8
  do16 si do4 la'8 sold16 fad? sold4 si,8

  %10
  do16 si do4 mi8\mbreak mi re16 do si8.\tr la16
  la4 r r r16 la sib do
  re sol la sib re,4 r2

  %13
  r r4 r16 sol la sib
  dod,4 r\mbreak r2
  R1*4

  %19
  fa16 sol sol fa fa mi  mi re re4 r
  r2 r16 fa mi re dod8. re16
  re fa mi re dod8.\tr re16 re2\fermata

}

IIvlan = \relative do' {

  la'8
  la la la la la la la la
  la la la la la la la la
  la la fad fad re re sol sol

  %4
  sol sol mi mi do do fa fa
  fa fa re re si si mi mi\mbreak
  mi mi dod dod la si' mi, la

  %7
  fa fa fa fa mi mi mi mi
  mi mi mi mi mi mi mi mi
  mi mi mi mi mi mi mi mi

  %10
  mi mi mi mi mi fa si,[mi]
  do do do do la la la re
  re re re sol, sol sol sol do

  %13
  do do do fa sol sol sol sol
  mi mi mi mi\mbreak mi mi mi dod
  la sib' mi, la fa fa fa fa

  %16
  re re mi mi do do re re
  sib sol' dod,[dod] la la si si
  la la la' la la sib mi, la\mbreak

  %19
  fa fa fa dod fa fa fa dod
  fa sib mi, la fa sib mi, la
  fa sib mi, la fa2\fermata

}

IIbcn = \relative do {

  re8
  re re re re la' la, la la
  re re re re la' la, la la'
  fad fad fad fad sol sol sol sol

  %4
  do, do do do fa? fa fa fa
  sib sib sib sib mi, mi mi mi\mbreak
  la la la, la re sol, la la

  %7
  re re re re mi mi mi mi
  la, la la la mi' mi mi mi
  la, la la la mi' mi mi mi

  %10
  la, la la la\mbreak la re mi[mi,]
  la la la la re re re re
  sol, sol sol sol do do do do

  %13
  fa fa fa fa sib, sib sib sib
  la la la la\mbreak dod dod dod dod
  re sol la la, re re fa fa

  %16
  sol sol mi mi fa fa re re
  mi mi dod dod re re sold, sold
  la la dod dod re sol la la,\mbreak

  %19
  re re re la re re re la
  re sol la la, re sol la la,
  re sol la la, re,2\fermata

}

IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 4/4
  \tempo 4 = 40
  \partial 8 s8
  s1*21
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

IIvlIII = {
  \IIglobal
  <<\IIvlIIIn \forma>>

}

IIvlIV = {
  \IIglobal
  <<\IIvlIVn \forma>>

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
  \senza
}

IIIvlIn = \relative do'' {

  r8 r16 sib [sib8. fa16 fa8. sib,16]
  sib8.[sib'16 sib8.  re16 re8. do16]
  do8.[la16 la8. fa16 fa8. la,16]

  %4
  la8.[do'16 do8. mib16 mib8. re16]
  re8.[sib16 sib8. fa16] fa8. sib,16
  sib8.[re'16 re8. fa16 fa8. re16]

  %7
  do4 fa, r
  sib8. do32 sib sib'8 sib, sib' sib,
  sib8. do32 sib sib'8 sib, sib' sib,\mbreak

  %10
  sol'8 sib,(mib sol sib4)~
  sib8 sib,(mib sol sib4)
  do,8. re32 do do'8 do, do' do,

  %13
  do8. re32 do do'8 do, do' do,
  la' do,(fa la do4)
  do8 do,(fa la do4)

  %16
  re,8. mib32 re re'8 re, re' re,
  re8. mib32 re re'8 re, re' re,
  sib' \once\slurDashed re, (sol sib re4)~\mbreak

  %19
  re8 re,(sol sib re4)
  re,8. mib32 re sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,

  %22
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,

  %25
  la8. sib32 la sol'8 la, sol' la,
  la8. sib32 la fa'8 la, fa' la,
  re16 sib re fa sib sib, re fa sib sib, re fa\mbreak

  %28
  sib8 fa4 re do16 sib
  fa' sib, re fa sib sib, re fa sib sib, re fa
  sib8 re, sib do mib, fa

  %31
  sib, re' sib do mib, fa
  sib,8.\solo \once\stemDown \override Slur.outside-staff-priority = #400 re'16 (re4\tr~re8 [do16 re)]
  mib8. mib16(mib4\tr~mib8 re16 mib)

  %34
  fa8. sib16(sib4\tr~sib8 la16 sib)
  do8. do16(do4\tr~do8 sib16 do)\revert Slur.outside-staff-priority
  re4 sib r\mbreak

  %37
  sib,16 fa re' sib fa' re sib' fa re sib lab' fa
  sol8 sib, mib sol mib r
  do16 sol mi' do sol' mi do' sol mi do sib' sol

  %40
  la8 do, fa la fa r
  re16 sib fad' re la' fad re' la fad re do' la
  sib8 re, sol sib sol r\mbreak

  %43
  sib16(la sib) re sib(la sib) re sib(la sib) re
  la4(dod re)
  la16 (sib la) re la(sib la) re la(sib la) re

  %46
  sol,4(si do)
  sol16(la sol) do sol(la sol) do sol(la sol) do
  fad,4. fad8(la re)

  %49
  do4. fad,8(la re)
  do4. fad,8(la  do)\mbreak
  \stemDown sib8 \once \stemUp re,, la'' \once \stemUp re,, sib'' \once\stemUp re,,

  %52
  \stemDown do''8 \once \stemUp re,, sib'' \once \stemUp re,, la'' \once\stemUp re,,
  \stemDown sib''8 \once \stemUp re,, do'' \once \stemUp re,, re'' \once\stemUp re,,
  \stemNeutral do''4. sib16 la sib8 la16 sol

  %55
  la4. sol16 fad sol8 fad16 mi
  re4. do16 sib la8 sol16 fad
  sol8.[sol16 sol8. re16 re8. sol,16]

  %58
  sol8.[sol'16 sol8. sib16 sib8. la16]\mbreak
  la8.[fad16 fad8. re16 re8. la16]
  la8.[la'16 la8. do16 do8. sib16]

  %61
  sib8.[sol16 sol8. re16 re8. sol,16]
  sol8.[sib'16 sib8. re16 re8. sib16]
  la8[re,] re' re, re' re,

  %64
  re8. [mi32 re] re'8 re, re' re,
  sib' sol sib re sol4
  r8 sol, sib re sol4

  %67
  re,8. [mi?32 re] re'8 re, re' re,\mbreak
  re8. [mi?32 re] re'8 re, re' re,
  sib'8. do32 sib sol'8 sib, sol' sib,

  %70
  la8. sib32 la sol'8 la, sol' la,
  la8. sib32 la fad'8 la, fad' la,
  sib re sol sib, la fad'

  %73
  sol4 r r
  R2.*21
  re8. mi32 re sib'8 re, sib' re,

  %96
  dod8. re32 dod sib'8 dod, sib' dod,
  do!8. re32 do la'8 do, la' do,
  si8. do32 si la'8 si, la' si,

  %99
  sib!8. do32 sib sol'8 sib, sol' sib,
  la mi' dod re sol, la\mbreak
  \once\stemUp re, mi' dod re sol, la

  %102
  re, fa la re fa re
  fa,la re fa la fa
  la, re fa la re la

  %105
  re,2.\tr~
  re~
  re

  %108
  re'8[do16 sib la sol fa mi] re8 la
  sib sol sib re sol4\mbreak
  do8[sib16 la sol fa mi? re] do8 sol

  %111
  la fa la do fa4
  sib8[la16 sol fa mib? re do] sib8 fa
  sol mib sol sib mib4

  %114
  la8[sol16 fa mib re do sib] la8 fa
  re'8 sib fa' re sib' fa
  sib re, do4.\tr sib8

  %117
  sib4 r r
  R2.*8
  re8. mib32 re sib'8 re, sib' re,

  %127
  do8. re32 do sib'8 do, sib' do,\mbreak
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,

  %130
  sib8. do32 sib sol'8 sib, sol' sib,
  la fa do' la mib' do
  re re sib do mib, fa

  %133
  sib, re' sib do mib, fa
  sib, do16 re mib fa sol la sib do re mib
  fa mib re do sib la sol fa mib re do sib

  %136
  do8 re16 mib fa sol la sib do re mib fa\mbreak
  sol fa mib re do sib la sol fa mib re do
  re8 mib16 fa sol la sib do re mib fa sol

  %139
  la sol fa mib re do sib la sol fa mib re
  mib8 fa16 sol la sib do re mib fa sol la
  sib la sol fa mib re do sib la sol fa mib

  %142
  re4 r r
  re'16 fa sib re re, fa sib re re, fa sib re
  re, fa sib re re, fa sib re re, fa sib re\mbreak

  %145
  re,8 sib' la4. sib8
  sib4 r r
  R2.*11

  %158
  re,8. mib32 re sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,\mbreak
  do8. re32 do la'8 do, la' do,

  %161
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,
  la fa do' la mib' do

  %164
  re sib re sib fa' re
  sib' re, sib do  mib, [fa]
  sib, re' sib do mib,[fa]

  %167
  sib,2.\fermata

}

IIIvlIIn = \relative do'' {

  r8 r16 sib [sib8. fa16 fa8. sib,16]
  sib8.[sib'16 sib8.  re16 re8. do16]
  do8.[la16 la8. fa16 fa8. la,16]

  %4
  la8.[do'16 do8. mib16 mib8. re16]
  re8.[sib16 sib8. fa16] fa8. sib,16
  sib8.[re'16 re8. fa16 fa8. re16]

  %7
  do4 fa, r
  sib8. do32 sib sib'8 sib, sib' sib,
  sib8. do32 sib sib'8 sib, sib' sib,\mbreak

  %10
  sol'8 sib,(mib sol sib4)~
  sib8 sib,(mib sol sib4)
  do,8. re32 do do'8 do, do' do,

  %13
  do8. re32 do do'8 do, do' do,
  la' do,(fa la do4)
  do8 do,(fa la do4)

  %16
  re,8. mib32 re re'8 re, re' re,
  re8. mib32 re re'8 re, re' re,
  sib' \once\slurDashed re, (sol sib re4)~\mbreak

  %19
  re8 re,(sol sib re4)
  re,8. mib32 re sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,

  %22
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,

  %25
  la8. sib32 la sol'8 la, sol' la,
  la8. sib32 la fa'8 la, fa' la,
  re16 sib re fa sib sib, re fa sib sib, re fa\mbreak

  %28
  sib8 fa4 re do16 sib
  fa' sib, re fa sib sib, re fa sib sib, re fa
  sib8 re, sib do mib, fa

  %31
  sib, re' sib do mib, fa
  \override Slur.outside-staff-priority = #400 sib,8. sib'16(sib4\tr~sib8 la16 sib)
  do8. do16(do4\tr~do8 sib16 do)

  %34
  re8. re16 (re4\tr~re8 [do16 re)]
  mib8. mib16(mib4\tr~mib8 re16 mib)
  \revert Slur.outside-staff-priority fa4 re r\mbreak

  %37
  R2.
  mib,16 sib sol' mib sib' sol mib' sib sol mib re' sib
  do8 sol do mi do r

  %40
  fa,16 la, la' fa do' la fa' do la fa mib' do
  re8 la re  fad re r
  sol,16 re sib' sol re' sib sol' re sib sol sol' re\mbreak

  %43
  sol(fad sol) sib sol(fad sol) sib sol(fad sol) sib
  fad2.
  fa!16(sol fa) la fa(sol fa) la fa(sol fa) la

  %46
  mi2.
  \slurDashed mib!16 (re mib) sol mib (re mib) sol mib (re mib) sol
  re4. re8(fad la)

  %49
  la4. re,8(fad la)
  la4. re,8(fad la)\mbreak %%%%% fine pag 30
  \stemDown sol8 \once \stemUp re, fad' \once \stemUp re, sol' \once\stemUp re,

  %52
  \stemDown la''8 \once \stemUp re,, sol' \once \stemUp re, fad' \once\stemUp re,
  \stemDown sol'8 \once \stemUp re, la'' \once \stemUp re,, sib'' \once\stemUp re,,
  \stemNeutral la''4. sol16 fad sol8 fad16 mi

  %55
  fad4. mi16 re sib'8 la16 sol
  fad4. mi16 re do8 sib16 la
  sol8.[sol16 sol8. re16 re8. sol,16]

  %58
  sol8.[sol'16 sol8. sib16 sib8. la16]\mbreak
  la8.[fad16 fad8. re16 re8. la16]
  la8.[la'16 la8. do16 do8. sib16]

  %61
  sib8.[sol16 sol8. re16 re8. sol,16]
  sol8.[sib'16 sib8. re16 re8. sib16]
  la8[re,] re' re, re' re,

  %64
  re8. [mi32 re] re'8 re, re' re,
  sib' sol sib re sol4
  r8 sol, sib re sol4

  %67
  re,8. [mi?32 re] re'8 re, re' re,\mbreak
  re8. [mi?32 re] re'8 re, re' re,
  sib'8. do32 sib sol'8 sib, sol' sib,

  %70
  la8. sib32 la sol'8 la, sol' la,
  la8. sib32 la fad'8 la, fad' la,
  sib re sol sib, la fad'

  %73
  sol4 r r
  R2.*21
  re8. mi32 re sib'8 re, sib' re,

  %96
  dod8. re32 dod sib'8 dod, sib' dod,
  do!8. re32 do la'8 do, la' do,
  si8. do32 si la'8 si, la' si,

  %99
  sib!8. do32 sib sol'8 sib, sol' sib,
  la mi' dod re sol, la\mbreak
  \once\stemUp re, mi' dod re sol, la

  %102
  re,4 r r
  re8 fa la re fa re
  fa,la re fa la fa

  %105
  la, re fa la re la
  fa2.\tr~
  fa~

  %108
  fa4 r r
  sol8[fa16 mib re do sib la] sol8 re\mbreak
  mib do mib sol do4

  %111
  fa8[mib16 re do sib la sol] fa8 do
  re sib re fa sib4
  mib8[re16 do sib la sol fa] mib8 sib

  %114
  do la do fa la4
  sib8 fa re' sib fa' re
  fa8 sib, la4.\tr sib8

  %117
  sib4 r r
  R2.*8
  re8. mib32 re sib'8 re, sib' re,

  %127
  do8. re32 do sib'8 do, sib' do,\mbreak
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,

  %130
  sib8. do32 sib sol'8 sib, sol' sib,
  la fa do' la mib' do
  re re sib do mib, fa

  %133
  sib, re' sib do mib, fa
  sib,4 r r
  R2.

  %136
  la8 sib16 do re mib fa sol la sib do re\mbreak
  mib re do sib la sol fa mib re do sib la
  sib8 do16 re mib fa sol la sib do re mib

  %139
  fa mib re do sib la sol fa mib re do sib
  do8 re16 mib fa sol la sib do re mib fa
  sol fa mib re do sib la sol fa mib re do

  %142
  sib4 r r
  re'16 fa sib re re, fa sib re re, fa sib re
  re, fa sib re re, fa sib re re, fa sib re\mbreak

  %145
  fa,8 sib, do4. sib8
  sib4 r r
  R2.*11

  %158
  re8. mib32 re sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,\mbreak
  do8. re32 do la'8 do, la' do,

  %161
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,
  la fa do' la mib' do

  %164
  re sib re sib fa' re
  sib' re, sib do  mib, [fa]
  sib, re' sib do mib,[fa]

  %167
  sib,2.\fermata

}

IIIvlIIIn =  \relative do'' {

  r8 r16 sib [sib8. fa16 fa8. sib,16]
  sib8.[sib'16 sib8.  re16 re8. do16]
  do8.[la16 la8. fa16 fa8. la,16]

  %4
  la8.[do'16 do8. mib16 mib8. re16]
  re8.[sib16 sib8. fa16] fa8. sib,16
  sib8.[re'16 re8. fa16 fa8. re16]

  %7
  do4 fa, r
  R2.*2\mbreak
  mib8. fa32 mib mib'8 mib, mib' mib,

  %11
  mib8. fa32 mib mib'8 mib, mib' mib,
  do' sol(do mi sol4)~
  sol8 sol,(do mi sol4)

  %14
  fa,8. sol32 fa fa'8 fa, fa' fa,
  fa8. sol32 fa fa'8 fa, fa' fa,
  re'8 la(re fad la4)~

  %17
  la8 la,(re fad la4)
  sol,8. la32 sol sol'8 sol, sol' sol,\mbreak
  sol8. la32 sol sol'8 sol, sol' sol,

  %20
  re'8. mib32 re sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,

  %22
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,

  %25
  la8. sib32 la sol'8 la, sol' la,
  la8. sib32 la fa'8 la, fa' la,
  re16 sib re fa sib sib, re fa sib sib, re fa\mbreak

  %28
  sib8 fa4 re do16 sib
  fa' sib, re fa sib sib, re fa sib sib, re fa
  sib8 re, sib do mib, fa

  %31
  sib, re' sib do mib, fa
  sib,4 r r
  R2.*15

  %48
  la''16(sib la) re la(sib la) re la(sib la) re
  fad,(sol fad) la fad(sol fad) la fad(sol fad) la
  la,(sib la) re la(sib la) re la(sib la) re\mbreak

  %51
  <<sib4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r r
  R2.*5
  sol'8.[sol16 sol8. re16 re8. sol,16]

  %58
  sol8.[sol'16 sol8. sib16 sib8. la16]\mbreak
  la8.[fad16 fad8. re16 re8. la16]
  la8.[la'16 la8. do16 do8. sib16]

  %61
  sib8.[sol16 sol8. re16 re8. sol,16]
  sol8.[sib'16 sib8. re16 re8. sib16]
  la8[re,] r4 r

  %64
  R2.
  sol,8. la32 sol sol'8 sol, sol' sol,
  sol8. la32 sol sol'8 sol, sol' sol,

  %67
  fad' re fad la re4\mbreak
  r8 re, fad la re4
  sib8. do32 sib sol'8 sib, sol' sib,

  %70
  la8. sib32 la sol'8 la, sol' la,
  la8. sib32 la fad'8 la, fad' la,
  sib re sol sib, la fad'

  %73
  re,16 (sib' sol'8) sol4.\tr(fad16 sol)
  re,16(re' la'8) la4.\tr(sol16 la)
  re,,16(re' sib'8) sib4.\tr(la16 sib)

  %76
  re,,(re' do'8) do4.\tr(sib16 la)\mbreak
  sol,16(re' sib'8) re4.\tr(do16 sib)
  do,,(sol' mib'8) sol4.(fa16 mib)

  %79
  fa,(do' la'8) do4.(sib16 la)
  sib,,(fa' re'8) fa4.(mib16 re)
  mib,(sib' sol'8) sib4.(la16 sol)

  %82
  la,,(fad' do'8) mib4.(re16 do)
  sib sol' sib sol sib, sol' sib sol sib, sol' sib sol
  dod, sol' sib sol dod, sol' sib sol dod, sol' sib sol\mbreak

  %85
  re, re' fa re re, re' fa re re, re' fa re
  sol,, sol' sib sol sol, sol' sib sol sol, sol' sib sol
  re''4. do16[(sib) la(sol) fa(mi)]

  %88
  fa8 mi16 re mi2\tr
  re4 r r
  R2.*5

  %95
  re8. mi32 re sib'8 re, sib' re,
  dod8. re32 dod sib'8 dod, sib' dod,
  do!8. re32 do la'8 do, la' do,

  %98
  si8. do32 si la'8 si, la' si,
  sib!8. do32 sib sol'8 sib, sol' sib,
  la mi' dod re sol, la\mbreak

  %101
  \once\stemUp re, mi' dod re sol, la
  re,4 r r
  R2.

  %104
  re8 fa la re fa re
  fa, la re fa la fa
  la, re fa la re la

  %107
  la2.~
  la4 r r
  R2.*8

  %117
  re8[do16 sib la sol fa mi] re8 la
  sib sol sib re sol4\mbreak
  do8[sib16 la sol fa  mib re] do8 sol

  %120
  la fa la do fa4
  sib8[la16 sol fa  mib re do] sib8 fa
  sol mib sol sib mib4

  %123
  la8[sol16 fa mib re do sib] la8 fa
  re' sib fa' re sib' fa
  sib re, do4.\tr sib8

  %126
  sib4 sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,\mbreak
  do8. re32 do la'8 do, la' do,

  %129
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,
  la fa do' la mib' do

  %132
  re re sib do mib, fa
  sib, re' sib do mib, fa
  sib,4 r r

  %135
  R2.*11
  sib8 do16 re mib [fa sol la sib do re mib]
  fa mib re do sib la sol fa mib re do sib

  %148
  do8[re16 mib fa sol la sib do re  mib fa]
  sol fa mib re do sib la sol fa mib re do
  re8 mib16 fa sol la sib do re mib fa sol

  %151
  la[sol fa mib re do sib la] sol fa mib re
  mib8 fa16 sol la sib do re mib fa sol la\mbreak
  sib la sol fa mib re do sib la sol fa mib

  %154
  re4 r r
  re'16 fa sib re re, fa sib re re, fa sib re
  re, fa sib re re, fa sib re re, fa sib re

  %157
  re,8 sib' la4.\tr sib8
  sib4 sib8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,\mbreak

  %160
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,

  %163
  la fa do' la mib' do
  re sib re sib fa' re
  sib' re, sib do  mib, [fa]

  %166
  sib, re' sib do mib,[fa]
  sib,2.\fermata

}

IIIvlIVn =  \relative do'' {

  r8 r16 sib [sib8. fa16 fa8. sib,16]
  sib8.[sib'16 sib8.  re16 re8. do16]
  do8.[la16 la8. fa16 fa8. la,16]

  %4
  la8.[do'16 do8. mib16 mib8. re16]
  re8.[sib16 sib8. fa16] fa8. sib,16
  sib8.[re'16 re8. fa16 fa8. re16]

  %7
  do4 fa, r
  R2.*2\mbreak
  mib8. fa32 mib mib'8 mib, mib' mib,

  %11
  mib8. fa32 mib mib'8 mib, mib' mib,
  do' sol(do mi sol4)~
  sol8 sol,(do mi sol4)

  %14
  fa,8. sol32 fa fa'8 fa, fa' fa,
  fa8. sol32 fa fa'8 fa, fa' fa,
  re'8 la(re fad la4)~

  %17
  la8 la,(re fad la4)
  sol,8. la32 sol sol'8 sol, sol' sol,\mbreak
  sol8. la32 sol sol'8 sol, sol' sol,

  %20
  re'8. mib32 re sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,

  %22
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,

  %25
  la8. sib32 la sol'8 la, sol' la,
  la8. sib32 la fa'8 la, fa' la,
  re16 sib re fa sib sib, re fa sib sib, re fa\mbreak

  %28
  sib8 fa4 re do16 sib
  fa' sib, re fa sib sib, re fa sib sib, re fa
  sib8 re, sib do mib, fa

  %31
  sib, re' sib do mib, fa
  sib,4 r r
  R2.*15

  %48
  fad''16(sol fad) la fad(sol fad) la fad(sol fad) la
  re,(mi re) fad re(mi re) fad re(mi re) fad
  fad,(sol fad) la fad(sol fad) la fad(sol fad) la\mbreak

  %51
  <<sib4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r r
  R2.*5
  sol'8.[sol16 sol8. re16 re8. sol,16]

  %58
  sol8.[sol'16 sol8. sib16 sib8. la16]\mbreak
  la8.[fad16 fad8. re16 re8. la16]
  la8.[la'16 la8. do16 do8. sib16]

  %61
  sib8.[sol16 sol8. re16 re8. sol,16]
  sol8.[sib'16 sib8. re16 re8. sib16]
  la8[re,] r4 r

  %64
  R2.
  sol,8. la32 sol sol'8 sol, sol' sol,
  sol8. la32 sol sol'8 sol, sol' sol,

  %67
  fad' re fad la re4\mbreak
  r8 re, fad la re4
  sib8. do32 sib sol'8 sib, sol' sib,

  %70
  la8. sib32 la sol'8 la, sol' la,
  la8. sib32 la fad'8 la, fad' la,
  sib re sol sib, la fad'

  %73
  sol4 r r
  re,16(la' fad'8) fad4.\tr(mi16 fad)
  re,(sib' sol'8) sol4.\tr(fad16 sol)

  %76
  \once\slurDashed re,(la' la'8) la4.\tr(sol16 fad)\mbreak
  re,(sib' sol'8) sib4.(la16 sol)
  sol,,(mib' do'8) mib4.(re16 do)

  %79
  fa,(do' fa8) la4.(sol16 fa)
  sib,,(fa' sib8) re4.(do16 sib)
  sol,(mib' mib'8) sol4.(fa16 mib)

  %82
  la,,(re la'8) do4.(sib16 la)
  sol4 r r
  R2.*5

  %89
  re16 fa' la fa re, fa' la fa re, fa' la fa
  dod sol' sib sol dod, sol' sib sol dod, sol' sib sol
  re, re' fa re re, re' fa re re, re' fa re\mbreak

  %92
  sol,, sol' sib sol sol, sol' sib sol sol, sol' sib sol
  re''4. do16(sib) la(sol) fa(mi)
  fa8 mi16 re mi2\tr

  %95
  re8. mi32 re sib'8 re, sib' re,
  dod8. re32 dod sib'8 dod, sib' dod,
  do!8. re32 do la'8 do, la' do,

  %98
  si8. do32 si la'8 si, la' si,
  sib!8. do32 sib sol'8 sib, sol' sib,
  la mi' dod re sol, la\mbreak

  %101
  \once\stemUp re, mi' dod re sol, la
  re,4 r r
  R2.*2

  %105
  re8 fa la re fa re
  fa, la re fa la fa
  la, re fa la re la

  %108
  re,4\tr r r
  R2.*9
  sol8[fa16 mib re do sib la] sol8 re\mbreak

  %119
  mib do mib sol do4
  fa8[mib16 re do sib la sol] fa8 do
  re sib re fa sib4

  %122
  mib8[re16 do sib la sol fa] mib8 la,
  do la do fa la4
  sib8 fa re' sib fa' re

  %125
  fa sib, la4.\tr sib8\mbreak
  sib4 sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,\mbreak

  %128
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,

  %131
  la fa do' la mib' do
  re re sib do mib, fa
  sib, re' sib do mib, fa

  %134
  sib,4 r r
  R2.*13
  la8[sib16 do re mib fa sol la sib do re]

  %149
  mib re do sib la sol fa mib re do sib la
  sib8 do16 re mib fa sol la sib do re mib
  fa mib re do sib la sol fa mib re do sib

  %152
  do8 re16 mib fa sol la sib do re mib fa\mbreak
  sol fa mib re do sib la sol fa mib re do
  sib4 r r

  %155
  sib'16 re fa sib sib, re fa sib sib, re fa sib
  sib, re fa sib sib, re fa sib sib, re fa sib
  fa8 sib, do4.\tr sib8

  %158
  sib4 sib'8 re, sib' re,
  do8. re32 do sib'8 do, sib' do,\mbreak

  %160
  do8. re32 do la'8 do, la' do,
  sib8. do32 sib la'8 sib, la' sib,
  sib8. do32 sib sol'8 sib, sol' sib,

  %163
  la fa do' la mib' do
  re sib re sib fa' re
  sib' re, sib do  mib, [fa]

  %166
  sib, re' sib do mib,[fa]
  sib,2.\fermata

}

IIIvlan = \relative do' {

  fa4 fa fa
  fa fa fa
  fa fa fa

  %4
  fa fa fa
  fa fa fa
  fa fa fa

  %7
  la8.[la16 fa8. fa16 do8. do16]
  re4 re8 mib fa mib
  re4 re8 mib fa re\mbreak

  %10
  sib4 sib sib
  sol sib sib
  do mi mi

  %13
  mi? mi mi
  do do do
  do do do

  %16
  la fad' fad
  fad? fad fad
  re re re\mbreak

  %19
  sib sib sib
  sib sib'8 la sol fa
  sol4 sol sol

  %22
  la la8 sol fa mib
  fa4 fa fa
  sol sol8 fa mi sol

  %25
  do,4 do do
  do la'8 sol fa mib
  fa4 fa fa\mbreak

  %28
  fa fa fa
  re re re
  re8 re' sib do mib, fa

  %31
  sib, re' sib do mib, fa
  sib,4 r r
  R2.*24

  %57
  re4 re re
  re re re
  re re re

  %60
  re re re
  re re re
  re re re

  %63
  fad fad8 sol la sol
  fad4 fad8 sol la fad
  sib,4 sib8 do re do

  %66
  sib4 sib8 do re sib
  la4 fad'8 sol la sol\mbreak
  la,4 fad'8 sol la fad

  %69
  re4 re re
  mib! mib mib
  re re re

  %72
  re re re
  sib r r
  R2.*21

  %95
  re'4 re re
  dod dod dod
  do! do do

  %98
  si si si
  sib! sib sib
  la8 mi' dod re sol, la\mbreak

  %101
  re, mi' dod re sol, la
  re,4 r r
  R2.*23

  %126
  fa4 fa fa
  sol sol sol
  la4 la8 sol fa mib

  %129
  fa4 fa fa
  sol sol8 fa mi sol
  do,4 do do

  %132
  fa8 re' sib do mib, fa
  sib, re' sib do mib, fa
  sib,4 r r

  %135
  R2.*23
  fa'4 re8 mib fa re
  sol4 sol sol

  %160
  la la8 sol fa mib\mbreak
  fa4 fa fa
  sol sol8 fa mi sol

  %163
  do,4 do do
  fa fa fa
  fa8 re' sib do mib, fa

  %166
  sib, re' sib do mib, fa
  sib,2.\fermata

}

IIIbcn = \relative do {

  sib4 sib sib
  sib sib sib
  la la la

  %4
  la la la
  sib sib sib
  sib sib sib

  %7
  fa'8.[fa16 do8. do16 la8. la16]
  sib4 sib8 do re do
  sib4 sib8 do re sib\mbreak

  %10
  mib4 mib8 fa sol fa
  mib4 mib8 fa sol fa
  mi4 do8 re mi re

  %13
  do4 do8 re mi do
  fa4 fa8 sol la sol
  fa4 fa8 sol la sol

  %16
  fad4 re8 mi fad mi
  re4 re8 mi fad re
  sol4 sol8 la sib la\mbreak

  %19
  sol4 sol8 la sib la
  sol4 sol8 fa mib re
  mib4 mib mib

  %22
  fa fa8 mib re do
  re4 re re
  mi mi8 re do mi

  %25
  fa4 fa fa
  fa fa8 mib re do
  sib4 sib sib\mbreak

  %28
  sib sib sib
  sib sib sib
  sib8 re' sib do mib, fa

  %31
  sib, re' sib do mib, fa
  sib,4 r re
  do sib la

  %34
  re do sib
  mib re do
  sib8.[sib16 re8. re16 fa8. fa16]\mbreak

  %37
  sib,4 r r
  mib r r
  mi r r

  %40
  fa r r
  fad r r
  sol r r\mbreak

  %43
  R2.*5
  re2.~
  re~

  %50
  re~
  re~
  re~

  %53
  re~
  re8 re' re,2~
  re8 re' re,2~

  %56
  re8 re' re,4 re,
  sol' sol sol
  sol sol sol\mbreak

  %59
  fad fad fad
  fad? fad fad
  sol sol sol

  %62
  sol sol sol
  re re8 mi fad mi
  re4 re8 mi fad re

  %65
  sol,4 sol8 la sib la
  sol4 sol8 la sib sol
  re'4 re8 mi fad mi\mbreak

  %68
  re4 re8 mi fad? re
  sol4 sol8 la sib sol
  do,4 do8 re mib? do

  %71
  re4 re8 mi fad re
  sol,4 re' re,
  sol2.

  %74
  re'
  sol,
  re'\mbreak

  %77
  sol,
  do
  fa

  %80
  sib,
  mib
  fad,

  %83
  sol4 sol sol
  la la la\mbreak
  re re re

  %86
  sol, sol sol'
  fa2 dod4
  re la' la,

  %89
  re re re
  la la la
  re re re\mbreak

  %92
  sol, sol sol'
  fa2 dod4
  re la' la,

  %95
  re' re re
  dod dod dod
  do! do do

  %98
  si si si
  sib! sib sib
  la8 mi' dod re sol, la\mbreak

  %101
  re, mi' dod re sol, la
  re,2.~
  re~

  %104
  re~
  re~
  re~

  %107
  \once\tieDashed re~
  re4. mi8 fa re
  sol4. la8 sib sol\mbreak

  %110
  do,4. do8 re mi
  fa,4. fa8 sol la
  sib4. sib8 do re

  %113
  mib,4. mib8 fa sol
  la4. la'8 fa mib
  re4 sib r

  %116
  sib fa' fa,
  sib4. re8 mib fa
  sol4. sol8 la sib\mbreak

  %119
  do,4. do8 re mi
  fa,4. fa8 sol la
  sib4. sib8 do re

  %122
  mib,4. mib8 fa sol
  la4. la'8 fa mib
  re4 \parenthesize sib r

  %125
  sol fa' fa,
  sib sib8 do re sib
  mib4 mib mib\mbreak

  %128
  fa4 fa8 mib re do
  re4 re re
  mi4 mi8 re do mi

  %131
  fa4 fa la,
  sib8 re' sib do mib, fa
  sib, re' sib do mib, fa

  %134
  sib,4 r r
  R2.
  fa'4 r r\mbreak

  %137
  R2.
  sib,4 r r
  R2.

  %140
  la4 r r
  R2.
  sib8. sib'16 fa8. fa16 re8. re16

  %143
  sib4 r r
  sib r r\mbreak
  sib fa' fa,

  %146
  sib r r
  R2.
  fa'4 r r

  %149
  R2.
  sib,4 r r
  R2.

  %152
  la4 r r\mbreak
  R2.
  sib8. sib'16 fa8.[fa16 re8. re16]

  %155
  sib4 r r
  sib r r
  sib fa' fa,

  %158
  sib sib8 do re sib
  mib4 mib mib
  fa fa8 mib re do\mbreak

  %161
  re4 re re
  mi mi8 re do mi
  fa4 fa la,

  %164
  sib sib sib
  sib8 re' sib do mib, fa
  sib, re' sib do mib, fa

  %167
  sib,2.\fermata

}

IIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sib\major
  \time 3/4
  \tempo 2. = 48
  s2.*167
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

IIIvlIII = {
  \IIIglobal
  <<\IIIvlIIIn \forma>>

}

IIIvlIV = {
  \IIIglobal
  <<\IIIvlIVn \forma>>

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
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

  systems-per-page = #3
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] All[egr]o"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new PianoStaff <<

        \new Staff <<
          \set Staff.instrumentName =  \markup \center-column{"[Violino I]"}
          \set Staff.midiInstrument = #"violin"
          \IvlI
        >>

        \new Staff <<
          \set Staff.instrumentName =  \markup \center-column{"[Violino II]"}
          \set Staff.midiInstrument = #"violin"
          \IvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino III]"}
          \IvlIII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
          \IvlIV
        >>
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.instrumentName = \markup \center-column{"[Viola]"}
        \Ivla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"cello"
        \set Staff.instrumentName = \markup \center-column{"[Basso]"}
        \Ibc

      >>
    >>

  }

  \layout {

    indent = 2\cm

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

\markup\huge "[2.] Largo"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new PianoStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlIII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlIV
        >>
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIvla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"cello"
        \IIbc

      >>
    >>

  }

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

\markup\huge "[3.] All[egr]o"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new PianoStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlIII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlIV
        >>
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIIvla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"cello"
        \IIIbc

      >>
    >>

  }

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



