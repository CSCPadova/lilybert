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

  re4 la re, r8 fa'
  mi[re mi re16 dod] re4 r
  la' fa fa, r8 la'

  %4
  sol[fa sol fa16 mi] fa4 r8 sol
  la16(sol) la8 r mi fa16(mi) fa8 r sol\p
  la16(sol la8) r mi_\markup {[\musicglyph #"f"]} fa[mi16 re la'8 la,]

  %7
  sib sol' (la sib) sol[fa16 mi re8 do16 sib]
  la8 fa'(sol la)\mbreak fa [mi16 re do8 sib16 la]
  sol8 mi'(fa sol) dod,4 r8 fa,\p

  %10
  sol8.[fa16 sol8 la] fa4 r8 la'\f
  sol8[fa sol fa16 mi] re4 r8 la\p
  sol[fa sol fa16 mi] re4 r  %%%%ripresa

  %13
  \tuplet 3/2 { re'16\solo(dod) re mi[(re) dod] re(dod) re mi[(re) dod]} re8 la r4
  \tuplet 3/2 { fa'16(mi) fa sol[(fa) mi] fa(mi) fa sol[(fa) mi] } fa8 re r4\mbreak  %%fine prima pagina
  \tuplet 3/2 { la'16(sol) la sib[(la) sol] la(sol) la sib[(la) sol] } la8 fa r4

  %16
  r16 re' re la la fa fa re \tuplet 3/2 { re(mi) re re'[(do) re]  re,(mi) re re'[(do) re]}
  sib32 sol, la sib do re mi fa sol8 r r re re4\tr
  r16 do' do sol sol mi mi do \tuplet 3/2 { do(re) do do'[(sib) do] do,(re) do do'[(sib) do] }

  %19
  la32 fa, sol la sib do re mi fa8 r\mbreak r do do4\tr %%inizio secondo sistema p. 3
  r16 sib' sib fa fa re re sib \tuplet 3/2 { sib(do) sib sib'[(la) sib] sib,(do) sib sib'[(la) sib] }
  sol do, mi do sol' mi sib' sol la4 fa'~

  %22
  \tuplet 3/2 { fa16 mi re do[sib la] } sol4 r mi'~
  \tuplet 3/2 { mi16 re do sib[la sol] } fa4 r re'~
  \tuplet 3/2 { re16 do sib la[sol fa] } mi4\mbreak r r16 fa, la do

  %25
  fa la-.(la-. sib-. sib-. do-. do-. re-. re-. mi-. mi-. fa-.) fa4~
  fa16 mi32 re do16 fa, sol4\tr fa16 la-.(la-. sib-. sib-. do-. do-. re-.
  re-. mi-. mi-. fa-.) fa4~fa16 mi32 re do16 fa, sol4\tr

  %28
  fa do fa, r8 la'
  sol[fa sol \parenthesize fa16 \parenthesize mi] fa8 do la fa\mbreak
  la'4 fa la, r8 do'

  %31
  sib[la sib la16 sol] la8 fa do la
  la'16 sol la8 r sib do16 sib do8 r sol
  la16 sol la8 r sib, do16 sib do8 r sol

  %34
  la [la'16 sib do8 la] sol do r sol
  fa[sol16 la sib8 fa] mi la r mi
  re[mi16 fa sol8 re]\mbreak do4 r8 do'

  %37
  sib[la sib la16 sol] la4 r8 do,
  sib[la sib la16 sol] \tuplet 3/2 { la16\solo (do) sib do[(sib) la] fa'(la) sol la[(sol) fa]
  la(do) sib do[(sib) la]} fa'8 r fa16-.[(mi-. re-. do-. sib-. la-. sol-. fa-.)]

  %40
  sib,(sol' fa'8)~fa4 mi16-.[(re-. do-. sib-. la-. sol-. fa-. mi-.)]
  la,(fa' mi'8)~mi4\mbreak re16-.[(do-. sib-. la-. sol-. fa-. mi-. re-.)]
  sol,(mi're'8)~re4 do16(sib do) re sib(la sib) do

  %43
  la fa la fa do la fa do si8 re sol si
  r16 sol' sib? sol mi do sol mi dod8 mi la dod
  r16 la' re la fa re la re,\mbreak sold,8 sold' si mi

  %46
  mi16 la si la mi si' do si mi, do' re do mi, re' mi re
  mi,4 r \tuplet 3/2 { mi'16(do) mi do[(sib) do] la(mi) la mi[(do) mi] }
  \appoggiatura mi8 fa4. re'8 \tuplet 3/2 { re16(si) re si[(sol) si] \slurDashed sol (re) sol re[(si) re] }\slurSolid

  %49
  \appoggiatura re8 mi4. do'8 \tuplet 3/2 { do16(la) do la[(fa) la] fa(do) fa do[(la) do] }\mbreak
  \appoggiatura do8 re4. si'8 \tuplet 3/2 { sold16(la) si re,[(mi) fa] si,(do) re sold,[(la) si]}
  \appoggiatura si?8 do4 r \tuplet 3/2 { do16 (la) do mi[(do) mi] la(mi) la do[(la) do] }

  %52
  mi4 r16 mi-.(mi-. re-. do-. do-. do-. si-. la-. la-. la-. sol-.
  fa-. fa-. fa-. mi-. re-. re-. re-. do-.) si4~si16 si'-.(si-. sold-.\mbreak
  sold?-. fa!-. fa-. mi-. mi-. re-. re-. do-.) do32 la(si do re mi fa sol? la8) r  %%% inizio p.7

  %55  OKOKOK
  r16 mi re do si4\tr <la' la,> mi
  la,8 la16 si sold la si sold la8 do16 re si do re si
  do8 la'16 si sold la si sold la4 r\mbreak

  %58
  fa8 mi16 re la'8 la, si sol'!(la si)
  sol[fa16 mi re8 do16 si] la8 fa'(sol la)
  fa[mi16 re do8 si16 la] si8.[la16 si8 do]

  %61
  re sold si re, mi [re16 do re8 si]
  do la' si mi,\mbreak mi[re16 do re8 si]
  la4 r8 dod \tuplet 3/2 { re16(dod) re mi[(re) dod] re(dod) re mi[(re) dod] }

  %64
  re8 la r8 mi' \tuplet 3/2 { fa16(mi) fa sol[(fa) mi] fa(mi) fa sol[(fa) mi] }
  fa8 re r la' \tuplet 3/2 { la16(sol) la sib[(la) sol] la(sol) la sib[(la) sol] }
  la8 fa r re' \tuplet 3/2 { re16(dod) re mi[(re) mi] fa(mi) fa sol[(fa) sol] }\mbreak

  %67
  la8 la, la4\tr sib2
  sib16(do) re(do) re(sib) la(sib) \tuplet 3/2 { do(sib) do re[(do) re] mi(re) mi fa[(mi) fa] }
  sol8 sol, sol4\tr la2

  %70
  la16(sib) do(sib) do(la) sol(la) \tuplet 3/2 {sib(la) sib do[(sib) do] re(do) re mi[(re) mi]}\mbreak
  fa8 fa, fa4\tr sol2
  sol16(la) sib(la) sib(sol) fa(sol) \slurDashed \tuplet 3/2 { la(sol) la si[(la) si] dod(si) dod re[(dod) re] }\slurSolid

  %73
  mi8 mi, mi4\tr fa16 la fa re la fa re la
  sib4 r la''16 dod la mi dod la mi dod
  re8\noBeam \tuplet 3/2 { fa'16(mi) fa sol[(fa) sol] la(sol) la }\mbreak sib8-.(sib-. sib-. sib-.)

  %76
  sib[la16(sol) la(sol) fa(mi)] fa4 r8 la
  re,,16(la' fa') la\staccatissimo fa\staccatissimo re\staccatissimo la\staccatissimo re,\staccatissimo re(la' fa') la\staccatissimo fa\staccatissimo re\staccatissimo la\staccatissimo re,\staccatissimo
  sol,(re' sib') re sib sol re sol, sol(re' sib') re sib sol re sol,

  %79
  sol(re' si') re si sol re sol, sol(re' si') re si sol re sol,
  sol(mi' do') mi do sol mi sol,\mbreak sol(mi' do') mi do sol mi sol,
  sol(mi' dod') mi dod sol mi sol, sol(mi' dod') mi dod sol mi sol,

  %82
  re'(la' fa') la fa re la re, re(sib' sol') sib sol re sib re,
  mi (si' sold') si sold si, mi, mi mi (dod' la') sib? la dod, mi, mi
  mi (dod' la') sib la dod, mi, mi mi (dod' sol') sib sol dod, mi, mi\mbreak

  %85
  <<fa'4\\\stemUp \once \override Stem #'transparent = ##t la,\\\stemDown re,>> r8 fa' \tuplet 3/2 { sol16(fa) sol la[(sol) la] sib(la) sib dod[(si) dod] }
  re8 fa,16 sol mi4\tr re r8 fa
  \tuplet 3/2 { sol16(fa) sol la[(sol) la] sib(la) sib dod[(si) dod] } re8 fa,16 sol mi4\tr

  %88
  re la re, r8 fa'
  mi[re mi re16 dod] re4 r
  la' fa fa, r8 la'

  %91
  sol[fa sol fa16 mi] fa4 r8 sol
  la16(sol) la8 r mi fa16(mi) fa8 r sol\p
  la16(sol la8) r mi_\markup {[\musicglyph #"f"]} fa[mi16 re la'8 la,]

  %94
  sib sol' (la sib) sol[fa16 mi re8 do16 sib]
  la8 fa'(sol la)\mbreak fa [mi16 re do8 sib16 la]
  sol8 mi'(fa sol) dod,4 r8 fa,\p

  %97
  sol8.[fa16 sol8 la] fa4 r8 la'\f
  sol8[fa sol fa16 mi] re4 r8 la\p
  sol[fa sol fa16 mi] re4\fermata r

}

IvlIIn = \relative do'' {

  re4 la re, r8 fa'
  mi[re mi re16 dod] re4 r
  la' fa fa, r8 la'

  %4
  sol[fa sol fa16 mi] fa4 r8 sol
  la16(sol) la8 r mi fa16(mi) fa8 r sol\p
  la16(sol la8) r mi_\markup {[\musicglyph #"f"]} fa[mi16 re la'8 la,]

  %7
  sib sol' (la sib) sol[fa16 mi re8 do16 sib]
  la8 fa'(sol la)\mbreak fa [mi16 re do8 sib16 la]
  sol8 mi'(fa sol) dod,4 r8 fa,\p

  %10
  sol8.[fa16 sol8 la] fa4 r8 la'\f
  sol8[fa sol fa16 mi] re4 r8 la\p
  sol[fa sol fa16 mi] re4 r  %%%%ripresa

  %13
  R1
  \tuplet 3/2 { re'16\solo(dod) re mi[(re) dod] re(dod) re mi[(re) dod]} re8 la r4
  \tuplet 3/2 { fa'16(mi) fa sol[(fa) mi] fa(mi) fa sol[(fa) mi] } fa8 re r4

  %16
  R1
  r16 sol sol re re sib sib sol \tuplet 3/2 { sol(la) sol sol'[(fa) sol] sol,(la) sol sol'[(fa) sol] }
  mi32 do re  mi fa sol la sib do8 r r sol sol4\tr

  %19
  r16 fa fa do do la la fa\mbreak \slurDashed \tuplet 3/2 { fa (sol) fa fa'[(mib) fa] fa, (sol) fa fa'[(mib) fa] }
  re32 sib do re mib fa sol la sib8 r r fa fa4\tr
  mi?16 sol, do sol mi' do sol' mi fa4 r

  %22
  r sib~\tuplet 3/2 { sib16 la sol fa[mi re] } do4
  r la'~ \tuplet 3/2 { la16 sol fa mi[re do] } sib4
  r sol'~\mbreak \tuplet 3/2 { sol16 fa mi re[do sib] }\slurSolid la do, fa la

  %25
  do fa-.(fa-. sol-. sol-. la-. la-. sib-. sib-. do-. do-. la-.) la4~
  la8 fa4 mi8 fa16 fa-.(fa-. sol-. sol-. la-. la-. sib-.
  sib-. do-. do-. la-.) la4~la8 fa4 mi8

  %28
  fa4 do fa, r8 la'
  sol[fa sol \parenthesize fa16 \parenthesize mi] fa8 do la fa\mbreak
  la'4 fa la, r8 do'

  %31
  sib[la sib la16 sol] la8 fa do la
  la'16 sol la8 r sib do16 sib do8 r sol
  la16 sol la8 r sib, do16 sib do8 r sol

  %34
  la [la'16 sib do8 la] sol do r sol
  fa[sol16 la sib8 fa] mi la r mi
  re[mi16 fa sol8 re]\mbreak do4 r8 do'

  %37
  sib[la sib la16 sol] la4 r8 do,
  sib[la sib la16 sol] la8 r \tuplet 3/2 { la16\solo (do) sib do[(sib) la]
                                           fa'(la) sol la[(sol) fa] la(do) sib do[(sib) la]} fa'8 r r4

  %40
  sib,16-.[(la-. sol-. fa-. mi-. re-. do-. sib-.)] mi,(do' sib'8)~sib4
  la16-.[(sol-. fa-. mi-. re-. do-. sib-. la-.)]\mbreak re,(sib' la'8)~la4
  sol16-.[(fa-. mi-. re-. do-. sib-. la-. sol-.)] la'16(sol la) sib sol(fa sol) la

  %43
  fa4 r r16 sol si sol re si sol re
  do8 mi sol do r16 sol' sib? sol mi dod sol mi
  re8 fa la re\mbreak r16 sold si sold re si sold mi

  %46
  do'?4 r mi16 la si la mi si' do si
  mi, do' re do mi, re' mi re mi,4 r
  \tuplet 3/2 { la16(fa) la fa[(re) fa] re(la) re la[(fa) la] } \appoggiatura la8 si4. sol'8

  %49
  \tuplet 3/2 { sol16(mi) sol mi[(do) mi] do(sol) do sol[(mi) sol]} \appoggiatura sol8 la4. fa'8\mbreak
  \slurDashed \tuplet 3/2 { fa16(re) fa re[(si) re] si(fa) si fa[(re) re'] } re4 r\slurSolid
  \tuplet 3/2 { do16(la) do mi[(do) mi] la(mi) la do[(la) do] } mi4 r

  %52
  r r16 do-.(do-. si-. la-. la-. la-. sol-. fa-. fa-. fa-. mi-.
  re-. re-. re-. do-. si-. si-. si-. la-.) sold4~sold16 sold'-.(sold-. mi-.\mbreak
  mi-. re-. re-. do-. do-. si-. si-. la-.) la4 r32 la(si do re mi fa sol)

  %55
  la16 do, si la sold4\tr <la' la,> mi
  la,8 la16 si sold la si sold la8 do16 re si do re si
  do8 la'16 si sold la si sold la4 r\mbreak

  %58
  fa8 mi16 re la'8 la, si sol'!(la si)
  sol[fa16 mi re8 do16 si] la8 fa'(sol la)
  fa[mi16 re do8 si16 la] si8.[la16 si8 do]

  %61
  re sold si re, mi [re16 do re8 si]
  do la' si mi,\mbreak mi[re16 do re8 si]
  la4 r r2

  %64
  r4 r8 dod \tuplet 3/2 { re16(dod) re mi[(re) dod] re(dod) re mi[(re) dod] }
  re8 la r8 mi' \tuplet 3/2 { fa16(mi) fa sol[(fa) mi] fa(mi) fa sol[(fa) mi] }
  fa8 re r4 r2\mbreak

  %67
  r \tuplet 3/2 { sol16(fad) sol la[(sol) la] sib(la) sib do[(sib) do] }
  re8 re, re4\tr mi2
  mi16(fa) sol(fa) sol(mi) re(mi) \tuplet 3/2 { fa (mi) fa sol[(fa) sol] la(sol) la sib[(la) sib] }

  %70
  do8 do, do4\tr  re2\mbreak
  re16(mi) fa(mi) fa(re) dod(re) \tuplet 3/2 { mi(re) mi fa[(mi) fa] sol(fa) sol la[(sol) la] }
  sib8 sib, sib\tr[sol'] dod,2

  %73
  dod16(re) mi(re) mi(dod) si(dod) re4 r
  sol16 sib sol re sib sol re sib la4 r
  r8 \tuplet 3/2 { re'16(dod) re mi[(re) mi] fa(mi) fa\mbreak } sol8-.(sol-. sol-. sol-.)

  %76
  sol8[fa16(mi) fa(mi) re(dod)] re4 r8 fa
  fa16(re la8) la'16\staccatissimo fa\staccatissimo re8\staccatissimo fa16(re la8) la'16\staccatissimo fa\staccatissimo re8\staccatissimo
  sib16(sol re8) re'16\staccatissimo sib\staccatissimo sol8\staccatissimo sib16(sol re8) re'16\staccatissimo sib\staccatissimo sol8\staccatissimo

  %79
  si16(sol re8) re'16\staccatissimo si\staccatissimo sol8\staccatissimo si16(sol re8) re'16\staccatissimo si\staccatissimo sol8\staccatissimo
  do16(sol mi8) mi'16 do sol8\mbreak do16(sol mi8) mi'16 do sol8
  dod16(sol mi8) mi'16\staccatissimo dod\staccatissimo sol8\staccatissimo dod16(sol mi8) mi'16\staccatissimo dod\staccatissimo sol8\staccatissimo

  %82
  fa'16(re la8) la'16\staccatissimo fa\staccatissimo re8\staccatissimo sol16(re sib8) sib'16\staccatissimo sol\staccatissimo re8\staccatissimo
  sol!16(mi si8) si'16 sold re8 la'16(mi dod8)  mi16 dod la8
  la'16(mi dod8) mi16 dod la8 sol'?16(mi dod8) mi16 dod la8\mbreak

  %85
  <<fa'4\\\stemUp \once \override Stem #'transparent = ##t la,\\\stemDown re,>> r8 re' \tuplet 3/2 { mi16(re) mi fa[(mi) fa] sol(fa) sol la[(sol) la] }
  fa8 re16 mi dod4 re r8 re
  \tuplet 3/2 { mi16(re) mi fa[(mi) fa] sol(fa) sol la[(sol) la] } fa8 re16 mi dod4\tr

  %88
  re4 la re, r8 fa'
  mi[re mi re16 dod] re4 r
  la' fa fa, r8 la'

  %91
  sol[fa sol fa16 mi] fa4 r8 sol
  la16(sol) la8 r mi fa16(mi) fa8 r sol\p
  la16(sol la8) r mi_\markup {[\musicglyph #"f"]} fa[mi16 re la'8 la,]

  %94
  sib sol' (la sib) sol[fa16 mi re8 do16 sib]
  la8 fa'(sol la)\mbreak fa [mi16 re do8 sib16 la]
  sol8 mi'(fa sol) dod,4 r8 fa,\p

  %97
  sol8.[fa16 sol8 la] fa4 r8 la'\f
  sol8[fa sol fa16 mi] re4 r8 la\p
  sol[fa sol fa16 mi] re4\fermata r

}

IvlIIIn =  \relative do'' {

  R1*2
  re4 la re, r8 fa'
  mi[re mi re16 dod] re4 r8 mi

  %5
  fa16(mi) fa8 r dod re16(dod) re8 r mi\p
  fa16(mi) fa8 r dod_\markup {[\musicglyph #"f"]} re4 r
  sib8[la16 sol re'8 re,] mi do'(re mi)

  %8
  do[sib16 la sol8 fa16 mi]\mbreak re8 sib'(do re)
  sib[la16 sol fa8 sib] la4 r8 re,\p
  mi8.[re16 mi8 dod] re4 r8 fa'\f

  %11
  mi[re mi re16 dod] re4 r8 fa,\p
  mi[re mi re16 dod] re4 r %%% ripresa
  r2 re'4 la

  %14
  re, r re' la\mbreak
  \parenthesize re, r re' la
  re, r re' fa,

  %17
  sol r sol sib,
  do r do' mi,
  fa r\mbreak  fa la,

  %20
  sib r sib' re,
  mi8 re mi do fa sol la fa
  sol la sib sol do, re mi do

  %23
  fa sol la fa sib, do re sib
  mi fa sol mi\mbreak  fa sol la sol
  fa2~fa8 sol la fa

  %26
  do'4 do, fa2~
  fa8 sol la fa do'4 do,
  fa r fa' fa,

  %29
  do r r2\mbreak
  fa'4 do fa, r8 la'
  sol[fa sol fa16 mi] fa8 do la fa

  %32
  fa'16 mi fa8 r sol la16 sol la8 r mi
  fa16 mi fa8 r sol, la16 sol la8 r mi
  fa[fa'16 sol la8 fa] do' do,4 do'8

  %35
  sib sib,4 sib'8 la la,4 la'8
  sol sol,4 sol'8\mbreak la4 r8 la
  sol[fa sol fa16 mi] fa4 r8 la,

  %38
  sol[fa sol fa16 mi] fa8 r r4
  r2 r8 do' re re
  re re re re mi mi mi mi

  %41
  do do do do\mbreak re re re re
  sib sib sib sib la do mi[mi]
  fa4 r r2

  %44
  R1*3
  r2 do,8 do do do
  re re re re sol sol sol sol

  %49
  do, do do do fa fa fa fa\mbreak
  si, si si si mi mi mi mi
  la,4 r la r

  %52
  la8[la16 si do8 la] r2
  r r8 mi'16 [fad sold8 mi]
  R1*2

  %56
  la'4 mi la,8[la16 si sold la si sold]
  la8 do16 re si do re si la8 si16 la mi'8 mi,
  fa re'(mi fa) re[do16 si la8 sol16 fa]
  mi8 do'(re mi) do[si16 la sol8 fa16 mi]
  re8 si'(do re) sold,8.[fad16 sold8 la]

  %61
  si re sold si, do[si16 la si8 sold]
  la mi' sold si,\mbreak do[si16 la si8 sold]
  la4 r r2

  %64
  re4 la re, r
  re' la re, r
  re' la re,8 dod re mi\mbreak

  %67
  fa8 sol la fa sol fad sol la
  sib4 r do,8 si do re
  mi4 r fa8 mi fa sol

  %70
  la4 r sib,?8 la sib do\mbreak
  re4 r mi8 re mi fa
  sol4 r la,8 si dod si

  %73
  la4 r r2
  R1
  r2 \mbreak sol'8 la sib sol

  %76
  dod,4. la'8 re, mi fa re
  R1*13
  re'4 la re, r8 fa'

  %91
  mi[re mi re16 dod] re4 r8 mi
  fa16(mi) fa8 r dod re16(dod) re8 r mi\p
  fa16(mi) fa8 r dod re4 r

  %94
  sib8[la16 sol re'8 re,] mi do'(re mi)
  do[sib16 la sol8 fa16 mi]\mbreak re8 sib'(do re)
  sib[la16 sol fa8 sib] la4 r8 re,\p

  %97
  mi8.[re16 mi8 dod] re4 r8 fa'\f
  mi[re mi re16 dod] re4 r8 fa,\p
  mi[re mi re16 dod] re4\fermata r

}

Ivlan = \relative do' {

  R1*4
  re'4 la re, r
  re' la re, r8 re

  %7
  re4 r8 sol, sol4 r8 do
  do4 r8 fa,\mbreak fa4 r8 sib
  sib4 r8 mi, mi4 r8 re'\p

  %10
  sol,8 sol mi' la, re4 r8 la'\f
  la la sib la la4 r8 la,\p
  la la sib la la4 r  %%%% ripresa
  r2 re'4 la

  %14
  re, r re' la\mbreak
  \parenthesize re, r re' la
  re, r re' fa,

  %17
  sol r sol sib,
  do r do' mi,
  fa r\mbreak  fa la,

  %20
  sib r sib' re,
  mi8 re mi do fa sol la fa
  sol la sib sol do, re mi do

  %23
  fa sol la fa sib, do re sib
  mi fa sol mi\mbreak  fa sol la sol
  fa2~fa8 sol la fa

  %26
  do'4 do, fa2~
  fa8 sol la fa do'4 do,
  fa r fa' fa,

  %29
  do r r2
  r do'4 fa,
  do r r2

  %32
  r fa4 do
  fa, r fa' do
  fa, r r8 sol' sol sol

  %35
  r fa fa fa r mi mi mi
  r re re re\mbreak fa[la16 sib do8 la]
  mi do re do do[la'16 sib do8 la]

  %38
  mi do re do do8 r r4
  r2 r8 la' la la
  sib sib sib sib sol sol sol sol

  %41
  la la la la\mbreak fa fa fa fa
  sol sol sol mi do la' sib mi,
  do4 r r2

  %44
  R1*3
  r2 do8 do do do
  re re re re sol sol sol sol

  %49
  do, do do do fa fa fa fa\mbreak
  si, si si si mi mi mi mi
  la,4 r la r

  %52
  la8[la16 si do8 la] r2
  r r8 mi'16 [fad sold8 mi]
  R1*2

  %56
  r2 la4 mi
  la, r mi' r8 do
  la4 r8 fa' fa4 r8 si,

  %59
  si?4 r8 mi mi4 r8 la,
  la4 r8 re re4 r
  sold4. sold8 mi mi fa mi

  %62
  mi do' si sold\mbreak mi mi fa mi
  do4 r r2
  re'4 la re, r
  re' la re, r
  re' la re,8 dod re mi\mbreak

  %67
  fa8 sol la fa sol fad sol la
  sib4 r do,8 si do re
  mi4 r fa8 mi fa sol

  %70
  la4 r sib,?8 la sib do\mbreak
  re4 r mi8 re mi fa
  sol4 r la,8 si dod si

  %73
  la4 r r2
  R1
  r2 \mbreak sol'8 la sib sol

  %76
  dod,4. la'8  re, mi fa re
  R1*15
  re'4 la re, r

  %93
  re' la re, r8 re
  re4 r8 sol, sol4 r8 do
  do4 r8 fa,\mbreak fa4 r8 sib

  %96
  sib4 r8 mi, mi4 r8 re'\p
  sol,8 sol mi' la, re4 r8 la'\f
  la la sib la la4 r8 la,\p

  %99
  la la sib la la4\fermata r

}

Ibcn = \relative do {

  R1*3
  r2 re'4 la
  re, r re' la

  %6
  re, r re r8 fad
  sol4 r8 sib, do4 r8 mi
  fa4 r8 la,\mbreak sib4 r8 re

  %9
  mi4 r8 sol, la4 r
  r2 r4 r8 re\f
  la' re, sol, la re,4 r8 re'\p

  %12
  la re sol, la re,4 r %%ripresa
  r2 re''4 la

  %14
  re, r re' la\mbreak
  \parenthesize re, r re' la
  re, r re' fa,

  %17
  sol r sol sib,
  do r do' mi,
  fa r\mbreak  fa la,

  %20
  sib r sib' re,
  mi8 re mi do fa sol la fa
  sol la sib sol do, re mi do

  %23
  fa sol la fa sib, do re sib
  mi fa sol mi\mbreak  fa sol la sol
  fa2~fa8 sol la fa

  %26
  do'4 do, fa2~
  fa8 sol la fa do'4 do,
  fa r fa' fa,

  %29
  do r r2
  r do'4 fa,
  do r r2

  %32
  fa'4 do fa, r
  fa' do fa, r
  fa fa'2 mi4~

  %35
  mi re2 do4~
  do sib\mbreak la8[fa16 sol la8 fa]
  do' fa, sib, do fa,[fa'16 sol la8 fa]

  %38
  do' fa, sib,[do] fa, r fa r
  fa r fa r fa fa' fa fa
  sol sol sol sol do, do do do

  %41
  fa fa fa fa\mbreak sib sib sib sib
  mi, mi mi mi fa fa sol do,
  fa fa fa fa sol sol sol sol

  %44
  do, do do do la la la la
  re re re re\mbreak mi mi mi mi
  la,4 r la r

  %47
  la r la r
  R1*3
  la4 r la r

  %52
  la8[la16 si do8 la] r2
  r r8 mi'16[fad sold8 mi]\mbreak
  r2 la,4 la

  %55
  la8 re mi mi, la4 r
  R1
  la'4 mi la, r8 la

  %58
  re4 r8 re sol4 r8 sol,
  do4 r8 do fa4 r8 fa
  si,4 r8 si mi4 r

  %61
  mi8 fad sold mi la la, re mi
  la, la' mi' mi,\mbreak la la, re mi
  la,4 r r2

  %64
  re'4 la re, r
  re' la re, r
  re' la re, r4

  %67
  re8 mi fa re sol4 r
  sol8 la sib sol do4 r
  do,8 re mi do fa4 r

  %70
  fa8 sol la fa sib4 r\mbreak
  sib,8 do re sib mi4 r
  sol8 la sib sib, la4 r

  %73
  la8 si dod la re4 fa
  sol sol, la la'
  re, r\mbreak r2

  %76
  R1
  re8 r re r re r re r
  sol r sol r sol r sol r

  %79
  sol r sol r sol r sol r
  do, r do r\mbreak do r do r
  la r la r la r la r

  %82
  re r re r sol, r sol r
  mi' r mi r la, r la r
  la r la r la r la r

  %85
  re8 mi fa re la2
  re'8 re, la'[la,] re mi fa re
  la2 re'8 re, la'[la,]

  %88
  re4 r r2
  R1*2
  r2 re'4 la

  %92
  re, r re' la
  re, r re r8 fad
  sol4 r8 sib, do4 r8 mi

  %95
  fa4 r8 la,\mbreak sib4 r8 re
  mi4 r8 sol, la4 r
  r2 r4 r8 re\f

  %98
  la' re, sol, la re,4 r8 re'\p
  la re sol, la re,4\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\minor
  \time 4/4
  \tempo 2 = 45
  s1*99
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

  sol4 la \appoggiatura sol8 fad4 do'~
  do8 mib,(re do) sib sol do'4~
  do8 re,(fad la) fad'4. sol16 la

  %4
  re,4. sol8 do,4. la'8
  sib,4 dod,8 dod' re[re,] r4
  r8 dod(mi sol) mi'4. fa16 sol\mbreak

  %7
  la4 r8 sol \appoggiatura fa8 mi4. dod8
  \appoggiatura sib8 la4. mi'8 re16(mi) fa(sol) la8 fa
  re'(sib) sol(mib) do'(la) fa(re)

  %10
  sib' sol r re~re sol,(sib re)
  mib2~mib4 re8 do
  sib16 re do sib la4\tr \appoggiatura la'8 sol32\solo(fad sol16)~sol8\noBeam \appoggiatura sib la32(sol la16) ~la8\noBeam\mbreak

  %13  OK
  \appoggiatura do8 sib32(la sib16)~sib8\noBeam  \appoggiatura re8 do32(sib do16)~do8\noBeam \appoggiatura mib re32(do re16)~re8\noBeam \appoggiatura fa mib32(re mib16)~mib8\noBeam
  fad,4\tr sol re'2~
  re32 do-.(sib-. la-. sol-. fa?-. mib-. re-. do-. sib-. la-. sol-.) re''8\noBeam do2~

  %16 OK
  do32 sib-.(la-. sol-. fa-. mib-. re-. do-. sib-. la-. sol-. fa-.) do''8\noBeam sib2~\mbreak
  sib32 la-.(sol-. fa-. mib-. re-. do-. sib-. la-. sol-. fa-. mib-.) sib''8\noBeam la2
  sib16 fa-.(fa-. sib-.) r mib,-.(mib-. do'-.) r re,-.(re-. sib'-.) r do,-.(do-. la'-.)

  %19
  sib32 fa(sol fa sol fa sol fa) sol16(mib re do) sib8 fa' sib4~
  sib8 [la16 sol fa8 mib] re sib fa'4~
  fa8[sol16 fa mib8 re] mib do r lab'\mbreak

  %22
  lab32-.fa-. re-. sib-. fa-.[sib-. re-. fa-.] lab-. fa-. re-. sib-. fa'-.[re-. sib-. fa-.] sol'8\tr sol\tr sol\tr sol\tr
  sol32 mib do lab mib[lab do mib] sol mib do lab mib'[do lab mib] fa'8\tr fa\tr fa\tr fa\tr
  fa32 re si sol re[sol si re] fa re si sol re'[si sol re] mib'16 sol8 mib16 re fa8 re16\mbreak

  %25
  mib sol8 mib16 re fa8 re16 do4 r16 la(re fad)
  \appoggiatura la8 sol32(fad sol16)~sol8\noBeam \appoggiatura sib la32(sol la16)~la8\noBeam \appoggiatura do8 sib16 la sib8 \appoggiatura sol fad32(mi fad16)~fad8\noBeam
  sol sol, re''32-.(do-. sib-. la-. sol-. fa-. mib-. re-.) mib4 do'32-.(sib-. la-. sol-. fa-. mib-. re-. do-.)

  %28
  re4 sib'32-.(la-. sol-. fa-. mib-. re-. do-. sib-.) do4 la'32-.(sol-. fad-. mi?-. re-. do-. sib-. la-.)\mbreak
  sib16 sol'-.(sol-. sib-.) r sib,-.(sib-. re-.) r fad-.(fad-. la-.) r la,-.(la-. do-.)
  sib re do sib la4\tr sol8 sol(sib re)

  %31
  mib2~mib4 re8 do
  sib16 re do sib la4\tr sol2\fermata

}

IIvlIIn = \relative do'' {

  sol4 la \appoggiatura sol8 fad4 do'~
  do8 mib,(re do) sib sol do'4~
  do8 re,(fad la) fad'4. sol16 la

  %4
  re,4. sol8 do,4. la'8
  sib,4 dod,8 dod' re[re,] r4
  r8 dod(mi sol) mi'4. fa16 sol\mbreak

  %7
  la4 r8 sol \appoggiatura fa8 mi4. dod8
  \appoggiatura sib8 la4. mi'8 re16(mi) fa(sol) la8 fa
  re'(sib) sol(mib) do'(la) fa(re)

  %10
  sib' sol r re~re sol,(sib re)
  mib2~mib4 re8 do
  sib16 re do sib la4\tr sol r

  %13
  \appoggiatura la'8 sol32\solo(fad sol16)~sol8\noBeam \appoggiatura sib la32(sol la16) ~la8\noBeam \appoggiatura do8 sib32(la sib16)~sib8\noBeam  \appoggiatura re8 do32(sib do16)~do8\noBeam
  \appoggiatura mib re32(do re16)~re8\noBeam \appoggiatura fa mib32(re mib16)~mib8\noBeam fad,4\tr sol
  sol2~sol32 fa?-. (mib-. re-. do-. sib la-. sol-. fa-. mib-. re-. do-.) sol''8\noBeam

  %16
  fa2~fa32 mib-.( re-. do-. sib-. la-. sol-. fa-. mib-. re-. do-. sib-.) fa''8\noBeam\mbreak
  mib2~mib32 re-.(do-. sib-. la-. sol-. fa-. mib-. re-. do-. sib-. la-.) mib''8\noBeam
  re16 re-.( re-. fa-.) r do-.(do-. fa-.) r sib,-.(sib-. fa'-.) r la,-.(la-. fa'-.)

  %19
  r32 re(mib re mib re mib re) mib16(do sib la) sib4 r8 fa'
  do'2 sib8 sib, r sib
  sol'2 sol8 sol, r4

  %22
  r4 r8 re' re32 sib sol re sib[re sol sib] re sib sol re sib'[sol re sib]
  do'8\tr do\tr do\tr do\tr do32 lab fa do lab [do fa lab] do lab fa do lab'[fa do lab]
  si'8\tr si\tr si\tr si\tr  do16 mib8 do16 si re8 si16\mbreak

  %25
  do mib8 do16 si re8 si16 do4 r
  r r16 la(re fad) \appoggiatura la8 sol32(fad sol16)~sol8\noBeam \appoggiatura sib la32(sol la16)~la8\noBeam
  sib sib, r4 sol'32-.(fa-. mib-. re-. do-. sib-. la-. sol-.) la4

  %28
  fa'32(mib re do sib la sol fa) sol4 mib'32(re do sib la sol fa mib) fad'4\mbreak
  sol,16 re'-.(re-. sol-.) r sol,-. (sol-. sib-.) r re-.(re-. fad-.) r fad,-.(fad-. la-.)
  sol sib la sol fad4 sol8 sol(sib re)

  %31
  mib2~mib4 re8 do
  sib16 re do sib la4\tr sol2\fermata

}

IIvlIIIn =  \relative do'' {

  R1
  r2 sol4 la
  \appoggiatura sol8 fad4 do'~do8 mib,(re do)

  %4
  sib sol sib''2 la4~
  la8 sol la, sol' fa4 sol~
  sol8 la,,(dod mi) dod'4. re16 mi\mbreak

  %7
  la,8 la, r4 r8 dod(mi sol)
  mi'4. fa16 sol la8(fa) re4
  sib'8(sol) do,?4 la'8(fa) sib,4

  %10
  sol'8(mib) la,4 sib r
  r8 sol(do sol') fad2
  sol16 sib, la sol fad4\tr sol8 sol fad re\mbreak

  %13
  sol sol fad re sol sol do, do
  re re' sol,[do,] re re' sib sol
  mib mib fa sol la, la sib do

  %16
  re re mib fa sol, sol la sib\mbreak
  do do re mib fa fa la, fa'
  sib, sib' do fa, sib, sib' fa mib

  %19
  re sib' mib,[fa] sib, sib' sol fa
  mib4 fa sib,8 sib' re sib
  si4. si8 do, do' lab fa\mbreak

  %22
  sib,?4. sib8 mib4. mib8
  lab,4. lab8 re4. re8
  sol,4. sol8 do do sol' sol,\mbreak

  %25
  R1*6
  r8 sol'(do sol') fad2

  %32
  sol16 sib, la sol fad4\tr sol2\fermata

}

IIvlan = \relative do' {

  R1*4
  r2 re4 mi
  \appoggiatura re8 dod4 sol'~sol8 sib,(la sol)\mbreak

  %7
  fa re sol'4~sol8 la,(dod mi)
  dod'4. re16 mi la,4. re8
  sol,4. do8 fa,4. sib8

  %10
  mib,4 fad,8 fad' sol4 r
  r8 mib(sol do) la4. fad8
  re mib la, re sib  sol' fad re

  %13
  sol sol fad re sol sol do, do
  re re' sol,[do,] re re' sib sol
  mib mib fa sol la, la sib do

  %16
  re re mib fa sol, sol la sib\mbreak
  do do re mib fa fa la, fa'
  sib, sib' do fa, sib, sib' fa mib

  %19
  re sib' mib,[fa] sib, sib' sol fa
  mib4 fa sib,8 sib' re sib
  si4. si8 do, do' lab fa\mbreak

  %22
  sib,?4. sib8 mib4. mib8
  lab,4. lab8 re4. re8
  sol,4. sol8 do do sol' sol,\mbreak

  %25
  R1*6
  r8 mib'(sol do) la4. fad8
  re mib la, re sib2\fermata

}

IIbcn = \relative do {

  R1*6
  re4 mi \appoggiatura re8 dod4 sol'~
  sol8 sib,(la sol) fa re fa''4~

  %9
  fa mib2 re4~
  re8 do re, do' sib4 r
  r8 do, do do' re,4. re'8

  %12
  sol, do, re re, sol4 r\mbreak
  R1*18
  r8 do do do' re4. re,8

  %32
  sol do, re re, sol2\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\minor
  \time 4/4
  \tempo 4 = 50
  s1*32
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

  re8\staccatissimo
  dod\staccatissimo [fa\staccatissimo mi\staccatissimo la\staccatissimo]
  sol4(fa8) la

  %3
  mi8 [re dod re]\mbreak
  la la'4 re,8
  dod[fa mi la]

  %6
  sol4(fa8) la,
  mi[re dod re]
  la4 r8 re''  %%%inizio ripresa

  %9
  fa, [la re, re']
  \appoggiatura do sib4. re,8
  mi[sol do, do']

  %12
  \appoggiatura sib la4. do,8
  re [fa sib, sib']
  \appoggiatura la sol4. sib8

  %15
  dod,[mi la, la']\mbreak
  fa[la dod, mi]

  %17
  re[fa la, do?]
  sib[re fad, la]
  sol[sib re, fa?]

  %20
  mi[sol si, re]
  dod4 r8 fa'
  mi[dod re sib]

  %23
  sib4(la8) fa'
  mi[dod re sib]
  sib4 (la8) la'

  %26
  fa[re  mi dod]
  re4 r8 fa,
  mi[dod re sib']\mbreak

  %29
  sib4(la8) fa
  mi[dod re sib']
  sib4(la8) la'

  %32
  fa[re mi dod]
  re4 r8 re %%%fine ripresa
  re16(fa la8 re) la

  %35
  sib[re, sol, re'']
  dod16(si) la(sol) fa8 mi
  re la re,4

  %38
  r r8 fa'
  sol\tr fa r fa
  sol\tr fa r dod\mbreak

  %41
  re4 r8 la'
  re,16 fa la re re, fa la re
  sib [do re do sib la sol fa]

  %44
  do mi sol do do, mi sol do
  la [sib do sib la sol fa mi]
  sib re fa sib sib, re fa sib

  %47
  sol [la sib la sol fa mi re]
  mi [fa sol fa  mi re do sib]
  la do re do fa8 r

  %50
  r16 la sib la do8 r
  R2\mbreak
  fa16 do la fa fa' do la fa

  %53
  fa' fa, sol fa sol sol la sol
  la la sib la sib sib do sib
  do do re do re re mi re

  %56
  mi mi fa mi fa8 r
  r8 fa[(mi re]
  do[sib la sol)]

  %59
  la sol16 fa sol4\tr
  fa8[fa'(mi re]
  do[sib la sol)]

  %62
  la sol16 fa sol4\tr
  fa4\tu r8 fa\mbreak
  mi[la sol do]

  %65
  sib4(la8) do
  sol[fa mi fa]
  do do'4 fa,8

  %68
  mi[la sol do]
  sib4(la8) do,
  sol[fa mi fa]

  %71
  do[do' mi sol]
  la[do mi, sol]
  fa[la do, mib]

  %74
  re[fa la, do]
  sib[re fa, la]
  sol[sib re, fa]\mbreak

  %77
  mi4 r8 la'
  sol[mi fa re]
  re4(do8) la'

  %80
  sol[mi fa re]
  re4(do8) do'
  la[fa sol mi]

  %83
  fa,16(do' fa8) fa4\tr
  mi,16(do' sol'8) sol4\tr
  la16(sib do8) la4\tr

  %86
  sol16(la sib8) sib4\tr
  la16 fa' fa8 r16 mi mi8
  r16 re re8 r16 do sib la

  %89
  sol mi' mi8 r16 re re8\mbreak  %%% fine p. 17  OK
  r16 do do8 r16 sib la sol
  fa re' re8 r16 do do8

  %92
  r16 sib sib8 r16 la sol fa
  mi la la8 r16 sol fa mi
  fa re re'8~re16 do si la

  %95
  sold mi si'8~si16 re, do si
  do8 la r la'
  do16(si la8) re si

  %98
  mi16(re do8) fa re
  sold16(fad mi8) la fa?\mbreak
  fa mi r re

  %101
  re\tr do r si
  si? do4 si16 la
  mi'8 mi, r si'

  %104
  si? do4 si16 la
  mi'8 mi, r16 la do mi,
  fa la fa dod re fa re la

  %107
  si re si fad sold si sold re
  mi sold mi si do8 la'16 si
  do8[do16 re mi8 fad16 sold]\mbreak

  %110
  la8 la16 si si4\tr
  la16 mi do mi la,4
  R2*5

  %117
  r4 r8 re
  dod[fa  mi la]
  sol4(fa8) la\mbreak

  %120
  mi[re dod re]
  la la'4 re,8
  dod[fa mi la]

  %123
  sol4(fa8) la,
  mi[re dod re]
  la4 r8 la''16(fa)

  %126
  \appoggiatura mi8 re do?16(re) la8 sib16(do)
  do4(sib8) sib'16(sol)
  \appoggiatura fa8 mi re16(mi) si8 dod16(re)

  %129
  re4(dod8) dod'16(la)
  \appoggiatura sol8 fa mi16(fa) dod8 re16(mi)
  mi4(re8) re'16(la)\mbreak

  %132
  sib(do) re(do) re(do) sib(la)
  sib(do) re(do) re(do) sib(la)
  sib8[fa'(mi re)]

  %135
  re4\tr dod
  fa8 la,4 sib8~
  sib re4 fa8

  %138
  mi sold,4 la8~
  la dod4 mi8
  re fad,4 sol8~

  %141
  sol sib4 re8
  dod[mi16 re do sib la sol]
  fa8\staccatissimo[mi\staccatissimo re\staccatissimo do?\staccatissimo]\mbreak

  %144
  sib[fa'16 mi re do si la]
  sol8[fa mi re]
  dod16 mi la dod mi8 la

  %147
  fa16 la sol la sib(la sol) sib
  la la sol la sib(la sol) sib
  la la sol la sib(la sol) sib

  %150
  la4 r
  r16 fa' mi fa sol(fa mi) sol
  fa fa mi fa sol(fa mi) sol

  %153
  fa fa mi fa sol(fa mi) sol
  fa4 r8 fa,\mbreak
  sol4~sol8.(la16

  %156
  sib8)[la16 (sol) fa (mi) re (do)]
  si[la sol fa mi re dod si]
  la8\tr[re'16 mi fa8 mi16 fa]

  %159
  sol8[fa16 sol la8 si16 dod]
  re8 re, mi4\tr
  re r

  %162
  R2*6
  fa16 sol fa re fa sol fa re
  la' sib la fa la sib la fa

  %170
  re'8 fa,16 sol mi4\tr
  re4 r8 re'  %%%inizio ripresa
  fa, [la re, re']

  %173
  \appoggiatura do sib4. re,8
  mi[sol do, do']
  \appoggiatura sib la4. do,8

  %176
  re [fa sib, sib']
  \appoggiatura la sol4. sib8
  dod,[mi la, la']\mbreak

  %179
  fa[la dod, mi]
  re[fa la, do?]
  sib[re fad, la]

  %182
  sol[sib re, fa?]
  mi[sol si, re]
  dod4 r8 fa'

  %185
  mi[dod re sib]
  sib4(la8) fa'
  mi[dod re sib]

  %188
  sib4 (la8) la'
  fa[re  mi dod]
  re4 r8 fa,

  %191
  mi[dod re sib']\mbreak
  sib4(la8) fa
  mi[dod re sib']

  %194
  sib4(la8) la'
  fa[re mi dod]
  re4\fermata r

}

IIIvlIIn = \relative do'' {

  re8\staccatissimo
  dod\staccatissimo [fa\staccatissimo mi\staccatissimo la\staccatissimo]
  sol4(fa8) la
  mi8 [re dod re]\mbreak

  %4
  la la'4 re,8
  dod[fa mi la]
  sol4(fa8) la,

  %7
  mi[re dod re]
  la4 r8 re''  %%%inizio ripresa
  fa, [la re, re']

  %10
  \appoggiatura do sib4. re,8
  mi[sol do, do']
  \appoggiatura sib la4. do,8

  %13
  re [fa sib, sib']
  \appoggiatura la sol4. sib8
  dod,[mi la, la']\mbreak
  fa[la dod, mi]

  %17
  re[fa la, do?]
  sib[re fad, la]
  sol[sib re, fa?]

  %20
  mi[sol si, re]
  dod4 r8 fa'
  mi[dod re sib]

  %23
  sib4(la8) fa'
  mi[dod re sib]
  sib4 (la8) la'

  %26
  fa[re  mi dod]
  re4 r8 fa,
  mi[dod re sib']\mbreak

  %29
  sib4(la8) fa
  mi[dod re sib']
  sib4(la8) la'

  %32
  fa[re mi dod]
  re4 r  %%%%%%%%% fine ripresa
  r r8 fa

  %35
  sol\tr fa r fa
  sol\tr fa r dod
  re4 r8 re

  %38
  re16[(fa la8 re) la]
  sib[re, sol, re'']
  dod16(si) la(sol) fa8 mi\mbreak

  %41
  re la re,4
  r r8 re'
  sol,16 sib re sol sol, sib re sol

  %44
  mi [fa sol fa mi re do sib]
  fa la do fa fa, la do fa
  re [mi fa mi re do sib la]

  %47
  mi sol sib mi mi, sol sib mi
  sol [la sib la sol fa mi re]
  do4 r16 fa sol fa

  %50
  la4 r16 do re do
  fa do la fa fa' do la fa\mbreak
  fa'4 r

  %53
  R2
  r16 fa, sol fa sol sol la sol
  la la sib la sib sib do sib

  %56
  do do re do la8 r
  r re[(do sib]
  la[sol fa mi)]

  %59
  fa fa4 mi8
  fa[re'(do sib]
  la[sol fa mi)]

  %62
  fa fa4 mi8
  fa4 r8 fa\mbreak
  mi[la sol do]

  %65
  sib4(la8) do
  sol[fa mi fa]
  do do'4 fa,8

  %68
  mi[la sol do]
  sib4(la8) do,
  sol[fa mi fa]

  %71
  do[do' mi sol]
  la[do mi, sol]
  fa[la do, mib]

  %74
  re[fa la, do]
  sib[re fa, la]
  sol[sib re, fa]\mbreak

  %77
  mi4 r8 la'
  sol[mi fa re]
  re4(do8) la'

  %80
  sol[mi fa re]
  re4(do8) do'
  la[fa sol mi]

  %83
  fa4 r
  R2
  fa,16(do' fa8) fa4\tr

  %86
  mi,16(do' sol'8) sol4\tr
  fa16 re' re8 r16 do do8
  r16 sib sib8 r16 la sol fa

  %89
  mi do' do8 r16 sib sib8\mbreak %%%%%% fine p. 17
  r16 la la8 r16 sol fa mi
  re sib' sib8 r16 la la8

  %92
  r16 sol sol8 r16 fa mi re
  dod mi mi8 r16 mi re dod
  re fa la8~la16 la sol fa

  %95
  mi si sold'8~sold16 si, la sold
  la8 mi r4
  r r8 mi'

  %98
  do'16(si la8) re8 si
  mi16(re do8) mi re\mbreak
  re\tr do r si

  %101
  si?\tr la r sold
  sold? la4 si16 do
  si4 r8 sold

  %104
  sold? la4 si16 do
  si4 r
  R2*5

  %111
  r4 r16 la do mi,
  fa la fa dod re fa re la
  si re si fad sold si sold re

  %114
  mi sold mi si do8 la'16 si
  do8[do16 re mi8 fad16 sold]
  la8 la16 si si4\tr

  %117
  la16 mi do mi la,8 re
  dod[fa  mi la]
  sol4(fa8) la\mbreak

  %120
  mi[re dod re]
  la la'4 re,8
  dod[fa mi la]

  %123
  sol4(fa8) la,
  mi[re dod re]
  la4 r

  %126
  la''4. fa8
  \appoggiatura mi re2
  sib'4. sol8

  %129
  \appoggiatura fa mi2
  dod'4. la8
  \appoggiatura sol fa2\mbreak  % fine p. 19

  %132
  sol16 (la) sib(la) sib(la) sol(fad)
  sol(la) sib(la) sib(la) sol(fad)
  sol8[re'(do sib)]

  %135
  sib4\tr la
  re8 fa,4 sol8~
  sol sib4 re8

  %138
  si re,4 do8~
  do mi4 la8
  fa do4 sib8~

  %141
  sib re4 sol8
  mi4 r
  R2\mbreak

  %144
  r8 la16[sol fa mi re do]
  si8[la sol fa]
  mi16 la dod mi la8 dod

  %147
  re16 fa, mi fa sol(fa mi) sol
  fa fa mi fa sol(fa mi) sol
  fa fa mi fa sol(fa mi) sol

  %150
  fa4 r
  r16 re' dod re mi(re dod) mi
  re re dod re mi(re dod) mi

  %153
  re re dod re mi(re dod) mi
  re4 r\mbreak
  R2*6

  %161
  r4 r8 fa,
  sol4~sol8.(la16
  sib8) [la16 sol fa mi re do]

  %164
  si[la sol fa mi re dod si]
  la8\tr[re'16 mi fa8 mi16 fa]
  sol8[fa16 sol la8 si16 dod]\mbreak

  %167
  re8 re, mi4\tr
  re16 mi re la re mi re la
  fa' sol fa re fa sol fa re

  %170
  la'8 re,16 mi dod4\tr
  re4 r8 re'  %%%inizio ripresa
  fa,8[la re, re']

  %173
  \appoggiatura do sib4. re,8
  mi[sol do, do']
  \appoggiatura sib la4. do,8

  %176
  re [fa sib, sib']
  \appoggiatura la sol4. sib8
  dod,[mi la, la']\mbreak

  %179
  fa[la dod, mi]
  re[fa la, do?]
  sib[re fad, la]

  %182
  sol[sib re, fa?]
  mi[sol si, re]
  dod4 r8 fa'

  %185
  mi[dod re sib]
  sib4(la8) fa'
  mi[dod re sib]

  %188
  sib4 (la8) la'
  fa[re  mi dod]
  re4 r8 fa,

  %191
  mi[dod re sib']\mbreak
  sib4(la8) fa
  mi[dod re sib']

  %194
  sib4(la8) la'
  fa[re mi dod]
  re4\fermata r

}

IIIvlIIIn =  \relative do'' {

  r8
  R2
  r4 r8 re
  dod8[fa mi la]\mbreak

  %4
  sol4(fa8) la
  mi[re dod re]
  la la'4 la,8

  %7
  mi[re dod re]
  la4 r  %%%% inizio ripresa
  r r8 fa''

  %10
  sib,[re sol, sol']
  \appoggiatura fa mi4. sol,8
  la[do fa, fa']

  %13
  \appoggiatura mi re4. fa,8
  sol[sib mi, mi']
  \appoggiatura re dod4. dod8\mbreak

  %16
  re4 r8 la'
  fa[la dod, mi]
  re[fa la, do]

  %19
  sib[re fad, la]
  sol[sib re, fa?]
  mi4 r8 re'

  %22
  dod[la fa sol]
  sol4(fa8) re'
  dod[la fa sol]

  %25
  sol4(fa8) mi'
  re[fa sol mi]
  re4 r8 re,

  %28
  dod[la fa' sol]\mbreak
  sol4(fa8) re
  dod[la fa' sol]

  %31
  sol4(fa8) mi'
  re[fa sol mi]
  re4 r %% fine ripresa

  %34
  r8 re,[fa re]
  R2
  r8 la[dod la]

  %37
  R2
  r8 re[fa re]
  R2

  %40
  r8 la[dod la]\mbreak
  R2
  r8 fa'[re fa]

  %43
  sol4 r
  r8 mi[do mi]
  fa4 r

  %46
  r8 re[sib re]
  mi4 r
  r8 mi[do mi]

  %49
  fa4 r
  fa r
  fa r\mbreak

  %52
  fa r
  fa r
  fa r

  %55
  fa re
  do r
  fa8[sol la sib]

  %58
  do4 do,
  fa8[re' do do,]
  fa[sol la sib]

  %61
  do4 do,
  fa8[re' do do,]
  fa4 r\mbreak

  %64
  R2
  r4 r8 fa'
  mi[la sol do]

  %67
  sib4(la8) do
  sol[fa mi fa]
  do do'4 do,8

  %70
  sol[fa mi fa]
  do[sol' do mi]
  fa4 r

  %73
  la8[do mi, sol]]
  fa[la do, mib]
  re[fa la, do]

  %76
  sib[re fa, la]\mbreak
  sol4 r8 fa'
  mi[do la sib]

  %79
  sib4(la8) fa'
  mi[do re sib]
  sib4(la8) mi'

  %82
  fa[la sib sol]
  fa4 r
  R2*35

  %119
  r4 r8 re\mbreak
  dod[fa mi la]
  sol4(fa8) la

  %122
  mi[re dod re]
  la la'4 la,8
  mi[re dod re]

  %125
  la4 r
  R2*24
  la'8[re dod mi]

  %151
  re[re sol, la]
  re,[re' sol, la]
  re,[re' sol, la]

  %154
  re,4 r\mbreak
  R2*13
  re8[re fa re]

  %169
  r re[fa re]
  r re[la' la,]
  re4 r

  %172
  r r8 fa'
  sib,[re sol, sol']
  \appoggiatura fa mi4. sol,8

  %175
  la[do fa, fa']
  \appoggiatura mi re4. fa,8
  sol[sib mi, mi']

  %178
  \appoggiatura re dod4. dod8\mbreak
  re4 r8 la'
  fa[la dod, mi]

  %181
  re[fa la, do]
  sib[re fad, la]
  sol[sib re, fa?]

  %184
  mi4 r8 re'
  dod[la fa sol]
  sol4(fa8) re'

  %187
  dod[la fa sol]
  sol4(fa8) mi'
  re[fa sol mi]

  %190
  re4 r8 re,
  dod[la fa' sol]\mbreak
  sol4(fa8) re

  %193
  dod[la fa' sol]
  sol4(fa8) mi'
  re[fa sol mi]

  %196
  re4\fermata r

}

IIIvlan = \relative do' {

  r8
  mi r dod r
  la r la' r
  la r dod, r\mbreak

  %4
  re r la' r
  la r dod, r
  re4 r8 la'

  %7
  mi[re dod re]
  la4 r %%%% inizio ripresa
  la'8 r fa r

  %10
  re r sib r
  sol' r mi r
  \parenthesize do r \parenthesize la r

  %13
  \parenthesize fa' r \parenthesize re r
  \parenthesize sib r\parenthesize sol r
  mi' r dod r\mbreak

  %16
  la4 r8 mi''
  re4 r8 do?
  sib4 r8 la

  %19
  sol4 r8 fa
  mi4 r8 re
  dod4 r8 la

  %22
  la[la la sol]
  mi'[mi la, la]
  la[la la sol]

  %25
  mi'[mi la, la]
  la[la' sib la]
  fa4 r8 la,

  %28
  la[la la sol]\mbreak
  mi'[mi la fa]
  la,[la la sol]

  %31
  mi'[mi la, la]
  la[la' sib la]
  fa4 r

  %34
  r8 re[fa re]
  R2
  r8 la[dod la]

  %37
  R2
  r8 re[fa re]
  R2

  %40
  r8 la[dod la]\mbreak
  R2
  r8 fa'[re fa]

  %43
  sol4 r
  r8 mi[do mi]
  fa4 r

  %46
  r8 re[sib re]
  mi4 r
  r8 mi[do mi]

  %49
  fa4 r
  fa r
  fa r\mbreak

  %52
  fa r
  fa r
  fa r

  %55
  fa re
  do r
  fa8[sol la sib]

  %58
  do4 do,
  fa8[re' do do,]
  fa[sol la sib]

  %61
  do4 do,
  fa8[re' do do,]
  fa4 r\mbreak

  %64
  sol8 r mi r
  do r do' r
  do r mi, r

  %67
  fa r do' r
  do r mi, r
  fa4 r8 do'

  %70
  sol[fa mi fa]
  do[mi sol do]
  do4 r8 mi,

  %73
  do4 r8 mib'
  re4 r8 do
  sib4 r8 la

  %76
  sol4 r8 fa\mbreak
  mi4 r8 do
  do[do do sib]

  %79
  sol'[sol do, do]
  do[do do sib]
  sol'[sol do, do]

  %82
  do[do' re do]
  la4 r
  R2*34

  %118
  mi8 r dod r
  la8 r la' r\mbreak
  la r dod, r

  %121
  re r la' r
  la r dod, r
  re r la' r

  %124
  mi[re dod re]
  la4 r
  R2*24

  %150
  fa'8[la la dod]
  la8 [re sol, la]
  re, [re' sol, la]

  %153
  re, [re' sol, la]
  re,4 r\mbreak
  R2*13

  %168
  re8[re fa re]
  r re[fa re]
  r re[la' la,]

  %171
  re4 r  %%% inizio ripresa
  la'8 r fa r
  re r sib r

  %174
  sol' r mi r
  \parenthesize do r \parenthesize la r
  \parenthesize fa' r \parenthesize re r

  %177
  \parenthesize sib r\parenthesize sol r
  mi' r dod r\mbreak
  la4 r8 mi''

  %180
  re4 r8 do?
  sib4 r8 la
  sol4 r8 fa

  %183
  mi4 r8 re
  dod4 r8 la
  la[la la sol]

  %186
  mi'[mi la, la]
  la[la la sol]
  mi'[mi la, la]

  %189
  la[la' sib la]
  fa4 r8 la,
  la[la la sol]\mbreak

  %192
  mi'[mi la fa]
  la,[la la sol]
  mi'[mi la, la]

  %195
  la[la' sib la]
  fa4\fermata r

}

IIIbcn = \relative do {

  r8
  la' r la, r
  re r re, r
  la'' r la, r\mbreak

  %4
  re' r re, r
  la' r la, r
  re' r re, la'

  %7
  mi[re dod re]
  la4 r  %%% inizio ripresa
  re'8 r re, r

  %10
  sol r sol, r
  do' r do, r
  fa r fa, r

  %13
  sib' r sib, r
  mi r mi, r
  la' r la, r\mbreak

  %16
  la2~
  la~
  la~

  %19
  la~
  la~
  la8[la' re re,]

  %22
  la'[la, re sol]
  dod,[dod' re re,]
  la' [la, re sol]

  %25
  dod,[dod' re dod]
  re[re, sol, la]
  re[la re re,]

  %28
  la''[la, re sol]\mbreak
  dod,[dod' re re,]
  la'[la, re sol]

  %31
  dod,[dod re dod]
  re[re' sol, la]
  re,4 r %%% fine ripresa

  %34
  R2
  r8 sol, [sib sol]
  R2

  %37
  r8 re' [fa re]
  R2
  r8 sol, [sib sol]

  %40
  R2
  r8 re' [fa re]
  R2

  %43
  r8 sib'[sol sib]
  do4 r
  r8 la[fa la]

  %46
  sib4 r
  r8 mi,[do mi]
  do'4 r

  %49
  r fa,
  r fa
  r fa\mbreak

  %52
  r fa
  r do
  r do

  %55
  R2
  r8 do[fa mi]
  fa4 r

  %58
  R2*5
  r8 fa[fa, fa']\mbreak
  do' r do, r

  %65
  fa r fa, r
  do'' r do, r
  fa r fa, r

  %68
  do'' r do, r
  fa r \once\stemUp fa, do''
  sol[fa mi fa]

  %71
  do[mi re do]
  do2~
  do~

  %74
  do~
  do~
  do~\mbreak

  %77
  do8[do' la fa]
  do'[do, fa do]
  mi,[mi' fa fa,]

  %80
  do'[do' fa, sib,]
  mi,[mi' fa do]
  fa,[fa' sib, do]

  %83
  fa,[sol la fa]
  do'[re mi do]
  fa[sol la fa]

  %86
  do[re mi do]
  fa8.[fa16 do'8. do16]
  re8.[mi,16 fa8. fa16]

  %89
  do8.[do16 re8. mi16]\mbreak
  fa8.[fa16 sib,8. do16]
  re8. re16 fa8. fa16

  %92
  sol8. sol16 re8. sol,16
  la8. mi'16 la8. la,16
  re8. re16 re'8. re16

  %95
  mi8. mi,16 sold8. mi16
  la8.[la,16 do8. si16]
  la4 r

  %98
  la r
  mi' r\mbreak
  r8 la[mi' mi,]

  %101
  r la[mi' mi,]
  r la,[la' la,]
  r mi'[mi' mi,]

  %104
  r la,[la' la,]
  r la'[do la]
  re r fa, r

  %107
  re r si r
  sold r la r
  la r la r\mbreak

  %110
  la[fa' mi mi,]
  la[la' do la]
  re r fa, r

  %113
  re r si r
  sold r la r
  la r la r

  %116
  la[fa' mi mi,]
  la[la' fa re]
  la' r la, r

  %119
  re r re, r\mbreak
  la'' r la, r
  re' r re, r

  %122
  la' r la, r
  re' r re, la'
  mi[re dod re]

  %125
  la4 r
  fa'8[mi fa fa,]
  sol'[fa sol sol,]

  %128
  sol'[fa sol sol,]
  la'[sol la la,]
  la'[sol la la,]

  %131
  sib'[la sib re,]\mbreak
  sol[re sol re']
  sol,[re sol re']

  %134
  sol,2
  la8[sol la dod,]
  re r re' r

  %137
  sol, r re' r
  sold, r mi r
  la r la, r

  %140
  re r re' r
  sol, r sol, r
  la2~

  %143
  la~\mbreak
  la~
  la~

  %146
  la8[si dod la]
  re,[re' sol sol,]
  re'[re' sol, sol,]

  %149
  re'[re' sol, sol,]
  re'[re' la la,]
  re4 r

  %152
  R2*2
  r8 re'[fa, re]\mbreak
  sol[la sib la]

  %156
  sol2
  sold
  la8[fa re re']

  %159
  mi[re dod la]
  re[sib la la,]
  re[re' fa, re]

  %162
  sol[la sib la]
  sol2
  sold

  %165
  la8[fa re re']
  mi[re dod la]\mbreak
  re[sib la la,]

  %168
  re[re fa re]
  r re[fa re]
  r re[la' la,]

  %171
  re4 r  %%% inizio ripresa
  re'8 r re, r
  sol r sol, r

  %174
  do' r do, r
  fa r fa, r
  sib' r sib, r

  %177
  mi r mi, r
  la' r la, r\mbreak
  la2~

  %180
  la~
  la~
  la~

  %183
  la~
  la8[la' re re,]
  la'[la, re sol]

  %186
  dod,[dod' re re,]
  la' [la, re sol]
  dod,[dod' re dod]

  %189
  re[re, sol, la]
  re[la re re,]
  la''[la, re sol]\mbreak

  %192
  dod,[dod' re re,]
  la'[la, re sol]
  dod,[dod re dod]

  %195
  re[re' sol, la]
  re,4\fermata r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\minor
  \time 2/4
  \tempo 2 = 68
  \partial 8 s8
  s2*196
  \bar"|."

}

IIIvlI = {
  \IIIglobal
  %\pageBreak
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

\markup\huge "[1.] All[egr]o non molto"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new PianoStaff \with {
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      } \relative do' <<
        \new Staff <<
          \set PianoStaff.instrumentName =  \markup \center-column{"2 Violini""ob[b]ligati"}
          \set Staff.midiInstrument = #"violin"
          \IvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IvlII
        >>
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \set Staff.instrumentName = \markup \center-column{"[Violino""ripieno]"}
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

\markup\huge "[2.] Ad[agi]o"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new PianoStaff \with {
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      } \relative do' <<
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

\markup\huge "[3.] All[egr]o molto"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new PianoStaff \with {
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      } \relative do' <<
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



