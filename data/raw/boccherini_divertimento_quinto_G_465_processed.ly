\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "tutti"

pf = _\markup { \italic poco \dynamic f}

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

upl =
#(let ((m (make-articulation 'stopped)))
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
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}



%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}

mbreak = { }


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \override TrillSpanner.bound-details.left.text = #'()
   \terzine\senza
}

Ifln =\relative do'' {
   
   r8
   R1*3
   r2 r4 r8 sold'16.\tr\p la32\mbreak
   si16(sold si sold si sold dod si) si8.\f\tr la32 sold fad8\p fad16.\tr sold32
   la16(fad la fad la fad si la) la4\f sold8 \tuplet 3/2 { sold16-!\p sold(la) }
   
   %7
   \tuplet 3/2 { si-! si (dod) fad,-! [fad(sold)] la-! la(si) mi,-![mi(fad)] sold si_\prall la} la8\noBeam~la32(si dod si)\grace re16 dod [(si32 la)]
   \grace la16 sold[(la32 sold)] \grace si16 la(sold32 fad) mi8 fad fad4(sold8)\tuplet 3/2 { sold16-! sold(la)}
   \tuplet 3/2 { si-! si (dod) fad,-! [fad(sold)] la-! la(si) mi,-![mi(fad)] sold (si_\prall la)} la8\f\noBeam la32(si dod si)\grace red16 dod [si32 la]\mbreak
   
   %10
   la(sold la sold) \grace si16 la[sold32 fad] mi8\dolce red red4(mi8) r
   R1*7
   la2_\markup\italic {poco \dynamic f} (sold8) mi4 mi8
   
   %19
   mi4 red mi r8 dod16\dolce\tr dod32 re
   mi16(dod mi dod) mi(dod fad mi)
   mi8.\tr\f(re32 dod) si8\p si16.\tr dod32\mbreak
   
   %22
   re16(si re si re si mi re) re4\rinf(dod8)\noBeam \tuplet 3/2 { dod16-! dod\pp(re) 
   mi-! mi(fad) si,-![si(dod)] re-! re(mi) la,-![la(si)] dod (mi re)} re8\noBeam~ re32 mi fad mi \grace sold16 fad [mi32 re]
   \grace re16 dod re32 dod \grace mi16 re[dod32 si] la8 (si) si4(dod8)\noBeam \tuplet 3/2 { dod16-! dod(re)
   
   %25
   mi-! [mi(fad)] si,-![si(dod)] re-! re(mi) la,[la(si)] dod-! (mi re)} re8\noBeam~re32 (mi fad mi) \grace sold16 fad\f[mi32 re]
   \tuplet 3/2 { dod16 la'_\prall sold \grace sold fad[mi_\prall re] } dod8 si\tr la4~la8
   
}

IvlIn =\relative do'' {

   mi,8\pp(
   dod' si) r mi,[(re' dod)] r la(
   sold)(la sold la) sold(la) r mi8(
   dod' si) r mi,[(mi' re)] r dod
   
   %4
   si(dod re dod \grace re16 dod8 si) r sold16.\p\tr la32\mbreak
   si16(sold si sold si sold dod si) si8.\f\tr la32 sold fad8\p fad16.\tr sold32
   la16(fad la fad la fad si la) <<la4\f\\la>> sold8 \tuplet 3/2 { sold16-!\p sold(la) }
   
   %7
   \tuplet 3/2 { si-! si (dod) fad,-! [fad(sold)] la-! la(si) mi,-![mi(fad)] sold si_\prall la} la8\noBeam~la32(si dod si)\grace re16 dod [(si32 la)]
   \grace la16 sold[(la32 sold)] \grace si16 la(sold32 fad) mi8 fad fad4(sold8)\tuplet 3/2 { sold16-! sold(la)}
   \tuplet 3/2 { si-! si (dod) fad,-! [fad(sold)] la-! la(si) mi,-![mi(fad)] sold (si_\prall la)} <<la8\f\\la>> la32(si dod si)\grace red16 dod [si32 la]\mbreak
   
   %10
   la(sold la sold) \grace si16 la[sold32 fad] mi8\dolce red red4(mi8)
   mi\p(
   dod'si) r mi,[(re' dod)] si4
   lad8(si lad si) lad [(si]) r fad(
   
   %13
   re'? dod) r fad,(mi' re) dod4
   sid8(dod sid dod) sid dod4 mi,8
   fad (mi re' dod) fad(mi) la4_\markup\italic {poco \dynamic f }~\mbreak
   
   %16
   la8 sold16(fad) fad[(mi)] mi(re) re8\dolce(dod) r dod(
   si la) r dod (si la) r \tuplet 3/2 { dod16(re mi)
   la,\rinf la la la[la la] la\p la la la[la la] sold(fad mi) \grace mi re! [dod re] dod[(mi la)] dod(re mi)
   
   %19
   mi\rinf la, la la[la  la] la\p la la la[la la]} sold8 r r dod16.\tr re32
   mi16(dod mi dod) mi(dod fad mi)
   mi8.\tr\f(re32 dod) si8\p si16.\tr dod32\mbreak
   
   %22
   re16(si re si re si mi re) re4\rinf(dod8)\noBeam \tuplet 3/2 { dod16-! dod\pp(re) 
   mi-! mi(fad) si,-![si(dod)] re-! re(mi) la,-![la(si)] dod (mi re)} re8\noBeam~ re32 mi fad mi \grace sold16 fad [mi32 re]
   \grace re16 dod re32 dod \grace mi16 re[dod32 si] la8 (si) si4(dod8)\noBeam \tuplet 3/2 { dod,16-! dod(re)
   
   %25
   mi-! [mi(fad)] si,-![si(dod)] re-! re(mi) la,[la(si)] dod-! (mi re)} re8\noBeam~re32 (mi fad mi) \grace sold16 fad\f[mi32 re]
   \tuplet 3/2 { dod16 la'_\prall sold \grace sold fad[mi_\prall re] } dod8 si\tr la4~la8
   
}


IvlIIn =\relative do'' {
   
   mi,8\pp(
   la sold) r mi[(si' la)] r dod,(
   re8)(dod re dod) re (dod) r mi(
   la sold) r mi[(dod' si)] r la
   
   %4
   sold(la si la \grace si16 la8 sold) r mi16.\tr fad32\mbreak
   sold16(mi sold mi sold mi la sold) sold8.\f \tr fad32 mi re8\p re16.\tr mi32
   fad16(re fad re fad re sold fad )<<{ \override TupletBracket.bracket-visibility = ##f\senza\tuplet 3/2 {re'16\f re re re[re re] }}\\{\override TupletBracket.bracket-visibility = ##f\senza\tuplet 3/2 { fad,16 fad fad fad[fad fad] }}>> mi8\tuplet 3/2 { mi16\p-! [mi(fad)] }
   
   %7
   \tuplet 3/2 { sold-! [sold (la)] re,-! re(mi) fad-! [fad(sold)] dod,-! dod(re) mi sold\prall fad } fad8\noBeam~fad32(sold la sold)\grace si16 la[(sold32 fad)]
   \grace fad16 mi dod32 si \grace re16 dod[si32 la] sold8 si la4(sold8\noBeam) \tuplet 3/2 {
      mi'16-! mi(fad)
      sold-! sold(la) re,-! [re(mi)] fad-! fad(sold) dod,-! [dod(re)] mi(sold fad)} fad8\f\noBeam fad32(sold la sold) \grace si16 la[sold32 fad]\mbreak
   
   %10
   fad32 (mi) dod si \grace re16 dod [si32 la] sold8\dolce la la4(sold8) mi'\p(
   la sold) r mi8[(si' la)] r4
   r8 re,!(mi re) mi (re) r fad(
   
   %13
   si lad) r fad(dod' si) r4
   r8 mi,(fad mi) fad mi4 dod8
   re(dod fad mi) re(dod) r mi_\markup\italic{poco \dynamic f}\mbreak
   
   %16
   re re si si'~si \grace si16 la16. sold32 la8\dolce [mi]
   re(dod) r mi(re dod) r4
   R1
   
   %19
   r2 r4 r8 la'16.\p\tr si32
   dod16(la dod la) dod (la re dod) dod8.\tr \f si32 la sold8\p [sold16.\tr la32]\mbreak
   si16(sold si sold si sold dod si) <<{ \override TupletBracket.bracket-visibility = ##f\senza\tuplet 3/2 {si16\f si si si[si si]  }}\\{\override TupletBracket.bracket-visibility = ##f\senza\tuplet 3/2 { sold sold sold sold[sold sold] }}>> la8\noBeam \tuplet 3/2 { la16-! la\pp(si)
   
   %22
   dod-! dod(re) sold,-![sold(la)] si-! si(dod) fad,-![fad(sold)] la(dod si)} si8\noBeam ~si32 dod re dod \grace mi16 re [dod32 si]
   \grace si16 la fad32 mi \grace sold16 fad [mi32 re] dod8 re re4(dod8) r
   r2 r8 si~si32(dod re dod) \grace mi16 re\f[dod32 si]
   
   %25
   \tuplet 3/2 { la16 fad'\prall mi \grace mi re [dod\prall si] } la8 sold\tr la4~la8

}


Ivlan =\relative do' {
   
   r8
   r mi\pp(sold mi) r la,(dod la)
   si(dod si dod) si(la) r4
   r8 mi'(sold mi) r sold, (si la)
   
   %4
   mi2~\tuplet 3/2 { mi16 mi mi mi[mi mi] } mi8 r\mbreak
   mi mi mi mi' \tuplet 3/2 { si16\f si  si si[si si] } si8 r
   si\p si si si \tuplet 3/2 { mi,16\f  mi mi mi [mi mi]} mi8 r
   
   %7
   r2 r8 si'\p red red
   mi la, si si mi r r4
   r2 r8 si\f re? re\mbreak
   
   %10
   mi la, si fad' fad4\p(mi8) r
   r mi\pp(sold mi) r la,(sol) sol
   fad(si dod si) dod(si) r4
   
   %13
   r8 fad(lad fad) r si(la) la
   sold(dod red dod) red dod r4
   r8 la\startTrillSpan la la\stopTrillSpan \tuplet 3/2 { la16 la la la[la la] } la8_\markup\italic{poco \dynamic f}(dod)\mbreak
   
   %16
   si8 si sold sold la la16. si32 dod8\noBeam r
   r dod\p(re dod) r dod(re dod)
   \tuplet 3/2 { fad16 fad, fad fad[fad fad] fa fa fa fa[fa fa] } mi8 si' la la'
   
   %19
   \tuplet 3/2 { fad!16 fad fad fad[fad fad] fa fa fa fa[fa fa]  mi mi mi mi[mi mi]} mi8 r
   la,\p la la la \tuplet 3/2 { mi'16\f mi mi mi[mi mi] }  mi8 r\mbreak
   mi,8 mi mi mi \tuplet 3/2 { mi'16 \f mi  mi mi[mi mi] } la,8 r
   
   %22
   r2 r8 mi'\p sold, sold
   la re mi mi, la r r \tuplet 3/2 { la16-! la(si)
   dod-! dod(re) sold,-![sold(la)] si-! si(dod) fad,-! [fad (sold)] la(dod la)} si16.[la32] sold8 sold\f
   
   %25
   la re, mi mi la[la' la,]
   
}


IvcIn =\relative do {
   
   r8
   \clef tenor \tuplet 3/2 {mi'16\pp\startTrillSpan mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mi[mi mi]\stopTrillSpan
   mi mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mi[mi mi]
   mi mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mi[mi mi]
   
   %4
   mi mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mi[mi mi]} mi8 r
   \clef bass \key la\major r2 \tuplet 3/2 { si,16\f si si si[si si] } si8 r 
   r2 \tuplet 3/2 { mi16\f mi, mi mi[mi mi]} mi8 r
   
   %7
   r2 r8 red'\p red red
   mi la, si si \tuplet 3/2 {  mi,16\p mi mi mi[mi mi]} mi8 r
   r2 r8 re'\f re re\mbreak
   
   %10
   mi la, si si \tuplet 3/2 { mi,16\p mi mi mi[mi mi] } mi8 r
   \clef tenor \key la\major \tuplet 3/2 {mi''16\pp\startTrillSpan mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mi[mi mi] mi mi mi  mid[mid mid]\stopTrillSpan}
   \tuplet 3/2 {fad fad fad fad [fad fad] fad fad fad fad [fad fad] fad fad fad fad[fad fad] fad fad fad fad[fad fad]
   
   %13
   fad fad fad fad[fad fad] fad fad fad fad[fad fad] fad fad fad fad[fad fad] fad fad fad fadd [fadd fadd]}
   \con\sestinequarto\tuplet 6/4 { sold sold sold sold sold sold  sold [sold sold sold sold sold]  sold [sold sold sold sold sold] la! [la la la la la]
   \senza la la la la la la la [la la la la la] la la la la la la} la8 r\mbreak
   
   %16
   r2 r4 \tuplet 3/2 { r16 mi mi mi[mi mi] 
                       mi mi mi mi[mi mi] mi mi mi mi[mi mi] mi mi mi mi[mi mi] mi mi mi mi[mi mi]}
   mi4_\markup\italic{poco \dynamic f} (red) mi8\clef bass\key la\major sold,\p la la,
   
   %19
   fad fad fa fa \tuplet 6/4 { mi16 mi' mi mi  mi mi } mi8 r
   r2 \tuplet 3/2 { mi16\f mi mi mi[mi mi]} mi8 r\mbreak
   r2 \tuplet 3/2 { mi,16\f mi mi mi[mi mi] } la8 r
   
   %22
   r2 r8 sold'\p sold sold
   la re, mi mi, \tuplet 3/2 { la16 la la la[la la]} la8 r
   r2 r8 sold sold sold\f
   
   %25
   la re, mi mi la [la la]
   
}


IvcIIn =\relative do {
   
   r8
   r mi\pp(sold mi) r la,(dod la)
   mi la mi la mi la r4
   r8 mi'(sold mi) r mi(sold la) 
   
   %4
   r la(sold la) mi mi mi, r\mbreak
   r2 \tuplet 3/2 { si'16\f si si si[si si] } si8 r 
   r2 \tuplet 3/2 { mi16\f mi, mi mi[mi mi]} mi8 r
   
   %7
   r2 r8 red'\p red red
   mi la, si si \tuplet 3/2 {  mi,16\p mi mi mi[mi mi]} mi8 r
   r2 r8 re'\f re re\mbreak
   
   %10
   mi la, si si \tuplet 3/2 { mi,16\p mi mi mi[mi mi] } mi8 r
   r mi'\pp(sold mi) r la(sol) sol
   fad si, fad' si, fad' si,(re! si)
   
   %13
   r fad'(lad fad) r si,(la!) la'
   sold dod, sold' dod, sold' dod, r4
   r4 r8 la la la r4\mbreak
   
   %16
   r r8 mi'_\markup\italic{poco \dynamic f} la, la' la la,
   r8 la'\p (sold la) r la(sold la)
   \tuplet 3/2 { fad16_\markup\italic{poco \dynamic f} fad fad fad[fad fad] fa[fa fa] fa\p fa fa } mi8 mi, la la'
   
   %19
   \tuplet 3/2 { fad!16\rinf fad fad fad [fad fad] fa\p[fa fa] fa fa fa mi[mi, mi] mi mi mi} mi8 r
   r2 \tuplet 3/2 { mi'16\f mi mi mi[mi mi]} mi8 r\mbreak
   r2 \tuplet 3/2 { mi,16\f mi mi mi[mi mi] } la8 r
   
   %22
   r2 r8 sold'\p sold sold
   la re, mi mi, \tuplet 3/2 { la16 la la la[la la]} la8 r
   r2 r8 sold sold sold\f
   
   %25
   la re, mi mi la [la la]

}

forma = {

   \time 4/4
   \key la\major
   \tempo 4 = 50
   \partial 8 s8
   s1*9
   s2 s4 s8
   \bar ":..:"
   s
   s1*14
   s2 s4 s8
   \bar ":|."

}


Ifl = {
   \Iglobal
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


IvcI = {
   \Iglobal
   \clef bass
   <<\IvcIn \forma>>
}


IvcII = {
   \Iglobal
   \clef bass
   <<\IvcIIn \forma>>
}


IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \override TrillSpanner.bound-details.left.text = #'()
   \terzine
}

IIfln =\relative do'' {

   la16. si32
   dod8 dod16.\tr re32 mi8[fad16. \tr sold32] la8 la16.\tr si32 dod8 r
   r2 r4 r8 la,16. si32
   dod8 dod16.\tr re32 mi8[fad16. \tr sold32] la8 la16.\tr si32 dod8 r

   %4
   R1*6
   r2 r4 r8 si16\dolce\solo(re!
   dod si la sold fad mid re! dod) si(si') si4 \grace si16 la sold\mbreak

   %12
   la(fad) fad-! fad-! sold8.(la32 si)\tuplet 3/2 {
      la16 (fad dod) la[(dod fad)] sold(mid) sold-! si[(sold) si-!]
      la16 (fad dod) la[(dod fad)] sold(mid) sold-! si[(sold) si-!] la(dod la fad[dod la)]
   } \once\stemUp fad8  la'16(dod
   si la sold fad mi! red dod si) la(la') la4 \grace la16  sold fad

   %15
   sold(mi) mi-! mi-! fad8. (sold32 la)\tuplet 3/2 {
      sold16 (mi si) sold[(si mi)] fad(red) fad-! la[(fad) la-!]
      sold(mi si) sold[(si mi)] fad(red) fad-! la[(fad) la-!] sold mi sold si[sold si]
   } mi8\dolce sold,
   \grace si16 la8(sold \grace si16 la8 sold) \grace si8 la4 sold8
   \tuplet 3/2 {
      mi16(sold\prall si)\mbreak

      %18
      si(la) la-! la[(sold) sold-!] sold(fad) fad-! fad[(mi) mi-!]
   }\once\con\sestine\tuplet 6/4 { red(mi fad mi red dod) } si8 sold'
   \grace si16 la8(sold \grace si16 la8 sold) \grace si8 la4 sold8 \tuplet 3/2 {
      mi16(sold\prall si)\mbreak
      si(la) la-! la[(sold) sold-!] sold(fad) fad-! fad[(mi) mi-!]
   }\once\con\sestine\tuplet 6/4 { red(mi fad mi red dod) } si8 r

   %21
   r4 r8 mi4\p fad8\tr sold r
   r4 r8 mi4 fad8\tr sold r
   r2\mbreak r4 r16 si\f(dod red)

   %24
   \tuplet 3/2 { mi si mi \grace red? dod[si la] } sold8 fad\tr mi16. sold32 fad8 r4
   r r8 mi4 fad8\tr sold\noBeam r
   r4 r8 mi4 fad8\tr sold\noBeam r

   %27
   r2 r4 r16 si\f(dod red)
   \tuplet 3/2 { mi si\prall mi \grace red? dod[si la] } sold8 fad\tr mi si'4 si8\mbreak
   si1\tr

   %30
   si8\tr si si si sold8 sold32(la si la) sold8 r
   R1*21
   r2 r4 r8 la,16.\f si32\mbreak

   %53
   dod8 dod16.\tr re32 mi8[fad16.\tr sold32] la8 la16.\tr si32 dod8 r
   r2 r4 r8 la,16. si32
   dod8 dod16.\tr re32 mi8[fad16.\tr sold32] la8 la16.\tr si32 dod8[dod16.\tr re32]

   %56
   mi8 sol,4 \grace sol16 fad mi sol(fad) fad4 r8
   R1
   r2 r4 r8 mi16\solo(sol

   %59
   fad mi re dod si lad sol fad) mi mi' mi4 \grace mi16 re dod\mbreak
   re(si) si-! si-! dod8.(re32 mi) \tuplet 3/2 {
      re16(fad si) fad[re si] dod(lad)  dod-! mi[(dod) mi-!]
      re(fad si) fad[(re) si-!] dod(lad) dod-! mi[(dod) mi-!] re(si re) fad[(re fad)]
   } si8\noBeam re,16(fad

   %62
   mi re dod si) la! (sold! fad mi) re(re') re4 \grace re16 dod si
   dod(la) la-! la-! si8. (dod32 re) \tuplet 3/2 {
      dod16(mi la) mi[(dod la)] si(sold) si-! re[(si) re-!]
      dod(mi la) mi[dod la] si sold si re[si re] dod(la) dod-! mi[(dod) mi-!]
   } la8 dod,

   %65
   \grace mi16 re8 dod \grace mi16 re8 dod \grace mi16 re4 dod8 \tuplet 3/2 { la'16 mi dod\mbreak}
   re8\tr\noBeam \tuplet 3/2 { si'16 sold re } dod8\noBeam \tuplet 3/2 { la'16 mi dod } \once\con \sestine\tuplet 6/4 { si dod si la sold fad } mi8 dod'
   \grace mi16 re8 dod \grace mi16 re8 dod \grace mi16 re4 dod8 \tuplet 3/2 { la'16 mi dod\mbreak}

   %68
   re8\tr\noBeam \tuplet 3/2 { si'16 sold re } dod8\noBeam \tuplet 3/2 { la'16 mi dod si[mi si] sold si sold } mi8 r
   r4 r8 la'4\dolce si8\tr dod\noBeam r
   r4 r8 la4 si8\tr dod\noBeam r

   %71
   r2 r4 r8 \tuplet 3/2 {
      sold?16\f si\prall sold
      la mi la \grace sold fad[mi re]
   } dod8 si\tr la16. (dod32) si8 r4
   r r8 la4\dolce si8\tr\noBeam dod r

   %74
   r4 r8 la4 si8\tr\noBeam dod r
   r2 r4 r8 \tuplet 3/2 {
      sold'?16\f si\prall sold
      la mi la \grace sold fad[mi re]
   } dod8 si \tr la mi'4 mi8\mbreak

   %77
   mi1\tr ~
   mi2 mi8 dod32(re mi re) dod8

}

IIvlIn =\relative do'' {

   la16. si32
   dod8\f dod16.\tr re32 mi8[fad16. \tr sold32] la8 la16.\tr si32 dod16 la-! mi-! \p dod-!
   si4 dod8 re16.(si32) la8[(sold)] la\f la16.\tr si32]
   dod8 dod16.\tr re32 mi8 [fad16.\tr sold32] la8 la16.\tr si32 dod16 la-! mi-!\p dod-!

   %4
   si4 (dod8) re16.(si32) la8[(sold)] la\f la,16-! dod-!]
   si(la) la'-! dod-! si\tr(la) dod-. mi-. re\tr(dod) la'-. dod-. si\tr(la) dod-. mi-.\mbreak
   la8 mi,4 \grace mi16 re16. dod32 \once\set doubleSlurs = ##t <dod mi,>4(<si mi,>8) r

   %7
   r2 r8 \tuplet 3/2 {
      mi 16\dolce(sold si) la[sold fad] mi red dod
      si(red fad) la[sold fad] mi red dod si[dod la] sold(si mi) sold [mi sold]
   } si8 r
   R1

   %10
   r8 fad, fad red si si' sold r
   r2 r8 dod\p dod dod\mbreak
   dod dod4 dod8 dod dod4 dod8

   %13
   dod dod4 dod8 dod r4 r8
   r2 r8 si si si
   si si4 si8 si si4 si8

   %16
   si si4 si8 si4 r8 si'\p
   si2~si4~si8 r\mbreak
   r2 r4 r8 si

   %19
   si2~si4~si8 r
   r2 r4 r8 mi,~
   mi\p mi4 mi red8 mi[mi]~

   %22
   mi mi4 mi red8 mi mi'16-!\dolce re!-!
   re16(dod) dod(si) si(la) la(sold)\mbreak sold(fad) fad(mi) mi red\f dod si
   \tuplet 3/2 { mi si mi \grace red dod[si la] } sold8 fad mi16.[sold32 <fad si,>8] r8 mi' \p~

   %25
   mi mi4 mi red8 mi[mi]~
   mi mi4 mi red8 mi mi'16-!\dolce re!-!

   %27
   re16(dod) dod(si) si(la) la(sold)\mbreak sold(fad) fad(mi) mi\f red dod\tr si
   \tuplet 3/2 { mi si mi \grace red? dod[si la] } sold8 fad\tr \once\stemUp mi\tuplet 3/2 { si''16 sold mi la[fad red] } si8\noBeam\mbreak
   si8 \tuplet 3/2 { si'16 sold mi la[fad red] } si8\noBeam  si \tuplet 3/2 { si'16 sold mi la[fad red] } si8

   %30
   si8 \tuplet 3/2 { si'16 sold mi la[fad red]}si16. si32 <mi si sold>8[<mi si sold> <mi si sold>] r
   si\p si4 si8 sold sold16.\tr (la32) si8\noBeam r
   R1

   %33
   si8 si4 si8 sold sold16.\tr (la32) si8\noBeam r
   R1\mbreak
   si8 r si r si r si r

   %36
   si si4 si8 si4(la8) r
   dod,1
   R

   %39
   r8 la'(si la) sold r r4
   r8 sold(la si) la r r4
   r8 la(si la) sold r r4\mbreak

   %42
   r8 sold(la si) la r r4
   r8 si-! si(la) r si-! si(la)
   sold sold sold sold fad la la dod

   %45
   r si si si r si si si
   r si si sold fad r r dod'
   dod dod r dod dod dod r si\mbreak

   %48
   la r r4 r8 fad fad fad
   fad16 fad fad fad mid mid mid mid fad4 r8 dod'
   dod dod r dod dod dod r si

   %51
   la r r4 r8 fad fad fad
   fad16 fad fad fad mid mid mid mid fad4 r8 la16.\f si32\mbreak
   dod8 dod16.\tr re32 mi8[fad16.\tr sold32] la8 la16.\tr si32 dod8[\once\stemUp la,\p]

   %54
   si4(dod8 re16. si32) la8 sold la\f la16. si32
   dod8 dod16.\tr re32 mi8[fad16.\tr sold32] la8 la16.\tr si32 dod8[dod16.\tr re32]
   mi8 <sol, la,>4 \grace sol16 fad16\dolce mi sol(fad) fad4 la16(fad)

   %57
   mi(re) re-. re-. re8\tr fad16 re dod(si) si-. si-. si8\tr fad'16(re)
   \grace dod si8 fad'16(mi re[dod si la)] \grace la8 sold4 r
   r2 r8 fad\p fad fad\mbreak

   %60
   fad fad4 fad8 fad fad4 fad8
   fad fad4 fad8 fad r8 r4
   r2 r8 mi mi mi

   %63
   mi mi4 mi8 mi mi4 mi8
   mi mi4 mi8 mi4 r8 mi'
   mi2.~mi8 dod~\mbreak

   %66
   dod si4 la8 sold r r mi'
   mi2.~mi8 dod~
   dod si4 la8 sold r r la'\dolce~

   %69
   la la4 la sold8 la la~
   la la4 la sold8 la la16-! sol-!
   sol?(fad) fad(mi) mi(re) re(dod) dod(si) si(la) la[(sol)] \tuplet 3/2 {
      sold'?\f si\prall sold

      %72
      la mi la \grace sold fad[mi re]
   } dod8 si la16.(dod32) <si mi,>8 r la\p~
   la la4 la sold8 la la~
   la la4 la la8 la[la'16-! sol-!]

   %75
   sol?(fad) fad(mi) mi(re) re(dod) dod(si) si(la) la[(sol)] \tuplet 3/2 {
      sold'?\f si\prall sold
      la mi la \grace sold fad[mi re]
   } dod8 si \tr <<la8\\la>> \tuplet 3/2 { mi'16 dod la re[si\prall sold] } mi8\mbreak
   mi\tuplet 3/2 { mi'16 dod la re[si sold] } mi8 mi\tuplet 3/2 { mi'16 dod la re[si sold] } mi8

   %78
   mi \tuplet 3/2 { mi'16 dod la re[si sold] } mi8 <la mi dod> [<la mi dod> <la mi dod>]

}

IIvlIIn =\relative do'' {

   r8
   mi,16\f mi mi mi mi mi mi mi dod dod dod16. re32 mi8 la\p~
   la16 la la la la la \tuplet 3/2 { la[(fad re)] } dod dod si si dod8\f dod16.\tr re32
   mi16 mi mi mi mi mi mi mi dod dod dod16. re32 mi8 la\p~

   %4
   la16 la la la la la \tuplet 3/2 { la[(fad re)] } dod dod si si dod8 r
   mi8 r mi r mi r mi r\mbreak
   r8 dod'4 \grace dod16 si16. la32 la4(sold8) r

   %7
   R1
   r8 fad fad red si si' sold r
   r2 r8 \tuplet 3/2 {
      mi'16\solo(sold si) la[sold fad] mi red dod

      %10
      si(red fad) la[sold fad] mi red dod si[dod la] sold(si mi) sold[mi sold]
   } si8 sold16\p(si)
   la(sold fad mid re! dod si la) sold8\tu sold4 mid8\mbreak
   dod la'(si) r r la(si) r

   %13
   r la (si) r r la la fad'16(la)
   sold(fad mi! red dod si la sold) fad8 fad4 red8
   si sold'(la) r r sold(la) r

   %16
   r sold(la) r r sold sold mi16\dolce[ (mi')]
   fad,(red' mi, mi' fad, red' mi, mi') fad,(red' fad, red' mi, mi' mi,8)
   r4 r8 fad fad\tuplet 3/2 { sold16(fad mi) } red8 mi16(mi')

   %19
   \stemNeutral fad,(red' mi, mi' fad, red' mi, mi' fad, red' fad, red' mi, mi' mi,8)
   r4 r8 fad fad \tuplet 3/2 { sold16(fad mi) } red8\noBeam \tuplet 3/2 {
      si'16\dolce mi si
      dod mi dod si [mi si] dod mi dod si [mi si] la dod si \grace si la[sold la] sold mi sold si[mi si]

      %22
      dod mi dod si[mi si] dod mi dod si[mi si] la dod si \grace si la[sold la]
   } sold8 mi'\tu\p ~
   mi dod4 dod8\mbreak dod4 si8 si\f
   si16(mi,) mi  mi mi mi red red mi8 red r \tuplet 3/2 {
      si'16\solo mi si

      %25
      dod mi dod si [mi si] dod mi dod si [mi si] la dod si \grace si la[sold la] sold mi sold si[mi si]
      dod mi dod si[mi si] dod mi dod si[mi si] la dod si \grace si la[sold la]
   } sold8 mi'\p\tu ~
   mi dod4 dod8 dod4 si8 si\f
   
   %28
   si16(mi,) mi  mi mi mi red red mi8 sold fad\tuplet 3/2 {
      la'16 fad red\mbreak
      sold mi si
   }  sold8[(fad)] \tuplet 3/2 { la'16 fad red sold[mi si] } sold8[fad] \tuplet 3/2 {
      la'16 fad red
      sold mi si
   }  sold8[fad] \tuplet 3/2 { la'16 fad red mi [si sold]} mi16. mi32 mi8\noBeam r
   
   %31
   sold8\p sold fad fad mi mi4 mi8
   mi16-! mi-! mi-! mi-! mi-! mi(dod' la) sold8 fad sold\noBeam r
   sold8 sold fad fad mi mi4 mi8
   
   %34
   mi16 mi mi mi mi mi(dod la') sold8(fad) sold mi16-!\solo sold-!\mbreak
   fad16\tr (mi) sold-! si-! la\tr(sold) si-! re!-! dod\tr(si) sold'-! si-! la(sold) si16.\tr dod32
   re16(re, mi fad \grace mi re8 dod16 re) re4\dolce(dod8 re
   
   %37
   dod4 si8 dod) si4 la16(fad' dod la')
   \grace sold16 fad8 mi16 re re(dod) dod(sid) dod dod\tr sold mid dod8 dod
   dod r r4 r2
   
   %40
   R1*13
   mi16 mi mi mi mi mi mi mi dod dod dod(re) mi8 la\p~
   la16 la la la la la \tuplet 3/2 { la[(fad re)] } dod dod si si dod8\f dod16. re32
   
   %55
   mi16 mi mi mi <<{mi mi mi mi mi mi mi mi mi mi mi mi}\\{dod dod dod dod dod dod dod dod dod dod dod dod}>>
   mi(la) la\dolce la la la la la la la la la la8 r
   R1
   
   %58
   r2 r4 r8 mi16\p(mi')
   re(dod si lad) sol(fad mi re) dod8 dod'4 lad8\mbreak
   si8 re,(mi) r r re(mi) r
   
   %61
   r re(mi) r r re re si'16(re)
   dod(si la! sold!) fad(mi re dod) si8 si'4 sold8
   la dod,(re) r r dod(re) r
   
   %64
   r dod(re) r r dod dod\p la16(la')
   si, (sold' la, la' si, sold' la, la') si, (sold' si, sold') la,(la' la,8)\mbreak
   r8 mi'16 mi mi mi mi mi mi8\tuplet 3/2 { dod'16 (si la) } sold (mi la, la')
   
   %67
   si,(sold' la, la')  si,(sold' la, la') si,(sold' si, sold') la,(la' la,8)
   r8 mi'16 mi mi mi mi mi mi8 si sold\noBeam \tuplet 3/2 {
      mi''16\solo la mi
      fad la fad mi[la mi] fad la fad mi[la mi]  re fad mi \grace mi re[dod re] dod[la dod] mi la mi
      
      %70
      fad [la fad] mi[la mi] fad la fad mi[la mi]  re fad mi \grace mi re[dod re]
   } dod8 la\tu ~
   la fad4 fad8 fad4 mi16 \f mi mi mi\mbreak
   mi16. mi'32 \grace mi16 \tuplet 3/2 { re[dod si] } la8 sold la sold r dod,8\p(
   
   %73
   re dod re dod) si4 la8 dod(
   re dod re dod) si4 la8 la'~
   la fad4 fad8 fad4 mi16 mi mi\f mi
   
   %76
   mi16. mi'32\grace mi16 \tuplet 3/2 { re [dod si] } la8 sold la dod,(si) \tuplet 3/2 { re'16[si sold] }\mbreak
   \tuplet 3/2 { dod la mi } dod8[(si)] \tuplet 3/2 { re'16 si sold dod[la mi] } dod8[(si)] \tuplet 3/2 { re'16 si sold}
   \tuplet 3/2 { dod la mi } dod8[(si)] \tuplet 3/2 { re'16 si sold dod[la mi] } <la mi dod>8 [<la mi dod>]

}


IIvlan =\relative do' {
   
   r8
   dod\f dod si si la la la dod\p
   re red(mi fad) mi8 mi, la r
   dod\f dod si si la la la dod\p
   
   %4
   re red(mi fad) mi8 mi, la\noBeam r
   dod r dod r dod r dod r\mbreak
   r2 r4 r8 sold'16\dolce(la
   
   %7
   si la sold la si la sold la) si8 r r4
   r2 r4 r8 sold16(la
   si la sold la si la sold la) si8 r r4
   
   %10
   R1*2\mbreak
   r4 r8 dod, dod dod r dod
   dod dod r dod dod4 r
   
   %14
   R1
   r4 r8 si si si r si
   si si r si si4 r
   
   %17
   r2 r4 r8 mi\mbreak
   mi4. dod8 si r r4
   r2 r4 r8 mi
   
   %20
   mi4. dod8 si r r sold'\dolce
   la(sold la sold)fad4 mi8 (sold
   la sold la sold) fad4 mi8 si'
   
   %23
   la(sold fad sold)\mbreak la fad4 fad8\f
   mi la, si si mi si r sold'\p
   la(sold la sold) fad4 mi8(sold
   
   %26
   la sold la sold) fad4 mi8 si'
   la(sold fad sold) la fad4 fad8\f
   mi la, si si mi si red fad\mbreak
   
   %29
   mi si red fad mi si red fad
   mi si red fad mi [mi, mi] mi'16.\tr_\solo fad32
   sold8 sold16.\tr la32 si8 dod16.\tr red32 mi8 mi16.\tr fad32 sold16  mi-! si-! sold-!
   
   %32
   fad4 sold8\tr la16. fad32 mi8(red) mi mi16.\tr fad32
   sold8 sold16.\tr la32 si8 dod16.\tr red32 mi8 mi16.\tr fad32 sold16  mi-! si-! sold-!
   fad4 sold8\tr la16. sold32 mi8(red) mi r\mbreak
   
   %35
   sold8\p r sold r sold r sold r
   sold sold sold mi mi mi mi r
   r mid mid(sold) r fad fad fad
   
   %38
   fad2 mid4 r
   r8 fad8(sold fad) mid r r4
   r8 mid(fad sold) fad r r4
   
   %41
   r8 fad(sold fad) mid r r4\mbreak
   r8 mid(fad sold) fad r r4
   r8 sold-!\noBeam sold(fad) r sold-! sold(fad)
   
   %44
   mid mid mid mid fad fad fad fad,
   r8 sold'\startTrillSpan sold sold\stopTrillSpan r sold\startTrillSpan sold sold\stopTrillSpan
   r8 sold sold mid fad-! fad(mid sold)
   
   %47
   r fad(mid sold) r fad(mid sold)\mbreak
   fad r r4 r8 la, si si
   dod dod dod dod fad fad(mid sold)
   
   %50
   r fad(mid sold) r fad(mid sold)
   fad r r4 r8 la, si si
   dod dod dod dod fad fad,16.\f fad'32 \grace fad16 mi!16. re32 \grace re16 dod16. si32\mbreak
   
   %53
   dod8 dod si si la la la dod\p
   re red(mi fad) mi mi, la\noBeam r
   la\f la la la la la la la
   
   %56
   la\dolce la la la la la la r
   r fad' fad fad r fad fad fad
   r la(fad) fad mi si si r
   
   %59
   R1\mbreak
   r4 r8 fad' fad fad r fad
   fad fad r fad fad4 r
   
   %62
   R1
   r4 r8 mi mi mi r mi
   mi mi r mi mi4 r
   
   %65
   R1\mbreak
   r4 r8 la, mi' mi mi, r
   R1
   
   %68
   r4 r8 la mi' mi mi, dod''\dolce\noBeam
   re(dod re dod) si4 la8 dod
   re(dod re dod) si4 la8 mi
   
   %71
   re(dod si) dod re si4 si8\f \mbreak
   dod re mi mi  mi mi r \tuplet 3/2 { mi16\dolce la mi 
   fad la fad mi [la mi] fad la fad mi [la mi] re fad mi \grace mi re[dod re] dod la dod mi[la mi]
   
   %74
   fad la fad mi [la mi] fad la fad mi [la mi] re fad mi \grace mi re[dod re]} dod8 mi
   re8(dod si) dod re si4 si8\f
   dod re mi mi la, mi'(sold) si\mbreak
   
   %77
   la mi(sold) si la mi(sold) si
   la mi(sold) si la [la, la]
   
}


IIvcIn =\relative do {

   r8
   <<{la'8\f [la]}\\{la [la sold sold]}>> fad16. fad32 \grace fad16 mi16. re32 dod8 dod\p
   re(red mi[fad16. re32)] mi8 mi, la4
   <<{la'8\f [la]}\\{la [la sold sold]}>> fad16. fad32 \grace fad16 mi16. re32 dod8 dod\p

   %4
   re red(mi fad) mi mi, la\noBeam r
   la r la r la r la r\mbreak
   r la(dod re) mi mi mi, \clef tenor\key la\major mi''16[(fad]

   %7
   sold fad mi fad sold fad mi fad) sold8 r r4
   r2 r4 r8 mi16[(fad]
   sold fad mi fad sold fad mi fad) sold8 r r4

   %10
   \clef bass \key la\major r8 si, si si, mi mi mi, r
   r2 r8 mid' mid mid\mbreak
   fad fad(mid\noBeam) r r fad(mid4)

   %13
   r8 fad(mid4) r8 fad fad, r
   r2 r8 red' red red
   mi mi(red) r r mi(red4)

   %16
   r8 mi (red4) r8 mi mi, r
   r2 r4 r8 mi'\mbreak
   dod(si la) lad si si' si, r

   %19
   r2 r4 r8 mi
   dod(si la) lad si si' si, r
   r2 r8 si' mi,4

   %22
   r2 r8 si' mi, sold
   la mid fad (sold) \mbreak <<{s4 s8 la}\\{\slurUp la (lad si la\f)}>>
   sold la si si, mi,  si' r4

   %25
   r2 r8 si'\p mi,4
   r2 r8 si' mi, sold
   la mid fad(sold)  <<{s4 s8 la}\\{\slurUp la (lad si la\f)}>>

   %28
   sold la si si, mi mi si' si,\mbreak
   mi, mi' si' si, mi, mi' si' si,
   mi, mi' si' si, mi [mi, mi] r

   %31
   mi'\p mi red red dod16. dod32 \grace dod16 si16. la32 sold8 sold
   la lad(si dod) si si mi, r
   mi' mi red red dod16. dod32 \grace dod16 si16. la32 sold8 sold

   %34
   la lad(si dod) si si mi, r\mbreak
   mi'\p r mi r mi r mi r
   mi mi  mi mi la, la' la r

   %37
   R1*2
   \clef violin \key la\major dod'2\solo~dod16(red mid fad mid mi red re)
   dod2~dod16(si dod re red mi mid fad)

   %41
   dod2~dod16(red mid fad mid mi red re)\mbreak
   dod2~dod16(si dod re red mi mid fad)
   fad\tr mid mid4 fad8 fad16 mid mid4 fad8

   %44
   sold16 mid dod8~dod16 si la sold la16.\tr si32 dod8~dod16 dod-! dod(fad)
   \grace sold fad mid mid8~mid16 sold(si sold) \grace sold fad mid mid8~mid16 sold(si sold)
   \grace fad mid8 mid32(fad mid fad) sold16(mid dod si) \grace si la8\tuplet 3/2 {
      fad16(la dod) sold[(si dod)] mid[(dod si)]

      %47
      la(dod fad) fad,[(la dod)] sold(si dod) mid[(dod si)] la(dod fad) fad,[(la dod)] sold(si dod) mid[ dod mid]\mbreak
      fad(dod mid fad[dod mid] fad dod mid fad[dod mid])
   }\con \tupletSpan 4 \tuplet 6/4 { fad mi! re dod si la re dod si la sold fad }\senza
   dod4 sold'\tr fad8\tuplet 3/2 {
      fad16(la dod) sold[(si dod)]  mid(dod si)

      %50
      la(dod fad) fad,[(la dod)] sold(si dod)  mid[(dod si)] la(dod fad) fad,[(la dod)] sold(si dod) mid[(dod mid)]
      fad(dod mid fad[dod mid] fad dod mid fad[dod mid])
   }\con \tupletSpan 4 \tuplet 6/4 { fad mi! re dod si la re dod si la sold fad }\senza
   dod4 si'\tr la r\mbreak

   %53
   \clef bass\key la\major <<{la,8\f [la]}\\{la [la sold sold]}>> fad16. fad32 \grace fad16 mi16. re32 dod8 dod\p
   re red(mi fad) mi mi, la r
   la\f la la la la la la la

   %56
   la\p la la la re, re' re, r
   r re' re re r re re re
   r re re red mi mi mi, r

   %59
   r2 r8 lad' lad lad\mbreak
   si si(lad) r  r si(lad4)
   r8 si lad4 r8 si si, r

   %62
   r2 r8 sold' sold sold
   la? la(sold) r r la sold4
   r8 la sold4 r8 la la, r

   %65
   r2 r4 r8 la'\mbreak
   si(sold) la la, mi' mi mi, r
   r2 r4 r8 la'

   %68
   si(sold) la la, mi' mi mi, r
   r2 r8 mi' la,4
   r2 r8 mi' la, dod

   %71
   re lad(si dod) <<{s4 s8 re! }\\{re red mi re\f}>>\mbreak
   dod re mi mi, la mi r4
   r2 r8 mi'\p la,4

   %74
   r2 r8 mi' la, dod
   re lad(si dod) <<{s4 s8 re! }\\{\once\slurUp re (red mi) re\f}>>
   dod re mi mi, la la mi mi'\mbreak

   %77
   la, la mi mi' la, la mi mi'
   la, la mi mi' la, [la la]

}


IIvcIIn =\relative do {

   r8
   <<{la'8\f [la]}\\{la [la sold sold]}>> fad16. fad32 \grace fad16 mi16. re32 dod8 r
   R1
   <<{la'8 [la]}\\{la [la sold sold]}>> fad16. fad32 \grace fad16 mi16. re32 dod8 r

   %4
   R1
   la8\p r la r la r la r\mbreak
   r la(dod re) mi mi mi, r

   %7
   R1
   r8 si'' si si, mi mi mi, r
   R1

   %10
   r8 si'' si si, mi mi mi, r
   R1\mbreak
   r4 r8 mid'(fad4) r8 mid(

   %13
   fad4) r8 mid(fad) fad fad, r
   R1
   r4 r8 red'(mi?4) r8 red(

   %16
   mi4) r8 red (mi) mi mi, r
   r2 r4 r8 mi'\mbreak
   dod(si la) lad si si' si, r

   %19
   r2 r4 r8 mi
   dod(si la) lad si si' si, r
   r2 r8 si' mi,4

   %22
   r2 r8 si' mi, sold
   la mid fad (sold) \mbreak <<{s4 s8 la}\\{\slurUp la (lad si la\f)}>>
   sold la si si, mi,  si' r4

   %25
   r2 r8 si'\p mi,4
   r2 r8 si' mi, sold
   la mid fad(sold)  <<{s4 s8 la}\\{\slurUp la (lad si la\f)}>>

   %28
   sold la si si, mi mi si' si,\mbreak
   mi, mi' si' si, mi, mi' si' si,
   mi, mi' si' si, mi [mi, mi] r

   %31
   R1*4
   mi'8\p r mi r mi r mi r
   mi mi  mi mi la, la' la fad

   %37
   r sold sold mid r fad fad fad
   <<{re![re re re]}\\{re[re re re]}>> dod dod' dod, r
   r2 r8 dod' dod r

   %40
   r2 r8 fad, fad r
   r2 r8 dod' dod r\mbreak
   r2 r8 fad, fad r

   %43
   r dod' dod dod dod, dod' dod dod
   dod, dod' dod dod, fad r4 r8
   r dod' dod dod dod, dod' dod dod

   %46
   dod, dod' dod dod, fad r r dod'
   fad,4 r8 dod' fad,4 r8 dod'\mbreak
   fad, r r4 r2

   %49
   r8 dod dod dod fad4 r8 dod'
   fad,4 r8 dod' fad,4 r8 dod'
   fad, r r4 r2

   %52
   r8 dod dod dod fad fad,16.\f fad'32 \grace fad16 mi!16. re32 \grace re16 dod16. si32\mbreak
   <<{s8 la'}\\{la, [la' sold sold]}>> fad16. fad32 \grace fad16 mi16. re32 dod8 r
   R1

   %55
   la8\f la la la la la la la
   la\p la la la re, re' re, r
   r re' re re r re re re

   %58
   r re re red mi mi mi, r
   R1
   r4 r8 lad(si4) r8 lad

   %61
   si4 r8 lad si si' si, r
   R1
   r4 r8 sold la!4 r8 sold

   %64
   la4 r8 sold la la' la, r
   R1\mbreak
   r4 r8 la' mi mi mi, r

   %67
   R1
   r4 r8 la' mi mi mi, r
   r2 r8 mi' la,4

   %70
   r2 r8 mi' la, dod
   re lad(si dod) <<{s4 s8 re! }\\{re red mi re\f}>>\mbreak
   dod re mi mi, la mi r4

   %73
   r2 r8 mi'\p la,4
   r2 r8 mi' la, dod
   re lad(si dod) <<{s4 s8 re! }\\{\once\slurUp re (red mi) re\f}>>

   %76
   dod re mi mi, la la mi mi'\mbreak
   la, la mi' mi, la la mi' mi,
   la la mi' mi, la [la la]

}

forma = {

   \time 4/4
   \key la\major
   \tempo 2 = 45
   \partial 8 s8
   s1*29
   s2 s4 s8
   \bar ":..:"
   s8
   s1*47
   s2 s4 s8
   \bar ":|."

}


IIfl = {
   \IIglobal
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


IIvcI = {
   \IIglobal
   \clef bass
   <<\IIvcIn \forma>>
}


IIvcII = {
   \IIglobal
   \clef bass
   <<\IIvcIIn \forma>>
}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override TrillSpanner.bound-details.left.text = #'()
    \terzine
}

IIIfln =\relative do'' {
   
   r8 sold'\dolce(fad sold) la4
   r8 si(lad si la4~
   la8 sold fad sold) la4
   
   %4
   r8 si(lad si) la4~
   la8(sold fad mi red! re)
   dod(red mi mid fad sold)
   
   %7
   la8.(fad16) mi!4 red
   \grace red4 mi2.
   r8 mi(red mi sold mi
   
   %10
   mi red sold fad) fad4
   r8 fad(mid fad la fad
   fad mi! la sold) sold4\mbreak
   
   %13
   r8 si si si si si
   si(lad16 sold fad mi red dod) si8 si
   si (dod16 red mi fad sold lad) si8 si
   
   %16
   si(lad16 sold fad mi red dod) si8 si
   si (dod16 red mi fad sold lad) si8 si
   si16 si, dod red mi fad sold lad si fad si fad
   
   %19
   sold8\tr(lad16 si) red,4 dod
   si r r
   re2.\dolce~
   
   %22
   re
   dod~
   dod~\mbreak
   
   %25
   dod~
   dod
   si~
   
   %28
   si~
   si8(sold'\dolce fad sold) la4
   r8 si(lad si la4~
   
   %31
   la8 sold fad sold) la4
   r8 si(lad si) la4~
   la8(sold fad mi red! re)
   
   %34
   dod(red mi mid fad sold)
   la8.(fad16) mi!4 red
   \grace fad4 mi2.

}

IIIvlIn =\relative do'' {
   
   si2.\p~
   si2(red4
   mi) si r
   
   %4
   si2 red4
   mi r si
   la r la8(si)
   
   %7
   dod8. la16 sold4 fad
   \grace fad4 sold2.
   r8 sold(fad sold si sold)
   
   %10
   sold(fad si la) la4
   r8 la(sold la dod la)
   la(sold dod si) si4\mbreak
   
   %13
   R2.
   r8 si'-! si-! si-! si-! si-!
   si r r4 r
   
   %16
   r8 si-! si-! si-! si-! si-!
   si r r4 r
   si,8\f dod16 red mi fad sold lad si fad si fad
   
   %19
   sold8\tr(lad16 si) red,4 dod
   si r r
   r8 si\p(lad si re si)
   
   %22
   r8 si(lad si re si)
   r si si si si si
   r la la la la la\mbreak
   
   %25
   r la(sold la dod la)
   r la(sold la dod la)
   r la la la la la
   
   %28
   r sold sold sold sold sold
   r4 si si
   si2(red4
   
   %31
   mi) si r
   si2(red4
   mi) r si(
   
   %34
   la) r la8(si)
   dod8. la16 sold4 fad
   \grace fad4 mi2.
   
}


IIIvlIIn =\relative do'' {
   
   r8 sold\pp(fad sold la4)
   r8 si(lad si la4)~
   la8 sold(fad sold la4)
   
   %4
   r8 si(lad si la4)~
   la8 (sold fad mi red! re)
   dod(red mi mid fad sold)
   
   %7
   la8. sold16 mi!4 red
   \grace red4 mi2.
   r8 mi(red mi sold mi)
   
   %10
   mi(red sold fad) fad4
   r8 fad(mid fad la fad)
   fad(mi! la sold) sold4\mbreak
   
   %13
   r8 si si si si si
   si r r4 r
   r8 si si si si si
   
   %16
   si r r4 r
   r8 si si si si si
   si8\f dod16 red mi fad sold lad si fad si fad
   
   %19
   sold8\tr(lad16 si) red,4 dod
   si r r
   r8 sold\p(fad sold si sold)
   
   %22
   r8 sold(fad sold si sold)
   r dod dod dod dod dod
   r dod dod dod dod dod\mbreak
   
   %25
   r8 fad,(mid fad la fad)
   r8 fad(mid fad la fad)
   r si si si si si
   
   %28
   r si si si si si
   si(sold fad sold la4)
   r8 si(lad si la4)~
   
   %31
   la8 (sold fad sold) la4
   r8 si(lad si) la4~
   la8(sold fad mi red re)
   
   %34
   dod(red mi mid fad sold)
   la8. fad16 mi4 red
   \grace red4 mi2.
   
}


IIIvlan =\relative do' {
   
   mi'2\pp (red8 dod)
   si2.~
   si4(mi red8 dod)
   
   %4
   si2.~
   si4 r mi,~
   mi r r
   
   %7
   la, si si
   mi,2.
   R
   
   %10
   r4 si'(red)
   fad r r
   r mi(sold)\mbreak
   
   %13
   mi(red  dod)
   si(dod red)
   mi(red  dod)
   
   %16
   si(dod red)
   mi(red dod)
   si8\f si' si si si si
   
   %19
   si si si si lad lad
   si4\p(fad red)
   si r r
   
   %22
   sold' r r
   r8 sold-! mid-! sold-! mid-! sold-!
   r fad-! la-! fad-! la-! fad-!\mbreak
   
   %25
   la4 r r
   fad r r
   r8 fad-! red-! fad-! red-! fad-!
   
   %28
   r8 mi-! sold-!  mi-! sold-! mi-!
   mi'2\dolce (red8 dod)
   si2.~
   
   %31
   si4(mi red8 dod)
   si2.~
   si4 r mi,~
   
   %34
   mi r r
   la, si si
   mi,2 r4
 
}


IIIvcIn =\relative do {
   
   mi2\pp(fad4
   sold2) fad4
   mi2(fad4
   sold2) fad4
   
   %5
   mi fad sold
   la r r
   la, si si
   
   %8
   mi mi mi
   mi r r 
   si si' si
   
   %11
   si r r
   mi, mi mi\mbreak
   sold(fad mi)
   
   %14
   red(mi fad)
   sold(fad mi)
   red(mi fad)
   
   %17
   sold (fad mi)
   red8\f red red red red red
   mi mi fad fad fad, fad
   
   %20
   si4\dolce red (fad)
   si\p r r
   sold r r
   
   %23
   mid r r
   fad r r\mbreak
   la r r
   
   %26
   fad r r
   red r r
   mi si sold
   
   %29
   mi mi'\dolce(fad
   sold2) fad4
   mi2(fad4
   
   %32
   mi2) fad4
   mi fad sold
   la r r
   
   %35
   la, si si
   mi,2.
   
}


IIIvcIIn =\relative do {
   
   mi2\pp(fad4
   sold2) fad4
   mi2(fad4
   sold2) fad4
   
   %5
   mi fad sold
   la r r
   la, si si
   
   %8
   mi mi mi
   mi r r 
   si si' si
   
   %11
   si r r
   mi, mi mi\mbreak
   sold(fad mi)
   
   %14
   red(mi fad)
   sold(fad mi)
   red(mi fad)
   
   %17
   sold (fad mi)
   red8\f red red red red red
   mi mi fad fad fad, fad
   
   %20
   si4\dolce red (fad)
   si\p r r
   sold r r
   
   %23
   mid r r
   fad r r\mbreak
   la r r
   
   %26
   fad r r
   red r r
   mi si sold
   
   %29
   mi mi'\dolce(fad
   sold2) fad4
   mi2(fad4
   
   %32
   mi2) fad4
   mi fad sold
   la r r
   
   %35
   la, si si
   mi,2.

}

forma = {

    \time 3/4
    \key mi\major
    \tempo 2 = 60
    s2.*8
    \bar ":..:"
    s2.*28
    \bar ":|."

}


IIIfl = {
    \IIIglobal
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


IIIvcI = {
    \IIIglobal
    \clef bass
    <<\IIIvcIn \forma>>
}


IIIvcII = {
    \IIIglobal
    \clef bass
    <<\IIIvcIIn \forma>>
}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override TrillSpanner.bound-details.left.text = #'()
    \terzine
}

IVfln =\relative do'' {
   
   la'2.\p 
   sold
   re'
   
   %4
   dod
   dod,
   si~
   
   %7
   si~
   si\mbreak
   mi~
   
   %10
   mi~
   mi
   fad~
   
   %13
   fad~
   fad~
   fad
   
   %16
   sold
   la\mbreak
   sold
   
   %19
   re'
   dod
   mi,
   
   %22
   fad4 r r
   R2.*3
 
}

IVvlIn =\relative do'' {
   
   la'16\soli\dolce (sold) la sold la(sold) fad mi re dod si la
   sold4 r r
   si'16(la) si la si(la) sold fad mi re dod si
   
   %4
   la4 r r
   la'16 (sold) la sold la(sold) fad mi re dod si la
   la'4 r r 
   
   %7
   la16 (sold) la sold la(sold) fad mi red dod si la
   sold4 r r\mbreak
   la'16 (sold) la sold la(sold) fad mi re? dod si la
   
   %10
   la'4 r r
   sol16(fad) sol fad sol(fad) mi re dod si la sol!
   fad4 r r
   
   %13
   si'16(lad) si lad si(lad) sold fad mi red dod si
   si'4 r r
   la16 (sold) la sold la(sold) fad mi red? dod si la
   
   %16
   sold4 r r
   la'16 (sold) la sold la(sold) fad mi re dod si la\mbreak
   sold4 r r
   
   %19
   si'16(la) si la si(la ) sold fad mi re dod si
   la4 r r
   sol'16(fad) sol fad sol(fad) mi re dod si la sol!
   
   %22
   fad4 fad'16 sold! la fad re mi fad re
   dod re mi dod si dod re dod \grace mi re8 dod16  si
   la4 la, r la' la, r

}


IVvlIIn =\relative do'' {
   
   R2.
   re'16\solo\dolce (dod) re dod re(dod) si la sold fad mi re
   re,4 r r
   
   %4
   dod''16(si) dod si dod(si) la sold fad mi re dod
   la'4 r r
   la16(sold) la sold la(sold) fad mi re dod si la
   
   %7
   la'4 r r
   mi16(red) mi red mi(red) dod si la sold fad mi
   R2.
   
   %10
   sol'16(fad) sol fad sol(fad) mi re dod si la sol?
   mi4 r r
   fad'16(mi) fad mi fad(mi) re dod si la sol fad
   
   %13
   red'4 r r
   la'16(sold) la sold la(sold) fad mi re dod si la
   fad'4 r r
   
   %16
   sold16(fad) sold fad sold(fad) mi re! dod si la sold
   la4 r r
   re'16(dod) re dod re(dod) si la sold fad mi re
   
   %19
   re,4 r r
   dod''16(si) dod si dod(si) la sold fad mi re dod
   la'4 r r
   
   %22
   fad16 sold! la fad re mi fad re si dod re si
   la si dod la sold la si la \grace dod si8 la16 sold
   la4 la, r la' la, r
   
}


IVvlan =\relative do' {
   
   mi8\p mi mi mi mi mi
   mi  mi mi mi mi mi 
   mi  mi mi mi mi mi 
   
   %4
   mi  mi mi mi mi mi 
   mi  mi mi mi mi mi 
   fad fad fad fad fad fad
   
   %7
   fad fad fad fad fad fad
   mi  mi mi mi mi mi \mbreak
   dod dod dod dod dod dod
   
   %10
   mi mi mi mi mi mi
   dod dod dod dod dod dod
   la la la la la la
   
   %13
   red red red red red red
   fad fad fad fad fad fad
   red red red red red red
   
   %16
   si si si si si si
   mi mi mi mi mi mi\mbreak
   mi mi mi mi mi mi
   
   %19
   mi mi mi mi mi mi
   mi mi mi mi mi mi
   dod dod dod dod dod dod
   
   %22
   re? re re re re re
   mi mi mi mi mi mi
   la,4 r r la r r
 
}


IVvcIn =\relative do {
   
   la4\p la la
   si si si
   sold sold sold
   
   %4
   la la la
   dod dod dod
   re re re
   
   %7
   red red red
   mi mi mi
   la, la la
   
   %10
   dod dod dod
   la la la
   re re re
   
   %13
   si si si
   red red red
   si si si 
   
   %16
   mi mi mi
   dod dod dod\mbreak
   si si si
   
   %19
   sold sold sold
   la la la
   la la la
   
   %22
   re re re
   mi mi mi,
   la la8 la' sold fad la,4 la8 si dod red
  
}


IVvcIIn =\relative do {
   
   la4\p la la
   si si si
   sold sold sold
   
   %4
   la la la
   dod dod dod
   re re re
   
   %7
   red red red
   mi mi mi
   la, la la
   
   %10
   dod dod dod
   la la la
   re re re
   
   %13
   si si si
   red red red
   si si si 
   
   %16
   mi mi mi
   dod dod dod\mbreak
   si si si
   
   %19
   sold sold sold
   la la la
   la la la
   
   %22
   re re re
   mi mi mi,
   la la8 la' sold fad la,4 la8 si dod red

}

forma = {

    \time 3/4
    \key la\major
    \tempo 2 = 60
    s2.*8
    \bar ":..:"
    \repeat volta 2 {s2.*15}
    \alternative {{s2.}{s}}
    \bar "|."
    \mark\markup\center-column {"DC"\vspace #0.3"M.tto"}

}


IVfl = {
    \IVglobal
    <<\IVfln \forma>>
}


IVvlI = {
    \IVglobal
    <<\IVvlIn \forma>>
}


IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>
}


IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>
}


IVvcI = {
    \IVglobal
    \clef bass
    <<\IVvcIn \forma>>
}


IVvcII = {
    \IVglobal
    \clef bass
    <<\IVvcIIn \forma>>
}


Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override TrillSpanner.bound-details.left.text = #'()
    \terzine
}

Vfln =\relative do'' {
   
   r8
   R2*23
   r4 r8 si'16\f sold
   la fad sold mi fad8 sold\tr \mbreak
   
   %26
   la16 (fad) sold mi fad8 sold\tr 
   la16(fad) si la sold(mi) la sold
   fad mi red dod si8 si'16 (sold)
   
   %29
   la fad sold mi fad8 sold\tr 
   la16 fad sold mi fad8 sold\tr 
   la16 fad si la sold mi la sold
   
   %32
   fad mi red dod si8 r
   R2*15
   sold'16\f(la) si sold la(sold) fad la
   
   %49
   sold fad mi sold fad mi red fad\mbreak
   mi4 mi'~
   mi red
   
   %52
   sold,16(la) si sold la(sold) fad  la
   sold(fad) mi sold fad(mi) red fad
   mi4 mi'~
   
   %55
   mi red
   mi16 si sold si mi,8 r
   R2*20
   
   %77
   mi,4\f sold\tr 
   si mi\tr 
   sold2\f
   
   %80
   la4 r
   la, dod\tr \mbreak
   mi la\tr 
   
   %83
   dod2\f 
   re8 r re16(dod) si la
   sold8[la si dod]
   
   %86
   re4 dod8 la
   sold8[la si dod]
   re4 dod8 la
   
   %89
   sold8[la si dod]
   re4 dod8 mi
   fad[sold la la,]
   
   %92
   sold16(mi si' sold) mi8 mi'
   sold,[la si dod]\mbreak
   re4 dod8 la
   
   %95
   sold8[la si dod]
   re4 dod8 la
   sold8[la si dod]
   
   %98
   re4 dod8 mi
   fad[sold la la,]
   sold16(mi si' sold) mi8 r 
   
   %101
   mi2\p~
   mi~
   mi~
   
   %104
   mi~\mbreak
   mi~
   mi
   
   %107
   R2*2
   mi2~
   mi~
   
   %111
   mi~
   mi~
   mi~
   
   %114
   mi
   R\mbreak
   r4 r8 mi'\f 
   
   %117
   sold,[la si dod]
   re4 dod8 la
   sold[la si dod]
   
   %120
   re4 dod8 r
   R2*15
   dod16\f(re) mi dod re(dod) si re
   
   %137
   dod(si) la dod si(la) sold si
   la4 la~
   la sold\mbreak
   
   %140
   dod16(re) mi dod re(dod) si re
   dod(si) la dod si(la) sold si
   la4 la~
   
   %143
   la sold
   la16(mi) dod mi la8 r

}

VvlIn =\relative do'' {
   
   r8
   R2*4
   r8 mi-!\p r re-!
   r dod-! r la-!
   
   %7
   r la4 sold8
   la4 r8 la16\solo si
   dod(la) re si mi(dod) si la
   
   %10
   sold(la) si dod si(dod) re mi\mbreak
   re(si) sold' mi si'(sold) mi re
   dod(la) mi'(dod) la'(mi) dod' la
   
   %13
   mi'(dod) la mi re'(si) sold mi
   dod'(la) mi dod la'(mi) dod la
   fad'(la) fad re dod la' si, sold'
   
   %16
   la mi dod la la,8 r
   R2*3
   r4 r8 la'16 si
   
   %21
   dod(si) la sold la si dod  red
   mi(red?) mi fad sold mi fad sold
   la(sold) fad mi red? dod si la
   
   %24
   sold la si sold \once\stemUp mi8 si''16\f \tu sold
   la (fad) sold mi fad (si, sold' si,)\mbreak
   la'(fad) sold mi fad (si, sold' si,)
   
   %27
   la'(fad) si la sold(mi) la sold
   fad mi red dod si si(si' sold)
   la(fad) sold mi fad (si, sold' si,)
   
   %30
   la'(fad) sold mi fad (si, sold' si,)
   la'(fad) si la sold(mi) la sold
   fad si fad re si8 r
   
   %33
   R2*7
   r4 r8 mi16\dolce\solo fad
   sold mi fad\tr mi sold mi si' mi,
   
   %42
   mi' mi, si' mi, sold(mi) si mi
   sold mi fad\tr mi sold mi si' mi,
   mi' mi, si' mi, sold(mi) si mi
   
   %45
   sold mi fad\tr mi sold mi  la mi
   si' mi, dod' mi, red' mi, mi' mi,
   si si' sold mi fad4\tr 
   
   %48
   sold16\tu\f(la) si sold la(sold) fad la
   sold fad mi sold fad mi red fad\mbreak
   <<{mi mi mi mi mi mi mi mi
      
      %51
      mi mi mi mi}\\{mi mi mi mi mi mi mi mi
                     mi mi  mi mi}>> red red red red
   sold(la) si sold la sold fad la
   sold(fad) mi sold fad(mi) red fad
   
   %54
   <<{mi mi mi mi mi mi mi mi
      mi mi mi mi}\\{mi mi mi mi mi mi mi mi
                     mi mi  mi mi}>> red red red red
   mi8 [mi, mi] mi16\f fad
   
   %57
   sold(mi) sold la si(sold) si dod
   re!(si) sold' la si(sold) si dod
   re(dod) si la sold fad mi re\mbreak
   
   %60
   dod(re mi) re dod8 r
   R2*3
   r4 r8 re16\solo\dolce si'
   
   %65
   dod, la' si, sold' la, fad' sold, mid'
   la, fad' si, sold' dod, la' re, si'
   dod, la' si, sold' la, fad' sold, mid'
   
   %68
   fad (dod) la dod fad,8 r
   R2*3 
   r4 r8 dod'16 la' 
   
   %73
   si, sold' la, fad' sold, mi' fad, red'
   sold, mi' la, fad' si, sold' dod, la'
   si, sold' la, fad' sold, mi' fad, red'
   
   %76
   mi(sold si) sold mi8 r
   r8 mi,16\f\tu fad sold(mi) sold la
   si sold si dod re! si sold' la
   
   %79
   si(la) sold fad mi re dod si
   la4 r8 la,16 si
   dod(la) dod re mi(dod) mi fad\mbreak
   
   %82
   sol mi dod' re mi dod mi fad
   sol fad mi re dod si la sol?
   fad8 fad'16(mi) re dod si\ff la
   
   %85
   sold! sold la la si si dod dod
   <re mi,> <re mi,> <re mi,> <re mi,> dod dod la la
   sold sold la la si si dod dod
   
   %88
   <re mi,> <re mi,> <re mi,> <re mi,> dod dod la la
   sold sold la la si si dod dod
   <re mi,> <re mi,> <re mi,> <re mi,> dod dod mi mi
   
   %91
   fad fad sold sold la la la, la
   sold(mi') si sold mi8 mi
   mi16 mi mi mi mi mi mi mi\mbreak
   
   %94
   <<{mi' mi mi mi mi mi mi mi}\\{mi mi mi mi mi mi mi mi}>>
   mi, mi mi mi mi mi mi mi
   <<{mi' mi mi mi mi mi mi mi}\\{mi mi mi mi mi mi mi mi}>>
   
   %97
   mi, mi mi mi mi mi mi mi
   <<{mi' mi mi mi mi mi mi mi}\\{mi mi mi mi mi mi mi mi}>>
   fad fad sold sold la la la, la
   
   %100
   sold mi' si sold mi8 r
   r4 do'8\p r
   r4 mi8 r
   
   %103
   r4 mi8 r
   r4 mi8 r\mbreak
   r8 mi r re
   
   %106
   r do r la
   r la4 sold8
   la4 r8 la16\dolce\solo si
   
   %109
   do(la) re si mi do si la
   sold(la) si do si do re mi
   re(si) sold' mi si'(sold) mi re
   
   %112
   do(la) mi' do la' mi do' la
   mi'(do) la mi re'(si) sold mi
   do'(la) mi do? la'(mi) do la
   
   %115
   fa' mi re do si la sold fad\mbreak
   mi(sold) si mi mi,8 mi\f \tu
   mi16 mi mi mi mi mi mi mi
   
   %118
   <<{mi' mi mi mi mi mi mi mi}\\{mi mi mi mi mi mi mi mi}>>
   mi, mi mi mi mi mi mi mi
   <<{mi' [mi mi mi] }\\{mi [mi mi mi] }>>\grace fad16 mi8 r
   
   %121
   R2*5
   la,4.\p\solo la8
   la [la sold sold]\mbreak
   
   %128
   la4 r16 la si_\tr la
   dod la si_\tr la dod la mi' la,
   la' la, dod' la, la' la, mi' la,
   
   %131
   dod la si_\tr la dod la mi' la,
   la' la, dod' la, la' la, mi' la,
   dod la si_\tr la dod la mi' la,
   
   %134
   la' la, dod' la, mi'' la,, fad'' la,,
   mi4 si'\tr 
   dod16\tu\f(re16) mi dod re dod si re
   
   %137
   dod si la dod si la sold si
   la la la la la' la la la
   la la la la sold sold sold sold\mbreak
   
   %140
   dod,(re) mi dod re dod si re
   dod(si) la dod si la sold si
   la la la la la' la la la
   
   %143
   la la la la sold sold sold sold
   la8[mi \once\stemUp la,,]
   
}


VvlIIn =\relative do'' {
   
   la16\solo si
   dod(la) re si mi(dod) si la
   sold(la) si dod si(dod) re mi
   re(si) sold' mi si'(sold) mi re
   
   %4
   dod(la) mi' dod la'(mi) dod' la
   mi'(dod) la mi re'(si) sold mi
   dod'(la) mi dod la'(mi) dod la
   
   %7
   fad'(la) fad re dod la' si, sold'
   la mi dod la la,8 r
   R2*4
   
   %13
   r8 mi'' r re
   r dod r la
   r la4 sold8
   
   %16
   la4 r8 la16 si
   dod(si) la sold la si dod red
   mi(red?) mi fad sold(mi) fad sold
   
   %19
   la sold fad mi red dod si la
   sold(la) si sold mi red? dod si
   la8 r r4
   
   %22
   R2*2
   r4 r8 sold''16\f\tu mi
   fad (red) mi si red (si mi si)\mbreak
   
   %26
   fad' (red) mi si red (si mi si)
   fad'(red) si red mi sold fad mi
   red dod si dod si si' sold mi
   
   %29
   fad red mi si red si mi si
   fad'(red) mi si red si mi si
   fad'(red) si red mi sold fad mi
   
   %32
   \once\stemDown red8[si, si] mi'16\solo fad
   sold mi fad\tr mi sold mi si' mi,
   mi' mi, si' mi, sold(mi) si mi
   
   %35
   sold mi fad\tr mi sold mi si' mi,
   mi' mi, si' mi, sold(mi) si mi
   sold mi fad\tr mi sold mi la mi\mbreak
   
   %38
   si' mi, mi' mi, red' mi, mi' mi,
   si (si') sold mi fad4\tr 
   mi8[sold,_\tr mi] r
   
   %41
   R2*7
   <<{mi'16\f\tu mi mi mi mi mi mi mi
      mi mi mi mi}\\{mi mi mi mi mi mi mi mi
                     mi mi  mi mi}>> red red red red\mbreak
   
   %50
   sold(la) si sold la sold fad la
   sold(fad) mi sold fad(mi) red fad
   <<{mi mi mi mi mi mi mi mi
      
      %53
      mi mi mi mi}\\{mi mi mi mi mi mi mi mi
                     mi mi  mi mi}>> red red red red
   sold(la) si sold la sold fad la
   sold fad mi sold fad(mi) red fad
   
   %56
   mi8[mi, mi] r
   r mi16\f fad sold (mi) sold la
   si(sold) si dod re!(si) sold' la
   
   %59
   si(la) sold fad mi re dod si\mbreak
   la4 r8 re16\solo si'
   dod, la' si, sold' la, fad' sold, mid'
   
   %62
   la, fad' si, sold' dod, la' re, si'
   dod, la' si, sold' la, fad' sold, mid'
   fad(sold) la sold fad8 r
   
   %65
   R2*3
   r4 r8 dod16 la'
   si, sold' la, fad' sold, mi' fad, red'
   
   %70
   sold, mi' la, fad' si, sold' dod, la'\mbreak
   si, sold' la, fad' sold, mi' fad, red'
   mi(fad) sold fad mi8 r
   
   %73
   R2*3
   r4 r8 mi,16\f\tu fad
   sold(mi) sold la si(sold) si dod
   
   %78
   re! si sold' la si(sold) si dod
   re(dod) si la sold fad mi re
   dod mi la dod mi8 r 
   
   %81
   r la,,,16 si dod(la) dod re \mbreak
   mi(dod) mi fad sol(mi) dod' re
   mi re dod si la sol fad mi
   
   %84
   re8 re16 mi fad8 fad\ff
   mi16 mi mi mi mi mi mi mi
   <<{mi' mi mi mi mi mi mi mi}\\{mi mi mi  mi mi mi mi mi}>>
   
   %87
   mi, mi mi mi mi mi mi mi 
   <<{mi' mi mi mi mi mi mi mi}\\{mi mi mi  mi mi mi mi mi }>>
   mi, mi mi mi mi mi mi mi
   
   %90
   <<{mi' mi mi mi mi mi mi mi}\\{mi mi mi  mi mi mi mi mi }>>
   fad fad sold sold la la la, la
   sold(mi') si sold mi8 mi'
   
   %93
   sold,16 sold la la si si dod dod\mbreak
   <re mi,> <re mi,> <re mi,> <re mi,> dod dod la la
   sold sold la la si si dod dod
   
   %96
   <re mi,> <re mi,> <re mi,> <re mi,> dod dod la la
   sold sold la la si si dod dod
   <re mi,> <re mi,> <re mi,> <re mi,> dod dod mi  mi
   
   %99
   fad fad sold sold la la la, la
   sold mi' si sold mi8 la16\solo \dolce si
   do la re si mi do si la
   
   %102
   sold(la) si do si do re  mi
   re si sold' mi si' sold mi re
   do(la) mi' do la' mi do' la\mbreak
   
   %105
   mi'(do) la mi re'(si) sold mi
   do' la mi do? la' mi do la
   fa' la fa re do  la' si, sold'
   
   %108
   la mi do la la,8 r
   r4 do'8\tu r
   r4 mi8 r
   
   %111
   r4 mi8 r
   r4 mi8 r
   r mi r re
   
   %114
   r do r la
   la2\mbreak
   r4 r8 mi'16\tu\f mi
   
   %117
   sold, sold la la si si dod! dod
   <re mi,> <re mi,> <re mi,> <re mi,> dod dod la la
   sold sold la la si si dod dod
   
   %120
   <re mi,> <re mi,> <re mi,> <re mi,> dod\solo la si_\tr la
   dod la si_\tr la dod la mi' la,
   la' la, dod' la, la' la, mi' la,
   
   %123
   dod la si_\tr la dod la mi' la,
   la' la,  dod'\tr la, la' la, mi' la,
   dod la si_\tr la dod la mi' la,
   
   %126
   la' la, dod' la, mi'' la,, fad'' la,,
   mi4 si'\tr 
   la8 dod,_\tr la r
   
   %129
   R2*5
   la'4. la8
   la[la sold sold]
   
   %136
   la16\tu\f la la la la' la la la
   la la la la sold sold sold sold
   dod,(re) mi dod re dod si re
   
   %139
   dod si la dod si la sold si\mbreak
   la la la la la' la la la
   la la la la sold sold sold sold
   
   %142
   dod,(re) mi dod re dod si re
   dod si la dod si la sold si
   la8[<dod mi,> <dod mi, la,>]
 
}


Vvlan =\relative do' {
   
   r8
   mi4.\p fad8
   si, r sold' r
   <<si2\\sold>>
   
   %4
   la4 r
   dod,8 r sold' r
   mi r mi r
   
   %7
   la,[re mi mi]
   la,4 r
   mi'4. fad8
   
   %10
   si, r sold' r
   <<si2\\sold>>
   la4 r
   
   %13
   dod,8 r sold' r
   mi r mi r
   la,[re mi mi]
   
   %16
   dod r r4
   dod2(
   si)
   
   %19
   red
   mi4 r
   dod2
   
   %22
   si
   red
   mi4 r8 mi\f
   
   %25
   si[si' si, si]\mbreak
   si[si' si, si]
   red[fad mi mi,]
   
   %28
   si'[si' si, si]
   si[si' si, si]
   si[si' si, si]
   
   %31
   red[fad mi mi,]
   si'[si' si,] r
   si'4.\p (sold8
   
   %34
   si[sold mi sold)]
   si4. (sold8
   si[sold mi sold)]
   
   %37
   si r mi,-! fad-!\mbreak
   sold[la si dod]
   sold mi4 red8
   
   %40
   mi r8 mi16(fad sold la)
   si4.(sold8
   si[sold mi sold)]
   
   %43
   si4.(sold8
   si[sold mi sold)]
   si r mi, fad
   
   %46
   sold[la si dod]
   sold mi4 red8
   mi16 \f fad sold mi dod' si la dod
   
   %49
   si(la) sold si la(sold) fad la\mbreak
   sold fad sold mi dod'(si) la dod
   si(la) sold si la(sold) fad la
   
   %52
   sold fad sold mi dod'(si) la dod
   si(la) sold si la(sold) fad la
   sold fad sold mi dod'(si) la dod
   
   %55
   si(la) sold si la(sold) fad la
   sold8[<sold si,> <sold si,>] r
   mi4\f mi
   
   %58
   mi mi
   sold8[sold sold sold]\mbreak
   la4 r
   
   %61
   r r8 si\p 
   la-![sold-! fad-! mid]
   fad-![sold-! la-! si-!]
   
   %64
   la[dod, dod] r
   r4 r8 si'
   la-![sold-! fad-! mid]
   
   %67
   fad-![sold-! la-! si-!]
   la[dod, la] r
   r4 r8 la'
   
   %70
   sold-![fad-! mi-! red-!]\mbreak
   mi[fad sold la]
   sold[si, si] r
   
   %73
   r4 r8 la'
   sold-![fad-! mi-! red-!]
   mi-![fad-! sold-! la-!]
   
   %76
   sold[mi mi,] r
   mi'\f[mi  mi mi]
   mi[mi  mi mi]
   
   %79
   mi[mi  mi mi]
   la,[la' la, la]
   la[la la la]\mbreak
   
   %82
   la[la la la]
   la[la la la]
   re4 r8 re\ff 
   
   %85
   mi[fad sold la]
   <<si4\\sold>> la8 dod
   mi,[fad sold la]
   
   %88
   <<si4\\sold>> la8 dod
   mi,[fad sold la]
   <<si4\\sold>>la8 la~
   
   %91
   la sold fad4\tr 
   mi8[sold si sold]
   mi[fad sold la]\mbreak
   
   %94
   <<si4\\sold>> la8 dod
   mi,[fad sold la]
   <<si4\\sold>> la8 dod
   
   %97
   mi,[fad sold la]
   <<si4\\sold>>la8 la~
   la sold fad4\tr 
   
   %100
   mi4 r
   r4 la8\p r
   r4 sold8 r
   
   %103
   r4 sold8 r
   r4 la8 r\mbreak
   do r <<si\\sold>> r
   
   %106
   <<la\\mi>> r mi r
   la,[re mi mi]
   la, r4 r8
   
   %109
   r4 la'8 r
   r4 sold8 r
   r4 sold8 r
   
   %112
   r4 la8 r
   do r <<si\\sold>> r
   <<la\\mi>> r mi r
   
   %115
   r4 si'~\mbreak
   si8[sold mi mi]
   mi\f [fad sold la]
   
   %118
   <<si4\\sold>> la8 dod
   mi,[fad sold la]
   <<si4\\sold>> la8 r
   
   %121
   mi4\pp  mi
   dod8[(mi dod) dod-!]
   mi4 mi
   
   %124
   dod8[(mi dod) dod-!]
   mi4 mi
   dod8[la dod red]
   
   %127
   mi[mi mi, mi]\mbreak
   la4 r
   mi' mi
   
   %130
   dod8[(mi dod) dod-!]
   mi4 mi
   dod8[(mi dod) dod-!]
   
   %133
   mi4 mi
   dod8[la dod red]
   mi[mi mi, mi]
   
   %136
   la16\f(si) dod la fad'(mi) re fad
   mi(re) dod mi re(dod) si re
   dod si dod la fad'(mi) re fad
   
   %139
   mi(re) dod mi re(dod) si re\mbreak
   dod (si) dod la fad'(mi) re fad
   mi(re) dod mi re(dod) si re
   
   %142
   dod(si) dod la fad' mi re mi
   mi re dod mi re(dod) si re
   <<{s8 mi[mi]}\\{dod[dod dod]}>>
 
}


VvcIn =\relative do {
   
   r8
   R2*8
   la8[si dod re]
   mi r mi r\mbreak
   
   %11
   mi[mi mi mi]
   la,4 r
   la8 r mi' r
   
   %14
   la r dod, r
   re[re mi mi]
   la,[la' la,] r
   
   %17
   R2*4
   la'2
   sold
   
   %23
   <<fad\\si,>>
   mi4. mi8\f 
   si[si' si, si]\mbreak 
   
   %26
   si[si' si, si]
   si[si' mi,, mi'] 
   si[si' si, si] 
   
   %29
   si[si' si, si] 
   si[si' si, si]
   si[si' mi,, mi'] 
   
   %32
   si[si' si,] r
   R2*8
   mi4\p mi
   
   %42
   mi2
   mi4 mi
   mi2
   
   %45
   mi4 mi
   mi8 r r lad(
   si) [si si, si]
   
   %48
   mi,\f[mi' la, la']
   si,[si' si, si]\mbreak
   mi, [mi' la, la']
   
   %51
   si,[si' si, si] 
   mi, [mi' la, la']
   si,[si' si, si] 
   
   %54
   mi, [mi' la, la']
   si,[si' si, si] 
   mi,[mi' mi,] r
   
   %57
   mi4\f mi
   mi mi
   mi8[mi' mi, mi]\mbreak
   
   %60
   la4 r
   R2*3
   r8 fad'\p[la si]
   
   %65
   la-![sold-! fad-! mid-!]
   fad-![sold-! la-! si-!]
   la-![sold-! fad-! mid-!]
   
   %68
   fad4 r
   R2*3
   r8 mi[sold-! la-!]
   
   %73
   sold-![fad-! mi-! red-!]
   mi-![fad-! sold-! la-!]
   sold-![fad-! mi-! red-!]
   
   %76
   mi[mi si sold]
   mi4\f mi
   mi mi
   
   %79
   mi8[mi' mi mi]
   la,[la' la, la]
   la4 la\mbreak
   
   %82
   la la
   la8[la'  la la]
   re,4 r8 re\ff 
   
   %85
   mi[fad sold! la]
   si[sold la dod]
   mi, [fad sold la]
   
   %88
   si[sold la dod]
   mi,[fad sold la]
   si[sold la la,]
   
   %91
   re[mi fad red]
   mi mi mi,4
   mi'8[fad sold la]\mbreak
   
   %94
   si[sold la dod]
   mi,[fad sold la]
   si[sold la dod]
   
   %97
   mi,[fad sold la]
   si[sold la la,]
   re[mi fad red]
   
   %100
   mi [mi mi,] r
   \clef tenor \key la\major mi''\p r r4
   mi8 r r4
   
   %103
   mi8 r r4
   mi8 r r4\mbreak
   R2*4
   
   %109
   \clef bass \key la\major la,8 r r4
   si8 r r4
   sold8 r r4
   
   %112
   la8 r r4
   la8 r mi r
   la r do, r
   
   %115
   re[re red red]\mbreak
   mi[mi mi, mi'\f] 
   mi[fad sold la]
   
   %118
   si[sold la dod]
   mi,[fad sold la]
   si[sold la] r
   
   %121
   R2*7\mbreak
   r8 la\p[(mi dod)]
   la4 la
   
   %130
   la2
   la4 la
   la2
   
   %133
   la4 la
   la8 r r4
   R2
   
   %136
   la8\f[la' re,, re']
   mi,[mi' mi, mi']
   la,[la' re,, re']
   
   %139
   mi,[mi' mi, mi']\mbreak
   la,[la' re,, re']
   mi,[mi' mi, mi']
   
   %142
   la,[la' re,, re']
   mi,[mi' mi, mi']
   la,[la' la,]
   
}


VvcIIn =\relative do {
   
   r8
   la\p[si dod re]
   mi r mi r
   mi[mi mi mi]
   
   %4
   la,4 r
   la8 r mi' r
   la r dod, r
   
   %7
   re[re mi mi]
   la,[la' la,] r
   R2*8
   
   %17
   la'2\p(
   sold
   <<fad\\si,>>
   
   %20
   mi)
   R2*3
   r4 r8 mi,\f 
   
   %25
   si'[si' si, si]\mbreak 
   si[si' si, si]
   si[si' mi,, mi'] 
   si[si' si, si] 
   
   %29
   si[si' si, si] 
   si[si' si, si]
   si[si' mi,, mi'] 
   
   %32
   si[si' si,] r
   mi4\p mi
   mi2
   
   %35
   mi4 mi
   mi2 
   mi4 mi\mbreak
   
   %38
   mi8 r r lad,
   si[si si si]
   mi[mi mi,] r
   
   %41
   R2*7
   mi8\f[mi' la, la']
   si,[si' si, si]\mbreak
   mi, [mi' la, la']
   
   %51
   si,[si' si, si] 
   mi, [mi' la, la']
   si,[si' si, si] 
   
   %54
   mi, [mi' la, la']
   si,[si' si, si] 
   mi,[mi' mi,] r
   
   %57
   mi4\f mi
   mi mi
   mi8[mi' mi, mi]\mbreak
   
   %60
   la la'4\p si8
   la-![sold-! fad-! mid-!]
   fad-![sold-! la-! si-!]
   
   %63
   la-![sold-! fad-! mid-!]
   fad r r4
   R2*3
   
   %68
   r8 fad,[fad'-! la-!]
   sold-![fad mi! red]
   mi-![fad-! sold-! la-!]\mbreak
   
   %71
   sold-![fad mi! red]
   mi r r4
   R2*3
   
   %76
   r8 mi[si sold]
   mi4\f mi
   mi mi
   
   %79
   mi8[mi' mi mi]
   la,[la' la, la]
   la4 la\mbreak
   
   %82
   la la
   la8[la'  la la]
   re,4 r8 re\ff 
   
   %85
   mi[fad sold! la]
   si[sold la dod]
   mi, [fad sold la]
   
   %88
   si[sold la dod]
   mi,[fad sold la]
   si[sold la la,]
   
   %91
   re[mi fad red]
   mi mi mi,4
   mi'8[fad sold la]\mbreak
   
   %94
   si[sold la dod]
   mi,[fad sold la]
   si[sold la dod]
   
   %97
   mi,[fad sold la]
   si[sold la la,]
   re[mi fad red]
   
   %100
   mi [mi mi,] r
   la'\p r r4
   si8 r r4
   
   %103
   sold8 r r4
   la8 r r4\mbreak
   la8 r mi r 
   
   %106
   la r do, r
   re8[re mi mi]
   la, la' la, r
   
   %109
   mi'' r r4
   mi8 r r4
   mi8 r r4
   
   %112
   mi8 r r4
   R2*3\mbreak
   r4 r8 mi,,\f
   mi'[fad sold la]
  
   %118
   si[sold la dod]
   mi,[fad sold la]
   si[sold la] r
   
   %121
   la,4\p la
   la2
   la4 la
   
   %124
   la2
   la4 la
   la8 r r4
   
   %127
   R2*9
   la8\f[la' re,, re']
   mi,[mi' mi, mi']
   la,[la' re,, re']
   
   %139
   mi,[mi' mi, mi']\mbreak
   la,[la' re,, re']
   mi,[mi' mi, mi']
   
   %142
   la,[la' re,, re']
   mi,[mi' mi, mi']
   la,[la' la,]
   
}

forma = {

    \time 2/4
    \key la\major
    \tempo 2 = 60
    \partial 8 s8
    s2*55
    s4 s8
    \bar ":..:"
    s
    s2*88
    \bar ":|."

}


Vfl = {
    \Vglobal
    <<\Vfln \forma>>
}


VvlI = {
    \Vglobal
    <<\VvlIn \forma>>
}


VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>
}


Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>
}


VvcI = {
    \Vglobal
    \clef bass
    <<\VvcIn \forma>>
}


VvcII = {
    \Vglobal
    \clef bass
    <<\VvcIIn \forma>>
}
#(set-global-staff-size 15.7)




\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller{Divertimento V in La maggiore}
        composer = \markup \center-column{"L. Boccherini (1743 -1805)"}
    }

    \markup\huge { [1.] Adagio}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \Ifl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [2.] All[egr]o}

    \score {

        \new ChoirStaff \with  {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [3.] Minuetto}

    \score {

        \new ChoirStaff \with  {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [4.] Trio}

    \score {

        \new ChoirStaff \with  {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IVfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IVvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IVvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [5.] Gara - Presto}

    \score {

        \new ChoirStaff \with  {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \Vfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \VvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \VvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \VvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

}

