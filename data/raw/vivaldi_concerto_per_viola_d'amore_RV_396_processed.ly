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
  \terzine\senza
}

Ivlamn = \relative do'' {

   la'8[sold16 la si8 la16 sold] la8[sold16 fad mi8 dod]
   \appoggiatura {si16[dod]} re8 dod4 dod8 \appoggiatura {si16[dod]} re8 dod4 la'8
   sold [mi re dod16 si] dod8[la sold fad16 mi]

   %4
   la8[mi dod si16 la] mi'4 r8 mi'
   la16(fad) sold(mi) fad(re) mi(dod) re8 re re re  %%%5ripresa
   sold16(mi) fad(re) mi(dod) re(si) dod8 dod dod dod

   %7
   fad16(re) mi(dod) re(si) dod(la)\mbreak sold4 re'\pp~
   re8[do16 si do8 do] do2~
   do8[si16 la si8 si] si2~

   %10
   si8[la16 sold la8 la] sold\f si mi sold
   la[sold16 la si8 la16 sold] la8[sold16 la si8 la16 sold]
   la8[sold16 fad mi8 re] dod si16 la si4 \tr

   %13
   la r8 mi'\solo la[sold16 la si8 la16 sold] % fine ripresa
   la8 [sold16 fad mi8 dod] \appoggiatura{si16[dod]} re8 dod4 dod8\mbreak
   \appoggiatura {si16[dod]} re8 dod4 la'8 si16(sold) la(fad) sold(mi) fad(re)

   %16
   dod si la8 r la \appoggiatura dod si la16(si) \appoggiatura re8 dod si16(dod)
   \appoggiatura mi8 re dod~dod [la8] \appoggiatura dod si la16(si) \appoggiatura re8 dod si16(dod)
   \appoggiatura mi8 re dod~dod[la'] \once\stemDown sold mi, sold'16(la si) sold

   %19
   \once\stemDown fad8 re,  fad'16(sold la) fad \once\stemDown mi8 dod, mi'16(fad sold) mi
   red8 fad \appoggiatura sold fad mi16(fad) \appoggiatura la8 sold fad4 si8\mbreak
   red, fad \appoggiatura sold fad mi16 (fad) \appoggiatura la8 sold fad4 fad8

   %22
   sold16(la) si(la) si(sold) fad(mi) fad(sold) la(sold) la(fad) mi(red)
   mi(fad) sold(fad)sold(mi) red(dod) red(mi) fad(mi) fad(red) dod(si)
   mi(fad sold8) fad16(sold la8) sold16(la si8) la16(si dod8)

   %25
   si[la16(sold) fad(mi) red(dod)] si(la) sold(fad) mi8 mi'
   la16(sold fad mi) fad4\tr mi8\tu[red16 mi fad8 mi16 red]\mbreak
   mi8[red16 dod si8 sold] \appoggiatura si la sold4 sold8

   %28
   \appoggiatura si la sold4 red'8 mi[mi red dod16 si]
   mi8[si sold fad16 mi] si'4 si'\p~
   si8 [la16 sold la8 la] la2~

   %31
   la8[sold16 fad sold8 sold] sold2~
   sold8[fad16 mi fad8 fad] mi8[red16 mi fad8 mi16 red]
   mi8[red16 dod si8 la] sold fad16 mi fad4\tr \mbreak

   %34
   mi16\solo(sold si mi sold)(si sold) mi red,(fad si red fad)(si fad) red
   mi,(sold si mi sold)(si sold) mi red8 si r4
   si'~si16 la(sold fad) mi4 red\tr

   %37
   dod2 dod'4~dod16 si(la sold)
   fad4 mi\tr  red4. red8
   \tuplet 3/2 { sold16(fad sold la[sold fad)] sold(la sold fad[mi fad)] mi(sold fad mi[red dod)] mi(sold fad mi[red dod)] }\mbreak

   %40
   la'(dod) dod(la) la(fad) fad(mi) \appoggiatura mi red16(dod red8) \appoggiatura mi red16(dod red8)
   sold16(si) si(sold) sold(mi) mi(red) \appoggiatura red16 dod(si dod8) \appoggiatura red16 dod(si dod8)
   fad16(la) la(fad) fad(red) red(dod) sid(fad) sid(red) dod(sold) dod(mi)

   %43
   sid(fad) sid(red) dod(sold) dod(mi) sid la' la8(sold16) sid, dod red
   dod mi, mi8(fad16) mi' red dod\mbreak sid la' la8(sold16) fad mi red
   mi8 sold \tuplet 3/2 { la16(sold fad) sid[(lad sold)] } dod8 dod, \tuplet 3/2 { mi16(red dod) red[(dod sid)] }

   %46
   dod8 sold' \tuplet 3/2 { la16(sold fad) sid[(lad sold)]} dod8 dod, \tuplet 3/2 { mi16(red dod) red[(dod sid)] }
   dod4\tu sold'~sold8 [fad16 mi fad8 fad]

   %48
   fad2~fad8[mi16 red mi8 mi]
   mi2~mi8[red16 dod red8 red]\mbreak
   mi dod red sid dod4 r8 mi\solo

   %51
   la8[sold16 la si8 la16 sold] la8[sold16 fad mi8 dod]
   \appoggiatura {si16[dod]} re?8 dod4 dod8 \appoggiatura {si16[dod]} re8 dod4 la'8
   \tuplet 3/2 { si16(la sold) la[(sold fad)] sold(fad mi) fad[(mi re)] } dod8 la r4

   %54
   re8 re re re  sold16(mi) fad(re) mi(dod) re(si)
   dod8 dod dod dod\mbreak mi,16\solo(la dod mi la) dod, si la
   mi(sold si mi sold) re dod si mi,(la dod mi la) dod, si la

   %57
   mi(sold si mi sold) re dod si \tuplet 3/2 { dod(si la) mi'[(re dod)] fad(mi re) sold[(fad mi)] }
   la8 la, r mi' \appoggiatura si' la sold16(la) dod,8 re16(mi)
   \appoggiatura mi8 re dod4 mi8 \appoggiatura si' la sold16(la) dod,8 re16(mi)

   %60
   \appoggiatura mi8 re dod4 mi8\mbreak \appoggiatura si' la sold16(la) \appoggiatura dod8 si la16(si)
   \appoggiatura re8 dod si16 (dod) \appoggiatura mi8 re dod16(re) mi4~\tuplet 3/2 { mi16 dod(re mi[re dod)] }
   \tuplet 3/2 { re si(dod re[dod si)] dod la16(si dod[si la)] } si8 mi,4 dod8

   %63
   \tuplet 3/2 { re16 si(dod re[dod si)] dod la(si dod[si la)] } si8 mi,4 mi'8
   \appoggiatura re dod si16(la) \appoggiatura la'8 sol fad16(mi) re(dod) re4 fad8
   \appoggiatura mi red \once \slurDashed dod16(si) \appoggiatura si'8 la sold16(fad) mi(red mi4) mi8\mbreak

   %66
   \tuplet 3/2 {fad16(la sold fad[sold la)] si,(re dod si[dod re)] mi(sold fad mi[fad sold)] la,(dod si la[si dod)]
   re(fad mi re[mi fad)] sold,(si la sold[la si)] dod(mi re dod[si la)] mi(si' dod re[dod si)]
   mi,(la si dod[si la)] mi(si' dod re[dod si)] mi,(dod' re mi[re dod)] mi,(re' mi fad[mi re)]

   %69
   sold(si la sold[fad mi)] re(fad mi re[dod si)] dod(si la re[dod si] mi re dod fad[mi re)]}\mbreak
   fad4(la)~\tuplet 3/2 { la16 mi(re dod[si la)] } <<si4\tr\\mi,>>
   <<{la'16(fad) sold(mi)}\\la,4>> fad'16(re) mi(dod) re8 re re re  %%%5ripresa

   %72
   sold16(mi) fad(re) mi(dod) re(si) dod8 dod dod dod
   fad16(re) mi(dod) re(si) dod(la)\mbreak sold4 re'\pp~
   re8[do16 si do8 do] do2~

   %75
   do8[si16 la si8 si] si2~
   si8[la16 sold la8 la] sold\f si mi sold
   la[sold16 la si8 la16 sold] la8[sold16 la si8 la16 sold]

   %78
   la8[sold16 fad mi8 re] dod si16 la si4 \tr
   la4\fermata r r2

}

IvlIn =  \relative do'' {

   la'8[sold16 la si8 la16 sold] la8[sold16 fad mi8 dod]
   \appoggiatura {si16[dod]} re8 dod4 dod8 \appoggiatura {si16[dod]} re8 dod4 la'8
   sold [mi re dod16 si] dod8[la sold fad16 mi]

   %4
   la8[mi dod si16 la] mi'4 r8 mi'
   la16(fad) sold(mi) fad(re) mi(dod) re8 re re re  %%%5ripresa
   sold16(mi) fad(re) mi(dod) re(si) dod8 dod dod dod

   %7
   fad16(re) mi(dod) re(si) dod(la)\mbreak sold4 re'\pp~
   re8[do16 si do8 do] do2~
   do8[si16 la si8 si] si2~

   %10
   si8[la16 sold la8 la] sold\f si mi sold
   la[sold16 la si8 la16 sold] la8[sold16 la si8 la16 sold]
   la8[sold16 fad mi8 re] dod si16 la si4 \tr

   %13
   la r la,8 la' re, mi  %%%%%% fine ripresa
   \once\stemUp la, re' dod la mi la, dod la\mbreak
   mi' la, dod la mi' fad mi sold,

   %16
   la si dod la mi' sold la la,
   mi' la la la, mi' sold la la,
   mi' la la la, mi' fad sold mi

   %19
   re mi fad re dod red mi dod
   si dod red si mi si red si\mbreak
   fad' si, red si mi si red si

   %22
   mi' mi, mi' dod red red, red' si
   dod dod, dod' la si si, si' la
   sold mi red si mi sold fad[la]

   %25
   sold mi la fad si si, sold' mi
   dod dod' si si, mi'[red16 mi fad8 mi16 red]\mbreak
   mi8[red16 dod si8 sold] \appoggiatura si la sold4 sold8

   %28
   \appoggiatura si la sold4 red'8 mi[mi red dod16 si]
   mi8[si sold fad16 mi] si'4 si'\p~
   si8 [la16 sold la8 la] la2~

   %31
   la8[sold16 fad sold8 sold] sold2~
   sold8[fad16 mi fad8 fad] mi8[red16 mi fad8 mi16 red]
   mi8[red16 dod si8 la] sold fad16 mi fad4\tr \mbreak

   %34
   mi4 r r2
   r red'8 red red red
   mi mi mi mi mi mi mi mi

   %37
   mi mi mi mi fad fad fad fad
   fad fad fad fad fad fad fad fad
   sold la sold fad mi mi mi mi\mbreak

   %40
   mi mi mi mi red red red red
   red? red red red dod dod dod dod
   dod dod dod dod red red mi mi

   %43
   red red mi mi red red red red
   mi mi dod dod\mbreak sid sid sid sid
   dod[mi] fad fad sold mi mi red

   %46
   mi mi mi fad sold mi mi red
   dod4 sold'~sold8 [fad16 mi fad8 fad]
   fad2~fad8[mi16 red mi8 mi]

   %49
   mi2~mi8[red16 dod red8 red]\mbreak
   dod dod red sid dod dod, mi dod
   la la' re, mi la, re dod la

   %52
   mi' la, dod la mi' la, dod re
   mi4 r la'16(fad) sold(mi) fad(re) mi(dod)
   re8 re re re  sold16(mi) fad(re) mi(dod) re(si)

   %55
   dod8 dod dod dod \mbreak dod4 r
   R1*2
   r8 dod dod dod, r dod' dod dod,

   %59
   r dod' dod dod, r dod' dod dod,
   r dod' dod dod,\mbreak la la' sold mi
   la, la' si mi, dod' si dod la

   %62
   si sold la la, mi' fad sold la
   si sold la[la,] mi' fad sold mi
   la la, la la' fad  mi fad re

   %65
   si' si, si si' sold fad mi dod'
   re re sold, sold dod dod fad,[fad]
   si si mi, mi la la, mi'\noBeam r

   %68
   mi r mi r mi r mi r
   mi r mi r la, si dod mi\mbreak
   mi re dod si la la mi'[mi]

   %71
   <<{la'16(fad) sold(mi)}\\\stemUp la,,4>> fad''16(re) mi(dod) re8 re re re  %%%5ripresa
   sold16(mi) fad(re) mi(dod) re(si) dod8 dod dod dod
   fad16(re) mi(dod) re(si) dod(la)\mbreak sold4 re'\pp~

   %74
   re8[do16 si do8 do] do2~
   do8[si16 la si8 si] si2~
   si8[la16 sold la8 la] sold\f si mi sold

   %77
   la[sold16 la si8 la16 sold] la8[sold16 la si8 la16 sold]
   la8[sold16 fad mi8 re] dod si16 la si4 \tr
   la4\fermata r r2

}

IvlIIn = \relative do'' {

   dod8[si16 dod re8 dod16 si] dod4. la8
   \appoggiatura {sold16[la]} si8 la4 la8 \appoggiatura {sold16[la]} si8 la4 dod8
   si [mi re dod16 si] dod8[la sold fad16 mi]

   %4
   la8[mi dod si16 la] mi'4 r8 mi'
   la16(fad) sold(mi) fad(re) mi(dod) si8 si si si  %%% ripresa
   sold'16(mi) fad(re) mi(dod) re(si)  la8 la la la

   %7
   r2\mbreak sold4 r
   mi'2\pp~mi8[re16 do re8 re]
   re2~re8[do16 si do8 do]

   %10
   do?2 si8\f sold si mi
   dod![si16 dod re8 dod16 si]  dod8[si16 dod re8 dod16 si]
   dod4 si la sold

   %13
   la r la,8 la' re, mi  %%%%% fine ripresa
   la, re' dod la mi la, dod la\mbreak
   mi' la, dod la mi' fad mi sold,

   %16
   la si dod la mi' sold la la,
   mi' la la la, mi' sold la la,
   mi' la la la, mi' fad sold mi

   %19
   re mi fad re dod red mi dod
   si dod red si mi si red si\mbreak
   fad' si, red si mi si red si

   %22
   mi' mi, mi' dod red red, red' si
   dod dod, dod' la si si, si' la
   sold mi red si mi sold fad[la]

   %25
   sold mi la fad si si, sold' mi
   dod dod' si si, sold''[fad16 sold la8 sold16 fad]\mbreak
   sold4. mi,8 \appoggiatura sold fad mi4 mi8

   %28
   \appoggiatura sold fad mi4 fad'8 sold8[mi red dod16 si]
   mi8[si sold fad16 mi] si'4 r
   dod'2\p~dod8[si16 la si8 si]

   %31
   si2~si8[la16 sold la8 la]
   la2 sold8[fad16 sold la8 sold16 fad]
   sold4 fad mi red\mbreak

   %34
   mi r r2
   r fad8 fad fad fad
   si, si si si si si si si

   %37
   dod dod dod dod dod dod dod dod
   dod dod dod dod red red red red
   red? red red red si si si si\mbreak

   %40
   la la la la la la la la
   sold sold sold sold sold sold sold sold
   fad fad fad fad sid sid dod dod

   %43
   sid sid dod dod sid sid sid sid
   sold sold fad fad\mbreak red red red sold
   sold dod dod[red] dod dod dod sid

   %46
   sold dod dod[red] dod dod dod sid
   dod4 r la'2~
   la8[sold16 fad sold8 sold] sold2~

   %49
   sold8[fad16 mi fad8 fad] fad2\mbreak
   mi8 mi fad red dod dod, mi dod
   la la' re, mi la, re dod la

   %52
   mi' la, dod la mi' la, dod re
   mi4 r la'16(fad) sold(mi) fad(re) mi(dod)
   si8 si si si  sold'16(mi) fad(re) mi(dod) re(si)

   %55
   la8 la la la\mbreak la4 r
   R1*2
   r8 la la la, r la' la la,

   %59
   r la' la la, r la' la la,
   r la' la la,\mbreak la la' sold mi
   la, la' si mi, dod' si dod la

   %62
   si sold la la, mi' fad sold la
   si sold la[la,] mi' fad sold mi
   la la, la la' fad  mi fad re

   %65
   si' si, si si' sold fad mi dod'
   re re sold, sold dod dod fad,[fad]
   si si mi, mi la la, mi'\noBeam r

   %68
   mi r mi r mi r mi r
   mi r mi r la, si dod mi\mbreak
   mi re dod si la la mi'[mi]

   %71
   <<{la'16(fad) sold(mi)}\\\stemUp la,,4>> fad''16(re) mi(dod) si8 si si si  %%% ripresa
   sold'16(mi) fad(re) mi(dod) re(si)  la8 la la la
   r2\mbreak sold4 r

   %74
   mi'2\pp~mi8[re16 do re8 re]
   re2~re8[do16 si do8 do]
   do?2 si8\f sold si mi

   %77
   dod![si16 dod re8 dod16 si]  dod8[si16 dod re8 dod16 si]
   dod4 si la sold
   la\fermata r r2

}

Ivlan =  \relative do' {

   mi8 mi fad mi mi4. mi8
   sold mi4 mi8 sold mi4 mi8
   mi[mi' re dod16 si] dod8[la sold fad16 mi]

   %4
   la8[mi dod si16 la] mi'8 fad mi re
   dod4 r sold'8 sold sold sold % ripresa
   r2 mi8 mi mi mi

   %7
   r2\mbreak mi8 mi mi mi
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi

   %10
   mi mi mi mi mi mi sold sold
   mi mi fad mi mi mi fad mi
   mi4 mi mi mi

   %13
   dod r r2 %%%5 fine ripresa
   R1*12
   r2 si'8 si dod si\mbreak

   %27
   si4. si,8 red si4 si8
   red si4 si8 si[mi' red dod16 si]
   mi8[si sold fad16 mi] si'8 si, si si

   %30
   si si si si si si si si
   si si si si si si si si
   si si si si  si si' dod si

   %33
   si4 si, si si\mbreak
   si r r2
   r2 si8 si si si

   %36
   sold sold sold sold sold sold sold sold
   la la la la la la la la
   lad lad lad lad si si si si

   %39
   sid sid sid sid dod dod dod dod\mbreak
   fad fad fad fad si, si si si
   mi mi mi mi la, la la la

   %42
   la la la la sold sold sold sold
   sold sold sold sold sold sold sold sold
   dod dod la la\mbreak sold sold sold sold

   %45
   dod dod fad[fad] mi[dod] sold' sold,
   dod dod fad[fad] mi[dod] sold' sold,
   dod dod dod dod dod dod dod dod

   %48
   dod dod dod dod  dod dod dod dod
   dod dod dod dod  sold' sold sid, sid\mbreak
   dod sold' la sold mi4 r

   %51
   R1*2
   r2 dod'4 r
   sold8 sold sold sold r2

   %55
   mi8 mi mi mi\mbreak mi4 r
   R1*15
   dod4 r sold'8 sold sold sold % ripresa

   %72
   r2 mi8 mi mi mi
   r2\mbreak mi8 mi mi mi
   mi mi mi mi mi mi mi mi

   %75
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi sold sold
   mi mi fad mi mi mi fad mi

   %78
   mi4 mi mi mi
   dod\fermata r r2

}

Ibcn = \relative do {

   la8 la' re, mi la, la' la la,
   mi' la la la, mi' la la la,
   mi' [mi' re dod16 si] dod8 [la sold fad16 mi]

   %4
   la8[mi dod si16 la] mi'8 re dod si
   la4 r mi'8 mi mi mi %% ripresa
   r2 la,8 la la la

   %7
   r2 mi'8 mi mi mi
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi

   %10
   mi mi mi mi mi mi mi mi
   la, la' re, mi la, la' re, mi
   la, la' sold mi la, la' mi [mi,]

   %13
   la4 r r2 %%%% fine ripresa
   R1*12
   r2 mi8 mi' la, si\mbreak

   %27
   mi, mi' mi mi, si' mi mi mi,
   si' mi mi[si] mi[mi' red dod16 si]
   mi8[si sold fad16 mi] si'8 si, si si

   %30
   si si si si si si si si
   si si si si si si si si
   si si si si mi, mi' la, si

   %33
   mi4 red mi8 mi, si'' si,\mbreak
   mi4 r si r
   mi r si r

   %36
   R1*11
   dod8 dod dod dod dod dod dod dod
   dod dod dod dod  dod dod dod dod

   %49
   dod dod dod dod  sold' sold sid, sid\mbreak
   dod dod fad[sold] dod,4 r
   R1*2

   %53
   r2 la4 r
   mi'8 mi mi mi r2
   la,8 la la la\mbreak la4 la

   %56
   sold sold la la
   sold sold la r
   R1*13

   %71
   r2 mi'8 mi mi mi %% ripresa
   r2 la,8 la la la
   r2 mi'8 mi mi mi

   %74
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi

   %77
   la, la' re, mi la, la' re, mi
   la, la' sold mi la, la' mi [mi,]
   la4\fermata r r2

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\major
  \time 4/4
  \tempo 2 = 53
  s1*79
  \bar"|."

}

Ivlam = {
  \Iglobal
  \notypeset
  <<\Ivlamn \forma>>

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
  \senza
}

IIvlamn = \relative do'' {

   <<{la16
      la16.(si32) \once\slurDashed si8.\tr[(la32 si)]}\\{mi,16
                                      mi8 mi4}>>
   \appoggiatura si'8 dod8. si16 la8
   <<{dod16.[(re32)] re8.\tr(dod32 re)}\\{mi,8 mi4}>>

   %4
   mi'8. sold16 la8
   re,16.(sold32) si16.[(re,32)] dod16.(si32)
   <<{dod16.[(mi32)]\stemDown la16.[(dod,32) si16.(la32)] }\\mi4>>

   %7
   <<si'4.\tr\\mi,>>
   \tuplet 3/2 { mi'16-.(la-. sold-. fad-.[mi-. re-.] dod-. si-. la-.) }\mbreak
   sol'8 sol4\tr

   %10
   <<fad4.\\re>>
   \tuplet 3/2 { fad16-.(si-. la-. sold-.[fad-. mi-.] red-. dod-. si-.) }
   la'8 la4\tr

   %13
   <<sold4.\\mi>>
   \tuplet 3/2 { sold16-.(si-. la-. sold-.[fad-. mi-.] red-. dod-. si-.
   la-. sold-. fad-. mi-.[red-. dod-.)]} \once\stemUp si \once\stemDown la''

   %16
   sold32[(mi16.)]~mi16 la32(fad) sold[(mi) la(fad)]
   sold(mi) si'(mi,) <<{fad8.\tr[mi16]}\\ si4>>
   mi4.

   %19
   <<{sold8 sold8.[(fad32 sold)]}\\{dod,8 dod4}>>
   \appoggiatura sold'8 la~\tuplet 3/2 { la16[sold-. (fad-.] mi-. red-. dod-.)}
   sid? [la'] la 8~la32(sold) la(fad)

   %22
   \appoggiatura fad16 mi8. red?16 dod8
   \tuplet 3/2 { dod16(sid red dod[mi red] fad mi sold
   fad la sold si[lad dod] si red dod)}

   %25
   fad,8\noBeam ~\tuplet 3/2 { fad16 la(sold fad[mi red)] }
   mi dod' red,8.\tr[dod16]
   dod4 r16 <<{la

      %28
      la16.(si32) si8.\tr[(la32 si)]}\\{mi,16
                                      mi8 mi4}>>
   \appoggiatura si'8 dod8. si16 la8
   \tuplet 3/2 { la'32(mi re dod[si la] } sol4)

   %31
   \tuplet 3/2 { fad32(la re fad[sol la] } la4)
   \tuplet 3/2 { si32(fad mi red[dod si] } la4)
   \tuplet 3/2 { sold32 (si mi sold[la si] } si4)

   %34
   la8. fad16 sold16. mi32
   fad8. re16 mi16. dod32
   re4~\tuplet 3/2 { re32 dod si dod[si la] }

   %37
   <<{la'16 la, si8.[la16]}\\mi4>>
   la4.\fermata

}

IIvlIn =  \relative do'' {

   r16
  la8 mi' mi,
  la4.
  la'8 si si,

  %4
  dod si la
  si4 r8
  la4 r8

  %7
  mi' sold mi
  la,4.~\mbreak
  la8 dod la

  %10
  re fad re
  si4.~
  si8 red  si

  %13
  mi sold mi
  mi4 r8
  R4.

  %16
  mi16 fad sold red mi red
  mi mi, si'' la si si,
  mi4.

  %19
  dod8 mi dod
  fad4.\mbreak
  sold8 sid,4

  %22
  dod4.~
  dod~
  dod

  %25
  sid8 red8. sid16
  dod8 sold' sold,
  dod8. re16 dod si

  %28
  la8 mi' mi,
  la4.
  dod

  %31
  re
  red
  mi

  %34
  dod8 re mi
  re si dod
  si sold la

  %37
  fad'mi mi,
  la4.\fermata

}

IIvlan =  \relative do' {

  r16
  la8 mi' mi,
  la4.
  la'8 si si,

  %4
  dod si la
  si4 r8
  la4 r8

  %7
  mi' sold mi
  la,4.~\mbreak
  la8 dod la

  %10
  re fad re
  si4.~
  si8 red  si

  %13
  mi sold mi
  mi4 r8
  R4.

  %16
  mi16 fad sold red mi red
  mi mi, si'' la si si,
  mi4.

  %19
  dod8 mi dod
  fad4.\mbreak
  sold8 sid,4

  %22
  dod4.~
  dod~
  dod

  %25
  sid8 red8. sid16
  dod8 sold' sold,
  dod8. re16 dod si

  %28
  la8 mi' mi,
  la4.
  dod

  %31
  re
  red
  mi

  %34
  dod8 re mi
  re si dod
  si sold la

  %37
  fad'mi mi,
  la4.\fermata

}

forma = {

  \key la\major
  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 50
  \partial 16 s16
  s4.*18
  \bar":..:"\break
  s4.*20
  \bar ":|."

}

IIvlam = {
  \IIglobal
  \notypeset
  <<\IIvlamn \forma>>

}

IIvlI = {
  \IIglobal
  <<\IIvlIn \forma>>

}

IIvla = {
  \IIglobal
  \clef alto
  <<\IIvlan \forma>>
  \typeset

}

IIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \senza
}

IIIvlamn = \relative do'' {

   r8 mi fad16(mi) re(dod) re8[la si16(la) sold(fad)]
   sold8[re' mi16 (re) dod(si)] dod8 la la'\noBeam r
   sold r fad r mi[re16 dod re8 si]

   %4
   dod la la'\noBeam r sold r fad r
   mi[re16 dod re8 si] dod red4 mi8
   si red4 mi8la,[si16 dod si8 la]

   %7
   sold4 r8 mi\mbreak re(sold si) re,
   dod(mi la) dod, si(re sold) si,
   la-. si-. dod-. re-. mi[mi'] fad16(mi) fad(sold)

   %10
   la8 fad,4 sold8 mi mi' fad16[(mi) fad(sold)]
   la8 si,4 dod8  la[mi'] fad16(mi) fad(sold)
   la8 fad,4 sold8 mi[mi'] fad16(mi) fad(sold)
   la8 si,4 dod8 la4 r8 mi'\solo\mbreak  %fine ripresa

   %14
   la16(sold) fad(mi) dod'(si) la(sold) la(sold) fad(mi) fad(mi) re(dod)
   re(dod) si(la) si(la) sold(fad) sold(fad) mi(re) mi(re) dod(si)
   la(si) dod(re) mi(fad) sold(la) si(la) sold(la) si(dod) re(si)

   %17
   dod8 la r la' mi, sold' re, fad'
   dod, mi' si, re' la, dod' \appoggiatura mi re dod16(si)
   dod8 si16(dod) \appoggiatura mi8 re \once\slurDashed dod16(si)  dod8 si16 dod \appoggiatura mi8 re dod16(si)\mbreak

   %20
   dod8 la r mi' red16(mi fad sold la8) fad
   sold16(fad mi4.) red16(mi fad sold la8) fad
   mi16(fad sold la si8) sold fad16(sold la si dod8) la

   %23
   sold16(la si dod red8) si mi4 r8 sold,
   la16(fad8.) si16(fad8.) sold16 mi8.~mi4
   si16(dod32 red mi fad sold la si4) si,16(dod32 red mi fad sold la si4)

   %26
   sold8. fad32 mi fad4\tr \mbreak mi8 si dod16(si) la(sold)
   la8 mi' fad16(mi) red(dod) red8 la' si16(la) sold(fad)
   sold4 mi8 r red r dod r

   %29
   si[la16 sold la8 fad] sold4 r8 mi'
   red r dod r  si[la16 sold la8 fad]
   sold sold' la fad mi16 si'4.  la32 sold

   %32
   fad16 la4. sold32 fad mi16 sold4. fad32 mi
   red16 si fad' red la' fad si fad sold8 mi r sold
   sold4\tr ~sold16 fad(sold la) fad8 red r fad

   %35
   fad4\tr~fad16 mi(fad sold) mi8 dod r mi
   mi4\tr~mi16 red(mi fadd?) red8 [\appoggiatura {fad?16[sold]} la8 sold16(fad) mi(red)] \mbreak
   mi(red) dod8 \appoggiatura {la'16[si]} dod4 dod16[si(la) sold(fad) mi(red) \once\slurDashed mi]

   %38
   (red8) si, \tuplet 3/2 { si16(dod red) red[(dod si)]si(dod red) red[(dod si)] } \appoggiatura {sold''16[la]} si4
   si16[la(sold) fad(mi) red(dod) red](dod8) la, \tuplet 3/2{la16(si dod) dod[(si la)]
   la(si dod) dod[(si la)]} \appoggiatura {fad''16[sold]} la4 la16[sold(fad) mi(red) dod(sid) dod](

   %41
   sid) red sid red sold, red' fad, red'\mbreak mi, sold dod mi fad, la dod fad
   sid, sold' red sold sid, sold' red sold mi sid dod mi, fad dod' sold sid
   dod8 sold' la16(sold) fad(mi) fad8 la sold16(fad) mi(red)

   %44
   mi4 dod'8 r si r la r
   sold[fad16 mi fad8 red] mi4 dod'8 r
   si r la r sold[fad16 mi fad8 red]\mbreak

   %47
   mi dod' red sid dod16[dod-.(sid-. la-. sold-. fad-. mi-. red-.)]
   dod8 sold dod16.\tr(sid32 dod16 red) mi[dod'-.(si-. la-. sold-. fad-. mi-. red-.)]
   dod8 sold dod16.\tr(sid32 dod16 red) sid[sold'-.(fad-. mi-. red-. dod-. sid-. la-.]

   %50
   sold-. fad-. mi-. red-. dod8) dod' dod\tr sid r4
   r16 la'-.[(sold-. fad-. mi-. red-. dod-. si-.] la8) mi la16.\tr(sold32 la16 si)
   sold[mi'-.(re?-. dod-. si-. la-. sold-. fad-.)]\mbreak mi8 re' re16.\tr(dod32 re16 mi)

   %53
   \tuplet 3/2 { dod16(si la) mi'[(re dod)] fad(mi re) sold[(fad mi)] la sold fad si[la sold] dod si la re[dod si] }
   mi8 mi, fad16(mi) re(dod) re8 la si16 la sold fad
   sold8 re' mi16 re dod si dod8 la la'\noBeam r

   %56
   sold r fad r mi[re16 dod re8 si]
   dod la r mi' la16(sold) fad(mi) dod'(si) la(sold)\mbreak
   la sold fad mi fad mi re dod re dod si la si la sold fad

   %59
   mi(sold si mi sold la si8) dod,16 si la8 r do
   \appoggiatura re do si16(do) \appoggiatura mi8 re do16(si) \appoggiatura re8 do si16(do) \appoggiatura mi8 re do16(si)
   do(si la4) la'8\appoggiatura la sold fad16(mi) \appoggiatura mi8 re do16(si)

   %62
   do si la4 si'8\mbreak \appoggiatura re8 do si16(la) \appoggiatura la8 sol fa16(mi)
   fa(mi) fa4 la8 \appoggiatura do8 si la16(sol) \appoggiatura sol8 fa mi16(red)
   mi(red) mi4 sol8 \appoggiatura si la sol16(fa) \appoggiatura fa8 mi re?16(dod!)

   %65
   re8 fa mi16 re do si do4~do16 la fa' re
   sold!4~sold16 mi si' sold re'4~re16 do(si) la(\mbreak
   sold) fa?(mi) fa!(mi) re(do) si(do) si(la) do(si) la(sold) fad?

   %68
   mi mi'4. re32 do mi,16 re'4. do32 si
   mi,16 do'4. si32 la mi16 sold'4. la32 si
   re,8-.(re-. re-. re-.) sold-.(sold-. sold-. sold-.)

   %71
   la32[(sold fad mi re dod! si la)] la'4~la16[sold32(fad mi16) la,] <<si4\tr\\mi,>>
   la8 mi' fad16(mi) re(dod) re8[la si16(la) sold(fad)]
   sold8[re' mi16 (re) dod(si)] dod8 la la'\noBeam r

   %74
   sold r fad r mi[re16 dod re8 si]
   dod la la'\noBeam r sold r fad r
   mi[re16 dod re8 si] dod red4 mi8

   %77
   si red4 mi8la,[si16 dod si8 la]
   sold4 r8 mi\mbreak re(sold si) re,
   dod(mi la) dod, si(re sold) si,

   %80
   la-. si-. dod-. re-. mi[mi'] fad16(mi) fad(sold)
   la8 fad,4 sold8 mi mi' fad16[(mi) fad(sold)]
   la8 si,4 dod8  la[mi'] fad16(mi) fad(sold)

   %83
   la8 fad,4 sold8 mi[mi'] fad16(mi) fad(sold)
   la8 si,4 dod8 la4\fermata r

}

IIIvlIn =  \relative do'' {

   r8 mi fad16(mi) re(dod) re8[la si16(la) sold(fad)]
   sold8[re' mi16 (re) dod(si)] dod8 la la'\noBeam r
   sold r fad r mi[re16 dod re8 si]

   %4
   dod la la'\noBeam r sold r fad r
   mi[re16 dod re8 si] dod red4 mi8
   si red4 mi8la,[si16 dod si8 la]

   %7
   sold4 r8 mi\mbreak re(sold si) re,
   dod(mi la) dod, si(re sold) si,
   la-. si-. dod-. re-. mi[mi'] fad16(mi) fad(sold)

   %10
   la8 fad,4 sold8 mi mi' fad16[(mi) fad(sold)]
   la8 si,4 dod8  la[mi'] fad16(mi) fad(sold)
   la8 fad,4 sold8 mi[mi'] fad16(mi) fad(sold)
   la8 si,4 dod8 la4 r %%%% fine ripresa

   %14
   R1*12
   r2\mbreak r8 si dod16(si) la(sold)
   la8 mi' fad16(mi) red(dod) red8 la' si16(la) sold(fad)
   sold4 mi8 r red r dod r

   %29
   si[la16 sold la8 fad] sold4 r8 mi'
   red r dod r  si[la16 sold la8 fad]
   sold sold' la fad mi16 si'4.  la32 sold

   %32
   fad16 la4. sold32 fad mi16 sold4. fad32 mi
   red16 si fad' red la' fad si fad sold8 mi r sold
   dod,8 dod dod dod red red red red

   %35
   sid sid sid sid dod dod dod dod
   fadd fadd fadd fadd sold sold sid, sid\mbreak
   dod4 r r2

   %38
   R1*5
   r8 sold' la16(sold) fad(mi) fad8 la sold16(fad) mi(red)

   %44
   mi4 dod'8 r si r la r
   sold[fad16 mi fad8 red] mi4 dod'8 r
   si r la r sold[fad16 mi fad8 red]\mbreak

   %47
   mi dod' red sid dod4 r
   R1*6
   r8 mi, fad16(mi) re(dod) re8 la si16 la sold fad
   sold8 re' mi16 re dod si dod8 la la'\noBeam r

   %56
   sold r fad r mi[re16 dod re8 si]
   dod la r4 r2
   R1

   %59
   r2 r4 r8 la
   la la la sold  la la la sold
   la la la la si si si si

   %62
   la la do mi\mbreak mi mi mi mi
   fa fa fa fa re re re si
   mi mi mi mi do do do la

   %65
   si si si si do do do do
   si si si si si si si si\mbreak
   si si si si la la la la

   %68
   sold mi' mi mi re re re re
   do do do do si si si si
   si si si si re re re re

   %71
   dod dod dod dod dod dod si si
   dod mi fad16(mi) re(dod) re8[la si16(la) sold(fad)]
   sold8[re' mi16 (re) dod(si)] dod8 la la'\noBeam r

   %74
   sold r fad r mi[re16 dod re8 si]
   dod la la'\noBeam r sold r fad r
   mi[re16 dod re8 si] dod red4 mi8
   si red4 mi8la,[si16 dod si8 la]

   %78
   sold4 r8 mi\mbreak re(sold si) re,
   dod(mi la) dod, si(re sold) si,
   la-. si-. dod-. re-. mi[mi'] fad16(mi) fad(sold)

   %81
   la8 fad,4 sold8 mi mi' fad16[(mi) fad(sold)]
   la8 si,4 dod8  la[mi'] fad16(mi) fad(sold)
   la8 fad,4 sold8 mi[mi'] fad16(mi) fad(sold)

   %84
   la8 si,4 dod8 la4\fermata r %%%% fine ripresa

}

IIIvlIIn = \relative do'' {

   r8 mi fad16(mi) re(dod) re8[la si16(la) sold(fad)]
   sold8[re' mi16 (re) dod(si)] dod8 la fad'\noBeam r
   mi r re r dod[si16 la si8 sold]

   %4
   la4 fad'8 r mi r re r
   dod[si16 la si8 sold] la red4 mi8
   si red4 mi8 la,[si16 dod si8 la]

   %7
   sold4 r8 mi\mbreak re(sold si) re,
   dod(mi la) dod, si(re sold) si,
   la-. si-. dod-. re-. mi[dod'] re16(dod) re(mi)

   %10
   dod8 re,4 mi8 dod dod' re16(dod) re(mi)
   dod8 sold4 sold8 la dod re16(dod) re(mi)
   dod8 re,4 mi8 dod dod' re16(dod) re(mi)

   %13
   dod8 sold4 sold8 la4 r \mbreak %%%%%fine ripresa
   R1*12
   r2 r8 si dod16(si) la(sold)

   %27
   la8 mi' fad16(mi) red(dod) red8 la' si16(la) sold(fad)
   sold4 dod,8 r si r la r
   sold[fad16 mi fad8 red] mi4 dod'8 r

   %30
   si r la r sold[fad16 mi fad8 red]
   mi mi' fad red mi16 si'4.  la32 sold
   fad16 la4. sold32 fad mi16 sold4. fad32 mi

   %33
   red16 si fad' red la' fad si fad sold8 mi r sold
   dod,8 dod dod dod red red red red
   sid sid sid sid dod dod dod dod

   %36
   fadd fadd fadd fadd sold sold sid, sid\mbreak
   dod4 r r2
   R1*5

   %43
   r8 sold' la16(sold) fad(mi) fad8 la sold16(fad) mi(red)
   mi4 la8 r sold r fad r
   mi[red16 dod red8 sid] dod4 la'8 r

   %46
   sold r fad r mi[red16 dod red8 sid]\mbreak
   dod mi fad red mi4 r
   R1*6

   %54
   r8 mi fad16(mi) re(dod) re8 la si16 la sold fad
   sold8 re' mi16 re dod si dod8 la fad'\noBeam r
   mi r re r dod[si16 la si8 sold]

   %57
   la mi r4 r2
   R1
   r2 r4 r8 mi

   %60
   mi mi fa mi mi mi fa mi
   mi re mi do sold'! la si sold
   mi mi mi mi\mbreak do' do do do

   %63
   la la la la si si si si
   sol sol sol sol la la la la
   sold! sold sold mi mi mi mi mi

   %66
   sold sold  sold sold sold sold sold sold\mbreak
   sold sold sold sold mi mi fad si
   si do do do si si si si

   %69
   la la la la sold sold sold sold
   sold sold sold sold si si si sold
   mi mi mi mi mi mi sold sold

   %72
   mi mi' fad16(mi) re(dod) re8[la si16(la) sold(fad)]
   sold8[re' mi16 (re) dod(si)] dod8 la fad'\noBeam r
   mi r re r dod[si16 la si8 sold]

   %75
   la4 fad'8 r mi r re r
   dod[si16 la si8 sold] la red4 mi8
   si red4 mi8 la,[si16 dod si8 la]

   %78
   sold4 r8 mi\mbreak re(sold si) re,
   dod(mi la) dod, si(re sold) si,
   la-. si-. dod-. re-. mi[dod'] re16(dod) re(mi)

   %81
   dod8 re,4 mi8 dod dod' re16(dod) re(mi)
   dod8 sold4 sold8 la dod re16(dod) re(mi)
   dod8 re,4 mi8 dod dod' re16(dod) re(mi)

   %84
   dod8 sold4 sold8 la4\fermata r

}

IIIvlan =  \relative do' {

   dod'8 dod, r dod' la fad r la,
   si sold r mi' mi4 la8 r
   la r la r la mi fad mi

   %4
   mi4 la8 r la r la r
   la mi fad mi mi fad4 sold8
   mi fad4 sold8 la fad fad fad

   %7
   si,4 r8 mi re re re re
   dod dod dod dod si si si si
   la si dod re mi la fad fad

   %10
   mi re re si dod la' fad fad
   mi mi mi mi mi la fad fad
   mi re re si dod la' fad fad

   %13
   mi mi mi mi dod4 r %%%% ripresa
   R1*12
   r2 sold'8 sold, r sold'

   %27
   mi dod r mi fad red r si
   si4 mi8 r mi r mi r
   mi si dod si si r mi r

   %30
   mi r mi r mi si dod si
   si si' dod si \parenthesize mi,4 r
   R1*11

   %43
   sold8 mi r mi red sid r sid'
   sold dod, dod' dod, dod' dod, dod' dod,
   dod' sold la sold mi4 dod'8 dod,

   %46
   dod' dod, dod' dod, dod'8 sold la sold
   sold sold la sold sold4 r
   R1*6

   %54
   dod8 dod, r dod' la fad r la,
   si sold r mi' mi4 la8 r
   dod r la r la mi fad mi

   %57
   mi dod r4 r2\mbreak
   R1
   r2 r4 r8 la

   %60
   la la re[mi] la, la re[mi]\mbreak
   la, si do la mi' fad sold mi
   la, sold la mi'\mbreak la la la la

   %63
   re, re re re sol sol sol sol
   do, do do do fa fa fa fa
   si, si sold! sold la la la la

   %66
   mi' mi mi mi mi mi mi mi\mbreak
   mi mi mi mi la, la red[red]
   mi mi mi mi mi mi mi mi

   %69
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi
   la, la la la la la mi' [mi,]

   %72
   la dod r dod' la fad r la,
   si sold r mi' mi4 la8 r
   la r la r la mi fad mi

   %75
   mi4 la8 r la r la r
   la mi fad mi mi fad4 sold8
   mi fad4 sold8 la fad fad fad

   %78
   si,4 r8 mi re re re re
   dod dod dod dod si si si si
   la si dod re mi la fad fad

   %81
   mi re re si dod la' fad fad
   mi mi mi mi mi la fad fad
   mi re re si dod la' fad fad

   %84
   mi mi mi mi dod4\fermata r

}

IIIbcn = \relative do {

   la'8 la, r la' fad re r fad
   mi mi, r sold' la la, la' la,
   la' la, la' la, la' la, re mi

   %4
   la la, la' la, la' la, la' la,
   la' la, re[mi] la la la la
   sold sold sold sold fad fad red red

   %7
   mi fad sold mi\mbreak re re re re
   dod dod dod dod si si si si
   la si dod re mi la la la,

   %10
   la fad' fad mi la, la' la la,
   la mi' mi mi, la la' la la,
   la fad' fad mi la, la' la la,

   %13
   la mi' mi mi, la4 r \mbreak%%%%%%% fine ripresa
   la4 mi''8 r dod r la r
   fad r re r si r sold r

   %16
   la4 r8 la mi' fad sold mi
   la si dod la mi r re r
   dod r si r la la' si mi,

   %19
   la, la' si mi, la, la' si mi,\mbreak
   la, si dod la si mi fad si,
   mi fad sold mi si mi fad si,

   %22
   mi fad sold mi fad sold la fad
   sold la si la sold fad sold mi
   fad mi red si mi fad sold la

   %25
   si dod red dod si dod red si
   mi, mi, si''[si,]\mbreak mi mi, r mi'
   dod la r dod' si si, r red

   %28
   mi mi, mi' mi, mi' mi, mi' mi,
   mi' mi, la si mi mi, mi' mi,
   mi' mi, mi' mi, mi' mi,la si

   %31
   mi, mi' la, si \once\stemUp mi, mi'' mi mi
   red red red red dod dod dod dod
   si si si si, mi fad sold mi

   %34
   R1*3\mbreak
   dod4 dod dod dod
   si si si si

   %39
   si si la la
   la la la la
   sold sold\mbreak dod fad

   %42
   sold sold, dod8 dod fad[sold]
   dod dod, r dod' sid sid, r sid'
   dod dod, dod' dod, dod' dod, dod' dod,

   %45
   dod' dod, fad sold dod dod, dod' dod,
   dod' dod, dod' dod,  dod' dod, fad sold\mbreak
   dod dod, fad sold dod,4 r

   %48
   dod8 red mi red dod4 r
   dod8 red mi dod sold'4 r
   dod,8 red mi dod sold' fad sold mi

   %51
   la,4  r la8 si dod la
   mi'4 r\mbreak mi8 fad sold mi
   la la, re mi fad sold la si

   %54
   la la, r la' fad re r fad
   mi mi, r sold' la la,la'la,
   la' la, la' la, la' la, re mi

   %57
   la la, dod si  la4 mi''\mbreak
   dod la fad re
   mi8 fad sold mi la sold la la,

   %60
   R1*12
   la'8 la, r la' fad re r fad
   mi mi, r sold' la la, la' la,

   %74
   la' la, la' la, la' la, re mi
   la la, la' la, la' la, la' la,
   la' la, re[mi] la la la la

   %77
   sold sold sold sold fad fad red red
   mi fad sold mi\mbreak re re re re
   dod dod dod dod si si si si

   %80
   la si dod re mi la la la,
   la fad' fad mi la, la' la la,
   la mi' mi mi, la la' la la,

   %83
   la fad' fad mi la, la' la la,
   la mi' mi mi, la4\fermata r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\major
  \time 4/4
  \tempo 2 = 50
  s1*84
  \bar"|."


}

IIIvlam = {
  \IIIglobal
  %\notypeset
  <<\IIIvlamn \forma>>

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

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup\huge "[1.] All[egr]o"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Viola""d'Amore"}
            \incipit { \clef alto \key la\major\time 4/4 la'8}
            \clef violin
            \Ivlam
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

      \layout {

         indent = 3\cm
         incipit-width = 2\cm


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

}

\bookpart {

   \paper  {

      systems-per-page = #6

   }

   \markup\huge "[2.] And[ant]e"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Viola""d'Amore]"}
            \incipit { \clef alto \key la\major\time 3/8 \override Staff.TimeSignature.style = #'single-digit  <<la16\\mi>>}
            \clef violin
            \IIvlam
         >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"Violini"}
               \incipit { \clef bass \key la\major\time 3/8 \override Staff.TimeSignature.style = #'single-digit  r16}
               \clef violin
               \IIvlI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"viola"
               \set Staff.instrumentName = \markup \center-column{"Violette"}
               \incipit { \clef bass \key la\major\time 3/8 \override Staff.TimeSignature.style = #'single-digit r16}
               \clef alto
               \IIvla
            >>
      >>

      \layout {

         indent = 3\cm
         incipit-width = 2\cm


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

}

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup\huge "[3.] All[egr]o"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Viola""d'Amore]"}
            \incipit { \clef alto \key la\major\time 4/4 r8}
            \clef violin
            \IIIvlam
         >>

         \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         } <<

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
               \IIIvlI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
               \IIIvlII
            >>
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \IIIvla
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \IIIbc
         >>
      >>

      \layout {

         indent = 3.2\cm
         incipit-width = 2\cm


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

}
