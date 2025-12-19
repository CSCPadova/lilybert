\language "italiano"
	%********************************** VARIABILI
\version "2.24.0"

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
      \musicglyph "scripts.prall"}}

%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \senza
}

Ifln = \relative do'' {

   re16 (dod re4) re8
   re16 (dod re4) re8
   re mi16(fad) sol8 fad32(sol la16)

   %4
   re,16 (dod re4) re8
   re16 (dod re4) re8
   re mi16(fad sol8) fad

   %7
   si32(la) si8. la32(sol) la8.
   sol32(fad) sol8. fad32(mi) fad8.
   mi32(re) mi8. re32(dod) re8.\mbreak

   %10
   dod8[fad mi re]
   dod8[fad mi re]
   dod16 la' fad la mi la re, la'

   %13
   dod, la' fad la mi la re, la'
   dod,8. \tuplet 3/2 { mi32 fad sold } la8 re,
   dod4 si

   %16
   la r
   re16 (dod re4) re8
   re16 (dod re4) re8  %%% ripresa

   %19
   re16 mi fad sol la8 do,\mbreak
   si16 la sol8 r4
   mi'16(red mi4) mi8

   %22
   mi16(red mi4) mi8
   mi16 fad sold la si8 re,
   dod16 si la8 r mi'\p

   %25
   fa(mi) mi4~
   mi8[sol fa mi]
   fa mi mi4~

   %28
   mi8 [sol fa mi]
   fa[(mi) fa(mi)]
   fa2\tr

   %31
   mi8\f [la re, la']
   dod,[la' si, la']
   la,2\tr~

   %34
   la8[fad' sol, mi']
   fad,[si la sol]
   fad[si la sol]

   %37
   fad16 re' si re la re sol, re'
   fad, re' si re la re sol, re'
   fad, re mi fad sol la si dod\mbreak

   %40
   re mi fad sol la fad sol la
   si32(la) si8. la32(sol) la8.
   sol32(fad) sol8. fad32(mi) fad8.

   %43
   mi32(re) mi8. re32(dod) re8.
   dod8 si16 la re8 sol
   fad4 mi~

   %46
   mi8[la, re sol]
   fad4 mi~
   mi8[la, re sol,]

   %49
   fad4 mi\mbreak
   re4\fermata r  %%%%%%% fine ripresa
   re'16\solo(dod re4) re8

   %52
   re16(dod re4) re8
   re mi16(fad) sol8 fad32(sol la16)
   re,16(dod re4) re8

   %55
   re16(dod re4) re8
   re mi16(fad) sol8 fad
   si32(la) si8. la32(sol) la8.

   %58
   sol32(fad) sol8. fad32(mi) fad8.\mbreak
   mi32(re) mi8. re32(dod) re8.
   dod32(si) la8. fad'8(la)

   %61
   mi[(la) re,(la')]
   dod,32(si) la8. fad'8(la)
   mi[(la) re,(la')]

   %64
   dod,32(si) la8. r8 mi'
   fad32(mi) fad8. mi32(re) mi8.
   re32(dod) re8. dod32(si) dod8.

   %67
   si32(la) si8. la32(sold) la8.\mbreak
   \con\terzinequarto  \tuplet 3/2 {
      sold8(si dod) re(dod si)
      \senza dod mi la dod, si la

      %70
      sold si dod re dod si
      dod mi la dod, si la
      sold si dod re dod si

      %73
      dod mi fad sol fad mi
      fad re mi fad sold la
      sold la si mi, fad red\mbreak

      %76
      mi fad red mi fad red
      mi sold si mi, re? dod
      re mi dod re mi dod

      %79
      re sold si re, dod si
      dod re si dod re si
      dod mi la dod, si la

      %82
      \con sold(si dod)
   } re4~
   \tuplet 3/2 { re8 (si dod) } re4~\mbreak
   \tuplet 3/2 { re8(si dod) } re4~

   %85
   \tuplet 3/2 {
      re8(mi fad) mi(fad re)
      \senza dod mi la
   } si,4
   la r

   %88
   la16\tu(sold la4) la8
   la si16(dod) re8 dod32(re mi16)
   la,16(sold la4) la8

   %91
   la16(sold la4) la8
   la si16 (dod)\mbreak re8 dod
   fad32(mi) fad8. mi32(re) mi8.

   %94
   re32(dod) re8. dod32(si) dod8.
   si32(la) si8. la32(sold) la8.
   sold8[dod si la]

   %97
   sold[dod si la]
   sold16 mi' dod mi si mi la, mi'
   sold, mi' dod mi si mi la, mi'\mbreak

   %100
   sold, mi fad sold la si dod re
   mi mi, fad sold la si dod re
   mi la fad la mi la re, la'

   %103
   dod, la' fad la mi la re, la'
   dod,8. \senza \tuplet 3/2 { mi32 fad sold } la8 re,
   dod4 si~

   %106
   si8 mi, la re
   dod4 si~
   si8 mi, \mbreak la re,

   %109
   dod4 si
   la r
   la'16\solo(sold la4) la8

   %112
   la16(sold la4) la8
   la si16(dod) re8 dod32(re mi16)
   la,16(sold la4) la8

   %115
   la16(sold la4) la8
   la si16 (dod)\mbreak re8 dod
   fad32(mi) fad8. mi32(re) mi8.

   %118
   re32(dod) re8. dod32(si) dod8.
   si32(la) si8. la32(sold) la8.
   sold32(fad) mi8. dod'8[(mi)]

   %121
   si[(mi) la, (mi')]
   sold,32(fad) mi8. dod'8[(mi)]
   si[(mi) la, (mi')]

   %124
   sold,32(fad) mi8. fad'8 (la)
   mi[(la) re, (la')]\mbreak %% fine pagina
   dod,32(si) la8. fad'8 (la)
   mi[(la) re, (la')]
   dod,32(si) la8. r4

   %129
   re16(dod re) la' do,(si do) la'
   si,(la si) sol' sol,(fad sol) si
   mi(red mi) si' re,(dod re) si'

   %132
   dod,(si dod) la' la,(sold la) dod
   fad(mi fad) dod' mi,(re mi) dod'\mbreak
   re,(dod re) si' si,(lad si) re

   %135
   sol(fad sol) mi' fad,(mi fad) re'
   mi,(re mi) dod' re,(dod re) si'
   dod,(si dod) re si(lad si) sol'

   %138
   lad,4 r
   fad'32\tu(mi) fad8. fad32(mi) fad8.
   si,8 dod16(red mi8 fad)

   %141
   sol32 (fad) mi8. r4
   si32(la) si8.\mbreak si32(la) si8.
   mi32(re) mi8. mi32(re) mi8.

   %144
   la,8 si16(dod re8 mi)
   fad32(mi) re8. r4
   sol32(fad) sol8. fad32(mi) fad8.

   %147
   mi32(re) mi8. re32(dod) re8.
   dod32(si) dod8. si32(lad) si8.
   lad8 sold16 (fad) si8 mi

   %150
   re4\mbreak dod~
   dod8[fad, si mi]
   re4 dod~

   %153
   dod8[fad si mi,]
   re4 dod
   si4 r8 fad'\solo

   %156
   \con \tuplet 3/2 {
      red(fad sol) la(sol fad)
      \senza sol(la si) mi, fad re
      dod mi fad sol fad mi

      %159
      fad sol la re, mi dod\mbreak
      si re mi fad mi re
      mi fad sol dod, re si

      %162
      lad dod re mi re dod
      re mi fad si, dod la
      sold si dod re dod si

      %165
      dod re mi la, si sol!
   }
   fad4 r
   R2*2\mbreak

   %169
   re'16(dod re4) re8
   re16(dod re4) re8
   re mi16(fad sol8) fad

   %172
   si32(la) si8. la32(sol) la8.
   sol32(fad) sol8. fad32(mi) fad8.
   mi32(re) mi8. re32(dod) re8.

   %175
   dod32(si) la8. r8 mi'
   fa(mi) mi4~
   mi8[sol fa mi]

   %178
   fa mi mi4~
   mi8 [sol fa mi]
   fa[(mi) fa(mi)]

   %181
   fa2\tr
   mi4 r8 mi
   la16(sol) fad4.

   %184
   fad16(mi) re4.
   re16 mi fad sol la8 do,
   si16 (la) sol4.

   %187
   si'16(la) sold4.
   sold?16(fad) mi4.\mbreak
   mi16 fad sold la si8 re,

   %190
   dod32(si) la8. fad'8(la)
   mi[(la) re,(la')]
   dod,32(si) la8. fad'8(la)

   %193
   mi[(la) re,(la')]
   dod,32(si) la8. si8(re)
   la[(re) sol,(re')]

   %196
   fad,32(mi) re8. si'8(re)
   la[(re) sol,(re')]\mbreak
   fad,16 re mi fad sol la si dod

   %199
   re mi fad sol la fad sol la
   si32(la) si8. la32(sol) la8.
   sol32(fad) sol8. fad32(mi) fad8.

   %202
   mi32(re) mi8. re32(dod) re8.
   dod8 si16 la re8 sol
   fad4 mi~

   %205
   mi8[la, re sol]
   fad4 mi~
   mi8[la re sol,]

   %208
   fad4 mi\mbreak
   re4 r
   re16 (dod re4) re8  %%% ripresa

   %211
   re16 mi fad sol la8 do,\mbreak
   si16 la sol8 r4
   mi'16(red mi4) mi8

   %214
   mi16(red mi4) mi8
   mi16 fad sold la si8 re,
   dod16 si la8 r mi'\p

   %217
   fa(mi) mi4~
   mi8[sol fa mi]
   fa mi mi4~

   %220
   mi8 [sol fa mi]
   fa[(mi) fa(mi)]
   fa2\tr

   %223
   mi8\f [la re, la']
   dod,[la' si, la']
   la,2\tr~

   %226
   la8[fad' sol, mi']
   fad,[si la sol]
   fad[si la sol]

   %229
   fad16 re' si re la re sol, re'
   fad, re' si re la re sol, re'
   fad, re mi fad sol la si dod\mbreak

   %232
   re mi fad sol la fad sol la
   si32(la) si8. la32(sol) la8.
   sol32(fad) sol8. fad32(mi) fad8.

   %235
   mi32(re) mi8. re32(dod) re8.
   dod8 si16 la re8 sol
   fad4 mi~

   %238
   mi8[la, re sol]
   fad4 mi~
   mi8[la, re sol,]

   %241
   fad4 mi\mbreak
   re4\fermata r  %%%%%%% fine ripresa

}

IvlIn = \relative do'' {

   re16 (dod re4) re8
   re16 (dod re4) re8
   re mi16(fad) sol8 fad32(sol la16)

   %4
   re,16 (dod re4) re8
   re16 (dod re4) re8
   re mi16(fad sol8) fad

   %7
   si32(la) si8. la32(sol) la8.
   sol32(fad) sol8. fad32(mi) fad8.
   mi32(re) mi8. re32(dod) re8.\mbreak

   %10
   dod8[fad mi re]
   dod8[fad mi re]
   dod16 la' fad la mi la re, la'

   %13
   dod, la' fad la mi la re, la'
   dod,8. \tuplet 3/2 { mi32 fad sold } la8 re,
   dod4 si

   %16
   la r
   re16 (dod re4) re8
   re16 (dod re4) re8  %%% ripresa

   %19
   re16 mi fad sol la8 do,\mbreak
   si16 la sol8 r4
   mi'16(red mi4) mi8

   %22
   mi16(red mi4) mi8
   mi16 fad sold la si8 re,
   dod16 si la8 r mi'\p

   %25
   fa(mi) mi4~
   mi8[sol fa mi]
   fa mi mi4~

   %28
   mi8 [sol fa mi]
   fa[(mi) fa(mi)]
   fa2\tr

   %31
   mi8\f [la re, la']
   dod,[la' si, la']
   la,2\tr~

   %34
   la8[fad' sol, mi']
   fad,[si la sol]
   fad[si la sol]

   %37
   fad16 re' si re la re sol, re'
   fad, re' si re la re sol, re'
   fad, re mi fad sol la si dod\mbreak

   %40
   re mi fad sol la fad sol la
   si32(la) si8. la32(sol) la8.
   sol32(fad) sol8. fad32(mi) fad8.

   %43
   mi32(re) mi8. re32(dod) re8.
   dod8 si16 la re8 sol
   fad4 mi~

   %46
   mi8[la, re sol]
   fad4 mi~
   mi8[la, re sol,]

   %49
   fad4 mi\mbreak
   re4\fermata r  %%%%%%% fine ripresa
   re'8\p[dod si la]\mbreak

   %52
   si[la sol fad]
   sol[fad mi re]
   re'[dod si la]\mbreak

   %55
   si[la sol fad]
   sol[fad mi re]
   sol4 fad

   %58
   mi re
   sol, sold
   la re

   %61
   dod si\mbreak
   la re
   dod si

   %64
   la r
   R2*22
   la'16\f(sold la4) la8

   %88
   la16(sold la4) la8
   la si16(dod) re8 dod32(re mi16)
   la,16(sold la4) la8

   %91
   la16(sold la4) la8
   la si16 (dod)\mbreak re8 dod
   fad32(mi) fad8. mi32(re) mi8.

   %94
   re32(dod) re8. dod32(si) dod8.
   si32(la) si8. la32(sold) la8.
   sold8[dod si la]

   %97
   sold[dod si la]
   sold16 mi' dod mi si mi la, mi'
   sold, mi' dod mi si mi la, mi'\mbreak

   %100
   sold, mi fad sold la si dod re
   mi mi, fad sold la si dod re
   mi la fad la mi la re, la'

   %103
   dod, la' fad la mi la re, la'
   dod,8. \senza \tuplet 3/2 { mi32 fad sold } la8 re,
   dod4 si~

   %106
   si8 mi, la re
   dod4 si~
   si8 mi, \mbreak la re,

   %109
   dod4 si
   la r
   R2*27

   %138
   dod'32(si) dod8. dod32(si) dod8.
   fad32(mi) fad8. fad32(mi) fad8.
   si,8 dod16(red mi8 fad)

   %141
   sol32 (fad) mi8. r4
   si32(la) si8.\mbreak si32(la) si8.
   mi32(re) mi8. mi32(re) mi8.

   %144
   la,8 si16(dod re8 mi)
   fad32(mi) re8. r4
   sol32(fad) sol8. fad32(mi) fad8.

   %147
   mi32(re) mi8. re32(dod) re8.
   dod32(si) dod8. si32(lad) si8.
   lad8 sold16 (fad) si8 mi

   %150
   re4\mbreak dod~
   dod8[fad, si mi]
   re4 dod~

   %153
   dod8[fad si mi,]
   re4 dod
   si r
   R2*10

   %166
   re16(dod re4) re8
   re16(dod re4) re8
   re mi16(fad) sol8 fad32 (sol la16)

   %169
   re,8\p[dod si la]
   si[la sol fad]
   sol[fad mi re]

   %172
   sol4 fad
   mi re\mbreak
   sol sold

   %175
   la r8 dod
   re dod dod4~
   dod8[mi re dod]

   %178
   re dod dod4~
   dod8[mi re dod]
   re[(dod) re (dod)]

   %181
   re2\tr
   dod4 r
   R2*26

   %109
   re16(dod re4) re8
   re16 (dod re4) re8  %%% ripresa

   %211
   re16 mi fad sol la8 do,\mbreak
   si16 la sol8 r4
   mi'16(red mi4) mi8

   %214
   mi16(red mi4) mi8
   mi16 fad sold la si8 re,
   dod16 si la8 r mi'\p

   %217
   fa(mi) mi4~
   mi8[sol fa mi]
   fa mi mi4~

   %220
   mi8 [sol fa mi]
   fa[(mi) fa(mi)]
   fa2\tr

   %223
   mi8\f [la re, la']
   dod,[la' si, la']
   la,2\tr~

   %226
   la8[fad' sol, mi']
   fad,[si la sol]
   fad[si la sol]

   %229
   fad16 re' si re la re sol, re'
   fad, re' si re la re sol, re'
   fad, re mi fad sol la si dod\mbreak

   %232
   re mi fad sol la fad sol la
   si32(la) si8. la32(sol) la8.
   sol32(fad) sol8. fad32(mi) fad8.

   %235
   mi32(re) mi8. re32(dod) re8.
   dod8 si16 la re8 sol
   fad4 mi~

   %238
   mi8[la, re sol]
   fad4 mi~
   mi8[la, re sol,]

   %241
   fad4 mi\mbreak
   re4\fermata r  %%%%%%% fine ripresa

}


IvlIIn = \relative do'' {

   re16 (dod re4) re8
   re16 (dod re4) re8
   re mi16(fad) sol8 fad32(sol la16)

   %4
   re,16 (dod re4) re8
   re16 (dod re4) re8
   re mi16(fad sol8) fad

   %7
   sol32(fad) sol8. fad32(mi) fad8.
   mi32(re) mi8. re32(dod) re8.
   dod32(si) dod8. si32(la) si8.

   %10
   la16(sold la4) la8
   la16(sold la4) la8
   la[re dod si]
   
   %13
   la[re dod si]
   la16 si dod re\mbreak mi8 la,
   la4 sold
   
   %16
   la r
   la8[sol fad re]
   do'[la fad re]
   
   %19
   do'[la re, fad]
   sol16 la si do re8 do
   si[la sold mi]
   
   %22
   re' si sold mi\mbreak
   re' si mi, sold
   la4 r8 dod?\p
   
   %25
   re(dod) dod4~
   dod8[mi re dod]
   re(dod) dod4~
   
   %28
   dod8[mi re dod]
   re[(dod) re(dod)]
   re2\tr
   
   %31
   dod8\f [la' re, la']
   dod, [la' si, la']\mbreak
   la,[mi' sol, mi']
   
   %34
   fad,[re' mi, dod']
   re,16 (dod re4) re8
   re16 (dod re4) re8
   
   %37
   re[sol fad mi]
   re[sol fad mi]
   re mi16 fad sol la si dod
   
   %40
   re mi fad sol la re, mi fad\mbreak
   sol32(fad) sol8. fad32(mi) fad8.
   mi32(re) mi8. re32(dod) re8.
   
   %43
   dod32(si) dod8. si32(la) si8.
   la4. \senza \tuplet 3/2 { la16 si dod }
   re4 dod8.\tr la'16
   
   %46
   la,4. \tuplet 3/2 { la16 si dod }
   re4 dod8.\tr la'16
   la, sol fad sol la8 re,\mbreak
   
   %49
   re4 dod
   re\fermata r
   re'8\p[dod si la]\mbreak

   %52
   si[la sol fad]
   sol[fad mi re]
   re'[dod si la]\mbreak

   %55
   si[la sol fad]
   sol[fad mi re]
   sol4 fad

   %58
   mi re
   sol, sold
   la re

   %61
   dod si\mbreak
   la re
   dod si

   %64
   la r
   R2*22
   la'16\f(sold la4) la8

   %88
   la16(sold la4) la8
   la si16(dod) re8 dod32(re mi16)
   la,16(sold la4) la8

   %91
   la16(sold la4) la8
   la si16 (dod)\mbreak re8 dod
   re32(dod) re8. dod32(si) dod8.
   
   %94
   si32(la) si8. la32(sold) la8.
   sold32(fad) sold8. fad32(mi) fad8.\mbreak
   mi16(red mi4) mi8
   
   %97
   mi16(red mi4) mi8
   mi[la sold fad]
   mi[la sold fad]
   
   %100
   mi16(red mi4) si'8
   dod16(si) la4 si8
   dod[re dod si]
   
   %103
   la[re dod si]\mbreak
   la16 si dod re mi mi, fad sold
   la4 sold8. mi'16
   
   %106
   mi,4. \tuplet 3/2 { mi16 fad sold }
   la4 sold8. mi'16
   mi,16 re dod re mi8 la,
   
   %109
   la4 sold
   la r
   R2*27\mbreak
   
   %138
   lad'32(sold) lad8. lad32(sold) lad8.
   lad32(sold) lad8. lad32(sold) lad8.
   fad8 si la! sol?16 fad
   
   %141
   mi4 r
   sold32(fad) sold8. sold32(fad) sold8.
   sold32(fad) sold8. sold32(fad) sold8.\mbreak
   
   %144
   mi8 la sol! fad16 mi
   re4 r
   mi'32(re) mi8. re32(dod) re8.
   
   %147
   dod32(si) dod8. si32(la) si8.
   la32(sold) la8. sol32(fad) sol8.
   fad4. \tuplet 3/2 { fad16 sold lad }
   
   %150
   si4 lad8. fad'16
   fad,4. \tuplet 3/2 { fad16 sold lad? }\mbreak
   si4 lad8. fad'16
   
   %153
   fad,8 re'16 mi fad8 sol,
   si4 lad
   si r
   R2*10

   %166
   re16(dod re4) re8
   re16(dod re4) re8
   re mi16(fad) sol8 fad32 (sol la16)

   %169
   re,8\p[dod si la]
   si[la sol fad]
   sol[fad mi re]

   %172
   sol4 fad
   mi re\mbreak
   sol sold

   %175
   la16(sold la4) la8
   la16(sold la4) la8
   la,16(sold la4) la8
   
   %178
   la16(sold la4) la8\mbreak
   la'16(sold la4) la8
   la16(sold la4) la8
   
   %181
   sold2
   la4 r
   R2*26
   fad8[la fad re]
   
   %210
   do'[la fad re]
   do'[la re, fad]
   sol16 la si do re8 do
   
   %213
   si[la sold mi]
   re' si sold mi\mbreak
   re' si mi, sold
   
   %216
   la4 r8 dod?\p
   re(dod) dod4~
   dod8[mi re dod]
   
   %219
   re(dod) re4~
   re8[mi re dod]
   re[(dod) re(dod)]
   
   %222
   re2\tr
   dod8\f [la' re, la']
   dod, [la' si, la']\mbreak
   
   %225
   la,[mi' sol, mi']
   fad,[re' mi, dod']
   re,16 (dod re4) re8
   
   %228
   re16 (dod re4) re8
   re[sol fad mi]
   re[sol fad mi]
   
   %231
   re mi16 fad sol la si dod
   re mi fad sol la re, mi fad\mbreak
   sol32(fad) sol8. fad32(mi) fad8.
   
   %234
   mi32(re) mi8. re32(dod) re8.
   dod32(si) dod8. si32(la) si8.
   la4. \senza \tuplet 3/2 { la16 si dod }
   
   %237
   re4 dod8.\tr la'16
   la,4. \tuplet 3/2 { la16 si dod }
   re4 dod8.\tr la'16
   
   %240
   la, sol fad sol la8 re,\mbreak
   re4 dod
   re\fermata r

}

Ibrn = \relative do {

   re'8[dod si la]
   si[la sol fad]
   sol[fad mi re]

   %4
   re'8[dod si la]
   si[la sol fad]
   sol[fad mi re]\mbreak

   %7
   r8 sol[re re']
   dod[la re re,]
   r la'[sold mi]

   %10
   la[re dod si]
   la[re dod si]
   la16(sold la4) la8

   %13
   la16(sold la4) la8
   la[mi dod re]\mbreak
   mi[re mi mi,]

   %16
   la'[sol fad mi]
   fad re do'4
   r8 re, do'4

   %19
   r8 re,[fad re]
   sol[la si la]
   sold mi re'4

   %22
   r8 mi, re'4\mbreak
   r8 mi,[sold mi]
   la16(sold la4) la8

   %25
   la16(sold la4) la8
   la,16(sold la4) la8
   la16(sold la4) la8

   %28
   la'16(sold la4) la8
   la16(sold la4) la8
   sold2\mbreak

   %31
   la~
   la~
   la8[mi' sol, mi']

   %34
   fad,[re' mi, dod']
   re,[sol fad mi]
   re[sol fad mi]

   %37
   re16(dod re4) re8
   re16(dod re4) re8
   re4 r\mbreak

   %40
   R2
   r8 sol[re re']
   dod[la re re,]

   %43
   r la'[sold mi]
   la[sol! fad mi]
   re16 mi fad sol la8 sol

   %46
   fad4. mi8
   re16 mi fad sol la8 sol
   fad4. sol8

   %49
   la4 la,\mbreak
   re4\fermata r
   R2*36
   la'8[sold fad mi]

   %88
   fad8[mi re dod]
   re[dod si la]
   la'[sold fad mi]

   %91
   fad[mi re dod]
   re[dod si la]
   r re[la la']

   %94
   sold[mi la la,]\mbreak
   r mi'[red si]
   mi[la sold fad]

   %97
   mi[la sold fad]
   mi16(red mi4) mi8
   mi16(red mi4) mi8

   %100
   mi[re' dod si]
   la[re dod si]
   la16(sold la4) la8\mbreak

   %103
   la16(sold la4) la8
   la mi dod si
   la16 si dod re mi8 re

   %106
   dod4. si8
   la16 si dod re mi8 re
   dod4. re8

   %109
   mi4 mi,
   R2*28
   fad'4 fad,8.\f fad'16

   %139
   mi4 mi,8. mi'16
   red8[si dod red]
   mi[fad sol fad]\mbreak

   %142
   mi4 mi,8. mi'16
   re4 re,8. re'16
   dod8[la si dod]

   %145
   re[mi fad re]
   R2*3
   fad8[mi re dod]

   %150
   si16 dod re mi fad8 mi
   re4. dod8\mbreak
   si16 dod re mi fad8 mi

   %153
   re4. mi8
   fad4 fad,
   R2*11

   %166
   re''8\f[dod si la]
   si[la sol fad]

   %168
   sol[fad mi re]
   R2*40
   r8 re\f do'4

   %210
   r8 re, do'4\mbreak
   re8 re,[fad re]
   sol[la si la]

   %213
   sold mi re'4
   r8 mi, re'4
   r8 mi,[sold mi]

   %216
   la16(sold la4) la8\p
   la16(sold la4) la8
   la,16(sold la4) la8\mbreak

   %219
   la16(sold la4) la8
   la'16(sold la4) la8
   la16(sold la4) la8

   %222
   sold2
   la\f~
   la~

   %225
   la8 [mi' sol, mi']
   fad,[re' mi, dod']
   re,[sol fad mi]\mbreak

   %228
   re[sol fad mi]
   re16(dod re4) re8
   re16(dod re4) re8

   %231
   re4 r
   R2
   r8 sol[re re']

   %234
   dod[la re re,]
   r la'[sold mi]
   la[sol! fad mi]

   %237
   re16 mi fad sol la8 sol
   fad4. mi8
   re16 mi fad sol la8 sol

   %240
   fad4. sol8
   la4 la,
   re4\fermata r

}


Ibcn = \relative do {

   re'8[dod si la]
   si[la sol fad]
   sol[fad mi re]

   %4
   re'8[dod si la]
   si[la sol fad]
   sol[fad mi re]\mbreak

   %7
   r8 sol[re re']
   dod[la re re,]
   r la'[sold mi]

   %10
   la[re dod si]
   la[re dod si]
   la16(sold la4) la8

   %13
   la16(sold la4) la8
   la[mi dod re]\mbreak
   mi[re mi mi,]

   %16
   la'[sol fad mi]
   fad re do'4
   r8 re, do'4

   %19
   r8 re,[fad re]
   sol[la si la]
   sold mi re'4

   %22
   r8 mi, re'4\mbreak
   r8 mi,[sold mi]
   la16(sold la4) la8

   %25
   la16(sold la4) la8
   la,16(sold la4) la8
   la16(sold la4) la8

   %28
   la'16(sold la4) la8
   la16(sold la4) la8
   sold2\mbreak

   %31
   la~
   la~
   la8[mi' sol, mi']

   %34
   fad,[re' mi, dod']
   re,[sol fad mi]
   re[sol fad mi]

   %37
   re16(dod re4) re8
   re16(dod re4) re8
   re4 r\mbreak

   %40
   R2
   r8 sol[re re']
   dod[la re re,]

   %43
   r la'[sold mi]
   la[sol! fad mi]
   re16 mi fad sol la8 sol

   %46
   fad4. mi8
   re16 mi fad sol la8 sol
   fad4. sol8

   %49
   la4 la,\mbreak
   re4\fermata r
   R2*13

   %64
   la'8\p\solo[si dod la]
   re4 dod
   si la

   %67
   re, red
   mi2~
   mi~

   %70
   mi~
   mi~
   mi

   %73
   la\mbreak
   re,
   mi4 r

   %76
   mi mi
   mi r
   mi mi

   %79
   mi r
   mi mi
   mi r

   %82
   mi fad
   sold fad
   mi fad

   %85
   sold mi
   la8[dod re mi]\mbreak
   la,\f\tu[sold fad mi]

   %88
   fad[mi re dod]
   re[dod si la]
   la'[sold fad mi]

   %91
   fad[mi re dod]
   re[dod si la]
   r re[la la']

   %94
   sold[mi la la,]\mbreak
   r mi'[red si]
   mi[la sold fad]

   %97
   mi[la sold fad]
   mi16(red mi4) mi8
   mi16(red mi4) mi8

   %100
   mi[re' dod si]
   la[re dod si]
   la16(sold la4) la8\mbreak

   %103
   la16(sold la4) la8
   la mi dod si
   la16 si dod re mi8 re

   %106
   dod4. si8
   la16 si dod re mi8 re
   dod4. re8

   %109
   mi4 mi,
   r8 la\p\solo [dod mi]\mbreak
   la[sold fad mi]

   %112
   fad[mi re dod]
   re[dod si la]
   la'[sold fad mi]

   %115
   fad[mi re dod]
   re[dod si la]
   re4 dod

   %118
   si la
   re red\mbreak
   mi la

   %121
   sold fad
   mi la
   sold fad

   %124
   mi re
   dod si
   la re'

   %127
   dod si
   la sol
   fad fad

   %130
   sol r
   sold sold\mbreak
   la r

   %133
   lad lad
   si r
   mi re

   %136
   dod si
   mi, sol
   fad fad,8.\f\tu fad'16

   %139
   mi4 mi,8. mi'16
   red8[si dod red]
   mi[fad sol fad]\mbreak

   %142
   mi4 mi,8. mi'16
   re4 re,8. re'16
   dod8[la si dod]

   %145
   re[mi fad re]
   R2*3
   fad8[mi re dod]

   %150
   si16 dod re mi fad8 mi
   re4. dod8\mbreak
   si16 dod re mi fad8 mi

   %153
   re4. mi8
   fad4 fad,
   si8\p\solo[dod re lad]

   %156
   si4 r
   mi sol
   la r

   %159
   re, fad
   sol r\mbreak
   dod, mi

   %162
   fad r
   si, re
   mi r

   %165
   la dod
   re8\f\tu[dod si la]
   si[la sol fad]

   %168
   sol[fad mi re]
   R2*13
   r8 la'\p\solo [la sol]\mbreak

   %183
   fad[re re re]
   re[re mi mi]
   fad4 re

   %186
   sol8[si si la]
   sold[mi mi mi]
   mi[mi fad fad]

   %189
   sold4 mi
   la re
   dod si\mbreak

   %192
   la re
   dod si
   la sol

   %195
   fad mi
   re sol
   fad mi

   %198
   re r
   r r8 re
   sol4 fad

   %201
   mi re\mbreak
   sol4 sold
   la8[sol! fad mi]

   %204
   re[fad la sol]
   fad4. mi8
   re[fad la sol]

   %207
   fad4.sol8
   la4 la,
   r8 re\tu\f do'4

   %210
   r8 re, do'4\mbreak
   re8 re,[fad re]
   sol[la si la]

   %213
   sold mi re'4
   r8 mi, re'4
   r8 mi,[sold mi]

   %216
   la16(sold la4) la8\p
   la16(sold la4) la8
   la,16(sold la4) la8\mbreak

   %219
   la16(sold la4) la8
   la'16(sold la4) la8
   la16(sold la4) la8

   %222
   sold2
   la\f~
   la~

   %225
   la8 [mi' sol, mi']
   fad,[re' mi, dod']
   re,[sol fad mi]\mbreak

   %228
   re[sol fad mi]
   re16(dod re4) re8
   re16(dod re4) re8

   %231
   re4 r
   R2
   r8 sol[re re']

   %234
   dod[la re re,]
   r la'[sold mi]
   la[sol! fad mi]

   %237
   re16 mi fad sol la8 sol
   fad4. mi8
   re16 mi fad sol la8 sol

   %240
   fad4. sol8
   la4 la,
   re4\fermata r

}


forma = {

   \time 2/4
   \key re\major
   \tempo 2 = 60
   s2*242
   \bar "|."

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


Ibr = {
   \Iglobal
   \clef bass
   <<\Ibrn \forma>>
}


Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \forma>>
}





IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIfln = \relative do'' {
   
   la'4.\solo la8 sib,16 la sib8 r4
   sol'4. sol8 la,16 sol la8 r4
   fa'4. fa8 fa mi mi re16 dod
   
   %4
   re4. mi8 dod4 r
   la'4. la8 sib,16 la sib8 r4\mbreak
   sol'4. sol8 la, do fa[sib]
   
   %7
   la4 sol fa r
   r8 fa fa mi re16 dod re4 re8
   re mi16 fa mi8 si do la fa'4~
   
   %10
   fa8 red mi4~mi8 dod re?4~
   re8 do!16 re si8. la16 la4 r8 la\mbreak
   sib16 la sib8 r si do16 si do8 r dod
   
   %13
   re16 dod re4 mi8 dod4 r
   la'4. la8 sib,16 la sib8 r4
   sol'4. sol8 la, dod re4~
   
   %16
   re dod re2

}

IIvlIn = \relative do'' {
   
   re,8\p mi fa re sol sol sol fa
   mi re mi do  fa fa fa mi
   re do sib la sol4 r8 la
   
   %4
   sib la sib sol la la' la sol\mbreak
   fad mi fad re sol, sol' sol fa?
   mi re mi do fa sol la  sib
   
   %7
   do4 do, r8 fa fa mi
   re4 r8 do si si' si la
   sold4 r8 sold la4 r8 la\mbreak
   
   %10
   sol!4 r8 sol fa4 r8 fa
   mi la re, mi la, la' fad[re]
   r sol, sol' fa! r mi la sol
   
   %13
   r fa16 mi fa8 sol la, la' la sol
   fa mi fa re sol, sol' sol fa\mbreak
   r mi mi re dod mi fa sol
   
   %16
   la4 la, re2
   
}

IIvlIIn = \relative do'' {
   
   re,8\p mi fa re sol sol sol fa
   mi re mi do  fa fa fa mi
   re do sib la sol4 r8 la
   
   %4
   sib la sib sol la la' la sol\mbreak
   fad mi fad re sol, sol' sol fa?
   mi re mi do fa sol la  sib
   
   %7
   do4 do, r8 fa fa mi
   re4 r8 do si si' si la
   sold4 r8 sold la4 r8 la\mbreak
   
   %10
   sol!4 r8 sol fa4 r8 fa
   mi la re, mi la, la' fad[re]
   r sol, sol' fa! r mi la sol
   
   %13
   r fa16 mi fa8 sol la, la' la sol
   fa mi fa re sol, sol' sol fa\mbreak
   r mi mi re dod mi fa sol
   
   %16
   la4 la, re2

}

forma = {

    \time 4/4
    \key re\minor
    \tempo 4 = 50
    s1*16
    \bar "|."

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





IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}

IIIfln = \relative do'' {

    re8.(fad16) mi4 dod
    re8.(fad16) mi4 dod
    re8(fad) sol(fad) sol(mi)

    %4
    \con \tuplet 3/2 { fad(mi re) } la'2~
    la8 fad sol (fad) sol (mi)
    \tuplet 3/2 { fad(mi re) } la'2~

    %7
    la8 fad sol (fad) mi (re)
    dod (si) la2
    la'8 [la, la la] la si16 do\mbreak

    %10
    si8 sol16 la si8 si16 dod! re8 mi16 fad
    sol8 [sol, sol sol] sol la16 si  %%%% RIPRESA
    la8 fad16 sol la8 la16 si dod8 re16 mi

    %13
    fad8 [fad, fad fad] fad sol16 la
    sol8 mi16 fad sol8 sol16 la si8 dod16 re
    mi8 [mi, mi mi] mi fad16 sol\mbreak

    %16
    fad8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod
    re la si dod re mi fad sol la4

    %19
    re,8\p(fad) mi4 dod
    re8(fad) mi4 dod
    re8 fad sol (fad) sol (mi)

    %22
    fad la si (la) si (sol)\mbreak
    la16[(fad8.) sol16(mi8.) fad16(re8.)]
    mi16[(dod8.) re8\f\upl si\upl la\upl sol\upl]

    %25
    fad8.(la16) sol4 mi
    fad8.(la16) sol4 mi
    fad8 re' fad,4 mi

    %28
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod\mbreak
    re la si dod re mi fad sol la8. \once\stemUp fad,16

    %31
    sol4 mi2
    re\fermata r4 %%% Fine RIPRESA
    re'8.\solo(fad16) mi4 dod

    %34
    re8.(fad16) mi4 dod
    re8(fad) sol(fad) sol(mi)
    \con \tuplet 3/2 { fad(mi re) } la'2~

    %37
    la8 fad sol (fad) sol (mi)
    \tuplet 3/2 { fad(mi re) } la'2~
    la8 fad sol fad mi re

    %40
    dod si la4 r
    fad'16 re fad la re8 la fad16 re fad la
    mi dod mi la dod8 la mi16 dod mi la

    %43
    re , si re fad si8 fad re16 si re fad
    dod la dod mi la8 mi dod16 la dod mi
    si sol si re sol8 re si16 sol si re\mbreak

    %46
    la fad la re fad8 re la16 fad la re
    sol, mi sol dod mi8 dod sol16 mi sol mi'
    fad,8 mi re4 r

    %49
    sol8.(re'16) do4 la
    \senza\tuplet 3/2 { si8 re sol si, re sol si, mi sol }
    dod,?8.(mi16) re4 si

    %52
    \tuplet 3/2 {
        dod8 mi la dod, mi la dod, fad la
        red, fad si red, fad si red, fad si
        si, mi sol si, mi sol si, mi sol

        %55
        dod, mi la dod, mi la dod, mi la
        la, re fad la, re fad la, re fad
        si, re sol si, re sol si, re sol

        %58
        si, mi sold si, mi sold si, mi sold\mbreak
        dod, mi la dod, mi la dod, mi la
        si, mi la si, mi la si, mi la

        %61
        si, mi sold si, mi sold si, mi sold
        dod, mi la fad mi re dod si la
        sold si mi re dod si dod si la

        %64
        fad' mi re sold fad mi la mi dod
        fad re si mi dod la re si' re,
        dod la' la,
    } si2

    %67
    la\tu r4
    la8.(dod16) si4 sold
    la8 dod re(dod) re(si)

    %70
    \con \tuplet 3/2 { dod (si la) } mi'2~
    mi8 dod re (dod) re (si)
    \tuplet 3/2 { dod (si la) } mi'2~

    %73
    mi8 dod re (dod) si (la)
    sold\tr(fad) mi2\mbreak
    mi'8 [mi, mi mi ]mi fad16 sol!

    %76
    fad8 re16 mi fad8 fad16 sol la dod re mi
    fad8 [fad, fad fad] fad sold16 la
    sold8 mi16 fad sold8 sold16 la si red mi fad

    %79
    sold8 [sold, sold sold] sold la16 si
    la8 fad16 sold la8 la16 si dod mi fad sold\mbreak
    la8 [la, la la] la si16 dod

    %82
    si8 sold16 la si8 si16 dod re fad sold la
    si8 [si, si si] si dod16 re
    dod8 la16 si dod8 dod16 re mi8 fad16 sold

    %85
    la8 la,16 si dod8 dod16 re mi8 fad16 sold
    la sold fad  mi re dod si la la'8. dod,16\mbreak
    re4 si2

    %88
    la4 la, r
    la'8.\solo(dod16) si4 sold
    la8.(dod16) si4 sold

    %91
    la8 dod re(dod) re(si)
    \con \tuplet 3/2 { dod (si la) } mi'2~
    mi8 dod re dod re si

    %94
    \tuplet 3/2 { dod (si la) } mi'2~
    mi8 dod re dod re si\mbreak
    \tuplet 3/2 { dod (si la) }  fad'2~

    %97
    fad8 re mi re mi dod
    \tuplet 3/2 { re(dod si) } fad'2~
    fad8 re mi re dod si

    %100
    lad sold fad4 r
    si (red fad)
    fad8(la) sol4 fad

    %103
    la,(dod mi)
    mi8(sol?) fad4 mi\mbreak  %105 fine pagina
    sol,4(si) re~

    %106
    re8(fad) mi4 re
    fad,(lad) dod~
    dod8(mi) re4 mi\parenthesize ~

    %109
    mi8(sol) fad4 sol~
    sol8 si lad4 si
    mi,~\tuplet 3/2 {
        mi8(re dod) re(dod si)

        %112
        \senza lad dod fad mi re dod re dod si\mbreak
        sol' fad mi lad sold fad si fad re
        sol mi dod fad re si mi dod' mi,

        %115
        re si' si,
    } dod2
    si fad8\tu sol16 la
    sol8 mi16 fad sol8 sol16 la si8 dod16 re

    %118
    mi8 [mi, mi mi] mi fad16 sol\mbreak
    fad8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod

    %121
    re la si dod re mi fad sol la4
    fad,8.(la16) sol4 mi
    fad8.(la16) sol4 mi

    %124
    fad8 re' fad,4 mi \mbreak
    re'8.\solo(fad16) mi4 dod
    re8.(fad16) mi4 dod

    %127
    re8 fad sol(fad) sol(mi)
    \con \tuplet 3/2 { fad(mi re) } la'2~
    la8 fad sol fad sol re

    %130
    \tuplet 3/2 { fad(mi re) } la'2~
    la8 fad sol fad mi re
    dod si la4 r

    %133
    fad'16 re fad la re8 la fad16 re fad la
    mi dod mi la dod8 la mi16 dod mi la
    re, si re fad si8 fad re16 si re fad

    %136
    dod la dod mi la8 mi dod16 la dod mi
    si sol si re sol8 re si16 sol si re\mbreak
    la fad la re fad8 re la16 fad la re

    %139
    sol, mi sol dod mi8 dod sol16 mi sol mi'
    fad,8 mi re4 r
    si'8.(re16) do4 la

    %142
    si8.(re16) do4 la
    si8 re do si do la
    \tuplet 3/2 { si(la sol) } re'2~

    %145
    re8 si do si do la
    \tuplet 3/2 { si(la sol) } mi'2~
    mi8 dod! re dod re si\mbreak

    %148
    \tuplet 3/2 { dod(si la) } la'2~
    la8 fad sol fad sol mi
    fad la si(la) si(sol)

    %151
    la(fad) sol(mi) fad(re)
    mi(dod) re2
    si'8(sol) la(fad) sol(mi)

    %154
    fad(re) mi(dod) re(si)
    dod(si) la2
    fa'8.(la16) sol4 fa\mbreak

    %157
    mi8.(sol16) fa4 mi
    re8.(fa16) mi4 re
    dod8.(re16) mi2

    %160
    fa8. (la16) sol4 fa
    mi8. (sol16) fa4 mi
    re8.(fa16) mi4 re

    %163
    dod8.(re16) mi2
    fad!4 re4.\tr (mi16 fad)
    si,4 si4. (dod32 re mi fad)\mbreak

    %166
    sol4 mi4.\tr(fad16 sol)
    dod,4 dod4.(re32 mi fad sol)
    la4 fad4.\tr(sol16 la)

    %169
    re,4 re4.(mi32 fad sol la)
    si16 la sol fad sol fad mi re mi re dod si
    dod si la si dod si dod re mi fad sol mi\mbreak

    %172
    la sol fad mi fad mi re dod re dod si la
    si la sol la si la si dod re mi fad re
    sol fad mi re mi re dod si dod si la sol

    %175
    la sol fad sol la sol la si dod re mi dod
    fad mi re dod re dod si la si la sol fad\mbreak
    sol fad mi fad sol fad sol la si dod re si

    %178
    mi re dod si dod si la sol la sol fad mi
    fad mi re mi fad mi fad sol la sol la si
    dod si la si dod si dod re mi re mi fad

    %181
    sol fad mi fad sol fad sol la si la si dod
    re re, mi fad sol fad sol la si la si dod
    re re, mi fad sol fad sol la si la si dod

    %184
    re dod si la sol fad mi re re'8. la16\mbreak
    \senza \tuplet 3/2 {
        si8 sol mi la fad re sol mi' sol,
        fad re' re,
    } mi2\tr

    %187
    re la8 si16 do\mbreak
    si8 sol16 la si8 si16 dod! re8 mi16 fad
    sol8 [sol, sol sol] sol la16 si  %%%% RIPRESA

    %190
    la8 fad16 sol la8 la16 si dod8 re16 mi
    fad8 [fad, fad fad] fad sol16 la
    sol8 mi16 fad sol8 sol16 la si8 dod16 re

    %193
    mi8 [mi, mi mi] mi fad16 sol\mbreak
    fad8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod

    %196
    re la si dod re mi fad sol la4
    re,8.\p(fad16) mi4 dod
    re8.(fad16) mi4 dod

    %199
    re8 fad sol (fad) sol (mi)
    fad la si (la) si (sol)\mbreak
    la16[(fad8.) sol16(mi8.) fad16(re8.)]

    %202
    mi16[(dod8.) re8\f\upl si\upl la\upl sol\upl]
    fad8.(la16) sol4 mi
    fad8.(la16) sol4 mi

    %205
    fad8 re' fad,4 mi
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod\mbreak

    %208
    re la si dod re mi fad sol la8. \once\stemUp fad,16
    sol4 mi2
    re\fermata r4

}

IIIvlIn = \relative do'' {

    re8.(fad16) mi4 dod
    re8.(fad16) mi4 dod
    re8(fad) sol(fad) sol(mi)

    %4
    \con \tuplet 3/2 { fad(mi re) } la'2~
    la8 fad sol (fad) sol (mi)
    \tuplet 3/2 { fad(mi re) } la'2~

    %7
    la8 fad sol (fad) mi (re)
    dod (si) la2
    la'8 [la, la la] la si16 do\mbreak

    %10
    si8 sol16 la si8 si16 dod! re8 mi16 fad
    sol8 [sol, sol sol] sol la16 si  %%%% RIPRESA
    la8 fad16 sol la8 la16 si dod8 re16 mi

    %13
    fad8 [fad, fad fad] fad sol16 la
    sol8 mi16 fad sol8 sol16 la si8 dod16 re
    mi8 [mi, mi mi] mi fad16 sol\mbreak

    %16
    fad8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod
    re la si dod re mi fad sol la4

    %19
    re,8\p(fad) mi4 dod
    re8(fad) mi4 dod
    re8 fad sol (fad) sol (mi)

    %22
    fad la si (la) si (sol)\mbreak
    la16[(fad8.) sol16(mi8.) fad16(re8.)]
    mi16[(dod8.) re8\f\upl si\upl la\upl sol\upl]

    %25
    fad8.(la16) sol4 mi
    fad8.(la16) sol4 mi
    fad8 re' fad,4 mi

    %28
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod\mbreak
    re la si dod re mi fad sol la8. \once\stemUp fad,16

    %31
    sol4 mi2
    re\fermata r4 %%% Fine RIPRESA
    fad4\p sol mi

    %34
    fad sol la
    si mi, la
    re, dod la

    %37
    si mi dod
    re dod la\mbreak
    si si' sol

    %40
    la r8 \parenthesize si[dod la]
    re4 r re
    dod r dod

    %43
    si r si
    la r la
    sol r sol

    %46
    fad r fad
    mi r mi\mbreak
    re r8 mi[fad re]

    %49
    sol4 la fad
    sol r mi
    la si sold

    %52
    la r fad
    si r r
    sol r mi

    %55
    la r r\mbreak
    fad r re
    sol r r

    %58
    sold r mi
    la r r
    mi r r

    %61
    mi r r
    la re,2
    mi la4\mbreak

    %64
    re,2 dod4
    re dod si
    la mi'2

    %67
    la8.\f(dod16) si4 sold
    la8.(dod16) si4 sold
    la8 dod re(dod) re(si)

    %70
    \con \tuplet 3/2 { dod (si la) } mi'2~
    mi8 dod re (dod) re (si)
    \tuplet 3/2 { dod (si la) } mi'2~

    %73
    mi8 dod re (dod) si (la)
    sold\tr(fad) mi2\mbreak
    mi'8 [mi, mi mi ]mi fad16 sol!

    %76
    fad8 re16 mi fad8 fad16 sol la dod re mi
    fad8 [fad, fad fad] fad sold16 la
    sold8 mi16 fad sold8 sold16 la si red mi fad

    %79
    sold8 [sold, sold sold] sold la16 si
    la8 fad16 sold la8 la16 si dod mi fad sold\mbreak
    la8 [la, la la] la si16 dod

    %82
    si8 sold16 la si8 si16 dod re fad sold la
    si8 [si, si si] si dod16 re
    dod8 la16 si dod8 dod16 re mi8 fad16 sold

    %85
    la8 la,16 si dod8 dod16 re mi8 fad16 sold
    la sold fad  mi re dod si la la'8. dod,16\mbreak
    re4 si2

    %88
    la4 la, r
    R2.*27
    fad''8[fad, fad fad] fad sol16 la
    sol8 mi16 fad sol8 sol16 la si8 dod16 re

    %118
    mi8 [mi, mi mi] mi fad16 sol\mbreak
    fad8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod

    %121
    re la si dod re mi fad sol la4
    fad,8.(la16) sol4 mi
    fad8.(la16) sol4 mi

    %124
    fad8 re' fad,4 mi
    re\p sol mi
    fad sol la

    %127
    si mi, la
    re, dod la
    si mi dod

    %130
    re dod la\mbreak
    si si' sol
    la r8 si[dod la]

    %133
    re4 r re
    dod r dod
    si r si

    %136
    la r la
    sol r sol
    fad r fad

    %139
    mi r mi\mbreak
    re4 r8 mi[fad re]
    sol4 la fad

    %142
    sol la fad
    sol la fad
    sol fad re

    %145
    mi la fad
    sol sold mi
    fad si sold\mbreak

    %148
    la dod la
    si mi dod
    re sol, mi

    %151
    fad mi re
    sol fad re
    sol fad mi

    %154
    re dod si
    la2 r4\mbreak
    re' r r

    %157
    do r r
    sib r r
    la2 r4

    %160
    re r r
    do r r
    sib r r

    %163
    la2 r4
    R2.*23
    la'8[la, la la] la si16 do

    %188
    si8 sol16 la si8 si16 dod! re8 mi16 fad
    sol8 [sol, sol sol] sol la16 si  %%%% RIPRESA

    %190
    la8 fad16 sol la8 la16 si dod8 re16 mi
    fad8 [fad, fad fad] fad sol16 la
    sol8 mi16 fad sol8 sol16 la si8 dod16 re

    %193
    mi8 [mi, mi mi] mi fad16 sol\mbreak
    fad8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod

    %196
    re la si dod re mi fad sol la4
    re,8.\p(fad16) mi4 dod
    re8.(fad16) mi4 dod

    %199
    re8 fad sol (fad) sol (mi)
    fad la si (la) si (sol)\mbreak
    la16[(fad8.) sol16(mi8.) fad16(re8.)]

    %202
    mi16[(dod8.) re8\f\upl si\upl la\upl sol\upl]
    fad8.(la16) sol4 mi
    fad8.(la16) sol4 mi

    %205
    fad8 re' fad,4 mi
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod\mbreak

    %208
    re la si dod re mi fad sol la8. \once\stemUp fad,16
    sol4 mi2
    re\fermata r4

}


IIIvlIIn = \relative do'' {

    fad,8.(la16) sol4 mi
    fad8.(la16) sol4 mi
    fad8 re' mi(re) mi(dod)

    %4
    \con \tuplet 3/2 { re(mi fad) } mi8\noBeam sol4 fad16 mi
    fad8 re mi(re) mi(dod)
    \tuplet 3/2 { re(mi fad) } mi8\noBeam sol4 fad16 mi\mbreak

    %7
    fad8 re si' (la) sol (fad)
    mi (re) \tuplet 3/2 { dod(re mi) dod(re mi) }
    la,4 r r

    %10
    r8 si [sol' si,] la si16 la
    sol4 r r
    r8 la[ fad' la,] sol la16 sol

    %13
    fad4 r r\mbreak
    r8 sol [mi' sol,] fad sol16 fad
    mi4 r r

    %16
    r8 fad [re' fad,] mi fad16 mi
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re la si dod re mi fad sol la4

    %19
    fad,8.\p(la16) sol4 mi\mbreak
    fad8.(la16) sol4 mi
    fad8 re' mi(re) mi(dod)

    %22
    re fad sol(fad) sol(mi)
    fad16[(re8.) mi16(dod8.) re16 (fad,8.)]
    sol16[(mi8.) fad8_\upl\f  sol_\upl fad_\upl mi_\upl]

    %25
    re8.(fad16) mi4 dod
    re8.(fad16) mi4 dod\mbreak
    re4 re dod

    %28
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod\mbreak
    re la si dod re mi fad sol la8. \once\stemUp fad,16

    %31
    mi4 dod2
    re\fermata r4\mbreak  %%fine ripresa
    fad4\p sol mi

    %34
    fad sol la
    si mi, la
    re, dod la

    %37
    si mi dod
    re dod la\mbreak
    si si' sol

    %40
    la r8 si[dod la]
    re4 r re
    dod r dod

    %43
    si r si
    la r la
    sol r sol

    %46
    fad r fad
    mi r mi\mbreak
    re r8 mi[fad re]

    %49
    sol4 la fad
    sol r mi
    la si sold

    %52
    la r fad
    si r r
    sol r mi

    %55
    la r r\mbreak
    fad r re
    sol r r

    %58
    sold r mi
    la r r
    mi r r

    %61
    mi r r
    la re,2
    mi la4\mbreak

    %64
    re,2 dod4
    re dod si
    la mi'2

    %67
    dod8.\f(mi16 re4) si
    dod8.(mi16 re4) si
    dod8 la' si(la) si(sold)

    %70
    \tuplet 3/2 { la(si dod) } si\noBeam re4 dod16 si
    dod8 la si(la) si(sold)\mbreak
    \tuplet 3/2 { la(si dod) } si\noBeam re4 dod16 si

    %73
    dod8 la fad' (mi) re (dod)
    si (la) \tuplet 3/2 { sold(la si) sold(la si) }
    mi, dod16 re mi8 dod16 re mi8 dod

    %76
    la4 re r\mbreak
    r8 red16 mi fad8 red16 mi fad8 red
    si4 mi r

    %79
    r8 mid16 fad sold8 mid16 fad sold8 mid
    dod4 fad r
    r8 fad16 sold la8 fad16 sold la8 fad

    %82
    re4 sold r\mbreak
    r8 sold16 la si8 sold16 la si8 sold
    mi8[dod' la' dod,] si dod16 si

    %85
    la8 la16 si dod8 dod16 re mi8 fad16 sold
    la sold fad  mi re dod si la la'8. dod,16
    si4 sold2

    %88
    la4 la, r\mbreak
    R2.*27
    re4 r r

    %117
    r8 sol[mi' sol,] fad sol16 fad
    mi4 r r
    r8 fad [re' fad,] mi fad16 mi

    %120
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re la si dod re mi fad sol la4
    re,,8.(fad16 mi4) dod

    %123
    re8.(fad16 mi4) dod
    re re dod
    re\p sol mi
    fad sol la

    %127
    si mi, la
    re, dod la
    si mi dod

    %130
    re dod la\mbreak
    si si' sol
    la r8 si[dod la]

    %133
    re4 r re
    dod r dod
    si r si

    %136
    la r la
    sol r sol
    fad r fad

    %139
    mi r mi\mbreak
    re4 r8 mi[fad re]
    sol4 la fad

    %142
    sol la fad
    sol la fad
    sol fad re

    %145
    mi la fad
    sol sold mi
    fad si sold\mbreak

    %148
    la dod la
    si mi dod
    re sol, mi

    %151
    fad mi re
    sol fad re
    sol fad mi

    %154
    re dod si
    la2 r4\mbreak
    re' r r

    %157
    do r r
    sib r r
    la2 r4

    %160
    re r r
    do r r
    sib r r

    %163
    la2 r4
    R2.*23
    fad4\f r r

    %188
    r8 si [sol' si,] la si16 la
    sol4 r r
    r8 la[ fad' la,] sol la16 sol

    %191
    fad4 r r\mbreak
    r8 sol [mi' sol,] fad sol16 fad
    mi4 r r

    %194
    r8 fad [re' fad,] mi fad16 mi
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re la si dod re mi fad sol la4

    %197
    fad,8.\p(la16) sol4 mi\mbreak
    fad8.(la16) sol4 mi
    fad8 re' mi(re) mi(dod)

    %200
    re fad sol(fad) sol(mi)
    fad16[(re8.) mi16(dod8.) re16 (fad,8.)]
    sol16[(mi8.) fad8_\upl\f  sol_\upl fad_\upl mi_\upl]

    %203
    re8.(fad16) mi4 dod
    re8.(fad16) mi4 dod\mbreak
    re4 re dod

    %206
    re8 re16 mi fad8 fad16 sol la8 si16 dod
    re8 re,16 mi fad8 fad16 sol la8 si16 dod\mbreak
    re la si dod re mi fad sol la8. \once\stemUp fad,16

    %209
    mi4 dod2
    re\fermata r4

}


IIIbrn = \relative do {

    re'4 sol, la
    re sol, la
    re, dod la

    %4
    r8 re' dod si dod la
    re,4 dod la
    r8 re' dod si dod la\mbreak

    %7
    re4 sol,2
    la8[la, la la'] sol la16 sol
    fad4 r fad

    %10
    sol8[sol, sol sol'] fad sol16 fad
    mi4 r mi
    fad8[fad, fad fad'] mi fad16 mi

    %13
    re4 r re\mbreak
    mi8[mi, mi mi'] re mi16 re
    dod4 r dod'

    %16
    re8[re, re re'] dod re16 dod
    si8 si la sol fad mi
    re4 r r

    %19
    R2.*6
    re4 sol, la\mbreak
    re sol, la

    %27
    re la' la,
    re'8[re, re re'] dod re16 dod
    si8 si la sol fad mi

    %30
    re4 r r8 r16 re
    sol,4 la2
    re,\fermata r4\mbreak  %%% fine ripresa

    %33
    R2.*34
    la''4 re, mi
    la re, mi

    %69
    la, sold mi
    r8 la' sold fad sold mi
    la,4 sold mi

    %72
    r8 la' sold fad sold mi\mbreak
    la4 re,2
    mi8[mi, mi mi'] re mi16 re

    %75
    dod8 la16 si dod8 la16 si dod8 la
    re4 re, r
    red'8 si16 dod red8 si16 dod red8 si

    %78
    mi4 mi, r\mbreak
    mid'8 dod16 red mid8 dod16 red mid8 dod
    fad4 fad, r

    %81
    fad'8 re?16 mi? fad8 re16 mi fad8 re
    sold4 sold, r
    sold'8 mi16 fad sold8 mi16 fad sold8 mi\mbreak

    %84
    la8[la, la la'] sold la16 sold
    fad8 fad mi re dod si
    la4 r r8 r16 la'

    %87
    re,4 mi mi,
    la2 r4
    R2.*27
    si4\f r re

    %117
    mi8[mi, mi mi'] re mi16 re\mbreak
    dod4 r dod
    re8[re, re re'] dod re16 dod

    %120
    si8 si' la sol fad mi
    re4 r r
    R2.*2

    %124
    re4 la' la,
    re2 r4\mbreak
    R2.*61
    re4\f r fad\mbreak

    %188
    sol8[sol, sol sol'] fad sol16 fad
    mi4 r mi
    fad8[fad, fad fad'] mi fad16 mi

    %191
    re4 r re\mbreak
    mi8[mi, mi mi'] re mi16 re
    dod4 r dod'

    %194
    re8[re, re re'] dod re16 dod
    si8 si la sol fad mi
    re4 r r

    %197
    R2.*6
    re4 sol, la\mbreak
    re sol, la

    %205
    re la' la,
    re'8[re, re re'] dod re16 dod
    si8 si la sol fad mi

    %208
    re4 r r8 r16 re
    sol,4 la2
    re,\fermata r4  %%% fine ripresa

}


IIIbcn = \relative do {

    re'4 sol, la
    re sol, la
    re, dod la

    %4
    r8 re' dod si dod la
    re,4 dod la
    r8 re' dod si dod la\mbreak

    %7
    re4 sol,2
    la8[la, la la'] sol la16 sol
    fad4 r fad

    %10
    sol8[sol, sol sol'] fad sol16 fad
    mi4 r mi
    fad8[fad, fad fad'] mi fad16 mi

    %13
    re4 r re\mbreak
    mi8[mi, mi mi'] re mi16 re
    dod4 r dod'

    %16
    re8[re, re re'] dod re16 dod
    si8 si la sol fad mi
    re4 r r

    %19
    R2.*6
    re4 sol, la\mbreak
    re sol, la

    %27
    re la' la,
    re'8[re, re re'] dod re16 dod
    si8 si la sol fad mi

    %30
    re4 r r8 r16 re
    sol,4 la2
    re,\fermata r4\mbreak  %%% fine ripresa

    %33
    R2.*34
    la''4 re, mi
    la re, mi

    %69
    la, sold mi
    r8 la' sold fad sold mi
    la,4 sold mi

    %72
    r8 la' sold fad sold mi\mbreak
    la4 re,2
    mi8[mi, mi mi'] re mi16 re

    %75
    dod8 la16 si dod8 la16 si dod8 la
    re4 re, r
    red'8 si16 dod red8 si16 dod red8 si

    %78
    mi4 mi, r\mbreak
    mid'8 dod16 red mid8 dod16 red mid8 dod
    fad4 fad, r

    %81
    fad'8 re?16 mi? fad8 re16 mi fad8 re
    sold4 sold, r
    sold'8 mi16 fad sold8 mi16 fad sold8 mi\mbreak

    %84
    la8[la, la la'] sold la16 sold
    fad8 fad mi re dod si
    la4 r r8 r16 la'

    %87
    re,4 mi mi,
    la2 r4
    dod\p\solo re si

    %90
    dod re mi
    fad si, mi\mbreak
    la sold mi

    %93
    fad si sold
    la sold mi
    fad si sold

    %96
    la lad fad
    sold dod lad
    si lad fad

    %99
    sol!2 mi4
    fad, fad' mi\mbreak
    red r r

    %102
    si mi re!
    dod r r
    la re dod

    %105
    si r r
    sol dod si
    lad r r

    %108
    fad' r r\mbreak
    fad r r
    mi2 re4

    %111
    dod lad si
    fad'2 si4
    mi,2 re4

    %114
    mi re dod
    si fad' fad,
    si\f\tu r re

    %117
    mi8[mi, mi mi'] re mi16 re\mbreak
    dod4 r dod
    re8[re, re re'] dod re16 dod

    %120
    si8 si' la sol fad mi
    re4 r r
    R2.*2

    %124
    re4 la' la,
    re2 r4\mbreak
    R2.*38

    %164
    re4\p\solo fad re
    sol, sol' fad
    mi sol mi

    %167
    la, la' sol
    fad la fad
    si, si' la

    %170
    sol r r\mbreak
    la r r
    fad r r

    %173
    sol r r
    mi r r
    fad r r

    %176
    re r r
    mi r r
    dod r r

    %179
    re r r\mbreak
    la'4 r r
    mi r r

    %182
    re r r
    re r r
    re r fad

    %185
    sol fad mi re
    la' la,
    re\f\tu r fad\mbreak

    %188
    sol8[sol, sol sol'] fad sol16 fad
    mi4 r mi
    fad8[fad, fad fad'] mi fad16 mi

    %191
    re4 r re\mbreak
    mi8[mi, mi mi'] re mi16 re
    dod4 r dod'

    %194
    re8[re, re re'] dod re16 dod
    si8 si la sol fad mi
    re4 r r

    %197
    R2.*6
    re4 sol, la\mbreak
    re sol, la

    %205
    re la' la,
    re'8[re, re re'] dod re16 dod
    si8 si la sol fad mi

    %208
    re4 r r8 r16 re
    sol,4 la2
    re,\fermata r4  %%% fine ripresa

}

forma = {

    \time 3/4
    \key re\major
    \tempo 2 = 65
    s2.*210
    \bar "|."

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


IIIbr = {
    \IIIglobal
    \clef bass
    <<\IIIbrn \forma>>
}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma>>
}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {
        systems-per-page = #4
    }


    \header {
        title = \markup \smaller "Concerto a 4 [QV 4:1]"
        composer = \markup \center-column{"J. J. Quantz (1697-1773)"}
    }

    \markup\huge "[1.] Allegro assai"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Flauto""Traversiero"}
                \set Staff.shortInstrumentName = "fl"
                \set Staff.midiInstrument = #"flute"
                \Ifl
            >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlI"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlII"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso""ripieno"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "brip"
                \Ibr
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm
            #(layout-set-staff-size 16.5)

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

\bookpart {

    \paper {
        systems-per-page = #5
    }

    \markup\huge "[2.] Grave"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Flauto""Traversiero"}
                \set Staff.shortInstrumentName = "fl"
                \set Staff.midiInstrument = #"flute"
                \IIfl
            >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlI"
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlII"
                    \IIvlII
                >>
            >>
        >>

        \layout {

            indent = 2\cm
            #(layout-set-staff-size 18)

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\bookpart {

    \paper {
        systems-per-page = #4
    }

    \markup\huge "[3.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Flauto""Traversiero"}
                \set Staff.shortInstrumentName = "fl"
                \set Staff.midiInstrument = #"flute"
                \IIIfl
            >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlI"
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlII"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso""ripieno"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "brip"
                \IIIbr
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm
            #(layout-set-staff-size 16.5)

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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
