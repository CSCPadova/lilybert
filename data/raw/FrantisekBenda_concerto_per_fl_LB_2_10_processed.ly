\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

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
mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

Ifln = \relative do'' {

    R1*15
    r2 r4 r8 re
    \tuplet 3/2 { sol16 fad mi } re4 do8 si16 sol' re4 do8

    %18
    si do16 la sol8 la\tr \mbreak si16 sol' re4 do8
    si do16 la sol8 la\tr sol4 r
    R1*2

    %22
    sol'4 si16. la32 si16. do32 re8 re, r16 re mi fad
    sol8.\tr fad32(sol) \tuplet 3/2 { la16(sol fad) mi[(re do)] } si8 la r la'\mbreak
    si16 sol si4 re16 si la fad la4 re16 la

    %25
    sol mi sol4 si16 sol fad la, si dod re mi fad sol
    la4 si8 re, \grace re dod4 r
    dod8 dod4 dod8 re32 la(si dod re mi fad sol)\mbreak la16 fad mi re

    %28
    dod8 dod4 dod8 re32 la(si dod re mi fad sol) la16 fad mi re
    \tuplet 3/2 {
        \stemDown si'16 \stemUp sol, si \stemNeutral re[si re] sol re sol si[la sol] \once\stemDown la fad, la re[si re] fad re fad la[sol fad]\mbreak
        \senza \once\stemDown sol mi, sol dod[la dod] mi dod mi sol[fad mi] \once\stemDown fad re, fad la[fad la] re la re fad[mi re]

        %31
        dod re mi re[mi fad] mi fad sol fad[sol la]
    } sol fad mi re dod si la sol\mbreak
    fad la re sol fad8 mi\tr re4 mi8.\tr fad32(sol)
    fad(mi re16) re-. re-. mi8.\tr fad32(sol) fad(mi re16 ) re-. re-.  \tuplet 3/2 { si' la sol fad[mi re] }

    %34
    \grace re8 dod8 re16 sol, \grace fad8 mi4\tr re r
    R1*12\mbreak
    r2 r4 r8 la''

    %48
    \tuplet 3/2 { re16 dod si } la4 sol8 fad16 re' la4 sol8
    fad sol16 mi re8 mi\tr fad16 re' la4 sol8
    fad sol16 mi re8 mi\tr re4 r

    %51
    R1\mbreak
    r2 sol4 si16. la32 si16. do32
    re8 re, r16 re mi fad sol8 la16 sol fad mi re do

    %54
    si8 la r4 sol32 si la si re [si la si] sol' si, la si re[si la si]\mbreak
    la do si do mi[do si do] sol' do, si do mi[do si do] la dod si dod mi[dod si dod] la' dod, si dod mi[dod si dod]
    la re dod re fad[re dod re] la' re, dod re fad[re dod re]\mbreak si red dod red fad [red dod red] si' red, dod red fad[red dod red]

    %57
    si mi red mi sol[mi red mi] si' mi, red mi sol[mi red mi] do'?16 si la sol fad mi re do'
    si la sol fad mi re do si'\mbreak la sol fad mi red do si la'
    sol8\tr fad r4 r r8 si,

    %60
    \grace si do!4. red8 \grace red mi4. fad8
    sol la16 sol fad8 mi red8. do32 si mi8 la,
    sol mi' fad,4\tr mi r\mbreak

    %63
    R1*2
    \con \tuplet 3/2 { si'16(sol' fad ) mi[(red mi)] si'(sol fad) mi[(red mi)] si16(sol' fad ) mi[(red mi)] si'(sol fad) mi[(red mi)]}
    si' la sold fa! mi re do si \tuplet 3/2 { \senza do(si la) } la8\noBeam r4

    %67
    \tuplet 3/2 { la16 (fad'? mi) re[(dod re)]\mbreak la'(fad mi) re[(dod re)]   la16 (fad' mi) re[(dod re)] la'(fad mi) re[(dod re)] }
    la'16 sol fad mi re do! si la si la sol8 r re'
    mi32do re mi fad sol la si do16 mi, re do re32 si do re mi fad sol la\mbreak si 16re, do si

    %70
    do32 la si do re mi fad sol la16 do, si la si sol si re sol8. fa16
    mi8. re16 do si la sol fad4 r
    R1*3

    %75
    r2 r4 re''16(si) la(sol)\mbreak  %%fine primo sistema secoda pagina
    fad(la) sol8 re'16(si) la(sol) fad(la) sol8 sol16(re) si(sol)
    mi' (re32 do) si8 la [sol] \grace la sol[fad] r4

    %78
    \con \tuplet 3/2 {
        fad16(la re) la[(re fad)] la(la, si) do[(si la)] \senza si(sol si) re[(si re)] sol(re do) si[(la sol)]
        fad16(la re) la[(re fad)] la(la, si) do[(si la)]  si(sol si) re[(si re)] sol(re do) si[(la sol)]
        mi'(do mi) sol[(mi sol)] do(si la) la[(fad mi)] re(si re) sol[(re sol)] si(la sol) fad[(mi re)]\mbreak

        %81
        do(la do) fad[(do fad)] la(sol fad) mi[(re do)] si(sol la) si[(do re)] do(la do) do[(re mi)]
        re(si do) re[(mi fa)] mi(re do) si[(la sol)]
    } \once \stemUp  fad8 do'' si la\mbreak
    si8 mi,16 la \grace sol8 fad4\tr sol la,8.\tr si32(do)

    %84
    si(la sol16) sol-. sol-. la8. si32(do) si(la sol16) sol-. sol-.  \tuplet 3/2 {
        si'(la sol) fad[(sol la)]
        sol(fad mi) re[(mi fa)] mi(re do) si[(la sol)]
    } fad fad'? sol la si8 do,
    si8.\tr(do16) \grace si8 la4\tr sol r

    %87
    R1*10

}

IvlIn = \relative do'' {

    sol4 si16. la32 si16. do32 re8 re, r16 re' mi fad
    sol8.\tr fad32(sol) la8 do, do si re16 (si) la (sol)
    fad16. \tr  (sol64 la) sol8 re'16 (si) la (sol) fad16. \tr (sol64 la) sol8 sol'16 (re) si(sol)\mbreak

    %4
    mi'8 re32(do si16) la8 sol \grace la sol fad re'16\p (si) la (sol)
    fad16.\tr (sol64 la) sol8 re'16(si) la(sol) fad16.\tr (sol64 la) sol8 sol'16(re) si(sol)
    mi'8 re32( do si16) la8 sol \grace la sol fad r32 re\f(mi fad sol la si do)\mbreak

    %7
    re16 re, re' re do re, do' do <si re, sol,>8 r r32 sol(la si do re mi fad)
    sol16 sol, sol' sol fa sol, fa' fa <mi sol, do,>8 r mi16 mi, re' re
    <do mi, la,>8 r do16 re, si' si la16. re32 fad,16. [la32] sol16. mi'32 mi,16. [sol32]\mbreak

    %10
    fad16 mi re8 la'8. si32(do) si(la sol16) sol-. sol-. la8.\tr si32(do)
    si(la sol16) sol-. sol-. mi' (do) sol' (mi) re8 sol, la[fad]
    sol4 la8.\p si32(do) si(la sol16) sol-. sol-. la8. si32(do)

    %13
    si(la sol16) sol-. sol-.\con \tuplet 3/2 { si'16\f (la sol) fad[(sol la)] sol (fad mi) re[(mi fa)] mi(re do) si[(la sol)] }
    fad8 do' si la si mi,16 la \grace sol8 fad4\tr
    sol16. sol,32 la16. si32 do16. re32 mi16. fad32 sol16. re32 mi16. fad32 sol16. la32 si16. do32

    %16
    \once\stemDown re8 si, do re sol,4 r
    r8 si'\p si la sol si si la
    sol do, re re sol, r r4

    %19
    r2 sol'16.\f sol,32 la16. si32 do16. re32 mi16. fad32
    sol4 si16. la32 si16. do32\mbreak re8 re, r16 re' mi fad
    sol8.\tr fad32(sol) la8 do, do si r4

    %22
    R1*2
    r8 si'\p si si r la la la
    r sol sol sol fad r r4

    %26
    r8 fad sol re\mbreak dod16. la,32 dod16. mi32 la8 r
    r2 r4 re,8 fad
    la16. la,32 la'16.  la32 sol16. la,32 sol'16. sol32 fad8 r r4

    %29
    r8 re' re r r re re r
    r dod dod r re r r4
    dod8 re mi fad sol r r4

    %32
    r2 r4 dod,8.\p re32(mi)
    re8 r dod8. re32(mi) re8 r r4
    r2 re4\f fad16. mi32 fad16. sol32

    %35
    la8 la, r16 la si dod\mbreak re8.\tr dod32(re) mi8 sol,
    sol fad la'16(fad) mi(re) dod16. (re64 mi) re8 la16(fad) mi (re)
    dod16.(re64 mi) re8 la''16(fad) mi(re) si'16. \parentSlur (la64 sol) fad8 mi re~

    %38
    re dod la'16\p(fad) mi(re) dod16.(re64 mi) re8\mbreak la16 (fad) mi(re)
    dod16.(re64 mi) re8 la''16(fad) mi(re) si'16.(la64 sol) fad8 mi  re
    re\tr dod r32 la\f(si dod re mi fad sol) la16 la, la' la sol la, sol' sol

    %41
    <fad la, re,>8 r r32 re(mi fad sol la si dod)\mbreak re16 re, re' re do! re, do' do
    <si re, sol, sol,>8 r si16 re, la' la \once\stemUp <sol si, mi,>8 r sol16 la, fad' fad
    mi16. la32 dod,16. mi32 re16. si'32 si,16. re32 dod16 (si) la8 mi'8.\tr fad32(sol)

    %44
    fad(mi re16) re-. re-. mi8.\tr fad32(sol)\mbreak fad(mi re16) re-. re-. si'16 sol re' si
    la8 re, mi dod re4 mi,8.\p\tr fad32(sol)
    fad(mi re16) re-. re-. mi8. fad32(sol) fad(mi re16) re-. re-. \senza \tuplet 3/2 { fad'\f (mi re) dod[(re mi)] }

    %47
    re16. la32 si16. sol32 \grace fad8 mi4\tr re r\mbreak %% fine pagina
    r8 fad'\p fad mi re fad fad mi
    re sol, la[la,] r2

    %50
    r re'4\f fad16. mi32 fad16. sol32
    la8 la, r16 la si dod re8.\tr dod32(re) mi8 sol,\mbreak
    fad32 (re mi fad sol la si dod) re16 re, re' do si8 r r4

    %53
    R1
    r2 r8 re\p re re
    r mi mi mi r mi mi mi

    %56
    r fad fad fad r fad fad fad\mbreak
    r sol sol sol r2
    R1

    %59
    r4 fad,16\parenthesize \p  do' si la sol8 fad r4
    R1*2
    r2 r32 mi\f(fad sol la si dod? red) mi16 mi, mi' re!

    %63
    do? do, do' si la la, la' sol\mbreak fad sol la si do8 mi,
    \once\stemUp red \once\stemDown fad' r la,sol mi' fad,4\tr
    mi8 si'\p si si r si si si

    %66
    r re re re \once\stemDown do32\f la,(si dod? re mi fad sold) la16 la, la' sol\mbreak %% fine r 4 quarto sistema
    fad8 la\p la la r la la la
    r do do do \once\stemDown si32\f sol,(la si do re mi fad sol16) re si sol

    %69
    do8 do' la\p la si si sol sol
    la la re, re sol r r4\mbreak
    r2 r32 re\f(mi fad sol la si do) re16 do si la

    %72
    sol4 si16. la32 si16. do32 re8 re, r16 re' mi fad
    sol8.\tr fad32(sol) la8 do, do si re16(si) la(sol)
    fad16.(sol64 la) sol8 re'16(si) la(sol)\mbreak fad16.(sol64 la) sol8 sol'16(re) si(sol)

    %75
    mi'8 re32(do si16) la8 sol sol fad r sol'\p
    la sol r sol la sol r sol,
    sol sol sol sol sol fad r4

    %78
    r8 fad' fad fad\mbreak sol r r4
    r8 fad fad fad sol r r4
    R1*2

    %82
    r2 r8 la sol fad
    sol sol fad fad sol4 fad,8. sol32(la)
    sol8 r fad8. sol32(la) sol8\noBeam r r4

    %85
    R1\mbreak
    r2\fermata sol32\f sol, \parentSlur (la si do re mi fad) sol re\parentSlur ( mi fad sol la si do)
    re16 re, re' re do re, do' do <re re, sol,>8 r r32 sol,(la si do re mi fad)

    %88
    sol16 sol, sol' sol fa sol, fa' fa  <mi sol, do,>8 r mi16 mi, re' re
    <do mi, la,>8 r do16 re, si' si la16. re32 fad,16. [la32] sol16. mi'32 mi,16. [sol32]\mbreak
    fad16. mi32 re8 la'8.\parenthesize \tr si32(do) si(la sol16) sol-. sol-. la8.\tr si32(do)

    %91
    si(la sol16) sol-. sol-. mi' do sol' mi re8 sol, la fad
    sol4 la8.\p si32(do) si(la sol16) sol-. sol-. la8. si32(do)
    si(la sol16) sol-. sol-.\con \tuplet 3/2 { si'16\f (la sol) fad[(sol la)] sol (fad mi) re[(mi fa)] mi (re do) si[(la sol)] }

    %94
    fad8 do' si la si mi,16 la \grace sol8 fad4\tr
    sol16. sol,32 la16. si32 do16. re32 mi16. fad32 sol16. re32 mi16. fad32 sol16. la32 si16. do32
    \once\stemDown re8 si, do re sol,4 r

}

IvlIIn = \relative do'' {

    sol4 si16. la32 si16. do32 re8 re, r16 re' mi fad
    sol8.\tr fad32(sol) la8 do, do si re16 (si) la (sol)
    fad16. \tr  (sol64 la) sol8 re'16 (si) la (sol) fad16. \tr (sol64 la) sol8 sol'16 (re) si(sol)\mbreak

    %4
    mi'16 (re32 do) si8 la8 sol \grace la sol fad re'16\p (si) la (sol)
    fad16.\tr (sol64 la) sol8 re'16(si) la(sol) fad16.\tr (sol64 la) sol8 sol'16(re) si(sol)
    mi'8 re32( do si16) la8 sol \grace la sol fad r32 re\f(mi fad sol la si do)\mbreak

    %7
    re16 re, re' re do re, do' do <si re, sol,>8 r r32 sol(la si do re mi fad)
    sol16 sol, sol' sol fa sol, fa' fa <mi sol, do,>8 r mi16 mi, re' re
    <do mi, la,>8 r do16 re, si' si la16. re32 fad,16. [la32] sol16. mi'32 mi,16. [sol32]\mbreak

    %10
    fad16 mi re8 la'8. si32(do) si(la sol16) sol-. sol-. la8.\tr si32(do)
    si(la sol16) sol-. sol-. mi' (do) sol' (mi) re8 sol, la[fad]
    sol4 la8.\p si32(do) si(la sol16) sol-. sol-. la8. si32(do)

    %13
    si(la sol16) sol-. sol-.\con \tuplet 3/2 { si'16\f (la sol) fad[(sol la)] sol (fad mi) re[(mi fa)] mi(re do) si[(la sol)] }
    fad8 do' si la si mi,16 la \grace sol8 fad4\tr
    sol16. sol,32 la16. si32 do16. re32 mi16. fad32 sol16. re32 mi16. fad32 sol16. la32 si16. do32

    %16
    \once\stemDown re8 si, do re sol,4 r
    r8 sol'\p sol fad sol sol sol fad
    sol do, re re sol,4 r

    %19
    r2 sol'16.\f sol,32 la16. si32 do16. re32 mi16. fad32
    sol4 si16. la32 si16. do32\mbreak re8 re, r16 re' mi fad
    sol8.\tr fad32(sol) la8 do, do si r4

    %22
    R1*2
    r8 re \p re re r fad fad fad
    r mi mi mi re r r4

    %26
    r8 re si si mi,16. la,32 dod16. mi32 la8 r
    r2 r4 re,8 fad
    la16. la,32 la'16.  la32 sol16. la,32 sol'16. sol32 fad8 r r4

    %29
    r8 sol sol r r fad fad r
    r mi mi r re r r4
    la'8 si dod re mi r r4

    %32
    R1*2
    r2 re4\f fad16. mi32 fad16. sol32

    %35
    la8 la, r16 la si dod\mbreak re8.\tr dod32(re) mi8 sol,
    sol fad la'16(fad) mi(re) dod16. (re64 mi) re8 la16(fad) mi (re)
    dod16.(re64 mi) re8 la''16(fad) mi(re) si'16. \parentSlur (la64 sol) fad8 mi re~

    %38
    re dod la'16\p(fad) mi(re) dod16.(re64 mi) re8\mbreak la16 (fad) mi(re)
    dod16.(re64 mi) re8 la''16(fad) mi(re) si'16.(la64 sol) fad8 mi  re
    re\tr dod r32 la\f(si dod re mi fad sol) la16 la, la' la sol la, sol' sol

    %41
    <fad la, re,>8 r r32 re(mi fad sol la si dod)\mbreak re16 re, re' re do! re, do' do
    <si re, sol, sol,>8 r si16 re, la' la \once\stemUp <sol si, mi,>8 r sol16 la, fad' fad
    mi16. la32 dod,16. mi32 re16. si'32 si,16. re32 dod16 (si) la8 mi'8.\tr fad32(sol)

    %44
    fad(mi re16) re-. re-. mi8.\tr fad32(sol)\mbreak fad(mi re16) re-. re-. si'16 sol re' si
    la8 re, mi dod re4 mi,8.\p\tr fad32(sol)
    fad(mi re16) re-. re-. mi8. fad32(sol) fad(mi re16) re-. re-. \senza \tuplet 3/2 { fad'\f (mi re) dod[(re mi)] }

    %47
    re16. la32 si16. sol32 \grace fad8 mi4\tr re r
    r8 re'\p re dod re re re dod
    re sol, la[la,] r2

    %50
    r re'4\f fad16. mi32 fad16. sol32
    la8 la, r16 la si dod re8.\tr dod32(re) mi8 sol,\mbreak
    fad32 (re mi fad sol la si dod) re16 re, re' do si8 r r4

    %53
    R1
    r2 r8 si\p si si
    r sol sol sol r dod dod dod\mbreak

    %56
    r la la la r red red red
    r si si si r2
    R1

    %59
    r4 red,16\p la' sol fad mi8 red r4
    R1*2
    r2 r32 mi\f(fad sol la si dod? red) mi16 mi, mi' re!

    %63
    do? do, do' si la la, la' sol\mbreak fad sol la si do8 mi,
    \once\stemUp red \once\stemDown fad' r la,sol mi' fad,4\tr
    mi8 sol\p sol sol r sol sol sol

    %66
    r si si si\mbreak la32\f  la, (si dod? re mi fad sold) la16 la, la' sol
    fad8 fad\p fad fad r fad fad fad
    r la la la sol32\f sol,(la si do re mi fad sol16) re si sol

    %69
    do8 do' la\p la si si sol sol
    la la re, re sol r r4\mbreak
    r2 r32 re\f(mi fad sol la si do) re16 do si la

    %72
    sol4 si16. la32 si16. do32 re8 re, r16 re' mi fad
    sol8.\tr fad32(sol) la8 do, do si re16(si) la(sol)
    fad16.(sol64 la) sol8 re'16(si) la(sol)\mbreak fad16.(sol64 la) sol8 sol'16(re) si(sol)

    %75
    mi'16 (re32 do) si8 la8 sol sol fad r re'\p
    re re r re mi re r re,
    mi mi mi mi la, la r4

    %78
    r8 la' la la si r r4\mbreak
    r8 la la la si r r4
    R1*2

    %82
    r2 r8 fad' sol la
    re,8 mi16 do si8 la si4 r
    R1*2

    %86
    r2\fermata sol32\f sol, \parentSlur (la si do re mi fad) sol re \parentSlur (mi fad sol la si do)
    re16 re, re' re do re, do' do <re re, sol,>8 r r32 sol,(la si do re mi fad)

    %88
    sol16 sol, sol' sol fa sol, fa' fa  <mi sol, do,>8 r mi16 mi, re' re
    <do mi, la,>8 r do16 re, si' si la16. re32 fad,16. [la32] sol16. mi'32 mi,16. [sol32]\mbreak
    fad16. mi32 re8 la'8.\parenthesize \tr si32(do) si(la sol16) sol-. sol-. la8.\tr si32(do)

    %91
    si(la sol16) sol-. sol-. mi' do sol' mi re8 sol, la fad
    sol4 la8.\p si32(do) si(la sol16) sol-. sol-. la8. si32(do)
    si(la sol16) sol-. sol-.\con \tuplet 3/2 { si'16\f (la sol) fad[(sol la)] sol (fad mi) re[(mi fa)] mi (re do) si[(la sol)] }

    %94
    fad8 do' si la si mi,16 la \grace sol8 fad4\tr
    sol16. sol,32 la16. si32 do16. re32 mi16. fad32 sol16. re32 mi16. fad32 sol16. la32 si16. do32
    \once\stemDown re8 si, do re sol,4 r

}

Ivlan = \relative do' {

    si8 si si si la la' la la
    sol sol fad fad re re r re
    mi re r re mi re r re

    %4
    mi mi mi mi la, la r re\p\mbreak
    mi re r re mi re r re
    mi mi mi mi la, la r4

    %7
    r8 fad'\f sol la re,32 sol, (la si do re mi fad) sol8 sol,
    r si' do re sol,32 do, (re mi fad sol la) si do8 si\mbreak
    la32 la, (si dod re mi fad sold) la8 re, re re dod dod

    %10
    la la fad'8. sol32( la) sol8 re fad8.\parenthesize \tr sol32(la)
    sol8 re sol sol sol re mi re
    re4 fad8.\p sol32(la) sol8 re fad8. sol32(la)\mbreak

    %13
    sol8 re sol\f do si sol mi mi
    la, fad' sol(la) re, mi16 do \grace si8 la4\parenthesize \tr
    si16. sol32 la16. si32 do16. re32 mi16. fad32 sol16. re32 mi16. fad32 sol16. la32 si16. do32

    %16
    \stemDown re8 \stemUp si, do re \stemNeutral sol,4 r\mbreak
    r8 sol\p si re sol sol, si re
    sol do, re re, r2

    %19
    r r16. sol32\f la16.  si32 do16. re32 mi16. fad32
    sol8 si\p si si la la la la
    sol sol la fad re re r4

    %22
    R1*2\mbreak
    r8 sol\p sol sol r re re re
    r la' la la la r r4

    %26
    r8 re, sol sold la16. la,32 dod16. mi32 la8 r
    r2 r4 re,8 fad
    la16. la,32 la'16. la32 sol16. la,32 sol'16. sol32\mbreak fad8 r r4

    %29
    r8 sol sol4 r8 re re4
    r8 la la4 re r
    R1*3

    %34
    r2 fad8 fad\f fad fad
    mi mi mi mi re re dod dod
    la la r la' si la r la,\mbreak

    %37
    si la r la' sol si si si
    mi,4 r8 la\p si la r la,
    si la r la'\f sol si si si

    %40
    mi, mi r4 r8 dod' re mi
    la,32 re, (mi fad sol la si dod) re8 r\mbreak r fad, sol la
    re,32 sol, (la si do? re mi fad) sol8 fad mi32 mi, (fad sol la si dod? red) mi8 re

    %43
    la'8 la sold sold mi mi dod'8.\parenthesize \tr re32(mi)\mbreak
    la,8 la dod8.\parenthesize \tr re32(mi) la,8 la re re\mbreak
    re la si la la4 dod,8.\p re32(mi)

    %46
    la,8 la dod8. re32(mi) la,8 la la'\f sol
    fad re re dod re la re, r
    r re'\p fad la re re, fad la

    %49
    re sol,  la la, r2
    r fad'8 fad\f fad fad
    mi mi mi mi re re dod dod

    %52
    la32 (re mi fad sol la si dod) re16 re, re' do si8 r r4
    R1
    r2 r8 sol\p sol sol

    %55
    r do, do do r la' la la\mbreak
    r re, re re r si' si si
    r mi, mi mi r2

    %58
    R1*4
    r2 r32 mi\f(fad sol la si dod red) mi16 mi, mi' re!
    do! do, do' si la la, la' sol\mbreak fad sol la si do8 mi,

    %64
    red red mi fad si, si do si
    si mi\p mi mi r mi mi mi
    r sold sold sold la32 la,\f(si dod re mi fad sold) la16 la, la' sol

    %67
    fad8 re\p re re r re re re
    r fad fad fad re32\f sol,(la si do re mi fad) sol16 re si sol\mbreak
    do8 do' la\p la si si sol sol

    %70
    la la re, re re r r4
    r2 r32 re\f(mi fad sol la si do) re16 do si la
    sol8 si, si si la la' la la

    %73
    sol sol fad fad\mbreak re re r re
    mi re r re mi re r re
    do mi mi mi sol, sol r si\p

    %76
    do si r si do si r si
    do do dod dod re4 r
    r8 re re re\mbreak sol, r r4

    %79
    R1*7
    r2\fermata sol'32\f sol,(la si do re mi fad) sol re(mi fad sol la si do)
    re8 fad, sol la re,32 sol, (la si do re  mi fad) sol8 sol,

    %88
    r si' do re\mbreak sol,32 do,(re mi fa? sol la si) do8 si
    la32 la,(si do re mi fad sold) la8 re, re re dod dod
    la la fad'8.\tr sol32(la) sol8 re  fad8.\parenthesize \tr sol32(la)

    %91
    sol8 re sol sol sol re mi re
    re4  fad8.\tr \p sol32(la) sol8 re  fad8.\parenthesize \tr sol32(la)
    sol8 re sol \f do si sol mi mi

    %94
    la, fad'(sol la) re, mi16 do \grace si8 la4\parenthesize \tr
    si16. sol32 la16. si32 do16. re32 mi16. fad32 sol16. re32 mi16. fad32 sol16. la32 si16. do32
    \once\stemDown re8 si, do re sol,4 r

}

Ibcn = \relative do {

    sol'8 sol sol sol fad fad fad fad
    mi mi fad re sol sol, r si
    do si r si do si r si

    %4
    do do dod dod re re, r si'\p \mbreak
    do si r si do si r si
    do do dod dod re re, re' r

    %7
    r re\f mi fad sol32 sol, \parentSlur (la si do re mi fad) sol8 sol,
    r sol' la si do32 do, \parentSlur (re mi fad sol la si) do8 sold\mbreak
    la32 la, \parentSlur (si dod? re mi fad sold?) la8 sol fad re mi la,

    %10
    re re, r re' sol sol, r re'
    sol sol, do[do'] si si, do re
    sol sol, r re'\p sol sol, r re'\mbreak

    %13
    sol sol, sol'\f la si si, do dod
    re re mi fad sol do,? re[re,]
    sol16. sol32 la16. si32 do16. re32 mi16. fad32 sol16. re32 mi16. fad32 sol16. la32 si16. do32

    %16
    \stemDown re8 \stemUp si, do re \stemNeutral sol,4 r
    R1
    r2 r8 sol\p si re

    %19
    sol do, re[re,] sol16. sol32\f la16.  si32 do16. re32 mi16. fad32
    sol8 sol sol sol fad fad fad fad
    mi mi fad re sol sol, si re

    %22
    sol\p sol sol sol fad fad fad fad\mbreak
    mi mi fad re sol re16 mi fad8 fad
    sol4 r8 sol re4 r8 re

    %25
    la'4 r8 la, re4 r
    r2 r4 r16. la32\f dod16. mi32
    la16. la,32 la'16. la32 sol16. la,32 sol'16. sol32 fad8 r r4\mbreak

    %28
    r2 r4 re8\p fad
    sol4 r8 sol re'4 r8 re
    la4 r8 la, re4 r8 re

    %31
    la'4 la la8 la, la dod
    re fad16 sol la8 la, re re, r la''
    re re, r la'\mbreak re re, sol4~

    %34
    sol8 fad16 sol la8 la, re, re'\f re re
    dod dod dod dod si si dod la
    re re, r8 fad' sol fad r fad,

    %37
    sol fad r fad' sol sol sold sold
    la la, r fad'\p\mbreak sol fad r fad,
    sol fad r fad'\f sol sol sold sold

    %40
    la la, la' r r la si dod
    re32 re, \parentSlur (mi fad sol la si dod?) re8 re, r re mi fad
    sol32 sol, \parentSlur (la si do? re mi fad )sol8 red\mbreak mi32 mi, \parentSlur (fad sol la si dod red) mi8 re

    %43
    dod la' si mi, la la, r la'
    re re, r la' re re, sol[sol,]
    fad fad' sol la re, re, r la'\p

    %46
    re re, r la'\mbreak re\f re, re' mi
    fad sol la la, re la re, r
    R1

    %49
    r2 r8 re'\p fad la
    re sol, la la, re re\f re re
    dod dod dod dod si4 dod8 la

    %52
    re16 mi32(fad sol la si dod?)\mbreak re16 re, re' do si8 sol \p sol sol
    fad fad fad fad mi mi fad fad
    sol re re16 do si la sol8 r sol r

    %55
    do4 r la8 r la r
    re4 r si8 r si r\mbreak
    mi r r4 la8 do re re,

    %58
    sol si do mi, fad la si red,
    mi16 si dod fad si8 si, mi16 si\pp red fad si8 sol
    la\p sol la fad sol fad sol red

    %61
    mi4 la si8 la sol fad\mbreak
    mi sol la si mi,16 fad32\f(sol la si dod? red) mi16 mi, mi' re
    do? do, do' si la la, la' sol fad sol la si do8 mi,

    %64
    red si do red mi sol, la si
    mi,4 r r2\mbreak
    r8 mi'\p mi mi la32\f la,(si dod? re mi fad sold) la16 la, la' sol

    %67
    fad8\p r r4 re8 r r4
    r8 re re re sol32\f sol,(la si do re mi fad) sol16 re si sol
    do8\p r r4 r2\mbreak

    %70
    r4 r8 fad sol la si sol
    r do,16. re32 mi8 do re16 mi32\f fad sol la si do re16 do si la
    sol8 sol sol sol fad fad fad fad

    %73
    mi mi fad re sol sol, r si\mbreak
    do si r si do si r si
    do do dod dod re re, r4

    %76
    R1
    r2 r8 re\p fad la
    re r r4 r2

    %79
    r8 re re re sol, r r si\mbreak
    do do' la la si si sol sol
    la la re, re sol sol, la la'

    %82
    si si, do dod re4 r8 re
    sol do, re [re,] sol' sol, r re'
    sol sol, r re' sol sol, sol' la\mbreak

    %85
    si si, do dod re re mi fad
    sol do, re4\fermata sol, r
    r8 re'\f mi fad sol32 sol,(la si do re mi fad) sol8 sol,

    %88
    r sol' la si do32 do,(re mi fa sol la si)\mbreak do8 sold
    la32 la, \parentSlur (si do re mi fad sold) la8 sol fad[re] mi la,
    re re, r re' sol sol, r re'

    %91
    sol sol, do do' si si, do re\mbreak
    sol sol, r re' \p sol sol, r re'
    sol sol, sol'\f[la] si si, do dod

    %94
    re re mi fad sol do, re[re,]
    sol16. sol32 la16. si32 do16. re32 mi16. fad32 sol16. re32 mi16. fad32 sol16. la32 si16. do32
    re8 si, do re sol,4 r

}

Ibfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {
    \key sol\major
    \time 4/4
    \tempo 2 = 38
    s1*96
    \bar "|."

}

Ifl = {
    \Iglobal
    %\notypeset
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

IIfln = \relative do'' {

    R1*9
    la4~la16 re mi fad si,4~si16 mi fad sol
    dod,8 re16 re dod si la sol sol8 fad16 \once\stemDown re'' dod si la sol

    %12
    fad8 sol16 mi re8 mi\tr re4 fad\mbreak
    mi16 dod si la sol'8 fad16 re' \grace sol,8 fad mi r16 mi fad sol
    fad re dod si si re mi fad mi dod si la la dod re mi

    %15
    re8 dod dod16(si) si(la) la8 sold r16 mi sold si\mbreak
    mi1\startTrillSpan~
    mi16\stopTrillSpan sold sold si si re, dod si \afterGrace dod8 [{re16[mi]} re si ] \afterGrace la8 [{sold16[fad mi]} si'8\tr]

    %18
    la4 r r2
    R1*2
    la4 la16 fad sol la si8 la re16 fad, sol la\mbreak

    %22
    si8 la16 si do8 do do si16 dod re8 re
    re dod16 re mi8 mi mi re sol4
    fad8 mi16 re dod32(re mi fad) sol16 [si,] si8 lad r fad'16 lad,

    %25
    si lad? si8 si16 re dod si\mbreak si8 lad! r fad'16 lad,
    si8 si si 16 re dod si si8 lad fad16 lad dod mi
    \grace mi8 re dod16 si \grace re8 dod si16 lad si4 r

    %28
    R1
    r2 r8 si16(red) red(fad) fad(la?)\mbreak
    la do do4 si16 la sol fad mi si' si8 la16 sol

    %31
    fad mi re la' la sol sol fad fad8\tr mi r4
    R1\mbreak
    r2 r8 r16 re' dod si la sol

    %34
    fad8. sol32(la) la16(sol) sol(fad) fad8 mi r16 la, dod mi
    la1\startTrillSpan\parentSlur (
    la16\stopTrillSpan) la, dod re mi32(re dod si) la16[sol]\mbreak sol8 fad16 si si8 la16 sol'

    %37
    \grace sol8 fad8 mi16 re mi4\tr re16[re, mi fad sol la si dod]
    re1~
    re8. mi16 \grace re8 dod4 re8(si) la(sol)

    %40
    fad8.\fermata sol16 \grace fad8 mi4\tr re r
    R1*6

}

IIvlIn = \relative do'' {

    la8 la la16 fad sol la \grace la8 si8 la re16 fad, sol la
    \grace la8 si la16 re dod si la sol sol8 fad si4
    la16 re dod re \grace re8 mi8. sol,16\mbreak fad mi re8 r fad\p

    %4
    mi16(dod') dod(re) re(fad,) fad8\tr mi16(dod') dod(re) re fad, fad8\tr
    mi16(la) la(dod) dod(mi) mi(sol,) fad(re') re(fad) fad la la do,\mbreak
    si8 si'\f \con \tuplet 3/2 { la16(fad la) } la8\tr\noBeam \tuplet 3/2 { sol16 (mi sol) } sol8\noBeam \tr fad la,

    %7
    si8 sol'16 mi re8 mi\tr re do do16\p la si si
    si8(la16) do do\pp la si si si8 la16 re\mbreak dod!\f  mi sol, sol
    fad8. sol16 \grace fad8 mi4\tr re16 re' la fad \grace mi8 re4

    %10
    R1
    r8 r16 fad\pp mi sol fad mi mi8\tr re r4
    r2 r16 re\parenthesize \f  fad la re la fad re\mbreak

    %13
    la'8 la mi' \parenthesize \p re re\tr dod r4
    R1*2
    sold16\p(si) si(re) re(si) dod(la) sold(si) si(re) re(si) dod(la)

    %17
    sold4 r r2
    mi'8\f mi mi16 dod re mi \grace mi8  fad mi\mbreak la16 dod, re mi
    \grace mi8 fad mi16 la sold fad mi re re8\parenthesize \tr dod fad4

    %20
    mi16 la sold la si8. re,16 \tuplet 3/2 { dod(si la) } la8 r4
    R1
    r4 r16 fad\p sol la\mbreak la8\tr sol r16 sold la si

    %23
    si8\tr la r16 lad si dod dod8\tr si r mi,
    re re mi mi fad16 fad fad fad fad fad fad fad
    sol sol \parenthesize fad \parenthesize fad  mid mid mid mid\mbreak fad fad fad fad fad8 r

    %26
    r2 r4 r8 lad
    si re, mi fad si, \once\stemDown mi'\f mi16 dod re re
    re8 dod16 mi mi dod re re re8 \parentSlur (dod16) sol' sol fad fad mi\mbreak

    %29
    re8. mi16 \grace re8 dod4\tr si r
    R1*2
    la8\f la la16 fad sol la \grace la8 si la re16 fad, sol la

    %33
    \grace la8 si la16 re dod si la sol sol8 fad r4
    R1\mbreak
    dod'16\p (mi) mi(sol) sol(mi) fad(re) dod(mi) mi(sol) sol(mi) fad(re)

    %36
    dod8 r r4 r2
    R1
    fad,16\p (la) la(do) do(la) si(sol)  fad (la) la(do) do(la) si(sol)\mbreak

    %39
    fad8. sol16 \grace fad8 mi4\tr re8 sol fad mi
    re4\fermata r r r8 fad\f
    mi16 dod' dod re re16 fad, fad8\tr mi16 dod' dod re re16 fad, fad8\tr

    %42
    mi16 la la dod dod mi mi sol,\mbreak fad re' re fad fad la la do,
    si8 si' \tuplet 3/2 { la16(fad la) } la8\tr\noBeam \tuplet 3/2 { sol16 (mi sol) } sol8\noBeam \tr fad la,
    si8 sol'16 mi re8 mi\tr re do do16\p la si si

    %45
    si8 la16 do do\pp la si si si8 la16 re\mbreak dod!\f  mi sol, sol
    fad8. sol16 \grace fad8 mi4\tr re16 re' la fad  re4

}

IIvlIIn = \relative do'' {

    fad,8 fad fad16 re mi fad \grace fad8 sol fad fad16 re mi fad
    \grace fad8 sol fad mi16 sol fad mi mi8 re sol4
    fad16 fad mi fad sol8. mi16 re dod re8 r re\p\mbreak
    dod16(mi) mi(fad) fad(re) re8\tr dod16(mi) mi(fad) fad(re) re8\tr
    dod16\parentSlur  (mi) mi\parentSlur (la) la\parentSlur (dod) dod\parentSlur (mi,) re\parentSlur (fad) fad\parentSlur (re') re do do la
    sol8 sol'\f \tuplet 3/2 { fad16 (re fad) } fad8\tr\noBeam \tuplet 3/2 { mi16(dod mi) } mi8\tr\noBeam  re fad,
    sol sol'16 mi re8 mi\tr  re la la16\p fad sol sol\mbreak
    sol8 (fad16) la  la\pp fad sol sol sol8 fad mi16 \f sol mi mi
    re8. mi16 \grace re8 dod4\tr re16 re' la fad \grace mi8 re4
    R1*2
    r2 r16 re\f fad la re la fad re
    la'8 la la\p la la la r4  %%%<<<< fin qui OOKK
    R1*2\mbreak
    mi16\p (sold) sold(si)  si(sold) la(fad) mi(sold) sold(si)  si(sold) la(fad)
    mi4 r r2
    dod'8\f dod dod16 la si dod re8 dod dod16 la si dod
    re8 dod si16 re dod si si8\tr la re4\mbreak
    dod16. dod32 si16. dod32 re8 si la16 sold la8 r4
    R1
    r4 r16 re,\p mi fad sol8 sol, r16 mi' fad sold
    la8 la, r16 fad' sold lad si8 si, r mi
    re re mi mi fad16 fad fad fad fad fad fad fad\mbreak
    sol sol fad fad mid mid mid mid fad fad fad fad fad8 r

    %26
    r2 r4 r8 lad
    si re, mi fad si, \once\stemDown dod'\f dod16 lad si si
    si8 lad16 dod dod lad si si si8(lad16) mi' mi re re dod
    si8 dod \grace sol la4\tr si r
    R1*2
    fad8\f fad fad16 re mi fad \grace fad8 sol fad fad16 re mi fad
    \grace fad8 sol fad mi16 sol fad mi mi8 re r4
    R1
    la'16\p(dod) dod(mi) mi(dod) re(fad,) mi(dod') dod(mi)\mbreak mi(dod) re(fad,)
    mi8 r r4 r2
    R1
    re16\parenthesize \p (fad) fad(la) la(fad) sol(si,) la(fad') fad(la) la(fad) sol(si,)
    la8 la sol' sol fad re re dod
    re4\fermata r r r8 re\f \mbreak
    dod16 mi mi fad fad re re8\tr dod16 mi mi fad fad re re8\tr
    dod16 mi mi la la dod dod mi, re fad fad re' re do do la
    sol8 sol' \tuplet 3/2 { fad16(re fad) } fad8\tr\noBeam \tuplet 3/2 { mi16(dod mi) } mi8\tr\noBeam re fad,
    sol sol'16 mi re8 mi\tr\mbreak re la la16\p fad sol sol
    sol fad la8 la16\pp fad sol sol sol8 fad mi16\f sol mi mi
    re8. mi16 \grace re8 dod4\tr  re16 re' la fad \grace  mi8 re4

}

IIvlan = \relative do' {

    re8 re re re re re re re
    re re16 fad la8 la, la la r re
    re re r16 dod dod dod la8 fad16 la re8 la\p

    %4
    la la la la la la la la
    la la la la la re re re\mbreak
    re re'\f re re dod dod la fad

    %7
    re si'16 sol fad8 sol\tr fad fad fad\p sol
    re re re\pp re re re r re\f
    la la16 si la8 sol\tr fad4 r

    %10
    R1*2
    r2 r16 re'\f fad la re la fad re\mbreak
    dod8  dod dod\p re la' la r4

    %14
    R1*2
    mi8 mi mi mi mi mi mi mi
    mi4 r r2

    %18
    la8\f la la la la la la la
    la la mi' mi, mi mi r la
    la la r16 sold sold sold\mbreak mi8 mi r4

    %21
    R1*2
    r2 r4 r8 dod
    re re mi mi fad16 fad fad fad fad fad fad fad

    %25
    sol sol fad fad mid mid mid mid fad fad fad fad fad8 r
    r2 r4 r8 fad\mbreak
    si re, mi fad si, fad'\f fad fad

    %28
    fad fad fad fad fad fad r lad
    sol sol fad fad fad r r4
    R1

    %31
    r2 r16 la,\parenthesize \f dod mi la sol fad mi
    re8\p re re re re re re re\mbreak
    re re16 fad la8 la, la la r4

    %34
    R1
    r8 la' la la la la la la
    la r r4 r2

    %37
    R1*3
    r2\fermata r4 r8 la,\f
    la la la la la la la la\mbreak

    %42
    la la la la la re re re
    re re' re re dod dod la re,
    re si'16 sol fad8 sol\tr  fad fad fad\parenthesize \p  sol

    %45
    re re re\parenthesize \pp re re re r dod
    la la16 si la8 sol\tr \grace sol fad4 r

}

IIbcn = \relative do {

    re8 re re re sol, re' re re
    sol, re'16 fad la8 la, re re,  r sol
    re' re r16 la la la re,8 fad16 la re8 re,

    %4
    la' la la la la la la la\mbreak
    la la la la re re re re
    sol sol re'[re] la la re,[re]

    %7
    sol sol la la, re re re la
    re re re sol, re' re16 fad la8 la,
    re sol, la la re,4 r

    %10
    re'8\p mi fad re sol fad sol mi\mbreak
    la re, la'[la,] re re,16 fad la8 dod
    re sol la la, re4 r

    %13
    r2 r8 la'16 si dod8 la
    re re, re re dod dod dod dod
    re16 sold la la, re8 red mi mi, mi' r

    %16
    R1\mbreak
    mi8 mi mi sold la re, mi[mi,]
    la la'\f la la dod, la' la la

    %19
    re la16 dod mi8 mi, la la, r re
    la' la r16 mi mi mi la,8 dod16 mi la sol fad mi
    re8\p re re re sol, re' re re\mbreak

    %22
    sol, re' r4 r2
    R1*2
    r2 r4 r16 fad fad fad

    %26
    sol sol fad fad mid mid mid mid fad8 fad, r4
    r2 r8 fad' fad fad
    fad fad fad fad fad fad r fad

    %29
    si mi, fad fad\mbreak si, si' si si
    r red, red red mi mi, r dod'
    re! fad dod re la'16 la, \f  dod mi la sol fad mi

    %32
    re8 re re re sol, re' re re
    sol, re'16 fad la8 la, re re16 fad la8 la,
    re re, sol[sol] la16 la dod mi la8 la,\mbreak

    %35
    R1
    r8 la' la, la re re dod dod
    re fad sol la re, re, r4

    %38
    re'8\p re re re re re re re
    re sol, la la re,4 r8 la'
    re sol, la4\fermata re,8 fad16 la re8 re,

    %41
    la' la la la la la la la\mbreak
    la la la la re re re re
    sol sol re' re la la re, re

    %44
    sol sol la la, re re re sol,
    re' re re sol, re' re16 fad la8 la,
    re fad, sol la re,2\fermata

}

IIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {
    \key re\major
    \time 4/4
    \tempo 4 = 30
    s1*46
    \bar "|."

}

IIfl = {
    \IIglobal
    %\notypeset
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
    \tupletSpan 4 \con
}

IIIfln = \relative do'' {

    R2.*30
    r4 re sol
    \grace sol8 fad2 sol4

    %33
    mi re sol
    do, si r
    sol8 la16 si do si do re mi8 mi

    %36
    re4 fad sol\mbreak
    la re,8 fad la do
    si4\tr la r

    %39
    si8 si si16 re, sol la si8 si
    la la la16 re, fad sol la8 la
    sol sol sol16 la, dod mi sol8 sol

    %42
    fad16 re mi fad sol mi fad sol la fad sol la\mbreak
    si8 la sol fad mi re
    \grace re dod2.

    %45
    dod?16 la dod mi dod la dod mi re la re fad
    mi la, mi' sol mi la, mi' sol fad re fad la
    dod, la dod mi dod la dod mi re la re fad\mbreak

    %48
    mi la, mi' sol mi la, mi' sol fad re fad la
    si4 si16 la sol la si8 dod
    re4 re, sol

    %51
    \tuplet 3/2 { fad8(mi re) } mi2\tr
    mi8 re dod si la sol
    fad re' \grace re, mi2\tr \mbreak

    %54
    re4 r r
    R2.*22
    re''4 la fad

    %78
    re8 fad16 re la'8[la, si dod]
    re16 mi fad sol la8[la, si dod]
    re4 re, r8 la''

    %81
    si16 re, dod re mi re dod re\mbreak si' re, dod re
    la' re, dod? re mi re dod re la' re, dod re
    sol fad mi re dod8 si la sol'

    %84
    fad4 mi r
    mi16 fad sol la sol8 fad mi re
    \grace re dod2 re4\mbreak

    %87
    mi16 fad sol la sol8 fad mi re
    \grace re dod2 re4
    dod16 re mi fad mi8 re dod si

    %90
    \grace si4 lad2 si4
    sol'8 fad mi re dod si
    \grace si lad2.\mbreak

    %93
    lad16 dod si dod fad dod si dod lad dod si dod
    si re dod re fad re dod re si re dod si
    lad dod si dod fad dod si dod lad dod si dod

    %96
    si re dod re fad re dod re si re dod si\mbreak
    sol'4 sol16 fad mi fad sol8 sol
    fad4 fad16 mi re mi fad8 fad

    %99
    mi4 mi16 re dod re mi8 mi
    re(fad si lad si fad)
    \grace la \tuplet 3/2 { sol8(fad mi)} \grace re4 dod2\tr

    %102
    si4 r r
    R2.*2\mbreak
    r4 r fad'

    %106 OOKK
    red16 si red fad red si red fad mi si mi sol
    fad si, fad' la  fad si, fad' la  sol si sol mi
    dod la dod mi dod la dod mi re la re fad\mbreak

    %109
    mi la, mi' sol  mi la, mi' sol fad la fad re
    si sol si re si sol si re do! sol do mi
    re sol, re' fa  re sol, re' fa mi do mi sol

    %112
    dod, la dod mi dod la dod mi\mbreak re la re fad
    mi la, mi' sol mi la, mi' sol fad re fad la
    sol4 do? si

    %115
    la8 sol fad mi re do
    si4 \tuplet 3/2 { sol'8(fad mi) re[(dod? si)] }\mbreak
    si4 la r

    %118
    R2.*8
    sol8 la16 si do si do re mi8 mi
    mi4 re sol

    %128
    fad16 re fad sol la sol fad mi re8 do
    si4 la r\mbreak
    la16 re dod re fad re dod re la re dod re

    %131
    si re dod re sol re dod re si re dod re
    la re dod re fad re dod re la re dod re
    si re dod? re sol re dod re si re dod re\mbreak

    %134
    mi8 fad16 sol la sol la si do?8 mi,
    re mi16 fad sol fad sol la si8 re,
    do re16 mi fad mi fad sol la8 do,

    %137
    si re mi fad sol re\mbreak
    mi8 do' \grace si4 la2\tr
    sol re'4

    %140
    fad,8(sol) la(do) si(re)
    fad,16(la) sol8  la(do) si(re)
    do si la sol fad mi

    %143
    re4 do' si\mbreak
    mi,8 la \grace sol4 fad2\tr
    sol8 do, mi[re do si]

    %146
    si do si4\fermata la\tr
    sol r r
    R2.*19

}

IIIvlIn = \relative do'' {

    <sol' si, re, sol,>4 re si
    sol8 si16 sol re'8 re, mi fad
    sol16 la si do re8 re, mi fad

    %4
    sol4 sol, r
    sol'8 la16 si do si do re mi8 mi
    mi4 re sol\mbreak

    %7
    \grace sol8 fad4. fad16 sol la8 do,
    si4\parenthesize \tr la r
    sol8\p la16 si do si do re mi8 mi

    %10
    mi4 re sol
    \grace sol8 fad4. fad16 sol la8 do,
    si4\tr la r

    %13
    la16\f re re re re re re re\mbreak dod si la sol
    fad re' re re re re re re dod si la sol
    fad mi re mi fad sol la si do! mi re do

    %16
    si sol' sol sol sol sol sol sol fad mi re do
    si sol' sol sol sol sol sol sol fad mi re do
    si la sol la si do re mi fa la sol fa

    %19
    mi4 mi16 re do re mi8 mi
    fad,4 re'16 do si do re8 re
    mi,4 do'16 si la si do8 do

    %22
    re,4 si'16 sol si re sol8 sol,\mbreak
    fad\p(sol) la(do) si(re)
    fad,(sol) la(do) si(re)

    %25
    do4\f do do
    do4. la8 si4
    mi,8 la sol4 fad\tr

    %28
    sol8 sol' sol fad16 mi re8 do
    si sol sol fad16 mi re8 do\mbreak
    si sol' do,4 re

    %31
    sol, r r
    R2.*7
    re''4\p re re

    %40
    re re re
    re dod dod
    re r r

    %43
    R2.*2
    mi,4 mi fad
    dod2 re4\mbreak

    %47
    mi mi fad
    dod2 re4
    re' re re

    %50
    re r mi
    re dod2\tr
    re4 r r

    %53
    R2.
    \once\stemUp <re' fad, la, re,>4 la fad
    re8 fad16 re la'8 la, si dod\mbreak

    %56
    re16 mi fad sol la8 la, si dod
    re4 re, r
    re'8 mi16 fad sol fad sol la si8 si

    %59
    si4 la re,
    \grace re8 dod4. dod16 re mi8 sol,
    fad4\tr mi r\mbreak

    %62
    dod'16 la' la la la la la la sold fad mi re
    dod la' la la la la la la sold fad mi re
    dod si la si dod re mi fad sol si la sol

    %65
    fad re' re re re re re re dod si la sol\mbreak
    fad re re re re re re re dod si la sol
    fad mi re mi fad sol la si do! mi re do

    %68
    si4 si'16 la sol la si8 si
    dod,4 la'16 sol fad sol la8 la
    si,4 sol'16 fad mi fad sol8 sol\mbreak

    %71
    la,4 fad'16 mi re mi fad8 fad
    dod\p(re) mi(sol) fad(la)
    dod,(re) mi(sol) fad(la)

    %74
    sol4 \f sol sol
    sol4. mi8 fad4
    si,8 mi re4 dod\tr

    %77
    re r r\mbreak
    re\p r8 re re dod
    re4 r8 re re dod

    %80
    re4 r8 fad sol la
    si4 r si
    la r la

    %83
    sol r sol
    fad mi r\mbreak
    dod,2\parenthesize \p  re4

    %86
    mi16 fad sol la sol8 fad mi re
    dod2 re4
    mi16 fad sol la sol8 fad mi re

    %89
    fad4 lad, si
    dod16 re mi fad mi8 re dod si
    mi4 sol mi

    %92
    fad r r
    R2.*9\mbreak
    si'4\f fad re

    %103
    si8 re16 mi fad8 fad, sold lad
    si16 dod re mi fad8 fad, sold lad
    si4 si, r

    %106
    fad'2\p sol4
    red red mi
    mi2 fad4

    %109
    dod dod re\mbreak
    re2 mi4
    si si do!

    %112
    mi2 fad4
    dod dod re
    mi fad sol

    %115
    re r r
    R2.*2
    sol'4\f re si

    %119
    sol8 si16 do re8 re, mi fad\mbreak
    sol16 la si do re8 re, mi fad
    sol4 sol, r

    %122
    sol'8 la16 si do si do re mi8 mi
    mi4 re sol
    \grace sol8 fad4. fad16 sol la8 do,

    %125
    si4\parenthesize \tr la r
    R2.*4\mbreak
    r4 fad'\p fad

    %131
    r sol sol
    r fad fad
    r sol sol

    %134
    R2.*6
    re8\p(mi) fad(la) sol(si)
    re,(mi) fad(la) sol(si)

    %142
    la4 r r
    R2.*5\mbreak
    fad,16\f  re' re re re re re re dod si la sol

    %149
    fad re' re re re re re re dod si la sol
    fad mi re mi fad sol la si do! mi re do
    si sol' sol sol sol sol sol sol fad mi re do\mbreak

    %152
    si sol' sol sol sol sol sol sol fad mi re do
    si la sol la si do re mi fa la sol fa
    mi4 mi16 re do re mi8 mi

    %155
    fad,4 re'16 do si do re8 re
    mi,4 do'16 si la si do8 do\mbreak
    re,4 si'16 la sol la si8 si

    %158
    fad16\p(la) sol8 la[(do) si(re)]
    fad,(sol) la(do) si(re)
    do4\f do do

    %161
    do4. la8 si4
    mi,8 la \grace sol4 fad2\tr
    sol8 sol' sol fad16 mi re8 do\mbreak

    %164
    si sol sol fad16 mi re8 do
    si sol' do,4 re
    sol,4 r r

}

IIIvlIIn = \relative do'' {

    <sol' si, re, sol,>4 re si
    sol8 si16 sol re'8 re, mi fad
    sol16 la si do re8 re, mi fad

    %4
    sol4 sol, r
    sol'8 la16 si do sol la si do8 do
    do4 si si\mbreak

    %7
    \grace si8 la4. la16 si do8 la
    sol4\tr fad r
    sol8\p la16 si do sol la si do8 do

    %10
    do4 si si
    \grace si8 la4. la16 si do8 la
    sol4\tr fad r

    %13
    fad16\f re' re re re re re re dod si la sol\mbreak
    fad re' re re re re re re dod si la sol
    fad mi re mi fad sol la si do! mi re do

    %16
    si sol' sol sol sol sol sol sol fad mi re do
    si sol' sol sol sol sol sol sol fad mi re do
    si la sol la si do re mi fa la sol fa

    %19
    mi4 mi16 re do re mi8 mi
    fad,4 re'16 do si do re8 re
    mi,4 do'16 si la si do8 do

    %22
    re,4 si'16 sol si re sol8 sol,
    re\p(mi) fad(la) sol(si)
    re,(mi) fad(la) sol(si)

    %25
    la4\f la la
    la4. re,8 re4
    mi si la

    %28
    si8 \once\stemDown sol'' sol fad16 mi re8 do
    si sol sol fad16 mi re8 do
    si sol' do,4 re

    %31
    sol, r r
    R2.*7\mbreak
    sol'4\p sol sol

    %40
    fad fad fad
    mi mi mi
    re r r

    %43
    R2.*2
    mi4 mi fad
    dod2 re4

    %47
    mi mi fad
    dod2 re4
    sol sol sol

    %50
    fad r r
    R2.*3\mbreak
    re''4\f la fad

    %55
    re8 fad16 sol la8 la, si dod
    re16 mi fad sol la8 la, si dod
    re4 re, r
    re'8 mi16 fad sol re mi fad sol8 sol

    %59
    sol4 fad fad,
    \grace fad8 mi4. mi16 fad sol8 mi
    re4 dod r

    %62
    dod'16 la' la la la la la la sold fad mi re
    dod la' la la la la la la sold fad mi re
    dod si la si dod re mi fad sol si la sol

    %65
    fad re' re re re re re re dod si la sol\mbreak
    fad re re re re re re re dod si la sol
    fad mi re mi fad sol la si do! mi re do

    %68
    si4 si'16 la sol la si8 si
    dod,4 la'16 sol fad sol la8 la
    si,4 sol'16 fad mi fad sol8 sol\mbreak

    %71
    la,4 fad'16 mi re mi fad8 fad
    la,\p(si) dod(mi) re(fad)
    la,(si) dod(mi) re(fad)\mbreak

    %74
    mi4\f mi mi
    mi4. dod8 la4
    si fad mi\tr

    %77
    fad r r
    fad\p r8 fad sol mi
    fad4 r8 fad sol mi

    %80
    fad4 r8 re' mi fad
    sol4 r sol\mbreak
    fad r fad

    %83
    mi r mi
    re dod r
    dod,2\p re4

    %86
    mi16 fad sol la sol8 fad mi re
    dod2 re4
    mi16 fad sol la sol8 fad mi re

    %89
    fad4 fad si,
    dod16 re mi fad mi8 re dod si
    mi4 sol mi

    %92
    fad r r
    R2.*9\mbreak
    si'4\f fad re

    %103
    si8 re16 mi fad8 fad, sold lad
    si16 dod re mi fad8 fad, sold lad
    si4 si, r

    %106
    fad'2\p sol4
    red red mi
    mi2 fad4

    %109
    dod dod re\mbreak
    re2 mi4
    si si do?

    %112
    mi2 fad4
    dod dod re
    mi fad sol

    %115
    re r r
    R2.*2
    sol'4\f re si

    %119
    sol8 si16 do re8 re, mi fad\mbreak
    sol16 la si do re8 re, mi fad
    sol4 sol, r

    %122
    sol'8 la16 si do sol la si do8 do
    do4 si si
    la4. la16 si do8 la

    %125
    sol4\tr fad r
    R2.*4
    r4 la\p la

    %131
    r si si
    r la la
    r si si\mbreak

    %134
    R2.*14
    fad16\f  re' re re re re re re dod si la sol

    %149
    fad re' re re re re re re dod si la sol
    fad mi re mi fad sol la si do? mi re do
    si sol' sol sol sol sol sol sol fad mi re do\mbreak

    %152
    si sol' sol sol sol sol sol sol fad mi re do
    si la sol la si do re mi fa la sol fa
    mi4 mi16 re do re mi8 mi

    %155
    fad,4 re'16 do si do re8 re
    mi,4 do'16 si la si do8 do\mbreak
    re,4 si'16 la sol la si8 si

    %158
    re,8\p(mi) fad(la) sol(si)
    re,(mi) fad(la) sol(si)
    la4\f la la

    %161
    la4. fad8 re4
    mi4 si la
    sol8 \once\stemDown sol'' sol fad16 mi re8 do\mbreak

    %164
    si sol sol fad16 mi re8 do
    si sol' do,4 re
    sol,4 r r

}

IIIvlan = \relative do' {

    si4 r r
    si r8 si do la
    si4 r8 si do la

    %4
    si16 sol la si do si do re mi re mi fad
    sol4 r sol\mbreak
    sol8 sol, sol' sol16 la si8 sol

    %7
    re' re, re'4 fad,
    sol8 sol, re'[do si la]
    sol4\p r sol'

    %10
    sol8 sol, sol' sol16 la si8 sol
    re' re, re'4 fad,\mbreak
    sol8 sol, re' fad16 sol la8 sol

    %13
    fad4\f la mi
    fad la mi
    fad fad fad

    %16
    mi re la
    si re la
    si si' si

    %19
    sol sol2
    fad4 sol2\mbreak
    mi4 fad2

    %22
    re4 re2
    re4-.\p(re-. re-.)
    re-.(re-. re-.)

    %25
    re8\f fad16 re la8 re16 la fad8 la16 fad
    re8 re'16 mi fad re mi fad sol8 sol,
    do4 re re,\mbreak

    %28
    si' re fad
    sol8 sol sol fad16 mi re8 do
    si sol' do,4 re

    %31
    sol, r r
    R2.*7
    sol'4\p sol sol

    %40
    re re re
    la la la\mbreak
    re4 r r

    %43
    R2.*2
    la2.
    la

    %47
    la
    la
    sol4 sol' sol

    %50
    fad r r
    R2.*3\mbreak
    fad4\f r r

    %55
    fad r8 fad sol mi
    fad4 r8 fad sol mi
    fad16 re mi fad sol fad sol la si la si dod

    %58
    re4 r re
    re re,8 re16 mi fad8 re\mbreak
    la'8 la, la'4 dod,

    %61
    re la8 dod16 re mi8 sold
    la4 mi sold
    la mi sold

    %64
    la la dod
    la la mi
    fad la mi\mbreak

    %67
    fad fad fad
    re re'2
    dod4 re2

    %70
    si4 dod2
    la4 la2
    la4-.\p(la-. la-.)

    %73
    la-.(la-. la-.)
    la8\f dod16 la mi8 la16 mi dod8 mi16 dod\mbreak
    la8 la'16 si dod la si dod re8 re,

    %76
    sol4 la la,
    re r r
    re\p r8 re fad, la

    %79
    re,4 r8 re' fad, la
    re,4 re' re,\mbreak
    sol r sol

    %82
    re' r re
    la' la, dod
    re la8 la dod mi

    %85
    la4 la, la
    la la la
    la la la

    %88
    la la la\mbreak
    r fad fad
    fad fad fad

    %91
    mi sol' mi
    fad r r
    R2.*9

    %102
    re4\f r r
    re4 r8 re mi dod
    re4 r8 re mi dod

    %105
    re4 si r\mbreak
    si\p si si
    si si mi

    %108
    la, la la
    la la re
    sol, sol sol

    %111
    sol sol do
    la la la
    la la re\mbreak

    %114
    mi fad sol
    re r r
    R2.

    %117
    r4 re8\f do si la
    si4 r r
    si r8 si do la

    %120
    si4 r8 si do la\mbreak
    si16 sol la si do re mi fad mi re mi fad
    sol4 r sol

    %123
    sol8 sol, sol' sol16 la si8 sol
    re' re, re'4 re
    re re, r

    %126
    R2.*4\mbreak
    r4 re\p re
    r sol, sol

    %132
    r re' re
    r sol, sol
    R2.*13

    %147
    r8 sol'8\f sol, la si dod
    re4 la' mi
    fad sol mi\mbreak

    %150
    fad fad fad
    re re la
    si re la

    %153
    si si' si
    sol sol2
    fad4 sol2

    %156
    mi4 fad2
    re4 re2
    re4\p-.(re-. re-.)\mbreak

    %159
    re-.(re-. re-.)
    re8\f fad16 re la8 re16 la fad'8 la16 fad
    re8 re16 mi fad re mi fad sol8 sol,

    %162
    do4 re re
    si re fad
    sol8 sol sol fad16 mi re8 do\mbreak

    %165
    si sol' do,4 re
    sol, r r

}

IIIbcn = \relative do {

    sol4 r r
    sol r8 sol do re
    sol,4 r8 sol do re

    %4
    sol, la16 si do si do re mi re mi fad
    sol4 r do,
    sol'8 sol, sol' sol16 la si8 sol

    %7
    re' re, re'4 fad,\mbreak
    sol8 sol, re'[do si la]
    sol4\p r do

    %10
    sol'8 sol, sol' sol16 la si8 sol
    re' re, re'4 fad,
    sol8 sol, re' re16 mi fad8 dod

    %13
    re4\f fad la
    re fad, la
    re, re re

    %16
    sol, si re\mbreak
    sol si, re
    sol, sol' sol

    %19
    do,8 do, do'[do do do]
    re do si si si si
    do si la la la la

    %22
    si la sol sol sol sol
    re'8-.\p(re-. re-. re-. re-. re-.)
    re-.(re-. re-. re-. re-. re-.)\mbreak

    %25
    re\f fad16 re la8 re16 la fad8 la16 fad
    re8 re'16 mi fad re mi fad sol8 sol,
    do4 re re,

    %28
    sol si re
    sol8 sol sol fad16 mi re8 do
    si sol' do,4 re

    %31 OOKK
    sol, si'\p sol\mbreak
    re' do si
    do si r

    %34
    fad sol sol,
    r sol' do,
    si la sol

    %37
    fad8 re16 mi fad4 fad
    sol8 sol' re[do si la]\mbreak
    sol4 r r

    %40
    R2.*2
    re'4\p mi fad
    sol si sol

    %44
    la8 sol16 fad mi8 re dod si
    la4 r r
    R2.*4

    %50
    r4 fad' dod
    re la' la,\mbreak
    si2 dod4

    %53
    re8 fad la4 la,
    re\f r r
    re r8 re sol la

    %56
    re,4 r8 re sol la
    re, mi16 fad sol fad sol la si la si dod
    re4 r sol,\mbreak

    %59
    re'8 re, re re16 mi fad8 re
    la' la, la'4 dod,
    re la8 la16 si dod8 mi

    %62
    la4 dod, mi
    la, dod? mi
    la la la

    %65
    re, fad la
    re fad, la\mbreak
    re, re re

    %68
    sol8 sol, sol'[ sol sol sol]
    la[sol] fad fad fad fad
    sol[fad] mi mi mi mi

    %71
    fad[mi] re re re re
    la'-.\p(la-. la-. la-. la-. la-.)
    la-.(la-. la-. la-. la-. la-.)

    %74
    la\f dod16 la mi8 la16 mi dod8 mi16 dod\mbreak
    la8 la'16 si dod la si dod re8 re,
    sol4 la la,

    %77
    re r r
    R2.*14
    r8 fad,16 sold lad8 fad lad dod

    %93
    fad4 fad fad
    si, r r
    fad' fad fad

    %96
    si, r r
    mi4 dod la\mbreak
    re si sol

    %99
    dod lad fad
    si dod re
    mi fad fad,

    %102
    si\f r r
    si r8 si mi fad
    si,4 r8 si mi fad

    %105
    si4 si, r
    R2.*9
    r4 re\p fad\mbreak

    %116
    sol sol,8 la si dod
    re re, re'\f[do! si la]
    sol4 r r

    %119
    sol r8 sol do re
    sol,4 r8 sol do re
    sol16 sol, la si do si do re mi re mi fad

    %122
    sol4 r do,
    sol'8 sol, sol' sol16 la si8 sol\mbreak
    re' re, re'4 fad,

    %125
    sol8 sol, re' re'16 do si8 la
    sol2 do,4\p
    sol' si sol

    %128
    re' re, fad
    sol re8 fad la re
    re,4 r re

    %131
    sol r sol,
    re' r re
    sol r sol,\mbreak

    %134
    do si la
    si la sol
    la re, fad

    %137
    sol do si
    do re re,
    sol sol8 la si dod

    %140
    re4 re re
    re re re
    re8 fad la, [re] fad, la

    %143
    re,4 fad sol
    do re re,\mbreak
    mi2 fad4

    %146
    sol re'\fermata re,
    sol8\f sol' sol, la si dod?
    re4 fad la

    %149
    re fad, la
    re, re re
    sol, si re

    %152
    sol si, re
    sol, sol'  sol
    do,8 do, do' do do do\mbreak

    %155
    re do si si si si
    do si la la la la
    si la sol sol sol sol

    %158
    re'-.\p(re-. re-. re-. re-. re-.)
    re-.(re-. re-. re-. re-. re-.)
    re8\f fad16 re la8 re16 la fad8 la16 fad

    %161
    re8 re'16 mi fad re mi fad sol8 sol,
    do4 re re,\mbreak
    sol si re

    %164
    sol8 sol sol fad16 mi re8 do
    si sol' do,4 re
    sol, r r

}

IIIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {
    \key sol\major
    \time 3/4
    \tempo 2 = 60
    s2.*166
    \bar "|."

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16.3)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Concerto per Flauto traverso in Sol maggiore [LeeB 2.10]}
    composer = \markup \center-column{"F. Benda (1709-1786)"}

}

\markup\huge "[1.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Flauto"\vspace #-0.2"Traverso"\vspace #-0.2"Concertato"}
            \set Staff.midiInstrument = #"flute"
            \set Staff.shortInstrumentName = "fl"
            \Ifl
        >>

        \new PianoStaff
        <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[2.] Adagio con Sordini"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Flauto"\vspace #-0.2"Traverso"\vspace #-0.2"Concertato"}
            \set Staff.midiInstrument = #"flute"
            \set Staff.shortInstrumentName = "fl"
            \IIfl
        >>

        \new PianoStaff
        <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \IIbc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Flauto"\vspace #-0.2"Traverso"\vspace #-0.2"Concertato"}
            \set Staff.midiInstrument = #"flute"
            \set Staff.shortInstrumentName = "fl"
            \IIIfl
        >>

        \new PianoStaff
        <<
            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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
