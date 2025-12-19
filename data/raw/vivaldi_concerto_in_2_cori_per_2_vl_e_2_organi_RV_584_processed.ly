\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tasto = _\markup\italic "Tasto Solo"

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
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza\terzine
}

IvlIn =  \relative do'' {

   fa,4 r8 r16 do' fa,4 r8 r16 do'
   fa,4 r16\fermata fa'-. la-. la,-. \appoggiatura la8 sib4 r16\fermata sib-. re-. fa,-.
   \appoggiatura fa8 mi4 r16\fermata re'-. do-. mi,-. \appoggiatura mi8\p fa2\fermata

   %4
   R1*3
   do''8[sib16 la sol fa mi re ] do[sib la sol fa mi re do]\mbreak
   sib4 r r2

   %9
   la''8[sol16 fa mi re do sib] la[sol fa mi re do sib la]
   sol4 r r2
   \tuplet 3/2 { do'16(la do) do[(la do)] do(la do) do[(la do)] re(sib re) re[(sib re)] re(sib re) re[(sib re)]}

   %12
   do4 r r2
   r16 fa-. sol-. la-. fa do re la \appoggiatura la8 sib4 r\mbreak
   r16 la' sib do la mi fa dod \appoggiatura dod8 re4 r

   %15
   r8 do? sol mi do4 sib!\tr
   la r la'32\p(sib do8.) sib32(do re8.)
   do8 fa, r4 r8 fa'[sol8.\tr fa32 mi]

   %18
   fa8 la, sib4\tr la r
   r2 r16 mib'-.(mib-. re-. re-. dod-. dod-. re-.)
   re fa-.(fa-. mi?-. mi-. red-. red-. mi-.) mi sol-.(sol-. fa-. fa-. mi-. mi-. fa-.)

   %21
   fa4~fa16 mi32 re do16 sib\mbreak la8[fa'16. sol32] sol4\tr
   fa r r2
   R1

   %24
   r2 r16 do\f la fa la, do' la fa
   sib, do' la fa sib,8[do] fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi]
   fa16 do' la fa sib,8[do] fa'32\solo do la do fa[sol la sol] fa do la do fa[sol la fa]

   %27
   sol mi do mi sol[la sib la] sol mi do mi sol[la sib sol] la fa do fa la[sib do sib] la fa do fa la[sib do la]
   sib16-.(sib-. sib-. sib-.) do,8.\tr re32 mi fa8 fa, r4
   R1*2

   %31
   r2  r16 fa'' fa8~fa16 mi32 re mi16 dod
   re32(dod re dod re[dod re dod)] re8 r r16 mi mi8~mi16 re32 do? re16 si
   do32(si do si do[si do si)] do8 r r16 re re8~re16 do32 si do16 la

   %34
   mi,32 (si' sold') la sold16\noBeam r mi,32(do' la') si la16\noBeam r sold,32(mi' si') do si16\noBeam r la,32(mi' do') re do16\noBeam r
   do8\tr si r4\mbreak do8\tr si r4
   r2 r32 re, fa la re[la fa re] re' re, fa la re[la fa re]

   %37
   si'4 r r2
   r32 fa la do fa[do la fa] fa' fa, la do fa [do la fa] re'4 r\mbreak
   R1

   %40
   r2 r32 sib, mi sold la[do, mi la] do8 r
   r2 r32 do si do mi,[do' si do] mi,8 si'\tr
   la4 r \tuplet 3/2 {
      mi16^\tu(do mi) mi[(do mi)]  mi(do mi) mi[(do mi)]

      %43
      fa(re fa) \slurDashed fa[(re fa)] fa(re fa) fa[(re fa)]\mbreak
   } mi, mi' do la do,16 mi' do la
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]
   la16 mi' do la re,8 mi\slurSolid la,8 r16 la''\solo la8.[(sib!32 do)]

   %46
   sib!8 r16 si si8.[(do32 re)] do8 r16 dod dod8.[(re32 mi)]
   re8 r16 red red8~red32 mi fad red mi4\tr r
   R1\mbreak

   %49 OK fine p. 10
   r2 r8 r32 mi, sold si sold[mi sold si] sold mi sold si
   do,4 r r8 r32 fa si re si[fa si re] si fa si re
   mi,4 r r8 r32 la re fa re[la re fa] re la re fa

   %52
   si,8.(do32 re) do8.[(re32 mi)] re8.(mi32 fa) mi8.[(fa32 sol)]
   si,8.(do32 re) do8.[(re32 mi)] re8.(mi32 fa) mi8.[(fa32 sol)]\mbreak
   mi4\tr re r2

   %55
   R1*5
   mi16-.(mi-. mi-. mi-.)  mi8.\tr re32 do mi16-.(mi-. mi-. mi-.)  mi8.\tr re32 do
   mi16-.(mi-. mi-. mi-.)  mi16[re32 do re16 si] do4 r

   %62
   R1 %%%% fine p.13
   do,8^\tu r16 do sol8 r16 do fa,4 r32 fa sol la sib! do re mi
   fa8.[sib,16 sol8. do16] la8 fa r4

   %65
   do''8[sib16 la sol fa mi re] do[sib la sol fa mi re do]
   sib''8[la16 sol fa mi re do] sib[la sol fa mi re do sib]
   la[do'] \tuplet 3/2 { do(la do) do[(la do)] do[(la do)] \slurDashed re(sib re) re[(sib re)] re(sib re) re[(sib re)]}\slurSolid

   %68
   do4 r8 do\p\mbreak fa,8.(sol32la) sol8.[(la32 sib)]
   la8.(sib32 do) sib8.[(do32 re)] do8[fa sol8.\tr fa32 mi]
   fa8[do sol'8.\tr fa32 mi] fa16 do\f la fa la, do' la fa

   %71
   sib, do' la fa sib,8[do] <<
      {
         fa16\solo fa'32 fa fa[fa fa fa] fa fa fa fa fa fa fa fa
         fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa16 fa fa8
      }\\{
         s16 do32[do] do do do do do[la do do] do do do do
         do[la do do] do do do do do[la do do] do do do do do16[la la8]
      }
   >> r4\mbreak

   %73
   <<
      {
         la'32 la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la
         la16 la la8
      }\\{
         fa32[do fa fa] fa fa fa fa fa[do fa fa] fa fa fa fa  fa[do fa fa] fa fa fa fa  fa[do fa fa] fa fa fa fa
         fa16 do do8
      }
   >> r4 <<{do'32 do do do do do do do do do do do do do do do}\\{la[fa la la] la la la la la[fa la la] la la la la}>>

   %75
   re16-.(mi-. fa-. sol-. la8-.) si,  do16-.(re-. mi-. fa-. sol8-.) la,
   si16-.(do-. re-. mi-. fa8-.) sol,  la16-.(si-. do-. re-. mi8-.) fa,
   sol16-.(la-. si-. do-. re8-.) fa,\mbreak fa\tr [mi] sib'?~sib32 la sol fa

   %78
   mi8~mi32 fa sol la sib8~sib32 sol fa mi la8 fa r4
   R1*2
   r2 r16 do' [\appoggiatura {sib16[do]} re do] r4

   %82
   r16 do[\appoggiatura {sib16[do]} re do] r4 r16 do32(sib) do(sib) do(sib) la8\noBeam r
   r16 do32(sib) do(sib) do(sib) la8\noBeam r r16 do sib8\tr la\noBeam r
   r16 do sib8\tr la\noBeam r r2

   %85
   R1*3
   r32 do, re mi fa sol la si do8 r r2
   sol4\tr~sol8~sol32[la sib! sol] la4\tr~la8~la32[sib do la]

   %90
   sol4\tr~sol8~sol32[la sib sol]  la16 sib do la sol4\tr
   fa r r2
   r r16 la32[sib do16 la32 sib] do8 r

   %93
   r la16. sib32 sol4\tr fa r\mbreak
   r16 do\f la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do

   %96
   fa1\fermata

}

IvlIIn = \relative do'' {

   fa,4 r8 r16 do' fa,4 r8 r16 do'
   fa,4 r16\fermata fa'-. la-. la,-. \appoggiatura la8 sib4 r16\fermata sib-. re-. fa,-.
   \appoggiatura fa8 mi4 r16\fermata re'-. do-. mi,-. \appoggiatura mi8\p fa2\fermata

   %4
   R1*3
   do''8[sib16 la sol fa mi re ] do[sib la sol fa mi re do]\mbreak
   sib4 r r2

   %9
   la''8[sol16 fa mi re do sib] la[sol fa mi re do sib la]
   sol4 r r2
   \tuplet 3/2 { la'16(fa la) la[(fa la)] la(fa la) la[(fa la)]  \slurDashed sib (fa sib) sib[(fa sib)] sib (fa sib) sib[(fa sib)]}\slurSolid

   %12
   la4 r r2
   r16 fa'-. sol-. la-. fa do re la \appoggiatura la8 sib4 r\mbreak
   r16 la' sib do la mi fa dod \appoggiatura dod8 re4 r

   %15
   r8 do? sol mi do4 sib!\tr
   la r fa'32\p(sol la8.) sol32(la sib8.)
   la8 fa r4 r8 la[sib8.\tr la32 sol]

   %18
   la8 fa sol4\tr fa r
   r2 r16 mib'-.(mib-. re-. re-. dod-. dod-. re-.)
   re fa-.(fa-. mi?-. mi-. red-. red-. mi-.) mi sol-.(sol-. fa-. fa-. mi-. mi-. fa-.)

   %21
   fa4~fa16 mi32 re do16 sib\mbreak la8[fa'16. sol32] sol4\tr
   fa r r2
   R1

   %24
   r2 r16 do\f la fa la, do' la fa
   sib, do' la fa sib,8[do] fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi]
   fa16 do' la fa sib,8[do] fa4 r

   %27
   R1*4
   r2 r8 do'\p do r
   r re sib r r sib sib r

   %33
   r do la r r la la r
   mi16\p fad sold mi la, si do la mi' fad sold mi la, si do la
   R1

   %36
   r2 re'8\p re re re
   re4 r r2
   re8\p re re re re4 r\mbreak

   %39 OOOO KKKKKK fine p. 8
   R1*3
   r2 \tuplet 3/2 {
      do16(la do) do[(la do)] do(la do) do[(la do)]
      re(si re) \slurDashed re[(si re)] re(si re) re[(si re)]
   }\slurSolid do,16 mi' do la do,16 mi' do la

   %44
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]
   la16 mi' do la re,8 mi\slurSolid la,4 r
   R1*3\mbreak

   %49
   r2 si8\p si si si
   mi4 r re8 re re re
   sol4 r fa8 fa fa fa

   %52
   R1*8
   r16 sol\p sol sol r sol sol sol r sol sol sol r sol sol sol
   r sol sol sol r mi fa sol do,4 r

   %62
   R1
   do'8 r16 do sol8 r16 do fa,4 r32 fa sol la sib! do re mi
   fa8.[sib,16 sol8. do16] la8 fa r4

   %65
   la'8[sol16 fa mi re do sib] la[sol fa mi re do sib la]
   sol''8[fa16 mi re do sib la] sol[fa mi re do sib la sol]
   la[la'] \tuplet 3/2 { la(fa la) la[(fa la)] la(fa la) sib[(sol sib)]\slurDashed sib(sol sib) sib[(sol sib)] sib(sol sib) }

   %68
   la4 r\mbreak  r2
   \slurSolid fa8.(sol32 la) sol8.(la32 sib) la8 la sib8.\tr la32 sol
   la8 la sib8.\tr la32 sol la16 do\f la fa la, do' la fa

   %71
   sib,16 do' la fa sib,8 do fa16 do'\p do do r do do do
   r do do do r do do do do4 r\mbreak
   r16 do do do r do do do r do do do r do do do

   %74
   do4 r r16 do do do r do do do
   fa,8\p fa fa fa mi mi mi mi
   re re re re do do do do

   %77
   si si si si\mbreak do do do do
   do do do do fa4 r
   R1*15

   %94
   r16 do'\f la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do
   fa1\fermata

}


IvlIIIn = \relative do'' {

   fa,4 r8 r16 do' fa,4 r8 r16 do'
   fa,4 r16\fermata fa'-. la-. la,-. \appoggiatura la8 sib4 r16\fermata sib-. re-. fa,-.
   \appoggiatura fa8 mi4 r16\fermata re'-. do-. mi,-. \appoggiatura mi8\p fa2\fermata

   %4
   R1*3
   do''8[sib16 la sol fa mi re ] do[sib la sol fa mi re do]\mbreak
   sib4 r r2

   %9
   la''8[sol16 fa mi re do sib] la[sol fa mi re do sib la]
   sol4 r r2
   \tuplet 3/2 { la'16(fa la) la[(fa la)] la(fa la) la[(fa la)]  \slurDashed sib (fa sib) sib[(fa sib)] sib (fa sib) sib[(fa sib)]}\slurSolid

   %12
   la4 r r2
   r16 fa'-. sol-. la-. fa do re la \appoggiatura la8 sib4 r\mbreak
   r16 la' sib do la mi fa dod \appoggiatura dod8 re4 r

   %15
   r8 do? sol mi do4 sib!\tr
   la r fa'32\p(sol la8.) sol32(la sib8.)
   la8 fa r4 r8 la[sib8.\tr la32 sol]

   %18
   la8 fa sol4\tr fa r
   r2 r16 mib'-.(mib-. re-. re-. dod-. dod-. re-.)
   re fa-.(fa-. mi?-. mi-. red-. red-. mi-.) mi sol-.(sol-. fa-. fa-. mi-. mi-. fa-.)

   %21
   fa4~fa16 mi32 re do16 sib\mbreak la8[fa'16. sol32] sol4\tr
   fa r r2
   R1

   %24
   r2 r16 do\f la fa la, do' la fa
   sib, do' la fa sib,8[do] fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi]
   fa16 do' la fa sib,8[do] fa4 r

   %27
   R1*4
   r2 r8 la\p la r
   r fa re r r sol sol r

   %33
   r mi do r r fa fa r
   mi16\p fad sold mi la, si do la mi' fad sold mi la, si do la
   R1

   %36
   r2 la'8\p la la la
   si4 r r2
   la8\p la la la si4 r\mbreak

   %39 OOOO KKKKKK fine p. 8
   R1*3
   r2 \tuplet 3/2 {
      do16(la do) do[(la do)] do(la do) do[(la do)]
      re(si re) \slurDashed re[(si re)] re(si re) re[(si re)]
   }\slurSolid do,16 mi' do la do,16 mi' do la

   %44
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]
   la16 mi' do la re,8 mi\slurSolid la,4 r
   R1*3\mbreak

   %49
   r2 si8\p si si si
   mi4 r re8 re re re
   sol4 r fa8 fa fa fa

   %52
   R1*8
   r16 mi\p mi mi r mi mi mi r mi mi mi r mi mi mi
   r mi mi mi r mi fa sol do,4 r

   %62
   R1
   do'8 r16 do sol8 r16 do fa,4 r32 fa sol la sib! do re mi
   fa8.[sib,16 sol8. do16] la8 fa r4

   %65
   la'8[sol16 fa mi re do sib] la[sol fa mi re do sib la]
   sol''8[fa16 mi re do sib la] sol[fa mi re do sib la sol]
   la[la'] \tuplet 3/2 { la(fa la) la[(fa la)] la(fa la) sib[(sol sib)]\slurDashed sib(sol sib) sib[(sol sib)] sib(sol sib) }

   %68
   la4 r\mbreak  r2
   \slurSolid fa8.(sol32 la) sol8.(la32 sib) la8 la sib8.\tr la32 sol
   la8 la sib8.\tr la32 sol la16 do\f la fa la, do' la fa

   %71
   sib,16 do' la fa sib,8 do fa16 la\p la la r la la la
   r la la la r la la la la4 r\mbreak
   r16 la la la r la la la r la la la r la la la

   %74
   la4 r r16 la la la r la la la
   fa8\p fa fa fa mi mi mi mi
   re re re re do do do do

   %77
   si si si si\mbreak do do do do
   do do do do fa4 r
   R1*15

   %94
   r16 do'\f la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do
   fa1\fermata

}

IvlaIn = \relative do'{

   fa4 r fa r
   fa r fa r
   sol, r do2\p\fermata

   %4
   R1*3
   fa8 fa fa fa fa fa fa la,\mbreak
   mi'4 r r2

   %9
   do8 do do do do do do la
   sib4 r r2
   fa8 fa fa fa fa fa fa fa

   %12
   fa4 r r2
   do'8 do do la' re,4 r\mbreak
   r8 mi mi la fa4 r

   %15
   r8 do' sol mi do4 sib!\tr
   la r do8\p do mi sol
   la do, r4 r8 fa re mi

   %18
   do do do do do4 r
   r2 r4 mi8 mi
   la r fad fad si r sol sol

   %21
   do la re, sol\mbreak do, fa re mi
   do4 r r2
   R1

   %24
   r2 r16 do'\f la fa la, do' la fa
   sib, do' la fa sib,8[do] fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi]
   fa16 do' la fa sib,8[do] fa4 r

   %27
   R1*4
   r2 r8 fa\p fa r
   r sib, sib r r mi mi r

   %33
   r la, la r r re re r
   mi16\p fad sold mi la, si do la mi' fad sold mi la, si do la
   R1

   %36
   r2 fa'8\p fa fa fa
   sol4 r r2
   fa8\p fa fa fa sold,4 r\mbreak

   %39
   R1*3
   r2 do'8 do do do
   si si si si\mbreak do16 mi do la do,16 mi' do la

   %44
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]
   la16 mi' do la re,8 mi la,4 r
   R1*3

   %49  inizio p. 11 %%%%%%%% OOOOO  KKKKKKKK
   r2 sold8\p sold sold sold
   la4 r si8 si si si
   do4 r re8 re re re

   %52
   R1*8
   r16 do\p do do r do do do r do do do r do do do
   r do do do r mi fa sol do,4 r

   %62
   R1
   do8 r16 do'  sol8 r16 do fa,4 r32 fa sol la sib! do re mi
   fa8.[sib,16 sol8. do16] la8 fa r4

   %65
   do8 do do do do do do do
   mi mi mi mi mi mi mi mi
   do la' la la sol sol sol sol

   %68
   la  la la la\p \mbreak do, do mi[mi]
   do do mi[mi] la do, re do
   do do re do do16 do'\f la fa la, do' la fa sib,

   %71
   do' la fa sib,8 do fa,16 fa'\p fa fa r fa fa fa
   r fa fa fa r fa fa fa fa4 r\mbreak
   r16 fa fa fa r fa fa fa r fa fa fa r fa fa fa

   %74
   fa4 r r16 fa fa fa r fa fa fa
   fa8\p fa fa fa mi mi mi mi
   re re re re do do do do

   %77
   si si si si do do do do
   do do do do fa4  r
   R1*15

   %94
   r16 do' la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do
   fa,1\fermata

}

ImdIn = \relative do'' {
   \override TupletBracket.bracket-visibility = ##f

   s1*27
   s2  fa32\solo do la do fa[sol la sol] fa do la do fa[sol la fa]
   sol mi do mi sol[la sib la] sol mi do mi sol[la sib sol ]la fa do fa la[sib do sib] la fa do fa la[sib do la]

   %30
   \slurDashed sib16-\parenthesize-.(sib-\parenthesize-. sib-\parenthesize-. sib-\parenthesize-.) \slurSolid do,8.\tr re32 mi fa8 fa, r4
   R1*4
   r4 do''8^\markup {[\musicglyph #"scripts.trill"]} si  r4 do8\tr si

   %36
   R1
   r2 r32 do, mi sol do[ sol mi do] do' do, mi sol do[sol mi do]
   la'4 r r2\mbreak

   %39
   r16 do do do r do do do si si si si r si si si
   la la la la r la la la sold4 s
   r32 la, do mi la[do, mi la] do8 r s2

   %42
   r32 do si do mi, [do' si do] mi,8 si'\tr la4 s
   s1*5
   R1*4

   %52
   s1*2
   s2 \tuplet 3/2 {
      do,16 mi sol do[sol mi] do mi sol do[sol mi]
      la la la la[la la] la la la la[la la] si, re sol si[sol re] si re sol si[sol re]

      %56
      sol sol sol sol[sol sol] sol sol sol sol[sol sol] la, do fa la[fa do] la do fa la[fa do]
      fa fa fa fa[fa fa] fa fa fa fa[fa fa] sol, si re sol[re si] sol si re sol[re si]\mbreak
   }
   mi sol do r r fa, si r r mi, la r r re, sol r

   %59
   r do, fa r r si, mi r r la, re r r re sol re
   mi4  r r2
   r sol16 sol sol sol sol8.\tr  fa32 mi

   %62
   sol16 sol sol sol sol8.\tr fa32 mi sol16 sol sol sol do mi, fa re\mbreak
   do4 s s2
   s1*7

   %71
   s2 s4 r
   R1*6
   r2 do32 la do fa do[la do fa] do la do fa do[la do fa]

   %79
   mi do mi sol mi[do mi sol] mi do mi sol mi[do mi sol] fa do fa la fa[do fa la]fa do fa la fa[do fa la]
   sol mi sol sib sol[mi sol sib] sol mi sol sib sol[mi sol sib] la fa la do la[fa la do]  la fa la do la[fa la do]\mbreak
   sol mi sol sib sol[mi sol sib]  sol mi sol sib sol[mi sol sib] la4 r16 la [\appoggiatura {sol16[la]} sib la]

   %82
   r4 r16 la [\appoggiatura {sol16[la]} sib la] r4 r16 la32(sol) la(sol) la(sol)
   fa8 r r16 \slurDashed la32 (sol) la (sol) la (sol) \slurSolid fa8 r r16 la sol8\tr
   fa r r16 la sol8\tr \con \tuplet 3/2 {
      fa16 fa la r fa la \senza r fa la r fa la

      %85
      r mi sol r mi sol r mi sol r mi sol\mbreak r la do r la do r la do r la do
      r sol sib r sol sib r sol sib r sol sib  r sol sib r sol sib r sol sib r sol sib
      r fa la r fa la r fa la r fa la r fa la r fa la r fa la r fa la
   }

   %88
   mi4 r r32 do re mi fa sol la si do8 \noBeam r\mbreak
   mi,4\tr~mi8~mi32[ fa sol mi] fa4\tr~fa8~fa32[sol la fa]
   mi4\tr~mi8~mi32[ fa sol mi] fa16 sol la fa mi4\tr

   %91
   fa4 r r2
   r r16 fa32 sol la16 fa32 sol la8\noBeam r
   r8 fa16. sol32 mi4\tr fa r\mbreak

   %94
   s1*3

}

ImsIn = \relative do {

   fa4 r fa r
   fa r re r
   do r la2\p\fermata

   %4
   R1*3
   la'8 la la la la la la la\mbreak
   sol4 r r2

   %9
   fa8 fa fa fa fa fa fa fa
   mi4 r r2
   fa8 fa fa fa fa fa fa fa

   %12
   fa4 r r2
   fa8 fa fa fa sol4 r\mbreak
   r8 la la la sib4 r

   %15
   r8 do sol mi do4 sib!\tr
   la r fa'8\p fa sol mi
   fa fa, r4 r8 fa' sib, do

   %18
   fa fa mi mi fa4 r
   r2 r4 la8 sol
   fa r si la sol r do sib?

   %21
   la fa sib, mi\mbreak fa re sib do
   fa,4 r r2
   R1

   %24
   r2 r16 do''\f la fa la, do' la fa
   sib, do' la fa sib,8 do fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi
   fa16 do' la fa sib,8 do fa, r fa' r

   %27
   do r do r\mbreak fa r fa r
   do r do r fa, r fa' r
   do r do r fa r fa r

   %30
   do r do r fa,4 r   %%%%%% fine p. 6
   R1*4
   la'8 mi la[mi]\mbreak la8 mi la[mi]

   %36
   R1
   r2 mi8 mi mi mi
   fa4 r r2\mbreak %% fine p. 8

   %39  OOOOOKKKKKK
   la,8 r la r mi' r dod r
   re r re r mi r la, r
   r la la4 r8 la mi' mi,

   %42
   la la mi'[mi,] la la' la la
   sold sold sold sold\mbreak la16  mi' do la do,16 mi' do la
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]

   %45
   la16 mi' do la re,8 mi la,16\tasto sib do sib la sib do la
   re re' fa, re mi fad sold mi la sold la sib! la sol? fa? mi
   fa re sib' do sib do sib la sold la la,8 r4

   %48
   R1*4
   sol'16 sol,  r8 sol'16 sol, r8  sol'16 sol,  r8 sol'16 sol, r8
   sol'16 sol,  r8 sol'16 sol, r8  sol'16 sol,  r8 sol'16 sol, r8\mbreak

   %54
   sol'16 sol,  r8 sol'16 sol, r8 mi' mi mi mi
   fa fa fa fa sol sol sol sol
   mi mi mi mi fa fa fa fa

   %57
   re re re re sol sol sol sol\mbreak
   do, r16 sol' fa8 r16 fa mi8 r16 mi re8 r16 re
   do8 r16 do si8\noBeam r16 si la8\noBeam r16 la sol8\noBeam r16 sol

   %60
   do4 r r2
   r r16 do do do r do do do
   r do do do r do do do r do do do r do fa sol\mbreak

   %63
   do,8 r16 do' sol8 r 16 do fa,4 r32 fa sol la sib! do re mi
   fa8.[sib,16 sol8. do16] la8 fa r4
   fa8 fa fa fa fa fa fa fa

   %66
   sol mi mi mi mi mi mi mi
   fa fa fa fa mi mi mi mi
   fa fa fa fa\p\mbreak fa fa do do

   %69
   fa fa do do fa fa sib, do
   fa, fa' sib, do fa16 do'\f la fa la, do' la fa sib,
   do' la fa sib,8 do fa,4 r

   %72
   R1*6
   r2 fa'8 fa fa fa
   do1\tasto~

   %80
   do~\mbreak
   do2 fa,8 r fa r
   fa r fa r fa r fa r

   %83
   fa r fa r fa r fa r
   fa r fa r fa16 r fa r fa r fa r
   do'8 do do do\mbreak fa fa fa fa,

   %86
   do' do do do dod dod dod dod
   re re re re sol si, si si
   do r do r do r do r\mbreak

   %89
   r16 do do do do4 r16 fa fa fa fa4
   r16 do do do do4 r16 do fa fa do'8[do,]
   fa,4 r r2

   %92
   r r16 fa' fa fa fa8 r
   r8fa do' do, fa4 r\mbreak
   r16 do'\f  la fa la, do' la fa sib, do' la fa sib,8 do

   %95
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do
   fa,1\fermata

}

IbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1
   s2 <6>
   s1*7
   <6 5>1
   s2 <6 4>
   <5 3> s
   s1
   s4 s8 <6 _+> s2
   s1
   s2 s4 s8 <7 5>
   s1
   s4 <6 5> s2
   s s4 <_+>
   s <_+> s2
   s1*7
   <7>1
   s
   <7>
   s1*4
   s8 <_+> s <_+> s2
   s1*3
   s2 <_+>4 <7>
   <_+> <_-> <_+> s
   s1
   s
   <7 5>
   s1
   s
   <6->8 s16 <6!> <3+>4 s <_+>
   s <_+> s2
   s1*4
   <_!>4 <6 4> <5 3!> <6 4>
   <5 3!> <6 4> <5 3!> <6 4>
   <6 4> <5 3!> s2
   s <_!>
   s1
   s2 <_!>
   s1*8
   <6>8 <6 5> s4 s2
   s <7 5>
   s1*19
   s2 <_!>

}

IvlIVn =  \relative do'' {

   R1*3
   fa,4 r8 r16 do' fa,4 r8 r16 do'
   fa,4 r16\fermata fa'-. la-. la,-. \appoggiatura la8 sib4 r16\fermata sib-. re-. fa,-.

   %6
   \appoggiatura fa8 mi4 r16\fermata re' do mi, \appoggiatura mi8 fa2\fermata\p
   R1
   sib'8[la16 sol fa mi re do] sib[la sol fa mi re do sib]

   %9
   la4 r r2
   sol''8[fa16 mi re do sib la] sol[fa mi re do sib la sol]
   fa'4 r r2

   %12
   \tuplet 3/2 { do'16(la do) do[(la do)] do(la do) do[(la do)] re(sib re) re[(sib re)] re(sib re) re[(sib re)]}
   do4 r r16 sol'-. la-. sib-. sol re mi si\mbreak
   \appoggiatura si8 do4 r r16 sib' do re sib fa sol re

   %15
   mi8 do sol mi do4 sib!\tr
   la r r2
   la'32\p(sib do8.) sib32(do re8.) do8 fa, r4

   %18
   r2 r8 fa'[sol8.\tr fa32 mi]
   fa8 la, sib4\tr la r
   R1*2

   %22
   fa'16-.(mib-. mib-. re-. re-. dod-. dod-. re-.) re-.(fa-. fa-. mi?-. mi-. red-. red-. mi-.)
   mi-.(sol-. sol-. fa-. fa-. mi-. mi-. fa-.) fa4~fa16 mi32 re do16 sib
   la8 fa'16. sol32 sol4\tr fa16 do\f la fa la, do' la fa

   %25
   sib, do' la fa sib,8 do fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi
   fa16 do' la fa sib,8 do fa4 r
   r2 fa'32\solo do la do fa[sol la sol] fa do la do fa[sol la fa]

   %28
   sol mi do mi sol[la sib la] sol mi do mi sol[la sib sol] la fa do fa la[sib do sib] la fa do fa la[sib do la]
   \slurDashed sib16-\parenthesize-.(sib-\parenthesize-. sib-\parenthesize-. sib-\parenthesize-.) \slurSolid do,8.\tr re32 mi fa8 fa, r4
   R1*2

   %32
   r16 sib' sib8~sib16 la32 sol la16 fad sol32[(fad sol fad] sol fad sol fad) sol8\noBeam r
   r16 la la8~la16 sol32 fa? sol16 mi fa32[(mi fa mi] fa mi fa mi) fa8\noBeam r
   r2 mi,32(si' sold') la sold16\noBeam r mi,32[(do' la') si] la16  r

   %35
   la8\tr sold r4\mbreak la8\tr sold r4
   r32 la,[do mi] la mi do la la'[la, do mi] la mi do la fa'4 r
   R1

   %38
   r2 r32 si,[mi sold] si sold mi si si'[si, mi sold] si sold mi si\mbreak
   do4 r r2
   r r4 r32 la[do mi] la do, mi la

   %41
   do8 r r4 r32 la[sold la] mi la sold la mi8[sold^\markup {[\musicglyph #"scripts.trill"]}]
   la4 r \tuplet 3/2 {
      mi16^\tu(do mi) mi[(do mi)]  mi(do mi) mi[(do mi)]
      fa(re fa) \slurDashed fa[(re fa)] fa(re fa) fa[(re fa)]\mbreak
   } mi, mi' do la  do,16 mi' do la

   %44
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]
   la16 mi' do la re,8 mi\slurSolid la,4 r
   R1

   %47
   r2  r8 r16 la'' \solo la8.[(sib!32 do)]
   sib!8 r16 si si8.[(do32 re)] do8 r16 dod dod8.[(re32 mi)]
   re8 r16 red red8~red32 mi fad red mi4\tr r

   %50 OOOO KKKK
   r8 r32 mi,la do la mi la do la[mi la do] re,4 r
   r8 r32 sol[do mi] do sol do mi do[sol do mi] fa,4 r
   r2 si8.(do32 re) do8.[(re32 mi)]

   %53
   re8.(mi32 fa) mi8.[(fa32 sol)] si,8.(do32 re) do8.\tr[(re32 mi)]\mbreak
   do4\tr si r2
   R1*5

   %60
   do16-.(do-. do-. do-.) do8.\tr mi,16 do'16-.(do-. do-. do-.) do8.\tr mi,16
   do'16-.(do-. do-. do-.) do mi, fa re do4 r
   R1

   %63
   do8 r16 do sol8 r16 do fa,4 r32 fa [sol la sib! do re mi]
   fa8.[sib,16 sol8. do16] la8 fa r4
   do''8[sib16 la sol fa mi re] do[sib la sol fa mi re do]

   %66
   sib''8[la16 sol fa mi re do] sib[la sol fa mi re do sib]
   la[do'] \tuplet 3/2 { do(la do) do[(la do)] do[(la do)] \slurDashed re(sib re) re[(sib re)] re(sib re) re[(sib re)]}\slurSolid
   do4 r8 do\p\mbreak fa,8.(sol32la) sol8.[(la32 sib)]

   %69
   la8.(sib32 do) sib8.[(do32 re)] do8[fa sol8.\tr fa32 mi]
   fa8[do sol'8.\tr fa32 mi] fa16 do\f la fa la, do' la fa
   sib, do' la fa sib,8[do] fa4 r

   %72
   r2 <<{fa'32\solo[fa fa fa] fa fa fa fa fa[fa fa fa] fa fa fa fa}\\{do la do do do[do do do] do la do do do[do do do]}>>
   <<{fa[fa fa fa] fa fa fa fa fa[fa fa fa] fa fa fa fa fa16 fa fa8}\\{do32 la do do do[do do do] do la do do do[do do do] do16 la la8}>> r4
   <<{la'32 la la la la[la la la] la la la la la[la la la] la la la la la[la la la] la la la la la[la la la]}\\{fa do fa fa fa[fa fa fa] fa do fa fa fa[fa fa fa] fa do fa fa fa[fa fa fa] fa do fa fa fa[fa fa fa]}>>

   %75
   la16-.( do-. re-. mi-. fa8-.) re sol,16-.(si-. do-. re-. mi8-.) do
   fa,16-.(la-. si-. do-. re8-.) si mi,16-.(sol-. la-. si-. do8-.) la
   re,16-.(fa-. sol-. la-. si8-.) re,\mbreak re\tr do sol'~sol32 fa mi re

   %78
   do8~do32 re mi fa sol8~sol32 sib la sol fa8 fa, r4
   R1*2
   r2 r16 la' [\appoggiatura {sol16[la]} sib la] r4

   %82
   r16 la [\appoggiatura {sol16[la]} sib la] r4 r16 la32(sol) la (sol) la(sol) fa8\noBeam r
   r16 la32(sol) la (sol) la(sol) fa8\noBeam r r16 la sol8\tr fa\noBeam r
   r16 la sol8\tr fa\noBeam r r2

   %85
   R1*3
   r4 r32 do re mi fa sol la si do8\noBeam r r4
   R1*2

   %91
   la4\tr~la8~la32[sib do la] sol4\tr~sol8~sol32[la sib sol]
   la16 sib do la sol4\tr fa r16 la32 sib do16 la32 sib
   do4 r r8 la16. sib32 sol4\tr \mbreak

   %94
   fa16 do\f la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do
   fa1\fermata

}

IvlVn = \relative do'' {

   R1*3
   fa,4 r8 r16 do' fa,4 r8 r16 do'
   fa,4 r16\fermata fa'-. la-. la,-. \appoggiatura la8 sib4 r16\fermata sib-. re-. fa,-.

   %6
   \appoggiatura fa8 mi4 r16\fermata re' do mi, \appoggiatura mi8 fa2\fermata\p
   R1
   sib'8[la16 sol fa mi re do] sib[la sol fa mi re do sib]

   %9
   la4 r r2
   sol''8[fa16 mi re do sib la] sol[fa mi re do sib la sol]
   fa'4 r r2

   %12
   \tuplet 3/2 { la16(fa la) la[(fa la)] la(fa la) la[(fa la)] sib(fa sib) sib[(fa sib)] sib(fa sib) sib[(fa sib)]}
   la4 r r16 sol'-. la-. sib-. sol re mi si\mbreak
   \appoggiatura si8 do4 r r16 sib' do re sib fa sol re

   %15
   mi8 do sol mi do4 sib!\tr
   la r r2
   fa'32\p(sol la8.) sol32(la sib8.) la8 fa r4

   %18
   r2 r8 la[sib8.\tr la32 sol]
   la8 fa sol4\tr fa r
   R1*2

   %22
   fa'16-.(mib-. mib-. re-. re-. dod-. dod-. re-.) re-.(fa-. fa-. mi?-. mi-. red-. red-. mi-.)
   mi-.(sol-. sol-. fa-. fa-. mi-. mi-. fa-.) fa4~fa16 mi32 re do16 sib
   la8 fa'16. sol32 sol4\tr fa16 do\f la fa la, do' la fa

   %25
   sib, do' la fa sib,8 do fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi
   fa16 do' la fa sib,8 do fa4 r
   R1*5

   %32
   r8 re'\p re r r sib sib r
   r do do r r la la r
   r2  mi16\p fad sold mi la, si do la

   %35
   R1  %%%%%%% fin qui OK
   la'8\p la la la la4 r
   R1

   %38
   r2 si8\p si si si\mbreak
   do4 r r2
   R1*2

   %42
   r2 \tuplet 3/2 {
      do16(la do) do[(la do)] do(la do) do[(la do)]
      re(si re) \slurDashed re[(si re)] re(si re) re[(si re)]
   }\slurSolid do,16 mi' do la do,16 mi' do la
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]

   %45
   la16 mi' do la re,8 mi\slurSolid la,4 r
   R1*4
   do8\p do do do re4 r

   %51
   mi8 mi mi mi la4 r
   R1*8
   r16 sol\p sol sol r sol sol sol r sol sol sol r sol sol sol

   %61
   r sol sol sol r mi fa sol do,4 r
   R1
   do'8 r16 do sol8 r16 do fa,4 r32 fa [sol la sib! do re mi]

   %64
   fa8.[sib,16 sol8. do16] la8 fa r4
   la'8[sol16 fa mi re do sib] la[sol fa mi re do sib la]
   sol''8[fa16 mi re do sib la] sol[fa mi re do sib la sol]

   %67
   la[la'] \tuplet 3/2 { la(fa la) la[(fa la)] la(fa la) sib[(sol sib)]\slurDashed sib(sol sib) sib[(sol sib)] sib(sol sib) }
   la4 r\mbreak  r2
   \slurSolid fa8.(sol32 la) sol8.(la32 sib) la8 la sib8.\tr la32 sol

   %70
   la8 la sib8.\tr la32 sol la16 do\f la fa la, do' la fa
   sib,16 do' la fa sib,8 do fa4 r
   r2 r16 do'\p do do r do do do\mbreak

   %73
   r do do do r do do do do4 r
   r16 do do do r do do do r do do do r do do do
   fa,8\p fa fa fa mi mi mi mi

   %76
   re re re re do do do do
   si si si si\mbreak do do do do
   do do do do fa4 r

   %79
   R1*15\mbreak
   fa'16 do\f la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do

   %96
   fa1\fermata

}


IvlVIn = \relative do'' {

   R1*3
   fa,4 r8 r16 do' fa,4 r8 r16 do'
   fa,4 r16\fermata fa'-. la-. la,-. \appoggiatura la8 sib4 r16\fermata sib-. re-. fa,-.

   %6
   \appoggiatura fa8 mi4 r16\fermata re' do mi, \appoggiatura mi8 fa2\fermata\p
   R1
   sib'8[la16 sol fa mi re do] sib[la sol fa mi re do sib]

   %9
   la4 r r2
   sol''8[fa16 mi re do sib la] sol[fa mi re do sib la sol]
   fa'4 r r2

   %12
   \tuplet 3/2 { la16(fa la) la[(fa la)] la(fa la) la[(fa la)] sib(fa sib) sib[(fa sib)] sib(fa sib) sib[(fa sib)]}
   la4 r r16 sol'-. la-. sib-. sol re mi si\mbreak
   \appoggiatura si8 do4 r r16 sib' do re sib fa sol re

   %15
   mi8 do sol mi do4 sib!\tr
   la r r2
   fa'32\p(sol la8.) sol32(la sib8.) la8 fa r4

   %18
   r2 r8 la[sib8.\tr la32 sol]
   la8 fa sol4\tr fa r
   R1*2

   %22
   fa'16-.(mib-. mib-. re-. re-. dod-. dod-. re-.) re-.(fa-. fa-. mi?-. mi-. red-. red-. mi-.)
   mi-.(sol-. sol-. fa-. fa-. mi-. mi-. fa-.) fa4~fa16 mi32 re do16 sib
   la8 fa'16. sol32 sol4\tr fa16 do\f la fa la, do' la fa

   %25
   sib, do' la fa sib,8 do fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi
   fa16 do' la fa sib,8 do fa4 r
   R1*5

   %32
   r8 fa\p fa r r sol sol r
   r mi mi r r fa fa r
   r2  mi16\p fad sold mi la, si do la

   %35
   R1  %%%%%%% fin qui OK
   mi'8\p mi mi mi  fa4 r
   R1

   %38
   r2 mi8\p mi mi mi\mbreak
   do'4 r r2
   R1*2

   %42
   r2 \tuplet 3/2 {
      do16(la do) do[(la do)] do(la do) do[(la do)]
      re(si re) \slurDashed re[(si re)] re(si re) re[(si re)]
   }\slurSolid do,16 mi' do la do,16 mi' do la
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]

   %45
   la16 mi' do la re,8 mi\slurSolid la,4 r
   R1*4
   do8\p do do do re4 r

   %51
   mi8 mi mi mi la4 r
   R1*8
   r16 mi\p mi mi r mi mi mi r mi mi mi r mi mi mi

   %61
   r mi mi mi r mi fa sol do,4 r
   R1
   do'8 r16 do sol8 r16 do fa,4 r32 fa [sol la sib! do re mi]

   %64
   fa8.[sib,16 sol8. do16] la8 fa r4
   la'8[sol16 fa mi re do sib] la[sol fa mi re do sib la]
   sol''8[fa16 mi re do sib la] sol[fa mi re do sib la sol]

   %67
   la[la'] \tuplet 3/2 { la(fa la) la[(fa la)] la(fa la) sib[(sol sib)]\slurDashed sib(sol sib) sib[(sol sib)] sib(sol sib) }
   la4 r\mbreak  r2
   \slurSolid fa8.(sol32 la) sol8.(la32 sib) la8 la sib8.\tr la32 sol

   %70
   la8 la sib8.\tr la32 sol la16 do\f la fa la, do' la fa
   sib,16 do' la fa sib,8 do fa4 r
   r2 r16 la\p la la r la la la\mbreak

   %73
   r la la la r la la la la4 r
   r16 la la la r la la la r la la la r la la la
   fa8\p fa fa fa mi mi mi mi

   %76
   re re re re do do do do
   si si si si\mbreak do do do do
   do do do do fa4 r

   %79
   R1*15\mbreak
   fa'16 do\f la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do

   %96
   fa1\fermata

}

IvlaIIn = \relative do'{

   R1*3
   fa4 r fa r
   fa r fa r

   %6
   sol, r do2_\markup {[\musicglyph #"p"]}\fermata
   R1
   mi8 mi mi mi mi mi mi mi

   %9
   do4 r r2
   sib8 sib sib sib sib sib sib sib
   la4 r r2

   %12
   fa8 fa fa fa fa fa fa fa
   fa4 r r8 re' re sol\mbreak
   mi4 r r8 fa fa sib

   %15
   sol do sol mi do4 sib!\tr
   la r r2
   do8\p do mi sol la do, r4

   %18
   r2 r8 fa re mi
   do do do do do4 r
   R1*2

   %22
   r4 mi8 mi la r fad fad
   si r sol sol do la re, sol
   do, fa re mi do16 do'\f la fa la, do' la fa

   %25
   sib, do' la fa sib,8 do fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi
   fa16 do' la fa sib,8 do fa,4 r
   R1*5  %%%%% inizio p. 7

   %32 OK
   r8 sib\p sib r r mi mi r
   r la, la r r re re r
   r2 mi16\p fad sold mi la, si do la

   %35
   R1
   do8\p do do do re4 r
   R1

   %38
   r2 sold,8\p sold sold sold\mbreak
   \parenthesize la4 r r2
   R1*2

   %42
   r2 do'8 do do do
   si si si si\mbreak la16 mi' do la do,16 mi' do la
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]

   %45
   la16 mi' do la re,8 mi la,4 r
   R1*4
   la8\p la la la si4 r

   %51
   do8 do do do re4 r
   R1*8
   r16 do\p do do r do do do r do do do r do do do

   %61
   r do do do r mi fa sol do,4 r
   R1
   do8 r16 do' sol8 r 16 do fa,4 r32 fa sol la sib! do re mi

   %64
   fa8.[sib,16 sol8. do16] la8 fa r4
   fa8 fa fa fa fa fa fa fa
   sol mi mi mi mi mi mi mi

   %67
   fa fa fa fa mi mi mi mi
   fa fa fa fa\p\mbreak fa fa do do
   fa fa do do fa fa sib, do

   %70
   fa, fa' sib, do fa16 do'\f la fa la, do' la fa sib,
   do' la fa sib,8 do fa,4 r
   r2 r16 fa'\p fa fa r fa fa fa\mbreak

   %73
   r fa fa fa r fa fa fa fa4 r
   r16 fa fa fa r fa fa fa r fa fa fa r fa fa fa
   fa8\p fa fa fa mi mi mi mi

   %76
   re re re re do do do do
   si si si si\mbreak do do do do
   do do do do fa4 r

   %79
   R1*15
   r16 do'\f la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do

   %96
   fa,1\fermata

}

ImdIIn = \relative do'' {
   \override TupletBracket.bracket-visibility = ##f

   R1*3
   s1*25
   s2 fa32\solo do la do fa[sol la sol] fa do la do fa[sol la fa]

   %30
   sol mi do mi sol[la sib la] sol mi do mi sol[la sib sol] la fa do fa la[sib do sib] la fa do fa la[sib do la]\mbreak
   \slurDashed sib16-\parenthesize-.(sib-\parenthesize-. sib-\parenthesize-. sib-\parenthesize-.) \slurSolid do,8.\tr re32 mi fa8 fa, r4
   R1*3

   %35
   r4 la'8\tr sold\mbreak r4 la8\tr sold
   R1
   r32 sol, si re sol[re si sol] sol' sol, si re sol[re si sol] mi'4 r

   %38
   R1
   r16 la la la r la la la sold sold sold sold r sol sol sol
   fad fad fad fad r fa fa fa mi4 r

   %41
   r r32 la, do mi la[do, mi la] do8 r r4
   r32 la sold la mi[la sold la] mi8 sold la4 r
   r2 s

   %44
   s1*10
   s2 r
   \senza \tuplet 3/2 {
      do,16 fa la do[la fa] do fa la do[la fa] re re re re[re re] re re re re[re re]

      %56
      si mi sol si[sol mi] si mi sol si[sol mi] la, la la la[la la] la la la la[la la]
      la re fa la[fa re] la re fa la[fa re] si si si si[si si] si si si si[si si]\mbreak
   }
   la4 r r16 sol' do r r fa, si r

   %59
   r mi, la r r re, sol r r do, fa r r si, re sol,
   do4 r r2
   r mi16 mi mi mi mi8.\tr re32 do

   %62
   mi16 mi mi mi mi8.\tr re32 do mi16 mi mi mi sol do, re si\mbreak
   do4 s s2
   s1*7

   %71
   s2 s4 r
   R1*7
   r2 do32 la do fa do[la do fa] do la do fa do[la do fa]

   %80
   mi do mi sol mi[do mi sol] mi do mi sol mi[do mi sol] fa do fa la fa[do fa la] fa do fa la fa[do fa la]\mbreak
   mi do mi sol mi[do mi sol] mi do mi sol mi[do mi sol] fa4 r16 fa[\appoggiatura {mi16[fa]} sol fa]
   r4 r16 fa[\appoggiatura {mi16[fa]} sol fa] r4 r16 fa32(mi) fa(mi) fa(mi)

   %83
   \slurDashed la8 r r16 fa32(mi) fa(mi) fa(mi)\slurSolid la8 r r16 fa mi8\tr
   la8 r r16 fa mi8\tr la r r4
   r2\mbreak \tuplet 3/2 {
      r16 fa la r fa la r fa la r fa la

      %86
      r mi sol r mi sol r mi sol r mi sol r mi sol r mi sol r mi sol r mi sol
      r re fa r re fa r re fa r re fa r re fa r re fa r re fa r re fa
   }
   do4 r r r32 do re mi fa sol la si\mbreak

   %89
   do4 r r2
   R1
   fa,4\tr~fa8~fa32[sol la fa] mi4\tr~mi8~mi32[fa sol mi]

   %92
   fa16 sol la fa mi4\tr fa r16 fa32 sol la16 fa32 sol
   la4 r r8 fa16. sol32 mi4\tr \mbreak
   fa4 s s2

   %95
   s1*2

}

ImsIIn = \relative do {

   R1*3
   fa4 r fa r
   fa r re r

   %6
   do r la2\fermata
   R1\mbreak
   sol'8 sol sol sol sol sol sol sol

   %9
   fa4 r r2
   mi8 mi mi mi mi mi mi mi
   fa4 r r2

   %12
   fa8 fa fa fa fa fa fa fa
   fa4 r r8 sol sol sol\mbreak
   la4 r r8 sib sib sib

   %15
   do do sol mi do4 sib!\tr
   la r r2
   fa'8\p fa sol mi fa fa, r4

   %18
   r2 r8 fa' sib, do
   fa fa mi mi fa4 r
   R1*2

   %22
   r4 la8 sol fa r si la
   sol r do sib la fa sib, mi
   fa re sib do \once\stemUp fa,16 do''\f la fa la, do' la fa

   %25
   sib, do' la fa sib,8 do fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi fa16 fa32 mi
   fa16 do' la fa sib,8 do fa,4 r
   r2\mbreak fa8 r fa' r

   %28
   do r do r fa r fa r
   do r do r fa, r fa' r
   do r do r fa, r fa' r\mbreak

   %31
   do r do r fa,4 r
   R1*3
   la'8 mi la[mi]\mbreak la mi la[mi]

   %36
   R1
   si8 si si si do4 r
   R1\mbreak

   %39
   la8 r la r mi' r dod r
   re r re r mi r la, r
   la la la4 r8 la mi' mi,

   %42
   la la mi'[mi,] la la'  la la
   sold sold sold sold\mbreak la16 mi' do la do,16 mi' do la
   re, mi' do la re,8 mi la,16 la'32 sold la16 la32 sold la16[la32 sold la16 la32 sold]

   %45
   la16 mi' do la re,8 mi la,4 r
   R1
   r2 r16 la' do, sib la sib do la

   %48
   re re' fa, re mi fad sold mi la sold la sib! la sol? fa? mi\mbreak
   fa re sib' do sib do sib la sold4 r
   R1*2

   %52
   r2 sol?16 sol, r8 sol'16 sol, r8
   sol'16 sol, r8 sol'16 sol, r8 sol'16 sol, r8 sol'16 sol, r8\mbreak
   sol'16 sol, r8 sol'16 sol, r8 r2

   %55
   fa'8 fa fa fa sol sol sol sol
   mi mi mi mi fa fa fa fa
   re re re re sol sol sol sol\mbreak

   %58
   do,4 r r8 r16 sol' fa8\noBeam r16 fa
   mi8 r16 mi re8\noBeam r16 re do8\noBeam r16 do si8\noBeam r16 si
   do4 r r2

   %61
   r r16 do do do r do do do
   r do do do r do do do r do do do r do fa sol\mbreak
   do,8 r16 do' sol8 r 16 do fa,4 r32 fa sol la sib! do re mi

   %64
   fa8.[sib,16 sol8. do16] la8 fa r4
   fa8 fa fa fa fa fa fa fa
   sol mi mi mi mi mi mi mi

   %67
   fa fa fa fa mi mi mi mi
   fa fa fa fa\p\mbreak fa fa do do
   fa fa do do fa fa sib, do

   %70
   fa, fa' sib, do fa16 do'\f la fa la, do' la fa sib,
   do' la fa sib,8 do fa,4 r
   R1*7

   %79
   r2 do'\tasto~
   do1~\mbreak
   do2 fa,8 r fa r

   %82
   fa r fa r fa r fa r
   fa r fa r fa r fa r
   fa r fa r fa4 r

   %85
   r2 fa'8 fa fa fa,
   do' do do do dod dod dod dod
   re re re re si si si si

   %88
   do r do r do r do r \mbreak
   do4 r r2
   R1

   %91
   r16 fa fa fa fa4 r16 do do do do4
   r16 do fa fa do'8 do, fa4 r16 fa fa fa
   fa4 r r8 fa do' do,\mbreak

   %94
   fa16 do'\f  la fa la, do' la fa sib, do' la fa sib,8 do
   fa16[fa32 mi fa16 fa32 mi] fa16[fa32 mi fa16 fa32 mi] fa16 do' la fa sib,8 do
   fa,1\fermata

}

IbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*4
   s2 <6>
   s1*2
   <6>1
   s
   <6 5>
   s
   s2 <6 4>
   <5 3> s4 s8 <6 _!>
   s2 s4 s8 <6>
   s1
   s
   s4 s8 <7 5> s2
   s1
   s4 <6 5> s2
   s1
   s
   s4 <_+> s <_+>
   s1*6
   <7>1
   <7>
   <7>
   s1*3
   s8 <_+> s <_+> s2
   s1*3
   s2 <_+>4 <7>
   <_+> <_-> <_+> s
   s1
   s
   <7 5>
   s1*4
   <6->8 s16 <6!> <3+>4 s <_+>
   s <_+> s2
   s1
   s
   s2 <_+>4 <6 4>
   <5 3!> <6 4> <5 3!> <6 4>
   <6 4> <5 3!> s2

}

forma = {

   \key fa\major
   \time 4/4
   \tempo 2 = 35
   s1*96
   \bar"|."

}

IvlI = {
   \Iglobal
   %\notypeset
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

IvlaI = {
   \Iglobal
   \clef alto
   <<\IvlaIn \forma>>

}

ImdI ={
   \Iglobal
   \context Staff = up << \ImdIn \forma >>

}

ImsI = {
   \Iglobal
   \clef bass
   \context Staff = down << \ImsIn \IbfIn \forma >>

}

IvlIV = {
   \Iglobal
   <<\IvlIVn \forma>>

}

IvlV = {
   \Iglobal
   <<\IvlVn \forma>>

}

IvlVI = {
   \Iglobal
   <<\IvlVIn \forma>>

}

IvlaII = {
   \Iglobal
   \clef alto
   <<\IvlaIIn \forma>>

}

ImdII ={
   \Iglobal
   \context Staff = up << \ImdIIn   \forma >>

}

ImsII = {
   \Iglobal
   \clef bass
   \context Staff = down << \ImsIIn \IbfIIn \forma >>

}

#(set-global-staff-size 18.5)

\pointAndClickOff

\paper  {

   systems-per-page = #1
   print-first-page-number = ##t
   first-page-number = #2

}

   \markup\huge "[1.] All[egr]o non molto"

   \score {
      {
         << \new StaffGroup \with {
               \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
            }  <<

            \new ChoirStaff <<

               \set ChoirStaff.instrumentName =  \markup \center-column\huge\bold {"P[ri]mo""Coro"}

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlI
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlIII
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \IvlaI
               >>

               \new PianoStaff <<
                  \set PianoStaff.midiInstrument = #"church organ"
                  \new Staff = "up"  <<
                     \set PianoStaff.instrumentName =  \markup \center-column{"[Organo I]"}
                     \ImdI
                  >>
                  \new Staff = "down" <<
                     \ImsI
                  >>
               >>

            >>

            \new ChoirStaff <<
               \set ChoirStaff.instrumentName =  \markup \center-column\huge\bold {"2.do""Coro"}

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlIV
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlV
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \IvlVI
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \IvlaII
               >>

               \new PianoStaff <<
                  \set PianoStaff.midiInstrument = #"church organ"
                  \new Staff = "up"  <<
                     \set PianoStaff.instrumentName =  \markup \center-column{"[Organo II]"}
                     \ImdII
                  >>
                  \new Staff = "down" <<
                     \ImsII
                  >>
               >>

            >>

            >>

         >>

      }

      \layout {

         indent = 2\cm

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
