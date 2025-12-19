\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

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


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzinequarto \con

}

IvlIn = \relative do'' {

   \tuplet 3/2 { dod8 (si la) } la la  \tuplet 3/2 { dod (si la) } la la
   \tuplet 3/2 { mi'(re dod) } dod dod  \tuplet 3/2 { mi(re dod) } dod dod
   la'mi dod la la16(si dod re mi8) r

   %4
   la mi dod la la16(si dod re mi8) r
   \tuplet 3/2 { sold(fad mi) } mi mi\mbreak \tuplet 3/2 { sold(fad mi) } mi mi
   \tuplet 3/2 { si'(la sold) } sold sold \tuplet 3/2 { si(la sold) } sold sold

   %7
   mi si sold mi mi16(fad sold la si4)
   mi8 si sold mi mi16(fad sold la si4)
   dod16(re mi4.) dod16(re mi4.)  %%%% avvio ripresa

   %10
   fad16(sold la4.) fad16(sold la4.)\mbreak
   red,16(mi fad4.) red16(mi fad4.)
   sold16(la si4.) sold16(la si4.)

   %13
   la16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] re8 si mi mi,

   %16
   la4 r\mbreak \tuplet 3/2 { dod'8\solo (si la) } la la  %%% fine ripresa
   \tuplet 3/2 { dod(si la) } la la \tuplet 3/2 { mi'(re dod) } dod dod
   \tuplet 3/2 { mi(re dod) } dod dod la' mi dod la

   %19
   la' mi dod la \tuplet 3/2 { dod,(si la) } la la
   \tuplet 3/2 { dod(si la) } la la la'' mi dod la
%%%% corde doppie
   la' mi dod la <<{si16[s si] s dod[s dod] s}\\{\slurUp  \once \override Stem #'transparent = ##t  \stemUp si(\noBeam \stemDown mi,)[ \once \override Stem #'transparent = ##t  \stemUp si'(\noBeam \stemDown mi,)]  \once \override Stem #'transparent = ##t  \stemUp dod'(\noBeam\stemDown  mi,)[ \once \override Stem #'transparent = ##t  \stemUp dod'(\noBeam\stemDown  mi,)] }>>

   %22
   <<{re'16[s re] s dod[s dod] s}\\{\slurUp  \once \override Stem #'transparent = ##t  \stemUp re(\noBeam \stemDown mi,)[ \once \override Stem #'transparent = ##t  \stemUp re'(\noBeam \stemDown mi,)]  \once \override Stem #'transparent = ##t  \stemUp dod'(\noBeam\stemDown  mi,)[ \once \override Stem #'transparent = ##t  \stemUp dod'(\noBeam\stemDown  mi,)]}>> <<{si'16[s si] s dod[s dod] s}\\{\slurUp  \once \override Stem #'transparent = ##t  \stemUp si(\noBeam \stemDown mi,)[ \once \override Stem #'transparent = ##t  \stemUp si'(\noBeam \stemDown mi,)]  \once \override Stem #'transparent = ##t  \stemUp dod'(\noBeam\stemDown  mi,)[ \once \override Stem #'transparent = ##t  \stemUp dod'(\noBeam\stemDown  mi,)]}>>
   <<{re'16[s re] s dod[s dod] s}\\{\slurUp  \once \override Stem #'transparent = ##t  \stemUp re(\noBeam \stemDown mi,)[ \once \override Stem #'transparent = ##t  \stemUp re'(\noBeam \stemDown mi,)]  \once \override Stem #'transparent = ##t  \stemUp dod'(\noBeam\stemDown  mi,)[ \once \override Stem #'transparent = ##t  \stemUp dod'(\noBeam\stemDown  mi,)]}>> <<si'4\\mi,>> r8 mi
   la16[sold fad mi re dod si la] mi''[re dod si la sold fad mi]

   %25
   la16[sold fad mi re dod si la] mi''[re dod si la sold fad mi]
   dod'8[si16 dod re8\tr si]  dod8[si16 dod re8\tr si]
   dod8[si16 dod re8\tr dod] si4 r8 r16 mi,

   %28
   mi,(si' sold') la si sold fad mi\mbreak red dod si8 r r16 mi
   mi,(si' sold') la si sold fad mi fad,(dod' la') si dod la sold fad
   sold,(red' si') dod red si la sold la,(mi' dod') red mi dod si la

   %31
   si,(fad' red') mi fad red dod si mi4 r8 si
   mi16 red dod si dod4\tr si r8 mi,
   la16 sold fad mi fad4\tr  mi r8 si\mbreak

   %34
   mi16 red dod si sold' fad mi red si' la sold fad mi' red dod si
   la sold fad mi  fad4\tr mi r8 si
   mi16 red dod si  sold' fad mi red si' la sold fad mi' red dod si

   %37
   la sold fad mi fad4\tr mi mi8 mi
   \tuplet 3/2 { sold(fad mi) } mi mi \tuplet 3/2 { si'(la sold) } sold sold
   \tuplet 3/2 { si(la sold) } sold sold\mbreak mi si sold mi

   %40
   mi16(fad sold la si4) mi8 si sold mi
   mi16(fad sold la si4) \slurDashed dod16(re mi4.)
   dod16(re mi4.)  \slurSolid fad16(sold la4.)

   %43
   fad16(sold la4.) mi16[red dod si la sold fad mi]
   si''8 si, r4 mi16[red dod si la sold fad mi]
   si''8 si, r4\mbreak mi16[red dod si la sold fad mi]

   %46
   la8 fad si si, mi16 sold' fad sold la fad mi fad
   sold si la si dod la sold la si mi red mi fad red dod red
   mi4 \senza \terzine \tuplet 3/2 { r16 mi,(fad sold fad mi) } si'4 r8 sold

   %49
   sold\tr fad \tuplet 3/2 { r16 fad(sold la sold fad) }dod'4 r8 la
   la\tr sold \tuplet 3/2 { r16 sold(lad si lad sold) }\mbreak red'?4 r8 si
   si\tr lad r16 lad fad lad dod, lad' fad lad dod, lad' fad lad

   %52
   sid,4 r16 red sid red fad, red' sid red fad, red' sid red
   mid,4 r16 sold' mid sold si, sold' mid sold si, sold' mid sold
   lad,4 r16 dod lad dod mi,? dod' lad dod mi, dod' lad dod

   %55
   red,4 r16 red'' sid red\mbreak sold, red' sid red sold, red' sid red
   sold, mi' dod mi sold, mi' dod mi fad, dod' lad dod fad, dod' lad dod
   fad, red' si? red fad, red' si red mi, si' sold si mi, si' sold si

   %58
   mi, dod' la? dod mi, dod' la dod red, lad' fad lad red, lad' fad lad
   red, si' sold si red, si' sold si dod, sold' mid sold dod, sold' mid sold\mbreak
   dod, la' fad la dod, la' fad la sid, red sid red fad, red' sid red

   %61
   mi,4 r8 sold' la16 fad sold fad sid sold la sold
   dod lad sid lad red sid dod sid mi dod red dod fad red mi red
   sold4 r16 sold, la sold dod sold la sold dod sold dod sold\mbreak  % fine p. 6

   %64
   dod dod, red dod red4\tr dod dod8 dod
   \terzinequarto\con \tuplet 3/2 { mi(red dod) } dod dod \tuplet 3/2 { sold'(fad mi) } mi mi
   \tuplet 3/2 { sold(fad mi) } mi mi dod' sold mi dod

   %67
   dod16(red mi fad sold8) r dod sold mi dod
   dod16(red mi fad sold8) r mi16(fad sold4.)\mbreak
   mi16(fad sold4.) dod16[si la sold fad mi red dod]

   %70
   sold'8 sold, r4 dod'16[si la sold fad mi red dod]
   sold'8 sold, r4 dod'16[si la sold fad  mi red dod]
   fad8 red sold sold,dod16\solo[(sold') la(sold) la(sold) la(sold)]

   %73
   dod(sid) dod(sid) dod(sid) dod(sid) mi(red) mi(red) mi(red) mi(red)\mbreak
   sold(fad) sold(fad) sold(fad) mi(red) mi8 dod r4  %%% inizio p. 8
   mid16 si sold si dod, si' mid sold mid si sold si dod, si' mid sold

   %76
   lad, mi dod mi fad, mi'  lad dod lad mi dod mi fad, mi' lad dod
   red la? fad la si, la' red fad red la fad la si, la' red fad\mbreak
   sold, re? si re mi, re' sold si sold re si re mi, re' sold si

   %79
   dod sol mi sol sol, mi' dod' re dod sol mi sol la, sol' dod mi
   re la fad la la, fad' re' mi re la sold la la, fad' re' mi
   si fad re fad sol, fad' si re si fad re fad sol, fad' si re\mbreak  %%% fine p.8

   %82
   dod sol mi sol sol, mi' dod' re dod sol mi sol sol, mi' dod' re
   lad mi dod mi fad, mi' lad dod lad mi dod mi fad, mi' lad dod
   si la? si do do si do red red do red mi mi red mi fad,

   %85
   fad mi fad sol sol fad sol lad lad sol lad si si lad si re,\mbreak
   re si si' si, re si si' si, re si si' si, dod4\tr
   si r  \tuplet 3/2 { dod8 (si la) } la la

   %88
   \tuplet 3/2 { dod (si la) } la la \tuplet 3/2 { mi'(re dod) } dod dod
   \tuplet 3/2 { mi(re dod) } dod dod dod16(re mi4.)
   dod16(re mi4.) fad16(sold la4.)

   %91
   fad16(sold la4.)  red,16(mi fad4.)
   red16(mi fad4.)  sold16(la si4.)
   sold16(la si4.) la16\solo[mi] \tuplet 3/2 { dod'(si la)  }mi'8 dod

   %94
   dod\tr si r mi, sold16[mi] \tuplet 3/2 { si'(la sold) } mi'8 re
   re\tr dod r mi,, la16[mi] \tuplet 3/2 { dod'(si la) } mi'8[dod]
   dod\tr si r mi, sold16[mi]  \tuplet 3/2 { re'(dod si) } mi8 re

   %97
   re\tr dod r la\mbreak dod16[la] \tuplet 3/2 { mi'(re dod) } la'8 sol
   fad16[re] \tuplet 3/2 { la'(sol? fad) } si8 la sol16[mi] \tuplet 3/2 { si'(la sol) } dod8 si
   la16[fad] \tuplet 3/2 { dod'(si la) } re8 dod si16[sol?] \tuplet 3/2 { re'(dod si) } mi8 re

   %100
   dod16(re mi) mi mi(re dod si) si4(lad)
   si16(dod re) re re(dod si la) la4(sold!)
   la16(si dod) dod dod(si la sold)\mbreak fad(sold la si) si(la sold fad)

   %103
   mid(dod mid sold si) sold fad sold \terzine \tuplet 3/2 { la sold fad  mi?[re dod] fad mi re dod[si la]}
   sold fad mi8 r mi' \appoggiatura fad mi16(re mi8) \appoggiatura fad mi16(re mi8)
   mi'[re16(dod) si(la) sold(fad)] \appoggiatura fad8 mi16(re mi8) \appoggiatura fad mi16(re mi8)

   %106
   mi'[re16(dod) si(la) sold(fad)] \appoggiatura mi8 re16(dod re8) \appoggiatura mi8 re16(dod re8)\mbreak
   re'[dod16(si) la(sold) fad(mi)] \appoggiatura re8 dod16(si dod8) \appoggiatura re8 dod16(si dod8)
   \appoggiatura la'8 sold16(fad sold8)  \appoggiatura la8 sold16(fad sold8) \senza \tuplet 3/2 { la16 sold fad mi[fad sold] la sold fad mi[fad sold] }

   %109
   la8 la, si4\tr la r8 la'
   \tuplet 3/2 { dod16 si dod dod[si la] mi' la, si dod[si la] } mi'8 la, si4\tr
   <<la\\{dod,16(re mi4.)}>> dod16(re mi4.)  %%%% avvio ripresa

   %112
   fad16(sold la4.) fad16(sold la4.)\mbreak
   red,16(mi fad4.) red16(mi fad4.)
   sold16(la si4.) sold16(la si4.)

   %115
   la16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] re8 si mi mi,

   %118
   la4\fermata r r2

}

IvlIIn = \relative do'' {

   \tuplet 3/2 { dod8 (si la) } la la  \tuplet 3/2 { dod (si la) } la la
   \tuplet 3/2 { mi'(re dod) } dod dod  \tuplet 3/2 { mi(re dod) } dod dod
   la'mi dod la la16(si dod re mi8) r

   %4
   la mi dod la la16(si dod re mi8) r
   \tuplet 3/2 { sold(fad mi) } mi mi\mbreak \tuplet 3/2 { sold(fad mi) } mi mi
   \tuplet 3/2 { si'(la sold) } sold sold \tuplet 3/2 { si(la sold) } sold sold

   %7
   mi si sold mi mi16(fad sold la si4)
   mi8 si sold mi mi16(fad sold la si4)
   dod16(re mi4.) dod16(re mi4.)  %%%% avvio ripresa

   %10
   fad16(sold la4.) fad16(sold la4.)\mbreak
   red,16(mi fad4.) red16(mi fad4.)
   sold16(la si4.) sold16(la si4.)

   %13
   la16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] re8 si mi mi,

   %16
   la4 r \mbreak dod,8 re mi re  %%%%%% fine ripresa
   dod re mi re dod re mi re
   dod re mi re dod4 r

   %19
   dod4 r dod8 re mi re
   dod re mi re dod4 r
   dod r si''8 si dod dod

   %22
   re re dod dod\mbreak si si dod dod
   re re dod dod si4 r
   la,8 la la la sold sold sold sold

   %25
   fad fad fad fad mi mi mi mi
   la la si mi, la la si mi,
   la la mi red mi fad sold fad

   %28
   mi4 r\mbreak si'8 dod si la
   sold mi r4 r2
   R1*7

   %37
   r2  \tuplet 3/2 { sold'8 (fad mi) } sold sold
   \tuplet 3/2 { sold(fad mi) } mi mi \tuplet 3/2 { si'(la sold) } sold sold
   \tuplet 3/2 { si(la sold) } sold sold\mbreak mi si sold mi

   %40
   mi16(fad sold la si4) mi8 si sold mi
   mi16(fad sold la si4) \slurDashed dod16(re mi4.)
   dod16(re mi4.)  \slurSolid fad16(sold la4.)

   %43
   fad16(sold la4.) mi16[red dod si la sold fad mi]
   si''8 si, r4 mi16[red dod si la sold fad mi]
   si''8 si, r4\mbreak mi16[red dod si la sold fad mi]

   %46
   la8 fad si si, mi4 r
   R1
   r2 mi8 fad sold mi

   %49
   r2 la8 sold la red,
   r2 si8 dod red si
   r2 lad'8 lad lad lad

   %52
   sold lad sid sold r2
   r sold8 sold sold sold
   fad sold lad fad r2

   %55
   r\mbreak r8 sold sold sold,
   r2 r8 lad' lad fad
   r2 r8 sold sold mi

   %58
   r2 r8 fad fad red
   r2 r8 mid mid dod\mbreak
   r2 r8 sold' sold sold,

   %61
   r2 fad'4 sold
   lad sid dod red
   mi8 red mi dod r2\mbreak

   %64
   dod8 dod, sold' sold, \tuplet 3/2 { mi''8 (red dod) } dod dod
   \terzinequarto\con \tuplet 3/2 { mi(red dod) } dod dod \tuplet 3/2 { sold'(fad mi) } mi mi
   \tuplet 3/2 { sold(fad mi) } mi mi dod' sold mi dod

   %67
   dod16(red mi fad sold8) r dod sold mi dod
   dod16(red mi fad sold8) r mi16(fad sold4.)\mbreak
   mi16(fad sold4.) dod16[si la sold fad mi red dod]

   %70
   sold'8 sold, r4 dod'16[si la sold fad mi red dod]
   sold'8 sold, r4 dod'16[si la sold fad  mi red dod]
   fad8 red sold sold, dod4 r

   %73
   R1*2
   mid8 mid mid  mid mid mid  mid mid
   mi! mi mi mi mi mi mi mi

   %77
   red red red red red red red red\mbreak
   re! re re re re re re re
   dod dod dod dod dod dod dod dod

   %80
   la la la la la la la la
   si si si si si si si si\mbreak
   sol sol sol sol sol sol sol sol

   %83
   lad lad lad lad lad lad lad lad
   fad4 r r2
   R1*2

   %87
   r2 \tuplet 3/2 { dod'8(si la) } la la
   \tuplet 3/2 { dod (si la) } la la \tuplet 3/2 { mi'(re dod) } dod dod
   \tuplet 3/2 { mi(re dod) } dod dod dod16(re mi4.)
   dod16(re mi4.) fad16(sold la4.)

   %91
   fad16(sold la4.)  red,16(mi fad4.)
   red16(mi fad4.)  sold16(la si4.)
   sold16(la si4.) la8 la,, dod la

   %94
   mi' fad sold fad mi fad sold mi
   la, si dod si la si dod la
   mi' fad sold fad mi fad sold mi

   %97
   la, si dod si\mbreak la si dod la
   re fad red si mi sold mid dod
   fad la fad red sold si sold mi

   %100
   la la sold sold fad fad fad fad
   sold sold fad fad mi mi mi mi
   fad fad mi mi\mbreak re re si si

   %103
   dod dod dod mid fad4 re
   mi8 fad sold fad mi fad sold fad
   mi4 r mi8 fad sold fad

   %106
   mi4 r mi8 fad sold fad\mbreak
   mi4 r dod8 re mi dod
   si' la si sold la, r la r

   %109
   la la mi' mi la, si dod si
   la r la r la la mi' mi
   <<{dod'16(re mi4.)}\\la,,4>>  dod'16(re mi4.)  %%%% avvio ripresa

   %112
   fad16(sold la4.) fad16(sold la4.)\mbreak
   red,16(mi fad4.) red16(mi fad4.)
   sold16(la si4.) sold16(la si4.)

   %115
   la16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] re8 si mi mi,

   %118
   la4\fermata r r2

}

IvlIIIn = \relative do'' {

   R1*2
   \tuplet 3/2 { dod8 (si la) } la la  \tuplet 3/2 { dod (si la) } la la
   \tuplet 3/2 { mi'(re dod) } dod dod  \tuplet 3/2 { mi(re dod) } dod dod

   %5
   mi si sold mi\mbreak mi16(fad sold la si8) r
   mi si sold mi mi16(fad sold la si8) r
   \tuplet 3/2 { sold'(fad mi) } mi mi \tuplet 3/2 { sold(fad mi) } mi mi

   %8
   \tuplet 3/2 { si'(la sold) }  sold sold \tuplet 3/2 { si(la sold)}  sold sold
   la,16(si dod4.) la16(si dod4.)  %%%ripresa
   re16(mi fad4.) re16(mi fad4.)\mbreak

   %11
   si,16(dod red4.) si16(dod red4.)
   mi16(fad sold4.) mi16(fad sold4.)

   %13
   la16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] re8 si mi mi,

   %16
   la4 r \mbreak la,8 si dod si
   la si dod si la si dod si
   la si dod si la4 r

   %19
   la r la8 si dod si
   la si dod si la4 r
   la r sold''8 sold la la

   %22
   si si la la\mbreak sold sold la la
   si si la la sold4 r
   la,8 la la la sold sold sold sold

   %25
   fad fad fad fad mi mi mi mi
   la la si mi, la la si mi,
   la la mi red mi fad sold fad

   %28
   mi4 r\mbreak si'8 dod si la
   sold mi r4 r2
   R1*7

   %37
   r2 mi'8 si sold mi
   \slurDashed mi16[(fad sold la si8)] r mi si sold mi
   mi16[(fad sold la si8)]\slurSolid  r\mbreak \tuplet 3/2 { sold'8(fad mi) } mi mi

   %40
   \tuplet 3/2 { sold8(fad mi) } mi mi \tuplet 3/2 { si'(la sold) } sold sold
   \tuplet 3/2 { si(la sold) } sold sold la,16(si dod4.)
   la16(si dod4.) red16(mi fad4.)

   %43
   red16(mi fad4.) mi16[red dod si la sold fad mi]
   si''8 si, r4 mi16[red dod si la sold fad mi]
   si''8 si, r4\mbreak mi16[red dod si la sold fad mi]

   %46
   la8 fad si si, mi4 r
   R1
   r2 mi8 fad sold mi

   %49
   r2 la8 sold la red,
   r2 si8 dod red si
   r2 lad'8 lad lad lad

   %52
   sold lad sid sold r2
   r sold8 sold sold sold
   fad sold lad fad r2

   %55
   r\mbreak r8 sold sold sold,
   r2 r8 lad' lad fad
   r2 r8 sold sold mi

   %58
   r2 r8 fad fad red
   r2 r8 mid mid dod\mbreak
   r2 r8 sold' sold sold,

   %61
   r2 fad'4 sold
   lad sid dod red
   mi8 red mi dod r2\mbreak

   %64
   dod8 dod, sold' sold,  dod'' sold mi dod
   dod16[(red mi fad sold8)] r dod sold mi dod
   dod16[(red mi fad sold8)] r \tuplet 3/2 { mi(red dod) } dod dod

   %67
   \tuplet 3/2 { mi(red dod) } dod dod \tuplet 3/2 { sold'(fad mi) } mi mi
   \tuplet 3/2 { sold(fad mi) } mi mi dod16(red mi4.)\mbreak % fine prima riga p. 7
   dod16(red mi4.) dod'16[si la sold fad mi red dod]

   %70
   sold'8 sold, r4 dod'16[si la sold fad mi red dod]
   sold'8 sold, r4 dod'16[si la sold fad  mi red dod]
   fad8 red sold sold, dod4 r

   %73
   R1*2
   si8 si si si si si si si
   lad lad lad lad lad lad lad lad

   %77
   la! la la la la la la la\mbreak
   sold! sold sold sold sold sold sold sold
   sol! sol sol sol sol sol sol sol

   %80
   fad fad fad fad fad fad fad fad
   fad fad fad fad fad fad fad fad\mbreak
   mi mi mi mi mi mi mi mi

   %83
   fad fad fad fad fad fad fad fad
   re4 r r2
   R1*2

   %87
   r2 la''8 mi dod la
   la16[(si dod re mi8)] r la mi dod la
   \once\slurDashed la16[(si dod re mi8)] r la,16(si dod4.)

   %90
   la16(si dod4.) re16(mi fad4.)
   re16(mi fad4.) fad16(sold la4.)\mbreak
   fad16(sold la4.) mi16(fad sold4.)

   %93
   mi16(fad sold4.) la8 la,, dod la
   mi' fad sold fad mi fad sold mi
   la, si dod si la si dod la
   mi' fad sold fad mi fad sold mi

   %97
   la, si dod si\mbreak la si dod la
   re fad red si mi sold mid dod
   fad la fad red sold si sold mi

   %100
   la la sold sold fad fad fad fad
   sold sold fad fad mi mi mi mi
   fad fad mi mi\mbreak re re si si

   %103
   dod dod dod mid fad4 re
   sold8 la si la sold la si la
   sold4 r sold8 la si la

   %106
   sold4 r sold8 la si la\mbreak
   sold4 r la,8 si dod la
   mi' fad sold mi la,8 r la r

   %109
   la la mi' mi la, si dod si
   la r la r la la mi' mi
   <<{la16(si dod4.)}\\la,4>>  la'16(si dod4.)  %%%ripresa

   %112
   re16(mi fad4.) re16(mi fad4.)\mbreak
   si,16(dod red4.) si16(dod red4.)
   mi16(fad sold4.) mi16(fad sold4.)

   %115
   la16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] mi'8 mi, r4
   la'16[sold fad mi re dod si la] re8 si mi mi,

   %115
   la4\fermata r r2

}

Ivlan = \relative do' {

   la'8 la, la r la' la, la r
   la' la, la r la' la, la r
   la' la, la r la' la, la r

   %4
   la' la, la r la' la, la r
   mi' mi, mi  r\mbreak mi' mi, mi r
   mi' mi, mi r mi' mi, mi r

   %7
   mi' mi, mi r mi' mi, mi r
   mi' mi, mi r mi' mi, mi r
   la' mi dod la la' mi dod la %%% ripresa

   %10
   re' la fad re re' la fad re\mbreak
   si' fad red si si' fad red si
   mi' si sold mi mi' si sold mi

   %13
   dod' dod dod dod si si si si
   la la la la sold sold sold sold
   la16[sold fad mi re dod si la] re8 si mi mi,

   %16
   la4 r\mbreak la8 si dod si
   la si dod si la si dod si
   la si dod si la4 r

   %19
   la r la8 si dod si
   la si dod si la4 r
   la r mi''8 mi mi mi

   %22
   mi mi mi mi\mbreak mi mi mi mi
   mi mi mi mi mi4 r
   la,8 la la la sold sold sold sold

   %25
   fad fad fad fad mi mi mi mi
   la la si mi, la la si mi,
   la la mi red mi fad sold fad

   %28
   mi4 r\mbreak si'8 dod si la
   sold mi r4 r2
   R1*7

   %37
   r2 mi8 mi, mi r
   mi' mi, mi r mi' mi, mi r
   mi' mi, mi r mi' mi, mi r

   %40
   mi' mi, mi r mi' mi, mi r
   mi' mi, mi r la' mi dod la
   la' mi dod la red' fad, red si

   %43
   si' fad red si sold' sold sold sold
   fad fad fad fad mi mi mi mi
   red red red red \mbreak mi'16[red dod si la sold fad mi]

  %46
  la8 fad si si, mi4 r
   R1
   r2 mi8 fad sold mi

   %49
   r2 la8 sold la red,
   r2 si8 dod red si
   r2 lad'8 lad lad lad

   %52
   sold lad sid sold r2
   r sold8 sold sold sold
   fad sold lad fad r2

   %55
   r\mbreak r8 sold sold sold,
   r2 r8 lad' lad fad
   r2 r8 sold sold mi

   %58
   r2 r8 fad fad red
   r2 r8 mid mid dod\mbreak
   r2 r8 sold' sold sold,

   %61
   r2 fad'4 sold
   lad sid dod red
   mi8 red mi dod r2\mbreak

   %64
   dod8 dod, sold' sold, dod' dod, dod r
   dod' dod, dod r dod' dod, dod r
   dod' dod, dod r dod' dod, dod r

   %67
   dod' dod, dod r dod' dod, dod r
   dod' dod, dod r dod' sold mi dod\mbreak
   dod' sold mi dod mi mi mi mi

   %70
   red red red red dod dod dod dod
   sid sid sid sid  dod'16[si? la sold fad mi red dod]
   mi8 red fad fad, dod'4 r

   %73
   R1*2
   dod8 dod dod dod dod dod dod dod
   fad, fad fad fad fad fad fad fad

   %77
   si si si si si si si si\mbreak
   mi, mi mi mi mi mi mi mi
   la la la la la la la la

   %80
   re, re re re re re re re
   sol sol sol sol sol sol sol sol\mbreak
   dod, dod dod dod dod dod dod dod

   %83
   fad fad fad fad fad fad fad fad
   si4 r r2
   R1*2

   %87
   r2 la'8 la, la r
   la' la, la r  la' la, la r
   la' la, la r la' mi dod la

   %90
   la' mi dod la re' la fad re
   re' la fad re si' fad red si\mbreak
   si' fad red si mi' si sold mi

   %93
   mi' si sold mi la,4 r
   R1*17
   la'8 mi dod la la' mi dod la %%% ripresa

   %112
   re' la fad re re' la fad re\mbreak
   si' fad red si si' fad red si
   mi' si sold mi mi' si sold mi

   %115
   dod' dod dod dod si si si si
   la la la la sold sold sold sold
   la16[sold fad mi re dod si la] re8 si mi mi,

   %118
   la4\fermata r r2

}

Ibcn = \relative do {

   la8 r la' la, la  r la' la,
   la r la' la, la r la' la,
   la r la' la, la r la' la,

   %4
   la r la' la, la r la' la,
   mi r mi' mi,\mbreak mi r mi' mi,
   mi r mi' mi, mi r mi' mi,

   %7
   mi r mi' mi, mi r mi' mi,
   mi r mi' mi, mi r mi' mi,
   la' mi dod la la' mi dod la %%% ripresa

   %10
   re' la fad re re' la fad re\mbreak
   si' fad red si si' fad red si
   mi' si sold mi mi' si sold mi

   %13
   la la la la sold sold sold sold
   fad fad fad fad mi mi mi mi
   la16[sold fad mi re dod si la] re8 si mi mi,

   %16
   la4 r\mbreak r2  %%% fine ripresa
   R1*6
   r2 mi'8 fad sold mi

   %24
   R1*5
   mi4 r fad r
   sold r la r

   %31
   si r mi,8 fad sold fad
   mi sold la red, mi fad sold mi
   dod dod' si si, mi fad sold fad\mbreak

   %34
   mi r mi r mi r mi r
   la, dod' si si, mi fad sold fad
   mi r mi r mi r mi r

   %37
   la, dod' si si, mi, r mi' mi,
   mi r mi' mi, mi r mi' mi,
   mi r mi' mi, mi r mi' mi,

   %40
   mi r mi' mi, mi r mi' mi,
   mi r mi' mi, la' mi dod la
   la' mi dod la red' fad, red si

   %43
   si' fad red si mi mi mi mi
   red red red red dod dod dod dod
   si si si si\mbreak mi'16[red dod si la sold fad mi]

   %46
   la8 fad si si, mi4 r
   mi r mi r
   mi8 fad sold mi r2

   %49
   si8 dod red si r2
   mi8 fad sold mi\mbreak r2
   fad8 mi fad fad, r2

   %52
   r red'8  red red red
   dod red mid dod r2
   r dod8 dod dod dod

   %55
   sid sold' sold sold,\mbreak r2
   r8 dod' dod dod, r2
   r8 si' si si, r2

   %58
   r8 la' la la, r2
   r8 sold' sold sold, r2\mbreak
   r8 fad' fad fad, r2

   %61
   r8 dod'' dod dod, r2
   R1
   r2 dod'8 sid dod dod,\mbreak

   %64
   r2 dod4 dod'8 dod,   %%%%% inizio p. 7
   dod4 dod'8 dod, dod4 dod'8 dod,
   dod4 dod'8 dod, dod4 dod'8 dod,

   %67
   dod4 dod'8 dod, dod4 dod'8 dod,
   dod4 dod'8 dod, dod' sold mi dod\mbreak
   dod' sold mi dod dod' dod dod dod

   %70
   si si si si la la la la
   sold sold sold sold dod16[si la sold fad mi red dod]
   fad8 red sold sold, dod4 r

   %73
   dod r dod r \mbreak
   dod r dod8 red mi dod
   R1*9

   %84
   re8 r mi r fad r sold r
   re r mi r fad r re r\mbreak
   si r si r si si fad' fad,

   %87
   si4 r la8 r la' la,
   la r la' la, la r la' la,
   la r la' la, la' mi dod la

   %90
   la' mi dod la re' la fad re
   re' la fad re si' fad red si\mbreak
   si' fad red si mi' si sold mi

   %93
   mi' si sold mi la,4 r
   R1*17
   la'8 mi dod la la' mi dod la %%% ripresa

   %112
   re' la fad re re' la fad re\mbreak
   si' fad red si si' fad red si
   mi' si sold mi mi' si sold mi

   %115
   la la la la sold sold sold sold
   fad fad fad fad mi mi mi mi
   la16[sold fad mi re dod si la] re8 si mi mi,

   %118
   la4\fermata r\mbreak r2

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 4/4
   \key la\major
   \tempo 2 = 65
   s1*118
   \bar"|."

}


IvlI = {
   \global
   \notypeset
   <<\IvlIn \forma>>

}

IvlII = {
   \global
   <<\IvlIIn \forma>>

}

IvlIII = {
   \global
   <<\IvlIIIn \forma>>

}

Ivla = {
   \global
   \clef alto
   <<\Ivlan \forma>>

}

Ibc = {
   \global
   \clef bass
   <<\Ibcn \forma \Ibfn>>
   \typeset

}


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \con

}

IIvlIn = \relative do'' {

   R1*2
   r2 la'4._\markup\italic"à Piacimento" mi8
   si'4. mi,8 re'4. si8\mbreak

   %5
   dod4. la8 mi'4. dod8
   si mi, r mi si'4. mi,8
   red4~red16 si la si la'4. fad8

   %8
   sold fad16 mi red8.\tr mi16 mi4 r
   sold~sold16 si la sold\mbreak dod4. dod,8
   sid16(red?) fad(la) sold(fad) mi(red!) mi red dod8 r sold'

   %11
   mi16 red dod8 r sold' mi16 red dod8 r sold'
   dod dod, red4\tr dod r
   la'4. mi8\mbreak si'4. mi,8

   %14
   re'4. si8 dod16 si la8 r la
   sold4. mi8 si'4. re,8
   dod4. mi8 sold16 mi(re mi) si' mi, fad mi

   %17
   dod'8 si16 la sold8.\tr la16\mbreak la4 r8 mi
   dod' si16 la sold8.\tr la16 la4 r
   R1

}

IIvlIIn = \relative do'' {

   dod16 la' la dod, dod la' la dod, si sold' sold si, si sold' sold si,
   dod la' la dod, dod la' la dod, re si' si re, re si' si re,
   dod la' la dod, si sold' sold si, dod4 r

   %4
   si16 sold' sold si, si sold' sold si, si sold' sold si, si sold' sold mi\mbreak
   dod la' la dod, dod la' la dod, dod la' la dod, dod la' la la,
   si sold' sold si, si sold' sold si, si sold' sold si, si sold' sold si,

   %7
   si fad' fad si, si fad' fad si, si fad' fad si, si fad' fad si,
   si sold' sold si, si fad' fad si, si sold' sold si, si sold' sold si,
   si sold' sold si, si sold' sold si,\mbreak dod sold' sold dod, dod sold' sold dod,

   %10
   red fad fad red red fad fad red mi sold sold dod, dod sold' sold dod,
   dod sold' sold dod, dod sold' sold dod, dod sold' sold dod, dod sold' sold dod,
   dod sold' sold dod, red sold sold red dod sold' sold dod, dod sold' sold dod,

   %13
   dod la' la dod, dod la' la dod,\mbreak si sold' sold si, si sold' sold si,
   si sold' sold si, si sold' sold mi dod la' la dod, dod la' la  dod,
   si sold' sold si, si sold' sold si, si sold' sold si, si sold' sold si,

   %16
   dod la' la dod, dod la' la dod, si sold' sold si, si sold' sold si,
   dod la' la dod, si sold' sold si,\mbreak dod la' la dod, dod la' la dod,
   dod la' la dod, si sold' sold si, dod la' la dod, dod la' la dod,

   %19
   si sold' sold si, si sold' sold si, dod2\fermata

}

IIvlIIIn = \relative do'' {

   la16 mi' mi la, la mi' mi la, sold mi' mi sold, sold mi' mi sold,
   la mi' mi la, la mi' mi la, si sold' sold si, si sold' sold si,
   la mi' mi la, sold mi' mi sold, la4 r

   %4
   sold16 mi' mi sold, sold mi' mi sold, sold mi' mi sold, sold mi' mi sold,\mbreak
   la mi' mi la, la mi' mi la,   la mi' mi la, la mi' mi la,
   sold mi' mi sold, sold mi' mi sold, sold mi' mi sold, sold mi' mi sold,

   %7
   fad red' red fad, fad red' red fad, fad red' red fad, fad red' red si
   sold mi' mi sold, fad red' red fad, sold mi' mi sold, sold mi' mi sold,
   sold mi' mi sold, sold mi' mi sold,\mbreak sold mi' mi sold, sold mi' mi sold,

   %10
   sid red red sid sid red red sid dod mi mi sold, sold mi' mi sold,
   sold mi' mi sold, sold mi' mi sold, sold mi' mi sold, sold mi' mi sold,
   sold mi' mi dod sid red red sid sold mi' mi sold, sold mi' mi sold,

   %13
   la mi' mi la, la mi' mi la,\mbreak mi mi' mi sold, sold mi' mi sold,
   sold mi' mi sold, sold mi' mi si la mi' mi la, la mi' mi dod
   sold mi' mi sold, sold mi' mi sold,  sold mi' mi sold,  sold mi' mi sold,

   %16
   la mi' mi la, la mi' mi la,  sold mi' mi sold,  sold mi' mi sold,
   la mi' mi dod  sold mi' mi sold,\mbreak la mi' mi la, la mi' mi la,
   la mi' mi dod  sold mi' mi sold, la mi' mi la, la mi' mi la,

   %19
   sold mi' mi sold,  sold mi' mi sold, la2\fermata

}

IIvlan = \relative do' {

   mi8 mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi
   mi mi mi mi  mi4 r

   %4
   mi8 mi mi mi mi mi mi mi\mbreak
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi

   %7
   fad fad fad fad fad fad fad fad
   mi si si si si si si si
   si si si si\mbreak sold sold sold sold

   %10
   sold sold sold sold sold mi' mi mi
   mi mi mi mi mi mi mi mi
   mi mi sold sold mi mi mi mi

   %13
   mi mi mi mi\mbreak mi mi mi mi
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi

   %16
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi

   %19
   mi mi mi mi mi2\fermata

}

IIbcn = \relative do {

   la8 la la la mi' mi mi mi
   la, la la la sold sold sold sold
   la la mi' [mi,] la4 r

   %4
   mi'8 mi mi mi mi mi mi mi\mbreak
   la, la la la la la la la
   mi' mi mi mi mi mi mi mi

   %7
   si si si si si si si si
   mi mi si si mi mi mi mi
   mi mi mi mi\mbreak dod dod dod dod

   %10
   sold sold sold sold dod dod dod dod
   dod dod dod dod dod dod dod dod
   dod dod sold[sold] dod dod dod dod

   %13
   la la la la\mbreak sold sold sold sold
   mi mi mi mi la la la la
   mi' mi mi mi mi mi mi mi

   %16
   la, la la la mi' mi mi mi
   la, la mi'[mi]\mbreak la, la la la
   la la mi'[mi] la, la la la

   %19
   mi' mi mi,[mi] la2\fermata

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 4/4
   \key la\major
   \tempo 4 = 40
   s1*19
   \bar"|."

}


IIvlI = {
   \global
   \notypeset
   <<\IIvlIn \forma>>

}

IIvlII = {
   \global
   <<\IIvlIIn \forma>>

}

IIvlIII = {
   \global
   <<\IIvlIIIn \forma>>

}

IIvla = {
   \global
   \clef alto
   <<\IIvlan \forma>>

}

IIbc = {
   \global
   \clef bass
   <<\IIbcn \forma \IIbfn>>
   \typeset

}


global = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \terzine \senza

}

IIIvlIn = \relative do'' {

  la'4 dod,~
  dod8[re si mi]
  la,4 r8 la

  %4
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %7
  la,4 r8 la
  mi'[mi mi si']\mbreak
  la8 dod,16 mi re8 si16 re %%ripresa

  %10
  dod8 la16 dod si8 sold16 si
  la8 dod16 mi re8 si16 re
  dod8 la16 dod si8 sold16 si

  %13
  la4 sol'~
  sol8[fad16 mi fad8 dod]
  re si la'4~

  %16
  la8[sold16 fad sold8 red]
  mi dod re'?4~
  re8[dod16 si dod8 sold]\mbreak

  %19
  la16 sold fad sold la8 r
  sold16 fad mi fad sol8 r
  fad16 mi re mi fa8 r

  %22
  mi16 re dod re mi8 r
  re16 dod si dod re8 r
  dod16[la si dod re mi fad sold]

  %25
  la4 dod,~
  dod8[re si mi]
  la,4 r8 la\mbreak

  %28
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %31
  dod4 r8 mi\solo %% fine ripresa
  la[la la16 dod si la]
  si8[si si16 re dod si]

  %34
  dod si la si dod mi re dod
  re dod si dod re fad mi re
  mi re dod re mi sold fad mi

  %37
  fad mi re mi fad la sold fad\mbreak
  sold fad mi fad sold mi fad sold
  la8 la, r4

  %40
  la16 mi dod' mi, la mi dod' mi,
  la mi dod' mi, la mi dod' la
  si8 mi, r4

  %43
  si'16 mi, re' mi, si' mi, re' mi,
  si' mi, re' mi, si' mi, re' si
  dod8 la r4

  %46
  \override Slur.outside-staff-priority = #400 dod8 (dod\tr ~dod16  si dod) re
  si8 mi r4\mbreak
  si8(si\tr~si16 la si) re

  %49
  la8 re r4
  la8(la\tr~la16 sold la) si
  sold8 dod r4

  %52
  sold8(sold\tr~sold16 fad sold) la
  \revert Slur.outside-staff-priority fad8(si4.)~
  si8[la16 (sold) la(sold) fad(mi)]

  %55
  red dod si8 r4
  fad'16 si, sold' si, la' si, fad' si,
  sold' si, la' si, si' si, sold' si,\mbreak

  %58
  fad' si, sold' si, la' si, fad' si,
  sold'4 mi'~
  mi8[red16 dod si la sold fad]

  %61
  sold8[fad16 mi red dod si la]
  sold(si mi fad) fad4\tr
  mi\tu sold,~

  %64
  sold8[la fad si]
  mi,4 r8 mi
  si' [si si fad']

  %67
  mi4 sold,~\mbreak
  sold8[la fad si]
  mi,4 r8 mi

  %70
  si'[si si fad']
  sold sold16 si la8 fad16 la
  sold8 mi16 sold fad8 red16 fad

  %73
  mi8 sold16 si la8 fad16 la
  sold8 mi16 sold fad8 red16 fad
  mi8\solo[sold16 fad mi red dod si]

  %76
  dod8[mi16 red dod si la sold]\mbreak
  la8[dod16 si la sold fad mi]
  fad8[la'16 sold fad mi red dod]

  %79
  red8[si'16 la sold fad mi red]
  mi4 r
  si'8[mi16 red dod si la sold]

  %82
  <<{s8 fad[fad fad]}\\{fad[red red red]}>>
  si'[red16 dod si la sold fad]
  <<{s8 mi [mi mi]}\\{mi[dod dod dod]}>>

  %85
  la'[dod16 si la sold fad mi]
  <<{s8 red[red red]}\\{red[si si si]}>>\mbreak
  sold'16 si sold mi sold si sold mi

  %88
  sold si sold mid sold si sold mid
  sold si sold mid sold si sold mid
  la dod la fad la dod la fad

  %91
  dod' fad dod la dod fad dod la
  re fad re si re fad re si
  si mi si sold si mi si sold

  %94
  dod mi dod la dod mi dod la
  la re la fad la re la fad\mbreak
  si re si sold si re si sold

  %97
  sold dod sold mid sold dod sold mid
  la dod la fad la dod la fad
  <<
    {
      dod16 dod dod8(fad16) dod dod8(

      %100
      re16) dod dod8(fa16) dod dod8(
      re) dod fad fad
      fad fad sold sold

      %103
      la la fad fad\mbreak
      fad fad mid mid
    }\\{
      fad,2~
      fad~
      fad4 la
      fad mid
      fad la\mbreak
      sold sold
    }\\{
      \stemUp\override Stem #'transparent = ##t s2*2
      s4 dod
      re dod
      dod dod\mbreak
      si dod
    }
  >> %%%%%%%inizio p. 20

  %105
  fad4 <<
    {
      fad8 fad
      fad fad sold sold
      la la fad fad

      %108
      fad fad  mid mid
    }\\{
      fad,4
      fad mid
      fad la
      sold sold
    }\\{
      \stemUp\override Stem #'transparent = ##t dod
      re dod
      dod dod
      si dod
    }
  >>
  fad la,~
  la8[si sold dod]

  %111
  fad,4 r8 fad
  dod'[dod dod sold']
  fad4 la,~

  %114
  la8[si sold dod]\mbreak
  fad,4 sol'~
  sol8[fad16 mi fad8 dod]

  %117
  re si la'4~
  la8[sold16 fad sold8 red]
  mi dod re'4~

  %120
  re8[dod16 si dod8 sold]
  la[fad sold mid]
  fad16\solo dod32(si la16) dod fad dod32(si la16) dod

  %123
  si sold32(fad mid16) sold dod sold32(fad mid16) sold
  la dod32(si la16) dod fad la32(sold fad16) la\mbreak %%fine p. 20
  sid, red32(dod sid16) red sold red32(dod sid16) red

  %126
  mi sold32(fad mi16) sold dod sold32(fad mi16) sold
  la dod,32(si? la16) dod la' dod,32(si la16) dod
  sid red32(dod sid16) red sold red32(dod sid16) red

  %129
  mi8 r16 sold(sold8.\tr fad32 sold)
  la16 fad32(sold la16) fad sid sold32(lad sid16) sold
  dod lad32(sid dod16) lad red sid32(dod red16) sid\mbreak

  %132
  \tuplet 3/2 {
    mi(dod) mi mi[(dod) mi] dod(sold) dod sold[(mi) sold]
    mi'(dod) mi mi[(dod) mi] dod(sold) dod sold[(mi) sold]
    la fad la la[fad la] fad dod fad dod[la dod]

    %135
    la' fad la la[fad la] fad dod fad dod[la dod]
    red' si red red[si red] si fad si fad[red fad]
    sold mi sold sold[mi sold] mi si mi si[sold si]

    %138
    dod' la dod dod[la dod] la mi la mi[dod mi]\mbreak
    la fad la la[fad la] fad red fad red[sid red]
  }

  %140
  sold,4 \tuplet 3/2 {
    r16 fad'(sold la[sold fad)]
    mi(red dod) sold'[(fad mi)]
  } red8.\tr dod16
  dod4 mi~

  %143
  mi8[fad red sold]
  dod,4 r8 dod
  sold'[sold sold red']

  %146
  dod4 mi,~
  mi8[fad red sold]
  mi4 r32 la,[(si dod re mi fad sold)]\mbreak

  %149
  la4 dod,~
  dod8[re si mi]
  la,4 r8 la

  %152
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %155
  dod4 r32 la(si dod re mi fad sold
  la8-.[ la-. la-. la-.)]
  la\tr sold r32 mi(fad sold la si dod re

  %158
  mi8-.[re-. re-. re-.)]
  re\tr dod r16 dod re mi\mbreak
  si si dod re la la si dod

  %161
  sold sold la si fad fad sold la
  mi4 r
  r16 mi fad mi sold mi la mi

  %164
  si' mi, fad mi sold mi la mi
  dod' mi, fad mi sold mi la mi
  re' mi, fad mi sold mi la mi

  %167
  mi'4 r8 mi
  re16 dod si4 re8\mbreak
  dod16 si la4 mi'8

  %170
  re16 dod si4 re8
  dod16 si la8 r fad'
  dod16 sold la,(sold' dod) re mi re

  %173
  dod sold la,(sold' dod) re mi dod
  \appoggiatura dod8 re4 r8 fad
  red16 la si,(la' red) mi fad mi

  %176
  red la si,(la' red) mi fad red
  \appoggiatura red?8 mi4 r16 mi fad mi\mbreak
  la mi fad mi la mi fad mi

  %179
  re si dod si re si dod si
  sold' re mi re sold re mi re
  dod la si la dod la si la

  %182
  fad' dod re dod fad dod re dod
  si sold la sold si sold la sold
  mi' si dod si mi si dod si

  %185
  la fad sold fad la fad sold fad
  re' la si la re la si la
  sold fad mi8 r mi\mbreak

  %188
  fa16 mi(re) dod re mi(re) dod
  dod4(re8) la'
  si16 la(sold) fad si la(sold) fad

  %191
  sold mi la mi si' mi, dod' mi,
  re' si dod si si4\tr
  la8 dod,16 mi re8 si16 re %%ripresa

  %194
  dod8 la16 dod si8 sold16 si
  la8 dod16 mi re8 si16 re
  dod8 la16 dod si8 sold16 si

  %197
  la4 sol'~
  sol8[fad16 mi fad8 dod]
  re si la'4~

  %200
  la8[sold16 fad sold8 red]
  mi dod re'?4~
  re8[dod16 si dod8 sold]\mbreak

  %203
  la16 sold fad sold la8 r
  sold16 fad mi fad sol8 r
  fad16 mi re mi fa8 r

  %206
  mi16 re dod re mi8 r
  re16 dod si dod re8 r
  dod16[la si dod re mi fad sold]

  %209
  la4 dod,~
  dod8[re si mi]
  la,4 r8 la\mbreak

  %212
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %215
  dod4\fermata r

}

IIIvlIIn = \relative do'' {

  la'4 dod,~
  dod8[re si mi]
  la,4 r8 la

  %4
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %7
  la,4 r8 la
  mi'[mi mi si']\mbreak
  la8 dod,16 mi re8 si16 re %%ripresa

  %10
  dod8 la16 dod si8 sold16 si
  la8 dod16 mi re8 si16 re
  dod8 la16 dod si8 sold16 si

  %13
  la4 sol'~
  sol8[fad16 mi fad8 dod]
  re si la'4~

  %16
  la8[sold16 fad sold8 red]
  mi dod re'?4~
  re8[dod16 si dod8 sold]\mbreak

  %19
  la16 sold fad sold la8 r
  sold16 fad mi fad sol8 r
  fad16 mi re mi fa8 r

  %22
  mi16 re dod re mi8 r
  re16 dod si dod re8 r
  dod16[la si dod re mi fad sold]

  %25
  la4 dod,~
  dod8[re si mi]
  la,4 r8 la\mbreak

  %28
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %31
  dod4 r %% fine ripresa
  R2*14
  la'8[la la la]

  %47
  la[sold sold sold]\mbreak
  sold[sold sold sold]
  sold[fad fad fad]

  %50
  fad[fad fad fad]
  fad[mi mi mi]
  mi[mi mi mi]

  %53
  red[red red red]
  dod[dod dod dod]
  si[si, si si]

  %56
  R2*7
  mi'4 sold,~

  %64
  sold8[la fad si]
  mi,4 r8 mi
  si' [si si fad']

  %67
  mi4 sold,~\mbreak
  sold8[la fad si]
  mi,4 r8 mi

  %70
  si'[si si fad']
  sold sold16 si la8 fad16 la
  sold8 mi16 sold fad8 red16 fad

  %73
  mi8 sold16 si la8 fad16 la
  sold8 mi16 sold fad8 red16 fad
  mi4 r

  %76
  R2*33
  fad4 la,~
  la8[si sold dod]

  %111
  fad,4 r8 fad
  dod'[dod dod sold']
  fad4 la,~

  %114
  la8[si sold dod]\mbreak
  fad,4 sol'~
  sol8[fad16 mi fad8 dod]

  %117
  re si la'4~
  la8[sold16 fad sold8 red]
  mi dod re'4~

  %120
  re8[dod16 si dod8 sold]
  la[fad sold mid]
  fad4 r

  %123
  R2*9
  dod8 [dod dod dod,]
  dod'[dod dod dod,]

  %134
  R2*2
  si'8[si si si,]
  R2

  %138
  la'8[la la la,]\mbreak
  R2
  sold'8[sold sold sid,]

  %141
  dod[dod sold' sold,]
  dod''4 mi,~
  mi8[fad red sold]

  %144
  dod,4 r8 dod
  sold'[sold sold red']

  %146
  dod4 mi,~
  mi8[fad red sold]
  mi4 r32 la,[(si dod re mi fad sold)]\mbreak

  %149
  la4 dod,~
  dod8[re si mi]
  la,4 r8 la

  %152
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %155
  dod4 r
  R2*6
  mi8[mi mi la]

  %163
  mi4 r
  R2*14
  dod8[dod dod dod]

  %179
  si[si si si]
  si[si si si]
  la[la la la]

  %182
  la[la la la]
  sold[sold sold sold]
  sold[sold sold sold]

  %185
  fad[fad fad fad]
  fad[fad fad fad]
  mi[re dod la]\mbreak

  %188
  sold!2
  la8[la' fad mi]
  re2

  %191
  mi8[fad sold la]
  si[la mi' mi,]
  la,8 dod'16 mi re8 si16 re %%ripresa

  %194
  dod8 la16 dod si8 sold16 si
  la8 dod16 mi re8 si16 re
  dod8 la16 dod si8 sold16 si

  %197
  la4 sol'~
  sol8[fad16 mi fad8 dod]
  re si la'4~

  %200
  la8[sold16 fad sold8 red]
  mi dod re'?4~
  re8[dod16 si dod8 sold]\mbreak

  %203
  la16 sold fad sold la8 r
  sold16 fad mi fad sol8 r
  fad16 mi re mi fa8 r

  %206
  mi16 re dod re mi8 r
  re16 dod si dod re8 r
  dod16[la si dod re mi fad sold]

  %209
  la4 dod,~
  dod8[re si mi]
  la,4 r8 la\mbreak

  %212
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %215
  dod4\fermata r

}

IIIvlIIIn = \relative do'' {

  R2*2
  la'4 dod,~
  dod8[re si mi]

  %5
  la,4 r8 la
  mi'[mi mi si']
  la4 dod,~

  %8
  dod8[re si mi]\mbreak
  la,4 r %%%5 ripresa
  r8 dod16 mi re8 si16 re

  %11
  dod8 la16 dod si8 sold16 si
  la8 dod16 mi re8 si16 re
  dod4 mi~

  %14
  mi8 dod4 lad8
  fad4 fad'~
  fad8 red4 sid8

  %17
  sold4 si'~
  si8 sold4 mid8\mbreak
  dod[fad fad] r

  %20
  mi16 re dod re mi8 r
  re16 dod si dod re8 r
  dod16 si la si dod8 r

  %23
  si16 la sold la si8 r
  la4 r
  r r8 la

  %26
  mi'[mi mi si']
  la4 dod,~\mbreak
  dod8[re si mi]

  %29
  la,4 r8 la
  mi'[mi mi si']
  la4 r %%%%% fine ripresa

  %32
  R2*14
  la8[la la la]

  %47
  la[sold sold sold]\mbreak
  sold[sold sold sold]
  sold[fad fad fad]

  %50
  fad[fad fad fad]
  fad[mi mi mi]
  mi[mi mi mi]

  %53
  red[red red red]
  dod[dod dod dod]
  si[si, si si]

  %56
  R2*7
  r4 r8 mi
  si'[si si fad']

  %65
  mi4 sold,~
  sold8[la fad si]
  mi,4 r8 mi\mbreak

  %68
  si'[si si fad']
  mi4 sold,~
  sold8 [la fad si]

  %71
  sold mi'16 sold fad8 red16 fad
  mi8 sold16 si la8 fad16 la
  sold8 mi16 sold fad8 red16 fad

  %74
  mi8 sold16 si la8 fad16 la
  sold4 r
  R2*33

  %109
  r4 r8 fad,
  dod'[dod dod sold']
  fad4 la,~

  %112
  la8[si sold dod]
  fad,4 r8 fad
  dod'[dod dod sold']\mbreak

  %115
  fad4 mi~
  mi8 dod4 lad8
  fad4 fad'~

  %118
  fad8 red4 sid8
  sold4 si'~
  si8 sold4 mid8

  %121
  fad[la, si sold]
  la4 r
  R2*9

  %132
  dod8 [dod dod dod,]
  dod'[dod dod dod,]

  %134
  R2*2
  si'8[si si si,]
  R2

  %138
  la'8[la la la,]\mbreak
  R2
  sold'8[sold sold sid,]

  %141
  dod[dod sold' sold,]
  r4 r8 dod'
  sold'[sold sold red']

  %144
  dod4 mi,~
  mi8[fad red sold]
  dod,4 r8 dod

  %147
  sold'[sold sold red]
  dod4 r\mbreak
  r r8 la

  %150
  mi'[mi mi si']
  la4 dod,~
  dod8[re si mi]

  %153
  la,4 r8 la
  mi'[mi mi si']
  la4 r

  %156
  R2*6
  dod,8[dod dod mi]
  dod4 r

  %164
  R2*14
  dod8[dod dod dod]

  %179
  si[si si si]
  si[si si si]
  la[la la la]

  %182
  la[la la la]
  sold[sold sold sold]
  sold[sold sold sold]

  %185
  fad[fad fad fad]
  fad[fad fad fad]
  mi[re dod la]\mbreak

  %188
  sold!2
  la8[la' fad mi]
  re2

  %191
  mi8[fad sold la]
  si[la mi' mi,]
  la4 r %%%5 ripresa

  %194
  r8 dod16 mi re8 si16 re
  dod8 la16 dod si8 sold16 si
  la8 dod16 mi re8 si16 re

  %197
  dod4 mi~
  mi8 dod4 lad8
  fad4 fad'~

  %200
  fad8 red4 sid8
  sold4 si'~
  si8 sold4 mid8\mbreak

  %203
  dod[fad fad] r
  mi16 re dod re mi8 r
  re16 dod si dod re8 r

  %206
  dod16 si la si dod8 r
  si16 la sold la si8 r
  la4 r

  %209
  r r8 la
  mi'[mi mi si']
  la4 dod,~\mbreak

  %212
  dod8[re si mi]
  la,4 r8 la
  mi'[mi mi si']

  %215
  la4\fermata r

}

IIIvlan = \relative do' {

  mi4 mi
  mi r
  mi mi

  %4
  mi r
  mi mi
  mi r

  %7
  mi mi
  mi r\mbreak
  mi sold %%ripresa

  %10
  mi sold
  mi sold
  mi sold

  %13
  mi r
  dod4. fad8
  re4 r

  %16
  red4. sold8
  mi4 r
  sold4. dod8\mbreak

  %19
  la la dod si
  dod[dod dod la]
  si[si si sold]

  %22
  la[la la fad]
  sold[sold sold mi]
  mi4 r

  %25
  mi mi
  mi r
  mi mi\mbreak

  %28
  mi r
  mi mi
  mi sold

  %31
  mi r %%%%% fine
  R2*31
  si4 si

  %64
  si r
  si si
  si r

  %67
  si si\mbreak
  si r
  si si

  %70
  si r
  si8[si' dod red]
  si[si dod red]

  %73
  si[si dod red]
  si[si dod red]
  si4 r

  %76
  R2*33
  dod,4 dod
  dod r

  %111
  dod dod
  dod r
  dod dod

  %114
  dod r\mbreak
  dod r
  dod4. fad8

  %117
  re4 r
  red4. sold8
  mi4 r

  %120
  sold4. dod8
  dod[dod, re dod]
  dod4 r

  %123
  R2*9
  dod'8[dod dod dod,]
  dod'[dod dod dod,]

  %134
  R2*2
  si'8[si si si,]
  R2

  %138
  la'8[la la la,]\mbreak
  R2
  sold'8[sold sold sid,]

  %141
  dod[dod sold' sold,]
  sold'4 sold
  sold r

  %144
  sold sold
  sold r
  sold sold

  %147
  sold sold8 sid
  sold4 r\mbreak
  mi mi

  %150
  mi r
  mi mi
  mi r

  %153
  mi mi
  mi sold8 sold
  mi4 r

  %156
  R2*6
  la8[la la dod]
  la4 r

  %164
  R2*29
  mi4 sold %%ripresa
  mi sold

  %195
  mi sold
  mi sold
  mi r

  %198
  dod4. fad8
  re4 r
  red4. sold8

  %201
  mi4 r
  sold4. dod8
  la8 la dod si  %%ripresa

  %204
  dod[dod dod la]
  si[si si sold]
  la[la la fad]

  %207
  sold[sold sold mi]
  mi4 r
  mi mi

  %210
  mi r
  mi mi\mbreak
  mi r

  %213
  mi mi
  mi sold
  mi\fermata r

}

IIIbcn = \relative do {

  la'8[si dod si]
  la[mi mi sold]
  la[si dod si]

  %4
  la[mi mi sold]
  la[si dod si]
  la[mi mi sold]

  %7
  la[si dod si]
  la[mi mi sold]\mbreak
  la la, mi'[mi,]  %ripresa

  %10
  la' la, mi'[mi,]
  la' la, mi'[mi,]
  la' la, mi'[mi,]

  %13
  la [si dod si]
  lad4. lad8
  si[dod red dod]

  %16
  sid4. sid8
  dod[dod' re si!]
  mid,4. dod8\mbreak

  %19
  fad[fad si, si]
  mi[mi la, la]
  re[re sold,! sold]

  %22
  dod[dod fad, fad]
  si[si mi, mi]
  la4 r

  %25
  la'8[si dod si]
  la[mi mi sold]
  la[si dod si]\mbreak

  %28
  la[mi mi sold]
  la[si dod si]
  la[mi mi mi,]

  %31
  la4 r %%%% fine ripresa
  la la'~
  la sold

  %34
  la8 la, r la'
  si si, r si'
  dod dod, r dod'

  %37
  re re, r re'\mbreak
  mi mi, r mi'
  dod[si dod la]

  %40
  la,[la' la, la']
  la,[la' la, la']
  mi [mi' mi, mi']

  %43
  mi, [mi' mi, mi']
  mi, [mi' mi, mi']
  la,, [la'la, la']

  %46
  R2*10
  si,8[si si si]
  si[si si si]\mbreak

  %58
  si[si si si]
  mi[fad sold mi]
  fad[la red, si]

  %61
  mi[dod' si red,]
  mi[dod' si si,]
  mi[fad sold fad]

  %64
  mi[si si red]
  mi[fad sold fad]
  mi[si si red]

  %67
  mi[fad sold fad]\mbreak
  mi[si si red]
  mi[fad sold fad]

  %70
  mi[si si red]
  mi[mi la si]
  mi,[mi la si]

  %73
  mi,[mi la si]
  mi,[mi la si]
  mi,4 r

  %76
  la r\mbreak
  dod, r
  la r

  %79
  si r
  mi8[fad sold fad]
  mi4 r

  %82
  r8 red'[red red,]
  R2
  r8 dod'[dod dod,]

  %85
  R2
  r8 si'[si si,]\mbreak
  mi[mi mi mi]

  %88
  mid[mid mid mid]
  mid?[mid mid mid]
  fad[fad fad fad]

  %91
  la[la la la]
  si[si si si]
  sold[sold sold sold]

  %94
  la[la la la]
  fad[fad fad fad]\mbreak
  sold[sold sold sold]

  %97
  mid[mid mid mid]
  fad[fad fad fad]
  fad2~

  %100
  fad~
  fad8 [la sold fad]
  fad r dod r

  %103
  fad r fad r\mbreak
  si, r dod r
  fad, r fad' r

  %106
  fad  r dod r
  fad r fad r
  si, r dod r

  %109
  fad[sold la sold]
  fad[dod dod mid]
  fad[sold la sold]

  %112
  fad[dod dod mid]
  fad[sold la sold]
  fad[dod dod mid]\mbreak

  %115
  fad[re dod si]
  lad4. lad8
  si[dod red dod]

  %118
  sid4. sid8
  dod[dod' re si]
  mid,4. dod8

  %121
  fad[fad,si dod]
  fad,4 fad'
  sold mid

  %124
  fad la\mbreak
  sold4 sid,
  dod mi

  %127
  fad fad,
  sold' sid,
  dod8[red mi dod]

  %130
  fad4 sold
  lad sid\mbreak
  dod r

  %133
  R2
  fad,8[fad fad fad,]
  fad'[fad fad fad,]

  %136
  R2
  mi'8[mi mi mi,]
  R2

  %139
  fad'8[fad fad fad,]
  sold4 r
  R2

  %142
  dod'8[red mi red]
  dod[sold sold sid]
  dod[red mi red]

  %145
  dod[sold sold sid]
  dod[red mi red]
  dod[sold sold sold,]

  %148
  dod4 r\mbreak
  la'8[si dod si]
  la[mi mi sold]

  %151
  la[si dod si]
  la[mi mi sold]
  la[si dod si]

  %154
  la[mi mi mi,]
  la[si dod si]
  la[si dod la]

  %157
  mi'[fad sold fad]
  mi[fad sold mi]
  la[si dod la]\mbreak

  %160
  sold r fad r
  mi r re r
  la[la' la, la']

  %163
  la,4 r
  sold r
  la r

  %166
  si r
  dod8[la' dod la]
  si[sold mi si']\mbreak

  %169
  la[si dod la]
  si[mi, sold si]
  la[si dod si]

  %172
  la[si dod si]
  la[si dod la]
  fad[mi fad re]

  %175
  si'[dod red dod]
  si[dod red si]
  sold fad mi4\mbreak

  %178
  R2*15
  la8 la, mi'[mi,]  %ripresa
  la' la, mi'[mi,]

  %195
  la' la, mi'[mi,]
  la' la, mi'[mi,]
  la [si dod si]

  %198
  lad4. lad8
  si[dod red dod]
  sid4. sid8

  %201
  dod[dod' re si!]
  mid,4. dod8\mbreak
  fad[fad si, si]

  %204
  mi[mi la, la]
  re[re sold, sold]
  dod[dod fad, fad]

  %207
  si[si mi, mi]
  la4 r
  la'8[si dod si]

  %210
  la[mi mi sold]
  la[si dod si]\mbreak
  la[mi mi sold]

  %213
  la[si dod si]
  la[mi mi mi,]
  la4\fermata r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \time 2/4
  \key la\major
  \tempo 2 = 57
  s2*215
  \bar"|."

}


IIIvlI = {
  \global
  %\notypeset
  <<\IIIvlIn \forma>>

}

IIIvlII = {
  \global
  <<\IIIvlIIn \forma>>

}

IIIvlIII = {
  \global
  <<\IIIvlIIIn \forma>>

}

IIIvla = {
  \global
  \clef alto
  <<\IIIvlan \forma>>

}

IIIbc = {
  \global
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

   systems-per-page = #4
   print-first-page-number = ##t
   first-page-number = #2

}

\markup \huge {[1.] All[egr]o molto molto}

\score {
   {

      \new ChoirStaff <<

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""principale]"}
            \IvlI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
            \IvlII
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
            \IvlIII
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
            \Ivla
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \Ibc

         >>
      >>
   }

   \layout {

      indent = 1.5\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup \huge {[2.] Largo - Tutti gli Istromenti pizzicati}

\score {
   {

      \new ChoirStaff <<

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"pizzicato strings"
            \IIvlII
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"pizzicato strings"
            \IIvlIII
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"pizzicato strings"
            \IIvla
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"pizzicato strings"
            \IIbc

         >>
      >>
   }

   \layout {

      indent = 0.5\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup \huge {[3.] All[egr]o}

\score {
   {

      \new ChoirStaff <<

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlIII
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \IIIvla
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \IIIbc

         >>
      >>
   }

   \layout {

      indent = 0.5\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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




