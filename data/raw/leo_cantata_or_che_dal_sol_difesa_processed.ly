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

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

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



IvlIn = \relative do'' {

    si16 si8 sold'32(mi) si16 si8 sold'32(si,) \grace  {la16[si]} dod8 si la4\f~
    la16 la8 fad'32\p(red) la16 la8 fad'32(la,) la8 sold mi'4\f~
    mi16 mi8 dod'32\p (lad) mi16 mi8 dod'32 (mi,) mi8(red) r4

    %4
    si'1\p~
    si16 sold mi si mi, (sold si re!) dod8 la mi16 (sold si re)\mbreak
    dod8 la mi16 (sold si re) dod\pf (mi si mi) la, (fad' sold) sold,

    %7
    sold8\f  fad fad16\p (la) la (red) red\pf (fad) fad (la) la (fad red la)
    sold si'\f (sold8) r16 sold (mi8) r16 mi dod la fad4
    r16 si'\p (sol8) r16 sol (mi8) r16 mi (do la) fad4

   %10
   \tuplet 6/4 { sold!16(si mi^\f dod! si la) } \senza \tuplet 3/4 { sold32(fad mi)} fad8 mi si mi4
   si'8 sold'\p sold sold\mbreak la sold fad4\pf~
   fad8 red\p \once\stemUp si,[\once\stemDown fad''] fad mi mi4\pf~

   %13
   mi8 red\p r8 fad fad mi16. (fad32) sold4
   r8 sold sold sold fad fad fad fad\mbreak
   sold sold sold sold fad4 fad~

   %16
   fad fad2 fad,16(lad dod mi)
   red8 red si16(red fad la) sold8 sold sold sold
   red dod16. (fad32) lad8 dod,red dod16. (fad32) lad8 lad,

   %19
   fad16\pf(lad) lad(dod) dod(mi) mi(sold)\mbreak sold8 fad4 mi8\p
   red fad sold mi red red dod dod
   si4 r mi,16(sold si mi) red8 si

   %22
   mi,16(sold si mi) red8 red mi\pf sold [fad sold]
   red fad, dod'4\prall si r
   si'2\p~si16 sold (mi si) mi, (sold si re)\mbreak

   %25
   dod (mi si mi) la, (fad' sold) sold, sold8 fad r4
   si8\p si sold'[sold] la sold fad4~
   fad8 red fad,[fad'] fad8 mi16. fad32 sold4

   %28
   mi2~\mbreak mi8 mi4 mid8
   fad2~fad8 fad4 fadd?8
   sold2~sold8 sold la la~

   %31
   la la sold sold la mi mi mi
   fad fad sold sold mi fad fad fad\mbreak
   mi si mi4~mi8 mi fad mi

   %34
   mi red r fad, fad16 (la) la (red) red (fad) fad (la)
   la8 sold si4\pf la\p dod\pf
   si si,16(red fad la) sold8 mi mi4~

   %37
   mi8 mi red red\mbreak mi si mi,16(sold si re)
   dod8 la mi16 (sold si re) dod8 si mi4~
   mi8 mi, mi'[mi] red4 si'8 si,

   %40
   la! red mi[sold,] sold fad red'[mi]
   mi mi, mi mi'\mbreak red fad, r4
   mi16 (sold si mi) red8 red mi4 si'

   %43
   la dod si8 red, r la
   la16 (red) red (fad) fad (la) la (fad) sold (si) sold8 r16 sold (mi8)
   r16 mi dod la sold8 fad r16 si'\p (sol8) r16 sol (mi8)\mbreak

   %46
   r16 mi (do la) sol8 fad sold sold' [(fad red)]
   mi sold,,\pf la lad si2
   mi16 sold'8\f si,16 si sold'8 si,16 dod8 si la'4~

   %49
   la16 fad! fad red la red fad la, sold (mi' dod la) sold32[(fad mi16)] fad8
   mi si mi4 r8 sold'4\p fad8\mbreak
   mi8 red red4 r8 red4 fad8~

   %52
   fad mi16. fad32 sold4 r8 sold sold sold
   dod, dod fad[la] si red, fad[fad]
   mi sold r si r re,! r si'\mbreak

   %55
   la dod, r la' r mi r mi
   mi red red4 r8 red red fad~
   fad mi sold[sold] la la sold[la]

   %58
   mi mi red red mi16 (sold) mi8~mi16 mi dod8~
   dod8 dod sold' dod,\mbreak sold2
   dod,4 r

}

IvlIIn = \relative do'' {

   sold16 sold8 mi'32(si) sold16 sold8 mi'32(sold,) \grace {fad16[sold]} la8 sold fad4\f~
   fad16 fad8 red'32\p(la) fad16 fad8 red'32(fad,) fad8 mi sold4\f~
   sold16 sold8 mi'32\p (dod) sold16 sold8 mi'32 (sold,) sold8 fad r4

   %4
   mi16(sold si mi) red8(si) mi,16(sold si mi) red8 red
   mi4 r mi2~\mbreak
   mi~mi8 mi r16 red (mi) mi,

   %7
   mi8 red red16\p (fad) fad (la) la\pf (red) red (fad) fad (red la fad)
   \once\stemUp mi sold'\f (mi8) r16 mi (sold,8) r16 dod mi,8 mi red
   r16 sol'\p (mi8) r16 si (sol8) r16 do mi,4 red8

   %10
   mi mi4 red8 mi si sold!4
   sold'8 si\p si si\mbreak dod8 si la4\pf~
   la8 fad\p red16 (fad la8) la sold sold4\pf

   %13
   fad8 fad\p r la la sold16. (la32) si4
   r8 dod dod dod lad si si si\mbreak
   si sid (dod si) lad4 dod,16 (fad lad dod)

   %16
   si8 si red,16 (fad si red) dod8 dod fad4~
   fad8 fad4 si,8~si sid dod si
   si lad dod[lad] si lad dod4

   %19
   r8 fad,16\pf(lad) lad(dod) dod(mi)\mbreak mi8 dod[si (dod)]
   fad, si si si si si lad lad
   si fad si,16(red fad la!) sold8 mi si16(red fad la)

   %22
   sold8 mi si16 (red fad la) sold8\pf si [si si]
   si4 lad si8 fad r red
   mi16 (sold si mi) \grace mi8 red4 mi8 sold, si sold\mbreak

   %25
   mi mi' r16 red (mi) mi, mi8 red r4
   sold8\p sold dod[si] dod si la4~
   la8 fad red16 fad la8 la sold16. la32 si4

   %28
   mi,16 (sold) sold (si) si re! re8~\mbreak re dod dod dod
   fad,16 (lad) lad (dod) dod mi mi8 mi red red red
   sold,16 (sid) sid (red) red fad fad8 mi mi mi fad~

   %31
   fad fad mi mi mi dod dod dod
   red red mi mi dod red si4~\mbreak
   si8 sold sold si dod dod la sold

   %34
   sold fad r red red16 (fad) fad (la) la (red) red (fad)
   fad8 mi re!4\pf dod\p mi\pf
   red r8 red, mi si' dod[la]

   %37
   sold sold fad fad\mbreak sold4 r8 sold,
   la16 (dod mi la) sold8 (mi) la,16 la'( sold la) si8 si~
   si si lad[lad] si4 sold'8 sold,

   %40
   fad (la!) sold[mi] mi red fad [(sold)]
   sold sold sold lad \mbreak si red, si16 (red fad la)
   sold8 mi si16 (red fad la) sold8 si re!4

   %43
   dod mi red8 fad, r fad
   fad16 (la) la (red) red (fad) fad (red) mi (sold) mi8 r16 mi (sold,8)
   r16 dod mi,4 red8 r16 sol'?\p (mi8) r16 mi (sol,8)\mbreak %% fine p. 6

   %46
   r16 mi mi4 red8 mi si r fad'
   sold sold,\pf la lad si2
   mi16 si'8\f sold16 sold mi'8 sold,16 la8 sold fad'4~

   %49
   fad16 red red la fad8 red mi mi4 red8
   mi si mi4 r8 dod'\p dod dod\mbreak
   dod8 sid sid4 r8 sid sold red'~

   %52
   red? dod16. red32 mi4 r8 dod dod dod
   la la la [mi'] fad, fad si,[la']
   sold si r sold' r si, r re!\mbreak

   %55
   dod la r dod r dod r dod
   dod sid sid4 r8 sid sold red'~
   red dod dod4~dod8 sid dod4~

   %58
   dod8 dod sid sid dod16 (mi) dod8~ dod16 dod mi,8
   la la dod, la'\mbreak sold2
   dod,4 r

}


Ivlan = \relative do' {

   mi8 mi mi[mi] mi mi, r4
   red'8 si si[si] mi mi, r4
   dod'8 dod dod dod\mbreak si4 si16(red fad la)

   %4
   sold8(mi) si16(red fad la) sold8 mi si16 red fad la
   sold8 sold r sold, la16(dod mi la) sold8 mi\mbreak
   la,16(dod mi la) sold8 sold mi4 fad8 si,

   %7
   si si r si si4 r8 si
   si r mi r dod dod si[si]\mbreak
   r4 r8 sol'\p mi [r16 do] si8 si

   %10
   si dod! si[si] sold!4 r
   mi'8 re mi[mi] mi mi, r4\mbreak
   r4 r8 red' mi mi, r4

   %13
   dod'8 si r red mi si mi,4\mbreak
   r8 mi' mi mi, r2
   r dod'4 r

   %16
   red r\mbreak lad' r
   fad8 si, red [red] mi mi mi mid
   fad4 r8 fad\mbreak fad8 fad fad4

   %19
   r2 r8 lad, sold lad
   si4 r\mbreak r fad'
   fad r r2

   %22
   r4 r8 si, si4 r\mbreak
   r fad' fad8 red si16(red fad la)
   sold8 mi si16(red fad la) sold8 si r4

   %25
   r8 mi, fad si,\mbreak si si r4
   mi8\p mi mi[mi] mi mi, r4
   r r8 red' mi si mi,4\mbreak

   %28
   r r8 si'' si la r la,
   lad dod r dod' dod si r si,\mbreak
   sid4 r r8 dod dod la

   %31
   si si si si la4 r
   r8 si si4\mbreak r8 la si4
   r8 mi mi,4 r r8 dod'

   %34
   si si r4 si8 si r8 si\mbreak
   mi mi r mi mi4 r 8 fad
   fad4 r r r8 dod

   %37
   si si si si\mbreak  si4 r
   r2 r4 r8 sold'~
   sold dod, r dod\mbreak fad4 r8 si,

   %40
   si si si[(lad)] si4 r
   r r8 mi\mbreak fad4 r
   r2 r8 sold\pf sold4

   %43
   mi lad fad r\mbreak
   r8 si, red si mi8. si'16 sold8. mi16
   la,8 la si[si'] sol8. si16 mi,8. sol16\mbreak

   %46
   do,8 la si[si] r mi red si
   r sold (la lad) si2
   mi8 mi\f mi[mi]\mbreak mi mi~mi16 mi red dod

   %49
   red?8 red r si si dod si[si]
   si4 r r8 mi mi dod\mbreak
   sold' sold sold4 r2

   %52
   sold8 sold dod,4 r2\mbreak
   r8 fad dod4 r r8 fad
   si, r sold' r sold r sold r\mbreak

   %55
   dod, r la' r lad r lad r
   sold sold sold4 r2\mbreak
   sold8 sold r mi dod red mi [dod]

   %58
   mi mi sold[sold] sold8. sold16 sold8. sold16\mbreak
   fad8 fad[mi fad] sold2
   dod,4 r

}

Ivocen = \relative do'' {

    \autoBeamOff
    R1*10
    si8 sold16 fad32 [mi] mi'8 si\mbreak dod si la4~
    la8 red16. mi32 fad8 la, la sold mi'4~

    %13
    mi8 red16. dod32 si8 la la sold r mi
    \grace {dod'16[red]} mi8. red32 [(dod)] dod8 dod fad16[(lad,)] si4 fad'8\mbreak
    mi8. red16 dod8 si lad16.[(dod32) fad,8] r dod'16.[ (lad32)]

    %16
    si16.[(red32) fad,8] r red'16.[(si32)] dod16.[(mi32) fad,8] r mi'16.[dod32]
    red16.[fad32] si,4 la!8\prall sold[sid (dod si)]
    si[lad] r dod \grace {si16[dod]} red8 dod r fad,

    %19
    fad16[(lad)] lad[(dod)] dod[(mi)] mi[(sold)]\mbreak sold8 fad4 mi8
    red8.[dod32 (si) sold'8] sold, fad4 dod'\prall
    si1~

    %22
    si4 r r8 sold' fad16[red] dod[si]
    fad8 dod'4. si4 r
    R1\mbreak

    %25
    r2 r4 si~
    si8 sold16 fad32 [(mi)] mi'8 si dod si la4~
    la8 red16. mi32 fad8 la, la sold r si

    %28
    mi,16[(sold)] sold[(si)] si[(re!)] re8\mbreak re dod r dod
    fad,16[(lad)] lad[(dod)] dod[(mi)] mi8 mi red r red
    sold,16[(sid)] sid[(red)] red[(fad)] fad8 mi2

    %31
    re! dod8 dod4 mi16.[dod32]
    si8 si4 mi16.[(dod32)] la8 la4 fad'16.[(la,32)]\mbreak
    sold8[si] mi4~mi8[\grace re dod (la sold)]

    %34
    sold[fad] r fad fad16[(la)] la[(red)] red[(fad)] fad[(la,)]
    la8 sold re'!4 dod16[si] la8 mi'4
    red16[dod] si8 r4 r8 mi mi16[(dod)] dod[(la)]

    %37
    sold32[fad mi8.] fad4\mbreak mi2~
    mi~mi4 r8 si'
    si8. lad32[(si)] dod8 mi red16.[dod32] si8 r si

    %40
    la!8. sold32[(fad)] sold8 sold sold fad r si
    mi8. red32[(dod)] si8 lad\mbreak si2~
    si~si4 re!

    %43
    dod16[si] la8 mi'4 red16[dod] si8 r la
    la16[(red)] red[(fad)] fad8 la, \grace la sold4 r
    r8 dod16[la] sold32[(fad mi16)] fad8 mi4 r\mbreak

    %46
    r8 do'16[la] sol8 fad sold4 si
    mi4. mi,8 mi8.[fad16] fad4
    mi r r2

    %49
    R1
    r2 sold8 dod,16 dod dod'8 dod\mbreak
    dod sid r fad fad16[(sid)] sid[(red)] red8 fad,

    %52
    fad mi r sold dod16.[(sold32)] mi'16.[(dod32)] sold'8 sold,
    la16[sold] la8  r fad si16.[(fad32)] red'16.[(si32)] fad'8 la,
    sold-.[si-.] r re! r16 si sold'4 si,8\mbreak

    %55
    la-. [dod-.] r mi-. r16 dod mi4 dod8
    \grace dod sid4 r8 sold fad16[(sid)] sid[(red)] red8 fad,
    fad mi r dod' la[fad'16 (red) sold8] dod,

    %58
    sold8 red'4.\prall dod4 r
    r8 dod sold' dod,\mbreak sold4 red'
    dod r

}

Itesto = \lyricmode {

   Or ch'è dal sol difesa _ _ que -- sta_o -- do -- ro -- sa_er -- betta _

    que -- sta_o -- do -- ro -- sa_er -- betta _

   An -- gelica _ _ diletta _ _  deh vieni_a _ ripo - sar - - - - - - - - - -

   deh vieni _ An -- gelica _ _ diletta _ _ deh vie -- ni_a

   ri -- po -- sar deh vieni_a _ ri -- po -- sar.

   Or ch'è dal sol difesa _ _ que -- sta_o -- do -- ro -- sa_er -- betta _

   An -- gelica _ _ diletta _ _  An -- gelica _ _ diletta _ _

   deh vieni_a _ ripo - sar -  - - - - - - - - - - - - An -- gelica _ _

   di --  letta _ deh vieni _ deh vieni _ deh vieni_a _

   ri -- po -- sar An -- ge -- li -- ca di -- letta _ su questa _

   ver __ de_er -- betta _ deh vieni_a _ ri -- po -- sar

   deh vieni _ deh vieni _ deh vieni_a _ riposar _ _ a ripo - sar

   a ri -- po -- sar - - a ri -- po -- sar.

   Forse _ così _ di -- cea _ il pasto - rello_a - mante _ le fuggiti - - ve

   piante _ veggendo _ _ vacil - lar - - - - - - - - - - le fuggi - tive _

   piante _ veggen - do vacil - lar veggen - do vacil - lar.

}

Ibcn = \relative do {

    r2 r8 mi'\pf~mi16 mi (red dod)
    si8 si, r4 r8 mi'~mi16 red (dod si)
    lad8 lad,\p lad lad si si r4

    %4
    r2 r4 r8 si'\p
    mi, mi r4 r2\mbreak
    r4 r8 mi la(sold) fad[(mi)]

    %7
    si si r4 r8 si si si
    sold'8. si16\f (sold8.) mi16 la,8 la si si'
    sol8. si16 mi,8. sol16 do,8 la si [si]

    %10
    sold! la si[si] mi,4 r
    r2 \clef tenor \key la\major r8 mi''_\markup\italic"viol[oncello]"~mi16 mi red dod
    si8 si, r4 r8 mi'~mi16 red (dod si)

    %13
    la8 si r si mi[mi,] mi4
    r r8 mi'~mi8 red red red\mbreak
    mi mi, mi mi fad4 \clef bass \key la\major fad8 mi

    %16
    red\p red si[si] fad fad lad[lad]
    si si red red mi mi mi mid
    fad fad, fad4 r8 fad' (fad,4)

    %19
    r2\mbreak r8 lad' sold (lad)
    si si mi, mi fad fad fad fad
    si,4 r r2

    %22
    r4 r8 si mi\pf mi [red mi]
    fad fad, fad fad si4 r
    r r8 si mi,4 r8 mi'\mbreak

    %25
    la sold fad[mi] si' si,~si16 la'\p sold fad
    mi4 r \clef tenor \key la\major r8 mi'~mi16 mi (red dod)
    si8 si, r si' mi mi, mi4

    %28
    \clef bass \key la\major r8 mi sold mi\mbreak la la, la4
    r8 fad' lad fad si si, si4
    r8 sold sid sold dod4 r

    %31
    r2 r8 la la'4~
    la8 la sold4~ sold8 fad red[red]\mbreak
    mi4 r8 sold, la la4 lad8

    %34
    si si r4 r2
    r4 r16 mi (sold mi) la4 r16 fad (lad fad)
    si4 r r8 sold8 la la,

    %37
    si si si si\mbreak mi,4 r
    r2 r8 mi' sold mi
    dod dod dod[dod] si si r4

    %40
    r2 r8 si' la sold
    dod,2\mbreak si4 r
    r r8 si mi,4 r16 mi' (sold mi)

    %43
    la,4 r16 fad' (lad fad) si8 si, r4
    r8 si red si mi8.[si'16 sold8. mi16]
    la,8 la si[si'] sol8.[si16 mi,8. sol16]\mbreak

    %46
    do,8 la si[si] r mi red si
    r sold (la lad) si2
    mi8 mi\f mi mi mi mi'~mi16 mi red dod

    %49
    si8 si si,[si] mi la si si,
    mi4 r dod la'8[la]\mbreak
    sold sold, sold4 r8 sold (sid) sid

    %52
    dod dod dod4 r8 dod mi mi
    fad fad fad,[fad] red' si red[red]
    mi r mi r mid r mid r\mbreak

    %55
    fad r fad r fadd r fadd r
    sold sold, sold4 r8 sold (sid sold)
    dod dod mi[mi] fad fad mi [fad]

    %58
    sold sold sold sold dod8.[sold16 mi8. dod16]
    fad,8 fad' [mi fad]\mbreak sold2
    dod,8 r16_\fermata dod' si (la sold fad)

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key la\major
    \tempo 4 = 55
    s1*49
    s2 \bar "||" \break s2
    s1*9
    s2
    \bar "||"
    \mark\markup\smaller\center-column{"Da""Capo"}

}

IvlI = {
    \notypeset
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}

Ivoce = {
    \new Voice = "sol"
    <<\Ivocen \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}




IIvlIn = \relative do'' {

   R1*6
   re,16\pp[(mi re mi fad sol fad sol)] la8 la,~la16 si(la si)
   dod re dod re mi8 mi la,2~

   %9
   la16(fad') la8-. r16 la fad8-. r16 sol16[(fad sol fad sol fad sol)]
   fad?8 r r4 r8 fad16(sol) fad(sol fad sol)
   fad?4 r\mbreak r16 fad! la8 r16 la fad8~

   %12
   fad16 (sol fad sol la si la si) la4 r
   r2 sol,16\pp(la sol la) si do! si do\mbreak
   re8 re~re16 mi (re mi) fad(sol fad sol) la8 la

   %15
   re,2~re4 r\mbreak
   r2 mi'\p~
   mi1~\mbreak

   %18
   mi16 (dod) dod(la) la(mi) mi(dod) dod4 r
   R1
   r2 r4 fad'16(la re, fad)

   %21
   la,4 r r8 fad'16(si) fad4\mbreak
   r8 sold16(mi) si4 r8 sold'16(dod,) sold'4
   r8 la16(fad) dod4 la'2^\tenuto\pp ~

   %24
   la~la~
   la r8 sold16\p(mi) sold,4\mbreak
   r2 r8 fad'16\f(la) dod,(fad la, dod)

   %27
   la'4 r r red,\f\mbreak
   mi8 dod16[(si)] si[(la)] la(sold) <mi' si sold>4 r
   r2 r8 mi16\f(sold) si4\mbreak

   %30
   r2 r8 mi,16(la) dod4
   r8 re16(la) re,4 r8 re16(sol) si4\mbreak
   r mi,-. fad-. r

   %33
   R1*6

}


IIvlIIn = \relative do'' {

   R1*6
   r4 re,16 \pp mi re mi fad sol fad sol la8 la,
   la16 si la si dod(re dod re) mi(fad mi fad) sol8 fad16(mi) \mbreak

   %9
   fad16 re fad8 r16 fad la,8 r16 si[(la si la si la si)]
   la8 r r4 r8 la16(si) la(si la si)
   la4 r\mbreak r16 la fad'8 r16 fad la,8~

   %12
   la re16 mi fad(sol fad sol) fad4 r
   r2 r4 sol,16\pp(la sol la)\mbreak
   si (do! si do) re4~re16 mi(re mi) fad (sol fad sol)

   %15
   la si la si do! do si la si4 r\mbreak
   r2 si\p~
   si1\mbreak

   %18
   dod16(la) la(mi) mi(dod) dod(mi) mi4 r
   R1
   r2 r4 re'16(fad la, re)

   %21
   fad,4 r r8 si16 (fad) si4\mbreak
   r8 si(sol4) r8 dod dod4
   r8 fad16(dod) la4 dod2\pp\mbreak

   %24
   fad1~
   fad2 r8 mi16\p(dod) mi,4\mbreak
   r2 r8 dod'16\f(fad?) la,(dod) fad, (la)

   %27
   dod4 r r sid\f\mbreak
   dod?8 dod!16[(si)] si[(la)] la(sold) <mi' si sold>4 r
   r2 r8 si16\f(mi) mi,4\mbreak

   %30
   r2 r8 dod' mi4
   r8 la,16 re la'4 r8 si,16 re sol4\mbreak
   r dod,-.  re-. r

   %33
   R1*6

}


IIvlan = \relative do' {

   R1*6
   r2 re16\pp (mi re mi) fad(sol fad sol)

   la8 la,~la16 si la si dod(re dod re) mi8 re16 (dod)\mbreak
   re8 [r16 la] fad8 [r16 la] re,2~

   %10
   re4 r re'2~
   re4 r re8 [r16 la] fad8 [r16 la]
   re,2~re4 r\mbreak

   %13
   sol4 r r2
   sol16(la sol la) si (do! si do) re8 re~re16 mi(re mi)
   fad(sol fad sol) la(re, mi fad) sol4 r\mbreak

   %16
   r2 si,\p~
   si1\mbreak
   la8 la la la la4 r

   %19
   R1
   r2 r4 la8 la
   re4 r r8 red red4 \mbreak

   %22
   r8 mi mi4 r8 mid mid4
   r8 dod fad4 fad2\mbreak
   red sid~

   %25
   sid dod\mbreak
   r r8 fad\f fad fad-.
   fad?4 r r sold\mbreak

   %28
   sold?8\noBeam dod16(si) si[(la)] la(sold!) sold4 r
   r2 r8 si, si4\mbreak
   r2 r8 la' la4

   %31
   r8 la, la4 r8 sol' re4\mbreak
   r4 la' la r
   R1*6

}

IIvocen = \relative do'' {

   \autoBeamOff

   r4 la8 mi r4 dod'8 dod16 re
   si8 si r16 si sold si si8 mi, r si'
   re4 re8 mi\mbreak dod dod r mi

   %4
   la,8. la16 la8 si sol sol r16 sol sol la
   fad8 fad r la\mbreak re8. re16 re8 dod
   la la r4 r2\fermata

   %7
   R1*3
   re8 la16 la la8 la\prall fad fad r4
   r8 la la re\mbreak re la r4

   %12
   r2 la8 re, do'!  si
   si si r4 r2\mbreak
   R1*2

   %16
   si8 si16 si si8 mi mi si r16 si sold si
   si8 mi, r si' re re re dod\mbreak
   dod? dod r4 r8 la  la si

   %19
   dod dod r mi dod dod si dod \mbreak
   la la la sol16 la fad8 fad r4
   r8 la la re si4 r8 si16 si\mbreak

   %22
   sold8 sold r mi' dod dod r16 dod si dod
   la8 la r fad16 fad dod'8. dod16  dod8 red\mbreak
   sid sid r16 sid sid red red8 fad, r fad

   %25
   la la la sold sold sold r sold\mbreak
   dod dod si dod la la r4
   r8 dod sid dod dod sold r4\mbreak

   %28
   r2 si8 si16 si mi8 si
   sold sold r16 sold si la si8 si r si\mbreak
   re re re mi dod dod r16 dod mi la,

   %31
   re4 r16 re do! re si4 r8 re\mbreak
   re8 la r4 r2
   r4 r8 fad si8. si16 si8 lad

   %34
   si si r4\mbreak si8 si16 si red8 fad
   fad? si, r16 si fad sold la8 la la16 la la sold\mbreak
   sold?8 sold r sold16 sold si4 si8 si

   %37
   re!8 re r re re mi, mi re'\mbreak
   dod8. dod16 red8 mi mi si r4\fermata

}

IItesto = \lyricmode {

   Siedi, _ siedi _ ben mio _ alla _ fresc' ombra _  di quest' arbo - scello, _

   e_a -- scol -- ta_il mormo - rio _ del garru - letto  _ in -- na -- mo -- rato_au -

   gello. _

   Odi _ del bel ru -- scello _ quell' inter - rotto _

   mormorar _ _ fra' sassi _  come _ miran - do stassi _

   ne' suoi cristalli _ _ il leggia - dretto _ fiore _

   e qual di -- verso, _ e qual soave _  o -- dore _

   spira _ la Rosa, _ il Gelso - min, la Vi -- o -- la,

   il Croco, _ ed il Nar -- ciso, _ allor _  che so -- a -- ve -- mente _

   cia -- scuno_in _ seno _ il Zefiret - - to_ac -- coglie _

   mo -- vendo _ le dipinte _ _ e varie  _ foglie _

   tutti _ con lin -- gue_i -- gnote _ spiegando _ _ vanno _

   i pro -- pri_af -- fetti_in - tanto _

   chi con l'odor, _ chi_al mormorar, _ _ chi_al canto. _

   Or che qui salvi_o _ bella _ fuor de le_ar -- _ mate genti _

   pietosa - - mente _ ci con -- dusse_A - more, _

   i passati _ _ tor -- menti _ ramme - moriam _  fra noi del nostro _ core. _

}

IIbcn = \relative do {

   la1
   sold~
   sold2 la~

   %4
   la dod
   re~re
   mi4 la, r2\fermata_\markup\italic\right-align"Attacca sub[it]o con gl'istrom[en]ti"

   %7
   r2 re16(mi re mi) fad(sol fad sol)
   la8 la,~la16 si la si dod(re dod re) mi8 re16 (dod)\mbreak
   re8 [r16 la] fad8 [r16 la] re,2~

   %10
   re4 r re'2~
   re4 r re8 [r16 la] fad8 [r16 la]
   re,2~re4 r\mbreak

   %13
   sol4 r r2
   sol16(la sol la) si (do! si do) re8 re~re16 mi(re mi)
   fad(sol fad sol) la(re, mi fad) sol4 r\mbreak

   %16
   r2 sold,~
   sold?1\mbreak
   la8 la la la la4 r

   %19
   R1\mbreak
   dod4 r re re8 re
   re4 r red r\mbreak

   %22
   mi r mid r
   fad r fad2\mbreak
   red sid~

   %25
   sid dod\mbreak
   r r8 fad\f fad fad-.
   fad?4 r r sold\mbreak

   %28
   dod,8 dod'?16[si] si [la] la(sold) sold4 r
   r2 r8 sold sold4 %%% fine pag. 20
   r2 r8 la sol4

   %31
   r8 fad fad4 r8 sol sol,4\mbreak
   r la'4 re, r
   red1~

   %34
   red?~
   red?\mbreak
   mi~

   %37
   mi2 sold,\mbreak
   la si4 mi\fermata

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*6
   \bar "||"
   s1*32
   \bar "||"

}

IIvlI = {
   \notypeset
   <<\IIvlIn \forma>>

}

IIvlII = {
   <<\IIvlIIn \forma>>

}

IIvla = {
   \clef alto
   <<\IIvlan \forma>>

}

IIvoce = {
   \new Voice = "siedi"
   <<\IIvocen \forma>>
}



IIbc = {
   \clef bass
   <<\IIbcn \forma \IIbfn>>
   \typeset
}




IIIvlIn = \relative do'' {

   mi,4
   mi2~mi4 la8 dod
   dod4 si r mi,
   mi2. si'8 re

   %4
   re4 dod r la
   <<la2.\\la>> mi'8 la\mbreak
   \grace sol8 fad4 mi2 re8 dod

   %7
   \grace mi re4 dod8 si dod4 dod
   dod si r mi
   \grace {mi16[fad]} sol!4 fad2 dod8(mi)

   %10
   re4 re,2 re'4\mbreak
   \grace {re16[mi]} fad4\p mi2 si8(re)
   dod4 mi,2 dod'4\f

   %13
   si dod8 si fad'4 si,
   \grace la8 sold2 r4 mi'\p
   \grace mi8 red2 r4 re\mbreak

   %16
   \grace re8 dod2 r4 do
   \grace do8 si2 mi,8\f(sold si re)
   dod4 la'4 r la,8(dod)

   %19
   si4 si' r si,8(re)
   dod4 la' r re,,8(la')\mbreak
   fad4 fad'8 (re) \grace dod8 si2

   %22
   la4 la' r la,8\pp(do)
   si4 si'-. r si,8(re)
   do4 la' r mi,8(la)

   %25
   fa4 re'8 si\grace la sold2\mbreak
   la4 la'\f r la,
   r8 fad'! (mi re mi dod! si la)

   %28
   la sold la si \grace dod si2
   la r4 mi\p
   mi2. la8(dod)\mbreak

   %31
   dod4 si r mi,
   mi2. si'8(re)
   re4 dod r la

   %34
   la2. mi'8(la)
   fad4 mi r2\fermata \mbreak
   mi2^\markup\italic"largo"(red)

   %37
   mi r4\fermata si^\markup\italic"all[egr]o"\p
   mi mi mi mi
   sol! fad2 mi4

   %40
   \grace mi8 re1\mbreak
   dod2 r4 fad
   \grace fad8 mid2 r4 mi

   %43
   \grace mi8 red2 r4 re
   \grace re8 dod2 r4 si
   do red2 mi4~\mbreak

   %46
   mi fad2 sol4
   sol si, r lad
   r si-. r si-.

   %49
   r sol'-. r lad,-.
   si re re2\f ~
   re4 dod8 re si'4 re,

   %52
   dod dod dod2~
   dod4 re8 dod la'4 dod,
   si dod8 si fad'4 la,

   %55
   \grace la8 sold2 r\mbreak
   r4 si'2\p re,4
   dod si2 si4

   %58
   \grace re8 dod4 si8 la dod4 red
   mi2 si'8\f re,! (dod si)
   dod4 si r2\mbreak

   %61
   r4 si'2\p re,4
   dod si2 si4
   \grace re8 dod4 si8 la dod4 red

   %64
   mi2 sol8\f (mi la dod,)\mbreak
   si2 r4 si
   mi,2 mi'

   %67
   la, fad'~
   fad fad
   si, sold'~

   %70
   sold? sold\mbreak
   dod, la'~
   la sold

   %73
   la4 la2 la4
   \grace la8 sold2 r4 mi
   \grace mi8 red2 r4 re\mbreak

   %76
   \grace re8 dod2 r4 do
   \grace do?8 si2 r4 la
   sib-. re-. r dod

   %79
   re  fa r mi
   fa re r sold\mbreak
   la-. la-. r la,

   %82
   r fa'-. r sold,-.
   la la'2 la4
   la2 do,

   %85
   si4 sold'2 sold4\mbreak
   la2 do,
   si r\fermata

   %88
   r4 la fa'2~
   fa4 mi mi red
   red?1

   %91
   mi4 re! re dod!\mbreak
   dod1
   re8 mi fa2 mi8 re

   %94
   \grace re8 do1
   si2 r4 mi
   \grace mi8 red2 r4 re

   %97
   \grace mi8 dod!2 r4 do\mbreak %% fine p.31
   si sold'2 la4
   sib, dod!2 re4~

   %100
   re mi2 fa4~
   fa re \grace dod8 si2
   la4 la' r la,8 dod\mbreak

   %103
   si4 si' r si,8(re)
   dod4-. mi-. r mi,8 la
   fad4 fad'8 re \grace dod si2

   %106
   dod4 la' r la,-.\mbreak
   r fad' r si,
   r mi r la

   %109
   fad2 r4\fermata re,
   mi1
   la4 mi'2\f la8 dod,

   %112
   dod4 si r mi,\mbreak
   mi2~mi8 re' si' re,
   re4 dod~dod8 dod mi la

   %115
   fad la si, re \grace dod si2
   dod4 mi~mi8 la, dod mi
   fad la si, re \grace dod si2

   %118
   la2. r4
   r2 la'\p
   si1~

   %121
   si2 la
   sold1~
   sold4 fad fad2

   %124
   mid4 sold dod, si
   si2 fad'~\mbreak
   fad4 mi! (re dod)

   %127
   \grace dod8 sid1
   dod4 red mi2~
   mi4 re! dod si

   %130
   \grace si8 lad1
   si4 dod re2~\mbreak
   re4 re dod si'

   %133
   la1
   sold2 r
   r4 red2 fad4

   %136
   mi sold r dod,
   red fad-. r red-.
   dod2 r\fermata

   %139
   sold' r4 fad,
   sold1
   dod,2 r4

}


IIIvlIIn = \relative do'' {

   mi,4
   mi2. mi8 la
   la4 sold r mi
   mi2. sold8(si)

   %4
   si4 la r la
   <<la2.\\la>> mi'8 la\mbreak
   \grace sol8 fad4 mi2 re8 dod

   %7
   re si la sold la4 la
   la sold r mi'
   \grace {mi16[fad]} sol!4 fad2 dod8(mi)

   %10
   re4 re,2 re'4\mbreak
   \grace {re16[mi]} fad4\p mi2 si8(re)
   dod4 mi,2 dod'4\f

   %13
   si dod8 si fad'4 si,
   \grace la8 sold2 r4 mi'\p
   \grace mi8 red2 r4 re\mbreak

   %16
   \grace re8 dod2 r4 do
   \grace do8 si2 mi,8\f(sold si re)
   dod4 la'4 r la,8(dod)

   %19
   si4 si' r si,8(re)
   dod4 la' r re,,8(la')\mbreak
   fad4 fad'8 (re) \grace dod8 si2

   %22
   la4 la' r la,8\pp(do)
   si4 si'-. r si,8(re)
   do4 la' r mi,8(la)

   %25
   fa4 re'8 si\grace la sold2\mbreak
   la4 la'\f r la,
   r8 fad'! (mi re mi dod! si la)

   %28
   la sold la si \grace dod si2
   la r
   r4 dod,_\markup {[\musicglyph #"p"]} la'2~\mbreak

   %31
   la4 sold r2
   r4 sold, si mi
   mi mi r la

   %34
   la2. dod4
   re dod r2\fermata\mbreak
   la1

   %37
   sold2 r4\fermata si
   mi si lad si
   mi dod dod dod

   %40
   dod si si si\mbreak
   lad2 r
   r4 si(dod2)

   %43
   r4 si si2
   r4 lad2(si4)
   do red2 mi4~\mbreak

   %46
   mi fad2 sol4
   sol sol r dod,
   r mi-. r fad-.

   %49
   r mi-. r dod-.
   si re re2\f~\mbreak
   re4 dod8 re si'4 re,

   %52
   dod dod dod2~
   dod4 re8 dod la'4 dod,
   si dod8 si fad'4 la,

   %55
   \grace la8 sold2 r\mbreak
   r4 sold2\p sold4
   la sold? mi2~

   %58
   mi4 mi la, la'
   sold2 mi8 si'\f la sold
   la4 sold? r2\mbreak

   %61
   r4 sold2\p sold4
   la sold? mi2~
   mi4 mi la, la'

   %64
   sold2 si8 (mi\f dod la)\mbreak
   sold2 r4 sold
   la2. sol!4

   %67
   fad(sold la lad)
   si2. la!4
   sold((la si  sid)

   %70
   dod2. si!4\mbreak
   la2. si8 dod
   \grace dod8 re2. dod8 si

   %73
   \grace re dod1
   si2 r
   r4 la(si2)\mbreak

   %76
   r4 la~la2
   r4 sold sold la
   sib-. re-. r dod

   %79
   re  fa r mi
   fa re r sold\mbreak
   la-. do,-. r do

   %82
   r re r si
   do do2 do4
   do?2 la'

   %85
   sold4 si,2 si4\mbreak
   do?2 la'
   sold r\fermata

   %88
   r r4 do,
   la1
   fad

   %91
   si2 sol\mbreak
   mi1
   la4 re si si

   %94
   mi, la la2
   sold4 si, mi2
   r4 la si2

   %97
   r4 la la2\mbreak
   sold4 si2 mi,4
   fa2 sol

   %100
   la la'
   la,4 la \grace la8 sold2
   la4 la' r la,8 dod\mbreak

   %103
   si4 si' r si,8(re)
   dod4-. mi-. r mi,8 la
   fad4 re'8 si \grace la sold2

   %103
   la4 dod r mi\mbreak
   r la, r sold
   r la r dod

   %106
   re2 r4\fermata re,
   mi1
   la4 dod2\f dod8 la

   %109
   la4 sold r mi\mbreak
   mi2~mi8 re' si' re,
   re4 dod~dod8 dod mi la

   %115
   fad la si, re \grace dod si2
   dod4 mi~mi8 la, dod mi
   fad la si, re \grace dod si2

   %118
   la2. r4
   r2 dod2\p
   re1

   %121
   dod1
   si2 dod4. si8
   la1

   %124
   sold2 sold
   dod, dod~
   dod fad

   %127
   red1
   mi
   si2 mi

   %130
   dod1
   fad4 lad si2~\mbreak
   si sold'

   %133
   fad fad,
   red r
   r4 sid' sold2~

   %136
   sold4 mi' r sold,
   la red r sid
   sold2 r\fermata\mbreak

   %139
   dod2 r4 fad,
   sold1
   dod,2 r4

}


IIIvlan = \relative do' {

   r4
   r dod la dod
   dod mi mi2
   r4 sold, si mi

   %4
   mi mi mi2
   r4 dod mi dod\mbreak
   la2 la4 mi'

   %7
   fad re mi fad
   mi mi mi2
   r4 dod dod fad

   %10
   si, fad' fad2\mbreak
   r4 si, si mi
   mi dod la mi'\f

   %13
   fad fad si, fad'
   si,2 r
   r4 la'\p si2\mbreak

   %16
   r4 la la2
   sold si4\f sold
   la dod, mi mi

   %19
   sold sold mi sold
   la la, la'2~\mbreak
   la sold

   %22
   la4 do, mi\pp mi
   sold sold mi sold
   la do, la'2~

   %25
   la4 fa8 re \grace dod si2\mbreak
   mi dod!_\markup {[\musicglyph #"f"]}
   la4 la' la2~

   %28
   la sold
   la r
   r r4 mi\p\mbreak

   %31
   mi mi, mi2
   r r4 sold'
   la la, la2

   %34
   r4 dod mi la
   la la r2\fermata\mbreak
   r fad

   %37
   si, r\fermata
   sol'!1~
   sol4 lad, lad sol'

   %40
   fad fad sold sold\mbreak
   dod,2 r
   r4 sold lad2

   %43
   r4 si mid2
   r4 fad fad fad
   sol2 la\mbreak

   %46
   si si
   si4 r sol r
   si, r re r

   %49
   si r fad' r
   fad fad fad fad\mbreak
   si si mi, mi

   %52
   mi mi mi dod
   mi2 r4 la
   fad2 r4 fad

   %55
   si,2 r\mbreak
   r4 mi mi mi
   mi2 r

   %58
   r r4 fad
   si,2 r4 mi
   mi mi r2\mbreak

   %61
   r4 mi mi mi
   mi2 r
   r r4 fad

   %64
   si,2 r4 mi\mbreak
   mi2 r4 re
   dod1

   %67
   re(
   red)
   mi(

   %70
   mid)\mbreak
   fad2 dod
   si mi

   %73
   mi4 mi red red
   mi mi, mi2
   r4 fad' sold2\mbreak

   %76
   r4 la (red,2)
   mi2 r
   r4 fa sol!2

   %79
   la-. la-.
   la-. re,-.\mbreak
   mi do

   %82
   fa mi~
   mi4 mi fa mi
   red1

   %85
   mi4 mi fa mi\mbreak
   red1
   mi2 r_\fermata

   %88
   la, r4 la'
   do1~
   do?4 si si la

   %91
   sol2 sib~\mbreak
   sib?4 la2 sol4
   fa2 sold

   %94
   la red,
   mi r
   r4 fad! (sold2)

   %97
   r4 la red,2\mbreak
   r4 mi(re! do)
   re2 mi

   %100
   fa do
   re mi
   r4 mi la, mi'\mbreak

   %103
   sold sold si sold
   la dod, mi dod
   re2 mi

   %106
   mi4 r mi r\mbreak
   re r si r
   mi r dod r

   %109
   la2 r4\fermata re
   mi1
   mi4\f mi mi mi

   %112
   mi mi mi,2\mbreak
   r4 sold' si sold
   la re, la'2

   %115
   la sold
   la la
   la sold

   %118
   la2. r4\mbreak
   r2 fad~
   fad4 fad mid fad

   %121
   sold2 fad~
   fad mid
   fad4 fad sid, sid

   %124
   dod2 mid
   fad2. sold4\mbreak
   la1~

   %127
   la4 la sold fad
   mi2. fad4
   sol!1~

   %130
   sol4 sol fad mi
   re dod si fad'\mbreak
   mid1

   %133
   fad4 mi! red dod
   sid1
   r4 sold sid sold

   %136
   dod r mi r
   fad r sold? r
   mi2 r\fermata\mbreak

   %139
   mi2 r4 fad
   sold1
   dod,2 r4

}

IIIvocen = \relative do'' {

   \autoBeamOff

   r4
   R1*28
   r2 r4 mi,
   mi la la dod\mbreak

   %31
   dod si r mi,
   mi si' si re
   re dod r2

   %34
   R1
   r2 r4\fermata mi\mbreak
   mi4. la,8 la4. sold8

   %37
   si4 si r\fermata si
   mi mi mi mi
   sol! (fad2) mi4

   %40
   \grace mi8 re1\mbreak
   dod2 r4 fad
   \grace fad8 mid2 r4 mi

   %43
   \grace mi8 red2 r4 re
   \grace re8 dod2 r4 si
   do red2 mi4~\mbreak

   %46
   mi fad2 sol4
   sol2 lad,
   si-. si-.

   %49
   sol'-. lad,-.
   si r\mbreak
   R1*4

   %55
   r2 r4 si\mbreak
   mi, si' si re
   dod si r si

   %58
   dod si8 [la] dod4 red
   mi mi, r2
   r r4 mi\mbreak

   %61
   mi si' si re
   dod si r si
   \grace re8 dod4 si8 [la] dod4 red

   %64
   mi mi, r2\mbreak
   r4 mi' mi2~
   mi4 \grace re8 dod4 la sol

   %67
   fad2 fad'~
   fad4(red si la)
   sold2 sold'~

   %70
   sold4 mid dod si\mbreak
   la2. si8[dod]
   re2.\prallprall dod8 [si]

   %73
   \grace re dod1
   si2 r4 mi
   \grace mi8 red2 r4 re  %%%%% fine p. 29

   %76
   \grace re8 dod2 r4 do
   \grace do?8 si2 r4 la
   sib (re) r dod

   %79
   re (fa) r mi
   fa?(re) r sold\mbreak
   la r la, r

   %82
   fa' r sold, r
   la2 r
   r4 la fad' la,

   %85
   sold8[la] si2.\mbreak
   r4 fad' fad la,
   sold8[la] si4 r2\fermata

   %88
   r4 la fa'2~
   fa4 mi mi red
   red?1

   %91
   mi4 re! re dod!\mbreak
   dod1
   re2. do8[(si)]

   %94
   \grace re8 do1
   si2 r4mi
   \grace mi8 red2 r4 re

   %97
   \grace re8 dod!2 r4 do\mbreak
   si2 r4 la
   sib dod!2 re4~

   %100
   re mi2 fa4
   fa?2 sold,
   la4 dod-. r2\mbreak

   %103
   si4 re r2
   dod4 mi r mi,
   fad fad'8[re] \grace dod si2

   %106
   dod4 r la r\mbreak
   fad' r sold, r
   la2 r

   %109
   r\fermata r4 fad'
   mi,2 si'
   la r

   %112
   R1*6
   r2 r4 dod\mbreak
   dod4. fad,8 fad'4 dod

   %120
   re1
   dod2 r4 re
   si4. re8 \grace re dod4. si8

   %123
   \grace si la1
   sold2 r
   r fad'~\mbreak

   %126
   fad4 (mi) re! dod
   \grace dod8 sid2. sid4
   dod (red) mi2~

   %129
   mi4 re! dod si
   \grace si8 lad1
   si4 dod re2~\mbreak

   %132
   re dod4 si
   la1
   sold2 r4 sold

   %135
   sold sid red fad
   mi sold r dod,
   red fad r sid,

   %138
   dod2 r\fermata\mbreak
   r4 dod sold' dod,
   sold2 red'

   %141
   dod r4

}

IIItesto = \lyricmode {

   Che det -- to_a -- vranno _ mai _ i due fede - li_a -- manti _

   i due fede - li_a -- manti _

   ram -- me -- moran - do_i  pian  - - ti, le pe -- ne,_'l so -- spi -- rar

   le pe - - ne, e'l so -- spi -- rar e'l so -- spi -- rar.

   Che det -- to_a -- vranno _ mai _ i due fede - li_a -- manti _

   i due fede - li_a -- manti _ che dett' a -- vranno _ mai _

   ram -- me -- moran - do_i  pian  - - - - - - - - - - - ti,

   le pe -- ne,_'l so -- spi -- rar le pe -- ne,_'l so -- spi -- rar - -

   e_'l so -- spi -- rar.

   Che det -- to_a -- vran -- no  i due fede - li

   ram -- me -- moran - do_i  pian - - - - - - - - ti le pe -- ne,_'l

   so -- spi -- rar le pe - - - ne_'l so -- spirar - - - - - - e'l so - spirar _

   e'l so -- spi -- rar e'l so -- spi -- rar.

   Tu di -- re_A -- mor potra - i che sol fosti _ presen - te

   co -- me so -- a -- vemen - - - - - - - - - - - - te sape - vansi _ spie --

   gar _ - - - - - sape - vansi _ spie -- gar.

}

IIIbcn = \relative do {

   r4
   r la (dod la)
   mi' mi, mi2
   r4 mi'(sold mi)

   %4
   la la, la2
   r4 la dod la\mbreak
   re2 dod

   %7
   si la4 red
   mi mi, mi' dod
   lad lad lad2

   %10
   r4 si re si\mbreak
   r sold' sold sold,?
   r la dod la

   %13
   re re red red
   r mi mi,2
   r4 fad' sold2\mbreak

   %16
   r4 la red,2
   r4 mi\f( sold mi)
   r la,(dod la)

   %19
   r mi'(sold mi)
   r la,(dod la)\mbreak
   re2 mi

   %22
   r4 la,(do la)
   r mi'(sold mi)
   r la,(do la)

   %25
   re2 mi\mbreak
   dod! la
   re dod4 re

   %28
   mi2 mi,
   la r
   r4 la(dod la)\mbreak

   %31
   mi' mi, mi2
   r4 mi' sold mi
   la la, la2

   %34
   r4 la (dod la)
   re dod r2\fermata
   fad1

   %37
   mi2 r\fermata
   mi4 re dod si
   lad lad lad lad

   %40
   si si mid mid\mbreak
   fad fad, fad2
   r4 sold lad2

   %43
   r4 si mid2
   r4 fad(mi! re)
   mi2 fad\mbreak

   %46
   sol red
   mi4 r fad r
   sol r re r

   %49
   mi r fad r
   si, fad' re si\mbreak
   sold sold sold sold

   %52
   la mi' dod la
   la'2 r4 fad
   re2 red

   %55
   mi r\mbreak
   R1
   r4 mi (sold mi)

   %58
   la2 r4 fad
   mi2 r
   mi4 mi r2\mbreak

   %61
   R1
   r4 mi sold mi
   la2 r4 fad

   %64
   mi2 r4 mi\mbreak
   mi mi, r re'
   dod1

   %67
   re(
   red)
   mi(

   %70
   mid)\mbreak
   fad2 dod
   si mi

   %73
   mi4 mi red red
   mi mi, mi2
   r4 fad' sold2\mbreak

   %76
   r4 la (red,2)
   r4 mi(re! do)
   re2-. mi-.

   %79
   fa dod!
   re si\mbreak
   do2 fa

   %82
   re mi~
   mi4 mi fa mi
   red1

   %85
   mi4 mi fa mi\mbreak
   red1
   mi2 r_\fermata

   %88
   la, r4 la'
   do1~
   do?4 si si la

   %91
   sol2 sib~\mbreak
   sib?4 la2 sol4
   fa2 sold

   %94
   la red,
   mi r
   r4 fad! (sold2)

   %97
   r4 la red,2\mbreak
   r4 mi(re! do)
   re2 mi

   %100
   fa do
   re mi
   r4 la,(dod! la)\mbreak

   %103
   r mi' sold mi
   r la,(dod la)
   re2  mi

   %106
   la,4 r dod r\mbreak
   re r mi r
   dod r la r

   %109
   re2 r\fermata
   mi1
   la,4 la dod la

   %112
   mi' mi mi,2\mbreak
   r4 mi' sold mi
   r la, dod la

   %115
   re2 mi
   r4 la,(dod la)
   re2 mi

   %118
   la,2. r4\mbreak
   r2 fad'2~
   fad4 fad sold fad

   %121
   mid dod fad2~
   fad mid
   fad4 fad sid, sid

   %124
   dod2 mid
   fad2. sold4\mbreak
   la1~

   %127
   la4 la sold fad
   mi2. fad4
   sol!1~

   %130
   sol4 sol fad mi
   re dod si fad'\mbreak
   mid1

   %133
   fad4 mi! red dod
   sid1
   r4 sold sid sold

   %136
   dod r mi r
   fad r sold? r
   mi2 r\fermata\mbreak

   %139
   mi2 r4 fad
   sold1
   dod,2 r4

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}

forma = {

   \time 2/2
   \key re\major
   \tempo 1 = 60
   \partial 4 s4
   s1*117
   s2. \bar"||"\break s4
   s1*23
   \bar "||"
   \mark\markup\smaller"D.C."

}

IIIvlI = {
   %\notypeset
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   <<\IIIvlIIn \forma>>

}

IIIvla = {
   \clef alto
   <<\IIIvlan \forma>>

}

IIIvoce = {
   \new Voice = "detto"
   <<\IIIvocen \forma>>
}

IIIbc = {
   \clef bass
   <<\IIIbcn \forma \IIIbfn>>
   \typeset
}
#(set-global-staff-size 17.5)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con \terzinequarto
}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

    \markup \huge\bold\fill-line {"  ""Cantata ”Or che dal sol difesa”""  "}

\markup \huge {"[1.] Cantabile con un po' di moto"}

\score {

    \new ChoirStaff	<<

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
            \set Staff.midiInstrument = #"violin"
            \IvlI \global
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
            \set Staff.midiInstrument = #"violin"
            \IvlII \global
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
            \set Staff.midiInstrument = #"viola"
            \Ivla \global
        >>

        \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 4/4\key la\major s8^\markup\center-align"Soprano"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce \global
                \new Lyrics \lyricsto "sol" \Itesto
        >>

        \new Staff = "main"
        \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \set Staff.midiInstrument = #"cello"
            \Ibc \global
        >>
    >>

    \layout {

        indent = 2.3\cm
        incipit-width = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {"[2.] Rec[itati]vo - Andante"}

\score {

    \new ChoirStaff	<<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI \global
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII \global
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla \global
        >>

        \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 4/4}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce \global
                \new Lyrics \lyricsto "siedi" \IItesto
        >>

        \new Staff = "main"
        \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.midiInstrument = #"cello"
            \IIbc \global
        >>
    >>

    \layout {

        indent = 1\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {"[3.] Allegro ma no presto"}

\score {

    \new ChoirStaff	<<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI \global
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII \global
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla \global
        >>

        \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 2/2\key re\major }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIIvoce \global
                \new Lyrics \lyricsto "detto" \IIItesto
        >>

        \new Staff = "main"
        \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.midiInstrument = #"cello"
            \IIIbc \global
        >>
    >>

    \layout {

        indent = 1\cm
        incipit-width = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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
