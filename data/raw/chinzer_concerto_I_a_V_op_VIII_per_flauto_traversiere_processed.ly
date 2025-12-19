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

Iglobal = {
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
}

Ifln = \relative do'' {

   R1*16
   r4 r8 la\solo re16. re32 \tuplet 3/2 { fad16[mi re] } la'16. la32 \tuplet 3/2 { dod16[si la] }  %%%%%% fine ripresa
   re8 re, r re16(red \grace fad8 mi8.) re!16 dod si la sol'

   %19
   \tuplet 3/2 { fad16[sol la] } la8 r re,16\p (red  \grace red?8 mi8.) re!16 dod si la sol
   \tuplet 3/2 { fad[mi re] } re8 r4 re'16\f(la) fad'(re) la'(fad) re'(la)
   re,(la) fad'(re) la'(fad) re'(la) re,(si) sol'(re) si'(sol) re'(si)

   %22
   re,\p(si) sol'(re) si'(sol) re'(si) re,\f(la) fad'(re) la'(fad) re'(la)
   re,\p(la) fad'(re) la'(fad) re'(la) dod,\f(la) mi'(dod) sol'(mi) dod'(la)\mbreak
   dod,\p(la) mi'(dod) sol'(mi) dod' mi re(dod si la sol fad mi re)

   %25
   si'(la sol fad mi re dod si) sol'(fad mi re dod si la sol)
   fad(mi re mi) re8 r la'16(re) fad,(re') sol,(re') la(re)
   si\p(re) fad,(re') sol, (re') la(re) si (re) fad,(re') sol,(re') la(re)\mbreak % fineriga 7

   %28 OK
   si(la sol la) sol8 r si16(mi) sold,(mi') la,(mi') si(mi)
   dod\p(mi) sold,(mi') la,(mi') si(mi) dod\f(mi) sold,(mi') la,(mi') si(mi)
   dod(si la si) la8 r mi'16(la) dod,(la') re,(la') mi(la)

   %31
   fad\p(la) dod,(la') re,(la') mi(la) fad\f(la) dod,(la') re,(la') mi(la)
   fad(mi re mi) re8 \tuplet 3/2 { fad16[sold la] }\mbreak sold(fad mi fad) mi8 \tuplet 3/2 { sold16[la si] }
   la(sold fad sold) fad8 \tuplet 3/2 { la16[si dod] } si(la sold la) sold8 \tuplet 3/2 { si16[dod re] }

   %34
   \tuplet 3/2 { dod[si la] } mi'16 mi mi[mi mi(red32 mi)] \tuplet 3/2 { si16[la sold] } mi'16 mi mi[mi mi(red32 mi)]
   \tuplet 3/2 { la,16[sold fad]} fad'[fad] fad fad, sold la \tuplet 3/2 { sold[fad mi] } mi8 r4\mbreak
   re'2 dod4~dod16 mi la, re

   %37
   \grace dod8 si2\prall la4 r
   \grace {si,16[dod]} re2\prall\p \grace re8 dod4~dod16 mi la, re
   \grace dod8 si2\prall dod16 la mi' dod la' mi dod' la

   %40
   mi'8 la,16 si si4-+ la r
   R1*2
   r4 r8 mi, la16.la32 \tuplet 3/2 { dod16[si la] } mi'16. mi32 \tuplet 3/2 { sold16[fad mi] }\mbreak

   %44
   la8 la, r la16 lad (si8.-+)(dod32 re) mi,16 re' dod si
   \tuplet 3/2 { dod re mi } mi8\noBeam r la16 lad (si8.) dod32 re mi,16 re' dod si
   \tuplet 3/2 { dod si la } \autoBeamOff la8\noBeam r4 dod16 la8 mi dod dod'16

   %47
   si sold8 mi si si'16 la fad8 red la la'16\autoBeamOn
   \terzine \tuplet 3/2 { sold fad mi la[sold fad] } \grace  {sold16[la]} si8 la16 sold sold8-+ fad r4
   \grace sol8 \tuplet 3/2 { fad16 mi red red[dod si] } si(red fad la) \tuplet 3/2 { sold fad mi  } mi[mi] mi si'(sold mi)

   %50
   \grace sol8 \tuplet 3/2 { fad16 mi red \grace mi8 red16[dod si] } si(red fad la) \tuplet 3/2 { sold fad mi  } mi[mi] mi si'(sold mi)\mbreak
   dod'8 dod~\tuplet 3/2 {dod16 \grace dod8 si16 la la [sold fad]} fad8 \sestine fad~ \tuplet 6/4 {fad16 la sold fad sold la}
   \terzine si8 si \grace dod8 \tuplet 3/2 { si16 la sold sold[fad mi] } mi8 \sestine \once\tieDashed mi~\tuplet 6/4 {mi16 sold fad mi fad sold}

   %53
   \terzine la8 la \grace si \tuplet 3/2 { la16 sold? fad \grace sold8 fad16[mi red?] } red8 \sestine red~\tuplet 6/4 {red16 fad mi red mi fad}
   \once\stemDown sold mi,(sold? si) mi, mi'(sold si)\mbreak \once\stemDown la fad, la fad \once\stemUp red fad'(la dod)
   \once\stemDown si mi,,(sold si) \once\stemUp mi, sold'(si re!) \autoBeamOff dod16 dod8 si16 la la8 sold16

   %56
   fad fad8 mi16 red red8 dod16\autoBeamOn si8  \terzine la'~\tuplet 3/2 { la16 sold fad dod' [si la]}
   \sestine \tuplet 6/4 { sold fad mi red dod si} fad'4-+ mi r
   R1*2

   %60
   r4 r8 sold sold8.-+ la32 si la8 sold\mbreak \tuplet 6/4{la16 fad sold la sold fad}  \tuplet 6/4{dod fad sold la sold fad} sold8.-+ la32 si la8 sold
   \tuplet 6/4{la16 fad sold la sold fad}  \tuplet 6/4{dod fad sold la sold fad}   \tuplet 6/4{re' si dod \grace dod8 re16 dod re} \tuplet 6/4{re si dod \grace dod8 re16 dod re}
   \tuplet 6/4{sold, mi fad sold fad mi}\tuplet 6/4{sold mi fad sold fad mi} \tuplet 6/4{dod'16 la si \grace si dod si dod } \tuplet 6/4{dod16 [la si \grace si dod si dod]}

   %63
   \tuplet 6/4{fad, re mi fad mi re} \tuplet 6/4{fad re mi fad mi re} \tuplet 6/4{si' sold la \grace dod8 si16 la si} \tuplet 6/4{si sold la \grace dod8 si16 la si}
   \tuplet 6/4{mid, dod re mid re dod} \tuplet 6/4{mid dod re mid re dod} fad16.-+ \terzine fad32 \grace sold? \tuplet 3/2 { fad16 [mid fad] } sold!16.-+ sold32 \grace la8 \tuplet 3/2 { sold16 [fad sold ]}

   %66
   la16.-+ la32 \grace si8 \tuplet 3/2 { la16[sold la] } si16.-+ si32 \grace dod8 \tuplet 3/2 { si16 [la si] } dod16.-+ dod32 \grace re8 \tuplet 3/2 {
      dod16[si dod]  re dod si la[sold fad]
      mid re dod si'[la sold]
   } sold4-+ fad16 dod\p re (dod re) fad sold la
   sold sid, dod(sid dod) mi! fad sol fad lad, si(lad si) re  mid fad\mbreak

   %69
   \tuplet 3/2 { mid re dod } \sestine dod8\noBeam ~ \tuplet 6/4 {dod16 sold' la si la sold} \terzine \tuplet 3/2 { la[sold fad] } fad8\noBeam ~\sestine \tuplet 6/4 {fad16 dod' si la sold fad}
   \tuplet 3/2 { mid re dod } \sestine dod8\noBeam ~ \tuplet 6/4 {dod16 sold' la si la sold} \terzine \tuplet 3/2 { la[sold fad] si la sold} sold4-+
   fad4 r r2

   %72
   R1*19

}

IvlIn =  \relative do'' {

   re16. re32 \tuplet 3/2 { fad16[mi re] } la'16. la32 \tuplet 3/2 { dod16[si la] } re8 re, r re16 red(
   \grace fad8 mi8.) re!16 dod si la sol' \tuplet 3/2 { fad16[sol la] } la8-+ r re,16 red\p(
   mi8.) re!16 dod si la sol\mbreak \tuplet 3/2 { fad[mi re] } re8 r4

   %4
   re'16\f(fad la re) re(la fad re) re\p(fad la re) re (la fad re)
   la\f(dod mi la) la(mi dod la) la\p(dod mi la) la(mi dod la)
   mi\f(sold si re) re(si sold mi) mi\p(sold si re) re(si sold mi)

   %7
   dod'\f(la mi' dod) la'(mi dod la)\mbreak mi\p(sold si re) re(si sold mi)
   dod'\f(la mi' dod) la'(mi dod la)  fad'16.-+\p fad32 \tuplet 3/2 { fad16[sold la] } sold16.-+ sold32 \tuplet 3/2 { sold16[la si] }
   la8. \f-+ sold32 fad mi8 re \tupletSpan 4 \tuplet 6/4 {
      dod16 re  mi fad sold la sold[fad mi re dod si]

      %10
      dod\p re mi fad sold la
   } dod,8 si la la'\f~\tuplet 6/4 { la16 do si la si do }\mbreak
   red,8 mi\p fad8.-+ sol!32 la sol8 sol\f~\tuplet 6/4 { sol16 si la sol la si }
   dod,8 re mi8.-+\p fad32 sol fad8\f \tuplet 3/2 { re'16[dod si] } la8 la

   %13
   la\p \tuplet 3/2 { re16[dod si]} la8 la la\f \tuplet 3/2 { re16[dod si] } la8 sol
   \tuplet 6/4 {fad16 sol la si dod re} fad,8 mi re \tuplet 3/2 { re16\p[dod si] } la8 la
   la \tuplet 3/2 { re16[dod si] } la8 la\mbreak la_\markup {[\musicglyph #"f"]}  \tuplet 3/2 { re16[dod si] } la8 sol

   %16
   \tuplet 6/4 {fad16 sol la si dod re} fad,8 mi re16 re'(la fad) <fad' la, re,>8 <fad la, re,>
   <fad la, re,>4 r re,8\p re dod dod %%%%ripresa
   si si fad' fad sol sol la la,

   %19
   re re fad fad sol sol la la,
   re4 r r8 la' la la
   r la la la\mbreak r si si si

   %22
   r si si si r la la la
   r la la la r dod dod dod
   r dod dod dod re4 r

   %25
   R1
   r8 re, fad la re,4 r
   R1

   %28
   r8 sol si re sold,4 r
   R1\mbreak
   r8 la dod mi la,4 r

   %31
   R1
   r8 re, fad si r mi, sold dod
   r fad, la re r sold, si mi

   %34
   R1
   r2 r8 mi, sold mi
   fad mi fad sold la la, dod re

   %37
   mi re mi mi la,4 r
   R1*2\mbreak
   r2 la'16.\f la32 \tuplet 3/2 { dod16[si la] } mi'16. mi32 \tuplet 3/2 { sold16[fad mi] }

   %41
   la8 la, r la16\p lad(si8.) la16 sold fad mi re'
   \tuplet 3/2 { dod re mi } mi8\noBeam r la,16\f lad(si8.) la16 sold fad mi re
   dod si la8 r4 la'8\p la sold sold

   %44
   fad fad dod dod\mbreak re re mi mi
   la la dod, dod re re mi mi
   la,4 r r8 mi'' mi mi

   %47
   r mi mi mi r red red red
   mi4 r r2

   %49
   r8 fad fad fad r sold? sold sold
   r fad fad fad r sold? sold sold
   r sold? sold sold r fad fad fad

   %52
   r fad fad fad\mbreak r mi mi mi
   r mi mi  mi r red red red
   mi4 r r2

   %55
   R1*2
   r2 mi16.\f mi32 \tuplet 3/2 { sold16[fad mi] } si'16. si32 \tuplet 3/2 { red16[dod si] }
   mi8 mi, r mi16\p mid (fad8.) mi16 red dod si la'

   %59
   \tuplet 3/2 { sold? la si } si8\noBeam r mi,16_\markup {[\musicglyph #"f"]} mid (fad8.) mi16 red dod si la\mbreak
   \tuplet 3/2 { sold? fad mi } mi8\noBeam r4 r2
   r8 dod'\p fad la r2

   %62
   r8 dod, fad la r la la la
   r sold sold sold r sold sold sold
   r fad fad fad r fad fad fad

   %65
   r mid mid mid fad4 r
   R1
   r2 r8 re re re

   %68
   re dod dod dod dod si si si\mbreak
   si si si si la la la la
   sold sold sold sold fad4 r

   %71
   fad16.\f ^\tu fad32 \tuplet 3/2 { la16[sold fad] } dod'16. dod32 \tuplet 3/2 { mi16[re dod] }fad8 fad, r fad'16.\p la32
   \grace la8 sold8. fad16 mid re dod si' \tuplet 3/2 { la[si dod] } dod8\noBeam r fad,16.\f la32
   \grace la8 sold8. fad16 mid re dod si \tuplet 3/2 { la[sold fad] } fad8\noBeam r4

   %74 ripresa
   re'16. re32 \tuplet 3/2 { fad16[mi re] } la'16. la32 \tuplet 3/2 { dod16[si la] } re8 re, r re16 red(
   \grace fad8 mi8.) re!16 dod si la sol' \tuplet 3/2 { fad16[sol la] } la8-+ r re,16 red\p(
   mi8.) re!16 dod si la sol\mbreak \tuplet 3/2 { fad[mi re] } re8 r4

   %77
   re'16\f(fad la re) re(la fad re) re\p(fad la re) re (la fad re)
   la\f(dod mi la) la(mi dod la) la\p(dod mi la) la(mi dod la)
   mi\f(sold si re) re(si sold mi) mi\p(sold si re) re(si sold mi)

   %80
   dod'\f(la mi' dod) la'(mi dod la)\mbreak mi\p(sold si re) re(si sold mi)
   dod'\f(la mi' dod) la'(mi dod la)  fad'16.-+\p fad32 \tuplet 3/2 { fad16[sold la] } sold16.-+ sold32 \tuplet 3/2 { sold16[la si] }
   la8. \f-+ sold32 fad mi8 re \tupletSpan 4 \tuplet 6/4 {
      dod16 re  mi fad sold la sold[fad mi re dod si]

      %83
      dod\p re mi fad sold la
   } dod,8 si la la'\f~\tuplet 6/4 { la16 do si la si do }\mbreak
   red,8\p mi fad8.-+ sol!32 la sol8 sol\f~\tuplet 6/4 { sol16 si la sol la si }
   dod,8\p re mi8.-+ fad32 sol fad8\f \tuplet 3/2 { re'16[dod si] } la8 la

   %86
   la\p \tuplet 3/2 { re16[dod si]} la8 la la\f  \tuplet 3/2 { re16[dod si] } la8 sol
   \tuplet 6/4 {fad16 sol la si dod re} fad,8 mi re \tuplet 3/2 { re16\p[dod si] } la8 la
   la \tuplet 3/2 { re16[dod si] } la8 la\mbreak la_\markup {[\musicglyph #"f"]}  \tuplet 3/2 { re16[dod si] } la8 sol

   %89
   \tuplet 6/4 {fad16 sol la si dod re} fad,8 mi re16 re'(la fad) <fad' la, re,>8 <fad la, re,>
   <fad la, re,>4\fermata r r2

}

IvlIIn = \relative do'' {

   fad,8 fad' mi la re,[fad,16 sol la8 la]
   si si dod dod re fad la, la\p
   si si dod dod re fad re,4

   %4
   fad'16\f la,(re la) fad'16 la,(re la) fad'\p la,(re la) fad'16 la,(re la)
   mi'\f la,(dod la) mi' la,(dod la) mi'\p la,(dod la) mi' la,(dod la)
   si\f mi,(sold mi) si' mi,(sold mi) si'\p mi,(sold mi) si' mi,(sold mi)

   %7
   la\f mi dod' la mi'(dod la mi)  si'\p mi,(sold mi) si' mi,(sold mi)
   la\f mi dod' la mi'(dod la mi) re8\p re' si si
   la\f la si si\mbreak mi, re' si mi

   %10
   la,8\p la4 sold8 la mi'4\f la8~
   la sold?\p red8.-+ mi32 fad mi8 mi4\f sol?8~
   sol fad dod8.\p re32 mi re8 fad \terzine mi\f \noBeam\tuplet 3/2 { sol16[fad mi]}

   %13
   fad8 fad\p mi  \tuplet 3/2 { sol16[fad mi] } fad8 fad\f mi \tuplet 3/2{mi16[re dod] }
   re8 re4 dod8 re[fad,\p mi ]\tuplet 3/2 { sol16[fad mi] }
   fad8 fad mi \tuplet 3/2 { sol16[fad mi] } fad8 fad\f mi \tuplet 3/2 { mi16[re dod] }

   %16
   re8 re4 dod8 re16 re'(la fad) <fad' la, re,>8 <fad la, re,>
   <fad la, re,>4 r re,8\p re dod dod %%%%ripresa
   si si fad' fad sol sol la la,

   %19
   re re fad fad sol sol la la,
   re4 \parenthesize r r8 fad fad fad
   r fad fad fad r sol sol sol

   %22
   r sol sol sol r fad fad fad
   r fad fad fad\mbreak r mi mi mi
   r mi mi mi fad4 r

   %25
   R1
   r8 re fad la re,4 r
   R1

   %28
   r8 sol si re sold,4 r
   R1
   r8 la dod mi la,4 r

   %31
   R1
   r8 re, fad si r mi, sold  dod
   r fad, la re r sold, si mi

   %34
   R1
   r2 r8 mi, sold mi
   fad mi fad sold la la, dod re

   %37
   mi re mi mi la,4 r
   R1*2
   r2 dod8\f dod' si mi

   %41
   la, dod,16 re mi8 mi fad\p fad sold sold
   la dod mi,\f mi fad fad sold sold
   la dod la,4 la'8\p la sold sold

   %44
   fad fad dod dod\mbreak re re mi mi
   la la dod, dod re re mi mi
   la,4 r r8 dod' dod dod

   %47
   r si si si r la la la
   sold 4 r r2
   r8 red' red red r mi mi mi

   %50
   r red red red r mi mi mi
   r mi mi mi r red red red
   r red red red r dod dod dod\mbreak

   %53
   r dod dod dod r si si si
   si4 r r2
   R1*2

   %57
   r2 sold8\f sold'? fad si
   mi, sold,16\p la si8 si dod dod red red
   mi sold si,_\markup {[\musicglyph #"f"]} si dod dod red red

   %60
   mi sold mi,4 r2
   r8 fad\p la dod r2
   r8 fad, la dod r re re re\mbreak

   %63
   r re re re r dod dod dod
   r dod dod dod r si si si
   r si si si la4 r

   %66
   R1
   r2 r8 la la la
   sold sold  sol sol fad fad fad fad

   %69
   mid mid mid mid fad fad fad fad
   mid mid mid mid fad4 r
   la,8\f la' sold dod fad, la16 si dod8 dod\p

   %72
   re re mid mid fad la dod, dod\f
   re re mid mid fad la la,4
   fad8 fad' mi la re,[fad,16 sol la8 la]

   %75
   si si dod dod re fad la, la\p
   si si dod dod re fad re,4
   fad'16\f la,(re la) fad'16 la,(re la) fad'\p la,(re la) fad'16 la,(re la)

   %78
   mi'\f la,(dod la) mi' la,(dod la) mi'\p la,(dod la) mi' la,(dod la)
   si\f mi,(sold mi) si' mi,(sold mi) si'\p mi,(sold mi) si' mi,(sold mi)
   la\f mi dod' la mi'(dod la mi)  si'\p mi,(sold mi) si' mi,(sold mi)

   %81
   la\f mi dod' la mi'(dod la mi) re8\p re' si si
   la\f la si si\mbreak mi, re' si mi
   la,8\p la4 sold8 la mi'4\f la8~

   %84
   la sold? red8.-+\p mi32 fad mi8 mi4\f sol?8~
   sol fad dod8.\p re32 mi re8 fad \terzine mi\f \noBeam\tuplet 3/2 { sol16[fad mi]}
   fad8 fad\p mi  \tuplet 3/2 { sol16[fad mi] } fad8 fad mi\f \tuplet 3/2{mi16[re dod] }

   %87
   re8 re4 dod8 re[fad,\p mi ]\tuplet 3/2 { sol16[fad mi] }
   fad8 fad mi \tuplet 3/2 { sol16[fad mi] } fad8 fad\f mi \tuplet 3/2 { mi16[re dod] }
   re8 re4 dod8 re16 re'(la fad) <fad' la, re,>8 <fad la, re,>

   %90
   <fad la, re,>4\fermata r r2

}

Ivlan =  \relative do' {

   la'8 la la la si si la la
   sol mi mi la la re, la' la\p
   sol mi mi la la la, la4
   la'8\f la la la la\p la la la\mbreak
   la\f la la la la\p la la mi
   mi\f mi mi mi mi\p mi mi mi
   mi\f mi mi mi mi\p mi mi mi
   mi\f mi mi la la\p fad mi mi
   la,\f la' sold si la fad si si
   la\p fad mi mi mi mi\f mi mi\mbreak
   fad mi\p si' si si si\f si mi,
   mi re la'\p la la la4\f dod,8
   re la'4\p dod,8 re la'4\f la8
   \tuplet 3/2 { la16 sol fad } si8[la la] la la,4\p dod8
   re la4 dod8 re la4\f la8
   \tuplet 3/2 { la16 sol fad } si8[la la]\mbreak \once\stemUp la16 re' la fad <<
      {
         la8[la]
         la4%\fermata
      }\\{
         \stemUp \once \override Stem #'transparent = ##t  fad8 fad
         fad4
      }\\{
         \stemDown re8[re]
         re4%% _\fermata
      }
   >> r4 re8\p re dod dod % fine ripresa
   si si fad' fad sol sol la la,
   re re fad fad sol sol la la,
   re4 r r8 re re re
   r re re re r re re re\mbreak
   r re re re r re re re
   r re re re r la la la
   r la la la la4 r
   R1
   r8 re fad la re,4 r
   R1
   r8 sol si re sold,4 r\mbreak
   R1
   r8 la dod mi la,4 r
   R1
   r8 re, fad si r mi, sold dod
   r fad, la re r sold, si mi
   R1
   r2 r8 mi, sold mi
   fad mi fad sold la la, dod re\mbreak
   mi re mi mi, la4 r
   R1*2
   r2 mi'8\f mi mi mi
   fad fad mi mi re_\markup {[\musicglyph #"p"]} si si mi
   mi la, mi'\f mi re si si mi
   mi mi, mi4 la'8\p la sold sold
   fad fad dod dod re re mi mi\mbreak
   la la dod, dod re re mi mi
   la,4 r r8 la' la la
   r sold sold sold r si, si si
   mi4 r r2
   r8 si' si si r si si si
   r si si si r si si si\mbreak
   r la la la r la la la
   r sold sold sold r sold sold sold
   r fad fad fad r fad fad fad
   mi4 r r2
   R1*2
   r2 si'8\f si si si
   dod dod\p si si la fad fad si\mbreak
   si mi, si'\f si la fad fad si
   si si, si4 r2
   r8 la\p dod fad r2
   r8 la, dod fad r fad fad fad
   r mi mi mi r mi mi mi
   r re re re r re re re\mbreak
   r dod dod dod dod4 r
   R1
   r2 r8 fad fad re'
   si sold mi dod' la fad re si'
   sold sold sold sold fad dod' dod dod
   dod dod dod dod dod4 r\mbreak
   dod,8\f dod dod dod re re dod dod\p
   si sold' sold dod dod fad, dod' dod\f
   si sold sold dod dod dod, dod4
   la'8 la la la si si la la
   sol mi mi la la re, la' la\p
   sol mi mi la la la, la4
   la'8\f la la la la\p la la la\mbreak
   la\f la la la la\p la la mi
   mi\f mi mi mi mi\p mi mi mi
   mi\f mi mi mi mi\p mi mi mi
   mi\f mi mi la la\p fad mi mi
   la,\f la' sold si la fad si si
   la\p fad mi mi mi mi\f mi mi\mbreak
   fad mi si'\p si si si\f si mi,
   mi re la'\p la la la4\f dod,8
   re la'4\p dod,8 re la'4\f la8
   \tuplet 3/2 { la16 sol fad } si8[la la] la la,4\p dod8
   re la4 dod8 re la4\f la8
   \tuplet 3/2 { la16 sol fad } si8[la la]\mbreak \once\stemUp la16 re' la fad <<
      {
         la8[la]
         la4\fermata
      }\\{
         \stemUp \once \override Stem #'transparent = ##t  fad8 fad
         fad4
      }\\{
         \stemDown re8[re]
         re4 _\fermata
      }
   >> r4 r

}

Ibcn = \relative do {

   re8 re' dod dod si si fad fad
   sol sol la la, re re fad fad\p
   sol sol la la, re re fad la

   %4
   re_\markup {[\musicglyph #"f"]} re re re re\p re re re
   dod^\f dod dod dod dod\p dod dod dod\mbreak
   sold^\f sold sold sold sold\p sold sold sold

   %7
   la\f la la la sold^\p sold sold sold
   la\f la la la re,^\markup {[\musicglyph #"p"]}  re mi mi
   fad^\f fad sold sold la re, mi sold

   %10
   la\p re, mi mi, la do^\f do do
   si si^\p si si mi si'\f sol mi
   la, la la\p la\mbreak re re'\f dod la

   %13
   re, re'\p dod la re, re'\f dod la
   re, sol la la, re re\p dod la
   re, re' dod la re, re'\f dod la

   %16
   re sol la la, re16 re' la fad re8 re
   re4 r r2 %%% ripresa
   R1*2

   %20
   r8 re fad la re,4 r
   re r re r\mbreak
   re r re r

   %23
   re r la r
   la r re8 re re re
   sol sol sol sol mi mi la la

   %26
   re,4 r r8 re mi fad
   sol re mi fad sol re mi fad
   sol4 r r8 mi fad sold

   %29
   la mi fad sold la mi fad sold
   la4 r r8 la, si dod\mbreak
   re la si dod re la si dod

   %32
   re4 r8 red mi4 r8 mid
   fad4 r8 fad sold4 r8 sold
   la la la la sold sold sold sold

   %35
   fad si, red si mi4 r
   R1
   r2 r8 la, dod la

   %38
   si si' sold mi la la, dod re
   mi re mi mi,\mbreak la4 r
   la16 si dod re mi8 mi, la_\markup {[\musicglyph #"f"]} la' sold sold

   %41
   fad fad dod dod re^\p re mi mi,
   la la dod^\f dod re re mi mi
   la,4 r r2

   %44
   R1*2
   r8 la dod mi la4 r
   sold r fad r

   %48
   mi8 fad sold la si si, red fad\mbreak
   si,4 r mi r
   si r mi r

   %51
   la r red, r
   sold r dod, r
   fad r si, r

   %54
   mi r red r
   mi r la8 sold fad mi
   red dod si lad si red red red

   %57
   mi4 la,8 si\mbreak mi mi red red
   dod dod\p sold sold la la si si
   mi mi sold,^\f sold la la si si

   %60
   mi4 r4 mid8 mid dod dod
   fad fad,r fad' mid mid dod dod
   fad fad,r fad' si si, r si

   %63
   mi mi, r mi' la la, r la\mbreak
   re re, r re' sold sold, r sold
   dod dod, r dod' fad la mid dod

   %66
   fad fad sold sold la la si sid
   dod re si dod fad, fad fad fad
   mid mid mi mi red red re re

   %69
   dod dod dod dod dod dod dod dod
   dod dod dod dod\mbreak fad re' si dod
   fad,_\markup {[\musicglyph #"f"]} fad mi mi re re la la_\markup {[\musicglyph #"p"]}

   %72
   si si dod dod fad fad la, la\f
   si si dod dod fad fad16 sol! fad mi re dod
   re8 re' dod dod si si fad fad

   %75
   sol sol la la, re re fad fad\p
   sol sol la la, re re fad la
   re_\markup {[\musicglyph #"f"]} re re re re\p re re re

   %78
   dod\f dod dod dod dod\p dod dod dod\mbreak
   sold\f sold sold sold sold\p sold sold sold
   la\f la la la sold\p sold sold sold

   %81
   la\f la la la re,_\markup {[\musicglyph #"p"]}  re mi mi
   fad\f fad sold sold la re, mi sold
   la\p re, mi mi, la do\f do do

   %84
   si si si\p si mi si'\f sol mi
   la, la la\p la\mbreak re re'\f dod la
   re, re'\p dod la re, re'\f dod la

   %87
   re, sol la la, re re\p dod la
   re, re' dod la re, re'\f dod la
   re sol la la, re16 re' la fad re8 re

   %90
   re4\fermata r r2

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s4 <6> <5> <6>
   <6 5>2 s4 <6>
   <6 5>2 s4 <6>
   s1
   <6>
   <6 5>
   s2 <6 5>
   s2 <5>8 <6> <5 _+> <6>
   <5> <6> <6 5>4 s <_+>
   s8 <6 5> <6 4> <5 3+>
   s <6> s4
   <7 _+>8 <6 4> <7 _+>4 s <6>
   <7_+>8 <6 4> s <7 _+> s4 <6>8 <7->
    s4 <6>8 <7->  s4 <6>8 <7-> %%%%%%% OK bar 13
    s8 <6 5> <6 4> <5 3> s4 <6>8 <7>
    s4 <6>8 <7> s4 <6>8 <7>
    s <6 5> <6 4> <5 3> s2  %%ripresa
    s1*6
    s2 <7>
    <7>1
    s2 s4 <7>
    s1
    s
    s2 s8 <_+>  s4
    s1*3
    s4 s8 <6 5> s4 s8 <6 5>
    s4 s8 <6 5> s4 s8 <6 5>
    s2 <6>
    s8 <7 _+> s4 <_+>2
    s1
    s2 s4 <6>
    s <6 5> s <6>
    <4> <3+> s2
    s8 <6> <4> <3+> s4 <6>
    <5> <6> <6 5> <_+>
    s <6> <6 5> <_+>
    s1*3
    s4 <6>8 <_+> s2
    <6> <6+>
    <6+>4 <6>8 <6 5> <6 4> <5 3+> <6>4 %%% OK bar 48
    <_+>2 <_+>
    <_+> <_+>
    s <7>
    <7> <7>
    <7> <7>
    <_+> <7 5>
    <_+> s4 <6+>
    <6>8 <6+> <_+> <6> s <7 5> s4
    <_+> <6 5>8 <_+>\mbreak <_+>4 <6>
    <5> <6> <6 5> <_+>
    <_+> <6> <6 5> <_+>
    s2 <6 5>4 <6 4>8 <5+ 3+>
    s2 <6 5>4 <6 4>8 <5+ 3+>
    s2 <7>
    <_+> <7>
    <7> <7>
    <7 _+> s8 <6> <6>4
    s <6+> <6> s8 <7>
    <_+> <6> <6 5> <_+> s4 <6>
    <7> <6> <7> <6>
    <7 _+>2 <6 4>
    <_+> s8 <6> <6 5> <_+>
    s4 <6> <5> <6>
    <6 5> <_+> s8 <6> s4
    <6+ 5>4 <_+> s2
    s4 <6> <5> <6>
   <6 5>2 s4 <6>
   <6 5>2 s4 <6>
   s1
   <6>
   <6 5>
   s2 <6 5>
   s2 <5>8 <6> <5 _+> <6>
   <5> <6> <6 5>4 s <_+>
   s8 <6 5> <6 4> <5 3+>
   s <6> s4
   <7 _+>8 <6 4> <7 _+>4 s <6>
   <7_+>8 <6 4> s <7 _+> s4 <6>8 <7->
    s4 <6>8 <7->  s4 <6>8 <7-> %%%%%%% OK bar 13
    s8 <6 5> <6 4> <5 3> s4 <6>8 <7>
    s4 <6>8 <7> s4 <6>8 <7>
    s <6 5> <6 4> <5 3> s2

}

forma = {

   \key re\major
   \time 4/4
   \tempo 2 = 45
   s1*90
   \bar"|."

}

Ifl = {
   \Iglobal
   \notypeset
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
}

IIfln = \relative do'' {

   r8\sestine
   R1*2
   r2 r4 r8 sol\solo\mbreak
   re' re \tuplet 6/4{re16 mi fad \grace la8 sol16 fad mi} mi8-+ re \tuplet 6/4{re16 mi fad \grace la8 sol16 fad mi}
   mi8-+ re r16 re sol16. re32 re(do si do) do8 r16 do la'16. do,32
   do(si lad si) si8 r16 si sol'16. si,32 si8-+ la r re
   \tuplet 6/4 {dod16 mi re dod si la} dod8.-+(si32 dod) \tuplet 6/4{re16 fad mi re dod re} mi8.-+(re32 mi)\mbreak
   \grace sol8 \tuplet 6/4{fad16 mi fad \grace la8 sol16 fad sol} \grace si8 \tuplet 6/4 {la16 sol la si sol mi} dod8 re r16 dod'8 re16\noBeam
   \grace dod?8 si-+ la r16 dod!8 re16\noBeam sol,8-+ fad r16 dod'8 re16\noBeam
   si16.-+ la32 la16.-+ sol32 sol16.-+ fad32 fad16.-+ mi32 mi16.-+ re32 re16.-+ dod32 \tuplet 6/4 {dod16 mi sol \grace la8 sol16 fad mi}
   \grace mi8 fad4 \tuplet 6/4 {re16 fad la \grace si8 la16 sol fad} \grace fad8 mi4 \tuplet 6/4 {dod16 mi sol \grace la8 sol16 fad mi}\mbreak
   \grace sol8 \tuplet 6/4 {fad16 mi fad \grace la8 sol16 fad sol} \tuplet 6/4 {la sol la si sol mi} \grace re8 dod re mi8.-+ fad32 sol
   \grace sol8 \tuplet 6/4{fad16 mi fad \grace la8 sol16 fad mi} mi4-+ re  r
   R1*2
   r2 r4 r8 la'\solo  %%%%%% OK

   %17
   la32(sol fad sol) fad[(mi red mi)] red (do si do) si[(red fad la)] do8\noBeam si4 la8
   sol32(fad mi fad) mi8 r sol sol32[(fad mi fad)] mi(re dod re) dod[(si la si)] la(dod mi sol)
   si8 la4 sol8 fad32(mi re mi) re8 r re
   sol re \tuplet 6/4 {re16 mi fad \grace la8 sol16 fad mi} mi8-+ re \tuplet 6/4 {re16 mi fad \grace la8 sol16 fad mi}\mbreak
   mi8-+ re r16 re sol16. re32 re[(do si do) do8] r16 do la'16. do,32

   %22
   do(si la si) si8 r16 si sol'16. si,32 si8-+ la r16 re sol16. re32
   \grace fad8 \tuplet 6/4 {mi16 red mi \grace fad8 mi16 red mi} mi32 (sol fad mi la la si) do \grace mi,8 \tuplet 6/4 {re16 dod re \grace mi8 re16 dod re} re32 fad(mi re sol sol la) si\mbreak
   \grace re,8 \tuplet 6/4 {do?16 si do \grace re8 do16 si do} do32 mi(re do fad fad sol) la si,16. mi32 mi16.-+ re32 re16.-+ do32 do16.-+ si32
   si16. mi32 mi16.-+ re32 re16.\tr do32 do16.-+ si32 si8\terzine \tuplet 3/2 { \grace la'8 sol16 [fad sol] \grace la8 sol16[fad sol] \grace la8 sol16 fad sol }
   sol1-+~
   sol16. re'32 re16.-+ do32 do16.-+ si32 si16.-+ la32\sestine \grace si8 \tuplet 6/4 {la16 sol la do si la} la4-+
   sol16. re32 re16. red32 mi4~\mbreak mi32 sol(fad la sol do, si) la la4-+
   sol4 r r2
   R1*4

}

IIvlIn =  \relative do'' {

   sol8
   \sestine re' re \tuplet 6/4{re16 mi fad \grace la8 sol16 fad mi} mi8-+ re \tuplet 6/4{re16 mi fad \grace la8 sol16 fad mi}
   mi8-+ re r16 re sol16. re32 re(do si do) do8 r16 do la'16. do,32
   do(si la si) si8 r16 si sol'16. si,32 si8-+ la r4

   %4
   r8 si\p\tuplet 6/4 {si 16do re \grace fad8 mi16 re do} do8-+ si \tuplet 6/4 {si16 do re \grace fad8 mi16 re do}
   do8-+ si si si\mbreak si-+ la la la
   la-+ sol sol sol sol-+ fad r fad

   %7
   mi mi mi mi la la la la
   la sol fad si mi, fad r4
   re'8 re r4 dod8 re r4

   %10
   re r si8 si mi, dod'
   re re re re dod dod dod dod
   re4 re8 si mi, fad la dod

   %13
   re re4 dod8 re4 r8 re\f\mbreak
   la'8 la \tuplet 6/4 {la16 si dod re dod si} si8-+ la \tuplet 6/4 {la16 si dod re dod si}
   si8-+ la r16 la  re16. la32 la(sol fad sol) sol8 r16 sol mi'16. sol,32

   %16
   sol(fad mi fad) fad8 r16 fad re'16. fad,32 fad8-+ mi r4
   r8 la\p la la la4 r8 fad
   sol si mi4 r8 sol, sol sol

   %19
   sol4 r8 mi fad la re4\mbreak
   r8 si, \tuplet 6/4 {si16 do re  \grace fad8 mi16 re do} do8-+ si \tuplet 6/4 {si16 do re  \grace fad8 mi16 re do}
   do8-+ si si si si-+ la la la

   %22
   la sol sol sol sol-+ fad r re'
   re do do do do si si si
   si la la la sol16. do32 do16.-+ si32 si16.-+ la32 la16.-+ sol32

   %25
   sol16. do32 do16.-+ si32 si16.-+ la32 la16.-+ sol32 sol4 r
   r8 mi'(re do)\mbreak si mi,(re do)
   \once\stemUp si16. si''32 si16.-+ la32 la16.-+ sol32 sol16.-+ fad32 sol8 sol4 fad8

   %28
   sol4 r16 sol, sol mi re2\fermata
   re'8 re \tuplet 6/4{re16 mi fad sol fad mi} mi8-+ re \tuplet 6/4{re16 mi fad sol16 fad mi}
   mi8-+ re r16 re sol16. re32 re(do si do) do8 r16 do la'16. do,32

   %31
   do(si la si) si8 r16 si sol'16. si,32 si8-+ la fad'8.-+(mi32 fad)
   sol8 sol, la8.-+ si32 do \tuplet 6/4 {si16 la si \grace re8 do16 si la} la4-+
   sol1

}

IIvlIIn = \relative do'' {

   sol8\sestine
   si8 si \tuplet 6/4 {si16 do re \grace fad8 mi16 re do} do8-+ si \tuplet 6/4 {si16 do re \grace fad8 mi16 re do}
   do8-+ si si si si-+ la la la
   la-+ sol sol sol sol8-+ fad r4

   %4
   r8 sol,\p sol sol sol sol sol sol
   sol sol sol sol la la re re
   sol, sol dod dod\mbreak re8 re16 mi fad8 re

   %7
   la la' sol sol fad fad dod dod
   re mi fad sol la re, r4

   %9
   sol8 fad r4 mi8 re r4
   sol r sol8 sold la la,
   la la la la la la la la

   %12
   re mi fad sol la re, dod la
   re sol, la la re4 r8 re'\f
   fad fad \tuplet 6/4 {fad16 sol la si la sol} sol8-+ fad \tuplet 6/4 {fad16 sol la si la sol}

   %15
   sol8-+ fad fad fad fad-+ mi mi mi
   mi-+ re re re re dod r4
   r8 <<{fad[fad fad] fad4 r8 fad}\\{red8 [red red] red4 s8 red}>>

   %18
   mi si' mi4 r8 <<
      {
         mi, [mi mi]
         mi4 r8 mi
      }\\{
         dod8[dod dod]
         dod?4 s8 dod
      }
   >> re la' re4\mbreak
   r8  sol,,, sol sol sol sol sol sol

   %21
   sol sol sol sol la la re re
   sol, sol dod dod re re' si sol
   do do, do fad si si, si mi

   %24
   la la, la re sol4 r8 re
   sol,4 r8 re' sol,4 r
   r8 do'(si la) sol do,(si la)

   %27
   sol4 r8 re' sol do, re re\mbreak
   sol,4 r16 do mi do re2\fermopz
   si'8 si \tuplet 6/4 {si16 do re \grace fad8 mi16 re do} do8-+ si \tuplet 6/4 {si16 do re \grace fad8 mi16 re do}

   %30
   do8-+ si si si si-+ la la la
   la-+ sol sol sol sol8-+ fad r la
   re, re r fad sol sol4 fad8

   %33
   sol1

}

IIvlan =  \relative do' {

   r8
   r sol' sol do do sol sol do
   si sol sol sol  sol sol fad fad
   sol sol mi mi re re r4

   %4
   R1*10
   r8 re re sol sol re re sol\mbreak

   %15
   sol re re re re re dod dod
   re re si' si la la r4
   r8 si, si si si4 r8 si'

   %18
   si si si4 r8 la, la la
   la4 r8 la' la la la4\mbreak
   R1*9

   %29
   r8 sol sol do do sol sol do
   do sol sol sol sol sol fad fad
   sol sol mi mi re re r re

   %32
   sol si re,[re] re mi re re
   si1

}

IIbcn = \relative do {

   r8
   r sol' sol sol, sol sol' sol sol,
   sol sol' sol sol, la la re re
   sol, sol dod dod re re16 mi re do si la

   %4
   sol4 r r2
   R1*8\mbreak
   r2 re'16 re' dod si la sol fad mi

   %14
   re8 re' re re, re re' re re,
   re re' re re, mi mi la la
   re, re sold sold la la16 si la sol fad mi\mbreak

   %17
   red4 r r8 si si\p si
   mi mi16 fad sol fad mi re dod4 r
   r8 la la la re re16 mi fad mi re do

   %20
   si8 sol r4 r2
   R1*8
   sol8^\f sol' sol sol,\mbreak sol sol' sol sol,

   %30
   sol sol' sol sol, la la re re
   sol, sol dod dod re re, r do'
   si sol' fad re sol do, re re,

   %33
   sol1

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s8
   s4 s8 <6 4> <6 4> <5 3> s <6 4>
   <6 4> <5 3> s4 <9 4>8 <8 3> <7 5> s
   <9 4> <8 3> <7 5> <7 5> <6 4> <5 3> s4
   s1*10
   s4 s8 <6 4> <6 4> <5 3> s <6 4>
   <6 4> <5 3> s4 <9 4>8 <8 3> <7 _+> s
   <6 4> <8 3> <7 5> s <6 4> <5 3+> s4
   <6 5>2 s8 <_+> s <7 _+>
   s2 <6 5>
   s8 <_+> s <_+> s2
   <6>1
   s1*8
   <6 4>2 <6 4>8 <5 3> s <6 4>
   <6 4> <5 3>  s s <9 4> <8 3> <7> s
   <9 4> <8 3> <7 5> s <6 4> <5 3> s <6 4 2>
   <6> s <6 5> <7> s <6 5> <4> <3>

}

forma = {

   \key sol\major
   \time 4/4
   \tempo 4 = 55
   \partial 8 s8
   s1*33
   \bar"|."

}

IIfl = {
   \IIglobal
   \notypeset
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

IIIfln = \relative do'' {

   R4.*32
   r4 la8\solo
   re re re

   %35
   re16 re,32(mi fad16) [re la' fad]
   re'8 re re
   re16 re,32(mi fad16)[re la' fad]

   %38
   re' la fad' re la' fad
   fad8-+ mi mi
   la la la\mbreak

   %41
   la16 la,32(si dod16)[la mi' dod]
   la'8 la la
   la16 la,32(si dod16)[la mi' dod]

   %44
   la' mi dod' la mi' dod
   dod8-+ si r
   \terzine \tuplet 3/2 { re16 dod si } si[si si re]

   %47
   \tuplet 3/2 { dod[si la] } la la la dod\mbreak
   \tuplet 3/2 { si[la sold] } sold sold sold si
   \tuplet 3/2 { la[sold fad] } fad fad fad la

   %50
   \tuplet 3/2 { sold[fad mi] } mi8.-+ mi16
   \tuplet 3/2 { fad[mi re] } re re re fad
   \tuplet 3/2 { mi[re dod] } dod dod dod mi

   %53
   \tuplet 3/2 { re[dod si] } si si si re\mbreak
   dod la32(si dod16)[la mi' dod]
   la' la,32(si dod16)[mi la sol!]

   %56
   fad re32(mi fad16)[re la' fad]
   re' re,32(mi fad16)[la re do]
   si re dod(re) dod(re)

   %59
   la re dod(re) dod(re)
   sol, re' dod(re) dod(re)\mbreak
   fad, re' dod(re) dod(re)

   %62
   mi(re dod si la sol)
   fad mi(fad sol ) la8~
   la16 si sol8 fad

   %65
   fad-+  mi la,~
   la16 si sol8 fad
   fad-+ mi r

   %68
   \tuplet 3/2 { re'16 la sol fad[mi re] la' si do
   si re do si[la sol] si dod re
   dod mi re dod[si la] dod re mi

   %71
   re fad mi re[dod si] re mi fad
   mi sol fad mi[re dod] mi fad sol
   fad la sol fad[mi re] fad sol la

   %74
   sold si si si[si si] si si si\mbreak
   la dod dod dod[dod dod] dod dod dod
   si re re re[re re] re re re

   %77
   dod si la} si4-+
   \tuplet 3/2 { la16 dod dod dod[dod dod] dod dod dod
   si re re re [re re] re re re

   %80
   dod si la} si4-+\mbreak
   la4 r8
   R4.*17

   %99
   dod,32\solo[(mi fad sold)] la16 dod, si sold'
   la, mi' la dod si re
   \once\stemDown dod \stemUp mi,,   la dod si re\stemNeutral

   %102
   dod32[(mi fad sold)] la16 mi dod la
   fad'32(re dod re) mi[(fad sold la)] si16 fad
   sold32[(mi fad mi)] red16 mi dod mi\mbreak

   %105
   si32[(mi fad mi)] red16 mi la, mi'
   sold,32[(mi' fad mi)] red16 mi dod mi
   si32[(mi fad mi)] red16 mi la, mi'

   %108
   sold,16 mi32(fad sold[la si dod)] re16 re
   mid,\noBeam re'8 dod16\noBeam ~dod32 si la sold
   la(sold fad sold) fad8\noBeam r  %%terza riga p 2

   %111
   fad'32(dod sid dod) fad,16[(dod' fad la)]
   sold32[(dod, sid dod)] mid,16 dod' sold' si
   la32[(dod, sid dod)] fad,16 dod' la' dod

   %114
   re32[(dod si dod)] si(la sold la) sold[(fad mid fad)]
   mid(re dod re) dod8\noBeam r\mbreak
   fad32(dod re dod) fad[(dod re dod)] fad(mi re dod)

   %117
   re fad, si fad re'[si fad' re] si'8\noBeam
   mi,32(si dod si) mi[(si dod si)] mi(re dod si)
   dod mi, la mi dod'[la mi' dod] la'8

   %120
   fad8.(sold32 la) sold16[fad]
   mid\noBeam dod8 mid\noBeam  sold16
   fad dod8\noBeam fad la16\noBeam

   %123
   sold\noBeam dod,8 sold'\noBeam si16
   \tuplet 3/2 { la sold fad} sold4-+
   fad8 la4~

   %126
   la32[la sold la] fad la mi la red,[la' dod, la']
   si,(dod red mi) fad16[fad] fad8-+
   red32(mi fad sol) la16[la] la8-+\mbreak

   %129
   fad32(sol la si) do16[do] do si32 la
   sol(fad mi red) mi16[fad] sol8~
   sol32 sol fad sol mi[sol re sol] dod, sol' si, sol'

   %132
   la,(si dod re) mi16[mi] mi8-+
   dod32(re mi fad) sol16[sol] sol8-+\mbreak
   mi32(fad sol la) si16[si] si la32 sol

   %135
   fad(mi re dod) re[(mi fad sol)] la16 la,
   si32(mi sol fad) mi16[re dod si]
   \grace si8 lad8. fad16 lad dod

   %138
   \grace dod8 si8. fad16 si re
   \grace re8 dod8. fad,16 dod' mi\mbreak
   re32 si(dod re mi[fad sol lad)] si16. fad32

   %141
   sol(mi re dod) dod4-+
   re4 r8
   R4.*8

   %151
   r16 la\solo re fad, mi dod'
   re, la' re fad mi sol
   fad re fad la sol si

   %154
   la re32(dod) si16[la sol fad]\mbreak
   fad8-+ mi la
   sol16 si mi, sol dod, sol'

   %157
   fad la re, fad la, la'
   sol si mi, sol dod, sol'
   fad la re, fad la, la'

   %160
   si, sol' la, fad' sol, mi'
   fad, re' mi, dod' re, re'\mbreak
   si8 dod re~

   %163
   re32  dod (si la) mi'4-+
   re r8
   R4.*32

}

IIIvlIn =  \relative do'' {

   re,8 re' re
   re16 re,32(mi fad16)[re la' re,]
   re'8 re re

   %4
   re16 re,32(mi fad16)[re fad sold]
   la8 la' la
   la16 la,32(si dod16)[la mi' la,]

   %7
   la'8 la la
   la16 la,32(si dod16)[la si dod]
   re8 re' re

   %10
   re16 re,32 (mi fad16)[re la' re,]
   re'8 re re\mbreak
   re16 re,32(mi fad16)[re mi fad]

   %13
   sol8 si si
   si16 mi,32(fad sol16)[mi si' sol]
   la8 la la

   %16
   la16 re,32(mi fad16)[re la' fad]
   sol8 sol sol
   sol16 dod,32(re mi16)[dod sol' mi]

   %19
   \terzine \tuplet 3/2 { fad sol la } la[la la  la]
   \tuplet 3/2 { fad sol la } la[la la  la]
   \tuplet 3/2 { fad sol la } la[la la  la]

   %22
   \tuplet 3/2 { fad sol la } la[la la  la]
   si8 si dod
   re re, sol\mbreak

   %25
   fad16(la fad re mi sol)
   fad16(la fad re mi sol)
   fad16(la fad re mi dod)

   %28
   re8 re, sol
   fad16(la fad re mi sol)
   fad16(la fad re mi sol)

   %31
   fad16(la fad re mi dod)
   <fad' la, re,>8 <fad la, re,> <fad la, re,>
   <fad la, re,>4 r8 %%%fine ripresa

   %34
   fad,\p la sol
   fad4 r8
   fad la sol

   %37
   fad4 r8
   fad la re
   re-+ dod r

   %40
   dod, mi re
   dod4 r8
   dod mi re\mbreak

   %43
   dod4 r8
   dod' mi la
   la sold r

   %46
   R4.*4
   r8 dod,, la
   re fad dod

   %52
   la4 la'8
   si sold mi
   la4 r8

   %55
   mi' mi mi
   fad4 r8
   la la la

   %58
   si4 r8
   R4.*6
   r8 r fad,

   %66
   sol dod, re
   la' la, r
   R4.*13

   %81
   la'8 la' la
   la16 la,32(si dod16)[la mi' la,]
   la'8 la la

   %84
   la16 la,32(si dod16) [la dod red]\mbreak
   mi8 mi mi
   mi16 mi,32(fad sold16)[mi si' mi,]

   %87
   mi'8 mi mi
   mi16 mi,32(fad sold16) [mi fad sold]
   la8 la' la

   %90
   la16 la,32(si dod16)[la mi' la,]
   la'8 la la
   la16 la,32(si dod16) [la si dod]

   %93
   re8 fad fad
   fad16 si,32(dod re16)[si fad' re]
   mi8 mi mi

   %96
   mi16 la,32(si dod16)[la mi' dod]
   re8 re re
   re16 sold,32(la si16)[sold re' si]

   %99
   dod4 r8\mbreak
   R4.*10
   fad,8 la dod

   %111
   fad, fad fad
   mid mid mid
   fad fad fad

   %114
   si si sid
   dod dod, r
   R4.*9

   %125
   r8 fad mi
   red4 r8
   red8. dod16 si32[(dod red mi)]

   %128
   fad8.[mi16] red32(mi fad sol)
   la8 fad red
   mi r mi16 re!

   %131
   dod4 r8
   dod8.[si16] la32(si dod re)\mbreak
   mi8.[re16]dod32(re mi fad)

   %134
   sol8 mi dod
   re4 r8
   R4.*6

   %142
   si'8 si' si
   si16 si,32(dod re16)[si fad' si,]
   si'8 si la

   %145
   sold4 r8
   mi mi mi
   mi16 mi,32(fad sold16) [mi si' mi,]

   %148
   la8 la' la
   la16 la,32(si dod16) [la mi' la,]
   la'8 la sol

   %151
   fad4 r8
   R4.*12
   re,8 re' re

   %165
   re16 re,32(mi fad16)[re la' re,]
   re'8 re re
   re16 re,32(mi fad16)[re fad sold]

   %168
   la8 la' la
   la16 la,32(si dod16)[la mi' la,]
   la'8 la la

   %171
   la16 la,32(si dod16)[la si dod]
   re8 re' re
   re16 re,32 (mi fad16)[re la' re,]

   %174
   re'8 re re\mbreak
   re16 re,32(mi fad16)[re mi fad]
   sol8 si si

   %177
   si16 mi,32(fad sol16)[mi si' sol]
   la8 la la
   la16 re,32(mi fad16)[re la' fad]

   %180
   sol8 sol sol
   sol16 dod,32(re mi16)[dod sol' mi]
   \terzine \tuplet 3/2 { fad sol la } la[la la  la]

   %183
   \tuplet 3/2 { fad sol la } la[la la  la]
   \tuplet 3/2 { fad sol la } la[la la  la]
   \tuplet 3/2 { fad sol la } la[la la  la]

   %186
   si8 si dod
   re re, sol\mbreak
   fad16(la fad re mi sol)

   %189
   fad16(la fad re mi sol)
   fad16(la fad re mi dod)
   re8 re, sol

   %192
   fad16(la fad re mi sol)
   fad16(la fad re mi sol)
   fad16(la fad re mi dod)

   %195
   <fad' la, re,>8 <fad la, re,> <fad la, re,>
   <fad la, re,>4\fermata r8 %%%fine ripresa

}

IIIvlIIn = \relative do'' {

   R4.
   re,8 re' re
   re16 re,32(mi fad16)[re la' re,]

   %4
   re'8 re re
   dod4 r8
   la8 la' la

   %7
   la16 la,32(si dod16)[la mi' la,]
   la'8 la sol!
   fad4 r8

   %10
   re8 re' re
   re16 re,32 (mi fad16)[re la' re,]
   re'8 re do

   %13
   si4 r8\mbreak
   r mi, mi
   mi16 la,32(si dod16)[la mi' dod]

   %16
   re8 re re
   re16 sol,32(la si16)[sol re' si]
   dod8 dod dod

   %19
   \tuplet 3/2 {re16 mi fad} fad[fad fad fad]
   \tuplet 3/2 {re16 mi fad} fad[fad fad fad]
   \tuplet 3/2 {re16 mi fad} fad[fad fad fad]

   %22
   \tuplet 3/2 {re16 mi fad} fad[fad fad fad]
   sol8 sol mi
   fad4 re8\mbreak

   %25
   re16(fad re la dod mi)
   re(fad re la dod mi)
   re(fad re la sol mi)

   %28
   fad4 re8
   re16(fad re la dod mi)
   re(fad re la dod mi)

   %31
   re(fad re la' sol mi)
   <fad' la, re,>8 <fad la, re,> <fad la, re,>
   <fad la, re,>4 r8 %%%fine ripresa

   %34
   re,\p fad mi
   re4 r8
   re fad mi

   %37
   re4 r8\mbreak
   re re re
   la' la, r

   %40
   la dod si
   la4 r8
   la dod si

   %43
   la4 r8
   la la la
   mi' mi r

   %46
   R4.*4
   r8 dod la
   re fad re

   %52
   la4 la'8
   si sold mi
   la4 r8

   %55
   dod dod dod
   re4 r8\mbreak
   fad fad fad

   %58
   sol4 r8
   R4.*6
   r8 r fad,

   %66
   sol dod, re
   la' la, r
   R4.*14

   %82
   la'8 la' la
   la16 la,32(si dod16)[la mi' la,]
   la'8 la la

   %85
   sold4 r8
   mi,8 mi' mi
   mi16 mi,32(fad sold16)[mi si' mi,]

   %88
   mi'8 mi re!
   dod4 r8
   la8 la' la

   %91
   la16 la,32(si dod16)[la mi' la,]
   la'8 la sol!
   fad4 r8

   %94
   r si si
   si16 mi,32(fad sold16)[mi si' sold]
   la8 la la

   %97
   la16 re,32(mi fad16)[re la' fad]
   sold8 sold sold
   la4 r8

   %100
   R4.*10\mbreak
   fad,8 la dod
   fad, fad fad

   %112
   mid mid mid
   fad fad fad
   si si sid

   %115
   dod dod, r
   R4.*9
   r8 fad mi

   %126
   red4 r8
   red8. dod16 si32[(dod red mi)]
   fad8.[mi16] red32(mi fad sol)

   %129
   la8 fad red
   mi r mi16 re!
   dod4 r8

   %132
   dod8.[si16] la32(si dod re)\mbreak
   mi8.[re16]dod32(re mi fad)
   sol8 mi dod

   %135
   re4 r8
   R4.*7
   si'8 si' si

   %144
   si16 si,32(dod re16)[si fad' si,]
   mi8 mi mi
   mi16 mi,32(fad sold16) [mi si' mi,]

   %147
   mi'8 mi re
   dod4 r8
   la8 la' la

   %150
   la16 la,32(si dod16) [la mi' la,]
   re4 r8
   R4.*12

   %164
   R4.
   re,8 re' re
   re16 re,32(mi fad16)[re la' re,]

   %167
   re'8 re re
   dod4 r8
   la8 la' la

   %170
   la16 la,32(si dod16)[la mi' la,]
   la'8 la sol!
   fad4 r8

   %173
   re8 re' re
   re16 re,32 (mi fad16)[re la' re,]
   re'8 re do

   %176
   si4 r8\mbreak
   r mi, mi
   mi16 la,32(si dod16)[la mi' dod]

   %179
   re8 re re
   re16 sol,32(la si16)[sol re' si]
   dod8 dod dod

   %182
   \tuplet 3/2 {re16 mi fad} fad[fad fad fad]
   \tuplet 3/2 {re16 mi fad} fad[fad fad fad]
   \tuplet 3/2 {re16 mi fad} fad[fad fad fad]

   %185
   \tuplet 3/2 {re16 mi fad} fad[fad fad fad]
   sol8 sol mi
   fad4 re8\mbreak

   %188
   re16(fad re la dod mi)
   re(fad re la dod mi)
   re(fad re la sol mi)

   %191
   fad4 re8
   re16(fad re la dod mi)
   re(fad re la dod mi)

   %194
   re(fad re la' sol mi)
   <fad' la, re,>8 <fad la, re,> <fad la, re,>
   <fad la, re,>4\fermata r8 %%%fine ripresa

}

IIIvlan =  \relative do' {

   fad8 fad fad
   fad fad fad
   fad fad fad

   %4
   fad fad si
   mi, dod dod
   dod dod dod

   %7
   dod dod dod
   dod dod mi
   la, fad' fad

   %10
   fad fad fad
   fad fad fad\mbreak
   fad fad la

   %13
   re, sol sol
   sol sol sol
   fad fad fad

   %16
   fad fad fad
   mi mi mi
   mi mi mi

   %19
   re4 r8
   R4.
   re'8 re re

   %22
   dod dod dod
   si si la\mbreak
   la la si

   %25
   la la la
   la la la
   la la la

   %28
   la4 la,8
   la la la
   la la la

   %31
   la la la
   la la' fad
   re4 r8 %% fine ripresa

   %34
   re8\p fad mi
   re4 r8\mbreak
   re fad mi

   %37
   re4 r8
   re re re
   la' la, r

   %40
   la dod si
   la4 r8
   la dod si

   %43
   la4 r8
   la la la
   mi' mi, r

   %46
   R4.*4
   r8 dod' la
   re fad re

   %52
   la4 la'8\mbreak
   si sold mi
   la4 r8

   %55
   la la la
   la4 r8
   re, re re

   %58
   re4 r8
   R4.*6
   r8 r fad

   %66
   sol dod, re
   la' la, r
   R4.*13

   %81
   dod8 dod dod
   dod dod dod\mbreak
   dod dod dod

   %84
   dod dod fad
   si, sold' sold
   sold? sold sold

   %87
   sold? sold sold
   sold? sold si
   mi, dod dod

   %90
   dod dod dod
   dod dod dod
   dod dod mi

   %93
   la, re re
   re re re\mbreak
   dod dod dod

   %96
   dod dod dod
   si si si
   si si si

   %99
   la4 r8
   R4.*10
   fad'8 la dod

   %111
   fad, fad fad
   mid mid mid
   fad fad fad

   %114
   si si sid
   dod dod, r
   R4.*9

   %125
   r8 fad\p mi\mbreak
   red4 r8
   red?8. dod16 si32[(dod red mi)]

   %128
   fad8. mi16 red32[(mi fad sol)]
   la8 fad red
   mi r mi16 re!

   %131
   dod4 r8
   dod8. si16 la32[(si dod re)]
   mi8. re16 dod32[(re mi fad)]

   %134
   sol8 mi dod
   re4 r8\mbreak
   R4.*6

   %142
   re8 re re
   re re re
   re fad si

   %145
   si sold sold
   sold? sold sold
   sold? sold mi

   %148
   mi dod dod
   dod dod dod
   dod dod la'

   %151
   la4 r8
   R4.*12
   fad8 fad fad

   %165
   fad fad fad
   fad fad fad
   fad fad si

   %168
   mi, dod dod
   dod dod dod
   dod dod dod

   %171
   dod dod mi
   la, fad' fad
   fad fad fad

   %174
   fad fad fad\mbreak
   fad fad la
   re, sol sol

   %177
   sol sol sol
   fad fad fad
   fad fad fad

   %180
   mi mi mi
   mi mi mi
   re4 r8

   %183
   R4.
   re'8 re re
   dod dod dod

   %186
   si si la\mbreak
   la la si
   la la la

   %189
   la la la
   la la la
   la4 la,8

   %192
   la la la
   la la la
   la la la

   %195
   la la' fad
   re4\fermata r8 %% fine ripresa

}

IIIbcn = \relative do {

   re8 re re
   re re re
   re re re

   %4
   re re si
   la la la
   la la la

   %7
   la la la
   la fad' mi
   re re re

   %10
   re re re
   re re re
   re si' la

   %13
   sol sol sol\mbreak
   dod dod dod
   fad, fad fad

   %16
   si si si
   mi, mi mi
   la la la

   %19
   re, re' re
   dod dod dod
   si si si

   %22
   la la la
   sol sol sol
   fad fad sol

   %25
   la la la\mbreak
   la la la
   la la la

   %28
   re, fad, sol
   la la la
   la la la

   %31
   la la la
   re re, re
   re4 r8 %%%%% fine ripresa

   %34
   R4.*11
   mi'8 sold si
   mi,4 sold8

   %47
   la dod, la
   mi'4 mi8
   fad red si

   %50
   mi4 r8
   R4.*4
   la,8 la la

   %56
   re4 r8
   re re re
   sol4 r8

   %59
   fad4 r8
   mi4 r8
   re4 r8

   %62
   dod la dod
   re4 fad8
   sol4 sold8\mbreak

   %65
   la la, r
   R4.
   r8 la' sol

   %68
   fad4 fad8
   sol4 sold8
   la4 lad8

   %71
   si4 si8
   dod4 dod8
   re4 re,8

   %74
   mi sold mi
   dod la la'
   sold mi sold

   %77
   la re, mi
   dod la la'
   sold mi sold\mbreak

   %80
   la re, mi
   la, la la
   la la la

   %83
   la la la
   la la' fad
   mi mi mi

   %86
   mi mi mi
   mi mi mi
   mi dod si

   %89
   la la la
   la la la
   la la la

   %92
   la fad' mi\mbreak
   re re re
   sold sold sold

   %95
   dod, dod dod
   fad fad fad
   si, si si

   %98
   mi mi mi
   la,4 mi'8
   dod la sold

   %101
   la4 mi'8
   la dod, la
   re4 red8

   %104
   mi4 la8
   sold4 fad8
   mi4 la8\mbreak

   %107
   sold4 fad8
   mi4 re!8
   dod mid dod

   %110
   fad4 r8
   R4.*4
   r8 dod si

   %116
   lad lad lad
   si si si
   sold sold sold

   %119
   la la la
   re re si
   dod dod si

   %122
   la fad fad'
   mid mid dod\mbreak
   fad si, dod

   %125
   fad4 r8
   R4.*9
   r8 fad re

   %136
   sol4 sol8
   fad fad mi
   re re si

   %139
   lad lad fad'
   si, dod! re
   mi fad fad,

   %142
   si si si
   si si si
   si si red

   %145
   mi mi mi
   mi mi mi
   mi mi sold

   %148
   la la la\mbreak
   la la la
   la la dod,

   %151
   re4 la'8
   fad re dod
   re4 mi8

   %154
   fad4 sol8
   la la, fad'
   mi dod la

   %157
   re fad re
   mi dod la
   re fad re

   %160
   sol fad mi
   re mi fad
   sol la si

   %163
   la4 la,8
   re re re
   re re re

   %166
   re re re
   re re si
   la la la
   la la la

   %170
   la la la
   la fad' mi
   re re re

   %173
   re re re
   re re re
   re si' la

   %176
   sol sol sol\mbreak
   dod dod dod
   fad, fad fad

   %179
   si si si
   mi, mi mi
   la la la

   %182
   re, re' re
   dod dod dod
   si si si

   %185
   la la la
   sol sol sol
   fad fad sol

   %188
   la la la\mbreak
   la la la
   la la la

   %191
   re, fad, sol
   la la la
   la la la

   %194
   la la la
   re re, re
   re4\fermata r8 %%%%% fine ripresa

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s4.*3
   s4 <6+>8
   s4.*3
   s8 <5> <6>
   s4.*3
   s8 <5> <6>
   s4.
   <7>
   <7>
   <7>
   <7>
   <7>
   s4.*4
   s8 s <6 4 2>
   <6>4.
   <6 4>4 <7 5>8
   <6 4>4 <7 5>8
   <6 4>4 <7 5>8
   s8 <6>4
   <6 4>4 <7 5>8
   <6 4>4 <7 5>8
   <6 4>4 <7 5>8
   s4.*13
   <_+>4.
   <7 _+>4 <6 5>8
   s8 <6>4
   <_+>4.
   s8 <6 5> <7 _+>
   <_+>4.
   s4.*4
   s4 <7!>8
   s4.
   s4 <7!>8
   s4.
   <6>
   <6>
   s
   <6>
   s4 <6>8
   <9> <8> <7>
   <6 4> <5 3> s
   s4.*2
   <6>4.
   s4 <6>8
   s4 <6>8
   s4 <6>8
   s4 <6>8
   s4 <6>8
   <_+>4.
   <6>
   <6>
   s8 <6 5> <_+>
   <6>4.
   <6>
   s8 <6 5> <_+>
   s4.*3
   s4 <5+>8
   <_+>4.
   s
   s
   s8 <5> <6+>
   s4.*3
   s8 <5> <6>
   s4.
   <7>
   <7>
   <7>
   <7>
   <7 _+>
   s4 <_+>8
   <6> s <6>
   s4 <_+>8
   s <6> s
   s4 <6 5>8
   s4.
   <6>4 <6+>8
   s4.
   <6>4 <6+>8
   s4 <6>8
   <7 _+> s s
   s4.*5
   s8 <_+> s
   <6>4.
   s
   <6>
   s
   s4 <6+>8
   <_+>4.
   <6>
   <6>
   s8 <6+ 5> <_+>
   s4.*10
   s8 <6>4
   s <6>8
   <_+>4.
   <6>
   <6>
   s8 <6+> <6>
   <6 5> <4> <_+>
   s4.*2
   s4 <6 5>8
   <_+>4.
   s
   s4 <6 5>8
   s4.*2
   s4 <6 5>8
   s4.
   <6>4 <6>8
   s4 <6>8
   <6>4 <6 5>8
   s s <6>
   <6> <6> <7>
   s <6> s
   <6> <6> <7>
   s <6> s
   s <6> <6>
   s <6> <6>
   <6 5>4.
   <4>4<3>8
   s4.*3
   s4 <6+>8
   s4.*3
   s8 <5> <6>
   s4.*3
   s8 <5> <6>
   s4.
   <7>
   <7>
   <7>
   <7>
   <7>
   s4.*4
   s8 s <6 4 2>
   <6>4.
   <6 4>4 <7 5>8
   <6 4>4 <7 5>8
   <6 4>4 <7 5>8
   s8 <6>4
   <6 4>4 <7 5>8
   <6 4>4 <7 5>8
   <6 4>4 <7 5>8

}

forma = {

   \key re\major
   \time 3/8
   \tempo 4. = 50
   s4.*196
   \bar"|."

}

IIIfl = {
   \IIIglobal
   %\notypeset
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

IIIbc = {
   \IIIglobal
   \clef bass
   <<\IIIbcn \forma \IIIbfn>>
   \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper {

   systems-per-page = #3
   print-first-page-number = ##t
   first-page-number = #2

}

\markup \huge {"[1.] Allegro"}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   } <<

      \new Staff  <<
         \set Staff.instrumentName = \markup  \center-column{"Flauto""Traversiero"}
         \Ifl
      >>

      \new PianoStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
            \IvlI
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
            \IvlII
         >>
      >>

      \new Staff <<
         \set Staff.midiInstrument = #"viola"
         \set Staff.instrumentName = \markup \center-column{"Viola"}
         \Ivla
      >>

      \new Staff <<
         \set Staff.midiInstrument = #"cello"
         \set Staff.instrumentName = \markup \center-column{"Basso"}
         \Ibc
      >>
   >>

   \layout {

      indent = 2\cm


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

\pageBreak

\markup \huge {"[2.] Andante"}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   } <<

      \new Staff  <<
         \IIfl
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

   \layout {

      indent = 1\cm


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

\pageBreak

\markup \huge {"[3.] Allegro"}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   } <<

      \new Staff  <<
         \IIIfl
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

   \layout {

      indent = 1\cm

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
