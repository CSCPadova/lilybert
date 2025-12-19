\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

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

ds = _\markup \italic \center-align \center-column{"D.C.""al Segno"}

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

IvlIn = \relative do'' {

   <mi la, mi la,>1^\markup\italic"Accordatura"
   \clef violin <<
      {
         la,8 [dod16 si dod8 la] la[dod16 si dod8 la]
         la[la'16 sold la8 mi] la,[la'16 sold la8 mi]

         %3
         la,[dod'16 si dod8 la] la,[dod'16 si dod8 la]
         la,[mi' fad16(mi) fad(mi)] re8[re mi16(re) mi(re)]
         dod8[mi fad16(mi) fad(mi)] re8[re mi16(re) mi(re)]
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s re s
         re s re s
         re s re s
         re s s2
         re4 s s2
      }\\{
         \stemDown sold,4 s sold s
         sold s sold s
         sold s sold s
         sold s s2
         sold4 s s2
      }
   >>

   <<
      {
         <<
            {

               %6
               dod'8 [dod re16(dod) re(dod)] dod8[dod re16(dod) re (dod)]
               la8[mi' fad16(mi) fad(mi)] mi8[mi fad16(mi) fad(mi)]
               la,8[la' si16(la) si(la)] la8[la si16(la) si(la)]

               %9
               la,8[dod' re16(dod) re(dod)] dod8[dod re16(dod) re(dod)]
            }\\{
               \stemUp \override Stem #'transparent = ##t re,,4 s re s
               re4 s s2
               re4 s s2
               re4 s s2
            }\\{
               \stemDown sold,4 s sold s
               sold s s2
               sold4 s s2
               sold4 s s2
            }
         >>
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \key la\major <<{dod'2^\markup\italic"manoscritto"~dod}\\{\stemUp \override Stem #'transparent = ##t re, re}\\{\stemDown sold, sold}>>
         <mi'' la, re, sold,>1
         <la la, re, sold,>
         <dod la, re, sold,>
      }
   >>

   <<dod4\\\stemUp \override Stem #'transparent = ##t la,\\\stemDown \override Stem #'transparent = ##t re,\\\stemDown sold,>> r16 la' dod la re(si) dod(la) re(si) dod(la)
   re, la' si dod re, la' si dod re(si) dod(la) re(si) dod(la)

   %12
   re, la' si dod re, re'-1 mi-3 fad-3 mi-2 dod-3 re, fad'-3 mi-2 dod^"?" re, mi'-2
   re-1 si-2 re, mi'-2 re-1 si-2 re, re'-3\mbreak dod-2 la-3 re, re'-3 dod-2 la-3 re, dod'-2
   si fad re dod' si fad re fad'-3 mi-2 dod-3 re, fad'-3 mi-2 dod-3 re, mi'

   %15
   re si re, mi' re si re, re' dod la re, re' dod la re, dod'
   si fad re dod' si fad re mi' la fad mi la si sold mi si'
   dod la  mi dod' re si mi, re' mi si sold mi \once\stemUp re, mi' sold si\mbreak

   %18
   mi si sold mi \once\stemUp re, mi' sold si mi si sold mi re,4
   la''16 la la la dod, dod dod dod fad fad fad fad re re re re
   si' si si si red, red red red sold sold sold sold mi mi mi mi

   %21
   dod' dod dod dod mid, mid mid mid la la la la fad fad fad fad
   re' re re re fad, fad fad fad <<
      {
         sold sold sold sold la la la la\mbreak
         sold sold sold sold la la la la sold sold sold sold la la la la

         %24
         sold4
      }\\{
         si,16 si si si dod dod dod dod
         si si si si dod dod dod dod si si si si dod dod dod dod
         si4
      }
   >> r8  si re, si' re, si'  %% inizio p.4

   dod sold, sold si' re, si' re, si'
   dod sold, sold dod' re[dod16 si mi8 re,]

   %27
   sold,4 r8 si' re, si' re, si'
   dod sold, sold si' re, si' re, si'
   dod sold, sold dod're[dod16 si mi8 re,]

   %30
   sold,4 r8 mi''8\solo la(mi dod) re\mbreak
   \appoggiatura mi re [dod16 si dod8 mi] la[si16 dod re8 dod]
   dod4\tr si8 mi, la (mi dod) re

   %33
   \appoggiatura mi re [dod16 si dod8 mi] la[si16 dod re8 dod]
   si4 r8 mi \once\stemUp re,,16 (mi' mi'8)  mi(re16 dod)
   \once\stemUp re,,16 (mi' re'8) re(dod16 si) \once\stemUp re,,16 (mi' dod'8) dod(si16 la)

   %36
   si(sold) la(fad) mi8 mi' \once\stemUp re,,16 (mi' mi'8) mi(re16 dod)
   \once\stemUp re,,16 (mi' re'8) re(dod16 si) \once\stemUp re,,16 (mi' dod'8) dod(si16 la)\mbreak
   si4 r16 mi, red mi fad mi red mi sold mi red mi

   %39
   la mi red mi si' mi, red mi dod'8 si~si16 mi, red mi
   fad mi red mi sold mi red mi la mi red mi si' mi, red mi
   dod'8 si4 mi8 red16 mi dod red si dod la si

   %42
   sold la fad sold mi fad red mi dod red si dod la si fad sold
   mi fad red? mi dod red si dod\mbreak \once\stemUp la8 la'' sold fad
   si16(sold) mi(sold) fad(mi red) fad mi8 si re, mi''-4

   %45
   red16-3 mi-4 dod red si dod la-3 si-4 sold la fad sold mi fad red mi
   dod red si dod la si fad la mi fad red? mi dod red si dod
   \once\stemUp la8 la'' sold fad si16(sold mi) sold fad(mi red) fad

   %48
   mi[mi mi mi  mi mi mi mi] dod[dod dod dod dod dod dod dod]
   fad[fad fad fad fad fad fad fad]\mbreak red[red red red red red red red]
   si'[si si si si si si si] sold4 r8 si,

   %51
   re, si' re, si' dod sold, sold dod'
   mi, dod' mi, dod' red la, la red'
   fad, red' fad, red' mi16 [fad sold fad mi8 dod]

   %54
   sold,4 la re16\solo fad (mi fad) re fad mi re
   si' red(dod red) si red dod si mi sold(fad sold) mi sold fad mi
   si'8 si, r4\mbreak si16[(mi32 fad sold16) fad] mi re dod si

   %57
   dod sold, sold sold si sold sold sold dod'[(fad32 sold la16) sold] fad mi red dod
   red la, la la dod la la la red'[(sold32 la si16) la] sold fad mi red
   mi si, si si re? si si si mi'[la32 (si dod16) si] la sold fad mi  % Anna Maria I bar 2a ruga p, 2 OK

   %60
   red[fad32 (mi red16) fad] si[fad32 (mi red16) fad] si dod red dod si la sold fad
   mi[sold32 (fad mi16) sold] si[sold32 (fad mi16) sold] dod re mi red dod si la sold
   fad[la32 (sold fad16) la] dod[la32 (sold fad16) la] red mi fad mi red dod si la

   %63
   sold[si32 (la sold16) si] red[si32 (la sold16) si] mi[fad sold fad mi re? dod si]
   la[dod32 (si la16) dod] mi[dod32 (si la16) dod] fad sold la sold fad sold fad mi
   fad(mi fad) sold fad sold fad mi red mi fad mi red fad mi red

   %66
   mi(red mi) fad mi fad mi red\mbreak dod red mi red dod mi red dod
   red(dod red) mi red mi red dod sid(dod red) dod sid fad sid red
   dod(red mi) red dod sold dod mi sid(dod red) dod sid fad sid red

   %69
   dod(red mi) red dod sold dod red sid[red,\tu red red red red red red]
   mi[mi mi  mi mi mi mi mi] red[red red red red red red red]
   red?[red red red red red red red]\mbreak dod4 r8 mi\solo

   %72
   la8(mi dod) re \appoggiatura mi re [dod16 si dod8 mi]
   la[si16 dod re8 dod] dod4\tr si8 mi,
   la (mi dod) re \appoggiatura mi re [dod16 si dod8 mi]

   %75
   la[si16 dod re8 dod] si16 sold mi sold re, sold' mi sold
   <<
      {
         la,8 [dod16\tu si dod8 la] la[dod16 si dod8 la]
         la[la'16 sold la8 mi] la,[la'16 sold la8 mi]

         %78
         la,[dod'16 si dod8 la] la,[dod'16 si dod8 la]
         la, mi' [fad16(mi) fad(mi)] re8 re mi16(re) mi(re)
         dod8 mi [fad16(mi) fad(mi)] re8 re mi16(re) mi(re)
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s re s
         re s re s
         re s re s
         re s s2
         re4 s s2
      }\\{
         \stemDown sold,4 s sold s
         sold s sold s
         sold s sold s
         sold s s2
         sold4 s s2
      }
   >>

   %81
   <<{dod'16 la dod re}\\\stemUp \override Stem #'transparent = ##t re,4\\\stemDown sold,>> mi''16 dod si la \once\stemUp re, mi' sold la si sold fad mi
   \once\stemUp sold,, la' dod re mi dod si la \once\stemUp re, mi' sold la si sold fad mi
   \once\stemUp sold,, la' dod re mi dod si la re,(si' sold') si, re,(dod' la') dod,

   %84
   re,(re' si') re, re,(dod' la') dod, re, (si' sold') si, re,(dod' la') dod,\mbreak
   re,(re' si') re, re,(dod' la') dod, <<
      {
         re,(si' sold') si, re,(si' sold') si,
         \once\stemUp re,(sold' mi') sold, \once\stemUp re,(sold' mi') sold, \once\stemUp re,(fad' mi') fad, \once\stemUp re,(fad' mi') fad,

         %87
         \once\stemUp re,(fad' re') fad, \once\stemUp re,(fad' re') fad, \once\stemUp re,(sold' re') sold, \once\stemUp re,(sold' re') sold,
         \once\stemUp re,(la'' re) la \once\stemUp re,,(la'' re) la \once\stemUp re,,(la'' dod) la \once\stemUp re,,(la'' dod) la
         \once\stemUp re,,(sold' si) sold \once\stemUp re,(la'' dod) la \once\stemUp re,,(si'' re) si \once\stemUp re,,(la'' dod) la

         %90
         \once\stemUp re,,(sold' si) sold \once\stemUp re,(la'' dod) la \once\stemUp re,,(si'' re) si \once\stemUp re,,(la'' dod) la
         \once\stemUp re,,(sold' si) sold \once\stemUp re,(sold' si) sold \once\stemUp re,(dod'' la') dod, \once\stemUp re,,(dod'' la') dod,
         \once\stemUp re,,(si'' la') si, \once\stemUp re,,(si'' la') si, \once\stemUp re,,(si'' sold') si, \once\stemUp re,,(si'' sold') si,

         %93
         \once\stemUp re,,(la'' sold') la, \once\stemUp re,,(la'' fad') la, \once\stemUp re,,(sold' fad') sold, \once\stemUp re,(sold' mi') sold,
         \once\stemUp re,(fad' mi') fad, \once\stemUp re,(fad' re') fad, \once\stemUp re,(mi' re') mi, \once\stemUp re,(mi' dod') mi,
         re,(re' dod') re, re,(re' si') re, re, (dod' si') dod, re,(dod' la') dod,

         %96
         re,(si' sold') si, re,(do' la') do, re,(re' si') re, re,(do' la') do,
         re,(si' sold') si, re,(do' la') do, re,(re' si') re, re,(do' la') do,
         re,(si' sold') si, re,(si' sold') si, re,(re' fa) re re,(re' fa) re

         %99
         re,(re' sold) re re,(re' sold) re re,(do' la') do, re,(do' la') do,
         re,(red' la') red, re,(red' la') red, re,(mi' la) mi re,(mi' la) mi
         re,(mi' sold) mi re,(mi' sold) mi
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         \key la\major <<{sold2^\markup\italic"manoscritto"}\\\stemUp \override Stem #'transparent = ##t si,\\\stemDown re,>>
         <<
            {
               mi''2~mi
               re~re~
               re dod
               si4 dod re dod
               si dod re dod
               re2 la'~
               la sold~
               sold4 fad2 mi4~
               mi re2 dod4~
               dod si2 la4
               sold la si la
               sold la si la
               sold2 fa
               sold la~
               la~la
               sold
            }\\{
               \stemDown \override Stem #'transparent = ##f sold fad~
               fad sold
               la~la
               sold4 la si la
               sold la si la
               sold2 dod
               si~si
               la sold
               fad mi
               re dod
               si4 do re do
               si do re do
               si2 re
               re do
               red mi
               mi
            }\\{
               \tieDown re,1~
               re~
               re~
               re~
               re~
               re~
               re~
               re~
               re~
               re~
               re~
               re~
               re~
               re~
               re~
               \stemDown re2
            }
         >>


      }
   >> re16(re' sold) la si fa mi re

   %102
   re,(re' sold) la si fa mi re re,(re' sold) la si fa mi re
   dod si dod la si4\tr

   <<
      {
         la8 [dod16\tu si dod8 la]
         la[dod16 si dod8 la] la[la'16 sold la8 mi]

         %105
         la,[la'16 sold la8 mi] la,[dod'16 si dod8 la]
         la,[dod'16 si dod8 la] la,4
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s
         re s re s
         re s re s
         re s re4
      }\\{
         \stemDown sold,4 s
         sold s sold s
         sold s sold s
         sold s sold4
      }
   >>

   r8 si'
   re, si' re, si' dod sold, sold si'

   %108
   re, si' re, si' dod sold, sold dod'
   re[dod16 si mi8 re,] sold,4 r8 si'
   re, si' re, si' dod sold, sold si'

   %111
   re, si' re, si' dod sold, sold dod'
   re[dod16 si mi8 re,] sold,2\fermata

}

IvlIIn = \relative do'' {

   <mi la, mi la,>1
   \clef violin <<
      {
         la,8 [dod16 si dod8 la] la[dod16 si dod8 la]
         la[la'16 sold la8 mi] la,[la'16 sold la8 mi]

         %3
         la,[dod'16 si dod8 la] la,[dod'16 si dod8 la]
         la,[mi' fad16(mi) fad(mi)] re8[re mi16(re) mi(re)]
         dod8[mi fad16(mi) fad(mi)] re8[re mi16(re) mi(re)]
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s re s
         re s re s
         re s re s
         re s s2
         re4 s s2
      }\\{
         \stemDown sold,4 s sold s
         sold s sold s
         sold s sold s
         sold s s2
         sold4 s s2
      }
   >>

   <<
      {

         %6
         dod'8^\markup\italic"v. Violino I" [dod re16(dod) re(dod)] dod8[dod re16(dod) re (dod)]
         la8[mi' fad16(mi) fad(mi)] mi8[mi fad16(mi) fad(mi)]
         la,8[la' si16(la) si(la)] la8[la si16(la) si(la)]

         %9
         la,8[dod' re16(dod) re(dod)] dod8[dod re16(dod) re(dod)]
      }\\{
         \stemUp \override Stem #'transparent = ##t re,,4 s re s
         re4 s s2
         re4 s s2
         re4 s s2
      }\\{
         \stemDown sold,4 s sold s
         sold s s2
         sold4 s s2
         sold4 s s2
      }
   >>

   <<dod''4\\\stemUp \override Stem #'transparent = ##t la,\\\stemDown \override Stem #'transparent = ##t re,\\\stemDown sold,>> r4 r2
   R1*8

   %19
   la''16 la la la dod, dod dod dod fad fad fad fad re re re re
   si' si si si red, red red red sold sold sold sold mi mi mi mi

   %21
   dod' dod dod dod mid, mid mid mid la la la la fad fad fad fad
   re' re re re fad, fad fad fad <<
      {
         sold sold sold sold la la la la\mbreak
         sold sold sold sold la la la la sold sold sold sold la la la la

         %24
         sold4
      }\\{
         si,16 si si si dod dod dod dod
         si si si si dod dod dod dod si si si si dod dod dod dod
         si4
      }
   >> r8  si re, si' re, si'  %% inizio p.4

   dod sold, sold si' re, si' re, si'
   dod sold, sold dod' re[dod16 si mi8 re,]

   %27
   sold,4 r8 si' re, si' re, si'
   dod sold, sold si' re, si' re, si'
   dod sold, sold dod're[dod16 si mi8 re,]

   %30
   sold,4 r r2\mbreak
   R1*17

   %48
   mi''16[mi mi mi  mi mi mi mi] dod[dod dod dod dod dod dod dod]
   fad[fad fad fad fad fad fad fad]\mbreak red[red red red red red red red]
   si'[si si si si si si si] sold4 r8 si,

   %51
   re, si' re, si' dod sold, sold dod'
   mi, dod' mi, dod' red la, la red'
   fad, red' fad, red' mi16 [fad sold fad mi8 dod]

   %54
   sold,4 la re r
   R1*14
   r2 red'16[red red red red red red red]

   %70
   mi[mi mi  mi mi mi mi mi] red[red red red red red red red]
   red?[red red red red red red red]\mbreak dod4 r
   R1*4

   %76
   <<
      {
         la8 [dod16 si dod8 la] la[dod16 si dod8 la]
         la[la'16 sold la8 mi] la,[la'16 sold la8 mi]

         %78
         la,[dod'16 si dod8 la] la,[dod'16 si dod8 la]
         la, mi' [fad16(mi) fad(mi)] re8 re mi16(re) mi(re)
         dod8 mi [fad16(mi) fad(mi)] re8 re mi16(re) mi(re)
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s re s
         re s re s
         re s re s
         re s s2
         re4 s s2
      }\\{
         \stemDown sold,4 s sold s
         sold s sold s
         sold s sold s
         sold s s2
         sold4 s s2
      }
   >>

   %81
   <<dod'4\\\stemUp \override Stem #'transparent = ##t re,4\\\stemDown sold,>> r r2
   R1*21
   r2  <<
      {
         la'8 [dod16 si dod8 la]
         la[dod16 si dod8 la] la[la'16 sold la8 mi]

         %105
         la,[la'16 sold la8 mi] la,[dod'16 si dod8 la]
         la,[dod'16 si dod8 la] la,4
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s
         re s re s
         re s re s
         re s re4
      }\\{
         \stemDown sold,4 s
         sold s sold s
         sold s sold s
         sold s sold4
      }
   >>

   r8 si'
   re, si' re, si' dod sold, sold si'

   %108
   re, si' re, si' dod sold, sold dod'
   re[dod16 si mi8 re,] sold,4 r8 si'
   re, si' re, si' dod sold, sold si'

   %111
   re, si' re, si' dod sold, sold dod'
   re[dod16 si mi8 re,] sold,2\fermata

}

IvlIIIn =  \relative do'' {

   <mi la, mi la,>1
   \clef violin <<
      {
         la,8 [dod16 si dod8 la] la[dod16 si dod8 la]
         la[mi'16 re mi8 dod] la[mi'16 re mi8 dod]

         %3
         la[la'16 sold la8 mi] la,[la'16 sold la8 mi]
         la, dod[re16(dod) re(dod)] si8[si dod16(si) dod(si)]
         la8 dod[re16(dod) re(dod)] si8[si dod16(si) dod(si)]
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s re s
         re s re s
         re s re s
         re s s2
         re4 s s2
      }\\{
         \stemDown sold,4 s sold s
         sold s sold s
         sold s sold s
         sold s s2
         sold4 s s2
      }
   >>

   <<
      {
         <<
            {

               %6
               la'8[la si16 (la) si(la)]  la8[la si16 (la) si(la)]
               dod8[dod re16(dod) re(dod)]dod8[ dod re16(dod) re(dod)]
               la8[mi' fad16(mi) fad(mi)] mi8[mi fad16(mi) fad(mi)]

               %9
               la,8[la' si16(la) si(la)] la8[la si16(la) si(la)]
            }\\{
               \stemUp \override Stem #'transparent = ##t re,,4 s re s
               re4 s s2
               re4 s s2
               re4 s s2
            }\\{
               \stemDown sold,4 s sold s
               sold s s2
               sold4 s s2
               sold4 s s2
            }
         >>
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"second" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \key la\major <<{la'2^\markup\italic"manoscritto"~la}\\{\stemUp \override Stem #'transparent = ##t re, re}\\{\stemDown sold, sold}>>
         <dod' re, sold,>1
         <mi la, re, sold,>
         <la la, re, sold,>
      }
   >>

   <<la4\\\stemUp \override Stem #'transparent = ##t la,\\\stemDown \override Stem #'transparent = ##t re,\\\stemDown sold,>> r4 r2
   R1*8

   %19
   mi''16 mi mi mi la, la la la la la la la mi mi mi mi
   fad' fad fad fad si, si si si si si si si sold sold sold sold
   sold' sold sold sold dod, dod dod dod dod dod dod dod la la la la

   %22
   la' la la la re, re re re <<
      {
         re re re re dod dod dod dod
         re re re re dod dod dod dod re re re re dod dod dod dod
         re4
      }\\{
         re,16 re re re re re re re
         re re re re re re re re re re re re re re re re
         re4
      }
   >> r8 si' re, si' re, si'  %% inizio p.4
   dod sold, sold si' re, si' re, si'
   dod sold, sold dod' re[dod16 si mi8 re,]

   %27
   sold,4 r8 si' re, si' re, si'
   dod sold, sold si' re, si' re, si'
   dod sold, sold dod're[dod16 si mi8 re,]

   %30
   sold,4 r r2\mbreak
   R1*17
   si'16[si si si si si si si] la[la la la la la la la]

   %49
   dod[dod dod dod dod dod dod dod]\mbreak  si[si si si si si si si]
   red[red red red red red red red] mi4 r8 si

   %51
   re, si' re, si' dod sold, sold dod'
   mi, dod' mi, dod' red la, la red'
   fad, red' fad, red' mi16 [fad sold fad mi8 dod]

   %54
   sold,4 la re r
   R1*14
   r2 sid'16 [sid sid sid sid sid sid sid]

   %70
   dod[dod dod dod dod dod dod dod] dod[dod dod dod dod dod dod dod]
   sid [sid sid sid sid sid sid sid]\mbreak dod4 r
   R1*4

   %76
   <<
      {
         la8 [dod16 si dod8 la] la[dod16 si dod8 la]
         la[mi'16 re mi8 dod] la[mi'16 re mi8 dod]
         la[la'16 sold la8 mi] la,[la'16 sold la8 mi]

         %79
         la, dod[re16(dod) re(dod)] si8[si dod16(si) dod(si)]
         la8 dod[re16(dod) re(dod)] si8[si dod16(si) dod(si)]
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s re s
         re s re s
         re s re s
         re s s2
         re4 s s2
      }\\{
         \stemDown sold,4 s sold s
         sold s sold s
         sold s sold s
         sold s s2
         sold4 s s2
      }
   >>

   <<dod'4\\\stemUp \override Stem #'transparent = ##t re,4\\\stemDown sold,>> r r2

   %82
   R1*21
   r2 <<
      {
         la'8 [dod16 si dod8 la] la[dod16 si dod8 la]
         la[mi'16 re mi8 dod] la[mi'16 re mi8 dod]

         %105
         la[la'16 sold la8 mi] la,[la'16 sold la8 mi]
         la,4
      }\\{
         \stemUp \override Stem #'transparent = ##t re,4 s re s
         re s re s
         re s re s
         re4
      }\\{
         \stemDown sold,4 s sold s
         sold s sold s
         sold s sold s
         sold4
      }
   >> r8 si'
   re, si' re, si' dod sold, sold si'

   %108
   re, si' re, si' dod sold, sold dod'
   re[dod16 si mi8 re,] sold,4 r8 si'
   re, si' re, si' dod sold, sold si'

   %111
   re, si' re, si' dod sold, sold dod'
   re[dod16 si mi8 re,] sold,2\fermata

}

Ivlan = \relative do' {

   s1
   dod4 r dod r
   dod4 r dod r
   dod4 r dod r
   dod r r2
   dod4 r r2\mbreak
   dod8 re mi dod dod re mi dod
   dod8 re mi dod dod re mi dod
   dod8 re mi dod dod re mi dod
   dod8 re mi dod dod re mi dod
   dod4 r r2
   R1*8
   dod8 dod mi[mi]
   re re la[la]
   red red fad[fad] mi mi si[si]
   mid mid sold[sold] fad fad dod[dod]
   fad fad la la si si la[la]\mbreak
   si si la[la] si si la[la]
   si4 r8 si mi, si' mi, si'

   %25
   dod la, la si' mi, si' mi, si'
   dod la, la dod' re[dod16 si mi8 mi,]
   la,4 r8 si' mi, si' mi, si'

   %28
   dod la, la si' mi, si' mi, si'
   dod  la, la dod' re[dod16 si mi8 mi,]
   la,4 r r2

   %31
   R1*17
   sold'8 sold sold sold mi mi mi mi
   la la la la\mbreak fad fad fad fad

   %50
   fad fad red red si4 r8 si'
   mi, si' mi, si' dod la, la dod'

   %52
   fad, dod' fad, dod' red si, si red'
   sold, red' sold, red'  mi16[fad sold fad mi8 dod]
   la,4 si  mi4 r

   %55
   R1*14
   r2 sold8 sold sold sold
   sold sold sold sold sold sold sold sold

   %71
   sold sold sold sold\mbreak sold4 r
   R1*4
   dod,4 r dod r

   %77
   dod r dod r
   dod r dod r\mbreak
   dod r r2

   %80
   dod4 r r2
   dod4 r r2
   R1*21

   %103
   r2 dod4 r
   dod r dod r\mbreak
   dod r dod r

   %106
   dod r dod r8 si'
   mi, si' mi, si' dod la, la si'
   mi, si' mi, si' dod la, la dod'

   %109
   re[dod16 si mi8 mi,] la,4 r8 si'
   mi, si' mi, si' dod la, la si'
   mi, si' mi, si' dod la, la dod'

   %112
   re[dod16 si mi8 mi,] la,2\fermata

}

Ibcn = \relative do {

   s1
   la4 r la r
   la r la r
   la r la r

   %4
   la r r2
   la4 r r2\mbreak
   la'8 si dod la la, si dod la

   %7
   la'8 si dod la la, si dod la
   la'8 si dod la la, si dod la
   la'8 si dod la la, si dod la

   %10
   la4 r r2
   la4 la r2
   la4 la la la

   %13
   si sold\mbreak la la
   mi' mi, la la
   si sold la la

   %16
   mi' mi, r2
   r mi'4 r\mbreak
   mi r mi r

   %19
   dod8 dod dod dod re re re re
   red red red red mi mi mi mi
   mid mid mid mid fad fad fad fad

   %22
   fad fad fad fad mi mi mi mi\mbreak
   mi [mi] mi mi mi mi mi mi
   mi4 r8 si' mi, si' mi, si'

   %25
   dod la, la si' mi, si' mi, si'
   dod la, la dod' re[dod16 si mi8 mi,]
   la,4 r8 si' mi, si' mi, si'

   %28
   dod la, la si' mi, si' mi, si'
   dod la, la dod' re[dod16 si mi8 mi,]
   la, si dod si la4. re8\mbreak

   %31
   mi4 la,8 si dod[si16 la si8 la]
   mi' fad sold mi dod4 la8 re
   mi4 la,8 si dod[si16 la si8 la]

   %34
   mi' fad sold fad mi4 mi
   mi mi mi mi
   mi mi mi mi

   %37
   mi mi mi mi\mbreak
   mi8 fad sold mi red si mi si
   fad' si, sold' si, la'[sold16 fad sold8 mi]

   %40
   red si mi si fad' si, sold' si,
   la'[sold16 fad sold8 mi] si2\tasto~
   si1~

   %43
   si2~si8 si dod red
   mi sold si si, mi fad sold mi
   si1\tasto~

   %46
   si~
   si8 si dod red mi sold si si,
   mi mi mi  mi la, la la la

   %49
   la la la la\mbreak si si si si
   si si si si mi4 r8 si'
   mi, si' mi, si' dod la, la dod'

   %52
   fad, dod' fad, dod' red si, si red'
   sold, red' sold, red' \clef tenor mi16[fad sold fad mi8 dod]
   \clef bass la,4 si mi8 mi mi mi

   %55
   red red red red dod dod dod dod
   si si' la la\mbreak sold sold sold sold
   la16 la, la la dod la la la la8 la la la

   %58
   si16 si si si red si si si si8 si si si
   dod16 dod dod dod mi dod dod dod dod8 dod dod dod
   si' si la la sold sold sold sold

   %61
   sold sold sold sold\mbreak la la la la
   la la la la si si si si
   si si si si dod dod dod dod

   %64
   dod dod dod dod red red red red
   red? red red red si si si si
   dod dod dod  dod\mbreak la la la la

   %67
   fad fad fad fad sold sold sold sold
   dod, dod dod dod sold' sold sold sold
   dod, dod dod dod sold' sold sold sold

   %70
   dod, dod dod dod sold' sold sold sold
   sold, sold sold sold\mbreak dod re dod si
   la4. re8 mi4 la,8 si

   %73
   dod[si16 la si8 la] mi' fad sold mi
   dod4 la8 re mi4 la,8 si
   dod[si16 la si8 la] mi'4 r

   %76
   la, r la r
   la r la r
   la r la r\mbreak

   %79
   la r r2
   la4 r r2
   la4 r mi' r

   %82
   la,4 r mi' r
   la,4 r mi'2\tasto~
   mi1~\mbreak

   %85
   mi~
   mi~
   mi~

   %88
   mi~
   mi~
   mi~

   %91
   mi~
   mi~
   mi~

   %94
   mi~
   mi~
   mi~

   %97
   mi~
   mi~
   mi~

   %100
   mi~
   mi2 mi4 r
   mi r mi r

   %103
   la, mi' la, r
   la r la r\mbreak
   la r la r

   %106
   la r la r8 si'
   mi, si' mi, si' dod la, la si'
   mi, si' mi, si' dod la, la dod'

   %109
   re[dod16 si mi8 mi,] la,4 r8 si'
   mi, si' mi, si' dod la, la si'
   mi, si' mi, si' dod la, la dod'

   %112
   re[dod16 si mi8 mi,] la,2\fermata

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key la\major
   \time 4/4
   \tempo 4 = 70
   s1
   \key la\major
   \set Score.currentBarNumber = #1
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
  \tupletSpan 16

}

IIvlIn = \relative do'' {

   dod8. si16 la8
   mi'8\noBeam~\con \tuplet 3/2 { mi32 re(dod re[dod si] dod si la dod[si la)] }
   la'16.[(si32)] si8.\tr(la32 si)

   %4
   <<{dod8. si16 la8}\\\stemUp \override Stem #'transparent = ##t mi4\\\stemUp \override Stem #'transparent = ##t re,\\\stemDown sold,>>
   mi'''32[re(dod) si(la) sold(fad) mi(red) dod(si) la]
   la,16[si'] si8.\tr(la32 si)

   %7
   dod32[(si la si dod red mi fad64 sold] la16 fad)
   red32[(dod si dod red mi fad sold64 la] si16 la)
   sold32(si sold mi) si[(mi si fad)]re(fad re si)\mbreak

   %10
   sold(fad' mi re) la[(sold' fad mi)] <<{mi16.\tr re32}\\\override Flag.style = #'no-flag la8>>
   re4.
   <<{sold'8. fad16 mi8}\\\stemUp \override Stem #'transparent = ##t si4\\\stemDown re,>>

   %13
   si''8\noBeam~\tuplet 3/2 { si32( la sold la[sold fad] sold fad mi sold[fad mi)] }
   mi'16.(re32) re8.\tr[(dod32 re)]
   dod8\noBeam~\tuplet 3/2 { dod32(mi re dod[re mi] la, si dod mi,[fad sold)] }

   %16
   fad8\noBeam ~\tuplet 3/2 { fad32(la sold fad[sold la] la sold fad mi[red dod)] }
   sid16[la'] <<{sold8(\slurDown  fad16\tr)(mi32 fad)}\\sid,4>>
   <<{mi8\noBeam~	mi}\\{dod  dod32 [\slurUp sold' (dod sold]mi dod fad, dod')}>>\mbreak

   %19
   \tuplet 3/2 { mi32(sold fad mi[red dod] dod' sold fad mi[red dod)] } <<{red16. dod32}\\\override Flag.style = #'no-flag fad,8>>
   <<mi'4\\\stemUp \override Stem #'transparent = ##t dod\\\stemDown fad,>> r8
   <<{dod'8. si16 la8}\\\stemUp \override Stem #'transparent = ##t re,4\\\stemDown sold,>>

   %22
   mi''8\noBeam~\con \tuplet 3/2 { mi32 re(dod re[dod si] dod si la dod[si la)] }
   la'16.[(si32)] si8.\tr(la32 si)
   <<{dod8. si16 la8}\\\stemUp \override Stem #'transparent = ##t mi4\\\stemUp \override Stem #'transparent = ##t re,\\\stemDown sold,>>

   %25
   \tuplet 3/2 { re'32 la' (si dod[si la)] re,  la' (si dod[si la)] } fa8\tr
   mi8\noBeam~\tuplet 3/2 { mi32 mi (fad sold[fad mi)] si' si (dod re[dod si)] }
   \tuplet 3/2 { fad' fad(mi re[dod si)] mi, fad'(mi re[dod si)] } la8\tr

   %28
   fad\noBeam ~fad32 re(fad si re [sold si) re,]
   re,8\noBeam ~re32 re(fad si re [sold si) re,]
   \tuplet 3/2 { re(dod si re[dod si] dod si la } la'[la,] <<{si16.\tr la32}\\\override Flag.style = #'no-flag re,8>>

   %31
   <<la'4.\fermata \\\stemUp \override Stem #'transparent = ##t re,\\\stemDown sold,>>

   }

IIbcn = \relative do {

   la8 la'16 sold fad8
   mi4 la8
   dod,16 re mi8 mi,

   %4
   la4.
   la
   si8 sold4

   %7
   la4.
   si
   mi\mbreak

   %10
   la,8 si4
   mi,4.
   mi8 mi'16 red dod8

   %13
   si4 mi8
   sold mi sold
   la4.~

   %16
   la
   sold8 sid,4
   dod4.\mbreak

   %19
   dod4 sold8
   dod8. re16 dod si
   la8 la'16 sold fad8

   %22
   mi4 la8
   dod,16 re mi8[mi,]
   la4.

   %25
   dod
   re
   re4 red8\mbreak

   %28
   mi4.~
   mi
   la,4 mi'8

   %31
   la,4._\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\major
  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 60
  s4.*11
  \bar":..:"\break
  s4.*20
  \bar":|."


}

IIvlI = {
  \IIglobal
   \notypeset
  <<\IIvlIn \forma>>

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

IIIvlIn = \relative do'' {

  sold,8 re' sold, re' sold, re'
  sold, dod'16 re mi re(dod re) mi re(dod re)
  mi8 re, sold, re' sold, re'

  %4
  sold, dod'16 re mi re(dod re) mi re(dod re)
  si8 si re, si' re, si'
  \once\stemUp re, si''16 dod re dod(si dod) re dod(si dod)

  %7
  \stemDown re8 \stemUp si, re, si' re, si'\stemNeutral
  \once\stemUp re, si''16 dod re dod (si dod) re (dod si) re
  dod la, la la re, re re re la' la la la\mbreak

  %10
  si si si si re, re re re si' si si si
  dod dod dod dod re, re re re dod' dod dod dod
  re re re re re, re re re re' re re re

  %13 OOKK
  <<{dod8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  mi''8 dod la' mi dod' la\mbreak
  <<{dod,8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>

  %16
  mi''8 dod la' mi dod' la
  la sold16 fad mi fad mi re dod re dod si
  la8 la' dod, la' re,, sold'

  %19
  \once\stemUp sold,,16\solo dod' re dod mi dod re dod re, dod' re dod\mbreak
  \once\stemUp sold, dod' re dod mi dod re dod re, dod' re dod
  \once\stemUp sold, mi'' fad mi la mi fad mi \once\stemUp re, mi' fad mi

  %22
  \once\stemUp sold,, mi'' fad mi la mi fad mi \once\stemUp  re, mi' fad mi
  \once\stemUp sold,, la'' si la dod la si la \once\stemUp re,, la'' si la
  \once\stemUp sold,, la'' si la dod la si la \once\stemUp re,, la'' si la

  %25
  \once\stemUp sold,, dod'' re dod mi dod re dod \once\stemUp re,, dod'' re dod
  \once\stemUp sold,, dod'' re dod mi dod re dod\once\stemUp  re,, dod'' re dod
  \once\stemUp sold,,8 la'' la4.\tr(sold16 la)\mbreak  %% fine p. 12

  %28
  si la si mi, dod' si dod mi, re' dod re mi,
  mi' re mi mi, fad' mi fad mi, sold' fad sold mi,
  la' dod, si dod \once\stemUp re,, dod'' si dod la' dod, si dod

  %31
  la' dod, si dod \once\stemUp re,, dod'' si dod la' dod, si dod
  la' si, la si \once\stemUp re,, si'' la si la' si, la si
  sold' si, la si \once\stemUp re,, si'' la si sold' si, la si

  %34
  sold' la, sold la \once\stemUp re,, la'' sold la sold' la, sold la
  fad' la, sold la \once\stemUp re,, la'' sold la fad' la, sold la
  fad' sold, fad sold \once\stemUp re, sold' fad sold fad' sold, fad sold

  %37
  mi' sold, fad sold \once\stemUp re, sold' fad sold mi' sold, fad sold\mbreak
  mi' sold, fad sold \once\stemUp re, sold' fad sold mi' sold, fad sold  %%%%%%%%%   OK
  mi' fad, mi fad re, fad' mi fad mi' fad, mi fad

  %40
  mi' fad, mi fad re, fad' mi fad mi' fad, mi fad
  red' fad, mi fad si fad mi fad red' fad, mi fad
  si fad mi fad red' fad, mi fad si fad mi fad

  %43
  mi'8 red16 dod si dod si la sold la sold fad
  mi sold si mi mi, sold si mi mi, sold si mi
  <<mi,4\\{re,8 si' re, si' re, si'}>>

  %46
  \once\stemUp re, sold'16 la si la(sold la) si la(sold la)\mbreak
  si8 si, re, si' re, si'
  \once\stemUp re, sold'16 la si la(sold la) si (la sold) si

  %49
  \once\stemDown la8 mi, la, mi' la, mi'
  \once\stemUp la, fad''16 sold la sold(fad sold) la (sold fad) sold
  \once\stemDown la8 mi, la, mi' la, mi'

  %52
  \once\stemUp la, fad''16 sold la sold(fad sold) la (sold fad) la
  sold mi mi mi si si si si mi mi mi mi
  fad fad fad fad si, si si si fad' fad fad fad

  %55
  sold sold sold sold si, si si si sold' sold sold sold
  la la la la si, si si si la' la la la
  <<{sold8 sold sold sold sold sold}\\{\stemUp \override Stem #'transparent = ##t si, si si si si si}\\{\stemDown re, re re re re re}>>\mbreak

  %58
  <<sold'4 \\\stemUp \override Stem #'transparent = ##t si,\\{\stemDown mi,8 mi' si mi la,, red'}>>
  mi\solo si' (sold fad mi sold)
  fad red (dod si fad' la)

  %61
  sold si (sold fad mi sold)
  fad8.[mi16(red8.) dod16](si4)
  si'16(la sold fad) sold(fad  mi re) mi(re dod si)

  %64
  sold,  [la si dod re mi fad sold] sold,8\noBeam r
  dod''16(si la sold) la(sold fad mi) fad(mi re dod)
  la,[si dod re mi fad sold la] la,8 r

  %67
  re''16(dod si la) si(la sold fad) sold(fad mi re)\mbreak %% fine p 14/17
  si,[dod re mi fad la si dod] si,8 r
  mi''16(re dod si) dod(si la sold) la(sold fad mi)

  %70
  red(fad red) la red(fad red) la red(fad red) la
  mi''(re dod si) dod(si la sold) la(sold fad mi)
  red(fad red) la red(fad red) la red(fad red) la

  %73
  sold'(si sold) mi sold(si sold) mi sold(si sold) mi
  la si la sold fad sold fad mi red mi red dod
  red8 la'(sold fadd sold sid)\mbreak

  %76
  dod sold(fad mid fad lad)
  si fad (mi red mi sold)
  la mi(red dod red fad)

  %79
  sold red(dod sid dod mi)
  \tupletSpan 4 \tuplet 3/2 { fad8[(la sold] fad sid lad sold[red' dod)] }
  sid16(dod red) fad, sid(dod red) fad, sid(dod red) fad,

  %82
  mid8(fad16 sold) \appoggiatura sold8 fad4.\tr mid8
  lad16(si dod) mi,  lad(si dod) mi, lad(si dod) mi,
  red8(mi16 fad) \appoggiatura fad8 mi4.\tr red8\mbreak

  %85
  sold16(la si ) re, sold16(la si ) re, sold16(la si ) re,
  dod8(re16 mi) \appoggiatura mi8 re4.\tr dod8
  fad16(sold la) dod, fad(sold la) dod,  fad(sold la) dod,

  %88
  sid dod(red) mi(fad) mi(red) dod(sid) la'(sold) fad(
  mi) red(dod) sid(dod) red(mi) fad(sold) mi(red) dod(
  la') fad(sold la) sid,4.\tr dod8

  %91
  <<dod4\\{\stemUp\shiftOn si,8 fad' si, fad' si, fad'}>>
  \once\stemUp si,8 mi'16 fad sold fad(mi fad) sold fad(mi fad)\mbreak
  \once\stemDown sold8 fad, si, fad' si, fad'

  %94
  \once\stemUp si,8 mi'16 fad sold fad(mi fad) sold fad(mi fad)
  sold sold sold sold mi mi mi mi sold sold sold sold
  la la la la fad fad fad fad la la la la

  %97
  fad fad fad fad red red red red fad fad fad fad
  sold sold sold sold mi mi mi mi sold sold sold sold
  mi mi mi mi dod dod dod dod mi mi mi mi

  %100
  fad fad fad fad re re re re fad fad fad fad
  re re re re si si si si re re re re\mbreak
  dod dod dod dod re, re re re dod' dod dod dod

  %103
  re re re re re, re re re re' re re re
  dod dod dod dod re, re re re dod' dod dod dod
  si(re dod si) si'8.\tr ([si16) la sold fad mi]

  %106
  dod(mi re dod) dod'8.\tr[(si16) la sold fad mi]
  re(fad mi re) re'8.[(dod16) si la sold fad]
  mi(fad mi re) mi'8 re16 dod re8 dod16 si

  %109
  dod8 si16 la si8 la16 sold la8 sold16 fad
  sold4~sold8 fad16 mi re8 dod16 si\mbreak
  dod8 si16 la <<si2\tr\\re,_\fermata>>

  %112
  la'16 la la la re, re re re la' la la la
  si si si si re, re re re si' si si si
  dod dod dod dod re, re re re dod' dod dod dod

  %115
  re re re re re, re re re re' re re re
  <<{dod8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  mi''8 dod la' mi dod' la\mbreak

  %118
  <<{dod,8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  mi''8 dod la' mi dod' la
  la sold16 fad mi fad mi re dod re dod si

  %121
  la8 la' dod, la' re,, sold'
  la2.\fermata

}

IIIvlIIn = \relative do'' {

  sold,8 re' sold, re' sold, re'
  sold, dod'16 re mi re(dod re) mi re(dod re)
  mi8 re, sold, re' sold, re'

  %4
  sold, dod'16 re mi re(dod re) mi re(dod re)
  si8 si re, si' re, si'
  \once\stemUp re, si''16 dod re dod(si dod) re dod(si dod)

  %7
  \stemDown re8 \stemUp si, re, si' re, si'\stemNeutral
  \once\stemUp re, si''16 dod re dod (si dod) re (dod si) re
  dod la, la la re, re re re la' la la la\mbreak

  %10
  si si si si re, re re re si' si si si
  dod dod dod dod re, re re re dod' dod dod dod
  re re re re re, re re re re' re re re

  %13 OOKK
  <<{dod8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  mi''8 dod la' mi dod' la\mbreak
  <<{dod,8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>

  %16
  mi''8 dod la' mi dod' la
  la sold16 fad mi fad mi re dod re dod si
  la8 la' dod, la' re,, sold'

  %19
  sold,,4 r r\mbreak
  R2.*25
  re'8 si' re, si' re, si'

  %46
  \once\stemUp re, sold'16 la si la(sold la) si la(sold la)\mbreak
  si8 si, re, si' re, si'
  \once\stemUp re, sold'16 la si la(sold la) si (la sold) si

  %49
  \once\stemDown la8 mi, la, mi' la, mi'
  \once\stemUp la, fad''16 sold la sold(fad sold) la (sold fad) sold
  \once\stemDown la8 mi, la, mi' la, mi'

  %52
  \once\stemUp la, fad''16 sold la sold(fad sold) la (sold fad) la
  sold mi mi mi si si si si mi mi mi mi
  fad fad fad fad si, si si si fad' fad fad fad

  %55
  sold sold sold sold si, si si si sold' sold sold sold
  la la la la si, si si si la' la la la
  <<{sold8 sold sold sold sold sold}\\{\stemUp \override Stem #'transparent = ##t si, si si si si si}\\{\stemDown re, re re re re re}>>\mbreak

  %58
  <<sold'4 \\\stemUp \override Stem #'transparent = ##t si,\\{\stemDown mi,8 mi' si mi la,, red'}>>
  mi4 r r
  R2.*31

  %91
  si,8 fad' si, fad' si, fad'
  \once\stemUp si,8 mi'16 fad sold fad(mi fad) sold fad(mi fad)\mbreak
  \once\stemDown sold8 fad, si, fad' si, fad'

  %94
  \once\stemUp si,8 mi'16 fad sold fad(mi fad) sold fad(mi fad)
  sold sold sold sold mi mi mi mi sold sold sold sold
  la la la la fad fad fad fad la la la la

  %97
  fad fad fad fad red red red red fad fad fad fad
  sold sold sold sold mi mi mi mi sold sold sold sold
  mi mi mi mi dod dod dod dod mi mi mi mi

  %100
  fad fad fad fad re re re re fad fad fad fad
  re re re re si si si si re re re re\mbreak
  dod dod dod dod re, re re re dod' dod dod dod

  %103
  re re re re re, re re re re' re re re
  dod dod dod dod re, re re re dod' dod dod dod
  si4 r r

  %106
  R2.*6
  la16 la la la re, re re re la' la la la
  si si si si re, re re re si' si si si
  dod dod dod dod re, re re re dod' dod dod dod

  %115
  re re re re re, re re re re' re re re
  <<{dod8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  mi''8 dod la' mi dod' la\mbreak

  %118
  <<{dod,8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  mi''8 dod la' mi dod' la
  la sold16 fad mi fad mi re dod re dod si

  %121
  la8 la' dod, la' re,, sold'
  la2.\fermata

}

IIIvlIIIn =  \relative do'' {

  sold,8 re' sold, re' sold, re'
  \once\stemUp sold, dod'16 re dod si(la si) dod si(la si)
  dod8 re, sold, re' sold, re'

  %4
  sold, la'16 si dod si(la si) dod si(la si)
  fad8 si re, si' re, si'
  \once\stemUp re, sold'16 la si la(sold la) si la(sold la)

  %7
  si8 si, re, si' re, si'
  \once\stemUp re, sold'16 la si la(sold la) si la(sold la)
  la la, la la re, re re re la' la la la\mbreak

  %10
  si si si si re, re re re si' si si si
  dod dod dod dod re, re re re dod' dod dod dod
  re re re re re, re re re re' re re re

  %13
  <<{dod8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  dod'8 la mi' dod la' mi
  <<{dod8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>

  %16
  dod'8 la mi' dod la' mi
  la sold16 fad mi fad mi re dod re dod si
  la8 la' dod, la' re,, sold'

  %19
  sold,,4 r r\mbreak
  R2.*25
  re'8 si' re, si' re, si'

  %46
  \once\stemUp re, mi'16 fad sold fad(mi fad) sold fad(mi fad)\mbreak
  re,8 si' re, si' re, si'
  \once\stemUp re, mi'16 fad sold fad(mi fad) sold (fad mi) sold

  %49
  fad8 mi, la, mi' la, mi'
  \once\stemUp la, red'16 mi fad mi (red mi) fad mi(red mi)
  fad8 mi, la, mi' la, mi'

  %52
  \once\stemUp la, red'16 mi fad mi (red mi) fad (mi red) fad
  mi mi mi mi si si si si mi mi mi mi
  fad fad fad fad si, si si si fad' fad fad fad

  %55
  sold sold sold sold si, si si si sold' sold sold sold
  la la la la si, si si si la' la la la
  <<{sold8 sold sold sold sold sold}\\{\stemUp \override Stem #'transparent = ##t si, si si si si si}\\{\stemDown re, re re re re re}>>\mbreak

  %58
  <<sold'4 \\\stemUp \override Stem #'transparent = ##t si,\\{\stemDown mi,8 mi' si mi la,, red'}>>
  mi4 r r
  R2.*31

  %91
  si,8 fad' si, fad' si, fad'
  si, dod'16 red mi red(dod red) mi red(dod red)
  mi8 fad, si, fad' si, fad'

  %94
  \once\stemUp si, dod'16 red mi red(dod red) mi red(dod red)
  mi mi mi mi dod dod dod dod mi mi mi mi
  fad fad fad fad dod dod dod dod fad fad fad fad

  %97
  red red red red si si si si red red red red
  mi mi mi mi si si si si mi mi mi mi
  dod dod dod dod la la la la dod dod dod dod

  %100
  re re re re la la la la re re re re
  si si si si fad fad fad fad si si si si\mbreak
  la la la la re, re re re la' la la la

  %103
  si si si si re, re re re si' si si si
  la la la la re, re re re la' la la la
  sold4 r r

  %106
  R2.*6
  la16 la la la re, re re re la' la la la
  si si si si re, re re re si' si si si
  dod dod dod dod re, re re re dod' dod dod dod

  %115
  re re re re re, re re re re' re re re
  <<{dod8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  dod'8 la mi' dod la' mi

  %118
  <<{dod8 dod dod dod dod dod}\\{\stemUp \override Stem #'transparent = ##t \stemUp re, re re re re re}\\{\stemDown sold, sold sold sold sold sold}>>
  dod'8 la mi' dod la' mi
  la sold16 fad mi fad mi re dod re dod si

  %121
  la8 la' dod, la' re,, sold'
  la2.\fermata

}

IIIvlan = \relative do' {

  la8 mi' la, mi' la, mi'
  la,4 mi' mi
  mi8 mi la, mi' la, mi'

  %4
  la,4 mi' mi
  mi8 si' mi, si' mi, si'
  mi,4 mi sold

  %7
  mi8 si' mi, si' mi, si'
  mi,4 mi sold
  mi8[dod16 re mi8 re mi dod]\mbreak

  %10
  sold[sold16 la si8 la si sold]
  mi'[dod16 re mi8 re mi dod]
  si[sold16 la si8 la si sold]

  %13
  mi' mi mi mi mi mi
  mi4 r r
  mi8 mi mi mi mi mi

  %16
  mi4 r r
  dod r r
  dod dod si

  %19
  la r r\mbreak
  R2.*25
  mi'8 si' mi, si' mi, si'

  %46
  mi,4 mi mi\mbreak
  mi8 si' mi, si' mi, si'
  mi,4 mi si

  %49
  red8 fad si, fad' si, fad'
  si,4 si' si,
  si8 fad' si, fad' si, fad'

  %52
  si,4 si si
  si8[sold'16 la si8 la si sold]
  red[red16 mi fad8 mi fad red]

  %55
  si[sold'16 la si8 la si sold]
  red[red16 mi fad8 mi fad red]
  si si si si si si\mbreak

  %58
  si4 si si
  sold r r
  R2.*31

  %91
  dod8 sold' dod, sold' dod, sold'
  dod,4 dod dod\mbreak
  dod8 sold' dod, sold' dod, sold'

  %94
  dod,4 dod dod
  dod8 dod sold' sold mi mi
  dod dod la' la la la

  %97
  la la la la red, red
  si si sold' sold sold sold
  sold sold sold sold dod, dod

  %100
  la la fad' fad re re
  re re re re sold, sold\mbreak
  mi[dod'16 re  mi8 re mi dod]

  %103
  sold[sold16 la si8 la si sold]
  mi[dod'16 re  mi8 re mi dod]
  mi4 r r

  %106
  R2.*6
  dod8[dod16 re mi8 re mi dod]
  sold[sold16 la si8 la si sold]

  %114
  dod8[dod16 re mi8 re mi dod]
  sold[sold16 la si8 la si sold]
  mi' mi mi mi mi mi

  %117
  mi4 mi mi
  mi8 mi mi mi mi mi
  mi4 mi mi

  %120
  mi4 r r
  dod dod si
  la2.\fermata

}

IIIbcn = \relative do {

  la8 mi' la, mi' la, mi'
  la,4 la' la,
  la8 mi' la, mi' la, mi'

  %4
  la,4 la' la,
  mi'8 si' mi, si' mi, si'
  mi,4 mi' mi,

  %7
  mi8 si' mi, si' mi, si'
  mi,4 mi' mi,
  la,8[la16 si dod8 si dod la]\mbreak

  %10
  mi'8[mi16 fad sold8 fad sold mi]
  la,8[la16 si dod8 si dod la]
  mi'8[mi16 fad sold8 fad sold mi]

  %13
  la, la la la la la
  la4 la' la,
  la8 la la la la la

  %16
  la4 la' la,
  la r r
  la mi' mi,

  %19
  la r r\mbreak
  la r r
  la r r

  %22
  la r r
  la r r
  la r r

  %25
  la r r
  la r r
  la8 si dod si dod la\mbreak

  %28
  mi'2.~
  mi~
  mi~

  %31
  mi~
  mi~
  mi~

  %34
  mi~
  mi~
  mi~

  %37
  mi~\mbreak
  mi
  si~

  %40
  si~
  si~
  si

  %43
  mi4 r r
  mi r r
  mi8 si' mi, si' mi, si'

  %46
  mi,4 mi' mi,\mbreak
  mi8 si' mi, si' mi, si'
  mi,4 mi' mi,

  %49
  si8 fad' si, fad' si, fad'
  si,4 si' si,
  si8 fad' si, fad' si, fad'

  %52
  si,4 si' si,
  mi8[mi16 fad sold8 fad sold mi]
  si[si16 dod red8 dod red si]

  %55
  mi8[mi16 fad sold8 fad sold mi]
  si[si16 dod red8 dod red si]
  mi8 mi mi mi mi mi\mbreak

  %58
  mi4 si' si,
  mi2.
  si

  %61
  mi
  si
  sold

  %64
  la16[si dod re mi fad sold la] la,8 r
  la2.
  si16[dod re mi fad sold la si] si,8 r

  %67
  si2.\mbreak
  dod16[re mi fad sold la si dod] dod,8 r
  dod2.

  %70
  si
  dod
  si

  %73
  mi
  fad4 la fad
  sold2 fad4\mbreak

  %76
  mid2 mi4
  red2 re4
  dod2 dod4

  %79
  si2 si4
  la r r
  sold' sold sold

  %82
  dod,2.
  fad4 fad fad
  si,2.\mbreak

  %85
  mi4 mi mi
  la,2.
  la4 la la

  %88
  sold2.
  dod4 dod dod
  fad sold sold,

  %91
  dod8 sold' dod, sold' dod, sold'
  dod,4 dod' dod,\mbreak
  dod8 sold' dod, sold' dod, sold'

  %94
  dod,4 dod' dod,
  dod8 dod dod' dod dod, dod
  fad, fad fad' fad fad, fad

  %97
  si si si' si si, si
  mi, mi mi' mi mi, mi
  la la la' la la, la

  %100
  re, re re' re re, re
  mi mi mi' mi mi, mi\mbreak
  la[la16 si dod8 la dod la]

  %103
  mi'[mi16 fad sold8 fad sold mi]
  la,[la16 si dod8 la dod la]
  mi'4 sold2

  %106
  la2.
  si
  dod2 si4

  %109
  la sold fad
  mi2.\mbreak
  la4 mi\fermata mi,

  %112
  la8[la16 si dod8 la dod la]
  mi'[mi16 fad sold8 fad sold mi]
  la,[la16 si dod8 la dod la]

  %115
  mi'[mi16 fad sold8 fad sold mi]
  la, la la la la la
  la4 la' la,

  %118
  la8 la la la la la
  la4 la' la,
  la r r

  %121
  la mi' mi,
  la2.\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  s2.*122
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
#(set-global-staff-size 16.5)


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
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
         }<<

            \new PianoStaff \with {
               \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            } \relative do'' <<

               \new Staff = "main" <<
                  \set Staff.instrumentName =  \markup \center-column{"[Violino ""principale]"}
                  \IvlI
               >>

               \new Staff <<
                  \set Staff.instrumentName =  \markup \center-column{"[Violino I]"}
                  \IvlII
               >>

               \new Staff = "second" <<
                  \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                  \IvlIII
               >>
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{"[Viola]"}
               \Ivla
            >>
            \new Staff \with {
               fontSize = #+1
               \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
               \set Staff.instrumentName = \markup \center-column{"[Basso]"}
               \Ibc
            >>
         >>

      }

      \layout {

         indent = 1.6\cm

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

   }

}

\bookpart {

   \paper  {

      systems-per-page = #7

   }

   \markup\huge "[2.] Solo"

   \score {
      {

         \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
         } \relative do'' <<

            \new Staff = "main" <<
               \IIvlI
            >>

            \new Staff \with {
               fontSize = #+1
               \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
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

   }

}

\bookpart {

   \paper  {

      systems-per-page = #3

   }

   \markup\huge "[3.] All[egr]o"

   \score {
      {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
         }<<

            \new PianoStaff \with {
               \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            } \relative do'' <<

               \new Staff = "main" <<
                  \IIIvlI
               >>

               \new Staff <<
                  \IIIvlII
               >>

               \new Staff = "second" <<
                  \IIIvlIII
               >>
            >>

            \new Staff <<
               \IIIvla
            >>
            \new Staff \with {
               fontSize = #+1
               \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
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

   }

}



