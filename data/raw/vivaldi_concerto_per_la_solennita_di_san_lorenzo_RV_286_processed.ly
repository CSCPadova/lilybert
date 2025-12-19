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
   \senza
}

IvlIn = \relative do'' {

   fa,16
   <<fa'4\\\stemUp \once \override Stem #'transparent = ##t do\\\stemDown fa,>> r8 r16 mi <<sol'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown mi,>> r8 r16 fa
   <<la'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown fa,>>  r fa'\staccatissimo do\staccatissimo
   fa,\staccatissimo r32 fa' mi re do sib la sol fa8 sib, do4\tr

   %4
   <<la'4\\\stemUp \once \override Stem #'transparent = ##t fa\\\stemDown do>> r8 r16 fa\p <<fa'4\\\stemUp \once \override Stem #'transparent = ##t do\\\stemDown fa,>> r8 s16 mi
   <<sol'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown mi,>> r8 r16 fa <<la'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown fa,>> r
   fa'\staccatissimo do\staccatissimo fa,\staccatissimo r32 fa' mi re do sib la sol

   %7
   fa8 sib, do4\tr \mbreak <<la'4\\\stemUp \once \override Stem #'transparent = ##t fa\\\stemDown do>> r
   fa'4\f r8 fa do16 (sib la4) la'8
   sol-.(do,-. do-. do-.) do16(sib la4) la'8

   %10
   sol-.(do,-. do-. do-.) sib16(la sol4) sib'8
   la16(sol fa4) fa8 \tuplet 3/2 { do16(sib la) do[(sib la)] do(sib la) do[(sib la)] }
   sib'8 la4 fa8 \tuplet 3/2 { do16(sib la) do[(sib la)] do(sib la) do[(sib la)] }

   %13 OK
   sol8 fa4 do'8\p reb reb(do si)
   do sol'(lab si?) reb, reb(do si)
   do sol'(la? sib?) la16(sol fa4) la8

   %16
   sol16(fa mi4) sib'8 la16(sol fa4) do8
   re16(mi fa8) fa(re) re4\tr do8 la
   sib16(do re8) re sib sib4\tr la8 fa'

   %19
   sol16(la sib8) sib(sol) fa16(sol la8) la(fa)
   mi16(fa sol8) sol(mi)\mbreak fa4. do'8
   sol16(la sib8) sib(sol) fa16(sol la8) la(do\f)

   %22
   mi,16(fa sol8) sol(mi) fa4 r8 fa\solo\p
   \appoggiatura sib la sol16(fa) \appoggiatura la8 sol fa16(mi) fa8-.(do-. do-. do-.)
   \appoggiatura sib' la sol16(fa) \appoggiatura la8 sol fa16 mi fa8-.(do-. do-. do-.)

   %25
   do16[(re mi fa sol la sib la)] sol8-.(do,-. do-. do-.)
   do16[(re mi fa sol la sib la)]\mbreak la8 sol r re' %%% inzio p 3
   \appoggiatura re do sib16(la) \appoggiatura do8 sib la16(sol) la8-.(fa-. fa-.) re'

   %28
   \appoggiatura re do sib16(la) \appoggiatura do8 sib la16(sol) la8-.(fa-. fa-.) fa'
   \appoggiatura fa mi re16(do) \appoggiatura mi8 re do16(sib) do8 fa, fa fa'
   \appoggiatura fa mi re16(do) \appoggiatura mi8 re do16(si) do4 r8 fa,

   %31
   \tuplet 3/2 { la16 sol fa do[sib? la] } \once\stemUp fa8 la' sol [do] r mi,
   \tuplet 3/2 { fa16 mi re fa,[mi re] } \once\stemUp sol,8 \once\stemDown fa''\mbreak mi do' r mi,
   \tuplet 3/2 { fa16 re mi fa[mi re] } sol,,8\noBeam r \tuplet 3/2 { sol''16 mi fa sol[fa mi] } sol,,8 r

   %34
   \tuplet 3/2 { la''16 fa sol la[sol fa] } sol,,8 r \tuplet 3/2 { si''16 sol la si[la sol] } sol,,8 r
   do''16(si)~ si4. la16(sol)~sol4.
   fa16(mi)~mi4. re16(do)~do4.

   %37
   fa,4. fa'8 \tuplet 3/2 { mi16( sol fa mi[re do)] re(fa mi re[do si)] } %%%% fine p. 3
   la'4(sol8) fa \tuplet 3/2 {
      do'16(si la sol[fa mi)] la(sol fa mi[re do)]
      do'(sol fa mi[re do)]
   } re4\tr <<mi4\f\\{\once \slurUp do16(fa sol4)} >> la8

   %40
   sol-.(do,-. do-. do-.) si16(la sol4) fa'8
   mi-.(do-. do-. do-.) si16(la sol4) fa'8
   fa4 mi8 sol\p la16(si do8) do(la)

   %43
   la4\tr sol8 mi fa16(sol la8) la(fa)\mbreak
   fa4\tr mi8 do re16(mi fa8) fa(re)
   do16(re mi8) mi(do\f) si16(do re8) re(si)

   %46
   do16\solo sol' re sol do, sol' si, sol' la, do sol do fa, do' mi, do'
   re, fa do fa si, fa' la, fa' \tuplet 3/2 {
      sol,(la si) si[(do re)] re(mi fa) sol[(la si)]
      si?(do re) re[(mi fa)] fa(sol la) la[(sol fa)]
   } fa4\tr(mi)\mbreak

   %49
   \tuplet 3/2 {
      sol16(do sol mi[re do)] sol'(do sol mi[re do)] do(fa do la[sol fa)] do'(fa do la[sol fa)]
      la'(re la fad[mi re)] la'(re la fad[mi re)] re(sol re si[la sol)]  re'(sol re si[la sol)]
      si'(mi si sold[fad mi)]  si'(mi si sold[fad mi)]
   } do'2

   %52
   \tuplet 3/2 { do16(re mi) mi[(re do)] do(si? la) do[(re mi)]\mbreak } lad,4(si)
   \tuplet 3/2 { si16(do re) re[(do si)] si(la sol) si[(do re)] } sold,4(la)
   \tuplet 3/2 { la16(si do) do[(si la)] la(sol fa) la[(si do)] } fad,4(sold)

   %55
   \tuplet 3/2 {
      mi16(si' mi, re[do si)]  mi(si' mi, re[do si)] mi(la mi do[si la)] mi'(la mi do[si la)]
      sib!(re sib fa[mib re)] sib'(re sib fa[mib re)] \mbreak si'(re si sold[fa mi?)] si'(re si sold[fa mi)]
      mi'(la mi do[si la)] mi'(la mi do[si la)]
   } re'2~

   %58
   re16 do(si) la(sold) fad(mi) re(do) si(la) sold(la8) fa'?
   red4(mi8) do' si16(do32 re do4.)
   si16(do32 re do4.)\appoggiatura {si16[do]} do4\tr ~do16 si(la si)\mbreak

   %61
   la8\f mi do la \tuplet 3/2 { do16 si la do[si la] do si la do[si la] }
   fa'8 mi4 mi8 \tuplet 3/2 { do16 si la do[si la] do si la do[si la] }
   fa8 mi4 mi'8\p fab fab(mi red)

   %64
   mi si'(do re) fab, fab(mi red)
   mi si'(do re)do16(si la4) mi8
   fa16(sol la8) la(fa) fa4\tr mi8 do

   %67
   re16(mi fa8) fa(re)\mbreak re4\tr do8 la'
   si16(do re8) re(si) la16(si do8) do( la\f)
   sold16(la si8) si(sold) la16[do,32(si) la16 do] mi[do32(si) la16 do]

   %70
   la'16[do,32(si) la16 do] mi[do32(si) la16 do] mi,[sold32 (fad) mi16 sold] si[sold32(fad) mi16 sold]
   mi'[sold,32 (fad) mi16 sold] si[sold32(fad) mi16 sold] la[dod32(si) la16 dod] mi[dod32(si) la16 dod]
   la'[dod,32(si) la16 dod] mi[dod32(si) la16 dod]\mbreak re[fa32(mi) re16 fa] re'[fa,32(mi) re16 fa]

   %73
   la[fa32(mi) re16 fa] re'[fa,32(mi) re16 fa] sol,[sib?32(la) sol16 sib] re[sib32(la) sol16 sib]
   sol'[sib,32(la) sol16 sib] re[sib32(la) sol16 sib] la\tu[dod32(si) la16 dod] mi[dod32(si) la16 dod]
   la'[dod,32(si) la16 dod] mi[dod32(si) la16 sol'] fa4\p r8 mi

   %76
   fa16(sol la8) la(fa) mi sib?-. (sib-. sib-.)
   mi16(fa sol8) sol(mi) re sold,-.( sold-. sold-.)\mbreak
   re'16(mi fa8) fa(re) dod8 sol?-.(sol-. sol-.)

   %79
   sol'?16(la sib8) sib(sol) fad do?-.(do-. do-.)
   la'16(sib do8) do(la) sib sol?-.(sol-. sol-.)
   do,16[(re mi fa sol la sib la)] sol8 do,-. (do-. do-.)

   %82
   do16[(re mi fa sol la sib la)] la4\tr sol
   fa\f  r8 fa do16(sib la4) la'8
   sol do,-. (do-. do-.)\mbreak do16(sib la4) la'8

   %85
   sol do, r do\p la'\tr sol16 fa sol8\tr fa16 mi
   fa8 do-.(do-. do-.) la'\tr sol16 fa sol8\tr fa16 mi
   fa8 do-.(do-. do-.) do16[(re mi fa sol la sib la)]

   %88
   la8 sol r re' do\tr sib16 la sib8\tr la16 sol
   la8-.(fa-. fa-.) re' do\tr sib16 la sib8\tr la16 sol
   la8-.(fa-. fa-.) fa' mi\tr re16 do re8\tr do16 si

   %91
   si?8 do r fa,\mbreak \tuplet 3/2 { la16 sol fa do[sib la] } \once\stemUp fa8 la'
   sol do r mi, \tuplet 3/2 { fa16 mi re fa,[mi re] } sol,8 \once\stemDown fa''
   mi do' r do,\tuplet 3/2 { re16 do sib fa[mi re] } sib8 \once\stemDown sib''

   %94
   fa4(mi8) do' sol4(fad8) re'
   la4(sold8) mi' si4 la8 fa'
   \tuplet 3/2 {
      fa16(mi) re re[(do) sib] sib(la) sol sol[(la) sib] mi(do) mi do[(la) do] la(fa) la do[(la) do]

      %97
      mi re do do[sib la] la sol fa fa[sol la]\mbreak re sib re sib[sol sib] sol mi sol sib[sol sib]
      re do sib sib[la sol] sol fa mi mi[fa sol] do la do la[fa la] fa re fa la[fa la]
      do sib la la[sol fa] fa mi re re[mi fa] sib sol sib sol[mi sol] mi do mi sol[mi sol]

      %100
      sib la sol sol[fa mi] mi re do sol'[la sib]
   } la4 r8 do,
   fa16(sol lab8) lab(fa) sol do,-.(re-. do-.)\mbreak
   sol'16 (lab sib8 sib sol) lab do,(reb do)

   %103
   lab'16(sib do8 do lab) sol do, (reb do)
   reb'16(do sib8) sib(reb) do16(sib lab8) sol16(fa mi8)
   reb4~reb reb'16(do sib8) sib(reb)

   %106
   do16(sib lab8) sol16(fa mi!8) \appoggiatura mi fa4~fa
   reb'16(do sib8) sib(reb) do16(sib lab8) sol16(fa mi8)
   reb4~reb reb'16(do sib8) sib(reb)\mbreak

   %109
   si4(do) si(do)
   \tuplet 3/2 {
      sol16(la sib) sib[(do re)] re(do sib) sib[(la sol)] fa(sol la) la[(sib do)] do(sib la) la[(sol fa)]
      mi(fa sol) sol[(la sib)] sib(la sol) sol[(fa mi)]
   } fa4\f r8 fa

   %112
   do16(sib la4) la'8 sol-. (do,-. do-. do-.)
   sib16(la sol4) sib'8 la16(sol fa4) do8\p
   re16(mi fa8) fa(re)\mbreak re4\tr do8 la

   %115
   sib16(do re8) re (sib) sib4\tr la8 fa'
   sol16(la sib8) sib(sol) fa16(sol la8) la(fa)
   mi16(fa sol8) sol (mi) fa4. la8\f

   %118
   sol16(la sib8) sib(sol) fa16(sol la8) la(fa)
   sol16 (fa sol8) sol(mi) fa2\fermata

}

IvlIIn = \relative do'' {

   fa,16
   <<fa'4\\\stemUp \once \override Stem #'transparent = ##t do\\\stemDown fa,>> r8 r16 mi <<sol'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown mi,>> r8 r16 fa
   <<la'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown fa,>>  r fa'\staccatissimo do\staccatissimo
   fa,\staccatissimo r32 fa' mi re do sib la sol fa8 sib, do4\tr

   %4
   <<la'4\\\stemUp \once \override Stem #'transparent = ##t fa\\\stemDown do>> r8 r16 fa\p <<fa'4\\\stemUp \once \override Stem #'transparent = ##t do\\\stemDown fa,>> r8 s16 mi
   <<sol'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown mi,>> r8 r16 fa <<la'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown fa,>> r
   fa'\staccatissimo do\staccatissimo fa,\staccatissimo r32 fa' mi re do sib la sol

   %7
   fa8 sib, do4\tr \mbreak <<la'4\\\stemUp \once \override Stem #'transparent = ##t fa\\\stemDown do>> r
   fa'4\f r8 fa do16 (sib la4) la'8
   sol-.(do,-. do-. do-.) do16(sib la4) la'8

   %10
   sol-.(do,-. do-. do-.) sib16(la sol4) sib'8
   la16(sol fa4) fa8 \tuplet 3/2 { do16(sib la) do[(sib la)] do(sib la) do[(sib la)] }
   sib'8 la4 fa8 \tuplet 3/2 { do16(sib la) do[(sib la)] do(sib la) do[(sib la)] }

   %13 OK
   sol8 fa4 do'8\p reb reb(do si)
   do sol'(lab si?) reb, reb(do si)
   do sol'(la? sib?) la16(sol fa4) la8

   %16
   sol16(fa mi4) sib'8 la16(sol fa4) do8
   re16(mi fa8) fa(re) re4\tr do8 la
   sib16(do re8) re sib sib4\tr la8 fa'

   %19
   sol16(la sib8) sib(sol) fa16(sol la8) la(fa)
   mi16(fa sol8) sol(mi)\mbreak fa4. do'8
   sol16(la sib8) sib(sol) fa16(sol la8) la(do\f)

   %22
   mi,16(fa sol8) sol(mi) fa4 r8 do\p
   do do re do do4 r8 do
   do do re do do4 r8 do

   %25
   do do do do mi,4 r8 do'
   do do do do\mbreak la sol' la sib
   la fa sol mi fa4 r8 sib

   %28
   la fa sol mi fa4 r8 la
   sol fa fa mi la4 r8 la
   sol sol la sol \once\stemDown sol [mi,16 re mi8 do']

   %31
   do do do re re do do do
   re do do do\mbreak sol do do do
   re re re re mi mi mi mi

   %34
   fa fa fa fa sol sol sol sol
   sol sol sol sol fa re re re
   re do do do si sol sol sol

   %37
   re re re si' do do si si\mbreak
   fa'4(mi8) re mi mi fa mi
   mi mi re re mi16\f(fa sol4) la8

   %40
   sol-.(do,-. do-. do-.) si16(la sol4) fa'8
   mi-.(do-. do-. do-.) si16(la sol4) fa'8
   fa4 mi8 sol\p la16(si do8) do(la)

   %43
   la4\tr sol8 mi fa16(sol la8) la(fa)\mbreak
   fa4\tr mi8 do re16(mi fa8) fa(re)
   do16(re mi8) mi(do\f) si16(do re8) re(si)

   %46
   do4 r r2
   R1*2
   do8\p do do do do do do do

   %50
   re re re re re re re re
   mi mi mi mi mi mi mi  mi
   mi mi mi mi\mbreak mi mi mi mi

   %53
   mi mi mi mi mi mi mi  mi
   re re re re re re re re
   re re re re do do do do

   %56
   sib! sib sib sib\mbreak si si si si
   do do do do la' la fa fa
   mi mi mi, mi mi mi mi do'

   %59
   si si si mi mi do do do
   mi do do do mi mi mi si\mbreak
   la'\f mi do la \tuplet 3/2 { do16 si la do[si la] do si la do[si la] }

   %62
   fa'8 mi4 mi8 \tuplet 3/2 { do16 si la do[si la] do si la do[si la] }
   fa8 mi4 mi'8\p fab fab(mi red)
   mi si'(do re) fab, fab(mi red)

   %65
   mi si'(do re)do16(si la4) mi8
   fa16(sol la8) la(fa) fa4\tr mi8 do
   re16(mi fa8) fa(re)\mbreak re4\tr do8 la'

   %68
   si16(do re8) re(si) la16(si do8) do( la\f)
   sold16(la si8) si(sold) la4 r
   la r sold r

   %71
   sold? r mi r
   mi r \mbreak fa r
   fa r sol r

   %74
   sol r mi r
   mi r re8\p fa fa mi
   re fa, fa fa sol sol sol sol

   %77
   mi mi mi mi fa re re re\mbreak
   re' re si si dod dod dod dod
   dod? dod dod dod do la la la

   %80
   fad' fad fad fad re re re re
   do do do do do, sol' sol sol
   do do do do do, do' sol sol

   %83
   fa'4\f  r8 fa do16(sib la4) la'8
   sol do,-. (do-. do-.)\mbreak do16(sib la4) la'8
   sol do, r do\p do do re do

   %86
   do4 r8 do do do re do
   do4 r8 do do do do do
   la sol' la sib la fa sol mi

   %89
   fa4 r8 sib la fa sol mi
   fa4 r8 la sol sol la sol
   \once\stemDown sol [mi,16 re mi8 do']\mbreak do do do re

   %92
   re do do do do sib sib sib
   sib la la la la sol sol sol
   sol sol sol mi' la, la la fad'

   %95
   si, si si sold' do, do do la'
   sib sib sib sib sib4 r
   la8 la la la\mbreak la4 r

   %98
   sol8 sol sol sol sol4 r
   fa8 fa fa fa fa4 r
   mi8 mi mi mi fa do do do

   %101
   do do do do mi mi mi mi\mbreak
   mi mi mi mi do do do do
   do do do do mi mi mi mi

   %104
   sol sol sol sol do, do do do
   fa fa fa fa sol sol sol sol
   do, do reb do do do do do

   %107
   sol' sol sol sol do, do do do
   fa fa fa fa sol sol sol sol\mbreak
   sol sol sol sol fa fa mi! mi

   %110
   sol sol sol sol fa fa fa fa
   mi mi mi mi fa4\f r8 fa
   do16(sib la4) la'8 sol-. (do,-. do-. do-.)

   %113
   sib16(la sol4) sib'8 la16(sol fa4) do8\p
   re16(mi fa8) fa(re)\mbreak re4\tr do8 la
   sib16(do re8) re (sib) sib4\tr la8 fa'

   %116
   sol16(la sib8) sib(sol) fa16(sol la8) la(fa)
   mi16(fa sol8) sol (mi) fa4. la8\f
   sol16(la sib8) sib(sol) fa16(sol la8) la(fa)

   %119
   sol16 (fa sol8) sol(mi) fa2\fermata

}

IvlIIIn =  \relative do'' {

   fa,16
   <<fa'4\\\stemUp \once \override Stem #'transparent = ##t do\\\stemDown fa,>> r8 r16 mi <<sol'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown mi,>> r8 r16 fa
   <<la'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown fa,>>  r fa'\staccatissimo do\staccatissimo
   fa,\staccatissimo r32 fa' mi re do sib la sol fa8 sib, do4\tr

   %4
   <<la'4\\\stemUp \once \override Stem #'transparent = ##t fa\\\stemDown do>> r8 r16 fa\p <<fa'4\\\stemUp \once \override Stem #'transparent = ##t do\\\stemDown fa,>> r8 s16 mi
   <<sol'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown mi,>> r8 r16 fa <<la'4\\\stemUp \once \override Stem #'transparent = ##t do,\\\stemDown fa,>> r
   fa'\staccatissimo do\staccatissimo fa,\staccatissimo r32 fa' mi re do sib la sol

   %7
   fa8 sib, do4\tr \mbreak <<la'4\\\stemUp \once \override Stem #'transparent = ##t fa\\\stemDown do>> r
   la''4\f r8 do, la16(sol fa4) fa'8
   mi-.(sol,-. sol-. sol-.) la16(sol fa4) fa'8

   %10
   mi-.(sol,-. sol-. sol-.) sol16(fa mi4) mi'8
   do16(sib la4) do8 \tuplet 3/2 { la16(sol fa) la[(sol fa)] la(sol fa) la[(sol fa)] }
   sol'8 fa4 do8 \tuplet 3/2 { la16(sol fa) la[(sol fa)] la(sol fa) la[(sol fa)] }

   %13
   mi8 do4 mi'8\p fa2\mbreak
   mi2 fa
   mi do16(sib la4) fa'8

   %16
   mi16(re do4) mi8 do16(sib la4) la8
   sib16(do re8) re(sib) sib4\tr la8 fa
   sol16 (la sib8) sib (sol) sol4\tr fa8 do'

   %19
   mi16(fa sol8) sol (mi) la,16(sib do8) do(la)
   sol'16(la sib8) sib(sol)\mbreak la4. fa8
   mi16(fa sol8) sol(mi)  la,16(sib do8) do la'\f

   %22
   sol16(la sib8) sib(sol) fa4 r8 la,\p
   la la sib sol la4 r8 la
   la la sib sol la4 r8 la

   %25
   sol sol sol fa do4 r8 sol'
   sol sol sol fa\mbreak fa mi' fa sol
   do, do re do do4 r8 sol'

   %28
   do, do re do do4 r8 do
   mi fa re sol fa4 r8 do
   mi mi re re mi[sol,16 fa sol8 la]

   %31
   la la la la sib sol sol sol
   la fa fa fa\mbreak sol sol sol sol
   si si si sol, do' do do sol,

   %34
   re'' re re sol,, re'' re re sol,,
   mi'' re re re do si si si
   la sol sol sol fa mi mi mi

   %37
   si si si sol' sol sol sol sol\mbreak
   si si si si do do la' sol
   sol do, do si do16\f(re mi4) fa8

   %40
   mi-.(sol-. sol-. mi-.) re16 (do si4) re8
   do-.(sol'-. sol-. mi-.) re16(do si4) re8
   re4\tr do8 mi\p fa16(sol la8) la(fa)

   %43
   fa4\tr mi8 do re16(mi fa8) fa(re)\mbreak
   re4\tr do8 mi fa16(sol la8) la(fa)
   mi16(fa sol8) sol(mi\f) re16(mi fa8) fa(re)

   %46
   do4 r r2
   R1*2
   sol8\p sol sol sol la la la la

   %50
   la la la la si si si si
   si? si si si do do do do
   do do do do\mbreak si si si si

   %53
   si? si si si la la la la
   la la la la sold sold sold sold
   sold? sold sold sold mi mi mi mi

   %56
   fa fa fa re\mbreak sold sold sold sold
   mi mi mi mi re' re la la
   si si si, si\mbreak do do do la'

   %59
   fad fad sold do sold mi mi mi
   sold mi mi la la la la sold\mbreak
   mi'\f do la mi' \tuplet 3/2 { mi16 re do mi[re do] mi16 re do mi[re do] }

   %62
   re8 do4 do8  \tuplet 3/2 { mi16 re do mi[re do] mi16 re do mi[re do] }
   re,8 do4 la''8\p la2
   sold la

   %65
   sold mi16(re do4) do8
   re16(mi fa8) fa(re) re4\tr do8 la
   si16(do re8) re(si)\mbreak si4\tr la8 mi'

   %68
   sold16(la si8) si(sold) do,16(re mi8) mi(do\f)
   si16(do re8) re(si) do4 r
   do r si r

   %71
   si? r dod r
   dod? r\mbreak re r
   re r re r

   %74
   re r dod r
   dod? r la8\p la  la dod!
   la la la la sib sib sib sib

   %77
   la la la la la sold sold sold\mbreak
   sol! sol fa fa mi mi mi mi
   mi mi mi dod' la fad fad fad

   %80
   la la la re sib sib sib sib
   sol sol sol fa mi mi mi mi
   sol sol sol fa fa fa mi mi

   %83
   la'4\f r8 do, la16(sol fa4) fa'8
   mi-.(sol,-. sol-. sol-.)\mbreak la16(sol fa4) fa'8
   mi sol,  r la\p la la sib sol

   %86
   la4 r8 la la la sib sol
   la4 r8 sol sol sol sol fa
   fa mi' fa sol  do, la re do

   %89
   do4 r8 sol' do, la re do
   do4 r8 do mi mi re re
   mi[sol,16 fa sol8 la]\mbreak la la la la

   %92
   sib sol sol sol la fa fa fa
   sol mi mi mi fa re re re
   do do do do re re re re

   %95
   mi mi mi mi fa fa fa fa
   re' re re re mi4 r
   do8 do do do\mbreak re4 r

   %98
   sib8 sib sib sib do4 r
   la8 la la la sib4 r
   sol8 sol sol do la la la la

   %101
   lab lab fa lab sol sol sol sol\mbreak
   sol sol sol do lab lab lab lab
   lab? lab lab fa sol sol sol do

   %104
   sib sib sib sib lab lab sib do
   reb reb reb reb sib sib sib sib
   lab lab sib sol lab lab lab lab

   %107
   sib sib sib sib lab lab sib do
   reb reb reb reb sib sib sib sib\mbreak
   re! re mib mib fa fa sol sol

   %110
   do, do do do la la la la
   sol sol sol sol la'4\f r8 do,
   la16(sol fa4) fa'8 mi-.(sol,-. sol-. sol-.)

   %113
   sol16(fa mi4) mi'8 do16(sib la4) la8\p
   sib16(do re8) re(sib)\mbreak sib4\tr la8 fa
   sol16(la sib8) sib(sol) sol4\tr fa8 do'

   %116
   mi16(fa sol8) sol(mi) la,16(sib do8) do(la)
   sol'16(la sib8) sib(sol) fa4. fa8\f
   mi16(fa sol8) sol(mi) la,16(sib do8) do(la)

   %119
   sol'16(la sib8) sib(sol) fa2\fermata

}

Ivlan = \relative do' {

   r16
   do4 r mi r
   do r fa do
   fa r fa8 sib, do4

   %4
   fa, r do'\p r
   mi r do r
   fa do fa r

   %7
   fa8 sib, do4\mbreak fa,4 r
   do''4\f r8 la fa4 fa
   sol sol fa fa

   %10
   sol sol mi mi8 sol
   fa4 fa fa fa
   mi8 do4 do8 do4 do

   %13 OK
   do8 do4 sol'8\p lab sib do re,\mbreak %% fine p.1
   mi mi fa sol lab sib do re,
   mi mi fa sol la?4 do,

   %16
   do do do do8 fa
   fa4 fa8 sol fa4 fa8 fa
   re4 re8 mi do4 do

   %19
   do do do do
   do do\mbreak do4. do8
   do4 do do do

   %22
   do do la r8 fa'\p
   fa fa sib, do fa,4 r8 fa'
   fa fa sib, do fa,4 r8 fa'

   %25
   mi mi mi fa do4 r8 mi
   mi mi mi fa\mbreak do do fa mi
   fa fa sib, do fa,4 r8 mi'

   %28
   fa fa sib, do fa,4 r8 fa'
   do' fa, sib, do fa,4 r8 fa'
   do' do fa, sol do, do do fa

   %31
   fa fa fa fa mi mi mi mi
   re re re re\mbreak do do do do
   sol sol sol sol sol sol sol sol

   %34
   sol sol sol sol sol sol sol sol
   sol sol sol sol sol sol sol sol
   sol sol sol sol sol sol sol sol

   %37
   sol sol sol sol sol sol sol sol\mbreak
   sol sol sol sol sol sol sol sol
   sol sol sol sol mi'\f fa sol re

   %40
   mi4. sol8 sol4 sol
   sol sol sol sol
   sol sol8 mi\p do4 do'

   %43
   do do la la\mbreak
   sol sol8 do la4 la
   sol sol sol\f sol

   %46
   mi r r2
   R1*2
   mi8\p mi mi mi fa fa fa fa

   %50
   fad fad fad fad sol sol sol sol
   sold sold sold sold la la la la
   la la la la\mbreak sold sold sold sold

   %53
   sol! sol sol sol fad fad fad fad
   fa! fa fa fa mi mi mi mi
   mi mi mi mi la, la la la

   %56
   re re re re\mbreak mi mi mi mi
   la, la la la fa' fa re re
   sold, sold sold sold la la la la

   %59
   la la sold la mi' la, la la
   mi' la, la la mi' mi mi, mi\mbreak
   do'' la mi do do4 do8 la'

   %62
   la,4 la la la
   la la8 do'\p  do re mi fad,
   sold sold la si do re mi fad,

   %65
   sold sold la si do do do do
   la4 la la la
   fa fa\mbreak mi mi8 mi

   %68
   mi4 mi mi mi\f
   mi mi do r
   mi r mi r

   %71
   mi r mi r
   dod r\mbreak la r
   la' r sol r

   %74
   sol  r la r
   la r fa8\p re re la'
   re, re re re dod dod dod dod

   %77
   do! do do do si si si si\mbreak
   sib! sib sold sold la la la la
   la la la la re re re re

   %80
   re re re re sol, sol sol sol
   mi' mi mi fa do do do do
   mi mi mi fa do do do do

   %83
   do'4\f r8 la fa4 fa
   sol sol\mbreak fa fa
   sol8 mi r fa\p  fa fa sib, do

   %86
   fa,4 r8 fa' fa fa sib, do
   fa,4 r8 mi' mi mi mi fa
   do do fa mi fa fa sib, do

   %89
   fa,4 r8 mi' fa fa sib, do
   fa,4 r8 fa' do' do fa, sol
   do, do do fa\mbreak fa fa fa fa

   %92
   mi mi mi mi re re re re
   do do do do sib sib sib sib
   do do do do re re re re

   %95
   mi mi mi mi fa fa fa fa
   sol sol sol sol do4 r
   fa,8 fa fa fa\mbreak sib4 r

   %98
   mi,8 mi mi mi la4 r
   re,8 re re re sol4 r
   do,8 do do do fa fa fa fa

   %101
   fa fa fa fa do do do do\mbreak
   do do do do fa fa fa fa
   fa fa fa fa do do do do

   %104
   mi! mi mi mi fa fa sol lab
   sib sib sib sib mi, mi mi mi
   fa fa sib, do fa fa fa fa

   %107
   mi mi mi mi fa fa sol lab
   sib sib sib sib mi, mi mi mi\mbreak
   fa fa mib mib reb reb do do

   %110
   mi? mi mi mi fa fa fa fa
   do do do do do'4\f r8 la
   fa4 fa sol sol

   %113
   mi mi8 sol fa4 fa\p
   fa fa8 sol\mbreak fa4 fa8 fa
   re4 re8 mi do4 do

   %116
   do do do do
   do do do4. do8\f
   do4 do do do

   %119
   do do la2\fermata

}

Ibcn = \relative do {

   r16
   fa4 r do r
   fa r fa'\staccatissimo do\staccatissimo
   fa,\staccatissimo r fa8 sib, do4

   %4
   fa, r fa'^\markup\italic"Tasto solo"\pp r
   do r fa r
   fa' do fa, r

   %7
   fa8 sib, do4\mbreak fa, r
   fa'8\f\tu sol la sol fa sol la fa
   do re mi do fa sol la fa

   %10
   do re mi re do re mi do
   fa sol la sol fa sol la fa
   do fa la sol fa sol la fa

   %13
   do fa lab^\markup\italic"Senza Cembali" sol\p fa sol lab sol\mbreak
   do, mi re do fa sol lab sol
   do, mi re do fa sol la? fa

   %16
   do re mi do fa sol la fa
   sib, do re mi fa mi fa la
   sol fa sol do, fa sol la fa

   %19
   do' sib do do, fa mi fa fa,
   do'' sib do do,\mbreak fa mi fa la
   do sib do do, fa mi fa fa,\f

   %22
   do''\tu sib do do, fa,4 r
   R1*16
   r2 do'8\f\tu re mi si

   %40
   do re mi do sol la si sol
   do re mi do sol la si sol
   do re mi do\p fa^\markup\italic"Senza Cembali" mi fa fa,

   %43
   do'' si do do, fa mi fa fa,\mbreak
   do'' si do do, fa mi fa fa,
   do'' si do do,\f sol' \tu fa sol sol,

   %46
   do' si la sol fa mi re do
   si la sol fa sol4 r
   sol r do8 re mi re\mbreak

   %49
   do4 r r2
   R1*11
   la8\tu si do si la si do si

   %62
   la si do si la si do si
   la si do la\p la'^\markup\italic"Senza Cembali" si do si
   mi, sold fad mi la si do si

   %65
   mi, sold fad mi la si do la
   re do re re, la' sold la la,
   re do re sold,\mbreak la si do la

   %68
   mi' re mi mi, la' sold la la,\f
   mi' re mi mi, la4 r
   la\tu r mi' r

   %71
   mi r la, r
   la r\mbreak re r
   re r sib' r

   %74
   sib r dod, r
   dod? r re r
   R1*7

   %83
   fa8\tu\f sol la sol fa sol la fa
   do re mi do\mbreak fa sol la fa
   do' do, r4 r2

   %86
   R1*25
   r2 fa8\f\tu sol la sol
   fa sol la fa do re mi re

   %113
   do re mi do fa sol la fa\p_\markup\italic"Senza Cembali"
   si, do re mi\mbreak fa mi fa la
   sol fa sol do, fa sol la fa

   %116
   do' sib do do, fa mi fa fa,
   do''\f sib do do, fa mi fa fa,\f\tu
   do'' sib do do, fa mi fa fa,

   %119
   do'' sib do do,\mbreak fa,2\fermata

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key fa\major
   \time 4/4
   \tempo 4 = 60
   \partial 16 s16
   s1*7\break
   \mark\markup\huge "            [2.] Andante molto"
   \tempo 2 = 55
   s1*112
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

   fa16. sol32 fa16. sol32 fa16. sol32 fa16. sol32 fa8 la,\p(sol fa)
   mi'16.\f fa32 mi16. fa32 mi16. fa32 mi16. fa32 sol8 sol,\p(fa mi)
   la'16.\f sib32 la16. sib32 la16. sib32 la16. sib32  do8 do,\p(sib la)

   %4
   \once\stemUp sol,\f re''\p(do sib) \once\stemUp la,\f sol''\p(fa mi)
   <<{la [dod,]}\\re4\pp>> re4~re8 sib' la sol
   fa dod re4~re8  sib' la sol

   %7
   fa8. mi16 re8 fa\mbreak mi sold(la) dod,(
   re) fad(sol) si,(do?) mi(sol) sib,?
   sib\tr la r4 \appoggiatura re8 do16(sib do8) \appoggiatura re do16(sib do8)

   %10
   \appoggiatura la' sol16(fa sol8)  \appoggiatura la sol16(fa sol8) \appoggiatura do sib16(la sib8) \appoggiatura do sib16(la sib8)
   la4 r8 fa16(sol) la16. sol32(fa) mi(re) do(sib8) sol'16(la)
   sib16. la32(sol) fa(mi) re(do8) la'16(sib) do16. sib32(la) sol(fa) mi(re8) sib'16 do\mbreak

   %13
   re16. do32(sib) la(sol) fa sib16. la32(sol) fa(mi)si \appoggiatura si8 do4~do16 mi(sol sib?)
   la(fa) do'(fa,) la(fa) do'(fa,) mi(do) sib'(sol) sol8.\tr fa16
   fa4 r8 <<
      {
         la,16. sib32 do8 la16. sib32 do8 la16. sib32

         %16
         do16 si, do[la'] sol8.\tr fa16
      }\\{
         fa16. sol32 la8 fa16. sol32 la8 fa16. sol32
         la8. fa16\noBeam do4
      }
   >> fa r
   la'8 dod, re4~re8 sib' la sol
   fa dod re4~\mbreak re8 sib' la sol

   %19
   fa16 mi re8 r la' sib,4. sol'16(mi)
   dod4. la'16(fa) re4. sib'16(sol)
   mi4. dod'16(la) re8 re, mi8.\tr re16

   %22
   sol,4~sol16 sib'(sol re) sold,4~sold16 si'(sold re)
   dod32(la16.) mi'32[(dod16.)] sol'32(mi16.) dod'32[(la16.)] re8 re, mi8.\tr re16
   re2\f  r

   %25
   R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlIIn = \relative do'' {

   fa16. sol32 fa16. sol32 fa16. sol32 fa16. sol32 fa8 la,\p(sol fa)
   mi'16.\f fa32 mi16. fa32 mi16. fa32 mi16. fa32 sol8 sol,\p(fa mi)
   la'16.\f sib32 la16. sib32 la16. sib32 la16. sib32  do8 do,\p(sib la)

   %4
   \once\stemUp sol,\f re''\p(do sib) \once\stemUp la,\f sol''\p(fa mi)
   re,\pp mi fa re sib' sol dod, la
   re mi fa re sib' sol dod, la

   %7
   re4 r8 re'\mbreak dod4 r8 la
   sib4 r8 sol mi4 r8 do
   fa do'(sib la) r do(sib la)

   %10
   r sib(la sol) r sol(fa mi)
   r do'(sib la) r fa sol sol,
   r sol' la la, r la' sib sib,\mbreak

   %13
   r sib' sol mi do sol'(fa mi)
   fa fa fa fa do' sib do do,
   fa do'(sib la) r fa fa fa

   %16
   fa16 si, do [fa] do8 do fa do'(sib la)
   re, mi fa re sib' sol dod, la
   re mi fa re\mbreak sib' sol dod, la

   %19
   re la'(sol fa) r sol sol sol,
   r la' la la, r sib' sib sib,
   r dod' dod dod, r re la[la]

   %22
   r sib sib sib r si si si
   la1\fermata
   fa''16\f sol fa sol fa sol fa sol fa8 fa mi mi

   %25
   re1\fermata

}

IIvlIIIn =  \relative do'' {

   re16. mi32 re16. mi32  re16. mi32 re16. mi32  re8 fa,\f(mi re)
   dod'16.\f re32 dod16. re32 dod16.\f re32 dod16. re32 mi8 mi,\p(re dod)
   fad'16.\f sol32 fad16. sol32 fad16. sol32 fad16. sol32 la8 la,\p(sol fad)

   %4
   \once\stemUp sol,\f sib'(la sol) \once\stemUp  la, mi''(re dod)
   re,\pp mi fa re sib' sol dod, la
   re mi fa re sib' sol dod, la

   %7
   re4 r8 re'\mbreak dod4 r8 la
   sib4 r8 sol mi4 r8 do
   fa la(sol fa) r la(sol fa)

   %10
   r sol(fa mi) r mi(re do)
   r la'(sol fa) r fa sol sol,
   r sol' la la, r la' sib sib,\mbreak

   %13
   r sib' sol mi do mi(re do)
   fa fa fa fa do' sib do do,
   fa \once\slurDashed la(sol fa) r fa fa fa

   %16
   fa16 si, do [fa] do8 do fa la(sol fa)
   re mi fa re sib' sol dod, la
   re mi fa re\mbreak sib' sol dod, la

   %19
   re fa(mi re) r sol sol sol,
   r la' la la, r sib' sib sib,
   r dod' dod dod, r re la[la]

   %22
   r sib sib sib r si si si
   la1\fermata
   re'16 mi re mi re mi re mi re8 re re dod

   %25
   re1\fermata

}

IIvlan = \relative do' {

   la'8 la la la la4 r
   la8 la la mi dod4 r
   la'8 la la la fad4 r

   %4
   sol, r la r
   re r r2
   R1*18

   %24
   la'8 la la la la la la la
   fa1\fermata

}

IIbcn = \relative do {

   re8\tu re re re re4 r
   la8 la la la la4 r
   re8 re re re re4 r

   %4
   sol, r la r
   re, r r2
   R1*18

   %24
   re'8 re re re re re la' la,
   re1\fermata

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1
   s
   <_+>2<7>
   s <_+>
   s1*19
   s2 s4 <5 4>8 <3+>

}

forma = {

   \key fa\major
   \time 4/4
   \tempo 4 = 40
   s1*25
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

  do8
  la'[sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'
  la [sol16 fa sol8 mi]

  %4
  fa16 do(sib la) sib8 sib'
  la[sol16 fa sol8 mi]
  fa4. sol8

  %7
  mi[re16 do re8 si]
  do16 sol(fa mi) fa8 fa'
  mi[re16 do re8 si]

  %10
  do16 sol(fa mi) fa8 fa'
  mi[re16 do re8 si]
  do4. do'8

  %13
  do,[la'16 sol la8 la]\mbreak
  la(sol) si(do)
  do,[la'16 sol la8 la]

  %16
  sol4. fa8
  fa, reb'4 do8~
  do mi4 fa8

  %19
  fa, mib'4 re8~
  re fad4 sol8
  sol, fa'?4 mi8~

  %22
  mi sol4 lab8
  mi[fa16 mi fa8 fa]
  do4. sib'8

  %25
  la![sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'
  la[sol16 fa sol8 mi]\mbreak  %%fine primo sistema p 14

  %28 OK
  fa4 r8 sib,
  la [sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'

  %31
  la[sol16 fa sol8 mi]
  fa4 r8 do'
  fa16  (la sol fa do'8) la

  %34
  sol16(mi) fa(re) do8 do
  fa16(la sol fa do'8) la
  la4 (sol8) do,

  %37
  \tuplet 3/2 { fa16(sol la) la[(sib do)]} do8 la
  \tuplet 3/2 { sol16 (fa mi) fa[(mi re)] } do8 do\mbreak
  \tuplet 3/2 { fa16(sol la) la[(sib do)] } do8 la

  %40
  la4\tr sol8 do
  do16(mi re do fa8) do
  do4\tr sib8 sib

  %43
  sib16(re do sib fa'8) sib,
  sib4\tr la8 sol
  \tuplet 3/2 { la16 sol fa la[sol fa] la sol fa la[sol fa] }

  %46
  do'8 do, r do
  \tuplet 3/2 {
    la'16 fa sol la[sol fa] \once\stemUp do, fa' sol la[sol fa]
    sol fa sol mi[re mi]
  } do,8 r

  %49
  \tuplet 3/2 {
    sib''16 sol la sib[la sol]\mbreak \once\stemUp re, sol' la sib[la sol]
    la sol la fad[mi fad]
  } re,8 r
  \tuplet 3/2 {
    do''16 la si do[si la] \once\stemUp  mi, la' si do[si la]
    si la si sold[fad sold]
  } mi,8 r

  %53
  \tuplet 3/2 {
    mi''16 do re mi[re do] do, do' re mi[re do]
    si, si' do re[do si] si, si' do re[do si]
    la, la' si do[si la] la, la' si do[si la]

    %56
    sold si la sold[fad mi] re fa? mi re[do si]\mbreak
    do mi re do[si la] red, mi' re? do[si la]
  }
  mi4 r8 mi'\p

  %59
  \appoggiatura sol fad16(mi fad8) \appoggiatura la sold16(fad sold8)
  \appoggiatura si la16(sold la8)~la si
  \tuplet 3/2 { do16 la si do[si la] mi sold la si[la sold] }

  %62
  \appoggiatura sol?8 la4. mi8
  \appoggiatura sol fad32 mi fad16 \appoggiatura sol8 fad32[mi fad16] \appoggiatura la8 sold32 fad sold16 \appoggiatura la8 sold32[fad sold16]
  sold?8(la4) si8

  %65
  do(sib!4) la8
  re(do4) si8\mbreak
  mi8 re4 do8

  %68
  \tuplet 3/2 { mi,16 sold la si[la sold] re sold la si[la sold] }
  <<do4\f\\{la8 si16 la}>> si8 sold
  la16 mi(re do) re8 re'

  %71
  do[si16 la si8 sold]
  la16 mi(re do) re8 re'
  do[si16 la si8 sold]

  %74
  la4 r8 la
  la, fa'4 mi8~
  mi sold4 la8

  %77
  la, sol'?4 fad8~
  fad lad4 si8
  si,? la'?4 sold8~\mbreak

  %80
  sold8[si si mi,]
  do[si16 la si8 sold]  %%%%%%%% ijzio p. 17
  la16 mi(re do) re8 re'

  %83
  do[si16 la si8 sold]
  <<{ \override TupletBracket #'bracket-visibility = ##f\senza\tuplet 3/2{ mi'16\noBeam (\once \override Stem #'transparent = ##t  do s)}}\\{ \override TupletBracket #'bracket-visibility = ##f \senza \tuplet 3/2 { la [do la] }}>> \tuplet 3/2 {
    do(la) do mi[(do) la] do(la) do
    mi[(do) la] do(la) do mi[(do) la] do(la) do
  }
  <<
    {
      \tuplet 3/2 {

        %86
        fa(re) la re[(la) re] fa(re) la re[(la) re]
        fa(re) la re[(la) re] fa(re) la re[(la) re]
        sol(re) si re[(si) re] sol(re) si re[(si) re]

        %89
        sol(mi) do mi[(do) mi] sol(mi) do mi[(do) mi]
        la(mi) dod mi[(dod) mi] la(mi) dod mi[(dod) mi]
        la(fa) re fa[(re) fa] la(fa) re fa[(re) fa]

        %92
        si(fa) re fa[(re) fa]  si(fa) re fa[(re) fa]\mbreak
        do'(sol) mi sol[(mi) sol] do(sol) mi sol[(mi) sol]
        do(sol) re sol[(re) sol] do(sol) re sol[(re) sol]

        %95
        sib!(sol) re sol[(re) sol] sib!(sol) re sol[(re) sol]
        la(sol) re sol[(re) sol]  la(sol) re sol[(re) sol]
        la(fa) re fa[(re) fa] la(fa) re fa[(re) fa]

        %98
        sol(fa) do fa[(do) fa] sol(fa) do fa[(do) fa]
        sol(mib) do mib[(do) mib] sol(mib) do mib[(do) mib]
        fa(mi?) sib! mi[(sib) mi] fa(mi?) sib! mi[(sib) mi]

        %101
        fa(reb) sib reb[(sib) reb] fa(reb) sib reb[(sib) reb]
        fa(do) la do[(la) do] fa(do) la do[(la) do]
        fa(reb) sib reb[(sib) reb] fa(reb) sib reb[(sib) reb]
        fa(do) la do[(la) do] fa(do) la do[(la) do]
      }
    }

    \new Staff \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0.5) (padding . +0.0))
      \remove "Time_signature_engraver"
      alignAboveContext = #"main" fontSize = #-3
      \override StaffSymbol #'staff-space = #(magstep -3)
      \override StaffSymbol #'thickness = #(magstep -3)
    }
    {
      \set Staff.midiInstrument = #"violin"

      <<
        {
          \key fa\major fa2^\markup\italic\smaller"Manoscritto"
          fa
          sol
          sol
          la
          la
          si
          do
          do
          sib!
          la
          la
          sol
          sol
          fa
          fa
          fa
          fa
          fa
        }\\{
          \stemUp \override Stem #'transparent = ##t re
          re
          re
          mi
          mi
          fa
          fa
          sol
          sol
          sol
          sol
          fa
          fa
          mib
          mi?
          reb
          do
          reb
          do
        }\\{
          \stemDown la
          la
          si
          do
          dod
          re
          re
          mi
          re
          re
          re
          re
          do
          do
          sib!
          sib
          la
          sib
          la
        }
      >>
    }
  >>

  %105
  re32(do sib16 sib4) sib8
  lab'32(sol fa16) sib8\noBeam lab32(sol fa16) lab8\noBeam
  sol32(fa mib16 mib4) do8\mbreak

  %108
  sib'32(la? sol16) do8\noBeam sib32(la sol16) sib8\noBeam
  la32(sol fa16)~fa4 do'8
  \tuplet 3/2 {
    reb16\staccatissimo sib\staccatissimo do\staccatissimo reb\staccatissimo[do\staccatissimo sib\staccatissimo] reb, sib' do reb[do sib]

    %111
    mib, sib' do reb[do sib] fa sib do reb[do sib]
    solb sib do reb[do sib] reb, sib' do reb[do sib]
    mib, sib' do reb[do sib]
  } do4\tr

  %114
  <<sib8\\{re,\f[do16 sib do8 la]}>>
  sib16 fa'(mib re) mib8 fa
  re[do16 sib do8 la]

  %117
  sib16 fa'(mib re) mib8 fa
  re[do16 sib do8 la]\mbreak
  sib16 sib' re, sib' do, la' sib, sol'

  %120
  la, fa' sol, mib' fa, re' mib, do'
  re, re'(do sib) re, re'(do sib)
  mib,? re'(do sib) fa mib'(re do)

  %123
  re sib fa re sib4
  sib'16 sib' re, sib' do, la' sib, sol'
  la, fa' sol, mib' fa, re' mib, do'

  %126
  \tuplet 3/2 {
    re, sib'(do re[do sib)]  re, sib'(do re[do sib)]
    mib, sib'(do re[do sib)] fa do'(re mi[re do)]
  }
  re do sib8 r4\mbreak %%% fine p 18

  %129
  sib'16(do) do(re) re(mib) mib(fa)
  fa(re) re(lab) lab(fad) fad(sol)
  \appoggiatura la8 sol16(fad sol8) \appoggiatura la sol16(fad sol8)

  %132
  do16(re) re(mib) mib(fa) fa(sol)
  sol(mib) mib(sib) sib(sol) sol(la)
  \appoggiatura sib8 la16(sol la8)  \appoggiatura sib8 la16(sol la8)

  %135
  re16(mi!) mi(fa) fa(sol) sol(la)
  la(fa) fa(do) do(la) la(sib)
  \appoggiatura do8 sib16(la sib8)  \appoggiatura do8 sib16(la sib8)

  %138
  \tuplet 3/2 { re16\p(sib) fa re[(fa) sib]  re(sib) fa re[(fa) sib] }
  re4 \appoggiatura do8 si16(la si8)
  \tuplet 3/2 {
    mib16 do sol mib[sol sib] mib do sol mib[sol la]
  }

  %141
  mib'4 \appoggiatura re8 dod16(si dod8)
  \tuplet 3/2 {
    fa16 re la fa[la re]   fa re la fa[la re]
    fa re sib sol[sib re] fa re sib sol[sib re]

    %144
    mi do sol mi[sol do] mi[do sol] mi sol do
    mi do la fa[la do] mi do la fa[la do]
    re sib fa re[fa sib] re sib fa re[fa la]\mbreak

    %147
    dod la mi la,[mi' la] dod la mi la,[mi' la]
    re la fa re [fa la] re la fa re[fa la]
  }
  \appoggiatura do8 si16(la si8) \appoggiatura re8 dod16(si dod8)
  \tuplet 3/2 {

    %150
    re16 la fa re[fa la] re la fa re[fa la]
    re la fa mi[fa la] re la fa mi[fa la]
    dod la mi la,[mi' la] dod la mi la,[mi' dod']
  }
  <<
    re4\f\\{fa,8[mi16 re mi8 dod]}
  >>

  %154
  re16 la(sol fa) sol8 sol'
  fa [mi16 re mi8 dod]
  re16 la(sol fa) sol8 sol'

  %157
  fa [mi16 re mi8 dod]
  re4. do8
  la'[sol16 fa sol8 mi]

  %160
  fa16 do(sib la) sib8 sib'
  la[sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'

  %163
  la[sol16 fa sol8 mi]
  fa4. fa8
  fa, reb'4 do8~

  %166
  do mi4 fa8\mbreak
  fa, mib'4 re8~
  re fad4 sol8

  %169
  sol, fa'?4 mi8~
  mi sol4 lab8
  mi[fa16 mi fa8 fa]

  %172
  do4. sib'8
  la![sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'

  %175
  la[sol16 fa sol8 mi]\mbreak
  fa4 r8  do
  fa32\solo(sol la sib do8) do (sib!)

  %178
  sol16 fa(mi) re(do8) do\mbreak
  fa32(sol lab sib do8) do(lab)
  lab?4\tr (sol8) do,

  %181
  \tuplet 3/2 { fa16(do) fa lab[(fa) lab] } do8 lab
  \tuplet 3/2 { sol16(fa) mi fa[(mi) re] } do,8 do'
  \tuplet 3/2 { fa16(do) fa lab[(fa) lab] } do8 lab

  %184
  \once\slurDashed lab?4\tr (sol8) do\pp
  fa,16(mi fa fa) fa(mi fa fa)
  fa8(reb') do16(sib) lab(sol)

  %187
  fa(mi fa fa) fa(mi fa fa)
  fa8 fa' mib16(re) do(sib)
  lab(sol fa mi fa8) do'\mbreak

  %190
  mib2~
  mib8 [reb16(do sib la sib do)]
  reb(do sib la sib8) do

  %193
  reb2~
  reb8[do16(sib lab sol lab sib)]
  do(sib lab sol lab8) do

  %196
  \tuplet 3/2 {
    fa,16 sol lab lab[sib do] do sib lab lab[sol fa]
    fa sol lab lab[sib do] do sib lab lab[sol fa]
    mi fa sol sol[lab sib] sib lab sol sol[fa mi]
    mi fa sol sol[lab sib] sib lab sol sol[fa mi]\mbreak
  }

  %200
  reb4~\tuplet 3/2 {
    reb16 sib(do reb[do sib)]
    sol'(mi fa sol[fa mi)] sib'(sol lab sib[lab sol)]
  }
  reb4~\tuplet 3/2 {
    reb16 sib(do reb[do sib)]
    sol'(mi fa sol[fa mi)] sib'(sol lab sib[lab sol)]
  }

  %204
  \appoggiatura sol8 lab4 r8 si
  si?2\tr (
  do4.\tr) sib!8

  %207
  lab16(do lab fa) sol(sib sol mi)
  \appoggiatura mi8 fa4. si8
  si?2\tr

  %210
  do\tr~
  do4. sib!8
  \tuplet 3/2 { lab16 do sib lab[sol fa] sol sib la sol[fa mi] }

  %213
  <<la4\f\\{fa8[sol16 fa sol8 mi]}>>
  fa16 do(sib la) sib8 sib'
  la [sol16 fa sol8 mi]

  %216
  fa16 do(sib la) sib8 sib'
  la[sol16 fa sol8 mi]
  fa[la sol sol]

  %219
  fa2\fermata

}

IIIvlIIn = \relative do'' {

  do8
  la'[sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'
  la [sol16 fa sol8 mi]

  %4
  fa16 do(sib la) sib8 sib'
  la[sol16 fa sol8 mi]
  fa4. sol8

  %7
  mi[re16 do re8 si]
  do16 sol(fa mi) fa8 fa'
  mi[re16 do re8 si]

  %10
  do16 sol(fa mi) fa8 fa'
  mi[re16 do re8 si]
  do4. do'8

  %13
  do,[la'16 sol la8 la]\mbreak
  la(sol) si(do)
  do,[la'16 sol la8 la]

  %16
  sol4. fa8
  fa, reb'4 do8~
  do mi4 fa8

  %19
  fa, mib'4 re8~
  re fad4 sol8
  sol, fa'?4 mi8~

  %22
  mi sol4 lab8
  mi[fa16 mi fa8 fa]
  do4. sib'8

  %25
  la![sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'
  la[sol16 fa sol8 mi]\mbreak  %%fine primo sistema p 14

  %28 OK
  fa4 r8 sib,
  la [sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'

  %31
  la[sol16 fa sol8 mi]
  fa4 r
  R2*25

  %58
  mi8\p [re do la]
  re[re mi mi]
  fa[re si sold]

  %61
  la r mi' r
  la,[si do la]
  re[re mi mi]

  %64
  fa[re si sold]
  \once\stemUp la \once\stemDown re' do4
  si8 la sold4\mbreak

  %67
  do8 si la4
  mi' mi,8 mi'\f
  do'8 si16 la si8 sold

  %70
  la16 mi(re do) re8 re'
  do[si16 la si8 sold]
  la16 mi(re do) re8 re'
  do[si16 la si8 sold]

  %74
  la4 r8 la
  la, fa'4 mi8~
  mi sold4 la8

  %77
  la, sol'?4 fad8~
  fad lad4 si8
  si,? la'?4 sold8~\mbreak

  %80
  sold8[si si mi,]
  do[si16 la si8 sold]  %%%%%%%% ijzio p. 17
  la16 mi(re do) re8 re'

  %83
  do[si16 la si8 sold]
  la[la,\p la la]
  la[la la la]

  %86
  re[re re re]
  re[re re re]
  sol,[sol sol sol]

  %89
  do[do do do]
  la[la la la]
  re[re re re]

  %92
  sol,[sol sol sol]\mbreak
  do[do do do]
  sol[sol sol sol]

  %95
  sol[sol sol sol]
  re'[re re re]
  fa[fa fa fa]

  %98
  do[do do do]
  do[do mib mib]
  sib[sib sib sib]

  %101
  sib[sib sib sib]
  fa'[fa fa fa]
  sib,[sib sib sib]

  %104
  fa'[fa fa fa]
  sib,[do re do]
  sib[re sib sib]

  %107
  mib[fa sol mib]\mbreak %% fine p. 17
  do[mi? do do]
  fa[sol la fa]

  %110
  sib, r sib' r
  do r reb r
  mib r sib r

  %113
  mib, r fa8 fa
  re'\f [do16 sib do8 la]
  sib16 fa'(mib re) mib8 fa

  %116
  re[do16 sib do8 la]
  sib16 fa'(mib re) mib8 fa
  re[do16 sib do8 la]\mbreak

  %119
  sib [sib\p la sol]
  fa [mib re do]
  sib r re r

  %122
  mib r fa r
  sib,4 r
  sib8[sib' la sol]

  %125
  fa[mib re do]
  sib r re r
  mib r fa r

  %128
  sib,[sib' la sol]\mbreak
  fa4 r
  re r

  %131
  sol sol
  sol r
  mib r

  %134
  la la
  la r
  fa r

  %137
  sib sib
  fa'8\p[fa fa fa]
  fa[fa fa fa]

  %140
  sol[sol sol sol]
  sol[sol sol sol]
  la[la la la]

  %143
  sib[re, re re]
  sol[sol sol sol]
  do, [do do do]

  %146
  fa[fa fa fa]\mbreak
  dod[dod mi mi]
  fa[fa fa fa]

  %149
  sol[sol sol sol]
  fa[fa fa fa]
  mi[mi mi mi]

  %152
  mi[mi mi mi]\mbreak
  fa8\f [mi16 re mi8 dod]
  re16 la(sol fa) sol8 sol'
  fa [mi16 re mi8 dod]
  re16 la(sol fa) sol8 sol'

  %157
  fa [mi16 re mi8 dod]
  re4. do8
  la'[sol16 fa sol8 mi]

  %160
  fa16 do(sib la) sib8 sib'
  la[sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'

  %163
  la[sol16 fa sol8 mi]
  fa4. fa8
  fa, reb'4 do8~

  %166
  do mi4 fa8\mbreak
  fa, mib'4 re8~
  re fad4 sol8

  %169
  sol, fa'?4 mi8~
  mi sol4 lab8
  mi[fa16 mi fa8 fa]

  %172
  do4. sib'8
  la![sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'

  %175
  la[sol16 fa sol8 mi]\mbreak  %%fine primo sistema p 14
  fa4 r
  R2*7

  %184
  r4 r8 do\pp
  do[do do do]
  do[do do do]

  %187
  do[do do do]
  do[do do do]
  do[do do do]

  %190
  sib[sib sib sib]
  do[do do mib]
  reb[reb reb do]

  %193
  lab[lab lab lab]
  sib[sib sib reb]
  do[do do do]

  %196
  do[do do do]
  do[do do do]
  mi![mi mi mi]

  %199
  mi[mi mi mi]
  sib[sib sib sib]
  sib[sib sib sib]

  %202
  sib[sib sib sib]
  sib[sib reb reb]
  do[do do re!]

  %205
  re[re re re]
  do[do do do]
  do [do reb reb]

  %208
  do[do do re!]
  re[re re re]\mbreak
  do[do do do]

  %211
  do[do do do]
  do[do mi mi]
  la8\f[sol16 fa sol8 mi]

  %214
  fa16 do(sib la) sib8 sib'
  la [sol16 fa sol8 mi]
  fa16 do(sib la) sib8 sib'

  %217
  la[sol16 fa sol8 mi]
  fa[la sol sol]
  fa2\fermata

}

IIIvlIIIn =  \relative do'' {

  r8
  do'4 sib
  la sol
  do sib

  %4
  la sol
  do sib
  la r

  %7
  sol fa
  mi re
  sol fa

  %10
  mi re
  sol fa
  mi4. fa8

  %13
  mi[fa16 mi fa8 fa]\mbreak
  fa(mi) r4
  mi8[fa16 mi fa8 fa]

  %16
  mi4. do8
  lab sib4 sol8
  lab do4 do8

  %19
  la! do4 la8
  sib re4 re8
  si re4 do8~

  %22
  do mi4 fa8
  sol[lab16 sol lab8 lab]
  sol4 r

  %25
  do sib
  la! sol
  do sib\mbreak

  %28
  la r
  do, sib
  la sol

  %31
  do sib
  la r
  R2*36

  %69
  mi'4 re
  do si
  mi re

  %72
  do si
  mi re
  do r8 mi

  %75
  do re4 si8
  do mi4 mi8
  dod mi4 dod8

  %78
  re fad4 fad8
  red fad4 mi8~\mbreak
  mi mi4 mi8

  %81
  mi4 re
  do si
  mi re

  %84
  do8 [la,\p la la]
  la[la la la]

  %86
  re[re re re]
  re[re re re]
  sol,[sol sol sol]

  %89
  do[do do do]
  la[la la la]
  re[re re re]

  %92
  sol,[sol sol sol]\mbreak
  do[do do do]
  sol[sol sol sol]

  %95
  sol[sol sol sol]
  re'[re re re]
  fa[fa fa fa]

  %98
  do[do do do]
  do[do mib mib]
  sib[sib sib sib]

  %101
  sib[sib sib sib]
  fa'[fa fa fa]
  sib,[sib sib sib]

  %104
  fa'[fa fa fa]
  sib,[do re do]
  sib[re sib sib]

  %107
  mib[fa sol mib]\mbreak %% fine p. 17
  do[mi? do do]
  fa[sol la fa]

  %110
  sib, r sib' r
  do r reb r
  mib r sib r

  %113
  mib, r fa r
  fa'4 mib
  re do

  %116
  fa mib
  re do
  fa mib\mbreak

  %119
  re8[sib\p la sol]
  fa [mib re do]
  sib r re r

  %122
  mib r fa r
  sib,4 r
  sib8[sib' la sol]

  %125
  fa[mib re do]
  sib r re r
  mib r fa r

  %128
  sib,[sol' fa mib]\mbreak
  re4 r
  sib r

  %131
  mib mib
  mib? r
  do r

  %134
  fa fa
  fa r
  re r

  %137
  sol sol
  re'8\p[re re re]
  re[re re re]

  %140
  mib[mib mib mib]
  mib[mib mi mi]
  fa[fa fa fa]

  %143
  re[sib sib sib]
  sib[sib sib sib]
  la[la la la]

  %146
  re[re re re]\mbreak
  mi[mi dod dod]
  la[la la la]

  %149
  si[si mi dod]
  la[re re re]
  re[re re re]

  %152
  dod[dod dod dod]
  la'4\f sol\mbreak
  fa mi

  %155
  la sol
  fa mi
  la sol

  %158
  fa r
  do' sib
  la sol

  %161
  do sib
  la sol
  do sib

  %164
  la4. do,8
  lab sib4 sol8
  lab do4 do8\mbreak

  %167
  la! do4 la8
  sib re4 re8
  si re4 do8~

  %170
  do mi4 fa8
  sol[lab16 sol lab8 lab]
  sol4 r

  %173
  do sib
  la sol
  do sib

  %176
  la r
  R2*7
  r4 r8 lab,\pp

  %185
  lab?[lab lab lab]
  lab?[lab lab lab]
  lab?[lab lab lab]

  %188
  lab?[lab lab lab]
  lab?[lab lab lab]\mbreak
  solb[solb solb solb]

  %191
  la![la la la]
  fa[fa fa do']
  fa,[fa fa fa]

  %194
  sol[sol sol sol]
  mib[mib mib lab]
  lab?[lab lab lab]

  %197
  lab?[lab lab lab]
  sol[sol sol sol]
  sol[sol sol sol]\mbreak

  %200
  sol[sol sol sol]
  sol[sol sol sol]
  sol[sol sol sol]

  %203
  sol[sol sol sol]
  fa[lab lab sol]
  sol[sol sol sol]

  %206
  sol[sol sol sol]
  lab[lab sol sol]
  lab[lab lab sol]

  %209
  sol[sol sol sol]\mbreak
  sol[sol sol sol]
  sol[sol sol sol]

  %212
  lab [lab do do]
  do'4\f sib
  la sol

  %215
  do sib
  la sol
  do sib

  %218
  la8[fa fa mi]
  fa2\fermata

}

IIIvlan = \relative do' {

  r8
  la'[do re do]
  do[fa, re mi]
  do[do' re do]

  %4
  do[fa, re mi]
  do[do' re do]
  do4 r

  %7
  mi,8[sol la sol]
  sol[do, la si]
  sol[sol' la sol]

  %10
  sol[do, la si]
  sol[sol' la sol]
  sol[mi fa la]

  %13
  sol[la do, do]\mbreak
  do4 r
  sol'8[la do, do]

  %16
  do[fa sol lab]
  do,[sol' mi sol]
  do, sol'4 lab8

  %19
  do,[la' fad la]
  re, la'4 sib8
  re, si' sol4~

  %22
  sol do,~
  do lab'8 lab
  mi![fa sol mi]

  %25
  do[do' re do]
  do[fa, re mi]
  do[do' re do]

  %28
  do4 r8 sol
  fa[do re do]
  do[fa, re mi]

  %31
  do[do' re do]
  do4 r
  R2*36

  %69
  do8[mi fa mi]
  mi[la fa mi]
  mi[mi fa mi]

  %72
  mi[la fa mi]
  mi[mi fa mi]
  mi[re mi do]

  %75
  mi[si' sold si]
  mi, si'4 do8
  fad,[dod' lad dod]

  %78
  fad, red4 mi8
  fad4 red8 si\mbreak
  si?[la' si sold]

  %81
  mi[mi fa mi]
  mi[fa si, mi]
  mi[mi fa mi]

  %84
  mi4 r
  R2*29
  re8[fa sol fa]

  %115
  fa[sib sol la]
  fa[fa sol fa]
  fa[sib sol la]

  %118
  fa[fa sol fa]\mbreak
  fa4 r
  R2*18

  %138
  sib,8\p[sib sib sib]\mbreak
  sib[sib sol' sol]
  do,[do do do]

  %141
  do [do la' la]
  re,[re re re]

  %143
  sol[sol sol sib,]
  do[do do mi]
  fa[fa fa la,]

  %146
  sib[sib sib sib]\mbreak
  la[la sol sol]
  fa[fa re re]

  %149
  sol[sol la la]
  re[re re re]
  la'[la la la]

  %152
  la,[la la la]
  fa'\f[la sib la]\mbreak
  la[re, sib la]

  %155
  la[la' sib la]
  la[re, sib la]
  la[la' sib la]

  %158
  la[sol la sol]
  fa[do re mi]
  do[fa re mi]

  %161
  do[do' re do]
  do[fa, re mi]
  do[do' re do]

  %164
  do[fa, sol lab]
  do,[sol' mi sol]
  do, sol'4 lab8\mbreak

  %167
  do,[la'? fad la]
  re, la'4 sib8
  re, si' sol4~

  %170
  sol do,~
  do fa8 lab
  mi![fa sol mi]

  %173
  do[do' re do]
  do[fa, re mi]
  do[do' re do]

  %176
  do4 r
  R2*7
  r4 r8 fa,8\p

  %185
  fa[fa fa fa]
  fa[fa fa fa]
  fa[fa fa fa]

  %188
  fa[fa fa fa]
  fa[fa fa fa]\mbreak
  solb[solb solb solb]

  %191
  fa[fa fa fa]
  la,[la la lab']
  fa[fa fa fa]

  %194
  mib[mib mib mib]
  lab,[lab lab fa']
  fa[fa fa fa]

  %197
  fa[fa fa fa]
  sib,[sib sib sib]
  sib[sib sib sib]\mbreak

  %200
  mi![mi mi  mi]
  mi[mi mi mi]
  mi[mi mi mi]

  %203
  mi[mi mi mi]
  fa[fa fa fa]
  fa[fa fa fa]

  %206
  mi[mi mi mi]
  fa[fa sib, do]
  fa[fa fa fa]

  %209
  fa[fa fa fa]\mbreak
  mi[mi mi mi]
  mi[mi mi mi]

  %212
  fa [fa do do]
  la'\f[do re do]
  do[fa, re mi]

  %215
  do[do' re do]
  do[fa, re mi]
  do[do' re do]

  %218
  do[do do do]
  la2\fermata

}

IIIbcn = \relative do {

  r8
  fa[la, sib do]
  fa,[fa' sol mi]
  fa[la, sib do]

  %4
  fa,[fa' sol mi]
  fa[la, sib do]
  fa[re si sol]

  %7
  do[mi fa sol]
  do,,[do' re si]
  do[mi, fa sol]

  %10
  do,[do' re si]
  do[mi, fa sol]
  do,[do' la fa]

  %13
  do'[fa mi fa]\mbreak
  do[mi re do]
  do,[fa' mi fa]

  %16
  do[re mi fa]
  \once\stemUp fa,[sib' sol mi]
  fa[do sib lab]

  %19
  fa'[do' la fad]
  sol[re do sib]
  sol'[re' si do]

  %22
  do,[do' do, fa]
  do[fa re si]
  do[re mi do]

  %25
  fa[la,! sib do]
  fa,[fa' sol mi]
  fa[la, sib do]\mbreak

  %28
  fa,[fa' sol mi]
  fa[la, sib do]
  fa,[fa'sol mi]

  %31
  fa[la, sib do]
  fa,4 r
  fa' la8 fa

  %34
  do'4 r
  fa, la8 fa
  do4 r

  %37
  fa la8 fa
  do'4 r\mbreak
  fa, la8 fa

  %40
  do4 r
  la' la
  sol sol

  %43
  re4. mi8
  fa4. do8
  fa[fa fa fa]

  %46
  mi[re mi do]
  fa4 r
  do r

  %49
  sol' r\mbreak
  re r
  la' r

  %52
  mi r
  la8 r la r
  sol r sol r

  %55
  fa r fa r
  mi r mi r\mbreak
  la r red, r

  %58
  mi4 r
  R2*10
  la8[do, re mi]

  %70
  la,[la' si sold]
  la[do, re mi]
  la,[la' si sold]

  %73
  la[do, re mi]
  la,[si do la]
  la'[re, si sold]

  %76
  la[mi' re do]
  la'[mi dod lad]
  si[fad' mi red]

  %79
  si'[red, si mi]\mbreak
  mi[fad sold mi]
  la[do, re mi]

  %82
  la,[la' si sold]
  la[do, re mi]
  la,4 r

  %85
  R2*29
  sib'8[re, mib fa]
  sib,[sib' do la]

  %116
  sib[re, mib fa]
  sib,[sib' do la]
  sib[re, mib fa]\mbreak

  %119
  sib,4 r
  R2*33
  re8[fa sol la]\mbreak

  %154
  re,,[re' mi dod]
  re[fa sol la]
  re,,[re' mi dod]

  %157
  re[fa sol la]
  re,[mi fa mi]
  fa[la, sib do]

  %160
  fa,[fa' sol mi]
  fa[la, sib do]
  fa,[fa' sol mi]

  %163
  fa[la, sib do]
  fa[la sol fa]
  \once\stemUp fa,[sib' sol mi]

  %166
  fa[do sib lab]\mbreak
  fa'[do' la fad]
  sol[re do sib]

  %169
  sol'[re' si do]
  do,[do' do, fa]
  do[fa re si]

  %172
  do[re mi do]
  fa[la,! sib do]
  fa,[fa' sol mi]

  %175
  fa[la, sib do]
  fa,4 r
  fa' lab8 fa

  %178
  do'4 r\mbreak
  fa, lab8 fa
  do4 r

  %181
  fa lab8 fa
  do'4 r
  fa, lab8 fa

  %184
  do4 r
  R2*28
  fa8[la, sib do]

  %214
  fa,[fa'sol mi]
  fa[la, sib do]
  fa,[fa'sol mi]

  %217
  fa[la, sib do]
  fa,[fa' do' do,]
  fa,2\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s2*13
  <6 4>4 <6+>
  s2*2
  <3->8 <3-> s <6>
  <_-> <3!> s <6>
  s <_-> s <6>
  <5> <_+> s4
  <_!> <6 5>
  s s8 <_->
  s <_!> s <7->
  s2
  <_!>
  s2*16
  <5 4>4 <3>
  s4. <6 5>8
  <5 4>4 <3>
  s2*7
  <_+>2
  s
  <_!>
  s
  <_+>
  s2*13
  s4 s8 <6 5>
  s4 s8 <_+>
  s4 s8 <6 5>
  s4 s8 <_+>
  s2*2
  s8 <_+> s4
  <_+> <6+ 5!>8 <6>
  s <_+> s4
  <_+> s8 <_+>
  s2
  s4 s8 <_+>
  s4 s8 <6 5>
  s2*71
  s4 s8 <6 5>
  s2
  s4 s8 <6 5>
  s2*3
  s4 s8 <6 5>
  s2
  s4 s8 <6 5>
  s2*2
  <_->8 <_-> s <6>
  <_->2
  <_!>8 <_-> s <6>
  s <_+> s4
  <_!>8 s <6 5>4
  s s8 <_->
  s2
  s4 s8 <7>
  <_!>2
  s4 s8 <6 5>
  s2*39
  s4 s8 <6 5>
  s2
  s4 s8 <6 5>

}

forma = {

  \key fa\major
  \time 2/4
  \tempo 2 = 48
  \partial 8 s8
  s2*219
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
#(set-global-staff-size 15)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] Largo molto e spiccato"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

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
        \set Staff.midiInstrument = #"viola"
        \set Staff.instrumentName = \markup \center-column{"[Viola]"}
        \Ivla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"bassoon"
        \set Staff.instrumentName = \markup \center-column{"[Basso]"}
        \Ibc

      >>
    >>

  }

  \layout {

    indent = 1.4\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
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

\pageBreak

\markup\huge "[3.] Largo"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

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
        \set Staff.midiInstrument = #"viola"
        \IIvla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"bassoon"
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

\markup\huge "[4.] Allegro non molto"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new Staff = "main"  <<
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
        \set Staff.midiInstrument = #"viola"
        \IIIvla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"bassoon"
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



