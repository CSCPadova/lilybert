\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

cres = _\markup\italic"cres."

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

dolce  = _\markup \italic "dolce"

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
   \terzinequarto
}

IflIn = \relative do'' {

   sol'4 sol16 fad sol la sol4 r
   R1
   si4 si16 la si do si4 r

   %4
   R1*3
   r4 re2 si8 re\mbreak
   \grace re8 do4 si2 la4

   %9
   sol r r2
   sol4 si16 la si do si4 dod
   re8 la la2.

   %12
   sol8 fad mi re dod si' la sol
   sol4\tr fad r2\mbreak
   r r4 mi16 re mi fad

   %15
   sol4 r r sol16 fad sol la
   si8 la sol fad mi re dod si
   la4 la'8. la16 la4 r

   %18
   sol1\mbreak
   fad
   dod'

   %21
   re
   si4 si8.\tr(la32 si) re8 si re si
   si la la2 sol4

   %24
   \tuplet 3/2 { fad8(sol la) sol[(fad mi)] } re4 mi\tr \mbreak
   re2 r
   r r4 sol,16 fad sol la

   %27
   si4 r r si16 la si do
   re4 re16 do re mi fa8 re si sol
   do2 r\mbreak

   %30
   r r4 la16 sold la si
   dod4 r r dod16 si dod re
   mi4 mi16 re mi fad! sol8 mi dod la

   %33
   re2 r
   re8(fad) la (do!) do2
   si16 \parentSlur (do re8) re-. re-.\mbreak re2

   %36
   re,8(fad) la (do) do2
   si16 \parentSlur (do re8) re-. re-. re2
   mi re

   %39
   do si4 r8 re,
   mi4 do'8 la sol4 la\tr\mbreak
   sol sol16 fad sol la sol4 r

   %42
   r sol16 fad sol la sol4 r
   r sol16 fad sol la sol4 r
   r sol16 fad sol la sol4 r\mbreak

   %45
   sol sol8. sol16 sol4 r
   sol\solo sol16 fad sol la sol4 r8 sol,
   la-. si-. do-. re-. mi-. fad-. sol-. la-.

   %48
   si4\f si16 la si do si4 r8 si,\parenthesize \p
   do-. re-. mi-. fad-.\mbreak sol-. la-. si-. do-.
   re4 re2 si8 re

   %51
   \grace re do4 si2 la4
   sol r r2
   R1*2

   %55
   \senza\tuplet 3/2 { sol,8\solo mi sol si[sol si] re si re sol[re sol]
   si sol re si[re sol] si sol re si[re sol]
   \once\stemDown la  re,, fad la[fad la] re[la re] fad re fad

   %58
   la fad re la[re fad] la fad re la[re fad]
   sol mi dod la[dod mi] sol mi dod la[dod mi]}
   fad8 la la2.

   %61
   \tuplet 3/2 { sol8 mi dod la[dod mi] sol mi dod la[dod mi] }
   fad la la2.\mbreak
   si4 si16 la si do si4 dod

   %64
   re8 la la2 sol4
   \tuplet 3/2 { fad8(mi fad) sol[(fad sol)] } la8 r r4
   \tuplet 3/2 { mi8(re mi) fad[(mi fad)] } sol8 r r4\mbreak

   %67
   \tuplet 3/2 { re8(dod re) mi[(re mi)] } fad8 r r4
   \tuplet 3/2 { dod8(si dod) re[(dod re)] } mi8 r r4
   \tuplet 3/2 { si8(la si) dod[(si dod)] re(dod re) mi[(re mi)]

   %70
   fad(mi fad) sol[(fad sol)] la(sol la) si[(la sol)]
   fad(mi fad) sol[(fad mi)]} re4 mi\tr
   \tuplet 3/2 { re8(fad mi) re[(dod si)] \once\stemUp la(re' dod) si[(la sol)]

   %73
   fad(si la) sol[(fad mi)] }  \appoggiatura re4 mi2\tr
   \tuplet 3/2 { re8(fad la) fad[(la re)] } re2
   \tuplet 3/2 { re,8(sol si) sol[(si re)] } re2

   %76
   re16 dod si la sol fad mi re si' la sol fad mi re dod si
   la2 mi'\tr
   re4 re16 dod re mi re8 r r4

   %79
   R1
   fad4 fad16 mi fad sol fad4 r
   R1*3

   %84
   r4 la2 fad8 la
   \grace la sol4 fad2 mi4\mbreak
   re r r2

   %87
   \tuplet 3/2 { re8\solo la re fad[re fad] la fad re la[re fad]
   la fad re la[re fad] la fad re la[re fad]
   re si re sol[re sol]  si sol re si[re sol]\mbreak

   %90
   si sol re si[re sol] si sol re si[re sol]
   mi si mi sol[mi sol] si sol mi si[mi sol]
   si sol mi si[mi sol] si sol mi si[mi sol]

   %93
   red si red fad[red fad]\mbreak si fad red si[red fad]
   si fad red si[red fad] si fad red si[red fad]
   mi sol si sol[si mi]} mi re! do si

   %96
   do1
   \tuplet 3/2 { re,8 fad la fad[la re] } re do si la\mbreak
   si1

   %99
   \tuplet 3/2 { do,8 mi sol mi[sol do] } do si la sold
   la1
   \tuplet 3/2 { si,8 red fad red[fad si] } si la sol fad

   %102
   sol1
   \tuplet 3/2 { sol8(fad sol) la[(sol la)] } si r r4\mbreak
   \tuplet 3/2 { fad8(mi fad) sol[(fad sol)] } la r r4

   %105
   \tuplet 3/2 { sol8(fad sol) la[(sol la)] si(la si) do[( si do)] }
   red4 mi2 la,4
   sol2 fad\tr

   %108
   mi4 r r2
   R1*4\mbreak
   sol4\tu sol16 fad sol la sol4 r

   %114
   R1
   si4 si16 la si do si4 r
   R1*3

   %119
   r4 re2 si8 re
   \grace re do4 si2 la4\mbreak
   sol r r2

   %122
   sol4\solo sol16 fad sol la sol8 re sol la
   si4 si16 la si do si8 la si re
   re4 re16 do si la sol8 la si do\mbreak

   %125
   \tuplet 3/2 { re8 si sol re[sol si] re si sol re[sol si] }
   do4 do16 si la sol fad8 sol la si
   \tuplet 3/2 { do8 la fad re[fad la] do la fad re[fad la]

   %128
   si(la si) do[(si do)]}\mbreak re r r4
   \tuplet 3/2 { la8(sol la) si[(la si)] } do r r4
   \tuplet 3/2 { sol8(fad sol) la[(sol la)] } si r r4

   %131
   \tuplet 3/2 { fad8(mi fad) sol[(fad sol)] } la r r4\mbreak
   \tuplet 3/2 { mi8(re mi) fad[(mi fad)] sol(fad sol) la(sol la)]
   si(la si) do[(si do)] re(do re) mi[(re do)]

   %134
   si(la si) do[(si la)]} sol4 fad\tr\mbreak
   \tuplet 3/2 { sol8 si la sol[fad mi] re sol fad mi[re do]
   si mi re do[si la]} sol4 la\tr

   %137
   \tuplet 3/2 { sol8 si re si[re sol] } sol2
   \tuplet 3/2 { sol,8 do mi do[mi sol] } sol2\mbreak
   sol16 fad mi re do si la sol mi' re do si la sol fad mi

   %140
   re2 la'\tr
   sol4 r r sol16\tu fad sol la
   si4 r r si16 la si do\mbreak

   %143
   re4 re16 do re mi fa8-. re-. si-.sol-.
   do2 r
   r r4 la16 sold la si

   %146
   dod4 r r dod16 si dod re
   mi4 mi16 re mi fad! sol8 mi dod la\mbreak
   re2 r

   %149
   re8(fad la do!) do2
   si16(do re8) re-. re-. re2
   re,8(fad la do) do2

   %152
   si16(do re8) re-. re-. re2
   mi re\mbreak
   do si4 r8 re,

   %155
   mi4 do'8 la sol4 la\tr
   sol sol16 fad sol la sol4 r
   r sol16 fad sol la sol4 r

   %158
   r sol16 fad sol la sol4 r\mbreak
   r sol16 fad sol la sol4 r
   sol sol8. sol16 sol4 r

}

IflIIn = \relative do'' {

   si4 si16 la si do si4 r
   R1
   sol'4 sol16 fad sol la sol4 r

   %4
   R1*3
   r4 si2 sol8 si\mbreak
   \grace si16 la4 sol2 fad4

   %9
   sol r r2
   sol4 sol16 fad sol la sol4 mi
   fad fad2.

   %12
   mi8 re dod si la sol' fad mi
   mi4 re r2
   r r4 dod16 si dod re\mbreak

   %15
   mi4 r r mi16 re mi fad
   sol8 fad mi re dod si la sold
   la4 dod8. dod16 dod4 r

   %18
   dod1
   re
   sol

   %21
   fad\mbreak
   sol4 sol16 fad sol la sol4 sol
   sol8 fad fad2 mi4

   %24
   re re2 dod4\tr
   re2 r
   r r4 sol,16 fad sol fad

   %27
   sol4 r r sol16 fad sol la\mbreak
   si4 si16 la si do? re8 si sol si
   do2 r

   %30
   r r4 la16 sold la sold
   la4 r r la16 sold la si
   dod4 dod16 si dod re mi8 dod la dod

   %33
   re2 r\mbreak
   r8 re fad \parentSlur (la) la2
   sol16(la si8) si-. si-. si2

   %36
   r8 re, fad \parentSlur (la) la2
   sol16(la si8) si-. si-. si2
   do2 si

   %39
   la sol4 r8 si,\mbreak
   do4 mi8 do si4 la\tr
   si si16 la si do si4 r

   %42
   r si16 la si do si4 r
   r si16 la si do si4 r
   r si16 la si do si4 r\mbreak

   %45
   si4 si8. si16 si4 r
   si\solo si16 la si do si4 r
   R1

   %48
   sol'4\parenthesize \f sol16 fad sol la sol4 r8 sol,\p
   la-. si-.do-. re-. mi-. fad-. sol-. la-.\mbreak
   si4 si2 sol8 si

   %51
   \grace si la4 sol2 fad4
   sol r r2
   R1*2

   %55
   \senza r4 \tuplet 3/2 { sol,8\parenthesize \solo re sol si[sol si] re si re
   sol re si sol[ si re] sol re si sol[si re]}
   fad4 \tuplet 3/2 { fad,8 re fad la[fad la] re la re

   %58
   fad re la fad[la re] fad re la fad[la re]}
   mi1
   \tuplet 3/2 { fad8 re la fad[la re] fad re la fad[la re] }

   %61
   mi1
   \tuplet 3/2 { fad8 re la fad[la re] fad re la fad[la re] }
   sol4 sol16 fad sol la sol4 mi

   %64
   fad fad2 mi4
   \tuplet 3/2 { re8(dod re) mi[(re mi)] } fad r r4\mbreak
   \tuplet 3/2 { dod8(si dod) re[(dod re)] } mi r r4

   %67
   \tuplet 3/2 { fad,8(mi fad) sol[\parentSlur ( fad sol)] } la r r4
   \tuplet 3/2 { mi8(re mi) fad[(mi fad)] } sol r r4
   \tuplet 3/2 { sol8(fad sol) la[(sol la)] \mbreak si(la si) dod[(si dod)]

   %70
   re(dod re) mi[(re mi)] fad(mi fad) sol[(fad mi)]
   la,(sol la) si[la sol]} fad4 sol\tr
   \tuplet 3/2 { fad8 re' dod si[la sol] \once\stemUp fad si' la sol[fad mi]\mbreak

   %73
   re sol fad mi[re dod]} dod2\tr
   re4 r \tuplet 3/2 { re8 fad la fad[la re] }
   re2 \tuplet 3/2 { re,8 sol si sol[si re] }

   %76
   re2 re16 dod si la sol fad mi re\mbreak
   la2 dod\tr
   re4 fad,16 mi fad sol fad4 r

   %79
   R1
   re'4 re16 dod re mi re4 r
   R1*3

   %84
   r4 la'2 fad8 la
   \grace la sol4 fad2 mi4\mbreak
   re r r2

   %87
   r4 \tuplet 3/2 { re8\parenthesize \solo la re fad[re la] fad la re
   fad re la fad[la re] fad re la fad[la re]}
   r4 \tuplet 3/2 { re8 si re sol[re si] sol si re\mbreak

   %90
   sol[re si] sol si re sol[re si] sol si re}
   r4 \tuplet 3/2 { mi8 si mi sol[mi si] sol si mi
   sol mi si sol[si mi] sol mi si sol[si mi]}\mbreak

   %93
   r4 \tuplet 3/2 { red8 si red fad[red si] fad si red
   fad red si fad[si red] fad red si fad[si red]}
   mi4 r r2

   %96
   \tuplet 3/2 { la,8 do mi do[mi la] } la sol fad mi\mbreak
   fad1
   \tuplet 3/2 { sol,8 si re si[re sol] } sol fad mi red

   %99
   mi1
   \tuplet 3/2 { fad,8 la do la[do fad] } fad mi red do
   red1\mbreak

   %102
   \tuplet 3/2 { mi,8 sol si sol[si \once\set suggestAccidentals = ##t red?] } mi2
   \tuplet 3/2 { mi8 (red mi) fad[(mi fad)] } sol r r4
   \tuplet 3/2 { red8(dod red) mi[(red mi)] } fad r r4

   %105
   \tuplet 3/2 { mi8 (red mi) fad[(mi fad)] sol(fad sol) la[(sol la)]}
   fad4 sol2 fad4
   mi2 red\tr

   %108
   mi4 r r2
   R1*4\mbreak
   si4 si16 la si do si4 r

   %114
   R1
   sol'4 sol16 fad sol la sol4 r
   R1*3

   %119
   r4 si2 sol8 si
   \grace si la4 sol2 fad4\mbreak
   sol r r2

   %122
   si,4\solo si16 la si do si4 r
   sol'4 sol16 fad sol la sol8 re sol la
   si4 si16 la sol fad sol8 fad sol la\mbreak

   %125
   \tuplet 3/2 { si8 sol re si[re sol]  si8 sol re si[re sol]}
   la4 la16 sol fad mi fad8 mi fad sol
   \tuplet 3/2 { la fad re la[re fad] la fad re la[re fad]

   %128
   sol(fad sol) la[( sol la)]\mbreak } si r r4
   \tuplet 3/2 { fad8(mi fad) sol[\parentSlur ( fad sol)] } la r r4
   \tuplet 3/2 { si,8(la si) do[(si do)] } re r r4

   %131
   \tuplet 3/2 { la8(sol la) si[(la si)] } do r r4\mbreak
   \tuplet 3/2 { do8(si do) re[(do re)] mi(re mi) fad[(mi fad)]
   sol(fad sol) la[(sol la)] si(la si) do[(si la)]

   %134
   re,(do re) mi[(re do)]} si4 la\tr \mbreak
   \tuplet 3/2 { si8 sol' fad mi[re do] si mi re do[si la]
   sol do si la[sol fad]} sol4 fad\tr

   %137
   sol r \tuplet 3/2 { sol8 si re si[re sol] }
   sol2 \tuplet 3/2 { sol,8 do mi do[mi sol] }\mbreak
   sol2 sol16 fad mi re do si la sol

   %140
   re2 fad!\tr
   sol4 r r sol16 fad sol fad
   sol4 r r sol16 fad sol la\mbreak

   %143
   si4 si16 la si do? re8 si sol si
   do2 r
   r r4 la16 sold la si

   %146
   la4 r r la16 sold la si
   dod4 dod16 si dod re mi8 dod la dod
   re2 r\mbreak

   %149
   r8 re \parentSlur (fad la) la2
   sol16(la si8) si-. si-. si2
   r8 re,\parentSlur ( fad la) la2

   %152
   sol16(la si8) si-. si-. si2
   do2 si
   la sol4 r8 si,\mbreak

   %155
   do4 mi8 do si4 la\tr
   si si16 la si do si4 r
   r si16 la si do si4 r

   %158
   r si16 la si do si4 r
   r si16 la si do si4 r\mbreak
   si4 si8. si16 si4

}

IvlIn = \relative do'' {

   sol4 sol16 fad sol la sol4 r8 sol,\p
   la-. si-. do-. re-. mi-. fad-. sol-. la-.
   si4\f si16 la si do si4 r8 si,\p \mbreak

   %4
   do-. re-. mi-. fad-. sol-. la-. si-. do-.
   re4 re2\f si8 re
   \grace re do4 si2 la4

   %7
   sol r r r8 si\p
   \grace re do4 si2 la4\mbreak
   sol8 sol16\f sol la la si si do do re re mi mi fad fad

   %10
   sol4 si16 la si do si4 dod
   re8 la la2.
   sol8 fad mi re dod si la sol'\mbreak

   %13
   sol4\tr fad r2
   mi4 \grace fad16 mi re mi fad mi4 r8 r16 fad
   sol4 \grace la16 sol fad sol la sol4 r8 r16 la

   %16
   si8 la sol fad mi re dod si
   la4 mi8 dod la4 r\mbreak
   sol''2\p mi4 dod  %% inizio 5ta riga

   %19
   re16 la si dod re mi fad sol la4 r
   sol8(mi) dod(la) mi'(dod) la(sol)
   fad16 re\parenthesize \f mi fad sol la si dod re mi fad sol la fad sol la

   %22
   si4 si8.\parenthesize \tr  \parentSlur (la32 si) re8 si re si
   si la la2\parenthesize \p sol4
   \tuplet 3/2 { fad8(sol la) sol[(fad mi)] } re4 mi\tr \mbreak

   %25
   re2 r
   sol4\f sol,16 fad sol la sol4 r\mbreak
   si si16 la si do si4 r

   %28
   re re16 do re mi fa8 re si sol
   do4 do, r2
   la''4 la,16 sold la si la4 r

   %31
   dod dod16 si dod re dod4 r\mbreak
   mi mi16 re mi fad! sol8 mi dod la
   re4 re, r2

   %34
   re'8(fad) la (do!) do2
   si16 (do re8) re-. re-.\mbreak re2
   re,,8\p(fad) la (do) do2

   %37
   si16(do re8) re-. re-. re2
   mi8\f fad16 sol la sol fad mi re4 r
   do8 re16 mi fa mi re do si4 r8 re,

   %40
   mi4 do'8 la sol4 fad?\tr \mbreak
   sol sol'16\parenthesize \p fad sol la sol8 si,-.\parenthesize \f do-. re-.
   mi4 sol16\p fad sol la \once\stemDown sol8 si,,-.\f do-. re-.

   %43
   sol,4 sol''16\p fad sol la \once\stemDown sol8 si,-.\f do-. re-.
   mi4 sol16\p fad sol la \once\stemDown sol8 si,,-.\f do-. re-.\mbreak%% Fine p 1
   sol,4 sol8. sol16 sol4 r

   %46
   sol'\p re8. si16 sol4 r
   R1
   sol'4\parenthesize \f  re8. si16 sol4 r

   %49
   R1
   sol'8\parenthesize \p  sol sol sol sol sol sol sol
   re' re re re\mbreak re, re re re

   %52
   sol4_\upl re'2\f si8 re
   \grace re do4 si2 la4
   sol8 sol,16\parenthesize \f  sol la la si si do do re re mi mi fad fad

   %55
   sol4\p sol si si
   si si si si\mbreak
   la la la la

   %58
   la la la la
   sol'1
   fad

   %61
   dod
   re
   R1*2

   %65
   r2 \tuplet 3/2 { r8(fad\p sol) la[(sol fad)] }
   mi r r4 \tuplet 3/2 { r8(mi fad) sol[(fad mi)]}\mbreak
   re r r4 \tuplet 3/2 { r8(re mi)  fad[(mi re)]}

   %68
   dod r r4 \tuplet 3/2 { r8(dod re) mi[(re dod)] }
   si r dod r re r mi r
   fad r sol r\mbreak la r \tuplet 3/2 { si\f(la sol) }

   %71
   fad r \tuplet 3/2 { sol(fad mi) } re4 mi\tr
   re r r2
   R1

   %74
   la4\p la la la
   si si si si
   R1*2\mbreak

   %78
   re4\tu\parenthesize\f re16 dod re mi re4 r8 re,\p
   mi-. fad-. sol-. la-. si-. dod-. re-. mi-.
   fad4\f fad16 mi fad sol fad4 r8 fad,\p

   %81
   sol-. la-. si-. dod-. re-. mi-. fad-. sol-.\mbreak
   la4 la2\f fad8 la
   \grace la sol4 fad2 mi4

   %84
   re la2\p fad8 la
   \grace la sol4 fad2 mi4
   re8 re16\f re mi mi fad fad sol sol la la si si dod dod\mbreak

   %87
   re4\p re re re
   re re re re
   si si si si

   %90
   si si si si
   mi mi mi mi
   mi mi mi mi

   %93
   red red red red
   red? red red red\mbreak
   mi mi'2.

   %96
   do1
   re
   si

   %99
   do
   la
   si

   %102
   sol
   sol8 r r4\tuplet 3/2 { r8(sol la) si[(la sol)] }
   fad8 r r4\tuplet 3/2 { r8 (fad sol) la[(sol fad)] }

   %105
   sol r r4 r2
   R1*2\mbreak
   r8 mi,16\f mi fad fad sol sol la la si si do! do red red

   %109
   mi8-. sol-. fad-. mi-. red do si la
   sol mi16\f mi fad fad sol sol la la si si do do red red\mbreak
   mi4-. do-. la-. si-.

   %112
   mi,2 r
   sol4 sol16 fad sol la sol4 r8 sol,\p
   la-. si-. do-. re-. mi-. fad-. sol-. la-.

   %115
   si4\f si16 la si do si4 r8 si,\p\mbreak
   do-. re-. mi-. fad-. sol-. la-. si-. do-.
   re4 re2\parenthesize\f si8 re

   %118
   \grace re do4 si2 la4
   sol r r r8 si\p
   \grace re do4 si2 la4

   %121
   sol8 sol,16 \f sol la la si si\mbreak do do re re mi mi fad fad
   sol4\parenthesize\p re8. si16 sol4 r
   sol'4 re8. si16 sol4 r

   %124
   R1
   re'''8\parenthesize\mf re4 re re re8
   do4 r r2\mbreak

   %127
   do8 do4 do do do8
   si r r4 \tuplet 3/2 { r8(si do) re[(do si)] }
   la8 r r4 \tuplet 3/2 { r8(la si) do[(si la)] }

   %130
   sol r r4 \tuplet 3/2 { r8(sol la) si[(la sol)] }\mbreak
   fad r r4 \tuplet 3/2 { r8( fad sol) la[(sol fad)]}
   mi r fad r sol r la r

   %133
   si r do r re r \tuplet 3/2 { mi(re do) }
   si4 \tuplet 3/2 {do8(si la)} sol4 fad\tr \mbreak
   sol r r2

   %136
   R1
   re4\p re re re
   mi mi mi mi

   %139
   R1*2
   sol4\f sol,16\tu  fad sol la sol4 r
   si si16 la si do si4 r\mbreak

   %143
   re re16 do re mi fa8 re si sol
   do4 do, r2
   la''4 la,16 sold la si la4 r

   %146
   dod dod16 si dod re dod4 r
   mi mi16 re mi fad\mbreak sol8 mi dod la
   re4 re, r2

   %149
   re'8 \parentSlur (fad la do!) do2
   si16\parentSlur (do re8) re-.  re-. re2
   re,,8\p \parentSlur (fad la do) do2

   %152
   si16(do re8) re-.  re-. re2
   mi8\mf fad16 sol la sol fad mi re4 r
   do8 re16 mi fa mi re do si4 r8 re,

   %155
   mi4 do'8 la sol4 fad?\tr \mbreak
   sol sol'16\p fad sol la sol8 si,-.\f do-. re-.
   mi4 sol16\p fad sol la \once\stemDown sol8 si,,-.\f do-. re-.

   %158
   sol,4 sol''16\p fad sol la \once\stemDown sol8 si,-.\f do-. re-.
   mi4 sol16\p fad sol la \once\stemDown sol8 si,,-.\f do-. re-.\mbreak%% Fine p 1
   sol,4 sol8. sol16 sol4 r

}

IvlIIn = \relative do'' {

   si,4 si16 la si do si4 r
   R1
   sol'4 sol16 fad sol la sol4 r8 sol,\p

   %4
   la-. si-. do-. re-. mi-. fad-. sol-. la-.\mbreak
   si4 si2\f sol8 si
   \grace si la4 sol2 fad4

   %7
   sol r r r8 sol\p
   la4 sol2 fad4
   sol8 sol16\parenthesize \f sol la la si si do do re re mi mi fad fad\mbreak

   %10
   sol4 sol16 fad sol la sol4 mi
   fad fad2.
   mi8 re dod si la4. mi'8

   %13
   mi4\tr re r2
   dod4 dod16 si dod re dod4 r8 r16 re\mbreak
   mi4 mi16 re mi fad mi4 r8 r16 fad

   %16
   sol8 fad mi re dod si la sold
   la4 mi8. dod16 la4 r
   mi''\p dod2 la4

   %19 OOKK
   fad16 fad sol la si dod re mi\mbreak fad4 r %% inizio 5ta riga
   mi8(dod) la(fad) dod'(la) la(sol)
   fad16 re\f mi fad sol fad sol la si dod re  mi fad re mi fad

   %22
   sol4 sol16 fad sol la sol4 sol
   fad fad2\p mi4
   re re2 dod4

   %25
   re2 r
   sol4\f sol,16 fad sol la sol4 r
   sol4 sol16 fad sol la sol4 r

   %28
   si si16 la si do re8 si sol si
   do4 do, r2\mbreak
   dod4 dod16 si dod re dod4 r

   %31
   la' la16 sold la si la4 r
   dod dod16 si dod re mi8 dod la dod
   re4 re, r2

   %34
   r8 re' fad (la) la2\mbreak
   sol16(la si8) si-. si-. si2

   %36
   r8 re,,\p fad (la) la2
   sol16(la si8) si-. si-. si2
   mi8\parenthesize \f fad16 sol la sol fad mi re4 r

   %39
   do8 re16 mi fa mi re do si4 r8 re,
   do4 mi8 do si4 la\tr
   si sol''16\p fad sol la sol8 si,\f-. do-. re-.
   mi4 sol16\p fad sol la \once\stemDown sol8 si,,-.\f do-. re-.

   %43
   sol,4 sol''16\p fad sol la \once\stemDown sol8 si,-.\f do-. re-.
   mi4 sol16\p fad sol la \once\stemDown sol8 si,,-.\f do-. re-.\mbreak%% Fine p 1
   sol,4 sol8. sol16 sol4 r

   %46
   sol'\p re8. si16 sol4 r
   R1
   sol'4\parenthesize \f  re8. si16 sol4 r

   %49
   R1
   sol'8\p sol sol sol sol sol sol sol
   fad fad fad fad re re re re

   %52
   sol4 si2\f sol8 si
   \grace si la4 sol2 fad4
   sol8 sol,16\f sol la la si si do do re re mi mi fad fad

   %55
   sol4\p sol sol sol
   sol sol sol sol
   fad fad fad fad

   %58
   fad fad fad fad
   dod'1
   re

   %61
   sol,\mbreak
   fad
   R1*2

   %65
   r2 \tuplet 3/2 { r8(re'\parenthesize \p mi) fad[(mi re)] }
   dod r r4 \tuplet 3/2 { r8(dod re) mi[(re dod)] }
   fad, r r4 \tuplet 3/2 { r8(fad sol) la[(sol fad)] }\mbreak

   %68
   mi r r4 \tuplet 3/2 { r8(mi fad) sol[(fad mi)] }
   sol r la r si r dod r
   re r mi r fad r \tuplet 3/2 { sol\f (fad mi) }

   %71
   re r\tuplet 3/2 { si(la sol) }\mbreak fad4 sol\tr
   fad r r2
   R1

   %74
   fad4\p fad fad fad
   sol sol sol sol
   R1*2

   %78
   fad4\tu\f fad16 mi fad sol fad4 r
   R1\mbreak
   re'4 re16 dod re mi re4 r8 re,\p

   %81
   mi-. fad-. sol-.  la-. si-. dod-. re-. mi-.
   fad4 fad2\f re8 fad
   \grace fad mi4 re2 dod4

   %84
   re fad,2\p re8 fad
   \grace fad mi4 re2 dod4
   re8 re16\f re mi mi fad fad sol sol la la si si dod dod\mbreak

   %87
   re4\p fad, fad fad
   fad fad fad fad
   sol sol sol sol\mbreak

   %90
   sol sol sol sol
   sol sol sol sol
   sol sol sol sol

   %93
   fad fad fad fad
   fad fad fad fad
   sol4 sol'2.

   %96
   la1
   sol \mbreak
   sol

   %99
   mi
   fad
   red

   %102
   mi
   mi8 r r4 \tuplet 3/2 { r8(mi fad) sol[(fad mi)] }
   red r r4\mbreak \tuplet 3/2 { r8(red mi) fad[(mi red)] }

   %105
   mi r r4 r2
   R1*2\mbreak
   r8 mi,16\f mi fad fad sol sol la la si si do! do red red

   %109
   mi8-.  mi-. red-. do-. si-. la-. sol-. fad-.
   mi mi16\f mi fad fad sol sol la la si si do do red red\mbreak
   mi4-. do-. la-. si-.

   %112
   mi,2 r
   si4 si16 la si do si4 r
   R1

   %115
   sol'4\parenthesize\f sol16 fad sol la sol4 r8 sol,\p
   la-. si-. do-. re-. mi-. fad-. sol-. la-.\mbreak
   si4 si2 \parenthesize\f sol8 si

   %118
   \grace si la4 sol2 fad4
   sol r r r8 sol\p
   la4 sol2 fad4

   %121
   sol8 sol,16 \f sol la la si si\mbreak do do re re mi mi fad fad
   sol4 \p re8. si16 sol4 r
   sol'4 re8. si16 sol4 r

   %124
   R1
   si''8\mf si4 si si si8
   la4 r r2

   %127
   la8 la4 la la la8
   sol r r4 \tuplet 3/2 { r8 (sol la) si[(la sol)] }
   fad r r4\mbreak \tuplet 3/2 { r8(fad sol) la[(sol fad)] }

   %130
   si, r r4 \tuplet 3/2 { r8(si do) re[(do si)] }
   la4 r \tuplet 3/2 { r8 (la si)  do[(si la)]}
   do r re r mi r fad r

   %133
   sol r la r\mbreak si r \tuplet 3/2 { do(si la) }
   sol r \tuplet 3/2 { mi(re do) } si4 la\tr
   si r r2

   %136
   R1
   si4\p si si si
   do do do do

   %139
   R1*2
   sol'4\f si,,16\tu la si do si4 r\mbreak
   sol'4 sol16 fad sol la sol4 r

   %143
   si si16 la si do re8 si sol si
   do4 do, r2\mbreak
   dod'4 dod,16 si dod re dod4 r

   %146
   la' la16 sold la si la4 r
   dod dod16 si dod re mi8 dod la dod
   re4 re, r2

   %149
   r8 re' (fad la) la2\mbreak
   sol16(la si8) si-. si-. si2

   %151
   r8 re,,\parenthesize \p \parentSlur (fad la) la2
   sol16(la si8) si-. si-. si2
   mi8\mf fad16 sol la sol fad mi re4 r

   %154
   do8 re16 mi fa mi re do si4 r8 re,
   do4 mi8 do si4 la\tr
   si sol''16\p fad sol la sol8 si,\f-. do-. re-.

   %157
   mi4 sol16\p fad sol la \once\stemDown sol8 si,,-.\f do-. re-.
   sol,4 sol''16\p fad sol la \once\stemDown sol8 si,-.\f do-. re-.
   mi4 sol16\p fad sol la \once\stemDown sol8 si,,-.\f do-. re-.\mbreak%% Fine p 1

   %160
   sol,4 sol8. sol16 sol4 r

}

Ivlan = \relative do' {

   si4 re8. si16 sol4 r
   R1
   sol'4 re8. si16 sol4 r

   %4
   R1
   sol'8 sol sol sol sol sol sol sol
   fad fad fad fad \mbreak re re fad fad

   %7
   sol\p sol sol sol sol sol sol sol
   fad fad fad fad re re fad fad
   sol sol,16\f sol la la si si do do re re mi mi fad fad

   %10
   fad8 re re re re re re re
   re re re re re re re re
   dod dod dod dod la la la la

   %13
   re re la fad re4 r
   la'8 la la la la la la la
   r4 mi'8 re dod re mi fad

   %16
   sol4 sol sol sold\mbreak
   la8. [dod,16 dod8. dod16] dod4 r
   dod8 dod dod dod dod dod dod dod

   %19
   re fad fad fad fad fad re re
   dod dod dod dod dod dod dod dod
   re fad fad fad fad fad fad fad

   %22
   sol sol sol sol si si sol sol\mbreak %fine 4ta riga
   fad fad fad fad fad re dod dod
   re4 sol fad mi

   %25
   fad2 r
   si,8 si si si si si si si
   si si si si si si si si

   %28
   si si si si si si si si\mbreak
   do do do do do do do do
   dod dod dod dod dod dod dod dod

   %31
   dod dod dod dod dod dod dod dod
   dod dod dod dod dod dod dod dod
   re re re re re re re re

   %34
   fad4 r r8 fad la fad
   sol4 r\mbreak r8 sol si sol
   fad4 r r8 fad la fad

   %37
   sol4 r r8 sol si sol
   do mi re do si sol sol sol
   la do la la sol sol si si

   %40
   do4 do, si la\mbreak
   si r r8 sol'-.\f la-. si-.
   do4 r r8 si,-. do-. re-.

   %43
   sol,4 r r8 sol'-.\f la-. si-.
   do4 r r8 si,-. do-. re-.
   sol, sol' re si sol4 r
   R1*6

   %52
   sol'8\parenthesize\p sol sol sol sol sol sol sol
   fad fad fad fad re re re re
   sol sol,16\parenthesize \f  sol la la si si do do re re mi mi fad fad

   %55
   sol4 r r2
   R1*3
   r4 dod, mi dod\mbreak

   %60
   re r r2
   r4 dod mi dod
   re r r2

   %63
   sol4 sol mi mi
   fad re dod2
   re4 r fad r

   %66
   la, r dod r
   re r fad r\mbreak
   la, r dod r

   %69
   R1*9
   re'4\parenthesize \f  la8. fad16 re4 r
   R1

   %80
   re'4 la8. fad16 re4 r
   R1
   re8 re re re re re re re\mbreak

   %83
   dod dod dod dod la la dod dod
   re re re re re re re re
   dod dod dod dod la la dod dod

   %86
   re re16\parenthesize \f  re mi mi fad fad sol sol la la si si dod dod\mbreak
   re4\parenthesize \p  re, fad la
   R1

   %89
   r4 re, sol si
   R1
   r4 mi, sol si

   %92
   R1
   r4 red, fad si
   red, red fad red

   %95
   mi r r2
   R1*10\mbreak
   r4 mi8 fad sol4 red

   %107
   mi sol la fad
   mi8 mi16\parenthesize \f  mi fad fad sol sol la la si si do do red red
   mi4 r r2

   %110
   r8 mi,,16\parenthesize \f  mi fad fad sol sol\mbreak la la si si do do red red
   mi4-. do-. la-. si-.
   mi, r r2

   %113
   sol'4 re8. si16 sol4 r
   R1
   sol'4 re8. si16 sol4 r

   %116
   R1\mbreak
   sol'8 sol sol sol sol sol sol sol
   fad fad fad fad re re fad fad

   %119
   sol sol sol sol sol sol sol sol
   fad fad fad fad re re fad fad
   sol sol,16\parenthesize\f sol la la si si do do re re mi mi fad fad\mbreak

   %122
   sol4 r r2
   R1
   sol4 r r2

   %125
   sol4 r r2
   fad4 r r2
   fad4 r r2

   %128
   sol4 r si r
   re, r fad r
   sol r si r\mbreak

   %131
   re, r fad r
   R1*9
   si,8 si si si si si si si

   %142
   si si si si si si si si
   si si si si si si si si
   do do do do do do do do

   %145
   dod dod dod dod dod dod dod dod\mbreak
   dod dod dod dod dod dod dod dod
   dod dod dod dod dod dod dod dod

   %148
   re re re re re re re re
   fad4 r r8 fad la fad
   sol4 r r8 sol si sol\mbreak

   %151
   fad4 r r8 fad la fad
   sol4 r r8 sol si sol
   do mi\parenthesize \f  re do si sol sol sol

   %154
   la do la la sol sol si si\mbreak
   do4 do, si la
   sol r r8 sol'-.\f la-. si-.

   %157
   do4 r r8 si,-.\f do-. re-.
   sol,4 r r8 sol'-.\f la-. si-.
   do4 r r8 si,-.\f do-. re-.\mbreak

   %160
   sol, sol' re si sol4  r

}


Ibcn = \relative do {

   sol'4 re8. si16 sol4 r
   R1
   sol'4  re8. si16 sol4 r

   %4
   R1
   sol'8 sol sol sol sol sol sol sol
   re re re re re re re re

   %7
   sol, sol sol sol sol sol sol sol
   re re re re re re re re
   sol sol16 sol la la si si do do re re mi mi fad fad

   %10
   sol8 sol sol sol sol sol sol sol
   fad fad fad fad fad fad fad fad\mbreak
   mi mi mi mi mi mi mi mi

   %13
   re re re re re re re re
   la4 la' la, r
   r mi'8 re dod re mi fad

   %16
   sol4 sol sol sold
   la mi8. dod16 la8 si16 dod re mi fad sol
   la8 la la la la la la la

   %19
   re,2 re8 re re16 mi fad sol
   la8 la la la la, la la la
   re re re re re re re re

   %22
   sol sol sol sol sol sol sol sol
   fad4 re dod la
   re sol la la, %% fine 4ta

   %25
   re4 \tuplet 3/2 {re8(do re) mi[(re mi)] fad(mi fad)}
   sol8 sol sol sol sol sol sol sol
   sol8 sol sol sol sol sol sol sol

   %28
   sol8 sol sol sol sol sol sol sol
   do do, mi sol do si la sold
   la la la la la la la la

   %31
   la la la la la la la la
   la la la la la la la la
   re4 re, re8 mi16 fad sol la si do

   %34
   re4 r r8 re, fad re
   sol4 r r8 sol, si sol
   re'4 r r8 re fad re\mbreak

   %37
   sol4 r r8 sol, si sol
   do do' do do si si si si
   la la la la sol sol si si

   %40
   do4 la re re,
   sol r r8 sol-.\f la-. si-.
   do4 r r8 si,-. do-. re-.\mbreak

   %43
   sol,4 r r8 sol'-. la-. si-.
   do4 r r8 si,-. do-. re-.
   sol, sol' re si sol4 r

   %46
   R1*6
   sol'8\p sol sol sol sol sol sol sol
   re re re re re re re re

   %54
   sol, sol16\parenthesize \f  sol la la si si\mbreak do do re re mi mi fad fad
   sol2\p re4 si
   sol r r2

   %57
   re'4 re' la fad
   re r r2
   r4 la dod la

   %60
   re la fad re
   r la' dod la\mbreak
   re la fad re

   %63
   sol8 sol' sol sol sol sol sol sol
   fad4 re dod8 la si dod
   re4 r re r

   %66
   la r la r
   re r re r
   la r la r\mbreak

   %69
   la r r la
   re r r dod
   re2 la'4 la,

   %72
   re r r fad
   re sol la la,
   re r re r

   %75
   re r re r
   re, r sol r\mbreak
   r fad' sol la

   %78
   re\f la8. fad16 re4 r
   R1
   re'4 la8. fad16 re4 r

   %81
   R1
   re'8 re re re re re re re
   la la la la la la la la

   %84
   re, re re re re re re re
   la la la la la la la la\mbreak
   re,8 re'16\f re mi mi fad fad sol sol la la si si do do

   %87
   re4 r r2
   r4 re, fad la
   R1

   %90
   r4 re, sol si
   R1
   r4 mi, sol si

   %93
   R1\mbreak %% fine pagina
   r4 si, fad' red
   r mi sol mi

   %96
   r la do la
   r re, fad re
   r sol si sol

   %99
   r do, mi do
   r fad la fad
   r si, red si\mbreak

   %102
   r mi sol mi
   mi r mi r
   si r si r

   %105
   mi r r2
   r4 mi8 fad sol4 red
   mi sol la si

   %108
   mi,8 mi16\f mi fad fad sol sol\mbreak la la si si do do red red
   mi4 r r2
   r8 mi,,16\f mi fad fad sol sol la la si si do do red red

   %111
   mi4-. do-. la-. si-.
   mi,4. mi'8 re do si la\mbreak
   sol'4 re8. si16 sol4 r

   %114
   R1
   sol'4 re8. si16 sol4 r
   R1

   %117
   sol'8 sol sol sol sol sol sol sol
   re re re re re re re re
   sol, sol sol sol sol sol sol sol

   %120
   re re re re re re re re\mbreak
   sol sol16 sol la la si si do do re re mi mi fad fad
   sol4 r r2

   %123
   R1
   r8 sol,\p si re sol4 r
   r sol, si sol

   %126
   r8 re' fad la\mbreak re4 r
   r re, fad re
   sol r sol r

   %129
   re r re r
   sol r sol, r
   re' r re, r

   %132
   do' r r re
   sol r r fad\mbreak
   sol2 re4 re,

   %135
   sol r sol r
   sol do re re,
   sol4 r sol r

   %138
   sol r sol r
   sol r do r
   r si do re

   %141
   sol,8 sol'\f sol sol\mbreak sol sol sol sol
   sol sol sol sol sol sol sol sol
   sol sol sol sol sol sol sol sol

   %144
   do do, mi sol do si la sol
   la la la la la la la la
   la la la la la la la la

   %147
   la la la la la la la la\mbreak
   re4 re, re8 mi16 fad sol la si do
   re4 r r8 re, fad re

   %150
   sol4 r r8 sol, si sol
   re'4 r r8 re fad re
   sol4 r r8 sol, si sol\mbreak

   %153
   do do'\parenthesize \f do do si si si si
   la la la la sol sol si si
   do4 la re re,

   %156
   sol r r8 sol-.\parenthesize \f la-. si-.
   do4 r r8 si,-.\parenthesize \f do-. re-.\mbreak
   sol,4 r r8 sol'-.\parenthesize \f la-. si-.

   %159
   do4 r r8 si,-. do-. re-.
   sol, sol' re si sol4 r

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 4/4
   \key sol\major
   \tempo 2 = 65
   s1*160
   \bar "|."

}



IflI = {
   \global
   \notypeset
   <<\IflIn \forma>>

}

IflII = {
   \global
   <<\IflIIn \forma>>

}

IvlI = {
   \global
   <<\IvlIn \forma>>

}

IvlII = {
   \global
   <<\IvlIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIflIn = \relative do'' {

    sol'8\dolce\solo sol4 la8
    sol[do(si la)]
    sol \(mi32(fa) sol16\) \grace sol8 fa4\tr

    %4
    mi8[mi'(re do)]\mbreak
    si[(la sol fa)]
    mi16(re) do8 r4

    %7
    la'8 la4 sol16 \parentSlur (fa)
    mi32(sol fa la) sol8 r16 sol(fa mi)
    re32(fa mi sol) fa8 r16 fa(mi re)\mbreak

    %10
    do32(mi re fa) mi[(sol fa la)] sol16(fa) fa(mi)
    mi8\tr re r4
    r32 sol,(la si do[re mi fa)] sol(la sol fa mi[re do si)]

    %13
    la8 r r4\mbreak
    r32 si(do re mi[fa sol la)] si(do si la sol[fa mi re)]
    do8 r r4

    %16
    r32 re(mi fa sol[la si do)] re(mi re do si[la sol fa)]\mbreak
    mi8 sol4 sol8(
    la) la4 la8(

    %19
    si) si4 si8(
    do) do4 do8~
    do si4 la16(sol)

    %22
    sol8\tr fad r4
    r32 re(mi fad sol[la si do)] re(do si la sol[fad mi re)]
    mi8 r r4

    %25
    r32 si(do re mi[fad? sol la)] si(la sol fad! mi[re do si)]\mbreak
    do8 r r4
    r32 sol(la si do[re mi fad)] sol(fad sol la si[la si do)]

    %28
    re8 re4 do8
    \terzine\con \tuplet 3/2 { si16(la si) do[(si la)] } sol8 la\tr\mbreak
    sol4 r

    %31
    sol8 sol4 sib8
    sib16(la) la4 sol8
    fa fa4 la8

    %34
    la16(sol) sol4 fa8
    mi32(sol fa la) sol8 r16 sol(fa mi)\mbreak
    re32(fa mi sol) fa8 r16 fa(mi re)

    %37
    do32(mi re fa) mi[(sol fa la)] sol16(fa) fa(mi)
    mi8\tr re r4\mbreak
    r32 sol,(la si do [re mi fa)] sol(la sol fa mi[re do si)]\mbreak

    %40
    la8 r r4
    r32 si(do re mi[fa sol la)] si(do si la sol[fa mi re)]
    do8 r r4

    %43
    r32 re(mi fa sol[la si do)] re(mi re do si[la sol fa)]\mbreak
    mi8 do'4 do8~
    do mi,4 mi8

    %46
    mi4 re\tr
    do la'\parenthesize \f
    sol2

    %49
    fad\tr
    sol\fermopz

}

IIflIIn = \relative do'' {

    mi8\soli\dolce mi4 fa8
    mi[ la(sol fa)]
    mi \(do32(re) mi16\) \grace mi8 re4\tr

    %4
    do8[do' (si la)]
    sol[(fa mi re)]
    do16(si) do8 r4

    %7
    fa8 fa4 mi16(re)
    do32(mi re fa) mi8 r16 mi(re do)
    si32(re do mi) re8 r16 re(do si)\mbreak

    %10
    do(si32 re) do[(mi re fa)] mi16(re) re(do)
    do8\tr si r4
    R2

    %13
    r32 la(si do re[mi fa sol)] la(sib la sol fa[mi re do)]
    si?8 r r4\mbreak
    r32 do(re mi fa[sol la si)] do(si la sol fa[mi re do)]

    %16
    re8 r r4
    r r8 sol8~
    sol fad4 fa8~

    %19
    fa fa4 fa8
    mi mi4 mi8~\mbreak
    mi re4 \once\set suggestAccidentals = ##t dod?16(si)

    %22
    si8\tr la r4
    R2
    r32 do(re mi fad[sol la si)] do(si la sol fad[mi re do)]

    %25
    re8 r r4\mbreak
    r32 la(si do re [mi fad sol)] la(sol fad mi re[do si la)]
    si(sol fad sol la[si do re)] mi(re mi fad sol[fad sol la)]

    %28
    si8 si4 la8\mbreak
    sol \tuplet 3/2 { mi16 re do } si8 do\tr
    si4 r

    %31
    mi8 mi4 sol8
    sol16(fa) fa4 mi8
    re re4 fa8

    %34
    fa16(mi) mi4 re8\mbreak
    do32(mi re fa) mi8 r16 mi(re do)
    si32(re do mi) re8 r16 re(do si)

    %37
    do(si32 re) do[(mi re fa)] mi16(re) re(do)
    do8\tr si r4
    R2\mbreak

    %40
    r32 la(si do re[mi fa sol)] la(sib la sol fa[mi re do)]
    si?8 r r4
    r32 do(re mi fa[sol la si]) do[(re do si] la sol fa mi)

    %43
    re8 r r4
    r8 mi4 mi8
    mi do4 do8

    %46
    do4 si\tr
    do do\f
    si2

    %49
    la\tr
    si\fermopz

}

IIvlIn = \relative do'' {

    do4\p do,
    do r8 fa
    sol4 si,

    %4
    do r
    r r8 si
    do do' do,16 do re mi

    %7
    fa4 r
    do8[do' do,] r\mbreak
    sol[sol' sol,] r

    %10
    r do[si do]
    sol'16[sol, si re]  sol sol, sol' fa
    mi8[mi mi mi]

    %13
    fa[fa fa fa]
    sol[sol sol sol]
    la[la la la]

    %16
    si[si si si]\mbreak
    do4 do,
    do do

    %19
    re sol,
    do8 mi16 sol do8 r
    r16 mi, fad re sol8 dod,

    %22
    re re' la16\mf sol fad mi
    re8[si'\p si si]\mbreak
    do[la la la]

    %25
    si[sol sol sol]
    la[fad fad fad]
    sol4 r8 sol

    %28
    fad[re mi fad]
    sol[do re re,]
    sol sol16\mf la si fa! mi re\mbreak

    %31
    do4\p do
    r16 fa la, do fa8 r
    r re16 do si4

    %34
    r16 do mi sol do8 r
    do,[do' do,] r
    sol[sol' sol,] r\mbreak

    %37
    r do[si do]
    sol'16 sol, si re sol sol, sol' fa
    mi8\p[mi mi mi]

    %40
    fa[fa fa fa]
    sol[sol sol sol]
    la[la la la]

    %43
    si[si si si]\mbreak
    do[la sol fad]
    sol[do la fad]

    %46
    sol4 sol,
    do la''\parenthesize \f

    sol2

    %49
    fad\tr
    <sol si, re, sol,>\fermopz

}

IIvlIIn = \relative do'' {

    do4\p do,
    do r8 fa
    sol4 si,

    %4
    do r
    r r8 sol
    do do' do,16 do re mi

    %7
    fa4 r
    do8[do' do,] r\mbreak
    sol[sol' sol,] r

    %10
    r do[si do]
    sol'16[sol, si re]  sol sol, sol' fa
    mi8[mi mi mi]

    %13
    fa[fa fa fa]
    sol[sol sol sol]
    la[la la la]

    %16
    si[si si si]\mbreak
    do4 do,
    do do

    %19
    re sol,
    do8 mi16 sol do8 r
    r16 mi, fad re sol8 dod,

    %22
    re re' la16\mf sol fad mi
    re8[si'\p si si]\mbreak
    do[la la la]

    %25
    si[sol sol sol]
    la[fad fad fad]
    sol4 r8 sol

    %28
    fad[re mi fad]
    sol[do re re,]
    sol sol16\mf la si fa! mi re\mbreak

    %31
    do4\p do
    r16 fa la, do fa8 r
    r re16 do si4

    %34
    r16 do mi sol do8 r
    do,[do' do,] r
    sol[sol' sol,] r\mbreak

    %37
    r do[si do]
    sol'16 sol, si re sol sol, sol' fa
    mi8\p[mi mi mi]

    %40
    fa[fa fa fa]
    sol[sol sol sol]
    la[la la la]

    %43
    si[si si si]\mbreak
    do[la sol fad]
    sol[do la fad]

    %46
    sol4 sol,
    do do'\parenthesize \f
    si2

    %49
    la
    <si re, sol,>\fermopz

}

IIvlan = \relative do' {

    do'4\p do,
    do r8 fa
    sol4 si,

    %4
    do r
    r r8 si
    do do' do,16 do re mi

    %7
    fa4 r
    do8[do' do,] r\mbreak
    sol[sol' sol,] r

    %10
    r do[si do]
    sol'16[sol, si re]  sol sol, sol' fa
    mi8[mi mi mi]

    %13
    fa[fa fa fa]
    sol[sol sol sol]
    la[la la la]

    %16
    si[si si si]\mbreak
    do4 do,
    do do

    %19
    re sol,
    do8 mi16 sol do8 r
    r16 mi, fad re sol8 dod,

    %22
    re re' la16\mf sol fad mi
    re8[si'\p si si]\mbreak
    do[la la la]

    %25
    si[sol sol sol]
    la[fad fad fad]
    sol4 r8 sol

    %28
    fad[re mi fad]
    sol[do re re,]
    sol sol16\mf la si fa! mi re\mbreak

    %31
    do4\p do
    r16 fa, la do fa8 r
    r re16 do si4

    %34
    r16 do mi sol do8 r
    do,[do' do,] r
    sol[sol' sol,] r\mbreak

    %37
    r do[si do]
    sol'16 sol, si re sol sol, sol' fa
    mi8\p[mi mi mi]

    %40
    fa[fa fa fa]
    sol[sol sol sol]
    la[la la la]

    %43
    si[si si si]\mbreak
    do[la sol fad]
    sol[do la fad]

    %46
    sol4 sol,
    do do\parenthesize \f
    re2

    %49
    la
    si\fermopz

}


IIbcn = \relative do {

    R2*46
    r4 do\f
    re2
    re,
    sol\fermata



}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/4
    \key do\major
    \tempo 4 = 50
    s2*47
    \once \override Score.RehearsalMark.extra-offset = #'(+5 . -2)
    \mark\markup"Adagio"
    \tempo 4 = 40
    s2*3
    \bar"|."

}



IIflI = {
    \global
    %\notypeset
    <<\IIflIn \forma>>

}

IIflII = {
    \global
    <<\IIflIIn \forma>>

}

IIvlI = {
    \global
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIflIn = \relative do'' {

    sol'4 sol,
    r8 sol'16 fad sol la si do
    re4 re,

    %4
    sol2\tr
    la4 do,8.\tr(si32 do)
    re,8[fad la do]\mbreak

    %7
    si16 sol la si do re mi fad
    sol4 sol8.\tr(fad32 sol)
    la4 do,8.\tr(si32 do)

    %10
    re,8[fad la do]
    si16 sol la si do re mi fad
    sol si, do re mi fad sol la\mbreak

    %13
    si8 si4 si8~
    si si4 si8
    la la4 la8~

    %16
    la la4 la8
    sol sol4 sol8~
    sol sol4 sol8\mbreak

    %19
    fad fad4 fad8~
    fad fad4 fad8
    mi16 mi mi mi mi mi mi mi

    %22
    fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol
    la la la la la la la la

    %25
    si8[la sol fad]
    mi[fad mi re]
    dod la16 la la8 la

    %28
    la4 r
    la'\solo la
    \terzinequarto \tuplet 3/2 { la8 fad re la [re fad]

    %31
    la fad re la[re fad]
    la fad re fad[la re]}
    si4 si

    %34
    \tuplet 3/2 { si8 sol re si[re sol]
    si sol re si[re sol]
    si sol re sol[si re]}

    %37
    la4 la\mbreak
    \tuplet 3/2 { la8 fad re fad[la re] }
    si4 si

    %40
    \tuplet 3/2 { si8 sol re sol[si re] }
    la4 la
    \tuplet 3/2 { la8 fad re fad[la re] }

    %43
    sol,4 sol
    \tuplet 3/2 { sol8 mi dod la[dod mi] }\mbreak
    fad16 sol la8 la la

    %46
    la2
    sol4 sol
    \tuplet 3/2 { sol8 mi dod la[dod mi] }

    %49
    fad16 sol la8 la la
    la2
    si4 si~

    %52
    si dod
    re8 re4 re8~\mbreak
    re re4 re8~

    %55
    re[la\tr si sol]
    fad4 mi\tr
    re r

    %58
    la'8 la4 la8~
    la la4 la8
    sol sol4 sol8~

    %61
    sol sol4 sol8
    fad fad4 fad8~
    fad fad4 fad8

    %64
    mi mi4 mi8~
    mi mi4 mi8
    re16 la si dod re mi fad sol

    %67
    la re, mi fad sol la si dod\mbreak
    re re,\parenthesize \f mi fad sol la si dod
    re4-. si-.

    %70
    sol-. la-.
    re, r
    re re,

    %73 OOKK
    r8 re'16 dod re mi fad sol
    la4 la,
    re2\tr \mbreak

    %76
    mi4 sol8.\tr(fad32 sol)
    la,8[dod mi sol]
    fad16 re mi fad sol la si dod

    %79
    re4 re,8.\tr(dod32 re)
    mi4 sol8.\tr(fad32 sol)
    la,8[dod mi sol]

    %82
    fad8 re r4\mbreak
    r16\solo re mi fad sol la si dod
    re4 re,

    %85
    r8 re16 dod re mi fad sol
    la4 la,
    re'2

    %88
    \senza \tuplet 3/2 { si8 re si sol[si sol] \mbreak
    re sol si sol[si re]
    la re la fad[la fad]

    %91
    re fad la fad[la re]
    sol, si sol mi[sol mi]
    si mi sol mi[sol si]\mbreak

    %94
    fad si fad red[fad red]
    si red fad red[fad si]
    mi, sol mi do![mi do]

    %97
    sol do mi do[mi sol]
    re sol re si[re si]\mbreak
    sol si re si[re sol]}

    %100
    do,16 la si do re mi fad sol
    la sol fad mi re do si la
    si sol la si do re mi fad

    %103
    sol2~\mbreak
    sol8[fad mi re]
    do4 si

    %106
    si\tr la
    R2
    sol'4 sol,

    %109
    r8 sol'16 fad sol la si do
    re4 re,
    sol2\tr \mbreak

    %112
    la4 do,8.\tr(si32 do)
    re,8[fad la do]
    si16 sol la si do re mi fad

    %115
    sol4 sol8.\tr(fad32 sol)
    la4 do,8.\tr(si32 do)
    re,8[fad la do]

    %118
    si16 sol la si do re mi fad
    sol sol, fad sol la si do re
    mi8 mi'4 mi8~

    %121
    mi mi4 mi8
    re re4 re8~
    re re4 re8\mbreak

    %124
    do do4 do8~
    do do4 do8
    si si4 si8~

    %127
    si si4 si8
    la16 la la la la la la la
    si si si si si si si si

    %130
    do do do do do do do do
    re re re re re re re re
    mi8[re do si]

    %133
    la[si la sol]
    fad16 re mi fad sol la si do\mbreak
    \once\stemDown re sol,, la si do re mi fad

    %136
    sol sol, la si do re mi fad
    sol4-. mi-.
    do-. re-.

    %139
    sol, r

}

IIIflIIn = \relative do'' {

    sol'4 sol,
    r8 sol16 fad sol la si do
    re4 re,

    %4
    si'2\tr
    do4 la8.\tr(sol32 la)
    fad8[re fad la]\mbreak

    %7
    si16 sol la si do re mi fad
    sol4 si,8.\tr (la32 si)
    do4 la8.\tr(sol32 la)

    %10
    fad8[re fad la]
    sol4 r
    r16 sol la si do re mi fad\mbreak

    %13
    sol8 sol4 sol8~
    sol sol4 sol8\mbreak
    fad fad4 fad8~

    %16
    fad fad4 fad8
    mi mi4 mi8~
    mi mi4 mi8

    %19
    re re4 re8~
    re re4 re8\mbreak
    \repeat unfold 39 {re16} re(

    %26
    dod8)[re \parenthesize dod \parenthesize si]
    la la16 la la8 la\mbreak
    la4 r

    %29
    \terzinequarto\senza \tuplet 3/2 { fad'8\solo re la fad[la re]}
    fad4 r
    \tuplet 3/2 { fad8 re la fad[la re]

    %32
    fad re fad la[fad re]
    sol re si sol[si re]}
    sol4 r\mbreak

    %35
    \tuplet 3/2 { sol8 re si sol[si re]
    sol re sol si[sol re]
    fad re la fad[la re]}

    %38
    fad4 r
    \tuplet 3/2 { sol8 re si sol[si re] }
    sol4 r

    %41
    \tuplet 3/2 { fad8 re la fad[la re] }
    fad4 r
    \tuplet 3/2 { mi8 dod la mi[la dod]}

    %44
    mi4 r
    re16 mi fad8 fad fad
    fad2

    %47
    \tuplet 3/2 { mi8 dod la fad[la dod] }
    mi4 r
    re16 mi fad8 fad fad

    %50
    fad2
    sol4 sol~
    sol mi

    %53
    fad8 fad4 fad8~
    fad fad4 fad8~
    fad[fad\tr sol mi]

    %56
    re4 dod\tr
    re r
    fad8 fad4 fad8~

    %59
    fad fad4 fad8
    mi mi4 mi8~
    mi mi4 mi8

    %62
    re re4 re8~
    re re4 re8
    dod dod4 dod8~

    %65
    dod dod4 dod8\mbreak
    re16 la si dod re mi fad sol

    %67
    la re, mi fad sol la si dod\mbreak
    re re,\parenthesize \f mi fad sol la si dod
    re4-. si-.

    %70
    sol-. la-.
    re, r
    re re,

    %73 OOKK
    r8 re'16 dod re mi fad sol
    la4 la,
    re2\tr \mbreak

    %76
    dod4 mi8.\tr(re32 mi)
    dod8[la dod mi]
    re dod16 re mi fad sol mi\mbreak

    %79
    fad4 re8.\tr (dod32 re)
    mi4 mi8.\tr(re32 mi)
    dod8[la dod mi]

    %82
    re4 r
    r16 re\solo dod re mi fad sol mi
    fad4 re

    %85
    r8 re16 dod re mi fad sol
    la4 la,
    fad'2

    %88
    \tuplet 3/2 { sol8 si sol re[sol re]
    si re sol re[sol si]
    fad la fad re[fad re]

    %91
    la re fad re[fad la]
    mi sol mi si[mi si]
    sol si mi si[mi sol]

    %94
    red fad red si[red si]
    fad si red si[red si]
    do! mi do sol[do sol]

    %97
    mi sol do sol[do mi]
    si re si sol[si sol]
    re sol si sol[si re]}

    %100
    la16 fad sol la si do re mi
    fad mi re do si la sol fad\mbreak
    sol8 la16 si do si do la

    %103
    si2
    si8[la do si]
    la4 sol

    %106
    sol\tr fad
    R2
    sol'4 sol,

    %109
    r8 sol'16 fad sol la si do
    re4 re,\mbreak
    si2\tr

    %112
    do4 la8.\tr (sol32 la)
    fad8[re fad la]
    si16 sol la si do re mi fad

    %115
    sol4 si,8.\tr(la32 si)
    do4 la8.\tr (sol32 la)
    fad8[re fad la]

    %118
    si16 sol la si do re mi fad
    sol sol, fad sol la si do re
    do8 do'4 do8~

    %121
    do do4 do8
    si si4 si8~
    si si4 si8\mbreak

    %124
    la la4 la8~
    la la4 la8
    sol sol4 sol8 ~

    %127
    sol sol4 sol8
    \repeat unfold 40{sol16}
    fad8[sol fad mi]

    %134
    fad16 re mi fad sol la si do
    \once\stemDown re sol,, la si do re mi fad\mbreak
    sol sol,  la si do re mi fad

    %137
    sol4-. mi-.
    do-. re-.
    sol, r

}

IIIvlIn = \relative do'' {

    sol'4 sol,
    r8 sol16 fad sol la si do
    re4 re,

    %4
    sol'2\tr
    la4 do,8.\tr(si32 do)
    re,8[fad la do]\mbreak

    %7
    si16 sol la si do re mi fad
    sol4 sol8.\tr\parenthesize\p(fad32 sol)
    la4 do,8.\tr(si32 do)

    %10
    re,8[fad la do]
    si16\parenthesize\f sol la si do re mi fad
    sol si, do re mi fad sol la

    %13
    \repeat unfold 16 {si}
    \repeat unfold 16  {la}
    \repeat unfold 16 {sol}

    %19
    \repeat unfold 16 {fad}
    mi\p mi mi mi mi  mi  mi mi
    fad\cres  fad fad fad fad fad fad fad

    %23
    \repeat unfold 8 {sol}
    la\f la la la la la la la
    si si la la sol sol fad fad

    %26
    mi\parenthesize\ff mi fad fad mi mi re re\mbreak
    \once\set suggestAccidentals = ##t dod?8[la mi \once\set suggestAccidentals = ##t  dod?]
    la4 r

    %29
    r8 re'\p[\parentSlur (la fad)]
    re4 la'
    la2~

    %32
    la
    r8 sol[re si]
    sol4 si'

    %35
    si2~
    si\mbreak
    r8 re[la fad]

    %38
    re4 re'
    r8 sol,[re si]
    sol4 sol'

    %41
    r8 re'[la fad]
    re4 re'
    mi, mi

    %44
    mi mi
    fad r
    R2

    %47
    mi4 mi\mbreak
    mi mi
    fad r

    %50
    R2*7
    re'16 la si do re mi fad sol
    \repeat unfold 16 {la}

    %60
    \repeat unfold 16 {sol}
    \repeat unfold 16 {fad}\mbreak
    \repeat unfold 16 {mi}
    re16 la si dod re mi fad sol

    %67
    la re, mi fad sol la si dod\mbreak
    \once\stemDown re re,,\parenthesize \f mi fad sol la si dod
    re4-. si-.

    %70
    sol-. la-.
    re, r
    re' re,

    %73
    r8 re16 dod re mi fad sol
    la4 la,
    re'2\tr \mbreak

    %76
    mi4 sol,8.\tr(fad32 sol)
    la,8[dod mi sol]
    fad16 re mi fad sol la si dod

    %79
    re4 re8.\tr(dod32 re)
    mi4 sol,8.\tr(fad32 sol)
    la,8[dod mi sol]

    %82
    fad16 re\parenthesize\f mi fad sol la si dod
    re4 r
    re8\p[re re re]

    %85
    re[re re re]\mbreak
    dod[dod dod dod]
    si[si fad fad]

    %88
    sol4 r
    si si
    la r

    %91
    la la
    sol r
    sol sol

    %94
    fad r
    fad fad
    mi r\mbreak

    %97
    mi mi
    re! r
    re re

    %100
    do! r
    R2*7
    sol''4\f sol,

    %109
    r8 sol16 fad sol la si do
    re4 re,
    sol'2\tr \mbreak

    %112
    la4 do,8.\tr(si32 do)
    re,8[fad la do]
    si16 sol la si do re mi fad

    %115
    sol4 sol8.\tr\p(fad32 sol)
    la4 do,8.\tr(si32 do)
    re,8[fad la do]

    %118
    si16\f sol la si do re mi fad
    sol sol, fad sol la si do re
    \repeat unfold 16 {mi}

    %122
    \repeat unfold 16 {re}
    \repeat unfold 16 {do}
    \repeat unfold 16 {si}

    %128
    la\p la la la la la la la
    si\cres si si si si si si si
    do do do do do do do do

    %131
    re re re re re re re re
    mi mi re re do do si si
    la\parenthesize\f la si si la  la sol sol\mbreak

    %134
    fad16 re mi fad sol la si do
    re sol, la si do re mi fad
    \once\stemDown sol sol,, la si do re mi fad

    %137
    sol4-. mi-.
    do-. re-.
    sol, r

}

IIIvlIIn = \relative do'' {

    sol'4 sol,
    r8 sol16 fad sol la si do
    re4 re,

    %4
    si'2\tr
    do4 la8.\tr(sol32 la)
    fad8[re fad la]\mbreak

    %7
    sol8 la16 si do re mi fad
    sol4 si,8.\tr\p (la32 si)
    do4 la8.\tr(sol32 la)

    %10
    fad8[re fad la]
    sol\f la16 si do re mi fad\mbreak
    sol si, do re mi fad sol la

    %13
    si4 si,
    r8 si'16 la sol fad mi re
    do4 la'

    %16
    r8 la16 sol fad mi re do
    si4 sol'\mbreak
    r8 sol16 fad mi re \once\set suggestAccidentals = ##t dod? si

    %19
    la4 fad'
    R2
    re16\p re re re re re re re

    %22
    re\cres re re re re re re re
    re re re re re re re re
    re \f re re re re re re re

    %25
    re re re re re re re re
    \once\set suggestAccidentals = ##t dod?\ff dod re re dod dod si si
    la8[la mi dod]
    la4 r

    %29
    r8 re'\p[(la fad)]
    re4 fad
    fad2~

    %32
    fad
    r8 sol[re si]
    sol4 sol'

    %35
    sol2~
    sol\mbreak
    r8 re'[la fad]

    %38
    re4 fad
    r8 sol[re si]
    sol4 si

    %41
    r8 re'[la fad]
    re4 fad
    dod dod

    %44
    dod? dod
    re r\mbreak
    R2

    %47
    dod4 dod
    dod? dod
    re r

    %50
    R2*7
    re'16 la si do re mi fad sol
    la4 la,

    %59
    r8 la'16 sol fad mi re do
    si4 sol'\mbreak
    r8 sol16 fad mi re do si

    %62
    la4 fad'
    r8 fad16 mi re dod si la
    sol4 mi'

    %65
    r8 mi16 re dod si la sol
    fad la si dod re mi fad sol\mbreak
    la re, mi fad sol la si dod

    %68
    \once\stemDown re re,,\parenthesize \f mi fad sol la si dod
    re4-. si-.
    sol-. la-.

    %71
    re, r
    re' re,
    r8 re16 dod re mi fad sol

    %74
    la4 la,\mbreak
    fad'2\tr
    sol4 mi8.\tr(re32 mi)

    %77
    dod8[la dod mi]
    fad16 re mi fad sol la si dod
    re4 fad,8.\tr(mi32 fad)

    %80
    sol4 mi8.\tr(re32 mi)
    dod8[la dod mi]\mbreak
    fad16 re\f mi fad sol la si dod

    %83
    re4 r
    fad,8\p[fad fad fad]
    fad[fad fad fad]

    %86
    mi[mi mi mi]
    fad[fad fad fad]
    sol4 r\mbreak

    %89
    sol sol
    fad r
    fad fad

    %92
    mi r
    mi mi
    red r

    %95
    red red
    do! r
    do do

    %98
    si r
    si si
    la r\mbreak

    %101
    R2*7
    sol''4\f sol,
    r8 sol16 fad sol la si do

    %110
    re4 re,
    si'2\tr
    do4 la8.\tr(sol32 la)

    %113
    fad8[re fad la]
    si16 sol la si do re mi fad\mbreak
    sol4 si,8.\tr\p(la32 si)

    %116
    do4 la8.\tr(sol32 la)
    fad8[re fad la]
    si16\f sol la si do re mi fad

    %119
    sol sol, fad sol la si do re
    mi4 do,\mbreak
    r8 mi'16 re do si la sol

    %122
    fad4 re'
    r8 re16 do si la sol fad
    mi4 do'

    %125
    r8 do16 si la sol fad mi
    re4 si'
    R2\mbreak

    %128
    sol16\p sol sol sol sol sol sol sol
    sol\cres sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %131
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    fad\f fad sol sol fad fad mi mi\mbreak

    %134
    fad re mi fad sol la si do
    re sol, la si do re mi fad
    \once\stemDown sol sol,, la si do re mi fad

    %137
    sol4-. mi-.
    do-. re-.
    sol, r

}

IIIvlan = \relative do' {

    si8[si si si]
    si[si si si]
    la[la la la]

    %4
    sol[si si si]
    do[fad fad fad]
    fad[fad fad fad]\mbreak

    %7
    sol[sol sol sol]
    si,[si sol sol]
    do[fad fad fad]

    %10
    fad[fad fad fad]
    sol4 r
    r16 sol, la si do re mi fad

    %13
    sol8[re re re]
    re[re re re]\mbreak
    re[re re re]

    %16
    re[re re re]
    dod[dod dod dod]
    dod[dod dod dod]

    %19
    re[re re re]
    re[re re re]
    sol16 sol sol sol sol sol sol sol

    %22
    la la la la la la la la
    si si si si si si si si
    fad fad fad fad fad fad fad fad\mbreak

    %25
    sol sol sol sol sol sol sol sol
    sold sold sold sold sold sold sold sold
    la8[la mi dod]

    %28
    la4 r
    R2*14
    r8 sol'[mi dod]

    %44
    la4 r
    r fad'
    la fad\mbreak

    %47
    r8 sol[mi dod]
    la4 r
    r fad'

    %50
    la fad
    sol r
    R2*6

    %58
    r8 fad[re la]
    fad[la re fad]
    r mi[dod la]\mbreak

    %61
    mi[la dod mi]
    r re[la fad]
    re[fad la re]

    %64
    r dod[la fad]
    dod[mi la dod]
    re4 r

    %67
    R2
    r16 re mi fad sol la si do
    re4-. si-.

    %70
    sol-. la-.
    re, r
    fad8[fad fad fad]

    %73
    fad[fad fad fad]
    mi[mi mi mi]
    re[fad fad fad]

    %76
    sol[dod dod dod]
    dod[dod dod dod]
    re[fad, fad fad]

    %79
    fad[fad re re]
    dod[dod dod dod]
    dod[dod dod dod]\mbreak

    %82
    re mi16 fad sol la si dod
    re4 r
    R2*16

    %100
    do,8[mi mi mi]
    mi[ mi mi mi]
    re[re re re]

    %103
    do[mi re do]\mbreak
    si4 r
    r sol

    %106
    re' r
    R2
    si8[si si si]

    %109
    si[si si si]
    la[la la la]
    sol[si si si]

    %112
    do[fad fad fad]\mbreak
    fad[fad fad fad]
    sol[si, si si]

    %115
    si[si si si]
    do[fad fad fad]
    fad[fad fad fad]

    %118
    sol4 r
    sol fad16 sol la si\mbreak
    do8[sol sol sol]

    %121
    sol[sol sol sol]
    sol[sol sol sol]
    sol[sol sol sol]

    %124
    fad[fad fad fad]
    fad[fad fad fad]
    sol[sol sol sol]

    %127
    sol[sol sol sol]\mbreak
    do,16 do do do do do do do
    re re re re re re re re

    %130
    mi mi mi mi mi mi  mi mi
    si si si si si si si si
    do do do do do do do do

    %133
    do do do do do do do do
    re4 r
    R2\mbreak

    %136
    r16 sol, la si do re mi fad
    sol4-. mi-.
    do-. re-.

    %139
    sol, r

}


IIIbcn = \relative do {

    sol'8[sol sol sol]
    sol[sol sol sol]
    fad[fad fad fad]

    %4
    mi[mi si si]
    do[do la la]\mbreak
    re[re re, re]

    %7
    sol[sol' sol sol]
    mi[mi si si]
    do[do la la]

    %10
    re[re re, re]
    sol4 r\mbreak
    r16 sol la si do re mi fad

    %13
    sol8[sol sol sol]
    sol[sol sol sol]
    fad[fad fad fad]

    %16
    fad[fad fad fad]
    mi[mi mi mi]
    la,[la la la]

    %19
    re[re re re]
    re[re re re]\mbreak
    sol[sol sol sol]

    %22
    la[la la la]
    si[si si si]
    fad[fad fad fad]

    %25
    sol[sol sol sol]
    sold[sold sold sold]
    la[la mi dod]

    %28
    la si16 dod re mi fad sol\mbreak
    la8[re la fad]
    re4 r

    %31
    R2*2
    r8 sol\p[re si]
    sol4 r

    %35
    R2*2
    r8 re''\p[la fad]
    re4 r

    %39
    r8 sol[re si]\mbreak
    sol4 r
    r8 re'[la fad]

    %42
    re4 r
    r8 sol'[mi dod]
    la4 r

    %45
    r re
    fad re
    r8 sol[mi dod]

    %48
    la4 r
    r re\mbreak
    fad re

    %51
    sol8[sol sol sol]
    mi[mi sol sol]
    fad[re mi fad]

    %54
    sol[la si dod]
    re4-. si-.
    la-. la,-.

    %57
    re r\mbreak
    fad8[fad fad fad]
    fad[fad fad fad]

    %60
    mi[mi mi mi]
    mi[mi mi mi]
    re[re re re]

    %63
    re[re re re]
    la[la la la]
    la[la la la]

    %66
    re4 r\mbreak
    R2
    r16 re\f mi fad sol la si dod

    %69
    re4-. si-.
    sol-. la-.
    re, r

    %72 OOKK
    re8[re re re]
    re[re re re]
    do[do do do]

    %75
    si[si fad fad]
    sol[sol mi mi]
    la[la la la]

    %78
    re[re re re]\mbreak
    fad[fad fad fad]
    sol[sol mi mi]

    %81
    la[la la, la]
    re mi16 fad sol la si dod
    re4 r

    %84
    R2*16\mbreak
    do,8[do do do]
    do[do do do]

    %102
    si[si si si]
    si[mi re do]
    si4 r

    %105
    r sol
    re' re8 mi\mbreak
    re[do si la]

    %108
    sol[sol' sol sol]
    sol[sol sol sol]
    fad[fad fad fad]

    %111
    mi[mi si si]
    do[do la la]
    re[re re, re]\mbreak

    %114
    sol[sol' sol sol ]
    si,[si si si]
    do[do la la]

    %117
    re[re re, re]
    sol4 r
    sol' fad16 sol la si\mbreak

    %120
    do8[do do do]
    do[do do do]
    si[si si si]

    %123
    si[si si si]
    la[la la la]
    la[la la la]

    %126
    sol[sol sol sol]
    sol[sol sol sol]\mbreak
    do,[do do do]

    %129
    re[re re re]
    mi[mi mi mi]
    si[si si si]

    %132
    do[do do do]
    dod[dod dod dod]
    re4 r

    %135
    R2\mbreak
    r16 sol,\f la si do re mi fad
    sol4-. mi-.

    %138
    do-. re-.
    sol, r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/4
    \key sol\major
    \tempo 2 = 65
    s2*71
    \bar":..:"\break
    s2*68
    \bar":|."

}



IIIflI = {
    \global
    %\notypeset
    <<\IIIflIn \forma>>

}

IIIflII = {
    \global
    <<\IIIflIIn \forma>>

}

IIIvlI = {
    \global
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

   systems-per-page = #3
   print-first-page-number = ##t
   first-page-number = #2

}

\header {
   title = \markup\smaller {Sestetto in Sol maggiore [GraunWV Bv:XIV:18]}
   composer = \markup \center-column{"C. H. Graun (1704-1759)"}

}

\markup \huge {[1.] Allegro }

\score {

   \new ChoirStaff <<

      \new Staff  = "main" <<
         \set Staff.midiInstrument = #"flute"
         \set Staff.instrumentName = \markup \center-column {"Flauto""traverso I"}
         \set Staff.shortInstrumentName = "fl1"
         \IflI
      >>

      \new Staff   <<
         \set Staff.midiInstrument = #"flute"
         \set Staff.instrumentName = \markup \center-column {"Flauto""traverso II"}
         \set Staff.shortInstrumentName = "fl2"
         \IflII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"violin"
         \set Staff.instrumentName = \markup  {"Violino I"}
         \set Staff.shortInstrumentName = "vl1"
         \IvlI
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"violin"
         \set Staff.instrumentName = \markup  {"Violino II"}
         \set Staff.shortInstrumentName = "vl2"
         \IvlII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"viola"
         \set Staff.instrumentName = \markup  {"Viola"}
         \set Staff.shortInstrumentName = "vla"
         \Ivla
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"cello"
         \set Staff.instrumentName = \markup \center-column{"Basso"}
         \set Staff.shortInstrumentName = "bc"
         \Ibc
      >>
   >>

   \layout {

      indent = 1.5\cm

      \context	{
         \Score
         \override RehearsalMark.break-align-symbols = #'(left-edge)
         \override StaffGrouper.staff-staff-spacing.padding = #1.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
         \override BarLine #'hair-thickness = #1.2
         %\override SpacingSpanner.uniform-stretching = ##f
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

\markup \huge {[2.] Andante }

\score {

   \new ChoirStaff <<

      \new Staff  = "main" <<
         \set Staff.midiInstrument = #"flute"
         \set Staff.instrumentName = \markup \center-column {"Flauto""traverso I"}
         \IIflI
         \set Staff.shortInstrumentName = "fl1"
      >>

      \new Staff   <<
         \set Staff.midiInstrument = #"flute"
         \set Staff.instrumentName = \markup \center-column {"Flauto""traverso II"}
         \set Staff.shortInstrumentName = "fl2"
         \IIflII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"violin"
         \set Staff.instrumentName = \markup  {"Violino I"}
         \set Staff.shortInstrumentName = "vl1"
         \IIvlI
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"violin"
         \set Staff.instrumentName = \markup  {"Violino II"}
         \set Staff.shortInstrumentName = "vl2"
         \IIvlII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"viola"
         \set Staff.instrumentName = \markup  {"Viola"}
         \set Staff.shortInstrumentName = "vla"
         \IIvla
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"cello"
         \set Staff.instrumentName = \markup \center-column{"Basso"}
         \set Staff.shortInstrumentName = "bc"
         \IIbc
      >>
   >>

   \layout {

      indent = 1.5\cm

      \context	{
         \Score
         \override RehearsalMark.break-align-symbols = #'(left-edge)
         \override StaffGrouper.staff-staff-spacing.padding = #1.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
         \override BarLine #'hair-thickness = #1.2
         %\override SpacingSpanner.uniform-stretching = ##f
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

\markup \huge {[3.] Presto }

\score {

   \new ChoirStaff <<

      \new Staff  = "main" <<
         \set Staff.midiInstrument = #"flute"
         \set Staff.instrumentName = \markup \center-column {"Flauto""traverso I"}
         \IIIflI
         \set Staff.shortInstrumentName = "fl1"
      >>

      \new Staff   <<
         \set Staff.midiInstrument = #"flute"
         \set Staff.instrumentName = \markup \center-column {"Flauto""traverso II"}
         \set Staff.shortInstrumentName = "fl2"
         \IIIflII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"violin"
         \set Staff.instrumentName = \markup  {"Violino I"}
         \set Staff.shortInstrumentName = "vl1"
         \IIIvlI
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"violin"
         \set Staff.instrumentName = \markup  {"Violino II"}
         \set Staff.shortInstrumentName = "vl2"
         \IIIvlII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"viola"
         \set Staff.instrumentName = \markup  {"Viola"}
         \set Staff.shortInstrumentName = "vla"
         \IIIvla
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"cello"
         \set Staff.instrumentName = \markup \center-column{"Basso"}
         \set Staff.shortInstrumentName = "bc"
         \IIIbc
      >>
   >>

   \layout {

      indent = 1.5\cm

      \context	{
         \Score
         \override RehearsalMark.break-align-symbols = #'(left-edge)
         \override StaffGrouper.staff-staff-spacing.padding = #1.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
         \override BarLine #'hair-thickness = #1.2
         %\override SpacingSpanner.uniform-stretching = ##f
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