\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

dolce = _\markup\italic "dol."


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
  \terzine \con
}

Ifln = \relative do'' {

    r4
    R1*12
    r2 r4 r8 sol'\solo
    do8 do do do do do, mi16(do) sol'(mi)
    fa8 mi re sol mi do mi16(do) sol' (mi)\mbreak

    %16
    fa8 mi re sol mi16(do sol do) mi do sol' mi
    re(si sol si) re si sol' re do(la fad la) do la la' do,
    si re la re sol, re' fad, re' si re la re sol, re' fad, re'\mbreak

    %19
    mi sol re sol do, sol' si, sol' mi sol re sol do, sol' si, sol'
    fad8 la16(fad re la fad re) sol'8 si16(sol re si sol re)
    fad'8 la16(fad re la fad re) sol'8 si16(sol re si sol re)\mbreak

    %22
    la''8 do16(la fad la la, do) si16.-+ do32 do16.-+ re32 re16. -+ mi32 mi16.-+ fad32
    sol8.-+(fad32 mi) re16 mi la, do \tupletSpan 4 \tuplet 6/4 { si la sol fad mi re } la'4_+
    \tuplet 6/4 { si16 re do si sol' fa! mi[fad sol la si do] si la sol fad mi re} la'4-+

    %25
    sol r r2
    R1*2
    r4 r8 sol\solo do8 do do do

    %29
    do do, mi16(do) sol'(mi) sib'8 sib sib16(sol mi do)
    la'8. sol16 fad(re) la'(fad) do'8 do do16(la fad re)\mbreak
    si' re (do re) re fa,! (mi fa) fa re' (do re) re (fa,  mi re)

    %32
    mi do'(si do) do mi,(re mi) mi do'(si do) do (mi, re do)
    re si'(la si) si re,(do re) re si'(la si) si(re, do si)\mbreak
    do la'(sol la) la do,(si do) do la' (sol la) la(do, si la)

    %35
    sold fad mi8 r mi' fa!16 la re, fa si, re sol,? fa'
    mi sol do, mi la, do fa, mi' re fa si, re sold, si mi, re'\mbreak
    \terzine \tuplet 3/2 { do si la} la'8[la la] \tuplet 3/2 { sold16 fad mi } re'8[re re]

    %38
    do16(si la sold) la(fa! mi red) \grace mi8 mi4.\parenthesize -+ re8
    \tupletSpan 4 \tuplet 6/4 {do16 si la re do si mi[re do fa mi re] do si la sold fad mi} si'4-+
    la r r2

    %41
    R1*4
    r2 r8 si\solo mi mi
    mi16 red fad(mi red do si la) sol mi sol si mi si sol' mi

    %47
    fad si si, red fad si, la' fad\grace la8 sol16 fad? mi8 r si'\mbreak  %%% fine pagina
    \grace do8 si32(la) si8. \grace do8 si32(la) si8. do16(si la8) r la
    \grace si8 la32(sol) la8. \grace si8 la32(sol) la8. si16 la sol8 r sol

    %50
    \grace la8 sol32(fad) sol8. \grace la8 sol32(fad) sol8. la16 sol fad8 r fad
    \grace sol8 fad32(mi) fad8. \grace sol8 fad32(mi) fad8.\mbreak  sol16(mi) si'(sol) fad(si,) la'(fad)
    sol(mi) si'(sol) fad(si,) la'(fad) sol(mi) si'(sol) mi'8 si

    %53
    \grace re8 do32(si) do8.  \grace re8 do32(si) do8. fad,16 re la' fad re'8 la
    \grace do8 si32(la) si8. \grace do8 si32(la) si8.\mbreak mi,16 do sol' mi do'8 sol
    \grace si8 la32(sol) la8. \grace si8 la32(sol) la8. red,16 si fad' red  si'8 fad

    %56
    sol16 mi (fad mi) do mi(fad mi) si mi(fad mi) la, mi'(fad mi)
    sol, mi'(fad mi) do mi(fad mi)\mbreak si mi(fad mi) la, mi'(fad mi)
    sol, fad mi fad sol la si do si8 si si dod16 red

    %59
    mi(fad sol la) si(sol fad mi) si8. mi32 fad fad4-+
    mi4 r r2
    R1\mbreak

    %62
    r16 si\solo(la si) sol si(la si) mi, si'(la si) sol si(la si)
    mi, si'(la si) mi si sol' mi fad fad(mi fad) red fad(mi fad)
    si, fad'(mi fad) red fad(mi fad)\mbreak si, fad'(mi fad) la fad do' la

    %65
    sol mi(red mi) si' mi,(red mi) mi' mi,(red mi) si' mi,(red mi)
    do'(si la sol) la(sol fad mi) do'(si la sol) la(sol fad mi)\mbreak
    si'8 si, r4 re8 re4 fa!8~

    %68
    fa re4 si sold re'8
    do16 la mi' do la'8 r do, do4 mib8~
    mib do4 la fad? do'8

    %71
    si16 sol re' si sol'8 re mi16(sol) re(sol) do,(sol') si,(sol')\mbreak
    do,(sol') si,(sol') la,(sol') sol,(sol') mi(sol) re(sol) do,(sol') si,(sol')
    do,(sol') si,(sol') la,(sol') sol, (sol') fad8 la16(fad re la fad re)

    %74
    sol'8 si16(sol re si sol re) fad'8 la16(fad re la fad re)\mbreak
    sol'8 si16(sol re si sol re) mi(sol do la) fad(la re si)
    sol(si mi do) la(do fad re) si(re sol mi) do(mi la fad)

    %77
    sol si si  re re sol,(la sol) \grace sol8 fa!16 mi \grace sol8 fa16 mi fa4\mbreak
    fa16 si si re re fa,(mi red) \grace fa8 mi16 red \grace fa8 mi16 red mi4
    mi16(sol) sol do do mi,(fa mi) mi8-+ re r4

    %80
    sol,16(re' fa) fa fa re si sol sol(re' fa) fa fa re si sol\mbreak
    sol(do mi) mi mi do sol mi sol(do mi) mi mi do sol mi
    sol(re' fa) fa fa re si sol sol(re' fa) fa fa re si sol

    %83
    mi'(sol do mi,) re(sol si re,)\mbreak do(mi la do,) si(mi sol si,)
    la(do fa la,) sol(do mi sol,) fa(la re fa,) mi(sol do) do
    do2~do

    %86
    re-+ do4 r
    R1*12
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IvlIn =  \relative do'' {

    \parenthesize r16  sol' la si
    do8 do do do do do, mi16(do) sol'(mi)
    fa8 mi re sol mi do mi16(do) sol' (mi)
    fa8 mi re sol mi do do16(re mi fad)\mbreak

    %4
    sol8 sol sol sol sol sol, si16(sol) re'(si)
    do8 si la re si sol si16(sol) re'(si)
    do8 si la re si[sol16(la si do re mi)]

    %7
    fa (si re do si la sol fa) mi8 la4 fa16 la
    sol (sol la mi) fa (fa sol re)\mbreak mi8 fa4 re16 fa
    mi (mi fa do) re (re mi si) do8\p la'4 fa16 la

    %10
    sol (sol la mi) fa (fa sol re)\mbreak mi8 fa4 re16 fa
    mi (mi fa do) re (re mi si) do8\f\noBeam  \tuplet 3/2 { do16 si la } sol8 sol\mbreak
    sol\noBeam \tuplet 3/2 { la16 sol fa } mi8 mi mi\noBeam \tuplet 3/2 { fa16 mi re } do8 do

    %13
    do16 re mi fa sol8 sol, do4 r
    mi8\p la sol fa  mi sol do mi
    r8 do4 si8 do sol do mi

    %16
    r do4 si8 do4 r8 do
    sol sol sol sol sol fad fad fad
    sol fad mi re sol fad mi re

    %19
    do si la sol do si la sol
    la'4 r si r
    la r si r

    %22
    do r8 la sol la si do
    si la si fad sol si, do re
    sol,4 r r r16 re''\f mi fad

    %25
    sol8 sol sol sol sol sol, si16 \parentSlur (sol) re' (si)
    do8 si la re\mbreak si sol si16(sol) re'(si)
    do8 si la re si[sol16(la si do re mi)]

    %28
    fa(si re do si la sol fa) mi8 la,\p  sol fa
    mi4 r8 mi fa fa sol sol
    do,4 r8 fad sol sol la la

    %31
    re,4 r8 fa'! fa4 r8 fa
    mi4 r8 mi\mbreak mi4 r8 mi
    re4 r8 re re4 r8 re

    %34
    do4 r8 do do4 r8 re
    mi4 r r2
    R1*3

    %39
    r2 r4 r16 mi\f fad sold
    la8 la la la la la, do16(la) mi'(do)
    re8 do si mi do la do16(la) mi'(do)

    %42
    re8 do si mi\mbreak do la la16(si do red)
    mi8 mi mi mi mi mi, sol16(mi) si'(sol)
    la8 sol fad si sol mi sol16(mi) si'(sol)

    %45
    la8 sol fad si sol4 r
    R1
    r2 r8 si sol fad

    %48
    sol4 r r8 do la sol
    fad4 r r8 si sol fad\mbreak
    mi4 r r8 la fad mi

    %51
    red4 r r8 mi red si
    mi sol red si mi4 r
    r2 r8 la la4

    %54
    r2 r8 sol sol4
    r2 r8 fad fad4
    R1*4

    %60
    r8 do''4\f la16 do si(si do sol) la(la si fad)
    sol8 la4 fad16 la\mbreak sol(sol la mi) fad(fad sol red)
    mi4 r r2

    %63
    sol,8\p sol sol sol fad4 r
    r2 fad8 fad fad fad
    sol4 r r2

    %66
    R1
    r2 re'8 r re r
    re r re r re r re r

    %69
    do4 r do8 r do r
    do r do r\mbreak do r do r
    si4 r r2

    %72
    R1
    r2 la4 r
    si r la r

    %75
    si r r2
    R1*4
    fa'!8\p fa fa fa fa fa fa fa

    %81
    mi mi mi mi mi  mi mi mi
    fa fa fa fa fa fa fa fa
    mi4 r r2

    %84
    R1*2
    r2 r4 r16 sol la si
    do8 do do do do do, mi16(do) sol'(mi)

    %88
    fa8 mi re sol mi do mi16(do) sol' (mi)
    fa8 mi re sol mi do do16(re mi fad)\mbreak
    sol8 sol sol sol sol sol, si16(sol) re'(si)

    %91
    do8 si la re si sol si16(sol) re'(si)
    do8 si la re si[sol16(la si do re mi)]
    fa (si re do si la sol fa) mi8 la4 fa16 la

    %94
    sol (sol la mi) fa (fa sol re)\mbreak mi8 fa4 re16 fa
    mi (mi fa do) re (re mi si) do8\p la'4 fa16 la
    sol (sol la mi) fa (fa sol re)\mbreak mi8 fa4 re16 fa

    %97
    mi (mi fa do) re (re mi si) do8\f\noBeam  \tuplet 3/2 { do16 si la } sol8 sol\mbreak
    sol\noBeam \tuplet 3/2 { la16 sol fa } mi8 mi mi\noBeam \tuplet 3/2 { fa16 mi re } do8 do
    do16 re mi fa sol8 sol, do4\fermata r

}

IvlIIn = \relative do'' {
  
  r4
  mi8 la sol fa mi sol, do mi
  r do4 si8 do sol do mi
  r do4 si8 do sol mi mi'
  
  %4
  re mi re do si re, sol si
  r sol4 fad8 sol re sol si\mbreak
  r8 sol4 fad8 sol4 sol16(la si do)
  
  %7
  re(re fa mi re do si re) do8 fa4 re16 fa
  mi(mi fa do) re(re mi si) do8 la4 fa16 la
  sol(sol la mi) fa(fa sol re) mi8\p fa'4 re16 fa
  
  %10
  mi(mi fa do) re(re mi si) do8 la4 fa16 la\mbreak
  sol(sol la mi) fa(fa sol re) mi8\f \noBeam \tuplet 3/2 { do'16 si la } sol8 sol
  sol\noBeam \tuplet 3/2 { la16 sol fa } mi8 mi mi\noBeam \tuplet 3/2 { fa16 mi re } do8 do
  
  %13
  do16 re mi fa sol8 sol, do4 r
  do8\p fa mi re do4 r8 do'
  la16 si do8 fa, sol do,4 r8 do'
  
  %16
  la16 si do8 fa, sol do, do do do\mbreak
  si si si si la re re re
  sol fad mi re sol fad mi re
  
  %19
  do si la sol do si la sol
  fad'4 r sol r
  fad r sol r
  
  %22
  la r8 fad sol la si do
  si la si fad sol si, do re
  sol,4 r r2
  
  %25
  si'8\f mi re do si re, sol si\mbreak
  r8 sol4 fad8 sol re sol si
  r8 sol4 fad8 sol4 sol16(la si do)
  
  %28
  re(re fa mi re do si re)  do8 fa,\p mi re
  do4 r8 do re re mi mi
  fa4 r8 re mi mi fad fad
  
  %31
  sol4 r8 re' re4 r8 re
  do4 r8 do do4 r8 do\mbreak
  si4 r8 si si4 r8 si
  
  %34
  la4 r8 la la4 r8 la
  sold4 r r2
  R1*4
  
  %40
  do8\parenthesize \f fa mi re do mi, la do
  r8 la4 sold8 la mi la do
  r8 la4 sold8 la mi do do'
  
  %43
  si do si la sol si, mi sol\mbreak
  r8 mi4 red8 mi si mi sol
  r mi4 red8 mi4 r
  
  %46
  R1
  r2 r8 sol mi red
  mi4 r r8 la fad mi
  
  %49
  re4 r r8 sol mi re
  do4 r r8 fad red do
  si4 r r8 mi red si\mbreak
  
  %52
  mi sol red si mi4 r
  r2 r8 fad fad4
  r2 r8 mi mi4
  
  %55
  r2 r8 red red4
  R1*4
  r8 la''4\f fad16 la sol(sol la mi) fad(fad sol red)
  
  %61
  mi8 do4 la16 do si(si do sol) la(la si fad)\mbreak
  sol4 r r2
  mi8\parenthesize \p mi mi mi red4 r
  
  %64
  r2 red8 red red red
  mi4 r r2
  R1
  
  %67
  r2 si'8 r si r
  si r si r si r si r
  la4 r la8 r la r
  
  %70
  la r la r la r la r\mbreak
  sol4 r r2
  R1
  
  %73
  r2 fad4 r
  sol r fad r
  sol r r2
  
  %76
  R1*4
  re'8\parenthesize \p re re re re re re re
  do do do do do do do do
  
  %82
  re re re re re  re re re
  do4 r r2
  R1*3
  
  %87
  mi8 la sol fa mi sol, do mi
  r do4 si8 do sol do mi
  r do4 si8 do sol mi mi'
  
  %90
  re mi re do si re, sol si
  r sol4 fad8 sol re sol si\mbreak
  r8 sol4 fad8 sol4 sol16(la si do)
  
  %93
  re(re fa mi re do si re) do8 fa4 re16 fa
  mi(mi fa do) re(re mi si) do8 la4 fa16 la
  sol(sol la mi) fa(fa sol re) mi8\p fa'4 re16 fa
  
  %96
  mi(mi fa do) re(re mi si) do8 la4 fa16 la\mbreak
  sol(sol la mi) fa(fa sol re) mi8\f \noBeam \tuplet 3/2 { do'16 si la } sol8 sol
  sol\noBeam \tuplet 3/2 { la16 sol fa } mi8 mi mi\noBeam \tuplet 3/2 { fa16 mi re } do8 do
  
  %99
  do16 re mi fa sol8 sol, do4\fermata r

}

Ivlan =  \relative do' {
  
  r4
  sol'8 la mi fa sol4 r8 do
  do sol la sol sol4 r8 do
  do sol la sol sol4 r8 sol16 la
  
  %4
  re,8 do re mi16 fad sol4 r8 sol
  sol re mi re re4 r8 sol \mbreak
  sol re mi re re4 r
  
  %7
  si8 sol' sol sol sol fa re4
  mi8 sol sol sol sol fa re4
  mi8 do si sol' sol\parenthesize \p fa re4
  
  %10
  mi8 sol sol sol sol fa re4
  mi8 do si sol' sol\noBeam\parenthesize \f \tuplet 3/2 { do16 si la } sol8 sol\mbreak
  sol\noBeam \tuplet 3/2 { la16 sol fa } mi8 mi mi\noBeam \tuplet 3/2 { fa16 mi re } do8 do
  
  %13
  do16 re mi fa sol8 sol, do4 r  % ripresa
  do8\p fa mi re do4 r8 do'
  la16 si do8 fa, sol do,4 r8 do'
  
  %16
  la16 si do8 fa, sol  do, do do do\mbreak
  si si si si la re re re
  sol fad mi re sol fad mi re
  
  %19
  do si la sol do si la sol
  re'4 r re r
  re r re r
  
  %22
  fad r8 fad sol la si do\mbreak
  si la si fad sol si, do re
  sol,4 r r2
  
  %25
  re'8 mi si do re4 r8 sol
  sol re mi re re4 r8 sol
  sol re mi re re4 r
  
  %28
  si8 sol' sol sol sol fa\parenthesize \p mi re\mbreak
  do4 r8 do re re mi mi
  fa4 r8 re mi mi fad fad
  
  %31
  sol4 r8 si si4 r8 si
  do4 r8 do do4 r8 do
  sol4 r8 sol sold4 r8 sold\mbreak
  
  %34
  la4 r8 la la4 r8 fa
  mi4 r r2
  R1*4
  
  %40
  mi8\parenthesize \f fa do re mi4 r8 la
  la mi fa mi mi4 r8 la
  la mi fa mi mi4 r8  mi16 fad 
  
  %43
  si,8 la si do16 red\mbreak mi4 r8 mi
  mi si do si si4 r8 mi
  mi si do si si4 r
  
  %46
  R1
  r2 r8 si' sol fad
  sol4 r r8 do la sol
  
  %49
  fad4 r r8 si sol fad
  mi4 r r8 la fad mi\mbreak
  red4 r r8 mi red si
  
  %52
  mi sol red si mi4 r
  r2 r8 re re4
  r2 r8 do do4
  
  %55
  r2 r8 si si4
  R1*4
  r4 fad'\parenthesize \f sol8 si si si 
  
  %61
  si la fad4 sol8 mi red si'
  si4 r r2\mbreak
  si,8 si si si si4 r
  
  %64
  r2 si8 si si si
  si4 r r2
  R1
  
  %67
  r2 mi8 r mi r
  mi r mi r mi r mi r
  mi4 r re8 r re r
  
  %70
  re r re r re r re r\mbreak
  re4 r r2
  R1
  
  %73
  r2 re4 r
  re r re r
  re r r2
  
  %76
  R1*4
  si'8\parenthesize \p si si si si si si si
  do do do do do do do do
  
  %82
  si si si si si si si si
  do4 r r2
  R1*3
  
  %87
  sol8 la mi fa sol4 r8 do
  do sol la sol sol4 r8 do
  do sol la sol sol4 r8 sol16 la
  
  %90
  re,8 do re mi16 fad sol4 r8 sol
  sol re mi re re4 r8 sol \mbreak
  sol re mi re re4 r
  
  %93
  si8 sol' sol sol sol fa re4
  mi8 sol sol sol sol fa re4
  mi8 do si sol' sol\parenthesize \p fa re4
  
  %96
  mi8 sol sol sol sol fa re4
  mi8 do si sol' sol\parenthesize \f\noBeam \tuplet 3/2 { do16 si la } sol8 sol\mbreak
  sol\noBeam \tuplet 3/2 { la16 sol fa } mi8 mi mi\noBeam \tuplet 3/2 { fa16 mi re } do8 do
  
  %99
  do16 re mi fa sol8 sol, do4\fermata r 

}

Ibcn = \relative do {

    r4
    do8 fa mi re do4 r8 do'
    la16 si do8 fa, sol do,4 r8 do'
    la16 si do8 fa, sol do,4 r8 do

    %4
    si do si la sol4 r8 sol'
    mi16 fad sol8 do, re sol,4 r8 sol'
    mi16 fad sol8 do, re sol,4 r

    %7
    sol8 sol sol sol do4 si
    do8 do sol' sol, do4 si
    do8 do sol' sol, do4\p si

    %10
    do8 do sol' sol, do4 si
    do8 do sol' sol, do8\noBeam\parenthesize \f \tuplet 3/2 { do'16 si la } sol8 sol
    sol\noBeam \tuplet 3/2 { la16[sol fa] } mi8 mi\mbreak do8\noBeam \tuplet 3/2 { fa16 mi re } do8 do

    %13
    do16 re mi fa sol8 sol, do4 r %%% ripresa
    R1*6
    re4 r re r

    %21
    re r re r
    re r8 re sol4 r
    R1

    %24
    r8 sol do la sol si, do re
    sol, do si la sol4 r8 sol'\mbreak
    mi16 fad sol8 do, re sol,4 r8 sol'

    %27
    mi16 fad sol8 do, re sol,4 r
    sol8 sol sol sol do4 r
    R1*2

    %31
    r8 sol' sol4 r8 sol sol4
    r8 do, do4 r8 do do4
    r8 sol' sol4 r8 sold sold4

    %34
    r8 la la4 r8 la la4\mbreak
    r8 mi do la re fa sol si,
    do mi fa la, si re mi sold,

    %37
    la fa' do re mi si' sold  mi
    la si do la sold mi fad sold
    la si do re mi4 mi,

    %40
    la,8\parenthesize \f re do si la4 r8 la'
    fa16 sold la8 re, mi la,4 r8 la'
    fa16 sold la8 re, mi la,4 r8 la'

    %43
    sol! la sol fad mi4 r8 mi
    do16 red mi8 la, si mi4 r8 mi
    do16 red mi8 la, si mi4 r8 mi

    %46
    si' si si[red,] mi4 r8 mi
    red red red red mi4 r\mbreak
    r8 mi sol mi la4 r

    %49
    r8 re, fad re sol4 r
    r8 do, mi do fad4 r
    r8 si, red si mi4 r

    %52
    r2 r8 mi sol mi
    la sol fad mi re4 r8 re
    sol fad mi re do4 r8 do

    %55
    fad mi red do\mbreak si4 r8 si
    mi4 la sol fad
    mi la sol fad

    %58
    mi r8 mi red do' si la
    sol4 r8 la si do la si
    mi,4 red\parenthesize ^\f mi8 mi si' si,

    %61
    mi4 red mi8 mi si' si,
    mi4 r r2
    mi8 mi mi mi\mbreak si4 r

    %64
    r2 si8 si si si
    mi4 r r2
    la4 r la do

    %67
    si8 si si la sold r sold r
    sold? r sold r sold r sold r
    la la,  la' sol? fad r fad r

    %70
    fad? r fad r fad r fad r
    sol sol, si[sol]\mbreak do si la sol
    mi' re do si do si la sol

    %73
    mi' re do dod re4 r
    re r re r
    re r8 si do do, re'[re,]

    %76
    mi' mi, fad'[fad,] sol'[sol,] la' la,
    si4 r8 do re re' re do\mbreak
    si4 r8 sol do, do' sol mi

    %79
    do4 r8 fa sol sol, sol4
    R1*3
    r8 do sol' sold la la, mi'[mi]

    %84
    fa fa do do re si do mi
    fa fa fad fad sol sol sol sol
    sol, sol sol sol do16 do' si la sol fa mi re

    %87
    do8 fa mi re do4 r8 do'
    la16 si do8 fa, sol do,4 r8 do'
    la16 si do8 fa, sol do,4 r8 do

    %90
    si do si la sol4 r8 sol'
    mi16 fad sol8 do, re sol,4 r8 sol'
    mi16 fad sol8 do, re sol,4 r

    %93
    sol8 sol sol sol do4 si
    do8 do sol' sol, do4 si
    do8 do sol' sol, do4\p si

    %96
    do8 do sol' sol, do4 si
    do8 do sol' sol, do8\parenthesize \f\noBeam \tuplet 3/2 { do'16 si la } sol8 sol
    sol\noBeam \tuplet 3/2 { la16[sol fa] } mi8 mi\mbreak do8\noBeam \tuplet 3/2 { fa16 mi re } do8 do

    %99
    do16 re mi fa sol8 sol, do4\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s4
  s8 <6> s4 s2
  <6>4 <6 5> s2
  <6>4 <6 5> s2
  <6>4 <6> <6+>2
  <6>4 <6 5>8 <_+> s2
  <6>4 <6 5>8 <_+> s2
  <7!>2 s4 <6 5>
  s <7> s <7 5>
  s <6 5> s <7 5>
  s <7> s2
  s1*3  %%%% fine ripresa
  s1*6
  <_+>2 <6 4>
  <_+> <6 4>
  <7 _+>1
  s
  s4 s8 <6+> s <6> <6 5> <_+>
  s4 <6> s2
  <6>4 <6 5>8 <_+> s2
  <6>4 <6 5>8 <_+> s2
  <7!>1
  s1*2
  s8 <7!> s4 s2
  s1
  s2 s8 <6 5> s4
  s1
  s8 <_+> s <6> s <6> s <6>
  s <6> s <6> s <6> s <6>
  s4 <6> <7 _+> <5>8 <7 _+>
  s8 <6+> <6> <6 4+ 2>
  <6>4 <6>8 <6 5>
  s8 <6+> <6>4 <6 4> <5 3+>
  s <6> s2
  <6>4 <6 5>8 <_+> s2
  <6>4 <6  5>8 <_+> s2
  <6>4 s8 <6+> s2
  <6>4 <6+ 5>8 <_+> s2
  <6>4 <6+ 5>8 <_+>
  s2
  <4>8 <3> <_+> <6> s2
  <6>1
  s1*5
  s2 <7>
  s <7>
  s1
  s2 <6>4 <6+>
  s2 <6>4 <6+>
  s2 <6>4 <_+>
  <6> s8 <6+ 5> <_+>4 <6+ 5>8 <_+>
  s4 <7 5> s <7 _+>
  s <7 5> s2
  s1
  s2 <_+>
  s <_+>
  s1
  s2 s4 <6>
  <_+>2 <7! 5>
  s1
  s2 <7 5>
  s1
  s4 <6> s8 <6 ><6+>4
  <6>8 <6> <6> <6> s <6> <6+>4
  <6>8 <6> <6> <6 5> <_+>2
  <6 4> <_+>
  <6 4>4 s8 <6> <5> <6> <5> <6>
  <5> <6> <5> <6> <5> <6> <5> <6+>
  <6>4 s8 <6 5> <_!>2
  <6 5>1
  s4 s8 <6 5> <6 4> <5 3> s4
  s1*3
  s4 s8 <6 5> s4 <_!>
  s1*3
  s8 <6> s4 s2
  <6>4 <6 5> s2
  <6>4 <6 5> s2
  <6>4 <6> <6+>2
  <6>4 <6 5>8 <_+> s2
  <6>4 <6 5>8 <_+> s2
  <7!>2 s4 <6 5>
  s <7> s <7 5>
  s <6 5> s <7 5>
  s <7> s2
  
}

forma = {

  \key do\major
  \time 4/4
  \tempo 2 = 50
  \partial 4 s4
  s1*99
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
  \terzine \con
}

IIfln = \relative do'' {
  
  R2.*6
  mi8\solo si4 \grace {la16[si]} do8 si la
  sol16 la si4 \grace {la16[si]} do8 si la
  
  %9
  sol16 la si4 mi8 sol16(mi) si'(sol)
  fad8 si,4 fad'8 la16(fad) do'(la)
  sol8.-+[la16 fad8.-+ sol16 mi8.-+ fad16]
  
  %12
  red(do si do) si4 r
  si'16 sold mi8~mi16 si' do re do8 si
  \tuplet 3/2 { do16 mi re } do16.[si32] \tuplet 3/2 { la16 do si } la16.[sol32] \sestine \tuplet 6/4 {fad16 la sol fad mi re} \mbreak
  
  %15
  \tuplet 3/2 { si' re do} si16.[la32] \tuplet 3/2 { sol16 si la } sol16. [fad32]  \tuplet 6/4 {mi16 sol fad mi re do}
  \tuplet 3/2 { la' do si } la16.[sol32] \tuplet 3/2 { fad16 la sol } fad16.[mi32] \tuplet 6/4 { red16 fad mi red dod si }
  sol'16. mi32 \grace sol8 \tuplet 3/2 { mi16[red mi] } r16 si do re re(do) do(si)
  
  %18
  do16. la32 \grace do8 \tuplet 3/2 { la16[sold la] } r16 la si do do(si) si(la)\mbreak
  si16. re32 sol8 sol16. re32 sol8 sol16. re32 sol16. re32
  mi8 mi4 do' la8
  
  %21
  sol4.~sol32 fad mi re la'4-+
  sol4 r r
  R2.*5
  
  %28
  sol8\solo re4 si8~si16 sol si re
  fa8 si re16 do (si la sol fa mi fa)
  fa?4-+ mi r
  
  %31
  la8 mi4 dod8~dod16 la dod mi
  sol8 dod mi16 re (dod si la sol fad? sol)
  sol4-+ fad r\mbreak
  
  %34
  re16(fad la do) do(la fad re) do'   (la fad re)
  re(sol si re) re(si sol re) re'(si sol re)
  re(fad la do) do(la fad re) do'(la fad re)
  
  %37
  si'8 si si si si16(sol) re'(si)
  la8 la la la la16(fad) do'(la)\mbreak
  sol8 sol sol sol sol16(mi) si'(sol)
  
  %40
  fad(si,) si(red) red(fad) fad(la) la(sol) sol(fad)
  r16 si, si(mi) mi(sol) sol(si) si(la) la(sol)
  r si, si(fad') fad(la) la(do) do(si) si(la)\mbreak
  
  %43
  sol8 mi'4 mi mi8
  mi lad,4 lad lad8
  \grace lad?8 si4~si16 fad red si la fad red la'
  
  %46
  sol32 mi(fad sol la si do red) mi si(do red mi fad sol la) si mi,(fad sol la si do red)
  mi8. mi,32 fad \grace fad8 fad2-+
  mi4 r r
  
  %49
  R2.*7
  
}

IIvlIn =  \relative do'' {
  
  mi8 si4 \grace {la16[si]} do8 si la
  sol16 la si4 \grace {la16[si]} do8 si la
  sol16 la si4 mi8 sol16(mi) si'(sol)
  
  %4
  fad8 si,4 fad'8 la16(fad) do'(la)
  sol8.-+[la16 fad8.-+ sol16 mi8.-+ fad16]
  red si'(fad red) si si(fad red) si4\mbreak
  
  %7
  sol'8\p sol sol sol fad red
  mi sol sol sol fad red
  mi sol sol si mi mi
  
  %10
  red red4 red8 fad16(red) la'(fad)
  mi8 mi si si lad lad
  si4 r r
  
  %13
  R2.
  r8 la' r la r la
  r sol r sol r sol
  
  %16
  r fad r fad r fad\mbreak
  mi4 r r
  R2.*4
  
  %22
  sol8\f re4 \grace {do16[re]} mi8 re do
  si16 do re4 \grace {do16[re]} mi8 re do
  si16 do re4 sol8 si16(sol) re'(si)
  
  %25
  la8 re,4 la'8 do16(la) mi'(do)
  si8.-+[do16 la8.-+ si16 sol8.-+ la16]
  fad re'(la fad) re re(la fad) re4
  
  %28
  re'8\p re re re re re
  re re re re re re\mbreak
  sol, sol sol sol sol sol
  
  %31
  mi' mi mi mi mi mi
  mi mi mi mi mi mi
  la, la la la la la
  
  %34
  la la la la la la
  si si si si si si
  la la la la la la
  
  %37
  si sol' sol sol sol sol
  sol sol fad fad fad fad
  fad fad mi mi mi mi
  
  %40
  red4 r r
  mi r r\mbreak
  fad r r
  
  %43
  sol r r
  r8 mi mi mi mi mi
  red red red red red red
  
  %46
  mi4 r r
  R2.
  mi8\f si4 \grace {la16[si]} do8 si la
  
  %49
  sol16 la si4 \grace {la16[si]} do8 si la
  sol16 la si4 mi8 sol16(mi) si'(sol)
  fad8 si,4 fad'8 la16(fad) do'(la)
  
  %52
  sol8.[la16 fad8. sol16 mi8. fad16]
  \grace mi8 red4 r8 r16 si[mi8. si16]
  do8. la16 sol4 fad
  
  %55
  mi2.

}

IIvlIIn = \relative do'' {
  
  sol8 sol4 sol8 fad red
  mi16 fad sol4 sol8 fad red
  mi16 fad sol4 si8 mi16(si) sol'(mi)
  
  %4
  red8 red4 red8 fad16(red) la'(fad)
  mi8 mi si si lad lad
  si4 r16 si fad red si4
  
  %7
  mi8\p mi mi mi red si
  mi mi mi mi red si\mbreak
  mi mi mi mi mi mi
  
  %10
  si si si si si si
  mi mi re! re do do
  si4 r r
  
  %13
  R2.
  r8 do' r do r do
  r si r si r si
  
  %16
  r la r la r la
  sol4 r r
  R2.*4
  
  %22
  si8\f si4 si8 la fad\mbreak
  sol16 la si4 si8 la fad
  sol16 la si4 re8 sol16 \parentSlur (re) si' \parentSlur (sol)
  
  %25
  fad8 fad4 fad8 la16 \parentSlur (fad) do' \parentSlur (la)
  sol8 sol re re dod dod
  re4 r16 re \parentSlur (la fad) re4
  
  %28
  si8\p si si si si si
  si si si si si si
  do do do do do do\mbreak
  
  %31
  dod dod dod dod dod dod
  dod? dod dod dod dod dod
  re re re re re re
  
  %34
  fad fad fad fad fad fad
  sol sol sol sol sol sol
  fad fad fad fad fad fad
  
  %37
  sol re' re re re re\mbreak
  re re re re si si
  si si si si si si
  
  %40
  si4 r r
  sol r r
  red' r r
  
  %43
  mi r r
  r8 mi mi do do do
  fad, fad fad fad fad fad
  
  %46
  sol4 r r
  R2.\mbreak
  sol8\f sol4 sol8 fad red
  
  %49
  mi16 fad sol4 sol8 fad red
  mi16 fad sol4 si8 mi16(si) sol'(mi)
  red8 red4 red8 fad16(red) la'(fad)
  
  %52
  mi8 mi si si lad lad
  si4 r8 r16 fad[sol8. sol16]
  la8. mi16 mi4 red
  
  %55
  mi2.

}

IIvlan =  \relative do' {
  
  mi8 mi mi mi fad fad
  mi mi mi mi fad fad
  mi mi mi sol si si
  
  %4
  si si si si si si
  si si si si do do
  fad,4 r16 si fad red si4
  
  %7
  mi8\p mi mi mi red si\mbreak
  mi mi mi mi red si
  mi mi mi mi mi mi
  
  %10
  si si si si si si
  mi mi re! re do do
  si4 r r
  
  %13
  R2.
  r8 mi r mi r fad
  r re r re r mi
  
  %16
  r do r do r red
  mi4 r r\mbreak
  R2.*4
  
  %22
  sol8\f sol sol sol la la
  sol sol sol sol la la
  sol sol sol si re re
  
  %25
  re re re re re re
  re re re re mi mi
  la,4 r16 re la fad re4
  
  %28
  si8\p si si si si si
  si si si si si si\mbreak
  do do do do do do
  
  %31
  dod dod dod dod dod dod
  dod? dod dod dod dod dod
  re re re re re re
  
  %34
  fad fad fad fad fad fad
  sol sol sol sol sol sol
  fad fad fad fad fad fad\mbreak
  
  %37
  sol sol sol sol sol sol
  la la la la fad fad
  si si si, si si si
  
  %40
  si4 r r
  si r r
  si r r
  
  %43
  si r r
  r8 do do do do do
  red red si si si si\mbreak
  
  %46
  si4 r r
  R2.
  mi8 mi mi mi fad fad
  
  %49
  mi mi mi mi fad fad
  mi mi mi sol si si
  si si si si si si
  
  %52
  si si si si do do
  fad,4 r8 r16 re[mi8. mi16]
  mi8. la,16 si4 si
  
  %55
  si2.

}

IIbcn = \relative do {

  mi8 mi mi mi red si
  mi mi mi mi red si
  mi mi mi mi mi mi

  %4
  si si si si si si
  mi mi re! re do do
  si4 r16 si' fad red si4

  %7
  R2.*5
  r8 si' si do si la
  sold sold sold sold sold sold\mbreak

  %14
  la la la la re, re
  sol sol sol sol do, do
  fad fad fad fad si, si
  
  %17
  mi mi sold sold sold sold
  la la fad fad fad fad
  sol sol la la si si
  
  %20
  do do do do do dod
  re re re re re, re\mbreak
  sol sol sol sol fad re
  
  %23
  sol sol sol sol fad re
  sol sol sol sol sol sol
  re re re re re re
  
  %26
  sol sol fad fad mi mi
  re4 r16 re' la fad re4
  R2.*9
  
  %37
  sol8 sol sol sol sol sol
  re re re re red red\mbreak
  mi mi mi mi mi mi
  
  %40
  si4 r r
  si r r
  si r r
  
  %43
  mi r r
  r8 do do do do do
  si si si si si si
  
  %46
  mi4 r r
  mi si' si,\mbreak
  mi8 mi mi mi red si
  
  %49
  mi mi mi mi red si
  mi mi mi mi mi mi
  si si si si si si
  
  %52
  mi mi re! re do do
  si si' si la sol mi
  la do si4 si,
  
  %55
  mi2.

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s4 s8 <6> <6> <7 _+>
  s4 s8 <6> <6> <7 _+>
  s2.
  <7 _+>
  s4 <5> <5+>
  <_+>2.
  s2.*5
  r8 <_+> s2
  <6>2.
  s2 <7>4 
  <7>2 <7>4
  <7>2 <7 _+>4
  <_!>4 <6 5>2
  s4 <6 5>2
  s4 <6> <6>
  s2 s8 <6 5>
  <6 4>2 <5 3>4
  s4 s8 <6> <6> <7>
  s4 s8 <6> <6> <7>
  s2.
  <7>
  s4 <6> <6+>
  s2.*11
  <4>4 <3>2
  <9>4 <8>2
  <_+>2.
  <6 4>
  <7 _+>
  s
  s8 <6+> s2
  <_+> <7 _+>4
  s2.
  <4>4 <3+> s
  s4 s8 <6> <6> <7 _+>
  s4 s8 <6> <6> <7 _+>
  s2.
  <7 _+>
  s4 <6> <6+>
  <_+> s <6>
  s <6 4> <5 3+>

}

forma = {

  \key sol\major
  \time 3/4
  \tempo 4 = 60
  s2.*55
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

  r8
  R4.*26
  r4 sol'8\solo
  \grace {la16[si]} do8 si la

  %29
  la-+ sol sol,
  la16 fa' mi8 re
  mi16 fa sol8 sol,

  %32
  la16 fa' mi8 re
  mi16 re do8 r\terzine
  \tuplet 3/2 {
    mi16 re do mi[fad sol] fad[sol la]

    %35
    sol fad mi
  } re8\noBeam r
  \grace mi8 \tuplet 3/2 {
    do16 si do la'[sol fad] \grace fad8 mi16 re do
    si la si \grace la'8 sol16[fad mi] \grace mi8 re16 do si

    %38
    \grace re8 do16 si do la' [sol fad] mi re do
    \grace do8 si16 la si \grace la'8 sol16[fad mi] re do si
  }
  si8-+ la r

  %41
  \tuplet 3/2 {
    re,16 fa la \grace re8 do16[si la] \grace si'8 la16 sol la\mbreak
    re,, sol si \grace mi8 re16[do re] \grace do'8 si16 la si
    re,, fa la \grace re8 do16[si do] \grace si'8 la16 sol la

    %44
    re,, sol si \grace mi8 re16[do re] \grace do'8 si16 la si
    do si la si[la sol] la sol fad
    sol fad mi fad[mi re] mi re do

    %47
    re do si do[si la] si la sol
    la sol fad sol[fad mi]
  } re8\noBeam
  do'16 la fad' do la' do

  %50
  \tuplet 3/2 {
    si re do si[la sol] fa! mi red
    mi sol fad mi[re do] si la sol
    fad mi re la'[sol fad]
  } do'8\noBeam

  %53
  \tuplet 3/2 { si16 la sol } \grace si8 la4_+
  sol4 r8
  R4.*5

  %60
  r4 re'8\solo
  \grace {mi16[fa]} sol8 fad mi
  mi-+ re si\mbreak

  %63
  do16(la fad re) re' do
  si(sol' re si) sol si
  do16(la fad re) re' do

  %66
  si(sol' re si) sol8\noBeam
  la'16(fad re la) fad?8\noBeam
  si'16(sol re si) sol8\noBeam

  %69
  do'16(si la sol fad mi)
  mi8-+ red r\mbreak
  si'16 sold, la do' si sold,

  %72
  la8 do'(si)
  la16 fad, sol si' la fad,
  sol8 si'(la)

  %75
  sol16 mi, fad la' sol mi,
  fad8 la'	(sol)
  fad16 red, mi sol' fad red,

  %78
  mi8 sol'(fad?)
  mi16(fad sol la si do)\mbreak
  red,(si') mi,(si') fad (si)

  %81
  sol(si) fad(si) mi,(si')
  red,(si') mi,(si') fad (si)
  sol(si) fad(si) mi,(si')

  %84
  red, do si8 r
  do4.
  red

  %87
  mi16 do' si8 la
  \tuplet 3/2 { sol16 fad mi } fad4-+
  mi4 r8

  %90
  R4.*6
  r4 si8\solo\mbreak
  mi re16(do si la)

  %98
  sol fad? mi8 si'
  mi16(si) sol'(mi) si'(sol)
  sol8-+ fad re

  %101
  sol fad16 mi re do
  si la sol8 re'
  sol16(re) si'(sol) re'(si)

  %104
  si8 la r
  re re re
  mi,16 re'(do si) do8\mbreak

  %107
  mi,16 do'(si do) mi, do'
  re, do'(si la) si8
  re,16 si'(la si) re, si'

  %110
  do, si'(la sol) la8
  do,16 la'(sol la) do, la'
  si, la'(sol fad) sol mi

  %113
  fa!8 fa \tuplet 3/2 { la16[sol fa] }
  mi8 mi \tuplet 3/2 { sol16[fa mi] }\mbreak
  la(sol fa mi re do)

  %116
  si (re fa re fa re)
  do(mi sol mi sol mi)
  si(re fa re fa re)

  %119
  do(mi sol mi sol mi)
  la8 \tuplet 3/2 {
    la16 si do si do re
    do si la
  } sol8\noBeam r\mbreak

  %122
  la \tuplet 3/2 {
    la16 si do si do re
    do si la
  } sol8\noBeam r
  \grace {re16[mi]} fa4.

  %125
  \tuplet 3/2 { mi16 re do fa[mi re] sol fa mi }
  la8 si,(do)
  la16 re \grace do8 si4-+

  %128
  do4 r8
  \grace {re16[mi]} fa4.
  \tuplet 3/2 { mi16 re do fa[mi re] sol fa mi }

  %131
  la8 si,(do)
  la16 re \grace do8 si4\parenthesize -+
  do4 r8

  %134
  R4.*26
  R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIIvlIn =  \relative do'' {

  sol'8
  \grace {la16[si]} do8 si la
  la-+ sol sol,
  la16 fa' mi8 re

  %4
  mi16 fa sol8 sol,
  la16 fa' mi8 re
  mi16 re do8 r

  %7
  mi mi16 sol fad la
  \tuplet 3/2 { sol fad mi } re8\noBeam r
  mi\p mi16 sol fad la

  %10
  \tuplet 3/2 { sol fad mi } re8\noBeam r
  fa!16\f(re si sol) sol,8\noBeam
  mi''16(do sol mi) do8\noBeam\mbreak

  %13
  fa'16\p (re si sol) sol,8\noBeam
  mi''16(do sol mi) do8\noBeam
  la'8\f la16 do si re

  %16
  \tuplet 3/2 { do si la } sol8[fa']
  mi16 fa \grace la8 sol4-+
  mi16 (la fad sol fa re)

  %19
  mi fa \grace la8 sol4-+
  mi16 \(la fad(sol) fa(re)\)
  mi\((si) do(fad,) sol fa'!\)

  %22
  \tuplet 3/2 { mi re do } mi8[re]\mbreak
  do re16 mi fa sol
  la4.-+

  %25
  sol8 si, (do)
  \tuplet 3/2 { la16 sol fa } mi8[re]
  do4 mi8\p %%% ripresa

  %28
  la sol fa
  fa mi mi
  fa16 re' do8 si

  %31
  do16 re mi8 mi,
  fa16 re' do8 si
  do4 r8

  %34
  R4.*6
  re,8 fad la
  do4 r8

  %42
  si4 r8
  do4 r8
  si4 r8

  %45
  R4.*9\mbreak
  r8 r re\f
  \grace {mi16[fa]} sol8 fad mi

  %56
  mi-+ re re,
  mi16 do' si8 la
  si16 do re8 re,

  %59
  mi16 do' si8 la
  si16 la sol8 si\p
  mi re do

  %62
  do si sol
  mi fad fad
  sol4 sol8

  %65
  mi fad fad
  sol4 si8
  la4 la8

  %68
  si4 si8
  do4 la8
  si4 r8

  %71
  R4.*18
  mi16\f do' lad(si) la(fad)
  sol la si4-+

  %91
  mi,16 do' lad(si) la(fad)
  sol la si4-+
  mi,16 do' lad(si) la(fad)

  %94
  sol(red) mi(lad,) si la'!
  \tuplet 3/2 { sol fad mi } sol8[fad]
  mi4 r8

  %97
  R4.*7
  r8 re\p do
  si la sol

  %106
  do r do16 si\mbreak
  la8 sol fad
  si r si16 la

  %109
  sol8 fad mi
  la r la16 sol
  fad8 mi re

  %112
  sol4 si8
  do do do
  si si si

  %115
  la do la
  do re re
  r mi mi

  %118
  r re re
  r mi mi
  fa4 r8

  %121
  R4.*7
  do,8\parenthesize \p  mi do
  re si sol

  %130
  do re mi
  fa4 mi8
  fa sol sol,

  %133
  do4 sol''8
  \grace {la16[si]} do8 si la
  la-+ sol sol,

  %136
  la16 fa' mi8 re
  mi16 fa sol8 sol,
  la16 fa' mi8 re

  %139
  mi16 re do8 r
  mi mi16 sol fad la
  \tuplet 3/2 { sol fad mi } re8\noBeam r

  %142
  mi\p mi16 sol fad la
  \tuplet 3/2 { sol fad mi } re8\noBeam r
  fa!16\f(re si sol) sol,8\noBeam

  %145
  mi''16(do sol mi) do8\noBeam\mbreak
  fa'16\p (re si sol) sol,8\noBeam
  mi''16(do sol mi) do8\noBeam

  %148
  la'8\f la16 do si re
  \tuplet 3/2 { do si la } sol8[fa']
  mi16 fa \grace la8 sol4-+

  %151
  mi16 (la fad sol fa re)
  mi fa \grace la8 sol4-+
  mi16 \(la fad(sol) fa(re)\)

  %154
  mi\((si) do(fad,) sol fa'!\)
  \tuplet 3/2 { mi re do } mi8[re]\mbreak
  do re16 mi fa sol

  %157
  la4.-+
  sol8 si, do
  \tuplet 3/2 { la16 sol fa } mi8[re]

  %160
  do4\fermata r8

}

IIIvlIIn = \relative do'' {

  mi8
  \grace {fa16[sol]} la8 sol fa
  fa-+ mi mi,
  fa16 re' do8 si

  %4
  do16 re mi8 mi,
  fa16 re' do8 si
  do4 r8

  %7
  do do do
  si4 r8
  do8\p do do

  %10
  si4 r8
  re16\f \parentSlur (si) re \parentSlur (si) re \parentSlur (si)
  do \parentSlur (sol) do \parentSlur (sol) do \parentSlur (sol)

  %13
  re'\p \parentSlur (si) re \parentSlur (si) re \parentSlur (si)\mbreak
  do \parentSlur (sol) do \parentSlur (sol) do \parentSlur (sol)
  do,8\f fa fa

  %16
  mi re si'
  do16 re mi4-+
  do8 la si

  %19
  do16 re mi4-+
  do8 la si
  sol la si

  %22
  do do si
  do si16 do re mi
  fa4.-+

  %25
  mi8 fa,(mi)
  \tuplet 3/2 { fa16 mi re } do8[si]
  do4 do8\p %ripresa

  %28
  do do do\mbreak
  do do do
  fa sol sol,

  %31
  do do do
  fa sol sol,
  do4 r8

  %34
  R4.*6
  re8 fad la
  fad4 r8

  %42
  sol4 r8
  fad4 r8
  sol4 r8

  %45
  R4.*9
  r8 r si\f
  \grace {do16[re]} mi8 re do

  %56
  do si si,
  do16 la' sol8 fad
  sol16 la si8 si,\mbreak

  %59
  do16 la' sol8 fad
  sol4 sol,8\p
  sol sol sol

  %62
  sol sol sol
  la re re
  sol,4 sol8

  %65
  la re re
  sol,4 sol'8
  fad4 re8

  %68
  sol4 mi8
  la4 do8
  si4 r8

  %71
  R4.*18
  mi8\f dod red
  mi16 fad sol4-+

  %91
  mi8 dod red\mbreak
  mi16 fad sol4-+
  mi8 dod red

  %94
  si dod red
  mi mi red
  mi4 r8

  %97
  R4.*7
  r8 re?\p do
  si la sol

  %106
  do r do16 si
  la8 sol fad
  si r si16 la

  %109
  sol8 fad mi
  la r la16 sol
  fad8 mi re\mbreak

  %112
  sol4 sol8
  la la la
  sol sol sol

  %115
  fa la fa
  sol si si
  r do do

  %118
  r si si
  r do do
  do4 r8

  %121
  R4.*7
  do,8\p mi do
  re si sol

  %130
  do re mi
  fa4 mi8
  fa sol sol,

  %133
  do4 sol''8
  \grace {fa16[sol]} la8 sol fa
  fa-+ mi mi,

  %136
  fa16 re' do8 si
  do16 re mi8 mi,
  fa16 re' do8 si

  %139
  do4 r8
  do do do
  si4 r8

  %142
  do8\p do do
  si4 r8
  re16\f si re si re si

  %145
  do sol do sol do sol
  re'\p si re si re si\mbreak
  do sol do sol do sol

  %148
  do,8\f fa fa
  mi re si'
  do16 re mi4-+

  %151
  do8 la si
  do16 re mi4-+
  do8 la si

  %154
  sol la si
  do do si
  do si16 do re mi

  %157
  fa4.-+
  mi8 fa,(mi)
  \tuplet 3/2 { fa16 mi re } do8[si]

  %160
  do4\fermata r8

}

IIIvlan =  \relative do' {

  do8
  do do fa~
  fa do do
  do sol' sol~
  
  %4
  sol do, do
  do sol' sol~
  sol4 r8
  
  %7
  do,8 mi re
  re4 r8
  do mi re
  
  %10
  re4 r8
  sol16\parenthesize \f (si) sol(si) sol(si)
  sol(do) sol(do) sol(do)
  
  %13
  sol16\parenthesize \p (si) sol(si) sol(si)
  sol(do) sol(do) sol(do)
  la8\parenthesize \f  la sol
  
  %16
  sol sol sol\mbreak
  sol4 do,16 re
  mi8 re re
  
  %19
  do4 do16 re
  mi8 re re
  do do re
  
  %22
  mi sol sol
  sol4 r8
  r la16 si do re
  
  %25
  sol,8 sol do~
  do sol sol
  mi4 do8\p %%%ripresa
  
  %28
  do do do
  do do do
  fa sol sol,
  
  %31
  do do do
  fa sol sol,
  do4 r8
  
  %34
  R4.*6
  re8 fad la
  la4 r8\mbreak
  
  %42
  sol4 r8
  la4 r8
  sol4 r8
  
  %45
  R4.*9
  r8 r sol,\f
  sol sol do~
  
  %56
  do sol sol
  sol re' re ~
  re sol, sol
  
  %59
  sol re' re
  re4 sol,8\p
  sol sol sol
  
  %62
  sol sol sol
  la re re,
  sol4 sol8
  
  %65
  la re re,
  sol4 sol'8
  fad4 re8
  
  %68
  sol4 mi8
  la4 do8
  si4 r8
  
  %71
  R4.*18
  sol8\f fad fad\mbreak
  mi4 mi16 fad
  
  %91
  sol8 fad fad
  mi4 mi16 fad
  sol8 fad fad
  
  %94
  mi mi fad
  sol si si
  si4 r8
  
  %97
  R4.*7
  r8 re\parenthesize \p do
  si la sol
  
  %106
  do r do16 si
  la8 sol fad
  si8 r si16 la
  
  %109
  sol8 fad mi
  la r la16 sol
  fad8 mi re
  
  %112
  sol4 sol8
  la la la\mbreak
  sol sol sol
  
  %115
  fa la fa
  sol sol sol
  r sol sol
  
  %118
  r sol sol
  r sol do,
  fa4 r8
  
  %121
  R4.*7
  do8\parenthesize \p  mi do
  re si sol
  
  %130
  do re mi
  fa4 mi8
  fa sol sol,
  
  %133
  do4 do8
  do do fa~
  fa do do
  
  %136
  do sol' sol~
  sol do, do
  do sol' sol~
  
  %139
  sol4 r8
  do,8 mi re
  re4 r8
  
  %142
  do mi re
  re4 r8
  sol16\parenthesize \f (si) sol(si) sol(si)
  
  %145
  sol(do) sol(do) sol(do)
  sol16\parenthesize \p (si) sol(si) sol(si)
  sol(do) sol(do) sol(do)
  
  %148
  la8\parenthesize \f  la sol
  sol sol sol\mbreak
  sol4 do,16 re
  
  %151
  mi8 re re
  do4 do16 re
  mi8 re re
  
  %154
  do do re
  mi sol sol
  sol4 r8
  
  %157
  r la16 si do re
  sol,8 sol do~
  do sol sol
  
  %160
  mi4\fermata r8

}

IIIbcn = \relative do {

  do8
  do do do
  do do do
  fa sol sol,

  %4
  do do do
  fa sol sol,
  do mi sol

  %7
  do, la re
  sol, si sol
  do la re

  %10
  sol, si re
  sol sol sol
  sol sol sol

  %13
  sol sol sol\mbreak
  sol sol sol
  fa re sol

  %16
  do, si sol
  do do'16 sol (mi sol)
  do,8 re sol,

  %19
  do do'16 sol (mi sol)
  do,8 re sol,
  do la sol

  %22
  do sol' sol,
  do4 r8
  r fa16 sol la si

  %25
  do8 sol la
  fa sol sol,\mbreak
  do4 r8 %%% ripresa  OOKK

  %28
  R4.*5
  do8 mi sol
  do la re

  %35
  sol, si sol
  la re, fad
  sol4 sol8

  %38
  la re, fad
  sol4 sol,8
  re' re, r

  %41
  re'4 r8
  re4 r8
  re4 r8\mbreak

  %44
  re4 sol8
  la sol fad
  mi re do

  %47
  si la sol
  re'4 r8
  la' re, fad

  %50
  sol4 si,8
  do4 dod8
  re fad re

  %53
  sol do, re
  sol, sol' sol,
  sol sol sol

  %56
  sol sol sol\mbreak
  do re re,
  sol sol sol

  %59
  do re re,
  sol4 r8
  R4.*9

  %70
  r8 si' la
  sold4 mi8
  la, la'  sol

  %73
  fad4 re8
  sol, sol' fad
  mi4 do8

  %76
  fad, fad'? mi
  red4 si8
  mi, mi' red?

  %79
  do4.\mbreak
  si8 dod red
  mi re! do!

  %82
  si dod red
  mi re! do!
  si si' si~

  %85
  si la16 sol la8~
  la16 do(si la sol fad)
  sol8 red si

  %88
  mi la, si
  mi fad? si,
  mi mi'16 si(sol si)

  %91
  mi,8 fad? si,
  mi mi'16 si(sol si)
  mi,8 fad? si,

  %94
  mi do si
  mi si' si,
  mi4 r8

  %97
  mi la, si
  mi4 r8
  mi mi mi

  %100
  si' si, r
  mi' do, re
  sol,4 r8

  %103
  sol' sol sol
  re' re, r
  R4.*11

  %116
  sol4 r8
  sol4 r8
  sol4 r8

  %119
  sol4 r8
  fa re sol
  do, mi do

  %122
  fa re sol
  do, mi do
  re si sol

  %125
  do re mi
  fa4 mi8
  fa sol sol,

  %128
  do4 r8
  R4.*4
  r8 r do

  %134
  do do do
  do do do
  fa sol sol,

  %137
  do do do
  fa sol sol,
  do mi sol

  %140
  do, la re
  sol, si sol
  do la re

  %143
  sol, si re
  sol sol sol
  sol sol sol

  %146
  sol sol sol\mbreak
  sol sol sol
  fa re sol

  %149
  do, si sol
  do do'16 sol (mi sol)
  do,8 re sol,

  %152
  do do'16 sol (mi sol)
  do,8 re sol,
  do la sol

  %155
  do sol' sol,
  do4 r8
  r fa16 sol la si

  %158
  do8 sol la
  fa sol sol,\mbreak
  do4\fermata r8

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s8
  <6 4> <5 3> <6 4>
  <6 4> <5 3> s
  <6 5> <6 4> <5 3>
  s4.
  <6 5>8 <6 4> <5 3>
  s <6> s
  s s <6 _+>
  s <6> s
  s s <7 _+>
  s <_+> s
  <7! 5> s s
  <6 4>4.
  <7 5>
  <6 4>
  s4 <7>8
  s <6> <7>
  s4.
  s8 <7 _+> <7!>
  s4.
  s8 <7 _+> <7>
  s <6> s
  s <6 4> <5 3>
  s4.*2
  s8 <7> s
  <6 5> <6 4> <5 3>  %% fine ripresa
  s4.*6
  s8 <6> s
  s s <_+>
  s <6> s
  s <_+> <7 5>
  s4.
  s8 <_+> <7 5>
  s4.*2
  <7 _+>4.
  <6 4>
  <7 _+>
  <6 4>
  s4.*3
  <_+>4.
  s8 <_+> s
  s4 <6 5!>8
  s4 <7>8
  <_+> s <7>
  s4.*2
  <6 4>8 <5 3> <6 4>
  <6 4> <5 3> s
  <6 5> <6 4> <5 3+>
  s4.
  <6 5>8 <6 4> <5 3+>
  s4.*10
  s8 <_+> s
  <6>4 <_+>8
  s4.
  <6>4 <_+>8
  s4.
  <6>
  s
  <6>
  s 
  <6>
  s8 <6> <6>
  s <6> <6>
  <_+> <6> <7>
  s <6> <6>
  <_+>4.
  s8 <6> s
  <6 4 2>4.
  <6>8 <6> <7_+>
  s <6 5> <_+>
  s <7 _+> <7 _+>
  s4.
  s8 <7 _+> <7! _+>
  s4.
  s8 <7 _+> <7! _+>
  s <6+> <_+>
  s <6 4> <5 3+>
  s4.
  s8 <6+ 5> <_+>
  s4.*2
  <6 4>8 <5+ 3> s
  s <6 5> <_+>
  s4.*2
  <5>4.
  s4.*12
  <6 4>4.
  <5 3>
  <6 4>
  s8 <7> <7>
  s4.
  s8 <7> <7>
  s <6> s
  s <6 5> <7>
  s <6> <6>
  <5 3> <6 4 2> <6>
  <6 5> <6 4> <5 3>
  s4.*6
  <6 4>8 <5 3> <6 4>
  <6 4> <5 3> s
  <6 5> <6 4> <5 3>
  s4.
  <6 5>8 <6 4> <5 3>
  s <6> s
  s s <6 _+>
  s <6> s
  s s <7 _+>
  s <_+> s
  <7! 5> s s
  <6 4>4.
  <7 5>
  <6 4>
  s4 <7>8
  s <6> <7>
  s4.
  s8 <7 _+> <7!>
  s4.
  s8 <7 _+> <7>
  s <6> s
  s <6 4> <5 3>
  s4.*2
  s8 <7> s
  <6 5> <6 4> <5 3>
  
  



}

forma = {

  \key do\major
  \time 3/8
  \tempo 4. = 60
  \partial 8 s8
  s4.*160
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

\header {
    title = \markup\smaller {"Concerto per Traversiere [Op. VIII/3] "}
    composer = \markup \center-column{"G. Chinzer (1698 - ca. 1750)"}
		}

\markup \huge {"[1.] Allegro"}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   } <<

      \new Staff  <<
         \set Staff.instrumentName = \markup  \center-column{"Flauto""Traversiero"}
            \set Staff.midiInstrument = #"flute"
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
            \set Staff.midiInstrument = #"flute"
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
            \set Staff.midiInstrument = #"flute"
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
