\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = ^\markup\italic"tasto"

tr = \trill

pf = #(make-dynamic-script "pf")

piuf = _\markup\italic\bold "piùf"

pof = _\markup\italic\bold "pocof"

ten = ^\markup\italic"ten."

pizz = ^\markup\italic"pizzicato"

arco = ^\markup\italic"coll'arco"

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

pratubeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

pratubem = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.flat"
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

turnshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-4
    \center-column {\musicglyph #"scripts.turn"}}

beqturnshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-4
    \center-column {\musicglyph #"scripts.turn"}}


pradies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.sharp"
      \musicglyph #"scripts.prall"}}

turnbeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
      \musicglyph #"scripts.turn"}}

mordbeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
      \musicglyph #"scripts.mordent"}}

turndies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {\musicglyph #"scripts.turn"
	  \musicglyph #"accidentals.sharp"
      }}

turnbeqdies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1.5
    \center-column {
	 "♮♯"
      \musicglyph #"scripts.turn"}}

turnbem = ^\markup \override #'(baseline-skip . 1) {
    \halign #-2
    \center-column {
	  \musicglyph #"accidentals.flat"
      \musicglyph #"scripts.turn"}}

turnbemshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-2
    \center-column {
	  \musicglyph #"accidentals.flat"
      \musicglyph #"scripts.turn"}}

turnshift = ^\markup  {\halign #-2.5 \musicglyph #"scripts.turn"}

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



Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


Ivln = \relative do'' {

    sol,8. si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol

    %4
    re' re'32 dod re16 re re si la\prall sol\mbreak re'8\staccatissimo [re,\staccatissimo] r4
    r2 r8 r16. fa'32 mi16. re32 do!16. si32\mbreak
    do8\staccatissimo[r16. mi32] re16. do32 si16.\tr la32 si8\staccatissimo r r4

    %7
    r16 si32 [sol re'16. fa,32] mi16. mi'32 re[do si la] sol4 (fad!\pratu)
    <fad' la, re,>8\staccatissimo r r4 r2
    <la re, fad,>8\staccatissimo r r4 r2

    %10
    <<<re fad,>8\\\stemUp re,,_\staccatissimo>> r r4 r2
    R1
    re8. fad32 la re8\staccatissimo fad16. lad,32 si8\staccatissimo sol'\staccatissimo mi,4\p~

    %13
    mi8. mi16 mi8.\tr re32 mi \once\stemUp fad8\f\staccatissimo la'\staccatissimo do,,!8.\tr si32 la\mbreak
    si8\staccatissimo r r4 r2
    r r16 la'32[sold la16 la] la la, r8

    %16
    r2 r16 la'32[sold la16 la] la mi dod la
    la' la32 sold la16 la la fad mi\tr re la'8\staccatissimo la, \staccatissimo r4
    R1*5

    %23
    re'8\p(fad la ) re sold, re(si sold)
    R1
    re8.\f fad32 la re8\staccatissimo  fad16. lad,32 si8\staccatissimo sol'\staccatissimo mi,8.. dod'32

    %26
    dod8.\tr si32 dod \once\stemDown sol'8\staccatissimo mi,\staccatissimo  fad\staccatissimo la\staccatissimo  do,!8.\tr si32 la
    \parenthesize si16 sol'32 fad sol16 sol sol re si sol re' re'32 dod re16 re re la fad re\mbreak
    la' la32 sold la16 la la fad mi\tr re la'8\staccatissimo la,\staccatissimo r4

    %29
    r2 r8 r16. do''!32 si16. la32 sol16.\tr fad32
    sol8[r16. fa32] mi16. re32 do16.\tr si32 do8\staccatissimo r r4\mbreak
    mi8\p\staccatissimo sol\staccatissimo r fa\staccatissimo r mi\staccatissimo r re\staccatissimo

    %32
    do\staccatissimo dod\staccatissimo re\staccatissimo mi\staccatissimo fad!\staccatissimo fad\staccatissimo sol\staccatissimo la\staccatissimo
    si\staccatissimo mi,\staccatissimo red\staccatissimo[la'\staccatissimo] si,\staccatissimo sol'\staccatissimo r4
    r2 r16 si,32\f lad si16 si si si, r8

    %35
    r2 r16 si'32\f lad si16 si si fad red si
    si' si32 lad si16 si si sol fad\tr mi si'8 si, r4\mbreak
    R1*3

    %40
    r16 fa''32\f mi fa16 fa fa do la fa fa'8\staccatissimo r r4
    r16 fa32\f mi fa16 fa fa do la fa red2
    R1*2

    %44
    r2 r16 mi'32\f red mi16 mi mi si sol mi
    do' do32 si do16 do do sol mi do la' la32 sold la16 la  la mi do la
    <la'' dod, mi, la,>4 r16 sol,!32 fad sol16 sol sol mi dod la <dod'' mi, la,> 8 <dod mi, la,>\mbreak

    %47
    <<<dod mi,>\\{\stemUp\shiftOn la,\staccatissimo[ sol,\staccatissimo]}>> r4 r2
     R1
     r1\fermata

     %50
     sol8. \f si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol

    %53
    re' re'32 dod re16 re re si la\prall sol\mbreak re'8\staccatissimo re,\staccatissimo r4
    r2 r8 r16. fa'32 mi16. re32 do!16. si32\mbreak
    do8\staccatissimo[r16. mi32] re16. do32 si16.\tr la32 si8\staccatissimo r r4

    %56
    re8\p(si sol) fa' sol, mi'  r4
    mi8(dod la) sol' la, fad'! r4
    mi,8.\f sol32 si mi8\staccatissimo sol16. si,32 do8\staccatissimo r r4

    %59
    re,8. fad32 si re8\staccatissimo fad16. lad,32 si8\staccatissimo r r4\mbreak
    do,8. mi32 la do16.\staccatissimo [do,32] do16.\tr si64 la si8. re32 sol si16.\staccatissimo [si,32] si16.\tr la64 sol
    dod2\p r16 re'32\f dod re16 re re re, r8

    %62
    r2 r16 re'32 dod re16 re re la fad re
    re' re32 dod re16 re re si la\tr  sol re'8 re, r4
    R1*5

    %69
    re''8\p si(sol re) dod sol(mi dod)\mbreak
    R1
    sol8. si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32

    %72
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad sol16 sol sol re si sol
    re' re'32 dod re16 re  re la fa re la' la32 sold la16 la la mi do! la\mbreak

    %75
    mi' mi'32 red mi16 mi mi si sol mi
    sold'2.\p
    la4 r8 la,(mi' sol,!)

    %78
    fa(la4 sol8) sib4
    la4. re,8\f(fa la)
    si, mi\pp(sol fa) fa4~

    %81
    fa8 fa\f mi16 (re do si) si4\tr
    do8 sol'4\p sol8 mi4
    mi2(re4)

}

Imdn = \relative do'' {
    \senza

    sol,8. si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol

    %4
    re' re'32 dod re16 re re si la\prall sol\mbreak re'8\staccatissimo [re,\staccatissimo] r \stemUp \tuplet 3/2 { do''16 la do }
    si8^\staccatissimo mi,^\staccatissimo  r fad^\staccatissimo \grace la16 \tuplet 3/2 { sol fad sol } re16.[fa32]\f \stemNeutral mi16.\prall re32 do?16.\prall si32
    do16[mi'32 do] la16. mi32 re16.\prall do32 si16.\prall la32 si16[re'32 si] sol16 si32 sol re16[ sol32 re] si16 re32 si

    %7
    sol16 si32 sol re'16.[ fa,32]mi16. mi'32 re[do si la] sol4 (fad!\pratu)\mbreak
    \stemUp r32 la si dod \stemNeutral re[mi fad sol] la si dod re dod si la sol fad si la sol fad mi  re dod re fad mi re dod si la sol
    fad mi re dod re mi fad sol la si dod re dod si la sol fad si la sol fad mi re  dod re fad  mi re dod si la sol\mbreak

    %10
    r la' si dod re mi fad sol la fad mi re si'[sol fad mi] dod' la sol fad re'[si la sol] mi' re dod si la sol fad mi
    fad re dod re mi fad sol la si dod si la sol fad mi re dod la' sol fad mi re dod si la dod mi re dod si  la sol\mbreak
    <fad re>8. fad32 la re8\staccatissimo fad16. lad,32 si8\staccatissimo sol'\staccatissimo r32 dod, si dod re dod si dod

    %13
    mi dod si dod re dod si dod sol' fad mi re dod si la sol\once\stemUp  fad8\staccatissimo la'\staccatissimo r4
    r16 \grace mi'32 re dod re16 re re32 mi re dod re si la sol fad16 \grace mi'32 re dod re16 re re32 mi re dod re la sol fad\mbreak
    mi fad mi red mi\staccatissimo [fad sol\staccatissimo sold] la\staccatissimo lad dod si la[sol fad mi] re?8(dod\pratu) r8 la,32 dod mi sol

    %16
    fad re mi fad sol la si dod re mi fad sol la fad mi re re8(dod\pratu) r16 mi, dod la
    la' la32 sold la16 la la fad mi\tr re la'8\staccatissimo la,\staccatissimo r4\mbreak
    \stemUp fad''16[la8 re, dod mi re fad mi sol,16]

    %19
    fad[la'8 re, dod mi16] re re'8 dod si lad16~
    lad si8 fad16 la?(sold8 si16)\stemNeutral red(mi dod sol)~sol fad8 la16~
    la re8 dod sib la sold re dod sol!16~

    %22
    sol fad8 dod16 re si' la32[sol fad mi] re8(mi\turn)re16 mi32\f fad sol la si dod
    re fad la re la fad re dod re fad la re la fad re dod re sold si re si sold re dod re sold si re si sold re dod
    re fad la re la fad re la' sol fad  mi re dod si la sol\mbreak fad la re dod si la sol fad mi re dod si s8

    %25
    r8. fad'32 la re8\staccatissimo  fad16. lad,32 si8\staccatissimo sol'\staccatissimo mi,8.. dod'32
    dod8.\tr si32 dod \once\stemDown sol'8\staccatissimo mi,\staccatissimo  fad\staccatissimo la\staccatissimo  do,!8.\tr si32 la
    si16 sol'32 fad sol16 sol sol re si sol re' re'32 dod re16 re re la fad re\mbreak

    %28 %%% fine pagina 23
    la' la32 sold la16 la la fad mi\tr re la'8\staccatissimo la,\staccatissimo s8 \stemUp \tuplet 3/2 { sol''16 mi sol }fad8^\staccatissimo si, r dod\staccatissimo \grace mi32 \tuplet 3/2 { re16 dod re }\stemNeutral la16.[do'!32\f] si16.\prall la32 sol16.\prall fad32
    sol16 re'32 si sol16.[fa32] mi16.\prall re32 do16. si32 do16 sol'32 mi do16[mi32 do] sol16 do32 sol mi16[sol32 mi]\mbreak

    %31
    \override Rest #'staff-position = #+3 r32 sol la si do re mi fa sol[mi re do] si re mi fa <<{mi s s s s si do re}\\{r32 mi, [fad! sold] la\noBeam}>> mi'[do si la] sold si do re
    do la si dod re mi fad! mi la[fad mi re] dod mi fad sol fad re  mi fad sol la si dod re[si la sol] fad la si do?
    si do si la si sol fad mi la sol fad mi red dod si la\mbreak sol sol' fad mi re! do! si do fad sol fad mi fad re do si

    %34
    mi do si la re[si la sol] do la do si la sol fad mi mi8(red\pratu) r8si32[red fad la]
    sol mi sol si mi[si dod red] mi fad sol la si sol fad mi mi8(red\pratu) si16 fad red si\mbreak
    si' si32 lad si16 si si sol fad\tr mi si'8 si, r4

    %37
    \stemUp sol''16 si8 mi, red fad mi sol fad la,16
    sol si'8 mi, red fad16 mi mi'8 re! do si16~
    si do8 si la sold la sol fa mi16

    %40
    \stemNeutral fa16 fa32 mi fa16 fa fa do la fa\mbreak r32do' re mi fa sol la sib do la sol fa mi sol la sib
    la16 fa32 mi fa16 fa fa do la fa r32 si! la sold la fad'! mi red la' sol fad do' si la sol fad
    sol16 mi'32 red mi16 mi mi si sol mi do' mi32 red mi16 mi mi do la mi\mbreak

    %43
    sol mi'32 red mi16 mi mi dod lad mi red32 mi fad sol la si do si la sol fad mi red dod si la
    sol si mi si re! do! si la sol8(fad\pratu) mi16 mi'32 red mi16 mi mi si sol mi
    do' do32 si do16 do do sol mi do la' la32 sold la16 la la mi do la\mbreak

    %46
    <dod' la mi>4^\staccatissimo r16 sol!32 fad sol16 sol sol mi dod sol <dod' la mi>8^\staccatissimo <la' mi dod>^\staccatissimo
    <dod la mi>4^\staccatissimo la32 dod, si dod re[dod si dod] mi re dod re fad mi re mi sol fad mi fad la sol fad sol
    si la sol la dod si la si re dod si dod mi re dod re fad! mi red mi re do si la sold la  do mi re do si la\mbreak

    %49
    sol!2 fad16\upprall\fermata mi32 fad mi16 re re4\fermata
    sol,,8. si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re

    %52
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol
    re' re'32 dod re16 re re si la\prall sol\mbreak re'8\staccatissimo re,\staccatissimo s8\stemUp  \tuplet 3/2 { do''16 la do }
    si8^\staccatissimo mi,^\staccatissimo  \override Rest #'staff-position = #+8 r fad^\staccatissimo \grace la16 \tuplet 3/2 { sol fad sol } re16.[fa32]\f \stemNeutral mi16.\prall re32 do16.\prall si32

    %55
    do16[mi'32 do] la16. mi32 re16.\prall do32 si16.\prall la32 si16[re'32 si] sol16 si32 sol re16[ sol32 re] si16 re32 si
    sol si la sol la[sol fad sol] mi' re do si sol'[fa mi re] fa mi re do la'[sol fa mi] sol fa mi re fa[mi re do]\mbreak
    \revert Rest #'staff-position r la sold la si[la sold la] fad'!mi re dod la'[ sol fad mi] sol fad mi re si'[la sol fad] la sol fad mi sol[fad mi re]

    %58
    sol8^\staccatissimo sol,^\staccatissimo r4 r32 mi' sol la do[la sol mi] la sol mi do sol'[mi do sol]
    fad'8\staccatissimo fad,\staccatissimo r4 r32 re' fad  si re [si fad re] si' fad re si fad'[re si fad]\mbreak
    mi'8\staccatissimo mi,\staccatissimo do'16. do,32 do16.\tr[si64 la] si8. re32 sol si8\staccatissimo si,\staccatissimo

    %61
    r32 sold' la si dod re mi fad sol! fad mi re dod si la sol sol8(fad\pratu) r8 re32 fad la do!
    si sol la si do re mi fad sol la si do re si la sol sol8(fad\pratu) re16 la fad re
    re' re32 dod re16 re re si la\tr sol re'8 re, r4\mbreak

    %64
    \stemUp si''16 re8 sol, fad la sol si la do,16
    si re8 sol, fad la16 sol sol'8 fad mi red16~
    red mi8 si16 re! dod8 mi16 sol(la fad) do~do si8 re16~

    %67
    re sol8 fa mib re dod sol fad do16~
    do si8\giu fa16 \once\stemUp mi\su \once\stemDown mi' \stemNeutral re32[do si la] sol8 la\turn sol16 la32\f si do re mi fad!\mbreak
    sol si re sol re si sol fad sol si re sol re si sol fad sol dod mi sol mi dod sol fad sol dod mi sol mi dod sol fad

    %70
    sol si re sol re sol si re dod si la sol fad mi re do si re sol fad mi re do si la[sol fad mi] re s s s
    \giu\stemUp sol,8.  \su si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    \stemNeutral fad8.\tr mi32 fad \once\stemDown do'8\staccatissimo la,\staccatissimo \once\stemUp si\staccatissimo[re'\staccatissimo] fa,8.\tr mi32 re

    %73
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol
    re' re'32 dod re16 re re la fa re la' la32 sold la16 la la mi do! la\mbreak
    mi' mi'32 red mi16 mi mi si sol mi

    %76
    r8 fad'!\p(mi re) do\pratu(re16 si)
    do8\turn mi16(sold, si8) la\prall~la[la]~
    la\turnbem fa'4 mi8(sol dod,)

    %79
    mi(re) re4\turnbeq r
    r8 dod re4~
    re8 re(mi re) do!16(si la) sol sol8 \tuplet 3/2 { fa16\prall(mi fa)}\mbreak

    %82
    mi8 mi'16\p(do) si\prall[(la)]la16. si32  la8[(sol\pratu)]
    \grace {fad16[la]} sol2(fad4)

}

Imsn = \relative do {

    sol8. si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol

    %4
    re' re'32 dod re16 re re si la\prall sol\mbreak re'8\staccatissimo [re,\staccatissimo] \su\stemDown r8 fad''\p
    sol4 do, si8_\staccatissimo \giu\stemNeutral  r16. la,32 sold16. mi32 fad16. sold32
    la8\staccatissimo r16. sol!32 fad16. re32mi16. fad32 sol8\staccatissimo r r4

    %7
    r16. sol,32 si16.[sol32] do4 re2\mbreak
    \su \once \stemDown <fad' re>4_\staccatissimo \giu r4  r2
    re,4\staccatissimo r r2\mbreak

    %10
    <<fad4\staccatissimo\\re>> fad8\staccatissimo sol\staccatissimo la\staccatissimo si\staccatissimo dod4
    re sol, la r16 la, si dod\mbreak
    re8. fad32 la re8\staccatissimo  fad16. lad,32 si8\staccatissimo sol'\staccatissimo mi,4~

    %13
    mi~mi fad8\staccatissimo la\staccatissimo do,!8.\tr si32 la
    si8 si' si si la la la la\mbreak %%%%fine p.22
    sol4~sol r16 la32 sold la16 la la la, dod8\noBeam

    %16
    re mi fad[re] la'16 la32 sold la16 la la mi dod la
    la' la32 sold la16 la la fad mi\tr re la'8\staccatissimo la,\staccatissimo r4\mbreak
    \su \stemDown re'8\p fad mi sol fad re dod la

    %19
    re fad mi sol fad mi re dod
    re red mi re dod \giu\once\stemUp  la \su re[do]
    \giu\stemNeutral sib la sol fa mi mi, la[la']\mbreak

    %22
    re, re, sol[sol'] la la, si4
    fad fad' si, si'
    la la,\mbreak re, s8 \once\stemUp la''32 \stemNeutral sol[fad mi]

    %25
    re8. fad32 la re8\staccatissimo  fad16. lad,32 si8\staccatissimo sol'\staccatissimo mi,8.. dod'32
    dod8.\tr si32 dod \once\stemDown sol'8\staccatissimo mi,\staccatissimo  fad\staccatissimo la\staccatissimo  do,!8.\tr si32 la
    si16 sol'32 fad sol16 sol sol re si sol re' re'32 dod re16 re re la fad re\mbreak

    %28
    la' la32 sold la16 la la fad mi\tr re la'8\staccatissimo la,\staccatissimo  \su r8 \stemDown dod''\p
    re4 sol,_\staccatissimo fad8_\staccatissimo  \giu\stemNeutral  r16. mi,32 re16. do32 si16. la32
    si8\staccatissimo r16. la'32 sol16. fa32 mi16. re32 mi8\staccatissimo r r4  %%%% fine p. 23

    %31
    \su\stemDown do'4 \giu r\stemNeutral s2
    r8 sol\staccatissimo fad\staccatissimo [mi\staccatissimo] re\staccatissimo  [do\staccatissimo] si\staccatissimo [la\staccatissimo]
    sol\staccatissimo sol'\staccatissimo fad4\mbreak mi4 re

    %34
    do8 si la4 si16 si'32 lad si16 si si si, red8
    mi4 sol8 mi si16 si'32 lad si16 si si fad red si\mbreak
    si' si32 lad si16 si si sol fad\tr mi si'8 si, r4

    %37
    \su\stemDown mi'8\p sol fad la sol mi red si
    mi sol fad la sol fad mi red
    mi re! do si do si\giu la sold

    %40
    \stemNeutral la16 fa'32^\f mi fa16 fa fa do la fa\mbreak fa'4\staccatissimo la,8 sol
    fa16 fa'32 mi fa16 fa fa do la fa red2
    mi8 sol sol[sol] la la la[la]\mbreak

    %43
    lad lad lad[lad] si si, r si
    mi la si[si,] mi16 mi'32 red mi16 mi mi si sol mi
    do' do32 si do16 do do sol mi do la' la32 sold la16 la la mi do la\mbreak

    %46
    sol!4\staccatissimo r16 sol'!32 fad sol16 sol sol mi dod sol sol'8\staccatissimo sol\staccatissimo
    sol\staccatissimo sol,\staccatissimo r sol' fad dod re[mi]
    fad sol la[si] dod4 dod,?\mbreak

    %49
    re1\fermata
    sol,8. si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re

    %52
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol
    re' re'32 dod re16 re re si la\prall sol\mbreak re'8 re, \su\stemDown  r8 fad''8\p
    sol4 do,_\staccatissimo si8_\staccatissimo\giu\stemNeutral  r16. la,32 sold16. mi32 fad!16. sold32

    %55
    la8\staccatissimo r16. sol!32 fad16. re32mi16. fad32 sol8\staccatissimo r r4
    si, si do\staccatissimo  r\mbreak
    dod2 re4\staccatissimo r

    %58
    mi8. sol32 si mi8\staccatissimo sol16. si,32 do4\staccatissimo  r
    re,8. fad32 si re8\staccatissimo fad16. lad,32 si4\staccatissimo r\mbreak
    do,8. mi32 la do16. do,32 do16.\tr[si64 la] si8. re32 sol si8\staccatissimo si,\staccatissimo

    %61
    dod2 r16 re'32 dod re16 re re re, fad8\noBeam
    sol la si sol re'16 re32 dod re16 re re la fad re
    re' re32 dod re16 re re si la\tr sol re'8 re, r4\mbreak

    %64
    \su\stemDown sol'8\p si la do si sol fad re
    sol\giu\stemUp si, la do\stemNeutral si la sol fad
    sol sold la sol fad re sol[fa]

    %67
    mib re do sib la la' re, re,
    sol, sol' \shiftOn do,[do'] re re,  mi4\mbreak
    si' si' mi, mi'

    %70
    re re, sol, r8 r32 do' si la\mbreak
    \stemDown sol8.  si,32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    \stemNeutral fad8.\tr mi32 fad \once\stemDown do'8\staccatissimo la,\staccatissimo \once\stemUp si\staccatissimo[re'\staccatissimo] fa,8.\tr mi32 re

    %73
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol
    re' re'32 dod re16 re re la fa re la' la32 sold la16 la la mi do! la\mbreak
    mi' mi'32 red mi16 mi mi si sol mi

    %76 OK
    \set Staff.connectArpeggios = ##t <<{<si' sold re>8\arpeggio}\\ \stemUp \shiftOn si, 2.\arpeggio>>
    la4 fa' dod
    re sib' mi,

    %79
    fa4. re8(fa la)
    si,4. \once\slurDashed si8^\pp (re fa)
    sol,2^\f sol'4\mbreak

    %82
    do, dod dod
    <<la'2.\\re,>>

}


Ibcn = \relative do {

    sol8. si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol

    %4
    re' re'32 dod re16 re re si la\prall sol\mbreak re'8\staccatissimo [re,\staccatissimo] r4
    r2 r8  r16. la'32 sold16. mi32 fad16. sold32
    la8\staccatissimo [r16. sol!32] fad16. re32mi16. fad32 sol8\staccatissimo r r4

    %7
    r16. sol,32 [si16. sol32] do4 re2
    re8\staccatissimo r r4 r2
    re8\staccatissimo r r4 r2

    %10
    re8\staccatissimo r r4 r2
    R1
    re8. fad32 la re8\staccatissimo  fad16. lad,32 si8\staccatissimo sol'\staccatissimo mi,4~

    %13
    mi8.~mi16 mi8.\tr re32 mi fad8\f\staccatissimo la\staccatissimo do,!8.\tr si32 la
    si8\staccatissimo r r4 r2
    r r16 la'32 sold la16 la la la, r8

    %16
    r2 r16 la'32 sold la16 la la mi dod la
    la'16 la32 sold la16 la la fad mi\tr re la'8\staccatissimo la,\staccatissimo r4
    R1*5

    %23
    fad2 si
    R1\mbreak
    re8. fad32 la re8\staccatissimo  fad16. lad,32 si8\staccatissimo sol'\staccatissimo mi,8.. dod'32

    %26
    dod8.\tr si32 dod \once\stemDown sol'8\staccatissimo mi,\staccatissimo  fad\staccatissimo la\staccatissimo  do,!8.\tr si32 la
    si16 sol'32 fad sol16 sol sol re si sol re' re'32 dod re16 re re la fad re\mbreak
    la' la32 sold la16 la la fad mi\tr re la'8\staccatissimo la,\staccatissimo  r4

    %29
    r2 r8 r16. mi'32 re16. do32 si16. la32
    si8\staccatissimo [r16. la'32] sol16. fa32 mi16. re32 mi8\staccatissimo r r4
    do'4\staccatissimo\p mi8\staccatissimo re\staccatissimo do4\staccatissimo do8\staccatissimo si\staccatissimo

    %32
    la\staccatissimo sol\staccatissimo fad!\staccatissimo mi\staccatissimo re\staccatissimo do\staccatissimo si\staccatissimo la\staccatissimo
    sol4(fad mi) r
    r2 r16 si''32\f lad si16 si si si, r8

    %35
    r2 r16 si'32\f lad si16 si si fad red si\mbreak
    si' si32 lad si16 si si sol fad\tr mi si'8 si, r4
    R1*3

    %40
    r16 fa''32\f mi fa16 fa fa do la fa fa'8\staccatissimo r r4
    r16 fa32 mi fa16 fa fa do la fa red2\p
    R1*2

    %44
    r2 r16 mi'32\f red mi16 mi mi si sol mi
    do' do32 si do16 do do sol mi do\mbreak la'la32 sold la16 la la mi do la
    sol!4\staccatissimo r16 sol'32 fad sol16 sol sol mi dod sol sol'8\staccatissimo sol\staccatissimo

    %47
    sol\staccatissimo sol,\staccatissimo r4 r2
    R1
    r\fermata
    sol8.\f si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32

    %51
    fad8.\tr mi32 fad  do'8\staccatissimo  \once\stemUp la,\staccatissimo \once\stemUp si\staccatissimo re'\staccatissimo fa,8.\tr mi32 re
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol
    re' re'32 dod re16 re re si la\prall sol\mbreak re'8 re, r4

    %54
    r2 r8 r16. la'32 sold16. mi32 fad16. sold32
    la8\staccatissimo[r16. sol!32] fad16. re32 mi16. fad32 sol8\staccatissimo r r4
    si,2\p do4\staccatissimo r

    %57
    dod2 re4\staccatissimo r\mbreak
    mi8.\f sol32 si mi8\staccatissimo sol16. si,32 do8\staccatissimo r r4
    re,8. fad32 si re8\staccatissimo fad16. lad,32 si8\staccatissimo r r4

    %60
    do,8. mi32 la do16. do,32 do16.\tr[si64 la] si8. re32 sol si16.\staccatissimo [si,32] si16.\tr la64 sol
    dod2\p r16 re'32\f dod re16 re re re, r8
    r2 r16 re'32 dod re16 re re la fad re

    %63
    re' re32 dod re16 re re si la\tr sol re'8 re, r4
    R1*5
    si2\p mi

    %70
    R1
    sol,8.\f si32 re sol8\staccatissimo si16. red,32 mi8\staccatissimo do'\staccatissimo la,8.. fad'32
    \stemNeutral fad8.\tr mi32 fad \once\stemDown do'8\staccatissimo la,\staccatissimo \once\stemUp si\staccatissimo[re'\staccatissimo] fa,8.\tr mi32 re

    %73
    mi16 do'32 si do16 do do sol mi do sol' sol32 fad! sol16 sol sol re si sol
    re' re'32 dod re16 re re la fa re la' la32 sold la16 la la mi do! la\mbreak
    mi' mi'32 red mi16 mi mi si sol mi

    %76
     si2.\p
    la4 fa' dod
    re sib' mi,

    %79
    fa4. re8\f(fa la)
    si,4. si8\pp (re fa)
    sol,2\f sol'4\mbreak

    %82
    do, dod2\p
    re2.

}

Ibfn =  \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp


}


forma = {

    \key sol\major
    \time 4/4
    \tempo 4 = 65
    s1*74
    \set Score.measureLength = #(ly:make-moment 2 4)
    s2
    \bar "||"\break
    \mark\markup\huge {"[2.] Larghetto"}
    \time 3/4
    \tempo 4 = 55
    \grace s8 s2.*8
    \bar"||"

}

Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>

}

Imd = {
    \Iglobal
    %\clef soprano
    \context Staff = up
    <<\Imdn \forma>>

}

Ims = {
    \Iglobal
    \clef bass
    \context Staff = down
    <<\Imsn \forma\Ibfn>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma>>
    \typeset

}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


IIvln = \relative do'' {

    R1*4
    si4\f si re(do\tr)
    mi la, do(si\tr)

    %7
    re'\ten do16 (si la sold) la8\staccatissimo r r4
    r8 sol!\staccatissimo \once\stemUp re,\staccatissimo fad'\staccatissimo sol4\staccatissimo sol,,\staccatissimo
    R1*2

    %11
    sol16 si re fad sol [si re sol] fad4(mi8)re
    \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4
    R1*2

    %15
    re'4\ten do16(si la sold) la8\staccatissimo la,\staccatissimo r do\staccatissimo
    do16(si) re sol, si[(la) do fad,] la(sol) re si sol4\staccatissimo
    re'\p(mi) la,2

    %18
    la4 re2 re4
    dod2(re8) r r4
    R1

    %21
    re'2\p dod~
    dod re
    la'4.\f ^\markup {\halign #-3 \musicglyph #"scripts.turn" } re8 dod4(si8) la\mbreak

    %24
    \grace {la32[si]} la8\staccatissimo sol\staccatissimo  \grace {sol32[la]} sol8\staccatissimo [fad\staccatissimo] \grace {fad32[sol]} fad8\staccatissimo mi\staccatissimo mi4
    R1*2
    la4\f\ten sol16 (fad mi red)  mi8\staccatissimo r r4

    %28
    r8 re!\staccatissimo \once\stemUp la,\staccatissimo dod'\staccatissimo re4\staccatissimo re,\staccatissimo
    re1\p~
    re~

    %31
    re2 r
    r r4 r8 re'
    \grace do sib4\tr la r2

    %34
    R1*2
    fa'4.\f \turnbem sib8 la4(sol8) fa
    \grace {fa32[sol]} fa8\staccatissimo mib\staccatissimo\grace {mib32[fa]} mib8\staccatissimo [re\staccatissimo] \grace {re32[mib]} re8\staccatissimo do\staccatissimo do4

    %38
    r8 re'\p(re, fa) fa4(mib\tr)
    r8 do'(do, mib) mib4(re\tr)
    fa4\f\ten mib16 (re do si!) do8\staccatissimo r r4

    %41
    r8 sib'\staccatissimo do,\staccatissimo la'\staccatissimo sib4\staccatissimo sib,,\staccatissimo
    re'4\staccatissimo r \grace {sib32[do]} sib8\staccatissimo\p lab\staccatissimo \grace {lab32[sib]} lab8\staccatissimo sol\staccatissimo
    mi'!4\staccatissimo\f r fa\staccatissimo r\mbreak

    %44
    do\staccatissimo\p r sib\staccatissimo \f r
    sib\staccatissimo \p r la!\staccatissimo \f r
    R1*15

    %61
    re4.^\f^\markup {\halign #-3 \musicglyph #"scripts.turn" } sol8 fad4(mi8) re
    \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4
    si si re(do\tr)

    %64
    mi la, do(si \tr)
    re'4\f\ten do16(si la sold) la8\staccatissimo r r4\mbreak
    r8 sol!\staccatissimo \once\stemUp re,\staccatissimo fad'\staccatissimo sol4\staccatissimo sol,,\staccatissimo

    %67
    r2 \grace {fad'32[sol]} fad8\staccatissimo\p mi\staccatissimo \grace {mi32[fad]} mi8\staccatissimo re\staccatissimo
    r2 \grace  {dod32[re]} dod8\staccatissimo si\staccatissimo \grace {si32[dod]} si8\staccatissimo lad\staccatissimo
    R1*2

    %71
    si''1\pp~
    si~
    si2\ten  r

    %74
    R1*3
    <mi, do mi, sol,>4\ff mi sol(fa\tr)
    la re, fa(mi\tr)

    %79
    R1*2\mbreak
    r8 mi'\p(mi, sol) sol4(fa8\tr) r
    R1

    %83
    <<sol4\ten\\\stemUp\shiftOn dod,8\\\stemUp\shiftOnn mi,8\ff>> fa'16(mi re dod) re8\staccatissimo r r4
    <<la'4\ten\\\stemUp\shiftOn red,8\\\stemUp\shiftOnn fad,!8>> sol'16(fad! mi red) mi8\staccatissimo r r4
    <<{do'!4\ten}\\{\stemUp la,8}>> si'16(la sol fad) sol8\staccatissimo r r4

    %86
    R1
    r4 \tuplet 3/2 { la,16_\markup\italic"sciolte" sol fad mi[re do] } si4\staccatissimo r\mbreak
    r \tuplet 3/2 { si'16 la sol fad[mi re] } do4\staccatissimo r

    %89
    r \tuplet 3/2 { do'16 si la sol[fad mi] re la' sol fad[mi re] do mi re do[si la] }
    si8\staccatissimo r r4  r2
    R1

    %92
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    reb2\pp do
    re! mib

    %95
    R1*6
    si'4 si re(do\tr)\mbreak
    mi la, do(si\tr)

    %103
    re4.^\markup {\halign #-3 \musicglyph #"scripts.turn" } sol8 fad4(mi8) re
    \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4
    sol2\p fad~

    %106
    fad sol
    re''4\ten\f do16(si la sold) la8\staccatissimo r r4
    r8 sol!\staccatissimo \once\stemUp re,\staccatissimo fad'\staccatissimo sol4\staccatissimo sol,,

    %109
    R1*2\mbreak
    sol16[si re fad]  sol16[si re sol]  fad4(mi8) re
    \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4

    %113
    R1*2
    re'4\ten do16(si la sold) la8 la,\staccatissimo r do\staccatissimo
    \senza si8\staccatissimo \tuplet 3/2 { re16[si-3 sol] } la8\staccatissimo \tuplet 3/2 { do16[ la-3 fad] } sol4\staccatissimo sol,\staccatissimo

}

IImdn = \relative do'' {
    \override TupletBracket.bracket-visibility = ##f \senza
    \set Staff.connectArpeggios = ##t

    <<
        {
            <si sol>4^\p  <si sol> re(do\pratu)
            mi la, do(si\pratu)
            re4.^\markup {\halign #-3 \musicglyph #"scripts.turn" } sol8 fad4(mi8) re

            %4
            \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4
            <si sol> <si sol> re(do\pratu)
            mi la, do(si \pratu)
        }\\{
            re,2 fad
            fad4 fad sol2
            re2 re'4 (do8) si
            si la la [sol] sol fad fad4
            re2\f fad
            fad4 fad sol2
        }\\{s1*2 sol1}
    >>

    %7
    <<re''4\ten\\<sold, re>8\arpeggio>> do16\prall si la sold \tuplet 3/2 {
        la red mi re[do si] la sol fad mi[re do]
        \stemNeutral si re do si[la sol] fad mi re do[si la]
    } sol4\staccatissimo r
    si''8\p(sol) re(si) re4(do8) sold'

    %10
    sold? \grace si16 la8 sol16(fad mi re) do8(si lad\prall si)
    \stemUp sol8.\f \tuplet 3/2 { la!32 sol fad } \stemNeutral sol16[si re sol] <<
        {
            fad4(mi8) re
            \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4
        }\\{
            re4 (do8) si
            si la la [sol] sol fad fad4
        }
    >>

    %13
    do''16\p(si lad si) r sol(si re) re(mi si do) r la(sold la)\mbreak
    la(do si la) r mi'(do la) do(si lad si) r4
    <<{\override Rest #'staff-position = #+12 r8. si16 s4 r8. do16}\\{\stemUp \override Rest #'staff-position = #+8  r8 sold  s4 r8  la s4}\\{\stemDown r16 re,8.\f\noBeam  re'8\staccatissimo sold,\staccatissimo  r16 mi8.\noBeam  mi'8\staccatissimo \once\stemUp do,\staccatissimo}\\{r4 s r s}>>

    %16
    do16(si) re sol, si[(la) do fad, ]la(sol) re si \giu <<sol4\staccatissimo\\sol>>
    \su si'8 si~si16[ re dod mi] mi(re dod re) la[(fad' mi re)]\mbreak
    re(la' sol fad) mi[(re dod si)] la(si fad sol) sol [sol'(fad mi)]

    %19
    si' sol(fad mi) re[(dod) si(la)] sol(fad) la(fad')mi[(re) dod(si)]
    lad[(si) dod(si)] la(sol) fad(mi) re4(dod\pratu)
    <<
        {
            <fad' re> <fad re> la(sol\pratu)

            %22
            <si dod,?> <mi, dod> sol(fad\pratu)
            la4. ^\markup {\halign #-3 \musicglyph #"scripts.turn" } re8 dod4(si8) la\mbreak
            \grace {la32[si]} la8\staccatissimo sol\staccatissimo  \grace {sol32[la]} sol8\staccatissimo [fad\staccatissimo] \grace {fad32[sol]} fad8\staccatissimo mi\staccatissimo mi4

            %25
            <fad, re>\p <fad re> la(sol\pratu)
            si mi, sol(fad\pratu)
        }\\{
            <la re,>2\p <dod mi, re>
            <sol re> <re' la re,>
            \once\stemUp re,\f la''4 sol8 fad\mbreak
            fad[mi] mi re re[dod] dod4
            s2 dod,
            dod?4 dod re2
        }
    >>
    <<<la'' red,>4\arpeggio\ten\\la,8\f>> sol'16 fad\prall mi red \tuplet 3/2 {
        mi[lad si] la sol fad mi[re dod] si la sol

        %28
        fad la sol fad[mi re] \stemUp dod \giu si la \stemNeutral sol[fad mi]
    } <<{re4\staccatissimo r4}\\{r \stemUp re,\staccatissimo}>>\mbreak
    \su\stemNeutral re''2\mf re'
    re' re,

    %31
    re,~\once\stemUp re8 re'' (\grace do16 sib8 \grace la16 sol8)
    sol(fad16) mib' re[(do sib la)] \grace do8 sib4\pratu la
    R1

    %34
    <<
        {
            <re, sib>4 <re sib> fa(mib\pratu)
            sol do, mib(re\pratu)\mbreak
            fa4. \turnbem sib8 la4(sol8) fa

            %37
            \grace {fa32[sol]} fa8\staccatissimo mib\staccatissimo\grace {mib32[fa]} mib8\staccatissimo [re\staccatissimo] \grace {re32[mib]} re8\staccatissimo do\staccatissimo do4
            re re fa(mib\pratu)
            sol do, mib(re\pratu)
        }\\{
            fa,2\p la
            la4 la sib2\mbreak
            <sib fa re>2\f fa'4 mib8 re
            re do do[sib] sib la la4
            sib sib la2
            la4 la sib2
        }
    >>

    %40
    <<<fa' si,!>4\ten\arpeggio\\ fa,\f>> mib'16 re\prall do si \tuplet 3/2 {
        do[fad sol] fa[mib re] do sib la sol[fa mib]
        re fa mib re[do sib] \giu \stemUp la sol fa mib[re do]
    } <<{sib4\staccatissimo r}\\{r \stemUp sib,\staccatissimo}>>\mbreak
    \su\stemNeutral  \tuplet 3/2 { fa''''16 re mib fa[lab sol] fa do' sib lab[sol fa] } mib4\staccatissimo r

    %43
    \tuplet 3/2 { sol16 mi! fa sol[sib  la!] sol re' do sib[la sol] } fa4\staccatissimo \tuplet 3/2 { do'16[sib la] sol fa mi }
    fa4\staccatissimo \tuplet 3/2 { do'16 sib la sol[fa mib] } re4\staccatissimo  \tuplet 3/2 { sib'16 lab sol fa[mib re] }
    mib4\staccatissimo\tuplet 3/2 { sib'16 lab sol fa[mib re] }\mbreak dod4\staccatissimo \tuplet 3/2 {
        la'!16 sol fa mi[re dod]

        %46
        re la' sol fa[mi re] la' sol fa mi[re do!] si! re do si[la sol] sol' fa mib re[do sib]
        la do sib la[sol fa] fa' mib re do[sib la] sol sib la sol[fad! sol] mib' re do sib[la sol]
    }
    fad!(la dod re) fad[(la sol fad)]\mbreak mi!(re fad la) dod[(re la lad)]

    %49
    si(re fad, sol) sold[( la re fad,)] la(sol si red,) fad[(mi fad sol)]
    fad(mi re! dod) sid [(dod re mi)] re (dod si la) sold[(sol  mi' fad,)]
    re'(mi,) dod'(re,) si'[(dod,) la'(si,)] sol'(la,) fad'( sol,) mi'\noBeam  s8 dod16(

    %52
    re) fad la\noBeam \stemDown dod,\noBeam (re) \stemNeutral mi[(fad sol)] la(si re do!) si[(la do la')]
    sol2\p(fad!4\pratu) sol
    si2(la4\pratu) si

    %55
    \override Slur.outside-staff-priority = #500 \once \override TextScript #'extra-offset = #'(+1.3 . 0.0)  si2^\markup {\halign #-2 \musicglyph #"scripts.turn" }(re4) (do)
    \revert Slur.outside-staff-priority si\prall(la sol fad)
    mi\prall(re) si' (sol)

    %58
    re2(do8\prall) si do4
    <<
        {
            si si re(do\pratu)\mbreak
            mi la, do(si\pratu)

            %61
            re4.^\markup {\halign #-3 \musicglyph #"scripts.turn" } sol8 fad4(mi8) re
            \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4
            si si re(do\pratu)

            %64
            mi la, do(si \pratu)
        }\\{
            sol4^\pp sol fad2
            fad4 fad sol2
            sol2^\f re'4 (do8) si
            si la la [sol] sol fad fad4
            sol4^\p sol fad2
            fad4 fad sol2
        }
    >>
    <<<re'' sold,>4\arpeggio\ten\f\\<re,>8\arpeggio>> do'16\prall si la sold \tuplet 3/2 {
        la red mi re[do si] la sol fad mi[re do]
        \stemNeutral si re do si[la sol] fad mi re \stemUp do[si \giu la]
    } <<{sol4\staccatissimo r}\\{r \stemUp sol,\staccatissimo}>>

    %67
    \su \stemUp fad'''8 \tuplet 3/2 { sol16 fad mi } fad8^\staccatissimo \noBeam \tuplet 3/2 { si16[la sol] } fad4^\staccatissimo \override Rest #'staff-position = #+8 r
    fad8 \tuplet 3/2 { sold16 fad mid } fad8^\staccatissimo \noBeam \stemDown \tuplet 3/2 { dod'16[lad mid] } \stemUp fad4^\staccatissimo r
    \tuplet 3/2 { re'16[fad, re] } re'8^\staccatissimo r dod8^\staccatissimo\noBeam \tuplet 3/2 { si16 re, si  } si'8^\staccatissimo \noBeam r la^\staccatissimo

    %70
    \tuplet 3/2 { sol16 fad mi fad[mi re] mi re dod re[dod si] dod-4 si-3 lad-2 si-4[lad-3 sold-2] lad-3 sold-2 fad-1}  \stemNeutral fad'8-5\noBeam\staccatissimo
    si,\p si4 si8 re(dod\prall sid dod)
    do do4 do8 mi8(red\prall dod red)

    %73
    fad16[ mi(red mi)]\once \revert Rest #'staff-position  r si(mi sol) sol[fa( mi fa)]\once \revert Rest #'staff-position  r do(fa la)
    la(sold) r  si si[(la)] r do do[(si)] r re re[(do)] r mi\mbreak
    r re r mi r fa r mi r re r do r si r la

    %76
    \revert Rest #'staff-position  r sol fad! sol la[sol si sol] do[sol re' do] si la sol fa
    <<
        {
            <mi do>4 <mi do> sol(fa\pratu)
            <la si,> <re, si> fa(mi\pratu)

            %79
            sol,4.^\markup {\halign #-2 \musicglyph #"scripts.turn" }  do8 si4(la8) sol
            \grace {sol32[la]} sol8\staccatissimo fa\staccatissimo \grace {fa32[sol]} fa8\staccatissimo [mi\staccatissimo] \grace {mi32[fa]} mi8\staccatissimo re\staccatissimo re4\mbreak
            <mi' do> <mi do> sol(fa8\pratu) dod'
        }\\{
            sol,2\ff si
            fa <do' sol>
            s2 sol4(fa8) mi
            mi[re]  re do do[si] si4\mbreak
            sol'2\p si
        }
    >>

    %82
    dod'?8[(\grace mi16 re8)] do16(si la ) sol fa8[(mi red\prall mi)]
    <<<sol dod,>4\ten\arpeggio\\<sol,>8\ff \arpeggio>> fa'16[mi\prall re dod] \tuplet 3/2 { re16 sold la sol[fa mi] re la' sol fa[mi re] }
    <<<la' red,>4\ten\arpeggio\\<la,>8\arpeggio >> sol'16[fad!\prall mi red] \tuplet 3/2 { mi lad si la[sol fad] mi si' la sol[fad mi] }

    %85
    <<<do'!>4\ten\arpeggio\\<fad, do!>8\arpeggio>> si16 la\prall sol fad \tuplet 3/2 {
        sol[lad si] la sol fad mi[si' la] sol fad mi
        mi' re do si[la sold] la mi' re do[si la]
    } sol8(fad\prall) \tuplet 3/2 { fad16[sol la] dod, re mi }
    re4\staccatissimo \tuplet 3/2 { la16 sol fad mi[re do] } si4\staccatissimo \tuplet 3/2 { sol''16 la si dod,[re mi] }

    %88
    re4\staccatissimo\tuplet 3/2 { si16 la sol fad[mi re] }\mbreak do4\staccatissimo \tuplet 3/2 { la''16 si do dod,[re mi]}
    re4\staccatissimo \tuplet 3/2 { do!16 si la sol[fad mi] re la' sol fad[mi re] do mi re do[si la] }
    <<si\\\giu r>> \giu re,[(fad sol)] \stemUp lad( si  \su\stemDown re fad)\stemNeutral sol dod,(re fad) sol[(lad si dod)]

    %91
    re8(fad sol lad si si re dod)
    dod(sol) r4 r2\fermata\mbreak
    <sol, mib>4\pp <sol mib> <<
        {
            sib (lab\pratu)

            %94
            <do re,!> <fa, re> lab(sol\pratu)
        }\\{
            mib2
            s mib
        }
    >>
    sib'4. \f\turnbem mib8 re4(dod8) sol'
    fa4\p(mi!8) sib' \tuplet 3/2 {
        la8 (sol mi'!) re[(dod sib)]

        %97
        la (sol fad!) sol[(sold la)] sol(fad mi) re[(dod re)]
        red(mi re) do![(si re)]\mbreak  do(si la) sold[(si la)]
        si(do si) la[(sol! fad)] mi(re dod)  re[(la' do,)]

        %100
        si(do dod) re[(red mi)] mid(fad sol) sold[(la lad)]
    }

    <<
        {
            <si sol!>4\f  <si sol> re(do\pratu)
            mi la, do(si\pratu)

            %103
            re4.^\markup {\halign #-3 \musicglyph #"scripts.turn" } sol8 fad4(mi8) re
            \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4
            si si re(do\pratu)

            %106
            mi la, do(si \pratu)
        }\\{
            s2 fad
            fad4 fad sol2
            sol re'4 (do8) si
            si la la [sol] sol fad fad4
            sol4\p sol fad2
            fad4 fad sol2
        }
    >>
    <<re''4\ten\arpeggio\\{<sold, re>8\arpeggio\f}>> do16 si \prall la sold \tuplet 3/2 {
        la red mi re[do si] la sol fad mi[re do]
        \stemNeutral si re do si[la sol] fad mi re \stemUp do[si \giu la]
    } <<{sol4\staccatissimo r}\\{r \stemUp sol,\staccatissimo}>>

    %109
    \su  \stemNeutral si'''16\p(re fad, sol)  si[(sol) re(si)]\mbreak <<{re4(do16\prall) si do sold'}\\fad,2>>
    sold'16(la si la) sol![(fad mi re)] do(si lad\prall si) re[(si la!\prall sol)]
    sol8.\f \tuplet 3/2 { la32 sol fad } sol16[si re sol] <<
        {
            fad4(mi8) re

            %112
            \grace {re32[mi]} re8\staccatissimo do\staccatissimo \grace {do32[re]} do8\staccatissimo si\staccatissimo \grace {si32[do]} si8\staccatissimo la\staccatissimo  la4
        }\\{
            re(do8) si
            si[la] la sol sol[fad] fad4
        }
    >>

    lad'16\p(si do si) r si(lad si) re[(do si do)] r do(si do)\mbreak
    red(mi) si(do) r la(sold la) do[(si lad si)] r4

    %115
    <<{\override Rest #'staff-position = #+12 r8. si16 s4 r8. do16}\\{\stemUp \override Rest #'staff-position = #+8  r8 sold  s4 r8  la s4}\\{\stemDown r16 re,8.\f\noBeam  re'8\staccatissimo sold,\staccatissimo  r16 mi8.\noBeam  mi'8\staccatissimo \once\stemUp do,\staccatissimo}\\{r4 s r s}>>
    si8\staccatissimo \tuplet 3/2 { re16[si-3 sol] } la8\staccatissimo \tuplet 3/2 { do16[ la-3 fad] } sol4\staccatissimo \giu <<sol,\staccatissimo\\sol>>

}

IImsn = \relative do {
    \set Staff.connectArpeggios = ##t

    sol'2 <<
        {
            la
            do re
        }\\{
            sol,
            sol sol
        }
    >>
    si do

    %4
    do, re
    sol <<
        {
            la
            do re
        }\\{
            sol,
            sol sol
        }
    >>

    %7
    << <si sold re>8\arpeggio \\si,2>> do\mbreak
    re r4 sol,\staccatissimo
    <<
        {
            re''2 fad

            %10
            re re
        }\\{
            sol, <la sol>
            fad sol
        }
    >>
    si4 si, do(do')
    r do, re re,

    %13
    r <<re''\\sol,>> r <<fad'\\{<la, sol>}>>
    r <<<fad' do>\\sol,>> r <<re'\\sol,>>
    <<{\override Rest #'staff-position = #+12 r4 si r  do }\\{\stemUp \override Rest #'staff-position = #+8  r8. sold16  s4 r8.  la16 s4}\\{\stemUp r8 re,  s4  r8 mi s4}\\{si2 do}>>

    %16
    re4 re, sol s
    <<
        {
            re'' mi la,2
            re2 re

            %19
            dod
        }\\{
            sol fad\mbreak
            fad mi
            mi
        }
    >> re4 fad,
    sol2 la
    s1*2

    %23
    <<la'2\\fad>> sol\mbreak
    sol la
    <<
        {
            la mi

            %26
            sol la
            <red, la>8\arpeggio
        }\\{
            re2 re
            re re
            fad,
        }
    >> sol
    la s

    %29
    r8 fad'(la do!) sib(re) sib(sol)
    fad(la fad do) sib(re) sib(sol)
    fad(la) fad(do) sib4. sib''8

    %32
    la4 fad sol re
    R1
    sib'2 <<
        {
            do

            %35
            mib fa
        }\\{
            sib,
            sib? sib
        }
    >>
    s mib
    mib? fa

    %38
    <<
        {
            fa\p do
            mib fa
            <si, fa>8\arpeggio
        }\\{
            sib2 sib
            sib? sib
            re,
        }
    >> mib

    %41
    fa4 fa, s2\mbreak
    lab'4\staccatissimo r sol\staccatissimo r
    sib\staccatissimo r la!\staccatissimo r

    %44
    la\staccatissimo r<<fa'\staccatissimo\\lab,>> r
    sol\staccatissimo r\mbreak <<mi'!\staccatissimo\\sol,>> r  %%%%%% fin qui OK
    fa\staccatissimo fa'\staccatissimo fa\staccatissimo mib\staccatissimo

    %47
    mib\staccatissimo re\staccatissimo mib\staccatissimo do\staccatissimo
    re\staccatissimo r\mbreak r2
    R1*2

    %51
    r2 r4 r16 fad,(la) s\mbreak
    R1*7
    <<
        {
            re2\pp la\mbreak

            %60
            do re
            re\f
        }\\{
            sol, sol
            sol sol
            si
        }
    >> do
    do, re

    %63
    <<
        {
            re'\p la
            do re
            <si sold re>8\arpeggio
        }\\{
            sol2 sol
            sol sol
            <si,>\arpeggio
        }
    >> do

    %66
    re s
    \su \stemDown <re'' si>4\p  <re si> <re si> r
    <dod lad> <dod lad> <dod lad> r

    %69
    si_\staccatissimo la!\staccatissimo sol\staccatissimo fad\staccatissimo
    mi8 re dod si \mbreak \giu lad sold fad r
    r4 <<fad\\re>> r <<sol\\mi>>

    %72
    r <<sol\\mi>> r <<la!\\fad>>
    r <<si\\sol>> r <<do\\la>>
    \su si8 re do mi re fa mi sol\mbreak

    %75
    fa sol la sol fa mi re do
    \giu\stemNeutral si4 r8 sol la si sol si
    <<{s2 re}\\{do, do'}\\\stemDown do>>

    %78
    do do
    <<{r4 do s2}\\{mi,2 fa}>>
    fa? sol\mbreak

    %81
    do <<re\\do>>
    si4 sol do2
    <<<mi dod sol>8\arpeggio\\<mi,>2\arpeggio>> fa4\staccatissimo r

    %84
    <<<red' la>8\arpeggio\\<fad,!>2\arpeggio>> sol4\staccatissimo r\mbreak
    <<<fad' do!>8\arpeggio\\<la,>2\arpeggio>> si4\staccatissimo r
    do\staccatissimo do, \staccatissimo  re r

    %87
    r re\staccatissimo re\staccatissimo r
    r re\staccatissimo re\staccatissimo r
    r re\staccatissimo re\staccatissimo r

    %90
    s1
    R
    r4 mib,2.\fermata

    %93
    <<
        {
            \once\stemDown reb''2 do
            lab sib
            r4 mib mi2
        }\\{
            \once\override NoteColumn.force-hshift = #0.5 mib,2 mib
            mib? mib
            sol1
        }
    >>

    %96
    R1*5
    <<
        {
            re'2 la
            do re

            %103
            re
        }\\{
            sol, sol
            sol sol
            si
        }
    >> do
    do, re\mbreak
    <<
        {
            re'2 la

            %106
            do re
            <si sold re>8\arpeggio
        }\\{
            sol2 sol
            sol sol
            <si,>2\arpeggio
        }
    >> do
    re s

    %109
    <<
        {
            re'2 la
            re re
        }\\{
            sol, sol
            fad sol
        }
    >>
    si4 si, do(do')

    %112
    r do, re re,
    r <<re''\\sol,>> r <<fad'\\{<la, sol>}>>
    r <<<fad' do>\\sol,>> r <<re'\\sol,>>

    %115
    <<{\override Rest #'staff-position = #+12 r4 si r  do }\\{\stemUp \override Rest #'staff-position = #+8  r8. sold16  s4 r8.  la16 s4}\\{\stemUp r8 re,  s4  r8 mi s4}\\{si2 do}>>
    re4 re, sol\staccatissimo s

}


IIbcn = \relative do {

    R1*4
    sol1\f~
    sol

    %7
    si2 do8\staccatissimo r r4
    r re\staccatissimo sol,\staccatissimo r
    R1*2

    %11
    r4 si do2
    r 4do re re,
    R1*2

    %15
    si'2 do
    re4 re, sol\staccatissimo r
    sol'2\p fad~

    %18
    fad mi~
    mi re8 r r4
    R1

    %21
    re'\p~
    re
    fad,2\f sol

    %24
    sol la
    R1*2
    fad,2\f sol8\staccatissimo r r4

    %28
    r la\staccatissimo re,\staccatissimo r
    r8 fad'\p(la do!) sib(re) sib(sol)\mbreak
    fad(la) fad(do) sib(re) sib[(sol)]

    %31
    fad (la) re,2 r4
    r2 r4 r8 fad''
    sol4 re r2

    %34
    R1*2
    re,2\f mib
    mib? fa

    %38
    sib,1\p~
    sib
    re2\f mib8\staccatissimo r r4

    %41
    r fa,\staccatissimo sib\staccatissimo r\mbreak
    lab'\staccatissimo r sol8\staccatissimo\p fa\staccatissimo fa\staccatissimo mib\staccatissimo
    sib'4\staccatissimo\f r la!\staccatissimo r

    %44
    la\staccatissimo\p r lab\staccatissimo\f r
    sol\staccatissimo\p r sol\staccatissimo\f r
    R1*15

    %61
    si,!2\f do
    do re
    sol,1\p~

    %64
    sol
    si2\f do8\staccatissimo r r4\mbreak
    r re\staccatissimo sol,\staccatissimo r

    %67
    r2 re''8\p\staccatissimo dod\staccatissimo dod\staccatissimo si\staccatissimo
    r2 lad8\staccatissimo sold\staccatissimo sold\staccatissimo fad\staccatissimo
    R1*8

    %77
    do2\ff do
    do do
    R1*2

    %81
    do2\p~do
    R1
    mi2\ff fa8\staccatissimo r r4

    %84
    fad!2 sol8\staccatissimo r r4\mbreak
    la2 si8\staccatissimo r r4
    R1

    %87
    r4 re,\staccatissimo re\staccatissimo r
    r4 re\staccatissimo re\staccatissimo r
    r \tuplet 3/2 { do'!16 si la sol[fad mi] re la' sol fad[mi re] do mi re do[si la] }

    %90
    si8\staccatissimo r r4 r2
    R1
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

    %93
    mib,1\pp~
    mib\mbreak
    R1*6

    %101
    sol'2\f sol
    sol sol
    si, do

    %104
    do re
    sol,1\p~
    sol

    %107
    si2 do8\staccatissimo r r4
    r re\staccatissimo sol,\staccatissimo r
    R1*2

    %111
    r4 si do2
    r4 do re re,
    R1*2\mbreak

    %115
    si'2 do
    re4 re, sol\staccatissimo r

}

IIbfn =  \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp


}


forma = {

    \key sol\major
    \time 2/2
    \tempo 2 = 48
    s1*116
    \bar "|."

}

IIvl = {
    \IIglobal
    %\notypeset
    <<\IIvln \forma>>

}

IImd = {
    \IIglobal
    %\clef soprano
    \context Staff = up
    <<\IImdn \forma>>

}

IIms = {
    \IIglobal
    \clef bass
    \context Staff = down
    <<\IImsn \forma\IIbfn>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma>>
    \typeset

}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

   systems-per-page = #4
   print-first-page-number = ##t
   first-page-number = #2

}

\markup \huge {[1.] Allegretto}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
   } <<

      \new Staff \with {
         fontSize = #-2
         \override StaffSymbol.staff-space = #(magstep -2)
      } <<
         \set Staff.midiInstrument = #"violin"
         \set Staff.instrumentName = \markup \center-column{"Violino"}
         \Ivl
      >>

      \new PianoStaff <<

         \set PianoStaff.midiInstrument = #"harpsichord"
         \new Staff = "up" \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
            \consists "Span_arpeggio_engraver"
         }
         <<
            \set PianoStaff.instrumentName =  \markup \center-column{"Cembalo"}
            \Imd
         >>

         \new Staff = "down"  \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
            \consists "Span_arpeggio_engraver"
         }
         <<
            \Ims
         >>
      >>

      \new Staff \with {
         fontSize = #-2
         \override StaffSymbol.staff-space = #(magstep -2)
      } <<
         \set Staff.midiInstrument = #"cello"
         \set Staff.instrumentName = \markup \center-column{"Violoncello"}
         \Ibc
      >>
   >>

   \layout {

      indent = 1.9\cm

      \context	{
         \Score
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
         \override SpacingSpanner.uniform-stretching = ##t
         \override BarLine.hair-thickness = #1.2
         \override StaffGrouper.staff-staff-spacing.padding = #2
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup \huge {[3.] Grazioso e poco allegro}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   } <<

      \new Staff \with {
         fontSize = #-2
         \override StaffSymbol.staff-space = #(magstep -2)
      } <<
         \set Staff.midiInstrument = #"violin"
         \IIvl
      >>

      \new PianoStaff <<

         \set PianoStaff.midiInstrument = #"harpsichord"
         \new Staff = "up" \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
            \consists "Span_arpeggio_engraver"
         }
         <<
            \IImd
         >>

         \new Staff = "down"  \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
             \consists "Span_arpeggio_engraver"
         }
         <<
            \IIms
         >>
      >>

      \new Staff \with {
         fontSize = #-2
         \override StaffSymbol.staff-space = #(magstep -2)
      } <<
         \set Staff.midiInstrument = #"cello"
         \IIbc
      >>
   >>

   \layout {

      indent = 0.5\cm

      \context	{
         \Score
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
         %\override SpacingSpanner.uniform-stretching = ##t
         \override BarLine.hair-thickness = #1.2
         \override StaffGrouper.staff-staff-spacing.padding = #1
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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


%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}
