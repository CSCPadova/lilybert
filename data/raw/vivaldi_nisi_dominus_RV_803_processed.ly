\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

parentSlur =
 -\tweak stencil
 #(lambda (grob)
   (let* ((cp (ly:grob-property grob 'control-points))
          (lp (grob-interpret-markup grob (markup #:teeny "(")))
          (rp (grob-interpret-markup grob (markup #:teeny ")"))))
     (set! lp (ly:stencil-aligned-to lp Y CENTER))
     (set! lp (ly:stencil-aligned-to lp X 0.2))
     (set! lp (ly:stencil-translate lp (first cp)))
     (set! rp (ly:stencil-aligned-to rp Y CENTER))
     (set! rp (ly:stencil-aligned-to rp X -0.2))
     (set! rp (ly:stencil-translate rp (last cp)))
     (list-set! cp 0
       (cons (cdr (ly:stencil-extent lp X))
             (cdr (first cp))))
     (list-set! cp (1- (length cp))
       (cons (car (ly:stencil-extent rp X))
             (cdr (last cp))))
     (ly:grob-set-property! grob 'control-points cp)
     (apply ly:stencil-add (list lp rp
       (ly:slur::print grob)))))
 \etc

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


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \terzine\senza

}

Isopranon = \relative do'' {

   \autoBeamOff
   r8
   R1*11
   mi8 la, la si dod16[si] la[sold] la8 r
   mi' dod dod re dod16[re] mi[re] dod8 mi\mbreak

   %14
   mi4 re dod16 si la4 mi'8
   mi re re dod16 si dod[re] mi8 r mi
   mi sold,16 la si8 dod dod si r mi

   %17
   mi si16 dod re8 re\mbreak re8 dod dod dod
   red [mi16 red] mi8 mi mi4(red)
   mi r r2

   %20
   r mi8 si si dod
   dod si16[la] si4r4 r8 la\mbreak
   re,16[mi] fad[sol] la[si] dod re si8 si r si

   %23
   mi,16[fad] sold[la] si[dod] re mi dod8 dod r mi
   mi re16 dod re8 re dod16[mi fad,8]~fad16[la sold si]\mbreak
   dod[mi fad,8]~fad16[la sold si] \tuplet 3/2 { la [si dod] si[dod re] } dod8 r

   %26
   \tuplet 3/2 { dod16 [re mi] re[mi fad] } mi8 r la,8. [si32 dod] re8.\tr [dod32 si]
   dod8.[re32 mi] fad8.\tr[mi32 re] mi16 re dod8 r4
   mi8 re dod re16 dod\mbreak dod4(si\tr)

   %29
   la r8 mi' fad mi r16 dod si dod
   re8 dod r16 mi re mi fad8 mi mi mi
   mi re16 dod si4 la r\mbreak

   %32
   R1*4

}

ItestoI = \lyricmode {

   Ni -- si ni -- si Domi - nus ni -- si ni -- si Domi - nus

   ae -- difi - cave - rit, ae -- difi - cave - rit domum, _

   in vanum _ labo - rave - runt, in vanum _ labo - rave - runt,

   qui ae -- difi - cant e -- am.

   Nisi _ nisi _ Domi - nus ae -- difi - cave - rit domum, _ ae -- difi - cave - rit domum, _

   in vanum _ labo - ra -- ve - - - - - - - - - - - - - runt qui ae -- difi - cant e -- am,

   in vanum _ labo - ra -- verunt _ labo - ra -- verunt _ qui ae -- difi - cant e -- am.

}

Ialton = \relative do' {

   \autoBeamOff
   r8
   R1*12
   dod'8 la la si la16[si] dod[si] la8 si
   dod4 si la16 si dod4 dod8

   %15
   dod si si la16 sold la[si] dod8 r4
   r2 r4 r8 dod
   si sold16 la si8 si\mbreak si la la la

   %18
   la4 sold16[la] si8 si4. la8
   la4 r r2
   r si8 sold sold la

   %21
   la sold16[fad] sold4 r4 r8 mi\mbreak
   sol?2 fad
   si4. sold8 mi4 r8 dod'

   %24
   si si16 si si8 si la16[dod re,8]~re16[fad mi sold]\mbreak
   la[dod re,8]~re16[fad mi sold] la4 r
   \tuplet 3/2 { la16[si dod] si[dod re] } dod8 r r2

   %27
   la8.[si32 dod] re8.\tr[dod32 si] dod16 si la8 r4
   dod8 si la si16 la\mbreak la4(sold\tr)
   la r8 dod re dod r16 la sold la

   %30
   si8 la r16 dod si dod re8 dod si si
   dod si16 la sold4 la r\mbreak
   R1*4

}

ItestoII = \lyricmode {

   Ni -- si ni -- si Domi - nus

   ae -- difi - cave - rit, ae -- difi - cave - rit domum, _

   in vanum _ labo - rave - runt

   qui ae -- difi - cant e - am.

   Nisi _ nisi _ Domi - nus ae -- difica -- verit do - mum

   in vanum _ labo - ra -- ve - - - - - - - - - runt qui ae -- difi - cant e -- am,

   in vanum _ labo - ra -- verunt _ labo - ra -- verunt _ qui ae -- difi - cant e -- am.

}

Itenoren = \relative do' {

   \autoBeamOff
   r8
   R1*11
   dod8 dod dod re mi16[re] dod[si] dod8 r
   mi mi mi mi mi8. mi16 mi8 mi\mbreak

   %14
   mi4 fad la16 mi mi4 mi8
   mi16[fad] sold8 sold sold16 sold la8 mi r4
   r2 r4 r8 la

   %17
   sold sold16 sold sold8 sold\mbreak mi mi mi mi
   fad[sold16 fad] sold8 sold fad2\tr
   mi4 r r2

   %20
   r2 mi8 mi mi mi
   mi8. mi16 mi8 mi la,16[si] dod[re] mi [fad] sol16 la\mbreak
   fad8 re r fad si,16[dod] red[mi] fad[sold?] la si

   %23
   sold8 mi r4 r r8 la
   sold sold16 sold sold8 sold la16[dod re,8]~re16[fad mi sold]\mbreak
   la16[dod re,8]~re16[fad mi sold] la4 r

   %26
   \tuplet 3/2 { la16[si dod] si[dod re] } dod8 r r2
   la8. [si32 dod] re8.\tr[dod32 si] dod16 si la8 r4
   mi8 mi mi mi16 mi\mbreak mi2

   %29
   la,8 la' la la, r16 la' la la la8 la,
   r16 la' la la la8 la, r4 sold'8 sold
   la la16 la mi4 la, r\mbreak

   %32
   R1*4

}

ItestoIII = \lyricmode {

   Ni -- si ni -- si Domi - nus ni -- si ni -- si Domi - nus

   ae -- difi - cave - rit, ae -- difi - cave - rit domum, _

   in vanum _ labo - rave - runt,

   qui ae -- difi - cant e -- am.

   Nisi _ nisi _ Domi - nus ae -- difi - cave - rit domum, _ ae -- difi - cave - rit domum, _

   in vanum _ labo - ra -- ve - - - - - - - - - runt qui ae -- difi - cant e -- am,

   in vanum _ labo - ra -- verunt _ labo - ra -- verunt _ qui ae -- difi - cant e -- am.

}

IvlIn = \relative do'' {

   la8
   mi'8[la, sold la16 si] la8 mi mi mi'
   la[dod, si dod16 re]dod8 la la la'
   mi4 re\tr dod16 re mi4 la8

   %4
   mi4 re\tr dod16 re mi8 r la
   \appoggiatura la sold[fad16 mi si'8 re,] dod16 mi fad,8~fad16 la sold si\mbreak
   la mi' fad,8~fad16 la sold si la8[la'16 fad sold mi fad re]

   %7
   dod mi fad,8~fad16 la sold si  la8. si32 dod re8.\tr dod32 si
   dod8. re32 mi fad8.\tr  mi32 re mi8. fad32 sold la8.\tr sold32 fad
   mi8 r \tuplet 3/2 { la,16(si dod) si[(dod re)] } dod8 r16 fad32 sold la8.\tr sold32 fad\mbreak

   %10
   mi8 r \tuplet 3/2 { la,16(si dod) si[(dod re)] } dod8. fad32 sold la8.\tr sold32 fad
   mi8 la,16 si si4\tr la16 mi dod mi la,4
   r2 r4 \tuplet 3/2 { dod'16(re mi) re[(mi fad)] }

   %13
   mi4 r r  \tuplet 3/2 { dod16(re mi) re[(mi fad)] }\mbreak
   mi4 r r8 la dod,16 re mi8
   r2 r8 la dod,16 re mi8

   %16
   mi[sold,16 la si8 dod] dod8 si si'16 sold fad mi
   mi8\p[si16 dod re8 re]\mbreak re dod dod la'
   fad[sold16 fad sold8 sold] fad4.\f fad8

   %19
   mi[si' fad sold16 la] sold8[si red, mi16 fad]
   sold8 si sold, fad mi4 r
   R1*2

   %23
   r2 \tuplet 3/2 { dod'16(re mi) re[(mi fad)] } mi8 la
   mi [re16 dod re8 re] dod16 mi fad,8~fad16 la sold si\mbreak
   R1*2

   %27
   r2 mi8. fad32 sold la8.\tr sold32 fad
   mi8 [re dod re16 dod]\mbreak r2
   R1*2

   %31
   r2  la'8[dod, si dod16 re]\mbreak
   dod8 la la la' mi4 re\tr
   dod16 re mi4 la8mi4 re\tr

   %34
   dod8. re32 mi fad8.\tr mi32 re mi8. fad32 sold la8.\tr sold32 fad
   mi8 la,16 si si4\tr la2\fermata

}

IvlIIn = \relative do'' {

   r8
   r2 r4 r8 dod
   mi[la, sold la16 si] la8 mi mi mi'
   dod4 si\tr la16 si dod4 mi8

   %4
   dod4 si\tr la16 si dod8 r la'
   \appoggiatura la8 sold[fad16 mi si'8 re,] dod16 mi fad,8~fad16 la sold si\mbreak
   la mi' fad,8~fad16 la sold si la8[la'16 fad sold mi fad re]

   %7
   dod mi fad,8~fad16 la sold si  la4 r
   la8. si32 dod re8.\tr dod32 si dod8. re32 mi fad8.\tr mi32 re
   dod8 r \tuplet 3/2 { la16(si dod) si[(dod re)] } dod8 r16 re32 mi fad8.\tr mi32 re\mbreak

   %10
   dod8 r \tuplet 3/2 { la16(si dod) si[(dod re)] } dod8. re32 mi fad8.\tr mi32 re
   dod8 la4 sold8 la16 mi dod mi la,4
   r2 r4 \tuplet 3/2 { la'16(si dod) si[(dod re)] }

   %13
   dod4 r r \tuplet 3/2 { la16(si dod) si[(dod re)] }\mbreak
   dod4 r r8 mi la,16 si dod8
   r2 r8 mi la,16 si dod8

   %16
   si[mi,16 fad sold8 la] la sold sold'16 mi re dod
   si8\p sold16 la si8 si\mbreak si la la mi'
   red [mi16 red mi8 mi] mi4\f red

   %19
   mi8[sold red mi16 fad] mi8 sold  si, dod16 red
   mi8 sold mi, red mi4 r
   R1*2

   %23
   r2 \tuplet 3/2 { la16(si dod) si[(dod re)] } dod8 dod
   si si16 si si8 si la16 dod re,8~re16 fad mi sold\mbreak
   R1*2

   %27
   r2 dod8. re32 mi fad8.\tr mi32 re
   dod8 [si la si16 la]\mbreak r2
   R1*2

   %31
   r2 mi'8[la, sold la16 si]
   la8 mi mi mi' dod4 si\tr
   la16 si dod4 mi8 dod4 si\tr

   %34
   la8. si32 dod re8.\tr dod32 si dod8. re32 mi fad8.\tr mi32 re
   dod8 la4 sold8 la2\fermata

}

Ivlan = \relative do' {

   r8
   r dod si sold' mi dod r4
   r8 mi sold mi mi dod r dod'
   la mi sold4 mi r8 dod'

   %4
   dod mi, sold4 mi8 dod' mi dod
   si sold4 sold8 mi r re mi\mbreak
   la, r re mi la,4 r8 si'

   %7
   mi, r re mi la, mi'4 sold8
   la dod la sold r dod la si
   dod r r sold mi dod r si'\mbreak

   %10
   mi, dod r sold' mi dod r si'
   mi,4 mi dod la
   r2 r4 mi'8sold

   %13
   la4 r r  mi8 sold\mbreak
   la4 r r8 mi mi4
   r2 r8 mi mi4

   %16
   sold mi mi mi
   mi\p mi mi mi8 dod'
   fad, si4 si8 si4.\f si8

   %19
   si4 si si8 mi, fad red
   si4 si si r
   R1*2

   %23
   r2 mi8 sold mi[mi]
   mi mi, r8 mi' la, r re mi\mbreak
   la, r re mi la, mi' la mi

   %26
   la, mi' la mi la, la' si sold
   la, la' re, mi la, la' re, mi
   la, mi' la[re,]\mbreak mi re mi mi,

   %29
   la si dod la re la dod la
   re la dod la re la' sold[mi]
   la la, mi'[mi,] dod'4 mi\mbreak

   %32
   mi8 dod dod dod dod4 sold'
   mi mi mi la
   mi8 dod la'[sold] r dod la sold

   %35
   r mi fad mi dod2\fermata

}

Iogn = \relative do {

   r8
   r la mi' re dod la r4
   r8 la mi' mi, la4 r8 la'
   la la, mi' mi, la la' dod la

   %4
   la la, mi' mi, la la' dod la
   r mi sold mi la, r re mi\mbreak
   la, r re mi la,4 r8 sold'

   %7
   la r re, mi la, la' sold mi
   r la re mi, r la re sold,
   la la, r mi' la la, re' [sold,]\mbreak

   %10
   la la, r mi' la la, re' [sold,]
   la\f la, mi'[mi,] la4 la
   la'8 la, r mi' la la, r mi'

   %13
   la la, r mi' la la, r mi'\mbreak
   la la, mi'[mi,] la' la, r la'
   mi mi, mi mi' la la, r la'

   %16
   mi4 mi mi mi
   mi mi\mbreak la,8 la' mi[dod]
   si si' mi, mi, si'' la si si,

   %19
   mi mi si' si, mi, mi' si' si,
   mi, mi' si' si, mi mi, r la
   mi' mi, r mi' dod si dod la\mbreak

   %22
   r re fad re r si red si
   r mi sold fad la mi la, la'
   mi mi, r mi' la, r re mi\mbreak

   %25
   la, r re mi la, mi' la mi
   la, mi' la mi la, la' si sold
   la, la' re, mi la, la' re, mi

   %28
   la, mi' la[re,]\mbreak mi re mi mi,
   la si dod la re la dod la
   re la dod la re la' sold[mi]

   %31
   la la, mi'[mi,] la4 mi'8 mi,\mbreak
   la si dod si la la' mi mi,
   la si dod si la la' mi mi,

   %34
   la la' re, mi la, la' re, mi
   la, la' re, mi la,2\fermata

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}

forma = {

   \key la\major
   \time 4/4
   %\override Staff.TimeSignature.style = #'single-digit
   \tempo 2 = 50
   \partial 8 s8
   s1*35
   \bar "|."

}

Isoprano = {
   \new Voice = "nisi"
   \Iglobal
   \notypeset
   <<\Isopranon\forma>>
}

Ialto = {
   \new Voice = "nisi1"
   \Iglobal
   <<\Ialton\forma>>
}

Itenore = {
   \new Voice = "nisi2"
   \Iglobal
   <<\Itenoren\forma>>
}


IvlI = {
   \Iglobal
   \clef violin
   <<\IvlIn \forma>>
}


IvlII = {
   \Iglobal
   \clef violin
   <<\IvlIIn \forma>>
}


Ivla = {
   \Iglobal
   \clef alto
   <<\Ivlan \forma>>
}


Iog = {
   \Iglobal
   \clef bass
   <<\Iogn \forma \Ibfn>>
   \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f

}

IIvlamn = \relative do'' {

   <<{<re la fad>8 fad16 mi re dod}\\{re,4}>>
   re'16 si la sol fad mi
   re8 re'8.(mi32 fad)

   %4
   mi16 sol mi dod la[sol]
   la, \once\stemDown sol'' sol8.\tr [fad32 mi]
   fad16 fad sol la la,[do]

   %7
   si sol' fad mi si[re]
   dod?8.\tr si16 la8
   <<{<re la fad>4}\\{re,16 [\slurUp re'32(mi) fad(mi) re(dod)]}>> re16[la']

   %10
   la, la' si, sol' dod, la'
   <<{fad[mi32 re] \appoggiatura la'8 sol16[fad32 mi] la16 r}\\{la,8[la la]}>>
   <<{fad16 la la sol sol fad

      %13
      fad la la sol sol fad
      fad\stemDown re''-.(re-. dod-. dod-. si-.
      si-. la-. la-. sol-. fad-. fad-.)

      %16
      \stemUp fad32(re) sol(mi) fad[(re) sol(mi)] fad(re) sol(mi)
      fad32[(sol la8)] re,32[mi] mi8
      re8}\\{re,16[re re] <dod la>[<dod la> re]
             re re re <dod la> <dod la> re
             re4 s8
             s4.
             la'8[la la]
             la4.
             <la fad re>8}>> r16 re' re32[(dod) re16]

   %19
   dod32(si) dod16 si32[(la) si16] la32(sol) la16
   sol32(fad) sol16 fad32[(mi) fad16] mi32(re) mi16
   <<{fad32(re) sol(mi) fad[(re) sol(mi)] fad(re) sol(mi)

      %22
      fad32[(sol la8)] re,32[mi] mi8
      re4}\\{la4.~
                     la
                     <la fad re>4}>> r8
   R4.*14

   %38
   \senza \tuplet 3/2 { mi'16(la, mi') fad[(la, fad')] sold(la, sold')
   la(mi re dod[si la]) la'(sold fad)
   mi16(la, mi') fad[(la, fad')] sold(si, sold')

   %41
   la(mi re dod[si la]) } si8\tr\mbreak
   la4 r8
   R4.*9\mbreak

   %52
   <<{\senza \override TupletBracket.bracket-visibility = ##f\tuplet 3/2{si16 re si si[re si] si re si}
      <mi dod>4.
      <mi dod>~

      %55
      <mi dod>
      <re si>~
      <re si>

      %58
      <sol dod,>~
      <sol dod,>
      <re la>~

      %61
      <re la>
      <re la fad re>16[la' la sol]}\\{si,16 s si s si s
                                     si4.
                                     lad~
                                     lad
                                     si~
                                     si
                                     la?~
                                     la
                                     <fad re>~
                                     <fad re>
                                     la,4}>> sol''16\tr[fad32 mi]

   %63
   fad16 la la sol sol\tr[fad32 mi]
   fad16 la fad re la[fad]
   re16 r fad'8\tr\noBeam~fad32 mi( fad sol)

   %66
   mi16 r mi8\tr\noBeam~mi32 re(mi fad)
   re16 r re8\tr\noBeam~ re32 dod(re mi)
   dod16 mi8 re dod16

   %69
   re16 fad8 mi re16
   mi16 sol8 fad mi16\mbreak
   fad la dod,4\tr

   %72
   <<{fad32(re) sol(mi) fad[(re) sol(mi)] fad(re) sol(mi)
      fad4}\\{la,4.
              <la fad re>4}>> r8
   dod mi la

   %75
   fad16 mi32 re dod4\fermata\tr
   <<{<re la fad>4}\\{re,16 [\slurUp re'32(mi) fad(mi) re(dod)]}>> re16[la']
   la, la' si, sol' dod, la'

   %78
   <<{fad[mi32 re] \appoggiatura la'8 sol16[fad32 mi] la16 r}\\{la,8[la la]}>>
   <<{fad16 la la sol sol fad
      fad la la sol sol fad

      %81
      fad\stemDown re''-.(re-. dod-. dod-. si-.
      si-. la-. la-. sol-. fad-. fad-.)
      \stemUp fad32(re) sol(mi) fad[(re) sol(mi)] fad(re) sol(mi)

      %84
      fad32[(sol la8)] re,32[mi] mi8
      re8}\\{re,16[re re] <dod la>[<dod la> re]
             re re re <dod la> <dod la> re
             re4 s8
             s4.
             la'8[la la]
             la4.
             <la fad re>8}>> r16 re' re32[(dod) re16]
   dod32(si) dod16 si32[(la) si16] la32(sol) la16

   %87
   sol32(fad) sol16 fad32[(mi) fad16] mi32(re) mi16
   <<{fad32(re) sol(mi) fad[(re) sol(mi)] fad(re) sol(mi)
      fad32[(sol la8)] re,32[mi] mi8

      %90
      re4\fermata}\\{la4.~
                     la
                     <la fad re>4}>> r8

}

IIalton = \relative do' {

   \autoBeamOff
   R4.*22
   re8[fad] la
   \con \terzine\tuplet 3/2 { si16 [dod] re16 } la4

   %25
   sol8 dod[mi]
   fad, la re
   sol, fad4

   %28
   fad16\tr[mi32 re] mi4
   \tuplet 3/2 { si'16[dod re] } sold,4\tr
   \tuplet 3/2 { la16[sold] la } mi4

   %31
   re'16[dod32 si] la8 [sold]
   la16[dod si la] re[si]
   dod[la sold la] re[si]

   %34
   mi,4.
   re
   dod8[mi] la

   %37
   \tuplet 3/2 { re16[si re] dod[si la] } si8\tr
   la4 r8
   R4.*3\mbreak

   %42
   la8[mi] dod'
   \appoggiatura re16 dod8 si16[la] si8
   mi, sold[re']

   %45
   \tuplet 3/2 { dod16 si la } sold8 la
   \appoggiatura  sold fad\tr mi r
   dod' si[la]

   %48
   \tuplet 3/2 { mi'16 re dod } si8 la
   sold16[fad] mi8 r
   dod' lad[(fad)]

   %51
   re'16 dod si8 r\mbreak
   fad si[re]
   dod4.~

   %54
   dod~
   \tuplet 3/2 { dod16[re mi] mi[dod si] lad[sold fad] }
   re'8[si fad]

   %57
   re[fad re']
   sol,~\tuplet 3/2 { sol16[la si] dod[re mi] }
   dod8[sol mi]

   %60
   fad~\tuplet 3/2 { fad16[fad sol] la[si dod] }
   re8~\tuplet 3/2 { re16[la sol] fad[mi re] }\mbreak
   la'4.\tr~

   %63
   la~
   la~
   la16 r  la8\tr\parentSlur (la32)[sol\parentSlur (la si))]

   %66
   sol16 r sol8\tr~sol32[fad\parentSlur (sol la)]
   fad16 r fad8\tr~fad32[mi\parentSlur (fad sol)]
   mi16[sol8 fad mi16]

   %69
   fad[la8 sol fad16]
   sol[si8 la sol16]\mbreak
   la re, mi4\tr

   %72
   re r8
   re fad[la]
   la4.~

   %75
   la16 sol32[fad] mi4\tr\fermata
   re4.
   R4.*14

}

IItesto = \lyricmode {

   Ni -- si  Domi - nus cu -- sto -- die - rit civi - tatem _

   frustra _  vigi - lat qui cu -- sto - - - - - - diat e - - am.

   Ni -- si  Domi - nus cu -- sto -- die - rit ci -- vi -- tatem _ cu -- sto -- die - rit ci -- vi -- tatem _

   frustra _  vigi - lat qui cu -- sto - - - - - - - - - - - - - - - - - - - - - diat e -- am

   qui cu -- sto -- diat e -- am.

}

IIvlIn = \relative do'' {

   re,8\p la' la,
   re4 r8
   re8 fad re

   %4
   la4 r8
   la8 dod la
   re fad re

   %7
   sol, sol' sold
   la la, dod\mbreak
   re re' r %%% ripresa

   %10
   fad, sol la
   re, mi fad
   re4 r8

   %13
   re4 r8
   re si' la
   sol fad mi

   %16
   re16 la re la re[la]\mbreak
   re8 la' la,
   re re' si

   %19
   la sol fad
   mi re dod
   re16 la re la re[la]

   %22
   re8 la' la,
   re4 r8  %%fine ripresa
   R4.*14

   %38
   la8_\markup\italic"Viol[i]ni Soli" la la
   la4 r8
   la la la

   %41
   la mi' mi
   la,4 r8
   R4.*33
   re8_\markup \italic"Viol[i]ni Soli" re' r %%% ripresa

   %77
   fad, sol la
   re, mi fad
   re4 r8

   %80
   re4 r8
   re si' la
   sol fad mi

   %83
   re16 la re la re[la]\mbreak
   re8 la' la,
   re re' si

   %86
   la sol fad
   mi re dod
   re16 la re la re[la]

   %89
   re8 la' la,
   re4\fermata r8  %%fine ripresa

}

IIogn = \relative do {

   R4.*22
   re4_\markup\italic"Org[an]o Solo" fad8
   sol fad re

   %25
   mi la, dod
   re fad re
   mi re sold,

   %28
   la dod' la
   sold mi re
   dod la dod

   %31
   si sold' mi
   la, la' sold
   la, la' sold

   %34
   la dod la\mbreak
   si sold mi
   dod la dod

   %37
   si la mi'
   la,4 r8
   R4.*3

   %42
   la8_\markup\italic"Org[an]o Solo" dod' la
   mi sold mi
   sold, mi' sold

   %45
   la mi dod
   re dod si
   la mi' dod

   %48
   la re red
   mi fad sol!
   lad, fad' lad,

   %51
   si re si\mbreak
   si si' si,
   fad fad' fad,
   fad fad' fad,

   %55
   fad fad' fad,
   si si' si,
   si si' si,

   %58
   la la' la,
   la la' la,
   re4 r8

   %61
   re4 r8
   re4 la8
   re4 la8

   %64
   re4 r8
   re fad re
   mi dod la

   %67
   re dod sold
   la la la
   la la la

   %70
   la la la\mbreak
   re la' la,
   re16\p la re la re la

   %73
   re4 r8
   la4.
   re8 la4\fermata

   %76
   re4.
   R4.*14

}

forma = {

   \key re\major
   \time 3/8
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 4. = 43
   s4.*90
   \bar "|."

}


IIvlam = {
   \IIglobal
   %\notypeset
   <<\IIvlamn \forma>>
}

IIalto = {
   \new Voice = "nisi"
   \IIglobal
   <<\IIalton\forma>>
}


IIvlI = {
   \IIglobal
   <<\IIvlIn \forma>>
}


IIog = {
   \IIglobal
   \clef bass
   <<\IIogn \forma>>
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f

}

IIIalton = \relative do' {

   \autoBeamOff
   r8
   R2*21
   sol'4 si8 re
   si4 sol

   %24
   sol2
   fad
   mi

   %27
   re
   do'\tr~
   do4. si8

   %30
   si4 r
   sol8 re16 re si'8 sol16 sol
   re'8. si16 si4\mbreak

   %33
   re8. \appoggiatura do16 si la8[sol]
   la8. re,16 re4
   r8 re fad la

   %36
   si16 [sol si do] re[si la sol]
   la[fad la si] do[la sol fad]
   sol[mi sol la] si[sol fad mi]

   %39
   fad[re mi fad] sol[la si dod]
   re[fad mi re dod si la sol]\mbreak
   fad[re mi fad sol la si dod]

   %42
   re[fad mi re dod si la sol]
   fad[re mi fad sol la si dod]
   re8 re, r4

   %45
   sib'2
   sib?4. mi8
   \appoggiatura re16 dod2~

   %48
   dod
   re~
   re8.[mi16] fa4~

   %51
   fa8.[mi16] re4~\mbreak
   re8.[do16] si4~
   si8. [la16] sold4~

   %54
   sold fa'~
   fa mi16[re] do[si]
   do[si] la8 r4

   %57
   mi'2
   fa,
   red

   %60
   mi4. fad32[sold la si]
   do2~
   do8[mi do la]

   %63
   mi4 si'\fermata\mbreak
   la r
   R2*2

   %67
   la4 do8 mi
   do4 la
   fa2

   %70
   mi
   re
   do

   %73
   re'2\tr~
   re4. do8\mbreak
   do4 r

   %76
   la8 fad!16 fad do'8 la16 la
   fad'8. si,16 si4
   r8 do si16[la] sol[fad]

   %79
   sol8. fad16 mi4
   r8 do' do16[si] la[sol]
   fad[la sol fad] re'[do si la]

   %82
   si[re si la sol fa mi re]
   mi[sol la si] do[sol do re]\mbreak
   mi[re do si la sol fad mi]

   %85
   fad[la si do] re[do si la]
   si[sol si re] si[sol si re]
   do[sol do mi] do[sol do mi]

   %88
   fad,[re fad la] fad[re fad la]
   si[sol si re] si[sol si re]
   mi,[do re mi fad sol la si]

   %91
   do[re mi re do si la sol]
   fad8 re r4
   do'2\mbreak

   %94
   sib
   la
   sib~

   %97
   sib
   la
   r8 re si? sol

   %100
   mi16[sol la si] do[si la sol]
   fad[la si do] re[do si la]
   sol[si do re] mi[re do si]

   %103
   la[do re mi] fad[mi re do]\mbreak
   si[sol la si do re mi fad]
   sol8 sol, r4

   %106
   re fad8 la
   dod2~
   dod

   %109
   re4 mib~
   mib8. [re16] do4~
   do8.[sib16] la4~

   %112
   la8.[sol16] fad4~
   fad8[mib' re16 do sib la]
   sib[la] sol8 r4\mbreak

   %115
   do,2
   do4 do
   fad'!2~

   %118
   fad
   sol8[fa16 mib re do sib? la]
   sib8[la16 sol] si8[(la\tr)]

   %121
   sol4 r
   R2*5

}

IIItesto = \lyricmode {

   Vanum _  est vobis _ an -- te lu -- cem sur -- ge -- re.

   Sur -- gite _ sur -- gite _ sur -- gite _

   post -- quam se -- deri - tis, qui

   mandu - ca - - - - - - - - - - - - tis pa -- nem do -- lo - - - - - - - - - ris

   pa -- nem do -- lo - - - -  ris.

   Vanum _  est vobis _ an -- te lu -- cem sur -- ge -- re.

   Sur -- gite _ sur -- gite _ sur -- gite _

   post -- quam se -- deri - tis, qui

   mandu - ca - - - - - - - - - - - - - - - - - - tis

   pa -- nem do -- lo -- ris qui

   mandu - ca - - - - - - - - - tis pa -- nem do -- lo - - - - - - ris

   pa -- nem do -- lo - - - ris.


}

IIIvlIn = \relative do'' {

   sol'8
   sol,4~sol16 fad sol la
   si8[sol' si, do]
   re4~re16 do re mi

   %4
   la,8[la' la, la]
   do4~do16 si do re
   sol, re sol la si sol si do

   %7
   re si re fa mi do mi fad
   sol re sol la si sol si do
   re8 re, r re\p\mbreak

   %10
   do2(
   sib)
   sol'(

   %13
   mib)
   sol,(
   fad)

   %16
   fad16\f re fad sol la fad la si
   do la do fad la do, si la
   si sol si do re si re sol

   %19
   si sol re si do la re la
   si re si sol re8 fad
   sol,4 r\mbreak

   %22
   R2*2
   si'16 si si si si si si si
   la la la la la la la la

   %26
   sol sol sol sol sol sol sol sol
   fad fad fad fad fad fad fad fad
   fad fad fad fad fad fad fad fad

   %29
   fad fad fad fad fad fad fad fad
   re4 r
   sol'\f si

   %32
   re r\mbreak
   si,8\p[si si si]
   la [la la la]

   %35
   la4 r
   si' si
   la la

   %38
   sol sol
   la r
   la r\mbreak

   %41
   la r
   la r
   la r

   %44
   la r
   re,8\p[re re re]
   re[re re mi]

   %47
   mi[mi mi mi]
   mi[mi mi mi]
   re[re re re]

   %50
   fa[fa fa fa]
   fa?[fa fa fa]\mbreak
   fa?[fa fa fa]

   %53
   fa?[fa fa fa]
   fa?[fa fa fa]
   fa?[fa fa fa]

   %56
   mi[mi mi mi]
   mi[mi mi mi]
   fa[fa fa fa]

   %59
   red,[red red red]
   mi[mi mi mi]
   mi[mi mi mi]

   %62
   mi[mi mi mi]
   mi2\fermata\mbreak
   la16 mi la si do la do re

   %65
   mi do mi la sold mi si' re,
   do mi do la re,8 mi
   la,4 r

   %68
   R2
   la'16 la la la la la la la
   sol sol sol sol sol sol sol sol

   %71
   fa fa fa fa fa fa fa fa
   mi mi mi mi mi mi mi mi
   re re re re re re re re

   %74
   re re re re re re re re\mbreak
   \once\stemUp do8[la'' fad! sol]
   la4 la

   %77
   la la
   la la
   sol8[si sol mi]

   %80
   do4 r
   la' la
   si si

   %83
   sol sol\mbreak
   sol sol
   fad fad

   %86
   sol sol
   sol sol
   fad fad

   %89
   sol sol
   sol sol
   sol sol

   %92
   fad16 re fad sol la fad mi re
   do8[do do do]\mbreak
   sib[sib sib sib]

   %95
   la[la la la]
   sib[sib sib sib]
   sib?[sib sib sib]

   %98
   la[la la la]
   si!4 r
   do,8 do mi mi

   %101
   re[re fad fad]
   mi[mi sol sol]
   fad[fad la la]\mbreak

   %104
   sol16\f[sol la si do re mi fad]
   sol8[ re si sol]
   re4 r

   %107
   dod'8\p[dod dod dod]
   dod?[dod dod dod]
   re[re mib mib]

   %110
   mib?[mib mib mib]
   mib?[mib mib mib]
   mib?[mib mib mib]

   %113
   mib?[mib mib mib]
   re[re re re]\mbreak
   do,[do do do]

   %116
   do[do do do]
   do[do do do]
   do[do do do]

   %119
   sib[sol' fad! fad]
   sol4 re_\fermata
   sol16\f re sol la si sol si do

   %122
   re la re fad la do, si la
   si sol si re sol re sol la
   si sol re si do la re la\mbreak

   %125
   si re si sol re8 fad
   sol,2\fermata

}

IIIvlIIn = \relative do'' {

   r8
   r4 r8 sol'
   sol,4~sol16 fad sol la
   si8 sol' si,16 la si do

   %4
   fad,4~fad16 mi fad sol
   la8 la' la,16 sol la si
   sol re sol la si sol si do

   %7
   re si re fa mi do mi fad
   sol re sol la si sol si do
   re8 re, r si\p\mbreak

   %10
   la2(
   sol)
   re'(

   %13
   do)
   mib,(
   re)

   %16
   fad16\f re fad sol la fad la si
   do la do fad la do, si la
   si sol si do re si re sol

   %19
   si sol re si do la re la
   si re si sol re8 fad
   sol,4 r\mbreak

   %22
   R2*2
   sol'16 sol sol sol sol sol sol sol
   \repeat unfold 8 {  fad }

   %26
   \repeat unfold 8 { mi  }
   \repeat unfold 8 { re  }
   \repeat unfold 8 {  do }

   %29
   \repeat unfold 8 { do }
   si4 r
   re'\f sol

   %32
   si r\mbreak
   sol,8\p[sol sol sol]
   fad[fad fad fad]

   %35
   fad4 r
   re' re
   fad fad

   %38
   sol sol
   fad r
   fad r\mbreak

   %41
   fad r
   fad r
   fad r

   %44
   fad r
   sib,8\p[sib sib sib]
   sib?[sib sib sib]

   %47
   dod[dod dod dod]
   dod?[dod dod dod]
   la[la la la]

   %50
   re[re re re]
   re[re re re]\mbreak
   re[re re re]

   %53
   re[re re re]
   re[re re re]
   re[re re re]

   %56
   do[do do do]
   do[do do do]
   do[do do do]

   %59
   red,[red red red]
   mi[mi mi mi]
   mi[mi mi mi]

   %62
   mi[mi mi mi]
   mi2\fermata\mbreak
   la16 mi la si do la do re

   %65
   mi do mi la sold mi si' re,
   do mi do la re,8 mi
   la,4 r

   %68
   R2
   fa'16 \repeat unfold 7 {fa}
   \repeat unfold 8 {mi}

   %71
   \repeat unfold 8 {re}
   \repeat unfold 8 {do}
   \repeat unfold 8 {si}

   %74
   \repeat unfold 8 {si}\mbreak
   \once\stemUp la8[mi'' red mi]
   fad4 fad

   %77
   fad fad
   fad fad
   mi8[sol mi si]

   %80
   la4 r
   fad' fad
   re re

   %83
   mi mi\mbreak
   mi mi
   la, la

   %86
   si si
   do do
   do do

   %89
   si si
   do do
   do do

   %92
   la16 la re mi fad la, sol fad
   la8[la la la]\mbreak
   sol[sol sol sol]

   %95
   fad[fad fad fad]
   sol[sol sol sol]
   sol[sol sol sol]

   %98
   fad[fad fad fad]
   sol4 r
   do,8 do mi mi

   %101
   re[re fad fad]
   mi[mi sol sol]
   fad[fad la la]\mbreak

   %104
   sol16\f[sol la si do re mi fad]
   sol8[ re si sol]
   re4 r

   %107
   la'8\p[la la la]
   la[la la la]
   la4 do

   %110
   do8[do do do]
   do[do do do]
   do[do do do]

   %113
   do[do do do]
   si[si si si]\mbreak
   do,[do do do]

   %116
   do[do do do]
   do[do do do]
   do[do do do]

   %119
   sib[sol' fad! fad]
   sol4 re_\fermata
   sol16\f re sol la si sol si do

   %122
   re la re fad la do, si la
   si sol si re sol re sol la
   si sol re si do la re la\mbreak

   %125
   si re si sol re8 fad
   sol,2\fermata

}

IIIvlan = \relative do' {

   r8
   r si[si si]
   r re[re re]
   r re[sol sol]

   %4
   r fad[fad fad]
   r fad[fad fad]
   re[re re re]

   %7
   si[si' sol la]
   re,[si' si si]
   la fad r re\p\mbreak

   %10
   fad[fad fad fad]
   re[re re re]
   sib'[sib sib sib]

   %13
   sol[sol sol sol]
   do,[do do do]
   la[la la la]

   %16
   la8\f [la fad' fad]
   fad[fad fad fad]
   re[re si si]

   %19
   re[re fad fad]
   re[re re re]
   si4 r\mbreak

   %22
   R2*2
   re8[re re re]
   re[re re re]

   %26
   mi[mi mi mi]
   la,[la la la]
   la[la la la]

   %29
   la[la la la]
   mi4 r
   si''\f re

   %32
   sol, r\mbreak
   re8\p[re re re]
   re[re re re]

   %35
   re4 r
   re sol
   re re

   %38
   do' mi,
   fad r
   re r\mbreak

   %41
   re r
   re r
   re r

   %44
   re r
   sol8\p[sol sol sol]
   sol[sol sol sol]

   %47
   la[la la la]
   la[la la la]
   la[la la la]

   %50
   si[si si si]
   si[si si si]\mbreak
   si[si si si]

   %53
   si[si si si]
   si[si si si]
   si[si si si]

   %56
   do[do do do]
   la[la la la]
   la[la la la]

   %59
   red,[red red red]
   mi[mi mi mi]
   mi[mi mi mi]

   %62
   mi[mi mi mi]
   mi2\fermata\mbreak
   mi8[mi mi mi]

   %65
   do do si sold'
   mi[mi re mi]
   la,4 r

   %68
   R2
   re8[re re re]
   mi[mi mi mi]

   %71
   la,[la la la]
   mi[mi mi mi]
   mi[mi mi mi]

   %74
   mi[mi mi mi]\mbreak
   \once\stemUp mi[do'' la si]
   si4 si

   %77
   si si
   si si
   la8[do la fad]

   %80
   mi4 r
   re re
   re re

   %83
   do do\mbreak
   do do
   do do

   %86
   re re
   mi mi
   la fad

   %89
   re re
   mi mi
   mi mi

   %92
   re8[re re re]
   fad[fad fad fad]\mbreak
   re[re re re]

   %95
   fad[fad fad fad]
   mi[mi mi mi]
   mi[mi mi mi]

   %98
   fad[fad fad fad]
   re4 r

   %100
   do8 do mi mi
   re[re fad fad]
   mi[mi sol sol]

   %103
   fad[fad la la]\mbreak
   sol4 r
   sol8\f[re' si sol]

   %106
   re4 r
   mi8\p[mi mi mi]
   mi[mi mi mi]

   %109
   fad4 la
   la8[la la la]
   la[la la la]

   %112
   la[la la la]
   la[la la la]
   si[si si si]\mbreak

   %115
   do,[do do do]
   do[do do do]
   do[do do do]

   %118
   do[do do do]
   sib[sol' fad! fad]
   sol4 re_\fermata

   %121
   re8\f[re re re]
   la'4 la8 sol
   re[re re re]

   %124
   re[re re re]\mbreak
   re[re re re]
   sol,2\fermata

}

IIIogn = \relative do {

   r8
   r sol'16[fad sol8 sol,]
   r8 sol'16[fad sol8 sol,]
   r8 sol'16[fad sol8 sol,]

   %4
   re'[re'16 do re8 re,]
   r re16[do re8 fad,]
   sol[sol' sol sol]

   %7
   sol,[sol' do do]
   si[sol sol sol]
   fad re r sol\p \mbreak

   %10
   sol[sol sol sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %13
   do,[do do do]
   do[do do do]
   re[re re re]

   %16
   re,8[re re re']
   re,[re re re']
   sol,[sol sol sol']

   %19
   sol, sol' re re,
   sol sol' re re,
   sol4 r\mbreak

   %22
   sol' r
   sol8[re si sol]
   sol'[sol sol sol]

   %25
   fad[fad fad fad]
   mi[mi mi mi]
   re[re re re]

   %28
   re[re re re]
   re[re re re]
   sol,4 r

   %31
   sol\f sol
   sol r\mbreak
   sol8\p[sol sol sol]

   %34
   re'[re re re]
   re4 r
   sol sol

   %37
   fad fad
   mi mi
   re r

   %40
   re r\mbreak
   re r
   re r

   %43
   re r
   re r
   sol8\p[sol sol sol]

   %46
   sol[sol sol sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %49
   fa[fa fa fa]
   sold,[sold sold sold]
   sold?[sold sold sold]\mbreak

   %52
   sold?[sold sold sold]
   sold?[sold sold sold]
   sold?[sold sold sold]

   %55
   sold?[sold sold sold]
   la[la la la]
   la[la la la]

   %58
   la[la la la]
   red[red red red]
   mi[mi mi mi]

   %61
   mi[mi mi mi]
   mi[mi mi mi]
   mi2\fermata\mbreak

   %64
   la,8[la la la]
   la la mi' mi
   la, la re mi

   %67
   la,4 r
   la' la,
   fa'8[fa fa fa]

   %70
   mi[mi mi mi]
   re[re re re]
   do[do do do]

   %73
   sold[sold sold sold]
   sold?[sold sold sold]
   la[la' fad! mi]

   %76
   red4 red
   red? red
   red? red

   %79
   mi mi
   la8 la, r4
   re re

   %82
   sol sol
   do, do\mbreak
   do do

   %85
   re re
   sol sol
   do, do

   %88
   re re
   sol sol
   do, do

   %91
   do do
   re8[re re re]
   re[re re re]\mbreak

   %94
   re[re re re]
   re[re re re]
   dod[dod dod dod]

   %97
   dod?[dod dod dod]
   re8 re re16 do? si! la
   sol4 r

   %100
   do8 do mi mi
   re[re fad fad]
   mi[mi sol sol]

   %103
   fad[fad la la]\mbreak
   sol4 r
   sol8\f[re' si sol]

   %106
   \parenthesize re4 r
   sol8[sol sol sol]
   sol[sol sol sol]

   %109
   fad[fad fad fad]
   fad[fad fad fad]
   fad[fad fad fad]

   %112
   fad[fad fad fad]
   fad[fad fad fad]
   sol[sol sol sol]\mbreak

   %115
   do,[do do do]
   do[do do do]
   do[do do do]

   %118
   do[do do do]
   sib[sol' fad! fad]
   sol4 re_\fermata

   %121
   sol8\f[sol sol sol]
   fad fad fad fad
   sol[sol sol sol]

   %124
   sol sol fad fad\mbreak
   sol sol re re
   sol,2\fermata

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}

forma = {

   \key sol\major
   \time 2/4
   %\override Staff.TimeSignature.style = #'single-digit
   \tempo 2 = 57
   \partial 8 s8
   s2*126
   \bar "|."

}

IIIalto = {
   \new Voice = "vanum"
   \notypeset
   \IIIglobal
   <<\IIIalton\forma>>
}


IIIvlI = {
   \IIIglobal
   \clef violin
   <<\IIIvlIn \forma>>
}


IIIvlII = {
   \IIIglobal
   \clef violin
   <<\IIIvlIIn \forma>>
}


IIIvla = {
   \IIIglobal
   \clef alto
   <<\IIIvlan \forma>>
}


IIIog = {
   \IIIglobal
   \clef bass
   <<\IIIogn \forma \IIIbfn>>
   \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IVglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f

}

IValton = \relative do' {

   \autoBeamOff
   r8
   R2.*14
   r4. r8 r do
   do4 sol'8 sol4 fa8

   %17
   fa4.(mi4) do'8
   sol4 la8 fa4.
   mi4.~mi4 do8

   %20
   do4(sol'8) sol4(do8)\mbreak
   do4 sol8 fa4.\tr
   mi2.

   %23
   sol4 sol8 \appoggiatura {la16[si]} do8. si16 la8
   sol8. fad16 sol8~sol4.
   re4(do'8) si4 la8

   %26
   re4 fad,8 sol4.~\mbreak
   sol4 do8 si4(la8)
   si16 [re do si la sol] la [do si la sol fad]

   %29
   sol4. re4 do'8
   si16 [re do si la sol] la4.\tr
   sol r

   %32
   R2.
   r4. r8 r re
   re4 sol8 sol4 fa8\mbreak

   %35
   fa4.(mi4) do'8
   sol4 la8 sib4.
   la~la4 do8

   %38
   si8. [la16 sol8] fa8. [mi16 re8]
   mi16[re] do4 r4.
   do'8 si16[la]sol[fa] mi8 re do

   %41
   fa8. mi16 fa8 r4.\mbreak
   re'8 do16[si] la[sol] fad8 mi re
   sol8. fad16 sol8 r4.

   %44
   r sol8 sol sol
   la[sol] la si[la] si
   do[si] do re fa, sol

   %47
   mi[re] mi re' fa,[sol]
   mi[re] mi sol4 sol8\mbreak
   la16 [do si la sol fa] sol[si la sol fa mi]

   %50
   fa[la sol fa mi re] mi8[sol do]
   do[si16 la sol fa] mi8[fa re]
   do4. r

   %53
   sol' sol
   sol fa
   si do4 r8

   %56
   do4 do,8 mi4 re8\tr\fermata
   do4. r
   R2.*10

}

IVtesto = \lyricmode {

    Cum dede - rit di  -- lec -- tis suis _ som -- num di  -- lec -- tis suis _ som -- num:

    ec -- ce haere - di -- tas Do -- mini, fili - i mer -- ces, fruc - tus ven - tris fructus _ ven - tris.

    Cum dede - rit di  -- lec -- tis suis _ som - - - - - num: ec -- ce haere - di -- tas Domi - ni, ec -- ce haere - di -- tas Domi - ni,

    fili - i mer -- ces, fruc -- tus ven -- tris fili - i mer -- ces, fruc -- tus ven -- tris fruc -- tus ven - - - - - tris

    fruc -- tus ven - - tris  fruc -- tus ven - tris.

}

IVcln = \relative do {

   do8
   do4 sol'8 sol4 fa8
   fa4.(mi4) do'8
   re(do si la sol fa)

   %4
   mi8. re16 do8 do4 sol'8\mbreak
   la16 fa la si do8 sol16 mi sol si do8
   fa,16 re fa si re8 re16 do si la sol fa

   %7
   fa4\tr mi8 r r do'
   si16 re do si la sol la do si la sol fad
   \appoggiatura fad?8 sol4. r8 r sol

   %10
   fa?16 sol, sol sol sol sol sol4 fa'8
   mi 16 sol, sol sol sol sol sol4 mi'8
   re16 sol, sol si si re re fa fa si si do\mbreak

   %13
   do8 si16 la sol fa mi8 sol do
   do si16 la sol fa mi8 fa re
   do4. r8 r do % fine ritornello

   %16
   do4 mi8 mi4 re8
   \appoggiatura re do4.~do4 sol'8
   mi4 fa8 re4.\tr

   %19
   do16 mi fa sol la si do4 mi,8
   mi4 mi8 mi4 sol8\mbreak
   sol4 mi8 re4.\tr

   %22
   do16 mi fa sol la si do8 sol mi
   si'4 si8 \appoggiatura {fad16[sol]} la8. sol16 fad8
   si8. la16 si8~si8. do16 re8

   %25
   fad,4 la8 sol4 fad8
   sol4 la8 si4.~\mbreak
   si4 la8 sol4 fad8

   %28
   sol16 si la sol fad mi re4 re8
   sol, sol'(si) la4.
   sol fad\tr

   %31
   sol16 sol, sol sol sol sol sol la' sol fa? mi re
   mi8 si' (do) fad, do'(re)
   si16 re do si la sol re8 la'4\tr

   %34
   sol4. r\mbreak
   do,2.~
   do~

   %37
   do4.~do4 la'8
   sol2.
   do,16 mi fa sol la si do8 sol mi

   %40
   do4 r8 r4.
   do'8 do16 si la sol fa8 sol la\mbreak
   re,4. r

   %43
   re'8 re16 do si la sol8 la fa
   mi8. re16 do8 mi mi mi
   fa (mi fa) sol(fa sol)

   %46
   la(sol la) si(si,) mi
   do(si) do si'(si,) mi
   do(si) do mi4 mi8\mbreak

   %49
   fa16 la sol fa mi re mi sol fa mi re do
   re fa mi re do si do8 mi sol
   do,4 r8 do fa sol

   %52
   do,16 do' si la sol fa  mi la sol fa mi re
   do4. r
   la'2.~

   %55
   la8 sol fa mi re do
   do4. sol\fermata
   do r8 r do

   %58
   do4 sol'8 sol4 fa8
   fa4.(mi4) do'8
   re(do si la sol fa)

   %61
   mi8. re16 do8 do4 sol'8\mbreak
   fa?16 sol, sol sol sol sol sol4 fa'8
   mi 16 sol, sol sol sol sol sol4 mi'8

   %64
   re16 sol, sol si si re re fa fa si si do\mbreak
   do8 si16 la sol fa mi8 sol do
   do si16 la sol fa mi8 fa re

   %67
   do4.\fermata r

}

IVvlIn = \relative do'' {

   do,8
   do do do si si si
   do do do do do do
   si si si si si si

   %4
   do do do do do do
   fa fa fa mi mi mi
   re re re si si si

   %7
   do do do do do do
   sol la si do re re
   sol, sol sol sol' sol, sol

   %10
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   sol sol sol sol sol sol\mbreak

   %13
   do sol sol do do do
   do sol sol do re sol,
   do4. r

   %16
   R2.*15
   sol8 sol sol sol sol sol
   do4 r8 re4 r8

   %33
   sol sol, sol re' re re
   sol, sol sol sol sol sol\mbreak
   do do do do do do

   %36
   do do do do do do
   fa fa fa fad fad fad
   sol, sol sol sol sol sol

   %39
   do do do do do do
   do do do do do do
   la la la la la la\mbreak

   %42
   fad' fad fad fad fad fad
   sol, sol sol sol sol sol
   do do do do do do

   %45
   fa fa fa sol, sol sol
   la la la sol sol sol
   do do do sol sol sol

   %48
   do do do do do do\mbreak
   fa fa re mi mi do
   re re si do4 r8

   %51
   do4 r8 do fa sol
   do, do do do do do
   do do do do do do

   %54
   fa fa fa fa fa fa
   sol, sol sol do do do
   do4. sol\fermata

   %57
   do r8 r do
   do do do si si si
   do do do do do do

   %60
   si si si si si si
   do do do do do do
   sol sol sol sol sol sol

   %63
   sol sol sol sol sol sol
   sol sol sol sol sol sol\mbreak
   do sol sol do do do

   %66
   do sol sol do re sol,
   do4.\fermata r

}

IVogn = \relative do {

   r8
   R2.*14
   r4._\markup\italic"Tasto solo" r8 r do
   do do do do do sol

   %17
   do do do do do do
   do do fa si, si sol
   do do do do do do

   %20
   do do do do do do\mbreak
   do do do re sol, sol
   do do do do do do

   %23
   sol' sol sol fad fad fad
   sol sol, sol sol sol sol
   re' re re re re re

   %26
   re re re re re re\mbreak
   re re re re re re
   sol, sol sol re' re re

   %29
   sol, sol' sol fad fad fad
   sol sol, sol re' re, re
   sol sol sol sol sol sol

   %32
   do4 r8 re4 r8
   sol sol, sol re' re, re
   sol sol sol sol sol sol\mbreak

   %35
   do do do do do do
   do do do do do do
   fa, fa fa fad fad fad

   %38
   sol sol sol sol sol sol
   do do do do do do
   do do do do do do

   %41
   la la la la la la\mbreak
   fad fad fad fad fad fad
   sol sol sol sol sol sol

   %44
   do do do r4.
   R2.*13
   R2.*10

}

IVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}

forma = {

   \key do\major
   \time 6/8
   %\override Staff.TimeSignature.style = #'single-digit
   \tempo 4. = 47
   \partial 8 s8
   s2.*67
   \bar "|."

}

IValto = {
   \new Voice = "cum"
   \notypeset
   \IVglobal
   <<\IValton\forma>>
}


IVcl = {
   \IVglobal
   \clef bass
   <<\IVcln \forma>>
}


IVvlI = {
   \IVglobal
   <<\IVvlIn \forma>>
}


IVog = {
   \IVglobal
   \clef bass
   <<\IVogn \forma \IVbfn>>
   \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

Vtenoren = \relative do' {

    \autoBeamOff
    R2.*16
    re4 sol si
    la re, la'

    %19
    la8[sol] fad[mi] re[do]
    si4 sol r
    si'2.\mbreak

    %22
    la
    sol2\tr sol4
    fad r r

    %25
    si(la) sol
    fad16 [mi re mi] fad [mi re mi] fad [sol la si]
    mi, [re dod re] mi [re dod re] mi [fad sol la]

    %28
    re, [dod si dod] re [dod si dod] re [mi fad sol]
    dod, [si dod re] mi [re mi fad] sol [fad sol mi]\mbreak
    fad4 r16 la [sol la] fad [sol mi fad]

    %31
    re4 r16 fad [mi fad] re [mi dod re]
    si4 r16 si' [la si] sol [la fad sol]
    mi4 r16 sol [fad sol] mi [fad re mi]

    %34
    dod4 r16 la[si dod re mi fad sol]
    la4 r16 re,[mi fad sol la si dod]
    re4 re, r

    %37
    la'(fad) re
    la mi'2\tr \mbreak
    re4 r r

    %40
    R2.*2
    la'4 fad re
    la' la, re'

    %44
    dod8[si] la[sol] fad[mi]
    fad4 re r
    la' fad(mi)

    %47
    red fad la\mbreak
    la8 [do! si la] sol[fad]
    sol16 [fad mi fad] sol [fad mi fad] sol [la si sol]

    %50
    do [si la sol] do [si la sol] do [si la sol]
    fad [mi re mi] fad [mi re mi] fad [sol la fad]
    si [la sol fad] si [la sol fad] si [la sol fad]

    %53
    mi [re do re] mi [re do re] mi [fad sol mi]
    la [sol fad mi] la [sol fad mi] la [sol fad mi]
    fad[re mi fad sol la si do] re [do si la]\mbreak

    %56
    si4 sol r
    sol re' re
    do re, do'

    %59
    si re, si'
    la re, re'
    do re, do'

    %62
    si re, si'\mbreak
    la re, la'8 do
    si4 do re

    %65
    mi,8[do' si la] sol [fad]
    sol4 r16 si [la si] sol [la fad sol]
    mi [sol fad mi] do' [si la sol] do [si la sol]

    %68
    fad [la sol fad] re'[do si la sol fad mi re]
    mi [sol fad  mi] do' [si la sol] fad [mi re do]
    re [fad mi re] si'[la sol fad mi re do si]

    %71
    do [mi re do] do' [si la sol] la [sol fad mi]
    fad4 r16 re[mi fad sol la si dod?]
    re4 re, r

    %74
    re'(si) sol
    re la'2\tr
    sol4 r r

    %77
    re'(si) sol
    la2.\tr_\fermopz
    sol

    %80
    R2.*6

}

Vtesto = \lyricmode {

    Sicut  _ sa -- gittae _ in manu _ po -- tentis, _ i -- ta fili - i excus - so - - - - - - - - - - - - - - - - - - - - - - - - - - - - rum

    excus - so - rum.

    Sicut  _ sa -- gittae _ in manu _ po -- tentis, _ i -- ta fili - i excus - so - - - - - - - - - - - - - - - - - - - - rum.

    Sicut  _ sa -- gittae _ in manu _ po -- tentis, _ in manu _ po -- tentis, _ po -- tentis, _

    i -- ta fili - i excus - so - - - - - - - - - - - - - - - - - - rum excus - so - rum excus - so -- rum.

}

VvlIn = \relative do'' {

    <<{si2 si8 si
       si2 si8 si
       la2 do8 do

       %4
       la2 do8 do
       <si sol>4}\\{sol16 re sol re sol re sol re sol8 sol
                    sol16 re sol re sol re sol re sol8 sol
                    fad16 re fad re fad re fad re la'8 la
                    fad16 re fad re fad re fad re la'8 la
                    sol,4}>> re''16 sol si sol re sol si re,
    do8 re, do'16 fad la fad do fad la do,

    %7
    si8 re, si'16 re sol re si re sol si,\mbreak
    la8 re, re'16 sol si sol re sol si re,
    do8 re, do'16 fad la fad do fad la do,

    %10
    si8 re, si'16 re sol re si re sol si,
    la re re re re re re re re re mi fad
    sol si, si si si si si si si si do re %%%% ripresa

    %13
    mi la, la la la la la la la la si do\mbreak
    si si' la sol fad sol fad mi re mi re do
    si sol' fad mi re mi re do si do si la

    %16
    sol sol fad mi re mi re do si do si la
    sol4 r r
    r16 re''[mi fad sol la si do] re8 r

    %19
    R2.
    r16 sol,,[la si do re mi fad] sol8 r
    r4 re16\p sol si sol re sol si re,\mbreak

    %22
    do8 re, do'16 fad la fad do fad la do,
    si8 re, si'16 re sol re si re sol si,
    la re re re re re re re re re mi fad

    %25
    sol 4 r r
    fad re si'~
    si mi, la~

    %28
    la re, sol~
    sol dod, sol'\mbreak
    fad16 fad fad fad fad4 r

    %31
    r16 fad fad fad fad4 r
    r16 re re re re4 r
    r16 mi mi mi mi4 r

    %34
    r16 mi mi mi mi4 r
    r16 fad fad fad fad\f[re mi fad sol la si dod]
    re la la la la fad fad fad fad re re re

    %37
    la4 fad re
    la mi'2\tr \mbreak
    re'16 la re la re la re la fad re fad re

    %40
    fad' re fad re fad re fad re la fad la fad
    re' dod si la sol fad mi re sol,8 la
    re4 r r

    %43
    dod la re'
    dod8 si la sol fad mi
    fad16[re mi fad sol la si dod] re8 re,

    %46
    do?4 r r
    R2.*3
    mi'4\p la do~

    %51
    do la fad
    re sol si~
    si sol mi

    %54
    do mi la~
    la fad re\mbreak
    re8 re' si sol re[si]
    sol4 re'16\p sol si sol re sol si re,

    %58
    do8 re, do'16 fad la fad do fad la do,
    si8 re, si'16 re sol re si re sol si,\mbreak
    la8 re, re'16 sol si sol re sol si re,

    %61
    do8 re, do'16 fad la fad do fad la do,
    si8 re, si'16 re sol re si re sol si,
    la re re re re re re re re re mi fad

    %64
    sol si, si si si si si si si si do re %%%% ripresa
    mi la, la la la la la la la la si do\mbreak
    si re re re re4 r

    %67
    sol, do mi
    fad sol si
    mi, la do

    %70
    re, sol si\mbreak
    do, mi la
    la16 fad fad fad fad re mi fad sol la si dod

    %73
    re16[re do? si la sol fad mi] re4
    re\f si sol
    re re re

    %76
    sol,16 sol' fad mi re mi re do si do si la
    sol4 si' sol
    re2.\fermata

    %79
    sol,
    sol''16 si, si si si si si si si si do re %%%% ripresa
    mi la, la la la la la la la la si do\mbreak

    %82
    si si' la sol fad sol fad mi re mi re do
    si sol' fad mi re mi re do si do si la
    sol sol fad mi re mi re do si do si la

    %85
    sol4\fermata r r

}

VvlIIn = \relative do'' {

    <<{si2 si8 si
       si2 si8 si
       la2 do8 do

       %4
       la2 do8 do
       <si sol>4}\\{sol16 re sol re sol re sol re sol8 sol
                    sol16 re sol re sol re sol re sol8 sol
                    fad16 re fad re fad re fad re la'8 la
                    fad16 re fad re fad re fad re la'8 la
                    sol,4}>> si'16 re sol re si re sol si,
    la8 re, la'16 do fad do la do fad la,

    %7
    sol8 re sol16 si re si sol si re sol,\mbreak
    fad8 re si'16 re sol re si re sol si,
    la8 re, la'16 do fad do la do fad la,

    %10
    sol8 re sol16 si re si sol si re si
    fad re' re re re re re re re re mi fad
    sol si, si si si si si si si si do re %%%% ripresa

    %13
    mi la, la la la la la la la la si do\mbreak
    si sol' fad mi re mi re do si do si la
    sol sol' fad mi re mi re do si do si la

    %16
    sol sol fad mi re mi re do si do si la
    sol4 r r
    r16 re''[mi fad sol la si do] re8 r

    %19
    R2.
    r16 sol,,[la si do re mi fad] sol8 r
    r4 si,16 re sol re si re sol si,\mbreak

    %22
    la8 re, la'16 do fad do la do fad la,
    sol8 re sol16 si re si sol si re sol,
    fad re' re re re re re re re re mi fad

    %25
    sol 4 r r
    re la fad'
    sol dod, mi

    %28
    fad si, re
    mi la, dod\mbreak
    re16 re re re re4 r

    %31
    r16 re re re re4 r
    r16 si si si si4 r
    r16 si si si si4 r

    %34
    r16 dod dod dod dod4 r
    r16 re re re re16\f[re mi fad sol la si dod]
    re fad, fad fad fad re re re re la la la

    %37
    la4 fad re
    la mi'2\tr
    la16 fad la fad la fad la fad re la re la

    %40
    re' la re la re la re la fad re fad re
    re' dod si la sol fad mi re sol,8 la
    re4 r r

    %43
    dod la re'
    dod8 si la sol fad mi
    fad16[re mi fad sol la si dod] re8 re,

    %46
    do?4 r r
    R2.*2
    si'4\p mi sol~

    %50
    sol mi do
    la re fad~
    fad re si

    %53
    sol do mi~
    mi do la
    fad la fad'\mbreak

    %56
    sol8 re' si sol re[si]
    sol4 si16\p re sol re si re sol si,
    la8 re, la'16 do fad do la do fad la,

    %59
    sol8 re sol16 si re si sol si re si
    fad8 re si'16 re sol re si re sol si,
    la8 re, la'16 do fad do la do fad la,

    %62
    sol8 re sol16 si re si sol si re sol,\mbreak
    fad re' re re re re re re re re mi fad
    sol si, si si si si si si si si do re

    %65
    mi la, la la la la la la la la si do
    si si si si si4 r
    mi, sol do

    %68
    la' re, sol
    sol do, fad
    fad si, mi\mbreak

    %71
    mi la, mi'
    fad16 re re re re re mi fad sol la si dod
    re16 [re do? si la sol fad  mi] re4

    %74
    re\f si sol
    re re re
    sol,16 sol' fad mi re mi re do si do si la

    %77
    sol4 si' sol
    re2.\fermata
    sol,

    %80
    sol''16 si, si si si si si si si si do re
    mi la, la la la la la la la la si do\mbreak
    si sol' fad mi re mi re do si do si la

    %83
    sol sol' fad mi re mi re do si do si la
    sol sol fad mi re mi re do si do si la
    sol4\fermata r r

}

Vtmn = \relative do'' {

    <<{si2 si8 si
       si2 si8 si
       la2 do8 do

       %4
       la2 do8 do
       <si sol>4}\\{sol16 re sol re sol re sol re sol8 sol
                    sol16 re sol re sol re sol re sol8 sol
                    fad16 re fad re fad re fad re la'8 la
                    fad16 re fad re fad re fad re la'8 la
                    sol,4}>> <<{re''8 re re[re]
                                do4 do8 do do do

                                %7
                                si re, si'[si si si]\mbreak
                                la re, re'[re] re re
                                do re, do'[do do do]

                                %10
                                si re, si'[si si si]
                                la16 re re re}\\{si8 si si[si]
                                       la re, la'2
                                       sol4 sol2\mbreak
                                       fad4 si2
                                       la4 la2
                                       sol4 sol8 sol sol sol
                                       re4}>> re'16 re re re re re mi fad
    sol si, si si si si si si si si do re %%%% ripresa

    %13
    mi la, la la la la la la la la si do\mbreak
    si sol' fad mi re mi re do si do si la
    sol sol' fad mi re mi re do si do si la

    %16
    sol sol fad mi re mi re do si do si la
    sol4 r r
    r16 re'[mi fad sol la si do] re8 r

    %19
    R2.
    r16 sol,[la si do re mi fad] sol8 r
    r4 <<{re8\p re re re\mbreak

          %22
          do [re,] do' do do do
          si [re,] si' si si si
          la16 re re re}\\{si2\mbreak
                 s4 la2
                 s4 sol2
                 re4}>> re'16 re re re re re mi fad

    %25
    sol4 r r
    R2.*4
    re16 re re re re4 r

    %31
    r16 re re re re4 r
    r16 si si si si4 r
    r16 si si si si4 r

    %34
    r16 dod dod dod dod4 r
    r16 re re re re16\f[re mi fad sol la si dod]
    re fad, fad fad fad re re re re la la la

    %37
    la4 fad re
    la mi'2\tr
    re'16 la re la re la re la fad re fad re

    %40
    fad' re fad re fad re fad re la fad la fad
    re' dod si la sol fad mi re sol,8 la
    re4 r r

    %43
    dod la re'
    dod8 si la sol fad mi
    fad16[re mi fad sol la si dod] re8 re,

    %46
    do?4 r r
    R2.*10
    r4 <<{re'8\p re re re

          %58
          do4 do8 do do do
          si4 si8 si si si
          la re, re'[re re re]

          %61
          do4 do8 do do do
          si re, si'[si si si]\mbreak
          la16 re re re}\\{si2
                           la8 re, la'2
                           sol8 re sol2
                           fad4 si2
                           la8 re, la'2
                           sol4 sol2\mbreak
                           fad4}>> re'16 re re re re re mi fad

    %64
    sol si, si si si si si si si si do re %%%% ripresa
    mi la, la la la la la la la la si do\mbreak
    si si si si si4 r

    %67
    mi,4 sol do
    la' re, sol
    sol do, fad

    %70
    fad si, mi\mbreak
    mi la, mi'
    fad16 re re re re re mi fad sol la si dod

    %73
    re16 [re do? si la sol fad  mi] re4
    re\f si sol
    re re re

    %76
    sol,16 sol' fad mi re mi re do si do si la
    sol4 si' sol
    re2.\fermata

    %79
    sol,
    sol''16 si, si si si si si si si si do re
    mi la, la la la la la la la la si do\mbreak

    %82
    si sol' fad mi re mi re do si do si la
    sol sol' fad mi re mi re do si do si la
    sol sol fad mi re mi re do si do si la

    %85
    sol4\fermata r r

}

Vvlan = \relative do' {

    si8 si16 si si8 si si si
    si8 si16 si si8 si si si
    si8 si16 si si8 si si si

    %4
    si8 si16 si si8 si si si
    si8 si16 si si8 si si si
    re re16 re re8 re re re'

    %7
    re, re16 re re8 re re re'\mbreak
    re, re16 re re8 re re re'
    re, re16 re re8 re re re'

    %10
    re, re16 re re8 re re re'
    re,16 re re re re re re re re re mi fad
    sol si, si si si si si si si si do re

    %13
    mi la, la la la la la la la la si do\mbreak
    mi8 dod' re fad, sol sol,
    sol dod' re fad, sol sol,

    %16
    sol16 sol' fad mi re mi re do si do si la
    sol4 r r
    fad' fad8 fad fad fad

    %19
    fad4 r r
    si, si8 si si si
    si4 sol'8 sol, sol sol

    %22
    re'4 re8 re re re
    re4 re8 re re re
    re16 re re re re re re re re re mi fad

    %25
    sol4 r r
    la fad re'
    mi la, dod

    %28
    re sol, si
    dod mi, la\mbreak
    la16 la la la la4 r

    %31
    r16 la la la la4 r
    r16 sol sol sol sol4 r
    r16 sol sol sol sol4 r

    %34
    r16 la la la la4 r
    r16 la la la la4 r
    r16 re\f re re re la la la la fad fad fad

    %37
    la4 fad re
    la la2\tr\mbreak
    fad'8 fad fad fad re[re]

    %40
    la' la la la fad[fad]
    re'16\p [dod si la sol fad mi re] sol,8 la
    re4 r r

    %43
    dod la re'
    dod8 si la sol fad mi
    fad16[re mi fad sol la si dod] re8 re,

    %46
    do?4 r r
    R2.*2
    mi4\p sol si

    %50
    do la mi
    re fad la
    si sol re

    %53
    do mi sol
    la mi mi
    re fad la\mbreak

    %56
    si8 re si sol re[si]
    sol4 sol'8\p sol sol sol
    re4 re8 re re re

    %59
    re4 re8 re re re
    re4 re8 re re re
    re4 re8 re re re

    %62
    re4 re8 re re re\mbreak
    re16 re re re re re re re re re mi fad
    sol si, si si si si si si si si do re

    %65
    mi la, la la la la la la la la si do
    si sol' sol sol sol4 r
    do, mi sol

    %68
    fad si re
    sol, la la
    fad sol sol\mbreak

    %71
    sol sol sol
    fad16 la la la la4 r
    r16 re[do? si la sol fad mi] re4

    %74
    re'\f si sol
    re re re
    sol,16 sol' fad mi re mi re do si do si la

    %77
    sol4 si' sol
    re2.\fermata
    sol,

    %80
    sol '16si, si si si si si si si si do re
    mi la, la la la la la la la la si do\mbreak
    mi8 dod' re fad, sol sol,

    %83
    sol dod' re fad, sol sol,
    sol16 sol' fad mi re mi re do si do si la
    sol4\fermata r r

}

Vogn = \relative do {

    sol'8 sol,16 sol sol8 sol sol sol'
    sol sol,16 sol sol8 sol sol sol'
    re re,16 re re8 re re re'

    %4
    re re,16 re re8 re re re'
    sol sol,16 sol sol8 sol sol sol'
    re re16 re re8 re re re'

    %7
    re, re16 re re8 re re re'\mbreak
    re, re16 re re8 re re re'
    re, re16 re re8 re re re'

    %10
    re, re16 re re8 re re re'
    re,16 \clef tenor re' re re re re re re re re mi fad
    sol si, si si si si si si si si do re

    %13
    mi la, la la la la la la la la si do\mbreak
    \clef bass mi,8 dod' re fad, sol sol,
    sol dod' re fad, sol sol,

    %16
    sol16 sol' fad mi re mi re do si do si la
    sol4 r r
    re''4 re,8 re re re

    %19
    re4 r r
    sol sol,8 sol sol sol
    sol4 sol'8 sol, sol sol\mbreak

    %22
    re'4 re8 re re re
    re4 re8 re re re
    re16\clef tenor re' re re re re re re re re mi fad

    %25
    sol4 r r
    \clef bass re, re re
    dod dod dod

    %28
    si si si
    la la la\mbreak
    re16 re re re re4 r

    %31
    r16 re re re re4 r
    r16 sol sol sol sol4 r
    r16 sol sol sol sol4 r

    %34
    r16 la la la la4 r
    r16 re, re re re4 r
    r16 re\f re re re' re, re re re' re, re re

    %37
    la'4 fad re
    la la'2\mbreak
    re,8 re16 re re8 re re re'

    %40
    re, re16 re re8 re re re'
    re16\p [dod si la sol fad mi re] sol,8 la
    re4 r r

    %43
    dod la re'
    dod8 si la sol fad mi
    fad16[re mi fad sol la si dod] re8 re,
    do?4 la2

    %47
    si4 red fad\mbreak
    si,2.
    mi4 mi mi

    %50
    la la la
    re, re re
    sol sol sol

    %53
    do, do do
    do do do
    re re re\mbreak

    %56
    sol8 re' si sol re[si]
    sol4 sol'8\p sol sol sol
    re4 re8 re re re

    %59
    re4 re8 re re re
    re4 re8 re re re
    re4 re8 re re re

    %62
    re4 re8 re re re\mbreak
    re16 \clef tenor re' re re re re re re re re mi fad
    sol si, si si si si si si si si do re

    %65
    mi la, la la la la la la la la si do
    si\clef bass sol sol sol sol4 r
    do, do do

    %68
    re si si
    do la la
    si sol sol\mbreak

    %71
    do do dod
    re16 re re re re4 r
    r16 re' [do? si la sol fad mi] re4

    %74
    re'\f si sol
    re re re
    sol,16 sol' fad mi re mi re do si do si la

    %77
    sol4 si' sol
    re2._\fermata
    sol,

    %80
    \clef tenor sol''16 si, si si si si si si si si do re
    mi la, la la la la la la la la si do\mbreak
    \clef bass mi,8 dod' re fad, sol sol,

    %83
    sol dod' re fad, sol sol,
    sol16 sol' fad mi re mi re do si do si la
    sol4_\fermata r r

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}

forma = {

    \key sol\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    s2.*85
    \bar "|."

}

Vtenore = {
    \new Voice = "sicut"
    \notypeset
    \Vglobal
    <<\Vtenoren\forma>>
}


VvlI = {
    \Vglobal
    \clef violin
    <<\VvlIn \forma>>
}


VvlII = {
    \Vglobal
    \clef violin
    <<\VvlIIn \forma>>
}


Vtm = {
    \Vglobal
    \clef violin
    <<\Vtmn \forma>>
}


Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>
}


Vog = {
    \Vglobal
    \clef bass
    <<\Vogn \forma \Vbfn>>
    \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


VIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \terzine\senza

}

VIsopranon = \relative do'' {

   \autoBeamOff
   r8
   R1*13
   r4 r8 la re la16 la la8 re\mbreak
   re\tr[dod] la la mi'16[dod] si[la] la8 la

   %16
   mi'16[re] dod[si] la8 si16 sol sol4\tr fad
   r8 re fad do' si16[la] sol8 r4\mbreak
   r8 mi sold re' dod16[si] la8 r mi'16 la,

   %19
   sold16[mi mi8\tr] si'16[sold sold8\tr] \tuplet 3/2 { dod16[la si] } dod8~\tuplet 3/2 { dod16[mi re] dod\tr[si la]
   si[sold la]} si8~\tuplet 3/2 { si16[re dod] si\tr[la sold] la[fad sold] } la8~\tuplet 3/2 { la16[ dod si] la\tr[sold fad]
   sold[mi fad] sold[la si] r sold[la] si[dod re] dod[la si] dod[re mi] r mi[re] dod[si la]

   %22
   mi[fad mi]}  mi8\tr \tuplet 3/2 { fad16[sold fad] } fad8\tr \tuplet 3/2 { sold16[la sold] } sold8\tr la4~
   \tuplet 3/2 { la16[mi' dod] } la8\tr~\tuplet 3/2 { la16[sold la] si[dod re] dod[mi dod] } la8~\tuplet 3/2 { la16[sold la] si[dod re] }\mbreak
   dod8 la r dod16 re mi4~mi16[re32 dod si la] sold?[fad]

   %25
   mi8 la16 si si4\tr la r
   R1
   r2\mbreak r4 r8 mi'

   %28
   mi16[dod] si16 la si8 sold la4 mi8 mi'
   re mi, mi re' dod mi,16 mi mi la mi'[dod]
   dod4\tr si r8 mi lad, fad\mbreak

   %31
   re'16[dod] si8 r4 r8 re sold, mi
   dod'16[si] la8 mi' sol,! fad16[re re8\tr] do'16[la la8\tr]
   si16[sol sol8\tr] re'16[si si8\tr] \tuplet 3/2 { dod16[mi re] dod[si la] sol[fad mi] si'[la sol]

   %34
   fad[re mi] fad[sol la] la[fad sol] la[si do]\mbreak si[sol la] si[dod? re] re[sold, la] si[dod re]
   dod[la si] dod[re mi] mi[re dod] si[la sol]} fad8 re r4
   r la'8 la \tuplet 3/2 { re16[dod re] re[dod re] fad[mi re] re[dod si] }

   %37
   si2\mbreak \tuplet 3/2 { dod16[si dod] dod[si dod] mi[re dod] dod[si la] }
   la2 \tuplet 3/2 { si16[la si] si[la si] re[dod si] si[la sol] }
   sol2\tuplet 3/2 { la16[si la] } la8\tr \tuplet 3/2 { r16 dod[re] mi[re dod]

   %40
   re[dod re]} re8\tr \tuplet 3/2 { r16 re[mi] fad[mi re] dod[re dod] } r 8\tuplet 3/2 { mi16[fad mi] } r8\mbreak
   \tuplet 3/2 { re16[mi re] } r8 \tuplet 3/2 { fad,16[sol fad] } r8
   \tuplet 3/2 { sol16[la si] } si8\tr[si\tr si\tr] \tuplet 3/2 { dod16[re mi] } mi8\tr[mi\tr mi\tr]

   %43
   re4\tr~re32[dod re mi] re16 r re4\tr~re32[dod re mi] re16 r
   \tuplet 3/2 { dod[mi re] dod[si la] } r4 re16[\parentSlur (dod)] re[\parentSlur (dod)]  re16[\parentSlur (dod)] re[\parentSlur (dod)]
   re4~re16[dod32 si la sol] fad[mi] re8 la'16 re dod4\tr

   %46
   re la8 la\mbreak  \tuplet 3/2 { la16[fad sol] } la8 \tuplet 3/2 { r16 fad[sol] } la8
   \tuplet 3/2 { r16 si[dod] } re8 \tuplet 3/2 { r16 si[dod] } re8 re16[\parentSlur (dod)] re[\parentSlur (dod)] re[(dod)] re[(dod)]
   re4~re16[dod32 si la sol] fad[mi] re8 la'16 re dod4\tr\fermata

   %49
   re4 r r2
   R1*8

}

VItesto = \lyricmode {

    Beatus _ _  beatus _ _  vir qui implevit _ _  desi - derium _  suum _ ex ipsis: _

    non confun - detur _ non confun - detur _ qui lo -- que  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - tur

    ini - mi -- cis suis _ in por -- ta.

    Beatus _ _  beatus _ _  vir qui implevit _ _  desi - derium _ _  suum _ ex ipsis: _

    non confun - detur _ non confun - detur _ qui lo -- que - - - - - - - - - - - - - - - - - - - - tur

    qui lo -- que - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - tur ini - mi -- cis suis _ in por -- ta

    qui lo -- que - - - - - - - - tur ini - mi -- cis suis _ in por -- ta.

}

VIvcn = \relative do' {

    la8
    re8.(mi32 fad) re8.(mi32 fad) mi8 la, r la
    mi'8.(fad32 sol) mi8.(fad32 sol) fad16 mi re8 r la
    \tuplet 3/2 { re16(la fad') re[(la fad')] re(la fad') re[(la fad')] dod(la mi') dod[(la mi')] dod(la mi') dod[(la mi')]

    %4
    re(la fad') re[(la fad')]  re(la fad') re[(la fad')] \mbreak mi(sol la,) mi' [(sol la,)] mi'(sol la,) mi' [(sol la,)]
    fad'(la la,) fad'[(la la,)]fad'(la la,) fad'[(la la,)] } sol'4 fad\tr
    mi r8 la, \tuplet 3/2 { re,16( mi fad) fad[(sol la)] la(si do) do[(si la)]

    %7
    si(re do) si[(la sol)] si(re do) si[(la sol)] mi(fad sold?) sold![(la si)] si(dod? re) re[(dod si)]
    dod(mi re) dod[(si la)] dod(mi re) dod[(si la)]\mbreak fa'(mi fa) sol[(fa mi)] fa(mi fa) sol[(fa mi)]
    fa(re mib) fa[(mib re)] fa(re mib) fa[(mib re)] mib(dod! re) mi?[(re dod)] re(dod re) mi[(re dod)]

    %10
    re(la re) re[(la re)] mi(la, mi') mi[(la, mi')] fad(la, fad') fad[(la, fad')]sol(la, sol') sol[(la, sol')]
    la(la, la') la[(la, la')] si(la, si') si[(la, si')]\mbreak dod(si dod) la[(si dod)] dod(si dod) la[(si dod)]
    re(dod re) mi[(re dod)] re(dod re) mi[(re dod)]  re la,la la[la la] re la la la[la la]

    %13
    re(mi fad) sol[(fad mi)] fad(mi re) sol[(fad mi)] fad(mi re) sol[( fad mi)]} mi4\tr
    re \clef bass r8 re, re mi fad re\mbreak
    la' sol la[dod,] la si dod[si]

    %16
    la si dod[la] re mi fad re
    \clef tenor \tuplet 3/2 { re'16(la re) re[(la re)] re(la re) re[(la re)]  re(si re) re[(si re)] re(si re) re[(si re)]\mbreak
    mi(si mi) mi[(si mi)] mi(si mi) mi[(si mi)] mi(dod mi) mi[(dod mi)] mi(dod mi) mi[(dod mi)]}

    %19
    \clef bass mi,8 fad sold[mi] la sold la[la,]
    re fad sold[mi]\mbreak fad mi fad[red]
    mi fad sold [mi] la sold la[la,]

    %22
    dod la re[si] mi re dod[si]
    la si dod[si] la si dod[si]\mbreak
    la si dod[si] la si dod[re]

    %25
    mi dod16 re mi8 mi, \clef tenor \tuplet 3/2 { la'16(si dod) dod[(re mi)] mi(re dod) dod[(si la)]
    sold(mi fad) sold[(la si)] si(dod re) re[(dod si)] dod( mi re) dod[(si la)]  dod( mi re) dod[(si la)] }
    la'-.(la-. la-. la-.) la-.(la-. la-. la-.)\mbreak \tuplet 3/2 { la la, (si) dod[(si la)] } si4\tr

    %28
    la8\clef bass dod, re[mi] la, si dod la
    si sold fad[mi] la si dod[la]
    mi' fad sol! mi \clef tenor \tuplet 3/2 { mi'16(dod mi) mi[(dod mi)]  mi(dod mi) mi[(dod mi)]

    %31
    re(si re) re[(si re)] re(si re) re[(si re)] re(si re) re[(si re)] re(si re) re[(si re)]
    dod(la dod) dod[(la dod)] dod(la dod) dod[(la dod)] } \clef bass re,8 mi fad re
    sol fad sol sol, la' sol la[dod,]

    %34
    re mi fad [re]\mbreak sol fad mi[sold]
    la sol? la[dod,]  \clef tenor \tuplet 3/2 { re'16(la fad') re[(la fad')] re(la fad') re[(la fad')]
                                                mi(la, sol') mi[(la, sol')] mi(la, sol') mi[(la, sol')] } fad4 r

    %37
    \tuplet 3/2 { sol16(fad sol) sol[(fad sol)] si(la sol) sol[(fad mi)]\mbreak } mi2\tr
    \tuplet 3/2 { fad16(mi fad) fad[(mi fad)]  la(sol fad) fad[(mi re)]} re2\tr
    \tuplet 3/2 { mi16(re mi) mi[(re mi)] sol(fad mi) mi[(re dod)] dod(re dod) } dod8\noBeam \tuplet 3/2 { r16 mi fad sol[fad mi]

    %40
    fad mi fad} fad8\noBeam \tuplet 3/2 { r16 fad sol la[sol fad] mi(fad mi) } r8 \tuplet 3/2 { sol16(la sol) } \parenthesize r8
    \tuplet 3/2 { fad16(sol fad) } r8 \tuplet 3/2 { la,16(si la) } r8
    \tuplet 3/2 { si16 dod re } re8\tr[re\tr re\tr] \tuplet 3/2 { mi16 fad sol } sol8\tr[sol\tr sol\tr]

    %43
    fad4\tr~fad32 mi fad sol fad16\noBeam r  fad4\tr~fad32[mi fad sol] fad16 r
    mi8 r \tuplet 3/2 { dod16 mi re dod[si la] } fad'(mi) fad(mi) fad(mi) fad(mi)
    fad4~fad16 mi32 re dod si la sol fad8 fad' mi4\tr

    %46
    re r\mbreak r8 \tuplet 3/2 { r16 fad, sol } la8\noBeam \tuplet 3/2 { r16 fad sol }
    la8 \tuplet 3/2 { r16 si dod } re8\noBeam \tuplet 3/2 { r16 si dod } re8\noBeam  fad16[(mi) fad(mi) fad(mi)]
    fad4~ fad16 mi32 re dod si la sol fad8 fad' mi4\fermata\tr

    %49
    re4 r8 la\tuplet 3/2 { re,16( mi fad) fad[(sol la)] la(si do) do[(si la)]
    si(re do) si[(la sol)] si(re do) si[(la sol)] mi(fad sold?) sold![(la si)] si(dod? re) re[(dod si)]
    dod(mi re) dod[(si la)] dod(mi re) dod[(si la)]\mbreak fa'(mi fa) sol[(fa mi)] fa(mi fa) sol[(fa mi)]

    %52
    fa(re mib) fa[(mib re)] fa(re mib) fa[(mib re)] mib(dod! re) mi?[(re dod)] re(dod re) mi[(re dod)]
    re(la re) re[(la re)] mi(la, mi') mi[(la, mi')] fad(la, fad') fad[(la, fad')]sol(la, sol') sol[(la, sol')]
    la(la, la') la[(la, la')] si(la, si') si[(la, si')]\mbreak dod(si dod) la[(si dod)] dod(si dod) la[(si dod)]

    %55
    re(dod re) mi[(re dod)] re(dod re) mi[(re dod)]  re la,la la[la la] re la la la[la la]
    re(mi fad) sol[(fad mi)] fad(mi re) sol[(fad mi)] fad(mi re) sol[( fad mi)]} mi4\tr
    re4\fermopz r r2

}

VIogn = \relative do {

    r8
    re re' fad, re la la' dod, si
    la la' dod, la re re' la fad
    re fad mi[re] la dod si[la]

    %4
    re fad mi[re]\mbreak la dod si la
    re fad mi re mi dod re sold,
    la la' fad mi re mi fad[re]

    %7
    sol fad sol [sol,] sold' fad sold[mi]
    la sold la[la,]\mbreak re! dod re[dod]
    re! re' sol,[re] sol dod,! re[la]

    %10
    la1_\markup\italic"Tasto solo"~
    la~
    la2 re8 mi fad[mi]

    %13
    re dod re dod re si' la[la,]
    re4 r8 re re mi fad re\mbreak
    la' sol la[dod,] la si dod[si]

    %16
    la si dod[la] re mi fad re
    fad mi re[fad] sol fad sol[sol,]
    sold' fad mi[sold] la sold la[la,]

    %19
    mi' fad sold[mi] la sold la[la,]
    re fad sold[mi]\mbreak fad mi fad[red]
    mi fad sold [mi] la sold la[la,]

    %22
    dod la re[si] mi re dod[si]
    la si dod[si] la si dod[si]\mbreak
    la si dod[si] la si dod[re]

    %25
    mi dod16 re mi8 mi,la si dod la
    mi' fad sold[mi] la, si dod[si]
    la si dod[si]\mbreak la la' mi[mi,]

    %28
    la dod re[mi] la, si dod la
    si sold fad[mi] la si dod[la]
    mi' fad sol! mi fad mi fad lad,\mbreak

    %31
    si dod re[si] mi re mi sold,
    la si dod[la] re mi fad re
    sol fad sol sol, la' sol la[dod,]

    %34
    re mi fad[re]\mbreak sol fad mi[sold]
    la sol la[dod,] re mi fad[re]
    dod la si[dod]re re' re[re,]

    %37
    sol fad sol sol,\mbreak dod' si dod[dod,]
    fad mi fad fad, si' la si[si,]
    mi re mi mi, la si dod[la]

    %40
    re mi fad[re] la' sol la[la,]\mbreak
    re' dod re re,
    sol fad sol si la sol la la,

    %43
    re mi fad mi re mi fad re
    la r la r re r re r
    r la si dod re re la' la,

    %46
    re mi fad mi\mbreak re r re r
    re r re r re r re r
    r la si dod re4 la_\fermata

    %49
    re r re8 mi fad[re]
    sol fad sol [sol,] sold' fad sold[mi]
    la sold la[la,]\mbreak re? dod re[dod]

    %52
    re re' sol,[re] sol dod,! re[la]
    la1_\markup\italic"Tasto solo"~
    la~

    %55
    la2 re8 mi fad[mi]
    re dod re dod re si' la[la,]
    re4\fermopz r r2

}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}

forma = {

   \key re\major
   \time 4/4
   %\override Staff.TimeSignature.style = #'single-digit
   \tempo 4 = 55
   \partial 8 s8
   s1*40
   \set Score.measureLength = #(ly:make-moment 2 4) s2
   \set Score.measureLength = #(ly:make-moment 4 4) s1*16
   \bar "|."

}

VIsoprano = {
   \new Voice = "beatus"
   \VIglobal
   \notypeset
   <<\VIsopranon\forma>>
}


VIvc = {
   \VIglobal
   \clef tenor
   <<\VIvcn \forma>>
}


VIog = {
   \VIglobal
   \clef bass
   <<\VIogn \forma \VIbfn>>
   \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

VIIsopranon = \relative do'' {

    \autoBeamOff
    R2.*11
    sol4 si mi
    fad8 [red] \appoggiatura red8 si4 r

    %14
    red,8 [fad la] do si la
    sol8. fad16 mi4 r\mbreak
    mi'8. mi,16 mi4 re'8 si

    %17
    do4~do8~[do32 re do si] do8~[do32 si la sol]
    fad4~fad8~[fad32 la si do] re8~[re32 do si la]
    si4~si8~[si32 do si la] si8~[si32 la sol fad]

    %20
    mi4~\once\tieDashed mi8~[mi32 sol la si] do8~[do32 si la sol]
    re'4 re, r
    re4. do'8 si do16 la\mbreak

    %23
    si4 dod2
    re4. do16[si] la[sold fad mi]
    do'4. si16[la] sol?[fad mi re]

    %26
    si'8[la16 sol] la2\tr
    sol r4
    R2.*2

    %30
    sol4 si re
    la8[fad] \appoggiatura mi re2\mbreak
    re8[mi fad] mi' re16[si] si[la]

    %33
    re32[si16.] do32[la16.] sol4 r
    dod4~dod16[si] lad[sold] fad8 mi'16 dod
    re8[fad,] sol[ re' dod sid]

    %36
    dod[mid,] fad[dod' si? lad]
    si[red,] mi[si'] mi[dod]
    \appoggiatura si lad8.[sold16] fad4 r\mbreak

    %39
    si4. mi8 re16[dod] si lad
    si4. mi8[do! la?]
    red,[fad']~fad16[mi red dod si la sol fad]

    %42
    sol8.[fad16] mi4 r
    sol4 si mi
    do8 mi4 do la8

    %45
    fad la4 re do8\mbreak
    si re4 si sol8
    mi sol4 do si8

    %48
    la do4 la fad8
    red si'4 do la8
    sol8. fad16 mi4 r

    %51
    mi'4. si8 sol fad16 mi
    lad4. dod8[red mi]
    red16[dod] si8 r4 la8 fad\mbreak

    %54
    sol8 si16 mi fad,2\tr
    mi r4
    si'4. si8 \appoggiatura re do si16 la

    %57
    \appoggiatura do8 si4. la16[si] \appoggiatura re16 do8[si16 la]
    \appoggiatura do8 si [la16 sol] \appoggiatura si8 la[sol16 fad] \appoggiatura la8 sol [fad16 mi]
    \appoggiatura re'8 do[si16 la] \appoggiatura re8 do[si16 la] \appoggiatura mi'8 re[dod16 si]\mbreak

    %60
    mi4. re16[do] si[la] sol[fad]
    sol8 fad16 mi fad2\fermata
    mi2.\fermata

    %63
    R2.*6

}

VIItesto = \lyricmode {

    Gloria _ _  [Patri] _ gloria, _ _ et Fili - o et Spiri - tui  _ San - - - - - - - - cto

    et Spiri - tui  _ San - - - - - - - - - cto.

    Gloria _ _  Patri _ gloria, _ _ et Fili - o et Spiri - tui  _ San - - - - - - - cto

    et Spiri - tui  _ San - - - cto.

    Gloria _ _  Pa - - - - - - - - - - - - - - - - - - - - - tri, et Fili - o et Spiri - tui  _ San - - cto

    et Spiri - tui  _ San -- cto et Spiri - tui  _ San - - - - - - - - - cto, et Spiri - tui  _ San -- cto.

}

VIIvlIn = \relative do'' {

    R2.*11
    r8 si\p si si si si
    r red red red red red

    %14
    r red? red red red red
    r si si si si si\mbreak
    r si si si si si

    %17
    r do do do do do
    r do do do do do
    r si si si si si

    %20
    r si si si si si
    r la la la la la
    r do do do do do\mbreak

    %23
    si si dod dod dod dod
    re re re re re re
    do? do do do do do

    %26
    si si la la la la
    si4 r r
    R2.*2

    %30
    r8 si\p si si si si
    r la la la la la\mbreak
    r la la la la la

    %33
    r la si si si si
    r dod dod dod dod dod
    re r re r r4

    %36
    dod8 r dod r r4
    si8 r sol r r4
    r8 dod dod dod dod dod\mbreak

    %39
    r fad, fad fad fad fad
    r mi mi mi mi mi
    r red red red red red

    %42
    si'4 r r
    r8 si\p si si si si
    R2.

    %45
    r8 do do do do do\mbreak
    R2.
    r8 si si si si si

    %48
    R2.
    r8 red red red red red
    R2.

    %51
    r8 si si si si si
    R2.
    r8 red red red red red\mbreak

    %54
    R2.
    r8 si si si si si
    R2.*13

}

VIIvlIIn = \relative do'' {

    R2.*11
    r8 sol\p sol sol sol sol
    r fad fad fad fad fad

    %14
    r fad fad fad fad fad
    r sol sol sol sol sol\mbreak
    r sold sold sold sold sold

    %17
    r mi mi mi mi la
    r la la la fad fad
    r re re re re sol

    %20
    r sol sol sol mi mi
    r fad fad fad fad fad
    r fad fad fad fad fad\mbreak

    %23
    re re mi mi mi mi
    mi mi mi mi mi mi
    mi mi fad fad fad fad

    %26
    re [re] fad fad fad fad
    re4 r r
    R2.*2

    %30
    r8 re\p re re re re
    r fad fad fad fad fad\mbreak
    r fad fad fad fad fad

    %33
    r fad re re re re
    r fad fad fad fad fad
    fad r sol r r4

    %36
    mi8 r la r r4
    re,8 r si' r r4
    r8 lad lad lad lad lad\mbreak

    %39
    r fad fad fad fad fad
    r mi mi mi mi mi
    r red red red red red

    %42
    sol4 r r
    r8 sol\p sol sol sol sol
    R2.

    %45
    r8 fad fad fad fad fad\mbreak
    R2.
    r8 sol mi mi mi mi

    %48
    R2.
    r8 fad fad fad fad fad
    R2.

    %51
    r8 sol sol sol sol sol
    R2.
    r8 fad fad fad fad fad\mbreak

    %54
    R2.
    r8 sol sol sol sol sol
    R2.*13

}

VIIvlan = \relative do' {

    R2.*11
    r8 mi\p mi mi mi mi
    r si si si si si

    %14
    r si si si si si
    r mi mi mi mi mi\mbreak
    r mi mi mi mi mi

    %17
    r la, la la la la
    r re re re re re
    r sol, sol sol sol sol

    %20
    r do do do do do
    r re re re re re
    r re re re re re\mbreak

    %23
    sol, sol sol sol sol sol
    sold sold sold sold sold sold
    la la re[re re re]

    %26
    sol,[sol] re' re re re
    sol,4 r r
    R2.*2

    %30
    r8 sol\p sol sol sol sol
    r8 re' re re re re\mbreak
    r re re re re re

    %33
    r re sol, sol sol sol
    lad lad lad lad lad lad
    si r mi r r4

    %36
    la,8 r re r r4
    sol,8 r sol r r4
    r8 fad' fad fad fad fad\mbreak

    %39
    r re re re re re
    r do! do do do do
    r si si si si si

    %42
    mi4 r r
    r8 mi\p mi mi mi mi
    R2.

    %45
    r8 re re re re re\mbreak
    R2.
    r8 do do do do do

    %48
    R2.
    r8 si si si si si
    R2.

    %51
    r8 mi mi mi mi mi
    R2.
    r8 si si si si si\mbreak

    %54
    R2.
    r8 mi mi mi mi mi
    R2.*13

}

VIIogdn = \relative do'' {

    mi32 sol si sol mi[sol si sol] mi32 sol si sol mi[sol si sol] mi32 sol si sol mi[sol si sol]
    red fad si fad red[fad si fad] red fad si fad red[fad si fad] red fad si fad red[fad si fad]
    re![sold si sold] re sold si sold re[sold si sold] re sold si sold re[sold si sold] re sold si sold

    %4
    dod, mi la mi dod[mi la mi] dod mi la mi dod[mi la mi] dod mi la mi dod[mi la mi]
    do! fad la fad do[fad la fad] do fad la fad do[fad la fad] do fad la fad do[fad la fad]
    si, re sol re si[re sol re] si re sol re si[re sol re] si re sol re si[re sol re]

    %7
    do mi sol mi do[mi sol mi] do mi sol mi do[mi sol mi] do mi sol mi do[mi sol mi]
    lad, mi' sol mi lad,[mi' sol mi] lad, mi' sol mi lad,[mi' sol mi] lad, mi' sol mi lad,[mi' sol mi]\mbreak
    si red fad red si[red fad red] si fad' si fad red[fad si fad] si, fad' si fad red[fad si fad]

    %10
    mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]
    mi fad si fad mi[fad si fad] mi fad si fad mi[fad si fad] red fad si fad red[fad si fad]
    mi4 r r

    %13
    R2.*14
    re32 sol si sol re[sol si sol] re32 sol si sol re[sol si sol] re32 sol si sol re[sol si sol]
    re fad la fad re[fad la fad] re fad la fad re[fad la fad] do fad la fad do[fad la fad]

    %29
    si, re sol re si[re sol re] la re sol re la[re sol re] la re fad re la[re fad re]
    sol,4 r r
    R2.*11

    %42
    mi'32 sol si sol mi[sol si sol] mi32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]
    mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]
    do, mi  la mi do[mi la mi] do mi  la mi do[mi la mi] do mi  la mi do[mi la mi]

    %45
    re fad la fad re[fad la fad] re fad la fad re[fad la fad] re fad la fad re[fad la fad]\mbreak
    si, re sol re si[re sol re] si re sol re si[re sol re] si re sol re si[re sol re]
    do re sol re do[re sol re] do re sol re do[re sol re] do re sol re do[re sol re]

    %48
    la do fad do la[do fad do] la do fad do la[do fad do] la do fad do la[do fad do]
    si red fad red si[red fad red] si red fad red si[red fad red] si red fad red si[red fad red]
    si mi sol mi si[mi sol mi] si mi sol mi si[mi sol mi] si mi sol mi si[mi sol mi]

    %51
    mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]
    dod, fad lad fad dod[fad lad fad] dod fad lad fad dod[fad lad fad] dod fad lad fad dod[fad lad fad]
    red? fad si fad red[fad si fad] red fad si fad red[fad si fad] red fad si fad red[fad si fad]\mbreak

    %54
    mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] re[fad si fad] re fad si fad
    mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]
    sol4. sol8 la[sol16 fad]

    %57
    \appoggiatura fad8 sol4. fad16 sol \appoggiatura si8 la sol16 fad
    \appoggiatura la8 sol fad16 mi \appoggiatura sol8 fad mi16 re mi8 fad16 sol
    \appoggiatura fad8 mi re16 do \appoggiatura fad8 mi re16 do \appoggiatura sol'8 fad mi16 red\mbreak

    %60
    sol4. fad16[mi] re do si[la]
    mi'4 red2_\fermata
    mi32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]

    %63
    do, mi la mi do[mi la mi] do mi la mi do[mi la mi] do mi la mi do[mi la mi]
    lad, mi' sol mi lad,[mi' sol mi] lad, mi' sol mi lad,[mi' sol mi] lad, mi' sol mi lad,[mi' sol mi]
    si red fad red si[red fad red ] si fad' si fad red[fad si fad] si, fad' si fad red[fad si fad]

    %66
    mi32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]
    mi fad si fad mi[fad si fad] mi fad si fad mi[fad si fad] red fad si fad red[fad si fad]
    mi2.\fermata

}

VIIogsn = \relative do {

    r8 mi mi mi mi mi
    r si si si si si
    r mi mi mi mi mi

    %4
    r la, la la la la
    r re re re re re
    r sol sol sol sol sol

    %7
    r mi mi mi mi mi
    r fad fad fad fad fad\mbreak
    r si, si si si si

    %10
    r si si si si si
    r si si si si si
    mi,4 r r

    %13
    R2.*14
    r8 sol sol sol sol sol
    r re' re re re re

    %29
    r re re re re re
    \parenthesize sol,4 \parenthesize r \parenthesize r
    R2.*13

    %44
    r8 la la la la la
    R2.
    r8 sol sol sol sol sol

    %47
    R2.
    r8 do do do do do
    R2.

    %50
    r8 mi mi mi mi mi
    R2.
    r8 fad fad fad fad fad

    %53
    R2.\mbreak
    r8 mi mi  mi si si
    mi4 r r

    %56
    r8 mi mi mi r4
    r8 mi mi mi r4
    mi4 r r

    %59
    la2.\mbreak
    sol8 mi mi4 r
    mi si2_\fermata

    %62
    mi,8 mi' mi mi mi mi
    r la, la la la la
    r mi' mi mi mi mi

    %65
    r red? red red red red
    r mi mi mi mi mi
    r si si si si si

    %68
    mi,2.\fermata

}

forma = {

    \key mi\minor
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 35
    s2.*68
    \bar "|."

}

VIIsoprano = {
    \new Voice = "gloria"
    \VIIglobal
    \notypeset
    <<\VIIsopranon\forma>>
}


VIIvlI = {
    \VIIglobal
    \clef violin
    <<\VIIvlIn \forma>>
}


VIIvlII = {
    \VIIglobal
    \clef violin
    <<\VIIvlIIn \forma>>
}


VIIvla = {
    \VIIglobal
    \clef alto
    <<\VIIvlan \forma>>
}


VIIogd = {
    \VIIglobal
    <<\VIIogdn \forma>>
}


VIIogs = {
    \VIIglobal
    \clef bass
    <<\VIIogsn \forma>>
    \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VIIIsopranon = \relative do'' {

    \autoBeamOff
    r8
    R1*7
    r2 r4 mi8 mi
    mi la,la si dod16 si la8 mi' mi\mbreak

    %10
    mi dod dod re dod16[re] mi[re] dod8 mi
    mi4 re dod16[si] la8 mi' mi
    mi sold,16 la si8 dod dod si mi mi

    %13
    fad si,16 dod re8 re\mbreak re dod dod4
    red mi2 red4
    \parenthesize mi4 r r2

    %16
    r2 r4 mi8 mi
    mi si16 si si8 dod dod[si16 la] si4
    r2 re,16[mi fad sold la si dod re]

    %19
    si8 si r4 mi,16[fad sold la si dod re mi]
    dod8 dod mi mi mi re16 dod re8 re

    %21
    dod16 mi fad,8~fad16 [la sold si] la [mi' fad,8]~fad16 [la sold si]\mbreak
    \tuplet 3/2 { la16 [si dod] si[dod re] } dod8 r \tuplet 3/2 { dod16 [re mi] re[mi fad] } mi8 r
    la,8. [si32 dod] re8.\tr [dod32 si] dod8. [re32 mi] fad8.\tr [mi32 re]

    %24
    mi8 dod si4\tr la mi'8 mi
    mi re16 dod re8 re dod16 mi fad,8~fad16 [la sold si]\mbreak
    la [mi' fad,8]~fad16 [la sold si] la [dod si re] dod [mi re fad]

    %27
    mi [fad re mi] dod [re si re] dod [mi re fad] mi [fad re mi]
    dod8 dod si4 la la16 [si] dod [re]
    mi8 la, mi4\tr\mbreak la r

    %30
    R1

}

VIIItestoI = \lyricmode {

    Sicut _  erat _ in princi - pio _ sicut _ erat _ in princi - pio, _ et nunc et semper _

     et in saecu - la saecu - lorum _  et in saecu - la saecu - lorum _

     a - - - men et in saecu - la saecu - lorum _ a - men

    a - men et in saecu - la saecu - lorum _ a -  - - - - - - - - - - - men a -- men

    et in saecu - la saecu - lorum _ a - - - - - - - - men amen _  saecu - lorum _ a -- men.

}

VIIIalton = \relative do' {

    \autoBeamOff
    r8
    R1*8
    r2 r4 dod'8 la\mbreak
    dod la la si la16[si] dod[si] la8 si

    %11
    dod4 si la16[si] dod8 r4
    r2 r4 dod8 dod
    si sold16 la si8 si\mbreak si la la4~

    %14
    la sold16[la si8] si4. la8
    \parenthesize si4 r r2
    r2 r4 si8 si

    %17
    si sold16 sold sold8 la la[sold16 fad] sold4
    r2 la
    fad si4. sold8

    %20
    mi4 dod'8 dod si si16 si si8 si
    la16 dod fad,8~fad16[la sold si] la[dod fad,8]~fad16[la sold si]\mbreak
    la4 r \tuplet 3/2 { la16[si dod] si[dod re] } dod8 r

    %23
    r2 la8.[si32 dod] re!8.\tr [dod32 si]
    dod8 la la[sold] la4 dod8 dod
    dod si16 la si8 si la16 dod fad,8~fad16[ la sold si]\mbreak

    %26
    la[dod fad,8]~fad16[la sold si] la4 la16[dod si re]
    dod[re si dod] la[si sold si] la[dod si re] dod[re si dod]
    la8 la sold4 la la16[si] dod[re]

    %29
    mi8 la, mi4\tr \mbreak la4 r
    R1

}

VIIItestoII = \lyricmode {

    Sicut _  erat _ in princi - pio, _ et nunc et semper _

     et in saecu - la saecu - lorum _

     a - - - men et in saecu - la saecu - lorum _ a - - - men

    et in saecu - la saecu - lorum _ a -  - - - - - - - men a -- men

    et in saecu - la saecu - lorum _ a - - - - - - - - men amen _  saecu - lorum _ a -- men.

}

VIIItenoren = \relative do' {

    \autoBeamOff
    r8
    R1*7
    r2 r4 dod8 dod
    dod dod dod re mi16 re dod8 dod dod\mbreak

    %10
    mi mi mi mi mi8. mi16 mi8 mi
    mi4 sold la8 mi r4
    r2 r4 la8 la

    %13
    sold sold16 sold sold8 sold\mbreak mi mi mi4
    fad8[sold16 fad] sold4 fad2
    mi4 r r2

    %16
    r r4 mi8 mi
    mi mi16 mi mi8 mi mi4 mi
    la,16[si dod re mi fad sol la]\mbreak fad8 re r4

    %19
    si16[dod red mi fad sold? la si] sold8 mi r4
    r la8 la sold sold16 sold sold8 sold
    sold16 la re,8~re16[fad mi sold] la[dod re,8]~re16[fad mi sold]\mbreak

    %22
    la4 r \tuplet 3/2 { la16[si dod] si[dod re] } dod8 r
    r2 la8.[si32 dod] re8.\tr[dod32 si]
    la8 mi mi4 dod la'8 la

    %25
    mi mi16 mi mi8 mi mi16 la fad8~fad16[la sold si]\mbreak
    la[dod fad,8]~fad16[la sold si] la4 la16[dod si re]
    dod[re si dod] la[si sold si] la[dod si re] dod[re si dod]

    %28
    la8 mi mi4 dod la'16[si] dod[re]
    mi8 la, dod,4\tr\mbreak fad r
    R1

}

VIIItestoIII = \lyricmode {

    Sicut _  erat _ in princi - pio _ sicut _ erat _ in princi - pio, _ et nunc et semper _

     et in saecu - la saecu - lorum _ a - - - men et in saecu - la saecu - lorum _ a - men

    a - men et in saecu - la saecu - lorum _ a - men a - - - - - men amen _

    et in saecu - la saecu - lorum _ a - - - - - - - - men amen _  saecu - lorum _ a -- men.

}

VIIIvlIn = \relative do'' {

    mi8
    mi[la, sold la16 si] la8 mi mi mi'
    la[dod, si dod16 re] dod8 la la la'
    mi4 re\tr dod16 re mi8 r la

    %4
    mi4 re\tr dod16 re mi8 r la
    \appoggiatura   la sold[fad16 mi si'8 re,] dod16 re fad,8~fad16 la sold si\mbreak
    la16 mi' fad,8 \grace la fad16 la sold si la8 si16 dod re8.\tr dod32 si

    %7
    dod8 re16 mi fad8.\tr mi32 re mi16 mi fad sold la8 mi
    dod si16 la si4\tr la r
    r2 \tuplet 3/2 { dod16(re mi) mi[(fad sold)] } la8 r\mbreak

    %10
    R1
    r2 \tuplet 3/2 { dod,16\p(re mi)  re[(mi fad)]} mi8 mi
    mi sold,16 la si8 dod dod si la'16 sold fad mi

    %13
    re8 si16 dod re8 re\mbreak re dod dod la'
    fad sold16 fad sold8 sold fad4. fad8
    mi[si' fad sold16 la] sold8[si red,? mi?16 fad]

    %16
    sold8 si sold, fad mi4 r
    R1*3
    \tuplet 3/2 { dod'16(re mi) mi[(fad sold)]} la8 mi mi re16 dod re8 re

    %21
    dod16 mi fad,8~fad16 la sold si la mi'fad,8~fad16 la sold si\mbreak
    \tuplet 3/2 { la16 si dod si[dod re] } dod8 r \tuplet 3/2 { dod16 re mi re[mi fad] } mi8 r
    la,8. si32 dod re8.\tr dod32 si dod8. re32 mi fad8.\tr mi32 re

    %24
    mi8 dod si4\tr \tuplet 3/2 { dod16(re mi) mi[(fad sold)] } la8 mi
    mi re16 dod re8 re dod16 mi fad,8~fad16 la sold si\mbreak
    la mi' fad,8~fad16 la sold si la dod si re dod mi re fad

    %27
    mi fad re mi dod re si re dod mi re fad mi fad re mi
    dod8 dod si4 la la16 si dod [re]
    mi8 la, mi4\tr\mbreak la16 dod mi  la la dod, mi la

    %30
    la8 dod re si la2\fermata

}

VIIIvlIIn = \relative do'' {

    r8
    r2 r4 r8 dod
    mi[la, sold la16 si] la8 mi mi mi'
    dod4 si\tr la16 si dod8 r mi

    %4
    dod4 si\tr la16 si dod8 r la'
    \appoggiatura   la sold[fad16 mi si'8 re,] dod16 re fad,8~fad16 la sold si\mbreak
    la16 mi' fad,8 \grace la fad16 la sold si la4 r

    %7
    la8 si16 dod re8.\tr dod32 si dod16 dod re mi dod8 dod
    la4 sold\tr la r
    r2 \tuplet 3/2 { dod16(re mi) mi[(fad sold)] } la8 r\mbreak

    %10
    R1
    r2 \tuplet 3/2 { la,16\p(si dod) si[(dod re)] } dod8 si
    si mi,16 fad sold8 la la sold mi'16 mi re dod

    %13
    dod8 sold16 la si8 si\mbreak si la la mi'
    red mi16 red mi8 mi mi mi red4
    mi8[sold red mi16 fad] mi8[sold si, dod16 red]

    %16
    mi8 sold mi, red mi4 r
    R1*3
    \tuplet 3/2 { dod'16(re mi) mi[(fad sold)]}  la8 dod, si8 si16 si si8 si

    %21
    la16 dod fad,8~fad16[la sold si] la[dod fad,8]~fad16[la sold si]\mbreak
    la4 r \tuplet 3/2 { la16[si dod] si[dod re] } dod8 r

    %23
    r2 la8.[si32 dod] re!8.\tr [dod32 si]
    dod8 la la[sold] \tuplet 3/2 { dod16(re mi) mi[(fad sold)] } la8 dod,
    dod si16 la si8 si la16 dod fad,8~fad16[ la sold si]\mbreak

    %26
    la[dod fad,8]~fad16[la sold si] la4 la16[dod si re]
    dod[re si dod] la[si sold si] la[dod si re] dod[re si dod]
    la8 la sold4 la la16[si] dod[re]

    %29
    mi8 la, mi4\tr la16 la dod mi mi la, dod mi
    mi8 la si sold la2\fermata

}

VIIIvlan = \relative do' {

    r8
    \parenthesize r dod si sold' mi [dod] r4
    r8 mi sold mi mi dod r dod'
    la mi sold4 mi r8 dod'

    %4
    dod mi, sold4 mi8 dod' mi dod
    si sold4 sold8 mi r re mi\mbreak
    la, r re8 mi la,  mi'4 sold8

    %7
    la dod la sold r mi mi4
    mi4. mi8 dod4 r
    r2 mi8 mi mi r\mbreak

    %10
    R1
    r2 mi8\p mi mi[mi]
    mi4 mi mi r8 mi

    %13
    mi4 mi\mbreak mi8 la dod, la
    si si' mi, mi, si'' la si si,
    si'4 si si8 mi, fad red

    %16
    si4 si si r
    R1*3
    mi8 mi mi r mi fad, r mi'
    la, r re mi la, r re mi\mbreak

    %22
    la, mi' la mi la, mi' la mi
    la, la' re, mi la, la' re, mi
    la, la' mi[mi,] la' la, r la'

    %25
    la la, r mi' la, r re mi\mbreak
    la, r re mi la, mi' la,[mi']
    la, mi' la,[mi'] la, mi' la,[mi']

    %28
    la, la' mi[mi,] la' la, la'16[si] dod[re]
    mi8 la, mi[mi,]\mbreak dod' dod dod dod
    dod mi fad mi dod2\fermata

}

VIIIogn = \relative do {

    r8
    r la mi' re dod [la] r4
    r8 la[mi 'mi,] la4 r8 la'
    la la, mi' mi, la la' dod la

    %4
    la la, mi'[mi,] la la' dod la
    r mi sold mi la, r re mi\mbreak
    la,  r re mi la, la' sold mi

    %7
    r la re mi, r la la la,
    r la' mi mi, la4 la'8 la
    la la, r mi' la la, r la'\mbreak

    %10
    la la, r mi' la la, r sold'
    la la, mi' [mi,] la' la, r mi'
    mi4 mi mi mi

    %13
    mi mi\mbreak mi8 la dod, la
    si si' mi, mi, si'' la si si,
    mi mi si' si, mi, mi' si' si,

    %16
    mi, mi' si' si, mi mi, r mi'
    mi mi, r la mi' mi, r mi'
    dod si dod la\mbreak r re fad re

    %19
    r si red si r mi sold mi
    la la, r la' mi fad, r mi'
    la, r re mi la, r re mi\mbreak

    %22
    la, mi' la mi la, mi' la mi
    la, la' re, mi la, la' re, mi
    la, la' mi[mi,] la' la, r la'

    %25
    la la, r mi' la, r re mi\mbreak
    la, r re mi la, mi' la,[mi']
    la, mi' la,[mi'] la, mi' la,[mi']

    %28
    la, la' mi[mi,] la' la, la'16[si] dod[re]
    mi8 la, mi[mi,]\mbreak la la' la la,
    la la' re, mi la,2\fermata

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}

forma = {

    \key la\major
    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    \partial 8 s8
    s1*30
    \bar "|."

}

VIIIsoprano = {
    \new Voice = "sicut1"
    \VIIIglobal
    %\notypeset
    <<\VIIIsopranon\forma>>
}

VIIIalto = {
    \new Voice = "sicut2"
    \VIIIglobal
    <<\VIIIalton\forma>>
}

VIIItenore = {
    \new Voice = "sicut3"
    \VIIIglobal
    <<\VIIItenoren\forma>>
}


VIIIvlI = {
    \VIIIglobal
    \clef violin
    <<\VIIIvlIn \forma>>
}


VIIIvlII = {
    \VIIIglobal
    \clef violin
    <<\VIIIvlIIn \forma>>
}


VIIIvla = {
    \VIIIglobal
    \clef alto
    <<\VIIIvlan \forma>>
}


VIIIog = {
    \VIIIglobal
    \clef bass
    <<\VIIIogn \forma \VIIIbfn>>
    \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\bookpart {

    \paper {

        systems-per-page = #2

    }

    \markup \huge {[1.] Nisi Dominus aedificaverit - All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \IvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\major\time 4/4  r8^\markup \right-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Isoprano
                \new Lyrics \lyricsto "nisi" \ItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key la\major\time 4/4  r8^\markup\right-align"[Alto]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ialto
                \new Lyrics \lyricsto "nisi1" \ItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key la\major\time 4/4  r8^\markup\right-align"[Tenore]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Itenore
                \new Lyrics \lyricsto "nisi2" \ItestoIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \Iog
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \markup \huge {[2.] Nisi Dominus custodierit - All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Viola d'Amor"}
                \IIvlam
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key re\major\time 3/8\override Staff.TimeSignature.style = #'single-digit  r4.^\markup\right-align"Alto solo"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIalto
                \new Lyrics \lyricsto "nisi" \IItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef bass \key re\major\time 3/8\override Staff.TimeSignature.style = #'single-digit  re8 [la la,]^\markup\right-align"Violini soli"}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \IIog
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #3

    }

    \markup \huge {[3.] Vanum est - All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \IIIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\major \numericTimeSignature \time 2/4  r8^\markup\right-align"Alto Solo"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIIalto
                \new Lyrics \lyricsto "vanum" \IIItesto
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \IIIog
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \markup \huge {[4.] Cum dederit - And[ant]e }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"clarinet"
                \set Staff.instrumentName = \markup \center-column{"Salmò"}
                \IVcl
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef bass \key do\major \time 6/8  la8^\markup\right-align"Violini soli"}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 6/8  r8^\markup\right-align"Alto solo"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IValto
                \new Lyrics \lyricsto "cum" \IVtesto
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Organo solo"}
                \IVog
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #3

    }

    \markup \huge {[5.] Sicut sagittae - Allegro }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        }
        <<

            \new PianoStaff \with {
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            } \relative do' <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini"}
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Tromba""marina"}
                \Vtm
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \Vvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key sol\major \numericTimeSignature \time 3/4  si8^\markup\right-align"Tenor Solo"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Vtenore
                \new Lyrics \lyricsto "sicut" \Vtesto
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \Vog
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #5

    }

    \markup \huge {[6.] Beatus vir - [Andante] }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Violoncello""solo"}
                \VIvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 4/4  r8^\markup\right-align"Canto solo"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \VIsoprano
                \new Lyrics \lyricsto "beatus" \VItesto
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"Org[a]no""solo"}
                \VIog
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #9
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #3

    }

    \markup \huge {[7.] Gloria Patri - Larghetto }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        }
        <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
                \VIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \VIIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \VIIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major\time 3/4  \override Staff.TimeSignature.style = #'single-digit r1^\markup \right-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \VIIsoprano
                \new Lyrics \lyricsto "gloria" \VIItesto
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            } <<

                \set PianoStaff.midiInstrument = #"church organ"
                \new Staff = "up" <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Organo""ob[b]ligato"}
                    \VIIogd
                >>

                \new Staff = "down" <<
                    \VIIogs
                >>
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #2

    }

    \markup \huge {[8.] Sicut erat in principio - Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
                \VIIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \VIIIvlII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \VIIIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\major\time 4/4  r8^\markup \right-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \VIIIsoprano
                \new Lyrics \lyricsto "sicut1" \VIIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key la\major\time 4/4  r8^\markup\right-align"[Alto]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \VIIIalto
                \new Lyrics \lyricsto "sicut2" \VIIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key la\major\time 4/4  r8^\markup\right-align"[Tenore]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \VIIItenore
                \new Lyrics \lyricsto "sicut3" \VIIItestoIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \VIIIog
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
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

}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
