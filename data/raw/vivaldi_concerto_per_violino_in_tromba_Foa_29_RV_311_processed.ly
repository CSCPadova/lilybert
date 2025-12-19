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
}

Ivln = \relative do'' {

   <<
      {
         la8
         si[la16 si do8 la] si re, si sol
         si'[la16 si do8 la] si re, si sol
         do'4 si la \override Rest #'staff-position = #-0 r8 re

         %4
         do re, re do' si re, re si'
         la re, re re' do re, re do'
         si re, re si' la4 \override Rest #'staff-position = #-0 r8 re\pp
      }\\{
         re,
         sol[[fad16 sol la8 fad] sol4 s
         sol8[fad16 sol la8 fad] sol4 s
         la sol fad s
         la4 s8 la sol4 s8 sol
         fad4 s la s8 la
         sol4 s8 sol fad4 s
      }
   >>\mbreak

   %7
   \appoggiatura {mi'16[fad]} sol8[fad16 mi re8 do] si la sol re'
   \appoggiatura {mi16[fad]} sol8[fad16 mi re8 do] <<{si la sol si\f}\\{s4 s8 sol}>>
   <<
      {
         la4 si la si

         %10
         la
      }\\{
         \slurUp fad16(re) fad(re) sol(re) sol(re) fad(re) fad(re) sol(re) sol(re)
         fad8 [re]
      }
   >> \appoggiatura {do'16[re]}  mi4\pp re do
   si8 la16 sol la4\tr sol \appoggiatura {do16[re]} mi4

   %12
   re do si8 la16 sol la4\tr
   <<{si\f re, si' re,}\\{sol16 re sol re si sol si sol sol' re sol re si sol si sol}>>
   do8[si16 do re8 re] sol,4 r8 <<
      {
         si'

         %15
         si la la re, re re re si'
         si la la re, re re re si'
         si[la16 si do8 si] la4  \override Rest #'staff-position = #-0 r8 re

         %18
         re[mi16 re sol8 re] do do4 do8\mbreak
         do[re16 do fad8 do] si si4 si8
         si[do16 si mi8 si] la re, si'[re,]

         %21
         la'[re,] si'[re,] la' [re,]
      }\\{
         sol
         sol re re si si sol sol sol'
         sol re re si si sol sol sol'
         sol[fad16 sol la8 sol] fad4 s8 si
         si si4 si8 la la4 la8\mbreak
         la la4 la8 sol sol4 sol8
         sol sol4 sol8 fad4 sol
         fad sol fad
      }
   >> re'\p
   sol16(fad sol) mi fad(mi fad) re mi(re mi) do re(do re) si
   do(si do) la si(la si) sol <<
      {
         la8 la si [si]

         %24
         la la si [si]
      }\\{
         fad16 mi fad re sol fad sol re
         fad mi fad re sol fad sol re
      }
   >> re'8[dod16 si la sol fad mi]
   <<{fad8 mi16 re mi4\tr fad'8[mi16 fad sol8 mi]}\\{la,,4 la re}>>
   fad'8 la, fad re fad'[mi16 fad sol8 mi]

   %27
   fad la, fad re sol'4 fad
   mi r8 mi re16 la re la sol' mi sol mi
   re la re la sol' mi sol mi re la re la sol' mi sol mi

   %30
   fad8[mi16 re mi8 dod] re4 r8 sol,\mbreak
   fad16 re fad re sol mi sol mi fad re fad re sol mi sol mi
   fad re fad re sol mi sol mi fad8[mi16 re mi8 dod]

   %33
   re4 r8 la'\solo <<
      {
         re la re la
         la4 s re8 la re la
         la4 s8 fad mi fad sol fad

         %36
         mi4 \override Rest #'staff-position = #-0 r8 si' lad si4 dod?8
         si dod?4 re8 dod re4 mi8
         re[dod?16 re mi8 re] dod4
      }\\{
         fad, fad
         fad8[mi16 fad re8 la'] fad4 fad
         fad8 mi16 fad re8 la la la la la
         la4 s8 fad' fad fad4 fad8
         fad fad4 fad8 fad fad4 fad8
         fad fad fad fad fad4
      }
   >> r8 fad'\p

   %39
   fad[mi16 re mi8 mi] mi[re16 dod? re8 re]
   re[dod16 si dod8 si] <<
      {
         s4 s8 mi^\f
         re dod?16 si dod4\tr si
      }\\{
         lad8 sold? fad fad
         fad4 fad si,
      }\\{s2 s \once \override Stem #'transparent = ##t  fad'4}
   >> r8 fad'\p

   %42 OK
   fad[mi16 re mi8 mi] mi[re16 dod? re8 re]
   re[dod?16 si dod8 si] <<
      {
         s4 s8 mi^\f
         re dod?16 si dod4\tr si
      }\\{
         lad8 sold fad fad
         fad4 fad si,
      }\\{s2 s \once \override Stem #'transparent = ##t  fad'4}
   >> r

   %45
   R1
   r2 <<
      {
         si8[la16 si do8 la]
         si re, si sol si'[la16 si do8 la]

         %48
         si re, si sol do'4 si
         la \override Rest #'staff-position = #-0 r8 re re[mi16 re sol8 re]\mbreak
         re[mi16 re sol8 re] do[re16 do fad8 do]

         %51
         do[re16 do fad8 do] si[do16 si mi8 si]
         si[do16 si mi8 si] la8 [re,]
      }\\{
         sol8[fad16 sol la8 fad]
         sol4 s sol8[fad16 sol la8 fad]
         sol4 s la sol
         fad s8 si si si si si\mbreak
         si si si si la la la la
         la la la la sol sol sol sol
         sol sol sol sol fad4
      }
   >> r8 re'\p
   \appoggiatura {mi16[fad]} sol8[fad16 mi re8 do] si la sol re'

   %54
   \appoggiatura {mi16[fad]} sol8[fad16 mi re8 do] si[la16 si do8 si16 la]
   si8[la16 si do8 si16 la] si8 la16 sol la4\tr \mbreak
   <<{si4^\f re, si' re,}\\{sol16 re sol re si sol si sol sol' re sol re si sol si sol}>>

   %57
   si'8 la16 sol la4\tr <<
      {
         si4 re,
         si' re,
      }\\{
         sol16 re sol re si sol si sol
         sol' re sol re si sol si sol
      }
   >> re'8[si16 do re8 re]
   sol,1\fermata

}

IvlIn =  \relative do'' {

   la8
   si[la16 si do8 la] si re, si sol
   si'[la16 si do8 la] si re, si sol
   do'4 si la \override Rest #'staff-position = #-0 r8 re

   %4
   do re, re do' si re, re si'
   la re, re re' do re, re do'
   si re, re si' la4 r8 re\pp\mbreak

   %7
    \appoggiatura {mi16[fad]} sol8[fad16 mi re8 do] si la sol re'
   \appoggiatura {mi16[fad]} sol8[fad16 mi re8 do] si la sol si\f
   la16 fad la fad si sol si sol la fad la fad si sol si sol

   %10
   la8 fad \appoggiatura {do'16[re]}  mi4\pp re do
   si8 la16 sol la4\tr sol \appoggiatura {do16[re]} mi4
   re do si8 la16 sol la4\tr

   %13
   sol16 re sol re si sol si sol sol' re sol re si sol si sol
   do8[si16 do re8 re] sol,4 r
   R1*10

   %25
   r2 fad''8[mi16 fad sol8 mi]
   fad8 la, fad re fad'[mi16 fad sol8 mi]
   fad la, fad re mi'4 re

   %28
   dod4 r8 dod fad16 re fad re mi dod mi dod
   fad re fad re mi dod mi dod fad re fad re mi dod mi dod
   re8 fad, sol mi fad4 r8 sol

   %31
   fad16 re fad re sol mi sol mi fad re fad re sol mi sol mi
   fad re fad re sol mi sol mi fad8[mi16 re mi8 dod]
   re4 r r2

   %34
   R1*10
   r2 re'8[dod16 re mi8 dod]
   re fad, re si re'[dod16 re mi8 dod]

   %46
   re fad, re si si' [la16 si do?8 la]
   si re, si sol si'[la16 si do8 la]
   si re, si sol do'4 si

   %51
   la r r2\mbreak
   R1*7
   r2 sol16 re sol re si sol si sol

   %58
   sol' re sol re si sol si sol do8[si16 do re8 re]
   sol,1\fermata

}

IvlIIn = \relative do'' {

   re,8
   sol[fad16 sol la8 fad] sol re si sol
   sol'[fad16 sol la8 fad] sol re si sol
   la'4 sol fad r8 la

   %4
   la re, re la' sol re re sol
   fad re re la' la re, re la'
   sol re re sol fad4 r8 la\pp\mbreak

   %7
   si si la la sol fad sol la
   si si la la sol fad sol sol\f
   fad16 re fad re sol re sol re fad re fad re sol re sol re

   %10
   fad8 re \appoggiatura {la'16[si]} do4\pp si la
   sol fad sol \appoggiatura {la16[si]} do4
   si la sol fad

   %13
   sol16 re sol re si sol si sol sol' re sol re si sol si sol
   do8[si16 do re8 re] sol,4 r
   R1*10

   %25
   r2 re''8[dod16 re mi8 dod]
   re la fad re re'[dod16 re mi8 dod]
   re la fad re sol'4 fad

   %28
   mi r8 mi re16 la re la sol' mi sol mi
   re la re la sol' mi sol mi re la re la sol' mi sol mi
   fad8[mi16 re mi8 dod] re4 r8 mi,\mbreak

   %31
   re8 re mi16 dod mi dod re8 re mi16 dod mi dod
   re8 re mi16 dod mi dod re8 fad sol mi
   re4 r r2

   %34
   R1*10
   r2 si'8[lad16 si dod8 lad]
   si fad re si si'[lad16 si dod8 lad]

   %46
   si fad re si sol'[fad16 sol la8 fad]
   sol re si sol sol'[fad16 sol la8 fad]
   sol re si sol la'4 sol

   %49
   fad r r2
   R1*7
   r2 sol16 re sol re si sol si sol

   %58
   sol' re sol re si sol si sol do8[si16 do re8 re]
   sol,1\fermata

}

Ivlan =  \relative do' {

   r8
   re re mi re re re si sol
   re' re mi re re re si sol
   do la si mi la, sol' la fad

   %4
   r re re4 r8 re re4
   r8 re re4 r8 re re4
   r8 re re4 r8 re re re\pp \mbreak

   %7
   re re fad fad re4. re8
   re re fad fad re4. re8
   re re re re re re re re

   %10
   re4 fad\pp sol re
   sol,8 sol' re[re,] sol4 fad'
   sol re sol,8 sol' re re,

   %13
   sol'16 re sol re si sol si sol sol' re sol re si sol si sol\mbreak
   do8[si16 do re8 re] sol,4 r
   R1*10

   %25
   r2la'8 la si la
   la la fad re la' la si la
   la la fad re sol mi fad si

   %28
   mi, re mi dod la la' la la
   la la la la la la la la
   la la, si la la4 r8 la\mbreak

   %31
   la la la la la la la la
   la la la la la la si la
   fad4 r r2

   %34
   R1*10
   r2 fad'8 fad sol fad
   fad fad re si fad' fad sol fad

   %46
   fad fad re si re re mi re
   re re si sol re' re mi re
   re re si sol do la si si

   %49
   \parenthesize re,4 r r2
   R1*7
   r2 sol'16 re sol re si sol si sol

   %58
   sol' re sol re si sol si sol do8[si16 do re8 re]
   sol,1\fermata

}

Ibcn = \relative do {

   r8
   sol8 sol' do, re sol re si sol
   sol sol' do, re sol re si sol
   la' fad sol dod, re mi fad re

   %4
   r re re4 r8 re re4
   r8 re re4 r8 re re4
   r8 re re4 r8 re re re\pp \mbreak

   %7
   re re fad fad re4. re8
   re re fad fad re4. re8
   re re re re re re re re

   %10
   re4 fad\pp sol re
   sol,8 sol' re[re,] sol4 fad'
   sol re sol,8 sol' re re,

   %13
   sol'16 re sol re si sol si sol sol' re sol re si sol si sol\mbreak
   do8[si16 do re8 re] sol,4 r
   sol'8 r re r sol r sol, r

   %16
   sol' r re r sol r sol, r
   sol' r do, dod re re' si sol
   sol4 sol la la\mbreak

   %19
   fad fad sol sol
   dod, dod re re
   re re re8 do? si sol

   %22
   mi' r re r do r si r
   la r sol r re' re re re
   re re re re\mbreak re4 dod

   %25
   re8 re, la'' [la,] re re, sol[la]
   re la' fad re re, re' sol, la
   re la' fad re mi dod re sold,

   %28
   la si dod la re re la la
   re re la la re re la la
   re re sol, la re mi fad dod\mbreak

   %31
   re re la la re re la[la]
   re re la[la] re re sol, la
   re,4 r8 re' re4 re

   %34
   re r8 re re4 re
   re r8 la la4 la
   la8 la' si si, fad'4 fad\mbreak

   %37
   fad fad fad fad
   fad fad fad8 sold lad fad
   re' re dod fad, si si si, si

   %40
   mid mid mid, mid fad fad fad' fad
   si si, fad'[fad,] si dod re si
   re' re dod fad, si si si, si

   %43
   mid mid mid, mid\mbreak fad fad fad' fad
   si si, fad'[fad,]
   si si' mi,[fad]

   %46
   si fad re si si si' mi, fad
   si fad re si sol sol' do,? re
   sol re si sol sol sol' do, re

   %49
   sol re si sol la' fad sol dod,
   re4 r8 sol sol4 sol\mbreak
   sol sol la la

   %52
   fad fad sol sol dod, dod re8 do si la
   sol4 fad' sol8 la si la
   sol4 fad sol,8 sol' do, re

   %55
   sol, sol' do, re sol, sol' re re,\mbreak
   sol sol sol' sol sol, sol sol' sol
   sol, sol' re[re,] sol'16 re sol re si sol si sol

   %58
   sol' re sol re si sol si sol do8[si16 do re8 re]
   sol,1\fermata

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key sol\major
   \time 4/4
   \tempo 2 = 60
   \partial 8 s8
   s1*59
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
  \terzine\con
}

IIvln = \relative do'' {

  si8 [\appoggiatura mi8 re16 dod si8 si] \tuplet 3/2 { mi16(re dod } si4) si8
  \tuplet 3/2 { dod16(re mi } mi8) \tuplet 3/2 { dod16(re mi } mi8) \tuplet 3/2 { re16(dod si } si8) r fad'
  \senza \tuplet 3/2 { sol16(fad mi mi[fad sol] sol fad mi re[dod si)] } la8-.(la-. la-. la-.)

  %4
  \tuplet 3/2 { fad'16(mi re re[mi fad] fad mi re dod[si la)] } sol8-.(sol-. sol-. sol-.)
  \tuplet 3/2 { mi'16(re dod dod[re mi] mi re dod si[la sol)] \mbreak fad(mi re sol[fad mi)]} <<mi4\tr\\la,>>
  re r8 fad si8 [\appoggiatura mi8 re16 dod si8 si]

  %7
  \tuplet 3/2 { mi16(re dod } si4) si8 \tuplet 3/2 { lad16(si lad dod[mi dod)] si(re si re[fad re)] }
  dod8 fad, r fad' \tuplet 3/2 { sol16(si, sol') sol[( si, sol')] sol(mi fad sol[fad mid)]
  fad(la, fad') fad[(la, fad')] fad(re mi fad[mi red)] mi(sol, mi') mi[(sol, mi')] mi(dod re? mi[re dod)]

  %10
  re(fad, re') re(fad, re') re(si dod re[dod si)] do(si do do[si do)] red(dod? red red[dod red)]}
  mi4~\tuplet 3/2 { mi16 dod re mi [re dod] re dod si mi[re dod] } dod4\tr
  si8 re,^\f mi fad si, re mi fad

  %13
  si,1\fermata

}

IIvlIn =  \relative do'' {

   si8 si si si si si si si
   dod dod dod dod  re re re re
   sol sol sol sol la, la la la

   %4
   fad' fad fad fad sol, sol sol sol
   mi' mi mi mi\mbreak fad, sol mi[mi]
   fad fad fad fad si si si si

   %7
   si si si si dod dod re re
   dod dod re re re re dod r
   dod dod si r\mbreak si si lad r

   %10
   si si si r do do red red
   mi mi mi mi re mi dod dod
   si re, _\markup {[\musicglyph #"f"]}mi fad si, re mi fad

   %13
    si,1\fermata

}

IIvlIIn = \relative do'' {

   fad8 fad fad fad mi mi mi mi
   fad, fad fad fad fad fad re' re
   re re re re dod dod dod dod

   %4
   dod dod dod dod si si si si
   si si si si\mbreak la sol dod, dod
   re re re re fad' fad fad fad

   %7
   mi mi mi mi mi mi fad fad
   lad, lad si si si si la? r
   la la sol r\mbreak sol sol fad r

   %10
   fad fad fad r sol sol la la
   si si dod dod fad, si lad lad
   si re,_\markup {[\musicglyph #"f"]} mi fad si, re mi fad

   %13
   si,1\fermata

}

IIvlan =  \relative do' {

   si'8 si la la sol sol sol sol
   lad, lad lad lad si si si si
   mi mi mi mi fad fad fad fad

   %4
   re re re re mi mi mi mi
   dod dod dod dod\mbreak  re si la[la]
   re re dod dod si si' la la

   %7
   sol sol sol sol fad fad si, si
   fad' fad si, si mi mi la, r
   re re sol, r\mbreak dod dod fad, r

   %10
   si si si r mi mi fad fad
   sol sol lad, lad si sol' fad fad
   si, re_\markup {[\musicglyph #"f"]} mi fad si, re mi fad

   %13
   si,1\fermata

}

IIbcn = \relative do {

   si'8 si la la sol sol sol sol
   lad, lad lad lad si si si si
   mi mi mi mi fad fad fad fad

   %4
   re re re re mi mi mi mi
   dod dod dod dod\mbreak  re si la[la]
   re re dod dod si si' la la

   %7
   sol sol sol sol fad fad si, si
   fad' fad si, si mi mi la, r
   re re sol, r\mbreak dod dod fad, r

   %10
   si si si r mi mi fad fad
   sol sol lad, lad si sol' fad fad
   si, re_\markup {[\musicglyph #"f"]} mi fad si, re mi fad

   %13
   si,1\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 4/4
  \tempo 4 = 45
  s1*13
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

   <<
      {
         si8 sol, si'
         la16 si do8 re,
      }\\{
         sol4 sol8
         fad16 [sol la8]
      }
   >>
   re16 si do la si sol

   %4
   <<
      {
         la4 s8
         si sol, si'  %%%%%inizio ripresa
         la16 si do8 re,
      }\\{
         fad mi re
         sol4 sol8
         fad16 [sol la8]
      }
   >>

   %7
   re16 si do la si sol
   << la4\\re,>> r8
   <<
      {
         re'16 si la sol si re

         %10
         do la sol fad la do\mbreak
         si la si do re8
         la8 la re16[la]

         %13
         la8[la] re16 la
         si8 do la
         si4
      }\\{
         re,4 s8  %% fine ripresa
         re4 s8
         re4 s8
         fad16 re fad re re8\noBeam
         fad16 re fad re re8\noBeam
         sol la fad
         sol4
      }
   >> r8

   %16
   sol,16\solo re' (si' do) re do
   sol, re' (si' do) re si
   la sol fad mi re do

   %19
   si do si la sol8
   sol16 re' (si' do) re do\mbreak
   sol, re' (si' do) re si

   %22
   <<la4\\re,>> r8
   si'16(re do si) la sol
   do(mi re do) si la

   %25
   si(re do si) la sol
   do(mi re do) si la
   <<
      {
         si8\f do la

         %28
         si4
      }\\{
         sol8 la fad
         sol4
      }
   >> r8
   si16(re do si) la sol
   do(mi re do) si la

   %31
   si(re do si) la sol\mbreak
   do(mi re do) si la
   <<
      {
         si8 do la

         %34
         si si si
         re, re re
         si' si si
      }\\{
         sol la fad
         sol16 re sol re sol re
         si sol si sol si sol
         sol' re sol re sol re
      }
   >>

   %37
   dod'16(re mi8) sol,
   fad16(sol la8) re,
   dod'16(re mi8) sol,

   %40
   fad16(sol la8) re,
   re'16\p(dod re) mi re dod
   re(dod re) mi re dod\mbreak

   %43
   re(dod re) mi re dod
   <<
      {
         re8^\f dod16 si la sol
         la8 sol la

         %46
         la la la
      }\\{
         re,4 s8
         fad4 mi8
         fad mi re
      }
   >>
   re'16(dod re) mi re dod
   re(dod re) mi re dod

   %49
   re(dod re) mi re dod
   <<
      {
         re8^\f dod16 si la sol
         la8 sol la
      }\\{
         re,4 s8
         fad4 mi8
      }
   >>

   %52
   re4 r8
   R4.*6
   si'16 fad si fad si fad

   %60
   dod' fad, dod' fad, dod' fad,
   re' fad, re' fad, re' fad,
   mi' fad, mi' fad, mi' fad,

   %63
   re' fad, re' fad, re' fad,
   dod'8 fad, r
   fad'16\p(mi fad) sol fad8\mbreak

   %66
   sol,16-.^\f fad-. sol-. la-. sol8
   mi'16\p re mi fad mi8
   fad,16^\f mi fad sol fad8

   %69
   re'16\p dod? re mi re8
   mi,16^\f re mi fad mi8
   dod'?16 si dod re dod8

   %72
   re dod? si
   dod? si lad
   si4 r8

   %75
   <<
      {
         si8 sol, si'
         la?16 si do?8 re,
      }\\{
         sol4 sol8
         fad16 [sol la8]
      }
   >>
   re16 si do la si sol

   %78
   <<la4.\\{fad8 mi re}>>\mbreak
   sol,16 re' (si' do) re do
   sol, re' (si' do) re si

   %81
   la sol fad mi re do
   si do si la sol8
   sol16 re' (si' do) re do

   %84
   sol, re'(si' do) re si
   la4 r8
   <<
      {
         la8 [la] s

         %87
         la8[la] s
         si8 la sol
         re[re] s

         %90
         re8[re] s
         re4.
      }\\{
         fad16 re fad re re'[la]
         fad re fad re re'[la]
         sol,4 s8
         si16 sol si sol sol'[re]
         si sol si sol sol'[re]
         si8 la sol
      }\\{s2. \once \override Stem #'transparent = ##t re'4}
   >>
   mi'16\p(fad sol4)

   %93
   re16(mi fad4)
   do16(re mi4)
   si16(do re4)

   %96
   <<
      {
         la16^\f sol fad mi re do
         re4 s8
         si' do la

         %99
         si4
      }\\{
         re, s8
         si16 do si la sol8
         sol' la fad
         sol4
      }
   >> r8
   mi'16\p(fad sol4)
   re16(mi fad4)

   %102
   do16(re mi4)
   si16(do re4)
   <<
      {
         la16\f sol fad mi re do

         %105
         re4 s8
         si' do la
         si4
      }\\{
         re, s8
         si16 do si la sol8
         sol' la fad
         sol4
      }
   >> r8

   %108
   <<
      {
         si sol, si'
         la16 si do8 re,
      }\\{
         sol4 sol8
         fad16 [sol la8]
      }
   >>
   re16 si do la si sol

   %111
   << la4\\re,>> r8
   <<
      {
         re'16 si la sol si re
         do la sol fad la do\mbreak

         %114
         si la si do re8
         la8 la re16[la]
         la8[la] re16 la

         %117
         si8 do la
         si4\fermata
      }\\{
         re,4 s8  %% fine ripresa
         re4 s8
         re4 s8
         fad16 re fad re re8\noBeam
         fad16 re fad re re8\noBeam
         sol la fad
         sol4
      }
   >> r8

}

IIIvlIn =  \relative do'' {

   si8 sol, si'
   la16 si do8 re,
   re'16 si do la si sol

   %4
   fad8 mi re
   si' sol, si'  %%%%%inizio ripresa
   la16 si do8 re,

   %7
   re'16 si do la si sol
   la4 r8
   re16 si la sol si re

   %10
   do la sol fad la do\mbreak
   si la si do re8
   fad,16 re fad re re'[la]

   %13
   fad16 re fad re re'[la]
   si8 do la
   sol4 r8 %%%%%fine ripresa

   %16
   R4.*11
   si8 do la
   si4 r8

   %29
   R4.*4
   si8 do la
   si4 r8

   %35
   R4.*17
   fad'8 re, fad'\mbreak
   mi16 fad sol8 la,

   %54
   fad'16 mi fad sol la sol
   fad mi fad sol la sol
   fad mi fad sol la sol

   %57
   fad8 sol mi
   re4 r8
   R4.*16

   %75
   si8 sol, si'
   la16 si do8 re,
   re'16 si do la si sol

   %78
   fad8 mi re
   R4.*29
   si'8 sol, si'  %%%%%inizio ripresa

   %109
   la16 si do8 re,
   re'16 si do la si sol
   la4 r8

   %112
   re16 si la sol si re
   do la sol fad la do\mbreak
   si la si do re8

   %115
   fad,16 re fad re re'[la]
   fad16 re fad re re'[la]
   si8 do la

   %118
   sol4\fermata r8

}

IIIvlIIn = \relative do'' {

   sol8 sol, sol'
   fad16 sol la8 re,
   re'16 si do la si sol

   %4
   fad8 mi re
   sol8 sol, sol'
   fad16 sol la8 re,

   %7
   re'16 si do la si sol
   la4 r8
   re16 si la sol si re

   %10
   do la sol fad la do\mbreak
   si la si do re8
   fad,16 re fad re re'[la]

   %13
   fad16 re fad re re'[la]
   si8 do la
   sol4 r8 %%%%%fine ripresa

   %16
   R4.*11
   sol8 la fad
   sol4 r8

   %29
   R4.*4
   sol8 la fad
   sol4 r8

   %35
   R4.*17
   re'8 re, re'\mbreak
   dod16 re mi8 la,

   %54
   re16 dod re mi fad mi
   re dod re mi fad mi
   re dod re mi fad mi

   %57
   re8 mi dod
   re4 r8
   R4.*16

   %75
   sol,8 sol, sol'
   fad16 sol la8 re,
   re'16 si do la si sol

   %78
   fad8 mi re
   R4.*29
   sol8 sol, sol'

   %109
   fad16 sol la8 re,
   re'16 si do la si sol
   la4 r8

   %112
   re16 si la sol si re
   do la sol fad la do\mbreak
   si la si do re8

   %115
   fad,16 re fad re re'[la]
   fad16 re fad re re'[la]
   si8 do la
   sol4\fermata r8

}

IIIvlan =  \relative do' {

   re4 re8
   re re re
   si4 r8

   %4
   la sol fad
   re'4 re8 %%%% ripresa
   re8 re re

   %7
   si4 r8
   fad'4 r8
   do' re, r

   %10
   do'  fad, r\mbreak
   re re r
   re re re

   %13
   re re re
   re mi re
   si4 r8 %%%% fine ripresa

   %16
   R4.*11
   re8 mi re
   re4 r8

   %29
   R4.*4
   re8 mi re
   re4 r8

   %35
   R4.*17
   la'4 la8\mbreak
   la,4 la8

   %54
   la'4 la8
   la4 la8
   la4 la8

   %57
   la si la
   fad4 r8
   R4.*16

   %75
   re4 re8
   re re re
   si4 r8

   %78
   la sol fad\mbreak
   R4.*29
   re'4 re8 %%%% ripresa

   %109
   re8 re re
   si4 r8
   fad'4 r8

   %112
   do' re, r
   do'  fad, r\mbreak
   re re r

   %115
   re re re
   re re re
   re mi re

   %118
   si4\fermata r8

}

IIIbcn = \relative do {

   sol'8 sol, sol'
   re re, re'
   sol,4 r8

   %4
   re'4 r8
   sol8 sol, sol'  %%%% ripresa
   re re, re'

   %7
   sol,4 r8
   re'8 la' fad
   sol sol, r

   %10
   la' re, r\mbreak
   sol sol, r
   re' re re

   %13
   re re re
   sol do, re
   sol,4 r8 %% ripresa

   %16
   sol4 r8
   sol4 r8
   re'4 r8

   %19
   sol,4 r8
   sol4 r8\mbreak
   sol4 r8

   %22
   re' fad re
   sol4.
   fad

   %25
   sol
   fad
   sol8 do, re

   %28
   sol,4 r8
   sol'4.
   fad

   %31
   sol\mbreak
   fad
   sol8 do, re

   %34
   sol, sol' sol,
   sol sol' sol,
   sol sol' sol,

   %37
   la la' la,
   re, re' re,
   la' la' la,

   %40
   re, re' re,
   re'4\p la8
   re4 la8\mbreak

   %43
   re4 la8
   re\f la' la,
   re sol, la

   %46
   re4 re,8
   re'4\p la8
   re4 la8

   %49
   re4 la8
   re\f la' la,
   re sol, la

   %52
   re re, re'\mbreak
   la la' la,
   re4 la8

   %55
   re4 la8
   re4 la8
   re sol, la

   %58
   re4 r8
   fad fad fad
   fad fad fad

   %61
   fad fad fad
   fad fad fad
   fad fad fad

   %64
   fad fad fad
   re4 r8\mbreak
   mi4 r8

   %67
   dod4 r8
   re4 r8
   si4 r8

   %70
   dod4 r8
   lad4 r8
   si dod re

   %73
   mi fad fad,
   si4 r8
   sol' sol, sol'

   %76
   re re, re'
   sol,4 r8
   re'4 re,8\mbreak

   %79
   sol4 r8
   sol4 r8
   re'4 r8

   %82
   sol4 sol,8
   sol4 r8
   sol4 r8

   %85
   re' fad la
   re, re re
   re re re

   %88
   sol re sol,\mbreak
   sol sol sol
   sol sol sol

   %91
   sol4.
   do'8 mi do
   si re si

   %94
   la do la
   sol si sol
   fad4.

   %97
   sol
   sol8 do, re
   sol,4 r8

   %100
   do'8 mi do
   si re si
   la do la

   %103
   sol si sol
   fad4.
   sol

   %106
   sol8 do, re
   sol,4 r8
   sol'8 sol, sol'  %%%% ripresa

   %109
   re re, re'
   sol,4 r8
   re'8 la' fad

   %112
   sol sol, r
   la' re, r\mbreak
   sol sol, r

   %115
   re' re re
   re re re
   sol do, re

   %118
   sol,4\fermata r8

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key sol\major
   \time 3/8
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 4. = 60
   s4.*118
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

\markup\huge "[1.] [Allegro] "

\score {
  {
    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"violin"
        \set Staff.instrumentName = \markup \center-column{"[Violino""in Tromba]"}
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

  }

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

\markup\huge "[2.] [Largo] Sempre pianis[sim]o anco il Violino Princ[ipal]e"

\score {
  {
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




