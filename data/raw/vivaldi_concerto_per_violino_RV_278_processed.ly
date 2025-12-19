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

Iglobal = {
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
   \terzine\senza
}

Ivln = \relative do'' {

   mi,16 si sol si sol si sol si mi si sol si sol si sol si
   mi mi' si sol mi mi' si sol mi mi' si sol mi mi' si sol
   mi[si sol si sol si sol si] mi[si sol si sol si sol si]

   %4
   mi4-\tweak Y-offset #+4.5 ^\markup\huge "Largo" r r r8 r16 do''\pp
   do8(si) r r16 si\mbreak si8(la) r r16 la
   sol2\fermata\tr fad\fermata

   %7
   si,16-\tweak Y-offset #+4.5 ^\markup\huge "All[egr]o molto" \f[fad re fad re fad re fad] si fad re fad re fad re fad
   si si' fad re si si' fad re si si' fad re si si' fad re
   si[fad re fad re fad re fad] si [fad re fad re fad re fad]

   %10
   si4-\tweak Y-offset #+4.5 ^\markup\huge "And[ant]e" r8 fad'\p \appoggiatura mi8 re16.[dod32 si8 si si]\mbreak
   \appoggiatura {si16[dod]} re16. dod32 si4 si8 \appoggiatura {si16[dod]} re16. dod32 si4 sol'8
   fad16 fad(mi re) mi mi(re dod) re dod si4 si'8

   %13
   \appoggiatura la sol16.[fad32 mi8 mi mi] \appoggiatura {mi16[fad]} sol16. fad32 mi4 mi,8
   \appoggiatura {mi16[fad]} sol16. fad32 mi4 sol'8 sol16(fad) fad(si) si(mi,) do'(mi,)
   mi8\tr red r \parenthesize si'\mbreak re,? sold, si, re'

   %16
   sold4~\tuplet 3/2 { sold16 si-. la-. sold-.[fad-. mi-.] } re\parenthesize -.[(fa-. fa-. fa-. fa-. fa-. si8)]
   \tuplet 3/2 { do,16 mi re do[si la] } \once\stemUp la,8 la'' do, fad, la, do'
   fad4~\tuplet 3/2 { fad16 la-. sol-. fad-.[mi-. re-.] } do-.[(mib-. mib-. mib-. mib-. mib-. la8)]

   %19
   \tuplet 3/2 { si,16 re do si[la sol] } sol,8 \once\stemDown  mi''\f\mbreak mi32 si sol si mi[si sol si] mi si sol si mi[si sol si]  %% inizio ripresa
   mi do la do mi[do la do] mi do la do mi[do la do] fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod]
   fad4 r16 si,-.\p red-. fad-. sol sol (fa8) r16 fa-. sol-. la-.\mbreak

   %22
   red,16 red(mi8)  r16 si-.\f mi-. sol-. si la32 sol fad? mi red dod si16 la sol fad
   mi4 r16 si'\parenthesize -. mi\parenthesize -. sol\parenthesize -. si la32 sol fad mi red dod si16 la sol fad
   mi4 r8 si''16.\solo do32 red,8 red16. fad32 la,8 si'16. do32 %%% Fine rip.

   %25
   si4(la8\tr) sol16. la32 fad8 fad16. si32 mi,8 si'16. do32\mbreak
   mi,4(red8\tr) si' mi32 si sol mi sol[si re? mi] re8 (do16.) si32
   si4(do8) la re32 la fad re fad[la do re] do8(si16.) lad32

   %28
   lad?4(si8) sol do32 si la? sol la[sol fad mi] fad mi red dod red[dod si lad]
   si fad red fad si,[fad' red fad] si,[fad' red fad] si,[fad' red fad] si, sol' mi sol si,[sol' mi sol] si, sol' mi sol si,[sol' mi sol]
   si,\p fad' red fad si,[fad' red fad] si, fad' red fad si,[fad' red fad] si, sol' mi sol si,[sol' mi sol] si, sol' mi sol si,[sol' mi sol]

   %31
   fad8\tr si, r si''16.-. (do32-. re16-. re-. re-. mi-. fa-. fa-. fa-. mi-.
   re-. re-. re-. do-. si-. si-. si-. la-.)\mbreak sold4~\tuplet 3/2 { sold16 si-.(la-. sold-.[fa?-. mi-.)] }
   re-.(re-. re-. re-. re-. re-. re\tr do32 si) do la la' si do[la do re] mi8\noBeam la,16-.(si-.

   %34
   do-. do-. do-. re-. mib-. mib -. mib-. re-. do-. do-. do-. si-. la-. la-. la-. sol-.)
   fad4~\tuplet 3/2 { fad16 la-. sol-. fad-.[mib?-. re-.] } do-.(do-. do-. do-. do-. do-. do\tr si32 la)\mbreak
   si re sol la si[sol si do] re8\noBeam si16(mi,) \appoggiatura mi8 fa(mi) lad(si)

   %37
   \override Slur.outside-staff-priority = #400 mi,\prall(mi\prall mi\prall mi\prall) \revert Slur.outside-staff-priority \tuplet 3/2 { mi16 sol(fad mi)[dod'?(si] lad) mi'(re dod!)[sol'(mi) ]}
   mi8\tr(re16) r r8. fad32(re) re8\tr(dod16) r r8. mi32(dod)
   dod8\tr(si16) r r8. re32(si)\mbreak sol4~sol16 mi32(fad \appoggiatura la8 sol16 fad32 mi)

   %40
   \con \tuplet 3/2 { re16[(dod si)] }~si8~si16 mi32(fad \appoggiatura la8 sol16 fad32 mi) \tuplet 3/2 { re16(dod si) }~si8\noBeam ~si16 re,32 mi fad re si' dod
   re si re mi fad[re fad sold] lad fad si dod re[si re mi] fad8 si,16. dod32 dod4\tr
   <<si4\\{si,32_\tu  fad re fad re[fad re fad] }>> si fad re fad re[fad re fad]\mbreak si si' fad re si[si' fad re] si si' fad re si[si' fad re]

   %43
   si[fad re fad re fad re fad]  si[fad re fad re fad re fad] si4 r16 fad\parenthesize-.  si\parenthesize-.  re\parenthesize-.
   fad sol32 fad mi re dod si fad16 mi re dod si4 r16 fad'\parenthesize-.  si\parenthesize-.  re\parenthesize-.
   fad sol32 fad mi re dod si fad16 mi re dod\mbreak \once\stemUp si16 si''_\solo si8\tr r16 si32 dod re si fad re

   %46
   si16 si' si8\tr r16 si32 dod re si fad re dod'16. re32 mi8~mi16 re32(dod) si(lad) si(dod)
   re(dod si8.) do32(si lad8.) si32 re si fad re[si re fad] si re si fad re[si re fad]
   sol32(fad mi8.) mi32(re dod8.) re32 si fad re si8\noBeam\tr r si''_\solo

   %49
   re4~re16 do32(si la sold fa? mi) re4~re16 fa!32(mi re do si la)
   sold(re do re) sold[(re do re)] sold(re do re) sold[(re do re)] fa''4~fa8. mi32 re
   re4\tr(do) \senza \tuplet 3/2 { do16(mi) sold, la[(do) mi,] fa(la) dod, re[(fa) la,]

   %52
   si(si') sold re[(sold) re] si(re) si mi,[(re') si]\mbreak do(la') mi do[(mi) do] la(do) la mi[(la) mi]
   fa(la re fa[la fa)]re-. fa-. re-. la-.[re-. la-.] sold(si re sold [si sold)] si,-. re-. si-. mi,-.[re'-. si-.]}
   \tuplet 3/2 {do mi32(re) do16 do [la do] do mi32(re) do16 do[la dod]  dod mi32(re) dod16 dod[la dod]  dod mi32(re) dod16 dod[la fa']

   %55
   fa la32(sol) fa16  fa[re fa]  fa la32(sol) fa16 fa[re fad]  fad la32(sol) fad16  fad[do fad]  fad la32(sol) fad16  fad[do fad]
   sol si32(la) sol16 sol[re sol] sol si32(la) sol16 sol[re sold] sold si32(la) sold16 sold[re sold]  sold si32(la) sold16  sold[re re'] }
   re2~ \tuplet 3/2 {re16 si32 (do re16) re[si re] } mi,4~

   %58
   \tuplet 3/2 {mi16 re32(mi fa16) fa[re fa]}  sold,4~\tuplet 3/2 { sold16 (si re fa[si re)] } re8(do16 si)\mbreak
   \tuplet 3/2 { do mi-. (mi-. mi-.[mi-. mi-.] mi-. re-. do-. si-.[la-. sol-.)] } fa8\noBeam ~fa64 sol(fa mi fa sol la si128 do) re4
   \tuplet 3/2 { si16 re-.(re-. re-. [re-. re-.]  re-. do-. si-. la-.[sol-. fa-.)]} mi8\noBeam ~mi64 fa(mi re mi fa sol la128 si) do4

   %61
   \tuplet 3/2 { la16 do-.(do-. do-.[do-. do-.] do-. si-. la-. sol-.[fa-. mi-.)] } re8\noBeam ~re64 do(si do re mi fad! sold128 la  si8) re,\mbreak
   do\noBeam ~do64 si(la si do re mi fad128 sold la8) la, sold\noBeam ~\stemUp \slurDown sold64 fad(mi fad sold128 la si do re mi fad sold256 la\stemNeutral si8) re, \slurNeutral
   do\noBeam ~do64 si(la si do re mi fad128 sold la8) la, fa'2

   %64
   sold do!
   red mi4~\con \tuplet 3/2 { mi16 do-.(re-. mi-.[ fad-. sold-.] }
   la8-.) la,16 si si4\tr \mbreak <<la4\\{mi32_\tu do la do la do la do}>> mi do la do la do la do

   %67
   si sol mi sol mi sol mi sol si sol mi sol mi sol mi sol mi si sol si sol si sol si mi si sol si sol si sol si
   mi4 r8 si''\p  \appoggiatura la sol16.[fad32 mi8 mi mi]
   \appoggiatura {mi16[fad]} sol16. fad32 mi4 mi,8 \appoggiatura {mi16[fad]} sol16. fad32 mi4 sol'8

   %70
   sol16(fad) fad(si) si(mi,) do'(mi,) mi8\tr red r mi\f
   mi32 si sol si mi[si sol si] mi si sol si mi[si sol si] mi do la do mi[do la do] mi do la do mi[do la do]
   fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod] fad4 r16 si,-.\p red-. fad-.

   %73
   sol sol (fa8) r16 fa(sol) la-. red,16 red(mi8)  r16 si\parenthesize-. \f mi\parenthesize-.  sol\parenthesize-.
   si la32 sol fad? mi red dod si16 la sol fad mi4 r16 si'-. mi-. sol-.
   si la32 sol fad mi red dod si16 la sol fad mi32\solo sol fad mi si'[red dod si] mi sol fad mi si'[red dod si]\mbreak

   %76
   mi8 mi, r si' \appoggiatura si do4 si8 do
   si(la) sol la \appoggiatura sol fad \appoggiatura la sol \appoggiatura fad mi \appoggiatura sol fad
   \appoggiatura mi red\noBeam~red32 do(si do) si8 si' la(sold16) fad32(mi) sol8.(fa16)

   %79
   mi16 (re) si'8~si16. la32(sold16)[fad32(mi)] re'8. do32(si) fa'16. [mi32](re16) do32(si)\mbreak
   do8~do32 si(la sold) \appoggiatura sold8 la4 fa \appoggiatura sol8 fa32[(mi fa16)] sold32(la si do)
   mi,8.(red16) si'16.[la32](sol16) fad?32(mi) red8.(do16) do'16.[si32](la32) sol(fad) mi64(red)

   %82
   do8.(si16) lad'8\noBeam(\senza \tuplet 3/4 { si64) lad(sol fad)[mi(red)]} do8.(si16) lad'8\noBeam(\senza \tuplet 3/4 { si64) lad(sol fad)[mi(red)]}\mbreak
   la!4(sol8) fad' \tuplet 3/2 { sol16(si) red, mi[(si') red,] mi(si') red, mi[(si') si,]
   do(mi) sold, la[(mi') sold,] la(mi') sold, la[(mi') sold,] la(do') mi, fa[(do') mi,] fa(do') mi, fa[(do') mi,]

   %85
   red(fad?) si, red[(fad) si,] red(fad) si, red[(fad) la,] } sol8\noBeam ~\tuplet 3/2 { sol16 sol'(mi) } si'8\noBeam~\tuplet 3/2 { si16 sol(mi) }\mbreak
   fa8\noBeam ~\tuplet 3/2 { fa16\parentSlur (do') mi, } lad8\noBeam~\tuplet 3/2 { lad16(dod) mi, } red4 mi16.\tr[(red32] mi fad sol la?)
   \appoggiatura la8 si2 si32 la sol fad sol[fad mi red] mi red do si do[si la sold]

   %88
   \appoggiatura sold?8 la4 r dod'32 si la sold la[sold fad mi] fad mi red dod red[dod si lad]\mbreak
   \appoggiatura lad?8 si4 r16 fad' si si, do mi, la, mi'' do' la mi'  mi,
   fad, red si la' do la la' fad sol si, mi, mi' sol mi si' mi,

   %91
   sold8-.(sold-. sold-. sold-.) lad-.(lad-. lad-. lad-.)
   si8.(la32 sol fad4)\mbreak mi'16 re32 do si la sol fad mi16 si sol mi
   la,8 r fad''4\tr mi32 si sol si mi[si sol si] mi si sol si mi[si sol si]  %% inizio ripresa

   %94
   mi do la do mi[do la do] mi do la do mi[do la do] fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod]
   fad4 r16 si,-.\p red-. fad-. sol sol (fa8) r16 fa-. sol-. la-.\mbreak
   red,16 red(mi8)  r16 si-.\f mi-. sol-. si la32 sol fad? mi red dod si16 la sol fad

   %97
   mi4 r16 si'\parenthesize -. mi\parenthesize -. sol\parenthesize -. si la32 sol fad mi red dod si16 la sol fad
   mi4\fermata r r2

}

IvlIn =  \relative do'' {

   mi,16 si sol si sol si sol si mi si sol si sol si sol si
   mi mi' si sol mi mi' si sol mi mi' si sol mi mi' si sol
   mi[si sol si sol si sol si] mi[si sol si sol si sol si]

   %4
   mi4%-\tweak Y-offset #+4.5 ^\markup\huge "Largo"
   r r r8 r16 do''\pp
   do8(si) r r16 si\mbreak si8(la) r r16 la
   sol2\fermata\tr fad\fermata

   %7
   si,16
   %-\tweak Y-offset #+4.5 ^\markup\huge "All[egr]o molto"
   \f[fad re fad re fad re fad] si fad re fad re fad re fad
   si si' fad re si si' fad re si si' fad re si si' fad re
   si[fad re fad re fad re fad] si [fad re fad re fad re fad]

   %10
   si4%-\tweak Y-offset #+4.5 ^\markup\huge "And[ant]e"
   r8 fad'\p \appoggiatura mi8 re16.[dod32 si8 si si]\mbreak
   \appoggiatura {si16[dod]} re16. dod32 si4 si8 \appoggiatura {si16[dod]} re16. dod32 si4 sol'8
   fad16 fad(mi re) mi mi(re dod) re dod si4 si'8

   %13
   \appoggiatura la sol16.[fad32 mi8 mi mi] \appoggiatura {mi16[fad]} sol16. fad32 mi4 mi,8
   \appoggiatura {mi16[fad]} sol16. fad32 mi4 sol'8 sol16(fad) fad(si) si(mi,) do'(mi,)
   mi8\tr red r \parenthesize si'\mbreak re,? sold, si, re'

   %16
   sold4~\tuplet 3/2 { sold16 si-. la-. sold-.[fad-. mi-.] } re\parenthesize -.[(fa-. fa-. fa-. fa-. fa-. si8)]
   \tuplet 3/2 { do,16 mi re do[si la] } \once\stemUp la,8 la'' do, fad, la, do'
   fad4~\tuplet 3/2 { fad16 la-. sol-. fad-.[mi-. re-.] } do-.[(mib-. mib-. mib-. mib-. mib-. la8)]

   %19
   \tuplet 3/2 { si,16 re do si[la sol] } sol,8 \once\stemDown  mi''\f\mbreak mi32 si sol si mi[si sol si] mi si sol si mi[si sol si]  %% inizio ripresa
   mi do la do mi[do la do] mi do la do mi[do la do] fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod]
   fad4 r16 si,-.\p red-. fad-. sol sol (fa8) r16 fa-. sol-. la-.\mbreak

   %22
   red,16 red(mi8)  r16 si-.\f mi-. sol-. si la32 sol fad? mi red dod si16 la sol fad
   mi4 r16 si'\parenthesize -. mi\parenthesize -. sol\parenthesize -. si la32 sol fad mi red dod si16 la sol fad
   mi4 r8 mi' red8 red red red

   %25
   red? red red sol fad fad mi mi\mbreak
   mi mi red red mi mi mi mi
   mi  mi mi mi re? re re re

   %28
   re re re re do16 do la la fad fad lad lad
   fad2\mbreak sol
   fad sol

   %31
   fad8 fad fad fad' fa re re re
   fa fa fa fa\mbreak  fa? fa fa fa
   fa? fa fa fa mi mi mi mi

   %34
   mib do do do mib mib mib mib
   mib? mib mib mib mib mib mib mib
   re re re mi? do mi mi fad

   %37
   mi2 mi8 mi mi mi
   mi fad re re re mi dod dod
   dod? re re re\mbreak mi mi mi mi

   %40
   re re re mi re re re re
   re re re re re re dod dod
   re32\f fad, re fad re[fad re fad] si fad re fad re[fad re fad] si si' fad re si[si' fad re] si si' fad re si[si' fad re]

   %43
   si[fad re fad re fad re fad]  si[fad re fad re fad re fad] si4 r16 fad\parenthesize-.  si\parenthesize-.  re\parenthesize-.
   fad sol32 fad mi re dod si fad16 mi re dod si4 r16 fad'\parenthesize-.  si\parenthesize-.  re\parenthesize-.
   fad sol32 fad mi re dod si fad16 mi re dod\mbreak si8 fad'' fad[fad]

   %46
   fad fad fad[fad] fad fad fad[fad]
   fad fad sol mi re4 r
   r8 mi mi dod re4 r\mbreak

   %49
   la8 la la la la la la la
   si, si si si re' re re fa
   mi mi mi mi la,, do re[fa]

   %52
   sold, si' sold sold,\mbreak la la' do, la
   re re' fa, re mi si' sold sold,
   mi''16[mi mi mi mi mi mi mi] mi [mi mi mi mi mi mi mi]

   %55
   fa[fa fa fa fa fa fa fad]\mbreak fad[fad fad fad fad fad fad fad]
   sol[sol sol sol sol sol sol sold?] sold! sold sold sold sold sold si si
   re,[re re re re re re re] re[re re re re re re re]

   %58
   re[re re re re re re re] re[re re re re re re re]\mbreak
   do8 do do do do do fa fa
   fa? fa si, si si si mi mi

   %61
   mi mi la, la sold sold re' re\mbreak
   do do do do si si si si
   do do do do la la la la

   %64
   si si si si do do do do
   si si si si si si si re
   do do si si\mbreak mi32\f do la do la do la do mi do la do la do la do

   %67
   si sol mi sol mi sol mi sol si sol mi sol mi sol mi sol mi si sol si sol si sol si mi si sol si sol si sol si
   mi4 r8 si''\p  \appoggiatura la sol16.[fad32 mi8 mi mi]
   \appoggiatura {mi16[fad]} sol16. fad32 mi4 mi,8 \appoggiatura {mi16[fad]} sol16. fad32 mi4 sol'8

   %70
   sol16(fad) fad(si) si(mi,) do'(mi,) mi8\tr red r mi\f
   mi32 si sol si mi[si sol si] mi si sol si mi[si sol si] mi do la do mi[do la do] mi do la do mi[do la do]
   fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod] fad4 r16 si,-.\p red-. fad-.

   %73
   sol sol (fa8) r16 fa(sol) la-. red,16 red(mi8)  r16 si\parenthesize-. \f mi\parenthesize-.  sol\parenthesize-.
   si la32 sol fad? mi red dod si16 la sol fad mi4 r16 si'-. mi-. sol-.
   si la32 sol fad mi red dod si16 la sol fad mi4 r\mbreak

   %76
   mi8 fad sol mi la red, mi la
   fad red mi dod red mi la, lad
   si4. re'8 re re re re

   %79
   re re re re re re re re\mbreak
   do do do do do do do do
   si si si si la la la do

   %82
   fad, fad fad fad fad fad fad fad
   fad fad fad red' si si si si
   do do do do do do do do

   %85
   red red red red si si si si
   do do dod dod red red red red
   red? red red red si si si si

   %88
   do do do do dod dod dod dod\mbreak
   red red red si do? do do do
   red, red red red' si si si si

   %91
   si si si si dod dod dod dod
   red red red red \mbreak si si si si
   do do fad, fad mi'32 si sol si mi[si sol si] mi si sol si mi[si sol si]  %% inizio ripresa

   %94
   mi do la do mi[do la do] mi do la do mi[do la do] fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod]
   fad4 r16 si,-.\p red-. fad-. sol sol (fa8) r16 fa-. sol-. la-.\mbreak
   red,16 red(mi8)  r16 si-.\f mi-. sol-. si la32 sol fad? mi red dod si16 la sol fad

   %97
   mi4 r16 si'\parenthesize -. mi\parenthesize -. sol\parenthesize -. si la32 sol fad mi red dod si16 la sol fad
   mi4\fermata r r2

}

IvlIIn = \relative do'' {

   mi,16 si sol si sol si sol si mi si sol si sol si sol si
   mi mi' si sol mi mi' si sol mi mi' si sol mi mi' si sol
   mi[si sol si sol si sol si] mi[si sol si sol si sol si]

   %4
   mi4%-\tweak Y-offset #+4.5 ^\markup\huge "Largo"
   r r r8 r16 la'\pp
   la8 (sol) r r16 sol\mbreak sol8(fad) r r16 fad
   mi2\tr\fermata red\fermata

   %7
   si16
   %-\tweak Y-offset #+4.5 ^\markup\huge "All[egr]o molto"
   \f[fad re fad re fad re fad] si fad re fad re fad re fad
   si si' fad re si si' fad re si si' fad re si si' fad re
   si[fad re fad re fad re fad] si [fad re fad re fad re fad]

   %10
   si4%-\tweak Y-offset #+4.5 ^\markup\huge "And[ant]e"
   r8 fad'\p \appoggiatura mi8 re16.[dod32 si8 si si]\mbreak
   \appoggiatura {si16[dod]} re16. dod32 si4 si8 \appoggiatura {si16[dod]} re16. dod32 si4 sol'8
   fad16 fad(mi re) mi mi(re dod) re dod si4 si'8

   %13
   \appoggiatura la sol16.[fad32 mi8 mi mi] \appoggiatura {mi16[fad]} sol16. fad32 mi4 mi,8
   \appoggiatura {mi16[fad]} sol16. fad32 mi4 sol'8 sol16(fad) fad(si) si(mi,) do'(mi,)
   mi8\tr red r4 sold2

   %16
   re si
   la fad'
   do la

   %19
   sol4. mi'8\f mi32 si sol si mi[si sol si] mi si sol si mi[si sol si]  %% inizio ripresa
   mi do la do mi[do la do] mi do la do mi[do la do] fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod]
   fad4 r16 si,-.\p red-. fad-. sol sol (fa8) r16 fa-. sol-. la-.\mbreak

   %22
   red,16 red(mi8)  r16 si-.\f mi-. sol-. si la32 sol fad? mi red dod si16 la sol fad
   mi4 r16 si'\parenthesize -. mi\parenthesize -. sol\parenthesize -. si la32 sol fad mi red dod si16 la sol fad
   mi4 r8 sol fad fad fad fad %%%% fine ripresa

   %25
   fad fad si si si si si mi,\mbreak
   fad fad fad fad si si si si
   do do do do la la la la

   %28
   si si si si sol16 sol mi mi dod dod fad fad
   red2\mbreak mi
   red mi

   %31
   red8 red red red' si si si si
   si si si si\mbreak re? re re re
   si si si re do do do do

   %34
   la la la la la la la la
   do do do do la la la do\mbreak
   si si si si do si dod re

   %37
   dod2 dod8 dod dod dod
   dod? re si si si dod lad lad
   lad? si si si\mbreak dod dod dod lad

   %40
   fad fad fad dod' fad, fad fad fad
   fad fad fad fad fad fad lad lad
   si32\f fad re fad re[fad re fad] si fad re fad re[fad re fad] si si' fad re si[si' fad re] si si' fad re si[si' fad re]

   %43
   si[fad re fad re fad re fad]  si[fad re fad re fad re fad] si4 r16 fad\parenthesize-.  si\parenthesize-.  re\parenthesize-.
   fad sol32 fad mi re dod si fad16 mi re dod si4 r16 fad'\parenthesize-.  si\parenthesize-.  re\parenthesize-.
   fad sol32 fad mi re dod si fad16 mi re dod\mbreak si8 re' re[re]

   %46
   re re re[re]dod dod dod[dod]
   si re mi dod si4 r
   r8 si dod lad fad4 r\mbreak

   %49
   re8 re re re re re re re
   re re re re si' si si si
   la la do do la, do re[fa]

   %52
   sold, si' sold sold,\mbreak la la' do, la
   re re' fa, re mi si' sold sold,
   do'16[do do do do do do dod]  dod[dod dod dod dod dod dod dod]

   %55
   la[la la la la la la la] la[la la la la la la la]
   re[re re re re re re re] si[si si si si si si si]
   sold[sold sold sold sold sold sold sold] sold[sold sold sold sold sold sold sold]

   %58
   sold?[sold sold sold sold sold sold sold] sold[sold sold sold sold sold sold sold]\mbreak
   mi8 mi' mi mi fa la, la re
   re re re re mi sol, sol do

   %61
   do do do do re re si si\mbreak
   mi, mi mi mi sold sold sold sold
   mi mi mi mi' fa fa fa fa

   %64
   mi mi mi mi mi mi mi mi
   fad! fad fad fad mi mi mi si
   la la sold sold\mbreak mi'32\f do la do la do la do mi do la do la do la do

   %67
   si sol mi sol mi sol mi sol si sol mi sol mi sol mi sol mi si sol si sol si sol si mi si sol si sol si sol si
   mi4 r8 si''\p  \appoggiatura la sol16.[fad32 mi8 mi mi]
   \appoggiatura {mi16[fad]} sol16. fad32 mi4 mi,8 \appoggiatura {mi16[fad]} sol16. fad32 mi4 sol'8

   %70
   sol16(fad) fad(si) si(mi,) do'(mi,) mi8\tr red r mi\f
   mi32 si sol si mi[si sol si] mi si sol si mi[si sol si] mi do la do mi[do la do] mi do la do mi[do la do]
   fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod] fad4 r16 si,-.\p red-. fad-.

   %73
   sol sol (fa8) r16 fa(sol) la-. red,16 red(mi8)  r16 si\parenthesize-. \f mi\parenthesize-.  sol\parenthesize-.
   si la32 sol fad? mi red dod si16 la sol fad mi4 r16 si'-. mi-. sol-.
   si la32 sol fad mi red dod si16 la sol fad mi4 r\mbreak

   %76
   mi8 fad sol mi la red, mi la
   fad red mi dod red mi la, lad
   si4. si'8 si si si si

   %79
   si si si si si si si si\mbreak %%% fine p. 7
   mi, mi mi mi fa fa fa fa
   fad! fad sol[sol] mi mi mi la

   %82
   red, red red red red red red red\mbreak
   red? red red si' sol sol sol sol
   mi mi mi mi la fa fa[fa]

   %85
   fad! fad fad fad sol sol sol sol
   do do lad[lad] fad fad fad fad
   fad fad fad fad sol sol sol sold

   %88
   mi mi mi mi la la lad lad\mbreak
   fad fad fad mi mi mi mi la
   fad fad fad si sol sol sol sol

   %91
   mi mi mi mi mi mi mi mi
   fad fad fad fad\mbreak mi mi mi mi
   mi mi mi red mi'32 si sol si mi[si sol si] mi si sol si mi[si sol si]  %% inizio ripresa

   %94
   mi do la do mi[do la do] mi do la do mi[do la do] fad dod lad dod fad[dod lad dod] fad dod lad dod fad[dod lad dod]
   fad4 r16 si,-.\p red-. fad-. sol sol (fa8) r16 fa-. sol-. la-.\mbreak
   red,16 red(mi8)  r16 si-.\f mi-. sol-. si la32 sol fad? mi red dod si16 la sol fad

   %97
   mi4 r16 si'\parenthesize -. mi\parenthesize -. sol\parenthesize -. si la32 sol fad mi red dod si16 la sol fad
   mi4\fermata r r2

}

Ivlan =  \relative do' {

   sol8 sol sol sol sol sol sol sol
   sol sol sol sol sol sol sol sol
   sol sol sol sol sol sol sol sol

   %4
   sol4 r r2
   mi'\pp\mbreak red
   mi4(do) fad2\fermata

   %7
   re8\f re re re re re re re
   re re re re re re re re
   re re re re re re re re

   %10
   re4 r8 re\p fad re re re\mbreak
   fad re re re fad re re do
   re fad lad lad fad fad fad fad

   %13
   si, sol sol sol si sol sol sol
   si sol sol si si si mi la
   fad fad fad red \mbreak si'2~

   %16
   si sold
   mi la~
   la fad

   %19
   re4. si8\f \mbreak si si si si %%%% ripresa
   do do do do dod dod dod dod
   red red red\p red si do do do\mbreak

   %22
   fad sol sol\f sol sol la fad red
   si si sol' sol sol la fad red
   si4 r8 mi si si si si %% fine rip

   %25
   si si si mi red re dod do\mbreak
   si si si la sol sol sold sold
   la la la la fad fad fad fad

   %28
   sol? sol sol sol mi'16 mi do do lad lad fad fad
   si8 si si si\mbreak si si si si
   si si si si si si si si

   %31
   si si si si sold' sold sold sold
   sold? sold sold sold\mbreak sold sold sold sold
   sold? sold sold sold la la la la

   %34
   fad fad fad fad fad fad fad fad
   fad fad fad fad fad fad fad fad\mbreak
   sol? sol sol sol la sol fad si,

   %37
   fad'2 fad8 fad fad fad
   fad fad fad fad fad fad fad fad
   fad fad fad fad\mbreak lad, lad lad lad

   %40
   si si si lad si si si si
   si si si si si si fad' fad,
   re'16 re re re re re re re\mbreak re re re re re re re re

   %43
   re re re re re re re re re8 re re re
   re sol dod, lad re re re re
   re sol dod, lad\mbreak si si' si[si]

   %46
   si si si[si] lad lad lad[lad]
   si, si mi fad si,4 r
   r8 sol'? fad fad, si4 r\mbreak

   %49
   fa8 fa fa fa fa fa fa fa
   mi mi mi mi sold sold sold sold
   la la la la la do re[fa]

   %52
   sold, si' sold sold,\mbreak la la' do, la
   re re' fa,  re mi si' sold sold,
   la'16[la la la la la la la] la]la la la la la la la]

   %55
   re,[re re re re re re re]\mbreak do[do do do do do do do]
   si[si si si si si si si] mi[mi mi mi mi mi mi mi]
   mi[mi mi mi mi mi mi mi] mi[mi mi mi mi mi mi mi]

   %58
   mi[mi mi mi mi mi mi mi] mi[mi mi mi mi mi mi mi]\mbreak
   la,8 la' la la re, re re re
   sol sol sol sol do, do do do

   %61
   fa fa fa fa si, si sold sold\mbreak
   la la la la mi' mi mi mi
   la, la la la re re re re

   %64
   re re re re la' la la la
   la la la la sold sold sold mi
   la la mi mi,\mbreak do' mi mi mi

   %67
   sol,  sol sol sol sol sol sol sol
   sol4 r8 sol\p si sol sol sol
   si sol sol sol si sol sol si

   %70
   si si mi[la] fad fad fad si,\f
   si si si si do do do do
   dod dod dod dod\mbreak red red red\p red

   %73
   si do? do do fad sol sol\f sol
   sol la fad red si si sol' sol
   sol la fad red si4 r\mbreak

   %76
   R1*2
   r4 r8 sold sold sold sold sold
   sold? sold sold sold sold sold sold sold\mbreak

   %80
   la la la la la la la la
   si si sol? sol la la la la
   si si si si si si si si

   %83
   si si si si mi mi mi mi
   la, la la la la la la la
   si si si si mi mi mi mi\mbreak

   %86
   la, la fad fad si si si si
   si si si si mi, mi mi mi
   la la la la fad fad fad fad\mbreak

   %89
   si si si sol la la la la
   si si si si mi mi mi mi
   re re re re dod dod dod dod

   %92
   si si si si\mbreak sol sol sol sol
   la la si si si si si si %%%% ripresa
   do do do do dod dod dod dod

   %95
   red red red\p red si do do do\mbreak
   fad sol sol\f sol sol la fad red
   si si sol' sol sol la fad red

   %98
   si4\fermata r r2

}

Ibcn = \relative do {

   mi8 mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi

   %4
   mi4 r r2
   mi2\pp\mbreak fad4 (si,)
   mi(lad,) si2\fermata

   %7
   si8\f si si si si si si si
   si si si si si si si si
   si si si si si si si si

   %10
   si4 r8 si\p si si si si\mbreak
   si si si si si si si lad
   si si dod fad, si si si red

   %13
   mi mi mi mi mi mi mi mi
   mi mi mi mi red re dod do
   si si si si mi mi mi mi

   %16
   mi mi mi mi sold sold sold sold
   la, la la la re re re re
   re re re re fad fad fad fad

   %19
   sol, sol sol sol\f\mbreak sol sol sol sol%%%%%% ripresa
   la la la la lad lad lad lad
   si si si\p si mi la, la la\mbreak

   %22
   si mi mi\f mi mi la si si,
   mi mi mi mi mi la si si,
   mi4 r r2 %%%% fine ripresa

   %25
   R1*17
   si16 si si si si si si si\mbreak si si si si si si si si
   si si si si si si si si si8 si si si

   %44
   si mi fad fad, si si si si
   si mi fad fad,\mbreak si4 r
   R1*20

   %66
   r2 la8 la la la
   mi' mi mi mi mi mi mi mi
   mi4 r8 mi\p mi mi mi mi\mbreak

   %69
   mi mi mi mi mi mi mi mi
   red re dod do si si si la\f
   sol sol sol sol la la la la

   %72
   lad lad lad lad\mbreak si si si si
   mi la, la la si mi mi\f mi
   mi la si si, mi mi mi mi

   %75
   mi la si si, mi4 r\mbreak
   R1*17
   r2 sol,8 sol sol sol%%%%%% ripresa

   %94
   la la la la lad lad lad lad
   si si si\p si mi la, la la\mbreak
   si mi mi\f mi mi la si si,

   %97
   mi mi mi mi mi la si si,
   mi4\fermata r r2 %%%% fine ripresa

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key mi\minor
   \time 4/4
   \tempo 2 = 60
   s1*3
   \tempo 4 = 45
   s1*3
   \tempo 2 = 60
   s1*3
   \tempo 2 = 27
   s1*89
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
}

IIvln = \relative do'' {

   mi,2 fad
   sold lad
   la!1

   %4
   sold4 fad mid2
   mi! red
   mi8 mi' mi(mi,) fa2~

   %7
   fa mi
   fad! sol16.mi'32 mi16. re32 re16. do32 do16. si32
   si16. do32 do16. si32 si16. la32 la16. sol32 sol16. mi'32 mi16. red32 red16. re32 re16. dod32

   %10
   dod16. do32 do16. si32 si16. la32 la16. sol32\mbreak  sol2
   fad\fermata mi'8\solo[sol16 la si8 mi,]
   \appoggiatura re8 do4~do16 si32 la do'8\noBeam si[la16 sold fad8 mi]

   %13
   lad4~lad16 mi' lad, mi red8. dod32(si) la'?8. sol?32(fad)
   \appoggiatura fad8 sol16 fad mi8 r sol\mbreak \appoggiatura sol fad16(mi fad8) \appoggiatura sol fad16(mi fad8)
   si4~si16 la(sol fad) \appoggiatura fad8 mi16(re mi8) \appoggiatura fad8 mi16(re mi8)

   %16
   la4~la16 sol (fad mi) re8 fad la do,
   si re sol4~sol8 do, do'4~
   do8[si16 la sol8 fad] mi4(re\tr)\mbreak

   %19
   do sol'~sol8[la16 sib la8 sol]
   fad! re la'4~la8[si16 do si8 la]
   sol mi fa4~fa8 si mi,4~

   %22
   mi8 la re,4~re8 sol do,4~
   do8 si16 la red8 mi16 fad\mbreak sol4 r8 si
   si,4. si'8 si,4. si'8

   %25
   si, la'4 sol16 fad sol2
   lad si16 la? sol fad32 mi fad4
   mi16. mi32 mi16. re32 re16. do32 do16. si32 si16. do32 do16. si32 si16. la32 la16. sol32

   %28
   sol16. mi'32 mi16. red32 red16. re32 re16. dod32\mbreak dod16. do32 do16. si32 si16. la32 la16. sol32
   sol8 mi' mi red mi2\fermata

}

IIvlIn =  \relative do'' {

   mi,2 fad
   sold lad
   la!1

   %4
   sold4 fad mid2
   mi! red
   mi8 mi' mi(mi,) fa2~

   %7
   fa mi
   fad! sol16.mi'32 mi16. re32 re16. do32 do16. si32
   si16. do32 do16. si32 si16. la32 la16. sol32 sol16. mi'32 mi16. red32 red16. re32 re16. dod32

   %10
   dod16. do32 do16. si32 si16. la32 la16. sol32\mbreak  sol2
   fad\fermata sol
   fad sold

   %13
   lad la
   si\mbreak do
   si1

   %16
   la
   sol
   la4 do2 si4\mbreak

   %19
   do2 la~
   la si
   si4 r8 do si2

   %22
   la sol
   fad\mbreak si~
   si1~

   %25
   si
   dod2 si8 mi4 red8
   mi16. mi32 mi16. re32 re16. do32 do16. si32 si16. do32 do16. si32 si16. la32 la16. sol32

   %28
   sol16. mi'32 mi16. red32 red16. re32 re16. dod32\mbreak dod16. do32 do16. si32 si16. la32 la16. sol32
   sol8 mi' mi red mi2\fermata

}

IIvlIIn = \relative do'' {

    sol2 do
    mi,1
    red~

    %4
    red2 dod~
    dod si
    si4 r r8 re' re re,

    %7
    re2 dod
    red mi16. do'32 do16. si32 si16. la32 la16. sol32
    sol16. la32 la16. sol32 sol16. fad32 fad16. mi32 mi16. do'32 do16. si32 si16. sold32 sold16. la32

    %10
    la16. fad32 fad16. sol?32 sol16. red32 red16. mi32\mbreak mi2
    red\fermata si'
    la si

    %13
    mi, fad4. red8
    si'2\mbreak la
    sol1

    %16
    fad
    re2 do
    la sol4. sol'8\mbreak

    %19
    mi1
    fad
    sol4 r8 la re,4 sol

    %22
    do, fa si, mi
    la,2\mbreak si
    la4 si do red

    %25
    fad2 mi4. sol8
    fad2~fad8 sol fad4
    sol16. do32 do16. si32 si16. la32 la16. sol32 sol16. la32 la16. sol32 sol16. fad32 fad16. mi32

    %28
    mi16. do'32 do16. si32 si16. sold32 sold16. la32\mbreak la16. fad32 fad16. sol?32 sol16. red32 red16. mi32
    mi8 sol fad fad sol2\fermata

}

IIvlan =  \relative do' {

    si2 la
    si fad~
    fad1~
    fad2 sold
    fad1
    sol4 r r2
    la4. re8 si2
    la si~
    si1~
    si2\mbreak dod
    fad,\fermata mi'16. mi32 mi16. mi32 mi16. mi32 mi16. mi32
    mi16. [mi32 mi16. mi32 mi16. mi32 mi16. mi32] re16.[re32 re16. re32 re16. re32 re16. re32]
    do16. [do32 do16. do32 do16. do32 do16. do32] si16.[si32 si16. si32 si16. si32 si16. si32]
    mi,16.[mi'32 mi16. mi32 mi16. mi32 mi16. mi32] \mbreak mi16. [mi32 mi16. mi32 mi16. mi32 mi16. mi32]
    re16.[re32 re16. re32 re16. re32 re16. re32] re16.[re32 re16. re32 re16. re32 re16. re32]
    do16. [do32 do16. do32 do16. do32 do16. do32] do16. do32 do16. do32 fad,!16. fad32 fad16. fad32
    fa16.[fa32 fa16. fa32 fa16. fa32 fa16. fa32] mi16. [mi32 mi16. mi32 mi16. mi32 mi16. mi32]
    fa16.[fa32 fa16. fa32 fa16. fa32 fa16. fa32] sol16.[sol32 sol16. sol32 sol16. sol32 sol16. sol32]\mbreak
    do16. [do32 do16. do32 do16. do32 do16. do32] dod16.[dod32 dod16. dod32 dod16. dod32 dod16. dod32]
    re16.[re32 re16. re32 re16. re32 re16. re32] red16.[red32 red16. red32 red16. red32 red16. red32]
    mi4 r8 la,sold16. sold32 sold16. sold32 sol16. sol32 sol16. sol32
    fad16. fad32 fad16. fad32 fa16. fa32 fa16. fa32  mi16. [mi32 mi16. mi32 mi16. mi32 mi16. mi32]
    red16.[red32 red16. red32 red16. red32 red16. red32]\mbreak mi16. [mi32 mi16. mi32 mi16. mi32 mi16. mi32]
    fad16. fad32 fad16. fad32  sol16. sol32 sol16. sol32 la16. la32 la16. la32 si16. si32 si16. si32
    red,16.[red32 red16. red32 red16. red32 red16. red32] mi16. mi32 mi16. mi32 mi'16. mi32 mi16. mi32
    mi16. [mi32 mi16. mi32 mi16. mi32 mi16. mi32] red16. red32 mi16. mi32 si16. si32 si16. si32
    mi,1~
    mi~
    mi8 mi si' si mi,2\fermata

}

IIbcn = \relative do {

   mi16. [mi32 mi16. mi32 mi16. mi32 mi16. mi32]  mi16. [mi32 mi16. mi32 mi16. mi32 mi16. mi32]
   re16.[re32 re16. re32 re16. re32 re16. re32] do16.[do32 do16. do32 do16. do32 do16. do32]
   si16.[si32 si16. si32 si16. si32 si16. si32] sid16.[ sid32 sid16. sid32 sid16. sid32 sid16. sid32]

   %4
   sid?16.[ sid32 sid16. sid32 sid16. sid32 sid16. sid32] si16.[si32 si16. si32 si16. si32 si16. si32]
   lad16.[lad32 lad16. lad32 lad16. lad32 lad16. lad32]\mbreak la16. [la32 la16. la32 la16. la32 la16. la32]
   sol4 r r2

   %7
   sold16.[sold32 sold16. sold32 sold16. sold32 sold16. sold32] sol16.[sol32 sol16. sol32 sol16. sol32 sol16. sol32]
   fad16.[fad32 fad16. fad32 fad16. fad32 fad16. fad32] mi2_\markup\italic"T[asto] S[olo]"~
   mi1~

   %10
   mi2\mbreak lad
   si\fermata r
   R1*18

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <4 2>
  <6 4+ 2> <6->
  <7- _+> <7>
  <6 5> <6+ 4+>
  <6 5> <6 4+>
  s1
  <7- 5>2 <6 4+>
  <6+>

}

forma = {

  \key mi\minor
  \time 4/4
  \tempo 4 = 40
  s1*29
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

    mi,8
    sol[mi si' mi,]
    mi' mi,4 mi'8
    sol[fad16 mi si'8 sol]

    %4
    fad16 si, red fad si4
    r16 si, red fad si4\mbreak
    r16 si, red fad si4

    %7
    r16 si, red mi fad8 red
    mi4 r8 si'
    lad si, la'4

    %10
    sold8 si, sol'4
    fad16 si, red fad si4
    fad2

    %13
    mi
    red8[si red si]\mbreak
    fad'2\p~

    %16
    fad8 mi16 red mi4~
    mi8 re?16 dod re4~
    re8 do?16 si do4~
    do8 si16 la si4~

    %20
    si8 la16 sol la8 sol16 fad
    si\f si' la si si, la' sol la
    si, sol' fad sol si, fad' mi fad

    %23
    si, si' la si si, la' sol la\mbreak
    si, sol' fad sol si, fad' mi fad
    si,4 r

    %26
    si2\p
    do8[(sol' mi re)]
    do[(fad la do,)]

    %29
    \appoggiatura re do4 si~
    si dod
    re8[(la' fad mi)]

    %32
    re[(sold si re,)]
    \appoggiatura mi re4 dod~
    dod red\mbreak

    %35
    mi8[(si' sold fad)]
    mi[(lad dod mi,)]
    \appoggiatura fad mi4 red~

    %38
    red8[fad(sol la?)]
    r sol[(la si)]
    r red,[(mi fad)]

    %41
    r fa[(sol la)]
    <<sol4\f \\{si,16 mi, sol mi}>> si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi

    %44
    mi'8[la, si si,]
    mi16\solo mi' sol mi si' mi, sol mi\mbreak
    mi' mi, sol mi si' mi, sol mi

    %47
    mi' mi, sol mi si mi sol mi
    do mi sol mi si mi sol mi
    la, mi' sol mi si mi sol mi

    %50
    do mi sol mi si mi sol mi
    la,8 la' si4~
    si8 do si4~

    %53
    si16 la si do si la sol fad
    sol8 mi r4\mbreak
    sol'2~

    %56
    sol8.[fad16(mi8) re16(do)]
    \appoggiatura si8 la4 fad'~
    fad8.[ mi16(re8) do16(si)]

    %59
    \appoggiatura la8 sol4 mi'~
    mi8.[re16(do) si(lad) si]
    lad2~

    %62
    lad8[dod \appoggiatura si lad? sold16(fad)]
    mi4.\tr(red16 mi)
    \appoggiatura mi8 re?2

    %65
    si4\tr~si8. la32(si)
    si'8 si, re,4
    si'\tr~si8. la32(si)

    %68
    si'8 si, mi,4
    si'\tr~si8. la32(si)
    si'8 si, fad4

    %71
    si\tr~si8. la32(si)
    si'8[la16(sol) fad(mi) re(dod)]
    \appoggiatura mi8 re8. dod?32 si dod!4\tr

    %74
    si2~
    si16[si-. (do?-. si-. do-. si-. do-. si-.)]
    si'8 si, re,4~

    %77
    re16[si'-. (do-. si-. do-. si-. do-. si-.)]
    si'8 si, mi,4~
    mi16[si'-. (do-. si-. do-. si-. do-. si-.)]

    %80
    si'8 si, fad4~
    fad16[si-. (do-. si-. do-. si-. do-. si-.)]
    si'8[la16(sol) fad(mi) re(dod)]

    %83
    do!4~do16 si(do32 re mi fad)
    sol4~sol16. fad32(mi fad sol lad)\mbreak
    si4. si16 (lad)

    %86
    sol!(fad8.)~fad8 mi16(re)
    dod(si8.)~si8 mi16(dod)
    re (si) mi(dod) \appoggiatura {si16[dod]} dod4\tr

    %89
    si8\tu si si'4
    lad8 si, la'4
    sold8 si, sol'4

    %92
    fad16 si, re fad si4
    fad2\mbreak
    mi %%% inizio p. 13

    %95
    re16 si' lad si si, la'? sol la
    si, sol' fad sol si, fad' mi fad
    si, si' lad si si, la'? sol la

    %98
    si, sol' fad sol si, fad' mi fad
    si, mi re mi si re dod re
    si8[si' si lad]

    %101
    si4.\solo lad16 si
    re4(dod8) si16 dod\mbreak
    mi4(re8) dod16 re

    %104
    fad4(mi8) re16 mi
    sol4(fad8) fad,
    si[la16 sol fad mi re dod]

    %107
    si8 [fad re si]
    fad'4\tr r
    <<{fad'2~

      %110
      fad
      sol~
      sol\mbreak

      %113
      sol~
      sol
      fad~

      %116
      fad
      la~
      la

      %119
      si~
      si
      si}\\{si,16 si re re si si re re
    si si re re si si re re
    si si mi mi si si mi mi
    si si mi mi si si mi mi\mbreak
    la, la dod dod la la dod dod
    la la dod dod la la dod dod
    la la re re la la re re
    la la re re la la re re
    re re fad fad re re fad fad
    re re fad fad re re fad fad
    re re sol sol re re sol sol
    re re sol sol re re sol sol\mbreak
    fa2~
    \slurUp fa8[ re'16(do si la sol fa)]}>>

    %123
    <<{do'2~
       do
       dod~

       %126
       dod4}\\{mi,16 mi sol sol mi mi sol sol
               mi mi sol sol mi mi sol sol
               sol2~
               sol8[\slurUp mi'16(re dod si la sol)]}>>
    <<{si2~
       si~

       %129
       si~
       si
       do~\mbreak

       %132
       do
       si~
       si

       %135
       la~
       la
       si

       %138
       do  %%%%% OK
       re,
       mi

       %141
       re
       mi
       re4}\\{fad16 fad la la fad fad la la
              fad fad la la fad fad la la
              mi mi la la mi mi la la
              mi mi la la mi mi la la
              mi mi la la mi mi la la\mbreak
              mi mi la la mi mi la la
              mi mi la la mi mi la la
              mi mi sol sol mi mi sol sol
              re re sol sol re re sol sol
              re re fa fa re re fa fa
              re re fa fa re re fa fa
              mi mi sol sol mi mi sol sol
              sol, sol si si sol sol si si
              sol sol do do sol sol do do
              sol sol si si sol sol si si
              sol sol do do sol sol do do
              sol4}>> r8 sol'

    %144
    do8.[si16(la) sol(fa) mi]
    mi4(fa)\mbreak
    si8.[la16(sol) fa(mi) re]

    %147
    re4(mi)
    sol,16 do32 re mi16 do sol do32 re mi16 do
    fa, do'32(re) mi16 do fad, do'32(re) mi16 do

    %150
    sib'2(
    la4 si!)
    do~do16 si32(la) sol16 fa

    %153
    mi do32(re) mi16 do sol do32(re) mi16 do
    fa, do'32(re) mi16 do <<re4\tr\\sol,>>\mbreak %% fine p 14
    mi8\tu[do sol' do,]

    %156
    do' do,4 do'8
    mi[re16 do sol'8 mi]
    re[fad,! la fad]

    %159
    do'[la la' do,]
    si[sol re' si]
    sold'[re si' re,]

    %162
    do[la mi' do]
    la'[mi do' mi,]
    red[si fad' red]

    %165
    la'[fad si fad]\mbreak
    sol4 \parenthesize r
    do,8\p[(sol' mi re)]
    do[(fad la do,)]

    %169
    \appoggiatura re do4 si~
    si dod
    re8[(la' fad mi)]

    %172
    re[(sold si re,)]
    \appoggiatura mi re4 dod~
    dod red

    %175
    mi8[(si' sold fad)]
    mi[(lad dod? mi,)]
    \grace fad\parentSlur (mi4) red\mbreak

    %178
    red?8 [fad(sol la)]
    r sol[(la si)]
    r red,[(mi fad)]

    %181
    r fa[(sol la)]
    r16 mi,\f sol mi si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi

    %184
    mi'8[la, si si,]
    mi4 si''\solo~
    si16 sol32 (la) si16  la sol fad mi re

    %187
    do4\tr si~\mbreak
    si16 do32 re mi16 re do si la sol
    la4\tr sol~

    %190
    sol16 la32(si) do16 si la sol fad mi
    fad4\tr mi~
    mi16 mi'32(fad) sol16 mi fad, fad'32(sol) la16 fad

    %193
    sol, sol'32(la) si16 sol la, la'32(si) do16 lad
    si2
    \senza \tuplet 3/2 { mi8(si la sold[fad mi)]
    si(mi sold si[re fa)]\mbreak

    %197
    fa?(mi re do[si do)]
    la,(do mi la[do mi)]
    re(la sol fad?[mi re)]

    %200
    la(re fad la[do mi)]
    mi(re do si[la si)]
    sol,(si re sol[si re)]

    %203
    mi,,(sol si mi[sol si)]
    si(la sol fad[mi re)]
    mi,(la do mi[la do)]\mbreak

    %206
    do(si la sol[fad mi)]
    fad,(la red fad[la do)]
    do(si la sol[fad sol)]

    %209
    sol(mi red mi[red mi)]
    fa(mi fa la,[sold la)]
    fa'(mi fa la[si do)]}

    %212
    \appoggiatura mi, red2
    mi'16 re?32 do si la sol fad mi16 si sol mi\mbreak
    r8 do' \appoggiatura re8 do16(si do8)

    %215
    mi'16 re32 do si la sol fad mi16 si sol mi
    r8 red' \appoggiatura mi red16(dod red8)
    mi'16 re?32 do si la sol fad mi16 si sol mi

    %218
    r8 fa' \appoggiatura sol fa16(mi fa8)
    mi'16 re32 do si la sol fad? mi16 si sol mi
    r8 lad' \appoggiatura si lad16(sold lad8)\mbreak

    %221
    si16 la?32 sol fad mi red dod si16 fad red si
    r8 \appoggiatura {fad''16[sol]} la8 [\appoggiatura la sol fad]
    sol[\appoggiatura {sold16[la]} si8 \appoggiatura si la sold]

    %224
    la[\appoggiatura {lad16[si]} dod8 \appoggiatura dod si lad]
    si4 mi~
    mi32 re(do) si(la)[si(do) si(] la) sol(fad) sol( la)[si(do) si](

    %227
    la) sol(fad) mi(red)[mi(red) mi](red) mi(red) mi(red)[mi(red) mi]
    \appoggiatura sol8 fad2\tr
    <<mi4\tu\\{sol,8[mi si' sol]}>>

    %230
    mi'[si sol' mi]
    si'[sol mi si]
    sol16 mi sol mi si' mi, sol mi

    %233
    mi' mi, sol mi si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi
    mi'8[la, si si,]

    %236
    mi2\fermata

}

IIIvlIn =  \relative do'' {

    mi,8
    sol[mi si' mi,]
    mi' mi,4 mi'8
    sol[fad16 mi si'8 sol]

    %4
    fad16 si, red fad si4
    r16 si, red fad si4\mbreak
    r16 si, red fad si4

    %7
    r16 si, red mi fad8 red
    mi4 r8 si'
    lad si, la'4

    %10
    sold8 si, sol'4
    fad16 si, red fad si4
    fad2

    %13
    mi
    red8[si red si]\mbreak
    fad'2\p~

    %16
    fad8 mi16 red mi4~
    mi8 re?16 dod re4~
    re8 do?16 si do4~
    do8 si16 la si4~

    %20
    si8 la16 sol la8 sol16 fad
    si\f si' la si si, la' sol la
    si, sol' fad sol si, fad' mi fad

    %23
    si, si' la si si, la' sol la\mbreak
    si, sol' fad sol si, fad' mi fad
    si,4 r

    %26
    si2\p
    do8[(sol' mi re)]
    do[(fad la do,)]

    %29
    \appoggiatura re do4 si~
    si dod
    re8[(la' fad mi)]

    %32
    re[(sold si re,)]
    \appoggiatura mi re4 dod~
    dod red\mbreak

    %35
    mi8[(si' sold fad)]
    mi[(lad dod mi,)]
    \appoggiatura fad mi4 red~

    %38
    red8[fad(sol la?)]
    r sol[(la si)]
    r red,[(mi fad)]

    %41
    r fa[(sol la)]
    <<sol4\f \\{si,16 mi, sol mi}>> si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi

    %44
    mi'8[la, si si,]
    mi4 r\mbreak
    R2*9

    %55
    mi8[fad sol fad]
    mi[fad sol mi]
    re[mi fad mi]

    %58
    re[mi fad re]
    do[re mi re]
    do[re mi do]

    %61
    fad[sol fad mi]
    fad[sol fad mi]
    fad[sol fad lad,]

    %64
    si[dod re si]\mbreak
    fad' [fad fad fad]
    fad4 r8 fad

    %67
    fad[fad fad fad]
    fad4 r8 sol
    fad[fad fad fad]

    %70
    fad4 r8 fad
    fad[fad fad fad]
    fad4 r8 dod'

    %73
    re[re dod dod]
    re[mi fad re]
    fad,[fad fad fad]\mbreak

    %76
    fad4 r8 fad
    fad[fad fad fad]
    fad4 r8 sol

    %79
    fad[fad fad fad]
    fad4 r8 fad
    fad[fad fad fad]

    %82
    fad4 r8 lad
    sol[sol sol sol]
    sol[sol sol sol]\mbreak

    %85
    fad [si, si dod]
    re[si si mi]
    fad[si, si lad']

    %88
    si[sol fad fad]
    si'\f si, si'4
    lad8 si, la'4

    %91
    sold8 si, sol'4
    fad16 si, re fad si4
    fad2\mbreak
    mi %%% inizio p. 13

    %95
    re16 si' lad si si, la'? sol la
    si, sol' fad sol si, fad' mi fad
    si, si' lad si si, la'? sol la

    %98
    si, sol' fad sol si, fad' mi fad
    si, mi re mi si re dod re
    si8[si' si lad]

    %101
    \once\stemDown si[si,, re si]
    fad'[sold lad fad]
    si,[dod re si]

    %104
    dod[re mi dod]
    re[mi re dod]
    si[dod re lad]

    %107
    si[fad' re si]
    fad'[re dod lad]
    fad'[re fad re]

    %110
    fad[re fad re]
    si'[sol si sol]
    si[sol si sol]

    %113
    mi[dod mi dod]
    mi[dod mi dod]
    la'[fad la fad]

    %116
    la[fad la fad]
    la[fad la fad]
    la[fad la fad]

    %119
    re'[si re si]
    re[si re si]\mbreak
    si[re, si' re,]

    %122
    si'[re, si' re,]
    sol[do sol do]
    sol[do sol do]

    %125
    dod[mi, dod' mi,]
    dod'?[mi, dod' mi,]\mbreak
    la[re la re]

    %128
    la[re la re]
    do[mi do mi]
    do[mi do mi]

    %131
    do[mi do mi]\mbreak
    do[mi do mi]
    do[mi do mi]

    %134
    si[mi si mi]
    si[re si re]
    la[fa la fa]

    %137
    sol [si, sol' si,]\mbreak
    sol'[do sol do]
    re,[sol re sol]

    %140
    mi[sol mi sol]
    re[sol re sol]
    mi[sol mi sol]

    %143
    re[sol re si']
    mi, [re mi do]
    fa[sol la fa]\mbreak

    %146
    re[do re si]
    do[fa mi re]
    do r sol' r

    %149
    fa r fad r
    sol[fa mi do]
    fa[la sol fa]

    %152
    mi[re do si]
    do r sol' r
    fa r sol r\mbreak

    %155
    mi\f[do sol' do,]
    do' do,4 do'8
    mi[re16 do sol'8 mi]
    re[fad,! la fad]

    %159
    do'[la la' do,]
    si[sol re' si]
    sold'[re si' re,]

    %162
    do[la mi' do]
    la'[mi do' mi,]
    red[si fad' red]

    %165
    la'[fad si fad]\mbreak
    sol4 \parenthesize r
    do,8\p[(sol' mi re)]
    do[(fad la do,)]

    %169
    \appoggiatura re do4 si~
    si dod
    re8[(la' fad mi)]

    %172
    re[(sold si re,)]
    \appoggiatura mi re4 dod~
    dod red

    %175
    mi8[(si' sold fad)]
    mi[(lad dod? mi,)]
    \grace fad\parentSlur (mi4) red\mbreak

    %178
    red?8 [fad(sol la)]
    r sol[(la si)]
    r red,[(mi fad)]

    %181
    r fa[(sol la)]
    r16 mi,\f sol mi si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi

    %184
    mi'8[la, si si,]
    mi4 r
    R2*9

    %195
    mi'4 mi
    mi mi\mbreak
    re re

    %198
    do do
    re re
    re re

    %201
    do do
    si si
    si si

    %204
    si si
    do do\mbreak
    do do

    %207
    do do
    do do
    si si

    %210
    do do
    do do
    red8[red fad red]

    %213
    si4 r\mbreak
    mi8[mi mi mi]
    R2

    %216
    fad8[fad fad fad]
    R2
    fa8[fa fa fa]

    %219
    R2
    mi8[mi mi mi]\mbreak
    R2

    %222
    si,8[fad' mi red]
    mi[re' do si]
    do[mi red dod]

    %225
    red[si sol fad]
    si,2~
    si~\mbreak

    %228
    si4 si
    sol'8\f[mi si' sol]

    %230
    mi'[si sol' mi]
    si'[sol mi si]
    sol16 mi sol mi si' mi, sol mi

    %233
    mi' mi, sol mi si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi
    mi'8[la, si si,]

    %236
    mi2\fermata

}

IIIvlIIn = \relative do'' {

    r8
    r16 mi, sol si mi4
    r16 mi, sol si mi4
    r16 sol, si mi sol8 mi

    %4
    red16 do si8 r si
    red[si fad' si,]\mbreak
    si' si,4 si8

    %7
    red dod16 si la'8 fad
    sol16 si, mi sol si4
    fad2

    %10
    mi
    red16 dod si8 r si'
    lad si, la'4

    %13
    sold8 si, sol'4
    fad16 si, red fad si4\mbreak
    r8 si,\p [red si]

    %16
    sol'4. fad16 mi
    fad4. mi16 re
    mi4. re16 do

    %19
    re4. do16 si
    do4. si16 la
    sol4\f r

    %22
    si16 si' la si si, la' sol la
    si, sol' fad sol si, fad' mi fad\mbreak
    si, si' la si si, la' sol la

    %25
    si, sol' fad sol si, fad' mi fad
    si,4 r8 sol\p
    sol[(mi' do sol)]

    %28
    la4 fad'
    re2~
    re4 mi

    %31
    la,8[(fad' re la)]
    si4 sold'
    mi2~

    %34
    mi4 fad\mbreak
    si,8[(sold' mi si)]
    dod4 lad'

    %37
    fad2~
    fad8[(red mi fad)]
    r mi[(fad sol)]

    %40
    r fad[(sol la)]
    r la[(si do)]
    r16 mi,,\f sol mi si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi

    %44
    mi'8[la, si si,]
    mi4 r\mbreak
    R2*9

    %55
    mi8[fad sol fad]
    mi[fad sol mi]
    re[mi fad mi]

    %58
    re[mi fad re]
    do[re mi re]
    do[re mi do]

    %61
    fad[sol fad mi]
    fad[sol fad mi]
    fad[sol fad lad,]

    %64
    si[dod re si]\mbreak
    re[re re re]
    re4 r8 re

    %67
    re[re re re]
    re4 r8 mi
    re[re re re]

    %70
    re4 r8 re
    re[re re re]
    re4 r8 lad'

    %73
    si si lad lad
    si[do re si]
    re,[re re re]\mbreak

    %76
    re4 r8 re
    re[re re re]
    re4 r8 mi

    %79
    re[re re re]
    re4 r8 re
    re[re re re]

    %82
    re4 r8 dod'
    do![do do do]
    do[do do do]\mbreak

    %85
    si8 [si, si dod]
    re[si si mi]
    fad[si, si lad']

    %88
    si[sol fad fad]
    fad'\f re sol4
    fad2

    %91
    mi
    re4. si'8
    lad si, la'4

    %94
    sold8 si, sol'4
    fad16 si, re fad si4
    r16 si lad si si, la' sol la

    %97
    si, sol' fad sol si, fad' mi fad
    si, si' lad si si, la'? sol la
    si, sol' fad sol si, fad' mi fad

    %100
    si,8[re dod dod]
    re8 [si, re si]
    fad'[sold lad fad]
    si,[dod re si]

    %104
    dod[re mi dod]
    re[mi re dod]
    si[dod re lad]

    %107
    si[fad' re si]
    fad'[re dod lad]
    re[si re si]

    %110
    re[si re si]
    sol'[mi sol mi]
    sol[mi sol mi]\mbreak

    %113
    dod[la dod la]
    dod[la dod la]
    fad'[re fad re]

    %116
    fad[re fad re]
    fad[re fad re]
    fad[re fad re]

    %119
    si'[sol si sol]
    si[sol si sol]\mbreak
    sol[si, sol' si,]

    %122
    sol'[si, sol' si,]
    do[mi do mi]
    do[mi do mi]

    %125
    la[dod, la' dod,]
    la'[dod, la' dod,]\mbreak
    re[fad re fad]

    %128
    re[fad re fad]
    la,[la' la, la']
    la,[la' la, la']

    %131
    la,[la' la, la']\mbreak
    la,[la' la, la']
    la,[la' la, la']

    %134
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    fa[re fa re]

    %137
    si[sol si sol]\mbreak
    do[mi do mi]
    sol,[sol' sol, sol']

    %140
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']
    sol,[sol' sol, sol']

    %143
    sol,[sol' sol, sol']
    mi[re mi do]
    fa[sol la fa]\mbreak

    %146
    re[do re si]
    do[fa mi re]
    do r sol' r

    %149
    fa r fad r
    sol[fa mi do]
    fa[la sol fa]

    %152
    mi[re do si]
    do r sol' r
    fa r sol r\mbreak  %%%5 fine p 14

    %155
    r16 do,\f mi sol do4
    r16 do, mi sol do4
    r16 do, mi sol do4

    %158
    la8[re, fad! re]
    la'[fad fad' la,]
    sol[re si' sol]

    %161
    si[sold sold' si,]
    la[mi do' la]
    mi'[do la' do,]

    %164
    si[fad red' si]
    fad'[red fad red]
    mi si \parenthesize r \parenthesize sol\p

    %167
    sol[(mi' do sol)]
    la4 fad'
    re2~

    %170
    re4 mi
    la,8[(fad' re la)]
    si4 sold'

    %173
    mi2~
    mi4 fad
    si,8[sold' mi si]

    %176
    dod4 lad'
    fad2~\mbreak
    fad8[ red(mi fad)]

    %179
    r mi[(fad sol)]
    r fad[(sol la)]
    r la[(si do)]

    %182
    r16 mi,,\f sol mi si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi

    %184
    mi'8[la, si si,]
    mi4 r
    R2*9

    %195
    si'4 si
    si si\mbreak
    si si

    %198
    mi mi
    la, la
    la la

    %201
    la la
    re re
    mi, mi

    %204
    mi mi
    mi mi
    mi la

    %207
    fad fad
    fad lad
    sol sol

    %210
    fa fa
    fa? fa
    fad!8[fad si fad]

    %213
    sol4 r
    do8[do do do]
    R2

    %216
    red8[red red red]
    R2
    do8[do do do]

    %219
    R2
    dod8[dod dod dod]\mbreak
    R2

    %222
    si,8[fad' mi red]
    mi[re' do si]
    do[mi red dod]

    %225
    red[si sol fad]
    si,2~
    si~\mbreak

    %228
    si4 si
    mi8\f[si sol' mi]
    si'[sol mi' si]
    sol'[mi si sol]
    sol16 mi sol mi si' mi, sol mi

    %233
    mi' mi, sol mi si' mi, sol mi
    mi' mi, sol mi si' mi, sol mi
    mi'8[la, si si,]

    %236
    mi2\fermata

}

IIIvlan =  \relative do' {

    r8
    mi4 r8 mi16 mi
    mi4 r8 mi16 mi
    mi4 r8 mi16 mi

    %4
    si4 r8 si16 si
    si4 r8 si16 si\mbreak
    si4 r8 si16 si

    %7
    si4 r8 si16 si
    mi4 r8 mi16 mi
    si4 r8 si16 si

    %10
    si4 r8 si16 si
    si4 r8 si16 si
    si4 r8 si16 si

    %13
    si4 r8 si16 si
    si4 r8 si16 si\mbreak
    si4 \p r8 red

    %16
    mi si' r do
    la la r si
    sol sol r la

    %19
    fad fad r sol
    mi mi r fad
    mi\f[si si si]

    %22
    si[si si si]
    si[si si si]
    si[si si si]

    %25
    si[si si si]
    si[red\p mi mi]
    sol2

    %28
    re~
    re8[sol, sol sol]
    si'4 la

    %31
    la2
    mi~
    mi8[la, la la]

    %34
    dod'4 si\mbreak
    si2
    fad~

    %37
    fad8[si, si si]
    red4 red
    si si

    %40
    si si
    do do
    si8\f[mi mi mi]

    %43
    mi[mi mi mi]
    mi[la si si,]
    mi4 r\mbreak

    %46
    R2*19
    si8[si si si]
    si4 r8 si

    %67
    si8[si si si]
    si4 r8 si
    si8[si si si]

    %70
    si4 r8 si
    si8[si si si]
    si4 r8 fad'

    %73
    si,[si fad' fad,]
    si[fad' si si,]
    si8[si si si]\mbreak

    %76
    si4 r8 si
    si8[si si si]
    si4 r8 si

    %79
    si8[si si si]
    si4 r8 si
    si8[si si si]

    %82
    si4 r8 fad'
    mi[mi mi mi]
    mi[mi mi mi]\mbreak

    %85
    re[si si dod]
    re[si si mi]
    fad[si, si lad']

    %88
    si[sol fad fad,]
    re'8[re16 re re8 si16 si]
    si4 r8 si16 si

    %91
    si4 r8 si16 si
    si4 r8 si16 si
    si4 r8 si16 si\mbreak

    %94
    si4 r8 si16 si
    si4 r8 si16 si
    si4 r8 si16 si

    %97
    si4 r8 si16 si
    si4 r8 si16 si
    si4 r8 si16 si

    %100
    si8[fad' fad fad]
    fad[si, re si]
    fad'[sold lad fad]

    %103
    si,[dod re si]
    dod[re mi dod]
    re[mi re dod]
    si[dod re lad]

    %107
    si[fad' re si]
    fad'[re dod lad]
    R2*46

    %155
    do4\f r8 do16 do
    do4 r8 do16 do
    do4 r8 do16 do

    %158
    fad,!4 r8 re'16 re
    re4 r8 re16 re
    sol,4 r8 sol16 sol

    %161
    mi'4 r8 mi16 mi
    la,4 r8 la16 la
    la4 r8 la16 la

    %164
    si4 r8 si16 si
    si4 r8 si16 si
    mi4 \parenthesize r8\parenthesize mi16 \p\parenthesize mi

    %167
    sol2
    re~
    re8[sol, sol sol]

    %170
    si'4 la
    la2
    mi~
    mi8[la, la la]
    dod'4 si

    %175
    si2
    fad~
    fad8[si, si si]\mbreak

    %178
    red4 red
    si si
    si si

    %181
    do do
    si8\f[mi mi mi]
    mi[mi mi mi]
    mi[la si si,]

    %185
    mi4 r
    R2*9
    sold4 sold

    %196
    sold? sold\mbreak
    sold? sold
    la la

    %199
    fad fad
    fad fad
    fad fad

    %202
    sol? sol
    sol, sol
    sol sol

    %205
    la la\mbreak
    la la
    red red

    %208
    red? red
    mi mi
    la, la

    %211
    la la
    si8[si red si]
    mi4 r\mbreak

    %214
    la8[la la la]
    R2
    si8[si si si]

    %217
    R2
    la8[la la la]
    R2

    %220
    fad8[fad fad fad]\mbreak
    R2
    si, 8[fad' mi red]

    %223
    mi[re' do si]
    do[mi red dod]

    %225
    red[si sol fad]
    si,2~
    si~\mbreak

    %228
    si4 si
    si8\f[si mi mi]
    sol[sol si si]

    %231
    mi[si sol mi]
    si[si16 si si8 si16 si]
    si8[si16 si si8 si16 si]

    %234
    si8[si16 si si8 si16 si]
    si8[la' si si,]
    mi2\fermata

}

IIIbcn = \relative do {

    r8
    r mi16 mi mi4
    r8 mi16 mi mi4
    r8 mi16 mi mi4

    %4
    r8 si16 si si4
    r8 si16 si si4\mbreak
    r8 si16 si si4

    %7
    r8 si16 si si4
    r8 mi16 mi mi4
    r8 si16 si si4

    %10
    r8 si16 si si4
    r8 si16 si si4
    r8 si16 si si4

    %13
    r8 si16 si si4
    r8 si16 si si4\mbreak
    r8 si16\p si si4

    %16
    r8 mi'[mi la,]
    r re[re sol,]
    r do[do fad,]

    %19
    r si[si mi,]
    r la[la red,]
    mi\f[si si si]

    %22
    si[si si si]
    si[si si si]
    si[si si si]

    %25
    si[si si si]
    si[si'\p sol mi]
    mi2

    %28
    fad
    sol8[sol, sol sol]
    sol[sol sol sol]

    %31
    fad'2
    sold
    la8[la, la la]

    %34
    la[la la la]\mbreak
    sold'2
    lad

    %37
    si8[si, si si]
    si4 si
    mi mi

    %40
    si si
    la la
    mi'8\f[mi mi mi]

    %43
    mi[mi mi mi]
    mi[la si si,]
    mi4 mi\mbreak

    %46
    mi mi
    mi sol
    la sol

    %49
    fad sol
    la sol
    fad8[la sol fad]

    %52
    mi[la sol fad]
    mi[la red, si]
    mi[fad sol mi]\mbreak

    %55
    R2*34
    si8 si16 si si4
    r8 si16 si si4

    %91
    r8 si16 si si4
    r8 si16 si si4
    r8 si16 si si4\mbreak

    %94
    r8 si16 si si4
    r8 si16 si si4
    r8 si16 si si4

    %97
    r8 si16 si si4
    r8 si16 si si4
    r8 si16 si si8 si

    %100
    si[si fad' fad,]
    si4 r
    R2*53

    %155
    do8\f do16 do do4
    do8 do16 do do4
    do8 do16 do do4

    %158
    r8 re16 re re4
    r8 re16 re re4
    r8 sol,16 sol sol4

    %161
    r8 mi'16 mi mi4
    r8 la,16 la la4
    r8 la16 la la4

    %164
    r8 si16 si si4
    r8 si16 si si4
    r8 mi16\p mi \parenthesize mi4\mbreak

    %167
    mi2
    fad
    sol8[sol, sol sol]

    %170
    sol[sol sol sol]
    fad'2
    sold

    %173
    la8[la, la la]
    la[la la la]
    sold'2

    %176
    lad
    si8[si, si si]\mbreak
    si4 si

    %179
    mi mi
    si si
    la la

    %182
    mi'8\f[mi mi mi]
    mi[mi mi mi]
    mi[la si si,]

    %185
    mi[fad sol fad]
    mi4 r
    r r8 mi\mbreak

    %188
    mi,4 r
    r r8 mi'
    mi,4 r

    %191
    r r8 mi'
    mi, r fad' r
    sol r la r

    %194
    red,[dod red si]
    R2*18
    mi4 mi\mbreak

    %214
    R2
    mi4 mi
    R2

    %217
    mi4 mi
    R2
    mi4 mi

    %220
    R2\mbreak
    mi4 mi
    R2*7

    %229
    mi8\f[mi16 mi mi8 mi16 mi]
    mi8[mi16 mi mi8 mi16 mi]
    mi8[mi16 mi mi8 mi16 mi]

    %232
    mi8[mi16 mi mi8 mi16 mi]
    mi8[mi16 mi mi8 mi16 mi]
    mi8[mi16 mi mi8 mi16 mi]

    %235
    mi8[la si si,]
    mi2\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key mi\minor
  \time 2/4
  \tempo 2 = 60
  \partial 8 s8
  s2*236
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

   \markup\huge "[1.] All[egr]o molto"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""[principale]"}
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
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
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
            % \override SpacingSpanner.uniform-stretching = ##t
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

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff  = "main" <<
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
            \set Staff.midiInstrument = #"contrabass"
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

   \markup\huge "[3.] All[egr]o"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff  = "main" <<
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
            \set Staff.midiInstrument = #"contrabass"
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

