\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

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
   \senza
}

IvlIn = \relative do'' {

   r8
   si1\pp~
   si~
   si~

   %4
   si~
   si~
   si~

   %7
   si~
   si2~si4. si8
   si8 r r16 si'\f si si si, si' si si si, si' si si  %% ripresa

   %10
   si, la' la la si, la' la la si, sol' sol sol si, sol' sol sol
   si,4 r16 si si si si, si' si si si, si' si si
   si, la' la la si, la' la la si, sol' sol sol si, sol' sol sol

   %13
   si,4 r\mbreak sold''?16\staccatissimo \p[sold\staccatissimo  si\staccatissimo  si\staccatissimo  sold!\staccatissimo  sold\staccatissimo re\staccatissimo  re\staccatissimo ]
   mi,8(re' sold4) \appoggiatura la8 sold16 (fad sold8)\appoggiatura la8 sold16 (fad sold8)
   la16\f[(sol? fa mi re do si la)] la,4 r

   %16
   fad''?16\p\staccatissimo [fad\staccatissimo  la\staccatissimo  la\staccatissimo  fad\staccatissimo  fad\staccatissimo  do\staccatissimo do\staccatissimo ] re,8(do' fad4)
   \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) sol16\f[(fad mi re do si la sol)]
   sol,4 r sol''16\f[la si la sol fad mi red]

   %19
   mi[fad sol fad mi re? do si]\mbreak do[re mi re do si la sol]
   la[si do si la sol fad mi] si si do si si si do si
   la la si la la la si la sol4 r8 si'\pp

   %22
   si1~
   si
   si'8\f[la16 sol la8 fad] mi4 r8 mi  %%$% fine ripresa

   %25
   mi'16(re) do(si) la8 sol \appoggiatura sol fa4\tr mi\mbreak
   do'16(si) la(sol) fad?8 mi \appoggiatura mi red4\tr mi
   mi8. fad32 mi fad8.\tr(mi32 fad) sol8. la32 sol la8.\tr(sol32 la)

   %28
   si4~si16[la32(sol fad16 mi)] mi'-.[(re-. do-. si-. la-. sol-. fad-. mi-.)]
   mi4\tr(red) \tuplet 3/2 { sol16 mi sol si[sol si] sol mi sol si[sol si] }
   mi,4 r \tuplet 3/2 { fad16 red fad la[fad la] fad red fad la[fad la] }

   %31
   si,4 r\mbreak do'!4 \appoggiatura si8 lad16(sold lad8)
   lad?4(si) si \appoggiatura la?8 sold16(fad sold8)
   sold?4(la) la8 (do, si la)

   %34
   red,4~red16[fad(si red 32 fad] la4)~la16[si,(red fad32 la]
   do4) si8 la sol16(fad mi8)~mi si'
   mi16[mi,32(fad sol16) mi] mi'\staccatissimo si\staccatissimo sol\staccatissimo mi\staccatissimo mi'[mi,32(fad sol16) mi] mi'\staccatissimo si\staccatissimo sol\staccatissimo mi\staccatissimo \mbreak  % fine p. 4

   %37
   do'\staccatissimo mi,\staccatissimo la,\staccatissimo mi'\staccatissimo do'\staccatissimo mi\staccatissimo do\staccatissimo mi,\staccatissimo re'[re,32 (mi fad16) re] re' la fad re
   re'[re,32 (mi fad16) re] re' la fad re si'\staccatissimo re,\staccatissimo sol,\staccatissimo re'\staccatissimo si'\staccatissimo re\staccatissimo si\staccatissimo re,\staccatissimo
   do'[do,32 (re mi16) do] do' sol mi do do'[do,32 (re mi16) do] do'(si) si(lad)

   %40
   lad?4~lad16(dod) dod(si) si(lad) lad(sol!) sol(fad) fad(mi)
   mi(fad) fad(dod) dod(mi) mi(re) re4. fad8\mbreak
   mi16(re) dod(si) do8 do' si4. (lad8)

   %43
   dod4.(si8) re4.(dod8)
   \tuplet 3/2 { re16 dod si mi[re dod] } dod4\tr <<si4\\{si,16\f [re re fad fad si si fad]}>>

   %45
   fad, fad' fad fad fad, fad' fad fad fad, mi' mi mi fad, mi' mi mi
   fad, re' re re fad, re' re re\mbreak fad,4 r8 fad\pp
   fad1~

   %48
   fad
   fad'8\f[mi16 re mi8 dod] si4 r8 si'
   si,16(fad' si) re si fad si fad si,(fad' si) re si fad si fad

   %51
   sol,(mi' si') re si mi, si' mi, sol,(mi' si') re si mi, si' mi,
   sol,(mi' dod'?) mi dod mi, dod' mi,\mbreak sol,(mi' dod'?) mi dod mi, dod' mi,
   lad,(mi') fad(mi) fad(mi) fad(mi) lad,(mi' dod') si lad sold fad mi

   %54
   re si' dod si dod dod re dod re re mi re mi mi fad mi
   fad8 fad, r fad'16 si, si8[(dod) si re16 fad,]
   fad8[(sol) fad si16 re,] re8[(mi) re fad16 si,]\mbreak

   %57
   si8(do) si re16 fa fa8(mi16) si' si8(mi,16) re
   \tuplet 3/2 { do si la mi'[re do]} la'8 r \tuplet 3/2 { fa?16 lab sol fa![mi re] } si'8 r
   \tuplet 3/2 { sold16 si la sold[fad! mi] } do'8 r \tuplet 3/2 { la16 do si la[sol? fa] } re'8 r

   %60
   \tuplet 3/2 { si16 re do si[la sold] } mi'8 r do16(re) mi(re) mi(mi,) fa(sol?)
   sol(fa) dod'4(re8) si16(dod) re(dod) re(re,) \once\slurDashed mi (fa)\mbreak
   fa?(mi) si'4(do?8) la16(si) do(si) do(do,) re(mi)

   %63
   mi(re) la'4(si8) sold16\staccatissimo si\staccatissimo re,\staccatissimo sold\staccatissimo si,\staccatissimo re\staccatissimo mi,\staccatissimo re'\staccatissimo
   do32 la sol fad  mi re do si la4\tr r8 la''16(sold) si(la) fa(mi)
   sol(fa) re(dod) mi(re) la'(sold) si(la) do?(si) re(do) mi(re)

   %66
   mi mi, do la re, mi' do la red, mi' do la<<{si8.\tr la16}\\mi4>>\mbreak
   la16 mi' mi mi mi, mi' mi mi mi, re' re re mi, re' re re
   mi, do' do do mi, do' do do mi,\f mi fa mi mi mi fa mi

   %69
   re re mi re re re mi re do8\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo
   la\staccatissimo do\staccatissimo mi\staccatissimo mi,\staccatissimo \mbreak la4 r8 mi'
   \tuplet 3/2 {
      sol16 mi sol si[sol si] sol mi sol si[sol si] fad red fad si[fad si] fad red fad si[fad si]

      %72
      sol mi sol si[sol si] sol mi sol si[sol si]
   } fad8 si, r si
   \tuplet 3/2 { si16(dod red mi[fad sol] } sol8) si, \tuplet 3/2 { dod16(red mi fad[sol la] } la8) dod,
   \tuplet 3/2 { red16(mi fad sol[la si] } si8) red,\mbreak mi si'16(sol) \appoggiatura fad8 mi do'16(la)

   %75
   \appoggiatura sol8 fad red'16(si) \appoggiatura la8 sol mi'16(do) \appoggiatura si8 la fad'(mi8.\tr red32) mi
   \appoggiatura mi8 red4 r16 red\staccatissimo mi\staccatissimo fad\staccatissimo la, red si, red' la red si, red'
   mi(fad) sol8~sol16 fad(mi re) re4(dod16) dod\staccatissimo re\staccatissimo mi\staccatissimo

   %78
   sol, dod la, dod' sol dod la, dod' re(mi) fad8~fad16 mi(re dod)\mbreak
   dod?4(si16) si\staccatissimo dod\staccatissimo re\staccatissimo fad,? si sol, si' fad! si sol, si'
   dod(re) mi8~mi16 re(dod si) si4\tr(lad)

   %81
   \tuplet 3/2 { lad?16(si dod) mi,[(fad sol)] dod,(re mi) mi,[fad sol] } lad,4 r8 fad''
   red32\staccatissimo dod32\staccatissimo si8. fad'\tr(mi32 fad) sol\staccatissimo fad\staccatissimo mi8. sol\tr(fad32 sol)
   la\staccatissimo sol\staccatissimo fad8. la\tr(sol32 la) si(la sol8.) si\tr(la32 si)\mbreak

   %84
   do si la8. red\tr(dod32 red) mi8 mi, r16 mi'(red dod
   si dod? lad dod! si dod mi, sol) fad(la red, fad mi sol lad, dod?)
   si(la' sol fad) do!4 si16(sol' fad mi) lad,4

   %87
   si16\tr\f(la32 si) fad'16\tr[(mi32 fad)] si,16\tr(la32 si) fad'16\tr[(mi32 fad)]  sol16 la si mi, <<fad4\tr\\si,>>
   mi8 r r16 si'\f si si si, si' si si si, si' si si  %% ripresa
   si, la' la la si, la' la la si, sol' sol sol si, sol' sol sol

   %90
   si,4 r16 si si si si, si' si si si, si' si si
   si, la' la la si, la' la la si, sol' sol sol si, sol' sol sol
   si,4 r\mbreak sold''?16\staccatissimo \p[sold\staccatissimo  si\staccatissimo  si\staccatissimo  sold!\staccatissimo  sold\staccatissimo re\staccatissimo  re\staccatissimo ]

   %93
   mi,8(re' sold4) \appoggiatura la8 sold16 (fad sold8)\appoggiatura la8 sold16 (fad sold8)
   la16\f[(sol fa mi re do si la)] la,4 r
   fad''?16\p\staccatissimo [fad\staccatissimo  la\staccatissimo  la\staccatissimo  fad\staccatissimo  fad\staccatissimo  do\staccatissimo do\staccatissimo ] re,8(do' fad4)

   %96
   \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) sol16[(fad mi re do si la sol)]
   sol,4 r sol''16\f[la si la sol fad mi red]
   mi[fad sol fad mi re? do si]\mbreak do[re mi re do si la sol]

   %99
   la[si do si la sol fad mi] si si do si si si do si
   la la si la la la si la sol4 r8 si'\pp
   si1~

   %102
   si
   si'8\f[la16 sol la8 fad] mi4\fermata r

}

IvlIIn = \relative do'' {

   r8
   si1\pp~
   si~
   si~

   %4
   si~
   si~
   si~

   %7
   si~
   si2~si4. si8
   si8 r r16 si'\f si si si, si' si si si, si' si si  %% ripresa

   %10
   si, la' la la si, la' la la si, sol' sol sol si, sol' sol sol
   si,4 r16 si si si si, si' si si si, si' si si
   si, la' la la si, la' la la si, sol' sol sol si, sol' sol sol

   %13
   si,4 r\mbreak sold''?16\staccatissimo \p[sold\staccatissimo  si\staccatissimo  si\staccatissimo  sold!\staccatissimo  sold\staccatissimo re\staccatissimo  re\staccatissimo ]
   mi,8(re' sold4) \appoggiatura la8 sold16 (fad sold8)\appoggiatura la8 sold16 (fad sold8)
   la16\f[(sol? fa mi re do si la)] la,4 r

   %16
   fad''?16\p\staccatissimo [fad\staccatissimo  la\staccatissimo  la\staccatissimo  fad\staccatissimo  fad\staccatissimo  do\staccatissimo do\staccatissimo ] re,8(do' fad4)
   \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) sol16\f[(fad mi re do si la sol)]
   sol,4 r sol''16\f[la si la sol fad mi red]

   %19
   mi[fad sol fad mi re? do si]\mbreak do[re mi re do si la sol]
   la[si do si la sol fad mi] si si do si si si do si
   la la si la la la si la sol4 r8 si'\pp

   %22
   si1~
   si
   si'8\f[la16 sol la8 fad] mi4 r  %%$% fine ripresa

   %25
   mi,8 sol fad mi la, la' sol mi\mbreak
   la, do' la la, si si' sol fad
   mi do' red, si mi mi' fad, red

   %28
   sol mi fad sol la si do lad
   si lad si si, si' si si si
   si si si si red red red red

   %31
   red? red red red\mbreak sol sol fad fad
   fad fad fad fad fad fad mi mi
   mi mi mi mi mi mi mi mi

   %34
   red red red red red red red red
   red? red red red si si si si
   r sol si mi r sol, si mi\mbreak

   %37
   r do mi la r fad, la re
   r fad, la re r si re sol
   r do, mi sol r do, mi sol

   %40
   lad, dod dod dod dod dod dod dod
   dod? dod dod dod re re re re\mbreak
   mi, sol fad mi fad fad fad fad

   %43
   sold sold sold sold lad lad lad lad
   si sol? mi fad si16\f [re re fad fad si si fad]
   fad, fad' fad fad fad, fad' fad fad fad, mi' mi mi fad, mi' mi mi

   %46
   fad, re' re re fad, re' re re\mbreak fad,4 r8 fad\pp
   fad1~
   fad

   %49
   fad'8\f[mi16 re mi8 dod] si4 r
   r8 fad si fad r fad si fad
   r mi' mi si r si mi si

   %52
   r dod mi dod r dod mi dod
   r dod mi dod r dod mi dod
   si, r lad r si r dod r

   %55
   re si re si r fad' re si
   r mi re si r lad' si si,\mbreak %%%fine p. 6
   r fad' re si r sold' mi sold,

   %58
   mi''8 mi mi mi fa fa fa fa
   sold sold sold sold la la la la
   si si si si do4 r

   %61
   r8 mi, mi re r2\mbreak
   r8 re re do r2
   r8 do do si si r si r

   %64
   do r la, r la mi' fa do
   re la' fa mi fa sold, la si
   do8 r re r red r mi r\mbreak

   %67
   r16 mi' mi mi mi, mi' mi mi mi, re' re re mi, re' re re
   mi, do' do do mi, do' do do mi,\f mi fa mi mi mi fa mi
   re re mi re re re mi re do8\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo

   %70
   la\staccatissimo do\staccatissimo mi\staccatissimo mi,\staccatissimo \mbreak la4 r8 si
   si si si si si si si si
   si si si si si si si si

   %73
   r8 sol mi sol r la fad la
   r si sol si\mbreak r sol do la
   red si mi[do] fad, sold lad fad

   %76
   si la si si, red' red red red
   si si si si la la la dod
   dod? dod dod dod la la la la\mbreak

   %79
   sol sol sol si si si si si
   sol sol sol sol fad fad fad lad
   lad? lad lad lad lad lad lad lad

   %82
   fad fad red' red si si do do
   do do re re re re mi mi\mbreak
   mi mi fad fad sol sol sol r

   %85
   mi, fad sol mi red si' sol mi
   red si' fad red mi sol fad mi
   red dod red si mi mi si' si,

   %88
   mi8 r r16 si''\f si si si, si' si si si, si' si si  %% ripresa
   si, la' la la si, la' la la si, sol' sol sol si, sol' sol sol
   si,4 r16 si si si si, si' si si si, si' si si

   %91
   si, la' la la si, la' la la si, sol' sol sol si, sol' sol sol
   si,4 r\mbreak sold''?16\staccatissimo \p[sold\staccatissimo  si\staccatissimo  si\staccatissimo  sold!\staccatissimo  sold\staccatissimo re\staccatissimo  re\staccatissimo ]

   %93
   mi,8(re' sold4) \appoggiatura la8 sold16 (fad sold8)\appoggiatura la8 sold16 (fad sold8)
   la16\f[(sol? fa mi re do si la)] la,4 r
   fad''?16\p\staccatissimo [fad\staccatissimo  la\staccatissimo  la\staccatissimo  fad\staccatissimo  fad\staccatissimo  do\staccatissimo do\staccatissimo ] re,8(do' fad4)

   %96
   \appoggiatura sol8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8) sol16\f[(fad mi re do si la sol)]
   sol,4 r sol''16\f[la si la sol fad mi red]
   mi[fad sol fad mi re? do si]\mbreak do[re mi re do si la sol]

   %99
   la[si do si la sol fad mi] si si do si si si do si
   la la si la la la si la sol4 r8 si'\pp
   si1~

   %102
   si
   si'8\f[la16 sol la8 fad] mi4\fermata r

}

IvlIIIn =  \relative do'' {

   r8
   sol1\pp~
   sol~
   sol

   %4
   fad~
   fad
   mi

   %7
   red2 sol~
   sol~sol4 fad
   sol8 r r16 sol'\f sol sol si, sol' sol sol si, sol' sol sol %%%ripresa

   %10
   si, fad' fad fad si, fad' fad fad si, mi mi mi si mi mi mi
   si4 r16 sol sol sol si, sol' sol sol si, sol' sol sol
   si, fad' fad fad si, fad' fad fad si, mi mi mi si mi mi mi

   %13
   si4 r\mbreak re'2~
   re~re
   do8\f do do do la,4 r

   %16
   do'1\p~
   do2 si8\f si si si
   sol,4 r r2

   %19
   sol''16 [la si la sol fad mi re]\mbreak  mi[fad sol fad mi re do si]
   do[re mi re do si la sol] si, si do si si si do si
   la la si la la la si la sol4 r8 sol'8\pp

   %22
   sol1~
   sol
   sol'8\f[fad16 mi fad8 red] mi4 r %%%5 fine ripresa

   %25
   mi,8 sol fad mi la, la' sol mi\mbreak
   la, do' la la, si si' sol fad
   mi do' red, si mi mi' fad, red

   %28
   sol mi fad sol la si do lad
   si lad si si, sol' sol sol sol
   sol sol sol sol fad fad fad fad

   %31
   fad fad fad fad\mbreak mi si' dod dod
   si si si si si si si si
   la la la la la la la la

   %34
   fad fad fad fad fad fad fad fad
   fad fad fad fad sol sol sol sol
   r mi sol si r mi, sol si\mbreak

   %37
   r la do mi r re, fad la
   r re, fad la r sol si re
   r sol, do mi r sol, do mi

   %40
   mi mi mi mi mi mi mi mi
   lad, lad lad lad fad fad fad fad\mbreak
   mi sol fad mi fad fad fad fad

   %43
   sold sold sold sold lad lad lad lad
   si sol? mi fad re16\f fad fad si si re re re
   fad, re' re re fad, re' re re fad, dod' dod dod fad, dod' dod dod

   %46
   fad, si si si fad si si si\mbreak fad4 r8 re\pp
   re1~
   re

   %49
   re'8\f[dod16 si dod8 lad] si4 r
   r8 re, fad re r re fad re
   r sol si sol  r sol si sol

   %52
   r fad! dod' fad,\mbreak r fad dod' fad,
   r lad dod lad r lad dod lad
   si,8 r lad r si r dod r

   %55
   re si re si r fad' re si
   r mi re si r lad' si si,\mbreak %%%fine p. 6
   r fad' re si r sold' mi sold,

   %58
   do'8 do do do la la si si
   si si do do do do re re
   re re mi mi mi4 r

   %61
   r8 dod dod la r2\mbreak
   r8 si si sol r2
   r8 la la fa sold r sold r

   %64
   mi r la, r la mi' fa do
   re la' fa mi fa sold, la si
   do8 r re r red r mi r\mbreak

   %67
   r16 do' do do mi, do' do do mi, si' si si mi, si' si si
   mi, la la la mi la la la mi\f mi fa mi mi mi fa mi
   re re mi re re re mi re do8\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo

   %70
   la\staccatissimo do\staccatissimo mi\staccatissimo mi,\staccatissimo \mbreak la4 r8  sol
   sol sol sol sol fad fad fad fad
   sol sol sol sol fad fad fad fad

   %73
   r sol mi sol r la fad la
   r si sol si\mbreak r sol do la
   red si mi[do] fad, sold lad fad

   %76
   si la si si, fad' fad fad fad
   sol sol sol sol mi mi mi mi
   mi mi mi mi fad fad fad fad\mbreak

   %79
   re re re re re re re re
   mi mi mi mi dod dod dod dod
   dod? dod dod dod dod dod dod dod

   %82
   red red si' si sol sol mi mi
   la la fad fad si si sol sol\mbreak
   do do si si si si si r

   %85
   mi, fad sol mi red si' sol mi
   red si' fad red mi sol fad mi
   red dod red si mi mi si' si,

   %88
   mi8 r r16 sol'\f sol sol si, sol' sol sol si, sol' sol sol %%%ripresa
   si, fad' fad fad si, fad' fad fad si, mi mi mi si mi mi mi
   si4 r16 sol sol sol si, sol' sol sol si, sol' sol sol

   %91
   si, fad' fad fad si, fad' fad fad si, mi mi mi si mi mi mi
   si4 r\mbreak re'2~
   re~re

   %94
   do8\f do do do la,4 r
   do'1\p~
   do2 si8\f si si si

   %97
   sol,4 r r2
   sol''16 [la si la sol fad mi re]\mbreak  mi[fad sol fad mi re do si]
   do[re mi re do si la sol] si, si do si si si do si

   %100
   la la si la la la si la sol4 r8 sol'8\pp
   sol1~
   sol

   %103
   sol'8\f[fad16 mi fad8 red] mi4\fermata r

}

Ivlan = \relative do' {

   r8
   mi1\pp~
   mi~
   mi

   %4
   red~
   red
   sol,

   %7
   fad2\mbreak mi'~
   mi~mi4 red
   mi4 r si\f si  %%%%ripresa

   %10
   si si si si
   si r si si
   si si si si

   %13
   si r\mbreak si'2~
   si~si4. sold8
   mi\f mi mi mi la,4 r

   %16
   la'1\p~
   la4. fad8 re\f re re re
   sol,4 r si'8 si r4

   %19
   si8 si r4\mbreak do8 do r4
   mi,8 mi r4 si16 si do si si si do si
   la la si la la la si la sol4 r8 mi'8\pp

   %22
   mi1~
   mi
   mi8\f si' do si sol4 r %%%% fine ripresa

   %25
   mi8 sol fad mi la, la' sol mi\mbreak
   la, do' la la, si si' sol fad
   mi do' red, si mi mi' fad, red

   %28
   sol mi fad sol la si do lad
   si lad si si, mi mi mi mi
   mi mi mi mi si si si si

   %31
   si si si si\mbreak mi mi mi mi
   re re re re re re re re
   do do do do do do do do

   %34
   si si si si si si si si
   si si si si mi mi mi mi
   r si mi sol r si, mi sol\mbreak

   %37
   r mi la do r la, re fad
   r la, re fad r re sol si
   r mi, sol do r mi, sol do

   %40
   fad, fad fad fad fad fad fad fad
   fad fad fad fad si, si si si\mbreak
   mi sol fad mi fad fad fad fad

   %43
   sold sold sold sold lad lad lad lad
   si sol? mi fad  si, si si si
   fad'4 fad fad fad

   %46
   fad fad\mbreak fad4 r8 si,\pp
   si1~
   si

   %49
   fad'8 fad sol fad fad4 r
   r8 si, re si r si re si
   r mi sol mi r mi sol mi

   %52
   r lad, fad' lad,\mbreak r lad fad' lad,
   r fad fad' fad, r fad fad' fad,
   si r sold r si r dod r

   %55
   re si re si r fad' re si
   r mi re si r lad' si si,\mbreak
   r fad' re si r sold' mi sold,

   %58
   la la la la re re re re
   mi mi mi mi fa fa fa fa
   sold, sold sold sold la4 r

   %61
   r8 la' sol fa r2\mbreak
   r 8 sol fa mi r2
   r8 fa mi re mi r mi r

   %64
   la, r la r la mi' fa do
   re la' fa mi fa sold, la si
   do r re r red r mi r\mbreak

   %67
   mi4 mi mi mi
   mi mi mi16 \f mi fa mi mi mi fa mi
   re re mi re re re mi re do8\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo

   %70
   la\staccatissimo do\staccatissimo mi\staccatissimo mi,\staccatissimo \mbreak la4 r8 mi
   mi mi mi mi red red red red
   mi mi mi mi red red red red

%73
   r sol mi sol r la fad la
   r si sol si\mbreak r sol do la
   red si mi[do] fad, sold lad fad

   %76
   si la si si, si si si si
   mi mi mi mi la, la la la
   la la la la re re re re\mbreak

   %79
   sol, sol sol sol sol sol sol sol
   dod dod dod dod fad, fad fad fad
   fad fad fad fad  fad fad fad fad

   %82
   si si si si mi mi mi mi
   fad fad fad fad sol sol sol sol\mbreak
   la la la la sol mi mi r

   %85
   mi fad sol mi red si' sol mi
   red si' fad red mi sol fad mi
   red dod red si mi mi si' si,

   %88
   mi4 r si\f si  %%%%ripresa
   si si si si
   si r si si

   %91
   si si si si
   si r\mbreak si'2~
   si~si4. sold8

   %94
   mi\f mi mi mi la,4 r
   la'1\p~
   la4. fad8 re\f re re re

   %97
   sol,4 r si'8 si r4
   si8 si r4\mbreak do8 do r4
   mi,8 mi r4 si16 si do si si si do si

   %100
   la la si la la la si la sol4 r8 mi'8\pp
   mi1~
   mi

   %103
   mi8\f si' do si sol4 r

}

Ibcn = \relative do {

   si'8_\markup\italic"Forte molto"
   mi mi, mi mi sol16 fad mi4 mi8
   sol16 fad mi4 mi8 mi' mi, mi mi

   %3
   sol16 fad mi4 mi8 mi' si sol mi
   si4 r8 si' si, [si' si la16 sol]
   la8 si, si la' si,[la' la sol16 fad]

   %6
   sol8 si, si sol' si,[sol' sol fad16 mi]
   fad8 si, si si'\mbreak sol16 fad mi4 mi8
   sol16 fad mi4 mi8 sol[fad16 mi si'8 si,]

   %9
   mi4 r si\f si  %% inizio ripresa
   si si si si
   si r si si

   %12
   si si si si
   si r\mbreak mi8\p mi mi mi
   mi mi mi mi mi mi mi mi

   %15
   la,\f la la la la la la la
   re\p re re re re re re re
   re re re re sol,\f sol sol sol

   %18
   sol sol sol sol mi' mi, r4
   mi'8 mi, r4\mbreak mi'8 mi, r4
   la'8 la, r4 si16 si do si si si do si

   %21
   la la si la la la si la sol4 r8 mi'\f
   mi' mi, mi mi sol16 fad mi4 mi8
   sol16 fad mi4 mi8 mi' si sol mi

   %24
   mi,\f mi' la, si mi,4 r %%fine ripresa?
   R1*11
   mi'4 r mi r\mbreak

   %37
   la, r re r
   re r sol, r
   mi' r mi r

   %40
   fad r r2
   R1*3
   r2 si,8 si si si

   %45
   fad'4 fad fad fad
   fad fad\mbreak fad r8 si\f
   si si si si re16 dod si4 si8

   %48
   re16 dod si4 si8 si fad re si
   si si mi fad si,4 r
   R1*17  %%%% inizio p. 8

   %67
   la4 mi' mi mi
   mi mi mi16\f mi fa mi mi mi fa mi
   re re mi re re re mi re do8\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo

   %70
   la\staccatissimo do\staccatissimo mi\staccatissimo mi,\staccatissimo\mbreak la4 r
   R1*17
   r2 si,4\f si  %% inizio ripresa

   %89
   si si si si
   si r si si
   si si si si

   %92
   si r\mbreak mi8\p mi mi mi
   mi mi mi mi mi mi mi mi
   la,\f la la la la la la la

   %95
   re\p re re re re re re re
   re re re re sol,\f sol sol sol
   sol sol sol sol mi' mi, r4

   %98
   mi'8 mi, r4\mbreak mi'8 mi, r4
   la'8 la, r4 si16 si do si si si do si
   la la si la la la si la sol4 r8 mi'\f

   %101
   mi' mi, mi mi sol16 fad mi4 mi8
   sol16 fad mi4 mi8 mi' si sol mi
   mi,\f mi' la, si mi,4\fermata r

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s8
   s1*8
   s2 <6 4>
   <7 5> <6 4>
   <3+> <6 4>
   <7 5> <6 4>
   <3+> <7 _+>
   s1*4
   s2 <5>
   s1*20
   <6>1
   <_+>
   s1*4
   <6 4>2 <5 3+>
   <6 4> <3+>
   s1*20
   s4 <6 4> <7 4 _+>2
   <6 4> <3+>

}

forma = {

   \key mi\minor
   \time 4/4
   \tempo 2 = 53
   \partial 8 s8
   s1*103
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
  \senza
}

IIvlIn = \relative do'' {

  r16 mi,\staccatissimo sol\staccatissimo si\staccatissimo mi\staccatissimo sol\staccatissimo si8\staccatissimo r16 red,,\staccatissimo fad\staccatissimo si\staccatissimo red\staccatissimo fad\staccatissimo si8\staccatissimo
  r16 mi,,  sold si re sold si8 r16 mi,, la do  mi la do8
  r16 si,, red fad lad'8.(si16) si, si,\p red fad lad'8.(si16)

  %4
  si,4 r16 si'(la fad) sol(si,) do8~do16 la'(sol mi)
  fad(la,) si8~si16 sol'(fad red)\mbreak mi(do) \appoggiatura si8 la~la16 la'(sol fad)
  sol8 sol,\f fad\tr[fad] mi4 r8 si'

  %7
  mi sol si sol sol\tr fad~fad16 do(si la)
  red, do' (si la) fad' do( si la) sol fad mi4 sol'8
  sol\tr fad4 la8 la\tr sol~sol16 si(sol mi)

  %10
  \appoggiatura re8 do4~do16 mi'(do si) \appoggiatura si8 lad4~lad16 sol!(fad mi)\mbreak %% fine prima riga p.11
  dod'16(sol fad mi) dod'(mi, re dod) \appoggiatura dod8 re4~re16 si(do32 si16.
  do32 si16. do32 si16. do32 si16. do32 si16.) sol'!4(lad8) si

  %13
  re, dod16 si dod4\tr  si r8 fad'
  si fad \appoggiatura mi re \appoggiatura dod si sol'\tr fad~fad16 sol(fad mi)
  lad,(sol' fad mi) fad, (mi' re dod)\mbreak re(dod) si8~si16 si(dod re)

  %16
  sold,(si re sold si8) re, do?32(si la8.)~la16 do(mi la)
  fa32(mi re8.)~re16 si'(fa re) do la la' la, si8.\tr la16
  la4 r8 mi' mi,16(sol si mi si'8) sol

  %19
  sol\tr fad?~fad16 do(si la) red,(do' si la) la'(do, si la)\mbreak
  sol fad mi8 r16 si''(la sol) sol si, \appoggiatura si8 do~do16 la'(sol mi)
  fad la, \appoggiatura la8 si~si16 sol'(fad red) mi sol, \appoggiatura sol 8 la~la16 la'(sol fad)

  %22
  sol(la si) mi, fad4\tr mi16 mi, sol si mi sol si8
  r16 red,, fad si red fad la8 sol mi fad red
  mi1\fermata

}

IIvlIIn = \relative do'' {

  r16 mi,\staccatissimo sol\staccatissimo si\staccatissimo mi\staccatissimo sol\staccatissimo si8\staccatissimo r16 red,,\staccatissimo fad\staccatissimo si\staccatissimo red\staccatissimo fad\staccatissimo si8\staccatissimo
  r16 mi,,  sold si re? sold si8 r16 mi,, la do  mi la do8
  r16 si,, red fad lad'8.(si16) si, si,\p red fad lad'8.(si16)

  %4
  si,4 r16 si'(la fad) sol(si,) do8~do16 la'(sol mi)
  fad(la,) si8~si16 sol'(fad red)\mbreak mi(do) \appoggiatura si8 la~la16 la'(sol fad)
  sol8 sol,\f fad\tr[fad] mi4 r

  %7
  r8 si' mi mi mi red red4
  r8 red? red red si si si4
  r8 red red red si si si4

  %10
  r8 do do do dod dod dod4\mbreak
  r8 dod? dod dod re re re4
  r2 r8 mi dod re

  %13
  re re dod dod re re re4
  r8 re re re mi re re4
  r8 dod dod dod\mbreak re re re4

  %16
  r8 si si si do do do4
  r8 la la la do do si si
  do do do4 r8 si si mi

  %19
  mi red red4 r8 red red red\mbreak
  si si si4 si8 r do r
  la r si r sol r la red

  %22
  mi  mi mi red mi16 mi, sol si mi sol si8
  r16 red,, fad si red fad la8 sol mi fad red
  mi1\fermata

}

IIvlIIIn =  \relative do'' {

  r16 si,\staccatissimo mi\staccatissimo sol\staccatissimo si\staccatissimo mi\staccatissimo sol8\staccatissimo r16 si,, red fad si red fad8
  r16 si,, mi sold si re? sold8 r16 do,, mi la do mi la8
  r16 red,, fad si \slurDashed mi8. (red16) red red,\p fad si mi8. (red16)\slurSolid

  %4
  red?4 r16 si'(la fad) sol(si,) do8~do16 la'(sol mi)
  fad(la,) si8~si16 sol'(fad red)\mbreak mi(do) \appoggiatura si8 la~la16 la'(sol fad)
  sol8 mi,4 red8 mi4 r

  %7
  r8 sol sol sol si si si4
  r8 fad fad fad sol sol sol4
  r8 fad fad fad' mi mi mi4

  %10
  r8 sol, sol sol lad lad lad4\mbreak
  r8 fad fad fad fad fad fad4
  r2 r8 si lad fad

  %13
  fad fad lad lad fad fad fad4
  r8 fad fad fad si si si4
  r8 fad fad fad\mbreak fad fad fad4

  %16
  r8 sold sold sold mi mi mi4
  r8 fa fa fa mi mi sold sold
  mi mi mi4 r8 sol sol sol

  %19
  si si si4 r8 fad fad fad\mbreak
  sol sol sol4 sol8 r mi r
  fad r re r mi r do' si

  %22
  sol sol fad fad sol16 si, mi sol si mi sol8
  r16 si,, red fad si red fad8 mi sol, la fad
  mi1\fermata

}

IIvlan = \relative do' {

  sol8 sol sol sol fad fad fad fad
  mi mi  mi mi mi mi mi mi'
  red si si si fad' si, si si

  %4
  fad' fad fad red si la' mi dod
  la sol' re? si\mbreak sol fad' red! red
  si si si si sol4 r

  %7
  r8 mi' mi mi si si si4
  r8 si si si mi mi mi4
  r8 si si si mi mi mi4

  %10
  r8 mi mi mi fad fad fad4\mbreak
  r8 lad, lad lad si si si4
  r2 r8 mi fad si,

  %13
  si si fad' fad, si si si4
  r8 si si si si si si4
  r8 lad lad lad\mbreak si si si4

  %16
  r8 mi mi mi la, la la4
  r8 re re re la la mi' mi,
  la la la4 r8 mi' mi mi

  %19
  si si si4 r8 si si si\mbreak
  mi mi mi4 mi8 r la, r
  re r sol, r do r fad, si

  %22
  mi mi si si sol sol sol sol
  fad fad fad si si si do si
  si1\fermata

}

IIbcn = \relative do {

  mi8 mi mi mi si si la la
  sold sold sold sold la la la la
  si si si si si si si si

  %4
  si si si si mi r la, r
  re r sol, r\mbreak do r fad si,
  mi mi, si'[si] mi,4 r

  %7
  R1*15
  r2 mi'8 mi mi mi
  si si si si mi mi la, si

  %24
  mi,1\fermata

}

IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <_+>
  s1
  <_+>4 <7+ 4> <3+> <7+ 4>
  <3+>1
  s
  s4 <5 4>8 <3+> s2
  s1*16
  <_+>1

}

forma = {

  \key mi\minor
  \time 4/4
  \tempo 4 = 45
  s1*24
  \bar"|."


}

IIvlI = {
  \IIglobal
  \notypeset
  <<\IIvlIn \forma>>

}

IIvlII = {
  \IIglobal
  <<\IIvlIIn \forma>>

}

IIvlIII = {
  \IIglobal
  <<\IIvlIIIn \forma>>

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
  \senza
}

IIIvlIn = \relative do'' {

  r8 mi, sol mi si' mi,
  si''16[la sol fad mi re do si] sol'8 si
  mi, mi, sol mi si' mi,

  %4
  si''16[la sol fad mi re do si] sol'8 si
  mi, sol, si sol mi' si  %%%%%% ripresa
  sold'2.

  %7
  la8 mi, la mi do' la
  fad'2.
  sol8 re, sol re si' sol\mbreak

  %10
  fa'2.
  mi
  red4 r r

  %13
  red,8 si mi si fad' si,
  sol' si, la' si, si' si,
  la''4\p(sol) fad

  %16
  sol8. la16 si4 r
  R2.
  do\f

  %19
  si\mbreak
  la
  sol

  %22
  fad
  mi4 r si,\p
  do si2

  %25
  do4 si2
  <<{mi'4\f mi mi}\\{\stemUp \override Stem #'transparent = ##t si si si}\\{\stemDown sol sol sol}>>
  si'\p(la) sol

  %28
  mi8\f[re16 do si8 la sol fad]
  mi8 sol'32[(la si16)] do,8 si' si, si'
  la, si' sol, si' fad, si'\mbreak

  %31
  mi,, si'' red,, si'' do,,! si''
  si,, fad''32[(sol la16)] red,8 la' do, la'
  si, la'32[(si do16)] fad,8 do' mi, do'

  %34
  red, red'32[(mi fad16)] fad2~
  fad8 mi red dod si la
  sol si, mi,4 r

  %37
  sol''8 mi do? mi si mi
  la, mi'(fad sol fad mi)
  fad re si re la re\mbreak

  %40
  sol, re'(mi fad mi re)
  mi do la do sol do
  fad, do'(re  mi re do)

  %43
  do2\tr si4
  r8 si sol si mi, si'
  sol, si' sol si mi, si'

  %46
  do,, la'' fad la re, la'
  fad, la' fad la re, la'
  si,, sol'' mi sol do, sol'

  %49
  mi, sol' mi sol do, sol'
  la,, fad'' re fad la do,\mbreak
  si8\tr\f(la16 si) si8\tr(la16 si) si8\tr(la16 si)

  %52
  do8(fad la do, si la)
  si8\tr(la16 si) si8\tr(la16 si) si8\tr(la16 si)
  do8 fad la16[sol fad mi re do si la]

  %55
  si8 sol' \appoggiatura la sol fad16 sol \appoggiatura si8 la sol16 la
  si8 sol \appoggiatura do si la16 si \appoggiatura re8 do si16 do
  re8 sol, la2\tr

  %58
  sol8\tu sol, si sol re' sol,  %%5fine p 15
  re''16[do si la sol fad mi re] si'8 re
  sol, sol, si sol re' sol,

  %61
  re''16[do si la sol fad mi re] si'8 re
  R2.
  mi

  %64
  re
  do
  si

  %67
  la
  sol4 r re,\p
  mi re2\mbreak

  %70
  mi4 re2
  <<{sol'4 sol sol}\\{\stemUp \override Stem #'transparent = ##t si, si si}\\{\stemDown \override Stem #'transparent = ##t re, re re}\\{\stemDown sol, sol sol}>>
  re'''4(do) si

  %73
  sol8[fad16 mi re8 do si la]
  sol16\solo[la si do re mi fad sol] la si do re
  do4(la) fad

  %76
  re,16[mi fad sol la si do re mi fad sol la]
  si4(la) sol
  sol16 si sol re mi sol mi si do mi do sol

  %79
  la do la mi fad la fad do re fad re la
  si4 sol r\mbreak
  fa''8(re sold, re' fa4)

  %82
  mi(si') re,
  do16 mi do la mi' la mi do la' do la mi
  r8 mi'-.(mi-. mi-. mi-. mi-.)

  %85
  sol2.~
  sol8 fa-.(mi-. re-. dod-. si
  la-. sol-. fa-. mi-. re-. dod-.)

  %88
  re4.\tr(dod16 re) la8\noBeam r
  r re'-.(re-. re-. re-. re-.)
  fa2.~

  %91
  fa8 mi-.(re-. do-. si-. la-.
  sol-. fa-. mi-. re-. do?-. si-.)
  do4.(si16 do) sol8\noBeam r

  %94
  re'4.\tr(do16 re) sol,8\noBeam r
  mi'4.\tr (re16 mi) sol,8\noBeam r
  fa'4.\tr(mi16 fa) sol,8\noBeam r

  %97
  re''4~re16[do si la sol fa mi re]
  \stemDown mi(do) \stemUp sol, sol sol \stemDown do'(mi) mi mi(do)\stemUp sol, sol
  sol si' (re8) r4 r

  %100
  \stemDown fa16(re) \stemUp sol,, sol sol \stemDown re''(fa) fa fa(re) \stemUp sol,, sol\mbreak
  sol \stemDown do'(mi8) \stemNeutral r4 r
  sol16(fa mi re do4) sib

  %103
  la'16(sol fa mi re4) do
  si'16(la sol fa mi4) re
  do'16 si do la la sol la fa fa mi fa re'

  %106
  re do re si si la si sol sol fad? sol mi'
  mi4~mi16 do si do mi do si do
  fa4~fa16 re do re  fa re do re

  %109
  sol8 do, \appoggiatura {si16[re]} re2\tr
  sol8 do, \appoggiatura {si16[re]} re2\tr\mbreak
  do8 do,, mi do sol' do,

  %112
  sol''16[fa  mi re do si la sol] mi'8 sol
  do, do, mi do sol' do,
  sol''16[fa mi re do si la sol] mi'8 sol

  %115
  sol la, dod la mi' la,
  fa' la, re la fa' re
  fad! si, red si fad' si,

  %118
  sol' mi, sol mi si' mi,
  si''16[la sol fad mi re do si] sol'8 si
  mi, mi, sol mi si' mi,\mbreak

  %121
  si''16[la sol fad mi re do si] sol'8 si
  sol mi si sol mi4
  mi16 si' mi si fad si mi si sol si mi si

  %124
  la si mi si sol si mi si fad si mi si
  mi, si' mi si fad si mi si sol si mi si
  la si mi si sol si mi si fad si mi si
  <<mi4\\\stemUp \override Stem #'transparent = ##t si\\\stemDown mi,>> r r

  %128
  mi16(si' sol' la) si2
  \tuplet 3/2 { do,16 re mi la,[si do] } la,8 r r4\mbreak
  re16(la' fad' sol) la2

  %131
  \tuplet 3/2 { si,16 do re sol,[la si] } sol,8 r r4
  sol'16(do mi fad) sol2
  \tuplet 3/2 { fad16 sol la red,[mi fad] }si,,8 r r4

  %134
  si''16(sold) fad(mi) re'(si) la(sold) si(sold) fad(mi)
  mi(do) si(la) la'(mi) re(do) mi(do) si(la)
  la'(fad) mi(red) fad(red) dod(si) red si la sol\mbreak

  %137
  si'(sol) fad(mi) sol(mi) re(do) mi(do) si(la)
  do'(la) sol(fad) la(fad) mi(red) fad(red) dod(si)
  mi'-.(re?-. do?-. si-. do-. si-. la-. sol-. la-. sol-. fad-. mi-.)

  %140
  red4~red32 fad(mi red mi fad sol la64 si do8) mi,
  mi2\tr(red4)
  <<{s16 mi\staccatissimo s mi\staccatissimo s16 mi\staccatissimo s mi\staccatissimo s16 mi\staccatissimo s mi\staccatissimo}\\{mi'^\staccatissimo [s mi,^\staccatissimo] s mi'^\staccatissimo [s mi,^\staccatissimo] s mi'^\staccatissimo [s mi,^\staccatissimo] s}>>

  %143
  do'(si do) do do(si do) do do(si do) do
  <<{s16 mi, s mi s16 mi s mi s16 mi s mi}\\{mi' [s mi,] s mi' [s mi,] s mi' [s mi,] s}>>

  %145
  red'(do red) red red(do red) red red(do red) red
  mi8 re?16-.(do-. si-.[la-. sol-. fad-. mi-. re-. do-. si-. ]
  la-. sol-. fad-. mi-.) <<fad'2\tr\\si,>>

  %148
  mi8(fa)~fa[\appoggiatura la sol16 fa(mi8) red]
  mi(fa)~fa[\appoggiatura la sol16 fa(mi8) red]\mbreak
  mi4~\tuplet 3/2 { mi16 mi fad sol[fad mi] si' mi, fad sol[fad mi] }

  %151
  mi'8 mi,<<{fad4.\tr mi8}\\si2>>
  mi8 sol, si sol mi' si  %%%%%% ripresa
  sold'2.

  %154
  la8 mi, la mi do' la
  fad'2.
  sol8 re, sol re si' sol\mbreak

  %157
  fa'2.
  mi
  red4 r r

  %160
  red,8 si mi si fad' si,
  sol' si, la' si, si' si,
  la''4\p(sol) fad

  %163
  sol8. la16 si4 r
  R2.
  do\f

  %166
  si\mbreak
  la
  sol

  %169
  fad
  mi4 r si,\p
  do si2

  %172
  do4 si2
  <<{mi'4\f mi mi}\\{\stemUp \override Stem #'transparent = ##t si si si}\\{\stemDown sol sol sol}>>
  si'\p(la) sol

  %175
  mi8\f[re16 do si8 la sol fad]
  mi4\fermata r r

}

IIIvlIIn = \relative do'' {

  r8 mi, sol mi si' mi,
  si''16[la sol fad mi re do si] sol'8 si
  mi, mi, sol mi si' mi,

  %4
  si''16[la sol fad mi re do si] sol'8 si
  mi, sol, si sol mi' si  %%%%%% ripresa
  sold'2.

  %7
  la8 mi, la mi do' la
  fad'2.
  sol8 re, sol re si' sol\mbreak

  %10
  fa'2.
  mi
  red4 r r

  %13
  red,8 si mi si fad' si,
  sol' si, la' si, si' si,
  la''4\p(sol) fad

  %16
  sol8. la16 si4 r
  R2.
  do\f

  %19
  si\mbreak
  la
  sol

  %22
  fad
  mi4 r si,\p
  do si2

  %25
  do4 si2
  <<{mi'4\f mi mi}\\{\stemUp \override Stem #'transparent = ##t si si si}\\{\stemDown sol sol sol}>>
  si'\p(la) sol

  %28
  mi8\f[re16 do si8 la sol fad]
  mi4 r r  %%%%% fine ripresa
  R2.*7

  %37
  sol'4 r r
  sol sol sol
  fad r r\mbreak

  %40
  fad fad fad
  mi r r
  mi  mi mi

  %43
  re re re
  R2.*14
  r8 sol, si sol re' sol,

  %59
  re''16[do si la sol fad mi re] si'8 re
  sol, sol, si sol re' sol,

  %61
  re''16[do si la sol fad mi re] si'8 re
  R2.
  mi

  %64
  re
  do
  si

  %67
  la
  sol4 r re,\p
  mi re2\mbreak

  %70
  mi4 re2
  <<{sol'4 sol sol}\\{\stemUp \override Stem #'transparent = ##t si, si si}\\{\stemDown \override Stem #'transparent = ##t re, re re}\\{\stemDown sol, sol sol}>>
  re'''4(do) si

  %73
  sol8[fad16 mi re8 do si la]
  sol4 r r
  R2.*6\mbreak

  %81
  fa'2.
  mi4 mi mi
  mi r r

  %84
  mi4 mi mi
  mi8 mi mi mi mi mi
  sol4 sol mi

  %87
  mi mi mi
  fa fa fa
  fa? re re

  %90
  re8 re re re re re
  fa4 fa re
  fa? fa re\mbreak

  %93
  mi mi mi
  re re re
  mi mi mi

  %96
  re re re
  fa fa fa
  mi r r

  %99
  r8 re, sol si re fa
  R2.\mbreak
  r8 mi, sol do mi sol

  %102
  do,4 do do
  do re re
  re mi mi

  %105
  mi fa fa
  fa? sol sol
  sol la la

  %108
  sol sol sol
  sol8 mi re4 re
  sol8 mi re4 re\mbreak

  %111
  mi8 do, mi do sol' do,
  sol''16[fa  mi re do si la sol] mi'8 sol
  do, do, mi do sol' do,
  sol''16[fa mi re do si la sol] mi'8 sol

  %115
  sol la, dod la mi' la,
  fa' la, re la fa' re
  fad! si, red si fad' si,

  %118
  sol' mi, sol mi si' mi,
  si''16[la sol fad mi re do si] sol'8 si
  mi, mi, sol mi si' mi,\mbreak

  %121
  si''16[la sol fad mi re do si] sol'8 si
  sol mi si sol mi4
  mi16 si' mi si fad si mi si sol si mi si

  %124
  la si mi si sol si mi si fad si mi si
  mi, si' mi si fad si mi si sol si mi si
  la si mi si sol si mi si fad si mi si

  %127
  r8 sol si sol mi' si
  si si si si si mi
  do do do do do do\mbreak
  do do do do do do

  %131
  si si si si si si
  sol' sol sol sol sol sol
  fad fad fad fad fad fad

  %134
  sold,4 sold sold
  la la, la
  red red r

  %137
  mi mi r
  fad fad r
  sol la do,

  %140
  si si r
  si si si
  sol''8 sol sol sol sol sol\mbreak

  %143
  mi mi mi mi mi mi
  sol sol sol sol sol sol
  fad fad fad fad fad fad

  %146
  sol4 r r
  mi8 mi fad fad fad fad
  sol do, do do si si

  %149
  si do do do si si\mbreak
  si sol' sol sol sol sol
  sol sol fad fad fad fad

  %152
  mi sol, si sol mi' si  %%%%%% ripresa
  sold'2.

  %154
  la8 mi, la mi do' la
  fad'2.
  sol8 re, sol re si' sol\mbreak

  %157
  fa'2.
  mi
  red4 r r

  %160
  red,8 si mi si fad' si,
  sol' si, la' si, si' si,
  la''4\p(sol) fad

  %163
  sol8. la16 si4 r
  R2.
  do\f

  %166
  si\mbreak
  la
  sol

  %169
  fad
  mi4 r si,\p
  do si2

  %172
  do4 si2
  <<{mi'4\f mi mi}\\{\stemUp \override Stem #'transparent = ##t si si si}\\{\stemDown sol sol sol}>>
  si'\p(la) sol

  %175
  mi8\f[re16 do si8 la sol fad]
  mi4\fermata r r

}

IIIvlIIIn =  \relative do'' {

  R2.
  r8 mi, sol mi si' mi,
  si''16[la sol fad mi re do si] sol'8 si

  %4
  mi, mi, sol mi si' mi,
  si''16[la sol fad mi re do si] sol'8 si  %%%ripresa
  re,2.

  %7
  la'16[sol fad mi re do si la] mi'8 la
  do,2.
  sol'16[fa mi re do si la sol] re'8 sol\mbreak

  %10
  do,2.~
  do
  si4 r r

  %13
  red,8 si mi si fad' si,
  sol' si, la' si, si' si,
  fad''4\p(mi) red

  %16
  mi8. fad16 sol4 r
  si8 si, si' si, si' si,
  si' si, la' si, la' si,

  %19
  la' si, sol' si, sol' si,\mbreak
  sol' si, fad' si, fad' si,
  fad' si, mi si mi si

  %22
  mi si red si red si
  <<mi4\\\stemUp \override Stem #'transparent = ##t si\\\stemDown sol>> r sol,\p
  la sol2

  %25
  la4 sol2
  <<{mi''4\f mi mi}\\{\stemUp \override Stem #'transparent = ##t si si si}\\{\stemDown sol sol sol}>>
  sol'\p(fad) mi

  %28
  mi8\f[re16 do si8 la sol fad]
  mi4 r r %%%%fine ripresa
  R2.*7

  %37
  si'4 r r
  do do do
  la r r\mbreak

  %40
  si si si
  sol r r
  do do la

  %43
  sol sol sol
  R2.*15\mbreak
  r8 sol si sol re' sol,

  %60
  re''16[do si la sol fad mi re] si'8 re
  sol, sol, si sol re' sol,
  re'' re, re' re, re' re,

  %63
  re' re, do' re, do' re,
  do' re, si' re, si' re,
  si' re, la' re, la' re,

  %66
  la' re, sol re sol re
  sol re fad re fad re
  <<{sol4 }\\{\stemUp \override Stem #'transparent = ##t si,}\\{\stemDown \override Stem #'transparent = ##t re,}\\{\stemDown sol,}>> r si\p

  %69
  do si2\mbreak
  do4 si2
  <<{sol''4 sol sol}\\{\stemUp \override Stem #'transparent = ##t si, si si}\\{\stemDown \override Stem #'transparent = ##t re, re re}\\{\stemDown sol, sol sol}>>

  %72
  si''4(la) sol
  sol8[fad16 mi re8 do si la]
  sol4 r r

  %75
  R2.*6\mbreak
  si2.
  si4 si si

  %83
  do r r
  dod dod dod
  dod?8 dod dod dod dod dod

  %86
  dod?4 dod dod
  dod? dod dod
  la la la

  %89
  si si si
  si8 si si si si si
  si4 si si

  %92
  si si si\mbreak
  do do do
  si si si

  %95
  do do do
  si si si
  si si si

  %98
  do r r
  r8 si, re sol si re
  R2.

  %101
  r8 do, mi sol do mi
  sol,4 sol sol
  la la la

  %104
  si si si
  do do do
  re re re

  %107
  mi mi mi
  re re re
  mi8 do do4 si

  %110
  mi8 do do4 si\mbreak
  do r r
  r8 do, mi do si' do,

  %113
  sol''16[fa mi re do si la sol] mi'8 sol
  do, do, mi do sol' do,
  mi' mi, la mi dod' mi

  %116
  re fa, la fa re' la
  red fad,? si fad red' fad,
  mi'4 r r

  %119
  r8 mi, sol mi si' mi,
  si''16[la sol fad mi re do si] sol'8 si\mbreak
  mi, mi, sol mi si' mi,

  %122
  mi' mi si sol mi4
  R2.*4
  r8 mi sol mi si' sol

  %128
  sol sol sol sol sol sol
  mi mi mi mi mi mi\mbreak
  fad fad fad fad fad fad

  %131
  re re re re re si'
  do do do do do mi
  red red red red red red

  %134
  sold,4 sold sold
  la la, la
  red red r

  %137
  mi mi r
  fad fad r
  sol la do,

  %140
  si si r
  si si si
  si'8 si si si si si\mbreak

  %143
  do do do do do do
  si si si si si si
  red red red red red red

  %146
  si4 r r
  la8 la red red red red
  si8 do do do si si

  %149
  si do do do si si\mbreak
  si si si si si si
  si si red red red red

  %152
  si16[la' sol fad mi re do si] sol'8 si  %%%ripresa
  re,2.
  la'16[sol fad mi re do si la] mi'8 la

  %155
  do,2.
  sol'16[fa mi re do si la sol] re'8 sol\mbreak
  do,2.~

  %158
  do
  si4 r r
  red,8 si mi si fad' si,

  %161
  sol' si, la' si, si' si,
  fad''4\p(mi) red
  mi8. fad16 sol4 r

  %164
  si8 si, si' si, si' si,
  si' si, la' si, la' si,
  la' si, sol' si, sol' si,\mbreak

  %167
  sol' si, fad' si, fad' si,
  fad' si, mi si mi si
  mi si red si red si

  %170
  <<mi4\\\stemUp \override Stem #'transparent = ##t si\\\stemDown sol>> r sol,\p
  la sol2
  la4 sol2

  %173
  <<{mi''4\f mi mi}\\{\stemUp \override Stem #'transparent = ##t si si si}\\{\stemDown sol sol sol}>>
  sol'\p(fad) mi
  mi8\f[re16 do si8 la sol fad]

  %176
  mi4\fermata r r

}

IIIvlan = \relative do' {

  sol4 si sol
  sol si si
  sol si si

  %4
  sol si si
  sol si si %% ripresa
  si'2~si8 sold

  %7
  mi4. do8 la4
  la'2~la8 fad
  re4. si8 si4\mbreak

  %10
  la'2.~
  la
  fad4 r r

  %13
  red8 si mi si fad' si,
  sol' si, la' si, si' si,
  R2.*2

  %17
  sol'4 sol sol
  la la fad
  sol sol mi\mbreak

  %20
  fad fad red
  mi mi mi
  fad si, si

  %23
  si r mi,\p
  mi mi mi
  mi mi mi

  %26
  mi'\f mi mi
  mi\p r r
  mi'8[re16 do si8 la sol fad]

  %29
  mi4 r r  %%% ripresa
  R2.*7
  mi4 r r

  %38
  la la la
  re, r r\mbreak
  sol sol sol

  %41
  do, r r
  fad fad fad
  sol sol, sol

  %44
  R2.*14
  si4 re si\mbreak
  si re re

  %60
  si re re
  si re re
  si' si si

  %63
  do do la
  si si sol
  la la fad

  %66
  sol sol re
  re re re
  si r sol\p

  %69
  sol sol sol\mbreak
  si si si
  re re re

  %72
  re r r
  sol8[fad16 mi re8 do re re]
  sol,4 r r

  %75
  R2.*6
  sold'2.
  sold?4 sold sold

  %83
  la r r
  la, la la
  la8 la la la la la

  %86
  la4 la la
  la la la
  re re re

  %89
  sol, sol sol
  sol8 sol sol sol sol sol
  sol4 sol sol

  %92
  sol sol sol\mbreak
  sol sol sol
  sol sol sol

  %95
  sol sol sol
  sol sol sol
  sol sol sol

  %98
  sol4 r r
  R2.*3
  mi'4 mi mi

  %103
  fa fad fad
  sol sold sold
  la la la

  %106
  si si si
  do do do
  si si si

  %109
  do8 do, sol'[fad sol sol,]
  do' do, sol'[fad sol sol,]\mbreak
  sol'4 sol mi

  %112
  mi mi do
  mi mi do
  mi mi do

  %115
  dod dod la'
  la la la
  la la la

  %118
  si si, si
  sol si si
  sol si si\mbreak

  %121
  sol si si
  si8 mi' si sol mi4
  R2.*4

  %127
  si4 sol sol
  mi'8 mi  mi mi mi mi
  la, la la la la la\mbreak

  %130
  re re re re re re
  sol, sol sol sol sol sol
  mi' mi mi mi mi mi

  %133
  si si si si si si
  sold'4 sold sold
  la la, la

  %136
  red red r
  mi mi r
  fad fad r

  %139
  sol la la,
  si si r
  si si si

  %142
  mi8 mi mi mi mi mi\mbreak
  la, la la la la la
  mi' mi mi mi mi mi

  %145
  si si si si si si
  mi4 r r
  do8 do si si si si

  %148
  mi la la la la la
  sol la la la la la\mbreak
  sol mi mi mi mi mi

  %151
  mi mi si si si si
  mi4 si si %% ripresa
  si'2~si8 sold

  %154
  mi4. do8 la4
  la'2~la8 fad
  re4. si8 si4\mbreak

  %157
  la'2.~
  la
  fad4 r r

  %160
  red8 si mi si fad' si,
  sol' si, la' si, si' si,
  R2.*2

  %164
  sol'4 sol sol
  la la fad
  sol sol mi\mbreak

  %167
  fad fad red
  mi mi mi
  fad si, si

  %170
  si r mi,\p
  mi mi mi
  mi mi mi

  %173
  mi'\f mi mi
  mi\p r r
  mi'8[re16 do si8 la sol fad]

  %176
  mi4\fermata r r

}

IIIbcn = \relative do {

  mi4 mi, mi'
  mi mi, mi'
  mi mi, mi'

  %4
  mi mi, mi'
  mi mi, mi' %%%% ripresa
  mi'16[re do si la sold fad mi] mi'8 mi,

  %7
  do4 la la'
  re16[do si la sol fad mi re] re'8 re,
  si4 sol sol'\mbreak

  %10
  la16[sol fa mi re do si la] la8 la'
  la16[sol fa mi re do si la] do8 la'
  si,4 r r

  %13
  red8 si mi si fad' si,
  sol' si, la' si, si' si,
  R2.*2

  %17
  si'8 si, si' si, si' si,
  si' si, si' si, si' si,
  si' si, si' si, si' si,\mbreak

  %20
  si' si, si' si, si' si,
  si' si, si' si, si' si,
  si' si, si' si, si' si,

  %23
  mi4 r r
  R2.*2
  mi4 mi mi

  %27
  mi r r
  mi'8[re16 do si8 la si si,]
  mi4 do'8 r si r %%%%%%fine ripresa

  %30
  la r sol r fad r\mbreak
  mi r red r do! r
  si r \clef tenor red' r do! r

  %33
  si r fad' r mi r
  red r \clef bass la r fad r
  red r si r red r

  %36
  mi red mi fad sol mi
  R2.*7
  sol4 \clef tenor sol' mi

  %45
  sol, sol' mi
  \clef bass do, \clef tenor fad' re
  fad, fad' re

  %48
  \clef bass si,\clef tenor mi' do
  mi, mi' do
  \clef bass la, fad' re\mbreak

  %51
  sol8 fad sol la si sol
  la4 fad re
  sol8 fad sol la si sol

  %54
  la4 re, fad
  sol8 si la sol fad re
  sol si la sol la fad

  %57
  si sol re' do re re,
  sol4 sol, sol'\mbreak
  sol sol, sol'

  %60
  sol sol, sol'
  sol sol,8 sol' sol si
  re re, re' re, re' re,

  %63
  re' re, re' re, re' re,
  re' re, re' re, re' re,
  re' re, re' re, re' re,

  %66
  re' re, re' re, re' re,
  re' re, re' re, re' re,
  sol,4 r r

  %69
  R2.*2
  sol4 sol sol
  sol r r

  %73
  sol'8[fad16 mi re8 do8 re re,]
  sol4 r r
  re'2.

  %76
  re4 r r
  sol2.
  sol4 sol mi

  %79
  do' la fad
  sol8 fad sol la si sol\mbreak
  R2.*2

  %83
  la,4 la' la,
  la r r
  R2.*3

  %88
  r4 r8 re' fa, re
  R2.*4
  r4 r8 do' mi, do

  %94
  r4 r8 sol' si, sol
  r4 r8 do' mi, do
  r4 r8 sol' si, sol

  %97
  r4 r8 sol' si, sol
  do4 do do
  sol' sol, sol

  %100
  sol sol sol\mbreak
  do do do
  R2.*9

  %111
  do'4 do, do'
  do do, do'
  do do, do'

  %114
  do do, do'
  la la, la'
  re re, re'

  %117
  si si, si'
  mi, mi, mi'
  mi mi, mi'

  %120
  mi mi, mi'\mbreak
  mi mi, mi'
  mi8 mi' si sol mi4

  %123
  mi fad sol
  la sol fad
  mi fad sol

  %126
  la sol  fad
  mi mi mi
  R2.*24

  %152
  mi4 mi, mi' %%%% ripresa
  mi'16[re do si la sold fad mi] mi'8 mi,
  do4 la la'

  %155
  re16[do si la sol fad mi re] re'8 re,
  si4 sol sol'\mbreak
  la16[sol fa mi re do si la] la8 la'

  %158
  la16[sol fa mi re do si la] do8 la'
  si,4 r r
  red8 si mi si fad' si,

  %161
  sol' si, la' si, si' si,
  R2.*2
  si'8 si, si' si, si' si,

  %165
  si' si, si' si, si' si,
  si' si, si' si, si' si,\mbreak
  si' si, si' si, si' si,

  %168
  si' si, si' si, si' si,
  si' si, si' si, si' si,
  mi4 r r

  %171
  R2.*2
  mi4 mi mi
  mi r r

  %175
  mi'8[re16 do si8 la si si,]
  mi4\fermata r r

}

IIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2.*5
  <_+>2.
  s2.*3
  <6->2.
  <5>
  <_+>
  s2.*5
  <9 8 7>2.
  <8 7 6>
  <7 6 5>4 s <3+>
  <6 5 4>2.
  <5 4>4 <3+>2
  s2.*40
  <9 8 7>2.
  <8 7 6>
  <7 6 5>
  <6 5 4>
  <5 4>4 <3>2
  s2.*7
  <7>2.
  s2.*39
  <_+>2.
  <_->
  <_+>

}

forma = {

  \key mi\minor
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 1 = 45
  s2.*176
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
#(set-global-staff-size 15)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] All[egr]o"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new Staff <<
        \set Staff.instrumentName =  \markup \center-column{"Violino""Principale"}
        \set Staff.midiInstrument = #"violin"
        \IvlI
      >>

      \new Staff <<
        \set Staff.instrumentName =  \markup \center-column{"[Violino I]"}
        \set Staff.midiInstrument = #"violin"
        \IvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
        \IvlIII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.instrumentName = \markup \center-column{"[Viola]"}
        \Ivla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"cello"
        \set Staff.instrumentName = \markup \center-column{"[Basso]"}
        \Ibc

      >>
    >>

  }

  \layout {

    indent = 1.4\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[2.] Largo"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvlIII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIvla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"cello"
        \IIbc

      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[3.] Allegro"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    }<<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIIvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIIvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIIvlIII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIIvla
      >>
      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"cello"
        \IIIbc

      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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



