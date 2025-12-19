\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn s1 s s1*3^\markup\italic\center-align\column{"Trombe"\vspace #-0.3"suonano sole"} \bar "||"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn s1 s s1*3^\markup\italic\center-align\column{"Trombe"} \bar "||"

\cadenzaOff

}

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

dolce = _\markup\italic"dolce"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #2

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
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \con \terzine

}

Ifln =  \relative do'' {

   r8 la'\noBeam~la16 si la sol fad8 \slurDashed mi16 (re) mi8 [dod]
   re dod16 (si)\slurSolid dod8 [la] r la'\noBeam~la16 si la sol
   fad8 sol16 mi fad8 [sold\tr] la2~

   %4
   la la8 [mi]~mi16 fad mi re
   dod8 si16 la si8 [sold] la8[sold16 fad] sold8 mi
   r8 mi'\noBeam~mi16 fad mi re\mbreak dod8 re16 si dod8 [red]

   %7
   mi1~
   mi8. la,16 fad'8. si,16 sold'8. dod,16 la'8. re,16
   si'8. mi,16 dod'4. si16 la sold8.\tr [la16]

   %10
   la4 r r8 si,32[(la sol16)] sol32(fad mi16) \once\slurDashed re'[(mi,)]
   dod'8 la r4 r8 re32(dod  si16) \once\slurDashed si32[(la sol16)] fad'[(sol,)]
   mi'8 dod r4\mbreak r8 la'\noBeam~la16 si la sol

   %13
   fad8 mi16( re) mi8 [dod] re dod16 (si) dod8 [la]
   r la' \noBeam~la16 si la sol fad8 sol16 mi mi8.[re16]
   re8 r dod r re r dod r

   %16
   re r mi r re16 la si mi dod8.\tr[re16]
   re2 r
   _\markup {"          " \musicglyph #"scripts.dfermata" }

}

Ivln =  \relative do'' {

    r2 r8 la'\noBeam ~la16 si la sol
    fad8 mi16(re) mi8[dod] re \once\slurDashed dod16 (si) dod8[la]
    r mi'\noBeam~ mi16 dod re si dod8[fad16(la)] mi(la) re,(la')

    %4
    dod,(la') fad(la) mi[(la) re,(la')] dod,4 r
    r8 mi\noBeam~mi16 fad mi re\mbreak dod8[si16 la] si8 sold
    la \once\slurDashed sold16 (fad) sold8[mid] r si'\noBeam ~si16 sold la fad

    %7
    sold8 [dod16(mi)] si(mi) la, (mi') sold,(mi') dod(mi) si[(mi) la,(mi')]
    sold,(mi) la8~la16[(re,) si'8]~si16 mi, dod'8~dod16[fad, re'8]~
    re16 sold, mi'8~mi16[la, la' dod,]\mbreak fad mi re dod si8.[la16]

    %10
    la8\noBeam la32(sol fad16) fad32[(mi re16)] do' re, si'8[sol] r4
    r8 dod!32(si la16) la32[(sol fad16)] mi'(fad,) re'8[si] r4
    r8 mi32(re dod16) dod32[(si la16)] sol' la, fad'8[mi16 (re)] mi8 dod

    %13
    r la'\noBeam~la16 si la sol fad8 \once\slurDashed mi16(re) mi8[dod]
    re dod16 si dod8[(mi)] mi16 la, si mi dod8.[re16]
    re8 r mi, r fad r mi r

    %16
    re la'~la16[si la sol] fad8 sol16 mi mi8.[re16]
    re2 r
    _\markup {"          " \musicglyph #"scripts.dfermata" }

}

Ivcn = \relative do {

    re8 re' dod la re fad, sol la
    re, la'~la16[si la sol] fad8 mi16(re) mi8[dod]
    re dod re mi la,\noBeam \tuplet 3/2 { re'16(mi re) dod[(re dod)] si(dod si)

    %4
    la(si la) re[(mi re)] dod(re dod) si[(dod si)]} la8 la sold mi\mbreak
    la dod, re mi \once\stemUp la, mi''~mi16[fad mi re]
    dod8 si16(la) si8[sold] la sold la si

    %7
    mi,\noBeam  \tuplet 3/2 { la16(si la) sold[(la sold)] fad[(sold fad)] mi(fad mi) la[(si la)] sold(la sold) fad[(sold fad)] }
    mi8 dod16(la') re,[(la') re,(si')] mi,(si') mi,(dod') fad,[(dod') fad,(re')]\mbreak
    sold,(re') sold,(mi') la,[(mi') dod,(mi')] re, mi fad re mi8 [mi,]

    %10
    la r la'32(sol fad16) fad32[(mi re16)] sol,8\noBeam r si'32(la sol16) sol32[(fad mi16)]
    la,8 r dod'32(si la16) la32[(sol fad16)] si,8\noBeam r re'32(dod si16) si32[(la sol16)]
    dod,8 r mi'32(re dod16) dod32[(si la16)] re,8 re' dod la\mbreak

    %13
    re fad, sol la re, la'~la16[si la sol]
    fad8 mi16 re \once\slurDashed mi8[(dod)] re sol la la,
    re la'~la16[si la sol] fad re la'8~la16[si la sol]

    %16
    fad8 r dod r re sol la la,
    re2 r
    _\markup {"          " \musicglyph #"scripts.dfermata" }

}

Ibcn = \relative do {

    re8 re' dod la re fad, sol la
    re,  re la' la, re re la dod
    re dod re mi la,4 r

    %4
    la r la8 la' sold mi
    la dod, re mi la, la' mi mi,\mbreak
    la la' mi sold  la sold la si

    %7
    mi,4 r mi r
    mi8 dod re re, mi mi' fad fad,
    sold sold' la dod, re re mi mi,

    %10
    la fad fad fad sol sol sol sol
    la la la la si si si si
    dod dod dod dod re re' dod la

    %13
    re fad, sol la re, re la' la,
    re re la dod re sol la  la,
    re r la' r re, r la r\mbreak

    %16
    re r dod r re sol la la,
    re2 r
    _\markup {"          " \musicglyph #"scripts.dfermata" }

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4 <6> s <6>8 <6>
  s2 s4 s8 <6>
  s <6> <6> <_+> <5 _+> <6 4> s4
  <5 _+>8 <6 4> s4 s <6>
  s8 <6> <6> <_+> s2
  s4 s8 <6> s <6> <6> <_+>
  <5 _+> <6 4> s4 <5 _+>8 <6 4> s4
  <_+>8 <6> <5> <6> <5 _+> <6> <5> <6>
  <5> <6>  s <6> <7> <6> <_+> s
  s4 <6> <5> <6>
  <5> <6> <5> <6>
  <5> <6> s s8 <6>
  s <6> <6> s s2
  s4 s8 <6> s2
  s1
  s4 <6> s s8 <4+>

}

forma = {

  \key re\major
  \time 2/2
  \tempo 4 = 65
  s1*17
  \bar"|."


}

Ifl = {
  \Iglobal
  \notypeset
  <<\Ifln \forma>>

}

Ivl = {
  \Iglobal
  <<\Ivln \forma>>

}

Ivc = {
  \Iglobal
  \clef bass
  <<\Ivcn \forma>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
   \terzinequarto

}

IIfln =  \relative do'' {

    R2.*3
    r8 la' fad sold16 la si8 fad
    sold mi la dod, si sold'

    %6
    la dod,16 la la'4. fad16 re
    si'8 sol16 mi la8 fad16 re sol8 mi16 dod
    fad8 re sol4. sol8\mbreak

    %9
    sol4 fad8 sol16(la) sol(fad) sol(mi)
    fad la, si dod re dod re mi fad mi fad re
    mi4 r16 mi fad sold la la sold la

    %12
    fad la, si dod re dod re mi fad mi fad re
    mi4 r16 mi fad sold la sold la fad
    sol! si, dod red\mbreak mi red mi fad sol fad sol mi

    %15
    fad4 r16 fad sol la si si la si
    sol si, dod red mi red mi fad sol fad sol mi
    fad4 r16 fad sol la si si la si

    %18
    sol8 mi la4. la8
    la4 sol8 la16(si) la(sol) fad(mi)\mbreak
    mi8 mi dod red16 mi fad8 dod

    %21
    red si mi sol, fad red'
    mi si sold4 r8 mi'
    dod4 r8 mi dod4

    %24
    r8 la' fad4 r8  re
    si sol do4. do8
    do?4 si8(do!16 re)\mbreak do si la sol

    %27
    sol4 r8 sol mi fad16 sol
    la8 fad re\noBeam sol4 fad8
    r re' re re re re

    %30
    re re \tuplet 3/2 { re[mi re] re mi re }
    re si' si si si si
    si si \tuplet 3/2 { sol[lab sol] sol lab sol }\mbreak

    %33
    si mi, mi mi mi  mi
    mi mi \tuplet 3/2 { mi[fad mi] mi fad mi }
    mi la la la la la

    %36
    la la \tuplet 3/2 { la[si la] la si la }
    la4  r r
    R2.*2

    %40
    r8 la fad sold16 la si8 fad\mbreak
    sold mi la dod, si sold'
    la4 la4. la8

    %43
    la4 sol4. sol8
    sol4 fad4. fad8
    fad4 mi4. mi8

    %46
    mi4 r8 re si dod16 re
    mi8 dod la\noBeam re4 dod8\mbreak
    re fad,16 re la'4 r8 fad16 re

    %49
    si'4 r8 sol16 mi si'4
    r8 la16 fad dod'4 r8 la16 fad
    re'8 si sol'4. sol8

    %52
    sol4 fad8(sol16 la) sol(fad mi re)
    re8 re si dod16 re mi8 si
    dod la re[fad, mi dod']

    %55
    re2 r4
    _\markup {"     " \musicglyph #"scripts.dfermata" }

}

IIvln =  \relative do'' {

    r8 re si[dod16 re] mi8 si
    dod la re fad, mi[dod']
    fad re16 si mi8[dod16 la] re8 si16 sold

    %4
    dod8 la re4. re8
    re4 dod8 re16 mi re dod re si\mbreak
    dod4 r8 dod16 la fad'4

    %7
    sol fad mi
    re4 r8 re si[dod16 re]
    mi8 [dod la re] dod8 re16 mi

    %10
    re4 r16 la si dod re dod re si
    dod mi fad sold la dod, re mi la, dod si dod
    re4 r16 la si dod re dod re si

    %13
    dod mi fad sold la dod, re mi la, si dod red
    mi4 r16 si dod red mi red  mi dod
    red fad sol la si red, mi fad si, red dod red

    %16
    mi4 r16 si dod red mi red mi dod
    red fad sol la\mbreak si red, mi fad si, red dod red
    mi4 r8 mi dod [red16 mi]

    %19
    fad8 red si\noBeam mi4 red8
    mi sol16 mi la4. la8
    la4 sol8(la16 si) la(sol) fad(mi)

    %22
    mi4 r8 si sold4
    r8 mi' dod4 r8 la'\mbreak
    fad4 r8 la fad4

    %25
    r8 sol mi fad16 sol la8 mi
    fad re sol si, la fad'
    sol si, do4. do8

    %28
    do?4 si8(do!16 re) do(si) la(sol)
    sol8 sol16 re si'4 r8 la16 re,\mbreak
    si'4 r8 sol16 re la'4

    %31
    r8 mi'16 si sol'4 r8 fad16 si,
    sol'4 r8 mi16 si fad'4
    r8 la,16 mi dod'4 r8 si16 mi,

    %34
    dod'4 r8 la16 mi si'4
    r8 re16 la mi'4 r8 mi16 la,
    fad'4 r8 re16 la mi'4\mbreak

    %37
    r8 re si dod16 re mi8 si
    dod la re fad, mi dod'
    fad re16 si mi8 dod16 la re8 si16 sold

    %40
    dod8 la re4. re8
    re4 dod8(re16 mi) re(dod re si)
    dod4 r16 dod si dod re, dod' re dod\mbreak

    %43
    si4 r16 si la si dod, si' dod si
    la4 r16 la sol la si, la' si la
    sol4 r16 sol fad sol la, sol' la sol

    %46
    fad8 re sol4. sol8
    sol4 fad8(sol16 la)sol(fad) mi(re)
    re4 r8 fad16 re la'4

    %49
    r8 sol16 mi  si'4 r8 sol16 mi\mbreak
    dod'4 r8 la16 fad dod'4
    r8 re si dod16 re mi8 si

    %52
    dod la re fad, mi dod'
    re fad16 re sol4. sol8
    sol4 fad8(sol16 la) sol(fad) mi(re)

    %55
    re2 r4
    _\markup {"     " \musicglyph #"scripts.dfermata" }

}

IIvcn = \relative do {

    re4 sol mi
    la fad8 re la'4
    re dod si

    %4
    la si si,
    mi fad8 dod re mi
    la,4 r r

    %7
    R2.
    r8 re' si dod16 re mi8 si\mbreak
    dod la re fad, mi dod'

    %10
    re re, fad re la' re,
    r la dod la mi' la,
    r re fad re la' re,

    %13
    r la dod la mi' la,
    r mi' sol mi si' mi,
    r si red si fad' si,

    %16
    r mi sol mi si' mi,\mbreak
    r si red si fad' si,
    r mi' dod red16 mi fad8 dod

    %19
    red si mi sol, fad si
    mi,4 fad fad,
    si do8 sol la si

    %22
    mi16 mi' re dod! si la sold fad mi re dod si
    la la' sold fad\mbreak mi re dod si la sol fad mi
    \once\stemUp re re'' dod si la sol fad mi re do si la

    %25
    sol8 sol' la do,16 la la'8 do,16 la
    re4 mi8 si do re
    sol, sol' mi fad16 sol la8 mi

    %28
    fad re sol si, la re
    sol,4 r8 sol'16 re la'4\mbreak
    r8 sol16 re si'4 r8 la16 re,

    %31
    si'4 r8 mi,16 si fad'4
    r8 mi16 si sol'4 r8 fad16 si,
    sol'4 r8 la16 mi si'4

    %34
    r8 la16 mi dod'4 r8 si16 mi,
    dod'4 r8 re,16 la mi'4
    r8 re16 la fad'4 r8 mi16 la,\mbreak

    %37
    fad'8 re sol4. sol8
    sol4 fad8(sol16 la) sol(fad) mi(re)
    re fad si8 dod,16 mi la8 si,16 re sold8

    %40
    la4 r r
    R2.
    r8 la fad sol16 la si8 fad

    %43
    sol sol mi fad16 sol la8 mi\mbreak
    fad8 fad re mi16 fad sol8 re
    mi mi dod re16 mi fad8 dod

    %46
    re re si dod16 re mi8 si
    dod la re fad, mi la
    re la'16 fad re8 la'16 fad re8 la'16 fad

    %49
    re8 si'16 sol mi8 si'16 sol mi8 si'16 sol
    mi8 dod'16 la fad8 dod'16 la fad8 dod'16 la\mbreak
    fad8 re mi si' sol mi

    %52
    la la, si fad sol la
    re, re' mi si' sol mi
    la la, si fad sol la

    %55
    re,2 r4
    _\markup {"     " \musicglyph #"scripts.dfermata" }

}

IIbcn = \relative do {

   re4 sol mi
    la fad8 re la'4
    re dod si

    %4
    la si si,
    mi fad8 dod re mi
    la,4 r r

    %7
    R2.
    r8 re' si dod16 re mi8 si\mbreak
    dod la re fad, mi dod'

    %10
    re,4 r r
    la r r
    re r r

    %13
    la' r r
    mi r r
    si r r

    %16
    mi r r\mbreak
    si' r r
    mi, dod fad

    %19
    si, mi si
    mi fad fad,
    si do8 sol la si

    %22
    mi4 mi mi
    la, la la
    re re re

    %25
    sol la la,\mbreak
    re mi8 si do re
    sol, sol' mi fad16 sol la8 mi

    %28
    fad re sol si, la re
    sol,4 sol' fad
    sol, sol' fad

    %31
    sol mi  red
    mi, mi' red \mbreak
    mi la sold

    %34
    la, la' sold
    la re, dod
    re, re' dod

    %37
    re mi mi,
    la si8 fad sol la
    re4 dod si

    %40
    la si re
    mi fad8 dod re mi\mbreak
    la,4 r r

    %43
    R2.*3
    r8 re si dod16 re mi8 si
    dod la re fad, mi la

    %48
    re,4 re re
    sol sol sol
    la la la\mbreak

    %51
    si mi mi,
    la si8 fad sol la
    re4 mi mi,

    %54
    la si8 fad sol la
    re,2 r4
    _\markup {"     " \musicglyph #"scripts.dfermata" }

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2.
  s4 <6>2
  <5>8 <6> <7> <6> <7> <6\\>
  s2.
  s4 s8<6> <6> <_+>
  s2.*2
  s4 <6> s4
  <6 5>4 s8 <6> <6> <6>
  s2.*5
  <_+>2.
  s
  <_+>
  <6>
  <7 _+>4 s <5 4+>
  s <5\\> s
  s <_+>8 <6> <6> <_+>
  <_->4 <_+> s
  s2.
  s
  s4 <_-> s
  <7->4 s8 <6> <6> <_+>
  s4 <6->8 s16 <6> <_->4
  <6 5->4 s8 <6 > <7-> <_+>
  s4 s <6>
  s s <6>
  s s <6>
  s s <6>
  s <_+> <6>
  s s <6>
  s s <6>
  s s <6>
  s <5> s
  <7> <6>8 <6> <6> <_+>
  <5->4 <7>8 <6> <7> <6\\>
  s4 <5> <6>
  <_+> s <6>8 <6+>
  s2.*4
  s4 s8 <6> s4
  <6 5> s <7>8 <7 _+>
  s2.
  <5>4 <6> s
  <5> <6> s
  s2.
  <7>4 s <6>8 <6>
  s4 <5> s
  <7> s <6>8 <6+>

}

forma = {

    \key re\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 37
    s2.*55
    \bar"|."

}

IIfl = {
  \IIglobal
  \notypeset
  <<\IIfln \forma>>

}

IIvl = {
  \IIglobal
  <<\IIvln \forma>>

}

IIvc = {
  \IIglobal
  \clef bass
  <<\IIvcn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}


IIIglobal = {

  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f

}

IIIfln =  \relative do'' {

   R2.
   r4 r si~
   si lad re8 dod

   %4
   dod2 dod'4~
   dod si la8 sold
   la4. fad8 red si

   %7
   sol'!(fad) fad2~
   fad4 mi4.\tr  re16 mi\mbreak
   fad2 fad4~

   %10
   fad mid la8(sold)
   sold2 dod4~
   dod si la8 sold

   %13
   la2.~
   la4 sol! fad8 mi
   fad2 mi8 re

   %16
   mi2.~
   mi4 re dod8 si\mbreak
   dod4 dod2\tr

   %19
   si2.~
   si
   si'4 la sol8 fad

   %22
   sol4 fad2~
   fad4 mi4.\tr re16 mi
   fad2.
    _\markup {"            " \musicglyph #"scripts.dfermata" }

}

IIIvln =  \relative do'' {

   r4 r si~
   si lad re8(dod)
   dod2 fad4~

   %4
   fad mi re8 dod
   re2 r4
   R2.*2

   %8
   r4 r si~
   si lad re8(dod)\mbreak
   dod2 fad,4~

   %11
   fad mid la8 sold
   sold?2 sold'4~
   sold fad mi8 red

   %14
   mi2.~
   mi4 re dod8 si
   dod4 si la8 sold

   %17
   lad4 si2~
   si4 lad2
   si r4\mbreak

   %20
   si'4 la sol8 fad
   sol4 fad2
   si, sold4

   %23
   si8 dod16 re dod4.\tr si8
   lad2.
    _\markup {"            " \musicglyph #"scripts.dfermata" }

}

IIIvcn = \relative do {

   si4 re si
   fad'2 si,4
   fad'2 r4

   %4
   fad lad fad
   si2 mid,4
   fad si si,

   %7
   mi2 fad4
   sol sol,2\mbreak
   fad4 fad' si,

   %10
   dod2 r4
   dod2 r4
   dod mid dod

   %13
   fad2 si4
   mi,2 dod4
   re2 sol4

   %16
   dod,2 mi4
   fad sol re
   mi fad fad,\mbreak

   %19
   si' la sol8(fad)
   sol4 fad mi8(red)
   mi4 red2

   %22
   mi fad4
   sol2.
   fad
    _\markup {"            " \musicglyph #"scripts.dfermata" }

}

IIIbcn = \relative do {

   si4 re si
   fad'2 si,4
   fad'2 r4

   %4
   fad lad fad
   si2 mid,4
   fad si si,

   %7
   mi2 fad4
   sol sol,2\mbreak
   fad4 fad' si,

   %10
   dod2 r4
   dod2 r4
   dod mid dod

   %13
   fad2 si4
   mi,2 dod4
   re2 sol4

   %16
   dod,2 mi4
   fad sol re
   mi fad fad,\mbreak

   %19
   si' la sol8(fad)
   sol4 fad mi8(red)
   mi4 red2

   %22
   mi fad4
   sol2.
   fad
    _\markup {"            " \musicglyph #"scripts.dfermata" }

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4 <6>s
  <4+>2.
  <5 4+>
  <_+>4 <6> s
  <9> <8> <6>
  s <7 _+> s
  <_-> s <_+>
  <7> <6> s
  <5 4> <_+> s
  <5\\ 4+> s s
  <5\\ 4+> s s
  <_+> <6> s
  <9> <8> <7 _+>
  <5 4> <_-> <6>
  <9> <8> s
  <7> s <_+>
  <_+> s <6>
  <6 5> <_+> s
  s <4\+ 2> s
  s <6\\> s
  s <6 5> s
  s s <_+>
  <7> <6\\>

}

forma = {

  \key si\minor
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 60
  s2.*24
  \bar"|."

}

IIIfl = {
  \IIIglobal
  %\notypeset
  <<\IIIfln \forma>>

}

IIIvl = {
  \IIIglobal
  <<\IIIvln \forma>>

}

IIIvc = {
  \IIIglobal
  \clef bass
  <<\IIIvcn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}


IVglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza \terzine

}

IVfln =  \relative do'' {

   fad2
   mi \afterGrace re\tr  ({dod16[re)]}
   dod2\tr si'
   \appoggiatura si8 la2 sol8 fad sol mi

   %4
   fad4 la, fad'2
   mi \afterGrace re\tr  ({dod16[re)]}
   dod2\tr \afterGrace si' (la8)

   %7
   la2 sol8 fad sol mi
   fad2 fad
   mi (\grace {mi16[fad]} sol2)

   %10
   fad (\grace {fad16 [sol]} la2)
   sold si
   lad\tr re,

   %13
   dod\tr \afterGrace si ({la16[si)]}
   lad2\tr \afterGrace sol'2 (fad8)
   fad4. mi8 re4dod\tr \mbreak

   %16
   si8 dod re mi fad2
   mi \afterGrace re\tr  ({dod16[re)]}
   dod2\tr \afterGrace si' (la8)

   %19
   la2 sol8 fad sol mi
   fad4 la, fad'2\mbreak
   mi \afterGrace re\tr  ({dod16[re)]}

   %22
   dod2 \afterGrace si'  (la8)
   la4. sol8 fad4 mi\tr\mbreak
   re2 do

   %25
   si\tr do
   si\tr si'
   la \afterGrace sol2 ({fad16[sol)]}

   %28
   fad2 \afterGrace do'(si8)
   si4. la8 sol4 fad\tr
   mi8 re dod si dod2

   %31
   si \afterGrace la2\tr ({sold16[la)]}\mbreak
   sold2 \afterGrace fad'2 (mi8)
   mi4. re8 dod4 si\tr

   %34
   la2 fad'
   mi \afterGrace re\tr  ({dod16[re)]}
   dod2 \afterGrace si'  (la8)

   %37
   la2 sol8 fad sol mi
   fad4 la, fad'2
   mi \afterGrace re\tr  ({dod16[re)]}

   %40
   dod2 \afterGrace si'  (la8)
   la4. sol8 fad4 mi\tr
   re2
    _\markup {"      " \musicglyph #"scripts.dfermata" }

}

IVvln =  \relative do'' {

   r4 re~
   re dod2 si4~
   si la r sol'~
   sol fad2 mi4

   %4
   re fad, r re'~
   re dod2 si4~
   si la r sol'~\mbreak

   %7
   sol fad2 mi4
   re2 r4 re~
   re dod2 mi4~

   %10
   mi re2 fad4~
   fad mi2 re4
   dod fad, r si~

   %13
   si la2 sol4~\mbreak
   sol fad r mi'~
   mi8 dod re si fad4 lad

   %16
   si2 r4 re~
   re dod2 si4~
   si la r sol'~

   %19
   sol fad2 mi4\mbreak
   re fad, r re'~
   re dod2 si4~

   %22
   si la r sol'~
   sol8 mi fad re la4 dod
   re2 r4 la~

   %25
   la sol2 la4~
   la sol r sol'~\mbreak
   sol fad2 mi4~

   %28
   mi red r la'~
   la8 fad sol mi si4 red
   mi2 r4 la,~

   %31
   la sold2 fad4~
   fad mi r re'~
   re8 si dod la\mbreak mi4 sold

   %34
   la2 r4 re~
   re dod2 si4~
   si la r sol'~

   %37
   sol fad2 mi4
   re fad, r re'~
   re dod2 si4~\mbreak

   %40
   si la r sol'~
   sol8 mi fad re la4 dod
   re2
    _\markup {"      " \musicglyph #"scripts.dfermata" }

}

IVvcn = \relative do {

   re8 mi fad sol
   la si dod la si la sold mi
   la si dod la re si mi re
   dod la re dod si4 dod

   %4
   re r re,8 mi fad sol
   la si dod la si la sold mi
   la si dod la re si mi re

   %7
   dod la re dod si4 dod
   re8 la fad la re, mi fad sol
   la si dod si la si dod la

   %10
   re mi fad mi re dod re si\mbreak
   mi si mi, fad sol la si si,
   fad' mi re dod si dod re mi

   %13
   fad sol la fad sol fad mi dod
   fad dod' lad fad si re dod si
   lad fad si mi, fad mi fad fad,

   %16
   si4. dod8\mbreak re mi fad sol
   la si dod la si la sold mi
   la si dod la re si mi re

   %19
   dod la re dod si4 dod
   re r re,8 mi fad sol
   la si dod la si la sold mi\mbreak

   %22
   la si dod la re si mi re
   dod la re sol, la sol la  la,
   re mi fad sol la sol fad re

   %25
   sol la si sol la sol fad re
   sol la si la si la si dod\mbreak
   re dod red si mi, fad sol la

   %28
   si si la sol fad sol fad mi
   red si mi la si la si si,
   mi2 la,8 si dod re

   %31
   mi fad sold mi\mbreak fad mi red si
   mi fad sold mi la fad si la
   sold mi la re, mi re mi mi,

   %34
   la si dod la re mi fad sol
   la si dod la si la sold mi\mbreak
   la si dod la re si mi re

   %37
   dod la re dod si4 dod
   re r re,8 mi fad sol
   la si dod la si la sold mi

   %40
   la si dod la re si mi re\mbreak
   dod la re sol, la sol la la,
   re2
    _\markup {"      " \musicglyph #"scripts.dfermata" }

}

IVbcn = \relative do {

   re4 fad
   la la si sold
   la la, re mi
   dod re si dod

   %4
   re r re fad
   la la si sold
   la la, re mi\mbreak

   %7
   dod re si dod
   re2 re4 fad
   la la, la' dod

   %10
   re re, re' si
   mi mi, sol si
   fad r si, re

   %13
   fad fad sol mi
   fad fad, si' dod
   lad si8 mi, fad4 fad,

   %16
   si2 re4 fad
   la la si sold
   la la, re' mi

   %19
   dod re si dod
   re r re, fad
   la la si sold\mbreak

   %22
   la la, re  mi
   dod re8 sol la4 la,
   re2 la'4 fad

   %25
   sol sol, la' fad
   sol sol, sol' si
   re red mi, sol

   %28
   si la8 sol fad4 mi
   red mi8 la si4 si,\mbreak
   mi2 la,4 dod

   %31
   mi mi fad red
   mi mi, la' si
   sold la8 re, mi4 mi,

   %34
   la2 re4 fad
   la la si sold
   la la, re' mi\mbreak

   %37
   dod re si dod
   re r re, fad
   la la si sold

   %40
   la la, re mi
   dod re8 sol la4 la,
   re,2
    _\markup {"      " \musicglyph #"scripts.dfermata" }

}

IVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s4 <6>
   <5 4> <_+> <3 9> <6 5>
   <9> <3 8> <6> <_->
   <6 5> s <6 5> <6>
   s2 s4 <6>
   <5 4> <_+> <3 9> <6 5>
   <9> <3 8> <6> <_->
   <6 5> s <6 5> s
   s1
   <4>4 <5 3> <7> <6 5>
   <9> <8> s <7 _+>
   <_+> s <6> <_+>
   <_+> s s <6>
   <5 4> <3> <9>  s
   <_+> s <6> s
   <6 5> s <6 4> <6 _+>
   s2 s4 <6>
   <4> <3> <9> <6 5>
   <9> <8> <6> <_->
   <6 5> s <6 5> <6>
   s2 s4 <6>
   <5 4> <3> <3 9> <6 5>
   <9> <8> <6> <_->
   <6 5> s <6 4> <5 _+>
   s2 <_->4 <6 5->
   <9>4 <8> <_-> <6 5->
   <9> <8> s <6>
   <4> <6 5> <3> <6>
   <5 4> <4\+> <5> <6 4->
   <6 5> s8 <_-> <6 4>4 <5 _+>
   s2 <_+>4 <6>
   <4> <5 _+> <3 9> <6 5>
   <_+ 9> <8> <6> <_->
   <6 5> s <6 4> <5 _+>
   s2 s4 <6>
   <5 4> <_+> <3 9> <6 5>
   <9> <3 8> <6> <_->
   <6 5> <_+> <6 5> <6>
   s2 s4 <6>
   <5 4> <_+> <9> <6 5>
   <9> <3 8> <6> <_->
   <6 5> s <4> <_+>

}

forma = {

   \key re\major
   \time 2/2
   \tempo 1 = 50
   \partial 2 s2
   s1*7
   s2
   \bar":..:"\break
   s
   s1*33
   s2
   \bar":|."

}

IVfl = {
   \IVglobal
   %\notypeset
   <<\IVfln \forma>>

}

IVvl = {
   \IVglobal
   <<\IVvln \forma>>

}

IVvc = {
   \IVglobal
   \clef bass
   <<\IVvcn \forma>>

}

IVbc = {
   \IVglobal
   \clef bass
   <<\IVbcn \forma \IVbfn>>
   \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

   systems-per-page = #4
   print-first-page-number = ##t
   first-page-number = #2

}

\markup\huge " [1.] Con Contento"

\score {
   {

      \new ChoirStaff  <<

         \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"Flauto""Traversiere"}
            \Ifl
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino"}
            \Ivl
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Bassono o""Violoncello"}
            \Ivc
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"harpsichord"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \Ibc

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

%\pageBreak

\markup\huge " [2.] Allegro"

\score {
   {

      \new ChoirStaff  <<

         \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIfl
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIvc
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"harpsichord"
            \IIbc

         >>
      >>

   }

   \layout {

      indent = 0.8\cm

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

%\pageBreak

\markup\huge " [3.] Largo"

\score {
   {

      \new ChoirStaff  <<

         \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIIfl
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIIvc
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"harpsichord"
            \IIIbc

         >>
      >>

   }

   \layout {

      indent = 0.8\cm

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

%\pageBreak

\markup\huge " [4.] Presto"

\score {
   {

      \new ChoirStaff  <<

         \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IVfl
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IVvl
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IVvc
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"harpsichord"
            \IVbc

         >>
      >>

   }

   \layout {

      indent = 0.8\cm

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

