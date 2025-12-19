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

Ivln = \relative do'' {

  si8
  re32(dod si8.)~si8 si re32(dod si8.)~si8 sol'
  fad32(mi re8.) mi32(re dod8.) re32(dod si8.)~si8 si
  re32(dod si8.)~si8 si re32(dod si8.)~si8 fad'

  %4
  sol32(fad mi8.) fad32(mi re8.) dod8 lad fad[fad']
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4

  %7
  \appoggiatura sol8 fad16(mi fad8) r4 r2
  r4 r8 fad si32(la sol8.) la32(sol fad8.)
  sol16 mi sol la si4 la32(sol fad8.) sol32(fad mi8.)

  %10
  fad16 re fad sol la4 sol32(fad mi8.) fad32(mi re8.)
  mi16 dod mi fad sol4 fad32(mi re8.) mi32(re dod8.)
  re32(dod si8.)~si8 fad' re32(dod si8.)~si8 fad'\mbreak  %% fine pagina

  %13
  re8 si dod lad si4 r8 fad'
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r8 \parenthesize re8
  fad re  mi dod si4 r8 si %% inizia solo

  %16
  re32(dod si8.) fad4\tr re'32(dod si8.) fad'4\tr
  re32(dod si8.) fad4\tr re'32(dod si8.) fad'4\tr
  si8[la16(sol) fad(mi) re(dod)] re si fad re si8 r

  %19
  si''4~si16 re32 (dod si16 lad) si4~si16 re32 (dod si16 lad)\mbreak
  si16 re32 (dod si16 lad) si16 re32 (dod si16 la?) sol mi sol la si4
  la~la16 dod32(si la16 sol) la4~la16 dod32(si la16 sol)

  %22
  la16 dod32(si la16 sol) la16 dod32(si la16 sol) fad re fad sol la4
  sol~sol16 si32(la sol16 fad) sol4~sol16 si32(la sol16 fad)
  sol16 si32(la sol16 fad) sol16 si32(la sol16 fad) mi32(re dod16) mi8\noBeam fad32(mi re16) fad8\noBeam

  %25
  sol32(fad mi16) sol8\noBeam la32(sol fad16) la8\noBeam \mbreak si32(la sol16) si8\noBeam dod32(si la16) dod8\noBeam
  \once\slurDashed re16 (dod32 si la16) re, mi4\tr re~re16 fad(la do)
  si32(la sol8.) la32[(sol fad8.)] sol32(fad mi8.)~mi8[si']

  %28
  do32(si la8.) red32[(dod si8.)] mi16(re?32 do si16) mi, fad4\tr
  mi r8 mi sol32 fad mi8.~mi8 do'
  si32(la sol8.) la32[(sol fad8.)] sol32(fad \once\tieDashed mi8.)~ mi4\mbreak

  %31
  \appoggiatura do'8 si16(la si8) \appoggiatura do8 si16[(la si8)] \appoggiatura do8 si16(la si8) r4
  \appoggiatura do8 si16(la si8) \appoggiatura do8 si16[(la si8)] \appoggiatura do8 si16(la si8) r4
  r4 r8 mi, la32(sol fad8.) sol32(fad mi8.)

  %34
  fad16 re fad sol la4 sol32 fad mi8. fad32 [(mi re8.)]
  mi16 do mi fad sol4 fad32(mi red8.) mi32[(red dod8.)]
  red16 si red mi fad4 sol32(fad mi8.)~mi8[si']\mbreak

  %37
  sol32(fad mi8.)~mi8[si'] sol mi fad red
  mi4 r8 si' \appoggiatura do8 si16(la si8) \appoggiatura do8 si16[(la si8)]
  \appoggiatura do8 si16(la si8)  \appoggiatura do8 si16[(la si8)] si8 sol la fad

  %40
  mi16(si la) si mi,(si' mi) sol fad(red dod) red fad,(red' fad) la
  sol(si, la) si mi,(si' sol') si fad8 si, r4
  si'16(re,? dod) re mi,(re' sold) si la(do, si) do mi,(do' la') sol?\mbreak

  %43
  fad(do si) do re,(do' fad) la sol(si, la) si re,(si' sol') fad
  mi(do si) do sol(do mi) sol fad(sol la si do8) mi,
  red16(mi fad sol la8) do,si16(do red mi fad8) la,

  %46
  sol32(fad mi8.) si'32(la sol8.) sol'32(fad mi8.) si'32(la sol8.)
  fad16 (mi re) do si8[si'] mi[(re16 dod si8 lad)]
  \appoggiatura dod8 si16(lad si8) \appoggiatura dod8 si16(lad si8)\mbreak re8[(dod16 si la?8 sold)] %%p.6

  %49  OOO KKKKk
  \appoggiatura si8 la16(sold la8) \appoggiatura si8 la16(sold la8) do[(si16 la sol?8 fad)]
  \appoggiatura la8 sol16(fad sol8) \appoggiatura la8 sol16(fad sol8) \appoggiatura re do16(si do8) \appoggiatura re do16(si do8)
  si8(re sol4) \appoggiatura re8 do16(si do8) \appoggiatura re do16(si do8)

  %52
  si8(re sol4) do16(la) si(sol) la4\tr
  sol4 r8 sol si32(la sol8.)~sol8 mi\mbreak
  re32(do si8.) do32(si la8.) si32(la sol8.)~sol8 sol'

  %55
  si32(la sol8.)~sol8 sol si32(la sol8.)~sol8 re
  mi32(re do?8.)re32(do si8.) la8 fad re4
  \appoggiatura mi'8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4

  %58
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4
  r2 r4 r8 sol

  %61
  \slurDashed si32 (la sol8.)~sol8 re si'32 (la sol8.)~sol8 re\slurSolid
  si'32(la sol8.) la32(sol fad8.) sol4 r
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4

  %64
  r2 sol16 si, re, re re si' sol' si
  fad la, re, re re la' fad' la sol si, re, re re si' sol' si
  la re, re, re re re' la' do\mbreak si re, re, re re re' si' re

  %67
  do re, re, re re re' la' re si re, re, re re re' si' re
  la8 re, r4 sold16 re mi,(re' sold8) si
  la16 do, mi,(do' la'8) sol? fad16 do \once\slurDown re,(do' fad8) la

  %70
  sol16 si, re,(si' sol'8) fad mi16 si sol(si mi8) sol
  fad16 do la(do fad8) la red,16 fad, \once\slurDown  la,(fad' red'8) la'
  sol16 si, mi,(si' sol'8) fad mi16 lad, \once\slurDown fad(lad mi'8) fad\mbreak

  %73 OK
  red?16 si do8~do16 si do si \parenthesize mi \parenthesize si \parenthesize do8~\parenthesize do16 \parenthesize si \parenthesize do \parenthesize si
  fad' si, do8~do16 si do si sol' si, do8~do16 si do si
  lad' si, do8~do16 si do si si'8[la?16 sol fad mi re? dod?]

  %76
  re32(dod si8.)~si8 si re32(dod si8.)~si8 sol'
  fad32(mi re8.) mi32(re dod8.) re32(dod si8.)~si4
  \appoggiatura sol'8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4

  %79
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8)\mbreak \appoggiatura sol8 fad16(mi fad8) r fad
  si16 fad red si si,8 \once\stemDown la'' sol16 mi si sol mi8 mi'
  la16 mi dod la la,8 \once\stemDown sol'' fad16 re? la fad re8 fad'

  %82
  sol16 mi dod lad fad8 mi're16 si fad re si8 si'
  re32(dod si8.) fad4\tr re'32(dod si8.) fad'4\tr
  re32(dod si8.) fad4\tr re'32(dod si8.) fad'4\tr

  %85
  sol4~sol16 si32(la sol16 mi) sol si32(la sol16 mi) sol si32(la sol16 mi)\mbreak
  lad4~lad16 dod32(si lad16 mi) lad16 dod32(si lad16 mi) lad16 dod32(si lad16 mi)
  re8 re' do mi lad,4.\tr si8

  %88
  si4 r8 fad si32(la? sol8.) la32(sol fad8.)
  sol16 mi sol la si4 la32(sol fad8.) sol32(fad mi8.)
  fad16 re fad sol la4 sol32(fad mi8.) fad32(mi re8.)

  %91
  mi16 dod mi fad sol4 fad32(mi re8.) mi32(re dod8.)
  re32(dod si8.)~si8 fad' re32(dod si8.)~si8 fad'
  re8 si dod lad si4 r8 fad'

  %94
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r8 re
  fad re  mi dod si2\fermata

}

IvlIn =  \relative do'' {

  si8
  re32(dod si8.)~si8 si re32(dod si8.)~si8 sol'
  fad32(mi re8.) mi32(re dod8.) re32(dod si8.)~si8 si
  re32(dod si8.)~si8 si re32(dod si8.)~si8 fad'

  %4
  sol32(fad mi8.) fad32(mi re8.) dod8 lad fad[fad']
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4

  %7
  \appoggiatura sol8 fad16(mi fad8) r4 r2
  r4 r8 fad si32(la sol8.) la32(sol fad8.)
  sol16 mi sol la si4 la32(sol fad8.) sol32(fad mi8.)

  %10
  fad16 re fad sol la4 sol32(fad mi8.) fad32(mi re8.)
  mi16 dod mi fad sol4 fad32(mi re8.) mi32(re dod8.)
  re32(dod si8.)~si8 fad' re32(dod si8.)~si8 fad'\mbreak  %% fine pagina

  %13
  re8 si dod lad si4 r8 fad'
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r8 \parenthesize re8
  fad re  mi dod si4 r

  %16
  R1*12
  r2 r4 r8 fad'
  sol32 fad mi8.~mi8 mi sol32 fad mi8.~mi8 do'

  %30
  si32(la sol8.) la32[(sol fad8.)] sol32(fad \once\tieDashed mi8.)~ mi4\mbreak
  \appoggiatura do'8 si16(la si8) \appoggiatura do8 si16[(la si8)] \appoggiatura do8 si16(la si8) r4
  \appoggiatura do8 si16(la si8) \appoggiatura do8 si16[(la si8)] \appoggiatura do8 si16(la si8) r4
  r4 r8 mi, la32(sol fad8.) sol32(fad mi8.)

  %34
  fad16 re fad sol la4 sol32 fad mi8. fad32 [(mi re8.)]
  mi16 do mi fad sol4 fad32(mi red8.) mi32[(red dod8.)]
  red16 si red mi fad4 sol32(fad mi8.)~mi8[si']\mbreak

  %37
  sol32(fad mi8.)~mi8[si'] sol mi fad red
  mi4 r8 si' \appoggiatura do8 si16(la si8) \appoggiatura do8 si16[(la si8)]
  \appoggiatura do8 si16(la si8)  \appoggiatura do8 si16[(la si8)] si8 sol la fad

  %40
  mi mi, sol mi r si red si
  r mi sol mi r si red si
  r mi sold mi r la, do la\mbreak

  %43
  r re fad re r sol, si sol
  r do mi do r2
  R1*2

  %47
  r2 dod'\p
  re8 si sol mi\mbreak  si'2
  do8 la fad re la'2

  %50
  si8 sol mi do la' fad re la
  sol' re si sol la' fad re la
  sol' re si sol fad' sol re' la'

  %53
  si32\f(la sol8.)~sol8 sol si32(la sol8.)~sol8 mi\mbreak
  re32(do si8.) do32(si la8.) si32(la sol8.)~sol8 sol'

  %55
  si32(la sol8.)~sol8 sol si32(la sol8.)~sol8 re
  mi32(re do?8.)re32(do si8.) la8 fad re4
  \appoggiatura mi'8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4

  %58
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4
  r2 r4 r8 sol

  %61
  \slurDashed si32 (la sol8.)~sol8 re si'32 (la sol8.)~sol8 re\slurSolid
  si'32(la sol8.) la32(sol fad8.) sol4 r
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4

  %64
  R1*12
  re32(dod si8.)~si8 si re32(dod si8.)~si8 sol'
  fad32(mi re8.) mi32(re dod8.) re32(dod si8.)~si4

  %78
  \appoggiatura sol'8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8)\mbreak \appoggiatura sol8 fad16(mi fad8) r4
  R1*8

  %88
  r4 r8 fad si32(la? sol8.) la32(sol fad8.)
  sol16 mi sol la si4 la32(sol fad8.) sol32(fad mi8.)
  fad16 re fad sol la4 sol32(fad mi8.) fad32(mi re8.)

  %91
  mi16 dod mi fad sol4 fad32(mi re8.) mi32(re dod8.)
  re32(dod si8.)~si8 fad' re32(dod si8.)~si8 fad'
  re8 si dod lad si4 r8 fad'

  %94
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r8 re
  fad re  mi dod si2\fermata

}

IvlIIn = \relative do'' {

  fad8
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4

  %4
  r2 r4 r8 si,
  re32(dod si8.)~si8 si re32(dod si8.)~si8 sol'
  fad32(mi re8.) mi32(re dod8.) re32(dod si8.)~si8 si\mbreak

  %7
  re32(dod si8.)~si8 fad' sol32(fad mi8.) fad32(mi re8.)
  dod8 lad fad4 r r8 si
  mi32(re dod8.) re32(dod si8.) dod16 la dod re mi4

  %10
  re32(dod si8.) dod32(si la8.) si16 sol si dod re4
  dod32(si la8.) si32 la sol8. la16 fad la si dod8 fad
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r8 \parenthesize re

  %13
  fad8 re mi dod si4 r8 fad'
  re32(dod si8.)~si8 fad' re32(dod si8.)~si8 fad'
  re si dod lad si4 r

  %16
  R1*13
  \appoggiatura do'8 si16(la si8) \appoggiatura do8 si16(la si8) \appoggiatura do8 si16(la si8) r4
  \appoggiatura do8 si16(la si8) \appoggiatura do8 si16(la si8) \appoggiatura do8 si16(la si8) r8 mi,\mbreak
  sol32 fad mi8.~mi8 mi sol32 fad mi8.~mi8 do'

  %32
  si32(la sol8.) la32[(sol fad8.)] sol32(fad mi8.)~ mi8 si
  mi32(re do8.) re32(do si8.) do16 la do re mi4
  re32(do si8.) do32(si  la8.) si16 sol si do re4

  %35
  do32(si la8.) si32(la sol8.) la16 fad la si dod4
  si32 la sol8. la32 sol fad8. mi8 sol'  \appoggiatura do8 si16(la si8)\mbreak
  \appoggiatura do8 si16(la si8) \appoggiatura do8 si16(la si8) si8 sol la fad

  %38
  mi4 r8 si' sol32(fad mi8.)~mi8 si'
  sol32(fad mi8.)~mi8 si' sol mi fad red
  mi8 mi, sol mi r si red si

  %41
  r mi sol mi r si red si
  r mi sold mi r la, do la\mbreak
  r re fad re r sol, si sol

  %44
  r do mi do r2
  R1*2

  %47
  r2 dod'\p
  re8 si sol mi\mbreak  si'2
  do8 la fad re la'2

  %50
  si8 sol mi do la' fad re la
  sol' re si sol la' fad re la
  sol' re si sol fad' sol re' re,

  %53
  \appoggiatura mi'8 re16\f(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4

  %56
  r2 r4 r8 sol
  si32(la sol8.)~sol8 sol si32(la sol8.)~sol8 mi
  re32(do si8.) do32(si la8.) si32(la sol8.)~sol8 sol'

  %59
  si32(la sol8.)~sol8 sol si32(la sol8.)~sol8 re
  mi32(re do8.) re32(do si8.)\mbreak la8[fad] re re'
  \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) \appoggiatura mi8 re16(do re8) r4

  %62
  r2 r4 r8 re
  \once\slurDashed si'32(la sol8.)~sol8 re si'32(la sol8.)~sol8 re
  si'32(la sol8.) la32(sol fad8.) sol4 r

  %65
  R1*11
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r4
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 \once\slurDashed fad16(mi fad8) \appoggiatura sol8 \once\slurDashed fad16(mi fad8) r8 si,

  %78
  re32(dod si8.)~si8 si re32(dod si8.)~si8 fad'
  sol32(fad mi8.) fad32(mi re8.)\mbreak dod8 lad fad4
  R1*8

  %88
  r2 r4 r8 si
  mi32(re dod8.) re32(dod si8.) dod16 la dod re mi4
  re32(dod si8.) dod32(si la8.) si16 sol si dod re4

  %91
  dod32(si la8.) si32 la sol8. la16 fad la si dod8 fad
  \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) r8 re
  fad8 re mi dod si4 r8 fad'

  %94
  re32(dod si8.)~si8 fad' re32(dod si8.)~si8 fad'
  re si dod lad si2\fermata

}

Ivlan = \relative do'{

  r8
  r re fad re r re fad re
  r si' dod lad fad re fad re
  r re fad re r re fad re

  %4
  r dod' si fad lad, fad' fad re
  r re fad re r re fad re
  r si' dod lad fad re fad re\mbreak

  %7
  r re fad re r dod' si fad
  lad,4 lad' fad4. red8
  si4. sol'8 mi4. dod8

  %10
  la4. fad'8 re4. si8
  sol4. mi'8 dod4. lad'8
  si re, fad re r re fad re\mbreak

  %13
  r fad sol fad re re fad re
  r re fad re r re fad re
  r re sol fad re4 r

  %16
  R1*13
  r8 sol si sol r sol si sol
  r sol fad red r sol si sol\mbreak

  %31
  r sol si sol r sol si sol
  r sol fad red r sol si sol
  si4. sold8 mi4. do8

  %34
  la'4. fad8 re4. si8
  sol'4. mi8 dod?4. lad8
  fad'4. red?8 si sol' si sol\mbreak

  %37
  r sol si sol r si do si
  sol sol si sol r sol si sol
  r sol si sol r si do si

  %40
  sol mi\p sol mi r si red si
  r mi sol mi r si red si
  r mi sold mi r la, do la\mbreak

  %43
  r re fad re r sol, si sol
  r do mi do r2
  R1*2

  %47
  r2 dod'\p
  re8 si sol mi\mbreak  si'2
  do8 la fad re la'2

  %50
  si8 sol mi do la' fad re la
  sol' re si sol la' fad re la
  sol' re si sol fad' sol re' re,

  %53
  r8 si'\f re si r si, re si\mbreak
  r si' la fad r si, re si
  r si re si r si' re si

  %56
  r fad re re fad mi re do
  si si' re si r si, re si
  r si' la fad r si, re si

  %59
  r si re si r si' re si
  r fad re re\mbreak fad mi re do
  si si' re si r si, re si

  %62
  r re re fad re si re si
  r si' re si r si, re si
  r re re fad re4 r

  %65
  R1*11
  r8 re fad re r re fad re
  r fad lad lad r re, fad re

  %78
  r re fad re r re fad re
  r lad' si si\mbreak lad2
  R1*8

  %88
  r8 re, fad re fad4. red8
  si4. sol'8 mi4. dod8
  la4. fad'8 re4. si8

  %91
  sol4. mi'8 dod4. lad8\mbreak
  fad re' fad re r re fad re
  r fad sol fad fad re fad re

  %94
  r re fad re r re fad re
  r fad sol fad re2\fermata

}

Ibcn = \relative do {

  r8
  r si re si r si re si
  r si fad' fad, si si  re si
  r si re si r si re si

  %4
  mi dod re si fad' mi re si
  r si re si r si re si
  r si fad' fad, si si re si\mbreak

  %7
  r si re si mi dod re si
  fad' sol fad mi red4. red8
  mi4. mi8 la,4. la8

  %10
  re4. re8 sol4. sol8
  dod,4. dod8 fad4. fad8
  si, si re si r si re si\mbreak

  %13 OOKK
  si si mi fad si, si re si
  r si re si r si re si
  r si mi fad si, si re si

  %16
  r si re si r si re si
  r si re si r si re si
  r si' lad fad si si, re si

  %19
  r re' si fad r re' si fad\mbreak
  r fad si si, r mi' sol, mi
  r dod' la mi r dod' la mi

  %22
  r mi la la, r re' fad, re
  r si' sol re r si' sol re
  r re sol re dod la re si

  %25
  mi dod fad[re]\mbreak sol mi la sol
  fad re la' la, re mi fad red
  sol mi fad red mi fad sol mi

  %28
  la la, si' si, sol' mi si' si,
  mi mi sol mi r mi sol mi
  r mi red si r mi sol mi\mbreak

  %31
  r mi sol mi r mi sol mi
  r mi red si r mi sol mi
  sold4. sold8 la4. la8

  %34
  re,4. re8 sol4. sol8
  do,?4. do8 fad4. fad8
  si,4. si8 mi mi sol mi\mbreak

  %37
  r mi sol mi r mi la, si
  mi, mi' sol mi r mi sol mi
  r mi sol mi r mi la, si

  %40
  mi,4 r si' r
  mi r si r
  mi r la, r\mbreak

  %43
  re r sol, r
  do r la2
  si red

  %46
  mi8 mi sol mi r mi sol mi
  si dod re si r2
  R1*5

  %53
  sol8 sol' si sol r sol, si sol\mbreak
  r sol' fad re r sol si sol
  r sol, si sol r sol' si sol

  %56
  r la si sol re do si la
  sol sol' si sol r sol, si sol
  r sol' fad re r sol si sol

  %59
  r sol, si sol r sol' si sol
  r la si sol\mbreak re do? si la
  sol sol' si sol r sol, si sol  %%% inizio p.7

  %62  OOOOOOO KKKKKKK
  r sol' fad re sol sol, si sol
  r sol' si sol r sol, si sol
  r sol' fad re sol sol,16 sol sol8\noBeam r

  %65
  r re'16 re re8\noBeam r r sol,16 sol sol8\noBeam r
  r re'16 re re8\noBeam r r sol,16 sol sol8\noBeam r
  r re'16 re re8\noBeam r r sol,16 sol sol8\noBeam r

  %68
  r re'16[mi fad8 re] mi fa mi re
  do si do la re mi re do
  si la si sol sol' fad sol mi

  %71
  la sol la la, si' la si si,
  mi fad sol re dod? fad lad fad\mbreak
  si,2_\markup\italic"Tasto Solo"~\parenthesize si~

  %74
  si1~
  si2~si4 lad
  si8 si re si r si re si

  %77
  r si fad' fad, r si re si
  r si re si r si re si
  r fad' si si,\mbreak fad' sol fad mi

  %80
  red si dod red mi fad sol mi
  dod la si dod re? mi fad re
  dod fad lad, fad' si, dod re dod

  %83
  si si re si r si re si
  r si re si r si re si
  r mi mi' mi, r mi mi' mi,\mbreak

  %86
  r fad fad' fad, r fad fad' fad,
  si,4 mi fad fad,
  si8 si re si red4. red8

  %89
  mi4. mi8 la,4. la8
  re4. re8 sol,4. sol8
  dod4. dod8 fad,4. fad8\mbreak

  %92
  si8 si re si r si re si
  r si mi fad si, si re si
  r si re si r si re si

  %95
  r si mi fad si,2\fermata

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s1
  s4 <7 _+> s2
  s1
  s8 <6+> <6>4 s2
  s1
  s4 <7 _+> s2
  s s8 <6+> <6>4
  s1*18
  s2 s4 s8 <7->
  s1
  <_->4 <_+> s2
  s1*13
  <7 _+>1
  <7->
  s2 <6>
  <_+> s
  s1*8
  s4 s8 <7-> s2
  s1*3
  s4 s8 <7-> s2
  s1*8
  s8 <7-> s4 s2
  s <7 _+>
  s <7->
  s <6>
  <6 _-> <_+>4 s8 <7>
  s2 <6+>8 <_+> s4
  s1*13
  s8 <_+> s4 s2
  s4 <6-> <_+>2


}

forma = {

  \key si\minor
  \time 4/4
  \tempo 2 = 47
  \partial 8 s8
  s1*95
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


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIvln = \relative do'' {

  R2.*4
  si4 re fad
  si~si8. [si16 dod8. re16]

  %7
  dod4 fad,8. [la16 si8. dod16]
  si4 mi,8.[sol16 lad8. si16]
  lad4 si8[la?16(sol) fad(mi) re(dod)]

  %10
  re4~re16 si(re fad si8) re\mbreak
  dod4~dod8[si16(la sol fad la dod)]
  si4~si8 la16(sol fad mi sol si)

  %13
  la4~la8 \once\slurDashed sol16 (fad mi re fad la)
  sol4~sol8[fad16(mi re dod mi sol)]
  fad4. la8 fad do

  %16
  si4. si'8 sol mi
  dod?4. la'8 si dod
  re re, mi4. re8

  %19
  re2.\mbreak
  si4 red fad
  sol4. si8[sol fad16 mi]

  %22
  fad4. si8(fad re)
  mi4. la8(do mi,)
  red dod?16 si fad'8 mi16 red la'8 sol16 fad

  %25
  sol2.
  dod,4 sold' si
  la4. fad8 la re

  %28
  re4~re16 dod(si la sold8) dod
  dod4~dod16 si la sold fad8 si\mbreak
  si4~si8 dod, mid si'

  %31
  la sold16 fad sold4. fad8
  fad2 r4
  si, re sol?~

  %34
  sol8 dod4 sol4 fad8~
  fad si4 fad mi8~
  mi lad4 mi dod8

  %37
  re4~re8 si re fad
  sol4~sol8 mi sol si\mbreak
  lad4. sol?8 fad mi

  %40
  re si' dod,4. si8
  si2.
  R2.*4

}

IIvlIn =  \relative do'' {

  r8 fad,\p fad re' re sol,
  sol fad fad dod' dod fad,
  fad mi mi si' si mi,

  %4
  mi dod' re, si' dod, lad'
  si4 r r
  r8 fad_\markup\italic\bold"pp sempre" fad re' re sol,

  %7
  sol fad fad dod' dod fad,
  fad mi mi si' si mi,
  mi dod' re, si' dod, lad'

  %10
  si fad fad re' re sol,\mbreak
  sol fad fad dod' dod fad,
  fad mi mi si' si mi,

  %13
  mi re re la' la re,
  re dod dod la' la dod
  la fad fad re' re la

  %16
  si sol sol mi' mi si
  dod la la dod re mi
  fad fad, mi la la mi

  %19
  fad re re re' re la\mbreak
  fad fad fad si si fad
  mi si' si sol' sol do,

  %22
  do? si si fad' fad si,
  si la la mi' mi la,
  la fad fad si si red

  %25
  si sol sol si si sol
  sold dod dod mid mid dod
  dod la la dod re re

  %28
  si sold sold dod dod sold
  la fad fad si si fad\mbreak
  sold mid mid dod' dod sold

  %31
  fad fad fad dod' dod mid,
  fad dod' dod fad fad dod
  si fad fad si si re

  %34
  dod sol sol dod dod la
  si fad fad si si sol
  la mi mi la la fad

  %37
  fad re re si' si re
  si sol sol si si mi\mbreak
  mi fad,fad dod' dod lad

  %40
  si fad fad si si lad
  si fad fad re' re sol,
  sol fad fad dod' dod fad,

  %43
  fad mi mi dod' dod mi,
  mi dod' \parenthesize re, si' dod, lad'
  si2.\fermata

}

IIvlIIn = \relative do'' {

  r8 re,\p re si' si re,
  mi dod dod la' la dod,
  re si si sol' sol si,

  %4
  dod lad' fad[re' fad, dod']
  si4 r r
  r8 re,_\markup\italic\bold"pp sempre" re si' si re,

  %7
  mi dod dod la' la dod,
  re si si sol' sol si,
  dod lad' fad[re' fad, dod']

  %10
  si re, re si' fad re\mbreak
  mi dod dod la' la dod,
  re si si sol' sol si,

  %13
  dod la la fad' fad la,
  si sol sol mi' mi mi
  fad re re la' la fad

  %16
  re si si si' si[sol]
  mi dod dod mi mi mi
  la re, re re re dod

  %19
  re la la la' la fad\mbreak
  red si si fad' fad red
  si sol' sol mi' mi sol,

  %22
  fad fad re?[re' re fad,]
  mi[mi] do do' do mi,
  fad red red fad fad si

  %25
  sol mi mi sol sol sol
  mid sold sold dod dod sold
  la fad fad la la la

  %28
  sold[sold] mi? sold sold mi
  fad[fad] re fad fad re\mbreak
  mid mid dod sold' sold mid

  %31
  dod dod dod la' sold sold
  la la la dod dod lad
  fad re re fad sol? sol

  %34
  sol mi mi mi mi fad
  fad re re re re mi
  mi dod dod dod dod fad

  %37
  re si si fad' fad si
  sol mi mi sol si si\mbreak
  lad dod dod lad lad fad

  %40
  fad[re] dod fad fad fad
  re re re si' si re,
  mi dod dod la' la dod,

  %43
  re si si sol' sol si,
  dod lad' fad re' fad, dod'
  si2.\fermata

}

IIvlan = \relative do'{

  r8 si\p si fad' fad si,
  dod[dod] la fad' fad la,
  si[si] sol mi' mi si

  %4
  lad[fad'] re[fad] lad, fad'
  fad4 r r
  r8 si,_\markup\italic\bold"pp sempre" si fad' fad si,

  %7
  dod dod la fad' fad la,
  si[si] sol mi' mi si
  lad fad' re fad lad, fad'

  %10
  fad si, si fad' fad[si,]\mbreak
  dod[dod] la fad' fad la,
  si[si] sol mi' mi sol,

  %13
  la[la] fad re' re fad,
  sol[sol] mi dod' dod dod
  re la la fad' fad re

  %16
  re re re sol sol mi
  mi mi mi mi re dod
  la la la la la la

  %19
  la fad fad fad' fad re\mbreak
  si si si red red si
  sol mi' mi si si sol

  %22
  la si si si fad fad
  sol la la la mi mi
  red' red si si si si

  %25
  si si si mi mi si
  dod mid mid sold sold sold
  dod, dod dod fad fad fad

  %28
  si, si si mi mi mi
  la, la la re re re\mbreak
  sold, sold sold dod dod dod

  %31
  dod dod dod dod dod dod
  dod fad fad la lad fad
  re si si re re re

  %34
  mi dod dod dod dod dod
  re si si si si si
  dod lad lad lad lad lad

  %37
  si si si re re re
  mi si si mi mi sol\mbreak
  fad lad, lad fad' fad dod

  %40
  re si lad fad' dod dod
  re si si fad' fad si,
  dod dod la fad' fad la,

  %43
  si si sol mi' mi si
  lad fad' re fad lad, fad'
  re2.\fermata

}

IIbcn = \relative do {

  si8\p si si si si si
  lad lad la la la la
  sold sold sol sol sol sol

  %4
  fad fad si si fad' fad,
  si4 r r
  si8_\markup\italic\bold"pp sempre" si si si si si

  %7
  lad lad la la la la
  sold sold sol sol sol sol
  fad fad si si fad' fad,

  %10
  si si si si si si\mbreak
  lad lad la la la la
  sold sold sol sol sol sol

  %13
  fad fad fad fad fad fad
  mi mi la la la la
  re re re re re re

  %16
  sol, sol sol sol sol sol
  la la la la sol sol
  fad re la' la la la

  %19
  re re re re re re\mbreak
  red red red red red red
  mi mi mi mi mi mi

  %22
  red red re re re re
  dod! dod do do do do
  si si si si si si

  %25
  mi  mi mi mi mi mi
  mid mid mid mid mid mid
  fad fad fad fad fad fad

  %28
  mid mid mi mi mi mi
  red red re re re re\mbreak
  dod dod dod dod dod dod

  %31
  fad fad dod [dod dod, dod]
  fad fad' fad fad lad, lad
  si si si si si si

  %34
  lad lad lad lad la la
  sold sold sol sol sol sol
  fad fad fad fad fad fad

  %37
  si si si si si si
  mi mi mi mi mi mi\mbreak
  fad fad fad fad fad fad

  %40
  si, si fad'[fad fad, fad]
  si si si si si si
  lad lad la la la la

  %43
  sold sold sol sol sol sol
  fad fad si si fad' fad,
  si2.\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 s8 <6>
  <7> <6> s2
  <7>8 <6> s2
  <7 _+>2.
  s
  s2 s8 <6>
  <7> <6> s2
  <7>8 <6> s2
  <7 _+>2.
  s2.
  <7>8 <6> s2
  <7>8 <6> s2
  <7>8 <6> s2
  <7>8 <6> <7>2
  s2 s8 <7->
  s2.*5
  s2 s8 <6->
  <7-> <6> s2
  <7>8 <6> s2
  <7 _+>2.
  s2.*2
  s2 s8 <6>
  <7>4. <6>
  <7 > <6>
  <7 _+>2.
  s4 <_+>2
  s2.
  s
  <7>2 s8 <6>
  <7>2 s8 <6>
  <7 _+>2.
  s
  s
  <7 _+>
  s2 <5 4>8 <3+>
  s2.
  <7>8 <6> s2
  <7>8 <6> s2
  <7>2 <_+>4

}

forma = {

  \key si\minor
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 45
  s2.*45
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


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIIvln = \relative do'' {

  si8 fad si re si re fad re fad
  si4 r8 fad4 r8 re4 r8
  si fad si re si re fad re fad

  %4
  si4 r8 fad4 r8 re4 r8
  lad fad lad dod lad dod mi dod mi
  lad4 r8 mi4 r8 dod4 r8

  %7
  si fad si red si red fad red fad
  la?4 r8 fad4 r8 red4 r8\mbreak
  si8 sol si mi si mi sol mi sol

  %10
  si4 r8 sol4 r8 si,4 r8
  la mi la dod la dod mi dod mi
  sol4 r8 mi4 r8 dod4 r8

  %13
  la fad la re la re fad re fad
  la4 r8 fad4 r8 la,4 r8
  sol re sol si sol si re si re

  %16
  sol4 r8 re4 r8 si4 r8\mbreak
  lad fad lad dod lad dod fad dod fad
  re4 r8 r4. r

  %19
  r4 si8 si(dod) si si(dod) si
  \senza \tuplet 6/9 {sol'2.~}
  sol4 fad8 fad(sol) fad mi(fad) mi

  %22
  re si la sol fad mi re dod si
  fad'4 mi'8 sol(fad) mi sol(fad) mi
  re si la sol fad mi re dod si

  %25
  fad'4 mi'8 sol fad mi sol fad mi\mbreak   %% fine p.13
  re si la sol fad mi fad4 fad8
  si,4 si'8 re16(dod si8) re fad16(mi re8) fad

  %28
  si fad re si fad re si re fad
  si4 si8 re16(dod si8) re fad16(mi re8) fad
  si fad re si fad re si re fad

  %31
  si re16(dod si8) fad' re16(dod si8) fad' re16(dod si8)
  si' re,16(dod si8) fad' re16(dod si8) si' re,16(dod si8)
  mi, sol16(fad mi8) si' sol16(fad mi8) si' sol16(fad mi8)\mbreak

  %34
  mi' sol,16(fad mi8)  si' sol16(fad mi8) mi' sol,16(fad mi8)
  la dod16(si la8) mi' dod16(si la8) mi' dod16(si la8)
  la' dod,16(si la8) mi' dod16(si la8) la' dod,16(si la8)

  %37
  re \once\slurDashed fad16 (mi re8) la' fad16(mi re8) la' fad16(mi re8)
  re' fad,16(mi re8) la' fad16(mi re8) re' fad,16(mi re8)
  sol, si16(la sol8) re' si16(la sol8) re' si16(la sol8)

  %40
  sol' si,16(la sol8) re' si16(la sol8) sol' si,16(la sol8)
  mi' sold16(fad mi8) si' sold16(fad mi8) si' sold16(fad mi8)\mbreak
  mi' sold,16(fad mi8) si' sold16(fad mi8) mi' sold,16(fad mi8)

  %43
  la, dod16(si la8) mi' dod16(si la8) mi' dod16(si la8)
  la' dod,16(si la8) mi' dod16(si la8) la' dod,16(si la8)
  fad' la16(sol? fad mi) re8 fad16(mi re dod) si8 re16(dod si la)

  %46
  sol8 si16(la sol fad) mi8 sol16(fad mi re) dod8 mi16(re dod si)
  la4. r8 mi''(fad sol fad mi)
  la(fad re) \tuplet 4/6{mi4. re8}\mbreak

  %49
  re la re fad re fad la fad la
  re4 r8 la4 r8 fad4 r8
  la, mi la dod la dod mi dod mi

  %52
  la4 r8 mi4 r8 dod4 r8
  lad fad lad dod lad dod mi dod mi
  lad4 r8 mi4 r8 dod4 r8\mbreak

  %55
  si fad si re si re fad re fad
  si4 r8 fad4 r8 re4 r8
  mid dod mid sold mid sold si sold si

  %58
  re4 r8 si4 r8 sold4 r8
  la fad mi? re dod si la sold fad
  dod'4 sold'8 si (la) sold si(la) sold

  %61
  la fad mi re dod si la sold fad
  dod'4 sold'8 si(la) sold si(la) sold\mbreak
  la fad mi re dod si dod4 dod,8

  %64
  fad4 fad'8 la (fad) dod la'(fad) dod
  sold' mid dod sold' mid dod sold' mid dod
  si' mid, dod si' mid, dod si' mid, dod

  %67
  la' fad dod  la' fad dod  la' fad dod
  lad' fad dod lad' fad dod lad' fad dod
  si' fad re si' fad re si' fad re

  %70
  sid' fad red sid' fad red sid' fad red\mbreak
  dod' sold mi? dod' sold mi dod' sold mi
  dod' sold mid dod' sold mid dod' sold mid

  %73
  si'? mid, dod si' mid, dod si' mid, dod
  la' fad dod la' fad dod la' fad dod
  lad' mi dod lad' mi dod lad' mi dod

  %76
  si' re, si si' re, si si' re, si
  sold' re si sold' re si sold' re si
  la' dod, la la' dod, la la' dod, la

  %79
  fad' do la fad' do la fad' do la\mbreak
  sol' re si sol' re si sol' re si
  dod sold mid dod' sold mid dod' sold mid

  %82
  dod' la fad dod' la fad dod' la fad
  re' la fad re' la fad re' la fad
  re' sold, mi re' sold, mi re' sold, mi

  %85
  dod' la mi dod' la mi dod' la mi
  la' mi dod la' mi dod la' mi dod
  la' red, si la' red, si la' red, si

  %88
  sol' mi si sol' mi si sol' mi si
  la' red, si la' red, si la' red, si\mbreak
  sol' mi si sol' mi si sol' mi si

  %91
  mi si sol mi' si sol mi' si sol
  mi' si fad mi' si fad mi' si fad
  red' si fad red' si fad red' si fad

  %94
  sol mi sol si sol si mi si mi
  si'4 r8 sol4 r8 mi4 r8
  si fad si red si red fad red fad

  %97
  si4 r8 fad4 r8 red4 r8
  mi mi re? do si la sol fad mi\mbreak
  si'4 fad'8 la(sol) fad la(sol) fad

  %100
  sol mi re do si la sol fad mi
  si'4 fad'8 la sol fad la sol fad
  sol mi re do si la si4 si,8

  %103
  mi sol16(fad mi8) si' red16(dod si8) mi sol16(fad mi8)
  re?4 si8 re16(dod si8) re fad16(mi re8) fad
  si fad re si fad re si re fad

  %106
  si4 si8 re16(dod si8) re fad16(mi re8) fad
  si fad re si fad re si re fad\mbreak
  si si la sol fad mi re dod si

  %109
  fad' lad dod fad, lad dod fad, lad dod
  fad, si re fad, si re fad, si re
  fad, dod' mi fad, dod' mi fad, dod' mi

  %112
  fad, si re fad, si re fad, si re
  lad fad lad dod lad dod mi dod mi
  re si re fad re fad si dod re

  %115
  mi, lad dod mi, lad dod mi, lad dod
  re, fad si re, fad si re, fad si\mbreak
  mi, lad dod mi, lad dod mi, lad dod

  %118
  re, fad si re, fad si re, fad si
  dod, fad si dod, fad si dod, fad si
  dod, fad lad dod, fad lad dod, fad lad

  %121
  si4. r r
  r8 r si, si dod si si dod si
  \tuplet 6/9 {sol'2.~}

  %124
  sol4 fad8 \slurDashed fad(sol) fad mi(fad) mi\slurSolid
  re si la sol fad mi re dod si
  fad'4 mi'8 sol(fad) mi sol(fad) mi

  %127
  re si la sol fad mi re dod si
  fad'4 mi'8 sol (fad) mi sol (fad) mi
  re si la sol fad mi fad4 fad8

  %130
  \tuplet 6/9 {si,2.\fermata}

}

IIIvlIn =  \relative do'' {

  si8 fad si re si re fad re fad
  si4 r8 fad4 r8 re4 r8
  si fad si re si re fad re fad

  %4
  si4 r8 fad4 r8 re4 r8
  lad fad lad dod lad dod mi dod mi
  lad4 r8 mi4 r8 dod4 r8

  %7
  si fad si red si red fad red fad
  la?4 r8 fad4 r8 red4 r8\mbreak
  si8 sol si mi si mi sol mi sol

  %10
  si4 r8 sol4 r8 si,4 r8
  la mi la dod la dod mi dod mi
  sol4 r8 mi4 r8 dod4 r8

  %13
  la fad la re la re fad re fad
  la4 r8 fad4 r8 la,4 r8
  sol re sol si sol si re si re

  %16
  sol4 r8 re4 r8 si4 r8\mbreak
  lad fad lad dod lad dod fad dod fad
  re4 r8 r4. r

  %19
  r4 si8 si(dod) si si(dod) si
  \senza \tuplet 6/9 {sol'2.~}
  sol4 fad8 fad(sol) fad mi(fad) mi

  %22
  re si la sol fad mi re dod si
  fad'4 mi'8 sol(fad) mi sol(fad) mi
  re si la sol fad mi re dod si

  %25
  fad'4 mi'8 sol fad mi sol fad mi\mbreak   %% fine p.13
  re si la sol fad mi fad4 fad8
  si,4. r r
  R1*9/8*21

  %49
  re'8 la re fad re fad la fad la
  re4 r8 la4 r8 fad4 r8
  la, mi la dod la dod mi dod mi

  %52
  la4 r8 mi4 r8 dod4 r8
  lad fad lad dod lad dod mi dod mi
  lad4 r8 mi4 r8 dod4 r8\mbreak

  %55
  si fad si re si re fad re fad
  si4 r8 fad4 r8 re4 r8
  mid dod mid sold mid sold si sold si

  %58
  re4 r8 si4 r8 sold4 r8
  la fad mi? re dod si la sold fad
  dod'4 sold'8 si (la) sold si(la) sold

  %61
  la fad mi re dod si la sold fad
  dod'4 sold'8 si(la) sold si(la) sold\mbreak
  la fad mi re dod si dod4 dod,8

  %64
  fad4. r r
  R1*9/8*29

  %94
  sol8 mi sol si sol si mi si mi
  si'4 r8 sol4 r8 mi4 r8
  si fad si red si red fad red fad

  %97
  si4 r8 fad4 r8 red4 r8
  mi mi re? do si la sol fad mi\mbreak
  si'4 fad'8 la(sol) fad la(sol) fad

  %100
  sol mi re do si la sol fad mi
  si'4 fad'8 la sol fad la sol fad
  sol mi re do si la si4 si,8

  %103
  mi4. r r
  R1*9/8*4
  r8 si' la sol fad mi re dod si

  %109
  fad'4. r r
  R1*9/8*12
  r8 r  si si dod si si dod si
  \tuplet 6/9 {sol'2.~}

  %124
  sol4 fad8 \slurDashed fad(sol) fad mi(fad) mi\slurSolid
  re si la sol fad mi re dod si
  fad'4 mi'8 sol(fad) mi sol(fad) mi

  %127
  re si la sol fad mi re dod si
  fad'4 mi'8 sol (fad) mi sol (fad) mi
  re si la sol fad mi fad4 fad8

  %130
  \tuplet 6/9 {si,2.\fermata}

}

IIIvlIIn = \relative do'' {

  R1*9/8
  si8 fad si re si re fad re fad
  si4 r8 fad4 r8 re4 r8

  %4
  si fad si re si re fad re fad
  lad4 r8 mi4 r8 dod4 r8
  lad fad lad dod lad dod mi dod mi

  %7
  si'4 r8 fad4 r8 red4 r8
  si fad si red si red fad red fad\mbreak
  si4 r8 sol4 r8 mi4 r8

  %10
  si sol si mi si mi sol mi sol
  la4 r8 mi4 r8 dod4 r8
  la mi la dod la dod mi dod mi

  %13
  la4 r8 fad4 r8 re4 r8
  la fad la re la re fad re fad
  sol4 r8 re4 r8 si4 r8

  %16
  sol re sol si sol si re si re\mbreak
  dod lad dod mi dod mi lad fad lad
  si4 si,8 si(dod) si si(dod) si

  %19
  \senza\tuplet6/9{fad'2.~}
  fad4 mi8 mi(fad) mi mi(fad) mi
  \tuplet6/9{lad2.}

  %22
  si8 si, la? sol fad mi re dod si
  fad'4 dod'8 mi(re) dod mi(re) dod
  re si la sol fad mi re dod si

  %25
  fad'4 mi'8 sol fad mi sol fad mi \mbreak
  si si la sol fad mi fad4 fad8
  si,4. r r

  %28
  R1*9/8*22
  re'8 la re fad re fad la fad la
  la4 r8 mi4 r8 dod4 r8

  %52
  la mi la dod la dod mi dod mi
  lad4 r8 mi4 r8 dod4 r8
  lad fad lad dod lad dod mi dod mi\mbreak

  %55
  si'4 r8 fad4 r8 re4 r8
  si fad si re si re fad re fad
  re'4 r8 si4 r8 sold4 r8

  %58
  mid dod mid sold mid sold si sold si
  la fad mi? re dod si la sold fad
  dod'4 mid8 sold(fad) mid sold(fad) mid

  %61
  fad fad mi? re dod si la sold fad
  dod'4 mid8 \slurDashed sold (fad) mid sold (fad) mid\slurSolid \mbreak
  fad fad mi? re dod si dod4 dod,8

  %64
  fad4. r r
  R1*9/8*30
  sol8 mi sol si sol si mi si mi

  %96
  si'4 r8 fad4 r8 red4 r8
  si fad si red si red fad red fad
  sol mi re? do si la sol fad mi\mbreak

  %99
  si'4 red8 fad(mi) red fad(mi) red
  mi mi re? do si la sol fad mi
  si'4 red?8 fad mi red! fad mi red

  %102
  mi mi re? do si la si4 si,8
  mi4. r r
  R1*9/8*4\mbreak

  %108
  r8 si' la sol fad mi re dod si
  fad'4. r r
  R1*9/8*11

  %121
  r8 r si si dod si si dod si
  \tuplet6/9{fad'2.~}
  fad4 mi8 mi fad mi mi fad mi

  %124
  \tuplet6/9{lad2.}\mbreak
  si8 si, la? sol fad mi re dod si
  fad'4 dod'8 mi(re) dod mi(re) dod

  %127
  si si la sol fad mi re dod si
  fad'4 dod'8 mi(re) dod mi(re) dod
  si si la sol fad mi fad4 fad8

  %130
  \tuplet6/9{si,2.\fermata}

}

IIIvlan = \relative do'{

  re4. re re
  re re re
  re re re

  %4
  re re re
  dod dod dod
  dod dod dod

  %7
  fad fad fad
  fad fad fad\mbreak
  sol sol sol

  %10
  sol sol sol
  mi mi mi
  mi mi mi

  %13
  fad fad fad
  fad fad fad
  re re re

  %16
  re re re\mbreak
  fad fad fad
  fad re re

  %19
  re re re
  si si mi
  dod dod fad

  %22
  fad8 si la sol fad mi re dod si
  fad'4. r r
  r8 si la sol fad mi re dod si

  %25
  fad'4. r r\mbreak
  r8 si la sol fad mi fad4 fad,8
  si4. r r

  %28
  R1*9/8*21
  fad'4. fad fad
  fad fad fad

  %51
  mi mi mi
  mi mi mi
  dod lad lad

  %54
  lad? lad lad\mbreak
  re re re
  re re re

  %57
  sold sold sold
  sold? sold sold
  dod,8 fad mi re dod si la' sold fad

  %60
  dod'4. r r
  r8 fad, mi re dod si la' sold fad
  dod'4. r r\mbreak

  %63
  r8 fad, mi re dod si dod4 dod8
  fad4. r r
  R1*9/8*29

  %94
  sol4. sol sol
  sol sol sol
  fad fad fad

  %97
  fad fad fad
  mi8 mi' re do si la sol fad mi\mbreak
  si'4. r r

  %100
  r8 mi re do si la sol fad mi
  si'4. r r
  r8 mi re do si la si4 si,8

  %103
  mi4. r r
  R1*9/8*4
  r8 si' la sol fad mi re dod si

  %109
  fad'4. r r
  R1*9/8*11
  re4. re re

  %122
  re re re
  si si mi
  dod dod fad\mbreak

  %125
  si,8 si' la sol fad mi re dod si
  fad'4. r r
  r8 si la sol fad mi re dod si

  %128
  fad'4. r r
  r8 si la sol fad mi fad4 fad,8
  \senza\tuplet 6/9{si2.\fermata}

}

IIIbcn = \relative do {

  si8 si' si, si4. si
  si8 si' si, si4. si
  si8 si' si, si4. si

  %4
  si8 si' si, si4. si
  fad8 fad' fad, fad4. fad
  fad8 fad' fad, fad4. fad

  %7
  red'8 red' red, red4. red
  red8 red' red, red4. red\mbreak
  mi8 mi' mi, mi4. mi

  %10
  mi8 mi' mi, mi4. mi
  dod8 dod' dod, dod4. dod
  dod8 dod' dod, dod4. dod

  %13
  re8 re' re, re4. re
  re8 re' re, re4. re
  si8 si' si, si4. si

  %16
  si8 si' si, si4. si\mbreak
  fad8 fad' fad, fad4. fad
  si si si

  %19
  si si si
  mi mi mi
  fad fad fad

  %22
  si,8 si' la sol fad mi re dod si
  fad'4. r r
  r8 si la sol fad mi re dod si

  %25
  fad'4. r r\mbreak
  r8 si la sol fad mi fad4 fad,8
  si4. r r

  %28
  si si si
  si r r
  si si si

  %31
  si si si
  si si si
  mi mi mi

  %34
  mi mi mi
  la la, la
  la la la

  %37
  re re re
  re re re
  sol sol sol

  %40
  sol sol sol
  mi mi mi\mbreak
  mi mi mi

  %43
  la la la
  la la la
  re r r

  %46
  R1*9/8
  la,4. r r
  re la' la,\mbreak

  %49
  re8 re' re, re4. re
  re8 re' re, re4. re
  dod8 dod' dod, dod4. dod

  %52
  dod8 dod' dod, dod4. dod
  fad,8 fad' fad, fad4. fad
  fad8 fad' fad, fad4. fad\mbreak

  %55
  si8 si' si, si4. si
  si8 si' si, si4. si
  mid,8 mid' mid, mid4. mid

  %58
  mid?8 mid' mid, mid4. mid
  fad8\clef tenor fad'' mi? re dod si la sold fad
  dod'4. r r

  %61
  r8 fad mi re dod si la sold fad
  dod'4. r r\mbreak
  r8 fad mi re dod si dod4 \clef bass dod,8

  %64
  fad4. fad fad
  dod dod dod
  dod dod dod

  %67
  fad fad fad
  mi mi mi
  re re re

  %70
  sold sold fad\mbreak
  mi mi mi
  mid mid mid

  %73
  dod dod dod
  fad fad fad
  mi? mi mi

  %76
  re re re
  re re re
  dod dod dod

  %79
  do do do\mbreak
  si si si
  mid mid mid

  %82
  fad fad fad
  fad fad fad
  mi? mi mi

  %85
  la, la la
  dod dod dod
  red red red

  %88
  mi mi mi
  red red red\mbreak
  mi mi mi

  %91
  mi mi mi
  si' si si
  si, si si

  %94
  mi8 mi' mi, mi4. mi
  mi8 mi' mi, mi4. mi
  red8 red' red, red4. red

  %97
  red8 red' red, si4. si
  mi8  mi' re do si la sol fad mi\mbreak
  si'4. r r

  %100
  r8 mi re do si la sol fad mi
  si'4. r r
  r8 mi re do si la si4 si,8

  %103
  mi4. r r
  si r r
  si si si

  %106
  si r r
  si si si\mbreak
  si8 si' la sol fad mi re dod si

  %109
  fad'4. fad fad
  fad fad fad
  fad fad fad

  %112
  fad fad fad
  fad fad fad
  si, si si

  %115
  lad lad lad
  si si si\mbreak
  lad lad lad

  %118
  si si si
  fad' fad fad
  fad,fad fad

  %121
  si si si
  si si si
  mi mi mi

  %124
  fad fad fad\mbreak
  si,8 si' la sol fad mi re dod si
  fad'4. r r

  %127
  r8 si la sol fad mi re dod si
  fad'4. r r
  r8 si la sol fad mi fad4 fad,8

  %130
  \senza \tuplet9/6{si2.}

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1*9/8*4
  <_+>4. s s
  s1*9/8*9
  <6>4. s s
  s1*9/8
  <7>
  s
  s
  <9>4. <8> s
  <9 _+> <8> s
  s1*9/8
  <_+>
  s
  <_+>
  s1*9/8*31
  <7->4. s s
  s1*9/8
  s
  <_+>
  s
  <_+>
  s
  s
  <_+>
  <7>
  s
  <6 4+>
  s
  <_+>
  s
  s
  <7->
  s
  <6 4+>
  s
  <6 4+>
  s
  <6 4+>
  s
  <6>
  s
  s
  <7 _+>
  s
  s
  <6 5>
  s
  <6 5>
  s
  s
  <5 4>
  <3+>
  s1*9/8*5
  <_+>1*9/8
  s
  <_+>
  s1*9/8*7
  <_+>1*9/8
  <6 4>
  <7 5>
  <6 4>
  <5 3+>
  s
  <6 5>
  s
  <6 5>
  s <5 4>
  <3+>
  s
  s
  <9>4. <8> s
  <9 _+> <8> s

}

forma = {

  \key si\minor
  \time 9/8
  \tempo 2. = 75
  s4.*130*3
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


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

  \markup\huge "[1.] All[egr]o"

  \score {
    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"principale]"}
          \Ivl
        >>

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

      indent = 1.6\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        % \override SpacingSpanner.uniform-stretching = ##t
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

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvl
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIvla
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"cello"
          \IIbc

        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        % \override SpacingSpanner.uniform-stretching = ##t
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

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvl
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \IIIvlII
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
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        % \override SpacingSpanner.uniform-stretching = ##t
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



