\language "italiano"
	%********************************** VARIABILI


\version "2.18.0"

su = \change Staff = up

giu = \change Staff = down

pf = #(make-dynamic-script "pf")

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

dolce = _\markup \italic "Dolce"

arco = _\markup \italic "arco"

pizz = _\markup \italic "pizzic"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.8

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

sestine = \tupletSpan 4

ds = _\markup \italic \right-align {"Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

tr = \trill

tu = _\markup \italic {"tutti"}

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


mbreak = { }

Iglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

Ifln = \relative do'' {

   r8
   R1*11
   r2 r4 r8 re16\solo(si)
   sol8 sol4 la16(fad) sol8 sol4 mi'16(do)

   %14
   si8 do16(la) sol8 la16(fad) sol8 sol4 mi'16(do)
   si8 do16(la) sol8 la16(fad) sol8 si16 re sol re si'8
   la16(sol fad mi) re(fad sol la) sol(mi re do) si(do mi sol)

   %17
   fad(mi re do) si(re mi fad) mi(do si la) sold(la do mi)\mbreak
   re(do si la) sol(si do re) do(fad la do,) si(re sol si,)
   si8-+ la r re re16(dod mi re dod si la sol)

   %20
   sol8-+ fad r fad' fad16(mi sol fad  mi re dod si)
   la8.-+ si32 dod re8[\grace {mi16[fad]} sol8] \sestine \tuplet 6/4 {fad16 mi re dod si la} mi'4-+
   re4. re'8\mbreak re,4. re'8

   %23
   re,(re') re,(re') re,4~re16 dod? si la
   \grace fad'8 mi2-+ re4 r
   R1*4

   %29
   r4 r8 la' la16(sol fad sol) fad(mi red mi)
   red(do! si do) si(do red mi) fad(sol la si) do(la sol fad)
   sol fad mi8 r sol sol16(fad mi fad) mi(re dod re)\mbreak

   %32
   dod(si la si) la(si dod re) mi(fad sol la) si(sol fad mi)
   fad mi re8 r re mi mi~\tuplet 6/4 {mi16 si' la sol fad mi}
   \grace re8 dod re r re do do~\tuplet 6/4 {do16 sol' fad mi re do}

   %35
   \grace si8 lad si r si la la~\tuplet 6/4 {la16 mi' re do si la}\mbreak
   \grace sol8 fad \once\tieDashed sol~ \tuplet 6/4{sol16 re' do si la sol } do8 do\tuplet 6/4 {la'16 sol fad mi re do}
   si8 si \tuplet 6/4 {sol'16 fad mi re do si} do8 do\tuplet 6/4 {la'16 sol fad mi re do}

   %38
   si8 si \tuplet 6/4 {sol'16 fad mi re do si} si8-+ la r re
   \grace fad8 mi16(red) \grace fad8 mi16(red) mi sol la si \grace re8 do16 si \grace re8 do16 si \tuplet 6/4 {do si la sol fad mi} \mbreak
   \grace mi8 re16 dod \grace mi8 re16 dod re fad sol la \grace do8 si16 la \grace do8 si16 la \tuplet 6/4 {si16 la sol fad mi re}

   %41
   \grace re8 do16 si \grace re8 do16 si do mi fad sol \grace si8 la16 sol \grace si8 la16 sol \tuplet 6/4 {la sol fad mi re do}
   \grace do8 si16 la \grace do8 si16 la si re  mi fad \grace si8 la16 fad \grace si8 la16 fad \tuplet 6/4 {sol fad mi re dod si }
   lad dod fad,8~\tuplet 6/4 {fad16 lad si dod si lad}\mbreak si re fad,8~\tuplet 6/4 {fad16 si dod re dod si}

   %44
   dod mi fad,8~\tuplet 6/4 {fad16 dod' re mi re dod} re(si') mi,(si') fad(si) mi,(si')
   re,(si') mi,(si') fad(si) mi,(si')\tuplet 6/4 {re, dod si sol' fad mi } re8 dod
   re16(si') mi,(si') fad(si) mi,(si') re,(si') mi,(si') fad(si) mi,(si')\mbreak

   %47
   \tuplet 6/4 {re, dod si sol' fad mi } re8 dod si4 r
   R1*2
   r4 r8 si'16(sol) mi8 mi4 fad16 red

   %51
   mi8 mi4 do'16(la) sol8 la16(fad) mi8 fad16(red)
   mi8 mi4do'16(la) sol8 la16(fad) mi8 fad16(red)
   mi mi32(red mi16 fad) \grace la8 sol16 sol32(fad sol16 la)\mbreak si8.-+ la32 si \tuplet 6/4 {do16 si la sol fad mi}

   %54
   mi8-+ red r4 si16(red fad) fad fad,(la red) red
   red?(fad la) la la(fad mi red!) si(mi sol) sol sol,(si mi) mi
   mi(sol si) si si(sol fad mi) si(re! sold) sold sold,(si re) re

   %57
   re(sold si) si si(fa mi re) do(mi la) la la,(do mi) mi\mbreak
   mi(la do) do do(si lad si) dod,(mi lad) lad lad,(dod mi) mi
   mi(lad dod) dod  dod(mi, re dod) re si' dod, si' si, si' la, si'

   %60
   sol, si' fad, si' mi,, si'' re,, si'' dod,16.-+[dod32] \terzine \tuplet 3/2 { dod16 re mi } re8 dod
   re16.-+[red32] \tuplet 3/2 { red16 mi fad } mi8 red mi16.-+[mi32] \tuplet 3/2 { fad16 sol la } sol8 fad\mbreak  %%%%%%%fine pagina
   sol16 fad mi8 r si' do16 la, do' sol, do' \once\stemUp fad,, \tuplet 3/2 { do''16 [si la] }

   %63
   si16 sol, si' fad,  si' \once\stemUp mi,, \tuplet 3/2 { si''16 [la sol] } la fad, la' mi, \once\stemDown la' \once\stemUp red,, \tuplet 3/2 { la''16 [sol fad] }
   sol16.-+mi32 \tuplet 3/2 { mi16[fa sol] } fa16.-+[fa32] \tuplet 3/2 { fa16 mi  red }mi16.-+[mi32] \tuplet 3/2 { mi16 fa sol } fa16.-+[fa32] \tuplet 3/2 { fa16 mi red }
   mi la32 (si do16 si la sol fad? mi) \tuplet 3/2 { red do si fad' mi red la'[sol fad do' si la]

   %66
   sol fad mi red do si} fad'4-+ mi r8 sol
   sol4.-+ fad16 mi fad4 r8 fad
   fad4.-+ mi16 re mi4 r8 mi

   %69
   mi4.-+ red16 do red4 r8 fad
   sol16(mi fad mi) red(mi red mi) do(mi fad mi) red(mi red mi)
   si(mi fad mi) red(mi red mi) la,(red fad sol) la(fad si, la')

   %72
   sol (si re8) r si\mbreak do8 la r4
   fad16 la re8 r la\solo si sol r4
   mi16 sol do8 r sol la fad r4

   %75
   red16 fad si8 r fad sol16(mi) si'(sol) fad(si,) la'(fad)
   sol(mi) si'(sol) fad(si,) la'(fad) sol8 mi r la
   si16(sol) re'(si) la(re,) do'(la) si(sol) re'(si) la(re,) do'(la)

   %78
   si8 sol r re'\mbreak mi16 do,32(re mi16 do) la la32(si do16 la)
   \once\stemUp fad8 do''16 mi mi(re) re(do) re \stemUp si,32 (do re16 si ) sol sol32(la si16 sol)\stemNeutral
   \once\stemUp mi8 si''16 re re(do) do(si) \stemDown do\stemUp la,32(si do16 la) fad fad32(sol la16 fad)\stemNeutral

   %81
   \once\stemUp red8 la''16 do do(si) si(la) si sol(fad sol la sol fad sol)
   mi sol(fad sol la sol fad sol) re sol(fad sol la sol fad sol)\mbreak
   do, sol'(fad sol la sol fad sol) si, sol'(fad sol la sol fad sol)

   %84
   la, re,(fad la) do fad la8 si,16 re,(sol si) re sol si8
   do,16 fad,(la do) fad la do8 si16(la) si(la) si16.-+ sol32 sol16 fad32 sol
   la16.-+ fad32 fad16 mi32 fad sol16.-+ mi32 mi16 re32 mi fad16.-+ re32 re16 do32 re mi16.-+ do32 do16 si32 do

   %87
   re16.-+ si32 si16 la32 si do16.-+ la32 la16 sol32 la\mbreak si16.-+ sol32 sol16 fad32 sol la16.-+ fad32 fad16 mi32 fad
   sol4. sol'8 sol,4. sol'8
   sol,(sol') sol,(sol') sol,4~sol16 fad mi re

  %90
  \grace si'8 la2-+ r2
   R1*8
   r2 r4 r8

}

IvlIn =  \relative do'' {

   re16(si)
   sol8 sol4 la16(fad) sol8 sol4 mi'16(do)
   si8 do16(la) sol8 la16(fad) sol8 sol4 mi'16\p(do)
   si8 do16(la) sol8 la16(fad) sol8 si16\f re sol re si'8

   %4
   fad, la16 re fad re la'8 mi, sol16 do mi do sol'8\mbreak
   fad si16(sol) fad8 sol16(mi) fad8 si16(sol) fad8 sol16(mi)
   fad8\noBeam \grace la \tuplet 3/2 { sol16 fad mi } re8 dod re si'16\p(sol) fad8 sol16(mi)
   fad8 si16(sol) fad8 sol16(mi) fad8\noBeam \grace la \tuplet 3/2 { sol16 fad mi } re8[dod]
   re4 r8 re32\f(mi fad sol) la16 re, (mi re) la' re, (mi re)
   do do (re do) la' do, (re do) si si (do si) sol' si, (do si)\mbreak

   %10
   si8-+ la re,16(fad la do) do8-+ si sol16(si re fa)
   fa?8 mi4 fad8 sol8.-+ fad32 mi re8 do
   \sestine \tuplet 6/4 {si16 re sol mi re do} si8 la sol[re] sol,4

   %13
   r8 sol\p si re r sol, si do
   re do re re r sol, si do
   re do re re r sol sol sol

   %16
   fad fad fad fad mi mi mi mi
   re re re re do do do do\mbreak
   si si si si do do sol sol

   %19
   re' re fad re mi4 la,
   re8 re fad re sol4 r8 sol
   sol4 fad8 sol la4 la,

   %22
   re16(la') fad(la) fad(la) fad(la) sol(si) sol(si) sol(si) sol(si)
   sold si sold si sold si sold si la8 la la la
   la, la \once\stemUp la la''16(fad) re8 re4\f mi16(dod)

   %25
   re8 re4 si'16(sol) fad8 sol16(mi) re8 mi16 (dod)
   re8 re4 si'16\p(sol)\mbreak fad8 sol16(mi) re8 mi16(dod)
   re re,\f(fad la) re8 fad mi16 la,(dod la) mi'8 sol

   %28
   fad16 la,(re la) fad'8 la~la16 fad si la sol8 fad
   fad-+ mi r4 r2
   red4\p r red8 red red red

   %31
   r8 mi sol si r2
   dod,4 r dod8 dod dod dod
   r re sol si r4 r8 sol,

   %34
   la la~\tuplet 6/4 {la16 do si la sol fad} sol8 sol r mi\mbreak
   fad8 fad~\tuplet 6/4 {fad16 la sol fad mi re} mi8 mi r do
   re8 re sol sol sol sol fad fad

   %37
   sol sol sol sol sol sol fad fad
   sol sol sol sol sol fad r si
   do do do do do fad la do,

   %40
   si si si si si re sol si,
   la la la la la do fad la,
   sol sol sol sol sol si mi sol,

   %43
   fad lad lad lad\mbreak r si si si
   r dod dod dod si4 r
   R1*2

   %47
   r4 r8 fad'16\f(re) si8 si4 do16 lad
   si8 si4 sol'16(mi) re8 mi16(dod) si8 dod16(lad)
   si8 si4 sol'16\p(mi) re8 mi16(dod) si8 dod16(lad)

   %50
   si8\f fad si,4 r8 mi\p sol si
   r mi, sol la si la si si,
   r mi sol la si la si si,

   %53
   mi4 r16 red mi fad sol4 la\mbreak
   si8 si, r4 red' r
   red? r mi r

   %56
   mi r re! r
   re r do r
   do r mi r

   %59
   mi r re8 dod si la
   sol fad mi re dod4 r8 lad'
   si4 r8 la! sol4 r8 red'

   %62
   mi si' mi4 r4 r8 fad,
   sol4 r8 mi fad4r8 red
   mi4 r r2

   %65
   R1
   r4 r8 si'16\f(sol) mi8 sol16(mi) si'(mi,) mi'8\mbreak
   do8 do do la16(fad) re8 fad16(re) la'(re,) re'8

   %68
   si si si sol16(mi) do8 mi16(do) sol'(mi) do'8
   la la la fad16(red)  si8 red16(si) fad'(red) si'8
   sol4 r r2

   %71
   R1
   mi,16\p(sol) mi(sol) mi(sol) mi(sol) la( do mi do) la(mi' do la)
   re,(fad) re(fad) re(fad) re(fad) sol(si re si) sol(re' si sol)

   %74
   do,(mi) do(mi) do(mi) do(mi) fad(la do la) fad(do' la fad)\mbreak
   si,(red) si(red) si(red) si(red) mi8 sol red si
   mi sol red si mi4 r8 fad

   %77
   sol si fad re sol si fad re
   sol4 r8 sol' mi4 r
   r8 mi mi mi re4 r

   %80
   r8 re re re do4 r
   r8 do do do si4 r
   mi r re r

   %83
   do r si r
   r8 la la la r si si si
   r do do fad sol4 r\mbreak

   %86
   R1*2
   si,,16(re) si(re) si(re) si(re) do(mi) do(mi) do(mi) do(mi)
   dod(mi) dod(mi)dod(mi) dod(mi)   re8 re re re

   %90
   re re re re sol\f si16 re sol re si'8
   fad, la16 re fad re la'8 mi, sol16 dod mi dod sol'8
   fad si16(sol) fad8 sol16(mi) fad8 si16(sol) fad8 sol16(mi)

   %93
   fad8\noBeam \grace la\terzine \tuplet 3/2 { sol16 fad mi } re8 dod re si'16_\markup {[\musicglyph #"p"]}(sol) fad8 sol16(mi)\mbreak
   fad8 si16(sol) fad8 sol16(mi) fad8 \noBeam \tuplet 3/2 { sol16 fad mi } re8 dod
   re4 r8 re32\f(mi fad sol) la16 re, (mi re) la' re, (mi re)

   %96
   do do (re do) la' do, (re do) si si (do si) sol' si, (do si)\mbreak
   si8-+ la re,16(fad la do) do8-+ si sol16(si re fa)
   fa?8-+ mi4 fad8 sol8.-+ fad32 mi re8 do

   %99
   \sestine \tuplet 6/4 {si16 re sol mi re do} si8 la sol[re] sol,

}

IvlIIn = \relative do'' {

   r8
   si, si4 do16(la) do8 re16 si sol4
   r8 mi''16(do) si8 do16(la) sol8 re16(si) sol4
   r8 mi''16\p(do) si8 do16(la) si8 sol'\f si, sol'

   %4
   la, fad' la, fad' sol, mi' sol, dod\mbreak
   re sol16(mi) re8 mi16(dod) re8 sol16(mi) re8 mi16(dod)
   re8\noBeam \tuplet 3/2 { si16 la sol } fad8 mi fad sol'16\p(mi) re8 mi16(dod)

   %7
   re8 sol16(mi) re8 mi16(dod) re8\noBeam \tuplet 3/2 { si16 la sol } fad8 [mi]
   fad sol la sol fad4 r8 si_\markup {[\musicglyph #"f"]}
   mi,4 r8 fad sol16 sol(la sol) si sol(la sol)\mbreak

   %10
   sol8-+ fad la la la-+ sol re' re
   re-+ do do do si do si la
   sol sol4 fad8 sol re sol,4

   %13
   r8 sol\p si re r sol, si do
   re do re re r sol, si do
   re do re re r sol sol sol

   %16
   fad fad fad fad mi mi mi mi
   re re re re\mbreak do do do do
   si si si si la la sol sol

   %19
   re' re fad re mi4 la,
   re8 re fad re sol4 r8 sol
   sol4 fad8 sol la4 la,

   %22
   re16(la') fad(la) fad(la) fad(la) sol(si) sol(si) sol(si) sol(si)
   sold(si) sold(si) sold(si) sold(si) la8 la la la
   la, la la la\mbreak re fad4\f sol16(mi)

   %25
   fad8 la16(fad) re4 r8 si''16(sol) fad8 sol16(mi)
   re8 la16(fad) re4 r8 si''16\p(sol) fad8 sol16(mi)
   re4 r16 la\f re re, la'4 r16 la dod la

   %28
   re4 r16 la re mi fad re sol fad mi8 re
   re-+ dod r4 r2
   fad,4\p r fad8 fad fad fad

   %31
   r sol si mi r2
   mi,4 r mi8 mi mi mi\mbreak
   r fad si re r si si si

   %34
   mi, fad fad re mi sol sol sol
   dod, re re si do mi mi mi
   la, si si sol' la la la la

   %37
   si si si si la la la la
   si re, re re re re' si sol
   do sol mi do la' la la la

   %40
   si fad re si sol' sol sol sol\mbreak
   la mi do la fad' fad fad fad
   sol re si sol mi' mi mi mi

   %43
   fad dod' dod dod r re re re
   r mi mi mi re4 r
   R1*2

   %47
   r2 re,8\f re4 mi16(dod)
   re8 fad16(re) si4 r8 sol''16(mi) re8 mi16 (dod)
   si8 fad16(re) si4 r8 sol''16_\markup {[\musicglyph #"p"]}(mi) re8 mi16(dod)

   %50
   si8_\markup {[\musicglyph #"f"]} fad si,4 r8 mi\p sol si
   r mi, sol la si la si si,\mbreak
   r mi sol la si la si si,

   %53
   mi4 r16 red mi fad sol4 la
   si8 si, r4 fad' r
   fad r sol r

   %56
   sol r sold r
   sold r la r
   la r dod r

   %59
   dod r si8 la! sol?  fad
   mi re dod si lad4 r8 lad'
   si,4  r8 si mi4 r8 si

   %62
   \once	\stemUp mi sol' si4 r r8 do,
   si4 r8 si\mbreak la4 r8 la
   sol4 r r2

   %65
   R1
   r2 r4 r8 mi'16\f(do)
   la8 do16(la) mi'(do) la'8 fad! fad fad re16(si)

   %68
   sol8 si16(sol) re'(si) sol'8 mi mi mi do16(la)
   fad8 la16(fad) do'(la) fad'8 red red red red
   mi4 r r2

   %71
   R1
   mi,16\p(sol) mi(sol) mi(sol) mi(sol) la(do mi do) la(mi' do la)
   re,(fad) re(fad) re(fad) re(fad)\mbreak \slurDashed sol (si re si) sol (re' si sol)\slurSolid

   %74
   do,(mi) do(mi) do(mi) do(mi) fad(la do la) fad(do' la fad)
   si,(red) si(red) si(red) si(red) mi8 sol red si
   mi sol red si mi4 r8 fad

   %77
   sol si fad re sol si fad re
   sol4 r8 si do4 r
   r8 do do do si4 r

   %80
   r8 si si si la4 r
   r8 la la la sol4 r
   sol r sol r

   %83
   fad r sol r\mbreak
   r8 fad fad fad r sol sol sol
   r la la la si4 r

   %86
   R1*2
   si,16(re) si(re) si(re) si(re) do(mi) do(mi) do(mi) do(mi)
   dod(mi) dod(mi) dod(mi) dod(mi) re8 re re re

   %90
   re re re re si'\f sol' si, sol'
   la, fad' la, fad' sol, mi' sol, dod
   re sol16(mi) re8 mi16(dod) re8 sol16(mi) re8 mi16(dod)

   %93
   re8\noBeam \tuplet 3/2 { si16 la sol } fad8 mi fad sol'16\p(mi) re8 mi16(dod)
   re8 sol16(mi) re8 mi16(dod) re8\noBeam \tuplet 3/2 { si16 la sol } fad8 [mi]
   fad sol la sol fad4 r8 si_\markup {[\musicglyph #"f"]}

   %96
   mi,4 r8 fad sol16 sol(la sol) si sol(la sol)\mbreak
   sol8-+ fad la la la-+ sol re' re
   re-+ do do do si do si la

   %99
   sol sol4 fad8 sol [re] sol,

}

Ivlan =  \relative do' {

   r8
   re re re re r re re sol
   sol sol sol fad r sol sol sol
   sol sol sol fad r re re re

   %4
   r re re re r mi mi mi\mbreak
   la,4 r8 la' la4 r8 la
   la si la la la4 r8 la

   %7
   la4 r8 la la si la la
   la4 re,8 mi fad sol la si
   la4 r8 la sol4 r8 mi

   %10
   re re re re re re sol sol\mbreak
   sol sol sol la re,4 r8 re
   re mi re re si4 r

   %13
   r8 sol\p si re r sol, si do
   re do re re, r sol si do
   re do re re, r sol' sol sol

   %16
   fad fad fad fad mi mi mi mi\mbreak
   re re re re do do do do
   si si si si la la sol sol

   %19
   re' re fad re mi4 la,
   re8 re fad re sol4 r8 sol
   sol4 fad8 sol la4 la,

   %22
   re8 fad fad fad sol sol sol sol
   sold sold sold sold\mbreak la la la la
   la, la la la re la'\f la la

   %25
   r la la re re re re dod
   r re re re re re re dod
   r la la la r la la la

   %28
   r la la fad r re re si'
   la la r4 r2\mbreak
   si,4\p r si8 si si si

   %31
   r si mi sol r2
   la,4 r la8 la la la
   r la re sol r sol sol si

   %34
   la la la si do mi, mi sol
   fad fad fad sol la do, do mi
   re re re si' mi, mi re re\mbreak

   %37
   re re re si' mi, mi re re
   re re re re re re' si sol
   do do do do fad, fad fad fad

   %40
   si si si si mi, mi mi mi
   la la la la re, re re re
   sol sol sol sol dod, dod dod dod\mbreak

   %43
   fad fad fad fad r fad fad fad
   r fad fad fad fad4 r
   R1*2

   %47
   r2 fad8 fad fad fad
   r fad fad si si si si lad
   r si si si si si si lad

   %50
   si4 r r8 mi,\p sol si
   r mi, sol la si la si si,\mbreak
   r mi sol la si la si si,

   %53
   mi4 r16 red mi fad sol4 la
   si8 si, r4 si' r
   si r si r

   %56
   si r si r
   si r mi, r
   mi r fad r

   %59
   fad r si8 la! sol fad
   mi re dod si\mbreak lad4 r8 fad'
   si,4 r8 si mi4 r8 si

   %62
   mi mi, mi4 r r8 re'
   re4 r8 dod dod4 r8 si
   si4 r r2

   %65
   R1
   r2 mi8 mi mi mi
   r mi mi mi r re re re

   %68
   r re re re r do do do\mbreak
   r do do do r si si si
   si4 r r2

   %71
   R1
   mi8 mi mi mi la la la la
   re, re re re sol sol sol sol

   %74
   do, do do do fad fad fad fad
   si, si si si mi sol red si
   mi sol red si mi4 r8 fad\mbreak

   %77
   sol si fad re sol si fad re
   sol4 r8 sol sol4 r
   r8 fad fad fad fad4 r

   %80
   r8 mi mi mi mi4 r
   r8 re re re re4 r
   do r sol r

   %83
   la r re r
   r8 re re re r re re re\mbreak
   r fad fad la sol4 r

   %86
   R1*2
   si,8 si si si do do do do
   dod dod dod dod re re re re

   %90
   re, re re re r re' re re
   r re re re r mi mi mi
   la,4 r8 la' la4 r8 la

   %93
   la si la la la4 r8 la
   la4 r8 la\mbreak la si la la
   la4 re,8 mi fad sol la si

   %95
   la4 r8 la sol4 r8 mi
   re re re re re re sol sol
   sol sol sol la re,4 r8 re

   %99
   re mi re re si4 r8

}

Ibcn = \relative do {

   r8
   sol sol' sol re r sol, si do
   re do re re, r sol si do
   re do re re, sol sol' sol sol

   %4
   r fad fad fad r mi mi mi\mbreak
   re4 r8 la' re,4 r8 la'
   re, sol la la, re4 r8 la'

   %7
   re,4 r8 la' re, sol la la,
   re  mi fad mi re4 r8 sol
   la4 r8 re, sol4 r8 do,

   %10
   re re fad fad sol sol si, si
   do do' do la sol la si fad\mbreak
   sol do, re re, sol4 r

   %13
   R1*11
   r2 re'8 re' re la
   r re, fad sol la sol la la,

   %26
   r re fad sol la sol la la,
   re re' re re r dod dod dod
   r re re re, re4 sol8 sold

   %29
   la la, la'16 sol fad mi\mbreak re4 r8 do!
   si4 r si8 si si si
   mi mi, sol'16 fad mi re dod4 r8 si

   %32
   la4 r la8 la la la
   re re' si sol r sol sol sol
   sol fad fad fad mi mi mi mi

   %35
   mi re re re do do do do\mbreak
   do si si si la la re re
   sol, sol sol sol la la re re

   %38
   sol, sol sol sol re' re, r4
   R1*4
   fad'4 r fad r

   %44
   fad r si,8 dod re dod
   si dod re dod si mi fad fad,
   si dod re dod si dod re dod\mbreak

   %47
   si mi fad fad, si si' si fad
   r si, re  mi fad mi fad fad,
   r si re mi fad  mi fad fad,

   %50
   si4 r r2
   R1*3
   r8 si red fad si,4 r

   %55
   si r si r
   si r si r
   si r la r

   %58
   la r\mbreak lad r
   lad r si r
   R1*2

   %62
   r8 mi sol mi la4 r8 re,
   sol4 r8 dod, fad4 r8 si,
   mi sol la si do sol la si

   %65
   do4 r8 la si red, red red
   mi mi la, si mi mi mi mi
   r la la la r re, re re\mbreak

   %68
   r sol sol sol r do, do do
   r fad fad fad r si, si si
   mi4 r la r

   %71
   sol r fad si,
   mi r r2
   R1*3

   %76
   r2 r8 mi fad re
   sol4 r r2
   r8 sol, si sol do4 r

   %79
   r8 fad fad fad si,4 r
   r8 mi mi mi la,4 r\mbreak
   r8 re re re sol,4 r

   %82
   do r si r
   la r sol r
   re' r re r

   %85
   re r sol8 fad sol mi
   fad re mi do re si do la
   si sol la fad' sol mi fad re

   %88
   sol,4 r r2
   R1
   r2 sol8 sol' sol sol

   %91
   r fad fad fad\mbreak r mi mi mi
   re4 r8 la' re,4 r8 la'
   re, sol la la, re4 r8 la'

   %94
   re,4 r8 la' re, sol la la,
   re mi fad mi re4 r8 sol
   la4 r8 re, sol4 r8 do,

   %97
   re re fad fad sol sol si, si
   do do' do la sol la si fad\mbreak
   sol do, re re, sol4 r8

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s2 s4 <6>
  <6 4> <6 4>8 <5 3> s4 <6>
  <6 4> <6 4>8 <5 3> s2
  s8 <6> s4 s s8 <6+>
  s4 s8 <7 _+> s4 s8 <7 _+>
  s <6 5> <6 4> <5 3+> s4 s8 <7 _+>
  s4 s8 <7 _+> s <6 5> <6 4> <5 3+>
  s4 <6> s s8 <6 5>
  <7>4 s8 <7> <7>4 s8 <6 5>
  <6 4>4 <5 3>8 <6 5> <9 4>8 <8 3> <6 5->4
  <9 4->8 <8 3> s <6>  s <6> <6> <6 5>
  s8 <6 5> <6 4> <5 3> s2
  s1*11
  s2 s4 s8 <_+>
  s4 <6> <6 4> <6 4>8 <5 3+>
  s4 <6> <6 4> <6 4>8 <5 3+>
  s2 s8 <6> s4
  s2 s4 <6>8 <7 5>
  <6 4> <5 3+> s4 <5-> s8 <6>
  <7 _+>1
  s4 <6> <5!> s8 <6>
  <7 _+>1
  s4 <6> s8 <6> s4
  <6 4+ 2>8 <6> s4 <6->2
  <6 4+ 2>8 <6> s4 <6>2
  <6 4+ 2>4 <5> <7> <7>
  s2 <7>4 <7>
  s2 <6 4>8 <5 3> s4
  s1*4
  <_+>2 <6 4>
  <7 _+>2 s4 <6>
  s <6> s8 <6 5> <6 4> <5 3>
  s4 <6> s <6>
  s8 <6 5> <6 4> <5 3+> s4 s8 <_+>
  s4 <6> <6 4> <6 4>8 <5 3+>
  s4 <6> <6 4> <6 4>8 <5 3+>
  s1*4
  s8 <_+> s4 <7 _+>2
  <7 _+> <6 4>
  <6 4> <6+ 3>
  <6+ 3> <_+>
  s2 <6 5>
  <6 5>1
  s1*2
  s4 <6> <_!> s8 <7>
  <7>4 s8 <7> <7>4 s8 <7 _+>
  <6>4 <6->8 <_+> s <6> <6-> <_+>
  s4 s8 <6 5> <_+>4 <7 5>
  s4 <6 5>8 <_+> s2
  s8 <7> s4 s8 <7> s4
  s8 <7> s4 s8 <7> s4
  s8 <7> s4 s8 <7 _+> s4
  s1
  <6>2 <6+>4 <7 _+>
  s1*4
  s2 s4 <6>
  s1
  s4 <6> s2
  s8 <7> s4 <7>2
  s8 <7> s4 <7>2
  s8 <7> s4 s2
  s <6>
  <6> s
  s <6 4>
  <7 5> s4 s8 <6>
  s <6> s <6> s <6> s <6>
  s <6> s <6> s <6> s4
  s1*3
  s8 <6> s4 s8 <6+> s4
  s4 s8 <7 _+> s4 s8 <7 _+>
  s <6 5> <6 4> <5 3+> s4 s8 <7 _+>
  s4 s8 <7> s <6 5> <6 4> <5 3+>
  s4 <6> s s8 <6 5>
  <7>4 s8 <7> <7>4 s8 <6 5>
  <6 4> <5 3> <6 5>4 <9 4>8 <8 3> <6 5->4
  <9 4->8 <8 3> s <6>  s <6> <6> <6 5>
  <6 5>4 <6 4>8 <5 3>

}

forma = {

  \key sol\major
  \time 4/4
  \tempo 2 = 53
  \partial 8 s8
  s1*98
  s2 s4 s8
  \bar":|."

}

Ifl = {
  \Iglobal
  \notypeset
  <<\Ifln \forma>>

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
  \tupletSpan 4
}

IIfln = \relative do'' {

   R2*13
   r4 r8 sol'
   \terzine \tuplet 3/2 { sib16 la sol } fad32[sol16.] fad32 sol16. fad32 sol16.

   %16
   \grace {do,16[re]} mib8 re r re
   \tupletSpan 4 \tuplet 6/4 {do16 si do fad mi fad la[sol fad mib re do]}
   \terzine \tuplet 3/2 { sib16 la sib } sol'8\noBeam~\sestine \tuplet 6/4 {sol16 fa mib re do sib}

   %19
   sib8-+ la r re
   \tuplet 6/4 {sol,16 si la si re do  re[sol fad sol si do]}\mbreak
   re16.[re,32] \terzine \tuplet 3/2 { re16 mib fa? } fa32 mib16. mib32 re16.

   %22
   \grace re8 mib4 r8 do
   \sestine \tuplet 6/4 {fa,16 la sol la do sib do[fa mi fa la sib]}
   do16.[do,32]\terzine \tuplet 3/2 { do16 re mib } mib32 re16. re32 do16.

   %25
   \grace do8 re4 r8 fa
   \sestine \tuplet 6/4 {sol16 mib re mib do si do[si do mib fa sol]
                         fa re do re sib? la sib[la sib re mib fa]

                         %28
                         mib do sib do la sol la sol la do re mib}
   re16. sib'32 \terzine \tuplet 3/2 { sib16 [la sol] } \grace sol8 fa mi
   fa16. lab?32 \tuplet 3/2 { lab16[sol fa] } \grace fa8 mib! re

   %31
   mib16.[sol32] \tuplet 3/2 { sol16 fa mib } \grace mib8 re dod
   re16. fa32 \tuplet 3/2 { fa16[mib re] } \grace re8 do! si
   do16. mib32 \tuplet 3/2 { mib16[re do] } \grace do8 sib la

   %34
   \sestine \tuplet 6/4 {sib16 sib' fa re fa re} sib8(si
   do8. re32 mib) mib32 re16. re32 do16.
   \tuplet 6/4 {re16 sib' fa re fa re} sib8(si

   %37
   do8. re32 mib) mib32 re16. re32 do16.\mbreak
   \grace {sol'16[la]} sib8. la32 sol fa32 sol16. do,32 mib16.
   \terzine \tuplet 3/2 { re16 do sib la sol fa } do'4-+

   %40
   sib r
   R2
   r4 r8 sib'

   %43
   \tuplet 3/2 { re16 [do sib] } la32 sib16. la32 sib16. la32 sib16.
   \grace {mib,16[fa]} sol8 fa r fa
   \sestine  \tuplet 6/4 {mib16 re mib la sol la do sib do mib, re mib}

   %46
   \terzine \tuplet 3/2 { re[do re] } sib'8~\sestine \tuplet 6/4 {sib16 la sol fa mib re}
   re8-+ do r do16. re32
   \tuplet 6/4 {mib16 re do do sib la la' sol fad mib re do\mbreak

                %49
                sib(re sol) sol(re sib) si(re sol) sol(re si)
                do(mib sol) sol(mib do) dod(mi sol) sol(mi dod)
                re(fad la) \grace sib8 la16(sol la) re,(sol sib) \grace do8 sib16(la sib)

                %52
                re,(la' do) \grace re8 do16(sib do) re,(sib' re) \grace mib8 re16(dod re)}
   mib mib mib mib re re re re
   do do do do sib sib sib sib

   %55
   la la la la\tuplet 6/4 {sol la sib re, mib fa!}\mbreak
   mib8-+[fad-+ sol-+ la-+]
   sib-+ dod-+ re8. sib64(la sol fad)

   %58
   sol32 sib16. re,32 sol16.mib8. do'32 mi,
   \grace sol8 fad8. sol16 dod,4-+
   re8 do!~do32[la fad'?(do] la' do, sib la)

   %61
   \tuplet 6/4 {sib16 sol' fa? mib re do} \grace sib8 la4-+
   sol r
   R2*12

}

IIvlIn =  \relative do'' {

   \tuplet 6/4 {sol16 fad sol sib la sib re[do re sol fad sol]}
   fad8 re la fad
   \tuplet 6/4 {sol16 fad sol sib la sib re[do re sol fad sol]}

   %4
   sib8 sib4 dod8
   re[la fad re]
   la' la4 si8

   %7
   do[sol mi! do]
   sol' sol4 dod,8
   re16 la' la la la8.-+ sol32 la

   %10
   sol16 sib sib sib sib8.-+ la32 sib\mbreak
   la16 do do do do8.-+ sib32 do
   \tuplet 6/4 {sib16 la sib sol fad sol mib[re mib do sib do]

   %13
   sib re sol re sib sol} re8 la'-+
   sol re sol,4
   r8 re''\p[sib sol]

   %16
   do sib16 la sib8 sol
   la[re, fad la]
   sol[sol, sib sol]

   %19
   re' re r4
   r8 fa'[fa fa]
   mib4 r

   %22
   r8 do[do sib]
   la fa r4\mbreak
   r8 mib'[mib mib]

   %25
   re4 r8 re~
   re[sib do do]~
   do[la sib sib]~

   %28
   sib[sol la la]
   sib4 r
   R2*10

   %40
   \tuplet 6/4 {sib16\f la sib re do re fa[mib fa sib la sib]}
   la8[fa do la]
   \tuplet 6/4 {sib16 la sib re do re} \terzine \tuplet 3/2 { fa[mib fa] } sib8

   %43
   r8 fa\p[re sib]
   mib re16 do re8 sib\mbreak
   do[fa,la do]

   %46
   sib[sib, re sib]
   fa' fa r4
   R2*3

   %51
   r8 la r sib
   r do r re~
   re do4 sib8~

   %54
   sib la4 sol8
   sol[fad sol] r
   R2*6

   %62
   sib'8\f sib4 dod8
   re[la fad re]
   la' la4 si8

   %65
   do[sol mi! do]
   sol' sol4 dod,8
   re16 la' la la la8.-+ sol32 la

   %68
   sol16 sib sib sib sib8.-+ la32 sib\mbreak
   la16 do do do do8.-+ sib32 do\tupletSpan 4
   \tuplet 6/4 {sib16 la sib sol fad sol mib[re mib do sib do]

                %71
                sib re sol re sib sol} re8 la'-+
   \tuplet 6/4 {sol16 re sol sib re sol} si,8 si
   \tuplet 6/4 {do16 mi, sol do mi sol}  dod,8 dod

   %74
   re2

}

IIvlIIn = \relative do'' {

   R2
   \tuplet 6/4 {re,16 dod re fad mib fad la sol la do sib do}
   sib8[sol re sib]

   %4
   \tuplet 6/4 {sol'16 fad sol sib la sib re do re sib' la sib
                la sol la fad mi fad re dod re la sol la
                fa! mi fa la sol la re dod re lab' sol lab

                %7
                sol fa sol mi re mi\mbreak do si do sol fa sol
                mib? re mib sol fa sol do si do sol' fad sol}
   fad do do do do8.-+ sib32 do

   %10
   sib16 sol' sol sol sol8.-+ fad32 sol
   fad16 la la la la8.-+ sol32 la
   sol8[sib, do sol]

   %13
   sol sol4 fad8
   sol re sol,4
   r8 re''\p[sib sol]
   do sib16 la sib8 sol

   %17
   la[re, fad la]\mbreak
   sib[sol, sib sol]
   re' re r4

   %20
   r8 re' [re re]
   re4 r
   r8 do[do sib]

   %23
   la fa r4
   r8 do'[do do]
   sib4 r

   %26
   r8 sol4 mib8
   fa fa4 re8
   mib mib4 do8

   %29
   re4 r
   R2*10
   re4\f r

   %41
   \tuplet 6/4 {fa16 mi fa la sol la do sib do mib! re mib}
   re8[sib fa re]
   r fa'\p[re sib]\mbreak

   %44
   mib re16 do re8 sib
   do[fa, la do]
   sib[sib, re sib]

   %47
   fa' fa r4
   R2*3
   r8 fad r sol

   %52
   r la r sib
   sol[la fad sol]
   mi[fad sol sib,]

   %55
   do[re sib] r
   R2*6
   \tuplet 6/4{sol'16\f fad sol sib la sib re do re sib' la sib

              %63
              la sol la fad mi fad re dod re la sol la\mbreak
               fa! mi fa la sol la re dod re lab' sol lab
               sol fa sol mi re mi do si do sol fa sol

               %66
               mib? re mib sol fa sol do si do sol' fad sol}
   fad do do do do8.-+-+ sib32 do
   sib16 sol' sol sol sol8.-+ fad32 sol

   %69
   fad16 la la la la8.-+ sol32 la
   sol8[sib, do sol]
   sol sol4 fad8

   %72
   sol4 lab8 lab
   sol4 sol8 sol
   fad2

}

IIvlan =  \relative do' {

   sib8[re sol, mib']
   la,[re fad la]
   sol[re sib re]
   re[re re mi]
   fad[re' la fad]
   r re[re re]
   mi[do' sol mi]
   r do[do mib!]
   la,[fad' fad fad]
   sol[re re re]
   re[fad fad fad]
   sol[re mib mib]
   re[re re re]
   re4 r\mbreak
   r8 re'\p[sib sol]
   do[sib16 la sib8 sol]
   la[re, fad la]
   sol[sol, sib sol]
   re' re r4
   r8 si'[si si]
   si?4 r
   r8 do[do sib!]
   la fa? r4
   r8 la[la la]
   sib4 r8 fa
   mib[mib mib mib]
   re[re re re]\mbreak
   do[do do do]
   sib4 r
   R2*10
   fa'8\f[fa sib, sol']
   do,[fa la do]
   sib[fa re sib]
   r fa'\p[re sib]
   mib re16 do re8 sib'
   do[fa, la do]
   sib sib,  re sib
   fa' fa r4
   R2*3
   r8 re r re
   r fad r sol\mbreak
   sib la4 sol8~
   sol[fad re re]
   mib[re re] r
   R2*6
   re8\f[re re mi]
   fad[do' la fad]
   r re[re re]
   mi[do' sol mi]
   r do[do mib!]
   la,[fad' fad fad]
   sol[re re re]
   re[fad fad fad]
   sol[re mib mib]
   re[re re re]\mbreak
   sib[re re re]
   mi[sol, mib'! mib]
   la,2

}

IIbcn = \relative do {

   r8 sol[sib do]
   re[re re re]
   sol[sol, sol sol]

   %4
   sol[sol' sol sol]
   fad[fad fad fad]
   fa![fa fa fa]

   %7
   mi[mi mi mi]
   mib![mib mib mib]
   re[re re re]\mbreak

   %10
   re[re re re]
   re[re re re]
   sol[sol, do do]

   %13
   re[re re, re]
   sol4 r
   R2*4

   %19
   r8 re'[re do]
   si sol r4
   r8 sol[sol sol]

   %22
   do4 r
   r8 fa[fa fa]
   fa4 r

   %25
   r8 sib,[re sib]
   mib[mib la la]\mbreak
   re,[re sol sol]

   %28
   do,[do fa fa]
   sib,[sib' sib sib]
   lab[lab lab lab]

   %31
   sol[sol sol sol]
   fa[fa fa fa]
   mib[mib mib mib]

   %34
   re4 r8 re
   mib[do fa fa,]
   sib4 r8 re

   %37
   mib[do fa fa,]
   sib[do re mib]
   fa[fa fa, fa]\mbreak

   %40
   sib[sib re mib\f]
   fa[fa fa fa]
   sib[sib, sib sib]

   %43
   sib4 r
   R2*3
   r8 fa'16\p sol la sib la sol

   %48
   fad8[fad fad fad]
   sol[sol fa! fa]
   mib[mib mi mi]

   %51
   re[re re re]
   re[re re re]
   re2_\markup\italic"Tasto solo" ~

   %54
   re~
   re4 sol,8 si
   do[re mib fad?]

   %57
   sol[sol fad re]
   sol[sib do la]
   re re, la'[sol]

   %60
   fad[la fad re]
   sol[do, re re,]
   sol\f[sol' sol sol]

   %63
   fad[fad fad fad]
   fa![fa fa fa]
   mi[mi mi mi]

   %66
   mib![mib mib mib]
   re[re re re]\mbreak
   re[re re re]

   %69
   re[re re re]
   sol[sol, do do]
   re[re re, re]

   %72
   sol[sol' fa fa]
   mi[mi mib mib]
   re2

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4 <6>
  <_+> <7 _+>
  s2
  s4 s8 <6 4+ 3>
  <6>2
  <6>4 s8 <6 4+ 3->
  <6>2
  <6>4 s8 <6+>
  <_+>4 <7 _+>
  <6 4>2
  <7 _+>
  s
  <6 4>4 <5 3+>
  s2*5
  s8 <_+> s4
  <6 5-> s
  s8 <7 _!> s4
  s2*3
  s4 <6>
  <7> <7>
  <7> <7>
  <7> <7>
  <6> s8 <6 4! 2>
  <6>4 s8 <6 4 2>
  <6>4 s8 <6 4 2>
  <6>4 s8 <6 4! 2>
  <6>4 s8 <6 4! 2>
  <6>4 s8 <6!>
  <6>4 <7>
  s s8 <6!>
  <6>4 <7>
  s8 <6> <6> <6 5>
  <6 4>4 <5 3>
  s <6>
  s s8 <7>
  s2*6
  <7 5>2
  s4 <6 4 2>
  s2
  <_+>4 <6 4>
  <7 _+> <6 4>
  s2*2
  s4 <_->8 <6 5>
  <_+>2
  s8 <6 4 2> <6>4
  s8 <6> s4
  s <_+>
  <6>8 <_-> <6 5>4
  s8 <6 5> <6 4> <5 _+>
  s4 s8 <6 4+ 3>
  <6>2
  <6>4 s8 <6 4+ 3>
  <6>2
  <6>4 s8 <6+>
  <_+>4 <7 _+>
  <6 4>2
  <7 _+>
  s
  <6 4>4 s8 <5 3+>
  s4 <6 4! 2>
  <6> <6+>
  <_+>2

}

forma = {

  \key sol\minor
  \time 2/4
  \tempo 4 = 40
  s2*74
  \bar"|."

}

IIfl = {
  \IIglobal
  \notypeset
  <<\IIfln \forma>>

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

IIIfln = \relative do'' {

   R4.*22
   r4 re32\solo(do re mi)
   re16-. do-. si-. la-. sol-. fad-.

   %25
   sol4 sol'32(fad sol si)\mbreak
   la16-. sol-. fad-. mi-. re-. do-.
   do8-+ si re

   %28
   mi32(do si do) mi[(do sol' mi)] do'16 mi,
   mi8-+ re si
   do32(la sol la) do[(la fad' do)] la'16 do,

   %31
   do8-+ si re~
   re16 sol re(do) do(si)
   si8-+ la re\mbreak

   %34
   dod32(si la si) dod[(re mi fad)] sol8
   fad32(re mi fad) sol[(la si dod)] re8
   dod,32 (si la si)] dod[(re mi fad)] sol8

   %37
   fad32(re mi fad) sol[(la si dod)] re8
   si16 re la re sol, re'
   fad, re' mi, re' re, re'\mbreak

   %40
   si re la re sol, re'
   fad, re' mi, re' re, re'
   si32(sol fad mi) \grace fad8 mi4-+

   %43
   re la8
   si16 re' la, re' sol,, re''
   fad,, re'' mi,, re'' re,, re''

   %46
   si, re' la, re' sol,, re''
   fad,, re'' mi,, re'' re,, re''
   si,32(sol fad mi) \grace fad8 mi4-+\mbreak

   %49
   re4 r8
   R4.*5
   R4.*7

   %62
   r4 la'8\solo
   \grace la8 si\noBeam~si32 re(do si do[re mi fad)]
   sol32 fad16. mi32 re16. dod32 si16.

   %65
   \grace si8 la\noBeam ~la32 dod(si la si[dod re mi)]
   fad32 mi16. re32 dod?16. si32 la16.
   \grace la8 sol\noBeam~sol32 si(la sol la[si dod re)]

   %68
   mi32 re16. dod32 si16. la32 sol16.\mbreak
   fad16 re'32(dod re[ mi fad sol)] la16 la,
   si sol' la, fad' sol, mi'

   %71
   fad,16 re'32(dod re[ mi fad sol)] la16 fad,
   sol re' fad, re' mi, dod'
   re, re'32(dod re[mi fad sol)] la16 do,

   %74
   si sol'32(fad mi[fad sol la] mi re dod si)\mbreak
   \autoBeamOff lad16 fad8 lad dod16
   si fad8 si re16

   %77
   dod fad,8 dod' mi16\autoBeamOn
   \terzine \tuplet 3/2 { re si' si fad [si si] mi, si' si
   re, si' si fad[si si] mi, si' si}

   %81
   re,32 si (dod? re mi[fad sol lad)] si(fad sol fad)\mbreak
   sol(mi re dod) dod4-+
   si4 r8

   %84
   R4.*2
   fad'32(la si dod) re[fad, (mi fad)] re' fad, (mi fad)
   mi32 re'16.dod32 si16. dod32[mi,16.]

   %88
   re32(fad sol lad) si[re, (dod re)] si' re, (dod re)
   dod32 si'16. la!32 sol16. la32[dod,16.]
   si32(re mi fad) sol [si,(la si)] sol' si,(la si)\mbreak

   %91
   la32 sol'16. fad32 mi16. fad32 la,16.
   sol32(si dod re) mi[sol,(fad sol)] mi' sol,(fad sol)
   fad32 mi'16. re32 dod16. re32[fad,16.]mi32 re'16. do!32 si16. do32[mi,16.]

   %94
   fad32(la do) do fad,[(la do) do] fad,(la do) do\mbreak
   si(re sol) sol si,[(re sol) sol] si,(re sol) sol
   fad(la do) do  fad,[(la do) do] fad,(la do) do

   %97
   si16 re si, re' sol,, re''
   do do la, do' fad,, do''
   si si sol, si' mi,, si''

   %100
   la la fad, la' red,, la''\mbreak
   sol32(si la sol) fad32[mi16. red32 mi16.]
   fad32[(red dod si)] lad32 si16. lad32 si16.

   %103
   sol'32[(si la sol)] fad32 mi16. red32 mi16.
   fad32[(red dod si)] lad32 si16. lad32 si16.
   \autoBeamOff la!16 red8 fad la,16\mbreak

   %106
   sol si8 mi sol16
   si, red8 fad la16\autoBeamOn
   sol32(mi) si'(mi,) \grace sol8 fad4-+

   %109
   mi r8
   R4.*7
   si32\solo(la si do) si8[sol']

   %118
   re16(do) do(si) si8
   si32(la si do) si8 [sol']
   re16(do) do(si) si8

   %121
   si32(la si do) si8 [sol']
   fad32(mi fad sol) fad8[la]
   sol32(fad sol la) si8[dod]

   %124
   re re,(red
   \grace red mi4) \grace re'?8 do32(si do re)
   do8 do,(dod

   %127
   \grace dod re4) \grace do'?8 si32 (la si do)
   si8 si, (si
   \grace si do4) \grace si'8 la32(sol la si)\mbreak

   %130
   la8 la,(la
   \grace la8 si4) \grace la'8 sol32(fad sol la)
   sol8 r \grace la sol32(fad sol la)

   %133
   sol8 r \grace la sol32(fad sol la)
   \grace la8 sol32(fad sol la) \grace la8 sol32[(fad sol la)] sol16 la32 si
   \grace si8 do4 si8~

   %136
   si16 do \grace si8 la4-+
   sol4 r8
   R4.*5

}

IIIvlIn =  \relative do'' {

   si32(la si do) si8 [sol']
   re16(do) do(si) si8
   si32(la si do) si8 [sol']

   %4
   re16(do) do(si) si8
   si32(la si do) si8 [sol']
   fad32(mi fad sol) fad8[la]

   %7
   sol32(fad sol la) si8[dod]
   re re,(red
   \grace red mi4) \grace re'?8 do32(si do re)

   %10
   do8 do,(dod
   \grace dod re4) \grace do'?8 si32 (la si do)
   si8 si, (si

   %13
   \grace si do4) \grace si'8 la32(sol la si)\mbreak
   la8 la,(la
   si4) \grace la'8 sol32(fad sol la)

   %16
   sol8 r \grace la sol32(fad sol la)
   sol8 r \grace la sol32(fad sol la)
   \grace la8 sol32(fad sol la) \grace la8 sol32[(fad sol la)] sol16(la32 si)

   %19
   \grace si8 do4 si8~
   si16 do \grace si8 la4-+
   sol8\noBeam re32(do re mi) re[(do si la)]

   %22
   <sol' si, re, sol,>8 <sol si, re, sol,> <sol si, re, sol,>
   <sol si, re, sol,>4 r8
   R4.*3

   %27
   r8 r si,\p
   do do do
   do-+ si si

   %30
   la la la
   la-+ sol r
   R4.*2

   %34
   r8 r mi'\mbreak
   fad r fad
   mi r mi

   %37
   fad4 r8
   R4.*5
   re,8_\markup {[\musicglyph #"p"]} fad re

   %44
   sol fad mi
   re mi fad
   sol fad mi

   %47
   re mi fad
   sol la la,
   re\noBeam la''32\f(sol la si) sol16[sol]

   %50
   fad8\noBeam fad32(mi fad sol) mi16[mi]
   re8\noBeam la32(sol la si) sol16[sol]
   fad8\noBeam fad32(mi fad sol) mi16[mi]

   %53
   re32(fad la re) fad,8[mi-+]
   re4 r8
   fad'32(mi fad sol) fad8[re']\mbreak

   %56
   la16(sol) sol(fad) fad8
   fad32(mi fad sol) fad8[re']
   la16(sol) sol(fad) fad8

   %59
   fad32(mi fad sol) fad8[la]
   mi32(re mi fad) mi8[la]
   re,32(dod re mi) fad8[sold]

   %62
   la la, r
   R4.
   sol'8\p[sol sol]

   %65
   dod,4 r8
   fad fad fad
   si,4 r8

   %68
   mi mi mi
   la,4 r8
   R4.*5

   %75
   lad8 lad lad
   si si si
   dod dod dod\mbreak

   %78
   re4 r8
   R4.*3
   r16 si'\noBeam si32(lad si do) la16[la]

   %83
   sold sold sold sold sold[(la32 si)]
   la16[la] la32(sold? la si) sol16[sol]
   fad4 r8

   %86
   R4.*8
   la,4 r8
   si4 r8

   %96
   do4 r8
   si4 r8
   R4.*3

   %101
   mi4 r8
   red4 r8
   mi4 r8

   %104
   red4 r8
   R4.*4
   mi32\f[(red mi fad)] mi8 sol

   %110
   sol16(fad) fad(mi) mi8
   fad32[(mi fad sol)] fad8 la\mbreak
   la16(sol) sol(fad) fad8

   %113
   sol32[(fad sol la)] sol8 si
   si16(la) la(sol) sol8
   si32[(la si do)] la8 sol

   %116
   sol-+ fad r
   R4.*7
   r8 si,\p si

   %125
   do do do
   la la la
   si si si

   %128
   sol sol sol
   la la la
   fad fad fad

   %131
   sol sol, si
   do do re
   mi mi si

   %134
   do re mi\mbreak
   la fad sol
   do, re re

   %137
   sol,\noBeam re''32\f[(do re mi)] do16[do]
   si8\noBeam si32(la si do) la16[la]
   sol8\noBeam re'32(do re mi) do16[do]

   %140
   si8\noBeam si32(la si do) la16[la]
   sol32(si re sol) si,8[la]
   <sol' si, re, sol,>4 r8

}

IIIvlIIn = \relative do'' {

   sol32[(fad sol la)] sol8 si
   si16(la) la(sol) sol8
   sol32[(fad sol la)] sol8 si

   %4
   si16(la) la(sol) sol8
   sol32[(fad sol la)] sol8 si
   la32[(sol la si)] la8 do

   %7
   si32[(la si do)] si8 sol'
   fad r si,
   do32(si do re) mi[(re mi fad)] sol8

   %10
   fad4 fad,8\mbreak
   si32(la si do) re[(do re mi)] fad8
   mi4 mi,8

   %13
   la32(sol la si) do[(si do re)] mi8
   re4 re,8
   sol32(fad sol la) si[(la si do)] re8

   %16
   r16 mi re do si8\noBeam
   r16 do si la sol8\noBeam
   r16 mi' re do si sol'

   %19
   la4 sol8~
   sol16 la sol8[fad]
   sol\noBeam si,32(la si do) si[(la sol fad)]
   <si sol sol,>8 <si sol sol,> <si sol sol,>

   %23
   <si sol sol,>4 r8
   R4.*3\mbreak
   r8 r sol\p

   %28
   do do do
   sol sol sol
   la fad re

   %31
   sol sol, r
   R4.*2
   r8 r do'

   %35
   re r re
   dod r dod
   re4 r8

   %38
   R4.*5
   re,8_\markup {[\musicglyph #"p"]} fad re
   sol fad mi

   %45
   re mi fad
   sol fad mi
   re mi fad

   %48
   sol la la,
   re\noBeam fad'32\f(mi fad sol) mi16[mi]
   re8 re32[(dod re mi)] dod16 dod

   %51
   re8\noBeam fad,32(mi fad sol) mi16[mi]\mbreak
   re8 re32(dod re mi) dod16[dod]
   re8 re dod

   %54
   re4 r8
   re'32(dod re mi) re8[fad]
   fad16(mi) mi(re) re8

   %57
   re32(dod re mi) re8[fad]
   fad16(mi) mi(re) re8
   re32(dod re mi) re8[re]

   %60
   dod32(si dod re) dod8[dod]
   si32(la si dod) re8[re]
   dod4 r8

   %63
   R4.
   si8\p si si
   la4 r8

   %66
   la la la
   sol4 r8
   sol sol sol\mbreak

   %69
   fad4 r8
   R4.*5
   dod8 dod dod

   %76
   re re re
   lad' lad lad
   si4 r8

   %79
   R4.*3
   r16 red red red red mi32 fad
   mi16 mi mi32[(re mi fad)] re!16 re

   %84
   dod16 dod dod dod dod[re32 mi]
   re4 r8
   R4.*8

   %94
   fad,4 r8
   sol4 r8
   la4 r8

   %97
   sol4 r8
   R4.*3
   sol'4 r8

   %102
   fad4 r8
   sol4 r8
   fad4 r8

   %105
   R4.*4
   sol,32\f[(fad sol la)] sol8 si\mbreak
   si16(la) la(sol) sol8

   %111
   red'32(dod red mi) red8[fad]
   fad16(mi) mi(red) red8
   mi32(red mi fad) mi8[sol]

   %114
   sol16(fad) fad(mi) mi8
   sol32(fad sol la) fad8[mi]
   mi-+ red r

   %117
   R4.*7
   r8 si\p si
   do do do

   %126
   la la la
   si si si
   sol sol sol

   %129
   la la la
   fad fad fad
   sol sol, si

   %132
   do do re\mbreak
   mi mi si
   do re mi

   %135
   la fad sol
   do, re re
   sol,\noBeam si'32\f(la si do) la16[la]

   %138
   sol8\noBeam sol32(fad sol la) fad16[fad]
   sol8\noBeam si32(la si do) la16[la]
   sol8\noBeam sol32(fad sol la) fad16[fad]

   %141
   sol8 sol fad
   sol4 r8

}

IIIvlan =  \relative do' {

   re8 re re
   re4 r8
   re8 re re

   %4
   re4 r8
   re re re
   re re fad

   %7
   sol re mi
   la, r sol'
   sol sol mi'

   %10
   mi mi mi
   re re re
   re re re\mbreak

   %13
   do do do
   do do do
   si si si

   %16
   r16 sol fad mi re8\noBeam
   r16 mi re do si8\noBeam
   r16 do' si la sol8\noBeam

   %19
   mi fad sol
   mi re re
   re4 re8

   %22
   re re re
   re4 r8
   R4.*3

   %27
   r8 r sol
   do do do\mbreak
   sol sol sol

   %30
   la fad re
   sol sol, r
   R4.*2

   %34
   r8 r la'
   la r la
   sol r la

   %37
   la4 r8
   R4.*5
   re,8 fad re

   %44
   sol fad mi
   re mi fad
   sol fad mi

   %47
   re mi fad
   sol la la,
   re re' dod

   %50
   re la la~
   la re, dod
   re la la

   %53
   la la la
   la4 r8\mbreak
   la'8 la la

   %56
   la4 r8
   la la la
   la4 r8

   %59
   la la la
   la la la
   si si si

   %62
   mi,4 r8
   R4.
   sol8 sol sol

   %65
   fad4 r8
   fad fad fad
   mi4 r8

   %68
   mi mi mi
   re4 r8
   R4.*5

   %75
   fad8 fad fad
   fad fad fad
   fad fad fad

   %78
   fad4 r8
   R4.*3
   fad8 fad si

   %83
   si si mi,\mbreak
   mi mi la
   la4 r8

   %86
   R4.*8
   re,4 r8
   re4 r8

   %96
   fad4 r8
   sol4 r8
   R4.*3

   %101
   si4 r8
   si4 r8
   si4 r8

   %104
   si4 r8
   R4.*4
   si8 si si

   %110
   si4 r8
   si si si
   si4 r8

   %113
   si si si
   si4 r8
   si do dod

   %116
   si si r
   R4.*7\mbreak
   r8 si si

   %125
   do do do
   la la la
   si si si

   %128
   sol sol sol
   la la la
   fad fad fad

   %131
   sol sol, si
   do do re
   mi mi si

   %134
   do re mi
   la fad sol
   do, re re

   %137
   sol, sol' fad
   sol re re
   re sol fad

   %140
   sol re re
   re re re
   re4 r8

}

IIIbcn = \relative do {

   sol8 sol' sol,
   sol4 r8
   sol sol' sol,

   %4
   sol4 r8
   sol sol' sol,
   re re' re,\mbreak

   %7
   sol sol' mi
   re si' si
   do do do

   %10
   la la la
   si si si
   sol sol sol

   %13
   la la la
   fad fad fad
   sol sol, si

   %16
   do4 re8
   mi4 si8
   do re mi

   %19
   la re, sol
   do, re re,
   sol4 re'8

   %22
   sol re si
   sol4 sol'8\mbreak
   fad4 re8

   %25
   mi re16 do si8
   do re re,
   sol sol r

   %28
   R4.*4
   sol8 sol' sol,
   re' fad re

   %34
   la la la
   la la la
   la la la

   %37
   re mi fad
   sol fad mi
   re mi fad

   %40
   sol fad mi
   re mi fad
   sol la la,

   %43
   re4 r8\mbreak
   R4.*5
   r8 re' la

   %50
   re, re' la
   re, re la
   re, re' la

   %53
   re la' la,
   re4 r8
   re re' re,

   %56
   re4 r8
   re re' re,
   re4 r8

   %59
   re[re] re32(mi fad sol)
   la8[la,] la32(si dod la)
   si8 si si

   %62
   la fad' re\mbreak
   sol sol sol
   mi mi mi

   %65
   fad fad fad
   re re re
   mi mi mi

   %68
   dod dod dod
   re4 fad8
   sol fad mi

   %71
   re4 re'8
   si la la,
   re fad re

   %74
   sol4 sol8
   fad fad fad
   fad fad fad

   %77
   fad fad fad
   si, re dod\mbreak
   si re dod

   %80
   si dod re
   mi fad fad,
   si si si

   %83
   mi mi mi
   la, la la
   re4 re8

   %86
   la' la lad
   si si, si
   fad' fad fad

   %89
   sol sol, sol
   re' re re
   mi dod la

   %92
   re fad re
   sol la la,
   re4 r8\mbreak

   %95
   re4 r8
   re4 r8
   sol4 mi8

   %98
   la4 re,8
   sol4 do,8
   fad4 si,8

   %101
   mi4 r8
   si4 r8
   mi4 r8

   %104
   si4 r8
   fad' si, red
   mi mi mi

   %107
   red red red
   mi la, si
   mi mi' mi,

   %110
   mi4 r8
   si si' si,\mbreak
   si4 r8

   %113
   mi mi' mi,
   mi4 r8
   mi la lad

   %116
   si si,16 do! si la
   sol8 sol' sol,
   sol4 r8

   %119
   sol8 sol' sol,
   sol4 r8
   sol sol' sol,

   %122
   re re' re,
   sol sol' mi
   re4 r8

   %125
   R4.*12\mbreak
   r8 sol re
   sol, sol' re

   %139
   sol, sol' re
   sol, sol' re
   sol, re' re,

   %142
   sol4 r8

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4.*5
  <7>4.
  s4 <6+>8
  s <6> <_+>
  s4.
  <6 5>4 <_+>8
  s4.
  <6 5>
  s
  <6 5>
  s4 <6>8
  s4 <6>8
  <5>4 <6>8
  s <6> <5>
  s <7> s
  <7> <4> <3>
  s4.*3<6>4.
  s4 <6>8
  <6 5> <4> <3>
  s4.*6
  <6 4>8 <5 3> s
  <7 _+>4.
  <6 4>
  <7 _+>
  s4.*5
  <6 5>8 <6 4> <5 3+>
  s4.*6
  s4 <7 _+>8
  s4 <_+>8
  s4 <7 _+>8
  s4 <_+>8
  s <6 4> <5 3+>
  s4.*7
  <7>4 <6+>8
  s <6> s
  s4.
  <6 5>
  s
  <6 5>
  s
  <6 5>
  s4 <6>8
  s4.
  s
  <6>8 <6 4> <5 3+>
  s <6> <7->
  s4 <6>8
  <7 _+>4.
  <6 4>
  <7 _+>
  s8 <6>4
  s8 <6>4
  s8 <6+> <6>
  <6 5> <6 4> <5 3+>
  s <7 _+> s
  s <7 _+> s
  s s <7! _+>
  s4.
  <5 4>8 <3+> s
  s4.
  <5+ 4>4 <3>8
  s4.
  <5 4>8 <3> s
  s <6 5> s
  <9>4.
  <6 5>8 <_-> s
  <7 _+>4.
  <6 4>
  <7>
  s
  s4 <7>8
  <7>4 <7>8
  <7>4 <7 _+>8
  s4.
  <_+>
  s
  <_+>
  s8 <_+> s
  s4.
  <6 5>
  s8 <6 5> <_+>
  s4.
  s
  <7 _+>
  s4.*3
  s8 <6> <7>
  <6 4> <5 3+> s
  s4.*5
  <7>4.
  s4 <6+>8
  s4.*13
  s4 <7>8
  s4 <7>8
  s4 <7>8
  s4 <7>8
  s <6 4> <5 3>

}

forma = {

  \key sol\major
  \time 3/8
  \tempo 4. = 45
  s4.*54
  \bar":..:"\break
  s4.*88
  \bar ":|."

}

IIIfl = {
  \IIIglobal
  %\notypeset
  <<\IIIfln \forma>>

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
#(set-global-staff-size 17)


\pointAndClickOff

\paper {

   systems-per-page = #3
   print-first-page-number = ##t
   first-page-number = #2

}

\markup \huge {"[1.] Allegro"}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   } <<

      \new Staff  <<
         \set Staff.instrumentName = \markup  \center-column{"Flauto""Obbligato"}
         \set Staff.midiInstrument = #"flute"
         \Ifl
      >>

      \new PianoStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
            \IvlI
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
            \IvlII
         >>
      >>

      \new Staff <<
         \set Staff.midiInstrument = #"viola"
         \set Staff.instrumentName = \markup \center-column{"Viola"}
         \Ivla
      >>

      \new Staff <<
         \set Staff.midiInstrument = #"cello"
         \set Staff.instrumentName = \markup \center-column{"Basso"}
         \Ibc
      >>
   >>

   \layout {

      indent = 2\cm


      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #2
         \override StaffGrouper.staff-staff-spacing.basic-distance = #8
         \override BarLine #'hair-thickness = #1.2
         %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {"[2.] Largo"}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   } <<

      \new Staff  <<
         \set Staff.midiInstrument = #"flute"
         \IIfl
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

      indent = 1\cm


      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #2
         \override StaffGrouper.staff-staff-spacing.basic-distance = #8
         \override BarLine #'hair-thickness = #1.2
         %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {"[3.] Affettuoso ma non Presto"}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   } <<

      \new Staff  <<
         \set Staff.midiInstrument = #"flute"
         \IIIfl
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

      indent = 1\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #2
         \override StaffGrouper.staff-staff-spacing.basic-distance = #8
         \override BarLine #'hair-thickness = #1.2
         %\override SpacingSpanner.uniform-stretching = ##t
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
