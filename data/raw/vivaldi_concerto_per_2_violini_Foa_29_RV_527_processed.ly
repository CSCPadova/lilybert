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

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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
}

IvlIn =  \relative do'' {

   sib'8 fa re sib sib,[do16 re mib fa sol la]
   sib8[do16 re mib fa sol la] sib8 fa re sib
   fa' re sib fa re' sib fa re

   %4
   sib4 r r8 fa''8 fa fa
   sib16 la sol fa sib la sol fa sol8 sol sol sol\mbreak
   do16 sib la sol do sib la sol la8 la la la

   %7
   re16 do sib la re do sib la sib8 sib sib sib
   mib16 re do sib mib re do sib  la2
   sib do

   %10
   sib la4 r\fermata
   sib,16 re fa re fa,4  la16 do fa do fa,4\mbreak %%%%% ripresa
   sib16 re fa re fa,4 la16 do fa do fa,4
   lab'4. sol16 fa sol fa sol lab sib8 r
   mib,4. re16 do re do re mib fa8 r

   %15
   sib fa re sib re,[mib16 fa sol la sib do]
   re8 sib do la sib' fa re sib
   re, [mib16 fa sol la sib do]  re8 sib do la\mbreak

   %18
   sib4 r8 fa' sib16 fa re sib fa sib re fa
   sib fa re sib fa sib re fa sib do re sib do re mib do
   re mib fa re mib fa sol mib fa8 sib, r4

   %21
   R1*2
   sib,16 re fa sib sib, re fa sib la, do fa la la, do fa la\mbreak  %%% OK
   re, fa sib re re, fa sib re la[(sib do) sib la sol fa mib]

   %25
   re8 sib r4 r2
   R1
   r16 sib' re sib sib, sib' re sib sib, sib' re sib sib, sib' re sib

   %28
   <<{la8-.\p(la-. la-. la-.) la-.(la-. la-. la-.)}\\{fa fa fa fa fa fa fa fa}>>\mbreak
   do16\f do' mib do do, do' mib do do, do' mib do do, do' mib do
   <<{\slurDashed sib8\p-\parenthesize- . (sib-\parenthesize- . sib-\parenthesize- . sib-\parenthesize- .) sib8-\parenthesize- . (sib-\parenthesize- . sib-\parenthesize- . sib-\parenthesize- .)}\\{sol sol sol sol sol sol sol sol}>>

   %31
   re16_\markup {[\musicglyph #"f"]} re' fa re re, re' fa re\mbreak re, re' fa re re, re' fa re
   <<{\slurDashed dod8\p-\parenthesize- . (dod-\parenthesize- . dod-\parenthesize- . dod-\parenthesize- .) re8-\parenthesize- . (re-\parenthesize- . re-\parenthesize- . re-\parenthesize- .)}\\{la la la la la la la la}>>
   <<{dod8-\parenthesize- . (dod-\parenthesize- . dod-\parenthesize- . dod-\parenthesize- .) re8-\parenthesize- . (re-\parenthesize- . re-\parenthesize- . re-\parenthesize- .)}\\{la la la la la la la la}>>

   %34
   \slurSolid dod16_\markup {[\musicglyph #"f"]} re dod la, re' mi? re la, mi'' fa mi la,, fa'' sol fa la,,
   sol'' la sol la,, la'' sib la la,, r8 fa'16 sol la4~
   la8 fa16 sol la4~\mbreak la8 sol16 fa sol8 fa16 mi?

   %37
   re8\p fa16 sol la4~la8 fa16 sol la4~
   la8 sol16 fa sol8 fa16 mi? re8\tu la' fa re
   re,[mi16 fa sol la sib do] re8[mi16 fa sol la sib do]

   %40
   re8 la fa re la' fa re la
   fa' re la fa re4 r\mbreak
   r2 fa'4. mi?16 re

   %43
   la'4. sol16 fa mi mi la mi la,4
   re16 fa la fa la,4 dod16 mi la mi la,4
   re'8 la fa re fa,[sol16 la si dod re mi]

   %46
   fa8 re mi dod re16\solo la' fa la re, la' fa la
   re, la' fa la re, la' fa la\mbreak la, fa' re fa la, fa' re fa
   la, fa' re fa la, fa' re fa fa, re' la re fa, re' la re

   %49
   fa, re' la re fa, re' la re re,4 r
   r2 la''8 re4 fa8~
   fa16 mi(re) do(sib8) la sib2~

   %52
   sib sol8 do4 mi8~
   mi16 re(do)\once\slurDashed sib(la8) sol\mbreak la2~
   la fa8 sib4 re8 ~   %%%%%% inizio pagina 7

   %55
   re16 do(sib) la(sol8) fa mi16(do) do8\tr fa16(do) do8\tr
   sol'16(do,) do8\tr la'16(do,) do8\tr sib'16(do,) do8\tr la'16(do,) do8\tr
   sol'16(do,) do8\tr la'16(do,) do8\tr sib'16(do,) do8\tr la'16(do,) do8\tr

   %58
   sol'16 mi la fa sib sol do la\mbreak re sib mi do fa4~
   fa16 mi32 re do16 fa, sol8.\tr fa16 fa4\tu r4
   r8 fa fa fa sib16 la sol fa sib la sol fa

   %61
   sol8 sol sol sol do16 sib la sol do sib la sol
   sol2 la
   sib la\mbreak

   %64
   sol16[mi, fa sol la sib do re] mi8 do sol mi
   la' fa sol mi fa,16\solo la la do do fa fa la
   la fa fa do do la la fa mi sol sol do do mi mi sol

   %67
   sol mi mi do do sol sol mi fa la la do do fa fa la
   la fa fa do do la la fad\mbreak fad la la re re fad fad la
   la fad fad re re la la \parenthesize fad sol sib sib re re sol sol sib

   %70
   sib sol sol re re sib sib sol sol si si re re fa fa lab
   lab? fa fa re re si si sol sol do do mib mib sol sol do
   do sol sol mib mib do do sol lab do do fa fa lab lab do

   %73
   do lab lab fa fa do do la! la do do fad fad la? la do
   do la la fad fad do do la sol si si re re sol sol si
   sol, do do mib mib sol sol do sol, si si re re sol sol si

   %76
   do8\tu sol mib do do' sol mib do
   si'1\mbreak
   do

   %79
   do8 sol mib do mib,[fa16 sol la si do re]
   mib8 do re si do' sol mib do
   mib,[fa16 sol la si do re] mib8 do re si

   %82
   do\solo do' fa,, lab' sib, sib' mib,, sol'
   lab, lab' re,, fa' sol, sol' do,, mib'
   re16 si la? sol sol' fa mib re\mbreak mib4 r

   %85
   R1*2
   do'8 mib lab,, mib'' re, re' sol,, re''
   do, do' fa,, do'' sib, sib' mib,, sib''

   %89
   la, la' re,, la'' sol sib sol, sol'
   fad la re,, la'' sol sib sol, sol'
   fad\tu re la fad\mbreak sib'2

   %92
   sol8 mib do sol la'2
   fa8 re sib fa la'2
   sib8 fa re sib la4 r8 fa'

   %95
   sib16 fa re sib fa sib re fa sib fa re sib fa sib re fa
   la fa do la fa la do fa la fa do la fa la do fa\mbreak
   re8 sib  r4 r2

   %98
   R1
   sib'16[do re do sib la sol fa] mib8 mib4.\tr
   la16[sib do sib la sol fa mib] re8 re4.\tr

   %101
   sol16[la sib la sol fa mib re] do8 do4.\tr
   re16 sib fa' re sib' fa re sib\mbreak fa4 r
   sib16 re fa sib sib la sol fa do mib sol do do sib la sol

   %104
   re fa la re re do sib la mib sol sib mib mib re do sib
   la4~la8.(do16) sib4~\once\slurDashed sib8.(re16)
   do4~\once\slurDashed do8.(re16) sib4~\once\slurDashed sib8.(do16)

   %107
   sib(fa') fa(mib) mib(re) re(do)\mbreak re2~
   re16 fa fa mib mib re re do re2~
   re16 re do sib la8.\tr sib16 sib16 fa sib fa do' la do la

   %110
   re re do sib la8.\tr sib16 sib8[la16(sol fa mib re do)]
   sib16 re fa re fa,4 la16 do fa do fa,4\mbreak
   sib16 re fa re fa,4 la16 do fa do fa,4

   %113
   lab'4. sol16 fa sol fa sol lab sib8 r
   mib,4. re16 do re do re mib fa8 r
   sib fa re sib re,[mib16 fa sol la sib do]

   %116
   re8 sib do la sib' fa re sib
   re, [mib16 fa sol la sib do]  re8 sib do la\mbreak
   sib4\fermata r r2

}

IvlIIn = \relative do'' {

   sib'8 fa re sib sib,[do16 re mib fa sol la]
   sib8[do16 re mib fa sol la] sib8 fa re sib
   fa' re sib fa re' sib fa re

   %4
   sib4 r r8 fa''8 fa fa
   sib16 la sol fa sib la sol fa sol8 sol sol sol\mbreak
   do16 sib la sol do sib la sol la8 la la la

   %7
   re16 do sib la re do sib la sib8 sib sib sib
   mib16 re do sib mib re do sib  la2
   sib do

   %10
   sib la4 r\fermata
   sib,16 re fa re fa,4  la16 do fa do fa,4\mbreak %%%%% ripresa
   sib16 re fa re fa,4 la16 do fa do fa,4

   %13
   lab'4. sol16 fa sol fa sol lab sib8 r
   mib,4. re16 do re do re mib fa8 r
   sib fa re sib re,[mib16 fa sol la sib do]

   %16
   re8 sib do la sib' fa re sib
   re, [mib16 fa sol la sib do]  re8 sib do la\mbreak
   sib4 r r2

   %19
   R1
   r2 r4 r8 fa'
   sib16 fa re sib fa sib re fa sib fa re sib fa sib re fa

   %22
   sib do re sib do re mib do re mib fa re mib fa sol mib
   fa8 sib, r4 r2
   R1

   %25
   sib,16 re fa sib sib, re fa sib la, do fa la la, do fa la\mbreak  %%% OK
   re, fa sib re re, fa sib re la[(sib do) sib la sol fa mib]
   re8 sib r4 r2

   %28
   r16 fa' la fa fa, fa' la fa fa, fa' la fa fa, fa' la fa\mbreak
   <<{mib8-.(mib-. mib-. mib-.) mib8-.(mib-. mib-. mib-.)}\\{do\p do do do do do do do}>>
   sol16\f sol' sib sol sol, sol' sib sol sol, sol' sib sol sol, sol' sib sol

   %31
   <<{\slurDashed fa8\p-\parenthesize -.( fa-\parenthesize -. fa-\parenthesize -. fa-\parenthesize -.) fa-\parenthesize -.( fa-\parenthesize -. fa-\parenthesize -. fa-\parenthesize -.)\slurSolid}\\{re re re re re re re re}>>
   la16\f mi'? la mi la, mi' la mi la, fa' la fa la, fa' la fa
   la, mi'? la mi la, mi' la mi la, fa' la fa la, fa' la fa

   %34
   <<mi4\\\stemUp\once \override Stem #'transparent = ##t  dod \\\stemDown la>> r r2
   r r8 re16 mi? fa4~
   fa8 re16 mi? fa4~ \mbreak fa8 mi16 re mi8 re16 dod

   %37
   re8\p re16 mi? fa4~fa8 re16 mi fa4~
   fa8[mi?16 re mi8 re16 dod] re8 la' fa re
   re,[mi16 fa sol la sib do?] re8[mi16 fa sol la sib do]

   %40
   re8 la fa re la' fa re la
   fa' re la fa re4 r\mbreak
   r2 fa'4. mi?16 re

   %43
   la'4. sol16 fa mi mi la mi la,4
   re16 fa la fa la,4 dod16 mi la mi la,4
   re'8 la fa re fa,[sol16 la si dod re mi]

   %46
   fa8 re mi dod re4 r
   r2 re16\solo la' fa la re, la' fa la
   re, la' fa la re, la' fa la la, fa' re fa la, fa' re fa

   %49
   la, fa' re fa la, fa' re fa fa, re' la re fa, re' la re
   fa, re' la re fa, re' la re re,4 r
   r2 re'8 sol4 sib8~

   %52
   \slurDashed sib16 la (sol) fa (mi8) re mi2~\slurSolid
   mi?\mbreak do8 fa4 la8~
   la16 sol(fa) mi(re8) do re2~

   %55
   re do16 do mi sol la do, fa la
   sib do, mi sol fa do fa la sol do, sol' sib fa do fa la
   mi do mi sol fa do fa la sol do, sol' sib fa do fa la

   %58
   mi do fa do sol' mi la fa\mbreak sib sol do la la4~
   la8 fa mi8. fa16 fa4 r
   r8 fa fa fa sib16 la sol fa sib la sol fa

   %61
   sol8 sol sol sol do16 sib la sol do sib la sol
   sol2 la
   sib la\mbreak

   %64
   sol16[mi, fa sol la sib do re] mi8 do sol mi
   la' fa sol mi la16 fa fa do do la la fa
   fa la la do do fa fa la sol mi mi do do sol sol mi

   %67
   mi? sol sol do do mi mi sol la fa fa do do la la fa
   fa la la do do fa fa la\mbreak la fad fad re re la la fad
   fad? la la re re fad fad la sib sol sol re re sib sib sol

   %70
   sol sib sib re re sol sol si si sol sol re re si si fa
   fa si si re re sol sol do do sol sol mib mib do do sol
   sol do do mib mib sol sol do do lab lab fa fa do do lab\mbreak

   %73
   lab? do do fa fa lab lab do do la la fad fad do do la
   la do do fad fad la la dod si sol sol re re si si sol
   do' sol sol mib mib do do sol si' sol sol re re si si sol

   %76
   do8 sol' mib do do' sol mib do
   si'1\mbreak
   do

   %79
   do8 sol mib do mib,[fa16 sol la si do re]
   mib8 do re si do' sol mib do
   mib,[fa16 sol la si do re] mib8 do re si

   %82
   do4 r r2
   R1
   r2\mbreak r8 do' fa,, lab'

   %85
   sib, sib' mib,, sol' lab, lab' re,, fa'
   sol, sol' do,, mib' re16 si la sol sol' fa mib re
   mib8 do' fa,, do'' sib, sib' mib,, sib''

   %88
   lab, lab' re,, lab'' sol, sol' do,, sol''
   fad, fad' fad, fad' re sol re, sib''
   la fad fad, fad' re sol re, sib''

   %91
   la re, la fad\mbreak sib'2
   sol8 mib do sol la'2
   fa8 re sib fa la'2

   %94
   sib8 fa re sib la4 r
   R1*2
   sib'16 fa re sib fa sib re fa sib fa re sib fa sib re fa

   %98
   la fa do la fa la do fa la fa do la fa la do fa
   re8 sib r4 mib16[fa sol fa mib re do sib]
   la8 la4.\tr re16[mib fa mib re do sib la]

   %101
   sol8 sol4.\tr do16[re mib re do sib la sol]
   fa4 r \mbreak re'16 sib fa' re sib' fa re sib
   fa4 r r2

   %104
   sib16 re fa sib sib la sol fa do mib sol do do sib la sol
   fa4~fa8.(la16) sol4~sol8.(sib16)
   la4~\once\slurDashed la8.(sib16) sol4~sol8.(la16)

   %107
   fa4 r\mbreak r16 fa fa(mib) mib(re) re(do)
   re2~re16(fa) fa(mib) mib(re) re(do)
   re fa mib re do8.\tr re16 re re fa re la' fa la fa

   %110
   sib fa mib re do8.\tr sib16 sib8[fa'16(mib re do sib la)]
   sib16 re fa re fa,4  la16 do fa do fa,4\mbreak %%%%% ripresa
   sib16 re fa re fa,4 la16 do fa do fa,4

   %113
   lab'4. sol16 fa sol fa sol lab sib8 r
   mib,4. re16 do re do re mib fa8 r
   sib fa re sib re,[mib16 fa sol la sib do]

   %116
   re8 sib do la sib' fa re sib
   re, [mib16 fa sol la sib do]  re8 sib do la\mbreak
   sib4\fermata r r2

}

IvlIripn = \relative do'' {

   sib'8 fa re sib sib,[do16 re mib fa sol la]
   sib8[do16 re mib fa sol la] sib8 fa re sib
   fa' re sib fa re' sib fa re

   %4
   sib4 r r8 fa''8 fa fa
   sib16 la sol fa sib la sol fa sol8 sol sol sol\mbreak
   do16 sib la sol do sib la sol la8 la la la

   %7
   re16 do sib la re do sib la sib8 sib sib sib
   mib16 re do sib mib re do sib  la2
   sib do

   %10
   sib la4 r\fermata
   sib,16 re fa re fa,4  la16 do fa do fa,4\mbreak %%%%% ripresa
   sib16 re fa re fa,4 la16 do fa do fa,4
   lab'4. sol16 fa sol fa sol lab sib8 r
   mib,4. re16 do re do re mib fa8 r

   %15
   sib fa re sib re,[mib16 fa sol la sib do]
   re8 sib do la sib' fa re sib
   re, [mib16 fa sol la sib do]  re8 sib do la\mbreak

   %18
   sib4 r r2
   R1*19
   r2 re'8 la fa re
   re,[mi16 fa sol la sib do] re8[mi16 fa sol la sib do]

   %40
   re8 la fa re la' fa re la
   fa' re la fa re4 r\mbreak
   r2 fa'4. mi?16 re

   %43
   la'4. sol16 fa mi mi la mi la,4
   re16 fa la fa la,4 dod16 mi la mi la,4
   re'8 la fa re fa,[sol16 la si dod re mi]

   %46
   fa8 re mi dod re4 r
   R1*3
   r2 re,8 mi fa mi

   %51
   re2 sol8 la sib la
   sol2 do,8 re mi re
   do2 fa8 sol la sol

   %54
   fa2 sib,8 do re do
   sib2 do4 do
   do do do do

   %57
   do do do do
   do r r r8 fa
   do'4 do, fa4 r
   r8 fa' fa fa sib16 la sol fa sib la sol fa

   %61
   sol8 sol sol sol do16 sib la sol do sib la sol
   sol2 la
   sib la\mbreak

   %64
   sol16[mi, fa sol la sib do re] mi8 do sol mi
   la' fa sol mi fa4 r
   R1*10

   %76
   do'8 sol mib do do' sol mib do
   si'1\mbreak
   do

   %79
   do8 sol mib do mib,[fa16 sol la si do re]
   mib8 do re si do' sol mib do
   mib,[fa16 sol la si do re] mib8 do re si

   %82
   do4 r r2
   R1*8
   fad8 re la fad\mbreak sib'2

   %92
   sol8 mib do sol la'2
   fa8 re sib fa la'2
   sib8 fa re sib la4 r

   %95
   R1*4
   sol4 sol do, do
   fa fa sib, sib

   %101
   mib mib la, la
   sib r r2
   R1*2

   %105
   la'16 sib do sib la8 r mib16 fa sol fa mib8 r
   la16 sib do sib la8 r mib16 fa sol fa mib8 r
   la4 r r2

   %108
   R1*3
   sib16 re fa re fa,4 la16 do fa do fa,4\mbreak
   sib16 re fa re fa,4 la16 do fa do fa,4

   %113
   lab'4. sol16 fa sol fa sol lab sib8 r
   mib,4. re16 do re do re mib fa8 r
   sib fa re sib re,[mib16 fa sol la sib do]

   %116
   re8 sib do la sib' fa re sib
   re, [mib16 fa sol la sib do]  re8 sib do la\mbreak
   sib4\fermata r r2

}

IvlIIripn = \relative do'' {

   R1
   sib'8 fa re sib sib,[do16 re mib fa sol la]
   sib8[do16 re mib fa sol la] sib8 fa re sib

   %4
   fa' re sib fa re' sib fa re
   sib sib' sib sib mib16 re do sib mib re do sib\mbreak
   do8 do do do fa16 mi re do fa mi re do

   %7
   re8 re re re sol16 fa mib? re sol fa mib re
   mib8 mib mib mib mib2
   re mib

   %10
   re do4 r\fermata
   fa,16 sib re sib re,4 fa16 la do la do,4\mbreak  %%% ripresa
   fa16 sib re sib re,4 fa16 la do la do,4

   %13
   fa'4. mib16 re mib re mib fa sol8 r
   do,4. sib16 la sib la sib do re8 r
   fa re sib fa sib,[do16 re mib fa sol la]

   %16
   sib8 re, mib do fa' re sib fa
   sib,[do16 re mib fa sol la] sib8 re, mib do
   sib4 r r2 %% Fine ripresa

   %19
   R1*19
   r2 <<fa''4\\re>> r
   <<fa4\\re>> r re'8 la fa re

   %40
   re,[mi16 fa sol la sib do] re8[mi16 fa sol la sib do]
   re8 la fa re la' fa re la\mbreak
   fa' re la fa re4 r

   %43
   fa'4. mi16 re dod dod mi dod la4
   la16 re fa re la4 la16 dod mi dod la4
   la'8 fa re la re,[mi16 fa sol la si dod]

   %46
   re8 fa, sol mi re4 r
   R1*3
   r2 re8 mi fa mi

   %51
   re2 sol8 la sib la
   sol2 do,8 re mi re
   do2 fa8 sol la sol

   %54
   fa2 sib,8 do re do
   sib2 do4 do
   do do do do

   %57
   do do do do
   do r r r8 fa
   do'4 do, fa8 do' do do

   %60
   fa16 mi re do fa mi re do re8 re re re
   sol16 fa mi re sol fa mi re mi8 mi mi mi
   mi?2 fa

   %63
   sol fa\mbreak
   mi16[do, re mi fa sol la sib] do8 sol mi do
   do la'' sib sol fa4 r

   %66
   R1*10
   sol8 mib do sol sol' mib do sol
   sol'1~\mbreak

   %78
   sol
   sol8 mib do sol do,[re16 mib fa sol la si]
   do8 mib, fa re sol' mib do sol

   %81
   do,[re16 mib fa sol la si] do8 mib, fa re
   mib4 r r2
   R1*8

   %91
   re'8 la fad re\mbreak sol'2
   mib8 do sol mib mib'2
   re8 sib fa re fa'2

   %94
   fa8 re sib fa fa4 r
   R1*4
   sol4 sol do, do

   %100
   fa fa sib, sib
   mib mib la, la
   sib r r2

   %103
   R1*2
   la'16 sib do sib la8 r mib16 fa sol fa mib8 r
   la16 sib do sib la8 r mib16 fa sol fa mib8 r

   %107
   la4 r r2
   R1*3
   fa16 sib re sib re,4 fa16 la do la do,4\mbreak  %%% ripresa

   %112
   fa16 sib re sib re,4 fa16 la do la do,4
   fa'4. mib16 re mib re mib fa sol8 r
   do,4. sib16 la sib la sib do re8 r

   %115
   fa re sib fa sib,[do16 re mib fa sol la]
   sib8 re, mib do fa' re sib fa
   sib,[do16 re mib fa sol la] sib8 re, mib do

   %118
   sib4\fermata r r2

}

Ivlan =  \relative do' {

   R1*2
   sib'8 fa re sib sib[do16 re  mib fa sol la]
   sib[sib, do re mib fa sol la] sib8 fa re sib

   %5
   r fa' fa re sib sib' sib sib\mbreak
   sol sol sol mi do do' do do
   la la la fad re re' re re

   %8
   sib sib sib sib do2
   sib la
   fa fa4 r\fermata

   %11
   fa2~fa~ %ripresa
   fa~fa
   re' sib8 sib sib r

   %14
   la2 fa8 fa fa r
   re4 r fa, r
   fa8 fa sol fa re'4 r

   %17
   fa, r fa8 fa sol fa\mbreak
   fa4 r r2 %%%%5fine ripresa
   R1*19

   %38
   r2 la'4 r
   la r la r
   la r mib'8 la, fa re

   %41
   re,[mi16 fa sol la sib do] re8[mi16 fa sol la sib do]\mbreak
   re8 la fa re la' fa re la
   la'1~

   %44
   la
   fa4 r la, r
   la8 la sib la la4 r

   %47
   R1*3
   r2 re8 mi fa mi
   re2 sol8 la sib la

   %52
   sol2 do,8 re mi re
   do2 fa8 sol la sol
   fa2 sib,8 do re do

   %55
   sib2 do4 do
   do do do do
   do do do do

   %58
   do r r r8 fa
   do'4 do, fa8 la la la
   do do do la fa fa fa fa

   %61
   re' re re si sol sol sol sol
   sol2 fa
   mi fa\mbreak

   %64
   sol4 r sol, r
   fa8 do' re do la4 r
   R1*11

   %77
   si'8 sol re si si' sol re si\mbreak
   mib1
   mib'8 do sol mib sol,4 r

   %80
   sol8 sol lab sol mib'' do sol mib
   sol,4 r sol8 sol lab sol
   sol4 r r2

   %83
   R1*8
   fad'4 r\mbreak re'8 re, re sib
   mib2 do'8 do, do la

   %93
   re2 do'8 do, do la
   re2 do4 r
   R1*4

   %99
   sol'4 sol do, do
   fa fa sib, sib
   mib mib la, la

   %102
   sib r r2
   R1*2
   fa'16 sol la sol fa8 r do16 re mib re do8 r

   %106
   fa16 sol la sol fa8 r do16 re mib re do8 r
   fa4 r r2
   R1*3

   %111
   fa2~fa~ %ripresa
   fa~fa
   re' sib8 sib sib r

   %114
   la2 fa8 fa fa r
   re4 r fa, r
   fa8 fa sol fa re'4 r

   %117
   fa, r fa8 fa sol fa\mbreak
   fa4\fermata r r2

}

Ibcn = \relative do {

   R1*3
   sib'8 fa re sib sib[do16 re mib fa sol la]
   sib8 re, re re  mib mib, mib mib\mbreak

   %6
   mi' mi, mi mi fa' fa, fa fa
   fad' fad, fad fad sol' sol, sol sol
   sol' sol sol sol fa' do la fa

   %9
   fa16[sol la sib do re mib fa]  fa8 do la fa
   fa16[sol la sib do re mib fa] fa,4 r\fermata
   fa8 fa fa16 sib re sib fa8 fa fa16 la do la\mbreak % ripresa

   %12
   fa8 fa fa16 sib re sib fa8 fa fa16 la do la
   sib8 fa re sib mib' sib sol mib
   fa' do la fa sib fa re sib

   %15
   sib4 r sib r
   sib8 sib mib, fa sib4 r
   sib r sib8 sib mib, fa\mbreak

   %18
   sib4 r sib r
   sib r sib la
   sib do re8 mib re do

   %21
   sib4 r sib r
   sib la sib do
   re8 do re sib fa' sol la fa\mbreak

   %24
   R1*3
   sib,8 do re do sib do re sib
   fa' sol la sol fa sol la fa\mbreak

   %29
   do re mib re do re mib do
   sol' la sib la sol la sib sol
   re mi fa mi\mbreak re mi fa re

   %32
   la'1~
   la~
   la~

   %35
   la2 re,8 re' la fa
   re re' la fa\mbreak re re, sol[la]
   re re' la fa re re' la fa

   %38
   re re, sol[la] re4 r
   re r re r
   re r re r

   %41
   re r re'8 la fa re\mbreak
   re,[mi16 fa sol la sib do] re8[mi16 fa sol la sib do]
   re8 la fa re la la la16 dod mi dod

   %44
   la8 la la16 re fa re la8 la la16 dod mi dod
   re4 r re r
   re8 re, sol[la] re,4 r

   %47
   re r\mbreak re r
   re r re r
   re r re r

   %50
   re r re r
   R1*8
   r2 r8 fa' fa fa

   %60
   la, la la la sib sib sib sib
   si si si si do do do do
   do' sol mi do do16[re mi fa sol la sib do]

   %63
   do8 sol mi do do16[re mi fa sol la sib do]\mbreak
   do,4 r do r
   fa,8 fa' sib, do fa,4 fa'

   %66
   fa fa do' do,
   do do fa fa,
   fa fa\mbreak re'' re,

   %69
   re re sol sol,
   sol sol sol' sol,
   sol sol do do,

   %72
   do do fa' fa,\mbreak
   fa fa fad' fad,
   fad? fad sol' sol,

   %75
   sol' sol, sol' sol,
   do r do r
   sol'8 re si sol sol' re si sol\mbreak

   %78
   do' sol mib do do[re16 mib fa sol la si]
   do4 r do, r
   do8 do, fa[sol] do,4 r

   %81
   do r do'8 do, fa sol
   do,4 fa'8 r sib r mib, r
   lab r re, r sol r do, r

   %84
   sol' r sol, r\mbreak do r fa r
   sib r mib, r lab r re, r
   sol r do, r sol' r sol, r

   %87
   do r fa r sib r mib, r
   lab r re, r sol r do, r
   re r re, r sol' r sol, r

   %90
   re' r re, r sol' r sol, r
   re'4 r\mbreak sol8 re sib sol
   do'2 fa,8 do la fa

   %93
   sib'2 fa8 do la fa
   sib2 fa'4 r
   sib,8 do re do sib do re sib

   %96
   fa' sol la sol fa sol la fa\mbreak
   sib, do re do sib do re sib
   fa' sol la sol fa sol la fa

   %99
   R1*3
   sib,4 r\mbreak sib r
   sib r r2

   %104
   R1*3
   r2 sib4 r
   sib r sib r

   %109
   sib8 sib fa' fa, sib4 r
   sib8 sib fa' fa, sib4 r
   fa'8 fa fa16 sib re sib fa8 fa fa16 la do la\mbreak % ripresa

   %112
   fa8 fa fa16 sib re sib fa8 fa fa16 la do la
   sib8 fa re sib mib' sib sol mib
   fa' do la fa sib fa re sib

   %115
   sib4 r sib r
   sib8 sib mib, fa sib4 r
   sib r sib8 sib mib, fa\mbreak

   %118
   sib4\fermata r r2

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key sib\major
   \time 4/4
   \tempo 2 = 60
   s1*118
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

IvlIrip= {
   \Iglobal
   <<\IvlIripn \forma>>

}

IvlIIrip = {
   \Iglobal
   <<\IvlIIripn \forma>>

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

IIvlIn =  \relative do'' {

   do8
   mib16.(do32) sol'16.(mib32) do'16.(sol32) mib'16.(do32) do8\tr si r sol,
   re'16.(si32) fa'16.[(re32)] si'16.(sol32) re'16.[(fa,32)] fa8\tr mib r mib
   re16 sol8~sol64 [fa(mib re] do16)[lab'8]~lab64[ sol(fa128 mib re do)] do8\tr si r4

   %4
   R1*2
   r2 r4 r8 sol'
   do do \senza \tuplet 3/2 { mib16(re do sib[lab sol)] } \appoggiatura sol8 lab4. lab8

   %8
   sib sib \tuplet 3/2 { re16(do sib lab[sol fa)] } \appoggiatura fa8 sol4. sol8\mbreak
   lab lab \tuplet 3/2 {\once\slurDashed  do16 (sib lab lab[sib do)] } fad,4~\tuplet 3/2 { fad16 re(mi fad[sol la?)] }
   sib8 la16 sol fad8.\tr sol16 sol4 r

   %11
   re16. la32 fad'16.[re32] la'16. fad32 mib'16.[do32] do8\tr sib r mib,\mbreak
   mib4~\tuplet 3/2 { mib16 sol(fa mib[re do)] } re4~\tuplet 3/2 { re16 fa(mib re[do sib)] }
   do4~\tuplet 3/2 { do16 mib(re do[si la)] } si16.(sol32) re'16.[(si32)] fa'16.(re32) lab'16.[(fa32)]

   %14
   fa8\tr mib \tuplet 3/2 { sol16(fa mib re[do sib)] } lab4 \tuplet 3/2 { lab'16(sol fa mib[re do)] }
   sib4 \tuplet 3/2 { sib'16(lab sol fa[mib re)] }\mbreak do4 \tuplet 3/2 { do'16(sib lab sol[fa mib)] }
   re8 si' \tuplet 3/2 { re16(do si si[do re)]  } do mib re do si8.\tr do16

   %17
   do4do,2 re4~
   re mib2 fa4
   fa2 mib16 sol fa mib re8.^\markup \center-align{\italic\bold [tr]} do16

   %20
   do1\fermata

}

IIvlIIn = \relative do'' {

   r8
   R1*2\senza
   r2 r4 r8 do
   mib16.(do32) sol'16.(mib32) do'16.(sol32) mib'16.(do32) do8\tr si r sol,

   %5
   \slurDashed re'16.(si32) fa'16.[(re32)] si'16.(sol32) re'16.[(fa,32)] fa8\tr mib r mib\slurSolid
   re16 sol8~sol64 [fa(mib re] do16)[lab'8]~lab64[ sol(fa128 mib re do)] do8\tr si r4
   r4 r8 do fa fa \tuplet 3/2 { lab16(sol fa  mib[re do)] }

   %8
   \appoggiatura do8 re4. re8 mib mib \tuplet 3/2 { \once\slurDashed sol16(fa mib re[do sib)] }\mbreak
   do4. do8 do2
   re8 do16 sib la8.\tr sol16 sol16.(re32) sib'16.[(sol32)] re'16.(sib32) sib'16.[(sol32)]

   %11
   sol8\tr fad r4 r8 re re4~\mbreak
   \tuplet 3/2 { re16 sol(fa? mib[re do)] } do4~\tuplet 3/2 { do16 fa(mib re[do sib)]} sib4~
   \tuplet 3/2 { sib16 mib(re do[sib la)] } la4 sol16.(re32) si'16.[(sol32)] re'16.(si32) fa'16.[(re32)]

   %14
   re8\tr do do2 re4~
   re mib2 fa4
   fa2 mib16 sol fa mib re8. do16

   %17
   do4 \tuplet 3/2 { sol'16(fa mib re[do sib)] } lab4 \tuplet 3/2 { \once\slurDashed lab'16(sol fa mib[re do)] }
   sib4 \tuplet 3/2 { sib'16(lab sol fa[mib re)] } do4 \tuplet 3/2 { do'16(sib lab sol[fa mib)] }
   re8 si' \tuplet 3/2 { re16(do si si[do re)] } do mib re do si8.\tr do16

   %20
   do1\fermata

}

IIvlIripn = \relative do'' {

   do,8
   do do do do sol' sol sol sol
   si, si sol sol do do do do'
   sib sib lab lab sol sol, r do

   %4
   do do do do sol' sol sol sol\mbreak
   si, si sol sol  do do do do'
   sib? sib lab lab sol sol, r sol'

   %7
   mib mib mib mib fa fa fa fa
   sib, sib sib sib mib mib mib mib\mbreak
   lab, lab' lab lab re, re re re

   %10
   sol do, re re sol, sol sol sol
   re' re re re sol, sol sol sol\mbreak
   do do la la sib sib sol sol

   %13
   la la fad' fad sol, sol sol sol
   do do mib[mib] fa fa fa fa
   sol sol sol sol\mbreak lab lab lab lab

   %16
   si, si sol sol do fa sol sol,
   do4 mib8 mib fa fa fa fa
   sol sol sol sol lab lab lab lab

   %19
   si, si sol sol do fa sol sol,
   do1\fermata

}

IIvlan =  \relative do' {

   do8
   do do do do sol' sol sol sol
   si, si sol sol do do do do'
   sib sib lab lab sol sol, r do

   %4
   do do do do sol' sol sol sol\mbreak
   si, si sol sol  do do do do'
   sib? sib lab lab sol sol, r sol'

   %7
   mib mib mib mib fa fa fa fa
   sib, sib sib sib mib mib mib mib\mbreak
   lab, lab' lab lab re, re re re

   %10
   sol do, re re, sol sol sol sol
   re' re re re sol, sol sol sol\mbreak
   do do la la sib sib sol sol

   %13
   la la fad fad sol sol sol sol
   do do mib[mib] fa fa fa fa
   sol sol sol sol\mbreak lab lab lab lab

   %16
   si, si sol sol do fa sol sol,
   do4 mib8 mib fa fa fa fa
   sol sol sol sol lab lab lab lab

   %19
   si, si sol sol do fa sol sol,
   do1\fermata

}

forma = {

\key sib\major
\time 4/4
\tempo 4 = 40
\partial 8 s8
s1*20
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

IIvlIrip= {
	\IIglobal
	<<\IIvlIripn \forma>>

}

IIvla = {
	\IIglobal
	\clef alto
	<<\IIvlan \forma>>
	\typeset

}


IIIglobal = {
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
}

IIIvlIn =  \relative do'' {

   re16 fa sib8 re,
   do16 la sib sol la fa
   re' fa sib8 re,

   %4
   do16 la sib sol la fa
   sol la sib8 sol
   fa16 re sib' fa re' sib

   %7
   sib'4. ~ %%%%ripresa
   sib8 la4~
   la8 sol4~

   %10
   sol8 fa4~
   fa8 mib4
   re16 sib fa' re sib' fa

   %13
   re sib fa' re sib' fa\mbreak
   re4.~
   re
   reb8\pp(do4)

   %17
   fa8(mib4)
   reb16(do sib8 la)
   sib4.

   %20
   reb8(do4)
   fa8(mib4)
   reb16(do sib8 la)

   %23
   sib4 r8 %% fine ripresa
   re?16\solo sib fa' re sib' fa
   re sib fa' re sib' re,

   %26
   do la fa' do la' fa
   do la fa' do la' do,\mbreak
   sib fa re sib r8

   %29
   R4.*3
   fa''16 sol la sib do re
   re8(mib,4)

   %34
   mib16 fa sol la sib do
   do8(re,4)
   re16 mib fa sol la sib

   %37
   sib8(do,4)
   do16 re mib fa sol la\mbreak
   la8 sib,4

   %40
   sol'16 fa mi re do sib
   \senza\tuplet 3/2 { la sib la do[re do] } fa8
   \tuplet 3/2 { do16 re do fa [mi fa] } la8

   %43
   \tuplet 3/2 { fa16 sol fa la[sib la] } do8
   fa16 (mi re do sib la)
   fa'(mi re do sib la)

   %46
   fa' fa, sol4\tr
   fa4 r8\mbreak
   R4.*2

   %50
   la,16 do fa8 la
   sol16 mi fa re mi do
   la do fa8 la

   %53
   sol16 mi fa re mi do
   re mi? fa8 re
   do16 la fa' do la' fa

   %56
   la, do fa8 la,
   sol16 sib mi8 sol,
   fa16 la re8 fa,\mbreak

   %59
   mi16 sol do8 mi,  %%%%%%5 inizio p. 17
   re16 fa sib8 re,
   do16 fa la fa do' la

   %62
   fa' do la' fa do'8
   la sib sol
   \tuplet 3/2 { fa16\solo (sol fa) do[(re do)] la(do la) }

   %65
   fa8 la do
   \slurDashed \tuplet 3/2 { la'16(sib la) fa[(sol fa)] do (re do) }
   la8 do fa

   %68
   \tuplet 3/2 { do'16(re do) la[(sib la)] }\slurSolid fa8
   \tuplet 3/2 { mib!16(re mib) mib[(re mib)] mib(re mib) }\mbreak
   re4 r8

   %71
   \slurDashed \tuplet 3/2 { re'16(do re) si[(la si)] } sol8
   \tuplet 3/2 { fa16(mi fa) fa[(mi fa)] fa(mi fa) }
   mi4 r8\slurSolid

   %74
   r16 fa do fa la, fa'
   sib, sol' re sol si, sol'
   do, la' mi la dod, la'

   %77
   re, sib' fa sib re, sib'
   dod, la mi dod la \once\stemDown sol''
   fa4 r8\mbreak

   %80
   R4.*4
   r16 la re la fa re
   sol, sol' do sol mi do

   %86
   fa, fa' sib fa re sib
   mi, mi' la mi dod la
   \once\stemUp re, la'' sol fa mi re

   %89
   sib' re, mi4\tr
   re8 fa4~\mbreak
   fa8 mi4~

   %92
   mi8 re4~
   re8 dod4
   re r8

   %95
   R4.
   fa8\tu(mi4)
   la8(sol4)

   %98
   fa16(mi re8 dod)
   re4(mi8)
   fa(mi4)

   %101
   la8(sol4)
   fa16(mi re8 dod)\mbreak
   re16 re32^\markup\italic"[Solo]"(mi fa16)[fa32(sol] la16) sib32(do

   %104
   re16) la fa re la' re
   sib4.~
   sib

   %107
   \slurDashed do,16 do32(re mi16)[mi32(fa] sol16) la32 (sib
   do16)\slurSolid sol mi do sol' do
   la4.~

   %110
   la
   sib,16 sib32(do re16) [re32(mib!] fa16) sol32(la
   sib16) fa re sib fa' sib\mbreak

   %113
   sol sib32(la sol16)[sol32(fa] mib16) mib32(re
   do16) sol'32(fa mib16)[mib32(re] do16) do32(sib
   la16) mib'32(re do16)[do32(sib] la16) la32(sol

   %116
   fa16) do'32(sib la16)[la32(sol] fa16) fa32(mib
   re16)\tu fa' sib8 re,
   do16 la sib sol la fa

   %119
   re'16 fa sib8 re,
   do16 la sib sol la fa
   sol16 la sib8 sol

   %122
   fa16 re sib' fa re' sib\mbreak
   do fa\solo fa sol sol la
   la sib sib do do re

   %125
   re mib mib fa fa8~
   fa16 mib re do sib la
   \appoggiatura la8  \once\slurDashed sol32 (fa sol16) r8 r

   %128
   \appoggiatura la8 sol32 (fa sol16) r8 r
   \appoggiatura la8 sol32 (fa sol16) r8 r
   \appoggiatura la8 sol32 (fa sol16) r8 r

   %131
   r16 sol sol la la sib
   sib do do re re mi
   mi? fa fa sol sol8~

   %134
   sol16 fa mi re do sib\mbreak
   \appoggiatura sib8 la32 (sol la16) r8 r
   \appoggiatura sib8 la32 (sol la16) r8 r

   %137
   \appoggiatura sib8 la32 (sol la16) r8 r
   \appoggiatura sib8 \once\slurDashed la32 (sol la16) r8 r
   fa16 re sib' fa re sib

   %140
   fa' re sib' fa re sib
   do la la' fa do la
   do la la' fa do la

   %143
   \tuplet 3/2 { sib do sib re[mib re] fa sol fa }
   sib8 r r
   \tuplet 3/2 { do,16 re do mib[fa mib] sol la sol }\mbreak

   %146
   do8 r r
   \tuplet 3/2 { re,16 mi re fa[sol fa] la sib la }
   re8 r r

   %149
   \tuplet 3/2 { mib,?16 fa mib sol[la sol] sib do sib }
   mib4.
   \tuplet 3/2 {

      %152
      mib16(re do) do[(re mib)] mib(re do)
      \slurDashed re(do sib) sib[(do re)] re(do sib)
      do(sib la) la[(sib do)] do(sib la)

      %155
      sib(la sol) sol[(la sib)] sib(la sol)
      la(sol fa) fa[(sol la)] la(sol fa)
   }
   mib4.~\slurSolid

   %158
   mib16 do' (la sol fa mib
   re) sib' do,4\tr
   sib4 r8

   %160
   sib'4.~
   sib8 la4~
   la8 sol4~

   %163
   sol8 fa4~
   fa8 mib4
   re16 sib fa' re sib' fa

   %166
   re sib fa' re sib' fa\mbreak
   re4.~
   re
   reb8\pp(do4)

   %170
   fa8(mib4)
   reb16(do sib8 la)
   sib4.

   %173
   reb8(do4)
   fa8(mib4)
   reb16(do sib8 la)

   %176
   sib4\fermata r8 %% fine ripresa

}

IIIvlIIn = \relative do'' {

   re16 fa sib8 re,
   do16 la sib sol la fa
   re' fa sib8 re,

   %4
   do16 la sib sol la fa
   sol la sib8 sol
   fa16 re sib' fa re' sib

   %7
   sib'4. ~ %%%%ripresa
   sib8 la4~
   la8 sol4~

   %10
   sol8 fa4~
   fa8 mib4
   re16 sib fa' re sib' fa

   %13
   re sib fa' re sib' fa\mbreak
   re4.~
   re
   reb8\pp(do4)

   %17
   fa8(mib4)
   reb16(do sib8 la)
   sib4.

   %20
   reb8(do4)
   fa8(mib4)
   reb16(do sib8 la)

   %23
   sib4 r8 %% fine ripresa
   R4.*4
   re16 sib fa' re sib' fa

   %29
   re sib fa' re sib' re,
   do la fa' do la' fa
   do la fa' do la' do,

   %32
   sib fa re sib r8
   sib'16 do re mib fa sol
   sol8(la,4)

   %35
   la16 sib do re mib fa
   fa8(sol,4)
   sol16 la sib do re mib

   %38
   mib8 fa,4\mbreak
   fa16 sol la sib do re
   mi re do sib la sol

   %41
   \senza fa8 \tuplet 3/2{la16[sib la] do re do}
   fa8\noBeam  \tuplet 3/2 { do16 re do fa[sol fa] }
   la8\noBeam \tuplet 3/2 { fa16 sol fa la[sib la] }

   %44
   do8 r r
   R4.*2
   fa16(mi re do sib la)\mbreak

   %48
   fa' mi re do sib la
   fa' fa, sol4\tr
   fa16 do fa8 la

   %51
   sol16 mi fa re mi do
   la do fa8 la

   %53
   sol16 mi fa re mi do
   re mi? fa8 re
   do16 la fa' do la' fa

   %56
   la, do fa8 la,
   sol16 sib mi8 sol,
   fa16 la re8 fa,\mbreak

   %59
   mi16 sol do8 mi,  %%%%%%5 inizio p. 17
   re16 fa sib8 re,
   do16 fa la fa do' la

   %62
   fa' do la' fa do'8
   la sib sol
   fa4 r8\slurDashed

   %65
   \tuplet 3/2 { fa16\solo(sol fa) do[(re do)] la(sib la) }
   fa8 la do
   \tuplet 3/2 {
      la'16(sib la) fa[(sol fa)] do(re do)

      %68
      la'(sib la) fa[(sol fa)]
   } do8~
   \tuplet 3/2 { do16(sib do) do[(sib do)] do(sib do) }\mbreak
   sib4 r8

   %71
   \tuplet 3/2 { si'16(la si) sol[(fa sol)] } re8~
   \tuplet 3/2 { re16(do re) re[(do re)] re(do re) }
   do4 r8

   %74
   R4.*5
   \slurSolid r16 fa do fa la, fa'\mbreak
   sib, sol' re sol si, sol'

   %81
   do, la' mi la dod, la'
   re, sib' fa sib re, sib'
   dod, la mi dod la \once\stemDown sol''

   %84
   fa4.~
   fa8 mi4~
   mi?8 re4~

   %87
   re8 dod4
   re r8
   R4.

   %90
   r16 la' re la fa re\mbreak
   sol, sol' do sol mi do
   fa, fa' sib fa re sib

   %93
   mi, mi'? la mi dod la
   \once\stemUp  re, la''(sol fa mi re)
   sib' re, mi4\tr

   %96
   fa8(mi4)
   la8(sol4)
   fa16(mi re8 dod)

   %99
   re4(mi8)
   fa(mi4)
   la8(sol4)

   %102
   fa16(mi re8 dod)\mbreak
   re4 r8
   R4.

   %105
   sol,16\solo sol32(la sib16)[sib32(do] re16) \once\slurDashed mi32(fa
   sol16) re sib sol re' sol
   mi4.~

   %108
   mi
   \slurDashed fa,16 fa32(sol la16)[la32(sib] do16) re32(mib?
   fa16) do la fa do' fa

   %111
   re4.~
   re\mbreak
   mib4 r8

   %114
   \slurSolid r16 sib'32(la sol16)[sol32(fa] mib16) mib32(re
   do16) sol'32(fa mib16)[mib32(re] do16) do32(sib
   la16) mib'32(re do16)[do32(sib] la16) la32(sol

   %117
   fa16) fa' sib8 re,
   do16 la sib sol la fa
   re'16 fa sib8 re,

   %120
   do16 la sib sol la fa
   sol16 la sib8 sol
   fa16 re sib' fa re' sib\mbreak

   %123
   do4 r8
   R4.*3
   r16 sib\solo sib do do re

   %128
   re mib mib fa fa sol
   sol la la sib sib8~
   sib16 la sol fa mib re

   %131
   \appoggiatura re8 do32(sib do16) r8 r
   \appoggiatura re8 do32(sib do16) r8 r
   \appoggiatura re8 do32(sib do16) r8 r

   %134
   \appoggiatura re8 do32(sib do16) r8 r\mbreak
   r16 do do re re mib
   mib fa fa sol sol la

   %137
   la sib sib do do8~
   do16 sib la sol fa mib
   re sib fa' re sib fa

   %140
   re' sib fa're sib fa
   la fa fa'[do la fa]
   la[fa] fa' do la fa

   %143
   fa4 r8
   \tuplet 3/2 { sib16 do sib re[mib re] fa sol fa }
   sol8 r r\mbreak

   %146
   \tuplet 3/2 { do,16 re do mib[fa mib] sol la sol }
   la8 r r
   \tuplet 3/2 { re,16 mi re fa[sol fa] la sib la }

   %149
   sib8 r r
   \tuplet 3/2 {
      mib,16 fa mib sol[la sol] sib do sib
      do(sib la) la[(sib do)] do(sib la)
   }\slurDashed

   %152
   \tuplet 3/2 {
      sib(la sol) sol[(la sib)] sib(la sol)
      la(sol fa) fa[(sol la)] la(sol fa)
      sol(fa mib) mib[(fa sol)] sol(fa mib)

      %155
      fa(mib re) re[(mib fa)] fa(mib re)
   }
   do4.~
   do16 la'(fa mib re do
   sib) re la4\tr

   %159
   sib4 r8
   \slurSolid sib'4. ~ %%%%ripresa
   sib8 la4~

   %162
   la8 sol4~
   sol8 fa4~
   fa8 mib4

   %165
   re16 sib fa' re sib' fa
   re sib fa' re sib' fa\mbreak
   re4.~

   %168
   re
   reb8\pp(do4)
   fa8(mib4)

   %171
   reb16(do sib8 la)
   sib4.
   reb8(do4)

   %174
   fa8(mib4)
   reb16(do sib8 la)
   sib4\fermata r8

}

IIIvlIripn = \relative do'' {

   re16 fa sib8 re,
   do16 la sib sol la fa
   re' fa sib8 re,

   %4
   do16 la sib sol la fa
   sol la sib8 sol
   fa16 re sib' fa re' sib

   %7
   sib'4. ~ %%%%ripresa
   sib8 la4~
   la8 sol4~

   %10
   sol8 fa4~
   fa8 mib4
   re16 sib fa' re sib' fa

   %13
   re sib fa' re sib' fa\mbreak
   re4.~
   re
   reb8\pp(do4)

   %17
   fa8(mib4)
   reb16(do sib8 la)
   sib4.

   %20
   reb8(do4)
   fa8(mib4)
   reb16(do sib8 la)

   %23
   sib4 r8 %% fine ripresa
   R4.*26

   %50
   la16 do fa8 la
   sol16 mi fa re mi do
   la do fa8 la

   %53
   sol16 mi fa re mi do
   re mi? fa8 re
   do16 la fa' do la' fa

   %56
   la, do fa8 la,
   sol16 sib mi8 sol,
   fa16 la re8 fa,\mbreak

   %59
   mi16 sol do8 mi,  %%%%%%5 inizio p. 17
   re16 fa sib8 re,
   do16 fa la fa do' la

   %62
   fa' do la' fa do'8
   la sib sol
   fa4 r8

   %65
   R4.*31
   fa8(mi4)
   la8(sol4)

   %98
   fa16(mi re8 dod)
   re4(mi8)
   fa(mi4)

   %101
   la8(sol4)
   fa16(mi re8 dod)\mbreak
   re4 r8

   %104
   fa,8 re16 mib fa re
   sol4 r8
   sib sol16 la sib sol

   %107
   do4 r8
   mi, do16 re mi do
   fa4 r8

   %110
   la fa16 sol la fa
   sib4 r8
   re, sib16 do re sib

   %113
   mib4 r8
   R4.*3
   re'16 fa sib8 re,
   do16 la sib sol la fa

   %119
   re'16 fa sib8 re,
   do16 la sib sol la fa
   sol16 la sib8 sol

   %122
   fa16 re sib' fa re' sib\mbreak
   do4 r8
   R4.*36

   %160
   sib'4.~
   sib8 la4~
   la8 sol4~

   %163
   sol8 fa4~
   fa8 mib4
   re16 sib fa' re sib' fa

   %166
   re sib fa' re sib' fa\mbreak
   re4.~
   re

   %169
   reb8\pp(do4)
   fa8(mib4)
   reb16(do sib8 la)

   %172
   sib4.
   reb8(do4)
   fa8(mib4)

   %175
   reb16(do sib8 la)
   sib4\fermata r8 %% fine ripresa

}

IIIvlIIripn = \relative do'' {

   sib16 re fa8 sib,
   la16 fa re' sib do la
   sib re fa8 sib,

   %4
   la16 fa re' sib do la
   mib fa sol8 mib
   re16 sib fa' re sib' fa

   %7
   re'16 fa sib8 re, %% ripresa
   do16 mib la8 do,
   sib16 re sol8 sib,

   %10
   la16 do fa8 la,
   sol16 sib mib8 sol,
   fa16[fa] re' sib fa' re

   %13
   sib fa re' sib fa' re\mbreak
   sib4.~
   sib

   %16
   sib8\pp (la4)
   reb8(do4)
   sib16(do reb8 do)

   %19
   reb16(mib fa8 la,)
   sib(la4)
   reb8(do4)

   %22
   sib16(do reb8 do)
   sib4 r8 %%% fine ripresa
   R4.*26

   %50
   fa16 la do8 fa
   mi16 do la' fa sol mi
   fa, la do8 fa

   %53
   mi16 do la' fa sol mi
   sib do re8 sib
   la16 fa do' la fa' do

   %56
   fa4.~
   fa8 mi4~
   mi?8 re4~\mbreak

   %59
   re8 do4~
   do8 sib4
   la16 la fa do la'[fa]

   %62
   do' la fa' do la'8
   fa8 sol mi
   fa4 r8

   %65
   R4.*31
   re8(dod4)
   fa8(mi4)

   %98
   re16(mi fa8 mi)
   fa16(sol la8 dod,)
   re8(dod4)

   %101
   fa8(mi4)
   re16(mi fa8 mi)\mbreak
   re4 r8

   %104
   fa,8 re16 mib fa re
   sol4 r8
   sib sol16 la sib sol

   %107
   do4 r8
   mi, do16 re mi do
   fa4 r8

   %110
   la fa16 sol la fa
   sib4 r8
   re, sib16 do re sib

   %113
   mib4 r8
   R4.*3
   sib'16 re fa8 sib,

   %118
   la16 fa re' sib do la
   sib re fa8 sib,
   la16 fa re' sib do la

   %121
   mib fa sol8 mib
   re16 sib fa' re sib' fa\mbreak
   la4 r8

   %124
   R4.*36
   re16 fa sib8 re, %% ripresa
   do16 mib la8 do,

   %162
   sib16 re sol8 sib,
   la16 do fa8 la,
   sol16 sib mib8 sol,

   %165
   fa16[fa] re' sib fa' re
   sib fa re' sib fa' re\mbreak
   sib4.~

   %168
   sib
   sib8\pp (la4)
   reb8(do4)

   %171
   sib16(do reb8 do)
   reb16(mib fa8 la,)
   sib(la4)

   %174
   reb8(do4)
   sib16(do reb8 do)
   sib4\fermata r8

}

IIIvlan =  \relative do' {

   fa4.~
   fa~
   fa~
   fa
   sib,8 sol16 la sib do
   re4.
   fa8 re4 %%% ripresa
   mib4.
   re8 sib4
   do4.
   sib8 sol16 la sib do
   re4.~
   re\mbreak
   fa~
   fa
   fa\pp~
   fa8 sol la
   fa4.~
   fa~
   fa~
   fa8 sol la
   fa4 fa8
   re!4 r8 %%%% fine ripresa
   R4.*26
   do4.~
   do~
   do~
   do
   fa8 re16 mi fa sol
   do,4.
   do'8 la4
   sib4.
   la8 fa4\mbreak
   sol4.
   fa8 re16 mi fa sol
   do,4.~
   do
   do8 re do
   la4 r8
   R4.*31
   la'4.~la8 sib la
   la4.~
   la~
   la~
   la8 sib la
   la4.(\mbreak
   fa4) r8

   %104
   fa8 re16 mib fa re
   sol4 r8
   sib sol16 la sib sol

   %107
   do4 r8
   mi, do16 re mi do
   fa4 r8

   %110
   la fa16 sol la fa
   sib4 r8
   re, sib16 do re sib

   %113
   mib4 r8
   R4.*3
   fa4.~
   fa~
   fa~
   fa
   sib,8 sol16 la sib do
   re4.\mbreak
   fa4 r8
   R4.*36

   %160
   fa8 re4 %%% ripresa
   mib4.
   re8 sib4
   do4.
   sib8 sol16 la sib do
   re4.~
   re\mbreak
   fa~
   fa
   fa\pp~
   fa8 sol la
   fa4.~
   fa~
   fa~
   fa8 sol la
   fa4 fa8
   re!4\fermata r8

}

IIIbcn = \relative do {

   sib'8 sib,16 do re mib
   fa4.
   sib8 sib,16 do re mib

   %4
   fa4.
   sol,8 mib16 fa sol la
   sib4.

   %7
   sib'8 sib16 do re sib  %%%% ripresa
   la8 fa16 sol la fa
   sol8 sol16 la sib sol

   %10
   fa8 re16 mib fa re
   mib8 mib16 fa sol la
   sib4.~

   %13
   sib\mbreak
   re,16 sib fa' re sib' fa
   re sib fa' re sib' fa

   %16
   sib,8\pp^\markup\italic"Senza Cembali" (fa' la,)
   sib(mib fa)
   sib,(fa' fa,)

   %19
   sib(reb fa)
   sib, fa' la,
   sib mib fa

   %22
   sib, fa' fa,
   sib4 r8  %%%% fine ripresa
   r sib' sib,

   %25
   r sib' sib,
   r la' la,
   r la' la,\mbreak

   %28
   r sib' sib,
   r sib' sib,
   r la' la,

   %31
   r la' la,
   r sib' sib,
   mib'  do4

   %34
   la8 fa4
   re'8 sib4
   sol8 mib4

   %37
   do'8 la4
   fa8 re4\mbreak
   sib'8 sol4

   %40
   do,8 re mi
   fa r r
   fa r r

   %43
   fa r r
   fa r r
   fa r r

   %46
   fa do' do,
   fa r r\mbreak
   fa r r

   %49
   fa do' do,
   fa fa,16 sol la sib
   do4.

   %52
   fa8 fa,16 sol la sib
   do4.
   sib8 sib16 do re mi

   %55
   fa4.
   fa8 fa16 sol la fa
   mi8 do16 re mi do

   %58
   re8 re16 mi fa mi\mbreak
   do8 la16 sib do la
   sib8 sib16 do re mi

   %61
   fa4.~
   fa
   fa8 sib, do

   %64
   fa,4 r8
   fa'4 r8
   fa4 r8

   %67
   fa4 r8
   fa4 r8
   fa fa fa\mbreak

   %70
   sib,16 re fa re sib' fa
   sol4 r8
   sol sol sol

   %73
   do,16 mi sol mi do' sol
   r8 la fa
   r si sol

   %76
   r dod la
   r re re,
   r la' la,

   %79
   re la' fa\mbreak
   r si sol
   r dod la

   %82
   r re re,
   r la' la,
   r re' re,

   %85
   r do' do,
   r sib' sib,
   r la' la,

   %88
   r r re
   sol16 sib la8[la,]
   re re' re,\mbreak

   %91
   r do' do,
   r sib' sib,
   r la' la,

   %94
   r r re
   sol16 sib la8[la,]
   re la' dod,

   %97
   re sol la
   re, la' la,
   re fa la

   %100
   re, la' dod,
   re sol la
   re, la' la,\mbreak

   %103
   re4 r8
   R4.*9
   mib4 r8

   %114
   mib4 r8
   fa4 r8
   fa,4 r8

   %117
   sib8 sib16 do re mib
   fa4.
   sib8 sib,16 do re mib

   %120
   fa4.
   sol,8 mib16 fa sol la
   sib4.\mbreak

   %123
   fa'4 r8
   R4.
   r8 r sib

   %126
   re, re re
   mib4 r8
   R4.

   %129
   r8 r mib
   sol, sol sol
   mi'4.

   %132
   R
   r8 r do'
   mi, mi mi\mbreak

   %135
   fa4 r8
   R4.
   r8 r fa

   %138
   la, la la
   sib sib' r
   sib, sib' r

   %141
   fa, fa' r
   fa, fa' r
   re re re

   %144
   re re re
   mib mib mib\mbreak
   mib mib mib

   %147
   fa fa fa
   fa fa fa
   sol sol sol

   %150
   sol sol sol
   fa fa fa
   fa fa fa

   %153
   fa fa fa
   fa fa fa\mbreak
   fa fa fa

   %156
   fa fa fa
   fa4 r8
   sib, fa' fa,

   %159
   sib4 r8
   sib'8 sib16 do re sib  %%%% ripresa
   la8 fa16 sol la fa

   %162
   sol8 sol16 la sib sol
   fa8 re16 mib fa re
   mib8 mib16 fa sol la

   %165
   sib4.~
   sib\mbreak
   re,16 sib fa' re sib' fa

   %168
   re sib fa' re sib' fa
   sib,8\pp^\markup\italic"Senza Cembali" (fa' la,)
   sib(mib fa)

   %171
   sib,(fa' fa,)
   sib(reb fa)
   sib, fa' la,

   %174
   sib mib fa
   sib, fa' fa,
   sib4\fermata r8

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key sib\major
   \time 3/8
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 4. = 60
   s4.*176
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

IIIvlIrip= {
   \IIIglobal
   <<\IIIvlIripn \forma>>

}

IIIvlIIrip = {
   \IIIglobal
   <<\IIIvlIIripn \forma>>

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
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #3

  }

  \markup\huge "[1.] All[egr]o"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino I"\vspace #-0.2"obbligato]"}
          \IvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino II"\vspace #-0.2"obbligato]"}
          \IvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino I"\vspace #-0.2"ripieno]"}
          \IvlIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino II"\vspace #-0.2"ripieno]"}
          \IvlIIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"[Viola]"}
          \Ivla
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \Ibc

        >>
      >>

    }

    \layout {

      indent = 1.7\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

}

\bookpart {

  \paper  {

    systems-per-page = #4

  }

  \markup\huge "[2.] Largo"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino I"\vspace #-0.2"obbligato]"}
          \IIvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino II"\vspace #-0.2"obbligato]"}
          \IIvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violini [I e II"\vspace #-0.2"di ripieno]"}
          \IIvlIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"Viola"}
          \IIvla
        >>
      >>

    }

    \layout {

      indent = 1.7\cm

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

}

\bookpart {

  \paper  {

    systems-per-page = #3

  }

  \markup\huge "[3.] All[egr]o molto"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlIIrip
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"cello"
          \IIIbc

        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

}



